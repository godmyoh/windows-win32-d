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

alias WINSTAENUMPROCA = BOOL function(PSTR param0, LPARAM param1);
alias WINSTAENUMPROCW = BOOL function(PWSTR param0, LPARAM param1);
alias DESKTOPENUMPROCA = BOOL function(PSTR param0, LPARAM param1);
alias DESKTOPENUMPROCW = BOOL function(PWSTR param0, LPARAM param1);
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
HDESK CreateDesktopA(const(char)* lpszDesktop, const(char)* lpszDevice, DEVMODEA* pDevmode, DESKTOP_CONTROL_FLAGS dwFlags, uint dwDesiredAccess, SECURITY_ATTRIBUTES* lpsa);
HDESK CreateDesktopW(const(wchar)* lpszDesktop, const(wchar)* lpszDevice, DEVMODEW* pDevmode, DESKTOP_CONTROL_FLAGS dwFlags, uint dwDesiredAccess, SECURITY_ATTRIBUTES* lpsa);
HDESK CreateDesktopExA(const(char)* lpszDesktop, const(char)* lpszDevice, DEVMODEA* pDevmode, DESKTOP_CONTROL_FLAGS dwFlags, uint dwDesiredAccess, SECURITY_ATTRIBUTES* lpsa, uint ulHeapSize, void* pvoid);
HDESK CreateDesktopExW(const(wchar)* lpszDesktop, const(wchar)* lpszDevice, DEVMODEW* pDevmode, DESKTOP_CONTROL_FLAGS dwFlags, uint dwDesiredAccess, SECURITY_ATTRIBUTES* lpsa, uint ulHeapSize, void* pvoid);
HDESK OpenDesktopA(const(char)* lpszDesktop, DESKTOP_CONTROL_FLAGS dwFlags, BOOL fInherit, uint dwDesiredAccess);
HDESK OpenDesktopW(const(wchar)* lpszDesktop, DESKTOP_CONTROL_FLAGS dwFlags, BOOL fInherit, uint dwDesiredAccess);
HDESK OpenInputDesktop(DESKTOP_CONTROL_FLAGS dwFlags, BOOL fInherit, DESKTOP_ACCESS_FLAGS dwDesiredAccess);
BOOL EnumDesktopsA(HWINSTA hwinsta, DESKTOPENUMPROCA lpEnumFunc, LPARAM lParam);
BOOL EnumDesktopsW(HWINSTA hwinsta, DESKTOPENUMPROCW lpEnumFunc, LPARAM lParam);
BOOL EnumDesktopWindows(HDESK hDesktop, WNDENUMPROC lpfn, LPARAM lParam);
BOOL SwitchDesktop(HDESK hDesktop);
BOOL SetThreadDesktop(HDESK hDesktop);
BOOL CloseDesktop(HDESK hDesktop);
HDESK GetThreadDesktop(uint dwThreadId);
HWINSTA CreateWindowStationA(const(char)* lpwinsta, uint dwFlags, uint dwDesiredAccess, SECURITY_ATTRIBUTES* lpsa);
HWINSTA CreateWindowStationW(const(wchar)* lpwinsta, uint dwFlags, uint dwDesiredAccess, SECURITY_ATTRIBUTES* lpsa);
HWINSTA OpenWindowStationA(const(char)* lpszWinSta, BOOL fInherit, uint dwDesiredAccess);
HWINSTA OpenWindowStationW(const(wchar)* lpszWinSta, BOOL fInherit, uint dwDesiredAccess);
BOOL EnumWindowStationsA(WINSTAENUMPROCA lpEnumFunc, LPARAM lParam);
BOOL EnumWindowStationsW(WINSTAENUMPROCW lpEnumFunc, LPARAM lParam);
BOOL CloseWindowStation(HWINSTA hWinSta);
BOOL SetProcessWindowStation(HWINSTA hWinSta);
HWINSTA GetProcessWindowStation();
BOOL GetUserObjectInformationA(HANDLE hObj, USER_OBJECT_INFORMATION_INDEX nIndex, void* pvInfo, uint nLength, uint* lpnLengthNeeded);
BOOL GetUserObjectInformationW(HANDLE hObj, USER_OBJECT_INFORMATION_INDEX nIndex, void* pvInfo, uint nLength, uint* lpnLengthNeeded);
BOOL SetUserObjectInformationA(HANDLE hObj, int nIndex, void* pvInfo, uint nLength);
BOOL SetUserObjectInformationW(HANDLE hObj, int nIndex, void* pvInfo, uint nLength);
int BroadcastSystemMessageExA(BROADCAST_SYSTEM_MESSAGE_FLAGS flags, BROADCAST_SYSTEM_MESSAGE_INFO* lpInfo, uint Msg, WPARAM wParam, LPARAM lParam, BSMINFO* pbsmInfo);
int BroadcastSystemMessageExW(BROADCAST_SYSTEM_MESSAGE_FLAGS flags, BROADCAST_SYSTEM_MESSAGE_INFO* lpInfo, uint Msg, WPARAM wParam, LPARAM lParam, BSMINFO* pbsmInfo);
int BroadcastSystemMessageA(uint flags, uint* lpInfo, uint Msg, WPARAM wParam, LPARAM lParam);
int BroadcastSystemMessageW(BROADCAST_SYSTEM_MESSAGE_FLAGS flags, BROADCAST_SYSTEM_MESSAGE_INFO* lpInfo, uint Msg, WPARAM wParam, LPARAM lParam);
