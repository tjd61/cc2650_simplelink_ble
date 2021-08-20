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
requires xdc.platform;

/*!
 *  ======== host.platform.PC ========
 *  Platform package for the PC platform.
 *
 *  This package implements the interfaces (xdc.platform.IPlatform) necessary
 *  to build and run executables on a PC platform.  This platform supports
 *  multiple host operating systems; Linux, Windows, etc.
 */
package host.platforms.PC [1,0,0] {
    module Platform;
    module Intel80586;
}
/*
 *  @(#) host.platforms.PC; 1, 0, 0,0; 12-9-2015 17:34:12; /db/ztree/library/trees/xdc/xdc-B06/src/packages/
 */

