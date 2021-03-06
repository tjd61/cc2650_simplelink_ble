#
#  ======== tirtos.mak ========
#

#
# Set location of various cgtools
#
# These variables can be set here or on the command line.  Paths must not
# have spaces.  If using a Windows PC, the following can be used to determine
# a directory's DOS path (path without spaces):
#
#   1.  Open a command prompt.
#   2.  Navigate (cd) into the directory.
#   2.  Enter the following command:
#         > for %I in (".") do echo %~sI
#
#  The steps above should provide you with a path similar to the following:
#     Original Path:  c:\Program Files (x86)\IAR Systems\Embedded Workbench 7.2
#     DOS Path:       c:\PROGRA~2\IARSYS~1\EMBEDD~1.2
#
#  The final step is to replace all backslashes '\' in the path with forward
#  slashes '/'.
#     Correct Path:    c:/PROGRA~2/IARSYS~1/EMBEDD~1.2
#
DEFAULT_INSTALL_DIR      ?= c:/ti
CCS_COMPILERS_DIR        ?= $(DEFAULT_INSTALL_DIR)/ccsv6/tools/compiler

#
# Enable TI-RTOS to build for CCS.
# Set CCS_BUILD to true and modify path to toolchain
#
CCS_BUILD ?= true
TI_INSTALL_DIR           ?= $(CCS_COMPILERS_DIR)
ti.targets.arm.elf.M3    ?= $(TI_INSTALL_DIR)/ti-cgt-arm_15.12.1.LTS

#
# Enable TI-RTOS to build for IAR.
# Set IAR_BUILD to true and modify path to toolchain.
#
# The IAR_INSTALL_DIR must be set to point to the
# "Embedded Workbench x.y" directory in IAR Workbench.  This path MUST NOT
# contain spaces.  If using a Windows PC, see the comments above for steps to
# get the DOS path for a directory.
#
IAR_BUILD ?= false
IAR_INSTALL_DIR          ?= c:/iar
iar.targets.arm.M3       ?= $(IAR_INSTALL_DIR)/arm

#
# Enable TI-RTOS to build for GCC.
# Set GCC_BUILD to true and modify path to toolchain
#
GCC_BUILD ?= false
GCC_INSTALL_DIR          ?= $(CCS_COMPILERS_DIR)
gnu.targets.arm.M3       ?= $(GCC_INSTALL_DIR)/gcc-arm-none-eabi-4_8-2014q3

#
# TI-RTOS and XDCTools settings
#
XDCTOOLS_INSTALL_DIR        ?= $(DEFAULT_INSTALL_DIR)/xdctools_3_32_00_06_core
export XDCTOOLS_JAVA_HOME   ?= $(DEFAULT_INSTALL_DIR)/ccsv6/eclipse/jre

TIRTOS_INSTALL_VER          ?= tirtos_cc13xx_cc26xx_2_21_00_06
TIRTOS_INSTALL_DIR          ?= $(DEFAULT_INSTALL_DIR)/$(TIRTOS_INSTALL_VER)
TIDRIVERS_INSTALL_DIR       ?= $(TIRTOS_INSTALL_DIR)/products/tidrivers_cc13xx_cc26xx_2_21_00_04
BIOS_INSTALL_DIR            ?= $(TIRTOS_INSTALL_DIR)/products/bios_6_46_01_37
UIA_INSTALL_DIR             ?= $(TIRTOS_INSTALL_DIR)/products/uia_2_01_00_01
CC13XXWARE_INSTALL_DIR      ?= $(TIRTOS_INSTALL_DIR)/products/cc13xxware_2_04_03_17272
CC26XXWARE_INSTALL_DIR      ?= $(TIRTOS_INSTALL_DIR)/products/cc26xxware_2_24_03_17272

TIRTOS_PACKAGES_DIR         ?= $(TIRTOS_INSTALL_DIR)/packages
TIDRIVERS_PACKAGES_DIR      ?= $(TIDRIVERS_INSTALL_DIR)/packages
BIOS_PACKAGES_DIR           ?= $(BIOS_INSTALL_DIR)/packages
UIA_PACKAGES_DIR            ?= $(UIA_INSTALL_DIR)/packages

