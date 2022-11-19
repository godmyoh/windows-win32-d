module windows.win32.graphics.dxgi_;

import windows.win32.guid : GUID;
import windows.win32.foundation : BOOL, HANDLE, HINSTANCE, HRESULT, HWND, LARGE_INTEGER, LUID, POINT, PSTR, PWSTR, RECT;
import windows.win32.graphics.dxgi.common : DXGI_ALPHA_MODE, DXGI_COLOR_SPACE_TYPE, DXGI_FORMAT, DXGI_GAMMA_CONTROL, DXGI_GAMMA_CONTROL_CAPABILITIES, DXGI_MODE_DESC, DXGI_MODE_ROTATION, DXGI_MODE_SCALING, DXGI_MODE_SCANLINE_ORDER, DXGI_RATIONAL, DXGI_SAMPLE_DESC;
import windows.win32.graphics.gdi : HDC, HMONITOR;
import windows.win32.security_ : SECURITY_ATTRIBUTES;
import windows.win32.system.com_ : IUnknown;

version (Windows):
extern (Windows):

struct DXGI_RGBA
{
    float r;
    float g;
    float b;
    float a;
}
alias DXGI_RESOURCE_PRIORITY = uint;
enum : uint
{
    DXGI_RESOURCE_PRIORITY_MINIMUM = 0x28000000,
    DXGI_RESOURCE_PRIORITY_LOW     = 0x50000000,
    DXGI_RESOURCE_PRIORITY_NORMAL  = 0x78000000,
    DXGI_RESOURCE_PRIORITY_HIGH    = 0xa0000000,
    DXGI_RESOURCE_PRIORITY_MAXIMUM = 0xc8000000,
}

alias DXGI_USAGE = uint;
enum : uint
{
    DXGI_USAGE_SHADER_INPUT         = 0x00000010,
    DXGI_USAGE_RENDER_TARGET_OUTPUT = 0x00000020,
    DXGI_USAGE_BACK_BUFFER          = 0x00000040,
    DXGI_USAGE_SHARED               = 0x00000080,
    DXGI_USAGE_READ_ONLY            = 0x00000100,
    DXGI_USAGE_DISCARD_ON_PRESENT   = 0x00000200,
    DXGI_USAGE_UNORDERED_ACCESS     = 0x00000400,
}

HRESULT CreateDXGIFactory(const(GUID)*, void**);
HRESULT CreateDXGIFactory1(const(GUID)*, void**);
HRESULT CreateDXGIFactory2(uint, const(GUID)*, void**);
HRESULT DXGIGetDebugInterface1(uint, const(GUID)*, void**);
HRESULT DXGIDeclareAdapterRemovalSupport();
enum DXGI_MAP_READ = 0x00000001;
enum DXGI_MAP_WRITE = 0x00000002;
enum DXGI_MAP_DISCARD = 0x00000004;
enum DXGI_ENUM_MODES_INTERLACED = 0x00000001;
enum DXGI_ENUM_MODES_SCALING = 0x00000002;
enum DXGI_MAX_SWAP_CHAIN_BUFFERS = 0x00000010;
enum DXGI_PRESENT_TEST = 0x00000001;
enum DXGI_PRESENT_DO_NOT_SEQUENCE = 0x00000002;
enum DXGI_PRESENT_RESTART = 0x00000004;
enum DXGI_PRESENT_DO_NOT_WAIT = 0x00000008;
enum DXGI_PRESENT_STEREO_PREFER_RIGHT = 0x00000010;
enum DXGI_PRESENT_STEREO_TEMPORARY_MONO = 0x00000020;
enum DXGI_PRESENT_RESTRICT_TO_OUTPUT = 0x00000040;
enum DXGI_PRESENT_USE_DURATION = 0x00000100;
enum DXGI_PRESENT_ALLOW_TEARING = 0x00000200;
enum DXGI_MWA_NO_WINDOW_CHANGES = 0x00000001;
enum DXGI_MWA_NO_ALT_ENTER = 0x00000002;
enum DXGI_MWA_NO_PRINT_SCREEN = 0x00000004;
enum DXGI_MWA_VALID = 0x00000007;
enum DXGI_ENUM_MODES_STEREO = 0x00000004;
enum DXGI_ENUM_MODES_DISABLED_STEREO = 0x00000008;
enum DXGI_SHARED_RESOURCE_READ = 0x80000000;
enum DXGI_SHARED_RESOURCE_WRITE = 0x00000001;
enum DXGI_DEBUG_BINARY_VERSION = 0x00000001;
enum DXGI_DEBUG_ALL = GUID(0xe48ae283, 0xda80, 0x490b, [0x87, 0xe6, 0x43, 0xe9, 0xa9, 0xcf, 0xda, 0x8]);
enum DXGI_DEBUG_DX = GUID(0x35cdd7fc, 0x13b2, 0x421d, [0xa5, 0xd7, 0x7e, 0x44, 0x51, 0x28, 0x7d, 0x64]);
enum DXGI_DEBUG_DXGI = GUID(0x25cddaa4, 0xb1c6, 0x47e1, [0xac, 0x3e, 0x98, 0x87, 0x5b, 0x5a, 0x2e, 0x2a]);
enum DXGI_DEBUG_APP = GUID(0x6cd6e01, 0x4219, 0x4ebd, [0x87, 0x9, 0x27, 0xed, 0x23, 0x36, 0xc, 0x62]);
enum DXGI_INFO_QUEUE_MESSAGE_ID_STRING_FROM_APPLICATION = 0x00000000;
enum DXGI_INFO_QUEUE_DEFAULT_MESSAGE_COUNT_LIMIT = 0x00000400;
enum DXGI_CREATE_FACTORY_DEBUG = 0x00000001;
enum DXGI_ERROR_INVALID_CALL = 0xffffffff887a0001;
enum DXGI_ERROR_NOT_FOUND = 0xffffffff887a0002;
enum DXGI_ERROR_MORE_DATA = 0xffffffff887a0003;
enum DXGI_ERROR_UNSUPPORTED = 0xffffffff887a0004;
enum DXGI_ERROR_DEVICE_REMOVED = 0xffffffff887a0005;
enum DXGI_ERROR_DEVICE_HUNG = 0xffffffff887a0006;
enum DXGI_ERROR_DEVICE_RESET = 0xffffffff887a0007;
enum DXGI_ERROR_WAS_STILL_DRAWING = 0xffffffff887a000a;
enum DXGI_ERROR_FRAME_STATISTICS_DISJOINT = 0xffffffff887a000b;
enum DXGI_ERROR_GRAPHICS_VIDPN_SOURCE_IN_USE = 0xffffffff887a000c;
enum DXGI_ERROR_DRIVER_INTERNAL_ERROR = 0xffffffff887a0020;
enum DXGI_ERROR_NONEXCLUSIVE = 0xffffffff887a0021;
enum DXGI_ERROR_NOT_CURRENTLY_AVAILABLE = 0xffffffff887a0022;
enum DXGI_ERROR_REMOTE_CLIENT_DISCONNECTED = 0xffffffff887a0023;
enum DXGI_ERROR_REMOTE_OUTOFMEMORY = 0xffffffff887a0024;
enum DXGI_ERROR_ACCESS_LOST = 0xffffffff887a0026;
enum DXGI_ERROR_WAIT_TIMEOUT = 0xffffffff887a0027;
enum DXGI_ERROR_SESSION_DISCONNECTED = 0xffffffff887a0028;
enum DXGI_ERROR_RESTRICT_TO_OUTPUT_STALE = 0xffffffff887a0029;
enum DXGI_ERROR_CANNOT_PROTECT_CONTENT = 0xffffffff887a002a;
enum DXGI_ERROR_ACCESS_DENIED = 0xffffffff887a002b;
enum DXGI_ERROR_NAME_ALREADY_EXISTS = 0xffffffff887a002c;
enum DXGI_ERROR_SDK_COMPONENT_MISSING = 0xffffffff887a002d;
enum DXGI_ERROR_NOT_CURRENT = 0xffffffff887a002e;
enum DXGI_ERROR_HW_PROTECTION_OUTOFMEMORY = 0xffffffff887a0030;
enum DXGI_ERROR_DYNAMIC_CODE_POLICY_VIOLATION = 0xffffffff887a0031;
enum DXGI_ERROR_NON_COMPOSITED_UI = 0xffffffff887a0032;
enum DXGI_ERROR_MODE_CHANGE_IN_PROGRESS = 0xffffffff887a0025;
enum DXGI_ERROR_CACHE_CORRUPT = 0xffffffff887a0033;
enum DXGI_ERROR_CACHE_FULL = 0xffffffff887a0034;
enum DXGI_ERROR_CACHE_HASH_COLLISION = 0xffffffff887a0035;
enum DXGI_ERROR_ALREADY_EXISTS = 0xffffffff887a0036;
struct DXGI_FRAME_STATISTICS
{
    uint PresentCount;
    uint PresentRefreshCount;
    uint SyncRefreshCount;
    LARGE_INTEGER SyncQPCTime;
    LARGE_INTEGER SyncGPUTime;
}
struct DXGI_MAPPED_RECT
{
    int Pitch;
    ubyte* pBits;
}
struct DXGI_ADAPTER_DESC
{
    wchar[128] Description;
    uint VendorId;
    uint DeviceId;
    uint SubSysId;
    uint Revision;
    ulong DedicatedVideoMemory;
    ulong DedicatedSystemMemory;
    ulong SharedSystemMemory;
    LUID AdapterLuid;
}
struct DXGI_OUTPUT_DESC
{
    wchar[32] DeviceName;
    RECT DesktopCoordinates;
    BOOL AttachedToDesktop;
    DXGI_MODE_ROTATION Rotation;
    HMONITOR Monitor;
}
struct DXGI_SHARED_RESOURCE
{
    HANDLE Handle;
}
alias DXGI_RESIDENCY = int;
enum : int
{
    DXGI_RESIDENCY_FULLY_RESIDENT            = 0x00000001,
    DXGI_RESIDENCY_RESIDENT_IN_SHARED_MEMORY = 0x00000002,
    DXGI_RESIDENCY_EVICTED_TO_DISK           = 0x00000003,
}

struct DXGI_SURFACE_DESC
{
    uint Width;
    uint Height;
    DXGI_FORMAT Format;
    DXGI_SAMPLE_DESC SampleDesc;
}
alias DXGI_SWAP_EFFECT = int;
enum : int
{
    DXGI_SWAP_EFFECT_DISCARD         = 0x00000000,
    DXGI_SWAP_EFFECT_SEQUENTIAL      = 0x00000001,
    DXGI_SWAP_EFFECT_FLIP_SEQUENTIAL = 0x00000003,
    DXGI_SWAP_EFFECT_FLIP_DISCARD    = 0x00000004,
}

alias DXGI_SWAP_CHAIN_FLAG = int;
enum : int
{
    DXGI_SWAP_CHAIN_FLAG_NONPREROTATED                          = 0x00000001,
    DXGI_SWAP_CHAIN_FLAG_ALLOW_MODE_SWITCH                      = 0x00000002,
    DXGI_SWAP_CHAIN_FLAG_GDI_COMPATIBLE                         = 0x00000004,
    DXGI_SWAP_CHAIN_FLAG_RESTRICTED_CONTENT                     = 0x00000008,
    DXGI_SWAP_CHAIN_FLAG_RESTRICT_SHARED_RESOURCE_DRIVER        = 0x00000010,
    DXGI_SWAP_CHAIN_FLAG_DISPLAY_ONLY                           = 0x00000020,
    DXGI_SWAP_CHAIN_FLAG_FRAME_LATENCY_WAITABLE_OBJECT          = 0x00000040,
    DXGI_SWAP_CHAIN_FLAG_FOREGROUND_LAYER                       = 0x00000080,
    DXGI_SWAP_CHAIN_FLAG_FULLSCREEN_VIDEO                       = 0x00000100,
    DXGI_SWAP_CHAIN_FLAG_YUV_VIDEO                              = 0x00000200,
    DXGI_SWAP_CHAIN_FLAG_HW_PROTECTED                           = 0x00000400,
    DXGI_SWAP_CHAIN_FLAG_ALLOW_TEARING                          = 0x00000800,
    DXGI_SWAP_CHAIN_FLAG_RESTRICTED_TO_ALL_HOLOGRAPHIC_DISPLAYS = 0x00001000,
}

