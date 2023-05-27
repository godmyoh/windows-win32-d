module windows.win32.system.diagnostics.debug_.activescript;

import windows.win32.guid : GUID;
import windows.win32.foundation : BOOL, BSTR, HANDLE, HANDLE_PTR, HRESULT, HWND, PSTR, PWSTR, VARIANT_BOOL;
import windows.win32.system.com : DISPPARAMS, EXCEPINFO, IDispatch, ITypeInfo, IUnknown, TYPEDESC;
import windows.win32.system.diagnostics.debug_ : IDebugProperty;
import windows.win32.system.variant : VARENUM, VARIANT;

version (Windows):
extern (Windows):

enum CATID_ActiveScriptAuthor = GUID(0xaee2a92, 0xbcbb, 0x11d0, [0x8c, 0x72, 0x0, 0xc0, 0x4f, 0xc2, 0xb0, 0x85]);
enum APPBREAKFLAG_DEBUGGER_BLOCK = 0x00000001;
enum APPBREAKFLAG_DEBUGGER_HALT = 0x00000002;
enum APPBREAKFLAG_STEP = 0x00010000;
enum APPBREAKFLAG_NESTED = 0x00020000;
enum APPBREAKFLAG_STEPTYPE_SOURCE = 0x00000000;
enum APPBREAKFLAG_STEPTYPE_BYTECODE = 0x00100000;
enum APPBREAKFLAG_STEPTYPE_MACHINE = 0x00200000;
enum APPBREAKFLAG_STEPTYPE_MASK = 0x00f00000;
enum APPBREAKFLAG_IN_BREAKPOINT = 0x80000000;
enum SOURCETEXT_ATTR_KEYWORD = 0x00000001;
enum SOURCETEXT_ATTR_COMMENT = 0x00000002;
enum SOURCETEXT_ATTR_NONSOURCE = 0x00000004;
enum SOURCETEXT_ATTR_OPERATOR = 0x00000008;
enum SOURCETEXT_ATTR_NUMBER = 0x00000010;
enum SOURCETEXT_ATTR_STRING = 0x00000020;
enum SOURCETEXT_ATTR_FUNCTION_START = 0x00000040;
enum TEXT_DOC_ATTR_READONLY = 0x00000001;
enum TEXT_DOC_ATTR_TYPE_PRIMARY = 0x00000002;
enum TEXT_DOC_ATTR_TYPE_WORKER = 0x00000004;
enum TEXT_DOC_ATTR_TYPE_SCRIPT = 0x00000008;
enum DEBUG_TEXT_ISEXPRESSION = 0x00000001;
enum DEBUG_TEXT_RETURNVALUE = 0x00000002;
enum DEBUG_TEXT_NOSIDEEFFECTS = 0x00000004;
enum DEBUG_TEXT_ALLOWBREAKPOINTS = 0x00000008;
enum DEBUG_TEXT_ALLOWERRORREPORT = 0x00000010;
enum DEBUG_TEXT_EVALUATETOCODECONTEXT = 0x00000020;
enum DEBUG_TEXT_ISNONUSERCODE = 0x00000040;
enum THREAD_STATE_RUNNING = 0x00000001;
enum THREAD_STATE_SUSPENDED = 0x00000002;
enum THREAD_BLOCKED = 0x00000004;
enum THREAD_OUT_OF_CONTEXT = 0x00000008;
enum CATID_ActiveScript = GUID(0xf0b7a1a1, 0x9847, 0x11cf, [0x8f, 0x20, 0x0, 0x80, 0x5f, 0x2c, 0xd0, 0x64]);
enum CATID_ActiveScriptParse = GUID(0xf0b7a1a2, 0x9847, 0x11cf, [0x8f, 0x20, 0x0, 0x80, 0x5f, 0x2c, 0xd0, 0x64]);
enum CATID_ActiveScriptEncode = GUID(0xf0b7a1a3, 0x9847, 0x11cf, [0x8f, 0x20, 0x0, 0x80, 0x5f, 0x2c, 0xd0, 0x64]);
enum OID_VBSSIP = GUID(0x1629f04e, 0x2799, 0x4db5, [0x8f, 0xe5, 0xac, 0xe1, 0xf, 0x17, 0xeb, 0xab]);
enum OID_JSSIP = GUID(0x6c9e010, 0x38ce, 0x11d4, [0xa2, 0xa3, 0x0, 0x10, 0x4b, 0xd3, 0x50, 0x90]);
enum OID_WSFSIP = GUID(0x1a610570, 0x38ce, 0x11d4, [0xa2, 0xa3, 0x0, 0x10, 0x4b, 0xd3, 0x50, 0x90]);
enum SCRIPTITEM_ISVISIBLE = 0x00000002;
enum SCRIPTITEM_ISSOURCE = 0x00000004;
enum SCRIPTITEM_GLOBALMEMBERS = 0x00000008;
enum SCRIPTITEM_ISPERSISTENT = 0x00000040;
enum SCRIPTITEM_CODEONLY = 0x00000200;
enum SCRIPTITEM_NOCODE = 0x00000400;
enum SCRIPTTYPELIB_ISCONTROL = 0x00000010;
enum SCRIPTTYPELIB_ISPERSISTENT = 0x00000040;
enum SCRIPTTEXT_DELAYEXECUTION = 0x00000001;
enum SCRIPTTEXT_ISVISIBLE = 0x00000002;
enum SCRIPTTEXT_ISEXPRESSION = 0x00000020;
enum SCRIPTTEXT_ISPERSISTENT = 0x00000040;
enum SCRIPTTEXT_HOSTMANAGESSOURCE = 0x00000080;
enum SCRIPTTEXT_ISXDOMAIN = 0x00000100;
enum SCRIPTTEXT_ISNONUSERCODE = 0x00000200;
enum SCRIPTPROC_ISEXPRESSION = 0x00000020;
enum SCRIPTPROC_HOSTMANAGESSOURCE = 0x00000080;
enum SCRIPTPROC_IMPLICIT_THIS = 0x00000100;
enum SCRIPTPROC_IMPLICIT_PARENTS = 0x00000200;
enum SCRIPTPROC_ISXDOMAIN = 0x00000400;
enum SCRIPTINFO_IUNKNOWN = 0x00000001;
enum SCRIPTINFO_ITYPEINFO = 0x00000002;
enum SCRIPTINTERRUPT_DEBUG = 0x00000001;
enum SCRIPTINTERRUPT_RAISEEXCEPTION = 0x00000002;
enum SCRIPTSTAT_STATEMENT_COUNT = 0x00000001;
enum SCRIPTSTAT_INSTRUCTION_COUNT = 0x00000002;
enum SCRIPTSTAT_INTSTRUCTION_TIME = 0x00000003;
enum SCRIPTSTAT_TOTAL_TIME = 0x00000004;
enum SCRIPT_ENCODE_SECTION = 0x00000001;
enum SCRIPT_ENCODE_DEFAULT_LANGUAGE = 0x00000001;
enum SCRIPT_ENCODE_NO_ASP_LANGUAGE = 0x00000002;
enum SCRIPTPROP_NAME = 0x00000000;
enum SCRIPTPROP_MAJORVERSION = 0x00000001;
enum SCRIPTPROP_MINORVERSION = 0x00000002;
enum SCRIPTPROP_BUILDNUMBER = 0x00000003;
enum SCRIPTPROP_DELAYEDEVENTSINKING = 0x00001000;
enum SCRIPTPROP_CATCHEXCEPTION = 0x00001001;
enum SCRIPTPROP_CONVERSIONLCID = 0x00001002;
enum SCRIPTPROP_HOSTSTACKREQUIRED = 0x00001003;
enum SCRIPTPROP_SCRIPTSAREFULLYTRUSTED = 0x00001004;
enum SCRIPTPROP_DEBUGGER = 0x00001100;
enum SCRIPTPROP_JITDEBUG = 0x00001101;
enum SCRIPTPROP_GCCONTROLSOFTCLOSE = 0x00002000;
enum SCRIPTPROP_INTEGERMODE = 0x00003000;
enum SCRIPTPROP_STRINGCOMPAREINSTANCE = 0x00003001;
enum SCRIPTPROP_INVOKEVERSIONING = 0x00004000;
enum SCRIPTPROP_HACK_FIBERSUPPORT = 0x70000000;
enum SCRIPTPROP_HACK_TRIDENTEVENTSINK = 0x70000001;
enum SCRIPTPROP_ABBREVIATE_GLOBALNAME_RESOLUTION = 0x70000002;
enum SCRIPTPROP_HOSTKEEPALIVE = 0x70000004;
enum SCRIPT_E_RECORDED = 0xffffffff86664004;
enum SCRIPT_E_REPORTED = 0xffffffff80020101;
enum SCRIPT_E_PROPAGATE = 0xffffffff80020102;
enum FACILITY_JsDEBUG = 0x00000dc7;
enum E_JsDEBUG_MISMATCHED_RUNTIME = 0xffffffff8dc70001;
enum E_JsDEBUG_UNKNOWN_THREAD = 0xffffffff8dc70002;
enum E_JsDEBUG_OUTSIDE_OF_VM = 0xffffffff8dc70004;
enum E_JsDEBUG_INVALID_MEMORY_ADDRESS = 0xffffffff8dc70005;
enum E_JsDEBUG_SOURCE_LOCATION_NOT_FOUND = 0xffffffff8dc70006;
enum E_JsDEBUG_RUNTIME_NOT_IN_DEBUG_MODE = 0xffffffff8dc70007;
enum ACTIVPROF_E_PROFILER_PRESENT = 0xffffffff80040200;
enum ACTIVPROF_E_PROFILER_ABSENT = 0xffffffff80040201;
enum ACTIVPROF_E_UNABLE_TO_APPLY_ACTION = 0xffffffff80040202;
enum PROFILER_HEAP_OBJECT_NAME_ID_UNAVAILABLE = 0xffffffff;
enum fasaPreferInternalHandler = 0x00000001;
enum fasaSupportInternalHandler = 0x00000002;
enum fasaCaseSensitive = 0x00000004;
enum SCRIPT_CMPL_NOLIST = 0x00000000;
enum SCRIPT_CMPL_MEMBERLIST = 0x00000001;
enum SCRIPT_CMPL_ENUMLIST = 0x00000002;
enum SCRIPT_CMPL_PARAMTIP = 0x00000004;
enum SCRIPT_CMPL_GLOBALLIST = 0x00000008;
enum SCRIPT_CMPL_ENUM_TRIGGER = 0x00000001;
enum SCRIPT_CMPL_MEMBER_TRIGGER = 0x00000002;
enum SCRIPT_CMPL_PARAM_TRIGGER = 0x00000003;
enum SCRIPT_CMPL_COMMIT = 0x00000004;
enum GETATTRTYPE_NORMAL = 0x00000000;
enum GETATTRTYPE_DEPSCAN = 0x00000001;
enum GETATTRFLAG_THIS = 0x00000100;
enum GETATTRFLAG_HUMANTEXT = 0x00008000;
enum SOURCETEXT_ATTR_HUMANTEXT = 0x00008000;
enum SOURCETEXT_ATTR_IDENTIFIER = 0x00000100;
enum SOURCETEXT_ATTR_MEMBERLOOKUP = 0x00000200;
enum SOURCETEXT_ATTR_THIS = 0x00000400;
alias SCRIPTLANGUAGEVERSION = int;
enum : int
{
    SCRIPTLANGUAGEVERSION_DEFAULT = 0x00000000,
    SCRIPTLANGUAGEVERSION_5_7     = 0x00000001,
    SCRIPTLANGUAGEVERSION_5_8     = 0x00000002,
    SCRIPTLANGUAGEVERSION_MAX     = 0x000000ff,
}

alias SCRIPTSTATE = int;
enum : int
{
    SCRIPTSTATE_UNINITIALIZED = 0x00000000,
    SCRIPTSTATE_INITIALIZED   = 0x00000005,
    SCRIPTSTATE_STARTED       = 0x00000001,
    SCRIPTSTATE_CONNECTED     = 0x00000002,
    SCRIPTSTATE_DISCONNECTED  = 0x00000003,
    SCRIPTSTATE_CLOSED        = 0x00000004,
}

