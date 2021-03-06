#
#  Do not edit this file.  This file is generated from 
#  package.bld.  Any modifications to this file will be 
#  overwritten whenever makefiles are re-generated.
#
#  target compatibility key = gnu.targets.arm.M3{1,0,4.8,4
#
ifeq (,$(MK_NOGENDEPS))
-include package/lib/lib/sysbios/debug/ti.sysbios.posix/package/package_ti.sysbios.posix.om3g.dep
package/lib/lib/sysbios/debug/ti.sysbios.posix/package/package_ti.sysbios.posix.om3g.dep: ;
endif

package/lib/lib/sysbios/debug/ti.sysbios.posix/package/package_ti.sysbios.posix.om3g: | .interfaces
package/lib/lib/sysbios/debug/ti.sysbios.posix/package/package_ti.sysbios.posix.om3g: package/package_ti.sysbios.posix.c lib/sysbios/debug/ti.sysbios.posix.am3g.mak
	@$(RM) $@.dep
	$(RM) $@
	@$(MSG) clm3g $< ...
	$(gnu.targets.arm.M3.rootDir)/bin/arm-none-eabi-gcc -c -MD -MF $@.dep -x c  -Wunused -Wunknown-pragmas -ffunction-sections -fdata-sections  -mcpu=cortex-m3 -mthumb -mabi=aapcs -g -Dfar= -D__DYNAMIC_REENT__  -g  -D_DEBUG_=1 -Dxdc_target_name__=M3 -Dxdc_target_types__=gnu/targets/arm/std.h -Dxdc_bld__profile_debug -Dxdc_bld__vers_1_0_4_8_4 -g  -Dti_sysbios_Build_useHwiMacros -Dti_sysbios_BIOS_smpEnabled__D=FALSE -I/db/vtree/library/trees/zumaprod/zumaprod-o06/exports/tirtos_cc13xx_cc26xx_2_21_00_06/products/bios_6_46_01_37/packages/gnu/targets/arm//libs/install-native/arm-none-eabi/include   $(XDCINCS)  -o $@ $<
	-@$(FIXDEP) $@.dep $@.dep
	
package/lib/lib/sysbios/debug/ti.sysbios.posix/package/package_ti.sysbios.posix.om3g: export LD_LIBRARY_PATH=

package/lib/lib/sysbios/debug/ti.sysbios.posix/package/package_ti.sysbios.posix.sm3g: | .interfaces
package/lib/lib/sysbios/debug/ti.sysbios.posix/package/package_ti.sysbios.posix.sm3g: package/package_ti.sysbios.posix.c lib/sysbios/debug/ti.sysbios.posix.am3g.mak
	@$(RM) $@.dep
	$(RM) $@
	@$(MSG) clm3g -S $< ...
	$(gnu.targets.arm.M3.rootDir)/bin/arm-none-eabi-gcc -c -MD -MF $@.dep -x c -S -Wunused -Wunknown-pragmas -ffunction-sections -fdata-sections  -mcpu=cortex-m3 -mthumb -mabi=aapcs -g -Dfar= -D__DYNAMIC_REENT__  -g  -D_DEBUG_=1 -Dxdc_target_name__=M3 -Dxdc_target_types__=gnu/targets/arm/std.h -Dxdc_bld__profile_debug -Dxdc_bld__vers_1_0_4_8_4 -g  -Dti_sysbios_Build_useHwiMacros -Dti_sysbios_BIOS_smpEnabled__D=FALSE  $(XDCINCS)  -o $@ $<
	-@$(FIXDEP) $@.dep $@.dep
	
package/lib/lib/sysbios/debug/ti.sysbios.posix/package/package_ti.sysbios.posix.sm3g: export LD_LIBRARY_PATH=

ifeq (,$(MK_NOGENDEPS))
-include package/lib/lib/sysbios/debug/ti.sysbios.posix/pthread.om3g.dep
package/lib/lib/sysbios/debug/ti.sysbios.posix/pthread.om3g.dep: ;
endif

package/lib/lib/sysbios/debug/ti.sysbios.posix/pthread.om3g: | .interfaces
package/lib/lib/sysbios/debug/ti.sysbios.posix/pthread.om3g: pthread.c lib/sysbios/debug/ti.sysbios.posix.am3g.mak
	@$(RM) $@.dep
	$(RM) $@
	@$(MSG) clm3g $< ...
	$(gnu.targets.arm.M3.rootDir)/bin/arm-none-eabi-gcc -c -MD -MF $@.dep -x c  -Wunused -Wunknown-pragmas -ffunction-sections -fdata-sections  -mcpu=cortex-m3 -mthumb -mabi=aapcs -g -Dfar= -D__DYNAMIC_REENT__  -g  -D_DEBUG_=1 -Dxdc_target_name__=M3 -Dxdc_target_types__=gnu/targets/arm/std.h -Dxdc_bld__profile_debug -Dxdc_bld__vers_1_0_4_8_4 -g  -Dti_sysbios_Build_useHwiMacros -Dti_sysbios_BIOS_smpEnabled__D=FALSE -I/db/vtree/library/trees/zumaprod/zumaprod-o06/exports/tirtos_cc13xx_cc26xx_2_21_00_06/products/bios_6_46_01_37/packages/gnu/targets/arm//libs/install-native/arm-none-eabi/include   $(XDCINCS)  -o $@ $<
	-@$(FIXDEP) $@.dep $@.dep
	
package/lib/lib/sysbios/debug/ti.sysbios.posix/pthread.om3g: export LD_LIBRARY_PATH=

