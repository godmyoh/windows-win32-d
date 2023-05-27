module windows.win32.system.wmi;

import windows.win32.guid : GUID;
import windows.win32.foundation : BOOL, BSTR, HRESULT, PWSTR, VARIANT_BOOL;
import windows.win32.system.com : IDispatch, IUnknown, SAFEARRAY;
import windows.win32.system.variant : VARIANT;

version (Windows):
extern (Windows):

MI_Result MI_Application_InitializeV1(uint, const(ushort)*, MI_Instance**, MI_Application*);
enum MI_FLAG_ANY = 0x0000007f;
enum MI_FLAG_VERSION = 0x1c000000;
enum MI_FLAG_ADOPT = 0x80000000;
enum MI_CHAR_TYPE = 0x00000002;
enum MI_FLAG_CLASS = 0x00000001;
enum MI_FLAG_METHOD = 0x00000002;
enum MI_FLAG_PROPERTY = 0x00000004;
enum MI_FLAG_PARAMETER = 0x00000008;
enum MI_FLAG_ASSOCIATION = 0x00000010;
enum MI_FLAG_INDICATION = 0x00000020;
enum MI_FLAG_REFERENCE = 0x00000040;
enum MI_FLAG_ENABLEOVERRIDE = 0x00000080;
enum MI_FLAG_DISABLEOVERRIDE = 0x00000100;
enum MI_FLAG_RESTRICTED = 0x00000200;
enum MI_FLAG_TOSUBCLASS = 0x00000400;
enum MI_FLAG_TRANSLATABLE = 0x00000800;
enum MI_FLAG_KEY = 0x00001000;
enum MI_FLAG_IN = 0x00002000;
enum MI_FLAG_OUT = 0x00004000;
enum MI_FLAG_REQUIRED = 0x00008000;
enum MI_FLAG_STATIC = 0x00010000;
enum MI_FLAG_ABSTRACT = 0x00020000;
enum MI_FLAG_TERMINAL = 0x00040000;
enum MI_FLAG_EXPENSIVE = 0x00080000;
enum MI_FLAG_STREAM = 0x00100000;
enum MI_FLAG_READONLY = 0x00200000;
enum MI_FLAG_EXTENDED = 0x00001000;
enum MI_FLAG_NOT_MODIFIED = 0x02000000;
enum MI_FLAG_NULL = 0x20000000;
enum MI_FLAG_BORROW = 0x40000000;
enum MI_MODULE_FLAG_STANDARD_QUALIFIERS = 0x00000001;
enum MI_MODULE_FLAG_DESCRIPTIONS = 0x00000002;
enum MI_MODULE_FLAG_VALUES = 0x00000004;
enum MI_MODULE_FLAG_MAPPING_STRINGS = 0x00000008;
enum MI_MODULE_FLAG_BOOLEANS = 0x00000010;
enum MI_MODULE_FLAG_CPLUSPLUS = 0x00000020;
enum MI_MODULE_FLAG_LOCALIZED = 0x00000040;
enum MI_MODULE_FLAG_FILTER_SUPPORT = 0x00000080;
enum MI_MAX_LOCALE_SIZE = 0x00000080;
enum MI_WRITEMESSAGE_CHANNEL_WARNING = 0x00000000;
enum MI_WRITEMESSAGE_CHANNEL_VERBOSE = 0x00000001;
enum MI_WRITEMESSAGE_CHANNEL_DEBUG = 0x00000002;
enum MI_CALL_VERSION = 0x00000001;
enum MI_OPERATIONFLAGS_MANUAL_ACK_RESULTS = 0x00000001;
enum MI_OPERATIONFLAGS_NO_RTTI = 0x00000400;
enum MI_OPERATIONFLAGS_BASIC_RTTI = 0x00000002;
enum MI_OPERATIONFLAGS_STANDARD_RTTI = 0x00000800;
enum MI_OPERATIONFLAGS_FULL_RTTI = 0x00000004;
enum MI_OPERATIONFLAGS_DEFAULT_RTTI = 0x00000000;
enum MI_OPERATIONFLAGS_LOCALIZED_QUALIFIERS = 0x00000008;
enum MI_OPERATIONFLAGS_EXPENSIVE_PROPERTIES = 0x00000040;
enum MI_OPERATIONFLAGS_POLYMORPHISM_SHALLOW = 0x00000080;
enum MI_OPERATIONFLAGS_POLYMORPHISM_DEEP_BASE_PROPS_ONLY = 0x00000180;
enum MI_OPERATIONFLAGS_REPORT_OPERATION_STARTED = 0x00000200;
enum MI_SUBSCRIBE_BOOKMARK_OLDEST = "MI_SUBSCRIBE_BOOKMARK_OLDEST";
enum MI_SUBSCRIBE_BOOKMARK_NEWEST = "MI_SUBSCRIBE_BOOKMARK_NEWEST";
enum MI_SERIALIZER_FLAGS_CLASS_DEEP = 0x00000001;
enum MI_SERIALIZER_FLAGS_INSTANCE_WITH_CLASS = 0x00000001;
enum WBEMS_DISPID_DERIVATION = 0x00000017;
enum WBEMS_DISPID_OBJECT_READY = 0x00000001;
enum WBEMS_DISPID_COMPLETED = 0x00000002;
enum WBEMS_DISPID_PROGRESS = 0x00000003;
enum WBEMS_DISPID_OBJECT_PUT = 0x00000004;
enum WBEMS_DISPID_CONNECTION_READY = 0x00000005;
enum WBEM_NO_WAIT = 0x00000000;
enum WBEM_INFINITE = 0xffffffffffffffff;
alias MI_Module_Self = long;
alias MI_Result = int;
enum : int
{
    MI_RESULT_OK                                  = 0x00000000,
    MI_RESULT_FAILED                              = 0x00000001,
    MI_RESULT_ACCESS_DENIED                       = 0x00000002,
    MI_RESULT_INVALID_NAMESPACE                   = 0x00000003,
    MI_RESULT_INVALID_PARAMETER                   = 0x00000004,
    MI_RESULT_INVALID_CLASS                       = 0x00000005,
    MI_RESULT_NOT_FOUND                           = 0x00000006,
    MI_RESULT_NOT_SUPPORTED                       = 0x00000007,
    MI_RESULT_CLASS_HAS_CHILDREN                  = 0x00000008,
    MI_RESULT_CLASS_HAS_INSTANCES                 = 0x00000009,
    MI_RESULT_INVALID_SUPERCLASS                  = 0x0000000a,
    MI_RESULT_ALREADY_EXISTS                      = 0x0000000b,
    MI_RESULT_NO_SUCH_PROPERTY                    = 0x0000000c,
    MI_RESULT_TYPE_MISMATCH                       = 0x0000000d,
    MI_RESULT_QUERY_LANGUAGE_NOT_SUPPORTED        = 0x0000000e,
    MI_RESULT_INVALID_QUERY                       = 0x0000000f,
    MI_RESULT_METHOD_NOT_AVAILABLE                = 0x00000010,
    MI_RESULT_METHOD_NOT_FOUND                    = 0x00000011,
    MI_RESULT_NAMESPACE_NOT_EMPTY                 = 0x00000014,
    MI_RESULT_INVALID_ENUMERATION_CONTEXT         = 0x00000015,
    MI_RESULT_INVALID_OPERATION_TIMEOUT           = 0x00000016,
    MI_RESULT_PULL_HAS_BEEN_ABANDONED             = 0x00000017,
    MI_RESULT_PULL_CANNOT_BE_ABANDONED            = 0x00000018,
    MI_RESULT_FILTERED_ENUMERATION_NOT_SUPPORTED  = 0x00000019,
    MI_RESULT_CONTINUATION_ON_ERROR_NOT_SUPPORTED = 0x0000001a,
    MI_RESULT_SERVER_LIMITS_EXCEEDED              = 0x0000001b,
    MI_RESULT_SERVER_IS_SHUTTING_DOWN             = 0x0000001c,
}

alias MI_ErrorCategory = int;
enum : int
{
    MI_ERRORCATEGORY_NOT_SPECIFIED        = 0x00000000,
    MI_ERRORCATEGORY_OPEN_ERROR           = 0x00000001,
    MI_ERRORCATEGORY_CLOS_EERROR          = 0x00000002,
    MI_ERRORCATEGORY_DEVICE_ERROR         = 0x00000003,
    MI_ERRORCATEGORY_DEADLOCK_DETECTED    = 0x00000004,
    MI_ERRORCATEGORY_INVALID_ARGUMENT     = 0x00000005,
    MI_ERRORCATEGORY_INVALID_DATA         = 0x00000006,
    MI_ERRORCATEGORY_INVALID_OPERATION    = 0x00000007,
    MI_ERRORCATEGORY_INVALID_RESULT       = 0x00000008,
    MI_ERRORCATEGORY_INVALID_TYPE         = 0x00000009,
    MI_ERRORCATEGORY_METADATA_ERROR       = 0x0000000a,
    MI_ERRORCATEGORY_NOT_IMPLEMENTED      = 0x0000000b,
    MI_ERRORCATEGORY_NOT_INSTALLED        = 0x0000000c,
    MI_ERRORCATEGORY_OBJECT_NOT_FOUND     = 0x0000000d,
    MI_ERRORCATEGORY_OPERATION_STOPPED    = 0x0000000e,
    MI_ERRORCATEGORY_OPERATION_TIMEOUT    = 0x0000000f,
    MI_ERRORCATEGORY_SYNTAX_ERROR         = 0x00000010,
    MI_ERRORCATEGORY_PARSER_ERROR         = 0x00000011,
    MI_ERRORCATEGORY_ACCESS_DENIED        = 0x00000012,
    MI_ERRORCATEGORY_RESOURCE_BUSY        = 0x00000013,
    MI_ERRORCATEGORY_RESOURCE_EXISTS      = 0x00000014,
    MI_ERRORCATEGORY_RESOURCE_UNAVAILABLE = 0x00000015,
    MI_ERRORCATEGORY_READ_ERROR           = 0x00000016,
    MI_ERRORCATEGORY_WRITE_ERROR          = 0x00000017,
    MI_ERRORCATEGORY_FROM_STDERR          = 0x00000018,
    MI_ERRORCATEGORY_SECURITY_ERROR       = 0x00000019,
    MI_ERRORCATEGORY_PROTOCOL_ERROR       = 0x0000001a,
    MI_ERRORCATEGORY_CONNECTION_ERROR     = 0x0000001b,
    MI_ERRORCATEGORY_AUTHENTICATION_ERROR = 0x0000001c,
    MI_ERRORCATEGORY_LIMITS_EXCEEDED      = 0x0000001d,
    MI_ERRORCATEGORY_QUOTA_EXCEEDED       = 0x0000001e,
    MI_ERRORCATEGORY_NOT_ENABLED          = 0x0000001f,
}

alias MI_PromptType = int;
enum : int
{
    MI_PROMPTTYPE_NORMAL   = 0x00000000,
    MI_PROMPTTYPE_CRITICAL = 0x00000001,
}

alias MI_CallbackMode = int;
enum : int
{
    MI_CALLBACKMODE_REPORT  = 0x00000000,
    MI_CALLBACKMODE_INQUIRE = 0x00000001,
    MI_CALLBACKMODE_IGNORE  = 0x00000002,
}

alias MI_ProviderArchitecture = int;
enum : int
{
    MI_PROVIDER_ARCHITECTURE_32BIT = 0x00000000,
    MI_PROVIDER_ARCHITECTURE_64BIT = 0x00000001,
}

alias MI_Type = int;
enum : int
{
    MI_BOOLEAN    = 0x00000000,
    MI_UINT8      = 0x00000001,
    MI_SINT8      = 0x00000002,
    MI_UINT16     = 0x00000003,
    MI_SINT16     = 0x00000004,
    MI_UINT32     = 0x00000005,
    MI_SINT32     = 0x00000006,
    MI_UINT64     = 0x00000007,
    MI_SINT64     = 0x00000008,
    MI_REAL32     = 0x00000009,
    MI_REAL64     = 0x0000000a,
    MI_CHAR16     = 0x0000000b,
    MI_DATETIME   = 0x0000000c,
    MI_STRING     = 0x0000000d,
    MI_REFERENCE  = 0x0000000e,
    MI_INSTANCE   = 0x0000000f,
    MI_BOOLEANA   = 0x00000010,
    MI_UINT8A     = 0x00000011,
    MI_SINT8A     = 0x00000012,
    MI_UINT16A    = 0x00000013,
    MI_SINT16A    = 0x00000014,
    MI_UINT32A    = 0x00000015,
    MI_SINT32A    = 0x00000016,
    MI_UINT64A    = 0x00000017,
    MI_SINT64A    = 0x00000018,
    MI_REAL32A    = 0x00000019,
    MI_REAL64A    = 0x0000001a,
    MI_CHAR16A    = 0x0000001b,
    MI_DATETIMEA  = 0x0000001c,
    MI_STRINGA    = 0x0000001d,
    MI_REFERENCEA = 0x0000001e,
    MI_INSTANCEA  = 0x0000001f,
    MI_ARRAY      = 0x00000010,
}

