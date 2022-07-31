module windows.win32.data.htmlhelp;

import windows.win32.guid : GUID;
import windows.win32.foundation : BOOL, HINSTANCE, HRESULT, HWND, POINT, PSTR, PWSTR, RECT;
import windows.win32.system.com_ : IPersistStreamInit, IStream, IUnknown, VARIANT;
import windows.win32.system.search_ : IStemmer;
import windows.win32.ui.controls_ : NMHDR;

version (Windows):
extern (Windows):

alias WORD_WHEEL_OPEN_FLAGS = uint;
enum : uint
{
    ITWW_OPEN_CONNECT = 0x00000000,
}

enum HH_DISPLAY_TOPIC = 0x00000000;
enum HH_HELP_FINDER = 0x00000000;
enum HH_DISPLAY_TOC = 0x00000001;
enum HH_DISPLAY_INDEX = 0x00000002;
enum HH_DISPLAY_SEARCH = 0x00000003;
enum HH_SET_WIN_TYPE = 0x00000004;
enum HH_GET_WIN_TYPE = 0x00000005;
enum HH_GET_WIN_HANDLE = 0x00000006;
enum HH_ENUM_INFO_TYPE = 0x00000007;
enum HH_SET_INFO_TYPE = 0x00000008;
enum HH_SYNC = 0x00000009;
enum HH_RESERVED1 = 0x0000000a;
enum HH_RESERVED2 = 0x0000000b;
enum HH_RESERVED3 = 0x0000000c;
enum HH_KEYWORD_LOOKUP = 0x0000000d;
enum HH_DISPLAY_TEXT_POPUP = 0x0000000e;
enum HH_HELP_CONTEXT = 0x0000000f;
enum HH_TP_HELP_CONTEXTMENU = 0x00000010;
enum HH_TP_HELP_WM_HELP = 0x00000011;
enum HH_CLOSE_ALL = 0x00000012;
enum HH_ALINK_LOOKUP = 0x00000013;
enum HH_GET_LAST_ERROR = 0x00000014;
enum HH_ENUM_CATEGORY = 0x00000015;
enum HH_ENUM_CATEGORY_IT = 0x00000016;
enum HH_RESET_IT_FILTER = 0x00000017;
enum HH_SET_INCLUSIVE_FILTER = 0x00000018;
enum HH_SET_EXCLUSIVE_FILTER = 0x00000019;
enum HH_INITIALIZE = 0x0000001c;
enum HH_UNINITIALIZE = 0x0000001d;
enum HH_SET_QUERYSERVICE = 0x0000001e;
enum HH_PRETRANSLATEMESSAGE = 0x000000fd;
enum HH_SET_GLOBAL_PROPERTY = 0x000000fc;
enum HH_SAFE_DISPLAY_TOPIC = 0x00000020;
enum HHWIN_PROP_TAB_AUTOHIDESHOW = 0x00000001;
enum HHWIN_PROP_ONTOP = 0x00000002;
enum HHWIN_PROP_NOTITLEBAR = 0x00000004;
enum HHWIN_PROP_NODEF_STYLES = 0x00000008;
enum HHWIN_PROP_NODEF_EXSTYLES = 0x00000010;
enum HHWIN_PROP_TRI_PANE = 0x00000020;
enum HHWIN_PROP_NOTB_TEXT = 0x00000040;
enum HHWIN_PROP_POST_QUIT = 0x00000080;
enum HHWIN_PROP_AUTO_SYNC = 0x00000100;
enum HHWIN_PROP_TRACKING = 0x00000200;
enum HHWIN_PROP_TAB_SEARCH = 0x00000400;
enum HHWIN_PROP_TAB_HISTORY = 0x00000800;
enum HHWIN_PROP_TAB_FAVORITES = 0x00001000;
enum HHWIN_PROP_CHANGE_TITLE = 0x00002000;
enum HHWIN_PROP_NAV_ONLY_WIN = 0x00004000;
enum HHWIN_PROP_NO_TOOLBAR = 0x00008000;
enum HHWIN_PROP_MENU = 0x00010000;
enum HHWIN_PROP_TAB_ADVSEARCH = 0x00020000;
enum HHWIN_PROP_USER_POS = 0x00040000;
enum HHWIN_PROP_TAB_CUSTOM1 = 0x00080000;
enum HHWIN_PROP_TAB_CUSTOM2 = 0x00100000;
enum HHWIN_PROP_TAB_CUSTOM3 = 0x00200000;
enum HHWIN_PROP_TAB_CUSTOM4 = 0x00400000;
enum HHWIN_PROP_TAB_CUSTOM5 = 0x00800000;
enum HHWIN_PROP_TAB_CUSTOM6 = 0x01000000;
enum HHWIN_PROP_TAB_CUSTOM7 = 0x02000000;
enum HHWIN_PROP_TAB_CUSTOM8 = 0x04000000;
enum HHWIN_PROP_TAB_CUSTOM9 = 0x08000000;
enum HHWIN_TB_MARGIN = 0x10000000;
enum HHWIN_PARAM_PROPERTIES = 0x00000002;
enum HHWIN_PARAM_STYLES = 0x00000004;
enum HHWIN_PARAM_EXSTYLES = 0x00000008;
enum HHWIN_PARAM_RECT = 0x00000010;
enum HHWIN_PARAM_NAV_WIDTH = 0x00000020;
enum HHWIN_PARAM_SHOWSTATE = 0x00000040;
enum HHWIN_PARAM_INFOTYPES = 0x00000080;
enum HHWIN_PARAM_TB_FLAGS = 0x00000100;
enum HHWIN_PARAM_EXPANSION = 0x00000200;
enum HHWIN_PARAM_TABPOS = 0x00000400;
enum HHWIN_PARAM_TABORDER = 0x00000800;
enum HHWIN_PARAM_HISTORY_COUNT = 0x00001000;
enum HHWIN_PARAM_CUR_TAB = 0x00002000;
enum HHWIN_BUTTON_EXPAND = 0x00000002;
enum HHWIN_BUTTON_BACK = 0x00000004;
enum HHWIN_BUTTON_FORWARD = 0x00000008;
enum HHWIN_BUTTON_STOP = 0x00000010;
enum HHWIN_BUTTON_REFRESH = 0x00000020;
enum HHWIN_BUTTON_HOME = 0x00000040;
enum HHWIN_BUTTON_BROWSE_FWD = 0x00000080;
enum HHWIN_BUTTON_BROWSE_BCK = 0x00000100;
enum HHWIN_BUTTON_NOTES = 0x00000200;
enum HHWIN_BUTTON_CONTENTS = 0x00000400;
enum HHWIN_BUTTON_SYNC = 0x00000800;
enum HHWIN_BUTTON_OPTIONS = 0x00001000;
enum HHWIN_BUTTON_PRINT = 0x00002000;
enum HHWIN_BUTTON_INDEX = 0x00004000;
enum HHWIN_BUTTON_SEARCH = 0x00008000;
enum HHWIN_BUTTON_HISTORY = 0x00010000;
enum HHWIN_BUTTON_FAVORITES = 0x00020000;
enum HHWIN_BUTTON_JUMP1 = 0x00040000;
enum HHWIN_BUTTON_JUMP2 = 0x00080000;
enum HHWIN_BUTTON_ZOOM = 0x00100000;
enum HHWIN_BUTTON_TOC_NEXT = 0x00200000;
enum HHWIN_BUTTON_TOC_PREV = 0x00400000;
enum IDTB_EXPAND = 0x000000c8;
enum IDTB_CONTRACT = 0x000000c9;
enum IDTB_STOP = 0x000000ca;
enum IDTB_REFRESH = 0x000000cb;
enum IDTB_BACK = 0x000000cc;
enum IDTB_HOME = 0x000000cd;
enum IDTB_SYNC = 0x000000ce;
enum IDTB_PRINT = 0x000000cf;
enum IDTB_OPTIONS = 0x000000d0;
enum IDTB_FORWARD = 0x000000d1;
enum IDTB_NOTES = 0x000000d2;
enum IDTB_BROWSE_FWD = 0x000000d3;
enum IDTB_BROWSE_BACK = 0x000000d4;
enum IDTB_CONTENTS = 0x000000d5;
enum IDTB_INDEX = 0x000000d6;
enum IDTB_SEARCH = 0x000000d7;
enum IDTB_HISTORY = 0x000000d8;
enum IDTB_FAVORITES = 0x000000d9;
enum IDTB_JUMP1 = 0x000000da;
enum IDTB_JUMP2 = 0x000000db;
enum IDTB_CUSTOMIZE = 0x000000dd;
enum IDTB_ZOOM = 0x000000de;
enum IDTB_TOC_NEXT = 0x000000df;
enum IDTB_TOC_PREV = 0x000000e0;
enum HH_MAX_TABS = 0x00000013;
enum HH_FTS_DEFAULT_PROXIMITY = 0xffffffffffffffff;
enum CLSID_IITPropList = GUID(0x4662daae, 0xd393, 0x11d0, [0x9a, 0x56, 0x0, 0xc0, 0x4f, 0xb6, 0x8b, 0xf7]);
enum PROP_ADD = 0x00000000;
enum PROP_DELETE = 0x00000001;
enum PROP_UPDATE = 0x00000002;
enum TYPE_VALUE = 0x00000000;
enum TYPE_POINTER = 0x00000001;
enum TYPE_STRING = 0x00000002;
enum CLSID_IITDatabase = GUID(0x66673452, 0x8c23, 0x11d0, [0xa8, 0x4e, 0x0, 0xaa, 0x0, 0x6c, 0x7d, 0x1]);
enum CLSID_IITDatabaseLocal = GUID(0x4662daa9, 0xd393, 0x11d0, [0x9a, 0x56, 0x0, 0xc0, 0x4f, 0xb6, 0x8b, 0xf7]);
enum STDPROP_UID = 0x00000001;
enum STDPROP_TITLE = 0x00000002;
enum STDPROP_USERDATA = 0x00000003;
enum STDPROP_KEY = 0x00000004;
enum STDPROP_SORTKEY = 0x00000064;
enum STDPROP_DISPLAYKEY = 0x00000065;
enum STDPROP_SORTORDINAL = 0x00000066;
enum STDPROP_INDEX_TEXT = 0x000000c8;
enum STDPROP_INDEX_VFLD = 0x000000c9;
enum STDPROP_INDEX_DTYPE = 0x000000ca;
enum STDPROP_INDEX_LENGTH = 0x000000cb;
enum STDPROP_INDEX_BREAK = 0x000000cc;
enum STDPROP_INDEX_TERM = 0x000000d2;
enum STDPROP_INDEX_TERM_RAW_LENGTH = 0x000000d3;
enum STDPROP_USERPROP_BASE = 0x00010000;
enum STDPROP_USERPROP_MAX = 0x7fffffff;
enum SZ_WWDEST_GLOBAL = "GLOBAL";
enum SZ_WWDEST_KEY = "KEY";
enum SZ_WWDEST_OCC = "OCC";
enum CLSID_IITCmdInt = GUID(0x4662daa2, 0xd393, 0x11d0, [0x9a, 0x56, 0x0, 0xc0, 0x4f, 0xb6, 0x8b, 0xf7]);
enum CLSID_IITSvMgr = GUID(0x4662daa3, 0xd393, 0x11d0, [0x9a, 0x56, 0x0, 0xc0, 0x4f, 0xb6, 0x8b, 0xf7]);
enum CLSID_IITWordWheelUpdate = GUID(0x4662daa5, 0xd393, 0x11d0, [0x9a, 0x56, 0x0, 0xc0, 0x4f, 0xb6, 0x8b, 0xf7]);
enum CLSID_IITGroupUpdate = GUID(0x4662daa4, 0xd393, 0x11d0, [0x9a, 0x56, 0x0, 0xc0, 0x4f, 0xb6, 0x8b, 0xf7]);
enum CLSID_IITIndexBuild = GUID(0x8fa0d5aa, 0xdedf, 0x11d0, [0x9a, 0x61, 0x0, 0xc0, 0x4f, 0xb6, 0x8b, 0xf7]);
enum CLSID_IITWWFilterBuild = GUID(0x8fa0d5ab, 0xdedf, 0x11d0, [0x9a, 0x61, 0x0, 0xc0, 0x4f, 0xb6, 0x8b, 0xf7]);
enum CLSID_IITWordWheel = GUID(0xd73725c2, 0x8c12, 0x11d0, [0xa8, 0x4e, 0x0, 0xaa, 0x0, 0x6c, 0x7d, 0x1]);
enum CLSID_IITWordWheelLocal = GUID(0x4662daa8, 0xd393, 0x11d0, [0x9a, 0x56, 0x0, 0xc0, 0x4f, 0xb6, 0x8b, 0xf7]);
enum ITWW_OPEN_NOCONNECT = 0x00000001;
enum ITWW_CBKEY_MAX = 0x00000400;
enum IITWBC_BREAK_ACCEPT_WILDCARDS = 0x00000001;
enum IITWBC_BREAK_AND_STEM = 0x00000002;
enum E_NOTEXIST = 0xffffffff80001000;
enum E_DUPLICATE = 0xffffffff80001001;
enum E_BADVERSION = 0xffffffff80001002;
enum E_BADFILE = 0xffffffff80001003;
enum E_BADFORMAT = 0xffffffff80001004;
enum E_NOPERMISSION = 0xffffffff80001005;
enum E_ASSERT = 0xffffffff80001006;
enum E_INTERRUPT = 0xffffffff80001007;
enum E_NOTSUPPORTED = 0xffffffff80001008;
enum E_OUTOFRANGE = 0xffffffff80001009;
enum E_GROUPIDTOOBIG = 0xffffffff8000100a;
enum E_TOOMANYTITLES = 0xffffffff8000100b;
enum E_NOMERGEDDATA = 0xffffffff8000100c;
enum E_NOTFOUND = 0xffffffff8000100d;
enum E_CANTFINDDLL = 0xffffffff8000100e;
enum E_NOHANDLE = 0xffffffff8000100f;
enum E_GETLASTERROR = 0xffffffff80001010;
enum E_BADPARAM = 0xffffffff80001011;
enum E_INVALIDSTATE = 0xffffffff80001012;
enum E_NOTOPEN = 0xffffffff80001013;
enum E_ALREADYOPEN = 0xffffffff80001013;
enum E_UNKNOWN_TRANSPORT = 0xffffffff80001016;
enum E_UNSUPPORTED_TRANSPORT = 0xffffffff80001017;
enum E_BADFILTERSIZE = 0xffffffff80001018;
enum E_TOOMANYOBJECTS = 0xffffffff80001019;
enum E_NAMETOOLONG = 0xffffffff80001020;
enum E_FILECREATE = 0xffffffff80001030;
enum E_FILECLOSE = 0xffffffff80001031;
enum E_FILEREAD = 0xffffffff80001032;
enum E_FILESEEK = 0xffffffff80001033;
enum E_FILEWRITE = 0xffffffff80001034;
enum E_FILEDELETE = 0xffffffff80001035;
enum E_FILEINVALID = 0xffffffff80001036;
enum E_FILENOTFOUND = 0xffffffff80001037;
enum E_DISKFULL = 0xffffffff80001038;
enum E_TOOMANYTOPICS = 0xffffffff80001050;
enum E_TOOMANYDUPS = 0xffffffff80001051;
enum E_TREETOOBIG = 0xffffffff80001052;
enum E_BADBREAKER = 0xffffffff80001053;
enum E_BADVALUE = 0xffffffff80001054;
enum E_ALL_WILD = 0xffffffff80001055;
enum E_TOODEEP = 0xffffffff80001056;
enum E_EXPECTEDTERM = 0xffffffff80001057;
enum E_MISSLPAREN = 0xffffffff80001058;
enum E_MISSRPAREN = 0xffffffff80001059;
enum E_MISSQUOTE = 0xffffffff8000105a;
enum E_NULLQUERY = 0xffffffff8000105b;
enum E_STOPWORD = 0xffffffff8000105c;
enum E_BADRANGEOP = 0xffffffff8000105d;
enum E_UNMATCHEDTYPE = 0xffffffff8000105e;
enum E_WORDTOOLONG = 0xffffffff8000105f;
enum E_BADINDEXFLAGS = 0xffffffff80001060;
enum E_WILD_IN_DTYPE = 0xffffffff80001061;
enum E_NOSTEMMER = 0xffffffff80001062;
enum E_MISSINGPROP = 0xffffffff80001080;
enum E_PROPLISTNOTEMPTY = 0xffffffff80001081;
enum E_PROPLISTEMPTY = 0xffffffff80001082;
enum E_ALREADYINIT = 0xffffffff80001083;
enum E_NOTINIT = 0xffffffff80001084;
enum E_RESULTSETEMPTY = 0xffffffff80001085;
enum E_TOOMANYCOLUMNS = 0xffffffff80001086;
enum E_NOKEYPROP = 0xffffffff80001087;
enum CLSID_IITResultSet = GUID(0x4662daa7, 0xd393, 0x11d0, [0x9a, 0x56, 0x0, 0xc0, 0x4f, 0xb6, 0x8b, 0xf7]);
enum MAX_COLUMNS = 0x00000100;
enum CLSID_ITStdBreaker = GUID(0x4662daaf, 0xd393, 0x11d0, [0x9a, 0x56, 0x0, 0xc0, 0x4f, 0xb6, 0x8b, 0xf7]);
enum CLSID_ITEngStemmer = GUID(0x8fa0d5a8, 0xdedf, 0x11d0, [0x9a, 0x61, 0x0, 0xc0, 0x4f, 0xb6, 0x8b, 0xf7]);
enum HHWIN_NAVTYPE_TOC = 0x00000000;
enum HHWIN_NAVTYPE_INDEX = 0x00000001;
enum HHWIN_NAVTYPE_SEARCH = 0x00000002;
enum HHWIN_NAVTYPE_FAVORITES = 0x00000003;
enum HHWIN_NAVTYPE_HISTORY = 0x00000004;
enum HHWIN_NAVTYPE_AUTHOR = 0x00000005;
enum HHWIN_NAVTYPE_CUSTOM_FIRST = 0x0000000b;
enum IT_INCLUSIVE = 0x00000000;
enum IT_EXCLUSIVE = 0x00000001;
enum IT_HIDDEN = 0x00000002;
enum HHWIN_NAVTAB_TOP = 0x00000000;
enum HHWIN_NAVTAB_LEFT = 0x00000001;
enum HHWIN_NAVTAB_BOTTOM = 0x00000002;
enum HH_TAB_CONTENTS = 0x00000000;
enum HH_TAB_INDEX = 0x00000001;
enum HH_TAB_SEARCH = 0x00000002;
enum HH_TAB_FAVORITES = 0x00000003;
enum HH_TAB_HISTORY = 0x00000004;
enum HH_TAB_AUTHOR = 0x00000005;
enum HH_TAB_CUSTOM_FIRST = 0x0000000b;
enum HH_TAB_CUSTOM_LAST = 0x00000013;
enum HHACT_TAB_CONTENTS = 0x00000000;
enum HHACT_TAB_INDEX = 0x00000001;
enum HHACT_TAB_SEARCH = 0x00000002;
enum HHACT_TAB_HISTORY = 0x00000003;
enum HHACT_TAB_FAVORITES = 0x00000004;
enum HHACT_EXPAND = 0x00000005;
enum HHACT_CONTRACT = 0x00000006;
enum HHACT_BACK = 0x00000007;
enum HHACT_FORWARD = 0x00000008;
enum HHACT_STOP = 0x00000009;
enum HHACT_REFRESH = 0x0000000a;
enum HHACT_HOME = 0x0000000b;
enum HHACT_SYNC = 0x0000000c;
enum HHACT_OPTIONS = 0x0000000d;
enum HHACT_PRINT = 0x0000000e;
enum HHACT_HIGHLIGHT = 0x0000000f;
enum HHACT_CUSTOMIZE = 0x00000010;
enum HHACT_JUMP1 = 0x00000011;
enum HHACT_JUMP2 = 0x00000012;
enum HHACT_ZOOM = 0x00000013;
enum HHACT_TOC_NEXT = 0x00000014;
enum HHACT_TOC_PREV = 0x00000015;
enum HHACT_NOTES = 0x00000016;
enum HHACT_LAST_ENUM = 0x00000017;
struct HHN_NOTIFY
{
    NMHDR hdr;
    const(char)* pszUrl;
}
struct HH_POPUP
{
    int cbStruct;
    HINSTANCE hinst;
    uint idString;
    byte* pszText;
    POINT pt;
    uint clrForeground;
    uint clrBackground;
    RECT rcMargins;
    byte* pszFont;
}
struct HH_AKLINK
{
    int cbStruct;
    BOOL fReserved;
    byte* pszKeywords;
    byte* pszUrl;
    byte* pszMsgText;
    byte* pszMsgTitle;
    byte* pszWindow;
    BOOL fIndexOnFail;
}
struct HH_ENUM_IT
{
    int cbStruct;
    int iType;
    const(char)* pszCatName;
    const(char)* pszITName;
    const(char)* pszITDescription;
}
struct HH_ENUM_CAT
{
    int cbStruct;
    const(char)* pszCatName;
    const(char)* pszCatDescription;
}
struct HH_SET_INFOTYPE
{
    int cbStruct;
    const(char)* pszCatName;
    const(char)* pszInfoTypeName;
}
struct HH_FTS_QUERY
{
    int cbStruct;
    BOOL fUniCodeStrings;
    byte* pszSearchQuery;
    int iProximity;
    BOOL fStemmedSearch;
    BOOL fTitleOnly;
    BOOL fExecute;
    byte* pszWindow;
}
struct HH_WINTYPE
{
    int cbStruct;
    BOOL fUniCodeStrings;
    byte* pszType;
    uint fsValidMembers;
    uint fsWinProperties;
    byte* pszCaption;
    uint dwStyles;
    uint dwExStyles;
    RECT rcWindowPos;
    int nShowState;
    HWND hwndHelp;
    HWND hwndCaller;
    uint* paInfoTypes;
    HWND hwndToolBar;
    HWND hwndNavigation;
    HWND hwndHTML;
    int iNavWidth;
    RECT rcHTML;
    byte* pszToc;
    byte* pszIndex;
    byte* pszFile;
    byte* pszHome;
    uint fsToolBarFlags;
    BOOL fNotExpanded;
    int curNavType;
    int tabpos;
    int idNotify;
    ubyte[20] tabOrder;
    int cHistory;
    byte* pszJump1;
    byte* pszJump2;
    byte* pszUrlJump1;
    byte* pszUrlJump2;
    RECT rcMinSize;
    int cbInfoTypes;
    byte* pszCustomTabs;
}
struct HHNTRACK
{
    NMHDR hdr;
    const(char)* pszCurUrl;
    int idAction;
    HH_WINTYPE* phhWinType;
}
alias HH_GPROPID = int;
enum : int
{
    HH_GPROPID_SINGLETHREAD     = 0x00000001,
    HH_GPROPID_TOOLBAR_MARGIN   = 0x00000002,
    HH_GPROPID_UI_LANGUAGE      = 0x00000003,
    HH_GPROPID_CURRENT_SUBSET   = 0x00000004,
    HH_GPROPID_CONTENT_LANGUAGE = 0x00000005,
}

