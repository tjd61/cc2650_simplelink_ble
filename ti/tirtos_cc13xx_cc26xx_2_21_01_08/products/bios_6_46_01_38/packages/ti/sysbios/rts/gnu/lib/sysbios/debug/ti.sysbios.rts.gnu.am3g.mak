#
#  Do not edit this file.  This file is generated from 
#  package.bld.  Any modifications to this file will be 
#  overwritten whenever makefiles are re-generated.
#
#  target compatibility key = gnu.targets.arm.M3{1,0,4.8,4
#
ifeq (,$(MK_NOGENDEPS))
-include package/lib/lib/sysbios/debug/ti.sysbios.rts.gnu/package/package_ti.sysbios.rts.gnu.om3g.dep
package/lib/lib/sysbios/debug/ti.sysbios.rts.gnu/package/package_ti.sysbios.rts.gnu.om3g.dep: ;
endif

package/lib/lib/sysbios/debug/ti.sysbios.rts.gnu/package/package_ti.sysbios.rts.gnu.om3g: | .interfaces
package/lib/lib/sysbios/debug/ti.sysbios.rts.gnu/package/package_ti.sysbios.rts.gnu.om3g: package/package_ti.sysbios.rts.gnu.c lib/sysbios/debug/ti.sysbios.rts.gnu.am3g.mak
	@$(RM) $@.dep
	$(RM) $@
	@$(MSG) clm3g $< ...
	$(gnu.targets.arm.M3.rootDir)/bin/arm-none-eabi-gcc -c -MD -MF $@.dep -x c  -Wunused -Wunknown-pragmas -ffunction-sections -fdata-sections  -mcpu=cortex-m3 -mthumb -mabi=aapcs -g -Dfar= -D__DYNAMIC_REENT__  -g  -D_DEBUG_=1 -Dxdc_target_name__=M3 -Dxdc_target_types__=gnu/targets/arm/std.h -Dxdc_bld__profile_debug -Dxdc_bld__vers_1_0_4_8_4 -g  -Dti_sysbios_Build_useHwiMacros -Dti_sysbios_BIOS_smpEnabled__D=FALSE -I/db/vtree/library/trees/zumaprod/zumaprod-o08/exports/tirtos_cc13xx_cc26xx_2_21_01_08/products/bios_6_46_01_38/packages/gnu/targets/arm//libs/install-native/arm-none-eabi/include   $(XDCINCS)  -o $@ $<
	-@$(FIXDEP) $@.dep $@.dep
	
package/lib/lib/sysbios/debug/ti.sysbios.rts.gnu/package/package_ti.sysbios.rts.gnu.om3g: export LD_LIBRARY_PATH=

package/lib/lib/sysbios/debug/ti.sysbios.rts.gnu/package/package_ti.sysbios.rts.gnu.sm3g: | .interfaces
package/lib/lib/sysbios/debug/ti.sysbios.rts.gnu/package/package_ti.sysbios.rts.gnu.sm3g: package/package_ti.sysbios.rts.gnu.c lib/sysbios/debug/ti.sysbios.rts.gnu.am3g.mak
	@$(RM) $@.dep
	$(RM) $@
	@$(MSG) clm3g -S $< ...
	$(gnu.targets.arm.M3.rootDir)/bin/arm-none-eabi-gcc -c -MD -MF $@.dep -x c -S -Wunused -Wunknown-pragmas -ffunction-sections -fdata-sections  -mcpu=cortex-m3 -mthumb -mabi=aapcs -g -Dfar= -D__DYNAMIC_REENT__  -g  -D_DEBUG_=1 -Dxdc_target_name__=M3 -Dxdc_target_types__=gnu/targets/arm/std.h -Dxdc_bld__profile_debug -Dxdc_bld__vers_1_0_4_8_4 -g  -Dti_sysbios_Build_useHwiMacros -Dti_sysbios_BIOS_smpEnabled__D=FALSE  $(XDCINCS)  -o $@ $<
	-@$(FIXDEP) $@.dep $@.dep
	
package/lib/lib/sysbios/debug/ti.sysbios.rts.gnu/package/package_ti.sysbios.rts.gnu.sm3g: export LD_LIBRARY_PATH=

