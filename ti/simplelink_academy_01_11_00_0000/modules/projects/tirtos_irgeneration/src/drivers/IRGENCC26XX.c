/**************************************************************************************************
  Filename:       IRGENCC26XX.c
  Revised:        $Date: 2015-03-17 10:38:51 -0700 (Tue, 17 Mar 2015) $
  Revision:       $Revision: 1688 $

  Description:    This file contains the driver implementation for generating
                  IR signals.


  Copyright 2014 Texas Instruments Incorporated. All rights reserved.

  IMPORTANT: Your use of this Software is limited to those specific rights
  granted under the terms of a software license agreement between the user
  who downloaded the software, his/her employer (which must be your employer)
  and Texas Instruments Incorporated (the "License").  You may not use this
  Software unless you agree to abide by the terms of the License. The License
  limits your use, and you acknowledge, that the Software may not be modified,
  copied or distributed unless embedded on a Texas Instruments microcontroller
  or used solely and exclusively in conjunction with a Texas Instruments radio
  frequency transceiver, which is integrated into your product.  Other than for
  the foregoing purpose, you may not use, reproduce, copy, prepare derivative
  works of, modify, distribute, perform, display or sell this Software and/or
  its documentation for any purpose.

  YOU FURTHER ACKNOWLEDGE AND AGREE THAT THE SOFTWARE AND DOCUMENTATION ARE
  PROVIDED “AS IS” WITHOUT WARRANTY OF ANY KIND, EITHER EXPRESS OR IMPLIED,
  INCLUDING WITHOUT LIMITATION, ANY WARRANTY OF MERCHANTABILITY, TITLE,
  NON-INFRINGEMENT AND FITNESS FOR A PARTICULAR PURPOSE. IN NO EVENT SHALL
  TEXAS INSTRUMENTS OR ITS LICENSORS BE LIABLE OR OBLIGATED UNDER CONTRACT,
  NEGLIGENCE, STRICT LIABILITY, CONTRIBUTION, BREACH OF WARRANTY, OR OTHER
  LEGAL EQUITABLE THEORY ANY DIRECT OR INDIRECT DAMAGES OR EXPENSES
  INCLUDING BUT NOT LIMITED TO ANY INCIDENTAL, SPECIAL, INDIRECT, PUNITIVE
  OR CONSEQUENTIAL DAMAGES, LOST PROFITS OR LOST DATA, COST OF PROCUREMENT
  OF SUBSTITUTE GOODS, TECHNOLOGY, SERVICES, OR ANY CLAIMS BY THIRD PARTIES
  (INCLUDING BUT NOT LIMITED TO ANY DEFENSE THEREOF), OR OTHER SIMILAR COSTS.

  Should you have any questions regarding your right to use this Software,
  contact Texas Instruments Incorporated at www.TI.com.
**************************************************************************************************/
#include <xdc/runtime/Log.h>
#include <ti/sysbios/family/arm/m3/Hwi.h>

#include <driverlib/event.h>
#include <driverlib/sys_ctrl.h>
#include <driverlib/udma.h>

#include <ti/drivers/dma/UDMACC26XX.h>
#include <ti/drivers/pin/PINCC26XX.h>
#include "IRGENCC26XX.h"
#include "Board.h"
//#include "PIN.h"

/* Allocate Space in the DMA Control Table for channels used by this driver. */
ALLOCATE_CONTROL_TABLE_ENTRY(dmaTableEntryTimer0_A, UDMA_CHAN_TIMER0_A);
ALLOCATE_CONTROL_TABLE_ENTRY(dmaTableEntryTimer0_B, UDMA_CHAN_TIMER0_B);
ALLOCATE_CONTROL_TABLE_ENTRY(dmaTableEntryTimer1_A, UDMA_CHAN_TIMER1_A);
ALLOCATE_CONTROL_TABLE_ENTRY(dmaTableEntrySwEvt0  , UDMA_CHAN_SW_EVT0 );
ALLOCATE_CONTROL_TABLE_ENTRY(dmaTableEntrySwEvt1  , UDMA_CHAN_SW_EVT1 );
ALLOCATE_CONTROL_TABLE_ENTRY(dmaTableEntrySwEvt2  , UDMA_CHAN_SW_EVT2 );
ALLOCATE_CONTROL_TABLE_ENTRY(dmaTableEntrySwEvt3  , UDMA_CHAN_SW_EVT3 );

//#define DYNAMIC_MEMORY

