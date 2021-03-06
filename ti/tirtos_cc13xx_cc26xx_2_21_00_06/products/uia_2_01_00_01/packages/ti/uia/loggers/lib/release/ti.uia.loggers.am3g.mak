#
#  Do not edit this file.  This file is generated from 
#  package.bld.  Any modifications to this file will be 
#  overwritten whenever makefiles are re-generated.
#
#  target compatibility key = gnu.targets.arm.M3{1,0,4.8,4
#
ifeq (,$(MK_NOGENDEPS))
-include package/lib/lib/release/ti.uia.loggers/package/package_ti.uia.loggers.om3g.dep
package/lib/lib/release/ti.uia.loggers/package/package_ti.uia.loggers.om3g.dep: ;
endif

package/lib/lib/release/ti.uia.loggers/package/package_ti.uia.loggers.om3g: | .interfaces
package/lib/lib/release/ti.uia.loggers/package/package_ti.uia.loggers.om3g: package/package_ti.uia.loggers.c lib/release/ti.uia.loggers.am3g.mak
	@$(RM) $@.dep
	$(RM) $@
	@$(MSG) clm3g $< ...
	$(gnu.targets.arm.M3.rootDir)/bin/arm-none-eabi-gcc -c -MD -MF $@.dep -x c  -Wunused -Wunknown-pragmas -ffunction-sections -fdata-sections  -mcpu=cortex-m3 -mthumb -mabi=aapcs -g -Dfar= -D__DYNAMIC_REENT__  -g  -Dxdc_target_name__=M3 -Dxdc_target_types__=gnu/targets/arm/std.h -Dxdc_bld__profile_release -Dxdc_bld__vers_1_0_4_8_4  -O2  -I/db/vtree/library/trees/zumaprod/zumaprod-o06/exports/tirtos_cc13xx_cc26xx_2_21_00_06/products/bios_6_46_01_37/packages/gnu/targets/arm//libs/install-native/arm-none-eabi/include   $(XDCINCS)  -o $@ $<
	-@$(FIXDEP) $@.dep $@.dep
	
package/lib/lib/release/ti.uia.loggers/package/package_ti.uia.loggers.om3g: export LD_LIBRARY_PATH=

package/lib/lib/release/ti.uia.loggers/package/package_ti.uia.loggers.sm3g: | .interfaces
package/lib/lib/release/ti.uia.loggers/package/package_ti.uia.loggers.sm3g: package/package_ti.uia.loggers.c lib/release/ti.uia.loggers.am3g.mak
	@$(RM) $@.dep
	$(RM) $@
	@$(MSG) clm3g -S $< ...
	$(gnu.targets.arm.M3.rootDir)/bin/arm-none-eabi-gcc -c -MD -MF $@.dep -x c -S -Wunused -Wunknown-pragmas -ffunction-sections -fdata-sections  -mcpu=cortex-m3 -mthumb -mabi=aapcs -g -Dfar= -D__DYNAMIC_REENT__  -g  -Dxdc_target_name__=M3 -Dxdc_target_types__=gnu/targets/arm/std.h -Dxdc_bld__profile_release -Dxdc_bld__vers_1_0_4_8_4  -O2   $(XDCINCS)  -o $@ $<
	-@$(FIXDEP) $@.dep $@.dep
	
package/lib/lib/release/ti.uia.loggers/package/package_ti.uia.loggers.sm3g: export LD_LIBRARY_PATH=

ifeq (,$(MK_NOGENDEPS))
-include package/lib/lib/release/ti.uia.loggers/LoggerRunMode.om3g.dep
package/lib/lib/release/ti.uia.loggers/LoggerRunMode.om3g.dep: ;
endif

package/lib/lib/release/ti.uia.loggers/LoggerRunMode.om3g: | .interfaces
package/lib/lib/release/ti.uia.loggers/LoggerRunMode.om3g: LoggerRunMode.c lib/release/ti.uia.loggers.am3g.mak
	@$(RM) $@.dep
	$(RM) $@
	@$(MSG) clm3g $< ...
	$(gnu.targets.arm.M3.rootDir)/bin/arm-none-eabi-gcc -c -MD -MF $@.dep -x c  -Wunused -Wunknown-pragmas -ffunction-sections -fdata-sections  -mcpu=cortex-m3 -mthumb -mabi=aapcs -g -Dfar= -D__DYNAMIC_REENT__  -g  -Dxdc_target_name__=M3 -Dxdc_target_types__=gnu/targets/arm/std.h -Dxdc_bld__profile_release -Dxdc_bld__vers_1_0_4_8_4  -O2  -I/db/vtree/library/trees/zumaprod/zumaprod-o06/exports/tirtos_cc13xx_cc26xx_2_21_00_06/products/bios_6_46_01_37/packages/gnu/targets/arm//libs/install-native/arm-none-eabi/include   $(XDCINCS)  -o $@ $<
	-@$(FIXDEP) $@.dep $@.dep
	
