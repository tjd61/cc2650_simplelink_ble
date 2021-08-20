/*
 * Filename:       IRGENCC26XX.h
 * Revised:        $Date: 2015-09-24 10:41:21 +0200 (Thu, 24 Sep 2015) $
 * Revision:       $Revision: 1825 $

 * Description:    This file contains the driver implementation for generating
                   IR signals.
 * Copyright (c) 2014, Texas Instruments Incorporated
 * All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions
 * are met:
 *
 * *  Redistributions of source code must retain the above copyright
 *    notice, this list of conditions and the following disclaimer.
 *
 * *  Redistributions in binary form must reproduce the above copyright
 *    notice, this list of conditions and the following disclaimer in the
 *    documentation and/or other materials provided with the distribution.
 *
 * *  Neither the name of Texas Instruments Incorporated nor the names of
 *    its contributors may be used to endorse or promote products derived
 *    from this software without specific prior written permission.
 *
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
 * AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO,
 * THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR
 * PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR
 * CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
 * EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
 * PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS;
 * OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY,
 * WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR
 * OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE,
 * EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */
/** ============================================================================
 *  @file       IRGENCC26XX.h
 *
 *  @brief      IRGEN driver implementation for the CC26XX
 *
 *
 *  @code
 *
 *
 *  @endcode
 *
 * # Overview #
 *
 * ## General Behavior #
 *
 *
 *
 * ## Error handling #
 *
 * ## Supported Functions ##
 *
 *  ## Not Supported Functionality #
 *
 * ## Use Cases \anchor USE_CASES ##
 * ###  #
 *
 *  @code
 *
 *  @endcode
 *
 *
 *  # Instrumentation #

 *  ============================================================================
 */
#ifndef ti_drivers_irgen_IRGENCC26XX__include
#define ti_drivers_irgen_IRGENCC26XX__include


