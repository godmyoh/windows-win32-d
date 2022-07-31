module windows.win32.graphics.directcomposition;

import windows.win32.guid : GUID;
import windows.win32.foundation : BOOL, HANDLE, HRESULT, HWND, LARGE_INTEGER, LUID, POINT, RECT;
import windows.win32.graphics.direct2d.common : D2D1_2DAFFINETRANSFORM_INTERPOLATION_MODE, D2D1_BLEND_MODE, D2D1_BORDER_MODE, D2D1_COLORMATRIX_ALPHA_MODE, D2D1_COLOR_F, D2D1_COMPOSITE_MODE, D2D1_TURBULENCE_NOISE, D2D_MATRIX_3X2_F, D2D_MATRIX_4X4_F, D2D_MATRIX_5X4_F, D2D_RECT_F, D2D_VECTOR_2F, D2D_VECTOR_4F;
import windows.win32.graphics.direct3d_ : D3DMATRIX;
import windows.win32.graphics.dxgi_ : IDXGIDevice;
import windows.win32.graphics.dxgi.common : DXGI_ALPHA_MODE, DXGI_FORMAT, DXGI_RATIONAL;
import windows.win32.security_ : SECURITY_ATTRIBUTES;
import windows.win32.system.com_ : IUnknown;

version (Windows):
extern (Windows):

HRESULT DCompositionCreateDevice(IDXGIDevice, const(GUID)*, void**);
HRESULT DCompositionCreateDevice2(IUnknown, const(GUID)*, void**);
HRESULT DCompositionCreateDevice3(IUnknown, const(GUID)*, void**);
HRESULT DCompositionCreateSurfaceHandle(uint, SECURITY_ATTRIBUTES*, HANDLE*);
HRESULT DCompositionAttachMouseWheelToHwnd(IDCompositionVisual, HWND, BOOL);
HRESULT DCompositionAttachMouseDragToHwnd(IDCompositionVisual, HWND, BOOL);
HRESULT DCompositionGetFrameId(COMPOSITION_FRAME_ID_TYPE, ulong*);
HRESULT DCompositionGetStatistics(ulong, COMPOSITION_FRAME_STATS*, uint, COMPOSITION_TARGET_ID*, uint*);
HRESULT DCompositionGetTargetStatistics(ulong, const(COMPOSITION_TARGET_ID)*, COMPOSITION_TARGET_STATS*);
HRESULT DCompositionBoostCompositorClock(BOOL);
uint DCompositionWaitForCompositorClock(uint, const(HANDLE)*, uint);
enum COMPOSITIONOBJECT_READ = 0x00000001;
enum COMPOSITIONOBJECT_WRITE = 0x00000002;
enum DCOMPOSITION_MAX_WAITFORCOMPOSITORCLOCK_OBJECTS = 0x00000020;
enum COMPOSITION_STATS_MAX_TARGETS = 0x00000100;
alias DCOMPOSITION_BITMAP_INTERPOLATION_MODE = int;
enum : int
{
    DCOMPOSITION_BITMAP_INTERPOLATION_MODE_NEAREST_NEIGHBOR = 0x00000000,
    DCOMPOSITION_BITMAP_INTERPOLATION_MODE_LINEAR           = 0x00000001,
    DCOMPOSITION_BITMAP_INTERPOLATION_MODE_INHERIT          = 0xffffffff,
}

alias DCOMPOSITION_BORDER_MODE = int;
enum : int
{
    DCOMPOSITION_BORDER_MODE_SOFT    = 0x00000000,
    DCOMPOSITION_BORDER_MODE_HARD    = 0x00000001,
    DCOMPOSITION_BORDER_MODE_INHERIT = 0xffffffff,
}

alias DCOMPOSITION_COMPOSITE_MODE = int;
enum : int
{
    DCOMPOSITION_COMPOSITE_MODE_SOURCE_OVER        = 0x00000000,
    DCOMPOSITION_COMPOSITE_MODE_DESTINATION_INVERT = 0x00000001,
    DCOMPOSITION_COMPOSITE_MODE_MIN_BLEND          = 0x00000002,
    DCOMPOSITION_COMPOSITE_MODE_INHERIT            = 0xffffffff,
}

alias DCOMPOSITION_BACKFACE_VISIBILITY = int;
enum : int
{
    DCOMPOSITION_BACKFACE_VISIBILITY_VISIBLE = 0x00000000,
    DCOMPOSITION_BACKFACE_VISIBILITY_HIDDEN  = 0x00000001,
    DCOMPOSITION_BACKFACE_VISIBILITY_INHERIT = 0xffffffff,
}

alias DCOMPOSITION_OPACITY_MODE = int;
enum : int
{
    DCOMPOSITION_OPACITY_MODE_LAYER    = 0x00000000,
    DCOMPOSITION_OPACITY_MODE_MULTIPLY = 0x00000001,
    DCOMPOSITION_OPACITY_MODE_INHERIT  = 0xffffffff,
}

