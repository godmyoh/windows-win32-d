module windows.win32.networkmanagement.networkdiagnosticsframework;

import windows.win32.guid : GUID;
import windows.win32.foundation : BOOL, CHAR, FILETIME, HRESULT, HWND, PWSTR;
import windows.win32.networking.winsock : SOCKET, SOCKET_ADDRESS_LIST;
import windows.win32.security : SID;
import windows.win32.system.com : IUnknown;

version (Windows):
extern (Windows):

HRESULT NdfCreateIncident(const(wchar)*, uint, HELPER_ATTRIBUTE*, void**);
HRESULT NdfCreateWinSockIncident(SOCKET, const(wchar)*, ushort, const(wchar)*, SID*, void**);
HRESULT NdfCreateWebIncident(const(wchar)*, void**);
HRESULT NdfCreateWebIncidentEx(const(wchar)*, BOOL, PWSTR, void**);
HRESULT NdfCreateSharingIncident(const(wchar)*, void**);
HRESULT NdfCreateDNSIncident(const(wchar)*, ushort, void**);
HRESULT NdfCreateConnectivityIncident(void**);
HRESULT NdfCreateNetConnectionIncident(void**, GUID);
HRESULT NdfCreatePnrpIncident(const(wchar)*, const(wchar)*, BOOL, const(wchar)*, void**);
HRESULT NdfCreateGroupingIncident(const(wchar)*, const(wchar)*, const(wchar)*, const(wchar)*, SOCKET_ADDRESS_LIST*, const(wchar)*, void**);
HRESULT NdfExecuteDiagnosis(void*, HWND);
HRESULT NdfCloseIncident(void*);
HRESULT NdfDiagnoseIncident(void*, uint*, RootCauseInfo**, uint, uint);
HRESULT NdfRepairIncident(void*, RepairInfoEx*, uint);
HRESULT NdfCancelIncident(void*);
HRESULT NdfGetTraceFile(void*, const(wchar)**);
enum NDF_ERROR_START = 0x0000f900;
enum NDF_E_LENGTH_EXCEEDED = 0xffffffff8008f900;
enum NDF_E_NOHELPERCLASS = 0xffffffff8008f901;
enum NDF_E_CANCELLED = 0xffffffff8008f902;
enum NDF_E_DISABLED = 0xffffffff8008f904;
enum NDF_E_BAD_PARAM = 0xffffffff8008f905;
enum NDF_E_VALIDATION = 0xffffffff8008f906;
enum NDF_E_UNKNOWN = 0xffffffff8008f907;
enum NDF_E_PROBLEM_PRESENT = 0xffffffff8008f908;
enum RF_WORKAROUND = 0x20000000;
enum RF_USER_ACTION = 0x10000000;
enum RF_USER_CONFIRMATION = 0x08000000;
enum RF_INFORMATION_ONLY = 0x02000000;
enum RF_UI_ONLY = 0x01000000;
enum RF_SHOW_EVENTS = 0x00800000;
enum RF_VALIDATE_HELPTOPIC = 0x00400000;
enum RF_REPRO = 0x00200000;
enum RF_CONTACT_ADMIN = 0x00020000;
enum RF_RESERVED = 0x40000000;
enum RF_RESERVED_CA = 0x80000000;
enum RF_RESERVED_LNI = 0x00010000;
enum RCF_ISLEAF = 0x00000001;
enum RCF_ISCONFIRMED = 0x00000002;
enum RCF_ISTHIRDPARTY = 0x00000004;
enum DF_IMPERSONATION = 0x80000000;
enum DF_TRACELESS = 0x40000000;
enum NDF_INBOUND_FLAG_EDGETRAVERSAL = 0x00000001;
enum NDF_INBOUND_FLAG_HEALTHCHECK = 0x00000002;
enum NDF_ADD_CAPTURE_TRACE = 0x00000001;
enum NDF_APPLY_INCLUSION_LIST_FILTER = 0x00000002;
alias ATTRIBUTE_TYPE = int;
enum : int
{
    AT_INVALID      = 0x00000000,
    AT_BOOLEAN      = 0x00000001,
    AT_INT8         = 0x00000002,
    AT_UINT8        = 0x00000003,
    AT_INT16        = 0x00000004,
    AT_UINT16       = 0x00000005,
    AT_INT32        = 0x00000006,
    AT_UINT32       = 0x00000007,
    AT_INT64        = 0x00000008,
    AT_UINT64       = 0x00000009,
    AT_STRING       = 0x0000000a,
    AT_GUID         = 0x0000000b,
    AT_LIFE_TIME    = 0x0000000c,
    AT_SOCKADDR     = 0x0000000d,
    AT_OCTET_STRING = 0x0000000e,
}

