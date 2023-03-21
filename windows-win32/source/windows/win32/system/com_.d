module windows.win32.system.com_;

import windows.win32.guid : GUID;
import windows.win32.foundation : BOOL, BSTR, CHAR, DECIMAL, FILETIME, HANDLE, HGLOBAL, HINSTANCE, HRESULT, HWND, PSTR, PWSTR, VARIANT_BOOL;
import windows.win32.graphics.gdi : HBITMAP, HENHMETAFILE;
import windows.win32.security_ : PSECURITY_DESCRIPTOR, SECURITY_ATTRIBUTES;
import windows.win32.system.com.structuredstorage : IStorage;
import windows.win32.system.ole : ARRAYDESC, IRecordInfo, PARAMDESC;
import windows.win32.system.systemservices : userHBITMAP, userHGLOBAL, userHPALETTE;

version (Windows):
extern (Windows):

uint CoBuildVersion();
HRESULT CoInitialize(void*);
HRESULT CoRegisterMallocSpy(IMallocSpy);
HRESULT CoRevokeMallocSpy();
HRESULT CoRegisterInitializeSpy(IInitializeSpy, ulong*);
HRESULT CoRevokeInitializeSpy(ulong);
HRESULT CoGetSystemSecurityPermissions(COMSD, PSECURITY_DESCRIPTOR*);
HINSTANCE CoLoadLibrary(PWSTR, BOOL);
void CoFreeLibrary(HINSTANCE);
void CoFreeAllLibraries();
HRESULT CoAllowSetForegroundWindow(IUnknown, void*);
HRESULT DcomChannelSetHResult(void*, uint*, HRESULT);
BOOL CoIsOle1Class(const(GUID)*);
HRESULT CLSIDFromProgIDEx(const(wchar)*, GUID*);
BOOL CoFileTimeToDosDateTime(FILETIME*, ushort*, ushort*);
BOOL CoDosDateTimeToFileTime(ushort, ushort, FILETIME*);
HRESULT CoFileTimeNow(FILETIME*);
HRESULT CoRegisterChannelHook(const(GUID)*, IChannelHook);
HRESULT CoTreatAsClass(const(GUID)*, const(GUID)*);
HRESULT CreateDataAdviseHolder(IDataAdviseHolder*);
HRESULT CreateDataCache(IUnknown, const(GUID)*, const(GUID)*, void**);
HRESULT CoInstall(IBindCtx, uint, uCLSSPEC*, QUERYCONTEXT*, PWSTR);
HRESULT BindMoniker(IMoniker, uint, const(GUID)*, void**);
HRESULT CoGetObject(const(wchar)*, BIND_OPTS*, const(GUID)*, void**);
HRESULT MkParseDisplayName(IBindCtx, const(wchar)*, uint*, IMoniker*);
HRESULT MonikerRelativePathTo(IMoniker, IMoniker, IMoniker*, BOOL);
HRESULT MonikerCommonPrefixWith(IMoniker, IMoniker, IMoniker*);
HRESULT CreateBindCtx(uint, IBindCtx*);
HRESULT CreateGenericComposite(IMoniker, IMoniker, IMoniker*);
HRESULT GetClassFile(const(wchar)*, GUID*);
HRESULT CreateClassMoniker(const(GUID)*, IMoniker*);
HRESULT CreateFileMoniker(const(wchar)*, IMoniker*);
HRESULT CreateItemMoniker(const(wchar)*, const(wchar)*, IMoniker*);
HRESULT CreateAntiMoniker(IMoniker*);
HRESULT CreatePointerMoniker(IUnknown, IMoniker*);
HRESULT CreateObjrefMoniker(IUnknown, IMoniker*);
HRESULT GetRunningObjectTable(uint, IRunningObjectTable*);
HRESULT CreateStdProgressIndicator(HWND, const(wchar)*, IBindStatusCallback, IBindStatusCallback*);
HRESULT CoGetMalloc(uint, IMalloc*);
void CoUninitialize();
uint CoGetCurrentProcess();
HRESULT CoInitializeEx(void*, COINIT);
HRESULT CoGetCallerTID(uint*);
HRESULT CoGetCurrentLogicalThreadId(GUID*);
HRESULT CoGetContextToken(ulong*);
HRESULT CoGetApartmentType(APTTYPE*, APTTYPEQUALIFIER*);
HRESULT CoIncrementMTAUsage(CO_MTA_USAGE_COOKIE*);
HRESULT CoDecrementMTAUsage(CO_MTA_USAGE_COOKIE);
HRESULT CoAllowUnmarshalerCLSID(const(GUID)*);
HRESULT CoGetObjectContext(const(GUID)*, void**);
HRESULT CoGetClassObject(const(GUID)*, CLSCTX, void*, const(GUID)*, void**);
HRESULT CoRegisterClassObject(const(GUID)*, IUnknown, CLSCTX, REGCLS, uint*);
HRESULT CoRevokeClassObject(uint);
HRESULT CoResumeClassObjects();
HRESULT CoSuspendClassObjects();
uint CoAddRefServerProcess();
uint CoReleaseServerProcess();
HRESULT CoGetPSClsid(const(GUID)*, GUID*);
HRESULT CoRegisterPSClsid(const(GUID)*, const(GUID)*);
HRESULT CoRegisterSurrogate(ISurrogate);
HRESULT CoDisconnectObject(IUnknown, uint);
HRESULT CoLockObjectExternal(IUnknown, BOOL, BOOL);
BOOL CoIsHandlerConnected(IUnknown);
HRESULT CoCreateFreeThreadedMarshaler(IUnknown, IUnknown*);
void CoFreeUnusedLibraries();
void CoFreeUnusedLibrariesEx(uint, uint);
HRESULT CoDisconnectContext(uint);
HRESULT CoInitializeSecurity(PSECURITY_DESCRIPTOR, int, SOLE_AUTHENTICATION_SERVICE*, void*, RPC_C_AUTHN_LEVEL, RPC_C_IMP_LEVEL, void*, EOLE_AUTHENTICATION_CAPABILITIES, void*);
HRESULT CoGetCallContext(const(GUID)*, void**);
HRESULT CoQueryProxyBlanket(IUnknown, uint*, uint*, PWSTR*, uint*, uint*, void**, uint*);
HRESULT CoSetProxyBlanket(IUnknown, uint, uint, PWSTR, RPC_C_AUTHN_LEVEL, RPC_C_IMP_LEVEL, void*, EOLE_AUTHENTICATION_CAPABILITIES);
HRESULT CoCopyProxy(IUnknown, IUnknown*);
HRESULT CoQueryClientBlanket(uint*, uint*, PWSTR*, uint*, uint*, void**, uint*);
HRESULT CoImpersonateClient();
HRESULT CoRevertToSelf();
HRESULT CoQueryAuthenticationServices(uint*, SOLE_AUTHENTICATION_SERVICE**);
HRESULT CoSwitchCallContext(IUnknown, IUnknown*);
HRESULT CoCreateInstance(const(GUID)*, IUnknown, CLSCTX, const(GUID)*, void**);
HRESULT CoCreateInstanceEx(const(GUID)*, IUnknown, CLSCTX, COSERVERINFO*, uint, MULTI_QI*);
HRESULT CoCreateInstanceFromApp(const(GUID)*, IUnknown, CLSCTX, void*, uint, MULTI_QI*);
HRESULT CoRegisterActivationFilter(IActivationFilter);
HRESULT CoGetCancelObject(uint, const(GUID)*, void**);
HRESULT CoSetCancelObject(IUnknown);
HRESULT CoCancelCall(uint, uint);
HRESULT CoTestCancel();
HRESULT CoEnableCallCancellation(void*);
HRESULT CoDisableCallCancellation(void*);
HRESULT StringFromCLSID(const(GUID)*, PWSTR*);
HRESULT CLSIDFromString(const(wchar)*, GUID*);
HRESULT StringFromIID(const(GUID)*, PWSTR*);
HRESULT IIDFromString(const(wchar)*, GUID*);
HRESULT ProgIDFromCLSID(const(GUID)*, PWSTR*);
HRESULT CLSIDFromProgID(const(wchar)*, GUID*);
int StringFromGUID2(const(GUID)*, PWSTR, int);
HRESULT CoCreateGuid(GUID*);
HRESULT CoWaitForMultipleHandles(uint, uint, uint, HANDLE*, uint*);
HRESULT CoWaitForMultipleObjects(uint, uint, uint, const(HANDLE)*, uint*);
HRESULT CoGetTreatAsClass(const(GUID)*, GUID*);
HRESULT CoInvalidateRemoteMachineBindings(PWSTR);
void* CoTaskMemAlloc(ulong);
void* CoTaskMemRealloc(void*, ulong);
void CoTaskMemFree(void*);
HRESULT CoRegisterDeviceCatalog(const(wchar)*, CO_DEVICE_CATALOG_COOKIE*);
HRESULT CoRevokeDeviceCatalog(CO_DEVICE_CATALOG_COOKIE);
HRESULT CreateUri(const(wchar)*, URI_CREATE_FLAGS, ulong, IUri*);
HRESULT CreateUriWithFragment(const(wchar)*, const(wchar)*, uint, ulong, IUri*);
HRESULT CreateUriFromMultiByteString(const(char)*, uint, uint, uint, ulong, IUri*);
HRESULT CreateIUriBuilder(IUri, uint, ulong, IUriBuilder*);
HRESULT SetErrorInfo(uint, IErrorInfo);
HRESULT GetErrorInfo(uint, IErrorInfo*);
enum COLE_DEFAULT_PRINCIPAL = 0xffffffffffffffff;
enum COLE_DEFAULT_AUTHINFO = 0xffffffffffffffff;
enum MARSHALINTERFACE_MIN = 0x000001f4;
enum ASYNC_MODE_COMPATIBILITY = 0x00000001;
enum ASYNC_MODE_DEFAULT = 0x00000000;
enum STGTY_REPEAT = 0x00000100;
enum STG_TOEND = 0xffffffffffffffff;
enum STG_LAYOUT_SEQUENTIAL = 0x00000000;
enum STG_LAYOUT_INTERLEAVED = 0x00000001;
enum COM_RIGHTS_EXECUTE = 0x00000001;
enum COM_RIGHTS_EXECUTE_LOCAL = 0x00000002;
enum COM_RIGHTS_EXECUTE_REMOTE = 0x00000004;
enum COM_RIGHTS_ACTIVATE_LOCAL = 0x00000008;
enum COM_RIGHTS_ACTIVATE_REMOTE = 0x00000010;
enum COM_RIGHTS_RESERVED1 = 0x00000020;
enum COM_RIGHTS_RESERVED2 = 0x00000040;
enum CWMO_MAX_HANDLES = 0x00000038;
enum ROTREGFLAGS_ALLOWANYCLIENT = 0x00000001;
enum APPIDREGFLAGS_ACTIVATE_IUSERVER_INDESKTOP = 0x00000001;
enum APPIDREGFLAGS_SECURE_SERVER_PROCESS_SD_AND_BIND = 0x00000002;
enum APPIDREGFLAGS_ISSUE_ACTIVATION_RPC_AT_IDENTIFY = 0x00000004;
enum APPIDREGFLAGS_IUSERVER_UNMODIFIED_LOGON_TOKEN = 0x00000008;
enum APPIDREGFLAGS_IUSERVER_SELF_SID_IN_LAUNCH_PERMISSION = 0x00000010;
enum APPIDREGFLAGS_IUSERVER_ACTIVATE_IN_CLIENT_SESSION_ONLY = 0x00000020;
enum APPIDREGFLAGS_RESERVED1 = 0x00000040;
enum APPIDREGFLAGS_RESERVED2 = 0x00000080;
enum APPIDREGFLAGS_RESERVED3 = 0x00000100;
enum APPIDREGFLAGS_RESERVED4 = 0x00000200;
enum APPIDREGFLAGS_RESERVED5 = 0x00000400;
enum APPIDREGFLAGS_AAA_NO_IMPLICIT_ACTIVATE_AS_IU = 0x00000800;
enum APPIDREGFLAGS_RESERVED7 = 0x00001000;
enum APPIDREGFLAGS_RESERVED8 = 0x00002000;
enum APPIDREGFLAGS_RESERVED9 = 0x00004000;
enum DCOMSCM_ACTIVATION_USE_ALL_AUTHNSERVICES = 0x00000001;
enum DCOMSCM_ACTIVATION_DISALLOW_UNSECURE_CALL = 0x00000002;
enum DCOMSCM_RESOLVE_USE_ALL_AUTHNSERVICES = 0x00000004;
enum DCOMSCM_RESOLVE_DISALLOW_UNSECURE_CALL = 0x00000008;
enum DCOMSCM_PING_USE_MID_AUTHNSERVICE = 0x00000010;
enum DCOMSCM_PING_DISALLOW_UNSECURE_CALL = 0x00000020;
enum MAXLSN = 0x7fffffffffffffff;
enum DMUS_ERRBASE = 0x00001000;
alias LPEXCEPFINO_DEFERRED_FILLIN = HRESULT function(EXCEPINFO*);
alias URI_CREATE_FLAGS = uint;
enum : uint
{
    Uri_CREATE_ALLOW_RELATIVE                 = 0x00000001,
    Uri_CREATE_ALLOW_IMPLICIT_WILDCARD_SCHEME = 0x00000002,
    Uri_CREATE_ALLOW_IMPLICIT_FILE_SCHEME     = 0x00000004,
    Uri_CREATE_NOFRAG                         = 0x00000008,
    Uri_CREATE_NO_CANONICALIZE                = 0x00000010,
    Uri_CREATE_CANONICALIZE                   = 0x00000100,
    Uri_CREATE_FILE_USE_DOS_PATH              = 0x00000020,
    Uri_CREATE_DECODE_EXTRA_INFO              = 0x00000040,
    Uri_CREATE_NO_DECODE_EXTRA_INFO           = 0x00000080,
    Uri_CREATE_CRACK_UNKNOWN_SCHEMES          = 0x00000200,
    Uri_CREATE_NO_CRACK_UNKNOWN_SCHEMES       = 0x00000400,
    Uri_CREATE_PRE_PROCESS_HTML_URI           = 0x00000800,
    Uri_CREATE_NO_PRE_PROCESS_HTML_URI        = 0x00001000,
    Uri_CREATE_IE_SETTINGS                    = 0x00002000,
    Uri_CREATE_NO_IE_SETTINGS                 = 0x00004000,
    Uri_CREATE_NO_ENCODE_FORBIDDEN_CHARACTERS = 0x00008000,
    Uri_CREATE_NORMALIZE_INTL_CHARACTERS      = 0x00010000,
    Uri_CREATE_CANONICALIZE_ABSOLUTE          = 0x00020000,
}

