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

/***** Includes *****/
#include <DmNodeRadioTask.h>
#include <DmNodeTask.h>
#include <xdc/std.h>
#include <xdc/runtime/System.h>

#include <string.h>

#include <ti/sysbios/BIOS.h>
#include <ti/sysbios/knl/Task.h>
#include <ti/sysbios/knl/Semaphore.h>
#include <ti/sysbios/knl/Event.h>
#include <ti/sysbios/knl/Clock.h>

#include <ti/drivers/PIN.h>
#include <ti/drivers/pin/PINCC26XX.h>
#include <ti/mw/display/Display.h>
#include <ti/mw/display/DisplayExt.h>

/* Board Header files */
#include "Board.h"

#include "sensors/SensorI2C.h"
#include "sensors/SensorOpt3001.h"
#include "sensors/SensorBmp280.h"
#include "sensors/SensorHdc1000.h"
#include "sensors/SensorMpu9250.h"
#include "sensors/SensorTmp007.h"
#include "extflash/ExtFlash.h"

#ifdef USE_BIM
#include "bim/BimFactoryReset.h"
#endif


/***** Defines *****/
#define NODE_TASK_STACK_SIZE 1024
#define NODE_TASK_PRIORITY   3

#define NODE_EVENT_ALL                  0xFFFFFFFF
#define NODE_EVENT_READ_SENSOR         (uint32_t)(1 << 0)
#define NODE_EVENT_UPDATE_LCD       (uint32_t)(1 << 1)

#ifdef USE_BIM
#define NODE_EVENT_FACTORY_RESET    (uint32_t)(1 << 2)
#endif


/* Minimum slow Report interval is 50s*/
#define NODE_SENSOR_REPORTINTERVAL_SLOW_MS                50000
/* Minimum fast Report interval is 1s for 30s*/
#define NODE_SENSOR_REPORTINTERVAL_FAST_MS                1000
/* Duration in units of NODE_SENSOR_REPORTINTERVAL_FAST_MS */
#define NODE_SENSOR_REPORTINTERVAL_FAST_DURIATION      30

#ifdef USE_BIM
/* BLE Load button check timers - check button ever 100ms for 5s*/
#define NODE_BLE_BOOTLODER_BUTTON_CHECK_TIMER_MS    100
#define NODE_BLE_BOOTLODER_BUTTON_CHECK_DURATION_S  6
#endif


/***** Variable declarations *****/
static Task_Params nodeTaskParams;
Task_Struct nodeTask;    /* not static so you can see in ROV */
static uint8_t nodeTaskStack[NODE_TASK_STACK_SIZE];
Event_Struct nodeEvent;  /* not static so you can see in ROV */
static Event_Handle nodeEventHandle;
static uint16_t latestLuxValue;
static uint32_t fastReportCount;

/* Clock for the fast report timeout */
Clock_Struct sensorTimerClock;     /* not static so you can see in ROV */
static Clock_Handle sensorTimerClockHandle;

#ifdef USE_BIM
/* Clock for the fast report timeout */
Clock_Struct bleBootloadBtnCheckClock;     /* not static so you can see in ROV */
static Clock_Handle bleBootloadBtnCheckClockHandle;
#endif

/* Pin driver handle */
static PIN_Handle buttonPinHandle;
PIN_Handle ledPinHandle;

/* Global memory storage for a PIN_Config table */
static PIN_State buttonPinState;
static PIN_State ledPinState;

/* Display driver handles */
static Display_Handle hDisplayLcd;
static Display_Handle hDisplaySerial;

static Node_AdertiserType advertisementType = Node_AdertiserMsUrl;

/* Enable the 3.3V power domain used by the LCD */
PIN_Config pinTable[] = {
    NODE_SUB1_ACTIVITY_LED | PIN_GPIO_OUTPUT_EN | PIN_GPIO_LOW | PIN_PUSHPULL | PIN_DRVSTR_MAX,
    PIN_TERMINATE
};

/*
 * Application button pin configuration table:
 *   - Buttons interrupts are configured to trigger on falling edge.
 */
PIN_Config buttonPinTable[] = {
    Board_BUTTON0  | PIN_INPUT_EN | PIN_PULLUP | PIN_IRQ_NEGEDGE,
    Board_BUTTON1  | PIN_INPUT_EN | PIN_PULLUP | PIN_IRQ_NEGEDGE,
    PIN_TERMINATE
};