struct MI_Timestamp
{
    uint year;
    uint month;
    uint day;
    uint hour;
    uint minute;
    uint second;
    uint microseconds;
    int utc;
}
struct MI_Interval
{
    uint days;
    uint hours;
    uint minutes;
    uint seconds;
    uint microseconds;
    uint __padding1;
    uint __padding2;
    uint __padding3;
}
struct MI_Datetime
{
    uint isTimestamp;
    union _u_e__Union
    {
        MI_Timestamp timestamp;
        MI_Interval interval;
    }
}
struct MI_BooleanA
{
    ubyte* data;
    uint size;
}
struct MI_Uint8A
{
    ubyte* data;
    uint size;
}
struct MI_Sint8A
{
    byte* data;
    uint size;
}
struct MI_Uint16A
{
    ushort* data;
    uint size;
}
struct MI_Sint16A
{
    short* data;
    uint size;
}
struct MI_Uint32A
{
    uint* data;
    uint size;
}
struct MI_Sint32A
{
    int* data;
    uint size;
}
struct MI_Uint64A
{
    ulong* data;
    uint size;
}
struct MI_Sint64A
{
    long* data;
    uint size;
}
struct MI_Real32A
{
    float* data;
    uint size;
}
struct MI_Real64A
{
    double* data;
    uint size;
}
struct MI_Char16A
{
    ushort* data;
    uint size;
}
struct MI_DatetimeA
{
    MI_Datetime* data;
    uint size;
}
struct MI_StringA
{
    ushort** data;
    uint size;
}
struct MI_ReferenceA
{
    MI_Instance** data;
    uint size;
}
struct MI_InstanceA
{
    MI_Instance** data;
    uint size;
}
struct MI_Array
{
    void* data;
    uint size;
}
struct MI_ConstBooleanA
{
    const(ubyte)* data;
    uint size;
}
struct MI_ConstUint8A
{
    const(ubyte)* data;
    uint size;
}
struct MI_ConstSint8A
{
    const(byte)* data;
    uint size;
}
struct MI_ConstUint16A
{
    const(ushort)* data;
    uint size;
}
struct MI_ConstSint16A
{
    const(short)* data;
    uint size;
}
struct MI_ConstUint32A
{
    const(uint)* data;
    uint size;
}
struct MI_ConstSint32A
{
    const(int)* data;
    uint size;
}
struct MI_ConstUint64A
{
    const(ulong)* data;
    uint size;
}
struct MI_ConstSint64A
{
    const(long)* data;
    uint size;
}
struct MI_ConstReal32A
{
    const(float)* data;
    uint size;
}
struct MI_ConstReal64A
{
    const(double)* data;
    uint size;
}
struct MI_ConstChar16A
{
    const(ushort)* data;
    uint size;
}
struct MI_ConstDatetimeA
{
    const(MI_Datetime)* data;
    uint size;
}
struct MI_ConstStringA
{
    const(ushort)** data;
    uint size;
}
struct MI_ConstReferenceA
{
    const(MI_Instance)** data;
    uint size;
}
struct MI_ConstInstanceA
{
    const(MI_Instance)** data;
    uint size;
}
union MI_Value
{
    ubyte boolean;
    ubyte uint8;
    byte sint8;
    ushort uint16;
    short sint16;
    uint uint32;
    int sint32;
    ulong uint64;
    long sint64;
    float real32;
    double real64;
    ushort char16;
    MI_Datetime datetime;
    ushort* string;
    MI_Instance* instance;
    MI_Instance* reference;
    MI_BooleanA booleana;
    MI_Uint8A uint8a;
    MI_Sint8A sint8a;
    MI_Uint16A uint16a;
    MI_Sint16A sint16a;
    MI_Uint32A uint32a;
    MI_Sint32A sint32a;
    MI_Uint64A uint64a;
    MI_Sint64A sint64a;
    MI_Real32A real32a;
    MI_Real64A real64a;
    MI_Char16A char16a;
    MI_DatetimeA datetimea;
    MI_StringA stringa;
    MI_ReferenceA referencea;
    MI_InstanceA instancea;
    MI_Array array;
}
struct MI_BooleanField
{
    ubyte value;
    ubyte exists;
    ubyte flags;
}
struct MI_Sint8Field
{
    byte value;
    ubyte exists;
    ubyte flags;
}
struct MI_Uint8Field
{
    ubyte value;
    ubyte exists;
    ubyte flags;
}
struct MI_Sint16Field
{
    short value;
    ubyte exists;
    ubyte flags;
}
struct MI_Uint16Field
{
    ushort value;
    ubyte exists;
    ubyte flags;
}
struct MI_Sint32Field
{
    int value;
    ubyte exists;
    ubyte flags;
}
struct MI_Uint32Field
{
    uint value;
    ubyte exists;
    ubyte flags;
}
struct MI_Sint64Field
{
    long value;
    ubyte exists;
    ubyte flags;
}
struct MI_Uint64Field
{
    ulong value;
    ubyte exists;
    ubyte flags;
}
struct MI_Real32Field
{
    float value;
    ubyte exists;
    ubyte flags;
}
struct MI_Real64Field
{
    double value;
    ubyte exists;
    ubyte flags;
}
struct MI_Char16Field
{
    ushort value;
    ubyte exists;
    ubyte flags;
}
struct MI_DatetimeField
{
    MI_Datetime value;
    ubyte exists;
    ubyte flags;
}
struct MI_StringField
{
    ushort* value;
    ubyte exists;
    ubyte flags;
}
struct MI_ReferenceField
{
    MI_Instance* value;
    ubyte exists;
    ubyte flags;
}
struct MI_InstanceField
{
    MI_Instance* value;
    ubyte exists;
    ubyte flags;
}
struct MI_BooleanAField
{
    MI_BooleanA value;
    ubyte exists;
    ubyte flags;
}
struct MI_Uint8AField
{
    MI_Uint8A value;
    ubyte exists;
    ubyte flags;
}
struct MI_Sint8AField
{
    MI_Sint8A value;
    ubyte exists;
    ubyte flags;
}
struct MI_Uint16AField
{
    MI_Uint16A value;
    ubyte exists;
    ubyte flags;
}
struct MI_Sint16AField
{
    MI_Sint16A value;
    ubyte exists;
    ubyte flags;
}
struct MI_Uint32AField
{
    MI_Uint32A value;
    ubyte exists;
    ubyte flags;
}
struct MI_Sint32AField
{
    MI_Sint32A value;
    ubyte exists;
    ubyte flags;
}
struct MI_Uint64AField
{
    MI_Uint64A value;
    ubyte exists;
    ubyte flags;
}
struct MI_Sint64AField
{
    MI_Sint64A value;
    ubyte exists;
    ubyte flags;
}
struct MI_Real32AField
{
    MI_Real32A value;
    ubyte exists;
    ubyte flags;
}
struct MI_Real64AField
{
    MI_Real64A value;
    ubyte exists;
    ubyte flags;
}
struct MI_Char16AField
{
    MI_Char16A value;
    ubyte exists;
    ubyte flags;
}
struct MI_DatetimeAField
{
    MI_DatetimeA value;
    ubyte exists;
    ubyte flags;
}
struct MI_StringAField
{
    MI_StringA value;
    ubyte exists;
    ubyte flags;
}
struct MI_ReferenceAField
{
    MI_ReferenceA value;
    ubyte exists;
    ubyte flags;
}
struct MI_InstanceAField
{
    MI_InstanceA value;
    ubyte exists;
    ubyte flags;
}
struct MI_ArrayField
{
    MI_Array value;
    ubyte exists;
    ubyte flags;
}
struct MI_ConstBooleanField
{
    ubyte value;
    ubyte exists;
    ubyte flags;
}
struct MI_ConstSint8Field
{
    byte value;
    ubyte exists;
    ubyte flags;
}
struct MI_ConstUint8Field
{
    ubyte value;
    ubyte exists;
    ubyte flags;
}
struct MI_ConstSint16Field
{
    short value;
    ubyte exists;
    ubyte flags;
}
struct MI_ConstUint16Field
{
    ushort value;
    ubyte exists;
    ubyte flags;
}
struct MI_ConstSint32Field
{
    int value;
    ubyte exists;
    ubyte flags;
}
struct MI_ConstUint32Field
{
    uint value;
    ubyte exists;
    ubyte flags;
}
struct MI_ConstSint64Field
{
    long value;
    ubyte exists;
    ubyte flags;
}
struct MI_ConstUint64Field
{
    ulong value;
    ubyte exists;
    ubyte flags;
}
struct MI_ConstReal32Field
{
    float value;
    ubyte exists;
    ubyte flags;
}
struct MI_ConstReal64Field
{
    double value;
    ubyte exists;
    ubyte flags;
}
struct MI_ConstChar16Field
{
    ushort value;
    ubyte exists;
    ubyte flags;
}
struct MI_ConstDatetimeField
{
    MI_Datetime value;
    ubyte exists;
    ubyte flags;
}
struct MI_ConstStringField
{
    const(ushort)* value;
    ubyte exists;
    ubyte flags;
}
struct MI_ConstReferenceField
{
    const(MI_Instance)* value;
    ubyte exists;
    ubyte flags;
}
struct MI_ConstInstanceField
{
    const(MI_Instance)* value;
    ubyte exists;
    ubyte flags;
}
struct MI_ConstBooleanAField
{
    MI_ConstBooleanA value;
    ubyte exists;
    ubyte flags;
}
struct MI_ConstUint8AField
{
    MI_ConstUint8A value;
    ubyte exists;
    ubyte flags;
}
struct MI_ConstSint8AField
{
    MI_ConstSint8A value;
    ubyte exists;
    ubyte flags;
}
struct MI_ConstUint16AField
{
    MI_ConstUint16A value;
    ubyte exists;
    ubyte flags;
}
struct MI_ConstSint16AField
{
    MI_ConstSint16A value;
    ubyte exists;
    ubyte flags;
}
struct MI_ConstUint32AField
{
    MI_ConstUint32A value;
    ubyte exists;
    ubyte flags;
}
struct MI_ConstSint32AField
{
    MI_ConstSint32A value;
    ubyte exists;
    ubyte flags;
}
struct MI_ConstUint64AField
{
    MI_ConstUint64A value;
    ubyte exists;
    ubyte flags;
}
struct MI_ConstSint64AField
{
    MI_ConstSint64A value;
    ubyte exists;
    ubyte flags;
}
struct MI_ConstReal32AField
{
    MI_ConstReal32A value;
    ubyte exists;
    ubyte flags;
}
struct MI_ConstReal64AField
{
    MI_ConstReal64A value;
    ubyte exists;
    ubyte flags;
}
struct MI_ConstChar16AField
{
    MI_ConstChar16A value;
    ubyte exists;
    ubyte flags;
}
struct MI_ConstDatetimeAField
{
    MI_ConstDatetimeA value;
    ubyte exists;
    ubyte flags;
}
struct MI_ConstStringAField
{
    MI_ConstStringA value;
    ubyte exists;
    ubyte flags;
}
struct MI_ConstReferenceAField
{
    MI_ConstReferenceA value;
    ubyte exists;
    ubyte flags;
}
struct MI_ConstInstanceAField
{
    MI_ConstInstanceA value;
    ubyte exists;
    ubyte flags;
}
struct MI_ServerFT
{
    long GetVersion;
    long GetSystemName;
}
struct MI_Server
{
    const(MI_ServerFT)* serverFT;
    const(MI_ContextFT)* contextFT;
    const(MI_InstanceFT)* instanceFT;
    const(MI_PropertySetFT)* propertySetFT;
    const(MI_FilterFT)* filterFT;
}
struct MI_FilterFT
{
    long Evaluate;
    long GetExpression;
}
struct MI_Filter
{
    const(MI_FilterFT)* ft;
    long[3] reserved;
}
struct MI_PropertySetFT
{
    long GetElementCount;
    long ContainsElement;
    long AddElement;
    long GetElementAt;
    long Clear;
    long Destruct;
    long Delete;
    long Clone;
}
struct MI_PropertySet
{
    const(MI_PropertySetFT)* ft;
    long[3] reserved;
}
struct MI_ObjectDecl
{
    uint flags;
    uint code;
    const(ushort)* name;
    const(MI_Qualifier)** qualifiers;
    uint numQualifiers;
    const(MI_PropertyDecl)** properties;
    uint numProperties;
    uint size;
}
struct MI_ClassDecl
{
    uint flags;
    uint code;
    const(ushort)* name;
    const(MI_Qualifier)** qualifiers;
    uint numQualifiers;
    const(MI_PropertyDecl)** properties;
    uint numProperties;
    uint size;
    const(ushort)* superClass;
    const(MI_ClassDecl)* superClassDecl;
    const(MI_MethodDecl)** methods;
    uint numMethods;
    const(MI_SchemaDecl)* schema;
    const(MI_ProviderFT)* providerFT;
    MI_Class* owningClass;
}
struct MI_FeatureDecl
{
    uint flags;
    uint code;
    const(ushort)* name;
    const(MI_Qualifier)** qualifiers;
    uint numQualifiers;
}
struct MI_ParameterDecl
{
    uint flags;
    uint code;
    const(ushort)* name;
    const(MI_Qualifier)** qualifiers;
    uint numQualifiers;
    uint type;
    const(ushort)* className;
    uint subscript;
    uint offset;
}
struct MI_PropertyDecl
{
    uint flags;
    uint code;
    const(ushort)* name;
    const(MI_Qualifier)** qualifiers;
    uint numQualifiers;
    uint type;
    const(ushort)* className;
    uint subscript;
    uint offset;
    const(ushort)* origin;
    const(ushort)* propagator;
    const(void)* value;
}
alias MI_MethodDecl_Invoke = void function(void*, MI_Context*, const(ushort)*, const(ushort)*, const(ushort)*, const(MI_Instance)*, const(MI_Instance)*);
struct MI_MethodDecl
{
    uint flags;
    uint code;
    const(ushort)* name;
    const(MI_Qualifier)** qualifiers;
    uint numQualifiers;
    const(MI_ParameterDecl)** parameters;
    uint numParameters;
    uint size;
    uint returnType;
    const(ushort)* origin;
    const(ushort)* propagator;
    const(MI_SchemaDecl)* schema;
    MI_MethodDecl_Invoke function_;
}
struct MI_QualifierDecl
{
    const(ushort)* name;
    uint type;
    uint scope_;
    uint flavor;
    uint subscript;
    const(void)* value;
}
struct MI_Qualifier
{
    const(ushort)* name;
    uint type;
    uint flavor;
    const(void)* value;
}
struct MI_SchemaDecl
{
    const(MI_QualifierDecl)** qualifierDecls;
    uint numQualifierDecls;
    const(MI_ClassDecl)** classDecls;
    uint numClassDecls;
}
alias MI_ProviderFT_Load = void function(void**, MI_Module_Self*, MI_Context*);
alias MI_ProviderFT_Unload = void function(void*, MI_Context*);
alias MI_ProviderFT_GetInstance = void function(void*, MI_Context*, const(ushort)*, const(ushort)*, const(MI_Instance)*, const(MI_PropertySet)*);
alias MI_ProviderFT_EnumerateInstances = void function(void*, MI_Context*, const(ushort)*, const(ushort)*, const(MI_PropertySet)*, ubyte, const(MI_Filter)*);
alias MI_ProviderFT_CreateInstance = void function(void*, MI_Context*, const(ushort)*, const(ushort)*, const(MI_Instance)*);
alias MI_ProviderFT_ModifyInstance = void function(void*, MI_Context*, const(ushort)*, const(ushort)*, const(MI_Instance)*, const(MI_PropertySet)*);
alias MI_ProviderFT_DeleteInstance = void function(void*, MI_Context*, const(ushort)*, const(ushort)*, const(MI_Instance)*);
alias MI_ProviderFT_AssociatorInstances = void function(void*, MI_Context*, const(ushort)*, const(ushort)*, const(MI_Instance)*, const(ushort)*, const(ushort)*, const(ushort)*, const(MI_PropertySet)*, ubyte, const(MI_Filter)*);
alias MI_ProviderFT_ReferenceInstances = void function(void*, MI_Context*, const(ushort)*, const(ushort)*, const(MI_Instance)*, const(ushort)*, const(MI_PropertySet)*, ubyte, const(MI_Filter)*);
alias MI_ProviderFT_EnableIndications = void function(void*, MI_Context*, const(ushort)*, const(ushort)*);
alias MI_ProviderFT_DisableIndications = void function(void*, MI_Context*, const(ushort)*, const(ushort)*);
alias MI_ProviderFT_Subscribe = void function(void*, MI_Context*, const(ushort)*, const(ushort)*, const(MI_Filter)*, const(ushort)*, ulong, void**);
alias MI_ProviderFT_Unsubscribe = void function(void*, MI_Context*, const(ushort)*, const(ushort)*, ulong, void*);
alias MI_ProviderFT_Invoke = void function(void*, MI_Context*, const(ushort)*, const(ushort)*, const(ushort)*, const(MI_Instance)*, const(MI_Instance)*);
struct MI_ProviderFT
{
    MI_ProviderFT_Load Load;
    MI_ProviderFT_Unload Unload;
    MI_ProviderFT_GetInstance GetInstance;
    MI_ProviderFT_EnumerateInstances EnumerateInstances;
    MI_ProviderFT_CreateInstance CreateInstance;
    MI_ProviderFT_ModifyInstance ModifyInstance;
    MI_ProviderFT_DeleteInstance DeleteInstance;
    MI_ProviderFT_AssociatorInstances AssociatorInstances;
    MI_ProviderFT_ReferenceInstances ReferenceInstances;
    MI_ProviderFT_EnableIndications EnableIndications;
    MI_ProviderFT_DisableIndications DisableIndications;
    MI_ProviderFT_Subscribe Subscribe;
    MI_ProviderFT_Unsubscribe Unsubscribe;
    MI_ProviderFT_Invoke Invoke;
}
alias MI_Module_Load = void function(MI_Module_Self**, MI_Context*);
alias MI_Module_Unload = void function(MI_Module_Self*, MI_Context*);
struct MI_Module
{
    uint version_;
    uint generatorVersion;
    uint flags;
    uint charSize;
    MI_SchemaDecl* schemaDecl;
    MI_Module_Load Load;
    MI_Module_Unload Unload;
    const(MI_ProviderFT)* dynamicProviderFT;
}
struct MI_InstanceFT
{
    long Clone;
    long Destruct;
    long Delete;
    long IsA;
    long GetClassNameA;
    long SetNameSpace;
    long GetNameSpace;
    long GetElementCount;
    long AddElement;
    long SetElement;
    long SetElementAt;
    long GetElement;
    long GetElementAt;
    long ClearElement;
    long ClearElementAt;
    long GetServerName;
    long SetServerName;
    long GetClass;
}
struct MI_InstanceExFT
{
    MI_InstanceFT parent;
    long Normalize;
}
struct MI_Instance
{
    const(MI_InstanceFT)* ft;
    const(MI_ClassDecl)* classDecl;
    const(ushort)* serverName;
    const(ushort)* nameSpace;
    long[4] reserved;
}
alias MI_LocaleType = int;
enum : int
{
    MI_LOCALE_TYPE_REQUESTED_UI   = 0x00000000,
    MI_LOCALE_TYPE_REQUESTED_DATA = 0x00000001,
    MI_LOCALE_TYPE_CLOSEST_UI     = 0x00000002,
    MI_LOCALE_TYPE_CLOSEST_DATA   = 0x00000003,
}

alias MI_CancellationReason = int;
enum : int
{
    MI_REASON_NONE        = 0x00000000,
    MI_REASON_TIMEOUT     = 0x00000001,
    MI_REASON_SHUTDOWN    = 0x00000002,
    MI_REASON_SERVICESTOP = 0x00000003,
}

alias MI_CancelCallback = void function(MI_CancellationReason, void*);
struct MI_ContextFT
{
    long PostResult;
    long PostInstance;
    long PostIndication;
    long ConstructInstance;
    long ConstructParameters;
    long NewInstance;
    long NewDynamicInstance;
    long NewParameters;
    long Canceled;
    long GetLocale;
    long RegisterCancel;
    long RequestUnload;
    long RefuseUnload;
    long GetLocalSession;
    long SetStringOption;
    long GetStringOption;
    long GetNumberOption;
    long GetCustomOption;
    long GetCustomOptionCount;
    long GetCustomOptionAt;
    long WriteMessage;
    long WriteProgress;
    long WriteStreamParameter;
    long WriteCimError;
    long PromptUser;
    long ShouldProcess;
    long ShouldContinue;
    long PostError;
    long PostCimError;
    long WriteError;
}
struct MI_Context
{
    const(MI_ContextFT)* ft;
    long[3] reserved;
}
alias MI_MainFunction = MI_Module* function(MI_Server*);
struct MI_QualifierSetFT
{
    long GetQualifierCount;
    long GetQualifierAt;
    long GetQualifier;
}
struct MI_QualifierSet
{
    ulong reserved1;
    long reserved2;
    const(MI_QualifierSetFT)* ft;
}
struct MI_ParameterSetFT
{
    long GetMethodReturnType;
    long GetParameterCount;
    long GetParameterAt;
    long GetParameter;
}
struct MI_ParameterSet
{
    ulong reserved1;
    long reserved2;
    const(MI_ParameterSetFT)* ft;
}
struct MI_ClassFT
{
    long GetClassNameA;
    long GetNameSpace;
    long GetServerName;
    long GetElementCount;
    long GetElement;
    long GetElementAt;
    long GetClassQualifierSet;
    long GetMethodCount;
    long GetMethodAt;
    long GetMethod;
    long GetParentClassName;
    long GetParentClass;
    long Delete;
    long Clone;
}
struct MI_Class
{
    const(MI_ClassFT)* ft;
    const(MI_ClassDecl)* classDecl;
    const(ushort)* namespaceName;
    const(ushort)* serverName;
    long[4] reserved;
}
alias MI_OperationCallback_ResponseType = int;
enum : int
{
    MI_OperationCallback_ResponseType_No       = 0x00000000,
    MI_OperationCallback_ResponseType_Yes      = 0x00000001,
    MI_OperationCallback_ResponseType_NoToAll  = 0x00000002,
    MI_OperationCallback_ResponseType_YesToAll = 0x00000003,
}

alias MI_OperationCallback_PromptUser = void function(MI_Operation*, void*, const(ushort)*, MI_PromptType, long);
alias MI_OperationCallback_WriteError = void function(MI_Operation*, void*, MI_Instance*, long);
alias MI_OperationCallback_WriteMessage = void function(MI_Operation*, void*, uint, const(ushort)*);
alias MI_OperationCallback_WriteProgress = void function(MI_Operation*, void*, const(ushort)*, const(ushort)*, const(ushort)*, uint, uint);
alias MI_OperationCallback_Instance = void function(MI_Operation*, void*, const(MI_Instance)*, ubyte, MI_Result, const(ushort)*, const(MI_Instance)*, long);
alias MI_OperationCallback_StreamedParameter = void function(MI_Operation*, void*, const(ushort)*, MI_Type, const(MI_Value)*, long);
alias MI_OperationCallback_Indication = void function(MI_Operation*, void*, const(MI_Instance)*, const(ushort)*, const(ushort)*, ubyte, MI_Result, const(ushort)*, const(MI_Instance)*, long);
alias MI_OperationCallback_Class = void function(MI_Operation*, void*, const(MI_Class)*, ubyte, MI_Result, const(ushort)*, const(MI_Instance)*, long);
struct MI_OperationCallbacks
{
    void* callbackContext;
    MI_OperationCallback_PromptUser promptUser;
    MI_OperationCallback_WriteError writeError;
    MI_OperationCallback_WriteMessage writeMessage;
    MI_OperationCallback_WriteProgress writeProgress;
    MI_OperationCallback_Instance instanceResult;
    MI_OperationCallback_Indication indicationResult;
    MI_OperationCallback_Class classResult;
    MI_OperationCallback_StreamedParameter streamedParameterResult;
}
struct MI_SessionCallbacks
{
    void* callbackContext;
    long writeMessage;
    long writeError;
}
struct MI_UsernamePasswordCreds
{
    const(ushort)* domain;
    const(ushort)* username;
    const(ushort)* password;
}
struct MI_UserCredentials
{
    const(ushort)* authenticationType;
    union _credentials_e__Union
    {
        MI_UsernamePasswordCreds usernamePassword;
        const(ushort)* certificateThumbprint;
    }
}
alias MI_SubscriptionDeliveryType = int;
enum : int
{
    MI_SubscriptionDeliveryType_Pull = 0x00000001,
    MI_SubscriptionDeliveryType_Push = 0x00000002,
}

struct MI_SubscriptionDeliveryOptionsFT
{
    long SetString;
    long SetNumber;
    long SetDateTime;
    long SetInterval;
    long AddCredentials;
    long Delete;
    long GetString;
    long GetNumber;
    long GetDateTime;
    long GetInterval;
    long GetOptionCount;
    long GetOptionAt;
    long GetOption;
    long GetCredentialsCount;
    long GetCredentialsAt;
    long GetCredentialsPasswordAt;
    long Clone;
}
struct MI_SubscriptionDeliveryOptions
{
    ulong reserved1;
    long reserved2;
    const(MI_SubscriptionDeliveryOptionsFT)* ft;
}
struct MI_Serializer
{
    ulong reserved1;
    long reserved2;
}
struct MI_Deserializer
{
    ulong reserved1;
    long reserved2;
}
struct MI_SerializerFT
{
    long Close;
    long SerializeClass;
    long SerializeInstance;
}
alias MI_Deserializer_ClassObjectNeeded = MI_Result function(void*, const(ushort)*, const(ushort)*, const(ushort)*, MI_Class**);
struct MI_DeserializerFT
{
    long Close;
    long DeserializeClass;
    long Class_GetClassName;
    long Class_GetParentClassName;
    long DeserializeInstance;
    long Instance_GetClassName;
}
struct MI_ApplicationFT
{
    long Close;
    long NewSession;
    long NewHostedProvider;
    long NewInstance;
    long NewDestinationOptions;
    long NewOperationOptions;
    long NewSubscriptionDeliveryOptions;
    long NewSerializer;
    long NewDeserializer;
    long NewInstanceFromClass;
    long NewClass;
}
struct MI_HostedProviderFT
{
    long Close;
    long GetApplication;
}
struct MI_SessionFT
{
    long Close;
    long GetApplication;
    long GetInstance;
    long ModifyInstance;
    long CreateInstance;
    long DeleteInstance;
    long Invoke;
    long EnumerateInstances;
    long QueryInstances;
    long AssociatorInstances;
    long ReferenceInstances;
    long Subscribe;
    long GetClass;
    long EnumerateClasses;
    long TestConnection;
}
struct MI_OperationFT
{
    long Close;
    long Cancel;
    long GetSession;
    long GetInstance;
    long GetIndication;
    long GetClass;
}
struct MI_DestinationOptionsFT
{
    long Delete;
    long SetString;
    long SetNumber;
    long AddCredentials;
    long GetString;
    long GetNumber;
    long GetOptionCount;
    long GetOptionAt;
    long GetOption;
    long GetCredentialsCount;
    long GetCredentialsAt;
    long GetCredentialsPasswordAt;
    long Clone;
    long SetInterval;
    long GetInterval;
}
struct MI_OperationOptionsFT
{
    long Delete;
    long SetString;
    long SetNumber;
    long SetCustomOption;
    long GetString;
    long GetNumber;
    long GetOptionCount;
    long GetOptionAt;
    long GetOption;
    long GetEnabledChannels;
    long Clone;
    long SetInterval;
    long GetInterval;
}
struct MI_Application
{
    ulong reserved1;
    long reserved2;
    const(MI_ApplicationFT)* ft;
}
struct MI_Session
{
    ulong reserved1;
    long reserved2;
    const(MI_SessionFT)* ft;
}
struct MI_Operation
{
    ulong reserved1;
    long reserved2;
    const(MI_OperationFT)* ft;
}
struct MI_HostedProvider
{
    ulong reserved1;
    long reserved2;
    const(MI_HostedProviderFT)* ft;
}
struct MI_DestinationOptions
{
    ulong reserved1;
    long reserved2;
    const(MI_DestinationOptionsFT)* ft;
}
struct MI_OperationOptions
{
    ulong reserved1;
    long reserved2;
    const(MI_OperationOptionsFT)* ft;
}
struct MI_UtilitiesFT
{
    long MapErrorToMiErrorCategory;
    long CimErrorFromErrorCode;
}
struct MI_ClientFT_V1
{
    const(MI_ApplicationFT)* applicationFT;
    const(MI_SessionFT)* sessionFT;
    const(MI_OperationFT)* operationFT;
    const(MI_HostedProviderFT)* hostedProviderFT;
    const(MI_SerializerFT)* serializerFT;
    const(MI_DeserializerFT)* deserializerFT;
    const(MI_SubscriptionDeliveryOptionsFT)* subscribeDeliveryOptionsFT;
    const(MI_DestinationOptionsFT)* destinationOptionsFT;
    const(MI_OperationOptionsFT)* operationOptionsFT;
    const(MI_UtilitiesFT)* utilitiesFT;
}
alias MI_DestinationOptions_ImpersonationType = int;
enum : int
{
    MI_DestinationOptions_ImpersonationType_Default     = 0x00000000,
    MI_DestinationOptions_ImpersonationType_None        = 0x00000001,
    MI_DestinationOptions_ImpersonationType_Identify    = 0x00000002,
    MI_DestinationOptions_ImpersonationType_Impersonate = 0x00000003,
    MI_DestinationOptions_ImpersonationType_Delegate    = 0x00000004,
}

