/*
 *  Do not modify this file; it is automatically 
 *  generated and any modifications will be overwritten.
 *
 * @(#) xdc-B06
 */

#ifndef ti_uia_runtime_ServiceMgr__INTERNAL__
#define ti_uia_runtime_ServiceMgr__INTERNAL__

#ifndef ti_uia_runtime_ServiceMgr__internalaccess
#define ti_uia_runtime_ServiceMgr__internalaccess
#endif

#include <ti/uia/runtime/ServiceMgr.h>

#undef xdc_FILE__
#ifndef xdc_FILE
#define xdc_FILE__ NULL
#else
#define xdc_FILE__ xdc_FILE
#endif

/* freePacket */
#undef ti_uia_runtime_ServiceMgr_freePacket
#define ti_uia_runtime_ServiceMgr_freePacket ti_uia_runtime_ServiceMgr_freePacket__F

/* getFreePacket */
#undef ti_uia_runtime_ServiceMgr_getFreePacket
#define ti_uia_runtime_ServiceMgr_getFreePacket ti_uia_runtime_ServiceMgr_getFreePacket__F

/* getNumServices */
#undef ti_uia_runtime_ServiceMgr_getNumServices
#define ti_uia_runtime_ServiceMgr_getNumServices ti_uia_runtime_ServiceMgr_getNumServices__F

/* processCallback */
#undef ti_uia_runtime_ServiceMgr_processCallback
#define ti_uia_runtime_ServiceMgr_processCallback ti_uia_runtime_ServiceMgr_processCallback__F

/* requestEnergy */
#undef ti_uia_runtime_ServiceMgr_requestEnergy
#define ti_uia_runtime_ServiceMgr_requestEnergy ti_uia_runtime_ServiceMgr_requestEnergy__F

/* sendPacket */
#undef ti_uia_runtime_ServiceMgr_sendPacket
#define ti_uia_runtime_ServiceMgr_sendPacket ti_uia_runtime_ServiceMgr_sendPacket__F

/* setPeriod */
#undef ti_uia_runtime_ServiceMgr_setPeriod
#define ti_uia_runtime_ServiceMgr_setPeriod ti_uia_runtime_ServiceMgr_setPeriod__F

/* Module_startup */
#undef ti_uia_runtime_ServiceMgr_Module_startup
#define ti_uia_runtime_ServiceMgr_Module_startup ti_uia_runtime_ServiceMgr_Module_startup__E

/* Instance_init */
#undef ti_uia_runtime_ServiceMgr_Instance_init
#define ti_uia_runtime_ServiceMgr_Instance_init ti_uia_runtime_ServiceMgr_Instance_init__E

/* Instance_finalize */
#undef ti_uia_runtime_ServiceMgr_Instance_finalize
#define ti_uia_runtime_ServiceMgr_Instance_finalize ti_uia_runtime_ServiceMgr_Instance_finalize__E

/* module */
#define ServiceMgr_module ((ti_uia_runtime_ServiceMgr_Module_State *)(xdc__MODOBJADDR__(ti_uia_runtime_ServiceMgr_Module__state__V)))
#if !defined(__cplusplus) || !defined(ti_uia_runtime_ServiceMgr__cplusplus)
#define module ((ti_uia_runtime_ServiceMgr_Module_State *)(xdc__MODOBJADDR__(ti_uia_runtime_ServiceMgr_Module__state__V)))
#endif
/* per-module runtime symbols */
#undef Module__MID
#define Module__MID ti_uia_runtime_ServiceMgr_Module__id__C
#undef Module__DGSINCL
#define Module__DGSINCL ti_uia_runtime_ServiceMgr_Module__diagsIncluded__C
#undef Module__DGSENAB
#define Module__DGSENAB ti_uia_runtime_ServiceMgr_Module__diagsEnabled__C
#undef Module__DGSMASK
#define Module__DGSMASK ti_uia_runtime_ServiceMgr_Module__diagsMask__C
#undef Module__LOGDEF
#define Module__LOGDEF ti_uia_runtime_ServiceMgr_Module__loggerDefined__C
#undef Module__LOGOBJ
#define Module__LOGOBJ ti_uia_runtime_ServiceMgr_Module__loggerObj__C
#undef Module__LOGFXN0
#define Module__LOGFXN0 ti_uia_runtime_ServiceMgr_Module__loggerFxn0__C
#undef Module__LOGFXN1
#define Module__LOGFXN1 ti_uia_runtime_ServiceMgr_Module__loggerFxn1__C
#undef Module__LOGFXN2
#define Module__LOGFXN2 ti_uia_runtime_ServiceMgr_Module__loggerFxn2__C
#undef Module__LOGFXN4
#define Module__LOGFXN4 ti_uia_runtime_ServiceMgr_Module__loggerFxn4__C
#undef Module__LOGFXN8
#define Module__LOGFXN8 ti_uia_runtime_ServiceMgr_Module__loggerFxn8__C
#undef Module__G_OBJ
#define Module__G_OBJ ti_uia_runtime_ServiceMgr_Module__gateObj__C
#undef Module__G_PRMS
#define Module__G_PRMS ti_uia_runtime_ServiceMgr_Module__gatePrms__C
#undef Module__GP_create
#define Module__GP_create ti_uia_runtime_ServiceMgr_Module_GateProxy_create
#undef Module__GP_delete
#define Module__GP_delete ti_uia_runtime_ServiceMgr_Module_GateProxy_delete
#undef Module__GP_enter
#define Module__GP_enter ti_uia_runtime_ServiceMgr_Module_GateProxy_enter
#undef Module__GP_leave
#define Module__GP_leave ti_uia_runtime_ServiceMgr_Module_GateProxy_leave
#undef Module__GP_query
#define Module__GP_query ti_uia_runtime_ServiceMgr_Module_GateProxy_query


#endif /* ti_uia_runtime_ServiceMgr__INTERNAL____ */
