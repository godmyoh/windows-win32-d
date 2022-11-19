module windows.win32.ui.hidpi;

import windows.win32.foundation : BOOL, HANDLE, HRESULT, HWND, POINT, PWSTR, RECT;
import windows.win32.graphics.gdi : HMONITOR;
import windows.win32.ui.controls_ : HTHEME;
import windows.win32.ui.windowsandmessaging : SYSTEM_METRICS_INDEX, WINDOW_EX_STYLE, WINDOW_STYLE;

version (Windows):
extern (Windows):

HTHEME OpenThemeDataForDpi(HWND, const(wchar)*, uint);
BOOL SetDialogControlDpiChangeBehavior(HWND, DIALOG_CONTROL_DPI_CHANGE_BEHAVIORS, DIALOG_CONTROL_DPI_CHANGE_BEHAVIORS);
DIALOG_CONTROL_DPI_CHANGE_BEHAVIORS GetDialogControlDpiChangeBehavior(HWND);
BOOL SetDialogDpiChangeBehavior(HWND, DIALOG_DPI_CHANGE_BEHAVIORS, DIALOG_DPI_CHANGE_BEHAVIORS);
DIALOG_DPI_CHANGE_BEHAVIORS GetDialogDpiChangeBehavior(HWND);
int GetSystemMetricsForDpi(SYSTEM_METRICS_INDEX, uint);
BOOL AdjustWindowRectExForDpi(RECT*, WINDOW_STYLE, BOOL, WINDOW_EX_STYLE, uint);
BOOL LogicalToPhysicalPointForPerMonitorDPI(HWND, POINT*);
BOOL PhysicalToLogicalPointForPerMonitorDPI(HWND, POINT*);
BOOL SystemParametersInfoForDpi(uint, uint, void*, uint, uint);
DPI_AWARENESS_CONTEXT SetThreadDpiAwarenessContext(DPI_AWARENESS_CONTEXT);
DPI_AWARENESS_CONTEXT GetThreadDpiAwarenessContext();
DPI_AWARENESS_CONTEXT GetWindowDpiAwarenessContext(HWND);
DPI_AWARENESS GetAwarenessFromDpiAwarenessContext(DPI_AWARENESS_CONTEXT);
uint GetDpiFromDpiAwarenessContext(DPI_AWARENESS_CONTEXT);
BOOL AreDpiAwarenessContextsEqual(DPI_AWARENESS_CONTEXT, DPI_AWARENESS_CONTEXT);
BOOL IsValidDpiAwarenessContext(DPI_AWARENESS_CONTEXT);
uint GetDpiForWindow(HWND);
uint GetDpiForSystem();
uint GetSystemDpiForProcess(HANDLE);
BOOL EnableNonClientDpiScaling(HWND);
BOOL SetProcessDpiAwarenessContext(DPI_AWARENESS_CONTEXT);
DPI_AWARENESS_CONTEXT GetDpiAwarenessContextForProcess(HANDLE);
DPI_HOSTING_BEHAVIOR SetThreadDpiHostingBehavior(DPI_HOSTING_BEHAVIOR);
DPI_HOSTING_BEHAVIOR GetThreadDpiHostingBehavior();
DPI_HOSTING_BEHAVIOR GetWindowDpiHostingBehavior(HWND);
HRESULT SetProcessDpiAwareness(PROCESS_DPI_AWARENESS);
HRESULT GetProcessDpiAwareness(HANDLE, PROCESS_DPI_AWARENESS*);
HRESULT GetDpiForMonitor(HMONITOR, MONITOR_DPI_TYPE, uint*, uint*);
enum DPI_AWARENESS_CONTEXT_UNAWARE = 0xffffffffffffffff;
enum DPI_AWARENESS_CONTEXT_SYSTEM_AWARE = 0xfffffffffffffffe;
enum DPI_AWARENESS_CONTEXT_PER_MONITOR_AWARE = 0xfffffffffffffffd;
enum DPI_AWARENESS_CONTEXT_PER_MONITOR_AWARE_V2 = 0xfffffffffffffffc;
enum DPI_AWARENESS_CONTEXT_UNAWARE_GDISCALED = 0xfffffffffffffffb;
alias DPI_AWARENESS_CONTEXT = long;
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

alias DIALOG_CONTROL_DPI_CHANGE_BEHAVIORS = uint;
enum : uint
{
    DCDC_DEFAULT             = 0x00000000,
    DCDC_DISABLE_FONT_UPDATE = 0x00000001,
    DCDC_DISABLE_RELAYOUT    = 0x00000002,
}

alias DIALOG_DPI_CHANGE_BEHAVIORS = uint;
enum : uint
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