#ifdef DYNAMIC_MEMORY
#include <ICall.h>
#endif
/*********************************************************************
 * LOCAL FUNCTIONS
 */
Void IRGENCC26XX_done();
Void uDMAChannelTransferSetup(uint32_t ui32Base, volatile tDMAControlTable * controlTableEntry,
                       uint32_t ui32Mode, void *pvSrcAddr, void *pvDstAddr, uint32_t ui32ControlWord,
                       uint32_t ui32TransferSize);
Void prepareBufferFromMarkSpaceToLoadMatch(IRGENCC26XX_Object *object);

static IRGENCC26XX_Handle irgenHandle = NULL;
static uint8_t pendingIRsignal = FALSE;
#ifdef DYNAMIC_MEMORY
static uint16_t *loadBuffer, *matchBuffer;
static uint8_t *loadPreScalerBuffer, *matchPreScalerBuffer;
#else
static uint16_t loadBuffer[MATCH_LOAD_BUFFERS_SIZE], matchBuffer[MATCH_LOAD_BUFFERS_SIZE];
static uint8_t loadPreScalerBuffer[MATCH_LOAD_BUFFERS_SIZE], matchPreScalerBuffer[MATCH_LOAD_BUFFERS_SIZE];
#endif //DYNAMIC_MEMORY
// lastPeriod: Value to place in LOAD register for the repeat timer. We must not
// use this value for the last period in the GPT0, because this would cause a glitch.
// Hence, we only do it for the shadowtimer
static uint32_t lastPeriod = 0;

/* IR Led pin table */
static PIN_Config irPinTable[] = {
    Board_LED_IR              | PIN_GPIO_OUTPUT_EN | PIN_GPIO_LOW | PIN_PUSHPULL | PIN_DRVSTR_MAX,
#ifdef IRGENCC26XX_DEBUG
    Board_IR_OUTPUT_DEBUG     | PIN_GPIO_OUTPUT_EN | PIN_GPIO_LOW | PIN_PUSHPULL | PIN_DRVSTR_MAX,
    Board_IR_DATA_CH_DEBUG    | PIN_GPIO_OUTPUT_EN | PIN_GPIO_LOW | PIN_PUSHPULL | PIN_DRVSTR_MAX,
    Board_IR_SHADOW_CH_DEBUG  | PIN_GPIO_OUTPUT_EN | PIN_GPIO_LOW | PIN_PUSHPULL | PIN_DRVSTR_MAX,
#endif
    PIN_TERMINATE                                                                   /* Terminate list    */
};

/*
 *  ======== IRGENCC26XX_init ========
 *  @pre    Function assumes that it is called *once* on startup before BIOS init
 */
Void IRGENCC26XX_init(IRGENCC26XX_Handle handle)
{
  IRGENCC26XX_Object       *object;
  Hwi_Params               irhwiParams;
  unsigned int             key;

  /* Set local reference to return to callers */
  irgenHandle = handle;
  /* Get object for this handle */
  object = handle->object;
  /* Mark the objects as available */
  object->isOpen = false;

  /* Initialize the UDMA driver */
  UDMACC26XX_init(object->udmaHandle);

  object->pinHandle = PIN_open(&object->pinState, irPinTable);

  //udmahandle = UDMACC26XX_open();
  key = Hwi_disable();

  /* Setup the ISR for the DMA Done interrupt. */
  Hwi_Params_init(&irhwiParams);
  irhwiParams.priority = ~0;
  Hwi_construct(&(object->hwi),INT_GPT1A, (Hwi_FuncPtr) IRGENCC26XX_done, &irhwiParams, NULL);

  Hwi_restore(key);
}

Void IRGENCC26XX_kickNextSignal()
{
  if (pendingIRsignal == TRUE)
  {
    /* Kick off next signal ASAP */
    IRGENCC26XX_startIrGen(irgenHandle);
    pendingIRsignal = FALSE;
  }
}

Void IRGENCC26XX_prepareNextSignal(IRGENCC26XX_SubParams *irParams)
{
  IRGENCC26XX_Object       *object;
  if (irgenHandle)
  {
    /* Get object for this handle */
    object = irgenHandle->object;
    /* Prepare carrier */
    object->carrierPeriod24MHz  = irParams->carrierPeriod24MHz;

    /* Prepare buffer from Mark-Space to Load-Match */
    object->bufferSize  = irParams->bufferSize;
    object->markBuffer  = irParams->markBuffer;
    object->spaceBuffer = irParams->spaceBuffer;

    // Only if we have a signal
    if (object->bufferSize)
    {
      prepareBufferFromMarkSpaceToLoadMatch(object);
      pendingIRsignal = TRUE;
    }
  }
}

