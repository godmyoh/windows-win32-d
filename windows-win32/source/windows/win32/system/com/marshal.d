module windows.win32.system.com.marshal;

import windows.win32.guid : GUID;
import windows.win32.foundation : BSTR, HGLOBAL, HRESULT, HWND;
import windows.win32.graphics.gdi : HBITMAP, HDC, HPALETTE;
import windows.win32.system.com : CO_MARSHALING_CONTEXT_ATTRIBUTES, IStream, IUnknown, SAFEARRAY, STGMEDIUM;
import windows.win32.ui.windowsandmessaging : HACCEL, HICON, HMENU;

version (Windows):
extern (Windows):

uint BSTR_UserSize(uint* param0, uint param1, BSTR* param2);
ubyte* BSTR_UserMarshal(uint* param0, ubyte* param1, BSTR* param2);
ubyte* BSTR_UserUnmarshal(uint* param0, ubyte* param1, BSTR* param2);
void BSTR_UserFree(uint* param0, BSTR* param1);
uint HWND_UserSize(uint* param0, uint param1, HWND* param2);
ubyte* HWND_UserMarshal(uint* param0, ubyte* param1, HWND* param2);
ubyte* HWND_UserUnmarshal(uint* param0, ubyte* param1, HWND* param2);
void HWND_UserFree(uint* param0, HWND* param1);
uint BSTR_UserSize64(uint* param0, uint param1, BSTR* param2);
ubyte* BSTR_UserMarshal64(uint* param0, ubyte* param1, BSTR* param2);
ubyte* BSTR_UserUnmarshal64(uint* param0, ubyte* param1, BSTR* param2);
void BSTR_UserFree64(uint* param0, BSTR* param1);
uint HWND_UserSize64(uint* param0, uint param1, HWND* param2);
ubyte* HWND_UserMarshal64(uint* param0, ubyte* param1, HWND* param2);
ubyte* HWND_UserUnmarshal64(uint* param0, ubyte* param1, HWND* param2);
void HWND_UserFree64(uint* param0, HWND* param1);
uint CLIPFORMAT_UserSize(uint* param0, uint param1, ushort* param2);
ubyte* CLIPFORMAT_UserMarshal(uint* param0, ubyte* param1, ushort* param2);
ubyte* CLIPFORMAT_UserUnmarshal(uint* param0, ubyte* param1, ushort* param2);
void CLIPFORMAT_UserFree(uint* param0, ushort* param1);
uint HBITMAP_UserSize(uint* param0, uint param1, HBITMAP* param2);
ubyte* HBITMAP_UserMarshal(uint* param0, ubyte* param1, HBITMAP* param2);
ubyte* HBITMAP_UserUnmarshal(uint* param0, ubyte* param1, HBITMAP* param2);
void HBITMAP_UserFree(uint* param0, HBITMAP* param1);
uint HDC_UserSize(uint* param0, uint param1, HDC* param2);
ubyte* HDC_UserMarshal(uint* param0, ubyte* param1, HDC* param2);
ubyte* HDC_UserUnmarshal(uint* param0, ubyte* param1, HDC* param2);
void HDC_UserFree(uint* param0, HDC* param1);
uint HICON_UserSize(uint* param0, uint param1, HICON* param2);
ubyte* HICON_UserMarshal(uint* param0, ubyte* param1, HICON* param2);
ubyte* HICON_UserUnmarshal(uint* param0, ubyte* param1, HICON* param2);
void HICON_UserFree(uint* param0, HICON* param1);
uint SNB_UserSize(uint* param0, uint param1, ushort*** param2);
ubyte* SNB_UserMarshal(uint* param0, ubyte* param1, ushort*** param2);
ubyte* SNB_UserUnmarshal(uint* param0, ubyte* param1, ushort*** param2);
void SNB_UserFree(uint* param0, ushort*** param1);
uint STGMEDIUM_UserSize(uint* param0, uint param1, STGMEDIUM* param2);
ubyte* STGMEDIUM_UserMarshal(uint* param0, ubyte* param1, STGMEDIUM* param2);
ubyte* STGMEDIUM_UserUnmarshal(uint* param0, ubyte* param1, STGMEDIUM* param2);
void STGMEDIUM_UserFree(uint* param0, STGMEDIUM* param1);
uint CLIPFORMAT_UserSize64(uint* param0, uint param1, ushort* param2);
ubyte* CLIPFORMAT_UserMarshal64(uint* param0, ubyte* param1, ushort* param2);
ubyte* CLIPFORMAT_UserUnmarshal64(uint* param0, ubyte* param1, ushort* param2);
void CLIPFORMAT_UserFree64(uint* param0, ushort* param1);
uint HBITMAP_UserSize64(uint* param0, uint param1, HBITMAP* param2);
ubyte* HBITMAP_UserMarshal64(uint* param0, ubyte* param1, HBITMAP* param2);
ubyte* HBITMAP_UserUnmarshal64(uint* param0, ubyte* param1, HBITMAP* param2);
void HBITMAP_UserFree64(uint* param0, HBITMAP* param1);
uint HDC_UserSize64(uint* param0, uint param1, HDC* param2);
ubyte* HDC_UserMarshal64(uint* param0, ubyte* param1, HDC* param2);
ubyte* HDC_UserUnmarshal64(uint* param0, ubyte* param1, HDC* param2);
void HDC_UserFree64(uint* param0, HDC* param1);
uint HICON_UserSize64(uint* param0, uint param1, HICON* param2);
ubyte* HICON_UserMarshal64(uint* param0, ubyte* param1, HICON* param2);
ubyte* HICON_UserUnmarshal64(uint* param0, ubyte* param1, HICON* param2);
void HICON_UserFree64(uint* param0, HICON* param1);
uint SNB_UserSize64(uint* param0, uint param1, ushort*** param2);
ubyte* SNB_UserMarshal64(uint* param0, ubyte* param1, ushort*** param2);
ubyte* SNB_UserUnmarshal64(uint* param0, ubyte* param1, ushort*** param2);
void SNB_UserFree64(uint* param0, ushort*** param1);
uint STGMEDIUM_UserSize64(uint* param0, uint param1, STGMEDIUM* param2);
ubyte* STGMEDIUM_UserMarshal64(uint* param0, ubyte* param1, STGMEDIUM* param2);
ubyte* STGMEDIUM_UserUnmarshal64(uint* param0, ubyte* param1, STGMEDIUM* param2);
void STGMEDIUM_UserFree64(uint* param0, STGMEDIUM* param1);
HRESULT CoGetMarshalSizeMax(uint* pulSize, const(GUID)* riid, IUnknown pUnk, uint dwDestContext, void* pvDestContext, uint mshlflags);
HRESULT CoMarshalInterface(IStream pStm, const(GUID)* riid, IUnknown pUnk, uint dwDestContext, void* pvDestContext, uint mshlflags);
HRESULT CoUnmarshalInterface(IStream pStm, const(GUID)* riid, void** ppv);
HRESULT CoMarshalHresult(IStream pstm, HRESULT hresult);
HRESULT CoUnmarshalHresult(IStream pstm, HRESULT* phresult);
HRESULT CoReleaseMarshalData(IStream pStm);
HRESULT CoGetStandardMarshal(const(GUID)* riid, IUnknown pUnk, uint dwDestContext, void* pvDestContext, uint mshlflags, IMarshal* ppMarshal);
HRESULT CoGetStdMarshalEx(IUnknown pUnkOuter, uint smexflags, IUnknown* ppUnkInner);
HRESULT CoMarshalInterThreadInterfaceInStream(const(GUID)* riid, IUnknown pUnk, IStream* ppStm);
uint LPSAFEARRAY_UserSize(uint* param0, uint param1, SAFEARRAY** param2);
ubyte* LPSAFEARRAY_UserMarshal(uint* param0, ubyte* param1, SAFEARRAY** param2);
ubyte* LPSAFEARRAY_UserUnmarshal(uint* param0, ubyte* param1, SAFEARRAY** param2);
void LPSAFEARRAY_UserFree(uint* param0, SAFEARRAY** param1);
uint LPSAFEARRAY_UserSize64(uint* param0, uint param1, SAFEARRAY** param2);
ubyte* LPSAFEARRAY_UserMarshal64(uint* param0, ubyte* param1, SAFEARRAY** param2);
ubyte* LPSAFEARRAY_UserUnmarshal64(uint* param0, ubyte* param1, SAFEARRAY** param2);
void LPSAFEARRAY_UserFree64(uint* param0, SAFEARRAY** param1);
uint HACCEL_UserSize(uint* param0, uint param1, HACCEL* param2);
ubyte* HACCEL_UserMarshal(uint* param0, ubyte* param1, HACCEL* param2);
ubyte* HACCEL_UserUnmarshal(uint* param0, ubyte* param1, HACCEL* param2);
void HACCEL_UserFree(uint* param0, HACCEL* param1);
uint HGLOBAL_UserSize(uint* param0, uint param1, HGLOBAL* param2);
ubyte* HGLOBAL_UserMarshal(uint* param0, ubyte* param1, HGLOBAL* param2);
ubyte* HGLOBAL_UserUnmarshal(uint* param0, ubyte* param1, HGLOBAL* param2);
void HGLOBAL_UserFree(uint* param0, HGLOBAL* param1);
uint HMENU_UserSize(uint* param0, uint param1, HMENU* param2);
ubyte* HMENU_UserMarshal(uint* param0, ubyte* param1, HMENU* param2);
ubyte* HMENU_UserUnmarshal(uint* param0, ubyte* param1, HMENU* param2);
void HMENU_UserFree(uint* param0, HMENU* param1);
uint HACCEL_UserSize64(uint* param0, uint param1, HACCEL* param2);
ubyte* HACCEL_UserMarshal64(uint* param0, ubyte* param1, HACCEL* param2);
ubyte* HACCEL_UserUnmarshal64(uint* param0, ubyte* param1, HACCEL* param2);
void HACCEL_UserFree64(uint* param0, HACCEL* param1);
uint HGLOBAL_UserSize64(uint* param0, uint param1, HGLOBAL* param2);
ubyte* HGLOBAL_UserMarshal64(uint* param0, ubyte* param1, HGLOBAL* param2);
ubyte* HGLOBAL_UserUnmarshal64(uint* param0, ubyte* param1, HGLOBAL* param2);
void HGLOBAL_UserFree64(uint* param0, HGLOBAL* param1);
uint HMENU_UserSize64(uint* param0, uint param1, HMENU* param2);
ubyte* HMENU_UserMarshal64(uint* param0, ubyte* param1, HMENU* param2);
ubyte* HMENU_UserUnmarshal64(uint* param0, ubyte* param1, HMENU* param2);
void HMENU_UserFree64(uint* param0, HMENU* param1);
uint HPALETTE_UserSize(uint* param0, uint param1, HPALETTE* param2);
ubyte* HPALETTE_UserMarshal(uint* param0, ubyte* param1, HPALETTE* param2);
ubyte* HPALETTE_UserUnmarshal(uint* param0, ubyte* param1, HPALETTE* param2);
void HPALETTE_UserFree(uint* param0, HPALETTE* param1);
uint HPALETTE_UserSize64(uint* param0, uint param1, HPALETTE* param2);
ubyte* HPALETTE_UserMarshal64(uint* param0, ubyte* param1, HPALETTE* param2);
ubyte* HPALETTE_UserUnmarshal64(uint* param0, ubyte* param1, HPALETTE* param2);
void HPALETTE_UserFree64(uint* param0, HPALETTE* param1);
enum IID_IMarshal = GUID(0x3, 0x0, 0x0, [0xc0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x46]);
interface IMarshal : IUnknown
{
    HRESULT GetUnmarshalClass(const(GUID)* riid, void* pv, uint dwDestContext, void* pvDestContext, uint mshlflags, GUID* pCid);
    HRESULT GetMarshalSizeMax(const(GUID)* riid, void* pv, uint dwDestContext, void* pvDestContext, uint mshlflags, uint* pSize);
    HRESULT MarshalInterface(IStream pStm, const(GUID)* riid, void* pv, uint dwDestContext, void* pvDestContext, uint mshlflags);
    HRESULT UnmarshalInterface(IStream pStm, const(GUID)* riid, void** ppv);
    HRESULT ReleaseMarshalData(IStream pStm);
    HRESULT DisconnectObject(uint dwReserved);
}
enum IID_IMarshal2 = GUID(0x1cf, 0x0, 0x0, [0xc0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x46]);
interface IMarshal2 : IMarshal
{
}
enum IID_IMarshalingStream = GUID(0xd8f2f5e6, 0x6102, 0x4863, [0x9f, 0x26, 0x38, 0x9a, 0x46, 0x76, 0xef, 0xde]);
interface IMarshalingStream : IStream
{
    HRESULT GetMarshalingContextAttribute(CO_MARSHALING_CONTEXT_ATTRIBUTES attribute, ulong* pAttributeValue);
}
alias STDMSHLFLAGS = int;
enum : int
{
    SMEXF_SERVER  = 0x00000001,
    SMEXF_HANDLER = 0x00000002,
}

