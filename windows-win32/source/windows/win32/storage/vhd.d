module windows.win32.storage.vhd;

import windows.win32.guid : GUID;
import windows.win32.foundation : BOOL, HANDLE, PWSTR, WIN32_ERROR;
import windows.win32.security_ : PSECURITY_DESCRIPTOR;
import windows.win32.system.io : OVERLAPPED;

version (Windows):
extern (Windows):

WIN32_ERROR OpenVirtualDisk(VIRTUAL_STORAGE_TYPE*, const(wchar)*, VIRTUAL_DISK_ACCESS_MASK, OPEN_VIRTUAL_DISK_FLAG, OPEN_VIRTUAL_DISK_PARAMETERS*, HANDLE*);
WIN32_ERROR CreateVirtualDisk(VIRTUAL_STORAGE_TYPE*, const(wchar)*, VIRTUAL_DISK_ACCESS_MASK, PSECURITY_DESCRIPTOR, CREATE_VIRTUAL_DISK_FLAG, uint, CREATE_VIRTUAL_DISK_PARAMETERS*, OVERLAPPED*, HANDLE*);
WIN32_ERROR AttachVirtualDisk(HANDLE, PSECURITY_DESCRIPTOR, ATTACH_VIRTUAL_DISK_FLAG, uint, ATTACH_VIRTUAL_DISK_PARAMETERS*, OVERLAPPED*);
WIN32_ERROR DetachVirtualDisk(HANDLE, DETACH_VIRTUAL_DISK_FLAG, uint);
WIN32_ERROR GetVirtualDiskPhysicalPath(HANDLE, uint*, PWSTR);
WIN32_ERROR GetAllAttachedVirtualDiskPhysicalPaths(uint*, PWSTR);
WIN32_ERROR GetStorageDependencyInformation(HANDLE, GET_STORAGE_DEPENDENCY_FLAG, uint, STORAGE_DEPENDENCY_INFO*, uint*);
WIN32_ERROR GetVirtualDiskInformation(HANDLE, uint*, GET_VIRTUAL_DISK_INFO*, uint*);
WIN32_ERROR SetVirtualDiskInformation(HANDLE, SET_VIRTUAL_DISK_INFO*);
WIN32_ERROR EnumerateVirtualDiskMetadata(HANDLE, uint*, GUID*);
WIN32_ERROR GetVirtualDiskMetadata(HANDLE, const(GUID)*, uint*, void*);
WIN32_ERROR SetVirtualDiskMetadata(HANDLE, const(GUID)*, uint, const(void)*);
WIN32_ERROR DeleteVirtualDiskMetadata(HANDLE, const(GUID)*);
WIN32_ERROR GetVirtualDiskOperationProgress(HANDLE, OVERLAPPED*, VIRTUAL_DISK_PROGRESS*);
WIN32_ERROR CompactVirtualDisk(HANDLE, COMPACT_VIRTUAL_DISK_FLAG, COMPACT_VIRTUAL_DISK_PARAMETERS*, OVERLAPPED*);
WIN32_ERROR MergeVirtualDisk(HANDLE, MERGE_VIRTUAL_DISK_FLAG, MERGE_VIRTUAL_DISK_PARAMETERS*, OVERLAPPED*);
WIN32_ERROR ExpandVirtualDisk(HANDLE, EXPAND_VIRTUAL_DISK_FLAG, EXPAND_VIRTUAL_DISK_PARAMETERS*, OVERLAPPED*);
WIN32_ERROR ResizeVirtualDisk(HANDLE, RESIZE_VIRTUAL_DISK_FLAG, RESIZE_VIRTUAL_DISK_PARAMETERS*, OVERLAPPED*);
WIN32_ERROR MirrorVirtualDisk(HANDLE, MIRROR_VIRTUAL_DISK_FLAG, MIRROR_VIRTUAL_DISK_PARAMETERS*, OVERLAPPED*);
WIN32_ERROR BreakMirrorVirtualDisk(HANDLE);
WIN32_ERROR AddVirtualDiskParent(HANDLE, const(wchar)*);
WIN32_ERROR QueryChangesVirtualDisk(HANDLE, const(wchar)*, ulong, ulong, QUERY_CHANGES_VIRTUAL_DISK_FLAG, QUERY_CHANGES_VIRTUAL_DISK_RANGE*, uint*, ulong*);
WIN32_ERROR TakeSnapshotVhdSet(HANDLE, const(TAKE_SNAPSHOT_VHDSET_PARAMETERS)*, TAKE_SNAPSHOT_VHDSET_FLAG);
WIN32_ERROR DeleteSnapshotVhdSet(HANDLE, const(DELETE_SNAPSHOT_VHDSET_PARAMETERS)*, DELETE_SNAPSHOT_VHDSET_FLAG);
WIN32_ERROR ModifyVhdSet(HANDLE, const(MODIFY_VHDSET_PARAMETERS)*, MODIFY_VHDSET_FLAG);
WIN32_ERROR ApplySnapshotVhdSet(HANDLE, const(APPLY_SNAPSHOT_VHDSET_PARAMETERS)*, APPLY_SNAPSHOT_VHDSET_FLAG);
WIN32_ERROR RawSCSIVirtualDisk(HANDLE, const(RAW_SCSI_VIRTUAL_DISK_PARAMETERS)*, RAW_SCSI_VIRTUAL_DISK_FLAG, RAW_SCSI_VIRTUAL_DISK_RESPONSE*);
WIN32_ERROR ForkVirtualDisk(HANDLE, FORK_VIRTUAL_DISK_FLAG, const(FORK_VIRTUAL_DISK_PARAMETERS)*, OVERLAPPED*);
WIN32_ERROR CompleteForkVirtualDisk(HANDLE);
enum VIRTUAL_STORAGE_TYPE_VENDOR_UNKNOWN = GUID(0x0, 0x0, 0x0, [0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0]);
enum VIRTUAL_STORAGE_TYPE_VENDOR_MICROSOFT = GUID(0xec984aec, 0xa0f9, 0x47e9, [0x90, 0x1f, 0x71, 0x41, 0x5a, 0x66, 0x34, 0x5b]);
enum VIRTUAL_STORAGE_TYPE_DEVICE_UNKNOWN = 0x00000000;
enum VIRTUAL_STORAGE_TYPE_DEVICE_ISO = 0x00000001;
enum VIRTUAL_STORAGE_TYPE_DEVICE_VHD = 0x00000002;
enum VIRTUAL_STORAGE_TYPE_DEVICE_VHDX = 0x00000003;
enum VIRTUAL_STORAGE_TYPE_DEVICE_VHDSET = 0x00000004;
enum OPEN_VIRTUAL_DISK_RW_DEPTH_DEFAULT = 0x00000001;
enum CREATE_VIRTUAL_DISK_PARAMETERS_DEFAULT_BLOCK_SIZE = 0x00000000;
enum CREATE_VIRTUAL_DISK_PARAMETERS_DEFAULT_SECTOR_SIZE = 0x00000000;
enum VIRTUAL_DISK_MAXIMUM_CHANGE_TRACKING_ID_LENGTH = 0x00000100;
enum MERGE_VIRTUAL_DISK_DEFAULT_MERGE_DEPTH = 0x00000001;
struct VIRTUAL_STORAGE_TYPE
{
    uint DeviceId;
    GUID VendorId;
}
alias OPEN_VIRTUAL_DISK_VERSION = int;
enum : int
{
    OPEN_VIRTUAL_DISK_VERSION_UNSPECIFIED = 0x00000000,
    OPEN_VIRTUAL_DISK_VERSION_1           = 0x00000001,
    OPEN_VIRTUAL_DISK_VERSION_2           = 0x00000002,
    OPEN_VIRTUAL_DISK_VERSION_3           = 0x00000003,
}

