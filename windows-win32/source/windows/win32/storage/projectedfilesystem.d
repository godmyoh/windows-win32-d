module windows.win32.storage.projectedfilesystem;

import windows.win32.guid : GUID;
import windows.win32.foundation : BOOLEAN, HRESULT, PWSTR;

version (Windows):
extern (Windows):

alias PRJ_NAMESPACE_VIRTUALIZATION_CONTEXT = long;
alias PRJ_DIR_ENTRY_BUFFER_HANDLE = long;
alias PRJ_NOTIFY_TYPES = uint;
enum : uint
{
    PRJ_NOTIFY_NONE                               = 0x00000000,
    PRJ_NOTIFY_SUPPRESS_NOTIFICATIONS             = 0x00000001,
    PRJ_NOTIFY_FILE_OPENED                        = 0x00000002,
    PRJ_NOTIFY_NEW_FILE_CREATED                   = 0x00000004,
    PRJ_NOTIFY_FILE_OVERWRITTEN                   = 0x00000008,
    PRJ_NOTIFY_PRE_DELETE                         = 0x00000010,
    PRJ_NOTIFY_PRE_RENAME                         = 0x00000020,
    PRJ_NOTIFY_PRE_SET_HARDLINK                   = 0x00000040,
    PRJ_NOTIFY_FILE_RENAMED                       = 0x00000080,
    PRJ_NOTIFY_HARDLINK_CREATED                   = 0x00000100,
    PRJ_NOTIFY_FILE_HANDLE_CLOSED_NO_MODIFICATION = 0x00000200,
    PRJ_NOTIFY_FILE_HANDLE_CLOSED_FILE_MODIFIED   = 0x00000400,
    PRJ_NOTIFY_FILE_HANDLE_CLOSED_FILE_DELETED    = 0x00000800,
    PRJ_NOTIFY_FILE_PRE_CONVERT_TO_FULL           = 0x00001000,
    PRJ_NOTIFY_USE_EXISTING_MASK                  = 0xffffffff,
}

alias PRJ_NOTIFICATION = int;
enum : int
{
    PRJ_NOTIFICATION_FILE_OPENED                        = 0x00000002,
    PRJ_NOTIFICATION_NEW_FILE_CREATED                   = 0x00000004,
    PRJ_NOTIFICATION_FILE_OVERWRITTEN                   = 0x00000008,
    PRJ_NOTIFICATION_PRE_DELETE                         = 0x00000010,
    PRJ_NOTIFICATION_PRE_RENAME                         = 0x00000020,
    PRJ_NOTIFICATION_PRE_SET_HARDLINK                   = 0x00000040,
    PRJ_NOTIFICATION_FILE_RENAMED                       = 0x00000080,
    PRJ_NOTIFICATION_HARDLINK_CREATED                   = 0x00000100,
    PRJ_NOTIFICATION_FILE_HANDLE_CLOSED_NO_MODIFICATION = 0x00000200,
    PRJ_NOTIFICATION_FILE_HANDLE_CLOSED_FILE_MODIFIED   = 0x00000400,
    PRJ_NOTIFICATION_FILE_HANDLE_CLOSED_FILE_DELETED    = 0x00000800,
    PRJ_NOTIFICATION_FILE_PRE_CONVERT_TO_FULL           = 0x00001000,
}

alias PRJ_EXT_INFO_TYPE = int;
enum : int
{
    PRJ_EXT_INFO_TYPE_SYMLINK = 0x00000001,
}

struct PRJ_EXTENDED_INFO
{
    PRJ_EXT_INFO_TYPE InfoType;
    uint NextInfoOffset;
    union
    {
        struct Symlink
        {
            const(wchar)* TargetName;
        }
    }
}
struct PRJ_NOTIFICATION_MAPPING
{
    PRJ_NOTIFY_TYPES NotificationBitMask;
    const(wchar)* NotificationRoot;
}
alias PRJ_STARTVIRTUALIZING_FLAGS = int;
enum : int
{
    PRJ_FLAG_NONE                    = 0x00000000,
    PRJ_FLAG_USE_NEGATIVE_PATH_CACHE = 0x00000001,
}

struct PRJ_STARTVIRTUALIZING_OPTIONS
{
    PRJ_STARTVIRTUALIZING_FLAGS Flags;
    uint PoolThreadCount;
    uint ConcurrentThreadCount;
    PRJ_NOTIFICATION_MAPPING* NotificationMappings;
    uint NotificationMappingsCount;
}
struct PRJ_VIRTUALIZATION_INSTANCE_INFO
{
    GUID InstanceID;
    uint WriteAlignment;
}
alias PRJ_PLACEHOLDER_ID = int;
enum : int
{
    PRJ_PLACEHOLDER_ID_LENGTH = 0x00000080,
}

