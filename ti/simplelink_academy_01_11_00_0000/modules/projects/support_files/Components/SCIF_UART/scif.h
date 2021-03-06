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

/** \mainpage Driver Overview
  *
  * \section section_drv_info Driver Information
  * This Sensor Controller Interface driver has been generated by the Texas Instruments Sensor Controller
  * Studio tool:
  * - <b>Project name</b>:     UART Emulator
  * - <b>Code prefix</b>:      -
  * - <b>Operating system</b>: TI-RTOS
  * - <b>Tool version</b>:     1.1.0.38192
  * - <b>Target chip</b>:      CC2650, revision -, package QFN48 7x7 RGZ
  * - <b>Created</b>:          2016-01-25 15:57:15.379
  *
  * Do not edit the generated source code files other than temporarily for debug purposes. Any
  * modifications will be overwritten by the Sensor Controller Studio when generating new output.
  *
  * \section section_drv_modules Driver Modules
  * The driver is divided into three modules:
  * - \ref module_scif_generic_interface, providing the API for:
  *     - Initializing and uninitializing the driver
  *     - Task control (for starting, stopping and executing Sensor Controller tasks)
  *     - Task data exchange (for producing input data to and consume output data from Sensor Controller
  *       tasks)
  * - \ref module_scif_driver_setup, containing:
  *     - The AUX RAM image (i.e. Sensor Controller code and data)
  *     - I/O mapping information
  *     - Task data structure information
  *     - Driver setup data, to be used in the driver initialization
  *     - Project-specific functionality
  * - \ref module_scif_osal, for flexible OS support:
  *     - Interfaces with the selected operating system
  *
  * It is possible to use output from multiple Sensor Controller Studio projects in one application. Only
  * one driver setup may be active at a time, but it is possible to switch between these setups. When
  * using this option, there is one instance of the \ref module_scif_generic_interface and
  * \ref module_scif_osal modules, and multiple instances of the \ref module_scif_driver_setup module.
  * This requires that:
  * - The outputs must be generated using the same version of Sensor Controller Studio
  * - The outputs must use the same operating system
  * - The outputs must use different source code prefixes (inserted into all globals of the
  *   \ref module_scif_driver_setup)
  *
  *
  * \section section_project_info Project Description
  * Demonstrates the UART Emulator functionality on the SmartRF06 Evaluation Board
  *
  * See the description of the UART Emulator resource for details.
  * The System CPU application implements simple loop-back of received data. The UART RX and TX pins are
  * mapped to the SmartRF06EB's USB Serial Port.
  *
  * See the header in the application source file ("main.c" or similar) for further details and
  * instructions. This file is located in the source code output directory.
  *
  *
  * \subsection section_io_mapping I/O Mapping
  * Task I/O functions are mapped to the following pins:
  * - UART Emulator:
  *     - <b>UART RX</b>: DIO2
  *     - <b>UART TX</b>: DIO3
  *
  *
  * \section section_task_info Task Description(s)
  * This driver supports the following task(s):
  *
  *
  * \subsection section_task_desc_uart_emulator UART Emulator
  * Emulates a UART interface.
  *
  * See the description of the UART Emulator resource for details.
  *
  */




/** \addtogroup module_scif_driver_setup Driver Setup
  *
  * \section section_driver_setup_overview Overview
  *
  * This driver setup instance has been generated for:
  * - <b>Project name</b>:     UART Emulator
  * - <b>Code prefix</b>:      -
  *
  * The driver setup module contains the generated output from the Sensor Controller Studio project:
  * - Location of task control and scheduling data structures in AUX RAM
  * - The AUX RAM image, and the size the image
  * - Task data structure information (location, size and buffer count)
  * - I/O pin mapping translation table
  * - Task resource initialization and uninitialization functions
  *
  * @{
  */
#ifndef SCIF_H
#define SCIF_H

#include <stdint.h>
#include <stdbool.h>
#include "scif_framework.h"
#include "scif_osal_tirtos.h"


/// Number of tasks implemented by this driver
#define SCIF_TASK_COUNT 1

/// UART Emulator: Task ID
#define SCIF_UART_EMULATOR_TASK_ID 0


/// UART Emulator I/O mapping: UART RX
#define SCIF_UART_EMULATOR_DIO_UART_RX 2
/// UART Emulator I/O mapping: UART TX
#define SCIF_UART_EMULATOR_DIO_UART_TX 3


// All shared data structures in AUX RAM need to be packed
#pragma pack(push, 2)


/// UART Emulator: Task configuration structure
typedef struct {
    uint16_t alertMask;            ///< Bit-vector selecting which UART events trigger ALERT interrupt
    uint16_t alertRxFifoThr;       ///< Number of bytes (or higher) in the RX FIFO that triggers ALERT interrupt
    uint16_t alertTxFifoThr;       ///< Number of bytes (or lower) in the TX FIFO that triggers ALERT interrupt
    uint16_t rxByteTimeout;        ///< Maximum number of idle half bit-periods after a received byte before indicating timeout
    uint16_t rxEnableReqIdleCount; ///< Required number of idle half-bits before enabling RX.
} SCIF_UART_EMULATOR_CFG_T;