struct OPEN_VIRTUAL_DISK_PARAMETERS
{
    OPEN_VIRTUAL_DISK_VERSION Version;
    union
    {
        struct _Version1_e__Struct
        {
            uint RWDepth;
        }
        struct _Version2_e__Struct
        {
            BOOL GetInfoOnly;
            BOOL ReadOnly;
            GUID ResiliencyGuid;
        }
        struct _Version3_e__Struct
        {
            BOOL GetInfoOnly;
            BOOL ReadOnly;
            GUID ResiliencyGuid;
            GUID SnapshotId;
        }
    }
}
alias VIRTUAL_DISK_ACCESS_MASK = uint;
enum : uint
{
    VIRTUAL_DISK_ACCESS_NONE      = 0x00000000,
    VIRTUAL_DISK_ACCESS_ATTACH_RO = 0x00010000,
    VIRTUAL_DISK_ACCESS_ATTACH_RW = 0x00020000,
    VIRTUAL_DISK_ACCESS_DETACH    = 0x00040000,
    VIRTUAL_DISK_ACCESS_GET_INFO  = 0x00080000,
    VIRTUAL_DISK_ACCESS_CREATE    = 0x00100000,
    VIRTUAL_DISK_ACCESS_METAOPS   = 0x00200000,
    VIRTUAL_DISK_ACCESS_READ      = 0x000d0000,
    VIRTUAL_DISK_ACCESS_ALL       = 0x003f0000,
    VIRTUAL_DISK_ACCESS_WRITABLE  = 0x00320000,
}

