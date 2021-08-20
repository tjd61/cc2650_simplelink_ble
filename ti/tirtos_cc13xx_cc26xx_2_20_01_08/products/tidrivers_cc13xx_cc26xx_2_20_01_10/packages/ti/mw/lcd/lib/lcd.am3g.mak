#
#  Do not edit this file.  This file is generated from 
#  package.bld.  Any modifications to this file will be 
#  overwritten whenever makefiles are re-generated.
#
#  target compatibility key = gnu.targets.arm.M3{1,0,4.8,4
#
ifeq (,$(MK_NOGENDEPS))
-include package/lib/lib/lcd/package/package_ti.mw.lcd.om3g.dep
package/lib/lib/lcd/package/package_ti.mw.lcd.om3g.dep: ;
endif

package/lib/lib/lcd/package/package_ti.mw.lcd.om3g: | .interfaces
package/lib/lib/lcd/package/package_ti.mw.lcd.om3g: package/package_ti.mw.lcd.c lib/lcd.am3g.mak
	@$(RM) $@.dep
	$(RM) $@
	@$(MSG) clm3g $< ...
	$(gnu.targets.arm.M3.rootDir)/bin/arm-none-eabi-gcc -c -MD -MF $@.dep -x c  -Wunused -Wunknown-pragmas -ffunction-sections -fdata-sections  -mcpu=cortex-m3 -mthumb -mabi=aapcs -g -Dfar= -D__DYNAMIC_REENT__  -g -Dgcc  -Dxdc_target_name__=M3 -Dxdc_target_types__=gnu/targets/arm/std.h -Dxdc_bld__profile_release -Dxdc_bld__vers_1_0_4_8_4  -O2   -I. -Dxdc_runtime_Log_DISABLE_ALL -Dxdc_runtime_Assert_DISABLE_ALL -I/db/vtree/library/trees/zumaprod/zumaprod-n08/exports/tirtos_cc13xx_cc26xx_2_20_01_08/products/bios_6_46_01_38/packages/gnu/targets/arm//libs/install-native/arm-none-eabi/include   $(XDCINCS)  -o $@ $<
	-@$(FIXDEP) $@.dep $@.dep
	
package/lib/lib/lcd/package/package_ti.mw.lcd.om3g: export LD_LIBRARY_PATH=

package/lib/lib/lcd/package/package_ti.mw.lcd.sm3g: | .interfaces
package/lib/lib/lcd/package/package_ti.mw.lcd.sm3g: package/package_ti.mw.lcd.c lib/lcd.am3g.mak
	@$(RM) $@.dep
	$(RM) $@
	@$(MSG) clm3g -S $< ...
	$(gnu.targets.arm.M3.rootDir)/bin/arm-none-eabi-gcc -c -MD -MF $@.dep -x c -S -Wunused -Wunknown-pragmas -ffunction-sections -fdata-sections  -mcpu=cortex-m3 -mthumb -mabi=aapcs -g -Dfar= -D__DYNAMIC_REENT__  -g -Dgcc  -Dxdc_target_name__=M3 -Dxdc_target_types__=gnu/targets/arm/std.h -Dxdc_bld__profile_release -Dxdc_bld__vers_1_0_4_8_4  -O2   -I. -Dxdc_runtime_Log_DISABLE_ALL -Dxdc_runtime_Assert_DISABLE_ALL  $(XDCINCS)  -o $@ $<
	-@$(FIXDEP) $@.dep $@.dep
	
package/lib/lib/lcd/package/package_ti.mw.lcd.sm3g: export LD_LIBRARY_PATH=

ifeq (,$(MK_NOGENDEPS))
-include package/lib/lib/lcd/./LCDDogm1286.om3g.dep
package/lib/lib/lcd/./LCDDogm1286.om3g.dep: ;
endif

package/lib/lib/lcd/./LCDDogm1286.om3g: | .interfaces
package/lib/lib/lcd/./LCDDogm1286.om3g: ./LCDDogm1286.c lib/lcd.am3g.mak
	@$(RM) $@.dep
	$(RM) $@
	@$(MSG) clm3g $< ...
	$(gnu.targets.arm.M3.rootDir)/bin/arm-none-eabi-gcc -c -MD -MF $@.dep -x c  -Wunused -Wunknown-pragmas -ffunction-sections -fdata-sections  -mcpu=cortex-m3 -mthumb -mabi=aapcs -g -Dfar= -D__DYNAMIC_REENT__  -g -Dgcc  -Dxdc_target_name__=M3 -Dxdc_target_types__=gnu/targets/arm/std.h -Dxdc_bld__profile_release -Dxdc_bld__vers_1_0_4_8_4  -O2   -I. -Dxdc_runtime_Log_DISABLE_ALL -Dxdc_runtime_Assert_DISABLE_ALL -I/db/vtree/library/trees/zumaprod/zumaprod-n08/exports/tirtos_cc13xx_cc26xx_2_20_01_08/products/bios_6_46_01_38/packages/gnu/targets/arm//libs/install-native/arm-none-eabi/include   $(XDCINCS)  -o $@ $<
	-@$(FIXDEP) $@.dep $@.dep
	
