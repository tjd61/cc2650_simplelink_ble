#
#  Do not edit this file.  This file is generated from 
#  package.bld.  Any modifications to this file will be 
#  overwritten whenever makefiles are re-generated.
#
#  target compatibility key = iar.targets.arm.M3{1,0,7.50,1
#
ifeq (,$(MK_NOGENDEPS))
-include package/lib/lib/power_cc26xx_tirtos_instrumented/package/package_ti.drivers.orm3.dep
package/lib/lib/power_cc26xx_tirtos_instrumented/package/package_ti.drivers.orm3.dep: ;
endif

package/lib/lib/power_cc26xx_tirtos_instrumented/package/package_ti.drivers.orm3: | .interfaces
package/lib/lib/power_cc26xx_tirtos_instrumented/package/package_ti.drivers.orm3: package/package_ti.drivers.c lib/power_cc26xx_tirtos_instrumented.arm3.mak
	@$(RM) $@.dep
	$(RM) $@
	@$(MSG) clrm3 $< ...
	LC_ALL=C $(iar.targets.arm.M3.rootDir)/bin/iccarm  --silent --aeabi --cpu=Cortex-M3 --diag_suppress=Pa050,Go005 --endian=little -e --thumb  -Dewarm  -Dxdc_target_name__=M3 -Dxdc_target_types__=iar/targets/arm/std.h -Dxdc_bld__profile_release -Dxdc_bld__vers_1_0_7_50_1 -Ohz --dlib_config $(iar.targets.arm.M3.rootDir)/inc/c/DLib_Config_Normal.h  -I/db/vtree/library/trees/zumaprod/zumaprod-o06/exports/tirtos_cc13xx_cc26xx_2_21_00_06/products/cc26xxware_2_24_03_17272 -Dxdc_runtime_Assert_DISABLE_CONDITIONAL_ASSERT -DDebugP_ASSERT_ENABLED -DDebugP_LOG_ENABLED  $(XDCINCS)  -o $@  $<
	
	-@$(FIXDEP) $@.dep $@.dep
	

package/lib/lib/power_cc26xx_tirtos_instrumented/package/package_ti.drivers.srm3: | .interfaces
package/lib/lib/power_cc26xx_tirtos_instrumented/package/package_ti.drivers.srm3: package/package_ti.drivers.c lib/power_cc26xx_tirtos_instrumented.arm3.mak
	@$(RM) $@.dep
	$(RM) $@
	@$(MSG) clrm3 $< ...
	LC_ALL=C $(iar.targets.arm.M3.rootDir)/bin/iccarm  --silent --aeabi --cpu=Cortex-M3 --diag_suppress=Pa050,Go005 --endian=little -e --thumb  -Dewarm  -Dxdc_target_name__=M3 -Dxdc_target_types__=iar/targets/arm/std.h -Dxdc_bld__profile_release -Dxdc_bld__vers_1_0_7_50_1 -Ohz --dlib_config $(iar.targets.arm.M3.rootDir)/inc/c/DLib_Config_Normal.h  -I/db/vtree/library/trees/zumaprod/zumaprod-o06/exports/tirtos_cc13xx_cc26xx_2_21_00_06/products/cc26xxware_2_24_03_17272 -Dxdc_runtime_Assert_DISABLE_CONDITIONAL_ASSERT -DDebugP_ASSERT_ENABLED -DDebugP_LOG_ENABLED  $(XDCINCS)  -o $@  $<
	
	-@$(FIXDEP) $@.dep $@.dep
	

ifeq (,$(MK_NOGENDEPS))
-include package/lib/lib/power_cc26xx_tirtos_instrumented/./power/PowerCC26XX_tirtos.orm3.dep
package/lib/lib/power_cc26xx_tirtos_instrumented/./power/PowerCC26XX_tirtos.orm3.dep: ;
endif

