module windows.win32.devices.deviceaccess;

import windows.win32.guid : GUID;
import windows.win32.foundation : HRESULT, PWSTR;
import windows.win32.system.com_ : IUnknown;

version (Windows):
extern (Windows):

HRESULT CreateDeviceAccessInstance(const(wchar)*, uint, ICreateDeviceAccessAsync*);
enum ED_BASE = 0x00001000;
enum DEV_PORT_SIM = 0x00000001;
enum DEV_PORT_COM1 = 0x00000002;
enum DEV_PORT_COM2 = 0x00000003;
enum DEV_PORT_COM3 = 0x00000004;
enum DEV_PORT_COM4 = 0x00000005;
enum DEV_PORT_DIAQ = 0x00000006;
enum DEV_PORT_ARTI = 0x00000007;
enum DEV_PORT_1394 = 0x00000008;
enum DEV_PORT_USB = 0x00000009;
enum DEV_PORT_MIN = 0x00000001;
enum DEV_PORT_MAX = 0x00000009;
enum ED_TOP = 0x00000001;
enum ED_MIDDLE = 0x00000002;
enum ED_BOTTOM = 0x00000004;
enum ED_LEFT = 0x00000100;
enum ED_CENTER = 0x00000200;
enum ED_RIGHT = 0x00000400;
enum ED_AUDIO_ALL = 0x10000000;
enum ED_AUDIO_1 = 0x00000001;
enum ED_AUDIO_2 = 0x00000002;
enum ED_AUDIO_3 = 0x00000004;
enum ED_AUDIO_4 = 0x00000008;
enum ED_AUDIO_5 = 0x00000010;
enum ED_AUDIO_6 = 0x00000020;
enum ED_AUDIO_7 = 0x00000040;
enum ED_AUDIO_8 = 0x00000080;
enum ED_AUDIO_9 = 0x00000100;
enum ED_AUDIO_10 = 0x00000200;
enum ED_AUDIO_11 = 0x00000400;
enum ED_AUDIO_12 = 0x00000800;
enum ED_AUDIO_13 = 0x00001000;
enum ED_AUDIO_14 = 0x00002000;
enum ED_AUDIO_15 = 0x00004000;
enum ED_AUDIO_16 = 0x00008000;
enum ED_AUDIO_17 = 0x00010000;
enum ED_AUDIO_18 = 0x00020000;
enum ED_AUDIO_19 = 0x00040000;
enum ED_AUDIO_20 = 0x00080000;
enum ED_AUDIO_21 = 0x00100000;
enum ED_AUDIO_22 = 0x00200000;
enum ED_AUDIO_23 = 0x00400000;
enum ED_AUDIO_24 = 0x00800000;
enum ED_VIDEO = 0x02000000;
enum CLSID_DeviceIoControl = GUID(0x12d3e372, 0x874b, 0x457d, [0x9f, 0xdf, 0x73, 0x97, 0x77, 0x78, 0x68, 0x6c]);
enum IID_IDeviceRequestCompletionCallback = GUID(0x999bad24, 0x9acd, 0x45bb, [0x86, 0x69, 0x2a, 0x2f, 0xc0, 0x28, 0x8b, 0x4]);
interface IDeviceRequestCompletionCallback : IUnknown
{
    HRESULT Invoke(HRESULT, uint);
}
enum IID_IDeviceIoControl = GUID(0x9eefe161, 0x23ab, 0x4f18, [0x9b, 0x49, 0x99, 0x1b, 0x58, 0x6a, 0xe9, 0x70]);
interface IDeviceIoControl : IUnknown
{
    HRESULT DeviceIoControlSync(uint, ubyte*, uint, ubyte*, uint, uint*);
    HRESULT DeviceIoControlAsync(uint, ubyte*, uint, ubyte*, uint, IDeviceRequestCompletionCallback, ulong*);
    HRESULT CancelOperation(ulong);
}
enum IID_ICreateDeviceAccessAsync = GUID(0x3474628f, 0x683d, 0x42d2, [0xab, 0xcb, 0xdb, 0x1, 0x8c, 0x65, 0x3, 0xbc]);
interface ICreateDeviceAccessAsync : IUnknown
{
    HRESULT Cancel();
    HRESULT Wait(uint);
    HRESULT Close();
    HRESULT GetResult(const(GUID)*, void**);
}