alias WBEM_PATH_STATUS_FLAG = int;
enum : int
{
    WBEMPATH_INFO_ANON_LOCAL_MACHINE    = 0x00000001,
    WBEMPATH_INFO_HAS_MACHINE_NAME      = 0x00000002,
    WBEMPATH_INFO_IS_CLASS_REF          = 0x00000004,
    WBEMPATH_INFO_IS_INST_REF           = 0x00000008,
    WBEMPATH_INFO_HAS_SUBSCOPES         = 0x00000010,
    WBEMPATH_INFO_IS_COMPOUND           = 0x00000020,
    WBEMPATH_INFO_HAS_V2_REF_PATHS      = 0x00000040,
    WBEMPATH_INFO_HAS_IMPLIED_KEY       = 0x00000080,
    WBEMPATH_INFO_CONTAINS_SINGLETON    = 0x00000100,
    WBEMPATH_INFO_V1_COMPLIANT          = 0x00000200,
    WBEMPATH_INFO_V2_COMPLIANT          = 0x00000400,
    WBEMPATH_INFO_CIM_COMPLIANT         = 0x00000800,
    WBEMPATH_INFO_IS_SINGLETON          = 0x00001000,
    WBEMPATH_INFO_IS_PARENT             = 0x00002000,
    WBEMPATH_INFO_SERVER_NAMESPACE_ONLY = 0x00004000,
    WBEMPATH_INFO_NATIVE_PATH           = 0x00008000,
    WBEMPATH_INFO_WMI_PATH              = 0x00010000,
    WBEMPATH_INFO_PATH_HAD_SERVER       = 0x00020000,
}

alias WBEM_PATH_CREATE_FLAG = int;
enum : int
{
    WBEMPATH_CREATE_ACCEPT_RELATIVE   = 0x00000001,
    WBEMPATH_CREATE_ACCEPT_ABSOLUTE   = 0x00000002,
    WBEMPATH_CREATE_ACCEPT_ALL        = 0x00000004,
    WBEMPATH_TREAT_SINGLE_IDENT_AS_NS = 0x00000008,
}

alias WBEM_GET_TEXT_FLAGS = int;
enum : int
{
    WBEMPATH_COMPRESSED                    = 0x00000001,
    WBEMPATH_GET_RELATIVE_ONLY             = 0x00000002,
    WBEMPATH_GET_SERVER_TOO                = 0x00000004,
    WBEMPATH_GET_SERVER_AND_NAMESPACE_ONLY = 0x00000008,
    WBEMPATH_GET_NAMESPACE_ONLY            = 0x00000010,
    WBEMPATH_GET_ORIGINAL                  = 0x00000020,
}

alias WBEM_GET_KEY_FLAGS = int;
enum : int
{
    WBEMPATH_TEXT       = 0x00000001,
    WBEMPATH_QUOTEDTEXT = 0x00000002,
}

enum IID_IWbemPathKeyList = GUID(0x9ae62877, 0x7544, 0x4bb0, [0xaa, 0x26, 0xa1, 0x38, 0x24, 0x65, 0x9e, 0xd6]);
interface IWbemPathKeyList : IUnknown
{
    HRESULT GetCount(uint*);
    HRESULT SetKey(const(wchar)*, uint, uint, void*);
    HRESULT SetKey2(const(wchar)*, uint, uint, VARIANT*);
    HRESULT GetKey(uint, uint, uint*, PWSTR, uint*, void*, uint*);
    HRESULT GetKey2(uint, uint, uint*, PWSTR, VARIANT*, uint*);
    HRESULT RemoveKey(const(wchar)*, uint);
    HRESULT RemoveAllKeys(uint);
    HRESULT MakeSingleton(ubyte);
    HRESULT GetInfo(uint, ulong*);
    HRESULT GetText(int, uint*, PWSTR);
}
enum IID_IWbemPath = GUID(0x3bc15af2, 0x736c, 0x477e, [0x9e, 0x51, 0x23, 0x8a, 0xf8, 0x66, 0x7d, 0xcc]);
interface IWbemPath : IUnknown
{
    HRESULT SetText(uint, const(wchar)*);
    HRESULT GetText(int, uint*, PWSTR);
    HRESULT GetInfo(uint, ulong*);
    HRESULT SetServer(const(wchar)*);
    HRESULT GetServer(uint*, PWSTR);
    HRESULT GetNamespaceCount(uint*);
    HRESULT SetNamespaceAt(uint, const(wchar)*);
    HRESULT GetNamespaceAt(uint, uint*, PWSTR);
    HRESULT RemoveNamespaceAt(uint);
    HRESULT RemoveAllNamespaces();
    HRESULT GetScopeCount(uint*);
    HRESULT SetScope(uint, PWSTR);
    HRESULT SetScopeFromText(uint, PWSTR);
    HRESULT GetScope(uint, uint*, PWSTR, IWbemPathKeyList*);
    HRESULT GetScopeAsText(uint, uint*, PWSTR);
    HRESULT RemoveScope(uint);
    HRESULT RemoveAllScopes();
    HRESULT SetClassName(const(wchar)*);
    HRESULT GetClassName(uint*, PWSTR);
    HRESULT GetKeyList(IWbemPathKeyList*);
    HRESULT CreateClassPart(int, const(wchar)*);
    HRESULT DeleteClassPart(int);
    BOOL IsRelative(PWSTR, PWSTR);
    BOOL IsRelativeOrChild(PWSTR, PWSTR, int);
    BOOL IsLocal(const(wchar)*);
    BOOL IsSameClassName(const(wchar)*);
}
enum CLSID_WbemDefPath = GUID(0xcf4cc405, 0xe2c5, 0x4ddd, [0xb3, 0xce, 0x5e, 0x75, 0x82, 0xd8, 0xc9, 0xfa]);
struct WbemDefPath
{
}
enum IID_IWbemQuery = GUID(0x81166f58, 0xdd98, 0x11d3, [0xa1, 0x20, 0x0, 0x10, 0x5a, 0x1f, 0x51, 0x5a]);
interface IWbemQuery : IUnknown
{
    HRESULT Empty();
    HRESULT SetLanguageFeatures(uint, uint, uint*);
    HRESULT TestLanguageFeatures(uint, uint*, uint*);
    HRESULT Parse(const(wchar)*, const(wchar)*, uint);
    HRESULT GetAnalysis(uint, uint, void**);
    HRESULT FreeMemory(void*);
    HRESULT GetQueryInfo(uint, uint, uint, void*);
}
enum CLSID_WbemQuery = GUID(0xeac8a024, 0x21e2, 0x4523, [0xad, 0x73, 0xa7, 0x1a, 0xa, 0xa2, 0xf5, 0x6a]);
struct WbemQuery
{
}
alias WMIQ_ANALYSIS_TYPE = int;
enum : int
{
    WMIQ_ANALYSIS_RPN_SEQUENCE         = 0x00000001,
    WMIQ_ANALYSIS_ASSOC_QUERY          = 0x00000002,
    WMIQ_ANALYSIS_PROP_ANALYSIS_MATRIX = 0x00000003,
    WMIQ_ANALYSIS_QUERY_TEXT           = 0x00000004,
    WMIQ_ANALYSIS_RESERVED             = 0x08000000,
}

alias WMIQ_RPN_TOKEN_FLAGS = int;
enum : int
{
    WMIQ_RPN_TOKEN_EXPRESSION    = 0x00000001,
    WMIQ_RPN_TOKEN_AND           = 0x00000002,
    WMIQ_RPN_TOKEN_OR            = 0x00000003,
    WMIQ_RPN_TOKEN_NOT           = 0x00000004,
    WMIQ_RPN_OP_UNDEFINED        = 0x00000000,
    WMIQ_RPN_OP_EQ               = 0x00000001,
    WMIQ_RPN_OP_NE               = 0x00000002,
    WMIQ_RPN_OP_GE               = 0x00000003,
    WMIQ_RPN_OP_LE               = 0x00000004,
    WMIQ_RPN_OP_LT               = 0x00000005,
    WMIQ_RPN_OP_GT               = 0x00000006,
    WMIQ_RPN_OP_LIKE             = 0x00000007,
    WMIQ_RPN_OP_ISA              = 0x00000008,
    WMIQ_RPN_OP_ISNOTA           = 0x00000009,
    WMIQ_RPN_OP_ISNULL           = 0x0000000a,
    WMIQ_RPN_OP_ISNOTNULL        = 0x0000000b,
    WMIQ_RPN_LEFT_PROPERTY_NAME  = 0x00000001,
    WMIQ_RPN_RIGHT_PROPERTY_NAME = 0x00000002,
    WMIQ_RPN_CONST2              = 0x00000004,
    WMIQ_RPN_CONST               = 0x00000008,
    WMIQ_RPN_RELOP               = 0x00000010,
    WMIQ_RPN_LEFT_FUNCTION       = 0x00000020,
    WMIQ_RPN_RIGHT_FUNCTION      = 0x00000040,
    WMIQ_RPN_GET_TOKEN_TYPE      = 0x00000001,
    WMIQ_RPN_GET_EXPR_SHAPE      = 0x00000002,
    WMIQ_RPN_GET_LEFT_FUNCTION   = 0x00000003,
    WMIQ_RPN_GET_RIGHT_FUNCTION  = 0x00000004,
    WMIQ_RPN_GET_RELOP           = 0x00000005,
    WMIQ_RPN_NEXT_TOKEN          = 0x00000001,
    WMIQ_RPN_FROM_UNARY          = 0x00000001,
    WMIQ_RPN_FROM_PATH           = 0x00000002,
    WMIQ_RPN_FROM_CLASS_LIST     = 0x00000004,
    WMIQ_RPN_FROM_MULTIPLE       = 0x00000008,
}

alias WMIQ_ASSOCQ_FLAGS = int;
enum : int
{
    WMIQ_ASSOCQ_ASSOCIATORS            = 0x00000001,
    WMIQ_ASSOCQ_REFERENCES             = 0x00000002,
    WMIQ_ASSOCQ_RESULTCLASS            = 0x00000004,
    WMIQ_ASSOCQ_ASSOCCLASS             = 0x00000008,
    WMIQ_ASSOCQ_ROLE                   = 0x00000010,
    WMIQ_ASSOCQ_RESULTROLE             = 0x00000020,
    WMIQ_ASSOCQ_REQUIREDQUALIFIER      = 0x00000040,
    WMIQ_ASSOCQ_REQUIREDASSOCQUALIFIER = 0x00000080,
    WMIQ_ASSOCQ_CLASSDEFSONLY          = 0x00000100,
    WMIQ_ASSOCQ_KEYSONLY               = 0x00000200,
    WMIQ_ASSOCQ_SCHEMAONLY             = 0x00000400,
    WMIQ_ASSOCQ_CLASSREFSONLY          = 0x00000800,
}

struct SWbemQueryQualifiedName
{
    uint m_uVersion;
    uint m_uTokenType;
    uint m_uNameListSize;
    const(wchar)** m_ppszNameList;
    BOOL m_bArraysUsed;
    BOOL* m_pbArrayElUsed;
    uint* m_puArrayIndex;
}
union SWbemRpnConst
{
    const(wchar)* m_pszStrVal;
    BOOL m_bBoolVal;
    int m_lLongVal;
    uint m_uLongVal;
    double m_dblVal;
    long m_lVal64;
    long m_uVal64;
}
struct SWbemRpnQueryToken
{
    uint m_uVersion;
    uint m_uTokenType;
    uint m_uSubexpressionShape;
    uint m_uOperator;
    SWbemQueryQualifiedName* m_pRightIdent;
    SWbemQueryQualifiedName* m_pLeftIdent;
    uint m_uConstApparentType;
    SWbemRpnConst m_Const;
    uint m_uConst2ApparentType;
    SWbemRpnConst m_Const2;
    const(wchar)* m_pszRightFunc;
    const(wchar)* m_pszLeftFunc;
}
struct SWbemRpnTokenList
{
    uint m_uVersion;
    uint m_uTokenType;
    uint m_uNumTokens;
}
alias WMIQ_LANGUAGE_FEATURES = int;
enum : int
{
    WMIQ_LF1_BASIC_SELECT                = 0x00000001,
    WMIQ_LF2_CLASS_NAME_IN_QUERY         = 0x00000002,
    WMIQ_LF3_STRING_CASE_FUNCTIONS       = 0x00000003,
    WMIQ_LF4_PROP_TO_PROP_TESTS          = 0x00000004,
    WMIQ_LF5_COUNT_STAR                  = 0x00000005,
    WMIQ_LF6_ORDER_BY                    = 0x00000006,
    WMIQ_LF7_DISTINCT                    = 0x00000007,
    WMIQ_LF8_ISA                         = 0x00000008,
    WMIQ_LF9_THIS                        = 0x00000009,
    WMIQ_LF10_COMPEX_SUBEXPRESSIONS      = 0x0000000a,
    WMIQ_LF11_ALIASING                   = 0x0000000b,
    WMIQ_LF12_GROUP_BY_HAVING            = 0x0000000c,
    WMIQ_LF13_WMI_WITHIN                 = 0x0000000d,
    WMIQ_LF14_SQL_WRITE_OPERATIONS       = 0x0000000e,
    WMIQ_LF15_GO                         = 0x0000000f,
    WMIQ_LF16_SINGLE_LEVEL_TRANSACTIONS  = 0x00000010,
    WMIQ_LF17_QUALIFIED_NAMES            = 0x00000011,
    WMIQ_LF18_ASSOCIATONS                = 0x00000012,
    WMIQ_LF19_SYSTEM_PROPERTIES          = 0x00000013,
    WMIQ_LF20_EXTENDED_SYSTEM_PROPERTIES = 0x00000014,
    WMIQ_LF21_SQL89_JOINS                = 0x00000015,
    WMIQ_LF22_SQL92_JOINS                = 0x00000016,
    WMIQ_LF23_SUBSELECTS                 = 0x00000017,
    WMIQ_LF24_UMI_EXTENSIONS             = 0x00000018,
    WMIQ_LF25_DATEPART                   = 0x00000019,
    WMIQ_LF26_LIKE                       = 0x0000001a,
    WMIQ_LF27_CIM_TEMPORAL_CONSTRUCTS    = 0x0000001b,
    WMIQ_LF28_STANDARD_AGGREGATES        = 0x0000001c,
    WMIQ_LF29_MULTI_LEVEL_ORDER_BY       = 0x0000001d,
    WMIQ_LF30_WMI_PRAGMAS                = 0x0000001e,
    WMIQ_LF31_QUALIFIER_TESTS            = 0x0000001f,
    WMIQ_LF32_SP_EXECUTE                 = 0x00000020,
    WMIQ_LF33_ARRAY_ACCESS               = 0x00000021,
    WMIQ_LF34_UNION                      = 0x00000022,
    WMIQ_LF35_COMPLEX_SELECT_TARGET      = 0x00000023,
    WMIQ_LF36_REFERENCE_TESTS            = 0x00000024,
    WMIQ_LF37_SELECT_INTO                = 0x00000025,
    WMIQ_LF38_BASIC_DATETIME_TESTS       = 0x00000026,
    WMIQ_LF39_COUNT_COLUMN               = 0x00000027,
    WMIQ_LF40_BETWEEN                    = 0x00000028,
    WMIQ_LF_LAST                         = 0x00000028,
}

alias WMIQ_RPNF_FEATURE = int;
enum : int
{
    WMIQ_RPNF_WHERE_CLAUSE_PRESENT = 0x00000001,
    WMIQ_RPNF_QUERY_IS_CONJUNCTIVE = 0x00000002,
    WMIQ_RPNF_QUERY_IS_DISJUNCTIVE = 0x00000004,
    WMIQ_RPNF_PROJECTION           = 0x00000008,
    WMIQ_RPNF_FEATURE_SELECT_STAR  = 0x00000010,
    WMIQ_RPNF_EQUALITY_TESTS_ONLY  = 0x00000020,
    WMIQ_RPNF_COUNT_STAR           = 0x00000040,
    WMIQ_RPNF_QUALIFIED_NAMES_USED = 0x00000080,
    WMIQ_RPNF_SYSPROP_CLASS_USED   = 0x00000100,
    WMIQ_RPNF_PROP_TO_PROP_TESTS   = 0x00000200,
    WMIQ_RPNF_ORDER_BY             = 0x00000400,
    WMIQ_RPNF_ISA_USED             = 0x00000800,
    WMIQ_RPNF_GROUP_BY_HAVING      = 0x00001000,
    WMIQ_RPNF_ARRAY_ACCESS_USED    = 0x00002000,
}

struct SWbemRpnEncodedQuery
{
    uint m_uVersion;
    uint m_uTokenType;
    ulong m_uParsedFeatureMask;
    uint m_uDetectedArraySize;
    uint* m_puDetectedFeatures;
    uint m_uSelectListSize;
    SWbemQueryQualifiedName** m_ppSelectList;
    uint m_uFromTargetType;
    const(wchar)* m_pszOptionalFromPath;
    uint m_uFromListSize;
    const(wchar)** m_ppszFromList;
    uint m_uWhereClauseSize;
    SWbemRpnQueryToken** m_ppRpnWhereClause;
    double m_dblWithinPolling;
    double m_dblWithinWindow;
    uint m_uOrderByListSize;
    const(wchar)** m_ppszOrderByList;
    uint* m_uOrderDirectionEl;
}
struct SWbemAnalysisMatrix
{
    uint m_uVersion;
    uint m_uMatrixType;
    const(wchar)* m_pszProperty;
    uint m_uPropertyType;
    uint m_uEntries;
    void** m_pValues;
    BOOL* m_pbTruthTable;
}
struct SWbemAnalysisMatrixList
{
    uint m_uVersion;
    uint m_uMatrixType;
    uint m_uNumMatrices;
    SWbemAnalysisMatrix* m_pMatrices;
}
struct SWbemAssocQueryInf
{
    uint m_uVersion;
    uint m_uAnalysisType;
    uint m_uFeatureMask;
    IWbemPath m_pPath;
    PWSTR m_pszPath;
    PWSTR m_pszQueryText;
    PWSTR m_pszResultClass;
    PWSTR m_pszAssocClass;
    PWSTR m_pszRole;
    PWSTR m_pszResultRole;
    PWSTR m_pszRequiredQualifier;
    PWSTR m_pszRequiredAssocQualifier;
}
alias WBEM_GENUS_TYPE = int;
enum : int
{
    WBEM_GENUS_CLASS    = 0x00000001,
    WBEM_GENUS_INSTANCE = 0x00000002,
}

