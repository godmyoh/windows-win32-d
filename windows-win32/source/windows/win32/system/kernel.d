module windows.win32.system.kernel;

import windows.win32.guid : GUID;
import windows.win32.foundation : PSTR;
import windows.win32.system.diagnostics.debug_ : CONTEXT, EXCEPTION_RECORD;

version (Windows):
extern (Windows):

alias EXCEPTION_DISPOSITION = int;
enum : int
{
    ExceptionContinueExecution = 0x00000000,
    ExceptionContinueSearch    = 0x00000001,
    ExceptionNestedException   = 0x00000002,
    ExceptionCollidedUnwind    = 0x00000003,
}

struct SLIST_ENTRY
{
    SLIST_ENTRY* Next;
}
void RtlInitializeSListHead(SLIST_HEADER*);
SLIST_ENTRY* RtlFirstEntrySList(const(SLIST_HEADER)*);
SLIST_ENTRY* RtlInterlockedPopEntrySList(SLIST_HEADER*);
SLIST_ENTRY* RtlInterlockedPushEntrySList(SLIST_HEADER*, SLIST_ENTRY*);
SLIST_ENTRY* RtlInterlockedPushListSListEx(SLIST_HEADER*, SLIST_ENTRY*, SLIST_ENTRY*, uint);
SLIST_ENTRY* RtlInterlockedFlushSList(SLIST_HEADER*);
ushort RtlQueryDepthSList(SLIST_HEADER*);
enum OBJ_HANDLE_TAGBITS = 0x00000003;
enum RTL_BALANCED_NODE_RESERVED_PARENT_MASK = 0x00000003;
enum OBJ_INHERIT = 0x00000002;
enum OBJ_PERMANENT = 0x00000010;
enum OBJ_EXCLUSIVE = 0x00000020;
enum OBJ_CASE_INSENSITIVE = 0x00000040;
enum OBJ_OPENIF = 0x00000080;
enum OBJ_OPENLINK = 0x00000100;
enum OBJ_KERNEL_HANDLE = 0x00000200;
enum OBJ_FORCE_ACCESS_CHECK = 0x00000400;
enum OBJ_IGNORE_IMPERSONATED_DEVICEMAP = 0x00000800;
enum OBJ_DONT_REPARSE = 0x00001000;
enum OBJ_VALID_ATTRIBUTES = 0x00001ff2;
enum NULL64 = 0x00000000;
enum MAXUCHAR = 0x000000ff;
enum MAXUSHORT = 0x0000ffff;
enum MAXULONG = 0xffffffff;
union SLIST_HEADER
{
    struct
    {
        ulong Alignment;
        ulong Region;
    }
    struct _HeaderArm64_e__Struct
    {
        ulong _bitfield1;
        ulong _bitfield2;
    }
}
struct QUAD
{
    union
    {
        long UseThisFieldToCopy;
        double DoNotUseThisField;
    }
}
struct PROCESSOR_NUMBER
{
    ushort Group;
    ubyte Number;
    ubyte Reserved;
}
alias EVENT_TYPE = int;
enum : int
{
    NotificationEvent    = 0x00000000,
    SynchronizationEvent = 0x00000001,
}

alias TIMER_TYPE = int;
enum : int
{
    NotificationTimer    = 0x00000000,
    SynchronizationTimer = 0x00000001,
}

alias WAIT_TYPE = int;
enum : int
{
    WaitAll          = 0x00000000,
    WaitAny          = 0x00000001,
    WaitNotification = 0x00000002,
    WaitDequeue      = 0x00000003,
    WaitDpc          = 0x00000004,
}

