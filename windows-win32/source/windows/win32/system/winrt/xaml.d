module windows.win32.system.winrt.xaml;

import windows.win32.guid : GUID;
import windows.win32.foundation : BOOL, HANDLE, HRESULT, HWND, POINT, RECT;
import windows.win32.graphics.dxgi : IDXGIDevice, IDXGISurface, IDXGISwapChain;
import windows.win32.system.com : IUnknown;
import windows.win32.ui.windowsandmessaging : MSG;

version (Windows):
extern (Windows):

enum E_SURFACE_CONTENTS_LOST = 0x802b0020;
alias TrackerHandle = long;
enum IID_ISurfaceImageSourceNative = GUID(0xf2e9edc1, 0xd307, 0x4525, [0x98, 0x86, 0xf, 0xaf, 0xaa, 0x44, 0x16, 0x3c]);
interface ISurfaceImageSourceNative : IUnknown
{
    HRESULT SetDevice(IDXGIDevice);
    HRESULT BeginDraw(RECT, IDXGISurface*, POINT*);
    HRESULT EndDraw();
}
enum IID_IVirtualSurfaceUpdatesCallbackNative = GUID(0xdbf2e947, 0x8e6c, 0x4254, [0x9e, 0xee, 0x77, 0x38, 0xf7, 0x13, 0x86, 0xc9]);
interface IVirtualSurfaceUpdatesCallbackNative : IUnknown
{
    HRESULT UpdatesNeeded();
}
enum IID_IVirtualSurfaceImageSourceNative = GUID(0xe9550983, 0x360b, 0x4f53, [0xb3, 0x91, 0xaf, 0xd6, 0x95, 0x7, 0x86, 0x91]);
interface IVirtualSurfaceImageSourceNative : ISurfaceImageSourceNative
{
    HRESULT Invalidate(RECT);
    HRESULT GetUpdateRectCount(uint*);
    HRESULT GetUpdateRects(RECT*, uint);
    HRESULT GetVisibleBounds(RECT*);
    HRESULT RegisterForUpdatesNeeded(IVirtualSurfaceUpdatesCallbackNative);
    HRESULT Resize(int, int);
}
enum IID_ISwapChainBackgroundPanelNative = GUID(0x43bebd4e, 0xadd5, 0x4035, [0x8f, 0x85, 0x56, 0x8, 0xd0, 0x8e, 0x9d, 0xc9]);
interface ISwapChainBackgroundPanelNative : IUnknown
{
    HRESULT SetSwapChain(IDXGISwapChain);
}
enum IID_ISurfaceImageSourceManagerNative = GUID(0x4c8798b7, 0x1d88, 0x4a0f, [0xb5, 0x9b, 0xb9, 0x3f, 0x60, 0xd, 0xe8, 0xc8]);
interface ISurfaceImageSourceManagerNative : IUnknown
{
    HRESULT FlushAllSurfacesWithDevice(IUnknown);
}
enum IID_ISurfaceImageSourceNativeWithD2D = GUID(0x54298223, 0x41e1, 0x4a41, [0x9c, 0x8, 0x2, 0xe8, 0x25, 0x68, 0x64, 0xa1]);
interface ISurfaceImageSourceNativeWithD2D : IUnknown
{
    HRESULT SetDevice(IUnknown);
    HRESULT BeginDraw(const(RECT)*, const(GUID)*, void**, POINT*);
    HRESULT EndDraw();
    HRESULT SuspendDraw();
    HRESULT ResumeDraw();
}
enum IID_ISwapChainPanelNative = GUID(0xf92f19d2, 0x3ade, 0x45a6, [0xa2, 0xc, 0xf6, 0xf1, 0xea, 0x90, 0x55, 0x4b]);
interface ISwapChainPanelNative : IUnknown
{
    HRESULT SetSwapChain(IDXGISwapChain);
}
enum IID_ISwapChainPanelNative2 = GUID(0xd5a2f60c, 0x37b2, 0x44a2, [0x93, 0x7b, 0x8d, 0x8e, 0xb9, 0x72, 0x68, 0x21]);
interface ISwapChainPanelNative2 : ISwapChainPanelNative
{
    HRESULT SetSwapChainHandle(HANDLE);
}
enum IID_IDesktopWindowXamlSourceNative = GUID(0x3cbcf1bf, 0x2f76, 0x4e9c, [0x96, 0xab, 0xe8, 0x4b, 0x37, 0x97, 0x25, 0x54]);
interface IDesktopWindowXamlSourceNative : IUnknown
{
    HRESULT AttachToWindow(HWND);
    HRESULT get_WindowHandle(HWND*);
}
enum IID_IDesktopWindowXamlSourceNative2 = GUID(0xe3dcd8c7, 0x3057, 0x4692, [0x99, 0xc3, 0x7b, 0x77, 0x20, 0xaf, 0xda, 0x31]);
interface IDesktopWindowXamlSourceNative2 : IDesktopWindowXamlSourceNative
{
    HRESULT PreTranslateMessage(const(MSG)*, BOOL*);
}
enum IID_IReferenceTrackerTarget = GUID(0x64bd43f8, 0xbfee, 0x4ec4, [0xb7, 0xeb, 0x29, 0x35, 0x15, 0x8d, 0xae, 0x21]);
interface IReferenceTrackerTarget : IUnknown
{
    uint AddRefFromReferenceTracker();
    uint ReleaseFromReferenceTracker();
    HRESULT Peg();
    HRESULT Unpeg();
}
enum IID_IReferenceTracker = GUID(0x11d3b13a, 0x180e, 0x4789, [0xa8, 0xbe, 0x77, 0x12, 0x88, 0x28, 0x93, 0xe6]);
interface IReferenceTracker : IUnknown
{
    HRESULT ConnectFromTrackerSource();
    HRESULT DisconnectFromTrackerSource();
    HRESULT FindTrackerTargets(IFindReferenceTargetsCallback);
    HRESULT GetReferenceTrackerManager(IReferenceTrackerManager*);
    HRESULT AddRefFromTrackerSource();
    HRESULT ReleaseFromTrackerSource();
    HRESULT PegFromTrackerSource();
}
enum IID_IReferenceTrackerManager = GUID(0x3cf184b4, 0x7ccb, 0x4dda, [0x84, 0x55, 0x7e, 0x6c, 0xe9, 0x9a, 0x32, 0x98]);
interface IReferenceTrackerManager : IUnknown
{
    HRESULT ReferenceTrackingStarted();
    HRESULT FindTrackerTargetsCompleted(ubyte);
    HRESULT ReferenceTrackingCompleted();
    HRESULT SetReferenceTrackerHost(IReferenceTrackerHost);
}
enum IID_IFindReferenceTargetsCallback = GUID(0x4b3486c, 0x4687, 0x4229, [0x8d, 0x14, 0x50, 0x5a, 0xb5, 0x84, 0xdd, 0x88]);
interface IFindReferenceTargetsCallback : IUnknown
{
    HRESULT FoundTrackerTarget(IReferenceTrackerTarget);
}
alias XAML_REFERENCETRACKER_DISCONNECT = int;
enum : int
{
    XAML_REFERENCETRACKER_DISCONNECT_DEFAULT = 0x00000000,
    XAML_REFERENCETRACKER_DISCONNECT_SUSPEND = 0x00000001,
}

