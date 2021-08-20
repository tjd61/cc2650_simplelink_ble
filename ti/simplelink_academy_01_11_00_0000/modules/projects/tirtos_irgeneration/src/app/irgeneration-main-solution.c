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
 *  ======== irgen-main-solution.c ========
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

/* Add IRGEN support */
#include "IRGENCC26XX.h"

/* Could be anything, like computing primes */
#define FakeBlockingSlowWork()   CPUdelay(12e6)
#define FakeBlockingFastWork()   CPUdelay(3e6)

/* Pin driver handles */
static PIN_Handle pinHandle;

/* Global memory storage for a PIN_Config table */
static PIN_State pinState;

/* IR generation handle */
static IRGENCC26XX_Handle irgenHandle;
/* IR generation callback */
static void IRGENCC26XX_callbackFxn(IRGENCC26XX_Handle handle, bool done);

Task_Struct workTask;
static uint8_t workTaskStack[256];

Task_Struct pinTask;
static uint8_t pinTaskStack[256];

/* Static example IR signal */
uint16_t markBufferExample[] =
{
	IRGEN_FROM_1US_TO_4US_TICKS(1200), IRGEN_FROM_1US_TO_4US_TICKS(600), IRGEN_FROM_1US_TO_4US_TICKS(360),
	IRGEN_FROM_1US_TO_4US_TICKS(360), IRGEN_FROM_1US_TO_4US_TICKS(360), IRGEN_FROM_1US_TO_4US_TICKS(600),
	IRGEN_FROM_1US_TO_4US_TICKS(600), IRGEN_FROM_1US_TO_4US_TICKS(360), IRGEN_FROM_1US_TO_4US_TICKS(600),
	IRGEN_FROM_1US_TO_4US_TICKS(360)
};
uint16_t spaceBufferExample[] =
{
	IRGEN_FROM_1US_TO_4US_TICKS(840), IRGEN_FROM_1US_TO_4US_TICKS(840), IRGEN_FROM_1US_TO_4US_TICKS(960),
	IRGEN_FROM_1US_TO_4US_TICKS(960), IRGEN_FROM_1US_TO_4US_TICKS(840), IRGEN_FROM_1US_TO_4US_TICKS(840),
	IRGEN_FROM_1US_TO_4US_TICKS(960), IRGEN_FROM_1US_TO_4US_TICKS(840), IRGEN_FROM_1US_TO_4US_TICKS(960),
	IRGEN_FROM_1US_TO_4US_TICKS(84000)
};

/***********************************************************************************
* Configuration parameters
*/
IRGENCC26XX_Params irgenParams = {
    IRGENCC26XX_callbackFxn,
    CARRIER_PERIOD_24MHZ,
    CARRIER_DUTY,
    TIMEOUT_OFFSET,
    NULL,       /* Mark  buffer pointer needs to be set before calling IRGENCC26XX_open  */
    NULL,       /* Space buffer pointer needs to be set before calling IRGENCC26XX_open  */
    0,          /* Size of buffers needs to be set before calling IRGENCC26XX_open  */
};

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
    irgenParams.markBuffer = markBufferExample;
    irgenParams.spaceBuffer = spaceBufferExample;
    irgenParams.bufferSize = sizeof(markBufferExample)/sizeof(uint16_t);
	IRGENCC26XX_SubParams irParams;
	irParams.carrierPeriod24MHz = irgenParams.carrierPeriod24MHz;
	irParams.markBuffer = irgenParams.markBuffer;
	irParams.spaceBuffer = irgenParams.spaceBuffer;
	irParams.bufferSize = irgenParams.bufferSize;

    while (1) {

        Semaphore_pend(keyInterruptSem, BIOS_WAIT_FOREVER);

        /* Debounce 25ms */
        Task_sleep(25 * (1000 / Clock_tickPeriod));

        /* Then safely read IO */
        if (PIN_getInputValue(Board_BUTTON0) == 0)
        {
        	/* Button is pressed, so generate IR signal */
            /* Open IRGEN handle*/
            irgenHandle = IRGENCC26XX_open(&irgenParams);
        	PIN_setOutputValue(pinHandle, Board_LED0, 1);
        	IRGENCC26XX_startIrGen(irgenHandle);
        	/* First we wait for active part of signal to end */
            Semaphore_pend(irgenSem, BIOS_WAIT_FOREVER);
            /* Keep transmitting while button is pressed */
            while (PIN_getInputValue(Board_BUTTON0) == 0)
            {
            	/* Then we can prepare the same signal again */
            	IRGENCC26XX_prepareNextSignal(&irParams);
            	/* Before we wait for active part to end again */
                Semaphore_pend(irgenSem, BIOS_WAIT_FOREVER);
            }
        	/* Now wait for repeat period to end */
            Semaphore_pend(irgenSem, BIOS_WAIT_FOREVER);
        	PIN_setOutputValue(pinHandle, Board_LED0, 0);
            /* Close IRGEN handle*/
            IRGENCC26XX_close(irgenHandle);
        }
    }
}

void pinInterruptHandler(PIN_Handle handle, PIN_Id pinId)
{
    Semaphore_post(keyInterruptSem);
}

static void IRGENCC26XX_callbackFxn(IRGENCC26XX_Handle handle, bool done)
{
	/* IR engine generates two interrupts
	 * 1. After end of active part of signal, just before the repeat period. It is safe to schedule next signal now.
	 * 2. After end of repeat period. This is only called if there are no pending signals. */
	if (done)
	{
		/* IR engine has completed generation of the signal, and there are no pending signals. */
	    Semaphore_post(irgenSem);
	}
	else
	{
		/* Here we can safely update the buffers for next signal.
		 * Utilizing the repeat period!
		 */
	    Semaphore_post(irgenSem);
	}
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

    /* Initialize IR engine */
    IRGENCC26XX_init((IRGENCC26XX_Handle)&(IRGENCC26XX_config));

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

/* Note, the solution also involves adding the below to the .cfg file
var semaphore1Params = new Semaphore.Params();
semaphore1Params.instance.name = "irgenSem";
Program.global.irgenSem = Semaphore.create(null, semaphore1Params);

   It also involves updating the board files to add support for IRGEN
*/
