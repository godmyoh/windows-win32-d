module app;

import wiringboard;

import std.file;
import std.process;


int main()
{
    auto outDir = r"..\windows-win32\source";

    if (outDir.exists)
        rmdirRecurse(outDir);

    auto g = buildGenerator(outDir);
    g.execute();

    execute(["xcopy", ".\\handmade", outDir, "/S", "/Y"]);

    return 0;
}