alias WBEM_CHANGE_FLAG_TYPE = int;
enum : int
{
    WBEM_FLAG_CREATE_OR_UPDATE  = 0x00000000,
    WBEM_FLAG_UPDATE_ONLY       = 0x00000001,
    WBEM_FLAG_CREATE_ONLY       = 0x00000002,
    WBEM_FLAG_UPDATE_COMPATIBLE = 0x00000000,
    WBEM_FLAG_UPDATE_SAFE_MODE  = 0x00000020,
    WBEM_FLAG_UPDATE_FORCE_MODE = 0x00000040,
    WBEM_MASK_UPDATE_MODE       = 0x00000060,
    WBEM_FLAG_ADVISORY          = 0x00010000,
}

alias WBEM_GENERIC_FLAG_TYPE = int;
enum : int
{
    WBEM_FLAG_RETURN_IMMEDIATELY     = 0x00000010,
    WBEM_FLAG_RETURN_WBEM_COMPLETE   = 0x00000000,
    WBEM_FLAG_BIDIRECTIONAL          = 0x00000000,
    WBEM_FLAG_FORWARD_ONLY           = 0x00000020,
    WBEM_FLAG_NO_ERROR_OBJECT        = 0x00000040,
    WBEM_FLAG_RETURN_ERROR_OBJECT    = 0x00000000,
    WBEM_FLAG_SEND_STATUS            = 0x00000080,
    WBEM_FLAG_DONT_SEND_STATUS       = 0x00000000,
    WBEM_FLAG_ENSURE_LOCATABLE       = 0x00000100,
    WBEM_FLAG_DIRECT_READ            = 0x00000200,
    WBEM_FLAG_SEND_ONLY_SELECTED     = 0x00000000,
    WBEM_RETURN_WHEN_COMPLETE        = 0x00000000,
    WBEM_RETURN_IMMEDIATELY          = 0x00000010,
    WBEM_MASK_RESERVED_FLAGS         = 0x0001f000,
    WBEM_FLAG_USE_AMENDED_QUALIFIERS = 0x00020000,
    WBEM_FLAG_STRONG_VALIDATION      = 0x00100000,
}

alias WBEM_STATUS_TYPE = int;
enum : int
{
    WBEM_STATUS_COMPLETE                       = 0x00000000,
    WBEM_STATUS_REQUIREMENTS                   = 0x00000001,
    WBEM_STATUS_PROGRESS                       = 0x00000002,
    WBEM_STATUS_LOGGING_INFORMATION            = 0x00000100,
    WBEM_STATUS_LOGGING_INFORMATION_PROVIDER   = 0x00000200,
    WBEM_STATUS_LOGGING_INFORMATION_HOST       = 0x00000400,
    WBEM_STATUS_LOGGING_INFORMATION_REPOSITORY = 0x00000800,
    WBEM_STATUS_LOGGING_INFORMATION_ESS        = 0x00001000,
}

alias WBEM_CONDITION_FLAG_TYPE = int;
enum : int
{
    WBEM_FLAG_ALWAYS                    = 0x00000000,
    WBEM_FLAG_ONLY_IF_TRUE              = 0x00000001,
    WBEM_FLAG_ONLY_IF_FALSE             = 0x00000002,
    WBEM_FLAG_ONLY_IF_IDENTICAL         = 0x00000003,
    WBEM_MASK_PRIMARY_CONDITION         = 0x00000003,
    WBEM_FLAG_KEYS_ONLY                 = 0x00000004,
    WBEM_FLAG_REFS_ONLY                 = 0x00000008,
    WBEM_FLAG_LOCAL_ONLY                = 0x00000010,
    WBEM_FLAG_PROPAGATED_ONLY           = 0x00000020,
    WBEM_FLAG_SYSTEM_ONLY               = 0x00000030,
    WBEM_FLAG_NONSYSTEM_ONLY            = 0x00000040,
    WBEM_MASK_CONDITION_ORIGIN          = 0x00000070,
    WBEM_FLAG_CLASS_OVERRIDES_ONLY      = 0x00000100,
    WBEM_FLAG_CLASS_LOCAL_AND_OVERRIDES = 0x00000200,
    WBEM_MASK_CLASS_CONDITION           = 0x00000300,
}

alias WBEM_FLAVOR_TYPE = int;
enum : int
{
    WBEM_FLAVOR_DONT_PROPAGATE                  = 0x00000000,
    WBEM_FLAVOR_FLAG_PROPAGATE_TO_INSTANCE      = 0x00000001,
    WBEM_FLAVOR_FLAG_PROPAGATE_TO_DERIVED_CLASS = 0x00000002,
    WBEM_FLAVOR_MASK_PROPAGATION                = 0x0000000f,
    WBEM_FLAVOR_OVERRIDABLE                     = 0x00000000,
    WBEM_FLAVOR_NOT_OVERRIDABLE                 = 0x00000010,
    WBEM_FLAVOR_MASK_PERMISSIONS                = 0x00000010,
    WBEM_FLAVOR_ORIGIN_LOCAL                    = 0x00000000,
    WBEM_FLAVOR_ORIGIN_PROPAGATED               = 0x00000020,
    WBEM_FLAVOR_ORIGIN_SYSTEM                   = 0x00000040,
    WBEM_FLAVOR_MASK_ORIGIN                     = 0x00000060,
    WBEM_FLAVOR_NOT_AMENDED                     = 0x00000000,
    WBEM_FLAVOR_AMENDED                         = 0x00000080,
    WBEM_FLAVOR_MASK_AMENDED                    = 0x00000080,
}

alias WBEM_QUERY_FLAG_TYPE = int;
enum : int
{
    WBEM_FLAG_DEEP      = 0x00000000,
    WBEM_FLAG_SHALLOW   = 0x00000001,
    WBEM_FLAG_PROTOTYPE = 0x00000002,
}

alias WBEM_SECURITY_FLAGS = int;
enum : int
{
    WBEM_ENABLE            = 0x00000001,
    WBEM_METHOD_EXECUTE    = 0x00000002,
    WBEM_FULL_WRITE_REP    = 0x00000004,
    WBEM_PARTIAL_WRITE_REP = 0x00000008,
    WBEM_WRITE_PROVIDER    = 0x00000010,
    WBEM_REMOTE_ACCESS     = 0x00000020,
    WBEM_RIGHT_SUBSCRIBE   = 0x00000040,
    WBEM_RIGHT_PUBLISH     = 0x00000080,
}

alias WBEM_LIMITATION_FLAG_TYPE = int;
enum : int
{
    WBEM_FLAG_EXCLUDE_OBJECT_QUALIFIERS   = 0x00000010,
    WBEM_FLAG_EXCLUDE_PROPERTY_QUALIFIERS = 0x00000020,
}

alias WBEM_TEXT_FLAG_TYPE = int;
enum : int
{
    WBEM_FLAG_NO_FLAVORS = 0x00000001,
}

alias WBEM_COMPARISON_FLAG = int;
enum : int
{
    WBEM_COMPARISON_INCLUDE_ALL     = 0x00000000,
    WBEM_FLAG_IGNORE_QUALIFIERS     = 0x00000001,
    WBEM_FLAG_IGNORE_OBJECT_SOURCE  = 0x00000002,
    WBEM_FLAG_IGNORE_DEFAULT_VALUES = 0x00000004,
    WBEM_FLAG_IGNORE_CLASS          = 0x00000008,
    WBEM_FLAG_IGNORE_CASE           = 0x00000010,
    WBEM_FLAG_IGNORE_FLAVOR         = 0x00000020,
}

alias WBEM_LOCKING_FLAG_TYPE = int;
enum : int
{
    WBEM_FLAG_ALLOW_READ = 0x00000001,
}

alias CIMTYPE_ENUMERATION = int;
enum : int
{
    CIM_ILLEGAL    = 0x00000fff,
    CIM_EMPTY      = 0x00000000,
    CIM_SINT8      = 0x00000010,
    CIM_UINT8      = 0x00000011,
    CIM_SINT16     = 0x00000002,
    CIM_UINT16     = 0x00000012,
    CIM_SINT32     = 0x00000003,
    CIM_UINT32     = 0x00000013,
    CIM_SINT64     = 0x00000014,
    CIM_UINT64     = 0x00000015,
    CIM_REAL32     = 0x00000004,
    CIM_REAL64     = 0x00000005,
    CIM_BOOLEAN    = 0x0000000b,
    CIM_STRING     = 0x00000008,
    CIM_DATETIME   = 0x00000065,
    CIM_REFERENCE  = 0x00000066,
    CIM_CHAR16     = 0x00000067,
    CIM_OBJECT     = 0x0000000d,
    CIM_FLAG_ARRAY = 0x00002000,
}

alias WBEM_BACKUP_RESTORE_FLAGS = int;
enum : int
{
    WBEM_FLAG_BACKUP_RESTORE_DEFAULT        = 0x00000000,
    WBEM_FLAG_BACKUP_RESTORE_FORCE_SHUTDOWN = 0x00000001,
}

alias WBEM_REFRESHER_FLAGS = int;
enum : int
{
    WBEM_FLAG_REFRESH_AUTO_RECONNECT    = 0x00000000,
    WBEM_FLAG_REFRESH_NO_AUTO_RECONNECT = 0x00000001,
}

alias WBEM_SHUTDOWN_FLAGS = int;
enum : int
{
    WBEM_SHUTDOWN_UNLOAD_COMPONENT = 0x00000001,
    WBEM_SHUTDOWN_WMI              = 0x00000002,
    WBEM_SHUTDOWN_OS               = 0x00000003,
}

alias WBEMSTATUS_FORMAT = int;
enum : int
{
    WBEMSTATUS_FORMAT_NEWLINE    = 0x00000000,
    WBEMSTATUS_FORMAT_NO_NEWLINE = 0x00000001,
}

alias WBEM_LIMITS = int;
enum : int
{
    WBEM_MAX_IDENTIFIER      = 0x00001000,
    WBEM_MAX_QUERY           = 0x00004000,
    WBEM_MAX_PATH            = 0x00002000,
    WBEM_MAX_OBJECT_NESTING  = 0x00000040,
    WBEM_MAX_USER_PROPERTIES = 0x00000400,
}

alias WBEMSTATUS = int;
enum : int
{
    WBEM_NO_ERROR                             = 0x00000000,
    WBEM_S_NO_ERROR                           = 0x00000000,
    WBEM_S_SAME                               = 0x00000000,
    WBEM_S_FALSE                              = 0x00000001,
    WBEM_S_ALREADY_EXISTS                     = 0x00040001,
    WBEM_S_RESET_TO_DEFAULT                   = 0x00040002,
    WBEM_S_DIFFERENT                          = 0x00040003,
    WBEM_S_TIMEDOUT                           = 0x00040004,
    WBEM_S_NO_MORE_DATA                       = 0x00040005,
    WBEM_S_OPERATION_CANCELLED                = 0x00040006,
    WBEM_S_PENDING                            = 0x00040007,
    WBEM_S_DUPLICATE_OBJECTS                  = 0x00040008,
    WBEM_S_ACCESS_DENIED                      = 0x00040009,
    WBEM_S_PARTIAL_RESULTS                    = 0x00040010,
    WBEM_S_SOURCE_NOT_AVAILABLE               = 0x00040017,
    WBEM_E_FAILED                             = 0x80041001,
    WBEM_E_NOT_FOUND                          = 0x80041002,
    WBEM_E_ACCESS_DENIED                      = 0x80041003,
    WBEM_E_PROVIDER_FAILURE                   = 0x80041004,
    WBEM_E_TYPE_MISMATCH                      = 0x80041005,
    WBEM_E_OUT_OF_MEMORY                      = 0x80041006,
    WBEM_E_INVALID_CONTEXT                    = 0x80041007,
    WBEM_E_INVALID_PARAMETER                  = 0x80041008,
    WBEM_E_NOT_AVAILABLE                      = 0x80041009,
    WBEM_E_CRITICAL_ERROR                     = 0x8004100a,
    WBEM_E_INVALID_STREAM                     = 0x8004100b,
    WBEM_E_NOT_SUPPORTED                      = 0x8004100c,
    WBEM_E_INVALID_SUPERCLASS                 = 0x8004100d,
    WBEM_E_INVALID_NAMESPACE                  = 0x8004100e,
    WBEM_E_INVALID_OBJECT                     = 0x8004100f,
    WBEM_E_INVALID_CLASS                      = 0x80041010,
    WBEM_E_PROVIDER_NOT_FOUND                 = 0x80041011,
    WBEM_E_INVALID_PROVIDER_REGISTRATION      = 0x80041012,
    WBEM_E_PROVIDER_LOAD_FAILURE              = 0x80041013,
    WBEM_E_INITIALIZATION_FAILURE             = 0x80041014,
    WBEM_E_TRANSPORT_FAILURE                  = 0x80041015,
    WBEM_E_INVALID_OPERATION                  = 0x80041016,
    WBEM_E_INVALID_QUERY                      = 0x80041017,
    WBEM_E_INVALID_QUERY_TYPE                 = 0x80041018,
    WBEM_E_ALREADY_EXISTS                     = 0x80041019,
    WBEM_E_OVERRIDE_NOT_ALLOWED               = 0x8004101a,
    WBEM_E_PROPAGATED_QUALIFIER               = 0x8004101b,
    WBEM_E_PROPAGATED_PROPERTY                = 0x8004101c,
    WBEM_E_UNEXPECTED                         = 0x8004101d,
    WBEM_E_ILLEGAL_OPERATION                  = 0x8004101e,
    WBEM_E_CANNOT_BE_KEY                      = 0x8004101f,
    WBEM_E_INCOMPLETE_CLASS                   = 0x80041020,
    WBEM_E_INVALID_SYNTAX                     = 0x80041021,
    WBEM_E_NONDECORATED_OBJECT                = 0x80041022,
    WBEM_E_READ_ONLY                          = 0x80041023,
    WBEM_E_PROVIDER_NOT_CAPABLE               = 0x80041024,
    WBEM_E_CLASS_HAS_CHILDREN                 = 0x80041025,
    WBEM_E_CLASS_HAS_INSTANCES                = 0x80041026,
    WBEM_E_QUERY_NOT_IMPLEMENTED              = 0x80041027,
    WBEM_E_ILLEGAL_NULL                       = 0x80041028,
    WBEM_E_INVALID_QUALIFIER_TYPE             = 0x80041029,
    WBEM_E_INVALID_PROPERTY_TYPE              = 0x8004102a,
    WBEM_E_VALUE_OUT_OF_RANGE                 = 0x8004102b,
    WBEM_E_CANNOT_BE_SINGLETON                = 0x8004102c,
    WBEM_E_INVALID_CIM_TYPE                   = 0x8004102d,
    WBEM_E_INVALID_METHOD                     = 0x8004102e,
    WBEM_E_INVALID_METHOD_PARAMETERS          = 0x8004102f,
    WBEM_E_SYSTEM_PROPERTY                    = 0x80041030,
    WBEM_E_INVALID_PROPERTY                   = 0x80041031,
    WBEM_E_CALL_CANCELLED                     = 0x80041032,
    WBEM_E_SHUTTING_DOWN                      = 0x80041033,
    WBEM_E_PROPAGATED_METHOD                  = 0x80041034,
    WBEM_E_UNSUPPORTED_PARAMETER              = 0x80041035,
    WBEM_E_MISSING_PARAMETER_ID               = 0x80041036,
    WBEM_E_INVALID_PARAMETER_ID               = 0x80041037,
    WBEM_E_NONCONSECUTIVE_PARAMETER_IDS       = 0x80041038,
    WBEM_E_PARAMETER_ID_ON_RETVAL             = 0x80041039,
    WBEM_E_INVALID_OBJECT_PATH                = 0x8004103a,
    WBEM_E_OUT_OF_DISK_SPACE                  = 0x8004103b,
    WBEM_E_BUFFER_TOO_SMALL                   = 0x8004103c,
    WBEM_E_UNSUPPORTED_PUT_EXTENSION          = 0x8004103d,
    WBEM_E_UNKNOWN_OBJECT_TYPE                = 0x8004103e,
    WBEM_E_UNKNOWN_PACKET_TYPE                = 0x8004103f,
    WBEM_E_MARSHAL_VERSION_MISMATCH           = 0x80041040,
    WBEM_E_MARSHAL_INVALID_SIGNATURE          = 0x80041041,
    WBEM_E_INVALID_QUALIFIER                  = 0x80041042,
    WBEM_E_INVALID_DUPLICATE_PARAMETER        = 0x80041043,
    WBEM_E_TOO_MUCH_DATA                      = 0x80041044,
    WBEM_E_SERVER_TOO_BUSY                    = 0x80041045,
    WBEM_E_INVALID_FLAVOR                     = 0x80041046,
    WBEM_E_CIRCULAR_REFERENCE                 = 0x80041047,
    WBEM_E_UNSUPPORTED_CLASS_UPDATE           = 0x80041048,
    WBEM_E_CANNOT_CHANGE_KEY_INHERITANCE      = 0x80041049,
    WBEM_E_CANNOT_CHANGE_INDEX_INHERITANCE    = 0x80041050,
    WBEM_E_TOO_MANY_PROPERTIES                = 0x80041051,
    WBEM_E_UPDATE_TYPE_MISMATCH               = 0x80041052,
    WBEM_E_UPDATE_OVERRIDE_NOT_ALLOWED        = 0x80041053,
    WBEM_E_UPDATE_PROPAGATED_METHOD           = 0x80041054,
    WBEM_E_METHOD_NOT_IMPLEMENTED             = 0x80041055,
    WBEM_E_METHOD_DISABLED                    = 0x80041056,
    WBEM_E_REFRESHER_BUSY                     = 0x80041057,
    WBEM_E_UNPARSABLE_QUERY                   = 0x80041058,
    WBEM_E_NOT_EVENT_CLASS                    = 0x80041059,
    WBEM_E_MISSING_GROUP_WITHIN               = 0x8004105a,
    WBEM_E_MISSING_AGGREGATION_LIST           = 0x8004105b,
    WBEM_E_PROPERTY_NOT_AN_OBJECT             = 0x8004105c,
    WBEM_E_AGGREGATING_BY_OBJECT              = 0x8004105d,
    WBEM_E_UNINTERPRETABLE_PROVIDER_QUERY     = 0x8004105f,
    WBEM_E_BACKUP_RESTORE_WINMGMT_RUNNING     = 0x80041060,
    WBEM_E_QUEUE_OVERFLOW                     = 0x80041061,
    WBEM_E_PRIVILEGE_NOT_HELD                 = 0x80041062,
    WBEM_E_INVALID_OPERATOR                   = 0x80041063,
    WBEM_E_LOCAL_CREDENTIALS                  = 0x80041064,
    WBEM_E_CANNOT_BE_ABSTRACT                 = 0x80041065,
    WBEM_E_AMENDED_OBJECT                     = 0x80041066,
    WBEM_E_CLIENT_TOO_SLOW                    = 0x80041067,
    WBEM_E_NULL_SECURITY_DESCRIPTOR           = 0x80041068,
    WBEM_E_TIMED_OUT                          = 0x80041069,
    WBEM_E_INVALID_ASSOCIATION                = 0x8004106a,
    WBEM_E_AMBIGUOUS_OPERATION                = 0x8004106b,
    WBEM_E_QUOTA_VIOLATION                    = 0x8004106c,
    WBEM_E_RESERVED_001                       = 0x8004106d,
    WBEM_E_RESERVED_002                       = 0x8004106e,
    WBEM_E_UNSUPPORTED_LOCALE                 = 0x8004106f,
    WBEM_E_HANDLE_OUT_OF_DATE                 = 0x80041070,
    WBEM_E_CONNECTION_FAILED                  = 0x80041071,
    WBEM_E_INVALID_HANDLE_REQUEST             = 0x80041072,
    WBEM_E_PROPERTY_NAME_TOO_WIDE             = 0x80041073,
    WBEM_E_CLASS_NAME_TOO_WIDE                = 0x80041074,
    WBEM_E_METHOD_NAME_TOO_WIDE               = 0x80041075,
    WBEM_E_QUALIFIER_NAME_TOO_WIDE            = 0x80041076,
    WBEM_E_RERUN_COMMAND                      = 0x80041077,
    WBEM_E_DATABASE_VER_MISMATCH              = 0x80041078,
    WBEM_E_VETO_DELETE                        = 0x80041079,
    WBEM_E_VETO_PUT                           = 0x8004107a,
    WBEM_E_INVALID_LOCALE                     = 0x80041080,
    WBEM_E_PROVIDER_SUSPENDED                 = 0x80041081,
    WBEM_E_SYNCHRONIZATION_REQUIRED           = 0x80041082,
    WBEM_E_NO_SCHEMA                          = 0x80041083,
    WBEM_E_PROVIDER_ALREADY_REGISTERED        = 0x80041084,
    WBEM_E_PROVIDER_NOT_REGISTERED            = 0x80041085,
    WBEM_E_FATAL_TRANSPORT_ERROR              = 0x80041086,
    WBEM_E_ENCRYPTED_CONNECTION_REQUIRED      = 0x80041087,
    WBEM_E_PROVIDER_TIMED_OUT                 = 0x80041088,
    WBEM_E_NO_KEY                             = 0x80041089,
    WBEM_E_PROVIDER_DISABLED                  = 0x8004108a,
    WBEMESS_E_REGISTRATION_TOO_BROAD          = 0x80042001,
    WBEMESS_E_REGISTRATION_TOO_PRECISE        = 0x80042002,
    WBEMESS_E_AUTHZ_NOT_PRIVILEGED            = 0x80042003,
    WBEMMOF_E_EXPECTED_QUALIFIER_NAME         = 0x80044001,
    WBEMMOF_E_EXPECTED_SEMI                   = 0x80044002,
    WBEMMOF_E_EXPECTED_OPEN_BRACE             = 0x80044003,
    WBEMMOF_E_EXPECTED_CLOSE_BRACE            = 0x80044004,
    WBEMMOF_E_EXPECTED_CLOSE_BRACKET          = 0x80044005,
    WBEMMOF_E_EXPECTED_CLOSE_PAREN            = 0x80044006,
    WBEMMOF_E_ILLEGAL_CONSTANT_VALUE          = 0x80044007,
    WBEMMOF_E_EXPECTED_TYPE_IDENTIFIER        = 0x80044008,
    WBEMMOF_E_EXPECTED_OPEN_PAREN             = 0x80044009,
    WBEMMOF_E_UNRECOGNIZED_TOKEN              = 0x8004400a,
    WBEMMOF_E_UNRECOGNIZED_TYPE               = 0x8004400b,
    WBEMMOF_E_EXPECTED_PROPERTY_NAME          = 0x8004400c,
    WBEMMOF_E_TYPEDEF_NOT_SUPPORTED           = 0x8004400d,
    WBEMMOF_E_UNEXPECTED_ALIAS                = 0x8004400e,
    WBEMMOF_E_UNEXPECTED_ARRAY_INIT           = 0x8004400f,
    WBEMMOF_E_INVALID_AMENDMENT_SYNTAX        = 0x80044010,
    WBEMMOF_E_INVALID_DUPLICATE_AMENDMENT     = 0x80044011,
    WBEMMOF_E_INVALID_PRAGMA                  = 0x80044012,
    WBEMMOF_E_INVALID_NAMESPACE_SYNTAX        = 0x80044013,
    WBEMMOF_E_EXPECTED_CLASS_NAME             = 0x80044014,
    WBEMMOF_E_TYPE_MISMATCH                   = 0x80044015,
    WBEMMOF_E_EXPECTED_ALIAS_NAME             = 0x80044016,
    WBEMMOF_E_INVALID_CLASS_DECLARATION       = 0x80044017,
    WBEMMOF_E_INVALID_INSTANCE_DECLARATION    = 0x80044018,
    WBEMMOF_E_EXPECTED_DOLLAR                 = 0x80044019,
    WBEMMOF_E_CIMTYPE_QUALIFIER               = 0x8004401a,
    WBEMMOF_E_DUPLICATE_PROPERTY              = 0x8004401b,
    WBEMMOF_E_INVALID_NAMESPACE_SPECIFICATION = 0x8004401c,
    WBEMMOF_E_OUT_OF_RANGE                    = 0x8004401d,
    WBEMMOF_E_INVALID_FILE                    = 0x8004401e,
    WBEMMOF_E_ALIASES_IN_EMBEDDED             = 0x8004401f,
    WBEMMOF_E_NULL_ARRAY_ELEM                 = 0x80044020,
    WBEMMOF_E_DUPLICATE_QUALIFIER             = 0x80044021,
    WBEMMOF_E_EXPECTED_FLAVOR_TYPE            = 0x80044022,
    WBEMMOF_E_INCOMPATIBLE_FLAVOR_TYPES       = 0x80044023,
    WBEMMOF_E_MULTIPLE_ALIASES                = 0x80044024,
    WBEMMOF_E_INCOMPATIBLE_FLAVOR_TYPES2      = 0x80044025,
    WBEMMOF_E_NO_ARRAYS_RETURNED              = 0x80044026,
    WBEMMOF_E_MUST_BE_IN_OR_OUT               = 0x80044027,
    WBEMMOF_E_INVALID_FLAGS_SYNTAX            = 0x80044028,
    WBEMMOF_E_EXPECTED_BRACE_OR_BAD_TYPE      = 0x80044029,
    WBEMMOF_E_UNSUPPORTED_CIMV22_QUAL_VALUE   = 0x8004402a,
    WBEMMOF_E_UNSUPPORTED_CIMV22_DATA_TYPE    = 0x8004402b,
    WBEMMOF_E_INVALID_DELETEINSTANCE_SYNTAX   = 0x8004402c,
    WBEMMOF_E_INVALID_QUALIFIER_SYNTAX        = 0x8004402d,
    WBEMMOF_E_QUALIFIER_USED_OUTSIDE_SCOPE    = 0x8004402e,
    WBEMMOF_E_ERROR_CREATING_TEMP_FILE        = 0x8004402f,
    WBEMMOF_E_ERROR_INVALID_INCLUDE_FILE      = 0x80044030,
    WBEMMOF_E_INVALID_DELETECLASS_SYNTAX      = 0x80044031,
}

