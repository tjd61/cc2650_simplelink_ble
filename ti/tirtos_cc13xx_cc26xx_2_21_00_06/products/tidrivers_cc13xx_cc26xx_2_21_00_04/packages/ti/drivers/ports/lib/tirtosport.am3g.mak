#
#  Do not edit this file.  This file is generated from 
#  package.bld.  Any modifications to this file will be 
#  overwritten whenever makefiles are re-generated.
#
#  target compatibility key = gnu.targets.arm.M3{1,0,4.8,4
#
ifeq (,$(MK_NOGENDEPS))
-include package/lib/lib/tirtosport/package/package_ti.drivers.ports.om3g.dep
package/lib/lib/tirtosport/package/package_ti.drivers.ports.om3g.dep: ;
endif

package/lib/lib/tirtosport/package/package_ti.drivers.ports.om3g: | .interfaces
package/lib/lib/tirtosport/package/package_ti.drivers.ports.om3g: package/package_ti.drivers.ports.c lib/tirtosport.am3g.mak
	@$(RM) $@.dep
	$(RM) $@
	@$(MSG) clm3g $< ...
	$(gnu.targets.arm.M3.rootDir)/bin/arm-none-eabi-gcc -c -MD -MF $@.dep -x c  -Wunused -Wunknown-pragmas -ffunction-sections -fdata-sections  -mcpu=cortex-m3 -mthumb -mabi=aapcs -g -Dfar= -D__DYNAMIC_REENT__  -g -Dgcc  -Dxdc_target_name__=M3 -Dxdc_target_types__=gnu/targets/arm/std.h -Dxdc_bld__profile_release -Dxdc_bld__vers_1_0_4_8_4  -O2   -DTIRTOS -I/db/vtree/library/trees/zumaprod/zumaprod-o06/exports/tirtos_cc13xx_cc26xx_2_21_00_06/products/bios_6_46_01_37/packages/gnu/targets/arm//libs/install-native/arm-none-eabi/include   $(XDCINCS)  -o $@ $<
	-@$(FIXDEP) $@.dep $@.dep
	
package/lib/lib/tirtosport/package/package_ti.drivers.ports.om3g: export LD_LIBRARY_PATH=

package/lib/lib/tirtosport/package/package_ti.drivers.ports.sm3g: | .interfaces
package/lib/lib/tirtosport/package/package_ti.drivers.ports.sm3g: package/package_ti.drivers.ports.c lib/tirtosport.am3g.mak
	@$(RM) $@.dep
	$(RM) $@
	@$(MSG) clm3g -S $< ...
	$(gnu.targets.arm.M3.rootDir)/bin/arm-none-eabi-gcc -c -MD -MF $@.dep -x c -S -Wunused -Wunknown-pragmas -ffunction-sections -fdata-sections  -mcpu=cortex-m3 -mthumb -mabi=aapcs -g -Dfar= -D__DYNAMIC_REENT__  -g -Dgcc  -Dxdc_target_name__=M3 -Dxdc_target_types__=gnu/targets/arm/std.h -Dxdc_bld__profile_release -Dxdc_bld__vers_1_0_4_8_4  -O2   -DTIRTOS  $(XDCINCS)  -o $@ $<
	-@$(FIXDEP) $@.dep $@.dep
	
package/lib/lib/tirtosport/package/package_ti.drivers.ports.sm3g: export LD_LIBRARY_PATH=

ifeq (,$(MK_NOGENDEPS))
-include package/lib/lib/tirtosport/./tirtos/ClockP_tirtos.om3g.dep
package/lib/lib/tirtosport/./tirtos/ClockP_tirtos.om3g.dep: ;
endif

