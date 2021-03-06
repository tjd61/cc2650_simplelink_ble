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
#include <xdc/std.h>
#include <xdc/runtime/System.h>

#include <ti/sysbios/BIOS.h>
#include <ti/sysbios/knl/Task.h>
#include <ti/sysbios/knl/Semaphore.h>
#include <ti/sysbios/knl/Event.h>
#include <ti/sysbios/knl/Clock.h>
#include <ti/drivers/Power.h>
#include <ti/drivers/power/PowerCC26XX.h>

/* Drivers */
#include <ti/drivers/rf/RF.h>
#include <ti/drivers/PIN.h>

/* Board Header files */
#include "Board.h"

#include <stdlib.h>
#include <driverlib/trng.h>
#include <driverlib/aon_batmon.h>
#include <DmNodeRadioTask.h>

#include "easylink/EasyLink.h"
#include "RadioProtocol.h"
#include "seb/SEB.h"


/***** Defines *****/
#define NODERADIO_TASK_STACK_SIZE 1024
#define NODERADIO_TASK_PRIORITY   3

#define RADIO_EVENT_ALL                 0xFFFFFFFF
#define RADIO_EVENT_SEND_ADC_DATA       (uint32_t)(1 << 0)
#define RADIO_EVENT_DATA_ACK_RECEIVED   (uint32_t)(1 << 1)
#define RADIO_EVENT_ACK_TIMEOUT         (uint32_t)(1 << 2)
#define RADIO_EVENT_SEND_FAIL           (uint32_t)(1 << 3)

#define NODERADIO_MAX_RETRIES 2
#define NORERADIO_ACK_TIMEOUT_TIME_MS (160)

#define NODE_0M_TXPOWER    -10

/***** Type declarations *****/
struct RadioOperation {
    EasyLink_TxPacket easyLinkTxPacket;
    uint8_t retriesDone;
    uint8_t maxNumberOfRetries;
    uint32_t ackTimeoutMs;
    enum NodeRadioOperationStatus result;
};


/***** Variable declarations *****/
static Task_Params nodeRadioTaskParams;
Task_Struct nodeRadioTask;        /* not static so you can see in ROV */
static uint8_t nodeRadioTaskStack[NODERADIO_TASK_STACK_SIZE];
Semaphore_Struct radioAccessSem;  /* not static so you can see in ROV */
static Semaphore_Handle radioAccessSemHandle;
Event_Struct radioOperationEvent; /* not static so you can see in ROV */
static Event_Handle radioOperationEventHandle;
Semaphore_Struct radioResultSem;  /* not static so you can see in ROV */
static Semaphore_Handle radioResultSemHandle;
static struct RadioOperation currentRadioOperation;
static uint16_t adcData;
static uint8_t nodeAddress = 0;
static struct DualModeSensorPacket dmSensorPacket;
static Node_AdertiserType advertiserType = Node_AdertiserMsUrl;

/* The Eddystone UID spec advices to use the first 10 bytes of the sha-1 hash
 * of an owned domain or subdonmian. The subdomain of
 * http://www.ti.com/product/CC1350 = 792f082074ebc132032cad5fdaada66154e14e98 */
static uint8_t uidNameSpace[10] = {0x79, 0x2f, 0x08, 0x20, 0x74, 0xeb, 0xc1,
                                   0x32, 0x03, 0x2c};

/* previous Tick count used to calculate uptime for the TLM beacon */
static uint32_t prevTicks;

/* uid Instance should be set to 6 LSB's of IEEE addr */
static uint8_t uidInstanceId[6];

/* propreitory advertisement packet */
static uint8_t localNameAdvertisement[] = {
        0x02, //Length of this Data section
        0x01, //<<Flags>>
        0x02, //LE General Discoverable Mode
        0x18, //Length of this Data section
        0x09, //<<Complete local name>>
        'C', 'C', '1', '3', '5', '0', ' ',
        'L', 'a', 'u', 'n', 'c', 'h',
        'p', 'a', 'd', ' ', '-', ' ', '0', 'x', '0', '0'
        };

