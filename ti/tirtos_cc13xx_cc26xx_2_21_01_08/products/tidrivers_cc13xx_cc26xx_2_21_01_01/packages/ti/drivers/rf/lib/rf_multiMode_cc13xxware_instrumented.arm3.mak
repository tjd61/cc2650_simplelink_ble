#
#  Do not edit this file.  This file is generated from 
#  package.bld.  Any modifications to this file will be 
#  overwritten whenever makefiles are re-generated.
#
#  target compatibility key = iar.targets.arm.M3{1,0,7.50,1
#
ifeq (,$(MK_NOGENDEPS))
-include package/lib/lib/rf_multiMode_cc13xxware_instrumented/package/package_ti.drivers.rf.orm3.dep
package/lib/lib/rf_multiMode_cc13xxware_instrumented/package/package_ti.drivers.rf.orm3.dep: ;
endif

package/lib/lib/rf_multiMode_cc13xxware_instrumented/package/package_ti.drivers.rf.orm3: | .interfaces
package/lib/lib/rf_multiMode_cc13xxware_instrumented/package/package_ti.drivers.rf.orm3: package/package_ti.drivers.rf.c lib/rf_multiMode_cc13xxware_instrumented.arm3.mak
	@$(RM) $@.dep
	$(RM) $@
	@$(MSG) clrm3 $< ...
	LC_ALL=C $(iar.targets.arm.M3.rootDir)/bin/iccarm  --silent --aeabi --cpu=Cortex-M3 --diag_suppress=Pa050,Go005 --endian=little -e --thumb  -Dewarm  -Dxdc_target_name__=M3 -Dxdc_target_types__=iar/targets/arm/std.h -Dxdc_bld__profile_release -Dxdc_bld__vers_1_0_7_50_1 -Ohz --dlib_config $(iar.targets.arm.M3.rootDir)/inc/c/DLib_Config_Normal.h  -Dxdc_runtime_Assert_DISABLE_CONDITIONAL_ASSERT -DDebugP_ASSERT_ENABLED -DDebugP_LOG_ENABLED -I../.. -I/db/vtree/library/trees/zumaprod/zumaprod-o08/exports/tirtos_cc13xx_cc26xx_2_21_01_08/products/cc13xxware_2_04_03_17272  $(XDCINCS)  -o $@  $<
	
	-@$(FIXDEP) $@.dep $@.dep
	

package/lib/lib/rf_multiMode_cc13xxware_instrumented/package/package_ti.drivers.rf.srm3: | .interfaces
package/lib/lib/rf_multiMode_cc13xxware_instrumented/package/package_ti.drivers.rf.srm3: package/package_ti.drivers.rf.c lib/rf_multiMode_cc13xxware_instrumented.arm3.mak
	@$(RM) $@.dep
	$(RM) $@
	@$(MSG) clrm3 $< ...
	LC_ALL=C $(iar.targets.arm.M3.rootDir)/bin/iccarm  --silent --aeabi --cpu=Cortex-M3 --diag_suppress=Pa050,Go005 --endian=little -e --thumb  -Dewarm  -Dxdc_target_name__=M3 -Dxdc_target_types__=iar/targets/arm/std.h -Dxdc_bld__profile_release -Dxdc_bld__vers_1_0_7_50_1 -Ohz --dlib_config $(iar.targets.arm.M3.rootDir)/inc/c/DLib_Config_Normal.h  -Dxdc_runtime_Assert_DISABLE_CONDITIONAL_ASSERT -DDebugP_ASSERT_ENABLED -DDebugP_LOG_ENABLED -I../.. -I/db/vtree/library/trees/zumaprod/zumaprod-o08/exports/tirtos_cc13xx_cc26xx_2_21_01_08/products/cc13xxware_2_04_03_17272  $(XDCINCS)  -o $@  $<
	
	-@$(FIXDEP) $@.dep $@.dep
	

ifeq (,$(MK_NOGENDEPS))
-include package/lib/lib/rf_multiMode_cc13xxware_instrumented/./RFCC26XX_multiMode.orm3.dep
package/lib/lib/rf_multiMode_cc13xxware_instrumented/./RFCC26XX_multiMode.orm3.dep: ;
endif

