module windows.win32.system.services;

import windows.win32.guid : GUID;
import windows.win32.foundation : BOOL, BOOLEAN, HANDLE, PSTR, PWSTR;
import windows.win32.security_ : OBJECT_SECURITY_INFORMATION, PSECURITY_DESCRIPTOR, SC_HANDLE;
import windows.win32.system.registry : HKEY;

version (Windows):
extern (Windows):

BOOL SetServiceBits(SERVICE_STATUS_HANDLE, uint, BOOL, BOOL);
BOOL ChangeServiceConfigA(SC_HANDLE, uint, SERVICE_START_TYPE, SERVICE_ERROR, const(char)*, const(char)*, uint*, const(char)*, const(char)*, const(char)*, const(char)*);
BOOL ChangeServiceConfigW(SC_HANDLE, uint, SERVICE_START_TYPE, SERVICE_ERROR, const(wchar)*, const(wchar)*, uint*, const(wchar)*, const(wchar)*, const(wchar)*, const(wchar)*);
BOOL ChangeServiceConfig2A(SC_HANDLE, SERVICE_CONFIG, void*);
BOOL ChangeServiceConfig2W(SC_HANDLE, SERVICE_CONFIG, void*);
BOOL CloseServiceHandle(SC_HANDLE);
BOOL ControlService(SC_HANDLE, uint, SERVICE_STATUS*);
SC_HANDLE CreateServiceA(SC_HANDLE, const(char)*, const(char)*, uint, ENUM_SERVICE_TYPE, SERVICE_START_TYPE, SERVICE_ERROR, const(char)*, const(char)*, uint*, const(char)*, const(char)*, const(char)*);
SC_HANDLE CreateServiceW(SC_HANDLE, const(wchar)*, const(wchar)*, uint, ENUM_SERVICE_TYPE, SERVICE_START_TYPE, SERVICE_ERROR, const(wchar)*, const(wchar)*, uint*, const(wchar)*, const(wchar)*, const(wchar)*);
BOOL DeleteService(SC_HANDLE);
BOOL EnumDependentServicesA(SC_HANDLE, ENUM_SERVICE_STATE, ENUM_SERVICE_STATUSA*, uint, uint*, uint*);
BOOL EnumDependentServicesW(SC_HANDLE, ENUM_SERVICE_STATE, ENUM_SERVICE_STATUSW*, uint, uint*, uint*);
BOOL EnumServicesStatusA(SC_HANDLE, ENUM_SERVICE_TYPE, ENUM_SERVICE_STATE, ENUM_SERVICE_STATUSA*, uint, uint*, uint*, uint*);
BOOL EnumServicesStatusW(SC_HANDLE, ENUM_SERVICE_TYPE, ENUM_SERVICE_STATE, ENUM_SERVICE_STATUSW*, uint, uint*, uint*, uint*);
BOOL EnumServicesStatusExA(SC_HANDLE, SC_ENUM_TYPE, ENUM_SERVICE_TYPE, ENUM_SERVICE_STATE, ubyte*, uint, uint*, uint*, uint*, const(char)*);
BOOL EnumServicesStatusExW(SC_HANDLE, SC_ENUM_TYPE, ENUM_SERVICE_TYPE, ENUM_SERVICE_STATE, ubyte*, uint, uint*, uint*, uint*, const(wchar)*);
BOOL GetServiceKeyNameA(SC_HANDLE, const(char)*, PSTR, uint*);
BOOL GetServiceKeyNameW(SC_HANDLE, const(wchar)*, PWSTR, uint*);
BOOL GetServiceDisplayNameA(SC_HANDLE, const(char)*, PSTR, uint*);
BOOL GetServiceDisplayNameW(SC_HANDLE, const(wchar)*, PWSTR, uint*);
void* LockServiceDatabase(SC_HANDLE);
BOOL NotifyBootConfigStatus(BOOL);
SC_HANDLE OpenSCManagerA(const(char)*, const(char)*, uint);
SC_HANDLE OpenSCManagerW(const(wchar)*, const(wchar)*, uint);
SC_HANDLE OpenServiceA(SC_HANDLE, const(char)*, uint);
SC_HANDLE OpenServiceW(SC_HANDLE, const(wchar)*, uint);
BOOL QueryServiceConfigA(SC_HANDLE, QUERY_SERVICE_CONFIGA*, uint, uint*);
BOOL QueryServiceConfigW(SC_HANDLE, QUERY_SERVICE_CONFIGW*, uint, uint*);
BOOL QueryServiceConfig2A(SC_HANDLE, SERVICE_CONFIG, ubyte*, uint, uint*);
BOOL QueryServiceConfig2W(SC_HANDLE, SERVICE_CONFIG, ubyte*, uint, uint*);
BOOL QueryServiceLockStatusA(SC_HANDLE, QUERY_SERVICE_LOCK_STATUSA*, uint, uint*);
BOOL QueryServiceLockStatusW(SC_HANDLE, QUERY_SERVICE_LOCK_STATUSW*, uint, uint*);
BOOL QueryServiceObjectSecurity(SC_HANDLE, uint, PSECURITY_DESCRIPTOR, uint, uint*);
BOOL QueryServiceStatus(SC_HANDLE, SERVICE_STATUS*);
BOOL QueryServiceStatusEx(SC_HANDLE, SC_STATUS_TYPE, ubyte*, uint, uint*);
SERVICE_STATUS_HANDLE RegisterServiceCtrlHandlerA(const(char)*, LPHANDLER_FUNCTION);
SERVICE_STATUS_HANDLE RegisterServiceCtrlHandlerW(const(wchar)*, LPHANDLER_FUNCTION);
SERVICE_STATUS_HANDLE RegisterServiceCtrlHandlerExA(const(char)*, LPHANDLER_FUNCTION_EX, void*);
SERVICE_STATUS_HANDLE RegisterServiceCtrlHandlerExW(const(wchar)*, LPHANDLER_FUNCTION_EX, void*);
BOOL SetServiceObjectSecurity(SC_HANDLE, OBJECT_SECURITY_INFORMATION, PSECURITY_DESCRIPTOR);
BOOL SetServiceStatus(SERVICE_STATUS_HANDLE, SERVICE_STATUS*);
BOOL StartServiceCtrlDispatcherA(const(SERVICE_TABLE_ENTRYA)*);
BOOL StartServiceCtrlDispatcherW(const(SERVICE_TABLE_ENTRYW)*);
BOOL StartServiceA(SC_HANDLE, uint, const(char)**);
BOOL StartServiceW(SC_HANDLE, uint, const(wchar)**);
BOOL UnlockServiceDatabase(void*);
uint NotifyServiceStatusChangeA(SC_HANDLE, SERVICE_NOTIFY, SERVICE_NOTIFY_2A*);
uint NotifyServiceStatusChangeW(SC_HANDLE, SERVICE_NOTIFY, SERVICE_NOTIFY_2W*);
BOOL ControlServiceExA(SC_HANDLE, uint, uint, void*);
BOOL ControlServiceExW(SC_HANDLE, uint, uint, void*);
BOOL QueryServiceDynamicInformation(SERVICE_STATUS_HANDLE, uint, void**);
uint WaitServiceState(SC_HANDLE, uint, uint, HANDLE);
uint GetServiceRegistryStateKey(SERVICE_STATUS_HANDLE, SERVICE_REGISTRY_STATE_TYPE, uint, HKEY*);
uint GetServiceDirectory(SERVICE_STATUS_HANDLE, SERVICE_DIRECTORY_TYPE, PWSTR, uint, uint*);
uint GetSharedServiceRegistryStateKey(SC_HANDLE, SERVICE_SHARED_REGISTRY_STATE_TYPE, uint, HKEY*);
uint GetSharedServiceDirectory(SC_HANDLE, SERVICE_SHARED_DIRECTORY_TYPE, PWSTR, uint, uint*);
enum SERVICE_ALL_ACCESS = 0x000f01ff;
enum SC_MANAGER_ALL_ACCESS = 0x000f003f;
enum SERVICES_ACTIVE_DATABASEW = "ServicesActive";
enum SERVICES_FAILED_DATABASEW = "ServicesFailed";
enum SERVICES_ACTIVE_DATABASEA = "ServicesActive";
enum SERVICES_FAILED_DATABASEA = "ServicesFailed";
enum SERVICES_ACTIVE_DATABASE = "ServicesActive";
enum SERVICES_FAILED_DATABASE = "ServicesFailed";
enum SERVICE_NO_CHANGE = 0xffffffff;
enum SERVICE_CONTROL_STOP = 0x00000001;
enum SERVICE_CONTROL_PAUSE = 0x00000002;
enum SERVICE_CONTROL_CONTINUE = 0x00000003;
enum SERVICE_CONTROL_INTERROGATE = 0x00000004;
enum SERVICE_CONTROL_SHUTDOWN = 0x00000005;
enum SERVICE_CONTROL_PARAMCHANGE = 0x00000006;
enum SERVICE_CONTROL_NETBINDADD = 0x00000007;
enum SERVICE_CONTROL_NETBINDREMOVE = 0x00000008;
enum SERVICE_CONTROL_NETBINDENABLE = 0x00000009;
enum SERVICE_CONTROL_NETBINDDISABLE = 0x0000000a;
enum SERVICE_CONTROL_DEVICEEVENT = 0x0000000b;
enum SERVICE_CONTROL_HARDWAREPROFILECHANGE = 0x0000000c;
enum SERVICE_CONTROL_POWEREVENT = 0x0000000d;
enum SERVICE_CONTROL_SESSIONCHANGE = 0x0000000e;
enum SERVICE_CONTROL_PRESHUTDOWN = 0x0000000f;
enum SERVICE_CONTROL_TIMECHANGE = 0x00000010;
enum SERVICE_CONTROL_TRIGGEREVENT = 0x00000020;
enum SERVICE_CONTROL_LOWRESOURCES = 0x00000060;
enum SERVICE_CONTROL_SYSTEMLOWRESOURCES = 0x00000061;
enum SERVICE_ACCEPT_STOP = 0x00000001;
enum SERVICE_ACCEPT_PAUSE_CONTINUE = 0x00000002;
enum SERVICE_ACCEPT_SHUTDOWN = 0x00000004;
enum SERVICE_ACCEPT_PARAMCHANGE = 0x00000008;
enum SERVICE_ACCEPT_NETBINDCHANGE = 0x00000010;
enum SERVICE_ACCEPT_HARDWAREPROFILECHANGE = 0x00000020;
enum SERVICE_ACCEPT_POWEREVENT = 0x00000040;
enum SERVICE_ACCEPT_SESSIONCHANGE = 0x00000080;
enum SERVICE_ACCEPT_PRESHUTDOWN = 0x00000100;
enum SERVICE_ACCEPT_TIMECHANGE = 0x00000200;
enum SERVICE_ACCEPT_TRIGGEREVENT = 0x00000400;
enum SERVICE_ACCEPT_USER_LOGOFF = 0x00000800;
enum SERVICE_ACCEPT_LOWRESOURCES = 0x00002000;
enum SERVICE_ACCEPT_SYSTEMLOWRESOURCES = 0x00004000;
enum SC_MANAGER_CONNECT = 0x00000001;
enum SC_MANAGER_CREATE_SERVICE = 0x00000002;
enum SC_MANAGER_ENUMERATE_SERVICE = 0x00000004;
enum SC_MANAGER_LOCK = 0x00000008;
enum SC_MANAGER_QUERY_LOCK_STATUS = 0x00000010;
enum SC_MANAGER_MODIFY_BOOT_CONFIG = 0x00000020;
enum SERVICE_QUERY_CONFIG = 0x00000001;
enum SERVICE_CHANGE_CONFIG = 0x00000002;
enum SERVICE_QUERY_STATUS = 0x00000004;
enum SERVICE_ENUMERATE_DEPENDENTS = 0x00000008;
enum SERVICE_START = 0x00000010;
enum SERVICE_STOP = 0x00000020;
enum SERVICE_PAUSE_CONTINUE = 0x00000040;
enum SERVICE_INTERROGATE = 0x00000080;
enum SERVICE_USER_DEFINED_CONTROL = 0x00000100;
enum SERVICE_NOTIFY_STATUS_CHANGE_1 = 0x00000001;
enum SERVICE_NOTIFY_STATUS_CHANGE_2 = 0x00000002;
enum SERVICE_NOTIFY_STATUS_CHANGE = 0x00000002;
enum SERVICE_STOP_REASON_FLAG_MIN = 0x00000000;
enum SERVICE_STOP_REASON_FLAG_UNPLANNED = 0x10000000;
enum SERVICE_STOP_REASON_FLAG_CUSTOM = 0x20000000;
enum SERVICE_STOP_REASON_FLAG_PLANNED = 0x40000000;
enum SERVICE_STOP_REASON_FLAG_MAX = 0x80000000;
enum SERVICE_STOP_REASON_MAJOR_MIN = 0x00000000;
enum SERVICE_STOP_REASON_MAJOR_OTHER = 0x00010000;
enum SERVICE_STOP_REASON_MAJOR_HARDWARE = 0x00020000;
enum SERVICE_STOP_REASON_MAJOR_OPERATINGSYSTEM = 0x00030000;
enum SERVICE_STOP_REASON_MAJOR_SOFTWARE = 0x00040000;
enum SERVICE_STOP_REASON_MAJOR_APPLICATION = 0x00050000;
enum SERVICE_STOP_REASON_MAJOR_NONE = 0x00060000;
enum SERVICE_STOP_REASON_MAJOR_MAX = 0x00070000;
enum SERVICE_STOP_REASON_MAJOR_MIN_CUSTOM = 0x00400000;
enum SERVICE_STOP_REASON_MAJOR_MAX_CUSTOM = 0x00ff0000;
enum SERVICE_STOP_REASON_MINOR_MIN = 0x00000000;
enum SERVICE_STOP_REASON_MINOR_OTHER = 0x00000001;
enum SERVICE_STOP_REASON_MINOR_MAINTENANCE = 0x00000002;
enum SERVICE_STOP_REASON_MINOR_INSTALLATION = 0x00000003;
enum SERVICE_STOP_REASON_MINOR_UPGRADE = 0x00000004;
enum SERVICE_STOP_REASON_MINOR_RECONFIG = 0x00000005;
enum SERVICE_STOP_REASON_MINOR_HUNG = 0x00000006;
enum SERVICE_STOP_REASON_MINOR_UNSTABLE = 0x00000007;
enum SERVICE_STOP_REASON_MINOR_DISK = 0x00000008;
enum SERVICE_STOP_REASON_MINOR_NETWORKCARD = 0x00000009;
enum SERVICE_STOP_REASON_MINOR_ENVIRONMENT = 0x0000000a;
enum SERVICE_STOP_REASON_MINOR_HARDWARE_DRIVER = 0x0000000b;
enum SERVICE_STOP_REASON_MINOR_OTHERDRIVER = 0x0000000c;
enum SERVICE_STOP_REASON_MINOR_SERVICEPACK = 0x0000000d;
enum SERVICE_STOP_REASON_MINOR_SOFTWARE_UPDATE = 0x0000000e;
enum SERVICE_STOP_REASON_MINOR_SECURITYFIX = 0x0000000f;
enum SERVICE_STOP_REASON_MINOR_SECURITY = 0x00000010;
enum SERVICE_STOP_REASON_MINOR_NETWORK_CONNECTIVITY = 0x00000011;
enum SERVICE_STOP_REASON_MINOR_WMI = 0x00000012;
enum SERVICE_STOP_REASON_MINOR_SERVICEPACK_UNINSTALL = 0x00000013;
enum SERVICE_STOP_REASON_MINOR_SOFTWARE_UPDATE_UNINSTALL = 0x00000014;
enum SERVICE_STOP_REASON_MINOR_SECURITYFIX_UNINSTALL = 0x00000015;
enum SERVICE_STOP_REASON_MINOR_MMC = 0x00000016;
enum SERVICE_STOP_REASON_MINOR_NONE = 0x00000017;
enum SERVICE_STOP_REASON_MINOR_MEMOTYLIMIT = 0x00000018;
enum SERVICE_STOP_REASON_MINOR_MAX = 0x00000019;
enum SERVICE_STOP_REASON_MINOR_MIN_CUSTOM = 0x00000100;
enum SERVICE_STOP_REASON_MINOR_MAX_CUSTOM = 0x0000ffff;
enum SERVICE_CONTROL_STATUS_REASON_INFO = 0x00000001;
enum SERVICE_SID_TYPE_NONE = 0x00000000;
enum SERVICE_SID_TYPE_UNRESTRICTED = 0x00000001;
enum SERVICE_TRIGGER_TYPE_CUSTOM_SYSTEM_STATE_CHANGE = 0x00000007;
enum SERVICE_TRIGGER_TYPE_AGGREGATE = 0x0000001e;
enum SERVICE_START_REASON_DEMAND = 0x00000001;
enum SERVICE_START_REASON_AUTO = 0x00000002;
enum SERVICE_START_REASON_TRIGGER = 0x00000004;
enum SERVICE_START_REASON_RESTART_ON_FAILURE = 0x00000008;
enum SERVICE_START_REASON_DELAYEDAUTO = 0x00000010;
enum SERVICE_DYNAMIC_INFORMATION_LEVEL_START_REASON = 0x00000001;
enum SERVICE_LAUNCH_PROTECTED_NONE = 0x00000000;
enum SERVICE_LAUNCH_PROTECTED_WINDOWS = 0x00000001;
enum SERVICE_LAUNCH_PROTECTED_WINDOWS_LIGHT = 0x00000002;
enum SERVICE_LAUNCH_PROTECTED_ANTIMALWARE_LIGHT = 0x00000003;
enum NETWORK_MANAGER_FIRST_IP_ADDRESS_ARRIVAL_GUID = GUID(0x4f27f2de, 0x14e2, 0x430b, [0xa5, 0x49, 0x7c, 0xd4, 0x8c, 0xbc, 0x82, 0x45]);
enum NETWORK_MANAGER_LAST_IP_ADDRESS_REMOVAL_GUID = GUID(0xcc4ba62a, 0x162e, 0x4648, [0x84, 0x7a, 0xb6, 0xbd, 0xf9, 0x93, 0xe3, 0x35]);
enum DOMAIN_JOIN_GUID = GUID(0x1ce20aba, 0x9851, 0x4421, [0x94, 0x30, 0x1d, 0xde, 0xb7, 0x66, 0xe8, 0x9]);
enum DOMAIN_LEAVE_GUID = GUID(0xddaf516e, 0x58c2, 0x4866, [0x95, 0x74, 0xc3, 0xb6, 0x15, 0xd4, 0x2e, 0xa1]);
enum FIREWALL_PORT_OPEN_GUID = GUID(0xb7569e07, 0x8421, 0x4ee0, [0xad, 0x10, 0x86, 0x91, 0x5a, 0xfd, 0xad, 0x9]);
enum FIREWALL_PORT_CLOSE_GUID = GUID(0xa144ed38, 0x8e12, 0x4de4, [0x9d, 0x96, 0xe6, 0x47, 0x40, 0xb1, 0xa5, 0x24]);
enum MACHINE_POLICY_PRESENT_GUID = GUID(0x659fcae6, 0x5bdb, 0x4da9, [0xb1, 0xff, 0xca, 0x2a, 0x17, 0x8d, 0x46, 0xe0]);
enum USER_POLICY_PRESENT_GUID = GUID(0x54fb46c8, 0xf089, 0x464c, [0xb1, 0xfd, 0x59, 0xd1, 0xb6, 0x2c, 0x3b, 0x50]);
enum RPC_INTERFACE_EVENT_GUID = GUID(0xbc90d167, 0x9470, 0x4139, [0xa9, 0xba, 0xbe, 0xb, 0xbb, 0xf5, 0xb7, 0x4d]);
enum NAMED_PIPE_EVENT_GUID = GUID(0x1f81d131, 0x3fac, 0x4537, [0x9e, 0xc, 0x7e, 0x7b, 0xc, 0x2f, 0x4b, 0x55]);
enum CUSTOM_SYSTEM_STATE_CHANGE_EVENT_GUID = GUID(0x2d7a2816, 0xc5e, 0x45fc, [0x9c, 0xe7, 0x57, 0xe, 0x5e, 0xcd, 0xe9, 0xc9]);
enum SERVICE_TRIGGER_STARTED_ARGUMENT = "TriggerStarted";
enum SC_AGGREGATE_STORAGE_KEY = "System\\CurrentControlSet\\Control\\ServiceAggregatedEvents";
alias ENUM_SERVICE_STATE = uint;
enum : uint
{
    SERVICE_ACTIVE    = 0x00000001,
    SERVICE_INACTIVE  = 0x00000002,
    SERVICE_STATE_ALL = 0x00000003,
}

