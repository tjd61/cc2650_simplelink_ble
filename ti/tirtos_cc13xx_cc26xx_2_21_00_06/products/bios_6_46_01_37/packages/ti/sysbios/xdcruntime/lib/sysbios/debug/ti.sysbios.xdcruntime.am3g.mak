#
#  Do not edit this file.  This file is generated from 
#  package.bld.  Any modifications to this file will be 
#  overwritten whenever makefiles are re-generated.
#
#  target compatibility key = gnu.targets.arm.M3{1,0,4.8,4
#
ifeq (,$(MK_NOGENDEPS))
-include package/lib/lib/sysbios/debug/ti.sysbios.xdcruntime/package/package_ti.sysbios.xdcruntime.om3g.dep
package/lib/lib/sysbios/debug/ti.sysbios.xdcruntime/package/package_ti.sysbios.xdcruntime.om3g.dep: ;
endif

package/lib/lib/sysbios/debug/ti.sysbios.xdcruntime/package/package_ti.sysbios.xdcruntime.om3g: | .interfaces
package/lib/lib/sysbios/debug/ti.sysbios.xdcruntime/package/package_ti.sysbios.xdcruntime.om3g: package/package_ti.sysbios.xdcruntime.c lib/sysbios/debug/ti.sysbios.xdcruntime.am3g.mak
	@$(RM) $@.dep
	$(RM) $@
	@$(MSG) clm3g $< ...
	$(gnu.targets.arm.M3.rootDir)/bin/arm-none-eabi-gcc -c -MD -MF $@.dep -x c  -Wunused -Wunknown-pragmas -ffunction-sections -fdata-sections  -mcpu=cortex-m3 -mthumb -mabi=aapcs -g -Dfar= -D__DYNAMIC_REENT__  -g  -D_DEBUG_=1 -Dxdc_target_name__=M3 -Dxdc_target_types__=gnu/targets/arm/std.h -Dxdc_bld__profile_debug -Dxdc_bld__vers_1_0_4_8_4 -g  -Dti_sysbios_Build_useHwiMacros -Dti_sysbios_BIOS_smpEnabled__D=FALSE -I/db/vtree/library/trees/zumaprod/zumaprod-o06/exports/tirtos_cc13xx_cc26xx_2_21_00_06/products/bios_6_46_01_37/packages/gnu/targets/arm//libs/install-native/arm-none-eabi/include   $(XDCINCS)  -o $@ $<
	-@$(FIXDEP) $@.dep $@.dep
	
package/lib/lib/sysbios/debug/ti.sysbios.xdcruntime/package/package_ti.sysbios.xdcruntime.om3g: export LD_LIBRARY_PATH=

package/lib/lib/sysbios/debug/ti.sysbios.xdcruntime/package/package_ti.sysbios.xdcruntime.sm3g: | .interfaces
package/lib/lib/sysbios/debug/ti.sysbios.xdcruntime/package/package_ti.sysbios.xdcruntime.sm3g: package/package_ti.sysbios.xdcruntime.c lib/sysbios/debug/ti.sysbios.xdcruntime.am3g.mak
	@$(RM) $@.dep
	$(RM) $@
	@$(MSG) clm3g -S $< ...
	$(gnu.targets.arm.M3.rootDir)/bin/arm-none-eabi-gcc -c -MD -MF $@.dep -x c -S -Wunused -Wunknown-pragmas -ffunction-sections -fdata-sections  -mcpu=cortex-m3 -mthumb -mabi=aapcs -g -Dfar= -D__DYNAMIC_REENT__  -g  -D_DEBUG_=1 -Dxdc_target_name__=M3 -Dxdc_target_types__=gnu/targets/arm/std.h -Dxdc_bld__profile_debug -Dxdc_bld__vers_1_0_4_8_4 -g  -Dti_sysbios_Build_useHwiMacros -Dti_sysbios_BIOS_smpEnabled__D=FALSE  $(XDCINCS)  -o $@ $<
	-@$(FIXDEP) $@.dep $@.dep
	