/// UART Emulator: Task input data structure
typedef struct {
    uint16_t pTxBuffer[128]; ///< TX FIFO ring buffer
    uint16_t rxTail;         ///< RX FIFO tail index (updated by the application)
    uint16_t txHead;         ///< TX FIFO head index (updated by the application)
} SCIF_UART_EMULATOR_INPUT_T;


/// UART Emulator: Task output data structure
typedef struct {
    uint16_t pRxBuffer[128]; ///< RX FIFO ring buffer
    uint16_t rxHead;         ///< RX FIFO head index (updated by the Sensor Controller)
    uint16_t txTail;         ///< TX FIFO tail index (updated by the Sensor Controller)
} SCIF_UART_EMULATOR_OUTPUT_T;


/// UART Emulator: Task state structure
typedef struct {
    uint16_t alertBacklog; ///< Bit-vector of events not yet communicated to the application
    uint16_t alertEvents;  ///< Bit-vector of events communicated to the application in the last ALERT interrupt
    uint16_t exit;         ///< Set to exit the UART emulator
    uint16_t rxEnable;     ///< Set to enable RX, or clear to disable RX (controls whether start bits are detected)
    uint16_t rxEnabled;    ///< Is RX currently enabled?
} SCIF_UART_EMULATOR_STATE_T;


/// Sensor Controller task data (configuration, input buffer(s), output buffer(s) and internal state)
typedef struct {
    struct {
        SCIF_UART_EMULATOR_CFG_T cfg;
        SCIF_UART_EMULATOR_INPUT_T input;
        SCIF_UART_EMULATOR_OUTPUT_T output;
        SCIF_UART_EMULATOR_STATE_T state;
    } uartEmulator;
} SCIF_TASK_DATA_T;

/// Sensor Controller task generic control (located in AUX RAM)
#define scifTaskData    (*((volatile SCIF_TASK_DATA_T*) 0x400E00E6))


// Initialized internal driver data, to be used in the call to \ref scifInit()
extern const SCIF_DATA_T scifDriverSetup;


// Restore previous struct packing setting
#pragma pack(pop)


/// Maximum number of characters that can be stored in the UART TX FIFO
#define SCIF_UART_TX_FIFO_MAX_COUNT                  127
/// Maximum number of characters that can be stored in the UART RX FIFO
#define SCIF_UART_RX_FIFO_MAX_COUNT                  127

/// RX character flag: RX timeout occurred after receiving this character
#define BV_SCIF_UART_RX_TIMEOUT                      0x0800
/// RX character flag: RX FIFO ran full when receiving this character (this character may be invalid)
#define BV_SCIF_UART_RX_OVERFLOW                     0x0400
/// RX character flag: Break occurred when receiving this character
#define BV_SCIF_UART_RX_BREAK                        0x0200
/// RX character flag: Framing error occurred when receiving this character
#define BV_SCIF_UART_RX_FRAMING_ERROR                0x0100

/// UART ALERT event: RX FIFO at or above the specified threshold
#define BV_SCIF_UART_ALERT_RX_FIFO_ABOVE_THR         0x0001
/// UART ALERT event: RX byte timeout occurred
#define BV_SCIF_UART_ALERT_RX_BYTE_TIMEOUT           0x0002
/// UART ALERT event: Break or framing error occurred
#define BV_SCIF_UART_ALERT_RX_BREAK_OR_FRAMING_ERROR 0x0004
/// UART ALERT event: TX FIFO at or below the specified threshold
#define BV_SCIF_UART_ALERT_TX_FIFO_BELOW_THR         0x0008


// UART control functions
void scifUartSetRxTimeout(uint16_t rxTimeout);
void scifUartSetRxEnableReqIdleCount(uint16_t rxEnableReqIdleCount);
void scifUartRxEnable(uint16_t rxEnable);
void scifUartStopEmulator(void);
void scifUartSetBaudRate(uint32_t baudRate);

// UART RX FIFO access functions
uint32_t scifUartGetRxFifoCount(void);
uint16_t scifUartRxGetChar(void);
void scifUartRxGetChars(char* pBuffer, uint32_t count);
void scifUartRxGetCharsWithFlags(uint16_t* pBuffer, uint32_t count);

// UART TX FIFO access functions
uint32_t scifUartGetTxFifoCount(void);
void scifUartTxPutChar(char c);
void scifUartTxPutCharDelayed(char c, uint8_t delay);
void scifUartTxPutChars(char* pBuffer, uint32_t count);

// UART event/interrupt functions
uint16_t scifUartGetEvents(void);
void scifUartClearEvents(void);
void scifUartSetEventMask(uint16_t mask);


#endif
//@}
