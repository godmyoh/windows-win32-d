module database.type.valuetype;

public import database.type.codedindex;
public import std.sumtype;

alias ValueType = SumType!(ElementType, CodedIndex!TypeDefOrRef);
