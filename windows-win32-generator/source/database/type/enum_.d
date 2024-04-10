module database.type.enum_;


enum TypeDefOrRef
{
    TypeDef,
    TypeRef,
    TypeSpec,
}


enum HasConstant
{
    Field,
    Param,
    Property,
}


enum HasCustomAttribute
{
    MethodDef,
    Field,
    TypeRef,
    TypeDef,
    Param,
    InterfaceImpl,
    MemberRef,
    Module,
    Permission,
    Property,
    Event,
    StandAloneSig,
    ModuleRef,
    TypeSpec,
    Assembly,
    AssemblyRef,
    File,
    ExportedType,
    ManifestResource,
    GenericParam,
    GenericParamConstraint,
    MethodSpec,
}

static assert(HasCustomAttribute.MethodSpec == 21);


enum MemberRefParent
{
    TypeDef = 0,
    TypeRef = 1,
    ModuleRef = 2,
    MethodDef = 3,
    TypeSpec = 4,
}


enum CustomAttributeType
{
    MethodDef = 2,
    MemberRef = 3,
}


enum ResolutionScope
{
    Module,
    ModuleRef,
    AssemblyRef,
    TypeRef,
}


enum CallingConvention
{
    Default = 0x00,
    VarArg = 0x05,
    Field = 0x06,
    LocalSig = 0x07,
    Property = 0x08,
    GenericInst = 0x10,
    Mask = 0x0f,

    HasThis = 0x20,
    ExplicitThis = 0x40,
    Generic = 0x10,
}


// I.8.2.2 Built-in value and reference types
// II.23.1.16 Element types used in signatures
enum ElementType
{
    End = 0x00, // Sentinel value

    Void = 0x01,
    Boolean = 0x02,
    Char = 0x03,
    I1 = 0x04,
    U1 = 0x05,
    I2 = 0x06,
    U2 = 0x07,
    I4 = 0x08,
    U4 = 0x09,
    I8 = 0x0a,
    U8 = 0x0b,
    R4 = 0x0c,
    R8 = 0x0d,
    String = 0x0e,

    Ptr = 0x0f, // Followed by TypeSig
    ByRef = 0x10, // Followed by TypeSig
    ValueType = 0x11, // Followed by TypeDef or TypeRef
    Class = 0x12, // Followed by TypeDef or TypeRef
    Var = 0x13, // Generic parameter in a type definition, represented as unsigned integer
    Array = 0x14,
    GenericInst = 0x15,
    TypedByRef = 0x16,

    I = 0x18, // System.IntPtr
    U = 0x19, // System.UIntPtr

    FnPtr = 0x1b, // Followed by full method signature
    Object = 0x1c, // System.Object
    SZArray = 0x1d,
    MVar = 0x1e, // Generic parameter in a method definition, represented as unsigned integer
    CModReqd = 0x1f, // Required modifier, followed by a TypeDef or TypeRef
    CModOpt = 0x20, // Optional modifier, followed by a TypeDef or TypeRef
    Internal = 0x21,

    Modifier = 0x40, // Or'd with folowing element types
    Sentinel = 0x41, // Sentinel for vararg method signature

    Pinned = 0x45,

    Type = 0x50, // System.Type
    TaggedObject = 0x51, // Boxed object (in custom attributes)
    Field = 0x53, // Custom attribute field
    Property = 0x54, // Custom attribute property
    Enum = 0x55, // Custom attribute enum
}
