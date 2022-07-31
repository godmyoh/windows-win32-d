module windows.win32.networking.backgroundintelligenttransferservice;

import windows.win32.guid : GUID;
import windows.win32.foundation : BOOL, BSTR, FILETIME, HRESULT, PWSTR;
import windows.win32.system.com_ : IDispatch, IUnknown, VARIANT;

version (Windows):
extern (Windows):

alias BG_TOKEN = uint;
enum : uint
{
    BG_TOKEN_LOCAL_FILE = 0x00000001,
    BG_TOKEN_NETWORK    = 0x00000002,
}

enum BG_NOTIFY_JOB_TRANSFERRED = 0x00000001;
enum BG_NOTIFY_JOB_ERROR = 0x00000002;
enum BG_NOTIFY_DISABLE = 0x00000004;
enum BG_NOTIFY_JOB_MODIFICATION = 0x00000008;
enum BG_NOTIFY_FILE_TRANSFERRED = 0x00000010;
enum BG_NOTIFY_FILE_RANGES_TRANSFERRED = 0x00000020;
enum BG_JOB_ENUM_ALL_USERS = 0x00000001;
enum BG_COPY_FILE_OWNER = 0x00000001;
enum BG_COPY_FILE_GROUP = 0x00000002;
enum BG_COPY_FILE_DACL = 0x00000004;
enum BG_COPY_FILE_SACL = 0x00000008;
enum BG_COPY_FILE_ALL = 0x0000000f;
enum BG_SSL_ENABLE_CRL_CHECK = 0x00000001;
enum BG_SSL_IGNORE_CERT_CN_INVALID = 0x00000002;
enum BG_SSL_IGNORE_CERT_DATE_INVALID = 0x00000004;
enum BG_SSL_IGNORE_UNKNOWN_CA = 0x00000008;
enum BG_SSL_IGNORE_CERT_WRONG_USAGE = 0x00000010;
enum BG_HTTP_REDIRECT_POLICY_MASK = 0x00000700;
enum BG_HTTP_REDIRECT_POLICY_ALLOW_SILENT = 0x00000000;
enum BG_HTTP_REDIRECT_POLICY_ALLOW_REPORT = 0x00000100;
enum BG_HTTP_REDIRECT_POLICY_DISALLOW = 0x00000200;
enum BG_HTTP_REDIRECT_POLICY_ALLOW_HTTPS_TO_HTTP = 0x00000800;
enum BG_ENABLE_PEERCACHING_CLIENT = 0x00000001;
enum BG_ENABLE_PEERCACHING_SERVER = 0x00000002;
enum BG_DISABLE_BRANCH_CACHE = 0x00000004;
enum BG_JOB_ENABLE_PEERCACHING_CLIENT = 0x00000001;
enum BG_JOB_ENABLE_PEERCACHING_SERVER = 0x00000002;
enum BG_JOB_DISABLE_BRANCH_CACHE = 0x00000004;
enum BITS_COST_STATE_UNRESTRICTED = 0x00000001;
enum BITS_COST_STATE_CAPPED_USAGE_UNKNOWN = 0x00000002;
enum BITS_COST_STATE_BELOW_CAP = 0x00000004;
enum BITS_COST_STATE_NEAR_CAP = 0x00000008;
enum BITS_COST_STATE_OVERCAP_CHARGED = 0x00000010;
enum BITS_COST_STATE_OVERCAP_THROTTLED = 0x00000020;
enum BITS_COST_STATE_USAGE_BASED = 0x00000040;
enum BITS_COST_STATE_ROAMING = 0x00000080;
enum BITS_COST_OPTION_IGNORE_CONGESTION = 0x80000000;
enum BITS_COST_STATE_RESERVED = 0x40000000;
enum QM_NOTIFY_FILE_DONE = 0x00000001;
enum QM_NOTIFY_JOB_DONE = 0x00000002;
enum QM_NOTIFY_GROUP_DONE = 0x00000004;
enum QM_NOTIFY_DISABLE_NOTIFY = 0x00000040;
enum QM_NOTIFY_USE_PROGRESSEX = 0x00000080;
enum QM_STATUS_FILE_COMPLETE = 0x00000001;
enum QM_STATUS_FILE_INCOMPLETE = 0x00000002;
enum QM_STATUS_JOB_COMPLETE = 0x00000004;
enum QM_STATUS_JOB_INCOMPLETE = 0x00000008;
enum QM_STATUS_JOB_ERROR = 0x00000010;
enum QM_STATUS_JOB_FOREGROUND = 0x00000020;
enum QM_STATUS_GROUP_COMPLETE = 0x00000040;
enum QM_STATUS_GROUP_INCOMPLETE = 0x00000080;
enum QM_STATUS_GROUP_SUSPENDED = 0x00000100;
enum QM_STATUS_GROUP_ERROR = 0x00000200;
enum QM_STATUS_GROUP_FOREGROUND = 0x00000400;
enum QM_PROTOCOL_HTTP = 0x00000001;
enum QM_PROTOCOL_FTP = 0x00000002;
enum QM_PROTOCOL_SMB = 0x00000003;
enum QM_PROTOCOL_CUSTOM = 0x00000004;
enum QM_PROGRESS_PERCENT_DONE = 0x00000001;
enum QM_PROGRESS_TIME_DONE = 0x00000002;
enum QM_PROGRESS_SIZE_DONE = 0x00000003;
enum QM_E_INVALID_STATE = 0x81001001;
enum QM_E_SERVICE_UNAVAILABLE = 0x81001002;
enum QM_E_DOWNLOADER_UNAVAILABLE = 0x81001003;
enum QM_E_ITEM_NOT_FOUND = 0x81001004;
enum BG_E_NOT_FOUND = 0xffffffff80200001;
enum BG_E_INVALID_STATE = 0xffffffff80200002;
enum BG_E_EMPTY = 0xffffffff80200003;
enum BG_E_FILE_NOT_AVAILABLE = 0xffffffff80200004;
enum BG_E_PROTOCOL_NOT_AVAILABLE = 0xffffffff80200005;
enum BG_S_ERROR_CONTEXT_NONE = 0x00200006;
enum BG_E_ERROR_CONTEXT_UNKNOWN = 0xffffffff80200007;
enum BG_E_ERROR_CONTEXT_GENERAL_QUEUE_MANAGER = 0xffffffff80200008;
enum BG_E_ERROR_CONTEXT_LOCAL_FILE = 0xffffffff80200009;
enum BG_E_ERROR_CONTEXT_REMOTE_FILE = 0xffffffff8020000a;
enum BG_E_ERROR_CONTEXT_GENERAL_TRANSPORT = 0xffffffff8020000b;
enum BG_E_ERROR_CONTEXT_QUEUE_MANAGER_NOTIFICATION = 0xffffffff8020000c;
enum BG_E_DESTINATION_LOCKED = 0xffffffff8020000d;
enum BG_E_VOLUME_CHANGED = 0xffffffff8020000e;
enum BG_E_ERROR_INFORMATION_UNAVAILABLE = 0xffffffff8020000f;
enum BG_E_NETWORK_DISCONNECTED = 0xffffffff80200010;
enum BG_E_MISSING_FILE_SIZE = 0xffffffff80200011;
enum BG_E_INSUFFICIENT_HTTP_SUPPORT = 0xffffffff80200012;
enum BG_E_INSUFFICIENT_RANGE_SUPPORT = 0xffffffff80200013;
enum BG_E_REMOTE_NOT_SUPPORTED = 0xffffffff80200014;
enum BG_E_NEW_OWNER_DIFF_MAPPING = 0xffffffff80200015;
enum BG_E_NEW_OWNER_NO_FILE_ACCESS = 0xffffffff80200016;
enum BG_S_PARTIAL_COMPLETE = 0x00200017;
enum BG_E_PROXY_LIST_TOO_LARGE = 0xffffffff80200018;
enum BG_E_PROXY_BYPASS_LIST_TOO_LARGE = 0xffffffff80200019;
enum BG_S_UNABLE_TO_DELETE_FILES = 0x0020001a;
enum BG_E_INVALID_SERVER_RESPONSE = 0xffffffff8020001b;
enum BG_E_TOO_MANY_FILES = 0xffffffff8020001c;
enum BG_E_LOCAL_FILE_CHANGED = 0xffffffff8020001d;
enum BG_E_ERROR_CONTEXT_REMOTE_APPLICATION = 0xffffffff8020001e;
enum BG_E_SESSION_NOT_FOUND = 0xffffffff8020001f;
enum BG_E_TOO_LARGE = 0xffffffff80200020;
enum BG_E_STRING_TOO_LONG = 0xffffffff80200021;
enum BG_E_CLIENT_SERVER_PROTOCOL_MISMATCH = 0xffffffff80200022;
enum BG_E_SERVER_EXECUTE_ENABLE = 0xffffffff80200023;
enum BG_E_NO_PROGRESS = 0xffffffff80200024;
enum BG_E_USERNAME_TOO_LARGE = 0xffffffff80200025;
enum BG_E_PASSWORD_TOO_LARGE = 0xffffffff80200026;
enum BG_E_INVALID_AUTH_TARGET = 0xffffffff80200027;
enum BG_E_INVALID_AUTH_SCHEME = 0xffffffff80200028;
enum BG_E_FILE_NOT_FOUND = 0xffffffff80200029;
enum BG_S_PROXY_CHANGED = 0x0020002a;
enum BG_E_INVALID_RANGE = 0xffffffff8020002b;
enum BG_E_OVERLAPPING_RANGES = 0xffffffff8020002c;
enum BG_E_CONNECT_FAILURE = 0xffffffff8020002d;
enum BG_E_CONNECTION_CLOSED = 0xffffffff8020002e;
enum BG_E_BLOCKED_BY_POLICY = 0xffffffff8020003e;
enum BG_E_INVALID_PROXY_INFO = 0xffffffff8020003f;
enum BG_E_INVALID_CREDENTIALS = 0xffffffff80200040;
enum BG_E_INVALID_HASH_ALGORITHM = 0xffffffff80200041;
enum BG_E_RECORD_DELETED = 0xffffffff80200042;
enum BG_E_COMMIT_IN_PROGRESS = 0xffffffff80200043;
enum BG_E_DISCOVERY_IN_PROGRESS = 0xffffffff80200044;
enum BG_E_UPNP_ERROR = 0xffffffff80200045;
enum BG_E_TEST_OPTION_BLOCKED_DOWNLOAD = 0xffffffff80200046;
enum BG_E_PEERCACHING_DISABLED = 0xffffffff80200047;
enum BG_E_BUSYCACHERECORD = 0xffffffff80200048;
enum BG_E_TOO_MANY_JOBS_PER_USER = 0xffffffff80200049;
enum BG_E_TOO_MANY_JOBS_PER_MACHINE = 0xffffffff80200050;
enum BG_E_TOO_MANY_FILES_IN_JOB = 0xffffffff80200051;
enum BG_E_TOO_MANY_RANGES_IN_FILE = 0xffffffff80200052;
enum BG_E_VALIDATION_FAILED = 0xffffffff80200053;
enum BG_E_MAXDOWNLOAD_TIMEOUT = 0xffffffff80200054;
enum BG_S_OVERRIDDEN_BY_POLICY = 0x00200055;
enum BG_E_TOKEN_REQUIRED = 0xffffffff80200056;
enum BG_E_UNKNOWN_PROPERTY_ID = 0xffffffff80200057;
enum BG_E_READ_ONLY_PROPERTY = 0xffffffff80200058;
enum BG_E_BLOCKED_BY_COST_TRANSFER_POLICY = 0xffffffff80200059;
enum BG_E_PROPERTY_SUPPORTED_FOR_DOWNLOAD_JOBS_ONLY = 0xffffffff80200060;
enum BG_E_READ_ONLY_PROPERTY_AFTER_ADDFILE = 0xffffffff80200061;
enum BG_E_READ_ONLY_PROPERTY_AFTER_RESUME = 0xffffffff80200062;
enum BG_E_MAX_DOWNLOAD_SIZE_INVALID_VALUE = 0xffffffff80200063;
enum BG_E_MAX_DOWNLOAD_SIZE_LIMIT_REACHED = 0xffffffff80200064;
enum BG_E_STANDBY_MODE = 0xffffffff80200065;
enum BG_E_USE_STORED_CREDENTIALS_NOT_SUPPORTED = 0xffffffff80200066;
enum BG_E_BLOCKED_BY_BATTERY_POLICY = 0xffffffff80200067;
enum BG_E_BLOCKED_BY_BATTERY_SAVER = 0xffffffff80200068;
enum BG_E_WATCHDOG_TIMEOUT = 0xffffffff80200069;
enum BG_E_APP_PACKAGE_NOT_FOUND = 0xffffffff8020006a;
enum BG_E_APP_PACKAGE_SCENARIO_NOT_SUPPORTED = 0xffffffff8020006b;
enum BG_E_DATABASE_CORRUPT = 0xffffffff8020006c;
enum BG_E_RANDOM_ACCESS_NOT_SUPPORTED = 0xffffffff8020006d;
enum BG_E_BLOCKED_BY_BACKGROUND_ACCESS_POLICY = 0xffffffff8020006e;
enum BG_E_BLOCKED_BY_GAME_MODE = 0xffffffff8020006f;
enum BG_E_BLOCKED_BY_SYSTEM_POLICY = 0xffffffff80200070;
enum BG_E_NOT_SUPPORTED_WITH_CUSTOM_HTTP_METHOD = 0xffffffff80200071;
enum BG_E_UNSUPPORTED_JOB_CONFIGURATION = 0xffffffff80200072;
enum BG_E_REMOTE_FILE_CHANGED = 0xffffffff80200073;
enum BG_E_SERVER_CERT_VALIDATION_INTERFACE_REQUIRED = 0xffffffff80200074;
enum BG_E_READ_ONLY_WHEN_JOB_ACTIVE = 0xffffffff80200075;
enum BG_E_ERROR_CONTEXT_SERVER_CERTIFICATE_CALLBACK = 0xffffffff80200076;
enum BG_E_HTTP_ERROR_100 = 0xffffffff80190064;
enum BG_E_HTTP_ERROR_101 = 0xffffffff80190065;
enum BG_E_HTTP_ERROR_200 = 0xffffffff801900c8;
enum BG_E_HTTP_ERROR_201 = 0xffffffff801900c9;
enum BG_E_HTTP_ERROR_202 = 0xffffffff801900ca;
enum BG_E_HTTP_ERROR_203 = 0xffffffff801900cb;
enum BG_E_HTTP_ERROR_204 = 0xffffffff801900cc;
enum BG_E_HTTP_ERROR_205 = 0xffffffff801900cd;
enum BG_E_HTTP_ERROR_206 = 0xffffffff801900ce;
enum BG_E_HTTP_ERROR_300 = 0xffffffff8019012c;
enum BG_E_HTTP_ERROR_301 = 0xffffffff8019012d;
enum BG_E_HTTP_ERROR_302 = 0xffffffff8019012e;
enum BG_E_HTTP_ERROR_303 = 0xffffffff8019012f;
enum BG_E_HTTP_ERROR_304 = 0xffffffff80190130;
enum BG_E_HTTP_ERROR_305 = 0xffffffff80190131;
enum BG_E_HTTP_ERROR_307 = 0xffffffff80190133;
enum BG_E_HTTP_ERROR_400 = 0xffffffff80190190;
enum BG_E_HTTP_ERROR_401 = 0xffffffff80190191;
enum BG_E_HTTP_ERROR_402 = 0xffffffff80190192;
enum BG_E_HTTP_ERROR_403 = 0xffffffff80190193;
enum BG_E_HTTP_ERROR_404 = 0xffffffff80190194;
enum BG_E_HTTP_ERROR_405 = 0xffffffff80190195;
enum BG_E_HTTP_ERROR_406 = 0xffffffff80190196;
enum BG_E_HTTP_ERROR_407 = 0xffffffff80190197;
enum BG_E_HTTP_ERROR_408 = 0xffffffff80190198;
enum BG_E_HTTP_ERROR_409 = 0xffffffff80190199;
enum BG_E_HTTP_ERROR_410 = 0xffffffff8019019a;
enum BG_E_HTTP_ERROR_411 = 0xffffffff8019019b;
enum BG_E_HTTP_ERROR_412 = 0xffffffff8019019c;
enum BG_E_HTTP_ERROR_413 = 0xffffffff8019019d;
enum BG_E_HTTP_ERROR_414 = 0xffffffff8019019e;
enum BG_E_HTTP_ERROR_415 = 0xffffffff8019019f;
enum BG_E_HTTP_ERROR_416 = 0xffffffff801901a0;
enum BG_E_HTTP_ERROR_417 = 0xffffffff801901a1;
enum BG_E_HTTP_ERROR_449 = 0xffffffff801901c1;
enum BG_E_HTTP_ERROR_500 = 0xffffffff801901f4;
enum BG_E_HTTP_ERROR_501 = 0xffffffff801901f5;
enum BG_E_HTTP_ERROR_502 = 0xffffffff801901f6;
enum BG_E_HTTP_ERROR_503 = 0xffffffff801901f7;
enum BG_E_HTTP_ERROR_504 = 0xffffffff801901f8;
enum BG_E_HTTP_ERROR_505 = 0xffffffff801901f9;
enum BITS_MC_JOB_CANCELLED = 0xffffffff80194000;
enum BITS_MC_FILE_DELETION_FAILED = 0xffffffff80194001;
enum BITS_MC_FILE_DELETION_FAILED_MORE = 0xffffffff80194002;
enum BITS_MC_JOB_PROPERTY_CHANGE = 0xffffffff80194003;
enum BITS_MC_JOB_TAKE_OWNERSHIP = 0xffffffff80194004;
enum BITS_MC_JOB_SCAVENGED = 0xffffffff80194005;
enum BITS_MC_JOB_NOTIFICATION_FAILURE = 0xffffffff80194006;
enum BITS_MC_STATE_FILE_CORRUPT = 0xffffffff80194007;
enum BITS_MC_FAILED_TO_START = 0xffffffff80194008;
enum BITS_MC_FATAL_IGD_ERROR = 0xffffffff80194009;
enum BITS_MC_PEERCACHING_PORT = 0xffffffff8019400a;
enum BITS_MC_WSD_PORT = 0xffffffff8019400b;
enum CLSID_BackgroundCopyManager = GUID(0x4991d34b, 0x80a1, 0x4291, [0x83, 0xb6, 0x33, 0x28, 0x36, 0x6b, 0x90, 0x97]);
struct BackgroundCopyManager
{
}
struct BG_FILE_PROGRESS
{
    ulong BytesTotal;
    ulong BytesTransferred;
    BOOL Completed;
}
enum IID_IBackgroundCopyFile = GUID(0x1b7bd23, 0xfb88, 0x4a77, [0x84, 0x90, 0x58, 0x91, 0xd3, 0xe4, 0x65, 0x3a]);
interface IBackgroundCopyFile : IUnknown
{
    HRESULT GetRemoteName(PWSTR*);
    HRESULT GetLocalName(PWSTR*);
    HRESULT GetProgress(BG_FILE_PROGRESS*);
}
enum IID_IEnumBackgroundCopyFiles = GUID(0xca51e165, 0xc365, 0x424c, [0x8d, 0x41, 0x24, 0xaa, 0xa4, 0xff, 0x3c, 0x40]);
interface IEnumBackgroundCopyFiles : IUnknown
{
    HRESULT Next(uint, IBackgroundCopyFile*, uint*);
    HRESULT Skip(uint);
    HRESULT Reset();
    HRESULT Clone(IEnumBackgroundCopyFiles*);
    HRESULT GetCount(uint*);
}
alias BG_ERROR_CONTEXT = int;
enum : int
{
    BG_ERROR_CONTEXT_NONE                        = 0x00000000,
    BG_ERROR_CONTEXT_UNKNOWN                     = 0x00000001,
    BG_ERROR_CONTEXT_GENERAL_QUEUE_MANAGER       = 0x00000002,
    BG_ERROR_CONTEXT_QUEUE_MANAGER_NOTIFICATION  = 0x00000003,
    BG_ERROR_CONTEXT_LOCAL_FILE                  = 0x00000004,
    BG_ERROR_CONTEXT_REMOTE_FILE                 = 0x00000005,
    BG_ERROR_CONTEXT_GENERAL_TRANSPORT           = 0x00000006,
    BG_ERROR_CONTEXT_REMOTE_APPLICATION          = 0x00000007,
    BG_ERROR_CONTEXT_SERVER_CERTIFICATE_CALLBACK = 0x00000008,
}

