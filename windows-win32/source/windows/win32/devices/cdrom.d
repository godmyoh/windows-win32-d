module windows.win32.devices.cdrom;

import windows.win32.foundation : BOOLEAN;

version (Windows):
extern (Windows):

enum IOCTL_CDROM_BASE = 0x00000002;
enum IOCTL_CDROM_UNLOAD_DRIVER = 0x00025008;
enum IOCTL_CDROM_READ_TOC = 0x00024000;
enum IOCTL_CDROM_SEEK_AUDIO_MSF = 0x00024004;
enum IOCTL_CDROM_STOP_AUDIO = 0x00024008;
enum IOCTL_CDROM_PAUSE_AUDIO = 0x0002400c;
enum IOCTL_CDROM_RESUME_AUDIO = 0x00024010;
enum IOCTL_CDROM_GET_VOLUME = 0x00024014;
enum IOCTL_CDROM_PLAY_AUDIO_MSF = 0x00024018;
enum IOCTL_CDROM_SET_VOLUME = 0x00024028;
enum IOCTL_CDROM_READ_Q_CHANNEL = 0x0002402c;
enum IOCTL_CDROM_GET_CONTROL = 0x00024034;
enum OBSOLETE_IOCTL_CDROM_GET_CONTROL = 0x00024034;
enum IOCTL_CDROM_GET_LAST_SESSION = 0x00024038;
enum IOCTL_CDROM_RAW_READ = 0x0002403e;
enum IOCTL_CDROM_DISK_TYPE = 0x00020040;
enum IOCTL_CDROM_GET_DRIVE_GEOMETRY = 0x0002404c;
enum IOCTL_CDROM_GET_DRIVE_GEOMETRY_EX = 0x00024050;
enum IOCTL_CDROM_READ_TOC_EX = 0x00024054;
enum IOCTL_CDROM_GET_CONFIGURATION = 0x00024058;
enum IOCTL_CDROM_EXCLUSIVE_ACCESS = 0x0002c05c;
enum IOCTL_CDROM_SET_SPEED = 0x00024060;
enum IOCTL_CDROM_GET_INQUIRY_DATA = 0x00024064;
enum IOCTL_CDROM_ENABLE_STREAMING = 0x00024068;
enum IOCTL_CDROM_SEND_OPC_INFORMATION = 0x0002c06c;
enum IOCTL_CDROM_GET_PERFORMANCE = 0x00024070;
enum IOCTL_CDROM_CHECK_VERIFY = 0x00024800;
enum IOCTL_CDROM_MEDIA_REMOVAL = 0x00024804;
enum IOCTL_CDROM_EJECT_MEDIA = 0x00024808;
enum IOCTL_CDROM_LOAD_MEDIA = 0x0002480c;
enum IOCTL_CDROM_RESERVE = 0x00024810;
enum IOCTL_CDROM_RELEASE = 0x00024814;
enum IOCTL_CDROM_FIND_NEW_DEVICES = 0x00024818;
enum MINIMUM_CDROM_INQUIRY_SIZE = 0x00000024;
enum MAXIMUM_CDROM_INQUIRY_SIZE = 0x00000104;
enum IOCTL_CDROM_SIMBAD = 0x0002400c;
enum MAXIMUM_NUMBER_TRACKS = 0x00000064;
enum MAXIMUM_CDROM_SIZE = 0x00000324;
enum MINIMUM_CDROM_READ_TOC_EX_SIZE = 0x00000002;
enum CDROM_READ_TOC_EX_FORMAT_TOC = 0x00000000;
enum CDROM_READ_TOC_EX_FORMAT_SESSION = 0x00000001;
enum CDROM_READ_TOC_EX_FORMAT_FULL_TOC = 0x00000002;
enum CDROM_READ_TOC_EX_FORMAT_PMA = 0x00000003;
enum CDROM_READ_TOC_EX_FORMAT_ATIP = 0x00000004;
enum CDROM_READ_TOC_EX_FORMAT_CDTEXT = 0x00000005;
enum CDROM_CD_TEXT_PACK_ALBUM_NAME = 0x00000080;
enum CDROM_CD_TEXT_PACK_PERFORMER = 0x00000081;
enum CDROM_CD_TEXT_PACK_SONGWRITER = 0x00000082;
enum CDROM_CD_TEXT_PACK_COMPOSER = 0x00000083;
enum CDROM_CD_TEXT_PACK_ARRANGER = 0x00000084;
enum CDROM_CD_TEXT_PACK_MESSAGES = 0x00000085;
enum CDROM_CD_TEXT_PACK_DISC_ID = 0x00000086;
enum CDROM_CD_TEXT_PACK_GENRE = 0x00000087;
enum CDROM_CD_TEXT_PACK_TOC_INFO = 0x00000088;
enum CDROM_CD_TEXT_PACK_TOC_INFO2 = 0x00000089;
enum CDROM_CD_TEXT_PACK_UPC_EAN = 0x0000008e;
enum CDROM_CD_TEXT_PACK_SIZE_INFO = 0x0000008f;
enum CDROM_DISK_AUDIO_TRACK = 0x00000001;
enum CDROM_DISK_DATA_TRACK = 0x00000002;
enum IOCTL_CDROM_SUB_Q_CHANNEL = 0x00000000;
enum IOCTL_CDROM_CURRENT_POSITION = 0x00000001;
enum IOCTL_CDROM_MEDIA_CATALOG = 0x00000002;
enum IOCTL_CDROM_TRACK_ISRC = 0x00000003;
enum AUDIO_STATUS_NOT_SUPPORTED = 0x00000000;
enum AUDIO_STATUS_IN_PROGRESS = 0x00000011;
enum AUDIO_STATUS_PAUSED = 0x00000012;
enum AUDIO_STATUS_PLAY_COMPLETE = 0x00000013;
enum AUDIO_STATUS_PLAY_ERROR = 0x00000014;
enum AUDIO_STATUS_NO_STATUS = 0x00000015;
enum ADR_NO_MODE_INFORMATION = 0x00000000;
enum ADR_ENCODES_CURRENT_POSITION = 0x00000001;
enum ADR_ENCODES_MEDIA_CATALOG = 0x00000002;
enum ADR_ENCODES_ISRC = 0x00000003;
enum AUDIO_WITH_PREEMPHASIS = 0x00000001;
enum DIGITAL_COPY_PERMITTED = 0x00000002;
enum AUDIO_DATA_TRACK = 0x00000004;
enum TWO_FOUR_CHANNEL_AUDIO = 0x00000008;
enum CD_RAW_READ_C2_SIZE = 0x00000128;
enum CD_RAW_READ_SUBCODE_SIZE = 0x00000060;
enum CD_RAW_SECTOR_WITH_C2_SIZE = 0x00000a58;
enum CD_RAW_SECTOR_WITH_SUBCODE_SIZE = 0x00000990;
enum CDROM_EXCLUSIVE_CALLER_LENGTH = 0x00000040;
enum CDROM_LOCK_IGNORE_VOLUME = 0x00000001;
enum CDROM_NO_MEDIA_NOTIFICATIONS = 0x00000002;
enum CDROM_NOT_IN_EXCLUSIVE_MODE = 0x00000000;
enum CDROM_IN_EXCLUSIVE_MODE = 0x00000001;
struct CDROM_READ_TOC_EX
{
    ubyte _bitfield0;
    ubyte SessionTrack;
    ubyte Reserved2;
    ubyte Reserved3;
}
struct TRACK_DATA
{
    ubyte Reserved;
    ubyte _bitfield0;
    ubyte TrackNumber;
    ubyte Reserved1;
    ubyte[4] Address;
}
struct CDROM_TOC
{
    ubyte[2] Length;
    ubyte FirstTrack;
    ubyte LastTrack;
    TRACK_DATA[100] TrackData;
}
struct CDROM_TOC_SESSION_DATA
{
    ubyte[2] Length;
    ubyte FirstCompleteSession;
    ubyte LastCompleteSession;
    TRACK_DATA[1] TrackData;
}
struct CDROM_TOC_FULL_TOC_DATA_BLOCK
{
    ubyte SessionNumber;
    ubyte _bitfield0;
    ubyte Reserved1;
    ubyte Point;
    ubyte[3] MsfExtra;
    ubyte Zero;
    ubyte[3] Msf;
}
struct CDROM_TOC_FULL_TOC_DATA
{
    ubyte[2] Length;
    ubyte FirstCompleteSession;
    ubyte LastCompleteSession;
    CDROM_TOC_FULL_TOC_DATA_BLOCK[1] Descriptors;
}
struct CDROM_TOC_PMA_DATA
{
    ubyte[2] Length;
    ubyte Reserved1;
    ubyte Reserved2;
    CDROM_TOC_FULL_TOC_DATA_BLOCK[1] Descriptors;
}
struct CDROM_TOC_ATIP_DATA_BLOCK
{
    ubyte _bitfield1;
    ubyte _bitfield2;
    ubyte _bitfield3;
    ubyte Reserved7;
    ubyte[3] LeadInMsf;
    ubyte Reserved8;
    ubyte[3] LeadOutMsf;
    ubyte Reserved9;
    ubyte[3] A1Values;
    ubyte Reserved10;
    ubyte[3] A2Values;
    ubyte Reserved11;
    ubyte[3] A3Values;
    ubyte Reserved12;
}
struct CDROM_TOC_ATIP_DATA
{
    ubyte[2] Length;
    ubyte Reserved1;
    ubyte Reserved2;
    CDROM_TOC_ATIP_DATA_BLOCK[1] Descriptors;
}
struct CDROM_TOC_CD_TEXT_DATA_BLOCK
{
    ubyte PackType;
    ubyte _bitfield1;
    ubyte SequenceNumber;
    ubyte _bitfield2;
    union
    {
        ubyte[12] Text;
        wchar[6] WText;
    }
    ubyte[2] CRC;
}
struct CDROM_TOC_CD_TEXT_DATA
{
    ubyte[2] Length;
    ubyte Reserved1;
    ubyte Reserved2;
    CDROM_TOC_CD_TEXT_DATA_BLOCK[1] Descriptors;
}
struct CDROM_PLAY_AUDIO_MSF
{
    ubyte StartingM;
    ubyte StartingS;
    ubyte StartingF;
    ubyte EndingM;
    ubyte EndingS;
    ubyte EndingF;
}
struct CDROM_SEEK_AUDIO_MSF
{
    ubyte M;
    ubyte S;
    ubyte F;
}
struct CDROM_DISK_DATA
{
    uint DiskData;
}
struct CDROM_SUB_Q_DATA_FORMAT
{
    ubyte Format;
    ubyte Track;
}
struct SUB_Q_HEADER
{
    ubyte Reserved;
    ubyte AudioStatus;
    ubyte[2] DataLength;
}
struct SUB_Q_CURRENT_POSITION
{
    SUB_Q_HEADER Header;
    ubyte FormatCode;
    ubyte _bitfield0;
    ubyte TrackNumber;
    ubyte IndexNumber;
    ubyte[4] AbsoluteAddress;
    ubyte[4] TrackRelativeAddress;
}
struct SUB_Q_MEDIA_CATALOG_NUMBER
{
    SUB_Q_HEADER Header;
    ubyte FormatCode;
    ubyte[3] Reserved;
    ubyte _bitfield0;
    ubyte[15] MediaCatalog;
}
struct SUB_Q_TRACK_ISRC
{
    SUB_Q_HEADER Header;
    ubyte FormatCode;
    ubyte Reserved0;
    ubyte Track;
    ubyte Reserved1;
    ubyte _bitfield0;
    ubyte[15] TrackIsrc;
}
union SUB_Q_CHANNEL_DATA
{
    SUB_Q_CURRENT_POSITION CurrentPosition;
    SUB_Q_MEDIA_CATALOG_NUMBER MediaCatalog;
    SUB_Q_TRACK_ISRC TrackIsrc;
}
struct VOLUME_CONTROL
{
    ubyte[4] PortVolume;
}
alias TRACK_MODE_TYPE = int;
enum : int
{
    YellowMode2         = 0x00000000,
    XAForm2             = 0x00000001,
    CDDA                = 0x00000002,
    RawWithC2AndSubCode = 0x00000003,
    RawWithC2           = 0x00000004,
    RawWithSubCode      = 0x00000005,
}

