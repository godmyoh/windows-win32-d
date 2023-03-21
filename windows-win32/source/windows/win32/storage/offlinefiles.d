module windows.win32.storage.offlinefiles;

import windows.win32.guid : GUID;
import windows.win32.foundation : BOOL, FILETIME, HRESULT, HWND, PWSTR;
import windows.win32.system.com_ : BYTE_BLOB, IUnknown, VARIANT;

version (Windows):
extern (Windows):

uint OfflineFilesEnable(BOOL, BOOL*);
uint OfflineFilesStart();
uint OfflineFilesQueryStatus(BOOL*, BOOL*);
uint OfflineFilesQueryStatusEx(BOOL*, BOOL*, BOOL*);
enum OFFLINEFILES_SYNC_STATE_LOCAL_KNOWN = 0x00000001;
enum OFFLINEFILES_SYNC_STATE_REMOTE_KNOWN = 0x00000002;
enum OFFLINEFILES_CHANGES_NONE = 0x00000000;
enum OFFLINEFILES_CHANGES_LOCAL_SIZE = 0x00000001;
enum OFFLINEFILES_CHANGES_LOCAL_ATTRIBUTES = 0x00000002;
enum OFFLINEFILES_CHANGES_LOCAL_TIME = 0x00000004;
enum OFFLINEFILES_CHANGES_REMOTE_SIZE = 0x00000008;
enum OFFLINEFILES_CHANGES_REMOTE_ATTRIBUTES = 0x00000010;
enum OFFLINEFILES_CHANGES_REMOTE_TIME = 0x00000020;
enum OFFLINEFILES_ITEM_FILTER_FLAG_MODIFIED_DATA = 0x00000001;
enum OFFLINEFILES_ITEM_FILTER_FLAG_MODIFIED_ATTRIBUTES = 0x00000002;
enum OFFLINEFILES_ITEM_FILTER_FLAG_MODIFIED = 0x00000004;
enum OFFLINEFILES_ITEM_FILTER_FLAG_CREATED = 0x00000008;
enum OFFLINEFILES_ITEM_FILTER_FLAG_DELETED = 0x00000010;
enum OFFLINEFILES_ITEM_FILTER_FLAG_DIRTY = 0x00000020;
enum OFFLINEFILES_ITEM_FILTER_FLAG_SPARSE = 0x00000040;
enum OFFLINEFILES_ITEM_FILTER_FLAG_FILE = 0x00000080;
enum OFFLINEFILES_ITEM_FILTER_FLAG_DIRECTORY = 0x00000100;
enum OFFLINEFILES_ITEM_FILTER_FLAG_PINNED_USER = 0x00000200;
enum OFFLINEFILES_ITEM_FILTER_FLAG_PINNED_OTHERS = 0x00000400;
enum OFFLINEFILES_ITEM_FILTER_FLAG_PINNED_COMPUTER = 0x00000800;
enum OFFLINEFILES_ITEM_FILTER_FLAG_PINNED = 0x00001000;
enum OFFLINEFILES_ITEM_FILTER_FLAG_GHOST = 0x00002000;
enum OFFLINEFILES_ITEM_FILTER_FLAG_SUSPENDED = 0x00004000;
enum OFFLINEFILES_ITEM_FILTER_FLAG_OFFLINE = 0x00008000;
enum OFFLINEFILES_ITEM_FILTER_FLAG_ONLINE = 0x00010000;
enum OFFLINEFILES_ITEM_FILTER_FLAG_USER_WRITE = 0x00020000;
enum OFFLINEFILES_ITEM_FILTER_FLAG_USER_READ = 0x00040000;
enum OFFLINEFILES_ITEM_FILTER_FLAG_USER_ANYACCESS = 0x00080000;
enum OFFLINEFILES_ITEM_FILTER_FLAG_OTHER_WRITE = 0x00100000;
enum OFFLINEFILES_ITEM_FILTER_FLAG_OTHER_READ = 0x00200000;
enum OFFLINEFILES_ITEM_FILTER_FLAG_OTHER_ANYACCESS = 0x00400000;
enum OFFLINEFILES_ITEM_FILTER_FLAG_GUEST_WRITE = 0x00800000;
enum OFFLINEFILES_ITEM_FILTER_FLAG_GUEST_READ = 0x01000000;
enum OFFLINEFILES_ITEM_FILTER_FLAG_GUEST_ANYACCESS = 0x02000000;
enum OFFLINEFILES_ITEM_QUERY_REMOTEINFO = 0x00000001;
enum OFFLINEFILES_ITEM_QUERY_CONNECTIONSTATE = 0x00000002;
enum OFFLINEFILES_ITEM_QUERY_LOCALDIRTYBYTECOUNT = 0x00000004;
enum OFFLINEFILES_ITEM_QUERY_REMOTEDIRTYBYTECOUNT = 0x00000008;
enum OFFLINEFILES_ITEM_QUERY_INCLUDETRANSPARENTCACHE = 0x00000010;
enum OFFLINEFILES_ITEM_QUERY_ATTEMPT_TRANSITIONONLINE = 0x00000020;
enum OFFLINEFILES_ITEM_QUERY_ADMIN = 0x80000000;
enum OFFLINEFILES_ENUM_FLAT = 0x00000001;
enum OFFLINEFILES_ENUM_FLAT_FILESONLY = 0x00000002;
enum OFFLINEFILES_SETTING_SCOPE_USER = 0x00000001;
enum OFFLINEFILES_SETTING_SCOPE_COMPUTER = 0x00000002;
enum OFFLINEFILES_SETTING_PinLinkTargets = "LinkTargetCaching";
enum OFFLINEFILES_PINLINKTARGETS_NEVER = 0x00000000;
enum OFFLINEFILES_PINLINKTARGETS_EXPLICIT = 0x00000001;
enum OFFLINEFILES_PINLINKTARGETS_ALWAYS = 0x00000002;
enum OFFLINEFILES_SYNC_CONTROL_FLAG_FILLSPARSE = 0x00000001;
enum OFFLINEFILES_SYNC_CONTROL_FLAG_SYNCIN = 0x00000002;
enum OFFLINEFILES_SYNC_CONTROL_FLAG_SYNCOUT = 0x00000004;
enum OFFLINEFILES_SYNC_CONTROL_FLAG_PINNEWFILES = 0x00000008;
enum OFFLINEFILES_SYNC_CONTROL_FLAG_PINLINKTARGETS = 0x00000010;
enum OFFLINEFILES_SYNC_CONTROL_FLAG_PINFORUSER = 0x00000020;
enum OFFLINEFILES_SYNC_CONTROL_FLAG_PINFORUSER_POLICY = 0x00000040;
enum OFFLINEFILES_SYNC_CONTROL_FLAG_PINFORALL = 0x00000080;
enum OFFLINEFILES_SYNC_CONTROL_FLAG_PINFORREDIR = 0x00000100;
enum OFFLINEFILES_SYNC_CONTROL_FLAG_LOWPRIORITY = 0x00000200;
enum OFFLINEFILES_SYNC_CONTROL_FLAG_ASYNCPROGRESS = 0x00000400;
enum OFFLINEFILES_SYNC_CONTROL_FLAG_INTERACTIVE = 0x00000800;
enum OFFLINEFILES_SYNC_CONTROL_FLAG_CONSOLE = 0x00001000;
enum OFFLINEFILES_SYNC_CONTROL_FLAG_SKIPSUSPENDEDDIRS = 0x00002000;
enum OFFLINEFILES_SYNC_CONTROL_FLAG_BACKGROUND = 0x00010000;
enum OFFLINEFILES_SYNC_CONTROL_FLAG_NONEWFILESOUT = 0x00020000;
enum OFFLINEFILES_SYNC_CONTROL_CR_MASK = 0xf0000000;
enum OFFLINEFILES_SYNC_CONTROL_CR_DEFAULT = 0x00000000;
enum OFFLINEFILES_SYNC_CONTROL_CR_KEEPLOCAL = 0x10000000;
enum OFFLINEFILES_SYNC_CONTROL_CR_KEEPREMOTE = 0x20000000;
enum OFFLINEFILES_SYNC_CONTROL_CR_KEEPLATEST = 0x30000000;
enum OFFLINEFILES_PIN_CONTROL_FLAG_FORUSER = 0x00000020;
enum OFFLINEFILES_PIN_CONTROL_FLAG_FORUSER_POLICY = 0x00000040;
enum OFFLINEFILES_PIN_CONTROL_FLAG_FORALL = 0x00000080;
enum OFFLINEFILES_PIN_CONTROL_FLAG_FORREDIR = 0x00000100;
enum OFFLINEFILES_PIN_CONTROL_FLAG_FILL = 0x00000001;
enum OFFLINEFILES_PIN_CONTROL_FLAG_LOWPRIORITY = 0x00000200;
enum OFFLINEFILES_PIN_CONTROL_FLAG_ASYNCPROGRESS = 0x00000400;
enum OFFLINEFILES_PIN_CONTROL_FLAG_INTERACTIVE = 0x00000800;
enum OFFLINEFILES_PIN_CONTROL_FLAG_CONSOLE = 0x00001000;
enum OFFLINEFILES_PIN_CONTROL_FLAG_PINLINKTARGETS = 0x00000010;
enum OFFLINEFILES_PIN_CONTROL_FLAG_BACKGROUND = 0x00010000;
enum OFFLINEFILES_ENCRYPTION_CONTROL_FLAG_LOWPRIORITY = 0x00000200;
enum OFFLINEFILES_ENCRYPTION_CONTROL_FLAG_ASYNCPROGRESS = 0x00000400;
enum OFFLINEFILES_ENCRYPTION_CONTROL_FLAG_INTERACTIVE = 0x00000800;
enum OFFLINEFILES_ENCRYPTION_CONTROL_FLAG_CONSOLE = 0x00001000;
enum OFFLINEFILES_ENCRYPTION_CONTROL_FLAG_BACKGROUND = 0x00010000;
enum OFFLINEFILES_DELETE_FLAG_NOAUTOCACHED = 0x00000001;
enum OFFLINEFILES_DELETE_FLAG_NOPINNED = 0x00000002;
enum OFFLINEFILES_DELETE_FLAG_DELMODIFIED = 0x00000004;
enum OFFLINEFILES_DELETE_FLAG_ADMIN = 0x80000000;
enum OFFLINEFILES_TRANSITION_FLAG_INTERACTIVE = 0x00000001;
enum OFFLINEFILES_TRANSITION_FLAG_CONSOLE = 0x00000002;
enum OFFLINEFILES_SYNC_ITEM_CHANGE_NONE = 0x00000000;
enum OFFLINEFILES_SYNC_ITEM_CHANGE_CHANGETIME = 0x00000001;
enum OFFLINEFILES_SYNC_ITEM_CHANGE_WRITETIME = 0x00000002;
enum OFFLINEFILES_SYNC_ITEM_CHANGE_FILESIZE = 0x00000004;
enum OFFLINEFILES_SYNC_ITEM_CHANGE_ATTRIBUTES = 0x00000008;
enum CLSID_OfflineFilesSetting = GUID(0xfd3659e9, 0xa920, 0x4123, [0xad, 0x64, 0x7f, 0xc7, 0x6c, 0x7a, 0xac, 0xdf]);
struct OfflineFilesSetting
{
}
enum CLSID_OfflineFilesCache = GUID(0x48c6be7c, 0x3871, 0x43cc, [0xb4, 0x6f, 0x14, 0x49, 0xa1, 0xbb, 0x2f, 0xf3]);
struct OfflineFilesCache
{
}
alias OFFLINEFILES_ITEM_TYPE = int;
enum : int
{
    OFFLINEFILES_ITEM_TYPE_FILE      = 0x00000000,
    OFFLINEFILES_ITEM_TYPE_DIRECTORY = 0x00000001,
    OFFLINEFILES_ITEM_TYPE_SHARE     = 0x00000002,
    OFFLINEFILES_ITEM_TYPE_SERVER    = 0x00000003,
}