alias RPC_C_AUTHN_LEVEL = uint;
enum : uint
{
    RPC_C_AUTHN_LEVEL_DEFAULT       = 0x00000000,
    RPC_C_AUTHN_LEVEL_NONE          = 0x00000001,
    RPC_C_AUTHN_LEVEL_CONNECT       = 0x00000002,
    RPC_C_AUTHN_LEVEL_CALL          = 0x00000003,
    RPC_C_AUTHN_LEVEL_PKT           = 0x00000004,
    RPC_C_AUTHN_LEVEL_PKT_INTEGRITY = 0x00000005,
    RPC_C_AUTHN_LEVEL_PKT_PRIVACY   = 0x00000006,
}

alias RPC_C_IMP_LEVEL = uint;
enum : uint
{
    RPC_C_IMP_LEVEL_DEFAULT     = 0x00000000,
    RPC_C_IMP_LEVEL_ANONYMOUS   = 0x00000001,
    RPC_C_IMP_LEVEL_IDENTIFY    = 0x00000002,
    RPC_C_IMP_LEVEL_IMPERSONATE = 0x00000003,
    RPC_C_IMP_LEVEL_DELEGATE    = 0x00000004,
}

alias ROT_FLAGS = uint;
enum : uint
{
    ROTFLAGS_REGISTRATIONKEEPSALIVE = 0x00000001,
    ROTFLAGS_ALLOWANYCLIENT         = 0x00000002,
}

alias ADVANCED_FEATURE_FLAGS = ushort;
enum : ushort
{
    FADF_AUTO        = 0x0001,
    FADF_STATIC      = 0x0002,
    FADF_EMBEDDED    = 0x0004,
    FADF_FIXEDSIZE   = 0x0010,
    FADF_RECORD      = 0x0020,
    FADF_HAVEIID     = 0x0040,
    FADF_HAVEVARTYPE = 0x0080,
    FADF_BSTR        = 0x0100,
    FADF_UNKNOWN     = 0x0200,
    FADF_DISPATCH    = 0x0400,
    FADF_VARIANT     = 0x0800,
    FADF_RESERVED    = 0xf008,
}

alias IMPLTYPEFLAGS = int;
enum : int
{
    IMPLTYPEFLAG_FDEFAULT       = 0x00000001,
    IMPLTYPEFLAG_FSOURCE        = 0x00000002,
    IMPLTYPEFLAG_FRESTRICTED    = 0x00000004,
    IMPLTYPEFLAG_FDEFAULTVTABLE = 0x00000008,
}

alias IDLFLAGS = ushort;
enum : ushort
{
    IDLFLAG_NONE    = 0x0000,
    IDLFLAG_FIN     = 0x0001,
    IDLFLAG_FOUT    = 0x0002,
    IDLFLAG_FLCID   = 0x0004,
    IDLFLAG_FRETVAL = 0x0008,
}

alias DISPATCH_FLAGS = ushort;
enum : ushort
{
    DISPATCH_METHOD         = 0x0001,
    DISPATCH_PROPERTYGET    = 0x0002,
    DISPATCH_PROPERTYPUT    = 0x0004,
    DISPATCH_PROPERTYPUTREF = 0x0008,
}

alias STGM = uint;
enum : uint
{
    STGM_DIRECT           = 0x00000000,
    STGM_TRANSACTED       = 0x00010000,
    STGM_SIMPLE           = 0x08000000,
    STGM_READ             = 0x00000000,
    STGM_WRITE            = 0x00000001,
    STGM_READWRITE        = 0x00000002,
    STGM_SHARE_DENY_NONE  = 0x00000040,
    STGM_SHARE_DENY_READ  = 0x00000030,
    STGM_SHARE_DENY_WRITE = 0x00000020,
    STGM_SHARE_EXCLUSIVE  = 0x00000010,
    STGM_PRIORITY         = 0x00040000,
    STGM_DELETEONRELEASE  = 0x04000000,
    STGM_NOSCRATCH        = 0x00100000,
    STGM_CREATE           = 0x00001000,
    STGM_CONVERT          = 0x00020000,
    STGM_FAILIFTHERE      = 0x00000000,
    STGM_NOSNAPSHOT       = 0x00200000,
    STGM_DIRECT_SWMR      = 0x00400000,
}

alias DVASPECT = uint;
enum : uint
{
    DVASPECT_CONTENT     = 0x00000001,
    DVASPECT_THUMBNAIL   = 0x00000002,
    DVASPECT_ICON        = 0x00000004,
    DVASPECT_DOCPRINT    = 0x00000008,
    DVASPECT_OPAQUE      = 0x00000010,
    DVASPECT_TRANSPARENT = 0x00000020,
}

alias CO_MTA_USAGE_COOKIE = long;
alias CO_DEVICE_CATALOG_COOKIE = long;
alias STGC = int;
enum : int
{
    STGC_DEFAULT                            = 0x00000000,
    STGC_OVERWRITE                          = 0x00000001,
    STGC_ONLYIFCURRENT                      = 0x00000002,
    STGC_DANGEROUSLYCOMMITMERELYTODISKCACHE = 0x00000004,
    STGC_CONSOLIDATE                        = 0x00000008,
}

alias STATFLAG = int;
enum : int
{
    STATFLAG_DEFAULT = 0x00000000,
    STATFLAG_NONAME  = 0x00000001,
    STATFLAG_NOOPEN  = 0x00000002,
}

union CY
{
    struct
    {
        uint Lo;
        int Hi;
    }
    long int64;
}
alias VARENUM = ushort;
enum : ushort
{
    VT_EMPTY            = 0x0000,
    VT_NULL             = 0x0001,
    VT_I2               = 0x0002,
    VT_I4               = 0x0003,
    VT_R4               = 0x0004,
    VT_R8               = 0x0005,
    VT_CY               = 0x0006,
    VT_DATE             = 0x0007,
    VT_BSTR             = 0x0008,
    VT_DISPATCH         = 0x0009,
    VT_ERROR            = 0x000a,
    VT_BOOL             = 0x000b,
    VT_VARIANT          = 0x000c,
    VT_UNKNOWN          = 0x000d,
    VT_DECIMAL          = 0x000e,
    VT_I1               = 0x0010,
    VT_UI1              = 0x0011,
    VT_UI2              = 0x0012,
    VT_UI4              = 0x0013,
    VT_I8               = 0x0014,
    VT_UI8              = 0x0015,
    VT_INT              = 0x0016,
    VT_UINT             = 0x0017,
    VT_VOID             = 0x0018,
    VT_HRESULT          = 0x0019,
    VT_PTR              = 0x001a,
    VT_SAFEARRAY        = 0x001b,
    VT_CARRAY           = 0x001c,
    VT_USERDEFINED      = 0x001d,
    VT_LPSTR            = 0x001e,
    VT_LPWSTR           = 0x001f,
    VT_RECORD           = 0x0024,
    VT_INT_PTR          = 0x0025,
    VT_UINT_PTR         = 0x0026,
    VT_FILETIME         = 0x0040,
    VT_BLOB             = 0x0041,
    VT_STREAM           = 0x0042,
    VT_STORAGE          = 0x0043,
    VT_STREAMED_OBJECT  = 0x0044,
    VT_STORED_OBJECT    = 0x0045,
    VT_BLOB_OBJECT      = 0x0046,
    VT_CF               = 0x0047,
    VT_CLSID            = 0x0048,
    VT_VERSIONED_STREAM = 0x0049,
    VT_BSTR_BLOB        = 0x0fff,
    VT_VECTOR           = 0x1000,
    VT_ARRAY            = 0x2000,
    VT_BYREF            = 0x4000,
    VT_RESERVED         = 0x8000,
    VT_ILLEGAL          = 0xffff,
    VT_ILLEGALMASKED    = 0x0fff,
    VT_TYPEMASK         = 0x0fff,
}

struct CSPLATFORM
{
    uint dwPlatformId;
    uint dwVersionHi;
    uint dwVersionLo;
    uint dwProcessorArch;
}
struct QUERYCONTEXT
{
    uint dwContext;
    CSPLATFORM Platform;
    uint Locale;
    uint dwVersionHi;
    uint dwVersionLo;
}
alias TYSPEC = int;
enum : int
{
    TYSPEC_CLSID       = 0x00000000,
    TYSPEC_FILEEXT     = 0x00000001,
    TYSPEC_MIMETYPE    = 0x00000002,
    TYSPEC_FILENAME    = 0x00000003,
    TYSPEC_PROGID      = 0x00000004,
    TYSPEC_PACKAGENAME = 0x00000005,
    TYSPEC_OBJECTID    = 0x00000006,
}

struct uCLSSPEC
{
    uint tyspec;
    union _tagged_union_e__Struct
    {
        GUID clsid;
        PWSTR pFileExt;
        PWSTR pMimeType;
        PWSTR pProgId;
        PWSTR pFileName;
        struct _ByName_e__Struct
        {
            PWSTR pPackageName;
            GUID PolicyId;
        }
        struct _ByObjectId_e__Struct
        {
            GUID ObjectId;
            GUID PolicyId;
        }
    }
}
alias REGCLS = int;
enum : int
{
    REGCLS_SINGLEUSE      = 0x00000000,
    REGCLS_MULTIPLEUSE    = 0x00000001,
    REGCLS_MULTI_SEPARATE = 0x00000002,
    REGCLS_SUSPENDED      = 0x00000004,
    REGCLS_SURROGATE      = 0x00000008,
    REGCLS_AGILE          = 0x00000010,
}

alias COINITBASE = int;
enum : int
{
    COINITBASE_MULTITHREADED = 0x00000000,
}

struct COAUTHIDENTITY
{
    ushort* User;
    uint UserLength;
    ushort* Domain;
    uint DomainLength;
    ushort* Password;
    uint PasswordLength;
    uint Flags;
}
struct COAUTHINFO
{
    uint dwAuthnSvc;
    uint dwAuthzSvc;
    PWSTR pwszServerPrincName;
    uint dwAuthnLevel;
    uint dwImpersonationLevel;
    COAUTHIDENTITY* pAuthIdentityData;
    uint dwCapabilities;
}
alias MEMCTX = int;
enum : int
{
    MEMCTX_TASK      = 0x00000001,
    MEMCTX_SHARED    = 0x00000002,
    MEMCTX_MACSYSTEM = 0x00000003,
    MEMCTX_UNKNOWN   = 0xffffffff,
    MEMCTX_SAME      = 0xfffffffe,
}

alias CLSCTX = uint;
enum : uint
{
    CLSCTX_INPROC_SERVER                  = 0x00000001,
    CLSCTX_INPROC_HANDLER                 = 0x00000002,
    CLSCTX_LOCAL_SERVER                   = 0x00000004,
    CLSCTX_INPROC_SERVER16                = 0x00000008,
    CLSCTX_REMOTE_SERVER                  = 0x00000010,
    CLSCTX_INPROC_HANDLER16               = 0x00000020,
    CLSCTX_RESERVED1                      = 0x00000040,
    CLSCTX_RESERVED2                      = 0x00000080,
    CLSCTX_RESERVED3                      = 0x00000100,
    CLSCTX_RESERVED4                      = 0x00000200,
    CLSCTX_NO_CODE_DOWNLOAD               = 0x00000400,
    CLSCTX_RESERVED5                      = 0x00000800,
    CLSCTX_NO_CUSTOM_MARSHAL              = 0x00001000,
    CLSCTX_ENABLE_CODE_DOWNLOAD           = 0x00002000,
    CLSCTX_NO_FAILURE_LOG                 = 0x00004000,
    CLSCTX_DISABLE_AAA                    = 0x00008000,
    CLSCTX_ENABLE_AAA                     = 0x00010000,
    CLSCTX_FROM_DEFAULT_CONTEXT           = 0x00020000,
    CLSCTX_ACTIVATE_X86_SERVER            = 0x00040000,
    CLSCTX_ACTIVATE_32_BIT_SERVER         = 0x00040000,
    CLSCTX_ACTIVATE_64_BIT_SERVER         = 0x00080000,
    CLSCTX_ENABLE_CLOAKING                = 0x00100000,
    CLSCTX_APPCONTAINER                   = 0x00400000,
    CLSCTX_ACTIVATE_AAA_AS_IU             = 0x00800000,
    CLSCTX_RESERVED6                      = 0x01000000,
    CLSCTX_ACTIVATE_ARM32_SERVER          = 0x02000000,
    CLSCTX_ALLOW_LOWER_TRUST_REGISTRATION = 0x04000000,
    CLSCTX_PS_DLL                         = 0x80000000,
    CLSCTX_ALL                            = 0x00000017,
    CLSCTX_SERVER                         = 0x00000015,
}

alias MSHLFLAGS = int;
enum : int
{
    MSHLFLAGS_NORMAL      = 0x00000000,
    MSHLFLAGS_TABLESTRONG = 0x00000001,
    MSHLFLAGS_TABLEWEAK   = 0x00000002,
    MSHLFLAGS_NOPING      = 0x00000004,
    MSHLFLAGS_RESERVED1   = 0x00000008,
    MSHLFLAGS_RESERVED2   = 0x00000010,
    MSHLFLAGS_RESERVED3   = 0x00000020,
    MSHLFLAGS_RESERVED4   = 0x00000040,
}

