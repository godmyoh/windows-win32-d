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

uint VARIANT_UserSize(uint* param0, uint param1, VARIANT* param2);
ubyte* VARIANT_UserMarshal(uint* param0, ubyte* param1, VARIANT* param2);
ubyte* VARIANT_UserUnmarshal(uint* param0, ubyte* param1, VARIANT* param2);
void VARIANT_UserFree(uint* param0, VARIANT* param1);
uint VARIANT_UserSize64(uint* param0, uint param1, VARIANT* param2);
ubyte* VARIANT_UserMarshal64(uint* param0, ubyte* param1, VARIANT* param2);
ubyte* VARIANT_UserUnmarshal64(uint* param0, ubyte* param1, VARIANT* param2);
void VARIANT_UserFree64(uint* param0, VARIANT* param1);
int DosDateTimeToVariantTime(ushort wDosDate, ushort wDosTime, double* pvtime);
int VariantTimeToDosDateTime(double vtime, ushort* pwDosDate, ushort* pwDosTime);
int SystemTimeToVariantTime(SYSTEMTIME* lpSystemTime, double* pvtime);
int VariantTimeToSystemTime(double vtime, SYSTEMTIME* lpSystemTime);
void VariantInit(VARIANT* pvarg);
HRESULT VariantClear(VARIANT* pvarg);
HRESULT VariantCopy(VARIANT* pvargDest, const(VARIANT)* pvargSrc);
HRESULT VariantCopyInd(VARIANT* pvarDest, const(VARIANT)* pvargSrc);
HRESULT VariantChangeType(VARIANT* pvargDest, const(VARIANT)* pvarSrc, VAR_CHANGE_FLAGS wFlags, VARENUM vt);
HRESULT VariantChangeTypeEx(VARIANT* pvargDest, const(VARIANT)* pvarSrc, uint lcid, VAR_CHANGE_FLAGS wFlags, VARENUM vt);
HRESULT InitVariantFromResource(HINSTANCE hinst, uint id, VARIANT* pvar);
HRESULT InitVariantFromBuffer(const(void)* pv, uint cb, VARIANT* pvar);
HRESULT InitVariantFromGUIDAsString(const(GUID)* guid, VARIANT* pvar);
HRESULT InitVariantFromFileTime(const(FILETIME)* pft, VARIANT* pvar);
HRESULT InitVariantFromFileTimeArray(const(FILETIME)* prgft, uint cElems, VARIANT* pvar);
HRESULT InitVariantFromVariantArrayElem(const(VARIANT)* varIn, uint iElem, VARIANT* pvar);
HRESULT InitVariantFromBooleanArray(const(BOOL)* prgf, uint cElems, VARIANT* pvar);
HRESULT InitVariantFromInt16Array(const(short)* prgn, uint cElems, VARIANT* pvar);
HRESULT InitVariantFromUInt16Array(const(ushort)* prgn, uint cElems, VARIANT* pvar);
HRESULT InitVariantFromInt32Array(const(int)* prgn, uint cElems, VARIANT* pvar);
HRESULT InitVariantFromUInt32Array(const(uint)* prgn, uint cElems, VARIANT* pvar);
HRESULT InitVariantFromInt64Array(const(long)* prgn, uint cElems, VARIANT* pvar);
HRESULT InitVariantFromUInt64Array(const(ulong)* prgn, uint cElems, VARIANT* pvar);
HRESULT InitVariantFromDoubleArray(const(double)* prgn, uint cElems, VARIANT* pvar);
HRESULT InitVariantFromStringArray(const(wchar)** prgsz, uint cElems, VARIANT* pvar);
BOOL VariantToBooleanWithDefault(const(VARIANT)* varIn, BOOL fDefault);
short VariantToInt16WithDefault(const(VARIANT)* varIn, short iDefault);
ushort VariantToUInt16WithDefault(const(VARIANT)* varIn, ushort uiDefault);
int VariantToInt32WithDefault(const(VARIANT)* varIn, int lDefault);
uint VariantToUInt32WithDefault(const(VARIANT)* varIn, uint ulDefault);
long VariantToInt64WithDefault(const(VARIANT)* varIn, long llDefault);
ulong VariantToUInt64WithDefault(const(VARIANT)* varIn, ulong ullDefault);
double VariantToDoubleWithDefault(const(VARIANT)* varIn, double dblDefault);
PWSTR VariantToStringWithDefault(const(VARIANT)* varIn, const(wchar)* pszDefault);
HRESULT VariantToBoolean(const(VARIANT)* varIn, BOOL* pfRet);
HRESULT VariantToInt16(const(VARIANT)* varIn, short* piRet);
HRESULT VariantToUInt16(const(VARIANT)* varIn, ushort* puiRet);
HRESULT VariantToInt32(const(VARIANT)* varIn, int* plRet);
HRESULT VariantToUInt32(const(VARIANT)* varIn, uint* pulRet);
HRESULT VariantToInt64(const(VARIANT)* varIn, long* pllRet);
HRESULT VariantToUInt64(const(VARIANT)* varIn, ulong* pullRet);
HRESULT VariantToDouble(const(VARIANT)* varIn, double* pdblRet);
HRESULT VariantToBuffer(const(VARIANT)* varIn, void* pv, uint cb);
HRESULT VariantToGUID(const(VARIANT)* varIn, GUID* pguid);
HRESULT VariantToString(const(VARIANT)* varIn, PWSTR pszBuf, uint cchBuf);
HRESULT VariantToStringAlloc(const(VARIANT)* varIn, PWSTR* ppszBuf);
HRESULT VariantToDosDateTime(const(VARIANT)* varIn, ushort* pwDate, ushort* pwTime);
HRESULT VariantToFileTime(const(VARIANT)* varIn, PSTIME_FLAGS stfOut, FILETIME* pftOut);
uint VariantGetElementCount(const(VARIANT)* varIn);
HRESULT VariantToBooleanArray(const(VARIANT)* var, BOOL* prgf, uint crgn, uint* pcElem);
HRESULT VariantToInt16Array(const(VARIANT)* var, short* prgn, uint crgn, uint* pcElem);
HRESULT VariantToUInt16Array(const(VARIANT)* var, ushort* prgn, uint crgn, uint* pcElem);
HRESULT VariantToInt32Array(const(VARIANT)* var, int* prgn, uint crgn, uint* pcElem);
HRESULT VariantToUInt32Array(const(VARIANT)* var, uint* prgn, uint crgn, uint* pcElem);
HRESULT VariantToInt64Array(const(VARIANT)* var, long* prgn, uint crgn, uint* pcElem);
HRESULT VariantToUInt64Array(const(VARIANT)* var, ulong* prgn, uint crgn, uint* pcElem);
HRESULT VariantToDoubleArray(const(VARIANT)* var, double* prgn, uint crgn, uint* pcElem);
HRESULT VariantToStringArray(const(VARIANT)* var, PWSTR* prgsz, uint crgsz, uint* pcElem);
HRESULT VariantToBooleanArrayAlloc(const(VARIANT)* var, BOOL** pprgf, uint* pcElem);
HRESULT VariantToInt16ArrayAlloc(const(VARIANT)* var, short** pprgn, uint* pcElem);
HRESULT VariantToUInt16ArrayAlloc(const(VARIANT)* var, ushort** pprgn, uint* pcElem);
HRESULT VariantToInt32ArrayAlloc(const(VARIANT)* var, int** pprgn, uint* pcElem);
HRESULT VariantToUInt32ArrayAlloc(const(VARIANT)* var, uint** pprgn, uint* pcElem);
HRESULT VariantToInt64ArrayAlloc(const(VARIANT)* var, long** pprgn, uint* pcElem);
HRESULT VariantToUInt64ArrayAlloc(const(VARIANT)* var, ulong** pprgn, uint* pcElem);
HRESULT VariantToDoubleArrayAlloc(const(VARIANT)* var, double** pprgn, uint* pcElem);
HRESULT VariantToStringArrayAlloc(const(VARIANT)* var, PWSTR** pprgsz, uint* pcElem);
HRESULT VariantGetBooleanElem(const(VARIANT)* var, uint iElem, BOOL* pfVal);
HRESULT VariantGetInt16Elem(const(VARIANT)* var, uint iElem, short* pnVal);
HRESULT VariantGetUInt16Elem(const(VARIANT)* var, uint iElem, ushort* pnVal);
HRESULT VariantGetInt32Elem(const(VARIANT)* var, uint iElem, int* pnVal);
HRESULT VariantGetUInt32Elem(const(VARIANT)* var, uint iElem, uint* pnVal);
HRESULT VariantGetInt64Elem(const(VARIANT)* var, uint iElem, long* pnVal);
HRESULT VariantGetUInt64Elem(const(VARIANT)* var, uint iElem, ulong* pnVal);
HRESULT VariantGetDoubleElem(const(VARIANT)* var, uint iElem, double* pnVal);
HRESULT VariantGetStringElem(const(VARIANT)* var, uint iElem, PWSTR* ppszVal);
void ClearVariantArray(VARIANT* pvars, uint cvars);
int VariantCompare(const(VARIANT)* var1, const(VARIANT)* var2);
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