enum IID_IWbemClassObject = GUID(0xdc12a681, 0x737f, 0x11cf, [0x88, 0x4d, 0x0, 0xaa, 0x0, 0x4b, 0x2e, 0x24]);
interface IWbemClassObject : IUnknown
{
    HRESULT GetQualifierSet(IWbemQualifierSet*);
    HRESULT Get(const(wchar)*, int, VARIANT*, int*, int*);
    HRESULT Put(const(wchar)*, int, VARIANT*, int);
    HRESULT Delete(const(wchar)*);
    HRESULT GetNames(const(wchar)*, WBEM_CONDITION_FLAG_TYPE, VARIANT*, SAFEARRAY**);
    HRESULT BeginEnumeration(int);
    HRESULT Next(int, BSTR*, VARIANT*, int*, int*);
    HRESULT EndEnumeration();
    HRESULT GetPropertyQualifierSet(const(wchar)*, IWbemQualifierSet*);
    HRESULT Clone(IWbemClassObject*);
    HRESULT GetObjectText(int, BSTR*);
    HRESULT SpawnDerivedClass(int, IWbemClassObject*);
    HRESULT SpawnInstance(int, IWbemClassObject*);
    HRESULT CompareTo(WBEM_COMPARISON_FLAG, IWbemClassObject);
    HRESULT GetPropertyOrigin(const(wchar)*, BSTR*);
    HRESULT InheritsFrom(const(wchar)*);
    HRESULT GetMethod(const(wchar)*, int, IWbemClassObject*, IWbemClassObject*);
    HRESULT PutMethod(const(wchar)*, int, IWbemClassObject, IWbemClassObject);
    HRESULT DeleteMethod(const(wchar)*);
    HRESULT BeginMethodEnumeration(int);
    HRESULT NextMethod(int, BSTR*, IWbemClassObject*, IWbemClassObject*);
    HRESULT EndMethodEnumeration();
    HRESULT GetMethodQualifierSet(const(wchar)*, IWbemQualifierSet*);
    HRESULT GetMethodOrigin(const(wchar)*, BSTR*);
}
enum IID_IWbemObjectAccess = GUID(0x49353c9a, 0x516b, 0x11d1, [0xae, 0xa6, 0x0, 0xc0, 0x4f, 0xb6, 0x88, 0x20]);
interface IWbemObjectAccess : IWbemClassObject
{
    HRESULT GetPropertyHandle(const(wchar)*, int*, int*);
    HRESULT WritePropertyValue(int, int, const(ubyte)*);
    HRESULT ReadPropertyValue(int, int, int*, ubyte*);
    HRESULT ReadDWORD(int, uint*);
    HRESULT WriteDWORD(int, uint);
    HRESULT ReadQWORD(int, ulong*);
    HRESULT WriteQWORD(int, ulong);
    HRESULT GetPropertyInfoByHandle(int, BSTR*, int*);
    HRESULT Lock(int);
    HRESULT Unlock(int);
}
enum IID_IWbemQualifierSet = GUID(0xdc12a680, 0x737f, 0x11cf, [0x88, 0x4d, 0x0, 0xaa, 0x0, 0x4b, 0x2e, 0x24]);
interface IWbemQualifierSet : IUnknown
{
    HRESULT Get(const(wchar)*, int, VARIANT*, int*);
    HRESULT Put(const(wchar)*, VARIANT*, int);
    HRESULT Delete(const(wchar)*);
    HRESULT GetNames(int, SAFEARRAY**);
    HRESULT BeginEnumeration(int);
    HRESULT Next(int, BSTR*, VARIANT*, int*);
    HRESULT EndEnumeration();
}
enum IID_IWbemServices = GUID(0x9556dc99, 0x828c, 0x11cf, [0xa3, 0x7e, 0x0, 0xaa, 0x0, 0x32, 0x40, 0xc7]);
interface IWbemServices : IUnknown
{
    HRESULT OpenNamespace(const(BSTR), int, IWbemContext, IWbemServices*, IWbemCallResult*);
    HRESULT CancelAsyncCall(IWbemObjectSink);
    HRESULT QueryObjectSink(int, IWbemObjectSink*);
    HRESULT GetObject(const(BSTR), int, IWbemContext, IWbemClassObject*, IWbemCallResult*);
    HRESULT GetObjectAsync(const(BSTR), int, IWbemContext, IWbemObjectSink);
    HRESULT PutClass(IWbemClassObject, int, IWbemContext, IWbemCallResult*);
    HRESULT PutClassAsync(IWbemClassObject, int, IWbemContext, IWbemObjectSink);
    HRESULT DeleteClass(const(BSTR), int, IWbemContext, IWbemCallResult*);
    HRESULT DeleteClassAsync(const(BSTR), int, IWbemContext, IWbemObjectSink);
    HRESULT CreateClassEnum(const(BSTR), int, IWbemContext, IEnumWbemClassObject*);
    HRESULT CreateClassEnumAsync(const(BSTR), int, IWbemContext, IWbemObjectSink);
    HRESULT PutInstance(IWbemClassObject, int, IWbemContext, IWbemCallResult*);
    HRESULT PutInstanceAsync(IWbemClassObject, int, IWbemContext, IWbemObjectSink);
    HRESULT DeleteInstance(const(BSTR), int, IWbemContext, IWbemCallResult*);
    HRESULT DeleteInstanceAsync(const(BSTR), int, IWbemContext, IWbemObjectSink);
    HRESULT CreateInstanceEnum(const(BSTR), int, IWbemContext, IEnumWbemClassObject*);
    HRESULT CreateInstanceEnumAsync(const(BSTR), int, IWbemContext, IWbemObjectSink);
    HRESULT ExecQuery(const(BSTR), const(BSTR), WBEM_GENERIC_FLAG_TYPE, IWbemContext, IEnumWbemClassObject*);
    HRESULT ExecQueryAsync(const(BSTR), const(BSTR), int, IWbemContext, IWbemObjectSink);
    HRESULT ExecNotificationQuery(const(BSTR), const(BSTR), int, IWbemContext, IEnumWbemClassObject*);
    HRESULT ExecNotificationQueryAsync(const(BSTR), const(BSTR), int, IWbemContext, IWbemObjectSink);
    HRESULT ExecMethod(const(BSTR), const(BSTR), int, IWbemContext, IWbemClassObject, IWbemClassObject*, IWbemCallResult*);
    HRESULT ExecMethodAsync(const(BSTR), const(BSTR), int, IWbemContext, IWbemClassObject, IWbemObjectSink);
}
enum IID_IWbemLocator = GUID(0xdc12a687, 0x737f, 0x11cf, [0x88, 0x4d, 0x0, 0xaa, 0x0, 0x4b, 0x2e, 0x24]);
interface IWbemLocator : IUnknown
{
    HRESULT ConnectServer(const(BSTR), const(BSTR), const(BSTR), const(BSTR), int, const(BSTR), IWbemContext, IWbemServices*);
}
enum IID_IWbemObjectSink = GUID(0x7c857801, 0x7381, 0x11cf, [0x88, 0x4d, 0x0, 0xaa, 0x0, 0x4b, 0x2e, 0x24]);
interface IWbemObjectSink : IUnknown
{
    HRESULT Indicate(int, IWbemClassObject*);
    HRESULT SetStatus(int, HRESULT, BSTR, IWbemClassObject);
}
enum IID_IEnumWbemClassObject = GUID(0x27947e1, 0xd731, 0x11ce, [0xa3, 0x57, 0x0, 0x0, 0x0, 0x0, 0x0, 0x1]);
interface IEnumWbemClassObject : IUnknown
{
    HRESULT Reset();
    HRESULT Next(int, uint, IWbemClassObject*, uint*);
    HRESULT NextAsync(uint, IWbemObjectSink);
    HRESULT Clone(IEnumWbemClassObject*);
    HRESULT Skip(int, uint);
}
enum IID_IWbemCallResult = GUID(0x44aca675, 0xe8fc, 0x11d0, [0xa0, 0x7c, 0x0, 0xc0, 0x4f, 0xb6, 0x88, 0x20]);
interface IWbemCallResult : IUnknown
{
    HRESULT GetResultObject(int, IWbemClassObject*);
    HRESULT GetResultString(int, BSTR*);
    HRESULT GetResultServices(int, IWbemServices*);
    HRESULT GetCallStatus(int, int*);
}
enum IID_IWbemContext = GUID(0x44aca674, 0xe8fc, 0x11d0, [0xa0, 0x7c, 0x0, 0xc0, 0x4f, 0xb6, 0x88, 0x20]);
interface IWbemContext : IUnknown
{
    HRESULT Clone(IWbemContext*);
    HRESULT GetNames(int, SAFEARRAY**);
    HRESULT BeginEnumeration(int);
    HRESULT Next(int, BSTR*, VARIANT*);
    HRESULT EndEnumeration();
    HRESULT SetValue(const(wchar)*, int, VARIANT*);
    HRESULT GetValue(const(wchar)*, int, VARIANT*);
    HRESULT DeleteValue(const(wchar)*, int);
    HRESULT DeleteAll();
}
enum IID_IUnsecuredApartment = GUID(0x1cfaba8c, 0x1523, 0x11d1, [0xad, 0x79, 0x0, 0xc0, 0x4f, 0xd8, 0xfd, 0xff]);
interface IUnsecuredApartment : IUnknown
{
    HRESULT CreateObjectStub(IUnknown, IUnknown*);
}
enum IID_IWbemUnsecuredApartment = GUID(0x31739d04, 0x3471, 0x4cf4, [0x9a, 0x7c, 0x57, 0xa4, 0x4a, 0xe7, 0x19, 0x56]);
interface IWbemUnsecuredApartment : IUnsecuredApartment
{
    HRESULT CreateSinkStub(IWbemObjectSink, uint, const(wchar)*, IWbemObjectSink*);
}
enum IID_IWbemStatusCodeText = GUID(0xeb87e1bc, 0x3233, 0x11d2, [0xae, 0xc9, 0x0, 0xc0, 0x4f, 0xb6, 0x88, 0x20]);
interface IWbemStatusCodeText : IUnknown
{
    HRESULT GetErrorCodeText(HRESULT, uint, int, BSTR*);
    HRESULT GetFacilityCodeText(HRESULT, uint, int, BSTR*);
}
enum IID_IWbemBackupRestore = GUID(0xc49e32c7, 0xbc8b, 0x11d2, [0x85, 0xd4, 0x0, 0x10, 0x5a, 0x1f, 0x83, 0x4]);
interface IWbemBackupRestore : IUnknown
{
    HRESULT Backup(const(wchar)*, int);
    HRESULT Restore(const(wchar)*, int);
}
enum IID_IWbemBackupRestoreEx = GUID(0xa359dec5, 0xe813, 0x4834, [0x8a, 0x2a, 0xba, 0x7f, 0x1d, 0x77, 0x7d, 0x76]);
interface IWbemBackupRestoreEx : IWbemBackupRestore
{
    HRESULT Pause();
    HRESULT Resume();
}
enum IID_IWbemRefresher = GUID(0x49353c99, 0x516b, 0x11d1, [0xae, 0xa6, 0x0, 0xc0, 0x4f, 0xb6, 0x88, 0x20]);
interface IWbemRefresher : IUnknown
{
    HRESULT Refresh(int);
}
enum IID_IWbemHiPerfEnum = GUID(0x2705c288, 0x79ae, 0x11d2, [0xb3, 0x48, 0x0, 0x10, 0x5a, 0x1f, 0x81, 0x77]);
interface IWbemHiPerfEnum : IUnknown
{
    HRESULT AddObjects(int, uint, int*, IWbemObjectAccess*);
    HRESULT RemoveObjects(int, uint, int*);
    HRESULT GetObjects(int, uint, IWbemObjectAccess*, uint*);
    HRESULT RemoveAll(int);
}
enum IID_IWbemConfigureRefresher = GUID(0x49353c92, 0x516b, 0x11d1, [0xae, 0xa6, 0x0, 0xc0, 0x4f, 0xb6, 0x88, 0x20]);
interface IWbemConfigureRefresher : IUnknown
{
    HRESULT AddObjectByPath(IWbemServices, const(wchar)*, int, IWbemContext, IWbemClassObject*, int*);
    HRESULT AddObjectByTemplate(IWbemServices, IWbemClassObject, int, IWbemContext, IWbemClassObject*, int*);
    HRESULT AddRefresher(IWbemRefresher, int, int*);
    HRESULT Remove(int, int);
    HRESULT AddEnum(IWbemServices, const(wchar)*, int, IWbemContext, IWbemHiPerfEnum*, int*);
}
enum CLSID_WbemLocator = GUID(0x4590f811, 0x1d3a, 0x11d0, [0x89, 0x1f, 0x0, 0xaa, 0x0, 0x4b, 0x2e, 0x24]);
struct WbemLocator
{
}
enum CLSID_WbemContext = GUID(0x674b6698, 0xee92, 0x11d0, [0xad, 0x71, 0x0, 0xc0, 0x4f, 0xd8, 0xfd, 0xff]);
struct WbemContext
{
}
enum CLSID_UnsecuredApartment = GUID(0x49bd2028, 0x1523, 0x11d1, [0xad, 0x79, 0x0, 0xc0, 0x4f, 0xd8, 0xfd, 0xff]);
struct UnsecuredApartment
{
}
enum CLSID_WbemClassObject = GUID(0x9a653086, 0x174f, 0x11d2, [0xb5, 0xf9, 0x0, 0x10, 0x4b, 0x70, 0x3e, 0xfd]);
struct WbemClassObject
{
}
enum CLSID_MofCompiler = GUID(0x6daf9757, 0x2e37, 0x11d2, [0xae, 0xc9, 0x0, 0xc0, 0x4f, 0xb6, 0x88, 0x20]);
struct MofCompiler
{
}
enum CLSID_WbemStatusCodeText = GUID(0xeb87e1bd, 0x3233, 0x11d2, [0xae, 0xc9, 0x0, 0xc0, 0x4f, 0xb6, 0x88, 0x20]);
struct WbemStatusCodeText
{
}
enum CLSID_WbemBackupRestore = GUID(0xc49e32c6, 0xbc8b, 0x11d2, [0x85, 0xd4, 0x0, 0x10, 0x5a, 0x1f, 0x83, 0x4]);
struct WbemBackupRestore
{
}
enum CLSID_WbemRefresher = GUID(0xc71566f2, 0x561e, 0x11d1, [0xad, 0x87, 0x0, 0xc0, 0x4f, 0xd8, 0xfd, 0xff]);
struct WbemRefresher
{
}
enum CLSID_WbemObjectTextSrc = GUID(0x8d1c559d, 0x84f0, 0x4bb3, [0xa7, 0xd5, 0x56, 0xa7, 0x43, 0x5a, 0x9b, 0xa6]);
struct WbemObjectTextSrc
{
}
enum IID_IWbemObjectSinkEx = GUID(0xe7d35cfa, 0x348b, 0x485e, [0xb5, 0x24, 0x25, 0x27, 0x25, 0xd6, 0x97, 0xca]);
interface IWbemObjectSinkEx : IWbemObjectSink
{
    HRESULT WriteMessage(uint, const(BSTR));
    HRESULT WriteError(IWbemClassObject, ubyte*);
    HRESULT PromptUser(const(BSTR), ubyte, ubyte*);
    HRESULT WriteProgress(const(BSTR), const(BSTR), const(BSTR), uint, uint);
    HRESULT WriteStreamParameter(const(BSTR), VARIANT*, uint, uint);
}
enum IID_IWbemShutdown = GUID(0xb7b31df9, 0xd515, 0x11d3, [0xa1, 0x1c, 0x0, 0x10, 0x5a, 0x1f, 0x51, 0x5a]);
interface IWbemShutdown : IUnknown
{
    HRESULT Shutdown(int, uint, IWbemContext);
}
alias WMI_OBJ_TEXT = int;
enum : int
{
    WMI_OBJ_TEXT_CIM_DTD_2_0 = 0x00000001,
    WMI_OBJ_TEXT_WMI_DTD_2_0 = 0x00000002,
    WMI_OBJ_TEXT_WMI_EXT1    = 0x00000003,
    WMI_OBJ_TEXT_WMI_EXT2    = 0x00000004,
    WMI_OBJ_TEXT_WMI_EXT3    = 0x00000005,
    WMI_OBJ_TEXT_WMI_EXT4    = 0x00000006,
    WMI_OBJ_TEXT_WMI_EXT5    = 0x00000007,
    WMI_OBJ_TEXT_WMI_EXT6    = 0x00000008,
    WMI_OBJ_TEXT_WMI_EXT7    = 0x00000009,
    WMI_OBJ_TEXT_WMI_EXT8    = 0x0000000a,
    WMI_OBJ_TEXT_WMI_EXT9    = 0x0000000b,
    WMI_OBJ_TEXT_WMI_EXT10   = 0x0000000c,
    WMI_OBJ_TEXT_LAST        = 0x0000000d,
}

