#
#  Do not edit this file.  This file is generated from 
#  package.bld.  Any modifications to this file will be 
#  overwritten whenever makefiles are re-generated.
#
#  target compatibility key = ti.targets.arm.elf.M3{1,0,5.2,5
#
ifeq (,$(MK_NOGENDEPS))
-include package/lib/lib/release/ti.uia.sysbios/package/package_ti.uia.sysbios.oem3.dep
package/lib/lib/release/ti.uia.sysbios/package/package_ti.uia.sysbios.oem3.dep: ;
endif

package/lib/lib/release/ti.uia.sysbios/package/package_ti.uia.sysbios.oem3: | .interfaces
package/lib/lib/release/ti.uia.sysbios/package/package_ti.uia.sysbios.oem3: package/package_ti.uia.sysbios.c lib/release/ti.uia.sysbios.aem3.mak
	@$(RM) $@.dep
	$(RM) $@
	@$(MSG) clem3 $< ...
	$(ti.targets.arm.elf.M3.rootDir)/bin/armcl -c  -qq -pdsw225 --endian=little -mv7M3 --abi=eabi -eo.oem3 -ea.sem3  -ms -g  -Dxdc_target_name__=M3 -Dxdc_target_types__=ti/targets/arm/elf/std.h -Dxdc_bld__profile_release -Dxdc_bld__vers_1_0_5_2_5 -O2  $(XDCINCS) -I$(ti.targets.arm.elf.M3.rootDir)/include  -fs=./package/lib/lib/release/ti.uia.sysbios/package -fr=./package/lib/lib/release/ti.uia.sysbios/package -fc $<
	$(MKDEP) -a $@.dep -p package/lib/lib/release/ti.uia.sysbios/package -s oem3 $< -C   -qq -pdsw225 --endian=little -mv7M3 --abi=eabi -eo.oem3 -ea.sem3  -ms -g  -Dxdc_target_name__=M3 -Dxdc_target_types__=ti/targets/arm/elf/std.h -Dxdc_bld__profile_release -Dxdc_bld__vers_1_0_5_2_5 -O2  $(XDCINCS) -I$(ti.targets.arm.elf.M3.rootDir)/include  -fs=./package/lib/lib/release/ti.uia.sysbios/package -fr=./package/lib/lib/release/ti.uia.sysbios/package
	-@$(FIXDEP) $@.dep $@.dep
	
package/lib/lib/release/ti.uia.sysbios/package/package_ti.uia.sysbios.oem3: export C_DIR=
package/lib/lib/release/ti.uia.sysbios/package/package_ti.uia.sysbios.oem3: PATH:=$(ti.targets.arm.elf.M3.rootDir)/bin/:$(PATH)

package/lib/lib/release/ti.uia.sysbios/package/package_ti.uia.sysbios.sem3: | .interfaces
package/lib/lib/release/ti.uia.sysbios/package/package_ti.uia.sysbios.sem3: package/package_ti.uia.sysbios.c lib/release/ti.uia.sysbios.aem3.mak
	@$(RM) $@.dep
	$(RM) $@
	@$(MSG) clem3 -n $< ...
	$(ti.targets.arm.elf.M3.rootDir)/bin/armcl -c -n -s --symdebug:none -qq -pdsw225 --endian=little -mv7M3 --abi=eabi -eo.oem3 -ea.sem3  -ms -g  -Dxdc_target_name__=M3 -Dxdc_target_types__=ti/targets/arm/elf/std.h -Dxdc_bld__profile_release -Dxdc_bld__vers_1_0_5_2_5 -O2  $(XDCINCS) -I$(ti.targets.arm.elf.M3.rootDir)/include  -fs=./package/lib/lib/release/ti.uia.sysbios/package -fr=./package/lib/lib/release/ti.uia.sysbios/package -fc $<
	$(MKDEP) -a $@.dep -p package/lib/lib/release/ti.uia.sysbios/package -s oem3 $< -C  -n -s --symdebug:none -qq -pdsw225 --endian=little -mv7M3 --abi=eabi -eo.oem3 -ea.sem3  -ms -g  -Dxdc_target_name__=M3 -Dxdc_target_types__=ti/targets/arm/elf/std.h -Dxdc_bld__profile_release -Dxdc_bld__vers_1_0_5_2_5 -O2  $(XDCINCS) -I$(ti.targets.arm.elf.M3.rootDir)/include  -fs=./package/lib/lib/release/ti.uia.sysbios/package -fr=./package/lib/lib/release/ti.uia.sysbios/package
	-@$(FIXDEP) $@.dep $@.dep
	
