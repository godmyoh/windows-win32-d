module generator.patch.declarationaggregator;

public import generator.interfaces;
public import generator.patch.patchstatus;
import generator.commentout;

import std.algorithm, std.array, std.string, std.path;


class DeclarationAggregatorPatch : IDeclarationAggregator
{
    private
    {
        PatchStatus patchStatus;
        IDeclarationAggregator wrappee;

        enum PatchNames
        {
            httpVersion = "HTTP_VERSION",
        }
    }

    this(PatchStatus patchStatus, IDeclarationAggregator wrappee)
    {
        this.patchStatus = patchStatus;
        this.wrappee = wrappee;

        patchStatus.addPatchName(PatchNames.httpVersion);
    }

    override void addIgnorableNamespace(constr cliNamespace)
    {
        wrappee.addIgnorableNamespace(cliNamespace);
    }

    override void add(Declaration decl)
    {
        foreach (refType; decl.referencedTypes)
        {
            auto ns = refType.namespace;
            if (ns.startsWith("Windows.Win32.") || refType == CLIType_Guid)
            {
                // allowed
            }
            else
            {
                decl.declString = commentOutUnsupportedDecl(decl.declString);
                break;
            }
        }

        if (decl.declaredName == "HTTP_VERSION" && decl.declString.startsWith("enum"))
        {
            decl.declaredName ~= "[CONFLICT]";
            decl.declString = commentOutConflictedDecl(decl.declString);

            patchStatus.logExecuted(PatchNames.httpVersion);
        }

        wrappee.add(decl);
    }

    override constr[] getAllDeclStrings()
    {
        return wrappee.getAllDeclStrings();
    }

    override References[] getAllReferences()
    {
        return wrappee.getAllReferences();
    }

    override void clear()
    {
        wrappee.clear();
    }
}