alias OPEN_VIRTUAL_DISK_FLAG = uint;
enum : uint
{
    OPEN_VIRTUAL_DISK_FLAG_NONE                           = 0x00000000,
    OPEN_VIRTUAL_DISK_FLAG_NO_PARENTS                     = 0x00000001,
    OPEN_VIRTUAL_DISK_FLAG_BLANK_FILE                     = 0x00000002,
    OPEN_VIRTUAL_DISK_FLAG_BOOT_DRIVE                     = 0x00000004,
    OPEN_VIRTUAL_DISK_FLAG_CACHED_IO                      = 0x00000008,
    OPEN_VIRTUAL_DISK_FLAG_CUSTOM_DIFF_CHAIN              = 0x00000010,
    OPEN_VIRTUAL_DISK_FLAG_PARENT_CACHED_IO               = 0x00000020,
    OPEN_VIRTUAL_DISK_FLAG_VHDSET_FILE_ONLY               = 0x00000040,
    OPEN_VIRTUAL_DISK_FLAG_IGNORE_RELATIVE_PARENT_LOCATOR = 0x00000080,
    OPEN_VIRTUAL_DISK_FLAG_NO_WRITE_HARDENING             = 0x00000100,
    OPEN_VIRTUAL_DISK_FLAG_SUPPORT_COMPRESSED_VOLUMES     = 0x00000200,
    OPEN_VIRTUAL_DISK_FLAG_SUPPORT_SPARSE_FILES_ANY_FS    = 0x00000400,
    OPEN_VIRTUAL_DISK_FLAG_SUPPORT_ENCRYPTED_FILES        = 0x00000800,
}

alias CREATE_VIRTUAL_DISK_VERSION = int;
enum : int
{
    CREATE_VIRTUAL_DISK_VERSION_UNSPECIFIED = 0x00000000,
    CREATE_VIRTUAL_DISK_VERSION_1           = 0x00000001,
    CREATE_VIRTUAL_DISK_VERSION_2           = 0x00000002,
    CREATE_VIRTUAL_DISK_VERSION_3           = 0x00000003,
    CREATE_VIRTUAL_DISK_VERSION_4           = 0x00000004,
}

struct CREATE_VIRTUAL_DISK_PARAMETERS
{
    CREATE_VIRTUAL_DISK_VERSION Version;
    union
    {
        struct _Version1_e__Struct
        {
            GUID UniqueId;
            ulong MaximumSize;
            uint BlockSizeInBytes;
            uint SectorSizeInBytes;
            const(wchar)* ParentPath;
            const(wchar)* SourcePath;
        }
        struct _Version2_e__Struct
        {
            GUID UniqueId;
            ulong MaximumSize;
            uint BlockSizeInBytes;
            uint SectorSizeInBytes;
            uint PhysicalSectorSizeInBytes;
            const(wchar)* ParentPath;
            const(wchar)* SourcePath;
            OPEN_VIRTUAL_DISK_FLAG OpenFlags;
            VIRTUAL_STORAGE_TYPE ParentVirtualStorageType;
            VIRTUAL_STORAGE_TYPE SourceVirtualStorageType;
            GUID ResiliencyGuid;
        }
        struct _Version3_e__Struct
        {
            GUID UniqueId;
            ulong MaximumSize;
            uint BlockSizeInBytes;
            uint SectorSizeInBytes;
            uint PhysicalSectorSizeInBytes;
            const(wchar)* ParentPath;
            const(wchar)* SourcePath;
            OPEN_VIRTUAL_DISK_FLAG OpenFlags;
            VIRTUAL_STORAGE_TYPE ParentVirtualStorageType;
            VIRTUAL_STORAGE_TYPE SourceVirtualStorageType;
            GUID ResiliencyGuid;
            const(wchar)* SourceLimitPath;
            VIRTUAL_STORAGE_TYPE BackingStorageType;
        }
        struct _Version4_e__Struct
        {
            GUID UniqueId;
            ulong MaximumSize;
            uint BlockSizeInBytes;
            uint SectorSizeInBytes;
            uint PhysicalSectorSizeInBytes;
            const(wchar)* ParentPath;
            const(wchar)* SourcePath;
            OPEN_VIRTUAL_DISK_FLAG OpenFlags;
            VIRTUAL_STORAGE_TYPE ParentVirtualStorageType;
            VIRTUAL_STORAGE_TYPE SourceVirtualStorageType;
            GUID ResiliencyGuid;
            const(wchar)* SourceLimitPath;
            VIRTUAL_STORAGE_TYPE BackingStorageType;
            GUID PmemAddressAbstractionType;
            ulong DataAlignment;
        }
    }
}
alias CREATE_VIRTUAL_DISK_FLAG = uint;
enum : uint
{
    CREATE_VIRTUAL_DISK_FLAG_NONE                                  = 0x00000000,
    CREATE_VIRTUAL_DISK_FLAG_FULL_PHYSICAL_ALLOCATION              = 0x00000001,
    CREATE_VIRTUAL_DISK_FLAG_PREVENT_WRITES_TO_SOURCE_DISK         = 0x00000002,
    CREATE_VIRTUAL_DISK_FLAG_DO_NOT_COPY_METADATA_FROM_PARENT      = 0x00000004,
    CREATE_VIRTUAL_DISK_FLAG_CREATE_BACKING_STORAGE                = 0x00000008,
    CREATE_VIRTUAL_DISK_FLAG_USE_CHANGE_TRACKING_SOURCE_LIMIT      = 0x00000010,
    CREATE_VIRTUAL_DISK_FLAG_PRESERVE_PARENT_CHANGE_TRACKING_STATE = 0x00000020,
    CREATE_VIRTUAL_DISK_FLAG_VHD_SET_USE_ORIGINAL_BACKING_STORAGE  = 0x00000040,
    CREATE_VIRTUAL_DISK_FLAG_SPARSE_FILE                           = 0x00000080,
    CREATE_VIRTUAL_DISK_FLAG_PMEM_COMPATIBLE                       = 0x00000100,
    CREATE_VIRTUAL_DISK_FLAG_SUPPORT_COMPRESSED_VOLUMES            = 0x00000200,
    CREATE_VIRTUAL_DISK_FLAG_SUPPORT_SPARSE_FILES_ANY_FS           = 0x00000400,
}

