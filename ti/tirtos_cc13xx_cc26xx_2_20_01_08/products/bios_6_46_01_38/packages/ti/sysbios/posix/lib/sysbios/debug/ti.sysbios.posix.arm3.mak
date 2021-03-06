#
#  Do not edit this file.  This file is generated from 
#  package.bld.  Any modifications to this file will be 
#  overwritten whenever makefiles are re-generated.
#
#  target compatibility key = iar.targets.arm.M3{1,0,7.50,1
#
ifeq (,$(MK_NOGENDEPS))
-include package/lib/lib/sysbios/debug/ti.sysbios.posix/package/package_ti.sysbios.posix.orm3.dep
package/lib/lib/sysbios/debug/ti.sysbios.posix/package/package_ti.sysbios.posix.orm3.dep: ;
endif

package/lib/lib/sysbios/debug/ti.sysbios.posix/package/package_ti.sysbios.posix.orm3: | .interfaces
package/lib/lib/sysbios/debug/ti.sysbios.posix/package/package_ti.sysbios.posix.orm3: package/package_ti.sysbios.posix.c lib/sysbios/debug/ti.sysbios.posix.arm3.mak
	@$(RM) $@.dep
	$(RM) $@
	@$(MSG) clrm3 $< ...
	LC_ALL=C $(iar.targets.arm.M3.rootDir)/bin/iccarm  --silent --aeabi --cpu=Cortex-M3 --diag_suppress=Pa050,Go005 --endian=little -e --thumb  -Dxdc_target_name__=M3 -Dxdc_target_types__=iar/targets/arm/std.h -Dxdc_bld__profile_debug -Dxdc_bld__vers_1_0_7_50_1 --debug --dlib_config $(iar.targets.arm.M3.rootDir)/inc/c/DLib_Config_Normal.h  -Dti_sysbios_Build_useHwiMacros -Dti_sysbios_BIOS_smpEnabled__D=FALSE  $(XDCINCS)  -o $@  $<
	
	-@$(FIXDEP) $@.dep $@.dep
	

package/lib/lib/sysbios/debug/ti.sysbios.posix/package/package_ti.sysbios.posix.srm3: | .interfaces
package/lib/lib/sysbios/debug/ti.sysbios.posix/package/package_ti.sysbios.posix.srm3: package/package_ti.sysbios.posix.c lib/sysbios/debug/ti.sysbios.posix.arm3.mak
	@$(RM) $@.dep
	$(RM) $@
	@$(MSG) clrm3 $< ...
	LC_ALL=C $(iar.targets.arm.M3.rootDir)/bin/iccarm  --silent --aeabi --cpu=Cortex-M3 --diag_suppress=Pa050,Go005 --endian=little -e --thumb  -Dxdc_target_name__=M3 -Dxdc_target_types__=iar/targets/arm/std.h -Dxdc_bld__profile_debug -Dxdc_bld__vers_1_0_7_50_1 --debug --dlib_config $(iar.targets.arm.M3.rootDir)/inc/c/DLib_Config_Normal.h  -Dti_sysbios_Build_useHwiMacros -Dti_sysbios_BIOS_smpEnabled__D=FALSE  $(XDCINCS)  -o $@  $<
	
	-@$(FIXDEP) $@.dep $@.dep
	

ifeq (,$(MK_NOGENDEPS))
-include package/lib/lib/sysbios/debug/ti.sysbios.posix/pthread.orm3.dep
package/lib/lib/sysbios/debug/ti.sysbios.posix/pthread.orm3.dep: ;
endif

package/lib/lib/sysbios/debug/ti.sysbios.posix/pthread.orm3: | .interfaces
package/lib/lib/sysbios/debug/ti.sysbios.posix/pthread.orm3: pthread.c lib/sysbios/debug/ti.sysbios.posix.arm3.mak
	@$(RM) $@.dep
	$(RM) $@
	@$(MSG) clrm3 $< ...
	LC_ALL=C $(iar.targets.arm.M3.rootDir)/bin/iccarm  --silent --aeabi --cpu=Cortex-M3 --diag_suppress=Pa050,Go005 --endian=little -e --thumb  -Dxdc_target_name__=M3 -Dxdc_target_types__=iar/targets/arm/std.h -Dxdc_bld__profile_debug -Dxdc_bld__vers_1_0_7_50_1 --debug --dlib_config $(iar.targets.arm.M3.rootDir)/inc/c/DLib_Config_Normal.h  -Dti_sysbios_Build_useHwiMacros -Dti_sysbios_BIOS_smpEnabled__D=FALSE  $(XDCINCS)  -o $@  $<
	
	-@$(FIXDEP) $@.dep $@.dep
	

