module windows.win32.media.devicemanager;

import windows.win32.guid : GUID;
import windows.win32.foundation : BOOL, HRESULT, PSTR, PWSTR;
import windows.win32.media.audio_ : WAVEFORMATEX;
import windows.win32.media.mediafoundation : VIDEOINFOHEADER;
import windows.win32.system.com_ : IUnknown;
import windows.win32.system.com.structuredstorage : PROPVARIANT;
import windows.win32.system.ole : ISpecifyPropertyPages;

version (Windows):
extern (Windows):

enum IOCTL_MTP_CUSTOM_COMMAND = 0x3150544d;
enum MTP_NEXTPHASE_READ_DATA = 0x00000001;
enum MTP_NEXTPHASE_WRITE_DATA = 0x00000002;
enum MTP_NEXTPHASE_NO_DATA = 0x00000003;
enum RSA_KEY_LEN = 0x00000040;
enum SAC_SESSION_KEYLEN = 0x00000008;
enum SAC_PROTOCOL_WMDM = 0x00000001;
enum SAC_PROTOCOL_V1 = 0x00000002;
enum SAC_CERT_X509 = 0x00000001;
enum SAC_CERT_V1 = 0x00000002;
enum WMDM_DEVICE_PROTOCOL_MTP = GUID(0x979e54e5, 0xafc, 0x4604, [0x8d, 0x93, 0xdc, 0x79, 0x8a, 0x4b, 0xcf, 0x45]);
enum WMDM_DEVICE_PROTOCOL_RAPI = GUID(0x2a11ed91, 0x8c8f, 0x41e4, [0x82, 0xd1, 0x83, 0x86, 0xe0, 0x3, 0x56, 0x1c]);
enum WMDM_DEVICE_PROTOCOL_MSC = GUID(0xa4d2c26c, 0xa881, 0x44bb, [0xbd, 0x5d, 0x1f, 0x70, 0x3c, 0x71, 0xf7, 0xa9]);
enum WMDM_SERVICE_PROVIDER_VENDOR_MICROSOFT = GUID(0x7de8686d, 0x78ee, 0x43ea, [0xa4, 0x96, 0xc6, 0x25, 0xac, 0x91, 0xcc, 0x5d]);
enum WMDMID_LENGTH = 0x00000080;
enum WMDM_MAC_LENGTH = 0x00000008;
enum WMDM_S_NOT_ALL_PROPERTIES_APPLIED = 0x00045001;
enum WMDM_S_NOT_ALL_PROPERTIES_RETRIEVED = 0x00045002;
enum WMDM_E_BUSY = 0xffffffff80045000;
enum WMDM_E_INTERFACEDEAD = 0xffffffff80045001;
enum WMDM_E_INVALIDTYPE = 0xffffffff80045002;
enum WMDM_E_PROCESSFAILED = 0xffffffff80045003;
enum WMDM_E_NOTSUPPORTED = 0xffffffff80045004;
enum WMDM_E_NOTCERTIFIED = 0xffffffff80045005;
enum WMDM_E_NORIGHTS = 0xffffffff80045006;
enum WMDM_E_CALL_OUT_OF_SEQUENCE = 0xffffffff80045007;
enum WMDM_E_BUFFERTOOSMALL = 0xffffffff80045008;
enum WMDM_E_MOREDATA = 0xffffffff80045009;
enum WMDM_E_MAC_CHECK_FAILED = 0xffffffff8004500a;
enum WMDM_E_USER_CANCELLED = 0xffffffff8004500b;
enum WMDM_E_SDMI_TRIGGER = 0xffffffff8004500c;
enum WMDM_E_SDMI_NOMORECOPIES = 0xffffffff8004500d;
enum WMDM_E_REVOKED = 0xffffffff8004500e;
enum WMDM_E_LICENSE_NOTEXIST = 0xffffffff8004500f;
enum WMDM_E_INCORRECT_APPSEC = 0xffffffff80045010;
enum WMDM_E_INCORRECT_RIGHTS = 0xffffffff80045011;
enum WMDM_E_LICENSE_EXPIRED = 0xffffffff80045012;
enum WMDM_E_CANTOPEN_PMSN_SERVICE_PIPE = 0xffffffff80045013;
enum WMDM_E_TOO_MANY_SESSIONS = 0xffffffff80045013;
enum WMDM_WMDM_REVOKED = 0x00000001;
enum WMDM_APP_REVOKED = 0x00000002;
enum WMDM_SP_REVOKED = 0x00000004;
enum WMDM_SCP_REVOKED = 0x00000008;
enum WMDM_GET_FORMAT_SUPPORT_AUDIO = 0x00000001;
enum WMDM_GET_FORMAT_SUPPORT_VIDEO = 0x00000002;
enum WMDM_GET_FORMAT_SUPPORT_FILE = 0x00000004;
enum WMDM_RIGHTS_PLAYBACKCOUNT = 0x00000001;
enum WMDM_RIGHTS_EXPIRATIONDATE = 0x00000002;
enum WMDM_RIGHTS_GROUPID = 0x00000004;
enum WMDM_RIGHTS_FREESERIALIDS = 0x00000008;
enum WMDM_RIGHTS_NAMEDSERIALIDS = 0x00000010;
enum WMDM_DEVICE_TYPE_PLAYBACK = 0x00000001;
enum WMDM_DEVICE_TYPE_RECORD = 0x00000002;
enum WMDM_DEVICE_TYPE_DECODE = 0x00000004;
enum WMDM_DEVICE_TYPE_ENCODE = 0x00000008;
enum WMDM_DEVICE_TYPE_STORAGE = 0x00000010;
enum WMDM_DEVICE_TYPE_VIRTUAL = 0x00000020;
enum WMDM_DEVICE_TYPE_SDMI = 0x00000040;
enum WMDM_DEVICE_TYPE_NONSDMI = 0x00000080;
enum WMDM_DEVICE_TYPE_NONREENTRANT = 0x00000100;
enum WMDM_DEVICE_TYPE_FILELISTRESYNC = 0x00000200;
enum WMDM_DEVICE_TYPE_VIEW_PREF_METADATAVIEW = 0x00000400;
enum WMDM_POWER_CAP_BATTERY = 0x00000001;
enum WMDM_POWER_CAP_EXTERNAL = 0x00000002;
enum WMDM_POWER_IS_BATTERY = 0x00000004;
enum WMDM_POWER_IS_EXTERNAL = 0x00000008;
enum WMDM_POWER_PERCENT_AVAILABLE = 0x00000010;
enum WMDM_STATUS_READY = 0x00000001;
enum WMDM_STATUS_BUSY = 0x00000002;
enum WMDM_STATUS_DEVICE_NOTPRESENT = 0x00000004;
enum WMDM_STATUS_DEVICECONTROL_PLAYING = 0x00000008;
enum WMDM_STATUS_DEVICECONTROL_RECORDING = 0x00000010;
enum WMDM_STATUS_DEVICECONTROL_PAUSED = 0x00000020;
enum WMDM_STATUS_DEVICECONTROL_REMOTE = 0x00000040;
enum WMDM_STATUS_DEVICECONTROL_STREAM = 0x00000080;
enum WMDM_STATUS_STORAGE_NOTPRESENT = 0x00000100;
enum WMDM_STATUS_STORAGE_INITIALIZING = 0x00000200;
enum WMDM_STATUS_STORAGE_BROKEN = 0x00000400;
enum WMDM_STATUS_STORAGE_NOTSUPPORTED = 0x00000800;
enum WMDM_STATUS_STORAGE_UNFORMATTED = 0x00001000;
enum WMDM_STATUS_STORAGECONTROL_INSERTING = 0x00002000;
enum WMDM_STATUS_STORAGECONTROL_DELETING = 0x00004000;
enum WMDM_STATUS_STORAGECONTROL_APPENDING = 0x00008000;
enum WMDM_STATUS_STORAGECONTROL_MOVING = 0x00010000;
enum WMDM_STATUS_STORAGECONTROL_READING = 0x00020000;
enum WMDM_DEVICECAP_CANPLAY = 0x00000001;
enum WMDM_DEVICECAP_CANSTREAMPLAY = 0x00000002;
enum WMDM_DEVICECAP_CANRECORD = 0x00000004;
enum WMDM_DEVICECAP_CANSTREAMRECORD = 0x00000008;
enum WMDM_DEVICECAP_CANPAUSE = 0x00000010;
enum WMDM_DEVICECAP_CANRESUME = 0x00000020;
enum WMDM_DEVICECAP_CANSTOP = 0x00000040;
enum WMDM_DEVICECAP_CANSEEK = 0x00000080;
enum WMDM_DEVICECAP_HASSECURECLOCK = 0x00000100;
enum WMDM_SEEK_REMOTECONTROL = 0x00000001;
enum WMDM_SEEK_STREAMINGAUDIO = 0x00000002;
enum WMDM_STORAGE_ATTR_FILESYSTEM = 0x00000001;
enum WMDM_STORAGE_ATTR_REMOVABLE = 0x00000002;
enum WMDM_STORAGE_ATTR_NONREMOVABLE = 0x00000004;
enum WMDM_FILE_ATTR_FOLDER = 0x00000008;
enum WMDM_FILE_ATTR_LINK = 0x00000010;
enum WMDM_FILE_ATTR_FILE = 0x00000020;
enum WMDM_FILE_ATTR_VIDEO = 0x00000040;
enum WMDM_STORAGE_ATTR_CANEDITMETADATA = 0x00000080;
enum WMDM_STORAGE_ATTR_FOLDERS = 0x00000100;
enum WMDM_FILE_ATTR_AUDIO = 0x00001000;
enum WMDM_FILE_ATTR_DATA = 0x00002000;
enum WMDM_FILE_ATTR_CANPLAY = 0x00004000;
enum WMDM_FILE_ATTR_CANDELETE = 0x00008000;
enum WMDM_FILE_ATTR_CANMOVE = 0x00010000;
enum WMDM_FILE_ATTR_CANRENAME = 0x00020000;
enum WMDM_FILE_ATTR_CANREAD = 0x00040000;
enum WMDM_FILE_ATTR_MUSIC = 0x00080000;
enum WMDM_FILE_CREATE_OVERWRITE = 0x00100000;
enum WMDM_FILE_ATTR_AUDIOBOOK = 0x00200000;
enum WMDM_FILE_ATTR_HIDDEN = 0x00400000;
enum WMDM_FILE_ATTR_SYSTEM = 0x00800000;
enum WMDM_FILE_ATTR_READONLY = 0x01000000;
enum WMDM_STORAGE_ATTR_HAS_FOLDERS = 0x02000000;
enum WMDM_STORAGE_ATTR_HAS_FILES = 0x04000000;
enum WMDM_STORAGE_IS_DEFAULT = 0x08000000;
enum WMDM_STORAGE_CONTAINS_DEFAULT = 0x10000000;
enum WMDM_STORAGE_ATTR_VIRTUAL = 0x20000000;
enum WMDM_STORAGECAP_FOLDERSINROOT = 0x00000001;
enum WMDM_STORAGECAP_FILESINROOT = 0x00000002;
enum WMDM_STORAGECAP_FOLDERSINFOLDERS = 0x00000004;
enum WMDM_STORAGECAP_FILESINFOLDERS = 0x00000008;
enum WMDM_STORAGECAP_FOLDERLIMITEXISTS = 0x00000010;
enum WMDM_STORAGECAP_FILELIMITEXISTS = 0x00000020;
enum WMDM_STORAGECAP_NOT_INITIALIZABLE = 0x00000040;
enum WMDM_MODE_BLOCK = 0x00000001;
enum WMDM_MODE_THREAD = 0x00000002;
enum WMDM_CONTENT_FILE = 0x00000004;
enum WMDM_CONTENT_FOLDER = 0x00000008;
enum WMDM_CONTENT_OPERATIONINTERFACE = 0x00000010;
enum WMDM_MODE_QUERY = 0x00000020;
enum WMDM_MODE_PROGRESS = 0x00000040;
enum WMDM_MODE_TRANSFER_PROTECTED = 0x00000080;
enum WMDM_MODE_TRANSFER_UNPROTECTED = 0x00000100;
enum WMDM_STORAGECONTROL_INSERTBEFORE = 0x00000200;
enum WMDM_STORAGECONTROL_INSERTAFTER = 0x00000400;
enum WMDM_STORAGECONTROL_INSERTINTO = 0x00000800;
enum WMDM_MODE_RECURSIVE = 0x00001000;
enum WMDM_RIGHTS_PLAY_ON_PC = 0x00000001;
enum WMDM_RIGHTS_COPY_TO_NON_SDMI_DEVICE = 0x00000002;
enum WMDM_RIGHTS_COPY_TO_CD = 0x00000008;
enum WMDM_RIGHTS_COPY_TO_SDMI_DEVICE = 0x00000010;
enum WMDM_SEEK_BEGIN = 0x00000001;
enum WMDM_SEEK_CURRENT = 0x00000002;
enum WMDM_SEEK_END = 0x00000008;
enum DO_NOT_VIRTUALIZE_STORAGES_AS_DEVICES = 0x00000001;
enum ALLOW_OUTOFBAND_NOTIFICATION = 0x00000002;
enum MDSP_READ = 0x00000001;
enum MDSP_WRITE = 0x00000002;
enum MDSP_SEEK_BOF = 0x00000001;
enum MDSP_SEEK_CUR = 0x00000002;
enum MDSP_SEEK_EOF = 0x00000004;
enum WMDM_SCP_EXAMINE_EXTENSION = 0x00000001;
enum WMDM_SCP_EXAMINE_DATA = 0x00000002;
enum WMDM_SCP_DECIDE_DATA = 0x00000008;
enum WMDM_SCP_PROTECTED_OUTPUT = 0x00000010;
enum WMDM_SCP_UNPROTECTED_OUTPUT = 0x00000020;
enum WMDM_SCP_RIGHTS_DATA = 0x00000040;
enum WMDM_SCP_TRANSFER_OBJECTDATA = 0x00000020;
enum WMDM_SCP_NO_MORE_CHANGES = 0x00000040;
enum WMDM_SCP_DRMINFO_NOT_DRMPROTECTED = 0x00000000;
enum WMDM_SCP_DRMINFO_V1HEADER = 0x00000001;
enum WMDM_SCP_DRMINFO_V2HEADER = 0x00000002;
enum SCP_EVENTID_ACQSECURECLOCK = GUID(0x86248cc9, 0x4a59, 0x43e2, [0x91, 0x46, 0x48, 0xa7, 0xf3, 0xf4, 0x14, 0xc]);
enum SCP_EVENTID_NEEDTOINDIV = GUID(0x87a507c7, 0xb469, 0x4386, [0xb9, 0x76, 0xd5, 0xd1, 0xce, 0x53, 0x8a, 0x6f]);
enum SCP_EVENTID_DRMINFO = GUID(0x213dd287, 0x41d2, 0x432b, [0x9e, 0x3f, 0x3b, 0x4f, 0x7b, 0x35, 0x81, 0xdd]);
enum SCP_PARAMID_DRMVERSION = GUID(0x41d0155d, 0x7cc7, 0x4217, [0xad, 0xa9, 0x0, 0x50, 0x74, 0x62, 0x4d, 0xa4]);
enum SAC_MAC_LEN = 0x00000008;
enum WMDM_LOG_SEV_INFO = 0x00000001;
enum WMDM_LOG_SEV_WARN = 0x00000002;
enum WMDM_LOG_SEV_ERROR = 0x00000004;
enum WMDM_LOG_NOTIMESTAMP = 0x00000010;
enum g_wszWMDMFileName = "WMDM/FileName";
enum g_wszWMDMFormatCode = "WMDM/FormatCode";
enum g_wszWMDMLastModifiedDate = "WMDM/LastModifiedDate";
enum g_wszWMDMFileCreationDate = "WMDM/FileCreationDate";
enum g_wszWMDMFileSize = "WMDM/FileSize";
enum g_wszWMDMFileAttributes = "WMDM/FileAttributes";
enum g_wszAudioWAVECodec = "WMDM/AudioWAVECodec";
enum g_wszVideoFourCCCodec = "WMDM/VideoFourCCCodec";
enum g_wszWMDMTitle = "WMDM/Title";
enum g_wszWMDMAuthor = "WMDM/Author";
enum g_wszWMDMDescription = "WMDM/Description";
enum g_wszWMDMIsProtected = "WMDM/IsProtected";
enum g_wszWMDMAlbumTitle = "WMDM/AlbumTitle";
enum g_wszWMDMAlbumArtist = "WMDM/AlbumArtist";
enum g_wszWMDMTrack = "WMDM/Track";
enum g_wszWMDMGenre = "WMDM/Genre";
enum g_wszWMDMTrackMood = "WMDM/TrackMood";
enum g_wszWMDMAlbumCoverFormat = "WMDM/AlbumCoverFormat";
enum g_wszWMDMAlbumCoverSize = "WMDM/AlbumCoverSize";
enum g_wszWMDMAlbumCoverHeight = "WMDM/AlbumCoverHeight";
enum g_wszWMDMAlbumCoverWidth = "WMDM/AlbumCoverWidth";
enum g_wszWMDMAlbumCoverDuration = "WMDM/AlbumCoverDuration";
enum g_wszWMDMAlbumCoverData = "WMDM/AlbumCoverData";
enum g_wszWMDMYear = "WMDM/Year";
enum g_wszWMDMComposer = "WMDM/Composer";
enum g_wszWMDMCodec = "WMDM/Codec";
enum g_wszWMDMDRMId = "WMDM/DRMId";
enum g_wszWMDMBitrate = "WMDM/Bitrate";
enum g_wszWMDMBitRateType = "WMDM/BitRateType";
enum g_wszWMDMSampleRate = "WMDM/SampleRate";
enum g_wszWMDMNumChannels = "WMDM/NumChannels";
enum g_wszWMDMBlockAlignment = "WMDM/BlockAlignment";
enum g_wszWMDMAudioBitDepth = "WMDM/AudioBitDepth";
enum g_wszWMDMTotalBitrate = "WMDM/TotalBitrate";
enum g_wszWMDMVideoBitrate = "WMDM/VideoBitrate";
enum g_wszWMDMFrameRate = "WMDM/FrameRate";
enum g_wszWMDMScanType = "WMDM/ScanType";
enum g_wszWMDMKeyFrameDistance = "WMDM/KeyFrameDistance";
enum g_wszWMDMBufferSize = "WMDM/BufferSize";
enum g_wszWMDMQualitySetting = "WMDM/QualitySetting";
enum g_wszWMDMEncodingProfile = "WMDM/EncodingProfile";
enum g_wszWMDMDuration = "WMDM/Duration";
enum g_wszWMDMAlbumArt = "WMDM/AlbumArt";
enum g_wszWMDMBuyNow = "WMDM/BuyNow";
enum g_wszWMDMNonConsumable = "WMDM/NonConsumable";
enum g_wszWMDMediaClassPrimaryID = "WMDM/MediaClassPrimaryID";
enum g_wszWMDMMediaClassSecondaryID = "WMDM/MediaClassSecondaryID";
enum g_wszWMDMUserEffectiveRating = "WMDM/UserEffectiveRating";
enum g_wszWMDMUserRating = "WMDM/UserRating";
enum g_wszWMDMUserRatingOnDevice = "WMDM/UserRatingOnDevice";
enum g_wszWMDMPlayCount = "WMDM/PlayCount";
enum g_wszWMDMDevicePlayCount = "WMDM/DevicePlayCount";
enum g_wszWMDMAuthorDate = "WMDM/AuthorDate";
enum g_wszWMDMUserLastPlayTime = "WMDM/UserLastPlayTime";
enum g_wszWMDMSubTitle = "WMDM/SubTitle";
enum g_wszWMDMSubTitleDescription = "WMDM/SubTitleDescription";
enum g_wszWMDMMediaCredits = "WMDM/MediaCredits";
enum g_wszWMDMMediaStationName = "WMDM/MediaStationName";
enum g_wszWMDMMediaOriginalChannel = "WMDM/MediaOriginalChannel";
enum g_wszWMDMMediaOriginalBroadcastDateTime = "WMDM/MediaOriginalBroadcastDateTime";
enum g_wszWMDMProviderCopyright = "WMDM/ProviderCopyright";
enum g_wszWMDMSyncID = "WMDM/SyncID";
enum g_wszWMDMPersistentUniqueID = "WMDM/PersistentUniqueID";
enum g_wszWMDMWidth = "WMDM/Width";
enum g_wszWMDMHeight = "WMDM/Height";
enum g_wszWMDMSyncTime = "WMDM/SyncTime";
enum g_wszWMDMParentalRating = "WMDM/ParentalRating";
enum g_wszWMDMMetaGenre = "WMDM/MetaGenre";
enum g_wszWMDMIsRepeat = "WMDM/IsRepeat";
enum g_wszWMDMSupportedDeviceProperties = "WMDM/SupportedDeviceProperties";
enum g_wszWMDMDeviceFriendlyName = "WMDM/DeviceFriendlyName";
enum g_wszWMDMFormatsSupported = "WMDM/FormatsSupported";
enum g_wszWMDMFormatsSupportedAreOrdered = "WMDM/FormatsSupportedAreOrdered";
enum g_wszWMDMSyncRelationshipID = "WMDM/SyncRelationshipID";
enum g_wszWMDMDeviceModelName = "WMDM/DeviceModelName";
enum g_wszWMDMDeviceFirmwareVersion = "WMDM/DeviceFirmwareVersion";
enum g_wszWMDMDeviceVendorExtension = "WMDM/DeviceVendorExtension";
enum g_wszWMDMDeviceProtocol = "WMDM/DeviceProtocol";
enum g_wszWMDMDeviceServiceProviderVendor = "WMDM/DeviceServiceProviderVendor";
enum g_wszWMDMDeviceRevocationInfo = "WMDM/DeviceRevocationInfo";
enum g_wszWMDMCollectionID = "WMDM/CollectionID";
enum g_wszWMDMOwner = "WMDM/Owner";
enum g_wszWMDMEditor = "WMDM/Editor";
enum g_wszWMDMWebmaster = "WMDM/Webmaster";
enum g_wszWMDMSourceURL = "WMDM/SourceURL";
enum g_wszWMDMDestinationURL = "WMDM/DestinationURL";
enum g_wszWMDMCategory = "WMDM/Category";
enum g_wszWMDMTimeBookmark = "WMDM/TimeBookmark";
enum g_wszWMDMObjectBookmark = "WMDM/ObjectBookmark";
enum g_wszWMDMByteBookmark = "WMDM/ByteBookmark";
enum g_wszWMDMDataOffset = "WMDM/DataOffset";
enum g_wszWMDMDataLength = "WMDM/DataLength";
enum g_wszWMDMDataUnits = "WMDM/DataUnits";
enum g_wszWMDMTimeToLive = "WMDM/TimeToLive";
enum g_wszWMDMMediaGuid = "WMDM/MediaGuid";
enum g_wszWPDPassthroughPropertyValues = "WPD/PassthroughPropertyValues";
enum EVENT_WMDM_CONTENT_TRANSFER = GUID(0x339c9bf4, 0xbcfe, 0x4ed8, [0x94, 0xdf, 0xea, 0xf8, 0xc2, 0x6a, 0xb6, 0x1b]);
enum MTP_COMMAND_MAX_PARAMS = 0x00000005;
enum MTP_RESPONSE_MAX_PARAMS = 0x00000005;
enum MTP_RESPONSE_OK = 0x2001;
struct MACINFO
{
    BOOL fUsed;
    ubyte[36] abMacState;
}
enum CLSID_MediaDevMgrClassFactory = GUID(0x50040c1d, 0xbdbf, 0x4924, [0xb8, 0x73, 0xf1, 0x4d, 0x6c, 0x5b, 0xfd, 0x66]);
struct MediaDevMgrClassFactory
{
}
enum CLSID_MediaDevMgr = GUID(0x25baad81, 0x3560, 0x11d3, [0x84, 0x71, 0x0, 0xc0, 0x4f, 0x79, 0xdb, 0xc0]);
struct MediaDevMgr
{
}
enum CLSID_WMDMDevice = GUID(0x807b3cdf, 0x357a, 0x11d3, [0x84, 0x71, 0x0, 0xc0, 0x4f, 0x79, 0xdb, 0xc0]);
struct WMDMDevice
{
}
enum CLSID_WMDMStorage = GUID(0x807b3ce0, 0x357a, 0x11d3, [0x84, 0x71, 0x0, 0xc0, 0x4f, 0x79, 0xdb, 0xc0]);
struct WMDMStorage
{
}
enum CLSID_WMDMStorageGlobal = GUID(0x807b3ce1, 0x357a, 0x11d3, [0x84, 0x71, 0x0, 0xc0, 0x4f, 0x79, 0xdb, 0xc0]);
struct WMDMStorageGlobal
{
}
enum CLSID_WMDMDeviceEnum = GUID(0x430e35af, 0x3971, 0x11d3, [0x84, 0x74, 0x0, 0xc0, 0x4f, 0x79, 0xdb, 0xc0]);
struct WMDMDeviceEnum
{
}
enum CLSID_WMDMStorageEnum = GUID(0xeb401a3b, 0x3af7, 0x11d3, [0x84, 0x74, 0x0, 0xc0, 0x4f, 0x79, 0xdb, 0xc0]);
struct WMDMStorageEnum
{
}
alias WMDM_TAG_DATATYPE = int;
enum : int
{
    WMDM_TYPE_DWORD  = 0x00000000,
    WMDM_TYPE_STRING = 0x00000001,
    WMDM_TYPE_BINARY = 0x00000002,
    WMDM_TYPE_BOOL   = 0x00000003,
    WMDM_TYPE_QWORD  = 0x00000004,
    WMDM_TYPE_WORD   = 0x00000005,
    WMDM_TYPE_GUID   = 0x00000006,
    WMDM_TYPE_DATE   = 0x00000007,
}

