module windows.win32.system.com.structuredstorage;

import windows.win32.guid : GUID;
import windows.win32.foundation : BOOL, BOOLEAN, BSTR, CHAR, DECIMAL, FILETIME, HGLOBAL, HINSTANCE, HRESULT, PSTR, PWSTR, VARIANT_BOOL;
import windows.win32.security : PSECURITY_DESCRIPTOR;
import windows.win32.system.com : BLOB, CLSCTX, COSERVERINFO, CY, DVTARGETDEVICE, IDispatch, IErrorLog, IPersist, IStream, IUnknown, MULTI_QI, SAFEARRAY, STATSTG, STGM, STGMEDIUM, StorageLayout;
import windows.win32.system.variant : PSTIME_FLAGS, VARENUM, VARIANT;

version (Windows):
extern (Windows):

alias PROPSPEC_KIND = uint;
enum : uint
{
    PRSPEC_LPWSTR = 0x00000000,
    PRSPEC_PROPID = 0x00000001,
}

alias STGFMT = uint;
enum : uint
{
    STGFMT_STORAGE  = 0x00000000,
    STGFMT_NATIVE   = 0x00000001,
    STGFMT_FILE     = 0x00000003,
    STGFMT_ANY      = 0x00000004,
    STGFMT_DOCFILE  = 0x00000005,
    STGFMT_DOCUMENT = 0x00000000,
}

