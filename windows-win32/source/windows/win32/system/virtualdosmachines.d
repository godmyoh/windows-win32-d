module windows.win32.system.virtualdosmachines;

import windows.win32.foundation : BOOL, CHAR, HANDLE, LPARAM, PSTR;
import windows.win32.system.diagnostics.debug__ : CONTEXT, DEBUG_EVENT, LDT_ENTRY;
import windows.win32.system.kernel : FLOATING_SAVE_AREA;

version (Windows):
extern (Windows):

enum VDMCONTEXT_i386 = 0x00010000;
enum VDMCONTEXT_i486 = 0x00010000;
enum VDM_KGDT_R3_CODE = 0x00000018;
enum VDM_MAXIMUM_SUPPORTED_EXTENSION = 0x00000200;
enum V86FLAGS_CARRY = 0x00000001;
enum V86FLAGS_PARITY = 0x00000004;
enum V86FLAGS_AUXCARRY = 0x00000010;
enum V86FLAGS_ZERO = 0x00000040;
enum V86FLAGS_SIGN = 0x00000080;
enum V86FLAGS_TRACE = 0x00000100;
enum V86FLAGS_INTERRUPT = 0x00000200;
enum V86FLAGS_DIRECTION = 0x00000400;
enum V86FLAGS_OVERFLOW = 0x00000800;
enum V86FLAGS_IOPL = 0x00003000;
enum V86FLAGS_IOPL_BITS = 0x00000012;
enum V86FLAGS_RESUME = 0x00010000;
enum V86FLAGS_V86 = 0x00020000;
enum V86FLAGS_ALIGNMENT = 0x00040000;
enum STATUS_VDM_EVENT = 0x40000005;
enum DBG_SEGLOAD = 0x00000000;
enum DBG_SEGMOVE = 0x00000001;
enum DBG_SEGFREE = 0x00000002;
enum DBG_MODLOAD = 0x00000003;
enum DBG_MODFREE = 0x00000004;
enum DBG_SINGLESTEP = 0x00000005;
enum DBG_BREAK = 0x00000006;
enum DBG_GPFAULT = 0x00000007;
enum DBG_DIVOVERFLOW = 0x00000008;
enum DBG_INSTRFAULT = 0x00000009;
enum DBG_TASKSTART = 0x0000000a;
enum DBG_TASKSTOP = 0x0000000b;
enum DBG_DLLSTART = 0x0000000c;
enum DBG_DLLSTOP = 0x0000000d;
enum DBG_ATTACH = 0x0000000e;
enum DBG_TOOLHELP = 0x0000000f;
enum DBG_STACKFAULT = 0x00000010;
enum DBG_WOWINIT = 0x00000011;
enum DBG_TEMPBP = 0x00000012;
enum DBG_MODMOVE = 0x00000013;
enum DBG_INIT = 0x00000014;
enum DBG_GPFAULT2 = 0x00000015;
enum VDMEVENT_NEEDS_INTERACTIVE = 0x00008000;
enum VDMEVENT_VERBOSE = 0x00004000;
enum VDMEVENT_PE = 0x00002000;
enum VDMEVENT_ALLFLAGS = 0x0000e000;
enum VDMEVENT_V86 = 0x00000001;
enum VDMEVENT_PM16 = 0x00000002;
enum MAX_MODULE_NAME = 0x00000009;
enum MAX_PATH16 = 0x000000ff;
enum SN_CODE = 0x00000000;
enum SN_DATA = 0x00000001;
enum SN_V86 = 0x00000002;
enum GLOBAL_ALL = 0x00000000;
enum GLOBAL_LRU = 0x00000001;
enum GLOBAL_FREE = 0x00000002;
enum GT_UNKNOWN = 0x00000000;
enum GT_DGROUP = 0x00000001;
enum GT_DATA = 0x00000002;
enum GT_CODE = 0x00000003;
enum GT_TASK = 0x00000004;
enum GT_RESOURCE = 0x00000005;
enum GT_MODULE = 0x00000006;
enum GT_FREE = 0x00000007;
enum GT_INTERNAL = 0x00000008;
enum GT_SENTINEL = 0x00000009;
enum GT_BURGERMASTER = 0x0000000a;
enum GD_USERDEFINED = 0x00000000;
enum GD_CURSORCOMPONENT = 0x00000001;
enum GD_BITMAP = 0x00000002;
enum GD_ICONCOMPONENT = 0x00000003;
enum GD_MENU = 0x00000004;
enum GD_DIALOG = 0x00000005;
enum GD_STRING = 0x00000006;
enum GD_FONTDIR = 0x00000007;
enum GD_FONT = 0x00000008;
enum GD_ACCELERATORS = 0x00000009;
enum GD_RCDATA = 0x0000000a;
enum GD_ERRTABLE = 0x0000000b;
enum GD_CURSOR = 0x0000000c;
enum GD_ICON = 0x0000000e;
enum GD_NAMETABLE = 0x0000000f;
enum GD_MAX_RESOURCE = 0x0000000f;
enum WOW_SYSTEM = 0x00000001;
enum VDMDBG_BREAK_DOSTASK = 0x00000001;
enum VDMDBG_BREAK_WOWTASK = 0x00000002;
enum VDMDBG_BREAK_LOADDLL = 0x00000004;
enum VDMDBG_BREAK_EXCEPTIONS = 0x00000008;
enum VDMDBG_BREAK_DEBUGGER = 0x00000010;
enum VDMDBG_TRACE_HISTORY = 0x00000080;
enum VDMDBG_BREAK_DIVIDEBYZERO = 0x00000100;
enum VDMDBG_INITIAL_FLAGS = 0x00000100;
enum VDMDBG_MAX_SYMBOL_BUFFER = 0x00000100;
enum VDMADDR_V86 = 0x00000002;
enum VDMADDR_PM16 = 0x00000004;
enum VDMADDR_PM32 = 0x00000010;
struct VDMCONTEXT
{
    uint ContextFlags;
    uint Dr0;
    uint Dr1;
    uint Dr2;
    uint Dr3;
    uint Dr6;
    uint Dr7;
    FLOATING_SAVE_AREA FloatSave;
    uint SegGs;
    uint SegFs;
    uint SegEs;
    uint SegDs;
    uint Edi;
    uint Esi;
    uint Ebx;
    uint Edx;
    uint Ecx;
    uint Eax;
    uint Ebp;
    uint Eip;
    uint SegCs;
    uint EFlags;
    uint Esp;
    uint SegSs;
    ubyte[512] ExtendedRegisters;
}
struct VDMLDT_ENTRY
{
    ushort LimitLow;
    ushort BaseLow;
    union _HighWord_e__Union
    {
        struct _Bytes_e__Struct
        {
            ubyte BaseMid;
            ubyte Flags1;
            ubyte Flags2;
            ubyte BaseHi;
        }
        struct _Bits_e__Struct
        {
            uint _bitfield0;
        }
    }
}
alias VDMGETTHREADSELECTORENTRYPROC = BOOL function(HANDLE, HANDLE, uint, VDMLDT_ENTRY*);
alias VDMGETCONTEXTPROC = BOOL function(HANDLE, HANDLE, VDMCONTEXT*);
alias VDMSETCONTEXTPROC = BOOL function(HANDLE, HANDLE, VDMCONTEXT*);
struct VDMCONTEXT_WITHOUT_XSAVE
{
    uint ContextFlags;
    uint Dr0;
    uint Dr1;
    uint Dr2;
    uint Dr3;
    uint Dr6;
    uint Dr7;
    FLOATING_SAVE_AREA FloatSave;
    uint SegGs;
    uint SegFs;
    uint SegEs;
    uint SegDs;
    uint Edi;
    uint Esi;
    uint Ebx;
    uint Edx;
    uint Ecx;
    uint Eax;
    uint Ebp;
    uint Eip;
    uint SegCs;
    uint EFlags;
    uint Esp;
    uint SegSs;
}
struct SEGMENT_NOTE
{
    ushort Selector1;
    ushort Selector2;
    ushort Segment;
    CHAR[10] Module;
    CHAR[256] FileName;
    ushort Type;
    uint Length;
}
struct IMAGE_NOTE
{
    CHAR[10] Module;
    CHAR[256] FileName;
    ushort hModule;
    ushort hTask;
}
struct MODULEENTRY
{
    align (4):
    uint dwSize;
    CHAR[10] szModule;
    HANDLE hModule;
    ushort wcUsage;
    CHAR[256] szExePath;
    ushort wNext;
}
struct TEMP_BP_NOTE
{
    ushort Seg;
    uint Offset;
    BOOL bPM;
}
struct VDM_SEGINFO
{
    ushort Selector;
    ushort SegNumber;
    uint Length;
    ushort Type;
    CHAR[9] ModuleName;
    CHAR[255] FileName;
}
struct GLOBALENTRY
{
    align (4):
    uint dwSize;
    uint dwAddress;
    uint dwBlockSize;
    HANDLE hBlock;
    ushort wcLock;
    ushort wcPageLock;
    ushort wFlags;
    BOOL wHeapPresent;
    HANDLE hOwner;
    ushort wType;
    ushort wData;
    uint dwNext;
    uint dwNextAlt;
}
alias DEBUGEVENTPROC = uint function(DEBUG_EVENT*, void*);
alias PROCESSENUMPROC = BOOL function(uint, uint, LPARAM);
alias TASKENUMPROC = BOOL function(uint, ushort, ushort, LPARAM);
alias TASKENUMPROCEX = BOOL function(uint, ushort, ushort, byte*, byte*, LPARAM);
alias VDMPROCESSEXCEPTIONPROC = BOOL function(DEBUG_EVENT*);
/+ [CONFLICTED] alias VDMGETTHREADSELECTORENTRYPROC = BOOL function(HANDLE, HANDLE, uint, LDT_ENTRY*);
+/
alias VDMGETPOINTERPROC = uint function(HANDLE, HANDLE, ushort, uint, BOOL);
/+ [CONFLICTED] alias VDMGETCONTEXTPROC = BOOL function(HANDLE, HANDLE, CONTEXT*);
+/
/+ [CONFLICTED] alias VDMSETCONTEXTPROC = BOOL function(HANDLE, HANDLE, CONTEXT*);
+/
alias VDMKILLWOWPROC = BOOL function();
alias VDMDETECTWOWPROC = BOOL function();
alias VDMBREAKTHREADPROC = BOOL function(HANDLE);
alias VDMGETSELECTORMODULEPROC = BOOL function(HANDLE, HANDLE, ushort, uint*, PSTR, uint, PSTR, uint);
alias VDMGETMODULESELECTORPROC = BOOL function(HANDLE, HANDLE, uint, PSTR, ushort*);
alias VDMMODULEFIRSTPROC = BOOL function(HANDLE, HANDLE, MODULEENTRY*, DEBUGEVENTPROC, void*);
alias VDMMODULENEXTPROC = BOOL function(HANDLE, HANDLE, MODULEENTRY*, DEBUGEVENTPROC, void*);
alias VDMGLOBALFIRSTPROC = BOOL function(HANDLE, HANDLE, GLOBALENTRY*, ushort, DEBUGEVENTPROC, void*);
alias VDMGLOBALNEXTPROC = BOOL function(HANDLE, HANDLE, GLOBALENTRY*, ushort, DEBUGEVENTPROC, void*);
alias VDMENUMPROCESSWOWPROC = int function(PROCESSENUMPROC, LPARAM);
alias VDMENUMTASKWOWPROC = int function(uint, TASKENUMPROC, LPARAM);
alias VDMENUMTASKWOWEXPROC = int function(uint, TASKENUMPROCEX, LPARAM);
alias VDMTERMINATETASKINWOWPROC = BOOL function(uint, ushort);
alias VDMSTARTTASKINWOWPROC = BOOL function(uint, PSTR, ushort);
alias VDMGETDBGFLAGSPROC = uint function(HANDLE);
alias VDMSETDBGFLAGSPROC = BOOL function(HANDLE, uint);
alias VDMISMODULELOADEDPROC = BOOL function(PSTR);
alias VDMGETSEGMENTINFOPROC = BOOL function(ushort, uint, BOOL, VDM_SEGINFO);
alias VDMGETSYMBOLPROC = BOOL function(PSTR, ushort, uint, BOOL, BOOL, PSTR, uint*);
alias VDMGETADDREXPRESSIONPROC = BOOL function(PSTR, PSTR, ushort*, uint*, ushort*);
