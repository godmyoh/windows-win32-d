module app;

import wiringboard;

import generator.patch.patchstatus;

import std.file;
import std.process;
import std.stdio;


int main(string[] args)
{
    if (args.length > 1 && args[1] == "inspect")
        return buildInteractiveInspector().execute();

    ConflictedModuleNaming mode = ConflictedModuleNaming.usePackageModule;

    if (args.length > 1 && args[1] == "appendUnderscore")
        mode = ConflictedModuleNaming.appendUnderscore;

    auto outDir = r"..\windows-win32\source";

    if (outDir.exists)
        rmdirRecurse(outDir);

    PatchStatus patchStatus = new PatchStatus();

    auto g = buildGenerator(outDir, patchStatus, mode);
    g.execute();

    execute(["xcopy", ".\\handmade", outDir, "/S", "/Y"]);

    if (patchStatus.hasDanglingPatch)
    {
        writefln("%s", patchStatus.report());
    }

    return 0;
}
