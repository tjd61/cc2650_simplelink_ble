#
#  Do not edit this file.  This file is generated from 
#  package.bld.  Any modifications to this file will be 
#  overwritten whenever makefiles are re-generated.
#
#  target compatibility key = iar.targets.arm.M3{1,0,7.50,1
#
ifeq (,$(MK_NOGENDEPS))
-include package/lib/lib/sysbios/debug/ti.sysbios.family.arm.cc26xx/package/package_ti.sysbios.family.arm.cc26xx.orm3.dep
package/lib/lib/sysbios/debug/ti.sysbios.family.arm.cc26xx/package/package_ti.sysbios.family.arm.cc26xx.orm3.dep: ;
endif

package/lib/lib/sysbios/debug/ti.sysbios.family.arm.cc26xx/package/package_ti.sysbios.family.arm.cc26xx.orm3: | .interfaces
package/lib/lib/sysbios/debug/ti.sysbios.family.arm.cc26xx/package/package_ti.sysbios.family.arm.cc26xx.orm3: package/package_ti.sysbios.family.arm.cc26xx.c lib/sysbios/debug/ti.sysbios.family.arm.cc26xx.arm3.mak
	@$(RM) $@.dep
	$(RM) $@
	@$(MSG) clrm3 $< ...
	LC_ALL=C $(iar.targets.arm.M3.rootDir)/bin/iccarm  --silent --aeabi --cpu=Cortex-M3 --diag_suppress=Pa050,Go005 --endian=little -e --thumb  -Dxdc_target_name__=M3 -Dxdc_target_types__=iar/targets/arm/std.h -Dxdc_bld__profile_debug -Dxdc_bld__vers_1_0_7_50_1 --debug --dlib_config $(iar.targets.arm.M3.rootDir)/inc/c/DLib_Config_Normal.h  -Dti_sysbios_Build_useHwiMacros -Dti_sysbios_BIOS_smpEnabled__D=FALSE  $(XDCINCS)  -o $@  $<
	
	-@$(FIXDEP) $@.dep $@.dep
	

package/lib/lib/sysbios/debug/ti.sysbios.family.arm.cc26xx/package/package_ti.sysbios.family.arm.cc26xx.srm3: | .interfaces
package/lib/lib/sysbios/debug/ti.sysbios.family.arm.cc26xx/package/package_ti.sysbios.family.arm.cc26xx.srm3: package/package_ti.sysbios.family.arm.cc26xx.c lib/sysbios/debug/ti.sysbios.family.arm.cc26xx.arm3.mak
	@$(RM) $@.dep
	$(RM) $@
	@$(MSG) clrm3 $< ...
	LC_ALL=C $(iar.targets.arm.M3.rootDir)/bin/iccarm  --silent --aeabi --cpu=Cortex-M3 --diag_suppress=Pa050,Go005 --endian=little -e --thumb  -Dxdc_target_name__=M3 -Dxdc_target_types__=iar/targets/arm/std.h -Dxdc_bld__profile_debug -Dxdc_bld__vers_1_0_7_50_1 --debug --dlib_config $(iar.targets.arm.M3.rootDir)/inc/c/DLib_Config_Normal.h  -Dti_sysbios_Build_useHwiMacros -Dti_sysbios_BIOS_smpEnabled__D=FALSE  $(XDCINCS)  -o $@  $<
	
	-@$(FIXDEP) $@.dep $@.dep
	

ifeq (,$(MK_NOGENDEPS))
-include package/lib/lib/sysbios/debug/ti.sysbios.family.arm.cc26xx/Alarm.orm3.dep
package/lib/lib/sysbios/debug/ti.sysbios.family.arm.cc26xx/Alarm.orm3.dep: ;
endif

