module windows.win32.devices.dvd;

import windows.win32.foundation : HANDLE;

version (Windows):
extern (Windows):

enum IOCTL_DVD_BASE = 0x00000033;
enum IOCTL_DVD_START_SESSION = 0x00335000;
enum IOCTL_DVD_READ_KEY = 0x00335004;
enum IOCTL_DVD_SEND_KEY = 0x00335008;
enum IOCTL_DVD_END_SESSION = 0x0033500c;
enum IOCTL_DVD_SET_READ_AHEAD = 0x00335010;
enum IOCTL_DVD_GET_REGION = 0x00335014;
enum IOCTL_DVD_SEND_KEY2 = 0x0033d018;
enum IOCTL_AACS_READ_MEDIA_KEY_BLOCK_SIZE = 0x003350c0;
enum IOCTL_AACS_READ_MEDIA_KEY_BLOCK = 0x003350c4;
enum IOCTL_AACS_START_SESSION = 0x003350c8;
enum IOCTL_AACS_END_SESSION = 0x003350cc;
enum IOCTL_AACS_SEND_CERTIFICATE = 0x003350d0;
enum IOCTL_AACS_GET_CERTIFICATE = 0x003350d4;
enum IOCTL_AACS_GET_CHALLENGE_KEY = 0x003350d8;
enum IOCTL_AACS_SEND_CHALLENGE_KEY = 0x003350dc;
enum IOCTL_AACS_READ_VOLUME_ID = 0x003350e0;
enum IOCTL_AACS_READ_SERIAL_NUMBER = 0x003350e4;
enum IOCTL_AACS_READ_MEDIA_ID = 0x003350e8;
enum IOCTL_AACS_READ_BINDING_NONCE = 0x003350ec;
enum IOCTL_AACS_GENERATE_BINDING_NONCE = 0x0033d0f0;
enum IOCTL_DVD_READ_STRUCTURE = 0x00335140;
enum IOCTL_STORAGE_SET_READ_AHEAD = 0x002d4400;
enum DVD_CGMS_RESERVED_MASK = 0x00000078;
enum DVD_CGMS_COPY_PROTECT_MASK = 0x00000018;
enum DVD_CGMS_COPY_PERMITTED = 0x00000000;
enum DVD_CGMS_COPY_ONCE = 0x00000010;
enum DVD_CGMS_NO_COPY = 0x00000018;
enum DVD_COPYRIGHT_MASK = 0x00000040;
enum DVD_NOT_COPYRIGHTED = 0x00000000;
enum DVD_COPYRIGHTED = 0x00000040;
enum DVD_SECTOR_PROTECT_MASK = 0x00000020;
enum DVD_SECTOR_NOT_PROTECTED = 0x00000000;
enum DVD_SECTOR_PROTECTED = 0x00000020;
alias DVD_KEY_TYPE = int;
enum : int
{
    DvdChallengeKey   = 0x00000001,
    DvdBusKey1        = 0x00000002,
    DvdBusKey2        = 0x00000003,
    DvdTitleKey       = 0x00000004,
    DvdAsf            = 0x00000005,
    DvdSetRpcKey      = 0x00000006,
    DvdGetRpcKey      = 0x00000008,
    DvdDiskKey        = 0x00000080,
    DvdInvalidateAGID = 0x0000003f,
}

struct DVD_COPY_PROTECT_KEY
{
    align (1):
    uint KeyLength;
    uint SessionId;
    DVD_KEY_TYPE KeyType;
    uint KeyFlags;
    union Parameters
    {
        align (1):
        HANDLE FileHandle;
        long TitleOffset;
    }
    ubyte[1] KeyData;
}
struct STORAGE_SET_READ_AHEAD
{
    align (1):
    long TriggerAddress;
    long TargetAddress;
}
alias DVD_STRUCTURE_FORMAT = int;
enum : int
{
    DvdPhysicalDescriptor     = 0x00000000,
    DvdCopyrightDescriptor    = 0x00000001,
    DvdDiskKeyDescriptor      = 0x00000002,
    DvdBCADescriptor          = 0x00000003,
    DvdManufacturerDescriptor = 0x00000004,
    DvdMaxDescriptor          = 0x00000005,
}