package/lib/lib/sysbios/debug/ti.sysbios.posix/pthread.srm3: | .interfaces
package/lib/lib/sysbios/debug/ti.sysbios.posix/pthread.srm3: pthread.c lib/sysbios/debug/ti.sysbios.posix.arm3.mak
	@$(RM) $@.dep
	$(RM) $@
	@$(MSG) clrm3 $< ...
	LC_ALL=C $(iar.targets.arm.M3.rootDir)/bin/iccarm  --silent --aeabi --cpu=Cortex-M3 --diag_suppress=Pa050,Go005 --endian=little -e --thumb  -Dxdc_target_name__=M3 -Dxdc_target_types__=iar/targets/arm/std.h -Dxdc_bld__profile_debug -Dxdc_bld__vers_1_0_7_50_1 --debug --dlib_config $(iar.targets.arm.M3.rootDir)/inc/c/DLib_Config_Normal.h  -Dti_sysbios_Build_useHwiMacros -Dti_sysbios_BIOS_smpEnabled__D=FALSE  $(XDCINCS)  -o $@  $<
	
	-@$(FIXDEP) $@.dep $@.dep
	

ifeq (,$(MK_NOGENDEPS))
-include package/lib/lib/sysbios/debug/ti.sysbios.posix/pthread_barrier.orm3.dep
package/lib/lib/sysbios/debug/ti.sysbios.posix/pthread_barrier.orm3.dep: ;
endif

package/lib/lib/sysbios/debug/ti.sysbios.posix/pthread_barrier.orm3: | .interfaces
package/lib/lib/sysbios/debug/ti.sysbios.posix/pthread_barrier.orm3: pthread_barrier.c lib/sysbios/debug/ti.sysbios.posix.arm3.mak
	@$(RM) $@.dep
	$(RM) $@
	@$(MSG) clrm3 $< ...
	LC_ALL=C $(iar.targets.arm.M3.rootDir)/bin/iccarm  --silent --aeabi --cpu=Cortex-M3 --diag_suppress=Pa050,Go005 --endian=little -e --thumb  -Dxdc_target_name__=M3 -Dxdc_target_types__=iar/targets/arm/std.h -Dxdc_bld__profile_debug -Dxdc_bld__vers_1_0_7_50_1 --debug --dlib_config $(iar.targets.arm.M3.rootDir)/inc/c/DLib_Config_Normal.h  -Dti_sysbios_Build_useHwiMacros -Dti_sysbios_BIOS_smpEnabled__D=FALSE  $(XDCINCS)  -o $@  $<
	
	-@$(FIXDEP) $@.dep $@.dep
	

package/lib/lib/sysbios/debug/ti.sysbios.posix/pthread_barrier.srm3: | .interfaces
package/lib/lib/sysbios/debug/ti.sysbios.posix/pthread_barrier.srm3: pthread_barrier.c lib/sysbios/debug/ti.sysbios.posix.arm3.mak
	@$(RM) $@.dep
	$(RM) $@
	@$(MSG) clrm3 $< ...
	LC_ALL=C $(iar.targets.arm.M3.rootDir)/bin/iccarm  --silent --aeabi --cpu=Cortex-M3 --diag_suppress=Pa050,Go005 --endian=little -e --thumb  -Dxdc_target_name__=M3 -Dxdc_target_types__=iar/targets/arm/std.h -Dxdc_bld__profile_debug -Dxdc_bld__vers_1_0_7_50_1 --debug --dlib_config $(iar.targets.arm.M3.rootDir)/inc/c/DLib_Config_Normal.h  -Dti_sysbios_Build_useHwiMacros -Dti_sysbios_BIOS_smpEnabled__D=FALSE  $(XDCINCS)  -o $@  $<
	
	-@$(FIXDEP) $@.dep $@.dep
	

ifeq (,$(MK_NOGENDEPS))
-include package/lib/lib/sysbios/debug/ti.sysbios.posix/pthread_cond.orm3.dep
package/lib/lib/sysbios/debug/ti.sysbios.posix/pthread_cond.orm3.dep: ;
endif

package/lib/lib/sysbios/debug/ti.sysbios.posix/pthread_cond.orm3: | .interfaces
package/lib/lib/sysbios/debug/ti.sysbios.posix/pthread_cond.orm3: pthread_cond.c lib/sysbios/debug/ti.sysbios.posix.arm3.mak
	@$(RM) $@.dep
	$(RM) $@
	@$(MSG) clrm3 $< ...
	LC_ALL=C $(iar.targets.arm.M3.rootDir)/bin/iccarm  --silent --aeabi --cpu=Cortex-M3 --diag_suppress=Pa050,Go005 --endian=little -e --thumb  -Dxdc_target_name__=M3 -Dxdc_target_types__=iar/targets/arm/std.h -Dxdc_bld__profile_debug -Dxdc_bld__vers_1_0_7_50_1 --debug --dlib_config $(iar.targets.arm.M3.rootDir)/inc/c/DLib_Config_Normal.h  -Dti_sysbios_Build_useHwiMacros -Dti_sysbios_BIOS_smpEnabled__D=FALSE  $(XDCINCS)  -o $@  $<
	
	-@$(FIXDEP) $@.dep $@.dep
	