alias SCRIPTTRACEINFO = int;
enum : int
{
    SCRIPTTRACEINFO_SCRIPTSTART    = 0x00000000,
    SCRIPTTRACEINFO_SCRIPTEND      = 0x00000001,
    SCRIPTTRACEINFO_COMCALLSTART   = 0x00000002,
    SCRIPTTRACEINFO_COMCALLEND     = 0x00000003,
    SCRIPTTRACEINFO_CREATEOBJSTART = 0x00000004,
    SCRIPTTRACEINFO_CREATEOBJEND   = 0x00000005,
    SCRIPTTRACEINFO_GETOBJSTART    = 0x00000006,
    SCRIPTTRACEINFO_GETOBJEND      = 0x00000007,
}

alias SCRIPTTHREADSTATE = int;
enum : int
{
    SCRIPTTHREADSTATE_NOTINSCRIPT = 0x00000000,
    SCRIPTTHREADSTATE_RUNNING     = 0x00000001,
}

alias SCRIPTGCTYPE = int;
enum : int
{
    SCRIPTGCTYPE_NORMAL     = 0x00000000,
    SCRIPTGCTYPE_EXHAUSTIVE = 0x00000001,
}

alias SCRIPTUICITEM = int;
enum : int
{
    SCRIPTUICITEM_INPUTBOX = 0x00000001,
    SCRIPTUICITEM_MSGBOX   = 0x00000002,
}

alias SCRIPTUICHANDLING = int;
enum : int
{
    SCRIPTUICHANDLING_ALLOW       = 0x00000000,
    SCRIPTUICHANDLING_NOUIERROR   = 0x00000001,
    SCRIPTUICHANDLING_NOUIDEFAULT = 0x00000002,
}

enum IID_IActiveScriptSite = GUID(0xdb01a1e3, 0xa42b, 0x11cf, [0x8f, 0x20, 0x0, 0x80, 0x5f, 0x2c, 0xd0, 0x64]);
interface IActiveScriptSite : IUnknown
{
    HRESULT GetLCID(uint*);
    HRESULT GetItemInfo(const(wchar)*, uint, IUnknown*, ITypeInfo*);
    HRESULT GetDocVersionString(BSTR*);
    HRESULT OnScriptTerminate(const(VARIANT)*, const(EXCEPINFO)*);
    HRESULT OnStateChange(SCRIPTSTATE);
    HRESULT OnScriptError(IActiveScriptError);
    HRESULT OnEnterScript();
    HRESULT OnLeaveScript();
}
enum IID_IActiveScriptError = GUID(0xeae1ba61, 0xa4ed, 0x11cf, [0x8f, 0x20, 0x0, 0x80, 0x5f, 0x2c, 0xd0, 0x64]);
interface IActiveScriptError : IUnknown
{
    HRESULT GetExceptionInfo(EXCEPINFO*);
    HRESULT GetSourcePosition(uint*, uint*, int*);
    HRESULT GetSourceLineText(BSTR*);
}
enum IID_IActiveScriptError64 = GUID(0xb21fb2a1, 0x5b8f, 0x4963, [0x8c, 0x21, 0x21, 0x45, 0xf, 0x84, 0xed, 0x7f]);
interface IActiveScriptError64 : IActiveScriptError
{
    HRESULT GetSourcePosition64(ulong*, uint*, int*);
}
enum IID_IActiveScriptSiteWindow = GUID(0xd10f6761, 0x83e9, 0x11cf, [0x8f, 0x20, 0x0, 0x80, 0x5f, 0x2c, 0xd0, 0x64]);
interface IActiveScriptSiteWindow : IUnknown
{
    HRESULT GetWindow(HWND*);
    HRESULT EnableModeless(BOOL);
}
enum IID_IActiveScriptSiteUIControl = GUID(0xaedae97e, 0xd7ee, 0x4796, [0xb9, 0x60, 0x7f, 0x9, 0x2a, 0xe8, 0x44, 0xab]);
interface IActiveScriptSiteUIControl : IUnknown
{
    HRESULT GetUIBehavior(SCRIPTUICITEM, SCRIPTUICHANDLING*);
}
enum IID_IActiveScriptSiteInterruptPoll = GUID(0x539698a0, 0xcdca, 0x11cf, [0xa5, 0xeb, 0x0, 0xaa, 0x0, 0x47, 0xa0, 0x63]);
interface IActiveScriptSiteInterruptPoll : IUnknown
{
    HRESULT QueryContinue();
}
enum IID_IActiveScript = GUID(0xbb1a2ae1, 0xa4f9, 0x11cf, [0x8f, 0x20, 0x0, 0x80, 0x5f, 0x2c, 0xd0, 0x64]);
interface IActiveScript : IUnknown
{
    HRESULT SetScriptSite(IActiveScriptSite);
    HRESULT GetScriptSite(const(GUID)*, void**);
    HRESULT SetScriptState(SCRIPTSTATE);
    HRESULT GetScriptState(SCRIPTSTATE*);
    HRESULT Close();
    HRESULT AddNamedItem(const(wchar)*, uint);
    HRESULT AddTypeLib(const(GUID)*, uint, uint, uint);
    HRESULT GetScriptDispatch(const(wchar)*, IDispatch*);
    HRESULT GetCurrentScriptThreadID(uint*);
    HRESULT GetScriptThreadID(uint, uint*);
    HRESULT GetScriptThreadState(uint, SCRIPTTHREADSTATE*);
    HRESULT InterruptScriptThread(uint, const(EXCEPINFO)*, uint);
    HRESULT Clone(IActiveScript*);
}
enum IID_IActiveScriptParse32 = GUID(0xbb1a2ae2, 0xa4f9, 0x11cf, [0x8f, 0x20, 0x0, 0x80, 0x5f, 0x2c, 0xd0, 0x64]);
interface IActiveScriptParse32 : IUnknown
{
    HRESULT InitNew();
    HRESULT AddScriptlet(const(wchar)*, const(wchar)*, const(wchar)*, const(wchar)*, const(wchar)*, const(wchar)*, uint, uint, uint, BSTR*, EXCEPINFO*);
    HRESULT ParseScriptText(const(wchar)*, const(wchar)*, IUnknown, const(wchar)*, uint, uint, uint, VARIANT*, EXCEPINFO*);
}
enum IID_IActiveScriptParse64 = GUID(0xc7ef7658, 0xe1ee, 0x480e, [0x97, 0xea, 0xd5, 0x2c, 0xb4, 0xd7, 0x6d, 0x17]);
interface IActiveScriptParse64 : IUnknown
{
    HRESULT InitNew();
    HRESULT AddScriptlet(const(wchar)*, const(wchar)*, const(wchar)*, const(wchar)*, const(wchar)*, const(wchar)*, ulong, uint, uint, BSTR*, EXCEPINFO*);
    HRESULT ParseScriptText(const(wchar)*, const(wchar)*, IUnknown, const(wchar)*, ulong, uint, uint, VARIANT*, EXCEPINFO*);
}
enum IID_IActiveScriptParseProcedureOld32 = GUID(0x1cff0050, 0x6fdd, 0x11d0, [0x93, 0x28, 0x0, 0xa0, 0xc9, 0xd, 0xca, 0xa9]);
interface IActiveScriptParseProcedureOld32 : IUnknown
{
    HRESULT ParseProcedureText(const(wchar)*, const(wchar)*, const(wchar)*, IUnknown, const(wchar)*, uint, uint, uint, IDispatch*);
}
enum IID_IActiveScriptParseProcedureOld64 = GUID(0x21f57128, 0x8c9, 0x4638, [0xba, 0x12, 0x22, 0xd1, 0x5d, 0x88, 0xdc, 0x5c]);
interface IActiveScriptParseProcedureOld64 : IUnknown
{
    HRESULT ParseProcedureText(const(wchar)*, const(wchar)*, const(wchar)*, IUnknown, const(wchar)*, ulong, uint, uint, IDispatch*);
}
enum IID_IActiveScriptParseProcedure32 = GUID(0xaa5b6a80, 0xb834, 0x11d0, [0x93, 0x2f, 0x0, 0xa0, 0xc9, 0xd, 0xca, 0xa9]);
interface IActiveScriptParseProcedure32 : IUnknown
{
    HRESULT ParseProcedureText(const(wchar)*, const(wchar)*, const(wchar)*, const(wchar)*, IUnknown, const(wchar)*, uint, uint, uint, IDispatch*);
}
enum IID_IActiveScriptParseProcedure64 = GUID(0xc64713b6, 0xe029, 0x4cc5, [0x92, 0x0, 0x43, 0x8b, 0x72, 0x89, 0xb, 0x6a]);
interface IActiveScriptParseProcedure64 : IUnknown
{
    HRESULT ParseProcedureText(const(wchar)*, const(wchar)*, const(wchar)*, const(wchar)*, IUnknown, const(wchar)*, ulong, uint, uint, IDispatch*);
}
enum IID_IActiveScriptParseProcedure2_32 = GUID(0x71ee5b20, 0xfb04, 0x11d1, [0xb3, 0xa8, 0x0, 0xa0, 0xc9, 0x11, 0xe8, 0xb2]);
interface IActiveScriptParseProcedure2_32 : IActiveScriptParseProcedure32
{
}
enum IID_IActiveScriptParseProcedure2_64 = GUID(0xfe7c4271, 0x210c, 0x448d, [0x9f, 0x54, 0x76, 0xda, 0xb7, 0x4, 0x7b, 0x28]);
interface IActiveScriptParseProcedure2_64 : IActiveScriptParseProcedure64
{
}
enum IID_IActiveScriptEncode = GUID(0xbb1a2ae3, 0xa4f9, 0x11cf, [0x8f, 0x20, 0x0, 0x80, 0x5f, 0x2c, 0xd0, 0x64]);
interface IActiveScriptEncode : IUnknown
{
    HRESULT EncodeSection(const(wchar)*, uint, PWSTR, uint, uint*);
    HRESULT DecodeScript(const(wchar)*, uint, PWSTR, uint, uint*);
    HRESULT GetEncodeProgId(BSTR*);
}
enum IID_IActiveScriptHostEncode = GUID(0xbee9b76e, 0xcfe3, 0x11d1, [0xb7, 0x47, 0x0, 0xc0, 0x4f, 0xc2, 0xb0, 0x85]);
interface IActiveScriptHostEncode : IUnknown
{
    HRESULT EncodeScriptHostFile(BSTR, BSTR*, uint, BSTR);
}
enum IID_IBindEventHandler = GUID(0x63cdbcb0, 0xc1b1, 0x11d0, [0x93, 0x36, 0x0, 0xa0, 0xc9, 0xd, 0xca, 0xa9]);
interface IBindEventHandler : IUnknown
{
    HRESULT BindHandler(const(wchar)*, IDispatch);
}
enum IID_IActiveScriptStats = GUID(0xb8da6310, 0xe19b, 0x11d0, [0x93, 0x3c, 0x0, 0xa0, 0xc9, 0xd, 0xca, 0xa9]);
interface IActiveScriptStats : IUnknown
{
    HRESULT GetStat(uint, uint*, uint*);
    HRESULT GetStatEx(const(GUID)*, uint*, uint*);
    HRESULT ResetStats();
}
enum IID_IActiveScriptProperty = GUID(0x4954e0d0, 0xfbc7, 0x11d1, [0x84, 0x10, 0x0, 0x60, 0x8, 0xc3, 0xfb, 0xfc]);
interface IActiveScriptProperty : IUnknown
{
    HRESULT GetProperty(uint, VARIANT*, VARIANT*);
    HRESULT SetProperty(uint, VARIANT*, VARIANT*);
}
enum IID_ITridentEventSink = GUID(0x1dc9ca50, 0x6ef, 0x11d2, [0x84, 0x15, 0x0, 0x60, 0x8, 0xc3, 0xfb, 0xfc]);
interface ITridentEventSink : IUnknown
{
    HRESULT FireEvent(const(wchar)*, DISPPARAMS*, VARIANT*, EXCEPINFO*);
}
enum IID_IActiveScriptGarbageCollector = GUID(0x6aa2c4a0, 0x2b53, 0x11d4, [0xa2, 0xa0, 0x0, 0x10, 0x4b, 0xd3, 0x50, 0x90]);
interface IActiveScriptGarbageCollector : IUnknown
{
    HRESULT CollectGarbage(SCRIPTGCTYPE);
}
enum IID_IActiveScriptSIPInfo = GUID(0x764651d0, 0x38de, 0x11d4, [0xa2, 0xa3, 0x0, 0x10, 0x4b, 0xd3, 0x50, 0x90]);
interface IActiveScriptSIPInfo : IUnknown
{
    HRESULT GetSIPOID(GUID*);
}
enum IID_IActiveScriptSiteTraceInfo = GUID(0x4b7272ae, 0x1955, 0x4bfe, [0x98, 0xb0, 0x78, 0x6, 0x21, 0x88, 0x85, 0x69]);
interface IActiveScriptSiteTraceInfo : IUnknown
{
    HRESULT SendScriptTraceInfo(SCRIPTTRACEINFO, GUID, uint, int, int, ulong);
}
enum IID_IActiveScriptTraceInfo = GUID(0xc35456e7, 0xbebf, 0x4a1b, [0x86, 0xa9, 0x24, 0xd5, 0x6b, 0xe8, 0xb3, 0x69]);
interface IActiveScriptTraceInfo : IUnknown
{
    HRESULT StartScriptTracing(IActiveScriptSiteTraceInfo, GUID);
    HRESULT StopScriptTracing();
}
enum IID_IActiveScriptStringCompare = GUID(0x58562769, 0xed52, 0x42f7, [0x84, 0x3, 0x49, 0x63, 0x51, 0x4e, 0x1f, 0x11]);
interface IActiveScriptStringCompare : IUnknown
{
    HRESULT StrComp(BSTR, BSTR, int*);
}
alias BREAKPOINT_STATE = int;
enum : int
{
    BREAKPOINT_DELETED  = 0x00000000,
    BREAKPOINT_DISABLED = 0x00000001,
    BREAKPOINT_ENABLED  = 0x00000002,
}

