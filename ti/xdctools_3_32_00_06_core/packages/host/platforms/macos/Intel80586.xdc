/* 
 *  Copyright (c) 2008 Texas Instruments and others.
 *  All rights reserved. This program and the accompanying materials
 *  are made available under the terms of the Eclipse Public License v1.0
 *  which accompanies this distribution, and is available at
 *  http://www.eclipse.org/legal/epl-v10.html
 * 
 *  Contributors:
 *      Texas Instruments - initial implementation
 * 
 * */
/*
 *  ======== Intel80586.xdc. ========
 */

/*!
 *  ======== Intel80586 ========
 *  Pentium device data sheet module.
 *
 *  This module provides basic data suitable for Intel Pentium based
 *  native builds.
 */
metaonly module Intel80586 inherits xdc.platform.ICpuDataSheet
{
instance:    
    override config string cpuCore	    = "586";
    override config string cpuCoreRevision   = "1.0";
    override config int    minProgUnitSize   = 1;
    override config int    minDataUnitSize   = 1;
    override config int    dataWordSize	    = 4;

    /*!
     *  ======== memMap ========
     *  The memory map returned be getMemeoryMap().
     */
    config xdc.platform.IPlatform.Memory memMap[string] = [];
}
/*
 *  @(#) host.platforms.macos; 1, 0, 0,0; 12-9-2015 17:34:40; /db/ztree/library/trees/xdc/xdc-B06/src/packages/
 */

