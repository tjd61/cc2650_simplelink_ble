/* 
 *  Copyright (c) 2008-2015 Texas Instruments Incorporated
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
 *  ======== genAliases ========
 *
 *  This function generates mappings of symbols from the map 'prog.$aliases'.
 */
function genAliases(prog)
{
    var res = "/* function aliases */\n";

    /* get the compiler's version */
    var targetVers = prog.build.target.version.split(',')[2] - 0;

    /* the "new" linker allows -symbol_map directives */
    var newLinker = false;
    var newLinkDiags = "";
    switch (prog.build.target.isa[0]) {
        case "2": {   /* C2000 */
            newLinker = targetVers >= 6.0 ? true : false;
            break;
        }

        case "4": {
            if (prog.build.target.isa[1] == '3') {  /* MSP430 */
                newLinker = targetVers >= 3.0 ? true : false;
                newLinkDiags =
                    "/* ignore error about def and ref in the same file */\n"
                    + "--diag_remark=10268";
            }
            break;
        }

        case "v": { /* ARM */
            newLinker = true;
            newLinkDiags =
                "/* ignore error about def and ref in the same file */\n"
                + "--diag_remark=10268";
            break;
        }

        case "6": { /* C6000 */
            newLinker = targetVers >= 6.1 ? true : false;
            newLinkDiags =
                "/* ignore error about def and ref in the same file */\n"
                + "--diag_remark=10268";
            break;
        }
        default: {
            break;
        }
    }

    if (!newLinker) {
        return ("");
    }

    res += newLinkDiags + "\n";

    for (var keys = prog.$$aliases.keys(); keys.hasMoreElements(); ) {
        var key = keys.nextElement();
        res += "--symbol_map " + prog.build.target.asmName(key) + "="
            + prog.build.target.asmName(prog.$$aliases.get(key)) + "\n";
    }

    return (res);
}


/*
 *  ======== genContributions ========
 *
 *  This function invokes getSects() for all loaded packages, and then returns
 *  the combined output.
 */
function genContributions(args)
{
    var res = "";
    for (var i = 0; i < xdc.om.$packages.length; i++) {
        var pkg = xdc.om.xdc.IPackage.Module($om.$packages[i]);

        var sectFile = pkg.getSects();
        res += "\n/* Content from " + pkg.$name + " (" + sectFile + "): */\n";
        if (sectFile) {
            var tplt = xdc.loadTemplate(sectFile);
            var bout = new java.io.ByteArrayOutputStream();
            var out = new java.io.PrintStream(bout);
            tplt.genStream(out, pkg, args);
            res += bout.toString();
        }
    }
    return (res);
}

/*
 *  ======== genElfSymbols ========
 *
 *  This function generates some additional symbols for COFF builds, which are
 *  automatically generated by the linker in ELF builds. The purpose of these
 *  symbols is to enable users relying on those symbols to use them
 *  independently from the object file format.
 */
function genElfSymbols(prog)
{
    var res = "/* Elf symbols */\n";

    /* get the compiler's version */
    var targetVers = prog.build.target.version.split(',')[2] - 0;

    /* the "new" linker allows -symbol_map directives */
    var newLinker = false;
    switch (prog.build.target.isa[0]) {
        case "2": {   /* C2000 */
            newLinker = targetVers >= 6.0 ? true : false;
            break;
        }

        case "4": {
            if (prog.build.target.isa[1] == '3') {  /* MSP430 */
                newLinker = targetVers >= 3.0 ? true : false;
            }
            break;
        }

        case "v": { /* ARM */
            newLinker = true;
            break;
        }

        case "6": { /* C6000 */
            newLinker = targetVers >= 6.1 ? true : false;
            break;
        }
        default: {
            break;
        }
    }

    if (!newLinker) {
        return ("");
    }

    res += "--symbol_map " + prog.build.target.asmName('__TI_STACK_BASE') + "="
        + prog.build.target.asmName('_stack') + "\n";
    res += "--symbol_map " + prog.build.target.asmName('__TI_STACK_SIZE') + "="
        + prog.build.target.asmName('_STACK_SIZE') + "\n";
    res += "--symbol_map " + prog.build.target.asmName('__TI_STATIC_BASE') + "="
        + prog.build.target.asmName('__bss__') + "\n";
    if (prog.build.target.isa != "430") {
        res += "--symbol_map __c_int00=_c_int00\n";
    }

    /* Newer compiler have __TI prefixed definitions */ 
    if (prog.build.target.isa.match(/430/) && targetVers < 4.2) {
        res += "--symbol_map " + prog.build.target.asmName('_cleanup_ptr')
            + "=" + prog.build.target.asmName('__TI_cleanup_ptr') + "\n";

        res += "--symbol_map " + prog.build.target.asmName('_dtors_ptr')
            + "=" + prog.build.target.asmName('__TI_dtors_ptr') + "\n";
    }

    return (res);

}

