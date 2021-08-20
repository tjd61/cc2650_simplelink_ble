#
#  Do not edit this file.  This file is generated from 
#  package.bld.  Any modifications to this file will be 
#  overwritten whenever makefiles are re-generated.
#
#  target compatibility key = ti.targets.arm.elf.M3{1,0,5.2,5
#
ifeq (,$(MK_NOGENDEPS))
-include package/lib/lib/release/ti.uia.runtime/package/package_ti.uia.runtime.oem3.dep
package/lib/lib/release/ti.uia.runtime/package/package_ti.uia.runtime.oem3.dep: ;
endif

package/lib/lib/release/ti.uia.runtime/package/package_ti.uia.runtime.oem3: | .interfaces
package/lib/lib/release/ti.uia.runtime/package/package_ti.uia.runtime.oem3: package/package_ti.uia.runtime.c lib/release/ti.uia.runtime.aem3.mak
	@$(RM) $@.dep
	$(RM) $@
	@$(MSG) clem3 $< ...
	$(ti.targets.arm.elf.M3.rootDir)/bin/armcl -c  -qq -pdsw225 --endian=little -mv7M3 --abi=eabi -eo.oem3 -ea.sem3  -ms -g  -Dxdc_target_name__=M3 -Dxdc_target_types__=ti/targets/arm/elf/std.h -Dxdc_bld__profile_release -Dxdc_bld__vers_1_0_5_2_5 -O2  $(XDCINCS) -I$(ti.targets.arm.elf.M3.rootDir)/include  -fs=./package/lib/lib/release/ti.uia.runtime/package -fr=./package/lib/lib/release/ti.uia.runtime/package -fc $<
	$(MKDEP) -a $@.dep -p package/lib/lib/release/ti.uia.runtime/package -s oem3 $< -C   -qq -pdsw225 --endian=little -mv7M3 --abi=eabi -eo.oem3 -ea.sem3  -ms -g  -Dxdc_target_name__=M3 -Dxdc_target_types__=ti/targets/arm/elf/std.h -Dxdc_bld__profile_release -Dxdc_bld__vers_1_0_5_2_5 -O2  $(XDCINCS) -I$(ti.targets.arm.elf.M3.rootDir)/include  -fs=./package/lib/lib/release/ti.uia.runtime/package -fr=./package/lib/lib/release/ti.uia.runtime/package
	-@$(FIXDEP) $@.dep $@.dep
	
package/lib/lib/release/ti.uia.runtime/package/package_ti.uia.runtime.oem3: export C_DIR=
package/lib/lib/release/ti.uia.runtime/package/package_ti.uia.runtime.oem3: PATH:=$(ti.targets.arm.elf.M3.rootDir)/bin/:$(PATH)

package/lib/lib/release/ti.uia.runtime/package/package_ti.uia.runtime.sem3: | .interfaces
package/lib/lib/release/ti.uia.runtime/package/package_ti.uia.runtime.sem3: package/package_ti.uia.runtime.c lib/release/ti.uia.runtime.aem3.mak
	@$(RM) $@.dep
	$(RM) $@
	@$(MSG) clem3 -n $< ...
	$(ti.targets.arm.elf.M3.rootDir)/bin/armcl -c -n -s --symdebug:none -qq -pdsw225 --endian=little -mv7M3 --abi=eabi -eo.oem3 -ea.sem3  -ms -g  -Dxdc_target_name__=M3 -Dxdc_target_types__=ti/targets/arm/elf/std.h -Dxdc_bld__profile_release -Dxdc_bld__vers_1_0_5_2_5 -O2  $(XDCINCS) -I$(ti.targets.arm.elf.M3.rootDir)/include  -fs=./package/lib/lib/release/ti.uia.runtime/package -fr=./package/lib/lib/release/ti.uia.runtime/package -fc $<
	$(MKDEP) -a $@.dep -p package/lib/lib/release/ti.uia.runtime/package -s oem3 $< -C  -n -s --symdebug:none -qq -pdsw225 --endian=little -mv7M3 --abi=eabi -eo.oem3 -ea.sem3  -ms -g  -Dxdc_target_name__=M3 -Dxdc_target_types__=ti/targets/arm/elf/std.h -Dxdc_bld__profile_release -Dxdc_bld__vers_1_0_5_2_5 -O2  $(XDCINCS) -I$(ti.targets.arm.elf.M3.rootDir)/include  -fs=./package/lib/lib/release/ti.uia.runtime/package -fr=./package/lib/lib/release/ti.uia.runtime/package
	-@$(FIXDEP) $@.dep $@.dep
	