alias MSHCTX = int;
enum : int
{
    MSHCTX_LOCAL            = 0x00000000,
    MSHCTX_NOSHAREDMEM      = 0x00000001,
    MSHCTX_DIFFERENTMACHINE = 0x00000002,
    MSHCTX_INPROC           = 0x00000003,
    MSHCTX_CROSSCTX         = 0x00000004,
    MSHCTX_CONTAINER        = 0x00000005,
}

struct BYTE_BLOB
{
    uint clSize;
    ubyte[1] abData;
}
struct WORD_BLOB
{
    uint clSize;
    ushort[1] asData;
}
struct DWORD_BLOB
{
    uint clSize;
    uint[1] alData;
}
struct FLAGGED_BYTE_BLOB
{
    uint fFlags;
    uint clSize;
    ubyte[1] abData;
}
struct FLAGGED_WORD_BLOB
{
    uint fFlags;
    uint clSize;
    ushort[1] asData;
}
struct BYTE_SIZEDARR
{
    uint clSize;
    ubyte* pData;
}
struct WORD_SIZEDARR
{
    uint clSize;
    ushort* pData;
}
struct DWORD_SIZEDARR
{
    uint clSize;
    uint* pData;
}
struct HYPER_SIZEDARR
{
    uint clSize;
    long* pData;
}
struct BLOB
{
    uint cbSize;
    ubyte* pBlobData;
}
struct IEnumContextProps
{
}
struct IContext
{
}
enum IID_IUnknown = GUID(0x0, 0x0, 0x0, [0xc0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x46]);
interface IUnknown
{
    HRESULT QueryInterface(const(GUID)*, void**);
    uint AddRef();
    uint Release();
}
enum IID_AsyncIUnknown = GUID(0xe0000, 0x0, 0x0, [0xc0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x46]);
interface AsyncIUnknown : IUnknown
{
    HRESULT Begin_QueryInterface(const(GUID)*);
    HRESULT Finish_QueryInterface(void**);
    HRESULT Begin_AddRef();
    uint Finish_AddRef();
    HRESULT Begin_Release();
    uint Finish_Release();
}
enum IID_IClassFactory = GUID(0x1, 0x0, 0x0, [0xc0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x46]);
interface IClassFactory : IUnknown
{
    HRESULT CreateInstance(IUnknown, const(GUID)*, void**);
    HRESULT LockServer(BOOL);
}
struct COSERVERINFO
{
    uint dwReserved1;
    PWSTR pwszName;
    COAUTHINFO* pAuthInfo;
    uint dwReserved2;
}
enum IID_INoMarshal = GUID(0xecc8691b, 0xc1db, 0x4dc0, [0x85, 0x5e, 0x65, 0xf6, 0xc5, 0x51, 0xaf, 0x49]);
interface INoMarshal : IUnknown
{
}
enum IID_IAgileObject = GUID(0x94ea2b94, 0xe9cc, 0x49e0, [0xc0, 0xff, 0xee, 0x64, 0xca, 0x8f, 0x5b, 0x90]);
interface IAgileObject : IUnknown
{
}
enum IID_IActivationFilter = GUID(0x17, 0x0, 0x0, [0xc0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x46]);
interface IActivationFilter : IUnknown
{
    HRESULT HandleActivation(uint, const(GUID)*, GUID*);
}
enum IID_IMalloc = GUID(0x2, 0x0, 0x0, [0xc0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x46]);
interface IMalloc : IUnknown
{
    void* Alloc(ulong);
    void* Realloc(void*, ulong);
    void Free(void*);
    ulong GetSize(void*);
    int DidAlloc(void*);
    void HeapMinimize();
}
enum IID_IStdMarshalInfo = GUID(0x18, 0x0, 0x0, [0xc0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x46]);
interface IStdMarshalInfo : IUnknown
{
    HRESULT GetClassForHandler(uint, void*, GUID*);
}
alias EXTCONN = int;
enum : int
{
    EXTCONN_STRONG   = 0x00000001,
    EXTCONN_WEAK     = 0x00000002,
    EXTCONN_CALLABLE = 0x00000004,
}

enum IID_IExternalConnection = GUID(0x19, 0x0, 0x0, [0xc0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x46]);
interface IExternalConnection : IUnknown
{
    uint AddConnection(uint, uint);
    uint ReleaseConnection(uint, uint, BOOL);
}
struct MULTI_QI
{
    const(GUID)* pIID;
    IUnknown pItf;
    HRESULT hr;
}
enum IID_IMultiQI = GUID(0x20, 0x0, 0x0, [0xc0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x46]);
interface IMultiQI : IUnknown
{
    HRESULT QueryMultipleInterfaces(uint, MULTI_QI*);
}
enum IID_AsyncIMultiQI = GUID(0xe0020, 0x0, 0x0, [0xc0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x46]);
interface AsyncIMultiQI : IUnknown
{
    HRESULT Begin_QueryMultipleInterfaces(uint, MULTI_QI*);
    HRESULT Finish_QueryMultipleInterfaces(MULTI_QI*);
}
enum IID_IInternalUnknown = GUID(0x21, 0x0, 0x0, [0xc0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x46]);
interface IInternalUnknown : IUnknown
{
    HRESULT QueryInternalInterface(const(GUID)*, void**);
}
enum IID_IEnumUnknown = GUID(0x100, 0x0, 0x0, [0xc0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x46]);
interface IEnumUnknown : IUnknown
{
    HRESULT Next(uint, IUnknown*, uint*);
    HRESULT Skip(uint);
    HRESULT Reset();
    HRESULT Clone(IEnumUnknown*);
}
enum IID_IEnumString = GUID(0x101, 0x0, 0x0, [0xc0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x46]);
interface IEnumString : IUnknown
{
    HRESULT Next(uint, PWSTR*, uint*);
    HRESULT Skip(uint);
    HRESULT Reset();
    HRESULT Clone(IEnumString*);
}
enum IID_ISequentialStream = GUID(0xc733a30, 0x2a1c, 0x11ce, [0xad, 0xe5, 0x0, 0xaa, 0x0, 0x44, 0x77, 0x3d]);
interface ISequentialStream : IUnknown
{
    HRESULT Read(void*, uint, uint*);
    HRESULT Write(const(void)*, uint, uint*);
}
struct STATSTG
{
    PWSTR pwcsName;
    uint type;
    ulong cbSize;
    FILETIME mtime;
    FILETIME ctime;
    FILETIME atime;
    STGM grfMode;
    LOCKTYPE grfLocksSupported;
    GUID clsid;
    uint grfStateBits;
    uint reserved;
}
alias STGTY = int;
enum : int
{
    STGTY_STORAGE   = 0x00000001,
    STGTY_STREAM    = 0x00000002,
    STGTY_LOCKBYTES = 0x00000003,
    STGTY_PROPERTY  = 0x00000004,
}

alias STREAM_SEEK = uint;
enum : uint
{
    STREAM_SEEK_SET = 0x00000000,
    STREAM_SEEK_CUR = 0x00000001,
    STREAM_SEEK_END = 0x00000002,
}

alias LOCKTYPE = int;
enum : int
{
    LOCK_WRITE     = 0x00000001,
    LOCK_EXCLUSIVE = 0x00000002,
    LOCK_ONLYONCE  = 0x00000004,
}

enum IID_IStream = GUID(0xc, 0x0, 0x0, [0xc0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x46]);
interface IStream : ISequentialStream
{
    HRESULT Seek(long, STREAM_SEEK, ulong*);
    HRESULT SetSize(ulong);
    HRESULT CopyTo(IStream, ulong, ulong*, ulong*);
    HRESULT Commit(STGC);
    HRESULT Revert();
    HRESULT LockRegion(ulong, ulong, LOCKTYPE);
    HRESULT UnlockRegion(ulong, ulong, uint);
    HRESULT Stat(STATSTG*, STATFLAG);
    HRESULT Clone(IStream*);
}
struct RPCOLEMESSAGE
{
    void* reserved1;
    uint dataRepresentation;
    void* Buffer;
    uint cbBuffer;
    uint iMethod;
    void*[5] reserved2;
    uint rpcFlags;
}
enum IID_IRpcChannelBuffer = GUID(0xd5f56b60, 0x593b, 0x101a, [0xb5, 0x69, 0x8, 0x0, 0x2b, 0x2d, 0xbf, 0x7a]);
interface IRpcChannelBuffer : IUnknown
{
    HRESULT GetBuffer(RPCOLEMESSAGE*, const(GUID)*);
    HRESULT SendReceive(RPCOLEMESSAGE*, uint*);
    HRESULT FreeBuffer(RPCOLEMESSAGE*);
    HRESULT GetDestCtx(uint*, void**);
    HRESULT IsConnected();
}
enum IID_IRpcChannelBuffer2 = GUID(0x594f31d0, 0x7f19, 0x11d0, [0xb1, 0x94, 0x0, 0xa0, 0xc9, 0xd, 0xc8, 0xbf]);
interface IRpcChannelBuffer2 : IRpcChannelBuffer
{
    HRESULT GetProtocolVersion(uint*);
}
enum IID_IAsyncRpcChannelBuffer = GUID(0xa5029fb6, 0x3c34, 0x11d1, [0x9c, 0x99, 0x0, 0xc0, 0x4f, 0xb9, 0x98, 0xaa]);
interface IAsyncRpcChannelBuffer : IRpcChannelBuffer2
{
    HRESULT Send(RPCOLEMESSAGE*, ISynchronize, uint*);
    HRESULT Receive(RPCOLEMESSAGE*, uint*);
    HRESULT GetDestCtxEx(RPCOLEMESSAGE*, uint*, void**);
}
enum IID_IRpcChannelBuffer3 = GUID(0x25b15600, 0x115, 0x11d0, [0xbf, 0xd, 0x0, 0xaa, 0x0, 0xb8, 0xdf, 0xd2]);
interface IRpcChannelBuffer3 : IRpcChannelBuffer2
{
    HRESULT Send(RPCOLEMESSAGE*, uint*);
    HRESULT Receive(RPCOLEMESSAGE*, uint, uint*);
    HRESULT Cancel(RPCOLEMESSAGE*);
    HRESULT GetCallContext(RPCOLEMESSAGE*, const(GUID)*, void**);
    HRESULT GetDestCtxEx(RPCOLEMESSAGE*, uint*, void**);
    HRESULT GetState(RPCOLEMESSAGE*, uint*);
    HRESULT RegisterAsync(RPCOLEMESSAGE*, IAsyncManager);
}
enum IID_IRpcSyntaxNegotiate = GUID(0x58a08519, 0x24c8, 0x4935, [0xb4, 0x82, 0x3f, 0xd8, 0x23, 0x33, 0x3a, 0x4f]);
interface IRpcSyntaxNegotiate : IUnknown
{
    HRESULT NegotiateSyntax(RPCOLEMESSAGE*);
}
enum IID_IRpcProxyBuffer = GUID(0xd5f56a34, 0x593b, 0x101a, [0xb5, 0x69, 0x8, 0x0, 0x2b, 0x2d, 0xbf, 0x7a]);
interface IRpcProxyBuffer : IUnknown
{
    HRESULT Connect(IRpcChannelBuffer);
    void Disconnect();
}
enum IID_IRpcStubBuffer = GUID(0xd5f56afc, 0x593b, 0x101a, [0xb5, 0x69, 0x8, 0x0, 0x2b, 0x2d, 0xbf, 0x7a]);
interface IRpcStubBuffer : IUnknown
{
    HRESULT Connect(IUnknown);
    void Disconnect();
    HRESULT Invoke(RPCOLEMESSAGE*, IRpcChannelBuffer);
    IRpcStubBuffer IsIIDSupported(const(GUID)*);
    uint CountRefs();
    HRESULT DebugServerQueryInterface(void**);
    void DebugServerRelease(void*);
}
enum IID_IPSFactoryBuffer = GUID(0xd5f569d0, 0x593b, 0x101a, [0xb5, 0x69, 0x8, 0x0, 0x2b, 0x2d, 0xbf, 0x7a]);
interface IPSFactoryBuffer : IUnknown
{
    HRESULT CreateProxy(IUnknown, const(GUID)*, IRpcProxyBuffer*, void**);
    HRESULT CreateStub(const(GUID)*, IUnknown, IRpcStubBuffer*);
}
struct SChannelHookCallInfo
{
    GUID iid;
    uint cbSize;
    GUID uCausality;
    uint dwServerPid;
    uint iMethod;
    void* pObject;
}
enum IID_IChannelHook = GUID(0x1008c4a0, 0x7613, 0x11cf, [0x9a, 0xf1, 0x0, 0x20, 0xaf, 0x6e, 0x72, 0xf4]);
interface IChannelHook : IUnknown
{
    void ClientGetSize(const(GUID)*, const(GUID)*, uint*);
    void ClientFillBuffer(const(GUID)*, const(GUID)*, uint*, void*);
    void ClientNotify(const(GUID)*, const(GUID)*, uint, void*, uint, HRESULT);
    void ServerNotify(const(GUID)*, const(GUID)*, uint, void*, uint);
    void ServerGetSize(const(GUID)*, const(GUID)*, HRESULT, uint*);
    void ServerFillBuffer(const(GUID)*, const(GUID)*, uint*, void*, HRESULT);
}
struct SOLE_AUTHENTICATION_SERVICE
{
    uint dwAuthnSvc;
    uint dwAuthzSvc;
    PWSTR pPrincipalName;
    HRESULT hr;
}
alias EOLE_AUTHENTICATION_CAPABILITIES = int;
enum : int
{
    EOAC_NONE              = 0x00000000,
    EOAC_MUTUAL_AUTH       = 0x00000001,
    EOAC_STATIC_CLOAKING   = 0x00000020,
    EOAC_DYNAMIC_CLOAKING  = 0x00000040,
    EOAC_ANY_AUTHORITY     = 0x00000080,
    EOAC_MAKE_FULLSIC      = 0x00000100,
    EOAC_DEFAULT           = 0x00000800,
    EOAC_SECURE_REFS       = 0x00000002,
    EOAC_ACCESS_CONTROL    = 0x00000004,
    EOAC_APPID             = 0x00000008,
    EOAC_DYNAMIC           = 0x00000010,
    EOAC_REQUIRE_FULLSIC   = 0x00000200,
    EOAC_AUTO_IMPERSONATE  = 0x00000400,
    EOAC_DISABLE_AAA       = 0x00001000,
    EOAC_NO_CUSTOM_MARSHAL = 0x00002000,
    EOAC_RESERVED1         = 0x00004000,
}

