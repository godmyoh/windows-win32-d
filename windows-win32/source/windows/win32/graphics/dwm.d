module windows.win32.graphics.dwm;

import windows.win32.guid : GUID;
import windows.win32.foundation : BOOL, HRESULT, HWND, LPARAM, LRESULT, POINT, RECT, SIZE, WPARAM;
import windows.win32.graphics.gdi : HBITMAP, HRGN;
import windows.win32.ui.controls_ : MARGINS;

version (Windows):
extern (Windows):

BOOL DwmDefWindowProc(HWND, uint, WPARAM, LPARAM, LRESULT*);
HRESULT DwmEnableBlurBehindWindow(HWND, const(DWM_BLURBEHIND)*);
HRESULT DwmEnableComposition(uint);
HRESULT DwmEnableMMCSS(BOOL);
HRESULT DwmExtendFrameIntoClientArea(HWND, const(MARGINS)*);
HRESULT DwmGetColorizationColor(uint*, BOOL*);
HRESULT DwmGetCompositionTimingInfo(HWND, DWM_TIMING_INFO*);
HRESULT DwmGetWindowAttribute(HWND, DWMWINDOWATTRIBUTE, void*, uint);
HRESULT DwmIsCompositionEnabled(BOOL*);
HRESULT DwmModifyPreviousDxFrameDuration(HWND, int, BOOL);
HRESULT DwmQueryThumbnailSourceSize(long, SIZE*);
HRESULT DwmRegisterThumbnail(HWND, HWND, long*);
HRESULT DwmSetDxFrameDuration(HWND, int);
HRESULT DwmSetPresentParameters(HWND, DWM_PRESENT_PARAMETERS*);
HRESULT DwmSetWindowAttribute(HWND, DWMWINDOWATTRIBUTE, const(void)*, uint);
HRESULT DwmUnregisterThumbnail(long);
HRESULT DwmUpdateThumbnailProperties(long, const(DWM_THUMBNAIL_PROPERTIES)*);
HRESULT DwmSetIconicThumbnail(HWND, HBITMAP, uint);
HRESULT DwmSetIconicLivePreviewBitmap(HWND, HBITMAP, POINT*, uint);
HRESULT DwmInvalidateIconicBitmaps(HWND);
HRESULT DwmAttachMilContent(HWND);
HRESULT DwmDetachMilContent(HWND);
HRESULT DwmFlush();
HRESULT DwmGetGraphicsStreamTransformHint(uint, MilMatrix3x2D*);
HRESULT DwmGetGraphicsStreamClient(uint, GUID*);
HRESULT DwmGetTransportAttributes(BOOL*, BOOL*, uint*);
HRESULT DwmTransitionOwnedWindow(HWND, DWMTRANSITION_OWNEDWINDOW_TARGET);
HRESULT DwmRenderGesture(GESTURE_TYPE, uint, const(uint)*, const(POINT)*);
HRESULT DwmTetherContact(uint, BOOL, POINT);
HRESULT DwmShowContact(uint, DWM_SHOWCONTACT);
HRESULT DwmGetUnmetTabRequirements(HWND, DWM_TAB_WINDOW_REQUIREMENTS*);
enum DWM_BB_ENABLE = 0x00000001;
enum DWM_BB_BLURREGION = 0x00000002;
enum DWM_BB_TRANSITIONONMAXIMIZED = 0x00000004;
enum DWMWA_COLOR_DEFAULT = 0xffffffff;
enum DWMWA_COLOR_NONE = 0xfffffffe;
enum DWM_CLOAKED_APP = 0x00000001;
enum DWM_CLOAKED_SHELL = 0x00000002;
enum DWM_CLOAKED_INHERITED = 0x00000004;
enum DWM_TNP_RECTDESTINATION = 0x00000001;
enum DWM_TNP_RECTSOURCE = 0x00000002;
enum DWM_TNP_OPACITY = 0x00000004;
enum DWM_TNP_VISIBLE = 0x00000008;
enum DWM_TNP_SOURCECLIENTAREAONLY = 0x00000010;
enum DWM_FRAME_DURATION_DEFAULT = 0xffffffffffffffff;
enum DWM_EC_DISABLECOMPOSITION = 0x00000000;
enum DWM_EC_ENABLECOMPOSITION = 0x00000001;
enum DWM_SIT_DISPLAYFRAME = 0x00000001;
enum c_DwmMaxQueuedBuffers = 0x00000008;
enum c_DwmMaxMonitors = 0x00000010;
enum c_DwmMaxAdapters = 0x00000010;
struct DWM_BLURBEHIND
{
    align (1):
    uint dwFlags;
    BOOL fEnable;
    HRGN hRgnBlur;
    BOOL fTransitionOnMaximized;
}
alias DWMWINDOWATTRIBUTE = int;
enum : int
{
    DWMWA_NCRENDERING_ENABLED            = 0x00000001,
    DWMWA_NCRENDERING_POLICY             = 0x00000002,
    DWMWA_TRANSITIONS_FORCEDISABLED      = 0x00000003,
    DWMWA_ALLOW_NCPAINT                  = 0x00000004,
    DWMWA_CAPTION_BUTTON_BOUNDS          = 0x00000005,
    DWMWA_NONCLIENT_RTL_LAYOUT           = 0x00000006,
    DWMWA_FORCE_ICONIC_REPRESENTATION    = 0x00000007,
    DWMWA_FLIP3D_POLICY                  = 0x00000008,
    DWMWA_EXTENDED_FRAME_BOUNDS          = 0x00000009,
    DWMWA_HAS_ICONIC_BITMAP              = 0x0000000a,
    DWMWA_DISALLOW_PEEK                  = 0x0000000b,
    DWMWA_EXCLUDED_FROM_PEEK             = 0x0000000c,
    DWMWA_CLOAK                          = 0x0000000d,
    DWMWA_CLOAKED                        = 0x0000000e,
    DWMWA_FREEZE_REPRESENTATION          = 0x0000000f,
    DWMWA_PASSIVE_UPDATE_MODE            = 0x00000010,
    DWMWA_USE_HOSTBACKDROPBRUSH          = 0x00000011,
    DWMWA_USE_IMMERSIVE_DARK_MODE        = 0x00000014,
    DWMWA_WINDOW_CORNER_PREFERENCE       = 0x00000021,
    DWMWA_BORDER_COLOR                   = 0x00000022,
    DWMWA_CAPTION_COLOR                  = 0x00000023,
    DWMWA_TEXT_COLOR                     = 0x00000024,
    DWMWA_VISIBLE_FRAME_BORDER_THICKNESS = 0x00000025,
    DWMWA_SYSTEMBACKDROP_TYPE            = 0x00000026,
    DWMWA_LAST                           = 0x00000027,
}

