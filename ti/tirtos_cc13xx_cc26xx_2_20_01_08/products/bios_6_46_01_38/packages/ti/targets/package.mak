#
#  Do not edit this file.  This file is generated from 
#  package.bld.  Any modifications to this file will be 
#  overwritten whenever makefiles are re-generated.
#

unexport MAKEFILE_LIST
MK_NOGENDEPS := $(filter clean,$(MAKECMDGOALS))
override PKGDIR = ti/targets
XDCINCS = -I. -I$(strip $(subst ;, -I,$(subst $(space),\$(space),$(XPKGPATH))))
XDCCFGDIR = package/cfg/

#
# The following dependencies ensure package.mak is rebuilt
# in the event that some included BOM script changes.
#
ifneq (clean,$(MAKECMDGOALS))
/db/rtree/library/trees/xdcprod/xdcprod-v06/product/xdccore/Linux/xdctools_3_32_00_06_core/packages/xdc/utils.js:
package.mak: /db/rtree/library/trees/xdcprod/xdcprod-v06/product/xdccore/Linux/xdctools_3_32_00_06_core/packages/xdc/utils.js
/db/rtree/library/trees/xdcprod/xdcprod-v06/product/xdccore/Linux/xdctools_3_32_00_06_core/packages/xdc/xdc.tci:
package.mak: /db/rtree/library/trees/xdcprod/xdcprod-v06/product/xdccore/Linux/xdctools_3_32_00_06_core/packages/xdc/xdc.tci
/db/rtree/library/trees/xdcprod/xdcprod-v06/product/xdccore/Linux/xdctools_3_32_00_06_core/packages/xdc/template.xs:
package.mak: /db/rtree/library/trees/xdcprod/xdcprod-v06/product/xdccore/Linux/xdctools_3_32_00_06_core/packages/xdc/template.xs
/db/rtree/library/trees/xdcprod/xdcprod-v06/product/xdccore/Linux/xdctools_3_32_00_06_core/packages/xdc/om2.xs:
package.mak: /db/rtree/library/trees/xdcprod/xdcprod-v06/product/xdccore/Linux/xdctools_3_32_00_06_core/packages/xdc/om2.xs
/db/rtree/library/trees/xdcprod/xdcprod-v06/product/xdccore/Linux/xdctools_3_32_00_06_core/packages/xdc/xmlgen.xs:
package.mak: /db/rtree/library/trees/xdcprod/xdcprod-v06/product/xdccore/Linux/xdctools_3_32_00_06_core/packages/xdc/xmlgen.xs
/db/rtree/library/trees/xdcprod/xdcprod-v06/product/xdccore/Linux/xdctools_3_32_00_06_core/packages/xdc/xmlgen2.xs:
package.mak: /db/rtree/library/trees/xdcprod/xdcprod-v06/product/xdccore/Linux/xdctools_3_32_00_06_core/packages/xdc/xmlgen2.xs
/db/rtree/library/trees/xdcprod/xdcprod-v06/product/xdccore/Linux/xdctools_3_32_00_06_core/packages/xdc/Warnings.xs:
package.mak: /db/rtree/library/trees/xdcprod/xdcprod-v06/product/xdccore/Linux/xdctools_3_32_00_06_core/packages/xdc/Warnings.xs
/db/rtree/library/trees/xdcprod/xdcprod-v06/product/xdccore/Linux/xdctools_3_32_00_06_core/packages/xdc/IPackage.xs:
package.mak: /db/rtree/library/trees/xdcprod/xdcprod-v06/product/xdccore/Linux/xdctools_3_32_00_06_core/packages/xdc/IPackage.xs
/db/rtree/library/trees/xdcprod/xdcprod-v06/product/xdccore/Linux/xdctools_3_32_00_06_core/packages/xdc/package.xs:
package.mak: /db/rtree/library/trees/xdcprod/xdcprod-v06/product/xdccore/Linux/xdctools_3_32_00_06_core/packages/xdc/package.xs
/db/rtree/library/trees/xdcprod/xdcprod-v06/product/xdccore/Linux/xdctools_3_32_00_06_core/packages/xdc/services/global/Clock.xs:
package.mak: /db/rtree/library/trees/xdcprod/xdcprod-v06/product/xdccore/Linux/xdctools_3_32_00_06_core/packages/xdc/services/global/Clock.xs
/db/rtree/library/trees/xdcprod/xdcprod-v06/product/xdccore/Linux/xdctools_3_32_00_06_core/packages/xdc/services/global/Trace.xs:
package.mak: /db/rtree/library/trees/xdcprod/xdcprod-v06/product/xdccore/Linux/xdctools_3_32_00_06_core/packages/xdc/services/global/Trace.xs
/db/rtree/library/trees/xdcprod/xdcprod-v06/product/xdccore/Linux/xdctools_3_32_00_06_core/packages/xdc/bld/bld.js:
package.mak: /db/rtree/library/trees/xdcprod/xdcprod-v06/product/xdccore/Linux/xdctools_3_32_00_06_core/packages/xdc/bld/bld.js
/db/rtree/library/trees/xdcprod/xdcprod-v06/product/xdccore/Linux/xdctools_3_32_00_06_core/packages/xdc/bld/BuildEnvironment.xs:
package.mak: /db/rtree/library/trees/xdcprod/xdcprod-v06/product/xdccore/Linux/xdctools_3_32_00_06_core/packages/xdc/bld/BuildEnvironment.xs
/db/rtree/library/trees/xdcprod/xdcprod-v06/product/xdccore/Linux/xdctools_3_32_00_06_core/packages/xdc/bld/PackageContents.xs:
package.mak: /db/rtree/library/trees/xdcprod/xdcprod-v06/product/xdccore/Linux/xdctools_3_32_00_06_core/packages/xdc/bld/PackageContents.xs
/db/rtree/library/trees/xdcprod/xdcprod-v06/product/xdccore/Linux/xdctools_3_32_00_06_core/packages/xdc/bld/_gen.xs:
package.mak: /db/rtree/library/trees/xdcprod/xdcprod-v06/product/xdccore/Linux/xdctools_3_32_00_06_core/packages/xdc/bld/_gen.xs
/db/rtree/library/trees/xdcprod/xdcprod-v06/product/xdccore/Linux/xdctools_3_32_00_06_core/packages/xdc/bld/Library.xs:
package.mak: /db/rtree/library/trees/xdcprod/xdcprod-v06/product/xdccore/Linux/xdctools_3_32_00_06_core/packages/xdc/bld/Library.xs
/db/rtree/library/trees/xdcprod/xdcprod-v06/product/xdccore/Linux/xdctools_3_32_00_06_core/packages/xdc/bld/Executable.xs:
package.mak: /db/rtree/library/trees/xdcprod/xdcprod-v06/product/xdccore/Linux/xdctools_3_32_00_06_core/packages/xdc/bld/Executable.xs
/db/rtree/library/trees/xdcprod/xdcprod-v06/product/xdccore/Linux/xdctools_3_32_00_06_core/packages/xdc/bld/Repository.xs:
package.mak: /db/rtree/library/trees/xdcprod/xdcprod-v06/product/xdccore/Linux/xdctools_3_32_00_06_core/packages/xdc/bld/Repository.xs
/db/rtree/library/trees/xdcprod/xdcprod-v06/product/xdccore/Linux/xdctools_3_32_00_06_core/packages/xdc/bld/Configuration.xs:
package.mak: /db/rtree/library/trees/xdcprod/xdcprod-v06/product/xdccore/Linux/xdctools_3_32_00_06_core/packages/xdc/bld/Configuration.xs
/db/rtree/library/trees/xdcprod/xdcprod-v06/product/xdccore/Linux/xdctools_3_32_00_06_core/packages/xdc/bld/Script.xs:
package.mak: /db/rtree/library/trees/xdcprod/xdcprod-v06/product/xdccore/Linux/xdctools_3_32_00_06_core/packages/xdc/bld/Script.xs
/db/rtree/library/trees/xdcprod/xdcprod-v06/product/xdccore/Linux/xdctools_3_32_00_06_core/packages/xdc/bld/Manifest.xs:
package.mak: /db/rtree/library/trees/xdcprod/xdcprod-v06/product/xdccore/Linux/xdctools_3_32_00_06_core/packages/xdc/bld/Manifest.xs
/db/rtree/library/trees/xdcprod/xdcprod-v06/product/xdccore/Linux/xdctools_3_32_00_06_core/packages/xdc/bld/Utils.xs:
package.mak: /db/rtree/library/trees/xdcprod/xdcprod-v06/product/xdccore/Linux/xdctools_3_32_00_06_core/packages/xdc/bld/Utils.xs
/db/rtree/library/trees/xdcprod/xdcprod-v06/product/xdccore/Linux/xdctools_3_32_00_06_core/packages/xdc/bld/ITarget.xs:
package.mak: /db/rtree/library/trees/xdcprod/xdcprod-v06/product/xdccore/Linux/xdctools_3_32_00_06_core/packages/xdc/bld/ITarget.xs
/db/rtree/library/trees/xdcprod/xdcprod-v06/product/xdccore/Linux/xdctools_3_32_00_06_core/packages/xdc/bld/ITarget2.xs:
package.mak: /db/rtree/library/trees/xdcprod/xdcprod-v06/product/xdccore/Linux/xdctools_3_32_00_06_core/packages/xdc/bld/ITarget2.xs
/db/rtree/library/trees/xdcprod/xdcprod-v06/product/xdccore/Linux/xdctools_3_32_00_06_core/packages/xdc/bld/ITarget3.xs:
package.mak: /db/rtree/library/trees/xdcprod/xdcprod-v06/product/xdccore/Linux/xdctools_3_32_00_06_core/packages/xdc/bld/ITarget3.xs
/db/rtree/library/trees/xdcprod/xdcprod-v06/product/xdccore/Linux/xdctools_3_32_00_06_core/packages/xdc/bld/ITargetFilter.xs:
package.mak: /db/rtree/library/trees/xdcprod/xdcprod-v06/product/xdccore/Linux/xdctools_3_32_00_06_core/packages/xdc/bld/ITargetFilter.xs
/db/rtree/library/trees/xdcprod/xdcprod-v06/product/xdccore/Linux/xdctools_3_32_00_06_core/packages/xdc/bld/package.xs:
package.mak: /db/rtree/library/trees/xdcprod/xdcprod-v06/product/xdccore/Linux/xdctools_3_32_00_06_core/packages/xdc/bld/package.xs
/db/vtree/library/trees/zumaprod/zumaprod-n08/exports/tirtos_cc13xx_cc26xx_2_20_01_08/products/bios_6_46_01_38/bios.bld:
package.mak: /db/vtree/library/trees/zumaprod/zumaprod-n08/exports/tirtos_cc13xx_cc26xx_2_20_01_08/products/bios_6_46_01_38/bios.bld
package.mak: ITarget.xs
package.mak: C28_large.xs
package.mak: C28_float.xs
package.mak: package.xs
/db/vtree/library/trees/zumaprod/zumaprod-n08/exports/tirtos_cc13xx_cc26xx_2_20_01_08/products/bios_6_46_01_38/packages/ti/targets/arm/elf/IArm.xs:
package.mak: /db/vtree/library/trees/zumaprod/zumaprod-n08/exports/tirtos_cc13xx_cc26xx_2_20_01_08/products/bios_6_46_01_38/packages/ti/targets/arm/elf/IArm.xs
/db/vtree/library/trees/zumaprod/zumaprod-n08/exports/tirtos_cc13xx_cc26xx_2_20_01_08/products/bios_6_46_01_38/packages/ti/targets/arm/elf/package.xs:
package.mak: /db/vtree/library/trees/zumaprod/zumaprod-n08/exports/tirtos_cc13xx_cc26xx_2_20_01_08/products/bios_6_46_01_38/packages/ti/targets/arm/elf/package.xs
/db/vtree/library/trees/zumaprod/zumaprod-n08/exports/tirtos_cc13xx_cc26xx_2_20_01_08/products/bios_6_46_01_38/packages/gnu/targets/ITarget.xs:
package.mak: /db/vtree/library/trees/zumaprod/zumaprod-n08/exports/tirtos_cc13xx_cc26xx_2_20_01_08/products/bios_6_46_01_38/packages/gnu/targets/ITarget.xs
/db/vtree/library/trees/zumaprod/zumaprod-n08/exports/tirtos_cc13xx_cc26xx_2_20_01_08/products/bios_6_46_01_38/packages/gnu/targets/_utils.xs:
package.mak: /db/vtree/library/trees/zumaprod/zumaprod-n08/exports/tirtos_cc13xx_cc26xx_2_20_01_08/products/bios_6_46_01_38/packages/gnu/targets/_utils.xs
/db/vtree/library/trees/zumaprod/zumaprod-n08/exports/tirtos_cc13xx_cc26xx_2_20_01_08/products/bios_6_46_01_38/packages/gnu/targets/Linux86.xs:
package.mak: /db/vtree/library/trees/zumaprod/zumaprod-n08/exports/tirtos_cc13xx_cc26xx_2_20_01_08/products/bios_6_46_01_38/packages/gnu/targets/Linux86.xs
/db/vtree/library/trees/zumaprod/zumaprod-n08/exports/tirtos_cc13xx_cc26xx_2_20_01_08/products/bios_6_46_01_38/packages/gnu/targets/Mingw.xs:
package.mak: /db/vtree/library/trees/zumaprod/zumaprod-n08/exports/tirtos_cc13xx_cc26xx_2_20_01_08/products/bios_6_46_01_38/packages/gnu/targets/Mingw.xs
/db/vtree/library/trees/zumaprod/zumaprod-n08/exports/tirtos_cc13xx_cc26xx_2_20_01_08/products/bios_6_46_01_38/packages/gnu/targets/package.xs:
package.mak: /db/vtree/library/trees/zumaprod/zumaprod-n08/exports/tirtos_cc13xx_cc26xx_2_20_01_08/products/bios_6_46_01_38/packages/gnu/targets/package.xs
/db/vtree/library/trees/zumaprod/zumaprod-n08/exports/tirtos_cc13xx_cc26xx_2_20_01_08/products/bios_6_46_01_38/packages/gnu/targets/arm/ITarget.xs:
package.mak: /db/vtree/library/trees/zumaprod/zumaprod-n08/exports/tirtos_cc13xx_cc26xx_2_20_01_08/products/bios_6_46_01_38/packages/gnu/targets/arm/ITarget.xs
/db/vtree/library/trees/zumaprod/zumaprod-n08/exports/tirtos_cc13xx_cc26xx_2_20_01_08/products/bios_6_46_01_38/packages/gnu/targets/arm/GCArmv6.xs:
package.mak: /db/vtree/library/trees/zumaprod/zumaprod-n08/exports/tirtos_cc13xx_cc26xx_2_20_01_08/products/bios_6_46_01_38/packages/gnu/targets/arm/GCArmv6.xs
/db/vtree/library/trees/zumaprod/zumaprod-n08/exports/tirtos_cc13xx_cc26xx_2_20_01_08/products/bios_6_46_01_38/packages/gnu/targets/arm/GCArmv7A.xs:
package.mak: /db/vtree/library/trees/zumaprod/zumaprod-n08/exports/tirtos_cc13xx_cc26xx_2_20_01_08/products/bios_6_46_01_38/packages/gnu/targets/arm/GCArmv7A.xs
/db/vtree/library/trees/zumaprod/zumaprod-n08/exports/tirtos_cc13xx_cc26xx_2_20_01_08/products/bios_6_46_01_38/packages/gnu/targets/arm/IM.xs:
package.mak: /db/vtree/library/trees/zumaprod/zumaprod-n08/exports/tirtos_cc13xx_cc26xx_2_20_01_08/products/bios_6_46_01_38/packages/gnu/targets/arm/IM.xs
/db/vtree/library/trees/zumaprod/zumaprod-n08/exports/tirtos_cc13xx_cc26xx_2_20_01_08/products/bios_6_46_01_38/packages/gnu/targets/arm/M3.xs:
package.mak: /db/vtree/library/trees/zumaprod/zumaprod-n08/exports/tirtos_cc13xx_cc26xx_2_20_01_08/products/bios_6_46_01_38/packages/gnu/targets/arm/M3.xs
/db/vtree/library/trees/zumaprod/zumaprod-n08/exports/tirtos_cc13xx_cc26xx_2_20_01_08/products/bios_6_46_01_38/packages/gnu/targets/arm/M4.xs:
package.mak: /db/vtree/library/trees/zumaprod/zumaprod-n08/exports/tirtos_cc13xx_cc26xx_2_20_01_08/products/bios_6_46_01_38/packages/gnu/targets/arm/M4.xs
/db/vtree/library/trees/zumaprod/zumaprod-n08/exports/tirtos_cc13xx_cc26xx_2_20_01_08/products/bios_6_46_01_38/packages/gnu/targets/arm/M4F.xs:
package.mak: /db/vtree/library/trees/zumaprod/zumaprod-n08/exports/tirtos_cc13xx_cc26xx_2_20_01_08/products/bios_6_46_01_38/packages/gnu/targets/arm/M4F.xs
/db/vtree/library/trees/zumaprod/zumaprod-n08/exports/tirtos_cc13xx_cc26xx_2_20_01_08/products/bios_6_46_01_38/packages/gnu/targets/arm/A8F.xs:
package.mak: /db/vtree/library/trees/zumaprod/zumaprod-n08/exports/tirtos_cc13xx_cc26xx_2_20_01_08/products/bios_6_46_01_38/packages/gnu/targets/arm/A8F.xs
/db/vtree/library/trees/zumaprod/zumaprod-n08/exports/tirtos_cc13xx_cc26xx_2_20_01_08/products/bios_6_46_01_38/packages/gnu/targets/arm/A9F.xs:
package.mak: /db/vtree/library/trees/zumaprod/zumaprod-n08/exports/tirtos_cc13xx_cc26xx_2_20_01_08/products/bios_6_46_01_38/packages/gnu/targets/arm/A9F.xs
/db/vtree/library/trees/zumaprod/zumaprod-n08/exports/tirtos_cc13xx_cc26xx_2_20_01_08/products/bios_6_46_01_38/packages/gnu/targets/arm/A15F.xs:
package.mak: /db/vtree/library/trees/zumaprod/zumaprod-n08/exports/tirtos_cc13xx_cc26xx_2_20_01_08/products/bios_6_46_01_38/packages/gnu/targets/arm/A15F.xs
/db/vtree/library/trees/zumaprod/zumaprod-n08/exports/tirtos_cc13xx_cc26xx_2_20_01_08/products/bios_6_46_01_38/packages/gnu/targets/arm/A53F.xs:
package.mak: /db/vtree/library/trees/zumaprod/zumaprod-n08/exports/tirtos_cc13xx_cc26xx_2_20_01_08/products/bios_6_46_01_38/packages/gnu/targets/arm/A53F.xs
/db/vtree/library/trees/zumaprod/zumaprod-n08/exports/tirtos_cc13xx_cc26xx_2_20_01_08/products/bios_6_46_01_38/packages/gnu/targets/arm/package.xs:
package.mak: /db/vtree/library/trees/zumaprod/zumaprod-n08/exports/tirtos_cc13xx_cc26xx_2_20_01_08/products/bios_6_46_01_38/packages/gnu/targets/arm/package.xs
/db/vtree/library/trees/zumaprod/zumaprod-n08/exports/tirtos_cc13xx_cc26xx_2_20_01_08/products/bios_6_46_01_38/packages/iar/targets/arm/ITarget.xs:
package.mak: /db/vtree/library/trees/zumaprod/zumaprod-n08/exports/tirtos_cc13xx_cc26xx_2_20_01_08/products/bios_6_46_01_38/packages/iar/targets/arm/ITarget.xs
/db/vtree/library/trees/zumaprod/zumaprod-n08/exports/tirtos_cc13xx_cc26xx_2_20_01_08/products/bios_6_46_01_38/packages/iar/targets/arm/package.xs:
package.mak: /db/vtree/library/trees/zumaprod/zumaprod-n08/exports/tirtos_cc13xx_cc26xx_2_20_01_08/products/bios_6_46_01_38/packages/iar/targets/arm/package.xs
package.mak: package.bld
endif