struct PRJ_PLACEHOLDER_VERSION_INFO
{
    ubyte[128] ProviderID;
    ubyte[128] ContentID;
}
struct PRJ_FILE_BASIC_INFO
{
    BOOLEAN IsDirectory;
    long FileSize;
    long CreationTime;
    long LastAccessTime;
    long LastWriteTime;
    long ChangeTime;
    uint FileAttributes;
}
struct PRJ_PLACEHOLDER_INFO
{
    PRJ_FILE_BASIC_INFO FileBasicInfo;
    struct EaInformation
    {
        uint EaBufferSize;
        uint OffsetToFirstEa;
    }
    struct SecurityInformation
    {
        uint SecurityBufferSize;
        uint OffsetToSecurityDescriptor;
    }
    struct StreamsInformation
    {
        uint StreamsInfoBufferSize;
        uint OffsetToFirstStreamInfo;
    }
    PRJ_PLACEHOLDER_VERSION_INFO VersionInfo;
    ubyte[1] VariableData;
}
alias PRJ_UPDATE_TYPES = int;
enum : int
{
    PRJ_UPDATE_NONE                 = 0x00000000,
    PRJ_UPDATE_ALLOW_DIRTY_METADATA = 0x00000001,
    PRJ_UPDATE_ALLOW_DIRTY_DATA     = 0x00000002,
    PRJ_UPDATE_ALLOW_TOMBSTONE      = 0x00000004,
    PRJ_UPDATE_RESERVED1            = 0x00000008,
    PRJ_UPDATE_RESERVED2            = 0x00000010,
    PRJ_UPDATE_ALLOW_READ_ONLY      = 0x00000020,
    PRJ_UPDATE_MAX_VAL              = 0x00000040,
}

alias PRJ_UPDATE_FAILURE_CAUSES = int;
enum : int
{
    PRJ_UPDATE_FAILURE_CAUSE_NONE           = 0x00000000,
    PRJ_UPDATE_FAILURE_CAUSE_DIRTY_METADATA = 0x00000001,
    PRJ_UPDATE_FAILURE_CAUSE_DIRTY_DATA     = 0x00000002,
    PRJ_UPDATE_FAILURE_CAUSE_TOMBSTONE      = 0x00000004,
    PRJ_UPDATE_FAILURE_CAUSE_READ_ONLY      = 0x00000008,
}

alias PRJ_FILE_STATE = int;
enum : int
{
    PRJ_FILE_STATE_PLACEHOLDER          = 0x00000001,
    PRJ_FILE_STATE_HYDRATED_PLACEHOLDER = 0x00000002,
    PRJ_FILE_STATE_DIRTY_PLACEHOLDER    = 0x00000004,
    PRJ_FILE_STATE_FULL                 = 0x00000008,
    PRJ_FILE_STATE_TOMBSTONE            = 0x00000010,
}

alias PRJ_CALLBACK_DATA_FLAGS = int;
enum : int
{
    PRJ_CB_DATA_FLAG_ENUM_RESTART_SCAN        = 0x00000001,
    PRJ_CB_DATA_FLAG_ENUM_RETURN_SINGLE_ENTRY = 0x00000002,
}

struct PRJ_CALLBACK_DATA
{
    uint Size;
    PRJ_CALLBACK_DATA_FLAGS Flags;
    PRJ_NAMESPACE_VIRTUALIZATION_CONTEXT NamespaceVirtualizationContext;
    int CommandId;
    GUID FileId;
    GUID DataStreamId;
    const(wchar)* FilePathName;
    PRJ_PLACEHOLDER_VERSION_INFO* VersionInfo;
    uint TriggeringProcessId;
    const(wchar)* TriggeringProcessImageFileName;
    void* InstanceContext;
}
alias PRJ_START_DIRECTORY_ENUMERATION_CB = HRESULT function(const(PRJ_CALLBACK_DATA)*, const(GUID)*);
alias PRJ_GET_DIRECTORY_ENUMERATION_CB = HRESULT function(const(PRJ_CALLBACK_DATA)*, const(GUID)*, const(wchar)*, PRJ_DIR_ENTRY_BUFFER_HANDLE);
alias PRJ_END_DIRECTORY_ENUMERATION_CB = HRESULT function(const(PRJ_CALLBACK_DATA)*, const(GUID)*);
alias PRJ_GET_PLACEHOLDER_INFO_CB = HRESULT function(const(PRJ_CALLBACK_DATA)*);
alias PRJ_GET_FILE_DATA_CB = HRESULT function(const(PRJ_CALLBACK_DATA)*, ulong, uint);
alias PRJ_QUERY_FILE_NAME_CB = HRESULT function(const(PRJ_CALLBACK_DATA)*);
union PRJ_NOTIFICATION_PARAMETERS
{
    struct PostCreate
    {
        PRJ_NOTIFY_TYPES NotificationMask;
    }
    struct FileRenamed
    {
        PRJ_NOTIFY_TYPES NotificationMask;
    }
    struct FileDeletedOnHandleClose
    {
        BOOLEAN IsFileModified;
    }
}
alias PRJ_NOTIFICATION_CB = HRESULT function(const(PRJ_CALLBACK_DATA)*, BOOLEAN, PRJ_NOTIFICATION, const(wchar)*, PRJ_NOTIFICATION_PARAMETERS*);
alias PRJ_CANCEL_COMMAND_CB = void function(const(PRJ_CALLBACK_DATA)*);
struct PRJ_CALLBACKS
{
    PRJ_START_DIRECTORY_ENUMERATION_CB StartDirectoryEnumerationCallback;
    PRJ_END_DIRECTORY_ENUMERATION_CB EndDirectoryEnumerationCallback;
    PRJ_GET_DIRECTORY_ENUMERATION_CB GetDirectoryEnumerationCallback;
    PRJ_GET_PLACEHOLDER_INFO_CB GetPlaceholderInfoCallback;
    PRJ_GET_FILE_DATA_CB GetFileDataCallback;
    PRJ_QUERY_FILE_NAME_CB QueryFileNameCallback;
    PRJ_NOTIFICATION_CB NotificationCallback;
    PRJ_CANCEL_COMMAND_CB CancelCommandCallback;
}
alias PRJ_COMPLETE_COMMAND_TYPE = int;
enum : int
{
    PRJ_COMPLETE_COMMAND_TYPE_NOTIFICATION = 0x00000001,
    PRJ_COMPLETE_COMMAND_TYPE_ENUMERATION  = 0x00000002,
}