struct STRING
{
    ushort Length;
    ushort MaximumLength;
    PSTR Buffer;
}
struct CSTRING
{
    ushort Length;
    ushort MaximumLength;
    const(char)* Buffer;
}
struct LIST_ENTRY
{
    LIST_ENTRY* Flink;
    LIST_ENTRY* Blink;
}
struct SINGLE_LIST_ENTRY
{
    SINGLE_LIST_ENTRY* Next;
}
struct RTL_BALANCED_NODE
{
    union
    {
        RTL_BALANCED_NODE*[2] Children;
        struct
        {
            RTL_BALANCED_NODE* Left;
            RTL_BALANCED_NODE* Right;
        }
    }
    union
    {
        ubyte _bitfield0;
        ulong ParentValue;
    }
}
struct LIST_ENTRY32
{
    uint Flink;
    uint Blink;
}
struct LIST_ENTRY64
{
    ulong Flink;
    ulong Blink;
}
struct SINGLE_LIST_ENTRY32
{
    uint Next;
}
struct WNF_STATE_NAME
{
    uint[2] Data;
}
struct STRING32
{
    ushort Length;
    ushort MaximumLength;
    uint Buffer;
}
struct STRING64
{
    ushort Length;
    ushort MaximumLength;
    ulong Buffer;
}
struct OBJECTID
{
    GUID Lineage;
    uint Uniquifier;
}
alias EXCEPTION_ROUTINE = EXCEPTION_DISPOSITION function(EXCEPTION_RECORD*, void*, CONTEXT*, void*);
alias NT_PRODUCT_TYPE = int;
enum : int
{
    NtProductWinNt    = 0x00000001,
    NtProductLanManNt = 0x00000002,
    NtProductServer   = 0x00000003,
}

alias SUITE_TYPE = int;
enum : int
{
    SmallBusiness           = 0x00000000,
    Enterprise              = 0x00000001,
    BackOffice              = 0x00000002,
    CommunicationServer     = 0x00000003,
    TerminalServer          = 0x00000004,
    SmallBusinessRestricted = 0x00000005,
    EmbeddedNT              = 0x00000006,
    DataCenter              = 0x00000007,
    SingleUserTS            = 0x00000008,
    Personal                = 0x00000009,
    Blade                   = 0x0000000a,
    EmbeddedRestricted      = 0x0000000b,
    SecurityAppliance       = 0x0000000c,
    StorageServer           = 0x0000000d,
    ComputeServer           = 0x0000000e,
    WHServer                = 0x0000000f,
    PhoneNT                 = 0x00000010,
    MultiUserTS             = 0x00000011,
    MaxSuiteType            = 0x00000012,
}

/+ [CONFLICTED] union SLIST_HEADER
{
    struct
    {
        ulong Alignment;
        ulong Region;
    }
    struct _HeaderX64_e__Struct
    {
        ulong _bitfield1;
        ulong _bitfield2;
    }
}
+/
struct FLOATING_SAVE_AREA
{
    uint ControlWord;
    uint StatusWord;
    uint TagWord;
    uint ErrorOffset;
    uint ErrorSelector;
    uint DataOffset;
    uint DataSelector;
    ubyte[80] RegisterArea;
    uint Cr0NpxState;
}
alias COMPARTMENT_ID = int;
enum : int
{
    UNSPECIFIED_COMPARTMENT_ID = 0x00000000,
    DEFAULT_COMPARTMENT_ID     = 0x00000001,
}

/+ [CONFLICTED] struct FLOATING_SAVE_AREA
{
    uint ControlWord;
    uint StatusWord;
    uint TagWord;
    uint ErrorOffset;
    uint ErrorSelector;
    uint DataOffset;
    uint DataSelector;
    ubyte[80] RegisterArea;
    uint Spare0;
}
+/
struct EXCEPTION_REGISTRATION_RECORD
{
    EXCEPTION_REGISTRATION_RECORD* Next;
    EXCEPTION_ROUTINE Handler;
}
struct NT_TIB
{
    EXCEPTION_REGISTRATION_RECORD* ExceptionList;
    void* StackBase;
    void* StackLimit;
    void* SubSystemTib;
    union
    {
        void* FiberData;
        uint Version;
    }
    void* ArbitraryUserPointer;
    NT_TIB* Self;
}
/+ [CONFLICTED] union SLIST_HEADER
{
    ulong Alignment;
    struct
    {
        SINGLE_LIST_ENTRY Next;
        ushort Depth;
        ushort CpuId;
    }
}
+/