package/lib/lib/lcd/./LCDDogm1286.om3g: export LD_LIBRARY_PATH=

package/lib/lib/lcd/./LCDDogm1286.sm3g: | .interfaces
package/lib/lib/lcd/./LCDDogm1286.sm3g: ./LCDDogm1286.c lib/lcd.am3g.mak
	@$(RM) $@.dep
	$(RM) $@
	@$(MSG) clm3g -S $< ...
	$(gnu.targets.arm.M3.rootDir)/bin/arm-none-eabi-gcc -c -MD -MF $@.dep -x c -S -Wunused -Wunknown-pragmas -ffunction-sections -fdata-sections  -mcpu=cortex-m3 -mthumb -mabi=aapcs -g -Dfar= -D__DYNAMIC_REENT__  -g -Dgcc  -Dxdc_target_name__=M3 -Dxdc_target_types__=gnu/targets/arm/std.h -Dxdc_bld__profile_release -Dxdc_bld__vers_1_0_4_8_4  -O2   -I. -Dxdc_runtime_Log_DISABLE_ALL -Dxdc_runtime_Assert_DISABLE_ALL  $(XDCINCS)  -o $@ $<
	-@$(FIXDEP) $@.dep $@.dep
	
package/lib/lib/lcd/./LCDDogm1286.sm3g: export LD_LIBRARY_PATH=

ifeq (,$(MK_NOGENDEPS))
-include package/lib/lib/lcd/./LCDDogm1286_util.om3g.dep
package/lib/lib/lcd/./LCDDogm1286_util.om3g.dep: ;
endif

package/lib/lib/lcd/./LCDDogm1286_util.om3g: | .interfaces
package/lib/lib/lcd/./LCDDogm1286_util.om3g: ./LCDDogm1286_util.c lib/lcd.am3g.mak
	@$(RM) $@.dep
	$(RM) $@
	@$(MSG) clm3g $< ...
	$(gnu.targets.arm.M3.rootDir)/bin/arm-none-eabi-gcc -c -MD -MF $@.dep -x c  -Wunused -Wunknown-pragmas -ffunction-sections -fdata-sections  -mcpu=cortex-m3 -mthumb -mabi=aapcs -g -Dfar= -D__DYNAMIC_REENT__  -g -Dgcc  -Dxdc_target_name__=M3 -Dxdc_target_types__=gnu/targets/arm/std.h -Dxdc_bld__profile_release -Dxdc_bld__vers_1_0_4_8_4  -O2   -I. -Dxdc_runtime_Log_DISABLE_ALL -Dxdc_runtime_Assert_DISABLE_ALL -I/db/vtree/library/trees/zumaprod/zumaprod-n08/exports/tirtos_cc13xx_cc26xx_2_20_01_08/products/bios_6_46_01_38/packages/gnu/targets/arm//libs/install-native/arm-none-eabi/include   $(XDCINCS)  -o $@ $<
	-@$(FIXDEP) $@.dep $@.dep
	
package/lib/lib/lcd/./LCDDogm1286_util.om3g: export LD_LIBRARY_PATH=

package/lib/lib/lcd/./LCDDogm1286_util.sm3g: | .interfaces
package/lib/lib/lcd/./LCDDogm1286_util.sm3g: ./LCDDogm1286_util.c lib/lcd.am3g.mak
	@$(RM) $@.dep
	$(RM) $@
	@$(MSG) clm3g -S $< ...
	$(gnu.targets.arm.M3.rootDir)/bin/arm-none-eabi-gcc -c -MD -MF $@.dep -x c -S -Wunused -Wunknown-pragmas -ffunction-sections -fdata-sections  -mcpu=cortex-m3 -mthumb -mabi=aapcs -g -Dfar= -D__DYNAMIC_REENT__  -g -Dgcc  -Dxdc_target_name__=M3 -Dxdc_target_types__=gnu/targets/arm/std.h -Dxdc_bld__profile_release -Dxdc_bld__vers_1_0_4_8_4  -O2   -I. -Dxdc_runtime_Log_DISABLE_ALL -Dxdc_runtime_Assert_DISABLE_ALL  $(XDCINCS)  -o $@ $<
	-@$(FIXDEP) $@.dep $@.dep
	