/* propreitory advertisement packet */
static uint8_t propAdvertisement[] = {
        0x02, //Length of this section
        0x01, //<<Flags>>
        0x02, //LE General Discoverable Mode
        0x06, //Length of this section
        0xff, //<<Manufacturer Specific Data>>
        0x0d,
        0x00,
        0x03,
        0x00,
        0x00}; //BTN state

SimpleBeacon_Frame propAdvFrame;
SimpleBeacon_Frame localNameAdvFrame;

static uint8_t bleMacAddr[6];

/* Pin driver handle */
extern PIN_Handle ledPinHandle;

/***** Prototypes *****/
static void nodeRadioTaskFunction(UArg arg0, UArg arg1);
static void returnRadioOperationStatus(enum NodeRadioOperationStatus status);
static void sendDmPacket(struct DualModeSensorPacket sensorPacket, uint8_t maxNumberOfRetries, uint32_t ackTimeoutMs);
static void resendPacket();
static void rxDoneCallback(EasyLink_RxPacket * rxPacket, EasyLink_Status status);
static void sendBleAdvertisement(struct DualModeSensorPacket sensorPacket);

/***** Function definitions *****/
void NodeRadioTask_init(void) {

    /* Create semaphore used for exclusive radio access */
    Semaphore_Params semParam;
    Semaphore_Params_init(&semParam);
    Semaphore_construct(&radioAccessSem, 1, &semParam);
    radioAccessSemHandle = Semaphore_handle(&radioAccessSem);

    /* Create semaphore used for callers to wait for result */
    Semaphore_construct(&radioResultSem, 0, &semParam);
    radioResultSemHandle = Semaphore_handle(&radioResultSem);

    /* Create event used internally for state changes */
    Event_Params eventParam;
    Event_Params_init(&eventParam);
    Event_construct(&radioOperationEvent, &eventParam);
    radioOperationEventHandle = Event_handle(&radioOperationEvent);

    /* Create the radio protocol task */
    Task_Params_init(&nodeRadioTaskParams);
    nodeRadioTaskParams.stackSize = NODERADIO_TASK_STACK_SIZE;
    nodeRadioTaskParams.priority = NODERADIO_TASK_PRIORITY;
    nodeRadioTaskParams.stack = &nodeRadioTaskStack;
    Task_construct(&nodeRadioTask, nodeRadioTaskFunction, &nodeRadioTaskParams, NULL);
}

void nodeRadioTask_setAdvertiserType(Node_AdertiserType type) {
    advertiserType = type;
}

uint8_t nodeRadioTask_getNodeAddr(void) {
    return nodeAddress;
}

