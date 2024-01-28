module windows.win32.storage.installablefilesystems;

import windows.win32.foundation : HANDLE, HRESULT, NTSTATUS, PWSTR;
import windows.win32.security : SECURITY_ATTRIBUTES;
import windows.win32.system.io : OVERLAPPED;

version (Windows):
extern (Windows):

HRESULT FilterLoad(const(wchar)*);
HRESULT FilterUnload(const(wchar)*);
HRESULT FilterCreate(const(wchar)*, HFILTER*);
HRESULT FilterClose(HFILTER);
HRESULT FilterInstanceCreate(const(wchar)*, const(wchar)*, const(wchar)*, HFILTER_INSTANCE*);
HRESULT FilterInstanceClose(HFILTER_INSTANCE);
HRESULT FilterAttach(const(wchar)*, const(wchar)*, const(wchar)*, uint, PWSTR);
HRESULT FilterAttachAtAltitude(const(wchar)*, const(wchar)*, const(wchar)*, const(wchar)*, uint, PWSTR);
HRESULT FilterDetach(const(wchar)*, const(wchar)*, const(wchar)*);
HRESULT FilterFindFirst(FILTER_INFORMATION_CLASS, void*, uint, uint*, HANDLE*);
HRESULT FilterFindNext(HANDLE, FILTER_INFORMATION_CLASS, void*, uint, uint*);
HRESULT FilterFindClose(HANDLE);
HRESULT FilterVolumeFindFirst(FILTER_VOLUME_INFORMATION_CLASS, void*, uint, uint*, HANDLE*);
HRESULT FilterVolumeFindNext(HANDLE, FILTER_VOLUME_INFORMATION_CLASS, void*, uint, uint*);
HRESULT FilterVolumeFindClose(HANDLE);
HRESULT FilterInstanceFindFirst(const(wchar)*, INSTANCE_INFORMATION_CLASS, void*, uint, uint*, HANDLE*);
HRESULT FilterInstanceFindNext(HANDLE, INSTANCE_INFORMATION_CLASS, void*, uint, uint*);
HRESULT FilterInstanceFindClose(HANDLE);
HRESULT FilterVolumeInstanceFindFirst(const(wchar)*, INSTANCE_INFORMATION_CLASS, void*, uint, uint*, HANDLE*);
HRESULT FilterVolumeInstanceFindNext(HANDLE, INSTANCE_INFORMATION_CLASS, void*, uint, uint*);
HRESULT FilterVolumeInstanceFindClose(HANDLE);
HRESULT FilterGetInformation(HFILTER, FILTER_INFORMATION_CLASS, void*, uint, uint*);
HRESULT FilterInstanceGetInformation(HFILTER_INSTANCE, INSTANCE_INFORMATION_CLASS, void*, uint, uint*);
HRESULT FilterConnectCommunicationPort(const(wchar)*, uint, const(void)*, ushort, SECURITY_ATTRIBUTES*, HANDLE*);
HRESULT FilterSendMessage(HANDLE, void*, uint, void*, uint, uint*);
HRESULT FilterGetMessage(HANDLE, FILTER_MESSAGE_HEADER*, uint, OVERLAPPED*);
HRESULT FilterReplyMessage(HANDLE, FILTER_REPLY_HEADER*, uint);
HRESULT FilterGetDosName(const(wchar)*, PWSTR, uint);
enum FILTER_NAME_MAX_CHARS = 0x000000ff;
enum VOLUME_NAME_MAX_CHARS = 0x00000400;
enum INSTANCE_NAME_MAX_CHARS = 0x000000ff;
enum FLTFL_AGGREGATE_INFO_IS_MINIFILTER = 0x00000001;
enum FLTFL_AGGREGATE_INFO_IS_LEGACYFILTER = 0x00000002;
enum FLTFL_ASI_IS_MINIFILTER = 0x00000001;
enum FLTFL_ASI_IS_LEGACYFILTER = 0x00000002;
enum FLTFL_VSI_DETACHED_VOLUME = 0x00000001;
enum FLTFL_IASI_IS_MINIFILTER = 0x00000001;
enum FLTFL_IASI_IS_LEGACYFILTER = 0x00000002;
enum FLTFL_IASIM_DETACHED_VOLUME = 0x00000001;
enum FLTFL_IASIL_DETACHED_VOLUME = 0x00000001;
enum FLT_PORT_FLAG_SYNC_HANDLE = 0x00000001;
enum WNNC_NET_MSNET = 0x00010000;
enum WNNC_NET_SMB = 0x00020000;
enum WNNC_NET_NETWARE = 0x00030000;
enum WNNC_NET_VINES = 0x00040000;
enum WNNC_NET_10NET = 0x00050000;
enum WNNC_NET_LOCUS = 0x00060000;
enum WNNC_NET_SUN_PC_NFS = 0x00070000;
enum WNNC_NET_LANSTEP = 0x00080000;
enum WNNC_NET_9TILES = 0x00090000;
enum WNNC_NET_LANTASTIC = 0x000a0000;
enum WNNC_NET_AS400 = 0x000b0000;
enum WNNC_NET_FTP_NFS = 0x000c0000;
enum WNNC_NET_PATHWORKS = 0x000d0000;
enum WNNC_NET_LIFENET = 0x000e0000;
enum WNNC_NET_POWERLAN = 0x000f0000;
enum WNNC_NET_BWNFS = 0x00100000;
enum WNNC_NET_COGENT = 0x00110000;
enum WNNC_NET_FARALLON = 0x00120000;
enum WNNC_NET_APPLETALK = 0x00130000;
enum WNNC_NET_INTERGRAPH = 0x00140000;
enum WNNC_NET_SYMFONET = 0x00150000;
enum WNNC_NET_CLEARCASE = 0x00160000;
enum WNNC_NET_FRONTIER = 0x00170000;
enum WNNC_NET_BMC = 0x00180000;
enum WNNC_NET_DCE = 0x00190000;
enum WNNC_NET_AVID = 0x001a0000;
enum WNNC_NET_DOCUSPACE = 0x001b0000;
enum WNNC_NET_MANGOSOFT = 0x001c0000;
enum WNNC_NET_SERNET = 0x001d0000;
enum WNNC_NET_RIVERFRONT1 = 0x001e0000;
enum WNNC_NET_RIVERFRONT2 = 0x001f0000;
enum WNNC_NET_DECORB = 0x00200000;
enum WNNC_NET_PROTSTOR = 0x00210000;
enum WNNC_NET_FJ_REDIR = 0x00220000;
enum WNNC_NET_DISTINCT = 0x00230000;
enum WNNC_NET_TWINS = 0x00240000;
enum WNNC_NET_RDR2SAMPLE = 0x00250000;
enum WNNC_NET_CSC = 0x00260000;
enum WNNC_NET_3IN1 = 0x00270000;
enum WNNC_NET_EXTENDNET = 0x00290000;
enum WNNC_NET_STAC = 0x002a0000;
enum WNNC_NET_FOXBAT = 0x002b0000;
enum WNNC_NET_YAHOO = 0x002c0000;
enum WNNC_NET_EXIFS = 0x002d0000;
enum WNNC_NET_DAV = 0x002e0000;
enum WNNC_NET_KNOWARE = 0x002f0000;
enum WNNC_NET_OBJECT_DIRE = 0x00300000;
enum WNNC_NET_MASFAX = 0x00310000;
enum WNNC_NET_HOB_NFS = 0x00320000;
enum WNNC_NET_SHIVA = 0x00330000;
enum WNNC_NET_IBMAL = 0x00340000;
enum WNNC_NET_LOCK = 0x00350000;
enum WNNC_NET_TERMSRV = 0x00360000;
enum WNNC_NET_SRT = 0x00370000;
enum WNNC_NET_QUINCY = 0x00380000;
enum WNNC_NET_OPENAFS = 0x00390000;
enum WNNC_NET_AVID1 = 0x003a0000;
enum WNNC_NET_DFS = 0x003b0000;
enum WNNC_NET_KWNP = 0x003c0000;
enum WNNC_NET_ZENWORKS = 0x003d0000;
enum WNNC_NET_DRIVEONWEB = 0x003e0000;
enum WNNC_NET_VMWARE = 0x003f0000;
enum WNNC_NET_RSFX = 0x00400000;
enum WNNC_NET_MFILES = 0x00410000;
enum WNNC_NET_MS_NFS = 0x00420000;
enum WNNC_NET_GOOGLE = 0x00430000;
enum WNNC_NET_NDFS = 0x00440000;
enum WNNC_NET_DOCUSHARE = 0x00450000;
enum WNNC_NET_AURISTOR_FS = 0x00460000;
enum WNNC_NET_SECUREAGENT = 0x00470000;
enum WNNC_NET_9P = 0x00480000;
enum WNNC_CRED_MANAGER = 0xffff0000;
enum WNNC_NET_LANMAN = 0x00020000;
alias HFILTER = void*;
alias HFILTER_INSTANCE = void*;
alias FLT_FILESYSTEM_TYPE = int;
enum : int
{
    FLT_FSTYPE_UNKNOWN    = 0x00000000,
    FLT_FSTYPE_RAW        = 0x00000001,
    FLT_FSTYPE_NTFS       = 0x00000002,
    FLT_FSTYPE_FAT        = 0x00000003,
    FLT_FSTYPE_CDFS       = 0x00000004,
    FLT_FSTYPE_UDFS       = 0x00000005,
    FLT_FSTYPE_LANMAN     = 0x00000006,
    FLT_FSTYPE_WEBDAV     = 0x00000007,
    FLT_FSTYPE_RDPDR      = 0x00000008,
    FLT_FSTYPE_NFS        = 0x00000009,
    FLT_FSTYPE_MS_NETWARE = 0x0000000a,
    FLT_FSTYPE_NETWARE    = 0x0000000b,
    FLT_FSTYPE_BSUDF      = 0x0000000c,
    FLT_FSTYPE_MUP        = 0x0000000d,
    FLT_FSTYPE_RSFX       = 0x0000000e,
    FLT_FSTYPE_ROXIO_UDF1 = 0x0000000f,
    FLT_FSTYPE_ROXIO_UDF2 = 0x00000010,
    FLT_FSTYPE_ROXIO_UDF3 = 0x00000011,
    FLT_FSTYPE_TACIT      = 0x00000012,
    FLT_FSTYPE_FS_REC     = 0x00000013,
    FLT_FSTYPE_INCD       = 0x00000014,
    FLT_FSTYPE_INCD_FAT   = 0x00000015,
    FLT_FSTYPE_EXFAT      = 0x00000016,
    FLT_FSTYPE_PSFS       = 0x00000017,
    FLT_FSTYPE_GPFS       = 0x00000018,
    FLT_FSTYPE_NPFS       = 0x00000019,
    FLT_FSTYPE_MSFS       = 0x0000001a,
    FLT_FSTYPE_CSVFS      = 0x0000001b,
    FLT_FSTYPE_REFS       = 0x0000001c,
    FLT_FSTYPE_OPENAFS    = 0x0000001d,
    FLT_FSTYPE_CIMFS      = 0x0000001e,
}