struct OCTET_STRING
{
    uint dwLength;
    ubyte* lpValue;
}
struct LIFE_TIME
{
    FILETIME startTime;
    FILETIME endTime;
}
struct DIAG_SOCKADDR
{
    ushort family;
    CHAR[126] data;
}
struct HELPER_ATTRIBUTE
{
    PWSTR pwszName;
    ATTRIBUTE_TYPE type;
    union
    {
        BOOL Boolean;
        ubyte Char;
        ubyte Byte;
        short Short;
        ushort Word;
        int Int;
        uint DWord;
        long Int64;
        ulong UInt64;
        PWSTR PWStr;
        GUID Guid;
        LIFE_TIME LifeTime;
        DIAG_SOCKADDR Address;
        OCTET_STRING OctetString;
    }
}
alias REPAIR_SCOPE = int;
enum : int
{
    RS_SYSTEM      = 0x00000000,
    RS_USER        = 0x00000001,
    RS_APPLICATION = 0x00000002,
    RS_PROCESS     = 0x00000003,
}

alias REPAIR_RISK = int;
enum : int
{
    RR_NOROLLBACK = 0x00000000,
    RR_ROLLBACK   = 0x00000001,
    RR_NORISK     = 0x00000002,
}

alias UI_INFO_TYPE = int;
enum : int
{
    UIT_INVALID       = 0x00000000,
    UIT_NONE          = 0x00000001,
    UIT_SHELL_COMMAND = 0x00000002,
    UIT_HELP_PANE     = 0x00000003,
    UIT_DUI           = 0x00000004,
}

struct ShellCommandInfo
{
    PWSTR pwszOperation;
    PWSTR pwszFile;
    PWSTR pwszParameters;
    PWSTR pwszDirectory;
    uint nShowCmd;
}
struct UiInfo
{
    UI_INFO_TYPE type;
    union
    {
        PWSTR pwzNull;
        ShellCommandInfo ShellInfo;
        PWSTR pwzHelpUrl;
        PWSTR pwzDui;
    }
}
struct RepairInfo
{
    GUID guid;
    PWSTR pwszClassName;
    PWSTR pwszDescription;
    uint sidType;
    int cost;
    uint flags;
    REPAIR_SCOPE scope_;
    REPAIR_RISK risk;
    UiInfo UiInfo_;
    int rootCauseIndex;
}
struct RepairInfoEx
{
    RepairInfo repair;
    ushort repairRank;
}
struct RootCauseInfo
{
    PWSTR pwszDescription;
    GUID rootCauseID;
    uint rootCauseFlags;
    GUID networkInterfaceID;
    RepairInfoEx* pRepairs;
    ushort repairCount;
}
alias DIAGNOSIS_STATUS = int;
enum : int
{
    DS_NOT_IMPLEMENTED = 0x00000000,
    DS_CONFIRMED       = 0x00000001,
    DS_REJECTED        = 0x00000002,
    DS_INDETERMINATE   = 0x00000003,
    DS_DEFERRED        = 0x00000004,
    DS_PASSTHROUGH     = 0x00000005,
}

alias REPAIR_STATUS = int;
enum : int
{
    RS_NOT_IMPLEMENTED = 0x00000000,
    RS_REPAIRED        = 0x00000001,
    RS_UNREPAIRED      = 0x00000002,
    RS_DEFERRED        = 0x00000003,
    RS_USER_ACTION     = 0x00000004,
}

