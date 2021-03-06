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

#include <stdint.h>
#include <stdbool.h>
#include <xdc/runtime/Assert.h>
#include <xdc/runtime/Diags.h>
#include <xdc/runtime/Error.h>
#include <xdc/runtime/Log.h>

#include <ti/drivers/PIN.h>
#include <ti/drivers/GPIO.h>
#include <ti/drivers/gpio/GPIOCC26XX.h>
#include <ti/drivers/ports/DebugP.h>
#include <ti/drivers/Power.h>
#include <ti/drivers/power/PowerCC26XX.h>

#include <ti/sysbios/family/arm/m3/Hwi.h>

#include <inc/hw_ints.h>
#include <driverlib/interrupt.h>
#include <driverlib/prcm.h>
#include <driverlib/gpio.h>
#include <driverlib/ioc.h>

#if defined(__IAR_SYSTEMS_ICC__)
#include <intrinsics.h>
#define PIN2IOID(pin) 	(31 - __CLZ(pin))
#define IOID2PIN(ioid) 	(1 << ioid)
#endif

#if defined(__TI_COMPILER_VERSION__)
#define PIN2IOID(pin) 	(31 - __clz(pin))
#define IOID2PIN(ioid) 	(1 << ioid)
#endif

#if defined(__GNUC__) && !defined(__TI_COMPILER_VERSION__)
#define PIN2IOID(pin) 	(31 - __builtin_clz(pin))
#define IOID2PIN(ioid) 	(1 << ioid)
#endif

#if defined(__IAR_SYSTEMS_ICC__)
#include <intrinsics.h>
#endif

/*
 * By default disable both asserts and log for this module.
 * This must be done before DebugP.h is included.
 */
#ifndef DebugP_ASSERT_ENABLED
#define DebugP_ASSERT_ENABLED 0
#endif
#ifndef DebugP_LOG_ENABLED
#define DebugP_LOG_ENABLED 0
#endif

static PIN_State gpioPinState;
static PIN_Handle gpioPinHandle;
static PIN_Config gpioPinTable[] = {
    PIN_TERMINATE
};

/*
 * Map GPIO_INT types to corresponding PIN interrupt options
 */
static const uint32_t interruptType[] = {
    0,                  /* Undefined interrupt type */
    PIN_IRQ_NEGEDGE,    /* Interrupt on falling edge */
    PIN_IRQ_POSEDGE,    /* Interrupt on rising edge */
    PIN_IRQ_BOTHEDGES,  /* Interrupt on both edges */
    0,                  /* Interrupt on low level, not supported */
    0                   /* Interrupt on high level, not supported */
};

/* Table of GPIO input types */
const uint32_t inPinTypes [] = {
    PIN_INPUT_EN | PIN_NOPULL,      /* GPIO_CFG_IN_NOPULL */
    PIN_INPUT_EN | PIN_PULLUP,      /* GPIO_CFG_IN_PU */
    PIN_INPUT_EN | PIN_PULLDOWN     /* GPIO_CFG_IN_PD */
};

/* Table of GPIO output types */
const uint32_t outPinTypes [] = {
    PIN_GPIO_OUTPUT_EN | PIN_PUSHPULL,                   /* GPIO_CFG_OUT_STD */
    PIN_GPIO_OUTPUT_EN | PIN_OPENDRAIN | PIN_NOPULL,     /* GPIO_CFG_OUT_OD_NOPULL */
    PIN_GPIO_OUTPUT_EN | PIN_OPENDRAIN | PIN_PULLUP,     /* GPIO_CFG_OUT_OD_PU */
    PIN_GPIO_OUTPUT_EN | PIN_OPENDRAIN | PIN_PULLDOWN    /* GPIO_CFG_OUT_OD_PD */
};

/* Table of GPIO drive strengths */
const uint32_t outPinStrengths [] = {
    PIN_DRVSTR_MIN,    /* GPIO_CFG_OUT_STR_LOW */
    PIN_DRVSTR_MED,    /* GPIO_CFG_OUT_STR_MED */
    PIN_DRVSTR_MAX     /* GPIO_CFG_OUT_STR_HIGH */
};

//static const uint32_t powerResources[] = {
//    PowerCC26XX_PERIPH_GPIOA0,
//};

#define NUM_PORTS           1
#define NUM_PINS_PER_PORT   32

/*
 * Extracts the GPIO interrupt type from the pinConfig.  Value to index into the
 * interruptType table.
 */
#define getIntTypeNumber(pinConfig) \
    ((pinConfig & GPIO_CFG_INT_MASK) >> GPIO_CFG_INT_LSB)

/* Returns the GPIO power resource ID */
#define getPowerResource(port) (powerResources[port])

/* Returns GPIO number from the pinConfig */
#define getGpioNumber(pinConfig) IOD2PIN(pinConfig->ioid))