struct RAW_READ_INFO
{
    long DiskOffset;
    uint SectorCount;
    TRACK_MODE_TYPE TrackMode;
}
alias MEDIA_BLANK_TYPE = int;
enum : int
{
    MediaBlankTypeFull               = 0x00000000,
    MediaBlankTypeMinimal            = 0x00000001,
    MediaBlankTypeIncompleteTrack    = 0x00000002,
    MediaBlankTypeUnreserveLastTrack = 0x00000003,
    MediaBlankTypeTrackTail          = 0x00000004,
    MediaBlankTypeUncloseLastSession = 0x00000005,
    MediaBlankTypeEraseLastSession   = 0x00000006,
}

alias EXCLUSIVE_ACCESS_REQUEST_TYPE = int;
enum : int
{
    ExclusiveAccessQueryState   = 0x00000000,
    ExclusiveAccessLockDevice   = 0x00000001,
    ExclusiveAccessUnlockDevice = 0x00000002,
}

struct CDROM_EXCLUSIVE_ACCESS
{
    EXCLUSIVE_ACCESS_REQUEST_TYPE RequestType;
    uint Flags;
}
struct CDROM_EXCLUSIVE_LOCK
{
    CDROM_EXCLUSIVE_ACCESS Access;
    ubyte[64] CallerName;
}
struct CDROM_EXCLUSIVE_LOCK_STATE
{
    BOOLEAN LockState;
    ubyte[64] CallerName;
}
alias CDROM_SPEED_REQUEST = int;
enum : int
{
    CdromSetSpeed     = 0x00000000,
    CdromSetStreaming = 0x00000001,
}