IRGENCC26XX_Handle IRGENCC26XX_open(IRGENCC26XX_Params *params)
{
  IRGENCC26XX_Handle         handle;
  IRGENCC26XX_Object         *object;
  //IRGENCC26XX_HWAttrs const  *hwAttrs;
  unsigned int                key;

  /* Get handle for this driver instance */
  handle = irgenHandle;
  /* Get the pointer to the object and hwAttrs */
  object = handle->object;
  //hwAttrs = handle->hwAttrs;

  key = Hwi_disable();

  /* Check if the IRGEN is open already with the base addr. */
  if (object->isOpen == true) {
    Hwi_restore(key);
    Log_warning0("IRGEN: already in use.");
    return (NULL);
  }

#ifdef DYNAMIC_MEMORY
  loadBuffer = (uint16_t *)ICall_malloc(MATCH_LOAD_BUFFERS_SIZE * sizeof(uint16_t));
  matchBuffer = (uint16_t *)ICall_malloc(MATCH_LOAD_BUFFERS_SIZE * sizeof(uint16_t));
  loadPreScalerBuffer = (uint8_t *)ICall_malloc(MATCH_LOAD_BUFFERS_SIZE * sizeof(uint8_t));
  matchPreScalerBuffer = (uint8_t *)ICall_malloc(MATCH_LOAD_BUFFERS_SIZE * sizeof(uint8_t));
  if ( (loadBuffer == NULL) || (matchBuffer == NULL) ||
       (loadPreScalerBuffer == NULL) || (matchPreScalerBuffer == NULL) )
  {
    Hwi_restore(key);

    Log_warning0("IRGEN: insufficient resources.");

    return (NULL);
  }
#endif //DYNAMIC_MEMORY

  /* Mark the handle as being used */
  object->isOpen = true;
  Hwi_restore(key);

  object->callbackFxn           = params->callbackFxn;
  object->carrierPeriod24MHz    = params->carrierPeriod24MHz;
  object->carrierDuty           = params->carrierDuty;
  object->timeoutOffset         = params->timeoutOffset;
  object->markBuffer            = params->markBuffer;
  object->spaceBuffer           = params->spaceBuffer;
  object->bufferSize            = params->bufferSize;

  /* Prepare buffer from Mark-Space to Load-Match */
  prepareBufferFromMarkSpaceToLoadMatch(object);

  /* Setup the Carrier Timer */
  //Turn on the GPTx module
  Power_setConstraint(PowerCC26XX_SB_DISALLOW);
  Power_setConstraint(PowerCC26XX_IDLE_PD_DISALLOW);
  Power_setDependency(PowerCC26XX_PERIPH_GPT0);
  Power_setDependency(PowerCC26XX_PERIPH_GPT1);

/* Set clock division to GPT --> want 8MHz, but can at best get 24MHz which is
 * the closest integer multiple of 8.
 * If the divider is changed from PRCM_CLOCK_DIV_4, GPT_FREQ has to be manually
 * updated to reflect the new GPT Domain Frequency. Right now 48MHz/2 = 24MHz
 */
  PRCMGPTimerClockDivisionSet(PRCM_CLOCK_DIV_2);
  PRCMLoadSet();

  /* ------------------------Setup Carrier Timer ----------------------------- */

  EventRegister(EVENT_O_GPT0ACAPTSEL, EVENT_GPT0ACAPTSEL_EV_PORT_EVENT0);

  /* Set the timer to periodic mode and PWM mode. */
  TimerConfigure(GPT0_BASE, TIMER_CFG_SPLIT_PAIR | TIMER_CFG_A_PWM | TIMER_CFG_B_PWM );
  /* Set the PWM signal output to not inverted. */
  TimerLevelControl (GPT0_BASE, TIMER_A, FALSE);

  /* This ANDs channel A with channel B, the output AND'ed signal is on Channel A */
  HWREG(GPT0_BASE + GPT_O_ANDCCP) |= GPT_ANDCCP_CCP_AND_EN;

  /* ------------------------Setup IR Data Timer (modulation) --------------- */

#ifdef IRGENCC26XX_DEBUG
  EventRegister(EVENT_O_GPT0BCAPTSEL, EVENT_GPT0BCAPTSEL_EV_PORT_EVENT1 );
#endif

  /* Set the PWM signal output to not inverted */
  TimerLevelControl (GPT0_BASE, TIMER_B, FALSE);
  /* Set the timer's capture mode to edge count mode. */
  TimerEventControl (GPT0_BASE, TIMER_B, TIMER_EVENT_NEG_EDGE);
  /* Update TBMATCHR and TBPR, if used, on the next time-out. Basically latches
   * the new values for TBMATCHR on the next period.
   */
  /* Update the TAR register with the value in the TAILR register on the next
   * timeout. If the prescaler is used, update the TAPS register with the value
   * in the TAPR register on the next timeout.
   */
  HWREG(GPT0_BASE + GPT_O_TBMR) |= (GPT_TBMR_TBPLO | GPT_TBMR_TBMRSU_TOUPDATE |
                                    GPT_TBMR_TBILD_TOUPDATE | GPT_TBMR_TBCDIR);

#ifdef IRGENCC26XX_DEBUG
  /* Stall the timers when the CPU is paused while debugging. */
  TimerStallControl(GPT0_BASE, TIMER_BOTH, TRUE);
  TimerStallControl(GPT1_BASE, TIMER_A, TRUE);
#endif
  /* Set dependency for UDMA. */
  object->udmaHandle = UDMACC26XX_open();

  return (handle);
}

