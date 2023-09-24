module windows.win32.system.shutdown;

import windows.win32.foundation : BOOL, BOOLEAN, HWND, PSTR, PWSTR;

version (Windows):
extern (Windows):

alias SHUTDOWN_REASON = uint;
enum : uint
{
    SHTDN_REASON_NONE                           = 0x00000000,
    SHTDN_REASON_FLAG_COMMENT_REQUIRED          = 0x01000000,
    SHTDN_REASON_FLAG_DIRTY_PROBLEM_ID_REQUIRED = 0x02000000,
    SHTDN_REASON_FLAG_CLEAN_UI                  = 0x04000000,
    SHTDN_REASON_FLAG_DIRTY_UI                  = 0x08000000,
    SHTDN_REASON_FLAG_MOBILE_UI_RESERVED        = 0x10000000,
    SHTDN_REASON_FLAG_USER_DEFINED              = 0x40000000,
    SHTDN_REASON_FLAG_PLANNED                   = 0x80000000,
    SHTDN_REASON_MAJOR_OTHER                    = 0x00000000,
    SHTDN_REASON_MAJOR_NONE                     = 0x00000000,
    SHTDN_REASON_MAJOR_HARDWARE                 = 0x00010000,
    SHTDN_REASON_MAJOR_OPERATINGSYSTEM          = 0x00020000,
    SHTDN_REASON_MAJOR_SOFTWARE                 = 0x00030000,
    SHTDN_REASON_MAJOR_APPLICATION              = 0x00040000,
    SHTDN_REASON_MAJOR_SYSTEM                   = 0x00050000,
    SHTDN_REASON_MAJOR_POWER                    = 0x00060000,
    SHTDN_REASON_MAJOR_LEGACY_API               = 0x00070000,
    SHTDN_REASON_MINOR_OTHER                    = 0x00000000,
    SHTDN_REASON_MINOR_NONE                     = 0x000000ff,
    SHTDN_REASON_MINOR_MAINTENANCE              = 0x00000001,
    SHTDN_REASON_MINOR_INSTALLATION             = 0x00000002,
    SHTDN_REASON_MINOR_UPGRADE                  = 0x00000003,
    SHTDN_REASON_MINOR_RECONFIG                 = 0x00000004,
    SHTDN_REASON_MINOR_HUNG                     = 0x00000005,
    SHTDN_REASON_MINOR_UNSTABLE                 = 0x00000006,
    SHTDN_REASON_MINOR_DISK                     = 0x00000007,
    SHTDN_REASON_MINOR_PROCESSOR                = 0x00000008,
    SHTDN_REASON_MINOR_NETWORKCARD              = 0x00000009,
    SHTDN_REASON_MINOR_POWER_SUPPLY             = 0x0000000a,
    SHTDN_REASON_MINOR_CORDUNPLUGGED            = 0x0000000b,
    SHTDN_REASON_MINOR_ENVIRONMENT              = 0x0000000c,
    SHTDN_REASON_MINOR_HARDWARE_DRIVER          = 0x0000000d,
    SHTDN_REASON_MINOR_OTHERDRIVER              = 0x0000000e,
    SHTDN_REASON_MINOR_BLUESCREEN               = 0x0000000f,
    SHTDN_REASON_MINOR_SERVICEPACK              = 0x00000010,
    SHTDN_REASON_MINOR_HOTFIX                   = 0x00000011,
    SHTDN_REASON_MINOR_SECURITYFIX              = 0x00000012,
    SHTDN_REASON_MINOR_SECURITY                 = 0x00000013,
    SHTDN_REASON_MINOR_NETWORK_CONNECTIVITY     = 0x00000014,
    SHTDN_REASON_MINOR_WMI                      = 0x00000015,
    SHTDN_REASON_MINOR_SERVICEPACK_UNINSTALL    = 0x00000016,
    SHTDN_REASON_MINOR_HOTFIX_UNINSTALL         = 0x00000017,
    SHTDN_REASON_MINOR_SECURITYFIX_UNINSTALL    = 0x00000018,
    SHTDN_REASON_MINOR_MMC                      = 0x00000019,
    SHTDN_REASON_MINOR_SYSTEMRESTORE            = 0x0000001a,
    SHTDN_REASON_MINOR_TERMSRV                  = 0x00000020,
    SHTDN_REASON_MINOR_DC_PROMOTION             = 0x00000021,
    SHTDN_REASON_MINOR_DC_DEMOTION              = 0x00000022,
    SHTDN_REASON_UNKNOWN                        = 0x000000ff,
    SHTDN_REASON_LEGACY_API                     = 0x80070000,
    SHTDN_REASON_VALID_BIT_MASK                 = 0xc0ffffff,
}