package/lib/lib/sysbios/debug/ti.sysbios.xdcruntime/package/package_ti.sysbios.xdcruntime.sm3g: export LD_LIBRARY_PATH=

ifeq (,$(MK_NOGENDEPS))
-include package/lib/lib/sysbios/debug/ti.sysbios.xdcruntime/GateThreadSupport.om3g.dep
package/lib/lib/sysbios/debug/ti.sysbios.xdcruntime/GateThreadSupport.om3g.dep: ;
endif

package/lib/lib/sysbios/debug/ti.sysbios.xdcruntime/GateThreadSupport.om3g: | .interfaces
package/lib/lib/sysbios/debug/ti.sysbios.xdcruntime/GateThreadSupport.om3g: GateThreadSupport.c lib/sysbios/debug/ti.sysbios.xdcruntime.am3g.mak
	@$(RM) $@.dep
	$(RM) $@
	@$(MSG) clm3g $< ...
	$(gnu.targets.arm.M3.rootDir)/bin/arm-none-eabi-gcc -c -MD -MF $@.dep -x c  -Wunused -Wunknown-pragmas -ffunction-sections -fdata-sections  -mcpu=cortex-m3 -mthumb -mabi=aapcs -g -Dfar= -D__DYNAMIC_REENT__  -g  -D_DEBUG_=1 -Dxdc_target_name__=M3 -Dxdc_target_types__=gnu/targets/arm/std.h -Dxdc_bld__profile_debug -Dxdc_bld__vers_1_0_4_8_4 -g  -Dti_sysbios_Build_useHwiMacros -Dti_sysbios_BIOS_smpEnabled__D=FALSE -I/db/vtree/library/trees/zumaprod/zumaprod-o06/exports/tirtos_cc13xx_cc26xx_2_21_00_06/products/bios_6_46_01_37/packages/gnu/targets/arm//libs/install-native/arm-none-eabi/include   $(XDCINCS)  -o $@ $<
	-@$(FIXDEP) $@.dep $@.dep
	
package/lib/lib/sysbios/debug/ti.sysbios.xdcruntime/GateThreadSupport.om3g: export LD_LIBRARY_PATH=

package/lib/lib/sysbios/debug/ti.sysbios.xdcruntime/GateThreadSupport.sm3g: | .interfaces
package/lib/lib/sysbios/debug/ti.sysbios.xdcruntime/GateThreadSupport.sm3g: GateThreadSupport.c lib/sysbios/debug/ti.sysbios.xdcruntime.am3g.mak
	@$(RM) $@.dep
	$(RM) $@
	@$(MSG) clm3g -S $< ...
	$(gnu.targets.arm.M3.rootDir)/bin/arm-none-eabi-gcc -c -MD -MF $@.dep -x c -S -Wunused -Wunknown-pragmas -ffunction-sections -fdata-sections  -mcpu=cortex-m3 -mthumb -mabi=aapcs -g -Dfar= -D__DYNAMIC_REENT__  -g  -D_DEBUG_=1 -Dxdc_target_name__=M3 -Dxdc_target_types__=gnu/targets/arm/std.h -Dxdc_bld__profile_debug -Dxdc_bld__vers_1_0_4_8_4 -g  -Dti_sysbios_Build_useHwiMacros -Dti_sysbios_BIOS_smpEnabled__D=FALSE  $(XDCINCS)  -o $@ $<
	-@$(FIXDEP) $@.dep $@.dep
	
package/lib/lib/sysbios/debug/ti.sysbios.xdcruntime/GateThreadSupport.sm3g: export LD_LIBRARY_PATH=

ifeq (,$(MK_NOGENDEPS))
-include package/lib/lib/sysbios/debug/ti.sysbios.xdcruntime/GateProcessSupport.om3g.dep
package/lib/lib/sysbios/debug/ti.sysbios.xdcruntime/GateProcessSupport.om3g.dep: ;
endif