alias SERVICE_ERROR = uint;
enum : uint
{
    SERVICE_ERROR_CRITICAL = 0x00000003,
    SERVICE_ERROR_IGNORE   = 0x00000000,
    SERVICE_ERROR_NORMAL   = 0x00000001,
    SERVICE_ERROR_SEVERE   = 0x00000002,
}

alias SERVICE_CONFIG = uint;
enum : uint
{
    SERVICE_CONFIG_DELAYED_AUTO_START_INFO  = 0x00000003,
    SERVICE_CONFIG_DESCRIPTION              = 0x00000001,
    SERVICE_CONFIG_FAILURE_ACTIONS          = 0x00000002,
    SERVICE_CONFIG_FAILURE_ACTIONS_FLAG     = 0x00000004,
    SERVICE_CONFIG_PREFERRED_NODE           = 0x00000009,
    SERVICE_CONFIG_PRESHUTDOWN_INFO         = 0x00000007,
    SERVICE_CONFIG_REQUIRED_PRIVILEGES_INFO = 0x00000006,
    SERVICE_CONFIG_SERVICE_SID_INFO         = 0x00000005,
    SERVICE_CONFIG_TRIGGER_INFO             = 0x00000008,
    SERVICE_CONFIG_LAUNCH_PROTECTED         = 0x0000000c,
}