package/lib/lib/sysbios/debug/ti.sysbios.posix/pthread_cond.srm3: | .interfaces
package/lib/lib/sysbios/debug/ti.sysbios.posix/pthread_cond.srm3: pthread_cond.c lib/sysbios/debug/ti.sysbios.posix.arm3.mak
	@$(RM) $@.dep
	$(RM) $@
	@$(MSG) clrm3 $< ...
	LC_ALL=C $(iar.targets.arm.M3.rootDir)/bin/iccarm  --silent --aeabi --cpu=Cortex-M3 --diag_suppress=Pa050,Go005 --endian=little -e --thumb  -Dxdc_target_name__=M3 -Dxdc_target_types__=iar/targets/arm/std.h -Dxdc_bld__profile_debug -Dxdc_bld__vers_1_0_7_50_1 --debug --dlib_config $(iar.targets.arm.M3.rootDir)/inc/c/DLib_Config_Normal.h  -Dti_sysbios_Build_useHwiMacros -Dti_sysbios_BIOS_smpEnabled__D=FALSE  $(XDCINCS)  -o $@  $<
	
	-@$(FIXDEP) $@.dep $@.dep
	

ifeq (,$(MK_NOGENDEPS))
-include package/lib/lib/sysbios/debug/ti.sysbios.posix/pthread_key.orm3.dep
package/lib/lib/sysbios/debug/ti.sysbios.posix/pthread_key.orm3.dep: ;
endif

package/lib/lib/sysbios/debug/ti.sysbios.posix/pthread_key.orm3: | .interfaces
package/lib/lib/sysbios/debug/ti.sysbios.posix/pthread_key.orm3: pthread_key.c lib/sysbios/debug/ti.sysbios.posix.arm3.mak
	@$(RM) $@.dep
	$(RM) $@
	@$(MSG) clrm3 $< ...
	LC_ALL=C $(iar.targets.arm.M3.rootDir)/bin/iccarm  --silent --aeabi --cpu=Cortex-M3 --diag_suppress=Pa050,Go005 --endian=little -e --thumb  -Dxdc_target_name__=M3 -Dxdc_target_types__=iar/targets/arm/std.h -Dxdc_bld__profile_debug -Dxdc_bld__vers_1_0_7_50_1 --debug --dlib_config $(iar.targets.arm.M3.rootDir)/inc/c/DLib_Config_Normal.h  -Dti_sysbios_Build_useHwiMacros -Dti_sysbios_BIOS_smpEnabled__D=FALSE  $(XDCINCS)  -o $@  $<
	
	-@$(FIXDEP) $@.dep $@.dep
	

package/lib/lib/sysbios/debug/ti.sysbios.posix/pthread_key.srm3: | .interfaces
package/lib/lib/sysbios/debug/ti.sysbios.posix/pthread_key.srm3: pthread_key.c lib/sysbios/debug/ti.sysbios.posix.arm3.mak
	@$(RM) $@.dep
	$(RM) $@
	@$(MSG) clrm3 $< ...
	LC_ALL=C $(iar.targets.arm.M3.rootDir)/bin/iccarm  --silent --aeabi --cpu=Cortex-M3 --diag_suppress=Pa050,Go005 --endian=little -e --thumb  -Dxdc_target_name__=M3 -Dxdc_target_types__=iar/targets/arm/std.h -Dxdc_bld__profile_debug -Dxdc_bld__vers_1_0_7_50_1 --debug --dlib_config $(iar.targets.arm.M3.rootDir)/inc/c/DLib_Config_Normal.h  -Dti_sysbios_Build_useHwiMacros -Dti_sysbios_BIOS_smpEnabled__D=FALSE  $(XDCINCS)  -o $@  $<
	
	-@$(FIXDEP) $@.dep $@.dep
	

ifeq (,$(MK_NOGENDEPS))
-include package/lib/lib/sysbios/debug/ti.sysbios.posix/pthread_mutex.orm3.dep
package/lib/lib/sysbios/debug/ti.sysbios.posix/pthread_mutex.orm3.dep: ;
endif