HRESULT CoGetInstanceFromFile(COSERVERINFO* pServerInfo, GUID* pClsid, IUnknown punkOuter, CLSCTX dwClsCtx, uint grfMode, PWSTR pwszName, uint dwCount, MULTI_QI* pResults);
HRESULT CoGetInstanceFromIStorage(COSERVERINFO* pServerInfo, GUID* pClsid, IUnknown punkOuter, CLSCTX dwClsCtx, IStorage pstg, uint dwCount, MULTI_QI* pResults);
HRESULT StgOpenAsyncDocfileOnIFillLockBytes(IFillLockBytes pflb, uint grfMode, uint asyncFlags, IStorage* ppstgOpen);
HRESULT StgGetIFillLockBytesOnILockBytes(ILockBytes pilb, IFillLockBytes* ppflb);
HRESULT StgGetIFillLockBytesOnFile(const(wchar)* pwcsName, IFillLockBytes* ppflb);
HRESULT StgOpenLayoutDocfile(const(wchar)* pwcsDfName, uint grfMode, uint reserved, IStorage* ppstgOpen);
HRESULT CreateStreamOnHGlobal(HGLOBAL hGlobal, BOOL fDeleteOnRelease, IStream* ppstm);
HRESULT GetHGlobalFromStream(IStream pstm, HGLOBAL* phglobal);
HRESULT CoGetInterfaceAndReleaseStream(IStream pStm, const(GUID)* iid, void** ppv);
HRESULT PropVariantCopy(PROPVARIANT* pvarDest, const(PROPVARIANT)* pvarSrc);
HRESULT PropVariantClear(PROPVARIANT* pvar);
HRESULT FreePropVariantArray(uint cVariants, PROPVARIANT* rgvars);
HRESULT StgCreateDocfile(const(wchar)* pwcsName, STGM grfMode, uint reserved, IStorage* ppstgOpen);
HRESULT StgCreateDocfileOnILockBytes(ILockBytes plkbyt, STGM grfMode, uint reserved, IStorage* ppstgOpen);
HRESULT StgOpenStorage(const(wchar)* pwcsName, IStorage pstgPriority, STGM grfMode, ushort** snbExclude, uint reserved, IStorage* ppstgOpen);
HRESULT StgOpenStorageOnILockBytes(ILockBytes plkbyt, IStorage pstgPriority, STGM grfMode, ushort** snbExclude, uint reserved, IStorage* ppstgOpen);
HRESULT StgIsStorageFile(const(wchar)* pwcsName);
HRESULT StgIsStorageILockBytes(ILockBytes plkbyt);
HRESULT StgSetTimes(const(wchar)* lpszName, const(FILETIME)* pctime, const(FILETIME)* patime, const(FILETIME)* pmtime);
HRESULT StgCreateStorageEx(const(wchar)* pwcsName, STGM grfMode, STGFMT stgfmt, uint grfAttrs, STGOPTIONS* pStgOptions, PSECURITY_DESCRIPTOR pSecurityDescriptor, const(GUID)* riid, void** ppObjectOpen);
HRESULT StgOpenStorageEx(const(wchar)* pwcsName, STGM grfMode, STGFMT stgfmt, uint grfAttrs, STGOPTIONS* pStgOptions, PSECURITY_DESCRIPTOR pSecurityDescriptor, const(GUID)* riid, void** ppObjectOpen);
HRESULT StgCreatePropStg(IUnknown pUnk, const(GUID)* fmtid, const(GUID)* pclsid, uint grfFlags, uint dwReserved, IPropertyStorage* ppPropStg);
HRESULT StgOpenPropStg(IUnknown pUnk, const(GUID)* fmtid, uint grfFlags, uint dwReserved, IPropertyStorage* ppPropStg);
HRESULT StgCreatePropSetStg(IStorage pStorage, uint dwReserved, IPropertySetStorage* ppPropSetStg);
HRESULT FmtIdToPropStgName(const(GUID)* pfmtid, PWSTR oszName);
HRESULT PropStgNameToFmtId(const(wchar)* oszName, GUID* pfmtid);
HRESULT ReadClassStg(IStorage pStg, GUID* pclsid);
HRESULT WriteClassStg(IStorage pStg, const(GUID)* rclsid);
HRESULT ReadClassStm(IStream pStm, GUID* pclsid);
HRESULT WriteClassStm(IStream pStm, const(GUID)* rclsid);
HRESULT GetHGlobalFromILockBytes(ILockBytes plkbyt, HGLOBAL* phglobal);
HRESULT CreateILockBytesOnHGlobal(HGLOBAL hGlobal, BOOL fDeleteOnRelease, ILockBytes* pplkbyt);
HRESULT GetConvertStg(IStorage pStg);
SERIALIZEDPROPERTYVALUE* StgConvertVariantToProperty(const(PROPVARIANT)* pvar, ushort CodePage, SERIALIZEDPROPERTYVALUE* pprop, uint* pcb, uint pid, BOOLEAN fReserved, uint* pcIndirect);
BOOLEAN StgConvertPropertyToVariant(const(SERIALIZEDPROPERTYVALUE)* pprop, ushort CodePage, PROPVARIANT* pvar, IMemoryAllocator pma);
uint StgPropertyLengthAsVariant(const(SERIALIZEDPROPERTYVALUE)* pProp, uint cbProp, ushort CodePage, ubyte bReserved);
HRESULT WriteFmtUserTypeStg(IStorage pstg, ushort cf, PWSTR lpszUserType);
HRESULT ReadFmtUserTypeStg(IStorage pstg, ushort* pcf, PWSTR* lplpszUserType);
HRESULT OleConvertOLESTREAMToIStorage(OLESTREAM* lpolestream, IStorage pstg, const(DVTARGETDEVICE)* ptd);
HRESULT OleConvertIStorageToOLESTREAM(IStorage pstg, OLESTREAM* lpolestream);
HRESULT SetConvertStg(IStorage pStg, BOOL fConvert);
HRESULT OleConvertIStorageToOLESTREAMEx(IStorage pstg, ushort cfFormat, int lWidth, int lHeight, uint dwSize, STGMEDIUM* pmedium, OLESTREAM* polestm);
HRESULT OleConvertOLESTREAMToIStorageEx(OLESTREAM* polestm, IStorage pstg, ushort* pcfFormat, int* plwWidth, int* plHeight, uint* pdwSize, STGMEDIUM* pmedium);
HRESULT PropVariantToWinRTPropertyValue(const(PROPVARIANT)* propvar, const(GUID)* riid, void** ppv);
HRESULT WinRTPropertyValueToPropVariant(IUnknown punkPropertyValue, PROPVARIANT* ppropvar);
HRESULT InitPropVariantFromResource(HINSTANCE hinst, uint id, PROPVARIANT* ppropvar);
HRESULT InitPropVariantFromBuffer(const(void)* pv, uint cb, PROPVARIANT* ppropvar);
HRESULT InitPropVariantFromCLSID(const(GUID)* clsid, PROPVARIANT* ppropvar);
HRESULT InitPropVariantFromGUIDAsString(const(GUID)* guid, PROPVARIANT* ppropvar);
HRESULT InitPropVariantFromFileTime(const(FILETIME)* pftIn, PROPVARIANT* ppropvar);
HRESULT InitPropVariantFromPropVariantVectorElem(const(PROPVARIANT)* propvarIn, uint iElem, PROPVARIANT* ppropvar);
HRESULT InitPropVariantVectorFromPropVariant(const(PROPVARIANT)* propvarSingle, PROPVARIANT* ppropvarVector);
HRESULT InitPropVariantFromBooleanVector(const(BOOL)* prgf, uint cElems, PROPVARIANT* ppropvar);
HRESULT InitPropVariantFromInt16Vector(const(short)* prgn, uint cElems, PROPVARIANT* ppropvar);
HRESULT InitPropVariantFromUInt16Vector(const(ushort)* prgn, uint cElems, PROPVARIANT* ppropvar);
HRESULT InitPropVariantFromInt32Vector(const(int)* prgn, uint cElems, PROPVARIANT* ppropvar);
HRESULT InitPropVariantFromUInt32Vector(const(uint)* prgn, uint cElems, PROPVARIANT* ppropvar);
HRESULT InitPropVariantFromInt64Vector(const(long)* prgn, uint cElems, PROPVARIANT* ppropvar);
HRESULT InitPropVariantFromUInt64Vector(const(ulong)* prgn, uint cElems, PROPVARIANT* ppropvar);
HRESULT InitPropVariantFromDoubleVector(const(double)* prgn, uint cElems, PROPVARIANT* ppropvar);
HRESULT InitPropVariantFromFileTimeVector(const(FILETIME)* prgft, uint cElems, PROPVARIANT* ppropvar);
HRESULT InitPropVariantFromStringVector(const(wchar)** prgsz, uint cElems, PROPVARIANT* ppropvar);
HRESULT InitPropVariantFromStringAsVector(const(wchar)* psz, PROPVARIANT* ppropvar);
BOOL PropVariantToBooleanWithDefault(const(PROPVARIANT)* propvarIn, BOOL fDefault);
short PropVariantToInt16WithDefault(const(PROPVARIANT)* propvarIn, short iDefault);
ushort PropVariantToUInt16WithDefault(const(PROPVARIANT)* propvarIn, ushort uiDefault);
int PropVariantToInt32WithDefault(const(PROPVARIANT)* propvarIn, int lDefault);
uint PropVariantToUInt32WithDefault(const(PROPVARIANT)* propvarIn, uint ulDefault);
long PropVariantToInt64WithDefault(const(PROPVARIANT)* propvarIn, long llDefault);
ulong PropVariantToUInt64WithDefault(const(PROPVARIANT)* propvarIn, ulong ullDefault);
double PropVariantToDoubleWithDefault(const(PROPVARIANT)* propvarIn, double dblDefault);
PWSTR PropVariantToStringWithDefault(const(PROPVARIANT)* propvarIn, const(wchar)* pszDefault);
HRESULT PropVariantToBoolean(const(PROPVARIANT)* propvarIn, BOOL* pfRet);
HRESULT PropVariantToInt16(const(PROPVARIANT)* propvarIn, short* piRet);
HRESULT PropVariantToUInt16(const(PROPVARIANT)* propvarIn, ushort* puiRet);
HRESULT PropVariantToInt32(const(PROPVARIANT)* propvarIn, int* plRet);
HRESULT PropVariantToUInt32(const(PROPVARIANT)* propvarIn, uint* pulRet);
HRESULT PropVariantToInt64(const(PROPVARIANT)* propvarIn, long* pllRet);
HRESULT PropVariantToUInt64(const(PROPVARIANT)* propvarIn, ulong* pullRet);
HRESULT PropVariantToDouble(const(PROPVARIANT)* propvarIn, double* pdblRet);
HRESULT PropVariantToBuffer(const(PROPVARIANT)* propvar, void* pv, uint cb);
HRESULT PropVariantToString(const(PROPVARIANT)* propvar, PWSTR psz, uint cch);
HRESULT PropVariantToGUID(const(PROPVARIANT)* propvar, GUID* pguid);
HRESULT PropVariantToStringAlloc(const(PROPVARIANT)* propvar, PWSTR* ppszOut);
HRESULT PropVariantToBSTR(const(PROPVARIANT)* propvar, BSTR* pbstrOut);
HRESULT PropVariantToFileTime(const(PROPVARIANT)* propvar, PSTIME_FLAGS pstfOut, FILETIME* pftOut);
uint PropVariantGetElementCount(const(PROPVARIANT)* propvar);
HRESULT PropVariantToBooleanVector(const(PROPVARIANT)* propvar, BOOL* prgf, uint crgf, uint* pcElem);
HRESULT PropVariantToInt16Vector(const(PROPVARIANT)* propvar, short* prgn, uint crgn, uint* pcElem);
HRESULT PropVariantToUInt16Vector(const(PROPVARIANT)* propvar, ushort* prgn, uint crgn, uint* pcElem);
HRESULT PropVariantToInt32Vector(const(PROPVARIANT)* propvar, int* prgn, uint crgn, uint* pcElem);
HRESULT PropVariantToUInt32Vector(const(PROPVARIANT)* propvar, uint* prgn, uint crgn, uint* pcElem);
HRESULT PropVariantToInt64Vector(const(PROPVARIANT)* propvar, long* prgn, uint crgn, uint* pcElem);
HRESULT PropVariantToUInt64Vector(const(PROPVARIANT)* propvar, ulong* prgn, uint crgn, uint* pcElem);
HRESULT PropVariantToDoubleVector(const(PROPVARIANT)* propvar, double* prgn, uint crgn, uint* pcElem);
HRESULT PropVariantToFileTimeVector(const(PROPVARIANT)* propvar, FILETIME* prgft, uint crgft, uint* pcElem);
HRESULT PropVariantToStringVector(const(PROPVARIANT)* propvar, PWSTR* prgsz, uint crgsz, uint* pcElem);
HRESULT PropVariantToBooleanVectorAlloc(const(PROPVARIANT)* propvar, BOOL** pprgf, uint* pcElem);
HRESULT PropVariantToInt16VectorAlloc(const(PROPVARIANT)* propvar, short** pprgn, uint* pcElem);
HRESULT PropVariantToUInt16VectorAlloc(const(PROPVARIANT)* propvar, ushort** pprgn, uint* pcElem);
HRESULT PropVariantToInt32VectorAlloc(const(PROPVARIANT)* propvar, int** pprgn, uint* pcElem);
HRESULT PropVariantToUInt32VectorAlloc(const(PROPVARIANT)* propvar, uint** pprgn, uint* pcElem);
HRESULT PropVariantToInt64VectorAlloc(const(PROPVARIANT)* propvar, long** pprgn, uint* pcElem);
HRESULT PropVariantToUInt64VectorAlloc(const(PROPVARIANT)* propvar, ulong** pprgn, uint* pcElem);
HRESULT PropVariantToDoubleVectorAlloc(const(PROPVARIANT)* propvar, double** pprgn, uint* pcElem);
HRESULT PropVariantToFileTimeVectorAlloc(const(PROPVARIANT)* propvar, FILETIME** pprgft, uint* pcElem);
HRESULT PropVariantToStringVectorAlloc(const(PROPVARIANT)* propvar, PWSTR** pprgsz, uint* pcElem);
HRESULT PropVariantGetBooleanElem(const(PROPVARIANT)* propvar, uint iElem, BOOL* pfVal);
HRESULT PropVariantGetInt16Elem(const(PROPVARIANT)* propvar, uint iElem, short* pnVal);
HRESULT PropVariantGetUInt16Elem(const(PROPVARIANT)* propvar, uint iElem, ushort* pnVal);
HRESULT PropVariantGetInt32Elem(const(PROPVARIANT)* propvar, uint iElem, int* pnVal);
HRESULT PropVariantGetUInt32Elem(const(PROPVARIANT)* propvar, uint iElem, uint* pnVal);
HRESULT PropVariantGetInt64Elem(const(PROPVARIANT)* propvar, uint iElem, long* pnVal);
HRESULT PropVariantGetUInt64Elem(const(PROPVARIANT)* propvar, uint iElem, ulong* pnVal);
HRESULT PropVariantGetDoubleElem(const(PROPVARIANT)* propvar, uint iElem, double* pnVal);
HRESULT PropVariantGetFileTimeElem(const(PROPVARIANT)* propvar, uint iElem, FILETIME* pftVal);
HRESULT PropVariantGetStringElem(const(PROPVARIANT)* propvar, uint iElem, PWSTR* ppszVal);
void ClearPropVariantArray(PROPVARIANT* rgPropVar, uint cVars);
int PropVariantCompareEx(const(PROPVARIANT)* propvar1, const(PROPVARIANT)* propvar2, PROPVAR_COMPARE_UNIT unit, PROPVAR_COMPARE_FLAGS flags);
HRESULT PropVariantChangeType(PROPVARIANT* ppropvarDest, const(PROPVARIANT)* propvarSrc, PROPVAR_CHANGE_FLAGS flags, VARENUM vt);
HRESULT PropVariantToVariant(const(PROPVARIANT)* pPropVar, VARIANT* pVar);
HRESULT VariantToPropVariant(const(VARIANT)* pVar, PROPVARIANT* pPropVar);
HRESULT StgSerializePropVariant(const(PROPVARIANT)* ppropvar, SERIALIZEDPROPERTYVALUE** ppProp, uint* pcb);
HRESULT StgDeserializePropVariant(const(SERIALIZEDPROPERTYVALUE)* pprop, uint cbMax, PROPVARIANT* ppropvar);
enum PROPSETFLAG_DEFAULT = 0x00000000;
enum PROPSETFLAG_NONSIMPLE = 0x00000001;
enum PROPSETFLAG_ANSI = 0x00000002;
enum PROPSETFLAG_UNBUFFERED = 0x00000004;
enum PROPSETFLAG_CASE_SENSITIVE = 0x00000008;
enum PROPSET_BEHAVIOR_CASE_SENSITIVE = 0x00000001;
enum PID_DICTIONARY = 0x00000000;
enum PID_CODEPAGE = 0x00000001;
enum PID_FIRST_USABLE = 0x00000002;
enum PID_FIRST_NAME_DEFAULT = 0x00000fff;
enum PID_LOCALE = 0x80000000;
enum PID_MODIFY_TIME = 0x80000001;
enum PID_SECURITY = 0x80000002;
enum PID_BEHAVIOR = 0x80000003;
enum PID_ILLEGAL = 0xffffffff;
enum PID_MIN_READONLY = 0x80000000;
enum PID_MAX_READONLY = 0xbfffffff;
enum PRSPEC_INVALID = 0xffffffff;
enum PROPSETHDR_OSVERSION_UNKNOWN = 0xffffffff;
enum PIDDI_THUMBNAIL = 0x00000002;
enum PIDSI_TITLE = 0x00000002;
enum PIDSI_SUBJECT = 0x00000003;
enum PIDSI_AUTHOR = 0x00000004;
enum PIDSI_KEYWORDS = 0x00000005;
enum PIDSI_COMMENTS = 0x00000006;
enum PIDSI_TEMPLATE = 0x00000007;
enum PIDSI_LASTAUTHOR = 0x00000008;
enum PIDSI_REVNUMBER = 0x00000009;
enum PIDSI_EDITTIME = 0x0000000a;
enum PIDSI_LASTPRINTED = 0x0000000b;
enum PIDSI_CREATE_DTM = 0x0000000c;
enum PIDSI_LASTSAVE_DTM = 0x0000000d;
enum PIDSI_PAGECOUNT = 0x0000000e;
enum PIDSI_WORDCOUNT = 0x0000000f;
enum PIDSI_CHARCOUNT = 0x00000010;
enum PIDSI_THUMBNAIL = 0x00000011;
enum PIDSI_APPNAME = 0x00000012;
enum PIDSI_DOC_SECURITY = 0x00000013;
enum PIDDSI_CATEGORY = 0x00000002;
enum PIDDSI_PRESFORMAT = 0x00000003;
enum PIDDSI_BYTECOUNT = 0x00000004;
enum PIDDSI_LINECOUNT = 0x00000005;
enum PIDDSI_PARCOUNT = 0x00000006;
enum PIDDSI_SLIDECOUNT = 0x00000007;
enum PIDDSI_NOTECOUNT = 0x00000008;
enum PIDDSI_HIDDENCOUNT = 0x00000009;
enum PIDDSI_MMCLIPCOUNT = 0x0000000a;
enum PIDDSI_SCALE = 0x0000000b;
enum PIDDSI_HEADINGPAIR = 0x0000000c;
enum PIDDSI_DOCPARTS = 0x0000000d;
enum PIDDSI_MANAGER = 0x0000000e;
enum PIDDSI_COMPANY = 0x0000000f;
enum PIDDSI_LINKSDIRTY = 0x00000010;
enum PIDMSI_EDITOR = 0x00000002;
enum PIDMSI_SUPPLIER = 0x00000003;
enum PIDMSI_SOURCE = 0x00000004;
enum PIDMSI_SEQUENCE_NO = 0x00000005;
enum PIDMSI_PROJECT = 0x00000006;
enum PIDMSI_STATUS = 0x00000007;
enum PIDMSI_OWNER = 0x00000008;
enum PIDMSI_RATING = 0x00000009;
enum PIDMSI_PRODUCTION = 0x0000000a;
enum PIDMSI_COPYRIGHT = 0x0000000b;
enum CWCSTORAGENAME = 0x00000020;
enum STGOPTIONS_VERSION = 0x00000001;
enum CCH_MAX_PROPSTG_NAME = 0x0000001f;
alias STGMOVE = int;
enum : int
{
    STGMOVE_MOVE        = 0x00000000,
    STGMOVE_COPY        = 0x00000001,
    STGMOVE_SHALLOWCOPY = 0x00000002,
}