alias ENUM_SERVICE_TYPE = uint;
enum : uint
{
    SERVICE_DRIVER              = 0x0000000b,
    SERVICE_KERNEL_DRIVER       = 0x00000001,
    SERVICE_WIN32               = 0x00000030,
    SERVICE_WIN32_SHARE_PROCESS = 0x00000020,
    SERVICE_ADAPTER             = 0x00000004,
    SERVICE_FILE_SYSTEM_DRIVER  = 0x00000002,
    SERVICE_RECOGNIZER_DRIVER   = 0x00000008,
    SERVICE_WIN32_OWN_PROCESS   = 0x00000010,
    SERVICE_USER_OWN_PROCESS    = 0x00000050,
    SERVICE_USER_SHARE_PROCESS  = 0x00000060,
}

alias SERVICE_START_TYPE = uint;
enum : uint
{
    SERVICE_AUTO_START   = 0x00000002,
    SERVICE_BOOT_START   = 0x00000000,
    SERVICE_DEMAND_START = 0x00000003,
    SERVICE_DISABLED     = 0x00000004,
    SERVICE_SYSTEM_START = 0x00000001,
}

alias SERVICE_NOTIFY = uint;
enum : uint
{
    SERVICE_NOTIFY_CREATED          = 0x00000080,
    SERVICE_NOTIFY_CONTINUE_PENDING = 0x00000010,
    SERVICE_NOTIFY_DELETE_PENDING   = 0x00000200,
    SERVICE_NOTIFY_DELETED          = 0x00000100,
    SERVICE_NOTIFY_PAUSE_PENDING    = 0x00000020,
    SERVICE_NOTIFY_PAUSED           = 0x00000040,
    SERVICE_NOTIFY_RUNNING          = 0x00000008,
    SERVICE_NOTIFY_START_PENDING    = 0x00000002,
    SERVICE_NOTIFY_STOP_PENDING     = 0x00000004,
    SERVICE_NOTIFY_STOPPED          = 0x00000001,
}