enum IID_IBackgroundCopyError = GUID(0x19c613a0, 0xfcb8, 0x4f28, [0x81, 0xae, 0x89, 0x7c, 0x3d, 0x7, 0x8f, 0x81]);
interface IBackgroundCopyError : IUnknown
{
    HRESULT GetError(BG_ERROR_CONTEXT*, HRESULT*);
    HRESULT GetFile(IBackgroundCopyFile*);
    HRESULT GetErrorDescription(uint, PWSTR*);
    HRESULT GetErrorContextDescription(uint, PWSTR*);
    HRESULT GetProtocol(PWSTR*);
}
struct BG_FILE_INFO
{
    PWSTR RemoteName;
    PWSTR LocalName;
}
struct BG_JOB_PROGRESS
{
    ulong BytesTotal;
    ulong BytesTransferred;
    uint FilesTotal;
    uint FilesTransferred;
}
struct BG_JOB_TIMES
{
    FILETIME CreationTime;
    FILETIME ModificationTime;
    FILETIME TransferCompletionTime;
}
alias BG_JOB_PRIORITY = int;
enum : int
{
    BG_JOB_PRIORITY_FOREGROUND = 0x00000000,
    BG_JOB_PRIORITY_HIGH       = 0x00000001,
    BG_JOB_PRIORITY_NORMAL     = 0x00000002,
    BG_JOB_PRIORITY_LOW        = 0x00000003,
}

