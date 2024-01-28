module windows.win32.media.directshow.tv;

import windows.win32.guid : GUID;
import windows.win32.foundation : BOOL, BSTR, CHAR, HANDLE, HRESULT, HWND, PSID, PWSTR, RECT, SIZE, VARIANT_BOOL;
import windows.win32.graphics.gdi : HDC;
import windows.win32.media.directshow : AnalogVideoStandard, BinaryConvolutionCodeRate, ComponentCategory, ComponentStatus, DVBSystemType, FECMethod, GuardInterval, HierarchyAlpha, IESEvent, IESEvents, IEnumFilters, IFilterGraph, IGraphBuilder, IMediaSeeking, IPin, IVMRImageCompositor, IVMRMixerBitmap, IVMRSurfaceAllocator, LNB_Source, MPEG2StreamType, ModulationType, Pilot, Polarisation, RollOff, SpectralInversion, TVAudioMode, TransmissionMode, TunerInputType, VMRALPHABITMAP;
import windows.win32.media.kernelstreaming : KSDATAFORMAT, KSEVENTDATA, KSIDENTIFIER, KSM_NODE, KSP_NODE;
import windows.win32.media.mediafoundation : AM_MEDIA_TYPE, IMFVideoPresenter;
import windows.win32.system.com : IDispatch, IEnumGUID, IEnumMoniker, IPersist, IUnknown, SAFEARRAY;
import windows.win32.system.ole : IEnumVARIANT, IPictureDisp;
import windows.win32.system.registry : HKEY;
import windows.win32.system.variant : VARIANT;

version (Windows):
extern (Windows):

enum DTV_CardStatus_Inserted = 0x00000000;
enum DTV_CardStatus_Removed = 0x00000001;
enum DTV_CardStatus_Error = 0x00000002;
enum DTV_CardStatus_FirmwareDownload = 0x00000003;
enum OCUR_PAIRING_PROTOCOL_VERSION = 0x00000002;
enum PBDA_PAIRING_PROTOCOL_VERSION = 0x00000003;
enum DTV_MMIMessage_Open = 0x00000000;
enum DTV_MMIMessage_Close = 0x00000001;
enum DTV_Entitlement_CanDecrypt = 0x00000000;
enum DTV_Entitlement_NotEntitled = 0x00000001;
enum DTV_Entitlement_TechnicalFailure = 0x00000002;
enum AudioType_Standard = 0x00000000;
enum AudioType_Music_And_Effects = 0x00000001;
enum AudioType_Visually_Impaired = 0x00000002;
enum AudioType_Hearing_Impaired = 0x00000003;
enum AudioType_Dialogue = 0x00000004;
enum AudioType_Commentary = 0x00000005;
enum AudioType_Emergency = 0x00000006;
enum AudioType_Voiceover = 0x00000007;
enum AudioType_Reserved = 0xffffffffffffffff;
enum MAX_COUNTRY_CODE_STRING = 0x00000003;
enum PARENTAL_CONTROL_TIME_RANGE = 0x00000001;
enum REQUIRED_PARENTAL_CONTROL_TIME_RANGE = 0x00000002;
enum PARENTAL_CONTROL_CONTENT_RATING = 0x00000100;
enum PARENTAL_CONTROL_ATTRIB_VIOLENCE = 0x00000200;
enum PARENTAL_CONTROL_ATTRIB_LANGUAGE = 0x00000201;
enum PARENTAL_CONTROL_ATTRIB_SEXUAL = 0x00000202;
enum PARENTAL_CONTROL_ATTRIB_DIALOGUE = 0x00000203;
enum PARENTAL_CONTROL_ATTRIB_FANTASY = 0x00000204;
enum PARENTAL_CONTROL_VALUE_UNDEFINED = 0x00000000;
enum MPEG2_FILTER_VERSION_1_SIZE = 0x0000007c;
enum MPEG2_FILTER_VERSION_2_SIZE = 0x00000085;
enum SID_MSVidCtl_CurrentAudioEndpoint = GUID(0xcf9a88f4, 0xabcf, 0x4ed8, [0x9b, 0x74, 0x7d, 0xb3, 0x34, 0x45, 0x45, 0x9e]);
enum STREAMBUFFER_EC_BASE = 0x00000326;
enum EVENTID_SBE2RecControlStarted = GUID(0x8966a89e, 0xf83e, 0x4c0e, [0xbc, 0x3b, 0xbf, 0xa7, 0x64, 0x9e, 0x4, 0xcb]);
enum EVENTID_SBE2RecControlStopped = GUID(0x454b1ec8, 0xc9b, 0x4caa, [0xb1, 0xa1, 0x1e, 0x7a, 0x26, 0x66, 0xf6, 0xc3]);
enum SBE2_STREAM_DESC_EVENT = GUID(0x2313a4ed, 0xbf2d, 0x454f, [0xad, 0x8a, 0xd9, 0x5b, 0xa7, 0xf9, 0x1f, 0xee]);
enum SBE2_V1_STREAMS_CREATION_EVENT = GUID(0xfcf09, 0x97f5, 0x46ac, [0x97, 0x69, 0x7a, 0x83, 0xb3, 0x53, 0x84, 0xfb]);
enum SBE2_V2_STREAMS_CREATION_EVENT = GUID(0xa72530a3, 0x344, 0x4cab, [0xa2, 0xd0, 0xfe, 0x93, 0x7d, 0xbd, 0xca, 0xb3]);
enum SBE2_STREAM_DESC_VERSION = 0x00000001;
enum SID_DRMSecureServiceChannel = GUID(0xc4c4c4c4, 0x49, 0x4e2b, [0x98, 0xfb, 0x95, 0x37, 0xf6, 0xce, 0x51, 0x6d]);
enum CLSID_ETFilterEncProperties = GUID(0xc4c4c481, 0x49, 0x4e2b, [0x98, 0xfb, 0x95, 0x37, 0xf6, 0xce, 0x51, 0x6d]);
enum CLSID_ETFilterTagProperties = GUID(0xc4c4c491, 0x49, 0x4e2b, [0x98, 0xfb, 0x95, 0x37, 0xf6, 0xce, 0x51, 0x6d]);
enum CLSID_PTFilter = GUID(0x9cd31617, 0xb303, 0x4f96, [0x83, 0x30, 0x2e, 0xb1, 0x73, 0xea, 0x4d, 0xc6]);
enum CLSID_DTFilterEncProperties = GUID(0xc4c4c482, 0x49, 0x4e2b, [0x98, 0xfb, 0x95, 0x37, 0xf6, 0xce, 0x51, 0x6d]);
enum CLSID_DTFilterTagProperties = GUID(0xc4c4c492, 0x49, 0x4e2b, [0x98, 0xfb, 0x95, 0x37, 0xf6, 0xce, 0x51, 0x6d]);
enum CLSID_XDSCodecProperties = GUID(0xc4c4c483, 0x49, 0x4e2b, [0x98, 0xfb, 0x95, 0x37, 0xf6, 0xce, 0x51, 0x6d]);
enum CLSID_XDSCodecTagProperties = GUID(0xc4c4c493, 0x49, 0x4e2b, [0x98, 0xfb, 0x95, 0x37, 0xf6, 0xce, 0x51, 0x6d]);
enum CLSID_CPCAFiltersCategory = GUID(0xc4c4c4fc, 0x49, 0x4e2b, [0x98, 0xfb, 0x95, 0x37, 0xf6, 0xce, 0x51, 0x6d]);
enum EVENTID_XDSCodecNewXDSRating = GUID(0xc4c4c4e0, 0x49, 0x4e2b, [0x98, 0xfb, 0x95, 0x37, 0xf6, 0xce, 0x51, 0x6d]);
enum EVENTID_XDSCodecDuplicateXDSRating = GUID(0xc4c4c4df, 0x49, 0x4e2b, [0x98, 0xfb, 0x95, 0x37, 0xf6, 0xce, 0x51, 0x6d]);
enum EVENTID_XDSCodecNewXDSPacket = GUID(0xc4c4c4e1, 0x49, 0x4e2b, [0x98, 0xfb, 0x95, 0x37, 0xf6, 0xce, 0x51, 0x6d]);
enum EVENTID_DTFilterRatingChange = GUID(0xc4c4c4e2, 0x49, 0x4e2b, [0x98, 0xfb, 0x95, 0x37, 0xf6, 0xce, 0x51, 0x6d]);
enum EVENTID_DTFilterRatingsBlock = GUID(0xc4c4c4e3, 0x49, 0x4e2b, [0x98, 0xfb, 0x95, 0x37, 0xf6, 0xce, 0x51, 0x6d]);
enum EVENTID_DTFilterRatingsUnblock = GUID(0xc4c4c4e4, 0x49, 0x4e2b, [0x98, 0xfb, 0x95, 0x37, 0xf6, 0xce, 0x51, 0x6d]);
enum EVENTID_DTFilterXDSPacket = GUID(0xc4c4c4e5, 0x49, 0x4e2b, [0x98, 0xfb, 0x95, 0x37, 0xf6, 0xce, 0x51, 0x6d]);
enum EVENTID_ETFilterEncryptionOn = GUID(0xc4c4c4e6, 0x49, 0x4e2b, [0x98, 0xfb, 0x95, 0x37, 0xf6, 0xce, 0x51, 0x6d]);
enum EVENTID_ETFilterEncryptionOff = GUID(0xc4c4c4e7, 0x49, 0x4e2b, [0x98, 0xfb, 0x95, 0x37, 0xf6, 0xce, 0x51, 0x6d]);
enum EVENTID_DTFilterCOPPUnblock = GUID(0xc4c4c4e8, 0x49, 0x4e2b, [0x98, 0xfb, 0x95, 0x37, 0xf6, 0xce, 0x51, 0x6d]);
enum EVENTID_EncDecFilterError = GUID(0xc4c4c4e9, 0x49, 0x4e2b, [0x98, 0xfb, 0x95, 0x37, 0xf6, 0xce, 0x51, 0x6d]);
enum EVENTID_DTFilterCOPPBlock = GUID(0xc4c4c4ea, 0x49, 0x4e2b, [0x98, 0xfb, 0x95, 0x37, 0xf6, 0xce, 0x51, 0x6d]);
enum EVENTID_ETFilterCopyOnce = GUID(0xc4c4c4eb, 0x49, 0x4e2b, [0x98, 0xfb, 0x95, 0x37, 0xf6, 0xce, 0x51, 0x6d]);
enum EVENTID_ETFilterCopyNever = GUID(0xc4c4c4f0, 0x49, 0x4e2b, [0x98, 0xfb, 0x95, 0x37, 0xf6, 0xce, 0x51, 0x6d]);
enum EVENTID_DTFilterDataFormatOK = GUID(0xc4c4c4ec, 0x49, 0x4e2b, [0x98, 0xfb, 0x95, 0x37, 0xf6, 0xce, 0x51, 0x6d]);
enum EVENTID_DTFilterDataFormatFailure = GUID(0xc4c4c4ed, 0x49, 0x4e2b, [0x98, 0xfb, 0x95, 0x37, 0xf6, 0xce, 0x51, 0x6d]);
enum EVENTID_ETDTFilterLicenseOK = GUID(0xc4c4c4ee, 0x49, 0x4e2b, [0x98, 0xfb, 0x95, 0x37, 0xf6, 0xce, 0x51, 0x6d]);
enum EVENTID_ETDTFilterLicenseFailure = GUID(0xc4c4c4ef, 0x49, 0x4e2b, [0x98, 0xfb, 0x95, 0x37, 0xf6, 0xce, 0x51, 0x6d]);
enum MEDIASUBTYPE_ETDTFilter_Tagged = GUID(0xc4c4c4d0, 0x49, 0x4e2b, [0x98, 0xfb, 0x95, 0x37, 0xf6, 0xce, 0x51, 0x6d]);
enum FORMATTYPE_ETDTFilter_Tagged = GUID(0xc4c4c4d1, 0x49, 0x4e2b, [0x98, 0xfb, 0x95, 0x37, 0xf6, 0xce, 0x51, 0x6d]);
enum MEDIASUBTYPE_CPFilters_Processed = GUID(0x46adbd28, 0x6fd0, 0x4796, [0x93, 0xb2, 0x15, 0x5c, 0x51, 0xdc, 0x4, 0x8d]);
enum FORMATTYPE_CPFilters_Processed = GUID(0x6739b36f, 0x1d5f, 0x4ac2, [0x81, 0x92, 0x28, 0xbb, 0xe, 0x73, 0xd1, 0x6a]);
enum EVENTID_EncDecFilterEvent = GUID(0x4a1b465b, 0xfb9, 0x4159, [0xaf, 0xbd, 0xe3, 0x30, 0x6, 0xa0, 0xf9, 0xf4]);
enum EVENTID_FormatNotSupportedEvent = GUID(0x24b2280a, 0xb2aa, 0x4777, [0xbf, 0x65, 0x63, 0xf3, 0x5e, 0x7b, 0x2, 0x4a]);
enum EVENTID_DemultiplexerFilterDiscontinuity = GUID(0x16155770, 0xaed5, 0x475c, [0xbb, 0x98, 0x95, 0xa3, 0x30, 0x70, 0xdf, 0xc]);
enum DSATTRIB_WMDRMProtectionInfo = GUID(0x40749583, 0x6b9d, 0x4eec, [0xb4, 0x3c, 0x67, 0xa1, 0x80, 0x1e, 0x1a, 0x9b]);
enum DSATTRIB_BadSampleInfo = GUID(0xe4846dda, 0x5838, 0x42b4, [0xb8, 0x97, 0x6f, 0x7e, 0x5f, 0xaa, 0x2f, 0x2f]);
enum MPEG_PAT_PID = 0x00000000;
enum MPEG_PAT_TID = 0x00000000;
enum MPEG_CAT_PID = 0x00000001;
enum MPEG_CAT_TID = 0x00000001;
enum MPEG_PMT_TID = 0x00000002;
enum MPEG_TSDT_PID = 0x00000002;
enum MPEG_TSDT_TID = 0x00000003;
enum ATSC_MGT_PID = 0x00001ffb;
enum ATSC_MGT_TID = 0x000000c7;
enum ATSC_VCT_PID = 0x00001ffb;
enum ATSC_VCT_TERR_TID = 0x000000c8;
enum ATSC_VCT_CABL_TID = 0x000000c9;
enum ATSC_EIT_TID = 0x000000cb;
enum ATSC_ETT_TID = 0x000000cc;
enum ATSC_RRT_TID = 0x000000ca;
enum ATSC_RRT_PID = 0x00001ffb;
enum ATSC_STT_PID = 0x00001ffb;
enum ATSC_STT_TID = 0x000000cd;
enum ATSC_PIT_TID = 0x000000d0;
enum DVB_NIT_PID = 0x00000010;
enum DVB_NIT_ACTUAL_TID = 0x00000040;
enum DVB_NIT_OTHER_TID = 0x00000041;
enum DVB_SDT_PID = 0x00000011;
enum DVB_SDT_ACTUAL_TID = 0x00000042;
enum DVB_SDT_OTHER_TID = 0x00000046;
enum DVB_BAT_PID = 0x00000011;
enum DVB_BAT_TID = 0x0000004a;
enum DVB_EIT_PID = 0x00000012;
enum DVB_EIT_ACTUAL_TID = 0x0000004e;
enum DVB_EIT_OTHER_TID = 0x0000004f;
enum DVB_RST_PID = 0x00000013;
enum DVB_RST_TID = 0x00000071;
enum DVB_TDT_PID = 0x00000014;
enum DVB_TDT_TID = 0x00000070;
enum DVB_ST_PID_16 = 0x00000010;
enum DVB_ST_PID_17 = 0x00000011;
enum DVB_ST_PID_18 = 0x00000012;
enum DVB_ST_PID_19 = 0x00000013;
enum DVB_ST_PID_20 = 0x00000014;
enum DVB_ST_TID = 0x00000072;
enum ISDB_ST_TID = 0x00000072;
enum DVB_TOT_PID = 0x00000014;
enum DVB_TOT_TID = 0x00000073;
enum DVB_DIT_PID = 0x0000001e;
enum DVB_DIT_TID = 0x0000007e;
enum DVB_SIT_PID = 0x0000001f;
enum DVB_SIT_TID = 0x0000007f;
enum ISDB_EMM_TID = 0x00000085;
enum ISDB_BIT_PID = 0x00000024;
enum ISDB_BIT_TID = 0x000000c4;
enum ISDB_NBIT_PID = 0x00000025;
enum ISDB_NBIT_MSG_TID = 0x000000c5;
enum ISDB_NBIT_REF_TID = 0x000000c6;
enum ISDB_LDT_PID = 0x00000025;
enum ISDB_LDT_TID = 0x000000c7;
enum ISDB_SDTT_PID = 0x00000023;
enum ISDB_SDTT_ALT_PID = 0x00000028;
enum ISDB_SDTT_TID = 0x000000c3;
enum ISDB_CDT_PID = 0x00000029;
enum ISDB_CDT_TID = 0x000000c8;
enum SCTE_EAS_TID = 0x000000d8;
enum SCTE_EAS_IB_PID = 0x00001ffb;
enum SCTE_EAS_OOB_PID = 0x00001ffc;
enum CLSID_Mpeg2TableFilter = GUID(0x752845f1, 0x758f, 0x4c83, [0xa0, 0x43, 0x42, 0x70, 0xc5, 0x93, 0x30, 0x8e]);
enum ATSC_ETM_LOCATION_NOT_PRESENT = 0x00000000;
enum ATSC_ETM_LOCATION_IN_PTC_FOR_PSIP = 0x00000001;
enum ATSC_ETM_LOCATION_IN_PTC_FOR_EVENT = 0x00000002;
enum ATSC_ETM_LOCATION_RESERVED = 0x00000003;
enum SAMPLE_SEQ_SEQUENCE_HEADER = 0x00000001;
enum SAMPLE_SEQ_GOP_HEADER = 0x00000002;
enum SAMPLE_SEQ_PICTURE_HEADER = 0x00000003;
enum SAMPLE_SEQ_SEQUENCE_START = 0x00000001;
enum SAMPLE_SEQ_SEEK_POINT = 0x00000002;
enum SAMPLE_SEQ_FRAME_START = 0x00000003;
enum SAMPLE_SEQ_CONTENT_UNKNOWN = 0x00000000;
enum SAMPLE_SEQ_CONTENT_I_FRAME = 0x00000001;
enum SAMPLE_SEQ_CONTENT_P_FRAME = 0x00000002;
enum SAMPLE_SEQ_CONTENT_B_FRAME = 0x00000003;
enum SAMPLE_SEQ_CONTENT_STANDALONE_FRAME = 0x00000001;
enum SAMPLE_SEQ_CONTENT_REF_FRAME = 0x00000002;
enum SAMPLE_SEQ_CONTENT_NONREF_FRAME = 0x00000003;
enum COMPONENT_TAG_CAPTION_MIN = 0x00000030;
enum COMPONENT_TAG_CAPTION_MAX = 0x00000037;
enum COMPONENT_TAG_SUPERIMPOSE_MIN = 0x00000038;
enum COMPONENT_TAG_SUPERIMPOSE_MAX = 0x0000003f;
enum DVBS_SCAN_TABLE_MAX_SIZE = 0x00000190;
enum g_wszStreamBufferRecordingDuration = "Duration";
enum g_wszStreamBufferRecordingBitrate = "Bitrate";
enum g_wszStreamBufferRecordingSeekable = "Seekable";
enum g_wszStreamBufferRecordingStridable = "Stridable";
enum g_wszStreamBufferRecordingBroadcast = "Broadcast";
enum g_wszStreamBufferRecordingProtected = "Is_Protected";
enum g_wszStreamBufferRecordingTrusted = "Is_Trusted";
enum g_wszStreamBufferRecordingSignature_Name = "Signature_Name";
enum g_wszStreamBufferRecordingHasAudio = "HasAudio";
enum g_wszStreamBufferRecordingHasImage = "HasImage";
enum g_wszStreamBufferRecordingHasScript = "HasScript";
enum g_wszStreamBufferRecordingHasVideo = "HasVideo";
enum g_wszStreamBufferRecordingCurrentBitrate = "CurrentBitrate";
enum g_wszStreamBufferRecordingOptimalBitrate = "OptimalBitrate";
enum g_wszStreamBufferRecordingHasAttachedImages = "HasAttachedImages";
enum g_wszStreamBufferRecordingSkipBackward = "Can_Skip_Backward";
enum g_wszStreamBufferRecordingSkipForward = "Can_Skip_Forward";
enum g_wszStreamBufferRecordingNumberOfFrames = "NumberOfFrames";
enum g_wszStreamBufferRecordingFileSize = "FileSize";
enum g_wszStreamBufferRecordingHasArbitraryDataStream = "HasArbitraryDataStream";
enum g_wszStreamBufferRecordingHasFileTransferStream = "HasFileTransferStream";
enum g_wszStreamBufferRecordingTitle = "Title";
enum g_wszStreamBufferRecordingAuthor = "Author";
enum g_wszStreamBufferRecordingDescription = "Description";
enum g_wszStreamBufferRecordingRating = "Rating";
enum g_wszStreamBufferRecordingCopyright = "Copyright";
enum g_wszStreamBufferRecordingUse_DRM = "Use_DRM";
enum g_wszStreamBufferRecordingDRM_Flags = "DRM_Flags";
enum g_wszStreamBufferRecordingDRM_Level = "DRM_Level";
enum g_wszStreamBufferRecordingAlbumTitle = "WM/AlbumTitle";
enum g_wszStreamBufferRecordingTrack = "WM/Track";
enum g_wszStreamBufferRecordingPromotionURL = "WM/PromotionURL";
enum g_wszStreamBufferRecordingAlbumCoverURL = "WM/AlbumCoverURL";
enum g_wszStreamBufferRecordingGenre = "WM/Genre";
enum g_wszStreamBufferRecordingYear = "WM/Year";
enum g_wszStreamBufferRecordingGenreID = "WM/GenreID";
enum g_wszStreamBufferRecordingMCDI = "WM/MCDI";
enum g_wszStreamBufferRecordingComposer = "WM/Composer";
enum g_wszStreamBufferRecordingLyrics = "WM/Lyrics";
enum g_wszStreamBufferRecordingTrackNumber = "WM/TrackNumber";
enum g_wszStreamBufferRecordingToolName = "WM/ToolName";
enum g_wszStreamBufferRecordingToolVersion = "WM/ToolVersion";
enum g_wszStreamBufferRecordingIsVBR = "IsVBR";
enum g_wszStreamBufferRecordingAlbumArtist = "WM/AlbumArtist";
enum g_wszStreamBufferRecordingBannerImageType = "BannerImageType";
enum g_wszStreamBufferRecordingBannerImageData = "BannerImageData";
enum g_wszStreamBufferRecordingBannerImageURL = "BannerImageURL";
enum g_wszStreamBufferRecordingCopyrightURL = "CopyrightURL";
enum g_wszStreamBufferRecordingAspectRatioX = "AspectRatioX";
enum g_wszStreamBufferRecordingAspectRatioY = "AspectRatioY";
enum g_wszStreamBufferRecordingNSCName = "NSC_Name";
enum g_wszStreamBufferRecordingNSCAddress = "NSC_Address";
enum g_wszStreamBufferRecordingNSCPhone = "NSC_Phone";
enum g_wszStreamBufferRecordingNSCEmail = "NSC_Email";
enum g_wszStreamBufferRecordingNSCDescription = "NSC_Description";
enum STREAMBUFFER_EC_TIMEHOLE = 0x00000326;
enum STREAMBUFFER_EC_STALE_DATA_READ = 0x00000327;
enum STREAMBUFFER_EC_STALE_FILE_DELETED = 0x00000328;
enum STREAMBUFFER_EC_CONTENT_BECOMING_STALE = 0x00000329;
enum STREAMBUFFER_EC_WRITE_FAILURE = 0x0000032a;
enum STREAMBUFFER_EC_WRITE_FAILURE_CLEAR = 0x0000032b;
enum STREAMBUFFER_EC_READ_FAILURE = 0x0000032c;
enum STREAMBUFFER_EC_RATE_CHANGED = 0x0000032d;
enum STREAMBUFFER_EC_PRIMARY_AUDIO = 0x0000032e;
enum STREAMBUFFER_EC_RATE_CHANGING_FOR_SETPOSITIONS = 0x0000032f;
enum STREAMBUFFER_EC_SETPOSITIONS_EVENTS_DONE = 0x00000330;
enum IID_ICreatePropBagOnRegKey = GUID(0x8a674b48, 0x1f63, 0x11d3, [0xb6, 0x4c, 0x0, 0xc0, 0x4f, 0x79, 0x49, 0x8e]);
interface ICreatePropBagOnRegKey : IUnknown
{
    HRESULT Create(HKEY, const(wchar)*, uint, uint, const(GUID)*, void**);
}
alias DISPID_TUNER = int;
enum : int
{
    DISPID_TUNER_TS_UNIQUENAME                        = 0x00000001,
    DISPID_TUNER_TS_FRIENDLYNAME                      = 0x00000002,
    DISPID_TUNER_TS_CLSID                             = 0x00000003,
    DISPID_TUNER_TS_NETWORKTYPE                       = 0x00000004,
    DISPID_TUNER_TS__NETWORKTYPE                      = 0x00000005,
    DISPID_TUNER_TS_CREATETUNEREQUEST                 = 0x00000006,
    DISPID_TUNER_TS_ENUMCATEGORYGUIDS                 = 0x00000007,
    DISPID_TUNER_TS_ENUMDEVICEMONIKERS                = 0x00000008,
    DISPID_TUNER_TS_DEFAULTPREFERREDCOMPONENTTYPES    = 0x00000009,
    DISPID_TUNER_TS_FREQMAP                           = 0x0000000a,
    DISPID_TUNER_TS_DEFLOCATOR                        = 0x0000000b,
    DISPID_TUNER_TS_CLONE                             = 0x0000000c,
    DISPID_TUNER_TR_TUNINGSPACE                       = 0x00000001,
    DISPID_TUNER_TR_COMPONENTS                        = 0x00000002,
    DISPID_TUNER_TR_CLONE                             = 0x00000003,
    DISPID_TUNER_TR_LOCATOR                           = 0x00000004,
    DISPID_TUNER_CT_CATEGORY                          = 0x00000001,
    DISPID_TUNER_CT_MEDIAMAJORTYPE                    = 0x00000002,
    DISPID_TUNER_CT__MEDIAMAJORTYPE                   = 0x00000003,
    DISPID_TUNER_CT_MEDIASUBTYPE                      = 0x00000004,
    DISPID_TUNER_CT__MEDIASUBTYPE                     = 0x00000005,
    DISPID_TUNER_CT_MEDIAFORMATTYPE                   = 0x00000006,
    DISPID_TUNER_CT__MEDIAFORMATTYPE                  = 0x00000007,
    DISPID_TUNER_CT_MEDIATYPE                         = 0x00000008,
    DISPID_TUNER_CT_CLONE                             = 0x00000009,
    DISPID_TUNER_LCT_LANGID                           = 0x00000064,
    DISPID_TUNER_MP2CT_TYPE                           = 0x000000c8,
    DISPID_TUNER_ATSCCT_FLAGS                         = 0x0000012c,
    DISPID_TUNER_L_CARRFREQ                           = 0x00000001,
    DISPID_TUNER_L_INNERFECMETHOD                     = 0x00000002,
    DISPID_TUNER_L_INNERFECRATE                       = 0x00000003,
    DISPID_TUNER_L_OUTERFECMETHOD                     = 0x00000004,
    DISPID_TUNER_L_OUTERFECRATE                       = 0x00000005,
    DISPID_TUNER_L_MOD                                = 0x00000006,
    DISPID_TUNER_L_SYMRATE                            = 0x00000007,
    DISPID_TUNER_L_CLONE                              = 0x00000008,
    DISPID_TUNER_L_ATSC_PHYS_CHANNEL                  = 0x000000c9,
    DISPID_TUNER_L_ATSC_TSID                          = 0x000000ca,
    DISPID_TUNER_L_ATSC_MP2_PROGNO                    = 0x000000cb,
    DISPID_TUNER_L_DVBT_BANDWIDTH                     = 0x0000012d,
    DISPID_TUNER_L_DVBT_LPINNERFECMETHOD              = 0x0000012e,
    DISPID_TUNER_L_DVBT_LPINNERFECRATE                = 0x0000012f,
    DISPID_TUNER_L_DVBT_GUARDINTERVAL                 = 0x00000130,
    DISPID_TUNER_L_DVBT_HALPHA                        = 0x00000131,
    DISPID_TUNER_L_DVBT_TRANSMISSIONMODE              = 0x00000132,
    DISPID_TUNER_L_DVBT_INUSE                         = 0x00000133,
    DISPID_TUNER_L_DVBT2_PHYSICALLAYERPIPEID          = 0x0000015f,
    DISPID_TUNER_L_DVBS_POLARISATION                  = 0x00000191,
    DISPID_TUNER_L_DVBS_WEST                          = 0x00000192,
    DISPID_TUNER_L_DVBS_ORBITAL                       = 0x00000193,
    DISPID_TUNER_L_DVBS_AZIMUTH                       = 0x00000194,
    DISPID_TUNER_L_DVBS_ELEVATION                     = 0x00000195,
    DISPID_TUNER_L_DVBS2_DISEQ_LNB_SOURCE             = 0x00000196,
    DISPID_TUNER_TS_DVBS2_LOW_OSC_FREQ_OVERRIDE       = 0x00000197,
    DISPID_TUNER_TS_DVBS2_HI_OSC_FREQ_OVERRIDE        = 0x00000198,
    DISPID_TUNER_TS_DVBS2_LNB_SWITCH_FREQ_OVERRIDE    = 0x00000199,
    DISPID_TUNER_TS_DVBS2_SPECTRAL_INVERSION_OVERRIDE = 0x0000019a,
    DISPID_TUNER_L_DVBS2_ROLLOFF                      = 0x0000019b,
    DISPID_TUNER_L_DVBS2_PILOT                        = 0x0000019c,
    DISPID_TUNER_L_ANALOG_STANDARD                    = 0x00000259,
    DISPID_TUNER_L_DTV_O_MAJOR_CHANNEL                = 0x000002bd,
    DISPID_TUNER_C_TYPE                               = 0x00000001,
    DISPID_TUNER_C_STATUS                             = 0x00000002,
    DISPID_TUNER_C_LANGID                             = 0x00000003,
    DISPID_TUNER_C_DESCRIPTION                        = 0x00000004,
    DISPID_TUNER_C_CLONE                              = 0x00000005,
    DISPID_TUNER_C_MP2_PID                            = 0x00000065,
    DISPID_TUNER_C_MP2_PCRPID                         = 0x00000066,
    DISPID_TUNER_C_MP2_PROGNO                         = 0x00000067,
    DISPID_TUNER_C_ANALOG_AUDIO                       = 0x000000c9,
    DISPID_TUNER_TS_DVB_SYSTEMTYPE                    = 0x00000065,
    DISPID_TUNER_TS_DVB2_NETWORK_ID                   = 0x00000066,
    DISPID_TUNER_TS_DVBS_LOW_OSC_FREQ                 = 0x000003e9,
    DISPID_TUNER_TS_DVBS_HI_OSC_FREQ                  = 0x000003ea,
    DISPID_TUNER_TS_DVBS_LNB_SWITCH_FREQ              = 0x000003eb,
    DISPID_TUNER_TS_DVBS_INPUT_RANGE                  = 0x000003ec,
    DISPID_TUNER_TS_DVBS_SPECTRAL_INVERSION           = 0x000003ed,
    DISPID_TUNER_TS_AR_MINFREQUENCY                   = 0x00000065,
    DISPID_TUNER_TS_AR_MAXFREQUENCY                   = 0x00000066,
    DISPID_TUNER_TS_AR_STEP                           = 0x00000067,
    DISPID_TUNER_TS_AR_COUNTRYCODE                    = 0x00000068,
    DISPID_TUNER_TS_AUX_COUNTRYCODE                   = 0x00000065,
    DISPID_TUNER_TS_ATV_MINCHANNEL                    = 0x00000065,
    DISPID_TUNER_TS_ATV_MAXCHANNEL                    = 0x00000066,
    DISPID_TUNER_TS_ATV_INPUTTYPE                     = 0x00000067,
    DISPID_TUNER_TS_ATV_COUNTRYCODE                   = 0x00000068,
    DISPID_TUNER_TS_ATSC_MINMINORCHANNEL              = 0x000000c9,
    DISPID_TUNER_TS_ATSC_MAXMINORCHANNEL              = 0x000000ca,
    DISPID_TUNER_TS_ATSC_MINPHYSCHANNEL               = 0x000000cb,
    DISPID_TUNER_TS_ATSC_MAXPHYSCHANNEL               = 0x000000cc,
    DISPID_TUNER_TS_DC_MINMAJORCHANNEL                = 0x0000012d,
    DISPID_TUNER_TS_DC_MAXMAJORCHANNEL                = 0x0000012e,
    DISPID_TUNER_TS_DC_MINSOURCEID                    = 0x0000012f,
    DISPID_TUNER_TS_DC_MAXSOURCEID                    = 0x00000130,
    DISPID_CHTUNER_ATVAC_CHANNEL                      = 0x00000065,
    DISPID_CHTUNER_ATVDC_SYSTEM                       = 0x00000065,
    DISPID_CHTUNER_ATVDC_CONTENT                      = 0x00000066,
    DISPID_CHTUNER_CIDTR_CHANNELID                    = 0x00000065,
    DISPID_CHTUNER_CTR_CHANNEL                        = 0x00000065,
    DISPID_CHTUNER_ACTR_MINOR_CHANNEL                 = 0x000000c9,
    DISPID_CHTUNER_DCTR_MAJOR_CHANNEL                 = 0x0000012d,
    DISPID_CHTUNER_DCTR_SRCID                         = 0x0000012e,
    DISPID_DVBTUNER_DVBC_ATTRIBUTESVALID              = 0x00000065,
    DISPID_DVBTUNER_DVBC_PID                          = 0x00000066,
    DISPID_DVBTUNER_DVBC_TAG                          = 0x00000067,
    DISPID_DVBTUNER_DVBC_COMPONENTTYPE                = 0x00000068,
    DISPID_DVBTUNER_ONID                              = 0x00000065,
    DISPID_DVBTUNER_TSID                              = 0x00000066,
    DISPID_DVBTUNER_SID                               = 0x00000067,
    DISPID_MP2TUNER_TSID                              = 0x00000065,
    DISPID_MP2TUNER_PROGNO                            = 0x00000066,
    DISPID_MP2TUNERFACTORY_CREATETUNEREQUEST          = 0x00000001,
}

enum IID_ITuningSpaces = GUID(0x901284e4, 0x33fe, 0x4b69, [0x8d, 0x63, 0x63, 0x4a, 0x59, 0x6f, 0x37, 0x56]);
interface ITuningSpaces : IDispatch
{
    HRESULT get_Count(int*);
    HRESULT get__NewEnum(IEnumVARIANT*);
    HRESULT get_Item(VARIANT, ITuningSpace*);
    HRESULT get_EnumTuningSpaces(IEnumTuningSpaces*);
}
enum IID_ITuningSpaceContainer = GUID(0x5b692e84, 0xe2f1, 0x11d2, [0x94, 0x93, 0x0, 0xc0, 0x4f, 0x72, 0xd9, 0x80]);
interface ITuningSpaceContainer : IDispatch
{
    HRESULT get_Count(int*);
    HRESULT get__NewEnum(IEnumVARIANT*);
    HRESULT get_Item(VARIANT, ITuningSpace*);
    HRESULT put_Item(VARIANT, ITuningSpace);
    HRESULT TuningSpacesForCLSID(BSTR, ITuningSpaces*);
    HRESULT _TuningSpacesForCLSID2(const(GUID)*, ITuningSpaces*);
    HRESULT TuningSpacesForName(BSTR, ITuningSpaces*);
    HRESULT FindID(ITuningSpace, int*);
    HRESULT Add(ITuningSpace, VARIANT*);
    HRESULT get_EnumTuningSpaces(IEnumTuningSpaces*);
    HRESULT Remove(VARIANT);
    HRESULT get_MaxCount(int*);
    HRESULT put_MaxCount(int);
}
enum IID_ITuningSpace = GUID(0x61c6e30, 0xe622, 0x11d2, [0x94, 0x93, 0x0, 0xc0, 0x4f, 0x72, 0xd9, 0x80]);
interface ITuningSpace : IDispatch
{
    HRESULT get_UniqueName(BSTR*);
    HRESULT put_UniqueName(BSTR);
    HRESULT get_FriendlyName(BSTR*);
    HRESULT put_FriendlyName(BSTR);
    HRESULT get_CLSID(BSTR*);
    HRESULT get_NetworkType(BSTR*);
    HRESULT put_NetworkType(BSTR);
    HRESULT get__NetworkType(GUID*);
    HRESULT put__NetworkType(const(GUID)*);
    HRESULT CreateTuneRequest(ITuneRequest*);
    HRESULT EnumCategoryGUIDs(IEnumGUID*);
    HRESULT EnumDeviceMonikers(IEnumMoniker*);
    HRESULT get_DefaultPreferredComponentTypes(IComponentTypes*);
    HRESULT put_DefaultPreferredComponentTypes(IComponentTypes);
    HRESULT get_FrequencyMapping(BSTR*);
    HRESULT put_FrequencyMapping(BSTR);
    HRESULT get_DefaultLocator(ILocator*);
    HRESULT put_DefaultLocator(ILocator);
    HRESULT Clone(ITuningSpace*);
}
enum IID_IEnumTuningSpaces = GUID(0x8b8eb248, 0xfc2b, 0x11d2, [0x9d, 0x8c, 0x0, 0xc0, 0x4f, 0x72, 0xd9, 0x80]);
interface IEnumTuningSpaces : IUnknown
{
    HRESULT Next(uint, ITuningSpace*, uint*);
    HRESULT Skip(uint);
    HRESULT Reset();
    HRESULT Clone(IEnumTuningSpaces*);
}
enum IID_IDVBTuningSpace = GUID(0xada0b268, 0x3b19, 0x4e5b, [0xac, 0xc4, 0x49, 0xf8, 0x52, 0xbe, 0x13, 0xba]);
interface IDVBTuningSpace : ITuningSpace
{
    HRESULT get_SystemType(DVBSystemType*);
    HRESULT put_SystemType(DVBSystemType);
}
enum IID_IDVBTuningSpace2 = GUID(0x843188b4, 0xce62, 0x43db, [0x96, 0x6b, 0x81, 0x45, 0xa0, 0x94, 0xe0, 0x40]);
interface IDVBTuningSpace2 : IDVBTuningSpace
{
    HRESULT get_NetworkID(int*);
    HRESULT put_NetworkID(int);
}
enum IID_IDVBSTuningSpace = GUID(0xcdf7be60, 0xd954, 0x42fd, [0xa9, 0x72, 0x78, 0x97, 0x19, 0x58, 0xe4, 0x70]);
interface IDVBSTuningSpace : IDVBTuningSpace2
{
    HRESULT get_LowOscillator(int*);
    HRESULT put_LowOscillator(int);
    HRESULT get_HighOscillator(int*);
    HRESULT put_HighOscillator(int);
    HRESULT get_LNBSwitch(int*);
    HRESULT put_LNBSwitch(int);
    HRESULT get_InputRange(BSTR*);
    HRESULT put_InputRange(BSTR);
    HRESULT get_SpectralInversion(SpectralInversion*);
    HRESULT put_SpectralInversion(SpectralInversion);
}
enum IID_IAuxInTuningSpace = GUID(0xe48244b8, 0x7e17, 0x4f76, [0xa7, 0x63, 0x50, 0x90, 0xff, 0x1e, 0x2f, 0x30]);
interface IAuxInTuningSpace : ITuningSpace
{
}
enum IID_IAuxInTuningSpace2 = GUID(0xb10931ed, 0x8bfe, 0x4ab0, [0x9d, 0xce, 0xe4, 0x69, 0xc2, 0x9a, 0x97, 0x29]);
interface IAuxInTuningSpace2 : IAuxInTuningSpace
{
    HRESULT get_CountryCode(int*);
    HRESULT put_CountryCode(int);
}
enum IID_IAnalogTVTuningSpace = GUID(0x2a6e293c, 0x2595, 0x11d3, [0xb6, 0x4c, 0x0, 0xc0, 0x4f, 0x79, 0x49, 0x8e]);
interface IAnalogTVTuningSpace : ITuningSpace
{
    HRESULT get_MinChannel(int*);
    HRESULT put_MinChannel(int);
    HRESULT get_MaxChannel(int*);
    HRESULT put_MaxChannel(int);
    HRESULT get_InputType(TunerInputType*);
    HRESULT put_InputType(TunerInputType);
    HRESULT get_CountryCode(int*);
    HRESULT put_CountryCode(int);
}
enum IID_IATSCTuningSpace = GUID(0x369b4e2, 0x45b6, 0x11d3, [0xb6, 0x50, 0x0, 0xc0, 0x4f, 0x79, 0x49, 0x8e]);
interface IATSCTuningSpace : IAnalogTVTuningSpace
{
    HRESULT get_MinMinorChannel(int*);
    HRESULT put_MinMinorChannel(int);
    HRESULT get_MaxMinorChannel(int*);
    HRESULT put_MaxMinorChannel(int);
    HRESULT get_MinPhysicalChannel(int*);
    HRESULT put_MinPhysicalChannel(int);
    HRESULT get_MaxPhysicalChannel(int*);
    HRESULT put_MaxPhysicalChannel(int);
}
enum IID_IDigitalCableTuningSpace = GUID(0x13f9f9c, 0xb449, 0x4ec7, [0xa6, 0xd2, 0x9d, 0x4f, 0x2f, 0xc7, 0xa, 0xe5]);
interface IDigitalCableTuningSpace : IATSCTuningSpace
{
    HRESULT get_MinMajorChannel(int*);
    HRESULT put_MinMajorChannel(int);
    HRESULT get_MaxMajorChannel(int*);
    HRESULT put_MaxMajorChannel(int);
    HRESULT get_MinSourceID(int*);
    HRESULT put_MinSourceID(int);
    HRESULT get_MaxSourceID(int*);
    HRESULT put_MaxSourceID(int);
}
enum IID_IAnalogRadioTuningSpace = GUID(0x2a6e293b, 0x2595, 0x11d3, [0xb6, 0x4c, 0x0, 0xc0, 0x4f, 0x79, 0x49, 0x8e]);
interface IAnalogRadioTuningSpace : ITuningSpace
{
    HRESULT get_MinFrequency(int*);
    HRESULT put_MinFrequency(int);
    HRESULT get_MaxFrequency(int*);
    HRESULT put_MaxFrequency(int);
    HRESULT get_Step(int*);
    HRESULT put_Step(int);
}
enum IID_IAnalogRadioTuningSpace2 = GUID(0x39dd45da, 0x2da8, 0x46ba, [0x8a, 0x8a, 0x87, 0xe2, 0xb7, 0x3d, 0x98, 0x3a]);
interface IAnalogRadioTuningSpace2 : IAnalogRadioTuningSpace
{
    HRESULT get_CountryCode(int*);
    HRESULT put_CountryCode(int);
}
enum IID_ITuneRequest = GUID(0x7ddc146, 0xfc3d, 0x11d2, [0x9d, 0x8c, 0x0, 0xc0, 0x4f, 0x72, 0xd9, 0x80]);
interface ITuneRequest : IDispatch
{
    HRESULT get_TuningSpace(ITuningSpace*);
    HRESULT get_Components(IComponents*);
    HRESULT Clone(ITuneRequest*);
    HRESULT get_Locator(ILocator*);
    HRESULT put_Locator(ILocator);
}
enum IID_IChannelIDTuneRequest = GUID(0x156eff60, 0x86f4, 0x4e28, [0x89, 0xfc, 0x10, 0x97, 0x99, 0xfd, 0x57, 0xee]);
interface IChannelIDTuneRequest : ITuneRequest
{
    HRESULT get_ChannelID(BSTR*);
    HRESULT put_ChannelID(BSTR);
}
enum IID_IChannelTuneRequest = GUID(0x369b4e0, 0x45b6, 0x11d3, [0xb6, 0x50, 0x0, 0xc0, 0x4f, 0x79, 0x49, 0x8e]);
interface IChannelTuneRequest : ITuneRequest
{
    HRESULT get_Channel(int*);
    HRESULT put_Channel(int);
}
enum IID_IATSCChannelTuneRequest = GUID(0x369b4e1, 0x45b6, 0x11d3, [0xb6, 0x50, 0x0, 0xc0, 0x4f, 0x79, 0x49, 0x8e]);
interface IATSCChannelTuneRequest : IChannelTuneRequest
{
    HRESULT get_MinorChannel(int*);
    HRESULT put_MinorChannel(int);
}
enum IID_IDigitalCableTuneRequest = GUID(0xbad7753b, 0x6b37, 0x4810, [0xae, 0x57, 0x3c, 0xe0, 0xc4, 0xa9, 0xe6, 0xcb]);
interface IDigitalCableTuneRequest : IATSCChannelTuneRequest
{
    HRESULT get_MajorChannel(int*);
    HRESULT put_MajorChannel(int);
    HRESULT get_SourceID(int*);
    HRESULT put_SourceID(int);
}
enum IID_IDVBTuneRequest = GUID(0xd6f567e, 0xa636, 0x42bb, [0x83, 0xba, 0xce, 0x4c, 0x17, 0x4, 0xaf, 0xa2]);
interface IDVBTuneRequest : ITuneRequest
{
    HRESULT get_ONID(int*);
    HRESULT put_ONID(int);
    HRESULT get_TSID(int*);
    HRESULT put_TSID(int);
    HRESULT get_SID(int*);
    HRESULT put_SID(int);
}
enum IID_IMPEG2TuneRequest = GUID(0xeb7d987f, 0x8a01, 0x42ad, [0xb8, 0xae, 0x57, 0x4d, 0xee, 0xe4, 0x4d, 0x1a]);
interface IMPEG2TuneRequest : ITuneRequest
{
    HRESULT get_TSID(int*);
    HRESULT put_TSID(int);
    HRESULT get_ProgNo(int*);
    HRESULT put_ProgNo(int);
}
enum IID_IMPEG2TuneRequestFactory = GUID(0x14e11abd, 0xee37, 0x4893, [0x9e, 0xa1, 0x69, 0x64, 0xde, 0x93, 0x3e, 0x39]);
interface IMPEG2TuneRequestFactory : IDispatch
{
    HRESULT CreateTuneRequest(ITuningSpace, IMPEG2TuneRequest*);
}
enum IID_IMPEG2TuneRequestSupport = GUID(0x1b9d5fc3, 0x5bbc, 0x4b6c, [0xbb, 0x18, 0xb9, 0xd1, 0xe, 0x3e, 0xee, 0xbf]);
interface IMPEG2TuneRequestSupport : IUnknown
{
}
enum IID_ITunerCap = GUID(0xe60dfa45, 0x8d56, 0x4e65, [0xa8, 0xab, 0xd6, 0xbe, 0x94, 0x12, 0xc2, 0x49]);
interface ITunerCap : IUnknown
{
    HRESULT get_SupportedNetworkTypes(uint, uint*, GUID*);
    HRESULT get_SupportedVideoFormats(uint*, uint*);
    HRESULT get_AuxInputCount(uint*, uint*);
}
enum IID_ITunerCapEx = GUID(0xed3e0c66, 0x18c8, 0x4ea6, [0x93, 0x0, 0xf6, 0x84, 0x1f, 0xdd, 0x35, 0xdc]);
interface ITunerCapEx : IUnknown
{
    HRESULT get_Has608_708Caption(VARIANT_BOOL*);
}
enum IID_ITuner = GUID(0x28c52640, 0x18a, 0x11d3, [0x9d, 0x8e, 0x0, 0xc0, 0x4f, 0x72, 0xd9, 0x80]);
interface ITuner : IUnknown
{
    HRESULT get_TuningSpace(ITuningSpace*);
    HRESULT put_TuningSpace(ITuningSpace);
    HRESULT EnumTuningSpaces(IEnumTuningSpaces*);
    HRESULT get_TuneRequest(ITuneRequest*);
    HRESULT put_TuneRequest(ITuneRequest);
    HRESULT Validate(ITuneRequest);
    HRESULT get_PreferredComponentTypes(IComponentTypes*);
    HRESULT put_PreferredComponentTypes(IComponentTypes);
    HRESULT get_SignalStrength(int*);
    HRESULT TriggerSignalEvents(int);
}
enum IID_IScanningTuner = GUID(0x1dfd0a5c, 0x284, 0x11d3, [0x9d, 0x8e, 0x0, 0xc0, 0x4f, 0x72, 0xd9, 0x80]);
interface IScanningTuner : ITuner
{
    HRESULT SeekUp();
    HRESULT SeekDown();
    HRESULT ScanUp(int);
    HRESULT ScanDown(int);
    HRESULT AutoProgram();
}
enum IID_IScanningTunerEx = GUID(0x4bbd195, 0xe2d, 0x4593, [0x9b, 0xd5, 0x4f, 0x90, 0x8b, 0xc3, 0x3c, 0xf5]);
interface IScanningTunerEx : IScanningTuner
{
    HRESULT GetCurrentLocator(ILocator*);
    HRESULT PerformExhaustiveScan(int, int, VARIANT_BOOL, ulong);
    HRESULT TerminateCurrentScan(int*);
    HRESULT ResumeCurrentScan(ulong);
    HRESULT GetTunerScanningCapability(int*, int*, GUID*);
    HRESULT GetTunerStatus(int*, int*, int*, int*);
    HRESULT GetCurrentTunerStandardCapability(GUID, int*, int*);
    HRESULT SetScanSignalTypeFilter(int, int);
}
enum IID_IComponentType = GUID(0x6a340dc0, 0x311, 0x11d3, [0x9d, 0x8e, 0x0, 0xc0, 0x4f, 0x72, 0xd9, 0x80]);
interface IComponentType : IDispatch
{
    HRESULT get_Category(ComponentCategory*);
    HRESULT put_Category(ComponentCategory);
    HRESULT get_MediaMajorType(BSTR*);
    HRESULT put_MediaMajorType(BSTR);
    HRESULT get__MediaMajorType(GUID*);
    HRESULT put__MediaMajorType(const(GUID)*);
    HRESULT get_MediaSubType(BSTR*);
    HRESULT put_MediaSubType(BSTR);
    HRESULT get__MediaSubType(GUID*);
    HRESULT put__MediaSubType(const(GUID)*);
    HRESULT get_MediaFormatType(BSTR*);
    HRESULT put_MediaFormatType(BSTR);
    HRESULT get__MediaFormatType(GUID*);
    HRESULT put__MediaFormatType(const(GUID)*);
    HRESULT get_MediaType(AM_MEDIA_TYPE*);
    HRESULT put_MediaType(AM_MEDIA_TYPE*);
    HRESULT Clone(IComponentType*);
}
enum IID_ILanguageComponentType = GUID(0xb874c8ba, 0xfa2, 0x11d3, [0x9d, 0x8e, 0x0, 0xc0, 0x4f, 0x72, 0xd9, 0x80]);
interface ILanguageComponentType : IComponentType
{
    HRESULT get_LangID(int*);
    HRESULT put_LangID(int);
}
enum IID_IMPEG2ComponentType = GUID(0x2c073d84, 0xb51c, 0x48c9, [0xaa, 0x9f, 0x68, 0x97, 0x1e, 0x1f, 0x6e, 0x38]);
interface IMPEG2ComponentType : ILanguageComponentType
{
    HRESULT get_StreamType(MPEG2StreamType*);
    HRESULT put_StreamType(MPEG2StreamType);
}
enum IID_IATSCComponentType = GUID(0xfc189e4d, 0x7bd4, 0x4125, [0xb3, 0xb3, 0x3a, 0x76, 0xa3, 0x32, 0xcc, 0x96]);
interface IATSCComponentType : IMPEG2ComponentType
{
    HRESULT get_Flags(int*);
    HRESULT put_Flags(int);
}
enum IID_IEnumComponentTypes = GUID(0x8a674b4a, 0x1f63, 0x11d3, [0xb6, 0x4c, 0x0, 0xc0, 0x4f, 0x79, 0x49, 0x8e]);
interface IEnumComponentTypes : IUnknown
{
    HRESULT Next(uint, IComponentType*, uint*);
    HRESULT Skip(uint);
    HRESULT Reset();
    HRESULT Clone(IEnumComponentTypes*);
}
enum IID_IComponentTypes = GUID(0xdc13d4a, 0x313, 0x11d3, [0x9d, 0x8e, 0x0, 0xc0, 0x4f, 0x72, 0xd9, 0x80]);
interface IComponentTypes : IDispatch
{
    HRESULT get_Count(int*);
    HRESULT get__NewEnum(IEnumVARIANT*);
    HRESULT EnumComponentTypes(IEnumComponentTypes*);
    HRESULT get_Item(VARIANT, IComponentType*);
    HRESULT put_Item(VARIANT, IComponentType);
    HRESULT Add(IComponentType, VARIANT*);
    HRESULT Remove(VARIANT);
    HRESULT Clone(IComponentTypes*);
}
enum IID_IComponent = GUID(0x1a5576fc, 0xe19, 0x11d3, [0x9d, 0x8e, 0x0, 0xc0, 0x4f, 0x72, 0xd9, 0x80]);
interface IComponent : IDispatch
{
    HRESULT get_Type(IComponentType*);
    HRESULT put_Type(IComponentType);
    HRESULT get_DescLangID(int*);
    HRESULT put_DescLangID(int);
    HRESULT get_Status(ComponentStatus*);
    HRESULT put_Status(ComponentStatus);
    HRESULT get_Description(BSTR*);
    HRESULT put_Description(BSTR);
    HRESULT Clone(IComponent*);
}
enum IID_IAnalogAudioComponentType = GUID(0x2cfeb2a8, 0x1787, 0x4a24, [0xa9, 0x41, 0xc6, 0xea, 0xec, 0x39, 0xc8, 0x42]);
interface IAnalogAudioComponentType : IComponentType
{
    HRESULT get_AnalogAudioMode(TVAudioMode*);
    HRESULT put_AnalogAudioMode(TVAudioMode);
}
enum IID_IMPEG2Component = GUID(0x1493e353, 0x1eb6, 0x473c, [0x80, 0x2d, 0x8e, 0x6b, 0x8e, 0xc9, 0xd2, 0xa9]);
interface IMPEG2Component : IComponent
{
    HRESULT get_PID(int*);
    HRESULT put_PID(int);
    HRESULT get_PCRPID(int*);
    HRESULT put_PCRPID(int);
    HRESULT get_ProgramNumber(int*);
    HRESULT put_ProgramNumber(int);
}
enum IID_IEnumComponents = GUID(0x2a6e2939, 0x2595, 0x11d3, [0xb6, 0x4c, 0x0, 0xc0, 0x4f, 0x79, 0x49, 0x8e]);
interface IEnumComponents : IUnknown
{
    HRESULT Next(uint, IComponent*, uint*);
    HRESULT Skip(uint);
    HRESULT Reset();
    HRESULT Clone(IEnumComponents*);
}
enum IID_IComponents = GUID(0x39a48091, 0xfffe, 0x4182, [0xa1, 0x61, 0x3f, 0xf8, 0x2, 0x64, 0xe, 0x26]);
interface IComponents : IDispatch
{
    HRESULT get_Count(int*);
    HRESULT get__NewEnum(IEnumVARIANT*);
    HRESULT EnumComponents(IEnumComponents*);
    HRESULT get_Item(VARIANT, IComponent*);
    HRESULT Add(IComponent, VARIANT*);
    HRESULT Remove(VARIANT);
    HRESULT Clone(IComponents*);
    HRESULT put_Item(VARIANT, IComponent);
}
enum IID_IComponentsOld = GUID(0xfcd01846, 0xe19, 0x11d3, [0x9d, 0x8e, 0x0, 0xc0, 0x4f, 0x72, 0xd9, 0x80]);
interface IComponentsOld : IDispatch
{
    HRESULT get_Count(int*);
    HRESULT get__NewEnum(IEnumVARIANT*);
    HRESULT EnumComponents(IEnumComponents*);
    HRESULT get_Item(VARIANT, IComponent*);
    HRESULT Add(IComponent, VARIANT*);
    HRESULT Remove(VARIANT);
    HRESULT Clone(IComponents*);
}
enum IID_ILocator = GUID(0x286d7f89, 0x760c, 0x4f89, [0x80, 0xc4, 0x66, 0x84, 0x1d, 0x25, 0x7, 0xaa]);
interface ILocator : IDispatch
{
    HRESULT get_CarrierFrequency(int*);
    HRESULT put_CarrierFrequency(int);
    HRESULT get_InnerFEC(FECMethod*);
    HRESULT put_InnerFEC(FECMethod);
    HRESULT get_InnerFECRate(BinaryConvolutionCodeRate*);
    HRESULT put_InnerFECRate(BinaryConvolutionCodeRate);
    HRESULT get_OuterFEC(FECMethod*);
    HRESULT put_OuterFEC(FECMethod);
    HRESULT get_OuterFECRate(BinaryConvolutionCodeRate*);
    HRESULT put_OuterFECRate(BinaryConvolutionCodeRate);
    HRESULT get_Modulation(ModulationType*);
    HRESULT put_Modulation(ModulationType);
    HRESULT get_SymbolRate(int*);
    HRESULT put_SymbolRate(int);
    HRESULT Clone(ILocator*);
}
enum IID_IAnalogLocator = GUID(0x34d1f26b, 0xe339, 0x430d, [0xab, 0xce, 0x73, 0x8c, 0xb4, 0x89, 0x84, 0xdc]);
interface IAnalogLocator : ILocator
{
    HRESULT get_VideoStandard(AnalogVideoStandard*);
    HRESULT put_VideoStandard(AnalogVideoStandard);
}
enum IID_IDigitalLocator = GUID(0x19b595d8, 0x839a, 0x47f0, [0x96, 0xdf, 0x4f, 0x19, 0x4f, 0x3c, 0x76, 0x8c]);
interface IDigitalLocator : ILocator
{
}
enum IID_IATSCLocator = GUID(0xbf8d986f, 0x8c2b, 0x4131, [0x94, 0xd7, 0x4d, 0x3d, 0x9f, 0xcc, 0x21, 0xef]);
interface IATSCLocator : IDigitalLocator
{
    HRESULT get_PhysicalChannel(int*);
    HRESULT put_PhysicalChannel(int);
    HRESULT get_TSID(int*);
    HRESULT put_TSID(int);
}
enum IID_IATSCLocator2 = GUID(0x612aa885, 0x66cf, 0x4090, [0xba, 0xa, 0x56, 0x6f, 0x53, 0x12, 0xe4, 0xca]);
interface IATSCLocator2 : IATSCLocator
{
    HRESULT get_ProgramNumber(int*);
    HRESULT put_ProgramNumber(int);
}
enum IID_IDigitalCableLocator = GUID(0x48f66a11, 0x171a, 0x419a, [0x95, 0x25, 0xbe, 0xee, 0xcd, 0x51, 0x58, 0x4c]);
interface IDigitalCableLocator : IATSCLocator2
{
}
enum IID_IDVBTLocator = GUID(0x8664da16, 0xdda2, 0x42ac, [0x92, 0x6a, 0xc1, 0x8f, 0x91, 0x27, 0xc3, 0x2]);
interface IDVBTLocator : IDigitalLocator
{
    HRESULT get_Bandwidth(int*);
    HRESULT put_Bandwidth(int);
    HRESULT get_LPInnerFEC(FECMethod*);
    HRESULT put_LPInnerFEC(FECMethod);
    HRESULT get_LPInnerFECRate(BinaryConvolutionCodeRate*);
    HRESULT put_LPInnerFECRate(BinaryConvolutionCodeRate);
    HRESULT get_HAlpha(HierarchyAlpha*);
    HRESULT put_HAlpha(HierarchyAlpha);
    HRESULT get_Guard(GuardInterval*);
    HRESULT put_Guard(GuardInterval);
    HRESULT get_Mode(TransmissionMode*);
    HRESULT put_Mode(TransmissionMode);
    HRESULT get_OtherFrequencyInUse(VARIANT_BOOL*);
    HRESULT put_OtherFrequencyInUse(VARIANT_BOOL);
}
enum IID_IDVBTLocator2 = GUID(0x448a2edf, 0xae95, 0x4b43, [0xa3, 0xcc, 0x74, 0x78, 0x43, 0xc4, 0x53, 0xd4]);
interface IDVBTLocator2 : IDVBTLocator
{
    HRESULT get_PhysicalLayerPipeId(int*);
    HRESULT put_PhysicalLayerPipeId(int);
}
enum IID_IDVBSLocator = GUID(0x3d7c353c, 0xd04, 0x45f1, [0xa7, 0x42, 0xf9, 0x7c, 0xc1, 0x18, 0x8d, 0xc8]);
interface IDVBSLocator : IDigitalLocator
{
    HRESULT get_SignalPolarisation(Polarisation*);
    HRESULT put_SignalPolarisation(Polarisation);
    HRESULT get_WestPosition(VARIANT_BOOL*);
    HRESULT put_WestPosition(VARIANT_BOOL);
    HRESULT get_OrbitalPosition(int*);
    HRESULT put_OrbitalPosition(int);
    HRESULT get_Azimuth(int*);
    HRESULT put_Azimuth(int);
    HRESULT get_Elevation(int*);
    HRESULT put_Elevation(int);
}
enum IID_IDVBSLocator2 = GUID(0x6044634a, 0x1733, 0x4f99, [0xb9, 0x82, 0x5f, 0xb1, 0x2a, 0xfc, 0xe4, 0xf0]);
interface IDVBSLocator2 : IDVBSLocator
{
    HRESULT get_DiseqLNBSource(LNB_Source*);
    HRESULT put_DiseqLNBSource(LNB_Source);
    HRESULT get_LocalOscillatorOverrideLow(int*);
    HRESULT put_LocalOscillatorOverrideLow(int);
    HRESULT get_LocalOscillatorOverrideHigh(int*);
    HRESULT put_LocalOscillatorOverrideHigh(int);
    HRESULT get_LocalLNBSwitchOverride(int*);
    HRESULT put_LocalLNBSwitchOverride(int);
    HRESULT get_LocalSpectralInversionOverride(SpectralInversion*);
    HRESULT put_LocalSpectralInversionOverride(SpectralInversion);
    HRESULT get_SignalRollOff(RollOff*);
    HRESULT put_SignalRollOff(RollOff);
    HRESULT get_SignalPilot(Pilot*);
    HRESULT put_SignalPilot(Pilot);
}
enum IID_IDVBCLocator = GUID(0x6e42f36e, 0x1dd2, 0x43c4, [0x9f, 0x78, 0x69, 0xd2, 0x5a, 0xe3, 0x90, 0x34]);
interface IDVBCLocator : IDigitalLocator
{
}
enum IID_IISDBSLocator = GUID(0xc9897087, 0xe29c, 0x473f, [0x9e, 0x4b, 0x70, 0x72, 0x12, 0x3d, 0xea, 0x14]);
interface IISDBSLocator : IDVBSLocator
{
}
enum IID_IESOpenMmiEvent = GUID(0xba4b6526, 0x1a35, 0x4635, [0x8b, 0x56, 0x3e, 0xc6, 0x12, 0x74, 0x6a, 0x8c]);
interface IESOpenMmiEvent : IESEvent
{
    HRESULT GetDialogNumber(uint*, uint*);
    HRESULT GetDialogType(GUID*);
    HRESULT GetDialogData(SAFEARRAY**);
    HRESULT GetDialogStringData(BSTR*, BSTR*);
}
enum IID_IESCloseMmiEvent = GUID(0x6b80e96f, 0x55e2, 0x45aa, [0xb7, 0x54, 0xc, 0x23, 0xc8, 0xe7, 0xd5, 0xc1]);
interface IESCloseMmiEvent : IESEvent
{
    HRESULT GetDialogNumber(uint*);
}
enum IID_IESValueUpdatedEvent = GUID(0x8a24c46e, 0xbb63, 0x4664, [0x86, 0x2, 0x5d, 0x9c, 0x71, 0x8c, 0x14, 0x6d]);
interface IESValueUpdatedEvent : IESEvent
{
    HRESULT GetValueNames(SAFEARRAY**);
}
enum IID_IESRequestTunerEvent = GUID(0x54c7a5e8, 0xc3bb, 0x4f51, [0xaf, 0x14, 0xe0, 0xe2, 0xc0, 0xe3, 0x4c, 0x6d]);
interface IESRequestTunerEvent : IESEvent
{
    HRESULT GetPriority(ubyte*);
    HRESULT GetReason(ubyte*);
    HRESULT GetConsequences(ubyte*);
    HRESULT GetEstimatedTime(uint*);
}
enum IID_IESIsdbCasResponseEvent = GUID(0x2017cb03, 0xdc0f, 0x4c24, [0x83, 0xca, 0x36, 0x30, 0x7b, 0x2c, 0xd1, 0x9f]);
interface IESIsdbCasResponseEvent : IESEvent
{
    HRESULT GetRequestId(uint*);
    HRESULT GetStatus(uint*);
    HRESULT GetDataLength(uint*);
    HRESULT GetResponseData(SAFEARRAY**);
}
enum IID_IGpnvsCommonBase = GUID(0x907e0b5c, 0xe42d, 0x4f04, [0x91, 0xf0, 0x26, 0xf4, 0x1, 0xf3, 0x69, 0x7]);
interface IGpnvsCommonBase : IUnknown
{
    HRESULT GetValueUpdateName(BSTR*);
}
enum IID_IESEventFactory = GUID(0x506a09b8, 0x7f86, 0x4e04, [0xac, 0x5, 0x33, 0x3, 0xbf, 0xe8, 0xfc, 0x49]);
interface IESEventFactory : IUnknown
{
    HRESULT CreateESEvent(IUnknown, uint, GUID, uint, ubyte*, BSTR, IUnknown, IESEvent*);
}
enum IID_IESLicenseRenewalResultEvent = GUID(0xd5a48ef5, 0xa81b, 0x4df0, [0xac, 0xaa, 0x5e, 0x35, 0xe7, 0xea, 0x45, 0xd4]);
interface IESLicenseRenewalResultEvent : IESEvent
{
    HRESULT GetCallersId(uint*);
    HRESULT GetFileName(BSTR*);
    HRESULT IsRenewalSuccessful(BOOL*);
    HRESULT IsCheckEntitlementCallRequired(BOOL*);
    HRESULT GetDescrambledStatus(uint*);
    HRESULT GetRenewalResultCode(uint*);
    HRESULT GetCASFailureCode(uint*);
    HRESULT GetRenewalHResult(HRESULT*);
    HRESULT GetEntitlementTokenLength(uint*);
    HRESULT GetEntitlementToken(SAFEARRAY**);
    HRESULT GetExpiryDate(ulong*);
}
enum IID_IESFileExpiryDateEvent = GUID(0xba9edcb6, 0x4d36, 0x4cfe, [0x8c, 0x56, 0x87, 0xa6, 0xb0, 0xca, 0x48, 0xe1]);
interface IESFileExpiryDateEvent : IESEvent
{
    HRESULT GetTunerId(GUID*);
    HRESULT GetExpiryDate(ulong*);
    HRESULT GetFinalExpiryDate(ulong*);
    HRESULT GetMaxRenewalCount(uint*);
    HRESULT IsEntitlementTokenPresent(BOOL*);
    HRESULT DoesExpireAfterFirstUse(BOOL*);
}
enum IID_IESEventService = GUID(0xed89a619, 0x4c06, 0x4b2f, [0x99, 0xeb, 0xc7, 0x66, 0x9b, 0x13, 0x4, 0x7c]);
interface IESEventService : IUnknown
{
    HRESULT FireESEvent(IESEvent);
}
enum IID_IESEventServiceConfiguration = GUID(0x33b9daae, 0x9309, 0x491d, [0xa0, 0x51, 0xbc, 0xad, 0x2a, 0x70, 0xcd, 0x66]);
interface IESEventServiceConfiguration : IUnknown
{
    HRESULT SetParent(IESEventService);
    HRESULT RemoveParent();
    HRESULT SetOwner(IESEvents);
    HRESULT RemoveOwner();
    HRESULT SetGraph(IFilterGraph);
    HRESULT RemoveGraph(IFilterGraph);
}
enum IID_IRegisterTuner = GUID(0x359b3901, 0x572c, 0x4854, [0xbb, 0x49, 0xcd, 0xef, 0x66, 0x60, 0x6a, 0x25]);
interface IRegisterTuner : IUnknown
{
    HRESULT Register(ITuner, IGraphBuilder);
    HRESULT Unregister();
}
enum IID_IBDAComparable = GUID(0xb34505e0, 0x2f0e, 0x497b, [0x80, 0xbc, 0xd4, 0x3f, 0x3b, 0x24, 0xed, 0x7f]);
interface IBDAComparable : IUnknown
{
    HRESULT CompareExact(IDispatch, int*);
    HRESULT CompareEquivalent(IDispatch, uint, int*);
    HRESULT HashExact(long*);
    HRESULT HashExactIncremental(long, long*);
    HRESULT HashEquivalent(uint, long*);
    HRESULT HashEquivalentIncremental(long, uint, long*);
}
enum IID_IPersistTuneXml = GUID(0x754cd31, 0x8d15, 0x47a9, [0x82, 0x15, 0xd2, 0x0, 0x64, 0x15, 0x72, 0x44]);
interface IPersistTuneXml : IPersist
{
    HRESULT InitNew();
    HRESULT Load(VARIANT);
    HRESULT Save(VARIANT*);
}
enum IID_IPersistTuneXmlUtility = GUID(0x990237ae, 0xac11, 0x4614, [0xbe, 0x8f, 0xdd, 0x21, 0x7a, 0x4c, 0xb4, 0xcb]);
interface IPersistTuneXmlUtility : IUnknown
{
    HRESULT Deserialize(VARIANT, IUnknown*);
}
enum IID_IPersistTuneXmlUtility2 = GUID(0x992e165f, 0xea24, 0x4b2f, [0x9a, 0x1d, 0x0, 0x9d, 0x92, 0x12, 0x4, 0x51]);
interface IPersistTuneXmlUtility2 : IPersistTuneXmlUtility
{
    HRESULT Serialize(ITuneRequest, BSTR*);
}
enum IID_IBDACreateTuneRequestEx = GUID(0xc0a4a1d4, 0x2b3c, 0x491a, [0xba, 0x22, 0x49, 0x9f, 0xba, 0xdd, 0x4d, 0x12]);
interface IBDACreateTuneRequestEx : IUnknown
{
    HRESULT CreateTuneRequestEx(const(GUID)*, ITuneRequest*);
}
enum CLSID_SystemTuningSpaces = GUID(0xd02aac50, 0x27e, 0x11d3, [0x9d, 0x8e, 0x0, 0xc0, 0x4f, 0x72, 0xd9, 0x80]);
struct SystemTuningSpaces
{
}
enum CLSID_TuningSpace = GUID(0x5ffdc5e6, 0xb83a, 0x4b55, [0xb6, 0xe8, 0xc6, 0x9e, 0x76, 0x5f, 0xe9, 0xdb]);
struct TuningSpace
{
}
enum CLSID_ChannelIDTuningSpace = GUID(0xcc829a2f, 0x3365, 0x463f, [0xaf, 0x13, 0x81, 0xdb, 0xb6, 0xf3, 0xa5, 0x55]);
struct ChannelIDTuningSpace
{
}
enum CLSID_ATSCTuningSpace = GUID(0xa2e30750, 0x6c3d, 0x11d3, [0xb6, 0x53, 0x0, 0xc0, 0x4f, 0x79, 0x49, 0x8e]);
struct ATSCTuningSpace
{
}
enum CLSID_DigitalCableTuningSpace = GUID(0xd9bb4cee, 0xb87a, 0x47f1, [0xac, 0x92, 0xb0, 0x8d, 0x9c, 0x78, 0x13, 0xfc]);
struct DigitalCableTuningSpace
{
}
enum CLSID_AnalogRadioTuningSpace = GUID(0x8a674b4c, 0x1f63, 0x11d3, [0xb6, 0x4c, 0x0, 0xc0, 0x4f, 0x79, 0x49, 0x8e]);
struct AnalogRadioTuningSpace
{
}
enum CLSID_AuxInTuningSpace = GUID(0xf9769a06, 0x7aca, 0x4e39, [0x9c, 0xfb, 0x97, 0xbb, 0x35, 0xf0, 0xe7, 0x7e]);
struct AuxInTuningSpace
{
}
enum CLSID_AnalogTVTuningSpace = GUID(0x8a674b4d, 0x1f63, 0x11d3, [0xb6, 0x4c, 0x0, 0xc0, 0x4f, 0x79, 0x49, 0x8e]);
struct AnalogTVTuningSpace
{
}
enum CLSID_DVBTuningSpace = GUID(0xc6b14b32, 0x76aa, 0x4a86, [0xa7, 0xac, 0x5c, 0x79, 0xaa, 0xf5, 0x8d, 0xa7]);
struct DVBTuningSpace
{
}
enum CLSID_DVBSTuningSpace = GUID(0xb64016f3, 0xc9a2, 0x4066, [0x96, 0xf0, 0xbd, 0x95, 0x63, 0x31, 0x47, 0x26]);
struct DVBSTuningSpace
{
}
enum CLSID_ComponentTypes = GUID(0xa1a2b1c4, 0xe3a, 0x11d3, [0x9d, 0x8e, 0x0, 0xc0, 0x4f, 0x72, 0xd9, 0x80]);
struct ComponentTypes
{
}
enum CLSID_ComponentType = GUID(0x823535a0, 0x318, 0x11d3, [0x9d, 0x8e, 0x0, 0xc0, 0x4f, 0x72, 0xd9, 0x80]);
struct ComponentType
{
}
enum CLSID_LanguageComponentType = GUID(0x1be49f30, 0xe1b, 0x11d3, [0x9d, 0x8e, 0x0, 0xc0, 0x4f, 0x72, 0xd9, 0x80]);
struct LanguageComponentType
{
}
enum CLSID_MPEG2ComponentType = GUID(0x418008f3, 0xcf67, 0x4668, [0x96, 0x28, 0x10, 0xdc, 0x52, 0xbe, 0x1d, 0x8]);
struct MPEG2ComponentType
{
}
enum CLSID_ATSCComponentType = GUID(0xa8dcf3d5, 0x780, 0x4ef4, [0x8a, 0x83, 0x2c, 0xff, 0xaa, 0xcb, 0x8a, 0xce]);
struct ATSCComponentType
{
}
enum CLSID_Components = GUID(0x809b6661, 0x94c4, 0x49e6, [0xb6, 0xec, 0x3f, 0xf, 0x86, 0x22, 0x15, 0xaa]);
struct Components
{
}
enum CLSID_Component = GUID(0x59dc47a8, 0x116c, 0x11d3, [0x9d, 0x8e, 0x0, 0xc0, 0x4f, 0x72, 0xd9, 0x80]);
struct Component
{
}
enum CLSID_MPEG2Component = GUID(0x55cb2d7, 0x2969, 0x45cd, [0x91, 0x4b, 0x76, 0x89, 0x7, 0x22, 0xf1, 0x12]);
struct MPEG2Component
{
}
enum CLSID_AnalogAudioComponentType = GUID(0x28ab0005, 0xe845, 0x4ffa, [0xaa, 0x9b, 0xf4, 0x66, 0x52, 0x36, 0x14, 0x1c]);
struct AnalogAudioComponentType
{
}
enum CLSID_TuneRequest = GUID(0xb46e0d38, 0xab35, 0x4a06, [0xa1, 0x37, 0x70, 0x57, 0x6b, 0x1, 0xb3, 0x9f]);
struct TuneRequest
{
}
enum CLSID_ChannelIDTuneRequest = GUID(0x3a9428a7, 0x31a4, 0x45e9, [0x9e, 0xfb, 0xe0, 0x55, 0xbf, 0x7b, 0xb3, 0xdb]);
struct ChannelIDTuneRequest
{
}
enum CLSID_ChannelTuneRequest = GUID(0x369b4e5, 0x45b6, 0x11d3, [0xb6, 0x50, 0x0, 0xc0, 0x4f, 0x79, 0x49, 0x8e]);
struct ChannelTuneRequest
{
}
enum CLSID_ATSCChannelTuneRequest = GUID(0x369b4e6, 0x45b6, 0x11d3, [0xb6, 0x50, 0x0, 0xc0, 0x4f, 0x79, 0x49, 0x8e]);
struct ATSCChannelTuneRequest
{
}
enum CLSID_DigitalCableTuneRequest = GUID(0x26ec0b63, 0xaa90, 0x458a, [0x8d, 0xf4, 0x56, 0x59, 0xf2, 0xc8, 0xa1, 0x8a]);
struct DigitalCableTuneRequest
{
}
enum CLSID_MPEG2TuneRequest = GUID(0x955ac62, 0xbf2e, 0x4cba, [0xa2, 0xb9, 0xa6, 0x3f, 0x77, 0x2d, 0x46, 0xcf]);
struct MPEG2TuneRequest
{
}
enum CLSID_MPEG2TuneRequestFactory = GUID(0x2c63e4eb, 0x4cea, 0x41b8, [0x91, 0x9c, 0xe9, 0x47, 0xea, 0x19, 0xa7, 0x7c]);
struct MPEG2TuneRequestFactory
{
}
enum CLSID_Locator = GUID(0x888c883, 0xac4f, 0x4943, [0xb5, 0x16, 0x2c, 0x38, 0xd9, 0xb3, 0x45, 0x62]);
struct Locator
{
}
enum CLSID_DigitalLocator = GUID(0x6e50cc0d, 0xc19b, 0x4bf6, [0x81, 0xb, 0x5b, 0xd6, 0x7, 0x61, 0xf5, 0xcc]);
struct DigitalLocator
{
}
enum CLSID_AnalogLocator = GUID(0x49638b91, 0x48ab, 0x48b7, [0xa4, 0x7a, 0x7d, 0xe, 0x75, 0xa0, 0x8e, 0xde]);
struct AnalogLocator
{
}
enum CLSID_ATSCLocator = GUID(0x8872ff1b, 0x98fa, 0x4d7a, [0x8d, 0x93, 0xc9, 0xf1, 0x5, 0x5f, 0x85, 0xbb]);
struct ATSCLocator
{
}
enum CLSID_DigitalCableLocator = GUID(0x3c06416, 0xd127, 0x407a, [0xab, 0x4c, 0xfd, 0xd2, 0x79, 0xab, 0xbe, 0x5d]);
struct DigitalCableLocator
{
}
enum CLSID_DVBTLocator = GUID(0x9cd64701, 0xbdf3, 0x4d14, [0x8e, 0x3, 0xf1, 0x29, 0x83, 0xd8, 0x66, 0x64]);
struct DVBTLocator
{
}
enum CLSID_DVBTLocator2 = GUID(0xefe3fa02, 0x45d7, 0x4920, [0xbe, 0x96, 0x53, 0xfa, 0x7f, 0x35, 0xb0, 0xe6]);
struct DVBTLocator2
{
}
enum CLSID_DVBSLocator = GUID(0x1df7d126, 0x4050, 0x47f0, [0xa7, 0xcf, 0x4c, 0x4c, 0xa9, 0x24, 0x13, 0x33]);
struct DVBSLocator
{
}
enum CLSID_DVBCLocator = GUID(0xc531d9fd, 0x9685, 0x4028, [0x8b, 0x68, 0x6e, 0x12, 0x32, 0x7, 0x9f, 0x1e]);
struct DVBCLocator
{
}
enum CLSID_ISDBSLocator = GUID(0x6504afed, 0xa629, 0x455c, [0xa7, 0xf1, 0x4, 0x96, 0x4d, 0xea, 0x5c, 0xc4]);
struct ISDBSLocator
{
}
enum CLSID_DVBTuneRequest = GUID(0x15d6504a, 0x5494, 0x499c, [0x88, 0x6c, 0x97, 0x3c, 0x9e, 0x53, 0xb9, 0xf1]);
struct DVBTuneRequest
{
}
enum CLSID_CreatePropBagOnRegKey = GUID(0x8a674b49, 0x1f63, 0x11d3, [0xb6, 0x4c, 0x0, 0xc0, 0x4f, 0x79, 0x49, 0x8e]);
struct CreatePropBagOnRegKey
{
}
enum CLSID_BroadcastEventService = GUID(0xb3ffb92, 0x919, 0x4934, [0x9d, 0x5b, 0x61, 0x9c, 0x71, 0x9d, 0x2, 0x2]);
struct BroadcastEventService
{
}
enum CLSID_TunerMarshaler = GUID(0x6438570b, 0xc08, 0x4a25, [0x95, 0x4, 0x80, 0x12, 0xbb, 0x4d, 0x50, 0xcf]);
struct TunerMarshaler
{
}
enum CLSID_PersistTuneXmlUtility = GUID(0xe77026b0, 0xb97f, 0x4cbb, [0xb7, 0xfb, 0xf4, 0xf0, 0x3a, 0xd6, 0x9f, 0x11]);
struct PersistTuneXmlUtility
{
}
enum CLSID_ESEventService = GUID(0xc20447fc, 0xec60, 0x475e, [0x81, 0x3f, 0xd2, 0xb0, 0xa6, 0xde, 0xce, 0xfe]);
struct ESEventService
{
}
enum CLSID_ESEventFactory = GUID(0x8e8a07da, 0x71f8, 0x40c1, [0xa9, 0x29, 0x5e, 0x3a, 0x86, 0x8a, 0xc2, 0xc6]);
struct ESEventFactory
{
}
alias EnTvRat_System = int;
enum : int
{
    MPAA                 = 0x00000000,
    US_TV                = 0x00000001,
    Canadian_English     = 0x00000002,
    Canadian_French      = 0x00000003,
    Reserved4            = 0x00000004,
    System5              = 0x00000005,
    System6              = 0x00000006,
    Reserved7            = 0x00000007,
    PBDA                 = 0x00000008,
    AgeBased             = 0x00000009,
    TvRat_kSystems       = 0x0000000a,
    TvRat_SystemDontKnow = 0x000000ff,
}

alias EnTvRat_GenericLevel = int;
enum : int
{
    TvRat_0             = 0x00000000,
    TvRat_1             = 0x00000001,
    TvRat_2             = 0x00000002,
    TvRat_3             = 0x00000003,
    TvRat_4             = 0x00000004,
    TvRat_5             = 0x00000005,
    TvRat_6             = 0x00000006,
    TvRat_7             = 0x00000007,
    TvRat_8             = 0x00000008,
    TvRat_9             = 0x00000009,
    TvRat_10            = 0x0000000a,
    TvRat_11            = 0x0000000b,
    TvRat_12            = 0x0000000c,
    TvRat_13            = 0x0000000d,
    TvRat_14            = 0x0000000e,
    TvRat_15            = 0x0000000f,
    TvRat_16            = 0x00000010,
    TvRat_17            = 0x00000011,
    TvRat_18            = 0x00000012,
    TvRat_19            = 0x00000013,
    TvRat_20            = 0x00000014,
    TvRat_21            = 0x00000015,
    TvRat_kLevels       = 0x00000016,
    TvRat_Unblock       = 0xffffffff,
    TvRat_LevelDontKnow = 0x000000ff,
}

alias EnTvRat_MPAA = int;
enum : int
{
    MPAA_NotApplicable = 0x00000000,
    MPAA_G             = 0x00000001,
    MPAA_PG            = 0x00000002,
    MPAA_PG13          = 0x00000003,
    MPAA_R             = 0x00000004,
    MPAA_NC17          = 0x00000005,
    MPAA_X             = 0x00000006,
    MPAA_NotRated      = 0x00000007,
}

alias EnTvRat_US_TV = int;
enum : int
{
    US_TV_None  = 0x00000000,
    US_TV_Y     = 0x00000001,
    US_TV_Y7    = 0x00000002,
    US_TV_G     = 0x00000003,
    US_TV_PG    = 0x00000004,
    US_TV_14    = 0x00000005,
    US_TV_MA    = 0x00000006,
    US_TV_None7 = 0x00000007,
}

alias EnTvRat_CAE_TV = int;
enum : int
{
    CAE_TV_Exempt   = 0x00000000,
    CAE_TV_C        = 0x00000001,
    CAE_TV_C8       = 0x00000002,
    CAE_TV_G        = 0x00000003,
    CAE_TV_PG       = 0x00000004,
    CAE_TV_14       = 0x00000005,
    CAE_TV_18       = 0x00000006,
    CAE_TV_Reserved = 0x00000007,
}

alias EnTvRat_CAF_TV = int;
enum : int
{
    CAF_TV_Exempt    = 0x00000000,
    CAF_TV_G         = 0x00000001,
    CAF_TV_8         = 0x00000002,
    CAF_TV_13        = 0x00000003,
    CAF_TV_16        = 0x00000004,
    CAF_TV_18        = 0x00000005,
    CAF_TV_Reserved6 = 0x00000006,
    CAF_TV_Reserved  = 0x00000007,
}

alias BfEnTvRat_GenericAttributes = int;
enum : int
{
    BfAttrNone         = 0x00000000,
    BfIsBlocked        = 0x00000001,
    BfIsAttr_1         = 0x00000002,
    BfIsAttr_2         = 0x00000004,
    BfIsAttr_3         = 0x00000008,
    BfIsAttr_4         = 0x00000010,
    BfIsAttr_5         = 0x00000020,
    BfIsAttr_6         = 0x00000040,
    BfIsAttr_7         = 0x00000080,
    BfValidAttrSubmask = 0x000000ff,
}

alias BfEnTvRat_Attributes_US_TV = int;
enum : int
{
    US_TV_IsBlocked                  = 0x00000001,
    US_TV_IsViolent                  = 0x00000002,
    US_TV_IsSexualSituation          = 0x00000004,
    US_TV_IsAdultLanguage            = 0x00000008,
    US_TV_IsSexuallySuggestiveDialog = 0x00000010,
    US_TV_ValidAttrSubmask           = 0x0000001f,
}

alias BfEnTvRat_Attributes_MPAA = int;
enum : int
{
    MPAA_IsBlocked        = 0x00000001,
    MPAA_ValidAttrSubmask = 0x00000001,
}

alias BfEnTvRat_Attributes_CAE_TV = int;
enum : int
{
    CAE_IsBlocked        = 0x00000001,
    CAE_ValidAttrSubmask = 0x00000001,
}

alias BfEnTvRat_Attributes_CAF_TV = int;
enum : int
{
    CAF_IsBlocked        = 0x00000001,
    CAF_ValidAttrSubmask = 0x00000001,
}

alias FormatNotSupportedEvents = int;
enum : int
{
    FORMATNOTSUPPORTED_CLEAR        = 0x00000000,
    FORMATNOTSUPPORTED_NOTSUPPORTED = 0x00000001,
}

struct WMDRMProtectionInfo
{
    align (1):
    ushort[25] wszKID;
    ulong qwCounter;
    ulong qwIndex;
    ubyte bOffset;
}
struct BadSampleInfo
{
    align (1):
    HRESULT hrReason;
}
alias ProtType = int;
enum : int
{
    PROT_COPY_FREE              = 0x00000001,
    PROT_COPY_ONCE              = 0x00000002,
    PROT_COPY_NEVER             = 0x00000003,
    PROT_COPY_NEVER_REALLY      = 0x00000004,
    PROT_COPY_NO_MORE           = 0x00000005,
    PROT_COPY_FREE_CIT          = 0x00000006,
    PROT_COPY_BF                = 0x00000007,
    PROT_COPY_CN_RECORDING_STOP = 0x00000008,
    PROT_COPY_FREE_SECURE       = 0x00000009,
    PROT_COPY_INVALID           = 0x00000032,
}

alias EncDecEvents = int;
enum : int
{
    ENCDEC_CPEVENT          = 0x00000000,
    ENCDEC_RECORDING_STATUS = 0x00000001,
}

alias CPRecordingStatus = int;
enum : int
{
    RECORDING_STOPPED = 0x00000000,
    RECORDING_STARTED = 0x00000001,
}

alias CPEventBitShift = int;
enum : int
{
    CPEVENT_BITSHIFT_RATINGS             = 0x00000000,
    CPEVENT_BITSHIFT_COPP                = 0x00000001,
    CPEVENT_BITSHIFT_LICENSE             = 0x00000002,
    CPEVENT_BITSHIFT_ROLLBACK            = 0x00000003,
    CPEVENT_BITSHIFT_SAC                 = 0x00000004,
    CPEVENT_BITSHIFT_DOWNRES             = 0x00000005,
    CPEVENT_BITSHIFT_STUBLIB             = 0x00000006,
    CPEVENT_BITSHIFT_UNTRUSTEDGRAPH      = 0x00000007,
    CPEVENT_BITSHIFT_PENDING_CERTIFICATE = 0x00000008,
    CPEVENT_BITSHIFT_NO_PLAYREADY        = 0x00000009,
}

alias CPEvents = int;
enum : int
{
    CPEVENT_NONE            = 0x00000000,
    CPEVENT_RATINGS         = 0x00000001,
    CPEVENT_COPP            = 0x00000002,
    CPEVENT_LICENSE         = 0x00000003,
    CPEVENT_ROLLBACK        = 0x00000004,
    CPEVENT_SAC             = 0x00000005,
    CPEVENT_DOWNRES         = 0x00000006,
    CPEVENT_STUBLIB         = 0x00000007,
    CPEVENT_UNTRUSTEDGRAPH  = 0x00000008,
    CPEVENT_PROTECTWINDOWED = 0x00000009,
}

alias RevokedComponent = int;
enum : int
{
    REVOKED_COPP            = 0x00000000,
    REVOKED_SAC             = 0x00000001,
    REVOKED_APP_STUB        = 0x00000002,
    REVOKED_SECURE_PIPELINE = 0x00000003,
    REVOKED_MAX_TYPES       = 0x00000004,
}

alias EnTag_Mode = int;
enum : int
{
    EnTag_Remove = 0x00000000,
    EnTag_Once   = 0x00000001,
    EnTag_Repeat = 0x00000002,
}

alias COPPEventBlockReason = int;
enum : int
{
    COPP_Unknown                 = 0xffffffff,
    COPP_BadDriver               = 0x00000000,
    COPP_NoCardHDCPSupport       = 0x00000001,
    COPP_NoMonitorHDCPSupport    = 0x00000002,
    COPP_BadCertificate          = 0x00000003,
    COPP_InvalidBusProtection    = 0x00000004,
    COPP_AeroGlassOff            = 0x00000005,
    COPP_RogueApp                = 0x00000006,
    COPP_ForbiddenVideo          = 0x00000007,
    COPP_Activate                = 0x00000008,
    COPP_DigitalAudioUnprotected = 0x00000009,
}

alias LicenseEventBlockReason = int;
enum : int
{
    LIC_BadLicense      = 0x00000000,
    LIC_NeedIndiv       = 0x00000001,
    LIC_Expired         = 0x00000002,
    LIC_NeedActivation  = 0x00000003,
    LIC_ExtenderBlocked = 0x00000004,
}

alias DownResEventParam = int;
enum : int
{
    DOWNRES_Always       = 0x00000000,
    DOWNRES_InWindowOnly = 0x00000001,
    DOWNRES_Undefined    = 0x00000002,
}

enum IID_IETFilterConfig = GUID(0xc4c4c4d1, 0x49, 0x4e2b, [0x98, 0xfb, 0x95, 0x37, 0xf6, 0xce, 0x51, 0x6d]);
interface IETFilterConfig : IUnknown
{
    HRESULT InitLicense(int);
    HRESULT GetSecureChannelObject(IUnknown*);
}
enum IID_IDTFilterConfig = GUID(0xc4c4c4d2, 0x49, 0x4e2b, [0x98, 0xfb, 0x95, 0x37, 0xf6, 0xce, 0x51, 0x6d]);
interface IDTFilterConfig : IUnknown
{
    HRESULT GetSecureChannelObject(IUnknown*);
}
enum IID_IXDSCodecConfig = GUID(0xc4c4c4d3, 0x49, 0x4e2b, [0x98, 0xfb, 0x95, 0x37, 0xf6, 0xce, 0x51, 0x6d]);
interface IXDSCodecConfig : IUnknown
{
    HRESULT GetSecureChannelObject(IUnknown*);
    HRESULT SetPauseBufferTime(uint);
}
enum IID_IDTFilterLicenseRenewal = GUID(0x8a78b317, 0xe405, 0x4a43, [0x99, 0x4a, 0x62, 0xd, 0x8f, 0x5c, 0xe2, 0x5e]);
interface IDTFilterLicenseRenewal : IUnknown
{
    HRESULT GetLicenseRenewalData(PWSTR*, PWSTR*, PWSTR*);
}
enum IID_IPTFilterLicenseRenewal = GUID(0x26d836a5, 0xc15, 0x44c7, [0xac, 0x59, 0xb0, 0xda, 0x87, 0x28, 0xf2, 0x40]);
interface IPTFilterLicenseRenewal : IUnknown
{
    HRESULT RenewLicenses(PWSTR, PWSTR, uint, BOOL);
    HRESULT CancelLicenseRenewal();
}
enum IID_IMceBurnerControl = GUID(0x5a86b91a, 0xe71e, 0x46c1, [0x88, 0xa9, 0x9b, 0xb3, 0x38, 0x71, 0x5, 0x52]);
interface IMceBurnerControl : IUnknown
{
    HRESULT GetBurnerNoDecryption();
}
enum IID_IETFilter = GUID(0xc4c4c4b1, 0x49, 0x4e2b, [0x98, 0xfb, 0x95, 0x37, 0xf6, 0xce, 0x51, 0x6d]);
interface IETFilter : IUnknown
{
    HRESULT get_EvalRatObjOK(HRESULT*);
    HRESULT GetCurrRating(EnTvRat_System*, EnTvRat_GenericLevel*, int*);
    HRESULT GetCurrLicenseExpDate(ProtType*, int*);
    HRESULT GetLastErrorCode();
    HRESULT SetRecordingOn(BOOL);
}
enum IID_IETFilterEvents = GUID(0xc4c4c4c1, 0x49, 0x4e2b, [0x98, 0xfb, 0x95, 0x37, 0xf6, 0xce, 0x51, 0x6d]);
interface IETFilterEvents : IDispatch
{
}
enum CLSID_ETFilter = GUID(0xc4c4c4f1, 0x49, 0x4e2b, [0x98, 0xfb, 0x95, 0x37, 0xf6, 0xce, 0x51, 0x6d]);
struct ETFilter
{
}
enum IID_IDTFilter = GUID(0xc4c4c4b2, 0x49, 0x4e2b, [0x98, 0xfb, 0x95, 0x37, 0xf6, 0xce, 0x51, 0x6d]);
interface IDTFilter : IUnknown
{
    HRESULT get_EvalRatObjOK(HRESULT*);
    HRESULT GetCurrRating(EnTvRat_System*, EnTvRat_GenericLevel*, int*);
    HRESULT get_BlockedRatingAttributes(EnTvRat_System, EnTvRat_GenericLevel, int*);
    HRESULT put_BlockedRatingAttributes(EnTvRat_System, EnTvRat_GenericLevel, int);
    HRESULT get_BlockUnRated(BOOL*);
    HRESULT put_BlockUnRated(BOOL);
    HRESULT get_BlockUnRatedDelay(int*);
    HRESULT put_BlockUnRatedDelay(int);
}
enum IID_IDTFilter2 = GUID(0xc4c4c4b4, 0x49, 0x4e2b, [0x98, 0xfb, 0x95, 0x37, 0xf6, 0xce, 0x51, 0x6d]);
interface IDTFilter2 : IDTFilter
{
    HRESULT get_ChallengeUrl(BSTR*);
    HRESULT GetCurrLicenseExpDate(ProtType*, int*);
    HRESULT GetLastErrorCode();
}
enum IID_IDTFilter3 = GUID(0x513998cc, 0xe929, 0x4cdf, [0x9f, 0xbd, 0xba, 0xd1, 0xe0, 0x31, 0x48, 0x66]);
interface IDTFilter3 : IDTFilter2
{
    HRESULT GetProtectionType(ProtType*);
    HRESULT LicenseHasExpirationDate(BOOL*);
    HRESULT SetRights(BSTR);
}
enum IID_IDTFilterEvents = GUID(0xc4c4c4c2, 0x49, 0x4e2b, [0x98, 0xfb, 0x95, 0x37, 0xf6, 0xce, 0x51, 0x6d]);
interface IDTFilterEvents : IDispatch
{
}
enum CLSID_DTFilter = GUID(0xc4c4c4f2, 0x49, 0x4e2b, [0x98, 0xfb, 0x95, 0x37, 0xf6, 0xce, 0x51, 0x6d]);
struct DTFilter
{
}
enum IID_IXDSCodec = GUID(0xc4c4c4b3, 0x49, 0x4e2b, [0x98, 0xfb, 0x95, 0x37, 0xf6, 0xce, 0x51, 0x6d]);
interface IXDSCodec : IUnknown
{
    HRESULT get_XDSToRatObjOK(HRESULT*);
    HRESULT put_CCSubstreamService(int);
    HRESULT get_CCSubstreamService(int*);
    HRESULT GetContentAdvisoryRating(int*, int*, int*, long*, long*);
    HRESULT GetXDSPacket(int*, int*, BSTR*, int*, int*, long*, long*);
    HRESULT GetCurrLicenseExpDate(ProtType*, int*);
    HRESULT GetLastErrorCode();
}
enum IID_IXDSCodecEvents = GUID(0xc4c4c4c3, 0x49, 0x4e2b, [0x98, 0xfb, 0x95, 0x37, 0xf6, 0xce, 0x51, 0x6d]);
interface IXDSCodecEvents : IDispatch
{
}
enum CLSID_XDSCodec = GUID(0xc4c4c4f3, 0x49, 0x4e2b, [0x98, 0xfb, 0x95, 0x37, 0xf6, 0xce, 0x51, 0x6d]);
struct XDSCodec
{
}
enum CLSID_CXDSData = GUID(0xc4c4c4f4, 0x49, 0x4e2b, [0x98, 0xfb, 0x95, 0x37, 0xf6, 0xce, 0x51, 0x6d]);
struct CXDSData
{
}
enum IID_IXDSToRat = GUID(0xc5c5c5b0, 0x3abc, 0x11d6, [0xb2, 0x5b, 0x0, 0xc0, 0x4f, 0xa0, 0xc0, 0x26]);
interface IXDSToRat : IDispatch
{
    HRESULT Init();
    HRESULT ParseXDSBytePair(ubyte, ubyte, EnTvRat_System*, EnTvRat_GenericLevel*, int*);
}
enum IID_IEvalRat = GUID(0xc5c5c5b1, 0x3abc, 0x11d6, [0xb2, 0x5b, 0x0, 0xc0, 0x4f, 0xa0, 0xc0, 0x26]);
interface IEvalRat : IDispatch
{
    HRESULT get_BlockedRatingAttributes(EnTvRat_System, EnTvRat_GenericLevel, int*);
    HRESULT put_BlockedRatingAttributes(EnTvRat_System, EnTvRat_GenericLevel, int);
    HRESULT get_BlockUnRated(BOOL*);
    HRESULT put_BlockUnRated(BOOL);
    HRESULT MostRestrictiveRating(EnTvRat_System, EnTvRat_GenericLevel, int, EnTvRat_System, EnTvRat_GenericLevel, int, EnTvRat_System*, EnTvRat_GenericLevel*, int*);
    HRESULT TestRating(EnTvRat_System, EnTvRat_GenericLevel, int);
}
enum CLSID_XDSToRat = GUID(0xc5c5c5f0, 0x3abc, 0x11d6, [0xb2, 0x5b, 0x0, 0xc0, 0x4f, 0xa0, 0xc0, 0x26]);
struct XDSToRat
{
}
enum CLSID_EvalRat = GUID(0xc5c5c5f1, 0x3abc, 0x11d6, [0xb2, 0x5b, 0x0, 0xc0, 0x4f, 0xa0, 0xc0, 0x26]);
struct EvalRat
{
}
alias SegDispidList = int;
enum : int
{
    dispidName                             = 0x00000000,
    dispidStatus                           = 0x00000001,
    dispidDevImageSourceWidth              = 0x00000002,
    dispidDevImageSourceHeight             = 0x00000003,
    dispidDevCountryCode                   = 0x00000004,
    dispidDevOverScan                      = 0x00000005,
    dispidSegment                          = 0x00000006,
    dispidDevVolume                        = 0x00000007,
    dispidDevBalance                       = 0x00000008,
    dispidDevPower                         = 0x00000009,
    dispidTuneChan                         = 0x0000000a,
    dispidDevVideoSubchannel               = 0x0000000b,
    dispidDevAudioSubchannel               = 0x0000000c,
    dispidChannelAvailable                 = 0x0000000d,
    dispidDevVideoFrequency                = 0x0000000e,
    dispidDevAudioFrequency                = 0x0000000f,
    dispidCount                            = 0x00000010,
    dispidDevFileName                      = 0x00000011,
    dispidVisible                          = 0x00000012,
    dispidOwner                            = 0x00000013,
    dispidMessageDrain                     = 0x00000014,
    dispidViewable                         = 0x00000015,
    dispidDevView                          = 0x00000016,
    dispidKSCat                            = 0x00000017,
    dispidCLSID                            = 0x00000018,
    dispid_KSCat                           = 0x00000019,
    dispid_CLSID                           = 0x0000001a,
    dispidTune                             = 0x0000001b,
    dispidTS                               = 0x0000001c,
    dispidDevSAP                           = 0x0000001d,
    dispidClip                             = 0x0000001e,
    dispidRequestedClipRect                = 0x0000001f,
    dispidClippedSourceRect                = 0x00000020,
    dispidAvailableSourceRect              = 0x00000021,
    dispidMediaPosition                    = 0x00000022,
    dispidDevRun                           = 0x00000023,
    dispidDevPause                         = 0x00000024,
    dispidDevStop                          = 0x00000025,
    dispidCCEnable                         = 0x00000026,
    dispidDevStep                          = 0x00000027,
    dispidDevCanStep                       = 0x00000028,
    dispidSourceSize                       = 0x00000029,
    dispid_playtitle                       = 0x0000002a,
    dispid_playchapterintitle              = 0x0000002b,
    dispid_playchapter                     = 0x0000002c,
    dispid_playchaptersautostop            = 0x0000002d,
    dispid_playattime                      = 0x0000002e,
    dispid_playattimeintitle               = 0x0000002f,
    dispid_playperiodintitleautostop       = 0x00000030,
    dispid_replaychapter                   = 0x00000031,
    dispid_playprevchapter                 = 0x00000032,
    dispid_playnextchapter                 = 0x00000033,
    dispid_playforwards                    = 0x00000034,
    dispid_playbackwards                   = 0x00000035,
    dispid_stilloff                        = 0x00000036,
    dispid_audiolanguage                   = 0x00000037,
    dispid_showmenu                        = 0x00000038,
    dispid_resume                          = 0x00000039,
    dispid_returnfromsubmenu               = 0x0000003a,
    dispid_buttonsavailable                = 0x0000003b,
    dispid_currentbutton                   = 0x0000003c,
    dispid_SelectAndActivateButton         = 0x0000003d,
    dispid_ActivateButton                  = 0x0000003e,
    dispid_SelectRightButton               = 0x0000003f,
    dispid_SelectLeftButton                = 0x00000040,
    dispid_SelectLowerButton               = 0x00000041,
    dispid_SelectUpperButton               = 0x00000042,
    dispid_ActivateAtPosition              = 0x00000043,
    dispid_SelectAtPosition                = 0x00000044,
    dispid_ButtonAtPosition                = 0x00000045,
    dispid_NumberOfChapters                = 0x00000046,
    dispid_TotalTitleTime                  = 0x00000047,
    dispid_TitlesAvailable                 = 0x00000048,
    dispid_VolumesAvailable                = 0x00000049,
    dispid_CurrentVolume                   = 0x0000004a,
    dispid_CurrentDiscSide                 = 0x0000004b,
    dispid_CurrentDomain                   = 0x0000004c,
    dispid_CurrentChapter                  = 0x0000004d,
    dispid_CurrentTitle                    = 0x0000004e,
    dispid_CurrentTime                     = 0x0000004f,
    dispid_FramesPerSecond                 = 0x00000050,
    dispid_DVDTimeCode2bstr                = 0x00000051,
    dispid_DVDDirectory                    = 0x00000052,
    dispid_IsSubpictureStreamEnabled       = 0x00000053,
    dispid_IsAudioStreamEnabled            = 0x00000054,
    dispid_CurrentSubpictureStream         = 0x00000055,
    dispid_SubpictureLanguage              = 0x00000056,
    dispid_CurrentAudioStream              = 0x00000057,
    dispid_AudioStreamsAvailable           = 0x00000058,
    dispid_AnglesAvailable                 = 0x00000059,
    dispid_CurrentAngle                    = 0x0000005a,
    dispid_CCActive                        = 0x0000005b,
    dispid_CurrentCCService                = 0x0000005c,
    dispid_SubpictureStreamsAvailable      = 0x0000005d,
    dispid_SubpictureOn                    = 0x0000005e,
    dispid_DVDUniqueID                     = 0x0000005f,
    dispid_EnableResetOnStop               = 0x00000060,
    dispid_AcceptParentalLevelChange       = 0x00000061,
    dispid_NotifyParentalLevelChange       = 0x00000062,
    dispid_SelectParentalCountry           = 0x00000063,
    dispid_SelectParentalLevel             = 0x00000064,
    dispid_TitleParentalLevels             = 0x00000065,
    dispid_PlayerParentalCountry           = 0x00000066,
    dispid_PlayerParentalLevel             = 0x00000067,
    dispid_Eject                           = 0x00000068,
    dispid_UOPValid                        = 0x00000069,
    dispid_SPRM                            = 0x0000006a,
    dispid_GPRM                            = 0x0000006b,
    dispid_DVDTextStringType               = 0x0000006c,
    dispid_DVDTextString                   = 0x0000006d,
    dispid_DVDTextNumberOfStrings          = 0x0000006e,
    dispid_DVDTextNumberOfLanguages        = 0x0000006f,
    dispid_DVDTextLanguageLCID             = 0x00000070,
    dispid_RegionChange                    = 0x00000071,
    dispid_DVDAdm                          = 0x00000072,
    dispid_DeleteBookmark                  = 0x00000073,
    dispid_RestoreBookmark                 = 0x00000074,
    dispid_SaveBookmark                    = 0x00000075,
    dispid_SelectDefaultAudioLanguage      = 0x00000076,
    dispid_SelectDefaultSubpictureLanguage = 0x00000077,
    dispid_PreferredSubpictureStream       = 0x00000078,
    dispid_DefaultMenuLanguage             = 0x00000079,
    dispid_DefaultSubpictureLanguage       = 0x0000007a,
    dispid_DefaultAudioLanguage            = 0x0000007b,
    dispid_DefaultSubpictureLanguageExt    = 0x0000007c,
    dispid_DefaultAudioLanguageExt         = 0x0000007d,
    dispid_LanguageFromLCID                = 0x0000007e,
    dispid_KaraokeAudioPresentationMode    = 0x0000007f,
    dispid_KaraokeChannelContent           = 0x00000080,
    dispid_KaraokeChannelAssignment        = 0x00000081,
    dispid_RestorePreferredSettings        = 0x00000082,
    dispid_ButtonRect                      = 0x00000083,
    dispid_DVDScreenInMouseCoordinates     = 0x00000084,
    dispid_CustomCompositorClass           = 0x00000085,
    dispidCustomCompositorClass            = 0x00000086,
    dispid_CustomCompositor                = 0x00000087,
    dispidMixerBitmap                      = 0x00000088,
    dispid_MixerBitmap                     = 0x00000089,
    dispidMixerBitmapOpacity               = 0x0000008a,
    dispidMixerBitmapRect                  = 0x0000008b,
    dispidSetupMixerBitmap                 = 0x0000008c,
    dispidUsingOverlay                     = 0x0000008d,
    dispidDisplayChange                    = 0x0000008e,
    dispidRePaint                          = 0x0000008f,
    dispid_IsEqualDevice                   = 0x00000090,
    dispidrate                             = 0x00000091,
    dispidposition                         = 0x00000092,
    dispidpositionmode                     = 0x00000093,
    dispidlength                           = 0x00000094,
    dispidChangePassword                   = 0x00000095,
    dispidSaveParentalLevel                = 0x00000096,
    dispidSaveParentalCountry              = 0x00000097,
    dispidConfirmPassword                  = 0x00000098,
    dispidGetParentalLevel                 = 0x00000099,
    dispidGetParentalCountry               = 0x0000009a,
    dispidDefaultAudioLCID                 = 0x0000009b,
    dispidDefaultSubpictureLCID            = 0x0000009c,
    dispidDefaultMenuLCID                  = 0x0000009d,
    dispidBookmarkOnStop                   = 0x0000009e,
    dispidMaxVidRect                       = 0x0000009f,
    dispidMinVidRect                       = 0x000000a0,
    dispidCapture                          = 0x000000a1,
    dispid_DecimateInput                   = 0x000000a2,
    dispidAlloctor                         = 0x000000a3,
    dispid_Allocator                       = 0x000000a4,
    dispidAllocPresentID                   = 0x000000a5,
    dispidSetAllocator                     = 0x000000a6,
    dispid_SetAllocator                    = 0x000000a7,
    dispidStreamBufferSinkName             = 0x000000a8,
    dispidStreamBufferSourceName           = 0x000000a9,
    dispidStreamBufferContentRecording     = 0x000000aa,
    dispidStreamBufferReferenceRecording   = 0x000000ab,
    dispidstarttime                        = 0x000000ac,
    dispidstoptime                         = 0x000000ad,
    dispidrecordingstopped                 = 0x000000ae,
    dispidrecordingstarted                 = 0x000000af,
    dispidNameSetLock                      = 0x000000b0,
    dispidrecordingtype                    = 0x000000b1,
    dispidstart                            = 0x000000b2,
    dispidRecordingAttribute               = 0x000000b3,
    dispid_RecordingAttribute              = 0x000000b4,
    dispidSBEConfigure                     = 0x000000b5,
    dispid_CurrentRatings                  = 0x000000b6,
    dispid_MaxRatingsLevel                 = 0x000000b7,
    dispid_audioencoderint                 = 0x000000b8,
    dispid_videoencoderint                 = 0x000000b9,
    dispidService                          = 0x000000ba,
    dispid_BlockUnrated                    = 0x000000bb,
    dispid_UnratedDelay                    = 0x000000bc,
    dispid_SuppressEffects                 = 0x000000bd,
    dispidsbesource                        = 0x000000be,
    dispidSetSinkFilter                    = 0x000000bf,
    dispid_SinkStreams                     = 0x000000c0,
    dispidTVFormats                        = 0x000000c1,
    dispidModes                            = 0x000000c2,
    dispidAuxInputs                        = 0x000000c3,
    dispidTeleTextFilter                   = 0x000000c4,
    dispid_channelchangeint                = 0x000000c5,
    dispidUnlockProfile                    = 0x000000c6,
    dispid_AddFilter                       = 0x000000c7,
    dispidSetMinSeek                       = 0x000000c8,
    dispidRateEx                           = 0x000000c9,
    dispidaudiocounter                     = 0x000000ca,
    dispidvideocounter                     = 0x000000cb,
    dispidcccounter                        = 0x000000cc,
    dispidwstcounter                       = 0x000000cd,
    dispid_audiocounter                    = 0x000000ce,
    dispid_videocounter                    = 0x000000cf,
    dispid_cccounter                       = 0x000000d0,
    dispid_wstcounter                      = 0x000000d1,
    dispidaudioanalysis                    = 0x000000d2,
    dispidvideoanalysis                    = 0x000000d3,
    dispiddataanalysis                     = 0x000000d4,
    dispidaudio_analysis                   = 0x000000d5,
    dispidvideo_analysis                   = 0x000000d6,
    dispiddata_analysis                    = 0x000000d7,
    dispid_resetFilterList                 = 0x000000d8,
    dispidDevicePath                       = 0x000000d9,
    dispid_SourceFilter                    = 0x000000da,
    dispid__SourceFilter                   = 0x000000db,
    dispidUserEvent                        = 0x000000dc,
    dispid_Bookmark                        = 0x000000dd,
    LastReservedDeviceDispid               = 0x00003fff,
}

alias SegEventidList = int;
enum : int
{
    eventidStateChange                   = 0x00000000,
    eventidOnTuneChanged                 = 0x00000001,
    eventidEndOfMedia                    = 0x00000002,
    eventidDVDNotify                     = 0x00000003,
    eventidPlayForwards                  = 0x00000004,
    eventidPlayBackwards                 = 0x00000005,
    eventidShowMenu                      = 0x00000006,
    eventidResume                        = 0x00000007,
    eventidSelectOrActivateButton        = 0x00000008,
    eventidStillOff                      = 0x00000009,
    eventidPauseOn                       = 0x0000000a,
    eventidChangeCurrentAudioStream      = 0x0000000b,
    eventidChangeCurrentSubpictureStream = 0x0000000c,
    eventidChangeCurrentAngle            = 0x0000000d,
    eventidPlayAtTimeInTitle             = 0x0000000e,
    eventidPlayAtTime                    = 0x0000000f,
    eventidPlayChapterInTitle            = 0x00000010,
    eventidPlayChapter                   = 0x00000011,
    eventidReplayChapter                 = 0x00000012,
    eventidPlayNextChapter               = 0x00000013,
    eventidStop                          = 0x00000014,
    eventidReturnFromSubmenu             = 0x00000015,
    eventidPlayTitle                     = 0x00000016,
    eventidPlayPrevChapter               = 0x00000017,
    eventidChangeKaraokePresMode         = 0x00000018,
    eventidChangeVideoPresMode           = 0x00000019,
    eventidOverlayUnavailable            = 0x0000001a,
    eventidSinkCertificateFailure        = 0x0000001b,
    eventidSinkCertificateSuccess        = 0x0000001c,
    eventidSourceCertificateFailure      = 0x0000001d,
    eventidSourceCertificateSuccess      = 0x0000001e,
    eventidRatingsBlocked                = 0x0000001f,
    eventidRatingsUnlocked               = 0x00000020,
    eventidRatingsChanged                = 0x00000021,
    eventidWriteFailure                  = 0x00000022,
    eventidTimeHole                      = 0x00000023,
    eventidStaleDataRead                 = 0x00000024,
    eventidContentBecomingStale          = 0x00000025,
    eventidStaleFileDeleted              = 0x00000026,
    eventidEncryptionOn                  = 0x00000027,
    eventidEncryptionOff                 = 0x00000028,
    eventidRateChange                    = 0x00000029,
    eventidLicenseChange                 = 0x0000002a,
    eventidCOPPBlocked                   = 0x0000002b,
    eventidCOPPUnblocked                 = 0x0000002c,
    dispidlicenseerrorcode               = 0x0000002d,
    eventidBroadcastEvent                = 0x0000002e,
    eventidBroadcastEventEx              = 0x0000002f,
    eventidContentPrimarilyAudio         = 0x00000030,
    dispidAVDecAudioDualMonoEvent        = 0x00000031,
    dispidAVAudioSampleRateEvent         = 0x00000032,
    dispidAVAudioChannelConfigEvent      = 0x00000033,
    dispidAVAudioChannelCountEvent       = 0x00000034,
    dispidAVDecCommonMeanBitRateEvent    = 0x00000035,
    dispidAVDDSurroundModeEvent          = 0x00000036,
    dispidAVDecCommonInputFormatEvent    = 0x00000037,
    dispidAVDecCommonOutputFormatEvent   = 0x00000038,
    eventidWriteFailureClear             = 0x00000039,
    LastReservedDeviceEvent              = 0x00003fff,
}

alias PositionModeList = int;
enum : int
{
    FrameMode         = 0x00000000,
    TenthsSecondsMode = 0x00000001,
}

alias RecordingType = int;
enum : int
{
    CONTENT   = 0x00000000,
    REFERENCE = 0x00000001,
}

alias MSVidCCService = int;
enum : int
{
    None     = 0x00000000,
    Caption1 = 0x00000001,
    Caption2 = 0x00000002,
    Text1    = 0x00000003,
    Text2    = 0x00000004,
    XDS      = 0x00000005,
}

alias MSVidSinkStreams = int;
enum : int
{
    MSVidSink_Video = 0x00000001,
    MSVidSink_Audio = 0x00000002,
    MSVidSink_Other = 0x00000004,
}

enum IID_IMSVidRect = GUID(0x7f5000a6, 0xa440, 0x47ca, [0x8a, 0xcc, 0xc0, 0xe7, 0x55, 0x31, 0xa2, 0xc2]);
interface IMSVidRect : IDispatch
{
    HRESULT get_Top(int*);
    HRESULT put_Top(int);
    HRESULT get_Left(int*);
    HRESULT put_Left(int);
    HRESULT get_Width(int*);
    HRESULT put_Width(int);
    HRESULT get_Height(int*);
    HRESULT put_Height(int);
    HRESULT get_HWnd(HWND*);
    HRESULT put_HWnd(HWND);
    HRESULT put_Rect(IMSVidRect);
}
enum IID_IMSVidGraphSegmentContainer = GUID(0x3dd2903d, 0xe0aa, 0x11d2, [0xb6, 0x3a, 0x0, 0xc0, 0x4f, 0x79, 0x49, 0x8e]);
interface IMSVidGraphSegmentContainer : IUnknown
{
    HRESULT get_Graph(IGraphBuilder*);
    HRESULT get_Input(IMSVidGraphSegment*);
    HRESULT get_Outputs(IEnumMSVidGraphSegment*);
    HRESULT get_VideoRenderer(IMSVidGraphSegment*);
    HRESULT get_AudioRenderer(IMSVidGraphSegment*);
    HRESULT get_Features(IEnumMSVidGraphSegment*);
    HRESULT get_Composites(IEnumMSVidGraphSegment*);
    HRESULT get_ParentContainer(IUnknown*);
    HRESULT Decompose(IMSVidGraphSegment);
    HRESULT IsWindowless();
    HRESULT GetFocus();
}
alias MSVidSegmentType = int;
enum : int
{
    MSVidSEG_SOURCE = 0x00000000,
    MSVidSEG_XFORM  = 0x00000001,
    MSVidSEG_DEST   = 0x00000002,
}

enum IID_IMSVidGraphSegment = GUID(0x238dec54, 0xadeb, 0x4005, [0xa3, 0x49, 0xf7, 0x72, 0xb9, 0xaf, 0xeb, 0xc4]);
interface IMSVidGraphSegment : IPersist
{
    HRESULT get_Init(IUnknown*);
    HRESULT put_Init(IUnknown);
    HRESULT EnumFilters(IEnumFilters*);
    HRESULT get_Container(IMSVidGraphSegmentContainer*);
    HRESULT put_Container(IMSVidGraphSegmentContainer);
    HRESULT get_Type(MSVidSegmentType*);
    HRESULT get_Category(GUID*);
    HRESULT Build();
    HRESULT PostBuild();
    HRESULT PreRun();
    HRESULT PostRun();
    HRESULT PreStop();
    HRESULT PostStop();
    HRESULT OnEventNotify(int, long, long);
    HRESULT Decompose();
}
alias MSVidCtlButtonstate = int;
enum : int
{
    MSVIDCTL_LEFT_BUTTON   = 0x00000001,
    MSVIDCTL_RIGHT_BUTTON  = 0x00000002,
    MSVIDCTL_MIDDLE_BUTTON = 0x00000004,
    MSVIDCTL_X_BUTTON1     = 0x00000008,
    MSVIDCTL_X_BUTTON2     = 0x00000010,
    MSVIDCTL_SHIFT         = 0x00000001,
    MSVIDCTL_CTRL          = 0x00000002,
    MSVIDCTL_ALT           = 0x00000004,
}

enum IID_IMSVidGraphSegmentUserInput = GUID(0x301c060e, 0x20d9, 0x4587, [0x9b, 0x3, 0xf8, 0x2e, 0xd9, 0xa9, 0x94, 0x3c]);
interface IMSVidGraphSegmentUserInput : IUnknown
{
    HRESULT Click();
    HRESULT DblClick();
    HRESULT KeyDown(short*, short);
    HRESULT KeyPress(short*);
    HRESULT KeyUp(short*, short);
    HRESULT MouseDown(short, short, int, int);
    HRESULT MouseMove(short, short, int, int);
    HRESULT MouseUp(short, short, int, int);
}
enum IID_IMSVidCompositionSegment = GUID(0x1c15d483, 0x911d, 0x11d2, [0xb6, 0x32, 0x0, 0xc0, 0x4f, 0x79, 0x49, 0x8e]);
interface IMSVidCompositionSegment : IMSVidGraphSegment
{
    HRESULT Compose(IMSVidGraphSegment, IMSVidGraphSegment);
    HRESULT get_Up(IMSVidGraphSegment*);
    HRESULT get_Down(IMSVidGraphSegment*);
}
enum IID_IEnumMSVidGraphSegment = GUID(0x3dd2903e, 0xe0aa, 0x11d2, [0xb6, 0x3a, 0x0, 0xc0, 0x4f, 0x79, 0x49, 0x8e]);
interface IEnumMSVidGraphSegment : IUnknown
{
    HRESULT Next(uint, IMSVidGraphSegment*, uint*);
    HRESULT Skip(uint);
    HRESULT Reset();
    HRESULT Clone(IEnumMSVidGraphSegment*);
}
enum IID_IMSVidVRGraphSegment = GUID(0xdd47de3f, 0x9874, 0x4f7b, [0x8b, 0x22, 0x7c, 0xb2, 0x68, 0x84, 0x61, 0xe7]);
interface IMSVidVRGraphSegment : IMSVidGraphSegment
{
    HRESULT put__VMRendererMode(int);
    HRESULT put_Owner(HWND);
    HRESULT get_Owner(HWND*);
    HRESULT get_UseOverlay(VARIANT_BOOL*);
    HRESULT put_UseOverlay(VARIANT_BOOL);
    HRESULT get_Visible(VARIANT_BOOL*);
    HRESULT put_Visible(VARIANT_BOOL);
    HRESULT get_ColorKey(uint*);
    HRESULT put_ColorKey(uint);
    HRESULT get_Source(RECT*);
    HRESULT put_Source(RECT);
    HRESULT get_Destination(RECT*);
    HRESULT put_Destination(RECT);
    HRESULT get_NativeSize(SIZE*, SIZE*);
    HRESULT get_BorderColor(uint*);
    HRESULT put_BorderColor(uint);
    HRESULT get_MaintainAspectRatio(VARIANT_BOOL*);
    HRESULT put_MaintainAspectRatio(VARIANT_BOOL);
    HRESULT Refresh();
    HRESULT DisplayChange();
    HRESULT RePaint(HDC);
}
enum IID_IMSVidDevice = GUID(0x1c15d47c, 0x911d, 0x11d2, [0xb6, 0x32, 0x0, 0xc0, 0x4f, 0x79, 0x49, 0x8e]);
interface IMSVidDevice : IDispatch
{
    HRESULT get_Name(BSTR*);
    HRESULT get_Status(int*);
    HRESULT put_Power(VARIANT_BOOL);
    HRESULT get_Power(VARIANT_BOOL*);
    HRESULT get_Category(BSTR*);
    HRESULT get_ClassID(BSTR*);
    HRESULT get__Category(GUID*);
    HRESULT get__ClassID(GUID*);
    HRESULT IsEqualDevice(IMSVidDevice, VARIANT_BOOL*);
}
enum IID_IMSVidDevice2 = GUID(0x87bd2783, 0xebc0, 0x478c, [0xb4, 0xa0, 0xe8, 0xe7, 0xf4, 0x3a, 0xb7, 0x8e]);
interface IMSVidDevice2 : IUnknown
{
    HRESULT get_DevicePath(BSTR*);
}
enum IID_IMSVidInputDevice = GUID(0x37b0353d, 0xa4c8, 0x11d2, [0xb6, 0x34, 0x0, 0xc0, 0x4f, 0x79, 0x49, 0x8e]);
interface IMSVidInputDevice : IMSVidDevice
{
    HRESULT IsViewable(VARIANT*, VARIANT_BOOL*);
    HRESULT View(VARIANT*);
}
enum IID_IMSVidDeviceEvent = GUID(0x1c15d480, 0x911d, 0x11d2, [0xb6, 0x32, 0x0, 0xc0, 0x4f, 0x79, 0x49, 0x8e]);
interface IMSVidDeviceEvent : IDispatch
{
    HRESULT StateChange(IMSVidDevice, int, int);
}
enum IID_IMSVidInputDeviceEvent = GUID(0x37b0353e, 0xa4c8, 0x11d2, [0xb6, 0x34, 0x0, 0xc0, 0x4f, 0x79, 0x49, 0x8e]);
interface IMSVidInputDeviceEvent : IDispatch
{
}
enum IID_IMSVidVideoInputDevice = GUID(0x1c15d47f, 0x911d, 0x11d2, [0xb6, 0x32, 0x0, 0xc0, 0x4f, 0x79, 0x49, 0x8e]);
interface IMSVidVideoInputDevice : IMSVidInputDevice
{
}
enum IID_IMSVidPlayback = GUID(0x37b03538, 0xa4c8, 0x11d2, [0xb6, 0x34, 0x0, 0xc0, 0x4f, 0x79, 0x49, 0x8e]);
interface IMSVidPlayback : IMSVidInputDevice
{
    HRESULT get_EnableResetOnStop(VARIANT_BOOL*);
    HRESULT put_EnableResetOnStop(VARIANT_BOOL);
    HRESULT Run();
    HRESULT Pause();
    HRESULT Stop();
    HRESULT get_CanStep(VARIANT_BOOL, VARIANT_BOOL*);
    HRESULT Step(int);
    HRESULT put_Rate(double);
    HRESULT get_Rate(double*);
    HRESULT put_CurrentPosition(int);
    HRESULT get_CurrentPosition(int*);
    HRESULT put_PositionMode(PositionModeList);
    HRESULT get_PositionMode(PositionModeList*);
    HRESULT get_Length(int*);
}
enum IID_IMSVidPlaybackEvent = GUID(0x37b0353b, 0xa4c8, 0x11d2, [0xb6, 0x34, 0x0, 0xc0, 0x4f, 0x79, 0x49, 0x8e]);
interface IMSVidPlaybackEvent : IMSVidInputDeviceEvent
{
    HRESULT EndOfMedia(IMSVidPlayback);
}
enum IID_IMSVidTuner = GUID(0x1c15d47d, 0x911d, 0x11d2, [0xb6, 0x32, 0x0, 0xc0, 0x4f, 0x79, 0x49, 0x8e]);
interface IMSVidTuner : IMSVidVideoInputDevice
{
    HRESULT get_Tune(ITuneRequest*);
    HRESULT put_Tune(ITuneRequest);
    HRESULT get_TuningSpace(ITuningSpace*);
    HRESULT put_TuningSpace(ITuningSpace);
}
enum IID_IMSVidTunerEvent = GUID(0x1c15d485, 0x911d, 0x11d2, [0xb6, 0x32, 0x0, 0xc0, 0x4f, 0x79, 0x49, 0x8e]);
interface IMSVidTunerEvent : IMSVidInputDeviceEvent
{
    HRESULT TuneChanged(IMSVidTuner);
}
enum IID_IMSVidAnalogTuner = GUID(0x1c15d47e, 0x911d, 0x11d2, [0xb6, 0x32, 0x0, 0xc0, 0x4f, 0x79, 0x49, 0x8e]);
interface IMSVidAnalogTuner : IMSVidTuner
{
    HRESULT get_Channel(int*);
    HRESULT put_Channel(int);
    HRESULT get_VideoFrequency(int*);
    HRESULT get_AudioFrequency(int*);
    HRESULT get_CountryCode(int*);
    HRESULT put_CountryCode(int);
    HRESULT get_SAP(VARIANT_BOOL*);
    HRESULT put_SAP(VARIANT_BOOL);
    HRESULT ChannelAvailable(int, int*, VARIANT_BOOL*);
}
enum IID_IMSVidAnalogTuner2 = GUID(0x37647bf7, 0x3dde, 0x4cc8, [0xa4, 0xdc, 0xd, 0x53, 0x4d, 0x3d, 0x0, 0x37]);
interface IMSVidAnalogTuner2 : IMSVidAnalogTuner
{
    HRESULT get_TVFormats(int*);
    HRESULT get_TunerModes(int*);
    HRESULT get_NumAuxInputs(int*);
}
enum IID_IMSVidAnalogTunerEvent = GUID(0x1c15d486, 0x911d, 0x11d2, [0xb6, 0x32, 0x0, 0xc0, 0x4f, 0x79, 0x49, 0x8e]);
interface IMSVidAnalogTunerEvent : IMSVidTunerEvent
{
}
enum IID_IMSVidFilePlayback = GUID(0x37b03539, 0xa4c8, 0x11d2, [0xb6, 0x34, 0x0, 0xc0, 0x4f, 0x79, 0x49, 0x8e]);
interface IMSVidFilePlayback : IMSVidPlayback
{
    HRESULT get_FileName(BSTR*);
    HRESULT put_FileName(BSTR);
}
enum IID_IMSVidFilePlayback2 = GUID(0x2f7e44af, 0x6e52, 0x4660, [0xbc, 0x8, 0xd8, 0xd5, 0x42, 0x58, 0x7d, 0x72]);
interface IMSVidFilePlayback2 : IMSVidFilePlayback
{
    HRESULT put__SourceFilter(BSTR);
    HRESULT put___SourceFilter(GUID);
}
enum IID_IMSVidFilePlaybackEvent = GUID(0x37b0353a, 0xa4c8, 0x11d2, [0xb6, 0x34, 0x0, 0xc0, 0x4f, 0x79, 0x49, 0x8e]);
interface IMSVidFilePlaybackEvent : IMSVidPlaybackEvent
{
}
alias DVDMenuIDConstants = int;
enum : int
{
    dvdMenu_Title      = 0x00000002,
    dvdMenu_Root       = 0x00000003,
    dvdMenu_Subpicture = 0x00000004,
    dvdMenu_Audio      = 0x00000005,
    dvdMenu_Angle      = 0x00000006,
    dvdMenu_Chapter    = 0x00000007,
}

alias DVDFilterState = int;
enum : int
{
    dvdState_Undefined   = 0xfffffffe,
    dvdState_Unitialized = 0xffffffff,
    dvdState_Stopped     = 0x00000000,
    dvdState_Paused      = 0x00000001,
    dvdState_Running     = 0x00000002,
}

alias DVDTextStringType = int;
enum : int
{
    dvdStruct_Volume      = 0x00000001,
    dvdStruct_Title       = 0x00000002,
    dvdStruct_ParentalID  = 0x00000003,
    dvdStruct_PartOfTitle = 0x00000004,
    dvdStruct_Cell        = 0x00000005,
    dvdStream_Audio       = 0x00000010,
    dvdStream_Subpicture  = 0x00000011,
    dvdStream_Angle       = 0x00000012,
    dvdChannel_Audio      = 0x00000020,
    dvdGeneral_Name       = 0x00000030,
    dvdGeneral_Comments   = 0x00000031,
    dvdTitle_Series       = 0x00000038,
    dvdTitle_Movie        = 0x00000039,
    dvdTitle_Video        = 0x0000003a,
    dvdTitle_Album        = 0x0000003b,
    dvdTitle_Song         = 0x0000003c,
    dvdTitle_Other        = 0x0000003f,
    dvdTitle_Sub_Series   = 0x00000040,
    dvdTitle_Sub_Movie    = 0x00000041,
    dvdTitle_Sub_Video    = 0x00000042,
    dvdTitle_Sub_Album    = 0x00000043,
    dvdTitle_Sub_Song     = 0x00000044,
    dvdTitle_Sub_Other    = 0x00000047,
    dvdTitle_Orig_Series  = 0x00000048,
    dvdTitle_Orig_Movie   = 0x00000049,
    dvdTitle_Orig_Video   = 0x0000004a,
    dvdTitle_Orig_Album   = 0x0000004b,
    dvdTitle_Orig_Song    = 0x0000004c,
    dvdTitle_Orig_Other   = 0x0000004f,
    dvdOther_Scene        = 0x00000050,
    dvdOther_Cut          = 0x00000051,
    dvdOther_Take         = 0x00000052,
}

alias DVDSPExt = int;
enum : int
{
    dvdSPExt_NotSpecified              = 0x00000000,
    dvdSPExt_Caption_Normal            = 0x00000001,
    dvdSPExt_Caption_Big               = 0x00000002,
    dvdSPExt_Caption_Children          = 0x00000003,
    dvdSPExt_CC_Normal                 = 0x00000005,
    dvdSPExt_CC_Big                    = 0x00000006,
    dvdSPExt_CC_Children               = 0x00000007,
    dvdSPExt_Forced                    = 0x00000009,
    dvdSPExt_DirectorComments_Normal   = 0x0000000d,
    dvdSPExt_DirectorComments_Big      = 0x0000000e,
    dvdSPExt_DirectorComments_Children = 0x0000000f,
}

enum IID_IMSVidWebDVD = GUID(0xcf45f88b, 0xac56, 0x4ee2, [0xa7, 0x3a, 0xed, 0x4, 0xe2, 0x88, 0x5d, 0x3c]);
interface IMSVidWebDVD : IMSVidPlayback
{
    HRESULT OnDVDEvent(int, long, long);
    HRESULT PlayTitle(int);
    HRESULT PlayChapterInTitle(int, int);
    HRESULT PlayChapter(int);
    HRESULT PlayChaptersAutoStop(int, int, int);
    HRESULT PlayAtTime(BSTR);
    HRESULT PlayAtTimeInTitle(int, BSTR);
    HRESULT PlayPeriodInTitleAutoStop(int, BSTR, BSTR);
    HRESULT ReplayChapter();
    HRESULT PlayPrevChapter();
    HRESULT PlayNextChapter();
    HRESULT StillOff();
    HRESULT get_AudioLanguage(int, VARIANT_BOOL, BSTR*);
    HRESULT ShowMenu(DVDMenuIDConstants);
    HRESULT Resume();
    HRESULT ReturnFromSubmenu();
    HRESULT get_ButtonsAvailable(int*);
    HRESULT get_CurrentButton(int*);
    HRESULT SelectAndActivateButton(int);
    HRESULT ActivateButton();
    HRESULT SelectRightButton();
    HRESULT SelectLeftButton();
    HRESULT SelectLowerButton();
    HRESULT SelectUpperButton();
    HRESULT ActivateAtPosition(int, int);
    HRESULT SelectAtPosition(int, int);
    HRESULT get_ButtonAtPosition(int, int, int*);
    HRESULT get_NumberOfChapters(int, int*);
    HRESULT get_TotalTitleTime(BSTR*);
    HRESULT get_TitlesAvailable(int*);
    HRESULT get_VolumesAvailable(int*);
    HRESULT get_CurrentVolume(int*);
    HRESULT get_CurrentDiscSide(int*);
    HRESULT get_CurrentDomain(int*);
    HRESULT get_CurrentChapter(int*);
    HRESULT get_CurrentTitle(int*);
    HRESULT get_CurrentTime(BSTR*);
    HRESULT DVDTimeCode2bstr(int, BSTR*);
    HRESULT get_DVDDirectory(BSTR*);
    HRESULT put_DVDDirectory(BSTR);
    HRESULT IsSubpictureStreamEnabled(int, VARIANT_BOOL*);
    HRESULT IsAudioStreamEnabled(int, VARIANT_BOOL*);
    HRESULT get_CurrentSubpictureStream(int*);
    HRESULT put_CurrentSubpictureStream(int);
    HRESULT get_SubpictureLanguage(int, BSTR*);
    HRESULT get_CurrentAudioStream(int*);
    HRESULT put_CurrentAudioStream(int);
    HRESULT get_AudioStreamsAvailable(int*);
    HRESULT get_AnglesAvailable(int*);
    HRESULT get_CurrentAngle(int*);
    HRESULT put_CurrentAngle(int);
    HRESULT get_SubpictureStreamsAvailable(int*);
    HRESULT get_SubpictureOn(VARIANT_BOOL*);
    HRESULT put_SubpictureOn(VARIANT_BOOL);
    HRESULT get_DVDUniqueID(BSTR*);
    HRESULT AcceptParentalLevelChange(VARIANT_BOOL, BSTR, BSTR);
    HRESULT NotifyParentalLevelChange(VARIANT_BOOL);
    HRESULT SelectParentalCountry(int, BSTR, BSTR);
    HRESULT SelectParentalLevel(int, BSTR, BSTR);
    HRESULT get_TitleParentalLevels(int, int*);
    HRESULT get_PlayerParentalCountry(int*);
    HRESULT get_PlayerParentalLevel(int*);
    HRESULT Eject();
    HRESULT UOPValid(int, VARIANT_BOOL*);
    HRESULT get_SPRM(int, short*);
    HRESULT get_GPRM(int, short*);
    HRESULT put_GPRM(int, short);
    HRESULT get_DVDTextStringType(int, int, DVDTextStringType*);
    HRESULT get_DVDTextString(int, int, BSTR*);
    HRESULT get_DVDTextNumberOfStrings(int, int*);
    HRESULT get_DVDTextNumberOfLanguages(int*);
    HRESULT get_DVDTextLanguageLCID(int, int*);
    HRESULT RegionChange();
    HRESULT get_DVDAdm(IDispatch*);
    HRESULT DeleteBookmark();
    HRESULT RestoreBookmark();
    HRESULT SaveBookmark();
    HRESULT SelectDefaultAudioLanguage(int, int);
    HRESULT SelectDefaultSubpictureLanguage(int, DVDSPExt);
    HRESULT get_PreferredSubpictureStream(int*);
    HRESULT get_DefaultMenuLanguage(int*);
    HRESULT put_DefaultMenuLanguage(int);
    HRESULT get_DefaultSubpictureLanguage(int*);
    HRESULT get_DefaultAudioLanguage(int*);
    HRESULT get_DefaultSubpictureLanguageExt(DVDSPExt*);
    HRESULT get_DefaultAudioLanguageExt(int*);
    HRESULT get_LanguageFromLCID(int, BSTR*);
    HRESULT get_KaraokeAudioPresentationMode(int*);
    HRESULT put_KaraokeAudioPresentationMode(int);
    HRESULT get_KaraokeChannelContent(int, int, int*);
    HRESULT get_KaraokeChannelAssignment(int, int*);
    HRESULT RestorePreferredSettings();
    HRESULT get_ButtonRect(int, IMSVidRect*);
    HRESULT get_DVDScreenInMouseCoordinates(IMSVidRect*);
    HRESULT put_DVDScreenInMouseCoordinates(IMSVidRect);
}
enum IID_IMSVidWebDVD2 = GUID(0x7027212f, 0xee9a, 0x4a7c, [0x8b, 0x67, 0xf0, 0x23, 0x71, 0x4c, 0xda, 0xff]);
interface IMSVidWebDVD2 : IMSVidWebDVD
{
    HRESULT get_Bookmark(ubyte**, uint*);
    HRESULT put_Bookmark(ubyte*, uint);
}
enum IID_IMSVidWebDVDEvent = GUID(0xb4f7a674, 0x9b83, 0x49cb, [0xa3, 0x57, 0xc6, 0x3b, 0x87, 0x1b, 0xe9, 0x58]);
interface IMSVidWebDVDEvent : IMSVidPlaybackEvent
{
    HRESULT DVDNotify(int, VARIANT, VARIANT);
    HRESULT PlayForwards(VARIANT_BOOL);
    HRESULT PlayBackwards(VARIANT_BOOL);
    HRESULT ShowMenu(DVDMenuIDConstants, VARIANT_BOOL);
    HRESULT Resume(VARIANT_BOOL);
    HRESULT SelectOrActivateButton(VARIANT_BOOL);
    HRESULT StillOff(VARIANT_BOOL);
    HRESULT PauseOn(VARIANT_BOOL);
    HRESULT ChangeCurrentAudioStream(VARIANT_BOOL);
    HRESULT ChangeCurrentSubpictureStream(VARIANT_BOOL);
    HRESULT ChangeCurrentAngle(VARIANT_BOOL);
    HRESULT PlayAtTimeInTitle(VARIANT_BOOL);
    HRESULT PlayAtTime(VARIANT_BOOL);
    HRESULT PlayChapterInTitle(VARIANT_BOOL);
    HRESULT PlayChapter(VARIANT_BOOL);
    HRESULT ReplayChapter(VARIANT_BOOL);
    HRESULT PlayNextChapter(VARIANT_BOOL);
    HRESULT Stop(VARIANT_BOOL);
    HRESULT ReturnFromSubmenu(VARIANT_BOOL);
    HRESULT PlayTitle(VARIANT_BOOL);
    HRESULT PlayPrevChapter(VARIANT_BOOL);
    HRESULT ChangeKaraokePresMode(VARIANT_BOOL);
    HRESULT ChangeVideoPresMode(VARIANT_BOOL);
}
enum IID_IMSVidWebDVDAdm = GUID(0xb8be681a, 0xeb2c, 0x47f0, [0xb4, 0x15, 0x94, 0xd5, 0x45, 0x2f, 0xe, 0x5]);
interface IMSVidWebDVDAdm : IDispatch
{
    HRESULT ChangePassword(BSTR, BSTR, BSTR);
    HRESULT SaveParentalLevel(int, BSTR, BSTR);
    HRESULT SaveParentalCountry(int, BSTR, BSTR);
    HRESULT ConfirmPassword(BSTR, BSTR, VARIANT_BOOL*);
    HRESULT GetParentalLevel(int*);
    HRESULT GetParentalCountry(int*);
    HRESULT get_DefaultAudioLCID(int*);
    HRESULT put_DefaultAudioLCID(int);
    HRESULT get_DefaultSubpictureLCID(int*);
    HRESULT put_DefaultSubpictureLCID(int);
    HRESULT get_DefaultMenuLCID(int*);
    HRESULT put_DefaultMenuLCID(int);
    HRESULT get_BookmarkOnStop(VARIANT_BOOL*);
    HRESULT put_BookmarkOnStop(VARIANT_BOOL);
}
enum IID_IMSVidOutputDevice = GUID(0x37b03546, 0xa4c8, 0x11d2, [0xb6, 0x34, 0x0, 0xc0, 0x4f, 0x79, 0x49, 0x8e]);
interface IMSVidOutputDevice : IMSVidDevice
{
}
enum IID_IMSVidOutputDeviceEvent = GUID(0x2e6a14e2, 0x571c, 0x11d3, [0xb6, 0x52, 0x0, 0xc0, 0x4f, 0x79, 0x49, 0x8e]);
interface IMSVidOutputDeviceEvent : IMSVidDeviceEvent
{
}
enum IID_IMSVidFeature = GUID(0x37b03547, 0xa4c8, 0x11d2, [0xb6, 0x34, 0x0, 0xc0, 0x4f, 0x79, 0x49, 0x8e]);
interface IMSVidFeature : IMSVidDevice
{
}
enum IID_IMSVidFeatureEvent = GUID(0x3dd2903c, 0xe0aa, 0x11d2, [0xb6, 0x3a, 0x0, 0xc0, 0x4f, 0x79, 0x49, 0x8e]);
interface IMSVidFeatureEvent : IMSVidDeviceEvent
{
}
enum IID_IMSVidEncoder = GUID(0xc0020fd4, 0xbee7, 0x43d9, [0xa4, 0x95, 0x9f, 0x21, 0x31, 0x17, 0x10, 0x3d]);
interface IMSVidEncoder : IMSVidFeature
{
    HRESULT get_VideoEncoderInterface(IUnknown*);
    HRESULT get_AudioEncoderInterface(IUnknown*);
}
enum IID_IMSVidClosedCaptioning = GUID(0x99652ea1, 0xc1f7, 0x414f, [0xbb, 0x7b, 0x1c, 0x96, 0x7d, 0xe7, 0x59, 0x83]);
interface IMSVidClosedCaptioning : IMSVidFeature
{
    HRESULT get_Enable(VARIANT_BOOL*);
    HRESULT put_Enable(VARIANT_BOOL);
}
enum IID_IMSVidClosedCaptioning2 = GUID(0xe00cb864, 0xa029, 0x4310, [0x99, 0x87, 0xa8, 0x73, 0xf5, 0x88, 0x7d, 0x97]);
interface IMSVidClosedCaptioning2 : IMSVidClosedCaptioning
{
    HRESULT get_Service(MSVidCCService*);
    HRESULT put_Service(MSVidCCService);
}
enum IID_IMSVidClosedCaptioning3 = GUID(0xc8638e8a, 0x7625, 0x4c51, [0x93, 0x66, 0x2f, 0x40, 0xa9, 0x83, 0x1f, 0xc0]);
interface IMSVidClosedCaptioning3 : IMSVidClosedCaptioning2
{
    HRESULT get_TeleTextFilter(IUnknown*);
}
enum IID_IMSVidXDS = GUID(0x11ebc158, 0xe712, 0x4d1f, [0x8b, 0xb3, 0x1, 0xed, 0x52, 0x74, 0xc4, 0xce]);
interface IMSVidXDS : IMSVidFeature
{
    HRESULT get_ChannelChangeInterface(IUnknown*);
}
enum IID_IMSVidXDSEvent = GUID(0x6db2317d, 0x3b23, 0x41ec, [0xba, 0x4b, 0x70, 0x1f, 0x40, 0x7e, 0xaf, 0x3a]);
interface IMSVidXDSEvent : IMSVidFeatureEvent
{
    HRESULT RatingChange(EnTvRat_System, EnTvRat_GenericLevel, BfEnTvRat_GenericAttributes, EnTvRat_System, EnTvRat_GenericLevel, BfEnTvRat_GenericAttributes);
}
enum IID_IMSVidDataServices = GUID(0x334125c1, 0x77e5, 0x11d3, [0xb6, 0x53, 0x0, 0xc0, 0x4f, 0x79, 0x49, 0x8e]);
interface IMSVidDataServices : IMSVidFeature
{
}
enum IID_IMSVidDataServicesEvent = GUID(0x334125c2, 0x77e5, 0x11d3, [0xb6, 0x53, 0x0, 0xc0, 0x4f, 0x79, 0x49, 0x8e]);
interface IMSVidDataServicesEvent : IMSVidDeviceEvent
{
}
alias SourceSizeList = int;
enum : int
{
    sslFullSize       = 0x00000000,
    sslClipByOverScan = 0x00000001,
    sslClipByClipRect = 0x00000002,
}

enum IID_IMSVidVideoRenderer = GUID(0x37b03540, 0xa4c8, 0x11d2, [0xb6, 0x34, 0x0, 0xc0, 0x4f, 0x79, 0x49, 0x8e]);
interface IMSVidVideoRenderer : IMSVidOutputDevice
{
    HRESULT get_CustomCompositorClass(BSTR*);
    HRESULT put_CustomCompositorClass(BSTR);
    HRESULT get__CustomCompositorClass(GUID*);
    HRESULT put__CustomCompositorClass(const(GUID)*);
    HRESULT get__CustomCompositor(IVMRImageCompositor*);
    HRESULT put__CustomCompositor(IVMRImageCompositor);
    HRESULT get_MixerBitmap(IPictureDisp*);
    HRESULT get__MixerBitmap(IVMRMixerBitmap*);
    HRESULT put_MixerBitmap(IPictureDisp);
    HRESULT put__MixerBitmap(VMRALPHABITMAP*);
    HRESULT get_MixerBitmapPositionRect(IMSVidRect*);
    HRESULT put_MixerBitmapPositionRect(IMSVidRect);
    HRESULT get_MixerBitmapOpacity(int*);
    HRESULT put_MixerBitmapOpacity(int);
    HRESULT SetupMixerBitmap(IPictureDisp, int, IMSVidRect);
    HRESULT get_SourceSize(SourceSizeList*);
    HRESULT put_SourceSize(SourceSizeList);
    HRESULT get_OverScan(int*);
    HRESULT put_OverScan(int);
    HRESULT get_AvailableSourceRect(IMSVidRect*);
    HRESULT get_MaxVidRect(IMSVidRect*);
    HRESULT get_MinVidRect(IMSVidRect*);
    HRESULT get_ClippedSourceRect(IMSVidRect*);
    HRESULT put_ClippedSourceRect(IMSVidRect);
    HRESULT get_UsingOverlay(VARIANT_BOOL*);
    HRESULT put_UsingOverlay(VARIANT_BOOL);
    HRESULT Capture(IPictureDisp*);
    HRESULT get_FramesPerSecond(int*);
    HRESULT get_DecimateInput(VARIANT_BOOL*);
    HRESULT put_DecimateInput(VARIANT_BOOL);
}
enum IID_IMSVidVideoRendererEvent = GUID(0x37b03545, 0xa4c8, 0x11d2, [0xb6, 0x34, 0x0, 0xc0, 0x4f, 0x79, 0x49, 0x8e]);
interface IMSVidVideoRendererEvent : IMSVidOutputDeviceEvent
{
    HRESULT OverlayUnavailable();
}
enum IID_IMSVidGenericSink = GUID(0x6c29b41d, 0x455b, 0x4c33, [0x96, 0x3a, 0xd, 0x28, 0xe5, 0xe5, 0x55, 0xea]);
interface IMSVidGenericSink : IMSVidOutputDevice
{
    HRESULT SetSinkFilter(BSTR);
    HRESULT get_SinkStreams(MSVidSinkStreams*);
    HRESULT put_SinkStreams(MSVidSinkStreams);
}
enum IID_IMSVidGenericSink2 = GUID(0x6b5a28f3, 0x47f1, 0x4092, [0xb1, 0x68, 0x60, 0xca, 0xbe, 0xc0, 0x8f, 0x1c]);
interface IMSVidGenericSink2 : IMSVidGenericSink
{
    HRESULT AddFilter(BSTR);
    HRESULT ResetFilterList();
}
enum IID_IMSVidStreamBufferRecordingControl = GUID(0x160621aa, 0xbbbc, 0x4326, [0xa8, 0x24, 0xc3, 0x95, 0xae, 0xbc, 0x6e, 0x74]);
interface IMSVidStreamBufferRecordingControl : IDispatch
{
    HRESULT get_StartTime(int*);
    HRESULT put_StartTime(int);
    HRESULT get_StopTime(int*);
    HRESULT put_StopTime(int);
    HRESULT get_RecordingStopped(VARIANT_BOOL*);
    HRESULT get_RecordingStarted(VARIANT_BOOL*);
    HRESULT get_RecordingType(RecordingType*);
    HRESULT get_RecordingAttribute(IUnknown*);
}
enum IID_IMSVidStreamBufferSink = GUID(0x159dbb45, 0xcd1b, 0x4dab, [0x83, 0xea, 0x5c, 0xb1, 0xf4, 0xf2, 0x1d, 0x7]);
interface IMSVidStreamBufferSink : IMSVidOutputDevice
{
    HRESULT get_ContentRecorder(BSTR, IMSVidStreamBufferRecordingControl*);
    HRESULT get_ReferenceRecorder(BSTR, IMSVidStreamBufferRecordingControl*);
    HRESULT get_SinkName(BSTR*);
    HRESULT put_SinkName(BSTR);
    HRESULT NameSetLock();
    HRESULT get_SBESink(IUnknown*);
}
enum IID_IMSVidStreamBufferSink2 = GUID(0x2ca9fc63, 0xc131, 0x4e5a, [0x95, 0x5a, 0x54, 0x4a, 0x47, 0xc6, 0x71, 0x46]);
interface IMSVidStreamBufferSink2 : IMSVidStreamBufferSink
{
    HRESULT UnlockProfile();
}
enum IID_IMSVidStreamBufferSink3 = GUID(0x4f8721d7, 0x7d59, 0x4d8b, [0x99, 0xf5, 0xa7, 0x77, 0x75, 0x58, 0x6b, 0xd5]);
interface IMSVidStreamBufferSink3 : IMSVidStreamBufferSink2
{
    HRESULT SetMinSeek(int*);
    HRESULT get_AudioCounter(IUnknown*);
    HRESULT get_VideoCounter(IUnknown*);
    HRESULT get_CCCounter(IUnknown*);
    HRESULT get_WSTCounter(IUnknown*);
    HRESULT put_AudioAnalysisFilter(BSTR);
    HRESULT get_AudioAnalysisFilter(BSTR*);
    HRESULT put__AudioAnalysisFilter(GUID);
    HRESULT get__AudioAnalysisFilter(GUID*);
    HRESULT put_VideoAnalysisFilter(BSTR);
    HRESULT get_VideoAnalysisFilter(BSTR*);
    HRESULT put__VideoAnalysisFilter(GUID);
    HRESULT get__VideoAnalysisFilter(GUID*);
    HRESULT put_DataAnalysisFilter(BSTR);
    HRESULT get_DataAnalysisFilter(BSTR*);
    HRESULT put__DataAnalysisFilter(GUID);
    HRESULT get__DataAnalysisFilter(GUID*);
    HRESULT get_LicenseErrorCode(HRESULT*);
}
enum IID_IMSVidStreamBufferSinkEvent = GUID(0xf798a36b, 0xb05b, 0x4bbe, [0x97, 0x3, 0xea, 0xea, 0x7d, 0x61, 0xcd, 0x51]);
interface IMSVidStreamBufferSinkEvent : IMSVidOutputDeviceEvent
{
    HRESULT CertificateFailure();
    HRESULT CertificateSuccess();
    HRESULT WriteFailure();
}
enum IID_IMSVidStreamBufferSinkEvent2 = GUID(0x3d7a5166, 0x72d7, 0x484b, [0xa0, 0x6f, 0x28, 0x61, 0x87, 0xb8, 0xc, 0xa1]);
interface IMSVidStreamBufferSinkEvent2 : IMSVidStreamBufferSinkEvent
{
    HRESULT EncryptionOn();
    HRESULT EncryptionOff();
}
enum IID_IMSVidStreamBufferSinkEvent3 = GUID(0x735ad8d5, 0xc259, 0x48e9, [0x81, 0xe7, 0xd2, 0x79, 0x53, 0x66, 0x5b, 0x23]);
interface IMSVidStreamBufferSinkEvent3 : IMSVidStreamBufferSinkEvent2
{
    HRESULT LicenseChange(int);
}
enum IID_IMSVidStreamBufferSinkEvent4 = GUID(0x1b01dcb0, 0xdaf0, 0x412c, [0xa5, 0xd1, 0x59, 0xc, 0x7f, 0x62, 0xe2, 0xb8]);
interface IMSVidStreamBufferSinkEvent4 : IMSVidStreamBufferSinkEvent3
{
    HRESULT WriteFailureClear();
}
enum IID_IMSVidStreamBufferSource = GUID(0xeb0c8cf9, 0x6950, 0x4772, [0x87, 0xb1, 0x47, 0xd1, 0x1c, 0xf3, 0xa0, 0x2f]);
interface IMSVidStreamBufferSource : IMSVidFilePlayback
{
    HRESULT get_Start(int*);
    HRESULT get_RecordingAttribute(IUnknown*);
    HRESULT CurrentRatings(EnTvRat_System*, EnTvRat_GenericLevel*, int*);
    HRESULT MaxRatingsLevel(EnTvRat_System, EnTvRat_GenericLevel, int);
    HRESULT put_BlockUnrated(VARIANT_BOOL);
    HRESULT put_UnratedDelay(int);
    HRESULT get_SBESource(IUnknown*);
}
enum IID_IMSVidStreamBufferSource2 = GUID(0xe4ba9059, 0xb1ce, 0x40d8, [0xb9, 0xa0, 0xd4, 0xea, 0x4a, 0x99, 0x89, 0xd3]);
interface IMSVidStreamBufferSource2 : IMSVidStreamBufferSource
{
    HRESULT put_RateEx(double, uint);
    HRESULT get_AudioCounter(IUnknown*);
    HRESULT get_VideoCounter(IUnknown*);
    HRESULT get_CCCounter(IUnknown*);
    HRESULT get_WSTCounter(IUnknown*);
}
enum IID_IMSVidStreamBufferSourceEvent = GUID(0x50ce8a7d, 0x9c28, 0x4da8, [0x90, 0x42, 0xcd, 0xfa, 0x71, 0x16, 0xf9, 0x79]);
interface IMSVidStreamBufferSourceEvent : IMSVidFilePlaybackEvent
{
    HRESULT CertificateFailure();
    HRESULT CertificateSuccess();
    HRESULT RatingsBlocked();
    HRESULT RatingsUnblocked();
    HRESULT RatingsChanged();
    HRESULT TimeHole(int, int);
    HRESULT StaleDataRead();
    HRESULT ContentBecomingStale();
    HRESULT StaleFileDeleted();
}
enum IID_IMSVidStreamBufferSourceEvent2 = GUID(0x7aef50ce, 0x8e22, 0x4ba8, [0xbc, 0x6, 0xa9, 0x2a, 0x45, 0x8b, 0x4e, 0xf2]);
interface IMSVidStreamBufferSourceEvent2 : IMSVidStreamBufferSourceEvent
{
    HRESULT RateChange(double, double);
}
enum IID_IMSVidStreamBufferSourceEvent3 = GUID(0xceabd6ab, 0x9b90, 0x4570, [0xad, 0xf1, 0x3c, 0xe7, 0x6e, 0x0, 0xa7, 0x63]);
interface IMSVidStreamBufferSourceEvent3 : IMSVidStreamBufferSourceEvent2
{
    HRESULT BroadcastEvent(BSTR);
    HRESULT BroadcastEventEx(BSTR, uint, uint, uint, uint);
    HRESULT COPPBlocked();
    HRESULT COPPUnblocked();
    HRESULT ContentPrimarilyAudio();
}
enum IID_IMSVidStreamBufferV2SourceEvent = GUID(0x49c771f9, 0x41b2, 0x4cf7, [0x9f, 0x9a, 0xa3, 0x13, 0xa8, 0xf6, 0x2, 0x7e]);
interface IMSVidStreamBufferV2SourceEvent : IMSVidFilePlaybackEvent
{
    HRESULT RatingsChanged();
    HRESULT TimeHole(int, int);
    HRESULT StaleDataRead();
    HRESULT ContentBecomingStale();
    HRESULT StaleFileDeleted();
    HRESULT RateChange(double, double);
    HRESULT BroadcastEvent(BSTR);
    HRESULT BroadcastEventEx(BSTR, uint, uint, uint, uint);
    HRESULT ContentPrimarilyAudio();
}
enum IID_IMSVidVideoRenderer2 = GUID(0x6bdd5c1e, 0x2810, 0x4159, [0x94, 0xbc, 0x5, 0x51, 0x1a, 0xe8, 0x54, 0x9b]);
interface IMSVidVideoRenderer2 : IMSVidVideoRenderer
{
    HRESULT get_Allocator(IUnknown*);
    HRESULT get__Allocator(IVMRSurfaceAllocator*);
    HRESULT get_Allocator_ID(int*);
    HRESULT SetAllocator(IUnknown, int);
    HRESULT _SetAllocator2(IVMRSurfaceAllocator, int);
    HRESULT put_SuppressEffects(VARIANT_BOOL);
    HRESULT get_SuppressEffects(VARIANT_BOOL*);
}
enum IID_IMSVidVideoRendererEvent2 = GUID(0x7145ed66, 0x4730, 0x4fdb, [0x8a, 0x53, 0xfd, 0xe7, 0x50, 0x8d, 0x3e, 0x5e]);
interface IMSVidVideoRendererEvent2 : IMSVidOutputDeviceEvent
{
    HRESULT OverlayUnavailable();
}
enum IID_IMSVidVMR9 = GUID(0xd58b0015, 0xebef, 0x44bb, [0xbb, 0xdd, 0x3f, 0x36, 0x99, 0xd7, 0x6e, 0xa1]);
interface IMSVidVMR9 : IMSVidVideoRenderer
{
    HRESULT get_Allocator_ID(int*);
    HRESULT SetAllocator(IUnknown, int);
    HRESULT put_SuppressEffects(VARIANT_BOOL);
    HRESULT get_SuppressEffects(VARIANT_BOOL*);
    HRESULT get_Allocator(IUnknown*);
}
enum IID_IMSVidEVR = GUID(0x15e496ae, 0x82a8, 0x4cf9, [0xa6, 0xb6, 0xc5, 0x61, 0xdc, 0x60, 0x39, 0x8f]);
interface IMSVidEVR : IMSVidVideoRenderer
{
    HRESULT get_Presenter(IMFVideoPresenter*);
    HRESULT put_Presenter(IMFVideoPresenter);
    HRESULT put_SuppressEffects(VARIANT_BOOL);
    HRESULT get_SuppressEffects(VARIANT_BOOL*);
}
enum IID_IMSVidEVREvent = GUID(0x349abb10, 0x883c, 0x4f22, [0x87, 0x14, 0xce, 0xca, 0xee, 0xe4, 0x5d, 0x62]);
interface IMSVidEVREvent : IMSVidOutputDeviceEvent
{
    HRESULT OnUserEvent(int);
}
enum IID_IMSVidAudioRenderer = GUID(0x37b0353f, 0xa4c8, 0x11d2, [0xb6, 0x34, 0x0, 0xc0, 0x4f, 0x79, 0x49, 0x8e]);
interface IMSVidAudioRenderer : IMSVidOutputDevice
{
    HRESULT put_Volume(int);
    HRESULT get_Volume(int*);
    HRESULT put_Balance(int);
    HRESULT get_Balance(int*);
}
enum IID_IMSVidAudioRendererEvent = GUID(0x37b03541, 0xa4c8, 0x11d2, [0xb6, 0x34, 0x0, 0xc0, 0x4f, 0x79, 0x49, 0x8e]);
interface IMSVidAudioRendererEvent : IMSVidOutputDeviceEvent
{
}
enum IID_IMSVidAudioRendererEvent2 = GUID(0xe3f55729, 0x353b, 0x4c43, [0xa0, 0x28, 0x50, 0xf7, 0x9a, 0xa9, 0xa9, 0x7]);
interface IMSVidAudioRendererEvent2 : IMSVidAudioRendererEvent
{
    HRESULT AVDecAudioDualMono();
    HRESULT AVAudioSampleRate();
    HRESULT AVAudioChannelConfig();
    HRESULT AVAudioChannelCount();
    HRESULT AVDecCommonMeanBitRate();
    HRESULT AVDDSurroundMode();
    HRESULT AVDecCommonInputFormat();
    HRESULT AVDecCommonOutputFormat();
}
enum IID_IMSVidInputDevices = GUID(0xc5702cd1, 0x9b79, 0x11d3, [0xb6, 0x54, 0x0, 0xc0, 0x4f, 0x79, 0x49, 0x8e]);
interface IMSVidInputDevices : IDispatch
{
    HRESULT get_Count(int*);
    HRESULT get__NewEnum(IEnumVARIANT*);
    HRESULT get_Item(VARIANT, IMSVidInputDevice*);
    HRESULT Add(IMSVidInputDevice);
    HRESULT Remove(VARIANT);
}
enum IID_IMSVidOutputDevices = GUID(0xc5702cd2, 0x9b79, 0x11d3, [0xb6, 0x54, 0x0, 0xc0, 0x4f, 0x79, 0x49, 0x8e]);
interface IMSVidOutputDevices : IDispatch
{
    HRESULT get_Count(int*);
    HRESULT get__NewEnum(IEnumVARIANT*);
    HRESULT get_Item(VARIANT, IMSVidOutputDevice*);
    HRESULT Add(IMSVidOutputDevice);
    HRESULT Remove(VARIANT);
}
enum IID_IMSVidVideoRendererDevices = GUID(0xc5702cd3, 0x9b79, 0x11d3, [0xb6, 0x54, 0x0, 0xc0, 0x4f, 0x79, 0x49, 0x8e]);
interface IMSVidVideoRendererDevices : IDispatch
{
    HRESULT get_Count(int*);
    HRESULT get__NewEnum(IEnumVARIANT*);
    HRESULT get_Item(VARIANT, IMSVidVideoRenderer*);
    HRESULT Add(IMSVidVideoRenderer);
    HRESULT Remove(VARIANT);
}
enum IID_IMSVidAudioRendererDevices = GUID(0xc5702cd4, 0x9b79, 0x11d3, [0xb6, 0x54, 0x0, 0xc0, 0x4f, 0x79, 0x49, 0x8e]);
interface IMSVidAudioRendererDevices : IDispatch
{
    HRESULT get_Count(int*);
    HRESULT get__NewEnum(IEnumVARIANT*);
    HRESULT get_Item(VARIANT, IMSVidAudioRenderer*);
    HRESULT Add(IMSVidAudioRenderer);
    HRESULT Remove(VARIANT);
}
enum IID_IMSVidFeatures = GUID(0xc5702cd5, 0x9b79, 0x11d3, [0xb6, 0x54, 0x0, 0xc0, 0x4f, 0x79, 0x49, 0x8e]);
interface IMSVidFeatures : IDispatch
{
    HRESULT get_Count(int*);
    HRESULT get__NewEnum(IEnumVARIANT*);
    HRESULT get_Item(VARIANT, IMSVidFeature*);
    HRESULT Add(IMSVidFeature);
    HRESULT Remove(VARIANT);
}
alias MSViddispidList = int;
enum : int
{
    dispidInputs              = 0x00000000,
    dispidOutputs             = 0x00000001,
    dispid_Inputs             = 0x00000002,
    dispid_Outputs            = 0x00000003,
    dispidVideoRenderers      = 0x00000004,
    dispidAudioRenderers      = 0x00000005,
    dispidFeatures            = 0x00000006,
    dispidInput               = 0x00000007,
    dispidOutput              = 0x00000008,
    dispidVideoRenderer       = 0x00000009,
    dispidAudioRenderer       = 0x0000000a,
    dispidSelectedFeatures    = 0x0000000b,
    dispidView                = 0x0000000c,
    dispidBuild               = 0x0000000d,
    dispidPause               = 0x0000000e,
    dispidRun                 = 0x0000000f,
    dispidStop                = 0x00000010,
    dispidDecompose           = 0x00000011,
    dispidDisplaySize         = 0x00000012,
    dispidMaintainAspectRatio = 0x00000013,
    dispidColorKey            = 0x00000014,
    dispidStateChange         = 0x00000015,
    dispidgetState            = 0x00000016,
    dispidunbind              = 0x00000017,
    dispidbind                = 0x00000018,
    dispidDisableVideo        = 0x00000019,
    dispidDisableAudio        = 0x0000001a,
    dispidViewNext            = 0x0000001b,
    dispidServiceP            = 0x0000001c,
}

alias DisplaySizeList = int;
enum : int
{
    dslDefaultSize      = 0x00000000,
    dslSourceSize       = 0x00000000,
    dslHalfSourceSize   = 0x00000001,
    dslDoubleSourceSize = 0x00000002,
    dslFullScreen       = 0x00000003,
    dslHalfScreen       = 0x00000004,
    dslQuarterScreen    = 0x00000005,
    dslSixteenthScreen  = 0x00000006,
}

alias MSVidCtlStateList = int;
enum : int
{
    STATE_UNBUILT = 0xffffffff,
    STATE_STOP    = 0x00000000,
    STATE_PAUSE   = 0x00000001,
    STATE_PLAY    = 0x00000002,
}

enum IID_IMSVidCtl = GUID(0xb0edf162, 0x910a, 0x11d2, [0xb6, 0x32, 0x0, 0xc0, 0x4f, 0x79, 0x49, 0x8e]);
interface IMSVidCtl : IDispatch
{
    HRESULT get_AutoSize(VARIANT_BOOL*);
    HRESULT put_AutoSize(VARIANT_BOOL);
    HRESULT get_BackColor(uint*);
    HRESULT put_BackColor(uint);
    HRESULT get_Enabled(VARIANT_BOOL*);
    HRESULT put_Enabled(VARIANT_BOOL);
    HRESULT get_TabStop(VARIANT_BOOL*);
    HRESULT put_TabStop(VARIANT_BOOL);
    HRESULT get_Window(HWND*);
    HRESULT Refresh();
    HRESULT get_DisplaySize(DisplaySizeList*);
    HRESULT put_DisplaySize(DisplaySizeList);
    HRESULT get_MaintainAspectRatio(VARIANT_BOOL*);
    HRESULT put_MaintainAspectRatio(VARIANT_BOOL);
    HRESULT get_ColorKey(uint*);
    HRESULT put_ColorKey(uint);
    HRESULT get_InputsAvailable(BSTR, IMSVidInputDevices*);
    HRESULT get_OutputsAvailable(BSTR, IMSVidOutputDevices*);
    HRESULT get__InputsAvailable(const(GUID)*, IMSVidInputDevices*);
    HRESULT get__OutputsAvailable(const(GUID)*, IMSVidOutputDevices*);
    HRESULT get_VideoRenderersAvailable(IMSVidVideoRendererDevices*);
    HRESULT get_AudioRenderersAvailable(IMSVidAudioRendererDevices*);
    HRESULT get_FeaturesAvailable(IMSVidFeatures*);
    HRESULT get_InputActive(IMSVidInputDevice*);
    HRESULT put_InputActive(IMSVidInputDevice);
    HRESULT get_OutputsActive(IMSVidOutputDevices*);
    HRESULT put_OutputsActive(IMSVidOutputDevices);
    HRESULT get_VideoRendererActive(IMSVidVideoRenderer*);
    HRESULT put_VideoRendererActive(IMSVidVideoRenderer);
    HRESULT get_AudioRendererActive(IMSVidAudioRenderer*);
    HRESULT put_AudioRendererActive(IMSVidAudioRenderer);
    HRESULT get_FeaturesActive(IMSVidFeatures*);
    HRESULT put_FeaturesActive(IMSVidFeatures);
    HRESULT get_State(MSVidCtlStateList*);
    HRESULT View(VARIANT*);
    HRESULT Build();
    HRESULT Pause();
    HRESULT Run();
    HRESULT Stop();
    HRESULT Decompose();
    HRESULT DisableVideo();
    HRESULT DisableAudio();
    HRESULT ViewNext(VARIANT*);
}
enum IID_IMSEventBinder = GUID(0xc3a9f406, 0x2222, 0x436d, [0x86, 0xd5, 0xba, 0x32, 0x29, 0x27, 0x9e, 0xfb]);
interface IMSEventBinder : IDispatch
{
    HRESULT Bind(IDispatch, BSTR, BSTR, int*);
    HRESULT Unbind(uint);
}
enum IID__IMSVidCtlEvents = GUID(0xb0edf164, 0x910a, 0x11d2, [0xb6, 0x32, 0x0, 0xc0, 0x4f, 0x79, 0x49, 0x8e]);
interface _IMSVidCtlEvents : IDispatch
{
}
enum CLSID_MSVidAnalogTunerDevice = GUID(0x1c15d484, 0x911d, 0x11d2, [0xb6, 0x32, 0x0, 0xc0, 0x4f, 0x79, 0x49, 0x8e]);
struct MSVidAnalogTunerDevice
{
}
enum CLSID_MSVidBDATunerDevice = GUID(0xa2e3074e, 0x6c3d, 0x11d3, [0xb6, 0x53, 0x0, 0xc0, 0x4f, 0x79, 0x49, 0x8e]);
struct MSVidBDATunerDevice
{
}
enum CLSID_MSVidFilePlaybackDevice = GUID(0x37b0353c, 0xa4c8, 0x11d2, [0xb6, 0x34, 0x0, 0xc0, 0x4f, 0x79, 0x49, 0x8e]);
struct MSVidFilePlaybackDevice
{
}
enum CLSID_MSVidWebDVD = GUID(0x11b3619, 0xfe63, 0x4814, [0x8a, 0x84, 0x15, 0xa1, 0x94, 0xce, 0x9c, 0xe3]);
struct MSVidWebDVD
{
}
enum CLSID_MSVidWebDVDAdm = GUID(0xfa7c375b, 0x66a7, 0x4280, [0x87, 0x9d, 0xfd, 0x45, 0x9c, 0x84, 0xbb, 0x2]);
struct MSVidWebDVDAdm
{
}
enum CLSID_MSVidVideoRenderer = GUID(0x37b03543, 0xa4c8, 0x11d2, [0xb6, 0x34, 0x0, 0xc0, 0x4f, 0x79, 0x49, 0x8e]);
struct MSVidVideoRenderer
{
}
enum CLSID_MSVidVMR9 = GUID(0x24dc3975, 0x9bf, 0x4231, [0x86, 0x55, 0x3e, 0xe7, 0x1f, 0x43, 0x83, 0x7d]);
struct MSVidVMR9
{
}
enum CLSID_MSVidEVR = GUID(0xc45268a2, 0xfa81, 0x4e19, [0xb1, 0xe3, 0x72, 0xed, 0xbd, 0x60, 0xae, 0xda]);
struct MSVidEVR
{
}
enum CLSID_MSVidAudioRenderer = GUID(0x37b03544, 0xa4c8, 0x11d2, [0xb6, 0x34, 0x0, 0xc0, 0x4f, 0x79, 0x49, 0x8e]);
struct MSVidAudioRenderer
{
}
enum CLSID_MSVidGenericSink = GUID(0x4a5869cf, 0x929d, 0x4040, [0xae, 0x3, 0xfc, 0xaf, 0xc5, 0xb9, 0xcd, 0x42]);
struct MSVidGenericSink
{
}
enum CLSID_MSVidStreamBufferSink = GUID(0x9e77aac4, 0x35e5, 0x42a1, [0xbd, 0xc2, 0x8f, 0x3f, 0xf3, 0x99, 0x84, 0x7c]);
struct MSVidStreamBufferSink
{
}
enum CLSID_MSVidStreamBufferSource = GUID(0xad8e510d, 0x217f, 0x409b, [0x80, 0x76, 0x29, 0xc5, 0xe7, 0x3b, 0x98, 0xe8]);
struct MSVidStreamBufferSource
{
}
enum CLSID_MSVidStreamBufferV2Source = GUID(0xfd351ea1, 0x4173, 0x4af4, [0x82, 0x1d, 0x80, 0xd4, 0xae, 0x97, 0x90, 0x48]);
struct MSVidStreamBufferV2Source
{
}
enum CLSID_MSVidEncoder = GUID(0xbb530c63, 0xd9df, 0x4b49, [0x94, 0x39, 0x63, 0x45, 0x39, 0x62, 0xe5, 0x98]);
struct MSVidEncoder
{
}
enum CLSID_MSVidITVCapture = GUID(0x5740a302, 0xef0b, 0x45ce, [0xbf, 0x3b, 0x44, 0x70, 0xa1, 0x4a, 0x89, 0x80]);
struct MSVidITVCapture
{
}
enum CLSID_MSVidITVPlayback = GUID(0x9e797ed0, 0x5253, 0x4243, [0xa9, 0xb7, 0xbd, 0x6, 0xc5, 0x8f, 0x8e, 0xf3]);
struct MSVidITVPlayback
{
}
enum CLSID_MSVidCCA = GUID(0x86151827, 0xe47b, 0x45ee, [0x84, 0x21, 0xd1, 0xe, 0x6e, 0x69, 0x9, 0x79]);
struct MSVidCCA
{
}
enum CLSID_MSVidClosedCaptioning = GUID(0x7f9cb14d, 0x48e4, 0x43b6, [0x93, 0x46, 0x1a, 0xeb, 0xc3, 0x9c, 0x64, 0xd3]);
struct MSVidClosedCaptioning
{
}
enum CLSID_MSVidClosedCaptioningSI = GUID(0x92ed88bf, 0x879e, 0x448f, [0xb6, 0xb6, 0xa3, 0x85, 0xbc, 0xeb, 0x84, 0x6d]);
struct MSVidClosedCaptioningSI
{
}
enum CLSID_MSVidDataServices = GUID(0x334125c0, 0x77e5, 0x11d3, [0xb6, 0x53, 0x0, 0xc0, 0x4f, 0x79, 0x49, 0x8e]);
struct MSVidDataServices
{
}
enum CLSID_MSVidXDS = GUID(0x149eedf, 0xd08f, 0x4142, [0x8d, 0x73, 0xd2, 0x39, 0x3, 0xd2, 0x1e, 0x90]);
struct MSVidXDS
{
}
enum CLSID_MSVidAnalogCaptureToDataServices = GUID(0xc5702cd6, 0x9b79, 0x11d3, [0xb6, 0x54, 0x0, 0xc0, 0x4f, 0x79, 0x49, 0x8e]);
struct MSVidAnalogCaptureToDataServices
{
}
enum CLSID_MSVidDataServicesToStreamBufferSink = GUID(0x38f03426, 0xe83b, 0x4e68, [0xb6, 0x5b, 0xdc, 0xae, 0x73, 0x30, 0x48, 0x38]);
struct MSVidDataServicesToStreamBufferSink
{
}
enum CLSID_MSVidDataServicesToXDS = GUID(0x429ec6e, 0x1144, 0x4bed, [0xb8, 0x8b, 0x2f, 0xb9, 0x89, 0x9a, 0x4a, 0x3d]);
struct MSVidDataServicesToXDS
{
}
enum CLSID_MSVidAnalogCaptureToXDS = GUID(0x3540d440, 0x5b1d, 0x49cb, [0x82, 0x1a, 0xe8, 0x4b, 0x8c, 0xf0, 0x65, 0xa7]);
struct MSVidAnalogCaptureToXDS
{
}
enum CLSID_MSVidCtl = GUID(0xb0edf163, 0x910a, 0x11d2, [0xb6, 0x32, 0x0, 0xc0, 0x4f, 0x79, 0x49, 0x8e]);
struct MSVidCtl
{
}
enum CLSID_MSVidInputDevices = GUID(0xc5702ccc, 0x9b79, 0x11d3, [0xb6, 0x54, 0x0, 0xc0, 0x4f, 0x79, 0x49, 0x8e]);
struct MSVidInputDevices
{
}
enum CLSID_MSVidOutputDevices = GUID(0xc5702ccd, 0x9b79, 0x11d3, [0xb6, 0x54, 0x0, 0xc0, 0x4f, 0x79, 0x49, 0x8e]);
struct MSVidOutputDevices
{
}
enum CLSID_MSVidVideoRendererDevices = GUID(0xc5702cce, 0x9b79, 0x11d3, [0xb6, 0x54, 0x0, 0xc0, 0x4f, 0x79, 0x49, 0x8e]);
struct MSVidVideoRendererDevices
{
}
enum CLSID_MSVidAudioRendererDevices = GUID(0xc5702ccf, 0x9b79, 0x11d3, [0xb6, 0x54, 0x0, 0xc0, 0x4f, 0x79, 0x49, 0x8e]);
struct MSVidAudioRendererDevices
{
}
enum CLSID_MSVidFeatures = GUID(0xc5702cd0, 0x9b79, 0x11d3, [0xb6, 0x54, 0x0, 0xc0, 0x4f, 0x79, 0x49, 0x8e]);
struct MSVidFeatures
{
}
enum CLSID_MSVidGenericComposite = GUID(0x2764bce5, 0xcc39, 0x11d2, [0xb6, 0x39, 0x0, 0xc0, 0x4f, 0x79, 0x49, 0x8e]);
struct MSVidGenericComposite
{
}
enum CLSID_MSVidAnalogCaptureToOverlayMixer = GUID(0xe18af75a, 0x8af, 0x11d3, [0xb6, 0x4a, 0x0, 0xc0, 0x4f, 0x79, 0x49, 0x8e]);
struct MSVidAnalogCaptureToOverlayMixer
{
}
enum CLSID_MSVidWebDVDToVideoRenderer = GUID(0x267db0b3, 0x55e3, 0x4902, [0x94, 0x9b, 0xdf, 0x8f, 0x5c, 0xec, 0x1, 0x91]);
struct MSVidWebDVDToVideoRenderer
{
}
enum CLSID_MSVidWebDVDToAudioRenderer = GUID(0x8d04238e, 0x9fd1, 0x41c6, [0x8d, 0xe3, 0x9e, 0x1e, 0xe3, 0x9, 0xe9, 0x35]);
struct MSVidWebDVDToAudioRenderer
{
}
enum CLSID_MSVidMPEG2DecoderToClosedCaptioning = GUID(0x6ad28ee1, 0x5002, 0x4e71, [0xaa, 0xf7, 0xbd, 0x7, 0x79, 0x7, 0xb1, 0xa4]);
struct MSVidMPEG2DecoderToClosedCaptioning
{
}
enum CLSID_MSVidAnalogCaptureToStreamBufferSink = GUID(0x9f50e8b1, 0x9530, 0x4ddc, [0x82, 0x5e, 0x1a, 0xf8, 0x1d, 0x47, 0xae, 0xd6]);
struct MSVidAnalogCaptureToStreamBufferSink
{
}
enum CLSID_MSVidDigitalCaptureToStreamBufferSink = GUID(0xabe40035, 0x27c3, 0x4a2f, [0x81, 0x53, 0x66, 0x24, 0x47, 0x16, 0x8, 0xaf]);
struct MSVidDigitalCaptureToStreamBufferSink
{
}
enum CLSID_MSVidITVToStreamBufferSink = GUID(0x92b94828, 0x1af7, 0x4e6e, [0x9e, 0xbf, 0x77, 0x6, 0x57, 0xf7, 0x7a, 0xf5]);
struct MSVidITVToStreamBufferSink
{
}
enum CLSID_MSVidCCAToStreamBufferSink = GUID(0x3ef76d68, 0x8661, 0x4843, [0x8b, 0x8f, 0xc3, 0x71, 0x63, 0xd8, 0xc9, 0xce]);
struct MSVidCCAToStreamBufferSink
{
}
enum CLSID_MSVidEncoderToStreamBufferSink = GUID(0xa0b9b497, 0xafbc, 0x45ad, [0xa8, 0xa6, 0x9b, 0x7, 0x7c, 0x40, 0xd4, 0xf2]);
struct MSVidEncoderToStreamBufferSink
{
}
enum CLSID_MSVidFilePlaybackToVideoRenderer = GUID(0xb401c5eb, 0x8457, 0x427f, [0x84, 0xea, 0xa4, 0xd2, 0x36, 0x33, 0x64, 0xb0]);
struct MSVidFilePlaybackToVideoRenderer
{
}
enum CLSID_MSVidFilePlaybackToAudioRenderer = GUID(0xcc23f537, 0x18d4, 0x4ece, [0x93, 0xbd, 0x20, 0x7a, 0x84, 0x72, 0x69, 0x79]);
struct MSVidFilePlaybackToAudioRenderer
{
}
enum CLSID_MSVidAnalogTVToEncoder = GUID(0x28953661, 0x231, 0x41db, [0x89, 0x86, 0x21, 0xff, 0x43, 0x88, 0xee, 0x9b]);
struct MSVidAnalogTVToEncoder
{
}
enum CLSID_MSVidStreamBufferSourceToVideoRenderer = GUID(0x3c4708dc, 0xb181, 0x46a8, [0x8d, 0xa8, 0x4a, 0xb0, 0x37, 0x17, 0x58, 0xcd]);
struct MSVidStreamBufferSourceToVideoRenderer
{
}
enum CLSID_MSVidAnalogCaptureToCCA = GUID(0x942b7909, 0xa28e, 0x49a1, [0xa2, 0x7, 0x34, 0xeb, 0xcb, 0xcb, 0x4b, 0x3b]);
struct MSVidAnalogCaptureToCCA
{
}
enum CLSID_MSVidDigitalCaptureToCCA = GUID(0x73d14237, 0xb9db, 0x4efa, [0xa6, 0xdd, 0x84, 0x35, 0x4, 0x21, 0xfb, 0x2f]);
struct MSVidDigitalCaptureToCCA
{
}
enum CLSID_MSVidDigitalCaptureToITV = GUID(0x5d8e73f7, 0x4989, 0x4ac8, [0x8a, 0x98, 0x39, 0xba, 0xd, 0x32, 0x53, 0x2]);
struct MSVidDigitalCaptureToITV
{
}
enum CLSID_MSVidSBESourceToITV = GUID(0x2291478c, 0x5ee3, 0x4bef, [0xab, 0x5d, 0xb5, 0xff, 0x2c, 0xf5, 0x83, 0x52]);
struct MSVidSBESourceToITV
{
}
enum CLSID_MSVidSBESourceToCC = GUID(0x9193a8f9, 0xcba, 0x400e, [0xaa, 0x97, 0xeb, 0x47, 0x9, 0x16, 0x45, 0x76]);
struct MSVidSBESourceToCC
{
}
enum CLSID_MSVidSBESourceToGenericSink = GUID(0x991da7e5, 0x953f, 0x435b, [0xbe, 0x5e, 0xb9, 0x2a, 0x5, 0xed, 0xfc, 0x42]);
struct MSVidSBESourceToGenericSink
{
}
enum CLSID_MSVidCCToVMR = GUID(0xc4bf2784, 0xae00, 0x41ba, [0x98, 0x28, 0x9c, 0x95, 0x3b, 0xd3, 0xc5, 0x4a]);
struct MSVidCCToVMR
{
}
enum CLSID_MSVidCCToAR = GUID(0xd76334ca, 0xd89e, 0x4baf, [0x86, 0xab, 0xdd, 0xb5, 0x93, 0x72, 0xaf, 0xc2]);
struct MSVidCCToAR
{
}
enum CLSID_MSEventBinder = GUID(0x577faa18, 0x4518, 0x445e, [0x8f, 0x70, 0x14, 0x73, 0xf8, 0xcf, 0x4b, 0xa4]);
struct MSEventBinder
{
}
enum CLSID_MSVidStreamBufferRecordingControl = GUID(0xcaafdd83, 0xcefc, 0x4e3d, [0xba, 0x3, 0x17, 0x5f, 0x17, 0xa2, 0x4f, 0x91]);
struct MSVidStreamBufferRecordingControl
{
}
enum CLSID_MSVidRect = GUID(0xcb4276e6, 0x7d5f, 0x4cf1, [0x97, 0x27, 0x62, 0x9c, 0x5e, 0x6d, 0xb6, 0xae]);
struct MSVidRect
{
}
enum CLSID_MSVidDevice = GUID(0x6e40476f, 0x9c49, 0x4c3e, [0x8b, 0xb9, 0x85, 0x87, 0x95, 0x8e, 0xff, 0x74]);
struct MSVidDevice
{
}
enum CLSID_MSVidDevice2 = GUID(0x30997f7d, 0xb3b5, 0x4a1c, [0x98, 0x3a, 0x1f, 0xe8, 0x9, 0x8c, 0xb7, 0x7d]);
struct MSVidDevice2
{
}
enum CLSID_MSVidInputDevice = GUID(0xac1972f2, 0x138a, 0x4ca3, [0x90, 0xda, 0xae, 0x51, 0x11, 0x2e, 0xda, 0x28]);
struct MSVidInputDevice
{
}
enum CLSID_MSVidVideoInputDevice = GUID(0x95f4820b, 0xbb3a, 0x4e2d, [0xbc, 0x64, 0x5b, 0x81, 0x7b, 0xc2, 0xc3, 0xe]);
struct MSVidVideoInputDevice
{
}
enum CLSID_MSVidVideoPlaybackDevice = GUID(0x1990d634, 0x1a5e, 0x4071, [0xa3, 0x4a, 0x53, 0xaa, 0xff, 0xce, 0x9f, 0x36]);
struct MSVidVideoPlaybackDevice
{
}
enum CLSID_MSVidFeature = GUID(0x7748530b, 0xc08a, 0x47ea, [0xb2, 0x4c, 0xbe, 0x86, 0x95, 0xff, 0x40, 0x5f]);
struct MSVidFeature
{
}
enum CLSID_MSVidOutput = GUID(0x87eb890d, 0x3ad, 0x4e9d, [0x98, 0x66, 0x37, 0x6e, 0x5e, 0xc5, 0x72, 0xed]);
struct MSVidOutput
{
}
enum IID_IStreamBufferInitialize = GUID(0x9ce50f2d, 0x6ba7, 0x40fb, [0xa0, 0x34, 0x50, 0xb1, 0xa6, 0x74, 0xec, 0x78]);
interface IStreamBufferInitialize : IUnknown
{
    HRESULT SetHKEY(HKEY);
    HRESULT SetSIDs(uint, PSID*);
}
alias RECORDING_TYPE = int;
enum : int
{
    RECORDING_TYPE_CONTENT   = 0x00000000,
    RECORDING_TYPE_REFERENCE = 0x00000001,
}

enum IID_IStreamBufferSink = GUID(0xafd1f242, 0x7efd, 0x45ee, [0xba, 0x4e, 0x40, 0x7a, 0x25, 0xc9, 0xa7, 0x7a]);
interface IStreamBufferSink : IUnknown
{
    HRESULT LockProfile(const(wchar)*);
    HRESULT CreateRecorder(const(wchar)*, uint, IUnknown*);
    HRESULT IsProfileLocked();
}
enum IID_IStreamBufferSink2 = GUID(0xdb94a660, 0xf4fb, 0x4bfa, [0xbc, 0xc6, 0xfe, 0x15, 0x9a, 0x4e, 0xea, 0x93]);
interface IStreamBufferSink2 : IStreamBufferSink
{
    HRESULT UnlockProfile();
}
enum IID_IStreamBufferSink3 = GUID(0x974723f2, 0x887a, 0x4452, [0x93, 0x66, 0x2c, 0xff, 0x30, 0x57, 0xbc, 0x8f]);
interface IStreamBufferSink3 : IStreamBufferSink2
{
    HRESULT SetAvailableFilter(long*);
}
enum IID_IStreamBufferSource = GUID(0x1c5bd776, 0x6ced, 0x4f44, [0x81, 0x64, 0x5e, 0xab, 0xe, 0x98, 0xdb, 0x12]);
interface IStreamBufferSource : IUnknown
{
    HRESULT SetStreamSink(IStreamBufferSink);
}
enum IID_IStreamBufferRecordControl = GUID(0xba9b6c99, 0xf3c7, 0x4ff2, [0x92, 0xdb, 0xcf, 0xdd, 0x48, 0x51, 0xbf, 0x31]);
interface IStreamBufferRecordControl : IUnknown
{
    HRESULT Start(long*);
    HRESULT Stop(long);
    HRESULT GetRecordingStatus(HRESULT*, BOOL*, BOOL*);
}
enum IID_IStreamBufferRecComp = GUID(0x9e259a9b, 0x8815, 0x42ae, [0xb0, 0x9f, 0x22, 0x19, 0x70, 0xb1, 0x54, 0xfd]);
interface IStreamBufferRecComp : IUnknown
{
    HRESULT Initialize(const(wchar)*, const(wchar)*);
    HRESULT Append(const(wchar)*);
    HRESULT AppendEx(const(wchar)*, long, long);
    HRESULT GetCurrentLength(uint*);
    HRESULT Close();
    HRESULT Cancel();
}
alias STREAMBUFFER_ATTR_DATATYPE = int;
enum : int
{
    STREAMBUFFER_TYPE_DWORD  = 0x00000000,
    STREAMBUFFER_TYPE_STRING = 0x00000001,
    STREAMBUFFER_TYPE_BINARY = 0x00000002,
    STREAMBUFFER_TYPE_BOOL   = 0x00000003,
    STREAMBUFFER_TYPE_QWORD  = 0x00000004,
    STREAMBUFFER_TYPE_WORD   = 0x00000005,
    STREAMBUFFER_TYPE_GUID   = 0x00000006,
}

enum IID_IStreamBufferRecordingAttribute = GUID(0x16ca4e03, 0xfe69, 0x4705, [0xbd, 0x41, 0x5b, 0x7d, 0xfc, 0xc, 0x95, 0xf3]);
interface IStreamBufferRecordingAttribute : IUnknown
{
    HRESULT SetAttribute(uint, const(wchar)*, STREAMBUFFER_ATTR_DATATYPE, ubyte*, ushort);
    HRESULT GetAttributeCount(uint, ushort*);
    HRESULT GetAttributeByName(const(wchar)*, uint*, STREAMBUFFER_ATTR_DATATYPE*, ubyte*, ushort*);
    HRESULT GetAttributeByIndex(ushort, uint*, PWSTR, ushort*, STREAMBUFFER_ATTR_DATATYPE*, ubyte*, ushort*);
    HRESULT EnumAttributes(IEnumStreamBufferRecordingAttrib*);
}
struct STREAMBUFFER_ATTRIBUTE
{
    PWSTR pszName;
    STREAMBUFFER_ATTR_DATATYPE StreamBufferAttributeType;
    ubyte* pbAttribute;
    ushort cbLength;
}
enum IID_IEnumStreamBufferRecordingAttrib = GUID(0xc18a9162, 0x1e82, 0x4142, [0x8c, 0x73, 0x56, 0x90, 0xfa, 0x62, 0xfe, 0x33]);
interface IEnumStreamBufferRecordingAttrib : IUnknown
{
    HRESULT Next(uint, STREAMBUFFER_ATTRIBUTE*, uint*);
    HRESULT Skip(uint);
    HRESULT Reset();
    HRESULT Clone(IEnumStreamBufferRecordingAttrib*);
}
enum IID_IStreamBufferConfigure = GUID(0xce14dfae, 0x4098, 0x4af7, [0xbb, 0xf7, 0xd6, 0x51, 0x1f, 0x83, 0x54, 0x14]);
interface IStreamBufferConfigure : IUnknown
{
    HRESULT SetDirectory(const(wchar)*);
    HRESULT GetDirectory(PWSTR*);
    HRESULT SetBackingFileCount(uint, uint);
    HRESULT GetBackingFileCount(uint*, uint*);
    HRESULT SetBackingFileDuration(uint);
    HRESULT GetBackingFileDuration(uint*);
}
enum IID_IStreamBufferConfigure2 = GUID(0x53e037bf, 0x3992, 0x4282, [0xae, 0x34, 0x24, 0x87, 0xb4, 0xda, 0xe0, 0x6b]);
interface IStreamBufferConfigure2 : IStreamBufferConfigure
{
    HRESULT SetMultiplexedPacketSize(uint);
    HRESULT GetMultiplexedPacketSize(uint*);
    HRESULT SetFFTransitionRates(uint, uint);
    HRESULT GetFFTransitionRates(uint*, uint*);
}
enum IID_IStreamBufferConfigure3 = GUID(0x7e2d2a1e, 0x7192, 0x4bd7, [0x80, 0xc1, 0x6, 0x1f, 0xd1, 0xd1, 0x4, 0x2]);
interface IStreamBufferConfigure3 : IStreamBufferConfigure2
{
    HRESULT SetStartRecConfig(BOOL);
    HRESULT GetStartRecConfig(BOOL*);
    HRESULT SetNamespace(PWSTR);
    HRESULT GetNamespace(PWSTR*);
}
enum IID_IStreamBufferMediaSeeking = GUID(0xf61f5c26, 0x863d, 0x4afa, [0xb0, 0xba, 0x2f, 0x81, 0xdc, 0x97, 0x85, 0x96]);
interface IStreamBufferMediaSeeking : IMediaSeeking
{
}
enum IID_IStreamBufferMediaSeeking2 = GUID(0x3a439ab0, 0x155f, 0x470a, [0x86, 0xa6, 0x9e, 0xa5, 0x4a, 0xfd, 0x6e, 0xaf]);
interface IStreamBufferMediaSeeking2 : IStreamBufferMediaSeeking
{
    HRESULT SetRateEx(double, uint);
}
struct SBE_PIN_DATA
{
    ulong cDataBytes;
    ulong cSamplesProcessed;
    ulong cDiscontinuities;
    ulong cSyncPoints;
    ulong cTimestamps;
}
enum IID_IStreamBufferDataCounters = GUID(0x9d2a2563, 0x31ab, 0x402e, [0x9a, 0x6b, 0xad, 0xb9, 0x3, 0x48, 0x94, 0x40]);
interface IStreamBufferDataCounters : IUnknown
{
    HRESULT GetData(SBE_PIN_DATA*);
    HRESULT ResetData();
}
alias CROSSBAR_DEFAULT_FLAGS = int;
enum : int
{
    DEF_MODE_PROFILE = 0x00000001,
    DEF_MODE_STREAMS = 0x00000002,
}

struct SBE2_STREAM_DESC
{
    uint Version;
    uint StreamId;
    uint Default;
    uint Reserved;
}
struct DVR_STREAM_DESC
{
    uint Version;
    uint StreamId;
    BOOL Default;
    BOOL Creation;
    uint Reserved;
    GUID guidSubMediaType;
    GUID guidFormatType;
    AM_MEDIA_TYPE MediaType;
}
enum IID_ISBE2GlobalEvent = GUID(0xcaede759, 0xb6b1, 0x11db, [0xa5, 0x78, 0x0, 0x18, 0xf3, 0xfa, 0x24, 0xc6]);
interface ISBE2GlobalEvent : IUnknown
{
    HRESULT GetEvent(const(GUID)*, uint, uint, uint, uint, BOOL*, uint*, ubyte*);
}
enum IID_ISBE2GlobalEvent2 = GUID(0x6d8309bf, 0xfe, 0x4506, [0x8b, 0x3, 0xf8, 0xc6, 0x5b, 0x5c, 0x9b, 0x39]);
interface ISBE2GlobalEvent2 : ISBE2GlobalEvent
{
    HRESULT GetEventEx(const(GUID)*, uint, uint, uint, uint, BOOL*, uint*, ubyte*, long*);
}
enum IID_ISBE2SpanningEvent = GUID(0xcaede760, 0xb6b1, 0x11db, [0xa5, 0x78, 0x0, 0x18, 0xf3, 0xfa, 0x24, 0xc6]);
interface ISBE2SpanningEvent : IUnknown
{
    HRESULT GetEvent(const(GUID)*, uint, uint*, ubyte*);
}
enum IID_ISBE2Crossbar = GUID(0x547b6d26, 0x3226, 0x487e, [0x82, 0x53, 0x8a, 0xa1, 0x68, 0x74, 0x94, 0x34]);
interface ISBE2Crossbar : IUnknown
{
    HRESULT EnableDefaultMode(uint);
    HRESULT GetInitialProfile(ISBE2MediaTypeProfile*);
    HRESULT SetOutputProfile(ISBE2MediaTypeProfile, uint*, IPin*);
    HRESULT EnumStreams(ISBE2EnumStream*);
}
enum IID_ISBE2StreamMap = GUID(0x667c7745, 0x85b1, 0x4c55, [0xae, 0x55, 0x4e, 0x25, 0x5, 0x61, 0x59, 0xfc]);
interface ISBE2StreamMap : IUnknown
{
    HRESULT MapStream(uint);
    HRESULT UnmapStream(uint);
    HRESULT EnumMappedStreams(ISBE2EnumStream*);
}
enum IID_ISBE2EnumStream = GUID(0xf7611092, 0x9fbc, 0x46ec, [0xa7, 0xc7, 0x54, 0x8e, 0xa7, 0x8b, 0x71, 0xa4]);
interface ISBE2EnumStream : IUnknown
{
    HRESULT Next(uint, SBE2_STREAM_DESC*, uint*);
    HRESULT Skip(uint);
    HRESULT Reset();
    HRESULT Clone(ISBE2EnumStream*);
}
enum IID_ISBE2MediaTypeProfile = GUID(0xf238267d, 0x4671, 0x40d7, [0x99, 0x7e, 0x25, 0xdc, 0x32, 0xcf, 0xed, 0x2a]);
interface ISBE2MediaTypeProfile : IUnknown
{
    HRESULT GetStreamCount(uint*);
    HRESULT GetStream(uint, AM_MEDIA_TYPE**);
    HRESULT AddStream(AM_MEDIA_TYPE*);
    HRESULT DeleteStream(uint);
}
enum IID_ISBE2FileScan = GUID(0x3e2bf5a5, 0x4f96, 0x4899, [0xa1, 0xa3, 0x75, 0xe8, 0xbe, 0x9a, 0x5a, 0xc0]);
interface ISBE2FileScan : IUnknown
{
    HRESULT RepairFile(const(wchar)*);
}
struct PID_BITS_MIDL
{
    align (1):
    ushort Bits;
}
struct MPEG_HEADER_BITS_MIDL
{
    align (1):
    ushort Bits;
}
struct MPEG_HEADER_VERSION_BITS_MIDL
{
    ubyte Bits;
}
alias MPEG_CURRENT_NEXT_BIT = int;
enum : int
{
    MPEG_SECTION_IS_NEXT    = 0x00000000,
    MPEG_SECTION_IS_CURRENT = 0x00000001,
}

struct TID_EXTENSION
{
    align (1):
    ushort wTidExt;
    ushort wCount;
}
struct SECTION
{
    align (1):
    ubyte TableId;
    union Header
    {
        align (1):
        MPEG_HEADER_BITS_MIDL S;
        ushort W;
    }
    ubyte[1] SectionData;
}
struct LONG_SECTION
{
    align (1):
    ubyte TableId;
    union Header
    {
        align (1):
        MPEG_HEADER_BITS_MIDL S;
        ushort W;
    }
    ushort TableIdExtension;
    union Version
    {
        MPEG_HEADER_VERSION_BITS_MIDL S;
        ubyte B;
    }
    ubyte SectionNumber;
    ubyte LastSectionNumber;
    ubyte[1] RemainingData;
}
struct DSMCC_SECTION
{
    align (1):
    ubyte TableId;
    union Header
    {
        align (1):
        MPEG_HEADER_BITS_MIDL S;
        ushort W;
    }
    ushort TableIdExtension;
    union Version
    {
        MPEG_HEADER_VERSION_BITS_MIDL S;
        ubyte B;
    }
    ubyte SectionNumber;
    ubyte LastSectionNumber;
    ubyte ProtocolDiscriminator;
    ubyte DsmccType;
    ushort MessageId;
    uint TransactionId;
    ubyte Reserved;
    ubyte AdaptationLength;
    ushort MessageLength;
    ubyte[1] RemainingData;
}
struct MPEG_RQST_PACKET
{
    align (1):
    uint dwLength;
    SECTION* pSection;
}
struct MPEG_PACKET_LIST
{
    align (1):
    ushort wPacketCount;
    MPEG_RQST_PACKET*[1] PacketList;
}
struct DSMCC_FILTER_OPTIONS
{
    align (1):
    BOOL fSpecifyProtocol;
    ubyte Protocol;
    BOOL fSpecifyType;
    ubyte Type;
    BOOL fSpecifyMessageId;
    ushort MessageId;
    BOOL fSpecifyTransactionId;
    BOOL fUseTrxIdMessageIdMask;
    uint TransactionId;
    BOOL fSpecifyModuleVersion;
    ubyte ModuleVersion;
    BOOL fSpecifyBlockNumber;
    ushort BlockNumber;
    BOOL fGetModuleCall;
    ushort NumberOfBlocksInModule;
}
struct ATSC_FILTER_OPTIONS
{
    align (1):
    BOOL fSpecifyEtmId;
    uint EtmId;
}
struct DVB_EIT_FILTER_OPTIONS
{
    align (1):
    BOOL fSpecifySegment;
    ubyte bSegment;
}
struct MPEG2_FILTER
{
    align (1):
    ubyte bVersionNumber;
    ushort wFilterSize;
    BOOL fUseRawFilteringBits;
    ubyte[16] Filter;
    ubyte[16] Mask;
    BOOL fSpecifyTableIdExtension;
    ushort TableIdExtension;
    BOOL fSpecifyVersion;
    ubyte Version;
    BOOL fSpecifySectionNumber;
    ubyte SectionNumber;
    BOOL fSpecifyCurrentNext;
    BOOL fNext;
    BOOL fSpecifyDsmccOptions;
    DSMCC_FILTER_OPTIONS Dsmcc;
    BOOL fSpecifyAtscOptions;
    ATSC_FILTER_OPTIONS Atsc;
}
struct MPEG2_FILTER2
{
    align (1):
    union
    {
        struct
        {
            align (1):
            ubyte bVersionNumber;
            ushort wFilterSize;
            BOOL fUseRawFilteringBits;
            ubyte[16] Filter;
            ubyte[16] Mask;
            BOOL fSpecifyTableIdExtension;
            ushort TableIdExtension;
            BOOL fSpecifyVersion;
            ubyte Version;
            BOOL fSpecifySectionNumber;
            ubyte SectionNumber;
            BOOL fSpecifyCurrentNext;
            BOOL fNext;
            BOOL fSpecifyDsmccOptions;
            DSMCC_FILTER_OPTIONS Dsmcc;
            BOOL fSpecifyAtscOptions;
            ATSC_FILTER_OPTIONS Atsc;
        }
        ubyte[124] bVersion1Bytes;
    }
    BOOL fSpecifyDvbEitOptions;
    DVB_EIT_FILTER_OPTIONS DvbEit;
}
struct MPEG_STREAM_BUFFER
{
    align (1):
    HRESULT hr;
    uint dwDataBufferSize;
    uint dwSizeOfDataRead;
    ubyte* pDataBuffer;
}
struct MPEG_TIME
{
    align (1):
    ubyte Hours;
    ubyte Minutes;
    ubyte Seconds;
}
struct MPEG_DATE
{
    align (1):
    ubyte Date;
    ubyte Month;
    ushort Year;
}
struct MPEG_DATE_AND_TIME
{
    align (1):
    MPEG_DATE D;
    MPEG_TIME T;
}
alias MPEG_CONTEXT_TYPE = int;
enum : int
{
    MPEG_CONTEXT_BCS_DEMUX = 0x00000000,
    MPEG_CONTEXT_WINSOCK   = 0x00000001,
}

struct MPEG_BCS_DEMUX
{
    align (1):
    uint AVMGraphId;
}
struct MPEG_WINSOCK
{
    align (1):
    uint AVMGraphId;
}
struct MPEG_CONTEXT
{
    align (1):
    MPEG_CONTEXT_TYPE Type;
    union U
    {
        MPEG_BCS_DEMUX Demux;
        MPEG_WINSOCK Winsock;
    }
}
alias MPEG_REQUEST_TYPE = int;
enum : int
{
    MPEG_RQST_UNKNOWN             = 0x00000000,
    MPEG_RQST_GET_SECTION         = 0x00000001,
    MPEG_RQST_GET_SECTION_ASYNC   = 0x00000002,
    MPEG_RQST_GET_TABLE           = 0x00000003,
    MPEG_RQST_GET_TABLE_ASYNC     = 0x00000004,
    MPEG_RQST_GET_SECTIONS_STREAM = 0x00000005,
    MPEG_RQST_GET_PES_STREAM      = 0x00000006,
    MPEG_RQST_GET_TS_STREAM       = 0x00000007,
    MPEG_RQST_START_MPE_STREAM    = 0x00000008,
}

struct MPEG_SERVICE_REQUEST
{
    align (1):
    MPEG_REQUEST_TYPE Type;
    MPEG_CONTEXT Context;
    ushort Pid;
    ubyte TableId;
    MPEG2_FILTER Filter;
    uint Flags;
}
struct MPEG_SERVICE_RESPONSE
{
    align (1):
    uint IPAddress;
    ushort Port;
}
struct DSMCC_ELEMENT
{
    align (1):
    ushort pid;
    ubyte bComponentTag;
    uint dwCarouselId;
    uint dwTransactionId;
    DSMCC_ELEMENT* pNext;
}
struct MPE_ELEMENT
{
    align (1):
    ushort pid;
    ubyte bComponentTag;
    MPE_ELEMENT* pNext;
}
struct MPEG_STREAM_FILTER
{
    align (1):
    ushort wPidValue;
    uint dwFilterSize;
    BOOL fCrcEnabled;
    ubyte[16] rgchFilter;
    ubyte[16] rgchMask;
}
enum IID_IMpeg2TableFilter = GUID(0xbdcdd913, 0x9ecd, 0x4fb2, [0x81, 0xae, 0xad, 0xf7, 0x47, 0xea, 0x75, 0xa5]);
interface IMpeg2TableFilter : IUnknown
{
    HRESULT AddPID(ushort);
    HRESULT AddTable(ushort, ubyte);
    HRESULT AddExtension(ushort, ubyte, ushort);
    HRESULT RemovePID(ushort);
    HRESULT RemoveTable(ushort, ubyte);
    HRESULT RemoveExtension(ushort, ubyte, ushort);
}
struct Mpeg2TableSampleHdr
{
    align (1):
    ubyte SectionCount;
    ubyte[3] Reserved;
    int[1] SectionOffsets;
}
enum CLSID_Mpeg2DataLib = GUID(0xdbaf6c1b, 0xb6a4, 0x4898, [0xae, 0x65, 0x20, 0x4f, 0xd, 0x95, 0x9, 0xa1]);
struct Mpeg2DataLib
{
}
enum IID_IMpeg2Data = GUID(0x9b396d40, 0xf380, 0x4e3c, [0xa5, 0x14, 0x1a, 0x82, 0xbf, 0x6e, 0xbf, 0xe6]);
interface IMpeg2Data : IUnknown
{
    HRESULT GetSection(ushort, ubyte, MPEG2_FILTER*, uint, ISectionList*);
    HRESULT GetTable(ushort, ubyte, MPEG2_FILTER*, uint, ISectionList*);
    HRESULT GetStreamOfSections(ushort, ubyte, MPEG2_FILTER*, HANDLE, IMpeg2Stream*);
}
enum IID_ISectionList = GUID(0xafec1eb5, 0x2a64, 0x46c6, [0xbf, 0x4b, 0xae, 0x3c, 0xcb, 0x6a, 0xfd, 0xb0]);
interface ISectionList : IUnknown
{
    HRESULT Initialize(MPEG_REQUEST_TYPE, IMpeg2Data, MPEG_CONTEXT*, ushort, ubyte, MPEG2_FILTER*, uint, HANDLE);
    HRESULT InitializeWithRawSections(MPEG_PACKET_LIST*);
    HRESULT CancelPendingRequest();
    HRESULT GetNumberOfSections(ushort*);
    HRESULT GetSectionData(ushort, uint*, SECTION**);
    HRESULT GetProgramIdentifier(ushort*);
    HRESULT GetTableIdentifier(ubyte*);
}
enum IID_IMpeg2Stream = GUID(0x400cc286, 0x32a0, 0x4ce4, [0x90, 0x41, 0x39, 0x57, 0x11, 0x25, 0xa6, 0x35]);
interface IMpeg2Stream : IUnknown
{
    HRESULT Initialize(MPEG_REQUEST_TYPE, IMpeg2Data, MPEG_CONTEXT*, ushort, ubyte, MPEG2_FILTER*, HANDLE);
    HRESULT SupplyDataBuffer(MPEG_STREAM_BUFFER*);
}
enum CLSID_SectionList = GUID(0x73da5d04, 0x4347, 0x45d3, [0xa9, 0xdc, 0xfa, 0xe9, 0xdd, 0xbe, 0x55, 0x8d]);
struct SectionList
{
}
enum CLSID_Mpeg2Stream = GUID(0xf91d96c7, 0x8509, 0x4d0b, [0xab, 0x26, 0xa0, 0xdd, 0x10, 0x90, 0x4b, 0xb7]);
struct Mpeg2Stream
{
}
enum CLSID_Mpeg2Data = GUID(0xc666e115, 0xbb62, 0x4027, [0xa1, 0x13, 0x82, 0xd6, 0x43, 0xfe, 0x2d, 0x99]);
struct Mpeg2Data
{
}
enum IID_IGenericDescriptor = GUID(0x6a5918f8, 0xa77a, 0x4f61, [0xae, 0xd0, 0x57, 0x2, 0xbd, 0xcd, 0xa3, 0xe6]);
interface IGenericDescriptor : IUnknown
{
    HRESULT Initialize(ubyte*, int);
    HRESULT GetTag(ubyte*);
    HRESULT GetLength(ubyte*);
    HRESULT GetBody(ubyte**);
}
enum IID_IGenericDescriptor2 = GUID(0xbf02fb7e, 0x9792, 0x4e10, [0xa6, 0x8d, 0x3, 0x3a, 0x2c, 0xc2, 0x46, 0xa5]);
interface IGenericDescriptor2 : IGenericDescriptor
{
    HRESULT Initialize(ubyte*, ushort);
    HRESULT GetLength(ushort*);
}
struct ProgramElement
{
    ushort wProgramNumber;
    ushort wProgramMapPID;
}
enum IID_IPAT = GUID(0x6623b511, 0x4b5f, 0x43c3, [0x9a, 0x1, 0xe8, 0xff, 0x84, 0x18, 0x80, 0x60]);
interface IPAT : IUnknown
{
    HRESULT Initialize(ISectionList, IMpeg2Data);
    HRESULT GetTransportStreamId(ushort*);
    HRESULT GetVersionNumber(ubyte*);
    HRESULT GetCountOfRecords(uint*);
    HRESULT GetRecordProgramNumber(uint, ushort*);
    HRESULT GetRecordProgramMapPid(uint, ushort*);
    HRESULT FindRecordProgramMapPid(ushort, ushort*);
    HRESULT RegisterForNextTable(HANDLE);
    HRESULT GetNextTable(IPAT*);
    HRESULT RegisterForWhenCurrent(HANDLE);
    HRESULT ConvertNextToCurrent();
}
enum IID_ICAT = GUID(0x7c6995fb, 0x2a31, 0x4bd7, [0x95, 0x3e, 0xb1, 0xad, 0x7f, 0xb7, 0xd3, 0x1c]);
interface ICAT : IUnknown
{
    HRESULT Initialize(ISectionList, IMpeg2Data);
    HRESULT GetVersionNumber(ubyte*);
    HRESULT GetCountOfTableDescriptors(uint*);
    HRESULT GetTableDescriptorByIndex(uint, IGenericDescriptor*);
    HRESULT GetTableDescriptorByTag(ubyte, uint*, IGenericDescriptor*);
    HRESULT RegisterForNextTable(HANDLE);
    HRESULT GetNextTable(uint, ICAT*);
    HRESULT RegisterForWhenCurrent(HANDLE);
    HRESULT ConvertNextToCurrent();
}
enum IID_IPMT = GUID(0x1f3b398, 0x9527, 0x4736, [0x94, 0xdb, 0x51, 0x95, 0x87, 0x8e, 0x97, 0xa8]);
interface IPMT : IUnknown
{
    HRESULT Initialize(ISectionList, IMpeg2Data);
    HRESULT GetProgramNumber(ushort*);
    HRESULT GetVersionNumber(ubyte*);
    HRESULT GetPcrPid(ushort*);
    HRESULT GetCountOfTableDescriptors(uint*);
    HRESULT GetTableDescriptorByIndex(uint, IGenericDescriptor*);
    HRESULT GetTableDescriptorByTag(ubyte, uint*, IGenericDescriptor*);
    HRESULT GetCountOfRecords(ushort*);
    HRESULT GetRecordStreamType(uint, ubyte*);
    HRESULT GetRecordElementaryPid(uint, ushort*);
    HRESULT GetRecordCountOfDescriptors(uint, uint*);
    HRESULT GetRecordDescriptorByIndex(uint, uint, IGenericDescriptor*);
    HRESULT GetRecordDescriptorByTag(uint, ubyte, uint*, IGenericDescriptor*);
    HRESULT QueryServiceGatewayInfo(DSMCC_ELEMENT**, uint*);
    HRESULT QueryMPEInfo(MPE_ELEMENT**, uint*);
    HRESULT RegisterForNextTable(HANDLE);
    HRESULT GetNextTable(IPMT*);
    HRESULT RegisterForWhenCurrent(HANDLE);
    HRESULT ConvertNextToCurrent();
}
enum IID_ITSDT = GUID(0xd19bdb43, 0x405b, 0x4a7c, [0xa7, 0x91, 0xc8, 0x91, 0x10, 0xc3, 0x31, 0x65]);
interface ITSDT : IUnknown
{
    HRESULT Initialize(ISectionList, IMpeg2Data);
    HRESULT GetVersionNumber(ubyte*);
    HRESULT GetCountOfTableDescriptors(uint*);
    HRESULT GetTableDescriptorByIndex(uint, IGenericDescriptor*);
    HRESULT GetTableDescriptorByTag(ubyte, uint*, IGenericDescriptor*);
    HRESULT RegisterForNextTable(HANDLE);
    HRESULT GetNextTable(ITSDT*);
    HRESULT RegisterForWhenCurrent(HANDLE);
    HRESULT ConvertNextToCurrent();
}
enum IID_IPSITables = GUID(0x919f24c5, 0x7b14, 0x42ac, [0xa4, 0xb0, 0x2a, 0xe0, 0x8d, 0xaf, 0x0, 0xac]);
interface IPSITables : IUnknown
{
    HRESULT GetTable(uint, uint, uint, uint, IUnknown*);
}
enum IID_IAtscPsipParser = GUID(0xb2c98995, 0x5eb2, 0x4fb1, [0xb4, 0x6, 0xf3, 0xe8, 0xe2, 0x2, 0x6a, 0x9a]);
interface IAtscPsipParser : IUnknown
{
    HRESULT Initialize(IUnknown);
    HRESULT GetPAT(IPAT*);
    HRESULT GetCAT(uint, ICAT*);
    HRESULT GetPMT(ushort, ushort*, IPMT*);
    HRESULT GetTSDT(ITSDT*);
    HRESULT GetMGT(IATSC_MGT*);
    HRESULT GetVCT(ubyte, BOOL, IATSC_VCT*);
    HRESULT GetEIT(ushort, ushort*, uint, IATSC_EIT*);
    HRESULT GetETT(ushort, ushort*, ushort*, IATSC_ETT*);
    HRESULT GetSTT(IATSC_STT*);
    HRESULT GetEAS(ushort, ISCTE_EAS*);
}
enum IID_IATSC_MGT = GUID(0x8877dabd, 0xc137, 0x4073, [0x97, 0xe3, 0x77, 0x94, 0x7, 0xa5, 0xd8, 0x7a]);
interface IATSC_MGT : IUnknown
{
    HRESULT Initialize(ISectionList, IMpeg2Data);
    HRESULT GetVersionNumber(ubyte*);
    HRESULT GetProtocolVersion(ubyte*);
    HRESULT GetCountOfRecords(uint*);
    HRESULT GetRecordType(uint, ushort*);
    HRESULT GetRecordTypePid(uint, ushort*);
    HRESULT GetRecordVersionNumber(uint, ubyte*);
    HRESULT GetRecordCountOfDescriptors(uint, uint*);
    HRESULT GetRecordDescriptorByIndex(uint, uint, IGenericDescriptor*);
    HRESULT GetRecordDescriptorByTag(uint, ubyte, uint*, IGenericDescriptor*);
    HRESULT GetCountOfTableDescriptors(uint*);
    HRESULT GetTableDescriptorByIndex(uint, IGenericDescriptor*);
    HRESULT GetTableDescriptorByTag(ubyte, uint*, IGenericDescriptor*);
}
enum IID_IATSC_VCT = GUID(0x26879a18, 0x32f9, 0x46c6, [0x91, 0xf0, 0xfb, 0x64, 0x79, 0x27, 0xe, 0x8c]);
interface IATSC_VCT : IUnknown
{
    HRESULT Initialize(ISectionList, IMpeg2Data);
    HRESULT GetVersionNumber(ubyte*);
    HRESULT GetTransportStreamId(ushort*);
    HRESULT GetProtocolVersion(ubyte*);
    HRESULT GetCountOfRecords(uint*);
    HRESULT GetRecordName(uint, PWSTR*);
    HRESULT GetRecordMajorChannelNumber(uint, ushort*);
    HRESULT GetRecordMinorChannelNumber(uint, ushort*);
    HRESULT GetRecordModulationMode(uint, ubyte*);
    HRESULT GetRecordCarrierFrequency(uint, uint*);
    HRESULT GetRecordTransportStreamId(uint, ushort*);
    HRESULT GetRecordProgramNumber(uint, ushort*);
    HRESULT GetRecordEtmLocation(uint, ubyte*);
    HRESULT GetRecordIsAccessControlledBitSet(uint, BOOL*);
    HRESULT GetRecordIsHiddenBitSet(uint, BOOL*);
    HRESULT GetRecordIsPathSelectBitSet(uint, BOOL*);
    HRESULT GetRecordIsOutOfBandBitSet(uint, BOOL*);
    HRESULT GetRecordIsHideGuideBitSet(uint, BOOL*);
    HRESULT GetRecordServiceType(uint, ubyte*);
    HRESULT GetRecordSourceId(uint, ushort*);
    HRESULT GetRecordCountOfDescriptors(uint, uint*);
    HRESULT GetRecordDescriptorByIndex(uint, uint, IGenericDescriptor*);
    HRESULT GetRecordDescriptorByTag(uint, ubyte, uint*, IGenericDescriptor*);
    HRESULT GetCountOfTableDescriptors(uint*);
    HRESULT GetTableDescriptorByIndex(uint, IGenericDescriptor*);
    HRESULT GetTableDescriptorByTag(ubyte, uint*, IGenericDescriptor*);
}
enum IID_IATSC_EIT = GUID(0xd7c212d7, 0x76a2, 0x4b4b, [0xaa, 0x56, 0x84, 0x68, 0x79, 0xa8, 0x0, 0x96]);
interface IATSC_EIT : IUnknown
{
    HRESULT Initialize(ISectionList, IMpeg2Data);
    HRESULT GetVersionNumber(ubyte*);
    HRESULT GetSourceId(ushort*);
    HRESULT GetProtocolVersion(ubyte*);
    HRESULT GetCountOfRecords(uint*);
    HRESULT GetRecordEventId(uint, ushort*);
    HRESULT GetRecordStartTime(uint, MPEG_DATE_AND_TIME*);
    HRESULT GetRecordEtmLocation(uint, ubyte*);
    HRESULT GetRecordDuration(uint, MPEG_TIME*);
    HRESULT GetRecordTitleText(uint, uint*, ubyte**);
    HRESULT GetRecordCountOfDescriptors(uint, uint*);
    HRESULT GetRecordDescriptorByIndex(uint, uint, IGenericDescriptor*);
    HRESULT GetRecordDescriptorByTag(uint, ubyte, uint*, IGenericDescriptor*);
}
enum IID_IATSC_ETT = GUID(0x5a142cc9, 0xb8cf, 0x4a86, [0xa0, 0x40, 0xe9, 0xca, 0xdf, 0x3e, 0xf3, 0xe7]);
interface IATSC_ETT : IUnknown
{
    HRESULT Initialize(ISectionList, IMpeg2Data);
    HRESULT GetVersionNumber(ubyte*);
    HRESULT GetProtocolVersion(ubyte*);
    HRESULT GetEtmId(uint*);
    HRESULT GetExtendedMessageText(uint*, ubyte**);
}
enum IID_IATSC_STT = GUID(0x6bf42423, 0x217d, 0x4d6f, [0x81, 0xe1, 0x3a, 0x7b, 0x36, 0xe, 0xc8, 0x96]);
interface IATSC_STT : IUnknown
{
    HRESULT Initialize(ISectionList, IMpeg2Data);
    HRESULT GetProtocolVersion(ubyte*);
    HRESULT GetSystemTime(MPEG_DATE_AND_TIME*);
    HRESULT GetGpsUtcOffset(ubyte*);
    HRESULT GetDaylightSavings(ushort*);
    HRESULT GetCountOfTableDescriptors(uint*);
    HRESULT GetTableDescriptorByIndex(uint, IGenericDescriptor*);
    HRESULT GetTableDescriptorByTag(ubyte, uint*, IGenericDescriptor*);
}
enum IID_ISCTE_EAS = GUID(0x1ff544d6, 0x161d, 0x4fae, [0x9f, 0xaa, 0x4f, 0x9f, 0x49, 0x2a, 0xe9, 0x99]);
interface ISCTE_EAS : IUnknown
{
    HRESULT Initialize(ISectionList, IMpeg2Data);
    HRESULT GetVersionNumber(ubyte*);
    HRESULT GetSequencyNumber(ubyte*);
    HRESULT GetProtocolVersion(ubyte*);
    HRESULT GetEASEventID(ushort*);
    HRESULT GetOriginatorCode(ubyte*);
    HRESULT GetEASEventCodeLen(ubyte*);
    HRESULT GetEASEventCode(ubyte*);
    HRESULT GetRawNatureOfActivationTextLen(ubyte*);
    HRESULT GetRawNatureOfActivationText(ubyte*);
    HRESULT GetNatureOfActivationText(BSTR, BSTR*);
    HRESULT GetTimeRemaining(ubyte*);
    HRESULT GetStartTime(uint*);
    HRESULT GetDuration(ushort*);
    HRESULT GetAlertPriority(ubyte*);
    HRESULT GetDetailsOOBSourceID(ushort*);
    HRESULT GetDetailsMajor(ushort*);
    HRESULT GetDetailsMinor(ushort*);
    HRESULT GetDetailsAudioOOBSourceID(ushort*);
    HRESULT GetAlertText(BSTR, BSTR*);
    HRESULT GetRawAlertTextLen(ushort*);
    HRESULT GetRawAlertText(ubyte*);
    HRESULT GetLocationCount(ubyte*);
    HRESULT GetLocationCodes(ubyte, ubyte*, ubyte*, ushort*);
    HRESULT GetExceptionCount(ubyte*);
    HRESULT GetExceptionService(ubyte, ubyte*, ushort*, ushort*);
    HRESULT GetCountOfTableDescriptors(uint*);
    HRESULT GetTableDescriptorByIndex(uint, IGenericDescriptor*);
    HRESULT GetTableDescriptorByTag(ubyte, uint*, IGenericDescriptor*);
}
enum IID_IAtscContentAdvisoryDescriptor = GUID(0xff76e60c, 0x283, 0x43ea, [0xba, 0x32, 0xb4, 0x22, 0x23, 0x85, 0x47, 0xee]);
interface IAtscContentAdvisoryDescriptor : IUnknown
{
    HRESULT GetTag(ubyte*);
    HRESULT GetLength(ubyte*);
    HRESULT GetRatingRegionCount(ubyte*);
    HRESULT GetRecordRatingRegion(ubyte, ubyte*);
    HRESULT GetRecordRatedDimensions(ubyte, ubyte*);
    HRESULT GetRecordRatingDimension(ubyte, ubyte, ubyte*);
    HRESULT GetRecordRatingValue(ubyte, ubyte, ubyte*);
    HRESULT GetRecordRatingDescriptionText(ubyte, ubyte*, ubyte**);
}
enum IID_ICaptionServiceDescriptor = GUID(0x40834007, 0x6834, 0x46f0, [0xbd, 0x45, 0xd5, 0xf6, 0xa6, 0xbe, 0x25, 0x8c]);
interface ICaptionServiceDescriptor : IUnknown
{
    HRESULT GetNumberOfServices(ubyte*);
    HRESULT GetLanguageCode(ubyte, ubyte*);
    HRESULT GetCaptionServiceNumber(ubyte, ubyte*);
    HRESULT GetCCType(ubyte, ubyte*);
    HRESULT GetEasyReader(ubyte, ubyte*);
    HRESULT GetWideAspectRatio(ubyte, ubyte*);
}
enum IID_IServiceLocationDescriptor = GUID(0x58c3c827, 0x9d91, 0x4215, [0xbf, 0xf3, 0x82, 0xa, 0x49, 0xf0, 0x90, 0x4c]);
interface IServiceLocationDescriptor : IUnknown
{
    HRESULT GetPCR_PID(ushort*);
    HRESULT GetNumberOfElements(ubyte*);
    HRESULT GetElementStreamType(ubyte, ubyte*);
    HRESULT GetElementPID(ubyte, ushort*);
    HRESULT GetElementLanguageCode(ubyte, ubyte*);
}
enum IID_IAttributeSet = GUID(0x583ec3cc, 0x4960, 0x4857, [0x98, 0x2b, 0x41, 0xa3, 0x3e, 0xa0, 0xa0, 0x6]);
interface IAttributeSet : IUnknown
{
    HRESULT SetAttrib(GUID, ubyte*, uint);
}
enum IID_IAttributeGet = GUID(0x52dbd1ec, 0xe48f, 0x4528, [0x92, 0x32, 0xf4, 0x42, 0xa6, 0x8f, 0xa, 0xe1]);
interface IAttributeGet : IUnknown
{
    HRESULT GetCount(int*);
    HRESULT GetAttribIndexed(int, GUID*, ubyte*, uint*);
    HRESULT GetAttrib(GUID, ubyte*, uint*);
}
struct UDCR_TAG
{
    ubyte bVersion;
    ubyte[25] KID;
    ulong ullBaseCounter;
    ulong ullBaseCounterRange;
    BOOL fScrambled;
    ubyte bStreamMark;
    uint dwReserved1;
    uint dwReserved2;
}
struct PIC_SEQ_SAMPLE
{
    uint _bitfield0;
}
struct SAMPLE_SEQ_OFFSET
{
    uint _bitfield0;
}
alias VA_VIDEO_FORMAT = int;
enum : int
{
    VA_VIDEO_COMPONENT   = 0x00000000,
    VA_VIDEO_PAL         = 0x00000001,
    VA_VIDEO_NTSC        = 0x00000002,
    VA_VIDEO_SECAM       = 0x00000003,
    VA_VIDEO_MAC         = 0x00000004,
    VA_VIDEO_UNSPECIFIED = 0x00000005,
}

alias VA_COLOR_PRIMARIES = int;
enum : int
{
    VA_PRIMARIES_ITU_R_BT_709            = 0x00000001,
    VA_PRIMARIES_UNSPECIFIED             = 0x00000002,
    VA_PRIMARIES_ITU_R_BT_470_SYSTEM_M   = 0x00000004,
    VA_PRIMARIES_ITU_R_BT_470_SYSTEM_B_G = 0x00000005,
    VA_PRIMARIES_SMPTE_170M              = 0x00000006,
    VA_PRIMARIES_SMPTE_240M              = 0x00000007,
    VA_PRIMARIES_H264_GENERIC_FILM       = 0x00000008,
}

alias VA_TRANSFER_CHARACTERISTICS = int;
enum : int
{
    VA_TRANSFER_CHARACTERISTICS_ITU_R_BT_709            = 0x00000001,
    VA_TRANSFER_CHARACTERISTICS_UNSPECIFIED             = 0x00000002,
    VA_TRANSFER_CHARACTERISTICS_ITU_R_BT_470_SYSTEM_M   = 0x00000004,
    VA_TRANSFER_CHARACTERISTICS_ITU_R_BT_470_SYSTEM_B_G = 0x00000005,
    VA_TRANSFER_CHARACTERISTICS_SMPTE_170M              = 0x00000006,
    VA_TRANSFER_CHARACTERISTICS_SMPTE_240M              = 0x00000007,
    VA_TRANSFER_CHARACTERISTICS_LINEAR                  = 0x00000008,
    VA_TRANSFER_CHARACTERISTICS_H264_LOG_100_TO_1       = 0x00000009,
    VA_TRANSFER_CHARACTERISTICS_H264_LOG_316_TO_1       = 0x0000000a,
}

alias VA_MATRIX_COEFFICIENTS = int;
enum : int
{
    VA_MATRIX_COEFF_H264_RGB                = 0x00000000,
    VA_MATRIX_COEFF_ITU_R_BT_709            = 0x00000001,
    VA_MATRIX_COEFF_UNSPECIFIED             = 0x00000002,
    VA_MATRIX_COEFF_FCC                     = 0x00000004,
    VA_MATRIX_COEFF_ITU_R_BT_470_SYSTEM_B_G = 0x00000005,
    VA_MATRIX_COEFF_SMPTE_170M              = 0x00000006,
    VA_MATRIX_COEFF_SMPTE_240M              = 0x00000007,
    VA_MATRIX_COEFF_H264_YCgCo              = 0x00000008,
}

struct VA_OPTIONAL_VIDEO_PROPERTIES
{
    ushort dwPictureHeight;
    ushort dwPictureWidth;
    ushort dwAspectRatioX;
    ushort dwAspectRatioY;
    VA_VIDEO_FORMAT VAVideoFormat;
    VA_COLOR_PRIMARIES VAColorPrimaries;
    VA_TRANSFER_CHARACTERISTICS VATransferCharacteristics;
    VA_MATRIX_COEFFICIENTS VAMatrixCoefficients;
}
struct TRANSPORT_PROPERTIES
{
    uint PID;
    long PCR;
    union Fields
    {
        struct _Others
        {
            long _bitfield0;
        }
        long Value;
    }
}
struct PBDA_TAG_ATTRIBUTE
{
    GUID TableUUId;
    ubyte TableId;
    ushort VersionNo;
    uint TableDataSize;
    ubyte[1] TableData;
}
struct CAPTURE_STREAMTIME
{
    long StreamTime;
}
struct DSHOW_STREAM_DESC
{
    uint VersionNo;
    uint StreamId;
    BOOL Default;
    BOOL Creation;
    uint Reserved;
}
struct SAMPLE_LIVE_STREAM_TIME
{
    ulong qwStreamTime;
    ulong qwLiveTime;
}
alias DVB_STRCONV_MODE = int;
enum : int
{
    STRCONV_MODE_DVB                  = 0x00000000,
    STRCONV_MODE_DVB_EMPHASIS         = 0x00000001,
    STRCONV_MODE_DVB_WITHOUT_EMPHASIS = 0x00000002,
    STRCONV_MODE_ISDB                 = 0x00000003,
}

enum IID_IDvbSiParser = GUID(0xb758a7bd, 0x14dc, 0x449d, [0xb8, 0x28, 0x35, 0x90, 0x9a, 0xcb, 0x3b, 0x1e]);
interface IDvbSiParser : IUnknown
{
    HRESULT Initialize(IUnknown);
    HRESULT GetPAT(IPAT*);
    HRESULT GetCAT(uint, ICAT*);
    HRESULT GetPMT(ushort, ushort*, IPMT*);
    HRESULT GetTSDT(ITSDT*);
    HRESULT GetNIT(ubyte, ushort*, IDVB_NIT*);
    HRESULT GetSDT(ubyte, ushort*, IDVB_SDT*);
    HRESULT GetEIT(ubyte, ushort*, IDVB_EIT*);
    HRESULT GetBAT(ushort*, IDVB_BAT*);
    HRESULT GetRST(uint, IDVB_RST*);
    HRESULT GetST(ushort, uint, IDVB_ST*);
    HRESULT GetTDT(IDVB_TDT*);
    HRESULT GetTOT(IDVB_TOT*);
    HRESULT GetDIT(uint, IDVB_DIT*);
    HRESULT GetSIT(uint, IDVB_SIT*);
}
enum IID_IDvbSiParser2 = GUID(0xac5525f, 0xf816, 0x42f4, [0x93, 0xba, 0x4c, 0xf, 0x32, 0xf4, 0x6e, 0x54]);
interface IDvbSiParser2 : IDvbSiParser
{
    HRESULT GetEIT2(ubyte, ushort*, ubyte*, IDVB_EIT2*);
}
enum IID_IIsdbSiParser2 = GUID(0x900e4bb7, 0x18cd, 0x453f, [0x98, 0xbe, 0x3b, 0xe6, 0xaa, 0x21, 0x17, 0x72]);
interface IIsdbSiParser2 : IDvbSiParser2
{
    HRESULT GetSDT(ubyte, ushort*, IISDB_SDT*);
    HRESULT GetBIT(ubyte, ushort*, IISDB_BIT*);
    HRESULT GetNBIT(ubyte, ushort*, IISDB_NBIT*);
    HRESULT GetLDT(ubyte, ushort*, IISDB_LDT*);
    HRESULT GetSDTT(ubyte, ushort*, IISDB_SDTT*);
    HRESULT GetCDT(ubyte, ubyte, ushort*, IISDB_CDT*);
    HRESULT GetEMM(ushort, ushort, IISDB_EMM*);
}
enum IID_IDVB_NIT = GUID(0xc64935f4, 0x29e4, 0x4e22, [0x91, 0x1a, 0x63, 0xf7, 0xf5, 0x5c, 0xb0, 0x97]);
interface IDVB_NIT : IUnknown
{
    HRESULT Initialize(ISectionList, IMpeg2Data);
    HRESULT GetVersionNumber(ubyte*);
    HRESULT GetNetworkId(ushort*);
    HRESULT GetCountOfTableDescriptors(uint*);
    HRESULT GetTableDescriptorByIndex(uint, IGenericDescriptor*);
    HRESULT GetTableDescriptorByTag(ubyte, uint*, IGenericDescriptor*);
    HRESULT GetCountOfRecords(uint*);
    HRESULT GetRecordTransportStreamId(uint, ushort*);
    HRESULT GetRecordOriginalNetworkId(uint, ushort*);
    HRESULT GetRecordCountOfDescriptors(uint, uint*);
    HRESULT GetRecordDescriptorByIndex(uint, uint, IGenericDescriptor*);
    HRESULT GetRecordDescriptorByTag(uint, ubyte, uint*, IGenericDescriptor*);
    HRESULT RegisterForNextTable(HANDLE);
    HRESULT GetNextTable(IDVB_NIT*);
    HRESULT RegisterForWhenCurrent(HANDLE);
    HRESULT ConvertNextToCurrent();
    HRESULT GetVersionHash(uint*);
}
enum IID_IDVB_SDT = GUID(0x2cad8d3, 0xfe43, 0x48e2, [0x90, 0xbd, 0x45, 0xe, 0xd9, 0xa8, 0xa5, 0xfd]);
interface IDVB_SDT : IUnknown
{
    HRESULT Initialize(ISectionList, IMpeg2Data);
    HRESULT GetVersionNumber(ubyte*);
    HRESULT GetTransportStreamId(ushort*);
    HRESULT GetOriginalNetworkId(ushort*);
    HRESULT GetCountOfRecords(uint*);
    HRESULT GetRecordServiceId(uint, ushort*);
    HRESULT GetRecordEITScheduleFlag(uint, BOOL*);
    HRESULT GetRecordEITPresentFollowingFlag(uint, BOOL*);
    HRESULT GetRecordRunningStatus(uint, ubyte*);
    HRESULT GetRecordFreeCAMode(uint, BOOL*);
    HRESULT GetRecordCountOfDescriptors(uint, uint*);
    HRESULT GetRecordDescriptorByIndex(uint, uint, IGenericDescriptor*);
    HRESULT GetRecordDescriptorByTag(uint, ubyte, uint*, IGenericDescriptor*);
    HRESULT RegisterForNextTable(HANDLE);
    HRESULT GetNextTable(IDVB_SDT*);
    HRESULT RegisterForWhenCurrent(HANDLE);
    HRESULT ConvertNextToCurrent();
    HRESULT GetVersionHash(uint*);
}
enum IID_IISDB_SDT = GUID(0x3f3dc9a2, 0xbb32, 0x4fb9, [0xae, 0x9e, 0xd8, 0x56, 0x84, 0x89, 0x27, 0xa3]);
interface IISDB_SDT : IDVB_SDT
{
    HRESULT GetRecordEITUserDefinedFlags(uint, ubyte*);
}
enum IID_IDVB_EIT = GUID(0x442db029, 0x2cb, 0x4495, [0x8b, 0x92, 0x1c, 0x13, 0x37, 0x5b, 0xce, 0x99]);
interface IDVB_EIT : IUnknown
{
    HRESULT Initialize(ISectionList, IMpeg2Data);
    HRESULT GetVersionNumber(ubyte*);
    HRESULT GetServiceId(ushort*);
    HRESULT GetTransportStreamId(ushort*);
    HRESULT GetOriginalNetworkId(ushort*);
    HRESULT GetSegmentLastSectionNumber(ubyte*);
    HRESULT GetLastTableId(ubyte*);
    HRESULT GetCountOfRecords(uint*);
    HRESULT GetRecordEventId(uint, ushort*);
    HRESULT GetRecordStartTime(uint, MPEG_DATE_AND_TIME*);
    HRESULT GetRecordDuration(uint, MPEG_TIME*);
    HRESULT GetRecordRunningStatus(uint, ubyte*);
    HRESULT GetRecordFreeCAMode(uint, BOOL*);
    HRESULT GetRecordCountOfDescriptors(uint, uint*);
    HRESULT GetRecordDescriptorByIndex(uint, uint, IGenericDescriptor*);
    HRESULT GetRecordDescriptorByTag(uint, ubyte, uint*, IGenericDescriptor*);
    HRESULT RegisterForNextTable(HANDLE);
    HRESULT GetNextTable(IDVB_EIT*);
    HRESULT RegisterForWhenCurrent(HANDLE);
    HRESULT ConvertNextToCurrent();
    HRESULT GetVersionHash(uint*);
}
enum IID_IDVB_EIT2 = GUID(0x61a389e0, 0x9b9e, 0x4ba0, [0xae, 0xea, 0x5d, 0xdd, 0x15, 0x98, 0x20, 0xea]);
interface IDVB_EIT2 : IDVB_EIT
{
    HRESULT GetSegmentInfo(ubyte*, ubyte*);
    HRESULT GetRecordSection(uint, ubyte*);
}
enum IID_IDVB_BAT = GUID(0xece9bb0c, 0x43b6, 0x4558, [0xa0, 0xec, 0x18, 0x12, 0xc3, 0x4c, 0xd6, 0xca]);
interface IDVB_BAT : IUnknown
{
    HRESULT Initialize(ISectionList, IMpeg2Data);
    HRESULT GetVersionNumber(ubyte*);
    HRESULT GetBouquetId(ushort*);
    HRESULT GetCountOfTableDescriptors(uint*);
    HRESULT GetTableDescriptorByIndex(uint, IGenericDescriptor*);
    HRESULT GetTableDescriptorByTag(ubyte, uint*, IGenericDescriptor*);
    HRESULT GetCountOfRecords(uint*);
    HRESULT GetRecordTransportStreamId(uint, ushort*);
    HRESULT GetRecordOriginalNetworkId(uint, ushort*);
    HRESULT GetRecordCountOfDescriptors(uint, uint*);
    HRESULT GetRecordDescriptorByIndex(uint, uint, IGenericDescriptor*);
    HRESULT GetRecordDescriptorByTag(uint, ubyte, uint*, IGenericDescriptor*);
    HRESULT RegisterForNextTable(HANDLE);
    HRESULT GetNextTable(IDVB_BAT*);
    HRESULT RegisterForWhenCurrent(HANDLE);
    HRESULT ConvertNextToCurrent();
}
enum IID_IDVB_RST = GUID(0xf47dcd04, 0x1e23, 0x4fb7, [0x9f, 0x96, 0xb4, 0xe, 0xea, 0xd1, 0xb, 0x2b]);
interface IDVB_RST : IUnknown
{
    HRESULT Initialize(ISectionList);
    HRESULT GetCountOfRecords(uint*);
    HRESULT GetRecordTransportStreamId(uint, ushort*);
    HRESULT GetRecordOriginalNetworkId(uint, ushort*);
    HRESULT GetRecordServiceId(uint, ushort*);
    HRESULT GetRecordEventId(uint, ushort*);
    HRESULT GetRecordRunningStatus(uint, ubyte*);
}
enum IID_IDVB_ST = GUID(0x4d5b9f23, 0x2a02, 0x45de, [0xbc, 0xda, 0x5d, 0x5d, 0xbf, 0xbf, 0xbe, 0x62]);
interface IDVB_ST : IUnknown
{
    HRESULT Initialize(ISectionList);
    HRESULT GetDataLength(ushort*);
    HRESULT GetData(ubyte**);
}
enum IID_IDVB_TDT = GUID(0x780dc7d, 0xd55c, 0x4aef, [0x97, 0xe6, 0x6b, 0x75, 0x90, 0x6e, 0x27, 0x96]);
interface IDVB_TDT : IUnknown
{
    HRESULT Initialize(ISectionList);
    HRESULT GetUTCTime(MPEG_DATE_AND_TIME*);
}
enum IID_IDVB_TOT = GUID(0x83295d6a, 0xfaba, 0x4ee1, [0x9b, 0x15, 0x80, 0x67, 0x69, 0x69, 0x10, 0xae]);
interface IDVB_TOT : IUnknown
{
    HRESULT Initialize(ISectionList);
    HRESULT GetUTCTime(MPEG_DATE_AND_TIME*);
    HRESULT GetCountOfTableDescriptors(uint*);
    HRESULT GetTableDescriptorByIndex(uint, IGenericDescriptor*);
    HRESULT GetTableDescriptorByTag(ubyte, uint*, IGenericDescriptor*);
}
enum IID_IDVB_DIT = GUID(0x91bffdf9, 0x9432, 0x410f, [0x86, 0xef, 0x1c, 0x22, 0x8e, 0xd0, 0xad, 0x70]);
interface IDVB_DIT : IUnknown
{
    HRESULT Initialize(ISectionList);
    HRESULT GetTransitionFlag(BOOL*);
}
enum IID_IDVB_SIT = GUID(0x68cdce53, 0x8bea, 0x45c2, [0x9d, 0x9d, 0xac, 0xf5, 0x75, 0xa0, 0x89, 0xb5]);
interface IDVB_SIT : IUnknown
{
    HRESULT Initialize(ISectionList, IMpeg2Data);
    HRESULT GetVersionNumber(ubyte*);
    HRESULT GetCountOfTableDescriptors(uint*);
    HRESULT GetTableDescriptorByIndex(uint, IGenericDescriptor*);
    HRESULT GetTableDescriptorByTag(ubyte, uint*, IGenericDescriptor*);
    HRESULT GetCountOfRecords(uint*);
    HRESULT GetRecordServiceId(uint, ushort*);
    HRESULT GetRecordRunningStatus(uint, ubyte*);
    HRESULT GetRecordCountOfDescriptors(uint, uint*);
    HRESULT GetRecordDescriptorByIndex(uint, uint, IGenericDescriptor*);
    HRESULT GetRecordDescriptorByTag(uint, ubyte, uint*, IGenericDescriptor*);
    HRESULT RegisterForNextTable(HANDLE);
    HRESULT GetNextTable(uint, IDVB_SIT*);
    HRESULT RegisterForWhenCurrent(HANDLE);
    HRESULT ConvertNextToCurrent();
}
enum IID_IISDB_BIT = GUID(0x537cd71e, 0xe46, 0x4173, [0x90, 0x1, 0xba, 0x4, 0x3f, 0x3e, 0x49, 0xe2]);
interface IISDB_BIT : IUnknown
{
    HRESULT Initialize(ISectionList, IMpeg2Data);
    HRESULT GetVersionNumber(ubyte*);
    HRESULT GetOriginalNetworkId(ushort*);
    HRESULT GetBroadcastViewPropriety(ubyte*);
    HRESULT GetCountOfTableDescriptors(uint*);
    HRESULT GetTableDescriptorByIndex(uint, IGenericDescriptor*);
    HRESULT GetTableDescriptorByTag(ubyte, uint*, IGenericDescriptor*);
    HRESULT GetCountOfRecords(uint*);
    HRESULT GetRecordBroadcasterId(uint, ubyte*);
    HRESULT GetRecordCountOfDescriptors(uint, uint*);
    HRESULT GetRecordDescriptorByIndex(uint, uint, IGenericDescriptor*);
    HRESULT GetRecordDescriptorByTag(uint, ubyte, uint*, IGenericDescriptor*);
    HRESULT GetVersionHash(uint*);
}
enum IID_IISDB_NBIT = GUID(0x1b1863ef, 0x8f1, 0x40b7, [0xa5, 0x59, 0x3b, 0x1e, 0xff, 0x8c, 0xaf, 0xa6]);
interface IISDB_NBIT : IUnknown
{
    HRESULT Initialize(ISectionList, IMpeg2Data);
    HRESULT GetVersionNumber(ubyte*);
    HRESULT GetOriginalNetworkId(ushort*);
    HRESULT GetCountOfRecords(uint*);
    HRESULT GetRecordInformationId(uint, ushort*);
    HRESULT GetRecordInformationType(uint, ubyte*);
    HRESULT GetRecordDescriptionBodyLocation(uint, ubyte*);
    HRESULT GetRecordMessageSectionNumber(uint, ubyte*);
    HRESULT GetRecordUserDefined(uint, ubyte*);
    HRESULT GetRecordNumberOfKeys(uint, ubyte*);
    HRESULT GetRecordKeys(uint, ubyte**);
    HRESULT GetRecordCountOfDescriptors(uint, uint*);
    HRESULT GetRecordDescriptorByIndex(uint, uint, IGenericDescriptor*);
    HRESULT GetRecordDescriptorByTag(uint, ubyte, uint*, IGenericDescriptor*);
    HRESULT GetVersionHash(uint*);
}
enum IID_IISDB_LDT = GUID(0x141a546b, 0x2ff, 0x4fb9, [0xa3, 0xa3, 0x2f, 0x7, 0x4b, 0x74, 0xa9, 0xa9]);
interface IISDB_LDT : IUnknown
{
    HRESULT Initialize(ISectionList, IMpeg2Data);
    HRESULT GetVersionNumber(ubyte*);
    HRESULT GetOriginalServiceId(ushort*);
    HRESULT GetTransportStreamId(ushort*);
    HRESULT GetOriginalNetworkId(ushort*);
    HRESULT GetCountOfRecords(uint*);
    HRESULT GetRecordDescriptionId(uint, ushort*);
    HRESULT GetRecordCountOfDescriptors(uint, uint*);
    HRESULT GetRecordDescriptorByIndex(uint, uint, IGenericDescriptor*);
    HRESULT GetRecordDescriptorByTag(uint, ubyte, uint*, IGenericDescriptor*);
    HRESULT GetVersionHash(uint*);
}
enum IID_IISDB_SDTT = GUID(0xee60ef2d, 0x813a, 0x4dc7, [0xbf, 0x92, 0xea, 0x13, 0xda, 0xc8, 0x53, 0x13]);
interface IISDB_SDTT : IUnknown
{
    HRESULT Initialize(ISectionList, IMpeg2Data);
    HRESULT GetVersionNumber(ubyte*);
    HRESULT GetTableIdExt(ushort*);
    HRESULT GetTransportStreamId(ushort*);
    HRESULT GetOriginalNetworkId(ushort*);
    HRESULT GetServiceId(ushort*);
    HRESULT GetCountOfRecords(uint*);
    HRESULT GetRecordGroup(uint, ubyte*);
    HRESULT GetRecordTargetVersion(uint, ushort*);
    HRESULT GetRecordNewVersion(uint, ushort*);
    HRESULT GetRecordDownloadLevel(uint, ubyte*);
    HRESULT GetRecordVersionIndicator(uint, ubyte*);
    HRESULT GetRecordScheduleTimeShiftInformation(uint, ubyte*);
    HRESULT GetRecordCountOfSchedules(uint, uint*);
    HRESULT GetRecordStartTimeByIndex(uint, uint, MPEG_DATE_AND_TIME*);
    HRESULT GetRecordDurationByIndex(uint, uint, MPEG_TIME*);
    HRESULT GetRecordCountOfDescriptors(uint, uint*);
    HRESULT GetRecordDescriptorByIndex(uint, uint, IGenericDescriptor*);
    HRESULT GetRecordDescriptorByTag(uint, ubyte, uint*, IGenericDescriptor*);
    HRESULT GetVersionHash(uint*);
}
enum IID_IISDB_CDT = GUID(0x25fa92c2, 0x8b80, 0x4787, [0xa8, 0x41, 0x3a, 0xe, 0x8f, 0x17, 0x98, 0x4b]);
interface IISDB_CDT : IUnknown
{
    HRESULT Initialize(ISectionList, IMpeg2Data, ubyte);
    HRESULT GetVersionNumber(ubyte*);
    HRESULT GetDownloadDataId(ushort*);
    HRESULT GetSectionNumber(ubyte*);
    HRESULT GetOriginalNetworkId(ushort*);
    HRESULT GetDataType(ubyte*);
    HRESULT GetCountOfTableDescriptors(uint*);
    HRESULT GetTableDescriptorByIndex(uint, IGenericDescriptor*);
    HRESULT GetTableDescriptorByTag(ubyte, uint*, IGenericDescriptor*);
    HRESULT GetSizeOfDataModule(uint*);
    HRESULT GetDataModule(ubyte**);
    HRESULT GetVersionHash(uint*);
}
enum IID_IISDB_EMM = GUID(0xedb556d, 0x43ad, 0x4938, [0x96, 0x68, 0x32, 0x1b, 0x2f, 0xfe, 0xcf, 0xd3]);
interface IISDB_EMM : IUnknown
{
    HRESULT Initialize(ISectionList, IMpeg2Data);
    HRESULT GetVersionNumber(ubyte*);
    HRESULT GetTableIdExtension(ushort*);
    HRESULT GetDataBytes(ushort*, ubyte*);
    HRESULT GetSharedEmmMessage(ushort*, ubyte**);
    HRESULT GetIndividualEmmMessage(IUnknown, ushort*, ubyte**);
    HRESULT GetVersionHash(uint*);
}
enum IID_IDvbServiceAttributeDescriptor = GUID(0xf37bd92, 0xd6a1, 0x4854, [0xb9, 0x50, 0x3a, 0x96, 0x9d, 0x27, 0xf3, 0xe]);
interface IDvbServiceAttributeDescriptor : IUnknown
{
    HRESULT GetTag(ubyte*);
    HRESULT GetLength(ubyte*);
    HRESULT GetCountOfRecords(ubyte*);
    HRESULT GetRecordServiceId(ubyte, ushort*);
    HRESULT GetRecordNumericSelectionFlag(ubyte, BOOL*);
    HRESULT GetRecordVisibleServiceFlag(ubyte, BOOL*);
}
alias CRID_LOCATION = int;
enum : int
{
    CRID_LOCATION_IN_DESCRIPTOR = 0x00000000,
    CRID_LOCATION_IN_CIT        = 0x00000001,
    CRID_LOCATION_DVB_RESERVED1 = 0x00000002,
    CRID_LOCATION_DVB_RESERVED2 = 0x00000003,
}

enum IID_IDvbContentIdentifierDescriptor = GUID(0x5e0c1ea, 0xf661, 0x4053, [0x9f, 0xbf, 0xd9, 0x3b, 0x28, 0x35, 0x98, 0x38]);
interface IDvbContentIdentifierDescriptor : IUnknown
{
    HRESULT GetTag(ubyte*);
    HRESULT GetLength(ubyte*);
    HRESULT GetCountOfRecords(ubyte*);
    HRESULT GetRecordCrid(ubyte, ubyte*, ubyte*, ubyte*, ubyte**);
}
enum IID_IDvbDefaultAuthorityDescriptor = GUID(0x5ec24d1, 0x3a31, 0x44e7, [0xb4, 0x8, 0x67, 0xc6, 0xa, 0x35, 0x22, 0x76]);
interface IDvbDefaultAuthorityDescriptor : IUnknown
{
    HRESULT GetTag(ubyte*);
    HRESULT GetLength(ubyte*);
    HRESULT GetDefaultAuthority(ubyte*, ubyte**);
}
enum IID_IDvbSatelliteDeliverySystemDescriptor = GUID(0x2f2225a, 0x805b, 0x4ec5, [0xa9, 0xa6, 0xf9, 0xb5, 0x91, 0x3c, 0xd4, 0x70]);
interface IDvbSatelliteDeliverySystemDescriptor : IUnknown
{
    HRESULT GetTag(ubyte*);
    HRESULT GetLength(ubyte*);
    HRESULT GetFrequency(uint*);
    HRESULT GetOrbitalPosition(ushort*);
    HRESULT GetWestEastFlag(ubyte*);
    HRESULT GetPolarization(ubyte*);
    HRESULT GetModulation(ubyte*);
    HRESULT GetSymbolRate(uint*);
    HRESULT GetFECInner(ubyte*);
}
enum IID_IDvbCableDeliverySystemDescriptor = GUID(0xdfb98e36, 0x9e1a, 0x4862, [0x99, 0x46, 0x99, 0x3a, 0x4e, 0x59, 0x1, 0x7b]);
interface IDvbCableDeliverySystemDescriptor : IUnknown
{
    HRESULT GetTag(ubyte*);
    HRESULT GetLength(ubyte*);
    HRESULT GetFrequency(uint*);
    HRESULT GetFECOuter(ubyte*);
    HRESULT GetModulation(ubyte*);
    HRESULT GetSymbolRate(uint*);
    HRESULT GetFECInner(ubyte*);
}
enum IID_IDvbTerrestrialDeliverySystemDescriptor = GUID(0xed7e1b91, 0xd12e, 0x420c, [0xb4, 0x1d, 0xa4, 0x9d, 0x84, 0xfe, 0x18, 0x23]);
interface IDvbTerrestrialDeliverySystemDescriptor : IUnknown
{
    HRESULT GetTag(ubyte*);
    HRESULT GetLength(ubyte*);
    HRESULT GetCentreFrequency(uint*);
    HRESULT GetBandwidth(ubyte*);
    HRESULT GetConstellation(ubyte*);
    HRESULT GetHierarchyInformation(ubyte*);
    HRESULT GetCodeRateHPStream(ubyte*);
    HRESULT GetCodeRateLPStream(ubyte*);
    HRESULT GetGuardInterval(ubyte*);
    HRESULT GetTransmissionMode(ubyte*);
    HRESULT GetOtherFrequencyFlag(ubyte*);
}
enum IID_IDvbTerrestrial2DeliverySystemDescriptor = GUID(0x20ee9be9, 0xcd57, 0x49ab, [0x8f, 0x6e, 0x1d, 0x7, 0xae, 0xb8, 0xe4, 0x82]);
interface IDvbTerrestrial2DeliverySystemDescriptor : IUnknown
{
    HRESULT GetTag(ubyte*);
    HRESULT GetLength(ubyte*);
    HRESULT GetTagExtension(ubyte*);
    HRESULT GetCentreFrequency(uint*);
    HRESULT GetPLPId(ubyte*);
    HRESULT GetT2SystemId(ushort*);
    HRESULT GetMultipleInputMode(ubyte*);
    HRESULT GetBandwidth(ubyte*);
    HRESULT GetGuardInterval(ubyte*);
    HRESULT GetTransmissionMode(ubyte*);
    HRESULT GetCellId(ushort*);
    HRESULT GetOtherFrequencyFlag(ubyte*);
    HRESULT GetTFSFlag(ubyte*);
}
enum IID_IDvbFrequencyListDescriptor = GUID(0x1cadb613, 0xe1dd, 0x4512, [0xaf, 0xa8, 0xbb, 0x7a, 0x0, 0x7e, 0xf8, 0xb1]);
interface IDvbFrequencyListDescriptor : IUnknown
{
    HRESULT GetTag(ubyte*);
    HRESULT GetLength(ubyte*);
    HRESULT GetCodingType(ubyte*);
    HRESULT GetCountOfRecords(ubyte*);
    HRESULT GetRecordCentreFrequency(ubyte, uint*);
}
enum IID_IDvbPrivateDataSpecifierDescriptor = GUID(0x5660a019, 0xe75a, 0x4b82, [0x9b, 0x4c, 0xed, 0x22, 0x56, 0xd1, 0x65, 0xa2]);
interface IDvbPrivateDataSpecifierDescriptor : IUnknown
{
    HRESULT GetTag(ubyte*);
    HRESULT GetLength(ubyte*);
    HRESULT GetPrivateDataSpecifier(uint*);
}
enum IID_IDvbLogicalChannelDescriptor = GUID(0xcf1edaff, 0x3ffd, 0x4cf7, [0x82, 0x1, 0x35, 0x75, 0x6a, 0xcb, 0xf8, 0x5f]);
interface IDvbLogicalChannelDescriptor : IUnknown
{
    HRESULT GetTag(ubyte*);
    HRESULT GetLength(ubyte*);
    HRESULT GetCountOfRecords(ubyte*);
    HRESULT GetRecordServiceId(ubyte, ushort*);
    HRESULT GetRecordLogicalChannelNumber(ubyte, ushort*);
}
enum IID_IDvbLogicalChannelDescriptor2 = GUID(0x43aca974, 0x4be8, 0x4b98, [0xbc, 0x17, 0x9e, 0xaf, 0xd7, 0x88, 0xb1, 0xd7]);
interface IDvbLogicalChannelDescriptor2 : IDvbLogicalChannelDescriptor
{
    HRESULT GetRecordLogicalChannelAndVisibility(ubyte, ushort*);
}
enum IID_IDvbLogicalChannel2Descriptor = GUID(0xf69c3747, 0x8a30, 0x4980, [0x99, 0x8c, 0x1, 0xfe, 0x7f, 0xb, 0xa3, 0x5a]);
interface IDvbLogicalChannel2Descriptor : IDvbLogicalChannelDescriptor2
{
    HRESULT GetCountOfLists(ubyte*);
    HRESULT GetListId(ubyte, ubyte*);
    HRESULT GetListNameW(ubyte, DVB_STRCONV_MODE, BSTR*);
    HRESULT GetListCountryCode(ubyte, ubyte*);
    HRESULT GetListCountOfRecords(ubyte, ubyte*);
    HRESULT GetListRecordServiceId(ubyte, ubyte, ushort*);
    HRESULT GetListRecordLogicalChannelNumber(ubyte, ubyte, ushort*);
    HRESULT GetListRecordLogicalChannelAndVisibility(ubyte, ubyte, ushort*);
}
enum IID_IDvbHDSimulcastLogicalChannelDescriptor = GUID(0x1ea8b738, 0xa307, 0x4680, [0x9e, 0x26, 0xd0, 0xa9, 0x8, 0xc8, 0x24, 0xf4]);
interface IDvbHDSimulcastLogicalChannelDescriptor : IDvbLogicalChannelDescriptor2
{
}
enum IID_IDvbDataBroadcastIDDescriptor = GUID(0x5f26f518, 0x65c8, 0x4048, [0x91, 0xf2, 0x92, 0x90, 0xf5, 0x9f, 0x7b, 0x90]);
interface IDvbDataBroadcastIDDescriptor : IUnknown
{
    HRESULT GetTag(ubyte*);
    HRESULT GetLength(ubyte*);
    HRESULT GetDataBroadcastID(ushort*);
    HRESULT GetIDSelectorBytes(ubyte*, ubyte*);
}
enum IID_IDvbDataBroadcastDescriptor = GUID(0xd1ebc1d6, 0x8b60, 0x4c20, [0x9c, 0xaf, 0xe5, 0x93, 0x82, 0xe7, 0xc4, 0x0]);
interface IDvbDataBroadcastDescriptor : IUnknown
{
    HRESULT GetTag(ubyte*);
    HRESULT GetLength(ubyte*);
    HRESULT GetDataBroadcastID(ushort*);
    HRESULT GetComponentTag(ubyte*);
    HRESULT GetSelectorLength(ubyte*);
    HRESULT GetSelectorBytes(ubyte*, ubyte*);
    HRESULT GetLangID(uint*);
    HRESULT GetTextLength(ubyte*);
    HRESULT GetText(ubyte*, ubyte*);
}
alias DESC_LINKAGE_TYPE = int;
enum : int
{
    DESC_LINKAGE_RESERVED0               = 0x00000000,
    DESC_LINKAGE_INFORMATION             = 0x00000001,
    DESC_LINKAGE_EPG                     = 0x00000002,
    DESC_LINKAGE_CA_REPLACEMENT          = 0x00000003,
    DESC_LINKAGE_COMPLETE_NET_BOUQUET_SI = 0x00000004,
    DESC_LINKAGE_REPLACEMENT             = 0x00000005,
    DESC_LINKAGE_DATA                    = 0x00000006,
    DESC_LINKAGE_RESERVED1               = 0x00000007,
    DESC_LINKAGE_USER                    = 0x00000008,
    DESC_LINKAGE_RESERVED2               = 0x000000ff,
}

enum IID_IDvbLinkageDescriptor = GUID(0x1cdf8b31, 0x994a, 0x46fc, [0xac, 0xfd, 0x6a, 0x6b, 0xe8, 0x93, 0x4d, 0xd5]);
interface IDvbLinkageDescriptor : IUnknown
{
    HRESULT GetTag(ubyte*);
    HRESULT GetLength(ubyte*);
    HRESULT GetTSId(ushort*);
    HRESULT GetONId(ushort*);
    HRESULT GetServiceId(ushort*);
    HRESULT GetLinkageType(ubyte*);
    HRESULT GetPrivateDataLength(ubyte*);
    HRESULT GetPrivateData(ubyte*, ubyte*);
}
enum IID_IDvbTeletextDescriptor = GUID(0x9cd29d47, 0x69c6, 0x4f92, [0x98, 0xa9, 0x21, 0xa, 0xf1, 0xb7, 0x30, 0x3a]);
interface IDvbTeletextDescriptor : IUnknown
{
    HRESULT GetTag(ubyte*);
    HRESULT GetLength(ubyte*);
    HRESULT GetCountOfRecords(ubyte*);
    HRESULT GetRecordLangId(ubyte, uint*);
    HRESULT GetRecordTeletextType(ubyte, ubyte*);
    HRESULT GetRecordMagazineNumber(ubyte, ubyte*);
    HRESULT GetRecordPageNumber(ubyte, ubyte*);
}
enum IID_IDvbSubtitlingDescriptor = GUID(0x9b25fe1d, 0xfa23, 0x4e50, [0x97, 0x84, 0x6d, 0xf8, 0xb2, 0x6f, 0x8a, 0x49]);
interface IDvbSubtitlingDescriptor : IUnknown
{
    HRESULT GetTag(ubyte*);
    HRESULT GetLength(ubyte*);
    HRESULT GetCountOfRecords(ubyte*);
    HRESULT GetRecordLangId(ubyte, uint*);
    HRESULT GetRecordSubtitlingType(ubyte, ubyte*);
    HRESULT GetRecordCompositionPageID(ubyte, ushort*);
    HRESULT GetRecordAncillaryPageID(ubyte, ushort*);
}
enum IID_IDvbServiceDescriptor = GUID(0xf9c7fbcf, 0xe2d6, 0x464d, [0xb3, 0x2d, 0x2e, 0xf5, 0x26, 0xe4, 0x92, 0x90]);
interface IDvbServiceDescriptor : IUnknown
{
    HRESULT GetTag(ubyte*);
    HRESULT GetLength(ubyte*);
    HRESULT GetServiceType(ubyte*);
    HRESULT GetServiceProviderName(ubyte**);
    HRESULT GetServiceProviderNameW(BSTR*);
    HRESULT GetServiceName(ubyte**);
    HRESULT GetProcessedServiceName(BSTR*);
    HRESULT GetServiceNameEmphasized(BSTR*);
}
enum IID_IDvbServiceDescriptor2 = GUID(0xd6c76506, 0x85ab, 0x487c, [0x9b, 0x2b, 0x36, 0x41, 0x65, 0x11, 0xe4, 0xa2]);
interface IDvbServiceDescriptor2 : IDvbServiceDescriptor
{
    HRESULT GetServiceProviderNameW(DVB_STRCONV_MODE, BSTR*);
    HRESULT GetServiceNameW(DVB_STRCONV_MODE, BSTR*);
}
enum IID_IDvbServiceListDescriptor = GUID(0x5db0d8f, 0x6008, 0x491a, [0xac, 0xd3, 0x70, 0x90, 0x95, 0x27, 0x7, 0xd0]);
interface IDvbServiceListDescriptor : IUnknown
{
    HRESULT GetTag(ubyte*);
    HRESULT GetLength(ubyte*);
    HRESULT GetCountOfRecords(ubyte*);
    HRESULT GetRecordServiceId(ubyte, ushort*);
    HRESULT GetRecordServiceType(ubyte, ubyte*);
}
enum IID_IDvbMultilingualServiceNameDescriptor = GUID(0x2d80433b, 0xb32c, 0x47ef, [0x98, 0x7f, 0xe7, 0x8e, 0xbb, 0x77, 0x3e, 0x34]);
interface IDvbMultilingualServiceNameDescriptor : IUnknown
{
    HRESULT GetTag(ubyte*);
    HRESULT GetLength(ubyte*);
    HRESULT GetCountOfRecords(ubyte*);
    HRESULT GetRecordLangId(ubyte, uint*);
    HRESULT GetRecordServiceProviderNameW(ubyte, DVB_STRCONV_MODE, BSTR*);
    HRESULT GetRecordServiceNameW(ubyte, DVB_STRCONV_MODE, BSTR*);
}
enum IID_IDvbNetworkNameDescriptor = GUID(0x5b2a80cf, 0x35b9, 0x446c, [0xb3, 0xe4, 0x4, 0x8b, 0x76, 0x1d, 0xbc, 0x51]);
interface IDvbNetworkNameDescriptor : IUnknown
{
    HRESULT GetTag(ubyte*);
    HRESULT GetLength(ubyte*);
    HRESULT GetNetworkName(ubyte**);
    HRESULT GetNetworkNameW(DVB_STRCONV_MODE, BSTR*);
}
enum IID_IDvbShortEventDescriptor = GUID(0xb170be92, 0x5b75, 0x458e, [0x9c, 0x6e, 0xb0, 0x0, 0x82, 0x31, 0x49, 0x1a]);
interface IDvbShortEventDescriptor : IUnknown
{
    HRESULT GetTag(ubyte*);
    HRESULT GetLength(ubyte*);
    HRESULT GetLanguageCode(ubyte*);
    HRESULT GetEventNameW(DVB_STRCONV_MODE, BSTR*);
    HRESULT GetTextW(DVB_STRCONV_MODE, BSTR*);
}
enum IID_IDvbExtendedEventDescriptor = GUID(0xc9b22eca, 0x85f4, 0x499f, [0xb1, 0xdb, 0xef, 0xa9, 0x3a, 0x91, 0xee, 0x57]);
interface IDvbExtendedEventDescriptor : IUnknown
{
    HRESULT GetTag(ubyte*);
    HRESULT GetLength(ubyte*);
    HRESULT GetDescriptorNumber(ubyte*);
    HRESULT GetLastDescriptorNumber(ubyte*);
    HRESULT GetLanguageCode(ubyte*);
    HRESULT GetCountOfRecords(ubyte*);
    HRESULT GetRecordItemW(ubyte, DVB_STRCONV_MODE, BSTR*, BSTR*);
    HRESULT GetConcatenatedItemW(IDvbExtendedEventDescriptor, DVB_STRCONV_MODE, BSTR*, BSTR*);
    HRESULT GetTextW(DVB_STRCONV_MODE, BSTR*);
    HRESULT GetConcatenatedTextW(IDvbExtendedEventDescriptor, DVB_STRCONV_MODE, BSTR*);
    HRESULT GetRecordItemRawBytes(ubyte, ubyte**, ubyte*);
}
enum IID_IDvbComponentDescriptor = GUID(0x91e405cf, 0x80e7, 0x457f, [0x90, 0x96, 0x1b, 0x9d, 0x1c, 0xe3, 0x21, 0x41]);
interface IDvbComponentDescriptor : IUnknown
{
    HRESULT GetTag(ubyte*);
    HRESULT GetLength(ubyte*);
    HRESULT GetStreamContent(ubyte*);
    HRESULT GetComponentType(ubyte*);
    HRESULT GetComponentTag(ubyte*);
    HRESULT GetLanguageCode(ubyte*);
    HRESULT GetTextW(DVB_STRCONV_MODE, BSTR*);
}
enum IID_IDvbContentDescriptor = GUID(0x2e883881, 0xa467, 0x412a, [0x9d, 0x63, 0x6f, 0x2b, 0x6d, 0xa0, 0x5b, 0xf0]);
interface IDvbContentDescriptor : IUnknown
{
    HRESULT GetTag(ubyte*);
    HRESULT GetLength(ubyte*);
    HRESULT GetCountOfRecords(ubyte*);
    HRESULT GetRecordContentNibbles(ubyte, ubyte*, ubyte*);
    HRESULT GetRecordUserNibbles(ubyte, ubyte*, ubyte*);
}
enum IID_IDvbParentalRatingDescriptor = GUID(0x3ad9dde1, 0xfb1b, 0x4186, [0x93, 0x7f, 0x22, 0xe6, 0xb5, 0xa7, 0x2a, 0x10]);
interface IDvbParentalRatingDescriptor : IUnknown
{
    HRESULT GetTag(ubyte*);
    HRESULT GetLength(ubyte*);
    HRESULT GetCountOfRecords(ubyte*);
    HRESULT GetRecordRating(ubyte, ubyte*, ubyte*);
}
enum IID_IIsdbTerrestrialDeliverySystemDescriptor = GUID(0x39fae0a6, 0xd151, 0x44dd, [0xa2, 0x8a, 0x76, 0x5d, 0xe5, 0x99, 0x16, 0x70]);
interface IIsdbTerrestrialDeliverySystemDescriptor : IUnknown
{
    HRESULT GetTag(ubyte*);
    HRESULT GetLength(ubyte*);
    HRESULT GetAreaCode(ushort*);
    HRESULT GetGuardInterval(ubyte*);
    HRESULT GetTransmissionMode(ubyte*);
    HRESULT GetCountOfRecords(ubyte*);
    HRESULT GetRecordFrequency(ubyte, uint*);
}
enum IID_IIsdbTSInformationDescriptor = GUID(0xd7ad183e, 0x38f5, 0x4210, [0xb5, 0x5f, 0xec, 0x8d, 0x60, 0x1b, 0xbd, 0x47]);
interface IIsdbTSInformationDescriptor : IUnknown
{
    HRESULT GetTag(ubyte*);
    HRESULT GetLength(ubyte*);
    HRESULT GetRemoteControlKeyId(ubyte*);
    HRESULT GetTSNameW(DVB_STRCONV_MODE, BSTR*);
    HRESULT GetCountOfRecords(ubyte*);
    HRESULT GetRecordTransmissionTypeInfo(ubyte, ubyte*);
    HRESULT GetRecordNumberOfServices(ubyte, ubyte*);
    HRESULT GetRecordServiceIdByIndex(ubyte, ubyte, ushort*);
}
enum IID_IIsdbDigitalCopyControlDescriptor = GUID(0x1a28417e, 0x266a, 0x4bb8, [0xa4, 0xbd, 0xd7, 0x82, 0xbc, 0xfb, 0x81, 0x61]);
interface IIsdbDigitalCopyControlDescriptor : IUnknown
{
    HRESULT GetTag(ubyte*);
    HRESULT GetLength(ubyte*);
    HRESULT GetCopyControl(ubyte*, ubyte*, ubyte*, ubyte*);
    HRESULT GetCountOfRecords(ubyte*);
    HRESULT GetRecordCopyControl(ubyte, ubyte*, ubyte*, ubyte*, ubyte*, ubyte*);
}
enum IID_IIsdbAudioComponentDescriptor = GUID(0x679d2002, 0x2425, 0x4be4, [0xa4, 0xc7, 0xd6, 0x63, 0x2a, 0x57, 0x4f, 0x4d]);
interface IIsdbAudioComponentDescriptor : IUnknown
{
    HRESULT GetTag(ubyte*);
    HRESULT GetLength(ubyte*);
    HRESULT GetStreamContent(ubyte*);
    HRESULT GetComponentType(ubyte*);
    HRESULT GetComponentTag(ubyte*);
    HRESULT GetStreamType(ubyte*);
    HRESULT GetSimulcastGroupTag(ubyte*);
    HRESULT GetESMultiLingualFlag(BOOL*);
    HRESULT GetMainComponentFlag(BOOL*);
    HRESULT GetQualityIndicator(ubyte*);
    HRESULT GetSamplingRate(ubyte*);
    HRESULT GetLanguageCode(ubyte*);
    HRESULT GetLanguageCode2(ubyte*);
    HRESULT GetTextW(DVB_STRCONV_MODE, BSTR*);
}
enum IID_IIsdbDataContentDescriptor = GUID(0xa428100a, 0xe646, 0x4bd6, [0xaa, 0x14, 0x60, 0x87, 0xbd, 0xc0, 0x8c, 0xd5]);
interface IIsdbDataContentDescriptor : IUnknown
{
    HRESULT GetTag(ubyte*);
    HRESULT GetLength(ubyte*);
    HRESULT GetDataComponentId(ushort*);
    HRESULT GetEntryComponent(ubyte*);
    HRESULT GetSelectorLength(ubyte*);
    HRESULT GetSelectorBytes(ubyte, ubyte*);
    HRESULT GetCountOfRecords(ubyte*);
    HRESULT GetRecordComponentRef(ubyte, ubyte*);
    HRESULT GetLanguageCode(ubyte*);
    HRESULT GetTextW(DVB_STRCONV_MODE, BSTR*);
}
enum IID_IIsdbCAContractInformationDescriptor = GUID(0x8e18b25, 0xa28f, 0x4e92, [0x82, 0x1e, 0x4f, 0xce, 0xd5, 0xcc, 0x22, 0x91]);
interface IIsdbCAContractInformationDescriptor : IUnknown
{
    HRESULT GetTag(ubyte*);
    HRESULT GetLength(ubyte*);
    HRESULT GetCASystemId(ushort*);
    HRESULT GetCAUnitId(ubyte*);
    HRESULT GetCountOfRecords(ubyte*);
    HRESULT GetRecordComponentTag(ubyte, ubyte*);
    HRESULT GetContractVerificationInfoLength(ubyte*);
    HRESULT GetContractVerificationInfo(ubyte, ubyte*);
    HRESULT GetFeeNameW(DVB_STRCONV_MODE, BSTR*);
}
enum IID_IIsdbEventGroupDescriptor = GUID(0x94b06780, 0x2e2a, 0x44dc, [0xa9, 0x66, 0xcc, 0x56, 0xfd, 0xab, 0xc6, 0xc2]);
interface IIsdbEventGroupDescriptor : IUnknown
{
    HRESULT GetTag(ubyte*);
    HRESULT GetLength(ubyte*);
    HRESULT GetGroupType(ubyte*);
    HRESULT GetCountOfRecords(ubyte*);
    HRESULT GetRecordEvent(ubyte, ushort*, ushort*);
    HRESULT GetCountOfRefRecords(ubyte*);
    HRESULT GetRefRecordEvent(ubyte, ushort*, ushort*, ushort*, ushort*);
}
enum IID_IIsdbComponentGroupDescriptor = GUID(0xa494f17f, 0xc592, 0x47d8, [0x89, 0x43, 0x64, 0xc9, 0xa3, 0x4b, 0xe7, 0xb9]);
interface IIsdbComponentGroupDescriptor : IUnknown
{
    HRESULT GetTag(ubyte*);
    HRESULT GetLength(ubyte*);
    HRESULT GetComponentGroupType(ubyte*);
    HRESULT GetCountOfRecords(ubyte*);
    HRESULT GetRecordGroupId(ubyte, ubyte*);
    HRESULT GetRecordNumberOfCAUnit(ubyte, ubyte*);
    HRESULT GetRecordCAUnitCAUnitId(ubyte, ubyte, ubyte*);
    HRESULT GetRecordCAUnitNumberOfComponents(ubyte, ubyte, ubyte*);
    HRESULT GetRecordCAUnitComponentTag(ubyte, ubyte, ubyte, ubyte*);
    HRESULT GetRecordTotalBitRate(ubyte, ubyte*);
    HRESULT GetRecordTextW(ubyte, DVB_STRCONV_MODE, BSTR*);
}
enum IID_IIsdbSeriesDescriptor = GUID(0x7ef6370, 0x1660, 0x4f26, [0x87, 0xfc, 0x61, 0x4a, 0xda, 0xb2, 0x4b, 0x11]);
interface IIsdbSeriesDescriptor : IUnknown
{
    HRESULT GetTag(ubyte*);
    HRESULT GetLength(ubyte*);
    HRESULT GetSeriesId(ushort*);
    HRESULT GetRepeatLabel(ubyte*);
    HRESULT GetProgramPattern(ubyte*);
    HRESULT GetExpireDate(BOOL*, MPEG_DATE_AND_TIME*);
    HRESULT GetEpisodeNumber(ushort*);
    HRESULT GetLastEpisodeNumber(ushort*);
    HRESULT GetSeriesNameW(DVB_STRCONV_MODE, BSTR*);
}
enum IID_IIsdbDownloadContentDescriptor = GUID(0x5298661e, 0xcb88, 0x4f5f, [0xa1, 0xde, 0x5f, 0x44, 0xc, 0x18, 0x5b, 0x92]);
interface IIsdbDownloadContentDescriptor : IUnknown
{
    HRESULT GetTag(ubyte*);
    HRESULT GetLength(ubyte*);
    HRESULT GetFlags(BOOL*, BOOL*, BOOL*, BOOL*, BOOL*);
    HRESULT GetComponentSize(uint*);
    HRESULT GetDownloadId(uint*);
    HRESULT GetTimeOutValueDII(uint*);
    HRESULT GetLeakRate(uint*);
    HRESULT GetComponentTag(ubyte*);
    HRESULT GetCompatiblityDescriptorLength(ushort*);
    HRESULT GetCompatiblityDescriptor(ubyte**);
    HRESULT GetCountOfRecords(ushort*);
    HRESULT GetRecordModuleId(ushort, ushort*);
    HRESULT GetRecordModuleSize(ushort, uint*);
    HRESULT GetRecordModuleInfoLength(ushort, ubyte*);
    HRESULT GetRecordModuleInfo(ushort, ubyte**);
    HRESULT GetTextLanguageCode(ubyte*);
    HRESULT GetTextW(DVB_STRCONV_MODE, BSTR*);
}
enum IID_IIsdbLogoTransmissionDescriptor = GUID(0xe0103f49, 0x4ae1, 0x4f07, [0x90, 0x98, 0x75, 0x6d, 0xb1, 0xfa, 0x88, 0xcd]);
interface IIsdbLogoTransmissionDescriptor : IUnknown
{
    HRESULT GetTag(ubyte*);
    HRESULT GetLength(ubyte*);
    HRESULT GetLogoTransmissionType(ubyte*);
    HRESULT GetLogoId(ushort*);
    HRESULT GetLogoVersion(ushort*);
    HRESULT GetDownloadDataId(ushort*);
    HRESULT GetLogoCharW(DVB_STRCONV_MODE, BSTR*);
}
enum IID_IIsdbSIParameterDescriptor = GUID(0xf837dc36, 0x867c, 0x426a, [0x91, 0x11, 0xf6, 0x20, 0x93, 0x95, 0x1a, 0x45]);
interface IIsdbSIParameterDescriptor : IUnknown
{
    HRESULT GetTag(ubyte*);
    HRESULT GetLength(ubyte*);
    HRESULT GetParameterVersion(ubyte*);
    HRESULT GetUpdateTime(MPEG_DATE*);
    HRESULT GetRecordNumberOfTable(ubyte*);
    HRESULT GetTableId(ubyte, ubyte*);
    HRESULT GetTableDescriptionLength(ubyte, ubyte*);
    HRESULT GetTableDescriptionBytes(ubyte, ubyte*, ubyte*);
}
enum IID_IIsdbEmergencyInformationDescriptor = GUID(0xba6fa681, 0xb973, 0x4da1, [0x92, 0x7, 0xac, 0x3e, 0x7f, 0x3, 0x41, 0xeb]);
interface IIsdbEmergencyInformationDescriptor : IUnknown
{
    HRESULT GetTag(ubyte*);
    HRESULT GetLength(ubyte*);
    HRESULT GetCountOfRecords(ubyte*);
    HRESULT GetServiceId(ubyte, ushort*);
    HRESULT GetStartEndFlag(ubyte, ubyte*);
    HRESULT GetSignalLevel(ubyte, ubyte*);
    HRESULT GetAreaCode(ubyte, ushort**, ubyte*);
}
enum IID_IIsdbCADescriptor = GUID(0x570aa47, 0x52bc, 0x42ae, [0x8c, 0xa5, 0x96, 0x9f, 0x41, 0xe8, 0x1a, 0xea]);
interface IIsdbCADescriptor : IUnknown
{
    HRESULT GetTag(ubyte*);
    HRESULT GetLength(ubyte*);
    HRESULT GetCASystemId(ushort*);
    HRESULT GetReservedBits(ubyte*);
    HRESULT GetCAPID(ushort*);
    HRESULT GetPrivateDataBytes(ubyte*, ubyte*);
}
enum IID_IIsdbCAServiceDescriptor = GUID(0x39cbeb97, 0xff0b, 0x42a7, [0x9a, 0xb9, 0x7b, 0x9c, 0xfe, 0x70, 0xa7, 0x7a]);
interface IIsdbCAServiceDescriptor : IUnknown
{
    HRESULT GetTag(ubyte*);
    HRESULT GetLength(ubyte*);
    HRESULT GetCASystemId(ushort*);
    HRESULT GetCABroadcasterGroupId(ubyte*);
    HRESULT GetMessageControl(ubyte*);
    HRESULT GetServiceIds(ubyte*, ushort*);
}
enum IID_IIsdbHierarchicalTransmissionDescriptor = GUID(0xb7b3ae90, 0xee0b, 0x446d, [0x87, 0x69, 0xf7, 0xe2, 0xaa, 0x26, 0x6a, 0xa6]);
interface IIsdbHierarchicalTransmissionDescriptor : IUnknown
{
    HRESULT GetTag(ubyte*);
    HRESULT GetLength(ubyte*);
    HRESULT GetFutureUse1(ubyte*);
    HRESULT GetQualityLevel(ubyte*);
    HRESULT GetFutureUse2(ubyte*);
    HRESULT GetReferencePid(ushort*);
}
enum IID_IPBDASiParser = GUID(0x9de49a74, 0xaba2, 0x4a18, [0x93, 0xe1, 0x21, 0xf1, 0x7f, 0x95, 0xc3, 0xc3]);
interface IPBDASiParser : IUnknown
{
    HRESULT Initialize(IUnknown);
    HRESULT GetEIT(uint, ubyte*, IPBDA_EIT*);
    HRESULT GetServices(uint, const(ubyte)*, IPBDA_Services*);
}
enum IID_IPBDA_EIT = GUID(0xa35f2dea, 0x98f, 0x4ebd, [0x98, 0x4c, 0x2b, 0xd4, 0xc3, 0xc8, 0xce, 0xa]);
interface IPBDA_EIT : IUnknown
{
    HRESULT Initialize(uint, const(ubyte)*);
    HRESULT GetTableId(ubyte*);
    HRESULT GetVersionNumber(ushort*);
    HRESULT GetServiceIdx(ulong*);
    HRESULT GetCountOfRecords(uint*);
    HRESULT GetRecordEventId(uint, ulong*);
    HRESULT GetRecordStartTime(uint, MPEG_DATE_AND_TIME*);
    HRESULT GetRecordDuration(uint, MPEG_TIME*);
    HRESULT GetRecordCountOfDescriptors(uint, uint*);
    HRESULT GetRecordDescriptorByIndex(uint, uint, IGenericDescriptor*);
    HRESULT GetRecordDescriptorByTag(uint, ubyte, uint*, IGenericDescriptor*);
}
enum IID_IPBDA_Services = GUID(0x944eab37, 0xeed4, 0x4850, [0xaf, 0xd2, 0x77, 0xe7, 0xef, 0xeb, 0x44, 0x27]);
interface IPBDA_Services : IUnknown
{
    HRESULT Initialize(uint, ubyte*);
    HRESULT GetCountOfRecords(uint*);
    HRESULT GetRecordByIndex(uint, ulong*);
}
enum IID_IPBDAEntitlementDescriptor = GUID(0x22632497, 0xde3, 0x4587, [0xaa, 0xdc, 0xd8, 0xd9, 0x90, 0x17, 0xe7, 0x60]);
interface IPBDAEntitlementDescriptor : IUnknown
{
    HRESULT GetTag(ubyte*);
    HRESULT GetLength(ushort*);
    HRESULT GetToken(ubyte**, uint*);
}
enum IID_IPBDAAttributesDescriptor = GUID(0x313b3620, 0x3263, 0x45a6, [0x95, 0x33, 0x96, 0x8b, 0xef, 0xbe, 0xac, 0x3]);
interface IPBDAAttributesDescriptor : IUnknown
{
    HRESULT GetTag(ubyte*);
    HRESULT GetLength(ushort*);
    HRESULT GetAttributePayload(ubyte**, uint*);
}
enum IID_IBDA_TIF_REGISTRATION = GUID(0xdfef4a68, 0xee61, 0x415f, [0x9c, 0xcb, 0xcd, 0x95, 0xf2, 0xf9, 0x8a, 0x3a]);
interface IBDA_TIF_REGISTRATION : IUnknown
{
    HRESULT RegisterTIFEx(IPin, uint*, IUnknown*);
    HRESULT UnregisterTIF(uint);
}
enum IID_IMPEG2_TIF_CONTROL = GUID(0xf9bac2f9, 0x4149, 0x4916, [0xb2, 0xef, 0xfa, 0xa2, 0x2, 0x32, 0x68, 0x62]);
interface IMPEG2_TIF_CONTROL : IUnknown
{
    HRESULT RegisterTIF(IUnknown, uint*);
    HRESULT UnregisterTIF(uint);
    HRESULT AddPIDs(uint, uint*);
    HRESULT DeletePIDs(uint, uint*);
    HRESULT GetPIDCount(uint*);
    HRESULT GetPIDs(uint*, uint*);
}
enum IID_ITuneRequestInfo = GUID(0xa3b152df, 0x7a90, 0x4218, [0xac, 0x54, 0x98, 0x30, 0xbe, 0xe8, 0xc0, 0xb6]);
interface ITuneRequestInfo : IUnknown
{
    HRESULT GetLocatorData(ITuneRequest);
    HRESULT GetComponentData(ITuneRequest);
    HRESULT CreateComponentList(ITuneRequest);
    HRESULT GetNextProgram(ITuneRequest, ITuneRequest*);
    HRESULT GetPreviousProgram(ITuneRequest, ITuneRequest*);
    HRESULT GetNextLocator(ITuneRequest, ITuneRequest*);
    HRESULT GetPreviousLocator(ITuneRequest, ITuneRequest*);
}
enum IID_ITuneRequestInfoEx = GUID(0xee957c52, 0xb0d0, 0x4e78, [0x8d, 0xd1, 0xb8, 0x7a, 0x8, 0xbf, 0xd8, 0x93]);
interface ITuneRequestInfoEx : ITuneRequestInfo
{
    HRESULT CreateComponentListEx(ITuneRequest, IUnknown*);
}
enum IID_ISIInbandEPGEvent = GUID(0x7e47913a, 0x5a89, 0x423d, [0x9a, 0x2b, 0xe1, 0x51, 0x68, 0x85, 0x89, 0x34]);
interface ISIInbandEPGEvent : IUnknown
{
    HRESULT SIObjectEvent(IDVB_EIT2, uint, uint);
}
enum IID_ISIInbandEPG = GUID(0xf90ad9d0, 0xb854, 0x4b68, [0x9c, 0xc1, 0xb2, 0xcc, 0x96, 0x11, 0x9d, 0x85]);
interface ISIInbandEPG : IUnknown
{
    HRESULT StartSIEPGScan();
    HRESULT StopSIEPGScan();
    HRESULT IsSIEPGScanRunning(BOOL*);
}
enum IID_IGuideDataEvent = GUID(0xefda0c80, 0xf395, 0x42c3, [0x9b, 0x3c, 0x56, 0xb3, 0x7d, 0xec, 0x7b, 0xb7]);
interface IGuideDataEvent : IUnknown
{
    HRESULT GuideDataAcquired();
    HRESULT ProgramChanged(VARIANT);
    HRESULT ServiceChanged(VARIANT);
    HRESULT ScheduleEntryChanged(VARIANT);
    HRESULT ProgramDeleted(VARIANT);
    HRESULT ServiceDeleted(VARIANT);
    HRESULT ScheduleDeleted(VARIANT);
}
enum IID_IGuideDataProperty = GUID(0x88ec5e58, 0xbb73, 0x41d6, [0x99, 0xce, 0x66, 0xc5, 0x24, 0xb8, 0xb5, 0x91]);
interface IGuideDataProperty : IUnknown
{
    HRESULT get_Name(BSTR*);
    HRESULT get_Language(int*);
    HRESULT get_Value(VARIANT*);
}
enum IID_IEnumGuideDataProperties = GUID(0xae44423b, 0x4571, 0x475c, [0xad, 0x2c, 0xf4, 0xa, 0x77, 0x1d, 0x80, 0xef]);
interface IEnumGuideDataProperties : IUnknown
{
    HRESULT Next(uint, IGuideDataProperty*, uint*);
    HRESULT Skip(uint);
    HRESULT Reset();
    HRESULT Clone(IEnumGuideDataProperties*);
}
enum IID_IEnumTuneRequests = GUID(0x1993299c, 0xced6, 0x4788, [0x87, 0xa3, 0x42, 0x0, 0x67, 0xdc, 0xe0, 0xc7]);
interface IEnumTuneRequests : IUnknown
{
    HRESULT Next(uint, ITuneRequest*, uint*);
    HRESULT Skip(uint);
    HRESULT Reset();
    HRESULT Clone(IEnumTuneRequests*);
}
enum IID_IGuideData = GUID(0x61571138, 0x5b01, 0x43cd, [0xae, 0xaf, 0x60, 0xb7, 0x84, 0xa0, 0xbf, 0x93]);
interface IGuideData : IUnknown
{
    HRESULT GetServices(IEnumTuneRequests*);
    HRESULT GetServiceProperties(ITuneRequest, IEnumGuideDataProperties*);
    HRESULT GetGuideProgramIDs(IEnumVARIANT*);
    HRESULT GetProgramProperties(VARIANT, IEnumGuideDataProperties*);
    HRESULT GetScheduleEntryIDs(IEnumVARIANT*);
    HRESULT GetScheduleEntryProperties(VARIANT, IEnumGuideDataProperties*);
}
enum IID_IGuideDataLoader = GUID(0x4764ff7c, 0xfa95, 0x4525, [0xaf, 0x4d, 0xd3, 0x22, 0x36, 0xdb, 0x9e, 0x38]);
interface IGuideDataLoader : IUnknown
{
    HRESULT Init(IGuideData);
    HRESULT Terminate();
}
enum CLSID_TIFLoad = GUID(0x14eb8748, 0x1753, 0x4393, [0x95, 0xae, 0x4f, 0x7e, 0x7a, 0x87, 0xaa, 0xd6]);
struct TIFLoad
{
}
struct KSP_BDA_NODE_PIN
{
    KSIDENTIFIER Property;
    uint ulNodeType;
    uint ulInputPinId;
    uint ulOutputPinId;
}
struct KSM_BDA_PIN
{
    KSIDENTIFIER Method;
    union
    {
        uint PinId;
        uint PinType;
    }
    uint Reserved;
}
struct KSM_BDA_PIN_PAIR
{
    KSIDENTIFIER Method;
    union
    {
        uint InputPinId;
        uint InputPinType;
    }
    union
    {
        uint OutputPinId;
        uint OutputPinType;
    }
}
struct KSP_NODE_ESPID
{
    KSP_NODE Property;
    uint EsPid;
}
struct KSM_BDA_DEBUG_LEVEL
{
    KSIDENTIFIER Method;
    ubyte ucDebugLevel;
    uint ulDebugStringSize;
    ubyte[1] argbDebugString;
}
struct BDA_DEBUG_DATA
{
    int lResult;
    GUID uuidDebugDataType;
    uint ulDataSize;
    ubyte[1] argbDebugData;
}
struct BDA_EVENT_DATA
{
    int lResult;
    uint ulEventID;
    GUID uuidEventType;
    uint ulEventDataLength;
    ubyte[1] argbEventData;
}
struct KSM_BDA_EVENT_COMPLETE
{
    KSIDENTIFIER Method;
    uint ulEventID;
    uint ulEventResult;
}
struct KSM_BDA_DRM_SETDRM
{
    KSM_NODE NodeMethod;
    GUID NewDRMuuid;
}
struct KSM_BDA_BUFFER
{
    KSM_NODE NodeMethod;
    uint ulBufferSize;
    ubyte[1] argbBuffer;
}
struct KSM_BDA_WMDRM_LICENSE
{
    KSM_NODE NodeMethod;
    GUID uuidKeyID;
}
struct KSM_BDA_WMDRM_RENEWLICENSE
{
    KSM_NODE NodeMethod;
    uint ulXMRLicenseLength;
    uint ulEntitlementTokenLength;
    ubyte[1] argbDataBuffer;
}
struct KSM_BDA_WMDRMTUNER_PURCHASEENTITLEMENT
{
    KSM_NODE NodeMethod;
    uint ulDialogRequest;
    CHAR[12] cLanguage;
    uint ulPurchaseTokenLength;
    ubyte[1] argbDataBuffer;
}
struct KSM_BDA_WMDRMTUNER_SETPIDPROTECTION
{
    KSM_NODE NodeMethod;
    uint ulPID;
    GUID uuidKeyID;
}
struct KSM_BDA_WMDRMTUNER_GETPIDPROTECTION
{
    KSM_NODE NodeMethod;
    uint ulPID;
}
struct KSM_BDA_WMDRMTUNER_SYNCVALUE
{
    KSM_NODE NodeMethod;
    uint ulSyncValue;
}
struct KSM_BDA_TUNER_TUNEREQUEST
{
    KSIDENTIFIER Method;
    uint ulTuneLength;
    ubyte[1] argbTuneData;
}
struct KSM_BDA_GPNV_GETVALUE
{
    KSIDENTIFIER Method;
    uint ulNameLength;
    CHAR[12] cLanguage;
    ubyte[1] argbData;
}
struct KSM_BDA_GPNV_SETVALUE
{
    KSIDENTIFIER Method;
    uint ulDialogRequest;
    CHAR[12] cLanguage;
    uint ulNameLength;
    uint ulValueLength;
    ubyte[1] argbName;
}
struct KSM_BDA_GPNV_NAMEINDEX
{
    KSIDENTIFIER Method;
    uint ulValueNameIndex;
}
struct KSM_BDA_SCAN_CAPABILTIES
{
    KSIDENTIFIER Method;
    GUID uuidBroadcastStandard;
}
struct KSM_BDA_SCAN_FILTER
{
    KSIDENTIFIER Method;
    uint ulScanModulationTypeSize;
    ulong AnalogVideoStandards;
    ubyte[1] argbScanModulationTypes;
}
struct KSM_BDA_SCAN_START
{
    KSIDENTIFIER Method;
    uint LowerFrequency;
    uint HigherFrequency;
}
struct KSM_BDA_GDDS_TUNEXMLFROMIDX
{
    KSIDENTIFIER Method;
    ulong ulIdx;
}
struct KSM_BDA_GDDS_SERVICEFROMTUNEXML
{
    KSIDENTIFIER Method;
    uint ulTuneXmlLength;
    ubyte[1] argbTuneXml;
}
struct KSM_BDA_USERACTIVITY_USEREASON
{
    KSIDENTIFIER Method;
    uint ulUseReason;
}
struct KSM_BDA_CAS_ENTITLEMENTTOKEN
{
    KSM_NODE NodeMethod;
    uint ulDialogRequest;
    CHAR[12] cLanguage;
    uint ulRequestType;
    uint ulEntitlementTokenLen;
    ubyte[1] argbEntitlementToken;
}
struct KSM_BDA_CAS_CAPTURETOKEN
{
    KSM_NODE NodeMethod;
    uint ulTokenLength;
    ubyte[1] argbToken;
}
struct KSM_BDA_CAS_OPENBROADCASTMMI
{
    KSM_NODE NodeMethod;
    uint ulDialogRequest;
    CHAR[12] cLanguage;
    uint ulEventId;
}
struct KSM_BDA_CAS_CLOSEMMIDIALOG
{
    KSM_NODE NodeMethod;
    uint ulDialogRequest;
    CHAR[12] cLanguage;
    uint ulDialogNumber;
    uint ulReason;
}
struct KSM_BDA_ISDBCAS_REQUEST
{
    KSM_NODE NodeMethod;
    uint ulRequestID;
    uint ulIsdbCommandSize;
    ubyte[1] argbIsdbCommandData;
}
struct KSM_BDA_TS_SELECTOR_SETTSID
{
    KSM_NODE NodeMethod;
    ushort usTSID;
}
struct KS_DATARANGE_BDA_ANTENNA
{
    KSDATAFORMAT DataRange;
}
struct BDA_TRANSPORT_INFO
{
    uint ulcbPhyiscalPacket;
    uint ulcbPhyiscalFrame;
    uint ulcbPhyiscalFrameAlignment;
    long AvgTimePerFrame;
}
struct KS_DATARANGE_BDA_TRANSPORT
{
    KSDATAFORMAT DataRange;
    BDA_TRANSPORT_INFO BdaTransportInfo;
}
enum CLSID_EVENTID_TuningChanging = GUID(0x83183c03, 0xc09e, 0x45c4, [0xa7, 0x19, 0x80, 0x7a, 0x94, 0x95, 0x2b, 0xf9]);
struct EVENTID_TuningChanging
{
}
enum CLSID_EVENTID_TuningChanged = GUID(0x9d7e6235, 0x4b7d, 0x425d, [0xa6, 0xd1, 0xd7, 0x17, 0xc3, 0x3b, 0x9c, 0x4c]);
struct EVENTID_TuningChanged
{
}
enum CLSID_EVENTID_CandidatePostTuneData = GUID(0x9f02d3d0, 0x9f06, 0x4369, [0x9f, 0x1e, 0x3a, 0xd6, 0xca, 0x19, 0x80, 0x7e]);
struct EVENTID_CandidatePostTuneData
{
}
enum CLSID_EVENTID_CADenialCountChanged = GUID(0x2a65c528, 0x2249, 0x4070, [0xac, 0x16, 0x0, 0x39, 0xc, 0xdf, 0xb2, 0xdd]);
struct EVENTID_CADenialCountChanged
{
}
enum CLSID_EVENTID_SignalStatusChanged = GUID(0x6d9cfaf2, 0x702d, 0x4b01, [0x8d, 0xff, 0x68, 0x92, 0xad, 0x20, 0xd1, 0x91]);
struct EVENTID_SignalStatusChanged
{
}
enum CLSID_EVENTID_NewSignalAcquired = GUID(0xc87ec52d, 0xcd18, 0x404a, [0xa0, 0x76, 0xc0, 0x2a, 0x27, 0x3d, 0x3d, 0xe7]);
struct EVENTID_NewSignalAcquired
{
}
enum CLSID_EVENTID_EASMessageReceived = GUID(0xd10df9d5, 0xc261, 0x4b85, [0x9e, 0x8a, 0x51, 0x7b, 0x32, 0x99, 0xca, 0xb2]);
struct EVENTID_EASMessageReceived
{
}
enum CLSID_EVENTID_PSITable = GUID(0x1b9c3703, 0xd447, 0x4e16, [0x97, 0xbb, 0x1, 0x79, 0x9f, 0xc0, 0x31, 0xed]);
struct EVENTID_PSITable
{
}
enum CLSID_EVENTID_ServiceTerminated = GUID(0xa1d591c, 0xe0d2, 0x4f8e, [0x89, 0x60, 0x23, 0x35, 0xbe, 0xf4, 0x5c, 0xcb]);
struct EVENTID_ServiceTerminated
{
}
enum CLSID_EVENTID_CardStatusChanged = GUID(0xa265faea, 0xf874, 0x4b38, [0x9f, 0xf7, 0xc5, 0x3d, 0x2, 0x96, 0x99, 0x96]);
struct EVENTID_CardStatusChanged
{
}
enum CLSID_EVENTID_DRMParingStatusChanged = GUID(0x906f5, 0xf0d1, 0x41d6, [0xa7, 0xdf, 0x40, 0x28, 0x69, 0x76, 0x69, 0xf6]);
struct EVENTID_DRMParingStatusChanged
{
}
enum CLSID_EVENTID_DRMParingStepComplete = GUID(0x5b2ebf78, 0xb752, 0x4420, [0xb4, 0x1e, 0xa4, 0x72, 0xdc, 0x95, 0x82, 0x8e]);
struct EVENTID_DRMParingStepComplete
{
}
enum CLSID_EVENTID_MMIMessage = GUID(0x52c29af, 0x9a4, 0x4b93, [0x89, 0xf, 0xbd, 0x6a, 0x34, 0x89, 0x68, 0xa4]);
struct EVENTID_MMIMessage
{
}
enum CLSID_EVENTID_EntitlementChanged = GUID(0x9071ad5d, 0x2359, 0x4c95, [0x86, 0x94, 0xaf, 0xa8, 0x1d, 0x70, 0xbf, 0xd5]);
struct EVENTID_EntitlementChanged
{
}
enum CLSID_EVENTID_STBChannelNumber = GUID(0x17c4d730, 0xd0f0, 0x413a, [0x8c, 0x99, 0x50, 0x4, 0x69, 0xde, 0x35, 0xad]);
struct EVENTID_STBChannelNumber
{
}
enum CLSID_EVENTID_BDAEventingServicePendingEvent = GUID(0x5ca51711, 0x5ddc, 0x41a6, [0x94, 0x30, 0xe4, 0x1b, 0x8b, 0x3b, 0xbc, 0x5b]);
struct EVENTID_BDAEventingServicePendingEvent
{
}
enum CLSID_EVENTID_BDAConditionalAccessTAG = GUID(0xefc3a459, 0xae8b, 0x4b4a, [0x8f, 0xe9, 0x79, 0xa0, 0xd0, 0x97, 0xf3, 0xea]);
struct EVENTID_BDAConditionalAccessTAG
{
}
enum CLSID_EVENTTYPE_CASDescrambleFailureEvent = GUID(0xb2127d42, 0x7be5, 0x4f4b, [0x91, 0x30, 0x66, 0x79, 0x89, 0x9f, 0x4f, 0x4b]);
struct EVENTTYPE_CASDescrambleFailureEvent
{
}
enum CLSID_EVENTID_CASFailureSpanningEvent = GUID(0xead831ae, 0x5529, 0x4d1f, [0xaf, 0xce, 0xd, 0x8c, 0xd1, 0x25, 0x7d, 0x30]);
struct EVENTID_CASFailureSpanningEvent
{
}
alias ChannelChangeSpanningEvent_State = int;
enum : int
{
    ChannelChangeSpanningEvent_Start = 0x00000000,
    ChannelChangeSpanningEvent_End   = 0x00000002,
}

enum CLSID_EVENTID_ChannelChangeSpanningEvent = GUID(0x9067c5e5, 0x4c5c, 0x4205, [0x86, 0xc8, 0x7a, 0xfe, 0x20, 0xfe, 0x1e, 0xfa]);
struct EVENTID_ChannelChangeSpanningEvent
{
}
struct ChannelChangeInfo
{
    ChannelChangeSpanningEvent_State state;
    ulong TimeStamp;
}
enum CLSID_EVENTID_ChannelTypeSpanningEvent = GUID(0x72ab1d51, 0x87d2, 0x489b, [0xba, 0x11, 0xe, 0x8, 0xdc, 0x21, 0x2, 0x43]);
struct EVENTID_ChannelTypeSpanningEvent
{
}
alias ChannelType = int;
enum : int
{
    ChannelTypeNone        = 0x00000000,
    ChannelTypeOther       = 0x00000001,
    ChannelTypeVideo       = 0x00000002,
    ChannelTypeAudio       = 0x00000004,
    ChannelTypeText        = 0x00000008,
    ChannelTypeSubtitles   = 0x00000010,
    ChannelTypeCaptions    = 0x00000020,
    ChannelTypeSuperimpose = 0x00000040,
    ChannelTypeData        = 0x00000080,
}

struct ChannelTypeInfo
{
    ChannelType channelType;
    ulong timeStamp;
}
struct ChannelInfo
{
    int lFrequency;
    union
    {
        struct DVB
        {
            int lONID;
            int lTSID;
            int lSID;
        }
        struct DC
        {
            int lProgNumber;
        }
        struct ATSC
        {
            int lProgNumber;
        }
    }
}
enum CLSID_EVENTID_ChannelInfoSpanningEvent = GUID(0x41f36d80, 0x4132, 0x4cc2, [0xb1, 0x21, 0x1, 0xa4, 0x32, 0x19, 0xd8, 0x1b]);
struct EVENTID_ChannelInfoSpanningEvent
{
}
enum CLSID_EVENTID_RRTSpanningEvent = GUID(0xf6cfc8f4, 0xda93, 0x4f2f, [0xbf, 0xf8, 0xba, 0x1e, 0xe6, 0xfc, 0xa3, 0xa2]);
struct EVENTID_RRTSpanningEvent
{
}
struct SpanningEventDescriptor
{
    ushort wDataLen;
    ushort wProgNumber;
    ushort wSID;
    ubyte[1] bDescriptor;
}
enum CLSID_EVENTID_CSDescriptorSpanningEvent = GUID(0xefe779d9, 0x97f0, 0x4786, [0x80, 0xd, 0x95, 0xcf, 0x50, 0x5d, 0xdc, 0x66]);
struct EVENTID_CSDescriptorSpanningEvent
{
}
enum CLSID_EVENTID_CtxADescriptorSpanningEvent = GUID(0x3ab4a2e6, 0x4247, 0x4b34, [0x89, 0x6c, 0x30, 0xaf, 0xa5, 0xd2, 0x1c, 0x24]);
struct EVENTID_CtxADescriptorSpanningEvent
{
}
struct DVBScramblingControlSpanningEvent
{
    uint ulPID;
    BOOL fScrambled;
}
enum CLSID_EVENTID_DVBScramblingControlSpanningEvent = GUID(0x4bd4e1c4, 0x90a1, 0x4109, [0x82, 0x36, 0x27, 0xf0, 0xe, 0x7d, 0xcc, 0x5b]);
struct EVENTID_DVBScramblingControlSpanningEvent
{
}
alias SignalAndServiceStatusSpanningEvent_State = int;
enum : int
{
    SignalAndServiceStatusSpanningEvent_None           = 0xffffffff,
    SignalAndServiceStatusSpanningEvent_Clear          = 0x00000000,
    SignalAndServiceStatusSpanningEvent_NoTVSignal     = 0x00000001,
    SignalAndServiceStatusSpanningEvent_ServiceOffAir  = 0x00000002,
    SignalAndServiceStatusSpanningEvent_WeakTVSignal   = 0x00000003,
    SignalAndServiceStatusSpanningEvent_NoSubscription = 0x00000004,
    SignalAndServiceStatusSpanningEvent_AllAVScrambled = 0x00000005,
}

enum CLSID_EVENTID_SignalAndServiceStatusSpanningEvent = GUID(0x8068c5cb, 0x3c04, 0x492b, [0xb4, 0x7d, 0x3, 0x8, 0x82, 0xd, 0xce, 0x51]);
struct EVENTID_SignalAndServiceStatusSpanningEvent
{
}
struct SpanningEventEmmMessage
{
    ubyte bCAbroadcasterGroupId;
    ubyte bMessageControl;
    ushort wServiceId;
    ushort wTableIdExtension;
    ubyte bDeletionStatus;
    ubyte bDisplayingDuration1;
    ubyte bDisplayingDuration2;
    ubyte bDisplayingDuration3;
    ubyte bDisplayingCycle;
    ubyte bFormatVersion;
    ubyte bDisplayPosition;
    ushort wMessageLength;
    wchar[1] szMessageArea;
}
enum CLSID_EVENTID_EmmMessageSpanningEvent = GUID(0x6bf00268, 0x4f7e, 0x4294, [0xaa, 0x87, 0xe9, 0xe9, 0x53, 0xe4, 0x3f, 0x14]);
struct EVENTID_EmmMessageSpanningEvent
{
}
enum CLSID_EVENTID_AudioTypeSpanningEvent = GUID(0x501cbfbe, 0xb849, 0x42ce, [0x9b, 0xe9, 0x3d, 0xb8, 0x69, 0xfb, 0x82, 0xb3]);
struct EVENTID_AudioTypeSpanningEvent
{
}
enum CLSID_EVENTID_StreamTypeSpanningEvent = GUID(0x82af2ebc, 0x30a6, 0x4264, [0xa8, 0xb, 0xad, 0x2e, 0x13, 0x72, 0xac, 0x60]);
struct EVENTID_StreamTypeSpanningEvent
{
}
enum CLSID_EVENTID_ARIBcontentSpanningEvent = GUID(0x3a954083, 0x93d0, 0x463e, [0x90, 0xb2, 0x7, 0x42, 0xc4, 0x96, 0xed, 0xf0]);
struct EVENTID_ARIBcontentSpanningEvent
{
}
enum CLSID_EVENTID_LanguageSpanningEvent = GUID(0xe292666d, 0x9c02, 0x448d, [0xaa, 0x8d, 0x78, 0x1a, 0x93, 0xfd, 0xc3, 0x95]);
struct EVENTID_LanguageSpanningEvent
{
}
struct LanguageInfo
{
    ushort LangID;
    int lISOLangCode;
}
enum CLSID_EVENTID_DualMonoSpanningEvent = GUID(0xa9a29b56, 0xa84b, 0x488c, [0x89, 0xd5, 0xd, 0x4e, 0x76, 0x57, 0xc8, 0xce]);
struct EVENTID_DualMonoSpanningEvent
{
}
struct DualMonoInfo
{
    ushort LangID1;
    ushort LangID2;
    int lISOLangCode1;
    int lISOLangCode2;
}
enum CLSID_EVENTID_PIDListSpanningEvent = GUID(0x47fc8f65, 0xe2bb, 0x4634, [0x9c, 0xef, 0xfd, 0xbf, 0xe6, 0x26, 0x1d, 0x5c]);
struct EVENTID_PIDListSpanningEvent
{
}
struct PIDListSpanningEvent
{
    ushort wPIDCount;
    uint[1] pulPIDs;
}
enum CLSID_EVENTID_AudioDescriptorSpanningEvent = GUID(0x107bd41c, 0xa6da, 0x4691, [0x83, 0x69, 0x11, 0xb2, 0xcd, 0xaa, 0x28, 0x8e]);
struct EVENTID_AudioDescriptorSpanningEvent
{
}
enum CLSID_EVENTID_SubtitleSpanningEvent = GUID(0x5dcec048, 0xd0b9, 0x4163, [0x87, 0x2c, 0x4f, 0x32, 0x22, 0x3b, 0xe8, 0x8a]);
struct EVENTID_SubtitleSpanningEvent
{
}
enum CLSID_EVENTID_TeletextSpanningEvent = GUID(0x9599d950, 0x5f33, 0x4617, [0xaf, 0x7c, 0x1e, 0x54, 0xb5, 0x10, 0xda, 0xa3]);
struct EVENTID_TeletextSpanningEvent
{
}
enum CLSID_EVENTID_StreamIDSpanningEvent = GUID(0xcaf1ab68, 0xe153, 0x4d41, [0xa6, 0xb3, 0xa7, 0xc9, 0x98, 0xdb, 0x75, 0xee]);
struct EVENTID_StreamIDSpanningEvent
{
}
enum CLSID_EVENTID_PBDAParentalControlEvent = GUID(0xf947aa85, 0xfb52, 0x48e8, [0xb9, 0xc5, 0xe1, 0xe1, 0xf4, 0x11, 0xa5, 0x1a]);
struct EVENTID_PBDAParentalControlEvent
{
}
struct RATING_ATTRIBUTE
{
    align (1):
    uint rating_attribute_id;
    uint rating_attribute_value;
}
struct RATING_SYSTEM
{
    align (1):
    GUID rating_system_id;
    ubyte _bitfield0;
    ubyte[3] country_code;
    uint rating_attribute_count;
    RATING_ATTRIBUTE* lpratingattrib;
}
struct RATING_INFO
{
    align (1):
    uint rating_system_count;
    RATING_SYSTEM* lpratingsystem;
}
struct PBDAParentalControl
{
    align (1):
    uint rating_system_count;
    RATING_SYSTEM* rating_systems;
}
enum CLSID_EVENTID_TuneFailureEvent = GUID(0xd97287b2, 0x2dfd, 0x436a, [0x94, 0x85, 0x99, 0xd7, 0xd4, 0xab, 0x5a, 0x69]);
struct EVENTID_TuneFailureEvent
{
}
enum CLSID_EVENTID_TuneFailureSpanningEvent = GUID(0x6f8aa455, 0x5ee1, 0x48ab, [0xa2, 0x7c, 0x4c, 0x8d, 0x70, 0xb9, 0xae, 0xba]);
struct EVENTID_TuneFailureSpanningEvent
{
}
enum CLSID_EVENTID_DvbParentalRatingDescriptor = GUID(0x2a67a58d, 0xeca5, 0x4eac, [0xab, 0xcb, 0xe7, 0x34, 0xd3, 0x77, 0x6d, 0xa]);
struct EVENTID_DvbParentalRatingDescriptor
{
}
struct DvbParentalRatingParam
{
    CHAR[4] szCountryCode;
    ubyte bRating;
}
struct DvbParentalRatingDescriptor
{
    uint ulNumParams;
    DvbParentalRatingParam[1] pParams;
}
enum CLSID_EVENTID_DFNWithNoActualAVData = GUID(0xf5689ffe, 0x55f9, 0x4bb3, [0x96, 0xbe, 0xae, 0x97, 0x1c, 0x63, 0xba, 0xe0]);
struct EVENTID_DFNWithNoActualAVData
{
}
enum CLSID_KSDATAFORMAT_TYPE_BDA_ANTENNA = GUID(0x71985f41, 0x1ca1, 0x11d3, [0x9c, 0xc8, 0x0, 0xc0, 0x4f, 0x79, 0x71, 0xe0]);
struct KSDATAFORMAT_TYPE_BDA_ANTENNA
{
}
enum CLSID_KSDATAFORMAT_SUBTYPE_BDA_MPEG2_TRANSPORT = GUID(0xf4aeb342, 0x329, 0x4fdd, [0xa8, 0xfd, 0x4a, 0xff, 0x49, 0x26, 0xc9, 0x78]);
struct KSDATAFORMAT_SUBTYPE_BDA_MPEG2_TRANSPORT
{
}
enum CLSID_KSDATAFORMAT_SPECIFIER_BDA_TRANSPORT = GUID(0x8deda6fd, 0xac5f, 0x4334, [0x8e, 0xcf, 0xa4, 0xba, 0x8f, 0xa7, 0xd0, 0xf0]);
struct KSDATAFORMAT_SPECIFIER_BDA_TRANSPORT
{
}
enum CLSID_KSDATAFORMAT_TYPE_BDA_IF_SIGNAL = GUID(0x61be0b47, 0xa5eb, 0x499b, [0x9a, 0x85, 0x5b, 0x16, 0xc0, 0x7f, 0x12, 0x58]);
struct KSDATAFORMAT_TYPE_BDA_IF_SIGNAL
{
}
enum CLSID_KSDATAFORMAT_TYPE_MPEG2_SECTIONS = GUID(0x455f176c, 0x4b06, 0x47ce, [0x9a, 0xef, 0x8c, 0xae, 0xf7, 0x3d, 0xf7, 0xb5]);
struct KSDATAFORMAT_TYPE_MPEG2_SECTIONS
{
}
enum CLSID_KSDATAFORMAT_SUBTYPE_ATSC_SI = GUID(0xb3c7397c, 0xd303, 0x414d, [0xb3, 0x3c, 0x4e, 0xd2, 0xc9, 0xd2, 0x97, 0x33]);
struct KSDATAFORMAT_SUBTYPE_ATSC_SI
{
}
enum CLSID_KSDATAFORMAT_SUBTYPE_DVB_SI = GUID(0xe9dd31a3, 0x221d, 0x4adb, [0x85, 0x32, 0x9a, 0xf3, 0x9, 0xc1, 0xa4, 0x8]);
struct KSDATAFORMAT_SUBTYPE_DVB_SI
{
}
enum CLSID_KSDATAFORMAT_SUBTYPE_BDA_OPENCABLE_PSIP = GUID(0x762e3f66, 0x336f, 0x48d1, [0xbf, 0x83, 0x2b, 0x0, 0x35, 0x2c, 0x11, 0xf0]);
struct KSDATAFORMAT_SUBTYPE_BDA_OPENCABLE_PSIP
{
}
enum CLSID_KSDATAFORMAT_SUBTYPE_BDA_OPENCABLE_OOB_PSIP = GUID(0x951727db, 0xd2ce, 0x4528, [0x96, 0xf6, 0x33, 0x1, 0xfa, 0xbb, 0x2d, 0xe0]);
struct KSDATAFORMAT_SUBTYPE_BDA_OPENCABLE_OOB_PSIP
{
}
enum CLSID_KSDATAFORMAT_SUBTYPE_ISDB_SI = GUID(0x4a2eeb99, 0x6458, 0x4538, [0xb1, 0x87, 0x4, 0x1, 0x7c, 0x41, 0x41, 0x3f]);
struct KSDATAFORMAT_SUBTYPE_ISDB_SI
{
}
enum CLSID_KSDATAFORMAT_SUBTYPE_PBDA_TRANSPORT_RAW = GUID(0xd7aed42, 0xcb9a, 0x11db, [0x97, 0x5, 0x0, 0x50, 0x56, 0xc0, 0x0, 0x8]);
struct KSDATAFORMAT_SUBTYPE_PBDA_TRANSPORT_RAW
{
}
enum CLSID_PINNAME_BDA_TRANSPORT = GUID(0x78216a81, 0xcfa8, 0x493e, [0x97, 0x11, 0x36, 0xa6, 0x1c, 0x8, 0xbd, 0x9d]);
struct PINNAME_BDA_TRANSPORT
{
}
enum CLSID_PINNAME_BDA_ANALOG_VIDEO = GUID(0x5c0c8281, 0x5667, 0x486c, [0x84, 0x82, 0x63, 0xe3, 0x1f, 0x1, 0xa6, 0xe9]);
struct PINNAME_BDA_ANALOG_VIDEO
{
}
enum CLSID_PINNAME_BDA_ANALOG_AUDIO = GUID(0xd28a580a, 0x9b1f, 0x4b0c, [0x9c, 0x33, 0x9b, 0xf0, 0xa8, 0xea, 0x63, 0x6b]);
struct PINNAME_BDA_ANALOG_AUDIO
{
}
enum CLSID_PINNAME_BDA_FM_RADIO = GUID(0xd2855fed, 0xb2d3, 0x4eeb, [0x9b, 0xd0, 0x19, 0x34, 0x36, 0xa2, 0xf8, 0x90]);
struct PINNAME_BDA_FM_RADIO
{
}
enum CLSID_PINNAME_BDA_IF_PIN = GUID(0x1a9d4a42, 0xf3cd, 0x48a1, [0x9a, 0xea, 0x71, 0xde, 0x13, 0x3c, 0xbe, 0x14]);
struct PINNAME_BDA_IF_PIN
{
}
enum CLSID_PINNAME_BDA_OPENCABLE_PSIP_PIN = GUID(0x297bb104, 0xe5c9, 0x4ace, [0xb1, 0x23, 0x95, 0xc3, 0xcb, 0xb2, 0x4d, 0x4f]);
struct PINNAME_BDA_OPENCABLE_PSIP_PIN
{
}
enum CLSID_KSPROPSETID_BdaEthernetFilter = GUID(0x71985f43, 0x1ca1, 0x11d3, [0x9c, 0xc8, 0x0, 0xc0, 0x4f, 0x79, 0x71, 0xe0]);
struct KSPROPSETID_BdaEthernetFilter
{
}
alias KSPROPERTY_BDA_ETHERNET_FILTER = int;
enum : int
{
    KSPROPERTY_BDA_ETHERNET_FILTER_MULTICAST_LIST_SIZE = 0x00000000,
    KSPROPERTY_BDA_ETHERNET_FILTER_MULTICAST_LIST      = 0x00000001,
    KSPROPERTY_BDA_ETHERNET_FILTER_MULTICAST_MODE      = 0x00000002,
}

enum CLSID_KSPROPSETID_BdaIPv4Filter = GUID(0x71985f44, 0x1ca1, 0x11d3, [0x9c, 0xc8, 0x0, 0xc0, 0x4f, 0x79, 0x71, 0xe0]);
struct KSPROPSETID_BdaIPv4Filter
{
}
alias KSPROPERTY_BDA_IPv4_FILTER = int;
enum : int
{
    KSPROPERTY_BDA_IPv4_FILTER_MULTICAST_LIST_SIZE = 0x00000000,
    KSPROPERTY_BDA_IPv4_FILTER_MULTICAST_LIST      = 0x00000001,
    KSPROPERTY_BDA_IPv4_FILTER_MULTICAST_MODE      = 0x00000002,
}

enum CLSID_KSPROPSETID_BdaIPv6Filter = GUID(0xe1785a74, 0x2a23, 0x4fb3, [0x92, 0x45, 0xa8, 0xf8, 0x80, 0x17, 0xef, 0x33]);
struct KSPROPSETID_BdaIPv6Filter
{
}
alias KSPROPERTY_BDA_IPv6_FILTER = int;
enum : int
{
    KSPROPERTY_BDA_IPv6_FILTER_MULTICAST_LIST_SIZE = 0x00000000,
    KSPROPERTY_BDA_IPv6_FILTER_MULTICAST_LIST      = 0x00000001,
    KSPROPERTY_BDA_IPv6_FILTER_MULTICAST_MODE      = 0x00000002,
}

enum CLSID_KSPROPSETID_BdaSignalStats = GUID(0x1347d106, 0xcf3a, 0x428a, [0xa5, 0xcb, 0xac, 0xd, 0x9a, 0x2a, 0x43, 0x38]);
struct KSPROPSETID_BdaSignalStats
{
}
alias KSPROPERTY_BDA_SIGNAL_STATS = int;
enum : int
{
    KSPROPERTY_BDA_SIGNAL_STRENGTH  = 0x00000000,
    KSPROPERTY_BDA_SIGNAL_QUALITY   = 0x00000001,
    KSPROPERTY_BDA_SIGNAL_PRESENT   = 0x00000002,
    KSPROPERTY_BDA_SIGNAL_LOCKED    = 0x00000003,
    KSPROPERTY_BDA_SAMPLE_TIME      = 0x00000004,
    KSPROPERTY_BDA_SIGNAL_LOCK_CAPS = 0x00000005,
    KSPROPERTY_BDA_SIGNAL_LOCK_TYPE = 0x00000006,
}

alias BDA_LockType = int;
enum : int
{
    Bda_LockType_None         = 0x00000000,
    Bda_LockType_PLL          = 0x00000001,
    Bda_LockType_DecoderDemod = 0x00000002,
    Bda_LockType_Complete     = 0x00000080,
}

enum CLSID_KSMETHODSETID_BdaChangeSync = GUID(0xfd0a5af3, 0xb41d, 0x11d2, [0x9c, 0x95, 0x0, 0xc0, 0x4f, 0x79, 0x71, 0xe0]);
struct KSMETHODSETID_BdaChangeSync
{
}
alias KSMETHOD_BDA_CHANGE_SYNC = int;
enum : int
{
    KSMETHOD_BDA_START_CHANGES    = 0x00000000,
    KSMETHOD_BDA_CHECK_CHANGES    = 0x00000001,
    KSMETHOD_BDA_COMMIT_CHANGES   = 0x00000002,
    KSMETHOD_BDA_GET_CHANGE_STATE = 0x00000003,
}

enum CLSID_KSMETHODSETID_BdaDeviceConfiguration = GUID(0x71985f45, 0x1ca1, 0x11d3, [0x9c, 0xc8, 0x0, 0xc0, 0x4f, 0x79, 0x71, 0xe0]);
struct KSMETHODSETID_BdaDeviceConfiguration
{
}
alias KSMETHOD_BDA_DEVICE_CONFIGURATION = int;
enum : int
{
    KSMETHOD_BDA_CREATE_PIN_FACTORY = 0x00000000,
    KSMETHOD_BDA_DELETE_PIN_FACTORY = 0x00000001,
    KSMETHOD_BDA_CREATE_TOPOLOGY    = 0x00000002,
}

enum CLSID_KSPROPSETID_BdaTopology = GUID(0xa14ee835, 0xa23, 0x11d3, [0x9c, 0xc7, 0x0, 0xc0, 0x4f, 0x79, 0x71, 0xe0]);
struct KSPROPSETID_BdaTopology
{
}
alias KSPROPERTY_BDA_TOPOLOGY = int;
enum : int
{
    KSPROPERTY_BDA_NODE_TYPES           = 0x00000000,
    KSPROPERTY_BDA_PIN_TYPES            = 0x00000001,
    KSPROPERTY_BDA_TEMPLATE_CONNECTIONS = 0x00000002,
    KSPROPERTY_BDA_NODE_METHODS         = 0x00000003,
    KSPROPERTY_BDA_NODE_PROPERTIES      = 0x00000004,
    KSPROPERTY_BDA_NODE_EVENTS          = 0x00000005,
    KSPROPERTY_BDA_CONTROLLING_PIN_ID   = 0x00000006,
    KSPROPERTY_BDA_NODE_DESCRIPTORS     = 0x00000007,
}

enum CLSID_KSPROPSETID_BdaPinControl = GUID(0xded49d5, 0xa8b7, 0x4d5d, [0x97, 0xa1, 0x12, 0xb0, 0xc1, 0x95, 0x87, 0x4d]);
struct KSPROPSETID_BdaPinControl
{
}
alias KSPROPERTY_BDA_PIN_CONTROL = int;
enum : int
{
    KSPROPERTY_BDA_PIN_ID   = 0x00000000,
    KSPROPERTY_BDA_PIN_TYPE = 0x00000001,
}

enum CLSID_KSEVENTSETID_BdaPinEvent = GUID(0x104781cd, 0x50bd, 0x40d5, [0x95, 0xfb, 0x8, 0x7e, 0xe, 0x86, 0xa5, 0x91]);
struct KSEVENTSETID_BdaPinEvent
{
}
alias KSPROPERTY_BDA_PIN_EVENT = int;
enum : int
{
    KSEVENT_BDA_PIN_CONNECTED    = 0x00000000,
    KSEVENT_BDA_PIN_DISCONNECTED = 0x00000001,
}

enum CLSID_KSPROPSETID_BdaVoidTransform = GUID(0x71985f46, 0x1ca1, 0x11d3, [0x9c, 0xc8, 0x0, 0xc0, 0x4f, 0x79, 0x71, 0xe0]);
struct KSPROPSETID_BdaVoidTransform
{
}
alias KSPROPERTY_BDA_VOID_TRANSFORM = int;
enum : int
{
    KSPROPERTY_BDA_VOID_TRANSFORM_START = 0x00000000,
    KSPROPERTY_BDA_VOID_TRANSFORM_STOP  = 0x00000001,
}

enum CLSID_KSPROPSETID_BdaNullTransform = GUID(0xddf15b0d, 0xbd25, 0x11d2, [0x9c, 0xa0, 0x0, 0xc0, 0x4f, 0x79, 0x71, 0xe0]);
struct KSPROPSETID_BdaNullTransform
{
}
alias KSPROPERTY_BDA_NULL_TRANSFORM = int;
enum : int
{
    KSPROPERTY_BDA_NULL_TRANSFORM_START = 0x00000000,
    KSPROPERTY_BDA_NULL_TRANSFORM_STOP  = 0x00000001,
}

enum CLSID_KSPROPSETID_BdaFrequencyFilter = GUID(0x71985f47, 0x1ca1, 0x11d3, [0x9c, 0xc8, 0x0, 0xc0, 0x4f, 0x79, 0x71, 0xe0]);
struct KSPROPSETID_BdaFrequencyFilter
{
}
alias KSPROPERTY_BDA_FREQUENCY_FILTER = int;
enum : int
{
    KSPROPERTY_BDA_RF_TUNER_FREQUENCY            = 0x00000000,
    KSPROPERTY_BDA_RF_TUNER_POLARITY             = 0x00000001,
    KSPROPERTY_BDA_RF_TUNER_RANGE                = 0x00000002,
    KSPROPERTY_BDA_RF_TUNER_TRANSPONDER          = 0x00000003,
    KSPROPERTY_BDA_RF_TUNER_BANDWIDTH            = 0x00000004,
    KSPROPERTY_BDA_RF_TUNER_FREQUENCY_MULTIPLIER = 0x00000005,
    KSPROPERTY_BDA_RF_TUNER_CAPS                 = 0x00000006,
    KSPROPERTY_BDA_RF_TUNER_SCAN_STATUS          = 0x00000007,
    KSPROPERTY_BDA_RF_TUNER_STANDARD             = 0x00000008,
    KSPROPERTY_BDA_RF_TUNER_STANDARD_MODE        = 0x00000009,
}

alias BDA_SignalType = int;
enum : int
{
    Bda_SignalType_Unknown = 0x00000000,
    Bda_SignalType_Analog  = 0x00000001,
    Bda_SignalType_Digital = 0x00000002,
}

alias BDA_DigitalSignalStandard = int;
enum : int
{
    Bda_DigitalStandard_None   = 0x00000000,
    Bda_DigitalStandard_DVB_T  = 0x00000001,
    Bda_DigitalStandard_DVB_S  = 0x00000002,
    Bda_DigitalStandard_DVB_C  = 0x00000004,
    Bda_DigitalStandard_ATSC   = 0x00000008,
    Bda_DigitalStandard_ISDB_T = 0x00000010,
    Bda_DigitalStandard_ISDB_S = 0x00000020,
    Bda_DigitalStandard_ISDB_C = 0x00000040,
}

struct KSPROPERTY_BDA_RF_TUNER_CAPS_S
{
    KSP_NODE Property;
    uint Mode;
    uint AnalogStandardsSupported;
    uint DigitalStandardsSupported;
    uint MinFrequency;
    uint MaxFrequency;
    uint SettlingTime;
    uint AnalogSensingRange;
    uint DigitalSensingRange;
    uint MilliSecondsPerMHz;
}
struct KSPROPERTY_BDA_RF_TUNER_SCAN_STATUS_S
{
    KSP_NODE Property;
    uint CurrentFrequency;
    uint FrequencyRangeMin;
    uint FrequencyRangeMax;
    uint MilliSecondsLeft;
}
struct KSPROPERTY_BDA_RF_TUNER_STANDARD_S
{
    KSP_NODE Property;
    BDA_SignalType SignalType;
    uint SignalStandard;
}
struct KSPROPERTY_BDA_RF_TUNER_STANDARD_MODE_S
{
    KSP_NODE Property;
    BOOL AutoDetect;
}
enum CLSID_KSEVENTSETID_BdaTunerEvent = GUID(0xaab59e17, 0x1c9, 0x4ebf, [0x93, 0xf2, 0xfc, 0x3b, 0x79, 0xb4, 0x6f, 0x91]);
struct KSEVENTSETID_BdaTunerEvent
{
}
alias KSEVENT_BDA_TUNER = int;
enum : int
{
    KSEVENT_BDA_TUNER_SCAN = 0x00000000,
}

struct KSEVENTDATA_BDA_RF_TUNER_SCAN_S
{
    KSEVENTDATA EventData;
    uint StartFrequency;
    uint EndFrequency;
    BDA_LockType LockRequested;
}
enum CLSID_KSPROPSETID_BdaLNBInfo = GUID(0x992cf102, 0x49f9, 0x4719, [0xa6, 0x64, 0xc4, 0xf2, 0x3e, 0x24, 0x8, 0xf4]);
struct KSPROPSETID_BdaLNBInfo
{
}
alias KSPROPERTY_BDA_LNB_INFO = int;
enum : int
{
    KSPROPERTY_BDA_LNB_LOF_LOW_BAND     = 0x00000000,
    KSPROPERTY_BDA_LNB_LOF_HIGH_BAND    = 0x00000001,
    KSPROPERTY_BDA_LNB_SWITCH_FREQUENCY = 0x00000002,
}

enum CLSID_KSPROPSETID_BdaDiseqCommand = GUID(0xf84e2ab0, 0x3c6b, 0x45e3, [0xa0, 0xfc, 0x86, 0x69, 0xd4, 0xb8, 0x1f, 0x11]);
struct KSPROPSETID_BdaDiseqCommand
{
}
alias KSPROPERTY_BDA_DISEQC_COMMAND = int;
enum : int
{
    KSPROPERTY_BDA_DISEQC_ENABLE       = 0x00000000,
    KSPROPERTY_BDA_DISEQC_LNB_SOURCE   = 0x00000001,
    KSPROPERTY_BDA_DISEQC_USETONEBURST = 0x00000002,
    KSPROPERTY_BDA_DISEQC_REPEATS      = 0x00000003,
    KSPROPERTY_BDA_DISEQC_SEND         = 0x00000004,
    KSPROPERTY_BDA_DISEQC_RESPONSE     = 0x00000005,
}

enum CLSID_KSEVENTSETID_BdaDiseqCEvent = GUID(0x8b19bbf0, 0x4184, 0x43ac, [0xad, 0x3c, 0xc, 0x88, 0x9b, 0xe4, 0xc2, 0x12]);
struct KSEVENTSETID_BdaDiseqCEvent
{
}
alias KSPROPERTY_BDA_DISEQC_EVENT = int;
enum : int
{
    KSEVENT_BDA_DISEQC_DATA_RECEIVED = 0x00000000,
}

enum CLSID_KSPROPSETID_BdaDigitalDemodulator = GUID(0xef30f379, 0x985b, 0x4d10, [0xb6, 0x40, 0xa7, 0x9d, 0x5e, 0x4, 0xe1, 0xe0]);
struct KSPROPSETID_BdaDigitalDemodulator
{
}
alias KSPROPERTY_BDA_DIGITAL_DEMODULATOR = int;
enum : int
{
    KSPROPERTY_BDA_MODULATION_TYPE    = 0x00000000,
    KSPROPERTY_BDA_INNER_FEC_TYPE     = 0x00000001,
    KSPROPERTY_BDA_INNER_FEC_RATE     = 0x00000002,
    KSPROPERTY_BDA_OUTER_FEC_TYPE     = 0x00000003,
    KSPROPERTY_BDA_OUTER_FEC_RATE     = 0x00000004,
    KSPROPERTY_BDA_SYMBOL_RATE        = 0x00000005,
    KSPROPERTY_BDA_SPECTRAL_INVERSION = 0x00000006,
    KSPROPERTY_BDA_GUARD_INTERVAL     = 0x00000007,
    KSPROPERTY_BDA_TRANSMISSION_MODE  = 0x00000008,
    KSPROPERTY_BDA_ROLL_OFF           = 0x00000009,
    KSPROPERTY_BDA_PILOT              = 0x0000000a,
    KSPROPERTY_BDA_SIGNALTIMEOUTS     = 0x0000000b,
    KSPROPERTY_BDA_PLP_NUMBER         = 0x0000000c,
}

enum CLSID_KSPROPSETID_BdaAutodemodulate = GUID(0xddf15b12, 0xbd25, 0x11d2, [0x9c, 0xa0, 0x0, 0xc0, 0x4f, 0x79, 0x71, 0xe0]);
struct KSPROPSETID_BdaAutodemodulate
{
}
alias KSPROPERTY_BDA_AUTODEMODULATE = int;
enum : int
{
    KSPROPERTY_BDA_AUTODEMODULATE_START = 0x00000000,
    KSPROPERTY_BDA_AUTODEMODULATE_STOP  = 0x00000001,
}

enum CLSID_KSPROPSETID_BdaTableSection = GUID(0x516b99c5, 0x971c, 0x4aaf, [0xb3, 0xf3, 0xd9, 0xfd, 0xa8, 0xa1, 0x5e, 0x16]);
struct KSPROPSETID_BdaTableSection
{
}
alias KSPROPERTY_IDS_BDA_TABLE = int;
enum : int
{
    KSPROPERTY_BDA_TABLE_SECTION = 0x00000000,
}

enum CLSID_KSPROPSETID_BdaPIDFilter = GUID(0xd0a67d65, 0x8df, 0x4fec, [0x85, 0x33, 0xe5, 0xb5, 0x50, 0x41, 0xb, 0x85]);
struct KSPROPSETID_BdaPIDFilter
{
}
alias KSPROPERTY_BDA_PIDFILTER = int;
enum : int
{
    KSPROPERTY_BDA_PIDFILTER_MAP_PIDS   = 0x00000000,
    KSPROPERTY_BDA_PIDFILTER_UNMAP_PIDS = 0x00000001,
    KSPROPERTY_BDA_PIDFILTER_LIST_PIDS  = 0x00000002,
}

enum CLSID_KSPROPSETID_BdaCA = GUID(0xb0693766, 0x5278, 0x4ec6, [0xb9, 0xe1, 0x3c, 0xe4, 0x5, 0x60, 0xef, 0x5a]);
struct KSPROPSETID_BdaCA
{
}
alias KSPROPERTY_BDA_CA = int;
enum : int
{
    KSPROPERTY_BDA_ECM_MAP_STATUS       = 0x00000000,
    KSPROPERTY_BDA_CA_MODULE_STATUS     = 0x00000001,
    KSPROPERTY_BDA_CA_SMART_CARD_STATUS = 0x00000002,
    KSPROPERTY_BDA_CA_MODULE_UI         = 0x00000003,
    KSPROPERTY_BDA_CA_SET_PROGRAM_PIDS  = 0x00000004,
    KSPROPERTY_BDA_CA_REMOVE_PROGRAM    = 0x00000005,
}

enum CLSID_KSEVENTSETID_BdaCAEvent = GUID(0x488c4ccc, 0xb768, 0x4129, [0x8e, 0xb1, 0xb0, 0xa, 0x7, 0x1f, 0x90, 0x68]);
struct KSEVENTSETID_BdaCAEvent
{
}
alias KSPROPERTY_BDA_CA_EVENT = int;
enum : int
{
    KSEVENT_BDA_PROGRAM_FLOW_STATUS_CHANGED  = 0x00000000,
    KSEVENT_BDA_CA_MODULE_STATUS_CHANGED     = 0x00000001,
    KSEVENT_BDA_CA_SMART_CARD_STATUS_CHANGED = 0x00000002,
    KSEVENT_BDA_CA_MODULE_UI_REQUESTED       = 0x00000003,
}

enum CLSID_KSMETHODSETID_BdaDrmService = GUID(0xbff6b5bb, 0xb0ae, 0x484c, [0x9d, 0xca, 0x73, 0x52, 0x8f, 0xb0, 0xb4, 0x6e]);
struct KSMETHODSETID_BdaDrmService
{
}
alias KSMETHOD_BDA_DRM = int;
enum : int
{
    KSMETHOD_BDA_DRM_CURRENT   = 0x00000000,
    KSMETHOD_BDA_DRM_DRMSTATUS = 0x00000001,
}

enum CLSID_KSMETHODSETID_BdaWmdrmSession = GUID(0x4be6fa3d, 0x7cd, 0x4139, [0x8b, 0x80, 0x8c, 0x18, 0xba, 0x3a, 0xec, 0x88]);
struct KSMETHODSETID_BdaWmdrmSession
{
}
alias KSMETHOD_BDA_WMDRM = int;
enum : int
{
    KSMETHOD_BDA_WMDRM_STATUS         = 0x00000000,
    KSMETHOD_BDA_WMDRM_REVINFO        = 0x00000001,
    KSMETHOD_BDA_WMDRM_CRL            = 0x00000002,
    KSMETHOD_BDA_WMDRM_MESSAGE        = 0x00000003,
    KSMETHOD_BDA_WMDRM_REISSUELICENSE = 0x00000004,
    KSMETHOD_BDA_WMDRM_RENEWLICENSE   = 0x00000005,
    KSMETHOD_BDA_WMDRM_LICENSE        = 0x00000006,
    KSMETHOD_BDA_WMDRM_KEYINFO        = 0x00000007,
}

enum CLSID_KSMETHODSETID_BdaWmdrmTuner = GUID(0x86d979cf, 0xa8a7, 0x4f94, [0xb5, 0xfb, 0x14, 0xc0, 0xac, 0xa6, 0x8f, 0xe6]);
struct KSMETHODSETID_BdaWmdrmTuner
{
}
alias KSMETHOD_BDA_WMDRM_TUNER = int;
enum : int
{
    KSMETHOD_BDA_WMDRMTUNER_CANCELCAPTURETOKEN   = 0x00000000,
    KSMETHOD_BDA_WMDRMTUNER_SETPIDPROTECTION     = 0x00000001,
    KSMETHOD_BDA_WMDRMTUNER_GETPIDPROTECTION     = 0x00000002,
    KSMETHOD_BDA_WMDRMTUNER_SETSYNCVALUE         = 0x00000003,
    KSMETHOD_BDA_WMDRMTUNER_STARTCODEPROFILE     = 0x00000004,
    KSMETHOD_BDA_WMDRMTUNER_PURCHASE_ENTITLEMENT = 0x00000005,
}

enum CLSID_KSMETHODSETID_BdaEventing = GUID(0xf99492da, 0x6193, 0x4eb0, [0x86, 0x90, 0x66, 0x86, 0xcb, 0xff, 0x71, 0x3e]);
struct KSMETHODSETID_BdaEventing
{
}
alias KSMETHOD_BDA_EVENTING_SERVICE = int;
enum : int
{
    KSMETHOD_BDA_EVENT_DATA     = 0x00000000,
    KSMETHOD_BDA_EVENT_COMPLETE = 0x00000001,
}

enum CLSID_KSEVENTSETID_BdaEvent = GUID(0xae7e55b2, 0x96d7, 0x4e29, [0x90, 0x8f, 0x62, 0xf9, 0x5b, 0x2a, 0x16, 0x79]);
struct KSEVENTSETID_BdaEvent
{
}
alias KSEVENT_BDA_EVENT_TYPE = int;
enum : int
{
    KSEVENT_BDA_EVENT_PENDINGEVENT = 0x00000000,
}

enum CLSID_KSMETHODSETID_BdaDebug = GUID(0xd4a90ec, 0xc69d, 0x4ee2, [0x8c, 0x5a, 0xfb, 0x1f, 0x63, 0xa5, 0xd, 0xa1]);
struct KSMETHODSETID_BdaDebug
{
}
alias KSMETHOD_BDA_DEBUG_SERVICE = int;
enum : int
{
    KSMETHOD_BDA_DEBUG_LEVEL = 0x00000000,
    KSMETHOD_BDA_DEBUG_DATA  = 0x00000001,
}

enum CLSID_KSMETHODSETID_BdaTuner = GUID(0xb774102f, 0xac07, 0x478a, [0x82, 0x28, 0x27, 0x42, 0xd9, 0x61, 0xfa, 0x7e]);
struct KSMETHODSETID_BdaTuner
{
}
alias KSMETHOD_BDA_TUNER_SERVICE = int;
enum : int
{
    KSMETHOD_BDA_TUNER_SETTUNER         = 0x00000000,
    KSMETHOD_BDA_TUNER_GETTUNERSTATE    = 0x00000001,
    KSMETHOD_BDA_TUNER_SIGNALNOISERATIO = 0x00000002,
}

enum CLSID_KSMETHODSETID_BdaNameValueA = GUID(0xc24096d, 0x5ff5, 0x47de, [0xa8, 0x56, 0x6, 0x2e, 0x58, 0x7e, 0x37, 0x27]);
struct KSMETHODSETID_BdaNameValueA
{
}
enum CLSID_KSMETHODSETID_BdaNameValue = GUID(0x36e07304, 0x9f0d, 0x4e88, [0x91, 0x18, 0xac, 0xb, 0xa3, 0x17, 0xb7, 0xf2]);
struct KSMETHODSETID_BdaNameValue
{
}
alias KSMETHOD_BDA_GPNV_SERVICE = int;
enum : int
{
    KSMETHOD_BDA_GPNV_GETVALUE           = 0x00000000,
    KSMETHOD_BDA_GPNV_SETVALUE           = 0x00000001,
    KSMETHOD_BDA_GPNV_NAMEFROMINDEX      = 0x00000002,
    KSMETHOD_BDA_GPNV_GETVALUEUPDATENAME = 0x00000003,
}

enum CLSID_KSMETHODSETID_BdaMux = GUID(0x942aafec, 0x4c05, 0x4c74, [0xb8, 0xeb, 0x87, 0x6, 0xc2, 0xa4, 0x94, 0x3f]);
struct KSMETHODSETID_BdaMux
{
}
alias KSMETHOD_BDA_MUX_SERVICE = int;
enum : int
{
    KSMETHOD_BDA_MUX_GETPIDLIST = 0x00000000,
    KSMETHOD_BDA_MUX_SETPIDLIST = 0x00000001,
}

enum CLSID_KSMETHODSETID_BdaScanning = GUID(0x12eb49df, 0x6249, 0x47f3, [0xb1, 0x90, 0xe2, 0x1e, 0x6e, 0x2f, 0x8a, 0x9c]);
struct KSMETHODSETID_BdaScanning
{
}
alias KSMETHOD_BDA_SCAN_SERVICE = int;
enum : int
{
    KSMETHOD_BDA_SCAN_CAPABILTIES = 0x00000000,
    KSMETHOD_BDA_SCANNING_STATE   = 0x00000001,
    KSMETHOD_BDA_SCAN_FILTER      = 0x00000002,
    KSMETHOD_BDA_SCAN_START       = 0x00000003,
    KSMETHOD_BDA_SCAN_RESUME      = 0x00000004,
    KSMETHOD_BDA_SCAN_STOP        = 0x00000005,
}

enum CLSID_KSMETHODSETID_BdaGuideDataDeliveryService = GUID(0x8d9d5562, 0x1589, 0x417d, [0x99, 0xce, 0xac, 0x53, 0x1d, 0xda, 0x19, 0xf9]);
struct KSMETHODSETID_BdaGuideDataDeliveryService
{
}
alias KSMETHOD_BDA_GDDS_SERVICE = int;
enum : int
{
    KSMETHOD_BDA_GDDS_DATATYPE           = 0x00000000,
    KSMETHOD_BDA_GDDS_DATA               = 0x00000001,
    KSMETHOD_BDA_GDDS_TUNEXMLFROMIDX     = 0x00000002,
    KSMETHOD_BDA_GDDS_GETSERVICES        = 0x00000003,
    KSMETHOD_BDA_GDDS_SERVICEFROMTUNEXML = 0x00000004,
    KSMETHOD_BDA_GDDS_DATAUPDATE         = 0x00000005,
}

enum CLSID_KSMETHODSETID_BdaConditionalAccessService = GUID(0x10ced3b4, 0x320b, 0x41bf, [0x98, 0x24, 0x1b, 0x2e, 0x68, 0xe7, 0x1e, 0xb9]);
struct KSMETHODSETID_BdaConditionalAccessService
{
}
alias KSMETHOD_BDA_CAS_SERVICE = int;
enum : int
{
    KSMETHOD_BDA_CAS_CHECKENTITLEMENTTOKEN = 0x00000000,
    KSMETHOD_BDA_CAS_SETCAPTURETOKEN       = 0x00000001,
    KSMETHOD_BDA_CAS_OPENBROADCASTMMI      = 0x00000002,
    KSMETHOD_BDA_CAS_CLOSEMMIDIALOG        = 0x00000003,
}

enum CLSID_KSMETHODSETID_BdaIsdbConditionalAccess = GUID(0x5e68c627, 0x16c2, 0x4e6c, [0xb1, 0xe2, 0xd0, 0x1, 0x70, 0xcd, 0xaa, 0xf]);
struct KSMETHODSETID_BdaIsdbConditionalAccess
{
}
alias KSMETHOD_BDA_ISDB_CAS = int;
enum : int
{
    KSMETHOD_BDA_ISDBCAS_SETREQUEST   = 0x00000000,
    KSMETHOD_BDA_ISDBCAS_RESPONSEDATA = 0x00000001,
}

enum CLSID_KSMETHODSETID_BdaTSSelector = GUID(0x1dcfafe9, 0xb45e, 0x41b3, [0xbb, 0x2a, 0x56, 0x1e, 0xb1, 0x29, 0xae, 0x98]);
struct KSMETHODSETID_BdaTSSelector
{
}
alias KSMETHOD_BDA_TS_SELECTOR = int;
enum : int
{
    KSMETHOD_BDA_TS_SELECTOR_SETTSID          = 0x00000000,
    KSMETHOD_BDA_TS_SELECTOR_GETTSINFORMATION = 0x00000001,
}

enum CLSID_KSMETHODSETID_BdaUserActivity = GUID(0xeda5c834, 0x4531, 0x483c, [0xbe, 0xa, 0x94, 0xe6, 0xc9, 0x6f, 0xf3, 0x96]);
struct KSMETHODSETID_BdaUserActivity
{
}
alias KSMETHOD_BDA_USERACTIVITY_SERVICE = int;
enum : int
{
    KSMETHOD_BDA_USERACTIVITY_USEREASON = 0x00000000,
    KSMETHOD_BDA_USERACTIVITY_INTERVAL  = 0x00000001,
    KSMETHOD_BDA_USERACTIVITY_DETECTED  = 0x00000002,
}

enum CLSID_KSCATEGORY_BDA_RECEIVER_COMPONENT = GUID(0xfd0a5af4, 0xb41d, 0x11d2, [0x9c, 0x95, 0x0, 0xc0, 0x4f, 0x79, 0x71, 0xe0]);
struct KSCATEGORY_BDA_RECEIVER_COMPONENT
{
}
enum CLSID_KSCATEGORY_BDA_NETWORK_TUNER = GUID(0x71985f48, 0x1ca1, 0x11d3, [0x9c, 0xc8, 0x0, 0xc0, 0x4f, 0x79, 0x71, 0xe0]);
struct KSCATEGORY_BDA_NETWORK_TUNER
{
}
enum CLSID_KSCATEGORY_BDA_NETWORK_EPG = GUID(0x71985f49, 0x1ca1, 0x11d3, [0x9c, 0xc8, 0x0, 0xc0, 0x4f, 0x79, 0x71, 0xe0]);
struct KSCATEGORY_BDA_NETWORK_EPG
{
}
enum CLSID_KSCATEGORY_BDA_IP_SINK = GUID(0x71985f4a, 0x1ca1, 0x11d3, [0x9c, 0xc8, 0x0, 0xc0, 0x4f, 0x79, 0x71, 0xe0]);
struct KSCATEGORY_BDA_IP_SINK
{
}
enum CLSID_KSCATEGORY_BDA_NETWORK_PROVIDER = GUID(0x71985f4b, 0x1ca1, 0x11d3, [0x9c, 0xc8, 0x0, 0xc0, 0x4f, 0x79, 0x71, 0xe0]);
struct KSCATEGORY_BDA_NETWORK_PROVIDER
{
}
enum CLSID_KSCATEGORY_BDA_TRANSPORT_INFORMATION = GUID(0xa2e3074f, 0x6c3d, 0x11d3, [0xb6, 0x53, 0x0, 0xc0, 0x4f, 0x79, 0x49, 0x8e]);
struct KSCATEGORY_BDA_TRANSPORT_INFORMATION
{
}
enum CLSID_KSNODE_BDA_RF_TUNER = GUID(0x71985f4c, 0x1ca1, 0x11d3, [0x9c, 0xc8, 0x0, 0xc0, 0x4f, 0x79, 0x71, 0xe0]);
struct KSNODE_BDA_RF_TUNER
{
}
enum CLSID_KSNODE_BDA_ANALOG_DEMODULATOR = GUID(0x634db199, 0x27dd, 0x46b8, [0xac, 0xfb, 0xec, 0xc9, 0x8e, 0x61, 0xa2, 0xad]);
struct KSNODE_BDA_ANALOG_DEMODULATOR
{
}
enum CLSID_KSNODE_BDA_QAM_DEMODULATOR = GUID(0x71985f4d, 0x1ca1, 0x11d3, [0x9c, 0xc8, 0x0, 0xc0, 0x4f, 0x79, 0x71, 0xe0]);
struct KSNODE_BDA_QAM_DEMODULATOR
{
}
enum CLSID_KSNODE_BDA_QPSK_DEMODULATOR = GUID(0x6390c905, 0x27c1, 0x4d67, [0xbd, 0xb7, 0x77, 0xc5, 0xd, 0x7, 0x93, 0x0]);
struct KSNODE_BDA_QPSK_DEMODULATOR
{
}
enum CLSID_KSNODE_BDA_8VSB_DEMODULATOR = GUID(0x71985f4f, 0x1ca1, 0x11d3, [0x9c, 0xc8, 0x0, 0xc0, 0x4f, 0x79, 0x71, 0xe0]);
struct KSNODE_BDA_8VSB_DEMODULATOR
{
}
enum CLSID_KSNODE_BDA_COFDM_DEMODULATOR = GUID(0x2dac6e05, 0xedbe, 0x4b9c, [0xb3, 0x87, 0x1b, 0x6f, 0xad, 0x7d, 0x64, 0x95]);
struct KSNODE_BDA_COFDM_DEMODULATOR
{
}
enum CLSID_KSNODE_BDA_8PSK_DEMODULATOR = GUID(0xe957a0e7, 0xdd98, 0x4a3c, [0x81, 0xb, 0x35, 0x25, 0x15, 0x7a, 0xb6, 0x2e]);
struct KSNODE_BDA_8PSK_DEMODULATOR
{
}
enum CLSID_KSNODE_BDA_ISDB_T_DEMODULATOR = GUID(0xfcea3ae3, 0x2cb2, 0x464d, [0x8f, 0x5d, 0x30, 0x5c, 0xb, 0xb7, 0x78, 0xa2]);
struct KSNODE_BDA_ISDB_T_DEMODULATOR
{
}
enum CLSID_KSNODE_BDA_ISDB_S_DEMODULATOR = GUID(0xedde230a, 0x9086, 0x432d, [0xb8, 0xa5, 0x66, 0x70, 0x26, 0x38, 0x7, 0xe9]);
struct KSNODE_BDA_ISDB_S_DEMODULATOR
{
}
enum CLSID_KSNODE_BDA_OPENCABLE_POD = GUID(0x345812a0, 0xfb7c, 0x4790, [0xaa, 0x7e, 0xb1, 0xdb, 0x88, 0xac, 0x19, 0xc9]);
struct KSNODE_BDA_OPENCABLE_POD
{
}
enum CLSID_KSNODE_BDA_COMMON_CA_POD = GUID(0xd83ef8fc, 0xf3b8, 0x45ab, [0x8b, 0x71, 0xec, 0xf7, 0xc3, 0x39, 0xde, 0xb4]);
struct KSNODE_BDA_COMMON_CA_POD
{
}
enum CLSID_KSNODE_BDA_PID_FILTER = GUID(0xf5412789, 0xb0a0, 0x44e1, [0xae, 0x4f, 0xee, 0x99, 0x9b, 0x1b, 0x7f, 0xbe]);
struct KSNODE_BDA_PID_FILTER
{
}
enum CLSID_KSNODE_BDA_IP_SINK = GUID(0x71985f4e, 0x1ca1, 0x11d3, [0x9c, 0xc8, 0x0, 0xc0, 0x4f, 0x79, 0x71, 0xe0]);
struct KSNODE_BDA_IP_SINK
{
}
enum CLSID_KSNODE_BDA_VIDEO_ENCODER = GUID(0xd98429e3, 0x65c9, 0x4ac4, [0x93, 0xaa, 0x76, 0x67, 0x82, 0x83, 0x3b, 0x7a]);
struct KSNODE_BDA_VIDEO_ENCODER
{
}
enum CLSID_KSNODE_BDA_PBDA_CAS = GUID(0xc026869f, 0x7129, 0x4e71, [0x86, 0x96, 0xec, 0x8f, 0x75, 0x29, 0x9b, 0x77]);
struct KSNODE_BDA_PBDA_CAS
{
}
enum CLSID_KSNODE_BDA_PBDA_ISDBCAS = GUID(0xf2cf2ab3, 0x5b9d, 0x40ae, [0xab, 0x7c, 0x4e, 0x7a, 0xd0, 0xbd, 0x1c, 0x52]);
struct KSNODE_BDA_PBDA_ISDBCAS
{
}
enum CLSID_KSNODE_BDA_PBDA_TUNER = GUID(0xaa5e8286, 0x593c, 0x4979, [0x94, 0x94, 0x46, 0xa2, 0xa9, 0xdf, 0xe0, 0x76]);
struct KSNODE_BDA_PBDA_TUNER
{
}
enum CLSID_KSNODE_BDA_PBDA_MUX = GUID(0xf88c7787, 0x6678, 0x4f4b, [0xa1, 0x3e, 0xda, 0x9, 0x86, 0x1d, 0x68, 0x2b]);
struct KSNODE_BDA_PBDA_MUX
{
}
enum CLSID_KSNODE_BDA_PBDA_DRM = GUID(0x9eeebd03, 0xeea1, 0x450f, [0x96, 0xae, 0x63, 0x3e, 0x6d, 0xe6, 0x3c, 0xce]);
struct KSNODE_BDA_PBDA_DRM
{
}
enum CLSID_KSNODE_BDA_DRI_DRM = GUID(0x4f95ad74, 0xcefb, 0x42d2, [0x94, 0xa9, 0x68, 0xc5, 0xb2, 0xc1, 0xaa, 0xbe]);
struct KSNODE_BDA_DRI_DRM
{
}
enum CLSID_KSNODE_BDA_TS_SELECTOR = GUID(0x5eddf185, 0xfed1, 0x4f45, [0x96, 0x85, 0xbb, 0xb7, 0x3c, 0x32, 0x3c, 0xfc]);
struct KSNODE_BDA_TS_SELECTOR
{
}
enum CLSID_PINNAME_IPSINK_INPUT = GUID(0x3fdffa70, 0xac9a, 0x11d2, [0x8f, 0x17, 0x0, 0xc0, 0x4f, 0x79, 0x71, 0xe2]);
struct PINNAME_IPSINK_INPUT
{
}
enum CLSID_KSDATAFORMAT_TYPE_BDA_IP = GUID(0xe25f7b8e, 0xcccc, 0x11d2, [0x8f, 0x25, 0x0, 0xc0, 0x4f, 0x79, 0x71, 0xe2]);
struct KSDATAFORMAT_TYPE_BDA_IP
{
}
enum CLSID_KSDATAFORMAT_SUBTYPE_BDA_IP = GUID(0x5a9a213c, 0xdb08, 0x11d2, [0x8f, 0x32, 0x0, 0xc0, 0x4f, 0x79, 0x71, 0xe2]);
struct KSDATAFORMAT_SUBTYPE_BDA_IP
{
}
enum CLSID_KSDATAFORMAT_SPECIFIER_BDA_IP = GUID(0x6b891420, 0xdb09, 0x11d2, [0x8f, 0x32, 0x0, 0xc0, 0x4f, 0x79, 0x71, 0xe2]);
struct KSDATAFORMAT_SPECIFIER_BDA_IP
{
}
enum CLSID_KSDATAFORMAT_TYPE_BDA_IP_CONTROL = GUID(0xdadd5799, 0x7d5b, 0x4b63, [0x80, 0xfb, 0xd1, 0x44, 0x2f, 0x26, 0xb6, 0x21]);
struct KSDATAFORMAT_TYPE_BDA_IP_CONTROL
{
}
enum CLSID_KSDATAFORMAT_SUBTYPE_BDA_IP_CONTROL = GUID(0x499856e8, 0xe85b, 0x48ed, [0x9b, 0xea, 0x41, 0xd, 0xd, 0xd4, 0xef, 0x81]);
struct KSDATAFORMAT_SUBTYPE_BDA_IP_CONTROL
{
}
enum CLSID_PINNAME_MPE = GUID(0xc1b06d73, 0x1dbb, 0x11d3, [0x8f, 0x46, 0x0, 0xc0, 0x4f, 0x79, 0x71, 0xe2]);
struct PINNAME_MPE
{
}
enum CLSID_KSDATAFORMAT_TYPE_MPE = GUID(0x455f176c, 0x4b06, 0x47ce, [0x9a, 0xef, 0x8c, 0xae, 0xf7, 0x3d, 0xf7, 0xb5]);
struct KSDATAFORMAT_TYPE_MPE
{
}
enum CLSID_DIGITAL_CABLE_NETWORK_TYPE = GUID(0x143827ab, 0xf77b, 0x498d, [0x81, 0xca, 0x5a, 0x0, 0x7a, 0xec, 0x28, 0xbf]);
struct DIGITAL_CABLE_NETWORK_TYPE
{
}
enum CLSID_ANALOG_TV_NETWORK_TYPE = GUID(0xb820d87e, 0xe0e3, 0x478f, [0x8a, 0x38, 0x4e, 0x13, 0xf7, 0xb3, 0xdf, 0x42]);
struct ANALOG_TV_NETWORK_TYPE
{
}
enum CLSID_ANALOG_AUXIN_NETWORK_TYPE = GUID(0x742ef867, 0x9e1, 0x40a3, [0x82, 0xd3, 0x96, 0x69, 0xba, 0x35, 0x32, 0x5f]);
struct ANALOG_AUXIN_NETWORK_TYPE
{
}
enum CLSID_ANALOG_FM_NETWORK_TYPE = GUID(0x7728087b, 0x2bb9, 0x4e30, [0x80, 0x78, 0x44, 0x94, 0x76, 0xe5, 0x9d, 0xbb]);
struct ANALOG_FM_NETWORK_TYPE
{
}
enum CLSID_ISDB_TERRESTRIAL_TV_NETWORK_TYPE = GUID(0x95037f6f, 0x3ac7, 0x4452, [0xb6, 0xc4, 0x45, 0xa9, 0xce, 0x92, 0x92, 0xa2]);
struct ISDB_TERRESTRIAL_TV_NETWORK_TYPE
{
}
enum CLSID_ISDB_T_NETWORK_TYPE = GUID(0xfc3855a6, 0xc901, 0x4f2e, [0xab, 0xa8, 0x90, 0x81, 0x5a, 0xfc, 0x6c, 0x83]);
struct ISDB_T_NETWORK_TYPE
{
}
enum CLSID_ISDB_SATELLITE_TV_NETWORK_TYPE = GUID(0xb0a4e6a0, 0x6a1a, 0x4b83, [0xbb, 0x5b, 0x90, 0x3e, 0x1d, 0x90, 0xe6, 0xb6]);
struct ISDB_SATELLITE_TV_NETWORK_TYPE
{
}
enum CLSID_ISDB_S_NETWORK_TYPE = GUID(0xa1e78202, 0x1459, 0x41b1, [0x9c, 0xa9, 0x2a, 0x92, 0x58, 0x7a, 0x42, 0xcc]);
struct ISDB_S_NETWORK_TYPE
{
}
enum CLSID_ISDB_CABLE_TV_NETWORK_TYPE = GUID(0xc974ddb5, 0x41fe, 0x4b25, [0x97, 0x41, 0x92, 0xf0, 0x49, 0xf1, 0xd5, 0xd1]);
struct ISDB_CABLE_TV_NETWORK_TYPE
{
}
enum CLSID_DIRECT_TV_SATELLITE_TV_NETWORK_TYPE = GUID(0x93b66fb5, 0x93d4, 0x4323, [0x92, 0x1c, 0xc1, 0xf5, 0x2d, 0xf6, 0x1d, 0x3f]);
struct DIRECT_TV_SATELLITE_TV_NETWORK_TYPE
{
}
enum CLSID_ECHOSTAR_SATELLITE_TV_NETWORK_TYPE = GUID(0xc4f6b31b, 0xc6bf, 0x4759, [0x88, 0x6f, 0xa7, 0x38, 0x6d, 0xca, 0x27, 0xa0]);
struct ECHOSTAR_SATELLITE_TV_NETWORK_TYPE
{
}
enum CLSID_ATSC_TERRESTRIAL_TV_NETWORK_TYPE = GUID(0xdad2fdd, 0x5fd7, 0x11d3, [0x8f, 0x50, 0x0, 0xc0, 0x4f, 0x79, 0x71, 0xe2]);
struct ATSC_TERRESTRIAL_TV_NETWORK_TYPE
{
}
enum CLSID_DVB_TERRESTRIAL_TV_NETWORK_TYPE = GUID(0x216c62df, 0x6d7f, 0x4e9a, [0x85, 0x71, 0x5, 0xf1, 0x4e, 0xdb, 0x76, 0x6a]);
struct DVB_TERRESTRIAL_TV_NETWORK_TYPE
{
}
enum CLSID_BSKYB_TERRESTRIAL_TV_NETWORK_TYPE = GUID(0x9e9e46c6, 0x3aba, 0x4f08, [0xad, 0xe, 0xcc, 0x5a, 0xc8, 0x14, 0x8c, 0x2b]);
struct BSKYB_TERRESTRIAL_TV_NETWORK_TYPE
{
}
enum CLSID_DVB_SATELLITE_TV_NETWORK_TYPE = GUID(0xfa4b375a, 0x45b4, 0x4d45, [0x84, 0x40, 0x26, 0x39, 0x57, 0xb1, 0x16, 0x23]);
struct DVB_SATELLITE_TV_NETWORK_TYPE
{
}
enum CLSID_DVB_CABLE_TV_NETWORK_TYPE = GUID(0xdc0c0fe7, 0x485, 0x4266, [0xb9, 0x3f, 0x68, 0xfb, 0xf8, 0xe, 0xd8, 0x34]);
struct DVB_CABLE_TV_NETWORK_TYPE
{
}
enum CLSID_BDA_DEBUG_DATA_AVAILABLE = GUID(0x69c24f54, 0x9983, 0x497e, [0xb4, 0x15, 0x28, 0x2b, 0xe4, 0xc5, 0x55, 0xfb]);
struct BDA_DEBUG_DATA_AVAILABLE
{
}
enum CLSID_BDA_DEBUG_DATA_TYPE_STRING = GUID(0xa806e767, 0xde5c, 0x430c, [0x80, 0xbf, 0xa2, 0x1e, 0xbe, 0x6, 0xc7, 0x48]);
struct BDA_DEBUG_DATA_TYPE_STRING
{
}
enum CLSID_EVENTID_BDA_IsdbCASResponse = GUID(0xd4cb1966, 0x41bc, 0x4ced, [0x9a, 0x20, 0xfd, 0xce, 0xac, 0x78, 0xf7, 0xd]);
struct EVENTID_BDA_IsdbCASResponse
{
}
enum CLSID_EVENTID_BDA_CASRequestTuner = GUID(0xcf39a9d8, 0xf5d3, 0x4685, [0xbe, 0x57, 0xed, 0x81, 0xdb, 0xa4, 0x6b, 0x27]);
struct EVENTID_BDA_CASRequestTuner
{
}
enum CLSID_EVENTID_BDA_CASReleaseTuner = GUID(0x20c1a16b, 0x441f, 0x49a5, [0xbb, 0x5c, 0xe9, 0xa0, 0x44, 0x95, 0xc6, 0xc1]);
struct EVENTID_BDA_CASReleaseTuner
{
}
enum CLSID_EVENTID_BDA_CASOpenMMI = GUID(0x85dac915, 0xe593, 0x410d, [0x84, 0x71, 0xd6, 0x81, 0x21, 0x5, 0xf2, 0x8e]);
struct EVENTID_BDA_CASOpenMMI
{
}
enum CLSID_EVENTID_BDA_CASCloseMMI = GUID(0x5d0f550f, 0xde2e, 0x479d, [0x83, 0x45, 0xec, 0xe, 0x95, 0x57, 0xe8, 0xa2]);
struct EVENTID_BDA_CASCloseMMI
{
}
enum CLSID_EVENTID_BDA_CASBroadcastMMI = GUID(0x676876f0, 0x1132, 0x404c, [0xa7, 0xca, 0xe7, 0x20, 0x69, 0xa9, 0xd5, 0x4f]);
struct EVENTID_BDA_CASBroadcastMMI
{
}
enum CLSID_EVENTID_BDA_TunerSignalLock = GUID(0x1872e740, 0xf573, 0x429b, [0xa0, 0xe, 0xd9, 0xc1, 0xe4, 0x8, 0xaf, 0x9]);
struct EVENTID_BDA_TunerSignalLock
{
}
enum CLSID_EVENTID_BDA_TunerNoSignal = GUID(0xe29b382b, 0x1edd, 0x4930, [0xbc, 0x46, 0x68, 0x2f, 0xd7, 0x2d, 0x2d, 0xfb]);
struct EVENTID_BDA_TunerNoSignal
{
}
enum CLSID_EVENTID_BDA_GPNVValueUpdate = GUID(0xff75c68c, 0xf416, 0x4e7e, [0xbf, 0x17, 0x6d, 0x55, 0xc5, 0xdf, 0x15, 0x75]);
struct EVENTID_BDA_GPNVValueUpdate
{
}
enum CLSID_EVENTID_BDA_UpdateDrmStatus = GUID(0x65a6f681, 0x1462, 0x473b, [0x88, 0xce, 0xcb, 0x73, 0x14, 0x27, 0xbd, 0xb5]);
struct EVENTID_BDA_UpdateDrmStatus
{
}
enum CLSID_EVENTID_BDA_UpdateScanState = GUID(0x55702b50, 0x7b49, 0x42b8, [0xa8, 0x2f, 0x4a, 0xfb, 0x69, 0x1b, 0x6, 0x28]);
struct EVENTID_BDA_UpdateScanState
{
}
enum CLSID_EVENTID_BDA_GuideDataAvailable = GUID(0x98db717a, 0x478a, 0x4cd4, [0x92, 0xd0, 0x95, 0xf6, 0x6b, 0x89, 0xe5, 0xb1]);
struct EVENTID_BDA_GuideDataAvailable
{
}
enum CLSID_EVENTID_BDA_GuideServiceInformationUpdated = GUID(0xa1c3ea2b, 0x175f, 0x4458, [0xb7, 0x35, 0x50, 0x7d, 0x22, 0xdb, 0x23, 0xa6]);
struct EVENTID_BDA_GuideServiceInformationUpdated
{
}
enum CLSID_EVENTID_BDA_GuideDataError = GUID(0xac33c448, 0x6f73, 0x4fd7, [0xb3, 0x41, 0x59, 0x4c, 0x36, 0xd, 0x8d, 0x74]);
struct EVENTID_BDA_GuideDataError
{
}
enum CLSID_EVENTID_BDA_DiseqCResponseAvailable = GUID(0xefa628f8, 0x1f2c, 0x4b67, [0x9e, 0xa5, 0xac, 0xf6, 0xfa, 0x9a, 0x1f, 0x36]);
struct EVENTID_BDA_DiseqCResponseAvailable
{
}
enum CLSID_EVENTID_BDA_LbigsOpenConnection = GUID(0x356207b2, 0x6f31, 0x4eb0, [0xa2, 0x71, 0xb3, 0xfa, 0x6b, 0xb7, 0x68, 0xf]);
struct EVENTID_BDA_LbigsOpenConnection
{
}
enum CLSID_EVENTID_BDA_LbigsSendData = GUID(0x1123277b, 0xf1c6, 0x4154, [0x8b, 0xd, 0x48, 0xe6, 0x15, 0x70, 0x59, 0xaa]);
struct EVENTID_BDA_LbigsSendData
{
}
enum CLSID_EVENTID_BDA_LbigsCloseConnectionHandle = GUID(0xc2f08b99, 0x65ef, 0x4314, [0x96, 0x71, 0xe9, 0x9d, 0x4c, 0xce, 0xb, 0xae]);
struct EVENTID_BDA_LbigsCloseConnectionHandle
{
}
enum CLSID_EVENTID_BDA_EncoderSignalLock = GUID(0x5ec90eb9, 0x39fa, 0x4cfc, [0xb9, 0x3f, 0x0, 0xbb, 0x11, 0x7, 0x7f, 0x5e]);
struct EVENTID_BDA_EncoderSignalLock
{
}
enum CLSID_EVENTID_BDA_FdcStatus = GUID(0x5f25366, 0xd0eb, 0x43d2, [0xbc, 0x3c, 0x68, 0x2b, 0x86, 0x3d, 0xf1, 0x42]);
struct EVENTID_BDA_FdcStatus
{
}
enum CLSID_EVENTID_BDA_FdcTableSection = GUID(0x6a0cd757, 0x4ce3, 0x4e5b, [0x94, 0x44, 0x71, 0x87, 0xb8, 0x71, 0x52, 0xc5]);
struct EVENTID_BDA_FdcTableSection
{
}
enum CLSID_EVENTID_BDA_TransprtStreamSelectorInfo = GUID(0xc40f9f85, 0x9d0, 0x489c, [0x9e, 0x9c, 0xa, 0xbb, 0xb5, 0x69, 0x51, 0xb0]);
struct EVENTID_BDA_TransprtStreamSelectorInfo
{
}
enum CLSID_EVENTID_BDA_RatingPinReset = GUID(0xc6e048c0, 0xc574, 0x4c26, [0xbc, 0xda, 0x2f, 0x4d, 0x35, 0xeb, 0x5e, 0x85]);
struct EVENTID_BDA_RatingPinReset
{
}
enum CLSID_PBDA_ALWAYS_TUNE_IN_MUX = GUID(0x1e1d7141, 0x583f, 0x4ac2, [0xb0, 0x19, 0x1f, 0x43, 0xe, 0xda, 0xf, 0x4c]);
struct PBDA_ALWAYS_TUNE_IN_MUX
{
}
struct PID_BITS
{
    align (1):
    ushort _bitfield0;
}
struct MPEG_HEADER_BITS
{
    align (1):
    ushort _bitfield0;
}
struct MPEG_HEADER_VERSION_BITS
{
    ubyte _bitfield0;
}
enum CLSID_BDANETWORKTYPE_ATSC = GUID(0x71985f51, 0x1ca1, 0x11d3, [0x9c, 0xc8, 0x0, 0xc0, 0x4f, 0x79, 0x71, 0xe0]);
struct BDANETWORKTYPE_ATSC
{
}