struct DXGI_SWAP_CHAIN_DESC
{
    DXGI_MODE_DESC BufferDesc;
    DXGI_SAMPLE_DESC SampleDesc;
    DXGI_USAGE BufferUsage;
    uint BufferCount;
    HWND OutputWindow;
    BOOL Windowed;
    DXGI_SWAP_EFFECT SwapEffect;
    uint Flags;
}
enum IID_IDXGIObject = GUID(0xaec22fb8, 0x76f3, 0x4639, [0x9b, 0xe0, 0x28, 0xeb, 0x43, 0xa6, 0x7a, 0x2e]);
interface IDXGIObject : IUnknown
{
    HRESULT SetPrivateData(const(GUID)*, uint, const(void)*);
    HRESULT SetPrivateDataInterface(const(GUID)*, const(IUnknown));
    HRESULT GetPrivateData(const(GUID)*, uint*, void*);
    HRESULT GetParent(const(GUID)*, void**);
}
enum IID_IDXGIDeviceSubObject = GUID(0x3d3e0379, 0xf9de, 0x4d58, [0xbb, 0x6c, 0x18, 0xd6, 0x29, 0x92, 0xf1, 0xa6]);
interface IDXGIDeviceSubObject : IDXGIObject
{
    HRESULT GetDevice(const(GUID)*, void**);
}
enum IID_IDXGIResource = GUID(0x35f3ab4, 0x482e, 0x4e50, [0xb4, 0x1f, 0x8a, 0x7f, 0x8b, 0xd8, 0x96, 0xb]);
interface IDXGIResource : IDXGIDeviceSubObject
{
    HRESULT GetSharedHandle(HANDLE*);
    HRESULT GetUsage(DXGI_USAGE*);
    HRESULT SetEvictionPriority(DXGI_RESOURCE_PRIORITY);
    HRESULT GetEvictionPriority(uint*);
}
enum IID_IDXGIKeyedMutex = GUID(0x9d8e1289, 0xd7b3, 0x465f, [0x81, 0x26, 0x25, 0xe, 0x34, 0x9a, 0xf8, 0x5d]);
interface IDXGIKeyedMutex : IDXGIDeviceSubObject
{
    HRESULT AcquireSync(ulong, uint);
    HRESULT ReleaseSync(ulong);
}
enum IID_IDXGISurface = GUID(0xcafcb56c, 0x6ac3, 0x4889, [0xbf, 0x47, 0x9e, 0x23, 0xbb, 0xd2, 0x60, 0xec]);
interface IDXGISurface : IDXGIDeviceSubObject
{
    HRESULT GetDesc(DXGI_SURFACE_DESC*);
    HRESULT Map(DXGI_MAPPED_RECT*, uint);
    HRESULT Unmap();
}
enum IID_IDXGISurface1 = GUID(0x4ae63092, 0x6327, 0x4c1b, [0x80, 0xae, 0xbf, 0xe1, 0x2e, 0xa3, 0x2b, 0x86]);
interface IDXGISurface1 : IDXGISurface
{
    HRESULT GetDC(BOOL, HDC*);
    HRESULT ReleaseDC(RECT*);
}
enum IID_IDXGIAdapter = GUID(0x2411e7e1, 0x12ac, 0x4ccf, [0xbd, 0x14, 0x97, 0x98, 0xe8, 0x53, 0x4d, 0xc0]);
interface IDXGIAdapter : IDXGIObject
{
    HRESULT EnumOutputs(uint, IDXGIOutput*);
    HRESULT GetDesc(DXGI_ADAPTER_DESC*);
    HRESULT CheckInterfaceSupport(const(GUID)*, LARGE_INTEGER*);
}
enum IID_IDXGIOutput = GUID(0xae02eedb, 0xc735, 0x4690, [0x8d, 0x52, 0x5a, 0x8d, 0xc2, 0x2, 0x13, 0xaa]);
interface IDXGIOutput : IDXGIObject
{
    HRESULT GetDesc(DXGI_OUTPUT_DESC*);
    HRESULT GetDisplayModeList(DXGI_FORMAT, uint, uint*, DXGI_MODE_DESC*);
    HRESULT FindClosestMatchingMode(const(DXGI_MODE_DESC)*, DXGI_MODE_DESC*, IUnknown);
    HRESULT WaitForVBlank();
    HRESULT TakeOwnership(IUnknown, BOOL);
    void ReleaseOwnership();
    HRESULT GetGammaControlCapabilities(DXGI_GAMMA_CONTROL_CAPABILITIES*);
    HRESULT SetGammaControl(const(DXGI_GAMMA_CONTROL)*);
    HRESULT GetGammaControl(DXGI_GAMMA_CONTROL*);
    HRESULT SetDisplaySurface(IDXGISurface);
    HRESULT GetDisplaySurfaceData(IDXGISurface);
    HRESULT GetFrameStatistics(DXGI_FRAME_STATISTICS*);
}
enum IID_IDXGISwapChain = GUID(0x310d36a0, 0xd2e7, 0x4c0a, [0xaa, 0x4, 0x6a, 0x9d, 0x23, 0xb8, 0x88, 0x6a]);
interface IDXGISwapChain : IDXGIDeviceSubObject
{
    HRESULT Present(uint, uint);
    HRESULT GetBuffer(uint, const(GUID)*, void**);
    HRESULT SetFullscreenState(BOOL, IDXGIOutput);
    HRESULT GetFullscreenState(BOOL*, IDXGIOutput*);
    HRESULT GetDesc(DXGI_SWAP_CHAIN_DESC*);
    HRESULT ResizeBuffers(uint, uint, uint, DXGI_FORMAT, uint);
    HRESULT ResizeTarget(const(DXGI_MODE_DESC)*);
    HRESULT GetContainingOutput(IDXGIOutput*);
    HRESULT GetFrameStatistics(DXGI_FRAME_STATISTICS*);
    HRESULT GetLastPresentCount(uint*);
}
enum IID_IDXGIFactory = GUID(0x7b7166ec, 0x21c7, 0x44ae, [0xb2, 0x1a, 0xc9, 0xae, 0x32, 0x1a, 0xe3, 0x69]);
interface IDXGIFactory : IDXGIObject
{
    HRESULT EnumAdapters(uint, IDXGIAdapter*);
    HRESULT MakeWindowAssociation(HWND, uint);
    HRESULT GetWindowAssociation(HWND*);
    HRESULT CreateSwapChain(IUnknown, DXGI_SWAP_CHAIN_DESC*, IDXGISwapChain*);
    HRESULT CreateSoftwareAdapter(HINSTANCE, IDXGIAdapter*);
}
enum IID_IDXGIDevice = GUID(0x54ec77fa, 0x1377, 0x44e6, [0x8c, 0x32, 0x88, 0xfd, 0x5f, 0x44, 0xc8, 0x4c]);
interface IDXGIDevice : IDXGIObject
{
    HRESULT GetAdapter(IDXGIAdapter*);
    HRESULT CreateSurface(const(DXGI_SURFACE_DESC)*, uint, DXGI_USAGE, const(DXGI_SHARED_RESOURCE)*, IDXGISurface*);
    HRESULT QueryResourceResidency(IUnknown*, DXGI_RESIDENCY*, uint);
    HRESULT SetGPUThreadPriority(int);
    HRESULT GetGPUThreadPriority(int*);
}
alias DXGI_ADAPTER_FLAG = uint;
enum : uint
{
    DXGI_ADAPTER_FLAG_NONE     = 0x00000000,
    DXGI_ADAPTER_FLAG_REMOTE   = 0x00000001,
    DXGI_ADAPTER_FLAG_SOFTWARE = 0x00000002,
}

struct DXGI_ADAPTER_DESC1
{
    wchar[128] Description;
    uint VendorId;
    uint DeviceId;
    uint SubSysId;
    uint Revision;
    ulong DedicatedVideoMemory;
    ulong DedicatedSystemMemory;
    ulong SharedSystemMemory;
    LUID AdapterLuid;
    uint Flags;
}
struct DXGI_DISPLAY_COLOR_SPACE
{
    float[16] PrimaryCoordinates;
    float[32] WhitePoints;
}
enum IID_IDXGIFactory1 = GUID(0x770aae78, 0xf26f, 0x4dba, [0xa8, 0x29, 0x25, 0x3c, 0x83, 0xd1, 0xb3, 0x87]);
interface IDXGIFactory1 : IDXGIFactory
{
    HRESULT EnumAdapters1(uint, IDXGIAdapter1*);
    BOOL IsCurrent();
}
enum IID_IDXGIAdapter1 = GUID(0x29038f61, 0x3839, 0x4626, [0x91, 0xfd, 0x8, 0x68, 0x79, 0x1, 0x1a, 0x5]);
interface IDXGIAdapter1 : IDXGIAdapter
{
    HRESULT GetDesc1(DXGI_ADAPTER_DESC1*);
}
enum IID_IDXGIDevice1 = GUID(0x77db970f, 0x6276, 0x48ba, [0xba, 0x28, 0x7, 0x1, 0x43, 0xb4, 0x39, 0x2c]);
interface IDXGIDevice1 : IDXGIDevice
{
    HRESULT SetMaximumFrameLatency(uint);
    HRESULT GetMaximumFrameLatency(uint*);
}
enum IID_IDXGIDisplayControl = GUID(0xea9dbf1a, 0xc88e, 0x4486, [0x85, 0x4a, 0x98, 0xaa, 0x1, 0x38, 0xf3, 0xc]);
interface IDXGIDisplayControl : IUnknown
{
    BOOL IsStereoEnabled();
    void SetStereoEnabled(BOOL);
}
struct DXGI_OUTDUPL_MOVE_RECT
{
    POINT SourcePoint;
    RECT DestinationRect;
}
struct DXGI_OUTDUPL_DESC
{
    DXGI_MODE_DESC ModeDesc;
    DXGI_MODE_ROTATION Rotation;
    BOOL DesktopImageInSystemMemory;
}
struct DXGI_OUTDUPL_POINTER_POSITION
{
    POINT Position;
    BOOL Visible;
}
alias DXGI_OUTDUPL_POINTER_SHAPE_TYPE = int;
enum : int
{
    DXGI_OUTDUPL_POINTER_SHAPE_TYPE_MONOCHROME   = 0x00000001,
    DXGI_OUTDUPL_POINTER_SHAPE_TYPE_COLOR        = 0x00000002,
    DXGI_OUTDUPL_POINTER_SHAPE_TYPE_MASKED_COLOR = 0x00000004,
}

struct DXGI_OUTDUPL_POINTER_SHAPE_INFO
{
    uint Type;
    uint Width;
    uint Height;
    uint Pitch;
    POINT HotSpot;
}
struct DXGI_OUTDUPL_FRAME_INFO
{
    LARGE_INTEGER LastPresentTime;
    LARGE_INTEGER LastMouseUpdateTime;
    uint AccumulatedFrames;
    BOOL RectsCoalesced;
    BOOL ProtectedContentMaskedOut;
    DXGI_OUTDUPL_POINTER_POSITION PointerPosition;
    uint TotalMetadataBufferSize;
    uint PointerShapeBufferSize;
}
enum IID_IDXGIOutputDuplication = GUID(0x191cfac3, 0xa341, 0x470d, [0xb2, 0x6e, 0xa8, 0x64, 0xf4, 0x28, 0x31, 0x9c]);
interface IDXGIOutputDuplication : IDXGIObject
{
    void GetDesc(DXGI_OUTDUPL_DESC*);
    HRESULT AcquireNextFrame(uint, DXGI_OUTDUPL_FRAME_INFO*, IDXGIResource*);
    HRESULT GetFrameDirtyRects(uint, RECT*, uint*);
    HRESULT GetFrameMoveRects(uint, DXGI_OUTDUPL_MOVE_RECT*, uint*);
    HRESULT GetFramePointerShape(uint, void*, uint*, DXGI_OUTDUPL_POINTER_SHAPE_INFO*);
    HRESULT MapDesktopSurface(DXGI_MAPPED_RECT*);
    HRESULT UnMapDesktopSurface();
    HRESULT ReleaseFrame();
}
enum IID_IDXGISurface2 = GUID(0xaba496dd, 0xb617, 0x4cb8, [0xa8, 0x66, 0xbc, 0x44, 0xd7, 0xeb, 0x1f, 0xa2]);
interface IDXGISurface2 : IDXGISurface1
{
    HRESULT GetResource(const(GUID)*, void**, uint*);
}
enum IID_IDXGIResource1 = GUID(0x30961379, 0x4609, 0x4a41, [0x99, 0x8e, 0x54, 0xfe, 0x56, 0x7e, 0xe0, 0xc1]);
interface IDXGIResource1 : IDXGIResource
{
    HRESULT CreateSubresourceSurface(uint, IDXGISurface2*);
    HRESULT CreateSharedHandle(const(SECURITY_ATTRIBUTES)*, uint, const(wchar)*, HANDLE*);
}
alias DXGI_OFFER_RESOURCE_PRIORITY = int;
enum : int
{
    DXGI_OFFER_RESOURCE_PRIORITY_LOW    = 0x00000001,
    DXGI_OFFER_RESOURCE_PRIORITY_NORMAL = 0x00000002,
    DXGI_OFFER_RESOURCE_PRIORITY_HIGH   = 0x00000003,
}