struct SOLE_AUTHENTICATION_INFO
{
    uint dwAuthnSvc;
    uint dwAuthzSvc;
    void* pAuthInfo;
}
struct SOLE_AUTHENTICATION_LIST
{
    uint cAuthInfo;
    SOLE_AUTHENTICATION_INFO* aAuthInfo;
}
enum IID_IClientSecurity = GUID(0x13d, 0x0, 0x0, [0xc0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x46]);
interface IClientSecurity : IUnknown
{
    HRESULT QueryBlanket(IUnknown, uint*, uint*, ushort**, RPC_C_AUTHN_LEVEL*, RPC_C_IMP_LEVEL*, void**, EOLE_AUTHENTICATION_CAPABILITIES*);
    HRESULT SetBlanket(IUnknown, uint, uint, PWSTR, RPC_C_AUTHN_LEVEL, RPC_C_IMP_LEVEL, void*, EOLE_AUTHENTICATION_CAPABILITIES);
    HRESULT CopyProxy(IUnknown, IUnknown*);
}
enum IID_IServerSecurity = GUID(0x13e, 0x0, 0x0, [0xc0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x46]);
interface IServerSecurity : IUnknown
{
    HRESULT QueryBlanket(uint*, uint*, ushort**, uint*, uint*, void**, uint*);
    HRESULT ImpersonateClient();
    HRESULT RevertToSelf();
    BOOL IsImpersonating();
}
alias RPCOPT_PROPERTIES = int;
enum : int
{
    COMBND_RPCTIMEOUT      = 0x00000001,
    COMBND_SERVER_LOCALITY = 0x00000002,
    COMBND_RESERVED1       = 0x00000004,
    COMBND_RESERVED2       = 0x00000005,
    COMBND_RESERVED3       = 0x00000008,
    COMBND_RESERVED4       = 0x00000010,
}

alias RPCOPT_SERVER_LOCALITY_VALUES = int;
enum : int
{
    SERVER_LOCALITY_PROCESS_LOCAL = 0x00000000,
    SERVER_LOCALITY_MACHINE_LOCAL = 0x00000001,
    SERVER_LOCALITY_REMOTE        = 0x00000002,
}

enum IID_IRpcOptions = GUID(0x144, 0x0, 0x0, [0xc0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x46]);
interface IRpcOptions : IUnknown
{
    HRESULT Set(IUnknown, RPCOPT_PROPERTIES, ulong);
    HRESULT Query(IUnknown, RPCOPT_PROPERTIES, ulong*);
}
alias GLOBALOPT_PROPERTIES = int;
enum : int
{
    COMGLB_EXCEPTION_HANDLING     = 0x00000001,
    COMGLB_APPID                  = 0x00000002,
    COMGLB_RPC_THREADPOOL_SETTING = 0x00000003,
    COMGLB_RO_SETTINGS            = 0x00000004,
    COMGLB_UNMARSHALING_POLICY    = 0x00000005,
    COMGLB_PROPERTIES_RESERVED1   = 0x00000006,
    COMGLB_PROPERTIES_RESERVED2   = 0x00000007,
    COMGLB_PROPERTIES_RESERVED3   = 0x00000008,
}

alias GLOBALOPT_EH_VALUES = int;
enum : int
{
    COMGLB_EXCEPTION_HANDLE             = 0x00000000,
    COMGLB_EXCEPTION_DONOT_HANDLE_FATAL = 0x00000001,
    COMGLB_EXCEPTION_DONOT_HANDLE       = 0x00000001,
    COMGLB_EXCEPTION_DONOT_HANDLE_ANY   = 0x00000002,
}

alias GLOBALOPT_RPCTP_VALUES = int;
enum : int
{
    COMGLB_RPC_THREADPOOL_SETTING_DEFAULT_POOL = 0x00000000,
    COMGLB_RPC_THREADPOOL_SETTING_PRIVATE_POOL = 0x00000001,
}

alias GLOBALOPT_RO_FLAGS = int;
enum : int
{
    COMGLB_STA_MODALLOOP_REMOVE_TOUCH_MESSAGES                    = 0x00000001,
    COMGLB_STA_MODALLOOP_SHARED_QUEUE_REMOVE_INPUT_MESSAGES       = 0x00000002,
    COMGLB_STA_MODALLOOP_SHARED_QUEUE_DONOT_REMOVE_INPUT_MESSAGES = 0x00000004,
    COMGLB_FAST_RUNDOWN                                           = 0x00000008,
    COMGLB_RESERVED1                                              = 0x00000010,
    COMGLB_RESERVED2                                              = 0x00000020,
    COMGLB_RESERVED3                                              = 0x00000040,
    COMGLB_STA_MODALLOOP_SHARED_QUEUE_REORDER_POINTER_MESSAGES    = 0x00000080,
    COMGLB_RESERVED4                                              = 0x00000100,
    COMGLB_RESERVED5                                              = 0x00000200,
    COMGLB_RESERVED6                                              = 0x00000400,
}

alias GLOBALOPT_UNMARSHALING_POLICY_VALUES = int;
enum : int
{
    COMGLB_UNMARSHALING_POLICY_NORMAL = 0x00000000,
    COMGLB_UNMARSHALING_POLICY_STRONG = 0x00000001,
    COMGLB_UNMARSHALING_POLICY_HYBRID = 0x00000002,
}

enum IID_IGlobalOptions = GUID(0x15b, 0x0, 0x0, [0xc0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x46]);
interface IGlobalOptions : IUnknown
{
    HRESULT Set(GLOBALOPT_PROPERTIES, ulong);
    HRESULT Query(GLOBALOPT_PROPERTIES, ulong*);
}
enum IID_ISurrogate = GUID(0x22, 0x0, 0x0, [0xc0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x46]);
interface ISurrogate : IUnknown
{
    HRESULT LoadDllServer(const(GUID)*);
    HRESULT FreeSurrogate();
}
enum IID_IGlobalInterfaceTable = GUID(0x146, 0x0, 0x0, [0xc0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x46]);
interface IGlobalInterfaceTable : IUnknown
{
    HRESULT RegisterInterfaceInGlobal(IUnknown, const(GUID)*, uint*);
    HRESULT RevokeInterfaceFromGlobal(uint);
    HRESULT GetInterfaceFromGlobal(uint, const(GUID)*, void**);
}
enum IID_ISynchronize = GUID(0x30, 0x0, 0x0, [0xc0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x46]);
interface ISynchronize : IUnknown
{
    HRESULT Wait(uint, uint);
    HRESULT Signal();
    HRESULT Reset();
}
enum IID_ISynchronizeHandle = GUID(0x31, 0x0, 0x0, [0xc0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x46]);
interface ISynchronizeHandle : IUnknown
{
    HRESULT GetHandle(HANDLE*);
}
enum IID_ISynchronizeEvent = GUID(0x32, 0x0, 0x0, [0xc0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x46]);
interface ISynchronizeEvent : ISynchronizeHandle
{
    HRESULT SetEventHandle(HANDLE*);
}
enum IID_ISynchronizeContainer = GUID(0x33, 0x0, 0x0, [0xc0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x46]);
interface ISynchronizeContainer : IUnknown
{
    HRESULT AddSynchronize(ISynchronize);
    HRESULT WaitMultiple(uint, uint, ISynchronize*);
}
enum IID_ISynchronizeMutex = GUID(0x25, 0x0, 0x0, [0xc0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x46]);
interface ISynchronizeMutex : ISynchronize
{
    HRESULT ReleaseMutex();
}
enum IID_ICancelMethodCalls = GUID(0x29, 0x0, 0x0, [0xc0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x46]);
interface ICancelMethodCalls : IUnknown
{
    HRESULT Cancel(uint);
    HRESULT TestCancel();
}
alias DCOM_CALL_STATE = int;
enum : int
{
    DCOM_NONE          = 0x00000000,
    DCOM_CALL_COMPLETE = 0x00000001,
    DCOM_CALL_CANCELED = 0x00000002,
}

enum IID_IAsyncManager = GUID(0x2a, 0x0, 0x0, [0xc0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x46]);
interface IAsyncManager : IUnknown
{
    HRESULT CompleteCall(HRESULT);
    HRESULT GetCallContext(const(GUID)*, void**);
    HRESULT GetState(uint*);
}
enum IID_ICallFactory = GUID(0x1c733a30, 0x2a1c, 0x11ce, [0xad, 0xe5, 0x0, 0xaa, 0x0, 0x44, 0x77, 0x3d]);
interface ICallFactory : IUnknown
{
    HRESULT CreateCall(const(GUID)*, IUnknown, const(GUID)*, IUnknown*);
}
enum IID_IRpcHelper = GUID(0x149, 0x0, 0x0, [0xc0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x46]);
interface IRpcHelper : IUnknown
{
    HRESULT GetDCOMProtocolVersion(uint*);
    HRESULT GetIIDFromOBJREF(void*, GUID**);
}
enum IID_IReleaseMarshalBuffers = GUID(0xeb0cb9e8, 0x7996, 0x11d2, [0x87, 0x2e, 0x0, 0x0, 0xf8, 0x8, 0x8, 0x59]);
interface IReleaseMarshalBuffers : IUnknown
{
    HRESULT ReleaseMarshalBuffer(RPCOLEMESSAGE*, uint, IUnknown);
}
enum IID_IWaitMultiple = GUID(0x2b, 0x0, 0x0, [0xc0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x46]);
interface IWaitMultiple : IUnknown
{
    HRESULT WaitMultiple(uint, ISynchronize*);
    HRESULT AddSynchronize(ISynchronize);
}
enum IID_IAddrTrackingControl = GUID(0x147, 0x0, 0x0, [0xc0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x46]);
interface IAddrTrackingControl : IUnknown
{
    HRESULT EnableCOMDynamicAddrTracking();
    HRESULT DisableCOMDynamicAddrTracking();
}
enum IID_IAddrExclusionControl = GUID(0x148, 0x0, 0x0, [0xc0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x46]);
interface IAddrExclusionControl : IUnknown
{
    HRESULT GetCurrentAddrExclusionList(const(GUID)*, void**);
    HRESULT UpdateAddrExclusionList(IUnknown);
}
enum IID_IPipeByte = GUID(0xdb2f3aca, 0x2f86, 0x11d1, [0x8e, 0x4, 0x0, 0xc0, 0x4f, 0xb9, 0x98, 0x9a]);
interface IPipeByte : IUnknown
{
    HRESULT Pull(ubyte*, uint, uint*);
    HRESULT Push(ubyte*, uint);
}
enum IID_AsyncIPipeByte = GUID(0xdb2f3acb, 0x2f86, 0x11d1, [0x8e, 0x4, 0x0, 0xc0, 0x4f, 0xb9, 0x98, 0x9a]);
interface AsyncIPipeByte : IUnknown
{
    HRESULT Begin_Pull(uint);
    HRESULT Finish_Pull(ubyte*, uint*);
    HRESULT Begin_Push(ubyte*, uint);
    HRESULT Finish_Push();
}
enum IID_IPipeLong = GUID(0xdb2f3acc, 0x2f86, 0x11d1, [0x8e, 0x4, 0x0, 0xc0, 0x4f, 0xb9, 0x98, 0x9a]);
interface IPipeLong : IUnknown
{
    HRESULT Pull(int*, uint, uint*);
    HRESULT Push(int*, uint);
}
enum IID_AsyncIPipeLong = GUID(0xdb2f3acd, 0x2f86, 0x11d1, [0x8e, 0x4, 0x0, 0xc0, 0x4f, 0xb9, 0x98, 0x9a]);
interface AsyncIPipeLong : IUnknown
{
    HRESULT Begin_Pull(uint);
    HRESULT Finish_Pull(int*, uint*);
    HRESULT Begin_Push(int*, uint);
    HRESULT Finish_Push();
}
enum IID_IPipeDouble = GUID(0xdb2f3ace, 0x2f86, 0x11d1, [0x8e, 0x4, 0x0, 0xc0, 0x4f, 0xb9, 0x98, 0x9a]);
interface IPipeDouble : IUnknown
{
    HRESULT Pull(double*, uint, uint*);
    HRESULT Push(double*, uint);
}
enum IID_AsyncIPipeDouble = GUID(0xdb2f3acf, 0x2f86, 0x11d1, [0x8e, 0x4, 0x0, 0xc0, 0x4f, 0xb9, 0x98, 0x9a]);
interface AsyncIPipeDouble : IUnknown
{
    HRESULT Begin_Pull(uint);
    HRESULT Finish_Pull(double*, uint*);
    HRESULT Begin_Push(double*, uint);
    HRESULT Finish_Push();
}
alias APTTYPEQUALIFIER = int;
enum : int
{
    APTTYPEQUALIFIER_NONE               = 0x00000000,
    APTTYPEQUALIFIER_IMPLICIT_MTA       = 0x00000001,
    APTTYPEQUALIFIER_NA_ON_MTA          = 0x00000002,
    APTTYPEQUALIFIER_NA_ON_STA          = 0x00000003,
    APTTYPEQUALIFIER_NA_ON_IMPLICIT_MTA = 0x00000004,
    APTTYPEQUALIFIER_NA_ON_MAINSTA      = 0x00000005,
    APTTYPEQUALIFIER_APPLICATION_STA    = 0x00000006,
    APTTYPEQUALIFIER_RESERVED_1         = 0x00000007,
}