package/lib/lib/sysbios/debug/ti.sysbios.family.arm.cc26xx/Alarm.orm3: | .interfaces
package/lib/lib/sysbios/debug/ti.sysbios.family.arm.cc26xx/Alarm.orm3: Alarm.c lib/sysbios/debug/ti.sysbios.family.arm.cc26xx.arm3.mak
	@$(RM) $@.dep
	$(RM) $@
	@$(MSG) clrm3 $< ...
	LC_ALL=C $(iar.targets.arm.M3.rootDir)/bin/iccarm  --silent --aeabi --cpu=Cortex-M3 --diag_suppress=Pa050,Go005 --endian=little -e --thumb  -Dxdc_target_name__=M3 -Dxdc_target_types__=iar/targets/arm/std.h -Dxdc_bld__profile_debug -Dxdc_bld__vers_1_0_7_50_1 --debug --dlib_config $(iar.targets.arm.M3.rootDir)/inc/c/DLib_Config_Normal.h  -Dti_sysbios_Build_useHwiMacros -Dti_sysbios_BIOS_smpEnabled__D=FALSE  $(XDCINCS)  -o $@  $<
	
	-@$(FIXDEP) $@.dep $@.dep
	

package/lib/lib/sysbios/debug/ti.sysbios.family.arm.cc26xx/Alarm.srm3: | .interfaces
package/lib/lib/sysbios/debug/ti.sysbios.family.arm.cc26xx/Alarm.srm3: Alarm.c lib/sysbios/debug/ti.sysbios.family.arm.cc26xx.arm3.mak
	@$(RM) $@.dep
	$(RM) $@
	@$(MSG) clrm3 $< ...
	LC_ALL=C $(iar.targets.arm.M3.rootDir)/bin/iccarm  --silent --aeabi --cpu=Cortex-M3 --diag_suppress=Pa050,Go005 --endian=little -e --thumb  -Dxdc_target_name__=M3 -Dxdc_target_types__=iar/targets/arm/std.h -Dxdc_bld__profile_debug -Dxdc_bld__vers_1_0_7_50_1 --debug --dlib_config $(iar.targets.arm.M3.rootDir)/inc/c/DLib_Config_Normal.h  -Dti_sysbios_Build_useHwiMacros -Dti_sysbios_BIOS_smpEnabled__D=FALSE  $(XDCINCS)  -o $@  $<
	
	-@$(FIXDEP) $@.dep $@.dep
	

ifeq (,$(MK_NOGENDEPS))
-include package/lib/lib/sysbios/debug/ti.sysbios.family.arm.cc26xx/Boot.orm3.dep
package/lib/lib/sysbios/debug/ti.sysbios.family.arm.cc26xx/Boot.orm3.dep: ;
endif

package/lib/lib/sysbios/debug/ti.sysbios.family.arm.cc26xx/Boot.orm3: | .interfaces
package/lib/lib/sysbios/debug/ti.sysbios.family.arm.cc26xx/Boot.orm3: Boot.c lib/sysbios/debug/ti.sysbios.family.arm.cc26xx.arm3.mak
	@$(RM) $@.dep
	$(RM) $@
	@$(MSG) clrm3 $< ...
	LC_ALL=C $(iar.targets.arm.M3.rootDir)/bin/iccarm  --silent --aeabi --cpu=Cortex-M3 --diag_suppress=Pa050,Go005 --endian=little -e --thumb  -Dxdc_target_name__=M3 -Dxdc_target_types__=iar/targets/arm/std.h -Dxdc_bld__profile_debug -Dxdc_bld__vers_1_0_7_50_1 --debug --dlib_config $(iar.targets.arm.M3.rootDir)/inc/c/DLib_Config_Normal.h  -Dti_sysbios_Build_useHwiMacros -Dti_sysbios_BIOS_smpEnabled__D=FALSE  $(XDCINCS)  -o $@  $<
	
	-@$(FIXDEP) $@.dep $@.dep
	

