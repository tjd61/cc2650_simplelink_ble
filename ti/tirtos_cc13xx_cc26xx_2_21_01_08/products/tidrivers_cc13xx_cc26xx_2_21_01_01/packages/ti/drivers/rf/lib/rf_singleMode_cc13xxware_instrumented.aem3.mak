#
#  Do not edit this file.  This file is generated from 
#  package.bld.  Any modifications to this file will be 
#  overwritten whenever makefiles are re-generated.
#
#  target compatibility key = ti.targets.arm.elf.M3{1,0,5.2,5
#
ifeq (,$(MK_NOGENDEPS))
-include package/lib/lib/rf_singleMode_cc13xxware_instrumented/package/package_ti.drivers.rf.oem3.dep
package/lib/lib/rf_singleMode_cc13xxware_instrumented/package/package_ti.drivers.rf.oem3.dep: ;
endif

package/lib/lib/rf_singleMode_cc13xxware_instrumented/package/package_ti.drivers.rf.oem3: | .interfaces
package/lib/lib/rf_singleMode_cc13xxware_instrumented/package/package_ti.drivers.rf.oem3: package/package_ti.drivers.rf.c lib/rf_singleMode_cc13xxware_instrumented.aem3.mak
	@$(RM) $@.dep
	$(RM) $@
	@$(MSG) clem3 $< ...
	$(ti.targets.arm.elf.M3.rootDir)/bin/armcl -c  -qq -pdsw225 --endian=little -mv7M3 --abi=eabi -eo.oem3 -ea.sem3  -ms --gcc -g -Dccs  -Dxdc_target_name__=M3 -Dxdc_target_types__=ti/targets/arm/elf/std.h -Dxdc_bld__profile_release -Dxdc_bld__vers_1_0_5_2_5 -O2  -Dxdc_runtime_Assert_DISABLE_CONDITIONAL_ASSERT -DDebugP_ASSERT_ENABLED -DDebugP_LOG_ENABLED -I../.. -I/db/vtree/library/trees/zumaprod/zumaprod-o08/exports/tirtos_cc13xx_cc26xx_2_21_01_08/products/cc13xxware_2_04_03_17272  $(XDCINCS) -I$(ti.targets.arm.elf.M3.rootDir)/include  -fs=./package/lib/lib/rf_singleMode_cc13xxware_instrumented/package -fr=./package/lib/lib/rf_singleMode_cc13xxware_instrumented/package -fc $<
	$(MKDEP) -a $@.dep -p package/lib/lib/rf_singleMode_cc13xxware_instrumented/package -s oem3 $< -C   -qq -pdsw225 --endian=little -mv7M3 --abi=eabi -eo.oem3 -ea.sem3  -ms --gcc -g -Dccs  -Dxdc_target_name__=M3 -Dxdc_target_types__=ti/targets/arm/elf/std.h -Dxdc_bld__profile_release -Dxdc_bld__vers_1_0_5_2_5 -O2  -Dxdc_runtime_Assert_DISABLE_CONDITIONAL_ASSERT -DDebugP_ASSERT_ENABLED -DDebugP_LOG_ENABLED -I../.. -I/db/vtree/library/trees/zumaprod/zumaprod-o08/exports/tirtos_cc13xx_cc26xx_2_21_01_08/products/cc13xxware_2_04_03_17272  $(XDCINCS) -I$(ti.targets.arm.elf.M3.rootDir)/include  -fs=./package/lib/lib/rf_singleMode_cc13xxware_instrumented/package -fr=./package/lib/lib/rf_singleMode_cc13xxware_instrumented/package
	-@$(FIXDEP) $@.dep $@.dep
	
package/lib/lib/rf_singleMode_cc13xxware_instrumented/package/package_ti.drivers.rf.oem3: export C_DIR=
package/lib/lib/rf_singleMode_cc13xxware_instrumented/package/package_ti.drivers.rf.oem3: PATH:=$(ti.targets.arm.elf.M3.rootDir)/bin/:$(PATH)