alias APTTYPE = int;
enum : int
{
    APTTYPE_CURRENT = 0xffffffff,
    APTTYPE_STA     = 0x00000000,
    APTTYPE_MTA     = 0x00000001,
    APTTYPE_NA      = 0x00000002,
    APTTYPE_MAINSTA = 0x00000003,
}

alias THDTYPE = int;
enum : int
{
    THDTYPE_BLOCKMESSAGES   = 0x00000000,
    THDTYPE_PROCESSMESSAGES = 0x00000001,
}

enum IID_IComThreadingInfo = GUID(0x1ce, 0x0, 0x0, [0xc0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x46]);
interface IComThreadingInfo : IUnknown
{
    HRESULT GetCurrentApartmentType(APTTYPE*);
    HRESULT GetCurrentThreadType(THDTYPE*);
    HRESULT GetCurrentLogicalThreadId(GUID*);
    HRESULT SetCurrentLogicalThreadId(const(GUID)*);
}
enum IID_IProcessInitControl = GUID(0x72380d55, 0x8d2b, 0x43a3, [0x85, 0x13, 0x2b, 0x6e, 0xf3, 0x14, 0x34, 0xe9]);
interface IProcessInitControl : IUnknown
{
    HRESULT ResetInitializerTimeout(uint);
}
enum IID_IFastRundown = GUID(0x40, 0x0, 0x0, [0xc0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x46]);
interface IFastRundown : IUnknown
{
}
alias CO_MARSHALING_CONTEXT_ATTRIBUTES = int;
enum : int
{
    CO_MARSHALING_SOURCE_IS_APP_CONTAINER       = 0x00000000,
    CO_MARSHALING_CONTEXT_ATTRIBUTE_RESERVED_1  = 0x80000000,
    CO_MARSHALING_CONTEXT_ATTRIBUTE_RESERVED_2  = 0x80000001,
    CO_MARSHALING_CONTEXT_ATTRIBUTE_RESERVED_3  = 0x80000002,
    CO_MARSHALING_CONTEXT_ATTRIBUTE_RESERVED_4  = 0x80000003,
    CO_MARSHALING_CONTEXT_ATTRIBUTE_RESERVED_5  = 0x80000004,
    CO_MARSHALING_CONTEXT_ATTRIBUTE_RESERVED_6  = 0x80000005,
    CO_MARSHALING_CONTEXT_ATTRIBUTE_RESERVED_7  = 0x80000006,
    CO_MARSHALING_CONTEXT_ATTRIBUTE_RESERVED_8  = 0x80000007,
    CO_MARSHALING_CONTEXT_ATTRIBUTE_RESERVED_9  = 0x80000008,
    CO_MARSHALING_CONTEXT_ATTRIBUTE_RESERVED_10 = 0x80000009,
    CO_MARSHALING_CONTEXT_ATTRIBUTE_RESERVED_11 = 0x8000000a,
    CO_MARSHALING_CONTEXT_ATTRIBUTE_RESERVED_12 = 0x8000000b,
    CO_MARSHALING_CONTEXT_ATTRIBUTE_RESERVED_13 = 0x8000000c,
    CO_MARSHALING_CONTEXT_ATTRIBUTE_RESERVED_14 = 0x8000000d,
    CO_MARSHALING_CONTEXT_ATTRIBUTE_RESERVED_15 = 0x8000000e,
    CO_MARSHALING_CONTEXT_ATTRIBUTE_RESERVED_16 = 0x8000000f,
    CO_MARSHALING_CONTEXT_ATTRIBUTE_RESERVED_17 = 0x80000010,
    CO_MARSHALING_CONTEXT_ATTRIBUTE_RESERVED_18 = 0x80000011,
}

struct MachineGlobalObjectTableRegistrationToken__
{
    int unused;
}
enum IID_IMachineGlobalObjectTable = GUID(0x26d709ac, 0xf70b, 0x4421, [0xa9, 0x6f, 0xd2, 0x87, 0x8f, 0xaf, 0xb0, 0xd]);
interface IMachineGlobalObjectTable : IUnknown
{
    HRESULT RegisterObject(const(GUID)*, const(wchar)*, IUnknown, MachineGlobalObjectTableRegistrationToken__**);
    HRESULT GetObject(const(GUID)*, const(wchar)*, const(GUID)*, void**);
    HRESULT RevokeObject(MachineGlobalObjectTableRegistrationToken__*);
}
enum IID_ISupportAllowLowerTrustActivation = GUID(0xe9956ef2, 0x3828, 0x4b4b, [0x8f, 0xa9, 0x7d, 0xb6, 0x1d, 0xee, 0x49, 0x54]);
interface ISupportAllowLowerTrustActivation : IUnknown
{
}
enum IID_IMallocSpy = GUID(0x1d, 0x0, 0x0, [0xc0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x46]);
interface IMallocSpy : IUnknown
{
    ulong PreAlloc(ulong);
    void* PostAlloc(void*);
    void* PreFree(void*, BOOL);
    void PostFree(BOOL);
    ulong PreRealloc(void*, ulong, void**, BOOL);
    void* PostRealloc(void*, BOOL);
    void* PreGetSize(void*, BOOL);
    ulong PostGetSize(ulong, BOOL);
    void* PreDidAlloc(void*, BOOL);
    int PostDidAlloc(void*, BOOL, int);
    void PreHeapMinimize();
    void PostHeapMinimize();
}
struct BIND_OPTS
{
    uint cbStruct;
    uint grfFlags;
    uint grfMode;
    uint dwTickCountDeadline;
}
struct BIND_OPTS2
{
    BIND_OPTS Base;
    uint dwTrackFlags;
    uint dwClassContext;
    uint locale;
    COSERVERINFO* pServerInfo;
}
struct BIND_OPTS3
{
    BIND_OPTS2 Base;
    HWND hwnd;
}
alias BIND_FLAGS = int;
enum : int
{
    BIND_MAYBOTHERUSER     = 0x00000001,
    BIND_JUSTTESTEXISTENCE = 0x00000002,
}

enum IID_IBindCtx = GUID(0xe, 0x0, 0x0, [0xc0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x46]);
interface IBindCtx : IUnknown
{
    HRESULT RegisterObjectBound(IUnknown);
    HRESULT RevokeObjectBound(IUnknown);
    HRESULT ReleaseBoundObjects();
    HRESULT SetBindOptions(BIND_OPTS*);
    HRESULT GetBindOptions(BIND_OPTS*);
    HRESULT GetRunningObjectTable(IRunningObjectTable*);
    HRESULT RegisterObjectParam(PWSTR, IUnknown);
    HRESULT GetObjectParam(PWSTR, IUnknown*);
    HRESULT EnumObjectParam(IEnumString*);
    HRESULT RevokeObjectParam(PWSTR);
}
enum IID_IEnumMoniker = GUID(0x102, 0x0, 0x0, [0xc0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x46]);
interface IEnumMoniker : IUnknown
{
    HRESULT Next(uint, IMoniker*, uint*);
    HRESULT Skip(uint);
    HRESULT Reset();
    HRESULT Clone(IEnumMoniker*);
}
enum IID_IRunnableObject = GUID(0x126, 0x0, 0x0, [0xc0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x46]);
interface IRunnableObject : IUnknown
{
    HRESULT GetRunningClass(GUID*);
    HRESULT Run(IBindCtx);
    BOOL IsRunning();
    HRESULT LockRunning(BOOL, BOOL);
    HRESULT SetContainedObject(BOOL);
}
enum IID_IRunningObjectTable = GUID(0x10, 0x0, 0x0, [0xc0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x46]);
interface IRunningObjectTable : IUnknown
{
    HRESULT Register(ROT_FLAGS, IUnknown, IMoniker, uint*);
    HRESULT Revoke(uint);
    HRESULT IsRunning(IMoniker);
    HRESULT GetObject(IMoniker, IUnknown*);
    HRESULT NoteChangeTime(uint, FILETIME*);
    HRESULT GetTimeOfLastChange(IMoniker, FILETIME*);
    HRESULT EnumRunning(IEnumMoniker*);
}
enum IID_IPersist = GUID(0x10c, 0x0, 0x0, [0xc0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x46]);
interface IPersist : IUnknown
{
    HRESULT GetClassID(GUID*);
}
enum IID_IPersistStream = GUID(0x109, 0x0, 0x0, [0xc0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x46]);
interface IPersistStream : IPersist
{
    HRESULT IsDirty();
    HRESULT Load(IStream);
    HRESULT Save(IStream, BOOL);
    HRESULT GetSizeMax(ulong*);
}
alias MKSYS = int;
enum : int
{
    MKSYS_NONE             = 0x00000000,
    MKSYS_GENERICCOMPOSITE = 0x00000001,
    MKSYS_FILEMONIKER      = 0x00000002,
    MKSYS_ANTIMONIKER      = 0x00000003,
    MKSYS_ITEMMONIKER      = 0x00000004,
    MKSYS_POINTERMONIKER   = 0x00000005,
    MKSYS_CLASSMONIKER     = 0x00000007,
    MKSYS_OBJREFMONIKER    = 0x00000008,
    MKSYS_SESSIONMONIKER   = 0x00000009,
    MKSYS_LUAMONIKER       = 0x0000000a,
}

alias MKRREDUCE = int;
enum : int
{
    MKRREDUCE_ONE         = 0x00030000,
    MKRREDUCE_TOUSER      = 0x00020000,
    MKRREDUCE_THROUGHUSER = 0x00010000,
    MKRREDUCE_ALL         = 0x00000000,
}

enum IID_IMoniker = GUID(0xf, 0x0, 0x0, [0xc0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x46]);
interface IMoniker : IPersistStream
{
    HRESULT BindToObject(IBindCtx, IMoniker, const(GUID)*, void**);
    HRESULT BindToStorage(IBindCtx, IMoniker, const(GUID)*, void**);
    HRESULT Reduce(IBindCtx, uint, IMoniker*, IMoniker*);
    HRESULT ComposeWith(IMoniker, BOOL, IMoniker*);
    HRESULT Enum(BOOL, IEnumMoniker*);
    HRESULT IsEqual(IMoniker);
    HRESULT Hash(uint*);
    HRESULT IsRunning(IBindCtx, IMoniker, IMoniker);
    HRESULT GetTimeOfLastChange(IBindCtx, IMoniker, FILETIME*);
    HRESULT Inverse(IMoniker*);
    HRESULT CommonPrefixWith(IMoniker, IMoniker*);
    HRESULT RelativePathTo(IMoniker, IMoniker*);
    HRESULT GetDisplayName(IBindCtx, IMoniker, PWSTR*);
    HRESULT ParseDisplayName(IBindCtx, IMoniker, PWSTR, uint*, IMoniker*);
    HRESULT IsSystemMoniker(uint*);
}
enum IID_IROTData = GUID(0xf29f6bc0, 0x5021, 0x11ce, [0xaa, 0x15, 0x0, 0x0, 0x69, 0x1, 0x29, 0x3f]);
interface IROTData : IUnknown
{
    HRESULT GetComparisonData(ubyte*, uint, uint*);
}
enum IID_IPersistFile = GUID(0x10b, 0x0, 0x0, [0xc0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x46]);
interface IPersistFile : IPersist
{
    HRESULT IsDirty();
    HRESULT Load(const(wchar)*, STGM);
    HRESULT Save(const(wchar)*, BOOL);
    HRESULT SaveCompleted(const(wchar)*);
    HRESULT GetCurFile(PWSTR*);
}
struct DVTARGETDEVICE
{
    uint tdSize;
    ushort tdDriverNameOffset;
    ushort tdDeviceNameOffset;
    ushort tdPortNameOffset;
    ushort tdExtDevmodeOffset;
    ubyte[1] tdData;
}
struct FORMATETC
{
    ushort cfFormat;
    DVTARGETDEVICE* ptd;
    uint dwAspect;
    int lindex;
    uint tymed;
}
enum IID_IEnumFORMATETC = GUID(0x103, 0x0, 0x0, [0xc0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x46]);
interface IEnumFORMATETC : IUnknown
{
    HRESULT Next(uint, FORMATETC*, uint*);
    HRESULT Skip(uint);
    HRESULT Reset();
    HRESULT Clone(IEnumFORMATETC*);
}
alias ADVF = int;
enum : int
{
    ADVF_NODATA            = 0x00000001,
    ADVF_PRIMEFIRST        = 0x00000002,
    ADVF_ONLYONCE          = 0x00000004,
    ADVF_DATAONSTOP        = 0x00000040,
    ADVFCACHE_NOHANDLER    = 0x00000008,
    ADVFCACHE_FORCEBUILTIN = 0x00000010,
    ADVFCACHE_ONSAVE       = 0x00000020,
}

struct STATDATA
{
    FORMATETC formatetc;
    uint advf;
    IAdviseSink pAdvSink;
    uint dwConnection;
}
enum IID_IEnumSTATDATA = GUID(0x105, 0x0, 0x0, [0xc0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x46]);
interface IEnumSTATDATA : IUnknown
{
    HRESULT Next(uint, STATDATA*, uint*);
    HRESULT Skip(uint);
    HRESULT Reset();
    HRESULT Clone(IEnumSTATDATA*);
}
alias TYMED = int;
enum : int
{
    TYMED_HGLOBAL  = 0x00000001,
    TYMED_FILE     = 0x00000002,
    TYMED_ISTREAM  = 0x00000004,
    TYMED_ISTORAGE = 0x00000008,
    TYMED_GDI      = 0x00000010,
    TYMED_MFPICT   = 0x00000020,
    TYMED_ENHMF    = 0x00000040,
    TYMED_NULL     = 0x00000000,
}

