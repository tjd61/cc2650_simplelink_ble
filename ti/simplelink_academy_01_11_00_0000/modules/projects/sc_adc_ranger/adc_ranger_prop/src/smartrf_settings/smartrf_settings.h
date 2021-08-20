#ifndef _SMARTRF_SETTINGS_H_
#define _SMARTRF_SETTINGS_H_


//*********************************************************************************
// These settings have been generated for use with TI-RTOS and cc13xxware
//
// Generated by SmartRF Studio version 2.4.0
// Tested for TI-RTOS version tirtos_simplelink_2_20_xx
// Device: CC13xx Rev. 2.1
//
//*********************************************************************************
#include <driverlib/rf_mailbox.h>
#include <driverlib/rf_common_cmd.h>
#include <driverlib/rf_prop_cmd.h>
#include <ti/drivers/rf/RF.h>


// TI-RTOS RF Mode Object
extern RF_Mode RF_prop;


// RF Core API commands
extern rfc_CMD_PROP_RADIO_DIV_SETUP_t RF_cmdPropRadioDivSetup;
extern rfc_CMD_FS_t RF_cmdFs;
extern rfc_CMD_PROP_TX_t RF_cmdPropTx;
extern rfc_CMD_PROP_RX_t RF_cmdPropRx;




#endif // _SMARTRF_SETTINGS_H_
