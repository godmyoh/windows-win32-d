module generator.patch.declarationaggregator;

public import generator.interfaces;
import generator.commentout;

import std.algorithm, std.array, std.string, std.path;


class DeclarationAggregatorPatch : IDeclarationAggregator
{
    private
    {
        IDeclarationAggregator wrappee;
    }

    this(IDeclarationAggregator wrappee)
    {
        this.wrappee = wrappee;
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