enum IID_IWbemObjectTextSrc = GUID(0xbfbf883a, 0xcad7, 0x11d3, [0xa1, 0x1b, 0x0, 0x10, 0x5a, 0x1f, 0x51, 0x5a]);
interface IWbemObjectTextSrc : IUnknown
{
    HRESULT GetText(int, IWbemClassObject, uint, IWbemContext, BSTR*);
    HRESULT CreateFromText(int, BSTR, uint, IWbemContext, IWbemClassObject*);
}
struct WBEM_COMPILE_STATUS_INFO
{
    int lPhaseError;
    HRESULT hRes;
    int ObjectNum;
    int FirstLine;
    int LastLine;
    uint dwOutFlags;
}
alias WBEM_COMPILER_OPTIONS = int;
enum : int
{
    WBEM_FLAG_CHECK_ONLY       = 0x00000001,
    WBEM_FLAG_AUTORECOVER      = 0x00000002,
    WBEM_FLAG_WMI_CHECK        = 0x00000004,
    WBEM_FLAG_CONSOLE_PRINT    = 0x00000008,
    WBEM_FLAG_DONT_ADD_TO_LIST = 0x00000010,
    WBEM_FLAG_SPLIT_FILES      = 0x00000020,
    WBEM_FLAG_STORE_FILE       = 0x00000100,
}

alias WBEM_CONNECT_OPTIONS = int;
enum : int
{
    WBEM_FLAG_CONNECT_REPOSITORY_ONLY = 0x00000040,
    WBEM_FLAG_CONNECT_USE_MAX_WAIT    = 0x00000080,
    WBEM_FLAG_CONNECT_PROVIDERS       = 0x00000100,
}

enum IID_IMofCompiler = GUID(0x6daf974e, 0x2e37, 0x11d2, [0xae, 0xc9, 0x0, 0xc0, 0x4f, 0xb6, 0x88, 0x20]);
interface IMofCompiler : IUnknown
{
    HRESULT CompileFile(PWSTR, PWSTR, PWSTR, PWSTR, PWSTR, int, int, int, WBEM_COMPILE_STATUS_INFO*);
    HRESULT CompileBuffer(int, ubyte*, PWSTR, PWSTR, PWSTR, PWSTR, int, int, int, WBEM_COMPILE_STATUS_INFO*);
    HRESULT CreateBMOF(PWSTR, PWSTR, PWSTR, int, int, int, WBEM_COMPILE_STATUS_INFO*);
}
alias WBEM_UNSECAPP_FLAG_TYPE = int;
enum : int
{
    WBEM_FLAG_UNSECAPP_DEFAULT_CHECK_ACCESS = 0x00000000,
    WBEM_FLAG_UNSECAPP_CHECK_ACCESS         = 0x00000001,
    WBEM_FLAG_UNSECAPP_DONT_CHECK_ACCESS    = 0x00000002,
}

alias WBEM_INFORMATION_FLAG_TYPE = int;
enum : int
{
    WBEM_FLAG_SHORT_NAME = 0x00000001,
    WBEM_FLAG_LONG_NAME  = 0x00000002,
}

alias WBEM_PROVIDER_REQUIREMENTS_TYPE = int;
enum : int
{
    WBEM_REQUIREMENTS_START_POSTFILTER      = 0x00000000,
    WBEM_REQUIREMENTS_STOP_POSTFILTER       = 0x00000001,
    WBEM_REQUIREMENTS_RECHECK_SUBSCRIPTIONS = 0x00000002,
}

enum IID_IWbemPropertyProvider = GUID(0xce61e841, 0x65bc, 0x11d0, [0xb6, 0xbd, 0x0, 0xaa, 0x0, 0x32, 0x40, 0xc7]);
interface IWbemPropertyProvider : IUnknown
{
    HRESULT GetProperty(int, const(BSTR), const(BSTR), const(BSTR), const(BSTR), VARIANT*);
    HRESULT PutProperty(int, const(BSTR), const(BSTR), const(BSTR), const(BSTR), const(VARIANT)*);
}
enum IID_IWbemUnboundObjectSink = GUID(0xe246107b, 0xb06e, 0x11d0, [0xad, 0x61, 0x0, 0xc0, 0x4f, 0xd8, 0xfd, 0xff]);
interface IWbemUnboundObjectSink : IUnknown
{
    HRESULT IndicateToConsumer(IWbemClassObject, int, IWbemClassObject*);
}
enum IID_IWbemEventProvider = GUID(0xe245105b, 0xb06e, 0x11d0, [0xad, 0x61, 0x0, 0xc0, 0x4f, 0xd8, 0xfd, 0xff]);
interface IWbemEventProvider : IUnknown
{
    HRESULT ProvideEvents(IWbemObjectSink, int);
}
enum IID_IWbemEventProviderQuerySink = GUID(0x580acaf8, 0xfa1c, 0x11d0, [0xad, 0x72, 0x0, 0xc0, 0x4f, 0xd8, 0xfd, 0xff]);
interface IWbemEventProviderQuerySink : IUnknown
{
    HRESULT NewQuery(uint, ushort*, ushort*);
    HRESULT CancelQuery(uint);
}
enum IID_IWbemEventProviderSecurity = GUID(0x631f7d96, 0xd993, 0x11d2, [0xb3, 0x39, 0x0, 0x10, 0x5a, 0x1f, 0x4a, 0xaf]);
interface IWbemEventProviderSecurity : IUnknown
{
    HRESULT AccessCheck(ushort*, ushort*, int, const(ubyte)*);
}
enum IID_IWbemEventConsumerProvider = GUID(0xe246107a, 0xb06e, 0x11d0, [0xad, 0x61, 0x0, 0xc0, 0x4f, 0xd8, 0xfd, 0xff]);
interface IWbemEventConsumerProvider : IUnknown
{
    HRESULT FindConsumer(IWbemClassObject, IWbemUnboundObjectSink*);
}
enum IID_IWbemProviderInitSink = GUID(0x1be41571, 0x91dd, 0x11d1, [0xae, 0xb2, 0x0, 0xc0, 0x4f, 0xb6, 0x88, 0x20]);
interface IWbemProviderInitSink : IUnknown
{
    HRESULT SetStatus(int, int);
}
enum IID_IWbemProviderInit = GUID(0x1be41572, 0x91dd, 0x11d1, [0xae, 0xb2, 0x0, 0xc0, 0x4f, 0xb6, 0x88, 0x20]);
interface IWbemProviderInit : IUnknown
{
    HRESULT Initialize(PWSTR, int, PWSTR, PWSTR, IWbemServices, IWbemContext, IWbemProviderInitSink);
}
enum IID_IWbemHiPerfProvider = GUID(0x49353c93, 0x516b, 0x11d1, [0xae, 0xa6, 0x0, 0xc0, 0x4f, 0xb6, 0x88, 0x20]);
interface IWbemHiPerfProvider : IUnknown
{
    HRESULT QueryInstances(IWbemServices, PWSTR, int, IWbemContext, IWbemObjectSink);
    HRESULT CreateRefresher(IWbemServices, int, IWbemRefresher*);
    HRESULT CreateRefreshableObject(IWbemServices, IWbemObjectAccess, IWbemRefresher, int, IWbemContext, IWbemObjectAccess*, int*);
    HRESULT StopRefreshing(IWbemRefresher, int, int);
    HRESULT CreateRefreshableEnum(IWbemServices, const(wchar)*, IWbemRefresher, int, IWbemContext, IWbemHiPerfEnum, int*);
    HRESULT GetObjects(IWbemServices, int, IWbemObjectAccess*, int, IWbemContext);
}
enum IID_IWbemDecoupledRegistrar = GUID(0x1005cbcf, 0xe64f, 0x4646, [0xbc, 0xd3, 0x3a, 0x8, 0x9d, 0x8a, 0x84, 0xb4]);
interface IWbemDecoupledRegistrar : IUnknown
{
    HRESULT Register(int, IWbemContext, const(wchar)*, const(wchar)*, const(wchar)*, const(wchar)*, IUnknown);
    HRESULT UnRegister();
}
enum CLSID_WbemAdministrativeLocator = GUID(0xcb8555cc, 0x9128, 0x11d1, [0xad, 0x9b, 0x0, 0xc0, 0x4f, 0xd8, 0xfd, 0xff]);
struct WbemAdministrativeLocator
{
}
enum CLSID_WbemAuthenticatedLocator = GUID(0xcd184336, 0x9128, 0x11d1, [0xad, 0x9b, 0x0, 0xc0, 0x4f, 0xd8, 0xfd, 0xff]);
struct WbemAuthenticatedLocator
{
}
enum CLSID_WbemUnauthenticatedLocator = GUID(0x443e7b79, 0xde31, 0x11d2, [0xb3, 0x40, 0x0, 0x10, 0x4b, 0xcc, 0x4b, 0x4a]);
struct WbemUnauthenticatedLocator
{
}
enum CLSID_WbemDecoupledRegistrar = GUID(0x4cfc7932, 0xf9d, 0x4bef, [0x9c, 0x32, 0x8e, 0xa2, 0xa6, 0xb5, 0x6f, 0xcb]);
struct WbemDecoupledRegistrar
{
}
enum CLSID_WbemDecoupledBasicEventProvider = GUID(0xf5f75737, 0x2843, 0x4f22, [0x93, 0x3d, 0xc7, 0x6a, 0x97, 0xcd, 0xa6, 0x2f]);
struct WbemDecoupledBasicEventProvider
{
}
enum IID_IWbemProviderIdentity = GUID(0x631f7d97, 0xd993, 0x11d2, [0xb3, 0x39, 0x0, 0x10, 0x5a, 0x1f, 0x4a, 0xaf]);
interface IWbemProviderIdentity : IUnknown
{
    HRESULT SetRegistrationObject(int, IWbemClassObject);
}
alias WBEM_EXTRA_RETURN_CODES = int;
enum : int
{
    WBEM_S_INITIALIZED         = 0x00000000,
    WBEM_S_LIMITED_SERVICE     = 0x00043001,
    WBEM_S_INDIRECTLY_UPDATED  = 0x00043002,
    WBEM_S_SUBJECT_TO_SDS      = 0x00043003,
    WBEM_E_RETRY_LATER         = 0x80043001,
    WBEM_E_RESOURCE_CONTENTION = 0x80043002,
}

alias WBEM_PROVIDER_FLAGS = int;
enum : int
{
    WBEM_FLAG_OWNER_UPDATE = 0x00010000,
}

enum IID_IWbemDecoupledBasicEventProvider = GUID(0x86336d20, 0xca11, 0x4786, [0x9e, 0xf1, 0xbc, 0x8a, 0x94, 0x6b, 0x42, 0xfc]);
interface IWbemDecoupledBasicEventProvider : IWbemDecoupledRegistrar
{
    HRESULT GetSink(int, IWbemContext, IWbemObjectSink*);
    HRESULT GetService(int, IWbemContext, IWbemServices*);
}
alias WBEM_BATCH_TYPE = int;
enum : int
{
    WBEM_FLAG_BATCH_IF_NEEDED = 0x00000000,
    WBEM_FLAG_MUST_BATCH      = 0x00000001,
    WBEM_FLAG_MUST_NOT_BATCH  = 0x00000002,
}

enum IID_IWbemEventSink = GUID(0x3ae0080a, 0x7e3a, 0x4366, [0xbf, 0x89, 0xf, 0xee, 0xdc, 0x93, 0x16, 0x59]);
interface IWbemEventSink : IWbemObjectSink
{
    HRESULT SetSinkSecurity(int, ubyte*);
    HRESULT IsActive();
    HRESULT GetRestrictedSink(int, const(wchar)**, IUnknown, IWbemEventSink*);
    HRESULT SetBatchingParameters(int, uint, uint);
}
alias WbemChangeFlagEnum = int;
enum : int
{
    wbemChangeFlagCreateOrUpdate   = 0x00000000,
    wbemChangeFlagUpdateOnly       = 0x00000001,
    wbemChangeFlagCreateOnly       = 0x00000002,
    wbemChangeFlagUpdateCompatible = 0x00000000,
    wbemChangeFlagUpdateSafeMode   = 0x00000020,
    wbemChangeFlagUpdateForceMode  = 0x00000040,
    wbemChangeFlagStrongValidation = 0x00000080,
    wbemChangeFlagAdvisory         = 0x00010000,
}

alias WbemFlagEnum = int;
enum : int
{
    wbemFlagReturnImmediately    = 0x00000010,
    wbemFlagReturnWhenComplete   = 0x00000000,
    wbemFlagBidirectional        = 0x00000000,
    wbemFlagForwardOnly          = 0x00000020,
    wbemFlagNoErrorObject        = 0x00000040,
    wbemFlagReturnErrorObject    = 0x00000000,
    wbemFlagSendStatus           = 0x00000080,
    wbemFlagDontSendStatus       = 0x00000000,
    wbemFlagEnsureLocatable      = 0x00000100,
    wbemFlagDirectRead           = 0x00000200,
    wbemFlagSendOnlySelected     = 0x00000000,
    wbemFlagUseAmendedQualifiers = 0x00020000,
    wbemFlagGetDefault           = 0x00000000,
    wbemFlagSpawnInstance        = 0x00000001,
    wbemFlagUseCurrentTime       = 0x00000001,
}

alias WbemQueryFlagEnum = int;
enum : int
{
    wbemQueryFlagDeep      = 0x00000000,
    wbemQueryFlagShallow   = 0x00000001,
    wbemQueryFlagPrototype = 0x00000002,
}

alias WbemTextFlagEnum = int;
enum : int
{
    wbemTextFlagNoFlavors = 0x00000001,
}

alias WbemTimeout = int;
enum : int
{
    wbemTimeoutInfinite = 0xffffffff,
}

alias WbemComparisonFlagEnum = int;
enum : int
{
    wbemComparisonFlagIncludeAll          = 0x00000000,
    wbemComparisonFlagIgnoreQualifiers    = 0x00000001,
    wbemComparisonFlagIgnoreObjectSource  = 0x00000002,
    wbemComparisonFlagIgnoreDefaultValues = 0x00000004,
    wbemComparisonFlagIgnoreClass         = 0x00000008,
    wbemComparisonFlagIgnoreCase          = 0x00000010,
    wbemComparisonFlagIgnoreFlavor        = 0x00000020,
}

alias WbemCimtypeEnum = int;
enum : int
{
    wbemCimtypeSint8     = 0x00000010,
    wbemCimtypeUint8     = 0x00000011,
    wbemCimtypeSint16    = 0x00000002,
    wbemCimtypeUint16    = 0x00000012,
    wbemCimtypeSint32    = 0x00000003,
    wbemCimtypeUint32    = 0x00000013,
    wbemCimtypeSint64    = 0x00000014,
    wbemCimtypeUint64    = 0x00000015,
    wbemCimtypeReal32    = 0x00000004,
    wbemCimtypeReal64    = 0x00000005,
    wbemCimtypeBoolean   = 0x0000000b,
    wbemCimtypeString    = 0x00000008,
    wbemCimtypeDatetime  = 0x00000065,
    wbemCimtypeReference = 0x00000066,
    wbemCimtypeChar16    = 0x00000067,
    wbemCimtypeObject    = 0x0000000d,
}

