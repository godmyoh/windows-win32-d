module windows.win32.system.variant;

import windows.win32.guid : GUID;
import windows.win32.foundation : BOOL, BSTR, CHAR, DECIMAL, FILETIME, HINSTANCE, HRESULT, PSTR, PWSTR, SYSTEMTIME, VARIANT_BOOL;
import windows.win32.system.com : CY, IDispatch, IUnknown, SAFEARRAY;
import windows.win32.system.ole : IRecordInfo;

version (Windows):
extern (Windows):

alias VAR_CHANGE_FLAGS = ushort;
enum : ushort
{
    VARIANT_NOVALUEPROP        = 0x0001,
    VARIANT_ALPHABOOL          = 0x0002,
    VARIANT_NOUSEROVERRIDE     = 0x0004,
    VARIANT_CALENDAR_HIJRI     = 0x0008,
    VARIANT_LOCALBOOL          = 0x0010,
    VARIANT_CALENDAR_THAI      = 0x0020,
    VARIANT_CALENDAR_GREGORIAN = 0x0040,
    VARIANT_USE_NLS            = 0x0080,
}

uint VARIANT_UserSize(uint*, uint, VARIANT*);
ubyte* VARIANT_UserMarshal(uint*, ubyte*, VARIANT*);
ubyte* VARIANT_UserUnmarshal(uint*, ubyte*, VARIANT*);
void VARIANT_UserFree(uint*, VARIANT*);
uint VARIANT_UserSize64(uint*, uint, VARIANT*);
ubyte* VARIANT_UserMarshal64(uint*, ubyte*, VARIANT*);
ubyte* VARIANT_UserUnmarshal64(uint*, ubyte*, VARIANT*);
void VARIANT_UserFree64(uint*, VARIANT*);
int DosDateTimeToVariantTime(ushort, ushort, double*);
int VariantTimeToDosDateTime(double, ushort*, ushort*);
int SystemTimeToVariantTime(SYSTEMTIME*, double*);
int VariantTimeToSystemTime(double, SYSTEMTIME*);
void VariantInit(VARIANT*);
HRESULT VariantClear(VARIANT*);
HRESULT VariantCopy(VARIANT*, const(VARIANT)*);
HRESULT VariantCopyInd(VARIANT*, const(VARIANT)*);
HRESULT VariantChangeType(VARIANT*, const(VARIANT)*, VAR_CHANGE_FLAGS, VARENUM);
HRESULT VariantChangeTypeEx(VARIANT*, const(VARIANT)*, uint, VAR_CHANGE_FLAGS, VARENUM);
HRESULT InitVariantFromResource(HINSTANCE, uint, VARIANT*);
HRESULT InitVariantFromBuffer(const(void)*, uint, VARIANT*);
HRESULT InitVariantFromGUIDAsString(const(GUID)*, VARIANT*);
HRESULT InitVariantFromFileTime(const(FILETIME)*, VARIANT*);
HRESULT InitVariantFromFileTimeArray(const(FILETIME)*, uint, VARIANT*);
HRESULT InitVariantFromVariantArrayElem(const(VARIANT)*, uint, VARIANT*);
HRESULT InitVariantFromBooleanArray(const(BOOL)*, uint, VARIANT*);
HRESULT InitVariantFromInt16Array(const(short)*, uint, VARIANT*);
HRESULT InitVariantFromUInt16Array(const(ushort)*, uint, VARIANT*);
HRESULT InitVariantFromInt32Array(const(int)*, uint, VARIANT*);
HRESULT InitVariantFromUInt32Array(const(uint)*, uint, VARIANT*);
HRESULT InitVariantFromInt64Array(const(long)*, uint, VARIANT*);
HRESULT InitVariantFromUInt64Array(const(ulong)*, uint, VARIANT*);
HRESULT InitVariantFromDoubleArray(const(double)*, uint, VARIANT*);
HRESULT InitVariantFromStringArray(const(wchar)**, uint, VARIANT*);
BOOL VariantToBooleanWithDefault(const(VARIANT)*, BOOL);
short VariantToInt16WithDefault(const(VARIANT)*, short);
ushort VariantToUInt16WithDefault(const(VARIANT)*, ushort);
int VariantToInt32WithDefault(const(VARIANT)*, int);
uint VariantToUInt32WithDefault(const(VARIANT)*, uint);
long VariantToInt64WithDefault(const(VARIANT)*, long);
ulong VariantToUInt64WithDefault(const(VARIANT)*, ulong);
double VariantToDoubleWithDefault(const(VARIANT)*, double);
PWSTR VariantToStringWithDefault(const(VARIANT)*, const(wchar)*);
HRESULT VariantToBoolean(const(VARIANT)*, BOOL*);
HRESULT VariantToInt16(const(VARIANT)*, short*);
HRESULT VariantToUInt16(const(VARIANT)*, ushort*);
HRESULT VariantToInt32(const(VARIANT)*, int*);
HRESULT VariantToUInt32(const(VARIANT)*, uint*);
HRESULT VariantToInt64(const(VARIANT)*, long*);
HRESULT VariantToUInt64(const(VARIANT)*, ulong*);
HRESULT VariantToDouble(const(VARIANT)*, double*);
HRESULT VariantToBuffer(const(VARIANT)*, void*, uint);
HRESULT VariantToGUID(const(VARIANT)*, GUID*);
HRESULT VariantToString(const(VARIANT)*, PWSTR, uint);
HRESULT VariantToStringAlloc(const(VARIANT)*, PWSTR*);
HRESULT VariantToDosDateTime(const(VARIANT)*, ushort*, ushort*);
HRESULT VariantToFileTime(const(VARIANT)*, PSTIME_FLAGS, FILETIME*);
uint VariantGetElementCount(const(VARIANT)*);
HRESULT VariantToBooleanArray(const(VARIANT)*, BOOL*, uint, uint*);
HRESULT VariantToInt16Array(const(VARIANT)*, short*, uint, uint*);
HRESULT VariantToUInt16Array(const(VARIANT)*, ushort*, uint, uint*);
HRESULT VariantToInt32Array(const(VARIANT)*, int*, uint, uint*);
HRESULT VariantToUInt32Array(const(VARIANT)*, uint*, uint, uint*);
HRESULT VariantToInt64Array(const(VARIANT)*, long*, uint, uint*);
HRESULT VariantToUInt64Array(const(VARIANT)*, ulong*, uint, uint*);
HRESULT VariantToDoubleArray(const(VARIANT)*, double*, uint, uint*);
HRESULT VariantToStringArray(const(VARIANT)*, PWSTR*, uint, uint*);
HRESULT VariantToBooleanArrayAlloc(const(VARIANT)*, BOOL**, uint*);
HRESULT VariantToInt16ArrayAlloc(const(VARIANT)*, short**, uint*);
HRESULT VariantToUInt16ArrayAlloc(const(VARIANT)*, ushort**, uint*);
HRESULT VariantToInt32ArrayAlloc(const(VARIANT)*, int**, uint*);
HRESULT VariantToUInt32ArrayAlloc(const(VARIANT)*, uint**, uint*);
HRESULT VariantToInt64ArrayAlloc(const(VARIANT)*, long**, uint*);
HRESULT VariantToUInt64ArrayAlloc(const(VARIANT)*, ulong**, uint*);
HRESULT VariantToDoubleArrayAlloc(const(VARIANT)*, double**, uint*);
HRESULT VariantToStringArrayAlloc(const(VARIANT)*, PWSTR**, uint*);
HRESULT VariantGetBooleanElem(const(VARIANT)*, uint, BOOL*);
HRESULT VariantGetInt16Elem(const(VARIANT)*, uint, short*);
HRESULT VariantGetUInt16Elem(const(VARIANT)*, uint, ushort*);
HRESULT VariantGetInt32Elem(const(VARIANT)*, uint, int*);
HRESULT VariantGetUInt32Elem(const(VARIANT)*, uint, uint*);
HRESULT VariantGetInt64Elem(const(VARIANT)*, uint, long*);
HRESULT VariantGetUInt64Elem(const(VARIANT)*, uint, ulong*);
HRESULT VariantGetDoubleElem(const(VARIANT)*, uint, double*);
HRESULT VariantGetStringElem(const(VARIANT)*, uint, PWSTR*);
void ClearVariantArray(VARIANT*, uint);
int VariantCompare(const(VARIANT)*, const(VARIANT)*);
alias VARENUM = ushort;
enum : ushort
{
    VT_EMPTY            = 0x0000,
    VT_NULL             = 0x0001,
    VT_I2               = 0x0002,
    VT_I4               = 0x0003,
    VT_R4               = 0x0004,
    VT_R8               = 0x0005,
    VT_CY               = 0x0006,
    VT_DATE             = 0x0007,
    VT_BSTR             = 0x0008,
    VT_DISPATCH         = 0x0009,
    VT_ERROR            = 0x000a,
    VT_BOOL             = 0x000b,
    VT_VARIANT          = 0x000c,
    VT_UNKNOWN          = 0x000d,
    VT_DECIMAL          = 0x000e,
    VT_I1               = 0x0010,
    VT_UI1              = 0x0011,
    VT_UI2              = 0x0012,
    VT_UI4              = 0x0013,
    VT_I8               = 0x0014,
    VT_UI8              = 0x0015,
    VT_INT              = 0x0016,
    VT_UINT             = 0x0017,
    VT_VOID             = 0x0018,
    VT_HRESULT          = 0x0019,
    VT_PTR              = 0x001a,
    VT_SAFEARRAY        = 0x001b,
    VT_CARRAY           = 0x001c,
    VT_USERDEFINED      = 0x001d,
    VT_LPSTR            = 0x001e,
    VT_LPWSTR           = 0x001f,
    VT_RECORD           = 0x0024,
    VT_INT_PTR          = 0x0025,
    VT_UINT_PTR         = 0x0026,
    VT_FILETIME         = 0x0040,
    VT_BLOB             = 0x0041,
    VT_STREAM           = 0x0042,
    VT_STORAGE          = 0x0043,
    VT_STREAMED_OBJECT  = 0x0044,
    VT_STORED_OBJECT    = 0x0045,
    VT_BLOB_OBJECT      = 0x0046,
    VT_CF               = 0x0047,
    VT_CLSID            = 0x0048,
    VT_VERSIONED_STREAM = 0x0049,
    VT_BSTR_BLOB        = 0x0fff,
    VT_VECTOR           = 0x1000,
    VT_ARRAY            = 0x2000,
    VT_BYREF            = 0x4000,
    VT_RESERVED         = 0x8000,
    VT_ILLEGAL          = 0xffff,
    VT_ILLEGALMASKED    = 0x0fff,
    VT_TYPEMASK         = 0x0fff,
}

