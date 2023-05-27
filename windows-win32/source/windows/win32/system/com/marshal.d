module windows.win32.system.com.marshal;

import windows.win32.guid : GUID;
import windows.win32.foundation : BSTR, HGLOBAL, HRESULT, HWND;
import windows.win32.graphics.gdi : HBITMAP, HDC, HPALETTE;
import windows.win32.system.com : CO_MARSHALING_CONTEXT_ATTRIBUTES, IStream, IUnknown, SAFEARRAY, STGMEDIUM;
import windows.win32.ui.windowsandmessaging : HACCEL, HICON, HMENU;

version (Windows):
extern (Windows):

uint BSTR_UserSize(uint*, uint, BSTR*);
ubyte* BSTR_UserMarshal(uint*, ubyte*, BSTR*);
ubyte* BSTR_UserUnmarshal(uint*, ubyte*, BSTR*);
void BSTR_UserFree(uint*, BSTR*);
uint HWND_UserSize(uint*, uint, HWND*);
ubyte* HWND_UserMarshal(uint*, ubyte*, HWND*);
ubyte* HWND_UserUnmarshal(uint*, ubyte*, HWND*);
void HWND_UserFree(uint*, HWND*);
uint BSTR_UserSize64(uint*, uint, BSTR*);
ubyte* BSTR_UserMarshal64(uint*, ubyte*, BSTR*);
ubyte* BSTR_UserUnmarshal64(uint*, ubyte*, BSTR*);
void BSTR_UserFree64(uint*, BSTR*);
uint HWND_UserSize64(uint*, uint, HWND*);
ubyte* HWND_UserMarshal64(uint*, ubyte*, HWND*);
ubyte* HWND_UserUnmarshal64(uint*, ubyte*, HWND*);
void HWND_UserFree64(uint*, HWND*);
uint CLIPFORMAT_UserSize(uint*, uint, ushort*);
ubyte* CLIPFORMAT_UserMarshal(uint*, ubyte*, ushort*);
ubyte* CLIPFORMAT_UserUnmarshal(uint*, ubyte*, ushort*);
void CLIPFORMAT_UserFree(uint*, ushort*);
uint HBITMAP_UserSize(uint*, uint, HBITMAP*);
ubyte* HBITMAP_UserMarshal(uint*, ubyte*, HBITMAP*);
ubyte* HBITMAP_UserUnmarshal(uint*, ubyte*, HBITMAP*);
void HBITMAP_UserFree(uint*, HBITMAP*);
uint HDC_UserSize(uint*, uint, HDC*);
ubyte* HDC_UserMarshal(uint*, ubyte*, HDC*);
ubyte* HDC_UserUnmarshal(uint*, ubyte*, HDC*);
void HDC_UserFree(uint*, HDC*);
uint HICON_UserSize(uint*, uint, HICON*);
ubyte* HICON_UserMarshal(uint*, ubyte*, HICON*);
ubyte* HICON_UserUnmarshal(uint*, ubyte*, HICON*);
void HICON_UserFree(uint*, HICON*);
uint SNB_UserSize(uint*, uint, ushort***);
ubyte* SNB_UserMarshal(uint*, ubyte*, ushort***);
ubyte* SNB_UserUnmarshal(uint*, ubyte*, ushort***);
void SNB_UserFree(uint*, ushort***);
uint STGMEDIUM_UserSize(uint*, uint, STGMEDIUM*);
ubyte* STGMEDIUM_UserMarshal(uint*, ubyte*, STGMEDIUM*);
ubyte* STGMEDIUM_UserUnmarshal(uint*, ubyte*, STGMEDIUM*);
void STGMEDIUM_UserFree(uint*, STGMEDIUM*);
uint CLIPFORMAT_UserSize64(uint*, uint, ushort*);
ubyte* CLIPFORMAT_UserMarshal64(uint*, ubyte*, ushort*);
ubyte* CLIPFORMAT_UserUnmarshal64(uint*, ubyte*, ushort*);
void CLIPFORMAT_UserFree64(uint*, ushort*);
uint HBITMAP_UserSize64(uint*, uint, HBITMAP*);
ubyte* HBITMAP_UserMarshal64(uint*, ubyte*, HBITMAP*);
ubyte* HBITMAP_UserUnmarshal64(uint*, ubyte*, HBITMAP*);
void HBITMAP_UserFree64(uint*, HBITMAP*);
uint HDC_UserSize64(uint*, uint, HDC*);
ubyte* HDC_UserMarshal64(uint*, ubyte*, HDC*);
ubyte* HDC_UserUnmarshal64(uint*, ubyte*, HDC*);
void HDC_UserFree64(uint*, HDC*);
uint HICON_UserSize64(uint*, uint, HICON*);
ubyte* HICON_UserMarshal64(uint*, ubyte*, HICON*);
ubyte* HICON_UserUnmarshal64(uint*, ubyte*, HICON*);
void HICON_UserFree64(uint*, HICON*);
uint SNB_UserSize64(uint*, uint, ushort***);
ubyte* SNB_UserMarshal64(uint*, ubyte*, ushort***);
ubyte* SNB_UserUnmarshal64(uint*, ubyte*, ushort***);
void SNB_UserFree64(uint*, ushort***);
uint STGMEDIUM_UserSize64(uint*, uint, STGMEDIUM*);
ubyte* STGMEDIUM_UserMarshal64(uint*, ubyte*, STGMEDIUM*);
ubyte* STGMEDIUM_UserUnmarshal64(uint*, ubyte*, STGMEDIUM*);
void STGMEDIUM_UserFree64(uint*, STGMEDIUM*);
HRESULT CoGetMarshalSizeMax(uint*, const(GUID)*, IUnknown, uint, void*, uint);
HRESULT CoMarshalInterface(IStream, const(GUID)*, IUnknown, uint, void*, uint);
HRESULT CoUnmarshalInterface(IStream, const(GUID)*, void**);
HRESULT CoMarshalHresult(IStream, HRESULT);
HRESULT CoUnmarshalHresult(IStream, HRESULT*);
HRESULT CoReleaseMarshalData(IStream);
HRESULT CoGetStandardMarshal(const(GUID)*, IUnknown, uint, void*, uint, IMarshal*);
HRESULT CoGetStdMarshalEx(IUnknown, uint, IUnknown*);
HRESULT CoMarshalInterThreadInterfaceInStream(const(GUID)*, IUnknown, IStream*);
uint LPSAFEARRAY_UserSize(uint*, uint, SAFEARRAY**);
ubyte* LPSAFEARRAY_UserMarshal(uint*, ubyte*, SAFEARRAY**);
ubyte* LPSAFEARRAY_UserUnmarshal(uint*, ubyte*, SAFEARRAY**);
void LPSAFEARRAY_UserFree(uint*, SAFEARRAY**);
uint LPSAFEARRAY_UserSize64(uint*, uint, SAFEARRAY**);
ubyte* LPSAFEARRAY_UserMarshal64(uint*, ubyte*, SAFEARRAY**);
ubyte* LPSAFEARRAY_UserUnmarshal64(uint*, ubyte*, SAFEARRAY**);
void LPSAFEARRAY_UserFree64(uint*, SAFEARRAY**);
uint HACCEL_UserSize(uint*, uint, HACCEL*);
ubyte* HACCEL_UserMarshal(uint*, ubyte*, HACCEL*);
ubyte* HACCEL_UserUnmarshal(uint*, ubyte*, HACCEL*);
void HACCEL_UserFree(uint*, HACCEL*);
uint HGLOBAL_UserSize(uint*, uint, HGLOBAL*);
ubyte* HGLOBAL_UserMarshal(uint*, ubyte*, HGLOBAL*);
ubyte* HGLOBAL_UserUnmarshal(uint*, ubyte*, HGLOBAL*);
void HGLOBAL_UserFree(uint*, HGLOBAL*);
uint HMENU_UserSize(uint*, uint, HMENU*);
ubyte* HMENU_UserMarshal(uint*, ubyte*, HMENU*);
ubyte* HMENU_UserUnmarshal(uint*, ubyte*, HMENU*);
void HMENU_UserFree(uint*, HMENU*);
uint HACCEL_UserSize64(uint*, uint, HACCEL*);
ubyte* HACCEL_UserMarshal64(uint*, ubyte*, HACCEL*);
ubyte* HACCEL_UserUnmarshal64(uint*, ubyte*, HACCEL*);
void HACCEL_UserFree64(uint*, HACCEL*);
uint HGLOBAL_UserSize64(uint*, uint, HGLOBAL*);
ubyte* HGLOBAL_UserMarshal64(uint*, ubyte*, HGLOBAL*);
ubyte* HGLOBAL_UserUnmarshal64(uint*, ubyte*, HGLOBAL*);
void HGLOBAL_UserFree64(uint*, HGLOBAL*);
uint HMENU_UserSize64(uint*, uint, HMENU*);
ubyte* HMENU_UserMarshal64(uint*, ubyte*, HMENU*);
ubyte* HMENU_UserUnmarshal64(uint*, ubyte*, HMENU*);
void HMENU_UserFree64(uint*, HMENU*);
uint HPALETTE_UserSize(uint*, uint, HPALETTE*);
ubyte* HPALETTE_UserMarshal(uint*, ubyte*, HPALETTE*);
ubyte* HPALETTE_UserUnmarshal(uint*, ubyte*, HPALETTE*);
void HPALETTE_UserFree(uint*, HPALETTE*);
uint HPALETTE_UserSize64(uint*, uint, HPALETTE*);
ubyte* HPALETTE_UserMarshal64(uint*, ubyte*, HPALETTE*);
ubyte* HPALETTE_UserUnmarshal64(uint*, ubyte*, HPALETTE*);
void HPALETTE_UserFree64(uint*, HPALETTE*);
enum IID_IMarshal = GUID(0x3, 0x0, 0x0, [0xc0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x46]);
interface IMarshal : IUnknown
{
    HRESULT GetUnmarshalClass(const(GUID)*, void*, uint, void*, uint, GUID*);
    HRESULT GetMarshalSizeMax(const(GUID)*, void*, uint, void*, uint, uint*);
    HRESULT MarshalInterface(IStream, const(GUID)*, void*, uint, void*, uint);
    HRESULT UnmarshalInterface(IStream, const(GUID)*, void**);
    HRESULT ReleaseMarshalData(IStream);
    HRESULT DisconnectObject(uint);
}
enum IID_IMarshal2 = GUID(0x1cf, 0x0, 0x0, [0xc0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x46]);
interface IMarshal2 : IMarshal
{
}
enum IID_IMarshalingStream = GUID(0xd8f2f5e6, 0x6102, 0x4863, [0x9f, 0x26, 0x38, 0x9a, 0x46, 0x76, 0xef, 0xde]);
interface IMarshalingStream : IStream
{
    HRESULT GetMarshalingContextAttribute(CO_MARSHALING_CONTEXT_ATTRIBUTES, ulong*);
}
alias STDMSHLFLAGS = int;
enum : int
{
    SMEXF_SERVER  = 0x00000001,
    SMEXF_HANDLER = 0x00000002,
}