alias BREAKREASON = int;
enum : int
{
    BREAKREASON_STEP                = 0x00000000,
    BREAKREASON_BREAKPOINT          = 0x00000001,
    BREAKREASON_DEBUGGER_BLOCK      = 0x00000002,
    BREAKREASON_HOST_INITIATED      = 0x00000003,
    BREAKREASON_LANGUAGE_INITIATED  = 0x00000004,
    BREAKREASON_DEBUGGER_HALT       = 0x00000005,
    BREAKREASON_ERROR               = 0x00000006,
    BREAKREASON_JIT                 = 0x00000007,
    BREAKREASON_MUTATION_BREAKPOINT = 0x00000008,
}

alias BREAKRESUMEACTION = int;
enum : int
{
    BREAKRESUMEACTION_ABORT         = 0x00000000,
    BREAKRESUMEACTION_CONTINUE      = 0x00000001,
    BREAKRESUMEACTION_STEP_INTO     = 0x00000002,
    BREAKRESUMEACTION_STEP_OVER     = 0x00000003,
    BREAKRESUMEACTION_STEP_OUT      = 0x00000004,
    BREAKRESUMEACTION_IGNORE        = 0x00000005,
    BREAKRESUMEACTION_STEP_DOCUMENT = 0x00000006,
}

alias ERRORRESUMEACTION = int;
enum : int
{
    ERRORRESUMEACTION_ReexecuteErrorStatement         = 0x00000000,
    ERRORRESUMEACTION_AbortCallAndReturnErrorToCaller = 0x00000001,
    ERRORRESUMEACTION_SkipErrorStatement              = 0x00000002,
}

alias DOCUMENTNAMETYPE = int;
enum : int
{
    DOCUMENTNAMETYPE_APPNODE        = 0x00000000,
    DOCUMENTNAMETYPE_TITLE          = 0x00000001,
    DOCUMENTNAMETYPE_FILE_TAIL      = 0x00000002,
    DOCUMENTNAMETYPE_URL            = 0x00000003,
    DOCUMENTNAMETYPE_UNIQUE_TITLE   = 0x00000004,
    DOCUMENTNAMETYPE_SOURCE_MAP_URL = 0x00000005,
}