alias SERVICE_RUNS_IN_PROCESS = uint;
enum : uint
{
    SERVICE_RUNS_IN_NON_SYSTEM_OR_NOT_RUNNING = 0x00000000,
    SERVICE_RUNS_IN_SYSTEM_PROCESS            = 0x00000001,
}

alias SERVICE_TRIGGER_ACTION = uint;
enum : uint
{
    SERVICE_TRIGGER_ACTION_SERVICE_START = 0x00000001,
    SERVICE_TRIGGER_ACTION_SERVICE_STOP  = 0x00000002,
}

alias SERVICE_TRIGGER_TYPE = uint;
enum : uint
{
    SERVICE_TRIGGER_TYPE_CUSTOM                   = 0x00000014,
    SERVICE_TRIGGER_TYPE_DEVICE_INTERFACE_ARRIVAL = 0x00000001,
    SERVICE_TRIGGER_TYPE_DOMAIN_JOIN              = 0x00000003,
    SERVICE_TRIGGER_TYPE_FIREWALL_PORT_EVENT      = 0x00000004,
    SERVICE_TRIGGER_TYPE_GROUP_POLICY             = 0x00000005,
    SERVICE_TRIGGER_TYPE_IP_ADDRESS_AVAILABILITY  = 0x00000002,
    SERVICE_TRIGGER_TYPE_NETWORK_ENDPOINT         = 0x00000006,
}

