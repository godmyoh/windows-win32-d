module windows.win32.graphics.directcomposition;

import windows.win32.guid : GUID;
import windows.win32.foundation : BOOL, HANDLE, HRESULT, HWND, LUID, POINT, RECT;
import windows.win32.graphics.direct2d.common : D2D1_2DAFFINETRANSFORM_INTERPOLATION_MODE, D2D1_BLEND_MODE, D2D1_BORDER_MODE, D2D1_COLORMATRIX_ALPHA_MODE, D2D1_COLOR_F, D2D1_COMPOSITE_MODE, D2D1_TURBULENCE_NOISE, D2D_MATRIX_3X2_F, D2D_MATRIX_4X4_F, D2D_MATRIX_5X4_F, D2D_RECT_F, D2D_RECT_U, D2D_VECTOR_2F, D2D_VECTOR_4F;
import windows.win32.graphics.direct3d : D3DMATRIX;
import windows.win32.graphics.dxgi : IDXGIDevice;
import windows.win32.graphics.dxgi.common : DXGI_ALPHA_MODE, DXGI_COLOR_SPACE_TYPE, DXGI_FORMAT, DXGI_RATIONAL;
import windows.win32.security : SECURITY_ATTRIBUTES;
import windows.win32.system.com : IUnknown;

version (Windows):
extern (Windows):

