#
#  Do not edit this file.  This file is generated from 
#  package.bld.  Any modifications to this file will be 
#  overwritten whenever makefiles are re-generated.
#
#  target compatibility key = ti.targets.arm.elf.M3{1,0,5.2,5
#
ifeq (,$(MK_NOGENDEPS))
-include package/lib/lib/sysbios/debug/ti.sysbios.syncs/package/package_ti.sysbios.syncs.oem3.dep
package/lib/lib/sysbios/debug/ti.sysbios.syncs/package/package_ti.sysbios.syncs.oem3.dep: ;
endif

package/lib/lib/sysbios/debug/ti.sysbios.syncs/package/package_ti.sysbios.syncs.oem3: | .interfaces
package/lib/lib/sysbios/debug/ti.sysbios.syncs/package/package_ti.sysbios.syncs.oem3: package/package_ti.sysbios.syncs.c lib/sysbios/debug/ti.sysbios.syncs.aem3.mak
	@$(RM) $@.dep
	$(RM) $@
	@$(MSG) clem3 $< ...
	$(ti.targets.arm.elf.M3.rootDir)/bin/armcl -c  -qq -pdsw225 --endian=little -mv7M3 --abi=eabi -eo.oem3 -ea.sem3  -ms -g  -D_DEBUG_=1 -Dxdc_target_name__=M3 -Dxdc_target_types__=ti/targets/arm/elf/std.h -Dxdc_bld__profile_debug -Dxdc_bld__vers_1_0_5_2_5 --symdebug:dwarf  -Dti_sysbios_Build_useHwiMacros -Dti_sysbios_BIOS_smpEnabled__D=FALSE  $(XDCINCS) -I$(ti.targets.arm.elf.M3.rootDir)/include  -fs=./package/lib/lib/sysbios/debug/ti.sysbios.syncs/package -fr=./package/lib/lib/sysbios/debug/ti.sysbios.syncs/package -fc $<
	$(MKDEP) -a $@.dep -p package/lib/lib/sysbios/debug/ti.sysbios.syncs/package -s oem3 $< -C   -qq -pdsw225 --endian=little -mv7M3 --abi=eabi -eo.oem3 -ea.sem3  -ms -g  -D_DEBUG_=1 -Dxdc_target_name__=M3 -Dxdc_target_types__=ti/targets/arm/elf/std.h -Dxdc_bld__profile_debug -Dxdc_bld__vers_1_0_5_2_5 --symdebug:dwarf  -Dti_sysbios_Build_useHwiMacros -Dti_sysbios_BIOS_smpEnabled__D=FALSE  $(XDCINCS) -I$(ti.targets.arm.elf.M3.rootDir)/include  -fs=./package/lib/lib/sysbios/debug/ti.sysbios.syncs/package -fr=./package/lib/lib/sysbios/debug/ti.sysbios.syncs/package
	-@$(FIXDEP) $@.dep $@.dep
	
package/lib/lib/sysbios/debug/ti.sysbios.syncs/package/package_ti.sysbios.syncs.oem3: export C_DIR=
package/lib/lib/sysbios/debug/ti.sysbios.syncs/package/package_ti.sysbios.syncs.oem3: PATH:=$(ti.targets.arm.elf.M3.rootDir)/bin/:$(PATH)