package/lib/lib/release/ti.uia.sysbios/package/package_ti.uia.sysbios.sem3: export C_DIR=
package/lib/lib/release/ti.uia.sysbios/package/package_ti.uia.sysbios.sem3: PATH:=$(ti.targets.arm.elf.M3.rootDir)/bin/:$(PATH)

ifeq (,$(MK_NOGENDEPS))
-include package/lib/lib/release/ti.uia.sysbios/LoggerStreamer.oem3.dep
package/lib/lib/release/ti.uia.sysbios/LoggerStreamer.oem3.dep: ;
endif

package/lib/lib/release/ti.uia.sysbios/LoggerStreamer.oem3: | .interfaces
package/lib/lib/release/ti.uia.sysbios/LoggerStreamer.oem3: LoggerStreamer.c lib/release/ti.uia.sysbios.aem3.mak
	@$(RM) $@.dep
	$(RM) $@
	@$(MSG) clem3 $< ...
	$(ti.targets.arm.elf.M3.rootDir)/bin/armcl -c  -qq -pdsw225 --endian=little -mv7M3 --abi=eabi -eo.oem3 -ea.sem3  -ms -g  -Dxdc_target_name__=M3 -Dxdc_target_types__=ti/targets/arm/elf/std.h -Dxdc_bld__profile_release -Dxdc_bld__vers_1_0_5_2_5 -O2  $(XDCINCS) -I$(ti.targets.arm.elf.M3.rootDir)/include  -fs=./package/lib/lib/release/ti.uia.sysbios -fr=./package/lib/lib/release/ti.uia.sysbios -fc $<
	$(MKDEP) -a $@.dep -p package/lib/lib/release/ti.uia.sysbios -s oem3 $< -C   -qq -pdsw225 --endian=little -mv7M3 --abi=eabi -eo.oem3 -ea.sem3  -ms -g  -Dxdc_target_name__=M3 -Dxdc_target_types__=ti/targets/arm/elf/std.h -Dxdc_bld__profile_release -Dxdc_bld__vers_1_0_5_2_5 -O2  $(XDCINCS) -I$(ti.targets.arm.elf.M3.rootDir)/include  -fs=./package/lib/lib/release/ti.uia.sysbios -fr=./package/lib/lib/release/ti.uia.sysbios
	-@$(FIXDEP) $@.dep $@.dep
	
package/lib/lib/release/ti.uia.sysbios/LoggerStreamer.oem3: export C_DIR=
package/lib/lib/release/ti.uia.sysbios/LoggerStreamer.oem3: PATH:=$(ti.targets.arm.elf.M3.rootDir)/bin/:$(PATH)

