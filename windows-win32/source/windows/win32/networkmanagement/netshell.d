module windows.win32.networkmanagement.netshell;

import windows.win32.guid : GUID;
import windows.win32.foundation : BOOL, HANDLE, PWSTR;

version (Windows):
extern (Windows):

uint MatchEnumTag(HANDLE, const(wchar)*, uint, const(TOKEN_VALUE)*, uint*);
BOOL MatchToken(const(wchar)*, const(wchar)*);
uint PreprocessCommand(HANDLE, PWSTR*, uint, uint, TAG_TYPE*, uint, uint, uint, uint*);
uint PrintError(HANDLE, uint);
uint PrintMessageFromModule(HANDLE, uint);
uint PrintMessage(const(wchar)*);
uint RegisterContext(const(NS_CONTEXT_ATTRIBUTES)*);
uint RegisterHelper(const(GUID)*, const(NS_HELPER_ATTRIBUTES)*);
enum NETSH_ERROR_BASE = 0x00003a98;
enum ERROR_NO_ENTRIES = 0x00003a98;
enum ERROR_INVALID_SYNTAX = 0x00003a99;
enum ERROR_PROTOCOL_NOT_IN_TRANSPORT = 0x00003a9a;
enum ERROR_NO_CHANGE = 0x00003a9b;
enum ERROR_CMD_NOT_FOUND = 0x00003a9c;
enum ERROR_ENTRY_PT_NOT_FOUND = 0x00003a9d;
enum ERROR_DLL_LOAD_FAILED = 0x00003a9e;
enum ERROR_INIT_DISPLAY = 0x00003a9f;
enum ERROR_TAG_ALREADY_PRESENT = 0x00003aa0;
enum ERROR_INVALID_OPTION_TAG = 0x00003aa1;
enum ERROR_NO_TAG = 0x00003aa2;
enum ERROR_MISSING_OPTION = 0x00003aa3;
enum ERROR_TRANSPORT_NOT_PRESENT = 0x00003aa4;
enum ERROR_SHOW_USAGE = 0x00003aa5;
enum ERROR_INVALID_OPTION_VALUE = 0x00003aa6;
enum ERROR_OKAY = 0x00003aa7;
enum ERROR_CONTINUE_IN_PARENT_CONTEXT = 0x00003aa8;
enum ERROR_SUPPRESS_OUTPUT = 0x00003aa9;
enum ERROR_HELPER_ALREADY_REGISTERED = 0x00003aaa;
enum ERROR_CONTEXT_ALREADY_REGISTERED = 0x00003aab;
enum ERROR_PARSING_FAILURE = 0x00003aac;
enum NETSH_ERROR_END = 0x00003aab;
enum NS_GET_EVENT_IDS_FN_NAME = "GetEventIds";
enum MAX_NAME_LEN = 0x00000030;
enum NETSH_VERSION_50 = 0x00005000;
enum NETSH_ARG_DELIMITER = "=";
enum NETSH_CMD_DELIMITER = " ";
enum NETSH_MAX_TOKEN_LENGTH = 0x00000040;
enum NETSH_MAX_CMD_TOKEN_LENGTH = 0x00000080;
enum DEFAULT_CONTEXT_PRIORITY = 0x00000064;
enum GET_RESOURCE_STRING_FN_NAME = "GetResourceString";
alias NS_CMD_FLAGS = int;
enum : int
{
    CMD_FLAG_PRIVATE     = 0x00000001,
    CMD_FLAG_INTERACTIVE = 0x00000002,
    CMD_FLAG_LOCAL       = 0x00000008,
    CMD_FLAG_ONLINE      = 0x00000010,
    CMD_FLAG_HIDDEN      = 0x00000020,
    CMD_FLAG_LIMIT_MASK  = 0x0000ffff,
    CMD_FLAG_PRIORITY    = 0x80000000,
}