enum IID_IActiveScriptDebug32 = GUID(0x51973c10, 0xcb0c, 0x11d0, [0xb5, 0xc9, 0x0, 0xa0, 0x24, 0x4a, 0xe, 0x7a]);
interface IActiveScriptDebug32 : IUnknown
{
    HRESULT GetScriptTextAttributes(const(wchar)*, uint, const(wchar)*, uint, ushort*);
    HRESULT GetScriptletTextAttributes(const(wchar)*, uint, const(wchar)*, uint, ushort*);
    HRESULT EnumCodeContextsOfPosition(uint, uint, uint, IEnumDebugCodeContexts*);
}
enum IID_IActiveScriptDebug64 = GUID(0xbc437e23, 0xf5b8, 0x47f4, [0xbb, 0x79, 0x7d, 0x1c, 0xe5, 0x48, 0x3b, 0x86]);
interface IActiveScriptDebug64 : IUnknown
{
    HRESULT GetScriptTextAttributes(const(wchar)*, uint, const(wchar)*, uint, ushort*);
    HRESULT GetScriptletTextAttributes(const(wchar)*, uint, const(wchar)*, uint, ushort*);
    HRESULT EnumCodeContextsOfPosition(ulong, uint, uint, IEnumDebugCodeContexts*);
}
enum IID_IActiveScriptSiteDebug32 = GUID(0x51973c11, 0xcb0c, 0x11d0, [0xb5, 0xc9, 0x0, 0xa0, 0x24, 0x4a, 0xe, 0x7a]);
interface IActiveScriptSiteDebug32 : IUnknown
{
    HRESULT GetDocumentContextFromPosition(uint, uint, uint, IDebugDocumentContext*);
    HRESULT GetApplication(IDebugApplication32*);
    HRESULT GetRootApplicationNode(IDebugApplicationNode*);
    HRESULT OnScriptErrorDebug(IActiveScriptErrorDebug, BOOL*, BOOL*);
}
enum IID_IActiveScriptSiteDebug64 = GUID(0xd6b96b0a, 0x7463, 0x402c, [0x92, 0xac, 0x89, 0x98, 0x42, 0x26, 0x94, 0x2f]);
interface IActiveScriptSiteDebug64 : IUnknown
{
    HRESULT GetDocumentContextFromPosition(ulong, uint, uint, IDebugDocumentContext*);
    HRESULT GetApplication(IDebugApplication64*);
    HRESULT GetRootApplicationNode(IDebugApplicationNode*);
    HRESULT OnScriptErrorDebug(IActiveScriptErrorDebug, BOOL*, BOOL*);
}
enum IID_IActiveScriptSiteDebugEx = GUID(0xbb722ccb, 0x6ad2, 0x41c6, [0xb7, 0x80, 0xaf, 0x9c, 0x3, 0xee, 0x69, 0xf5]);
interface IActiveScriptSiteDebugEx : IUnknown
{
    HRESULT OnCanNotJITScriptErrorDebug(IActiveScriptErrorDebug, BOOL*);
}
enum IID_IActiveScriptErrorDebug = GUID(0x51973c12, 0xcb0c, 0x11d0, [0xb5, 0xc9, 0x0, 0xa0, 0x24, 0x4a, 0xe, 0x7a]);
interface IActiveScriptErrorDebug : IActiveScriptError
{
    HRESULT GetDocumentContext(IDebugDocumentContext*);
    HRESULT GetStackFrame(IDebugStackFrame*);
}
enum IID_IDebugCodeContext = GUID(0x51973c13, 0xcb0c, 0x11d0, [0xb5, 0xc9, 0x0, 0xa0, 0x24, 0x4a, 0xe, 0x7a]);
interface IDebugCodeContext : IUnknown
{
    HRESULT GetDocumentContext(IDebugDocumentContext*);
    HRESULT SetBreakPoint(BREAKPOINT_STATE);
}
enum IID_IDebugExpression = GUID(0x51973c14, 0xcb0c, 0x11d0, [0xb5, 0xc9, 0x0, 0xa0, 0x24, 0x4a, 0xe, 0x7a]);
interface IDebugExpression : IUnknown
{
    HRESULT Start(IDebugExpressionCallBack);
    HRESULT Abort();
    HRESULT QueryIsComplete();
    HRESULT GetResultAsString(HRESULT*, BSTR*);
    HRESULT GetResultAsDebugProperty(HRESULT*, IDebugProperty*);
}
enum IID_IDebugExpressionContext = GUID(0x51973c15, 0xcb0c, 0x11d0, [0xb5, 0xc9, 0x0, 0xa0, 0x24, 0x4a, 0xe, 0x7a]);
interface IDebugExpressionContext : IUnknown
{
    HRESULT ParseLanguageText(const(wchar)*, uint, const(wchar)*, uint, IDebugExpression*);
    HRESULT GetLanguageInfo(BSTR*, GUID*);
}
enum IID_IDebugExpressionCallBack = GUID(0x51973c16, 0xcb0c, 0x11d0, [0xb5, 0xc9, 0x0, 0xa0, 0x24, 0x4a, 0xe, 0x7a]);
interface IDebugExpressionCallBack : IUnknown
{
    HRESULT onComplete();
}
enum IID_IDebugStackFrame = GUID(0x51973c17, 0xcb0c, 0x11d0, [0xb5, 0xc9, 0x0, 0xa0, 0x24, 0x4a, 0xe, 0x7a]);
interface IDebugStackFrame : IUnknown
{
    HRESULT GetCodeContext(IDebugCodeContext*);
    HRESULT GetDescriptionString(BOOL, BSTR*);
    HRESULT GetLanguageString(BOOL, BSTR*);
    HRESULT GetThread(IDebugApplicationThread*);
    HRESULT GetDebugProperty(IDebugProperty*);
}
enum IID_IDebugStackFrameSniffer = GUID(0x51973c18, 0xcb0c, 0x11d0, [0xb5, 0xc9, 0x0, 0xa0, 0x24, 0x4a, 0xe, 0x7a]);
interface IDebugStackFrameSniffer : IUnknown
{
    HRESULT EnumStackFrames(IEnumDebugStackFrames*);
}
enum IID_IDebugStackFrameSnifferEx32 = GUID(0x51973c19, 0xcb0c, 0x11d0, [0xb5, 0xc9, 0x0, 0xa0, 0x24, 0x4a, 0xe, 0x7a]);
interface IDebugStackFrameSnifferEx32 : IDebugStackFrameSniffer
{
    HRESULT EnumStackFramesEx32(uint, IEnumDebugStackFrames*);
}
enum IID_IDebugStackFrameSnifferEx64 = GUID(0x8cd12af4, 0x49c1, 0x4d52, [0x8d, 0x8a, 0xc1, 0x46, 0xf4, 0x75, 0x81, 0xaa]);
interface IDebugStackFrameSnifferEx64 : IDebugStackFrameSniffer
{
    HRESULT EnumStackFramesEx64(ulong, IEnumDebugStackFrames64*);
}
enum IID_IDebugSyncOperation = GUID(0x51973c1a, 0xcb0c, 0x11d0, [0xb5, 0xc9, 0x0, 0xa0, 0x24, 0x4a, 0xe, 0x7a]);
interface IDebugSyncOperation : IUnknown
{
    HRESULT GetTargetThread(IDebugApplicationThread*);
    HRESULT Execute(IUnknown*);
    HRESULT InProgressAbort();
}
enum IID_IDebugAsyncOperation = GUID(0x51973c1b, 0xcb0c, 0x11d0, [0xb5, 0xc9, 0x0, 0xa0, 0x24, 0x4a, 0xe, 0x7a]);
interface IDebugAsyncOperation : IUnknown
{
    HRESULT GetSyncDebugOperation(IDebugSyncOperation*);
    HRESULT Start(IDebugAsyncOperationCallBack);
    HRESULT Abort();
    HRESULT QueryIsComplete();
    HRESULT GetResult(HRESULT*, IUnknown*);
}
enum IID_IDebugAsyncOperationCallBack = GUID(0x51973c1c, 0xcb0c, 0x11d0, [0xb5, 0xc9, 0x0, 0xa0, 0x24, 0x4a, 0xe, 0x7a]);
interface IDebugAsyncOperationCallBack : IUnknown
{
    HRESULT onComplete();
}
enum IID_IEnumDebugCodeContexts = GUID(0x51973c1d, 0xcb0c, 0x11d0, [0xb5, 0xc9, 0x0, 0xa0, 0x24, 0x4a, 0xe, 0x7a]);
interface IEnumDebugCodeContexts : IUnknown
{
    HRESULT Next(uint, IDebugCodeContext*, uint*);
    HRESULT Skip(uint);
    HRESULT Reset();
    HRESULT Clone(IEnumDebugCodeContexts*);
}
struct DebugStackFrameDescriptor
{
    IDebugStackFrame pdsf;
    uint dwMin;
    uint dwLim;
    BOOL fFinal;
    IUnknown punkFinal;
}
struct DebugStackFrameDescriptor64
{
    IDebugStackFrame pdsf;
    ulong dwMin;
    ulong dwLim;
    BOOL fFinal;
    IUnknown punkFinal;
}
enum IID_IEnumDebugStackFrames = GUID(0x51973c1e, 0xcb0c, 0x11d0, [0xb5, 0xc9, 0x0, 0xa0, 0x24, 0x4a, 0xe, 0x7a]);
interface IEnumDebugStackFrames : IUnknown
{
    HRESULT Next(uint, DebugStackFrameDescriptor*, uint*);
    HRESULT Skip(uint);
    HRESULT Reset();
    HRESULT Clone(IEnumDebugStackFrames*);
}
enum IID_IEnumDebugStackFrames64 = GUID(0xdc38853, 0xc1b0, 0x4176, [0xa9, 0x84, 0xb2, 0x98, 0x36, 0x10, 0x27, 0xaf]);
interface IEnumDebugStackFrames64 : IEnumDebugStackFrames
{
    HRESULT Next64(uint, DebugStackFrameDescriptor64*, uint*);
}
enum IID_IDebugDocumentInfo = GUID(0x51973c1f, 0xcb0c, 0x11d0, [0xb5, 0xc9, 0x0, 0xa0, 0x24, 0x4a, 0xe, 0x7a]);
interface IDebugDocumentInfo : IUnknown
{
    HRESULT GetName(DOCUMENTNAMETYPE, BSTR*);
    HRESULT GetDocumentClassId(GUID*);
}
enum IID_IDebugDocumentProvider = GUID(0x51973c20, 0xcb0c, 0x11d0, [0xb5, 0xc9, 0x0, 0xa0, 0x24, 0x4a, 0xe, 0x7a]);
interface IDebugDocumentProvider : IDebugDocumentInfo
{
    HRESULT GetDocument(IDebugDocument*);
}
enum IID_IDebugDocument = GUID(0x51973c21, 0xcb0c, 0x11d0, [0xb5, 0xc9, 0x0, 0xa0, 0x24, 0x4a, 0xe, 0x7a]);
interface IDebugDocument : IDebugDocumentInfo
{
}
enum IID_IDebugDocumentText = GUID(0x51973c22, 0xcb0c, 0x11d0, [0xb5, 0xc9, 0x0, 0xa0, 0x24, 0x4a, 0xe, 0x7a]);
interface IDebugDocumentText : IDebugDocument
{
    HRESULT GetDocumentAttributes(uint*);
    HRESULT GetSize(uint*, uint*);
    HRESULT GetPositionOfLine(uint, uint*);
    HRESULT GetLineOfPosition(uint, uint*, uint*);
    HRESULT GetText(uint, PWSTR, ushort*, uint*, uint);
    HRESULT GetPositionOfContext(IDebugDocumentContext, uint*, uint*);
    HRESULT GetContextOfPosition(uint, uint, IDebugDocumentContext*);
}
enum IID_IDebugDocumentTextEvents = GUID(0x51973c23, 0xcb0c, 0x11d0, [0xb5, 0xc9, 0x0, 0xa0, 0x24, 0x4a, 0xe, 0x7a]);
interface IDebugDocumentTextEvents : IUnknown
{
    HRESULT onDestroy();
    HRESULT onInsertText(uint, uint);
    HRESULT onRemoveText(uint, uint);
    HRESULT onReplaceText(uint, uint);
    HRESULT onUpdateTextAttributes(uint, uint);
    HRESULT onUpdateDocumentAttributes(uint);
}
enum IID_IDebugDocumentTextAuthor = GUID(0x51973c24, 0xcb0c, 0x11d0, [0xb5, 0xc9, 0x0, 0xa0, 0x24, 0x4a, 0xe, 0x7a]);
interface IDebugDocumentTextAuthor : IDebugDocumentText
{
    HRESULT InsertText(uint, uint, PWSTR);
    HRESULT RemoveText(uint, uint);
    HRESULT ReplaceText(uint, uint, PWSTR);
}
enum IID_IDebugDocumentTextExternalAuthor = GUID(0x51973c25, 0xcb0c, 0x11d0, [0xb5, 0xc9, 0x0, 0xa0, 0x24, 0x4a, 0xe, 0x7a]);
interface IDebugDocumentTextExternalAuthor : IUnknown
{
    HRESULT GetPathName(BSTR*, BOOL*);
    HRESULT GetFileName(BSTR*);
    HRESULT NotifyChanged();
}
enum IID_IDebugDocumentHelper32 = GUID(0x51973c26, 0xcb0c, 0x11d0, [0xb5, 0xc9, 0x0, 0xa0, 0x24, 0x4a, 0xe, 0x7a]);
interface IDebugDocumentHelper32 : IUnknown
{
    HRESULT Init(IDebugApplication32, const(wchar)*, const(wchar)*, uint);
    HRESULT Attach(IDebugDocumentHelper32);
    HRESULT Detach();
    HRESULT AddUnicodeText(const(wchar)*);
    HRESULT AddDBCSText(const(char)*);
    HRESULT SetDebugDocumentHost(IDebugDocumentHost);
    HRESULT AddDeferredText(uint, uint);
    HRESULT DefineScriptBlock(uint, uint, IActiveScript, BOOL, uint*);
    HRESULT SetDefaultTextAttr(ushort);
    HRESULT SetTextAttributes(uint, uint, ushort*);
    HRESULT SetLongName(const(wchar)*);
    HRESULT SetShortName(const(wchar)*);
    HRESULT SetDocumentAttr(uint);
    HRESULT GetDebugApplicationNode(IDebugApplicationNode*);
    HRESULT GetScriptBlockInfo(uint, IActiveScript*, uint*, uint*);
    HRESULT CreateDebugDocumentContext(uint, uint, IDebugDocumentContext*);
    HRESULT BringDocumentToTop();
    HRESULT BringDocumentContextToTop(IDebugDocumentContext);
}
enum IID_IDebugDocumentHelper64 = GUID(0xc4c7363c, 0x20fd, 0x47f9, [0xbd, 0x82, 0x48, 0x55, 0xe0, 0x15, 0x8, 0x71]);
interface IDebugDocumentHelper64 : IUnknown
{
    HRESULT Init(IDebugApplication64, const(wchar)*, const(wchar)*, uint);
    HRESULT Attach(IDebugDocumentHelper64);
    HRESULT Detach();
    HRESULT AddUnicodeText(const(wchar)*);
    HRESULT AddDBCSText(const(char)*);
    HRESULT SetDebugDocumentHost(IDebugDocumentHost);
    HRESULT AddDeferredText(uint, uint);
    HRESULT DefineScriptBlock(uint, uint, IActiveScript, BOOL, ulong*);
    HRESULT SetDefaultTextAttr(ushort);
    HRESULT SetTextAttributes(uint, uint, ushort*);
    HRESULT SetLongName(const(wchar)*);
    HRESULT SetShortName(const(wchar)*);
    HRESULT SetDocumentAttr(uint);
    HRESULT GetDebugApplicationNode(IDebugApplicationNode*);
    HRESULT GetScriptBlockInfo(ulong, IActiveScript*, uint*, uint*);
    HRESULT CreateDebugDocumentContext(uint, uint, IDebugDocumentContext*);
    HRESULT BringDocumentToTop();
    HRESULT BringDocumentContextToTop(IDebugDocumentContext);
}
enum IID_IDebugDocumentHost = GUID(0x51973c27, 0xcb0c, 0x11d0, [0xb5, 0xc9, 0x0, 0xa0, 0x24, 0x4a, 0xe, 0x7a]);
interface IDebugDocumentHost : IUnknown
{
    HRESULT GetDeferredText(uint, PWSTR, ushort*, uint*, uint);
    HRESULT GetScriptTextAttributes(const(wchar)*, uint, const(wchar)*, uint, ushort*);
    HRESULT OnCreateDocumentContext(IUnknown*);
    HRESULT GetPathName(BSTR*, BOOL*);
    HRESULT GetFileName(BSTR*);
    HRESULT NotifyChanged();
}
enum IID_IDebugDocumentContext = GUID(0x51973c28, 0xcb0c, 0x11d0, [0xb5, 0xc9, 0x0, 0xa0, 0x24, 0x4a, 0xe, 0x7a]);
interface IDebugDocumentContext : IUnknown
{
    HRESULT GetDocument(IDebugDocument*);
    HRESULT EnumCodeContexts(IEnumDebugCodeContexts*);
}
enum IID_IDebugSessionProvider = GUID(0x51973c29, 0xcb0c, 0x11d0, [0xb5, 0xc9, 0x0, 0xa0, 0x24, 0x4a, 0xe, 0x7a]);
interface IDebugSessionProvider : IUnknown
{
    HRESULT StartDebugSession(IRemoteDebugApplication);
}
enum IID_IApplicationDebugger = GUID(0x51973c2a, 0xcb0c, 0x11d0, [0xb5, 0xc9, 0x0, 0xa0, 0x24, 0x4a, 0xe, 0x7a]);
interface IApplicationDebugger : IUnknown
{
    HRESULT QueryAlive();
    HRESULT CreateInstanceAtDebugger(const(GUID)*, IUnknown, uint, const(GUID)*, IUnknown*);
    HRESULT onDebugOutput(const(wchar)*);
    HRESULT onHandleBreakPoint(IRemoteDebugApplicationThread, BREAKREASON, IActiveScriptErrorDebug);
    HRESULT onClose();
    HRESULT onDebuggerEvent(const(GUID)*, IUnknown);
}
enum IID_IApplicationDebuggerUI = GUID(0x51973c2b, 0xcb0c, 0x11d0, [0xb5, 0xc9, 0x0, 0xa0, 0x24, 0x4a, 0xe, 0x7a]);
interface IApplicationDebuggerUI : IUnknown
{
    HRESULT BringDocumentToTop(IDebugDocumentText);
    HRESULT BringDocumentContextToTop(IDebugDocumentContext);
}
enum IID_IMachineDebugManager = GUID(0x51973c2c, 0xcb0c, 0x11d0, [0xb5, 0xc9, 0x0, 0xa0, 0x24, 0x4a, 0xe, 0x7a]);
interface IMachineDebugManager : IUnknown
{
    HRESULT AddApplication(IRemoteDebugApplication, uint*);
    HRESULT RemoveApplication(uint);
    HRESULT EnumApplications(IEnumRemoteDebugApplications*);
}
enum IID_IMachineDebugManagerCookie = GUID(0x51973c2d, 0xcb0c, 0x11d0, [0xb5, 0xc9, 0x0, 0xa0, 0x24, 0x4a, 0xe, 0x7a]);
interface IMachineDebugManagerCookie : IUnknown
{
    HRESULT AddApplication(IRemoteDebugApplication, uint, uint*);
    HRESULT RemoveApplication(uint, uint);
    HRESULT EnumApplications(IEnumRemoteDebugApplications*);
}
enum IID_IMachineDebugManagerEvents = GUID(0x51973c2e, 0xcb0c, 0x11d0, [0xb5, 0xc9, 0x0, 0xa0, 0x24, 0x4a, 0xe, 0x7a]);
interface IMachineDebugManagerEvents : IUnknown
{
    HRESULT onAddApplication(IRemoteDebugApplication, uint);
    HRESULT onRemoveApplication(IRemoteDebugApplication, uint);
}
enum IID_IProcessDebugManager32 = GUID(0x51973c2f, 0xcb0c, 0x11d0, [0xb5, 0xc9, 0x0, 0xa0, 0x24, 0x4a, 0xe, 0x7a]);
interface IProcessDebugManager32 : IUnknown
{
    HRESULT CreateApplication(IDebugApplication32*);
    HRESULT GetDefaultApplication(IDebugApplication32*);
    HRESULT AddApplication(IDebugApplication32, uint*);
    HRESULT RemoveApplication(uint);
    HRESULT CreateDebugDocumentHelper(IUnknown, IDebugDocumentHelper32*);
}
enum IID_IProcessDebugManager64 = GUID(0x56b9fc1c, 0x63a9, 0x4cc1, [0xac, 0x21, 0x8, 0x7d, 0x69, 0xa1, 0x7f, 0xab]);
interface IProcessDebugManager64 : IUnknown
{
    HRESULT CreateApplication(IDebugApplication64*);
    HRESULT GetDefaultApplication(IDebugApplication64*);
    HRESULT AddApplication(IDebugApplication64, uint*);
    HRESULT RemoveApplication(uint);
    HRESULT CreateDebugDocumentHelper(IUnknown, IDebugDocumentHelper64*);
}
enum IID_IRemoteDebugApplication = GUID(0x51973c30, 0xcb0c, 0x11d0, [0xb5, 0xc9, 0x0, 0xa0, 0x24, 0x4a, 0xe, 0x7a]);
interface IRemoteDebugApplication : IUnknown
{
    HRESULT ResumeFromBreakPoint(IRemoteDebugApplicationThread, BREAKRESUMEACTION, ERRORRESUMEACTION);
    HRESULT CauseBreak();
    HRESULT ConnectDebugger(IApplicationDebugger);
    HRESULT DisconnectDebugger();
    HRESULT GetDebugger(IApplicationDebugger*);
    HRESULT CreateInstanceAtApplication(const(GUID)*, IUnknown, uint, const(GUID)*, IUnknown*);
    HRESULT QueryAlive();
    HRESULT EnumThreads(IEnumRemoteDebugApplicationThreads*);
    HRESULT GetName(BSTR*);
    HRESULT GetRootNode(IDebugApplicationNode*);
    HRESULT EnumGlobalExpressionContexts(IEnumDebugExpressionContexts*);
}
enum IID_IDebugApplication32 = GUID(0x51973c32, 0xcb0c, 0x11d0, [0xb5, 0xc9, 0x0, 0xa0, 0x24, 0x4a, 0xe, 0x7a]);
interface IDebugApplication32 : IRemoteDebugApplication
{
    HRESULT SetName(const(wchar)*);
    HRESULT StepOutComplete();
    HRESULT DebugOutput(const(wchar)*);
    HRESULT StartDebugSession();
    HRESULT HandleBreakPoint(BREAKREASON, BREAKRESUMEACTION*);
    HRESULT Close();
    HRESULT GetBreakFlags(uint*, IRemoteDebugApplicationThread*);
    HRESULT GetCurrentThread(IDebugApplicationThread*);
    HRESULT CreateAsyncDebugOperation(IDebugSyncOperation, IDebugAsyncOperation*);
    HRESULT AddStackFrameSniffer(IDebugStackFrameSniffer, uint*);
    HRESULT RemoveStackFrameSniffer(uint);
    HRESULT QueryCurrentThreadIsDebuggerThread();
    HRESULT SynchronousCallInDebuggerThread(IDebugThreadCall32, uint, uint, uint);
    HRESULT CreateApplicationNode(IDebugApplicationNode*);
    HRESULT FireDebuggerEvent(const(GUID)*, IUnknown);
    HRESULT HandleRuntimeError(IActiveScriptErrorDebug, IActiveScriptSite, BREAKRESUMEACTION*, ERRORRESUMEACTION*, BOOL*);
    BOOL FCanJitDebug();
    BOOL FIsAutoJitDebugEnabled();
    HRESULT AddGlobalExpressionContextProvider(IProvideExpressionContexts, uint*);
    HRESULT RemoveGlobalExpressionContextProvider(uint);
}
enum IID_IDebugApplication64 = GUID(0x4dedc754, 0x4c7, 0x4f10, [0x9e, 0x60, 0x16, 0xa3, 0x90, 0xfe, 0x6e, 0x62]);
interface IDebugApplication64 : IRemoteDebugApplication
{
    HRESULT SetName(const(wchar)*);
    HRESULT StepOutComplete();
    HRESULT DebugOutput(const(wchar)*);
    HRESULT StartDebugSession();
    HRESULT HandleBreakPoint(BREAKREASON, BREAKRESUMEACTION*);
    HRESULT Close();
    HRESULT GetBreakFlags(uint*, IRemoteDebugApplicationThread*);
    HRESULT GetCurrentThread(IDebugApplicationThread*);
    HRESULT CreateAsyncDebugOperation(IDebugSyncOperation, IDebugAsyncOperation*);
    HRESULT AddStackFrameSniffer(IDebugStackFrameSniffer, uint*);
    HRESULT RemoveStackFrameSniffer(uint);
    HRESULT QueryCurrentThreadIsDebuggerThread();
    HRESULT SynchronousCallInDebuggerThread(IDebugThreadCall64, ulong, ulong, ulong);
    HRESULT CreateApplicationNode(IDebugApplicationNode*);
    HRESULT FireDebuggerEvent(const(GUID)*, IUnknown);
    HRESULT HandleRuntimeError(IActiveScriptErrorDebug, IActiveScriptSite, BREAKRESUMEACTION*, ERRORRESUMEACTION*, BOOL*);
    BOOL FCanJitDebug();
    BOOL FIsAutoJitDebugEnabled();
    HRESULT AddGlobalExpressionContextProvider(IProvideExpressionContexts, ulong*);
    HRESULT RemoveGlobalExpressionContextProvider(ulong);
}
enum IID_IRemoteDebugApplicationEvents = GUID(0x51973c33, 0xcb0c, 0x11d0, [0xb5, 0xc9, 0x0, 0xa0, 0x24, 0x4a, 0xe, 0x7a]);
interface IRemoteDebugApplicationEvents : IUnknown
{
    HRESULT OnConnectDebugger(IApplicationDebugger);
    HRESULT OnDisconnectDebugger();
    HRESULT OnSetName(const(wchar)*);
    HRESULT OnDebugOutput(const(wchar)*);
    HRESULT OnClose();
    HRESULT OnEnterBreakPoint(IRemoteDebugApplicationThread);
    HRESULT OnLeaveBreakPoint(IRemoteDebugApplicationThread);
    HRESULT OnCreateThread(IRemoteDebugApplicationThread);
    HRESULT OnDestroyThread(IRemoteDebugApplicationThread);
    HRESULT OnBreakFlagChange(uint, IRemoteDebugApplicationThread);
}
enum IID_IDebugApplicationNode = GUID(0x51973c34, 0xcb0c, 0x11d0, [0xb5, 0xc9, 0x0, 0xa0, 0x24, 0x4a, 0xe, 0x7a]);
interface IDebugApplicationNode : IDebugDocumentProvider
{
    HRESULT EnumChildren(IEnumDebugApplicationNodes*);
    HRESULT GetParent(IDebugApplicationNode*);
    HRESULT SetDocumentProvider(IDebugDocumentProvider);
    HRESULT Close();
    HRESULT Attach(IDebugApplicationNode);
    HRESULT Detach();
}
enum IID_IDebugApplicationNodeEvents = GUID(0x51973c35, 0xcb0c, 0x11d0, [0xb5, 0xc9, 0x0, 0xa0, 0x24, 0x4a, 0xe, 0x7a]);
interface IDebugApplicationNodeEvents : IUnknown
{
    HRESULT onAddChild(IDebugApplicationNode);
    HRESULT onRemoveChild(IDebugApplicationNode);
    HRESULT onDetach();
    HRESULT onAttach(IDebugApplicationNode);
}
enum IID_AsyncIDebugApplicationNodeEvents = GUID(0xa2e3aa3b, 0xaa8d, 0x4ebf, [0x84, 0xcd, 0x64, 0x8b, 0x73, 0x7b, 0x8c, 0x13]);
interface AsyncIDebugApplicationNodeEvents : IUnknown
{
    HRESULT Begin_onAddChild(IDebugApplicationNode);
    HRESULT Finish_onAddChild();
    HRESULT Begin_onRemoveChild(IDebugApplicationNode);
    HRESULT Finish_onRemoveChild();
    HRESULT Begin_onDetach();
    HRESULT Finish_onDetach();
    HRESULT Begin_onAttach(IDebugApplicationNode);
    HRESULT Finish_onAttach();
}
enum IID_IDebugThreadCall32 = GUID(0x51973c36, 0xcb0c, 0x11d0, [0xb5, 0xc9, 0x0, 0xa0, 0x24, 0x4a, 0xe, 0x7a]);
interface IDebugThreadCall32 : IUnknown
{
    HRESULT ThreadCallHandler(uint, uint, uint);
}
enum IID_IDebugThreadCall64 = GUID(0xcb3fa335, 0xe979, 0x42fd, [0x9f, 0xcf, 0xa7, 0x54, 0x6a, 0xf, 0x39, 0x5]);
interface IDebugThreadCall64 : IUnknown
{
    HRESULT ThreadCallHandler(ulong, ulong, ulong);
}
enum IID_IRemoteDebugApplicationThread = GUID(0x51973c37, 0xcb0c, 0x11d0, [0xb5, 0xc9, 0x0, 0xa0, 0x24, 0x4a, 0xe, 0x7a]);
interface IRemoteDebugApplicationThread : IUnknown
{
    HRESULT GetSystemThreadId(uint*);
    HRESULT GetApplication(IRemoteDebugApplication*);
    HRESULT EnumStackFrames(IEnumDebugStackFrames*);
    HRESULT GetDescription(BSTR*, BSTR*);
    HRESULT SetNextStatement(IDebugStackFrame, IDebugCodeContext);
    HRESULT GetState(uint*);
    HRESULT Suspend(uint*);
    HRESULT Resume(uint*);
    HRESULT GetSuspendCount(uint*);
}
enum IID_IDebugApplicationThread = GUID(0x51973c38, 0xcb0c, 0x11d0, [0xb5, 0xc9, 0x0, 0xa0, 0x24, 0x4a, 0xe, 0x7a]);
interface IDebugApplicationThread : IRemoteDebugApplicationThread
{
    HRESULT SynchronousCallIntoThread32(IDebugThreadCall32, uint, uint, uint);
    HRESULT QueryIsCurrentThread();
    HRESULT QueryIsDebuggerThread();
    HRESULT SetDescription(const(wchar)*);
    HRESULT SetStateString(const(wchar)*);
}
enum IID_IDebugApplicationThread64 = GUID(0x9dac5886, 0xdbad, 0x456d, [0x9d, 0xee, 0x5d, 0xec, 0x39, 0xab, 0x3d, 0xda]);
interface IDebugApplicationThread64 : IDebugApplicationThread
{
    HRESULT SynchronousCallIntoThread64(IDebugThreadCall64, ulong, ulong, ulong);
}
enum IID_IDebugCookie = GUID(0x51973c39, 0xcb0c, 0x11d0, [0xb5, 0xc9, 0x0, 0xa0, 0x24, 0x4a, 0xe, 0x7a]);
interface IDebugCookie : IUnknown
{
    HRESULT SetDebugCookie(uint);
}
enum IID_IEnumDebugApplicationNodes = GUID(0x51973c3a, 0xcb0c, 0x11d0, [0xb5, 0xc9, 0x0, 0xa0, 0x24, 0x4a, 0xe, 0x7a]);
interface IEnumDebugApplicationNodes : IUnknown
{
    HRESULT Next(uint, IDebugApplicationNode*, uint*);
    HRESULT Skip(uint);
    HRESULT Reset();
    HRESULT Clone(IEnumDebugApplicationNodes*);
}
enum IID_IEnumRemoteDebugApplications = GUID(0x51973c3b, 0xcb0c, 0x11d0, [0xb5, 0xc9, 0x0, 0xa0, 0x24, 0x4a, 0xe, 0x7a]);
interface IEnumRemoteDebugApplications : IUnknown
{
    HRESULT Next(uint, IRemoteDebugApplication*, uint*);
    HRESULT Skip(uint);
    HRESULT Reset();
    HRESULT Clone(IEnumRemoteDebugApplications*);
}
enum IID_IEnumRemoteDebugApplicationThreads = GUID(0x51973c3c, 0xcb0c, 0x11d0, [0xb5, 0xc9, 0x0, 0xa0, 0x24, 0x4a, 0xe, 0x7a]);
interface IEnumRemoteDebugApplicationThreads : IUnknown
{
    HRESULT Next(uint, IRemoteDebugApplicationThread*, uint*);
    HRESULT Skip(uint);
    HRESULT Reset();
    HRESULT Clone(IEnumRemoteDebugApplicationThreads*);
}
enum IID_IDebugFormatter = GUID(0x51973c05, 0xcb0c, 0x11d0, [0xb5, 0xc9, 0x0, 0xa0, 0x24, 0x4a, 0xe, 0x7a]);
interface IDebugFormatter : IUnknown
{
    HRESULT GetStringForVariant(VARIANT*, uint, BSTR*);
    HRESULT GetVariantForString(const(wchar)*, VARIANT*);
    HRESULT GetStringForVarType(VARENUM, TYPEDESC*, BSTR*);
}
enum IID_ISimpleConnectionPoint = GUID(0x51973c3e, 0xcb0c, 0x11d0, [0xb5, 0xc9, 0x0, 0xa0, 0x24, 0x4a, 0xe, 0x7a]);
interface ISimpleConnectionPoint : IUnknown
{
    HRESULT GetEventCount(uint*);
    HRESULT DescribeEvents(uint, uint, int*, BSTR*, uint*);
    HRESULT Advise(IDispatch, uint*);
    HRESULT Unadvise(uint);
}
enum IID_IDebugHelper = GUID(0x51973c3f, 0xcb0c, 0x11d0, [0xb5, 0xc9, 0x0, 0xa0, 0x24, 0x4a, 0xe, 0x7a]);
interface IDebugHelper : IUnknown
{
    HRESULT CreatePropertyBrowser(VARIANT*, const(wchar)*, IDebugApplicationThread, IDebugProperty*);
    HRESULT CreatePropertyBrowserEx(VARIANT*, const(wchar)*, IDebugApplicationThread, IDebugFormatter, IDebugProperty*);
    HRESULT CreateSimpleConnectionPoint(IDispatch, ISimpleConnectionPoint*);
}
enum IID_IEnumDebugExpressionContexts = GUID(0x51973c40, 0xcb0c, 0x11d0, [0xb5, 0xc9, 0x0, 0xa0, 0x24, 0x4a, 0xe, 0x7a]);
interface IEnumDebugExpressionContexts : IUnknown
{
    HRESULT Next(uint, IDebugExpressionContext*, uint*);
    HRESULT Skip(uint);
    HRESULT Reset();
    HRESULT Clone(IEnumDebugExpressionContexts*);
}
enum IID_IProvideExpressionContexts = GUID(0x51973c41, 0xcb0c, 0x11d0, [0xb5, 0xc9, 0x0, 0xa0, 0x24, 0x4a, 0xe, 0x7a]);
interface IProvideExpressionContexts : IUnknown
{
    HRESULT EnumExpressionContexts(IEnumDebugExpressionContexts*);
}
enum CLSID_ProcessDebugManager = GUID(0x78a51822, 0x51f4, 0x11d0, [0x8f, 0x20, 0x0, 0x80, 0x5f, 0x2c, 0xd0, 0x64]);
struct ProcessDebugManager
{
}
enum CLSID_DebugHelper = GUID(0xbfcc060, 0x8c1d, 0x11d0, [0xac, 0xcd, 0x0, 0xaa, 0x0, 0x60, 0x27, 0x5c]);
struct DebugHelper
{
}
enum CLSID_CDebugDocumentHelper = GUID(0x83b8bca6, 0x687c, 0x11d0, [0xa4, 0x5, 0x0, 0xaa, 0x0, 0x60, 0x27, 0x5c]);
struct CDebugDocumentHelper
{
}
enum CLSID_MachineDebugManager_RETAIL = GUID(0xc0a3666, 0x30c9, 0x11d0, [0x8f, 0x20, 0x0, 0x80, 0x5f, 0x2c, 0xd0, 0x64]);
struct MachineDebugManager_RETAIL
{
}
enum CLSID_MachineDebugManager_DEBUG = GUID(0x49769cec, 0x3a55, 0x4bb0, [0xb6, 0x97, 0x88, 0xfe, 0xde, 0x77, 0xe8, 0xea]);
struct MachineDebugManager_DEBUG
{
}
enum CLSID_DefaultDebugSessionProvider = GUID(0x834128a2, 0x51f4, 0x11d0, [0x8f, 0x20, 0x0, 0x80, 0x5f, 0x2c, 0xd0, 0x64]);
struct DefaultDebugSessionProvider
{
}
alias PROFILER_SCRIPT_TYPE = int;
enum : int
{
    PROFILER_SCRIPT_TYPE_USER    = 0x00000000,
    PROFILER_SCRIPT_TYPE_DYNAMIC = 0x00000001,
    PROFILER_SCRIPT_TYPE_NATIVE  = 0x00000002,
    PROFILER_SCRIPT_TYPE_DOM     = 0x00000003,
}