alias WRITE_ROTATION = int;
enum : int
{
    CdromDefaultRotation = 0x00000000,
    CdromCAVRotation     = 0x00000001,
}

struct CDROM_SET_SPEED
{
    CDROM_SPEED_REQUEST RequestType;
    ushort ReadSpeed;
    ushort WriteSpeed;
    WRITE_ROTATION RotationControl;
}
struct CDROM_SET_STREAMING
{
    CDROM_SPEED_REQUEST RequestType;
    uint ReadSize;
    uint ReadTime;
    uint WriteSize;
    uint WriteTime;
    uint StartLba;
    uint EndLba;
    WRITE_ROTATION RotationControl;
    BOOLEAN RestoreDefaults;
    BOOLEAN SetExact;
    BOOLEAN RandomAccess;
    BOOLEAN Persistent;
}
alias STREAMING_CONTROL_REQUEST_TYPE = int;
enum : int
{
    CdromStreamingDisable            = 0x00000001,
    CdromStreamingEnableForReadOnly  = 0x00000002,
    CdromStreamingEnableForWriteOnly = 0x00000003,
    CdromStreamingEnableForReadWrite = 0x00000004,
}

struct CDROM_STREAMING_CONTROL
{
    STREAMING_CONTROL_REQUEST_TYPE RequestType;
}
alias CDROM_OPC_INFO_TYPE = int;
enum : int
{
    SimpleOpcInfo = 0x00000001,
}