#
# Set XDCARGS to some of the variables above.  XDCARGS are passed
# to the XDC build engine... which will load tirtos.bld... which will
# extract these variables and use them to determine what to build and which
# toolchains to use.
#
# Note that not all of these variables need to be set to something valid.
# Unfortunately, since these vars are unconditionally assigned, your build line
# will be longer and more noisy than necessary (e.g., it will include CC_V5T
# assignment even if you're just building for C64P).
#
# Some background is here:
#     http://rtsc.eclipse.org/docs-tip/Command_-_xdc#Environment_Variables
#
XDCARGS= \
	profile=release \
	XDCTOOLS=$(XDCTOOLS_INSTALL_DIR) \
	TIRTOS=$(TIRTOS_INSTALL_DIR) \
	TIDRIVERS=$(TIDRIVERS_INSTALL_DIR) \
	BIOS=$(BIOS_INSTALL_DIR) \
	UIA=$(UIA_INSTALL_DIR) \
	CC13XXWARE=$(CC13XXWARE_INSTALL_DIR) \
	CC26XXWARE=$(CC26XXWARE_INSTALL_DIR)

ifeq ("$(CCS_BUILD)", "true")
XDCARGS += \
	ti.targets.arm.elf.M3=$(ti.targets.arm.elf.M3)
endif
ifeq ("$(IAR_BUILD)", "true")
XDCARGS += \
	iar.targets.arm.M3=$(iar.targets.arm.M3)
endif
ifeq ("$(GCC_BUILD)", "true")
XDCARGS += \
	gnu.targets.arm.M3=$(gnu.targets.arm.M3)
endif
export XDCARGS

#
# Set XDCPATH to contain necessary repositories.
#
XDCPATH = $(TIRTOS_PACKAGES_DIR);$(TIDRIVERS_PACKAGES_DIR);$(BIOS_PACKAGES_DIR);$(UIA_PACKAGES_DIR);
export XDCPATH

#
# Set XDCOPTIONS.  Use -v for a verbose build.
#
#XDCOPTIONS=v
export XDCOPTIONS

#
# Set XDC executable command
# Note that XDCBUILDCFG points to the tirtos.bld file which uses
# the arguments specified by XDCARGS
#
XDC = $(XDCTOOLS_INSTALL_DIR)/xdc XDCARGS="$(XDCARGS)" XDCBUILDCFG=./tirtos.bld
XS = $(XDCTOOLS_INSTALL_DIR)/xs

#######################################################
## Shouldn't have to modify anything below this line ##
#######################################################

help:
	@ echo Makefile to build components within TI-RTOS
	@ echo   goal              description
	@ echo  -----------------------------------------------------------------------------
	@ echo   all               Builds SYS/BIOS, UIA, and TI-RTOS drivers
	@ echo   drivers           Builds TI-RTOS drivers and other components in /packages
	@ echo   bios              Builds SYS/BIOS
	@ echo   uia               Builds UIA
	@ echo   clean             Cleans SYS/BIOS, UIA, and TI-RTOS drivers
	@ echo   clean-drivers     Cleans TI-RTOS drivers and other components in /packages
	@ echo   clean-bios        Cleans SYS/BIOS
	@ echo   clean-uia         Cleans UIA
	@ echo   examplesgen       Generates TI-RTOS examples and makefiles
	@ echo   help              Displays this description

all: bios uia drivers product

clean: clean-uia clean-drivers clean-bios clean-product

product:
	@ echo building tirtos packages ...
	@ $(XDC) -Pr ./packages

clean-product:
	@ echo cleaning tirtos packages ...
	@ $(XDC) clean -Pr ./packages

drivers:
	@ echo building tirtos drivers...
	@ $(XDCTOOLS_INSTALL_DIR)/gmake -f $(TIDRIVERS_INSTALL_DIR)/drivers.mak \
	  XDC_INSTALL_DIR=$(XDCTOOLS_INSTALL_DIR) \
	  BIOS_INSTALL_DIR=$(BIOS_INSTALL_DIR) \
	  $(XDCARGS) -C $(TIDRIVERS_INSTALL_DIR)