alias BG_JOB_STATE = int;
enum : int
{
    BG_JOB_STATE_QUEUED          = 0x00000000,
    BG_JOB_STATE_CONNECTING      = 0x00000001,
    BG_JOB_STATE_TRANSFERRING    = 0x00000002,
    BG_JOB_STATE_SUSPENDED       = 0x00000003,
    BG_JOB_STATE_ERROR           = 0x00000004,
    BG_JOB_STATE_TRANSIENT_ERROR = 0x00000005,
    BG_JOB_STATE_TRANSFERRED     = 0x00000006,
    BG_JOB_STATE_ACKNOWLEDGED    = 0x00000007,
    BG_JOB_STATE_CANCELLED       = 0x00000008,
}

alias BG_JOB_TYPE = int;
enum : int
{
    BG_JOB_TYPE_DOWNLOAD     = 0x00000000,
    BG_JOB_TYPE_UPLOAD       = 0x00000001,
    BG_JOB_TYPE_UPLOAD_REPLY = 0x00000002,
}

alias BG_JOB_PROXY_USAGE = int;
enum : int
{
    BG_JOB_PROXY_USAGE_PRECONFIG  = 0x00000000,
    BG_JOB_PROXY_USAGE_NO_PROXY   = 0x00000001,
    BG_JOB_PROXY_USAGE_OVERRIDE   = 0x00000002,
    BG_JOB_PROXY_USAGE_AUTODETECT = 0x00000003,
}