struct RemSTGMEDIUM
{
    TYMED tymed;
    uint dwHandleType;
    uint pData;
    uint pUnkForRelease;
    uint cbData;
    ubyte[1] data;
}
struct STGMEDIUM
{
    TYMED tymed;
    union
    {
        HBITMAP hBitmap;
        void* hMetaFilePict;
        HENHMETAFILE hEnhMetaFile;
        HGLOBAL hGlobal;
        PWSTR lpszFileName;
        IStream pstm;
        IStorage pstg;
    }
    IUnknown pUnkForRelease;
}
struct GDI_OBJECT
{
    uint ObjectType;
    union _u_e__Struct
    {
        userHBITMAP* hBitmap;
        userHPALETTE* hPalette;
        userHGLOBAL* hGeneric;
    }
}
struct userSTGMEDIUM
{
    IUnknown pUnkForRelease;
}
struct userFLAG_STGMEDIUM
{
    int ContextFlags;
    int fPassOwnership;
    userSTGMEDIUM Stgmed;
}
struct FLAG_STGMEDIUM
{
    int ContextFlags;
    int fPassOwnership;
    STGMEDIUM Stgmed;
}
enum IID_IAdviseSink = GUID(0x10f, 0x0, 0x0, [0xc0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x46]);
interface IAdviseSink : IUnknown
{
    void OnDataChange(FORMATETC*, STGMEDIUM*);
    void OnViewChange(uint, int);
    void OnRename(IMoniker);
    void OnSave();
    void OnClose();
}
enum IID_AsyncIAdviseSink = GUID(0x150, 0x0, 0x0, [0xc0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x46]);
interface AsyncIAdviseSink : IUnknown
{
    void Begin_OnDataChange(FORMATETC*, STGMEDIUM*);
    void Finish_OnDataChange();
    void Begin_OnViewChange(uint, int);
    void Finish_OnViewChange();
    void Begin_OnRename(IMoniker);
    void Finish_OnRename();
    void Begin_OnSave();
    void Finish_OnSave();
    void Begin_OnClose();
    void Finish_OnClose();
}
enum IID_IAdviseSink2 = GUID(0x125, 0x0, 0x0, [0xc0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x46]);
interface IAdviseSink2 : IAdviseSink
{
    void OnLinkSrcChange(IMoniker);
}
enum IID_AsyncIAdviseSink2 = GUID(0x151, 0x0, 0x0, [0xc0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x46]);
interface AsyncIAdviseSink2 : AsyncIAdviseSink
{
    void Begin_OnLinkSrcChange(IMoniker);
    void Finish_OnLinkSrcChange();
}
alias DATADIR = int;
enum : int
{
    DATADIR_GET = 0x00000001,
    DATADIR_SET = 0x00000002,
}

enum IID_IDataObject = GUID(0x10e, 0x0, 0x0, [0xc0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x46]);
interface IDataObject : IUnknown
{
    HRESULT GetData(FORMATETC*, STGMEDIUM*);
    HRESULT GetDataHere(FORMATETC*, STGMEDIUM*);
    HRESULT QueryGetData(FORMATETC*);
    HRESULT GetCanonicalFormatEtc(FORMATETC*, FORMATETC*);
    HRESULT SetData(FORMATETC*, STGMEDIUM*, BOOL);
    HRESULT EnumFormatEtc(uint, IEnumFORMATETC*);
    HRESULT DAdvise(FORMATETC*, uint, IAdviseSink, uint*);
    HRESULT DUnadvise(uint);
    HRESULT EnumDAdvise(IEnumSTATDATA*);
}
enum IID_IDataAdviseHolder = GUID(0x110, 0x0, 0x0, [0xc0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x46]);
interface IDataAdviseHolder : IUnknown
{
    HRESULT Advise(IDataObject, FORMATETC*, uint, IAdviseSink, uint*);
    HRESULT Unadvise(uint);
    HRESULT EnumAdvise(IEnumSTATDATA*);
    HRESULT SendOnDataChange(IDataObject, uint, uint);
}
alias CALLTYPE = int;
enum : int
{
    CALLTYPE_TOPLEVEL             = 0x00000001,
    CALLTYPE_NESTED               = 0x00000002,
    CALLTYPE_ASYNC                = 0x00000003,
    CALLTYPE_TOPLEVEL_CALLPENDING = 0x00000004,
    CALLTYPE_ASYNC_CALLPENDING    = 0x00000005,
}

alias SERVERCALL = int;
enum : int
{
    SERVERCALL_ISHANDLED  = 0x00000000,
    SERVERCALL_REJECTED   = 0x00000001,
    SERVERCALL_RETRYLATER = 0x00000002,
}

alias PENDINGTYPE = int;
enum : int
{
    PENDINGTYPE_TOPLEVEL = 0x00000001,
    PENDINGTYPE_NESTED   = 0x00000002,
}

alias PENDINGMSG = int;
enum : int
{
    PENDINGMSG_CANCELCALL     = 0x00000000,
    PENDINGMSG_WAITNOPROCESS  = 0x00000001,
    PENDINGMSG_WAITDEFPROCESS = 0x00000002,
}

struct INTERFACEINFO
{
    IUnknown pUnk;
    GUID iid;
    ushort wMethod;
}
enum IID_IClassActivator = GUID(0x140, 0x0, 0x0, [0xc0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x46]);
interface IClassActivator : IUnknown
{
    HRESULT GetClassObject(const(GUID)*, uint, uint, const(GUID)*, void**);
}
enum IID_IProgressNotify = GUID(0xa9d758a0, 0x4617, 0x11cf, [0x95, 0xfc, 0x0, 0xaa, 0x0, 0x68, 0xd, 0xb4]);
interface IProgressNotify : IUnknown
{
    HRESULT OnProgress(uint, uint, BOOL, BOOL);
}
struct StorageLayout
{
    uint LayoutType;
    PWSTR pwcsElementName;
    long cOffset;
    long cBytes;
}
enum IID_IBlockingLock = GUID(0x30f3d47a, 0x6447, 0x11d1, [0x8e, 0x3c, 0x0, 0xc0, 0x4f, 0xb9, 0x38, 0x6d]);
interface IBlockingLock : IUnknown
{
    HRESULT Lock(uint);
    HRESULT Unlock();
}
enum IID_ITimeAndNoticeControl = GUID(0xbc0bf6ae, 0x8878, 0x11d1, [0x83, 0xe9, 0x0, 0xc0, 0x4f, 0xc2, 0xc6, 0xd4]);
interface ITimeAndNoticeControl : IUnknown
{
    HRESULT SuppressChanges(uint, uint);
}
enum IID_IOplockStorage = GUID(0x8d19c834, 0x8879, 0x11d1, [0x83, 0xe9, 0x0, 0xc0, 0x4f, 0xc2, 0xc6, 0xd4]);
interface IOplockStorage : IUnknown
{
    HRESULT CreateStorageEx(const(wchar)*, uint, uint, uint, const(GUID)*, void**);
    HRESULT OpenStorageEx(const(wchar)*, uint, uint, uint, const(GUID)*, void**);
}
enum IID_IUrlMon = GUID(0x26, 0x0, 0x0, [0xc0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x46]);
interface IUrlMon : IUnknown
{
    HRESULT AsyncGetClassBits(const(GUID)*, const(wchar)*, const(wchar)*, uint, uint, const(wchar)*, IBindCtx, uint, const(GUID)*, uint);
}
enum IID_IForegroundTransfer = GUID(0x145, 0x0, 0x0, [0xc0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x46]);
interface IForegroundTransfer : IUnknown
{
    HRESULT AllowForegroundTransfer(void*);
}
alias ApplicationType = int;
enum : int
{
    ServerApplication  = 0x00000000,
    LibraryApplication = 0x00000001,
}

alias ShutdownType = int;
enum : int
{
    IdleShutdown   = 0x00000000,
    ForcedShutdown = 0x00000001,
}

enum IID_IProcessLock = GUID(0x1d5, 0x0, 0x0, [0xc0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x46]);
interface IProcessLock : IUnknown
{
    uint AddRefOnProcess();
    uint ReleaseRefOnProcess();
}
enum IID_ISurrogateService = GUID(0x1d4, 0x0, 0x0, [0xc0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x46]);
interface ISurrogateService : IUnknown
{
    HRESULT Init(const(GUID)*, IProcessLock, BOOL*);
    HRESULT ApplicationLaunch(const(GUID)*, ApplicationType);
    HRESULT ApplicationFree(const(GUID)*);
    HRESULT CatalogRefresh(uint);
    HRESULT ProcessShutdown(ShutdownType);
}
enum IID_IInitializeSpy = GUID(0x34, 0x0, 0x0, [0xc0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x46]);
interface IInitializeSpy : IUnknown
{
    HRESULT PreInitialize(uint, uint);
    HRESULT PostInitialize(HRESULT, uint, uint);
    HRESULT PreUninitialize(uint);
    HRESULT PostUninitialize(uint);
}
alias COINIT = int;
enum : int
{
    COINIT_APARTMENTTHREADED = 0x00000002,
    COINIT_MULTITHREADED     = 0x00000000,
    COINIT_DISABLE_OLE1DDE   = 0x00000004,
    COINIT_SPEED_OVER_MEMORY = 0x00000008,
}

alias COMSD = int;
enum : int
{
    SD_LAUNCHPERMISSIONS  = 0x00000000,
    SD_ACCESSPERMISSIONS  = 0x00000001,
    SD_LAUNCHRESTRICTIONS = 0x00000002,
    SD_ACCESSRESTRICTIONS = 0x00000003,
}

enum IID_IServiceProvider = GUID(0x6d5140c1, 0x7436, 0x11ce, [0x80, 0x34, 0x0, 0xaa, 0x0, 0x60, 0x9, 0xfa]);
interface IServiceProvider : IUnknown
{
    HRESULT QueryService(const(GUID)*, const(GUID)*, void**);
}
alias COWAIT_FLAGS = int;
enum : int
{
    COWAIT_DEFAULT                  = 0x00000000,
    COWAIT_WAITALL                  = 0x00000001,
    COWAIT_ALERTABLE                = 0x00000002,
    COWAIT_INPUTAVAILABLE           = 0x00000004,
    COWAIT_DISPATCH_CALLS           = 0x00000008,
    COWAIT_DISPATCH_WINDOW_MESSAGES = 0x00000010,
}

alias CWMO_FLAGS = int;
enum : int
{
    CWMO_DEFAULT                  = 0x00000000,
    CWMO_DISPATCH_CALLS           = 0x00000001,
    CWMO_DISPATCH_WINDOW_MESSAGES = 0x00000002,
}

alias LPFNGETCLASSOBJECT = HRESULT function(const(GUID)*, const(GUID)*, void**);
alias LPFNCANUNLOADNOW = HRESULT function();
enum IID_IEnumGUID = GUID(0x2e000, 0x0, 0x0, [0xc0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x46]);
interface IEnumGUID : IUnknown
{
    HRESULT Next(uint, GUID*, uint*);
    HRESULT Skip(uint);
    HRESULT Reset();
    HRESULT Clone(IEnumGUID*);
}
struct CATEGORYINFO
{
    GUID catid;
    uint lcid;
    wchar[128] szDescription;
}
enum IID_IEnumCATEGORYINFO = GUID(0x2e011, 0x0, 0x0, [0xc0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x46]);
interface IEnumCATEGORYINFO : IUnknown
{
    HRESULT Next(uint, CATEGORYINFO*, uint*);
    HRESULT Skip(uint);
    HRESULT Reset();
    HRESULT Clone(IEnumCATEGORYINFO*);
}
enum IID_ICatRegister = GUID(0x2e012, 0x0, 0x0, [0xc0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x46]);
interface ICatRegister : IUnknown
{
    HRESULT RegisterCategories(uint, CATEGORYINFO*);
    HRESULT UnRegisterCategories(uint, GUID*);
    HRESULT RegisterClassImplCategories(const(GUID)*, uint, GUID*);
    HRESULT UnRegisterClassImplCategories(const(GUID)*, uint, GUID*);
    HRESULT RegisterClassReqCategories(const(GUID)*, uint, GUID*);
    HRESULT UnRegisterClassReqCategories(const(GUID)*, uint, GUID*);
}
enum IID_ICatInformation = GUID(0x2e013, 0x0, 0x0, [0xc0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x46]);
interface ICatInformation : IUnknown
{
    HRESULT EnumCategories(uint, IEnumCATEGORYINFO*);
    HRESULT GetCategoryDesc(GUID*, uint, PWSTR*);
    HRESULT EnumClassesOfCategories(uint, const(GUID)*, uint, const(GUID)*, IEnumGUID*);
    HRESULT IsClassOfCategories(const(GUID)*, uint, const(GUID)*, uint, const(GUID)*);
    HRESULT EnumImplCategoriesOfClass(const(GUID)*, IEnumGUID*);
    HRESULT EnumReqCategoriesOfClass(const(GUID)*, IEnumGUID*);
}
struct ComCallData
{
    uint dwDispid;
    uint dwReserved;
    void* pUserDefined;
}
alias PFNCONTEXTCALL = HRESULT function(ComCallData*);
enum IID_IContextCallback = GUID(0x1da, 0x0, 0x0, [0xc0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x46]);
interface IContextCallback : IUnknown
{
    HRESULT ContextCallback(PFNCONTEXTCALL, ComCallData*, const(GUID)*, int, IUnknown);
}
enum IID_IBinding = GUID(0x79eac9c0, 0xbaf9, 0x11ce, [0x8c, 0x82, 0x0, 0xaa, 0x0, 0x4b, 0xa9, 0xb]);
interface IBinding : IUnknown
{
    HRESULT Abort();
    HRESULT Suspend();
    HRESULT Resume();
    HRESULT SetPriority(int);
    HRESULT GetPriority(int*);
    HRESULT GetBindResult(GUID*, uint*, PWSTR*, uint*);
}
alias BINDINFOF = int;
enum : int
{
    BINDINFOF_URLENCODESTGMEDDATA = 0x00000001,
    BINDINFOF_URLENCODEDEXTRAINFO = 0x00000002,
}