alias OFFLINEFILES_ITEM_COPY = int;
enum : int
{
    OFFLINEFILES_ITEM_COPY_LOCAL    = 0x00000000,
    OFFLINEFILES_ITEM_COPY_REMOTE   = 0x00000001,
    OFFLINEFILES_ITEM_COPY_ORIGINAL = 0x00000002,
}

alias OFFLINEFILES_CONNECT_STATE = int;
enum : int
{
    OFFLINEFILES_CONNECT_STATE_UNKNOWN                     = 0x00000000,
    OFFLINEFILES_CONNECT_STATE_OFFLINE                     = 0x00000001,
    OFFLINEFILES_CONNECT_STATE_ONLINE                      = 0x00000002,
    OFFLINEFILES_CONNECT_STATE_TRANSPARENTLY_CACHED        = 0x00000003,
    OFFLINEFILES_CONNECT_STATE_PARTLY_TRANSPARENTLY_CACHED = 0x00000004,
}

alias OFFLINEFILES_OFFLINE_REASON = int;
enum : int
{
    OFFLINEFILES_OFFLINE_REASON_UNKNOWN               = 0x00000000,
    OFFLINEFILES_OFFLINE_REASON_NOT_APPLICABLE        = 0x00000001,
    OFFLINEFILES_OFFLINE_REASON_CONNECTION_FORCED     = 0x00000002,
    OFFLINEFILES_OFFLINE_REASON_CONNECTION_SLOW       = 0x00000003,
    OFFLINEFILES_OFFLINE_REASON_CONNECTION_ERROR      = 0x00000004,
    OFFLINEFILES_OFFLINE_REASON_ITEM_VERSION_CONFLICT = 0x00000005,
    OFFLINEFILES_OFFLINE_REASON_ITEM_SUSPENDED        = 0x00000006,
}