package/lib/lib/rf_singleMode_cc13xxware_instrumented/package/package_ti.drivers.rf.sem3: | .interfaces
package/lib/lib/rf_singleMode_cc13xxware_instrumented/package/package_ti.drivers.rf.sem3: package/package_ti.drivers.rf.c lib/rf_singleMode_cc13xxware_instrumented.aem3.mak
	@$(RM) $@.dep
	$(RM) $@
	@$(MSG) clem3 -n $< ...
	$(ti.targets.arm.elf.M3.rootDir)/bin/armcl -c -n -s --symdebug:none -qq -pdsw225 --endian=little -mv7M3 --abi=eabi -eo.oem3 -ea.sem3  -ms --gcc -g -Dccs  -Dxdc_target_name__=M3 -Dxdc_target_types__=ti/targets/arm/elf/std.h -Dxdc_bld__profile_release -Dxdc_bld__vers_1_0_5_2_5 -O2  -Dxdc_runtime_Assert_DISABLE_CONDITIONAL_ASSERT -DDebugP_ASSERT_ENABLED -DDebugP_LOG_ENABLED -I../.. -I/db/vtree/library/trees/zumaprod/zumaprod-o08/exports/tirtos_cc13xx_cc26xx_2_21_01_08/products/cc13xxware_2_04_03_17272  $(XDCINCS) -I$(ti.targets.arm.elf.M3.rootDir)/include  -fs=./package/lib/lib/rf_singleMode_cc13xxware_instrumented/package -fr=./package/lib/lib/rf_singleMode_cc13xxware_instrumented/package -fc $<
	$(MKDEP) -a $@.dep -p package/lib/lib/rf_singleMode_cc13xxware_instrumented/package -s oem3 $< -C  -n -s --symdebug:none -qq -pdsw225 --endian=little -mv7M3 --abi=eabi -eo.oem3 -ea.sem3  -ms --gcc -g -Dccs  -Dxdc_target_name__=M3 -Dxdc_target_types__=ti/targets/arm/elf/std.h -Dxdc_bld__profile_release -Dxdc_bld__vers_1_0_5_2_5 -O2  -Dxdc_runtime_Assert_DISABLE_CONDITIONAL_ASSERT -DDebugP_ASSERT_ENABLED -DDebugP_LOG_ENABLED -I../.. -I/db/vtree/library/trees/zumaprod/zumaprod-o08/exports/tirtos_cc13xx_cc26xx_2_21_01_08/products/cc13xxware_2_04_03_17272  $(XDCINCS) -I$(ti.targets.arm.elf.M3.rootDir)/include  -fs=./package/lib/lib/rf_singleMode_cc13xxware_instrumented/package -fr=./package/lib/lib/rf_singleMode_cc13xxware_instrumented/package
	-@$(FIXDEP) $@.dep $@.dep
	
package/lib/lib/rf_singleMode_cc13xxware_instrumented/package/package_ti.drivers.rf.sem3: export C_DIR=
package/lib/lib/rf_singleMode_cc13xxware_instrumented/package/package_ti.drivers.rf.sem3: PATH:=$(ti.targets.arm.elf.M3.rootDir)/bin/:$(PATH)

ifeq (,$(MK_NOGENDEPS))
-include package/lib/lib/rf_singleMode_cc13xxware_instrumented/./RFCC26XX_singleMode.oem3.dep
package/lib/lib/rf_singleMode_cc13xxware_instrumented/./RFCC26XX_singleMode.oem3.dep: ;
endif

package/lib/lib/rf_singleMode_cc13xxware_instrumented/./RFCC26XX_singleMode.oem3: | .interfaces
package/lib/lib/rf_singleMode_cc13xxware_instrumented/./RFCC26XX_singleMode.oem3: ./RFCC26XX_singleMode.c lib/rf_singleMode_cc13xxware_instrumented.aem3.mak
	@$(RM) $@.dep
	$(RM) $@
	@$(MSG) clem3 $< ...
	$(ti.targets.arm.elf.M3.rootDir)/bin/armcl -c  -qq -pdsw225 --endian=little -mv7M3 --abi=eabi -eo.oem3 -ea.sem3  -ms --gcc -g -Dccs  -Dxdc_target_name__=M3 -Dxdc_target_types__=ti/targets/arm/elf/std.h -Dxdc_bld__profile_release -Dxdc_bld__vers_1_0_5_2_5 -O2  -Dxdc_runtime_Assert_DISABLE_CONDITIONAL_ASSERT -DDebugP_ASSERT_ENABLED -DDebugP_LOG_ENABLED -I../.. -I/db/vtree/library/trees/zumaprod/zumaprod-o08/exports/tirtos_cc13xx_cc26xx_2_21_01_08/products/cc13xxware_2_04_03_17272  $(XDCINCS) -I$(ti.targets.arm.elf.M3.rootDir)/include  -fs=./package/lib/lib/rf_singleMode_cc13xxware_instrumented/. -fr=./package/lib/lib/rf_singleMode_cc13xxware_instrumented/. -fc $<
	$(MKDEP) -a $@.dep -p package/lib/lib/rf_singleMode_cc13xxware_instrumented/. -s oem3 $< -C   -qq -pdsw225 --endian=little -mv7M3 --abi=eabi -eo.oem3 -ea.sem3  -ms --gcc -g -Dccs  -Dxdc_target_name__=M3 -Dxdc_target_types__=ti/targets/arm/elf/std.h -Dxdc_bld__profile_release -Dxdc_bld__vers_1_0_5_2_5 -O2  -Dxdc_runtime_Assert_DISABLE_CONDITIONAL_ASSERT -DDebugP_ASSERT_ENABLED -DDebugP_LOG_ENABLED -I../.. -I/db/vtree/library/trees/zumaprod/zumaprod-o08/exports/tirtos_cc13xx_cc26xx_2_21_01_08/products/cc13xxware_2_04_03_17272  $(XDCINCS) -I$(ti.targets.arm.elf.M3.rootDir)/include  -fs=./package/lib/lib/rf_singleMode_cc13xxware_instrumented/. -fr=./package/lib/lib/rf_singleMode_cc13xxware_instrumented/.
	-@$(FIXDEP) $@.dep $@.dep
	