alias PROFILER_EVENT_MASK = int;
enum : int
{
    PROFILER_EVENT_MASK_TRACE_SCRIPT_FUNCTION_CALL = 0x00000001,
    PROFILER_EVENT_MASK_TRACE_NATIVE_FUNCTION_CALL = 0x00000002,
    PROFILER_EVENT_MASK_TRACE_DOM_FUNCTION_CALL    = 0x00000004,
    PROFILER_EVENT_MASK_TRACE_ALL                  = 0x00000003,
    PROFILER_EVENT_MASK_TRACE_ALL_WITH_DOM         = 0x00000007,
}

enum IID_IActiveScriptProfilerControl = GUID(0x784b5ff0, 0x69b0, 0x47d1, [0xa7, 0xdc, 0x25, 0x18, 0xf4, 0x23, 0xe, 0x90]);
interface IActiveScriptProfilerControl : IUnknown
{
    HRESULT StartProfiling(const(GUID)*, uint, uint);
    HRESULT SetProfilerEventMask(uint);
    HRESULT StopProfiling(HRESULT);
}
enum IID_IActiveScriptProfilerControl2 = GUID(0x47810165, 0x498f, 0x40be, [0x94, 0xf1, 0x65, 0x35, 0x57, 0xe9, 0xe7, 0xda]);
interface IActiveScriptProfilerControl2 : IActiveScriptProfilerControl
{
    HRESULT CompleteProfilerStart();
    HRESULT PrepareProfilerStop();
}
alias PROFILER_HEAP_OBJECT_FLAGS = int;
enum : int
{
    PROFILER_HEAP_OBJECT_FLAGS_NEW_OBJECT            = 0x00000001,
    PROFILER_HEAP_OBJECT_FLAGS_IS_ROOT               = 0x00000002,
    PROFILER_HEAP_OBJECT_FLAGS_SITE_CLOSED           = 0x00000004,
    PROFILER_HEAP_OBJECT_FLAGS_EXTERNAL              = 0x00000008,
    PROFILER_HEAP_OBJECT_FLAGS_EXTERNAL_UNKNOWN      = 0x00000010,
    PROFILER_HEAP_OBJECT_FLAGS_EXTERNAL_DISPATCH     = 0x00000020,
    PROFILER_HEAP_OBJECT_FLAGS_SIZE_APPROXIMATE      = 0x00000040,
    PROFILER_HEAP_OBJECT_FLAGS_SIZE_UNAVAILABLE      = 0x00000080,
    PROFILER_HEAP_OBJECT_FLAGS_NEW_STATE_UNAVAILABLE = 0x00000100,
    PROFILER_HEAP_OBJECT_FLAGS_WINRT_INSTANCE        = 0x00000200,
    PROFILER_HEAP_OBJECT_FLAGS_WINRT_RUNTIMECLASS    = 0x00000400,
    PROFILER_HEAP_OBJECT_FLAGS_WINRT_DELEGATE        = 0x00000800,
    PROFILER_HEAP_OBJECT_FLAGS_WINRT_NAMESPACE       = 0x00001000,
}

