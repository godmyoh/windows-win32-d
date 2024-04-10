module database.database;

public import database.table;


interface IDatabase
{
    ITypeRefTable typeRef();
    ITypeDefTable typeDef();
    IFieldTable field();
    IMethodDefTable methodDef();
    IParamTable param();
    IInterfaceImplTable interfaceImpl();
    IMemberRefTable memberRef();
    IConstantTable constant();
    ICustomAttributeTable customAttribute();
    IClassLayoutTable classLayout();
    INestedClassTable nestedClass();
}
