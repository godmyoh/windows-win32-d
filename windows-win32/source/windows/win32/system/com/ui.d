module windows.win32.system.com.ui;

import windows.win32.guid : GUID;
import windows.win32.foundation : HRESULT;
import windows.win32.graphics.gdi : HBITMAP, HDC;
import windows.win32.system.com : IUnknown;
import windows.win32.system.com.structuredstorage : IStorage;
import windows.win32.ui.windowsandmessaging : HICON;

version (Windows):
extern (Windows):

enum IID_IThumbnailExtractor = GUID(0x969dc708, 0x5c76, 0x11d1, [0x8d, 0x86, 0x0, 0x0, 0xf8, 0x4, 0xb0, 0x57]);
interface IThumbnailExtractor : IUnknown
{
    HRESULT ExtractThumbnail(IStorage, uint, uint, uint*, uint*, HBITMAP*);
    HRESULT OnFileUpdated(IStorage);
}
enum IID_IDummyHICONIncluder = GUID(0x947990de, 0xcc28, 0x11d2, [0xa0, 0xf7, 0x0, 0x80, 0x5f, 0x85, 0x8f, 0xb1]);
interface IDummyHICONIncluder : IUnknown
{
    HRESULT Dummy(HICON, HDC);
}