package/lib/lib/sysbios/debug/ti.sysbios.posix/pthread.sm3g: | .interfaces
package/lib/lib/sysbios/debug/ti.sysbios.posix/pthread.sm3g: pthread.c lib/sysbios/debug/ti.sysbios.posix.am3g.mak
	@$(RM) $@.dep
	$(RM) $@
	@$(MSG) clm3g -S $< ...
	$(gnu.targets.arm.M3.rootDir)/bin/arm-none-eabi-gcc -c -MD -MF $@.dep -x c -S -Wunused -Wunknown-pragmas -ffunction-sections -fdata-sections  -mcpu=cortex-m3 -mthumb -mabi=aapcs -g -Dfar= -D__DYNAMIC_REENT__  -g  -D_DEBUG_=1 -Dxdc_target_name__=M3 -Dxdc_target_types__=gnu/targets/arm/std.h -Dxdc_bld__profile_debug -Dxdc_bld__vers_1_0_4_8_4 -g  -Dti_sysbios_Build_useHwiMacros -Dti_sysbios_BIOS_smpEnabled__D=FALSE  $(XDCINCS)  -o $@ $<
	-@$(FIXDEP) $@.dep $@.dep
	
package/lib/lib/sysbios/debug/ti.sysbios.posix/pthread.sm3g: export LD_LIBRARY_PATH=

ifeq (,$(MK_NOGENDEPS))
-include package/lib/lib/sysbios/debug/ti.sysbios.posix/pthread_barrier.om3g.dep
package/lib/lib/sysbios/debug/ti.sysbios.posix/pthread_barrier.om3g.dep: ;
endif

package/lib/lib/sysbios/debug/ti.sysbios.posix/pthread_barrier.om3g: | .interfaces
package/lib/lib/sysbios/debug/ti.sysbios.posix/pthread_barrier.om3g: pthread_barrier.c lib/sysbios/debug/ti.sysbios.posix.am3g.mak
	@$(RM) $@.dep
	$(RM) $@
	@$(MSG) clm3g $< ...
	$(gnu.targets.arm.M3.rootDir)/bin/arm-none-eabi-gcc -c -MD -MF $@.dep -x c  -Wunused -Wunknown-pragmas -ffunction-sections -fdata-sections  -mcpu=cortex-m3 -mthumb -mabi=aapcs -g -Dfar= -D__DYNAMIC_REENT__  -g  -D_DEBUG_=1 -Dxdc_target_name__=M3 -Dxdc_target_types__=gnu/targets/arm/std.h -Dxdc_bld__profile_debug -Dxdc_bld__vers_1_0_4_8_4 -g  -Dti_sysbios_Build_useHwiMacros -Dti_sysbios_BIOS_smpEnabled__D=FALSE -I/db/vtree/library/trees/zumaprod/zumaprod-o06/exports/tirtos_cc13xx_cc26xx_2_21_00_06/products/bios_6_46_01_37/packages/gnu/targets/arm//libs/install-native/arm-none-eabi/include   $(XDCINCS)  -o $@ $<
	-@$(FIXDEP) $@.dep $@.dep
	
package/lib/lib/sysbios/debug/ti.sysbios.posix/pthread_barrier.om3g: export LD_LIBRARY_PATH=

package/lib/lib/sysbios/debug/ti.sysbios.posix/pthread_barrier.sm3g: | .interfaces
package/lib/lib/sysbios/debug/ti.sysbios.posix/pthread_barrier.sm3g: pthread_barrier.c lib/sysbios/debug/ti.sysbios.posix.am3g.mak
	@$(RM) $@.dep
	$(RM) $@
	@$(MSG) clm3g -S $< ...
	$(gnu.targets.arm.M3.rootDir)/bin/arm-none-eabi-gcc -c -MD -MF $@.dep -x c -S -Wunused -Wunknown-pragmas -ffunction-sections -fdata-sections  -mcpu=cortex-m3 -mthumb -mabi=aapcs -g -Dfar= -D__DYNAMIC_REENT__  -g  -D_DEBUG_=1 -Dxdc_target_name__=M3 -Dxdc_target_types__=gnu/targets/arm/std.h -Dxdc_bld__profile_debug -Dxdc_bld__vers_1_0_4_8_4 -g  -Dti_sysbios_Build_useHwiMacros -Dti_sysbios_BIOS_smpEnabled__D=FALSE  $(XDCINCS)  -o $@ $<
	-@$(FIXDEP) $@.dep $@.dep
	
package/lib/lib/sysbios/debug/ti.sysbios.posix/pthread_barrier.sm3g: export LD_LIBRARY_PATH=

ifeq (,$(MK_NOGENDEPS))
-include package/lib/lib/sysbios/debug/ti.sysbios.posix/pthread_cond.om3g.dep
package/lib/lib/sysbios/debug/ti.sysbios.posix/pthread_cond.om3g.dep: ;
endif

package/lib/lib/sysbios/debug/ti.sysbios.posix/pthread_cond.om3g: | .interfaces
package/lib/lib/sysbios/debug/ti.sysbios.posix/pthread_cond.om3g: pthread_cond.c lib/sysbios/debug/ti.sysbios.posix.am3g.mak
	@$(RM) $@.dep
	$(RM) $@
	@$(MSG) clm3g $< ...
	$(gnu.targets.arm.M3.rootDir)/bin/arm-none-eabi-gcc -c -MD -MF $@.dep -x c  -Wunused -Wunknown-pragmas -ffunction-sections -fdata-sections  -mcpu=cortex-m3 -mthumb -mabi=aapcs -g -Dfar= -D__DYNAMIC_REENT__  -g  -D_DEBUG_=1 -Dxdc_target_name__=M3 -Dxdc_target_types__=gnu/targets/arm/std.h -Dxdc_bld__profile_debug -Dxdc_bld__vers_1_0_4_8_4 -g  -Dti_sysbios_Build_useHwiMacros -Dti_sysbios_BIOS_smpEnabled__D=FALSE -I/db/vtree/library/trees/zumaprod/zumaprod-o06/exports/tirtos_cc13xx_cc26xx_2_21_00_06/products/bios_6_46_01_37/packages/gnu/targets/arm//libs/install-native/arm-none-eabi/include   $(XDCINCS)  -o $@ $<
	-@$(FIXDEP) $@.dep $@.dep
	
