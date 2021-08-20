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
 *  ======== genElfSymbols ========
 *
 *  This function generates some additional symbols for Arm ELF builds, which
 *  are automatically generated by the linker in C6x ELF builds. The purpose
 *  of adding these symbols here is to enable users relying on those symbols
 *  to use them independently from the object file format.
 */
function genElfSymbols(prog)
{
    var res = "/* C6x Elf symbols */\n";

    res += "--symbol_map __TI_STACK_SIZE=__STACK_SIZE\n";
    res += "--symbol_map __TI_STACK_BASE=__stack\n";
    res += "--symbol_map _stack=__stack\n";

    return (res);
}
/*
 *  @(#) ti.targets.arm.elf; 1, 0, 0,0; 8-18-2016 15:55:54; /db/ztree/library/trees/xdctargets/xdctargets-l06/src/ xlibrary

 */

