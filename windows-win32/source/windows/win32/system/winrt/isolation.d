module windows.win32.system.winrt.isolation;

import windows.win32.guid : GUID;
import windows.win32.foundation : HRESULT, HWND;
import windows.win32.system.com : IUnknown;

version (Windows):
extern (Windows):

enum IID_IIsolatedEnvironmentInterop = GUID(0x85713c2e, 0x8e62, 0x46c5, [0x8d, 0xe2, 0xc6, 0x47, 0xe1, 0xd5, 0x46, 0x36]);
interface IIsolatedEnvironmentInterop : IUnknown
{
    HRESULT GetHostHwndInterop(HWND, HWND*);
}