alias WMDM_SESSION_TYPE = int;
enum : int
{
    WMDM_SESSION_NONE                 = 0x00000000,
    WMDM_SESSION_TRANSFER_TO_DEVICE   = 0x00000001,
    WMDM_SESSION_TRANSFER_FROM_DEVICE = 0x00000010,
    WMDM_SESSION_DELETE               = 0x00000100,
    WMDM_SESSION_CUSTOM               = 0x00001000,
}

struct WMFILECAPABILITIES
{
    PWSTR pwszMimeType;
    uint dwReserved;
}
struct OPAQUECOMMAND
{
    GUID guidCommand;
    uint dwDataLen;
    ubyte* pData;
    ubyte[20] abMAC;
}
struct WMDMID
{
    uint cbSize;
    uint dwVendorID;
    ubyte[128] pID;
    uint SerialNumberLength;
}
struct WMDMDATETIME
{
    ushort wYear;
    ushort wMonth;
    ushort wDay;
    ushort wHour;
    ushort wMinute;
    ushort wSecond;
}
struct WMDMRIGHTS
{
    uint cbSize;
    uint dwContentType;
    uint fuFlags;
    uint fuRights;
    uint dwAppSec;
    uint dwPlaybackCount;
    WMDMDATETIME ExpirationDate;
}
struct WMDMMetadataView
{
    PWSTR pwszViewName;
    uint nDepth;
    ushort** ppwszTags;
}
alias WMDM_STORAGE_ENUM_MODE = int;
enum : int
{
    ENUM_MODE_RAW             = 0x00000000,
    ENUM_MODE_USE_DEVICE_PREF = 0x00000001,
    ENUM_MODE_METADATA_VIEWS  = 0x00000002,
}