package/lib/lib/sysbios/debug/ti.sysbios.posix/pthread_cond.om3g: export LD_LIBRARY_PATH=

package/lib/lib/sysbios/debug/ti.sysbios.posix/pthread_cond.sm3g: | .interfaces
package/lib/lib/sysbios/debug/ti.sysbios.posix/pthread_cond.sm3g: pthread_cond.c lib/sysbios/debug/ti.sysbios.posix.am3g.mak
	@$(RM) $@.dep
	$(RM) $@
	@$(MSG) clm3g -S $< ...
	$(gnu.targets.arm.M3.rootDir)/bin/arm-none-eabi-gcc -c -MD -MF $@.dep -x c -S -Wunused -Wunknown-pragmas -ffunction-sections -fdata-sections  -mcpu=cortex-m3 -mthumb -mabi=aapcs -g -Dfar= -D__DYNAMIC_REENT__  -g  -D_DEBUG_=1 -Dxdc_target_name__=M3 -Dxdc_target_types__=gnu/targets/arm/std.h -Dxdc_bld__profile_debug -Dxdc_bld__vers_1_0_4_8_4 -g  -Dti_sysbios_Build_useHwiMacros -Dti_sysbios_BIOS_smpEnabled__D=FALSE  $(XDCINCS)  -o $@ $<
	-@$(FIXDEP) $@.dep $@.dep
	
package/lib/lib/sysbios/debug/ti.sysbios.posix/pthread_cond.sm3g: export LD_LIBRARY_PATH=

ifeq (,$(MK_NOGENDEPS))
-include package/lib/lib/sysbios/debug/ti.sysbios.posix/pthread_key.om3g.dep
package/lib/lib/sysbios/debug/ti.sysbios.posix/pthread_key.om3g.dep: ;
endif

package/lib/lib/sysbios/debug/ti.sysbios.posix/pthread_key.om3g: | .interfaces
package/lib/lib/sysbios/debug/ti.sysbios.posix/pthread_key.om3g: pthread_key.c lib/sysbios/debug/ti.sysbios.posix.am3g.mak
	@$(RM) $@.dep
	$(RM) $@
	@$(MSG) clm3g $< ...
	$(gnu.targets.arm.M3.rootDir)/bin/arm-none-eabi-gcc -c -MD -MF $@.dep -x c  -Wunused -Wunknown-pragmas -ffunction-sections -fdata-sections  -mcpu=cortex-m3 -mthumb -mabi=aapcs -g -Dfar= -D__DYNAMIC_REENT__  -g  -D_DEBUG_=1 -Dxdc_target_name__=M3 -Dxdc_target_types__=gnu/targets/arm/std.h -Dxdc_bld__profile_debug -Dxdc_bld__vers_1_0_4_8_4 -g  -Dti_sysbios_Build_useHwiMacros -Dti_sysbios_BIOS_smpEnabled__D=FALSE -I/db/vtree/library/trees/zumaprod/zumaprod-o06/exports/tirtos_cc13xx_cc26xx_2_21_00_06/products/bios_6_46_01_37/packages/gnu/targets/arm//libs/install-native/arm-none-eabi/include   $(XDCINCS)  -o $@ $<
	-@$(FIXDEP) $@.dep $@.dep
	
package/lib/lib/sysbios/debug/ti.sysbios.posix/pthread_key.om3g: export LD_LIBRARY_PATH=

package/lib/lib/sysbios/debug/ti.sysbios.posix/pthread_key.sm3g: | .interfaces
package/lib/lib/sysbios/debug/ti.sysbios.posix/pthread_key.sm3g: pthread_key.c lib/sysbios/debug/ti.sysbios.posix.am3g.mak
	@$(RM) $@.dep
	$(RM) $@
	@$(MSG) clm3g -S $< ...
	$(gnu.targets.arm.M3.rootDir)/bin/arm-none-eabi-gcc -c -MD -MF $@.dep -x c -S -Wunused -Wunknown-pragmas -ffunction-sections -fdata-sections  -mcpu=cortex-m3 -mthumb -mabi=aapcs -g -Dfar= -D__DYNAMIC_REENT__  -g  -D_DEBUG_=1 -Dxdc_target_name__=M3 -Dxdc_target_types__=gnu/targets/arm/std.h -Dxdc_bld__profile_debug -Dxdc_bld__vers_1_0_4_8_4 -g  -Dti_sysbios_Build_useHwiMacros -Dti_sysbios_BIOS_smpEnabled__D=FALSE  $(XDCINCS)  -o $@ $<
	-@$(FIXDEP) $@.dep $@.dep
	
package/lib/lib/sysbios/debug/ti.sysbios.posix/pthread_key.sm3g: export LD_LIBRARY_PATH=

ifeq (,$(MK_NOGENDEPS))
-include package/lib/lib/sysbios/debug/ti.sysbios.posix/pthread_mutex.om3g.dep
package/lib/lib/sysbios/debug/ti.sysbios.posix/pthread_mutex.om3g.dep: ;
endif