struct CDROM_SIMPLE_OPC_INFO
{
    CDROM_OPC_INFO_TYPE RequestType;
    BOOLEAN Exclude0;
    BOOLEAN Exclude1;
}
alias CDROM_PERFORMANCE_REQUEST_TYPE = int;
enum : int
{
    CdromPerformanceRequest = 0x00000001,
    CdromWriteSpeedRequest  = 0x00000002,
}

alias CDROM_PERFORMANCE_TYPE = int;
enum : int
{
    CdromReadPerformance  = 0x00000001,
    CdromWritePerformance = 0x00000002,
}

alias CDROM_PERFORMANCE_EXCEPTION_TYPE = int;
enum : int
{
    CdromNominalPerformance        = 0x00000001,
    CdromEntirePerformanceList     = 0x00000002,
    CdromPerformanceExceptionsOnly = 0x00000003,
}

alias CDROM_PERFORMANCE_TOLERANCE_TYPE = int;
enum : int
{
    Cdrom10Nominal20Exceptions = 0x00000001,
}

struct CDROM_PERFORMANCE_REQUEST
{
    CDROM_PERFORMANCE_REQUEST_TYPE RequestType;
    CDROM_PERFORMANCE_TYPE PerformanceType;
    CDROM_PERFORMANCE_EXCEPTION_TYPE Exceptions;
    CDROM_PERFORMANCE_TOLERANCE_TYPE Tolerance;
    uint StaringLba;
}
struct CDROM_WRITE_SPEED_REQUEST
{
    CDROM_PERFORMANCE_REQUEST_TYPE RequestType;
}
struct CDROM_PERFORMANCE_HEADER
{
    ubyte[4] DataLength;
    ubyte _bitfield0;
    ubyte[3] Reserved2;
    ubyte[1] Data;
}
struct CDROM_NOMINAL_PERFORMANCE_DESCRIPTOR
{
    ubyte[4] StartLba;
    ubyte[4] StartPerformance;
    ubyte[4] EndLba;
    ubyte[4] EndPerformance;
}
struct CDROM_EXCEPTION_PERFORMANCE_DESCRIPTOR
{
    ubyte[4] Lba;
    ubyte[2] Time;
}
struct CDROM_WRITE_SPEED_DESCRIPTOR
{
    ubyte _bitfield0;
    ubyte[3] Reserved3;
    ubyte[4] EndLba;
    ubyte[4] ReadSpeed;
    ubyte[4] WriteSpeed;
}