package/lib/lib/release/ti.uia.sysbios/LoggerStreamer.sem3: | .interfaces
package/lib/lib/release/ti.uia.sysbios/LoggerStreamer.sem3: LoggerStreamer.c lib/release/ti.uia.sysbios.aem3.mak
	@$(RM) $@.dep
	$(RM) $@
	@$(MSG) clem3 -n $< ...
	$(ti.targets.arm.elf.M3.rootDir)/bin/armcl -c -n -s --symdebug:none -qq -pdsw225 --endian=little -mv7M3 --abi=eabi -eo.oem3 -ea.sem3  -ms -g  -Dxdc_target_name__=M3 -Dxdc_target_types__=ti/targets/arm/elf/std.h -Dxdc_bld__profile_release -Dxdc_bld__vers_1_0_5_2_5 -O2  $(XDCINCS) -I$(ti.targets.arm.elf.M3.rootDir)/include  -fs=./package/lib/lib/release/ti.uia.sysbios -fr=./package/lib/lib/release/ti.uia.sysbios -fc $<
	$(MKDEP) -a $@.dep -p package/lib/lib/release/ti.uia.sysbios -s oem3 $< -C  -n -s --symdebug:none -qq -pdsw225 --endian=little -mv7M3 --abi=eabi -eo.oem3 -ea.sem3  -ms -g  -Dxdc_target_name__=M3 -Dxdc_target_types__=ti/targets/arm/elf/std.h -Dxdc_bld__profile_release -Dxdc_bld__vers_1_0_5_2_5 -O2  $(XDCINCS) -I$(ti.targets.arm.elf.M3.rootDir)/include  -fs=./package/lib/lib/release/ti.uia.sysbios -fr=./package/lib/lib/release/ti.uia.sysbios
	-@$(FIXDEP) $@.dep $@.dep
	
package/lib/lib/release/ti.uia.sysbios/LoggerStreamer.sem3: export C_DIR=
package/lib/lib/release/ti.uia.sysbios/LoggerStreamer.sem3: PATH:=$(ti.targets.arm.elf.M3.rootDir)/bin/:$(PATH)

ifeq (,$(MK_NOGENDEPS))
-include package/lib/lib/release/ti.uia.sysbios/LoggerStreamer2.oem3.dep
package/lib/lib/release/ti.uia.sysbios/LoggerStreamer2.oem3.dep: ;
endif

package/lib/lib/release/ti.uia.sysbios/LoggerStreamer2.oem3: | .interfaces
package/lib/lib/release/ti.uia.sysbios/LoggerStreamer2.oem3: LoggerStreamer2.c lib/release/ti.uia.sysbios.aem3.mak
	@$(RM) $@.dep
	$(RM) $@
	@$(MSG) clem3 $< ...
	$(ti.targets.arm.elf.M3.rootDir)/bin/armcl -c  -qq -pdsw225 --endian=little -mv7M3 --abi=eabi -eo.oem3 -ea.sem3  -ms -g  -Dxdc_target_name__=M3 -Dxdc_target_types__=ti/targets/arm/elf/std.h -Dxdc_bld__profile_release -Dxdc_bld__vers_1_0_5_2_5 -O2  $(XDCINCS) -I$(ti.targets.arm.elf.M3.rootDir)/include  -fs=./package/lib/lib/release/ti.uia.sysbios -fr=./package/lib/lib/release/ti.uia.sysbios -fc $<
	$(MKDEP) -a $@.dep -p package/lib/lib/release/ti.uia.sysbios -s oem3 $< -C   -qq -pdsw225 --endian=little -mv7M3 --abi=eabi -eo.oem3 -ea.sem3  -ms -g  -Dxdc_target_name__=M3 -Dxdc_target_types__=ti/targets/arm/elf/std.h -Dxdc_bld__profile_release -Dxdc_bld__vers_1_0_5_2_5 -O2  $(XDCINCS) -I$(ti.targets.arm.elf.M3.rootDir)/include  -fs=./package/lib/lib/release/ti.uia.sysbios -fr=./package/lib/lib/release/ti.uia.sysbios
	-@$(FIXDEP) $@.dep $@.dep
	
package/lib/lib/release/ti.uia.sysbios/LoggerStreamer2.oem3: export C_DIR=
package/lib/lib/release/ti.uia.sysbios/LoggerStreamer2.oem3: PATH:=$(ti.targets.arm.elf.M3.rootDir)/bin/:$(PATH)