enum IID_IDXGIDevice2 = GUID(0x5008617, 0xfbfd, 0x4051, [0xa7, 0x90, 0x14, 0x48, 0x84, 0xb4, 0xf6, 0xa9]);
interface IDXGIDevice2 : IDXGIDevice1
{
    HRESULT OfferResources(uint, IDXGIResource*, DXGI_OFFER_RESOURCE_PRIORITY);
    HRESULT ReclaimResources(uint, IDXGIResource*, BOOL*);
    HRESULT EnqueueSetEvent(HANDLE);
}
struct DXGI_MODE_DESC1
{
    uint Width;
    uint Height;
    DXGI_RATIONAL RefreshRate;
    DXGI_FORMAT Format;
    DXGI_MODE_SCANLINE_ORDER ScanlineOrdering;
    DXGI_MODE_SCALING Scaling;
    BOOL Stereo;
}
alias DXGI_SCALING = int;
enum : int
{
    DXGI_SCALING_STRETCH              = 0x00000000,
    DXGI_SCALING_NONE                 = 0x00000001,
    DXGI_SCALING_ASPECT_RATIO_STRETCH = 0x00000002,
}

struct DXGI_SWAP_CHAIN_DESC1
{
    uint Width;
    uint Height;
    DXGI_FORMAT Format;
    BOOL Stereo;
    DXGI_SAMPLE_DESC SampleDesc;
    DXGI_USAGE BufferUsage;
    uint BufferCount;
    DXGI_SCALING Scaling;
    DXGI_SWAP_EFFECT SwapEffect;
    DXGI_ALPHA_MODE AlphaMode;
    uint Flags;
}
struct DXGI_SWAP_CHAIN_FULLSCREEN_DESC
{
    DXGI_RATIONAL RefreshRate;
    DXGI_MODE_SCANLINE_ORDER ScanlineOrdering;
    DXGI_MODE_SCALING Scaling;
    BOOL Windowed;
}
struct DXGI_PRESENT_PARAMETERS
{
    uint DirtyRectsCount;
    RECT* pDirtyRects;
    RECT* pScrollRect;
    POINT* pScrollOffset;
}
enum IID_IDXGISwapChain1 = GUID(0x790a45f7, 0xd42, 0x4876, [0x98, 0x3a, 0xa, 0x55, 0xcf, 0xe6, 0xf4, 0xaa]);
interface IDXGISwapChain1 : IDXGISwapChain
{
    HRESULT GetDesc1(DXGI_SWAP_CHAIN_DESC1*);
    HRESULT GetFullscreenDesc(DXGI_SWAP_CHAIN_FULLSCREEN_DESC*);
    HRESULT GetHwnd(HWND*);
    HRESULT GetCoreWindow(const(GUID)*, void**);
    HRESULT Present1(uint, uint, const(DXGI_PRESENT_PARAMETERS)*);
    BOOL IsTemporaryMonoSupported();
    HRESULT GetRestrictToOutput(IDXGIOutput*);
    HRESULT SetBackgroundColor(const(DXGI_RGBA)*);
    HRESULT GetBackgroundColor(DXGI_RGBA*);
    HRESULT SetRotation(DXGI_MODE_ROTATION);
    HRESULT GetRotation(DXGI_MODE_ROTATION*);
}
enum IID_IDXGIFactory2 = GUID(0x50c83a1c, 0xe072, 0x4c48, [0x87, 0xb0, 0x36, 0x30, 0xfa, 0x36, 0xa6, 0xd0]);
interface IDXGIFactory2 : IDXGIFactory1
{
    BOOL IsWindowedStereoEnabled();
    HRESULT CreateSwapChainForHwnd(IUnknown, HWND, const(DXGI_SWAP_CHAIN_DESC1)*, const(DXGI_SWAP_CHAIN_FULLSCREEN_DESC)*, IDXGIOutput, IDXGISwapChain1*);
    HRESULT CreateSwapChainForCoreWindow(IUnknown, IUnknown, const(DXGI_SWAP_CHAIN_DESC1)*, IDXGIOutput, IDXGISwapChain1*);
    HRESULT GetSharedResourceAdapterLuid(HANDLE, LUID*);
    HRESULT RegisterStereoStatusWindow(HWND, uint, uint*);
    HRESULT RegisterStereoStatusEvent(HANDLE, uint*);
    void UnregisterStereoStatus(uint);
    HRESULT RegisterOcclusionStatusWindow(HWND, uint, uint*);
    HRESULT RegisterOcclusionStatusEvent(HANDLE, uint*);
    void UnregisterOcclusionStatus(uint);
    HRESULT CreateSwapChainForComposition(IUnknown, const(DXGI_SWAP_CHAIN_DESC1)*, IDXGIOutput, IDXGISwapChain1*);
}
alias DXGI_GRAPHICS_PREEMPTION_GRANULARITY = int;
enum : int
{
    DXGI_GRAPHICS_PREEMPTION_DMA_BUFFER_BOUNDARY  = 0x00000000,
    DXGI_GRAPHICS_PREEMPTION_PRIMITIVE_BOUNDARY   = 0x00000001,
    DXGI_GRAPHICS_PREEMPTION_TRIANGLE_BOUNDARY    = 0x00000002,
    DXGI_GRAPHICS_PREEMPTION_PIXEL_BOUNDARY       = 0x00000003,
    DXGI_GRAPHICS_PREEMPTION_INSTRUCTION_BOUNDARY = 0x00000004,
}

alias DXGI_COMPUTE_PREEMPTION_GRANULARITY = int;
enum : int
{
    DXGI_COMPUTE_PREEMPTION_DMA_BUFFER_BOUNDARY   = 0x00000000,
    DXGI_COMPUTE_PREEMPTION_DISPATCH_BOUNDARY     = 0x00000001,
    DXGI_COMPUTE_PREEMPTION_THREAD_GROUP_BOUNDARY = 0x00000002,
    DXGI_COMPUTE_PREEMPTION_THREAD_BOUNDARY       = 0x00000003,
    DXGI_COMPUTE_PREEMPTION_INSTRUCTION_BOUNDARY  = 0x00000004,
}

struct DXGI_ADAPTER_DESC2
{
    wchar[128] Description;
    uint VendorId;
    uint DeviceId;
    uint SubSysId;
    uint Revision;
    ulong DedicatedVideoMemory;
    ulong DedicatedSystemMemory;
    ulong SharedSystemMemory;
    LUID AdapterLuid;
    uint Flags;
    DXGI_GRAPHICS_PREEMPTION_GRANULARITY GraphicsPreemptionGranularity;
    DXGI_COMPUTE_PREEMPTION_GRANULARITY ComputePreemptionGranularity;
}
enum IID_IDXGIAdapter2 = GUID(0xaa1ae0a, 0xfa0e, 0x4b84, [0x86, 0x44, 0xe0, 0x5f, 0xf8, 0xe5, 0xac, 0xb5]);
interface IDXGIAdapter2 : IDXGIAdapter1
{
    HRESULT GetDesc2(DXGI_ADAPTER_DESC2*);
}
enum IID_IDXGIOutput1 = GUID(0xcddea8, 0x939b, 0x4b83, [0xa3, 0x40, 0xa6, 0x85, 0x22, 0x66, 0x66, 0xcc]);
interface IDXGIOutput1 : IDXGIOutput
{
    HRESULT GetDisplayModeList1(DXGI_FORMAT, uint, uint*, DXGI_MODE_DESC1*);
    HRESULT FindClosestMatchingMode1(const(DXGI_MODE_DESC1)*, DXGI_MODE_DESC1*, IUnknown);
    HRESULT GetDisplaySurfaceData1(IDXGIResource);
    HRESULT DuplicateOutput(IUnknown, IDXGIOutputDuplication*);
}
enum IID_IDXGIDevice3 = GUID(0x6007896c, 0x3244, 0x4afd, [0xbf, 0x18, 0xa6, 0xd3, 0xbe, 0xda, 0x50, 0x23]);
interface IDXGIDevice3 : IDXGIDevice2
{
    void Trim();
}
struct DXGI_MATRIX_3X2_F
{
    float _11;
    float _12;
    float _21;
    float _22;
    float _31;
    float _32;
}
enum IID_IDXGISwapChain2 = GUID(0xa8be2ac4, 0x199f, 0x4946, [0xb3, 0x31, 0x79, 0x59, 0x9f, 0xb9, 0x8d, 0xe7]);
interface IDXGISwapChain2 : IDXGISwapChain1
{
    HRESULT SetSourceSize(uint, uint);
    HRESULT GetSourceSize(uint*, uint*);
    HRESULT SetMaximumFrameLatency(uint);
    HRESULT GetMaximumFrameLatency(uint*);
    HANDLE GetFrameLatencyWaitableObject();
    HRESULT SetMatrixTransform(const(DXGI_MATRIX_3X2_F)*);
    HRESULT GetMatrixTransform(DXGI_MATRIX_3X2_F*);
}
enum IID_IDXGIOutput2 = GUID(0x595e39d1, 0x2724, 0x4663, [0x99, 0xb1, 0xda, 0x96, 0x9d, 0xe2, 0x83, 0x64]);
interface IDXGIOutput2 : IDXGIOutput1
{
    BOOL SupportsOverlays();
}
enum IID_IDXGIFactory3 = GUID(0x25483823, 0xcd46, 0x4c7d, [0x86, 0xca, 0x47, 0xaa, 0x95, 0xb8, 0x37, 0xbd]);
interface IDXGIFactory3 : IDXGIFactory2
{
    uint GetCreationFlags();
}
struct DXGI_DECODE_SWAP_CHAIN_DESC
{
    uint Flags;
}
alias DXGI_MULTIPLANE_OVERLAY_YCbCr_FLAGS = int;
enum : int
{
    DXGI_MULTIPLANE_OVERLAY_YCbCr_FLAG_NOMINAL_RANGE = 0x00000001,
    DXGI_MULTIPLANE_OVERLAY_YCbCr_FLAG_BT709         = 0x00000002,
    DXGI_MULTIPLANE_OVERLAY_YCbCr_FLAG_xvYCC         = 0x00000004,
}

enum IID_IDXGIDecodeSwapChain = GUID(0x2633066b, 0x4514, 0x4c7a, [0x8f, 0xd8, 0x12, 0xea, 0x98, 0x5, 0x9d, 0x18]);
interface IDXGIDecodeSwapChain : IUnknown
{
    HRESULT PresentBuffer(uint, uint, uint);
    HRESULT SetSourceRect(const(RECT)*);
    HRESULT SetTargetRect(const(RECT)*);
    HRESULT SetDestSize(uint, uint);
    HRESULT GetSourceRect(RECT*);
    HRESULT GetTargetRect(RECT*);
    HRESULT GetDestSize(uint*, uint*);
    HRESULT SetColorSpace(DXGI_MULTIPLANE_OVERLAY_YCbCr_FLAGS);
    DXGI_MULTIPLANE_OVERLAY_YCbCr_FLAGS GetColorSpace();
}
enum IID_IDXGIFactoryMedia = GUID(0x41e7d1f2, 0xa591, 0x4f7b, [0xa2, 0xe5, 0xfa, 0x9c, 0x84, 0x3e, 0x1c, 0x12]);
interface IDXGIFactoryMedia : IUnknown
{
    HRESULT CreateSwapChainForCompositionSurfaceHandle(IUnknown, HANDLE, const(DXGI_SWAP_CHAIN_DESC1)*, IDXGIOutput, IDXGISwapChain1*);
    HRESULT CreateDecodeSwapChainForCompositionSurfaceHandle(IUnknown, HANDLE, DXGI_DECODE_SWAP_CHAIN_DESC*, IDXGIResource, IDXGIOutput, IDXGIDecodeSwapChain*);
}
alias DXGI_FRAME_PRESENTATION_MODE = int;
enum : int
{
    DXGI_FRAME_PRESENTATION_MODE_COMPOSED            = 0x00000000,
    DXGI_FRAME_PRESENTATION_MODE_OVERLAY             = 0x00000001,
    DXGI_FRAME_PRESENTATION_MODE_NONE                = 0x00000002,
    DXGI_FRAME_PRESENTATION_MODE_COMPOSITION_FAILURE = 0x00000003,
}

struct DXGI_FRAME_STATISTICS_MEDIA
{
    uint PresentCount;
    uint PresentRefreshCount;
    uint SyncRefreshCount;
    LARGE_INTEGER SyncQPCTime;
    LARGE_INTEGER SyncGPUTime;
    DXGI_FRAME_PRESENTATION_MODE CompositionMode;
    uint ApprovedPresentDuration;
}
enum IID_IDXGISwapChainMedia = GUID(0xdd95b90b, 0xf05f, 0x4f6a, [0xbd, 0x65, 0x25, 0xbf, 0xb2, 0x64, 0xbd, 0x84]);
interface IDXGISwapChainMedia : IUnknown
{
    HRESULT GetFrameStatisticsMedia(DXGI_FRAME_STATISTICS_MEDIA*);
    HRESULT SetPresentDuration(uint);
    HRESULT CheckPresentDurationSupport(uint, uint*, uint*);
}
alias DXGI_OVERLAY_SUPPORT_FLAG = int;
enum : int
{
    DXGI_OVERLAY_SUPPORT_FLAG_DIRECT  = 0x00000001,
    DXGI_OVERLAY_SUPPORT_FLAG_SCALING = 0x00000002,
}