package/lib/lib/release/ti.uia.runtime/package/package_ti.uia.runtime.sem3: export C_DIR=
package/lib/lib/release/ti.uia.runtime/package/package_ti.uia.runtime.sem3: PATH:=$(ti.targets.arm.elf.M3.rootDir)/bin/:$(PATH)

ifeq (,$(MK_NOGENDEPS))
-include package/lib/lib/release/ti.uia.runtime/CtxFilter.oem3.dep
package/lib/lib/release/ti.uia.runtime/CtxFilter.oem3.dep: ;
endif

package/lib/lib/release/ti.uia.runtime/CtxFilter.oem3: | .interfaces
package/lib/lib/release/ti.uia.runtime/CtxFilter.oem3: CtxFilter.c lib/release/ti.uia.runtime.aem3.mak
	@$(RM) $@.dep
	$(RM) $@
	@$(MSG) clem3 $< ...
	$(ti.targets.arm.elf.M3.rootDir)/bin/armcl -c  -qq -pdsw225 --endian=little -mv7M3 --abi=eabi -eo.oem3 -ea.sem3  -ms -g  -Dxdc_target_name__=M3 -Dxdc_target_types__=ti/targets/arm/elf/std.h -Dxdc_bld__profile_release -Dxdc_bld__vers_1_0_5_2_5 -O2  $(XDCINCS) -I$(ti.targets.arm.elf.M3.rootDir)/include  -fs=./package/lib/lib/release/ti.uia.runtime -fr=./package/lib/lib/release/ti.uia.runtime -fc $<
	$(MKDEP) -a $@.dep -p package/lib/lib/release/ti.uia.runtime -s oem3 $< -C   -qq -pdsw225 --endian=little -mv7M3 --abi=eabi -eo.oem3 -ea.sem3  -ms -g  -Dxdc_target_name__=M3 -Dxdc_target_types__=ti/targets/arm/elf/std.h -Dxdc_bld__profile_release -Dxdc_bld__vers_1_0_5_2_5 -O2  $(XDCINCS) -I$(ti.targets.arm.elf.M3.rootDir)/include  -fs=./package/lib/lib/release/ti.uia.runtime -fr=./package/lib/lib/release/ti.uia.runtime
	-@$(FIXDEP) $@.dep $@.dep
	
package/lib/lib/release/ti.uia.runtime/CtxFilter.oem3: export C_DIR=
package/lib/lib/release/ti.uia.runtime/CtxFilter.oem3: PATH:=$(ti.targets.arm.elf.M3.rootDir)/bin/:$(PATH)

package/lib/lib/release/ti.uia.runtime/CtxFilter.sem3: | .interfaces
package/lib/lib/release/ti.uia.runtime/CtxFilter.sem3: CtxFilter.c lib/release/ti.uia.runtime.aem3.mak
	@$(RM) $@.dep
	$(RM) $@
	@$(MSG) clem3 -n $< ...
	$(ti.targets.arm.elf.M3.rootDir)/bin/armcl -c -n -s --symdebug:none -qq -pdsw225 --endian=little -mv7M3 --abi=eabi -eo.oem3 -ea.sem3  -ms -g  -Dxdc_target_name__=M3 -Dxdc_target_types__=ti/targets/arm/elf/std.h -Dxdc_bld__profile_release -Dxdc_bld__vers_1_0_5_2_5 -O2  $(XDCINCS) -I$(ti.targets.arm.elf.M3.rootDir)/include  -fs=./package/lib/lib/release/ti.uia.runtime -fr=./package/lib/lib/release/ti.uia.runtime -fc $<
	$(MKDEP) -a $@.dep -p package/lib/lib/release/ti.uia.runtime -s oem3 $< -C  -n -s --symdebug:none -qq -pdsw225 --endian=little -mv7M3 --abi=eabi -eo.oem3 -ea.sem3  -ms -g  -Dxdc_target_name__=M3 -Dxdc_target_types__=ti/targets/arm/elf/std.h -Dxdc_bld__profile_release -Dxdc_bld__vers_1_0_5_2_5 -O2  $(XDCINCS) -I$(ti.targets.arm.elf.M3.rootDir)/include  -fs=./package/lib/lib/release/ti.uia.runtime -fr=./package/lib/lib/release/ti.uia.runtime
	-@$(FIXDEP) $@.dep $@.dep
	
package/lib/lib/release/ti.uia.runtime/CtxFilter.sem3: export C_DIR=
package/lib/lib/release/ti.uia.runtime/CtxFilter.sem3: PATH:=$(ti.targets.arm.elf.M3.rootDir)/bin/:$(PATH)

ifeq (,$(MK_NOGENDEPS))
-include package/lib/lib/release/ti.uia.runtime/LoggerSM.oem3.dep
package/lib/lib/release/ti.uia.runtime/LoggerSM.oem3.dep: ;
endif