package/lib/lib/tirtosport/./tirtos/ClockP_tirtos.om3g: | .interfaces
package/lib/lib/tirtosport/./tirtos/ClockP_tirtos.om3g: ./tirtos/ClockP_tirtos.c lib/tirtosport.am3g.mak
	@$(RM) $@.dep
	$(RM) $@
	@$(MSG) clm3g $< ...
	$(gnu.targets.arm.M3.rootDir)/bin/arm-none-eabi-gcc -c -MD -MF $@.dep -x c  -Wunused -Wunknown-pragmas -ffunction-sections -fdata-sections  -mcpu=cortex-m3 -mthumb -mabi=aapcs -g -Dfar= -D__DYNAMIC_REENT__  -g -Dgcc  -Dxdc_target_name__=M3 -Dxdc_target_types__=gnu/targets/arm/std.h -Dxdc_bld__profile_release -Dxdc_bld__vers_1_0_4_8_4  -O2   -DTIRTOS -I/db/vtree/library/trees/zumaprod/zumaprod-o06/exports/tirtos_cc13xx_cc26xx_2_21_00_06/products/bios_6_46_01_37/packages/gnu/targets/arm//libs/install-native/arm-none-eabi/include   $(XDCINCS)  -o $@ $<
	-@$(FIXDEP) $@.dep $@.dep
	
package/lib/lib/tirtosport/./tirtos/ClockP_tirtos.om3g: export LD_LIBRARY_PATH=

package/lib/lib/tirtosport/./tirtos/ClockP_tirtos.sm3g: | .interfaces
package/lib/lib/tirtosport/./tirtos/ClockP_tirtos.sm3g: ./tirtos/ClockP_tirtos.c lib/tirtosport.am3g.mak
	@$(RM) $@.dep
	$(RM) $@
	@$(MSG) clm3g -S $< ...
	$(gnu.targets.arm.M3.rootDir)/bin/arm-none-eabi-gcc -c -MD -MF $@.dep -x c -S -Wunused -Wunknown-pragmas -ffunction-sections -fdata-sections  -mcpu=cortex-m3 -mthumb -mabi=aapcs -g -Dfar= -D__DYNAMIC_REENT__  -g -Dgcc  -Dxdc_target_name__=M3 -Dxdc_target_types__=gnu/targets/arm/std.h -Dxdc_bld__profile_release -Dxdc_bld__vers_1_0_4_8_4  -O2   -DTIRTOS  $(XDCINCS)  -o $@ $<
	-@$(FIXDEP) $@.dep $@.dep
	
package/lib/lib/tirtosport/./tirtos/ClockP_tirtos.sm3g: export LD_LIBRARY_PATH=

ifeq (,$(MK_NOGENDEPS))
-include package/lib/lib/tirtosport/./tirtos/DebugP_tirtos.om3g.dep
package/lib/lib/tirtosport/./tirtos/DebugP_tirtos.om3g.dep: ;
endif

package/lib/lib/tirtosport/./tirtos/DebugP_tirtos.om3g: | .interfaces
package/lib/lib/tirtosport/./tirtos/DebugP_tirtos.om3g: ./tirtos/DebugP_tirtos.c lib/tirtosport.am3g.mak
	@$(RM) $@.dep
	$(RM) $@
	@$(MSG) clm3g $< ...
	$(gnu.targets.arm.M3.rootDir)/bin/arm-none-eabi-gcc -c -MD -MF $@.dep -x c  -Wunused -Wunknown-pragmas -ffunction-sections -fdata-sections  -mcpu=cortex-m3 -mthumb -mabi=aapcs -g -Dfar= -D__DYNAMIC_REENT__  -g -Dgcc  -Dxdc_target_name__=M3 -Dxdc_target_types__=gnu/targets/arm/std.h -Dxdc_bld__profile_release -Dxdc_bld__vers_1_0_4_8_4  -O2   -DTIRTOS -I/db/vtree/library/trees/zumaprod/zumaprod-o06/exports/tirtos_cc13xx_cc26xx_2_21_00_06/products/bios_6_46_01_37/packages/gnu/targets/arm//libs/install-native/arm-none-eabi/include   $(XDCINCS)  -o $@ $<
	-@$(FIXDEP) $@.dep $@.dep
	
package/lib/lib/tirtosport/./tirtos/DebugP_tirtos.om3g: export LD_LIBRARY_PATH=

