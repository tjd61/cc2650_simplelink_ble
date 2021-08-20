#
#  Do not edit this file.  This file is generated from 
#  package.bld.  Any modifications to this file will be 
#  overwritten whenever makefiles are re-generated.
#
#  target compatibility key = gnu.targets.arm.M3{1,0,4.8,4
#
ifeq (,$(MK_NOGENDEPS))
-include package/lib/lib/power_cc13xx_tirtos/package/package_ti.drivers.om3g.dep
package/lib/lib/power_cc13xx_tirtos/package/package_ti.drivers.om3g.dep: ;
endif

package/lib/lib/power_cc13xx_tirtos/package/package_ti.drivers.om3g: | .interfaces
package/lib/lib/power_cc13xx_tirtos/package/package_ti.drivers.om3g: package/package_ti.drivers.c lib/power_cc13xx_tirtos.am3g.mak
	@$(RM) $@.dep
	$(RM) $@
	@$(MSG) clm3g $< ...
	$(gnu.targets.arm.M3.rootDir)/bin/arm-none-eabi-gcc -c -MD -MF $@.dep -x c  -Wunused -Wunknown-pragmas -ffunction-sections -fdata-sections  -mcpu=cortex-m3 -mthumb -mabi=aapcs -g -Dfar= -D__DYNAMIC_REENT__  -g -Dgcc  -Dxdc_target_name__=M3 -Dxdc_target_types__=gnu/targets/arm/std.h -Dxdc_bld__profile_release -Dxdc_bld__vers_1_0_4_8_4  -O2   -I/db/vtree/library/trees/zumaprod/zumaprod-n08/exports/tirtos_cc13xx_cc26xx_2_20_01_08/products/cc13xxware_2_04_02_17240 -Dxdc_runtime_Log_DISABLE_ALL -Dxdc_runtime_Assert_DISABLE_ALL -I/db/vtree/library/trees/zumaprod/zumaprod-n08/exports/tirtos_cc13xx_cc26xx_2_20_01_08/products/bios_6_46_01_38/packages/gnu/targets/arm//libs/install-native/arm-none-eabi/include   $(XDCINCS)  -o $@ $<
	-@$(FIXDEP) $@.dep $@.dep
	
package/lib/lib/power_cc13xx_tirtos/package/package_ti.drivers.om3g: export LD_LIBRARY_PATH=

package/lib/lib/power_cc13xx_tirtos/package/package_ti.drivers.sm3g: | .interfaces
package/lib/lib/power_cc13xx_tirtos/package/package_ti.drivers.sm3g: package/package_ti.drivers.c lib/power_cc13xx_tirtos.am3g.mak
	@$(RM) $@.dep
	$(RM) $@
	@$(MSG) clm3g -S $< ...
	$(gnu.targets.arm.M3.rootDir)/bin/arm-none-eabi-gcc -c -MD -MF $@.dep -x c -S -Wunused -Wunknown-pragmas -ffunction-sections -fdata-sections  -mcpu=cortex-m3 -mthumb -mabi=aapcs -g -Dfar= -D__DYNAMIC_REENT__  -g -Dgcc  -Dxdc_target_name__=M3 -Dxdc_target_types__=gnu/targets/arm/std.h -Dxdc_bld__profile_release -Dxdc_bld__vers_1_0_4_8_4  -O2   -I/db/vtree/library/trees/zumaprod/zumaprod-n08/exports/tirtos_cc13xx_cc26xx_2_20_01_08/products/cc13xxware_2_04_02_17240 -Dxdc_runtime_Log_DISABLE_ALL -Dxdc_runtime_Assert_DISABLE_ALL  $(XDCINCS)  -o $@ $<
	-@$(FIXDEP) $@.dep $@.dep
	
package/lib/lib/power_cc13xx_tirtos/package/package_ti.drivers.sm3g: export LD_LIBRARY_PATH=

ifeq (,$(MK_NOGENDEPS))
-include package/lib/lib/power_cc13xx_tirtos/./power/PowerCC26XX_tirtos.om3g.dep
package/lib/lib/power_cc13xx_tirtos/./power/PowerCC26XX_tirtos.om3g.dep: ;
endif

