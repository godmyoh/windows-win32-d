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
    HRESULT ManipulationStarted(float x, float y);
    HRESULT ManipulationDelta(float x, float y, float translationDeltaX, float translationDeltaY, float scaleDelta, float expansionDelta, float rotationDelta, float cumulativeTranslationX, float cumulativeTranslationY, float cumulativeScale, float cumulativeExpansion, float cumulativeRotation);
    HRESULT ManipulationCompleted(float x, float y, float cumulativeTranslationX, float cumulativeTranslationY, float cumulativeScale, float cumulativeExpansion, float cumulativeRotation);
}
enum IID_IInertiaProcessor = GUID(0x18b00c6d, 0xc5ee, 0x41b1, [0x90, 0xa9, 0x9d, 0x4a, 0x92, 0x90, 0x95, 0xad]);
interface IInertiaProcessor : IUnknown
{
    HRESULT get_InitialOriginX(float* x);
    HRESULT put_InitialOriginX(float x);
    HRESULT get_InitialOriginY(float* y);
    HRESULT put_InitialOriginY(float y);
    HRESULT get_InitialVelocityX(float* x);
    HRESULT put_InitialVelocityX(float x);
    HRESULT get_InitialVelocityY(float* y);
    HRESULT put_InitialVelocityY(float y);
    HRESULT get_InitialAngularVelocity(float* velocity);
    HRESULT put_InitialAngularVelocity(float velocity);
    HRESULT get_InitialExpansionVelocity(float* velocity);
    HRESULT put_InitialExpansionVelocity(float velocity);
    HRESULT get_InitialRadius(float* radius);
    HRESULT put_InitialRadius(float radius);
    HRESULT get_BoundaryLeft(float* left);
    HRESULT put_BoundaryLeft(float left);
    HRESULT get_BoundaryTop(float* top);
    HRESULT put_BoundaryTop(float top);
    HRESULT get_BoundaryRight(float* right);
    HRESULT put_BoundaryRight(float right);
    HRESULT get_BoundaryBottom(float* bottom);
    HRESULT put_BoundaryBottom(float bottom);
    HRESULT get_ElasticMarginLeft(float* left);
    HRESULT put_ElasticMarginLeft(float left);
    HRESULT get_ElasticMarginTop(float* top);
    HRESULT put_ElasticMarginTop(float top);
    HRESULT get_ElasticMarginRight(float* right);
    HRESULT put_ElasticMarginRight(float right);
    HRESULT get_ElasticMarginBottom(float* bottom);
    HRESULT put_ElasticMarginBottom(float bottom);
    HRESULT get_DesiredDisplacement(float* displacement);
    HRESULT put_DesiredDisplacement(float displacement);
    HRESULT get_DesiredRotation(float* rotation);
    HRESULT put_DesiredRotation(float rotation);
    HRESULT get_DesiredExpansion(float* expansion);
    HRESULT put_DesiredExpansion(float expansion);
    HRESULT get_DesiredDeceleration(float* deceleration);
    HRESULT put_DesiredDeceleration(float deceleration);
    HRESULT get_DesiredAngularDeceleration(float* deceleration);
    HRESULT put_DesiredAngularDeceleration(float deceleration);
    HRESULT get_DesiredExpansionDeceleration(float* deceleration);
    HRESULT put_DesiredExpansionDeceleration(float deceleration);
    HRESULT get_InitialTimestamp(uint* timestamp);
    HRESULT put_InitialTimestamp(uint timestamp);
    HRESULT Reset();
    HRESULT Process(BOOL* completed);
    HRESULT ProcessTime(uint timestamp, BOOL* completed);
    HRESULT Complete();
    HRESULT CompleteTime(uint timestamp);
}
enum IID_IManipulationProcessor = GUID(0xa22ac519, 0x8300, 0x48a0, [0xbe, 0xf4, 0xf1, 0xbe, 0x87, 0x37, 0xdb, 0xa4]);
interface IManipulationProcessor : IUnknown
{
    HRESULT get_SupportedManipulations(MANIPULATION_PROCESSOR_MANIPULATIONS* manipulations);
    HRESULT put_SupportedManipulations(MANIPULATION_PROCESSOR_MANIPULATIONS manipulations);
    HRESULT get_PivotPointX(float* pivotPointX);
    HRESULT put_PivotPointX(float pivotPointX);
    HRESULT get_PivotPointY(float* pivotPointY);
    HRESULT put_PivotPointY(float pivotPointY);
    HRESULT get_PivotRadius(float* pivotRadius);
    HRESULT put_PivotRadius(float pivotRadius);
    HRESULT CompleteManipulation();
    HRESULT ProcessDown(uint manipulatorId, float x, float y);
    HRESULT ProcessMove(uint manipulatorId, float x, float y);
    HRESULT ProcessUp(uint manipulatorId, float x, float y);
    HRESULT ProcessDownWithTime(uint manipulatorId, float x, float y, uint timestamp);
    HRESULT ProcessMoveWithTime(uint manipulatorId, float x, float y, uint timestamp);
    HRESULT ProcessUpWithTime(uint manipulatorId, float x, float y, uint timestamp);
    HRESULT GetVelocityX(float* velocityX);
    HRESULT GetVelocityY(float* velocityY);
    HRESULT GetExpansionVelocity(float* expansionVelocity);
    HRESULT GetAngularVelocity(float* angularVelocity);
    HRESULT get_MinimumScaleRotateRadius(float* minRadius);
    HRESULT put_MinimumScaleRotateRadius(float minRadius);
}
enum CLSID_InertiaProcessor = GUID(0xabb27087, 0x4ce0, 0x4e58, [0xa0, 0xcb, 0xe2, 0x4d, 0xf9, 0x68, 0x14, 0xbe]);
struct InertiaProcessor
{
}
enum CLSID_ManipulationProcessor = GUID(0x597d4fb0, 0x47fd, 0x4aff, [0x89, 0xb9, 0xc6, 0xcf, 0xae, 0x8c, 0xf0, 0x8e]);
struct ManipulationProcessor
{
}
BOOL GetTouchInputInfo(HTOUCHINPUT hTouchInput, uint cInputs, TOUCHINPUT* pInputs, int cbSize);
BOOL CloseTouchInputHandle(HTOUCHINPUT hTouchInput);
BOOL RegisterTouchWindow(HWND hwnd, REGISTER_TOUCH_WINDOW_FLAGS ulFlags);
BOOL UnregisterTouchWindow(HWND hwnd);
BOOL IsTouchWindow(HWND hwnd, uint* pulFlags);
BOOL GetGestureInfo(HGESTUREINFO hGestureInfo, GESTUREINFO* pGestureInfo);
BOOL GetGestureExtraArgs(HGESTUREINFO hGestureInfo, uint cbExtraArgs, ubyte* pExtraArgs);
BOOL CloseGestureInfoHandle(HGESTUREINFO hGestureInfo);
BOOL SetGestureConfig(HWND hwnd, uint dwReserved, uint cIDs, GESTURECONFIG* pGestureConfig, uint cbSize);
BOOL GetGestureConfig(HWND hwnd, uint dwReserved, uint dwFlags, uint* pcIDs, GESTURECONFIG* pGestureConfig, uint cbSize);
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