enum IID_IBackgroundCopyJob = GUID(0x37668d37, 0x507e, 0x4160, [0x93, 0x16, 0x26, 0x30, 0x6d, 0x15, 0xb, 0x12]);
interface IBackgroundCopyJob : IUnknown
{
    HRESULT AddFileSet(uint, BG_FILE_INFO*);
    HRESULT AddFile(const(wchar)*, const(wchar)*);
    HRESULT EnumFiles(IEnumBackgroundCopyFiles*);
    HRESULT Suspend();
    HRESULT Resume();
    HRESULT Cancel();
    HRESULT Complete();
    HRESULT GetId(GUID*);
    HRESULT GetType(BG_JOB_TYPE*);
    HRESULT GetProgress(BG_JOB_PROGRESS*);
    HRESULT GetTimes(BG_JOB_TIMES*);
    HRESULT GetState(BG_JOB_STATE*);
    HRESULT GetError(IBackgroundCopyError*);
    HRESULT GetOwner(PWSTR*);
    HRESULT SetDisplayName(const(wchar)*);
    HRESULT GetDisplayName(PWSTR*);
    HRESULT SetDescription(const(wchar)*);
    HRESULT GetDescription(PWSTR*);
    HRESULT SetPriority(BG_JOB_PRIORITY);
    HRESULT GetPriority(BG_JOB_PRIORITY*);
    HRESULT SetNotifyFlags(uint);
    HRESULT GetNotifyFlags(uint*);
    HRESULT SetNotifyInterface(IUnknown);
    HRESULT GetNotifyInterface(IUnknown*);
    HRESULT SetMinimumRetryDelay(uint);
    HRESULT GetMinimumRetryDelay(uint*);
    HRESULT SetNoProgressTimeout(uint);
    HRESULT GetNoProgressTimeout(uint*);
    HRESULT GetErrorCount(uint*);
    HRESULT SetProxySettings(BG_JOB_PROXY_USAGE, const(wchar)*, const(wchar)*);
    HRESULT GetProxySettings(BG_JOB_PROXY_USAGE*, PWSTR*, PWSTR*);
    HRESULT TakeOwnership();
}
enum IID_IEnumBackgroundCopyJobs = GUID(0x1af4f612, 0x3b71, 0x466f, [0x8f, 0x58, 0x7b, 0x6f, 0x73, 0xac, 0x57, 0xad]);
interface IEnumBackgroundCopyJobs : IUnknown
{
    HRESULT Next(uint, IBackgroundCopyJob*, uint*);
    HRESULT Skip(uint);
    HRESULT Reset();
    HRESULT Clone(IEnumBackgroundCopyJobs*);
    HRESULT GetCount(uint*);
}
enum IID_IBackgroundCopyCallback = GUID(0x97ea99c7, 0x186, 0x4ad4, [0x8d, 0xf9, 0xc5, 0xb4, 0xe0, 0xed, 0x6b, 0x22]);
interface IBackgroundCopyCallback : IUnknown
{
    HRESULT JobTransferred(IBackgroundCopyJob);
    HRESULT JobError(IBackgroundCopyJob, IBackgroundCopyError);
    HRESULT JobModification(IBackgroundCopyJob, uint);
}
enum IID_AsyncIBackgroundCopyCallback = GUID(0xca29d251, 0xb4bb, 0x4679, [0xa3, 0xd9, 0xae, 0x80, 0x6, 0x11, 0x9d, 0x54]);
interface AsyncIBackgroundCopyCallback : IUnknown
{
    HRESULT Begin_JobTransferred(IBackgroundCopyJob);
    HRESULT Finish_JobTransferred();
    HRESULT Begin_JobError(IBackgroundCopyJob, IBackgroundCopyError);
    HRESULT Finish_JobError();
    HRESULT Begin_JobModification(IBackgroundCopyJob, uint);
    HRESULT Finish_JobModification();
}
enum IID_IBackgroundCopyManager = GUID(0x5ce34c0d, 0xdc9, 0x4c1f, [0x89, 0x7c, 0xda, 0xa1, 0xb7, 0x8c, 0xee, 0x7c]);
interface IBackgroundCopyManager : IUnknown
{
    HRESULT CreateJob(const(wchar)*, BG_JOB_TYPE, GUID*, IBackgroundCopyJob*);
    HRESULT GetJob(const(GUID)*, IBackgroundCopyJob*);
    HRESULT EnumJobs(uint, IEnumBackgroundCopyJobs*);
    HRESULT GetErrorDescription(HRESULT, uint, PWSTR*);
}
enum CLSID_BackgroundCopyManager1_5 = GUID(0xf087771f, 0xd74f, 0x4c1a, [0xbb, 0x8a, 0xe1, 0x6a, 0xca, 0x91, 0x24, 0xea]);
struct BackgroundCopyManager1_5
{
}
struct BG_JOB_REPLY_PROGRESS
{
    ulong BytesTotal;
    ulong BytesTransferred;
}
alias BG_AUTH_TARGET = int;
enum : int
{
    BG_AUTH_TARGET_SERVER = 0x00000001,
    BG_AUTH_TARGET_PROXY  = 0x00000002,
}