struct VARIANT
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
                long llVal;
                int lVal;
                ubyte bVal;
                short iVal;
                float fltVal;
                double dblVal;
                VARIANT_BOOL boolVal;
                VARIANT_BOOL __OBSOLETE__VARIANT_BOOL;
                int scode;
                CY cyVal;
                double date;
                BSTR bstrVal;
                IUnknown punkVal;
                IDispatch pdispVal;
                SAFEARRAY* parray;
                ubyte* pbVal;
                short* piVal;
                int* plVal;
                long* pllVal;
                float* pfltVal;
                double* pdblVal;
                VARIANT_BOOL* pboolVal;
                VARIANT_BOOL* __OBSOLETE__VARIANT_PBOOL;
                int* pscode;
                CY* pcyVal;
                double* pdate;
                BSTR* pbstrVal;
                IUnknown* ppunkVal;
                IDispatch* ppdispVal;
                SAFEARRAY** pparray;
                VARIANT* pvarVal;
                void* byref;
                CHAR cVal;
                ushort uiVal;
                uint ulVal;
                ulong ullVal;
                int intVal;
                uint uintVal;
                DECIMAL* pdecVal;
                PSTR pcVal;
                ushort* puiVal;
                uint* pulVal;
                ulong* pullVal;
                int* pintVal;
                uint* puintVal;
                struct
                {
                    void* pvRecord;
                    IRecordInfo pRecInfo;
                }
            }
        }
        DECIMAL decVal;
    }
}
alias PSTIME_FLAGS = int;
enum : int
{
    PSTF_UTC   = 0x00000000,
    PSTF_LOCAL = 0x00000001,
}

alias DRAWPROGRESSFLAGS = int;
enum : int
{
    DPF_NONE             = 0x00000000,
    DPF_MARQUEE          = 0x00000001,
    DPF_MARQUEE_COMPLETE = 0x00000002,
    DPF_ERROR            = 0x00000004,
    DPF_WARNING          = 0x00000008,
    DPF_STOPPED          = 0x00000010,
}