package/lib/lib/sysbios/debug/ti.sysbios.posix/pthread_mutex.orm3: | .interfaces
package/lib/lib/sysbios/debug/ti.sysbios.posix/pthread_mutex.orm3: pthread_mutex.c lib/sysbios/debug/ti.sysbios.posix.arm3.mak
	@$(RM) $@.dep
	$(RM) $@
	@$(MSG) clrm3 $< ...
	LC_ALL=C $(iar.targets.arm.M3.rootDir)/bin/iccarm  --silent --aeabi --cpu=Cortex-M3 --diag_suppress=Pa050,Go005 --endian=little -e --thumb  -Dxdc_target_name__=M3 -Dxdc_target_types__=iar/targets/arm/std.h -Dxdc_bld__profile_debug -Dxdc_bld__vers_1_0_7_50_1 --debug --dlib_config $(iar.targets.arm.M3.rootDir)/inc/c/DLib_Config_Normal.h  -Dti_sysbios_Build_useHwiMacros -Dti_sysbios_BIOS_smpEnabled__D=FALSE  $(XDCINCS)  -o $@  $<
	
	-@$(FIXDEP) $@.dep $@.dep
	

package/lib/lib/sysbios/debug/ti.sysbios.posix/pthread_mutex.srm3: | .interfaces
package/lib/lib/sysbios/debug/ti.sysbios.posix/pthread_mutex.srm3: pthread_mutex.c lib/sysbios/debug/ti.sysbios.posix.arm3.mak
	@$(RM) $@.dep
	$(RM) $@
	@$(MSG) clrm3 $< ...
	LC_ALL=C $(iar.targets.arm.M3.rootDir)/bin/iccarm  --silent --aeabi --cpu=Cortex-M3 --diag_suppress=Pa050,Go005 --endian=little -e --thumb  -Dxdc_target_name__=M3 -Dxdc_target_types__=iar/targets/arm/std.h -Dxdc_bld__profile_debug -Dxdc_bld__vers_1_0_7_50_1 --debug --dlib_config $(iar.targets.arm.M3.rootDir)/inc/c/DLib_Config_Normal.h  -Dti_sysbios_Build_useHwiMacros -Dti_sysbios_BIOS_smpEnabled__D=FALSE  $(XDCINCS)  -o $@  $<
	
	-@$(FIXDEP) $@.dep $@.dep
	

ifeq (,$(MK_NOGENDEPS))
-include package/lib/lib/sysbios/debug/ti.sysbios.posix/pthread_rwlock.orm3.dep
package/lib/lib/sysbios/debug/ti.sysbios.posix/pthread_rwlock.orm3.dep: ;
endif

package/lib/lib/sysbios/debug/ti.sysbios.posix/pthread_rwlock.orm3: | .interfaces
package/lib/lib/sysbios/debug/ti.sysbios.posix/pthread_rwlock.orm3: pthread_rwlock.c lib/sysbios/debug/ti.sysbios.posix.arm3.mak
	@$(RM) $@.dep
	$(RM) $@
	@$(MSG) clrm3 $< ...
	LC_ALL=C $(iar.targets.arm.M3.rootDir)/bin/iccarm  --silent --aeabi --cpu=Cortex-M3 --diag_suppress=Pa050,Go005 --endian=little -e --thumb  -Dxdc_target_name__=M3 -Dxdc_target_types__=iar/targets/arm/std.h -Dxdc_bld__profile_debug -Dxdc_bld__vers_1_0_7_50_1 --debug --dlib_config $(iar.targets.arm.M3.rootDir)/inc/c/DLib_Config_Normal.h  -Dti_sysbios_Build_useHwiMacros -Dti_sysbios_BIOS_smpEnabled__D=FALSE  $(XDCINCS)  -o $@  $<
	
	-@$(FIXDEP) $@.dep $@.dep
	

package/lib/lib/sysbios/debug/ti.sysbios.posix/pthread_rwlock.srm3: | .interfaces
package/lib/lib/sysbios/debug/ti.sysbios.posix/pthread_rwlock.srm3: pthread_rwlock.c lib/sysbios/debug/ti.sysbios.posix.arm3.mak
	@$(RM) $@.dep
	$(RM) $@
	@$(MSG) clrm3 $< ...
	LC_ALL=C $(iar.targets.arm.M3.rootDir)/bin/iccarm  --silent --aeabi --cpu=Cortex-M3 --diag_suppress=Pa050,Go005 --endian=little -e --thumb  -Dxdc_target_name__=M3 -Dxdc_target_types__=iar/targets/arm/std.h -Dxdc_bld__profile_debug -Dxdc_bld__vers_1_0_7_50_1 --debug --dlib_config $(iar.targets.arm.M3.rootDir)/inc/c/DLib_Config_Normal.h  -Dti_sysbios_Build_useHwiMacros -Dti_sysbios_BIOS_smpEnabled__D=FALSE  $(XDCINCS)  -o $@  $<
	
	-@$(FIXDEP) $@.dep $@.dep
	

ifeq (,$(MK_NOGENDEPS))
-include package/lib/lib/sysbios/debug/ti.sysbios.posix/clock.orm3.dep
package/lib/lib/sysbios/debug/ti.sysbios.posix/clock.orm3.dep: ;
endif