package/lib/lib/sysbios/debug/ti.sysbios.family.arm.cc26xx/Boot.srm3: | .interfaces
package/lib/lib/sysbios/debug/ti.sysbios.family.arm.cc26xx/Boot.srm3: Boot.c lib/sysbios/debug/ti.sysbios.family.arm.cc26xx.arm3.mak
	@$(RM) $@.dep
	$(RM) $@
	@$(MSG) clrm3 $< ...
	LC_ALL=C $(iar.targets.arm.M3.rootDir)/bin/iccarm  --silent --aeabi --cpu=Cortex-M3 --diag_suppress=Pa050,Go005 --endian=little -e --thumb  -Dxdc_target_name__=M3 -Dxdc_target_types__=iar/targets/arm/std.h -Dxdc_bld__profile_debug -Dxdc_bld__vers_1_0_7_50_1 --debug --dlib_config $(iar.targets.arm.M3.rootDir)/inc/c/DLib_Config_Normal.h  -Dti_sysbios_Build_useHwiMacros -Dti_sysbios_BIOS_smpEnabled__D=FALSE  $(XDCINCS)  -o $@  $<
	
	-@$(FIXDEP) $@.dep $@.dep
	

ifeq (,$(MK_NOGENDEPS))
-include package/lib/lib/sysbios/debug/ti.sysbios.family.arm.cc26xx/Seconds.orm3.dep
package/lib/lib/sysbios/debug/ti.sysbios.family.arm.cc26xx/Seconds.orm3.dep: ;
endif

package/lib/lib/sysbios/debug/ti.sysbios.family.arm.cc26xx/Seconds.orm3: | .interfaces
package/lib/lib/sysbios/debug/ti.sysbios.family.arm.cc26xx/Seconds.orm3: Seconds.c lib/sysbios/debug/ti.sysbios.family.arm.cc26xx.arm3.mak
	@$(RM) $@.dep
	$(RM) $@
	@$(MSG) clrm3 $< ...
	LC_ALL=C $(iar.targets.arm.M3.rootDir)/bin/iccarm  --silent --aeabi --cpu=Cortex-M3 --diag_suppress=Pa050,Go005 --endian=little -e --thumb  -Dxdc_target_name__=M3 -Dxdc_target_types__=iar/targets/arm/std.h -Dxdc_bld__profile_debug -Dxdc_bld__vers_1_0_7_50_1 --debug --dlib_config $(iar.targets.arm.M3.rootDir)/inc/c/DLib_Config_Normal.h  -Dti_sysbios_Build_useHwiMacros -Dti_sysbios_BIOS_smpEnabled__D=FALSE  $(XDCINCS)  -o $@  $<
	
	-@$(FIXDEP) $@.dep $@.dep
	

package/lib/lib/sysbios/debug/ti.sysbios.family.arm.cc26xx/Seconds.srm3: | .interfaces
package/lib/lib/sysbios/debug/ti.sysbios.family.arm.cc26xx/Seconds.srm3: Seconds.c lib/sysbios/debug/ti.sysbios.family.arm.cc26xx.arm3.mak
	@$(RM) $@.dep
	$(RM) $@
	@$(MSG) clrm3 $< ...
	LC_ALL=C $(iar.targets.arm.M3.rootDir)/bin/iccarm  --silent --aeabi --cpu=Cortex-M3 --diag_suppress=Pa050,Go005 --endian=little -e --thumb  -Dxdc_target_name__=M3 -Dxdc_target_types__=iar/targets/arm/std.h -Dxdc_bld__profile_debug -Dxdc_bld__vers_1_0_7_50_1 --debug --dlib_config $(iar.targets.arm.M3.rootDir)/inc/c/DLib_Config_Normal.h  -Dti_sysbios_Build_useHwiMacros -Dti_sysbios_BIOS_smpEnabled__D=FALSE  $(XDCINCS)  -o $@  $<
	
	-@$(FIXDEP) $@.dep $@.dep
	

ifeq (,$(MK_NOGENDEPS))
-include package/lib/lib/sysbios/debug/ti.sysbios.family.arm.cc26xx/Timer.orm3.dep
package/lib/lib/sysbios/debug/ti.sysbios.family.arm.cc26xx/Timer.orm3.dep: ;
endif