all,em3 clean,em3 .libraries,em3 .dlls,em3 .executables,em3 test,em3:;
all,m3g clean,m3g .libraries,m3g .dlls,m3g .executables,m3g test,m3g:;
all,rm3 clean,rm3 .libraries,rm3 .dlls,rm3 .executables,rm3 test,rm3:;

all: .executables 
.executables: .libraries .dlls
.libraries: .interfaces

PKGCFGS := $(wildcard package.xs) package/build.cfg
.interfaces: package/package.xdc.inc package/package.defs.h package.xdc $(PKGCFGS)

-include package/package.xdc.dep
package/%.xdc.inc package/%_ti.targets.c package/%.defs.h: %.xdc $(PKGCFGS)
	@$(MSG) generating interfaces for package ti.targets" (because $@ is older than $(firstword $?))" ...
	$(XSRUN) -f xdc/services/intern/cmd/build.xs $(MK_IDLOPTS) -m package/package.xdc.dep -i package/package.xdc.inc package.xdc

ifeq (,$(MK_NOGENDEPS))
-include package/package.cfg.dep
endif

package/package.cfg.xdc.inc: .interfaces $(XDCROOT)/packages/xdc/cfg/cfginc.js package.xdc
	@$(MSG) generating schema include file list ...
	$(CONFIG) -f $(XDCROOT)/packages/xdc/cfg/cfginc.js ti.targets $@

