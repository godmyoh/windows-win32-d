module windows.win32.system.stationsanddesktops;

import windows.win32.foundation : BOOL, HANDLE, HWND, LPARAM, LUID, PSTR, PWSTR, WPARAM;
import windows.win32.graphics.gdi : DEVMODEA, DEVMODEW;
import windows.win32.security : SECURITY_ATTRIBUTES;
import windows.win32.ui.windowsandmessaging : WNDENUMPROC;

version (Windows):
extern (Windows):

alias BROADCAST_SYSTEM_MESSAGE_FLAGS = uint;
enum : uint
{
    BSF_ALLOWSFW           = 0x00000080,
    BSF_FLUSHDISK          = 0x00000004,
    BSF_FORCEIFHUNG        = 0x00000020,
    BSF_IGNORECURRENTTASK  = 0x00000002,
    BSF_NOHANG             = 0x00000008,
    BSF_NOTIMEOUTIFNOTHUNG = 0x00000040,
    BSF_POSTMESSAGE        = 0x00000010,
    BSF_QUERY              = 0x00000001,
    BSF_SENDNOTIFYMESSAGE  = 0x00000100,
    BSF_LUID               = 0x00000400,
    BSF_RETURNHDESK        = 0x00000200,
}

alias BROADCAST_SYSTEM_MESSAGE_INFO = uint;
enum : uint
{
    BSM_ALLCOMPONENTS = 0x00000000,
    BSM_ALLDESKTOPS   = 0x00000010,
    BSM_APPLICATIONS  = 0x00000008,
}

alias USER_OBJECT_INFORMATION_INDEX = int;
enum : int
{
    UOI_FLAGS    = 0x00000001,
    UOI_HEAPSIZE = 0x00000005,
    UOI_IO       = 0x00000006,
    UOI_NAME     = 0x00000002,
    UOI_TYPE     = 0x00000003,
    UOI_USER_SID = 0x00000004,
}

alias DESKTOP_CONTROL_FLAGS = uint;
enum : uint
{
    DF_ALLOWOTHERACCOUNTHOOK = 0x00000001,
}

alias DESKTOP_ACCESS_FLAGS = uint;
enum : uint
{
    DESKTOP_DELETE          = 0x00010000,
    DESKTOP_READ_CONTROL    = 0x00020000,
    DESKTOP_WRITE_DAC       = 0x00040000,
    DESKTOP_WRITE_OWNER     = 0x00080000,
    DESKTOP_SYNCHRONIZE     = 0x00100000,
    DESKTOP_READOBJECTS     = 0x00000001,
    DESKTOP_CREATEWINDOW    = 0x00000002,
    DESKTOP_CREATEMENU      = 0x00000004,
    DESKTOP_HOOKCONTROL     = 0x00000008,
    DESKTOP_JOURNALRECORD   = 0x00000010,
    DESKTOP_JOURNALPLAYBACK = 0x00000020,
    DESKTOP_ENUMERATE       = 0x00000040,
    DESKTOP_WRITEOBJECTS    = 0x00000080,
    DESKTOP_SWITCHDESKTOP   = 0x00000100,
}

alias WINSTAENUMPROCA = BOOL function(PSTR, LPARAM);
alias WINSTAENUMPROCW = BOOL function(PWSTR, LPARAM);
alias DESKTOPENUMPROCA = BOOL function(PSTR, LPARAM);
alias DESKTOPENUMPROCW = BOOL function(PWSTR, LPARAM);
alias HWINSTA = void*;
alias HDESK = void*;
struct USEROBJECTFLAGS
{
    BOOL fInherit;
    BOOL fReserved;
    uint dwFlags;
}
struct BSMINFO
{
    uint cbSize;
    HDESK hdesk;
    HWND hwnd;
    LUID luid;
}
HDESK CreateDesktopA(const(char)*, const(char)*, DEVMODEA*, DESKTOP_CONTROL_FLAGS, uint, SECURITY_ATTRIBUTES*);
HDESK CreateDesktopW(const(wchar)*, const(wchar)*, DEVMODEW*, DESKTOP_CONTROL_FLAGS, uint, SECURITY_ATTRIBUTES*);
HDESK CreateDesktopExA(const(char)*, const(char)*, DEVMODEA*, DESKTOP_CONTROL_FLAGS, uint, SECURITY_ATTRIBUTES*, uint, void*);
HDESK CreateDesktopExW(const(wchar)*, const(wchar)*, DEVMODEW*, DESKTOP_CONTROL_FLAGS, uint, SECURITY_ATTRIBUTES*, uint, void*);
HDESK OpenDesktopA(const(char)*, DESKTOP_CONTROL_FLAGS, BOOL, uint);
HDESK OpenDesktopW(const(wchar)*, DESKTOP_CONTROL_FLAGS, BOOL, uint);
HDESK OpenInputDesktop(DESKTOP_CONTROL_FLAGS, BOOL, DESKTOP_ACCESS_FLAGS);
BOOL EnumDesktopsA(HWINSTA, DESKTOPENUMPROCA, LPARAM);
BOOL EnumDesktopsW(HWINSTA, DESKTOPENUMPROCW, LPARAM);
BOOL EnumDesktopWindows(HDESK, WNDENUMPROC, LPARAM);
BOOL SwitchDesktop(HDESK);
BOOL SetThreadDesktop(HDESK);
BOOL CloseDesktop(HDESK);
HDESK GetThreadDesktop(uint);
HWINSTA CreateWindowStationA(const(char)*, uint, uint, SECURITY_ATTRIBUTES*);
HWINSTA CreateWindowStationW(const(wchar)*, uint, uint, SECURITY_ATTRIBUTES*);
HWINSTA OpenWindowStationA(const(char)*, BOOL, uint);
HWINSTA OpenWindowStationW(const(wchar)*, BOOL, uint);
BOOL EnumWindowStationsA(WINSTAENUMPROCA, LPARAM);
BOOL EnumWindowStationsW(WINSTAENUMPROCW, LPARAM);
BOOL CloseWindowStation(HWINSTA);
BOOL SetProcessWindowStation(HWINSTA);
HWINSTA GetProcessWindowStation();
BOOL GetUserObjectInformationA(HANDLE, USER_OBJECT_INFORMATION_INDEX, void*, uint, uint*);
BOOL GetUserObjectInformationW(HANDLE, USER_OBJECT_INFORMATION_INDEX, void*, uint, uint*);
BOOL SetUserObjectInformationA(HANDLE, int, void*, uint);
BOOL SetUserObjectInformationW(HANDLE, int, void*, uint);
int BroadcastSystemMessageExA(BROADCAST_SYSTEM_MESSAGE_FLAGS, BROADCAST_SYSTEM_MESSAGE_INFO*, uint, WPARAM, LPARAM, BSMINFO*);
int BroadcastSystemMessageExW(BROADCAST_SYSTEM_MESSAGE_FLAGS, BROADCAST_SYSTEM_MESSAGE_INFO*, uint, WPARAM, LPARAM, BSMINFO*);
int BroadcastSystemMessageA(uint, uint*, uint, WPARAM, LPARAM);
int BroadcastSystemMessageW(BROADCAST_SYSTEM_MESSAGE_FLAGS, BROADCAST_SYSTEM_MESSAGE_INFO*, uint, WPARAM, LPARAM);
