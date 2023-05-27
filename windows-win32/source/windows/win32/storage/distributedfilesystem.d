module windows.win32.storage.distributedfilesystem;

import windows.win32.guid : GUID;
import windows.win32.foundation : PWSTR;
import windows.win32.security : PSECURITY_DESCRIPTOR;

version (Windows):
extern (Windows):

uint NetDfsAdd(PWSTR, PWSTR, PWSTR, PWSTR, uint);
uint NetDfsAddStdRoot(PWSTR, PWSTR, PWSTR, uint);
uint NetDfsRemoveStdRoot(PWSTR, PWSTR, uint);
uint NetDfsAddFtRoot(PWSTR, PWSTR, PWSTR, PWSTR, uint);
uint NetDfsRemoveFtRoot(PWSTR, PWSTR, PWSTR, uint);
uint NetDfsRemoveFtRootForced(PWSTR, PWSTR, PWSTR, PWSTR, uint);
uint NetDfsRemove(PWSTR, PWSTR, PWSTR);
uint NetDfsEnum(PWSTR, uint, uint, ubyte**, uint*, uint*);
uint NetDfsGetInfo(PWSTR, PWSTR, PWSTR, uint, ubyte**);
uint NetDfsSetInfo(PWSTR, PWSTR, PWSTR, uint, ubyte*);
uint NetDfsGetClientInfo(PWSTR, PWSTR, PWSTR, uint, ubyte**);
uint NetDfsSetClientInfo(PWSTR, PWSTR, PWSTR, uint, ubyte*);
uint NetDfsMove(PWSTR, PWSTR, uint);
uint NetDfsAddRootTarget(PWSTR, PWSTR, uint, PWSTR, uint);
uint NetDfsRemoveRootTarget(PWSTR, PWSTR, uint);
uint NetDfsGetSecurity(PWSTR, uint, PSECURITY_DESCRIPTOR*, uint*);
uint NetDfsSetSecurity(PWSTR, uint, PSECURITY_DESCRIPTOR);
uint NetDfsGetStdContainerSecurity(PWSTR, uint, PSECURITY_DESCRIPTOR*, uint*);
uint NetDfsSetStdContainerSecurity(PWSTR, uint, PSECURITY_DESCRIPTOR);
uint NetDfsGetFtContainerSecurity(PWSTR, uint, PSECURITY_DESCRIPTOR*, uint*);
uint NetDfsSetFtContainerSecurity(PWSTR, uint, PSECURITY_DESCRIPTOR);
uint NetDfsGetSupportedNamespaceVersion(DFS_NAMESPACE_VERSION_ORIGIN, PWSTR, DFS_SUPPORTED_NAMESPACE_VERSION_INFO**);
enum FSCTL_DFS_BASE = 0x00000006;
enum DFS_VOLUME_STATES = 0x0000000f;
enum DFS_VOLUME_STATE_OK = 0x00000001;
enum DFS_VOLUME_STATE_INCONSISTENT = 0x00000002;
enum DFS_VOLUME_STATE_OFFLINE = 0x00000003;
enum DFS_VOLUME_STATE_ONLINE = 0x00000004;
enum DFS_VOLUME_STATE_RESYNCHRONIZE = 0x00000010;
enum DFS_VOLUME_STATE_STANDBY = 0x00000020;
enum DFS_VOLUME_STATE_FORCE_SYNC = 0x00000040;
enum DFS_VOLUME_FLAVORS = 0x00000300;
enum DFS_VOLUME_FLAVOR_UNUSED1 = 0x00000000;
enum DFS_VOLUME_FLAVOR_STANDALONE = 0x00000100;
enum DFS_VOLUME_FLAVOR_AD_BLOB = 0x00000200;
enum DFS_STORAGE_FLAVOR_UNUSED2 = 0x00000300;
enum DFS_STORAGE_STATES = 0x0000000f;
enum DFS_STORAGE_STATE_OFFLINE = 0x00000001;
enum DFS_STORAGE_STATE_ONLINE = 0x00000002;
enum DFS_STORAGE_STATE_ACTIVE = 0x00000004;
enum DFS_PROPERTY_FLAG_INSITE_REFERRALS = 0x00000001;
enum DFS_PROPERTY_FLAG_ROOT_SCALABILITY = 0x00000002;
enum DFS_PROPERTY_FLAG_SITE_COSTING = 0x00000004;
enum DFS_PROPERTY_FLAG_TARGET_FAILBACK = 0x00000008;
enum DFS_PROPERTY_FLAG_CLUSTER_ENABLED = 0x00000010;
enum DFS_PROPERTY_FLAG_ABDE = 0x00000020;
enum DFS_ADD_VOLUME = 0x00000001;
enum DFS_RESTORE_VOLUME = 0x00000002;
enum NET_DFS_SETDC_FLAGS = 0x00000000;
enum NET_DFS_SETDC_TIMEOUT = 0x00000001;
enum NET_DFS_SETDC_INITPKT = 0x00000002;
enum DFS_SITE_PRIMARY = 0x00000001;
enum DFS_MOVE_FLAG_REPLACE_IF_EXISTS = 0x00000001;
enum DFS_FORCE_REMOVE = 0x80000000;
enum FSCTL_DFS_GET_PKT_ENTRY_STATE = 0x00061fbc;
struct DFS_INFO_1_32
{
    uint EntryPath;
}
struct DFS_INFO_2_32
{
    uint EntryPath;
    uint Comment;
    uint State;
    uint NumberOfStorages;
}
struct DFS_STORAGE_INFO_0_32
{
    uint State;
    uint ServerName;
    uint ShareName;
}
struct DFS_INFO_3_32
{
    uint EntryPath;
    uint Comment;
    uint State;
    uint NumberOfStorages;
    uint Storage;
}
struct DFS_INFO_4_32
{
    uint EntryPath;
    uint Comment;
    uint State;
    uint Timeout;
    GUID Guid;
    uint NumberOfStorages;
    uint Storage;
}
alias DFS_TARGET_PRIORITY_CLASS = int;
enum : int
{
    DfsInvalidPriorityClass        = 0xffffffff,
    DfsSiteCostNormalPriorityClass = 0x00000000,
    DfsGlobalHighPriorityClass     = 0x00000001,
    DfsSiteCostHighPriorityClass   = 0x00000002,
    DfsSiteCostLowPriorityClass    = 0x00000003,
    DfsGlobalLowPriorityClass      = 0x00000004,
}