Void prepareBufferFromMarkSpaceToLoadMatch(IRGENCC26XX_Object *object)
{
  int i;
  uint32_t mark32, space32;
  for (i = 0; i < object->bufferSize; i++)
  {
    mark32 = IRGEN_MOD_TICKS_FROM_250kHz(object->markBuffer[i]);
    space32 = IRGEN_MOD_TICKS_FROM_250kHz(object->spaceBuffer[i]);
    // Perform sanity check on the last period. We require that this takes
    // at least 4ms so that we can end correctly. This is not a strict requirement
    // as most, if not all, IR signals have a repeat period of 10s of ms.
    if ((space32 < (4 * 24000)) && (i == (object->bufferSize - 1)))
    {
      space32 = 4 * 24000;
    }
    /* Space buffer must add Mark because we use it for period */
    loadBuffer[i]  = (uint16_t)(space32 + mark32);
    loadPreScalerBuffer[i] = (uint8_t)(( space32 + mark32 ) >> 16);

    matchBuffer[i] = (uint16_t)(space32);
    matchPreScalerBuffer[i] = (uint8_t)(space32 >> 16);
  }
  // To allow a single bit without severe modifications we add a 4 ms empty
  // bit which would be seen as adding 4ms to the repeat time.
  if (i == 1)
  {
    space32 = mark32 = 4 * 24000;
    loadBuffer[i]  = (uint16_t)(space32 + mark32);
    loadPreScalerBuffer[i] = (uint8_t)(( space32 + mark32 ) >> 16);

    matchBuffer[i] = loadBuffer[i];
    matchPreScalerBuffer[i] = loadPreScalerBuffer[i];
    i++;
    object->bufferSize++;
  }
  // Place last values in lastPeriod, and set forever values
  // in the buffer. This prevents glitches
  lastPeriod = ((loadBuffer[i-1] & 0x0000FFFF) | ((loadPreScalerBuffer[i-1] << 16) & 0x00FF0000));
  loadBuffer[i-1]  = 0xFFFF;
  matchBuffer[i-1] = 0xFFFF - (mark32 & 0x00FFFF);
  loadPreScalerBuffer[i-1] = 0xFF;
  matchPreScalerBuffer[i-1] = 0xFF - ((mark32 & 0xFF0000) >> 16);
}

