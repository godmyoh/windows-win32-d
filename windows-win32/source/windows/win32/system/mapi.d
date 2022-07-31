module windows.win32.system.mapi;

import windows.win32.foundation : PSTR, PWSTR;

version (Windows):
extern (Windows):

uint MAPIFreeBuffer(void*);
enum MAPI_OLE = 0x00000001;
enum MAPI_OLE_STATIC = 0x00000002;
enum MAPI_ORIG = 0x00000000;
enum MAPI_TO = 0x00000001;
enum MAPI_CC = 0x00000002;
enum MAPI_BCC = 0x00000003;
enum MAPI_UNREAD = 0x00000001;
enum MAPI_RECEIPT_REQUESTED = 0x00000002;
enum MAPI_SENT = 0x00000004;
enum MAPI_LOGON_UI = 0x00000001;
enum MAPI_PASSWORD_UI = 0x00020000;
enum MAPI_NEW_SESSION = 0x00000002;
enum MAPI_FORCE_DOWNLOAD = 0x00001000;
enum MAPI_EXTENDED = 0x00000020;
enum MAPI_DIALOG = 0x00000008;
enum MAPI_FORCE_UNICODE = 0x00040000;
enum MAPI_UNREAD_ONLY = 0x00000020;
enum MAPI_GUARANTEE_FIFO = 0x00000100;
enum MAPI_LONG_MSGID = 0x00004000;
enum MAPI_PEEK = 0x00000080;
enum MAPI_SUPPRESS_ATTACH = 0x00000800;
enum MAPI_ENVELOPE_ONLY = 0x00000040;
enum MAPI_BODY_AS_FILE = 0x00000200;
enum MAPI_AB_NOMODIFY = 0x00000400;
enum SUCCESS_SUCCESS = 0x00000000;
enum MAPI_USER_ABORT = 0x00000001;
enum MAPI_E_USER_ABORT = 0x00000001;
enum MAPI_E_FAILURE = 0x00000002;
enum MAPI_E_LOGON_FAILURE = 0x00000003;
enum MAPI_E_LOGIN_FAILURE = 0x00000003;
enum MAPI_E_DISK_FULL = 0x00000004;
enum MAPI_E_INSUFFICIENT_MEMORY = 0x00000005;
enum MAPI_E_ACCESS_DENIED = 0x00000006;
enum MAPI_E_TOO_MANY_SESSIONS = 0x00000008;
enum MAPI_E_TOO_MANY_FILES = 0x00000009;
enum MAPI_E_TOO_MANY_RECIPIENTS = 0x0000000a;
enum MAPI_E_ATTACHMENT_NOT_FOUND = 0x0000000b;
enum MAPI_E_ATTACHMENT_OPEN_FAILURE = 0x0000000c;
enum MAPI_E_ATTACHMENT_WRITE_FAILURE = 0x0000000d;
enum MAPI_E_UNKNOWN_RECIPIENT = 0x0000000e;
enum MAPI_E_BAD_RECIPTYPE = 0x0000000f;
enum MAPI_E_NO_MESSAGES = 0x00000010;
enum MAPI_E_INVALID_MESSAGE = 0x00000011;
enum MAPI_E_TEXT_TOO_LARGE = 0x00000012;
enum MAPI_E_INVALID_SESSION = 0x00000013;
enum MAPI_E_TYPE_NOT_SUPPORTED = 0x00000014;
enum MAPI_E_AMBIGUOUS_RECIPIENT = 0x00000015;
enum MAPI_E_AMBIG_RECIP = 0x00000015;
enum MAPI_E_MESSAGE_IN_USE = 0x00000016;
enum MAPI_E_NETWORK_FAILURE = 0x00000017;
enum MAPI_E_INVALID_EDITFIELDS = 0x00000018;
enum MAPI_E_INVALID_RECIPS = 0x00000019;
enum MAPI_E_NOT_SUPPORTED = 0x0000001a;
enum MAPI_E_UNICODE_NOT_SUPPORTED = 0x0000001b;
enum MAPI_E_ATTACHMENT_TOO_LARGE = 0x0000001c;
struct MapiFileDesc
{
    uint ulReserved;
    uint flFlags;
    uint nPosition;
    PSTR lpszPathName;
    PSTR lpszFileName;
    void* lpFileType;
}
struct MapiFileDescW
{
    uint ulReserved;
    uint flFlags;
    uint nPosition;
    PWSTR lpszPathName;
    PWSTR lpszFileName;
    void* lpFileType;
}
struct MapiFileTagExt
{
    uint ulReserved;
    uint cbTag;
    ubyte* lpTag;
    uint cbEncoding;
    ubyte* lpEncoding;
}
struct MapiRecipDesc
{
    uint ulReserved;
    uint ulRecipClass;
    PSTR lpszName;
    PSTR lpszAddress;
    uint ulEIDSize;
    void* lpEntryID;
}
struct MapiRecipDescW
{
    uint ulReserved;
    uint ulRecipClass;
    PWSTR lpszName;
    PWSTR lpszAddress;
    uint ulEIDSize;
    void* lpEntryID;
}
struct MapiMessage
{
    uint ulReserved;
    PSTR lpszSubject;
    PSTR lpszNoteText;
    PSTR lpszMessageType;
    PSTR lpszDateReceived;
    PSTR lpszConversationID;
    uint flFlags;
    MapiRecipDesc* lpOriginator;
    uint nRecipCount;
    MapiRecipDesc* lpRecips;
    uint nFileCount;
    MapiFileDesc* lpFiles;
}
struct MapiMessageW
{
    uint ulReserved;
    PWSTR lpszSubject;
    PWSTR lpszNoteText;
    PWSTR lpszMessageType;
    PWSTR lpszDateReceived;
    PWSTR lpszConversationID;
    uint flFlags;
    MapiRecipDescW* lpOriginator;
    uint nRecipCount;
    MapiRecipDescW* lpRecips;
    uint nFileCount;
    MapiFileDescW* lpFiles;
}
alias LPMAPILOGON = uint function(ulong, PSTR, PSTR, uint, uint, ulong*);
alias LPMAPILOGOFF = uint function(ulong, ulong, uint, uint);
alias LPMAPISENDMAIL = uint function(ulong, ulong, MapiMessage*, uint, uint);
alias LPMAPISENDMAILW = uint function(ulong, ulong, MapiMessageW*, uint, uint);
alias LPMAPISENDDOCUMENTS = uint function(ulong, PSTR, PSTR, PSTR, uint);
alias LPMAPIFINDNEXT = uint function(ulong, ulong, PSTR, PSTR, uint, uint, PSTR);
alias LPMAPIREADMAIL = uint function(ulong, ulong, PSTR, uint, uint, MapiMessage**);
alias LPMAPISAVEMAIL = uint function(ulong, ulong, MapiMessage*, uint, uint, PSTR);
alias LPMAPIDELETEMAIL = uint function(ulong, ulong, PSTR, uint, uint);
alias LPMAPIFREEBUFFER = uint function(void*);
alias LPMAPIADDRESS = uint function(ulong, ulong, PSTR, uint, PSTR, uint, MapiRecipDesc*, uint, uint, uint*, MapiRecipDesc**);
alias LPMAPIDETAILS = uint function(ulong, ulong, MapiRecipDesc*, uint, uint);
alias LPMAPIRESOLVENAME = uint function(ulong, ulong, PSTR, uint, uint, MapiRecipDesc**);
