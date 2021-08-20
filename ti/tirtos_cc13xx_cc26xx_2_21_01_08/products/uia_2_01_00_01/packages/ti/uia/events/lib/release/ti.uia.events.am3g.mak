#
#  Do not edit this file.  This file is generated from 
#  package.bld.  Any modifications to this file will be 
#  overwritten whenever makefiles are re-generated.
#
#  target compatibility key = gnu.targets.arm.M3{1,0,4.8,4
#
ifeq (,$(MK_NOGENDEPS))
-include package/lib/lib/release/ti.uia.events/package/package_ti.uia.events.om3g.dep
package/lib/lib/release/ti.uia.events/package/package_ti.uia.events.om3g.dep: ;
endif

package/lib/lib/release/ti.uia.events/package/package_ti.uia.events.om3g: | .interfaces
package/lib/lib/release/ti.uia.events/package/package_ti.uia.events.om3g: package/package_ti.uia.events.c lib/release/ti.uia.events.am3g.mak
	@$(RM) $@.dep
	$(RM) $@
	@$(MSG) clm3g $< ...
	$(gnu.targets.arm.M3.rootDir)/bin/arm-none-eabi-gcc -c -MD -MF $@.dep -x c  -Wunused -Wunknown-pragmas -ffunction-sections -fdata-sections  -mcpu=cortex-m3 -mthumb -mabi=aapcs -g -Dfar= -D__DYNAMIC_REENT__  -g  -Dxdc_target_name__=M3 -Dxdc_target_types__=gnu/targets/arm/std.h -Dxdc_bld__profile_release -Dxdc_bld__vers_1_0_4_8_4  -O2  -I/db/vtree/library/trees/zumaprod/zumaprod-o08/exports/tirtos_cc13xx_cc26xx_2_21_01_08/products/bios_6_46_01_38/packages/gnu/targets/arm//libs/install-native/arm-none-eabi/include   $(XDCINCS)  -o $@ $<
	-@$(FIXDEP) $@.dep $@.dep
	
package/lib/lib/release/ti.uia.events/package/package_ti.uia.events.om3g: export LD_LIBRARY_PATH=

package/lib/lib/release/ti.uia.events/package/package_ti.uia.events.sm3g: | .interfaces
package/lib/lib/release/ti.uia.events/package/package_ti.uia.events.sm3g: package/package_ti.uia.events.c lib/release/ti.uia.events.am3g.mak
	@$(RM) $@.dep
	$(RM) $@
	@$(MSG) clm3g -S $< ...
	$(gnu.targets.arm.M3.rootDir)/bin/arm-none-eabi-gcc -c -MD -MF $@.dep -x c -S -Wunused -Wunknown-pragmas -ffunction-sections -fdata-sections  -mcpu=cortex-m3 -mthumb -mabi=aapcs -g -Dfar= -D__DYNAMIC_REENT__  -g  -Dxdc_target_name__=M3 -Dxdc_target_types__=gnu/targets/arm/std.h -Dxdc_bld__profile_release -Dxdc_bld__vers_1_0_4_8_4  -O2   $(XDCINCS)  -o $@ $<
	-@$(FIXDEP) $@.dep $@.dep
	
package/lib/lib/release/ti.uia.events/package/package_ti.uia.events.sm3g: export LD_LIBRARY_PATH=

ifeq (,$(MK_NOGENDEPS))
-include package/lib/lib/release/ti.uia.events/UIAAppCtx.om3g.dep
package/lib/lib/release/ti.uia.events/UIAAppCtx.om3g.dep: ;
endif

package/lib/lib/release/ti.uia.events/UIAAppCtx.om3g: | .interfaces
package/lib/lib/release/ti.uia.events/UIAAppCtx.om3g: UIAAppCtx.c lib/release/ti.uia.events.am3g.mak
	@$(RM) $@.dep
	$(RM) $@
	@$(MSG) clm3g $< ...
	$(gnu.targets.arm.M3.rootDir)/bin/arm-none-eabi-gcc -c -MD -MF $@.dep -x c  -Wunused -Wunknown-pragmas -ffunction-sections -fdata-sections  -mcpu=cortex-m3 -mthumb -mabi=aapcs -g -Dfar= -D__DYNAMIC_REENT__  -g  -Dxdc_target_name__=M3 -Dxdc_target_types__=gnu/targets/arm/std.h -Dxdc_bld__profile_release -Dxdc_bld__vers_1_0_4_8_4  -O2  -I/db/vtree/library/trees/zumaprod/zumaprod-o08/exports/tirtos_cc13xx_cc26xx_2_21_01_08/products/bios_6_46_01_38/packages/gnu/targets/arm//libs/install-native/arm-none-eabi/include   $(XDCINCS)  -o $@ $<
	-@$(FIXDEP) $@.dep $@.dep
	