package/lib/lib/release/ti.uia.sysbios/LoggerStreamer2.sem3: | .interfaces
package/lib/lib/release/ti.uia.sysbios/LoggerStreamer2.sem3: LoggerStreamer2.c lib/release/ti.uia.sysbios.aem3.mak
	@$(RM) $@.dep
	$(RM) $@
	@$(MSG) clem3 -n $< ...
	$(ti.targets.arm.elf.M3.rootDir)/bin/armcl -c -n -s --symdebug:none -qq -pdsw225 --endian=little -mv7M3 --abi=eabi -eo.oem3 -ea.sem3  -ms -g  -Dxdc_target_name__=M3 -Dxdc_target_types__=ti/targets/arm/elf/std.h -Dxdc_bld__profile_release -Dxdc_bld__vers_1_0_5_2_5 -O2  $(XDCINCS) -I$(ti.targets.arm.elf.M3.rootDir)/include  -fs=./package/lib/lib/release/ti.uia.sysbios -fr=./package/lib/lib/release/ti.uia.sysbios -fc $<
	$(MKDEP) -a $@.dep -p package/lib/lib/release/ti.uia.sysbios -s oem3 $< -C  -n -s --symdebug:none -qq -pdsw225 --endian=little -mv7M3 --abi=eabi -eo.oem3 -ea.sem3  -ms -g  -Dxdc_target_name__=M3 -Dxdc_target_types__=ti/targets/arm/elf/std.h -Dxdc_bld__profile_release -Dxdc_bld__vers_1_0_5_2_5 -O2  $(XDCINCS) -I$(ti.targets.arm.elf.M3.rootDir)/include  -fs=./package/lib/lib/release/ti.uia.sysbios -fr=./package/lib/lib/release/ti.uia.sysbios
	-@$(FIXDEP) $@.dep $@.dep
	
package/lib/lib/release/ti.uia.sysbios/LoggerStreamer2.sem3: export C_DIR=
package/lib/lib/release/ti.uia.sysbios/LoggerStreamer2.sem3: PATH:=$(ti.targets.arm.elf.M3.rootDir)/bin/:$(PATH)

ifeq (,$(MK_NOGENDEPS))
-include package/lib/lib/release/ti.uia.sysbios/LoggerIdle.oem3.dep
package/lib/lib/release/ti.uia.sysbios/LoggerIdle.oem3.dep: ;
endif

package/lib/lib/release/ti.uia.sysbios/LoggerIdle.oem3: | .interfaces
package/lib/lib/release/ti.uia.sysbios/LoggerIdle.oem3: LoggerIdle.c lib/release/ti.uia.sysbios.aem3.mak
	@$(RM) $@.dep
	$(RM) $@
	@$(MSG) clem3 $< ...
	$(ti.targets.arm.elf.M3.rootDir)/bin/armcl -c  -qq -pdsw225 --endian=little -mv7M3 --abi=eabi -eo.oem3 -ea.sem3  -ms -g  -Dxdc_target_name__=M3 -Dxdc_target_types__=ti/targets/arm/elf/std.h -Dxdc_bld__profile_release -Dxdc_bld__vers_1_0_5_2_5 -O2  $(XDCINCS) -I$(ti.targets.arm.elf.M3.rootDir)/include  -fs=./package/lib/lib/release/ti.uia.sysbios -fr=./package/lib/lib/release/ti.uia.sysbios -fc $<
	$(MKDEP) -a $@.dep -p package/lib/lib/release/ti.uia.sysbios -s oem3 $< -C   -qq -pdsw225 --endian=little -mv7M3 --abi=eabi -eo.oem3 -ea.sem3  -ms -g  -Dxdc_target_name__=M3 -Dxdc_target_types__=ti/targets/arm/elf/std.h -Dxdc_bld__profile_release -Dxdc_bld__vers_1_0_5_2_5 -O2  $(XDCINCS) -I$(ti.targets.arm.elf.M3.rootDir)/include  -fs=./package/lib/lib/release/ti.uia.sysbios -fr=./package/lib/lib/release/ti.uia.sysbios
	-@$(FIXDEP) $@.dep $@.dep
	
