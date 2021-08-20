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
/** \addtogroup module_scif_osal Operating System Abstraction Layer
  *
  * \section section_osal_overview Overview
  * The OSAL allows provides a set of functions for internal use by the SCIF driver to allow it to
  * interface with the real-time operating system or other run-time framework running on the System CPU.
  *
  * The OSAL consists of a set of mandatory functions, listed below, and a set of OS-dependent functions
  * to be called by the application, also listed below, for example initialization of the OSAL or AUX
  * domain access control.
  *
  * The OSAL C source file can, but does not need to, be included in the application project.
  *
  *
  * \section section_osal_implementation Implementation "TI-RTOS"
  * This OSAL uses the following TI-RTOS mechanisms:
  * - \b HWI objects to implement the SCIF READY and ALERT callbacks
  * - Critical sections by disabling HWIs globally
  * - A \b Semaphore object to implement the \ref scifWaitOnNbl() timeout
  *
  * The SCIF driver performs I/O initialization internally without use of the \b PIN driver for TI-RTOS.
  * The System CPU application should not use the PIN driver to initialize or open any I/O pins used by
  * Sensor Controller. The \ref module_scif_driver_setup defines the DIO numbers of all mapped I/O
  * pins, allowing for compile-time checking of the I/O mapping.
  *
  * TI-RTOS enables and disables automatically access to the AUX domain from the System CPU application.
  *
  *
  * \section section_osal_app_func Application Functions
  * This SCIF OSAL implementation provides the following functions for use by the application:
  * - OSAL initialization:
  *     - \ref scifOsalInit()
  * - Callback registering:
  *     - \ref scifOsalRegisterCtrlReadyCallback()
  *     - \ref scifOsalRegisterTaskAlertCallback()
  *
  * \section section_osal_int_func Mandatory Internal Functions
  * The SCIF OSAL must provide the following functions for internal use by the driver:
  * - Task control READY interrupt:
  *     - \ref osalCtrlReadyIsr()
  *     - \ref osalRegisterCtrlReadyInt()
  *     - \ref osalEnableCtrlReadyInt()
  *     - \ref osalDisableCtrlReadyInt()
  *     - \ref osalClearCtrlReadyInt()
  * - Task ALERT interrupt:
  *     - \ref osalTaskAlertIsr()
  *     - \ref osalRegisterTaskAlertInt()
  *     - \ref osalEnableTaskAlertInt()
  *     - \ref osalDisableTaskAlertInt()
  *     - \ref osalClearTaskAlertInt()
  * - Thread-safe operation:
  *     - \ref scifOsalEnterCriticalSection()
  *     - \ref scifOsalLeaveCriticalSection()
  *     - \ref osalLockCtrlTaskNbl()
  *     - \ref osalUnlockCtrlTaskNbl()
  * - Task control support:
  *     - \ref osalWaitOnCtrlReady()
  * - Application notifications:
  *     - \ref osalIndicateCtrlReady()
  *     - \ref osalIndicateTaskAlert()
  *
  * @{
  */
#ifndef SCIF_OSAL_TIRTOS_H
#define SCIF_OSAL_TIRTOS_H


// OSAL "TI-RTOS": Callback registering functions
void scifOsalRegisterCtrlReadyCallback(SCIF_VFPTR callback);
void scifOsalRegisterTaskAlertCallback(SCIF_VFPTR callback);

// OSAL "TI-RTOS": Init function
void scifOsalInit(void);


#endif
//@}
