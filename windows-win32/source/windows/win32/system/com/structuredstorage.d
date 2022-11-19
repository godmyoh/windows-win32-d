module windows.win32.system.com.structuredstorage;

import windows.win32.guid : GUID;
import windows.win32.foundation : BOOL, BOOLEAN, BSTR, CHAR, DECIMAL, FILETIME, HRESULT, LARGE_INTEGER, PSTR, PWSTR, ULARGE_INTEGER, VARIANT_BOOL;
import windows.win32.security_ : PSECURITY_DESCRIPTOR;
import windows.win32.system.com_ : BLOB, CLSCTX, COSERVERINFO, CY, DVTARGETDEVICE, IDispatch, IErrorLog, IPersist, IStream, IUnknown, LOCKTYPE, MULTI_QI, SAFEARRAY, STATFLAG, STATSTG, STGC, STGM, STGMEDIUM, StorageLayout, VARENUM, VARIANT;

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
HRESULT CreateStreamOnHGlobal(long, BOOL, IStream*);
HRESULT GetHGlobalFromStream(IStream, long*);
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
HRESULT GetHGlobalFromILockBytes(ILockBytes, long*);
HRESULT CreateILockBytesOnHGlobal(long, BOOL, ILockBytes*);
HRESULT GetConvertStg(IStorage);
SERIALIZEDPROPERTYVALUE* StgConvertVariantToProperty(const(PROPVARIANT)*, ushort, SERIALIZEDPROPERTYVALUE*, uint*, uint, BOOLEAN, uint*);
BOOLEAN StgConvertPropertyToVariant(const(SERIALIZEDPROPERTYVALUE)*, ushort, PROPVARIANT*, PMemoryAllocator*);
uint StgPropertyLengthAsVariant(const(SERIALIZEDPROPERTYVALUE)*, uint, ushort, ubyte);
HRESULT WriteFmtUserTypeStg(IStorage, ushort, PWSTR);
HRESULT ReadFmtUserTypeStg(IStorage, ushort*, PWSTR*);
HRESULT OleConvertOLESTREAMToIStorage(OLESTREAM*, IStorage, const(DVTARGETDEVICE)*);
HRESULT OleConvertIStorageToOLESTREAM(IStorage, OLESTREAM*);
HRESULT SetConvertStg(IStorage, BOOL);
HRESULT OleConvertIStorageToOLESTREAMEx(IStorage, ushort, int, int, uint, STGMEDIUM*, OLESTREAM*);
HRESULT OleConvertOLESTREAMToIStorageEx(OLESTREAM*, IStorage, ushort*, int*, int*, uint*, STGMEDIUM*);
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
    HRESULT MoveElementTo(const(wchar)*, IStorage, const(wchar)*, STGMOVE);
    HRESULT Commit(STGC);
    HRESULT Revert();
    HRESULT EnumElements(uint, void*, uint, IEnumSTATSTG*);
    HRESULT DestroyElement(const(wchar)*);
    HRESULT RenameElement(const(wchar)*, const(wchar)*);
    HRESULT SetElementTimes(const(wchar)*, const(FILETIME)*, const(FILETIME)*, const(FILETIME)*);
    HRESULT SetClass(const(GUID)*);
    HRESULT SetStateBits(uint, uint);
    HRESULT Stat(STATSTG*, STATFLAG);
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
    HRESULT ReadAt(ULARGE_INTEGER, void*, uint, uint*);
    HRESULT WriteAt(ULARGE_INTEGER, const(void)*, uint, uint*);
    HRESULT Flush();
    HRESULT SetSize(ULARGE_INTEGER);
    HRESULT LockRegion(ULARGE_INTEGER, ULARGE_INTEGER, LOCKTYPE);
    HRESULT UnlockRegion(ULARGE_INTEGER, ULARGE_INTEGER, uint);
    HRESULT Stat(STATSTG*, STATFLAG);
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
    HRESULT FillAt(ULARGE_INTEGER, const(void)*, uint, uint*);
    HRESULT SetFillSize(ULARGE_INTEGER);
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
    LARGE_INTEGER* pElems;
}
struct CAUH
{
    uint cElems;
    ULARGE_INTEGER* pElems;
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
                LARGE_INTEGER hVal;
                ULARGE_INTEGER uhVal;
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
struct PMemoryAllocator
{
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