enum IID_IReferenceTrackerHost = GUID(0x29a71c6a, 0x3c42, 0x4416, [0xa3, 0x9d, 0xe2, 0x82, 0x5a, 0x7, 0xa7, 0x73]);
interface IReferenceTrackerHost : IUnknown
{
    HRESULT DisconnectUnusedReferenceSources(XAML_REFERENCETRACKER_DISCONNECT);
    HRESULT ReleaseDisconnectedReferenceSources();
    HRESULT NotifyEndOfReferenceTrackingOnThread();
    HRESULT GetTrackerTarget(IUnknown, IReferenceTrackerTarget*);
    HRESULT AddMemoryPressure(ulong);
    HRESULT RemoveMemoryPressure(ulong);
}
enum IID_IReferenceTrackerExtension = GUID(0x4e897caa, 0x59d5, 0x4613, [0x8f, 0x8c, 0xf7, 0xeb, 0xd1, 0xf3, 0x99, 0xb0]);
interface IReferenceTrackerExtension : IUnknown
{
}
enum IID_ITrackerOwner = GUID(0xeb24c20b, 0x9816, 0x4ac7, [0x8c, 0xff, 0x36, 0xf6, 0x7a, 0x11, 0x8f, 0x4e]);
interface ITrackerOwner : IUnknown
{
    HRESULT CreateTrackerHandle(TrackerHandle*);
    HRESULT DeleteTrackerHandle(TrackerHandle);
    HRESULT SetTrackerValue(TrackerHandle, IUnknown);
    ubyte TryGetSafeTrackerValue(TrackerHandle, IUnknown*);
}