Void  IRGENCC26XX_close(IRGENCC26XX_Handle handle)
{
  unsigned int              key;
  IRGENCC26XX_Object        *object;
  //IRGENCC26XX_HWAttrs const *hwAttrs;

  /* Get the pointer to the object and hwAttr*/
  object = handle->object;
  //hwAttrs = handle->hwAttrs;

  /* Release UDMA dependency */
  UDMACC26XX_close(object->udmaHandle);
  /* Set the GPT Clock Domain back to Divider = 1*/
  PRCMGPTimerClockDivisionSet(PRCM_CLOCK_DIV_1);
  PRCMLoadSet();

#ifdef DYNAMIC_MEMORY
  ICall_free(loadBuffer);
  loadBuffer = NULL;
  ICall_free(matchBuffer);
  matchBuffer = NULL;
  ICall_free(loadPreScalerBuffer);
  loadPreScalerBuffer = NULL;
  ICall_free(matchPreScalerBuffer);
  matchPreScalerBuffer = NULL;
#endif //DYNAMIC_MEMORY

  /* Mark the module as available */
  key = Hwi_disable();
  object->isOpen = false;
  Hwi_restore(key);

//  Log_print0(Diags_USER1, "IRGEN: closed");

  /* Release power dependency for the GPT Timer module. */
  Power_releaseDependency(PowerCC26XX_PERIPH_GPT0);
  Power_releaseDependency(PowerCC26XX_PERIPH_GPT1);
  Power_releaseConstraint(PowerCC26XX_SB_DISALLOW);
  Power_releaseConstraint(PowerCC26XX_IDLE_PD_DISALLOW);
}

Void IRGENCC26XX_done()
{
  IRGENCC26XX_Handle         handle;
  IRGENCC26XX_Object         *object;
  IRGENCC26XX_HWAttrs const  *hwAttrs;
  unsigned int                key;

  /* Get handle for this driver instance */
  handle = irgenHandle;
  /* Get the pointer to the object and hwAttrs */
  object = handle->object;
  hwAttrs = handle->hwAttrs;

  uint32_t isrStatus = TimerIntStatus(GPT1_BASE, true);

  if ( (isrStatus & TIMER_TIMA_DMA) == TIMER_TIMA_DMA )
  {
    // This is the DMA interrupt
//    TimerDisable(GPT0_BASE, TIMER_BOTH);

    key = Hwi_disable();
    /* Clear Hwi and Timer interrupts */
    Hwi_clearInterrupt (INT_GPT1A);
    TimerIntClear(GPT1_BASE, TIMER_TIMA_DMA);
    /* Clear DMA interrupts */
    UDMACC26XX_clearInterrupt(object->udmaHandle, hwAttrs->dmaChannelBitMask);

    Hwi_restore(key);
    /* Disable the DMA Channels*/
    UDMACC26XX_channelDisable(object->udmaHandle, hwAttrs->dmaChannelBitMask);

//    /* Timer should not drive pin anymore, other wise we'd get a glitch at the end. */
//    PINCC26XX_setMux(object->pinHandle, hwAttrs->irLedPin, PINCC26XX_MUX_GPIO);
//
//#ifdef IRGENCC26XX_DEBUG
//    PINCC26XX_setMux(object->pinHandle, hwAttrs->irDataChPin,   PINCC26XX_MUX_GPIO);
//    PINCC26XX_setMux(object->pinHandle, hwAttrs->irOutputPin,   PINCC26XX_MUX_GPIO);
//    PINCC26XX_setMux(object->pinHandle, hwAttrs->irShadowChPin, PINCC26XX_MUX_GPIO);
//#endif

    /* Disable the shadow Timer */
    TimerDisable(GPT1_BASE, TIMER_A);

    /* Set the timer to 32-bit one-shot. */
    TimerConfigure(GPT1_BASE, TIMER_CFG_ONE_SHOT );
    /* Set the event (End of repeat period trigger in this case) to happen on the falling edge. */
    TimerEventControl (GPT1_BASE, TIMER_A, TIMER_EVENT_NEG_EDGE);

    /* In periodic mode the prescaler register is an actual register. In order to
     * to reuse 24-bit value we have changed to 32-bit mode.
     */
    /* Find out how many bits to shift down so all can fit in 16 bit */
    TimerLoadSet(GPT1_BASE, TIMER_A, lastPeriod);
    /* This creates a falling edge a couple of µs before timeout of Timer0B */
    TimerMatchSet (GPT1_BASE, TIMER_A, (object->timeoutOffset * GPT_FREQ ) / 1000000);
//    TimerPrescaleSet (GPT1_BASE, TIMER_A, loadPreScalerBuffer[object->bufferSize - 1]);
//    TimerPrescaleMatchSet (GPT1_BASE, TIMER_A, 0);

    /* Enables interrupt on next edge. */
    TimerIntEnable(GPT1_BASE, TIMER_TIMA_TIMEOUT);

    /* Enable the shadow Timer */
    TimerEnable(GPT1_BASE, TIMER_A);

    object->callbackFxn(irgenHandle, false);
  }
  else
  {
    if ( (isrStatus & TIMER_TIMA_TIMEOUT) == TIMER_TIMA_TIMEOUT )
    {
      TimerDisable(GPT0_BASE, TIMER_BOTH);

      key = Hwi_disable();
      /* Clear Hwi and Timer interrupts */
      Hwi_clearInterrupt (INT_GPT1A);
      TimerIntClear(GPT1_BASE, TIMER_TIMA_TIMEOUT);
      Hwi_restore(key);

      /* Disable the shadow Timer */
      TimerDisable(GPT1_BASE, TIMER_A);

      /* Timer should not drive pin anymore, other wise we'd get a glitch at the end. */
      PINCC26XX_setMux(object->pinHandle, hwAttrs->irLedPin, PINCC26XX_MUX_GPIO);

#ifdef IRGENCC26XX_DEBUG
      PINCC26XX_setMux(object->pinHandle, hwAttrs->irDataChPin,   PINCC26XX_MUX_GPIO);
      PINCC26XX_setMux(object->pinHandle, hwAttrs->irOutputPin,   PINCC26XX_MUX_GPIO);
      PINCC26XX_setMux(object->pinHandle, hwAttrs->irShadowChPin, PINCC26XX_MUX_GPIO);
#endif

      /* Check if we have pending irSignal to generate */
      if (pendingIRsignal == TRUE)
      {
        /* Kick off next signal ASAP */
        IRGENCC26XX_startIrGen(irgenHandle);
        pendingIRsignal = FALSE;
      }
      else
      {
        /* Call application */
        object->callbackFxn(irgenHandle, true);
      }
    }
  }
}