enum IID_IDXGIOutput3 = GUID(0x8a6bb301, 0x7e7e, 0x41f4, [0xa8, 0xe0, 0x5b, 0x32, 0xf7, 0xf9, 0x9b, 0x18]);
interface IDXGIOutput3 : IDXGIOutput2
{
    HRESULT CheckOverlaySupport(DXGI_FORMAT, IUnknown, uint*);
}
alias DXGI_SWAP_CHAIN_COLOR_SPACE_SUPPORT_FLAG = int;
enum : int
{
    DXGI_SWAP_CHAIN_COLOR_SPACE_SUPPORT_FLAG_PRESENT         = 0x00000001,
    DXGI_SWAP_CHAIN_COLOR_SPACE_SUPPORT_FLAG_OVERLAY_PRESENT = 0x00000002,
}

enum IID_IDXGISwapChain3 = GUID(0x94d99bdb, 0xf1f8, 0x4ab0, [0xb2, 0x36, 0x7d, 0xa0, 0x17, 0xe, 0xda, 0xb1]);
interface IDXGISwapChain3 : IDXGISwapChain2
{
    uint GetCurrentBackBufferIndex();
    HRESULT CheckColorSpaceSupport(DXGI_COLOR_SPACE_TYPE, uint*);
    HRESULT SetColorSpace1(DXGI_COLOR_SPACE_TYPE);
    HRESULT ResizeBuffers1(uint, uint, uint, DXGI_FORMAT, uint, const(uint)*, IUnknown*);
}
alias DXGI_OVERLAY_COLOR_SPACE_SUPPORT_FLAG = int;
enum : int
{
    DXGI_OVERLAY_COLOR_SPACE_SUPPORT_FLAG_PRESENT = 0x00000001,
}

enum IID_IDXGIOutput4 = GUID(0xdc7dca35, 0x2196, 0x414d, [0x9f, 0x53, 0x61, 0x78, 0x84, 0x3, 0x2a, 0x60]);
interface IDXGIOutput4 : IDXGIOutput3
{
    HRESULT CheckOverlayColorSpaceSupport(DXGI_FORMAT, DXGI_COLOR_SPACE_TYPE, IUnknown, uint*);
}
enum IID_IDXGIFactory4 = GUID(0x1bc6ea02, 0xef36, 0x464f, [0xbf, 0xc, 0x21, 0xca, 0x39, 0xe5, 0x16, 0x8a]);
interface IDXGIFactory4 : IDXGIFactory3
{
    HRESULT EnumAdapterByLuid(LUID, const(GUID)*, void**);
    HRESULT EnumWarpAdapter(const(GUID)*, void**);
}
alias DXGI_MEMORY_SEGMENT_GROUP = int;
enum : int
{
    DXGI_MEMORY_SEGMENT_GROUP_LOCAL     = 0x00000000,
    DXGI_MEMORY_SEGMENT_GROUP_NON_LOCAL = 0x00000001,
}

struct DXGI_QUERY_VIDEO_MEMORY_INFO
{
    ulong Budget;
    ulong CurrentUsage;
    ulong AvailableForReservation;
    ulong CurrentReservation;
}
enum IID_IDXGIAdapter3 = GUID(0x645967a4, 0x1392, 0x4310, [0xa7, 0x98, 0x80, 0x53, 0xce, 0x3e, 0x93, 0xfd]);
interface IDXGIAdapter3 : IDXGIAdapter2
{
    HRESULT RegisterHardwareContentProtectionTeardownStatusEvent(HANDLE, uint*);
    void UnregisterHardwareContentProtectionTeardownStatus(uint);
    HRESULT QueryVideoMemoryInfo(uint, DXGI_MEMORY_SEGMENT_GROUP, DXGI_QUERY_VIDEO_MEMORY_INFO*);
    HRESULT SetVideoMemoryReservation(uint, DXGI_MEMORY_SEGMENT_GROUP, ulong);
    HRESULT RegisterVideoMemoryBudgetChangeNotificationEvent(HANDLE, uint*);
    void UnregisterVideoMemoryBudgetChangeNotification(uint);
}
alias DXGI_OUTDUPL_FLAG = int;
enum : int
{
    DXGI_OUTDUPL_COMPOSITED_UI_CAPTURE_ONLY = 0x00000001,
}

enum IID_IDXGIOutput5 = GUID(0x80a07424, 0xab52, 0x42eb, [0x83, 0x3c, 0xc, 0x42, 0xfd, 0x28, 0x2d, 0x98]);
interface IDXGIOutput5 : IDXGIOutput4
{
    HRESULT DuplicateOutput1(IUnknown, uint, uint, const(DXGI_FORMAT)*, IDXGIOutputDuplication*);
}
alias DXGI_HDR_METADATA_TYPE = int;
enum : int
{
    DXGI_HDR_METADATA_TYPE_NONE      = 0x00000000,
    DXGI_HDR_METADATA_TYPE_HDR10     = 0x00000001,
    DXGI_HDR_METADATA_TYPE_HDR10PLUS = 0x00000002,
}

struct DXGI_HDR_METADATA_HDR10
{
    ushort[2] RedPrimary;
    ushort[2] GreenPrimary;
    ushort[2] BluePrimary;
    ushort[2] WhitePoint;
    uint MaxMasteringLuminance;
    uint MinMasteringLuminance;
    ushort MaxContentLightLevel;
    ushort MaxFrameAverageLightLevel;
}
struct DXGI_HDR_METADATA_HDR10PLUS
{
    ubyte[72] Data;
}
enum IID_IDXGISwapChain4 = GUID(0x3d585d5a, 0xbd4a, 0x489e, [0xb1, 0xf4, 0x3d, 0xbc, 0xb6, 0x45, 0x2f, 0xfb]);
interface IDXGISwapChain4 : IDXGISwapChain3
{
    HRESULT SetHDRMetaData(DXGI_HDR_METADATA_TYPE, uint, void*);
}
alias DXGI_OFFER_RESOURCE_FLAGS = int;
enum : int
{
    DXGI_OFFER_RESOURCE_FLAG_ALLOW_DECOMMIT = 0x00000001,
}

alias DXGI_RECLAIM_RESOURCE_RESULTS = int;
enum : int
{
    DXGI_RECLAIM_RESOURCE_RESULT_OK            = 0x00000000,
    DXGI_RECLAIM_RESOURCE_RESULT_DISCARDED     = 0x00000001,
    DXGI_RECLAIM_RESOURCE_RESULT_NOT_COMMITTED = 0x00000002,
}

enum IID_IDXGIDevice4 = GUID(0x95b4f95f, 0xd8da, 0x4ca4, [0x9e, 0xe6, 0x3b, 0x76, 0xd5, 0x96, 0x8a, 0x10]);
interface IDXGIDevice4 : IDXGIDevice3
{
    HRESULT OfferResources1(uint, IDXGIResource*, DXGI_OFFER_RESOURCE_PRIORITY, uint);
    HRESULT ReclaimResources1(uint, IDXGIResource*, DXGI_RECLAIM_RESOURCE_RESULTS*);
}
alias DXGI_FEATURE = int;
enum : int
{
    DXGI_FEATURE_PRESENT_ALLOW_TEARING = 0x00000000,
}

enum IID_IDXGIFactory5 = GUID(0x7632e1f5, 0xee65, 0x4dca, [0x87, 0xfd, 0x84, 0xcd, 0x75, 0xf8, 0x83, 0x8d]);
interface IDXGIFactory5 : IDXGIFactory4
{
    HRESULT CheckFeatureSupport(DXGI_FEATURE, void*, uint);
}
alias DXGI_ADAPTER_FLAG3 = uint;
enum : uint
{
    DXGI_ADAPTER_FLAG3_NONE                         = 0x00000000,
    DXGI_ADAPTER_FLAG3_REMOTE                       = 0x00000001,
    DXGI_ADAPTER_FLAG3_SOFTWARE                     = 0x00000002,
    DXGI_ADAPTER_FLAG3_ACG_COMPATIBLE               = 0x00000004,
    DXGI_ADAPTER_FLAG3_SUPPORT_MONITORED_FENCES     = 0x00000008,
    DXGI_ADAPTER_FLAG3_SUPPORT_NON_MONITORED_FENCES = 0x00000010,
    DXGI_ADAPTER_FLAG3_KEYED_MUTEX_CONFORMANCE      = 0x00000020,
    DXGI_ADAPTER_FLAG3_FORCE_DWORD                  = 0xffffffff,
}

struct DXGI_ADAPTER_DESC3
{
    wchar[128] Description;
    uint VendorId;
    uint DeviceId;
    uint SubSysId;
    uint Revision;
    ulong DedicatedVideoMemory;
    ulong DedicatedSystemMemory;
    ulong SharedSystemMemory;
    LUID AdapterLuid;
    DXGI_ADAPTER_FLAG3 Flags;
    DXGI_GRAPHICS_PREEMPTION_GRANULARITY GraphicsPreemptionGranularity;
    DXGI_COMPUTE_PREEMPTION_GRANULARITY ComputePreemptionGranularity;
}
enum IID_IDXGIAdapter4 = GUID(0x3c8d99d1, 0x4fbf, 0x4181, [0xa8, 0x2c, 0xaf, 0x66, 0xbf, 0x7b, 0xd2, 0x4e]);
interface IDXGIAdapter4 : IDXGIAdapter3
{
    HRESULT GetDesc3(DXGI_ADAPTER_DESC3*);
}
struct DXGI_OUTPUT_DESC1
{
    wchar[32] DeviceName;
    RECT DesktopCoordinates;
    BOOL AttachedToDesktop;
    DXGI_MODE_ROTATION Rotation;
    HMONITOR Monitor;
    uint BitsPerColor;
    DXGI_COLOR_SPACE_TYPE ColorSpace;
    float[2] RedPrimary;
    float[2] GreenPrimary;
    float[2] BluePrimary;
    float[2] WhitePoint;
    float MinLuminance;
    float MaxLuminance;
    float MaxFullFrameLuminance;
}
alias DXGI_HARDWARE_COMPOSITION_SUPPORT_FLAGS = uint;
enum : uint
{
    DXGI_HARDWARE_COMPOSITION_SUPPORT_FLAG_FULLSCREEN       = 0x00000001,
    DXGI_HARDWARE_COMPOSITION_SUPPORT_FLAG_WINDOWED         = 0x00000002,
    DXGI_HARDWARE_COMPOSITION_SUPPORT_FLAG_CURSOR_STRETCHED = 0x00000004,
}

enum IID_IDXGIOutput6 = GUID(0x68346e8, 0xaaec, 0x4b84, [0xad, 0xd7, 0x13, 0x7f, 0x51, 0x3f, 0x77, 0xa1]);
interface IDXGIOutput6 : IDXGIOutput5
{
    HRESULT GetDesc1(DXGI_OUTPUT_DESC1*);
    HRESULT CheckHardwareCompositionSupport(uint*);
}
alias DXGI_GPU_PREFERENCE = int;
enum : int
{
    DXGI_GPU_PREFERENCE_UNSPECIFIED      = 0x00000000,
    DXGI_GPU_PREFERENCE_MINIMUM_POWER    = 0x00000001,
    DXGI_GPU_PREFERENCE_HIGH_PERFORMANCE = 0x00000002,
}

enum IID_IDXGIFactory6 = GUID(0xc1b6694f, 0xff09, 0x44a9, [0xb0, 0x3c, 0x77, 0x90, 0xa, 0xa, 0x1d, 0x17]);
interface IDXGIFactory6 : IDXGIFactory5
{
    HRESULT EnumAdapterByGpuPreference(uint, DXGI_GPU_PREFERENCE, const(GUID)*, void**);
}
enum IID_IDXGIFactory7 = GUID(0xa4966eed, 0x76db, 0x44da, [0x84, 0xc1, 0xee, 0x9a, 0x7a, 0xfb, 0x20, 0xa8]);
interface IDXGIFactory7 : IDXGIFactory6
{
    HRESULT RegisterAdaptersChangedEvent(HANDLE, uint*);
    HRESULT UnregisterAdaptersChangedEvent(uint);
}
alias DXGI_DEBUG_RLO_FLAGS = uint;
enum : uint
{
    DXGI_DEBUG_RLO_SUMMARY         = 0x00000001,
    DXGI_DEBUG_RLO_DETAIL          = 0x00000002,
    DXGI_DEBUG_RLO_IGNORE_INTERNAL = 0x00000004,
    DXGI_DEBUG_RLO_ALL             = 0x00000007,
}