package/lib/lib/lcd/./LCDDogm1286_util.sm3g: export LD_LIBRARY_PATH=

ifeq (,$(MK_NOGENDEPS))
-include package/lib/lib/lcd/./SharpGrLib.om3g.dep
package/lib/lib/lcd/./SharpGrLib.om3g.dep: ;
endif

package/lib/lib/lcd/./SharpGrLib.om3g: | .interfaces
package/lib/lib/lcd/./SharpGrLib.om3g: ./SharpGrLib.c lib/lcd.am3g.mak
	@$(RM) $@.dep
	$(RM) $@
	@$(MSG) clm3g $< ...
	$(gnu.targets.arm.M3.rootDir)/bin/arm-none-eabi-gcc -c -MD -MF $@.dep -x c  -Wunused -Wunknown-pragmas -ffunction-sections -fdata-sections  -mcpu=cortex-m3 -mthumb -mabi=aapcs -g -Dfar= -D__DYNAMIC_REENT__  -g -Dgcc  -Dxdc_target_name__=M3 -Dxdc_target_types__=gnu/targets/arm/std.h -Dxdc_bld__profile_release -Dxdc_bld__vers_1_0_4_8_4  -O2   -I. -Dxdc_runtime_Log_DISABLE_ALL -Dxdc_runtime_Assert_DISABLE_ALL -I/db/vtree/library/trees/zumaprod/zumaprod-n08/exports/tirtos_cc13xx_cc26xx_2_20_01_08/products/bios_6_46_01_38/packages/gnu/targets/arm//libs/install-native/arm-none-eabi/include   $(XDCINCS)  -o $@ $<
	-@$(FIXDEP) $@.dep $@.dep
	
package/lib/lib/lcd/./SharpGrLib.om3g: export LD_LIBRARY_PATH=

package/lib/lib/lcd/./SharpGrLib.sm3g: | .interfaces
package/lib/lib/lcd/./SharpGrLib.sm3g: ./SharpGrLib.c lib/lcd.am3g.mak
	@$(RM) $@.dep
	$(RM) $@
	@$(MSG) clm3g -S $< ...
	$(gnu.targets.arm.M3.rootDir)/bin/arm-none-eabi-gcc -c -MD -MF $@.dep -x c -S -Wunused -Wunknown-pragmas -ffunction-sections -fdata-sections  -mcpu=cortex-m3 -mthumb -mabi=aapcs -g -Dfar= -D__DYNAMIC_REENT__  -g -Dgcc  -Dxdc_target_name__=M3 -Dxdc_target_types__=gnu/targets/arm/std.h -Dxdc_bld__profile_release -Dxdc_bld__vers_1_0_4_8_4  -O2   -I. -Dxdc_runtime_Log_DISABLE_ALL -Dxdc_runtime_Assert_DISABLE_ALL  $(XDCINCS)  -o $@ $<
	-@$(FIXDEP) $@.dep $@.dep
	
package/lib/lib/lcd/./SharpGrLib.sm3g: export LD_LIBRARY_PATH=

clean,m3g ::
	-$(RM) package/lib/lib/lcd/package/package_ti.mw.lcd.om3g
	-$(RM) package/lib/lib/lcd/./LCDDogm1286.om3g
	-$(RM) package/lib/lib/lcd/./LCDDogm1286_util.om3g
	-$(RM) package/lib/lib/lcd/./SharpGrLib.om3g
	-$(RM) package/lib/lib/lcd/package/package_ti.mw.lcd.sm3g
	-$(RM) package/lib/lib/lcd/./LCDDogm1286.sm3g
	-$(RM) package/lib/lib/lcd/./LCDDogm1286_util.sm3g
	-$(RM) package/lib/lib/lcd/./SharpGrLib.sm3g

lib/lcd.am3g: package/lib/lib/lcd/package/package_ti.mw.lcd.om3g package/lib/lib/lcd/./LCDDogm1286.om3g package/lib/lib/lcd/./LCDDogm1286_util.om3g package/lib/lib/lcd/./SharpGrLib.om3g lib/lcd.am3g.mak

clean::
	-$(RM) lib/lcd.am3g.mak
