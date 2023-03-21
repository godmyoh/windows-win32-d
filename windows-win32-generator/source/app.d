module app;

import wiringboard;

import generator.patch.patchstatus;

import std.file;
import std.process;
import std.stdio;


int main()
{
    auto outDir = r"..\windows-win32\source";

    if (outDir.exists)
        rmdirRecurse(outDir);

    PatchStatus patchStatus = new PatchStatus();

    auto g = buildGenerator(outDir, patchStatus);
    g.execute();

    execute(["xcopy", ".\\handmade", outDir, "/S", "/Y"]);

    if (patchStatus.hasDanglingPatch)
    {
        writefln("%s", patchStatus.report());
    }

    return 0;
}
