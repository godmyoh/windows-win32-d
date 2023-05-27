module windows.win32.system.ole;

import windows.win32.guid : GUID;
import windows.win32.foundation : BOOL, BSTR, CHAR, COLORREF, DECIMAL, FILETIME, HANDLE, HGLOBAL, HINSTANCE, HRESULT, HRSRC, HWND, LPARAM, LRESULT, POINT, POINTL, PSTR, PWSTR, RECT, RECTL, SIZE, SYSTEMTIME, VARIANT_BOOL, WPARAM;
import windows.win32.graphics.gdi : HBITMAP, HDC, HENHMETAFILE, HFONT, HMETAFILE, HPALETTE, HRGN, LOGPALETTE, TEXTMETRICW;
import windows.win32.media : HTASK;
import windows.win32.system.com : BYTE_SIZEDARR, CALLCONV, CUSTDATA, CY, DISPPARAMS, DVASPECT, DVTARGETDEVICE, DWORD_SIZEDARR, EXCEPINFO, FLAGGED_WORD_BLOB, FORMATETC, FUNCDESC, HYPER_SIZEDARR, IAdviseSink, IBindCtx, IBindHost, IClassFactory, IDLDESC, IDataObject, IDispatch, IEnumFORMATETC, IEnumSTATDATA, IEnumUnknown, IErrorLog, IMPLTYPEFLAGS, IMoniker, INVOKEKIND, IPersist, IPersistStream, IServiceProvider, IStream, ITypeInfo, ITypeLib, IUnknown, SAFEARRAY, SAFEARRAYBOUND, STGMEDIUM, SYSKIND, TYPEDESC, TYPEKIND, VARDESC, WORD_SIZEDARR;
import windows.win32.system.com.structuredstorage : IPersistStorage, IPropertyBag, IPropertyBag2, IStorage;
import windows.win32.system.memory : GLOBAL_ALLOC_FLAGS;
import windows.win32.system.systemservices : MODIFIERKEYS_FLAGS;
import windows.win32.system.variant : VARENUM, VARIANT;
import windows.win32.ui.controls : PROPSHEETHEADERA_V2, PROPSHEETHEADERW_V2;
import windows.win32.ui.controls.dialogs : OPENFILENAMEA, OPENFILENAMEW;
import windows.win32.ui.windowsandmessaging : HACCEL, HCURSOR, HICON, HMENU, MENU_ITEM_FLAGS, MSG;

version (Windows):
extern (Windows):