package/lib/lib/sysbios/debug/ti.sysbios.xdcruntime/GateProcessSupport.om3g: | .interfaces
package/lib/lib/sysbios/debug/ti.sysbios.xdcruntime/GateProcessSupport.om3g: GateProcessSupport.c lib/sysbios/debug/ti.sysbios.xdcruntime.am3g.mak
	@$(RM) $@.dep
	$(RM) $@
	@$(MSG) clm3g $< ...
	$(gnu.targets.arm.M3.rootDir)/bin/arm-none-eabi-gcc -c -MD -MF $@.dep -x c  -Wunused -Wunknown-pragmas -ffunction-sections -fdata-sections  -mcpu=cortex-m3 -mthumb -mabi=aapcs -g -Dfar= -D__DYNAMIC_REENT__  -g  -D_DEBUG_=1 -Dxdc_target_name__=M3 -Dxdc_target_types__=gnu/targets/arm/std.h -Dxdc_bld__profile_debug -Dxdc_bld__vers_1_0_4_8_4 -g  -Dti_sysbios_Build_useHwiMacros -Dti_sysbios_BIOS_smpEnabled__D=FALSE -I/db/vtree/library/trees/zumaprod/zumaprod-o06/exports/tirtos_cc13xx_cc26xx_2_21_00_06/products/bios_6_46_01_37/packages/gnu/targets/arm//libs/install-native/arm-none-eabi/include   $(XDCINCS)  -o $@ $<
	-@$(FIXDEP) $@.dep $@.dep
	
package/lib/lib/sysbios/debug/ti.sysbios.xdcruntime/GateProcessSupport.om3g: export LD_LIBRARY_PATH=

package/lib/lib/sysbios/debug/ti.sysbios.xdcruntime/GateProcessSupport.sm3g: | .interfaces
package/lib/lib/sysbios/debug/ti.sysbios.xdcruntime/GateProcessSupport.sm3g: GateProcessSupport.c lib/sysbios/debug/ti.sysbios.xdcruntime.am3g.mak
	@$(RM) $@.dep
	$(RM) $@
	@$(MSG) clm3g -S $< ...
	$(gnu.targets.arm.M3.rootDir)/bin/arm-none-eabi-gcc -c -MD -MF $@.dep -x c -S -Wunused -Wunknown-pragmas -ffunction-sections -fdata-sections  -mcpu=cortex-m3 -mthumb -mabi=aapcs -g -Dfar= -D__DYNAMIC_REENT__  -g  -D_DEBUG_=1 -Dxdc_target_name__=M3 -Dxdc_target_types__=gnu/targets/arm/std.h -Dxdc_bld__profile_debug -Dxdc_bld__vers_1_0_4_8_4 -g  -Dti_sysbios_Build_useHwiMacros -Dti_sysbios_BIOS_smpEnabled__D=FALSE  $(XDCINCS)  -o $@ $<
	-@$(FIXDEP) $@.dep $@.dep
	
package/lib/lib/sysbios/debug/ti.sysbios.xdcruntime/GateProcessSupport.sm3g: export LD_LIBRARY_PATH=

ifeq (,$(MK_NOGENDEPS))
-include package/lib/lib/sysbios/debug/ti.sysbios.xdcruntime/SemThreadSupport.om3g.dep
package/lib/lib/sysbios/debug/ti.sysbios.xdcruntime/SemThreadSupport.om3g.dep: ;
endif