package/lib/lib/power_cc26xx_tirtos_instrumented/./power/PowerCC26XX_tirtos.orm3: | .interfaces
package/lib/lib/power_cc26xx_tirtos_instrumented/./power/PowerCC26XX_tirtos.orm3: ./power/PowerCC26XX_tirtos.c lib/power_cc26xx_tirtos_instrumented.arm3.mak
	@$(RM) $@.dep
	$(RM) $@
	@$(MSG) clrm3 $< ...
	LC_ALL=C $(iar.targets.arm.M3.rootDir)/bin/iccarm  --silent --aeabi --cpu=Cortex-M3 --diag_suppress=Pa050,Go005 --endian=little -e --thumb  -Dewarm  -Dxdc_target_name__=M3 -Dxdc_target_types__=iar/targets/arm/std.h -Dxdc_bld__profile_release -Dxdc_bld__vers_1_0_7_50_1 -Ohz --dlib_config $(iar.targets.arm.M3.rootDir)/inc/c/DLib_Config_Normal.h  -I/db/vtree/library/trees/zumaprod/zumaprod-o06/exports/tirtos_cc13xx_cc26xx_2_21_00_06/products/cc26xxware_2_24_03_17272 -Dxdc_runtime_Assert_DISABLE_CONDITIONAL_ASSERT -DDebugP_ASSERT_ENABLED -DDebugP_LOG_ENABLED  $(XDCINCS)  -o $@  $<
	
	-@$(FIXDEP) $@.dep $@.dep
	

package/lib/lib/power_cc26xx_tirtos_instrumented/./power/PowerCC26XX_tirtos.srm3: | .interfaces
package/lib/lib/power_cc26xx_tirtos_instrumented/./power/PowerCC26XX_tirtos.srm3: ./power/PowerCC26XX_tirtos.c lib/power_cc26xx_tirtos_instrumented.arm3.mak
	@$(RM) $@.dep
	$(RM) $@
	@$(MSG) clrm3 $< ...
	LC_ALL=C $(iar.targets.arm.M3.rootDir)/bin/iccarm  --silent --aeabi --cpu=Cortex-M3 --diag_suppress=Pa050,Go005 --endian=little -e --thumb  -Dewarm  -Dxdc_target_name__=M3 -Dxdc_target_types__=iar/targets/arm/std.h -Dxdc_bld__profile_release -Dxdc_bld__vers_1_0_7_50_1 -Ohz --dlib_config $(iar.targets.arm.M3.rootDir)/inc/c/DLib_Config_Normal.h  -I/db/vtree/library/trees/zumaprod/zumaprod-o06/exports/tirtos_cc13xx_cc26xx_2_21_00_06/products/cc26xxware_2_24_03_17272 -Dxdc_runtime_Assert_DISABLE_CONDITIONAL_ASSERT -DDebugP_ASSERT_ENABLED -DDebugP_LOG_ENABLED  $(XDCINCS)  -o $@  $<
	
	-@$(FIXDEP) $@.dep $@.dep
	

clean,rm3 ::
	-$(RM) package/lib/lib/power_cc26xx_tirtos_instrumented/package/package_ti.drivers.orm3
	-$(RM) package/lib/lib/power_cc26xx_tirtos_instrumented/./power/PowerCC26XX_tirtos.orm3
	-$(RM) package/lib/lib/power_cc26xx_tirtos_instrumented/package/package_ti.drivers.srm3
	-$(RM) package/lib/lib/power_cc26xx_tirtos_instrumented/./power/PowerCC26XX_tirtos.srm3

lib/power_cc26xx_tirtos_instrumented.arm3: package/lib/lib/power_cc26xx_tirtos_instrumented/package/package_ti.drivers.orm3 package/lib/lib/power_cc26xx_tirtos_instrumented/./power/PowerCC26XX_tirtos.orm3 lib/power_cc26xx_tirtos_instrumented.arm3.mak

clean::
	-$(RM) lib/power_cc26xx_tirtos_instrumented.arm3.mak