HRESULT SafeArrayAllocDescriptor(uint, SAFEARRAY**);
HRESULT SafeArrayAllocDescriptorEx(VARENUM, uint, SAFEARRAY**);
HRESULT SafeArrayAllocData(SAFEARRAY*);
SAFEARRAY* SafeArrayCreate(VARENUM, uint, SAFEARRAYBOUND*);
SAFEARRAY* SafeArrayCreateEx(VARENUM, uint, SAFEARRAYBOUND*, void*);
HRESULT SafeArrayCopyData(SAFEARRAY*, SAFEARRAY*);
void SafeArrayReleaseDescriptor(SAFEARRAY*);
HRESULT SafeArrayDestroyDescriptor(SAFEARRAY*);
void SafeArrayReleaseData(void*);
HRESULT SafeArrayDestroyData(SAFEARRAY*);
HRESULT SafeArrayAddRef(SAFEARRAY*, void**);
HRESULT SafeArrayDestroy(SAFEARRAY*);
HRESULT SafeArrayRedim(SAFEARRAY*, SAFEARRAYBOUND*);
uint SafeArrayGetDim(SAFEARRAY*);
uint SafeArrayGetElemsize(SAFEARRAY*);
HRESULT SafeArrayGetUBound(SAFEARRAY*, uint, int*);
HRESULT SafeArrayGetLBound(SAFEARRAY*, uint, int*);
HRESULT SafeArrayLock(SAFEARRAY*);
HRESULT SafeArrayUnlock(SAFEARRAY*);
HRESULT SafeArrayAccessData(SAFEARRAY*, void**);
HRESULT SafeArrayUnaccessData(SAFEARRAY*);
HRESULT SafeArrayGetElement(SAFEARRAY*, int*, void*);
HRESULT SafeArrayPutElement(SAFEARRAY*, int*, void*);
HRESULT SafeArrayCopy(SAFEARRAY*, SAFEARRAY**);
HRESULT SafeArrayPtrOfIndex(SAFEARRAY*, int*, void**);
HRESULT SafeArraySetRecordInfo(SAFEARRAY*, IRecordInfo);
HRESULT SafeArrayGetRecordInfo(SAFEARRAY*, IRecordInfo*);
HRESULT SafeArraySetIID(SAFEARRAY*, const(GUID)*);
HRESULT SafeArrayGetIID(SAFEARRAY*, GUID*);
HRESULT SafeArrayGetVartype(SAFEARRAY*, VARENUM*);
SAFEARRAY* SafeArrayCreateVector(VARENUM, int, uint);
SAFEARRAY* SafeArrayCreateVectorEx(VARENUM, int, uint, void*);
HRESULT VectorFromBstr(BSTR, SAFEARRAY**);
HRESULT BstrFromVector(SAFEARRAY*, BSTR*);
HRESULT VarUI1FromI2(short, ubyte*);
HRESULT VarUI1FromI4(int, ubyte*);
HRESULT VarUI1FromI8(long, ubyte*);
HRESULT VarUI1FromR4(float, ubyte*);
HRESULT VarUI1FromR8(double, ubyte*);
HRESULT VarUI1FromCy(CY, ubyte*);
HRESULT VarUI1FromDate(double, ubyte*);
HRESULT VarUI1FromStr(const(wchar)*, uint, uint, ubyte*);
HRESULT VarUI1FromDisp(IDispatch, uint, ubyte*);
HRESULT VarUI1FromBool(VARIANT_BOOL, ubyte*);
HRESULT VarUI1FromI1(CHAR, ubyte*);
HRESULT VarUI1FromUI2(ushort, ubyte*);
HRESULT VarUI1FromUI4(uint, ubyte*);
HRESULT VarUI1FromUI8(ulong, ubyte*);
HRESULT VarUI1FromDec(const(DECIMAL)*, ubyte*);
HRESULT VarI2FromUI1(ubyte, short*);
HRESULT VarI2FromI4(int, short*);
HRESULT VarI2FromI8(long, short*);
HRESULT VarI2FromR4(float, short*);
HRESULT VarI2FromR8(double, short*);
HRESULT VarI2FromCy(CY, short*);
HRESULT VarI2FromDate(double, short*);
HRESULT VarI2FromStr(const(wchar)*, uint, uint, short*);
HRESULT VarI2FromDisp(IDispatch, uint, short*);
HRESULT VarI2FromBool(VARIANT_BOOL, short*);
HRESULT VarI2FromI1(CHAR, short*);
HRESULT VarI2FromUI2(ushort, short*);
HRESULT VarI2FromUI4(uint, short*);
HRESULT VarI2FromUI8(ulong, short*);
HRESULT VarI2FromDec(const(DECIMAL)*, short*);
HRESULT VarI4FromUI1(ubyte, int*);
HRESULT VarI4FromI2(short, int*);
HRESULT VarI4FromI8(long, int*);
HRESULT VarI4FromR4(float, int*);
HRESULT VarI4FromR8(double, int*);
HRESULT VarI4FromCy(CY, int*);
HRESULT VarI4FromDate(double, int*);
HRESULT VarI4FromStr(const(wchar)*, uint, uint, int*);
HRESULT VarI4FromDisp(IDispatch, uint, int*);
HRESULT VarI4FromBool(VARIANT_BOOL, int*);
HRESULT VarI4FromI1(CHAR, int*);
HRESULT VarI4FromUI2(ushort, int*);
HRESULT VarI4FromUI4(uint, int*);
HRESULT VarI4FromUI8(ulong, int*);
HRESULT VarI4FromDec(const(DECIMAL)*, int*);
HRESULT VarI8FromUI1(ubyte, long*);
HRESULT VarI8FromI2(short, long*);
HRESULT VarI8FromR4(float, long*);
HRESULT VarI8FromR8(double, long*);
HRESULT VarI8FromCy(CY, long*);
HRESULT VarI8FromDate(double, long*);
HRESULT VarI8FromStr(const(wchar)*, uint, uint, long*);
HRESULT VarI8FromDisp(IDispatch, uint, long*);
HRESULT VarI8FromBool(VARIANT_BOOL, long*);
HRESULT VarI8FromI1(CHAR, long*);
HRESULT VarI8FromUI2(ushort, long*);
HRESULT VarI8FromUI4(uint, long*);
HRESULT VarI8FromUI8(ulong, long*);
HRESULT VarI8FromDec(const(DECIMAL)*, long*);
HRESULT VarR4FromUI1(ubyte, float*);
HRESULT VarR4FromI2(short, float*);
HRESULT VarR4FromI4(int, float*);
HRESULT VarR4FromI8(long, float*);
HRESULT VarR4FromR8(double, float*);
HRESULT VarR4FromCy(CY, float*);
HRESULT VarR4FromDate(double, float*);
HRESULT VarR4FromStr(const(wchar)*, uint, uint, float*);
HRESULT VarR4FromDisp(IDispatch, uint, float*);
HRESULT VarR4FromBool(VARIANT_BOOL, float*);
HRESULT VarR4FromI1(CHAR, float*);
HRESULT VarR4FromUI2(ushort, float*);
HRESULT VarR4FromUI4(uint, float*);
HRESULT VarR4FromUI8(ulong, float*);
HRESULT VarR4FromDec(const(DECIMAL)*, float*);
HRESULT VarR8FromUI1(ubyte, double*);
HRESULT VarR8FromI2(short, double*);
HRESULT VarR8FromI4(int, double*);
HRESULT VarR8FromI8(long, double*);
HRESULT VarR8FromR4(float, double*);
HRESULT VarR8FromCy(CY, double*);
HRESULT VarR8FromDate(double, double*);
HRESULT VarR8FromStr(const(wchar)*, uint, uint, double*);
HRESULT VarR8FromDisp(IDispatch, uint, double*);
HRESULT VarR8FromBool(VARIANT_BOOL, double*);
HRESULT VarR8FromI1(CHAR, double*);
HRESULT VarR8FromUI2(ushort, double*);
HRESULT VarR8FromUI4(uint, double*);
HRESULT VarR8FromUI8(ulong, double*);
HRESULT VarR8FromDec(const(DECIMAL)*, double*);
HRESULT VarDateFromUI1(ubyte, double*);
HRESULT VarDateFromI2(short, double*);
HRESULT VarDateFromI4(int, double*);
HRESULT VarDateFromI8(long, double*);
HRESULT VarDateFromR4(float, double*);
HRESULT VarDateFromR8(double, double*);
HRESULT VarDateFromCy(CY, double*);
HRESULT VarDateFromStr(const(wchar)*, uint, uint, double*);
HRESULT VarDateFromDisp(IDispatch, uint, double*);
HRESULT VarDateFromBool(VARIANT_BOOL, double*);
HRESULT VarDateFromI1(CHAR, double*);
HRESULT VarDateFromUI2(ushort, double*);
HRESULT VarDateFromUI4(uint, double*);
HRESULT VarDateFromUI8(ulong, double*);
HRESULT VarDateFromDec(const(DECIMAL)*, double*);
HRESULT VarCyFromUI1(ubyte, CY*);
HRESULT VarCyFromI2(short, CY*);
HRESULT VarCyFromI4(int, CY*);
HRESULT VarCyFromI8(long, CY*);
HRESULT VarCyFromR4(float, CY*);
HRESULT VarCyFromR8(double, CY*);
HRESULT VarCyFromDate(double, CY*);
HRESULT VarCyFromStr(const(wchar)*, uint, uint, CY*);
HRESULT VarCyFromDisp(IDispatch, uint, CY*);
HRESULT VarCyFromBool(VARIANT_BOOL, CY*);
HRESULT VarCyFromI1(CHAR, CY*);
HRESULT VarCyFromUI2(ushort, CY*);
HRESULT VarCyFromUI4(uint, CY*);
HRESULT VarCyFromUI8(ulong, CY*);
HRESULT VarCyFromDec(const(DECIMAL)*, CY*);
HRESULT VarBstrFromUI1(ubyte, uint, uint, BSTR*);
HRESULT VarBstrFromI2(short, uint, uint, BSTR*);
HRESULT VarBstrFromI4(int, uint, uint, BSTR*);
HRESULT VarBstrFromI8(long, uint, uint, BSTR*);
HRESULT VarBstrFromR4(float, uint, uint, BSTR*);
HRESULT VarBstrFromR8(double, uint, uint, BSTR*);
HRESULT VarBstrFromCy(CY, uint, uint, BSTR*);
HRESULT VarBstrFromDate(double, uint, uint, BSTR*);
HRESULT VarBstrFromDisp(IDispatch, uint, uint, BSTR*);
HRESULT VarBstrFromBool(VARIANT_BOOL, uint, uint, BSTR*);
HRESULT VarBstrFromI1(CHAR, uint, uint, BSTR*);
HRESULT VarBstrFromUI2(ushort, uint, uint, BSTR*);
HRESULT VarBstrFromUI4(uint, uint, uint, BSTR*);
HRESULT VarBstrFromUI8(ulong, uint, uint, BSTR*);
HRESULT VarBstrFromDec(const(DECIMAL)*, uint, uint, BSTR*);
HRESULT VarBoolFromUI1(ubyte, VARIANT_BOOL*);
HRESULT VarBoolFromI2(short, VARIANT_BOOL*);
HRESULT VarBoolFromI4(int, VARIANT_BOOL*);
HRESULT VarBoolFromI8(long, VARIANT_BOOL*);
HRESULT VarBoolFromR4(float, VARIANT_BOOL*);
HRESULT VarBoolFromR8(double, VARIANT_BOOL*);
HRESULT VarBoolFromDate(double, VARIANT_BOOL*);
HRESULT VarBoolFromCy(CY, VARIANT_BOOL*);
HRESULT VarBoolFromStr(const(wchar)*, uint, uint, VARIANT_BOOL*);
HRESULT VarBoolFromDisp(IDispatch, uint, VARIANT_BOOL*);
HRESULT VarBoolFromI1(CHAR, VARIANT_BOOL*);
HRESULT VarBoolFromUI2(ushort, VARIANT_BOOL*);
HRESULT VarBoolFromUI4(uint, VARIANT_BOOL*);
HRESULT VarBoolFromUI8(ulong, VARIANT_BOOL*);
HRESULT VarBoolFromDec(const(DECIMAL)*, VARIANT_BOOL*);
HRESULT VarI1FromUI1(ubyte, PSTR);
HRESULT VarI1FromI2(short, PSTR);
HRESULT VarI1FromI4(int, PSTR);
HRESULT VarI1FromI8(long, PSTR);
HRESULT VarI1FromR4(float, PSTR);
HRESULT VarI1FromR8(double, PSTR);
HRESULT VarI1FromDate(double, PSTR);
HRESULT VarI1FromCy(CY, PSTR);
HRESULT VarI1FromStr(const(wchar)*, uint, uint, PSTR);
HRESULT VarI1FromDisp(IDispatch, uint, PSTR);
HRESULT VarI1FromBool(VARIANT_BOOL, PSTR);
HRESULT VarI1FromUI2(ushort, PSTR);
HRESULT VarI1FromUI4(uint, PSTR);
HRESULT VarI1FromUI8(ulong, PSTR);
HRESULT VarI1FromDec(const(DECIMAL)*, PSTR);
HRESULT VarUI2FromUI1(ubyte, ushort*);
HRESULT VarUI2FromI2(short, ushort*);
HRESULT VarUI2FromI4(int, ushort*);
HRESULT VarUI2FromI8(long, ushort*);
HRESULT VarUI2FromR4(float, ushort*);
HRESULT VarUI2FromR8(double, ushort*);
HRESULT VarUI2FromDate(double, ushort*);
HRESULT VarUI2FromCy(CY, ushort*);
HRESULT VarUI2FromStr(const(wchar)*, uint, uint, ushort*);
HRESULT VarUI2FromDisp(IDispatch, uint, ushort*);
HRESULT VarUI2FromBool(VARIANT_BOOL, ushort*);
HRESULT VarUI2FromI1(CHAR, ushort*);
HRESULT VarUI2FromUI4(uint, ushort*);
HRESULT VarUI2FromUI8(ulong, ushort*);
HRESULT VarUI2FromDec(const(DECIMAL)*, ushort*);
HRESULT VarUI4FromUI1(ubyte, uint*);
HRESULT VarUI4FromI2(short, uint*);
HRESULT VarUI4FromI4(int, uint*);
HRESULT VarUI4FromI8(long, uint*);
HRESULT VarUI4FromR4(float, uint*);
HRESULT VarUI4FromR8(double, uint*);
HRESULT VarUI4FromDate(double, uint*);
HRESULT VarUI4FromCy(CY, uint*);
HRESULT VarUI4FromStr(const(wchar)*, uint, uint, uint*);
HRESULT VarUI4FromDisp(IDispatch, uint, uint*);
HRESULT VarUI4FromBool(VARIANT_BOOL, uint*);
HRESULT VarUI4FromI1(CHAR, uint*);
HRESULT VarUI4FromUI2(ushort, uint*);
HRESULT VarUI4FromUI8(ulong, uint*);
HRESULT VarUI4FromDec(const(DECIMAL)*, uint*);
HRESULT VarUI8FromUI1(ubyte, ulong*);
HRESULT VarUI8FromI2(short, ulong*);
HRESULT VarUI8FromI8(long, ulong*);
HRESULT VarUI8FromR4(float, ulong*);
HRESULT VarUI8FromR8(double, ulong*);
HRESULT VarUI8FromCy(CY, ulong*);
HRESULT VarUI8FromDate(double, ulong*);
HRESULT VarUI8FromStr(const(wchar)*, uint, uint, ulong*);
HRESULT VarUI8FromDisp(IDispatch, uint, ulong*);
HRESULT VarUI8FromBool(VARIANT_BOOL, ulong*);
HRESULT VarUI8FromI1(CHAR, ulong*);
HRESULT VarUI8FromUI2(ushort, ulong*);
HRESULT VarUI8FromUI4(uint, ulong*);
HRESULT VarUI8FromDec(const(DECIMAL)*, ulong*);
HRESULT VarDecFromUI1(ubyte, DECIMAL*);
HRESULT VarDecFromI2(short, DECIMAL*);
HRESULT VarDecFromI4(int, DECIMAL*);
HRESULT VarDecFromI8(long, DECIMAL*);
HRESULT VarDecFromR4(float, DECIMAL*);
HRESULT VarDecFromR8(double, DECIMAL*);
HRESULT VarDecFromDate(double, DECIMAL*);
HRESULT VarDecFromCy(CY, DECIMAL*);
HRESULT VarDecFromStr(const(wchar)*, uint, uint, DECIMAL*);
HRESULT VarDecFromDisp(IDispatch, uint, DECIMAL*);
HRESULT VarDecFromBool(VARIANT_BOOL, DECIMAL*);
HRESULT VarDecFromI1(CHAR, DECIMAL*);
HRESULT VarDecFromUI2(ushort, DECIMAL*);
HRESULT VarDecFromUI4(uint, DECIMAL*);
HRESULT VarDecFromUI8(ulong, DECIMAL*);
HRESULT VarParseNumFromStr(const(wchar)*, uint, uint, NUMPARSE*, ubyte*);
HRESULT VarNumFromParseNum(NUMPARSE*, ubyte*, uint, VARIANT*);
HRESULT VarAdd(VARIANT*, VARIANT*, VARIANT*);
HRESULT VarAnd(VARIANT*, VARIANT*, VARIANT*);
HRESULT VarCat(VARIANT*, VARIANT*, VARIANT*);
HRESULT VarDiv(VARIANT*, VARIANT*, VARIANT*);
HRESULT VarEqv(VARIANT*, VARIANT*, VARIANT*);
HRESULT VarIdiv(VARIANT*, VARIANT*, VARIANT*);
HRESULT VarImp(VARIANT*, VARIANT*, VARIANT*);
HRESULT VarMod(VARIANT*, VARIANT*, VARIANT*);
HRESULT VarMul(VARIANT*, VARIANT*, VARIANT*);
HRESULT VarOr(VARIANT*, VARIANT*, VARIANT*);
HRESULT VarPow(VARIANT*, VARIANT*, VARIANT*);
HRESULT VarSub(VARIANT*, VARIANT*, VARIANT*);
HRESULT VarXor(VARIANT*, VARIANT*, VARIANT*);
HRESULT VarAbs(VARIANT*, VARIANT*);
HRESULT VarFix(VARIANT*, VARIANT*);
HRESULT VarInt(VARIANT*, VARIANT*);
HRESULT VarNeg(VARIANT*, VARIANT*);
HRESULT VarNot(VARIANT*, VARIANT*);
HRESULT VarRound(VARIANT*, int, VARIANT*);
VARCMP VarCmp(VARIANT*, VARIANT*, uint, uint);
HRESULT VarDecAdd(DECIMAL*, DECIMAL*, DECIMAL*);
HRESULT VarDecDiv(DECIMAL*, DECIMAL*, DECIMAL*);
HRESULT VarDecMul(DECIMAL*, DECIMAL*, DECIMAL*);
HRESULT VarDecSub(DECIMAL*, DECIMAL*, DECIMAL*);
HRESULT VarDecAbs(DECIMAL*, DECIMAL*);
HRESULT VarDecFix(DECIMAL*, DECIMAL*);
HRESULT VarDecInt(DECIMAL*, DECIMAL*);
HRESULT VarDecNeg(DECIMAL*, DECIMAL*);
HRESULT VarDecRound(DECIMAL*, int, DECIMAL*);
VARCMP VarDecCmp(DECIMAL*, DECIMAL*);
VARCMP VarDecCmpR8(DECIMAL*, double);
HRESULT VarCyAdd(CY, CY, CY*);
HRESULT VarCyMul(CY, CY, CY*);
HRESULT VarCyMulI4(CY, int, CY*);
HRESULT VarCyMulI8(CY, long, CY*);
HRESULT VarCySub(CY, CY, CY*);
HRESULT VarCyAbs(CY, CY*);
HRESULT VarCyFix(CY, CY*);
HRESULT VarCyInt(CY, CY*);
HRESULT VarCyNeg(CY, CY*);
HRESULT VarCyRound(CY, int, CY*);
VARCMP VarCyCmp(CY, CY);
VARCMP VarCyCmpR8(CY, double);
HRESULT VarBstrCat(BSTR, BSTR, BSTR*);
HRESULT VarBstrCmp(BSTR, BSTR, uint, uint);
HRESULT VarR8Pow(double, double, double*);
VARCMP VarR4CmpR8(float, double);
HRESULT VarR8Round(double, int, double*);
HRESULT VarDateFromUdate(UDATE*, uint, double*);
HRESULT VarDateFromUdateEx(UDATE*, uint, uint, double*);
HRESULT VarUdateFromDate(double, uint, UDATE*);
HRESULT GetAltMonthNames(uint, PWSTR**);
HRESULT VarFormat(VARIANT*, PWSTR, VARFORMAT_FIRST_DAY, VARFORMAT_FIRST_WEEK, uint, BSTR*);
HRESULT VarFormatDateTime(VARIANT*, VARFORMAT_NAMED_FORMAT, uint, BSTR*);
HRESULT VarFormatNumber(VARIANT*, int, VARFORMAT_LEADING_DIGIT, VARFORMAT_PARENTHESES, VARFORMAT_GROUP, uint, BSTR*);
HRESULT VarFormatPercent(VARIANT*, int, VARFORMAT_LEADING_DIGIT, VARFORMAT_PARENTHESES, VARFORMAT_GROUP, uint, BSTR*);
HRESULT VarFormatCurrency(VARIANT*, int, int, int, int, uint, BSTR*);
HRESULT VarWeekdayName(int, int, int, uint, BSTR*);
HRESULT VarMonthName(int, int, uint, BSTR*);
HRESULT VarFormatFromTokens(VARIANT*, PWSTR, ubyte*, uint, BSTR*, uint);
HRESULT VarTokenizeFormatString(PWSTR, ubyte*, int, VARFORMAT_FIRST_DAY, VARFORMAT_FIRST_WEEK, uint, int*);
uint LHashValOfNameSysA(SYSKIND, uint, const(char)*);
uint LHashValOfNameSys(SYSKIND, uint, const(wchar)*);
HRESULT LoadTypeLib(const(wchar)*, ITypeLib*);
HRESULT LoadTypeLibEx(const(wchar)*, REGKIND, ITypeLib*);
HRESULT LoadRegTypeLib(const(GUID)*, ushort, ushort, uint, ITypeLib*);
HRESULT QueryPathOfRegTypeLib(const(GUID)*, ushort, ushort, uint, BSTR*);
HRESULT RegisterTypeLib(ITypeLib, const(wchar)*, const(wchar)*);
HRESULT UnRegisterTypeLib(const(GUID)*, ushort, ushort, uint, SYSKIND);
HRESULT RegisterTypeLibForUser(ITypeLib, PWSTR, PWSTR);
HRESULT UnRegisterTypeLibForUser(const(GUID)*, ushort, ushort, uint, SYSKIND);
HRESULT CreateTypeLib(SYSKIND, const(wchar)*, ICreateTypeLib*);
HRESULT CreateTypeLib2(SYSKIND, const(wchar)*, ICreateTypeLib2*);
HRESULT DispGetParam(DISPPARAMS*, uint, VARENUM, VARIANT*, uint*);
HRESULT DispGetIDsOfNames(ITypeInfo, PWSTR*, uint, int*);
HRESULT DispInvoke(void*, ITypeInfo, int, ushort, DISPPARAMS*, VARIANT*, EXCEPINFO*, uint*);
HRESULT CreateDispTypeInfo(INTERFACEDATA*, uint, ITypeInfo*);
HRESULT CreateStdDispatch(IUnknown, void*, ITypeInfo, IUnknown*);
HRESULT DispCallFunc(void*, ulong, CALLCONV, VARENUM, uint, ushort*, VARIANT**, VARIANT*);
HRESULT RegisterActiveObject(IUnknown, const(GUID)*, ACTIVEOBJECT_FLAGS, uint*);
HRESULT RevokeActiveObject(uint, void*);
HRESULT GetActiveObject(const(GUID)*, void*, IUnknown*);
HRESULT CreateErrorInfo(ICreateErrorInfo*);
HRESULT GetRecordInfoFromTypeInfo(ITypeInfo, IRecordInfo*);
HRESULT GetRecordInfoFromGuids(const(GUID)*, uint, uint, uint, const(GUID)*, IRecordInfo*);
uint OaBuildVersion();
void ClearCustData(CUSTDATA*);
void OaEnablePerUserTLibRegistration();
uint OleBuildVersion();
HRESULT OleInitialize(void*);
void OleUninitialize();
HRESULT OleQueryLinkFromData(IDataObject);
HRESULT OleQueryCreateFromData(IDataObject);
HRESULT OleCreate(const(GUID)*, const(GUID)*, uint, FORMATETC*, IOleClientSite, IStorage, void**);
HRESULT OleCreateEx(const(GUID)*, const(GUID)*, OLECREATE, uint, uint, uint*, FORMATETC*, IAdviseSink, uint*, IOleClientSite, IStorage, void**);
HRESULT OleCreateFromData(IDataObject, const(GUID)*, uint, FORMATETC*, IOleClientSite, IStorage, void**);
HRESULT OleCreateFromDataEx(IDataObject, const(GUID)*, OLECREATE, uint, uint, uint*, FORMATETC*, IAdviseSink, uint*, IOleClientSite, IStorage, void**);
HRESULT OleCreateLinkFromData(IDataObject, const(GUID)*, uint, FORMATETC*, IOleClientSite, IStorage, void**);
HRESULT OleCreateLinkFromDataEx(IDataObject, const(GUID)*, OLECREATE, uint, uint, uint*, FORMATETC*, IAdviseSink, uint*, IOleClientSite, IStorage, void**);
HRESULT OleCreateStaticFromData(IDataObject, const(GUID)*, uint, FORMATETC*, IOleClientSite, IStorage, void**);
HRESULT OleCreateLink(IMoniker, const(GUID)*, uint, FORMATETC*, IOleClientSite, IStorage, void**);
HRESULT OleCreateLinkEx(IMoniker, const(GUID)*, OLECREATE, uint, uint, uint*, FORMATETC*, IAdviseSink, uint*, IOleClientSite, IStorage, void**);
HRESULT OleCreateLinkToFile(const(wchar)*, const(GUID)*, uint, FORMATETC*, IOleClientSite, IStorage, void**);
HRESULT OleCreateLinkToFileEx(const(wchar)*, const(GUID)*, OLECREATE, uint, uint, uint*, FORMATETC*, IAdviseSink, uint*, IOleClientSite, IStorage, void**);
HRESULT OleCreateFromFile(const(GUID)*, const(wchar)*, const(GUID)*, uint, FORMATETC*, IOleClientSite, IStorage, void**);
HRESULT OleCreateFromFileEx(const(GUID)*, const(wchar)*, const(GUID)*, OLECREATE, uint, uint, uint*, FORMATETC*, IAdviseSink, uint*, IOleClientSite, IStorage, void**);
HRESULT OleLoad(IStorage, const(GUID)*, IOleClientSite, void**);
HRESULT OleSave(IPersistStorage, IStorage, BOOL);
HRESULT OleLoadFromStream(IStream, const(GUID)*, void**);
HRESULT OleSaveToStream(IPersistStream, IStream);
HRESULT OleSetContainedObject(IUnknown, BOOL);
HRESULT OleNoteObjectVisible(IUnknown, BOOL);
HRESULT RegisterDragDrop(HWND, IDropTarget);
HRESULT RevokeDragDrop(HWND);
HRESULT DoDragDrop(IDataObject, IDropSource, DROPEFFECT, DROPEFFECT*);
HRESULT OleSetClipboard(IDataObject);
HRESULT OleGetClipboard(IDataObject*);
HRESULT OleGetClipboardWithEnterpriseInfo(IDataObject*, PWSTR*, PWSTR*, PWSTR*, PWSTR*);
HRESULT OleFlushClipboard();
HRESULT OleIsCurrentClipboard(IDataObject);
long OleCreateMenuDescriptor(HMENU, OLEMENUGROUPWIDTHS*);
HRESULT OleSetMenuDescriptor(long, HWND, HWND, IOleInPlaceFrame, IOleInPlaceActiveObject);
HRESULT OleDestroyMenuDescriptor(long);
HRESULT OleTranslateAccelerator(IOleInPlaceFrame, OLEINPLACEFRAMEINFO*, MSG*);
HANDLE OleDuplicateData(HANDLE, CLIPBOARD_FORMAT, GLOBAL_ALLOC_FLAGS);
HRESULT OleDraw(IUnknown, uint, HDC, RECT*);
HRESULT OleRun(IUnknown);
BOOL OleIsRunning(IOleObject);
HRESULT OleLockRunning(IUnknown, BOOL, BOOL);
void ReleaseStgMedium(STGMEDIUM*);
HRESULT CreateOleAdviseHolder(IOleAdviseHolder*);
HRESULT OleCreateDefaultHandler(const(GUID)*, IUnknown, const(GUID)*, void**);
HRESULT OleCreateEmbeddingHelper(const(GUID)*, IUnknown, EMBDHLP_FLAGS, IClassFactory, const(GUID)*, void**);
BOOL IsAccelerator(HACCEL, int, MSG*, ushort*);
HGLOBAL OleGetIconOfFile(PWSTR, BOOL);
HGLOBAL OleGetIconOfClass(const(GUID)*, PWSTR, BOOL);
HGLOBAL OleMetafilePictFromIconAndLabel(HICON, PWSTR, PWSTR, uint);
HRESULT OleRegGetUserType(const(GUID)*, uint, PWSTR*);
HRESULT OleRegGetMiscStatus(const(GUID)*, uint, uint*);
HRESULT OleRegEnumFormatEtc(const(GUID)*, uint, IEnumFORMATETC*);
HRESULT OleRegEnumVerbs(const(GUID)*, IEnumOLEVERB*);
HRESULT OleDoAutoConvert(IStorage, GUID*);
HRESULT OleGetAutoConvert(const(GUID)*, GUID*);
HRESULT OleSetAutoConvert(const(GUID)*, const(GUID)*);
uint HRGN_UserSize(uint*, uint, HRGN*);
ubyte* HRGN_UserMarshal(uint*, ubyte*, HRGN*);
ubyte* HRGN_UserUnmarshal(uint*, ubyte*, HRGN*);
void HRGN_UserFree(uint*, HRGN*);
uint HRGN_UserSize64(uint*, uint, HRGN*);
ubyte* HRGN_UserMarshal64(uint*, ubyte*, HRGN*);
ubyte* HRGN_UserUnmarshal64(uint*, ubyte*, HRGN*);
void HRGN_UserFree64(uint*, HRGN*);
HRESULT OleCreatePropertyFrame(HWND, uint, uint, const(wchar)*, uint, IUnknown*, uint, GUID*, uint, uint, void*);
HRESULT OleCreatePropertyFrameIndirect(OCPFIPARAMS*);
HRESULT OleTranslateColor(uint, HPALETTE, COLORREF*);
HRESULT OleCreateFontIndirect(FONTDESC*, const(GUID)*, void**);
HRESULT OleCreatePictureIndirect(PICTDESC*, const(GUID)*, BOOL, void**);
HRESULT OleLoadPicture(IStream, int, BOOL, const(GUID)*, void**);
HRESULT OleLoadPictureEx(IStream, int, BOOL, const(GUID)*, uint, uint, LOAD_PICTURE_FLAGS, void**);
HRESULT OleLoadPicturePath(PWSTR, IUnknown, uint, uint, const(GUID)*, void**);
HRESULT OleLoadPictureFile(VARIANT, IDispatch*);
HRESULT OleLoadPictureFileEx(VARIANT, uint, uint, LOAD_PICTURE_FLAGS, IDispatch*);
HRESULT OleSavePictureFile(IDispatch, BSTR);
HCURSOR OleIconToCursor(HINSTANCE, HICON);
BOOL OleUIAddVerbMenuW(IOleObject, const(wchar)*, HMENU, uint, uint, uint, BOOL, uint, HMENU*);
BOOL OleUIAddVerbMenuA(IOleObject, const(char)*, HMENU, uint, uint, uint, BOOL, uint, HMENU*);
uint OleUIInsertObjectW(OLEUIINSERTOBJECTW*);
uint OleUIInsertObjectA(OLEUIINSERTOBJECTA*);
uint OleUIPasteSpecialW(OLEUIPASTESPECIALW*);
uint OleUIPasteSpecialA(OLEUIPASTESPECIALA*);
uint OleUIEditLinksW(OLEUIEDITLINKSW*);
uint OleUIEditLinksA(OLEUIEDITLINKSA*);
uint OleUIChangeIconW(OLEUICHANGEICONW*);
uint OleUIChangeIconA(OLEUICHANGEICONA*);
uint OleUIConvertW(OLEUICONVERTW*);
uint OleUIConvertA(OLEUICONVERTA*);
BOOL OleUICanConvertOrActivateAs(const(GUID)*, BOOL, ushort);
uint OleUIBusyW(OLEUIBUSYW*);
uint OleUIBusyA(OLEUIBUSYA*);
uint OleUIChangeSourceW(OLEUICHANGESOURCEW*);
uint OleUIChangeSourceA(OLEUICHANGESOURCEA*);
uint OleUIObjectPropertiesW(OLEUIOBJECTPROPSW*);
uint OleUIObjectPropertiesA(OLEUIOBJECTPROPSA*);
int OleUIPromptUserW(int, HWND);
int OleUIPromptUserA(int, HWND);
BOOL OleUIUpdateLinksW(IOleUILinkContainerW, HWND, PWSTR, int);
BOOL OleUIUpdateLinksA(IOleUILinkContainerA, HWND, PSTR, int);
enum CTL_E_ILLEGALFUNCTIONCALL = 0xffffffff800a0005;
enum CONNECT_E_FIRST = 0xffffffff80040200;
enum SELFREG_E_FIRST = 0xffffffff80040200;
enum PERPROP_E_FIRST = 0xffffffff80040200;
enum OLECMDERR_E_FIRST = 0xffffffff80040100;
enum OLECMDERR_E_DISABLED = 0xffffffff80040101;
enum OLECMDERR_E_NOHELP = 0xffffffff80040102;
enum OLECMDERR_E_CANCELED = 0xffffffff80040103;
enum OLECMDERR_E_UNKNOWNGROUP = 0xffffffff80040104;
enum CONNECT_E_NOCONNECTION = 0xffffffff80040200;
enum CONNECT_E_ADVISELIMIT = 0xffffffff80040201;
enum CONNECT_E_CANNOTCONNECT = 0xffffffff80040202;
enum CONNECT_E_OVERRIDDEN = 0xffffffff80040203;
enum SELFREG_E_TYPELIB = 0xffffffff80040200;
enum SELFREG_E_CLASS = 0xffffffff80040201;
enum PERPROP_E_NOPAGEAVAILABLE = 0xffffffff80040200;
enum CLSID_CFontPropPage = GUID(0xbe35200, 0x8f91, 0x11ce, [0x9d, 0xe3, 0x0, 0xaa, 0x0, 0x4b, 0xb8, 0x51]);
enum CLSID_CColorPropPage = GUID(0xbe35201, 0x8f91, 0x11ce, [0x9d, 0xe3, 0x0, 0xaa, 0x0, 0x4b, 0xb8, 0x51]);
enum CLSID_CPicturePropPage = GUID(0xbe35202, 0x8f91, 0x11ce, [0x9d, 0xe3, 0x0, 0xaa, 0x0, 0x4b, 0xb8, 0x51]);
enum CLSID_PersistPropset = GUID(0xfb8f0821, 0x164, 0x101b, [0x84, 0xed, 0x8, 0x0, 0x2b, 0x2e, 0xc7, 0x13]);
enum CLSID_ConvertVBX = GUID(0xfb8f0822, 0x164, 0x101b, [0x84, 0xed, 0x8, 0x0, 0x2b, 0x2e, 0xc7, 0x13]);
enum CLSID_StdFont = GUID(0xbe35203, 0x8f91, 0x11ce, [0x9d, 0xe3, 0x0, 0xaa, 0x0, 0x4b, 0xb8, 0x51]);
enum CLSID_StdPicture = GUID(0xbe35204, 0x8f91, 0x11ce, [0x9d, 0xe3, 0x0, 0xaa, 0x0, 0x4b, 0xb8, 0x51]);
enum GUID_HIMETRIC = GUID(0x66504300, 0xbe0f, 0x101a, [0x8b, 0xbb, 0x0, 0xaa, 0x0, 0x30, 0xc, 0xab]);
enum GUID_COLOR = GUID(0x66504301, 0xbe0f, 0x101a, [0x8b, 0xbb, 0x0, 0xaa, 0x0, 0x30, 0xc, 0xab]);
enum GUID_XPOSPIXEL = GUID(0x66504302, 0xbe0f, 0x101a, [0x8b, 0xbb, 0x0, 0xaa, 0x0, 0x30, 0xc, 0xab]);
enum GUID_YPOSPIXEL = GUID(0x66504303, 0xbe0f, 0x101a, [0x8b, 0xbb, 0x0, 0xaa, 0x0, 0x30, 0xc, 0xab]);
enum GUID_XSIZEPIXEL = GUID(0x66504304, 0xbe0f, 0x101a, [0x8b, 0xbb, 0x0, 0xaa, 0x0, 0x30, 0xc, 0xab]);
enum GUID_YSIZEPIXEL = GUID(0x66504305, 0xbe0f, 0x101a, [0x8b, 0xbb, 0x0, 0xaa, 0x0, 0x30, 0xc, 0xab]);
enum GUID_XPOS = GUID(0x66504306, 0xbe0f, 0x101a, [0x8b, 0xbb, 0x0, 0xaa, 0x0, 0x30, 0xc, 0xab]);
enum GUID_YPOS = GUID(0x66504307, 0xbe0f, 0x101a, [0x8b, 0xbb, 0x0, 0xaa, 0x0, 0x30, 0xc, 0xab]);
enum GUID_XSIZE = GUID(0x66504308, 0xbe0f, 0x101a, [0x8b, 0xbb, 0x0, 0xaa, 0x0, 0x30, 0xc, 0xab]);
enum GUID_YSIZE = GUID(0x66504309, 0xbe0f, 0x101a, [0x8b, 0xbb, 0x0, 0xaa, 0x0, 0x30, 0xc, 0xab]);
enum GUID_TRISTATE = GUID(0x6650430a, 0xbe0f, 0x101a, [0x8b, 0xbb, 0x0, 0xaa, 0x0, 0x30, 0xc, 0xab]);
enum GUID_OPTIONVALUEEXCLUSIVE = GUID(0x6650430b, 0xbe0f, 0x101a, [0x8b, 0xbb, 0x0, 0xaa, 0x0, 0x30, 0xc, 0xab]);
enum GUID_CHECKVALUEEXCLUSIVE = GUID(0x6650430c, 0xbe0f, 0x101a, [0x8b, 0xbb, 0x0, 0xaa, 0x0, 0x30, 0xc, 0xab]);
enum GUID_FONTNAME = GUID(0x6650430d, 0xbe0f, 0x101a, [0x8b, 0xbb, 0x0, 0xaa, 0x0, 0x30, 0xc, 0xab]);
enum GUID_FONTSIZE = GUID(0x6650430e, 0xbe0f, 0x101a, [0x8b, 0xbb, 0x0, 0xaa, 0x0, 0x30, 0xc, 0xab]);
enum GUID_FONTBOLD = GUID(0x6650430f, 0xbe0f, 0x101a, [0x8b, 0xbb, 0x0, 0xaa, 0x0, 0x30, 0xc, 0xab]);
enum GUID_FONTITALIC = GUID(0x66504310, 0xbe0f, 0x101a, [0x8b, 0xbb, 0x0, 0xaa, 0x0, 0x30, 0xc, 0xab]);
enum GUID_FONTUNDERSCORE = GUID(0x66504311, 0xbe0f, 0x101a, [0x8b, 0xbb, 0x0, 0xaa, 0x0, 0x30, 0xc, 0xab]);
enum GUID_FONTSTRIKETHROUGH = GUID(0x66504312, 0xbe0f, 0x101a, [0x8b, 0xbb, 0x0, 0xaa, 0x0, 0x30, 0xc, 0xab]);
enum GUID_HANDLE = GUID(0x66504313, 0xbe0f, 0x101a, [0x8b, 0xbb, 0x0, 0xaa, 0x0, 0x30, 0xc, 0xab]);
enum CONNECT_E_LAST = 0xffffffff8004020f;
enum CONNECT_S_FIRST = 0x00040200;
enum CONNECT_S_LAST = 0x0004020f;
enum SELFREG_E_LAST = 0xffffffff8004020f;
enum SELFREG_S_FIRST = 0x00040200;
enum SELFREG_S_LAST = 0x0004020f;
enum PERPROP_E_LAST = 0xffffffff8004020f;
enum PERPROP_S_FIRST = 0x00040200;
enum PERPROP_S_LAST = 0x0004020f;
enum OLEIVERB_PROPERTIES = 0xfffffffffffffff9;
enum VT_STREAMED_PROPSET = 0x00000049;
enum VT_STORED_PROPSET = 0x0000004a;
enum VT_BLOB_PROPSET = 0x0000004b;
enum VT_VERBOSE_ENUM = 0x0000004c;
enum OCM__BASE = 0x00002000;
enum DISPID_AUTOSIZE = 0xfffffffffffffe0c;
enum DISPID_BACKCOLOR = 0xfffffffffffffe0b;
enum DISPID_BACKSTYLE = 0xfffffffffffffe0a;
enum DISPID_BORDERCOLOR = 0xfffffffffffffe09;
enum DISPID_BORDERSTYLE = 0xfffffffffffffe08;
enum DISPID_BORDERWIDTH = 0xfffffffffffffe07;
enum DISPID_DRAWMODE = 0xfffffffffffffe05;
enum DISPID_DRAWSTYLE = 0xfffffffffffffe04;
enum DISPID_DRAWWIDTH = 0xfffffffffffffe03;
enum DISPID_FILLCOLOR = 0xfffffffffffffe02;
enum DISPID_FILLSTYLE = 0xfffffffffffffe01;
enum DISPID_FONT = 0xfffffffffffffe00;
enum DISPID_FORECOLOR = 0xfffffffffffffdff;
enum DISPID_ENABLED = 0xfffffffffffffdfe;
enum DISPID_HWND = 0xfffffffffffffdfd;
enum DISPID_TABSTOP = 0xfffffffffffffdfc;
enum DISPID_TEXT = 0xfffffffffffffdfb;
enum DISPID_CAPTION = 0xfffffffffffffdfa;
enum DISPID_BORDERVISIBLE = 0xfffffffffffffdf9;
enum DISPID_APPEARANCE = 0xfffffffffffffdf8;
enum DISPID_MOUSEPOINTER = 0xfffffffffffffdf7;
enum DISPID_MOUSEICON = 0xfffffffffffffdf6;
enum DISPID_PICTURE = 0xfffffffffffffdf5;
enum DISPID_VALID = 0xfffffffffffffdf4;
enum DISPID_READYSTATE = 0xfffffffffffffdf3;
enum DISPID_LISTINDEX = 0xfffffffffffffdf2;
enum DISPID_SELECTED = 0xfffffffffffffdf1;
enum DISPID_LIST = 0xfffffffffffffdf0;
enum DISPID_COLUMN = 0xfffffffffffffdef;
enum DISPID_LISTCOUNT = 0xfffffffffffffded;
enum DISPID_MULTISELECT = 0xfffffffffffffdec;
enum DISPID_MAXLENGTH = 0xfffffffffffffdeb;
enum DISPID_PASSWORDCHAR = 0xfffffffffffffdea;
enum DISPID_SCROLLBARS = 0xfffffffffffffde9;
enum DISPID_WORDWRAP = 0xfffffffffffffde8;
enum DISPID_MULTILINE = 0xfffffffffffffde7;
enum DISPID_NUMBEROFROWS = 0xfffffffffffffde6;
enum DISPID_NUMBEROFCOLUMNS = 0xfffffffffffffde5;
enum DISPID_DISPLAYSTYLE = 0xfffffffffffffde4;
enum DISPID_GROUPNAME = 0xfffffffffffffde3;
enum DISPID_IMEMODE = 0xfffffffffffffde2;
enum DISPID_ACCELERATOR = 0xfffffffffffffde1;
enum DISPID_ENTERKEYBEHAVIOR = 0xfffffffffffffde0;
enum DISPID_TABKEYBEHAVIOR = 0xfffffffffffffddf;
enum DISPID_SELTEXT = 0xfffffffffffffdde;
enum DISPID_SELSTART = 0xfffffffffffffddd;
enum DISPID_SELLENGTH = 0xfffffffffffffddc;
enum DISPID_REFRESH = 0xfffffffffffffdda;
enum DISPID_DOCLICK = 0xfffffffffffffdd9;
enum DISPID_ABOUTBOX = 0xfffffffffffffdd8;
enum DISPID_ADDITEM = 0xfffffffffffffdd7;
enum DISPID_CLEAR = 0xfffffffffffffdd6;
enum DISPID_REMOVEITEM = 0xfffffffffffffdd5;
enum DISPID_CLICK = 0xfffffffffffffda8;
enum DISPID_DBLCLICK = 0xfffffffffffffda7;
enum DISPID_KEYDOWN = 0xfffffffffffffda6;
enum DISPID_KEYPRESS = 0xfffffffffffffda5;
enum DISPID_KEYUP = 0xfffffffffffffda4;
enum DISPID_MOUSEDOWN = 0xfffffffffffffda3;
enum DISPID_MOUSEMOVE = 0xfffffffffffffda2;
enum DISPID_MOUSEUP = 0xfffffffffffffda1;
enum DISPID_ERROREVENT = 0xfffffffffffffda0;
enum DISPID_READYSTATECHANGE = 0xfffffffffffffd9f;
enum DISPID_CLICK_VALUE = 0xfffffffffffffd9e;
enum DISPID_RIGHTTOLEFT = 0xfffffffffffffd9d;
enum DISPID_TOPTOBOTTOM = 0xfffffffffffffd9c;
enum DISPID_THIS = 0xfffffffffffffd9b;
enum DISPID_AMBIENT_BACKCOLOR = 0xfffffffffffffd43;
enum DISPID_AMBIENT_DISPLAYNAME = 0xfffffffffffffd42;
enum DISPID_AMBIENT_FONT = 0xfffffffffffffd41;
enum DISPID_AMBIENT_FORECOLOR = 0xfffffffffffffd40;
enum DISPID_AMBIENT_LOCALEID = 0xfffffffffffffd3f;
enum DISPID_AMBIENT_MESSAGEREFLECT = 0xfffffffffffffd3e;
enum DISPID_AMBIENT_SCALEUNITS = 0xfffffffffffffd3d;
enum DISPID_AMBIENT_TEXTALIGN = 0xfffffffffffffd3c;
enum DISPID_AMBIENT_USERMODE = 0xfffffffffffffd3b;
enum DISPID_AMBIENT_UIDEAD = 0xfffffffffffffd3a;
enum DISPID_AMBIENT_SHOWGRABHANDLES = 0xfffffffffffffd39;
enum DISPID_AMBIENT_SHOWHATCHING = 0xfffffffffffffd38;
enum DISPID_AMBIENT_DISPLAYASDEFAULT = 0xfffffffffffffd37;
enum DISPID_AMBIENT_SUPPORTSMNEMONICS = 0xfffffffffffffd36;
enum DISPID_AMBIENT_AUTOCLIP = 0xfffffffffffffd35;
enum DISPID_AMBIENT_APPEARANCE = 0xfffffffffffffd34;
enum DISPID_AMBIENT_CODEPAGE = 0xfffffffffffffd2b;
enum DISPID_AMBIENT_PALETTE = 0xfffffffffffffd2a;
enum DISPID_AMBIENT_CHARSET = 0xfffffffffffffd29;
enum DISPID_AMBIENT_TRANSFERPRIORITY = 0xfffffffffffffd28;
enum DISPID_AMBIENT_RIGHTTOLEFT = 0xfffffffffffffd24;
enum DISPID_AMBIENT_TOPTOBOTTOM = 0xfffffffffffffd23;
enum DISPID_Name = 0xfffffffffffffce0;
enum DISPID_Delete = 0xfffffffffffffcdf;
enum DISPID_Object = 0xfffffffffffffcde;
enum DISPID_Parent = 0xfffffffffffffcdd;
enum DISPID_FONT_NAME = 0x00000000;
enum DISPID_FONT_SIZE = 0x00000002;
enum DISPID_FONT_BOLD = 0x00000003;
enum DISPID_FONT_ITALIC = 0x00000004;
enum DISPID_FONT_UNDER = 0x00000005;
enum DISPID_FONT_STRIKE = 0x00000006;
enum DISPID_FONT_WEIGHT = 0x00000007;
enum DISPID_FONT_CHARSET = 0x00000008;
enum DISPID_FONT_CHANGED = 0x00000009;
enum DISPID_PICT_HANDLE = 0x00000000;
enum DISPID_PICT_HPAL = 0x00000002;
enum DISPID_PICT_TYPE = 0x00000003;
enum DISPID_PICT_WIDTH = 0x00000004;
enum DISPID_PICT_HEIGHT = 0x00000005;
enum DISPID_PICT_RENDER = 0x00000006;
enum STDOLE_TLB = "stdole2.tlb";
enum STDTYPE_TLB = "stdole2.tlb";
enum GC_WCH_SIBLING = 0x00000001;
enum TIFLAGS_EXTENDDISPATCHONLY = 0x00000001;
enum OLECMDERR_E_NOTSUPPORTED = 0xffffffff80040100;
enum MSOCMDERR_E_FIRST = 0xffffffff80040100;
enum MSOCMDERR_E_NOTSUPPORTED = 0xffffffff80040100;
enum MSOCMDERR_E_DISABLED = 0xffffffff80040101;
enum MSOCMDERR_E_NOHELP = 0xffffffff80040102;
enum MSOCMDERR_E_CANCELED = 0xffffffff80040103;
enum MSOCMDERR_E_UNKNOWNGROUP = 0xffffffff80040104;
enum OLECMD_TASKDLGID_ONBEFOREUNLOAD = 0x00000001;
enum OLECMDARGINDEX_SHOWPAGEACTIONMENU_HWND = 0x00000000;
enum OLECMDARGINDEX_SHOWPAGEACTIONMENU_X = 0x00000001;
enum OLECMDARGINDEX_SHOWPAGEACTIONMENU_Y = 0x00000002;
enum OLECMDARGINDEX_ACTIVEXINSTALL_PUBLISHER = 0x00000000;
enum OLECMDARGINDEX_ACTIVEXINSTALL_DISPLAYNAME = 0x00000001;
enum OLECMDARGINDEX_ACTIVEXINSTALL_CLSID = 0x00000002;
enum OLECMDARGINDEX_ACTIVEXINSTALL_INSTALLSCOPE = 0x00000003;
enum OLECMDARGINDEX_ACTIVEXINSTALL_SOURCEURL = 0x00000004;
enum INSTALL_SCOPE_INVALID = 0x00000000;
enum INSTALL_SCOPE_MACHINE = 0x00000001;
enum INSTALL_SCOPE_USER = 0x00000002;
enum MK_ALT = 0x00000020;
enum DD_DEFSCROLLINSET = 0x0000000b;
enum DD_DEFSCROLLDELAY = 0x00000032;
enum DD_DEFSCROLLINTERVAL = 0x00000032;
enum DD_DEFDRAGDELAY = 0x000000c8;
enum DD_DEFDRAGMINDIST = 0x00000002;
enum OT_LINK = 0x00000001;
enum OT_EMBEDDED = 0x00000002;
enum OT_STATIC = 0x00000003;
enum OLEVERB_PRIMARY = 0x00000000;
enum OF_SET = 0x00000001;
enum OF_GET = 0x00000002;
enum OF_HANDLER = 0x00000004;
enum WIN32 = 0x00000064;
enum IDC_OLEUIHELP = 0x00000063;
enum IDC_IO_CREATENEW = 0x00000834;
enum IDC_IO_CREATEFROMFILE = 0x00000835;
enum IDC_IO_LINKFILE = 0x00000836;
enum IDC_IO_OBJECTTYPELIST = 0x00000837;
enum IDC_IO_DISPLAYASICON = 0x00000838;
enum IDC_IO_CHANGEICON = 0x00000839;
enum IDC_IO_FILE = 0x0000083a;
enum IDC_IO_FILEDISPLAY = 0x0000083b;
enum IDC_IO_RESULTIMAGE = 0x0000083c;
enum IDC_IO_RESULTTEXT = 0x0000083d;
enum IDC_IO_ICONDISPLAY = 0x0000083e;
enum IDC_IO_OBJECTTYPETEXT = 0x0000083f;
enum IDC_IO_FILETEXT = 0x00000840;
enum IDC_IO_FILETYPE = 0x00000841;
enum IDC_IO_INSERTCONTROL = 0x00000842;
enum IDC_IO_ADDCONTROL = 0x00000843;
enum IDC_IO_CONTROLTYPELIST = 0x00000844;
enum IDC_PS_PASTE = 0x000001f4;
enum IDC_PS_PASTELINK = 0x000001f5;
enum IDC_PS_SOURCETEXT = 0x000001f6;
enum IDC_PS_PASTELIST = 0x000001f7;
enum IDC_PS_PASTELINKLIST = 0x000001f8;
enum IDC_PS_DISPLAYLIST = 0x000001f9;
enum IDC_PS_DISPLAYASICON = 0x000001fa;
enum IDC_PS_ICONDISPLAY = 0x000001fb;
enum IDC_PS_CHANGEICON = 0x000001fc;
enum IDC_PS_RESULTIMAGE = 0x000001fd;
enum IDC_PS_RESULTTEXT = 0x000001fe;
enum IDC_CI_GROUP = 0x00000078;
enum IDC_CI_CURRENT = 0x00000079;
enum IDC_CI_CURRENTICON = 0x0000007a;
enum IDC_CI_DEFAULT = 0x0000007b;
enum IDC_CI_DEFAULTICON = 0x0000007c;
enum IDC_CI_FROMFILE = 0x0000007d;
enum IDC_CI_FROMFILEEDIT = 0x0000007e;
enum IDC_CI_ICONLIST = 0x0000007f;
enum IDC_CI_LABEL = 0x00000080;
enum IDC_CI_LABELEDIT = 0x00000081;
enum IDC_CI_BROWSE = 0x00000082;
enum IDC_CI_ICONDISPLAY = 0x00000083;
enum IDC_CV_OBJECTTYPE = 0x00000096;
enum IDC_CV_DISPLAYASICON = 0x00000098;
enum IDC_CV_CHANGEICON = 0x00000099;
enum IDC_CV_ACTIVATELIST = 0x0000009a;
enum IDC_CV_CONVERTTO = 0x0000009b;
enum IDC_CV_ACTIVATEAS = 0x0000009c;
enum IDC_CV_RESULTTEXT = 0x0000009d;
enum IDC_CV_CONVERTLIST = 0x0000009e;
enum IDC_CV_ICONDISPLAY = 0x000000a5;
enum IDC_EL_CHANGESOURCE = 0x000000c9;
enum IDC_EL_AUTOMATIC = 0x000000ca;
enum IDC_EL_CANCELLINK = 0x000000d1;
enum IDC_EL_UPDATENOW = 0x000000d2;
enum IDC_EL_OPENSOURCE = 0x000000d3;
enum IDC_EL_MANUAL = 0x000000d4;
enum IDC_EL_LINKSOURCE = 0x000000d8;
enum IDC_EL_LINKTYPE = 0x000000d9;
enum IDC_EL_LINKSLISTBOX = 0x000000ce;
enum IDC_EL_COL1 = 0x000000dc;
enum IDC_EL_COL2 = 0x000000dd;
enum IDC_EL_COL3 = 0x000000de;
enum IDC_BZ_RETRY = 0x00000258;
enum IDC_BZ_ICON = 0x00000259;
enum IDC_BZ_MESSAGE1 = 0x0000025a;
enum IDC_BZ_SWITCHTO = 0x0000025c;
enum IDC_UL_METER = 0x00000405;
enum IDC_UL_STOP = 0x00000406;
enum IDC_UL_PERCENT = 0x00000407;
enum IDC_UL_PROGRESS = 0x00000408;
enum IDC_PU_LINKS = 0x00000384;
enum IDC_PU_TEXT = 0x00000385;
enum IDC_PU_CONVERT = 0x00000386;
enum IDC_PU_ICON = 0x0000038c;
enum IDC_GP_OBJECTNAME = 0x000003f1;
enum IDC_GP_OBJECTTYPE = 0x000003f2;
enum IDC_GP_OBJECTSIZE = 0x000003f3;
enum IDC_GP_CONVERT = 0x000003f5;
enum IDC_GP_OBJECTICON = 0x000003f6;
enum IDC_GP_OBJECTLOCATION = 0x000003fe;
enum IDC_VP_PERCENT = 0x000003e8;
enum IDC_VP_CHANGEICON = 0x000003e9;
enum IDC_VP_EDITABLE = 0x000003ea;
enum IDC_VP_ASICON = 0x000003eb;
enum IDC_VP_RELATIVE = 0x000003ed;
enum IDC_VP_SPIN = 0x000003ee;
enum IDC_VP_SCALETXT = 0x0000040a;
enum IDC_VP_ICONDISPLAY = 0x000003fd;
enum IDC_VP_RESULTIMAGE = 0x00000409;
enum IDC_LP_OPENSOURCE = 0x000003ee;
enum IDC_LP_UPDATENOW = 0x000003ef;
enum IDC_LP_BREAKLINK = 0x000003f0;
enum IDC_LP_LINKSOURCE = 0x000003f4;
enum IDC_LP_CHANGESOURCE = 0x000003f7;
enum IDC_LP_AUTOMATIC = 0x000003f8;
enum IDC_LP_MANUAL = 0x000003f9;
enum IDC_LP_DATE = 0x000003fa;
enum IDC_LP_TIME = 0x000003fb;
enum IDD_INSERTOBJECT = 0x000003e8;
enum IDD_CHANGEICON = 0x000003e9;
enum IDD_CONVERT = 0x000003ea;
enum IDD_PASTESPECIAL = 0x000003eb;
enum IDD_EDITLINKS = 0x000003ec;
enum IDD_BUSY = 0x000003ee;
enum IDD_UPDATELINKS = 0x000003ef;
enum IDD_CHANGESOURCE = 0x000003f1;
enum IDD_INSERTFILEBROWSE = 0x000003f2;
enum IDD_CHANGEICONBROWSE = 0x000003f3;
enum IDD_CONVERTONLY = 0x000003f4;
enum IDD_CHANGESOURCE4 = 0x000003f5;
enum IDD_GNRLPROPS = 0x0000044c;
enum IDD_VIEWPROPS = 0x0000044d;
enum IDD_LINKPROPS = 0x0000044e;
enum IDD_CONVERT4 = 0x0000044f;
enum IDD_CONVERTONLY4 = 0x00000450;
enum IDD_EDITLINKS4 = 0x00000451;
enum IDD_GNRLPROPS4 = 0x00000452;
enum IDD_LINKPROPS4 = 0x00000453;
enum IDD_PASTESPECIAL4 = 0x00000454;
enum IDD_CANNOTUPDATELINK = 0x000003f0;
enum IDD_LINKSOURCEUNAVAILABLE = 0x000003fc;
enum IDD_SERVERNOTFOUND = 0x000003ff;
enum IDD_OUTOFMEMORY = 0x00000400;
enum IDD_SERVERNOTREGW = 0x000003fd;
enum IDD_LINKTYPECHANGEDW = 0x000003fe;
enum IDD_SERVERNOTREGA = 0x00000401;
enum IDD_LINKTYPECHANGEDA = 0x00000402;
enum IDD_SERVERNOTREG = 0x000003fd;
enum IDD_LINKTYPECHANGED = 0x000003fe;
enum OLESTDDELIM = "\\";
enum SZOLEUI_MSG_HELP = "OLEUI_MSG_HELP";
enum SZOLEUI_MSG_ENDDIALOG = "OLEUI_MSG_ENDDIALOG";
enum SZOLEUI_MSG_BROWSE = "OLEUI_MSG_BROWSE";
enum SZOLEUI_MSG_CHANGEICON = "OLEUI_MSG_CHANGEICON";
enum SZOLEUI_MSG_CLOSEBUSYDIALOG = "OLEUI_MSG_CLOSEBUSYDIALOG";
enum SZOLEUI_MSG_CONVERT = "OLEUI_MSG_CONVERT";
enum SZOLEUI_MSG_CHANGESOURCE = "OLEUI_MSG_CHANGESOURCE";
enum SZOLEUI_MSG_ADDCONTROL = "OLEUI_MSG_ADDCONTROL";
enum SZOLEUI_MSG_BROWSE_OFN = "OLEUI_MSG_BROWSE_OFN";
enum ID_BROWSE_CHANGEICON = 0x00000001;
enum ID_BROWSE_INSERTFILE = 0x00000002;
enum ID_BROWSE_ADDCONTROL = 0x00000003;
enum ID_BROWSE_CHANGESOURCE = 0x00000004;
enum OLEUI_FALSE = 0x00000000;
enum OLEUI_SUCCESS = 0x00000001;
enum OLEUI_OK = 0x00000001;
enum OLEUI_CANCEL = 0x00000002;
enum OLEUI_ERR_STANDARDMIN = 0x00000064;
enum OLEUI_ERR_OLEMEMALLOC = 0x00000064;
enum OLEUI_ERR_STRUCTURENULL = 0x00000065;
enum OLEUI_ERR_STRUCTUREINVALID = 0x00000066;
enum OLEUI_ERR_CBSTRUCTINCORRECT = 0x00000067;
enum OLEUI_ERR_HWNDOWNERINVALID = 0x00000068;
enum OLEUI_ERR_LPSZCAPTIONINVALID = 0x00000069;
enum OLEUI_ERR_LPFNHOOKINVALID = 0x0000006a;
enum OLEUI_ERR_HINSTANCEINVALID = 0x0000006b;
enum OLEUI_ERR_LPSZTEMPLATEINVALID = 0x0000006c;
enum OLEUI_ERR_HRESOURCEINVALID = 0x0000006d;
enum OLEUI_ERR_FINDTEMPLATEFAILURE = 0x0000006e;
enum OLEUI_ERR_LOADTEMPLATEFAILURE = 0x0000006f;
enum OLEUI_ERR_DIALOGFAILURE = 0x00000070;
enum OLEUI_ERR_LOCALMEMALLOC = 0x00000071;
enum OLEUI_ERR_GLOBALMEMALLOC = 0x00000072;
enum OLEUI_ERR_LOADSTRING = 0x00000073;
enum OLEUI_ERR_STANDARDMAX = 0x00000074;
enum OLEUI_IOERR_LPSZFILEINVALID = 0x00000074;
enum OLEUI_IOERR_LPSZLABELINVALID = 0x00000075;
enum OLEUI_IOERR_HICONINVALID = 0x00000076;
enum OLEUI_IOERR_LPFORMATETCINVALID = 0x00000077;
enum OLEUI_IOERR_PPVOBJINVALID = 0x00000078;
enum OLEUI_IOERR_LPIOLECLIENTSITEINVALID = 0x00000079;
enum OLEUI_IOERR_LPISTORAGEINVALID = 0x0000007a;
enum OLEUI_IOERR_SCODEHASERROR = 0x0000007b;
enum OLEUI_IOERR_LPCLSIDEXCLUDEINVALID = 0x0000007c;
enum OLEUI_IOERR_CCHFILEINVALID = 0x0000007d;
enum PS_MAXLINKTYPES = 0x00000008;
enum OLEUI_IOERR_SRCDATAOBJECTINVALID = 0x00000074;
enum OLEUI_IOERR_ARRPASTEENTRIESINVALID = 0x00000075;
enum OLEUI_IOERR_ARRLINKTYPESINVALID = 0x00000076;
enum OLEUI_PSERR_CLIPBOARDCHANGED = 0x00000077;
enum OLEUI_PSERR_GETCLIPBOARDFAILED = 0x00000078;
enum OLEUI_ELERR_LINKCNTRNULL = 0x00000074;
enum OLEUI_ELERR_LINKCNTRINVALID = 0x00000075;
enum OLEUI_CIERR_MUSTHAVECLSID = 0x00000074;
enum OLEUI_CIERR_MUSTHAVECURRENTMETAFILE = 0x00000075;
enum OLEUI_CIERR_SZICONEXEINVALID = 0x00000076;
enum PROP_HWND_CHGICONDLG = "HWND_CIDLG";
enum OLEUI_CTERR_CLASSIDINVALID = 0x00000075;
enum OLEUI_CTERR_DVASPECTINVALID = 0x00000076;
enum OLEUI_CTERR_CBFORMATINVALID = 0x00000077;
enum OLEUI_CTERR_HMETAPICTINVALID = 0x00000078;
enum OLEUI_CTERR_STRINGINVALID = 0x00000079;
enum OLEUI_BZERR_HTASKINVALID = 0x00000074;
enum OLEUI_BZ_SWITCHTOSELECTED = 0x00000075;
enum OLEUI_BZ_RETRYSELECTED = 0x00000076;
enum OLEUI_BZ_CALLUNBLOCKED = 0x00000077;
enum OLEUI_CSERR_LINKCNTRNULL = 0x00000074;
enum OLEUI_CSERR_LINKCNTRINVALID = 0x00000075;
enum OLEUI_CSERR_FROMNOTNULL = 0x00000076;
enum OLEUI_CSERR_TONOTNULL = 0x00000077;
enum OLEUI_CSERR_SOURCENULL = 0x00000078;
enum OLEUI_CSERR_SOURCEINVALID = 0x00000079;
enum OLEUI_CSERR_SOURCEPARSERROR = 0x0000007a;
enum OLEUI_CSERR_SOURCEPARSEERROR = 0x0000007a;
enum OLEUI_OPERR_SUBPROPNULL = 0x00000074;
enum OLEUI_OPERR_SUBPROPINVALID = 0x00000075;
enum OLEUI_OPERR_PROPSHEETNULL = 0x00000076;
enum OLEUI_OPERR_PROPSHEETINVALID = 0x00000077;
enum OLEUI_OPERR_SUPPROP = 0x00000078;
enum OLEUI_OPERR_PROPSINVALID = 0x00000079;
enum OLEUI_OPERR_PAGESINCORRECT = 0x0000007a;
enum OLEUI_OPERR_INVALIDPAGES = 0x0000007b;
enum OLEUI_OPERR_NOTSUPPORTED = 0x0000007c;
enum OLEUI_OPERR_DLGPROCNOTNULL = 0x0000007d;
enum OLEUI_OPERR_LPARAMNOTZERO = 0x0000007e;
enum OLEUI_GPERR_STRINGINVALID = 0x0000007f;
enum OLEUI_GPERR_CLASSIDINVALID = 0x00000080;
enum OLEUI_GPERR_LPCLSIDEXCLUDEINVALID = 0x00000081;
enum OLEUI_GPERR_CBFORMATINVALID = 0x00000082;
enum OLEUI_VPERR_METAPICTINVALID = 0x00000083;
enum OLEUI_VPERR_DVASPECTINVALID = 0x00000084;
enum OLEUI_LPERR_LINKCNTRNULL = 0x00000085;
enum OLEUI_LPERR_LINKCNTRINVALID = 0x00000086;
enum OLEUI_OPERR_PROPERTYSHEET = 0x00000087;
enum OLEUI_OPERR_OBJINFOINVALID = 0x00000088;
enum OLEUI_OPERR_LINKINFOINVALID = 0x00000089;
enum OLEUI_QUERY_GETCLASSID = 0x0000ff00;
enum OLEUI_QUERY_LINKBROKEN = 0x0000ff01;
enum DISPID_UNKNOWN = 0xffffffffffffffff;
enum DISPID_VALUE = 0x00000000;
enum DISPID_PROPERTYPUT = 0xfffffffffffffffd;
enum DISPID_NEWENUM = 0xfffffffffffffffc;
enum DISPID_EVALUATE = 0xfffffffffffffffb;
enum DISPID_CONSTRUCTOR = 0xfffffffffffffffa;
enum DISPID_DESTRUCTOR = 0xfffffffffffffff9;
enum DISPID_COLLECT = 0xfffffffffffffff8;
enum STDOLE_MAJORVERNUM = 0x00000001;
enum STDOLE_MINORVERNUM = 0x00000000;
enum STDOLE_LCID = 0x00000000;
enum STDOLE2_MAJORVERNUM = 0x00000002;
enum STDOLE2_MINORVERNUM = 0x00000000;
enum STDOLE2_LCID = 0x00000000;
enum VAR_TIMEVALUEONLY = 0x00000001;
enum VAR_DATEVALUEONLY = 0x00000002;
enum VAR_VALIDDATE = 0x00000004;
enum VAR_CALENDAR_HIJRI = 0x00000008;
enum VAR_LOCALBOOL = 0x00000010;
enum VAR_FORMAT_NOSUBSTITUTE = 0x00000020;
enum VAR_FOURDIGITYEARS = 0x00000040;
enum LOCALE_USE_NLS = 0x10000000;
enum VAR_CALENDAR_THAI = 0x00000080;
enum VAR_CALENDAR_GREGORIAN = 0x00000100;
enum VTDATEGRE_MAX = 0x002d2481;
enum VTDATEGRE_MIN = 0xfffffffffff5f7e6;
enum MEMBERID_NIL = 0xffffffffffffffff;
enum ID_DEFAULTINST = 0xfffffffffffffffe;
enum LOAD_TLB_AS_32BIT = 0x00000020;
enum LOAD_TLB_AS_64BIT = 0x00000040;
enum fdexNameCaseSensitive = 0x00000001;
enum fdexNameEnsure = 0x00000002;
enum fdexNameImplicit = 0x00000004;
enum fdexNameCaseInsensitive = 0x00000008;
enum fdexNameInternal = 0x00000010;
enum fdexNameNoDynamicProperties = 0x00000020;
enum fdexEnumDefault = 0x00000001;
enum fdexEnumAll = 0x00000002;
enum DISPATCH_CONSTRUCT = 0x00004000;
enum DISPID_STARTENUM = 0xffffffffffffffff;
enum SID_VariantConversion = GUID(0x1f101481, 0xbccd, 0x11d0, [0x93, 0x36, 0x0, 0xa0, 0xc9, 0xd, 0xca, 0xa9]);
enum SID_GetCaller = GUID(0x4717cc40, 0xbcb9, 0x11d0, [0x93, 0x36, 0x0, 0xa0, 0xc9, 0xd, 0xca, 0xa9]);
enum SID_ProvideRuntimeContext = GUID(0x74a5040c, 0xdd0c, 0x48f0, [0xac, 0x85, 0x19, 0x4c, 0x32, 0x59, 0x18, 0xa]);
alias CLIPBOARD_FORMAT = ushort;
enum : ushort
{
    CF_TEXT            = 0x0001,
    CF_BITMAP          = 0x0002,
    CF_METAFILEPICT    = 0x0003,
    CF_SYLK            = 0x0004,
    CF_DIF             = 0x0005,
    CF_TIFF            = 0x0006,
    CF_OEMTEXT         = 0x0007,
    CF_DIB             = 0x0008,
    CF_PALETTE         = 0x0009,
    CF_PENDATA         = 0x000a,
    CF_RIFF            = 0x000b,
    CF_WAVE            = 0x000c,
    CF_UNICODETEXT     = 0x000d,
    CF_ENHMETAFILE     = 0x000e,
    CF_HDROP           = 0x000f,
    CF_LOCALE          = 0x0010,
    CF_DIBV5           = 0x0011,
    CF_MAX             = 0x0012,
    CF_OWNERDISPLAY    = 0x0080,
    CF_DSPTEXT         = 0x0081,
    CF_DSPBITMAP       = 0x0082,
    CF_DSPMETAFILEPICT = 0x0083,
    CF_DSPENHMETAFILE  = 0x008e,
    CF_PRIVATEFIRST    = 0x0200,
    CF_PRIVATELAST     = 0x02ff,
    CF_GDIOBJFIRST     = 0x0300,
    CF_GDIOBJLAST      = 0x03ff,
}