package/lib/lib/release/ti.uia.loggers/LoggerRunMode.om3g: export LD_LIBRARY_PATH=

package/lib/lib/release/ti.uia.loggers/LoggerRunMode.sm3g: | .interfaces
package/lib/lib/release/ti.uia.loggers/LoggerRunMode.sm3g: LoggerRunMode.c lib/release/ti.uia.loggers.am3g.mak
	@$(RM) $@.dep
	$(RM) $@
	@$(MSG) clm3g -S $< ...
	$(gnu.targets.arm.M3.rootDir)/bin/arm-none-eabi-gcc -c -MD -MF $@.dep -x c -S -Wunused -Wunknown-pragmas -ffunction-sections -fdata-sections  -mcpu=cortex-m3 -mthumb -mabi=aapcs -g -Dfar= -D__DYNAMIC_REENT__  -g  -Dxdc_target_name__=M3 -Dxdc_target_types__=gnu/targets/arm/std.h -Dxdc_bld__profile_release -Dxdc_bld__vers_1_0_4_8_4  -O2   $(XDCINCS)  -o $@ $<
	-@$(FIXDEP) $@.dep $@.dep
	
package/lib/lib/release/ti.uia.loggers/LoggerRunMode.sm3g: export LD_LIBRARY_PATH=

ifeq (,$(MK_NOGENDEPS))
-include package/lib/lib/release/ti.uia.loggers/LoggerStopMode.om3g.dep
package/lib/lib/release/ti.uia.loggers/LoggerStopMode.om3g.dep: ;
endif

package/lib/lib/release/ti.uia.loggers/LoggerStopMode.om3g: | .interfaces
package/lib/lib/release/ti.uia.loggers/LoggerStopMode.om3g: LoggerStopMode.c lib/release/ti.uia.loggers.am3g.mak
	@$(RM) $@.dep
	$(RM) $@
	@$(MSG) clm3g $< ...
	$(gnu.targets.arm.M3.rootDir)/bin/arm-none-eabi-gcc -c -MD -MF $@.dep -x c  -Wunused -Wunknown-pragmas -ffunction-sections -fdata-sections  -mcpu=cortex-m3 -mthumb -mabi=aapcs -g -Dfar= -D__DYNAMIC_REENT__  -g  -Dxdc_target_name__=M3 -Dxdc_target_types__=gnu/targets/arm/std.h -Dxdc_bld__profile_release -Dxdc_bld__vers_1_0_4_8_4  -O2  -I/db/vtree/library/trees/zumaprod/zumaprod-o06/exports/tirtos_cc13xx_cc26xx_2_21_00_06/products/bios_6_46_01_37/packages/gnu/targets/arm//libs/install-native/arm-none-eabi/include   $(XDCINCS)  -o $@ $<
	-@$(FIXDEP) $@.dep $@.dep
	
package/lib/lib/release/ti.uia.loggers/LoggerStopMode.om3g: export LD_LIBRARY_PATH=

package/lib/lib/release/ti.uia.loggers/LoggerStopMode.sm3g: | .interfaces
package/lib/lib/release/ti.uia.loggers/LoggerStopMode.sm3g: LoggerStopMode.c lib/release/ti.uia.loggers.am3g.mak
	@$(RM) $@.dep
	$(RM) $@
	@$(MSG) clm3g -S $< ...
	$(gnu.targets.arm.M3.rootDir)/bin/arm-none-eabi-gcc -c -MD -MF $@.dep -x c -S -Wunused -Wunknown-pragmas -ffunction-sections -fdata-sections  -mcpu=cortex-m3 -mthumb -mabi=aapcs -g -Dfar= -D__DYNAMIC_REENT__  -g  -Dxdc_target_name__=M3 -Dxdc_target_types__=gnu/targets/arm/std.h -Dxdc_bld__profile_release -Dxdc_bld__vers_1_0_4_8_4  -O2   $(XDCINCS)  -o $@ $<
	-@$(FIXDEP) $@.dep $@.dep
	