static void nodeRadioTaskFunction(UArg arg0, UArg arg1)
{
    /* Set mulitclient mode for EasyLink */
    EasyLink_setCtrl(EasyLink_Ctrl_MultiClient_Mode, 1);

    /* Initialize EasyLink */
    if (EasyLink_init(RADIO_EASYLINK_MODULATION) != EasyLink_Status_Success)
    {
        System_abort("EasyLink_init failed");
    }


    /* If you wich to use a frequency other than the default use
     * the below API
     * EasyLink_setFrequency(868000000);
     */

    /* Use the True Random Number Generator to generate sensor node address randomly */;
    Power_setDependency(PowerCC26XX_PERIPH_TRNG);
    TRNGEnable();
    /* Do not accept the same address as the concentrator, in that case get a new random value */
    do
    {
        while (!(TRNGStatusGet() & TRNG_NUMBER_READY))
        {
            //wiat for randum number generator
        }
        nodeAddress = (uint8_t)TRNGNumberGet(TRNG_LOW_WORD);
    } while (nodeAddress == RADIO_CONCENTRATOR_ADDRESS);
    TRNGDisable();
    Power_releaseDependency(PowerCC26XX_PERIPH_TRNG);

    /* Set the filter to the generated random address */
    if (EasyLink_enableRxAddrFilter(&nodeAddress, 1, 1) != EasyLink_Status_Success)
    {
        System_abort("EasyLink_enableRxAddrFilter failed");
    }

    /* Setup ADC sensor packet */
    dmSensorPacket.header.sourceAddress = nodeAddress;
    dmSensorPacket.header.packetType = RADIO_PACKET_TYPE_DM_SENSOR_PACKET;

    /* initialise the Simple Beacon module called dirrectly for Prop Adv
     * Set multiclient mode to true
     */
    SimpleBeacon_init(true);

    /* initialise the Simple Eddystone Beacon module
     * Set multiclient mode to true
     */
    SEB_init(true);

    SEB_initUrl("https://www.ti.com/product/cc1350", NODE_0M_TXPOWER);

    SimpleBeacon_getIeeeAddr(bleMacAddr);

    propAdvFrame.deviceAddress = bleMacAddr;
    propAdvFrame.length = sizeof(propAdvertisement);
    propAdvFrame.pAdvData = propAdvertisement;

    //convert nodeAddress to Ascii hex
    localNameAdvertisement[27] = ((nodeAddress & 0x0F) < 0xa) ?
            (nodeAddress & 0x0F) + 0x30:
            (nodeAddress & 0x0F) - 0xa + 0x41;
    localNameAdvertisement[26] = (((nodeAddress & 0xF0) >> 4) < 0xa) ?
            ((nodeAddress & 0xF0) >> 4) + 0x30:
            ((nodeAddress & 0xF0) >> 4) - 0xa + 0x41;
    localNameAdvFrame.deviceAddress = bleMacAddr;
    localNameAdvFrame.length = sizeof(localNameAdvertisement);
    localNameAdvFrame.pAdvData = localNameAdvertisement;

    /* Initialise previous Tick count used to calculate uptime for the TLM beacon */
    prevTicks = Clock_getTicks();

    /* Enter main task loop */
    while (1)
    {
        /* Wait for an event */
        uint32_t events = Event_pend(radioOperationEventHandle, 0, RADIO_EVENT_ALL, BIOS_WAIT_FOREVER);

        /* If we should send ADC data */
        if (events & RADIO_EVENT_SEND_ADC_DATA)
        {
            uint32_t currentTicks;

            currentTicks = Clock_getTicks();
            //check for wrap around
            if (currentTicks > prevTicks)
            {
                //calculate time since last reading in 0.1s units
                dmSensorPacket.time100MiliSec += ((currentTicks - prevTicks) * Clock_tickPeriod) / 100000;
            }
            else
            {
                //calculate time since last reading in 0.1s units
                dmSensorPacket.time100MiliSec += ((prevTicks - currentTicks) * Clock_tickPeriod) / 100000;
            }
            prevTicks = currentTicks;

            dmSensorPacket.batt = AONBatMonBatteryVoltageGet();
            dmSensorPacket.adcValue = adcData;
            dmSensorPacket.button = !PIN_getInputValue(Board_BUTTON0);

            if (advertiserType != Node_AdertiserNone)
            {
                sendBleAdvertisement(dmSensorPacket);
            }

            sendDmPacket(dmSensorPacket, NODERADIO_MAX_RETRIES, NORERADIO_ACK_TIMEOUT_TIME_MS);
        }

        /* If we get an ACK from the concentrator */
        if (events & RADIO_EVENT_DATA_ACK_RECEIVED)
        {
            returnRadioOperationStatus(NodeRadioStatus_Success);
        }

        /* If we get an ACK timeout */
        if (events & RADIO_EVENT_ACK_TIMEOUT)
        {

            /* If we haven't resent it the maximum number of times yet, then resend packet */
            if (currentRadioOperation.retriesDone < currentRadioOperation.maxNumberOfRetries)
            {
                resendPacket();
            }
            else
            {
                /* Else return send fail */
                Event_post(radioOperationEventHandle, RADIO_EVENT_SEND_FAIL);
            }
        }

        /* If send fail */
        if (events & RADIO_EVENT_SEND_FAIL)
        {
            returnRadioOperationStatus(NodeRadioStatus_Failed);
        }

    }
}

