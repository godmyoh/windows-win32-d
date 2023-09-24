module windows.win32.system.restartmanager;

import windows.win32.foundation : BOOL, FILETIME, PWSTR, WIN32_ERROR;

version (Windows):
extern (Windows):

WIN32_ERROR RmStartSession(uint*, uint, PWSTR);
WIN32_ERROR RmJoinSession(uint*, const(wchar)*);
WIN32_ERROR RmEndSession(uint);
WIN32_ERROR RmRegisterResources(uint, uint, const(wchar)**, uint, RM_UNIQUE_PROCESS*, uint, const(wchar)**);
WIN32_ERROR RmGetList(uint, uint*, uint*, RM_PROCESS_INFO*, uint*);
WIN32_ERROR RmShutdown(uint, uint, RM_WRITE_STATUS_CALLBACK);
WIN32_ERROR RmRestart(uint, uint, RM_WRITE_STATUS_CALLBACK);
WIN32_ERROR RmCancelCurrentTask(uint);
WIN32_ERROR RmAddFilter(uint, const(wchar)*, RM_UNIQUE_PROCESS*, const(wchar)*, RM_FILTER_ACTION);
WIN32_ERROR RmRemoveFilter(uint, const(wchar)*, RM_UNIQUE_PROCESS*, const(wchar)*);
WIN32_ERROR RmGetFilterList(uint, ubyte*, uint, uint*);
enum CCH_RM_SESSION_KEY = 0x00000020;
enum CCH_RM_MAX_APP_NAME = 0x000000ff;
enum CCH_RM_MAX_SVC_NAME = 0x0000003f;
enum RM_INVALID_TS_SESSION = 0xffffffffffffffff;
enum RM_INVALID_PROCESS = 0xffffffffffffffff;
alias RM_APP_TYPE = int;
enum : int
{
    RmUnknownApp  = 0x00000000,
    RmMainWindow  = 0x00000001,
    RmOtherWindow = 0x00000002,
    RmService     = 0x00000003,
    RmExplorer    = 0x00000004,
    RmConsole     = 0x00000005,
    RmCritical    = 0x000003e8,
}

alias RM_SHUTDOWN_TYPE = int;
enum : int
{
    RmForceShutdown          = 0x00000001,
    RmShutdownOnlyRegistered = 0x00000010,
}

alias RM_APP_STATUS = int;
enum : int
{
    RmStatusUnknown        = 0x00000000,
    RmStatusRunning        = 0x00000001,
    RmStatusStopped        = 0x00000002,
    RmStatusStoppedOther   = 0x00000004,
    RmStatusRestarted      = 0x00000008,
    RmStatusErrorOnStop    = 0x00000010,
    RmStatusErrorOnRestart = 0x00000020,
    RmStatusShutdownMasked = 0x00000040,
    RmStatusRestartMasked  = 0x00000080,
}

alias RM_REBOOT_REASON = int;
enum : int
{
    RmRebootReasonNone             = 0x00000000,
    RmRebootReasonPermissionDenied = 0x00000001,
    RmRebootReasonSessionMismatch  = 0x00000002,
    RmRebootReasonCriticalProcess  = 0x00000004,
    RmRebootReasonCriticalService  = 0x00000008,
    RmRebootReasonDetectedSelf     = 0x00000010,
}

struct RM_UNIQUE_PROCESS
{
    uint dwProcessId;
    FILETIME ProcessStartTime;
}
struct RM_PROCESS_INFO
{
    RM_UNIQUE_PROCESS Process;
    wchar[256] strAppName;
    wchar[64] strServiceShortName;
    RM_APP_TYPE ApplicationType;
    uint AppStatus;
    uint TSSessionId;
    BOOL bRestartable;
}
alias RM_FILTER_TRIGGER = int;
enum : int
{
    RmFilterTriggerInvalid = 0x00000000,
    RmFilterTriggerFile    = 0x00000001,
    RmFilterTriggerProcess = 0x00000002,
    RmFilterTriggerService = 0x00000003,
}

alias RM_FILTER_ACTION = int;
enum : int
{
    RmInvalidFilterAction = 0x00000000,
    RmNoRestart           = 0x00000001,
    RmNoShutdown          = 0x00000002,
}

struct RM_FILTER_INFO
{
    RM_FILTER_ACTION FilterAction;
    RM_FILTER_TRIGGER FilterTrigger;
    uint cbNextOffset;
    union
    {
        PWSTR strFilename;
        RM_UNIQUE_PROCESS Process;
        PWSTR strServiceShortName;
    }
}
alias RM_WRITE_STATUS_CALLBACK = void function(uint);