package/lib/lib/sysbios/debug/ti.sysbios.posix/clock.orm3: | .interfaces
package/lib/lib/sysbios/debug/ti.sysbios.posix/clock.orm3: clock.c lib/sysbios/debug/ti.sysbios.posix.arm3.mak
	@$(RM) $@.dep
	$(RM) $@
	@$(MSG) clrm3 $< ...
	LC_ALL=C $(iar.targets.arm.M3.rootDir)/bin/iccarm  --silent --aeabi --cpu=Cortex-M3 --diag_suppress=Pa050,Go005 --endian=little -e --thumb  -Dxdc_target_name__=M3 -Dxdc_target_types__=iar/targets/arm/std.h -Dxdc_bld__profile_debug -Dxdc_bld__vers_1_0_7_50_1 --debug --dlib_config $(iar.targets.arm.M3.rootDir)/inc/c/DLib_Config_Normal.h  -Dti_sysbios_Build_useHwiMacros -Dti_sysbios_BIOS_smpEnabled__D=FALSE  $(XDCINCS)  -o $@  $<
	
	-@$(FIXDEP) $@.dep $@.dep
	

package/lib/lib/sysbios/debug/ti.sysbios.posix/clock.srm3: | .interfaces
package/lib/lib/sysbios/debug/ti.sysbios.posix/clock.srm3: clock.c lib/sysbios/debug/ti.sysbios.posix.arm3.mak
	@$(RM) $@.dep
	$(RM) $@
	@$(MSG) clrm3 $< ...
	LC_ALL=C $(iar.targets.arm.M3.rootDir)/bin/iccarm  --silent --aeabi --cpu=Cortex-M3 --diag_suppress=Pa050,Go005 --endian=little -e --thumb  -Dxdc_target_name__=M3 -Dxdc_target_types__=iar/targets/arm/std.h -Dxdc_bld__profile_debug -Dxdc_bld__vers_1_0_7_50_1 --debug --dlib_config $(iar.targets.arm.M3.rootDir)/inc/c/DLib_Config_Normal.h  -Dti_sysbios_Build_useHwiMacros -Dti_sysbios_BIOS_smpEnabled__D=FALSE  $(XDCINCS)  -o $@  $<
	
	-@$(FIXDEP) $@.dep $@.dep
	

ifeq (,$(MK_NOGENDEPS))
-include package/lib/lib/sysbios/debug/ti.sysbios.posix/mqueue.orm3.dep
package/lib/lib/sysbios/debug/ti.sysbios.posix/mqueue.orm3.dep: ;
endif

package/lib/lib/sysbios/debug/ti.sysbios.posix/mqueue.orm3: | .interfaces
package/lib/lib/sysbios/debug/ti.sysbios.posix/mqueue.orm3: mqueue.c lib/sysbios/debug/ti.sysbios.posix.arm3.mak
	@$(RM) $@.dep
	$(RM) $@
	@$(MSG) clrm3 $< ...
	LC_ALL=C $(iar.targets.arm.M3.rootDir)/bin/iccarm  --silent --aeabi --cpu=Cortex-M3 --diag_suppress=Pa050,Go005 --endian=little -e --thumb  -Dxdc_target_name__=M3 -Dxdc_target_types__=iar/targets/arm/std.h -Dxdc_bld__profile_debug -Dxdc_bld__vers_1_0_7_50_1 --debug --dlib_config $(iar.targets.arm.M3.rootDir)/inc/c/DLib_Config_Normal.h  -Dti_sysbios_Build_useHwiMacros -Dti_sysbios_BIOS_smpEnabled__D=FALSE  $(XDCINCS)  -o $@  $<
	
	-@$(FIXDEP) $@.dep $@.dep
	

package/lib/lib/sysbios/debug/ti.sysbios.posix/mqueue.srm3: | .interfaces
package/lib/lib/sysbios/debug/ti.sysbios.posix/mqueue.srm3: mqueue.c lib/sysbios/debug/ti.sysbios.posix.arm3.mak
	@$(RM) $@.dep
	$(RM) $@
	@$(MSG) clrm3 $< ...
	LC_ALL=C $(iar.targets.arm.M3.rootDir)/bin/iccarm  --silent --aeabi --cpu=Cortex-M3 --diag_suppress=Pa050,Go005 --endian=little -e --thumb  -Dxdc_target_name__=M3 -Dxdc_target_types__=iar/targets/arm/std.h -Dxdc_bld__profile_debug -Dxdc_bld__vers_1_0_7_50_1 --debug --dlib_config $(iar.targets.arm.M3.rootDir)/inc/c/DLib_Config_Normal.h  -Dti_sysbios_Build_useHwiMacros -Dti_sysbios_BIOS_smpEnabled__D=FALSE  $(XDCINCS)  -o $@  $<
	
	-@$(FIXDEP) $@.dep $@.dep
	