package/lib/lib/release/ti.uia.events/UIAAppCtx.om3g: export LD_LIBRARY_PATH=

package/lib/lib/release/ti.uia.events/UIAAppCtx.sm3g: | .interfaces
package/lib/lib/release/ti.uia.events/UIAAppCtx.sm3g: UIAAppCtx.c lib/release/ti.uia.events.am3g.mak
	@$(RM) $@.dep
	$(RM) $@
	@$(MSG) clm3g -S $< ...
	$(gnu.targets.arm.M3.rootDir)/bin/arm-none-eabi-gcc -c -MD -MF $@.dep -x c -S -Wunused -Wunknown-pragmas -ffunction-sections -fdata-sections  -mcpu=cortex-m3 -mthumb -mabi=aapcs -g -Dfar= -D__DYNAMIC_REENT__  -g  -Dxdc_target_name__=M3 -Dxdc_target_types__=gnu/targets/arm/std.h -Dxdc_bld__profile_release -Dxdc_bld__vers_1_0_4_8_4  -O2   $(XDCINCS)  -o $@ $<
	-@$(FIXDEP) $@.dep $@.dep
	
package/lib/lib/release/ti.uia.events/UIAAppCtx.sm3g: export LD_LIBRARY_PATH=

ifeq (,$(MK_NOGENDEPS))
-include package/lib/lib/release/ti.uia.events/UIAChanCtx.om3g.dep
package/lib/lib/release/ti.uia.events/UIAChanCtx.om3g.dep: ;
endif

package/lib/lib/release/ti.uia.events/UIAChanCtx.om3g: | .interfaces
package/lib/lib/release/ti.uia.events/UIAChanCtx.om3g: UIAChanCtx.c lib/release/ti.uia.events.am3g.mak
	@$(RM) $@.dep
	$(RM) $@
	@$(MSG) clm3g $< ...
	$(gnu.targets.arm.M3.rootDir)/bin/arm-none-eabi-gcc -c -MD -MF $@.dep -x c  -Wunused -Wunknown-pragmas -ffunction-sections -fdata-sections  -mcpu=cortex-m3 -mthumb -mabi=aapcs -g -Dfar= -D__DYNAMIC_REENT__  -g  -Dxdc_target_name__=M3 -Dxdc_target_types__=gnu/targets/arm/std.h -Dxdc_bld__profile_release -Dxdc_bld__vers_1_0_4_8_4  -O2  -I/db/vtree/library/trees/zumaprod/zumaprod-o08/exports/tirtos_cc13xx_cc26xx_2_21_01_08/products/bios_6_46_01_38/packages/gnu/targets/arm//libs/install-native/arm-none-eabi/include   $(XDCINCS)  -o $@ $<
	-@$(FIXDEP) $@.dep $@.dep
	
package/lib/lib/release/ti.uia.events/UIAChanCtx.om3g: export LD_LIBRARY_PATH=

package/lib/lib/release/ti.uia.events/UIAChanCtx.sm3g: | .interfaces
package/lib/lib/release/ti.uia.events/UIAChanCtx.sm3g: UIAChanCtx.c lib/release/ti.uia.events.am3g.mak
	@$(RM) $@.dep
	$(RM) $@
	@$(MSG) clm3g -S $< ...
	$(gnu.targets.arm.M3.rootDir)/bin/arm-none-eabi-gcc -c -MD -MF $@.dep -x c -S -Wunused -Wunknown-pragmas -ffunction-sections -fdata-sections  -mcpu=cortex-m3 -mthumb -mabi=aapcs -g -Dfar= -D__DYNAMIC_REENT__  -g  -Dxdc_target_name__=M3 -Dxdc_target_types__=gnu/targets/arm/std.h -Dxdc_bld__profile_release -Dxdc_bld__vers_1_0_4_8_4  -O2   $(XDCINCS)  -o $@ $<
	-@$(FIXDEP) $@.dep $@.dep
	
package/lib/lib/release/ti.uia.events/UIAChanCtx.sm3g: export LD_LIBRARY_PATH=

ifeq (,$(MK_NOGENDEPS))
-include package/lib/lib/release/ti.uia.events/UIAFrameCtx.om3g.dep
package/lib/lib/release/ti.uia.events/UIAFrameCtx.om3g.dep: ;
endif

