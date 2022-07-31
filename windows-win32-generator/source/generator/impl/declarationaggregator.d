module generator.impl.declarationaggregator;

public import generator.interfaces;
import generator.commentout;

import std.algorithm, std.array, std.range;


class DeclarationAggregator : IDeclarationAggregator
{
    private
    {
        constr[] ignorableNamespaces;
        constr[] declStrings;
        constr[][constr] namespaceToReferencedTypes;
        bool[constr] declaredNames;
    }

    override void addIgnorableNamespace(constr cliNamespace)
    {
        ignorableNamespaces ~= cliNamespace;
    }

    override void add(Declaration decl)
    {
        if (auto p = decl.declaredName in declaredNames)
        {
            declStrings ~= commentOutConflictedDecl(decl.declString);
        }
        else
        {
            declaredNames[decl.declaredName] = true;

            declStrings ~= decl.declString;
        }

        foreach (type; decl.referencedTypes)
            addReferencedTypes(type);
    }
    
    override constr[] getAllDeclStrings()
    {
        return declStrings;
    }

    override References[] getAllReferences()
    {
        return namespaceToReferencedTypes.byKey()
            .array
            .sort
            .map!(ns => References(ns, namespaceToReferencedTypes[ns]))
            .array;
    }

    override void clear()
    {
        ignorableNamespaces.length = 0;
        declStrings.length = 0;
        namespaceToReferencedTypes = null;
        declaredNames = null;
    }

    private void addReferencedTypes(CLIType type)
    {
        if (isIgnorable(type.namespace))
            return;

        if (auto p = type.namespace in namespaceToReferencedTypes)
        {
            auto types = assumeSorted(*p);
            if (!types.contains(type.typeName))
                *p = (*p ~ type.typeName).sort.array;
        }
        else
        {
            namespaceToReferencedTypes[type.namespace] = [type.typeName];
        }
    }

    private bool isIgnorable(constr cliNamespace)
    {
        return ignorableNamespaces.any!(ns => ns == cliNamespace);
    }
}