enum NodeRadioOperationStatus NodeRadioTask_sendAdcData(uint16_t data)
{
    enum NodeRadioOperationStatus status;

    /* Get radio access sempahore */
    Semaphore_pend(radioAccessSemHandle, BIOS_WAIT_FOREVER);

    /* Save data to send */
    adcData = data;

    /* Raise RADIO_EVENT_SEND_ADC_DATA event */
    Event_post(radioOperationEventHandle, RADIO_EVENT_SEND_ADC_DATA);

    /* Wait for result */
    Semaphore_pend(radioResultSemHandle, BIOS_WAIT_FOREVER);

    /* Get result */
    status = currentRadioOperation.result;

    /* Return radio access semaphore */
    Semaphore_post(radioAccessSemHandle);

    return status;
}

static void returnRadioOperationStatus(enum NodeRadioOperationStatus result)
{
    /* Save result */
    currentRadioOperation.result = result;

    /* Post result semaphore */
    Semaphore_post(radioResultSemHandle);
}

static void sendDmPacket(struct DualModeSensorPacket sensorPacket, uint8_t maxNumberOfRetries, uint32_t ackTimeoutMs)
{
    /* Set destination address in EasyLink API */
    currentRadioOperation.easyLinkTxPacket.dstAddr[0] = RADIO_CONCENTRATOR_ADDRESS;

    /* Copy ADC packet to payload
     * Note that the EasyLink API will implcitily both add the length byte and the destination address byte. */
    memcpy(currentRadioOperation.easyLinkTxPacket.payload, ((uint8_t*)&dmSensorPacket), sizeof(struct DualModeSensorPacket));
    currentRadioOperation.easyLinkTxPacket.len = sizeof(struct DualModeSensorPacket);

    /* Setup retries */
    currentRadioOperation.maxNumberOfRetries = maxNumberOfRetries;
    currentRadioOperation.ackTimeoutMs = ackTimeoutMs;
    currentRadioOperation.retriesDone = 0;
    EasyLink_setCtrl(EasyLink_Ctrl_AsyncRx_TimeOut, EasyLink_ms_To_RadioTime(ackTimeoutMs));

    /* Send packet  */
    if (EasyLink_transmit(&currentRadioOperation.easyLinkTxPacket) != EasyLink_Status_Success)
    {
        System_abort("EasyLink_transmit failed");
    }

    /* Enter RX */
    if (EasyLink_receiveAsync(rxDoneCallback, 0) != EasyLink_Status_Success)
    {
        System_abort("EasyLink_receiveAsync failed");
    }
}

static void resendPacket()
{
    /* Send packet  */
    if (EasyLink_transmit(&currentRadioOperation.easyLinkTxPacket) != EasyLink_Status_Success)
    {
        System_abort("EasyLink_transmit failed");
    }

    /* Enter RX and wait for ACK with timeout */
    if (EasyLink_receiveAsync(rxDoneCallback, 0) != EasyLink_Status_Success)
    {
        System_abort("EasyLink_receiveAsync failed");
    }

    /* Increase retries by one */
    currentRadioOperation.retriesDone++;
}