package/lib/lib/release/ti.uia.runtime/LoggerSM.oem3: | .interfaces
package/lib/lib/release/ti.uia.runtime/LoggerSM.oem3: LoggerSM.c lib/release/ti.uia.runtime.aem3.mak
	@$(RM) $@.dep
	$(RM) $@
	@$(MSG) clem3 $< ...
	$(ti.targets.arm.elf.M3.rootDir)/bin/armcl -c  -qq -pdsw225 --endian=little -mv7M3 --abi=eabi -eo.oem3 -ea.sem3  -ms -g  -Dxdc_target_name__=M3 -Dxdc_target_types__=ti/targets/arm/elf/std.h -Dxdc_bld__profile_release -Dxdc_bld__vers_1_0_5_2_5 -O2  $(XDCINCS) -I$(ti.targets.arm.elf.M3.rootDir)/include  -fs=./package/lib/lib/release/ti.uia.runtime -fr=./package/lib/lib/release/ti.uia.runtime -fc $<
	$(MKDEP) -a $@.dep -p package/lib/lib/release/ti.uia.runtime -s oem3 $< -C   -qq -pdsw225 --endian=little -mv7M3 --abi=eabi -eo.oem3 -ea.sem3  -ms -g  -Dxdc_target_name__=M3 -Dxdc_target_types__=ti/targets/arm/elf/std.h -Dxdc_bld__profile_release -Dxdc_bld__vers_1_0_5_2_5 -O2  $(XDCINCS) -I$(ti.targets.arm.elf.M3.rootDir)/include  -fs=./package/lib/lib/release/ti.uia.runtime -fr=./package/lib/lib/release/ti.uia.runtime
	-@$(FIXDEP) $@.dep $@.dep
	
package/lib/lib/release/ti.uia.runtime/LoggerSM.oem3: export C_DIR=
package/lib/lib/release/ti.uia.runtime/LoggerSM.oem3: PATH:=$(ti.targets.arm.elf.M3.rootDir)/bin/:$(PATH)

package/lib/lib/release/ti.uia.runtime/LoggerSM.sem3: | .interfaces
package/lib/lib/release/ti.uia.runtime/LoggerSM.sem3: LoggerSM.c lib/release/ti.uia.runtime.aem3.mak
	@$(RM) $@.dep
	$(RM) $@
	@$(MSG) clem3 -n $< ...
	$(ti.targets.arm.elf.M3.rootDir)/bin/armcl -c -n -s --symdebug:none -qq -pdsw225 --endian=little -mv7M3 --abi=eabi -eo.oem3 -ea.sem3  -ms -g  -Dxdc_target_name__=M3 -Dxdc_target_types__=ti/targets/arm/elf/std.h -Dxdc_bld__profile_release -Dxdc_bld__vers_1_0_5_2_5 -O2  $(XDCINCS) -I$(ti.targets.arm.elf.M3.rootDir)/include  -fs=./package/lib/lib/release/ti.uia.runtime -fr=./package/lib/lib/release/ti.uia.runtime -fc $<
	$(MKDEP) -a $@.dep -p package/lib/lib/release/ti.uia.runtime -s oem3 $< -C  -n -s --symdebug:none -qq -pdsw225 --endian=little -mv7M3 --abi=eabi -eo.oem3 -ea.sem3  -ms -g  -Dxdc_target_name__=M3 -Dxdc_target_types__=ti/targets/arm/elf/std.h -Dxdc_bld__profile_release -Dxdc_bld__vers_1_0_5_2_5 -O2  $(XDCINCS) -I$(ti.targets.arm.elf.M3.rootDir)/include  -fs=./package/lib/lib/release/ti.uia.runtime -fr=./package/lib/lib/release/ti.uia.runtime
	-@$(FIXDEP) $@.dep $@.dep
	
package/lib/lib/release/ti.uia.runtime/LoggerSM.sem3: export C_DIR=
package/lib/lib/release/ti.uia.runtime/LoggerSM.sem3: PATH:=$(ti.targets.arm.elf.M3.rootDir)/bin/:$(PATH)

ifeq (,$(MK_NOGENDEPS))
-include package/lib/lib/release/ti.uia.runtime/LogSnapshot.oem3.dep
package/lib/lib/release/ti.uia.runtime/LogSnapshot.oem3.dep: ;
endif