#ifdef __cplusplus
extern "C" {
#endif

#define ti_sysbios_family_arm_m3_Hwi__nolocalnames

#include <stdbool.h>
#include <stdint.h>
#include <inc/hw_ints.h>
#include <inc/hw_types.h>
#include <inc/hw_memmap.h>
#include <inc/hw_gpt.h>
#include <driverlib/interrupt.h>
#include <inc/hw_gpt.h>
#include <driverlib/timer.h>
#include <ti/drivers/Power.h>
#include <ti/drivers/power/PowerCC26XX.h>
#include <ti/sysbios/family/arm/m3/Hwi.h>
#include <ti/drivers/dma/UDMACC26XX.h>
#include <ti/drivers/PIN.h>
#include "Board.h"

/*********************************************************************
 * USER CONFIGURATION
 */
/* Period of the IR carrier, in 24MHz ticks. Default 41.67kHz --> 24us (* 24 = 576) */ //TODO: This
#define CARRIER_PERIOD_24MHZ    576
/* Frequency of the IR carrier, in hertz */ //TODO: Or That
#define CARRIER_FREQ     37914
/* Duty Cyccle of the carrier signal, in percent */
#define CARRIER_DUTY        67
/* Offset in microseconds between the falling edge of the shadow timer and
 *  timeout of the IR data timer.
 */
#define TIMEOUT_OFFSET    4
/* Maximum number of load and matches for an IR signal buffer. */
#define MATCH_LOAD_BUFFERS_SIZE  116
/*********************************************************************
 * CONSTANTS
 */
/* Frequency of the CPU in hertz, this value should not need to be changed */
#define CPU_FREQ         48000000
/* Frequency of the GPT domain, after PRCMClockConfigureSet is executed in IRGEN_Start.
 * By default, the CPU clock is divided by 4 in IRGEN_Start.
 */
#define GPT_FREQ         24000000

#define IRGEN_FROM_1US_TO_4US_TICKS(mod)					(mod >> 2)
#define IRGEN_MOD_TICKS_FROM_US(mod)                        (mod * (GPT_FREQ / 1000000)) // & 0x0000FFFF)
#define IRGEN_MOD_TICKS_FROM_250kHz(mod)                    ((mod * 3) << 5) // & 0x0000FFFF)
/* Calculates the value that goes in the Load register for the carrier timer.*/
#define CARRIER_LOAD(carrierPeriod24MHz)          (carrierPeriod24MHz)
/* Calculates the value that goes in the Match register for the carrier timer.*/
#define CARRIER_MATCH(carrierPeriod24MHz, duty)  (((carrierPeriod24MHz) * (100 - duty))/100)

/* DMA Channel Control words, these are used to configured the DMA channels. Depending
 * on which register that channel writes to, we use one of these words. They should not be changed.
 */
#define dma_CHANNEL_CTRL_OPTIONS             ( UDMA_SIZE_16 | UDMA_SRC_INC_16   | UDMA_DST_INC_NONE | UDMA_ARB_1 )
#define dma_CHANNEL_CTRL_OPTIONS_PRE_SCALER  ( UDMA_SIZE_8  | UDMA_SRC_INC_8    | UDMA_DST_INC_NONE | UDMA_ARB_1 )
#define dma_CHANNEL_CTRL_OPTIONS_SOFT_REQ    ( UDMA_SIZE_32 | UDMA_SRC_INC_NONE | UDMA_DST_INC_NONE | UDMA_ARB_1 )

/*!
 *  @brief      IRGENCC26XX Global configuration
 */
typedef struct IRGENCC26XX_Config {

    /*! Pointer to a driver specific data object */
    void                        *object;
    /*! Pointer to a driver specific hardware attributes structure */
    void                const   *hwAttrs;

} IRGENCC26XX_Config;

extern const IRGENCC26XX_Config IRGENCC26XX_config;
typedef struct IRGENCC26XX_Config *IRGENCC26XX_Handle;
/*!
 *  @brief      The definition of a callback function used when wakeup on
 *              chip select is enabled
 *
 *  @param      IRGENCC26XX_Handle          IRGENCC26XX_Handle
 */
typedef void (*IRGENCC26XX_CallbackFxn) (IRGENCC26XX_Handle handle, bool done);

/*!
 *  @brief  IRGENCC26XX hardware attributes
 */
typedef struct IRGENCC26XX_HWAttrs {
  /* IR LED output pin */
  PIN_Id           irLedPin;
#ifdef IRGENCC26XX_DEBUG
  /* Pins for debug purposes. */
  PIN_Id           irOutputPin;
  PIN_Id           irDataChPin;
  PIN_Id           irShadowChPin;
#endif
  /*! uDMA controlTable channels used */
  uint32_t         dmaChannelBitMask;
  /* uDMA Software channels used */
  uint32_t         dmaSoftChannelBitMask;

} IRGENCC26XX_HWAttrs;

typedef struct IRGENCC26XX_Params {
    IRGENCC26XX_CallbackFxn     callbackFxn;            /*!< Callback function pointer */
    uint32_t                    carrierPeriod24MHz;     /*!< Carrier period for 24MHz clock */
    uint32_t                    carrierDuty;            /*!< Dutycycle of the carrier, in percent */
    uint32_t                    timeoutOffset;          /*!< Offset, in uS at which the shadow timer triggers the Software channels
                                                         * before the timeout of the Data channel */
    uint16_t                    *markBuffer;            /*!< Pointer to the mark buffer; expects 4us worth ticks */
    uint16_t                    *spaceBuffer;           /*!< Pointer to the space buffer; expects 4us worth ticks */
    uint8_t                     *markPreScalerBuffer;
    uint8_t                     *spacePreScalerBuffer;
    uint8_t                      bufferSize;            /*!< Length of the buffers, mark and space buffer should be same length */
} IRGENCC26XX_Params;

typedef struct IRGENCC26XX_SubParams {
    uint32_t                    carrierPeriod24MHz;     /*!< Frequency of the carrier, in Hz */
    uint16_t                    *markBuffer;            /*!< Pointer to the mark buffer */
    uint16_t                    *spaceBuffer;           /*!< Pointer to the space buffer */
    uint8_t                      bufferSize;            /*!< Length of the buffers, mark and space buffer should be same length */
} IRGENCC26XX_SubParams;

/*!
 *  @brief  IRGENCC26XXDMA Object
 *
 *  The application must not access any member variables of this structure!
 */
typedef struct IRGENCC26XX_Object {
    IRGENCC26XX_CallbackFxn     callbackFxn;    /*!< Callback function pointer */
    uint32_t                    gptDomainFreq;  /*!< Frequency of the GPT Domain */
    uint32_t                    carrierPeriod24MHz;    /*!< Frequency of the carrier, in Hz */
    uint32_t                    carrierDuty;    /*!< Dutycycle of the carrier, in percent */
    uint32_t                    timeoutOffset;  /*!< Offset, in uS at which the shadow timer triggers the Software channels
                                                 * before the timeout of the Data channel */
    uint16_t                    *markBuffer;    /*!< Pointer to the mark buffer */
    uint16_t                    *spaceBuffer;   /*!< Pointer to the space buffer */
    uint8_t                     *markPreScalerBuffer;
    uint8_t                     *spacePreScalerBuffer;
    uint8_t                      bufferSize;    /*!< Length of the buffers, mark and space buffer should be same length */

    ti_sysbios_family_arm_m3_Hwi_Struct hwi;    /*!< Hwi object handle */

    /* PIN driver state object and handle */
    PIN_State                   pinState;
    PIN_Handle                  pinHandle;

    /* UDMA driver handle */
    UDMACC26XX_Handle      udmaHandle;

    bool                        isOpen;             /*!< Has the object been opened */
} IRGENCC26XX_Object;

/* TODO: Add doxygen documentation */
Void                    IRGENCC26XX_init(IRGENCC26XX_Handle handle);
/*!
 *  @brief  IRGENCC26XX_open
 *
 *  Call this to configure and get handle to user IR driver,
 *  IRGENCC26XX_Params must be properly filled before calling
 */
IRGENCC26XX_Handle      IRGENCC26XX_open(IRGENCC26XX_Params *params);
/*!
 *  @brief  IRGENCC26XX_close
 *
 *  Call this to release use of IR driver. This is required to allow the
 *  system to save power.
 *  Provide Mark and Space values in 4us ticks, i.e. each bit represents 4us
 */
Void                    IRGENCC26XX_close(IRGENCC26XX_Handle handle);
/*!
 *  @brief  IRGENCC26XX_startIrGen
 *
 *  Call this function the first time an IR signal is ready to be sent after
 *  the driver is opened.
 */
Void                    IRGENCC26XX_startIrGen(IRGENCC26XX_Handle handle);
/*!
 *  @brief  IRGENCC26XX_prepareNextSignal
 *
 *  While the driver is busy transmitting the current IR signal call this
 *  function to prepare the next signal. This should be used if the content
 *  of the signal changes between repeat signals; such as toggle bits.
 */
Void                    IRGENCC26XX_prepareNextSignal(IRGENCC26XX_SubParams *irParams);
/*!
 *  @brief  IRGENCC26XX_kickNextSignal
 *
 *  Can be used if the IR driver is still open, and it has completed
 *  transmitting all signals, but we have yet to transmit a release, or if
 *  there's a new signal. In the latter case it is highly recommended to close
 *  the driver in between so that the system can save power.
 */
Void                    IRGENCC26XX_kickNextSignal(void);

#ifdef __cplusplus
}
#endif

#endif /* ti_drivers_irgen_IRGENCC26XX__include */