/* Uninitialized callbackInfo pinIndex */
#define CALLBACK_INDEX_NOT_CONFIGURED 0xFF

/*
 * Device specific interpretation of the GPIO_PinConfig content
 */
typedef struct PinConfig {
    uint8_t ioid;
    uint8_t added;  /* 0 = pin has not been added to gpioPinState */
    uint16_t config;
} PinConfig;

/*
 * User defined pin indexes assigned to a port's pins.
 * Used by pin callback function to locate callback assigned
 * to a pin.
 */
typedef struct PortCallbackInfo {
    /*
     * the port's corresponding
     * user defined pinId indices
     */
    uint8_t pinIndex[NUM_PINS_PER_PORT];
} PortCallbackInfo;

/*
 * Only one PortCallbackInfo object is needed for CC26xx since the 32 pins
 * are all on one port.
 */
static PortCallbackInfo gpioCallbackInfo;

/*
 *  Bit mask used to keep track of which of the GPIO objects in the config
 *  structure have interrupts enabled.  This will be used to restore the
 *  interrupts after coming out of LPDS.
 */
static uint32_t configIntsEnabledMask = 0;

#if DebugP_ASSERT_ENABLED
/*
 * Internal boolean to confirm that GPIO_init() has been called.
 */
static bool initCalled = false;
#endif

/* Notification for going into and waking up from LPDS */
static Power_NotifyObj powerNotifyObj;

extern const GPIOCC26XX_Config GPIOCC26XX_config;

static int powerPostNotify(unsigned int eventType, uintptr_t eventArg,
    uintptr_t clientArg);

/*
 *  ======== getPinNumber ========
 *
 *  Internal function to efficiently find the index of the right most set bit.
 */
static inline uint32_t getPinNumber(uint32_t x) {
    return(x); /* ioid is the same as the pinNumber */
}

/*
 *  ======== GPIO_clearInt ========
 */
void GPIO_clearInt(unsigned int index)
{
    PinConfig *config = (PinConfig *) &GPIOCC26XX_config.pinConfigs[index];

    DebugP_assert(initCalled && index < GPIOCC26XX_config.numberOfPinConfigs);

    /* Clear interrupt flag */
    IOCIntClear(config->ioid);

    DebugP_log1("GPIO: Pin 0x%x interrupt flag cleared", config->ioid);
}

/*
 *  ======== GPIO_disableInt ========
 */
void GPIO_disableInt(unsigned int index)
{
    unsigned int key;
    PinConfig *config = (PinConfig *) &GPIOCC26XX_config.pinConfigs[index];

    DebugP_assert(initCalled && index < GPIOCC26XX_config.numberOfPinConfigs);

    /* Make atomic update */
    key = Hwi_disable();

    /* Disable interrupt. */
    IOCIntDisable(config->ioid);

    configIntsEnabledMask &= ~(1 << index);

    Hwi_restore(key);

    DebugP_log1("GPIO: Pin 0x%x interrupts disabled", config->ioid);
}

/*
 *  ======== GPIO_enableInt ========
 */
void GPIO_enableInt(unsigned int index)
{
    unsigned int key;
    PinConfig *config = (PinConfig *) &GPIOCC26XX_config.pinConfigs[index];

    DebugP_assert(initCalled && index < GPIOCC26XX_config.numberOfPinConfigs);

    /* Make atomic update */
    key = Hwi_disable();

    /* Disable interrupt. */
    IOCIntEnable(config->ioid);

    configIntsEnabledMask |= (1 << index);

    Hwi_restore(key);

    DebugP_log1("GPIO: Pin 0x%x interrupts enabled", config->ioid);
}

/*
 *  ======== GPIO_hwiIntFxn ========
 *  Hwi function that processes GPIO interrupts.
 */
void GPIO_hwiIntFxn(PIN_Handle pinHandle, PIN_Id pinId)
{
    unsigned int      pinIndex;

    pinIndex = gpioCallbackInfo.pinIndex[pinId];

    /* only call plugged callbacks */
    if (pinIndex != CALLBACK_INDEX_NOT_CONFIGURED) {
        GPIOCC26XX_config.callbacks[pinIndex](pinIndex);
    }
}

/*
 *  ======== GPIO_init ========
 */
