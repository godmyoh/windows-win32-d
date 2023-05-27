module windows.win32.system.winrt.media;

import windows.win32.guid : GUID;
import windows.win32.foundation : BOOL, HRESULT;
import windows.win32.media.mediafoundation : IMFDXGIDeviceManager, IMFSample, MFVideoArea;
import windows.win32.system.winrt : IInspectable;

version (Windows):
extern (Windows):

enum IID_IAudioFrameNative = GUID(0x20be1e2e, 0x930f, 0x4746, [0x93, 0x35, 0x3c, 0x33, 0x2f, 0x25, 0x50, 0x93]);
interface IAudioFrameNative : IInspectable
{
    HRESULT GetData(const(GUID)*, void**);
}
enum IID_IVideoFrameNative = GUID(0x26ba702b, 0x314a, 0x4620, [0xaa, 0xf6, 0x7a, 0x51, 0xaa, 0x58, 0xfa, 0x18]);
interface IVideoFrameNative : IInspectable
{
    HRESULT GetData(const(GUID)*, void**);
    HRESULT GetDevice(const(GUID)*, void**);
}
enum IID_IAudioFrameNativeFactory = GUID(0x7bd67cf8, 0xbf7d, 0x43e6, [0xaf, 0x8d, 0xb1, 0x70, 0xee, 0xc, 0x1, 0x10]);
interface IAudioFrameNativeFactory : IInspectable
{
    HRESULT CreateFromMFSample(IMFSample, BOOL, const(GUID)*, void**);
}
enum IID_IVideoFrameNativeFactory = GUID(0x69e3693e, 0x8e1e, 0x4e63, [0xac, 0x4c, 0x7f, 0xdc, 0x21, 0xd9, 0x73, 0x1d]);
interface IVideoFrameNativeFactory : IInspectable
{
    HRESULT CreateFromMFSample(IMFSample, const(GUID)*, uint, uint, BOOL, const(MFVideoArea)*, IMFDXGIDeviceManager, const(GUID)*, void**);
}
enum CLSID_AudioFrameNativeFactory = GUID(0x16a0a3b9, 0x9f65, 0x4102, [0x93, 0x67, 0x2c, 0xda, 0x3a, 0x4f, 0x37, 0x2a]);
enum CLSID_VideoFrameNativeFactory = GUID(0xd194386a, 0x4e3, 0x4814, [0x81, 0x0, 0xb2, 0xb0, 0xae, 0x6d, 0x78, 0xc7]);