alias SERVICE_TRIGGER_SPECIFIC_DATA_ITEM_DATA_TYPE = uint;
enum : uint
{
    SERVICE_TRIGGER_DATA_TYPE_BINARY      = 0x00000001,
    SERVICE_TRIGGER_DATA_TYPE_STRING      = 0x00000002,
    SERVICE_TRIGGER_DATA_TYPE_LEVEL       = 0x00000003,
    SERVICE_TRIGGER_DATA_TYPE_KEYWORD_ANY = 0x00000004,
    SERVICE_TRIGGER_DATA_TYPE_KEYWORD_ALL = 0x00000005,
}

alias SERVICE_STATUS_CURRENT_STATE = uint;
enum : uint
{
    SERVICE_CONTINUE_PENDING = 0x00000005,
    SERVICE_PAUSE_PENDING    = 0x00000006,
    SERVICE_PAUSED           = 0x00000007,
    SERVICE_RUNNING          = 0x00000004,
    SERVICE_START_PENDING    = 0x00000002,
    SERVICE_STOP_PENDING     = 0x00000003,
    SERVICE_STOPPED          = 0x00000001,
}

alias SERVICE_STATUS_HANDLE = long;
struct SERVICE_TRIGGER_CUSTOM_STATE_ID
{
    uint[2] Data;
}
struct SERVICE_CUSTOM_SYSTEM_STATE_CHANGE_DATA_ITEM
{
    union _u_e__Union
    {
        SERVICE_TRIGGER_CUSTOM_STATE_ID CustomStateId;
        struct _s_e__Struct
        {
            uint DataOffset;
            ubyte[1] Data;
        }
    }
}
struct SERVICE_DESCRIPTIONA
{
    PSTR lpDescription;
}
struct SERVICE_DESCRIPTIONW
{
    PWSTR lpDescription;
}
alias SC_ACTION_TYPE = int;
enum : int
{
    SC_ACTION_NONE        = 0x00000000,
    SC_ACTION_RESTART     = 0x00000001,
    SC_ACTION_REBOOT      = 0x00000002,
    SC_ACTION_RUN_COMMAND = 0x00000003,
    SC_ACTION_OWN_RESTART = 0x00000004,
}