test:;
%,copy:
	@$(if $<,,$(MSG) don\'t know how to build $*; exit 1)
	@$(MSG) cp $< $@
	$(RM) $@
	$(CP) $< $@

$(XDCCFGDIR)%.c $(XDCCFGDIR)%.h $(XDCCFGDIR)%.xdl: $(XDCCFGDIR)%.cfg $(XDCROOT)/packages/xdc/cfg/Main.xs | .interfaces
	@$(MSG) "configuring $(_PROG_NAME) from $< ..."
	$(CONFIG) $(_PROG_XSOPTS) xdc.cfg $(_PROG_NAME) $(XDCCFGDIR)$*.cfg $(XDCCFGDIR)$*

.PHONY: release,ti_targets
ifeq (,$(MK_NOGENDEPS))
-include package/rel/ti_targets.tar.dep
-include package/rel/ti_targets.tar.rcl.dep
endif
package/rel/ti_targets/ti/targets/package/package.rel.xml: package/package.bld.xml
package/rel/ti_targets/ti/targets/package/package.rel.xml: package/build.cfg
package/rel/ti_targets/ti/targets/package/package.rel.xml: package/package.xdc.inc
package/rel/ti_targets/ti/targets/package/package.rel.xml: ccs_exec.xdt
package/rel/ti_targets/ti/targets/package/package.rel.xml: linkcmd.xdt
package/rel/ti_targets/ti/targets/package/package.rel.xml: linkUtils.xs
package/rel/ti_targets/ti/targets/package/package.rel.xml: std.h
package/rel/ti_targets/ti/targets/package/package.rel.xml: ccs_package.xdt
package/rel/ti_targets/ti/targets/package/package.rel.xml: ccs_start.bat
package/rel/ti_targets/ti/targets/package/package.rel.xml: ccs_start.pl
package/rel/ti_targets/ti/targets/package/package.rel.xml: package/package.cfg.xdc.inc
package/rel/ti_targets/ti/targets/package/package.rel.xml: .force
	@$(MSG) generating external release references $@ ...
	$(XS) $(JSENV) -f $(XDCROOT)/packages/xdc/bld/rel.js $(MK_RELOPTS) . $@

ti_targets.tar: package/rel/ti_targets.xdc.inc package/rel/ti_targets/ti/targets/package/package.rel.xml
	@$(MSG) making release file $@ "(because of $(firstword $?))" ...
	-$(RM) $@
	$(call MKRELTAR,package/rel/ti_targets.xdc.inc,package/rel/ti_targets.tar.dep, ./local.rel)


release release,ti_targets: all ti_targets.tar
clean:: .clean
	-$(RM) ti_targets.tar
	-$(RM) package/rel/ti_targets.xdc.inc
	-$(RM) package/rel/ti_targets.tar.dep

clean:: .clean
	-$(RM) .libraries $(wildcard .libraries,*)
clean:: 
	-$(RM) .dlls $(wildcard .dlls,*)
#
# The following clean rule removes user specified
# generated files or directories.
#
	-$(RMDIR) lib/

ifneq (clean,$(MAKECMDGOALS))
ifeq (,$(wildcard package))
    $(shell $(MKDIR) package)
endif
ifeq (,$(wildcard package/cfg))
    $(shell $(MKDIR) package/cfg)
endif
ifeq (,$(wildcard package/lib))
    $(shell $(MKDIR) package/lib)
endif
ifeq (,$(wildcard package/rel))
    $(shell $(MKDIR) package/rel)
endif
ifeq (,$(wildcard package/internal))
    $(shell $(MKDIR) package/internal)
endif
endif
clean::
	-$(RMDIR) package