package/lib/lib/sysbios/debug/ti.sysbios.posix/pthread_mutex.om3g: | .interfaces
package/lib/lib/sysbios/debug/ti.sysbios.posix/pthread_mutex.om3g: pthread_mutex.c lib/sysbios/debug/ti.sysbios.posix.am3g.mak
	@$(RM) $@.dep
	$(RM) $@
	@$(MSG) clm3g $< ...
	$(gnu.targets.arm.M3.rootDir)/bin/arm-none-eabi-gcc -c -MD -MF $@.dep -x c  -Wunused -Wunknown-pragmas -ffunction-sections -fdata-sections  -mcpu=cortex-m3 -mthumb -mabi=aapcs -g -Dfar= -D__DYNAMIC_REENT__  -g  -D_DEBUG_=1 -Dxdc_target_name__=M3 -Dxdc_target_types__=gnu/targets/arm/std.h -Dxdc_bld__profile_debug -Dxdc_bld__vers_1_0_4_8_4 -g  -Dti_sysbios_Build_useHwiMacros -Dti_sysbios_BIOS_smpEnabled__D=FALSE -I/db/vtree/library/trees/zumaprod/zumaprod-o06/exports/tirtos_cc13xx_cc26xx_2_21_00_06/products/bios_6_46_01_37/packages/gnu/targets/arm//libs/install-native/arm-none-eabi/include   $(XDCINCS)  -o $@ $<
	-@$(FIXDEP) $@.dep $@.dep
	
package/lib/lib/sysbios/debug/ti.sysbios.posix/pthread_mutex.om3g: export LD_LIBRARY_PATH=

package/lib/lib/sysbios/debug/ti.sysbios.posix/pthread_mutex.sm3g: | .interfaces
package/lib/lib/sysbios/debug/ti.sysbios.posix/pthread_mutex.sm3g: pthread_mutex.c lib/sysbios/debug/ti.sysbios.posix.am3g.mak
	@$(RM) $@.dep
	$(RM) $@
	@$(MSG) clm3g -S $< ...
	$(gnu.targets.arm.M3.rootDir)/bin/arm-none-eabi-gcc -c -MD -MF $@.dep -x c -S -Wunused -Wunknown-pragmas -ffunction-sections -fdata-sections  -mcpu=cortex-m3 -mthumb -mabi=aapcs -g -Dfar= -D__DYNAMIC_REENT__  -g  -D_DEBUG_=1 -Dxdc_target_name__=M3 -Dxdc_target_types__=gnu/targets/arm/std.h -Dxdc_bld__profile_debug -Dxdc_bld__vers_1_0_4_8_4 -g  -Dti_sysbios_Build_useHwiMacros -Dti_sysbios_BIOS_smpEnabled__D=FALSE  $(XDCINCS)  -o $@ $<
	-@$(FIXDEP) $@.dep $@.dep
	
package/lib/lib/sysbios/debug/ti.sysbios.posix/pthread_mutex.sm3g: export LD_LIBRARY_PATH=

ifeq (,$(MK_NOGENDEPS))
-include package/lib/lib/sysbios/debug/ti.sysbios.posix/pthread_rwlock.om3g.dep
package/lib/lib/sysbios/debug/ti.sysbios.posix/pthread_rwlock.om3g.dep: ;
endif

package/lib/lib/sysbios/debug/ti.sysbios.posix/pthread_rwlock.om3g: | .interfaces
package/lib/lib/sysbios/debug/ti.sysbios.posix/pthread_rwlock.om3g: pthread_rwlock.c lib/sysbios/debug/ti.sysbios.posix.am3g.mak
	@$(RM) $@.dep
	$(RM) $@
	@$(MSG) clm3g $< ...
	$(gnu.targets.arm.M3.rootDir)/bin/arm-none-eabi-gcc -c -MD -MF $@.dep -x c  -Wunused -Wunknown-pragmas -ffunction-sections -fdata-sections  -mcpu=cortex-m3 -mthumb -mabi=aapcs -g -Dfar= -D__DYNAMIC_REENT__  -g  -D_DEBUG_=1 -Dxdc_target_name__=M3 -Dxdc_target_types__=gnu/targets/arm/std.h -Dxdc_bld__profile_debug -Dxdc_bld__vers_1_0_4_8_4 -g  -Dti_sysbios_Build_useHwiMacros -Dti_sysbios_BIOS_smpEnabled__D=FALSE -I/db/vtree/library/trees/zumaprod/zumaprod-o06/exports/tirtos_cc13xx_cc26xx_2_21_00_06/products/bios_6_46_01_37/packages/gnu/targets/arm//libs/install-native/arm-none-eabi/include   $(XDCINCS)  -o $@ $<
	-@$(FIXDEP) $@.dep $@.dep
	
package/lib/lib/sysbios/debug/ti.sysbios.posix/pthread_rwlock.om3g: export LD_LIBRARY_PATH=

package/lib/lib/sysbios/debug/ti.sysbios.posix/pthread_rwlock.sm3g: | .interfaces
package/lib/lib/sysbios/debug/ti.sysbios.posix/pthread_rwlock.sm3g: pthread_rwlock.c lib/sysbios/debug/ti.sysbios.posix.am3g.mak
	@$(RM) $@.dep
	$(RM) $@
	@$(MSG) clm3g -S $< ...
	$(gnu.targets.arm.M3.rootDir)/bin/arm-none-eabi-gcc -c -MD -MF $@.dep -x c -S -Wunused -Wunknown-pragmas -ffunction-sections -fdata-sections  -mcpu=cortex-m3 -mthumb -mabi=aapcs -g -Dfar= -D__DYNAMIC_REENT__  -g  -D_DEBUG_=1 -Dxdc_target_name__=M3 -Dxdc_target_types__=gnu/targets/arm/std.h -Dxdc_bld__profile_debug -Dxdc_bld__vers_1_0_4_8_4 -g  -Dti_sysbios_Build_useHwiMacros -Dti_sysbios_BIOS_smpEnabled__D=FALSE  $(XDCINCS)  -o $@ $<
	-@$(FIXDEP) $@.dep $@.dep
	
package/lib/lib/sysbios/debug/ti.sysbios.posix/pthread_rwlock.sm3g: export LD_LIBRARY_PATH=

