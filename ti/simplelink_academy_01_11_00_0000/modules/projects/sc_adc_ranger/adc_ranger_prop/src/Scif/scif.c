/// \addtogroup module_scif_driver_setup
//@{
#include "scif.h"
#include "scif_framework.h"
#include <inc/hw_types.h>
#include <inc/hw_memmap.h>
#include <inc/hw_aon_event.h>
#include <inc/hw_aon_rtc.h>
#include <inc/hw_aon_wuc.h>
#include <inc/hw_aux_sce.h>
#include <inc/hw_aux_smph.h>
#include <inc/hw_aux_evctl.h>
#include <inc/hw_aux_aiodio.h>
#include <inc/hw_aux_timer.h>
#include <inc/hw_aux_wuc.h>
#include <inc/hw_event.h>
#include <inc/hw_ints.h>
#include <inc/hw_ioc.h>
#include <string.h>
#if defined(__IAR_SYSTEMS_ICC__)
    #include <intrinsics.h>
#endif


// OSAL function prototypes
uint32_t scifOsalEnterCriticalSection(void);
void scifOsalLeaveCriticalSection(uint32_t key);




/// Firmware image to be uploaded to the AUX RAM
static const uint16_t pAuxRamImage[] = {
    /*0x0000*/ 0x1408, 0x040C, 0x1408, 0x042C, 0x1408, 0x0447, 0x1408, 0x044D, 0x4436, 0x2437, 0xAEFE, 0xADB7, 0x6442, 0x7000, 0x7C6F, 0x6874, 
    /*0x0020*/ 0x0069, 0x1425, 0x6875, 0x006B, 0x1425, 0x6876, 0x006D, 0x1425, 0x786F, 0xF801, 0xFA02, 0xBEF2, 0x7872, 0x6874, 0xFD0E, 0x6876, 
    /*0x0040*/ 0xED92, 0xFD06, 0x7C72, 0x642D, 0x0451, 0x786F, 0x8F1F, 0xED8F, 0xEC01, 0xBE01, 0xADB7, 0x8DB7, 0x6630, 0x6542, 0x0000, 0x1872, 
    /*0x0060*/ 0x9D88, 0x9C01, 0xB60D, 0x1067, 0xAF19, 0xAA00, 0xB609, 0xA8FF, 0xAF39, 0xBE06, 0x0C6F, 0x886B, 0x8F08, 0xFD47, 0x9DB7, 0x086F, 
    /*0x0080*/ 0x8801, 0x8A02, 0xBEEC, 0x262F, 0xAEFE, 0x4630, 0x0451, 0x5527, 0x6642, 0x0000, 0x0C6F, 0x140B, 0x0451, 0x6742, 0x86FF, 0x03FF, 
    /*0x00A0*/ 0x0C71, 0x7870, 0xCD47, 0x6871, 0xCD06, 0xB605, 0x0000, 0x0C70, 0x7C73, 0x652D, 0x0C71, 0x7871, 0xF801, 0xE92B, 0xFD0E, 0xBE01, 
    /*0x00C0*/ 0x6436, 0xBDB7, 0x241A, 0xA6FE, 0xADB7, 0x641A, 0xADB7, 0x0000, 0x0000, 0x007A, 0x00A0, 0x007F, 0x00A8, 0x009F, 0x00E0, 0x0000, 
    /*0x00E0*/ 0x0000, 0xFFFF, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x7003, 0x14E1, 0x0001, 0x0C67, 0xADB7, 0x705D, 
    /*0x0100*/ 0x6003, 0x14EE, 0x7041, 0x1462, 0xFB4D, 0x8609, 0x7101, 0x6431, 0x2531, 0xA6FE, 0xFB00, 0x7018, 0xFB4C, 0x7003, 0xFB4C, 0xFD47, 
    /*0x0120*/ 0xFB4C, 0x1465, 0x6403, 0x001F, 0x8B2C, 0xFDB1, 0x8902, 0x0C77, 0x14F4, 0x0870, 0x8201, 0x0C70, 0x0001, 0x0C67, 0xADB7, 0xADB7, 
    /*0x0140*/ 0x8910, 0x86FF, 0x80F3, 0x8200, 0x8B10, 0x0001, 0x0C68, 0xADB7, 0x241B, 0xA6FE, 0x14FF, 0x1462, 0x0180, 0x86A0, 0x8B80, 0x0080, 
    /*0x0160*/ 0x86A0, 0x8B40, 0xFD47, 0x86A0, 0x8900, 0x1465, 0x862E, 0x020E, 0x8B08, 0x0000, 0x8640, 0x8B18, 0x8640, 0x641C, 0x650E, 0x70EB, 
    /*0x0180*/ 0x6009, 0x14EE, 0x450E, 0x8910, 0x86FF, 0x80F3, 0x8204, 0x8B10, 0x6529, 0x7002, 0x1503, 0x8611, 0x7194, 0x150F, 0x8907, 0x9906, 
    /*0x01A0*/ 0x0C78, 0x1C79, 0x151B, 0x641B, 0x0870, 0x8202, 0x0C70, 0x4529, 0x8910, 0x86FF, 0x80F3, 0x8200, 0x8B10, 0x0001, 0x0C68, 0xADB7, 
    /*0x01C0*/ 0xADB7, 0xF007, 0x1462, 0x86FF, 0x63F8, 0xEB51, 0x8680, 0x6000, 0xED8F, 0xEB49, 0xFD47, 0xEB49, 0x1465, 0xADB7, 0xFB0C, 0xEDA4, 
    /*0x01E0*/ 0xEB09, 0x640B, 0xCDB1, 0xADB7, 0x1462, 0x7079, 0xFB55, 0x71FB, 0xFB54, 0xFD47, 0xFB54, 0x1465, 0x4431, 0x4400, 0xADB7, 0x6432, 
    /*0x0200*/ 0x2532, 0xA6FE, 0xADB7, 0x6003, 0xEB04, 0x600F, 0x8640, 0xEB0C, 0x6000, 0xEB04, 0xFB04, 0x7641, 0xA500, 0xFD47, 0xADB7, 0xFB0C, 
    /*0x0220*/ 0x7070, 0xFB09, 0x7741, 0x640B, 0x8650, 0xF90C, 0xFCC0, 0xB6FC, 0x440B, 0x7741, 0xADB7, 0x6003, 0xEB04, 0x4432, 0x2532, 0xAEFE, 
    /*0x0240*/ 0xADB7
};