alias OLEIVERB = int;
enum : int
{
    OLEIVERB_PRIMARY          = 0x00000000,
    OLEIVERB_SHOW             = 0xffffffff,
    OLEIVERB_OPEN             = 0xfffffffe,
    OLEIVERB_HIDE             = 0xfffffffd,
    OLEIVERB_UIACTIVATE       = 0xfffffffc,
    OLEIVERB_INPLACEACTIVATE  = 0xfffffffb,
    OLEIVERB_DISCARDUNDOSTATE = 0xfffffffa,
}

alias UPDFCACHE_FLAGS = uint;
enum : uint
{
    UPDFCACHE_ALL                  = 0x7fffffff,
    UPDFCACHE_ALLBUTNODATACACHE    = 0x7ffffffe,
    UPDFCACHE_NORMALCACHE          = 0x00000008,
    UPDFCACHE_IFBLANK              = 0x00000010,
    UPDFCACHE_ONLYIFBLANK          = 0x80000000,
    UPDFCACHE_NODATACACHE          = 0x00000001,
    UPDFCACHE_ONSAVECACHE          = 0x00000002,
    UPDFCACHE_ONSTOPCACHE          = 0x00000004,
    UPDFCACHE_IFBLANKORONSAVECACHE = 0x00000012,
}