struct SC_ACTION
{
    SC_ACTION_TYPE Type;
    uint Delay;
}
struct SERVICE_FAILURE_ACTIONSA
{
    uint dwResetPeriod;
    PSTR lpRebootMsg;
    PSTR lpCommand;
    uint cActions;
    SC_ACTION* lpsaActions;
}
struct SERVICE_FAILURE_ACTIONSW
{
    uint dwResetPeriod;
    PWSTR lpRebootMsg;
    PWSTR lpCommand;
    uint cActions;
    SC_ACTION* lpsaActions;
}
struct SERVICE_DELAYED_AUTO_START_INFO
{
    BOOL fDelayedAutostart;
}
struct SERVICE_FAILURE_ACTIONS_FLAG
{
    BOOL fFailureActionsOnNonCrashFailures;
}
struct SERVICE_SID_INFO
{
    uint dwServiceSidType;
}
struct SERVICE_REQUIRED_PRIVILEGES_INFOA
{
    PSTR pmszRequiredPrivileges;
}
struct SERVICE_REQUIRED_PRIVILEGES_INFOW
{
    PWSTR pmszRequiredPrivileges;
}
struct SERVICE_PRESHUTDOWN_INFO
{
    uint dwPreshutdownTimeout;
}
struct SERVICE_TRIGGER_SPECIFIC_DATA_ITEM
{
    SERVICE_TRIGGER_SPECIFIC_DATA_ITEM_DATA_TYPE dwDataType;
    uint cbData;
    ubyte* pData;
}
struct SERVICE_TRIGGER
{
    SERVICE_TRIGGER_TYPE dwTriggerType;
    SERVICE_TRIGGER_ACTION dwAction;
    GUID* pTriggerSubtype;
    uint cDataItems;
    SERVICE_TRIGGER_SPECIFIC_DATA_ITEM* pDataItems;
}
struct SERVICE_TRIGGER_INFO
{
    uint cTriggers;
    SERVICE_TRIGGER* pTriggers;
    ubyte* pReserved;
}
struct SERVICE_PREFERRED_NODE_INFO
{
    ushort usPreferredNode;
    BOOLEAN fDelete;
}
struct SERVICE_TIMECHANGE_INFO
{
    long liNewTime;
    long liOldTime;
}
struct SERVICE_LAUNCH_PROTECTED_INFO
{
    uint dwLaunchProtected;
}
alias SC_STATUS_TYPE = int;
enum : int
{
    SC_STATUS_PROCESS_INFO = 0x00000000,
}

