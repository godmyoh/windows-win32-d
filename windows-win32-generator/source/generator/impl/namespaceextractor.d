module generator.impl.namespaceextractor;

public import generator.interfaces;

public import reader.database;
import reader.schema;

import std.algorithm, std.array;


class NamespaceExtractor : INamespaceExtractor
{
    private
    {
        Database db;
    }

    this(Database db)
    {
        this.db = db;
    }

    override CLINamespace[] extract()
    {
        CLINamespace[constr] map;

        foreach (typeDef; db.TypeDef.getRows())
        {
            auto name = typeDef.typeName;
            auto namespace = typeDef.typeNamespace;
            auto rid = typeDef.rid;

            // II.22.37 TypeDef : 0x02
            // The first row of the TypeDef table represents the pseudo class that acts as parent for functions and variables defined at module scope.
            if (rid == 1)
            {
                assert(name == "<Module>");
                assert(namespace == "");

                continue;
            }

            // Anonymous struct/union
            if (namespace == "")
                continue;

            if (auto p = namespace in map)
            {
                (*p).typeDefRids ~= rid;
            }
            else
            {
                auto info = new CLINamespace;
                info.namespace = namespace;
                info.typeDefRids = [rid];
                map[namespace] = info;
            }
        }

        auto orderedNamespaces = map.byKey.array.sort.array;

        CLINamespace[] namespaces;
        namespaces.length = map.length;

        foreach (i, ref namespace; namespaces)
        {
            namespace = map[orderedNamespaces[i]];
        }

        return namespaces;
    }
}