alias DCOMPOSITION_DEPTH_MODE = int;
enum : int
{
    DCOMPOSITION_DEPTH_MODE_TREE    = 0x00000000,
    DCOMPOSITION_DEPTH_MODE_SPATIAL = 0x00000001,
    DCOMPOSITION_DEPTH_MODE_SORTED  = 0x00000003,
    DCOMPOSITION_DEPTH_MODE_INHERIT = 0xffffffff,
}

struct DCOMPOSITION_FRAME_STATISTICS
{
    LARGE_INTEGER lastFrameTime;
    DXGI_RATIONAL currentCompositionRate;
    LARGE_INTEGER currentTime;
    LARGE_INTEGER timeFrequency;
    LARGE_INTEGER nextEstimatedFrameTime;
}
alias COMPOSITION_FRAME_ID_TYPE = int;
enum : int
{
    COMPOSITION_FRAME_ID_CREATED   = 0x00000000,
    COMPOSITION_FRAME_ID_CONFIRMED = 0x00000001,
    COMPOSITION_FRAME_ID_COMPLETED = 0x00000002,
}

struct COMPOSITION_FRAME_STATS
{
    ulong startTime;
    ulong targetTime;
    ulong framePeriod;
}
struct COMPOSITION_TARGET_ID
{
    LUID displayAdapterLuid;
    LUID renderAdapterLuid;
    uint vidPnSourceId;
    uint vidPnTargetId;
    uint uniqueId;
}
struct COMPOSITION_STATS
{
    uint presentCount;
    uint refreshCount;
    uint virtualRefreshCount;
    ulong time;
}
struct COMPOSITION_TARGET_STATS
{
    uint outstandingPresents;
    ulong presentTime;
    ulong vblankDuration;
    COMPOSITION_STATS presentedStats;
    COMPOSITION_STATS completedStats;
}
enum IID_IDCompositionAnimation = GUID(0xcbfd91d9, 0x51b2, 0x45e4, [0xb3, 0xde, 0xd1, 0x9c, 0xcf, 0xb8, 0x63, 0xc5]);
interface IDCompositionAnimation : IUnknown
{
    HRESULT Reset();
    HRESULT SetAbsoluteBeginTime(LARGE_INTEGER);
    HRESULT AddCubic(double, float, float, float, float);
    HRESULT AddSinusoidal(double, float, float, float, float);
    HRESULT AddRepeat(double, double);
    HRESULT End(double, float);
}
enum IID_IDCompositionDevice = GUID(0xc37ea93a, 0xe7aa, 0x450d, [0xb1, 0x6f, 0x97, 0x46, 0xcb, 0x4, 0x7, 0xf3]);
interface IDCompositionDevice : IUnknown
{
    HRESULT Commit();
    HRESULT WaitForCommitCompletion();
    HRESULT GetFrameStatistics(DCOMPOSITION_FRAME_STATISTICS*);
    HRESULT CreateTargetForHwnd(HWND, BOOL, IDCompositionTarget*);
    HRESULT CreateVisual(IDCompositionVisual*);
    HRESULT CreateSurface(uint, uint, DXGI_FORMAT, DXGI_ALPHA_MODE, IDCompositionSurface*);
    HRESULT CreateVirtualSurface(uint, uint, DXGI_FORMAT, DXGI_ALPHA_MODE, IDCompositionVirtualSurface*);
    HRESULT CreateSurfaceFromHandle(HANDLE, IUnknown*);
    HRESULT CreateSurfaceFromHwnd(HWND, IUnknown*);
    HRESULT CreateTranslateTransform(IDCompositionTranslateTransform*);
    HRESULT CreateScaleTransform(IDCompositionScaleTransform*);
    HRESULT CreateRotateTransform(IDCompositionRotateTransform*);
    HRESULT CreateSkewTransform(IDCompositionSkewTransform*);
    HRESULT CreateMatrixTransform(IDCompositionMatrixTransform*);
    HRESULT CreateTransformGroup(IDCompositionTransform*, uint, IDCompositionTransform*);
    HRESULT CreateTranslateTransform3D(IDCompositionTranslateTransform3D*);
    HRESULT CreateScaleTransform3D(IDCompositionScaleTransform3D*);
    HRESULT CreateRotateTransform3D(IDCompositionRotateTransform3D*);
    HRESULT CreateMatrixTransform3D(IDCompositionMatrixTransform3D*);
    HRESULT CreateTransform3DGroup(IDCompositionTransform3D*, uint, IDCompositionTransform3D*);
    HRESULT CreateEffectGroup(IDCompositionEffectGroup*);
    HRESULT CreateRectangleClip(IDCompositionRectangleClip*);
    HRESULT CreateAnimation(IDCompositionAnimation*);
    HRESULT CheckDeviceState(BOOL*);
}
enum IID_IDCompositionTarget = GUID(0xeacdd04c, 0x117e, 0x4e17, [0x88, 0xf4, 0xd1, 0xb1, 0x2b, 0xe, 0x3d, 0x89]);
interface IDCompositionTarget : IUnknown
{
    HRESULT SetRoot(IDCompositionVisual);
}
enum IID_IDCompositionVisual = GUID(0x4d93059d, 0x97b, 0x4651, [0x9a, 0x60, 0xf0, 0xf2, 0x51, 0x16, 0xe2, 0xf3]);
interface IDCompositionVisual : IUnknown
{
    HRESULT SetOffsetX(IDCompositionAnimation);
    HRESULT SetOffsetX(float);
    HRESULT SetOffsetY(IDCompositionAnimation);
    HRESULT SetOffsetY(float);
    HRESULT SetTransform(IDCompositionTransform);
    HRESULT SetTransform(const(D2D_MATRIX_3X2_F)*);
    HRESULT SetTransformParent(IDCompositionVisual);
    HRESULT SetEffect(IDCompositionEffect);
    HRESULT SetBitmapInterpolationMode(DCOMPOSITION_BITMAP_INTERPOLATION_MODE);
    HRESULT SetBorderMode(DCOMPOSITION_BORDER_MODE);
    HRESULT SetClip(IDCompositionClip);
    HRESULT SetClip(const(D2D_RECT_F)*);
    HRESULT SetContent(IUnknown);
    HRESULT AddVisual(IDCompositionVisual, BOOL, IDCompositionVisual);
    HRESULT RemoveVisual(IDCompositionVisual);
    HRESULT RemoveAllVisuals();
    HRESULT SetCompositeMode(DCOMPOSITION_COMPOSITE_MODE);
}
enum IID_IDCompositionEffect = GUID(0xec81b08f, 0xbfcb, 0x4e8d, [0xb1, 0x93, 0xa9, 0x15, 0x58, 0x79, 0x99, 0xe8]);
interface IDCompositionEffect : IUnknown
{
}
enum IID_IDCompositionTransform3D = GUID(0x71185722, 0x246b, 0x41f2, [0xaa, 0xd1, 0x4, 0x43, 0xf7, 0xf4, 0xbf, 0xc2]);
interface IDCompositionTransform3D : IDCompositionEffect
{
}
enum IID_IDCompositionTransform = GUID(0xfd55faa7, 0x37e0, 0x4c20, [0x95, 0xd2, 0x9b, 0xe4, 0x5b, 0xc3, 0x3f, 0x55]);
interface IDCompositionTransform : IDCompositionTransform3D
{
}
enum IID_IDCompositionTranslateTransform = GUID(0x6791122, 0xc6f0, 0x417d, [0x83, 0x23, 0x26, 0x9e, 0x98, 0x7f, 0x59, 0x54]);
interface IDCompositionTranslateTransform : IDCompositionTransform
{
    HRESULT SetOffsetX(IDCompositionAnimation);
    HRESULT SetOffsetX(float);
    HRESULT SetOffsetY(IDCompositionAnimation);
    HRESULT SetOffsetY(float);
}
enum IID_IDCompositionScaleTransform = GUID(0x71fde914, 0x40ef, 0x45ef, [0xbd, 0x51, 0x68, 0xb0, 0x37, 0xc3, 0x39, 0xf9]);
interface IDCompositionScaleTransform : IDCompositionTransform
{
    HRESULT SetScaleX(IDCompositionAnimation);
    HRESULT SetScaleX(float);
    HRESULT SetScaleY(IDCompositionAnimation);
    HRESULT SetScaleY(float);
    HRESULT SetCenterX(IDCompositionAnimation);
    HRESULT SetCenterX(float);
    HRESULT SetCenterY(IDCompositionAnimation);
    HRESULT SetCenterY(float);
}
enum IID_IDCompositionRotateTransform = GUID(0x641ed83c, 0xae96, 0x46c5, [0x90, 0xdc, 0x32, 0x77, 0x4c, 0xc5, 0xc6, 0xd5]);
interface IDCompositionRotateTransform : IDCompositionTransform
{
    HRESULT SetAngle(IDCompositionAnimation);
    HRESULT SetAngle(float);
    HRESULT SetCenterX(IDCompositionAnimation);
    HRESULT SetCenterX(float);
    HRESULT SetCenterY(IDCompositionAnimation);
    HRESULT SetCenterY(float);
}
enum IID_IDCompositionSkewTransform = GUID(0xe57aa735, 0xdcdb, 0x4c72, [0x9c, 0x61, 0x5, 0x91, 0xf5, 0x88, 0x89, 0xee]);
interface IDCompositionSkewTransform : IDCompositionTransform
{
    HRESULT SetAngleX(IDCompositionAnimation);
    HRESULT SetAngleX(float);
    HRESULT SetAngleY(IDCompositionAnimation);
    HRESULT SetAngleY(float);
    HRESULT SetCenterX(IDCompositionAnimation);
    HRESULT SetCenterX(float);
    HRESULT SetCenterY(IDCompositionAnimation);
    HRESULT SetCenterY(float);
}
enum IID_IDCompositionMatrixTransform = GUID(0x16cdff07, 0xc503, 0x419c, [0x83, 0xf2, 0x9, 0x65, 0xc7, 0xaf, 0x1f, 0xa6]);
interface IDCompositionMatrixTransform : IDCompositionTransform
{
    HRESULT SetMatrix(const(D2D_MATRIX_3X2_F)*);
    HRESULT SetMatrixElement(int, int, IDCompositionAnimation);
    HRESULT SetMatrixElement(int, int, float);
}
enum IID_IDCompositionEffectGroup = GUID(0xa7929a74, 0xe6b2, 0x4bd6, [0x8b, 0x95, 0x40, 0x40, 0x11, 0x9c, 0xa3, 0x4d]);
interface IDCompositionEffectGroup : IDCompositionEffect
{
    HRESULT SetOpacity(IDCompositionAnimation);
    HRESULT SetOpacity(float);
    HRESULT SetTransform3D(IDCompositionTransform3D);
}
enum IID_IDCompositionTranslateTransform3D = GUID(0x91636d4b, 0x9ba1, 0x4532, [0xaa, 0xf7, 0xe3, 0x34, 0x49, 0x94, 0xd7, 0x88]);
interface IDCompositionTranslateTransform3D : IDCompositionTransform3D
{
    HRESULT SetOffsetX(IDCompositionAnimation);
    HRESULT SetOffsetX(float);
    HRESULT SetOffsetY(IDCompositionAnimation);
    HRESULT SetOffsetY(float);
    HRESULT SetOffsetZ(IDCompositionAnimation);
    HRESULT SetOffsetZ(float);
}
enum IID_IDCompositionScaleTransform3D = GUID(0x2a9e9ead, 0x364b, 0x4b15, [0xa7, 0xc4, 0xa1, 0x99, 0x7f, 0x78, 0xb3, 0x89]);
interface IDCompositionScaleTransform3D : IDCompositionTransform3D
{
    HRESULT SetScaleX(IDCompositionAnimation);
    HRESULT SetScaleX(float);
    HRESULT SetScaleY(IDCompositionAnimation);
    HRESULT SetScaleY(float);
    HRESULT SetScaleZ(IDCompositionAnimation);
    HRESULT SetScaleZ(float);
    HRESULT SetCenterX(IDCompositionAnimation);
    HRESULT SetCenterX(float);
    HRESULT SetCenterY(IDCompositionAnimation);
    HRESULT SetCenterY(float);
    HRESULT SetCenterZ(IDCompositionAnimation);
    HRESULT SetCenterZ(float);
}
enum IID_IDCompositionRotateTransform3D = GUID(0xd8f5b23f, 0xd429, 0x4a91, [0xb5, 0x5a, 0xd2, 0xf4, 0x5f, 0xd7, 0x5b, 0x18]);
interface IDCompositionRotateTransform3D : IDCompositionTransform3D
{
    HRESULT SetAngle(IDCompositionAnimation);
    HRESULT SetAngle(float);
    HRESULT SetAxisX(IDCompositionAnimation);
    HRESULT SetAxisX(float);
    HRESULT SetAxisY(IDCompositionAnimation);
    HRESULT SetAxisY(float);
    HRESULT SetAxisZ(IDCompositionAnimation);
    HRESULT SetAxisZ(float);
    HRESULT SetCenterX(IDCompositionAnimation);
    HRESULT SetCenterX(float);
    HRESULT SetCenterY(IDCompositionAnimation);
    HRESULT SetCenterY(float);
    HRESULT SetCenterZ(IDCompositionAnimation);
    HRESULT SetCenterZ(float);
}
enum IID_IDCompositionMatrixTransform3D = GUID(0x4b3363f0, 0x643b, 0x41b7, [0xb6, 0xe0, 0xcc, 0xf2, 0x2d, 0x34, 0x46, 0x7c]);
interface IDCompositionMatrixTransform3D : IDCompositionTransform3D
{
    HRESULT SetMatrix(const(D3DMATRIX)*);
    HRESULT SetMatrixElement(int, int, IDCompositionAnimation);
    HRESULT SetMatrixElement(int, int, float);
}
enum IID_IDCompositionClip = GUID(0x64ac3703, 0x9d3f, 0x45ec, [0xa1, 0x9, 0x7c, 0xac, 0xe, 0x7a, 0x13, 0xa7]);
interface IDCompositionClip : IUnknown
{
}
enum IID_IDCompositionRectangleClip = GUID(0x9842ad7d, 0xd9cf, 0x4908, [0xae, 0xd7, 0x48, 0xb5, 0x1d, 0xa5, 0xe7, 0xc2]);
interface IDCompositionRectangleClip : IDCompositionClip
{
    HRESULT SetLeft(IDCompositionAnimation);
    HRESULT SetLeft(float);
    HRESULT SetTop(IDCompositionAnimation);
    HRESULT SetTop(float);
    HRESULT SetRight(IDCompositionAnimation);
    HRESULT SetRight(float);
    HRESULT SetBottom(IDCompositionAnimation);
    HRESULT SetBottom(float);
    HRESULT SetTopLeftRadiusX(IDCompositionAnimation);
    HRESULT SetTopLeftRadiusX(float);
    HRESULT SetTopLeftRadiusY(IDCompositionAnimation);
    HRESULT SetTopLeftRadiusY(float);
    HRESULT SetTopRightRadiusX(IDCompositionAnimation);
    HRESULT SetTopRightRadiusX(float);
    HRESULT SetTopRightRadiusY(IDCompositionAnimation);
    HRESULT SetTopRightRadiusY(float);
    HRESULT SetBottomLeftRadiusX(IDCompositionAnimation);
    HRESULT SetBottomLeftRadiusX(float);
    HRESULT SetBottomLeftRadiusY(IDCompositionAnimation);
    HRESULT SetBottomLeftRadiusY(float);
    HRESULT SetBottomRightRadiusX(IDCompositionAnimation);
    HRESULT SetBottomRightRadiusX(float);
    HRESULT SetBottomRightRadiusY(IDCompositionAnimation);
    HRESULT SetBottomRightRadiusY(float);
}
enum IID_IDCompositionSurface = GUID(0xbb8a4953, 0x2c99, 0x4f5a, [0x96, 0xf5, 0x48, 0x19, 0x2, 0x7f, 0xa3, 0xac]);
interface IDCompositionSurface : IUnknown
{
    HRESULT BeginDraw(const(RECT)*, const(GUID)*, void**, POINT*);
    HRESULT EndDraw();
    HRESULT SuspendDraw();
    HRESULT ResumeDraw();
    HRESULT Scroll(const(RECT)*, const(RECT)*, int, int);
}
enum IID_IDCompositionVirtualSurface = GUID(0xae471c51, 0x5f53, 0x4a24, [0x8d, 0x3e, 0xd0, 0xc3, 0x9c, 0x30, 0xb3, 0xf0]);
interface IDCompositionVirtualSurface : IDCompositionSurface
{
    HRESULT Resize(uint, uint);
    HRESULT Trim(const(RECT)*, uint);
}
enum IID_IDCompositionDevice2 = GUID(0x75f6468d, 0x1b8e, 0x447c, [0x9b, 0xc6, 0x75, 0xfe, 0xa8, 0xb, 0x5b, 0x25]);
interface IDCompositionDevice2 : IUnknown
{
    HRESULT Commit();
    HRESULT WaitForCommitCompletion();
    HRESULT GetFrameStatistics(DCOMPOSITION_FRAME_STATISTICS*);
    HRESULT CreateVisual(IDCompositionVisual2*);
    HRESULT CreateSurfaceFactory(IUnknown, IDCompositionSurfaceFactory*);
    HRESULT CreateSurface(uint, uint, DXGI_FORMAT, DXGI_ALPHA_MODE, IDCompositionSurface*);
    HRESULT CreateVirtualSurface(uint, uint, DXGI_FORMAT, DXGI_ALPHA_MODE, IDCompositionVirtualSurface*);
    HRESULT CreateTranslateTransform(IDCompositionTranslateTransform*);
    HRESULT CreateScaleTransform(IDCompositionScaleTransform*);
    HRESULT CreateRotateTransform(IDCompositionRotateTransform*);
    HRESULT CreateSkewTransform(IDCompositionSkewTransform*);
    HRESULT CreateMatrixTransform(IDCompositionMatrixTransform*);
    HRESULT CreateTransformGroup(IDCompositionTransform*, uint, IDCompositionTransform*);
    HRESULT CreateTranslateTransform3D(IDCompositionTranslateTransform3D*);
    HRESULT CreateScaleTransform3D(IDCompositionScaleTransform3D*);
    HRESULT CreateRotateTransform3D(IDCompositionRotateTransform3D*);
    HRESULT CreateMatrixTransform3D(IDCompositionMatrixTransform3D*);
    HRESULT CreateTransform3DGroup(IDCompositionTransform3D*, uint, IDCompositionTransform3D*);
    HRESULT CreateEffectGroup(IDCompositionEffectGroup*);
    HRESULT CreateRectangleClip(IDCompositionRectangleClip*);
    HRESULT CreateAnimation(IDCompositionAnimation*);
}
enum IID_IDCompositionDesktopDevice = GUID(0x5f4633fe, 0x1e08, 0x4cb8, [0x8c, 0x75, 0xce, 0x24, 0x33, 0x3f, 0x56, 0x2]);
interface IDCompositionDesktopDevice : IDCompositionDevice2
{
    HRESULT CreateTargetForHwnd(HWND, BOOL, IDCompositionTarget*);
    HRESULT CreateSurfaceFromHandle(HANDLE, IUnknown*);
    HRESULT CreateSurfaceFromHwnd(HWND, IUnknown*);
}
enum IID_IDCompositionDeviceDebug = GUID(0xa1a3c64a, 0x224f, 0x4a81, [0x97, 0x73, 0x4f, 0x3, 0xa8, 0x9d, 0x3c, 0x6c]);
interface IDCompositionDeviceDebug : IUnknown
{
    HRESULT EnableDebugCounters();
    HRESULT DisableDebugCounters();
}
enum IID_IDCompositionSurfaceFactory = GUID(0xe334bc12, 0x3937, 0x4e02, [0x85, 0xeb, 0xfc, 0xf4, 0xeb, 0x30, 0xd2, 0xc8]);
interface IDCompositionSurfaceFactory : IUnknown
{
    HRESULT CreateSurface(uint, uint, DXGI_FORMAT, DXGI_ALPHA_MODE, IDCompositionSurface*);
    HRESULT CreateVirtualSurface(uint, uint, DXGI_FORMAT, DXGI_ALPHA_MODE, IDCompositionVirtualSurface*);
}
enum IID_IDCompositionVisual2 = GUID(0xe8de1639, 0x4331, 0x4b26, [0xbc, 0x5f, 0x6a, 0x32, 0x1d, 0x34, 0x7a, 0x85]);
interface IDCompositionVisual2 : IDCompositionVisual
{
    HRESULT SetOpacityMode(DCOMPOSITION_OPACITY_MODE);
    HRESULT SetBackFaceVisibility(DCOMPOSITION_BACKFACE_VISIBILITY);
}
enum IID_IDCompositionVisualDebug = GUID(0xfed2b808, 0x5eb4, 0x43a0, [0xae, 0xa3, 0x35, 0xf6, 0x52, 0x80, 0xf9, 0x1b]);
interface IDCompositionVisualDebug : IDCompositionVisual2
{
    HRESULT EnableHeatMap(const(D2D1_COLOR_F)*);
    HRESULT DisableHeatMap();
    HRESULT EnableRedrawRegions();
    HRESULT DisableRedrawRegions();
}
enum IID_IDCompositionVisual3 = GUID(0x2775f462, 0xb6c1, 0x4015, [0xb0, 0xbe, 0xb3, 0xe7, 0xd6, 0xa4, 0x97, 0x6d]);
interface IDCompositionVisual3 : IDCompositionVisualDebug
{
    HRESULT SetDepthMode(DCOMPOSITION_DEPTH_MODE);
    HRESULT SetOffsetZ(IDCompositionAnimation);
    HRESULT SetOffsetZ(float);
    HRESULT SetOpacity(IDCompositionAnimation);
    HRESULT SetOpacity(float);
    HRESULT SetTransform(IDCompositionTransform3D);
    HRESULT SetTransform(const(D2D_MATRIX_4X4_F)*);
    HRESULT SetVisible(BOOL);
}
enum IID_IDCompositionDevice3 = GUID(0x987cb06, 0xf916, 0x48bf, [0x8d, 0x35, 0xce, 0x76, 0x41, 0x78, 0x1b, 0xd9]);
interface IDCompositionDevice3 : IDCompositionDevice2
{
    HRESULT CreateGaussianBlurEffect(IDCompositionGaussianBlurEffect*);
    HRESULT CreateBrightnessEffect(IDCompositionBrightnessEffect*);
    HRESULT CreateColorMatrixEffect(IDCompositionColorMatrixEffect*);
    HRESULT CreateShadowEffect(IDCompositionShadowEffect*);
    HRESULT CreateHueRotationEffect(IDCompositionHueRotationEffect*);
    HRESULT CreateSaturationEffect(IDCompositionSaturationEffect*);
    HRESULT CreateTurbulenceEffect(IDCompositionTurbulenceEffect*);
    HRESULT CreateLinearTransferEffect(IDCompositionLinearTransferEffect*);
    HRESULT CreateTableTransferEffect(IDCompositionTableTransferEffect*);
    HRESULT CreateCompositeEffect(IDCompositionCompositeEffect*);
    HRESULT CreateBlendEffect(IDCompositionBlendEffect*);
    HRESULT CreateArithmeticCompositeEffect(IDCompositionArithmeticCompositeEffect*);
    HRESULT CreateAffineTransform2DEffect(IDCompositionAffineTransform2DEffect*);
}
enum IID_IDCompositionFilterEffect = GUID(0x30c421d5, 0x8cb2, 0x4e9f, [0xb1, 0x33, 0x37, 0xbe, 0x27, 0xd, 0x4a, 0xc2]);
interface IDCompositionFilterEffect : IDCompositionEffect
{
    HRESULT SetInput(uint, IUnknown, uint);
}
enum IID_IDCompositionGaussianBlurEffect = GUID(0x45d4d0b7, 0x1bd4, 0x454e, [0x88, 0x94, 0x2b, 0xfa, 0x68, 0x44, 0x30, 0x33]);
interface IDCompositionGaussianBlurEffect : IDCompositionFilterEffect
{
    HRESULT SetStandardDeviation(IDCompositionAnimation);
    HRESULT SetStandardDeviation(float);
    HRESULT SetBorderMode(D2D1_BORDER_MODE);
}
enum IID_IDCompositionBrightnessEffect = GUID(0x6027496e, 0xcb3a, 0x49ab, [0x93, 0x4f, 0xd7, 0x98, 0xda, 0x4f, 0x7d, 0xa6]);
interface IDCompositionBrightnessEffect : IDCompositionFilterEffect
{
    HRESULT SetWhitePoint(const(D2D_VECTOR_2F)*);
    HRESULT SetBlackPoint(const(D2D_VECTOR_2F)*);
    HRESULT SetWhitePointX(IDCompositionAnimation);
    HRESULT SetWhitePointX(float);
    HRESULT SetWhitePointY(IDCompositionAnimation);
    HRESULT SetWhitePointY(float);
    HRESULT SetBlackPointX(IDCompositionAnimation);
    HRESULT SetBlackPointX(float);
    HRESULT SetBlackPointY(IDCompositionAnimation);
    HRESULT SetBlackPointY(float);
}
enum IID_IDCompositionColorMatrixEffect = GUID(0xc1170a22, 0x3ce2, 0x4966, [0x90, 0xd4, 0x55, 0x40, 0x8b, 0xfc, 0x84, 0xc4]);
interface IDCompositionColorMatrixEffect : IDCompositionFilterEffect
{
    HRESULT SetMatrix(const(D2D_MATRIX_5X4_F)*);
    HRESULT SetMatrixElement(int, int, IDCompositionAnimation);
    HRESULT SetMatrixElement(int, int, float);
    HRESULT SetAlphaMode(D2D1_COLORMATRIX_ALPHA_MODE);
    HRESULT SetClampOutput(BOOL);
}
enum IID_IDCompositionShadowEffect = GUID(0x4ad18ac0, 0xcfd2, 0x4c2f, [0xbb, 0x62, 0x96, 0xe5, 0x4f, 0xdb, 0x68, 0x79]);
interface IDCompositionShadowEffect : IDCompositionFilterEffect
{
    HRESULT SetStandardDeviation(IDCompositionAnimation);
    HRESULT SetStandardDeviation(float);
    HRESULT SetColor(const(D2D_VECTOR_4F)*);
    HRESULT SetRed(IDCompositionAnimation);
    HRESULT SetRed(float);
    HRESULT SetGreen(IDCompositionAnimation);
    HRESULT SetGreen(float);
    HRESULT SetBlue(IDCompositionAnimation);
    HRESULT SetBlue(float);
    HRESULT SetAlpha(IDCompositionAnimation);
    HRESULT SetAlpha(float);
}
enum IID_IDCompositionHueRotationEffect = GUID(0x6db9f920, 0x770, 0x4781, [0xb0, 0xc6, 0x38, 0x19, 0x12, 0xf9, 0xd1, 0x67]);
interface IDCompositionHueRotationEffect : IDCompositionFilterEffect
{
    HRESULT SetAngle(IDCompositionAnimation);
    HRESULT SetAngle(float);
}
enum IID_IDCompositionSaturationEffect = GUID(0xa08debda, 0x3258, 0x4fa4, [0x9f, 0x16, 0x91, 0x74, 0xd3, 0xfe, 0x93, 0xb1]);
interface IDCompositionSaturationEffect : IDCompositionFilterEffect
{
    HRESULT SetSaturation(IDCompositionAnimation);
    HRESULT SetSaturation(float);
}
enum IID_IDCompositionTurbulenceEffect = GUID(0xa6a55bda, 0xc09c, 0x49f3, [0x91, 0x93, 0xa4, 0x19, 0x22, 0xc8, 0x97, 0x15]);
interface IDCompositionTurbulenceEffect : IDCompositionFilterEffect
{
    HRESULT SetOffset(const(D2D_VECTOR_2F)*);
    HRESULT SetBaseFrequency(const(D2D_VECTOR_2F)*);
    HRESULT SetSize(const(D2D_VECTOR_2F)*);
    HRESULT SetNumOctaves(uint);
    HRESULT SetSeed(uint);
    HRESULT SetNoise(D2D1_TURBULENCE_NOISE);
    HRESULT SetStitchable(BOOL);
}
enum IID_IDCompositionLinearTransferEffect = GUID(0x4305ee5b, 0xc4a0, 0x4c88, [0x93, 0x85, 0x67, 0x12, 0x4e, 0x1, 0x76, 0x83]);
interface IDCompositionLinearTransferEffect : IDCompositionFilterEffect
{
    HRESULT SetRedYIntercept(IDCompositionAnimation);
    HRESULT SetRedYIntercept(float);
    HRESULT SetRedSlope(IDCompositionAnimation);
    HRESULT SetRedSlope(float);
    HRESULT SetRedDisable(BOOL);
    HRESULT SetGreenYIntercept(IDCompositionAnimation);
    HRESULT SetGreenYIntercept(float);
    HRESULT SetGreenSlope(IDCompositionAnimation);
    HRESULT SetGreenSlope(float);
    HRESULT SetGreenDisable(BOOL);
    HRESULT SetBlueYIntercept(IDCompositionAnimation);
    HRESULT SetBlueYIntercept(float);
    HRESULT SetBlueSlope(IDCompositionAnimation);
    HRESULT SetBlueSlope(float);
    HRESULT SetBlueDisable(BOOL);
    HRESULT SetAlphaYIntercept(IDCompositionAnimation);
    HRESULT SetAlphaYIntercept(float);
    HRESULT SetAlphaSlope(IDCompositionAnimation);
    HRESULT SetAlphaSlope(float);
    HRESULT SetAlphaDisable(BOOL);
    HRESULT SetClampOutput(BOOL);
}
enum IID_IDCompositionTableTransferEffect = GUID(0x9b7e82e2, 0x69c5, 0x4eb4, [0xa5, 0xf5, 0xa7, 0x3, 0x3f, 0x51, 0x32, 0xcd]);
interface IDCompositionTableTransferEffect : IDCompositionFilterEffect
{
    HRESULT SetRedTable(const(float)*, uint);
    HRESULT SetGreenTable(const(float)*, uint);
    HRESULT SetBlueTable(const(float)*, uint);
    HRESULT SetAlphaTable(const(float)*, uint);
    HRESULT SetRedDisable(BOOL);
    HRESULT SetGreenDisable(BOOL);
    HRESULT SetBlueDisable(BOOL);
    HRESULT SetAlphaDisable(BOOL);
    HRESULT SetClampOutput(BOOL);
    HRESULT SetRedTableValue(uint, IDCompositionAnimation);
    HRESULT SetRedTableValue(uint, float);
    HRESULT SetGreenTableValue(uint, IDCompositionAnimation);
    HRESULT SetGreenTableValue(uint, float);
    HRESULT SetBlueTableValue(uint, IDCompositionAnimation);
    HRESULT SetBlueTableValue(uint, float);
    HRESULT SetAlphaTableValue(uint, IDCompositionAnimation);
    HRESULT SetAlphaTableValue(uint, float);
}
enum IID_IDCompositionCompositeEffect = GUID(0x576616c0, 0xa231, 0x494d, [0xa3, 0x8d, 0x0, 0xfd, 0x5e, 0xc4, 0xdb, 0x46]);
interface IDCompositionCompositeEffect : IDCompositionFilterEffect
{
    HRESULT SetMode(D2D1_COMPOSITE_MODE);
}
enum IID_IDCompositionBlendEffect = GUID(0x33ecdc0a, 0x578a, 0x4a11, [0x9c, 0x14, 0xc, 0xb9, 0x5, 0x17, 0xf9, 0xc5]);
interface IDCompositionBlendEffect : IDCompositionFilterEffect
{
    HRESULT SetMode(D2D1_BLEND_MODE);
}
enum IID_IDCompositionArithmeticCompositeEffect = GUID(0x3b67dfa8, 0xe3dd, 0x4e61, [0xb6, 0x40, 0x46, 0xc2, 0xf3, 0xd7, 0x39, 0xdc]);
interface IDCompositionArithmeticCompositeEffect : IDCompositionFilterEffect
{
    HRESULT SetCoefficients(const(D2D_VECTOR_4F)*);
    HRESULT SetClampOutput(BOOL);
    HRESULT SetCoefficient1(IDCompositionAnimation);
    HRESULT SetCoefficient1(float);
    HRESULT SetCoefficient2(IDCompositionAnimation);
    HRESULT SetCoefficient2(float);
    HRESULT SetCoefficient3(IDCompositionAnimation);
    HRESULT SetCoefficient3(float);
    HRESULT SetCoefficient4(IDCompositionAnimation);
    HRESULT SetCoefficient4(float);
}
enum IID_IDCompositionAffineTransform2DEffect = GUID(0xb74b9e8, 0xcdd6, 0x492f, [0xbb, 0xbc, 0x5e, 0xd3, 0x21, 0x57, 0x2, 0x6d]);
interface IDCompositionAffineTransform2DEffect : IDCompositionFilterEffect
{
    HRESULT SetInterpolationMode(D2D1_2DAFFINETRANSFORM_INTERPOLATION_MODE);
    HRESULT SetBorderMode(D2D1_BORDER_MODE);
    HRESULT SetTransformMatrix(const(D2D_MATRIX_3X2_F)*);
    HRESULT SetTransformMatrixElement(int, int, IDCompositionAnimation);
    HRESULT SetTransformMatrixElement(int, int, float);
    HRESULT SetSharpness(IDCompositionAnimation);
    HRESULT SetSharpness(float);
}
struct DCompositionInkTrailPoint
{
    float x;
    float y;
    float radius;
}
enum IID_IDCompositionDelegatedInkTrail = GUID(0xc2448e9b, 0x547d, 0x4057, [0x8c, 0xf5, 0x81, 0x44, 0xed, 0xe1, 0xc2, 0xda]);
interface IDCompositionDelegatedInkTrail : IUnknown
{
    HRESULT AddTrailPoints(const(DCompositionInkTrailPoint)*, uint, uint*);
    HRESULT AddTrailPointsWithPrediction(const(DCompositionInkTrailPoint)*, uint, const(DCompositionInkTrailPoint)*, uint, uint*);
    HRESULT RemoveTrailPoints(uint);
    HRESULT StartNewTrail(const(D2D1_COLOR_F)*);
}
enum IID_IDCompositionInkTrailDevice = GUID(0xdf0c7cec, 0xcdeb, 0x4d4a, [0xb9, 0x1c, 0x72, 0x1b, 0xf2, 0x2f, 0x4e, 0x6c]);
interface IDCompositionInkTrailDevice : IUnknown
{
    HRESULT CreateDelegatedInkTrail(IDCompositionDelegatedInkTrail*);
    HRESULT CreateDelegatedInkTrailForSwapChain(IUnknown, IDCompositionDelegatedInkTrail*);
}
