module generator.impl.namespacetomodulemapper;

public import generator.interfaces;

import std.algorithm, std.string;


class NamespaceToModuleMapper : INamespaceToModuleMapper
{
    override constr[] map(CLINamespace[] namespaces)
    {
        constr[] fqmns;
        fqmns.length = namespaces.length;

        // assume ordered
        foreach (i, namespace; namespaces)
        {
            auto ns = namespace.namespace;

            // Avoid module name conflicts
            if (i + 1 < namespaces.length)
            {
                auto nextNs = namespaces[i + 1].namespace;

                if (nextNs.startsWith(ns) && ns.length < nextNs.length && nextNs[ns.length] == '.')
                {
                    fqmns[i] = ns.toLower.sanitizeKeywords ~ "_";
                    continue;
                }
            }

            fqmns[i] = ns.toLower.sanitizeKeywords;
        }

        return fqmns;
    }

}

string[string] keywordsMap;

static this()
{
    keywordsMap =
    [
        "debug": "debug_",
        ];
}

private constr sanitizeKeywords(constr fqmn)
{
    foreach (item; fqmn.splitter('.'))
    {
        if (auto p = item in keywordsMap)
        {
            return replaceKeywords(fqmn);
        }
    }

    return fqmn;
}

private constr replaceKeywords(constr fqmn)
{
    constr result;
    foreach (item; fqmn.splitter('.'))
    {
        if (!result.empty)
            result ~= ".";

        if (auto p = item in keywordsMap)
            result ~= *p;
        else
            result ~= item;
    }
    return result;
}