alias SHUTDOWN_FLAGS = uint;
enum : uint
{
    SHUTDOWN_FORCE_OTHERS          = 0x00000001,
    SHUTDOWN_FORCE_SELF            = 0x00000002,
    SHUTDOWN_RESTART               = 0x00000004,
    SHUTDOWN_POWEROFF              = 0x00000008,
    SHUTDOWN_NOREBOOT              = 0x00000010,
    SHUTDOWN_GRACE_OVERRIDE        = 0x00000020,
    SHUTDOWN_INSTALL_UPDATES       = 0x00000040,
    SHUTDOWN_RESTARTAPPS           = 0x00000080,
    SHUTDOWN_SKIP_SVC_PRESHUTDOWN  = 0x00000100,
    SHUTDOWN_HYBRID                = 0x00000200,
    SHUTDOWN_RESTART_BOOTOPTIONS   = 0x00000400,
    SHUTDOWN_SOFT_REBOOT           = 0x00000800,
    SHUTDOWN_MOBILE_UI             = 0x00001000,
    SHUTDOWN_ARSO                  = 0x00002000,
    SHUTDOWN_CHECK_SAFE_FOR_SERVER = 0x00004000,
    SHUTDOWN_VAIL_CONTAINER        = 0x00008000,
    SHUTDOWN_SYSTEM_INITIATED      = 0x00010000,
}

alias EXIT_WINDOWS_FLAGS = uint;
enum : uint
{
    EWX_LOGOFF                = 0x00000000,
    EWX_SHUTDOWN              = 0x00000001,
    EWX_REBOOT                = 0x00000002,
    EWX_FORCE                 = 0x00000004,
    EWX_POWEROFF              = 0x00000008,
    EWX_FORCEIFHUNG           = 0x00000010,
    EWX_QUICKRESOLVE          = 0x00000020,
    EWX_RESTARTAPPS           = 0x00000040,
    EWX_HYBRID_SHUTDOWN       = 0x00400000,
    EWX_BOOTOPTIONS           = 0x01000000,
    EWX_ARSO                  = 0x04000000,
    EWX_CHECK_SAFE_FOR_SERVER = 0x08000000,
    EWX_SYSTEM_INITIATED      = 0x10000000,
}

BOOL InitiateSystemShutdownA(PSTR, PSTR, uint, BOOL, BOOL);
BOOL InitiateSystemShutdownW(PWSTR, PWSTR, uint, BOOL, BOOL);
BOOL AbortSystemShutdownA(PSTR);
BOOL AbortSystemShutdownW(PWSTR);
BOOL InitiateSystemShutdownExA(PSTR, PSTR, uint, BOOL, BOOL, SHUTDOWN_REASON);
BOOL InitiateSystemShutdownExW(PWSTR, PWSTR, uint, BOOL, BOOL, SHUTDOWN_REASON);
uint InitiateShutdownA(PSTR, PSTR, uint, SHUTDOWN_FLAGS, SHUTDOWN_REASON);
uint InitiateShutdownW(PWSTR, PWSTR, uint, SHUTDOWN_FLAGS, SHUTDOWN_REASON);
uint CheckForHiberboot(BOOLEAN*, BOOLEAN);
BOOL ExitWindowsEx(EXIT_WINDOWS_FLAGS, SHUTDOWN_REASON);
BOOL LockWorkStation();
BOOL ShutdownBlockReasonCreate(HWND, const(wchar)*);
BOOL ShutdownBlockReasonQuery(HWND, PWSTR, uint*);
BOOL ShutdownBlockReasonDestroy(HWND);
enum MAX_REASON_NAME_LEN = 0x00000040;
enum MAX_REASON_DESC_LEN = 0x00000100;
enum MAX_REASON_BUGID_LEN = 0x00000020;
enum MAX_REASON_COMMENT_LEN = 0x00000200;
enum SHUTDOWN_TYPE_LEN = 0x00000020;
enum POLICY_SHOWREASONUI_NEVER = 0x00000000;
enum POLICY_SHOWREASONUI_ALWAYS = 0x00000001;
enum POLICY_SHOWREASONUI_WORKSTATIONONLY = 0x00000002;
enum POLICY_SHOWREASONUI_SERVERONLY = 0x00000003;
enum SNAPSHOT_POLICY_NEVER = 0x00000000;
enum SNAPSHOT_POLICY_ALWAYS = 0x00000001;
enum SNAPSHOT_POLICY_UNPLANNED = 0x00000002;
enum MAX_NUM_REASONS = 0x00000100;