package/lib/lib/sysbios/debug/ti.sysbios.xdcruntime/SemThreadSupport.om3g: | .interfaces
package/lib/lib/sysbios/debug/ti.sysbios.xdcruntime/SemThreadSupport.om3g: SemThreadSupport.c lib/sysbios/debug/ti.sysbios.xdcruntime.am3g.mak
	@$(RM) $@.dep
	$(RM) $@
	@$(MSG) clm3g $< ...
	$(gnu.targets.arm.M3.rootDir)/bin/arm-none-eabi-gcc -c -MD -MF $@.dep -x c  -Wunused -Wunknown-pragmas -ffunction-sections -fdata-sections  -mcpu=cortex-m3 -mthumb -mabi=aapcs -g -Dfar= -D__DYNAMIC_REENT__  -g  -D_DEBUG_=1 -Dxdc_target_name__=M3 -Dxdc_target_types__=gnu/targets/arm/std.h -Dxdc_bld__profile_debug -Dxdc_bld__vers_1_0_4_8_4 -g  -Dti_sysbios_Build_useHwiMacros -Dti_sysbios_BIOS_smpEnabled__D=FALSE -I/db/vtree/library/trees/zumaprod/zumaprod-o06/exports/tirtos_cc13xx_cc26xx_2_21_00_06/products/bios_6_46_01_37/packages/gnu/targets/arm//libs/install-native/arm-none-eabi/include   $(XDCINCS)  -o $@ $<
	-@$(FIXDEP) $@.dep $@.dep
	
package/lib/lib/sysbios/debug/ti.sysbios.xdcruntime/SemThreadSupport.om3g: export LD_LIBRARY_PATH=

package/lib/lib/sysbios/debug/ti.sysbios.xdcruntime/SemThreadSupport.sm3g: | .interfaces
package/lib/lib/sysbios/debug/ti.sysbios.xdcruntime/SemThreadSupport.sm3g: SemThreadSupport.c lib/sysbios/debug/ti.sysbios.xdcruntime.am3g.mak
	@$(RM) $@.dep
	$(RM) $@
	@$(MSG) clm3g -S $< ...
	$(gnu.targets.arm.M3.rootDir)/bin/arm-none-eabi-gcc -c -MD -MF $@.dep -x c -S -Wunused -Wunknown-pragmas -ffunction-sections -fdata-sections  -mcpu=cortex-m3 -mthumb -mabi=aapcs -g -Dfar= -D__DYNAMIC_REENT__  -g  -D_DEBUG_=1 -Dxdc_target_name__=M3 -Dxdc_target_types__=gnu/targets/arm/std.h -Dxdc_bld__profile_debug -Dxdc_bld__vers_1_0_4_8_4 -g  -Dti_sysbios_Build_useHwiMacros -Dti_sysbios_BIOS_smpEnabled__D=FALSE  $(XDCINCS)  -o $@ $<
	-@$(FIXDEP) $@.dep $@.dep
	
package/lib/lib/sysbios/debug/ti.sysbios.xdcruntime/SemThreadSupport.sm3g: export LD_LIBRARY_PATH=

ifeq (,$(MK_NOGENDEPS))
-include package/lib/lib/sysbios/debug/ti.sysbios.xdcruntime/SemProcessSupport.om3g.dep
package/lib/lib/sysbios/debug/ti.sysbios.xdcruntime/SemProcessSupport.om3g.dep: ;
endif

package/lib/lib/sysbios/debug/ti.sysbios.xdcruntime/SemProcessSupport.om3g: | .interfaces
package/lib/lib/sysbios/debug/ti.sysbios.xdcruntime/SemProcessSupport.om3g: SemProcessSupport.c lib/sysbios/debug/ti.sysbios.xdcruntime.am3g.mak
	@$(RM) $@.dep
	$(RM) $@
	@$(MSG) clm3g $< ...
	$(gnu.targets.arm.M3.rootDir)/bin/arm-none-eabi-gcc -c -MD -MF $@.dep -x c  -Wunused -Wunknown-pragmas -ffunction-sections -fdata-sections  -mcpu=cortex-m3 -mthumb -mabi=aapcs -g -Dfar= -D__DYNAMIC_REENT__  -g  -D_DEBUG_=1 -Dxdc_target_name__=M3 -Dxdc_target_types__=gnu/targets/arm/std.h -Dxdc_bld__profile_debug -Dxdc_bld__vers_1_0_4_8_4 -g  -Dti_sysbios_Build_useHwiMacros -Dti_sysbios_BIOS_smpEnabled__D=FALSE -I/db/vtree/library/trees/zumaprod/zumaprod-o06/exports/tirtos_cc13xx_cc26xx_2_21_00_06/products/bios_6_46_01_37/packages/gnu/targets/arm//libs/install-native/arm-none-eabi/include   $(XDCINCS)  -o $@ $<
	-@$(FIXDEP) $@.dep $@.dep
	