package/lib/lib/sysbios/debug/ti.sysbios.syncs/package/package_ti.sysbios.syncs.sem3: | .interfaces
package/lib/lib/sysbios/debug/ti.sysbios.syncs/package/package_ti.sysbios.syncs.sem3: package/package_ti.sysbios.syncs.c lib/sysbios/debug/ti.sysbios.syncs.aem3.mak
	@$(RM) $@.dep
	$(RM) $@
	@$(MSG) clem3 -n $< ...
	$(ti.targets.arm.elf.M3.rootDir)/bin/armcl -c -n -s --symdebug:none -qq -pdsw225 --endian=little -mv7M3 --abi=eabi -eo.oem3 -ea.sem3  -ms -g  -D_DEBUG_=1 -Dxdc_target_name__=M3 -Dxdc_target_types__=ti/targets/arm/elf/std.h -Dxdc_bld__profile_debug -Dxdc_bld__vers_1_0_5_2_5 --symdebug:dwarf  -Dti_sysbios_Build_useHwiMacros -Dti_sysbios_BIOS_smpEnabled__D=FALSE  $(XDCINCS) -I$(ti.targets.arm.elf.M3.rootDir)/include  -fs=./package/lib/lib/sysbios/debug/ti.sysbios.syncs/package -fr=./package/lib/lib/sysbios/debug/ti.sysbios.syncs/package -fc $<
	$(MKDEP) -a $@.dep -p package/lib/lib/sysbios/debug/ti.sysbios.syncs/package -s oem3 $< -C  -n -s --symdebug:none -qq -pdsw225 --endian=little -mv7M3 --abi=eabi -eo.oem3 -ea.sem3  -ms -g  -D_DEBUG_=1 -Dxdc_target_name__=M3 -Dxdc_target_types__=ti/targets/arm/elf/std.h -Dxdc_bld__profile_debug -Dxdc_bld__vers_1_0_5_2_5 --symdebug:dwarf  -Dti_sysbios_Build_useHwiMacros -Dti_sysbios_BIOS_smpEnabled__D=FALSE  $(XDCINCS) -I$(ti.targets.arm.elf.M3.rootDir)/include  -fs=./package/lib/lib/sysbios/debug/ti.sysbios.syncs/package -fr=./package/lib/lib/sysbios/debug/ti.sysbios.syncs/package
	-@$(FIXDEP) $@.dep $@.dep
	
package/lib/lib/sysbios/debug/ti.sysbios.syncs/package/package_ti.sysbios.syncs.sem3: export C_DIR=
package/lib/lib/sysbios/debug/ti.sysbios.syncs/package/package_ti.sysbios.syncs.sem3: PATH:=$(ti.targets.arm.elf.M3.rootDir)/bin/:$(PATH)

ifeq (,$(MK_NOGENDEPS))
-include package/lib/lib/sysbios/debug/ti.sysbios.syncs/SyncSem.oem3.dep
package/lib/lib/sysbios/debug/ti.sysbios.syncs/SyncSem.oem3.dep: ;
endif

package/lib/lib/sysbios/debug/ti.sysbios.syncs/SyncSem.oem3: | .interfaces
package/lib/lib/sysbios/debug/ti.sysbios.syncs/SyncSem.oem3: SyncSem.c lib/sysbios/debug/ti.sysbios.syncs.aem3.mak
	@$(RM) $@.dep
	$(RM) $@
	@$(MSG) clem3 $< ...
	$(ti.targets.arm.elf.M3.rootDir)/bin/armcl -c  -qq -pdsw225 --endian=little -mv7M3 --abi=eabi -eo.oem3 -ea.sem3  -ms -g  -D_DEBUG_=1 -Dxdc_target_name__=M3 -Dxdc_target_types__=ti/targets/arm/elf/std.h -Dxdc_bld__profile_debug -Dxdc_bld__vers_1_0_5_2_5 --symdebug:dwarf  -Dti_sysbios_Build_useHwiMacros -Dti_sysbios_BIOS_smpEnabled__D=FALSE  $(XDCINCS) -I$(ti.targets.arm.elf.M3.rootDir)/include  -fs=./package/lib/lib/sysbios/debug/ti.sysbios.syncs -fr=./package/lib/lib/sysbios/debug/ti.sysbios.syncs -fc $<
	$(MKDEP) -a $@.dep -p package/lib/lib/sysbios/debug/ti.sysbios.syncs -s oem3 $< -C   -qq -pdsw225 --endian=little -mv7M3 --abi=eabi -eo.oem3 -ea.sem3  -ms -g  -D_DEBUG_=1 -Dxdc_target_name__=M3 -Dxdc_target_types__=ti/targets/arm/elf/std.h -Dxdc_bld__profile_debug -Dxdc_bld__vers_1_0_5_2_5 --symdebug:dwarf  -Dti_sysbios_Build_useHwiMacros -Dti_sysbios_BIOS_smpEnabled__D=FALSE  $(XDCINCS) -I$(ti.targets.arm.elf.M3.rootDir)/include  -fs=./package/lib/lib/sysbios/debug/ti.sysbios.syncs -fr=./package/lib/lib/sysbios/debug/ti.sysbios.syncs
	-@$(FIXDEP) $@.dep $@.dep
	