alias BG_AUTH_SCHEME = int;
enum : int
{
    BG_AUTH_SCHEME_BASIC     = 0x00000001,
    BG_AUTH_SCHEME_DIGEST    = 0x00000002,
    BG_AUTH_SCHEME_NTLM      = 0x00000003,
    BG_AUTH_SCHEME_NEGOTIATE = 0x00000004,
    BG_AUTH_SCHEME_PASSPORT  = 0x00000005,
}

struct BG_BASIC_CREDENTIALS
{
    PWSTR UserName;
    PWSTR Password;
}
union BG_AUTH_CREDENTIALS_UNION
{
    BG_BASIC_CREDENTIALS Basic;
}
struct BG_AUTH_CREDENTIALS
{
    BG_AUTH_TARGET Target;
    BG_AUTH_SCHEME Scheme;
    BG_AUTH_CREDENTIALS_UNION Credentials;
}
enum IID_IBackgroundCopyJob2 = GUID(0x54b50739, 0x686f, 0x45eb, [0x9d, 0xff, 0xd6, 0xa9, 0xa0, 0xfa, 0xa9, 0xaf]);
interface IBackgroundCopyJob2 : IBackgroundCopyJob
{
    HRESULT SetNotifyCmdLine(const(wchar)*, const(wchar)*);
    HRESULT GetNotifyCmdLine(PWSTR*, PWSTR*);
    HRESULT GetReplyProgress(BG_JOB_REPLY_PROGRESS*);
    HRESULT GetReplyData(ubyte**, ulong*);
    HRESULT SetReplyFileName(const(wchar)*);
    HRESULT GetReplyFileName(PWSTR*);
    HRESULT SetCredentials(BG_AUTH_CREDENTIALS*);
    HRESULT RemoveCredentials(BG_AUTH_TARGET, BG_AUTH_SCHEME);
}
enum CLSID_BackgroundCopyManager2_0 = GUID(0x6d18ad12, 0xbde3, 0x4393, [0xb3, 0x11, 0x9, 0x9c, 0x34, 0x6e, 0x6d, 0xf9]);
struct BackgroundCopyManager2_0
{
}
struct BG_FILE_RANGE
{
    ulong InitialOffset;
    ulong Length;
}
enum IID_IBackgroundCopyJob3 = GUID(0x443c8934, 0x90ff, 0x48ed, [0xbc, 0xde, 0x26, 0xf5, 0xc7, 0x45, 0x0, 0x42]);
interface IBackgroundCopyJob3 : IBackgroundCopyJob2
{
    HRESULT ReplaceRemotePrefix(const(wchar)*, const(wchar)*);
    HRESULT AddFileWithRanges(const(wchar)*, const(wchar)*, uint, BG_FILE_RANGE*);
    HRESULT SetFileACLFlags(uint);
    HRESULT GetFileACLFlags(uint*);
}
enum IID_IBackgroundCopyFile2 = GUID(0x83e81b93, 0x873, 0x474d, [0x8a, 0x8c, 0xf2, 0x1, 0x8b, 0x1a, 0x93, 0x9c]);
interface IBackgroundCopyFile2 : IBackgroundCopyFile
{
    HRESULT GetFileRanges(uint*, BG_FILE_RANGE**);
    HRESULT SetRemoteName(const(wchar)*);
}
enum CLSID_BackgroundCopyManager2_5 = GUID(0x3ca98d6, 0xff5d, 0x49b8, [0xab, 0xc6, 0x3, 0xdd, 0x84, 0x12, 0x70, 0x20]);
struct BackgroundCopyManager2_5
{
}
alias BG_CERT_STORE_LOCATION = int;
enum : int
{
    BG_CERT_STORE_LOCATION_CURRENT_USER               = 0x00000000,
    BG_CERT_STORE_LOCATION_LOCAL_MACHINE              = 0x00000001,
    BG_CERT_STORE_LOCATION_CURRENT_SERVICE            = 0x00000002,
    BG_CERT_STORE_LOCATION_SERVICES                   = 0x00000003,
    BG_CERT_STORE_LOCATION_USERS                      = 0x00000004,
    BG_CERT_STORE_LOCATION_CURRENT_USER_GROUP_POLICY  = 0x00000005,
    BG_CERT_STORE_LOCATION_LOCAL_MACHINE_GROUP_POLICY = 0x00000006,
    BG_CERT_STORE_LOCATION_LOCAL_MACHINE_ENTERPRISE   = 0x00000007,
}