package/lib/lib/release/ti.uia.loggers/LoggerStopMode.sm3g: export LD_LIBRARY_PATH=

ifeq (,$(MK_NOGENDEPS))
-include package/lib/lib/release/ti.uia.loggers/LoggerMin.om3g.dep
package/lib/lib/release/ti.uia.loggers/LoggerMin.om3g.dep: ;
endif

package/lib/lib/release/ti.uia.loggers/LoggerMin.om3g: | .interfaces
package/lib/lib/release/ti.uia.loggers/LoggerMin.om3g: LoggerMin.c lib/release/ti.uia.loggers.am3g.mak
	@$(RM) $@.dep
	$(RM) $@
	@$(MSG) clm3g $< ...
	$(gnu.targets.arm.M3.rootDir)/bin/arm-none-eabi-gcc -c -MD -MF $@.dep -x c  -Wunused -Wunknown-pragmas -ffunction-sections -fdata-sections  -mcpu=cortex-m3 -mthumb -mabi=aapcs -g -Dfar= -D__DYNAMIC_REENT__  -g  -Dxdc_target_name__=M3 -Dxdc_target_types__=gnu/targets/arm/std.h -Dxdc_bld__profile_release -Dxdc_bld__vers_1_0_4_8_4  -O2  -I/db/vtree/library/trees/zumaprod/zumaprod-o06/exports/tirtos_cc13xx_cc26xx_2_21_00_06/products/bios_6_46_01_37/packages/gnu/targets/arm//libs/install-native/arm-none-eabi/include   $(XDCINCS)  -o $@ $<
	-@$(FIXDEP) $@.dep $@.dep
	
package/lib/lib/release/ti.uia.loggers/LoggerMin.om3g: export LD_LIBRARY_PATH=

package/lib/lib/release/ti.uia.loggers/LoggerMin.sm3g: | .interfaces
package/lib/lib/release/ti.uia.loggers/LoggerMin.sm3g: LoggerMin.c lib/release/ti.uia.loggers.am3g.mak
	@$(RM) $@.dep
	$(RM) $@
	@$(MSG) clm3g -S $< ...
	$(gnu.targets.arm.M3.rootDir)/bin/arm-none-eabi-gcc -c -MD -MF $@.dep -x c -S -Wunused -Wunknown-pragmas -ffunction-sections -fdata-sections  -mcpu=cortex-m3 -mthumb -mabi=aapcs -g -Dfar= -D__DYNAMIC_REENT__  -g  -Dxdc_target_name__=M3 -Dxdc_target_types__=gnu/targets/arm/std.h -Dxdc_bld__profile_release -Dxdc_bld__vers_1_0_4_8_4  -O2   $(XDCINCS)  -o $@ $<
	-@$(FIXDEP) $@.dep $@.dep
	
package/lib/lib/release/ti.uia.loggers/LoggerMin.sm3g: export LD_LIBRARY_PATH=

clean,m3g ::
	-$(RM) package/lib/lib/release/ti.uia.loggers/package/package_ti.uia.loggers.om3g
	-$(RM) package/lib/lib/release/ti.uia.loggers/LoggerRunMode.om3g
	-$(RM) package/lib/lib/release/ti.uia.loggers/LoggerStopMode.om3g
	-$(RM) package/lib/lib/release/ti.uia.loggers/LoggerMin.om3g
	-$(RM) package/lib/lib/release/ti.uia.loggers/package/package_ti.uia.loggers.sm3g
	-$(RM) package/lib/lib/release/ti.uia.loggers/LoggerRunMode.sm3g
	-$(RM) package/lib/lib/release/ti.uia.loggers/LoggerStopMode.sm3g
	-$(RM) package/lib/lib/release/ti.uia.loggers/LoggerMin.sm3g

lib/release/ti.uia.loggers.am3g: package/lib/lib/release/ti.uia.loggers/package/package_ti.uia.loggers.om3g package/lib/lib/release/ti.uia.loggers/LoggerRunMode.om3g package/lib/lib/release/ti.uia.loggers/LoggerStopMode.om3g package/lib/lib/release/ti.uia.loggers/LoggerMin.om3g lib/release/ti.uia.loggers.am3g.mak

clean::
	-$(RM) lib/release/ti.uia.loggers.am3g.mak