package/lib/lib/sysbios/debug/ti.sysbios.syncs/SyncSem.oem3: export C_DIR=
package/lib/lib/sysbios/debug/ti.sysbios.syncs/SyncSem.oem3: PATH:=$(ti.targets.arm.elf.M3.rootDir)/bin/:$(PATH)

package/lib/lib/sysbios/debug/ti.sysbios.syncs/SyncSem.sem3: | .interfaces
package/lib/lib/sysbios/debug/ti.sysbios.syncs/SyncSem.sem3: SyncSem.c lib/sysbios/debug/ti.sysbios.syncs.aem3.mak
	@$(RM) $@.dep
	$(RM) $@
	@$(MSG) clem3 -n $< ...
	$(ti.targets.arm.elf.M3.rootDir)/bin/armcl -c -n -s --symdebug:none -qq -pdsw225 --endian=little -mv7M3 --abi=eabi -eo.oem3 -ea.sem3  -ms -g  -D_DEBUG_=1 -Dxdc_target_name__=M3 -Dxdc_target_types__=ti/targets/arm/elf/std.h -Dxdc_bld__profile_debug -Dxdc_bld__vers_1_0_5_2_5 --symdebug:dwarf  -Dti_sysbios_Build_useHwiMacros -Dti_sysbios_BIOS_smpEnabled__D=FALSE  $(XDCINCS) -I$(ti.targets.arm.elf.M3.rootDir)/include  -fs=./package/lib/lib/sysbios/debug/ti.sysbios.syncs -fr=./package/lib/lib/sysbios/debug/ti.sysbios.syncs -fc $<
	$(MKDEP) -a $@.dep -p package/lib/lib/sysbios/debug/ti.sysbios.syncs -s oem3 $< -C  -n -s --symdebug:none -qq -pdsw225 --endian=little -mv7M3 --abi=eabi -eo.oem3 -ea.sem3  -ms -g  -D_DEBUG_=1 -Dxdc_target_name__=M3 -Dxdc_target_types__=ti/targets/arm/elf/std.h -Dxdc_bld__profile_debug -Dxdc_bld__vers_1_0_5_2_5 --symdebug:dwarf  -Dti_sysbios_Build_useHwiMacros -Dti_sysbios_BIOS_smpEnabled__D=FALSE  $(XDCINCS) -I$(ti.targets.arm.elf.M3.rootDir)/include  -fs=./package/lib/lib/sysbios/debug/ti.sysbios.syncs -fr=./package/lib/lib/sysbios/debug/ti.sysbios.syncs
	-@$(FIXDEP) $@.dep $@.dep
	
package/lib/lib/sysbios/debug/ti.sysbios.syncs/SyncSem.sem3: export C_DIR=
package/lib/lib/sysbios/debug/ti.sysbios.syncs/SyncSem.sem3: PATH:=$(ti.targets.arm.elf.M3.rootDir)/bin/:$(PATH)

ifeq (,$(MK_NOGENDEPS))
-include package/lib/lib/sysbios/debug/ti.sysbios.syncs/SyncSwi.oem3.dep
package/lib/lib/sysbios/debug/ti.sysbios.syncs/SyncSwi.oem3.dep: ;
endif