struct PRJ_COMPLETE_COMMAND_EXTENDED_PARAMETERS
{
    PRJ_COMPLETE_COMMAND_TYPE CommandType;
    union
    {
        struct Notification
        {
            PRJ_NOTIFY_TYPES NotificationMask;
        }
        struct Enumeration
        {
            PRJ_DIR_ENTRY_BUFFER_HANDLE DirEntryBufferHandle;
        }
    }
}
HRESULT PrjStartVirtualizing(const(wchar)*, const(PRJ_CALLBACKS)*, const(void)*, const(PRJ_STARTVIRTUALIZING_OPTIONS)*, PRJ_NAMESPACE_VIRTUALIZATION_CONTEXT*);
void PrjStopVirtualizing(PRJ_NAMESPACE_VIRTUALIZATION_CONTEXT);
HRESULT PrjClearNegativePathCache(PRJ_NAMESPACE_VIRTUALIZATION_CONTEXT, uint*);
HRESULT PrjGetVirtualizationInstanceInfo(PRJ_NAMESPACE_VIRTUALIZATION_CONTEXT, PRJ_VIRTUALIZATION_INSTANCE_INFO*);
HRESULT PrjMarkDirectoryAsPlaceholder(const(wchar)*, const(wchar)*, const(PRJ_PLACEHOLDER_VERSION_INFO)*, const(GUID)*);
HRESULT PrjWritePlaceholderInfo(PRJ_NAMESPACE_VIRTUALIZATION_CONTEXT, const(wchar)*, const(PRJ_PLACEHOLDER_INFO)*, uint);
HRESULT PrjWritePlaceholderInfo2(PRJ_NAMESPACE_VIRTUALIZATION_CONTEXT, const(wchar)*, const(PRJ_PLACEHOLDER_INFO)*, uint, const(PRJ_EXTENDED_INFO)*);
HRESULT PrjUpdateFileIfNeeded(PRJ_NAMESPACE_VIRTUALIZATION_CONTEXT, const(wchar)*, const(PRJ_PLACEHOLDER_INFO)*, uint, PRJ_UPDATE_TYPES, PRJ_UPDATE_FAILURE_CAUSES*);
HRESULT PrjDeleteFile(PRJ_NAMESPACE_VIRTUALIZATION_CONTEXT, const(wchar)*, PRJ_UPDATE_TYPES, PRJ_UPDATE_FAILURE_CAUSES*);
HRESULT PrjWriteFileData(PRJ_NAMESPACE_VIRTUALIZATION_CONTEXT, const(GUID)*, void*, ulong, uint);
HRESULT PrjGetOnDiskFileState(const(wchar)*, PRJ_FILE_STATE*);
void* PrjAllocateAlignedBuffer(PRJ_NAMESPACE_VIRTUALIZATION_CONTEXT, ulong);
void PrjFreeAlignedBuffer(void*);
HRESULT PrjCompleteCommand(PRJ_NAMESPACE_VIRTUALIZATION_CONTEXT, int, HRESULT, PRJ_COMPLETE_COMMAND_EXTENDED_PARAMETERS*);
HRESULT PrjFillDirEntryBuffer(const(wchar)*, PRJ_FILE_BASIC_INFO*, PRJ_DIR_ENTRY_BUFFER_HANDLE);
HRESULT PrjFillDirEntryBuffer2(PRJ_DIR_ENTRY_BUFFER_HANDLE, const(wchar)*, PRJ_FILE_BASIC_INFO*, PRJ_EXTENDED_INFO*);
BOOLEAN PrjFileNameMatch(const(wchar)*, const(wchar)*);
int PrjFileNameCompare(const(wchar)*, const(wchar)*);
BOOLEAN PrjDoesNameContainWildCards(const(wchar)*);