alias ATTACH_VIRTUAL_DISK_VERSION = int;
enum : int
{
    ATTACH_VIRTUAL_DISK_VERSION_UNSPECIFIED = 0x00000000,
    ATTACH_VIRTUAL_DISK_VERSION_1           = 0x00000001,
    ATTACH_VIRTUAL_DISK_VERSION_2           = 0x00000002,
}

struct ATTACH_VIRTUAL_DISK_PARAMETERS
{
    ATTACH_VIRTUAL_DISK_VERSION Version;
    union
    {
        struct _Version1_e__Struct
        {
            uint Reserved;
        }
        struct _Version2_e__Struct
        {
            ulong RestrictedOffset;
            ulong RestrictedLength;
        }
    }
}
alias ATTACH_VIRTUAL_DISK_FLAG = uint;
enum : uint
{
    ATTACH_VIRTUAL_DISK_FLAG_NONE                             = 0x00000000,
    ATTACH_VIRTUAL_DISK_FLAG_READ_ONLY                        = 0x00000001,
    ATTACH_VIRTUAL_DISK_FLAG_NO_DRIVE_LETTER                  = 0x00000002,
    ATTACH_VIRTUAL_DISK_FLAG_PERMANENT_LIFETIME               = 0x00000004,
    ATTACH_VIRTUAL_DISK_FLAG_NO_LOCAL_HOST                    = 0x00000008,
    ATTACH_VIRTUAL_DISK_FLAG_NO_SECURITY_DESCRIPTOR           = 0x00000010,
    ATTACH_VIRTUAL_DISK_FLAG_BYPASS_DEFAULT_ENCRYPTION_POLICY = 0x00000020,
    ATTACH_VIRTUAL_DISK_FLAG_NON_PNP                          = 0x00000040,
    ATTACH_VIRTUAL_DISK_FLAG_RESTRICTED_RANGE                 = 0x00000080,
    ATTACH_VIRTUAL_DISK_FLAG_SINGLE_PARTITION                 = 0x00000100,
    ATTACH_VIRTUAL_DISK_FLAG_REGISTER_VOLUME                  = 0x00000200,
}

alias DETACH_VIRTUAL_DISK_FLAG = uint;
enum : uint
{
    DETACH_VIRTUAL_DISK_FLAG_NONE = 0x00000000,
}