alias WMDM_FORMATCODE = int;
enum : int
{
    WMDM_FORMATCODE_NOTUSED                     = 0x00000000,
    WMDM_FORMATCODE_ALLIMAGES                   = 0xffffffff,
    WMDM_FORMATCODE_UNDEFINED                   = 0x00003000,
    WMDM_FORMATCODE_ASSOCIATION                 = 0x00003001,
    WMDM_FORMATCODE_SCRIPT                      = 0x00003002,
    WMDM_FORMATCODE_EXECUTABLE                  = 0x00003003,
    WMDM_FORMATCODE_TEXT                        = 0x00003004,
    WMDM_FORMATCODE_HTML                        = 0x00003005,
    WMDM_FORMATCODE_DPOF                        = 0x00003006,
    WMDM_FORMATCODE_AIFF                        = 0x00003007,
    WMDM_FORMATCODE_WAVE                        = 0x00003008,
    WMDM_FORMATCODE_MP3                         = 0x00003009,
    WMDM_FORMATCODE_AVI                         = 0x0000300a,
    WMDM_FORMATCODE_MPEG                        = 0x0000300b,
    WMDM_FORMATCODE_ASF                         = 0x0000300c,
    WMDM_FORMATCODE_RESERVED_FIRST              = 0x0000300d,
    WMDM_FORMATCODE_RESERVED_LAST               = 0x000037ff,
    WMDM_FORMATCODE_IMAGE_UNDEFINED             = 0x00003800,
    WMDM_FORMATCODE_IMAGE_EXIF                  = 0x00003801,
    WMDM_FORMATCODE_IMAGE_TIFFEP                = 0x00003802,
    WMDM_FORMATCODE_IMAGE_FLASHPIX              = 0x00003803,
    WMDM_FORMATCODE_IMAGE_BMP                   = 0x00003804,
    WMDM_FORMATCODE_IMAGE_CIFF                  = 0x00003805,
    WMDM_FORMATCODE_IMAGE_GIF                   = 0x00003807,
    WMDM_FORMATCODE_IMAGE_JFIF                  = 0x00003808,
    WMDM_FORMATCODE_IMAGE_PCD                   = 0x00003809,
    WMDM_FORMATCODE_IMAGE_PICT                  = 0x0000380a,
    WMDM_FORMATCODE_IMAGE_PNG                   = 0x0000380b,
    WMDM_FORMATCODE_IMAGE_TIFF                  = 0x0000380d,
    WMDM_FORMATCODE_IMAGE_TIFFIT                = 0x0000380e,
    WMDM_FORMATCODE_IMAGE_JP2                   = 0x0000380f,
    WMDM_FORMATCODE_IMAGE_JPX                   = 0x00003810,
    WMDM_FORMATCODE_IMAGE_RESERVED_FIRST        = 0x00003811,
    WMDM_FORMATCODE_IMAGE_RESERVED_LAST         = 0x00003fff,
    WMDM_FORMATCODE_UNDEFINEDFIRMWARE           = 0x0000b802,
    WMDM_FORMATCODE_WBMP                        = 0x0000b803,
    WMDM_FORMATCODE_JPEGXR                      = 0x0000b804,
    WMDM_FORMATCODE_WINDOWSIMAGEFORMAT          = 0x0000b881,
    WMDM_FORMATCODE_UNDEFINEDAUDIO              = 0x0000b900,
    WMDM_FORMATCODE_WMA                         = 0x0000b901,
    WMDM_FORMATCODE_OGG                         = 0x0000b902,
    WMDM_FORMATCODE_AAC                         = 0x0000b903,
    WMDM_FORMATCODE_AUDIBLE                     = 0x0000b904,
    WMDM_FORMATCODE_FLAC                        = 0x0000b906,
    WMDM_FORMATCODE_QCELP                       = 0x0000b907,
    WMDM_FORMATCODE_AMR                         = 0x0000b908,
    WMDM_FORMATCODE_UNDEFINEDVIDEO              = 0x0000b980,
    WMDM_FORMATCODE_WMV                         = 0x0000b981,
    WMDM_FORMATCODE_MP4                         = 0x0000b982,
    WMDM_FORMATCODE_MP2                         = 0x0000b983,
    WMDM_FORMATCODE_3GP                         = 0x0000b984,
    WMDM_FORMATCODE_3G2                         = 0x0000b985,
    WMDM_FORMATCODE_AVCHD                       = 0x0000b986,
    WMDM_FORMATCODE_ATSCTS                      = 0x0000b987,
    WMDM_FORMATCODE_DVBTS                       = 0x0000b988,
    WMDM_FORMATCODE_MKV                         = 0x0000b989,
    WMDM_FORMATCODE_MKA                         = 0x0000b98a,
    WMDM_FORMATCODE_MK3D                        = 0x0000b98b,
    WMDM_FORMATCODE_UNDEFINEDCOLLECTION         = 0x0000ba00,
    WMDM_FORMATCODE_ABSTRACTMULTIMEDIAALBUM     = 0x0000ba01,
    WMDM_FORMATCODE_ABSTRACTIMAGEALBUM          = 0x0000ba02,
    WMDM_FORMATCODE_ABSTRACTAUDIOALBUM          = 0x0000ba03,
    WMDM_FORMATCODE_ABSTRACTVIDEOALBUM          = 0x0000ba04,
    WMDM_FORMATCODE_ABSTRACTAUDIOVIDEOPLAYLIST  = 0x0000ba05,
    WMDM_FORMATCODE_ABSTRACTCONTACTGROUP        = 0x0000ba06,
    WMDM_FORMATCODE_ABSTRACTMESSAGEFOLDER       = 0x0000ba07,
    WMDM_FORMATCODE_ABSTRACTCHAPTEREDPRODUCTION = 0x0000ba08,
    WMDM_FORMATCODE_MEDIA_CAST                  = 0x0000ba0b,
    WMDM_FORMATCODE_WPLPLAYLIST                 = 0x0000ba10,
    WMDM_FORMATCODE_M3UPLAYLIST                 = 0x0000ba11,
    WMDM_FORMATCODE_MPLPLAYLIST                 = 0x0000ba12,
    WMDM_FORMATCODE_ASXPLAYLIST                 = 0x0000ba13,
    WMDM_FORMATCODE_PLSPLAYLIST                 = 0x0000ba14,
    WMDM_FORMATCODE_UNDEFINEDDOCUMENT           = 0x0000ba80,
    WMDM_FORMATCODE_ABSTRACTDOCUMENT            = 0x0000ba81,
    WMDM_FORMATCODE_XMLDOCUMENT                 = 0x0000ba82,
    WMDM_FORMATCODE_MICROSOFTWORDDOCUMENT       = 0x0000ba83,
    WMDM_FORMATCODE_MHTCOMPILEDHTMLDOCUMENT     = 0x0000ba84,
    WMDM_FORMATCODE_MICROSOFTEXCELSPREADSHEET   = 0x0000ba85,
    WMDM_FORMATCODE_MICROSOFTPOWERPOINTDOCUMENT = 0x0000ba86,
    WMDM_FORMATCODE_UNDEFINEDMESSAGE            = 0x0000bb00,
    WMDM_FORMATCODE_ABSTRACTMESSAGE             = 0x0000bb01,
    WMDM_FORMATCODE_UNDEFINEDCONTACT            = 0x0000bb80,
    WMDM_FORMATCODE_ABSTRACTCONTACT             = 0x0000bb81,
    WMDM_FORMATCODE_VCARD2                      = 0x0000bb82,
    WMDM_FORMATCODE_VCARD3                      = 0x0000bb83,
    WMDM_FORMATCODE_UNDEFINEDCALENDARITEM       = 0x0000be00,
    WMDM_FORMATCODE_ABSTRACTCALENDARITEM        = 0x0000be01,
    WMDM_FORMATCODE_VCALENDAR1                  = 0x0000be02,
    WMDM_FORMATCODE_VCALENDAR2                  = 0x0000be03,
    WMDM_FORMATCODE_UNDEFINEDWINDOWSEXECUTABLE  = 0x0000be80,
    WMDM_FORMATCODE_M4A                         = 0x4d503441,
    WMDM_FORMATCODE_3GPA                        = 0x33475041,
    WMDM_FORMATCODE_3G2A                        = 0x33473241,
    WMDM_FORMATCODE_SECTION                     = 0x0000be82,
}