alias DXGI_INFO_QUEUE_MESSAGE_CATEGORY = int;
enum : int
{
    DXGI_INFO_QUEUE_MESSAGE_CATEGORY_UNKNOWN               = 0x00000000,
    DXGI_INFO_QUEUE_MESSAGE_CATEGORY_MISCELLANEOUS         = 0x00000001,
    DXGI_INFO_QUEUE_MESSAGE_CATEGORY_INITIALIZATION        = 0x00000002,
    DXGI_INFO_QUEUE_MESSAGE_CATEGORY_CLEANUP               = 0x00000003,
    DXGI_INFO_QUEUE_MESSAGE_CATEGORY_COMPILATION           = 0x00000004,
    DXGI_INFO_QUEUE_MESSAGE_CATEGORY_STATE_CREATION        = 0x00000005,
    DXGI_INFO_QUEUE_MESSAGE_CATEGORY_STATE_SETTING         = 0x00000006,
    DXGI_INFO_QUEUE_MESSAGE_CATEGORY_STATE_GETTING         = 0x00000007,
    DXGI_INFO_QUEUE_MESSAGE_CATEGORY_RESOURCE_MANIPULATION = 0x00000008,
    DXGI_INFO_QUEUE_MESSAGE_CATEGORY_EXECUTION             = 0x00000009,
    DXGI_INFO_QUEUE_MESSAGE_CATEGORY_SHADER                = 0x0000000a,
}

alias DXGI_INFO_QUEUE_MESSAGE_SEVERITY = int;
enum : int
{
    DXGI_INFO_QUEUE_MESSAGE_SEVERITY_CORRUPTION = 0x00000000,
    DXGI_INFO_QUEUE_MESSAGE_SEVERITY_ERROR      = 0x00000001,
    DXGI_INFO_QUEUE_MESSAGE_SEVERITY_WARNING    = 0x00000002,
    DXGI_INFO_QUEUE_MESSAGE_SEVERITY_INFO       = 0x00000003,
    DXGI_INFO_QUEUE_MESSAGE_SEVERITY_MESSAGE    = 0x00000004,
}

