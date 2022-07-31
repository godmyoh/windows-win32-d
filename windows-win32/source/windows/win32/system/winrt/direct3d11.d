module windows.win32.system.winrt.direct3d11;

import windows.win32.guid : GUID;
import windows.win32.foundation : HRESULT;
import windows.win32.graphics.dxgi_ : IDXGIDevice, IDXGISurface;
import windows.win32.system.com_ : IUnknown;
import windows.win32.system.winrt_ : IInspectable;

version (Windows):
extern (Windows):

enum IID_IDirect3DDxgiInterfaceAccess = GUID(0xa9b3d012, 0x3df2, 0x4ee3, [0xb8, 0xd1, 0x86, 0x95, 0xf4, 0x57, 0xd3, 0xc1]);
interface IDirect3DDxgiInterfaceAccess : IUnknown
{
    HRESULT GetInterface(const(GUID)*, void**);
}
HRESULT CreateDirect3D11DeviceFromDXGIDevice(IDXGIDevice, IInspectable*);
HRESULT CreateDirect3D11SurfaceFromDXGISurface(IDXGISurface, IInspectable*);