alias WMDM_ENUM_PROP_VALID_VALUES_FORM = int;
enum : int
{
    WMDM_ENUM_PROP_VALID_VALUES_ANY   = 0x00000000,
    WMDM_ENUM_PROP_VALID_VALUES_RANGE = 0x00000001,
    WMDM_ENUM_PROP_VALID_VALUES_ENUM  = 0x00000002,
}

struct WMDM_PROP_VALUES_RANGE
{
    PROPVARIANT rangeMin;
    PROPVARIANT rangeMax;
    PROPVARIANT rangeStep;
}
struct WMDM_PROP_VALUES_ENUM
{
    uint cEnumValues;
    PROPVARIANT* pValues;
}
struct WMDM_PROP_DESC
{
    PWSTR pwszPropName;
    WMDM_ENUM_PROP_VALID_VALUES_FORM ValidValuesForm;
    union _ValidValues_e__Union
    {
        WMDM_PROP_VALUES_RANGE ValidValuesRange;
        WMDM_PROP_VALUES_ENUM EnumeratedValidValues;
    }
}
struct WMDM_PROP_CONFIG
{
    uint nPreference;
    uint nPropDesc;
    WMDM_PROP_DESC* pPropDesc;
}
struct WMDM_FORMAT_CAPABILITY
{
    uint nPropConfig;
    WMDM_PROP_CONFIG* pConfigs;
}
alias WMDM_FIND_SCOPE = int;
enum : int
{
    WMDM_FIND_SCOPE_GLOBAL             = 0x00000000,
    WMDM_FIND_SCOPE_IMMEDIATE_CHILDREN = 0x00000001,
}