alias NS_REQS = int;
enum : int
{
    NS_REQ_ZERO           = 0x00000000,
    NS_REQ_PRESENT        = 0x00000001,
    NS_REQ_ALLOW_MULTIPLE = 0x00000002,
    NS_REQ_ONE_OR_MORE    = 0x00000003,
}

alias NS_EVENTS = int;
enum : int
{
    NS_EVENT_LOOP       = 0x00010000,
    NS_EVENT_LAST_N     = 0x00000001,
    NS_EVENT_LAST_SECS  = 0x00000002,
    NS_EVENT_FROM_N     = 0x00000004,
    NS_EVENT_FROM_START = 0x00000008,
}

alias NS_MODE_CHANGE = int;
enum : int
{
    NETSH_COMMIT       = 0x00000000,
    NETSH_UNCOMMIT     = 0x00000001,
    NETSH_FLUSH        = 0x00000002,
    NETSH_COMMIT_STATE = 0x00000003,
    NETSH_SAVE         = 0x00000004,
}

struct TOKEN_VALUE
{
    const(wchar)* pwszToken;
    uint dwValue;
}
alias PGET_RESOURCE_STRING_FN = uint function(uint, PWSTR, uint);
alias PNS_CONTEXT_COMMIT_FN = uint function(uint);
alias PNS_CONTEXT_CONNECT_FN = uint function(const(wchar)*);
alias PNS_CONTEXT_DUMP_FN = uint function(const(wchar)*, PWSTR*, uint, const(void)*);
alias PNS_DLL_STOP_FN = uint function(uint);
alias PNS_HELPER_START_FN = uint function(const(GUID)*, uint);
alias PNS_HELPER_STOP_FN = uint function(uint);
alias PFN_HANDLE_CMD = uint function(const(wchar)*, PWSTR*, uint, uint, uint, const(void)*, BOOL*);
alias PNS_OSVERSIONCHECK = BOOL function(uint, uint, const(wchar)*, const(wchar)*, const(wchar)*, const(wchar)*, uint, uint);
struct NS_HELPER_ATTRIBUTES
{
    union
    {
        struct
        {
            uint dwVersion;
            uint dwReserved;
        }
        ulong _ullAlign;
    }
    GUID guidHelper;
    PNS_HELPER_START_FN pfnStart;
    PNS_HELPER_STOP_FN pfnStop;
}
struct CMD_ENTRY
{
    const(wchar)* pwszCmdToken;
    PFN_HANDLE_CMD pfnCmdHandler;
    uint dwShortCmdHelpToken;
    uint dwCmdHlpToken;
    uint dwFlags;
    PNS_OSVERSIONCHECK pOsVersionCheck;
}
struct CMD_GROUP_ENTRY
{
    const(wchar)* pwszCmdGroupToken;
    uint dwShortCmdHelpToken;
    uint ulCmdGroupSize;
    uint dwFlags;
    CMD_ENTRY* pCmdGroup;
    PNS_OSVERSIONCHECK pOsVersionCheck;
}
struct NS_CONTEXT_ATTRIBUTES
{
    union
    {
        struct
        {
            uint dwVersion;
            uint dwReserved;
        }
        ulong _ullAlign;
    }
    PWSTR pwszContext;
    GUID guidHelper;
    uint dwFlags;
    uint ulPriority;
    uint ulNumTopCmds;
    CMD_ENTRY* pTopCmds;
    uint ulNumGroups;
    CMD_GROUP_ENTRY* pCmdGroups;
    PNS_CONTEXT_COMMIT_FN pfnCommitFn;
    PNS_CONTEXT_DUMP_FN pfnDumpFn;
    PNS_CONTEXT_CONNECT_FN pfnConnectFn;
    void* pReserved;
    PNS_OSVERSIONCHECK pfnOsVersionCheck;
}
struct TAG_TYPE
{
    const(wchar)* pwszTag;
    uint dwRequired;
    BOOL bPresent;
}
alias PNS_DLL_INIT_FN = uint function(uint, void*);