struct DVD_READ_STRUCTURE
{
    align (1):
    long BlockByteOffset;
    DVD_STRUCTURE_FORMAT Format;
    uint SessionId;
    ubyte LayerNumber;
}
struct DVD_DESCRIPTOR_HEADER
{
    align (1):
    ushort Length;
    ubyte[2] Reserved;
    ubyte[1] Data;
}
struct DVD_LAYER_DESCRIPTOR
{
    align (1):
    ubyte _bitfield1;
    ubyte _bitfield2;
    ubyte _bitfield3;
    ubyte _bitfield4;
    uint StartingDataSector;
    uint EndDataSector;
    uint EndLayerZeroSector;
    ubyte _bitfield5;
}
struct DVD_FULL_LAYER_DESCRIPTOR
{
    DVD_LAYER_DESCRIPTOR commonHeader;
    ubyte[2031] MediaSpecific;
}
struct DVD_COPYRIGHT_DESCRIPTOR
{
    align (1):
    ubyte CopyrightProtectionType;
    ubyte RegionManagementInformation;
    ushort Reserved;
}
struct DVD_DISK_KEY_DESCRIPTOR
{
    ubyte[2048] DiskKeyData;
}
struct DVD_BCA_DESCRIPTOR
{
    ubyte[1] BCAInformation;
}
struct DVD_MANUFACTURER_DESCRIPTOR
{
    ubyte[2048] ManufacturingInformation;
}
struct DVD_COPYRIGHT_MANAGEMENT_DESCRIPTOR
{
    union
    {
        struct Dvdrom
        {
            ubyte _bitfield0;
        }
        struct DvdRecordable_Version1
        {
            ubyte _bitfield1;
        }
        struct Dvdram
        {
            ubyte Reserved0003;
        }
        struct DvdRecordable
        {
            ubyte _bitfield2;
        }
        ubyte CPR_MAI;
    }
    ubyte[3] Reserved0;
}
struct DVD_RAM_MEDIUM_STATUS
{
    ubyte _bitfield0;
    ubyte DiscTypeIdentification;
    ubyte Reserved2;
    ubyte MediaSpecificWriteInhibitInformation;
}
struct DVD_RAM_SPARE_AREA_INFORMATION
{
    ubyte[4] FreePrimarySpareSectors;
    ubyte[4] FreeSupplementalSpareSectors;
    ubyte[4] AllocatedSupplementalSpareSectors;
}
struct DVD_RAM_RECORDING_TYPE
{
    ubyte _bitfield0;
    ubyte[3] Reserved2;
}
struct DVD_RECORDING_MANAGEMENT_AREA_DATA
{
    ubyte[4] LastRecordedRMASectorNumber;
    ubyte[1] RMDBytes;
}
struct DVD_PRERECORDED_INFORMATION
{
    ubyte FieldID_1;
    ubyte DiscApplicationCode;
    ubyte DiscPhysicalCode;
    ubyte[3] LastAddressOfDataRecordableArea;
    ubyte _bitfield0;
    ubyte Reserved0;
    ubyte FieldID_2;
    ubyte OpcSuggestedCode;
    ubyte WavelengthCode;
    ubyte[4] WriteStrategyCode;
    ubyte Reserved2;
    ubyte FieldID_3;
    ubyte[6] ManufacturerId_3;
    ubyte Reserved3;
    ubyte FieldID_4;
    ubyte[6] ManufacturerId_4;
    ubyte Reserved4;
    ubyte FieldID_5;
    ubyte[6] ManufacturerId_5;
    ubyte Reserved5;
    ubyte[24] Reserved99;
}
struct DVD_UNIQUE_DISC_IDENTIFIER
{
    ubyte[2] Reserved0;
    ubyte[2] RandomNumber;
    ubyte[4] Year;
    ubyte[2] Month;
    ubyte[2] Day;
    ubyte[2] Hour;
    ubyte[2] Minute;
    ubyte[2] Second;
}
struct HD_DVD_R_MEDIUM_STATUS
{
    ubyte _bitfield0;
    ubyte NumberOfRemainingRMDsInRDZ;
    ubyte[2] NumberOfRemainingRMDsInCurrentRMZ;
}
struct DVD_DUAL_LAYER_RECORDING_INFORMATION
{
    ubyte _bitfield0;
    ubyte[3] Reserved1;
    ubyte[4] Layer0Sectors;
}
struct DVD_DUAL_LAYER_MIDDLE_ZONE_START_ADDRESS
{
    ubyte _bitfield0;
    ubyte[3] Reserved1;
    ubyte[4] ShiftedMiddleAreaStartAddress;
}
struct DVD_DUAL_LAYER_JUMP_INTERVAL_SIZE
{
    ubyte[4] Reserved1;
    ubyte[4] JumpIntervalSize;
}
struct DVD_DUAL_LAYER_MANUAL_LAYER_JUMP
{
    ubyte[4] Reserved1;
    ubyte[4] ManualJumpLayerAddress;
}
struct DVD_DUAL_LAYER_REMAPPING_INFORMATION
{
    ubyte[4] Reserved1;
    ubyte[4] RemappingAddress;
}
struct DVD_DISC_CONTROL_BLOCK_HEADER
{
    ubyte[4] ContentDescriptor;
    union ProhibitedActions
    {
        struct
        {
            ubyte[3] ReservedDoNotUse_UseAsByteInstead_0;
            ubyte _bitfield0;
        }
        ubyte[4] AsByte;
    }
    ubyte[32] VendorId;
}
alias DISC_CONTROL_BLOCK_TYPE = int;
enum : int
{
    FormattingDiscControlBlock   = 0x46444300,
    WriteInhibitDiscControlBlock = 0x57444300,
    SessionInfoDiscControlBlock  = 0x53444300,
    DiscControlBlockList         = 0xffffffff,
}