package/lib/lib/release/ti.uia.sysbios/LoggerIdle.oem3: export C_DIR=
package/lib/lib/release/ti.uia.sysbios/LoggerIdle.oem3: PATH:=$(ti.targets.arm.elf.M3.rootDir)/bin/:$(PATH)

package/lib/lib/release/ti.uia.sysbios/LoggerIdle.sem3: | .interfaces
package/lib/lib/release/ti.uia.sysbios/LoggerIdle.sem3: LoggerIdle.c lib/release/ti.uia.sysbios.aem3.mak
	@$(RM) $@.dep
	$(RM) $@
	@$(MSG) clem3 -n $< ...
	$(ti.targets.arm.elf.M3.rootDir)/bin/armcl -c -n -s --symdebug:none -qq -pdsw225 --endian=little -mv7M3 --abi=eabi -eo.oem3 -ea.sem3  -ms -g  -Dxdc_target_name__=M3 -Dxdc_target_types__=ti/targets/arm/elf/std.h -Dxdc_bld__profile_release -Dxdc_bld__vers_1_0_5_2_5 -O2  $(XDCINCS) -I$(ti.targets.arm.elf.M3.rootDir)/include  -fs=./package/lib/lib/release/ti.uia.sysbios -fr=./package/lib/lib/release/ti.uia.sysbios -fc $<
	$(MKDEP) -a $@.dep -p package/lib/lib/release/ti.uia.sysbios -s oem3 $< -C  -n -s --symdebug:none -qq -pdsw225 --endian=little -mv7M3 --abi=eabi -eo.oem3 -ea.sem3  -ms -g  -Dxdc_target_name__=M3 -Dxdc_target_types__=ti/targets/arm/elf/std.h -Dxdc_bld__profile_release -Dxdc_bld__vers_1_0_5_2_5 -O2  $(XDCINCS) -I$(ti.targets.arm.elf.M3.rootDir)/include  -fs=./package/lib/lib/release/ti.uia.sysbios -fr=./package/lib/lib/release/ti.uia.sysbios
	-@$(FIXDEP) $@.dep $@.dep
	
package/lib/lib/release/ti.uia.sysbios/LoggerIdle.sem3: export C_DIR=
package/lib/lib/release/ti.uia.sysbios/LoggerIdle.sem3: PATH:=$(ti.targets.arm.elf.M3.rootDir)/bin/:$(PATH)

clean,em3 ::
	-$(RM) package/lib/lib/release/ti.uia.sysbios/package/package_ti.uia.sysbios.oem3
	-$(RM) package/lib/lib/release/ti.uia.sysbios/LoggerStreamer.oem3
	-$(RM) package/lib/lib/release/ti.uia.sysbios/LoggerStreamer2.oem3
	-$(RM) package/lib/lib/release/ti.uia.sysbios/LoggerIdle.oem3
	-$(RM) package/lib/lib/release/ti.uia.sysbios/package/package_ti.uia.sysbios.sem3
	-$(RM) package/lib/lib/release/ti.uia.sysbios/LoggerStreamer.sem3
	-$(RM) package/lib/lib/release/ti.uia.sysbios/LoggerStreamer2.sem3
	-$(RM) package/lib/lib/release/ti.uia.sysbios/LoggerIdle.sem3

lib/release/ti.uia.sysbios.aem3: package/lib/lib/release/ti.uia.sysbios/package/package_ti.uia.sysbios.oem3 package/lib/lib/release/ti.uia.sysbios/LoggerStreamer.oem3 package/lib/lib/release/ti.uia.sysbios/LoggerStreamer2.oem3 package/lib/lib/release/ti.uia.sysbios/LoggerIdle.oem3 lib/release/ti.uia.sysbios.aem3.mak

clean::
	-$(RM) lib/release/ti.uia.sysbios.aem3.mak