HRESULT DCompositionCreateDevice(IDXGIDevice dxgiDevice, const(GUID)* iid, void** dcompositionDevice);
HRESULT DCompositionCreateDevice2(IUnknown renderingDevice, const(GUID)* iid, void** dcompositionDevice);
HRESULT DCompositionCreateDevice3(IUnknown renderingDevice, const(GUID)* iid, void** dcompositionDevice);
HRESULT DCompositionCreateSurfaceHandle(uint desiredAccess, SECURITY_ATTRIBUTES* securityAttributes, HANDLE* surfaceHandle);
HRESULT DCompositionAttachMouseWheelToHwnd(IDCompositionVisual visual, HWND hwnd, BOOL enable);
HRESULT DCompositionAttachMouseDragToHwnd(IDCompositionVisual visual, HWND hwnd, BOOL enable);
HRESULT DCompositionGetFrameId(COMPOSITION_FRAME_ID_TYPE frameIdType, ulong* frameId);
HRESULT DCompositionGetStatistics(ulong frameId, COMPOSITION_FRAME_STATS* frameStats, uint targetIdCount, COMPOSITION_TARGET_ID* targetIds, uint* actualTargetIdCount);
HRESULT DCompositionGetTargetStatistics(ulong frameId, const(COMPOSITION_TARGET_ID)* targetId, COMPOSITION_TARGET_STATS* targetStats);
HRESULT DCompositionBoostCompositorClock(BOOL enable);
uint DCompositionWaitForCompositorClock(uint count, const(HANDLE)* handles, uint timeoutInMs);
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
    long lastFrameTime;
    DXGI_RATIONAL currentCompositionRate;
    long currentTime;
    long timeFrequency;
    long nextEstimatedFrameTime;
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
    HRESULT SetAbsoluteBeginTime(long beginTime);
    HRESULT AddCubic(double beginOffset, float constantCoefficient, float linearCoefficient, float quadraticCoefficient, float cubicCoefficient);
    HRESULT AddSinusoidal(double beginOffset, float bias, float amplitude, float frequency, float phase);
    HRESULT AddRepeat(double beginOffset, double durationToRepeat);
    HRESULT End(double endOffset, float endValue);
}
enum IID_IDCompositionDevice = GUID(0xc37ea93a, 0xe7aa, 0x450d, [0xb1, 0x6f, 0x97, 0x46, 0xcb, 0x4, 0x7, 0xf3]);
interface IDCompositionDevice : IUnknown
{
    HRESULT Commit();
    HRESULT WaitForCommitCompletion();
    HRESULT GetFrameStatistics(DCOMPOSITION_FRAME_STATISTICS* statistics);
    HRESULT CreateTargetForHwnd(HWND hwnd, BOOL topmost, IDCompositionTarget* target);
    HRESULT CreateVisual(IDCompositionVisual* visual);
    HRESULT CreateSurface(uint width, uint height, DXGI_FORMAT pixelFormat, DXGI_ALPHA_MODE alphaMode, IDCompositionSurface* surface);
    HRESULT CreateVirtualSurface(uint initialWidth, uint initialHeight, DXGI_FORMAT pixelFormat, DXGI_ALPHA_MODE alphaMode, IDCompositionVirtualSurface* virtualSurface);
    HRESULT CreateSurfaceFromHandle(HANDLE handle, IUnknown* surface);
    HRESULT CreateSurfaceFromHwnd(HWND hwnd, IUnknown* surface);
    HRESULT CreateTranslateTransform(IDCompositionTranslateTransform* translateTransform);
    HRESULT CreateScaleTransform(IDCompositionScaleTransform* scaleTransform);
    HRESULT CreateRotateTransform(IDCompositionRotateTransform* rotateTransform);
    HRESULT CreateSkewTransform(IDCompositionSkewTransform* skewTransform);
    HRESULT CreateMatrixTransform(IDCompositionMatrixTransform* matrixTransform);
    HRESULT CreateTransformGroup(IDCompositionTransform* transforms, uint elements, IDCompositionTransform* transformGroup);
    HRESULT CreateTranslateTransform3D(IDCompositionTranslateTransform3D* translateTransform3D);
    HRESULT CreateScaleTransform3D(IDCompositionScaleTransform3D* scaleTransform3D);
    HRESULT CreateRotateTransform3D(IDCompositionRotateTransform3D* rotateTransform3D);
    HRESULT CreateMatrixTransform3D(IDCompositionMatrixTransform3D* matrixTransform3D);
    HRESULT CreateTransform3DGroup(IDCompositionTransform3D* transforms3D, uint elements, IDCompositionTransform3D* transform3DGroup);
    HRESULT CreateEffectGroup(IDCompositionEffectGroup* effectGroup);
    HRESULT CreateRectangleClip(IDCompositionRectangleClip* clip);
    HRESULT CreateAnimation(IDCompositionAnimation* animation);
    HRESULT CheckDeviceState(BOOL* pfValid);
}
enum IID_IDCompositionTarget = GUID(0xeacdd04c, 0x117e, 0x4e17, [0x88, 0xf4, 0xd1, 0xb1, 0x2b, 0xe, 0x3d, 0x89]);
interface IDCompositionTarget : IUnknown
{
    HRESULT SetRoot(IDCompositionVisual visual);
}
enum IID_IDCompositionVisual = GUID(0x4d93059d, 0x97b, 0x4651, [0x9a, 0x60, 0xf0, 0xf2, 0x51, 0x16, 0xe2, 0xf3]);
interface IDCompositionVisual : IUnknown
{
    HRESULT SetOffsetX(IDCompositionAnimation animation);
    HRESULT SetOffsetX(float offsetX);
    HRESULT SetOffsetY(IDCompositionAnimation animation);
    HRESULT SetOffsetY(float offsetY);
    HRESULT SetTransform(IDCompositionTransform transform);
    HRESULT SetTransform(const(D2D_MATRIX_3X2_F)* matrix);
    HRESULT SetTransformParent(IDCompositionVisual visual);
    HRESULT SetEffect(IDCompositionEffect effect);
    HRESULT SetBitmapInterpolationMode(DCOMPOSITION_BITMAP_INTERPOLATION_MODE interpolationMode);
    HRESULT SetBorderMode(DCOMPOSITION_BORDER_MODE borderMode);
    HRESULT SetClip(IDCompositionClip clip);
    HRESULT SetClip(const(D2D_RECT_F)* rect);
    HRESULT SetContent(IUnknown content);
    HRESULT AddVisual(IDCompositionVisual visual, BOOL insertAbove, IDCompositionVisual referenceVisual);
    HRESULT RemoveVisual(IDCompositionVisual visual);
    HRESULT RemoveAllVisuals();
    HRESULT SetCompositeMode(DCOMPOSITION_COMPOSITE_MODE compositeMode);
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
    HRESULT SetOffsetX(IDCompositionAnimation animation);
    HRESULT SetOffsetX(float offsetX);
    HRESULT SetOffsetY(IDCompositionAnimation animation);
    HRESULT SetOffsetY(float offsetY);
}
enum IID_IDCompositionScaleTransform = GUID(0x71fde914, 0x40ef, 0x45ef, [0xbd, 0x51, 0x68, 0xb0, 0x37, 0xc3, 0x39, 0xf9]);
interface IDCompositionScaleTransform : IDCompositionTransform
{
    HRESULT SetScaleX(IDCompositionAnimation animation);
    HRESULT SetScaleX(float scaleX);
    HRESULT SetScaleY(IDCompositionAnimation animation);
    HRESULT SetScaleY(float scaleY);
    HRESULT SetCenterX(IDCompositionAnimation animation);
    HRESULT SetCenterX(float centerX);
    HRESULT SetCenterY(IDCompositionAnimation animation);
    HRESULT SetCenterY(float centerY);
}
enum IID_IDCompositionRotateTransform = GUID(0x641ed83c, 0xae96, 0x46c5, [0x90, 0xdc, 0x32, 0x77, 0x4c, 0xc5, 0xc6, 0xd5]);
interface IDCompositionRotateTransform : IDCompositionTransform
{
    HRESULT SetAngle(IDCompositionAnimation animation);
    HRESULT SetAngle(float angle);
    HRESULT SetCenterX(IDCompositionAnimation animation);
    HRESULT SetCenterX(float centerX);
    HRESULT SetCenterY(IDCompositionAnimation animation);
    HRESULT SetCenterY(float centerY);
}
enum IID_IDCompositionSkewTransform = GUID(0xe57aa735, 0xdcdb, 0x4c72, [0x9c, 0x61, 0x5, 0x91, 0xf5, 0x88, 0x89, 0xee]);
interface IDCompositionSkewTransform : IDCompositionTransform
{
    HRESULT SetAngleX(IDCompositionAnimation animation);
    HRESULT SetAngleX(float angleX);
    HRESULT SetAngleY(IDCompositionAnimation animation);
    HRESULT SetAngleY(float angleY);
    HRESULT SetCenterX(IDCompositionAnimation animation);
    HRESULT SetCenterX(float centerX);
    HRESULT SetCenterY(IDCompositionAnimation animation);
    HRESULT SetCenterY(float centerY);
}
enum IID_IDCompositionMatrixTransform = GUID(0x16cdff07, 0xc503, 0x419c, [0x83, 0xf2, 0x9, 0x65, 0xc7, 0xaf, 0x1f, 0xa6]);
interface IDCompositionMatrixTransform : IDCompositionTransform
{
    HRESULT SetMatrix(const(D2D_MATRIX_3X2_F)* matrix);
    HRESULT SetMatrixElement(int row, int column, IDCompositionAnimation animation);
    HRESULT SetMatrixElement(int row, int column, float value);
}
enum IID_IDCompositionEffectGroup = GUID(0xa7929a74, 0xe6b2, 0x4bd6, [0x8b, 0x95, 0x40, 0x40, 0x11, 0x9c, 0xa3, 0x4d]);
interface IDCompositionEffectGroup : IDCompositionEffect
{
    HRESULT SetOpacity(IDCompositionAnimation animation);
    HRESULT SetOpacity(float opacity);
    HRESULT SetTransform3D(IDCompositionTransform3D transform3D);
}
enum IID_IDCompositionTranslateTransform3D = GUID(0x91636d4b, 0x9ba1, 0x4532, [0xaa, 0xf7, 0xe3, 0x34, 0x49, 0x94, 0xd7, 0x88]);
interface IDCompositionTranslateTransform3D : IDCompositionTransform3D
{
    HRESULT SetOffsetX(IDCompositionAnimation animation);
    HRESULT SetOffsetX(float offsetX);
    HRESULT SetOffsetY(IDCompositionAnimation animation);
    HRESULT SetOffsetY(float offsetY);
    HRESULT SetOffsetZ(IDCompositionAnimation animation);
    HRESULT SetOffsetZ(float offsetZ);
}
enum IID_IDCompositionScaleTransform3D = GUID(0x2a9e9ead, 0x364b, 0x4b15, [0xa7, 0xc4, 0xa1, 0x99, 0x7f, 0x78, 0xb3, 0x89]);
interface IDCompositionScaleTransform3D : IDCompositionTransform3D
{
    HRESULT SetScaleX(IDCompositionAnimation animation);
    HRESULT SetScaleX(float scaleX);
    HRESULT SetScaleY(IDCompositionAnimation animation);
    HRESULT SetScaleY(float scaleY);
    HRESULT SetScaleZ(IDCompositionAnimation animation);
    HRESULT SetScaleZ(float scaleZ);
    HRESULT SetCenterX(IDCompositionAnimation animation);
    HRESULT SetCenterX(float centerX);
    HRESULT SetCenterY(IDCompositionAnimation animation);
    HRESULT SetCenterY(float centerY);
    HRESULT SetCenterZ(IDCompositionAnimation animation);
    HRESULT SetCenterZ(float centerZ);
}
enum IID_IDCompositionRotateTransform3D = GUID(0xd8f5b23f, 0xd429, 0x4a91, [0xb5, 0x5a, 0xd2, 0xf4, 0x5f, 0xd7, 0x5b, 0x18]);
interface IDCompositionRotateTransform3D : IDCompositionTransform3D
{
    HRESULT SetAngle(IDCompositionAnimation animation);
    HRESULT SetAngle(float angle);
    HRESULT SetAxisX(IDCompositionAnimation animation);
    HRESULT SetAxisX(float axisX);
    HRESULT SetAxisY(IDCompositionAnimation animation);
    HRESULT SetAxisY(float axisY);
    HRESULT SetAxisZ(IDCompositionAnimation animation);
    HRESULT SetAxisZ(float axisZ);
    HRESULT SetCenterX(IDCompositionAnimation animation);
    HRESULT SetCenterX(float centerX);
    HRESULT SetCenterY(IDCompositionAnimation animation);
    HRESULT SetCenterY(float centerY);
    HRESULT SetCenterZ(IDCompositionAnimation animation);
    HRESULT SetCenterZ(float centerZ);
}
enum IID_IDCompositionMatrixTransform3D = GUID(0x4b3363f0, 0x643b, 0x41b7, [0xb6, 0xe0, 0xcc, 0xf2, 0x2d, 0x34, 0x46, 0x7c]);
interface IDCompositionMatrixTransform3D : IDCompositionTransform3D
{
    HRESULT SetMatrix(const(D3DMATRIX)* matrix);
    HRESULT SetMatrixElement(int row, int column, IDCompositionAnimation animation);
    HRESULT SetMatrixElement(int row, int column, float value);
}
enum IID_IDCompositionClip = GUID(0x64ac3703, 0x9d3f, 0x45ec, [0xa1, 0x9, 0x7c, 0xac, 0xe, 0x7a, 0x13, 0xa7]);
interface IDCompositionClip : IUnknown
{
}
enum IID_IDCompositionRectangleClip = GUID(0x9842ad7d, 0xd9cf, 0x4908, [0xae, 0xd7, 0x48, 0xb5, 0x1d, 0xa5, 0xe7, 0xc2]);
interface IDCompositionRectangleClip : IDCompositionClip
{
    HRESULT SetLeft(IDCompositionAnimation animation);
    HRESULT SetLeft(float left);
    HRESULT SetTop(IDCompositionAnimation animation);
    HRESULT SetTop(float top);
    HRESULT SetRight(IDCompositionAnimation animation);
    HRESULT SetRight(float right);
    HRESULT SetBottom(IDCompositionAnimation animation);
    HRESULT SetBottom(float bottom);
    HRESULT SetTopLeftRadiusX(IDCompositionAnimation animation);
    HRESULT SetTopLeftRadiusX(float radius);
    HRESULT SetTopLeftRadiusY(IDCompositionAnimation animation);
    HRESULT SetTopLeftRadiusY(float radius);
    HRESULT SetTopRightRadiusX(IDCompositionAnimation animation);
    HRESULT SetTopRightRadiusX(float radius);
    HRESULT SetTopRightRadiusY(IDCompositionAnimation animation);
    HRESULT SetTopRightRadiusY(float radius);
    HRESULT SetBottomLeftRadiusX(IDCompositionAnimation animation);
    HRESULT SetBottomLeftRadiusX(float radius);
    HRESULT SetBottomLeftRadiusY(IDCompositionAnimation animation);
    HRESULT SetBottomLeftRadiusY(float radius);
    HRESULT SetBottomRightRadiusX(IDCompositionAnimation animation);
    HRESULT SetBottomRightRadiusX(float radius);
    HRESULT SetBottomRightRadiusY(IDCompositionAnimation animation);
    HRESULT SetBottomRightRadiusY(float radius);
}
enum IID_IDCompositionSurface = GUID(0xbb8a4953, 0x2c99, 0x4f5a, [0x96, 0xf5, 0x48, 0x19, 0x2, 0x7f, 0xa3, 0xac]);
interface IDCompositionSurface : IUnknown
{
    HRESULT BeginDraw(const(RECT)* updateRect, const(GUID)* iid, void** updateObject, POINT* updateOffset);
    HRESULT EndDraw();
    HRESULT SuspendDraw();
    HRESULT ResumeDraw();
    HRESULT Scroll(const(RECT)* scrollRect, const(RECT)* clipRect, int offsetX, int offsetY);
}
enum IID_IDCompositionVirtualSurface = GUID(0xae471c51, 0x5f53, 0x4a24, [0x8d, 0x3e, 0xd0, 0xc3, 0x9c, 0x30, 0xb3, 0xf0]);
interface IDCompositionVirtualSurface : IDCompositionSurface
{
    HRESULT Resize(uint width, uint height);
    HRESULT Trim(const(RECT)* rectangles, uint count);
}
enum IID_IDCompositionDevice2 = GUID(0x75f6468d, 0x1b8e, 0x447c, [0x9b, 0xc6, 0x75, 0xfe, 0xa8, 0xb, 0x5b, 0x25]);
interface IDCompositionDevice2 : IUnknown
{
    HRESULT Commit();
    HRESULT WaitForCommitCompletion();
    HRESULT GetFrameStatistics(DCOMPOSITION_FRAME_STATISTICS* statistics);
    HRESULT CreateVisual(IDCompositionVisual2* visual);
    HRESULT CreateSurfaceFactory(IUnknown renderingDevice, IDCompositionSurfaceFactory* surfaceFactory);
    HRESULT CreateSurface(uint width, uint height, DXGI_FORMAT pixelFormat, DXGI_ALPHA_MODE alphaMode, IDCompositionSurface* surface);
    HRESULT CreateVirtualSurface(uint initialWidth, uint initialHeight, DXGI_FORMAT pixelFormat, DXGI_ALPHA_MODE alphaMode, IDCompositionVirtualSurface* virtualSurface);
    HRESULT CreateTranslateTransform(IDCompositionTranslateTransform* translateTransform);
    HRESULT CreateScaleTransform(IDCompositionScaleTransform* scaleTransform);
    HRESULT CreateRotateTransform(IDCompositionRotateTransform* rotateTransform);
    HRESULT CreateSkewTransform(IDCompositionSkewTransform* skewTransform);
    HRESULT CreateMatrixTransform(IDCompositionMatrixTransform* matrixTransform);
    HRESULT CreateTransformGroup(IDCompositionTransform* transforms, uint elements, IDCompositionTransform* transformGroup);
    HRESULT CreateTranslateTransform3D(IDCompositionTranslateTransform3D* translateTransform3D);
    HRESULT CreateScaleTransform3D(IDCompositionScaleTransform3D* scaleTransform3D);
    HRESULT CreateRotateTransform3D(IDCompositionRotateTransform3D* rotateTransform3D);
    HRESULT CreateMatrixTransform3D(IDCompositionMatrixTransform3D* matrixTransform3D);
    HRESULT CreateTransform3DGroup(IDCompositionTransform3D* transforms3D, uint elements, IDCompositionTransform3D* transform3DGroup);
    HRESULT CreateEffectGroup(IDCompositionEffectGroup* effectGroup);
    HRESULT CreateRectangleClip(IDCompositionRectangleClip* clip);
    HRESULT CreateAnimation(IDCompositionAnimation* animation);
}
enum IID_IDCompositionDesktopDevice = GUID(0x5f4633fe, 0x1e08, 0x4cb8, [0x8c, 0x75, 0xce, 0x24, 0x33, 0x3f, 0x56, 0x2]);
interface IDCompositionDesktopDevice : IDCompositionDevice2
{
    HRESULT CreateTargetForHwnd(HWND hwnd, BOOL topmost, IDCompositionTarget* target);
    HRESULT CreateSurfaceFromHandle(HANDLE handle, IUnknown* surface);
    HRESULT CreateSurfaceFromHwnd(HWND hwnd, IUnknown* surface);
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
    HRESULT CreateSurface(uint width, uint height, DXGI_FORMAT pixelFormat, DXGI_ALPHA_MODE alphaMode, IDCompositionSurface* surface);
    HRESULT CreateVirtualSurface(uint initialWidth, uint initialHeight, DXGI_FORMAT pixelFormat, DXGI_ALPHA_MODE alphaMode, IDCompositionVirtualSurface* virtualSurface);
}
enum IID_IDCompositionVisual2 = GUID(0xe8de1639, 0x4331, 0x4b26, [0xbc, 0x5f, 0x6a, 0x32, 0x1d, 0x34, 0x7a, 0x85]);
interface IDCompositionVisual2 : IDCompositionVisual
{
    HRESULT SetOpacityMode(DCOMPOSITION_OPACITY_MODE mode);
    HRESULT SetBackFaceVisibility(DCOMPOSITION_BACKFACE_VISIBILITY visibility);
}
enum IID_IDCompositionVisualDebug = GUID(0xfed2b808, 0x5eb4, 0x43a0, [0xae, 0xa3, 0x35, 0xf6, 0x52, 0x80, 0xf9, 0x1b]);
interface IDCompositionVisualDebug : IDCompositionVisual2
{
    HRESULT EnableHeatMap(const(D2D1_COLOR_F)* color);
    HRESULT DisableHeatMap();
    HRESULT EnableRedrawRegions();
    HRESULT DisableRedrawRegions();
}
enum IID_IDCompositionVisual3 = GUID(0x2775f462, 0xb6c1, 0x4015, [0xb0, 0xbe, 0xb3, 0xe7, 0xd6, 0xa4, 0x97, 0x6d]);
interface IDCompositionVisual3 : IDCompositionVisualDebug
{
    HRESULT SetDepthMode(DCOMPOSITION_DEPTH_MODE mode);
    HRESULT SetOffsetZ(IDCompositionAnimation animation);
    HRESULT SetOffsetZ(float offsetZ);
    HRESULT SetOpacity(IDCompositionAnimation animation);
    HRESULT SetOpacity(float opacity);
    HRESULT SetTransform(IDCompositionTransform3D transform);
    HRESULT SetTransform(const(D2D_MATRIX_4X4_F)* matrix);
    HRESULT SetVisible(BOOL visible);
}
enum IID_IDCompositionDevice3 = GUID(0x987cb06, 0xf916, 0x48bf, [0x8d, 0x35, 0xce, 0x76, 0x41, 0x78, 0x1b, 0xd9]);
interface IDCompositionDevice3 : IDCompositionDevice2
{
    HRESULT CreateGaussianBlurEffect(IDCompositionGaussianBlurEffect* gaussianBlurEffect);
    HRESULT CreateBrightnessEffect(IDCompositionBrightnessEffect* brightnessEffect);
    HRESULT CreateColorMatrixEffect(IDCompositionColorMatrixEffect* colorMatrixEffect);
    HRESULT CreateShadowEffect(IDCompositionShadowEffect* shadowEffect);
    HRESULT CreateHueRotationEffect(IDCompositionHueRotationEffect* hueRotationEffect);
    HRESULT CreateSaturationEffect(IDCompositionSaturationEffect* saturationEffect);
    HRESULT CreateTurbulenceEffect(IDCompositionTurbulenceEffect* turbulenceEffect);
    HRESULT CreateLinearTransferEffect(IDCompositionLinearTransferEffect* linearTransferEffect);
    HRESULT CreateTableTransferEffect(IDCompositionTableTransferEffect* tableTransferEffect);
    HRESULT CreateCompositeEffect(IDCompositionCompositeEffect* compositeEffect);
    HRESULT CreateBlendEffect(IDCompositionBlendEffect* blendEffect);
    HRESULT CreateArithmeticCompositeEffect(IDCompositionArithmeticCompositeEffect* arithmeticCompositeEffect);
    HRESULT CreateAffineTransform2DEffect(IDCompositionAffineTransform2DEffect* affineTransform2dEffect);
}
enum IID_IDCompositionFilterEffect = GUID(0x30c421d5, 0x8cb2, 0x4e9f, [0xb1, 0x33, 0x37, 0xbe, 0x27, 0xd, 0x4a, 0xc2]);
interface IDCompositionFilterEffect : IDCompositionEffect
{
    HRESULT SetInput(uint index, IUnknown input, uint flags);
}
enum IID_IDCompositionGaussianBlurEffect = GUID(0x45d4d0b7, 0x1bd4, 0x454e, [0x88, 0x94, 0x2b, 0xfa, 0x68, 0x44, 0x30, 0x33]);
interface IDCompositionGaussianBlurEffect : IDCompositionFilterEffect
{
    HRESULT SetStandardDeviation(IDCompositionAnimation animation);
    HRESULT SetStandardDeviation(float amount);
    HRESULT SetBorderMode(D2D1_BORDER_MODE mode);
}
enum IID_IDCompositionBrightnessEffect = GUID(0x6027496e, 0xcb3a, 0x49ab, [0x93, 0x4f, 0xd7, 0x98, 0xda, 0x4f, 0x7d, 0xa6]);
interface IDCompositionBrightnessEffect : IDCompositionFilterEffect
{
    HRESULT SetWhitePoint(const(D2D_VECTOR_2F)* whitePoint);
    HRESULT SetBlackPoint(const(D2D_VECTOR_2F)* blackPoint);
    HRESULT SetWhitePointX(IDCompositionAnimation animation);
    HRESULT SetWhitePointX(float whitePointX);
    HRESULT SetWhitePointY(IDCompositionAnimation animation);
    HRESULT SetWhitePointY(float whitePointY);
    HRESULT SetBlackPointX(IDCompositionAnimation animation);
    HRESULT SetBlackPointX(float blackPointX);
    HRESULT SetBlackPointY(IDCompositionAnimation animation);
    HRESULT SetBlackPointY(float blackPointY);
}
enum IID_IDCompositionColorMatrixEffect = GUID(0xc1170a22, 0x3ce2, 0x4966, [0x90, 0xd4, 0x55, 0x40, 0x8b, 0xfc, 0x84, 0xc4]);
interface IDCompositionColorMatrixEffect : IDCompositionFilterEffect
{
    HRESULT SetMatrix(const(D2D_MATRIX_5X4_F)* matrix);
    HRESULT SetMatrixElement(int row, int column, IDCompositionAnimation animation);
    HRESULT SetMatrixElement(int row, int column, float value);
    HRESULT SetAlphaMode(D2D1_COLORMATRIX_ALPHA_MODE mode);
    HRESULT SetClampOutput(BOOL clamp);
}
enum IID_IDCompositionShadowEffect = GUID(0x4ad18ac0, 0xcfd2, 0x4c2f, [0xbb, 0x62, 0x96, 0xe5, 0x4f, 0xdb, 0x68, 0x79]);
interface IDCompositionShadowEffect : IDCompositionFilterEffect
{
    HRESULT SetStandardDeviation(IDCompositionAnimation animation);
    HRESULT SetStandardDeviation(float amount);
    HRESULT SetColor(const(D2D_VECTOR_4F)* color);
    HRESULT SetRed(IDCompositionAnimation animation);
    HRESULT SetRed(float amount);
    HRESULT SetGreen(IDCompositionAnimation animation);
    HRESULT SetGreen(float amount);
    HRESULT SetBlue(IDCompositionAnimation animation);
    HRESULT SetBlue(float amount);
    HRESULT SetAlpha(IDCompositionAnimation animation);
    HRESULT SetAlpha(float amount);
}
enum IID_IDCompositionHueRotationEffect = GUID(0x6db9f920, 0x770, 0x4781, [0xb0, 0xc6, 0x38, 0x19, 0x12, 0xf9, 0xd1, 0x67]);
interface IDCompositionHueRotationEffect : IDCompositionFilterEffect
{
    HRESULT SetAngle(IDCompositionAnimation animation);
    HRESULT SetAngle(float amountDegrees);
}
enum IID_IDCompositionSaturationEffect = GUID(0xa08debda, 0x3258, 0x4fa4, [0x9f, 0x16, 0x91, 0x74, 0xd3, 0xfe, 0x93, 0xb1]);
interface IDCompositionSaturationEffect : IDCompositionFilterEffect
{
    HRESULT SetSaturation(IDCompositionAnimation animation);
    HRESULT SetSaturation(float ratio);
}
enum IID_IDCompositionTurbulenceEffect = GUID(0xa6a55bda, 0xc09c, 0x49f3, [0x91, 0x93, 0xa4, 0x19, 0x22, 0xc8, 0x97, 0x15]);
interface IDCompositionTurbulenceEffect : IDCompositionFilterEffect
{
    HRESULT SetOffset(const(D2D_VECTOR_2F)* offset);
    HRESULT SetBaseFrequency(const(D2D_VECTOR_2F)* frequency);
    HRESULT SetSize(const(D2D_VECTOR_2F)* size);
    HRESULT SetNumOctaves(uint numOctaves);
    HRESULT SetSeed(uint seed);
    HRESULT SetNoise(D2D1_TURBULENCE_NOISE noise);
    HRESULT SetStitchable(BOOL stitchable);
}
enum IID_IDCompositionLinearTransferEffect = GUID(0x4305ee5b, 0xc4a0, 0x4c88, [0x93, 0x85, 0x67, 0x12, 0x4e, 0x1, 0x76, 0x83]);
interface IDCompositionLinearTransferEffect : IDCompositionFilterEffect
{
    HRESULT SetRedYIntercept(IDCompositionAnimation animation);
    HRESULT SetRedYIntercept(float redYIntercept);
    HRESULT SetRedSlope(IDCompositionAnimation animation);
    HRESULT SetRedSlope(float redSlope);
    HRESULT SetRedDisable(BOOL redDisable);
    HRESULT SetGreenYIntercept(IDCompositionAnimation animation);
    HRESULT SetGreenYIntercept(float greenYIntercept);
    HRESULT SetGreenSlope(IDCompositionAnimation animation);
    HRESULT SetGreenSlope(float greenSlope);
    HRESULT SetGreenDisable(BOOL greenDisable);
    HRESULT SetBlueYIntercept(IDCompositionAnimation animation);
    HRESULT SetBlueYIntercept(float blueYIntercept);
    HRESULT SetBlueSlope(IDCompositionAnimation animation);
    HRESULT SetBlueSlope(float blueSlope);
    HRESULT SetBlueDisable(BOOL blueDisable);
    HRESULT SetAlphaYIntercept(IDCompositionAnimation animation);
    HRESULT SetAlphaYIntercept(float alphaYIntercept);
    HRESULT SetAlphaSlope(IDCompositionAnimation animation);
    HRESULT SetAlphaSlope(float alphaSlope);
    HRESULT SetAlphaDisable(BOOL alphaDisable);
    HRESULT SetClampOutput(BOOL clampOutput);
}
enum IID_IDCompositionTableTransferEffect = GUID(0x9b7e82e2, 0x69c5, 0x4eb4, [0xa5, 0xf5, 0xa7, 0x3, 0x3f, 0x51, 0x32, 0xcd]);
interface IDCompositionTableTransferEffect : IDCompositionFilterEffect
{
    HRESULT SetRedTable(const(float)* tableValues, uint count);
    HRESULT SetGreenTable(const(float)* tableValues, uint count);
    HRESULT SetBlueTable(const(float)* tableValues, uint count);
    HRESULT SetAlphaTable(const(float)* tableValues, uint count);
    HRESULT SetRedDisable(BOOL redDisable);
    HRESULT SetGreenDisable(BOOL greenDisable);
    HRESULT SetBlueDisable(BOOL blueDisable);
    HRESULT SetAlphaDisable(BOOL alphaDisable);
    HRESULT SetClampOutput(BOOL clampOutput);
    HRESULT SetRedTableValue(uint index, IDCompositionAnimation animation);
    HRESULT SetRedTableValue(uint index, float value);
    HRESULT SetGreenTableValue(uint index, IDCompositionAnimation animation);
    HRESULT SetGreenTableValue(uint index, float value);
    HRESULT SetBlueTableValue(uint index, IDCompositionAnimation animation);
    HRESULT SetBlueTableValue(uint index, float value);
    HRESULT SetAlphaTableValue(uint index, IDCompositionAnimation animation);
    HRESULT SetAlphaTableValue(uint index, float value);
}
enum IID_IDCompositionCompositeEffect = GUID(0x576616c0, 0xa231, 0x494d, [0xa3, 0x8d, 0x0, 0xfd, 0x5e, 0xc4, 0xdb, 0x46]);
interface IDCompositionCompositeEffect : IDCompositionFilterEffect
{
    HRESULT SetMode(D2D1_COMPOSITE_MODE mode);
}
enum IID_IDCompositionBlendEffect = GUID(0x33ecdc0a, 0x578a, 0x4a11, [0x9c, 0x14, 0xc, 0xb9, 0x5, 0x17, 0xf9, 0xc5]);
interface IDCompositionBlendEffect : IDCompositionFilterEffect
{
    HRESULT SetMode(D2D1_BLEND_MODE mode);
}
enum IID_IDCompositionArithmeticCompositeEffect = GUID(0x3b67dfa8, 0xe3dd, 0x4e61, [0xb6, 0x40, 0x46, 0xc2, 0xf3, 0xd7, 0x39, 0xdc]);
interface IDCompositionArithmeticCompositeEffect : IDCompositionFilterEffect
{
    HRESULT SetCoefficients(const(D2D_VECTOR_4F)* coefficients);
    HRESULT SetClampOutput(BOOL clampoutput);
    HRESULT SetCoefficient1(IDCompositionAnimation animation);
    HRESULT SetCoefficient1(float Coeffcient1);
    HRESULT SetCoefficient2(IDCompositionAnimation animation);
    HRESULT SetCoefficient2(float Coefficient2);
    HRESULT SetCoefficient3(IDCompositionAnimation animation);
    HRESULT SetCoefficient3(float Coefficient3);
    HRESULT SetCoefficient4(IDCompositionAnimation animation);
    HRESULT SetCoefficient4(float Coefficient4);
}
enum IID_IDCompositionAffineTransform2DEffect = GUID(0xb74b9e8, 0xcdd6, 0x492f, [0xbb, 0xbc, 0x5e, 0xd3, 0x21, 0x57, 0x2, 0x6d]);
interface IDCompositionAffineTransform2DEffect : IDCompositionFilterEffect
{
    HRESULT SetInterpolationMode(D2D1_2DAFFINETRANSFORM_INTERPOLATION_MODE interpolationMode);
    HRESULT SetBorderMode(D2D1_BORDER_MODE borderMode);
    HRESULT SetTransformMatrix(const(D2D_MATRIX_3X2_F)* transformMatrix);
    HRESULT SetTransformMatrixElement(int row, int column, IDCompositionAnimation animation);
    HRESULT SetTransformMatrixElement(int row, int column, float value);
    HRESULT SetSharpness(IDCompositionAnimation animation);
    HRESULT SetSharpness(float sharpness);
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
    HRESULT AddTrailPoints(const(DCompositionInkTrailPoint)* inkPoints, uint inkPointsCount, uint* generationId);
    HRESULT AddTrailPointsWithPrediction(const(DCompositionInkTrailPoint)* inkPoints, uint inkPointsCount, const(DCompositionInkTrailPoint)* predictedInkPoints, uint predictedInkPointsCount, uint* generationId);
    HRESULT RemoveTrailPoints(uint generationId);
    HRESULT StartNewTrail(const(D2D1_COLOR_F)* color);
}
enum IID_IDCompositionInkTrailDevice = GUID(0xdf0c7cec, 0xcdeb, 0x4d4a, [0xb9, 0x1c, 0x72, 0x1b, 0xf2, 0x2f, 0x4e, 0x6c]);
interface IDCompositionInkTrailDevice : IUnknown
{
    HRESULT CreateDelegatedInkTrail(IDCompositionDelegatedInkTrail* inkTrail);
    HRESULT CreateDelegatedInkTrailForSwapChain(IUnknown swapChain, IDCompositionDelegatedInkTrail* inkTrail);
}
enum IID_IDCompositionTexture = GUID(0x929bb1aa, 0x725f, 0x433b, [0xab, 0xd7, 0x27, 0x30, 0x75, 0xa8, 0x35, 0xf2]);
interface IDCompositionTexture : IUnknown
{
    HRESULT SetSourceRect(const(D2D_RECT_U)* sourceRect);
    HRESULT SetColorSpace(DXGI_COLOR_SPACE_TYPE colorSpace);
    HRESULT SetAlphaMode(DXGI_ALPHA_MODE alphaMode);
    HRESULT GetAvailableFence(ulong* fenceValue, const(GUID)* iid, void** availableFence);
}
enum IID_IDCompositionDevice4 = GUID(0x85fc5cca, 0x2da6, 0x494c, [0x86, 0xb6, 0x4a, 0x77, 0x5c, 0x4, 0x9b, 0x8a]);
interface IDCompositionDevice4 : IDCompositionDevice3
{
    HRESULT CheckCompositionTextureSupport(IUnknown renderingDevice, BOOL* supportsCompositionTextures);
    HRESULT CreateCompositionTexture(IUnknown d3dTexture, IDCompositionTexture* compositionTexture);
}
