# invoke SourceDir generated makefile for flash_debug.pem3
flash_debug.pem3: .libraries,flash_debug.pem3
.libraries,flash_debug.pem3: package/cfg/flash_debug_pem3.xdl
	$(MAKE) -f C:\ti\CCWORK~1\TI-RTO~1/src/makefile.libs

clean::
	$(MAKE) -f C:\ti\CCWORK~1\TI-RTO~1/src/makefile.libs clean