ifeq (,$(MK_NOGENDEPS))
-include package/lib/lib/sysbios/debug/ti.sysbios.posix/clock.om3g.dep
package/lib/lib/sysbios/debug/ti.sysbios.posix/clock.om3g.dep: ;
endif

package/lib/lib/sysbios/debug/ti.sysbios.posix/clock.om3g: | .interfaces
package/lib/lib/sysbios/debug/ti.sysbios.posix/clock.om3g: clock.c lib/sysbios/debug/ti.sysbios.posix.am3g.mak
	@$(RM) $@.dep
	$(RM) $@
	@$(MSG) clm3g $< ...
	$(gnu.targets.arm.M3.rootDir)/bin/arm-none-eabi-gcc -c -MD -MF $@.dep -x c  -Wunused -Wunknown-pragmas -ffunction-sections -fdata-sections  -mcpu=cortex-m3 -mthumb -mabi=aapcs -g -Dfar= -D__DYNAMIC_REENT__  -g  -D_DEBUG_=1 -Dxdc_target_name__=M3 -Dxdc_target_types__=gnu/targets/arm/std.h -Dxdc_bld__profile_debug -Dxdc_bld__vers_1_0_4_8_4 -g  -Dti_sysbios_Build_useHwiMacros -Dti_sysbios_BIOS_smpEnabled__D=FALSE -I/db/vtree/library/trees/zumaprod/zumaprod-o06/exports/tirtos_cc13xx_cc26xx_2_21_00_06/products/bios_6_46_01_37/packages/gnu/targets/arm//libs/install-native/arm-none-eabi/include   $(XDCINCS)  -o $@ $<
	-@$(FIXDEP) $@.dep $@.dep
	
package/lib/lib/sysbios/debug/ti.sysbios.posix/clock.om3g: export LD_LIBRARY_PATH=

package/lib/lib/sysbios/debug/ti.sysbios.posix/clock.sm3g: | .interfaces
package/lib/lib/sysbios/debug/ti.sysbios.posix/clock.sm3g: clock.c lib/sysbios/debug/ti.sysbios.posix.am3g.mak
	@$(RM) $@.dep
	$(RM) $@
	@$(MSG) clm3g -S $< ...
	$(gnu.targets.arm.M3.rootDir)/bin/arm-none-eabi-gcc -c -MD -MF $@.dep -x c -S -Wunused -Wunknown-pragmas -ffunction-sections -fdata-sections  -mcpu=cortex-m3 -mthumb -mabi=aapcs -g -Dfar= -D__DYNAMIC_REENT__  -g  -D_DEBUG_=1 -Dxdc_target_name__=M3 -Dxdc_target_types__=gnu/targets/arm/std.h -Dxdc_bld__profile_debug -Dxdc_bld__vers_1_0_4_8_4 -g  -Dti_sysbios_Build_useHwiMacros -Dti_sysbios_BIOS_smpEnabled__D=FALSE  $(XDCINCS)  -o $@ $<
	-@$(FIXDEP) $@.dep $@.dep
	
package/lib/lib/sysbios/debug/ti.sysbios.posix/clock.sm3g: export LD_LIBRARY_PATH=

ifeq (,$(MK_NOGENDEPS))
-include package/lib/lib/sysbios/debug/ti.sysbios.posix/mqueue.om3g.dep
package/lib/lib/sysbios/debug/ti.sysbios.posix/mqueue.om3g.dep: ;
endif

package/lib/lib/sysbios/debug/ti.sysbios.posix/mqueue.om3g: | .interfaces
package/lib/lib/sysbios/debug/ti.sysbios.posix/mqueue.om3g: mqueue.c lib/sysbios/debug/ti.sysbios.posix.am3g.mak
	@$(RM) $@.dep
	$(RM) $@
	@$(MSG) clm3g $< ...
	$(gnu.targets.arm.M3.rootDir)/bin/arm-none-eabi-gcc -c -MD -MF $@.dep -x c  -Wunused -Wunknown-pragmas -ffunction-sections -fdata-sections  -mcpu=cortex-m3 -mthumb -mabi=aapcs -g -Dfar= -D__DYNAMIC_REENT__  -g  -D_DEBUG_=1 -Dxdc_target_name__=M3 -Dxdc_target_types__=gnu/targets/arm/std.h -Dxdc_bld__profile_debug -Dxdc_bld__vers_1_0_4_8_4 -g  -Dti_sysbios_Build_useHwiMacros -Dti_sysbios_BIOS_smpEnabled__D=FALSE -I/db/vtree/library/trees/zumaprod/zumaprod-o06/exports/tirtos_cc13xx_cc26xx_2_21_00_06/products/bios_6_46_01_37/packages/gnu/targets/arm//libs/install-native/arm-none-eabi/include   $(XDCINCS)  -o $@ $<
	-@$(FIXDEP) $@.dep $@.dep
	
package/lib/lib/sysbios/debug/ti.sysbios.posix/mqueue.om3g: export LD_LIBRARY_PATH=

package/lib/lib/sysbios/debug/ti.sysbios.posix/mqueue.sm3g: | .interfaces
package/lib/lib/sysbios/debug/ti.sysbios.posix/mqueue.sm3g: mqueue.c lib/sysbios/debug/ti.sysbios.posix.am3g.mak
	@$(RM) $@.dep
	$(RM) $@
	@$(MSG) clm3g -S $< ...
	$(gnu.targets.arm.M3.rootDir)/bin/arm-none-eabi-gcc -c -MD -MF $@.dep -x c -S -Wunused -Wunknown-pragmas -ffunction-sections -fdata-sections  -mcpu=cortex-m3 -mthumb -mabi=aapcs -g -Dfar= -D__DYNAMIC_REENT__  -g  -D_DEBUG_=1 -Dxdc_target_name__=M3 -Dxdc_target_types__=gnu/targets/arm/std.h -Dxdc_bld__profile_debug -Dxdc_bld__vers_1_0_4_8_4 -g  -Dti_sysbios_Build_useHwiMacros -Dti_sysbios_BIOS_smpEnabled__D=FALSE  $(XDCINCS)  -o $@ $<
	-@$(FIXDEP) $@.dep $@.dep
	