alias DEPENDENT_DISK_FLAG = uint;
enum : uint
{
    DEPENDENT_DISK_FLAG_NONE                       = 0x00000000,
    DEPENDENT_DISK_FLAG_MULT_BACKING_FILES         = 0x00000001,
    DEPENDENT_DISK_FLAG_FULLY_ALLOCATED            = 0x00000002,
    DEPENDENT_DISK_FLAG_READ_ONLY                  = 0x00000004,
    DEPENDENT_DISK_FLAG_REMOTE                     = 0x00000008,
    DEPENDENT_DISK_FLAG_SYSTEM_VOLUME              = 0x00000010,
    DEPENDENT_DISK_FLAG_SYSTEM_VOLUME_PARENT       = 0x00000020,
    DEPENDENT_DISK_FLAG_REMOVABLE                  = 0x00000040,
    DEPENDENT_DISK_FLAG_NO_DRIVE_LETTER            = 0x00000080,
    DEPENDENT_DISK_FLAG_PARENT                     = 0x00000100,
    DEPENDENT_DISK_FLAG_NO_HOST_DISK               = 0x00000200,
    DEPENDENT_DISK_FLAG_PERMANENT_LIFETIME         = 0x00000400,
    DEPENDENT_DISK_FLAG_SUPPORT_COMPRESSED_VOLUMES = 0x00000800,
    DEPENDENT_DISK_FLAG_ALWAYS_ALLOW_SPARSE        = 0x00001000,
    DEPENDENT_DISK_FLAG_SUPPORT_ENCRYPTED_FILES    = 0x00002000,
}

alias STORAGE_DEPENDENCY_INFO_VERSION = int;
enum : int
{
    STORAGE_DEPENDENCY_INFO_VERSION_UNSPECIFIED = 0x00000000,
    STORAGE_DEPENDENCY_INFO_VERSION_1           = 0x00000001,
    STORAGE_DEPENDENCY_INFO_VERSION_2           = 0x00000002,
}

struct STORAGE_DEPENDENCY_INFO_TYPE_1
{
    DEPENDENT_DISK_FLAG DependencyTypeFlags;
    uint ProviderSpecificFlags;
    VIRTUAL_STORAGE_TYPE VirtualStorageType;
}
struct STORAGE_DEPENDENCY_INFO_TYPE_2
{
    DEPENDENT_DISK_FLAG DependencyTypeFlags;
    uint ProviderSpecificFlags;
    VIRTUAL_STORAGE_TYPE VirtualStorageType;
    uint AncestorLevel;
    PWSTR DependencyDeviceName;
    PWSTR HostVolumeName;
    PWSTR DependentVolumeName;
    PWSTR DependentVolumeRelativePath;
}
struct STORAGE_DEPENDENCY_INFO
{
    STORAGE_DEPENDENCY_INFO_VERSION Version;
    uint NumberEntries;
    union
    {
        STORAGE_DEPENDENCY_INFO_TYPE_1[1] Version1Entries;
        STORAGE_DEPENDENCY_INFO_TYPE_2[1] Version2Entries;
    }
}
alias GET_STORAGE_DEPENDENCY_FLAG = uint;
enum : uint
{
    GET_STORAGE_DEPENDENCY_FLAG_NONE         = 0x00000000,
    GET_STORAGE_DEPENDENCY_FLAG_HOST_VOLUMES = 0x00000001,
    GET_STORAGE_DEPENDENCY_FLAG_DISK_HANDLE  = 0x00000002,
}

alias GET_VIRTUAL_DISK_INFO_VERSION = int;
enum : int
{
    GET_VIRTUAL_DISK_INFO_UNSPECIFIED                = 0x00000000,
    GET_VIRTUAL_DISK_INFO_SIZE                       = 0x00000001,
    GET_VIRTUAL_DISK_INFO_IDENTIFIER                 = 0x00000002,
    GET_VIRTUAL_DISK_INFO_PARENT_LOCATION            = 0x00000003,
    GET_VIRTUAL_DISK_INFO_PARENT_IDENTIFIER          = 0x00000004,
    GET_VIRTUAL_DISK_INFO_PARENT_TIMESTAMP           = 0x00000005,
    GET_VIRTUAL_DISK_INFO_VIRTUAL_STORAGE_TYPE       = 0x00000006,
    GET_VIRTUAL_DISK_INFO_PROVIDER_SUBTYPE           = 0x00000007,
    GET_VIRTUAL_DISK_INFO_IS_4K_ALIGNED              = 0x00000008,
    GET_VIRTUAL_DISK_INFO_PHYSICAL_DISK              = 0x00000009,
    GET_VIRTUAL_DISK_INFO_VHD_PHYSICAL_SECTOR_SIZE   = 0x0000000a,
    GET_VIRTUAL_DISK_INFO_SMALLEST_SAFE_VIRTUAL_SIZE = 0x0000000b,
    GET_VIRTUAL_DISK_INFO_FRAGMENTATION              = 0x0000000c,
    GET_VIRTUAL_DISK_INFO_IS_LOADED                  = 0x0000000d,
    GET_VIRTUAL_DISK_INFO_VIRTUAL_DISK_ID            = 0x0000000e,
    GET_VIRTUAL_DISK_INFO_CHANGE_TRACKING_STATE      = 0x0000000f,
}