struct HH_GLOBAL_PROPERTY
{
    HH_GPROPID id;
    VARIANT var;
}
struct CProperty
{
    uint dwPropID;
    uint cbData;
    uint dwType;
    union
    {
        PWSTR lpszwData;
        void* lpvData;
        uint dwValue;
    }
    BOOL fPersist;
}
enum IID_IITPropList = GUID(0x1f403bb1, 0x9997, 0x11d0, [0xa8, 0x50, 0x0, 0xaa, 0x0, 0x6c, 0x7d, 0x1]);
interface IITPropList : IPersistStreamInit
{
    HRESULT Set(uint, const(wchar)*, uint);
    HRESULT Set(uint, void*, uint, uint);
    HRESULT Set(uint, uint, uint);
    HRESULT Add(CProperty*);
    HRESULT Get(uint, CProperty*);
    HRESULT Clear();
    HRESULT SetPersist(BOOL);
    HRESULT SetPersist(uint, BOOL);
    HRESULT GetFirst(CProperty*);
    HRESULT GetNext(CProperty*);
    HRESULT GetPropCount(int*);
    HRESULT SaveHeader(void*, uint);
    HRESULT SaveData(void*, uint, void*, uint);
    HRESULT GetHeaderSize(uint*);
    HRESULT GetDataSize(void*, uint, uint*);
    HRESULT SaveDataToStream(void*, uint, IStream);
    HRESULT LoadFromMem(void*, uint);
    HRESULT SaveToMem(void*, uint);
}
enum IID_IITDatabase = GUID(0x8fa0d5a2, 0xdedf, 0x11d0, [0x9a, 0x61, 0x0, 0xc0, 0x4f, 0xb6, 0x8b, 0xf7]);
interface IITDatabase : IUnknown
{
    HRESULT Open(const(wchar)*, const(wchar)*, uint);
    HRESULT Close();
    HRESULT CreateObject(const(GUID)*, uint*);
    HRESULT GetObject(uint, const(GUID)*, void**);
    HRESULT GetObjectPersistence(const(wchar)*, uint, void**, BOOL);
}
struct IITGroup
{
}
struct IITQuery
{
}
enum IID_IITWordWheel = GUID(0x8fa0d5a4, 0xdedf, 0x11d0, [0x9a, 0x61, 0x0, 0xc0, 0x4f, 0xb6, 0x8b, 0xf7]);
interface IITWordWheel : IUnknown
{
    HRESULT Open(IITDatabase, const(wchar)*, WORD_WHEEL_OPEN_FLAGS);
    HRESULT Close();
    HRESULT GetLocaleInfo(uint*, uint*);
    HRESULT GetSorterInstance(uint*);
    HRESULT Count(int*);
    HRESULT Lookup(const(void)*, BOOL, int*);
    HRESULT Lookup(int, IITResultSet, int);
    HRESULT Lookup(int, void*, uint);
    HRESULT SetGroup(IITGroup*);
    HRESULT GetGroup(IITGroup**);
    HRESULT GetDataCount(int, uint*);
    HRESULT GetData(int, IITResultSet);
    HRESULT GetDataColumns(IITResultSet);
}
enum IID_IStemSink = GUID(0xfe77c330, 0x7f42, 0x11ce, [0xbe, 0x57, 0x0, 0xaa, 0x0, 0x51, 0xfe, 0x20]);
interface IStemSink : IUnknown
{
    HRESULT PutAltWord(const(wchar)*, uint);
    HRESULT PutWord(const(wchar)*, uint);
}
enum IID_IStemmerConfig = GUID(0x8fa0d5a7, 0xdedf, 0x11d0, [0x9a, 0x61, 0x0, 0xc0, 0x4f, 0xb6, 0x8b, 0xf7]);
interface IStemmerConfig : IUnknown
{
    HRESULT SetLocaleInfo(uint, uint);
    HRESULT GetLocaleInfo(uint*, uint*);
    HRESULT SetControlInfo(uint, uint);
    HRESULT GetControlInfo(uint*, uint*);
    HRESULT LoadExternalStemmerData(IStream, uint);
}
struct IITStopWordList
{
}
enum IID_IWordBreakerConfig = GUID(0x8fa0d5a6, 0xdedf, 0x11d0, [0x9a, 0x61, 0x0, 0xc0, 0x4f, 0xb6, 0x8b, 0xf7]);
interface IWordBreakerConfig : IUnknown
{
    HRESULT SetLocaleInfo(uint, uint);
    HRESULT GetLocaleInfo(uint*, uint*);
    HRESULT SetBreakWordType(uint);
    HRESULT GetBreakWordType(uint*);
    HRESULT SetControlInfo(uint, uint);
    HRESULT GetControlInfo(uint*, uint*);
    HRESULT LoadExternalBreakerData(IStream, uint);
    HRESULT SetWordStemmer(const(GUID)*, IStemmer);
    HRESULT GetWordStemmer(IStemmer*);
}
alias PRIORITY = int;
enum : int
{
    PRIORITY_LOW    = 0x00000000,
    PRIORITY_NORMAL = 0x00000001,
    PRIORITY_HIGH   = 0x00000002,
}

