module windows.win32.system.winrt.composition;

import windows.win32.guid : GUID;
import windows.win32.foundation : BOOL, HANDLE, HRESULT, HWND, POINT, RECT, SIZE;
import windows.win32.system.com : IUnknown;
import windows.win32.system.winrt : IInspectable;
import windows.win32.ui.input.pointer : POINTER_INFO;

version (Windows):
extern (Windows):

enum IID_ICompositionDrawingSurfaceInterop = GUID(0xfd04e6e3, 0xfe0c, 0x4c3c, [0xab, 0x19, 0xa0, 0x76, 0x1, 0xa5, 0x76, 0xee]);
interface ICompositionDrawingSurfaceInterop : IUnknown
{
    HRESULT BeginDraw(const(RECT)*, const(GUID)*, void**, POINT*);
    HRESULT EndDraw();
    HRESULT Resize(SIZE);
    HRESULT Scroll(const(RECT)*, const(RECT)*, int, int);
    HRESULT ResumeDraw();
    HRESULT SuspendDraw();
}
enum IID_ICompositionDrawingSurfaceInterop2 = GUID(0x41e64aae, 0x98c0, 0x4239, [0x8e, 0x95, 0xa3, 0x30, 0xdd, 0x6a, 0xa1, 0x8b]);
interface ICompositionDrawingSurfaceInterop2 : ICompositionDrawingSurfaceInterop
{
    HRESULT CopySurface(IUnknown, int, int, const(RECT)*);
}
enum IID_ICompositionGraphicsDeviceInterop = GUID(0xa116ff71, 0xf8bf, 0x4c8a, [0x9c, 0x98, 0x70, 0x77, 0x9a, 0x32, 0xa9, 0xc8]);
interface ICompositionGraphicsDeviceInterop : IUnknown
{
    HRESULT GetRenderingDevice(IUnknown*);
    HRESULT SetRenderingDevice(IUnknown);
}
enum IID_ICompositorInterop = GUID(0x25297d5c, 0x3ad4, 0x4c9c, [0xb5, 0xcf, 0xe3, 0x6a, 0x38, 0x51, 0x23, 0x30]);
/+ [UNSUPPORTED] interface ICompositorInterop : IUnknown
{
    HRESULT CreateCompositionSurfaceForHandle(HANDLE, ICompositionSurface*);
    HRESULT CreateCompositionSurfaceForSwapChain(IUnknown, ICompositionSurface*);
    HRESULT CreateGraphicsDevice(IUnknown, CompositionGraphicsDevice*);
}
+/
enum IID_ICompositorInterop2 = GUID(0xd3eef34c, 0x667, 0x4afc, [0x8d, 0x13, 0x86, 0x76, 0x7, 0xb0, 0xfe, 0x91]);
/+ [UNSUPPORTED] interface ICompositorInterop2 : IUnknown
{
    HRESULT CheckCompositionTextureSupport(IUnknown, BOOL*);
    HRESULT CreateCompositionTexture(IUnknown, ICompositionTexture*);
}
+/
enum IID_ICompositionTextureInterop = GUID(0xd528a265, 0xf0a5, 0x422f, [0xa3, 0x9d, 0xef, 0x62, 0xd7, 0xcd, 0x1c, 0xc4]);
interface ICompositionTextureInterop : IUnknown
{
    HRESULT GetAvailableFence(ulong*, const(GUID)*, void**);
}
enum IID_IVisualInteractionSourceInterop = GUID(0x11f62cd1, 0x2f9d, 0x42d3, [0xb0, 0x5f, 0xd6, 0x79, 0xd, 0x9e, 0x9f, 0x8e]);
interface IVisualInteractionSourceInterop : IUnknown
{
    HRESULT TryRedirectForManipulation(const(POINTER_INFO)*);
}
enum IID_ICompositionCapabilitiesInteropFactory = GUID(0x2c9db356, 0xe70d, 0x4642, [0x82, 0x98, 0xbc, 0x4a, 0xa5, 0xb4, 0x86, 0x5c]);
/+ [UNSUPPORTED] interface ICompositionCapabilitiesInteropFactory : IInspectable
{
    HRESULT GetForWindow(HWND, CompositionCapabilities*);
}
+/
enum IID_ICompositorDesktopInterop = GUID(0x29e691fa, 0x4567, 0x4dca, [0xb3, 0x19, 0xd0, 0xf2, 0x7, 0xeb, 0x68, 0x7]);
/+ [UNSUPPORTED] interface ICompositorDesktopInterop : IUnknown
{
    HRESULT CreateDesktopWindowTarget(HWND, BOOL, DesktopWindowTarget*);
    HRESULT EnsureOnThread(uint);
}
+/
enum IID_IDesktopWindowTargetInterop = GUID(0x35dbf59e, 0xe3f9, 0x45b0, [0x81, 0xe7, 0xfe, 0x75, 0xf4, 0x14, 0x5d, 0xc9]);
interface IDesktopWindowTargetInterop : IUnknown
{
    HRESULT get_Hwnd(HWND*);
}
