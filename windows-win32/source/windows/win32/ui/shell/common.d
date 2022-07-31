module windows.win32.ui.shell.common;

import windows.win32.guid : GUID;
import windows.win32.foundation : HRESULT, PWSTR;
import windows.win32.system.com_ : IUnknown;

version (Windows):
extern (Windows):

enum PERCEIVEDFLAG_UNDEFINED = 0x00000000;
enum PERCEIVEDFLAG_SOFTCODED = 0x00000001;
enum PERCEIVEDFLAG_HARDCODED = 0x00000002;
enum PERCEIVEDFLAG_NATIVESUPPORT = 0x00000004;
enum PERCEIVEDFLAG_GDIPLUS = 0x00000010;
enum PERCEIVEDFLAG_WMSDK = 0x00000020;
enum PERCEIVEDFLAG_ZIPFOLDER = 0x00000040;
struct SHITEMID
{
    align (1):
    ushort cb;
    ubyte[1] abID;
}
struct ITEMIDLIST
{
    SHITEMID mkid;
}
alias STRRET_TYPE = int;
enum : int
{
    STRRET_WSTR   = 0x00000000,
    STRRET_OFFSET = 0x00000001,
    STRRET_CSTR   = 0x00000002,
}

struct STRRET
{
    uint uType;
    union
    {
        PWSTR pOleStr;
        uint uOffset;
        ubyte[260] cStr;
    }
}
struct SHELLDETAILS
{
    align (1):
    int fmt;
    int cxChar;
    STRRET str;
}
alias PERCEIVED = int;
enum : int
{
    PERCEIVED_TYPE_FIRST       = 0xfffffffd,
    PERCEIVED_TYPE_CUSTOM      = 0xfffffffd,
    PERCEIVED_TYPE_UNSPECIFIED = 0xfffffffe,
    PERCEIVED_TYPE_FOLDER      = 0xffffffff,
    PERCEIVED_TYPE_UNKNOWN     = 0x00000000,
    PERCEIVED_TYPE_TEXT        = 0x00000001,
    PERCEIVED_TYPE_IMAGE       = 0x00000002,
    PERCEIVED_TYPE_AUDIO       = 0x00000003,
    PERCEIVED_TYPE_VIDEO       = 0x00000004,
    PERCEIVED_TYPE_COMPRESSED  = 0x00000005,
    PERCEIVED_TYPE_DOCUMENT    = 0x00000006,
    PERCEIVED_TYPE_SYSTEM      = 0x00000007,
    PERCEIVED_TYPE_APPLICATION = 0x00000008,
    PERCEIVED_TYPE_GAMEMEDIA   = 0x00000009,
    PERCEIVED_TYPE_CONTACTS    = 0x0000000a,
    PERCEIVED_TYPE_LAST        = 0x0000000a,
}

struct COMDLG_FILTERSPEC
{
    const(wchar)* pszName;
    const(wchar)* pszSpec;
}
alias SHCOLSTATE = int;
enum : int
{
    SHCOLSTATE_DEFAULT            = 0x00000000,
    SHCOLSTATE_TYPE_STR           = 0x00000001,
    SHCOLSTATE_TYPE_INT           = 0x00000002,
    SHCOLSTATE_TYPE_DATE          = 0x00000003,
    SHCOLSTATE_TYPEMASK           = 0x0000000f,
    SHCOLSTATE_ONBYDEFAULT        = 0x00000010,
    SHCOLSTATE_SLOW               = 0x00000020,
    SHCOLSTATE_EXTENDED           = 0x00000040,
    SHCOLSTATE_SECONDARYUI        = 0x00000080,
    SHCOLSTATE_HIDDEN             = 0x00000100,
    SHCOLSTATE_PREFER_VARCMP      = 0x00000200,
    SHCOLSTATE_PREFER_FMTCMP      = 0x00000400,
    SHCOLSTATE_NOSORTBYFOLDERNESS = 0x00000800,
    SHCOLSTATE_VIEWONLY           = 0x00010000,
    SHCOLSTATE_BATCHREAD          = 0x00020000,
    SHCOLSTATE_NO_GROUPBY         = 0x00040000,
    SHCOLSTATE_FIXED_WIDTH        = 0x00001000,
    SHCOLSTATE_NODPISCALE         = 0x00002000,
    SHCOLSTATE_FIXED_RATIO        = 0x00004000,
    SHCOLSTATE_DISPLAYMASK        = 0x0000f000,
}

alias DEVICE_SCALE_FACTOR = int;
enum : int
{
    DEVICE_SCALE_FACTOR_INVALID = 0x00000000,
    SCALE_100_PERCENT           = 0x00000064,
    SCALE_120_PERCENT           = 0x00000078,
    SCALE_125_PERCENT           = 0x0000007d,
    SCALE_140_PERCENT           = 0x0000008c,
    SCALE_150_PERCENT           = 0x00000096,
    SCALE_160_PERCENT           = 0x000000a0,
    SCALE_175_PERCENT           = 0x000000af,
    SCALE_180_PERCENT           = 0x000000b4,
    SCALE_200_PERCENT           = 0x000000c8,
    SCALE_225_PERCENT           = 0x000000e1,
    SCALE_250_PERCENT           = 0x000000fa,
    SCALE_300_PERCENT           = 0x0000012c,
    SCALE_350_PERCENT           = 0x0000015e,
    SCALE_400_PERCENT           = 0x00000190,
    SCALE_450_PERCENT           = 0x000001c2,
    SCALE_500_PERCENT           = 0x000001f4,
}

enum IID_IObjectArray = GUID(0x92ca9dcd, 0x5622, 0x4bba, [0xa8, 0x5, 0x5e, 0x9f, 0x54, 0x1b, 0xd8, 0xc9]);
interface IObjectArray : IUnknown
{
    HRESULT GetCount(uint*);
    HRESULT GetAt(uint, const(GUID)*, void**);
}
enum IID_IObjectCollection = GUID(0x5632b1a4, 0xe38a, 0x400a, [0x92, 0x8a, 0xd4, 0xcd, 0x63, 0x23, 0x2, 0x95]);
interface IObjectCollection : IObjectArray
{
    HRESULT AddObject(IUnknown);
    HRESULT AddFromArray(IObjectArray);
    HRESULT RemoveObjectAt(uint);
    HRESULT Clear();
}