struct ROWSTATUS
{
    int lRowFirst;
    int cRows;
    int cProperties;
    int cRowsTotal;
}
struct COLUMNSTATUS
{
    int cPropCount;
    int cPropsLoaded;
}
alias PFNCOLHEAPFREE = int function(void*);
enum IID_IITResultSet = GUID(0x3bb91d41, 0x998b, 0x11d0, [0xa8, 0x50, 0x0, 0xaa, 0x0, 0x6c, 0x7d, 0x1]);
interface IITResultSet : IUnknown
{
    HRESULT SetColumnPriority(int, PRIORITY);
    HRESULT SetColumnHeap(int, void*, PFNCOLHEAPFREE);
    HRESULT SetKeyProp(uint);
    HRESULT Add(uint, uint, PRIORITY);
    HRESULT Add(uint, const(wchar)*, PRIORITY);
    HRESULT Add(uint, void*, uint, PRIORITY);
    HRESULT Add(void*);
    HRESULT Append(void*, void*);
    HRESULT Set(int, int, void*, uint);
    HRESULT Set(int, int, const(wchar)*);
    HRESULT Set(int, int, ulong);
    HRESULT Set(int, void*, void*);
    HRESULT Copy(IITResultSet);
    HRESULT AppendRows(IITResultSet, int, int, int*);
    HRESULT Get(int, int, CProperty*);
    HRESULT GetKeyProp(uint*);
    HRESULT GetColumnPriority(int, PRIORITY*);
    HRESULT GetRowCount(int*);
    HRESULT GetColumnCount(int*);
    HRESULT GetColumn(int, uint*, uint*, void**, uint*, PRIORITY*);
    HRESULT GetColumn(int, uint*);
    HRESULT GetColumnFromPropID(uint, int*);
    HRESULT Clear();
    HRESULT ClearRows();
    HRESULT Free();
    HRESULT IsCompleted();
    HRESULT Cancel();
    HRESULT Pause(BOOL);
    HRESULT GetRowStatus(int, int, ROWSTATUS*);
    HRESULT GetColumnStatus(COLUMNSTATUS*);
}
