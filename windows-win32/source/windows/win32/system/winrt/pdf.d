module windows.win32.system.winrt.pdf;

import windows.win32.guid : GUID;
import windows.win32.foundation : BOOLEAN, HRESULT, POINT;
import windows.win32.graphics.direct2d : ID2D1DeviceContext;
import windows.win32.graphics.direct2d.common : D2D_COLOR_F, D2D_RECT_F;
import windows.win32.graphics.dxgi : IDXGIDevice, IDXGISurface;
import windows.win32.system.com : IUnknown;

version (Windows):
extern (Windows):

alias PFN_PDF_CREATE_RENDERER = HRESULT function(IDXGIDevice, IPdfRendererNative*);
struct PDF_RENDER_PARAMS
{
    D2D_RECT_F SourceRect;
    uint DestinationWidth;
    uint DestinationHeight;
    D2D_COLOR_F BackgroundColor;
    BOOLEAN IgnoreHighContrast;
}
enum IID_IPdfRendererNative = GUID(0x7d9dcd91, 0xd277, 0x4947, [0x85, 0x27, 0x7, 0xa0, 0xda, 0xed, 0xa9, 0x4a]);
interface IPdfRendererNative : IUnknown
{
    HRESULT RenderPageToSurface(IUnknown, IDXGISurface, POINT, PDF_RENDER_PARAMS*);
    HRESULT RenderPageToDeviceContext(IUnknown, ID2D1DeviceContext, PDF_RENDER_PARAMS*);
}
HRESULT PdfCreateRenderer(IDXGIDevice, IPdfRendererNative*);