alias PROFILER_HEAP_OBJECT_OPTIONAL_INFO_TYPE = int;
enum : int
{
    PROFILER_HEAP_OBJECT_OPTIONAL_INFO_PROTOTYPE                  = 0x00000001,
    PROFILER_HEAP_OBJECT_OPTIONAL_INFO_FUNCTION_NAME              = 0x00000002,
    PROFILER_HEAP_OBJECT_OPTIONAL_INFO_SCOPE_LIST                 = 0x00000003,
    PROFILER_HEAP_OBJECT_OPTIONAL_INFO_INTERNAL_PROPERTY          = 0x00000004,
    PROFILER_HEAP_OBJECT_OPTIONAL_INFO_NAME_PROPERTIES            = 0x00000005,
    PROFILER_HEAP_OBJECT_OPTIONAL_INFO_INDEX_PROPERTIES           = 0x00000006,
    PROFILER_HEAP_OBJECT_OPTIONAL_INFO_ELEMENT_ATTRIBUTES_SIZE    = 0x00000007,
    PROFILER_HEAP_OBJECT_OPTIONAL_INFO_ELEMENT_TEXT_CHILDREN_SIZE = 0x00000008,
    PROFILER_HEAP_OBJECT_OPTIONAL_INFO_RELATIONSHIPS              = 0x00000009,
    PROFILER_HEAP_OBJECT_OPTIONAL_INFO_WINRTEVENTS                = 0x0000000a,
    PROFILER_HEAP_OBJECT_OPTIONAL_INFO_WEAKMAP_COLLECTION_LIST    = 0x0000000b,
    PROFILER_HEAP_OBJECT_OPTIONAL_INFO_MAP_COLLECTION_LIST        = 0x0000000c,
    PROFILER_HEAP_OBJECT_OPTIONAL_INFO_SET_COLLECTION_LIST        = 0x0000000d,
    PROFILER_HEAP_OBJECT_OPTIONAL_INFO_MAX_VALUE                  = 0x0000000d,
}

alias PROFILER_HEAP_OBJECT_RELATIONSHIP_FLAGS = int;
enum : int
{
    PROFILER_HEAP_OBJECT_RELATIONSHIP_FLAGS_NONE            = 0x00000000,
    PROFILER_HEAP_OBJECT_RELATIONSHIP_FLAGS_IS_GET_ACCESSOR = 0x00010000,
    PROFILER_HEAP_OBJECT_RELATIONSHIP_FLAGS_IS_SET_ACCESSOR = 0x00020000,
    PROFILER_HEAP_OBJECT_RELATIONSHIP_FLAGS_LET_VARIABLE    = 0x00040000,
    PROFILER_HEAP_OBJECT_RELATIONSHIP_FLAGS_CONST_VARIABLE  = 0x00080000,
}

alias PROFILER_HEAP_ENUM_FLAGS = int;
enum : int
{
    PROFILER_HEAP_ENUM_FLAGS_NONE                     = 0x00000000,
    PROFILER_HEAP_ENUM_FLAGS_STORE_RELATIONSHIP_FLAGS = 0x00000001,
    PROFILER_HEAP_ENUM_FLAGS_SUBSTRINGS               = 0x00000002,
    PROFILER_HEAP_ENUM_FLAGS_RELATIONSHIP_SUBSTRINGS  = 0x00000003,
}

struct PROFILER_HEAP_OBJECT_SCOPE_LIST
{
    uint count;
    ulong[1] scopes;
}
alias PROFILER_RELATIONSHIP_INFO = int;
enum : int
{
    PROFILER_PROPERTY_TYPE_NUMBER          = 0x00000001,
    PROFILER_PROPERTY_TYPE_STRING          = 0x00000002,
    PROFILER_PROPERTY_TYPE_HEAP_OBJECT     = 0x00000003,
    PROFILER_PROPERTY_TYPE_EXTERNAL_OBJECT = 0x00000004,
    PROFILER_PROPERTY_TYPE_BSTR            = 0x00000005,
    PROFILER_PROPERTY_TYPE_SUBSTRING       = 0x00000006,
}

struct PROFILER_PROPERTY_TYPE_SUBSTRING_INFO
{
    uint length;
    const(wchar)* value;
}
struct PROFILER_HEAP_OBJECT_RELATIONSHIP
{
    uint relationshipId;
    PROFILER_RELATIONSHIP_INFO relationshipInfo;
    union
    {
        double numberValue;
        const(wchar)* stringValue;
        BSTR bstrValue;
        ulong objectId;
        void* externalObjectAddress;
        PROFILER_PROPERTY_TYPE_SUBSTRING_INFO* subString;
    }
}
struct PROFILER_HEAP_OBJECT_RELATIONSHIP_LIST
{
    uint count;
    PROFILER_HEAP_OBJECT_RELATIONSHIP[1] elements;
}
struct PROFILER_HEAP_OBJECT_OPTIONAL_INFO
{
    PROFILER_HEAP_OBJECT_OPTIONAL_INFO_TYPE infoType;
    union
    {
        ulong prototype;
        const(wchar)* functionName;
        uint elementAttributesSize;
        uint elementTextChildrenSize;
        PROFILER_HEAP_OBJECT_SCOPE_LIST* scopeList;
        PROFILER_HEAP_OBJECT_RELATIONSHIP* internalProperty;
        PROFILER_HEAP_OBJECT_RELATIONSHIP_LIST* namePropertyList;
        PROFILER_HEAP_OBJECT_RELATIONSHIP_LIST* indexPropertyList;
        PROFILER_HEAP_OBJECT_RELATIONSHIP_LIST* relationshipList;
        PROFILER_HEAP_OBJECT_RELATIONSHIP_LIST* eventList;
        PROFILER_HEAP_OBJECT_RELATIONSHIP_LIST* weakMapCollectionList;
        PROFILER_HEAP_OBJECT_RELATIONSHIP_LIST* mapCollectionList;
        PROFILER_HEAP_OBJECT_RELATIONSHIP_LIST* setCollectionList;
    }
}
struct PROFILER_HEAP_OBJECT
{
    uint size;
    union
    {
        ulong objectId;
        void* externalObjectAddress;
    }
    uint typeNameId;
    uint flags;
    ushort unused;
    ushort optionalInfoCount;
}
enum IID_IActiveScriptProfilerHeapEnum = GUID(0x32e4694e, 0xd37, 0x419b, [0xb9, 0x3d, 0xfa, 0x20, 0xde, 0xd6, 0xe8, 0xea]);
interface IActiveScriptProfilerHeapEnum : IUnknown
{
    HRESULT Next(uint, PROFILER_HEAP_OBJECT**, uint*);
    HRESULT GetOptionalInfo(PROFILER_HEAP_OBJECT*, uint, PROFILER_HEAP_OBJECT_OPTIONAL_INFO*);
    HRESULT FreeObjectAndOptionalInfo(uint, PROFILER_HEAP_OBJECT**);
    HRESULT GetNameIdMap(const(wchar)****, uint*);
}
enum IID_IActiveScriptProfilerControl3 = GUID(0xb403015, 0xf381, 0x4023, [0xa5, 0xd0, 0x6f, 0xed, 0x7, 0x6d, 0xe7, 0x16]);
interface IActiveScriptProfilerControl3 : IActiveScriptProfilerControl2
{
    HRESULT EnumHeap(IActiveScriptProfilerHeapEnum*);
}
alias PROFILER_HEAP_SUMMARY_VERSION = int;
enum : int
{
    PROFILER_HEAP_SUMMARY_VERSION_1 = 0x00000001,
}