package/lib/lib/sysbios/debug/ti.sysbios.family.arm.cc26xx/Timer.orm3: | .interfaces
package/lib/lib/sysbios/debug/ti.sysbios.family.arm.cc26xx/Timer.orm3: Timer.c lib/sysbios/debug/ti.sysbios.family.arm.cc26xx.arm3.mak
	@$(RM) $@.dep
	$(RM) $@
	@$(MSG) clrm3 $< ...
	LC_ALL=C $(iar.targets.arm.M3.rootDir)/bin/iccarm  --silent --aeabi --cpu=Cortex-M3 --diag_suppress=Pa050,Go005 --endian=little -e --thumb  -Dxdc_target_name__=M3 -Dxdc_target_types__=iar/targets/arm/std.h -Dxdc_bld__profile_debug -Dxdc_bld__vers_1_0_7_50_1 --debug --dlib_config $(iar.targets.arm.M3.rootDir)/inc/c/DLib_Config_Normal.h  -Dti_sysbios_Build_useHwiMacros -Dti_sysbios_BIOS_smpEnabled__D=FALSE  $(XDCINCS)  -o $@  $<
	
	-@$(FIXDEP) $@.dep $@.dep
	

package/lib/lib/sysbios/debug/ti.sysbios.family.arm.cc26xx/Timer.srm3: | .interfaces
package/lib/lib/sysbios/debug/ti.sysbios.family.arm.cc26xx/Timer.srm3: Timer.c lib/sysbios/debug/ti.sysbios.family.arm.cc26xx.arm3.mak
	@$(RM) $@.dep
	$(RM) $@
	@$(MSG) clrm3 $< ...
	LC_ALL=C $(iar.targets.arm.M3.rootDir)/bin/iccarm  --silent --aeabi --cpu=Cortex-M3 --diag_suppress=Pa050,Go005 --endian=little -e --thumb  -Dxdc_target_name__=M3 -Dxdc_target_types__=iar/targets/arm/std.h -Dxdc_bld__profile_debug -Dxdc_bld__vers_1_0_7_50_1 --debug --dlib_config $(iar.targets.arm.M3.rootDir)/inc/c/DLib_Config_Normal.h  -Dti_sysbios_Build_useHwiMacros -Dti_sysbios_BIOS_smpEnabled__D=FALSE  $(XDCINCS)  -o $@  $<
	
	-@$(FIXDEP) $@.dep $@.dep
	

ifeq (,$(MK_NOGENDEPS))
-include package/lib/lib/sysbios/debug/ti.sysbios.family.arm.cc26xx/TimestampProvider.orm3.dep
package/lib/lib/sysbios/debug/ti.sysbios.family.arm.cc26xx/TimestampProvider.orm3.dep: ;
endif

package/lib/lib/sysbios/debug/ti.sysbios.family.arm.cc26xx/TimestampProvider.orm3: | .interfaces
package/lib/lib/sysbios/debug/ti.sysbios.family.arm.cc26xx/TimestampProvider.orm3: TimestampProvider.c lib/sysbios/debug/ti.sysbios.family.arm.cc26xx.arm3.mak
	@$(RM) $@.dep
	$(RM) $@
	@$(MSG) clrm3 $< ...
	LC_ALL=C $(iar.targets.arm.M3.rootDir)/bin/iccarm  --silent --aeabi --cpu=Cortex-M3 --diag_suppress=Pa050,Go005 --endian=little -e --thumb  -Dxdc_target_name__=M3 -Dxdc_target_types__=iar/targets/arm/std.h -Dxdc_bld__profile_debug -Dxdc_bld__vers_1_0_7_50_1 --debug --dlib_config $(iar.targets.arm.M3.rootDir)/inc/c/DLib_Config_Normal.h  -Dti_sysbios_Build_useHwiMacros -Dti_sysbios_BIOS_smpEnabled__D=FALSE  $(XDCINCS)  -o $@  $<
	
	-@$(FIXDEP) $@.dep $@.dep
	