enum IID_IBackgroundCopyJobHttpOptions = GUID(0xf1bd1079, 0x9f01, 0x4bdc, [0x80, 0x36, 0xf0, 0x9b, 0x70, 0x9, 0x50, 0x66]);
interface IBackgroundCopyJobHttpOptions : IUnknown
{
    HRESULT SetClientCertificateByID(BG_CERT_STORE_LOCATION, const(wchar)*, ubyte*);
    HRESULT SetClientCertificateByName(BG_CERT_STORE_LOCATION, const(wchar)*, const(wchar)*);
    HRESULT RemoveClientCertificate();
    HRESULT GetClientCertificate(BG_CERT_STORE_LOCATION*, PWSTR*, ubyte**, PWSTR*);
    HRESULT SetCustomHeaders(const(wchar)*);
    HRESULT GetCustomHeaders(PWSTR*);
    HRESULT SetSecurityFlags(uint);
    HRESULT GetSecurityFlags(uint*);
}
enum CLSID_BackgroundCopyManager3_0 = GUID(0x659cdea7, 0x489e, 0x11d9, [0xa9, 0xcd, 0x0, 0xd, 0x56, 0x96, 0x52, 0x51]);
struct BackgroundCopyManager3_0
{
}
enum IID_IBitsPeerCacheRecord = GUID(0x659cdeaf, 0x489e, 0x11d9, [0xa9, 0xcd, 0x0, 0xd, 0x56, 0x96, 0x52, 0x51]);
interface IBitsPeerCacheRecord : IUnknown
{
    HRESULT GetId(GUID*);
    HRESULT GetOriginUrl(PWSTR*);
    HRESULT GetFileSize(ulong*);
    HRESULT GetFileModificationTime(FILETIME*);
    HRESULT GetLastAccessTime(FILETIME*);
    HRESULT IsFileValidated();
    HRESULT GetFileRanges(uint*, BG_FILE_RANGE**);
}
enum IID_IEnumBitsPeerCacheRecords = GUID(0x659cdea4, 0x489e, 0x11d9, [0xa9, 0xcd, 0x0, 0xd, 0x56, 0x96, 0x52, 0x51]);
interface IEnumBitsPeerCacheRecords : IUnknown
{
    HRESULT Next(uint, IBitsPeerCacheRecord*, uint*);
    HRESULT Skip(uint);
    HRESULT Reset();
    HRESULT Clone(IEnumBitsPeerCacheRecords*);
    HRESULT GetCount(uint*);
}
enum IID_IBitsPeer = GUID(0x659cdea2, 0x489e, 0x11d9, [0xa9, 0xcd, 0x0, 0xd, 0x56, 0x96, 0x52, 0x51]);
interface IBitsPeer : IUnknown
{
    HRESULT GetPeerName(PWSTR*);
    HRESULT IsAuthenticated(BOOL*);
    HRESULT IsAvailable(BOOL*);
}
enum IID_IEnumBitsPeers = GUID(0x659cdea5, 0x489e, 0x11d9, [0xa9, 0xcd, 0x0, 0xd, 0x56, 0x96, 0x52, 0x51]);
interface IEnumBitsPeers : IUnknown
{
    HRESULT Next(uint, IBitsPeer*, uint*);
    HRESULT Skip(uint);
    HRESULT Reset();
    HRESULT Clone(IEnumBitsPeers*);
    HRESULT GetCount(uint*);
}
enum IID_IBitsPeerCacheAdministration = GUID(0x659cdead, 0x489e, 0x11d9, [0xa9, 0xcd, 0x0, 0xd, 0x56, 0x96, 0x52, 0x51]);
interface IBitsPeerCacheAdministration : IUnknown
{
    HRESULT GetMaximumCacheSize(uint*);
    HRESULT SetMaximumCacheSize(uint);
    HRESULT GetMaximumContentAge(uint*);
    HRESULT SetMaximumContentAge(uint);
    HRESULT GetConfigurationFlags(uint*);
    HRESULT SetConfigurationFlags(uint);
    HRESULT EnumRecords(IEnumBitsPeerCacheRecords*);
    HRESULT GetRecord(const(GUID)*, IBitsPeerCacheRecord*);
    HRESULT ClearRecords();
    HRESULT DeleteRecord(const(GUID)*);
    HRESULT DeleteUrl(const(wchar)*);
    HRESULT EnumPeers(IEnumBitsPeers*);
    HRESULT ClearPeers();
    HRESULT DiscoverPeers();
}
enum IID_IBackgroundCopyJob4 = GUID(0x659cdeae, 0x489e, 0x11d9, [0xa9, 0xcd, 0x0, 0xd, 0x56, 0x96, 0x52, 0x51]);
interface IBackgroundCopyJob4 : IBackgroundCopyJob3
{
    HRESULT SetPeerCachingFlags(uint);
    HRESULT GetPeerCachingFlags(uint*);
    HRESULT GetOwnerIntegrityLevel(uint*);
    HRESULT GetOwnerElevationState(BOOL*);
    HRESULT SetMaximumDownloadTime(uint);
    HRESULT GetMaximumDownloadTime(uint*);
}
enum IID_IBackgroundCopyFile3 = GUID(0x659cdeaa, 0x489e, 0x11d9, [0xa9, 0xcd, 0x0, 0xd, 0x56, 0x96, 0x52, 0x51]);
interface IBackgroundCopyFile3 : IBackgroundCopyFile2
{
    HRESULT GetTemporaryName(PWSTR*);
    HRESULT SetValidationState(BOOL);
    HRESULT GetValidationState(BOOL*);
    HRESULT IsDownloadedFromPeer(BOOL*);
}
enum IID_IBackgroundCopyCallback2 = GUID(0x659cdeac, 0x489e, 0x11d9, [0xa9, 0xcd, 0x0, 0xd, 0x56, 0x96, 0x52, 0x51]);
interface IBackgroundCopyCallback2 : IBackgroundCopyCallback
{
    HRESULT FileTransferred(IBackgroundCopyJob, IBackgroundCopyFile);
}
enum CLSID_BackgroundCopyManager4_0 = GUID(0xbb6df56b, 0xcace, 0x11dc, [0x99, 0x92, 0x0, 0x19, 0xb9, 0x3a, 0x3a, 0x84]);
struct BackgroundCopyManager4_0
{
}
enum IID_IBitsTokenOptions = GUID(0x9a2584c3, 0xf7d2, 0x457a, [0x9a, 0x5e, 0x22, 0xb6, 0x7b, 0xff, 0xc7, 0xd2]);
interface IBitsTokenOptions : IUnknown
{
    HRESULT SetHelperTokenFlags(BG_TOKEN);
    HRESULT GetHelperTokenFlags(BG_TOKEN*);
    HRESULT SetHelperToken();
    HRESULT ClearHelperToken();
    HRESULT GetHelperTokenSid(PWSTR*);
}
enum IID_IBackgroundCopyFile4 = GUID(0xef7e0655, 0x7888, 0x4960, [0xb0, 0xe5, 0x73, 0x8, 0x46, 0xe0, 0x34, 0x92]);
interface IBackgroundCopyFile4 : IBackgroundCopyFile3
{
    HRESULT GetPeerDownloadStats(ulong*, ulong*);
}
enum CLSID_BackgroundCopyManager5_0 = GUID(0x1ecca34c, 0xe88a, 0x44e3, [0x8d, 0x6a, 0x89, 0x21, 0xbd, 0xe9, 0xe4, 0x52]);
struct BackgroundCopyManager5_0
{
}
alias BITS_JOB_TRANSFER_POLICY = int;
enum : int
{
    BITS_JOB_TRANSFER_POLICY_ALWAYS       = 0x800000ff,
    BITS_JOB_TRANSFER_POLICY_NOT_ROAMING  = 0x8000007f,
    BITS_JOB_TRANSFER_POLICY_NO_SURCHARGE = 0x8000006f,
    BITS_JOB_TRANSFER_POLICY_STANDARD     = 0x80000067,
    BITS_JOB_TRANSFER_POLICY_UNRESTRICTED = 0x80000021,
}

