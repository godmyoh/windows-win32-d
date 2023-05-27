module windows.win32.ui.input.touch;

import windows.win32.guid : GUID;
import windows.win32.foundation : BOOL, HANDLE, HRESULT, HWND, POINTS;
import windows.win32.system.com : IUnknown;

version (Windows):
extern (Windows):

alias GESTURECONFIG_ID = uint;
enum : uint
{
    GID_BEGIN        = 0x00000001,
    GID_END          = 0x00000002,
    GID_ZOOM         = 0x00000003,
    GID_PAN          = 0x00000004,
    GID_ROTATE       = 0x00000005,
    GID_TWOFINGERTAP = 0x00000006,
    GID_PRESSANDTAP  = 0x00000007,
    GID_ROLLOVER     = 0x00000007,
}

alias TOUCHEVENTF_FLAGS = uint;
enum : uint
{
    TOUCHEVENTF_MOVE       = 0x00000001,
    TOUCHEVENTF_DOWN       = 0x00000002,
    TOUCHEVENTF_UP         = 0x00000004,
    TOUCHEVENTF_INRANGE    = 0x00000008,
    TOUCHEVENTF_PRIMARY    = 0x00000010,
    TOUCHEVENTF_NOCOALESCE = 0x00000020,
    TOUCHEVENTF_PEN        = 0x00000040,
    TOUCHEVENTF_PALM       = 0x00000080,
}

alias TOUCHINPUTMASKF_MASK = uint;
enum : uint
{
    TOUCHINPUTMASKF_TIMEFROMSYSTEM = 0x00000001,
    TOUCHINPUTMASKF_EXTRAINFO      = 0x00000002,
    TOUCHINPUTMASKF_CONTACTAREA    = 0x00000004,
}

alias REGISTER_TOUCH_WINDOW_FLAGS = uint;
enum : uint
{
    TWF_FINETOUCH = 0x00000001,
    TWF_WANTPALM  = 0x00000002,
}

alias HGESTUREINFO = void*;
alias HTOUCHINPUT = void*;
alias MANIPULATION_PROCESSOR_MANIPULATIONS = int;
enum : int
{
    MANIPULATION_NONE        = 0x00000000,
    MANIPULATION_TRANSLATE_X = 0x00000001,
    MANIPULATION_TRANSLATE_Y = 0x00000002,
    MANIPULATION_SCALE       = 0x00000004,
    MANIPULATION_ROTATE      = 0x00000008,
    MANIPULATION_ALL         = 0x0000000f,
}