alias OFFLINEFILES_CACHING_MODE = int;
enum : int
{
    OFFLINEFILES_CACHING_MODE_NONE            = 0x00000000,
    OFFLINEFILES_CACHING_MODE_NOCACHING       = 0x00000001,
    OFFLINEFILES_CACHING_MODE_MANUAL          = 0x00000002,
    OFFLINEFILES_CACHING_MODE_AUTO_DOC        = 0x00000003,
    OFFLINEFILES_CACHING_MODE_AUTO_PROGANDDOC = 0x00000004,
}

alias OFFLINEFILES_OP_RESPONSE = int;
enum : int
{
    OFFLINEFILES_OP_CONTINUE = 0x00000000,
    OFFLINEFILES_OP_RETRY    = 0x00000001,
    OFFLINEFILES_OP_ABORT    = 0x00000002,
}

alias OFFLINEFILES_EVENTS = int;
enum : int
{
    OFFLINEFILES_EVENT_CACHEMOVED                 = 0x00000000,
    OFFLINEFILES_EVENT_CACHEISFULL                = 0x00000001,
    OFFLINEFILES_EVENT_CACHEISCORRUPTED           = 0x00000002,
    OFFLINEFILES_EVENT_ENABLED                    = 0x00000003,
    OFFLINEFILES_EVENT_ENCRYPTIONCHANGED          = 0x00000004,
    OFFLINEFILES_EVENT_SYNCBEGIN                  = 0x00000005,
    OFFLINEFILES_EVENT_SYNCFILERESULT             = 0x00000006,
    OFFLINEFILES_EVENT_SYNCCONFLICTRECADDED       = 0x00000007,
    OFFLINEFILES_EVENT_SYNCCONFLICTRECUPDATED     = 0x00000008,
    OFFLINEFILES_EVENT_SYNCCONFLICTRECREMOVED     = 0x00000009,
    OFFLINEFILES_EVENT_SYNCEND                    = 0x0000000a,
    OFFLINEFILES_EVENT_BACKGROUNDSYNCBEGIN        = 0x0000000b,
    OFFLINEFILES_EVENT_BACKGROUNDSYNCEND          = 0x0000000c,
    OFFLINEFILES_EVENT_NETTRANSPORTARRIVED        = 0x0000000d,
    OFFLINEFILES_EVENT_NONETTRANSPORTS            = 0x0000000e,
    OFFLINEFILES_EVENT_ITEMDISCONNECTED           = 0x0000000f,
    OFFLINEFILES_EVENT_ITEMRECONNECTED            = 0x00000010,
    OFFLINEFILES_EVENT_ITEMAVAILABLEOFFLINE       = 0x00000011,
    OFFLINEFILES_EVENT_ITEMNOTAVAILABLEOFFLINE    = 0x00000012,
    OFFLINEFILES_EVENT_ITEMPINNED                 = 0x00000013,
    OFFLINEFILES_EVENT_ITEMNOTPINNED              = 0x00000014,
    OFFLINEFILES_EVENT_ITEMMODIFIED               = 0x00000015,
    OFFLINEFILES_EVENT_ITEMADDEDTOCACHE           = 0x00000016,
    OFFLINEFILES_EVENT_ITEMDELETEDFROMCACHE       = 0x00000017,
    OFFLINEFILES_EVENT_ITEMRENAMED                = 0x00000018,
    OFFLINEFILES_EVENT_DATALOST                   = 0x00000019,
    OFFLINEFILES_EVENT_PING                       = 0x0000001a,
    OFFLINEFILES_EVENT_ITEMRECONNECTBEGIN         = 0x0000001b,
    OFFLINEFILES_EVENT_ITEMRECONNECTEND           = 0x0000001c,
    OFFLINEFILES_EVENT_CACHEEVICTBEGIN            = 0x0000001d,
    OFFLINEFILES_EVENT_CACHEEVICTEND              = 0x0000001e,
    OFFLINEFILES_EVENT_POLICYCHANGEDETECTED       = 0x0000001f,
    OFFLINEFILES_EVENT_PREFERENCECHANGEDETECTED   = 0x00000020,
    OFFLINEFILES_EVENT_SETTINGSCHANGESAPPLIED     = 0x00000021,
    OFFLINEFILES_EVENT_TRANSPARENTCACHEITEMNOTIFY = 0x00000022,
    OFFLINEFILES_EVENT_PREFETCHFILEBEGIN          = 0x00000023,
    OFFLINEFILES_EVENT_PREFETCHFILEEND            = 0x00000024,
    OFFLINEFILES_EVENT_PREFETCHCLOSEHANDLEBEGIN   = 0x00000025,
    OFFLINEFILES_EVENT_PREFETCHCLOSEHANDLEEND     = 0x00000026,
    OFFLINEFILES_NUM_EVENTS                       = 0x00000027,
}

alias OFFLINEFILES_PATHFILTER_MATCH = int;
enum : int
{
    OFFLINEFILES_PATHFILTER_SELF             = 0x00000000,
    OFFLINEFILES_PATHFILTER_CHILD            = 0x00000001,
    OFFLINEFILES_PATHFILTER_DESCENDENT       = 0x00000002,
    OFFLINEFILES_PATHFILTER_SELFORCHILD      = 0x00000003,
    OFFLINEFILES_PATHFILTER_SELFORDESCENDENT = 0x00000004,
}