package/lib/lib/sysbios/debug/ti.sysbios.posix/mqueue.sm3g: export LD_LIBRARY_PATH=

ifeq (,$(MK_NOGENDEPS))
-include package/lib/lib/sysbios/debug/ti.sysbios.posix/sched.om3g.dep
package/lib/lib/sysbios/debug/ti.sysbios.posix/sched.om3g.dep: ;
endif

package/lib/lib/sysbios/debug/ti.sysbios.posix/sched.om3g: | .interfaces
package/lib/lib/sysbios/debug/ti.sysbios.posix/sched.om3g: sched.c lib/sysbios/debug/ti.sysbios.posix.am3g.mak
	@$(RM) $@.dep
	$(RM) $@
	@$(MSG) clm3g $< ...
	$(gnu.targets.arm.M3.rootDir)/bin/arm-none-eabi-gcc -c -MD -MF $@.dep -x c  -Wunused -Wunknown-pragmas -ffunction-sections -fdata-sections  -mcpu=cortex-m3 -mthumb -mabi=aapcs -g -Dfar= -D__DYNAMIC_REENT__  -g  -D_DEBUG_=1 -Dxdc_target_name__=M3 -Dxdc_target_types__=gnu/targets/arm/std.h -Dxdc_bld__profile_debug -Dxdc_bld__vers_1_0_4_8_4 -g  -Dti_sysbios_Build_useHwiMacros -Dti_sysbios_BIOS_smpEnabled__D=FALSE -I/db/vtree/library/trees/zumaprod/zumaprod-o06/exports/tirtos_cc13xx_cc26xx_2_21_00_06/products/bios_6_46_01_37/packages/gnu/targets/arm//libs/install-native/arm-none-eabi/include   $(XDCINCS)  -o $@ $<
	-@$(FIXDEP) $@.dep $@.dep
	
package/lib/lib/sysbios/debug/ti.sysbios.posix/sched.om3g: export LD_LIBRARY_PATH=

package/lib/lib/sysbios/debug/ti.sysbios.posix/sched.sm3g: | .interfaces
package/lib/lib/sysbios/debug/ti.sysbios.posix/sched.sm3g: sched.c lib/sysbios/debug/ti.sysbios.posix.am3g.mak
	@$(RM) $@.dep
	$(RM) $@
	@$(MSG) clm3g -S $< ...
	$(gnu.targets.arm.M3.rootDir)/bin/arm-none-eabi-gcc -c -MD -MF $@.dep -x c -S -Wunused -Wunknown-pragmas -ffunction-sections -fdata-sections  -mcpu=cortex-m3 -mthumb -mabi=aapcs -g -Dfar= -D__DYNAMIC_REENT__  -g  -D_DEBUG_=1 -Dxdc_target_name__=M3 -Dxdc_target_types__=gnu/targets/arm/std.h -Dxdc_bld__profile_debug -Dxdc_bld__vers_1_0_4_8_4 -g  -Dti_sysbios_Build_useHwiMacros -Dti_sysbios_BIOS_smpEnabled__D=FALSE  $(XDCINCS)  -o $@ $<
	-@$(FIXDEP) $@.dep $@.dep
	
package/lib/lib/sysbios/debug/ti.sysbios.posix/sched.sm3g: export LD_LIBRARY_PATH=

ifeq (,$(MK_NOGENDEPS))
-include package/lib/lib/sysbios/debug/ti.sysbios.posix/semaphore.om3g.dep
package/lib/lib/sysbios/debug/ti.sysbios.posix/semaphore.om3g.dep: ;
endif

package/lib/lib/sysbios/debug/ti.sysbios.posix/semaphore.om3g: | .interfaces
package/lib/lib/sysbios/debug/ti.sysbios.posix/semaphore.om3g: semaphore.c lib/sysbios/debug/ti.sysbios.posix.am3g.mak
	@$(RM) $@.dep
	$(RM) $@
	@$(MSG) clm3g $< ...
	$(gnu.targets.arm.M3.rootDir)/bin/arm-none-eabi-gcc -c -MD -MF $@.dep -x c  -Wunused -Wunknown-pragmas -ffunction-sections -fdata-sections  -mcpu=cortex-m3 -mthumb -mabi=aapcs -g -Dfar= -D__DYNAMIC_REENT__  -g  -D_DEBUG_=1 -Dxdc_target_name__=M3 -Dxdc_target_types__=gnu/targets/arm/std.h -Dxdc_bld__profile_debug -Dxdc_bld__vers_1_0_4_8_4 -g  -Dti_sysbios_Build_useHwiMacros -Dti_sysbios_BIOS_smpEnabled__D=FALSE -I/db/vtree/library/trees/zumaprod/zumaprod-o06/exports/tirtos_cc13xx_cc26xx_2_21_00_06/products/bios_6_46_01_37/packages/gnu/targets/arm//libs/install-native/arm-none-eabi/include   $(XDCINCS)  -o $@ $<
	-@$(FIXDEP) $@.dep $@.dep
	
package/lib/lib/sysbios/debug/ti.sysbios.posix/semaphore.om3g: export LD_LIBRARY_PATH=