alias BITS_JOB_PROPERTY_ID = int;
enum : int
{
    BITS_JOB_PROPERTY_ID_COST_FLAGS                    = 0x00000001,
    BITS_JOB_PROPERTY_NOTIFICATION_CLSID               = 0x00000002,
    BITS_JOB_PROPERTY_DYNAMIC_CONTENT                  = 0x00000003,
    BITS_JOB_PROPERTY_HIGH_PERFORMANCE                 = 0x00000004,
    BITS_JOB_PROPERTY_MAX_DOWNLOAD_SIZE                = 0x00000005,
    BITS_JOB_PROPERTY_USE_STORED_CREDENTIALS           = 0x00000007,
    BITS_JOB_PROPERTY_MINIMUM_NOTIFICATION_INTERVAL_MS = 0x00000009,
    BITS_JOB_PROPERTY_ON_DEMAND_MODE                   = 0x0000000a,
}

union BITS_JOB_PROPERTY_VALUE
{
    uint Dword;
    GUID ClsID;
    BOOL Enable;
    ulong Uint64;
    BG_AUTH_TARGET Target;
}
alias BITS_FILE_PROPERTY_ID = int;
enum : int
{
    BITS_FILE_PROPERTY_ID_HTTP_RESPONSE_HEADERS = 0x00000001,
}

union BITS_FILE_PROPERTY_VALUE
{
    PWSTR String;
}
enum IID_IBackgroundCopyJob5 = GUID(0xe847030c, 0xbbba, 0x4657, [0xaf, 0x6d, 0x48, 0x4a, 0xa4, 0x2b, 0xf1, 0xfe]);
interface IBackgroundCopyJob5 : IBackgroundCopyJob4
{
    HRESULT SetProperty(BITS_JOB_PROPERTY_ID, BITS_JOB_PROPERTY_VALUE);
    HRESULT GetProperty(BITS_JOB_PROPERTY_ID, BITS_JOB_PROPERTY_VALUE*);
}
enum IID_IBackgroundCopyFile5 = GUID(0x85c1657f, 0xdafc, 0x40e8, [0x88, 0x34, 0xdf, 0x18, 0xea, 0x25, 0x71, 0x7e]);
interface IBackgroundCopyFile5 : IBackgroundCopyFile4
{
    HRESULT SetProperty(BITS_FILE_PROPERTY_ID, BITS_FILE_PROPERTY_VALUE);
    HRESULT GetProperty(BITS_FILE_PROPERTY_ID, BITS_FILE_PROPERTY_VALUE*);
}
enum CLSID_BackgroundCopyManager10_1 = GUID(0x4bd3e4e1, 0x7bd4, 0x4a2b, [0x99, 0x64, 0x49, 0x64, 0x0, 0xde, 0x51, 0x93]);
struct BackgroundCopyManager10_1
{
}
enum IID_IBackgroundCopyCallback3 = GUID(0x98c97bd2, 0xe32b, 0x4ad8, [0xa5, 0x28, 0x95, 0xfd, 0x8b, 0x16, 0xbd, 0x42]);
interface IBackgroundCopyCallback3 : IBackgroundCopyCallback2
{
    HRESULT FileRangesTransferred(IBackgroundCopyJob, IBackgroundCopyFile, uint, const(BG_FILE_RANGE)*);
}
enum IID_IBackgroundCopyFile6 = GUID(0xcf6784f7, 0xd677, 0x49fd, [0x93, 0x68, 0xcb, 0x47, 0xae, 0xe9, 0xd1, 0xad]);
interface IBackgroundCopyFile6 : IBackgroundCopyFile5
{
    HRESULT UpdateDownloadPosition(ulong);
    HRESULT RequestFileRanges(uint, const(BG_FILE_RANGE)*);
    HRESULT GetFilledFileRanges(uint*, BG_FILE_RANGE**);
}
enum CLSID_BackgroundCopyManager10_2 = GUID(0x4575438f, 0xa6c8, 0x4976, [0xb0, 0xfe, 0x2f, 0x26, 0xb8, 0xd, 0x95, 0x9e]);
struct BackgroundCopyManager10_2
{
}
enum IID_IBackgroundCopyJobHttpOptions2 = GUID(0xb591a192, 0xa405, 0x4fc3, [0x83, 0x23, 0x4c, 0x5c, 0x54, 0x25, 0x78, 0xfc]);
interface IBackgroundCopyJobHttpOptions2 : IBackgroundCopyJobHttpOptions
{
    HRESULT SetHttpMethod(const(wchar)*);
    HRESULT GetHttpMethod(PWSTR*);
}
enum CLSID_BackgroundCopyManager10_3 = GUID(0x5fd42ad5, 0xc04e, 0x4d36, [0xad, 0xc7, 0xe0, 0x8f, 0xf1, 0x57, 0x37, 0xad]);
struct BackgroundCopyManager10_3
{
}
enum IID_IBackgroundCopyServerCertificateValidationCallback = GUID(0x4cec0d02, 0xdef7, 0x4158, [0x81, 0x3a, 0xc3, 0x2a, 0x46, 0x94, 0x5f, 0xf7]);
interface IBackgroundCopyServerCertificateValidationCallback : IUnknown
{
    HRESULT ValidateServerCertificate(IBackgroundCopyJob, IBackgroundCopyFile, uint, const(ubyte)*, uint, uint, const(ubyte)*);
}
enum IID_IBackgroundCopyJobHttpOptions3 = GUID(0x8a9263d3, 0xfd4c, 0x4eda, [0x9b, 0x28, 0x30, 0x13, 0x2a, 0x4d, 0x4e, 0x3c]);
interface IBackgroundCopyJobHttpOptions3 : IBackgroundCopyJobHttpOptions2
{
    HRESULT SetServerCertificateValidationInterface(IUnknown);
    HRESULT MakeCustomHeadersWriteOnly();
}
enum CLSID_BITSExtensionSetupFactory = GUID(0xefbbab68, 0x7286, 0x4783, [0x94, 0xbf, 0x94, 0x61, 0xd8, 0xb7, 0xe7, 0xe9]);
struct BITSExtensionSetupFactory
{
}
enum IID_IBITSExtensionSetup = GUID(0x29cfbbf7, 0x9e4, 0x4b97, [0xb0, 0xbc, 0xf2, 0x28, 0x7e, 0x3d, 0x8e, 0xb3]);
interface IBITSExtensionSetup : IDispatch
{
    HRESULT EnableBITSUploads();
    HRESULT DisableBITSUploads();
    HRESULT GetCleanupTaskName(BSTR*);
    HRESULT GetCleanupTask(const(GUID)*, IUnknown*);
}
enum IID_IBITSExtensionSetupFactory = GUID(0xd5d2d542, 0x5503, 0x4e64, [0x8b, 0x48, 0x72, 0xef, 0x91, 0xa3, 0x2e, 0xe1]);
interface IBITSExtensionSetupFactory : IDispatch
{
    HRESULT GetObject(BSTR, IBITSExtensionSetup*);
}
enum CLSID_BackgroundCopyQMgr = GUID(0x69ad4aee, 0x51be, 0x439b, [0xa9, 0x2c, 0x86, 0xae, 0x49, 0xe, 0x8b, 0x30]);
struct BackgroundCopyQMgr
{
}
struct FILESETINFO
{
    BSTR bstrRemoteFile;
    BSTR bstrLocalFile;
    uint dwSizeHint;
}
enum IID_IBackgroundCopyJob1 = GUID(0x59f5553c, 0x2031, 0x4629, [0xbb, 0x18, 0x26, 0x45, 0xa6, 0x97, 0x9, 0x47]);
interface IBackgroundCopyJob1 : IUnknown
{
    HRESULT CancelJob();
    HRESULT GetProgress(uint, uint*);
    HRESULT GetStatus(uint*, uint*, uint*, uint*);
    HRESULT AddFiles(uint, FILESETINFO**);
    HRESULT GetFile(uint, FILESETINFO*);
    HRESULT GetFileCount(uint*);
    HRESULT SwitchToForeground();
    HRESULT get_JobID(GUID*);
}
enum IID_IEnumBackgroundCopyJobs1 = GUID(0x8baeba9d, 0x8f1c, 0x42c4, [0xb8, 0x2c, 0x9, 0xae, 0x79, 0x98, 0xd, 0x25]);
interface IEnumBackgroundCopyJobs1 : IUnknown
{
    HRESULT Next(uint, GUID*, uint*);
    HRESULT Skip(uint);
    HRESULT Reset();
    HRESULT Clone(IEnumBackgroundCopyJobs1*);
    HRESULT GetCount(uint*);
}
alias GROUPPROP = int;
enum : int
{
    GROUPPROP_PRIORITY        = 0x00000000,
    GROUPPROP_REMOTEUSERID    = 0x00000001,
    GROUPPROP_REMOTEUSERPWD   = 0x00000002,
    GROUPPROP_LOCALUSERID     = 0x00000003,
    GROUPPROP_LOCALUSERPWD    = 0x00000004,
    GROUPPROP_PROTOCOLFLAGS   = 0x00000005,
    GROUPPROP_NOTIFYFLAGS     = 0x00000006,
    GROUPPROP_NOTIFYCLSID     = 0x00000007,
    GROUPPROP_PROGRESSSIZE    = 0x00000008,
    GROUPPROP_PROGRESSPERCENT = 0x00000009,
    GROUPPROP_PROGRESSTIME    = 0x0000000a,
    GROUPPROP_DISPLAYNAME     = 0x0000000b,
    GROUPPROP_DESCRIPTION     = 0x0000000c,
}