alias ENUM_CONTROLS_WHICH_FLAGS = uint;
enum : uint
{
    GCW_WCH_SIBLING    = 0x00000001,
    GC_WCH_CONTAINER   = 0x00000002,
    GC_WCH_CONTAINED   = 0x00000003,
    GC_WCH_ALL         = 0x00000004,
    GC_WCH_FREVERSEDIR = 0x08000000,
    GC_WCH_FONLYAFTER  = 0x10000000,
    GC_WCH_FONLYBEFORE = 0x20000000,
    GC_WCH_FSELECTED   = 0x40000000,
}

alias MULTICLASSINFO_FLAGS = uint;
enum : uint
{
    MULTICLASSINFO_GETTYPEINFO           = 0x00000001,
    MULTICLASSINFO_GETNUMRESERVEDDISPIDS = 0x00000002,
    MULTICLASSINFO_GETIIDPRIMARY         = 0x00000004,
    MULTICLASSINFO_GETIIDSOURCE          = 0x00000008,
}

alias DROPEFFECT = uint;
enum : uint
{
    DROPEFFECT_NONE   = 0x00000000,
    DROPEFFECT_COPY   = 0x00000001,
    DROPEFFECT_MOVE   = 0x00000002,
    DROPEFFECT_LINK   = 0x00000004,
    DROPEFFECT_SCROLL = 0x80000000,
}

alias KEYMODIFIERS = uint;
enum : uint
{
    KEYMOD_SHIFT   = 0x00000001,
    KEYMOD_CONTROL = 0x00000002,
    KEYMOD_ALT     = 0x00000004,
}

alias ACTIVEOBJECT_FLAGS = uint;
enum : uint
{
    ACTIVEOBJECT_STRONG = 0x00000000,
    ACTIVEOBJECT_WEAK   = 0x00000001,
}

alias BUSY_DIALOG_FLAGS = uint;
enum : uint
{
    BZ_DISABLECANCELBUTTON   = 0x00000001,
    BZ_DISABLESWITCHTOBUTTON = 0x00000002,
    BZ_DISABLERETRYBUTTON    = 0x00000004,
    BZ_NOTRESPONDINGDIALOG   = 0x00000008,
}

alias UI_CONVERT_FLAGS = uint;
enum : uint
{
    CF_SHOWHELPBUTTON       = 0x00000001,
    CF_SETCONVERTDEFAULT    = 0x00000002,
    CF_SETACTIVATEDEFAULT   = 0x00000004,
    CF_SELECTCONVERTTO      = 0x00000008,
    CF_SELECTACTIVATEAS     = 0x00000010,
    CF_DISABLEDISPLAYASICON = 0x00000020,
    CF_DISABLEACTIVATEAS    = 0x00000040,
    CF_HIDECHANGEICON       = 0x00000080,
    CF_CONVERTONLY          = 0x00000100,
}

alias CHANGE_ICON_FLAGS = uint;
enum : uint
{
    CIF_SHOWHELP       = 0x00000001,
    CIF_SELECTCURRENT  = 0x00000002,
    CIF_SELECTDEFAULT  = 0x00000004,
    CIF_SELECTFROMFILE = 0x00000008,
    CIF_USEICONEXE     = 0x00000010,
}

alias CHANGE_SOURCE_FLAGS = uint;
enum : uint
{
    CSF_SHOWHELP      = 0x00000001,
    CSF_VALIDSOURCE   = 0x00000002,
    CSF_ONLYGETSOURCE = 0x00000004,
    CSF_EXPLORER      = 0x00000008,
}

alias EDIT_LINKS_FLAGS = uint;
enum : uint
{
    ELF_SHOWHELP            = 0x00000001,
    ELF_DISABLEUPDATENOW    = 0x00000002,
    ELF_DISABLEOPENSOURCE   = 0x00000004,
    ELF_DISABLECHANGESOURCE = 0x00000008,
    ELF_DISABLECANCELLINK   = 0x00000010,
}

alias INSERT_OBJECT_FLAGS = uint;
enum : uint
{
    IOF_SHOWHELP             = 0x00000001,
    IOF_SELECTCREATENEW      = 0x00000002,
    IOF_SELECTCREATEFROMFILE = 0x00000004,
    IOF_CHECKLINK            = 0x00000008,
    IOF_CHECKDISPLAYASICON   = 0x00000010,
    IOF_CREATENEWOBJECT      = 0x00000020,
    IOF_CREATEFILEOBJECT     = 0x00000040,
    IOF_CREATELINKOBJECT     = 0x00000080,
    IOF_DISABLELINK          = 0x00000100,
    IOF_VERIFYSERVERSEXIST   = 0x00000200,
    IOF_DISABLEDISPLAYASICON = 0x00000400,
    IOF_HIDECHANGEICON       = 0x00000800,
    IOF_SHOWINSERTCONTROL    = 0x00001000,
    IOF_SELECTCREATECONTROL  = 0x00002000,
}

alias OBJECT_PROPERTIES_FLAGS = uint;
enum : uint
{
    OPF_OBJECTISLINK   = 0x00000001,
    OPF_NOFILLDEFAULT  = 0x00000002,
    OPF_SHOWHELP       = 0x00000004,
    OPF_DISABLECONVERT = 0x00000008,
}

alias VIEW_OBJECT_PROPERTIES_FLAGS = uint;
enum : uint
{
    VPF_SELECTRELATIVE  = 0x00000001,
    VPF_DISABLERELATIVE = 0x00000002,
    VPF_DISABLESCALE    = 0x00000004,
}

alias PARAMFLAGS = ushort;
enum : ushort
{
    PARAMFLAG_NONE         = 0x0000,
    PARAMFLAG_FIN          = 0x0001,
    PARAMFLAG_FOUT         = 0x0002,
    PARAMFLAG_FLCID        = 0x0004,
    PARAMFLAG_FRETVAL      = 0x0008,
    PARAMFLAG_FOPT         = 0x0010,
    PARAMFLAG_FHASDEFAULT  = 0x0020,
    PARAMFLAG_FHASCUSTDATA = 0x0040,
}

alias NUMPARSE_FLAGS = uint;
enum : uint
{
    NUMPRS_LEADING_WHITE  = 0x00000001,
    NUMPRS_TRAILING_WHITE = 0x00000002,
    NUMPRS_LEADING_PLUS   = 0x00000004,
    NUMPRS_TRAILING_PLUS  = 0x00000008,
    NUMPRS_LEADING_MINUS  = 0x00000010,
    NUMPRS_TRAILING_MINUS = 0x00000020,
    NUMPRS_HEX_OCT        = 0x00000040,
    NUMPRS_PARENS         = 0x00000080,
    NUMPRS_DECIMAL        = 0x00000100,
    NUMPRS_THOUSANDS      = 0x00000200,
    NUMPRS_CURRENCY       = 0x00000400,
    NUMPRS_EXPONENT       = 0x00000800,
    NUMPRS_USE_ALL        = 0x00001000,
    NUMPRS_STD            = 0x00001fff,
    NUMPRS_NEG            = 0x00010000,
    NUMPRS_INEXACT        = 0x00020000,
}

alias PICTYPE = short;
enum : short
{
    PICTYPE_UNINITIALIZED = cast(short)0xffff,
    PICTYPE_NONE          = 0x0000,
    PICTYPE_BITMAP        = 0x0001,
    PICTYPE_METAFILE      = 0x0002,
    PICTYPE_ICON          = 0x0003,
    PICTYPE_ENHMETAFILE   = 0x0004,
}

alias VARCMP = uint;
enum : uint
{
    VARCMP_LT   = 0x00000000,
    VARCMP_EQ   = 0x00000001,
    VARCMP_GT   = 0x00000002,
    VARCMP_NULL = 0x00000003,
}

alias PASTE_SPECIAL_FLAGS = uint;
enum : uint
{
    PSF_SHOWHELP              = 0x00000001,
    PSF_SELECTPASTE           = 0x00000002,
    PSF_SELECTPASTELINK       = 0x00000004,
    PSF_CHECKDISPLAYASICON    = 0x00000008,
    PSF_DISABLEDISPLAYASICON  = 0x00000010,
    PSF_HIDECHANGEICON        = 0x00000020,
    PSF_STAYONCLIPBOARDCHANGE = 0x00000040,
    PSF_NOREFRESHDATAOBJECT   = 0x00000080,
}

alias EMBDHLP_FLAGS = uint;
enum : uint
{
    EMBDHLP_INPROC_HANDLER = 0x00000000,
    EMBDHLP_INPROC_SERVER  = 0x00000001,
    EMBDHLP_CREATENOW      = 0x00000000,
    EMBDHLP_DELAYCREATE    = 0x00010000,
}

alias FDEX_PROP_FLAGS = uint;
enum : uint
{
    fdexPropCanGet             = 0x00000001,
    fdexPropCannotGet          = 0x00000002,
    fdexPropCanPut             = 0x00000004,
    fdexPropCannotPut          = 0x00000008,
    fdexPropCanPutRef          = 0x00000010,
    fdexPropCannotPutRef       = 0x00000020,
    fdexPropNoSideEffects      = 0x00000040,
    fdexPropDynamicType        = 0x00000080,
    fdexPropCanCall            = 0x00000100,
    fdexPropCannotCall         = 0x00000200,
    fdexPropCanConstruct       = 0x00000400,
    fdexPropCannotConstruct    = 0x00000800,
    fdexPropCanSourceEvents    = 0x00001000,
    fdexPropCannotSourceEvents = 0x00002000,
}

alias LOAD_PICTURE_FLAGS = uint;
enum : uint
{
    LP_DEFAULT    = 0x00000000,
    LP_MONOCHROME = 0x00000001,
    LP_VGACOLOR   = 0x00000002,
    LP_COLOR      = 0x00000004,
}

alias OLECREATE = uint;
enum : uint
{
    OLECREATE_ZERO         = 0x00000000,
    OLECREATE_LEAVERUNNING = 0x00000001,
}

alias VARFORMAT_FIRST_DAY = int;
enum : int
{
    VARFORMAT_FIRST_DAY_SYSTEMDEFAULT = 0x00000000,
    VARFORMAT_FIRST_DAY_MONDAY        = 0x00000001,
    VARFORMAT_FIRST_DAY_TUESDAY       = 0x00000002,
    VARFORMAT_FIRST_DAY_WEDNESDAY     = 0x00000003,
    VARFORMAT_FIRST_DAY_THURSDAY      = 0x00000004,
    VARFORMAT_FIRST_DAY_FRIDAY        = 0x00000005,
    VARFORMAT_FIRST_DAY_SATURDAY      = 0x00000006,
    VARFORMAT_FIRST_DAY_SUNDAY        = 0x00000007,
}

alias VARFORMAT_FIRST_WEEK = int;
enum : int
{
    VARFORMAT_FIRST_WEEK_SYSTEMDEFAULT               = 0x00000000,
    VARFORMAT_FIRST_WEEK_CONTAINS_JANUARY_FIRST      = 0x00000001,
    VARFORMAT_FIRST_WEEK_LARGER_HALF_IN_CURRENT_YEAR = 0x00000002,
    VARFORMAT_FIRST_WEEK_HAS_SEVEN_DAYS              = 0x00000003,
}

alias VARFORMAT_NAMED_FORMAT = int;
enum : int
{
    VARFORMAT_NAMED_FORMAT_GENERALDATE = 0x00000000,
    VARFORMAT_NAMED_FORMAT_LONGDATE    = 0x00000001,
    VARFORMAT_NAMED_FORMAT_SHORTDATE   = 0x00000002,
    VARFORMAT_NAMED_FORMAT_LONGTIME    = 0x00000003,
    VARFORMAT_NAMED_FORMAT_SHORTTIME   = 0x00000004,
}

alias VARFORMAT_LEADING_DIGIT = int;
enum : int
{
    VARFORMAT_LEADING_DIGIT_SYSTEMDEFAULT = 0xfffffffe,
    VARFORMAT_LEADING_DIGIT_INCLUDED      = 0xffffffff,
    VARFORMAT_LEADING_DIGIT_NOTINCLUDED   = 0x00000000,
}

alias VARFORMAT_PARENTHESES = int;
enum : int
{
    VARFORMAT_PARENTHESES_SYSTEMDEFAULT = 0xfffffffe,
    VARFORMAT_PARENTHESES_USED          = 0xffffffff,
    VARFORMAT_PARENTHESES_NOTUSED       = 0x00000000,
}

alias VARFORMAT_GROUP = int;
enum : int
{
    VARFORMAT_GROUP_SYSTEMDEFAULT = 0xfffffffe,
    VARFORMAT_GROUP_THOUSANDS     = 0xffffffff,
    VARFORMAT_GROUP_NOTTHOUSANDS  = 0x00000000,
}

alias OLE_HANDLE = uint;
struct SAFEARR_BSTR
{
    uint Size;
    FLAGGED_WORD_BLOB** aBstr;
}
struct SAFEARR_UNKNOWN
{
    uint Size;
    IUnknown* apUnknown;
}
struct SAFEARR_DISPATCH
{
    uint Size;
    IDispatch* apDispatch;
}
struct SAFEARR_VARIANT
{
    uint Size;
    _wireVARIANT** aVariant;
}
struct SAFEARR_BRECORD
{
    uint Size;
    _wireBRECORD** aRecord;
}
struct SAFEARR_HAVEIID
{
    uint Size;
    IUnknown* apUnknown;
    GUID iid;
}
alias SF_TYPE = int;
enum : int
{
    SF_ERROR    = 0x0000000a,
    SF_I1       = 0x00000010,
    SF_I2       = 0x00000002,
    SF_I4       = 0x00000003,
    SF_I8       = 0x00000014,
    SF_BSTR     = 0x00000008,
    SF_UNKNOWN  = 0x0000000d,
    SF_DISPATCH = 0x00000009,
    SF_VARIANT  = 0x0000000c,
    SF_RECORD   = 0x00000024,
    SF_HAVEIID  = 0x0000800d,
}

struct SAFEARRAYUNION
{
    uint sfType;
    union _u_e__Struct
    {
        SAFEARR_BSTR BstrStr;
        SAFEARR_UNKNOWN UnknownStr;
        SAFEARR_DISPATCH DispatchStr;
        SAFEARR_VARIANT VariantStr;
        SAFEARR_BRECORD RecordStr;
        SAFEARR_HAVEIID HaveIidStr;
        BYTE_SIZEDARR ByteStr;
        WORD_SIZEDARR WordStr;
        DWORD_SIZEDARR LongStr;
        HYPER_SIZEDARR HyperStr;
    }
}
struct _wireSAFEARRAY
{
    ushort cDims;
    ushort fFeatures;
    uint cbElements;
    uint cLocks;
    SAFEARRAYUNION uArrayStructs;
    SAFEARRAYBOUND[1] rgsabound;
}
struct _wireBRECORD
{
    uint fFlags;
    uint clSize;
    IRecordInfo pRecInfo;
    ubyte* pRecord;
}
struct _wireVARIANT
{
    uint clSize;
    uint rpcReserved;
    ushort vt;
    ushort wReserved1;
    ushort wReserved2;
    ushort wReserved3;
    union
    {
        long llVal;
        int lVal;
        ubyte bVal;
        short iVal;
        float fltVal;
        double dblVal;
        VARIANT_BOOL boolVal;
        int scode;
        CY cyVal;
        double date;
        FLAGGED_WORD_BLOB* bstrVal;
        IUnknown punkVal;
        IDispatch pdispVal;
        _wireSAFEARRAY** parray;
        _wireBRECORD* brecVal;
        ubyte* pbVal;
        short* piVal;
        int* plVal;
        long* pllVal;
        float* pfltVal;
        double* pdblVal;
        VARIANT_BOOL* pboolVal;
        int* pscode;
        CY* pcyVal;
        double* pdate;
        FLAGGED_WORD_BLOB** pbstrVal;
        IUnknown* ppunkVal;
        IDispatch* ppdispVal;
        _wireSAFEARRAY*** pparray;
        _wireVARIANT** pvarVal;
        CHAR cVal;
        ushort uiVal;
        uint ulVal;
        ulong ullVal;
        int intVal;
        uint uintVal;
        DECIMAL decVal;
        DECIMAL* pdecVal;
        PSTR pcVal;
        ushort* puiVal;
        uint* pulVal;
        ulong* pullVal;
        int* pintVal;
        uint* puintVal;
    }
}
struct ARRAYDESC
{
    TYPEDESC tdescElem;
    ushort cDims;
    SAFEARRAYBOUND[1] rgbounds;
}
struct PARAMDESCEX
{
    uint cBytes;
    VARIANT varDefaultValue;
}
struct PARAMDESC
{
    PARAMDESCEX* pparamdescex;
    PARAMFLAGS wParamFlags;
}
alias TYPEFLAGS = int;
enum : int
{
    TYPEFLAG_FAPPOBJECT     = 0x00000001,
    TYPEFLAG_FCANCREATE     = 0x00000002,
    TYPEFLAG_FLICENSED      = 0x00000004,
    TYPEFLAG_FPREDECLID     = 0x00000008,
    TYPEFLAG_FHIDDEN        = 0x00000010,
    TYPEFLAG_FCONTROL       = 0x00000020,
    TYPEFLAG_FDUAL          = 0x00000040,
    TYPEFLAG_FNONEXTENSIBLE = 0x00000080,
    TYPEFLAG_FOLEAUTOMATION = 0x00000100,
    TYPEFLAG_FRESTRICTED    = 0x00000200,
    TYPEFLAG_FAGGREGATABLE  = 0x00000400,
    TYPEFLAG_FREPLACEABLE   = 0x00000800,
    TYPEFLAG_FDISPATCHABLE  = 0x00001000,
    TYPEFLAG_FREVERSEBIND   = 0x00002000,
    TYPEFLAG_FPROXY         = 0x00004000,
}

