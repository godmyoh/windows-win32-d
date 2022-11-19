module generator.patch.modulewriter;

public import generator.interfaces;
import generator.commentout;

import std.algorithm, std.array, std.string, std.path;


class ModuleWriterPatch : IModuleWriter
{
    private
    {
        IModuleWriter wrappee;

        struct Patch
        {
            bool delegate(constr decl) condition;
            constr delegate(constr decl) operation;
        }

        Patch[][string] patches;
    }

    this(IModuleWriter wrappee)
    {
        this.wrappee = wrappee;
        this.patches = buildPatchesForDecls();
    }

    override void writeModule(File f, constr fqmn)
    {
        wrappee.writeModule(f, fqmn);
    }

    override void writeImports(File f, References[] references, constr[constr] namespaceToFqmn)
    {
        // System.Guid -> windows.win32.guid.GUID

        namespaceToFqmn["System"] = "windows.win32.guid";

        foreach (ref refs; references)
        {
            if (refs.namespace == "System")
            {
                assert(refs.types.length == 1);
                assert(refs.types[0] == "Guid");

                refs.types[0] = "GUID";
            }
        }


        // Exclude Windows.UI, ...

        if (references.all!(r => r.namespace.startsWith("Windows.Win32.") || (r.namespace == "System")))
            wrappee.writeImports(f, references, namespaceToFqmn);
        else
        {
            References[] filtered = references.filter!(r => r.namespace.startsWith("Windows.Win32.") || (r.namespace == "System")).array;
            wrappee.writeImports(f, filtered, namespaceToFqmn);
        }
    }

    void writeWindowsSpecificAttributes(File f)
    {
        wrappee.writeWindowsSpecificAttributes(f);
    }

    void writeDeclarations(File f, constr[] declStrings)
    {
        auto filename = baseName(f.name);

        if (auto p = filename in patches)
        {
            foreach (patch; *p)
            {
                foreach (ref decl; declStrings)
                {
                    if (patch.condition(decl))
                        decl = patch.operation(decl);
                }
            }
        }

        foreach (ref decl; declStrings)
        {
            if (decl.startsWith("alias ") && decl.indexOf("\n") == -1 && decl.indexOf("function") == -1)
            {
                auto tokens = decl.split(' ');
                auto type = tokens[1];
                if ((type.startsWith("H") && type != "HRESULT") || type == "CreatedHDC")
                {
                    tokens[3] = "void*;";
                    decl = tokens.join(" ");
                }
            }
        }

        wrappee.writeDeclarations(f, declStrings);
    }

    private auto buildPatchesForDecls()
    {
        Patch[][string] patches;

        alias P = Patch;
        patches[r"foundation.d"] = [
            P((d) => d == "alias PSTR = ubyte*;", (d) => "alias PSTR = char*;"),
            ];
        patches[r"qos.d"] = [
            P((d) => d.startsWith("struct IPX_PATTERN"), (d) => commentOutUnsupportedDecl(d)),
            ];
        patches[r"winml.d"] = [
            P((d) => d.startsWith("alias MLOperatorAttributeType"), (d) => removeFirstLine(d).replace("enum", "enum MLOperatorAttributeType")),
            P((d) => d.startsWith("alias MLOperatorTensorDataType"), (d) => removeFirstLine(d).replace("enum", "enum MLOperatorTensorDataType")),
            P((d) => d.startsWith("alias MLOperatorEdgeType"), (d) => removeFirstLine(d).replace("enum", "enum MLOperatorEdgeType")),
        ];
        patches[r"kernelstreaming.d"] = [
            P((d) => d.startsWith("alias KSCAMERA_EXTENDEDPROP_VALUE"), (d) => d = "// [UNSUPPORTED]\n//" ~ d ~ "\nalias KSCAMERA_EXTENDEDPROP_VALUE = ulong; // [DUMMY]"),
            ];

        auto abiBugWorkaround = delegate constr(constr d)
        {
            return d.replace("D2D_SIZE_F GetSize();", "void GetSize(D2D_SIZE_F*); // ABI bug workaround")
                .replace("D2D_SIZE_U GetPixelSize();", "void GetPixelSize(D2D_SIZE_U*); // ABI bug workaround")
                .replace("D2D1_PIXEL_FORMAT GetPixelFormat();", "void GetPixelFormat(D2D1_PIXEL_FORMAT*); // ABI bug workaround");
        };

        patches[r"direct2d_.d"] = [
            P((d) => d.startsWith("interface ID2D1Bitmap "), abiBugWorkaround),
            P((d) => d.startsWith("interface ID2D1RenderTarget "), abiBugWorkaround),
        ];

        return patches;
    }
}

private constr removeFirstLine(constr decl)
{
    findSkip(decl, "\n");
    return decl;
}
