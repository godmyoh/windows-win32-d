module generator.generator;

public import generator.interfaces;

import std.array, std.stdio, std.string, std.path, std.file;


class Win32ModuleGenerator
{
    private
    {
        string outDir;
        INamespaceExtractor namespaceExtractor;
        INamespaceToModuleMapper namespaceToModuleMapper;
        IDeclarationExtractor declarationExtractor;
        IDeclarationAggregator declarationAggregator;
        IModuleWriter moduleWriter;
    }

    this(string outDir,
         INamespaceExtractor namespaceExtractor,
         INamespaceToModuleMapper namespaceToModuleMapper,
         IDeclarationExtractor declarationExtractor,
         IDeclarationAggregator declarationAggregator,
         IModuleWriter moduleWriter)
    {
        this.outDir = outDir;
        this.namespaceExtractor = namespaceExtractor;
        this.namespaceToModuleMapper = namespaceToModuleMapper;
        this.declarationExtractor = declarationExtractor;
        this.declarationAggregator = declarationAggregator;
        this.moduleWriter = moduleWriter;
    }

    void execute()
    {
        auto namespaces = namespaceExtractor.extract();
        auto modules = namespaceToModuleMapper.map(namespaces);
        auto namespaceToFqmn = createMap(namespaces, modules);

        foreach (i, m; modules)
        {
            auto namespace = namespaces[i];

            declarationAggregator.clear();
            declarationAggregator.addIgnorableNamespace(namespace.namespace);

            foreach (typeDefRid; namespace.typeDefRids)
            {
                auto decls = declarationExtractor.extractFromTypeDef(typeDefRid);

                foreach (decl; decls)
                    declarationAggregator.add(decl);
            }

            auto filePath = moduleToFile(m);
            mkdirRecurse(dirName(filePath));

            auto f = File(filePath, "w");

            moduleWriter.writeModule(f, m);
            moduleWriter.writeImports(f, declarationAggregator.getAllReferences(), namespaceToFqmn);
            moduleWriter.writeWindowsSpecificAttributes(f);
            moduleWriter.writeDeclarations(f, declarationAggregator.getAllDeclStrings());
        }
    }

    private constr[constr] createMap(CLINamespace[] namespaces, constr[] fqmns)
    {
        constr[constr] result;

        foreach (i, fqmn; fqmns)
        {
            result[namespaces[i].namespace] = fqmn;
        }

        return result;
    }

    private constr moduleToFile(constr fqmn)
    {
        return buildPath(outDir, fqmn.replace(".", "\\") ~ ".d");
    }
}
