/*
 * Copyright (c) 2015, Texas Instruments Incorporated
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

/*
 *  ======== irgeneration-main.c ========
 */

/* XDCtools Header files */
#include <xdc/std.h>
#include <xdc/cfg/global.h>
#include <xdc/runtime/System.h>

/* BIOS Header files */
#include <ti/sysbios/BIOS.h>
#include <ti/sysbios/knl/Task.h>
#include <ti/sysbios/knl/Clock.h>
#include <ti/sysbios/knl/Semaphore.h>

/* TI-RTOS Header files */
#include <ti/drivers/PIN.h>
#include <ti/drivers/pin/PINCC26XX.h>

/* Example/Board Header files */
#include "Board.h"

/* Driverlib CPU functions, used here for CPUdelay*/
#include <driverlib/cpu.h>

/* Could be anything, like computing primes */
#define FakeBlockingSlowWork()   CPUdelay(12e6)
#define FakeBlockingFastWork()   CPUdelay(3e6)

/* Pin driver handles */
static PIN_Handle pinHandle;

/* Global memory storage for a PIN_Config table */
static PIN_State pinState;

Task_Struct workTask;
static uint8_t workTaskStack[256];

Task_Struct pinTask;
static uint8_t pinTaskStack[256];

/*
 * Initial pin configuration table
 *   - LEDs Board_LED0 & Board_LED1 are off after the pin table is initialized.
 *   - Button is set to input with pull-up. On SmartRF06, BUTTON0 is UP, for the
 *     others it's the LEFT button.
 */
PIN_Config pinTable[] = {
    Board_LED0 | PIN_GPIO_OUTPUT_EN | PIN_GPIO_LOW | PIN_PUSHPULL | PIN_DRVSTR_MAX,
    Board_LED1 | PIN_GPIO_OUTPUT_EN | PIN_GPIO_LOW | PIN_PUSHPULL | PIN_DRVSTR_MAX,
    Board_BUTTON0 | PIN_INPUT_EN | PIN_PULLUP,
    PIN_TERMINATE
};

Void workTaskFunc(UArg arg0, UArg arg1)
{
    while (1) {

    	/* Toggle LED */
    	PIN_setOutputValue(pinHandle, Board_LED1, PIN_getOutputValue(Board_LED1) ^ 1);

        /* Sleep */
        Task_sleep(500 * (1000 / Clock_tickPeriod));
    }
}

Void pinTaskFunc(UArg arg0, UArg arg1)
{
    while (1) {

        Semaphore_pend(keyInterruptSem, BIOS_WAIT_FOREVER);

        /* Debounce 25ms */
        Task_sleep(25 * (1000 / Clock_tickPeriod));

        /* Then safely read IO */
        if (PIN_getInputValue(Board_BUTTON0) == 0)
        {
        	/* Button is pressed, light LED0 250ms */
        	PIN_setOutputValue(pinHandle, Board_LED0, 1);
	        Task_sleep(250 * (1000 / Clock_tickPeriod));
        	PIN_setOutputValue(pinHandle, Board_LED0, 0);
        }
    }
}

void pinInterruptHandler(PIN_Handle handle, PIN_Id pinId)
{
    Semaphore_post(keyInterruptSem);
}

/*
 *  ======== main ========
 *
 */
int main(void)
{
    /* Call board init functions */
    PIN_init(BoardGpioInitTable);

    /* Open pins */
    pinHandle = PIN_open(&pinState, pinTable);
    if(!pinHandle) {
        System_abort("Error initializing board pins\n");
    }

    PIN_registerIntCb(pinHandle, pinInterruptHandler);
    PIN_setInterrupt(pinHandle, Board_BUTTON0 | PIN_IRQ_NEGEDGE);

    /* Set up the led task */
    Task_Params workTaskParams;
    Task_Params_init(&workTaskParams);
    workTaskParams.stackSize = 256;
    workTaskParams.priority = 1;
    workTaskParams.stack = &workTaskStack;

    Task_construct(&workTask, workTaskFunc, &workTaskParams, NULL);

    Task_Params pinTaskParams;
    Task_Params_init(&pinTaskParams);
    pinTaskParams.stackSize = 256;
    pinTaskParams.priority = 2;
    pinTaskParams.stack = &pinTaskStack;

    Task_construct(&pinTask, pinTaskFunc, &pinTaskParams, NULL);

    /* Start kernel. */
    BIOS_start();

    return (0);
}