package/lib/lib/release/ti.uia.events/UIAFrameCtx.om3g: | .interfaces
package/lib/lib/release/ti.uia.events/UIAFrameCtx.om3g: UIAFrameCtx.c lib/release/ti.uia.events.am3g.mak
	@$(RM) $@.dep
	$(RM) $@
	@$(MSG) clm3g $< ...
	$(gnu.targets.arm.M3.rootDir)/bin/arm-none-eabi-gcc -c -MD -MF $@.dep -x c  -Wunused -Wunknown-pragmas -ffunction-sections -fdata-sections  -mcpu=cortex-m3 -mthumb -mabi=aapcs -g -Dfar= -D__DYNAMIC_REENT__  -g  -Dxdc_target_name__=M3 -Dxdc_target_types__=gnu/targets/arm/std.h -Dxdc_bld__profile_release -Dxdc_bld__vers_1_0_4_8_4  -O2  -I/db/vtree/library/trees/zumaprod/zumaprod-o08/exports/tirtos_cc13xx_cc26xx_2_21_01_08/products/bios_6_46_01_38/packages/gnu/targets/arm//libs/install-native/arm-none-eabi/include   $(XDCINCS)  -o $@ $<
	-@$(FIXDEP) $@.dep $@.dep
	
package/lib/lib/release/ti.uia.events/UIAFrameCtx.om3g: export LD_LIBRARY_PATH=

package/lib/lib/release/ti.uia.events/UIAFrameCtx.sm3g: | .interfaces
package/lib/lib/release/ti.uia.events/UIAFrameCtx.sm3g: UIAFrameCtx.c lib/release/ti.uia.events.am3g.mak
	@$(RM) $@.dep
	$(RM) $@
	@$(MSG) clm3g -S $< ...
	$(gnu.targets.arm.M3.rootDir)/bin/arm-none-eabi-gcc -c -MD -MF $@.dep -x c -S -Wunused -Wunknown-pragmas -ffunction-sections -fdata-sections  -mcpu=cortex-m3 -mthumb -mabi=aapcs -g -Dfar= -D__DYNAMIC_REENT__  -g  -Dxdc_target_name__=M3 -Dxdc_target_types__=gnu/targets/arm/std.h -Dxdc_bld__profile_release -Dxdc_bld__vers_1_0_4_8_4  -O2   $(XDCINCS)  -o $@ $<
	-@$(FIXDEP) $@.dep $@.dep
	
package/lib/lib/release/ti.uia.events/UIAFrameCtx.sm3g: export LD_LIBRARY_PATH=

ifeq (,$(MK_NOGENDEPS))
-include package/lib/lib/release/ti.uia.events/UIAThreadCtx.om3g.dep
package/lib/lib/release/ti.uia.events/UIAThreadCtx.om3g.dep: ;
endif

package/lib/lib/release/ti.uia.events/UIAThreadCtx.om3g: | .interfaces
package/lib/lib/release/ti.uia.events/UIAThreadCtx.om3g: UIAThreadCtx.c lib/release/ti.uia.events.am3g.mak
	@$(RM) $@.dep
	$(RM) $@
	@$(MSG) clm3g $< ...
	$(gnu.targets.arm.M3.rootDir)/bin/arm-none-eabi-gcc -c -MD -MF $@.dep -x c  -Wunused -Wunknown-pragmas -ffunction-sections -fdata-sections  -mcpu=cortex-m3 -mthumb -mabi=aapcs -g -Dfar= -D__DYNAMIC_REENT__  -g  -Dxdc_target_name__=M3 -Dxdc_target_types__=gnu/targets/arm/std.h -Dxdc_bld__profile_release -Dxdc_bld__vers_1_0_4_8_4  -O2  -I/db/vtree/library/trees/zumaprod/zumaprod-o08/exports/tirtos_cc13xx_cc26xx_2_21_01_08/products/bios_6_46_01_38/packages/gnu/targets/arm//libs/install-native/arm-none-eabi/include   $(XDCINCS)  -o $@ $<
	-@$(FIXDEP) $@.dep $@.dep
	
package/lib/lib/release/ti.uia.events/UIAThreadCtx.om3g: export LD_LIBRARY_PATH=

package/lib/lib/release/ti.uia.events/UIAThreadCtx.sm3g: | .interfaces
package/lib/lib/release/ti.uia.events/UIAThreadCtx.sm3g: UIAThreadCtx.c lib/release/ti.uia.events.am3g.mak
	@$(RM) $@.dep
	$(RM) $@
	@$(MSG) clm3g -S $< ...
	$(gnu.targets.arm.M3.rootDir)/bin/arm-none-eabi-gcc -c -MD -MF $@.dep -x c -S -Wunused -Wunknown-pragmas -ffunction-sections -fdata-sections  -mcpu=cortex-m3 -mthumb -mabi=aapcs -g -Dfar= -D__DYNAMIC_REENT__  -g  -Dxdc_target_name__=M3 -Dxdc_target_types__=gnu/targets/arm/std.h -Dxdc_bld__profile_release -Dxdc_bld__vers_1_0_4_8_4  -O2   $(XDCINCS)  -o $@ $<
	-@$(FIXDEP) $@.dep $@.dep
	