alias OFFLINEFILES_SYNC_CONFLICT_RESOLVE = int;
enum : int
{
    OFFLINEFILES_SYNC_CONFLICT_RESOLVE_NONE           = 0x00000000,
    OFFLINEFILES_SYNC_CONFLICT_RESOLVE_KEEPLOCAL      = 0x00000001,
    OFFLINEFILES_SYNC_CONFLICT_RESOLVE_KEEPREMOTE     = 0x00000002,
    OFFLINEFILES_SYNC_CONFLICT_RESOLVE_KEEPALLCHANGES = 0x00000003,
    OFFLINEFILES_SYNC_CONFLICT_RESOLVE_KEEPLATEST     = 0x00000004,
    OFFLINEFILES_SYNC_CONFLICT_RESOLVE_LOG            = 0x00000005,
    OFFLINEFILES_SYNC_CONFLICT_RESOLVE_SKIP           = 0x00000006,
    OFFLINEFILES_SYNC_CONFLICT_ABORT                  = 0x00000007,
    OFFLINEFILES_SYNC_CONFLICT_RESOLVE_NUMCODES       = 0x00000008,
}

alias OFFLINEFILES_ITEM_TIME = int;
enum : int
{
    OFFLINEFILES_ITEM_TIME_CREATION   = 0x00000000,
    OFFLINEFILES_ITEM_TIME_LASTACCESS = 0x00000001,
    OFFLINEFILES_ITEM_TIME_LASTWRITE  = 0x00000002,
}

alias OFFLINEFILES_COMPARE = int;
enum : int
{
    OFFLINEFILES_COMPARE_EQ  = 0x00000000,
    OFFLINEFILES_COMPARE_NEQ = 0x00000001,
    OFFLINEFILES_COMPARE_LT  = 0x00000002,
    OFFLINEFILES_COMPARE_GT  = 0x00000003,
    OFFLINEFILES_COMPARE_LTE = 0x00000004,
    OFFLINEFILES_COMPARE_GTE = 0x00000005,
}

alias OFFLINEFILES_SETTING_VALUE_TYPE = int;
enum : int
{
    OFFLINEFILES_SETTING_VALUE_UI4                  = 0x00000000,
    OFFLINEFILES_SETTING_VALUE_BSTR                 = 0x00000001,
    OFFLINEFILES_SETTING_VALUE_BSTR_DBLNULTERM      = 0x00000002,
    OFFLINEFILES_SETTING_VALUE_2DIM_ARRAY_BSTR_UI4  = 0x00000003,
    OFFLINEFILES_SETTING_VALUE_2DIM_ARRAY_BSTR_BSTR = 0x00000004,
}

alias OFFLINEFILES_SYNC_OPERATION = int;
enum : int
{
    OFFLINEFILES_SYNC_OPERATION_CREATE_COPY_ON_SERVER = 0x00000000,
    OFFLINEFILES_SYNC_OPERATION_CREATE_COPY_ON_CLIENT = 0x00000001,
    OFFLINEFILES_SYNC_OPERATION_SYNC_TO_SERVER        = 0x00000002,
    OFFLINEFILES_SYNC_OPERATION_SYNC_TO_CLIENT        = 0x00000003,
    OFFLINEFILES_SYNC_OPERATION_DELETE_SERVER_COPY    = 0x00000004,
    OFFLINEFILES_SYNC_OPERATION_DELETE_CLIENT_COPY    = 0x00000005,
    OFFLINEFILES_SYNC_OPERATION_PIN                   = 0x00000006,
    OFFLINEFILES_SYNC_OPERATION_PREPARE               = 0x00000007,
}