package/lib/lib/sysbios/debug/ti.sysbios.syncs/SyncSwi.oem3: | .interfaces
package/lib/lib/sysbios/debug/ti.sysbios.syncs/SyncSwi.oem3: SyncSwi.c lib/sysbios/debug/ti.sysbios.syncs.aem3.mak
	@$(RM) $@.dep
	$(RM) $@
	@$(MSG) clem3 $< ...
	$(ti.targets.arm.elf.M3.rootDir)/bin/armcl -c  -qq -pdsw225 --endian=little -mv7M3 --abi=eabi -eo.oem3 -ea.sem3  -ms -g  -D_DEBUG_=1 -Dxdc_target_name__=M3 -Dxdc_target_types__=ti/targets/arm/elf/std.h -Dxdc_bld__profile_debug -Dxdc_bld__vers_1_0_5_2_5 --symdebug:dwarf  -Dti_sysbios_Build_useHwiMacros -Dti_sysbios_BIOS_smpEnabled__D=FALSE  $(XDCINCS) -I$(ti.targets.arm.elf.M3.rootDir)/include  -fs=./package/lib/lib/sysbios/debug/ti.sysbios.syncs -fr=./package/lib/lib/sysbios/debug/ti.sysbios.syncs -fc $<
	$(MKDEP) -a $@.dep -p package/lib/lib/sysbios/debug/ti.sysbios.syncs -s oem3 $< -C   -qq -pdsw225 --endian=little -mv7M3 --abi=eabi -eo.oem3 -ea.sem3  -ms -g  -D_DEBUG_=1 -Dxdc_target_name__=M3 -Dxdc_target_types__=ti/targets/arm/elf/std.h -Dxdc_bld__profile_debug -Dxdc_bld__vers_1_0_5_2_5 --symdebug:dwarf  -Dti_sysbios_Build_useHwiMacros -Dti_sysbios_BIOS_smpEnabled__D=FALSE  $(XDCINCS) -I$(ti.targets.arm.elf.M3.rootDir)/include  -fs=./package/lib/lib/sysbios/debug/ti.sysbios.syncs -fr=./package/lib/lib/sysbios/debug/ti.sysbios.syncs
	-@$(FIXDEP) $@.dep $@.dep
	
package/lib/lib/sysbios/debug/ti.sysbios.syncs/SyncSwi.oem3: export C_DIR=
package/lib/lib/sysbios/debug/ti.sysbios.syncs/SyncSwi.oem3: PATH:=$(ti.targets.arm.elf.M3.rootDir)/bin/:$(PATH)

package/lib/lib/sysbios/debug/ti.sysbios.syncs/SyncSwi.sem3: | .interfaces
package/lib/lib/sysbios/debug/ti.sysbios.syncs/SyncSwi.sem3: SyncSwi.c lib/sysbios/debug/ti.sysbios.syncs.aem3.mak
	@$(RM) $@.dep
	$(RM) $@
	@$(MSG) clem3 -n $< ...
	$(ti.targets.arm.elf.M3.rootDir)/bin/armcl -c -n -s --symdebug:none -qq -pdsw225 --endian=little -mv7M3 --abi=eabi -eo.oem3 -ea.sem3  -ms -g  -D_DEBUG_=1 -Dxdc_target_name__=M3 -Dxdc_target_types__=ti/targets/arm/elf/std.h -Dxdc_bld__profile_debug -Dxdc_bld__vers_1_0_5_2_5 --symdebug:dwarf  -Dti_sysbios_Build_useHwiMacros -Dti_sysbios_BIOS_smpEnabled__D=FALSE  $(XDCINCS) -I$(ti.targets.arm.elf.M3.rootDir)/include  -fs=./package/lib/lib/sysbios/debug/ti.sysbios.syncs -fr=./package/lib/lib/sysbios/debug/ti.sysbios.syncs -fc $<
	$(MKDEP) -a $@.dep -p package/lib/lib/sysbios/debug/ti.sysbios.syncs -s oem3 $< -C  -n -s --symdebug:none -qq -pdsw225 --endian=little -mv7M3 --abi=eabi -eo.oem3 -ea.sem3  -ms -g  -D_DEBUG_=1 -Dxdc_target_name__=M3 -Dxdc_target_types__=ti/targets/arm/elf/std.h -Dxdc_bld__profile_debug -Dxdc_bld__vers_1_0_5_2_5 --symdebug:dwarf  -Dti_sysbios_Build_useHwiMacros -Dti_sysbios_BIOS_smpEnabled__D=FALSE  $(XDCINCS) -I$(ti.targets.arm.elf.M3.rootDir)/include  -fs=./package/lib/lib/sysbios/debug/ti.sysbios.syncs -fr=./package/lib/lib/sysbios/debug/ti.sysbios.syncs
	-@$(FIXDEP) $@.dep $@.dep
	