package/lib/lib/sysbios/debug/ti.sysbios.family.arm.cc26xx/TimestampProvider.srm3: | .interfaces
package/lib/lib/sysbios/debug/ti.sysbios.family.arm.cc26xx/TimestampProvider.srm3: TimestampProvider.c lib/sysbios/debug/ti.sysbios.family.arm.cc26xx.arm3.mak
	@$(RM) $@.dep
	$(RM) $@
	@$(MSG) clrm3 $< ...
	LC_ALL=C $(iar.targets.arm.M3.rootDir)/bin/iccarm  --silent --aeabi --cpu=Cortex-M3 --diag_suppress=Pa050,Go005 --endian=little -e --thumb  -Dxdc_target_name__=M3 -Dxdc_target_types__=iar/targets/arm/std.h -Dxdc_bld__profile_debug -Dxdc_bld__vers_1_0_7_50_1 --debug --dlib_config $(iar.targets.arm.M3.rootDir)/inc/c/DLib_Config_Normal.h  -Dti_sysbios_Build_useHwiMacros -Dti_sysbios_BIOS_smpEnabled__D=FALSE  $(XDCINCS)  -o $@  $<
	
	-@$(FIXDEP) $@.dep $@.dep
	

clean,rm3 ::
	-$(RM) package/lib/lib/sysbios/debug/ti.sysbios.family.arm.cc26xx/package/package_ti.sysbios.family.arm.cc26xx.orm3
	-$(RM) package/lib/lib/sysbios/debug/ti.sysbios.family.arm.cc26xx/Alarm.orm3
	-$(RM) package/lib/lib/sysbios/debug/ti.sysbios.family.arm.cc26xx/Boot.orm3
	-$(RM) package/lib/lib/sysbios/debug/ti.sysbios.family.arm.cc26xx/Seconds.orm3
	-$(RM) package/lib/lib/sysbios/debug/ti.sysbios.family.arm.cc26xx/Timer.orm3
	-$(RM) package/lib/lib/sysbios/debug/ti.sysbios.family.arm.cc26xx/TimestampProvider.orm3
	-$(RM) package/lib/lib/sysbios/debug/ti.sysbios.family.arm.cc26xx/package/package_ti.sysbios.family.arm.cc26xx.srm3
	-$(RM) package/lib/lib/sysbios/debug/ti.sysbios.family.arm.cc26xx/Alarm.srm3
	-$(RM) package/lib/lib/sysbios/debug/ti.sysbios.family.arm.cc26xx/Boot.srm3
	-$(RM) package/lib/lib/sysbios/debug/ti.sysbios.family.arm.cc26xx/Seconds.srm3
	-$(RM) package/lib/lib/sysbios/debug/ti.sysbios.family.arm.cc26xx/Timer.srm3
	-$(RM) package/lib/lib/sysbios/debug/ti.sysbios.family.arm.cc26xx/TimestampProvider.srm3

lib/sysbios/debug/ti.sysbios.family.arm.cc26xx.arm3: package/lib/lib/sysbios/debug/ti.sysbios.family.arm.cc26xx/package/package_ti.sysbios.family.arm.cc26xx.orm3 package/lib/lib/sysbios/debug/ti.sysbios.family.arm.cc26xx/Alarm.orm3 package/lib/lib/sysbios/debug/ti.sysbios.family.arm.cc26xx/Boot.orm3 package/lib/lib/sysbios/debug/ti.sysbios.family.arm.cc26xx/Seconds.orm3 package/lib/lib/sysbios/debug/ti.sysbios.family.arm.cc26xx/Timer.orm3 package/lib/lib/sysbios/debug/ti.sysbios.family.arm.cc26xx/TimestampProvider.orm3 lib/sysbios/debug/ti.sysbios.family.arm.cc26xx.arm3.mak

clean::
	-$(RM) lib/sysbios/debug/ti.sysbios.family.arm.cc26xx.arm3.mak