package/lib/lib/tirtosport/./tirtos/DebugP_tirtos.sm3g: | .interfaces
package/lib/lib/tirtosport/./tirtos/DebugP_tirtos.sm3g: ./tirtos/DebugP_tirtos.c lib/tirtosport.am3g.mak
	@$(RM) $@.dep
	$(RM) $@
	@$(MSG) clm3g -S $< ...
	$(gnu.targets.arm.M3.rootDir)/bin/arm-none-eabi-gcc -c -MD -MF $@.dep -x c -S -Wunused -Wunknown-pragmas -ffunction-sections -fdata-sections  -mcpu=cortex-m3 -mthumb -mabi=aapcs -g -Dfar= -D__DYNAMIC_REENT__  -g -Dgcc  -Dxdc_target_name__=M3 -Dxdc_target_types__=gnu/targets/arm/std.h -Dxdc_bld__profile_release -Dxdc_bld__vers_1_0_4_8_4  -O2   -DTIRTOS  $(XDCINCS)  -o $@ $<
	-@$(FIXDEP) $@.dep $@.dep
	
package/lib/lib/tirtosport/./tirtos/DebugP_tirtos.sm3g: export LD_LIBRARY_PATH=

ifeq (,$(MK_NOGENDEPS))
-include package/lib/lib/tirtosport/./tirtos/HwiP_tirtos.om3g.dep
package/lib/lib/tirtosport/./tirtos/HwiP_tirtos.om3g.dep: ;
endif

package/lib/lib/tirtosport/./tirtos/HwiP_tirtos.om3g: | .interfaces
package/lib/lib/tirtosport/./tirtos/HwiP_tirtos.om3g: ./tirtos/HwiP_tirtos.c lib/tirtosport.am3g.mak
	@$(RM) $@.dep
	$(RM) $@
	@$(MSG) clm3g $< ...
	$(gnu.targets.arm.M3.rootDir)/bin/arm-none-eabi-gcc -c -MD -MF $@.dep -x c  -Wunused -Wunknown-pragmas -ffunction-sections -fdata-sections  -mcpu=cortex-m3 -mthumb -mabi=aapcs -g -Dfar= -D__DYNAMIC_REENT__  -g -Dgcc  -Dxdc_target_name__=M3 -Dxdc_target_types__=gnu/targets/arm/std.h -Dxdc_bld__profile_release -Dxdc_bld__vers_1_0_4_8_4  -O2   -DTIRTOS -I/db/vtree/library/trees/zumaprod/zumaprod-o06/exports/tirtos_cc13xx_cc26xx_2_21_00_06/products/bios_6_46_01_37/packages/gnu/targets/arm//libs/install-native/arm-none-eabi/include   $(XDCINCS)  -o $@ $<
	-@$(FIXDEP) $@.dep $@.dep
	
package/lib/lib/tirtosport/./tirtos/HwiP_tirtos.om3g: export LD_LIBRARY_PATH=

package/lib/lib/tirtosport/./tirtos/HwiP_tirtos.sm3g: | .interfaces
package/lib/lib/tirtosport/./tirtos/HwiP_tirtos.sm3g: ./tirtos/HwiP_tirtos.c lib/tirtosport.am3g.mak
	@$(RM) $@.dep
	$(RM) $@
	@$(MSG) clm3g -S $< ...
	$(gnu.targets.arm.M3.rootDir)/bin/arm-none-eabi-gcc -c -MD -MF $@.dep -x c -S -Wunused -Wunknown-pragmas -ffunction-sections -fdata-sections  -mcpu=cortex-m3 -mthumb -mabi=aapcs -g -Dfar= -D__DYNAMIC_REENT__  -g -Dgcc  -Dxdc_target_name__=M3 -Dxdc_target_types__=gnu/targets/arm/std.h -Dxdc_bld__profile_release -Dxdc_bld__vers_1_0_4_8_4  -O2   -DTIRTOS  $(XDCINCS)  -o $@ $<
	-@$(FIXDEP) $@.dep $@.dep
	