/*
 *  ======== genSections ========
 *
 *  This function generates section allocations.
 */
function genSections(prog)
{
    var res = "";

    /* the section map is constructed from the target and program info */
    var sectMap = prog.getSectMap();

    if (sectMap['xdc.meta'] == undefined) {
        sectMap['xdc.meta'] = new prog.SectionSpec(sectMap[".const"]);
        sectMap['xdc.meta'].type = "COPY";
    }

    if ("xdc.runtime" in xdc.om && xdc.om['xdc.runtime.Text'].isLoaded != true
        && sectMap['xdc.noload'] == undefined) {
        var xv = Packages.xdc.services.intern.gen.Glob.vers().substr(9, 3);
        if (xv  < "A58" || xv > "a00") {
            sectMap['xdc.noload'] = new prog.SectionSpec(sectMap[".text"]);
            sectMap['xdc.noload'].type = "COPY";
        }
    }

    if (sectMap['.args'] != undefined) {
        sectMap['.args'].loadAlign = 4;
        sectMap['.args'].runAlign = 4;
    }

    /* if the target version is 0, this is an *old* compiler/linker that
     * probably does not support splitting; we may need a more precise
     * target-specific heuristic.
     */
    var targetVers = prog.build.target.version.split(',')[2] - 0;
    var useSplit = targetVers > 0;
    var exclude = ("sectionsExclude" in prog)
                    ? new RegExp(prog.sectionsExclude): null;
    for (var sn in sectMap) {
        if (exclude != null && sn.match(exclude) != null) {
            /* don't generate this section; the user will take care of this */
            continue;
        }
        if (prog.build.target.splitMap[sn] != true) {
            res += "    " + sectLine(sectMap, sn, ">") + "\n";
        }
        else if (sn == ".args") {
            res += "    " + sectLine(sectMap, sn, ">") + ", fill = 0" 
                + " {_argsize = " + utils.toHex(prog.argSize) + "; }\n";
        }
        else {
            res += "    " + sectLine(sectMap, sn, useSplit ? ">>" : ">") + "\n";
        }
    }

    /* filter content using Program.sectionsTemplate */
    if ("sectionsTemplate" in prog && prog.sectionsTemplate != null) {
        var tplt = xdc.loadTemplate(prog.sectionsTemplate);
        var bout = new java.io.ByteArrayOutputStream();
        var out = new java.io.PrintStream(bout);
        tplt.genStream(out, prog, [sectMap, res]);
        res = bout.toString();
    }

    return (res);
}

/*
 *  ======== sectLine ========
 *  Generate a line to be placed in a linker command file for the specified
 *  section.
 */
function sectLine(sectMap, sn, split)
{

    /* map section name to a memory name */
    if (sectMap[sn] == null) {
        throw new Error("Allocation for section name '" + sn
            + "' is not defined by the program '" + prog.name
            + "' or the platform '" + Program.platformName + "'");
    }

    var map = sectMap[sn];
    var loadPart = "";
    if (map.loadSegment != null && map.loadSegment != undefined) {
        loadPart = "load " + split + " " + map.loadSegment;
        if (map.loadAlign != null && map.loadAlign != undefined) {
            loadPart = loadPart + " align = 0x" + map.loadAlign.toString(16);
        }
    }
    else if (map.loadAddress != null && map.loadAddress != undefined) {
        loadPart = "load > 0x" + map.loadAddress.toString(16);
    }

    var runPart = "";
    if (map.runSegment != null && map.runSegment != undefined) {
        runPart = "run " + split + " " + map.runSegment;
        if (map.runAlign != null && map.runAlign != undefined) {
            runPart = runPart + " align = 0x" + map.runAlign.toString(16);
        }
    }
    else if (map.runAddress != null && map.runAddress != undefined) {
        runPart = "run > 0x" + map.runAddress.toString(16);
    }

    if (sn[sn.length-1] == '}') {
        sn += " ";
    }
    else {
        sn += ": ";
    }

    var result = sn + ((loadPart != "" && runPart != "")
        ? (loadPart + ", " + runPart) : (loadPart + runPart));

    /* If both 'load' and 'run' allocations are undefined, the separator
     * between ":" and 'type' and 'fill' is empty. Otherwise, we need ",".
     */
    var separator = "";
    if (loadPart != "" || runPart != "") {
        separator = ",";
    }

    if (map.type != null && map.type != undefined) {
        result = result + separator + " type = " + map.type;
        separator = ",";
    }
    if ("fill" in map && map.fill != null && map.fill != undefined) {
        result = result + separator + " fill = 0x" + map.fill.toString(16);
    }
    return (result);
}

/*
 *  @(#) ti.targets; 1, 0, 3,0; 8-18-2016 15:55:52; /db/ztree/library/trees/xdctargets/xdctargets-l06/src/ xlibrary

 */