ifeq (,$(MK_NOGENDEPS))
-include package/lib/lib/sysbios/debug/ti.sysbios.posix/sched.orm3.dep
package/lib/lib/sysbios/debug/ti.sysbios.posix/sched.orm3.dep: ;
endif

package/lib/lib/sysbios/debug/ti.sysbios.posix/sched.orm3: | .interfaces
package/lib/lib/sysbios/debug/ti.sysbios.posix/sched.orm3: sched.c lib/sysbios/debug/ti.sysbios.posix.arm3.mak
	@$(RM) $@.dep
	$(RM) $@
	@$(MSG) clrm3 $< ...
	LC_ALL=C $(iar.targets.arm.M3.rootDir)/bin/iccarm  --silent --aeabi --cpu=Cortex-M3 --diag_suppress=Pa050,Go005 --endian=little -e --thumb  -Dxdc_target_name__=M3 -Dxdc_target_types__=iar/targets/arm/std.h -Dxdc_bld__profile_debug -Dxdc_bld__vers_1_0_7_50_1 --debug --dlib_config $(iar.targets.arm.M3.rootDir)/inc/c/DLib_Config_Normal.h  -Dti_sysbios_Build_useHwiMacros -Dti_sysbios_BIOS_smpEnabled__D=FALSE  $(XDCINCS)  -o $@  $<
	
	-@$(FIXDEP) $@.dep $@.dep
	

package/lib/lib/sysbios/debug/ti.sysbios.posix/sched.srm3: | .interfaces
package/lib/lib/sysbios/debug/ti.sysbios.posix/sched.srm3: sched.c lib/sysbios/debug/ti.sysbios.posix.arm3.mak
	@$(RM) $@.dep
	$(RM) $@
	@$(MSG) clrm3 $< ...
	LC_ALL=C $(iar.targets.arm.M3.rootDir)/bin/iccarm  --silent --aeabi --cpu=Cortex-M3 --diag_suppress=Pa050,Go005 --endian=little -e --thumb  -Dxdc_target_name__=M3 -Dxdc_target_types__=iar/targets/arm/std.h -Dxdc_bld__profile_debug -Dxdc_bld__vers_1_0_7_50_1 --debug --dlib_config $(iar.targets.arm.M3.rootDir)/inc/c/DLib_Config_Normal.h  -Dti_sysbios_Build_useHwiMacros -Dti_sysbios_BIOS_smpEnabled__D=FALSE  $(XDCINCS)  -o $@  $<
	
	-@$(FIXDEP) $@.dep $@.dep
	

ifeq (,$(MK_NOGENDEPS))
-include package/lib/lib/sysbios/debug/ti.sysbios.posix/semaphore.orm3.dep
package/lib/lib/sysbios/debug/ti.sysbios.posix/semaphore.orm3.dep: ;
endif

package/lib/lib/sysbios/debug/ti.sysbios.posix/semaphore.orm3: | .interfaces
package/lib/lib/sysbios/debug/ti.sysbios.posix/semaphore.orm3: semaphore.c lib/sysbios/debug/ti.sysbios.posix.arm3.mak
	@$(RM) $@.dep
	$(RM) $@
	@$(MSG) clrm3 $< ...
	LC_ALL=C $(iar.targets.arm.M3.rootDir)/bin/iccarm  --silent --aeabi --cpu=Cortex-M3 --diag_suppress=Pa050,Go005 --endian=little -e --thumb  -Dxdc_target_name__=M3 -Dxdc_target_types__=iar/targets/arm/std.h -Dxdc_bld__profile_debug -Dxdc_bld__vers_1_0_7_50_1 --debug --dlib_config $(iar.targets.arm.M3.rootDir)/inc/c/DLib_Config_Normal.h  -Dti_sysbios_Build_useHwiMacros -Dti_sysbios_BIOS_smpEnabled__D=FALSE  $(XDCINCS)  -o $@  $<
	
	-@$(FIXDEP) $@.dep $@.dep
	

package/lib/lib/sysbios/debug/ti.sysbios.posix/semaphore.srm3: | .interfaces
package/lib/lib/sysbios/debug/ti.sysbios.posix/semaphore.srm3: semaphore.c lib/sysbios/debug/ti.sysbios.posix.arm3.mak
	@$(RM) $@.dep
	$(RM) $@
	@$(MSG) clrm3 $< ...
	LC_ALL=C $(iar.targets.arm.M3.rootDir)/bin/iccarm  --silent --aeabi --cpu=Cortex-M3 --diag_suppress=Pa050,Go005 --endian=little -e --thumb  -Dxdc_target_name__=M3 -Dxdc_target_types__=iar/targets/arm/std.h -Dxdc_bld__profile_debug -Dxdc_bld__vers_1_0_7_50_1 --debug --dlib_config $(iar.targets.arm.M3.rootDir)/inc/c/DLib_Config_Normal.h  -Dti_sysbios_Build_useHwiMacros -Dti_sysbios_BIOS_smpEnabled__D=FALSE  $(XDCINCS)  -o $@  $<
	
	-@$(FIXDEP) $@.dep $@.dep
	

