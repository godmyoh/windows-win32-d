module windows.win32.storage.offlinefiles;

import windows.win32.guid : GUID;
import windows.win32.foundation : BOOL, FILETIME, HRESULT, HWND, PWSTR;
import windows.win32.system.com : BYTE_BLOB, IUnknown;
import windows.win32.system.variant : VARIANT;

version (Windows):
extern (Windows):

uint OfflineFilesEnable(BOOL bEnable, BOOL* pbRebootRequired);
uint OfflineFilesStart();
uint OfflineFilesQueryStatus(BOOL* pbActive, BOOL* pbEnabled);
uint OfflineFilesQueryStatusEx(BOOL* pbActive, BOOL* pbEnabled, BOOL* pbAvailable);
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
    HRESULT CacheMoved(const(wchar)* pszOldPath, const(wchar)* pszNewPath);
    HRESULT CacheIsFull();
    HRESULT CacheIsCorrupted();
    HRESULT Enabled(BOOL bEnabled);
    HRESULT EncryptionChanged(BOOL bWasEncrypted, BOOL bWasPartial, BOOL bIsEncrypted, BOOL bIsPartial);
    HRESULT SyncBegin(const(GUID)* rSyncId);
    HRESULT SyncFileResult(const(GUID)* rSyncId, const(wchar)* pszFile, HRESULT hrResult);
    HRESULT SyncConflictRecAdded(const(wchar)* pszConflictPath, const(FILETIME)* pftConflictDateTime, OFFLINEFILES_SYNC_STATE ConflictSyncState);
    HRESULT SyncConflictRecUpdated(const(wchar)* pszConflictPath, const(FILETIME)* pftConflictDateTime, OFFLINEFILES_SYNC_STATE ConflictSyncState);
    HRESULT SyncConflictRecRemoved(const(wchar)* pszConflictPath, const(FILETIME)* pftConflictDateTime, OFFLINEFILES_SYNC_STATE ConflictSyncState);
    HRESULT SyncEnd(const(GUID)* rSyncId, HRESULT hrResult);
    HRESULT NetTransportArrived();
    HRESULT NoNetTransports();
    HRESULT ItemDisconnected(const(wchar)* pszPath, OFFLINEFILES_ITEM_TYPE ItemType);
    HRESULT ItemReconnected(const(wchar)* pszPath, OFFLINEFILES_ITEM_TYPE ItemType);
    HRESULT ItemAvailableOffline(const(wchar)* pszPath, OFFLINEFILES_ITEM_TYPE ItemType);
    HRESULT ItemNotAvailableOffline(const(wchar)* pszPath, OFFLINEFILES_ITEM_TYPE ItemType);
    HRESULT ItemPinned(const(wchar)* pszPath, OFFLINEFILES_ITEM_TYPE ItemType);
    HRESULT ItemNotPinned(const(wchar)* pszPath, OFFLINEFILES_ITEM_TYPE ItemType);
    HRESULT ItemModified(const(wchar)* pszPath, OFFLINEFILES_ITEM_TYPE ItemType, BOOL bModifiedData, BOOL bModifiedAttributes);
    HRESULT ItemAddedToCache(const(wchar)* pszPath, OFFLINEFILES_ITEM_TYPE ItemType);
    HRESULT ItemDeletedFromCache(const(wchar)* pszPath, OFFLINEFILES_ITEM_TYPE ItemType);
    HRESULT ItemRenamed(const(wchar)* pszOldPath, const(wchar)* pszNewPath, OFFLINEFILES_ITEM_TYPE ItemType);
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
    HRESULT BackgroundSyncBegin(uint dwSyncControlFlags);
    HRESULT BackgroundSyncEnd(uint dwSyncControlFlags);
    HRESULT PolicyChangeDetected();
    HRESULT PreferenceChangeDetected();
    HRESULT SettingsChangesApplied();
}
enum IID_IOfflineFilesEvents3 = GUID(0x9ba04a45, 0xee69, 0x42f0, [0x9a, 0xb1, 0x7d, 0xb5, 0xc8, 0x80, 0x58, 0x8]);
interface IOfflineFilesEvents3 : IOfflineFilesEvents2
{
    HRESULT TransparentCacheItemNotify(const(wchar)* pszPath, OFFLINEFILES_EVENTS EventType, OFFLINEFILES_ITEM_TYPE ItemType, BOOL bModifiedData, BOOL bModifiedAttributes, const(wchar)* pzsOldPath);
    HRESULT PrefetchFileBegin(const(wchar)* pszPath);
    HRESULT PrefetchFileEnd(const(wchar)* pszPath, HRESULT hrResult);
}
enum IID_IOfflineFilesEvents4 = GUID(0xdbd69b1e, 0xc7d2, 0x473e, [0xb3, 0x5f, 0x9d, 0x8c, 0x24, 0xc0, 0xc4, 0x84]);
interface IOfflineFilesEvents4 : IOfflineFilesEvents3
{
    HRESULT PrefetchCloseHandleBegin();
    HRESULT PrefetchCloseHandleEnd(uint dwClosedHandleCount, uint dwOpenHandleCount, HRESULT hrResult);
}
enum IID_IOfflineFilesEventsFilter = GUID(0x33fc4e1b, 0x716, 0x40fa, [0xba, 0x65, 0x6e, 0x62, 0xa8, 0x4a, 0x84, 0x6f]);
interface IOfflineFilesEventsFilter : IUnknown
{
    HRESULT GetPathFilter(PWSTR* ppszFilter, OFFLINEFILES_PATHFILTER_MATCH* pMatch);
    HRESULT GetIncludedEvents(uint cElements, OFFLINEFILES_EVENTS* prgEvents, uint* pcEvents);
    HRESULT GetExcludedEvents(uint cElements, OFFLINEFILES_EVENTS* prgEvents, uint* pcEvents);
}
enum IID_IOfflineFilesErrorInfo = GUID(0x7112fa5f, 0x7571, 0x435a, [0x8e, 0xb7, 0x19, 0x5c, 0x7c, 0x14, 0x29, 0xbc]);
interface IOfflineFilesErrorInfo : IUnknown
{
    HRESULT GetRawData(BYTE_BLOB** ppBlob);
    HRESULT GetDescription(PWSTR* ppszDescription);
}
enum IID_IOfflineFilesSyncErrorItemInfo = GUID(0xecdbaf0d, 0x6a18, 0x4d55, [0x80, 0x17, 0x10, 0x8f, 0x76, 0x60, 0xba, 0x44]);
interface IOfflineFilesSyncErrorItemInfo : IUnknown
{
    HRESULT GetFileAttributes(uint* pdwAttributes);
    HRESULT GetFileTimes(FILETIME* pftLastWrite, FILETIME* pftChange);
    HRESULT GetFileSize(long* pSize);
}
enum IID_IOfflineFilesSyncErrorInfo = GUID(0x59f95e46, 0xeb54, 0x49d1, [0xbe, 0x76, 0xde, 0x95, 0x45, 0x8d, 0x1, 0xb0]);
interface IOfflineFilesSyncErrorInfo : IOfflineFilesErrorInfo
{
    HRESULT GetSyncOperation(OFFLINEFILES_SYNC_OPERATION* pSyncOp);
    HRESULT GetItemChangeFlags(uint* pdwItemChangeFlags);
    HRESULT InfoEnumerated(BOOL* pbLocalEnumerated, BOOL* pbRemoteEnumerated, BOOL* pbOriginalEnumerated);
    HRESULT InfoAvailable(BOOL* pbLocalInfo, BOOL* pbRemoteInfo, BOOL* pbOriginalInfo);
    HRESULT GetLocalInfo(IOfflineFilesSyncErrorItemInfo* ppInfo);
    HRESULT GetRemoteInfo(IOfflineFilesSyncErrorItemInfo* ppInfo);
    HRESULT GetOriginalInfo(IOfflineFilesSyncErrorItemInfo* ppInfo);
}
enum IID_IOfflineFilesProgress = GUID(0xfad63237, 0xc55b, 0x4911, [0x98, 0x50, 0xbc, 0xf9, 0x6d, 0x4c, 0x97, 0x9e]);
interface IOfflineFilesProgress : IUnknown
{
    HRESULT Begin(BOOL* pbAbort);
    HRESULT QueryAbort(BOOL* pbAbort);
    HRESULT End(HRESULT hrResult);
}
enum IID_IOfflineFilesSimpleProgress = GUID(0xc34f7f9b, 0xc43d, 0x4f9d, [0xa7, 0x76, 0xc0, 0xeb, 0x6d, 0xe5, 0xd4, 0x1]);
interface IOfflineFilesSimpleProgress : IOfflineFilesProgress
{
    HRESULT ItemBegin(const(wchar)* pszFile, OFFLINEFILES_OP_RESPONSE* pResponse);
    HRESULT ItemResult(const(wchar)* pszFile, HRESULT hrResult, OFFLINEFILES_OP_RESPONSE* pResponse);
}
enum IID_IOfflineFilesSyncProgress = GUID(0x6931f49a, 0x6fc7, 0x4c1b, [0xb2, 0x65, 0x56, 0x79, 0x3f, 0xc4, 0x51, 0xb7]);
interface IOfflineFilesSyncProgress : IOfflineFilesProgress
{
    HRESULT SyncItemBegin(const(wchar)* pszFile, OFFLINEFILES_OP_RESPONSE* pResponse);
    HRESULT SyncItemResult(const(wchar)* pszFile, HRESULT hrResult, IOfflineFilesSyncErrorInfo pErrorInfo, OFFLINEFILES_OP_RESPONSE* pResponse);
}
enum IID_IOfflineFilesSyncConflictHandler = GUID(0xb6dd5092, 0xc65c, 0x46b6, [0x97, 0xb8, 0xfa, 0xdd, 0x8, 0xe7, 0xe1, 0xbe]);
interface IOfflineFilesSyncConflictHandler : IUnknown
{
    HRESULT ResolveConflict(const(wchar)* pszPath, uint fStateKnown, OFFLINEFILES_SYNC_STATE state, uint fChangeDetails, OFFLINEFILES_SYNC_CONFLICT_RESOLVE* pConflictResolution, PWSTR* ppszNewName);
}
enum IID_IOfflineFilesItemFilter = GUID(0xf4b5a26c, 0xdc05, 0x4f20, [0xad, 0xa4, 0x55, 0x1f, 0x10, 0x77, 0xbe, 0x5c]);
interface IOfflineFilesItemFilter : IUnknown
{
    HRESULT GetFilterFlags(ulong* pullFlags, ulong* pullMask);
    HRESULT GetTimeFilter(FILETIME* pftTime, BOOL* pbEvalTimeOfDay, OFFLINEFILES_ITEM_TIME* pTimeType, OFFLINEFILES_COMPARE* pCompare);
    HRESULT GetPatternFilter(PWSTR pszPattern, uint cchPattern);
}
enum IID_IOfflineFilesItem = GUID(0x4a753da6, 0xe044, 0x4f12, [0xa7, 0x18, 0x5d, 0x14, 0xd0, 0x79, 0xa9, 0x6]);
interface IOfflineFilesItem : IUnknown
{
    HRESULT GetItemType(OFFLINEFILES_ITEM_TYPE* pItemType);
    HRESULT GetPath(PWSTR* ppszPath);
    HRESULT GetParentItem(IOfflineFilesItem* ppItem);
    HRESULT Refresh(uint dwQueryFlags);
    HRESULT IsMarkedForDeletion(BOOL* pbMarkedForDeletion);
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
    HRESULT IsSparse(BOOL* pbIsSparse);
    HRESULT IsEncrypted(BOOL* pbIsEncrypted);
}
enum IID_IEnumOfflineFilesItems = GUID(0xda70e815, 0xc361, 0x4407, [0xbc, 0xb, 0xd, 0x70, 0x46, 0xe5, 0xf2, 0xcd]);
interface IEnumOfflineFilesItems : IUnknown
{
    HRESULT Next(uint celt, IOfflineFilesItem* rgelt, uint* pceltFetched);
    HRESULT Skip(uint celt);
    HRESULT Reset();
    HRESULT Clone(IEnumOfflineFilesItems* ppenum);
}
enum IID_IOfflineFilesItemContainer = GUID(0x3836f049, 0x9413, 0x45dd, [0xbf, 0x46, 0xb5, 0xaa, 0xa8, 0x2d, 0xc3, 0x10]);
interface IOfflineFilesItemContainer : IUnknown
{
    HRESULT EnumItems(uint dwQueryFlags, IEnumOfflineFilesItems* ppenum);
    HRESULT EnumItemsEx(IOfflineFilesItemFilter pIncludeFileFilter, IOfflineFilesItemFilter pIncludeDirFilter, IOfflineFilesItemFilter pExcludeFileFilter, IOfflineFilesItemFilter pExcludeDirFilter, uint dwEnumFlags, uint dwQueryFlags, IEnumOfflineFilesItems* ppenum);
}
enum IID_IOfflineFilesChangeInfo = GUID(0xa96e6fa4, 0xe0d1, 0x4c29, [0x96, 0xb, 0xee, 0x50, 0x8f, 0xe6, 0x8c, 0x72]);
interface IOfflineFilesChangeInfo : IUnknown
{
    HRESULT IsDirty(BOOL* pbDirty);
    HRESULT IsDeletedOffline(BOOL* pbDeletedOffline);
    HRESULT IsCreatedOffline(BOOL* pbCreatedOffline);
    HRESULT IsLocallyModifiedData(BOOL* pbLocallyModifiedData);
    HRESULT IsLocallyModifiedAttributes(BOOL* pbLocallyModifiedAttributes);
    HRESULT IsLocallyModifiedTime(BOOL* pbLocallyModifiedTime);
}
enum IID_IOfflineFilesDirtyInfo = GUID(0xf50ce33, 0xbac9, 0x4eaa, [0xa1, 0x1d, 0xda, 0xe, 0x52, 0x7d, 0x4, 0x7d]);
interface IOfflineFilesDirtyInfo : IUnknown
{
    HRESULT LocalDirtyByteCount(long* pDirtyByteCount);
    HRESULT RemoteDirtyByteCount(long* pDirtyByteCount);
}
enum IID_IOfflineFilesFileSysInfo = GUID(0xbc1a163f, 0x7bfd, 0x4d88, [0x9c, 0x66, 0x96, 0xea, 0x9a, 0x6a, 0x3d, 0x6b]);
interface IOfflineFilesFileSysInfo : IUnknown
{
    HRESULT GetAttributes(OFFLINEFILES_ITEM_COPY copy, uint* pdwAttributes);
    HRESULT GetTimes(OFFLINEFILES_ITEM_COPY copy, FILETIME* pftCreationTime, FILETIME* pftLastWriteTime, FILETIME* pftChangeTime, FILETIME* pftLastAccessTime);
    HRESULT GetFileSize(OFFLINEFILES_ITEM_COPY copy, long* pSize);
}
enum IID_IOfflineFilesPinInfo = GUID(0x5b2b0655, 0xb3fd, 0x497d, [0xad, 0xeb, 0xbd, 0x15, 0x6b, 0xc8, 0x35, 0x5b]);
interface IOfflineFilesPinInfo : IUnknown
{
    HRESULT IsPinned(BOOL* pbPinned);
    HRESULT IsPinnedForUser(BOOL* pbPinnedForUser, BOOL* pbInherit);
    HRESULT IsPinnedForUserByPolicy(BOOL* pbPinnedForUser, BOOL* pbInherit);
    HRESULT IsPinnedForComputer(BOOL* pbPinnedForComputer, BOOL* pbInherit);
    HRESULT IsPinnedForFolderRedirection(BOOL* pbPinnedForFolderRedirection, BOOL* pbInherit);
}
enum IID_IOfflineFilesPinInfo2 = GUID(0x623c58a2, 0x42ed, 0x4ad7, [0xb6, 0x9a, 0xf, 0x1b, 0x30, 0xa7, 0x2d, 0xd]);
interface IOfflineFilesPinInfo2 : IOfflineFilesPinInfo
{
    HRESULT IsPartlyPinned(BOOL* pbPartlyPinned);
}
enum IID_IOfflineFilesTransparentCacheInfo = GUID(0xbcaf4a01, 0x5b68, 0x4b56, [0xa6, 0xa1, 0x8d, 0x27, 0x86, 0xed, 0xe8, 0xe3]);
interface IOfflineFilesTransparentCacheInfo : IUnknown
{
    HRESULT IsTransparentlyCached(BOOL* pbTransparentlyCached);
}
enum IID_IOfflineFilesGhostInfo = GUID(0x2b09d48c, 0x8ab5, 0x464f, [0xa7, 0x55, 0xa5, 0x9d, 0x92, 0xf9, 0x94, 0x29]);
interface IOfflineFilesGhostInfo : IUnknown
{
    HRESULT IsGhosted(BOOL* pbGhosted);
}
enum IID_IOfflineFilesConnectionInfo = GUID(0xefb23a09, 0xa867, 0x4be8, [0x83, 0xa6, 0x86, 0x96, 0x9a, 0x7d, 0x8, 0x56]);
interface IOfflineFilesConnectionInfo : IUnknown
{
    HRESULT GetConnectState(OFFLINEFILES_CONNECT_STATE* pConnectState, OFFLINEFILES_OFFLINE_REASON* pOfflineReason);
    HRESULT SetConnectState(HWND hwndParent, uint dwFlags, OFFLINEFILES_CONNECT_STATE ConnectState);
    HRESULT TransitionOnline(HWND hwndParent, uint dwFlags);
    HRESULT TransitionOffline(HWND hwndParent, uint dwFlags, BOOL bForceOpenFilesClosed, BOOL* pbOpenFilesPreventedTransition);
}
enum IID_IOfflineFilesShareInfo = GUID(0x7bcc43e7, 0x31ce, 0x4ca4, [0x8c, 0xcd, 0x1c, 0xff, 0x2d, 0xc4, 0x94, 0xda]);
interface IOfflineFilesShareInfo : IUnknown
{
    HRESULT GetShareItem(IOfflineFilesShareItem* ppShareItem);
    HRESULT GetShareCachingMode(OFFLINEFILES_CACHING_MODE* pCachingMode);
    HRESULT IsShareDfsJunction(BOOL* pbIsDfsJunction);
}
enum IID_IOfflineFilesSuspend = GUID(0x62c4560f, 0xbc0b, 0x48ca, [0xad, 0x9d, 0x34, 0xcb, 0x52, 0x8d, 0x99, 0xa9]);
interface IOfflineFilesSuspend : IUnknown
{
    HRESULT SuspendRoot(BOOL bSuspend);
}
enum IID_IOfflineFilesSuspendInfo = GUID(0xa457c25b, 0x4e9c, 0x4b04, [0x85, 0xaf, 0x89, 0x32, 0xcc, 0xd9, 0x78, 0x89]);
interface IOfflineFilesSuspendInfo : IUnknown
{
    HRESULT IsSuspended(BOOL* pbSuspended, BOOL* pbSuspendedRoot);
}
enum IID_IOfflineFilesSetting = GUID(0xd871d3f7, 0xf613, 0x48a1, [0x82, 0x7e, 0x7a, 0x34, 0xe5, 0x60, 0xff, 0xf6]);
interface IOfflineFilesSetting : IUnknown
{
    HRESULT GetName(PWSTR* ppszName);
    HRESULT GetValueType(OFFLINEFILES_SETTING_VALUE_TYPE* pType);
    HRESULT GetPreference(VARIANT* pvarValue, uint dwScope);
    HRESULT GetPreferenceScope(uint* pdwScope);
    HRESULT SetPreference(const(VARIANT)* pvarValue, uint dwScope);
    HRESULT DeletePreference(uint dwScope);
    HRESULT GetPolicy(VARIANT* pvarValue, uint dwScope);
    HRESULT GetPolicyScope(uint* pdwScope);
    HRESULT GetValue(VARIANT* pvarValue, BOOL* pbSetByPolicy);
}
enum IID_IEnumOfflineFilesSettings = GUID(0x729680c4, 0x1a38, 0x47bc, [0x9e, 0x5c, 0x2, 0xc5, 0x15, 0x62, 0xac, 0x30]);
interface IEnumOfflineFilesSettings : IUnknown
{
    HRESULT Next(uint celt, IOfflineFilesSetting* rgelt, uint* pceltFetched);
    HRESULT Skip(uint celt);
    HRESULT Reset();
    HRESULT Clone(IEnumOfflineFilesSettings* ppenum);
}
enum IID_IOfflineFilesCache = GUID(0x855d6203, 0x7914, 0x48b9, [0x8d, 0x40, 0x4c, 0x56, 0xf5, 0xac, 0xff, 0xc5]);
interface IOfflineFilesCache : IUnknown
{
    HRESULT Synchronize(HWND hwndParent, const(wchar)** rgpszPaths, uint cPaths, BOOL bAsync, uint dwSyncControl, IOfflineFilesSyncConflictHandler pISyncConflictHandler, IOfflineFilesSyncProgress pIProgress, GUID* pSyncId);
    HRESULT DeleteItems(const(wchar)** rgpszPaths, uint cPaths, uint dwFlags, BOOL bAsync, IOfflineFilesSimpleProgress pIProgress);
    HRESULT DeleteItemsForUser(const(wchar)* pszUser, const(wchar)** rgpszPaths, uint cPaths, uint dwFlags, BOOL bAsync, IOfflineFilesSimpleProgress pIProgress);
    HRESULT Pin(HWND hwndParent, const(wchar)** rgpszPaths, uint cPaths, BOOL bDeep, BOOL bAsync, uint dwPinControlFlags, IOfflineFilesSyncProgress pIProgress);
    HRESULT Unpin(HWND hwndParent, const(wchar)** rgpszPaths, uint cPaths, BOOL bDeep, BOOL bAsync, uint dwPinControlFlags, IOfflineFilesSyncProgress pIProgress);
    HRESULT GetEncryptionStatus(BOOL* pbEncrypted, BOOL* pbPartial);
    HRESULT Encrypt(HWND hwndParent, BOOL bEncrypt, uint dwEncryptionControlFlags, BOOL bAsync, IOfflineFilesSyncProgress pIProgress);
    HRESULT FindItem(const(wchar)* pszPath, uint dwQueryFlags, IOfflineFilesItem* ppItem);
    HRESULT FindItemEx(const(wchar)* pszPath, IOfflineFilesItemFilter pIncludeFileFilter, IOfflineFilesItemFilter pIncludeDirFilter, IOfflineFilesItemFilter pExcludeFileFilter, IOfflineFilesItemFilter pExcludeDirFilter, uint dwQueryFlags, IOfflineFilesItem* ppItem);
    HRESULT RenameItem(const(wchar)* pszPathOriginal, const(wchar)* pszPathNew, BOOL bReplaceIfExists);
    HRESULT GetLocation(PWSTR* ppszPath);
    HRESULT GetDiskSpaceInformation(ulong* pcbVolumeTotal, ulong* pcbLimit, ulong* pcbUsed, ulong* pcbUnpinnedLimit, ulong* pcbUnpinnedUsed);
    HRESULT SetDiskSpaceLimits(ulong cbLimit, ulong cbUnpinnedLimit);
    HRESULT ProcessAdminPinPolicy(IOfflineFilesSyncProgress pPinProgress, IOfflineFilesSyncProgress pUnpinProgress);
    HRESULT GetSettingObject(const(wchar)* pszSettingName, IOfflineFilesSetting* ppSetting);
    HRESULT EnumSettingObjects(IEnumOfflineFilesSettings* ppEnum);
    HRESULT IsPathCacheable(const(wchar)* pszPath, BOOL* pbCacheable, OFFLINEFILES_CACHING_MODE* pShareCachingMode);
}
enum IID_IOfflineFilesCache2 = GUID(0x8c075039, 0x1551, 0x4ed9, [0x87, 0x81, 0x56, 0x70, 0x5c, 0x4, 0xd3, 0xc0]);
interface IOfflineFilesCache2 : IOfflineFilesCache
{
    HRESULT RenameItemEx(const(wchar)* pszPathOriginal, const(wchar)* pszPathNew, BOOL bReplaceIfExists);
}
enum CLSID_OfflineFilesSetting = GUID(0xfd3659e9, 0xa920, 0x4123, [0xad, 0x64, 0x7f, 0xc7, 0x6c, 0x7a, 0xac, 0xdf]);
struct OfflineFilesSetting
{
}
enum CLSID_OfflineFilesCache = GUID(0x48c6be7c, 0x3871, 0x43cc, [0xb4, 0x6f, 0x14, 0x49, 0xa1, 0xbb, 0x2f, 0xf3]);
struct OfflineFilesCache
{
}