package/lib/lib/release/ti.uia.runtime/LogSnapshot.oem3: | .interfaces
package/lib/lib/release/ti.uia.runtime/LogSnapshot.oem3: LogSnapshot.c lib/release/ti.uia.runtime.aem3.mak
	@$(RM) $@.dep
	$(RM) $@
	@$(MSG) clem3 $< ...
	$(ti.targets.arm.elf.M3.rootDir)/bin/armcl -c  -qq -pdsw225 --endian=little -mv7M3 --abi=eabi -eo.oem3 -ea.sem3  -ms -g  -Dxdc_target_name__=M3 -Dxdc_target_types__=ti/targets/arm/elf/std.h -Dxdc_bld__profile_release -Dxdc_bld__vers_1_0_5_2_5 -O2  $(XDCINCS) -I$(ti.targets.arm.elf.M3.rootDir)/include  -fs=./package/lib/lib/release/ti.uia.runtime -fr=./package/lib/lib/release/ti.uia.runtime -fc $<
	$(MKDEP) -a $@.dep -p package/lib/lib/release/ti.uia.runtime -s oem3 $< -C   -qq -pdsw225 --endian=little -mv7M3 --abi=eabi -eo.oem3 -ea.sem3  -ms -g  -Dxdc_target_name__=M3 -Dxdc_target_types__=ti/targets/arm/elf/std.h -Dxdc_bld__profile_release -Dxdc_bld__vers_1_0_5_2_5 -O2  $(XDCINCS) -I$(ti.targets.arm.elf.M3.rootDir)/include  -fs=./package/lib/lib/release/ti.uia.runtime -fr=./package/lib/lib/release/ti.uia.runtime
	-@$(FIXDEP) $@.dep $@.dep
	
package/lib/lib/release/ti.uia.runtime/LogSnapshot.oem3: export C_DIR=
package/lib/lib/release/ti.uia.runtime/LogSnapshot.oem3: PATH:=$(ti.targets.arm.elf.M3.rootDir)/bin/:$(PATH)

package/lib/lib/release/ti.uia.runtime/LogSnapshot.sem3: | .interfaces
package/lib/lib/release/ti.uia.runtime/LogSnapshot.sem3: LogSnapshot.c lib/release/ti.uia.runtime.aem3.mak
	@$(RM) $@.dep
	$(RM) $@
	@$(MSG) clem3 -n $< ...
	$(ti.targets.arm.elf.M3.rootDir)/bin/armcl -c -n -s --symdebug:none -qq -pdsw225 --endian=little -mv7M3 --abi=eabi -eo.oem3 -ea.sem3  -ms -g  -Dxdc_target_name__=M3 -Dxdc_target_types__=ti/targets/arm/elf/std.h -Dxdc_bld__profile_release -Dxdc_bld__vers_1_0_5_2_5 -O2  $(XDCINCS) -I$(ti.targets.arm.elf.M3.rootDir)/include  -fs=./package/lib/lib/release/ti.uia.runtime -fr=./package/lib/lib/release/ti.uia.runtime -fc $<
	$(MKDEP) -a $@.dep -p package/lib/lib/release/ti.uia.runtime -s oem3 $< -C  -n -s --symdebug:none -qq -pdsw225 --endian=little -mv7M3 --abi=eabi -eo.oem3 -ea.sem3  -ms -g  -Dxdc_target_name__=M3 -Dxdc_target_types__=ti/targets/arm/elf/std.h -Dxdc_bld__profile_release -Dxdc_bld__vers_1_0_5_2_5 -O2  $(XDCINCS) -I$(ti.targets.arm.elf.M3.rootDir)/include  -fs=./package/lib/lib/release/ti.uia.runtime -fr=./package/lib/lib/release/ti.uia.runtime
	-@$(FIXDEP) $@.dep $@.dep
	
package/lib/lib/release/ti.uia.runtime/LogSnapshot.sem3: export C_DIR=
package/lib/lib/release/ti.uia.runtime/LogSnapshot.sem3: PATH:=$(ti.targets.arm.elf.M3.rootDir)/bin/:$(PATH)

ifeq (,$(MK_NOGENDEPS))
-include package/lib/lib/release/ti.uia.runtime/LogSync.oem3.dep
package/lib/lib/release/ti.uia.runtime/LogSync.oem3.dep: ;
endif