package/lib/lib/sysbios/debug/ti.sysbios.syncs/SyncSwi.sem3: export C_DIR=
package/lib/lib/sysbios/debug/ti.sysbios.syncs/SyncSwi.sem3: PATH:=$(ti.targets.arm.elf.M3.rootDir)/bin/:$(PATH)

ifeq (,$(MK_NOGENDEPS))
-include package/lib/lib/sysbios/debug/ti.sysbios.syncs/SyncEvent.oem3.dep
package/lib/lib/sysbios/debug/ti.sysbios.syncs/SyncEvent.oem3.dep: ;
endif

package/lib/lib/sysbios/debug/ti.sysbios.syncs/SyncEvent.oem3: | .interfaces
package/lib/lib/sysbios/debug/ti.sysbios.syncs/SyncEvent.oem3: SyncEvent.c lib/sysbios/debug/ti.sysbios.syncs.aem3.mak
	@$(RM) $@.dep
	$(RM) $@
	@$(MSG) clem3 $< ...
	$(ti.targets.arm.elf.M3.rootDir)/bin/armcl -c  -qq -pdsw225 --endian=little -mv7M3 --abi=eabi -eo.oem3 -ea.sem3  -ms -g  -D_DEBUG_=1 -Dxdc_target_name__=M3 -Dxdc_target_types__=ti/targets/arm/elf/std.h -Dxdc_bld__profile_debug -Dxdc_bld__vers_1_0_5_2_5 --symdebug:dwarf  -Dti_sysbios_Build_useHwiMacros -Dti_sysbios_BIOS_smpEnabled__D=FALSE  $(XDCINCS) -I$(ti.targets.arm.elf.M3.rootDir)/include  -fs=./package/lib/lib/sysbios/debug/ti.sysbios.syncs -fr=./package/lib/lib/sysbios/debug/ti.sysbios.syncs -fc $<
	$(MKDEP) -a $@.dep -p package/lib/lib/sysbios/debug/ti.sysbios.syncs -s oem3 $< -C   -qq -pdsw225 --endian=little -mv7M3 --abi=eabi -eo.oem3 -ea.sem3  -ms -g  -D_DEBUG_=1 -Dxdc_target_name__=M3 -Dxdc_target_types__=ti/targets/arm/elf/std.h -Dxdc_bld__profile_debug -Dxdc_bld__vers_1_0_5_2_5 --symdebug:dwarf  -Dti_sysbios_Build_useHwiMacros -Dti_sysbios_BIOS_smpEnabled__D=FALSE  $(XDCINCS) -I$(ti.targets.arm.elf.M3.rootDir)/include  -fs=./package/lib/lib/sysbios/debug/ti.sysbios.syncs -fr=./package/lib/lib/sysbios/debug/ti.sysbios.syncs
	-@$(FIXDEP) $@.dep $@.dep
	
package/lib/lib/sysbios/debug/ti.sysbios.syncs/SyncEvent.oem3: export C_DIR=
package/lib/lib/sysbios/debug/ti.sysbios.syncs/SyncEvent.oem3: PATH:=$(ti.targets.arm.elf.M3.rootDir)/bin/:$(PATH)