struct CLEANLOCALSTORAGE
{
    IUnknown pInterface;
    void* pStorage;
    uint flags;
}
enum IID_ICreateTypeInfo = GUID(0x20405, 0x0, 0x0, [0xc0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x46]);
interface ICreateTypeInfo : IUnknown
{
    HRESULT SetGuid(const(GUID)*);
    HRESULT SetTypeFlags(uint);
    HRESULT SetDocString(PWSTR);
    HRESULT SetHelpContext(uint);
    HRESULT SetVersion(ushort, ushort);
    HRESULT AddRefTypeInfo(ITypeInfo, uint*);
    HRESULT AddFuncDesc(uint, FUNCDESC*);
    HRESULT AddImplType(uint, uint);
    HRESULT SetImplTypeFlags(uint, IMPLTYPEFLAGS);
    HRESULT SetAlignment(ushort);
    HRESULT SetSchema(PWSTR);
    HRESULT AddVarDesc(uint, VARDESC*);
    HRESULT SetFuncAndParamNames(uint, PWSTR*, uint);
    HRESULT SetVarName(uint, PWSTR);
    HRESULT SetTypeDescAlias(TYPEDESC*);
    HRESULT DefineFuncAsDllEntry(uint, PWSTR, PWSTR);
    HRESULT SetFuncDocString(uint, PWSTR);
    HRESULT SetVarDocString(uint, PWSTR);
    HRESULT SetFuncHelpContext(uint, uint);
    HRESULT SetVarHelpContext(uint, uint);
    HRESULT SetMops(uint, BSTR);
    HRESULT SetTypeIdldesc(IDLDESC*);
    HRESULT LayOut();
}
enum IID_ICreateTypeInfo2 = GUID(0x2040e, 0x0, 0x0, [0xc0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x46]);
interface ICreateTypeInfo2 : ICreateTypeInfo
{
    HRESULT DeleteFuncDesc(uint);
    HRESULT DeleteFuncDescByMemId(int, INVOKEKIND);
    HRESULT DeleteVarDesc(uint);
    HRESULT DeleteVarDescByMemId(int);
    HRESULT DeleteImplType(uint);
    HRESULT SetCustData(const(GUID)*, VARIANT*);
    HRESULT SetFuncCustData(uint, const(GUID)*, VARIANT*);
    HRESULT SetParamCustData(uint, uint, const(GUID)*, VARIANT*);
    HRESULT SetVarCustData(uint, const(GUID)*, VARIANT*);
    HRESULT SetImplTypeCustData(uint, const(GUID)*, VARIANT*);
    HRESULT SetHelpStringContext(uint);
    HRESULT SetFuncHelpStringContext(uint, uint);
    HRESULT SetVarHelpStringContext(uint, uint);
    HRESULT Invalidate();
    HRESULT SetName(PWSTR);
}
enum IID_ICreateTypeLib = GUID(0x20406, 0x0, 0x0, [0xc0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x46]);
interface ICreateTypeLib : IUnknown
{
    HRESULT CreateTypeInfo(PWSTR, TYPEKIND, ICreateTypeInfo*);
    HRESULT SetName(PWSTR);
    HRESULT SetVersion(ushort, ushort);
    HRESULT SetGuid(const(GUID)*);
    HRESULT SetDocString(PWSTR);
    HRESULT SetHelpFileName(PWSTR);
    HRESULT SetHelpContext(uint);
    HRESULT SetLcid(uint);
    HRESULT SetLibFlags(uint);
    HRESULT SaveAllChanges();
}
enum IID_ICreateTypeLib2 = GUID(0x2040f, 0x0, 0x0, [0xc0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x46]);
interface ICreateTypeLib2 : ICreateTypeLib
{
    HRESULT DeleteTypeInfo(PWSTR);
    HRESULT SetCustData(const(GUID)*, VARIANT*);
    HRESULT SetHelpStringContext(uint);
    HRESULT SetHelpStringDll(PWSTR);
}
enum IID_IEnumVARIANT = GUID(0x20404, 0x0, 0x0, [0xc0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x46]);
interface IEnumVARIANT : IUnknown
{
    HRESULT Next(uint, VARIANT*, uint*);
    HRESULT Skip(uint);
    HRESULT Reset();
    HRESULT Clone(IEnumVARIANT*);
}
alias LIBFLAGS = int;
enum : int
{
    LIBFLAG_FRESTRICTED   = 0x00000001,
    LIBFLAG_FCONTROL      = 0x00000002,
    LIBFLAG_FHIDDEN       = 0x00000004,
    LIBFLAG_FHASDISKIMAGE = 0x00000008,
}

alias CHANGEKIND = int;
enum : int
{
    CHANGEKIND_ADDMEMBER        = 0x00000000,
    CHANGEKIND_DELETEMEMBER     = 0x00000001,
    CHANGEKIND_SETNAMES         = 0x00000002,
    CHANGEKIND_SETDOCUMENTATION = 0x00000003,
    CHANGEKIND_GENERAL          = 0x00000004,
    CHANGEKIND_INVALIDATE       = 0x00000005,
    CHANGEKIND_CHANGEFAILED     = 0x00000006,
    CHANGEKIND_MAX              = 0x00000007,
}

enum IID_ITypeChangeEvents = GUID(0x20410, 0x0, 0x0, [0xc0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x46]);
interface ITypeChangeEvents : IUnknown
{
    HRESULT RequestTypeChange(CHANGEKIND, ITypeInfo, PWSTR, int*);
    HRESULT AfterTypeChange(CHANGEKIND, ITypeInfo, PWSTR);
}
enum IID_ICreateErrorInfo = GUID(0x22f03340, 0x547d, 0x101b, [0x8e, 0x65, 0x8, 0x0, 0x2b, 0x2b, 0xd1, 0x19]);
interface ICreateErrorInfo : IUnknown
{
    HRESULT SetGUID(const(GUID)*);
    HRESULT SetSource(PWSTR);
    HRESULT SetDescription(PWSTR);
    HRESULT SetHelpFile(PWSTR);
    HRESULT SetHelpContext(uint);
}
enum IID_ITypeFactory = GUID(0x2e, 0x0, 0x0, [0xc0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x46]);
interface ITypeFactory : IUnknown
{
    HRESULT CreateFromTypeInfo(ITypeInfo, const(GUID)*, IUnknown*);
}
enum IID_ITypeMarshal = GUID(0x2d, 0x0, 0x0, [0xc0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x46]);
interface ITypeMarshal : IUnknown
{
    HRESULT Size(void*, uint, void*, uint*);
    HRESULT Marshal(void*, uint, void*, uint, ubyte*, uint*);
    HRESULT Unmarshal(void*, uint, uint, ubyte*, uint*);
    HRESULT Free(void*);
}
enum IID_IRecordInfo = GUID(0x2f, 0x0, 0x0, [0xc0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x46]);
interface IRecordInfo : IUnknown
{
    HRESULT RecordInit(void*);
    HRESULT RecordClear(void*);
    HRESULT RecordCopy(void*, void*);
    HRESULT GetGuid(GUID*);
    HRESULT GetName(BSTR*);
    HRESULT GetSize(uint*);
    HRESULT GetTypeInfo(ITypeInfo*);
    HRESULT GetField(void*, const(wchar)*, VARIANT*);
    HRESULT GetFieldNoCopy(void*, const(wchar)*, VARIANT*, void**);
    HRESULT PutField(uint, void*, const(wchar)*, VARIANT*);
    HRESULT PutFieldNoCopy(uint, void*, const(wchar)*, VARIANT*);
    HRESULT GetFieldNames(uint*, BSTR*);
    BOOL IsMatchingType(IRecordInfo);
    void* RecordCreate();
    HRESULT RecordCreateCopy(void*, void**);
    HRESULT RecordDestroy(void*);
}
enum IID_IOleAdviseHolder = GUID(0x111, 0x0, 0x0, [0xc0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x46]);
interface IOleAdviseHolder : IUnknown
{
    HRESULT Advise(IAdviseSink, uint*);
    HRESULT Unadvise(uint);
    HRESULT EnumAdvise(IEnumSTATDATA*);
    HRESULT SendOnRename(IMoniker);
    HRESULT SendOnSave();
    HRESULT SendOnClose();
}
enum IID_IOleCache = GUID(0x11e, 0x0, 0x0, [0xc0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x46]);
interface IOleCache : IUnknown
{
    HRESULT Cache(FORMATETC*, uint, uint*);
    HRESULT Uncache(uint);
    HRESULT EnumCache(IEnumSTATDATA*);
    HRESULT InitCache(IDataObject);
    HRESULT SetData(FORMATETC*, STGMEDIUM*, BOOL);
}
alias DISCARDCACHE = int;
enum : int
{
    DISCARDCACHE_SAVEIFDIRTY = 0x00000000,
    DISCARDCACHE_NOSAVE      = 0x00000001,
}

enum IID_IOleCache2 = GUID(0x128, 0x0, 0x0, [0xc0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x46]);
interface IOleCache2 : IOleCache
{
    HRESULT UpdateCache(IDataObject, UPDFCACHE_FLAGS, void*);
    HRESULT DiscardCache(uint);
}
enum IID_IOleCacheControl = GUID(0x129, 0x0, 0x0, [0xc0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x46]);
interface IOleCacheControl : IUnknown
{
    HRESULT OnRun(IDataObject);
    HRESULT OnStop();
}
enum IID_IParseDisplayName = GUID(0x11a, 0x0, 0x0, [0xc0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x46]);
interface IParseDisplayName : IUnknown
{
    HRESULT ParseDisplayName(IBindCtx, PWSTR, uint*, IMoniker*);
}
enum IID_IOleContainer = GUID(0x11b, 0x0, 0x0, [0xc0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x46]);
interface IOleContainer : IParseDisplayName
{
    HRESULT EnumObjects(uint, IEnumUnknown*);
    HRESULT LockContainer(BOOL);
}
enum IID_IOleClientSite = GUID(0x118, 0x0, 0x0, [0xc0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x46]);
interface IOleClientSite : IUnknown
{
    HRESULT SaveObject();
    HRESULT GetMoniker(uint, uint, IMoniker*);
    HRESULT GetContainer(IOleContainer*);
    HRESULT ShowObject();
    HRESULT OnShowWindow(BOOL);
    HRESULT RequestNewObjectLayout();
}
alias OLEGETMONIKER = int;
enum : int
{
    OLEGETMONIKER_ONLYIFTHERE = 0x00000001,
    OLEGETMONIKER_FORCEASSIGN = 0x00000002,
    OLEGETMONIKER_UNASSIGN    = 0x00000003,
    OLEGETMONIKER_TEMPFORUSER = 0x00000004,
}

alias OLEWHICHMK = int;
enum : int
{
    OLEWHICHMK_CONTAINER = 0x00000001,
    OLEWHICHMK_OBJREL    = 0x00000002,
    OLEWHICHMK_OBJFULL   = 0x00000003,
}

alias USERCLASSTYPE = int;
enum : int
{
    USERCLASSTYPE_FULL    = 0x00000001,
    USERCLASSTYPE_SHORT   = 0x00000002,
    USERCLASSTYPE_APPNAME = 0x00000003,
}

alias OLEMISC = int;
enum : int
{
    OLEMISC_RECOMPOSEONRESIZE            = 0x00000001,
    OLEMISC_ONLYICONIC                   = 0x00000002,
    OLEMISC_INSERTNOTREPLACE             = 0x00000004,
    OLEMISC_STATIC                       = 0x00000008,
    OLEMISC_CANTLINKINSIDE               = 0x00000010,
    OLEMISC_CANLINKBYOLE1                = 0x00000020,
    OLEMISC_ISLINKOBJECT                 = 0x00000040,
    OLEMISC_INSIDEOUT                    = 0x00000080,
    OLEMISC_ACTIVATEWHENVISIBLE          = 0x00000100,
    OLEMISC_RENDERINGISDEVICEINDEPENDENT = 0x00000200,
    OLEMISC_INVISIBLEATRUNTIME           = 0x00000400,
    OLEMISC_ALWAYSRUN                    = 0x00000800,
    OLEMISC_ACTSLIKEBUTTON               = 0x00001000,
    OLEMISC_ACTSLIKELABEL                = 0x00002000,
    OLEMISC_NOUIACTIVATE                 = 0x00004000,
    OLEMISC_ALIGNABLE                    = 0x00008000,
    OLEMISC_SIMPLEFRAME                  = 0x00010000,
    OLEMISC_SETCLIENTSITEFIRST           = 0x00020000,
    OLEMISC_IMEMODE                      = 0x00040000,
    OLEMISC_IGNOREACTIVATEWHENVISIBLE    = 0x00080000,
    OLEMISC_WANTSTOMENUMERGE             = 0x00100000,
    OLEMISC_SUPPORTSMULTILEVELUNDO       = 0x00200000,
}

alias OLECLOSE = int;
enum : int
{
    OLECLOSE_SAVEIFDIRTY = 0x00000000,
    OLECLOSE_NOSAVE      = 0x00000001,
    OLECLOSE_PROMPTSAVE  = 0x00000002,
}

enum IID_IOleObject = GUID(0x112, 0x0, 0x0, [0xc0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x46]);
interface IOleObject : IUnknown
{
    HRESULT SetClientSite(IOleClientSite);
    HRESULT GetClientSite(IOleClientSite*);
    HRESULT SetHostNames(const(wchar)*, const(wchar)*);
    HRESULT Close(uint);
    HRESULT SetMoniker(uint, IMoniker);
    HRESULT GetMoniker(uint, uint, IMoniker*);
    HRESULT InitFromData(IDataObject, BOOL, uint);
    HRESULT GetClipboardData(uint, IDataObject*);
    HRESULT DoVerb(int, MSG*, IOleClientSite, int, HWND, RECT*);
    HRESULT EnumVerbs(IEnumOLEVERB*);
    HRESULT Update();
    HRESULT IsUpToDate();
    HRESULT GetUserClassID(GUID*);
    HRESULT GetUserType(uint, PWSTR*);
    HRESULT SetExtent(DVASPECT, SIZE*);
    HRESULT GetExtent(DVASPECT, SIZE*);
    HRESULT Advise(IAdviseSink, uint*);
    HRESULT Unadvise(uint);
    HRESULT EnumAdvise(IEnumSTATDATA*);
    HRESULT GetMiscStatus(DVASPECT, OLEMISC*);
    HRESULT SetColorScheme(LOGPALETTE*);
}
alias OLERENDER = int;
enum : int
{
    OLERENDER_NONE   = 0x00000000,
    OLERENDER_DRAW   = 0x00000001,
    OLERENDER_FORMAT = 0x00000002,
    OLERENDER_ASIS   = 0x00000003,
}

struct OBJECTDESCRIPTOR
{
    uint cbSize;
    GUID clsid;
    uint dwDrawAspect;
    SIZE sizel;
    POINTL pointl;
    uint dwStatus;
    uint dwFullUserTypeName;
    uint dwSrcOfCopy;
}
enum IID_IOleWindow = GUID(0x114, 0x0, 0x0, [0xc0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x46]);
interface IOleWindow : IUnknown
{
    HRESULT GetWindow(HWND*);
    HRESULT ContextSensitiveHelp(BOOL);
}
alias OLEUPDATE = int;
enum : int
{
    OLEUPDATE_ALWAYS = 0x00000001,
    OLEUPDATE_ONCALL = 0x00000003,
}

alias OLELINKBIND = int;
enum : int
{
    OLELINKBIND_EVENIFCLASSDIFF = 0x00000001,
}

enum IID_IOleLink = GUID(0x11d, 0x0, 0x0, [0xc0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x46]);
interface IOleLink : IUnknown
{
    HRESULT SetUpdateOptions(uint);
    HRESULT GetUpdateOptions(uint*);
    HRESULT SetSourceMoniker(IMoniker, const(GUID)*);
    HRESULT GetSourceMoniker(IMoniker*);
    HRESULT SetSourceDisplayName(const(wchar)*);
    HRESULT GetSourceDisplayName(PWSTR*);
    HRESULT BindToSource(uint, IBindCtx);
    HRESULT BindIfRunning();
    HRESULT GetBoundSource(IUnknown*);
    HRESULT UnbindSource();
    HRESULT Update(IBindCtx);
}
alias BINDSPEED = int;
enum : int
{
    BINDSPEED_INDEFINITE = 0x00000001,
    BINDSPEED_MODERATE   = 0x00000002,
    BINDSPEED_IMMEDIATE  = 0x00000003,
}

alias OLECONTF = int;
enum : int
{
    OLECONTF_EMBEDDINGS    = 0x00000001,
    OLECONTF_LINKS         = 0x00000002,
    OLECONTF_OTHERS        = 0x00000004,
    OLECONTF_ONLYUSER      = 0x00000008,
    OLECONTF_ONLYIFRUNNING = 0x00000010,
}

enum IID_IOleItemContainer = GUID(0x11c, 0x0, 0x0, [0xc0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x46]);
interface IOleItemContainer : IOleContainer
{
    HRESULT GetObject(PWSTR, uint, IBindCtx, const(GUID)*, void**);
    HRESULT GetObjectStorage(PWSTR, IBindCtx, const(GUID)*, void**);
    HRESULT IsRunning(PWSTR);
}
enum IID_IOleInPlaceUIWindow = GUID(0x115, 0x0, 0x0, [0xc0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x46]);
interface IOleInPlaceUIWindow : IOleWindow
{
    HRESULT GetBorder(RECT*);
    HRESULT RequestBorderSpace(RECT*);
    HRESULT SetBorderSpace(RECT*);
    HRESULT SetActiveObject(IOleInPlaceActiveObject, const(wchar)*);
}
enum IID_IOleInPlaceActiveObject = GUID(0x117, 0x0, 0x0, [0xc0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x46]);
interface IOleInPlaceActiveObject : IOleWindow
{
    HRESULT TranslateAccelerator(MSG*);
    HRESULT OnFrameWindowActivate(BOOL);
    HRESULT OnDocWindowActivate(BOOL);
    HRESULT ResizeBorder(RECT*, IOleInPlaceUIWindow, BOOL);
    HRESULT EnableModeless(BOOL);
}
struct OLEINPLACEFRAMEINFO
{
    uint cb;
    BOOL fMDIApp;
    HWND hwndFrame;
    HACCEL haccel;
    uint cAccelEntries;
}
struct OLEMENUGROUPWIDTHS
{
    int[6] width;
}
enum IID_IOleInPlaceFrame = GUID(0x116, 0x0, 0x0, [0xc0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x46]);
interface IOleInPlaceFrame : IOleInPlaceUIWindow
{
    HRESULT InsertMenus(HMENU, OLEMENUGROUPWIDTHS*);
    HRESULT SetMenu(HMENU, long, HWND);
    HRESULT RemoveMenus(HMENU);
    HRESULT SetStatusText(const(wchar)*);
    HRESULT EnableModeless(BOOL);
    HRESULT TranslateAccelerator(MSG*, ushort);
}
enum IID_IOleInPlaceObject = GUID(0x113, 0x0, 0x0, [0xc0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x46]);
interface IOleInPlaceObject : IOleWindow
{
    HRESULT InPlaceDeactivate();
    HRESULT UIDeactivate();
    HRESULT SetObjectRects(RECT*, RECT*);
    HRESULT ReactivateAndUndo();
}
enum IID_IOleInPlaceSite = GUID(0x119, 0x0, 0x0, [0xc0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x46]);
interface IOleInPlaceSite : IOleWindow
{
    HRESULT CanInPlaceActivate();
    HRESULT OnInPlaceActivate();
    HRESULT OnUIActivate();
    HRESULT GetWindowContext(IOleInPlaceFrame*, IOleInPlaceUIWindow*, RECT*, RECT*, OLEINPLACEFRAMEINFO*);
    HRESULT Scroll(SIZE);
    HRESULT OnUIDeactivate(BOOL);
    HRESULT OnInPlaceDeactivate();
    HRESULT DiscardUndoState();
    HRESULT DeactivateAndUndo();
    HRESULT OnPosRectChange(RECT*);
}
enum IID_IContinue = GUID(0x12a, 0x0, 0x0, [0xc0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x46]);
interface IContinue : IUnknown
{
    HRESULT FContinue();
}
enum IID_IViewObject = GUID(0x10d, 0x0, 0x0, [0xc0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x46]);
interface IViewObject : IUnknown
{
    HRESULT Draw(DVASPECT, int, void*, DVTARGETDEVICE*, HDC, HDC, RECTL*, RECTL*, long, ulong);
    HRESULT GetColorSet(DVASPECT, int, void*, DVTARGETDEVICE*, HDC, LOGPALETTE**);
    HRESULT Freeze(DVASPECT, int, void*, uint*);
    HRESULT Unfreeze(uint);
    HRESULT SetAdvise(DVASPECT, uint, IAdviseSink);
    HRESULT GetAdvise(uint*, uint*, IAdviseSink*);
}
enum IID_IViewObject2 = GUID(0x127, 0x0, 0x0, [0xc0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x46]);
interface IViewObject2 : IViewObject
{
    HRESULT GetExtent(DVASPECT, int, DVTARGETDEVICE*, SIZE*);
}
enum IID_IDropSource = GUID(0x121, 0x0, 0x0, [0xc0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x46]);
interface IDropSource : IUnknown
{
    HRESULT QueryContinueDrag(BOOL, MODIFIERKEYS_FLAGS);
    HRESULT GiveFeedback(DROPEFFECT);
}
enum IID_IDropTarget = GUID(0x122, 0x0, 0x0, [0xc0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x46]);
interface IDropTarget : IUnknown
{
    HRESULT DragEnter(IDataObject, MODIFIERKEYS_FLAGS, POINTL, DROPEFFECT*);
    HRESULT DragOver(MODIFIERKEYS_FLAGS, POINTL, DROPEFFECT*);
    HRESULT DragLeave();
    HRESULT Drop(IDataObject, MODIFIERKEYS_FLAGS, POINTL, DROPEFFECT*);
}
enum IID_IDropSourceNotify = GUID(0x12b, 0x0, 0x0, [0xc0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x46]);
interface IDropSourceNotify : IUnknown
{
    HRESULT DragEnterTarget(HWND);
    HRESULT DragLeaveTarget();
}
enum IID_IEnterpriseDropTarget = GUID(0x390e3878, 0xfd55, 0x4e18, [0x81, 0x9d, 0x46, 0x82, 0x8, 0x1c, 0xc, 0xfd]);
interface IEnterpriseDropTarget : IUnknown
{
    HRESULT SetDropSourceEnterpriseId(const(wchar)*);
    HRESULT IsEvaluatingEdpPolicy(BOOL*);
}
struct OLEVERB
{
    OLEIVERB lVerb;
    PWSTR lpszVerbName;
    MENU_ITEM_FLAGS fuFlags;
    uint grfAttribs;
}
alias OLEVERBATTRIB = int;
enum : int
{
    OLEVERBATTRIB_NEVERDIRTIES    = 0x00000001,
    OLEVERBATTRIB_ONCONTAINERMENU = 0x00000002,
}