static uint8_t nodeAddress = 0;

/***** Prototypes *****/
static void nodeTaskFunction(UArg arg0, UArg arg1);
static void updateLcd(void);
void sensorTimerCallback(UArg arg0);
void buttonCallback(PIN_Handle handle, PIN_Id pinId);

#ifdef USE_BIM
void bleBtnCheckTimerCallback(UArg arg0);
#endif

/***** Function definitions *****/
void NodeTask_init(void)
{
    /* Create event used internally for state changes */
    Event_Params eventParam;
    Event_Params_init(&eventParam);
    Event_construct(&nodeEvent, &eventParam);
    nodeEventHandle = Event_handle(&nodeEvent);

    /* setup test clock to send ADV event every 1s until fast report interval ends*/
    Clock_Params clkParams;
    clkParams.period = NODE_SENSOR_REPORTINTERVAL_FAST_MS * 1000 / Clock_tickPeriod;
    clkParams.startFlag = FALSE;
    Clock_construct(&sensorTimerClock, sensorTimerCallback, 1, &clkParams);
    sensorTimerClockHandle = Clock_handle(&sensorTimerClock);

#ifdef USE_BIM
    /* Create clock object which is used for ble bootload button check */
    Clock_construct(&bleBootloadBtnCheckClock, bleBtnCheckTimerCallback, 1, &clkParams);
    bleBootloadBtnCheckClockHandle = Clock_handle(&bleBootloadBtnCheckClock);
#endif

    /* Create the node task */
    Task_Params_init(&nodeTaskParams);
    nodeTaskParams.stackSize = NODE_TASK_STACK_SIZE;
    nodeTaskParams.priority = NODE_TASK_PRIORITY;
    nodeTaskParams.stack = &nodeTaskStack;
    Task_construct(&nodeTask, nodeTaskFunction, &nodeTaskParams, NULL);
}