alias WbemErrorEnum = int;
enum : int
{
    wbemNoErr                           = 0x00000000,
    wbemErrFailed                       = 0x80041001,
    wbemErrNotFound                     = 0x80041002,
    wbemErrAccessDenied                 = 0x80041003,
    wbemErrProviderFailure              = 0x80041004,
    wbemErrTypeMismatch                 = 0x80041005,
    wbemErrOutOfMemory                  = 0x80041006,
    wbemErrInvalidContext               = 0x80041007,
    wbemErrInvalidParameter             = 0x80041008,
    wbemErrNotAvailable                 = 0x80041009,
    wbemErrCriticalError                = 0x8004100a,
    wbemErrInvalidStream                = 0x8004100b,
    wbemErrNotSupported                 = 0x8004100c,
    wbemErrInvalidSuperclass            = 0x8004100d,
    wbemErrInvalidNamespace             = 0x8004100e,
    wbemErrInvalidObject                = 0x8004100f,
    wbemErrInvalidClass                 = 0x80041010,
    wbemErrProviderNotFound             = 0x80041011,
    wbemErrInvalidProviderRegistration  = 0x80041012,
    wbemErrProviderLoadFailure          = 0x80041013,
    wbemErrInitializationFailure        = 0x80041014,
    wbemErrTransportFailure             = 0x80041015,
    wbemErrInvalidOperation             = 0x80041016,
    wbemErrInvalidQuery                 = 0x80041017,
    wbemErrInvalidQueryType             = 0x80041018,
    wbemErrAlreadyExists                = 0x80041019,
    wbemErrOverrideNotAllowed           = 0x8004101a,
    wbemErrPropagatedQualifier          = 0x8004101b,
    wbemErrPropagatedProperty           = 0x8004101c,
    wbemErrUnexpected                   = 0x8004101d,
    wbemErrIllegalOperation             = 0x8004101e,
    wbemErrCannotBeKey                  = 0x8004101f,
    wbemErrIncompleteClass              = 0x80041020,
    wbemErrInvalidSyntax                = 0x80041021,
    wbemErrNondecoratedObject           = 0x80041022,
    wbemErrReadOnly                     = 0x80041023,
    wbemErrProviderNotCapable           = 0x80041024,
    wbemErrClassHasChildren             = 0x80041025,
    wbemErrClassHasInstances            = 0x80041026,
    wbemErrQueryNotImplemented          = 0x80041027,
    wbemErrIllegalNull                  = 0x80041028,
    wbemErrInvalidQualifierType         = 0x80041029,
    wbemErrInvalidPropertyType          = 0x8004102a,
    wbemErrValueOutOfRange              = 0x8004102b,
    wbemErrCannotBeSingleton            = 0x8004102c,
    wbemErrInvalidCimType               = 0x8004102d,
    wbemErrInvalidMethod                = 0x8004102e,
    wbemErrInvalidMethodParameters      = 0x8004102f,
    wbemErrSystemProperty               = 0x80041030,
    wbemErrInvalidProperty              = 0x80041031,
    wbemErrCallCancelled                = 0x80041032,
    wbemErrShuttingDown                 = 0x80041033,
    wbemErrPropagatedMethod             = 0x80041034,
    wbemErrUnsupportedParameter         = 0x80041035,
    wbemErrMissingParameter             = 0x80041036,
    wbemErrInvalidParameterId           = 0x80041037,
    wbemErrNonConsecutiveParameterIds   = 0x80041038,
    wbemErrParameterIdOnRetval          = 0x80041039,
    wbemErrInvalidObjectPath            = 0x8004103a,
    wbemErrOutOfDiskSpace               = 0x8004103b,
    wbemErrBufferTooSmall               = 0x8004103c,
    wbemErrUnsupportedPutExtension      = 0x8004103d,
    wbemErrUnknownObjectType            = 0x8004103e,
    wbemErrUnknownPacketType            = 0x8004103f,
    wbemErrMarshalVersionMismatch       = 0x80041040,
    wbemErrMarshalInvalidSignature      = 0x80041041,
    wbemErrInvalidQualifier             = 0x80041042,
    wbemErrInvalidDuplicateParameter    = 0x80041043,
    wbemErrTooMuchData                  = 0x80041044,
    wbemErrServerTooBusy                = 0x80041045,
    wbemErrInvalidFlavor                = 0x80041046,
    wbemErrCircularReference            = 0x80041047,
    wbemErrUnsupportedClassUpdate       = 0x80041048,
    wbemErrCannotChangeKeyInheritance   = 0x80041049,
    wbemErrCannotChangeIndexInheritance = 0x80041050,
    wbemErrTooManyProperties            = 0x80041051,
    wbemErrUpdateTypeMismatch           = 0x80041052,
    wbemErrUpdateOverrideNotAllowed     = 0x80041053,
    wbemErrUpdatePropagatedMethod       = 0x80041054,
    wbemErrMethodNotImplemented         = 0x80041055,
    wbemErrMethodDisabled               = 0x80041056,
    wbemErrRefresherBusy                = 0x80041057,
    wbemErrUnparsableQuery              = 0x80041058,
    wbemErrNotEventClass                = 0x80041059,
    wbemErrMissingGroupWithin           = 0x8004105a,
    wbemErrMissingAggregationList       = 0x8004105b,
    wbemErrPropertyNotAnObject          = 0x8004105c,
    wbemErrAggregatingByObject          = 0x8004105d,
    wbemErrUninterpretableProviderQuery = 0x8004105f,
    wbemErrBackupRestoreWinmgmtRunning  = 0x80041060,
    wbemErrQueueOverflow                = 0x80041061,
    wbemErrPrivilegeNotHeld             = 0x80041062,
    wbemErrInvalidOperator              = 0x80041063,
    wbemErrLocalCredentials             = 0x80041064,
    wbemErrCannotBeAbstract             = 0x80041065,
    wbemErrAmendedObject                = 0x80041066,
    wbemErrClientTooSlow                = 0x80041067,
    wbemErrNullSecurityDescriptor       = 0x80041068,
    wbemErrTimeout                      = 0x80041069,
    wbemErrInvalidAssociation           = 0x8004106a,
    wbemErrAmbiguousOperation           = 0x8004106b,
    wbemErrQuotaViolation               = 0x8004106c,
    wbemErrTransactionConflict          = 0x8004106d,
    wbemErrForcedRollback               = 0x8004106e,
    wbemErrUnsupportedLocale            = 0x8004106f,
    wbemErrHandleOutOfDate              = 0x80041070,
    wbemErrConnectionFailed             = 0x80041071,
    wbemErrInvalidHandleRequest         = 0x80041072,
    wbemErrPropertyNameTooWide          = 0x80041073,
    wbemErrClassNameTooWide             = 0x80041074,
    wbemErrMethodNameTooWide            = 0x80041075,
    wbemErrQualifierNameTooWide         = 0x80041076,
    wbemErrRerunCommand                 = 0x80041077,
    wbemErrDatabaseVerMismatch          = 0x80041078,
    wbemErrVetoPut                      = 0x80041079,
    wbemErrVetoDelete                   = 0x8004107a,
    wbemErrInvalidLocale                = 0x80041080,
    wbemErrProviderSuspended            = 0x80041081,
    wbemErrSynchronizationRequired      = 0x80041082,
    wbemErrNoSchema                     = 0x80041083,
    wbemErrProviderAlreadyRegistered    = 0x80041084,
    wbemErrProviderNotRegistered        = 0x80041085,
    wbemErrFatalTransportError          = 0x80041086,
    wbemErrEncryptedConnectionRequired  = 0x80041087,
    wbemErrRegistrationTooBroad         = 0x80042001,
    wbemErrRegistrationTooPrecise       = 0x80042002,
    wbemErrTimedout                     = 0x80043001,
    wbemErrResetToDefault               = 0x80043002,
}

alias WbemAuthenticationLevelEnum = int;
enum : int
{
    wbemAuthenticationLevelDefault      = 0x00000000,
    wbemAuthenticationLevelNone         = 0x00000001,
    wbemAuthenticationLevelConnect      = 0x00000002,
    wbemAuthenticationLevelCall         = 0x00000003,
    wbemAuthenticationLevelPkt          = 0x00000004,
    wbemAuthenticationLevelPktIntegrity = 0x00000005,
    wbemAuthenticationLevelPktPrivacy   = 0x00000006,
}

alias WbemImpersonationLevelEnum = int;
enum : int
{
    wbemImpersonationLevelAnonymous   = 0x00000001,
    wbemImpersonationLevelIdentify    = 0x00000002,
    wbemImpersonationLevelImpersonate = 0x00000003,
    wbemImpersonationLevelDelegate    = 0x00000004,
}

alias WbemPrivilegeEnum = int;
enum : int
{
    wbemPrivilegeCreateToken          = 0x00000001,
    wbemPrivilegePrimaryToken         = 0x00000002,
    wbemPrivilegeLockMemory           = 0x00000003,
    wbemPrivilegeIncreaseQuota        = 0x00000004,
    wbemPrivilegeMachineAccount       = 0x00000005,
    wbemPrivilegeTcb                  = 0x00000006,
    wbemPrivilegeSecurity             = 0x00000007,
    wbemPrivilegeTakeOwnership        = 0x00000008,
    wbemPrivilegeLoadDriver           = 0x00000009,
    wbemPrivilegeSystemProfile        = 0x0000000a,
    wbemPrivilegeSystemtime           = 0x0000000b,
    wbemPrivilegeProfileSingleProcess = 0x0000000c,
    wbemPrivilegeIncreaseBasePriority = 0x0000000d,
    wbemPrivilegeCreatePagefile       = 0x0000000e,
    wbemPrivilegeCreatePermanent      = 0x0000000f,
    wbemPrivilegeBackup               = 0x00000010,
    wbemPrivilegeRestore              = 0x00000011,
    wbemPrivilegeShutdown             = 0x00000012,
    wbemPrivilegeDebug                = 0x00000013,
    wbemPrivilegeAudit                = 0x00000014,
    wbemPrivilegeSystemEnvironment    = 0x00000015,
    wbemPrivilegeChangeNotify         = 0x00000016,
    wbemPrivilegeRemoteShutdown       = 0x00000017,
    wbemPrivilegeUndock               = 0x00000018,
    wbemPrivilegeSyncAgent            = 0x00000019,
    wbemPrivilegeEnableDelegation     = 0x0000001a,
    wbemPrivilegeManageVolume         = 0x0000001b,
}

alias WbemObjectTextFormatEnum = int;
enum : int
{
    wbemObjectTextFormatCIMDTD20 = 0x00000001,
    wbemObjectTextFormatWMIDTD20 = 0x00000002,
}

alias WbemConnectOptionsEnum = int;
enum : int
{
    wbemConnectFlagUseMaxWait = 0x00000080,
}

