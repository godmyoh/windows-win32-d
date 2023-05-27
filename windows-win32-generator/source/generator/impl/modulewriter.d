module generator.impl.modulewriter;

public import generator.interfaces;

import std.stdio, std.string;


class ModuleWriter : IModuleWriter
{
    override void writeModule(File f, Module m)
    {
        f.writefln("module %s;", m.fqmn);
        f.writeln;
    }

    override void writeImports(File f, References[] references, constr[constr] namespaceToFqmn)
    {
        foreach (refs; references)
        {
            auto namespace = refs.namespace;
            auto types = refs.types;

            if (auto p = namespace in namespaceToFqmn)
                f.writefln("import %s : %s;", *p, types.join(", "));
            else
                assert(0);
        }

        f.writeln;
    }

    override void writeWindowsSpecificAttributes(File f)
    {
        f.writefln("version (Windows):");
        f.writefln("extern (Windows):");
        f.writeln;
    }

    override void writeDeclarations(File f, constr[] declStrings)
    {
        foreach (str; declStrings)
        {
            f.writefln("%s", str);
        }
    }
}
