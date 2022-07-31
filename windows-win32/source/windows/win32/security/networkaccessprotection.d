module windows.win32.security.networkaccessprotection;

import windows.win32.guid : GUID;
import windows.win32.foundation : BOOL, FILETIME, HRESULT, PWSTR;

version (Windows):
extern (Windows):

enum maxSoHAttributeCount = 0x00000064;
enum maxSoHAttributeSize = 0x00000fa0;
enum minNetworkSoHSize = 0x0000000c;
enum maxNetworkSoHSize = 0x00000fa0;
enum maxStringLength = 0x00000400;
enum maxSystemHealthEntityCount = 0x00000014;
enum maxEnforcerCount = 0x00000014;
enum maxPrivateDataSize = 0x000000c8;
enum maxConnectionCountPerEnforcer = 0x00000014;
enum freshSoHRequest = 0x00000001;
enum shaFixup = 0x00000001;
enum failureCategoryCount = 0x00000005;
enum ComponentTypeEnforcementClientSoH = 0x00000001;
enum ComponentTypeEnforcementClientRp = 0x00000002;
enum percentageNotSupported = 0x00000065;
alias IsolationState = int;
enum : int
{
    isolationStateNotRestricted    = 0x00000001,
    isolationStateInProbation      = 0x00000002,
    isolationStateRestrictedAccess = 0x00000003,
}

alias ExtendedIsolationState = int;
enum : int
{
    extendedIsolationStateNoData     = 0x00000000,
    extendedIsolationStateTransition = 0x00000001,
    extendedIsolationStateInfected   = 0x00000002,
    extendedIsolationStateUnknown    = 0x00000003,
}

alias NapTracingLevel = int;
enum : int
{
    tracingLevelUndefined = 0x00000000,
    tracingLevelBasic     = 0x00000001,
    tracingLevelAdvanced  = 0x00000002,
    tracingLevelDebug     = 0x00000003,
}

struct CountedString
{
    ushort length;
    PWSTR string;
}
struct IsolationInfo
{
    IsolationState isolationState;
    FILETIME probEndTime;
    CountedString failureUrl;
}
struct IsolationInfoEx
{
    IsolationState isolationState;
    ExtendedIsolationState extendedIsolationState;
    FILETIME probEndTime;
    CountedString failureUrl;
}
alias FailureCategory = int;
enum : int
{
    failureCategoryNone                = 0x00000000,
    failureCategoryOther               = 0x00000001,
    failureCategoryClientComponent     = 0x00000002,
    failureCategoryClientCommunication = 0x00000003,
    failureCategoryServerComponent     = 0x00000004,
    failureCategoryServerCommunication = 0x00000005,
}

struct FailureCategoryMapping
{
    BOOL[5] mappingCompliance;
}
struct CorrelationId
{
    GUID connId;
    FILETIME timeStamp;
}
struct ResultCodes
{
    ushort count;
    HRESULT* results;
}
struct Ipv4Address
{
    ubyte[4] addr;
}
struct Ipv6Address
{
    ubyte[16] addr;
}
alias FixupState = int;
enum : int
{
    fixupStateSuccess        = 0x00000000,
    fixupStateInProgress     = 0x00000001,
    fixupStateCouldNotUpdate = 0x00000002,
}

struct FixupInfo
{
    FixupState state;
    ubyte percentage;
    ResultCodes resultCodes;
    uint fixupMsgId;
}
alias NapNotifyType = int;
enum : int
{
    napNotifyTypeUnknown      = 0x00000000,
    napNotifyTypeServiceState = 0x00000001,
    napNotifyTypeQuarState    = 0x00000002,
}

struct SystemHealthAgentState
{
    uint id;
    ResultCodes shaResultCodes;
    FailureCategory failureCategory;
    FixupInfo fixupInfo;
}
struct SoHAttribute
{
    ushort type;
    ushort size;
    ubyte* value;
}
struct SoH
{
    ushort count;
    SoHAttribute* attributes;
}
struct NetworkSoH
{
    ushort size;
    ubyte* data;
}
struct PrivateData
{
    ushort size;
    ubyte* data;
}
struct NapComponentRegistrationInfo
{
    uint id;
    CountedString friendlyName;
    CountedString description;
    CountedString version_;
    CountedString vendorName;
    GUID infoClsid;
    GUID configClsid;
    FILETIME registrationDate;
    uint componentType;
}
alias RemoteConfigurationType = int;
enum : int
{
    remoteConfigTypeMachine    = 0x00000001,
    remoteConfigTypeConfigBlob = 0x00000002,
}