package/lib/lib/release/ti.uia.runtime/LogSync.oem3: | .interfaces
package/lib/lib/release/ti.uia.runtime/LogSync.oem3: LogSync.c lib/release/ti.uia.runtime.aem3.mak
	@$(RM) $@.dep
	$(RM) $@
	@$(MSG) clem3 $< ...
	$(ti.targets.arm.elf.M3.rootDir)/bin/armcl -c  -qq -pdsw225 --endian=little -mv7M3 --abi=eabi -eo.oem3 -ea.sem3  -ms -g  -Dxdc_target_name__=M3 -Dxdc_target_types__=ti/targets/arm/elf/std.h -Dxdc_bld__profile_release -Dxdc_bld__vers_1_0_5_2_5 -O2  $(XDCINCS) -I$(ti.targets.arm.elf.M3.rootDir)/include  -fs=./package/lib/lib/release/ti.uia.runtime -fr=./package/lib/lib/release/ti.uia.runtime -fc $<
	$(MKDEP) -a $@.dep -p package/lib/lib/release/ti.uia.runtime -s oem3 $< -C   -qq -pdsw225 --endian=little -mv7M3 --abi=eabi -eo.oem3 -ea.sem3  -ms -g  -Dxdc_target_name__=M3 -Dxdc_target_types__=ti/targets/arm/elf/std.h -Dxdc_bld__profile_release -Dxdc_bld__vers_1_0_5_2_5 -O2  $(XDCINCS) -I$(ti.targets.arm.elf.M3.rootDir)/include  -fs=./package/lib/lib/release/ti.uia.runtime -fr=./package/lib/lib/release/ti.uia.runtime
	-@$(FIXDEP) $@.dep $@.dep
	
package/lib/lib/release/ti.uia.runtime/LogSync.oem3: export C_DIR=
package/lib/lib/release/ti.uia.runtime/LogSync.oem3: PATH:=$(ti.targets.arm.elf.M3.rootDir)/bin/:$(PATH)

package/lib/lib/release/ti.uia.runtime/LogSync.sem3: | .interfaces
package/lib/lib/release/ti.uia.runtime/LogSync.sem3: LogSync.c lib/release/ti.uia.runtime.aem3.mak
	@$(RM) $@.dep
	$(RM) $@
	@$(MSG) clem3 -n $< ...
	$(ti.targets.arm.elf.M3.rootDir)/bin/armcl -c -n -s --symdebug:none -qq -pdsw225 --endian=little -mv7M3 --abi=eabi -eo.oem3 -ea.sem3  -ms -g  -Dxdc_target_name__=M3 -Dxdc_target_types__=ti/targets/arm/elf/std.h -Dxdc_bld__profile_release -Dxdc_bld__vers_1_0_5_2_5 -O2  $(XDCINCS) -I$(ti.targets.arm.elf.M3.rootDir)/include  -fs=./package/lib/lib/release/ti.uia.runtime -fr=./package/lib/lib/release/ti.uia.runtime -fc $<
	$(MKDEP) -a $@.dep -p package/lib/lib/release/ti.uia.runtime -s oem3 $< -C  -n -s --symdebug:none -qq -pdsw225 --endian=little -mv7M3 --abi=eabi -eo.oem3 -ea.sem3  -ms -g  -Dxdc_target_name__=M3 -Dxdc_target_types__=ti/targets/arm/elf/std.h -Dxdc_bld__profile_release -Dxdc_bld__vers_1_0_5_2_5 -O2  $(XDCINCS) -I$(ti.targets.arm.elf.M3.rootDir)/include  -fs=./package/lib/lib/release/ti.uia.runtime -fr=./package/lib/lib/release/ti.uia.runtime
	-@$(FIXDEP) $@.dep $@.dep
	
package/lib/lib/release/ti.uia.runtime/LogSync.sem3: export C_DIR=
package/lib/lib/release/ti.uia.runtime/LogSync.sem3: PATH:=$(ti.targets.arm.elf.M3.rootDir)/bin/:$(PATH)

ifeq (,$(MK_NOGENDEPS))
-include package/lib/lib/release/ti.uia.runtime/QueueDescriptor.oem3.dep
package/lib/lib/release/ti.uia.runtime/QueueDescriptor.oem3.dep: ;
endif

package/lib/lib/release/ti.uia.runtime/QueueDescriptor.oem3: | .interfaces
package/lib/lib/release/ti.uia.runtime/QueueDescriptor.oem3: QueueDescriptor.c lib/release/ti.uia.runtime.aem3.mak
	@$(RM) $@.dep
	$(RM) $@
	@$(MSG) clem3 $< ...
	$(ti.targets.arm.elf.M3.rootDir)/bin/armcl -c  -qq -pdsw225 --endian=little -mv7M3 --abi=eabi -eo.oem3 -ea.sem3  -ms -g  -Dxdc_target_name__=M3 -Dxdc_target_types__=ti/targets/arm/elf/std.h -Dxdc_bld__profile_release -Dxdc_bld__vers_1_0_5_2_5 -O2  $(XDCINCS) -I$(ti.targets.arm.elf.M3.rootDir)/include  -fs=./package/lib/lib/release/ti.uia.runtime -fr=./package/lib/lib/release/ti.uia.runtime -fc $<
	$(MKDEP) -a $@.dep -p package/lib/lib/release/ti.uia.runtime -s oem3 $< -C   -qq -pdsw225 --endian=little -mv7M3 --abi=eabi -eo.oem3 -ea.sem3  -ms -g  -Dxdc_target_name__=M3 -Dxdc_target_types__=ti/targets/arm/elf/std.h -Dxdc_bld__profile_release -Dxdc_bld__vers_1_0_5_2_5 -O2  $(XDCINCS) -I$(ti.targets.arm.elf.M3.rootDir)/include  -fs=./package/lib/lib/release/ti.uia.runtime -fr=./package/lib/lib/release/ti.uia.runtime
	-@$(FIXDEP) $@.dep $@.dep
	
