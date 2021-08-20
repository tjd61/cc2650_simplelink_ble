/*
 * Copyright (c) 2016, Texas Instruments Incorporated
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

/*********************************************************************
 * INCLUDES
 */
#include <string.h>

#include <xdc/std.h>

#include <ti/sysbios/knl/Clock.h>

#include <Board.h>

#include "custom_fmt.h"

// Sensor Controller API
#include "scif.h"

// EasyLink API
#include "EasyLink.h"

#include "application.h"


/*********************************************************************
 * MACROS
 */
// High and low byte of a 16-bit value
#define HI_UINT16(a) (((a) >> 8) & 0xFF)
#define LO_UINT16(a) ((a) & 0xFF)


/*********************************************************************
 * GLOBAL VARIABLES
 */
// Ranger task Clock struct and last tick value
static uint32_t g_lastTick = 0;
static Clock_Struct g_rangerClock;


/*********************************************************************
 * LOCAL FUNCTION DECLARATIONS
 */
// HWI
static void SC_ctrlReadyHwiCb(void);
static void SC_taskAlertHwiCb(void);

// SWI
static void SC_rangerClockSwiFxn(UArg a0);

// TASK
static void SC_txPacket(uint16_t rangerValue);
static void SC_processAdc(void);
static void SC_processRanger(void);



/*********************************************************************
 * HWI CALLBACKS
 */

/*
 * @brief   Callback from Scif driver on Control READY interrupt.
 *
 *          Signals main task with EVENT_SC_CTRL_READY event.
 *
 * @param   None.
 *
 * @return  None.
 */
static void SC_ctrlReadyHwiCb(void)
{
    // Signal the event to Main task
    Main_signalEvents(EVENT_SC_CTRL_READY);
} // SC_ctrlReadyHwiCb


/*
 * @brief   Callback from Scif driver on Task ALERT interrupt.
 *
 *          Signals main task with EVENT_SC_TASK_ALERT event.
 *
 * @param   None.
 *
 * @return  None.
 */
static void SC_taskAlertHwiCb(void)
{
    // Signal the event to Main task
    Main_signalEvents(EVENT_SC_TASK_ALERT);
} // SC_taskAlertHwiCb


/*********************************************************************
 * SWI CALLBACKS
 */

/*
 * @brief   Callback from Clock module on timeout.
 *
 *          Stores current clock tick, and signals main task with
 *          EVENT_SC_EXEC_RANGER event.
 *
 * @param   None.
 *
 * @return  None.
 */
static void SC_rangerClockSwiFxn(UArg a0)
{
    g_lastTick = Clock_getTicks();
    // Signal the event to Main task
    Main_signalEvents(EVENT_SC_EXEC_RANGER);
} // SC_rangerClockSwiFxn


/*********************************************************************
 * LOCAL FUNCTIONS
 */

/*
 * @brief   Send a Tx packet with the ranger value in ASCII.
 *
 * @param   rangerValue  Value from the Ranger SC Task.
 *
 * @return  None.
 */
static void SC_txPacket(uint16_t rangerValue)
{
    EasyLink_TxPacket txPacket = { 0 };

    // Create packet with incrementing sequence number
    static uint16_t seqNumber = 0;
    txPacket.payload[0] = /* TODO High byte of seqNumber */;
    txPacket.payload[1] = /* TODO Low byte of seqNumber */;
    /* TODO Increment seqNumber */

    // Format Ranger value to ASCII with units and add to payload
    char pLine[20];
    itoaAppendStr(pLine, rangerValue, "cm");
    size_t lineLen = strlen(pLine);
    /* TODO Copy pLine into payload index 2 */
    memcpy(/* payload address */, /* pLine address */, /* length of pLine */);

    // Rest of packet conf
    txPacket.len = 2 + lineLen;
    txPacket.dstAddr[0] = 0xaa;
    txPacket.absTime = 0; // immediate

    // Send packet
    if (EasyLink_transmit(&txPacket) == EasyLink_Status_Success) {
        // Toggle LED1 (Green)
        Main_toggleLed(Board_LED1);
    }
} // SC_txPacket


/*
 * @brief   Processing function for the ADC SC task.
 *
 *          Is called whenever the EVENT_SC_TASK_ALERT event is active
 *          and ADC SC task has generated an alert.
 *
 *          Retrieves ADC value from SC, and calculates and sets new period and
 *          timeout for Clock object.
 *
 * @param   None.
 *
 * @return  None.
 */
static void SC_processAdc(void)
{
    // Retrieve ADC value and saturate at 3000
    uint16_t adcValue = scifTaskData.adc.output.adcValue;
    adcValue = (adcValue < 3000) ? adcValue : 3000;

    // Calculate new Ranger clock period in the range <MINVAL, MAXVAL>
    #define MAXVAL 1000
    #define MINVAL 333
    uint32_t newPeriod_ms = (MAXVAL - MINVAL) * adcValue / 3000 + MINVAL;

    // Calculate ranger clock timeout, to prevent dispatch jitter
    uint32_t currRangerExec_ms = TICK_TO_MS(Clock_getTicks() - g_lastTick);
    uint32_t newTimeout_ms = (currRangerExec_ms < newPeriod_ms)
                           ? newPeriod_ms - currRangerExec_ms
                           : 0;

    // Re-configure the Ranger clock with new period and timeout
    Clock_Handle hRangerClock = Clock_handle(&g_rangerClock);
    Clock_stop(hRangerClock);
    Clock_setPeriod(hRangerClock, MS_TO_TICK(newPeriod_ms));
    Clock_setTimeout(hRangerClock, MS_TO_TICK(newTimeout_ms));
    Clock_start(hRangerClock);

    // Toggle LED0 (Red)
    Main_toggleLed(Board_LED0);
} // SC_processAdc