package/lib/lib/sysbios/debug/ti.sysbios.posix/semaphore.sm3g: | .interfaces
package/lib/lib/sysbios/debug/ti.sysbios.posix/semaphore.sm3g: semaphore.c lib/sysbios/debug/ti.sysbios.posix.am3g.mak
	@$(RM) $@.dep
	$(RM) $@
	@$(MSG) clm3g -S $< ...
	$(gnu.targets.arm.M3.rootDir)/bin/arm-none-eabi-gcc -c -MD -MF $@.dep -x c -S -Wunused -Wunknown-pragmas -ffunction-sections -fdata-sections  -mcpu=cortex-m3 -mthumb -mabi=aapcs -g -Dfar= -D__DYNAMIC_REENT__  -g  -D_DEBUG_=1 -Dxdc_target_name__=M3 -Dxdc_target_types__=gnu/targets/arm/std.h -Dxdc_bld__profile_debug -Dxdc_bld__vers_1_0_4_8_4 -g  -Dti_sysbios_Build_useHwiMacros -Dti_sysbios_BIOS_smpEnabled__D=FALSE  $(XDCINCS)  -o $@ $<
	-@$(FIXDEP) $@.dep $@.dep
	
package/lib/lib/sysbios/debug/ti.sysbios.posix/semaphore.sm3g: export LD_LIBRARY_PATH=

ifeq (,$(MK_NOGENDEPS))
-include package/lib/lib/sysbios/debug/ti.sysbios.posix/sleep.om3g.dep
package/lib/lib/sysbios/debug/ti.sysbios.posix/sleep.om3g.dep: ;
endif

package/lib/lib/sysbios/debug/ti.sysbios.posix/sleep.om3g: | .interfaces
package/lib/lib/sysbios/debug/ti.sysbios.posix/sleep.om3g: sleep.c lib/sysbios/debug/ti.sysbios.posix.am3g.mak
	@$(RM) $@.dep
	$(RM) $@
	@$(MSG) clm3g $< ...
	$(gnu.targets.arm.M3.rootDir)/bin/arm-none-eabi-gcc -c -MD -MF $@.dep -x c  -Wunused -Wunknown-pragmas -ffunction-sections -fdata-sections  -mcpu=cortex-m3 -mthumb -mabi=aapcs -g -Dfar= -D__DYNAMIC_REENT__  -g  -D_DEBUG_=1 -Dxdc_target_name__=M3 -Dxdc_target_types__=gnu/targets/arm/std.h -Dxdc_bld__profile_debug -Dxdc_bld__vers_1_0_4_8_4 -g  -Dti_sysbios_Build_useHwiMacros -Dti_sysbios_BIOS_smpEnabled__D=FALSE -I/db/vtree/library/trees/zumaprod/zumaprod-o06/exports/tirtos_cc13xx_cc26xx_2_21_00_06/products/bios_6_46_01_37/packages/gnu/targets/arm//libs/install-native/arm-none-eabi/include   $(XDCINCS)  -o $@ $<
	-@$(FIXDEP) $@.dep $@.dep
	
package/lib/lib/sysbios/debug/ti.sysbios.posix/sleep.om3g: export LD_LIBRARY_PATH=

package/lib/lib/sysbios/debug/ti.sysbios.posix/sleep.sm3g: | .interfaces
package/lib/lib/sysbios/debug/ti.sysbios.posix/sleep.sm3g: sleep.c lib/sysbios/debug/ti.sysbios.posix.am3g.mak
	@$(RM) $@.dep
	$(RM) $@
	@$(MSG) clm3g -S $< ...
	$(gnu.targets.arm.M3.rootDir)/bin/arm-none-eabi-gcc -c -MD -MF $@.dep -x c -S -Wunused -Wunknown-pragmas -ffunction-sections -fdata-sections  -mcpu=cortex-m3 -mthumb -mabi=aapcs -g -Dfar= -D__DYNAMIC_REENT__  -g  -D_DEBUG_=1 -Dxdc_target_name__=M3 -Dxdc_target_types__=gnu/targets/arm/std.h -Dxdc_bld__profile_debug -Dxdc_bld__vers_1_0_4_8_4 -g  -Dti_sysbios_Build_useHwiMacros -Dti_sysbios_BIOS_smpEnabled__D=FALSE  $(XDCINCS)  -o $@ $<
	-@$(FIXDEP) $@.dep $@.dep
	
package/lib/lib/sysbios/debug/ti.sysbios.posix/sleep.sm3g: export LD_LIBRARY_PATH=

ifeq (,$(MK_NOGENDEPS))
-include package/lib/lib/sysbios/debug/ti.sysbios.posix/timer.om3g.dep
package/lib/lib/sysbios/debug/ti.sysbios.posix/timer.om3g.dep: ;
endif

package/lib/lib/sysbios/debug/ti.sysbios.posix/timer.om3g: | .interfaces
package/lib/lib/sysbios/debug/ti.sysbios.posix/timer.om3g: timer.c lib/sysbios/debug/ti.sysbios.posix.am3g.mak
	@$(RM) $@.dep
	$(RM) $@
	@$(MSG) clm3g $< ...
	$(gnu.targets.arm.M3.rootDir)/bin/arm-none-eabi-gcc -c -MD -MF $@.dep -x c  -Wunused -Wunknown-pragmas -ffunction-sections -fdata-sections  -mcpu=cortex-m3 -mthumb -mabi=aapcs -g -Dfar= -D__DYNAMIC_REENT__  -g  -D_DEBUG_=1 -Dxdc_target_name__=M3 -Dxdc_target_types__=gnu/targets/arm/std.h -Dxdc_bld__profile_debug -Dxdc_bld__vers_1_0_4_8_4 -g  -Dti_sysbios_Build_useHwiMacros -Dti_sysbios_BIOS_smpEnabled__D=FALSE -I/db/vtree/library/trees/zumaprod/zumaprod-o06/exports/tirtos_cc13xx_cc26xx_2_21_00_06/products/bios_6_46_01_37/packages/gnu/targets/arm//libs/install-native/arm-none-eabi/include   $(XDCINCS)  -o $@ $<
	-@$(FIXDEP) $@.dep $@.dep
	