package/lib/lib/release/ti.uia.runtime/QueueDescriptor.oem3: export C_DIR=
package/lib/lib/release/ti.uia.runtime/QueueDescriptor.oem3: PATH:=$(ti.targets.arm.elf.M3.rootDir)/bin/:$(PATH)

package/lib/lib/release/ti.uia.runtime/QueueDescriptor.sem3: | .interfaces
package/lib/lib/release/ti.uia.runtime/QueueDescriptor.sem3: QueueDescriptor.c lib/release/ti.uia.runtime.aem3.mak
	@$(RM) $@.dep
	$(RM) $@
	@$(MSG) clem3 -n $< ...
	$(ti.targets.arm.elf.M3.rootDir)/bin/armcl -c -n -s --symdebug:none -qq -pdsw225 --endian=little -mv7M3 --abi=eabi -eo.oem3 -ea.sem3  -ms -g  -Dxdc_target_name__=M3 -Dxdc_target_types__=ti/targets/arm/elf/std.h -Dxdc_bld__profile_release -Dxdc_bld__vers_1_0_5_2_5 -O2  $(XDCINCS) -I$(ti.targets.arm.elf.M3.rootDir)/include  -fs=./package/lib/lib/release/ti.uia.runtime -fr=./package/lib/lib/release/ti.uia.runtime -fc $<
	$(MKDEP) -a $@.dep -p package/lib/lib/release/ti.uia.runtime -s oem3 $< -C  -n -s --symdebug:none -qq -pdsw225 --endian=little -mv7M3 --abi=eabi -eo.oem3 -ea.sem3  -ms -g  -Dxdc_target_name__=M3 -Dxdc_target_types__=ti/targets/arm/elf/std.h -Dxdc_bld__profile_release -Dxdc_bld__vers_1_0_5_2_5 -O2  $(XDCINCS) -I$(ti.targets.arm.elf.M3.rootDir)/include  -fs=./package/lib/lib/release/ti.uia.runtime -fr=./package/lib/lib/release/ti.uia.runtime
	-@$(FIXDEP) $@.dep $@.dep
	
package/lib/lib/release/ti.uia.runtime/QueueDescriptor.sem3: export C_DIR=
package/lib/lib/release/ti.uia.runtime/QueueDescriptor.sem3: PATH:=$(ti.targets.arm.elf.M3.rootDir)/bin/:$(PATH)

ifeq (,$(MK_NOGENDEPS))
-include package/lib/lib/release/ti.uia.runtime/ServiceMgr.oem3.dep
package/lib/lib/release/ti.uia.runtime/ServiceMgr.oem3.dep: ;
endif

package/lib/lib/release/ti.uia.runtime/ServiceMgr.oem3: | .interfaces
package/lib/lib/release/ti.uia.runtime/ServiceMgr.oem3: ServiceMgr.c lib/release/ti.uia.runtime.aem3.mak
	@$(RM) $@.dep
	$(RM) $@
	@$(MSG) clem3 $< ...
	$(ti.targets.arm.elf.M3.rootDir)/bin/armcl -c  -qq -pdsw225 --endian=little -mv7M3 --abi=eabi -eo.oem3 -ea.sem3  -ms -g  -Dxdc_target_name__=M3 -Dxdc_target_types__=ti/targets/arm/elf/std.h -Dxdc_bld__profile_release -Dxdc_bld__vers_1_0_5_2_5 -O2  $(XDCINCS) -I$(ti.targets.arm.elf.M3.rootDir)/include  -fs=./package/lib/lib/release/ti.uia.runtime -fr=./package/lib/lib/release/ti.uia.runtime -fc $<
	$(MKDEP) -a $@.dep -p package/lib/lib/release/ti.uia.runtime -s oem3 $< -C   -qq -pdsw225 --endian=little -mv7M3 --abi=eabi -eo.oem3 -ea.sem3  -ms -g  -Dxdc_target_name__=M3 -Dxdc_target_types__=ti/targets/arm/elf/std.h -Dxdc_bld__profile_release -Dxdc_bld__vers_1_0_5_2_5 -O2  $(XDCINCS) -I$(ti.targets.arm.elf.M3.rootDir)/include  -fs=./package/lib/lib/release/ti.uia.runtime -fr=./package/lib/lib/release/ti.uia.runtime
	-@$(FIXDEP) $@.dep $@.dep
	