/// Look-up table that converts from AUX I/O index to MCU IOCFG offset
static const uint8_t pAuxIoIndexToMcuIocfgOffsetLut[] = {
    120, 116, 112, 108, 104, 100, 96, 92, 28, 24, 20, 16, 12, 8, 4, 0
};


/** \brief Look-up table of data structure information for each task
  *
  * There is one entry per data structure (\c cfg, \c input, \c output and \c state) per task:
  * - [31:24] Data structure size (number of 16-bit words)
  * - [23:16] Buffer count (when 2+, first data structure is preceded by buffering control variables)
  * - [15:0] Address of the first data structure
  */
static const uint32_t pScifTaskDataStructInfoLut[] = {
//  cfg         input       output      state       
    0x00000000, 0x00000000, 0x001010EE, 0x00000000, // ADC
    0x00000000, 0x00000000, 0x002010F0, 0x00000000  // Ranger
};




// No task-specific initialization functions




// No task-specific uninitialization functions




/** \brief Initilializes task resource hardware dependencies
  *
  * This function is called by the internal driver initialization function, \ref scifInit().
  */
static void scifTaskResourceInit(void) {
    scifInitIo(3, AUXIOMODE_ANALOG, -1, 0);
    scifInitIo(1, AUXIOMODE_OPEN_SOURCE, -1, 0);
} // scifTaskResourceInit




/** \brief Uninitilializes task resource hardware dependencies
  *
  * This function is called by the internal driver uninitialization function, \ref scifUninit().
  */
static void scifTaskResourceUninit(void) {
    scifUninitIo(3, -1);
    scifUninitIo(1, -1);
} // scifTaskResourceUninit




/** \brief Re-initializes I/O pins used by the specified tasks
  *
  * It is possible to stop a Sensor Controller task and let the System CPU borrow and operate its I/O
  * pins. For example, the Sensor Controller can operate an SPI interface in one application state while
  * the System CPU with SSI operates the SPI interface in another application state.
  *
  * This function must be called before \ref scifExecuteTasksOnceNbl() or \ref scifStartTasksNbl() if
  * I/O pins belonging to Sensor Controller tasks have been borrowed System CPU peripherals.
  *
  * \param[in]      bvTaskIds
  *     Bit-vector of task IDs for the task I/Os to be re-initialized
  */
void scifReinitTaskIo(uint32_t bvTaskIds) {
    if (bvTaskIds & (1 << SCIF_ADC_TASK_ID)) {
        scifReinitIo(3, -1);
    }
    if (bvTaskIds & (1 << SCIF_RANGER_TASK_ID)) {
        scifReinitIo(1, -1);
    }
} // scifReinitTaskIo