/*
 * @brief   Processing function for the Ranger SC task.
 *
 *          Is called whenever the EVENT_SC_TASK_ALERT event is active
 *          and Ranger SC task has generated an alert.
 *
 *          Retrieves both high and low tdc values from SC, extends into 32-bit,
 *          converts into cm, and prints out the value on Log.
 *
 * @param   None.
 *
 * @return  None.
 */
static void SC_processRanger(void)
{
    // Retrieve and build TDC value
    uint16_t tdcValueL = scifTaskData.ranger.output.tdcValueL;
    uint16_t tdcValueH = scifTaskData.ranger.output.tdcValueH;
    uint32_t tdcValue  = (tdcValueH << 16) | tdcValueL;

    // Convert from TDC value to time of flight[us]
    uint32_t tof_us = tdcValue / 48;
    // Convert from time of flight[us] to distance[cm]
    uint32_t rangerDistance_cm = tof_us * 429 / 25000;

    // Send packet
    SC_txPacket((uint16_t)rangerDistance_cm);
} // SC_processRanger


/*********************************************************************
 * EXTERN FUNCTIONS
 */

/*
 * @brief   Called before main loop.
 *
 *          Initializes Scif driver, registers callbacks, configures RTC, and
 *          starts SC tasks.
 *
 * @param   None.
 *
 * @return  None.
 */
void SC_init(void)
{
    // EasyLink initialization
    EasyLink_init(EasyLink_Phy_50kbps2gfsk);
    /* Set Freq to 869.7MHz */
    EasyLink_setFrequency(869700000);
    /* Set output power to 12dBm */
    EasyLink_setRfPwr(12);

    // clockParams is only used during init and can be on the stack.
    Clock_Params clockParams;
    // Insert default params
    Clock_Params_init(&clockParams);
    // Set period to 0 ms
    clockParams.period = 0;
    // Initialize the clock object / Clock_Struct previously added globally.
    Clock_construct(&g_rangerClock,        // global clock struct
                    SC_rangerClockSwiFxn,  // callback from clock
                    0,                     // Initial delay before first timeout
                    &clockParams);         // clock parameters

    // Initialize the Sensor Controller
    scifOsalInit();
    scifOsalRegisterCtrlReadyCallback(SC_ctrlReadyHwiCb);
    scifOsalRegisterTaskAlertCallback(SC_taskAlertHwiCb);
    scifInit(&scifDriverSetup);

    uint32_t rtcHz = 3; // 3Hz RTC
    scifStartRtcTicksNow(0x00010000 / rtcHz);

    // Configure SC Tasks here, if any

    // Start Sensor Controller
    scifStartTasksNbl(BV(SCIF_ADC_TASK_ID));
} // SC_init


/*
 * @brief   Processing function for the EVENT_SC_CTRL_READY event.
 *
 *          Is called from main loop whenever the EVENT_SC_CTRL_READY event is
 *          active.
 *
 *          Currently does nothing.
 *
 * @param   None.
 *
 * @return  None.
 */
void SC_processCtrlReady(void)
{
    // Do nothing
} // SC_processCtrlReady


/*
 * @brief   Processing function for the EVENT_SC_TASK_ALERT event.
 *
 *          Is called from main loop whenever the EVENT_SC_TASK_ALERT event is
 *          active.
 *
 *          Checks which SC tasks are active, and calls their corresponding
 *          processing function. Also clears and ACKs the interrupts to the
 *          Scif driver.
 *
 * @param   None.
 *
 * @return  None.
 */
void SC_processTaskAlert(void)
{
    // Clear the ALERT interrupt source
    scifClearAlertIntSource();

    // Get the alert events
    uint32_t bvAlertEvents = scifGetAlertEvents();

    // Check which task called and do process
    if (bvAlertEvents & BV(SCIF_RANGER_TASK_ID)) {
        SC_processRanger();
    }
    if (bvAlertEvents & BV(SCIF_ADC_TASK_ID)) {
        SC_processAdc();
    }

    // Acknowledge the ALERT event
    scifAckAlertEvents();
} // SC_processTaskAlert


/*
 * @brief   Processing function for the EVENT_SC_TASK_ALERT event.
 *
 *          Is called from main loop whenever the EVENT_SC_TASK_ALERT event is
 *          active.
 *
 *          Executes the Ranger SC task once.
 *
 * @param   None.
 *
 * @return  None.
 */
void SC_execRanger(void)
{
    // Check Ranger Task is not already active
    uint16_t bvActive = scifGetActiveTaskIds();
    if (bvActive & BV(SCIF_RANGER_TASK_ID)) {
        return;
    }
    // Execute Task once
    scifResetTaskStructs(BV(SCIF_RANGER_TASK_ID), 0);
    scifExecuteTasksOnceNbl(BV(SCIF_RANGER_TASK_ID));
} // SC_execRanger