void GPIO_init()
{
    unsigned int i;

#if DebugP_ASSERT_ENABLED
    initCalled = true;
#endif

    gpioPinHandle = PIN_open(&gpioPinState, gpioPinTable);

    /* install our Hwi callback function */
    PIN_registerIntCb(gpioPinHandle, GPIO_hwiIntFxn);

    for (i = 0; i < NUM_PINS_PER_PORT; i++) {
        gpioCallbackInfo.pinIndex[i] = CALLBACK_INDEX_NOT_CONFIGURED;
    }

    /*
     * Configure pins and create Hwis per static array content
     */
    for (i = 0; i < GPIOCC26XX_config.numberOfPinConfigs; i++) {
        if (!(GPIOCC26XX_config.pinConfigs[i] & GPIO_DO_NOT_CONFIG)) {
            GPIO_setConfig(i, GPIOCC26XX_config.pinConfigs[i]);
        }
        if (i < GPIOCC26XX_config.numberOfCallbacks) {
            if (GPIOCC26XX_config.callbacks[i] != NULL) {
                /* create Hwi as necessary */
                GPIO_setCallback(i, GPIOCC26XX_config.callbacks[i]);
            }
        }
    }

    Power_registerNotify(&powerNotifyObj,
            PowerCC26XX_AWAKE_STANDBY,
            powerPostNotify, NULL);
}

/*
 *  ======== GPIO_read ========
 */
unsigned int GPIO_read(unsigned int index)
{
    unsigned int value;

    PinConfig *config = (PinConfig *) &GPIOCC26XX_config.pinConfigs[index];

    DebugP_assert(initCalled && index < GPIOCC26XX_config.numberOfPinConfigs);

    value = GPIO_readMultiDio(IOID2PIN(config->ioid));

    DebugP_log2("GPIO: Pin 0x%x read 0x%x", config->ioid, value);

    value = value & (IOID2PIN(config->ioid)) ? 1 : 0;

    return (value);
}

/*
 *  ======== GPIO_setCallback ========
 */
void GPIO_setCallback(unsigned int index, GPIO_CallbackFxn callback)
{
    uint32_t   pinNum;
    PinConfig *config = (PinConfig *) &GPIOCC26XX_config.pinConfigs[index];

    DebugP_assert(initCalled && index < GPIOCC26XX_config.numberOfCallbacks);

    /*
     * plug the pin index into the corresponding
     * port's callbackInfo pinIndex entry
     */
    pinNum = getPinNumber(config->ioid);

    if (callback == NULL) {
        gpioCallbackInfo.pinIndex[pinNum] =
            CALLBACK_INDEX_NOT_CONFIGURED;
    }
    else {
        gpioCallbackInfo.pinIndex[pinNum] = index;
    }

    /*
     * Only update callBackFunctions entry if different.
     * This allows the callBackFunctions array to be in flash for static systems.
     */
    if (GPIOCC26XX_config.callbacks[index] != callback) {
        GPIOCC26XX_config.callbacks[index] = callback;
    }
}

/*
 *  ======== GPIO_setConfig ========
 */
void GPIO_setConfig(unsigned int index, GPIO_PinConfig pinConfig)
{
    unsigned int key;
    uint16_t direction;
    GPIO_PinConfig gpioPinConfig;
    PIN_Config pinPinConfig = 0; /* PIN driver PIN_config ! */
    PinConfig *config = (PinConfig *) &GPIOCC26XX_config.pinConfigs[index];

    DebugP_assert(initCalled && index < GPIOCC26XX_config.numberOfPinConfigs);

    if (pinPinConfig & GPIO_DO_NOT_CONFIG) {
        return;
    }

    if ((pinConfig & GPIO_CFG_IN_INT_ONLY) == 0) {
        if (pinConfig & GPIO_CFG_INPUT) {
            /* configure input */
            direction = GPIO_OUTPUT_DISABLE;
            pinPinConfig = inPinTypes[(pinConfig & GPIO_CFG_IN_TYPE_MASK) >>
                GPIO_CFG_IN_TYPE_LSB];
        }
        else {
            /* configure output */
            direction = GPIO_OUTPUT_ENABLE;
            pinPinConfig = outPinTypes[(pinConfig & GPIO_CFG_OUT_TYPE_MASK) >>
                GPIO_CFG_OUT_TYPE_LSB];
            pinPinConfig |=
                outPinStrengths[(pinConfig & GPIO_CFG_OUT_STRENGTH_MASK) >>
                GPIO_CFG_OUT_STRENGTH_LSB];
        }

        key = Hwi_disable();

        /* Set output value */
        if (direction == GPIO_OUTPUT_ENABLE) {
            pinPinConfig |= ((pinConfig & GPIO_CFG_OUT_HIGH) ? PIN_GPIO_HIGH : PIN_GPIO_LOW);
        }

        /*
         *  Update pinConfig with the latest GPIO configuration and
         *  clear the GPIO_DO_NOT_CONFIG bit if it was set.
         */
        gpioPinConfig = GPIOCC26XX_config.pinConfigs[index];
        gpioPinConfig &= ~(GPIO_CFG_IO_MASK | GPIO_DO_NOT_CONFIG);
        gpioPinConfig |= (pinConfig & GPIO_CFG_IO_MASK);
        GPIOCC26XX_config.pinConfigs[index] = gpioPinConfig;

        Hwi_restore(key);
    }

    /* Set type of interrupt and then clear it */
    if (pinConfig & GPIO_CFG_INT_MASK) {
        key = Hwi_disable();

        /*
         *  Update pinConfig with the latest interrupt configuration and
         *  clear the GPIO_DO_NOT_CONFIG bit if it was set.
         */
        gpioPinConfig = GPIOCC26XX_config.pinConfigs[index];
        gpioPinConfig &= ~(GPIO_CFG_INT_MASK | GPIO_DO_NOT_CONFIG);
        gpioPinConfig |= (pinConfig & GPIO_CFG_INT_MASK);
        GPIOCC26XX_config.pinConfigs[index] = gpioPinConfig;

        pinPinConfig |= interruptType[(pinConfig & GPIO_CFG_INT_MASK) >>
                        GPIO_CFG_INT_LSB];
        Hwi_restore(key);
    }

    /* or in the pin ID */
    pinPinConfig |= config->ioid;

    if (config->added == 0) {
        PIN_add(gpioPinHandle, pinPinConfig);
        config->added = 1;
    }
    else {
        uint32_t bmMask;
        if (pinConfig & GPIO_CFG_IN_INT_ONLY) {
            bmMask = PIN_BM_IRQ;
        }
        else {
            bmMask = PIN_BM_ALL;
        }
        PIN_setConfig(gpioPinHandle, bmMask, pinPinConfig);
    }
}

