module windows.win32.system.dataexchange;

import windows.win32.foundation : BOOL, CHAR, HANDLE, HWND, LPARAM, PSTR, PWSTR, WPARAM;
import windows.win32.graphics.gdi : HDC, HENHMETAFILE, HMETAFILE;
import windows.win32.security_ : SECURITY_QUALITY_OF_SERVICE;

version (Windows):
extern (Windows):

alias DDE_ENABLE_CALLBACK_CMD = uint;
enum : uint
{
    EC_ENABLEALL    = 0x00000000,
    EC_ENABLEONE    = 0x00000080,
    EC_DISABLE      = 0x00000008,
    EC_QUERYWAITING = 0x00000002,
}

alias DDE_INITIALIZE_COMMAND = uint;
enum : uint
{
    APPCLASS_MONITOR          = 0x00000001,
    APPCLASS_STANDARD         = 0x00000000,
    APPCMD_CLIENTONLY         = 0x00000010,
    APPCMD_FILTERINITS        = 0x00000020,
    CBF_FAIL_ALLSVRXACTIONS   = 0x0003f000,
    CBF_FAIL_ADVISES          = 0x00004000,
    CBF_FAIL_CONNECTIONS      = 0x00002000,
    CBF_FAIL_EXECUTES         = 0x00008000,
    CBF_FAIL_POKES            = 0x00010000,
    CBF_FAIL_REQUESTS         = 0x00020000,
    CBF_FAIL_SELFCONNECTIONS  = 0x00001000,
    CBF_SKIP_ALLNOTIFICATIONS = 0x003c0000,
    CBF_SKIP_CONNECT_CONFIRMS = 0x00040000,
    CBF_SKIP_DISCONNECTS      = 0x00200000,
    CBF_SKIP_REGISTRATIONS    = 0x00080000,
    CBF_SKIP_UNREGISTRATIONS  = 0x00100000,
    MF_CALLBACKS              = 0x08000000,
    MF_CONV                   = 0x40000000,
    MF_ERRORS                 = 0x10000000,
    MF_HSZ_INFO               = 0x01000000,
    MF_LINKS                  = 0x20000000,
    MF_POSTMSGS               = 0x04000000,
    MF_SENDMSGS               = 0x02000000,
}

alias DDE_NAME_SERVICE_CMD = uint;
enum : uint
{
    DNS_REGISTER   = 0x00000001,
    DNS_UNREGISTER = 0x00000002,
    DNS_FILTERON   = 0x00000004,
    DNS_FILTEROFF  = 0x00000008,
}

alias DDE_CLIENT_TRANSACTION_TYPE = uint;
enum : uint
{
    XTYP_ADVSTART        = 0x00001030,
    XTYP_ADVSTOP         = 0x00008040,
    XTYP_EXECUTE         = 0x00004050,
    XTYP_POKE            = 0x00004090,
    XTYP_REQUEST         = 0x000020b0,
    XTYP_ADVDATA         = 0x00004010,
    XTYP_ADVREQ          = 0x00002022,
    XTYP_CONNECT         = 0x00001062,
    XTYP_CONNECT_CONFIRM = 0x00008072,
    XTYP_DISCONNECT      = 0x000080c2,
    XTYP_MONITOR         = 0x000080f2,
    XTYP_REGISTER        = 0x000080a2,
    XTYP_UNREGISTER      = 0x000080d2,
    XTYP_WILDCONNECT     = 0x000020e2,
    XTYP_XACT_COMPLETE   = 0x00008080,
}

alias CONVINFO_CONVERSATION_STATE = uint;
enum : uint
{
    XST_ADVACKRCVD     = 0x0000000d,
    XST_ADVDATAACKRCVD = 0x00000010,
    XST_ADVDATASENT    = 0x0000000f,
    XST_ADVSENT        = 0x0000000b,
    XST_CONNECTED      = 0x00000002,
    XST_DATARCVD       = 0x00000006,
    XST_EXECACKRCVD    = 0x0000000a,
    XST_EXECSENT       = 0x00000009,
    XST_INCOMPLETE     = 0x00000001,
    XST_INIT1          = 0x00000003,
    XST_INIT2          = 0x00000004,
    XST_NULL           = 0x00000000,
    XST_POKEACKRCVD    = 0x00000008,
    XST_POKESENT       = 0x00000007,
    XST_REQSENT        = 0x00000005,
    XST_UNADVACKRCVD   = 0x0000000e,
    XST_UNADVSENT      = 0x0000000c,
}