Void IRGENCC26XX_startIrGen(IRGENCC26XX_Handle handle)
{
  unsigned int              key;
  IRGENCC26XX_Object        *object;
  IRGENCC26XX_HWAttrs const *hwAttrs;
  uint32_t carrierLoad;
  uint32_t carrierMatch;
  /* Get the pointer to the object and hwAttr*/
  object = handle->object;
  hwAttrs = handle->hwAttrs;

  /* Calculate the load and match values for the carrier timer. */
  carrierLoad  = CARRIER_LOAD (object->carrierPeriod24MHz);
  carrierMatch = CARRIER_MATCH(object->carrierPeriod24MHz, object->carrierDuty);
  // Match must be at least 1
  if (carrierMatch == 0)
  {
    carrierMatch = 1;
  }

  /* Set the Carrier load register. */
  TimerLoadSet(GPT0_BASE, TIMER_A, carrierLoad & 0xFFFF );
  /* Load the timer n match register with the match value (this sets the duty cycle). */
  TimerMatchSet (GPT0_BASE, TIMER_A, carrierMatch & 0xFFFF);
  /* Prescalers are not needed for a carrier freq of 38KHz. */
  TimerPrescaleSet (GPT0_BASE, TIMER_A, ( carrierLoad >> 16) & 0xFF);
  TimerPrescaleMatchSet (GPT0_BASE, TIMER_A, ( carrierMatch >> 16) & 0xFF);

  /*Loads the first pulse that needs to be generated, the DMA takes over afterwards. */
  TimerLoadSet(GPT0_BASE, TIMER_B, loadBuffer[0]);
  TimerMatchSet(GPT0_BASE, TIMER_B, matchBuffer[0]);
  TimerPrescaleSet (GPT0_BASE, TIMER_B, loadPreScalerBuffer[0] );
  TimerPrescaleMatchSet (GPT0_BASE, TIMER_B, matchPreScalerBuffer[0] );

  TimerLoadSet(GPT1_BASE, TIMER_A, loadBuffer[0]);
  /* This creates a falling edge a couple of µs before timeout of Timer0B */
  TimerMatchSet (GPT1_BASE, TIMER_A, (object->timeoutOffset * GPT_FREQ ) / 1000000);
  TimerPrescaleSet (GPT1_BASE, TIMER_A, loadPreScalerBuffer[0]);
  TimerPrescaleMatchSet (GPT1_BASE, TIMER_A, 0);

  /* a lock is needed because we are accessing shared uDMA registers.*/
  key = Hwi_disable();

  /* ---------------------Setup Shadow Timer DMA Channels ----------------------- */

  /* Setup single transfer interrupt to DMA. GPT only delivers one interrupt. */
  EventRegister(EVENT_O_UDMACH9SSEL,  EVENT_UDMACH9SSEL_EV_GPT1A_DMABREQ);
  EventRegister(EVENT_O_UDMACH10SSEL, EVENT_UDMACH10SSEL_EV_GPT1A_DMABREQ);
  EventRegister(EVENT_O_UDMACH11SSEL, EVENT_UDMACH11SSEL_EV_GPT1A_DMABREQ);

  uint32_t dmaTransferCount = object->bufferSize - 1;
//  dmaTransferCount--;

  /* Setup transfer buffers to update the shadow timer's load register. */
  uDMAChannelTransferSetup(UDMA0_BASE, &dmaTableEntryTimer0_A, UDMA_MODE_BASIC, &loadBuffer[1]                              , (void *)(GPT1_BASE + GPT_O_TAILR)     , dma_CHANNEL_CTRL_OPTIONS, dmaTransferCount );
  uDMAChannelTransferSetup(UDMA0_BASE, &dmaTableEntryTimer0_B, UDMA_MODE_BASIC, &loadPreScalerBuffer[1]                     , (void *)(GPT1_BASE + GPT_O_TAPR)      , dma_CHANNEL_CTRL_OPTIONS_PRE_SCALER, dmaTransferCount );
  uDMAChannelTransferSetup(UDMA0_BASE, &dmaTableEntryTimer1_A, UDMA_MODE_BASIC, (uint32_t *)&hwAttrs->dmaSoftChannelBitMask , (void *)(UDMA0_BASE + UDMA_O_SOFTREQ) , dma_CHANNEL_CTRL_OPTIONS_SOFT_REQ, dmaTransferCount );

  /* ---------------------Setup IR Data Timer DMA Channels ----------------------- */

  uDMAChannelTransferSetup(UDMA0_BASE, &dmaTableEntrySwEvt1, UDMA_MODE_BASIC, &loadBuffer[1]                    , (void *)(GPT0_BASE + GPT_O_TBILR)   , dma_CHANNEL_CTRL_OPTIONS            , dmaTransferCount );
  uDMAChannelTransferSetup(UDMA0_BASE, &dmaTableEntrySwEvt0, UDMA_MODE_BASIC, &matchBuffer[1]                   , (void *)(GPT0_BASE + GPT_O_TBMATCHR), dma_CHANNEL_CTRL_OPTIONS            , dmaTransferCount );
  uDMAChannelTransferSetup(UDMA0_BASE, &dmaTableEntrySwEvt3, UDMA_MODE_BASIC, &loadPreScalerBuffer[1]           , (void *)(GPT0_BASE + GPT_O_TBPR)    , dma_CHANNEL_CTRL_OPTIONS_PRE_SCALER , dmaTransferCount );
  uDMAChannelTransferSetup(UDMA0_BASE, &dmaTableEntrySwEvt2, UDMA_MODE_BASIC, &matchPreScalerBuffer[1]          , (void *)(GPT0_BASE + GPT_O_TBPMR)   , dma_CHANNEL_CTRL_OPTIONS_PRE_SCALER , dmaTransferCount );

  /* Enable the DMA channels */
  UDMACC26XX_channelEnable(object->udmaHandle, hwAttrs->dmaChannelBitMask);

  /* restore interrupts */
  Hwi_restore(key);

  /* ------------------------Setup Shadow Timer ----------------------------- */

#ifdef IRGENCC26XX_DEBUG
  /* Set Output of GPT1A to EV_PORT_EVENT_2 (Port capture event from IOC). */
  EventRegister(EVENT_O_GPT1ACAPTSEL, EVENT_GPT1ACAPTSEL_EV_PORT_EVENT2 );
#endif

  /* Set the timer to periodic mode and PWM mode. */
  TimerConfigure(GPT1_BASE, TIMER_CFG_SPLIT_PAIR | TIMER_CFG_A_PWM );
  /* Set the PWM signal output to not inverted */
  TimerLevelControl (GPT1_BASE, TIMER_A, FALSE);
  /* Update TBMATCHR and TBPR, if used, on the next time-out.*/
  HWREG(GPT1_BASE + GPT_O_TAMR) |= GPT_TAMR_TAMRSU_TOUPDATE;
  /* Update the TAR register with the value in the TAILR register on the next timeout. */
  HWREG(GPT1_BASE + GPT_O_TAMR) |= GPT_TAMR_TAILD_TOUPDATE;
  /* Set the event (DMA trigger in this case) to happen on the falling edge. */
  TimerEventControl (GPT1_BASE, TIMER_A, TIMER_EVENT_NEG_EDGE);
//  HWREG(GPT0_BASE + GPT_O_TBMR) |= GPT_TBMR_TBPLO;
  /* Enables triggering the DMA on every falling edge. */
  TimerIntEnable(GPT1_BASE, TIMER_TIMA_DMA);
  /* GPT Timer 1A Capture Event DMA Trigger Enable. This will trigger the DMA
   * to start a transfer on every timer1A negative edge.
   */
  HWREG(GPT1_BASE + GPT_O_DMAEV) |= GPT_DMAEV_CAEDMAEN;

  /* To minimize glitches, setup the IO just before the carrier turns on.
   * The actual carrier is the most critical, do it last. */
#ifdef IRGENCC26XX_DEBUG
  /* Route the output IR signal, to IOID_25 (DP0 on the cape board) as well for debugging. */
  PINCC26XX_setMux(object->pinHandle, hwAttrs->irOutputPin, IOC_PORT_MCU_PORT_EVENT0);
  /* Route the data timer signal, to IOID_24 (DP1 on the cape board) for debugging. */
  PINCC26XX_setMux(object->pinHandle, hwAttrs->irDataChPin, IOC_PORT_MCU_PORT_EVENT1);
  /* Route the shadow timer signal, to IOID_23 (DP2 on the cape board) for debugging. */
  PINCC26XX_setMux(object->pinHandle, hwAttrs->irShadowChPin, IOC_PORT_MCU_PORT_EVENT2);
#endif
  /* Set DIO assigned to IR to use GPT0A (General Purpose Timer 0A) */
  PINCC26XX_setMux(object->pinHandle, hwAttrs->irLedPin, IOC_PORT_MCU_PORT_EVENT0);

  /* Start the timers */
  TimerEnable(GPT0_BASE, TIMER_BOTH);
  TimerEnable(GPT1_BASE, TIMER_A);
  /* Synchronize timer OA with the timeout of timer 0B, this has to be done after
   * starting the timers.
   */
  TimerSynchronize(GPT0_BASE, TIMER_0B_SYNC);
}