ifeq (,$(MK_NOGENDEPS))
-include package/lib/lib/sysbios/debug/ti.sysbios.rts.gnu/ReentSupport.om3g.dep
package/lib/lib/sysbios/debug/ti.sysbios.rts.gnu/ReentSupport.om3g.dep: ;
endif

package/lib/lib/sysbios/debug/ti.sysbios.rts.gnu/ReentSupport.om3g: | .interfaces
package/lib/lib/sysbios/debug/ti.sysbios.rts.gnu/ReentSupport.om3g: ReentSupport.c lib/sysbios/debug/ti.sysbios.rts.gnu.am3g.mak
	@$(RM) $@.dep
	$(RM) $@
	@$(MSG) clm3g $< ...
	$(gnu.targets.arm.M3.rootDir)/bin/arm-none-eabi-gcc -c -MD -MF $@.dep -x c  -Wunused -Wunknown-pragmas -ffunction-sections -fdata-sections  -mcpu=cortex-m3 -mthumb -mabi=aapcs -g -Dfar= -D__DYNAMIC_REENT__  -g  -D_DEBUG_=1 -Dxdc_target_name__=M3 -Dxdc_target_types__=gnu/targets/arm/std.h -Dxdc_bld__profile_debug -Dxdc_bld__vers_1_0_4_8_4 -g  -Dti_sysbios_Build_useHwiMacros -Dti_sysbios_BIOS_smpEnabled__D=FALSE -I/db/vtree/library/trees/zumaprod/zumaprod-o08/exports/tirtos_cc13xx_cc26xx_2_21_01_08/products/bios_6_46_01_38/packages/gnu/targets/arm//libs/install-native/arm-none-eabi/include   $(XDCINCS)  -o $@ $<
	-@$(FIXDEP) $@.dep $@.dep
	
package/lib/lib/sysbios/debug/ti.sysbios.rts.gnu/ReentSupport.om3g: export LD_LIBRARY_PATH=

package/lib/lib/sysbios/debug/ti.sysbios.rts.gnu/ReentSupport.sm3g: | .interfaces
package/lib/lib/sysbios/debug/ti.sysbios.rts.gnu/ReentSupport.sm3g: ReentSupport.c lib/sysbios/debug/ti.sysbios.rts.gnu.am3g.mak
	@$(RM) $@.dep
	$(RM) $@
	@$(MSG) clm3g -S $< ...
	$(gnu.targets.arm.M3.rootDir)/bin/arm-none-eabi-gcc -c -MD -MF $@.dep -x c -S -Wunused -Wunknown-pragmas -ffunction-sections -fdata-sections  -mcpu=cortex-m3 -mthumb -mabi=aapcs -g -Dfar= -D__DYNAMIC_REENT__  -g  -D_DEBUG_=1 -Dxdc_target_name__=M3 -Dxdc_target_types__=gnu/targets/arm/std.h -Dxdc_bld__profile_debug -Dxdc_bld__vers_1_0_4_8_4 -g  -Dti_sysbios_Build_useHwiMacros -Dti_sysbios_BIOS_smpEnabled__D=FALSE  $(XDCINCS)  -o $@ $<
	-@$(FIXDEP) $@.dep $@.dep
	
package/lib/lib/sysbios/debug/ti.sysbios.rts.gnu/ReentSupport.sm3g: export LD_LIBRARY_PATH=

ifeq (,$(MK_NOGENDEPS))
-include package/lib/lib/sysbios/debug/ti.sysbios.rts.gnu/SemiHostSupport.om3g.dep
package/lib/lib/sysbios/debug/ti.sysbios.rts.gnu/SemiHostSupport.om3g.dep: ;
endif