package/lib/lib/release/ti.uia.runtime/ServiceMgr.oem3: export C_DIR=
package/lib/lib/release/ti.uia.runtime/ServiceMgr.oem3: PATH:=$(ti.targets.arm.elf.M3.rootDir)/bin/:$(PATH)

package/lib/lib/release/ti.uia.runtime/ServiceMgr.sem3: | .interfaces
package/lib/lib/release/ti.uia.runtime/ServiceMgr.sem3: ServiceMgr.c lib/release/ti.uia.runtime.aem3.mak
	@$(RM) $@.dep
	$(RM) $@
	@$(MSG) clem3 -n $< ...
	$(ti.targets.arm.elf.M3.rootDir)/bin/armcl -c -n -s --symdebug:none -qq -pdsw225 --endian=little -mv7M3 --abi=eabi -eo.oem3 -ea.sem3  -ms -g  -Dxdc_target_name__=M3 -Dxdc_target_types__=ti/targets/arm/elf/std.h -Dxdc_bld__profile_release -Dxdc_bld__vers_1_0_5_2_5 -O2  $(XDCINCS) -I$(ti.targets.arm.elf.M3.rootDir)/include  -fs=./package/lib/lib/release/ti.uia.runtime -fr=./package/lib/lib/release/ti.uia.runtime -fc $<
	$(MKDEP) -a $@.dep -p package/lib/lib/release/ti.uia.runtime -s oem3 $< -C  -n -s --symdebug:none -qq -pdsw225 --endian=little -mv7M3 --abi=eabi -eo.oem3 -ea.sem3  -ms -g  -Dxdc_target_name__=M3 -Dxdc_target_types__=ti/targets/arm/elf/std.h -Dxdc_bld__profile_release -Dxdc_bld__vers_1_0_5_2_5 -O2  $(XDCINCS) -I$(ti.targets.arm.elf.M3.rootDir)/include  -fs=./package/lib/lib/release/ti.uia.runtime -fr=./package/lib/lib/release/ti.uia.runtime
	-@$(FIXDEP) $@.dep $@.dep
	
package/lib/lib/release/ti.uia.runtime/ServiceMgr.sem3: export C_DIR=
package/lib/lib/release/ti.uia.runtime/ServiceMgr.sem3: PATH:=$(ti.targets.arm.elf.M3.rootDir)/bin/:$(PATH)

ifeq (,$(MK_NOGENDEPS))
-include package/lib/lib/release/ti.uia.runtime/UIAPacket.oem3.dep
package/lib/lib/release/ti.uia.runtime/UIAPacket.oem3.dep: ;
endif

package/lib/lib/release/ti.uia.runtime/UIAPacket.oem3: | .interfaces
package/lib/lib/release/ti.uia.runtime/UIAPacket.oem3: UIAPacket.c lib/release/ti.uia.runtime.aem3.mak
	@$(RM) $@.dep
	$(RM) $@
	@$(MSG) clem3 $< ...
	$(ti.targets.arm.elf.M3.rootDir)/bin/armcl -c  -qq -pdsw225 --endian=little -mv7M3 --abi=eabi -eo.oem3 -ea.sem3  -ms -g  -Dxdc_target_name__=M3 -Dxdc_target_types__=ti/targets/arm/elf/std.h -Dxdc_bld__profile_release -Dxdc_bld__vers_1_0_5_2_5 -O2  $(XDCINCS) -I$(ti.targets.arm.elf.M3.rootDir)/include  -fs=./package/lib/lib/release/ti.uia.runtime -fr=./package/lib/lib/release/ti.uia.runtime -fc $<
	$(MKDEP) -a $@.dep -p package/lib/lib/release/ti.uia.runtime -s oem3 $< -C   -qq -pdsw225 --endian=little -mv7M3 --abi=eabi -eo.oem3 -ea.sem3  -ms -g  -Dxdc_target_name__=M3 -Dxdc_target_types__=ti/targets/arm/elf/std.h -Dxdc_bld__profile_release -Dxdc_bld__vers_1_0_5_2_5 -O2  $(XDCINCS) -I$(ti.targets.arm.elf.M3.rootDir)/include  -fs=./package/lib/lib/release/ti.uia.runtime -fr=./package/lib/lib/release/ti.uia.runtime
	-@$(FIXDEP) $@.dep $@.dep
	