package/lib/lib/power_cc13xx_tirtos/./power/PowerCC26XX_tirtos.om3g: | .interfaces
package/lib/lib/power_cc13xx_tirtos/./power/PowerCC26XX_tirtos.om3g: ./power/PowerCC26XX_tirtos.c lib/power_cc13xx_tirtos.am3g.mak
	@$(RM) $@.dep
	$(RM) $@
	@$(MSG) clm3g $< ...
	$(gnu.targets.arm.M3.rootDir)/bin/arm-none-eabi-gcc -c -MD -MF $@.dep -x c  -Wunused -Wunknown-pragmas -ffunction-sections -fdata-sections  -mcpu=cortex-m3 -mthumb -mabi=aapcs -g -Dfar= -D__DYNAMIC_REENT__  -g -Dgcc  -Dxdc_target_name__=M3 -Dxdc_target_types__=gnu/targets/arm/std.h -Dxdc_bld__profile_release -Dxdc_bld__vers_1_0_4_8_4  -O2   -I/db/vtree/library/trees/zumaprod/zumaprod-n08/exports/tirtos_cc13xx_cc26xx_2_20_01_08/products/cc13xxware_2_04_02_17240 -Dxdc_runtime_Log_DISABLE_ALL -Dxdc_runtime_Assert_DISABLE_ALL -I/db/vtree/library/trees/zumaprod/zumaprod-n08/exports/tirtos_cc13xx_cc26xx_2_20_01_08/products/bios_6_46_01_38/packages/gnu/targets/arm//libs/install-native/arm-none-eabi/include   $(XDCINCS)  -o $@ $<
	-@$(FIXDEP) $@.dep $@.dep
	
package/lib/lib/power_cc13xx_tirtos/./power/PowerCC26XX_tirtos.om3g: export LD_LIBRARY_PATH=

package/lib/lib/power_cc13xx_tirtos/./power/PowerCC26XX_tirtos.sm3g: | .interfaces
package/lib/lib/power_cc13xx_tirtos/./power/PowerCC26XX_tirtos.sm3g: ./power/PowerCC26XX_tirtos.c lib/power_cc13xx_tirtos.am3g.mak
	@$(RM) $@.dep
	$(RM) $@
	@$(MSG) clm3g -S $< ...
	$(gnu.targets.arm.M3.rootDir)/bin/arm-none-eabi-gcc -c -MD -MF $@.dep -x c -S -Wunused -Wunknown-pragmas -ffunction-sections -fdata-sections  -mcpu=cortex-m3 -mthumb -mabi=aapcs -g -Dfar= -D__DYNAMIC_REENT__  -g -Dgcc  -Dxdc_target_name__=M3 -Dxdc_target_types__=gnu/targets/arm/std.h -Dxdc_bld__profile_release -Dxdc_bld__vers_1_0_4_8_4  -O2   -I/db/vtree/library/trees/zumaprod/zumaprod-n08/exports/tirtos_cc13xx_cc26xx_2_20_01_08/products/cc13xxware_2_04_02_17240 -Dxdc_runtime_Log_DISABLE_ALL -Dxdc_runtime_Assert_DISABLE_ALL  $(XDCINCS)  -o $@ $<
	-@$(FIXDEP) $@.dep $@.dep
	
package/lib/lib/power_cc13xx_tirtos/./power/PowerCC26XX_tirtos.sm3g: export LD_LIBRARY_PATH=

clean,m3g ::
	-$(RM) package/lib/lib/power_cc13xx_tirtos/package/package_ti.drivers.om3g
	-$(RM) package/lib/lib/power_cc13xx_tirtos/./power/PowerCC26XX_tirtos.om3g
	-$(RM) package/lib/lib/power_cc13xx_tirtos/package/package_ti.drivers.sm3g
	-$(RM) package/lib/lib/power_cc13xx_tirtos/./power/PowerCC26XX_tirtos.sm3g

lib/power_cc13xx_tirtos.am3g: package/lib/lib/power_cc13xx_tirtos/package/package_ti.drivers.om3g package/lib/lib/power_cc13xx_tirtos/./power/PowerCC26XX_tirtos.om3g lib/power_cc13xx_tirtos.am3g.mak

clean::
	-$(RM) lib/power_cc13xx_tirtos.am3g.mak