package/lib/lib/sysbios/debug/ti.sysbios.rts.gnu/SemiHostSupport.om3g: | .interfaces
package/lib/lib/sysbios/debug/ti.sysbios.rts.gnu/SemiHostSupport.om3g: SemiHostSupport.c lib/sysbios/debug/ti.sysbios.rts.gnu.am3g.mak
	@$(RM) $@.dep
	$(RM) $@
	@$(MSG) clm3g $< ...
	$(gnu.targets.arm.M3.rootDir)/bin/arm-none-eabi-gcc -c -MD -MF $@.dep -x c  -Wunused -Wunknown-pragmas -ffunction-sections -fdata-sections  -mcpu=cortex-m3 -mthumb -mabi=aapcs -g -Dfar= -D__DYNAMIC_REENT__  -g  -D_DEBUG_=1 -Dxdc_target_name__=M3 -Dxdc_target_types__=gnu/targets/arm/std.h -Dxdc_bld__profile_debug -Dxdc_bld__vers_1_0_4_8_4 -g  -Dti_sysbios_Build_useHwiMacros -Dti_sysbios_BIOS_smpEnabled__D=FALSE -I/db/vtree/library/trees/zumaprod/zumaprod-o08/exports/tirtos_cc13xx_cc26xx_2_21_01_08/products/bios_6_46_01_38/packages/gnu/targets/arm//libs/install-native/arm-none-eabi/include   $(XDCINCS)  -o $@ $<
	-@$(FIXDEP) $@.dep $@.dep
	
package/lib/lib/sysbios/debug/ti.sysbios.rts.gnu/SemiHostSupport.om3g: export LD_LIBRARY_PATH=

package/lib/lib/sysbios/debug/ti.sysbios.rts.gnu/SemiHostSupport.sm3g: | .interfaces
package/lib/lib/sysbios/debug/ti.sysbios.rts.gnu/SemiHostSupport.sm3g: SemiHostSupport.c lib/sysbios/debug/ti.sysbios.rts.gnu.am3g.mak
	@$(RM) $@.dep
	$(RM) $@
	@$(MSG) clm3g -S $< ...
	$(gnu.targets.arm.M3.rootDir)/bin/arm-none-eabi-gcc -c -MD -MF $@.dep -x c -S -Wunused -Wunknown-pragmas -ffunction-sections -fdata-sections  -mcpu=cortex-m3 -mthumb -mabi=aapcs -g -Dfar= -D__DYNAMIC_REENT__  -g  -D_DEBUG_=1 -Dxdc_target_name__=M3 -Dxdc_target_types__=gnu/targets/arm/std.h -Dxdc_bld__profile_debug -Dxdc_bld__vers_1_0_4_8_4 -g  -Dti_sysbios_Build_useHwiMacros -Dti_sysbios_BIOS_smpEnabled__D=FALSE  $(XDCINCS)  -o $@ $<
	-@$(FIXDEP) $@.dep $@.dep
	
package/lib/lib/sysbios/debug/ti.sysbios.rts.gnu/SemiHostSupport.sm3g: export LD_LIBRARY_PATH=

clean,m3g ::
	-$(RM) package/lib/lib/sysbios/debug/ti.sysbios.rts.gnu/package/package_ti.sysbios.rts.gnu.om3g
	-$(RM) package/lib/lib/sysbios/debug/ti.sysbios.rts.gnu/ReentSupport.om3g
	-$(RM) package/lib/lib/sysbios/debug/ti.sysbios.rts.gnu/SemiHostSupport.om3g
	-$(RM) package/lib/lib/sysbios/debug/ti.sysbios.rts.gnu/package/package_ti.sysbios.rts.gnu.sm3g
	-$(RM) package/lib/lib/sysbios/debug/ti.sysbios.rts.gnu/ReentSupport.sm3g
	-$(RM) package/lib/lib/sysbios/debug/ti.sysbios.rts.gnu/SemiHostSupport.sm3g

lib/sysbios/debug/ti.sysbios.rts.gnu.am3g: package/lib/lib/sysbios/debug/ti.sysbios.rts.gnu/package/package_ti.sysbios.rts.gnu.om3g package/lib/lib/sysbios/debug/ti.sysbios.rts.gnu/ReentSupport.om3g package/lib/lib/sysbios/debug/ti.sysbios.rts.gnu/SemiHostSupport.om3g lib/sysbios/debug/ti.sysbios.rts.gnu.am3g.mak

clean::
	-$(RM) lib/sysbios/debug/ti.sysbios.rts.gnu.am3g.mak