struct BSTRBLOB
{
    uint cbSize;
    ubyte* pData;
}
struct CLIPDATA
{
    uint cbSize;
    int ulClipFmt;
    ubyte* pClipData;
}
enum IID_IEnumSTATSTG = GUID(0xd, 0x0, 0x0, [0xc0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x46]);
interface IEnumSTATSTG : IUnknown
{
    HRESULT Next(uint celt, STATSTG* rgelt, uint* pceltFetched);
    HRESULT Skip(uint celt);
    HRESULT Reset();
    HRESULT Clone(IEnumSTATSTG* ppenum);
}
struct RemSNB
{
    uint ulCntStr;
    uint ulCntChar;
    wchar[1] rgString;
}
enum IID_IStorage = GUID(0xb, 0x0, 0x0, [0xc0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x46]);
interface IStorage : IUnknown
{
    HRESULT CreateStream(const(wchar)* pwcsName, STGM grfMode, uint reserved1, uint reserved2, IStream* ppstm);
    HRESULT OpenStream(const(wchar)* pwcsName, void* reserved1, STGM grfMode, uint reserved2, IStream* ppstm);
    HRESULT CreateStorage(const(wchar)* pwcsName, STGM grfMode, uint reserved1, uint reserved2, IStorage* ppstg);
    HRESULT OpenStorage(const(wchar)* pwcsName, IStorage pstgPriority, STGM grfMode, ushort** snbExclude, uint reserved, IStorage* ppstg);
    HRESULT CopyTo(uint ciidExclude, const(GUID)* rgiidExclude, ushort** snbExclude, IStorage pstgDest);
    HRESULT MoveElementTo(const(wchar)* pwcsName, IStorage pstgDest, const(wchar)* pwcsNewName, uint grfFlags);
    HRESULT Commit(uint grfCommitFlags);
    HRESULT Revert();
    HRESULT EnumElements(uint reserved1, void* reserved2, uint reserved3, IEnumSTATSTG* ppenum);
    HRESULT DestroyElement(const(wchar)* pwcsName);
    HRESULT RenameElement(const(wchar)* pwcsOldName, const(wchar)* pwcsNewName);
    HRESULT SetElementTimes(const(wchar)* pwcsName, const(FILETIME)* pctime, const(FILETIME)* patime, const(FILETIME)* pmtime);
    HRESULT SetClass(const(GUID)* clsid);
    HRESULT SetStateBits(uint grfStateBits, uint grfMask);
    HRESULT Stat(STATSTG* pstatstg, uint grfStatFlag);
}
enum IID_IPersistStorage = GUID(0x10a, 0x0, 0x0, [0xc0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x46]);
interface IPersistStorage : IPersist
{
    HRESULT IsDirty();
    HRESULT InitNew(IStorage pStg);
    HRESULT Load(IStorage pStg);
    HRESULT Save(IStorage pStgSave, BOOL fSameAsLoad);
    HRESULT SaveCompleted(IStorage pStgNew);
    HRESULT HandsOffStorage();
}
enum IID_ILockBytes = GUID(0xa, 0x0, 0x0, [0xc0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x46]);
interface ILockBytes : IUnknown
{
    HRESULT ReadAt(ulong ulOffset, void* pv, uint cb, uint* pcbRead);
    HRESULT WriteAt(ulong ulOffset, const(void)* pv, uint cb, uint* pcbWritten);
    HRESULT Flush();
    HRESULT SetSize(ulong cb);
    HRESULT LockRegion(ulong libOffset, ulong cb, uint dwLockType);
    HRESULT UnlockRegion(ulong libOffset, ulong cb, uint dwLockType);
    HRESULT Stat(STATSTG* pstatstg, uint grfStatFlag);
}
enum IID_IRootStorage = GUID(0x12, 0x0, 0x0, [0xc0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x46]);
interface IRootStorage : IUnknown
{
    HRESULT SwitchToFile(PWSTR pszFile);
}
enum IID_IFillLockBytes = GUID(0x99caf010, 0x415e, 0x11cf, [0x88, 0x14, 0x0, 0xaa, 0x0, 0xb5, 0x69, 0xf5]);
interface IFillLockBytes : IUnknown
{
    HRESULT FillAppend(const(void)* pv, uint cb, uint* pcbWritten);
    HRESULT FillAt(ulong ulOffset, const(void)* pv, uint cb, uint* pcbWritten);
    HRESULT SetFillSize(ulong ulSize);
    HRESULT Terminate(BOOL bCanceled);
}
enum IID_ILayoutStorage = GUID(0xe6d4d90, 0x6738, 0x11cf, [0x96, 0x8, 0x0, 0xaa, 0x0, 0x68, 0xd, 0xb4]);
interface ILayoutStorage : IUnknown
{
    HRESULT LayoutScript(StorageLayout* pStorageLayout, uint nEntries, uint glfInterleavedFlag);
    HRESULT BeginMonitor();
    HRESULT EndMonitor();
    HRESULT ReLayoutDocfile(PWSTR pwcsNewDfName);
    HRESULT ReLayoutDocfileOnILockBytes(ILockBytes pILockBytes);
}
enum IID_IDirectWriterLock = GUID(0xe6d4d92, 0x6738, 0x11cf, [0x96, 0x8, 0x0, 0xaa, 0x0, 0x68, 0xd, 0xb4]);
interface IDirectWriterLock : IUnknown
{
    HRESULT WaitForWriteAccess(uint dwTimeout);
    HRESULT ReleaseWriteAccess();
    HRESULT HaveWriteAccess();
}
struct VERSIONEDSTREAM
{
    GUID guidVersion;
    IStream pStream;
}
struct CAC
{
    uint cElems;
    PSTR pElems;
}
struct CAUB
{
    uint cElems;
    ubyte* pElems;
}
struct CAI
{
    uint cElems;
    short* pElems;
}
struct CAUI
{
    uint cElems;
    ushort* pElems;
}
struct CAL
{
    uint cElems;
    int* pElems;
}
struct CAUL
{
    uint cElems;
    uint* pElems;
}
struct CAFLT
{
    uint cElems;
    float* pElems;
}
struct CADBL
{
    uint cElems;
    double* pElems;
}
struct CACY
{
    uint cElems;
    CY* pElems;
}
struct CADATE
{
    uint cElems;
    double* pElems;
}
struct CABSTR
{
    uint cElems;
    BSTR* pElems;
}
struct CABSTRBLOB
{
    uint cElems;
    BSTRBLOB* pElems;
}
struct CABOOL
{
    uint cElems;
    VARIANT_BOOL* pElems;
}
struct CASCODE
{
    uint cElems;
    int* pElems;
}
struct CAPROPVARIANT
{
    uint cElems;
    PROPVARIANT* pElems;
}
struct CAH
{
    uint cElems;
    long* pElems;
}
struct CAUH
{
    uint cElems;
    ulong* pElems;
}
struct CALPSTR
{
    uint cElems;
    PSTR* pElems;
}
struct CALPWSTR
{
    uint cElems;
    PWSTR* pElems;
}
struct CAFILETIME
{
    uint cElems;
    FILETIME* pElems;
}
struct CACLIPDATA
{
    uint cElems;
    CLIPDATA* pElems;
}
struct CACLSID
{
    uint cElems;
    GUID* pElems;
}
struct PROPVARIANT
{
    union
    {
        struct
        {
            VARENUM vt;
            ushort wReserved1;
            ushort wReserved2;
            ushort wReserved3;
            union
            {
                CHAR cVal;
                ubyte bVal;
                short iVal;
                ushort uiVal;
                int lVal;
                uint ulVal;
                int intVal;
                uint uintVal;
                long hVal;
                ulong uhVal;
                float fltVal;
                double dblVal;
                VARIANT_BOOL boolVal;
                VARIANT_BOOL __OBSOLETE__VARIANT_BOOL;
                int scode;
                CY cyVal;
                double date;
                FILETIME filetime;
                GUID* puuid;
                CLIPDATA* pclipdata;
                BSTR bstrVal;
                BSTRBLOB bstrblobVal;
                BLOB blob;
                PSTR pszVal;
                PWSTR pwszVal;
                IUnknown punkVal;
                IDispatch pdispVal;
                IStream pStream;
                IStorage pStorage;
                VERSIONEDSTREAM* pVersionedStream;
                SAFEARRAY* parray;
                CAC cac;
                CAUB caub;
                CAI cai;
                CAUI caui;
                CAL cal;
                CAUL caul;
                CAH cah;
                CAUH cauh;
                CAFLT caflt;
                CADBL cadbl;
                CABOOL cabool;
                CASCODE cascode;
                CACY cacy;
                CADATE cadate;
                CAFILETIME cafiletime;
                CACLSID cauuid;
                CACLIPDATA caclipdata;
                CABSTR cabstr;
                CABSTRBLOB cabstrblob;
                CALPSTR calpstr;
                CALPWSTR calpwstr;
                CAPROPVARIANT capropvar;
                PSTR pcVal;
                ubyte* pbVal;
                short* piVal;
                ushort* puiVal;
                int* plVal;
                uint* pulVal;
                int* pintVal;
                uint* puintVal;
                float* pfltVal;
                double* pdblVal;
                VARIANT_BOOL* pboolVal;
                DECIMAL* pdecVal;
                int* pscode;
                CY* pcyVal;
                double* pdate;
                BSTR* pbstrVal;
                IUnknown* ppunkVal;
                IDispatch* ppdispVal;
                SAFEARRAY** pparray;
                PROPVARIANT* pvarVal;
            }
        }
        DECIMAL decVal;
    }
}
struct PROPSPEC
{
    PROPSPEC_KIND ulKind;
    union
    {
        uint propid;
        PWSTR lpwstr;
    }
}
struct STATPROPSTG
{
    PWSTR lpwstrName;
    uint propid;
    VARENUM vt;
}
struct STATPROPSETSTG
{
    GUID fmtid;
    GUID clsid;
    uint grfFlags;
    FILETIME mtime;
    FILETIME ctime;
    FILETIME atime;
    uint dwOSVersion;
}
enum IID_IPropertyStorage = GUID(0x138, 0x0, 0x0, [0xc0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x46]);
interface IPropertyStorage : IUnknown
{
    HRESULT ReadMultiple(uint cpspec, const(PROPSPEC)* rgpspec, PROPVARIANT* rgpropvar);
    HRESULT WriteMultiple(uint cpspec, const(PROPSPEC)* rgpspec, const(PROPVARIANT)* rgpropvar, uint propidNameFirst);
    HRESULT DeleteMultiple(uint cpspec, const(PROPSPEC)* rgpspec);
    HRESULT ReadPropertyNames(uint cpropid, const(uint)* rgpropid, PWSTR* rglpwstrName);
    HRESULT WritePropertyNames(uint cpropid, const(uint)* rgpropid, const(wchar)** rglpwstrName);
    HRESULT DeletePropertyNames(uint cpropid, const(uint)* rgpropid);
    HRESULT Commit(uint grfCommitFlags);
    HRESULT Revert();
    HRESULT Enum(IEnumSTATPROPSTG* ppenum);
    HRESULT SetTimes(const(FILETIME)* pctime, const(FILETIME)* patime, const(FILETIME)* pmtime);
    HRESULT SetClass(const(GUID)* clsid);
    HRESULT Stat(STATPROPSETSTG* pstatpsstg);
}
enum IID_IPropertySetStorage = GUID(0x13a, 0x0, 0x0, [0xc0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x46]);
interface IPropertySetStorage : IUnknown
{
    HRESULT Create(const(GUID)* rfmtid, const(GUID)* pclsid, uint grfFlags, uint grfMode, IPropertyStorage* ppprstg);
    HRESULT Open(const(GUID)* rfmtid, uint grfMode, IPropertyStorage* ppprstg);
    HRESULT Delete(const(GUID)* rfmtid);
    HRESULT Enum(IEnumSTATPROPSETSTG* ppenum);
}
enum IID_IEnumSTATPROPSTG = GUID(0x139, 0x0, 0x0, [0xc0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x46]);
interface IEnumSTATPROPSTG : IUnknown
{
    HRESULT Next(uint celt, STATPROPSTG* rgelt, uint* pceltFetched);
    HRESULT Skip(uint celt);
    HRESULT Reset();
    HRESULT Clone(IEnumSTATPROPSTG* ppenum);
}
enum IID_IEnumSTATPROPSETSTG = GUID(0x13b, 0x0, 0x0, [0xc0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x46]);
interface IEnumSTATPROPSETSTG : IUnknown
{
    HRESULT Next(uint celt, STATPROPSETSTG* rgelt, uint* pceltFetched);
    HRESULT Skip(uint celt);
    HRESULT Reset();
    HRESULT Clone(IEnumSTATPROPSETSTG* ppenum);
}
struct STGOPTIONS
{
    ushort usVersion;
    ushort reserved;
    uint ulSectorSize;
    const(wchar)* pwcsTemplateFile;
}
alias PIDMSI_STATUS_VALUE = int;
enum : int
{
    PIDMSI_STATUS_NORMAL     = 0x00000000,
    PIDMSI_STATUS_NEW        = 0x00000001,
    PIDMSI_STATUS_PRELIM     = 0x00000002,
    PIDMSI_STATUS_DRAFT      = 0x00000003,
    PIDMSI_STATUS_INPROGRESS = 0x00000004,
    PIDMSI_STATUS_EDIT       = 0x00000005,
    PIDMSI_STATUS_REVIEW     = 0x00000006,
    PIDMSI_STATUS_PROOF      = 0x00000007,
    PIDMSI_STATUS_FINAL      = 0x00000008,
    PIDMSI_STATUS_OTHER      = 0x00007fff,
}