alias FILTER_INFORMATION_CLASS = int;
enum : int
{
    FilterFullInformation              = 0x00000000,
    FilterAggregateBasicInformation    = 0x00000001,
    FilterAggregateStandardInformation = 0x00000002,
}

struct FILTER_FULL_INFORMATION
{
    uint NextEntryOffset;
    uint FrameID;
    uint NumberOfInstances;
    ushort FilterNameLength;
    wchar[1] FilterNameBuffer;
}
struct FILTER_AGGREGATE_BASIC_INFORMATION
{
    uint NextEntryOffset;
    uint Flags;
    union Type
    {
        struct MiniFilter
        {
            uint FrameID;
            uint NumberOfInstances;
            ushort FilterNameLength;
            ushort FilterNameBufferOffset;
            ushort FilterAltitudeLength;
            ushort FilterAltitudeBufferOffset;
        }
        struct LegacyFilter
        {
            ushort FilterNameLength;
            ushort FilterNameBufferOffset;
        }
    }
}
struct FILTER_AGGREGATE_STANDARD_INFORMATION
{
    uint NextEntryOffset;
    uint Flags;
    union Type
    {
        struct MiniFilter
        {
            uint Flags;
            uint FrameID;
            uint NumberOfInstances;
            ushort FilterNameLength;
            ushort FilterNameBufferOffset;
            ushort FilterAltitudeLength;
            ushort FilterAltitudeBufferOffset;
        }
        struct LegacyFilter
        {
            uint Flags;
            ushort FilterNameLength;
            ushort FilterNameBufferOffset;
            ushort FilterAltitudeLength;
            ushort FilterAltitudeBufferOffset;
        }
    }
}
alias FILTER_VOLUME_INFORMATION_CLASS = int;
enum : int
{
    FilterVolumeBasicInformation    = 0x00000000,
    FilterVolumeStandardInformation = 0x00000001,
}