struct GET_VIRTUAL_DISK_INFO
{
    GET_VIRTUAL_DISK_INFO_VERSION Version;
    union
    {
        struct _Size_e__Struct
        {
            ulong VirtualSize;
            ulong PhysicalSize;
            uint BlockSize;
            uint SectorSize;
        }
        GUID Identifier;
        struct _ParentLocation_e__Struct
        {
            BOOL ParentResolved;
            wchar[1] ParentLocationBuffer;
        }
        GUID ParentIdentifier;
        uint ParentTimestamp;
        VIRTUAL_STORAGE_TYPE VirtualStorageType;
        uint ProviderSubtype;
        BOOL Is4kAligned;
        BOOL IsLoaded;
        struct _PhysicalDisk_e__Struct
        {
            uint LogicalSectorSize;
            uint PhysicalSectorSize;
            BOOL IsRemote;
        }
        uint VhdPhysicalSectorSize;
        ulong SmallestSafeVirtualSize;
        uint FragmentationPercentage;
        GUID VirtualDiskId;
        struct _ChangeTrackingState_e__Struct
        {
            BOOL Enabled;
            BOOL NewerChanges;
            wchar[1] MostRecentId;
        }
    }
}
alias SET_VIRTUAL_DISK_INFO_VERSION = int;
enum : int
{
    SET_VIRTUAL_DISK_INFO_UNSPECIFIED            = 0x00000000,
    SET_VIRTUAL_DISK_INFO_PARENT_PATH            = 0x00000001,
    SET_VIRTUAL_DISK_INFO_IDENTIFIER             = 0x00000002,
    SET_VIRTUAL_DISK_INFO_PARENT_PATH_WITH_DEPTH = 0x00000003,
    SET_VIRTUAL_DISK_INFO_PHYSICAL_SECTOR_SIZE   = 0x00000004,
    SET_VIRTUAL_DISK_INFO_VIRTUAL_DISK_ID        = 0x00000005,
    SET_VIRTUAL_DISK_INFO_CHANGE_TRACKING_STATE  = 0x00000006,
    SET_VIRTUAL_DISK_INFO_PARENT_LOCATOR         = 0x00000007,
}

struct SET_VIRTUAL_DISK_INFO
{
    SET_VIRTUAL_DISK_INFO_VERSION Version;
    union
    {
        const(wchar)* ParentFilePath;
        GUID UniqueIdentifier;
        struct _ParentPathWithDepthInfo_e__Struct
        {
            uint ChildDepth;
            const(wchar)* ParentFilePath;
        }
        uint VhdPhysicalSectorSize;
        GUID VirtualDiskId;
        BOOL ChangeTrackingEnabled;
        struct _ParentLocator_e__Struct
        {
            GUID LinkageId;
            const(wchar)* ParentFilePath;
        }
    }
}
struct VIRTUAL_DISK_PROGRESS
{
    uint OperationStatus;
    ulong CurrentValue;
    ulong CompletionValue;
}
alias COMPACT_VIRTUAL_DISK_VERSION = int;
enum : int
{
    COMPACT_VIRTUAL_DISK_VERSION_UNSPECIFIED = 0x00000000,
    COMPACT_VIRTUAL_DISK_VERSION_1           = 0x00000001,
}

struct COMPACT_VIRTUAL_DISK_PARAMETERS
{
    COMPACT_VIRTUAL_DISK_VERSION Version;
    union
    {
        struct _Version1_e__Struct
        {
            uint Reserved;
        }
    }
}
alias COMPACT_VIRTUAL_DISK_FLAG = uint;
enum : uint
{
    COMPACT_VIRTUAL_DISK_FLAG_NONE           = 0x00000000,
    COMPACT_VIRTUAL_DISK_FLAG_NO_ZERO_SCAN   = 0x00000001,
    COMPACT_VIRTUAL_DISK_FLAG_NO_BLOCK_MOVES = 0x00000002,
}

alias MERGE_VIRTUAL_DISK_VERSION = int;
enum : int
{
    MERGE_VIRTUAL_DISK_VERSION_UNSPECIFIED = 0x00000000,
    MERGE_VIRTUAL_DISK_VERSION_1           = 0x00000001,
    MERGE_VIRTUAL_DISK_VERSION_2           = 0x00000002,
}

struct MERGE_VIRTUAL_DISK_PARAMETERS
{
    MERGE_VIRTUAL_DISK_VERSION Version;
    union
    {
        struct _Version1_e__Struct
        {
            uint MergeDepth;
        }
        struct _Version2_e__Struct
        {
            uint MergeSourceDepth;
            uint MergeTargetDepth;
        }
    }
}
alias MERGE_VIRTUAL_DISK_FLAG = uint;
enum : uint
{
    MERGE_VIRTUAL_DISK_FLAG_NONE = 0x00000000,
}