enum IID_IEnumOLEVERB = GUID(0x104, 0x0, 0x0, [0xc0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x46]);
interface IEnumOLEVERB : IUnknown
{
    HRESULT Next(uint, OLEVERB*, uint*);
    HRESULT Skip(uint);
    HRESULT Reset();
    HRESULT Clone(IEnumOLEVERB*);
}
struct NUMPARSE
{
    int cDig;
    NUMPARSE_FLAGS dwInFlags;
    NUMPARSE_FLAGS dwOutFlags;
    int cchUsed;
    int nBaseShift;
    int nPwr10;
}
struct UDATE
{
    SYSTEMTIME st;
    ushort wDayOfYear;
}
alias REGKIND = int;
enum : int
{
    REGKIND_DEFAULT  = 0x00000000,
    REGKIND_REGISTER = 0x00000001,
    REGKIND_NONE     = 0x00000002,
}

struct PARAMDATA
{
    PWSTR szName;
    VARENUM vt;
}
struct METHODDATA
{
    PWSTR szName;
    PARAMDATA* ppdata;
    int dispid;
    uint iMeth;
    CALLCONV cc;
    uint cArgs;
    ushort wFlags;
    VARENUM vtReturn;
}
struct INTERFACEDATA
{
    METHODDATA* pmethdata;
    uint cMembers;
}
alias UASFLAGS = int;
enum : int
{
    UAS_NORMAL         = 0x00000000,
    UAS_BLOCKED        = 0x00000001,
    UAS_NOPARENTENABLE = 0x00000002,
    UAS_MASK           = 0x00000003,
}

alias READYSTATE = int;
enum : int
{
    READYSTATE_UNINITIALIZED = 0x00000000,
    READYSTATE_LOADING       = 0x00000001,
    READYSTATE_LOADED        = 0x00000002,
    READYSTATE_INTERACTIVE   = 0x00000003,
    READYSTATE_COMPLETE      = 0x00000004,
}

struct LICINFO
{
    int cbLicInfo;
    BOOL fRuntimeKeyAvail;
    BOOL fLicVerified;
}
enum IID_IClassFactory2 = GUID(0xb196b28f, 0xbab4, 0x101a, [0xb6, 0x9c, 0x0, 0xaa, 0x0, 0x34, 0x1d, 0x7]);
interface IClassFactory2 : IClassFactory
{
    HRESULT GetLicInfo(LICINFO*);
    HRESULT RequestLicKey(uint, BSTR*);
    HRESULT CreateInstanceLic(IUnknown, IUnknown, const(GUID)*, BSTR, void**);
}
enum IID_IProvideClassInfo = GUID(0xb196b283, 0xbab4, 0x101a, [0xb6, 0x9c, 0x0, 0xaa, 0x0, 0x34, 0x1d, 0x7]);
interface IProvideClassInfo : IUnknown
{
    HRESULT GetClassInfo(ITypeInfo*);
}
alias GUIDKIND = int;
enum : int
{
    GUIDKIND_DEFAULT_SOURCE_DISP_IID = 0x00000001,
}

enum IID_IProvideClassInfo2 = GUID(0xa6bc3ac0, 0xdbaa, 0x11ce, [0x9d, 0xe3, 0x0, 0xaa, 0x0, 0x4b, 0xb8, 0x51]);
interface IProvideClassInfo2 : IProvideClassInfo
{
    HRESULT GetGUID(uint, GUID*);
}
enum IID_IProvideMultipleClassInfo = GUID(0xa7aba9c1, 0x8983, 0x11cf, [0x8f, 0x20, 0x0, 0x80, 0x5f, 0x2c, 0xd0, 0x64]);
interface IProvideMultipleClassInfo : IProvideClassInfo2
{
    HRESULT GetMultiTypeInfoCount(uint*);
    HRESULT GetInfoOfIndex(uint, MULTICLASSINFO_FLAGS, ITypeInfo*, uint*, uint*, GUID*, GUID*);
}
struct CONTROLINFO
{
    uint cb;
    HACCEL hAccel;
    ushort cAccel;
    uint dwFlags;
}
alias CTRLINFO = int;
enum : int
{
    CTRLINFO_EATS_RETURN = 0x00000001,
    CTRLINFO_EATS_ESCAPE = 0x00000002,
}

enum IID_IOleControl = GUID(0xb196b288, 0xbab4, 0x101a, [0xb6, 0x9c, 0x0, 0xaa, 0x0, 0x34, 0x1d, 0x7]);
interface IOleControl : IUnknown
{
    HRESULT GetControlInfo(CONTROLINFO*);
    HRESULT OnMnemonic(MSG*);
    HRESULT OnAmbientPropertyChange(int);
    HRESULT FreezeEvents(BOOL);
}
struct POINTF
{
    float x;
    float y;
}
alias XFORMCOORDS = int;
enum : int
{
    XFORMCOORDS_POSITION            = 0x00000001,
    XFORMCOORDS_SIZE                = 0x00000002,
    XFORMCOORDS_HIMETRICTOCONTAINER = 0x00000004,
    XFORMCOORDS_CONTAINERTOHIMETRIC = 0x00000008,
    XFORMCOORDS_EVENTCOMPAT         = 0x00000010,
}

enum IID_IOleControlSite = GUID(0xb196b289, 0xbab4, 0x101a, [0xb6, 0x9c, 0x0, 0xaa, 0x0, 0x34, 0x1d, 0x7]);
interface IOleControlSite : IUnknown
{
    HRESULT OnControlInfoChanged();
    HRESULT LockInPlaceActive(BOOL);
    HRESULT GetExtendedControl(IDispatch*);
    HRESULT TransformCoords(POINTL*, POINTF*, uint);
    HRESULT TranslateAccelerator(MSG*, KEYMODIFIERS);
    HRESULT OnFocus(BOOL);
    HRESULT ShowPropertyFrame();
}
struct PROPPAGEINFO
{
    uint cb;
    PWSTR pszTitle;
    SIZE size;
    PWSTR pszDocString;
    PWSTR pszHelpFile;
    uint dwHelpContext;
}
enum IID_IPropertyPage = GUID(0xb196b28d, 0xbab4, 0x101a, [0xb6, 0x9c, 0x0, 0xaa, 0x0, 0x34, 0x1d, 0x7]);
interface IPropertyPage : IUnknown
{
    HRESULT SetPageSite(IPropertyPageSite);
    HRESULT Activate(HWND, RECT*, BOOL);
    HRESULT Deactivate();
    HRESULT GetPageInfo(PROPPAGEINFO*);
    HRESULT SetObjects(uint, IUnknown*);
    HRESULT Show(uint);
    HRESULT Move(RECT*);
    HRESULT IsPageDirty();
    HRESULT Apply();
    HRESULT Help(const(wchar)*);
    HRESULT TranslateAccelerator(MSG*);
}
enum IID_IPropertyPage2 = GUID(0x1e44665, 0x24ac, 0x101b, [0x84, 0xed, 0x8, 0x0, 0x2b, 0x2e, 0xc7, 0x13]);
interface IPropertyPage2 : IPropertyPage
{
    HRESULT EditProperty(int);
}
alias PROPPAGESTATUS = int;
enum : int
{
    PROPPAGESTATUS_DIRTY    = 0x00000001,
    PROPPAGESTATUS_VALIDATE = 0x00000002,
    PROPPAGESTATUS_CLEAN    = 0x00000004,
}

enum IID_IPropertyPageSite = GUID(0xb196b28c, 0xbab4, 0x101a, [0xb6, 0x9c, 0x0, 0xaa, 0x0, 0x34, 0x1d, 0x7]);
interface IPropertyPageSite : IUnknown
{
    HRESULT OnStatusChange(uint);
    HRESULT GetLocaleID(uint*);
    HRESULT GetPageContainer(IUnknown*);
    HRESULT TranslateAccelerator(MSG*);
}
enum IID_IPropertyNotifySink = GUID(0x9bfbbc02, 0xeff1, 0x101a, [0x84, 0xed, 0x0, 0xaa, 0x0, 0x34, 0x1d, 0x7]);
interface IPropertyNotifySink : IUnknown
{
    HRESULT OnChanged(int);
    HRESULT OnRequestEdit(int);
}
struct CAUUID
{
    uint cElems;
    GUID* pElems;
}
enum IID_ISpecifyPropertyPages = GUID(0xb196b28b, 0xbab4, 0x101a, [0xb6, 0x9c, 0x0, 0xaa, 0x0, 0x34, 0x1d, 0x7]);
interface ISpecifyPropertyPages : IUnknown
{
    HRESULT GetPages(CAUUID*);
}
enum IID_IPersistPropertyBag = GUID(0x37d84f60, 0x42cb, 0x11ce, [0x81, 0x35, 0x0, 0xaa, 0x0, 0x4b, 0xb8, 0x51]);
interface IPersistPropertyBag : IPersist
{
    HRESULT InitNew();
    HRESULT Load(IPropertyBag, IErrorLog);
    HRESULT Save(IPropertyBag, BOOL, BOOL);
}
enum IID_ISimpleFrameSite = GUID(0x742b0e01, 0x14e6, 0x101b, [0x91, 0x4e, 0x0, 0xaa, 0x0, 0x30, 0xc, 0xab]);
interface ISimpleFrameSite : IUnknown
{
    HRESULT PreMessageFilter(HWND, uint, WPARAM, LPARAM, LRESULT*, uint*);
    HRESULT PostMessageFilter(HWND, uint, WPARAM, LPARAM, LRESULT*, uint);
}
enum IID_IFont = GUID(0xbef6e002, 0xa874, 0x101a, [0x8b, 0xba, 0x0, 0xaa, 0x0, 0x30, 0xc, 0xab]);
interface IFont : IUnknown
{
    HRESULT get_Name(BSTR*);
    HRESULT put_Name(BSTR);
    HRESULT get_Size(CY*);
    HRESULT put_Size(CY);
    HRESULT get_Bold(BOOL*);
    HRESULT put_Bold(BOOL);
    HRESULT get_Italic(BOOL*);
    HRESULT put_Italic(BOOL);
    HRESULT get_Underline(BOOL*);
    HRESULT put_Underline(BOOL);
    HRESULT get_Strikethrough(BOOL*);
    HRESULT put_Strikethrough(BOOL);
    HRESULT get_Weight(short*);
    HRESULT put_Weight(short);
    HRESULT get_Charset(short*);
    HRESULT put_Charset(short);
    HRESULT get_hFont(HFONT*);
    HRESULT Clone(IFont*);
    HRESULT IsEqual(IFont);
    HRESULT SetRatio(int, int);
    HRESULT QueryTextMetrics(TEXTMETRICW*);
    HRESULT AddRefHfont(HFONT);
    HRESULT ReleaseHfont(HFONT);
    HRESULT SetHdc(HDC);
}
alias PICTUREATTRIBUTES = int;
enum : int
{
    PICTURE_SCALABLE    = 0x00000001,
    PICTURE_TRANSPARENT = 0x00000002,
}

enum IID_IPicture = GUID(0x7bf80980, 0xbf32, 0x101a, [0x8b, 0xbb, 0x0, 0xaa, 0x0, 0x30, 0xc, 0xab]);
interface IPicture : IUnknown
{
    HRESULT get_Handle(OLE_HANDLE*);
    HRESULT get_hPal(OLE_HANDLE*);
    HRESULT get_Type(PICTYPE*);
    HRESULT get_Width(int*);
    HRESULT get_Height(int*);
    HRESULT Render(HDC, int, int, int, int, int, int, int, int, RECT*);
    HRESULT set_hPal(OLE_HANDLE);
    HRESULT get_CurDC(HDC*);
    HRESULT SelectPicture(HDC, HDC*, OLE_HANDLE*);
    HRESULT get_KeepOriginalFormat(BOOL*);
    HRESULT put_KeepOriginalFormat(BOOL);
    HRESULT PictureChanged();
    HRESULT SaveAsFile(IStream, BOOL, int*);
    HRESULT get_Attributes(uint*);
}
enum IID_IPicture2 = GUID(0xf5185dd8, 0x2012, 0x4b0b, [0xaa, 0xd9, 0xf0, 0x52, 0xc6, 0xbd, 0x48, 0x2b]);
interface IPicture2 : IUnknown
{
    HRESULT get_Handle(ulong*);
    HRESULT get_hPal(ulong*);
    HRESULT get_Type(short*);
    HRESULT get_Width(int*);
    HRESULT get_Height(int*);
    HRESULT Render(HDC, int, int, int, int, int, int, int, int, RECT*);
    HRESULT set_hPal(ulong);
    HRESULT get_CurDC(HDC*);
    HRESULT SelectPicture(HDC, HDC*, ulong*);
    HRESULT get_KeepOriginalFormat(BOOL*);
    HRESULT put_KeepOriginalFormat(BOOL);
    HRESULT PictureChanged();
    HRESULT SaveAsFile(IStream, BOOL, int*);
    HRESULT get_Attributes(uint*);
}
enum IID_IFontEventsDisp = GUID(0x4ef6100a, 0xaf88, 0x11d0, [0x98, 0x46, 0x0, 0xc0, 0x4f, 0xc2, 0x99, 0x93]);
interface IFontEventsDisp : IDispatch
{
}
enum IID_IFontDisp = GUID(0xbef6e003, 0xa874, 0x101a, [0x8b, 0xba, 0x0, 0xaa, 0x0, 0x30, 0xc, 0xab]);
interface IFontDisp : IDispatch
{
}
enum IID_IPictureDisp = GUID(0x7bf80981, 0xbf32, 0x101a, [0x8b, 0xbb, 0x0, 0xaa, 0x0, 0x30, 0xc, 0xab]);
interface IPictureDisp : IDispatch
{
}
enum IID_IOleInPlaceObjectWindowless = GUID(0x1c2056cc, 0x5ef4, 0x101b, [0x8b, 0xc8, 0x0, 0xaa, 0x0, 0x3e, 0x3b, 0x29]);
interface IOleInPlaceObjectWindowless : IOleInPlaceObject
{
    HRESULT OnWindowMessage(uint, WPARAM, LPARAM, LRESULT*);
    HRESULT GetDropTarget(IDropTarget*);
}
alias ACTIVATEFLAGS = int;
enum : int
{
    ACTIVATE_WINDOWLESS = 0x00000001,
}

enum IID_IOleInPlaceSiteEx = GUID(0x9c2cad80, 0x3424, 0x11cf, [0xb6, 0x70, 0x0, 0xaa, 0x0, 0x4c, 0xd6, 0xd8]);
interface IOleInPlaceSiteEx : IOleInPlaceSite
{
    HRESULT OnInPlaceActivateEx(BOOL*, uint);
    HRESULT OnInPlaceDeactivateEx(BOOL);
    HRESULT RequestUIActivate();
}
alias OLEDCFLAGS = int;
enum : int
{
    OLEDC_NODRAW     = 0x00000001,
    OLEDC_PAINTBKGND = 0x00000002,
    OLEDC_OFFSCREEN  = 0x00000004,
}

enum IID_IOleInPlaceSiteWindowless = GUID(0x922eada0, 0x3424, 0x11cf, [0xb6, 0x70, 0x0, 0xaa, 0x0, 0x4c, 0xd6, 0xd8]);
interface IOleInPlaceSiteWindowless : IOleInPlaceSiteEx
{
    HRESULT CanWindowlessActivate();
    HRESULT GetCapture();
    HRESULT SetCapture(BOOL);
    HRESULT GetFocus();
    HRESULT SetFocus(BOOL);
    HRESULT GetDC(RECT*, uint, HDC*);
    HRESULT ReleaseDC(HDC);
    HRESULT InvalidateRect(RECT*, BOOL);
    HRESULT InvalidateRgn(HRGN, BOOL);
    HRESULT ScrollRect(int, int, RECT*, RECT*);
    HRESULT AdjustRect(RECT*);
    HRESULT OnDefWindowMessage(uint, WPARAM, LPARAM, LRESULT*);
}
alias VIEWSTATUS = int;
enum : int
{
    VIEWSTATUS_OPAQUE              = 0x00000001,
    VIEWSTATUS_SOLIDBKGND          = 0x00000002,
    VIEWSTATUS_DVASPECTOPAQUE      = 0x00000004,
    VIEWSTATUS_DVASPECTTRANSPARENT = 0x00000008,
    VIEWSTATUS_SURFACE             = 0x00000010,
    VIEWSTATUS_3DSURFACE           = 0x00000020,
}

alias HITRESULT = int;
enum : int
{
    HITRESULT_OUTSIDE     = 0x00000000,
    HITRESULT_TRANSPARENT = 0x00000001,
    HITRESULT_CLOSE       = 0x00000002,
    HITRESULT_HIT         = 0x00000003,
}

struct DVEXTENTINFO
{
    uint cb;
    uint dwExtentMode;
    SIZE sizelProposed;
}
alias DVEXTENTMODE = int;
enum : int
{
    DVEXTENT_CONTENT  = 0x00000000,
    DVEXTENT_INTEGRAL = 0x00000001,
}

alias DVASPECTINFOFLAG = int;
enum : int
{
    DVASPECTINFOFLAG_CANOPTIMIZE = 0x00000001,
}

struct DVASPECTINFO
{
    uint cb;
    uint dwFlags;
}
enum IID_IViewObjectEx = GUID(0x3af24292, 0xc96, 0x11ce, [0xa0, 0xcf, 0x0, 0xaa, 0x0, 0x60, 0xa, 0xb8]);
interface IViewObjectEx : IViewObject2
{
    HRESULT GetRect(uint, RECTL*);
    HRESULT GetViewStatus(uint*);
    HRESULT QueryHitPoint(uint, RECT*, POINT, int, uint*);
    HRESULT QueryHitRect(uint, RECT*, RECT*, int, uint*);
    HRESULT GetNaturalExtent(DVASPECT, int, DVTARGETDEVICE*, HDC, DVEXTENTINFO*, SIZE*);
}
enum IID_IOleUndoUnit = GUID(0x894ad3b0, 0xef97, 0x11ce, [0x9b, 0xc9, 0x0, 0xaa, 0x0, 0x60, 0x8e, 0x1]);
interface IOleUndoUnit : IUnknown
{
    HRESULT Do(IOleUndoManager);
    HRESULT GetDescription(BSTR*);
    HRESULT GetUnitType(GUID*, int*);
    HRESULT OnNextAdd();
}
enum IID_IOleParentUndoUnit = GUID(0xa1faf330, 0xef97, 0x11ce, [0x9b, 0xc9, 0x0, 0xaa, 0x0, 0x60, 0x8e, 0x1]);
interface IOleParentUndoUnit : IOleUndoUnit
{
    HRESULT Open(IOleParentUndoUnit);
    HRESULT Close(IOleParentUndoUnit, BOOL);
    HRESULT Add(IOleUndoUnit);
    HRESULT FindUnit(IOleUndoUnit);
    HRESULT GetParentState(uint*);
}
enum IID_IEnumOleUndoUnits = GUID(0xb3e7c340, 0xef97, 0x11ce, [0x9b, 0xc9, 0x0, 0xaa, 0x0, 0x60, 0x8e, 0x1]);
interface IEnumOleUndoUnits : IUnknown
{
    HRESULT Next(uint, IOleUndoUnit*, uint*);
    HRESULT Skip(uint);
    HRESULT Reset();
    HRESULT Clone(IEnumOleUndoUnits*);
}
enum IID_IOleUndoManager = GUID(0xd001f200, 0xef97, 0x11ce, [0x9b, 0xc9, 0x0, 0xaa, 0x0, 0x60, 0x8e, 0x1]);
interface IOleUndoManager : IUnknown
{
    HRESULT Open(IOleParentUndoUnit);
    HRESULT Close(IOleParentUndoUnit, BOOL);
    HRESULT Add(IOleUndoUnit);
    HRESULT GetOpenParentState(uint*);
    HRESULT DiscardFrom(IOleUndoUnit);
    HRESULT UndoTo(IOleUndoUnit);
    HRESULT RedoTo(IOleUndoUnit);
    HRESULT EnumUndoable(IEnumOleUndoUnits*);
    HRESULT EnumRedoable(IEnumOleUndoUnits*);
    HRESULT GetLastUndoDescription(BSTR*);
    HRESULT GetLastRedoDescription(BSTR*);
    HRESULT Enable(BOOL);
}
alias POINTERINACTIVE = int;
enum : int
{
    POINTERINACTIVE_ACTIVATEONENTRY   = 0x00000001,
    POINTERINACTIVE_DEACTIVATEONLEAVE = 0x00000002,
    POINTERINACTIVE_ACTIVATEONDRAG    = 0x00000004,
}

enum IID_IPointerInactive = GUID(0x55980ba0, 0x35aa, 0x11cf, [0xb6, 0x71, 0x0, 0xaa, 0x0, 0x4c, 0xd6, 0xd8]);
interface IPointerInactive : IUnknown
{
    HRESULT GetActivationPolicy(POINTERINACTIVE*);
    HRESULT OnInactiveMouseMove(RECT*, int, int, uint);
    HRESULT OnInactiveSetCursor(RECT*, int, int, uint, BOOL);
}
enum IID_IObjectWithSite = GUID(0xfc4801a3, 0x2ba9, 0x11cf, [0xa2, 0x29, 0x0, 0xaa, 0x0, 0x3d, 0x73, 0x52]);
interface IObjectWithSite : IUnknown
{
    HRESULT SetSite(IUnknown);
    HRESULT GetSite(const(GUID)*, void**);
}
struct CALPOLESTR
{
    uint cElems;
    PWSTR* pElems;
}
struct CADWORD
{
    uint cElems;
    uint* pElems;
}
enum IID_IPerPropertyBrowsing = GUID(0x376bd3aa, 0x3845, 0x101b, [0x84, 0xed, 0x8, 0x0, 0x2b, 0x2e, 0xc7, 0x13]);
interface IPerPropertyBrowsing : IUnknown
{
    HRESULT GetDisplayString(int, BSTR*);
    HRESULT MapPropertyToPage(int, GUID*);
    HRESULT GetPredefinedStrings(int, CALPOLESTR*, CADWORD*);
    HRESULT GetPredefinedValue(int, uint, VARIANT*);
}
alias PROPBAG2_TYPE = int;
enum : int
{
    PROPBAG2_TYPE_UNDEFINED = 0x00000000,
    PROPBAG2_TYPE_DATA      = 0x00000001,
    PROPBAG2_TYPE_URL       = 0x00000002,
    PROPBAG2_TYPE_OBJECT    = 0x00000003,
    PROPBAG2_TYPE_STREAM    = 0x00000004,
    PROPBAG2_TYPE_STORAGE   = 0x00000005,
    PROPBAG2_TYPE_MONIKER   = 0x00000006,
}