static void nodeTaskFunction(UArg arg0, UArg arg1)
{
    Display_Params params;

    /* Open LED pins */
    ledPinHandle = PIN_open(&ledPinState, pinTable);
    if (!ledPinHandle)
    {
        System_abort("Error initializing board 3.3V domain pins\n");
    }

    if (SensorI2C_open())
    {
        /* Put unused external sensors and flash into Sleep */
        SensorBmp280_init();            // Pressure Sensor
        SensorBmp280_enable(false);
        SensorTmp007_init();            // Infrared Thermopile Sensor
        SensorTmp007_enable(false);
        SensorHdc1000_init();           // Humidity
        SensorMpu9250_init();           // Gyroscope and accelerometer
        SensorMpu9250_enable(false);
        SensorMpu9250_powerOff();
        ExtFlash_open();
        ExtFlash_close();

        /* Init Light sensor */
        SensorOpt3001_init();
        SensorOpt3001_enable(true);
    }
    else
    {
        System_abort("Error initializing sensors\n");
    }

    /* Initialize display and try to open both UART and LCD types of display. */
    Display_Params_init(&params);
    params.lineClearMode = DISPLAY_CLEAR_BOTH;

    /* Open both an available LCD display and an UART display.
     * Whether the open call is successful depends on what is present in the
     * Display_config[] array of the board file.
     *
     * Note that for SensorTag evaluation boards combined with the SHARP96x96
     * Watch DevPack, there is a pin conflict with UART such that one must be
     * excluded, and UART is preferred by default. To display on the Watch
     * DevPack, add the precompiler define BOARD_DISPLAY_EXCLUDE_UART.
     */
    hDisplayLcd = Display_open(Display_Type_LCD, &params);
    hDisplaySerial = Display_open(Display_Type_UART, &params);

    /* Check if the selected Display type was found and successfully opened */
    if (hDisplaySerial)
    {
        Display_print0(hDisplaySerial, 0, 0, "Waiting for SCE ADC reading...");
    }

    /* Check if the selected Display type was found and successfully opened */
    if (hDisplayLcd)
    {
        Display_print0(hDisplayLcd, 0, 0, "Waiting for ADC...");
    }

    /* start sensor timer (initially for fast reporting) */
    fastReportCount = 0;
    Clock_setPeriod(sensorTimerClockHandle, (NODE_SENSOR_REPORTINTERVAL_FAST_MS * 1000 / Clock_tickPeriod));
    Clock_start(sensorTimerClockHandle);

#ifdef USE_BIM
    /* setup timer for ble bootload button check */
    Clock_setTimeout(bleBootloadBtnCheckClockHandle,
            NODE_BLE_BOOTLODER_BUTTON_CHECK_TIMER_MS * 1000 / Clock_tickPeriod);
#endif

    buttonPinHandle = PIN_open(&buttonPinState, buttonPinTable);
    if (!buttonPinHandle)
    {
        System_abort("Error initializing button pins\n");
    }

    /* Setup callback for button pins */
    if (PIN_registerIntCb(buttonPinHandle, &buttonCallback) != 0)
    {
        System_abort("Error registering button callback function");
    }

    while (1)
    {
        /* Wait for event */
        uint32_t events = Event_pend(nodeEventHandle, 0, NODE_EVENT_ALL, BIOS_WAIT_FOREVER);

        /* Read the sensor and send the value */
        if (events & NODE_EVENT_READ_SENSOR) {
            uint16_t rawData;
            float lux;

            /* Read sensor */
            SensorOpt3001_read(&rawData);
            lux = SensorOpt3001_convert(rawData);
            latestLuxValue = (uint16_t) lux;

            /* Send ADC value to concentrator */
            NodeRadioTask_sendAdcData(latestLuxValue);

            /* Toggle activity LED */
            PIN_setOutputValue(ledPinHandle, NODE_SUB1_ACTIVITY_LED,!PIN_getOutputValue(NODE_SUB1_ACTIVITY_LED));

            /* update display */
            updateLcd();
        }
        /* If new ADC value, send this data */
        if (events & NODE_EVENT_UPDATE_LCD) {
            /* update display */
            updateLcd();
        }

#ifdef USE_BIM
        if (events & NODE_EVENT_FACTORY_RESET) {

            Display_control(hDisplayLcd, DISPLAY_CMD_TRANSPORT_CLOSE, NULL);

            BimFactoryReset_applyFactoryImage();

            /* BIM Factory Reset failed, reenable the LCD */
            Display_control(hDisplayLcd, DISPLAY_CMD_TRANSPORT_OPEN, NULL);

            /* Re-enable interrupts to detect button release. */
            PIN_setConfig(buttonPinHandle, PIN_BM_IRQ, Board_BUTTON0 | PIN_IRQ_NEGEDGE);
            PIN_setConfig(buttonPinHandle, PIN_BM_IRQ, Board_BUTTON1 | PIN_IRQ_NEGEDGE);
        }
#endif
    }

}

static void updateLcd(void)
{
    char advMode[16] = {0};

    /* get node address if not already done */
    if (nodeAddress == 0)
    {
        nodeAddress = nodeRadioTask_getNodeAddr();
    }

    /* print to LCD */
    Display_clear(hDisplayLcd);
    Display_print1(hDisplayLcd, 0, 0, "NodeID: 0x%02x", nodeAddress);
    Display_print1(hDisplayLcd, 1, 0, "ADC: %04d", latestLuxValue);

    /* print to UART clear screen, put cuser to beggining of terminal and print the header */
    Display_print1(hDisplaySerial, 0, 0, "\033[2J \033[0;0HNode ID: 0x%02x", nodeAddress);
    Display_print1(hDisplaySerial, 0, 0, "Node Lux Reading: %04d", latestLuxValue);

    if (advertisementType == Node_AdertiserMsUrl)
    {
         strncpy(advMode, "BLE MS + URL", 12);
    }
    else if (advertisementType == Node_AdertiserMs)
    {
         strncpy(advMode, "BLE MS", 6);
    }
    else if (advertisementType == Node_AdertiserUrl)
    {
         strncpy(advMode, "Eddystone URL", 13);
    }
    else if (advertisementType == Node_AdertiserUid)
    {
         strncpy(advMode, "Eddystone UID", 13);
    }
    else
    {
         strncpy(advMode, "None", 4);
    }

    /* print to LCD */
    Display_print0(hDisplayLcd, 2, 0, "Adv Mode:");
    Display_print1(hDisplayLcd, 3, 0, "%s", advMode);
    /* print to UART */
    Display_print1(hDisplaySerial, 0, 0, "Advertiser Mode: %s", advMode);
}


