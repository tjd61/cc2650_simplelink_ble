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
#include <inc/hw_types.h>
#include <inc/hw_memmap.h>
#include <driverlib/prcm.h>
#include "scif.h"
#include "SCUartDisplay.h"

/*********************************************************************
 * MACROS
 */
#define BV(n)                   (1 << (n))
#define SERIAL_FORM_FEED		12

/*!
 * @brief Open the Sensor Controller UART emulator image
 *
 * @param baudRate    Baud rate of the emulated UART
 */
void SCUartDisplay_open(uint32_t baudRate)
{
	//Enable SCIF from TI-RTOS
	scifOsalInit();
	//Initialize the UART emulator
	scifInit(&scifDriverSetup);
	// Start the UART emulator
	scifExecuteTasksOnceNbl(BV(SCIF_UART_EMULATOR_TASK_ID));

	// Enable baud rate generation
	scifUartSetBaudRate(baudRate);

	// Enable events
	scifUartSetEventMask(0xF);
	SCUartDisplay_clearScreen();
}

/*!
 * @brief Write a null-terminated string to the emulated uart.
 *
 * @param pBuf  pointer to null-terminated string
 * @note Max size is SCIF_UART_TX_FIFO_MAX_COUNT - 2 (CR+LF).
 *
 * @return length of written data or 0 on error.
 */
uint8_t SCUartDisplay_writeLine(char* pBuf)
{
	uint8_t size = strlen(pBuf);
	//Account for size of message and size of CRLF
	uint8_t bytesAvail = SCIF_UART_TX_FIFO_MAX_COUNT - scifUartGetTxFifoCount() - 2;
	if(0x80 & bytesAvail)
		bytesAvail = 0;
	if(bytesAvail >= size)
	{
		scifUartTxPutChars(pBuf, size);
		scifUartTxPutChar('\n');
		scifUartTxPutChar('\r');
		return size;
	}
	else
	{
		return 0;
	}
}

/*!
 * @brief Send form-feed character to emulated UART to clear current data
 */
void SCUartDisplay_clearScreen(void)
{
	//Use Form Feed character to clear screen, supported by putty
	if(SCIF_UART_TX_FIFO_MAX_COUNT > scifUartGetTxFifoCount())
		scifUartTxPutChar(SERIAL_FORM_FEED);
}

/*!
 * @brief Stop the Sensor-controller task and uninitialize.
 */
void SCUartDisplay_close(void)
{
	//Stop the sensor controller task
	scifStopTasksNbl(BV(SCIF_UART_EMULATOR_TASK_ID));
	scifUninit();
}