enum IID_IPersistPropertyBag2 = GUID(0x22f55881, 0x280b, 0x11d0, [0xa8, 0xa9, 0x0, 0xa0, 0xc9, 0xc, 0x20, 0x4]);
interface IPersistPropertyBag2 : IPersist
{
    HRESULT InitNew();
    HRESULT Load(IPropertyBag2, IErrorLog);
    HRESULT Save(IPropertyBag2, BOOL, BOOL);
    HRESULT IsDirty();
}
enum IID_IAdviseSinkEx = GUID(0x3af24290, 0xc96, 0x11ce, [0xa0, 0xcf, 0x0, 0xaa, 0x0, 0x60, 0xa, 0xb8]);
interface IAdviseSinkEx : IAdviseSink
{
    void OnViewStatusChange(uint);
}
alias QACONTAINERFLAGS = int;
enum : int
{
    QACONTAINER_SHOWHATCHING      = 0x00000001,
    QACONTAINER_SHOWGRABHANDLES   = 0x00000002,
    QACONTAINER_USERMODE          = 0x00000004,
    QACONTAINER_DISPLAYASDEFAULT  = 0x00000008,
    QACONTAINER_UIDEAD            = 0x00000010,
    QACONTAINER_AUTOCLIP          = 0x00000020,
    QACONTAINER_MESSAGEREFLECT    = 0x00000040,
    QACONTAINER_SUPPORTSMNEMONICS = 0x00000080,
}

struct QACONTAINER
{
    uint cbSize;
    IOleClientSite pClientSite;
    IAdviseSinkEx pAdviseSink;
    IPropertyNotifySink pPropertyNotifySink;
    IUnknown pUnkEventSink;
    uint dwAmbientFlags;
    uint colorFore;
    uint colorBack;
    IFont pFont;
    IOleUndoManager pUndoMgr;
    uint dwAppearance;
    int lcid;
    HPALETTE hpal;
    IBindHost pBindHost;
    IOleControlSite pOleControlSite;
    IServiceProvider pServiceProvider;
}
struct QACONTROL
{
    uint cbSize;
    uint dwMiscStatus;
    uint dwViewStatus;
    uint dwEventCookie;
    uint dwPropNotifyCookie;
    uint dwPointerActivationPolicy;
}
enum IID_IQuickActivate = GUID(0xcf51ed10, 0x62fe, 0x11cf, [0xbf, 0x86, 0x0, 0xa0, 0xc9, 0x3, 0x48, 0x36]);
interface IQuickActivate : IUnknown
{
    HRESULT QuickActivate(QACONTAINER*, QACONTROL*);
    HRESULT SetContentExtent(SIZE*);
    HRESULT GetContentExtent(SIZE*);
}
struct OCPFIPARAMS
{
    uint cbStructSize;
    HWND hWndOwner;
    int x;
    int y;
    const(wchar)* lpszCaption;
    uint cObjects;
    IUnknown* lplpUnk;
    uint cPages;
    GUID* lpPages;
    uint lcid;
    int dispidInitialProperty;
}
struct FONTDESC
{
    uint cbSizeofstruct;
    PWSTR lpstrName;
    CY cySize;
    short sWeight;
    short sCharset;
    BOOL fItalic;
    BOOL fUnderline;
    BOOL fStrikethrough;
}
struct PICTDESC
{
    uint cbSizeofstruct;
    uint picType;
    union
    {
        struct _bmp_e__Struct
        {
            HBITMAP hbitmap;
            HPALETTE hpal;
        }
        struct _wmf_e__Struct
        {
            HMETAFILE hmeta;
            int xExt;
            int yExt;
        }
        struct _icon_e__Struct
        {
            HICON hicon;
        }
        struct _emf_e__Struct
        {
            HENHMETAFILE hemf;
        }
    }
}
alias OLE_TRISTATE = int;
enum : int
{
    triUnchecked = 0x00000000,
    triChecked   = 0x00000001,
    triGray      = 0x00000002,
}

enum IID_IVBGetControl = GUID(0x40a050a0, 0x3c31, 0x101b, [0xa8, 0x2e, 0x8, 0x0, 0x2b, 0x2b, 0x23, 0x37]);
interface IVBGetControl : IUnknown
{
    HRESULT EnumControls(uint, ENUM_CONTROLS_WHICH_FLAGS, IEnumUnknown*);
}
enum IID_IGetOleObject = GUID(0x8a701da0, 0x4feb, 0x101b, [0xa8, 0x2e, 0x8, 0x0, 0x2b, 0x2b, 0x23, 0x37]);
interface IGetOleObject : IUnknown
{
    HRESULT GetOleObject(const(GUID)*, void**);
}
enum IID_IVBFormat = GUID(0x9849fd60, 0x3768, 0x101b, [0x8d, 0x72, 0xae, 0x61, 0x64, 0xff, 0xe3, 0xcf]);
interface IVBFormat : IUnknown
{
    HRESULT Format(VARIANT*, BSTR, void*, ushort, int, short, ushort, ushort*);
}
enum IID_IGetVBAObject = GUID(0x91733a60, 0x3f4c, 0x101b, [0xa3, 0xf6, 0x0, 0xaa, 0x0, 0x34, 0xe4, 0xe9]);
interface IGetVBAObject : IUnknown
{
    HRESULT GetObject(const(GUID)*, void**, uint);
}
alias DOCMISC = int;
enum : int
{
    DOCMISC_CANCREATEMULTIPLEVIEWS   = 0x00000001,
    DOCMISC_SUPPORTCOMPLEXRECTANGLES = 0x00000002,
    DOCMISC_CANTOPENEDIT             = 0x00000004,
    DOCMISC_NOFILESUPPORT            = 0x00000008,
}

enum IID_IOleDocument = GUID(0xb722bcc5, 0x4e68, 0x101b, [0xa2, 0xbc, 0x0, 0xaa, 0x0, 0x40, 0x47, 0x70]);
interface IOleDocument : IUnknown
{
    HRESULT CreateView(IOleInPlaceSite, IStream, uint, IOleDocumentView*);
    HRESULT GetDocMiscStatus(uint*);
    HRESULT EnumViews(IEnumOleDocumentViews*, IOleDocumentView*);
}
enum IID_IOleDocumentSite = GUID(0xb722bcc7, 0x4e68, 0x101b, [0xa2, 0xbc, 0x0, 0xaa, 0x0, 0x40, 0x47, 0x70]);
interface IOleDocumentSite : IUnknown
{
    HRESULT ActivateMe(IOleDocumentView);
}
enum IID_IOleDocumentView = GUID(0xb722bcc6, 0x4e68, 0x101b, [0xa2, 0xbc, 0x0, 0xaa, 0x0, 0x40, 0x47, 0x70]);
interface IOleDocumentView : IUnknown
{
    HRESULT SetInPlaceSite(IOleInPlaceSite);
    HRESULT GetInPlaceSite(IOleInPlaceSite*);
    HRESULT GetDocument(IUnknown*);
    HRESULT SetRect(RECT*);
    HRESULT GetRect(RECT*);
    HRESULT SetRectComplex(RECT*, RECT*, RECT*, RECT*);
    HRESULT Show(BOOL);
    HRESULT UIActivate(BOOL);
    HRESULT Open();
    HRESULT CloseView(uint);
    HRESULT SaveViewState(IStream);
    HRESULT ApplyViewState(IStream);
    HRESULT Clone(IOleInPlaceSite, IOleDocumentView*);
}
enum IID_IEnumOleDocumentViews = GUID(0xb722bcc8, 0x4e68, 0x101b, [0xa2, 0xbc, 0x0, 0xaa, 0x0, 0x40, 0x47, 0x70]);
interface IEnumOleDocumentViews : IUnknown
{
    HRESULT Next(uint, IOleDocumentView*, uint*);
    HRESULT Skip(uint);
    HRESULT Reset();
    HRESULT Clone(IEnumOleDocumentViews*);
}
enum IID_IContinueCallback = GUID(0xb722bcca, 0x4e68, 0x101b, [0xa2, 0xbc, 0x0, 0xaa, 0x0, 0x40, 0x47, 0x70]);
interface IContinueCallback : IUnknown
{
    HRESULT FContinue();
    HRESULT FContinuePrinting(int, int, PWSTR);
}
alias PRINTFLAG = int;
enum : int
{
    PRINTFLAG_MAYBOTHERUSER        = 0x00000001,
    PRINTFLAG_PROMPTUSER           = 0x00000002,
    PRINTFLAG_USERMAYCHANGEPRINTER = 0x00000004,
    PRINTFLAG_RECOMPOSETODEVICE    = 0x00000008,
    PRINTFLAG_DONTACTUALLYPRINT    = 0x00000010,
    PRINTFLAG_FORCEPROPERTIES      = 0x00000020,
    PRINTFLAG_PRINTTOFILE          = 0x00000040,
}

struct PAGERANGE
{
    int nFromPage;
    int nToPage;
}
struct PAGESET
{
    uint cbStruct;
    BOOL fOddPages;
    BOOL fEvenPages;
    uint cPageRange;
    PAGERANGE[1] rgPages;
}
enum IID_IPrint = GUID(0xb722bcc9, 0x4e68, 0x101b, [0xa2, 0xbc, 0x0, 0xaa, 0x0, 0x40, 0x47, 0x70]);
interface IPrint : IUnknown
{
    HRESULT SetInitialPageNum(int);
    HRESULT GetPageInfo(int*, int*);
    HRESULT Print(uint, DVTARGETDEVICE**, PAGESET**, STGMEDIUM*, IContinueCallback, int, int*, int*);
}
alias OLECMDF = int;
enum : int
{
    OLECMDF_SUPPORTED         = 0x00000001,
    OLECMDF_ENABLED           = 0x00000002,
    OLECMDF_LATCHED           = 0x00000004,
    OLECMDF_NINCHED           = 0x00000008,
    OLECMDF_INVISIBLE         = 0x00000010,
    OLECMDF_DEFHIDEONCTXTMENU = 0x00000020,
}

struct OLECMD
{
    uint cmdID;
    uint cmdf;
}
struct OLECMDTEXT
{
    uint cmdtextf;
    uint cwActual;
    uint cwBuf;
    wchar[1] rgwz;
}
alias OLECMDTEXTF = int;
enum : int
{
    OLECMDTEXTF_NONE   = 0x00000000,
    OLECMDTEXTF_NAME   = 0x00000001,
    OLECMDTEXTF_STATUS = 0x00000002,
}

alias OLECMDEXECOPT = int;
enum : int
{
    OLECMDEXECOPT_DODEFAULT      = 0x00000000,
    OLECMDEXECOPT_PROMPTUSER     = 0x00000001,
    OLECMDEXECOPT_DONTPROMPTUSER = 0x00000002,
    OLECMDEXECOPT_SHOWHELP       = 0x00000003,
}

alias OLECMDID = int;
enum : int
{
    OLECMDID_OPEN                           = 0x00000001,
    OLECMDID_NEW                            = 0x00000002,
    OLECMDID_SAVE                           = 0x00000003,
    OLECMDID_SAVEAS                         = 0x00000004,
    OLECMDID_SAVECOPYAS                     = 0x00000005,
    OLECMDID_PRINT                          = 0x00000006,
    OLECMDID_PRINTPREVIEW                   = 0x00000007,
    OLECMDID_PAGESETUP                      = 0x00000008,
    OLECMDID_SPELL                          = 0x00000009,
    OLECMDID_PROPERTIES                     = 0x0000000a,
    OLECMDID_CUT                            = 0x0000000b,
    OLECMDID_COPY                           = 0x0000000c,
    OLECMDID_PASTE                          = 0x0000000d,
    OLECMDID_PASTESPECIAL                   = 0x0000000e,
    OLECMDID_UNDO                           = 0x0000000f,
    OLECMDID_REDO                           = 0x00000010,
    OLECMDID_SELECTALL                      = 0x00000011,
    OLECMDID_CLEARSELECTION                 = 0x00000012,
    OLECMDID_ZOOM                           = 0x00000013,
    OLECMDID_GETZOOMRANGE                   = 0x00000014,
    OLECMDID_UPDATECOMMANDS                 = 0x00000015,
    OLECMDID_REFRESH                        = 0x00000016,
    OLECMDID_STOP                           = 0x00000017,
    OLECMDID_HIDETOOLBARS                   = 0x00000018,
    OLECMDID_SETPROGRESSMAX                 = 0x00000019,
    OLECMDID_SETPROGRESSPOS                 = 0x0000001a,
    OLECMDID_SETPROGRESSTEXT                = 0x0000001b,
    OLECMDID_SETTITLE                       = 0x0000001c,
    OLECMDID_SETDOWNLOADSTATE               = 0x0000001d,
    OLECMDID_STOPDOWNLOAD                   = 0x0000001e,
    OLECMDID_ONTOOLBARACTIVATED             = 0x0000001f,
    OLECMDID_FIND                           = 0x00000020,
    OLECMDID_DELETE                         = 0x00000021,
    OLECMDID_HTTPEQUIV                      = 0x00000022,
    OLECMDID_HTTPEQUIV_DONE                 = 0x00000023,
    OLECMDID_ENABLE_INTERACTION             = 0x00000024,
    OLECMDID_ONUNLOAD                       = 0x00000025,
    OLECMDID_PROPERTYBAG2                   = 0x00000026,
    OLECMDID_PREREFRESH                     = 0x00000027,
    OLECMDID_SHOWSCRIPTERROR                = 0x00000028,
    OLECMDID_SHOWMESSAGE                    = 0x00000029,
    OLECMDID_SHOWFIND                       = 0x0000002a,
    OLECMDID_SHOWPAGESETUP                  = 0x0000002b,
    OLECMDID_SHOWPRINT                      = 0x0000002c,
    OLECMDID_CLOSE                          = 0x0000002d,
    OLECMDID_ALLOWUILESSSAVEAS              = 0x0000002e,
    OLECMDID_DONTDOWNLOADCSS                = 0x0000002f,
    OLECMDID_UPDATEPAGESTATUS               = 0x00000030,
    OLECMDID_PRINT2                         = 0x00000031,
    OLECMDID_PRINTPREVIEW2                  = 0x00000032,
    OLECMDID_SETPRINTTEMPLATE               = 0x00000033,
    OLECMDID_GETPRINTTEMPLATE               = 0x00000034,
    OLECMDID_PAGEACTIONBLOCKED              = 0x00000037,
    OLECMDID_PAGEACTIONUIQUERY              = 0x00000038,
    OLECMDID_FOCUSVIEWCONTROLS              = 0x00000039,
    OLECMDID_FOCUSVIEWCONTROLSQUERY         = 0x0000003a,
    OLECMDID_SHOWPAGEACTIONMENU             = 0x0000003b,
    OLECMDID_ADDTRAVELENTRY                 = 0x0000003c,
    OLECMDID_UPDATETRAVELENTRY              = 0x0000003d,
    OLECMDID_UPDATEBACKFORWARDSTATE         = 0x0000003e,
    OLECMDID_OPTICAL_ZOOM                   = 0x0000003f,
    OLECMDID_OPTICAL_GETZOOMRANGE           = 0x00000040,
    OLECMDID_WINDOWSTATECHANGED             = 0x00000041,
    OLECMDID_ACTIVEXINSTALLSCOPE            = 0x00000042,
    OLECMDID_UPDATETRAVELENTRY_DATARECOVERY = 0x00000043,
    OLECMDID_SHOWTASKDLG                    = 0x00000044,
    OLECMDID_POPSTATEEVENT                  = 0x00000045,
    OLECMDID_VIEWPORT_MODE                  = 0x00000046,
    OLECMDID_LAYOUT_VIEWPORT_WIDTH          = 0x00000047,
    OLECMDID_VISUAL_VIEWPORT_EXCLUDE_BOTTOM = 0x00000048,
    OLECMDID_USER_OPTICAL_ZOOM              = 0x00000049,
    OLECMDID_PAGEAVAILABLE                  = 0x0000004a,
    OLECMDID_GETUSERSCALABLE                = 0x0000004b,
    OLECMDID_UPDATE_CARET                   = 0x0000004c,
    OLECMDID_ENABLE_VISIBILITY              = 0x0000004d,
    OLECMDID_MEDIA_PLAYBACK                 = 0x0000004e,
    OLECMDID_SETFAVICON                     = 0x0000004f,
    OLECMDID_SET_HOST_FULLSCREENMODE        = 0x00000050,
    OLECMDID_EXITFULLSCREEN                 = 0x00000051,
    OLECMDID_SCROLLCOMPLETE                 = 0x00000052,
    OLECMDID_ONBEFOREUNLOAD                 = 0x00000053,
    OLECMDID_SHOWMESSAGE_BLOCKABLE          = 0x00000054,
    OLECMDID_SHOWTASKDLG_BLOCKABLE          = 0x00000055,
}

alias MEDIAPLAYBACK_STATE = int;
enum : int
{
    MEDIAPLAYBACK_RESUME              = 0x00000000,
    MEDIAPLAYBACK_PAUSE               = 0x00000001,
    MEDIAPLAYBACK_PAUSE_AND_SUSPEND   = 0x00000002,
    MEDIAPLAYBACK_RESUME_FROM_SUSPEND = 0x00000003,
}

alias IGNOREMIME = int;
enum : int
{
    IGNOREMIME_PROMPT = 0x00000001,
    IGNOREMIME_TEXT   = 0x00000002,
}

alias WPCSETTING = int;
enum : int
{
    WPCSETTING_LOGGING_ENABLED      = 0x00000001,
    WPCSETTING_FILEDOWNLOAD_BLOCKED = 0x00000002,
}

enum IID_IOleCommandTarget = GUID(0xb722bccb, 0x4e68, 0x101b, [0xa2, 0xbc, 0x0, 0xaa, 0x0, 0x40, 0x47, 0x70]);
interface IOleCommandTarget : IUnknown
{
    HRESULT QueryStatus(const(GUID)*, uint, OLECMD*, OLECMDTEXT*);
    HRESULT Exec(const(GUID)*, uint, uint, VARIANT*, VARIANT*);
}
alias OLECMDID_REFRESHFLAG = int;
enum : int
{
    OLECMDIDF_REFRESH_NORMAL                              = 0x00000000,
    OLECMDIDF_REFRESH_IFEXPIRED                           = 0x00000001,
    OLECMDIDF_REFRESH_CONTINUE                            = 0x00000002,
    OLECMDIDF_REFRESH_COMPLETELY                          = 0x00000003,
    OLECMDIDF_REFRESH_NO_CACHE                            = 0x00000004,
    OLECMDIDF_REFRESH_RELOAD                              = 0x00000005,
    OLECMDIDF_REFRESH_LEVELMASK                           = 0x000000ff,
    OLECMDIDF_REFRESH_CLEARUSERINPUT                      = 0x00001000,
    OLECMDIDF_REFRESH_PROMPTIFOFFLINE                     = 0x00002000,
    OLECMDIDF_REFRESH_THROUGHSCRIPT                       = 0x00004000,
    OLECMDIDF_REFRESH_SKIPBEFOREUNLOADEVENT               = 0x00008000,
    OLECMDIDF_REFRESH_PAGEACTION_ACTIVEXINSTALL           = 0x00010000,
    OLECMDIDF_REFRESH_PAGEACTION_FILEDOWNLOAD             = 0x00020000,
    OLECMDIDF_REFRESH_PAGEACTION_LOCALMACHINE             = 0x00040000,
    OLECMDIDF_REFRESH_PAGEACTION_POPUPWINDOW              = 0x00080000,
    OLECMDIDF_REFRESH_PAGEACTION_PROTLOCKDOWNLOCALMACHINE = 0x00100000,
    OLECMDIDF_REFRESH_PAGEACTION_PROTLOCKDOWNTRUSTED      = 0x00200000,
    OLECMDIDF_REFRESH_PAGEACTION_PROTLOCKDOWNINTRANET     = 0x00400000,
    OLECMDIDF_REFRESH_PAGEACTION_PROTLOCKDOWNINTERNET     = 0x00800000,
    OLECMDIDF_REFRESH_PAGEACTION_PROTLOCKDOWNRESTRICTED   = 0x01000000,
    OLECMDIDF_REFRESH_PAGEACTION_MIXEDCONTENT             = 0x02000000,
    OLECMDIDF_REFRESH_PAGEACTION_INVALID_CERT             = 0x04000000,
    OLECMDIDF_REFRESH_PAGEACTION_ALLOW_VERSION            = 0x08000000,
}

alias OLECMDID_PAGEACTIONFLAG = int;
enum : int
{
    OLECMDIDF_PAGEACTION_FILEDOWNLOAD                       = 0x00000001,
    OLECMDIDF_PAGEACTION_ACTIVEXINSTALL                     = 0x00000002,
    OLECMDIDF_PAGEACTION_ACTIVEXTRUSTFAIL                   = 0x00000004,
    OLECMDIDF_PAGEACTION_ACTIVEXUSERDISABLE                 = 0x00000008,
    OLECMDIDF_PAGEACTION_ACTIVEXDISALLOW                    = 0x00000010,
    OLECMDIDF_PAGEACTION_ACTIVEXUNSAFE                      = 0x00000020,
    OLECMDIDF_PAGEACTION_POPUPWINDOW                        = 0x00000040,
    OLECMDIDF_PAGEACTION_LOCALMACHINE                       = 0x00000080,
    OLECMDIDF_PAGEACTION_MIMETEXTPLAIN                      = 0x00000100,
    OLECMDIDF_PAGEACTION_SCRIPTNAVIGATE                     = 0x00000200,
    OLECMDIDF_PAGEACTION_SCRIPTNAVIGATE_ACTIVEXINSTALL      = 0x00000200,
    OLECMDIDF_PAGEACTION_PROTLOCKDOWNLOCALMACHINE           = 0x00000400,
    OLECMDIDF_PAGEACTION_PROTLOCKDOWNTRUSTED                = 0x00000800,
    OLECMDIDF_PAGEACTION_PROTLOCKDOWNINTRANET               = 0x00001000,
    OLECMDIDF_PAGEACTION_PROTLOCKDOWNINTERNET               = 0x00002000,
    OLECMDIDF_PAGEACTION_PROTLOCKDOWNRESTRICTED             = 0x00004000,
    OLECMDIDF_PAGEACTION_PROTLOCKDOWNDENY                   = 0x00008000,
    OLECMDIDF_PAGEACTION_POPUPALLOWED                       = 0x00010000,
    OLECMDIDF_PAGEACTION_SCRIPTPROMPT                       = 0x00020000,
    OLECMDIDF_PAGEACTION_ACTIVEXUSERAPPROVAL                = 0x00040000,
    OLECMDIDF_PAGEACTION_MIXEDCONTENT                       = 0x00080000,
    OLECMDIDF_PAGEACTION_INVALID_CERT                       = 0x00100000,
    OLECMDIDF_PAGEACTION_INTRANETZONEREQUEST                = 0x00200000,
    OLECMDIDF_PAGEACTION_XSSFILTERED                        = 0x00400000,
    OLECMDIDF_PAGEACTION_SPOOFABLEIDNHOST                   = 0x00800000,
    OLECMDIDF_PAGEACTION_ACTIVEX_EPM_INCOMPATIBLE           = 0x01000000,
    OLECMDIDF_PAGEACTION_SCRIPTNAVIGATE_ACTIVEXUSERAPPROVAL = 0x02000000,
    OLECMDIDF_PAGEACTION_WPCBLOCKED                         = 0x04000000,
    OLECMDIDF_PAGEACTION_WPCBLOCKED_ACTIVEX                 = 0x08000000,
    OLECMDIDF_PAGEACTION_EXTENSION_COMPAT_BLOCKED           = 0x10000000,
    OLECMDIDF_PAGEACTION_NORESETACTIVEX                     = 0x20000000,
    OLECMDIDF_PAGEACTION_GENERIC_STATE                      = 0x40000000,
    OLECMDIDF_PAGEACTION_RESET                              = 0x80000000,
}