alias EXPAND_VIRTUAL_DISK_VERSION = int;
enum : int
{
    EXPAND_VIRTUAL_DISK_VERSION_UNSPECIFIED = 0x00000000,
    EXPAND_VIRTUAL_DISK_VERSION_1           = 0x00000001,
}

struct EXPAND_VIRTUAL_DISK_PARAMETERS
{
    EXPAND_VIRTUAL_DISK_VERSION Version;
    union
    {
        struct _Version1_e__Struct
        {
            ulong NewSize;
        }
    }
}
alias EXPAND_VIRTUAL_DISK_FLAG = uint;
enum : uint
{
    EXPAND_VIRTUAL_DISK_FLAG_NONE          = 0x00000000,
    EXPAND_VIRTUAL_DISK_FLAG_NOTIFY_CHANGE = 0x00000001,
}

alias RESIZE_VIRTUAL_DISK_VERSION = int;
enum : int
{
    RESIZE_VIRTUAL_DISK_VERSION_UNSPECIFIED = 0x00000000,
    RESIZE_VIRTUAL_DISK_VERSION_1           = 0x00000001,
}

struct RESIZE_VIRTUAL_DISK_PARAMETERS
{
    RESIZE_VIRTUAL_DISK_VERSION Version;
    union
    {
        struct _Version1_e__Struct
        {
            ulong NewSize;
        }
    }
}
alias RESIZE_VIRTUAL_DISK_FLAG = uint;
enum : uint
{
    RESIZE_VIRTUAL_DISK_FLAG_NONE                                 = 0x00000000,
    RESIZE_VIRTUAL_DISK_FLAG_ALLOW_UNSAFE_VIRTUAL_SIZE            = 0x00000001,
    RESIZE_VIRTUAL_DISK_FLAG_RESIZE_TO_SMALLEST_SAFE_VIRTUAL_SIZE = 0x00000002,
}

alias MIRROR_VIRTUAL_DISK_VERSION = int;
enum : int
{
    MIRROR_VIRTUAL_DISK_VERSION_UNSPECIFIED = 0x00000000,
    MIRROR_VIRTUAL_DISK_VERSION_1           = 0x00000001,
}

struct MIRROR_VIRTUAL_DISK_PARAMETERS
{
    MIRROR_VIRTUAL_DISK_VERSION Version;
    union
    {
        struct _Version1_e__Struct
        {
            const(wchar)* MirrorVirtualDiskPath;
        }
    }
}
alias MIRROR_VIRTUAL_DISK_FLAG = uint;
enum : uint
{
    MIRROR_VIRTUAL_DISK_FLAG_NONE                   = 0x00000000,
    MIRROR_VIRTUAL_DISK_FLAG_EXISTING_FILE          = 0x00000001,
    MIRROR_VIRTUAL_DISK_FLAG_SKIP_MIRROR_ACTIVATION = 0x00000002,
    MIRROR_VIRTUAL_DISK_FLAG_ENABLE_SMB_COMPRESSION = 0x00000004,
    MIRROR_VIRTUAL_DISK_FLAG_IS_LIVE_MIGRATION      = 0x00000008,
}

struct QUERY_CHANGES_VIRTUAL_DISK_RANGE
{
    ulong ByteOffset;
    ulong ByteLength;
    ulong Reserved;
}
alias QUERY_CHANGES_VIRTUAL_DISK_FLAG = uint;
enum : uint
{
    QUERY_CHANGES_VIRTUAL_DISK_FLAG_NONE = 0x00000000,
}

alias TAKE_SNAPSHOT_VHDSET_FLAG = uint;
enum : uint
{
    TAKE_SNAPSHOT_VHDSET_FLAG_NONE      = 0x00000000,
    TAKE_SNAPSHOT_VHDSET_FLAG_WRITEABLE = 0x00000001,
}

alias TAKE_SNAPSHOT_VHDSET_VERSION = int;
enum : int
{
    TAKE_SNAPSHOT_VHDSET_VERSION_UNSPECIFIED = 0x00000000,
    TAKE_SNAPSHOT_VHDSET_VERSION_1           = 0x00000001,
}

struct TAKE_SNAPSHOT_VHDSET_PARAMETERS
{
    TAKE_SNAPSHOT_VHDSET_VERSION Version;
    union
    {
        struct _Version1_e__Struct
        {
            GUID SnapshotId;
        }
    }
}
alias DELETE_SNAPSHOT_VHDSET_FLAG = uint;
enum : uint
{
    DELETE_SNAPSHOT_VHDSET_FLAG_NONE        = 0x00000000,
    DELETE_SNAPSHOT_VHDSET_FLAG_PERSIST_RCT = 0x00000001,
}