package/lib/lib/rf_singleMode_cc13xxware_instrumented/./RFCC26XX_singleMode.oem3: export C_DIR=
package/lib/lib/rf_singleMode_cc13xxware_instrumented/./RFCC26XX_singleMode.oem3: PATH:=$(ti.targets.arm.elf.M3.rootDir)/bin/:$(PATH)

package/lib/lib/rf_singleMode_cc13xxware_instrumented/./RFCC26XX_singleMode.sem3: | .interfaces
package/lib/lib/rf_singleMode_cc13xxware_instrumented/./RFCC26XX_singleMode.sem3: ./RFCC26XX_singleMode.c lib/rf_singleMode_cc13xxware_instrumented.aem3.mak
	@$(RM) $@.dep
	$(RM) $@
	@$(MSG) clem3 -n $< ...
	$(ti.targets.arm.elf.M3.rootDir)/bin/armcl -c -n -s --symdebug:none -qq -pdsw225 --endian=little -mv7M3 --abi=eabi -eo.oem3 -ea.sem3  -ms --gcc -g -Dccs  -Dxdc_target_name__=M3 -Dxdc_target_types__=ti/targets/arm/elf/std.h -Dxdc_bld__profile_release -Dxdc_bld__vers_1_0_5_2_5 -O2  -Dxdc_runtime_Assert_DISABLE_CONDITIONAL_ASSERT -DDebugP_ASSERT_ENABLED -DDebugP_LOG_ENABLED -I../.. -I/db/vtree/library/trees/zumaprod/zumaprod-o08/exports/tirtos_cc13xx_cc26xx_2_21_01_08/products/cc13xxware_2_04_03_17272  $(XDCINCS) -I$(ti.targets.arm.elf.M3.rootDir)/include  -fs=./package/lib/lib/rf_singleMode_cc13xxware_instrumented/. -fr=./package/lib/lib/rf_singleMode_cc13xxware_instrumented/. -fc $<
	$(MKDEP) -a $@.dep -p package/lib/lib/rf_singleMode_cc13xxware_instrumented/. -s oem3 $< -C  -n -s --symdebug:none -qq -pdsw225 --endian=little -mv7M3 --abi=eabi -eo.oem3 -ea.sem3  -ms --gcc -g -Dccs  -Dxdc_target_name__=M3 -Dxdc_target_types__=ti/targets/arm/elf/std.h -Dxdc_bld__profile_release -Dxdc_bld__vers_1_0_5_2_5 -O2  -Dxdc_runtime_Assert_DISABLE_CONDITIONAL_ASSERT -DDebugP_ASSERT_ENABLED -DDebugP_LOG_ENABLED -I../.. -I/db/vtree/library/trees/zumaprod/zumaprod-o08/exports/tirtos_cc13xx_cc26xx_2_21_01_08/products/cc13xxware_2_04_03_17272  $(XDCINCS) -I$(ti.targets.arm.elf.M3.rootDir)/include  -fs=./package/lib/lib/rf_singleMode_cc13xxware_instrumented/. -fr=./package/lib/lib/rf_singleMode_cc13xxware_instrumented/.
	-@$(FIXDEP) $@.dep $@.dep
	
package/lib/lib/rf_singleMode_cc13xxware_instrumented/./RFCC26XX_singleMode.sem3: export C_DIR=
package/lib/lib/rf_singleMode_cc13xxware_instrumented/./RFCC26XX_singleMode.sem3: PATH:=$(ti.targets.arm.elf.M3.rootDir)/bin/:$(PATH)

clean,em3 ::
	-$(RM) package/lib/lib/rf_singleMode_cc13xxware_instrumented/package/package_ti.drivers.rf.oem3
	-$(RM) package/lib/lib/rf_singleMode_cc13xxware_instrumented/./RFCC26XX_singleMode.oem3
	-$(RM) package/lib/lib/rf_singleMode_cc13xxware_instrumented/package/package_ti.drivers.rf.sem3
	-$(RM) package/lib/lib/rf_singleMode_cc13xxware_instrumented/./RFCC26XX_singleMode.sem3

lib/rf_singleMode_cc13xxware_instrumented.aem3: package/lib/lib/rf_singleMode_cc13xxware_instrumented/package/package_ti.drivers.rf.oem3 package/lib/lib/rf_singleMode_cc13xxware_instrumented/./RFCC26XX_singleMode.oem3 lib/rf_singleMode_cc13xxware_instrumented.aem3.mak

clean::
	-$(RM) lib/rf_singleMode_cc13xxware_instrumented.aem3.mak
