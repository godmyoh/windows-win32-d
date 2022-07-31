module generator.resolver.interfaceresolver;

public import reader.database;
import reader.schema;


class InterfaceResolver
{
    private
    {
        Database db;
        CodedIndex!TypeDefOrRef[][] typeDefIndexToInterfaceRids;
    }

    this(Database db)
    {
        this.db = db;
        typeDefIndexToInterfaceRids.length = db.TypeDef.size;

        foreach (row; db.InterfaceImpl.getRows())
        {
            auto interfaceImpl = cast(InterfaceImplRow)row;
            auto classRid = interfaceImpl.class_;
            auto interfaceCodedIndex = interfaceImpl.interface_;
            auto classIndex = classRid - 1;
            typeDefIndexToInterfaceRids[classIndex] ~= interfaceCodedIndex;
        }
    }

    const(CodedIndex!TypeDefOrRef)[] getInterfaces(uint typeDefRid)
    {
        return typeDefIndexToInterfaceRids[typeDefRid - 1];
    }
}
