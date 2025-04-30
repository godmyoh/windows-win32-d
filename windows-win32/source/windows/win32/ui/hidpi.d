module windows.win32.ui.hidpi;

import windows.win32.foundation : BOOL, HANDLE, HRESULT, HWND, POINT, PWSTR, RECT;
import windows.win32.graphics.gdi : HMONITOR;
import windows.win32.ui.controls : HTHEME;
import windows.win32.ui.windowsandmessaging : SYSTEM_METRICS_INDEX, WINDOW_EX_STYLE, WINDOW_STYLE;

version (Windows):
extern (Windows):

HTHEME OpenThemeDataForDpi(HWND hwnd, const(wchar)* pszClassList, uint dpi);
BOOL SetDialogControlDpiChangeBehavior(HWND hWnd, DIALOG_CONTROL_DPI_CHANGE_BEHAVIORS mask, DIALOG_CONTROL_DPI_CHANGE_BEHAVIORS values);
DIALOG_CONTROL_DPI_CHANGE_BEHAVIORS GetDialogControlDpiChangeBehavior(HWND hWnd);
BOOL SetDialogDpiChangeBehavior(HWND hDlg, DIALOG_DPI_CHANGE_BEHAVIORS mask, DIALOG_DPI_CHANGE_BEHAVIORS values);
DIALOG_DPI_CHANGE_BEHAVIORS GetDialogDpiChangeBehavior(HWND hDlg);
int GetSystemMetricsForDpi(SYSTEM_METRICS_INDEX nIndex, uint dpi);
BOOL AdjustWindowRectExForDpi(RECT* lpRect, WINDOW_STYLE dwStyle, BOOL bMenu, WINDOW_EX_STYLE dwExStyle, uint dpi);
BOOL LogicalToPhysicalPointForPerMonitorDPI(HWND hWnd, POINT* lpPoint);
BOOL PhysicalToLogicalPointForPerMonitorDPI(HWND hWnd, POINT* lpPoint);
BOOL SystemParametersInfoForDpi(uint uiAction, uint uiParam, void* pvParam, uint fWinIni, uint dpi);
DPI_AWARENESS_CONTEXT SetThreadDpiAwarenessContext(DPI_AWARENESS_CONTEXT dpiContext);
DPI_AWARENESS_CONTEXT GetThreadDpiAwarenessContext();
DPI_AWARENESS_CONTEXT GetWindowDpiAwarenessContext(HWND hwnd);
DPI_AWARENESS GetAwarenessFromDpiAwarenessContext(DPI_AWARENESS_CONTEXT value);
uint GetDpiFromDpiAwarenessContext(DPI_AWARENESS_CONTEXT value);
BOOL AreDpiAwarenessContextsEqual(DPI_AWARENESS_CONTEXT dpiContextA, DPI_AWARENESS_CONTEXT dpiContextB);
BOOL IsValidDpiAwarenessContext(DPI_AWARENESS_CONTEXT value);
uint GetDpiForWindow(HWND hwnd);
uint GetDpiForSystem();
uint GetSystemDpiForProcess(HANDLE hProcess);
BOOL EnableNonClientDpiScaling(HWND hwnd);
BOOL SetProcessDpiAwarenessContext(DPI_AWARENESS_CONTEXT value);
DPI_AWARENESS_CONTEXT GetDpiAwarenessContextForProcess(HANDLE hProcess);
DPI_HOSTING_BEHAVIOR SetThreadDpiHostingBehavior(DPI_HOSTING_BEHAVIOR value);
DPI_HOSTING_BEHAVIOR GetThreadDpiHostingBehavior();
DPI_HOSTING_BEHAVIOR GetWindowDpiHostingBehavior(HWND hwnd);
HRESULT SetProcessDpiAwareness(PROCESS_DPI_AWARENESS value);
HRESULT GetProcessDpiAwareness(HANDLE hprocess, PROCESS_DPI_AWARENESS* value);
HRESULT GetDpiForMonitor(HMONITOR hmonitor, MONITOR_DPI_TYPE dpiType, uint* dpiX, uint* dpiY);
enum DPI_AWARENESS_CONTEXT_UNAWARE = 0xffffffffffffffff;
enum DPI_AWARENESS_CONTEXT_SYSTEM_AWARE = 0xfffffffffffffffe;
enum DPI_AWARENESS_CONTEXT_PER_MONITOR_AWARE = 0xfffffffffffffffd;
enum DPI_AWARENESS_CONTEXT_PER_MONITOR_AWARE_V2 = 0xfffffffffffffffc;
enum DPI_AWARENESS_CONTEXT_UNAWARE_GDISCALED = 0xfffffffffffffffb;
alias DPI_AWARENESS_CONTEXT = void*;
alias DPI_AWARENESS = int;
enum : int
{
    DPI_AWARENESS_INVALID           = 0xffffffff,
    DPI_AWARENESS_UNAWARE           = 0x00000000,
    DPI_AWARENESS_SYSTEM_AWARE      = 0x00000001,
    DPI_AWARENESS_PER_MONITOR_AWARE = 0x00000002,
}

alias DPI_HOSTING_BEHAVIOR = int;
enum : int
{
    DPI_HOSTING_BEHAVIOR_INVALID = 0xffffffff,
    DPI_HOSTING_BEHAVIOR_DEFAULT = 0x00000000,
    DPI_HOSTING_BEHAVIOR_MIXED   = 0x00000001,
}

alias DIALOG_CONTROL_DPI_CHANGE_BEHAVIORS = int;
enum : int
{
    DCDC_DEFAULT             = 0x00000000,
    DCDC_DISABLE_FONT_UPDATE = 0x00000001,
    DCDC_DISABLE_RELAYOUT    = 0x00000002,
}

alias DIALOG_DPI_CHANGE_BEHAVIORS = int;
enum : int
{
    DDC_DEFAULT                  = 0x00000000,
    DDC_DISABLE_ALL              = 0x00000001,
    DDC_DISABLE_RESIZE           = 0x00000002,
    DDC_DISABLE_CONTROL_RELAYOUT = 0x00000004,
}

alias PROCESS_DPI_AWARENESS = int;
enum : int
{
    PROCESS_DPI_UNAWARE           = 0x00000000,
    PROCESS_SYSTEM_DPI_AWARE      = 0x00000001,
    PROCESS_PER_MONITOR_DPI_AWARE = 0x00000002,
}

alias MONITOR_DPI_TYPE = int;
enum : int
{
    MDT_EFFECTIVE_DPI = 0x00000000,
    MDT_ANGULAR_DPI   = 0x00000001,
    MDT_RAW_DPI       = 0x00000002,
    MDT_DEFAULT       = 0x00000000,
}

