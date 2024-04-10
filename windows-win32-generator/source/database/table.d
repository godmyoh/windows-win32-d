module database.table;

public import database.tableformat;


interface ITableSummary
{
    uint size() const;
    string name() const;
}


interface ITable(TableFormat t)
{
    uint size() const;
    uint getUint(uint rid, uint column) const;
    ushort getUshort(uint rid, uint column) const;
    const(char)[] getString(uint offset) const;
    const(ubyte)[] getBlob(uint offset) const;
}


struct RID(TableFormat t)
{
    uint value;

    bool isNull() const
    {
        return value == 0;
    }

    typeof(this) opBinary(string op : "+")(int rhs) const
    {
        return RID!t(value + rhs);
    }
}


alias TypeRefRID = RID!(TableFormat.TypeRef);
alias TypeDefRID = RID!(TableFormat.TypeDef);
alias FieldRID = RID!(TableFormat.Field);
alias MethodDefRID = RID!(TableFormat.MethodDef);
alias ParamRID = RID!(TableFormat.Param);
alias InterfaceImplRID = RID!(TableFormat.InterfaceImpl);
alias MemberRefRID = RID!(TableFormat.MemberRef);
alias ConstantRID = RID!(TableFormat.Constant);
alias CustomAttributeRID = RID!(TableFormat.CustomAttribute);
alias ClassLayoutRID = RID!(TableFormat.ClassLayout);

alias ITypeRefTable = ITable!(TableFormat.TypeRef);
alias ITypeDefTable = ITable!(TableFormat.TypeDef);
alias IFieldTable = ITable!(TableFormat.Field);
alias IMethodDefTable = ITable!(TableFormat.MethodDef);
alias IParamTable = ITable!(TableFormat.Param);
alias IInterfaceImplTable = ITable!(TableFormat.InterfaceImpl);
alias IMemberRefTable = ITable!(TableFormat.MemberRef);
alias IConstantTable = ITable!(TableFormat.Constant);
alias ICustomAttributeTable = ITable!(TableFormat.CustomAttribute);
alias IClassLayoutTable = ITable!(TableFormat.ClassLayout);
alias INestedClassTable = ITable!(TableFormat.NestedClass);