package/lib/lib/sysbios/debug/ti.sysbios.xdcruntime/SemProcessSupport.om3g: export LD_LIBRARY_PATH=

package/lib/lib/sysbios/debug/ti.sysbios.xdcruntime/SemProcessSupport.sm3g: | .interfaces
package/lib/lib/sysbios/debug/ti.sysbios.xdcruntime/SemProcessSupport.sm3g: SemProcessSupport.c lib/sysbios/debug/ti.sysbios.xdcruntime.am3g.mak
	@$(RM) $@.dep
	$(RM) $@
	@$(MSG) clm3g -S $< ...
	$(gnu.targets.arm.M3.rootDir)/bin/arm-none-eabi-gcc -c -MD -MF $@.dep -x c -S -Wunused -Wunknown-pragmas -ffunction-sections -fdata-sections  -mcpu=cortex-m3 -mthumb -mabi=aapcs -g -Dfar= -D__DYNAMIC_REENT__  -g  -D_DEBUG_=1 -Dxdc_target_name__=M3 -Dxdc_target_types__=gnu/targets/arm/std.h -Dxdc_bld__profile_debug -Dxdc_bld__vers_1_0_4_8_4 -g  -Dti_sysbios_Build_useHwiMacros -Dti_sysbios_BIOS_smpEnabled__D=FALSE  $(XDCINCS)  -o $@ $<
	-@$(FIXDEP) $@.dep $@.dep
	
package/lib/lib/sysbios/debug/ti.sysbios.xdcruntime/SemProcessSupport.sm3g: export LD_LIBRARY_PATH=

ifeq (,$(MK_NOGENDEPS))
-include package/lib/lib/sysbios/debug/ti.sysbios.xdcruntime/ThreadSupport.om3g.dep
package/lib/lib/sysbios/debug/ti.sysbios.xdcruntime/ThreadSupport.om3g.dep: ;
endif

package/lib/lib/sysbios/debug/ti.sysbios.xdcruntime/ThreadSupport.om3g: | .interfaces
package/lib/lib/sysbios/debug/ti.sysbios.xdcruntime/ThreadSupport.om3g: ThreadSupport.c lib/sysbios/debug/ti.sysbios.xdcruntime.am3g.mak
	@$(RM) $@.dep
	$(RM) $@
	@$(MSG) clm3g $< ...
	$(gnu.targets.arm.M3.rootDir)/bin/arm-none-eabi-gcc -c -MD -MF $@.dep -x c  -Wunused -Wunknown-pragmas -ffunction-sections -fdata-sections  -mcpu=cortex-m3 -mthumb -mabi=aapcs -g -Dfar= -D__DYNAMIC_REENT__  -g  -D_DEBUG_=1 -Dxdc_target_name__=M3 -Dxdc_target_types__=gnu/targets/arm/std.h -Dxdc_bld__profile_debug -Dxdc_bld__vers_1_0_4_8_4 -g  -Dti_sysbios_Build_useHwiMacros -Dti_sysbios_BIOS_smpEnabled__D=FALSE -I/db/vtree/library/trees/zumaprod/zumaprod-o06/exports/tirtos_cc13xx_cc26xx_2_21_00_06/products/bios_6_46_01_37/packages/gnu/targets/arm//libs/install-native/arm-none-eabi/include   $(XDCINCS)  -o $@ $<
	-@$(FIXDEP) $@.dep $@.dep
	