alias DELETE_SNAPSHOT_VHDSET_VERSION = int;
enum : int
{
    DELETE_SNAPSHOT_VHDSET_VERSION_UNSPECIFIED = 0x00000000,
    DELETE_SNAPSHOT_VHDSET_VERSION_1           = 0x00000001,
}

struct DELETE_SNAPSHOT_VHDSET_PARAMETERS
{
    DELETE_SNAPSHOT_VHDSET_VERSION Version;
    union
    {
        struct _Version1_e__Struct
        {
            GUID SnapshotId;
        }
    }
}
alias MODIFY_VHDSET_VERSION = int;
enum : int
{
    MODIFY_VHDSET_UNSPECIFIED           = 0x00000000,
    MODIFY_VHDSET_SNAPSHOT_PATH         = 0x00000001,
    MODIFY_VHDSET_REMOVE_SNAPSHOT       = 0x00000002,
    MODIFY_VHDSET_DEFAULT_SNAPSHOT_PATH = 0x00000003,
}

alias MODIFY_VHDSET_FLAG = uint;
enum : uint
{
    MODIFY_VHDSET_FLAG_NONE               = 0x00000000,
    MODIFY_VHDSET_FLAG_WRITEABLE_SNAPSHOT = 0x00000001,
}

struct MODIFY_VHDSET_PARAMETERS
{
    MODIFY_VHDSET_VERSION Version;
    union
    {
        struct _SnapshotPath_e__Struct
        {
            GUID SnapshotId;
            const(wchar)* SnapshotFilePath;
        }
        GUID SnapshotId;
        const(wchar)* DefaultFilePath;
    }
}
alias APPLY_SNAPSHOT_VHDSET_FLAG = uint;
enum : uint
{
    APPLY_SNAPSHOT_VHDSET_FLAG_NONE      = 0x00000000,
    APPLY_SNAPSHOT_VHDSET_FLAG_WRITEABLE = 0x00000001,
}

alias APPLY_SNAPSHOT_VHDSET_VERSION = int;
enum : int
{
    APPLY_SNAPSHOT_VHDSET_VERSION_UNSPECIFIED = 0x00000000,
    APPLY_SNAPSHOT_VHDSET_VERSION_1           = 0x00000001,
}

struct APPLY_SNAPSHOT_VHDSET_PARAMETERS
{
    APPLY_SNAPSHOT_VHDSET_VERSION Version;
    union
    {
        struct _Version1_e__Struct
        {
            GUID SnapshotId;
            GUID LeafSnapshotId;
        }
    }
}
alias RAW_SCSI_VIRTUAL_DISK_FLAG = uint;
enum : uint
{
    RAW_SCSI_VIRTUAL_DISK_FLAG_NONE = 0x00000000,
}

alias RAW_SCSI_VIRTUAL_DISK_VERSION = int;
enum : int
{
    RAW_SCSI_VIRTUAL_DISK_VERSION_UNSPECIFIED = 0x00000000,
    RAW_SCSI_VIRTUAL_DISK_VERSION_1           = 0x00000001,
}

struct RAW_SCSI_VIRTUAL_DISK_PARAMETERS
{
    RAW_SCSI_VIRTUAL_DISK_VERSION Version;
    union
    {
        struct _Version1_e__Struct
        {
            BOOL RSVDHandle;
            ubyte DataIn;
            ubyte CdbLength;
            ubyte SenseInfoLength;
            uint SrbFlags;
            uint DataTransferLength;
            void* DataBuffer;
            ubyte* SenseInfo;
            ubyte* Cdb;
        }
    }
}
struct RAW_SCSI_VIRTUAL_DISK_RESPONSE
{
    RAW_SCSI_VIRTUAL_DISK_VERSION Version;
    union
    {
        struct _Version1_e__Struct
        {
            ubyte ScsiStatus;
            ubyte SenseInfoLength;
            uint DataTransferLength;
        }
    }
}
alias FORK_VIRTUAL_DISK_VERSION = int;
enum : int
{
    FORK_VIRTUAL_DISK_VERSION_UNSPECIFIED = 0x00000000,
    FORK_VIRTUAL_DISK_VERSION_1           = 0x00000001,
}

struct FORK_VIRTUAL_DISK_PARAMETERS
{
    FORK_VIRTUAL_DISK_VERSION Version;
    union
    {
        struct _Version1_e__Struct
        {
            const(wchar)* ForkedVirtualDiskPath;
        }
    }
}
alias FORK_VIRTUAL_DISK_FLAG = uint;
enum : uint
{
    FORK_VIRTUAL_DISK_FLAG_NONE          = 0x00000000,
    FORK_VIRTUAL_DISK_FLAG_EXISTING_FILE = 0x00000001,
}