package/lib/lib/sysbios/debug/ti.sysbios.syncs/SyncEvent.sem3: | .interfaces
package/lib/lib/sysbios/debug/ti.sysbios.syncs/SyncEvent.sem3: SyncEvent.c lib/sysbios/debug/ti.sysbios.syncs.aem3.mak
	@$(RM) $@.dep
	$(RM) $@
	@$(MSG) clem3 -n $< ...
	$(ti.targets.arm.elf.M3.rootDir)/bin/armcl -c -n -s --symdebug:none -qq -pdsw225 --endian=little -mv7M3 --abi=eabi -eo.oem3 -ea.sem3  -ms -g  -D_DEBUG_=1 -Dxdc_target_name__=M3 -Dxdc_target_types__=ti/targets/arm/elf/std.h -Dxdc_bld__profile_debug -Dxdc_bld__vers_1_0_5_2_5 --symdebug:dwarf  -Dti_sysbios_Build_useHwiMacros -Dti_sysbios_BIOS_smpEnabled__D=FALSE  $(XDCINCS) -I$(ti.targets.arm.elf.M3.rootDir)/include  -fs=./package/lib/lib/sysbios/debug/ti.sysbios.syncs -fr=./package/lib/lib/sysbios/debug/ti.sysbios.syncs -fc $<
	$(MKDEP) -a $@.dep -p package/lib/lib/sysbios/debug/ti.sysbios.syncs -s oem3 $< -C  -n -s --symdebug:none -qq -pdsw225 --endian=little -mv7M3 --abi=eabi -eo.oem3 -ea.sem3  -ms -g  -D_DEBUG_=1 -Dxdc_target_name__=M3 -Dxdc_target_types__=ti/targets/arm/elf/std.h -Dxdc_bld__profile_debug -Dxdc_bld__vers_1_0_5_2_5 --symdebug:dwarf  -Dti_sysbios_Build_useHwiMacros -Dti_sysbios_BIOS_smpEnabled__D=FALSE  $(XDCINCS) -I$(ti.targets.arm.elf.M3.rootDir)/include  -fs=./package/lib/lib/sysbios/debug/ti.sysbios.syncs -fr=./package/lib/lib/sysbios/debug/ti.sysbios.syncs
	-@$(FIXDEP) $@.dep $@.dep
	
package/lib/lib/sysbios/debug/ti.sysbios.syncs/SyncEvent.sem3: export C_DIR=
package/lib/lib/sysbios/debug/ti.sysbios.syncs/SyncEvent.sem3: PATH:=$(ti.targets.arm.elf.M3.rootDir)/bin/:$(PATH)

clean,em3 ::
	-$(RM) package/lib/lib/sysbios/debug/ti.sysbios.syncs/package/package_ti.sysbios.syncs.oem3
	-$(RM) package/lib/lib/sysbios/debug/ti.sysbios.syncs/SyncSem.oem3
	-$(RM) package/lib/lib/sysbios/debug/ti.sysbios.syncs/SyncSwi.oem3
	-$(RM) package/lib/lib/sysbios/debug/ti.sysbios.syncs/SyncEvent.oem3
	-$(RM) package/lib/lib/sysbios/debug/ti.sysbios.syncs/package/package_ti.sysbios.syncs.sem3
	-$(RM) package/lib/lib/sysbios/debug/ti.sysbios.syncs/SyncSem.sem3
	-$(RM) package/lib/lib/sysbios/debug/ti.sysbios.syncs/SyncSwi.sem3
	-$(RM) package/lib/lib/sysbios/debug/ti.sysbios.syncs/SyncEvent.sem3

lib/sysbios/debug/ti.sysbios.syncs.aem3: package/lib/lib/sysbios/debug/ti.sysbios.syncs/package/package_ti.sysbios.syncs.oem3 package/lib/lib/sysbios/debug/ti.sysbios.syncs/SyncSem.oem3 package/lib/lib/sysbios/debug/ti.sysbios.syncs/SyncSwi.oem3 package/lib/lib/sysbios/debug/ti.sysbios.syncs/SyncEvent.oem3 lib/sysbios/debug/ti.sysbios.syncs.aem3.mak

clean::
	-$(RM) lib/sysbios/debug/ti.sysbios.syncs.aem3.mak