alias PROBLEM_TYPE = int;
enum : int
{
    PT_INVALID               = 0x00000000,
    PT_LOW_HEALTH            = 0x00000001,
    PT_LOWER_HEALTH          = 0x00000002,
    PT_DOWN_STREAM_HEALTH    = 0x00000004,
    PT_HIGH_UTILIZATION      = 0x00000008,
    PT_HIGHER_UTILIZATION    = 0x00000010,
    PT_UP_STREAM_UTILIZATION = 0x00000020,
}

struct HYPOTHESIS
{
    PWSTR pwszClassName;
    PWSTR pwszDescription;
    uint celt;
    HELPER_ATTRIBUTE* rgAttributes;
}
struct HelperAttributeInfo
{
    PWSTR pwszName;
    ATTRIBUTE_TYPE type;
}
struct DiagnosticsInfo
{
    int cost;
    uint flags;
}
enum IID_INetDiagHelper = GUID(0xc0b35746, 0xebf5, 0x11d8, [0xbb, 0xe9, 0x50, 0x50, 0x54, 0x50, 0x30, 0x30]);
interface INetDiagHelper : IUnknown
{
    HRESULT Initialize(uint, HELPER_ATTRIBUTE*);
    HRESULT GetDiagnosticsInfo(DiagnosticsInfo**);
    HRESULT GetKeyAttributes(uint*, HELPER_ATTRIBUTE**);
    HRESULT LowHealth(const(wchar)*, PWSTR*, int*, DIAGNOSIS_STATUS*);
    HRESULT HighUtilization(const(wchar)*, PWSTR*, int*, DIAGNOSIS_STATUS*);
    HRESULT GetLowerHypotheses(uint*, HYPOTHESIS**);
    HRESULT GetDownStreamHypotheses(uint*, HYPOTHESIS**);
    HRESULT GetHigherHypotheses(uint*, HYPOTHESIS**);
    HRESULT GetUpStreamHypotheses(uint*, HYPOTHESIS**);
    HRESULT Repair(RepairInfo*, int*, REPAIR_STATUS*);
    HRESULT Validate(PROBLEM_TYPE, int*, REPAIR_STATUS*);
    HRESULT GetRepairInfo(PROBLEM_TYPE, uint*, RepairInfo**);
    HRESULT GetLifeTime(LIFE_TIME*);
    HRESULT SetLifeTime(LIFE_TIME);
    HRESULT GetCacheTime(FILETIME*);
    HRESULT GetAttributes(uint*, HELPER_ATTRIBUTE**);
    HRESULT Cancel();
    HRESULT Cleanup();
}
struct HypothesisResult
{
    HYPOTHESIS hypothesis;
    DIAGNOSIS_STATUS pathStatus;
}
enum IID_INetDiagHelperUtilFactory = GUID(0x104613fb, 0xbc57, 0x4178, [0x95, 0xba, 0x88, 0x80, 0x96, 0x98, 0x35, 0x4a]);
interface INetDiagHelperUtilFactory : IUnknown
{
    HRESULT CreateUtilityInstance(const(GUID)*, void**);
}
enum IID_INetDiagHelperEx = GUID(0x972dab4d, 0xe4e3, 0x4fc6, [0xae, 0x54, 0x5f, 0x65, 0xcc, 0xde, 0x4a, 0x15]);
interface INetDiagHelperEx : IUnknown
{
    HRESULT ReconfirmLowHealth(uint, HypothesisResult*, PWSTR*, DIAGNOSIS_STATUS*);
    HRESULT SetUtilities(INetDiagHelperUtilFactory);
    HRESULT ReproduceFailure();
}
enum IID_INetDiagHelperInfo = GUID(0xc0b35747, 0xebf5, 0x11d8, [0xbb, 0xe9, 0x50, 0x50, 0x54, 0x50, 0x30, 0x30]);
interface INetDiagHelperInfo : IUnknown
{
    HRESULT GetAttributeInfo(uint*, HelperAttributeInfo**);
}
enum IID_INetDiagExtensibleHelper = GUID(0xc0b35748, 0xebf5, 0x11d8, [0xbb, 0xe9, 0x50, 0x50, 0x54, 0x50, 0x30, 0x30]);
interface INetDiagExtensibleHelper : IUnknown
{
    HRESULT ResolveAttributes(uint, HELPER_ATTRIBUTE*, uint*, HELPER_ATTRIBUTE**);
}