alias OFFLINEFILES_SYNC_STATE = int;
enum : int
{
    OFFLINEFILES_SYNC_STATE_Stable                                             = 0x00000000,
    OFFLINEFILES_SYNC_STATE_FileOnClient_DirOnServer                           = 0x00000001,
    OFFLINEFILES_SYNC_STATE_FileOnClient_NoServerCopy                          = 0x00000002,
    OFFLINEFILES_SYNC_STATE_DirOnClient_FileOnServer                           = 0x00000003,
    OFFLINEFILES_SYNC_STATE_DirOnClient_FileChangedOnServer                    = 0x00000004,
    OFFLINEFILES_SYNC_STATE_DirOnClient_NoServerCopy                           = 0x00000005,
    OFFLINEFILES_SYNC_STATE_FileCreatedOnClient_NoServerCopy                   = 0x00000006,
    OFFLINEFILES_SYNC_STATE_FileCreatedOnClient_FileChangedOnServer            = 0x00000007,
    OFFLINEFILES_SYNC_STATE_FileCreatedOnClient_DirChangedOnServer             = 0x00000008,
    OFFLINEFILES_SYNC_STATE_FileCreatedOnClient_FileOnServer                   = 0x00000009,
    OFFLINEFILES_SYNC_STATE_FileCreatedOnClient_DirOnServer                    = 0x0000000a,
    OFFLINEFILES_SYNC_STATE_FileCreatedOnClient_DeletedOnServer                = 0x0000000b,
    OFFLINEFILES_SYNC_STATE_FileChangedOnClient_ChangedOnServer                = 0x0000000c,
    OFFLINEFILES_SYNC_STATE_FileChangedOnClient_DirOnServer                    = 0x0000000d,
    OFFLINEFILES_SYNC_STATE_FileChangedOnClient_DirChangedOnServer             = 0x0000000e,
    OFFLINEFILES_SYNC_STATE_FileChangedOnClient_DeletedOnServer                = 0x0000000f,
    OFFLINEFILES_SYNC_STATE_FileSparseOnClient_ChangedOnServer                 = 0x00000010,
    OFFLINEFILES_SYNC_STATE_FileSparseOnClient_DeletedOnServer                 = 0x00000011,
    OFFLINEFILES_SYNC_STATE_FileSparseOnClient_DirOnServer                     = 0x00000012,
    OFFLINEFILES_SYNC_STATE_FileSparseOnClient_DirChangedOnServer              = 0x00000013,
    OFFLINEFILES_SYNC_STATE_DirCreatedOnClient_NoServerCopy                    = 0x00000014,
    OFFLINEFILES_SYNC_STATE_DirCreatedOnClient_DirOnServer                     = 0x00000015,
    OFFLINEFILES_SYNC_STATE_DirCreatedOnClient_FileOnServer                    = 0x00000016,
    OFFLINEFILES_SYNC_STATE_DirCreatedOnClient_FileChangedOnServer             = 0x00000017,
    OFFLINEFILES_SYNC_STATE_DirCreatedOnClient_DirChangedOnServer              = 0x00000018,
    OFFLINEFILES_SYNC_STATE_DirCreatedOnClient_DeletedOnServer                 = 0x00000019,
    OFFLINEFILES_SYNC_STATE_DirChangedOnClient_FileOnServer                    = 0x0000001a,
    OFFLINEFILES_SYNC_STATE_DirChangedOnClient_FileChangedOnServer             = 0x0000001b,
    OFFLINEFILES_SYNC_STATE_DirChangedOnClient_ChangedOnServer                 = 0x0000001c,
    OFFLINEFILES_SYNC_STATE_DirChangedOnClient_DeletedOnServer                 = 0x0000001d,
    OFFLINEFILES_SYNC_STATE_NoClientCopy_FileOnServer                          = 0x0000001e,
    OFFLINEFILES_SYNC_STATE_NoClientCopy_DirOnServer                           = 0x0000001f,
    OFFLINEFILES_SYNC_STATE_NoClientCopy_FileChangedOnServer                   = 0x00000020,
    OFFLINEFILES_SYNC_STATE_NoClientCopy_DirChangedOnServer                    = 0x00000021,
    OFFLINEFILES_SYNC_STATE_DeletedOnClient_FileOnServer                       = 0x00000022,
    OFFLINEFILES_SYNC_STATE_DeletedOnClient_DirOnServer                        = 0x00000023,
    OFFLINEFILES_SYNC_STATE_DeletedOnClient_FileChangedOnServer                = 0x00000024,
    OFFLINEFILES_SYNC_STATE_DeletedOnClient_DirChangedOnServer                 = 0x00000025,
    OFFLINEFILES_SYNC_STATE_FileSparseOnClient                                 = 0x00000026,
    OFFLINEFILES_SYNC_STATE_FileChangedOnClient                                = 0x00000027,
    OFFLINEFILES_SYNC_STATE_FileRenamedOnClient                                = 0x00000028,
    OFFLINEFILES_SYNC_STATE_DirSparseOnClient                                  = 0x00000029,
    OFFLINEFILES_SYNC_STATE_DirChangedOnClient                                 = 0x0000002a,
    OFFLINEFILES_SYNC_STATE_DirRenamedOnClient                                 = 0x0000002b,
    OFFLINEFILES_SYNC_STATE_FileChangedOnServer                                = 0x0000002c,
    OFFLINEFILES_SYNC_STATE_FileRenamedOnServer                                = 0x0000002d,
    OFFLINEFILES_SYNC_STATE_FileDeletedOnServer                                = 0x0000002e,
    OFFLINEFILES_SYNC_STATE_DirChangedOnServer                                 = 0x0000002f,
    OFFLINEFILES_SYNC_STATE_DirRenamedOnServer                                 = 0x00000030,
    OFFLINEFILES_SYNC_STATE_DirDeletedOnServer                                 = 0x00000031,
    OFFLINEFILES_SYNC_STATE_FileReplacedAndDeletedOnClient_FileOnServer        = 0x00000032,
    OFFLINEFILES_SYNC_STATE_FileReplacedAndDeletedOnClient_FileChangedOnServer = 0x00000033,
    OFFLINEFILES_SYNC_STATE_FileReplacedAndDeletedOnClient_DirOnServer         = 0x00000034,
    OFFLINEFILES_SYNC_STATE_FileReplacedAndDeletedOnClient_DirChangedOnServer  = 0x00000035,
    OFFLINEFILES_SYNC_STATE_NUMSTATES                                          = 0x00000036,
}