package/lib/lib/sysbios/debug/ti.sysbios.posix/timer.om3g: export LD_LIBRARY_PATH=

package/lib/lib/sysbios/debug/ti.sysbios.posix/timer.sm3g: | .interfaces
package/lib/lib/sysbios/debug/ti.sysbios.posix/timer.sm3g: timer.c lib/sysbios/debug/ti.sysbios.posix.am3g.mak
	@$(RM) $@.dep
	$(RM) $@
	@$(MSG) clm3g -S $< ...
	$(gnu.targets.arm.M3.rootDir)/bin/arm-none-eabi-gcc -c -MD -MF $@.dep -x c -S -Wunused -Wunknown-pragmas -ffunction-sections -fdata-sections  -mcpu=cortex-m3 -mthumb -mabi=aapcs -g -Dfar= -D__DYNAMIC_REENT__  -g  -D_DEBUG_=1 -Dxdc_target_name__=M3 -Dxdc_target_types__=gnu/targets/arm/std.h -Dxdc_bld__profile_debug -Dxdc_bld__vers_1_0_4_8_4 -g  -Dti_sysbios_Build_useHwiMacros -Dti_sysbios_BIOS_smpEnabled__D=FALSE  $(XDCINCS)  -o $@ $<
	-@$(FIXDEP) $@.dep $@.dep
	
package/lib/lib/sysbios/debug/ti.sysbios.posix/timer.sm3g: export LD_LIBRARY_PATH=

clean,m3g ::
	-$(RM) package/lib/lib/sysbios/debug/ti.sysbios.posix/package/package_ti.sysbios.posix.om3g
	-$(RM) package/lib/lib/sysbios/debug/ti.sysbios.posix/pthread.om3g
	-$(RM) package/lib/lib/sysbios/debug/ti.sysbios.posix/pthread_barrier.om3g
	-$(RM) package/lib/lib/sysbios/debug/ti.sysbios.posix/pthread_cond.om3g
	-$(RM) package/lib/lib/sysbios/debug/ti.sysbios.posix/pthread_key.om3g
	-$(RM) package/lib/lib/sysbios/debug/ti.sysbios.posix/pthread_mutex.om3g
	-$(RM) package/lib/lib/sysbios/debug/ti.sysbios.posix/pthread_rwlock.om3g
	-$(RM) package/lib/lib/sysbios/debug/ti.sysbios.posix/clock.om3g
	-$(RM) package/lib/lib/sysbios/debug/ti.sysbios.posix/mqueue.om3g
	-$(RM) package/lib/lib/sysbios/debug/ti.sysbios.posix/sched.om3g
	-$(RM) package/lib/lib/sysbios/debug/ti.sysbios.posix/semaphore.om3g
	-$(RM) package/lib/lib/sysbios/debug/ti.sysbios.posix/sleep.om3g
	-$(RM) package/lib/lib/sysbios/debug/ti.sysbios.posix/timer.om3g
	-$(RM) package/lib/lib/sysbios/debug/ti.sysbios.posix/package/package_ti.sysbios.posix.sm3g
	-$(RM) package/lib/lib/sysbios/debug/ti.sysbios.posix/pthread.sm3g
	-$(RM) package/lib/lib/sysbios/debug/ti.sysbios.posix/pthread_barrier.sm3g
	-$(RM) package/lib/lib/sysbios/debug/ti.sysbios.posix/pthread_cond.sm3g
	-$(RM) package/lib/lib/sysbios/debug/ti.sysbios.posix/pthread_key.sm3g
	-$(RM) package/lib/lib/sysbios/debug/ti.sysbios.posix/pthread_mutex.sm3g
	-$(RM) package/lib/lib/sysbios/debug/ti.sysbios.posix/pthread_rwlock.sm3g
	-$(RM) package/lib/lib/sysbios/debug/ti.sysbios.posix/clock.sm3g
	-$(RM) package/lib/lib/sysbios/debug/ti.sysbios.posix/mqueue.sm3g
	-$(RM) package/lib/lib/sysbios/debug/ti.sysbios.posix/sched.sm3g
	-$(RM) package/lib/lib/sysbios/debug/ti.sysbios.posix/semaphore.sm3g
	-$(RM) package/lib/lib/sysbios/debug/ti.sysbios.posix/sleep.sm3g
	-$(RM) package/lib/lib/sysbios/debug/ti.sysbios.posix/timer.sm3g

lib/sysbios/debug/ti.sysbios.posix.am3g: package/lib/lib/sysbios/debug/ti.sysbios.posix/package/package_ti.sysbios.posix.om3g package/lib/lib/sysbios/debug/ti.sysbios.posix/pthread.om3g package/lib/lib/sysbios/debug/ti.sysbios.posix/pthread_barrier.om3g package/lib/lib/sysbios/debug/ti.sysbios.posix/pthread_cond.om3g package/lib/lib/sysbios/debug/ti.sysbios.posix/pthread_key.om3g package/lib/lib/sysbios/debug/ti.sysbios.posix/pthread_mutex.om3g package/lib/lib/sysbios/debug/ti.sysbios.posix/pthread_rwlock.om3g package/lib/lib/sysbios/debug/ti.sysbios.posix/clock.om3g package/lib/lib/sysbios/debug/ti.sysbios.posix/mqueue.om3g package/lib/lib/sysbios/debug/ti.sysbios.posix/sched.om3g package/lib/lib/sysbios/debug/ti.sysbios.posix/semaphore.om3g package/lib/lib/sysbios/debug/ti.sysbios.posix/sleep.om3g package/lib/lib/sysbios/debug/ti.sysbios.posix/timer.om3g lib/sysbios/debug/ti.sysbios.posix.am3g.mak

clean::
	-$(RM) lib/sysbios/debug/ti.sysbios.posix.am3g.mak