/// Driver setup data, to be used in the call to \ref scifInit()
const SCIF_DATA_T scifDriverSetup = {
    (volatile SCIF_INT_DATA_T*) 0x400E00DE,
    (volatile SCIF_TASK_CTRL_T*) 0x400E00E4,
    (volatile uint16_t*) 0x400E00CE,
    0x0000,
    sizeof(pAuxRamImage),
    pAuxRamImage,
    pScifTaskDataStructInfoLut,
    pAuxIoIndexToMcuIocfgOffsetLut,
    scifTaskResourceInit,
    scifTaskResourceUninit
};




/** \brief Starts or modifies RTC-based task scheduling tick generation
  *
  * RTC-based tick generation will wake up the Sensor Controller first at the specified value of the RTC
  * and then periodically at the specified interval. The application must call this function after
  * calling \ref scifInit().
  *
  * The application must ensure that:
  * - \a tickStart is not in the past (prefer using \ref scifStartRtcTicksNow() to avoid this)
  * - \a tickPeriod is not too short. RTC ticks will be skipped silently if the Sensor Controller does
  *   not complete its tasks within a single tick interval.
  *
  * \param[in]      tickStart
  *     RTC value when the first tick is generated:
  *     - Bits 31:16 = seconds
  *     - Bits 15:0 = 1/65536 of a second
  * \param[in]      tickPeriod
  *     Interval at which subsequent ticks are generated:
  *     - Bits 31:16 = seconds
  *     - Bits 15:0 = 1/65536 of a second
  */
void scifStartRtcTicks(uint32_t tickStart, uint32_t tickPeriod) {
    HWREG(AON_RTC_BASE + AON_RTC_O_CH2CMP) = tickStart;
    HWREG(AON_RTC_BASE + AON_RTC_O_CH2CMPINC) = tickPeriod;
    HWREG(AON_RTC_BASE + AON_RTC_O_CHCTL) |= AON_RTC_CHCTL_CH2_EN_M | AON_RTC_CHCTL_CH2_CONT_EN_M;
    HWREG(AON_EVENT_BASE + AON_EVENT_O_AUXWUSEL) =
        (HWREG(AON_EVENT_BASE + AON_EVENT_O_AUXWUSEL) & ~AON_EVENT_AUXWUSEL_WU0_EV_M) |
        (AON_EVENT_AUXWUSEL_WU0_EV_RTC_CH2);
} // scifStartRtcTicks




/** \brief Starts or modifies RTC-based task scheduling tick generation
  *
  * RTC-based tick generation will wake up the Sensor Controller first after approximately 128 us and
  * then periodically at the specified interval. The application must call this function after calling
  * \ref scifInit().
  *
  * The application must ensure that \a tickPeriod is not too short. RTC ticks will be skipped silently
  * if the Sensor Controller does not complete its tasks within a single tick interval.
  *
  * \param[in]      tickPeriod
  *     Interval at which subsequent ticks are generated:
  *     - Bits 31:16 = seconds
  *     - Bits 15:0 = 1/65536 of a second
  */
void scifStartRtcTicksNow(uint32_t tickPeriod) {
    uint32_t key, sec, subsec;
    key = scifOsalEnterCriticalSection();
    sec = HWREG(AON_RTC_BASE + AON_RTC_O_SEC);
    subsec = HWREG(AON_RTC_BASE + AON_RTC_O_SUBSEC);
    scifStartRtcTicks(((sec << 16) | (subsec >> 16)) + 8, tickPeriod);
    scifOsalLeaveCriticalSection(key);
} // scifStartRtcTicksNow




/** \brief Stops RTC-based task scheduling tick generation
  *
  * The application must call this function before calling \ref scifUninit().
  */
void scifStopRtcTicks(void) {
    HWREG(AON_RTC_BASE + AON_RTC_O_CHCTL) &= ~(AON_RTC_CHCTL_CH2_EN_M | AON_RTC_CHCTL_CH2_CONT_EN_M);
    HWREG(AON_EVENT_BASE + AON_EVENT_O_AUXWUSEL) =
        (HWREG(AON_EVENT_BASE + AON_EVENT_O_AUXWUSEL) & ~AON_EVENT_AUXWUSEL_WU0_EV_M) |
        (AON_EVENT_AUXWUSEL_WU0_EV_NONE);
    HWREG(AON_RTC_BASE + AON_RTC_O_SYNC);
} // scifStopRtcTicks


//@}


// Generated by LTOSSTD05 at 2016-07-11 13:40:38.599