package/lib/lib/sysbios/debug/ti.sysbios.xdcruntime/ThreadSupport.om3g: export LD_LIBRARY_PATH=

package/lib/lib/sysbios/debug/ti.sysbios.xdcruntime/ThreadSupport.sm3g: | .interfaces
package/lib/lib/sysbios/debug/ti.sysbios.xdcruntime/ThreadSupport.sm3g: ThreadSupport.c lib/sysbios/debug/ti.sysbios.xdcruntime.am3g.mak
	@$(RM) $@.dep
	$(RM) $@
	@$(MSG) clm3g -S $< ...
	$(gnu.targets.arm.M3.rootDir)/bin/arm-none-eabi-gcc -c -MD -MF $@.dep -x c -S -Wunused -Wunknown-pragmas -ffunction-sections -fdata-sections  -mcpu=cortex-m3 -mthumb -mabi=aapcs -g -Dfar= -D__DYNAMIC_REENT__  -g  -D_DEBUG_=1 -Dxdc_target_name__=M3 -Dxdc_target_types__=gnu/targets/arm/std.h -Dxdc_bld__profile_debug -Dxdc_bld__vers_1_0_4_8_4 -g  -Dti_sysbios_Build_useHwiMacros -Dti_sysbios_BIOS_smpEnabled__D=FALSE  $(XDCINCS)  -o $@ $<
	-@$(FIXDEP) $@.dep $@.dep
	
package/lib/lib/sysbios/debug/ti.sysbios.xdcruntime/ThreadSupport.sm3g: export LD_LIBRARY_PATH=

ifeq (,$(MK_NOGENDEPS))
-include package/lib/lib/sysbios/debug/ti.sysbios.xdcruntime/CacheSupport.om3g.dep
package/lib/lib/sysbios/debug/ti.sysbios.xdcruntime/CacheSupport.om3g.dep: ;
endif

package/lib/lib/sysbios/debug/ti.sysbios.xdcruntime/CacheSupport.om3g: | .interfaces
package/lib/lib/sysbios/debug/ti.sysbios.xdcruntime/CacheSupport.om3g: CacheSupport.c lib/sysbios/debug/ti.sysbios.xdcruntime.am3g.mak
	@$(RM) $@.dep
	$(RM) $@
	@$(MSG) clm3g $< ...
	$(gnu.targets.arm.M3.rootDir)/bin/arm-none-eabi-gcc -c -MD -MF $@.dep -x c  -Wunused -Wunknown-pragmas -ffunction-sections -fdata-sections  -mcpu=cortex-m3 -mthumb -mabi=aapcs -g -Dfar= -D__DYNAMIC_REENT__  -g  -D_DEBUG_=1 -Dxdc_target_name__=M3 -Dxdc_target_types__=gnu/targets/arm/std.h -Dxdc_bld__profile_debug -Dxdc_bld__vers_1_0_4_8_4 -g  -Dti_sysbios_Build_useHwiMacros -Dti_sysbios_BIOS_smpEnabled__D=FALSE -I/db/vtree/library/trees/zumaprod/zumaprod-o06/exports/tirtos_cc13xx_cc26xx_2_21_00_06/products/bios_6_46_01_37/packages/gnu/targets/arm//libs/install-native/arm-none-eabi/include   $(XDCINCS)  -o $@ $<
	-@$(FIXDEP) $@.dep $@.dep
	
package/lib/lib/sysbios/debug/ti.sysbios.xdcruntime/CacheSupport.om3g: export LD_LIBRARY_PATH=