struct DVD_DISC_CONTROL_BLOCK_WRITE_INHIBIT
{
    DVD_DISC_CONTROL_BLOCK_HEADER header;
    ubyte[4] UpdateCount;
    union WriteProtectActions
    {
        struct
        {
            ubyte[3] ReservedDoNotUse_UseAsByteInstead_0;
            ubyte _bitfield0;
        }
        ubyte[4] AsByte;
    }
    ubyte[16] Reserved0;
    ubyte[32] UpdatePassword;
    ubyte[32672] Reserved1;
}
struct DVD_DISC_CONTROL_BLOCK_SESSION_ITEM
{
    ubyte[16] AsByte;
}
struct DVD_DISC_CONTROL_BLOCK_SESSION
{
    DVD_DISC_CONTROL_BLOCK_HEADER header;
    ubyte[2] SessionNumber;
    ubyte[22] Reserved0;
    ubyte[32] DiscID;
    ubyte[32] Reserved1;
    DVD_DISC_CONTROL_BLOCK_SESSION_ITEM[504] SessionItem;
    ubyte[24576] Reserved2;
}
struct DVD_DISC_CONTROL_BLOCK_LIST_DCB
{
    ubyte[4] DcbIdentifier;
}
struct DVD_DISC_CONTROL_BLOCK_LIST
{
    DVD_DISC_CONTROL_BLOCK_HEADER header;
    ubyte Reserved0;
    ubyte ReadabldDCBs;
    ubyte Reserved1;
    ubyte WritableDCBs;
    DVD_DISC_CONTROL_BLOCK_LIST_DCB[1] Dcbs;
}
struct DVD_WRITE_PROTECTION_STATUS
{
    ubyte _bitfield0;
    ubyte[3] Reserved1;
}
struct DVD_LIST_OF_RECOGNIZED_FORMAT_LAYERS
{
    ubyte[2] TypeCodeOfFormatLayer;
}
struct DVD_LIST_OF_RECOGNIZED_FORMAT_LAYERS_TYPE_CODE
{
    ubyte NumberOfRecognizedFormatLayers;
    ubyte _bitfield0;
}
struct DVD_STRUCTURE_LIST_ENTRY
{
    ubyte FormatCode;
    ubyte _bitfield0;
    ubyte[2] FormatLength;
}
struct DVD_BD_SPARE_AREA_INFORMATION
{
    ubyte[4] Reserved1;
    ubyte[4] NumberOfFreeSpareBlocks;
    ubyte[4] NumberOfAllocatedSpareBlocks;
}
struct BD_PAC_HEADER
{
    ubyte[3] PACId;
    ubyte PACFormatNumber;
    ubyte[4] PACUpdateCount;
    ubyte[4] UnknownPACRules;
    ubyte UnkownPACEntireDiscFlag;
    ubyte[2] Reserved1;
    ubyte NumberOfSegments;
    ubyte[256] Segments;
    ubyte[112] Reserved2;
}
struct BD_DISC_WRITE_PROTECT_PAC
{
    BD_PAC_HEADER Header;
    ubyte KnownPACEntireDiscFlags;
    ubyte[3] Reserved1;
    ubyte WriteProtectControlByte;
    ubyte[7] Reserved2;
    ubyte[32] WriteProtectPassword;
}
struct DVD_RPC_KEY
{
    ubyte _bitfield0;
    ubyte RegionMask;
    ubyte RpcScheme;
    ubyte Reserved02;
}
struct DVD_SET_RPC_KEY
{
    ubyte PreferredDriveRegionCode;
    ubyte[3] Reserved;
}
struct DVD_ASF
{
    ubyte[3] Reserved0;
    ubyte _bitfield0;
}
struct DVD_REGION
{
    ubyte CopySystem;
    ubyte RegionData;
    ubyte SystemRegion;
    ubyte ResetCount;
}
struct AACS_CERTIFICATE
{
    ubyte[20] Nonce;
    ubyte[92] Certificate;
}
struct AACS_CHALLENGE_KEY
{
    ubyte[40] EllipticCurvePoint;
    ubyte[40] Signature;
}
struct AACS_VOLUME_ID
{
    ubyte[16] VolumeID;
    ubyte[16] MAC;
}
struct AACS_SERIAL_NUMBER
{
    ubyte[16] PrerecordedSerialNumber;
    ubyte[16] MAC;
}
struct AACS_MEDIA_ID
{
    ubyte[16] MediaID;
    ubyte[16] MAC;
}
struct AACS_SEND_CERTIFICATE
{
    uint SessionId;
    AACS_CERTIFICATE Certificate;
}
struct AACS_SEND_CHALLENGE_KEY
{
    uint SessionId;
    AACS_CHALLENGE_KEY ChallengeKey;
}
struct AACS_BINDING_NONCE
{
    ubyte[16] BindingNonce;
    ubyte[16] MAC;
}
struct AACS_READ_BINDING_NONCE
{
    uint SessionId;
    uint NumberOfSectors;
    ulong StartLba;
    union
    {
        HANDLE Handle;
        ulong ForceStructureLengthToMatch64bit;
    }
}