alias DWM_WINDOW_CORNER_PREFERENCE = int;
enum : int
{
    DWMWCP_DEFAULT    = 0x00000000,
    DWMWCP_DONOTROUND = 0x00000001,
    DWMWCP_ROUND      = 0x00000002,
    DWMWCP_ROUNDSMALL = 0x00000003,
}

alias DWM_SYSTEMBACKDROP_TYPE = int;
enum : int
{
    DWMSBT_AUTO            = 0x00000000,
    DWMSBT_NONE            = 0x00000001,
    DWMSBT_MAINWINDOW      = 0x00000002,
    DWMSBT_TRANSIENTWINDOW = 0x00000003,
    DWMSBT_TABBEDWINDOW    = 0x00000004,
}

alias DWMNCRENDERINGPOLICY = int;
enum : int
{
    DWMNCRP_USEWINDOWSTYLE = 0x00000000,
    DWMNCRP_DISABLED       = 0x00000001,
    DWMNCRP_ENABLED        = 0x00000002,
    DWMNCRP_LAST           = 0x00000003,
}

alias DWMFLIP3DWINDOWPOLICY = int;
enum : int
{
    DWMFLIP3D_DEFAULT      = 0x00000000,
    DWMFLIP3D_EXCLUDEBELOW = 0x00000001,
    DWMFLIP3D_EXCLUDEABOVE = 0x00000002,
    DWMFLIP3D_LAST         = 0x00000003,
}

