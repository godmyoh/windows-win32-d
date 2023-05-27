module generator.interfaces;

public import generator.type;
public import std.stdio : File;


interface INamespaceExtractor
{
    CLINamespace[] extract();
}


interface INamespaceToModuleMapper
{
    Module[] map(CLINamespace[] namespaces);
}


struct Module
{
    constr fqmn;
    constr namespace;
    bool isPackageModule;
}


interface IDeclarationExtractor
{
    Declaration[] extractFromTypeDef(uint typeDefRid);
}


interface IDeclarationAggregator
{
    void addIgnorableNamespace(constr cliNamespace);
    void add(Declaration decl);
    constr[] getAllDeclStrings();
    References[] getAllReferences();
    void clear();
}


struct References
{
    constr namespace;
    constr[] types;
}


interface IModuleWriter
{
    void writeModule(File f, Module m);
    void writeImports(File f, References[] references, constr[constr] namespaceToFqmn);
    void writeWindowsSpecificAttributes(File f);
    void writeDeclarations(File f, constr[] declStrings);
}