clean-drivers:
	@ echo cleaning tirtos drivers...
	@ $(XDCTOOLS_INSTALL_DIR)/gmake -f $(TIDRIVERS_INSTALL_DIR)/drivers.mak \
	  XDC_INSTALL_DIR=$(XDCTOOLS_INSTALL_DIR) \
	  BIOS_INSTALL_DIR=$(BIOS_INSTALL_DIR) \
	  $(XDCARGS) -C $(TIDRIVERS_INSTALL_DIR) clean

bios:
	@ echo building bios ...
	@ $(XDCTOOLS_INSTALL_DIR)/gmake -f $(BIOS_INSTALL_DIR)/bios.mak \
	  XDC_INSTALL_DIR=$(XDCTOOLS_INSTALL_DIR) \
	  BIOS_SMPENABLED=0 \
	  $(XDCARGS) -C $(BIOS_INSTALL_DIR)

clean-bios:
	@ echo cleaning bios ...
	@ $(XDCTOOLS_INSTALL_DIR)/gmake -f $(BIOS_INSTALL_DIR)/bios.mak \
	  XDC_INSTALL_DIR=$(XDCTOOLS_INSTALL_DIR) \
	  BIOS_SMPENABLED=0 \
	  -C $(BIOS_INSTALL_DIR) clean

uia:
	@ echo building uia ...
	@ $(XDCTOOLS_INSTALL_DIR)/gmake -f $(UIA_INSTALL_DIR)/uia.mak \
	  XDC_INSTALL_DIR=$(XDCTOOLS_INSTALL_DIR) \
	  BIOS_INSTALL_DIR=$(BIOS_INSTALL_DIR) \
	  $(XDCARGS) -C $(UIA_INSTALL_DIR)

clean-uia:
	@ echo cleaning uia ...
	@ $(XDCTOOLS_INSTALL_DIR)/gmake -f $(UIA_INSTALL_DIR)/uia.mak \
	  XDC_INSTALL_DIR=$(XDCTOOLS_INSTALL_DIR) \
	  BIOS_INSTALL_DIR=$(BIOS_INSTALL_DIR) \
	  -C $(UIA_INSTALL_DIR) clean

validate-paths:
ifneq (1, $(words $(ti.targets.arm.elf.M3)))
	$(error Toolchain path must not have spaces, please update the TI_INSTALL_DIR variable.)
endif

ifneq (1, $(words $(iar.targets.arm.M3)))
	$(error Toolchain path must not have spaces, please update the IAR_INSTALL_DIR variable.)
endif

ifneq (1, $(words $(gnu.targets.arm.M3)))
	$(error Toolchain path must not have spaces, please update the GCC_INSTALL_DIR variable.)
endif

examplesgen: validate-paths
ifneq ("$(DEST)","")
	@ echo generating examples in $(DEST) ...
ifeq ("$(CCS_BUILD)", "true")
	@ $(XS) examples.examplesgen \
	    --productGroup="CC13XX_CC26XX" \
	    --toolchain="TI" \
	    --toolchainDir="$(ti.targets.arm.elf.M3)" \
	    --output="$(DEST)/examples"
endif

ifeq ("$(IAR_BUILD)", "true")
	@ $(XS) examples.examplesgen \
	    --productGroup="CC13XX_CC26XX" \
	    --toolchain="IAR" \
	    --toolchainDir="$(iar.targets.arm.M3)" \
	    --output="$(DEST)/examples"
endif

ifeq ("$(GCC_BUILD)", "true")
	@ $(XS) examples.examplesgen \
	    --productGroup="CC13XX_CC26XX" \
	    --toolchain="GNU" \
	    --toolchainDir="$(gnu.targets.arm.M3)" \
	    --output="$(DEST)/examples"
endif

	@ echo ***********************************************************
	@ echo Please refer to "Examples for TI-RTOS" section in the TI-RTOS
	@ echo "Getting Started Guide" for details on how to build and load the examples
	@ echo into IAR WorkBench and CCS.
else
	@ echo Specify destination path like this: DEST="YOURPATH". Use UNIX style path "C:/examples"
endif