alias OLECMDID_BROWSERSTATEFLAG = int;
enum : int
{
    OLECMDIDF_BROWSERSTATE_EXTENSIONSOFF     = 0x00000001,
    OLECMDIDF_BROWSERSTATE_IESECURITY        = 0x00000002,
    OLECMDIDF_BROWSERSTATE_PROTECTEDMODE_OFF = 0x00000004,
    OLECMDIDF_BROWSERSTATE_RESET             = 0x00000008,
    OLECMDIDF_BROWSERSTATE_REQUIRESACTIVEX   = 0x00000010,
    OLECMDIDF_BROWSERSTATE_DESKTOPHTMLDIALOG = 0x00000020,
    OLECMDIDF_BROWSERSTATE_BLOCKEDVERSION    = 0x00000040,
}

alias OLECMDID_OPTICAL_ZOOMFLAG = int;
enum : int
{
    OLECMDIDF_OPTICAL_ZOOM_NOPERSIST       = 0x00000001,
    OLECMDIDF_OPTICAL_ZOOM_NOLAYOUT        = 0x00000010,
    OLECMDIDF_OPTICAL_ZOOM_NOTRANSIENT     = 0x00000020,
    OLECMDIDF_OPTICAL_ZOOM_RELOADFORNEWTAB = 0x00000040,
}

alias PAGEACTION_UI = int;
enum : int
{
    PAGEACTION_UI_DEFAULT  = 0x00000000,
    PAGEACTION_UI_MODAL    = 0x00000001,
    PAGEACTION_UI_MODELESS = 0x00000002,
    PAGEACTION_UI_SILENT   = 0x00000003,
}

alias OLECMDID_WINDOWSTATE_FLAG = int;
enum : int
{
    OLECMDIDF_WINDOWSTATE_USERVISIBLE       = 0x00000001,
    OLECMDIDF_WINDOWSTATE_ENABLED           = 0x00000002,
    OLECMDIDF_WINDOWSTATE_USERVISIBLE_VALID = 0x00010000,
    OLECMDIDF_WINDOWSTATE_ENABLED_VALID     = 0x00020000,
}

alias OLECMDID_VIEWPORT_MODE_FLAG = int;
enum : int
{
    OLECMDIDF_VIEWPORTMODE_FIXED_LAYOUT_WIDTH          = 0x00000001,
    OLECMDIDF_VIEWPORTMODE_EXCLUDE_VISUAL_BOTTOM       = 0x00000002,
    OLECMDIDF_VIEWPORTMODE_FIXED_LAYOUT_WIDTH_VALID    = 0x00010000,
    OLECMDIDF_VIEWPORTMODE_EXCLUDE_VISUAL_BOTTOM_VALID = 0x00020000,
}

enum IID_IZoomEvents = GUID(0x41b68150, 0x904c, 0x4e17, [0xa0, 0xba, 0xa4, 0x38, 0x18, 0x2e, 0x35, 0x9d]);
interface IZoomEvents : IUnknown
{
    HRESULT OnZoomPercentChanged(uint);
}
enum IID_IProtectFocus = GUID(0xd81f90a3, 0x8156, 0x44f7, [0xad, 0x28, 0x5a, 0xbb, 0x87, 0x0, 0x32, 0x74]);
interface IProtectFocus : IUnknown
{
    HRESULT AllowFocusChange(BOOL*);
}
enum IID_IProtectedModeMenuServices = GUID(0x73c105ee, 0x9dff, 0x4a07, [0xb8, 0x3c, 0x7e, 0xff, 0x29, 0xc, 0x26, 0x6e]);
interface IProtectedModeMenuServices : IUnknown
{
    HRESULT CreateMenu(HMENU*);
    HRESULT LoadMenu(const(wchar)*, const(wchar)*, HMENU*);
    HRESULT LoadMenuID(const(wchar)*, ushort, HMENU*);
}
alias LPFNOLEUIHOOK = uint function(HWND, uint, WPARAM, LPARAM);
struct OLEUIINSERTOBJECTW
{
    uint cbStruct;
    INSERT_OBJECT_FLAGS dwFlags;
    HWND hWndOwner;
    const(wchar)* lpszCaption;
    LPFNOLEUIHOOK lpfnHook;
    LPARAM lCustData;
    HINSTANCE hInstance;
    const(wchar)* lpszTemplate;
    HRSRC hResource;
    GUID clsid;
    PWSTR lpszFile;
    uint cchFile;
    uint cClsidExclude;
    GUID* lpClsidExclude;
    GUID iid;
    uint oleRender;
    FORMATETC* lpFormatEtc;
    IOleClientSite lpIOleClientSite;
    IStorage lpIStorage;
    void** ppvObj;
    int sc;
    HGLOBAL hMetaPict;
}
struct OLEUIINSERTOBJECTA
{
    uint cbStruct;
    INSERT_OBJECT_FLAGS dwFlags;
    HWND hWndOwner;
    const(char)* lpszCaption;
    LPFNOLEUIHOOK lpfnHook;
    LPARAM lCustData;
    HINSTANCE hInstance;
    const(char)* lpszTemplate;
    HRSRC hResource;
    GUID clsid;
    PSTR lpszFile;
    uint cchFile;
    uint cClsidExclude;
    GUID* lpClsidExclude;
    GUID iid;
    uint oleRender;
    FORMATETC* lpFormatEtc;
    IOleClientSite lpIOleClientSite;
    IStorage lpIStorage;
    void** ppvObj;
    int sc;
    HGLOBAL hMetaPict;
}
alias OLEUIPASTEFLAG = int;
enum : int
{
    OLEUIPASTE_ENABLEICON  = 0x00000800,
    OLEUIPASTE_PASTEONLY   = 0x00000000,
    OLEUIPASTE_PASTE       = 0x00000200,
    OLEUIPASTE_LINKANYTYPE = 0x00000400,
    OLEUIPASTE_LINKTYPE1   = 0x00000001,
    OLEUIPASTE_LINKTYPE2   = 0x00000002,
    OLEUIPASTE_LINKTYPE3   = 0x00000004,
    OLEUIPASTE_LINKTYPE4   = 0x00000008,
    OLEUIPASTE_LINKTYPE5   = 0x00000010,
    OLEUIPASTE_LINKTYPE6   = 0x00000020,
    OLEUIPASTE_LINKTYPE7   = 0x00000040,
    OLEUIPASTE_LINKTYPE8   = 0x00000080,
}

struct OLEUIPASTEENTRYW
{
    FORMATETC fmtetc;
    const(wchar)* lpstrFormatName;
    const(wchar)* lpstrResultText;
    uint dwFlags;
    uint dwScratchSpace;
}
struct OLEUIPASTEENTRYA
{
    FORMATETC fmtetc;
    const(char)* lpstrFormatName;
    const(char)* lpstrResultText;
    uint dwFlags;
    uint dwScratchSpace;
}
struct OLEUIPASTESPECIALW
{
    uint cbStruct;
    PASTE_SPECIAL_FLAGS dwFlags;
    HWND hWndOwner;
    const(wchar)* lpszCaption;
    LPFNOLEUIHOOK lpfnHook;
    LPARAM lCustData;
    HINSTANCE hInstance;
    const(wchar)* lpszTemplate;
    HRSRC hResource;
    IDataObject lpSrcDataObj;
    OLEUIPASTEENTRYW* arrPasteEntries;
    int cPasteEntries;
    uint* arrLinkTypes;
    int cLinkTypes;
    uint cClsidExclude;
    GUID* lpClsidExclude;
    int nSelectedIndex;
    BOOL fLink;
    HGLOBAL hMetaPict;
    SIZE sizel;
}
struct OLEUIPASTESPECIALA
{
    uint cbStruct;
    PASTE_SPECIAL_FLAGS dwFlags;
    HWND hWndOwner;
    const(char)* lpszCaption;
    LPFNOLEUIHOOK lpfnHook;
    LPARAM lCustData;
    HINSTANCE hInstance;
    const(char)* lpszTemplate;
    HRSRC hResource;
    IDataObject lpSrcDataObj;
    OLEUIPASTEENTRYA* arrPasteEntries;
    int cPasteEntries;
    uint* arrLinkTypes;
    int cLinkTypes;
    uint cClsidExclude;
    GUID* lpClsidExclude;
    int nSelectedIndex;
    BOOL fLink;
    HGLOBAL hMetaPict;
    SIZE sizel;
}
// [Not Found] IID_IOleUILinkContainerW
interface IOleUILinkContainerW : IUnknown
{
    uint GetNextLink(uint);
    HRESULT SetLinkUpdateOptions(uint, uint);
    HRESULT GetLinkUpdateOptions(uint, uint*);
    HRESULT SetLinkSource(uint, PWSTR, uint, uint*, BOOL);
    HRESULT GetLinkSource(uint, PWSTR*, uint*, PWSTR*, PWSTR*, BOOL*, BOOL*);
    HRESULT OpenLinkSource(uint);
    HRESULT UpdateLink(uint, BOOL, BOOL);
    HRESULT CancelLink(uint);
}
// [Not Found] IID_IOleUILinkContainerA
interface IOleUILinkContainerA : IUnknown
{
    uint GetNextLink(uint);
    HRESULT SetLinkUpdateOptions(uint, uint);
    HRESULT GetLinkUpdateOptions(uint, uint*);
    HRESULT SetLinkSource(uint, PSTR, uint, uint*, BOOL);
    HRESULT GetLinkSource(uint, PSTR*, uint*, PSTR*, PSTR*, BOOL*, BOOL*);
    HRESULT OpenLinkSource(uint);
    HRESULT UpdateLink(uint, BOOL, BOOL);
    HRESULT CancelLink(uint);
}
struct OLEUIEDITLINKSW
{
    uint cbStruct;
    EDIT_LINKS_FLAGS dwFlags;
    HWND hWndOwner;
    const(wchar)* lpszCaption;
    LPFNOLEUIHOOK lpfnHook;
    LPARAM lCustData;
    HINSTANCE hInstance;
    const(wchar)* lpszTemplate;
    HRSRC hResource;
    IOleUILinkContainerW lpOleUILinkContainer;
}
struct OLEUIEDITLINKSA
{
    uint cbStruct;
    EDIT_LINKS_FLAGS dwFlags;
    HWND hWndOwner;
    const(char)* lpszCaption;
    LPFNOLEUIHOOK lpfnHook;
    LPARAM lCustData;
    HINSTANCE hInstance;
    const(char)* lpszTemplate;
    HRSRC hResource;
    IOleUILinkContainerA lpOleUILinkContainer;
}
struct OLEUICHANGEICONW
{
    uint cbStruct;
    CHANGE_ICON_FLAGS dwFlags;
    HWND hWndOwner;
    const(wchar)* lpszCaption;
    LPFNOLEUIHOOK lpfnHook;
    LPARAM lCustData;
    HINSTANCE hInstance;
    const(wchar)* lpszTemplate;
    HRSRC hResource;
    HGLOBAL hMetaPict;
    GUID clsid;
    wchar[260] szIconExe;
    int cchIconExe;
}
struct OLEUICHANGEICONA
{
    uint cbStruct;
    CHANGE_ICON_FLAGS dwFlags;
    HWND hWndOwner;
    const(char)* lpszCaption;
    LPFNOLEUIHOOK lpfnHook;
    LPARAM lCustData;
    HINSTANCE hInstance;
    const(char)* lpszTemplate;
    HRSRC hResource;
    HGLOBAL hMetaPict;
    GUID clsid;
    CHAR[260] szIconExe;
    int cchIconExe;
}
struct OLEUICONVERTW
{
    uint cbStruct;
    UI_CONVERT_FLAGS dwFlags;
    HWND hWndOwner;
    const(wchar)* lpszCaption;
    LPFNOLEUIHOOK lpfnHook;
    LPARAM lCustData;
    HINSTANCE hInstance;
    const(wchar)* lpszTemplate;
    HRSRC hResource;
    GUID clsid;
    GUID clsidConvertDefault;
    GUID clsidActivateDefault;
    GUID clsidNew;
    uint dvAspect;
    ushort wFormat;
    BOOL fIsLinkedObject;
    HGLOBAL hMetaPict;
    PWSTR lpszUserType;
    BOOL fObjectsIconChanged;
    PWSTR lpszDefLabel;
    uint cClsidExclude;
    GUID* lpClsidExclude;
}
struct OLEUICONVERTA
{
    uint cbStruct;
    UI_CONVERT_FLAGS dwFlags;
    HWND hWndOwner;
    const(char)* lpszCaption;
    LPFNOLEUIHOOK lpfnHook;
    LPARAM lCustData;
    HINSTANCE hInstance;
    const(char)* lpszTemplate;
    HRSRC hResource;
    GUID clsid;
    GUID clsidConvertDefault;
    GUID clsidActivateDefault;
    GUID clsidNew;
    uint dvAspect;
    ushort wFormat;
    BOOL fIsLinkedObject;
    HGLOBAL hMetaPict;
    PSTR lpszUserType;
    BOOL fObjectsIconChanged;
    PSTR lpszDefLabel;
    uint cClsidExclude;
    GUID* lpClsidExclude;
}
struct OLEUIBUSYW
{
    uint cbStruct;
    BUSY_DIALOG_FLAGS dwFlags;
    HWND hWndOwner;
    const(wchar)* lpszCaption;
    LPFNOLEUIHOOK lpfnHook;
    LPARAM lCustData;
    HINSTANCE hInstance;
    const(wchar)* lpszTemplate;
    HRSRC hResource;
    HTASK hTask;
    HWND* lphWndDialog;
}
struct OLEUIBUSYA
{
    uint cbStruct;
    BUSY_DIALOG_FLAGS dwFlags;
    HWND hWndOwner;
    const(char)* lpszCaption;
    LPFNOLEUIHOOK lpfnHook;
    LPARAM lCustData;
    HINSTANCE hInstance;
    const(char)* lpszTemplate;
    HRSRC hResource;
    HTASK hTask;
    HWND* lphWndDialog;
}
struct OLEUICHANGESOURCEW
{
    uint cbStruct;
    CHANGE_SOURCE_FLAGS dwFlags;
    HWND hWndOwner;
    const(wchar)* lpszCaption;
    LPFNOLEUIHOOK lpfnHook;
    LPARAM lCustData;
    HINSTANCE hInstance;
    const(wchar)* lpszTemplate;
    HRSRC hResource;
    OPENFILENAMEW* lpOFN;
    uint[4] dwReserved1;
    IOleUILinkContainerW lpOleUILinkContainer;
    uint dwLink;
    PWSTR lpszDisplayName;
    uint nFileLength;
    PWSTR lpszFrom;
    PWSTR lpszTo;
}
struct OLEUICHANGESOURCEA
{
    uint cbStruct;
    CHANGE_SOURCE_FLAGS dwFlags;
    HWND hWndOwner;
    const(char)* lpszCaption;
    LPFNOLEUIHOOK lpfnHook;
    LPARAM lCustData;
    HINSTANCE hInstance;
    const(char)* lpszTemplate;
    HRSRC hResource;
    OPENFILENAMEA* lpOFN;
    uint[4] dwReserved1;
    IOleUILinkContainerA lpOleUILinkContainer;
    uint dwLink;
    PSTR lpszDisplayName;
    uint nFileLength;
    PSTR lpszFrom;
    PSTR lpszTo;
}
// [Not Found] IID_IOleUIObjInfoW
interface IOleUIObjInfoW : IUnknown
{
    HRESULT GetObjectInfo(uint, uint*, PWSTR*, PWSTR*, PWSTR*, PWSTR*);
    HRESULT GetConvertInfo(uint, GUID*, ushort*, GUID*, GUID**, uint*);
    HRESULT ConvertObject(uint, const(GUID)*);
    HRESULT GetViewInfo(uint, HGLOBAL*, uint*, int*);
    HRESULT SetViewInfo(uint, HGLOBAL, uint, int, BOOL);
}
// [Not Found] IID_IOleUIObjInfoA
interface IOleUIObjInfoA : IUnknown
{
    HRESULT GetObjectInfo(uint, uint*, PSTR*, PSTR*, PSTR*, PSTR*);
    HRESULT GetConvertInfo(uint, GUID*, ushort*, GUID*, GUID**, uint*);
    HRESULT ConvertObject(uint, const(GUID)*);
    HRESULT GetViewInfo(uint, HGLOBAL*, uint*, int*);
    HRESULT SetViewInfo(uint, HGLOBAL, uint, int, BOOL);
}
// [Not Found] IID_IOleUILinkInfoW
interface IOleUILinkInfoW : IOleUILinkContainerW
{
    HRESULT GetLastUpdate(uint, FILETIME*);
}
// [Not Found] IID_IOleUILinkInfoA
interface IOleUILinkInfoA : IOleUILinkContainerA
{
    HRESULT GetLastUpdate(uint, FILETIME*);
}
struct OLEUIGNRLPROPSW
{
    uint cbStruct;
    uint dwFlags;
    uint[2] dwReserved1;
    LPFNOLEUIHOOK lpfnHook;
    LPARAM lCustData;
    uint[3] dwReserved2;
    OLEUIOBJECTPROPSW* lpOP;
}
struct OLEUIGNRLPROPSA
{
    uint cbStruct;
    uint dwFlags;
    uint[2] dwReserved1;
    LPFNOLEUIHOOK lpfnHook;
    LPARAM lCustData;
    uint[3] dwReserved2;
    OLEUIOBJECTPROPSA* lpOP;
}
struct OLEUIVIEWPROPSW
{
    uint cbStruct;
    VIEW_OBJECT_PROPERTIES_FLAGS dwFlags;
    uint[2] dwReserved1;
    LPFNOLEUIHOOK lpfnHook;
    LPARAM lCustData;
    uint[3] dwReserved2;
    OLEUIOBJECTPROPSW* lpOP;
    int nScaleMin;
    int nScaleMax;
}
struct OLEUIVIEWPROPSA
{
    uint cbStruct;
    VIEW_OBJECT_PROPERTIES_FLAGS dwFlags;
    uint[2] dwReserved1;
    LPFNOLEUIHOOK lpfnHook;
    LPARAM lCustData;
    uint[3] dwReserved2;
    OLEUIOBJECTPROPSA* lpOP;
    int nScaleMin;
    int nScaleMax;
}
struct OLEUILINKPROPSW
{
    uint cbStruct;
    uint dwFlags;
    uint[2] dwReserved1;
    LPFNOLEUIHOOK lpfnHook;
    LPARAM lCustData;
    uint[3] dwReserved2;
    OLEUIOBJECTPROPSW* lpOP;
}
struct OLEUILINKPROPSA
{
    uint cbStruct;
    uint dwFlags;
    uint[2] dwReserved1;
    LPFNOLEUIHOOK lpfnHook;
    LPARAM lCustData;
    uint[3] dwReserved2;
    OLEUIOBJECTPROPSA* lpOP;
}
struct OLEUIOBJECTPROPSW
{
    uint cbStruct;
    OBJECT_PROPERTIES_FLAGS dwFlags;
    PROPSHEETHEADERW_V2* lpPS;
    uint dwObject;
    IOleUIObjInfoW lpObjInfo;
    uint dwLink;
    IOleUILinkInfoW lpLinkInfo;
    OLEUIGNRLPROPSW* lpGP;
    OLEUIVIEWPROPSW* lpVP;
    OLEUILINKPROPSW* lpLP;
}
struct OLEUIOBJECTPROPSA
{
    uint cbStruct;
    OBJECT_PROPERTIES_FLAGS dwFlags;
    PROPSHEETHEADERA_V2* lpPS;
    uint dwObject;
    IOleUIObjInfoA lpObjInfo;
    uint dwLink;
    IOleUILinkInfoA lpLinkInfo;
    OLEUIGNRLPROPSA* lpGP;
    OLEUIVIEWPROPSA* lpVP;
    OLEUILINKPROPSA* lpLP;
}
enum IID_IDispatchEx = GUID(0xa6ef9860, 0xc720, 0x11d0, [0x93, 0x37, 0x0, 0xa0, 0xc9, 0xd, 0xca, 0xa9]);
interface IDispatchEx : IDispatch
{
    HRESULT GetDispID(BSTR, uint, int*);
    HRESULT InvokeEx(int, uint, ushort, DISPPARAMS*, VARIANT*, EXCEPINFO*, IServiceProvider);
    HRESULT DeleteMemberByName(BSTR, uint);
    HRESULT DeleteMemberByDispID(int);
    HRESULT GetMemberProperties(int, uint, FDEX_PROP_FLAGS*);
    HRESULT GetMemberName(int, BSTR*);
    HRESULT GetNextDispID(uint, int, int*);
    HRESULT GetNameSpaceParent(IUnknown*);
}
enum IID_IDispError = GUID(0xa6ef9861, 0xc720, 0x11d0, [0x93, 0x37, 0x0, 0xa0, 0xc9, 0xd, 0xca, 0xa9]);
interface IDispError : IUnknown
{
    HRESULT QueryErrorInfo(GUID, IDispError*);
    HRESULT GetNext(IDispError*);
    HRESULT GetHresult(HRESULT*);
    HRESULT GetSource(BSTR*);
    HRESULT GetHelpInfo(BSTR*, uint*);
    HRESULT GetDescription(BSTR*);
}
enum IID_IVariantChangeType = GUID(0xa6ef9862, 0xc720, 0x11d0, [0x93, 0x37, 0x0, 0xa0, 0xc9, 0xd, 0xca, 0xa9]);
interface IVariantChangeType : IUnknown
{
    HRESULT ChangeType(VARIANT*, VARIANT*, uint, VARENUM);
}
enum IID_IObjectIdentity = GUID(0xca04b7e6, 0xd21, 0x11d1, [0x8c, 0xc5, 0x0, 0xc0, 0x4f, 0xc2, 0xb0, 0x85]);
interface IObjectIdentity : IUnknown
{
    HRESULT IsEqualObject(IUnknown);
}
enum IID_ICanHandleException = GUID(0xc5598e60, 0xb307, 0x11d1, [0xb2, 0x7d, 0x0, 0x60, 0x8, 0xc3, 0xfb, 0xfb]);
interface ICanHandleException : IUnknown
{
    HRESULT CanHandleException(EXCEPINFO*, VARIANT*);
}
enum IID_IProvideRuntimeContext = GUID(0x10e2414a, 0xec59, 0x49d2, [0xbc, 0x51, 0x5a, 0xdd, 0x2c, 0x36, 0xfe, 0xbc]);
interface IProvideRuntimeContext : IUnknown
{
    HRESULT GetCurrentSourceContext(ulong*, VARIANT_BOOL*);
}