struct FILTER_VOLUME_BASIC_INFORMATION
{
    ushort FilterVolumeNameLength;
    wchar[1] FilterVolumeName;
}
struct FILTER_VOLUME_STANDARD_INFORMATION
{
    uint NextEntryOffset;
    uint Flags;
    uint FrameID;
    FLT_FILESYSTEM_TYPE FileSystemType;
    ushort FilterVolumeNameLength;
    wchar[1] FilterVolumeName;
}
alias INSTANCE_INFORMATION_CLASS = int;
enum : int
{
    InstanceBasicInformation             = 0x00000000,
    InstancePartialInformation           = 0x00000001,
    InstanceFullInformation              = 0x00000002,
    InstanceAggregateStandardInformation = 0x00000003,
}

struct INSTANCE_BASIC_INFORMATION
{
    uint NextEntryOffset;
    ushort InstanceNameLength;
    ushort InstanceNameBufferOffset;
}
struct INSTANCE_PARTIAL_INFORMATION
{
    uint NextEntryOffset;
    ushort InstanceNameLength;
    ushort InstanceNameBufferOffset;
    ushort AltitudeLength;
    ushort AltitudeBufferOffset;
}
struct INSTANCE_FULL_INFORMATION
{
    uint NextEntryOffset;
    ushort InstanceNameLength;
    ushort InstanceNameBufferOffset;
    ushort AltitudeLength;
    ushort AltitudeBufferOffset;
    ushort VolumeNameLength;
    ushort VolumeNameBufferOffset;
    ushort FilterNameLength;
    ushort FilterNameBufferOffset;
}
struct INSTANCE_AGGREGATE_STANDARD_INFORMATION
{
    uint NextEntryOffset;
    uint Flags;
    union Type
    {
        struct MiniFilter
        {
            uint Flags;
            uint FrameID;
            FLT_FILESYSTEM_TYPE VolumeFileSystemType;
            ushort InstanceNameLength;
            ushort InstanceNameBufferOffset;
            ushort AltitudeLength;
            ushort AltitudeBufferOffset;
            ushort VolumeNameLength;
            ushort VolumeNameBufferOffset;
            ushort FilterNameLength;
            ushort FilterNameBufferOffset;
            uint SupportedFeatures;
        }
        struct LegacyFilter
        {
            uint Flags;
            ushort AltitudeLength;
            ushort AltitudeBufferOffset;
            ushort VolumeNameLength;
            ushort VolumeNameBufferOffset;
            ushort FilterNameLength;
            ushort FilterNameBufferOffset;
            uint SupportedFeatures;
        }
    }
}
struct FILTER_MESSAGE_HEADER
{
    uint ReplyLength;
    ulong MessageId;
}
struct FILTER_REPLY_HEADER
{
    NTSTATUS Status;
    ulong MessageId;
}