struct BINDINFO
{
    uint cbSize;
    PWSTR szExtraInfo;
    STGMEDIUM stgmedData;
    uint grfBindInfoF;
    uint dwBindVerb;
    PWSTR szCustomVerb;
    uint cbstgmedData;
    uint dwOptions;
    uint dwOptionsFlags;
    uint dwCodePage;
    SECURITY_ATTRIBUTES securityAttributes;
    GUID iid;
    IUnknown pUnk;
    uint dwReserved;
}
enum IID_IBindStatusCallback = GUID(0x79eac9c1, 0xbaf9, 0x11ce, [0x8c, 0x82, 0x0, 0xaa, 0x0, 0x4b, 0xa9, 0xb]);
interface IBindStatusCallback : IUnknown
{
    HRESULT OnStartBinding(uint, IBinding);
    HRESULT GetPriority(int*);
    HRESULT OnLowResource(uint);
    HRESULT OnProgress(uint, uint, uint, const(wchar)*);
    HRESULT OnStopBinding(HRESULT, const(wchar)*);
    HRESULT GetBindInfo(uint*, BINDINFO*);
    HRESULT OnDataAvailable(uint, uint, FORMATETC*, STGMEDIUM*);
    HRESULT OnObjectAvailable(const(GUID)*, IUnknown);
}
enum IID_IBindStatusCallbackEx = GUID(0xaaa74ef9, 0x8ee7, 0x4659, [0x88, 0xd9, 0xf8, 0xc5, 0x4, 0xda, 0x73, 0xcc]);
interface IBindStatusCallbackEx : IBindStatusCallback
{
    HRESULT GetBindInfoEx(uint*, BINDINFO*, uint*, uint*);
}
enum IID_IAuthenticate = GUID(0x79eac9d0, 0xbaf9, 0x11ce, [0x8c, 0x82, 0x0, 0xaa, 0x0, 0x4b, 0xa9, 0xb]);
interface IAuthenticate : IUnknown
{
    HRESULT Authenticate(HWND*, PWSTR*, PWSTR*);
}
struct AUTHENTICATEINFO
{
    uint dwFlags;
    uint dwReserved;
}
enum IID_IAuthenticateEx = GUID(0x2ad1edaf, 0xd83d, 0x48b5, [0x9a, 0xdf, 0x3, 0xdb, 0xe1, 0x9f, 0x53, 0xbd]);
interface IAuthenticateEx : IAuthenticate
{
    HRESULT AuthenticateEx(HWND*, PWSTR*, PWSTR*, AUTHENTICATEINFO*);
}
alias Uri_PROPERTY = int;
enum : int
{
    Uri_PROPERTY_ABSOLUTE_URI   = 0x00000000,
    Uri_PROPERTY_STRING_START   = 0x00000000,
    Uri_PROPERTY_AUTHORITY      = 0x00000001,
    Uri_PROPERTY_DISPLAY_URI    = 0x00000002,
    Uri_PROPERTY_DOMAIN         = 0x00000003,
    Uri_PROPERTY_EXTENSION      = 0x00000004,
    Uri_PROPERTY_FRAGMENT       = 0x00000005,
    Uri_PROPERTY_HOST           = 0x00000006,
    Uri_PROPERTY_PASSWORD       = 0x00000007,
    Uri_PROPERTY_PATH           = 0x00000008,
    Uri_PROPERTY_PATH_AND_QUERY = 0x00000009,
    Uri_PROPERTY_QUERY          = 0x0000000a,
    Uri_PROPERTY_RAW_URI        = 0x0000000b,
    Uri_PROPERTY_SCHEME_NAME    = 0x0000000c,
    Uri_PROPERTY_USER_INFO      = 0x0000000d,
    Uri_PROPERTY_USER_NAME      = 0x0000000e,
    Uri_PROPERTY_STRING_LAST    = 0x0000000e,
    Uri_PROPERTY_HOST_TYPE      = 0x0000000f,
    Uri_PROPERTY_DWORD_START    = 0x0000000f,
    Uri_PROPERTY_PORT           = 0x00000010,
    Uri_PROPERTY_SCHEME         = 0x00000011,
    Uri_PROPERTY_ZONE           = 0x00000012,
    Uri_PROPERTY_DWORD_LAST     = 0x00000012,
}

enum IID_IUri = GUID(0xa39ee748, 0x6a27, 0x4817, [0xa6, 0xf2, 0x13, 0x91, 0x4b, 0xef, 0x58, 0x90]);
interface IUri : IUnknown
{
    HRESULT GetPropertyBSTR(Uri_PROPERTY, BSTR*, uint);
    HRESULT GetPropertyLength(Uri_PROPERTY, uint*, uint);
    HRESULT GetPropertyDWORD(Uri_PROPERTY, uint*, uint);
    HRESULT HasProperty(Uri_PROPERTY, BOOL*);
    HRESULT GetAbsoluteUri(BSTR*);
    HRESULT GetAuthority(BSTR*);
    HRESULT GetDisplayUri(BSTR*);
    HRESULT GetDomain(BSTR*);
    HRESULT GetExtension(BSTR*);
    HRESULT GetFragment(BSTR*);
    HRESULT GetHost(BSTR*);
    HRESULT GetPassword(BSTR*);
    HRESULT GetPath(BSTR*);
    HRESULT GetPathAndQuery(BSTR*);
    HRESULT GetQuery(BSTR*);
    HRESULT GetRawUri(BSTR*);
    HRESULT GetSchemeName(BSTR*);
    HRESULT GetUserInfo(BSTR*);
    HRESULT GetUserName(BSTR*);
    HRESULT GetHostType(uint*);
    HRESULT GetPort(uint*);
    HRESULT GetScheme(uint*);
    HRESULT GetZone(uint*);
    HRESULT GetProperties(uint*);
    HRESULT IsEqual(IUri, BOOL*);
}
enum IID_IUriBuilder = GUID(0x4221b2e1, 0x8955, 0x46c0, [0xbd, 0x5b, 0xde, 0x98, 0x97, 0x56, 0x5d, 0xe7]);
interface IUriBuilder : IUnknown
{
    HRESULT CreateUriSimple(uint, ulong, IUri*);
    HRESULT CreateUri(uint, uint, ulong, IUri*);
    HRESULT CreateUriWithFlags(uint, uint, uint, ulong, IUri*);
    HRESULT GetIUri(IUri*);
    HRESULT SetIUri(IUri);
    HRESULT GetFragment(uint*, const(wchar)**);
    HRESULT GetHost(uint*, const(wchar)**);
    HRESULT GetPassword(uint*, const(wchar)**);
    HRESULT GetPath(uint*, const(wchar)**);
    HRESULT GetPort(BOOL*, uint*);
    HRESULT GetQuery(uint*, const(wchar)**);
    HRESULT GetSchemeName(uint*, const(wchar)**);
    HRESULT GetUserName(uint*, const(wchar)**);
    HRESULT SetFragment(const(wchar)*);
    HRESULT SetHost(const(wchar)*);
    HRESULT SetPassword(const(wchar)*);
    HRESULT SetPath(const(wchar)*);
    HRESULT SetPort(BOOL, uint);
    HRESULT SetQuery(const(wchar)*);
    HRESULT SetSchemeName(const(wchar)*);
    HRESULT SetUserName(const(wchar)*);
    HRESULT RemoveProperties(uint);
    HRESULT HasBeenModified(BOOL*);
}
enum IID_IBindHost = GUID(0xfc4801a1, 0x2ba9, 0x11cf, [0xa2, 0x29, 0x0, 0xaa, 0x0, 0x3d, 0x73, 0x52]);
interface IBindHost : IUnknown
{
    HRESULT CreateMoniker(PWSTR, IBindCtx, IMoniker*, uint);
    HRESULT MonikerBindToStorage(IMoniker, IBindCtx, IBindStatusCallback, const(GUID)*, void**);
    HRESULT MonikerBindToObject(IMoniker, IBindCtx, IBindStatusCallback, const(GUID)*, void**);
}
struct SAFEARRAYBOUND
{
    uint cElements;
    int lLbound;
}
struct SAFEARRAY
{
    ushort cDims;
    ADVANCED_FEATURE_FLAGS fFeatures;
    uint cbElements;
    uint cLocks;
    void* pvData;
    SAFEARRAYBOUND[1] rgsabound;
}
struct VARIANT
{
    union
    {
        struct
        {
            VARENUM vt;
            ushort wReserved1;
            ushort wReserved2;
            ushort wReserved3;
            union
            {
                long llVal;
                int lVal;
                ubyte bVal;
                short iVal;
                float fltVal;
                double dblVal;
                VARIANT_BOOL boolVal;
                VARIANT_BOOL __OBSOLETE__VARIANT_BOOL;
                int scode;
                CY cyVal;
                double date;
                BSTR bstrVal;
                IUnknown punkVal;
                IDispatch pdispVal;
                SAFEARRAY* parray;
                ubyte* pbVal;
                short* piVal;
                int* plVal;
                long* pllVal;
                float* pfltVal;
                double* pdblVal;
                VARIANT_BOOL* pboolVal;
                VARIANT_BOOL* __OBSOLETE__VARIANT_PBOOL;
                int* pscode;
                CY* pcyVal;
                double* pdate;
                BSTR* pbstrVal;
                IUnknown* ppunkVal;
                IDispatch* ppdispVal;
                SAFEARRAY** pparray;
                VARIANT* pvarVal;
                void* byref;
                CHAR cVal;
                ushort uiVal;
                uint ulVal;
                ulong ullVal;
                int intVal;
                uint uintVal;
                DECIMAL* pdecVal;
                PSTR pcVal;
                ushort* puiVal;
                uint* pulVal;
                ulong* pullVal;
                int* pintVal;
                uint* puintVal;
                struct
                {
                    void* pvRecord;
                    IRecordInfo pRecInfo;
                }
            }
        }
        DECIMAL decVal;
    }
}
alias TYPEKIND = int;
enum : int
{
    TKIND_ENUM      = 0x00000000,
    TKIND_RECORD    = 0x00000001,
    TKIND_MODULE    = 0x00000002,
    TKIND_INTERFACE = 0x00000003,
    TKIND_DISPATCH  = 0x00000004,
    TKIND_COCLASS   = 0x00000005,
    TKIND_ALIAS     = 0x00000006,
    TKIND_UNION     = 0x00000007,
    TKIND_MAX       = 0x00000008,
}

struct TYPEDESC
{
    union
    {
        TYPEDESC* lptdesc;
        ARRAYDESC* lpadesc;
        uint hreftype;
    }
    VARENUM vt;
}
struct IDLDESC
{
    ulong dwReserved;
    IDLFLAGS wIDLFlags;
}
struct ELEMDESC
{
    TYPEDESC tdesc;
    union
    {
        IDLDESC idldesc;
        PARAMDESC paramdesc;
    }
}
struct TYPEATTR
{
    GUID guid;
    uint lcid;
    uint dwReserved;
    int memidConstructor;
    int memidDestructor;
    PWSTR lpstrSchema;
    uint cbSizeInstance;
    TYPEKIND typekind;
    ushort cFuncs;
    ushort cVars;
    ushort cImplTypes;
    ushort cbSizeVft;
    ushort cbAlignment;
    ushort wTypeFlags;
    ushort wMajorVerNum;
    ushort wMinorVerNum;
    TYPEDESC tdescAlias;
    IDLDESC idldescType;
}
struct DISPPARAMS
{
    VARIANT* rgvarg;
    int* rgdispidNamedArgs;
    uint cArgs;
    uint cNamedArgs;
}
struct EXCEPINFO
{
    ushort wCode;
    ushort wReserved;
    BSTR bstrSource;
    BSTR bstrDescription;
    BSTR bstrHelpFile;
    uint dwHelpContext;
    void* pvReserved;
    LPEXCEPFINO_DEFERRED_FILLIN pfnDeferredFillIn;
    int scode;
}
alias CALLCONV = int;
enum : int
{
    CC_FASTCALL   = 0x00000000,
    CC_CDECL      = 0x00000001,
    CC_MSCPASCAL  = 0x00000002,
    CC_PASCAL     = 0x00000002,
    CC_MACPASCAL  = 0x00000003,
    CC_STDCALL    = 0x00000004,
    CC_FPFASTCALL = 0x00000005,
    CC_SYSCALL    = 0x00000006,
    CC_MPWCDECL   = 0x00000007,
    CC_MPWPASCAL  = 0x00000008,
    CC_MAX        = 0x00000009,
}

alias FUNCKIND = int;
enum : int
{
    FUNC_VIRTUAL     = 0x00000000,
    FUNC_PUREVIRTUAL = 0x00000001,
    FUNC_NONVIRTUAL  = 0x00000002,
    FUNC_STATIC      = 0x00000003,
    FUNC_DISPATCH    = 0x00000004,
}

alias INVOKEKIND = int;
enum : int
{
    INVOKE_FUNC           = 0x00000001,
    INVOKE_PROPERTYGET    = 0x00000002,
    INVOKE_PROPERTYPUT    = 0x00000004,
    INVOKE_PROPERTYPUTREF = 0x00000008,
}