struct SERIALIZEDPROPERTYVALUE
{
    uint dwType;
    ubyte[1] rgb;
}
// [Not Found] IID_IMemoryAllocator
interface IMemoryAllocator
{
    void* Allocate(uint cbSize);
    void Free(void* pv);
}
enum IID_IPropertyBag = GUID(0x55272a00, 0x42cb, 0x11ce, [0x81, 0x35, 0x0, 0xaa, 0x0, 0x4b, 0xb8, 0x51]);
interface IPropertyBag : IUnknown
{
    HRESULT Read(const(wchar)* pszPropName, VARIANT* pVar, IErrorLog pErrorLog);
    HRESULT Write(const(wchar)* pszPropName, VARIANT* pVar);
}
struct OLESTREAMVTBL
{
    long Get;
    long Put;
}
struct OLESTREAM
{
    OLESTREAMVTBL* lpstbl;
}
struct PROPBAG2
{
    uint dwType;
    VARENUM vt;
    ushort cfType;
    uint dwHint;
    PWSTR pstrName;
    GUID clsid;
}
enum IID_IPropertyBag2 = GUID(0x22f55882, 0x280b, 0x11d0, [0xa8, 0xa9, 0x0, 0xa0, 0xc9, 0xc, 0x20, 0x4]);
interface IPropertyBag2 : IUnknown
{
    HRESULT Read(uint cProperties, PROPBAG2* pPropBag, IErrorLog pErrLog, VARIANT* pvarValue, HRESULT* phrError);
    HRESULT Write(uint cProperties, PROPBAG2* pPropBag, VARIANT* pvarValue);
    HRESULT CountProperties(uint* pcProperties);
    HRESULT GetPropertyInfo(uint iProperty, uint cProperties, PROPBAG2* pPropBag, uint* pcProperties);
    HRESULT LoadObject(const(wchar)* pstrName, uint dwHint, IUnknown pUnkObject, IErrorLog pErrLog);
}
alias PROPVAR_COMPARE_UNIT = int;
enum : int
{
    PVCU_DEFAULT = 0x00000000,
    PVCU_SECOND  = 0x00000001,
    PVCU_MINUTE  = 0x00000002,
    PVCU_HOUR    = 0x00000003,
    PVCU_DAY     = 0x00000004,
    PVCU_MONTH   = 0x00000005,
    PVCU_YEAR    = 0x00000006,
}

alias PROPVAR_COMPARE_FLAGS = int;
enum : int
{
    PVCF_DEFAULT                       = 0x00000000,
    PVCF_TREATEMPTYASGREATERTHAN       = 0x00000001,
    PVCF_USESTRCMP                     = 0x00000002,
    PVCF_USESTRCMPC                    = 0x00000004,
    PVCF_USESTRCMPI                    = 0x00000008,
    PVCF_USESTRCMPIC                   = 0x00000010,
    PVCF_DIGITSASNUMBERS_CASESENSITIVE = 0x00000020,
}

alias PROPVAR_CHANGE_FLAGS = int;
enum : int
{
    PVCHF_DEFAULT        = 0x00000000,
    PVCHF_NOVALUEPROP    = 0x00000001,
    PVCHF_ALPHABOOL      = 0x00000002,
    PVCHF_NOUSEROVERRIDE = 0x00000004,
    PVCHF_LOCALBOOL      = 0x00000008,
    PVCHF_NOHEXSTRING    = 0x00000010,
}