package/lib/lib/tirtosport/./tirtos/HwiP_tirtos.sm3g: export LD_LIBRARY_PATH=

ifeq (,$(MK_NOGENDEPS))
-include package/lib/lib/tirtosport/./tirtos/MutexP_tirtos.om3g.dep
package/lib/lib/tirtosport/./tirtos/MutexP_tirtos.om3g.dep: ;
endif

package/lib/lib/tirtosport/./tirtos/MutexP_tirtos.om3g: | .interfaces
package/lib/lib/tirtosport/./tirtos/MutexP_tirtos.om3g: ./tirtos/MutexP_tirtos.c lib/tirtosport.am3g.mak
	@$(RM) $@.dep
	$(RM) $@
	@$(MSG) clm3g $< ...
	$(gnu.targets.arm.M3.rootDir)/bin/arm-none-eabi-gcc -c -MD -MF $@.dep -x c  -Wunused -Wunknown-pragmas -ffunction-sections -fdata-sections  -mcpu=cortex-m3 -mthumb -mabi=aapcs -g -Dfar= -D__DYNAMIC_REENT__  -g -Dgcc  -Dxdc_target_name__=M3 -Dxdc_target_types__=gnu/targets/arm/std.h -Dxdc_bld__profile_release -Dxdc_bld__vers_1_0_4_8_4  -O2   -DTIRTOS -I/db/vtree/library/trees/zumaprod/zumaprod-o06/exports/tirtos_cc13xx_cc26xx_2_21_00_06/products/bios_6_46_01_37/packages/gnu/targets/arm//libs/install-native/arm-none-eabi/include   $(XDCINCS)  -o $@ $<
	-@$(FIXDEP) $@.dep $@.dep
	
package/lib/lib/tirtosport/./tirtos/MutexP_tirtos.om3g: export LD_LIBRARY_PATH=

package/lib/lib/tirtosport/./tirtos/MutexP_tirtos.sm3g: | .interfaces
package/lib/lib/tirtosport/./tirtos/MutexP_tirtos.sm3g: ./tirtos/MutexP_tirtos.c lib/tirtosport.am3g.mak
	@$(RM) $@.dep
	$(RM) $@
	@$(MSG) clm3g -S $< ...
	$(gnu.targets.arm.M3.rootDir)/bin/arm-none-eabi-gcc -c -MD -MF $@.dep -x c -S -Wunused -Wunknown-pragmas -ffunction-sections -fdata-sections  -mcpu=cortex-m3 -mthumb -mabi=aapcs -g -Dfar= -D__DYNAMIC_REENT__  -g -Dgcc  -Dxdc_target_name__=M3 -Dxdc_target_types__=gnu/targets/arm/std.h -Dxdc_bld__profile_release -Dxdc_bld__vers_1_0_4_8_4  -O2   -DTIRTOS  $(XDCINCS)  -o $@ $<
	-@$(FIXDEP) $@.dep $@.dep
	
package/lib/lib/tirtosport/./tirtos/MutexP_tirtos.sm3g: export LD_LIBRARY_PATH=

ifeq (,$(MK_NOGENDEPS))
-include package/lib/lib/tirtosport/./tirtos/SemaphoreP_tirtos.om3g.dep
package/lib/lib/tirtosport/./tirtos/SemaphoreP_tirtos.om3g.dep: ;
endif