static void sendBleAdvertisement(struct DualModeSensorPacket sensorPacket)
{
    uint8_t txCnt, chan;

    //Prepare TLM frame interleaved with URL and UID
    if ((advertiserType == Node_AdertiserUrl) ||
        (advertiserType == Node_AdertiserMsUrl))
    {
        SEB_initTLM(sensorPacket.batt, sensorPacket.adcValue, sensorPacket.time100MiliSec);
    }

    if (advertiserType == Node_AdertiserUid)
    {
        //Prepare TLM frame interleaved with URL and UID
        SEB_initTLM(sensorPacket.batt, sensorPacket.adcValue, sensorPacket.time100MiliSec);

        //Set uid intance for the eddystone UID frame
        uidInstanceId[0] = sensorPacket.header.sourceAddress;
        SEB_initUID(uidNameSpace, uidInstanceId, NODE_0M_TXPOWER);
    }

    for (txCnt = 0; txCnt < SimpleBeacon_AdvertisementTimes; txCnt++)
    {
        for (chan = 37; chan < 40; chan++)
        {
            if ((advertiserType == Node_AdertiserMs) ||
                (advertiserType == Node_AdertiserMsUrl))
            {
                //set BTN value in Prop advertisement
                propAdvertisement[9] = !PIN_getInputValue(Board_BUTTON0);

                //advertisement advertise local name
                SimpleBeacon_sendFrame(localNameAdvFrame,  1, (uint64_t) 1<<chan);
                //advertisement advertise button value
                SimpleBeacon_sendFrame(propAdvFrame, 1, (uint64_t) 1<<chan);
            }
            if ((advertiserType == Node_AdertiserUrl) ||
                (advertiserType == Node_AdertiserMsUrl))
            {
                SEB_sendFrame(SEB_FrameType_Url, bleMacAddr, 1, (uint64_t) 1<<chan);
                SEB_sendFrame(SEB_FrameType_Tlm, bleMacAddr, 1, (uint64_t) 1<<chan);
            }
            if (advertiserType == Node_AdertiserUid)
            {
                SEB_sendFrame(SEB_FrameType_Uuid, bleMacAddr, 1, (uint64_t) 1<<chan);
                SEB_sendFrame(SEB_FrameType_Tlm, bleMacAddr, 1, (uint64_t) 1<<chan);
            }
        }
        //sleep on all but last advertisement
        if(txCnt+1 < SimpleBeacon_AdvertisementTimes)
        {
            Task_sleep(SimpleBeacon_AdvertisementIntervals[txCnt]);
        }
    }

    /* Toggle activity LED */
    PIN_setOutputValue(ledPinHandle, NODE_BLE_ACTIVITY_LED,!PIN_getOutputValue(NODE_BLE_ACTIVITY_LED));
}

static void rxDoneCallback(EasyLink_RxPacket * rxPacket, EasyLink_Status status)
{
    struct PacketHeader* packetHeader;

    /* If this callback is called because of a packet received */
    if (status == EasyLink_Status_Success)
    {
        /* Check the payload header */
        packetHeader = (struct PacketHeader*)rxPacket->payload;

        /* Check if this is an ACK packet */
        if (packetHeader->packetType == RADIO_PACKET_TYPE_ACK_PACKET)
        {
            /* Signal ACK packet received */
            Event_post(radioOperationEventHandle, RADIO_EVENT_DATA_ACK_RECEIVED);
        }
        else
        {
            /* Packet Error, treat as a Timeout and Post a RADIO_EVENT_ACK_TIMEOUT
               event */
            Event_post(radioOperationEventHandle, RADIO_EVENT_ACK_TIMEOUT);
        }
    }
    /* did the Rx timeout */
    else if(status == EasyLink_Status_Rx_Timeout)
    {
        /* Post a RADIO_EVENT_ACK_TIMEOUT event */
        Event_post(radioOperationEventHandle, RADIO_EVENT_ACK_TIMEOUT);
    }
    else
    {
        /* Rx Error, treat as a Timeout and Post a RADIO_EVENT_ACK_TIMEOUT
           event */
        Event_post(radioOperationEventHandle, RADIO_EVENT_ACK_TIMEOUT);
    }

}