alias WMDMMessage = int;
enum : int
{
    WMDM_MSG_DEVICE_ARRIVAL = 0x00000000,
    WMDM_MSG_DEVICE_REMOVAL = 0x00000001,
    WMDM_MSG_MEDIA_ARRIVAL  = 0x00000002,
    WMDM_MSG_MEDIA_REMOVAL  = 0x00000003,
}

enum IID_IWMDMMetaData = GUID(0xec3b0663, 0x951, 0x460a, [0x9a, 0x80, 0xd, 0xce, 0xed, 0x3c, 0x4, 0x3c]);
interface IWMDMMetaData : IUnknown
{
    HRESULT AddItem(WMDM_TAG_DATATYPE, const(wchar)*, ubyte*, uint);
    HRESULT QueryByName(const(wchar)*, WMDM_TAG_DATATYPE*, ubyte**, uint*);
    HRESULT QueryByIndex(uint, ushort**, WMDM_TAG_DATATYPE*, ubyte**, uint*);
    HRESULT GetItemCount(uint*);
}
enum IID_IWMDeviceManager = GUID(0x1dcb3a00, 0x33ed, 0x11d3, [0x84, 0x70, 0x0, 0xc0, 0x4f, 0x79, 0xdb, 0xc0]);
interface IWMDeviceManager : IUnknown
{
    HRESULT GetRevision(uint*);
    HRESULT GetDeviceCount(uint*);
    HRESULT EnumDevices(IWMDMEnumDevice*);
}
enum IID_IWMDeviceManager2 = GUID(0x923e5249, 0x8731, 0x4c5b, [0x9b, 0x1c, 0xb8, 0xb6, 0xb, 0x6e, 0x46, 0xaf]);
interface IWMDeviceManager2 : IWMDeviceManager
{
    HRESULT GetDeviceFromCanonicalName(const(wchar)*, IWMDMDevice*);
    HRESULT EnumDevices2(IWMDMEnumDevice*);
    HRESULT Reinitialize();
}
enum IID_IWMDeviceManager3 = GUID(0xaf185c41, 0x100d, 0x46ed, [0xbe, 0x2e, 0x9c, 0xe8, 0xc4, 0x45, 0x94, 0xef]);
interface IWMDeviceManager3 : IWMDeviceManager2
{
    HRESULT SetDeviceEnumPreference(uint);
}
enum IID_IWMDMStorageGlobals = GUID(0x1dcb3a07, 0x33ed, 0x11d3, [0x84, 0x70, 0x0, 0xc0, 0x4f, 0x79, 0xdb, 0xc0]);
interface IWMDMStorageGlobals : IUnknown
{
    HRESULT GetCapabilities(uint*);
    HRESULT GetSerialNumber(WMDMID*, ubyte*);
    HRESULT GetTotalSize(uint*, uint*);
    HRESULT GetTotalFree(uint*, uint*);
    HRESULT GetTotalBad(uint*, uint*);
    HRESULT GetStatus(uint*);
    HRESULT Initialize(uint, IWMDMProgress);
}
enum IID_IWMDMStorage = GUID(0x1dcb3a06, 0x33ed, 0x11d3, [0x84, 0x70, 0x0, 0xc0, 0x4f, 0x79, 0xdb, 0xc0]);
interface IWMDMStorage : IUnknown
{
    HRESULT SetAttributes(uint, WAVEFORMATEX*);
    HRESULT GetStorageGlobals(IWMDMStorageGlobals*);
    HRESULT GetAttributes(uint*, WAVEFORMATEX*);
    HRESULT GetName(PWSTR, uint);
    HRESULT GetDate(WMDMDATETIME*);
    HRESULT GetSize(uint*, uint*);
    HRESULT GetRights(WMDMRIGHTS**, uint*, ubyte*);
    HRESULT EnumStorage(IWMDMEnumStorage*);
    HRESULT SendOpaqueCommand(OPAQUECOMMAND*);
}
enum IID_IWMDMStorage2 = GUID(0x1ed5a144, 0x5cd5, 0x4683, [0x9e, 0xff, 0x72, 0xcb, 0xdb, 0x2d, 0x95, 0x33]);
interface IWMDMStorage2 : IWMDMStorage
{
    HRESULT GetStorage(const(wchar)*, IWMDMStorage*);
    HRESULT SetAttributes2(uint, uint, WAVEFORMATEX*, VIDEOINFOHEADER*);
    HRESULT GetAttributes2(uint*, uint*, WAVEFORMATEX*, VIDEOINFOHEADER*);
}
enum IID_IWMDMStorage3 = GUID(0x97717eea, 0x926a, 0x464e, [0x96, 0xa4, 0x24, 0x7b, 0x2, 0x16, 0x2, 0x6e]);
interface IWMDMStorage3 : IWMDMStorage2
{
    HRESULT GetMetadata(IWMDMMetaData*);
    HRESULT SetMetadata(IWMDMMetaData);
    HRESULT CreateEmptyMetadataObject(IWMDMMetaData*);
    HRESULT SetEnumPreference(WMDM_STORAGE_ENUM_MODE*, uint, WMDMMetadataView*);
}
enum IID_IWMDMStorage4 = GUID(0xc225bac5, 0xa03a, 0x40b8, [0x9a, 0x23, 0x91, 0xcf, 0x47, 0x8c, 0x64, 0xa6]);
interface IWMDMStorage4 : IWMDMStorage3
{
    HRESULT SetReferences(uint, IWMDMStorage*);
    HRESULT GetReferences(uint*, IWMDMStorage**);
    HRESULT GetRightsWithProgress(IWMDMProgress3, WMDMRIGHTS**, uint*);
    HRESULT GetSpecifiedMetadata(uint, const(wchar)**, IWMDMMetaData*);
    HRESULT FindStorage(WMDM_FIND_SCOPE, const(wchar)*, IWMDMStorage*);
    HRESULT GetParent(IWMDMStorage*);
}
enum IID_IWMDMOperation = GUID(0x1dcb3a0b, 0x33ed, 0x11d3, [0x84, 0x70, 0x0, 0xc0, 0x4f, 0x79, 0xdb, 0xc0]);
interface IWMDMOperation : IUnknown
{
    HRESULT BeginRead();
    HRESULT BeginWrite();
    HRESULT GetObjectName(PWSTR, uint);
    HRESULT SetObjectName(PWSTR, uint);
    HRESULT GetObjectAttributes(uint*, WAVEFORMATEX*);
    HRESULT SetObjectAttributes(uint, WAVEFORMATEX*);
    HRESULT GetObjectTotalSize(uint*, uint*);
    HRESULT SetObjectTotalSize(uint, uint);
    HRESULT TransferObjectData(ubyte*, uint*, ubyte*);
    HRESULT End(HRESULT*, IUnknown);
}
enum IID_IWMDMOperation2 = GUID(0x33445b48, 0x7df7, 0x425c, [0xad, 0x8f, 0xf, 0xc6, 0xd8, 0x2f, 0x9f, 0x75]);
interface IWMDMOperation2 : IWMDMOperation
{
    HRESULT SetObjectAttributes2(uint, uint, WAVEFORMATEX*, VIDEOINFOHEADER*);
    HRESULT GetObjectAttributes2(uint*, uint*, WAVEFORMATEX*, VIDEOINFOHEADER*);
}
enum IID_IWMDMOperation3 = GUID(0xd1f9b46a, 0x9ca8, 0x46d8, [0x9d, 0xf, 0x1e, 0xc9, 0xba, 0xe5, 0x49, 0x19]);
interface IWMDMOperation3 : IWMDMOperation
{
    HRESULT TransferObjectDataOnClearChannel(ubyte*, uint*);
}
enum IID_IWMDMProgress = GUID(0x1dcb3a0c, 0x33ed, 0x11d3, [0x84, 0x70, 0x0, 0xc0, 0x4f, 0x79, 0xdb, 0xc0]);
interface IWMDMProgress : IUnknown
{
    HRESULT Begin(uint);
    HRESULT Progress(uint);
    HRESULT End();
}
enum IID_IWMDMProgress2 = GUID(0x3a43f550, 0xb383, 0x4e92, [0xb0, 0x4a, 0xe6, 0xbb, 0xc6, 0x60, 0xfe, 0xfc]);
interface IWMDMProgress2 : IWMDMProgress
{
    HRESULT End2(HRESULT);
}
enum IID_IWMDMProgress3 = GUID(0x21de01cb, 0x3bb4, 0x4929, [0xb2, 0x1a, 0x17, 0xaf, 0x3f, 0x80, 0xf6, 0x58]);
interface IWMDMProgress3 : IWMDMProgress2
{
    HRESULT Begin3(GUID, uint, OPAQUECOMMAND*);
    HRESULT Progress3(GUID, uint, OPAQUECOMMAND*);
    HRESULT End3(GUID, HRESULT, OPAQUECOMMAND*);
}
enum IID_IWMDMDevice = GUID(0x1dcb3a02, 0x33ed, 0x11d3, [0x84, 0x70, 0x0, 0xc0, 0x4f, 0x79, 0xdb, 0xc0]);
interface IWMDMDevice : IUnknown
{
    HRESULT GetName(PWSTR, uint);
    HRESULT GetManufacturer(PWSTR, uint);
    HRESULT GetVersion(uint*);
    HRESULT GetType(uint*);
    HRESULT GetSerialNumber(WMDMID*, ubyte*);
    HRESULT GetPowerSource(uint*, uint*);
    HRESULT GetStatus(uint*);
    HRESULT GetDeviceIcon(uint*);
    HRESULT EnumStorage(IWMDMEnumStorage*);
    HRESULT GetFormatSupport(WAVEFORMATEX**, uint*, PWSTR**, uint*);
    HRESULT SendOpaqueCommand(OPAQUECOMMAND*);
}
enum IID_IWMDMDevice2 = GUID(0xe34f3d37, 0x9d67, 0x4fc1, [0x92, 0x52, 0x62, 0xd2, 0x8b, 0x2f, 0x8b, 0x55]);
interface IWMDMDevice2 : IWMDMDevice
{
    HRESULT GetStorage(const(wchar)*, IWMDMStorage*);
    HRESULT GetFormatSupport2(uint, WAVEFORMATEX**, uint*, VIDEOINFOHEADER**, uint*, WMFILECAPABILITIES**, uint*);
    HRESULT GetSpecifyPropertyPages(ISpecifyPropertyPages*, IUnknown**, uint*);
    HRESULT GetCanonicalName(PWSTR, uint);
}
enum IID_IWMDMDevice3 = GUID(0x6c03e4fe, 0x5db, 0x4dda, [0x9e, 0x3c, 0x6, 0x23, 0x3a, 0x6d, 0x5d, 0x65]);
interface IWMDMDevice3 : IWMDMDevice2
{
    HRESULT GetProperty(const(wchar)*, PROPVARIANT*);
    HRESULT SetProperty(const(wchar)*, const(PROPVARIANT)*);
    HRESULT GetFormatCapability(WMDM_FORMATCODE, WMDM_FORMAT_CAPABILITY*);
    HRESULT DeviceIoControl(uint, ubyte*, uint, ubyte*, uint*);
    HRESULT FindStorage(WMDM_FIND_SCOPE, const(wchar)*, IWMDMStorage*);
}
enum IID_IWMDMDeviceSession = GUID(0x82af0a65, 0x9d96, 0x412c, [0x83, 0xe5, 0x3c, 0x43, 0xe4, 0xb0, 0x6c, 0xc7]);
interface IWMDMDeviceSession : IUnknown
{
    HRESULT BeginSession(WMDM_SESSION_TYPE, ubyte*, uint);
    HRESULT EndSession(WMDM_SESSION_TYPE, ubyte*, uint);
}
enum IID_IWMDMEnumDevice = GUID(0x1dcb3a01, 0x33ed, 0x11d3, [0x84, 0x70, 0x0, 0xc0, 0x4f, 0x79, 0xdb, 0xc0]);
interface IWMDMEnumDevice : IUnknown
{
    HRESULT Next(uint, IWMDMDevice*, uint*);
    HRESULT Skip(uint, uint*);
    HRESULT Reset();
    HRESULT Clone(IWMDMEnumDevice*);
}
enum IID_IWMDMDeviceControl = GUID(0x1dcb3a04, 0x33ed, 0x11d3, [0x84, 0x70, 0x0, 0xc0, 0x4f, 0x79, 0xdb, 0xc0]);
interface IWMDMDeviceControl : IUnknown
{
    HRESULT GetStatus(uint*);
    HRESULT GetCapabilities(uint*);
    HRESULT Play();
    HRESULT Record(WAVEFORMATEX*);
    HRESULT Pause();
    HRESULT Resume();
    HRESULT Stop();
    HRESULT Seek(uint, int);
}
enum IID_IWMDMEnumStorage = GUID(0x1dcb3a05, 0x33ed, 0x11d3, [0x84, 0x70, 0x0, 0xc0, 0x4f, 0x79, 0xdb, 0xc0]);
interface IWMDMEnumStorage : IUnknown
{
    HRESULT Next(uint, IWMDMStorage*, uint*);
    HRESULT Skip(uint, uint*);
    HRESULT Reset();
    HRESULT Clone(IWMDMEnumStorage*);
}
enum IID_IWMDMStorageControl = GUID(0x1dcb3a08, 0x33ed, 0x11d3, [0x84, 0x70, 0x0, 0xc0, 0x4f, 0x79, 0xdb, 0xc0]);
interface IWMDMStorageControl : IUnknown
{
    HRESULT Insert(uint, PWSTR, IWMDMOperation, IWMDMProgress, IWMDMStorage*);
    HRESULT Delete(uint, IWMDMProgress);
    HRESULT Rename(uint, PWSTR, IWMDMProgress);
    HRESULT Read(uint, PWSTR, IWMDMProgress, IWMDMOperation);
    HRESULT Move(uint, IWMDMStorage, IWMDMProgress);
}
enum IID_IWMDMStorageControl2 = GUID(0x972c2e88, 0xbd6c, 0x4125, [0x8e, 0x9, 0x84, 0xf8, 0x37, 0xe6, 0x37, 0xb6]);
interface IWMDMStorageControl2 : IWMDMStorageControl
{
    HRESULT Insert2(uint, PWSTR, PWSTR, IWMDMOperation, IWMDMProgress, IUnknown, IWMDMStorage*);
}
enum IID_IWMDMStorageControl3 = GUID(0xb3266365, 0xd4f3, 0x4696, [0x8d, 0x53, 0xbd, 0x27, 0xec, 0x60, 0x99, 0x3a]);
interface IWMDMStorageControl3 : IWMDMStorageControl2
{
    HRESULT Insert3(uint, uint, PWSTR, PWSTR, IWMDMOperation, IWMDMProgress, IWMDMMetaData, IUnknown, IWMDMStorage*);
}
enum IID_IWMDMObjectInfo = GUID(0x1dcb3a09, 0x33ed, 0x11d3, [0x84, 0x70, 0x0, 0xc0, 0x4f, 0x79, 0xdb, 0xc0]);
interface IWMDMObjectInfo : IUnknown
{
    HRESULT GetPlayLength(uint*);
    HRESULT SetPlayLength(uint);
    HRESULT GetPlayOffset(uint*);
    HRESULT SetPlayOffset(uint);
    HRESULT GetTotalLength(uint*);
    HRESULT GetLastPlayPosition(uint*);
    HRESULT GetLongestPlayPosition(uint*);
}
enum IID_IWMDMRevoked = GUID(0xebeccedb, 0x88ee, 0x4e55, [0xb6, 0xa4, 0x8d, 0x9f, 0x7, 0xd6, 0x96, 0xaa]);
interface IWMDMRevoked : IUnknown
{
    HRESULT GetRevocationURL(PWSTR*, uint*, uint*);
}
enum IID_IWMDMNotification = GUID(0x3f5e95c0, 0xf43, 0x4ed4, [0x93, 0xd2, 0xc8, 0x9a, 0x45, 0xd5, 0x9b, 0x81]);
interface IWMDMNotification : IUnknown
{
    HRESULT WMDMMessage(uint, const(wchar)*);
}
union WMDMDetermineMaxPropStringLen
{
    wchar[27] sz001;
    wchar[31] sz002;
    wchar[14] sz003;
    wchar[16] sz004;
    wchar[22] sz005;
    wchar[14] sz006;
    wchar[20] sz007;
    wchar[20] sz008;
    wchar[22] sz009;
    wchar[11] sz010;
    wchar[12] sz011;
    wchar[17] sz012;
    wchar[17] sz013;
    wchar[16] sz014;
    wchar[17] sz015;
    wchar[11] sz016;
    wchar[11] sz017;
    wchar[15] sz018;
    wchar[22] sz019;
    wchar[20] sz020;
    wchar[22] sz021;
    wchar[21] sz022;
    wchar[24] sz023;
    wchar[20] sz024;
    wchar[10] sz025;
    wchar[14] sz026;
    wchar[11] sz027;
    wchar[11] sz028;
    wchar[13] sz029;
    wchar[17] sz030;
    wchar[16] sz031;
    wchar[17] sz032;
    wchar[20] sz033;
    wchar[19] sz034;
    wchar[18] sz035;
    wchar[18] sz036;
    wchar[15] sz037;
    wchar[14] sz041;
    wchar[22] sz043;
    wchar[16] sz044;
    wchar[20] sz045;
    wchar[14] sz046;
    wchar[14] sz047;
    wchar[12] sz048;
    wchar[25] sz049;
    wchar[26] sz050;
    wchar[25] sz051;
    wchar[16] sz052;
    wchar[24] sz053;
    wchar[15] sz054;
    wchar[21] sz055;
    wchar[16] sz056;
    wchar[22] sz057;
    wchar[14] sz058;
    wchar[25] sz059;
    wchar[18] sz060;
    wchar[22] sz061;
    wchar[26] sz062;
    wchar[36] sz063;
    wchar[23] sz064;
    wchar[12] sz065;
    wchar[24] sz066;
    wchar[11] sz067;
    wchar[12] sz068;
    wchar[14] sz069;
    wchar[20] sz070;
    wchar[15] sz071;
    wchar[14] sz072;
    wchar[31] sz073;
    wchar[24] sz074;
    wchar[22] sz075;
    wchar[24] sz076;
    wchar[21] sz077;
    wchar[27] sz078;
    wchar[27] sz079;
    wchar[20] sz080;
    wchar[33] sz081;
    wchar[21] sz082;
    wchar[32] sz083;
    wchar[26] sz084;
    wchar[18] sz085;
    wchar[30] sz086;
}
enum IID_IMDServiceProvider = GUID(0x1dcb3a10, 0x33ed, 0x11d3, [0x84, 0x70, 0x0, 0xc0, 0x4f, 0x79, 0xdb, 0xc0]);
interface IMDServiceProvider : IUnknown
{
    HRESULT GetDeviceCount(uint*);
    HRESULT EnumDevices(IMDSPEnumDevice*);
}
enum IID_IMDServiceProvider2 = GUID(0xb2fa24b7, 0xcda3, 0x4694, [0x98, 0x62, 0x41, 0x3a, 0xe1, 0xa3, 0x48, 0x19]);
interface IMDServiceProvider2 : IMDServiceProvider
{
    HRESULT CreateDevice(const(wchar)*, uint*, IMDSPDevice**);
}
enum IID_IMDServiceProvider3 = GUID(0x4ed13ef3, 0xa971, 0x4d19, [0x9f, 0x51, 0xe, 0x18, 0x26, 0xb2, 0xda, 0x57]);
interface IMDServiceProvider3 : IMDServiceProvider2
{
    HRESULT SetDeviceEnumPreference(uint);
}
enum IID_IMDSPEnumDevice = GUID(0x1dcb3a11, 0x33ed, 0x11d3, [0x84, 0x70, 0x0, 0xc0, 0x4f, 0x79, 0xdb, 0xc0]);
interface IMDSPEnumDevice : IUnknown
{
    HRESULT Next(uint, IMDSPDevice*, uint*);
    HRESULT Skip(uint, uint*);
    HRESULT Reset();
    HRESULT Clone(IMDSPEnumDevice*);
}
enum IID_IMDSPDevice = GUID(0x1dcb3a12, 0x33ed, 0x11d3, [0x84, 0x70, 0x0, 0xc0, 0x4f, 0x79, 0xdb, 0xc0]);
interface IMDSPDevice : IUnknown
{
    HRESULT GetName(PWSTR, uint);
    HRESULT GetManufacturer(PWSTR, uint);
    HRESULT GetVersion(uint*);
    HRESULT GetType(uint*);
    HRESULT GetSerialNumber(WMDMID*, ubyte*);
    HRESULT GetPowerSource(uint*, uint*);
    HRESULT GetStatus(uint*);
    HRESULT GetDeviceIcon(uint*);
    HRESULT EnumStorage(IMDSPEnumStorage*);
    HRESULT GetFormatSupport(WAVEFORMATEX**, uint*, PWSTR**, uint*);
    HRESULT SendOpaqueCommand(OPAQUECOMMAND*);
}
enum IID_IMDSPDevice2 = GUID(0x420d16ad, 0xc97d, 0x4e00, [0x82, 0xaa, 0x0, 0xe9, 0xf4, 0x33, 0x5d, 0xdd]);
interface IMDSPDevice2 : IMDSPDevice
{
    HRESULT GetStorage(const(wchar)*, IMDSPStorage*);
    HRESULT GetFormatSupport2(uint, WAVEFORMATEX**, uint*, VIDEOINFOHEADER**, uint*, WMFILECAPABILITIES**, uint*);
    HRESULT GetSpecifyPropertyPages(ISpecifyPropertyPages*, IUnknown**, uint*);
    HRESULT GetCanonicalName(PWSTR, uint);
}
enum IID_IMDSPDevice3 = GUID(0x1a839845, 0xfc55, 0x487c, [0x97, 0x6f, 0xee, 0x38, 0xac, 0xe, 0x8c, 0x4e]);
interface IMDSPDevice3 : IMDSPDevice2
{
    HRESULT GetProperty(const(wchar)*, PROPVARIANT*);
    HRESULT SetProperty(const(wchar)*, const(PROPVARIANT)*);
    HRESULT GetFormatCapability(WMDM_FORMATCODE, WMDM_FORMAT_CAPABILITY*);
    HRESULT DeviceIoControl(uint, ubyte*, uint, ubyte*, uint*);
    HRESULT FindStorage(WMDM_FIND_SCOPE, const(wchar)*, IMDSPStorage*);
}
enum IID_IMDSPDeviceControl = GUID(0x1dcb3a14, 0x33ed, 0x11d3, [0x84, 0x70, 0x0, 0xc0, 0x4f, 0x79, 0xdb, 0xc0]);
interface IMDSPDeviceControl : IUnknown
{
    HRESULT GetDCStatus(uint*);
    HRESULT GetCapabilities(uint*);
    HRESULT Play();
    HRESULT Record(WAVEFORMATEX*);
    HRESULT Pause();
    HRESULT Resume();
    HRESULT Stop();
    HRESULT Seek(uint, int);
}
enum IID_IMDSPEnumStorage = GUID(0x1dcb3a15, 0x33ed, 0x11d3, [0x84, 0x70, 0x0, 0xc0, 0x4f, 0x79, 0xdb, 0xc0]);
interface IMDSPEnumStorage : IUnknown
{
    HRESULT Next(uint, IMDSPStorage*, uint*);
    HRESULT Skip(uint, uint*);
    HRESULT Reset();
    HRESULT Clone(IMDSPEnumStorage*);
}
enum IID_IMDSPStorage = GUID(0x1dcb3a16, 0x33ed, 0x11d3, [0x84, 0x70, 0x0, 0xc0, 0x4f, 0x79, 0xdb, 0xc0]);
interface IMDSPStorage : IUnknown
{
    HRESULT SetAttributes(uint, WAVEFORMATEX*);
    HRESULT GetStorageGlobals(IMDSPStorageGlobals*);
    HRESULT GetAttributes(uint*, WAVEFORMATEX*);
    HRESULT GetName(PWSTR, uint);
    HRESULT GetDate(WMDMDATETIME*);
    HRESULT GetSize(uint*, uint*);
    HRESULT GetRights(WMDMRIGHTS**, uint*, ubyte*);
    HRESULT CreateStorage(uint, WAVEFORMATEX*, PWSTR, IMDSPStorage*);
    HRESULT EnumStorage(IMDSPEnumStorage*);
    HRESULT SendOpaqueCommand(OPAQUECOMMAND*);
}
enum IID_IMDSPStorage2 = GUID(0xa5e07a5, 0x6454, 0x4451, [0x9c, 0x36, 0x1c, 0x6a, 0xe7, 0xe2, 0xb1, 0xd6]);
interface IMDSPStorage2 : IMDSPStorage
{
    HRESULT GetStorage(const(wchar)*, IMDSPStorage*);
    HRESULT CreateStorage2(uint, uint, WAVEFORMATEX*, VIDEOINFOHEADER*, PWSTR, ulong, IMDSPStorage*);
    HRESULT SetAttributes2(uint, uint, WAVEFORMATEX*, VIDEOINFOHEADER*);
    HRESULT GetAttributes2(uint*, uint*, WAVEFORMATEX*, VIDEOINFOHEADER*);
}
enum IID_IMDSPStorage3 = GUID(0x6c669867, 0x97ed, 0x4a67, [0x97, 0x6, 0x1c, 0x55, 0x29, 0xd2, 0xa4, 0x14]);
interface IMDSPStorage3 : IMDSPStorage2
{
    HRESULT GetMetadata(IWMDMMetaData);
    HRESULT SetMetadata(IWMDMMetaData);
}
enum IID_IMDSPStorage4 = GUID(0x3133b2c4, 0x515c, 0x481b, [0xb1, 0xce, 0x39, 0x32, 0x7e, 0xcb, 0x4f, 0x74]);
interface IMDSPStorage4 : IMDSPStorage3
{
    HRESULT SetReferences(uint, IMDSPStorage*);
    HRESULT GetReferences(uint*, IMDSPStorage**);
    HRESULT CreateStorageWithMetadata(uint, const(wchar)*, IWMDMMetaData, ulong, IMDSPStorage*);
    HRESULT GetSpecifiedMetadata(uint, const(wchar)**, IWMDMMetaData);
    HRESULT FindStorage(WMDM_FIND_SCOPE, const(wchar)*, IMDSPStorage*);
    HRESULT GetParent(IMDSPStorage*);
}
enum IID_IMDSPStorageGlobals = GUID(0x1dcb3a17, 0x33ed, 0x11d3, [0x84, 0x70, 0x0, 0xc0, 0x4f, 0x79, 0xdb, 0xc0]);
interface IMDSPStorageGlobals : IUnknown
{
    HRESULT GetCapabilities(uint*);
    HRESULT GetSerialNumber(WMDMID*, ubyte*);
    HRESULT GetTotalSize(uint*, uint*);
    HRESULT GetTotalFree(uint*, uint*);
    HRESULT GetTotalBad(uint*, uint*);
    HRESULT GetStatus(uint*);
    HRESULT Initialize(uint, IWMDMProgress);
    HRESULT GetDevice(IMDSPDevice*);
    HRESULT GetRootStorage(IMDSPStorage*);
}
enum IID_IMDSPObjectInfo = GUID(0x1dcb3a19, 0x33ed, 0x11d3, [0x84, 0x70, 0x0, 0xc0, 0x4f, 0x79, 0xdb, 0xc0]);
interface IMDSPObjectInfo : IUnknown
{
    HRESULT GetPlayLength(uint*);
    HRESULT SetPlayLength(uint);
    HRESULT GetPlayOffset(uint*);
    HRESULT SetPlayOffset(uint);
    HRESULT GetTotalLength(uint*);
    HRESULT GetLastPlayPosition(uint*);
    HRESULT GetLongestPlayPosition(uint*);
}
enum IID_IMDSPObject = GUID(0x1dcb3a18, 0x33ed, 0x11d3, [0x84, 0x70, 0x0, 0xc0, 0x4f, 0x79, 0xdb, 0xc0]);
interface IMDSPObject : IUnknown
{
    HRESULT Open(uint);
    HRESULT Read(ubyte*, uint*, ubyte*);
    HRESULT Write(ubyte*, uint*, ubyte*);
    HRESULT Delete(uint, IWMDMProgress);
    HRESULT Seek(uint, uint);
    HRESULT Rename(PWSTR, IWMDMProgress);
    HRESULT Move(uint, IWMDMProgress, IMDSPStorage);
    HRESULT Close();
}
enum IID_IMDSPObject2 = GUID(0x3f34cd3e, 0x5907, 0x4341, [0x9a, 0xf9, 0x97, 0xf4, 0x18, 0x7c, 0x3a, 0xa5]);
interface IMDSPObject2 : IMDSPObject
{
    HRESULT ReadOnClearChannel(ubyte*, uint*);
    HRESULT WriteOnClearChannel(ubyte*, uint*);
}
enum IID_IMDSPDirectTransfer = GUID(0xc2fe57a8, 0x9304, 0x478c, [0x9e, 0xe4, 0x47, 0xe3, 0x97, 0xb9, 0x12, 0xd7]);
interface IMDSPDirectTransfer : IUnknown
{
    HRESULT TransferToDevice(const(wchar)*, IWMDMOperation, uint, PWSTR, IWMDMMetaData, IWMDMProgress, IMDSPStorage*);
}
enum IID_IMDSPRevoked = GUID(0xa4e8f2d4, 0x3f31, 0x464d, [0xb5, 0x3d, 0x4f, 0xc3, 0x35, 0x99, 0x81, 0x84]);
interface IMDSPRevoked : IUnknown
{
    HRESULT GetRevocationURL(PWSTR*, uint*);
}
enum IID_ISCPSecureAuthenticate = GUID(0x1dcb3a0f, 0x33ed, 0x11d3, [0x84, 0x70, 0x0, 0xc0, 0x4f, 0x79, 0xdb, 0xc0]);
interface ISCPSecureAuthenticate : IUnknown
{
    HRESULT GetSecureQuery(ISCPSecureQuery*);
}
enum IID_ISCPSecureAuthenticate2 = GUID(0xb580cfae, 0x1672, 0x47e2, [0xac, 0xaa, 0x44, 0xbb, 0xec, 0xbc, 0xae, 0x5b]);
interface ISCPSecureAuthenticate2 : ISCPSecureAuthenticate
{
    HRESULT GetSCPSession(ISCPSession*);
}
enum IID_ISCPSecureQuery = GUID(0x1dcb3a0d, 0x33ed, 0x11d3, [0x84, 0x70, 0x0, 0xc0, 0x4f, 0x79, 0xdb, 0xc0]);
interface ISCPSecureQuery : IUnknown
{
    HRESULT GetDataDemands(uint*, uint*, uint*, uint*, ubyte*);
    HRESULT ExamineData(uint, PWSTR, ubyte*, uint, ubyte*);
    HRESULT MakeDecision(uint, ubyte*, uint, uint, ubyte*, uint, IMDSPStorageGlobals, ISCPSecureExchange*, ubyte*);
    HRESULT GetRights(ubyte*, uint, ubyte*, uint, IMDSPStorageGlobals, WMDMRIGHTS**, uint*, ubyte*);
}
enum IID_ISCPSecureQuery2 = GUID(0xebe17e25, 0x4fd7, 0x4632, [0xaf, 0x46, 0x6d, 0x93, 0xd4, 0xfc, 0xc7, 0x2e]);
interface ISCPSecureQuery2 : ISCPSecureQuery
{
    HRESULT MakeDecision2(uint, ubyte*, uint, uint, ubyte*, uint, IMDSPStorageGlobals, ubyte*, uint, ubyte*, uint, PWSTR*, uint*, uint*, ulong*, IUnknown, ISCPSecureExchange*, ubyte*);
}
enum IID_ISCPSecureExchange = GUID(0x1dcb3a0e, 0x33ed, 0x11d3, [0x84, 0x70, 0x0, 0xc0, 0x4f, 0x79, 0xdb, 0xc0]);
interface ISCPSecureExchange : IUnknown
{
    HRESULT TransferContainerData(ubyte*, uint, uint*, ubyte*);
    HRESULT ObjectData(ubyte*, uint*, ubyte*);
    HRESULT TransferComplete();
}
enum IID_ISCPSecureExchange2 = GUID(0x6c62fc7b, 0x2690, 0x483f, [0x9d, 0x44, 0xa, 0x20, 0xcb, 0x35, 0x57, 0x7c]);
interface ISCPSecureExchange2 : ISCPSecureExchange
{
    HRESULT TransferContainerData2(ubyte*, uint, IWMDMProgress3, uint*, ubyte*);
}
enum IID_ISCPSecureExchange3 = GUID(0xab4e77e4, 0x8908, 0x4b17, [0xbd, 0x2a, 0xb1, 0xdb, 0xe6, 0xdd, 0x69, 0xe1]);
interface ISCPSecureExchange3 : ISCPSecureExchange2
{
    HRESULT TransferContainerDataOnClearChannel(IMDSPDevice, ubyte*, uint, IWMDMProgress3, uint*);
    HRESULT GetObjectDataOnClearChannel(IMDSPDevice, ubyte*, uint*);
    HRESULT TransferCompleteForDevice(IMDSPDevice);
}
enum IID_ISCPSession = GUID(0x88a3e6ed, 0xeee4, 0x4619, [0xbb, 0xb3, 0xfd, 0x4f, 0xb6, 0x27, 0x15, 0xd1]);
interface ISCPSession : IUnknown
{
    HRESULT BeginSession(IMDSPDevice, ubyte*, uint);
    HRESULT EndSession(ubyte*, uint);
    HRESULT GetSecureQuery(ISCPSecureQuery*);
}
enum IID_ISCPSecureQuery3 = GUID(0xb7edd1a2, 0x4dab, 0x484b, [0xb3, 0xc5, 0xad, 0x39, 0xb8, 0xb4, 0xc0, 0xb1]);
interface ISCPSecureQuery3 : ISCPSecureQuery2
{
    HRESULT GetRightsOnClearChannel(ubyte*, uint, ubyte*, uint, IMDSPStorageGlobals, IWMDMProgress3, WMDMRIGHTS**, uint*);
    HRESULT MakeDecisionOnClearChannel(uint, ubyte*, uint, uint, ubyte*, uint, IMDSPStorageGlobals, IWMDMProgress3, ubyte*, uint, ubyte*, uint, PWSTR*, uint*, uint*, ulong*, IUnknown, ISCPSecureExchange*);
}
enum IID_IComponentAuthenticate = GUID(0xa9889c00, 0x6d2b, 0x11d3, [0x84, 0x96, 0x0, 0xc0, 0x4f, 0x79, 0xdb, 0xc0]);
interface IComponentAuthenticate : IUnknown
{
    HRESULT SACAuth(uint, uint, ubyte*, uint, ubyte**, uint*);
    HRESULT SACGetProtocols(uint**, uint*);
}
enum CLSID_WMDMLogger = GUID(0x110a3202, 0x5a79, 0x11d3, [0x8d, 0x78, 0x44, 0x45, 0x53, 0x54, 0x0, 0x0]);
struct WMDMLogger
{
}
enum IID_IWMDMLogger = GUID(0x110a3200, 0x5a79, 0x11d3, [0x8d, 0x78, 0x44, 0x45, 0x53, 0x54, 0x0, 0x0]);
interface IWMDMLogger : IUnknown
{
    HRESULT IsEnabled(BOOL*);
    HRESULT Enable(BOOL);
    HRESULT GetLogFileName(PSTR, uint);
    HRESULT SetLogFileName(PSTR);
    HRESULT LogString(uint, PSTR, PSTR);
    HRESULT LogDword(uint, PSTR, PSTR, uint);
    HRESULT Reset();
    HRESULT GetSizeParams(uint*, uint*);
    HRESULT SetSizeParams(uint, uint);
}
struct MTP_COMMAND_DATA_IN
{
    align (1):
    ushort OpCode;
    uint NumParams;
    uint[5] Params;
    uint NextPhase;
    uint CommandWriteDataSize;
    ubyte[1] CommandWriteData;
}
struct MTP_COMMAND_DATA_OUT
{
    align (1):
    ushort ResponseCode;
    uint NumParams;
    uint[5] Params;
    uint CommandReadDataSize;
    ubyte[1] CommandReadData;
}