void sensorTimerCallback(UArg arg0)
{
    //Check if fast reporting needs to be stopped
    if(fastReportCount < NODE_SENSOR_REPORTINTERVAL_FAST_DURIATION)
    {
        fastReportCount++;
    }
    else if(fastReportCount == NODE_SENSOR_REPORTINTERVAL_FAST_DURIATION)
    {
        Clock_setPeriod(sensorTimerClockHandle, (NODE_SENSOR_REPORTINTERVAL_SLOW_MS * 1000 / Clock_tickPeriod));
        fastReportCount++;
    }

    /* Post event */
    Event_post(nodeEventHandle, NODE_EVENT_READ_SENSOR);
}

/*
 *  ======== buttonCallback ========
 *  Pin interrupt Callback function board buttons configured in the pinTable.
 */
void buttonCallback(PIN_Handle handle, PIN_Id pinId)
{
    /* Debounce logic */
    CPUdelay(8000*50);

    if ((PIN_getInputValue(Board_BUTTON0) == 0) & (PIN_getInputValue(Board_BUTTON1) == 0)) {
#ifdef USE_BIM
        //stop button interupts while checking ble bootload button hold
        PIN_setConfig(buttonPinHandle, PIN_BM_IRQ, Board_BUTTON0 | PIN_IRQ_DIS);
        PIN_setConfig(buttonPinHandle, PIN_BM_IRQ, Board_BUTTON1 | PIN_IRQ_DIS);
        //start BLE bootloader timer to check pins
        Clock_start(bleBootloadBtnCheckClockHandle);
#endif
    }
    else if (PIN_getInputValue(Board_BUTTON0) == 0)
    {
        /* Send Sensor readings now - NodeRadioTask will read the button value */
        Event_post(nodeEventHandle, NODE_EVENT_READ_SENSOR);

        //start fast reporting and timeout
        Clock_stop(sensorTimerClockHandle);
        fastReportCount = 0;
        Clock_setPeriod(sensorTimerClockHandle, (NODE_SENSOR_REPORTINTERVAL_FAST_MS * 1000 / Clock_tickPeriod));
        Clock_start(sensorTimerClockHandle);
    }
    else if (PIN_getInputValue(Board_BUTTON1) == 0)
    {
        //cycle between url, uid and none
        advertisementType++;
        if (advertisementType == Node_AdertiserTypeEnd)
        {
            advertisementType = Node_AdertiserNone;
        }

        /* update display */
        Event_post(nodeEventHandle, NODE_EVENT_UPDATE_LCD);

        //Set advertiement type
        nodeRadioTask_setAdvertiserType(advertisementType);

        //start fast reporting and timeout
        Clock_stop(sensorTimerClockHandle);
        fastReportCount = 0;
        Clock_setPeriod(sensorTimerClockHandle, (NODE_SENSOR_REPORTINTERVAL_FAST_MS * 1000 / Clock_tickPeriod));
        Clock_start(sensorTimerClockHandle);
    }
}

#ifdef USE_BIM
void bleBtnCheckTimerCallback(UArg arg0)
{
    static uint32_t btnHoldCnt = 0;

    if ((PIN_getInputValue(Board_BUTTON0) == 0) & (PIN_getInputValue(Board_BUTTON1) == 0))
    {
        if ( (++btnHoldCnt * NODE_BLE_BOOTLODER_BUTTON_CHECK_TIMER_MS) >
            (NODE_BLE_BOOTLODER_BUTTON_CHECK_DURATION_S*1000))
        {
            Event_post(nodeEventHandle, NODE_EVENT_FACTORY_RESET);
            btnHoldCnt = 0;
        }
        else
        {
            Clock_start(bleBootloadBtnCheckClockHandle);
        }
    }
    else
    {
        btnHoldCnt = 0;
        /* Re-enable interrupts to detect button release. */
        PIN_setConfig(buttonPinHandle, PIN_BM_IRQ, Board_BUTTON0 | PIN_IRQ_NEGEDGE);
        PIN_setConfig(buttonPinHandle, PIN_BM_IRQ, Board_BUTTON1 | PIN_IRQ_NEGEDGE);
    }
}
#endif //USE_BIM