Void uDMAChannelTransferSetup(uint32_t ui32Base, volatile tDMAControlTable *dmaControlTableEntry,
                       uint32_t ui32Mode, void *pvSrcAddr, void *pvDstAddr, uint32_t ui32ControlWord,
                       uint32_t ui32TransferSize)
{
  uint32_t ui32Control;
  uint32_t ui32Inc;
  uint32_t ui32BufferBytes;
  /* Get the current control word value and mask off the fields to be
  * changed, then OR in the new settings.
  */
  dmaControlTableEntry->ui32Control = ((dmaControlTableEntry->ui32Control &
                                      ~(UDMA_DST_INC_M |
                                      UDMA_SRC_INC_M |
                                      UDMA_SIZE_M |
                                      UDMA_ARB_M |
                                      UDMA_NEXT_USEBURST)) |
                                      ui32ControlWord);

  ui32Control = (dmaControlTableEntry->ui32Control &
               ~(UDMA_XFER_SIZE_M | UDMA_MODE_M));

  /* Set the transfer size and mode in the control word (but don't write the
  * control word yet as it could kick off a transfer).
  */
  ui32Control |= ui32Mode | ((ui32TransferSize - 1) << UDMA_XFER_SIZE_S);
  /* Get the address increment value for the source, from the control word. */
  ui32Inc = (ui32Control & UDMA_SRC_INC_M);
  /* Compute the ending source address of the transfer.  If the source
  * increment is set to none, then the ending address is the same as the
  * beginning.
  */
  if(ui32Inc != UDMA_SRC_INC_NONE)
  {
    ui32Inc = ui32Inc >> UDMA_SRC_INC_S;
    ui32BufferBytes = ui32TransferSize << ui32Inc;
    pvSrcAddr = (void *)((uint32_t)pvSrcAddr + ui32BufferBytes - (1 << ui32Inc));
  }
  /* Load the source ending address into the control block. */
  dmaControlTableEntry->pvSrcEndAddr = pvSrcAddr;
  /* Get the address increment value for the destination, from the control word.*/
  ui32Inc = ui32Control & UDMA_DST_INC_M;
  /* Load the destination ending address into the control block. */
  dmaControlTableEntry->pvDstEndAddr = pvDstAddr;
  /* Write the new control word value. */
  dmaControlTableEntry->ui32Control = ui32Control;
}