struct DWM_THUMBNAIL_PROPERTIES
{
    align (1):
    uint dwFlags;
    RECT rcDestination;
    RECT rcSource;
    ubyte opacity;
    BOOL fVisible;
    BOOL fSourceClientAreaOnly;
}
struct UNSIGNED_RATIO
{
    align (1):
    uint uiNumerator;
    uint uiDenominator;
}
struct DWM_TIMING_INFO
{
    align (1):
    uint cbSize;
    UNSIGNED_RATIO rateRefresh;
    ulong qpcRefreshPeriod;
    UNSIGNED_RATIO rateCompose;
    ulong qpcVBlank;
    ulong cRefresh;
    uint cDXRefresh;
    ulong qpcCompose;
    ulong cFrame;
    uint cDXPresent;
    ulong cRefreshFrame;
    ulong cFrameSubmitted;
    uint cDXPresentSubmitted;
    ulong cFrameConfirmed;
    uint cDXPresentConfirmed;
    ulong cRefreshConfirmed;
    uint cDXRefreshConfirmed;
    ulong cFramesLate;
    uint cFramesOutstanding;
    ulong cFrameDisplayed;
    ulong qpcFrameDisplayed;
    ulong cRefreshFrameDisplayed;
    ulong cFrameComplete;
    ulong qpcFrameComplete;
    ulong cFramePending;
    ulong qpcFramePending;
    ulong cFramesDisplayed;
    ulong cFramesComplete;
    ulong cFramesPending;
    ulong cFramesAvailable;
    ulong cFramesDropped;
    ulong cFramesMissed;
    ulong cRefreshNextDisplayed;
    ulong cRefreshNextPresented;
    ulong cRefreshesDisplayed;
    ulong cRefreshesPresented;
    ulong cRefreshStarted;
    ulong cPixelsReceived;
    ulong cPixelsDrawn;
    ulong cBuffersEmpty;
}
alias DWM_SOURCE_FRAME_SAMPLING = int;
enum : int
{
    DWM_SOURCE_FRAME_SAMPLING_POINT    = 0x00000000,
    DWM_SOURCE_FRAME_SAMPLING_COVERAGE = 0x00000001,
    DWM_SOURCE_FRAME_SAMPLING_LAST     = 0x00000002,
}

struct DWM_PRESENT_PARAMETERS
{
    align (1):
    uint cbSize;
    BOOL fQueue;
    ulong cRefreshStart;
    uint cBuffer;
    BOOL fUseSourceRate;
    UNSIGNED_RATIO rateSource;
    uint cRefreshesPerFrame;
    DWM_SOURCE_FRAME_SAMPLING eSampling;
}
struct MilMatrix3x2D
{
    align (1):
    double S_11;
    double S_12;
    double S_21;
    double S_22;
    double DX;
    double DY;
}
alias DWMTRANSITION_OWNEDWINDOW_TARGET = int;
enum : int
{
    DWMTRANSITION_OWNEDWINDOW_NULL       = 0xffffffff,
    DWMTRANSITION_OWNEDWINDOW_REPOSITION = 0x00000000,
}

alias GESTURE_TYPE = int;
enum : int
{
    GT_PEN_TAP                 = 0x00000000,
    GT_PEN_DOUBLETAP           = 0x00000001,
    GT_PEN_RIGHTTAP            = 0x00000002,
    GT_PEN_PRESSANDHOLD        = 0x00000003,
    GT_PEN_PRESSANDHOLDABORT   = 0x00000004,
    GT_TOUCH_TAP               = 0x00000005,
    GT_TOUCH_DOUBLETAP         = 0x00000006,
    GT_TOUCH_RIGHTTAP          = 0x00000007,
    GT_TOUCH_PRESSANDHOLD      = 0x00000008,
    GT_TOUCH_PRESSANDHOLDABORT = 0x00000009,
    GT_TOUCH_PRESSANDTAP       = 0x0000000a,
}

alias DWM_SHOWCONTACT = uint;
enum : uint
{
    DWMSC_DOWN      = 0x00000001,
    DWMSC_UP        = 0x00000002,
    DWMSC_DRAG      = 0x00000004,
    DWMSC_HOLD      = 0x00000008,
    DWMSC_PENBARREL = 0x00000010,
    DWMSC_NONE      = 0x00000000,
    DWMSC_ALL       = 0xffffffff,
}

alias DWM_TAB_WINDOW_REQUIREMENTS = int;
enum : int
{
    DWMTWR_NONE                  = 0x00000000,
    DWMTWR_IMPLEMENTED_BY_SYSTEM = 0x00000001,
    DWMTWR_WINDOW_RELATIONSHIP   = 0x00000002,
    DWMTWR_WINDOW_STYLES         = 0x00000004,
    DWMTWR_WINDOW_REGION         = 0x00000008,
    DWMTWR_WINDOW_DWM_ATTRIBUTES = 0x00000010,
    DWMTWR_WINDOW_MARGINS        = 0x00000020,
    DWMTWR_TABBING_ENABLED       = 0x00000040,
    DWMTWR_USER_POLICY           = 0x00000080,
    DWMTWR_GROUP_POLICY          = 0x00000100,
    DWMTWR_APP_COMPAT            = 0x00000200,
}