/*
 *  ======== GPIO_toggle ========
 */
void GPIO_toggle(unsigned int index)
{
    unsigned int key;
    PinConfig *config = (PinConfig *) &GPIOCC26XX_config.pinConfigs[index];

    DebugP_assert(initCalled && index < GPIOCC26XX_config.numberOfPinConfigs);
    DebugP_assert((GPIOCC26XX_config.pinConfigs[index] & GPIO_CFG_INPUT) ==
        GPIO_CFG_OUTPUT);

    /* Make atomic update */
    key = Hwi_disable();

    GPIO_toggleDio(config->ioid);

    /* Update config table entry with value written */
    GPIOCC26XX_config.pinConfigs[index] ^= GPIO_CFG_OUT_HIGH;

    Hwi_restore(key);

    DebugP_log1("GPIO: Pin 0x%x toggled", config->ioid);
}

/*
 *  ======== GPIO_write ========
 */
void GPIO_write(unsigned int index, unsigned int value)
{
    unsigned int key;
    PinConfig *config = (PinConfig *) &GPIOCC26XX_config.pinConfigs[index];

    DebugP_assert(initCalled && index < GPIOCC26XX_config.numberOfPinConfigs);
    DebugP_assert((GPIOCC26XX_config.pinConfigs[index] & GPIO_CFG_INPUT) ==
        GPIO_CFG_OUTPUT);

    key = Hwi_disable();

    if (value) {
        /* Set the pinConfig output bit to high */
        GPIOCC26XX_config.pinConfigs[index] |= GPIO_CFG_OUT_HIGH;
    }
    else {
        /* Clear output from pinConfig */
        GPIOCC26XX_config.pinConfigs[index] &= ~GPIO_CFG_OUT_HIGH;
    }

    value = value ? IOID2PIN(config->ioid) : 0;

    GPIO_writeMultiDio(IOID2PIN(config->ioid), value);

    Hwi_restore(key);

    DebugP_log2("GPIO: Pin 0x%x wrote 0x%x", config->ioid, value);
}

/*
 *  ======== powerNotify ========
 */
static int powerPostNotify(unsigned int eventType, uintptr_t eventArg,
    uintptr_t clientArg)
{
    unsigned int   i;
    GPIO_PinConfig config;

    if (eventType == PowerCC26XX_AWAKE_STANDBY) {
        for (i = 0; i < GPIOCC26XX_config.numberOfPinConfigs; i++) {
            if (!(GPIOCC26XX_config.pinConfigs[i] & GPIO_DO_NOT_CONFIG)) {
                config = GPIOCC26XX_config.pinConfigs[i];

                GPIO_setConfig(i, config);

                if (configIntsEnabledMask & (1 << i)) {
                    GPIO_enableInt(i);
                }
            }
        }
    }
    return (Power_NOTIFYDONE);
}

/*
 *  ======== GPIOCC26xx_release ========
 */
void GPIOCC26xx_release(int index)
{
    PinConfig *config = (PinConfig *) &GPIOCC26XX_config.pinConfigs[index];
    unsigned int key;

    key = Hwi_disable();

    if (config->added) {
        /* disable the pin's interrupt */
        GPIO_disableInt(index);

        /* remove its callback */
        GPIO_setCallback(index, NULL);

        config->added = 0;

        PIN_remove(gpioPinHandle, config->ioid);
    }

    Hwi_restore(key);
}
