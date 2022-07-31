module windows.win32.system.restore;

import windows.win32.foundation : BOOL, CHAR, FILETIME;

version (Windows):
extern (Windows):

alias RESTOREPOINTINFO_TYPE = uint;
enum : uint
{
    APPLICATION_INSTALL   = 0x00000000,
    APPLICATION_UNINSTALL = 0x00000001,
    DEVICE_DRIVER_INSTALL = 0x0000000a,
    MODIFY_SETTINGS       = 0x0000000c,
    CANCELLED_OPERATION   = 0x0000000d,
}

alias RESTOREPOINTINFO_EVENT_TYPE = uint;
enum : uint
{
    BEGIN_NESTED_SYSTEM_CHANGE = 0x00000066,
    BEGIN_SYSTEM_CHANGE        = 0x00000064,
    END_NESTED_SYSTEM_CHANGE   = 0x00000067,
    END_SYSTEM_CHANGE          = 0x00000065,
}

BOOL SRSetRestorePointA(RESTOREPOINTINFOA*, STATEMGRSTATUS*);
BOOL SRSetRestorePointW(RESTOREPOINTINFOW*, STATEMGRSTATUS*);
enum MIN_EVENT = 0x00000064;
enum BEGIN_NESTED_SYSTEM_CHANGE_NORP = 0x00000068;
enum MAX_EVENT = 0x00000068;
enum MIN_RPT = 0x00000000;
enum DESKTOP_SETTING = 0x00000002;
enum ACCESSIBILITY_SETTING = 0x00000003;
enum OE_SETTING = 0x00000004;
enum APPLICATION_RUN = 0x00000005;
enum RESTORE = 0x00000006;
enum CHECKPOINT = 0x00000007;
enum WINDOWS_SHUTDOWN = 0x00000008;
enum WINDOWS_BOOT = 0x00000009;
enum FIRSTRUN = 0x0000000b;
enum BACKUP_RECOVERY = 0x0000000e;
enum BACKUP = 0x0000000f;
enum MANUAL_CHECKPOINT = 0x00000010;
enum WINDOWS_UPDATE = 0x00000011;
enum CRITICAL_UPDATE = 0x00000012;
enum MAX_RPT = 0x00000012;
enum MAX_DESC = 0x00000040;
enum MAX_DESC_W = 0x00000100;
struct RESTOREPOINTINFOA
{
    align (1):
    RESTOREPOINTINFO_EVENT_TYPE dwEventType;
    RESTOREPOINTINFO_TYPE dwRestorePtType;
    long llSequenceNumber;
    CHAR[64] szDescription;
}
struct RESTOREPOINTINFOW
{
    align (1):
    RESTOREPOINTINFO_EVENT_TYPE dwEventType;
    RESTOREPOINTINFO_TYPE dwRestorePtType;
    long llSequenceNumber;
    wchar[256] szDescription;
}
struct _RESTOREPTINFOEX
{
    align (1):
    FILETIME ftCreation;
    uint dwEventType;
    uint dwRestorePtType;
    uint dwRPNum;
    wchar[256] szDescription;
}
struct STATEMGRSTATUS
{
    align (1):
    uint nStatus;
    long llSequenceNumber;
}
