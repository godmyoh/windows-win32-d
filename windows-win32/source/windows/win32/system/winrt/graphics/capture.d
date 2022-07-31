module windows.win32.system.winrt.graphics.capture;

import windows.win32.guid : GUID;
import windows.win32.foundation : HRESULT, HWND;
import windows.win32.graphics.gdi : HMONITOR;
import windows.win32.system.com_ : IUnknown;

version (Windows):
extern (Windows):

enum IID_IGraphicsCaptureItemInterop = GUID(0x3628e81b, 0x3cac, 0x4c60, [0xb7, 0xf4, 0x23, 0xce, 0xe, 0xc, 0x33, 0x56]);
interface IGraphicsCaptureItemInterop : IUnknown
{
    HRESULT CreateForWindow(HWND, const(GUID)*, void**);
    HRESULT CreateForMonitor(HMONITOR, const(GUID)*, void**);
}