enum IID_IBackgroundCopyGroup = GUID(0x1ded80a7, 0x53ea, 0x424f, [0x8a, 0x4, 0x17, 0xfe, 0xa9, 0xad, 0xc4, 0xf5]);
interface IBackgroundCopyGroup : IUnknown
{
    HRESULT GetProp(GROUPPROP, VARIANT*);
    HRESULT SetProp(GROUPPROP, VARIANT*);
    HRESULT GetProgress(uint, uint*);
    HRESULT GetStatus(uint*, uint*);
    HRESULT GetJob(GUID, IBackgroundCopyJob1*);
    HRESULT SuspendGroup();
    HRESULT ResumeGroup();
    HRESULT CancelGroup();
    HRESULT get_Size(uint*);
    HRESULT get_GroupID(GUID*);
    HRESULT CreateJob(GUID, IBackgroundCopyJob1*);
    HRESULT EnumJobs(uint, IEnumBackgroundCopyJobs1*);
    HRESULT SwitchToForeground();
    HRESULT QueryNewJobInterface(const(GUID)*, IUnknown*);
    HRESULT SetNotificationPointer(const(GUID)*, IUnknown);
}
enum IID_IEnumBackgroundCopyGroups = GUID(0xd993e603, 0x4aa4, 0x47c5, [0x86, 0x65, 0xc2, 0xd, 0x39, 0xc2, 0xba, 0x4f]);
interface IEnumBackgroundCopyGroups : IUnknown
{
    HRESULT Next(uint, GUID*, uint*);
    HRESULT Skip(uint);
    HRESULT Reset();
    HRESULT Clone(IEnumBackgroundCopyGroups*);
    HRESULT GetCount(uint*);
}
enum IID_IBackgroundCopyCallback1 = GUID(0x84f6593, 0x3800, 0x4e08, [0x9b, 0x59, 0x99, 0xfa, 0x59, 0xad, 0xdf, 0x82]);
interface IBackgroundCopyCallback1 : IUnknown
{
    HRESULT OnStatus(IBackgroundCopyGroup, IBackgroundCopyJob1, uint, uint, uint, uint, uint);
    HRESULT OnProgress(uint, IBackgroundCopyGroup, IBackgroundCopyJob1, uint, uint);
    HRESULT OnProgressEx(uint, IBackgroundCopyGroup, IBackgroundCopyJob1, uint, uint, uint, ubyte*);
}
enum IID_IBackgroundCopyQMgr = GUID(0x16f41c69, 0x9f5, 0x41d2, [0x8c, 0xd8, 0x3c, 0x8, 0xc4, 0x7b, 0xc8, 0xa8]);
interface IBackgroundCopyQMgr : IUnknown
{
    HRESULT CreateGroup(GUID, IBackgroundCopyGroup*);
    HRESULT GetGroup(GUID, IBackgroundCopyGroup*);
    HRESULT EnumGroups(uint, IEnumBackgroundCopyGroups*);
}