alias CONVINFO_STATUS = uint;
enum : uint
{
    ST_ADVISE     = 0x00000002,
    ST_BLOCKED    = 0x00000008,
    ST_BLOCKNEXT  = 0x00000080,
    ST_CLIENT     = 0x00000010,
    ST_CONNECTED  = 0x00000001,
    ST_INLIST     = 0x00000040,
    ST_ISLOCAL    = 0x00000004,
    ST_ISSELF     = 0x00000100,
    ST_TERMINATED = 0x00000020,
}

BOOL DdeSetQualityOfService(HWND, const(SECURITY_QUALITY_OF_SERVICE)*, SECURITY_QUALITY_OF_SERVICE*);
BOOL ImpersonateDdeClientWindow(HWND, HWND);
LPARAM PackDDElParam(uint, ulong, ulong);
BOOL UnpackDDElParam(uint, LPARAM, ulong*, ulong*);
BOOL FreeDDElParam(uint, LPARAM);
LPARAM ReuseDDElParam(LPARAM, uint, uint, ulong, ulong);
uint DdeInitializeA(uint*, PFNCALLBACK, DDE_INITIALIZE_COMMAND, uint);
uint DdeInitializeW(uint*, PFNCALLBACK, DDE_INITIALIZE_COMMAND, uint);
BOOL DdeUninitialize(uint);
HCONVLIST DdeConnectList(uint, HSZ, HSZ, HCONVLIST, CONVCONTEXT*);
HCONV DdeQueryNextServer(HCONVLIST, HCONV);
BOOL DdeDisconnectList(HCONVLIST);
HCONV DdeConnect(uint, HSZ, HSZ, CONVCONTEXT*);
BOOL DdeDisconnect(HCONV);
HCONV DdeReconnect(HCONV);
uint DdeQueryConvInfo(HCONV, uint, CONVINFO*);
BOOL DdeSetUserHandle(HCONV, uint, ulong);
BOOL DdeAbandonTransaction(uint, HCONV, uint);
BOOL DdePostAdvise(uint, HSZ, HSZ);
BOOL DdeEnableCallback(uint, HCONV, DDE_ENABLE_CALLBACK_CMD);
BOOL DdeImpersonateClient(HCONV);
HDDEDATA DdeNameService(uint, HSZ, HSZ, DDE_NAME_SERVICE_CMD);
HDDEDATA DdeClientTransaction(ubyte*, uint, HCONV, HSZ, uint, DDE_CLIENT_TRANSACTION_TYPE, uint, uint*);
HDDEDATA DdeCreateDataHandle(uint, ubyte*, uint, uint, HSZ, uint, uint);
HDDEDATA DdeAddData(HDDEDATA, ubyte*, uint, uint);
uint DdeGetData(HDDEDATA, ubyte*, uint, uint);
ubyte* DdeAccessData(HDDEDATA, uint*);
BOOL DdeUnaccessData(HDDEDATA);
BOOL DdeFreeDataHandle(HDDEDATA);
uint DdeGetLastError(uint);
HSZ DdeCreateStringHandleA(uint, const(char)*, int);
HSZ DdeCreateStringHandleW(uint, const(wchar)*, int);
uint DdeQueryStringA(uint, HSZ, PSTR, uint, int);
uint DdeQueryStringW(uint, HSZ, PWSTR, uint, int);
BOOL DdeFreeStringHandle(uint, HSZ);
BOOL DdeKeepStringHandle(uint, HSZ);
int DdeCmpStringHandles(HSZ, HSZ);
HENHMETAFILE SetWinMetaFileBits(uint, const(ubyte)*, HDC, const(METAFILEPICT)*);
BOOL OpenClipboard(HWND);
BOOL CloseClipboard();
uint GetClipboardSequenceNumber();
HWND GetClipboardOwner();
HWND SetClipboardViewer(HWND);
HWND GetClipboardViewer();
BOOL ChangeClipboardChain(HWND, HWND);
HANDLE SetClipboardData(uint, HANDLE);
HANDLE GetClipboardData(uint);
uint RegisterClipboardFormatA(const(char)*);
uint RegisterClipboardFormatW(const(wchar)*);
int CountClipboardFormats();
uint EnumClipboardFormats(uint);
int GetClipboardFormatNameA(uint, PSTR, int);
int GetClipboardFormatNameW(uint, PWSTR, int);
BOOL EmptyClipboard();
BOOL IsClipboardFormatAvailable(uint);
int GetPriorityClipboardFormat(uint*, int);
HWND GetOpenClipboardWindow();
BOOL AddClipboardFormatListener(HWND);
BOOL RemoveClipboardFormatListener(HWND);
BOOL GetUpdatedClipboardFormats(uint*, uint, uint*);
ushort GlobalDeleteAtom(ushort);
BOOL InitAtomTable(uint);
ushort DeleteAtom(ushort);
ushort GlobalAddAtomA(const(char)*);
ushort GlobalAddAtomW(const(wchar)*);
ushort GlobalAddAtomExA(const(char)*, uint);
ushort GlobalAddAtomExW(const(wchar)*, uint);
ushort GlobalFindAtomA(const(char)*);
ushort GlobalFindAtomW(const(wchar)*);
uint GlobalGetAtomNameA(ushort, PSTR, int);
uint GlobalGetAtomNameW(ushort, PWSTR, int);
ushort AddAtomA(const(char)*);
ushort AddAtomW(const(wchar)*);
ushort FindAtomA(const(char)*);
ushort FindAtomW(const(wchar)*);
uint GetAtomNameA(ushort, PSTR, int);
uint GetAtomNameW(ushort, PWSTR, int);
enum WM_DDE_FIRST = 0x000003e0;
enum WM_DDE_INITIATE = 0x000003e0;
enum WM_DDE_TERMINATE = 0x000003e1;
enum WM_DDE_ADVISE = 0x000003e2;
enum WM_DDE_UNADVISE = 0x000003e3;
enum WM_DDE_ACK = 0x000003e4;
enum WM_DDE_DATA = 0x000003e5;
enum WM_DDE_REQUEST = 0x000003e6;
enum WM_DDE_POKE = 0x000003e7;
enum WM_DDE_EXECUTE = 0x000003e8;
enum WM_DDE_LAST = 0x000003e8;
enum CADV_LATEACK = 0x0000ffff;
enum DDE_FACK = 0x00008000;
enum DDE_FBUSY = 0x00004000;
enum DDE_FDEFERUPD = 0x00004000;
enum DDE_FACKREQ = 0x00008000;
enum DDE_FRELEASE = 0x00002000;
enum DDE_FREQUESTED = 0x00001000;
enum DDE_FAPPSTATUS = 0x000000ff;
enum DDE_FNOTPROCESSED = 0x00000000;
enum MSGF_DDEMGR = 0x00008001;
enum CP_WINANSI = 0x000003ec;
enum CP_WINUNICODE = 0x000004b0;
enum CP_WINNEUTRAL = 0x000004b0;
enum XTYPF_NOBLOCK = 0x00000002;
enum XTYPF_NODATA = 0x00000004;
enum XTYPF_ACKREQ = 0x00000008;
enum XCLASS_MASK = 0x0000fc00;
enum XCLASS_BOOL = 0x00001000;
enum XCLASS_DATA = 0x00002000;
enum XCLASS_FLAGS = 0x00004000;
enum XCLASS_NOTIFICATION = 0x00008000;
enum XTYP_MASK = 0x000000f0;
enum XTYP_SHIFT = 0x00000004;
enum TIMEOUT_ASYNC = 0xffffffff;
enum QID_SYNC = 0xffffffff;
enum SZDDESYS_TOPIC = "System";
enum SZDDESYS_ITEM_TOPICS = "Topics";
enum SZDDESYS_ITEM_SYSITEMS = "SysItems";
enum SZDDESYS_ITEM_RTNMSG = "ReturnMessage";
enum SZDDESYS_ITEM_STATUS = "Status";
enum SZDDESYS_ITEM_FORMATS = "Formats";
enum SZDDESYS_ITEM_HELP = "Help";
enum SZDDE_ITEM_ITEMLIST = "TopicItemList";
enum APPCMD_MASK = 0x00000ff0;
enum APPCLASS_MASK = 0x0000000f;
enum HDATA_APPOWNED = 0x00000001;
enum DMLERR_NO_ERROR = 0x00000000;
enum DMLERR_FIRST = 0x00004000;
enum DMLERR_ADVACKTIMEOUT = 0x00004000;
enum DMLERR_BUSY = 0x00004001;
enum DMLERR_DATAACKTIMEOUT = 0x00004002;
enum DMLERR_DLL_NOT_INITIALIZED = 0x00004003;
enum DMLERR_DLL_USAGE = 0x00004004;
enum DMLERR_EXECACKTIMEOUT = 0x00004005;
enum DMLERR_INVALIDPARAMETER = 0x00004006;
enum DMLERR_LOW_MEMORY = 0x00004007;
enum DMLERR_MEMORY_ERROR = 0x00004008;
enum DMLERR_NOTPROCESSED = 0x00004009;
enum DMLERR_NO_CONV_ESTABLISHED = 0x0000400a;
enum DMLERR_POKEACKTIMEOUT = 0x0000400b;
enum DMLERR_POSTMSG_FAILED = 0x0000400c;
enum DMLERR_REENTRANCY = 0x0000400d;
enum DMLERR_SERVER_DIED = 0x0000400e;
enum DMLERR_SYS_ERROR = 0x0000400f;
enum DMLERR_UNADVACKTIMEOUT = 0x00004010;
enum DMLERR_UNFOUND_QUEUE_ID = 0x00004011;
enum DMLERR_LAST = 0x00004011;
enum MH_CREATE = 0x00000001;
enum MH_KEEP = 0x00000002;
enum MH_DELETE = 0x00000003;
enum MH_CLEANUP = 0x00000004;
enum MAX_MONITORS = 0x00000004;
enum MF_MASK = 0xff000000;
alias HSZ = void*;
alias HCONV = void*;
alias HCONVLIST = void*;
alias HDDEDATA = void*;
struct DDEACK
{
    ushort _bitfield0;
}
struct DDEADVISE
{
    ushort _bitfield0;
    short cfFormat;
}
struct DDEDATA
{
    ushort _bitfield0;
    short cfFormat;
    ubyte[1] Value;
}
struct DDEPOKE
{
    ushort _bitfield0;
    short cfFormat;
    ubyte[1] Value;
}
struct DDELN
{
    ushort _bitfield0;
    short cfFormat;
}
struct DDEUP
{
    ushort _bitfield0;
    short cfFormat;
    ubyte[1] rgb;
}
struct HSZPAIR
{
    HSZ hszSvc;
    HSZ hszTopic;
}
struct CONVCONTEXT
{
    uint cb;
    uint wFlags;
    uint wCountryID;
    int iCodePage;
    uint dwLangID;
    uint dwSecurity;
    SECURITY_QUALITY_OF_SERVICE qos;
}
struct CONVINFO
{
    uint cb;
    ulong hUser;
    HCONV hConvPartner;
    HSZ hszSvcPartner;
    HSZ hszServiceReq;
    HSZ hszTopic;
    HSZ hszItem;
    uint wFmt;
    DDE_CLIENT_TRANSACTION_TYPE wType;
    CONVINFO_STATUS wStatus;
    CONVINFO_CONVERSATION_STATE wConvst;
    uint wLastError;
    HCONVLIST hConvList;
    CONVCONTEXT ConvCtxt;
    HWND hwnd;
    HWND hwndPartner;
}
alias PFNCALLBACK = HDDEDATA function(uint, uint, HCONV, HSZ, HSZ, HDDEDATA, ulong, ulong);
struct DDEML_MSG_HOOK_DATA
{
    ulong uiLo;
    ulong uiHi;
    uint cbData;
    uint[8] Data;
}
struct MONMSGSTRUCT
{
    uint cb;
    HWND hwndTo;
    uint dwTime;
    HANDLE hTask;
    uint wMsg;
    WPARAM wParam;
    LPARAM lParam;
    DDEML_MSG_HOOK_DATA dmhd;
}
struct MONCBSTRUCT
{
    uint cb;
    uint dwTime;
    HANDLE hTask;
    uint dwRet;
    uint wType;
    uint wFmt;
    HCONV hConv;
    HSZ hsz1;
    HSZ hsz2;
    HDDEDATA hData;
    ulong dwData1;
    ulong dwData2;
    CONVCONTEXT cc;
    uint cbData;
    uint[8] Data;
}
struct MONHSZSTRUCTA
{
    uint cb;
    BOOL fsAction;
    uint dwTime;
    HSZ hsz;
    HANDLE hTask;
    CHAR[1] str;
}
struct MONHSZSTRUCTW
{
    uint cb;
    BOOL fsAction;
    uint dwTime;
    HSZ hsz;
    HANDLE hTask;
    wchar[1] str;
}
struct MONERRSTRUCT
{
    uint cb;
    uint wLastError;
    uint dwTime;
    HANDLE hTask;
}
struct MONLINKSTRUCT
{
    uint cb;
    uint dwTime;
    HANDLE hTask;
    BOOL fEstablished;
    BOOL fNoData;
    HSZ hszSvc;
    HSZ hszTopic;
    HSZ hszItem;
    uint wFmt;
    BOOL fServer;
    HCONV hConvServer;
    HCONV hConvClient;
}
struct MONCONVSTRUCT
{
    uint cb;
    BOOL fConnect;
    uint dwTime;
    HANDLE hTask;
    HSZ hszSvc;
    HSZ hszTopic;
    HCONV hConvClient;
    HCONV hConvServer;
}
struct METAFILEPICT
{
    int mm;
    int xExt;
    int yExt;
    HMETAFILE hMF;
}
struct COPYDATASTRUCT
{
    ulong dwData;
    uint cbData;
    void* lpData;
}