enum IID__IManipulationEvents = GUID(0x4f62c8da, 0x9c53, 0x4b22, [0x93, 0xdf, 0x92, 0x7a, 0x86, 0x2b, 0xbb, 0x3]);
interface _IManipulationEvents : IUnknown
{
    HRESULT ManipulationStarted(float, float);
    HRESULT ManipulationDelta(float, float, float, float, float, float, float, float, float, float, float, float);
    HRESULT ManipulationCompleted(float, float, float, float, float, float, float);
}
enum IID_IInertiaProcessor = GUID(0x18b00c6d, 0xc5ee, 0x41b1, [0x90, 0xa9, 0x9d, 0x4a, 0x92, 0x90, 0x95, 0xad]);
interface IInertiaProcessor : IUnknown
{
    HRESULT get_InitialOriginX(float*);
    HRESULT put_InitialOriginX(float);
    HRESULT get_InitialOriginY(float*);
    HRESULT put_InitialOriginY(float);
    HRESULT get_InitialVelocityX(float*);
    HRESULT put_InitialVelocityX(float);
    HRESULT get_InitialVelocityY(float*);
    HRESULT put_InitialVelocityY(float);
    HRESULT get_InitialAngularVelocity(float*);
    HRESULT put_InitialAngularVelocity(float);
    HRESULT get_InitialExpansionVelocity(float*);
    HRESULT put_InitialExpansionVelocity(float);
    HRESULT get_InitialRadius(float*);
    HRESULT put_InitialRadius(float);
    HRESULT get_BoundaryLeft(float*);
    HRESULT put_BoundaryLeft(float);
    HRESULT get_BoundaryTop(float*);
    HRESULT put_BoundaryTop(float);
    HRESULT get_BoundaryRight(float*);
    HRESULT put_BoundaryRight(float);
    HRESULT get_BoundaryBottom(float*);
    HRESULT put_BoundaryBottom(float);
    HRESULT get_ElasticMarginLeft(float*);
    HRESULT put_ElasticMarginLeft(float);
    HRESULT get_ElasticMarginTop(float*);
    HRESULT put_ElasticMarginTop(float);
    HRESULT get_ElasticMarginRight(float*);
    HRESULT put_ElasticMarginRight(float);
    HRESULT get_ElasticMarginBottom(float*);
    HRESULT put_ElasticMarginBottom(float);
    HRESULT get_DesiredDisplacement(float*);
    HRESULT put_DesiredDisplacement(float);
    HRESULT get_DesiredRotation(float*);
    HRESULT put_DesiredRotation(float);
    HRESULT get_DesiredExpansion(float*);
    HRESULT put_DesiredExpansion(float);
    HRESULT get_DesiredDeceleration(float*);
    HRESULT put_DesiredDeceleration(float);
    HRESULT get_DesiredAngularDeceleration(float*);
    HRESULT put_DesiredAngularDeceleration(float);
    HRESULT get_DesiredExpansionDeceleration(float*);
    HRESULT put_DesiredExpansionDeceleration(float);
    HRESULT get_InitialTimestamp(uint*);
    HRESULT put_InitialTimestamp(uint);
    HRESULT Reset();
    HRESULT Process(BOOL*);
    HRESULT ProcessTime(uint, BOOL*);
    HRESULT Complete();
    HRESULT CompleteTime(uint);
}
enum IID_IManipulationProcessor = GUID(0xa22ac519, 0x8300, 0x48a0, [0xbe, 0xf4, 0xf1, 0xbe, 0x87, 0x37, 0xdb, 0xa4]);
interface IManipulationProcessor : IUnknown
{
    HRESULT get_SupportedManipulations(MANIPULATION_PROCESSOR_MANIPULATIONS*);
    HRESULT put_SupportedManipulations(MANIPULATION_PROCESSOR_MANIPULATIONS);
    HRESULT get_PivotPointX(float*);
    HRESULT put_PivotPointX(float);
    HRESULT get_PivotPointY(float*);
    HRESULT put_PivotPointY(float);
    HRESULT get_PivotRadius(float*);
    HRESULT put_PivotRadius(float);
    HRESULT CompleteManipulation();
    HRESULT ProcessDown(uint, float, float);
    HRESULT ProcessMove(uint, float, float);
    HRESULT ProcessUp(uint, float, float);
    HRESULT ProcessDownWithTime(uint, float, float, uint);
    HRESULT ProcessMoveWithTime(uint, float, float, uint);
    HRESULT ProcessUpWithTime(uint, float, float, uint);
    HRESULT GetVelocityX(float*);
    HRESULT GetVelocityY(float*);
    HRESULT GetExpansionVelocity(float*);
    HRESULT GetAngularVelocity(float*);
    HRESULT get_MinimumScaleRotateRadius(float*);
    HRESULT put_MinimumScaleRotateRadius(float);
}
enum CLSID_InertiaProcessor = GUID(0xabb27087, 0x4ce0, 0x4e58, [0xa0, 0xcb, 0xe2, 0x4d, 0xf9, 0x68, 0x14, 0xbe]);
struct InertiaProcessor
{
}
enum CLSID_ManipulationProcessor = GUID(0x597d4fb0, 0x47fd, 0x4aff, [0x89, 0xb9, 0xc6, 0xcf, 0xae, 0x8c, 0xf0, 0x8e]);
struct ManipulationProcessor
{
}
BOOL GetTouchInputInfo(HTOUCHINPUT, uint, TOUCHINPUT*, int);
BOOL CloseTouchInputHandle(HTOUCHINPUT);
BOOL RegisterTouchWindow(HWND, REGISTER_TOUCH_WINDOW_FLAGS);
BOOL UnregisterTouchWindow(HWND);
BOOL IsTouchWindow(HWND, uint*);
BOOL GetGestureInfo(HGESTUREINFO, GESTUREINFO*);
BOOL GetGestureExtraArgs(HGESTUREINFO, uint, ubyte*);
BOOL CloseGestureInfoHandle(HGESTUREINFO);
BOOL SetGestureConfig(HWND, uint, uint, GESTURECONFIG*, uint);
BOOL GetGestureConfig(HWND, uint, uint, uint*, GESTURECONFIG*, uint);
struct TOUCHINPUT
{
    int x;
    int y;
    HANDLE hSource;
    uint dwID;
    TOUCHEVENTF_FLAGS dwFlags;
    TOUCHINPUTMASKF_MASK dwMask;
    uint dwTime;
    ulong dwExtraInfo;
    uint cxContact;
    uint cyContact;
}
struct GESTUREINFO
{
    uint cbSize;
    uint dwFlags;
    uint dwID;
    HWND hwndTarget;
    POINTS ptsLocation;
    uint dwInstanceID;
    uint dwSequenceID;
    ulong ullArguments;
    uint cbExtraArgs;
}
struct GESTURENOTIFYSTRUCT
{
    uint cbSize;
    uint dwFlags;
    HWND hwndTarget;
    POINTS ptsLocation;
    uint dwInstanceID;
}
struct GESTURECONFIG
{
    GESTURECONFIG_ID dwID;
    uint dwWant;
    uint dwBlock;
}