package/lib/lib/release/ti.uia.runtime/UIAPacket.oem3: export C_DIR=
package/lib/lib/release/ti.uia.runtime/UIAPacket.oem3: PATH:=$(ti.targets.arm.elf.M3.rootDir)/bin/:$(PATH)

package/lib/lib/release/ti.uia.runtime/UIAPacket.sem3: | .interfaces
package/lib/lib/release/ti.uia.runtime/UIAPacket.sem3: UIAPacket.c lib/release/ti.uia.runtime.aem3.mak
	@$(RM) $@.dep
	$(RM) $@
	@$(MSG) clem3 -n $< ...
	$(ti.targets.arm.elf.M3.rootDir)/bin/armcl -c -n -s --symdebug:none -qq -pdsw225 --endian=little -mv7M3 --abi=eabi -eo.oem3 -ea.sem3  -ms -g  -Dxdc_target_name__=M3 -Dxdc_target_types__=ti/targets/arm/elf/std.h -Dxdc_bld__profile_release -Dxdc_bld__vers_1_0_5_2_5 -O2  $(XDCINCS) -I$(ti.targets.arm.elf.M3.rootDir)/include  -fs=./package/lib/lib/release/ti.uia.runtime -fr=./package/lib/lib/release/ti.uia.runtime -fc $<
	$(MKDEP) -a $@.dep -p package/lib/lib/release/ti.uia.runtime -s oem3 $< -C  -n -s --symdebug:none -qq -pdsw225 --endian=little -mv7M3 --abi=eabi -eo.oem3 -ea.sem3  -ms -g  -Dxdc_target_name__=M3 -Dxdc_target_types__=ti/targets/arm/elf/std.h -Dxdc_bld__profile_release -Dxdc_bld__vers_1_0_5_2_5 -O2  $(XDCINCS) -I$(ti.targets.arm.elf.M3.rootDir)/include  -fs=./package/lib/lib/release/ti.uia.runtime -fr=./package/lib/lib/release/ti.uia.runtime
	-@$(FIXDEP) $@.dep $@.dep
	
package/lib/lib/release/ti.uia.runtime/UIAPacket.sem3: export C_DIR=
package/lib/lib/release/ti.uia.runtime/UIAPacket.sem3: PATH:=$(ti.targets.arm.elf.M3.rootDir)/bin/:$(PATH)

clean,em3 ::
	-$(RM) package/lib/lib/release/ti.uia.runtime/package/package_ti.uia.runtime.oem3
	-$(RM) package/lib/lib/release/ti.uia.runtime/CtxFilter.oem3
	-$(RM) package/lib/lib/release/ti.uia.runtime/LoggerSM.oem3
	-$(RM) package/lib/lib/release/ti.uia.runtime/LogSnapshot.oem3
	-$(RM) package/lib/lib/release/ti.uia.runtime/LogSync.oem3
	-$(RM) package/lib/lib/release/ti.uia.runtime/QueueDescriptor.oem3
	-$(RM) package/lib/lib/release/ti.uia.runtime/ServiceMgr.oem3
	-$(RM) package/lib/lib/release/ti.uia.runtime/UIAPacket.oem3
	-$(RM) package/lib/lib/release/ti.uia.runtime/package/package_ti.uia.runtime.sem3
	-$(RM) package/lib/lib/release/ti.uia.runtime/CtxFilter.sem3
	-$(RM) package/lib/lib/release/ti.uia.runtime/LoggerSM.sem3
	-$(RM) package/lib/lib/release/ti.uia.runtime/LogSnapshot.sem3
	-$(RM) package/lib/lib/release/ti.uia.runtime/LogSync.sem3
	-$(RM) package/lib/lib/release/ti.uia.runtime/QueueDescriptor.sem3
	-$(RM) package/lib/lib/release/ti.uia.runtime/ServiceMgr.sem3
	-$(RM) package/lib/lib/release/ti.uia.runtime/UIAPacket.sem3

lib/release/ti.uia.runtime.aem3: package/lib/lib/release/ti.uia.runtime/package/package_ti.uia.runtime.oem3 package/lib/lib/release/ti.uia.runtime/CtxFilter.oem3 package/lib/lib/release/ti.uia.runtime/LoggerSM.oem3 package/lib/lib/release/ti.uia.runtime/LogSnapshot.oem3 package/lib/lib/release/ti.uia.runtime/LogSync.oem3 package/lib/lib/release/ti.uia.runtime/QueueDescriptor.oem3 package/lib/lib/release/ti.uia.runtime/ServiceMgr.oem3 package/lib/lib/release/ti.uia.runtime/UIAPacket.oem3 lib/release/ti.uia.runtime.aem3.mak

clean::
	-$(RM) lib/release/ti.uia.runtime.aem3.mak
