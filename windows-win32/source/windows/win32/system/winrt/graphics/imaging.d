module windows.win32.system.winrt.graphics.imaging;

import windows.win32.guid : GUID;
import windows.win32.foundation : BOOL, HRESULT;
import windows.win32.graphics.imaging : IWICBitmap;
import windows.win32.media.mediafoundation : IMF2DBuffer2, MFVideoArea;
import windows.win32.system.winrt : IInspectable;

version (Windows):
extern (Windows):

enum IID_ISoftwareBitmapNative = GUID(0x94bc8415, 0x4ea, 0x4b2e, [0xaf, 0x13, 0x4d, 0xe9, 0x5a, 0xa8, 0x98, 0xeb]);
interface ISoftwareBitmapNative : IInspectable
{
    HRESULT GetData(const(GUID)* riid, void** ppv);
}
enum IID_ISoftwareBitmapNativeFactory = GUID(0xc3c181ec, 0x2914, 0x4791, [0xaf, 0x2, 0x2, 0xd2, 0x24, 0xa1, 0xb, 0x43]);
interface ISoftwareBitmapNativeFactory : IInspectable
{
    HRESULT CreateFromWICBitmap(IWICBitmap data, BOOL forceReadOnly, const(GUID)* riid, void** ppv);
    HRESULT CreateFromMF2DBuffer2(IMF2DBuffer2 data, const(GUID)* subtype, uint width, uint height, BOOL forceReadOnly, const(MFVideoArea)* minDisplayAperture, const(GUID)* riid, void** ppv);
}
enum CLSID_SoftwareBitmapNativeFactory = GUID(0x84e65691, 0x8602, 0x4a84, [0xbe, 0x46, 0x70, 0x8b, 0xe9, 0xcd, 0x4b, 0x74]);