ifeq (,$(MK_NOGENDEPS))
-include package/lib/lib/sysbios/debug/ti.sysbios.posix/sleep.orm3.dep
package/lib/lib/sysbios/debug/ti.sysbios.posix/sleep.orm3.dep: ;
endif

package/lib/lib/sysbios/debug/ti.sysbios.posix/sleep.orm3: | .interfaces
package/lib/lib/sysbios/debug/ti.sysbios.posix/sleep.orm3: sleep.c lib/sysbios/debug/ti.sysbios.posix.arm3.mak
	@$(RM) $@.dep
	$(RM) $@
	@$(MSG) clrm3 $< ...
	LC_ALL=C $(iar.targets.arm.M3.rootDir)/bin/iccarm  --silent --aeabi --cpu=Cortex-M3 --diag_suppress=Pa050,Go005 --endian=little -e --thumb  -Dxdc_target_name__=M3 -Dxdc_target_types__=iar/targets/arm/std.h -Dxdc_bld__profile_debug -Dxdc_bld__vers_1_0_7_50_1 --debug --dlib_config $(iar.targets.arm.M3.rootDir)/inc/c/DLib_Config_Normal.h  -Dti_sysbios_Build_useHwiMacros -Dti_sysbios_BIOS_smpEnabled__D=FALSE  $(XDCINCS)  -o $@  $<
	
	-@$(FIXDEP) $@.dep $@.dep
	

package/lib/lib/sysbios/debug/ti.sysbios.posix/sleep.srm3: | .interfaces
package/lib/lib/sysbios/debug/ti.sysbios.posix/sleep.srm3: sleep.c lib/sysbios/debug/ti.sysbios.posix.arm3.mak
	@$(RM) $@.dep
	$(RM) $@
	@$(MSG) clrm3 $< ...
	LC_ALL=C $(iar.targets.arm.M3.rootDir)/bin/iccarm  --silent --aeabi --cpu=Cortex-M3 --diag_suppress=Pa050,Go005 --endian=little -e --thumb  -Dxdc_target_name__=M3 -Dxdc_target_types__=iar/targets/arm/std.h -Dxdc_bld__profile_debug -Dxdc_bld__vers_1_0_7_50_1 --debug --dlib_config $(iar.targets.arm.M3.rootDir)/inc/c/DLib_Config_Normal.h  -Dti_sysbios_Build_useHwiMacros -Dti_sysbios_BIOS_smpEnabled__D=FALSE  $(XDCINCS)  -o $@  $<
	
	-@$(FIXDEP) $@.dep $@.dep
	

ifeq (,$(MK_NOGENDEPS))
-include package/lib/lib/sysbios/debug/ti.sysbios.posix/timer.orm3.dep
package/lib/lib/sysbios/debug/ti.sysbios.posix/timer.orm3.dep: ;
endif

package/lib/lib/sysbios/debug/ti.sysbios.posix/timer.orm3: | .interfaces
package/lib/lib/sysbios/debug/ti.sysbios.posix/timer.orm3: timer.c lib/sysbios/debug/ti.sysbios.posix.arm3.mak
	@$(RM) $@.dep
	$(RM) $@
	@$(MSG) clrm3 $< ...
	LC_ALL=C $(iar.targets.arm.M3.rootDir)/bin/iccarm  --silent --aeabi --cpu=Cortex-M3 --diag_suppress=Pa050,Go005 --endian=little -e --thumb  -Dxdc_target_name__=M3 -Dxdc_target_types__=iar/targets/arm/std.h -Dxdc_bld__profile_debug -Dxdc_bld__vers_1_0_7_50_1 --debug --dlib_config $(iar.targets.arm.M3.rootDir)/inc/c/DLib_Config_Normal.h  -Dti_sysbios_Build_useHwiMacros -Dti_sysbios_BIOS_smpEnabled__D=FALSE  $(XDCINCS)  -o $@  $<
	
	-@$(FIXDEP) $@.dep $@.dep
	

package/lib/lib/sysbios/debug/ti.sysbios.posix/timer.srm3: | .interfaces
package/lib/lib/sysbios/debug/ti.sysbios.posix/timer.srm3: timer.c lib/sysbios/debug/ti.sysbios.posix.arm3.mak
	@$(RM) $@.dep
	$(RM) $@
	@$(MSG) clrm3 $< ...
	LC_ALL=C $(iar.targets.arm.M3.rootDir)/bin/iccarm  --silent --aeabi --cpu=Cortex-M3 --diag_suppress=Pa050,Go005 --endian=little -e --thumb  -Dxdc_target_name__=M3 -Dxdc_target_types__=iar/targets/arm/std.h -Dxdc_bld__profile_debug -Dxdc_bld__vers_1_0_7_50_1 --debug --dlib_config $(iar.targets.arm.M3.rootDir)/inc/c/DLib_Config_Normal.h  -Dti_sysbios_Build_useHwiMacros -Dti_sysbios_BIOS_smpEnabled__D=FALSE  $(XDCINCS)  -o $@  $<
	
	-@$(FIXDEP) $@.dep $@.dep
	

