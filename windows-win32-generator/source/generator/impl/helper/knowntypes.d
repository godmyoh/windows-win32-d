module generator.impl.helper.knowntypes;

import database.database;
import database.schema;


class KnownTypes
{
    private
    {
        CodedIndex!CustomAttributeType _guidAttribute;
        CodedIndex!CustomAttributeType _constantAttribute;
        CodedIndex!CustomAttributeType _constAttribute;
        CodedIndex!TypeDefOrRef _systemEnum;
        CodedIndex!TypeDefOrRef _systemMulticastDelegate;
    }

    this(IDatabase db)
    {
        bool guidFound, constantFound, constFound;

        foreach (memberRef; db.memberRef.getRows())
        {
            const(char)[] typeName;

            auto memberClass = memberRef.class_;
            if (memberClass.type == MemberRefParent.TypeDef)
            {
                auto typeDef = db.typeDef.getRowByRid(TypeDefRID(memberClass.index));
                typeName = typeDef.typeName;
            }
            else if (memberClass.type == MemberRefParent.TypeRef)
            {
                auto typeRef = db.typeRef.getRowByRid(TypeRefRID(memberClass.index));
                typeName = typeRef.typeName;
            }
            else
            {
                assert(0);
            }

            if (typeName == "GuidAttribute")
            {
                assert(!guidFound);
                _guidAttribute = toCodedIndex(memberRef);
                guidFound = true;
            }
            else if (typeName == "ConstantAttribute")
            {
                assert(!constantFound);
                _constantAttribute = toCodedIndex(memberRef);
                constantFound = true;
            }
            else if (typeName == "ConstAttribute")
            {
                assert(!constFound);
                _constAttribute = toCodedIndex(memberRef);
                constFound = true;
            }
        }

        assert(guidFound);
        assert(constantFound);
        assert(constFound);

        bool enumFound, multicastDelegateFound;

        foreach (typeRef; db.typeRef.getRows())
        {
            if ((typeRef.typeName == "Enum") & (typeRef.typeNamespace == "System"))
            {
                assert(!enumFound);
                _systemEnum = CodedIndex!TypeDefOrRef(TypeDefOrRef.TypeRef, typeRef.rid.value);
                enumFound = true;
            }
            else if ((typeRef.typeName == "MulticastDelegate") & (typeRef.typeNamespace == "System"))
            {
                assert(!multicastDelegateFound);
                _systemMulticastDelegate = CodedIndex!TypeDefOrRef(TypeDefOrRef.TypeRef, typeRef.rid.value);
                multicastDelegateFound = true;
            }
        }

        assert(enumFound);
        assert(multicastDelegateFound);
    }

    private auto toCodedIndex(MemberRefRow row)
    {
        return CodedIndex!CustomAttributeType(CustomAttributeType.MemberRef, row.rid.value);
    }

    auto guidAttribute() const => _guidAttribute;
    auto constantAttribute() const => _constantAttribute;
    auto constAttribute() const => _constAttribute;
    auto systemEnum() const => _systemEnum;
    auto systemMulticastDelegate() const => _systemMulticastDelegate;
}
