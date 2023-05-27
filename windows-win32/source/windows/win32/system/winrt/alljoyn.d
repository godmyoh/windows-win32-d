module windows.win32.system.winrt.alljoyn;

import windows.win32.guid : GUID;
import windows.win32.foundation : HRESULT;
import windows.win32.system.winrt : HSTRING, IInspectable;

version (Windows):
extern (Windows):

enum IID_IWindowsDevicesAllJoynBusAttachmentInterop = GUID(0xfd89c65b, 0xb50e, 0x4a19, [0x9d, 0xc, 0xb4, 0x2b, 0x78, 0x32, 0x81, 0xcd]);
interface IWindowsDevicesAllJoynBusAttachmentInterop : IInspectable
{
    HRESULT get_Win32Handle(ulong*);
}
enum IID_IWindowsDevicesAllJoynBusAttachmentFactoryInterop = GUID(0x4b8f7505, 0xb239, 0x4e7b, [0x88, 0xaf, 0xf6, 0x68, 0x25, 0x75, 0xd8, 0x61]);
interface IWindowsDevicesAllJoynBusAttachmentFactoryInterop : IInspectable
{
    HRESULT CreateFromWin32Handle(ulong, ubyte, const(GUID)*, void**);
}
enum IID_IWindowsDevicesAllJoynBusObjectInterop = GUID(0xd78aa3d5, 0x5054, 0x428f, [0x99, 0xf2, 0xec, 0x3a, 0x5d, 0xe3, 0xc3, 0xbc]);
interface IWindowsDevicesAllJoynBusObjectInterop : IInspectable
{
    HRESULT AddPropertyGetHandler(void*, HSTRING, long);
    HRESULT AddPropertySetHandler(void*, HSTRING, long);
    HRESULT get_Win32Handle(ulong*);
}
enum IID_IWindowsDevicesAllJoynBusObjectFactoryInterop = GUID(0x6174e506, 0x8b95, 0x4e36, [0x95, 0xc0, 0xb8, 0x8f, 0xed, 0x34, 0x93, 0x8c]);
interface IWindowsDevicesAllJoynBusObjectFactoryInterop : IInspectable
{
    HRESULT CreateFromWin32Handle(ulong, const(GUID)*, void**);
}