struct FUNCDESC
{
    int memid;
    int* lprgscode;
    ELEMDESC* lprgelemdescParam;
    FUNCKIND funckind;
    INVOKEKIND invkind;
    CALLCONV callconv;
    short cParams;
    short cParamsOpt;
    short oVft;
    short cScodes;
    ELEMDESC elemdescFunc;
    FUNCFLAGS wFuncFlags;
}
alias VARKIND = int;
enum : int
{
    VAR_PERINSTANCE = 0x00000000,
    VAR_STATIC      = 0x00000001,
    VAR_CONST       = 0x00000002,
    VAR_DISPATCH    = 0x00000003,
}

struct VARDESC
{
    int memid;
    PWSTR lpstrSchema;
    union
    {
        uint oInst;
        VARIANT* lpvarValue;
    }
    ELEMDESC elemdescVar;
    VARFLAGS wVarFlags;
    VARKIND varkind;
}
alias FUNCFLAGS = ushort;
enum : ushort
{
    FUNCFLAG_FRESTRICTED       = 0x0001,
    FUNCFLAG_FSOURCE           = 0x0002,
    FUNCFLAG_FBINDABLE         = 0x0004,
    FUNCFLAG_FREQUESTEDIT      = 0x0008,
    FUNCFLAG_FDISPLAYBIND      = 0x0010,
    FUNCFLAG_FDEFAULTBIND      = 0x0020,
    FUNCFLAG_FHIDDEN           = 0x0040,
    FUNCFLAG_FUSESGETLASTERROR = 0x0080,
    FUNCFLAG_FDEFAULTCOLLELEM  = 0x0100,
    FUNCFLAG_FUIDEFAULT        = 0x0200,
    FUNCFLAG_FNONBROWSABLE     = 0x0400,
    FUNCFLAG_FREPLACEABLE      = 0x0800,
    FUNCFLAG_FIMMEDIATEBIND    = 0x1000,
}

alias VARFLAGS = ushort;
enum : ushort
{
    VARFLAG_FREADONLY        = 0x0001,
    VARFLAG_FSOURCE          = 0x0002,
    VARFLAG_FBINDABLE        = 0x0004,
    VARFLAG_FREQUESTEDIT     = 0x0008,
    VARFLAG_FDISPLAYBIND     = 0x0010,
    VARFLAG_FDEFAULTBIND     = 0x0020,
    VARFLAG_FHIDDEN          = 0x0040,
    VARFLAG_FRESTRICTED      = 0x0080,
    VARFLAG_FDEFAULTCOLLELEM = 0x0100,
    VARFLAG_FUIDEFAULT       = 0x0200,
    VARFLAG_FNONBROWSABLE    = 0x0400,
    VARFLAG_FREPLACEABLE     = 0x0800,
    VARFLAG_FIMMEDIATEBIND   = 0x1000,
}

struct CUSTDATAITEM
{
    GUID guid;
    VARIANT varValue;
}
struct CUSTDATA
{
    uint cCustData;
    CUSTDATAITEM* prgCustData;
}
enum IID_IDispatch = GUID(0x20400, 0x0, 0x0, [0xc0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x46]);
interface IDispatch : IUnknown
{
    HRESULT GetTypeInfoCount(uint*);
    HRESULT GetTypeInfo(uint, uint, ITypeInfo*);
    HRESULT GetIDsOfNames(const(GUID)*, PWSTR*, uint, uint, int*);
    HRESULT Invoke(int, const(GUID)*, uint, DISPATCH_FLAGS, DISPPARAMS*, VARIANT*, EXCEPINFO*, uint*);
}
alias DESCKIND = int;
enum : int
{
    DESCKIND_NONE           = 0x00000000,
    DESCKIND_FUNCDESC       = 0x00000001,
    DESCKIND_VARDESC        = 0x00000002,
    DESCKIND_TYPECOMP       = 0x00000003,
    DESCKIND_IMPLICITAPPOBJ = 0x00000004,
    DESCKIND_MAX            = 0x00000005,
}

union BINDPTR
{
    FUNCDESC* lpfuncdesc;
    VARDESC* lpvardesc;
    ITypeComp lptcomp;
}
enum IID_ITypeComp = GUID(0x20403, 0x0, 0x0, [0xc0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x46]);
interface ITypeComp : IUnknown
{
    HRESULT Bind(PWSTR, uint, ushort, ITypeInfo*, DESCKIND*, BINDPTR*);
    HRESULT BindType(PWSTR, uint, ITypeInfo*, ITypeComp*);
}
enum IID_ITypeInfo = GUID(0x20401, 0x0, 0x0, [0xc0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x46]);
interface ITypeInfo : IUnknown
{
    HRESULT GetTypeAttr(TYPEATTR**);
    HRESULT GetTypeComp(ITypeComp*);
    HRESULT GetFuncDesc(uint, FUNCDESC**);
    HRESULT GetVarDesc(uint, VARDESC**);
    HRESULT GetNames(int, BSTR*, uint, uint*);
    HRESULT GetRefTypeOfImplType(uint, uint*);
    HRESULT GetImplTypeFlags(uint, IMPLTYPEFLAGS*);
    HRESULT GetIDsOfNames(PWSTR*, uint, int*);
    HRESULT Invoke(void*, int, DISPATCH_FLAGS, DISPPARAMS*, VARIANT*, EXCEPINFO*, uint*);
    HRESULT GetDocumentation(int, BSTR*, BSTR*, uint*, BSTR*);
    HRESULT GetDllEntry(int, INVOKEKIND, BSTR*, BSTR*, ushort*);
    HRESULT GetRefTypeInfo(uint, ITypeInfo*);
    HRESULT AddressOfMember(int, INVOKEKIND, void**);
    HRESULT CreateInstance(IUnknown, const(GUID)*, void**);
    HRESULT GetMops(int, BSTR*);
    HRESULT GetContainingTypeLib(ITypeLib*, uint*);
    void ReleaseTypeAttr(TYPEATTR*);
    void ReleaseFuncDesc(FUNCDESC*);
    void ReleaseVarDesc(VARDESC*);
}
enum IID_ITypeInfo2 = GUID(0x20412, 0x0, 0x0, [0xc0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x46]);
interface ITypeInfo2 : ITypeInfo
{
    HRESULT GetTypeKind(TYPEKIND*);
    HRESULT GetTypeFlags(uint*);
    HRESULT GetFuncIndexOfMemId(int, INVOKEKIND, uint*);
    HRESULT GetVarIndexOfMemId(int, uint*);
    HRESULT GetCustData(const(GUID)*, VARIANT*);
    HRESULT GetFuncCustData(uint, const(GUID)*, VARIANT*);
    HRESULT GetParamCustData(uint, uint, const(GUID)*, VARIANT*);
    HRESULT GetVarCustData(uint, const(GUID)*, VARIANT*);
    HRESULT GetImplTypeCustData(uint, const(GUID)*, VARIANT*);
    HRESULT GetDocumentation2(int, uint, BSTR*, uint*, BSTR*);
    HRESULT GetAllCustData(CUSTDATA*);
    HRESULT GetAllFuncCustData(uint, CUSTDATA*);
    HRESULT GetAllParamCustData(uint, uint, CUSTDATA*);
    HRESULT GetAllVarCustData(uint, CUSTDATA*);
    HRESULT GetAllImplTypeCustData(uint, CUSTDATA*);
}
alias SYSKIND = int;
enum : int
{
    SYS_WIN16 = 0x00000000,
    SYS_WIN32 = 0x00000001,
    SYS_MAC   = 0x00000002,
    SYS_WIN64 = 0x00000003,
}

struct TLIBATTR
{
    GUID guid;
    uint lcid;
    SYSKIND syskind;
    ushort wMajorVerNum;
    ushort wMinorVerNum;
    ushort wLibFlags;
}
enum IID_ITypeLib = GUID(0x20402, 0x0, 0x0, [0xc0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x46]);
interface ITypeLib : IUnknown
{
    uint GetTypeInfoCount();
    HRESULT GetTypeInfo(uint, ITypeInfo*);
    HRESULT GetTypeInfoType(uint, TYPEKIND*);
    HRESULT GetTypeInfoOfGuid(const(GUID)*, ITypeInfo*);
    HRESULT GetLibAttr(TLIBATTR**);
    HRESULT GetTypeComp(ITypeComp*);
    HRESULT GetDocumentation(int, BSTR*, BSTR*, uint*, BSTR*);
    HRESULT IsName(PWSTR, uint, BOOL*);
    HRESULT FindName(PWSTR, uint, ITypeInfo*, int*, ushort*);
    void ReleaseTLibAttr(TLIBATTR*);
}
enum IID_ITypeLib2 = GUID(0x20411, 0x0, 0x0, [0xc0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x46]);
interface ITypeLib2 : ITypeLib
{
    HRESULT GetCustData(const(GUID)*, VARIANT*);
    HRESULT GetLibStatistics(uint*, uint*);
    HRESULT GetDocumentation2(int, uint, BSTR*, uint*, BSTR*);
    HRESULT GetAllCustData(CUSTDATA*);
}
enum IID_IErrorInfo = GUID(0x1cf2b120, 0x547d, 0x101b, [0x8e, 0x65, 0x8, 0x0, 0x2b, 0x2b, 0xd1, 0x19]);
interface IErrorInfo : IUnknown
{
    HRESULT GetGUID(GUID*);
    HRESULT GetSource(BSTR*);
    HRESULT GetDescription(BSTR*);
    HRESULT GetHelpFile(BSTR*);
    HRESULT GetHelpContext(uint*);
}
enum IID_ISupportErrorInfo = GUID(0xdf0b3d60, 0x548f, 0x101b, [0x8e, 0x65, 0x8, 0x0, 0x2b, 0x2b, 0xd1, 0x19]);
interface ISupportErrorInfo : IUnknown
{
    HRESULT InterfaceSupportsErrorInfo(const(GUID)*);
}
enum IID_IErrorLog = GUID(0x3127ca40, 0x446e, 0x11ce, [0x81, 0x35, 0x0, 0xaa, 0x0, 0x4b, 0xb8, 0x51]);
interface IErrorLog : IUnknown
{
    HRESULT AddError(const(wchar)*, EXCEPINFO*);
}
enum IID_ITypeLibRegistrationReader = GUID(0xed6a8a2a, 0xb160, 0x4e77, [0x8f, 0x73, 0xaa, 0x74, 0x35, 0xcd, 0x5c, 0x27]);
interface ITypeLibRegistrationReader : IUnknown
{
    HRESULT EnumTypeLibRegistrations(IEnumUnknown*);
}
enum IID_ITypeLibRegistration = GUID(0x76a3e735, 0x2df, 0x4a12, [0x98, 0xeb, 0x4, 0x3a, 0xd3, 0x60, 0xa, 0xf3]);
interface ITypeLibRegistration : IUnknown
{
    HRESULT GetGuid(GUID*);
    HRESULT GetVersion(BSTR*);
    HRESULT GetLcid(uint*);
    HRESULT GetWin32Path(BSTR*);
    HRESULT GetWin64Path(BSTR*);
    HRESULT GetDisplayName(BSTR*);
    HRESULT GetFlags(uint*);
    HRESULT GetHelpDir(BSTR*);
}
struct CONNECTDATA
{
    IUnknown pUnk;
    uint dwCookie;
}
enum IID_IEnumConnections = GUID(0xb196b287, 0xbab4, 0x101a, [0xb6, 0x9c, 0x0, 0xaa, 0x0, 0x34, 0x1d, 0x7]);
interface IEnumConnections : IUnknown
{
    HRESULT Next(uint, CONNECTDATA*, uint*);
    HRESULT Skip(uint);
    HRESULT Reset();
    HRESULT Clone(IEnumConnections*);
}
enum IID_IConnectionPoint = GUID(0xb196b286, 0xbab4, 0x101a, [0xb6, 0x9c, 0x0, 0xaa, 0x0, 0x34, 0x1d, 0x7]);
interface IConnectionPoint : IUnknown
{
    HRESULT GetConnectionInterface(GUID*);
    HRESULT GetConnectionPointContainer(IConnectionPointContainer*);
    HRESULT Advise(IUnknown, uint*);
    HRESULT Unadvise(uint);
    HRESULT EnumConnections(IEnumConnections*);
}
enum IID_IEnumConnectionPoints = GUID(0xb196b285, 0xbab4, 0x101a, [0xb6, 0x9c, 0x0, 0xaa, 0x0, 0x34, 0x1d, 0x7]);
interface IEnumConnectionPoints : IUnknown
{
    HRESULT Next(uint, IConnectionPoint*, uint*);
    HRESULT Skip(uint);
    HRESULT Reset();
    HRESULT Clone(IEnumConnectionPoints*);
}
enum IID_IConnectionPointContainer = GUID(0xb196b284, 0xbab4, 0x101a, [0xb6, 0x9c, 0x0, 0xaa, 0x0, 0x34, 0x1d, 0x7]);
interface IConnectionPointContainer : IUnknown
{
    HRESULT EnumConnectionPoints(IEnumConnectionPoints*);
    HRESULT FindConnectionPoint(const(GUID)*, IConnectionPoint*);
}
enum IID_IPersistMemory = GUID(0xbd1ae5e0, 0xa6ae, 0x11ce, [0xbd, 0x37, 0x50, 0x42, 0x0, 0xc1, 0x0, 0x0]);
interface IPersistMemory : IPersist
{
    HRESULT IsDirty();
    HRESULT Load(void*, uint);
    HRESULT Save(void*, BOOL, uint);
    HRESULT GetSizeMax(uint*);
    HRESULT InitNew();
}
enum IID_IPersistStreamInit = GUID(0x7fd52380, 0x4e07, 0x101b, [0xae, 0x2d, 0x8, 0x0, 0x2b, 0x2e, 0xc7, 0x13]);
interface IPersistStreamInit : IPersist
{
    HRESULT IsDirty();
    HRESULT Load(IStream);
    HRESULT Save(IStream, BOOL);
    HRESULT GetSizeMax(ulong*);
    HRESULT InitNew();
}