package/lib/lib/sysbios/debug/ti.sysbios.xdcruntime/CacheSupport.sm3g: | .interfaces
package/lib/lib/sysbios/debug/ti.sysbios.xdcruntime/CacheSupport.sm3g: CacheSupport.c lib/sysbios/debug/ti.sysbios.xdcruntime.am3g.mak
	@$(RM) $@.dep
	$(RM) $@
	@$(MSG) clm3g -S $< ...
	$(gnu.targets.arm.M3.rootDir)/bin/arm-none-eabi-gcc -c -MD -MF $@.dep -x c -S -Wunused -Wunknown-pragmas -ffunction-sections -fdata-sections  -mcpu=cortex-m3 -mthumb -mabi=aapcs -g -Dfar= -D__DYNAMIC_REENT__  -g  -D_DEBUG_=1 -Dxdc_target_name__=M3 -Dxdc_target_types__=gnu/targets/arm/std.h -Dxdc_bld__profile_debug -Dxdc_bld__vers_1_0_4_8_4 -g  -Dti_sysbios_Build_useHwiMacros -Dti_sysbios_BIOS_smpEnabled__D=FALSE  $(XDCINCS)  -o $@ $<
	-@$(FIXDEP) $@.dep $@.dep
	
package/lib/lib/sysbios/debug/ti.sysbios.xdcruntime/CacheSupport.sm3g: export LD_LIBRARY_PATH=

clean,m3g ::
	-$(RM) package/lib/lib/sysbios/debug/ti.sysbios.xdcruntime/package/package_ti.sysbios.xdcruntime.om3g
	-$(RM) package/lib/lib/sysbios/debug/ti.sysbios.xdcruntime/GateThreadSupport.om3g
	-$(RM) package/lib/lib/sysbios/debug/ti.sysbios.xdcruntime/GateProcessSupport.om3g
	-$(RM) package/lib/lib/sysbios/debug/ti.sysbios.xdcruntime/SemThreadSupport.om3g
	-$(RM) package/lib/lib/sysbios/debug/ti.sysbios.xdcruntime/SemProcessSupport.om3g
	-$(RM) package/lib/lib/sysbios/debug/ti.sysbios.xdcruntime/ThreadSupport.om3g
	-$(RM) package/lib/lib/sysbios/debug/ti.sysbios.xdcruntime/CacheSupport.om3g
	-$(RM) package/lib/lib/sysbios/debug/ti.sysbios.xdcruntime/package/package_ti.sysbios.xdcruntime.sm3g
	-$(RM) package/lib/lib/sysbios/debug/ti.sysbios.xdcruntime/GateThreadSupport.sm3g
	-$(RM) package/lib/lib/sysbios/debug/ti.sysbios.xdcruntime/GateProcessSupport.sm3g
	-$(RM) package/lib/lib/sysbios/debug/ti.sysbios.xdcruntime/SemThreadSupport.sm3g
	-$(RM) package/lib/lib/sysbios/debug/ti.sysbios.xdcruntime/SemProcessSupport.sm3g
	-$(RM) package/lib/lib/sysbios/debug/ti.sysbios.xdcruntime/ThreadSupport.sm3g
	-$(RM) package/lib/lib/sysbios/debug/ti.sysbios.xdcruntime/CacheSupport.sm3g

lib/sysbios/debug/ti.sysbios.xdcruntime.am3g: package/lib/lib/sysbios/debug/ti.sysbios.xdcruntime/package/package_ti.sysbios.xdcruntime.om3g package/lib/lib/sysbios/debug/ti.sysbios.xdcruntime/GateThreadSupport.om3g package/lib/lib/sysbios/debug/ti.sysbios.xdcruntime/GateProcessSupport.om3g package/lib/lib/sysbios/debug/ti.sysbios.xdcruntime/SemThreadSupport.om3g package/lib/lib/sysbios/debug/ti.sysbios.xdcruntime/SemProcessSupport.om3g package/lib/lib/sysbios/debug/ti.sysbios.xdcruntime/ThreadSupport.om3g package/lib/lib/sysbios/debug/ti.sysbios.xdcruntime/CacheSupport.om3g lib/sysbios/debug/ti.sysbios.xdcruntime.am3g.mak

clean::
	-$(RM) lib/sysbios/debug/ti.sysbios.xdcruntime.am3g.mak
