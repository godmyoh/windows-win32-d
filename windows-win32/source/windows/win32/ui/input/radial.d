module windows.win32.ui.input.radial;

import windows.win32.guid : GUID;
import windows.win32.foundation : HRESULT, HWND;
import windows.win32.system.winrt_ : IInspectable;

version (Windows):
extern (Windows):

enum IID_IRadialControllerInterop = GUID(0x1b0535c9, 0x57ad, 0x45c1, [0x9d, 0x79, 0xad, 0x5c, 0x34, 0x36, 0x5, 0x13]);
interface IRadialControllerInterop : IInspectable
{
    HRESULT CreateForWindow(HWND, const(GUID)*, void**);
}
enum IID_IRadialControllerConfigurationInterop = GUID(0x787cdaac, 0x3186, 0x476d, [0x87, 0xe4, 0xb9, 0x37, 0x4a, 0x7b, 0x99, 0x70]);
interface IRadialControllerConfigurationInterop : IInspectable
{
    HRESULT GetForWindow(HWND, const(GUID)*, void**);
}
enum IID_IRadialControllerIndependentInputSourceInterop = GUID(0x3d577eff, 0x4cee, 0x11e6, [0xb5, 0x35, 0x0, 0x1b, 0xdc, 0x6, 0xab, 0x3b]);
interface IRadialControllerIndependentInputSourceInterop : IInspectable
{
    HRESULT CreateForWindow(HWND, const(GUID)*, void**);
}