struct PROFILER_HEAP_SUMMARY
{
    PROFILER_HEAP_SUMMARY_VERSION version_;
    uint totalHeapSize;
}
enum IID_IActiveScriptProfilerControl4 = GUID(0x160f94fd, 0x9dbc, 0x40d4, [0x9e, 0xac, 0x2b, 0x71, 0xdb, 0x31, 0x32, 0xf4]);
interface IActiveScriptProfilerControl4 : IActiveScriptProfilerControl3
{
    HRESULT SummarizeHeap(PROFILER_HEAP_SUMMARY*);
}
enum IID_IActiveScriptProfilerControl5 = GUID(0x1c01a2d1, 0x8f0f, 0x46a5, [0x97, 0x20, 0xd, 0x7e, 0xd2, 0xc6, 0x2f, 0xa]);
interface IActiveScriptProfilerControl5 : IActiveScriptProfilerControl4
{
    HRESULT EnumHeap2(PROFILER_HEAP_ENUM_FLAGS, IActiveScriptProfilerHeapEnum*);
}
enum IID_IActiveScriptProfilerCallback = GUID(0x740eca23, 0x7d9d, 0x42e5, [0xba, 0x9d, 0xf8, 0xb2, 0x4b, 0x1c, 0x7a, 0x9b]);
interface IActiveScriptProfilerCallback : IUnknown
{
    HRESULT Initialize(uint);
    HRESULT Shutdown(HRESULT);
    HRESULT ScriptCompiled(int, PROFILER_SCRIPT_TYPE, IUnknown);
    HRESULT FunctionCompiled(int, int, const(wchar)*, const(wchar)*, IUnknown);
    HRESULT OnFunctionEnter(int, int);
    HRESULT OnFunctionExit(int, int);
}
enum IID_IActiveScriptProfilerCallback2 = GUID(0x31b7f8ad, 0xa637, 0x409c, [0xb2, 0x2f, 0x4, 0x9, 0x95, 0xb6, 0x10, 0x3d]);
interface IActiveScriptProfilerCallback2 : IActiveScriptProfilerCallback
{
    HRESULT OnFunctionEnterByName(const(wchar)*, PROFILER_SCRIPT_TYPE);
    HRESULT OnFunctionExitByName(const(wchar)*, PROFILER_SCRIPT_TYPE);
}
enum IID_IActiveScriptProfilerCallback3 = GUID(0x6ac5ad25, 0x2037, 0x4687, [0x91, 0xdf, 0xb5, 0x99, 0x79, 0xd9, 0x3d, 0x73]);
interface IActiveScriptProfilerCallback3 : IActiveScriptProfilerCallback2
{
    HRESULT SetWebWorkerId(uint);
}
enum IID_IScriptNode = GUID(0xaee2a94, 0xbcbb, 0x11d0, [0x8c, 0x72, 0x0, 0xc0, 0x4f, 0xc2, 0xb0, 0x85]);
interface IScriptNode : IUnknown
{
    HRESULT Alive();
    HRESULT Delete();
    HRESULT GetParent(IScriptNode*);
    HRESULT GetIndexInParent(uint*);
    HRESULT GetCookie(uint*);
    HRESULT GetNumberOfChildren(uint*);
    HRESULT GetChild(uint, IScriptNode*);
    HRESULT GetLanguage(BSTR*);
    HRESULT CreateChildEntry(uint, uint, const(wchar)*, IScriptEntry*);
    HRESULT CreateChildHandler(const(wchar)*, PWSTR*, uint, const(wchar)*, const(wchar)*, ITypeInfo, uint, uint, uint, IScriptEntry*);
}
enum IID_IScriptEntry = GUID(0xaee2a95, 0xbcbb, 0x11d0, [0x8c, 0x72, 0x0, 0xc0, 0x4f, 0xc2, 0xb0, 0x85]);
interface IScriptEntry : IScriptNode
{
    HRESULT GetText(BSTR*);
    HRESULT SetText(const(wchar)*);
    HRESULT GetBody(BSTR*);
    HRESULT SetBody(const(wchar)*);
    HRESULT GetName(BSTR*);
    HRESULT SetName(const(wchar)*);
    HRESULT GetItemName(BSTR*);
    HRESULT SetItemName(const(wchar)*);
    HRESULT GetSignature(ITypeInfo*, uint*);
    HRESULT SetSignature(ITypeInfo, uint);
    HRESULT GetRange(uint*, uint*);
}
enum IID_IScriptScriptlet = GUID(0xaee2a96, 0xbcbb, 0x11d0, [0x8c, 0x72, 0x0, 0xc0, 0x4f, 0xc2, 0xb0, 0x85]);
interface IScriptScriptlet : IScriptEntry
{
    HRESULT GetSubItemName(BSTR*);
    HRESULT SetSubItemName(const(wchar)*);
    HRESULT GetEventName(BSTR*);
    HRESULT SetEventName(const(wchar)*);
    HRESULT GetSimpleEventName(BSTR*);
    HRESULT SetSimpleEventName(const(wchar)*);
}
enum IID_IActiveScriptAuthor = GUID(0x9c109da0, 0x7006, 0x11d1, [0xb3, 0x6c, 0x0, 0xa0, 0xc9, 0x11, 0xe8, 0xb2]);
interface IActiveScriptAuthor : IUnknown
{
    HRESULT AddNamedItem(const(wchar)*, uint, IDispatch);
    HRESULT AddScriptlet(const(wchar)*, const(wchar)*, const(wchar)*, const(wchar)*, const(wchar)*, const(wchar)*, uint, uint);
    HRESULT ParseScriptText(const(wchar)*, const(wchar)*, const(wchar)*, uint, uint);
    HRESULT GetScriptTextAttributes(const(wchar)*, uint, const(wchar)*, uint, ushort*);
    HRESULT GetScriptletTextAttributes(const(wchar)*, uint, const(wchar)*, uint, ushort*);
    HRESULT GetRoot(IScriptNode*);
    HRESULT GetLanguageFlags(uint*);
    HRESULT GetEventHandler(IDispatch, const(wchar)*, const(wchar)*, const(wchar)*, IScriptEntry*);
    HRESULT RemoveNamedItem(const(wchar)*);
    HRESULT AddTypeLib(const(GUID)*, uint, uint, uint);
    HRESULT RemoveTypeLib(const(GUID)*, uint, uint);
    HRESULT GetChars(uint, BSTR*);
    HRESULT GetInfoFromContext(const(wchar)*, uint, uint, uint, uint*, uint*, uint*, int*, int*, IUnknown*);
    HRESULT IsCommitChar(wchar, BOOL*);
}
enum IID_IActiveScriptAuthorProcedure = GUID(0x7e2d4b70, 0xbd9a, 0x11d0, [0x93, 0x36, 0x0, 0xa0, 0xc9, 0xd, 0xca, 0xa9]);
interface IActiveScriptAuthorProcedure : IUnknown
{
    HRESULT ParseProcedureText(const(wchar)*, const(wchar)*, const(wchar)*, const(wchar)*, const(wchar)*, uint, uint, IDispatch);
}
alias APPLICATION_NODE_EVENT_FILTER = int;
enum : int
{
    FILTER_EXCLUDE_NOTHING        = 0x00000000,
    FILTER_EXCLUDE_ANONYMOUS_CODE = 0x00000001,
    FILTER_EXCLUDE_EVAL_CODE      = 0x00000002,
}

struct TEXT_DOCUMENT_ARRAY
{
    uint dwCount;
    IDebugDocumentText* Members;
}
enum IID_IDebugApplicationNode100 = GUID(0x90a7734e, 0x841b, 0x4f77, [0x93, 0x84, 0xa2, 0x89, 0x1e, 0x76, 0xe7, 0xe2]);
interface IDebugApplicationNode100 : IUnknown
{
    HRESULT SetFilterForEventSink(uint, APPLICATION_NODE_EVENT_FILTER);
    HRESULT GetExcludedDocuments(APPLICATION_NODE_EVENT_FILTER, TEXT_DOCUMENT_ARRAY*);
    HRESULT QueryIsChildNode(IDebugDocument);
}
enum IID_IWebAppDiagnosticsSetup = GUID(0x379bfbe1, 0xc6c9, 0x432a, [0x93, 0xe1, 0x6d, 0x17, 0x65, 0x6c, 0x53, 0x8c]);
interface IWebAppDiagnosticsSetup : IUnknown
{
    HRESULT DiagnosticsSupported(VARIANT_BOOL*);
    HRESULT CreateObjectWithSiteAtWebApp(const(GUID)*, uint, const(GUID)*, ulong);
}
alias SCRIPT_DEBUGGER_OPTIONS = int;
enum : int
{
    SDO_NONE                           = 0x00000000,
    SDO_ENABLE_FIRST_CHANCE_EXCEPTIONS = 0x00000001,
    SDO_ENABLE_WEB_WORKER_SUPPORT      = 0x00000002,
    SDO_ENABLE_NONUSER_CODE_SUPPORT    = 0x00000004,
    SDO_ENABLE_LIBRARY_STACK_FRAME     = 0x00000008,
}

enum IID_IRemoteDebugApplication110 = GUID(0xd5fe005b, 0x2836, 0x485e, [0xb1, 0xf9, 0x89, 0xd9, 0x1a, 0xa2, 0x4f, 0xd4]);
interface IRemoteDebugApplication110 : IUnknown
{
    HRESULT SetDebuggerOptions(SCRIPT_DEBUGGER_OPTIONS, SCRIPT_DEBUGGER_OPTIONS);
    HRESULT GetCurrentDebuggerOptions(SCRIPT_DEBUGGER_OPTIONS*);
    HRESULT GetMainThread(IRemoteDebugApplicationThread*);
}
enum IID_IDebugApplication11032 = GUID(0xbdb3b5de, 0x89f2, 0x4e11, [0x84, 0xa5, 0x97, 0x44, 0x5f, 0x94, 0x1c, 0x7d]);
interface IDebugApplication11032 : IRemoteDebugApplication110
{
    HRESULT SynchronousCallInMainThread(IDebugThreadCall32, ulong, ulong, ulong);
    HRESULT AsynchronousCallInMainThread(IDebugThreadCall32, ulong, ulong, ulong);
    HRESULT CallableWaitForHandles(uint, const(HANDLE)*, uint*);
}
enum IID_IDebugApplication11064 = GUID(0x2039d958, 0x4eeb, 0x496a, [0x87, 0xbb, 0x2e, 0x52, 0x1, 0xea, 0xde, 0xef]);
interface IDebugApplication11064 : IRemoteDebugApplication110
{
    HRESULT SynchronousCallInMainThread(IDebugThreadCall64, ulong, ulong, ulong);
    HRESULT AsynchronousCallInMainThread(IDebugThreadCall64, ulong, ulong, ulong);
    HRESULT CallableWaitForHandles(uint, const(HANDLE)*, uint*);
}
enum IID_IWebAppDiagnosticsObjectInitialization = GUID(0x16ff3a42, 0xa5f5, 0x432b, [0xb6, 0x25, 0x8e, 0x8e, 0x16, 0xf5, 0x7e, 0x15]);
interface IWebAppDiagnosticsObjectInitialization : IUnknown
{
    HRESULT Initialize(HANDLE_PTR, IUnknown);
}
enum IID_IActiveScriptWinRTErrorDebug = GUID(0x73a3f82a, 0xfe9, 0x4b33, [0xba, 0x3b, 0xfe, 0x9, 0x5f, 0x69, 0x7e, 0xa]);
interface IActiveScriptWinRTErrorDebug : IActiveScriptError
{
    HRESULT GetRestrictedErrorString(BSTR*);
    HRESULT GetRestrictedErrorReference(BSTR*);
    HRESULT GetCapabilitySid(BSTR*);
}
alias SCRIPT_ERROR_DEBUG_EXCEPTION_THROWN_KIND = int;
enum : int
{
    ETK_FIRST_CHANCE   = 0x00000000,
    ETK_USER_UNHANDLED = 0x00000001,
    ETK_UNHANDLED      = 0x00000002,
}

