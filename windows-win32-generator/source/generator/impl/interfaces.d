module generator.impl.interfaces;

public import generator.type;


interface IDlangTypeResolver
{
    constr toDlangType(CLIType cliType, bool isConst = false);
}