clean,rm3 ::
	-$(RM) package/lib/lib/sysbios/debug/ti.sysbios.posix/package/package_ti.sysbios.posix.orm3
	-$(RM) package/lib/lib/sysbios/debug/ti.sysbios.posix/pthread.orm3
	-$(RM) package/lib/lib/sysbios/debug/ti.sysbios.posix/pthread_barrier.orm3
	-$(RM) package/lib/lib/sysbios/debug/ti.sysbios.posix/pthread_cond.orm3
	-$(RM) package/lib/lib/sysbios/debug/ti.sysbios.posix/pthread_key.orm3
	-$(RM) package/lib/lib/sysbios/debug/ti.sysbios.posix/pthread_mutex.orm3
	-$(RM) package/lib/lib/sysbios/debug/ti.sysbios.posix/pthread_rwlock.orm3
	-$(RM) package/lib/lib/sysbios/debug/ti.sysbios.posix/clock.orm3
	-$(RM) package/lib/lib/sysbios/debug/ti.sysbios.posix/mqueue.orm3
	-$(RM) package/lib/lib/sysbios/debug/ti.sysbios.posix/sched.orm3
	-$(RM) package/lib/lib/sysbios/debug/ti.sysbios.posix/semaphore.orm3
	-$(RM) package/lib/lib/sysbios/debug/ti.sysbios.posix/sleep.orm3
	-$(RM) package/lib/lib/sysbios/debug/ti.sysbios.posix/timer.orm3
	-$(RM) package/lib/lib/sysbios/debug/ti.sysbios.posix/package/package_ti.sysbios.posix.srm3
	-$(RM) package/lib/lib/sysbios/debug/ti.sysbios.posix/pthread.srm3
	-$(RM) package/lib/lib/sysbios/debug/ti.sysbios.posix/pthread_barrier.srm3
	-$(RM) package/lib/lib/sysbios/debug/ti.sysbios.posix/pthread_cond.srm3
	-$(RM) package/lib/lib/sysbios/debug/ti.sysbios.posix/pthread_key.srm3
	-$(RM) package/lib/lib/sysbios/debug/ti.sysbios.posix/pthread_mutex.srm3
	-$(RM) package/lib/lib/sysbios/debug/ti.sysbios.posix/pthread_rwlock.srm3
	-$(RM) package/lib/lib/sysbios/debug/ti.sysbios.posix/clock.srm3
	-$(RM) package/lib/lib/sysbios/debug/ti.sysbios.posix/mqueue.srm3
	-$(RM) package/lib/lib/sysbios/debug/ti.sysbios.posix/sched.srm3
	-$(RM) package/lib/lib/sysbios/debug/ti.sysbios.posix/semaphore.srm3
	-$(RM) package/lib/lib/sysbios/debug/ti.sysbios.posix/sleep.srm3
	-$(RM) package/lib/lib/sysbios/debug/ti.sysbios.posix/timer.srm3

lib/sysbios/debug/ti.sysbios.posix.arm3: package/lib/lib/sysbios/debug/ti.sysbios.posix/package/package_ti.sysbios.posix.orm3 package/lib/lib/sysbios/debug/ti.sysbios.posix/pthread.orm3 package/lib/lib/sysbios/debug/ti.sysbios.posix/pthread_barrier.orm3 package/lib/lib/sysbios/debug/ti.sysbios.posix/pthread_cond.orm3 package/lib/lib/sysbios/debug/ti.sysbios.posix/pthread_key.orm3 package/lib/lib/sysbios/debug/ti.sysbios.posix/pthread_mutex.orm3 package/lib/lib/sysbios/debug/ti.sysbios.posix/pthread_rwlock.orm3 package/lib/lib/sysbios/debug/ti.sysbios.posix/clock.orm3 package/lib/lib/sysbios/debug/ti.sysbios.posix/mqueue.orm3 package/lib/lib/sysbios/debug/ti.sysbios.posix/sched.orm3 package/lib/lib/sysbios/debug/ti.sysbios.posix/semaphore.orm3 package/lib/lib/sysbios/debug/ti.sysbios.posix/sleep.orm3 package/lib/lib/sysbios/debug/ti.sysbios.posix/timer.orm3 lib/sysbios/debug/ti.sysbios.posix.arm3.mak

clean::
	-$(RM) lib/sysbios/debug/ti.sysbios.posix.arm3.mak