alias SC_ENUM_TYPE = int;
enum : int
{
    SC_ENUM_PROCESS_INFO = 0x00000000,
}

struct SERVICE_STATUS
{
    ENUM_SERVICE_TYPE dwServiceType;
    SERVICE_STATUS_CURRENT_STATE dwCurrentState;
    uint dwControlsAccepted;
    uint dwWin32ExitCode;
    uint dwServiceSpecificExitCode;
    uint dwCheckPoint;
    uint dwWaitHint;
}
struct SERVICE_STATUS_PROCESS
{
    ENUM_SERVICE_TYPE dwServiceType;
    SERVICE_STATUS_CURRENT_STATE dwCurrentState;
    uint dwControlsAccepted;
    uint dwWin32ExitCode;
    uint dwServiceSpecificExitCode;
    uint dwCheckPoint;
    uint dwWaitHint;
    uint dwProcessId;
    SERVICE_RUNS_IN_PROCESS dwServiceFlags;
}
struct ENUM_SERVICE_STATUSA
{
    PSTR lpServiceName;
    PSTR lpDisplayName;
    SERVICE_STATUS ServiceStatus;
}
struct ENUM_SERVICE_STATUSW
{
    PWSTR lpServiceName;
    PWSTR lpDisplayName;
    SERVICE_STATUS ServiceStatus;
}
struct ENUM_SERVICE_STATUS_PROCESSA
{
    PSTR lpServiceName;
    PSTR lpDisplayName;
    SERVICE_STATUS_PROCESS ServiceStatusProcess;
}
struct ENUM_SERVICE_STATUS_PROCESSW
{
    PWSTR lpServiceName;
    PWSTR lpDisplayName;
    SERVICE_STATUS_PROCESS ServiceStatusProcess;
}
struct QUERY_SERVICE_LOCK_STATUSA
{
    uint fIsLocked;
    PSTR lpLockOwner;
    uint dwLockDuration;
}
struct QUERY_SERVICE_LOCK_STATUSW
{
    uint fIsLocked;
    PWSTR lpLockOwner;
    uint dwLockDuration;
}
struct QUERY_SERVICE_CONFIGA
{
    ENUM_SERVICE_TYPE dwServiceType;
    SERVICE_START_TYPE dwStartType;
    SERVICE_ERROR dwErrorControl;
    PSTR lpBinaryPathName;
    PSTR lpLoadOrderGroup;
    uint dwTagId;
    PSTR lpDependencies;
    PSTR lpServiceStartName;
    PSTR lpDisplayName;
}
struct QUERY_SERVICE_CONFIGW
{
    ENUM_SERVICE_TYPE dwServiceType;
    SERVICE_START_TYPE dwStartType;
    SERVICE_ERROR dwErrorControl;
    PWSTR lpBinaryPathName;
    PWSTR lpLoadOrderGroup;
    uint dwTagId;
    PWSTR lpDependencies;
    PWSTR lpServiceStartName;
    PWSTR lpDisplayName;
}
alias SERVICE_MAIN_FUNCTIONW = void function(uint, PWSTR*);
alias SERVICE_MAIN_FUNCTIONA = void function(uint, byte**);
alias LPSERVICE_MAIN_FUNCTIONW = void function(uint, PWSTR*);
alias LPSERVICE_MAIN_FUNCTIONA = void function(uint, PSTR*);
struct SERVICE_TABLE_ENTRYA
{
    PSTR lpServiceName;
    LPSERVICE_MAIN_FUNCTIONA lpServiceProc;
}
struct SERVICE_TABLE_ENTRYW
{
    PWSTR lpServiceName;
    LPSERVICE_MAIN_FUNCTIONW lpServiceProc;
}
alias HANDLER_FUNCTION = void function(uint);
alias HANDLER_FUNCTION_EX = uint function(uint, uint, void*, void*);
alias LPHANDLER_FUNCTION = void function(uint);
alias LPHANDLER_FUNCTION_EX = uint function(uint, uint, void*, void*);
alias PFN_SC_NOTIFY_CALLBACK = void function(void*);
struct SERVICE_NOTIFY_1
{
    uint dwVersion;
    PFN_SC_NOTIFY_CALLBACK pfnNotifyCallback;
    void* pContext;
    uint dwNotificationStatus;
    SERVICE_STATUS_PROCESS ServiceStatus;
}
struct SERVICE_NOTIFY_2A
{
    uint dwVersion;
    PFN_SC_NOTIFY_CALLBACK pfnNotifyCallback;
    void* pContext;
    uint dwNotificationStatus;
    SERVICE_STATUS_PROCESS ServiceStatus;
    uint dwNotificationTriggered;
    PSTR pszServiceNames;
}
struct SERVICE_NOTIFY_2W
{
    uint dwVersion;
    PFN_SC_NOTIFY_CALLBACK pfnNotifyCallback;
    void* pContext;
    uint dwNotificationStatus;
    SERVICE_STATUS_PROCESS ServiceStatus;
    uint dwNotificationTriggered;
    PWSTR pszServiceNames;
}
struct SERVICE_CONTROL_STATUS_REASON_PARAMSA
{
    uint dwReason;
    PSTR pszComment;
    SERVICE_STATUS_PROCESS ServiceStatus;
}
struct SERVICE_CONTROL_STATUS_REASON_PARAMSW
{
    uint dwReason;
    PWSTR pszComment;
    SERVICE_STATUS_PROCESS ServiceStatus;
}
struct SERVICE_START_REASON
{
    uint dwReason;
}
alias SC_EVENT_TYPE = int;
enum : int
{
    SC_EVENT_DATABASE_CHANGE = 0x00000000,
    SC_EVENT_PROPERTY_CHANGE = 0x00000001,
    SC_EVENT_STATUS_CHANGE   = 0x00000002,
}

alias PSC_NOTIFICATION_CALLBACK = void function(uint, void*);
struct _SC_NOTIFICATION_REGISTRATION
{
}
alias SERVICE_REGISTRY_STATE_TYPE = int;
enum : int
{
    ServiceRegistryStateParameters = 0x00000000,
    ServiceRegistryStatePersistent = 0x00000001,
    MaxServiceRegistryStateType    = 0x00000002,
}

alias SERVICE_DIRECTORY_TYPE = int;
enum : int
{
    ServiceDirectoryPersistentState = 0x00000000,
    ServiceDirectoryTypeMax         = 0x00000001,
}

alias SERVICE_SHARED_REGISTRY_STATE_TYPE = int;
enum : int
{
    ServiceSharedRegistryPersistentState = 0x00000000,
}

alias SERVICE_SHARED_DIRECTORY_TYPE = int;
enum : int
{
    ServiceSharedDirectoryPersistentState = 0x00000000,
}

