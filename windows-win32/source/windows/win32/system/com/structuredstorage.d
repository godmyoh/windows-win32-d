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

HRESULT CoGetInstanceFromFile(COSERVERINFO*, GUID*, IUnknown, CLSCTX, uint, PWSTR, uint, MULTI_QI*);
HRESULT CoGetInstanceFromIStorage(COSERVERINFO*, GUID*, IUnknown, CLSCTX, IStorage, uint, MULTI_QI*);
HRESULT StgOpenAsyncDocfileOnIFillLockBytes(IFillLockBytes, uint, uint, IStorage*);
HRESULT StgGetIFillLockBytesOnILockBytes(ILockBytes, IFillLockBytes*);
HRESULT StgGetIFillLockBytesOnFile(const(wchar)*, IFillLockBytes*);
HRESULT StgOpenLayoutDocfile(const(wchar)*, uint, uint, IStorage*);
HRESULT CreateStreamOnHGlobal(HGLOBAL, BOOL, IStream*);
HRESULT GetHGlobalFromStream(IStream, HGLOBAL*);
HRESULT CoGetInterfaceAndReleaseStream(IStream, const(GUID)*, void**);
HRESULT PropVariantCopy(PROPVARIANT*, const(PROPVARIANT)*);
HRESULT PropVariantClear(PROPVARIANT*);
HRESULT FreePropVariantArray(uint, PROPVARIANT*);
HRESULT StgCreateDocfile(const(wchar)*, STGM, uint, IStorage*);
HRESULT StgCreateDocfileOnILockBytes(ILockBytes, STGM, uint, IStorage*);
HRESULT StgOpenStorage(const(wchar)*, IStorage, STGM, ushort**, uint, IStorage*);
HRESULT StgOpenStorageOnILockBytes(ILockBytes, IStorage, STGM, ushort**, uint, IStorage*);
HRESULT StgIsStorageFile(const(wchar)*);
HRESULT StgIsStorageILockBytes(ILockBytes);
HRESULT StgSetTimes(const(wchar)*, const(FILETIME)*, const(FILETIME)*, const(FILETIME)*);
HRESULT StgCreateStorageEx(const(wchar)*, STGM, STGFMT, uint, STGOPTIONS*, PSECURITY_DESCRIPTOR, const(GUID)*, void**);
HRESULT StgOpenStorageEx(const(wchar)*, STGM, STGFMT, uint, STGOPTIONS*, PSECURITY_DESCRIPTOR, const(GUID)*, void**);
HRESULT StgCreatePropStg(IUnknown, const(GUID)*, const(GUID)*, uint, uint, IPropertyStorage*);
HRESULT StgOpenPropStg(IUnknown, const(GUID)*, uint, uint, IPropertyStorage*);
HRESULT StgCreatePropSetStg(IStorage, uint, IPropertySetStorage*);
HRESULT FmtIdToPropStgName(const(GUID)*, PWSTR);
HRESULT PropStgNameToFmtId(const(wchar)*, GUID*);
HRESULT ReadClassStg(IStorage, GUID*);
HRESULT WriteClassStg(IStorage, const(GUID)*);
HRESULT ReadClassStm(IStream, GUID*);
HRESULT WriteClassStm(IStream, const(GUID)*);
HRESULT GetHGlobalFromILockBytes(ILockBytes, HGLOBAL*);
HRESULT CreateILockBytesOnHGlobal(HGLOBAL, BOOL, ILockBytes*);
HRESULT GetConvertStg(IStorage);
SERIALIZEDPROPERTYVALUE* StgConvertVariantToProperty(const(PROPVARIANT)*, ushort, SERIALIZEDPROPERTYVALUE*, uint*, uint, BOOLEAN, uint*);
BOOLEAN StgConvertPropertyToVariant(const(SERIALIZEDPROPERTYVALUE)*, ushort, PROPVARIANT*, IMemoryAllocator);
uint StgPropertyLengthAsVariant(const(SERIALIZEDPROPERTYVALUE)*, uint, ushort, ubyte);
HRESULT WriteFmtUserTypeStg(IStorage, ushort, PWSTR);
HRESULT ReadFmtUserTypeStg(IStorage, ushort*, PWSTR*);
HRESULT OleConvertOLESTREAMToIStorage(OLESTREAM*, IStorage, const(DVTARGETDEVICE)*);
HRESULT OleConvertIStorageToOLESTREAM(IStorage, OLESTREAM*);
HRESULT SetConvertStg(IStorage, BOOL);
HRESULT OleConvertIStorageToOLESTREAMEx(IStorage, ushort, int, int, uint, STGMEDIUM*, OLESTREAM*);
HRESULT OleConvertOLESTREAMToIStorageEx(OLESTREAM*, IStorage, ushort*, int*, int*, uint*, STGMEDIUM*);
HRESULT PropVariantToWinRTPropertyValue(const(PROPVARIANT)*, const(GUID)*, void**);
HRESULT WinRTPropertyValueToPropVariant(IUnknown, PROPVARIANT*);
HRESULT InitPropVariantFromResource(HINSTANCE, uint, PROPVARIANT*);
HRESULT InitPropVariantFromBuffer(const(void)*, uint, PROPVARIANT*);
HRESULT InitPropVariantFromCLSID(const(GUID)*, PROPVARIANT*);
HRESULT InitPropVariantFromGUIDAsString(const(GUID)*, PROPVARIANT*);
HRESULT InitPropVariantFromFileTime(const(FILETIME)*, PROPVARIANT*);
HRESULT InitPropVariantFromPropVariantVectorElem(const(PROPVARIANT)*, uint, PROPVARIANT*);
HRESULT InitPropVariantVectorFromPropVariant(const(PROPVARIANT)*, PROPVARIANT*);
HRESULT InitPropVariantFromBooleanVector(const(BOOL)*, uint, PROPVARIANT*);
HRESULT InitPropVariantFromInt16Vector(const(short)*, uint, PROPVARIANT*);
HRESULT InitPropVariantFromUInt16Vector(const(ushort)*, uint, PROPVARIANT*);
HRESULT InitPropVariantFromInt32Vector(const(int)*, uint, PROPVARIANT*);
HRESULT InitPropVariantFromUInt32Vector(const(uint)*, uint, PROPVARIANT*);
HRESULT InitPropVariantFromInt64Vector(const(long)*, uint, PROPVARIANT*);
HRESULT InitPropVariantFromUInt64Vector(const(ulong)*, uint, PROPVARIANT*);
HRESULT InitPropVariantFromDoubleVector(const(double)*, uint, PROPVARIANT*);
HRESULT InitPropVariantFromFileTimeVector(const(FILETIME)*, uint, PROPVARIANT*);
HRESULT InitPropVariantFromStringVector(const(wchar)**, uint, PROPVARIANT*);
HRESULT InitPropVariantFromStringAsVector(const(wchar)*, PROPVARIANT*);
BOOL PropVariantToBooleanWithDefault(const(PROPVARIANT)*, BOOL);
short PropVariantToInt16WithDefault(const(PROPVARIANT)*, short);
ushort PropVariantToUInt16WithDefault(const(PROPVARIANT)*, ushort);
int PropVariantToInt32WithDefault(const(PROPVARIANT)*, int);
uint PropVariantToUInt32WithDefault(const(PROPVARIANT)*, uint);
long PropVariantToInt64WithDefault(const(PROPVARIANT)*, long);
ulong PropVariantToUInt64WithDefault(const(PROPVARIANT)*, ulong);
double PropVariantToDoubleWithDefault(const(PROPVARIANT)*, double);
PWSTR PropVariantToStringWithDefault(const(PROPVARIANT)*, const(wchar)*);
HRESULT PropVariantToBoolean(const(PROPVARIANT)*, BOOL*);
HRESULT PropVariantToInt16(const(PROPVARIANT)*, short*);
HRESULT PropVariantToUInt16(const(PROPVARIANT)*, ushort*);
HRESULT PropVariantToInt32(const(PROPVARIANT)*, int*);
HRESULT PropVariantToUInt32(const(PROPVARIANT)*, uint*);
HRESULT PropVariantToInt64(const(PROPVARIANT)*, long*);
HRESULT PropVariantToUInt64(const(PROPVARIANT)*, ulong*);
HRESULT PropVariantToDouble(const(PROPVARIANT)*, double*);
HRESULT PropVariantToBuffer(const(PROPVARIANT)*, void*, uint);
HRESULT PropVariantToString(const(PROPVARIANT)*, PWSTR, uint);
HRESULT PropVariantToGUID(const(PROPVARIANT)*, GUID*);
HRESULT PropVariantToStringAlloc(const(PROPVARIANT)*, PWSTR*);
HRESULT PropVariantToBSTR(const(PROPVARIANT)*, BSTR*);
HRESULT PropVariantToFileTime(const(PROPVARIANT)*, PSTIME_FLAGS, FILETIME*);
uint PropVariantGetElementCount(const(PROPVARIANT)*);
HRESULT PropVariantToBooleanVector(const(PROPVARIANT)*, BOOL*, uint, uint*);
HRESULT PropVariantToInt16Vector(const(PROPVARIANT)*, short*, uint, uint*);
HRESULT PropVariantToUInt16Vector(const(PROPVARIANT)*, ushort*, uint, uint*);
HRESULT PropVariantToInt32Vector(const(PROPVARIANT)*, int*, uint, uint*);
HRESULT PropVariantToUInt32Vector(const(PROPVARIANT)*, uint*, uint, uint*);
HRESULT PropVariantToInt64Vector(const(PROPVARIANT)*, long*, uint, uint*);
HRESULT PropVariantToUInt64Vector(const(PROPVARIANT)*, ulong*, uint, uint*);
HRESULT PropVariantToDoubleVector(const(PROPVARIANT)*, double*, uint, uint*);
HRESULT PropVariantToFileTimeVector(const(PROPVARIANT)*, FILETIME*, uint, uint*);
HRESULT PropVariantToStringVector(const(PROPVARIANT)*, PWSTR*, uint, uint*);
HRESULT PropVariantToBooleanVectorAlloc(const(PROPVARIANT)*, BOOL**, uint*);
HRESULT PropVariantToInt16VectorAlloc(const(PROPVARIANT)*, short**, uint*);
HRESULT PropVariantToUInt16VectorAlloc(const(PROPVARIANT)*, ushort**, uint*);
HRESULT PropVariantToInt32VectorAlloc(const(PROPVARIANT)*, int**, uint*);
HRESULT PropVariantToUInt32VectorAlloc(const(PROPVARIANT)*, uint**, uint*);
HRESULT PropVariantToInt64VectorAlloc(const(PROPVARIANT)*, long**, uint*);
HRESULT PropVariantToUInt64VectorAlloc(const(PROPVARIANT)*, ulong**, uint*);
HRESULT PropVariantToDoubleVectorAlloc(const(PROPVARIANT)*, double**, uint*);
HRESULT PropVariantToFileTimeVectorAlloc(const(PROPVARIANT)*, FILETIME**, uint*);
HRESULT PropVariantToStringVectorAlloc(const(PROPVARIANT)*, PWSTR**, uint*);
HRESULT PropVariantGetBooleanElem(const(PROPVARIANT)*, uint, BOOL*);
HRESULT PropVariantGetInt16Elem(const(PROPVARIANT)*, uint, short*);
HRESULT PropVariantGetUInt16Elem(const(PROPVARIANT)*, uint, ushort*);
HRESULT PropVariantGetInt32Elem(const(PROPVARIANT)*, uint, int*);
HRESULT PropVariantGetUInt32Elem(const(PROPVARIANT)*, uint, uint*);
HRESULT PropVariantGetInt64Elem(const(PROPVARIANT)*, uint, long*);
HRESULT PropVariantGetUInt64Elem(const(PROPVARIANT)*, uint, ulong*);
HRESULT PropVariantGetDoubleElem(const(PROPVARIANT)*, uint, double*);
HRESULT PropVariantGetFileTimeElem(const(PROPVARIANT)*, uint, FILETIME*);
HRESULT PropVariantGetStringElem(const(PROPVARIANT)*, uint, PWSTR*);
void ClearPropVariantArray(PROPVARIANT*, uint);
int PropVariantCompareEx(const(PROPVARIANT)*, const(PROPVARIANT)*, PROPVAR_COMPARE_UNIT, PROPVAR_COMPARE_FLAGS);
HRESULT PropVariantChangeType(PROPVARIANT*, const(PROPVARIANT)*, PROPVAR_CHANGE_FLAGS, VARENUM);
HRESULT PropVariantToVariant(const(PROPVARIANT)*, VARIANT*);
HRESULT VariantToPropVariant(const(VARIANT)*, PROPVARIANT*);
HRESULT StgSerializePropVariant(const(PROPVARIANT)*, SERIALIZEDPROPERTYVALUE**, uint*);
HRESULT StgDeserializePropVariant(const(SERIALIZEDPROPERTYVALUE)*, uint, PROPVARIANT*);
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
    HRESULT Next(uint, STATSTG*, uint*);
    HRESULT Skip(uint);
    HRESULT Reset();
    HRESULT Clone(IEnumSTATSTG*);
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
    HRESULT CreateStream(const(wchar)*, STGM, uint, uint, IStream*);
    HRESULT OpenStream(const(wchar)*, void*, STGM, uint, IStream*);
    HRESULT CreateStorage(const(wchar)*, STGM, uint, uint, IStorage*);
    HRESULT OpenStorage(const(wchar)*, IStorage, STGM, ushort**, uint, IStorage*);
    HRESULT CopyTo(uint, const(GUID)*, ushort**, IStorage);
    HRESULT MoveElementTo(const(wchar)*, IStorage, const(wchar)*, uint);
    HRESULT Commit(uint);
    HRESULT Revert();
    HRESULT EnumElements(uint, void*, uint, IEnumSTATSTG*);
    HRESULT DestroyElement(const(wchar)*);
    HRESULT RenameElement(const(wchar)*, const(wchar)*);
    HRESULT SetElementTimes(const(wchar)*, const(FILETIME)*, const(FILETIME)*, const(FILETIME)*);
    HRESULT SetClass(const(GUID)*);
    HRESULT SetStateBits(uint, uint);
    HRESULT Stat(STATSTG*, uint);
}
enum IID_IPersistStorage = GUID(0x10a, 0x0, 0x0, [0xc0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x46]);
interface IPersistStorage : IPersist
{
    HRESULT IsDirty();
    HRESULT InitNew(IStorage);
    HRESULT Load(IStorage);
    HRESULT Save(IStorage, BOOL);
    HRESULT SaveCompleted(IStorage);
    HRESULT HandsOffStorage();
}
enum IID_ILockBytes = GUID(0xa, 0x0, 0x0, [0xc0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x46]);
interface ILockBytes : IUnknown
{
    HRESULT ReadAt(ulong, void*, uint, uint*);
    HRESULT WriteAt(ulong, const(void)*, uint, uint*);
    HRESULT Flush();
    HRESULT SetSize(ulong);
    HRESULT LockRegion(ulong, ulong, uint);
    HRESULT UnlockRegion(ulong, ulong, uint);
    HRESULT Stat(STATSTG*, uint);
}
enum IID_IRootStorage = GUID(0x12, 0x0, 0x0, [0xc0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x46]);
interface IRootStorage : IUnknown
{
    HRESULT SwitchToFile(PWSTR);
}
enum IID_IFillLockBytes = GUID(0x99caf010, 0x415e, 0x11cf, [0x88, 0x14, 0x0, 0xaa, 0x0, 0xb5, 0x69, 0xf5]);
interface IFillLockBytes : IUnknown
{
    HRESULT FillAppend(const(void)*, uint, uint*);
    HRESULT FillAt(ulong, const(void)*, uint, uint*);
    HRESULT SetFillSize(ulong);
    HRESULT Terminate(BOOL);
}
enum IID_ILayoutStorage = GUID(0xe6d4d90, 0x6738, 0x11cf, [0x96, 0x8, 0x0, 0xaa, 0x0, 0x68, 0xd, 0xb4]);
interface ILayoutStorage : IUnknown
{
    HRESULT LayoutScript(StorageLayout*, uint, uint);
    HRESULT BeginMonitor();
    HRESULT EndMonitor();
    HRESULT ReLayoutDocfile(PWSTR);
    HRESULT ReLayoutDocfileOnILockBytes(ILockBytes);
}
enum IID_IDirectWriterLock = GUID(0xe6d4d92, 0x6738, 0x11cf, [0x96, 0x8, 0x0, 0xaa, 0x0, 0x68, 0xd, 0xb4]);
interface IDirectWriterLock : IUnknown
{
    HRESULT WaitForWriteAccess(uint);
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
    HRESULT ReadMultiple(uint, const(PROPSPEC)*, PROPVARIANT*);
    HRESULT WriteMultiple(uint, const(PROPSPEC)*, const(PROPVARIANT)*, uint);
    HRESULT DeleteMultiple(uint, const(PROPSPEC)*);
    HRESULT ReadPropertyNames(uint, const(uint)*, PWSTR*);
    HRESULT WritePropertyNames(uint, const(uint)*, const(wchar)**);
    HRESULT DeletePropertyNames(uint, const(uint)*);
    HRESULT Commit(uint);
    HRESULT Revert();
    HRESULT Enum(IEnumSTATPROPSTG*);
    HRESULT SetTimes(const(FILETIME)*, const(FILETIME)*, const(FILETIME)*);
    HRESULT SetClass(const(GUID)*);
    HRESULT Stat(STATPROPSETSTG*);
}
enum IID_IPropertySetStorage = GUID(0x13a, 0x0, 0x0, [0xc0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x46]);
interface IPropertySetStorage : IUnknown
{
    HRESULT Create(const(GUID)*, const(GUID)*, uint, uint, IPropertyStorage*);
    HRESULT Open(const(GUID)*, uint, IPropertyStorage*);
    HRESULT Delete(const(GUID)*);
    HRESULT Enum(IEnumSTATPROPSETSTG*);
}
enum IID_IEnumSTATPROPSTG = GUID(0x139, 0x0, 0x0, [0xc0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x46]);
interface IEnumSTATPROPSTG : IUnknown
{
    HRESULT Next(uint, STATPROPSTG*, uint*);
    HRESULT Skip(uint);
    HRESULT Reset();
    HRESULT Clone(IEnumSTATPROPSTG*);
}
enum IID_IEnumSTATPROPSETSTG = GUID(0x13b, 0x0, 0x0, [0xc0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x46]);
interface IEnumSTATPROPSETSTG : IUnknown
{
    HRESULT Next(uint, STATPROPSETSTG*, uint*);
    HRESULT Skip(uint);
    HRESULT Reset();
    HRESULT Clone(IEnumSTATPROPSETSTG*);
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
    void* Allocate(uint);
    void Free(void*);
}
enum IID_IPropertyBag = GUID(0x55272a00, 0x42cb, 0x11ce, [0x81, 0x35, 0x0, 0xaa, 0x0, 0x4b, 0xb8, 0x51]);
interface IPropertyBag : IUnknown
{
    HRESULT Read(const(wchar)*, VARIANT*, IErrorLog);
    HRESULT Write(const(wchar)*, VARIANT*);
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
    HRESULT Read(uint, PROPBAG2*, IErrorLog, VARIANT*, HRESULT*);
    HRESULT Write(uint, PROPBAG2*, VARIANT*);
    HRESULT CountProperties(uint*);
    HRESULT GetPropertyInfo(uint, uint, PROPBAG2*, uint*);
    HRESULT LoadObject(const(wchar)*, uint, IUnknown, IErrorLog);
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

