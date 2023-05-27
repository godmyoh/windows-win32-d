module windows.win32.graphics.imaging.d2d;

import windows.win32.guid : GUID;
import windows.win32.foundation : HRESULT;
import windows.win32.graphics.direct2d : ID2D1Device, ID2D1Image;
import windows.win32.graphics.imaging : IWICBitmapEncoder, IWICBitmapFrameEncode, IWICImagingFactory, WICImageParameters;
import windows.win32.system.com : IUnknown;

version (Windows):
extern (Windows):

enum IID_IWICImageEncoder = GUID(0x4c75bf8, 0x3ce1, 0x473b, [0xac, 0xc5, 0x3c, 0xc4, 0xf5, 0xe9, 0x49, 0x99]);
interface IWICImageEncoder : IUnknown
{
    HRESULT WriteFrame(ID2D1Image, IWICBitmapFrameEncode, const(WICImageParameters)*);
    HRESULT WriteFrameThumbnail(ID2D1Image, IWICBitmapFrameEncode, const(WICImageParameters)*);
    HRESULT WriteThumbnail(ID2D1Image, IWICBitmapEncoder, const(WICImageParameters)*);
}
enum IID_IWICImagingFactory2 = GUID(0x7b816b45, 0x1996, 0x4476, [0xb1, 0x32, 0xde, 0x9e, 0x24, 0x7c, 0x8a, 0xf0]);
interface IWICImagingFactory2 : IWICImagingFactory
{
    HRESULT CreateImageEncoder(ID2D1Device, IWICImageEncoder*);
}