package/lib/lib/tirtosport/./tirtos/SemaphoreP_tirtos.om3g: | .interfaces
package/lib/lib/tirtosport/./tirtos/SemaphoreP_tirtos.om3g: ./tirtos/SemaphoreP_tirtos.c lib/tirtosport.am3g.mak
	@$(RM) $@.dep
	$(RM) $@
	@$(MSG) clm3g $< ...
	$(gnu.targets.arm.M3.rootDir)/bin/arm-none-eabi-gcc -c -MD -MF $@.dep -x c  -Wunused -Wunknown-pragmas -ffunction-sections -fdata-sections  -mcpu=cortex-m3 -mthumb -mabi=aapcs -g -Dfar= -D__DYNAMIC_REENT__  -g -Dgcc  -Dxdc_target_name__=M3 -Dxdc_target_types__=gnu/targets/arm/std.h -Dxdc_bld__profile_release -Dxdc_bld__vers_1_0_4_8_4  -O2   -DTIRTOS -I/db/vtree/library/trees/zumaprod/zumaprod-o06/exports/tirtos_cc13xx_cc26xx_2_21_00_06/products/bios_6_46_01_37/packages/gnu/targets/arm//libs/install-native/arm-none-eabi/include   $(XDCINCS)  -o $@ $<
	-@$(FIXDEP) $@.dep $@.dep
	
package/lib/lib/tirtosport/./tirtos/SemaphoreP_tirtos.om3g: export LD_LIBRARY_PATH=

package/lib/lib/tirtosport/./tirtos/SemaphoreP_tirtos.sm3g: | .interfaces
package/lib/lib/tirtosport/./tirtos/SemaphoreP_tirtos.sm3g: ./tirtos/SemaphoreP_tirtos.c lib/tirtosport.am3g.mak
	@$(RM) $@.dep
	$(RM) $@
	@$(MSG) clm3g -S $< ...
	$(gnu.targets.arm.M3.rootDir)/bin/arm-none-eabi-gcc -c -MD -MF $@.dep -x c -S -Wunused -Wunknown-pragmas -ffunction-sections -fdata-sections  -mcpu=cortex-m3 -mthumb -mabi=aapcs -g -Dfar= -D__DYNAMIC_REENT__  -g -Dgcc  -Dxdc_target_name__=M3 -Dxdc_target_types__=gnu/targets/arm/std.h -Dxdc_bld__profile_release -Dxdc_bld__vers_1_0_4_8_4  -O2   -DTIRTOS  $(XDCINCS)  -o $@ $<
	-@$(FIXDEP) $@.dep $@.dep
	
package/lib/lib/tirtosport/./tirtos/SemaphoreP_tirtos.sm3g: export LD_LIBRARY_PATH=

clean,m3g ::
	-$(RM) package/lib/lib/tirtosport/package/package_ti.drivers.ports.om3g
	-$(RM) package/lib/lib/tirtosport/./tirtos/ClockP_tirtos.om3g
	-$(RM) package/lib/lib/tirtosport/./tirtos/DebugP_tirtos.om3g
	-$(RM) package/lib/lib/tirtosport/./tirtos/HwiP_tirtos.om3g
	-$(RM) package/lib/lib/tirtosport/./tirtos/MutexP_tirtos.om3g
	-$(RM) package/lib/lib/tirtosport/./tirtos/SemaphoreP_tirtos.om3g
	-$(RM) package/lib/lib/tirtosport/package/package_ti.drivers.ports.sm3g
	-$(RM) package/lib/lib/tirtosport/./tirtos/ClockP_tirtos.sm3g
	-$(RM) package/lib/lib/tirtosport/./tirtos/DebugP_tirtos.sm3g
	-$(RM) package/lib/lib/tirtosport/./tirtos/HwiP_tirtos.sm3g
	-$(RM) package/lib/lib/tirtosport/./tirtos/MutexP_tirtos.sm3g
	-$(RM) package/lib/lib/tirtosport/./tirtos/SemaphoreP_tirtos.sm3g

lib/tirtosport.am3g: package/lib/lib/tirtosport/package/package_ti.drivers.ports.om3g package/lib/lib/tirtosport/./tirtos/ClockP_tirtos.om3g package/lib/lib/tirtosport/./tirtos/DebugP_tirtos.om3g package/lib/lib/tirtosport/./tirtos/HwiP_tirtos.om3g package/lib/lib/tirtosport/./tirtos/MutexP_tirtos.om3g package/lib/lib/tirtosport/./tirtos/SemaphoreP_tirtos.om3g lib/tirtosport.am3g.mak

clean::
	-$(RM) lib/tirtosport.am3g.mak