struct DFS_TARGET_PRIORITY
{
    DFS_TARGET_PRIORITY_CLASS TargetPriorityClass;
    ushort TargetPriorityRank;
    ushort Reserved;
}
struct DFS_INFO_1
{
    PWSTR EntryPath;
}
struct DFS_INFO_2
{
    PWSTR EntryPath;
    PWSTR Comment;
    uint State;
    uint NumberOfStorages;
}
struct DFS_STORAGE_INFO
{
    uint State;
    PWSTR ServerName;
    PWSTR ShareName;
}
struct DFS_STORAGE_INFO_1
{
    uint State;
    PWSTR ServerName;
    PWSTR ShareName;
    DFS_TARGET_PRIORITY TargetPriority;
}
struct DFS_INFO_3
{
    PWSTR EntryPath;
    PWSTR Comment;
    uint State;
    uint NumberOfStorages;
    DFS_STORAGE_INFO* Storage;
}
struct DFS_INFO_4
{
    PWSTR EntryPath;
    PWSTR Comment;
    uint State;
    uint Timeout;
    GUID Guid;
    uint NumberOfStorages;
    DFS_STORAGE_INFO* Storage;
}
struct DFS_INFO_5
{
    PWSTR EntryPath;
    PWSTR Comment;
    uint State;
    uint Timeout;
    GUID Guid;
    uint PropertyFlags;
    uint MetadataSize;
    uint NumberOfStorages;
}
struct DFS_INFO_6
{
    PWSTR EntryPath;
    PWSTR Comment;
    uint State;
    uint Timeout;
    GUID Guid;
    uint PropertyFlags;
    uint MetadataSize;
    uint NumberOfStorages;
    DFS_STORAGE_INFO_1* Storage;
}
struct DFS_INFO_7
{
    GUID GenerationGuid;
}
struct DFS_INFO_8
{
    PWSTR EntryPath;
    PWSTR Comment;
    uint State;
    uint Timeout;
    GUID Guid;
    uint PropertyFlags;
    uint MetadataSize;
    uint SdLengthReserved;
    PSECURITY_DESCRIPTOR pSecurityDescriptor;
    uint NumberOfStorages;
}
struct DFS_INFO_9
{
    PWSTR EntryPath;
    PWSTR Comment;
    uint State;
    uint Timeout;
    GUID Guid;
    uint PropertyFlags;
    uint MetadataSize;
    uint SdLengthReserved;
    PSECURITY_DESCRIPTOR pSecurityDescriptor;
    uint NumberOfStorages;
    DFS_STORAGE_INFO_1* Storage;
}
struct DFS_INFO_50
{
    uint NamespaceMajorVersion;
    uint NamespaceMinorVersion;
    ulong NamespaceCapabilities;
}
struct DFS_INFO_100
{
    PWSTR Comment;
}
struct DFS_INFO_101
{
    uint State;
}
struct DFS_INFO_102
{
    uint Timeout;
}
struct DFS_INFO_103
{
    uint PropertyFlagMask;
    uint PropertyFlags;
}
struct DFS_INFO_104
{
    DFS_TARGET_PRIORITY TargetPriority;
}
struct DFS_INFO_105
{
    PWSTR Comment;
    uint State;
    uint Timeout;
    uint PropertyFlagMask;
    uint PropertyFlags;
}
struct DFS_INFO_106
{
    uint State;
    DFS_TARGET_PRIORITY TargetPriority;
}
struct DFS_INFO_107
{
    PWSTR Comment;
    uint State;
    uint Timeout;
    uint PropertyFlagMask;
    uint PropertyFlags;
    uint SdLengthReserved;
    PSECURITY_DESCRIPTOR pSecurityDescriptor;
}
struct DFS_INFO_150
{
    uint SdLengthReserved;
    PSECURITY_DESCRIPTOR pSecurityDescriptor;
}
struct DFS_INFO_200
{
    PWSTR FtDfsName;
}
struct DFS_INFO_300
{
    uint Flags;
    PWSTR DfsName;
}
struct DFS_SITENAME_INFO
{
    uint SiteFlags;
    PWSTR SiteName;
}
struct DFS_SITELIST_INFO
{
    uint cSites;
    DFS_SITENAME_INFO[1] Site;
}
alias DFS_NAMESPACE_VERSION_ORIGIN = int;
enum : int
{
    DFS_NAMESPACE_VERSION_ORIGIN_COMBINED = 0x00000000,
    DFS_NAMESPACE_VERSION_ORIGIN_SERVER   = 0x00000001,
    DFS_NAMESPACE_VERSION_ORIGIN_DOMAIN   = 0x00000002,
}

struct DFS_SUPPORTED_NAMESPACE_VERSION_INFO
{
    uint DomainDfsMajorVersion;
    uint DomainDfsMinorVersion;
    ulong DomainDfsCapabilities;
    uint StandaloneDfsMajorVersion;
    uint StandaloneDfsMinorVersion;
    ulong StandaloneDfsCapabilities;
}
struct DFS_GET_PKT_ENTRY_STATE_ARG
{
    ushort DfsEntryPathLen;
    ushort ServerNameLen;
    ushort ShareNameLen;
    uint Level;
    wchar[1] Buffer;
}