enum IID_IActiveScriptErrorDebug110 = GUID(0x516e42b6, 0x89a8, 0x4530, [0x93, 0x7b, 0x5f, 0x7, 0x8, 0x43, 0x14, 0x42]);
interface IActiveScriptErrorDebug110 : IUnknown
{
    HRESULT GetExceptionThrownKind(SCRIPT_ERROR_DEBUG_EXCEPTION_THROWN_KIND*);
}
enum IID_IDebugApplicationThreadEvents110 = GUID(0x84e5e468, 0xd5da, 0x48a8, [0x83, 0xf4, 0x40, 0x36, 0x64, 0x29, 0x0, 0x7b]);
interface IDebugApplicationThreadEvents110 : IUnknown
{
    HRESULT OnSuspendForBreakPoint();
    HRESULT OnResumeFromBreakPoint();
    HRESULT OnThreadRequestComplete();
    HRESULT OnBeginThreadRequest();
}
enum IID_IDebugApplicationThread11032 = GUID(0x2194ac5c, 0x6561, 0x404a, [0xa2, 0xe9, 0xf5, 0x7d, 0x72, 0xde, 0x37, 0x2]);
interface IDebugApplicationThread11032 : IUnknown
{
    HRESULT GetActiveThreadRequestCount(uint*);
    HRESULT IsSuspendedForBreakPoint(BOOL*);
    HRESULT IsThreadCallable(BOOL*);
    HRESULT AsynchronousCallIntoThread(IDebugThreadCall32, ulong, ulong, ulong);
}
enum IID_IDebugApplicationThread11064 = GUID(0x420aa4cc, 0xefd8, 0x4dac, [0x98, 0x3b, 0x47, 0x12, 0x78, 0x26, 0x91, 0x7d]);
interface IDebugApplicationThread11064 : IUnknown
{
    HRESULT GetActiveThreadRequestCount(uint*);
    HRESULT IsSuspendedForBreakPoint(BOOL*);
    HRESULT IsThreadCallable(BOOL*);
    HRESULT AsynchronousCallIntoThread(IDebugThreadCall64, ulong, ulong, ulong);
}
enum IID_IRemoteDebugCriticalErrorEvent110 = GUID(0x2f69c611, 0x6b14, 0x47e8, [0x92, 0x60, 0x4b, 0xb7, 0xc5, 0x2f, 0x50, 0x4b]);
interface IRemoteDebugCriticalErrorEvent110 : IUnknown
{
    HRESULT GetErrorInfo(BSTR*, int*, BSTR*, IDebugDocumentContext*);
}
alias SCRIPT_INVOCATION_CONTEXT_TYPE = int;
enum : int
{
    SICT_Event                      = 0x00000000,
    SICT_SetTimeout                 = 0x00000001,
    SICT_SetInterval                = 0x00000002,
    SICT_SetImmediate               = 0x00000003,
    SICT_RequestAnimationFrame      = 0x00000004,
    SICT_ToString                   = 0x00000005,
    SICT_MutationObserverCheckpoint = 0x00000006,
    SICT_WWAExecUnsafeLocalFunction = 0x00000007,
    SICT_WWAExecAtPriority          = 0x00000008,
}

enum IID_IScriptInvocationContext = GUID(0x5d7741b7, 0xaf7e, 0x4a2a, [0x85, 0xe5, 0xc7, 0x7f, 0x4d, 0x6, 0x59, 0xfb]);
interface IScriptInvocationContext : IUnknown
{
    HRESULT GetContextType(SCRIPT_INVOCATION_CONTEXT_TYPE*);
    HRESULT GetContextDescription(BSTR*);
    HRESULT GetContextObject(IUnknown*);
}
alias DEBUG_STACKFRAME_TYPE = int;
enum : int
{
    DST_SCRIPT_FRAME     = 0x00000000,
    DST_INTERNAL_FRAME   = 0x00000001,
    DST_INVOCATION_FRAME = 0x00000002,
}

enum IID_IDebugStackFrame110 = GUID(0x4b509611, 0xb6ea, 0x4b24, [0xad, 0xcb, 0xd0, 0xcc, 0xfd, 0x1a, 0x7e, 0x33]);
interface IDebugStackFrame110 : IDebugStackFrame
{
    HRESULT GetStackFrameType(DEBUG_STACKFRAME_TYPE*);
    HRESULT GetScriptInvocationContext(IScriptInvocationContext*);
}
alias DEBUG_EVENT_INFO_TYPE = int;
enum : int
{
    DEIT_GENERAL            = 0x00000000,
    DEIT_ASMJS_IN_DEBUGGING = 0x00000001,
    DEIT_ASMJS_SUCCEEDED    = 0x00000002,
    DEIT_ASMJS_FAILED       = 0x00000003,
}

enum IID_IRemoteDebugInfoEvent110 = GUID(0x9ff56bb6, 0xeb89, 0x4c0f, [0x88, 0x23, 0xcc, 0x2a, 0x4c, 0xb, 0x7f, 0x26]);
interface IRemoteDebugInfoEvent110 : IUnknown
{
    HRESULT GetEventInfo(DEBUG_EVENT_INFO_TYPE*, BSTR*, BSTR*, IDebugDocumentContext*);
}
enum IID_IJsDebug = GUID(0xbe0e89da, 0x2ac5, 0x4c04, [0xac, 0x5e, 0x59, 0x95, 0x6a, 0xae, 0x36, 0x13]);
interface IJsDebug : IUnknown
{
    HRESULT OpenVirtualProcess(uint, ulong, IJsDebugDataTarget, IJsDebugProcess*);
}
enum IID_IJsDebugProcess = GUID(0x3d587168, 0x6a2d, 0x4041, [0xbd, 0x3b, 0xd, 0xe6, 0x74, 0x50, 0x28, 0x62]);
interface IJsDebugProcess : IUnknown
{
    HRESULT CreateStackWalker(uint, IJsDebugStackWalker*);
    HRESULT CreateBreakPoint(ulong, uint, uint, BOOL, IJsDebugBreakPoint*);
    HRESULT PerformAsyncBreak(uint);
    HRESULT GetExternalStepAddress(ulong*);
}
enum IID_IJsDebugStackWalker = GUID(0xdb24b094, 0x73c4, 0x456c, [0xa4, 0xec, 0xe9, 0xe, 0xa0, 0xb, 0xdf, 0xe3]);
interface IJsDebugStackWalker : IUnknown
{
    HRESULT GetNext(IJsDebugFrame*);
}
enum IID_IJsDebugFrame = GUID(0xc9196637, 0xab9d, 0x44b2, [0xba, 0xd2, 0x13, 0xb9, 0x5b, 0x3f, 0x39, 0xe]);
interface IJsDebugFrame : IUnknown
{
    HRESULT GetStackRange(ulong*, ulong*);
    HRESULT GetName(BSTR*);
    HRESULT GetDocumentPositionWithId(ulong*, uint*, uint*);
    HRESULT GetDocumentPositionWithName(BSTR*, uint*, uint*);
    HRESULT GetDebugProperty(IJsDebugProperty*);
    HRESULT GetReturnAddress(ulong*);
    HRESULT Evaluate(const(wchar)*, IJsDebugProperty*, BSTR*);
}
alias JS_PROPERTY_MEMBERS = int;
enum : int
{
    JS_PROPERTY_MEMBERS_ALL       = 0x00000000,
    JS_PROPERTY_MEMBERS_ARGUMENTS = 0x00000001,
}

alias JS_PROPERTY_ATTRIBUTES = int;
enum : int
{
    JS_PROPERTY_ATTRIBUTE_NONE       = 0x00000000,
    JS_PROPERTY_HAS_CHILDREN         = 0x00000001,
    JS_PROPERTY_FAKE                 = 0x00000002,
    JS_PROPERTY_METHOD               = 0x00000004,
    JS_PROPERTY_READONLY             = 0x00000008,
    JS_PROPERTY_NATIVE_WINRT_POINTER = 0x00000010,
    JS_PROPERTY_FRAME_INTRYBLOCK     = 0x00000020,
    JS_PROPERTY_FRAME_INCATCHBLOCK   = 0x00000040,
    JS_PROPERTY_FRAME_INFINALLYBLOCK = 0x00000080,
}

struct JsDebugPropertyInfo
{
    BSTR name;
    BSTR type;
    BSTR value;
    BSTR fullName;
    JS_PROPERTY_ATTRIBUTES attr;
}
enum IID_IJsDebugProperty = GUID(0xf8ffcf2b, 0x3aa4, 0x4320, [0x85, 0xc3, 0x52, 0xa3, 0x12, 0xba, 0x96, 0x33]);
interface IJsDebugProperty : IUnknown
{
    HRESULT GetPropertyInfo(uint, JsDebugPropertyInfo*);
    HRESULT GetMembers(JS_PROPERTY_MEMBERS, IJsEnumDebugProperty*);
}
enum IID_IJsEnumDebugProperty = GUID(0x4092432f, 0x2f0f, 0x4fe1, [0xb6, 0x38, 0x5b, 0x74, 0xa5, 0x2c, 0xdc, 0xbe]);
interface IJsEnumDebugProperty : IUnknown
{
    HRESULT Next(uint, IJsDebugProperty*, uint*);
    HRESULT GetCount(uint*);
}
enum IID_IJsDebugBreakPoint = GUID(0xdf6773e3, 0xed8d, 0x488b, [0x8a, 0x3e, 0x58, 0x12, 0x57, 0x7d, 0x15, 0x42]);
interface IJsDebugBreakPoint : IUnknown
{
    HRESULT IsEnabled(BOOL*);
    HRESULT Enable();
    HRESULT Disable();
    HRESULT Delete();
    HRESULT GetDocumentPosition(ulong*, uint*, uint*);
}
struct JS_NATIVE_FRAME
{
    ulong InstructionOffset;
    ulong ReturnOffset;
    ulong FrameOffset;
    ulong StackOffset;
}
enum IID_IEnumJsStackFrames = GUID(0x5e7da34b, 0xfb51, 0x4791, [0xab, 0xe7, 0xcb, 0x5b, 0xdf, 0x41, 0x97, 0x55]);
interface IEnumJsStackFrames : IUnknown
{
    HRESULT Next(uint, JS_NATIVE_FRAME*, uint*);
    HRESULT Reset();
}
alias JsDebugReadMemoryFlags = int;
enum : int
{
    None                    = 0x00000000,
    JsDebugAllowPartialRead = 0x00000001,
}

enum IID_IJsDebugDataTarget = GUID(0x53b28977, 0x53a1, 0x48e5, [0x90, 0x0, 0x5d, 0xd, 0xfa, 0x89, 0x39, 0x31]);
interface IJsDebugDataTarget : IUnknown
{
    HRESULT ReadMemory(ulong, JsDebugReadMemoryFlags, ubyte*, uint, uint*);
    HRESULT WriteMemory(ulong, ubyte*, uint);
    HRESULT AllocateVirtualMemory(ulong, uint, uint, uint, ulong*);
    HRESULT FreeVirtualMemory(ulong, uint, uint);
    HRESULT GetTlsValue(uint, uint, ulong*);
    HRESULT ReadBSTR(ulong, BSTR*);
    HRESULT ReadNullTerminatedString(ulong, ushort, uint, BSTR*);
    HRESULT CreateStackFrameEnumerator(uint, IEnumJsStackFrames*);
    HRESULT GetThreadContext(uint, uint, uint, void*);
}
