module reader.valuetype;

public import reader.codedindex;
public import std.sumtype;

alias ValueType = SumType!(ElementType, CodedIndex!TypeDefOrRef);