enum IID_IOfflineFilesEvents = GUID(0xe25585c1, 0xcaa, 0x4eb1, [0x87, 0x3b, 0x1c, 0xae, 0x5b, 0x77, 0xc3, 0x14]);
interface IOfflineFilesEvents : IUnknown
{
    HRESULT CacheMoved(const(wchar)*, const(wchar)*);
    HRESULT CacheIsFull();
    HRESULT CacheIsCorrupted();
    HRESULT Enabled(BOOL);
    HRESULT EncryptionChanged(BOOL, BOOL, BOOL, BOOL);
    HRESULT SyncBegin(const(GUID)*);
    HRESULT SyncFileResult(const(GUID)*, const(wchar)*, HRESULT);
    HRESULT SyncConflictRecAdded(const(wchar)*, const(FILETIME)*, OFFLINEFILES_SYNC_STATE);
    HRESULT SyncConflictRecUpdated(const(wchar)*, const(FILETIME)*, OFFLINEFILES_SYNC_STATE);
    HRESULT SyncConflictRecRemoved(const(wchar)*, const(FILETIME)*, OFFLINEFILES_SYNC_STATE);
    HRESULT SyncEnd(const(GUID)*, HRESULT);
    HRESULT NetTransportArrived();
    HRESULT NoNetTransports();
    HRESULT ItemDisconnected(const(wchar)*, OFFLINEFILES_ITEM_TYPE);
    HRESULT ItemReconnected(const(wchar)*, OFFLINEFILES_ITEM_TYPE);
    HRESULT ItemAvailableOffline(const(wchar)*, OFFLINEFILES_ITEM_TYPE);
    HRESULT ItemNotAvailableOffline(const(wchar)*, OFFLINEFILES_ITEM_TYPE);
    HRESULT ItemPinned(const(wchar)*, OFFLINEFILES_ITEM_TYPE);
    HRESULT ItemNotPinned(const(wchar)*, OFFLINEFILES_ITEM_TYPE);
    HRESULT ItemModified(const(wchar)*, OFFLINEFILES_ITEM_TYPE, BOOL, BOOL);
    HRESULT ItemAddedToCache(const(wchar)*, OFFLINEFILES_ITEM_TYPE);
    HRESULT ItemDeletedFromCache(const(wchar)*, OFFLINEFILES_ITEM_TYPE);
    HRESULT ItemRenamed(const(wchar)*, const(wchar)*, OFFLINEFILES_ITEM_TYPE);
    HRESULT DataLost();
    HRESULT Ping();
}
enum IID_IOfflineFilesEvents2 = GUID(0x1ead8f56, 0xff76, 0x4faa, [0xa7, 0x95, 0x6f, 0x6e, 0xf7, 0x92, 0x49, 0x8b]);
interface IOfflineFilesEvents2 : IOfflineFilesEvents
{
    HRESULT ItemReconnectBegin();
    HRESULT ItemReconnectEnd();
    HRESULT CacheEvictBegin();
    HRESULT CacheEvictEnd();
    HRESULT BackgroundSyncBegin(uint);
    HRESULT BackgroundSyncEnd(uint);
    HRESULT PolicyChangeDetected();
    HRESULT PreferenceChangeDetected();
    HRESULT SettingsChangesApplied();
}
enum IID_IOfflineFilesEvents3 = GUID(0x9ba04a45, 0xee69, 0x42f0, [0x9a, 0xb1, 0x7d, 0xb5, 0xc8, 0x80, 0x58, 0x8]);
interface IOfflineFilesEvents3 : IOfflineFilesEvents2
{
    HRESULT TransparentCacheItemNotify(const(wchar)*, OFFLINEFILES_EVENTS, OFFLINEFILES_ITEM_TYPE, BOOL, BOOL, const(wchar)*);
    HRESULT PrefetchFileBegin(const(wchar)*);
    HRESULT PrefetchFileEnd(const(wchar)*, HRESULT);
}
enum IID_IOfflineFilesEvents4 = GUID(0xdbd69b1e, 0xc7d2, 0x473e, [0xb3, 0x5f, 0x9d, 0x8c, 0x24, 0xc0, 0xc4, 0x84]);
interface IOfflineFilesEvents4 : IOfflineFilesEvents3
{
    HRESULT PrefetchCloseHandleBegin();
    HRESULT PrefetchCloseHandleEnd(uint, uint, HRESULT);
}
enum IID_IOfflineFilesEventsFilter = GUID(0x33fc4e1b, 0x716, 0x40fa, [0xba, 0x65, 0x6e, 0x62, 0xa8, 0x4a, 0x84, 0x6f]);
interface IOfflineFilesEventsFilter : IUnknown
{
    HRESULT GetPathFilter(PWSTR*, OFFLINEFILES_PATHFILTER_MATCH*);
    HRESULT GetIncludedEvents(uint, OFFLINEFILES_EVENTS*, uint*);
    HRESULT GetExcludedEvents(uint, OFFLINEFILES_EVENTS*, uint*);
}
enum IID_IOfflineFilesErrorInfo = GUID(0x7112fa5f, 0x7571, 0x435a, [0x8e, 0xb7, 0x19, 0x5c, 0x7c, 0x14, 0x29, 0xbc]);
interface IOfflineFilesErrorInfo : IUnknown
{
    HRESULT GetRawData(BYTE_BLOB**);
    HRESULT GetDescription(PWSTR*);
}
enum IID_IOfflineFilesSyncErrorItemInfo = GUID(0xecdbaf0d, 0x6a18, 0x4d55, [0x80, 0x17, 0x10, 0x8f, 0x76, 0x60, 0xba, 0x44]);
interface IOfflineFilesSyncErrorItemInfo : IUnknown
{
    HRESULT GetFileAttributes(uint*);
    HRESULT GetFileTimes(FILETIME*, FILETIME*);
    HRESULT GetFileSize(long*);
}
enum IID_IOfflineFilesSyncErrorInfo = GUID(0x59f95e46, 0xeb54, 0x49d1, [0xbe, 0x76, 0xde, 0x95, 0x45, 0x8d, 0x1, 0xb0]);
interface IOfflineFilesSyncErrorInfo : IOfflineFilesErrorInfo
{
    HRESULT GetSyncOperation(OFFLINEFILES_SYNC_OPERATION*);
    HRESULT GetItemChangeFlags(uint*);
    HRESULT InfoEnumerated(BOOL*, BOOL*, BOOL*);
    HRESULT InfoAvailable(BOOL*, BOOL*, BOOL*);
    HRESULT GetLocalInfo(IOfflineFilesSyncErrorItemInfo*);
    HRESULT GetRemoteInfo(IOfflineFilesSyncErrorItemInfo*);
    HRESULT GetOriginalInfo(IOfflineFilesSyncErrorItemInfo*);
}
enum IID_IOfflineFilesProgress = GUID(0xfad63237, 0xc55b, 0x4911, [0x98, 0x50, 0xbc, 0xf9, 0x6d, 0x4c, 0x97, 0x9e]);
interface IOfflineFilesProgress : IUnknown
{
    HRESULT Begin(BOOL*);
    HRESULT QueryAbort(BOOL*);
    HRESULT End(HRESULT);
}
enum IID_IOfflineFilesSimpleProgress = GUID(0xc34f7f9b, 0xc43d, 0x4f9d, [0xa7, 0x76, 0xc0, 0xeb, 0x6d, 0xe5, 0xd4, 0x1]);
interface IOfflineFilesSimpleProgress : IOfflineFilesProgress
{
    HRESULT ItemBegin(const(wchar)*, OFFLINEFILES_OP_RESPONSE*);
    HRESULT ItemResult(const(wchar)*, HRESULT, OFFLINEFILES_OP_RESPONSE*);
}
enum IID_IOfflineFilesSyncProgress = GUID(0x6931f49a, 0x6fc7, 0x4c1b, [0xb2, 0x65, 0x56, 0x79, 0x3f, 0xc4, 0x51, 0xb7]);
interface IOfflineFilesSyncProgress : IOfflineFilesProgress
{
    HRESULT SyncItemBegin(const(wchar)*, OFFLINEFILES_OP_RESPONSE*);
    HRESULT SyncItemResult(const(wchar)*, HRESULT, IOfflineFilesSyncErrorInfo, OFFLINEFILES_OP_RESPONSE*);
}
enum IID_IOfflineFilesSyncConflictHandler = GUID(0xb6dd5092, 0xc65c, 0x46b6, [0x97, 0xb8, 0xfa, 0xdd, 0x8, 0xe7, 0xe1, 0xbe]);
interface IOfflineFilesSyncConflictHandler : IUnknown
{
    HRESULT ResolveConflict(const(wchar)*, uint, OFFLINEFILES_SYNC_STATE, uint, OFFLINEFILES_SYNC_CONFLICT_RESOLVE*, PWSTR*);
}
enum IID_IOfflineFilesItemFilter = GUID(0xf4b5a26c, 0xdc05, 0x4f20, [0xad, 0xa4, 0x55, 0x1f, 0x10, 0x77, 0xbe, 0x5c]);
interface IOfflineFilesItemFilter : IUnknown
{
    HRESULT GetFilterFlags(ulong*, ulong*);
    HRESULT GetTimeFilter(FILETIME*, BOOL*, OFFLINEFILES_ITEM_TIME*, OFFLINEFILES_COMPARE*);
    HRESULT GetPatternFilter(PWSTR, uint);
}
enum IID_IOfflineFilesItem = GUID(0x4a753da6, 0xe044, 0x4f12, [0xa7, 0x18, 0x5d, 0x14, 0xd0, 0x79, 0xa9, 0x6]);
interface IOfflineFilesItem : IUnknown
{
    HRESULT GetItemType(OFFLINEFILES_ITEM_TYPE*);
    HRESULT GetPath(PWSTR*);
    HRESULT GetParentItem(IOfflineFilesItem*);
    HRESULT Refresh(uint);
    HRESULT IsMarkedForDeletion(BOOL*);
}
enum IID_IOfflineFilesServerItem = GUID(0x9b1c9576, 0xa92b, 0x4151, [0x8e, 0x9e, 0x7c, 0x7b, 0x3e, 0xc2, 0xe0, 0x16]);
interface IOfflineFilesServerItem : IOfflineFilesItem
{
}
enum IID_IOfflineFilesShareItem = GUID(0xbab7e48d, 0x4804, 0x41b5, [0xa4, 0x4d, 0xf, 0x19, 0x9b, 0x6, 0xb1, 0x45]);
interface IOfflineFilesShareItem : IOfflineFilesItem
{
}
enum IID_IOfflineFilesDirectoryItem = GUID(0x2273597a, 0xa08c, 0x4a00, [0xa3, 0x7a, 0xc1, 0xae, 0x4e, 0x9a, 0x1c, 0xfd]);
interface IOfflineFilesDirectoryItem : IOfflineFilesItem
{
}
enum IID_IOfflineFilesFileItem = GUID(0x8dfadead, 0x26c2, 0x4eff, [0x8a, 0x72, 0x6b, 0x50, 0x72, 0x3d, 0x9a, 0x0]);
interface IOfflineFilesFileItem : IOfflineFilesItem
{
    HRESULT IsSparse(BOOL*);
    HRESULT IsEncrypted(BOOL*);
}
enum IID_IEnumOfflineFilesItems = GUID(0xda70e815, 0xc361, 0x4407, [0xbc, 0xb, 0xd, 0x70, 0x46, 0xe5, 0xf2, 0xcd]);
interface IEnumOfflineFilesItems : IUnknown
{
    HRESULT Next(uint, IOfflineFilesItem*, uint*);
    HRESULT Skip(uint);
    HRESULT Reset();
    HRESULT Clone(IEnumOfflineFilesItems*);
}
enum IID_IOfflineFilesItemContainer = GUID(0x3836f049, 0x9413, 0x45dd, [0xbf, 0x46, 0xb5, 0xaa, 0xa8, 0x2d, 0xc3, 0x10]);
interface IOfflineFilesItemContainer : IUnknown
{
    HRESULT EnumItems(uint, IEnumOfflineFilesItems*);
    HRESULT EnumItemsEx(IOfflineFilesItemFilter, IOfflineFilesItemFilter, IOfflineFilesItemFilter, IOfflineFilesItemFilter, uint, uint, IEnumOfflineFilesItems*);
}
enum IID_IOfflineFilesChangeInfo = GUID(0xa96e6fa4, 0xe0d1, 0x4c29, [0x96, 0xb, 0xee, 0x50, 0x8f, 0xe6, 0x8c, 0x72]);
interface IOfflineFilesChangeInfo : IUnknown
{
    HRESULT IsDirty(BOOL*);
    HRESULT IsDeletedOffline(BOOL*);
    HRESULT IsCreatedOffline(BOOL*);
    HRESULT IsLocallyModifiedData(BOOL*);
    HRESULT IsLocallyModifiedAttributes(BOOL*);
    HRESULT IsLocallyModifiedTime(BOOL*);
}
enum IID_IOfflineFilesDirtyInfo = GUID(0xf50ce33, 0xbac9, 0x4eaa, [0xa1, 0x1d, 0xda, 0xe, 0x52, 0x7d, 0x4, 0x7d]);
interface IOfflineFilesDirtyInfo : IUnknown
{
    HRESULT LocalDirtyByteCount(long*);
    HRESULT RemoteDirtyByteCount(long*);
}
enum IID_IOfflineFilesFileSysInfo = GUID(0xbc1a163f, 0x7bfd, 0x4d88, [0x9c, 0x66, 0x96, 0xea, 0x9a, 0x6a, 0x3d, 0x6b]);
interface IOfflineFilesFileSysInfo : IUnknown
{
    HRESULT GetAttributes(OFFLINEFILES_ITEM_COPY, uint*);
    HRESULT GetTimes(OFFLINEFILES_ITEM_COPY, FILETIME*, FILETIME*, FILETIME*, FILETIME*);
    HRESULT GetFileSize(OFFLINEFILES_ITEM_COPY, long*);
}
enum IID_IOfflineFilesPinInfo = GUID(0x5b2b0655, 0xb3fd, 0x497d, [0xad, 0xeb, 0xbd, 0x15, 0x6b, 0xc8, 0x35, 0x5b]);
interface IOfflineFilesPinInfo : IUnknown
{
    HRESULT IsPinned(BOOL*);
    HRESULT IsPinnedForUser(BOOL*, BOOL*);
    HRESULT IsPinnedForUserByPolicy(BOOL*, BOOL*);
    HRESULT IsPinnedForComputer(BOOL*, BOOL*);
    HRESULT IsPinnedForFolderRedirection(BOOL*, BOOL*);
}
enum IID_IOfflineFilesPinInfo2 = GUID(0x623c58a2, 0x42ed, 0x4ad7, [0xb6, 0x9a, 0xf, 0x1b, 0x30, 0xa7, 0x2d, 0xd]);
interface IOfflineFilesPinInfo2 : IOfflineFilesPinInfo
{
    HRESULT IsPartlyPinned(BOOL*);
}
enum IID_IOfflineFilesTransparentCacheInfo = GUID(0xbcaf4a01, 0x5b68, 0x4b56, [0xa6, 0xa1, 0x8d, 0x27, 0x86, 0xed, 0xe8, 0xe3]);
interface IOfflineFilesTransparentCacheInfo : IUnknown
{
    HRESULT IsTransparentlyCached(BOOL*);
}
enum IID_IOfflineFilesGhostInfo = GUID(0x2b09d48c, 0x8ab5, 0x464f, [0xa7, 0x55, 0xa5, 0x9d, 0x92, 0xf9, 0x94, 0x29]);
interface IOfflineFilesGhostInfo : IUnknown
{
    HRESULT IsGhosted(BOOL*);
}
enum IID_IOfflineFilesConnectionInfo = GUID(0xefb23a09, 0xa867, 0x4be8, [0x83, 0xa6, 0x86, 0x96, 0x9a, 0x7d, 0x8, 0x56]);
interface IOfflineFilesConnectionInfo : IUnknown
{
    HRESULT GetConnectState(OFFLINEFILES_CONNECT_STATE*, OFFLINEFILES_OFFLINE_REASON*);
    HRESULT SetConnectState(HWND, uint, OFFLINEFILES_CONNECT_STATE);
    HRESULT TransitionOnline(HWND, uint);
    HRESULT TransitionOffline(HWND, uint, BOOL, BOOL*);
}
enum IID_IOfflineFilesShareInfo = GUID(0x7bcc43e7, 0x31ce, 0x4ca4, [0x8c, 0xcd, 0x1c, 0xff, 0x2d, 0xc4, 0x94, 0xda]);
interface IOfflineFilesShareInfo : IUnknown
{
    HRESULT GetShareItem(IOfflineFilesShareItem*);
    HRESULT GetShareCachingMode(OFFLINEFILES_CACHING_MODE*);
    HRESULT IsShareDfsJunction(BOOL*);
}
enum IID_IOfflineFilesSuspend = GUID(0x62c4560f, 0xbc0b, 0x48ca, [0xad, 0x9d, 0x34, 0xcb, 0x52, 0x8d, 0x99, 0xa9]);
interface IOfflineFilesSuspend : IUnknown
{
    HRESULT SuspendRoot(BOOL);
}
enum IID_IOfflineFilesSuspendInfo = GUID(0xa457c25b, 0x4e9c, 0x4b04, [0x85, 0xaf, 0x89, 0x32, 0xcc, 0xd9, 0x78, 0x89]);
interface IOfflineFilesSuspendInfo : IUnknown
{
    HRESULT IsSuspended(BOOL*, BOOL*);
}
enum IID_IOfflineFilesSetting = GUID(0xd871d3f7, 0xf613, 0x48a1, [0x82, 0x7e, 0x7a, 0x34, 0xe5, 0x60, 0xff, 0xf6]);
interface IOfflineFilesSetting : IUnknown
{
    HRESULT GetName(PWSTR*);
    HRESULT GetValueType(OFFLINEFILES_SETTING_VALUE_TYPE*);
    HRESULT GetPreference(VARIANT*, uint);
    HRESULT GetPreferenceScope(uint*);
    HRESULT SetPreference(const(VARIANT)*, uint);
    HRESULT DeletePreference(uint);
    HRESULT GetPolicy(VARIANT*, uint);
    HRESULT GetPolicyScope(uint*);
    HRESULT GetValue(VARIANT*, BOOL*);
}
enum IID_IEnumOfflineFilesSettings = GUID(0x729680c4, 0x1a38, 0x47bc, [0x9e, 0x5c, 0x2, 0xc5, 0x15, 0x62, 0xac, 0x30]);
interface IEnumOfflineFilesSettings : IUnknown
{
    HRESULT Next(uint, IOfflineFilesSetting*, uint*);
    HRESULT Skip(uint);
    HRESULT Reset();
    HRESULT Clone(IEnumOfflineFilesSettings*);
}
enum IID_IOfflineFilesCache = GUID(0x855d6203, 0x7914, 0x48b9, [0x8d, 0x40, 0x4c, 0x56, 0xf5, 0xac, 0xff, 0xc5]);
interface IOfflineFilesCache : IUnknown
{
    HRESULT Synchronize(HWND, const(wchar)**, uint, BOOL, uint, IOfflineFilesSyncConflictHandler, IOfflineFilesSyncProgress, GUID*);
    HRESULT DeleteItems(const(wchar)**, uint, uint, BOOL, IOfflineFilesSimpleProgress);
    HRESULT DeleteItemsForUser(const(wchar)*, const(wchar)**, uint, uint, BOOL, IOfflineFilesSimpleProgress);
    HRESULT Pin(HWND, const(wchar)**, uint, BOOL, BOOL, uint, IOfflineFilesSyncProgress);
    HRESULT Unpin(HWND, const(wchar)**, uint, BOOL, BOOL, uint, IOfflineFilesSyncProgress);
    HRESULT GetEncryptionStatus(BOOL*, BOOL*);
    HRESULT Encrypt(HWND, BOOL, uint, BOOL, IOfflineFilesSyncProgress);
    HRESULT FindItem(const(wchar)*, uint, IOfflineFilesItem*);
    HRESULT FindItemEx(const(wchar)*, IOfflineFilesItemFilter, IOfflineFilesItemFilter, IOfflineFilesItemFilter, IOfflineFilesItemFilter, uint, IOfflineFilesItem*);
    HRESULT RenameItem(const(wchar)*, const(wchar)*, BOOL);
    HRESULT GetLocation(PWSTR*);
    HRESULT GetDiskSpaceInformation(ulong*, ulong*, ulong*, ulong*, ulong*);
    HRESULT SetDiskSpaceLimits(ulong, ulong);
    HRESULT ProcessAdminPinPolicy(IOfflineFilesSyncProgress, IOfflineFilesSyncProgress);
    HRESULT GetSettingObject(const(wchar)*, IOfflineFilesSetting*);
    HRESULT EnumSettingObjects(IEnumOfflineFilesSettings*);
    HRESULT IsPathCacheable(const(wchar)*, BOOL*, OFFLINEFILES_CACHING_MODE*);
}
enum IID_IOfflineFilesCache2 = GUID(0x8c075039, 0x1551, 0x4ed9, [0x87, 0x81, 0x56, 0x70, 0x5c, 0x4, 0xd3, 0xc0]);
interface IOfflineFilesCache2 : IOfflineFilesCache
{
    HRESULT RenameItemEx(const(wchar)*, const(wchar)*, BOOL);
}