package/lib/lib/release/ti.uia.events/UIAThreadCtx.sm3g: export LD_LIBRARY_PATH=

ifeq (,$(MK_NOGENDEPS))
-include package/lib/lib/release/ti.uia.events/UIAUserCtx.om3g.dep
package/lib/lib/release/ti.uia.events/UIAUserCtx.om3g.dep: ;
endif

package/lib/lib/release/ti.uia.events/UIAUserCtx.om3g: | .interfaces
package/lib/lib/release/ti.uia.events/UIAUserCtx.om3g: UIAUserCtx.c lib/release/ti.uia.events.am3g.mak
	@$(RM) $@.dep
	$(RM) $@
	@$(MSG) clm3g $< ...
	$(gnu.targets.arm.M3.rootDir)/bin/arm-none-eabi-gcc -c -MD -MF $@.dep -x c  -Wunused -Wunknown-pragmas -ffunction-sections -fdata-sections  -mcpu=cortex-m3 -mthumb -mabi=aapcs -g -Dfar= -D__DYNAMIC_REENT__  -g  -Dxdc_target_name__=M3 -Dxdc_target_types__=gnu/targets/arm/std.h -Dxdc_bld__profile_release -Dxdc_bld__vers_1_0_4_8_4  -O2  -I/db/vtree/library/trees/zumaprod/zumaprod-o08/exports/tirtos_cc13xx_cc26xx_2_21_01_08/products/bios_6_46_01_38/packages/gnu/targets/arm//libs/install-native/arm-none-eabi/include   $(XDCINCS)  -o $@ $<
	-@$(FIXDEP) $@.dep $@.dep
	
package/lib/lib/release/ti.uia.events/UIAUserCtx.om3g: export LD_LIBRARY_PATH=

package/lib/lib/release/ti.uia.events/UIAUserCtx.sm3g: | .interfaces
package/lib/lib/release/ti.uia.events/UIAUserCtx.sm3g: UIAUserCtx.c lib/release/ti.uia.events.am3g.mak
	@$(RM) $@.dep
	$(RM) $@
	@$(MSG) clm3g -S $< ...
	$(gnu.targets.arm.M3.rootDir)/bin/arm-none-eabi-gcc -c -MD -MF $@.dep -x c -S -Wunused -Wunknown-pragmas -ffunction-sections -fdata-sections  -mcpu=cortex-m3 -mthumb -mabi=aapcs -g -Dfar= -D__DYNAMIC_REENT__  -g  -Dxdc_target_name__=M3 -Dxdc_target_types__=gnu/targets/arm/std.h -Dxdc_bld__profile_release -Dxdc_bld__vers_1_0_4_8_4  -O2   $(XDCINCS)  -o $@ $<
	-@$(FIXDEP) $@.dep $@.dep
	
package/lib/lib/release/ti.uia.events/UIAUserCtx.sm3g: export LD_LIBRARY_PATH=

clean,m3g ::
	-$(RM) package/lib/lib/release/ti.uia.events/package/package_ti.uia.events.om3g
	-$(RM) package/lib/lib/release/ti.uia.events/UIAAppCtx.om3g
	-$(RM) package/lib/lib/release/ti.uia.events/UIAChanCtx.om3g
	-$(RM) package/lib/lib/release/ti.uia.events/UIAFrameCtx.om3g
	-$(RM) package/lib/lib/release/ti.uia.events/UIAThreadCtx.om3g
	-$(RM) package/lib/lib/release/ti.uia.events/UIAUserCtx.om3g
	-$(RM) package/lib/lib/release/ti.uia.events/package/package_ti.uia.events.sm3g
	-$(RM) package/lib/lib/release/ti.uia.events/UIAAppCtx.sm3g
	-$(RM) package/lib/lib/release/ti.uia.events/UIAChanCtx.sm3g
	-$(RM) package/lib/lib/release/ti.uia.events/UIAFrameCtx.sm3g
	-$(RM) package/lib/lib/release/ti.uia.events/UIAThreadCtx.sm3g
	-$(RM) package/lib/lib/release/ti.uia.events/UIAUserCtx.sm3g

lib/release/ti.uia.events.am3g: package/lib/lib/release/ti.uia.events/package/package_ti.uia.events.om3g package/lib/lib/release/ti.uia.events/UIAAppCtx.om3g package/lib/lib/release/ti.uia.events/UIAChanCtx.om3g package/lib/lib/release/ti.uia.events/UIAFrameCtx.om3g package/lib/lib/release/ti.uia.events/UIAThreadCtx.om3g package/lib/lib/release/ti.uia.events/UIAUserCtx.om3g lib/release/ti.uia.events.am3g.mak

clean::
	-$(RM) lib/release/ti.uia.events.am3g.mak