struct DXGI_INFO_QUEUE_MESSAGE
{
    GUID Producer;
    DXGI_INFO_QUEUE_MESSAGE_CATEGORY Category;
    DXGI_INFO_QUEUE_MESSAGE_SEVERITY Severity;
    int ID;
    const(ubyte)* pDescription;
    ulong DescriptionByteLength;
}
struct DXGI_INFO_QUEUE_FILTER_DESC
{
    uint NumCategories;
    DXGI_INFO_QUEUE_MESSAGE_CATEGORY* pCategoryList;
    uint NumSeverities;
    DXGI_INFO_QUEUE_MESSAGE_SEVERITY* pSeverityList;
    uint NumIDs;
    int* pIDList;
}
struct DXGI_INFO_QUEUE_FILTER
{
    DXGI_INFO_QUEUE_FILTER_DESC AllowList;
    DXGI_INFO_QUEUE_FILTER_DESC DenyList;
}
enum IID_IDXGIInfoQueue = GUID(0xd67441c7, 0x672a, 0x476f, [0x9e, 0x82, 0xcd, 0x55, 0xb4, 0x49, 0x49, 0xce]);
interface IDXGIInfoQueue : IUnknown
{
    HRESULT SetMessageCountLimit(GUID, ulong);
    void ClearStoredMessages(GUID);
    HRESULT GetMessage(GUID, ulong, DXGI_INFO_QUEUE_MESSAGE*, ulong*);
    ulong GetNumStoredMessagesAllowedByRetrievalFilters(GUID);
    ulong GetNumStoredMessages(GUID);
    ulong GetNumMessagesDiscardedByMessageCountLimit(GUID);
    ulong GetMessageCountLimit(GUID);
    ulong GetNumMessagesAllowedByStorageFilter(GUID);
    ulong GetNumMessagesDeniedByStorageFilter(GUID);
    HRESULT AddStorageFilterEntries(GUID, DXGI_INFO_QUEUE_FILTER*);
    HRESULT GetStorageFilter(GUID, DXGI_INFO_QUEUE_FILTER*, ulong*);
    void ClearStorageFilter(GUID);
    HRESULT PushEmptyStorageFilter(GUID);
    HRESULT PushDenyAllStorageFilter(GUID);
    HRESULT PushCopyOfStorageFilter(GUID);
    HRESULT PushStorageFilter(GUID, DXGI_INFO_QUEUE_FILTER*);
    void PopStorageFilter(GUID);
    uint GetStorageFilterStackSize(GUID);
    HRESULT AddRetrievalFilterEntries(GUID, DXGI_INFO_QUEUE_FILTER*);
    HRESULT GetRetrievalFilter(GUID, DXGI_INFO_QUEUE_FILTER*, ulong*);
    void ClearRetrievalFilter(GUID);
    HRESULT PushEmptyRetrievalFilter(GUID);
    HRESULT PushDenyAllRetrievalFilter(GUID);
    HRESULT PushCopyOfRetrievalFilter(GUID);
    HRESULT PushRetrievalFilter(GUID, DXGI_INFO_QUEUE_FILTER*);
    void PopRetrievalFilter(GUID);
    uint GetRetrievalFilterStackSize(GUID);
    HRESULT AddMessage(GUID, DXGI_INFO_QUEUE_MESSAGE_CATEGORY, DXGI_INFO_QUEUE_MESSAGE_SEVERITY, int, const(char)*);
    HRESULT AddApplicationMessage(DXGI_INFO_QUEUE_MESSAGE_SEVERITY, const(char)*);
    HRESULT SetBreakOnCategory(GUID, DXGI_INFO_QUEUE_MESSAGE_CATEGORY, BOOL);
    HRESULT SetBreakOnSeverity(GUID, DXGI_INFO_QUEUE_MESSAGE_SEVERITY, BOOL);
    HRESULT SetBreakOnID(GUID, int, BOOL);
    BOOL GetBreakOnCategory(GUID, DXGI_INFO_QUEUE_MESSAGE_CATEGORY);
    BOOL GetBreakOnSeverity(GUID, DXGI_INFO_QUEUE_MESSAGE_SEVERITY);
    BOOL GetBreakOnID(GUID, int);
    void SetMuteDebugOutput(GUID, BOOL);
    BOOL GetMuteDebugOutput(GUID);
}
enum IID_IDXGIDebug = GUID(0x119e7452, 0xde9e, 0x40fe, [0x88, 0x6, 0x88, 0xf9, 0xc, 0x12, 0xb4, 0x41]);
interface IDXGIDebug : IUnknown
{
    HRESULT ReportLiveObjects(GUID, DXGI_DEBUG_RLO_FLAGS);
}
enum IID_IDXGIDebug1 = GUID(0xc5a05f0c, 0x16f2, 0x4adf, [0x9f, 0x4d, 0xa8, 0xc4, 0xd5, 0x8a, 0xc5, 0x50]);
interface IDXGIDebug1 : IDXGIDebug
{
    void EnableLeakTrackingForThread();
    void DisableLeakTrackingForThread();
    BOOL IsLeakTrackingEnabledForThread();
}
alias DXGI_Message_Id = int;
enum : int
{
    DXGI_MSG_IDXGISwapChain_CreationOrResizeBuffers_InvalidOutputWindow                                                 = 0x00000000,
    DXGI_MSG_IDXGISwapChain_CreationOrResizeBuffers_BufferWidthInferred                                                 = 0x00000001,
    DXGI_MSG_IDXGISwapChain_CreationOrResizeBuffers_BufferHeightInferred                                                = 0x00000002,
    DXGI_MSG_IDXGISwapChain_CreationOrResizeBuffers_NoScanoutFlagChanged                                                = 0x00000003,
    DXGI_MSG_IDXGISwapChain_Creation_MaxBufferCountExceeded                                                             = 0x00000004,
    DXGI_MSG_IDXGISwapChain_Creation_TooFewBuffers                                                                      = 0x00000005,
    DXGI_MSG_IDXGISwapChain_Creation_NoOutputWindow                                                                     = 0x00000006,
    DXGI_MSG_IDXGISwapChain_Destruction_OtherMethodsCalled                                                              = 0x00000007,
    DXGI_MSG_IDXGISwapChain_GetDesc_pDescIsNULL                                                                         = 0x00000008,
    DXGI_MSG_IDXGISwapChain_GetBuffer_ppSurfaceIsNULL                                                                   = 0x00000009,
    DXGI_MSG_IDXGISwapChain_GetBuffer_NoAllocatedBuffers                                                                = 0x0000000a,
    DXGI_MSG_IDXGISwapChain_GetBuffer_iBufferMustBeZero                                                                 = 0x0000000b,
    DXGI_MSG_IDXGISwapChain_GetBuffer_iBufferOOB                                                                        = 0x0000000c,
    DXGI_MSG_IDXGISwapChain_GetContainingOutput_ppOutputIsNULL                                                          = 0x0000000d,
    DXGI_MSG_IDXGISwapChain_Present_SyncIntervalOOB                                                                     = 0x0000000e,
    DXGI_MSG_IDXGISwapChain_Present_InvalidNonPreRotatedFlag                                                            = 0x0000000f,
    DXGI_MSG_IDXGISwapChain_Present_NoAllocatedBuffers                                                                  = 0x00000010,
    DXGI_MSG_IDXGISwapChain_Present_GetDXGIAdapterFailed                                                                = 0x00000011,
    DXGI_MSG_IDXGISwapChain_ResizeBuffers_BufferCountOOB                                                                = 0x00000012,
    DXGI_MSG_IDXGISwapChain_ResizeBuffers_UnreleasedReferences                                                          = 0x00000013,
    DXGI_MSG_IDXGISwapChain_ResizeBuffers_InvalidSwapChainFlag                                                          = 0x00000014,
    DXGI_MSG_IDXGISwapChain_ResizeBuffers_InvalidNonPreRotatedFlag                                                      = 0x00000015,
    DXGI_MSG_IDXGISwapChain_ResizeTarget_RefreshRateDivideByZero                                                        = 0x00000016,
    DXGI_MSG_IDXGISwapChain_SetFullscreenState_InvalidTarget                                                            = 0x00000017,
    DXGI_MSG_IDXGISwapChain_GetFrameStatistics_pStatsIsNULL                                                             = 0x00000018,
    DXGI_MSG_IDXGISwapChain_GetLastPresentCount_pLastPresentCountIsNULL                                                 = 0x00000019,
    DXGI_MSG_IDXGISwapChain_SetFullscreenState_RemoteNotSupported                                                       = 0x0000001a,
    DXGI_MSG_IDXGIOutput_TakeOwnership_FailedToAcquireFullscreenMutex                                                   = 0x0000001b,
    DXGI_MSG_IDXGIFactory_CreateSoftwareAdapter_ppAdapterInterfaceIsNULL                                                = 0x0000001c,
    DXGI_MSG_IDXGIFactory_EnumAdapters_ppAdapterInterfaceIsNULL                                                         = 0x0000001d,
    DXGI_MSG_IDXGIFactory_CreateSwapChain_ppSwapChainIsNULL                                                             = 0x0000001e,
    DXGI_MSG_IDXGIFactory_CreateSwapChain_pDescIsNULL                                                                   = 0x0000001f,
    DXGI_MSG_IDXGIFactory_CreateSwapChain_UnknownSwapEffect                                                             = 0x00000020,
    DXGI_MSG_IDXGIFactory_CreateSwapChain_InvalidFlags                                                                  = 0x00000021,
    DXGI_MSG_IDXGIFactory_CreateSwapChain_NonPreRotatedFlagAndWindowed                                                  = 0x00000022,
    DXGI_MSG_IDXGIFactory_CreateSwapChain_NullDeviceInterface                                                           = 0x00000023,
    DXGI_MSG_IDXGIFactory_GetWindowAssociation_phWndIsNULL                                                              = 0x00000024,
    DXGI_MSG_IDXGIFactory_MakeWindowAssociation_InvalidFlags                                                            = 0x00000025,
    DXGI_MSG_IDXGISurface_Map_InvalidSurface                                                                            = 0x00000026,
    DXGI_MSG_IDXGISurface_Map_FlagsSetToZero                                                                            = 0x00000027,
    DXGI_MSG_IDXGISurface_Map_DiscardAndReadFlagSet                                                                     = 0x00000028,
    DXGI_MSG_IDXGISurface_Map_DiscardButNotWriteFlagSet                                                                 = 0x00000029,
    DXGI_MSG_IDXGISurface_Map_NoCPUAccess                                                                               = 0x0000002a,
    DXGI_MSG_IDXGISurface_Map_ReadFlagSetButCPUAccessIsDynamic                                                          = 0x0000002b,
    DXGI_MSG_IDXGISurface_Map_DiscardFlagSetButCPUAccessIsNotDynamic                                                    = 0x0000002c,
    DXGI_MSG_IDXGIOutput_GetDisplayModeList_pNumModesIsNULL                                                             = 0x0000002d,
    DXGI_MSG_IDXGIOutput_FindClosestMatchingMode_ModeHasInvalidWidthOrHeight                                            = 0x0000002e,
    DXGI_MSG_IDXGIOutput_GetCammaControlCapabilities_NoOwnerDevice                                                      = 0x0000002f,
    DXGI_MSG_IDXGIOutput_TakeOwnership_pDeviceIsNULL                                                                    = 0x00000030,
    DXGI_MSG_IDXGIOutput_GetDisplaySurfaceData_NoOwnerDevice                                                            = 0x00000031,
    DXGI_MSG_IDXGIOutput_GetDisplaySurfaceData_pDestinationIsNULL                                                       = 0x00000032,
    DXGI_MSG_IDXGIOutput_GetDisplaySurfaceData_MapOfDestinationFailed                                                   = 0x00000033,
    DXGI_MSG_IDXGIOutput_GetFrameStatistics_NoOwnerDevice                                                               = 0x00000034,
    DXGI_MSG_IDXGIOutput_GetFrameStatistics_pStatsIsNULL                                                                = 0x00000035,
    DXGI_MSG_IDXGIOutput_SetGammaControl_NoOwnerDevice                                                                  = 0x00000036,
    DXGI_MSG_IDXGIOutput_GetGammaControl_NoOwnerDevice                                                                  = 0x00000037,
    DXGI_MSG_IDXGIOutput_GetGammaControl_NoGammaControls                                                                = 0x00000038,
    DXGI_MSG_IDXGIOutput_SetDisplaySurface_IDXGIResourceNotSupportedBypPrimary                                          = 0x00000039,
    DXGI_MSG_IDXGIOutput_SetDisplaySurface_pPrimaryIsInvalid                                                            = 0x0000003a,
    DXGI_MSG_IDXGIOutput_SetDisplaySurface_NoOwnerDevice                                                                = 0x0000003b,
    DXGI_MSG_IDXGIOutput_TakeOwnership_RemoteDeviceNotSupported                                                         = 0x0000003c,
    DXGI_MSG_IDXGIOutput_GetDisplayModeList_RemoteDeviceNotSupported                                                    = 0x0000003d,
    DXGI_MSG_IDXGIOutput_FindClosestMatchingMode_RemoteDeviceNotSupported                                               = 0x0000003e,
    DXGI_MSG_IDXGIDevice_CreateSurface_InvalidParametersWithpSharedResource                                             = 0x0000003f,
    DXGI_MSG_IDXGIObject_GetPrivateData_puiDataSizeIsNULL                                                               = 0x00000040,
    DXGI_MSG_IDXGISwapChain_Creation_InvalidOutputWindow                                                                = 0x00000041,
    DXGI_MSG_IDXGISwapChain_Release_SwapChainIsFullscreen                                                               = 0x00000042,
    DXGI_MSG_IDXGIOutput_GetDisplaySurfaceData_InvalidTargetSurfaceFormat                                               = 0x00000043,
    DXGI_MSG_IDXGIFactory_CreateSoftwareAdapter_ModuleIsNULL                                                            = 0x00000044,
    DXGI_MSG_IDXGIOutput_FindClosestMatchingMode_IDXGIDeviceNotSupportedBypConcernedDevice                              = 0x00000045,
    DXGI_MSG_IDXGIOutput_FindClosestMatchingMode_pModeToMatchOrpClosestMatchIsNULL                                      = 0x00000046,
    DXGI_MSG_IDXGIOutput_FindClosestMatchingMode_ModeHasRefreshRateDenominatorZero                                      = 0x00000047,
    DXGI_MSG_IDXGIOutput_FindClosestMatchingMode_UnknownFormatIsInvalidForConfiguration                                 = 0x00000048,
    DXGI_MSG_IDXGIOutput_FindClosestMatchingMode_InvalidDisplayModeScanlineOrdering                                     = 0x00000049,
    DXGI_MSG_IDXGIOutput_FindClosestMatchingMode_InvalidDisplayModeScaling                                              = 0x0000004a,
    DXGI_MSG_IDXGIOutput_FindClosestMatchingMode_InvalidDisplayModeFormatAndDeviceCombination                           = 0x0000004b,
    DXGI_MSG_IDXGIFactory_Creation_CalledFromDllMain                                                                    = 0x0000004c,
    DXGI_MSG_IDXGISwapChain_SetFullscreenState_OutputNotOwnedBySwapChainDevice                                          = 0x0000004d,
    DXGI_MSG_IDXGISwapChain_Creation_InvalidWindowStyle                                                                 = 0x0000004e,
    DXGI_MSG_IDXGISwapChain_GetFrameStatistics_UnsupportedStatistics                                                    = 0x0000004f,
    DXGI_MSG_IDXGISwapChain_GetContainingOutput_SwapchainAdapterDoesNotControlOutput                                    = 0x00000050,
    DXGI_MSG_IDXGIOutput_SetOrGetGammaControl_pArrayIsNULL                                                              = 0x00000051,
    DXGI_MSG_IDXGISwapChain_SetFullscreenState_FullscreenInvalidForChildWindows                                         = 0x00000052,
    DXGI_MSG_IDXGIFactory_Release_CalledFromDllMain                                                                     = 0x00000053,
    DXGI_MSG_IDXGISwapChain_Present_UnreleasedHDC                                                                       = 0x00000054,
    DXGI_MSG_IDXGISwapChain_ResizeBuffers_NonPreRotatedAndGDICompatibleFlags                                            = 0x00000055,
    DXGI_MSG_IDXGIFactory_CreateSwapChain_NonPreRotatedAndGDICompatibleFlags                                            = 0x00000056,
    DXGI_MSG_IDXGISurface1_GetDC_pHdcIsNULL                                                                             = 0x00000057,
    DXGI_MSG_IDXGISurface1_GetDC_SurfaceNotTexture2D                                                                    = 0x00000058,
    DXGI_MSG_IDXGISurface1_GetDC_GDICompatibleFlagNotSet                                                                = 0x00000059,
    DXGI_MSG_IDXGISurface1_GetDC_UnreleasedHDC                                                                          = 0x0000005a,
    DXGI_MSG_IDXGISurface_Map_NoCPUAccess2                                                                              = 0x0000005b,
    DXGI_MSG_IDXGISurface1_ReleaseDC_GetDCNotCalled                                                                     = 0x0000005c,
    DXGI_MSG_IDXGISurface1_ReleaseDC_InvalidRectangleDimensions                                                         = 0x0000005d,
    DXGI_MSG_IDXGIOutput_TakeOwnership_RemoteOutputNotSupported                                                         = 0x0000005e,
    DXGI_MSG_IDXGIOutput_FindClosestMatchingMode_RemoteOutputNotSupported                                               = 0x0000005f,
    DXGI_MSG_IDXGIOutput_GetDisplayModeList_RemoteOutputNotSupported                                                    = 0x00000060,
    DXGI_MSG_IDXGIFactory_CreateSwapChain_pDeviceHasMismatchedDXGIFactory                                               = 0x00000061,
    DXGI_MSG_IDXGISwapChain_Present_NonOptimalFSConfiguration                                                           = 0x00000062,
    DXGI_MSG_IDXGIFactory_CreateSwapChain_FlipSequentialNotSupportedOnD3D10                                             = 0x00000063,
    DXGI_MSG_IDXGIFactory_CreateSwapChain_BufferCountOOBForFlipSequential                                               = 0x00000064,
    DXGI_MSG_IDXGIFactory_CreateSwapChain_InvalidFormatForFlipSequential                                                = 0x00000065,
    DXGI_MSG_IDXGIFactory_CreateSwapChain_MultiSamplingNotSupportedForFlipSequential                                    = 0x00000066,
    DXGI_MSG_IDXGISwapChain_ResizeBuffers_BufferCountOOBForFlipSequential                                               = 0x00000067,
    DXGI_MSG_IDXGISwapChain_ResizeBuffers_InvalidFormatForFlipSequential                                                = 0x00000068,
    DXGI_MSG_IDXGISwapChain_Present_PartialPresentationBeforeStandardPresentation                                       = 0x00000069,
    DXGI_MSG_IDXGISwapChain_Present_FullscreenPartialPresentIsInvalid                                                   = 0x0000006a,
    DXGI_MSG_IDXGISwapChain_Present_InvalidPresentTestOrDoNotSequenceFlag                                               = 0x0000006b,
    DXGI_MSG_IDXGISwapChain_Present_ScrollInfoWithNoDirtyRectsSpecified                                                 = 0x0000006c,
    DXGI_MSG_IDXGISwapChain_Present_EmptyScrollRect                                                                     = 0x0000006d,
    DXGI_MSG_IDXGISwapChain_Present_ScrollRectOutOfBackbufferBounds                                                     = 0x0000006e,
    DXGI_MSG_IDXGISwapChain_Present_ScrollRectOutOfBackbufferBoundsWithOffset                                           = 0x0000006f,
    DXGI_MSG_IDXGISwapChain_Present_EmptyDirtyRect                                                                      = 0x00000070,
    DXGI_MSG_IDXGISwapChain_Present_DirtyRectOutOfBackbufferBounds                                                      = 0x00000071,
    DXGI_MSG_IDXGIFactory_CreateSwapChain_UnsupportedBufferUsageFlags                                                   = 0x00000072,
    DXGI_MSG_IDXGISwapChain_Present_DoNotSequenceFlagSetButPreviousBufferIsUndefined                                    = 0x00000073,
    DXGI_MSG_IDXGISwapChain_Present_UnsupportedFlags                                                                    = 0x00000074,
    DXGI_MSG_IDXGISwapChain_Present_FlipModelChainMustResizeOrCreateOnFSTransition                                      = 0x00000075,
    DXGI_MSG_IDXGIFactory_CreateSwapChain_pRestrictToOutputFromOtherIDXGIFactory                                        = 0x00000076,
    DXGI_MSG_IDXGIFactory_CreateSwapChain_RestrictOutputNotSupportedOnAdapter                                           = 0x00000077,
    DXGI_MSG_IDXGISwapChain_Present_RestrictToOutputFlagSetButInvalidpRestrictToOutput                                  = 0x00000078,
    DXGI_MSG_IDXGISwapChain_Present_RestrictToOutputFlagdWithFullscreen                                                 = 0x00000079,
    DXGI_MSG_IDXGISwapChain_Present_RestrictOutputFlagWithStaleSwapChain                                                = 0x0000007a,
    DXGI_MSG_IDXGISwapChain_Present_OtherFlagsCausingInvalidPresentTestFlag                                             = 0x0000007b,
    DXGI_MSG_IDXGIFactory_CreateSwapChain_UnavailableInSession0                                                         = 0x0000007c,
    DXGI_MSG_IDXGIFactory_MakeWindowAssociation_UnavailableInSession0                                                   = 0x0000007d,
    DXGI_MSG_IDXGIFactory_GetWindowAssociation_UnavailableInSession0                                                    = 0x0000007e,
    DXGI_MSG_IDXGIAdapter_EnumOutputs_UnavailableInSession0                                                             = 0x0000007f,
    DXGI_MSG_IDXGISwapChain_CreationOrSetFullscreenState_StereoDisabled                                                 = 0x00000080,
    DXGI_MSG_IDXGIFactory2_UnregisterStatus_CookieNotFound                                                              = 0x00000081,
    DXGI_MSG_IDXGISwapChain_Present_ProtectedContentInWindowedModeWithoutFSOrOverlay                                    = 0x00000082,
    DXGI_MSG_IDXGISwapChain_Present_ProtectedContentInWindowedModeWithoutFlipSequential                                 = 0x00000083,
    DXGI_MSG_IDXGISwapChain_Present_ProtectedContentWithRDPDriver                                                       = 0x00000084,
    DXGI_MSG_IDXGISwapChain_Present_ProtectedContentInWindowedModeWithDWMOffOrInvalidDisplayAffinity                    = 0x00000085,
    DXGI_MSG_IDXGIFactory_CreateSwapChainForComposition_WidthOrHeightIsZero                                             = 0x00000086,
    DXGI_MSG_IDXGIFactory_CreateSwapChainForComposition_OnlyFlipSequentialSupported                                     = 0x00000087,
    DXGI_MSG_IDXGIFactory_CreateSwapChainForComposition_UnsupportedOnAdapter                                            = 0x00000088,
    DXGI_MSG_IDXGIFactory_CreateSwapChainForComposition_UnsupportedOnWindows7                                           = 0x00000089,
    DXGI_MSG_IDXGISwapChain_SetFullscreenState_FSTransitionWithCompositionSwapChain                                     = 0x0000008a,
    DXGI_MSG_IDXGISwapChain_ResizeTarget_InvalidWithCompositionSwapChain                                                = 0x0000008b,
    DXGI_MSG_IDXGISwapChain_ResizeBuffers_WidthOrHeightIsZero                                                           = 0x0000008c,
    DXGI_MSG_IDXGIFactory_CreateSwapChain_ScalingNoneIsFlipModelOnly                                                    = 0x0000008d,
    DXGI_MSG_IDXGIFactory_CreateSwapChain_ScalingUnrecognized                                                           = 0x0000008e,
    DXGI_MSG_IDXGIFactory_CreateSwapChain_DisplayOnlyFullscreenUnsupported                                              = 0x0000008f,
    DXGI_MSG_IDXGIFactory_CreateSwapChain_DisplayOnlyUnsupported                                                        = 0x00000090,
    DXGI_MSG_IDXGISwapChain_Present_RestartIsFullscreenOnly                                                             = 0x00000091,
    DXGI_MSG_IDXGISwapChain_Present_ProtectedWindowlessPresentationRequiresDisplayOnly                                  = 0x00000092,
    DXGI_MSG_IDXGISwapChain_SetFullscreenState_DisplayOnlyUnsupported                                                   = 0x00000093,
    DXGI_MSG_IDXGISwapChain1_SetBackgroundColor_OutOfRange                                                              = 0x00000094,
    DXGI_MSG_IDXGISwapChain_ResizeBuffers_DisplayOnlyFullscreenUnsupported                                              = 0x00000095,
    DXGI_MSG_IDXGISwapChain_ResizeBuffers_DisplayOnlyUnsupported                                                        = 0x00000096,
    DXGI_MSG_IDXGISwapchain_Present_ScrollUnsupported                                                                   = 0x00000097,
    DXGI_MSG_IDXGISwapChain1_SetRotation_UnsupportedOS                                                                  = 0x00000098,
    DXGI_MSG_IDXGISwapChain1_GetRotation_UnsupportedOS                                                                  = 0x00000099,
    DXGI_MSG_IDXGISwapchain_Present_FullscreenRotation                                                                  = 0x0000009a,
    DXGI_MSG_IDXGISwapChain_Present_PartialPresentationWithMSAABuffers                                                  = 0x0000009b,
    DXGI_MSG_IDXGISwapChain1_SetRotation_FlipSequentialRequired                                                         = 0x0000009c,
    DXGI_MSG_IDXGISwapChain1_SetRotation_InvalidRotation                                                                = 0x0000009d,
    DXGI_MSG_IDXGISwapChain1_GetRotation_FlipSequentialRequired                                                         = 0x0000009e,
    DXGI_MSG_IDXGISwapChain_GetHwnd_WrongType                                                                           = 0x0000009f,
    DXGI_MSG_IDXGISwapChain_GetCompositionSurface_WrongType                                                             = 0x000000a0,
    DXGI_MSG_IDXGISwapChain_GetCoreWindow_WrongType                                                                     = 0x000000a1,
    DXGI_MSG_IDXGISwapChain_GetFullscreenDesc_NonHwnd                                                                   = 0x000000a2,
    DXGI_MSG_IDXGISwapChain_SetFullscreenState_CoreWindow                                                               = 0x000000a3,
    DXGI_MSG_IDXGIFactory2_CreateSwapChainForCoreWindow_UnsupportedOnWindows7                                           = 0x000000a4,
    DXGI_MSG_IDXGIFactory2_CreateSwapChainForCoreWindow_pWindowIsNULL                                                   = 0x000000a5,
    DXGI_MSG_IDXGIFactory_CreateSwapChain_FSUnsupportedForModernApps                                                    = 0x000000a6,
    DXGI_MSG_IDXGIFactory_MakeWindowAssociation_ModernApp                                                               = 0x000000a7,
    DXGI_MSG_IDXGISwapChain_ResizeTarget_ModernApp                                                                      = 0x000000a8,
    DXGI_MSG_IDXGISwapChain_ResizeTarget_pNewTargetParametersIsNULL                                                     = 0x000000a9,
    DXGI_MSG_IDXGIOutput_SetDisplaySurface_ModernApp                                                                    = 0x000000aa,
    DXGI_MSG_IDXGIOutput_TakeOwnership_ModernApp                                                                        = 0x000000ab,
    DXGI_MSG_IDXGIFactory2_CreateSwapChainForCoreWindow_pWindowIsInvalid                                                = 0x000000ac,
    DXGI_MSG_IDXGIFactory2_CreateSwapChainForCompositionSurface_InvalidHandle                                           = 0x000000ad,
    DXGI_MSG_IDXGISurface1_GetDC_ModernApp                                                                              = 0x000000ae,
    DXGI_MSG_IDXGIFactory_CreateSwapChain_ScalingNoneRequiresWindows8OrNewer                                            = 0x000000af,
    DXGI_MSG_IDXGISwapChain_Present_TemporaryMonoAndPreferRight                                                         = 0x000000b0,
    DXGI_MSG_IDXGISwapChain_Present_TemporaryMonoOrPreferRightWithDoNotSequence                                         = 0x000000b1,
    DXGI_MSG_IDXGISwapChain_Present_TemporaryMonoOrPreferRightWithoutStereo                                             = 0x000000b2,
    DXGI_MSG_IDXGISwapChain_Present_TemporaryMonoUnsupported                                                            = 0x000000b3,
    DXGI_MSG_IDXGIOutput_GetDisplaySurfaceData_ArraySizeMismatch                                                        = 0x000000b4,
    DXGI_MSG_IDXGISwapChain_Present_PartialPresentationWithSwapEffectDiscard                                            = 0x000000b5,
    DXGI_MSG_IDXGIFactory_CreateSwapChain_AlphaUnrecognized                                                             = 0x000000b6,
    DXGI_MSG_IDXGIFactory_CreateSwapChain_AlphaIsWindowlessOnly                                                         = 0x000000b7,
    DXGI_MSG_IDXGIFactory_CreateSwapChain_AlphaIsFlipModelOnly                                                          = 0x000000b8,
    DXGI_MSG_IDXGIFactory_CreateSwapChain_RestrictToOutputAdapterMismatch                                               = 0x000000b9,
    DXGI_MSG_IDXGIFactory_CreateSwapChain_DisplayOnlyOnLegacy                                                           = 0x000000ba,
    DXGI_MSG_IDXGISwapChain_ResizeBuffers_DisplayOnlyOnLegacy                                                           = 0x000000bb,
    DXGI_MSG_IDXGIResource1_CreateSubresourceSurface_InvalidIndex                                                       = 0x000000bc,
    DXGI_MSG_IDXGIFactory_CreateSwapChainForComposition_InvalidScaling                                                  = 0x000000bd,
    DXGI_MSG_IDXGIFactory_CreateSwapChainForCoreWindow_InvalidSwapEffect                                                = 0x000000be,
    DXGI_MSG_IDXGIResource1_CreateSharedHandle_UnsupportedOS                                                            = 0x000000bf,
    DXGI_MSG_IDXGIFactory2_RegisterOcclusionStatusWindow_UnsupportedOS                                                  = 0x000000c0,
    DXGI_MSG_IDXGIFactory2_RegisterOcclusionStatusEvent_UnsupportedOS                                                   = 0x000000c1,
    DXGI_MSG_IDXGIOutput1_DuplicateOutput_UnsupportedOS                                                                 = 0x000000c2,
    DXGI_MSG_IDXGIDisplayControl_IsStereoEnabled_UnsupportedOS                                                          = 0x000000c3,
    DXGI_MSG_IDXGIFactory_CreateSwapChainForComposition_InvalidAlphaMode                                                = 0x000000c4,
    DXGI_MSG_IDXGIFactory_GetSharedResourceAdapterLuid_InvalidResource                                                  = 0x000000c5,
    DXGI_MSG_IDXGIFactory_GetSharedResourceAdapterLuid_InvalidLUID                                                      = 0x000000c6,
    DXGI_MSG_IDXGIFactory_GetSharedResourceAdapterLuid_UnsupportedOS                                                    = 0x000000c7,
    DXGI_MSG_IDXGIOutput1_GetDisplaySurfaceData1_2DOnly                                                                 = 0x000000c8,
    DXGI_MSG_IDXGIOutput1_GetDisplaySurfaceData1_StagingOnly                                                            = 0x000000c9,
    DXGI_MSG_IDXGIOutput1_GetDisplaySurfaceData1_NeedCPUAccessWrite                                                     = 0x000000ca,
    DXGI_MSG_IDXGIOutput1_GetDisplaySurfaceData1_NoShared                                                               = 0x000000cb,
    DXGI_MSG_IDXGIOutput1_GetDisplaySurfaceData1_OnlyMipLevels1                                                         = 0x000000cc,
    DXGI_MSG_IDXGIOutput1_GetDisplaySurfaceData1_MappedOrOfferedResource                                                = 0x000000cd,
    DXGI_MSG_IDXGISwapChain_SetFullscreenState_FSUnsupportedForModernApps                                               = 0x000000ce,
    DXGI_MSG_IDXGIFactory_CreateSwapChain_FailedToGoFSButNonPreRotated                                                  = 0x000000cf,
    DXGI_MSG_IDXGIFactory_CreateSwapChainOrRegisterOcclusionStatus_BlitModelUsedWhileRegisteredForOcclusionStatusEvents = 0x000000d0,
    DXGI_MSG_IDXGISwapChain_Present_BlitModelUsedWhileRegisteredForOcclusionStatusEvents                                = 0x000000d1,
    DXGI_MSG_IDXGIFactory_CreateSwapChain_WaitableSwapChainsAreFlipModelOnly                                            = 0x000000d2,
    DXGI_MSG_IDXGIFactory_CreateSwapChain_WaitableSwapChainsAreNotFullscreen                                            = 0x000000d3,
    DXGI_MSG_IDXGISwapChain_SetFullscreenState_Waitable                                                                 = 0x000000d4,
    DXGI_MSG_IDXGISwapChain_ResizeBuffers_CannotAddOrRemoveWaitableFlag                                                 = 0x000000d5,
    DXGI_MSG_IDXGISwapChain_GetFrameLatencyWaitableObject_OnlyWaitable                                                  = 0x000000d6,
    DXGI_MSG_IDXGISwapChain_GetMaximumFrameLatency_OnlyWaitable                                                         = 0x000000d7,
    DXGI_MSG_IDXGISwapChain_GetMaximumFrameLatency_pMaxLatencyIsNULL                                                    = 0x000000d8,
    DXGI_MSG_IDXGISwapChain_SetMaximumFrameLatency_OnlyWaitable                                                         = 0x000000d9,
    DXGI_MSG_IDXGISwapChain_SetMaximumFrameLatency_MaxLatencyIsOutOfBounds                                              = 0x000000da,
    DXGI_MSG_IDXGIFactory_CreateSwapChain_ForegroundIsCoreWindowOnly                                                    = 0x000000db,
    DXGI_MSG_IDXGIFactory2_CreateSwapChainForCoreWindow_ForegroundUnsupportedOnAdapter                                  = 0x000000dc,
    DXGI_MSG_IDXGIFactory2_CreateSwapChainForCoreWindow_InvalidScaling                                                  = 0x000000dd,
    DXGI_MSG_IDXGIFactory2_CreateSwapChainForCoreWindow_InvalidAlphaMode                                                = 0x000000de,
    DXGI_MSG_IDXGISwapChain_ResizeBuffers_CannotAddOrRemoveForegroundFlag                                               = 0x000000df,
    DXGI_MSG_IDXGISwapChain_SetMatrixTransform_MatrixPointerCannotBeNull                                                = 0x000000e0,
    DXGI_MSG_IDXGISwapChain_SetMatrixTransform_RequiresCompositionSwapChain                                             = 0x000000e1,
    DXGI_MSG_IDXGISwapChain_SetMatrixTransform_MatrixMustBeFinite                                                       = 0x000000e2,
    DXGI_MSG_IDXGISwapChain_SetMatrixTransform_MatrixMustBeTranslateAndOrScale                                          = 0x000000e3,
    DXGI_MSG_IDXGISwapChain_GetMatrixTransform_MatrixPointerCannotBeNull                                                = 0x000000e4,
    DXGI_MSG_IDXGISwapChain_GetMatrixTransform_RequiresCompositionSwapChain                                             = 0x000000e5,
    DXGI_MSG_DXGIGetDebugInterface1_NULL_ppDebug                                                                        = 0x000000e6,
    DXGI_MSG_DXGIGetDebugInterface1_InvalidFlags                                                                        = 0x000000e7,
    DXGI_MSG_IDXGISwapChain_Present_Decode                                                                              = 0x000000e8,
    DXGI_MSG_IDXGISwapChain_ResizeBuffers_Decode                                                                        = 0x000000e9,
    DXGI_MSG_IDXGISwapChain_SetSourceSize_FlipModel                                                                     = 0x000000ea,
    DXGI_MSG_IDXGISwapChain_SetSourceSize_Decode                                                                        = 0x000000eb,
    DXGI_MSG_IDXGISwapChain_SetSourceSize_WidthHeight                                                                   = 0x000000ec,
    DXGI_MSG_IDXGISwapChain_GetSourceSize_NullPointers                                                                  = 0x000000ed,
    DXGI_MSG_IDXGISwapChain_GetSourceSize_Decode                                                                        = 0x000000ee,
    DXGI_MSG_IDXGIDecodeSwapChain_SetColorSpace_InvalidFlags                                                            = 0x000000ef,
    DXGI_MSG_IDXGIDecodeSwapChain_SetSourceRect_InvalidRect                                                             = 0x000000f0,
    DXGI_MSG_IDXGIDecodeSwapChain_SetTargetRect_InvalidRect                                                             = 0x000000f1,
    DXGI_MSG_IDXGIDecodeSwapChain_SetDestSize_InvalidSize                                                               = 0x000000f2,
    DXGI_MSG_IDXGIDecodeSwapChain_GetSourceRect_InvalidPointer                                                          = 0x000000f3,
    DXGI_MSG_IDXGIDecodeSwapChain_GetTargetRect_InvalidPointer                                                          = 0x000000f4,
    DXGI_MSG_IDXGIDecodeSwapChain_GetDestSize_InvalidPointer                                                            = 0x000000f5,
    DXGI_MSG_IDXGISwapChain_PresentBuffer_YUV                                                                           = 0x000000f6,
    DXGI_MSG_IDXGISwapChain_SetSourceSize_YUV                                                                           = 0x000000f7,
    DXGI_MSG_IDXGISwapChain_GetSourceSize_YUV                                                                           = 0x000000f8,
    DXGI_MSG_IDXGISwapChain_SetMatrixTransform_YUV                                                                      = 0x000000f9,
    DXGI_MSG_IDXGISwapChain_GetMatrixTransform_YUV                                                                      = 0x000000fa,
    DXGI_MSG_IDXGISwapChain_Present_PartialPresentation_YUV                                                             = 0x000000fb,
    DXGI_MSG_IDXGISwapChain_ResizeBuffers_CannotAddOrRemoveFlag_YUV                                                     = 0x000000fc,
    DXGI_MSG_IDXGISwapChain_ResizeBuffers_Alignment_YUV                                                                 = 0x000000fd,
    DXGI_MSG_IDXGIFactory_CreateSwapChain_ShaderInputUnsupported_YUV                                                    = 0x000000fe,
    DXGI_MSG_IDXGIOutput3_CheckOverlaySupport_NullPointers                                                              = 0x000000ff,
    DXGI_MSG_IDXGIOutput3_CheckOverlaySupport_IDXGIDeviceNotSupportedBypConcernedDevice                                 = 0x00000100,
    DXGI_MSG_IDXGIAdapter_EnumOutputs2_InvalidEnumOutputs2Flag                                                          = 0x00000101,
    DXGI_MSG_IDXGISwapChain_CreationOrSetFullscreenState_FSUnsupportedForFlipDiscard                                    = 0x00000102,
    DXGI_MSG_IDXGIOutput4_CheckOverlayColorSpaceSupport_NullPointers                                                    = 0x00000103,
    DXGI_MSG_IDXGIOutput4_CheckOverlayColorSpaceSupport_IDXGIDeviceNotSupportedBypConcernedDevice                       = 0x00000104,
    DXGI_MSG_IDXGISwapChain3_CheckColorSpaceSupport_NullPointers                                                        = 0x00000105,
    DXGI_MSG_IDXGISwapChain3_SetColorSpace1_InvalidColorSpace                                                           = 0x00000106,
    DXGI_MSG_IDXGIFactory_CreateSwapChain_InvalidHwProtect                                                              = 0x00000107,
    DXGI_MSG_IDXGIFactory_CreateSwapChain_HwProtectUnsupported                                                          = 0x00000108,
    DXGI_MSG_IDXGISwapChain_ResizeBuffers_InvalidHwProtect                                                              = 0x00000109,
    DXGI_MSG_IDXGISwapChain_ResizeBuffers_HwProtectUnsupported                                                          = 0x0000010a,
    DXGI_MSG_IDXGISwapChain_ResizeBuffers1_D3D12Only                                                                    = 0x0000010b,
    DXGI_MSG_IDXGISwapChain_ResizeBuffers1_FlipModel                                                                    = 0x0000010c,
    DXGI_MSG_IDXGISwapChain_ResizeBuffers1_NodeMaskAndQueueRequired                                                     = 0x0000010d,
    DXGI_MSG_IDXGISwapChain_CreateSwapChain_InvalidHwProtectGdiFlag                                                     = 0x0000010e,
    DXGI_MSG_IDXGISwapChain_ResizeBuffers_InvalidHwProtectGdiFlag                                                       = 0x0000010f,
    DXGI_MSG_IDXGIFactory_CreateSwapChain_10BitFormatNotSupported                                                       = 0x00000110,
    DXGI_MSG_IDXGIFactory_CreateSwapChain_FlipSwapEffectRequired                                                        = 0x00000111,
    DXGI_MSG_IDXGIFactory_CreateSwapChain_InvalidDevice                                                                 = 0x00000112,
    DXGI_MSG_IDXGIOutput_TakeOwnership_Unsupported                                                                      = 0x00000113,
    DXGI_MSG_IDXGIFactory_CreateSwapChain_InvalidQueue                                                                  = 0x00000114,
    DXGI_MSG_IDXGISwapChain3_ResizeBuffers1_InvalidQueue                                                                = 0x00000115,
    DXGI_MSG_IDXGIFactory_CreateSwapChainForHwnd_InvalidScaling                                                         = 0x00000116,
    DXGI_MSG_IDXGISwapChain3_SetHDRMetaData_InvalidSize                                                                 = 0x00000117,
    DXGI_MSG_IDXGISwapChain3_SetHDRMetaData_InvalidPointer                                                              = 0x00000118,
    DXGI_MSG_IDXGISwapChain3_SetHDRMetaData_InvalidType                                                                 = 0x00000119,
    DXGI_MSG_IDXGISwapChain_Present_FullscreenAllowTearingIsInvalid                                                     = 0x0000011a,
    DXGI_MSG_IDXGISwapChain_Present_AllowTearingRequiresPresentIntervalZero                                             = 0x0000011b,
    DXGI_MSG_IDXGISwapChain_Present_AllowTearingRequiresCreationFlag                                                    = 0x0000011c,
    DXGI_MSG_IDXGISwapChain_ResizeBuffers_CannotAddOrRemoveAllowTearingFlag                                             = 0x0000011d,
    DXGI_MSG_IDXGIFactory_CreateSwapChain_AllowTearingFlagIsFlipModelOnly                                               = 0x0000011e,
    DXGI_MSG_IDXGIFactory_CheckFeatureSupport_InvalidFeature                                                            = 0x0000011f,
    DXGI_MSG_IDXGIFactory_CheckFeatureSupport_InvalidSize                                                               = 0x00000120,
    DXGI_MSG_IDXGIOutput6_CheckHardwareCompositionSupport_NullPointer                                                   = 0x00000121,
    DXGI_MSG_IDXGISwapChain_SetFullscreenState_PerMonitorDpiShimApplied                                                 = 0x00000122,
    DXGI_MSG_IDXGIOutput_DuplicateOutput_PerMonitorDpiShimApplied                                                       = 0x00000123,
    DXGI_MSG_IDXGIOutput_DuplicateOutput1_PerMonitorDpiRequired                                                         = 0x00000124,
    DXGI_MSG_IDXGIFactory7_UnregisterAdaptersChangedEvent_CookieNotFound                                                = 0x00000125,
    DXGI_MSG_IDXGIFactory_CreateSwapChain_LegacyBltModelSwapEffect                                                      = 0x00000126,
    DXGI_MSG_IDXGISwapChain4_SetHDRMetaData_MetadataUnchanged                                                           = 0x00000127,
    DXGI_MSG_IDXGISwapChain_Present_11On12_Released_Resource                                                            = 0x00000128,
    DXGI_MSG_IDXGIFactory_CreateSwapChain_MultipleSwapchainRefToSurface_DeferredDtr                                     = 0x00000129,
    DXGI_MSG_IDXGIFactory_MakeWindowAssociation_NoOpBehavior                                                            = 0x0000012a,
    DXGI_MSG_Phone_IDXGIFactory_CreateSwapChain_NotForegroundWindow                                                     = 0x000003e8,
    DXGI_MSG_Phone_IDXGIFactory_CreateSwapChain_DISCARD_BufferCount                                                     = 0x000003e9,
    DXGI_MSG_Phone_IDXGISwapChain_SetFullscreenState_NotAvailable                                                       = 0x000003ea,
    DXGI_MSG_Phone_IDXGISwapChain_ResizeBuffers_NotAvailable                                                            = 0x000003eb,
    DXGI_MSG_Phone_IDXGISwapChain_ResizeTarget_NotAvailable                                                             = 0x000003ec,
    DXGI_MSG_Phone_IDXGISwapChain_Present_InvalidLayerIndex                                                             = 0x000003ed,
    DXGI_MSG_Phone_IDXGISwapChain_Present_MultipleLayerIndex                                                            = 0x000003ee,
    DXGI_MSG_Phone_IDXGISwapChain_Present_InvalidLayerFlag                                                              = 0x000003ef,
    DXGI_MSG_Phone_IDXGISwapChain_Present_InvalidRotation                                                               = 0x000003f0,
    DXGI_MSG_Phone_IDXGISwapChain_Present_InvalidBlend                                                                  = 0x000003f1,
    DXGI_MSG_Phone_IDXGISwapChain_Present_InvalidResource                                                               = 0x000003f2,
    DXGI_MSG_Phone_IDXGISwapChain_Present_InvalidMultiPlaneOverlayResource                                              = 0x000003f3,
    DXGI_MSG_Phone_IDXGISwapChain_Present_InvalidIndexForPrimary                                                        = 0x000003f4,
    DXGI_MSG_Phone_IDXGISwapChain_Present_InvalidIndexForOverlay                                                        = 0x000003f5,
    DXGI_MSG_Phone_IDXGISwapChain_Present_InvalidSubResourceIndex                                                       = 0x000003f6,
    DXGI_MSG_Phone_IDXGISwapChain_Present_InvalidSourceRect                                                             = 0x000003f7,
    DXGI_MSG_Phone_IDXGISwapChain_Present_InvalidDestinationRect                                                        = 0x000003f8,
    DXGI_MSG_Phone_IDXGISwapChain_Present_MultipleResource                                                              = 0x000003f9,
    DXGI_MSG_Phone_IDXGISwapChain_Present_NotSharedResource                                                             = 0x000003fa,
    DXGI_MSG_Phone_IDXGISwapChain_Present_InvalidFlag                                                                   = 0x000003fb,
    DXGI_MSG_Phone_IDXGISwapChain_Present_InvalidInterval                                                               = 0x000003fc,
    DXGI_MSG_Phone_IDXGIFactory_CreateSwapChain_MSAA_NotSupported                                                       = 0x000003fd,
    DXGI_MSG_Phone_IDXGIFactory_CreateSwapChain_ScalingAspectRatioStretch_Supported_ModernApp                           = 0x000003fe,
    DXGI_MSG_Phone_IDXGISwapChain_GetFrameStatistics_NotAvailable_ModernApp                                             = 0x000003ff,
    DXGI_MSG_Phone_IDXGISwapChain_Present_ReplaceInterval0With1                                                         = 0x00000400,
    DXGI_MSG_Phone_IDXGIFactory_CreateSwapChain_FailedRegisterWithCompositor                                            = 0x00000401,
    DXGI_MSG_Phone_IDXGIFactory_CreateSwapChain_NotForegroundWindow_AtRendering                                         = 0x00000402,
    DXGI_MSG_Phone_IDXGIFactory_CreateSwapChain_FLIP_SEQUENTIAL_BufferCount                                             = 0x00000403,
    DXGI_MSG_Phone_IDXGIFactory_CreateSwapChain_FLIP_Modern_CoreWindow_Only                                             = 0x00000404,
    DXGI_MSG_Phone_IDXGISwapChain_Present1_RequiresOverlays                                                             = 0x00000405,
    DXGI_MSG_Phone_IDXGISwapChain_SetBackgroundColor_FlipSequentialRequired                                             = 0x00000406,
    DXGI_MSG_Phone_IDXGISwapChain_GetBackgroundColor_FlipSequentialRequired                                             = 0x00000407,
}

enum IID_IDXGraphicsAnalysis = GUID(0x9f251514, 0x9d4d, 0x4902, [0x9d, 0x60, 0x18, 0x98, 0x8a, 0xb7, 0xd4, 0xb5]);
interface IDXGraphicsAnalysis : IUnknown
{
    void BeginCapture();
    void EndCapture();
}
