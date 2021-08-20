
Sensor Controller Studio Basics Tutorial - I2C Light Sensor Project Troubleshooting
====================================================================================


Before compiling
--------------------
As described in the tutorial "Sensor Controller Studio Basics", you must first
generate the Sensor Controller Studio example project and output files
under: `C:/ti/scs_academy/`


Sensor Controller framework
-------------------
Also make sure to generate the driver files in SCS before you compile the
project, as these files are used by the CCS project:
 - scif.c
 - scif.h
 - scif_framework.c
 - scif_framework.h
 - scif_osal_tirtos.c
 - scif_osal_tirtos.h


Debugger connection
--------------------
If using the CC-DEVPACK-DEBUG (xds-110), remember to go to project properties
ALT+ENTER and select XDS110 in the Connection drop down menu.