enum IID_ISWbemServices = GUID(0x76a6415c, 0xcb41, 0x11d1, [0x8b, 0x2, 0x0, 0x60, 0x8, 0x6, 0xd9, 0xb6]);
interface ISWbemServices : IDispatch
{
    HRESULT Get(BSTR, int, IDispatch, ISWbemObject*);
    HRESULT GetAsync(IDispatch, BSTR, int, IDispatch, IDispatch);
    HRESULT Delete(BSTR, int, IDispatch);
    HRESULT DeleteAsync(IDispatch, BSTR, int, IDispatch, IDispatch);
    HRESULT InstancesOf(BSTR, int, IDispatch, ISWbemObjectSet*);
    HRESULT InstancesOfAsync(IDispatch, BSTR, int, IDispatch, IDispatch);
    HRESULT SubclassesOf(BSTR, int, IDispatch, ISWbemObjectSet*);
    HRESULT SubclassesOfAsync(IDispatch, BSTR, int, IDispatch, IDispatch);
    HRESULT ExecQuery(BSTR, BSTR, int, IDispatch, ISWbemObjectSet*);
    HRESULT ExecQueryAsync(IDispatch, BSTR, BSTR, int, IDispatch, IDispatch);
    HRESULT AssociatorsOf(BSTR, BSTR, BSTR, BSTR, BSTR, VARIANT_BOOL, VARIANT_BOOL, BSTR, BSTR, int, IDispatch, ISWbemObjectSet*);
    HRESULT AssociatorsOfAsync(IDispatch, BSTR, BSTR, BSTR, BSTR, BSTR, VARIANT_BOOL, VARIANT_BOOL, BSTR, BSTR, int, IDispatch, IDispatch);
    HRESULT ReferencesTo(BSTR, BSTR, BSTR, VARIANT_BOOL, VARIANT_BOOL, BSTR, int, IDispatch, ISWbemObjectSet*);
    HRESULT ReferencesToAsync(IDispatch, BSTR, BSTR, BSTR, VARIANT_BOOL, VARIANT_BOOL, BSTR, int, IDispatch, IDispatch);
    HRESULT ExecNotificationQuery(BSTR, BSTR, int, IDispatch, ISWbemEventSource*);
    HRESULT ExecNotificationQueryAsync(IDispatch, BSTR, BSTR, int, IDispatch, IDispatch);
    HRESULT ExecMethod(BSTR, BSTR, IDispatch, int, IDispatch, ISWbemObject*);
    HRESULT ExecMethodAsync(IDispatch, BSTR, BSTR, IDispatch, int, IDispatch, IDispatch);
    HRESULT get_Security_(ISWbemSecurity*);
}
enum IID_ISWbemLocator = GUID(0x76a6415b, 0xcb41, 0x11d1, [0x8b, 0x2, 0x0, 0x60, 0x8, 0x6, 0xd9, 0xb6]);
interface ISWbemLocator : IDispatch
{
    HRESULT ConnectServer(BSTR, BSTR, BSTR, BSTR, BSTR, BSTR, int, IDispatch, ISWbemServices*);
    HRESULT get_Security_(ISWbemSecurity*);
}
enum IID_ISWbemObject = GUID(0x76a6415a, 0xcb41, 0x11d1, [0x8b, 0x2, 0x0, 0x60, 0x8, 0x6, 0xd9, 0xb6]);
interface ISWbemObject : IDispatch
{
    HRESULT Put_(int, IDispatch, ISWbemObjectPath*);
    HRESULT PutAsync_(IDispatch, int, IDispatch, IDispatch);
    HRESULT Delete_(int, IDispatch);
    HRESULT DeleteAsync_(IDispatch, int, IDispatch, IDispatch);
    HRESULT Instances_(int, IDispatch, ISWbemObjectSet*);
    HRESULT InstancesAsync_(IDispatch, int, IDispatch, IDispatch);
    HRESULT Subclasses_(int, IDispatch, ISWbemObjectSet*);
    HRESULT SubclassesAsync_(IDispatch, int, IDispatch, IDispatch);
    HRESULT Associators_(BSTR, BSTR, BSTR, BSTR, VARIANT_BOOL, VARIANT_BOOL, BSTR, BSTR, int, IDispatch, ISWbemObjectSet*);
    HRESULT AssociatorsAsync_(IDispatch, BSTR, BSTR, BSTR, BSTR, VARIANT_BOOL, VARIANT_BOOL, BSTR, BSTR, int, IDispatch, IDispatch);
    HRESULT References_(BSTR, BSTR, VARIANT_BOOL, VARIANT_BOOL, BSTR, int, IDispatch, ISWbemObjectSet*);
    HRESULT ReferencesAsync_(IDispatch, BSTR, BSTR, VARIANT_BOOL, VARIANT_BOOL, BSTR, int, IDispatch, IDispatch);
    HRESULT ExecMethod_(BSTR, IDispatch, int, IDispatch, ISWbemObject*);
    HRESULT ExecMethodAsync_(IDispatch, BSTR, IDispatch, int, IDispatch, IDispatch);
    HRESULT Clone_(ISWbemObject*);
    HRESULT GetObjectText_(int, BSTR*);
    HRESULT SpawnDerivedClass_(int, ISWbemObject*);
    HRESULT SpawnInstance_(int, ISWbemObject*);
    HRESULT CompareTo_(IDispatch, int, VARIANT_BOOL*);
    HRESULT get_Qualifiers_(ISWbemQualifierSet*);
    HRESULT get_Properties_(ISWbemPropertySet*);
    HRESULT get_Methods_(ISWbemMethodSet*);
    HRESULT get_Derivation_(VARIANT*);
    HRESULT get_Path_(ISWbemObjectPath*);
    HRESULT get_Security_(ISWbemSecurity*);
}
enum IID_ISWbemObjectSet = GUID(0x76a6415f, 0xcb41, 0x11d1, [0x8b, 0x2, 0x0, 0x60, 0x8, 0x6, 0xd9, 0xb6]);
interface ISWbemObjectSet : IDispatch
{
    HRESULT get__NewEnum(IUnknown*);
    HRESULT Item(BSTR, int, ISWbemObject*);
    HRESULT get_Count(int*);
    HRESULT get_Security_(ISWbemSecurity*);
    HRESULT ItemIndex(int, ISWbemObject*);
}
enum IID_ISWbemNamedValue = GUID(0x76a64164, 0xcb41, 0x11d1, [0x8b, 0x2, 0x0, 0x60, 0x8, 0x6, 0xd9, 0xb6]);
interface ISWbemNamedValue : IDispatch
{
    HRESULT get_Value(VARIANT*);
    HRESULT put_Value(VARIANT*);
    HRESULT get_Name(BSTR*);
}
enum IID_ISWbemNamedValueSet = GUID(0xcf2376ea, 0xce8c, 0x11d1, [0x8b, 0x5, 0x0, 0x60, 0x8, 0x6, 0xd9, 0xb6]);
interface ISWbemNamedValueSet : IDispatch
{
    HRESULT get__NewEnum(IUnknown*);
    HRESULT Item(BSTR, int, ISWbemNamedValue*);
    HRESULT get_Count(int*);
    HRESULT Add(BSTR, VARIANT*, int, ISWbemNamedValue*);
    HRESULT Remove(BSTR, int);
    HRESULT Clone(ISWbemNamedValueSet*);
    HRESULT DeleteAll();
}
enum IID_ISWbemQualifier = GUID(0x79b05932, 0xd3b7, 0x11d1, [0x8b, 0x6, 0x0, 0x60, 0x8, 0x6, 0xd9, 0xb6]);
interface ISWbemQualifier : IDispatch
{
    HRESULT get_Value(VARIANT*);
    HRESULT put_Value(VARIANT*);
    HRESULT get_Name(BSTR*);
    HRESULT get_IsLocal(VARIANT_BOOL*);
    HRESULT get_PropagatesToSubclass(VARIANT_BOOL*);
    HRESULT put_PropagatesToSubclass(VARIANT_BOOL);
    HRESULT get_PropagatesToInstance(VARIANT_BOOL*);
    HRESULT put_PropagatesToInstance(VARIANT_BOOL);
    HRESULT get_IsOverridable(VARIANT_BOOL*);
    HRESULT put_IsOverridable(VARIANT_BOOL);
    HRESULT get_IsAmended(VARIANT_BOOL*);
}
enum IID_ISWbemQualifierSet = GUID(0x9b16ed16, 0xd3df, 0x11d1, [0x8b, 0x8, 0x0, 0x60, 0x8, 0x6, 0xd9, 0xb6]);
interface ISWbemQualifierSet : IDispatch
{
    HRESULT get__NewEnum(IUnknown*);
    HRESULT Item(BSTR, int, ISWbemQualifier*);
    HRESULT get_Count(int*);
    HRESULT Add(BSTR, VARIANT*, VARIANT_BOOL, VARIANT_BOOL, VARIANT_BOOL, int, ISWbemQualifier*);
    HRESULT Remove(BSTR, int);
}
enum IID_ISWbemProperty = GUID(0x1a388f98, 0xd4ba, 0x11d1, [0x8b, 0x9, 0x0, 0x60, 0x8, 0x6, 0xd9, 0xb6]);
interface ISWbemProperty : IDispatch
{
    HRESULT get_Value(VARIANT*);
    HRESULT put_Value(VARIANT*);
    HRESULT get_Name(BSTR*);
    HRESULT get_IsLocal(VARIANT_BOOL*);
    HRESULT get_Origin(BSTR*);
    HRESULT get_CIMType(WbemCimtypeEnum*);
    HRESULT get_Qualifiers_(ISWbemQualifierSet*);
    HRESULT get_IsArray(VARIANT_BOOL*);
}
enum IID_ISWbemPropertySet = GUID(0xdea0a7b2, 0xd4ba, 0x11d1, [0x8b, 0x9, 0x0, 0x60, 0x8, 0x6, 0xd9, 0xb6]);
interface ISWbemPropertySet : IDispatch
{
    HRESULT get__NewEnum(IUnknown*);
    HRESULT Item(BSTR, int, ISWbemProperty*);
    HRESULT get_Count(int*);
    HRESULT Add(BSTR, WbemCimtypeEnum, VARIANT_BOOL, int, ISWbemProperty*);
    HRESULT Remove(BSTR, int);
}
enum IID_ISWbemMethod = GUID(0x422e8e90, 0xd955, 0x11d1, [0x8b, 0x9, 0x0, 0x60, 0x8, 0x6, 0xd9, 0xb6]);
interface ISWbemMethod : IDispatch
{
    HRESULT get_Name(BSTR*);
    HRESULT get_Origin(BSTR*);
    HRESULT get_InParameters(ISWbemObject*);
    HRESULT get_OutParameters(ISWbemObject*);
    HRESULT get_Qualifiers_(ISWbemQualifierSet*);
}
enum IID_ISWbemMethodSet = GUID(0xc93ba292, 0xd955, 0x11d1, [0x8b, 0x9, 0x0, 0x60, 0x8, 0x6, 0xd9, 0xb6]);
interface ISWbemMethodSet : IDispatch
{
    HRESULT get__NewEnum(IUnknown*);
    HRESULT Item(BSTR, int, ISWbemMethod*);
    HRESULT get_Count(int*);
}
enum IID_ISWbemEventSource = GUID(0x27d54d92, 0xebe, 0x11d2, [0x8b, 0x22, 0x0, 0x60, 0x8, 0x6, 0xd9, 0xb6]);
interface ISWbemEventSource : IDispatch
{
    HRESULT NextEvent(int, ISWbemObject*);
    HRESULT get_Security_(ISWbemSecurity*);
}
enum IID_ISWbemObjectPath = GUID(0x5791bc27, 0xce9c, 0x11d1, [0x97, 0xbf, 0x0, 0x0, 0xf8, 0x1e, 0x84, 0x9c]);
interface ISWbemObjectPath : IDispatch
{
    HRESULT get_Path(BSTR*);
    HRESULT put_Path(BSTR);
    HRESULT get_RelPath(BSTR*);
    HRESULT put_RelPath(BSTR);
    HRESULT get_Server(BSTR*);
    HRESULT put_Server(BSTR);
    HRESULT get_Namespace(BSTR*);
    HRESULT put_Namespace(BSTR);
    HRESULT get_ParentNamespace(BSTR*);
    HRESULT get_DisplayName(BSTR*);
    HRESULT put_DisplayName(BSTR);
    HRESULT get_Class(BSTR*);
    HRESULT put_Class(BSTR);
    HRESULT get_IsClass(VARIANT_BOOL*);
    HRESULT SetAsClass();
    HRESULT get_IsSingleton(VARIANT_BOOL*);
    HRESULT SetAsSingleton();
    HRESULT get_Keys(ISWbemNamedValueSet*);
    HRESULT get_Security_(ISWbemSecurity*);
    HRESULT get_Locale(BSTR*);
    HRESULT put_Locale(BSTR);
    HRESULT get_Authority(BSTR*);
    HRESULT put_Authority(BSTR);
}
enum IID_ISWbemLastError = GUID(0xd962db84, 0xd4bb, 0x11d1, [0x8b, 0x9, 0x0, 0x60, 0x8, 0x6, 0xd9, 0xb6]);
interface ISWbemLastError : ISWbemObject
{
}
enum IID_ISWbemSinkEvents = GUID(0x75718ca0, 0xf029, 0x11d1, [0xa1, 0xac, 0x0, 0xc0, 0x4f, 0xb6, 0xc2, 0x23]);
interface ISWbemSinkEvents : IDispatch
{
}
enum IID_ISWbemSink = GUID(0x75718c9f, 0xf029, 0x11d1, [0xa1, 0xac, 0x0, 0xc0, 0x4f, 0xb6, 0xc2, 0x23]);
interface ISWbemSink : IDispatch
{
    HRESULT Cancel();
}
enum IID_ISWbemSecurity = GUID(0xb54d66e6, 0x2287, 0x11d2, [0x8b, 0x33, 0x0, 0x60, 0x8, 0x6, 0xd9, 0xb6]);
interface ISWbemSecurity : IDispatch
{
    HRESULT get_ImpersonationLevel(WbemImpersonationLevelEnum*);
    HRESULT put_ImpersonationLevel(WbemImpersonationLevelEnum);
    HRESULT get_AuthenticationLevel(WbemAuthenticationLevelEnum*);
    HRESULT put_AuthenticationLevel(WbemAuthenticationLevelEnum);
    HRESULT get_Privileges(ISWbemPrivilegeSet*);
}
enum IID_ISWbemPrivilege = GUID(0x26ee67bd, 0x5804, 0x11d2, [0x8b, 0x4a, 0x0, 0x60, 0x8, 0x6, 0xd9, 0xb6]);
interface ISWbemPrivilege : IDispatch
{
    HRESULT get_IsEnabled(VARIANT_BOOL*);
    HRESULT put_IsEnabled(VARIANT_BOOL);
    HRESULT get_Name(BSTR*);
    HRESULT get_DisplayName(BSTR*);
    HRESULT get_Identifier(WbemPrivilegeEnum*);
}
enum IID_ISWbemPrivilegeSet = GUID(0x26ee67bf, 0x5804, 0x11d2, [0x8b, 0x4a, 0x0, 0x60, 0x8, 0x6, 0xd9, 0xb6]);
interface ISWbemPrivilegeSet : IDispatch
{
    HRESULT get__NewEnum(IUnknown*);
    HRESULT Item(WbemPrivilegeEnum, ISWbemPrivilege*);
    HRESULT get_Count(int*);
    HRESULT Add(WbemPrivilegeEnum, VARIANT_BOOL, ISWbemPrivilege*);
    HRESULT Remove(WbemPrivilegeEnum);
    HRESULT DeleteAll();
    HRESULT AddAsString(BSTR, VARIANT_BOOL, ISWbemPrivilege*);
}
enum IID_ISWbemServicesEx = GUID(0xd2f68443, 0x85dc, 0x427e, [0x91, 0xd8, 0x36, 0x65, 0x54, 0xcc, 0x75, 0x4c]);
interface ISWbemServicesEx : ISWbemServices
{
    HRESULT Put(ISWbemObjectEx, int, IDispatch, ISWbemObjectPath*);
    HRESULT PutAsync(ISWbemSink, ISWbemObjectEx, int, IDispatch, IDispatch);
}
enum IID_ISWbemObjectEx = GUID(0x269ad56a, 0x8a67, 0x4129, [0xbc, 0x8c, 0x5, 0x6, 0xdc, 0xfe, 0x98, 0x80]);
interface ISWbemObjectEx : ISWbemObject
{
    HRESULT Refresh_(int, IDispatch);
    HRESULT get_SystemProperties_(ISWbemPropertySet*);
    HRESULT GetText_(WbemObjectTextFormatEnum, int, IDispatch, BSTR*);
    HRESULT SetFromText_(BSTR, WbemObjectTextFormatEnum, int, IDispatch);
}
enum IID_ISWbemDateTime = GUID(0x5e97458a, 0xcf77, 0x11d3, [0xb3, 0x8f, 0x0, 0x10, 0x5a, 0x1f, 0x47, 0x3a]);
interface ISWbemDateTime : IDispatch
{
    HRESULT get_Value(BSTR*);
    HRESULT put_Value(BSTR);
    HRESULT get_Year(int*);
    HRESULT put_Year(int);
    HRESULT get_YearSpecified(VARIANT_BOOL*);
    HRESULT put_YearSpecified(VARIANT_BOOL);
    HRESULT get_Month(int*);
    HRESULT put_Month(int);
    HRESULT get_MonthSpecified(VARIANT_BOOL*);
    HRESULT put_MonthSpecified(VARIANT_BOOL);
    HRESULT get_Day(int*);
    HRESULT put_Day(int);
    HRESULT get_DaySpecified(VARIANT_BOOL*);
    HRESULT put_DaySpecified(VARIANT_BOOL);
    HRESULT get_Hours(int*);
    HRESULT put_Hours(int);
    HRESULT get_HoursSpecified(VARIANT_BOOL*);
    HRESULT put_HoursSpecified(VARIANT_BOOL);
    HRESULT get_Minutes(int*);
    HRESULT put_Minutes(int);
    HRESULT get_MinutesSpecified(VARIANT_BOOL*);
    HRESULT put_MinutesSpecified(VARIANT_BOOL);
    HRESULT get_Seconds(int*);
    HRESULT put_Seconds(int);
    HRESULT get_SecondsSpecified(VARIANT_BOOL*);
    HRESULT put_SecondsSpecified(VARIANT_BOOL);
    HRESULT get_Microseconds(int*);
    HRESULT put_Microseconds(int);
    HRESULT get_MicrosecondsSpecified(VARIANT_BOOL*);
    HRESULT put_MicrosecondsSpecified(VARIANT_BOOL);
    HRESULT get_UTC(int*);
    HRESULT put_UTC(int);
    HRESULT get_UTCSpecified(VARIANT_BOOL*);
    HRESULT put_UTCSpecified(VARIANT_BOOL);
    HRESULT get_IsInterval(VARIANT_BOOL*);
    HRESULT put_IsInterval(VARIANT_BOOL);
    HRESULT GetVarDate(VARIANT_BOOL, double*);
    HRESULT SetVarDate(double, VARIANT_BOOL);
    HRESULT GetFileTime(VARIANT_BOOL, BSTR*);
    HRESULT SetFileTime(BSTR, VARIANT_BOOL);
}
enum IID_ISWbemRefresher = GUID(0x14d8250e, 0xd9c2, 0x11d3, [0xb3, 0x8f, 0x0, 0x10, 0x5a, 0x1f, 0x47, 0x3a]);
interface ISWbemRefresher : IDispatch
{
    HRESULT get__NewEnum(IUnknown*);
    HRESULT Item(int, ISWbemRefreshableItem*);
    HRESULT get_Count(int*);
    HRESULT Add(ISWbemServicesEx, BSTR, int, IDispatch, ISWbemRefreshableItem*);
    HRESULT AddEnum(ISWbemServicesEx, BSTR, int, IDispatch, ISWbemRefreshableItem*);
    HRESULT Remove(int, int);
    HRESULT Refresh(int);
    HRESULT get_AutoReconnect(VARIANT_BOOL*);
    HRESULT put_AutoReconnect(VARIANT_BOOL);
    HRESULT DeleteAll();
}
enum IID_ISWbemRefreshableItem = GUID(0x5ad4bf92, 0xdaab, 0x11d3, [0xb3, 0x8f, 0x0, 0x10, 0x5a, 0x1f, 0x47, 0x3a]);
interface ISWbemRefreshableItem : IDispatch
{
    HRESULT get_Index(int*);
    HRESULT get_Refresher(ISWbemRefresher*);
    HRESULT get_IsSet(VARIANT_BOOL*);
    HRESULT get_Object(ISWbemObjectEx*);
    HRESULT get_ObjectSet(ISWbemObjectSet*);
    HRESULT Remove(int);
}
enum CLSID_SWbemLocator = GUID(0x76a64158, 0xcb41, 0x11d1, [0x8b, 0x2, 0x0, 0x60, 0x8, 0x6, 0xd9, 0xb6]);
struct SWbemLocator
{
}
enum CLSID_SWbemNamedValueSet = GUID(0x9aed384e, 0xce8b, 0x11d1, [0x8b, 0x5, 0x0, 0x60, 0x8, 0x6, 0xd9, 0xb6]);
struct SWbemNamedValueSet
{
}
enum CLSID_SWbemObjectPath = GUID(0x5791bc26, 0xce9c, 0x11d1, [0x97, 0xbf, 0x0, 0x0, 0xf8, 0x1e, 0x84, 0x9c]);
struct SWbemObjectPath
{
}
enum CLSID_SWbemLastError = GUID(0xc2feeeac, 0xcfcd, 0x11d1, [0x8b, 0x5, 0x0, 0x60, 0x8, 0x6, 0xd9, 0xb6]);
struct SWbemLastError
{
}
enum CLSID_SWbemSink = GUID(0x75718c9a, 0xf029, 0x11d1, [0xa1, 0xac, 0x0, 0xc0, 0x4f, 0xb6, 0xc2, 0x23]);
struct SWbemSink
{
}
enum CLSID_SWbemDateTime = GUID(0x47dfbe54, 0xcf76, 0x11d3, [0xb3, 0x8f, 0x0, 0x10, 0x5a, 0x1f, 0x47, 0x3a]);
struct SWbemDateTime
{
}
enum CLSID_SWbemRefresher = GUID(0xd269bf5c, 0xd9c1, 0x11d3, [0xb3, 0x8f, 0x0, 0x10, 0x5a, 0x1f, 0x47, 0x3a]);
struct SWbemRefresher
{
}
enum CLSID_SWbemServices = GUID(0x4b83d63, 0x21ae, 0x11d2, [0x8b, 0x33, 0x0, 0x60, 0x8, 0x6, 0xd9, 0xb6]);
struct SWbemServices
{
}
enum CLSID_SWbemServicesEx = GUID(0x62e522dc, 0x8cf3, 0x40a8, [0x8b, 0x2e, 0x37, 0xd5, 0x95, 0x65, 0x1e, 0x40]);
struct SWbemServicesEx
{
}
enum CLSID_SWbemObject = GUID(0x4b83d62, 0x21ae, 0x11d2, [0x8b, 0x33, 0x0, 0x60, 0x8, 0x6, 0xd9, 0xb6]);
struct SWbemObject
{
}
enum CLSID_SWbemObjectEx = GUID(0xd6bdafb2, 0x9435, 0x491f, [0xbb, 0x87, 0x6a, 0xa0, 0xf0, 0xbc, 0x31, 0xa2]);
struct SWbemObjectEx
{
}
enum CLSID_SWbemObjectSet = GUID(0x4b83d61, 0x21ae, 0x11d2, [0x8b, 0x33, 0x0, 0x60, 0x8, 0x6, 0xd9, 0xb6]);
struct SWbemObjectSet
{
}
enum CLSID_SWbemNamedValue = GUID(0x4b83d60, 0x21ae, 0x11d2, [0x8b, 0x33, 0x0, 0x60, 0x8, 0x6, 0xd9, 0xb6]);
struct SWbemNamedValue
{
}
enum CLSID_SWbemQualifier = GUID(0x4b83d5f, 0x21ae, 0x11d2, [0x8b, 0x33, 0x0, 0x60, 0x8, 0x6, 0xd9, 0xb6]);
struct SWbemQualifier
{
}
enum CLSID_SWbemQualifierSet = GUID(0x4b83d5e, 0x21ae, 0x11d2, [0x8b, 0x33, 0x0, 0x60, 0x8, 0x6, 0xd9, 0xb6]);
struct SWbemQualifierSet
{
}
enum CLSID_SWbemProperty = GUID(0x4b83d5d, 0x21ae, 0x11d2, [0x8b, 0x33, 0x0, 0x60, 0x8, 0x6, 0xd9, 0xb6]);
struct SWbemProperty
{
}
enum CLSID_SWbemPropertySet = GUID(0x4b83d5c, 0x21ae, 0x11d2, [0x8b, 0x33, 0x0, 0x60, 0x8, 0x6, 0xd9, 0xb6]);
struct SWbemPropertySet
{
}
enum CLSID_SWbemMethod = GUID(0x4b83d5b, 0x21ae, 0x11d2, [0x8b, 0x33, 0x0, 0x60, 0x8, 0x6, 0xd9, 0xb6]);
struct SWbemMethod
{
}
enum CLSID_SWbemMethodSet = GUID(0x4b83d5a, 0x21ae, 0x11d2, [0x8b, 0x33, 0x0, 0x60, 0x8, 0x6, 0xd9, 0xb6]);
struct SWbemMethodSet
{
}
enum CLSID_SWbemEventSource = GUID(0x4b83d58, 0x21ae, 0x11d2, [0x8b, 0x33, 0x0, 0x60, 0x8, 0x6, 0xd9, 0xb6]);
struct SWbemEventSource
{
}
enum CLSID_SWbemSecurity = GUID(0xb54d66e9, 0x2287, 0x11d2, [0x8b, 0x33, 0x0, 0x60, 0x8, 0x6, 0xd9, 0xb6]);
struct SWbemSecurity
{
}
enum CLSID_SWbemPrivilege = GUID(0x26ee67bc, 0x5804, 0x11d2, [0x8b, 0x4a, 0x0, 0x60, 0x8, 0x6, 0xd9, 0xb6]);
struct SWbemPrivilege
{
}
enum CLSID_SWbemPrivilegeSet = GUID(0x26ee67be, 0x5804, 0x11d2, [0x8b, 0x4a, 0x0, 0x60, 0x8, 0x6, 0xd9, 0xb6]);
struct SWbemPrivilegeSet
{
}
enum CLSID_SWbemRefreshableItem = GUID(0x8c6854bc, 0xde4b, 0x11d3, [0xb3, 0x90, 0x0, 0x10, 0x5a, 0x1f, 0x47, 0x3a]);
struct SWbemRefreshableItem
{
}
enum IID_IWMIExtension = GUID(0xadc1f06e, 0x5c7e, 0x11d2, [0x8b, 0x74, 0x0, 0x10, 0x4b, 0x2a, 0xfb, 0x41]);
interface IWMIExtension : IDispatch
{
    HRESULT get_WMIObjectPath(BSTR*);
    HRESULT GetWMIObject(ISWbemObject*);
    HRESULT GetWMIServices(ISWbemServices*);
}
enum CLSID_WMIExtension = GUID(0xf0975afe, 0x5c7f, 0x11d2, [0x8b, 0x74, 0x0, 0x10, 0x4b, 0x2a, 0xfb, 0x41]);
struct WMIExtension
{
}
alias WBEM_LOGIN_TYPE = int;
enum : int
{
    WBEM_FLAG_INPROC_LOGIN            = 0x00000000,
    WBEM_FLAG_LOCAL_LOGIN             = 0x00000001,
    WBEM_FLAG_REMOTE_LOGIN            = 0x00000002,
    WBEM_AUTHENTICATION_METHOD_MASK   = 0x0000000f,
    WBEM_FLAG_USE_MULTIPLE_CHALLENGES = 0x00000010,
}

enum IID_IWbemTransport = GUID(0x553fe584, 0x2156, 0x11d0, [0xb6, 0xae, 0x0, 0xaa, 0x0, 0x32, 0x40, 0xc7]);
interface IWbemTransport : IUnknown
{
    HRESULT Initialize();
}
enum IID_IWbemLevel1Login = GUID(0xf309ad18, 0xd86a, 0x11d0, [0xa0, 0x75, 0x0, 0xc0, 0x4f, 0xb6, 0x88, 0x20]);
interface IWbemLevel1Login : IUnknown
{
    HRESULT EstablishPosition(PWSTR, uint, uint*);
    HRESULT RequestChallenge(PWSTR, PWSTR, ubyte*);
    HRESULT WBEMLogin(PWSTR, ubyte*, int, IWbemContext, IWbemServices*);
    HRESULT NTLMLogin(PWSTR, PWSTR, int, IWbemContext, IWbemServices*);
}
enum IID_IWbemConnectorLogin = GUID(0xd8ec9cb1, 0xb135, 0x4f10, [0x8b, 0x1b, 0xc7, 0x18, 0x8b, 0xb0, 0xd1, 0x86]);
interface IWbemConnectorLogin : IUnknown
{
    HRESULT ConnectorLogin(PWSTR, PWSTR, int, IWbemContext, const(GUID)*, void**);
}
enum IID_IWbemAddressResolution = GUID(0xf7ce2e12, 0x8c90, 0x11d1, [0x9e, 0x7b, 0x0, 0xc0, 0x4f, 0xc3, 0x24, 0xa8]);
interface IWbemAddressResolution : IUnknown
{
    HRESULT Resolve(PWSTR, PWSTR, uint*, ubyte**);
}
enum CLSID_WbemLevel1Login = GUID(0x8bc3f05e, 0xd86b, 0x11d0, [0xa0, 0x75, 0x0, 0xc0, 0x4f, 0xb6, 0x88, 0x20]);
struct WbemLevel1Login
{
}
enum CLSID_WbemLocalAddrRes = GUID(0xa1044801, 0x8f7e, 0x11d1, [0x9e, 0x7c, 0x0, 0xc0, 0x4f, 0xc3, 0x24, 0xa8]);
struct WbemLocalAddrRes
{
}
enum CLSID_WbemUninitializedClassObject = GUID(0x7a0227f6, 0x7108, 0x11d1, [0xad, 0x90, 0x0, 0xc0, 0x4f, 0xd8, 0xfd, 0xff]);
struct WbemUninitializedClassObject
{
}
enum IID_IWbemClientTransport = GUID(0xf7ce2e11, 0x8c90, 0x11d1, [0x9e, 0x7b, 0x0, 0xc0, 0x4f, 0xc3, 0x24, 0xa8]);
interface IWbemClientTransport : IUnknown
{
    HRESULT ConnectServer(BSTR, uint, ubyte*, BSTR, BSTR, BSTR, BSTR, int, BSTR, IWbemContext, IWbemServices*);
}
enum IID_IWbemClientConnectionTransport = GUID(0xa889c72a, 0xfcc1, 0x4a9e, [0xaf, 0x61, 0xed, 0x7, 0x13, 0x33, 0xfb, 0x5b]);
interface IWbemClientConnectionTransport : IUnknown
{
    HRESULT Open(BSTR, uint, ubyte*, const(BSTR), const(BSTR), const(BSTR), const(BSTR), int, IWbemContext, const(GUID)*, void**, IWbemCallResult*);
    HRESULT OpenAsync(BSTR, uint, ubyte*, const(BSTR), const(BSTR), const(BSTR), const(BSTR), int, IWbemContext, const(GUID)*, IWbemObjectSink);
    HRESULT Cancel(int, IWbemObjectSink);
}
enum CLSID_WbemDCOMTransport = GUID(0xf7ce2e13, 0x8c90, 0x11d1, [0x9e, 0x7b, 0x0, 0xc0, 0x4f, 0xc3, 0x24, 0xa8]);
struct WbemDCOMTransport
{
}
enum IID_IWbemConstructClassObject = GUID(0x9ef76194, 0x70d5, 0x11d1, [0xad, 0x90, 0x0, 0xc0, 0x4f, 0xd8, 0xfd, 0xff]);
interface IWbemConstructClassObject : IUnknown
{
    HRESULT SetInheritanceChain(int, PWSTR*);
    HRESULT SetPropertyOrigin(const(wchar)*, int);
    HRESULT SetMethodOrigin(const(wchar)*, int);
    HRESULT SetServerNamespace(const(wchar)*, const(wchar)*);
}
