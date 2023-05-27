module windows.win32.system.winrt.display;

import windows.win32.guid : GUID;
import windows.win32.foundation : HANDLE, HRESULT;
import windows.win32.security : SECURITY_ATTRIBUTES;
import windows.win32.system.com : IUnknown;
import windows.win32.system.winrt : HSTRING, IInspectable;

version (Windows):
extern (Windows):

enum IID_IDisplayDeviceInterop = GUID(0x64338358, 0x366a, 0x471b, [0xbd, 0x56, 0xdd, 0x8e, 0xf4, 0x8e, 0x43, 0x9b]);
interface IDisplayDeviceInterop : IUnknown
{
    HRESULT CreateSharedHandle(IInspectable, const(SECURITY_ATTRIBUTES)*, uint, HSTRING, HANDLE*);
    HRESULT OpenSharedHandle(HANDLE, GUID, void**);
}
enum IID_IDisplayPathInterop = GUID(0xa6ba4205, 0xe59e, 0x4e71, [0xb2, 0x5b, 0x4e, 0x43, 0x6d, 0x21, 0xee, 0x3d]);
interface IDisplayPathInterop : IUnknown
{
    HRESULT CreateSourcePresentationHandle(HANDLE*);
    HRESULT GetSourceId(uint*);
}