package/lib/lib/rf_multiMode_cc13xxware_instrumented/./RFCC26XX_multiMode.orm3: | .interfaces
package/lib/lib/rf_multiMode_cc13xxware_instrumented/./RFCC26XX_multiMode.orm3: ./RFCC26XX_multiMode.c lib/rf_multiMode_cc13xxware_instrumented.arm3.mak
	@$(RM) $@.dep
	$(RM) $@
	@$(MSG) clrm3 $< ...
	LC_ALL=C $(iar.targets.arm.M3.rootDir)/bin/iccarm  --silent --aeabi --cpu=Cortex-M3 --diag_suppress=Pa050,Go005 --endian=little -e --thumb  -Dewarm  -Dxdc_target_name__=M3 -Dxdc_target_types__=iar/targets/arm/std.h -Dxdc_bld__profile_release -Dxdc_bld__vers_1_0_7_50_1 -Ohz --dlib_config $(iar.targets.arm.M3.rootDir)/inc/c/DLib_Config_Normal.h  -Dxdc_runtime_Assert_DISABLE_CONDITIONAL_ASSERT -DDebugP_ASSERT_ENABLED -DDebugP_LOG_ENABLED -I../.. -I/db/vtree/library/trees/zumaprod/zumaprod-o08/exports/tirtos_cc13xx_cc26xx_2_21_01_08/products/cc13xxware_2_04_03_17272  $(XDCINCS)  -o $@  $<
	
	-@$(FIXDEP) $@.dep $@.dep
	

package/lib/lib/rf_multiMode_cc13xxware_instrumented/./RFCC26XX_multiMode.srm3: | .interfaces
package/lib/lib/rf_multiMode_cc13xxware_instrumented/./RFCC26XX_multiMode.srm3: ./RFCC26XX_multiMode.c lib/rf_multiMode_cc13xxware_instrumented.arm3.mak
	@$(RM) $@.dep
	$(RM) $@
	@$(MSG) clrm3 $< ...
	LC_ALL=C $(iar.targets.arm.M3.rootDir)/bin/iccarm  --silent --aeabi --cpu=Cortex-M3 --diag_suppress=Pa050,Go005 --endian=little -e --thumb  -Dewarm  -Dxdc_target_name__=M3 -Dxdc_target_types__=iar/targets/arm/std.h -Dxdc_bld__profile_release -Dxdc_bld__vers_1_0_7_50_1 -Ohz --dlib_config $(iar.targets.arm.M3.rootDir)/inc/c/DLib_Config_Normal.h  -Dxdc_runtime_Assert_DISABLE_CONDITIONAL_ASSERT -DDebugP_ASSERT_ENABLED -DDebugP_LOG_ENABLED -I../.. -I/db/vtree/library/trees/zumaprod/zumaprod-o08/exports/tirtos_cc13xx_cc26xx_2_21_01_08/products/cc13xxware_2_04_03_17272  $(XDCINCS)  -o $@  $<
	
	-@$(FIXDEP) $@.dep $@.dep
	

clean,rm3 ::
	-$(RM) package/lib/lib/rf_multiMode_cc13xxware_instrumented/package/package_ti.drivers.rf.orm3
	-$(RM) package/lib/lib/rf_multiMode_cc13xxware_instrumented/./RFCC26XX_multiMode.orm3
	-$(RM) package/lib/lib/rf_multiMode_cc13xxware_instrumented/package/package_ti.drivers.rf.srm3
	-$(RM) package/lib/lib/rf_multiMode_cc13xxware_instrumented/./RFCC26XX_multiMode.srm3

lib/rf_multiMode_cc13xxware_instrumented.arm3: package/lib/lib/rf_multiMode_cc13xxware_instrumented/package/package_ti.drivers.rf.orm3 package/lib/lib/rf_multiMode_cc13xxware_instrumented/./RFCC26XX_multiMode.orm3 lib/rf_multiMode_cc13xxware_instrumented.arm3.mak

clean::
	-$(RM) lib/rf_multiMode_cc13xxware_instrumented.arm3.mak
