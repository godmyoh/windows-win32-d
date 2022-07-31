module windows.win32.media.windowsmediaformat;

import windows.win32.guid : GUID;
import windows.win32.foundation : BOOL, BSTR, HRESULT, LPARAM, PWSTR, RECT;
import windows.win32.graphics.gdi : BITMAPINFOHEADER;
import windows.win32.system.com_ : IStream, IUnknown, VARIANT;

version (Windows):
extern (Windows):

HRESULT WMIsContentProtected(const(wchar)*, BOOL*);
HRESULT WMCreateWriter(IUnknown, IWMWriter*);
HRESULT WMCreateReader(IUnknown, uint, IWMReader*);
HRESULT WMCreateSyncReader(IUnknown, uint, IWMSyncReader*);
HRESULT WMCreateEditor(IWMMetadataEditor*);
HRESULT WMCreateIndexer(IWMIndexer*);
HRESULT WMCreateBackupRestorer(IUnknown, IWMLicenseBackup*);
HRESULT WMCreateProfileManager(IWMProfileManager*);
HRESULT WMCreateWriterFileSink(IWMWriterFileSink*);
HRESULT WMCreateWriterNetworkSink(IWMWriterNetworkSink*);
HRESULT WMCreateWriterPushSink(IWMWriterPushSink*);
enum WMT_VIDEOIMAGE_SAMPLE_INPUT_FRAME = 0x00000001;
enum WMT_VIDEOIMAGE_SAMPLE_OUTPUT_FRAME = 0x00000002;
enum WMT_VIDEOIMAGE_SAMPLE_USES_CURRENT_INPUT_FRAME = 0x00000004;
enum WMT_VIDEOIMAGE_SAMPLE_USES_PREVIOUS_INPUT_FRAME = 0x00000008;
enum WMT_VIDEOIMAGE_SAMPLE_MOTION = 0x00000001;
enum WMT_VIDEOIMAGE_SAMPLE_ROTATION = 0x00000002;
enum WMT_VIDEOIMAGE_SAMPLE_BLENDING = 0x00000004;
enum WMT_VIDEOIMAGE_SAMPLE_ADV_BLENDING = 0x00000008;
enum WMT_VIDEOIMAGE_INTEGER_DENOMINATOR = 0x00010000;
enum WMT_VIDEOIMAGE_MAGIC_NUMBER = 0x1d4a45f2;
enum WMT_VIDEOIMAGE_MAGIC_NUMBER_2 = 0x1d4a45f3;
enum WMT_VIDEOIMAGE_TRANSITION_BOW_TIE = 0x0000000b;
enum WMT_VIDEOIMAGE_TRANSITION_CIRCLE = 0x0000000c;
enum WMT_VIDEOIMAGE_TRANSITION_CROSS_FADE = 0x0000000d;
enum WMT_VIDEOIMAGE_TRANSITION_DIAGONAL = 0x0000000e;
enum WMT_VIDEOIMAGE_TRANSITION_DIAMOND = 0x0000000f;
enum WMT_VIDEOIMAGE_TRANSITION_FADE_TO_COLOR = 0x00000010;
enum WMT_VIDEOIMAGE_TRANSITION_FILLED_V = 0x00000011;
enum WMT_VIDEOIMAGE_TRANSITION_FLIP = 0x00000012;
enum WMT_VIDEOIMAGE_TRANSITION_INSET = 0x00000013;
enum WMT_VIDEOIMAGE_TRANSITION_IRIS = 0x00000014;
enum WMT_VIDEOIMAGE_TRANSITION_PAGE_ROLL = 0x00000015;
enum WMT_VIDEOIMAGE_TRANSITION_RECTANGLE = 0x00000017;
enum WMT_VIDEOIMAGE_TRANSITION_REVEAL = 0x00000018;
enum WMT_VIDEOIMAGE_TRANSITION_SLIDE = 0x0000001b;
enum WMT_VIDEOIMAGE_TRANSITION_SPLIT = 0x0000001d;
enum WMT_VIDEOIMAGE_TRANSITION_STAR = 0x0000001e;
enum WMT_VIDEOIMAGE_TRANSITION_WHEEL = 0x0000001f;
enum WM_SampleExtension_ContentType_Size = 0x00000001;
enum WM_SampleExtension_PixelAspectRatio_Size = 0x00000002;
enum WM_SampleExtension_Timecode_Size = 0x0000000e;
enum WM_SampleExtension_SampleDuration_Size = 0x00000002;
enum WM_SampleExtension_ChromaLocation_Size = 0x00000001;
enum WM_SampleExtension_ColorSpaceInfo_Size = 0x00000003;
enum WM_CT_REPEAT_FIRST_FIELD = 0x00000010;
enum WM_CT_BOTTOM_FIELD_FIRST = 0x00000020;
enum WM_CT_TOP_FIELD_FIRST = 0x00000040;
enum WM_CT_INTERLACED = 0x00000080;
enum WM_CL_INTERLACED420 = 0x00000000;
enum WM_CL_PROGRESSIVE420 = 0x00000001;
enum WM_MAX_VIDEO_STREAMS = 0x0000003f;
enum WM_MAX_STREAMS = 0x0000003f;
enum WMDRM_IMPORT_INIT_STRUCT_DEFINED = 0x00000001;
enum DRM_OPL_TYPES = 0x00000001;
enum g_dwWMSpecialAttributes = 0x00000014;
enum g_wszWMDuration = "Duration";
enum g_wszWMBitrate = "Bitrate";
enum g_wszWMSeekable = "Seekable";
enum g_wszWMStridable = "Stridable";
enum g_wszWMBroadcast = "Broadcast";
enum g_wszWMProtected = "Is_Protected";
enum g_wszWMTrusted = "Is_Trusted";
enum g_wszWMSignature_Name = "Signature_Name";
enum g_wszWMHasAudio = "HasAudio";
enum g_wszWMHasImage = "HasImage";
enum g_wszWMHasScript = "HasScript";
enum g_wszWMHasVideo = "HasVideo";
enum g_wszWMCurrentBitrate = "CurrentBitrate";
enum g_wszWMOptimalBitrate = "OptimalBitrate";
enum g_wszWMHasAttachedImages = "HasAttachedImages";
enum g_wszWMSkipBackward = "Can_Skip_Backward";
enum g_wszWMSkipForward = "Can_Skip_Forward";
enum g_wszWMNumberOfFrames = "NumberOfFrames";
enum g_wszWMFileSize = "FileSize";
enum g_wszWMHasArbitraryDataStream = "HasArbitraryDataStream";
enum g_wszWMHasFileTransferStream = "HasFileTransferStream";
enum g_wszWMContainerFormat = "WM/ContainerFormat";
enum g_dwWMContentAttributes = 0x00000005;
enum g_wszWMTitle = "Title";
enum g_wszWMTitleSort = "TitleSort";
enum g_wszWMAuthor = "Author";
enum g_wszWMAuthorSort = "AuthorSort";
enum g_wszWMDescription = "Description";
enum g_wszWMRating = "Rating";
enum g_wszWMCopyright = "Copyright";
enum g_wszWMUse_DRM = "Use_DRM";
enum g_wszWMDRM_Flags = "DRM_Flags";
enum g_wszWMDRM_Level = "DRM_Level";
enum g_wszWMUse_Advanced_DRM = "Use_Advanced_DRM";
enum g_wszWMDRM_KeySeed = "DRM_KeySeed";
enum g_wszWMDRM_KeyID = "DRM_KeyID";
enum g_wszWMDRM_ContentID = "DRM_ContentID";
enum g_wszWMDRM_SourceID = "DRM_SourceID";
enum g_wszWMDRM_IndividualizedVersion = "DRM_IndividualizedVersion";
enum g_wszWMDRM_LicenseAcqURL = "DRM_LicenseAcqURL";
enum g_wszWMDRM_V1LicenseAcqURL = "DRM_V1LicenseAcqURL";
enum g_wszWMDRM_HeaderSignPrivKey = "DRM_HeaderSignPrivKey";
enum g_wszWMDRM_LASignaturePrivKey = "DRM_LASignaturePrivKey";
enum g_wszWMDRM_LASignatureCert = "DRM_LASignatureCert";
enum g_wszWMDRM_LASignatureLicSrvCert = "DRM_LASignatureLicSrvCert";
enum g_wszWMDRM_LASignatureRootCert = "DRM_LASignatureRootCert";
enum g_wszWMAlbumTitle = "WM/AlbumTitle";
enum g_wszWMAlbumTitleSort = "WM/AlbumTitleSort";
enum g_wszWMTrack = "WM/Track";
enum g_wszWMPromotionURL = "WM/PromotionURL";
enum g_wszWMAlbumCoverURL = "WM/AlbumCoverURL";
enum g_wszWMGenre = "WM/Genre";
enum g_wszWMYear = "WM/Year";
enum g_wszWMGenreID = "WM/GenreID";
enum g_wszWMMCDI = "WM/MCDI";
enum g_wszWMComposer = "WM/Composer";
enum g_wszWMComposerSort = "WM/ComposerSort";
enum g_wszWMLyrics = "WM/Lyrics";
enum g_wszWMTrackNumber = "WM/TrackNumber";
enum g_wszWMToolName = "WM/ToolName";
enum g_wszWMToolVersion = "WM/ToolVersion";
enum g_wszWMIsVBR = "IsVBR";
enum g_wszWMAlbumArtist = "WM/AlbumArtist";
enum g_wszWMAlbumArtistSort = "WM/AlbumArtistSort";
enum g_wszWMBannerImageType = "BannerImageType";
enum g_wszWMBannerImageData = "BannerImageData";
enum g_wszWMBannerImageURL = "BannerImageURL";
enum g_wszWMCopyrightURL = "CopyrightURL";
enum g_wszWMAspectRatioX = "AspectRatioX";
enum g_wszWMAspectRatioY = "AspectRatioY";
enum g_wszASFLeakyBucketPairs = "ASFLeakyBucketPairs";
enum g_dwWMNSCAttributes = 0x00000005;
enum g_wszWMNSCName = "NSC_Name";
enum g_wszWMNSCAddress = "NSC_Address";
enum g_wszWMNSCPhone = "NSC_Phone";
enum g_wszWMNSCEmail = "NSC_Email";
enum g_wszWMNSCDescription = "NSC_Description";
enum g_wszWMWriter = "WM/Writer";
enum g_wszWMConductor = "WM/Conductor";
enum g_wszWMProducer = "WM/Producer";
enum g_wszWMDirector = "WM/Director";
enum g_wszWMContentGroupDescription = "WM/ContentGroupDescription";
enum g_wszWMSubTitle = "WM/SubTitle";
enum g_wszWMPartOfSet = "WM/PartOfSet";
enum g_wszWMProtectionType = "WM/ProtectionType";
enum g_wszWMVideoHeight = "WM/VideoHeight";
enum g_wszWMVideoWidth = "WM/VideoWidth";
enum g_wszWMVideoFrameRate = "WM/VideoFrameRate";
enum g_wszWMMediaClassPrimaryID = "WM/MediaClassPrimaryID";
enum g_wszWMMediaClassSecondaryID = "WM/MediaClassSecondaryID";
enum g_wszWMPeriod = "WM/Period";
enum g_wszWMCategory = "WM/Category";
enum g_wszWMPicture = "WM/Picture";
enum g_wszWMLyrics_Synchronised = "WM/Lyrics_Synchronised";
enum g_wszWMOriginalLyricist = "WM/OriginalLyricist";
enum g_wszWMOriginalArtist = "WM/OriginalArtist";
enum g_wszWMOriginalAlbumTitle = "WM/OriginalAlbumTitle";
enum g_wszWMOriginalReleaseYear = "WM/OriginalReleaseYear";
enum g_wszWMOriginalFilename = "WM/OriginalFilename";
enum g_wszWMPublisher = "WM/Publisher";
enum g_wszWMEncodedBy = "WM/EncodedBy";
enum g_wszWMEncodingSettings = "WM/EncodingSettings";
enum g_wszWMEncodingTime = "WM/EncodingTime";
enum g_wszWMAuthorURL = "WM/AuthorURL";
enum g_wszWMUserWebURL = "WM/UserWebURL";
enum g_wszWMAudioFileURL = "WM/AudioFileURL";
enum g_wszWMAudioSourceURL = "WM/AudioSourceURL";
enum g_wszWMLanguage = "WM/Language";
enum g_wszWMParentalRating = "WM/ParentalRating";
enum g_wszWMBeatsPerMinute = "WM/BeatsPerMinute";
enum g_wszWMInitialKey = "WM/InitialKey";
enum g_wszWMMood = "WM/Mood";
enum g_wszWMText = "WM/Text";
enum g_wszWMDVDID = "WM/DVDID";
enum g_wszWMWMContentID = "WM/WMContentID";
enum g_wszWMWMCollectionID = "WM/WMCollectionID";
enum g_wszWMWMCollectionGroupID = "WM/WMCollectionGroupID";
enum g_wszWMUniqueFileIdentifier = "WM/UniqueFileIdentifier";
enum g_wszWMModifiedBy = "WM/ModifiedBy";
enum g_wszWMRadioStationName = "WM/RadioStationName";
enum g_wszWMRadioStationOwner = "WM/RadioStationOwner";
enum g_wszWMPlaylistDelay = "WM/PlaylistDelay";
enum g_wszWMCodec = "WM/Codec";
enum g_wszWMDRM = "WM/DRM";
enum g_wszWMISRC = "WM/ISRC";
enum g_wszWMProvider = "WM/Provider";
enum g_wszWMProviderRating = "WM/ProviderRating";
enum g_wszWMProviderStyle = "WM/ProviderStyle";
enum g_wszWMContentDistributor = "WM/ContentDistributor";
enum g_wszWMSubscriptionContentID = "WM/SubscriptionContentID";
enum g_wszWMWMADRCPeakReference = "WM/WMADRCPeakReference";
enum g_wszWMWMADRCPeakTarget = "WM/WMADRCPeakTarget";
enum g_wszWMWMADRCAverageReference = "WM/WMADRCAverageReference";
enum g_wszWMWMADRCAverageTarget = "WM/WMADRCAverageTarget";
enum g_wszWMStreamTypeInfo = "WM/StreamTypeInfo";
enum g_wszWMPeakBitrate = "WM/PeakBitrate";
enum g_wszWMASFPacketCount = "WM/ASFPacketCount";
enum g_wszWMASFSecurityObjectsSize = "WM/ASFSecurityObjectsSize";
enum g_wszWMSharedUserRating = "WM/SharedUserRating";
enum g_wszWMSubTitleDescription = "WM/SubTitleDescription";
enum g_wszWMMediaCredits = "WM/MediaCredits";
enum g_wszWMParentalRatingReason = "WM/ParentalRatingReason";
enum g_wszWMOriginalReleaseTime = "WM/OriginalReleaseTime";
enum g_wszWMMediaStationCallSign = "WM/MediaStationCallSign";
enum g_wszWMMediaStationName = "WM/MediaStationName";
enum g_wszWMMediaNetworkAffiliation = "WM/MediaNetworkAffiliation";
enum g_wszWMMediaOriginalChannel = "WM/MediaOriginalChannel";
enum g_wszWMMediaOriginalBroadcastDateTime = "WM/MediaOriginalBroadcastDateTime";
enum g_wszWMMediaIsStereo = "WM/MediaIsStereo";
enum g_wszWMVideoClosedCaptioning = "WM/VideoClosedCaptioning";
enum g_wszWMMediaIsRepeat = "WM/MediaIsRepeat";
enum g_wszWMMediaIsLive = "WM/MediaIsLive";
enum g_wszWMMediaIsTape = "WM/MediaIsTape";
enum g_wszWMMediaIsDelay = "WM/MediaIsDelay";
enum g_wszWMMediaIsSubtitled = "WM/MediaIsSubtitled";
enum g_wszWMMediaIsPremiere = "WM/MediaIsPremiere";
enum g_wszWMMediaIsFinale = "WM/MediaIsFinale";
enum g_wszWMMediaIsSAP = "WM/MediaIsSAP";
enum g_wszWMProviderCopyright = "WM/ProviderCopyright";
enum g_wszWMISAN = "WM/ISAN";
enum g_wszWMADID = "WM/ADID";
enum g_wszWMWMShadowFileSourceFileType = "WM/WMShadowFileSourceFileType";
enum g_wszWMWMShadowFileSourceDRMType = "WM/WMShadowFileSourceDRMType";
enum g_wszWMWMCPDistributor = "WM/WMCPDistributor";
enum g_wszWMWMCPDistributorID = "WM/WMCPDistributorID";
enum g_wszWMSeasonNumber = "WM/SeasonNumber";
enum g_wszWMEpisodeNumber = "WM/EpisodeNumber";
enum g_wszEarlyDataDelivery = "EarlyDataDelivery";
enum g_wszJustInTimeDecode = "JustInTimeDecode";
enum g_wszSingleOutputBuffer = "SingleOutputBuffer";
enum g_wszSoftwareScaling = "SoftwareScaling";
enum g_wszDeliverOnReceive = "DeliverOnReceive";
enum g_wszScrambledAudio = "ScrambledAudio";
enum g_wszDedicatedDeliveryThread = "DedicatedDeliveryThread";
enum g_wszEnableDiscreteOutput = "EnableDiscreteOutput";
enum g_wszSpeakerConfig = "SpeakerConfig";
enum g_wszDynamicRangeControl = "DynamicRangeControl";
enum g_wszAllowInterlacedOutput = "AllowInterlacedOutput";
enum g_wszVideoSampleDurations = "VideoSampleDurations";
enum g_wszStreamLanguage = "StreamLanguage";
enum g_wszEnableWMAProSPDIFOutput = "EnableWMAProSPDIFOutput";
enum g_wszDeinterlaceMode = "DeinterlaceMode";
enum g_wszInitialPatternForInverseTelecine = "InitialPatternForInverseTelecine";
enum g_wszJPEGCompressionQuality = "JPEGCompressionQuality";
enum g_wszWatermarkCLSID = "WatermarkCLSID";
enum g_wszWatermarkConfig = "WatermarkConfig";
enum g_wszInterlacedCoding = "InterlacedCoding";
enum g_wszFixedFrameRate = "FixedFrameRate";
enum g_wszOriginalSourceFormatTag = "_SOURCEFORMATTAG";
enum g_wszOriginalWaveFormat = "_ORIGINALWAVEFORMAT";
enum g_wszEDL = "_EDL";
enum g_wszComplexity = "_COMPLEXITYEX";
enum g_wszDecoderComplexityRequested = "_DECODERCOMPLEXITYPROFILE";
enum g_wszReloadIndexOnSeek = "ReloadIndexOnSeek";
enum g_wszStreamNumIndexObjects = "StreamNumIndexObjects";
enum g_wszFailSeekOnError = "FailSeekOnError";
enum g_wszPermitSeeksBeyondEndOfStream = "PermitSeeksBeyondEndOfStream";
enum g_wszUsePacketAtSeekPoint = "UsePacketAtSeekPoint";
enum g_wszSourceBufferTime = "SourceBufferTime";
enum g_wszSourceMaxBytesAtOnce = "SourceMaxBytesAtOnce";
enum g_wszVBREnabled = "_VBRENABLED";
enum g_wszVBRQuality = "_VBRQUALITY";
enum g_wszVBRBitrateMax = "_RMAX";
enum g_wszVBRBufferWindowMax = "_BMAX";
enum g_wszVBRPeak = "VBR Peak";
enum g_wszBufferAverage = "Buffer Average";
enum g_wszComplexityMax = "_COMPLEXITYEXMAX";
enum g_wszComplexityOffline = "_COMPLEXITYEXOFFLINE";
enum g_wszComplexityLive = "_COMPLEXITYEXLIVE";
enum g_wszIsVBRSupported = "_ISVBRSUPPORTED";
enum g_wszNumPasses = "_PASSESUSED";
enum g_wszMusicSpeechClassMode = "MusicSpeechClassMode";
enum g_wszMusicClassMode = "MusicClassMode";
enum g_wszSpeechClassMode = "SpeechClassMode";
enum g_wszMixedClassMode = "MixedClassMode";
enum g_wszSpeechCaps = "SpeechFormatCap";
enum g_wszPeakValue = "PeakValue";
enum g_wszAverageLevel = "AverageLevel";
enum g_wszFold6To2Channels3 = "Fold6To2Channels3";
enum g_wszFoldToChannelsTemplate = "Fold%luTo%luChannels%lu";
enum g_wszDeviceConformanceTemplate = "DeviceConformanceTemplate";
enum g_wszEnableFrameInterpolation = "EnableFrameInterpolation";
enum g_wszNeedsPreviousSample = "NeedsPreviousSample";
enum g_wszWMIsCompilation = "WM/IsCompilation";
enum WMMEDIASUBTYPE_Base = GUID(0x0, 0x0, 0x10, [0x80, 0x0, 0x0, 0xaa, 0x0, 0x38, 0x9b, 0x71]);
enum WMMEDIATYPE_Video = GUID(0x73646976, 0x0, 0x10, [0x80, 0x0, 0x0, 0xaa, 0x0, 0x38, 0x9b, 0x71]);
enum WMMEDIASUBTYPE_RGB1 = GUID(0xe436eb78, 0x524f, 0x11ce, [0x9f, 0x53, 0x0, 0x20, 0xaf, 0xb, 0xa7, 0x70]);
enum WMMEDIASUBTYPE_RGB4 = GUID(0xe436eb79, 0x524f, 0x11ce, [0x9f, 0x53, 0x0, 0x20, 0xaf, 0xb, 0xa7, 0x70]);
enum WMMEDIASUBTYPE_RGB8 = GUID(0xe436eb7a, 0x524f, 0x11ce, [0x9f, 0x53, 0x0, 0x20, 0xaf, 0xb, 0xa7, 0x70]);
enum WMMEDIASUBTYPE_RGB565 = GUID(0xe436eb7b, 0x524f, 0x11ce, [0x9f, 0x53, 0x0, 0x20, 0xaf, 0xb, 0xa7, 0x70]);
enum WMMEDIASUBTYPE_RGB555 = GUID(0xe436eb7c, 0x524f, 0x11ce, [0x9f, 0x53, 0x0, 0x20, 0xaf, 0xb, 0xa7, 0x70]);
enum WMMEDIASUBTYPE_RGB24 = GUID(0xe436eb7d, 0x524f, 0x11ce, [0x9f, 0x53, 0x0, 0x20, 0xaf, 0xb, 0xa7, 0x70]);
enum WMMEDIASUBTYPE_RGB32 = GUID(0xe436eb7e, 0x524f, 0x11ce, [0x9f, 0x53, 0x0, 0x20, 0xaf, 0xb, 0xa7, 0x70]);
enum WMMEDIASUBTYPE_I420 = GUID(0x30323449, 0x0, 0x10, [0x80, 0x0, 0x0, 0xaa, 0x0, 0x38, 0x9b, 0x71]);
enum WMMEDIASUBTYPE_IYUV = GUID(0x56555949, 0x0, 0x10, [0x80, 0x0, 0x0, 0xaa, 0x0, 0x38, 0x9b, 0x71]);
enum WMMEDIASUBTYPE_YV12 = GUID(0x32315659, 0x0, 0x10, [0x80, 0x0, 0x0, 0xaa, 0x0, 0x38, 0x9b, 0x71]);
enum WMMEDIASUBTYPE_YUY2 = GUID(0x32595559, 0x0, 0x10, [0x80, 0x0, 0x0, 0xaa, 0x0, 0x38, 0x9b, 0x71]);
enum WMMEDIASUBTYPE_P422 = GUID(0x32323450, 0x0, 0x10, [0x80, 0x0, 0x0, 0xaa, 0x0, 0x38, 0x9b, 0x71]);
enum WMMEDIASUBTYPE_UYVY = GUID(0x59565955, 0x0, 0x10, [0x80, 0x0, 0x0, 0xaa, 0x0, 0x38, 0x9b, 0x71]);
enum WMMEDIASUBTYPE_YVYU = GUID(0x55595659, 0x0, 0x10, [0x80, 0x0, 0x0, 0xaa, 0x0, 0x38, 0x9b, 0x71]);
enum WMMEDIASUBTYPE_YVU9 = GUID(0x39555659, 0x0, 0x10, [0x80, 0x0, 0x0, 0xaa, 0x0, 0x38, 0x9b, 0x71]);
enum WMMEDIASUBTYPE_VIDEOIMAGE = GUID(0x1d4a45f2, 0xe5f6, 0x4b44, [0x83, 0x88, 0xf0, 0xae, 0x5c, 0xe, 0xc, 0x37]);
enum WMMEDIASUBTYPE_MP43 = GUID(0x3334504d, 0x0, 0x10, [0x80, 0x0, 0x0, 0xaa, 0x0, 0x38, 0x9b, 0x71]);
enum WMMEDIASUBTYPE_MP4S = GUID(0x5334504d, 0x0, 0x10, [0x80, 0x0, 0x0, 0xaa, 0x0, 0x38, 0x9b, 0x71]);
enum WMMEDIASUBTYPE_M4S2 = GUID(0x3253344d, 0x0, 0x10, [0x80, 0x0, 0x0, 0xaa, 0x0, 0x38, 0x9b, 0x71]);
enum WMMEDIASUBTYPE_WMV1 = GUID(0x31564d57, 0x0, 0x10, [0x80, 0x0, 0x0, 0xaa, 0x0, 0x38, 0x9b, 0x71]);
enum WMMEDIASUBTYPE_WMV2 = GUID(0x32564d57, 0x0, 0x10, [0x80, 0x0, 0x0, 0xaa, 0x0, 0x38, 0x9b, 0x71]);
enum WMMEDIASUBTYPE_MSS1 = GUID(0x3153534d, 0x0, 0x10, [0x80, 0x0, 0x0, 0xaa, 0x0, 0x38, 0x9b, 0x71]);
enum WMMEDIASUBTYPE_MPEG2_VIDEO = GUID(0xe06d8026, 0xdb46, 0x11cf, [0xb4, 0xd1, 0x0, 0x80, 0x5f, 0x6c, 0xbb, 0xea]);
enum WMMEDIATYPE_Audio = GUID(0x73647561, 0x0, 0x10, [0x80, 0x0, 0x0, 0xaa, 0x0, 0x38, 0x9b, 0x71]);
enum WMMEDIASUBTYPE_PCM = GUID(0x1, 0x0, 0x10, [0x80, 0x0, 0x0, 0xaa, 0x0, 0x38, 0x9b, 0x71]);
enum WMMEDIASUBTYPE_DRM = GUID(0x9, 0x0, 0x10, [0x80, 0x0, 0x0, 0xaa, 0x0, 0x38, 0x9b, 0x71]);
enum WMMEDIASUBTYPE_WMAudioV9 = GUID(0x162, 0x0, 0x10, [0x80, 0x0, 0x0, 0xaa, 0x0, 0x38, 0x9b, 0x71]);
enum WMMEDIASUBTYPE_WMAudio_Lossless = GUID(0x163, 0x0, 0x10, [0x80, 0x0, 0x0, 0xaa, 0x0, 0x38, 0x9b, 0x71]);
enum WMMEDIASUBTYPE_MSS2 = GUID(0x3253534d, 0x0, 0x10, [0x80, 0x0, 0x0, 0xaa, 0x0, 0x38, 0x9b, 0x71]);
enum WMMEDIASUBTYPE_WMSP1 = GUID(0xa, 0x0, 0x10, [0x80, 0x0, 0x0, 0xaa, 0x0, 0x38, 0x9b, 0x71]);
enum WMMEDIASUBTYPE_WMSP2 = GUID(0xb, 0x0, 0x10, [0x80, 0x0, 0x0, 0xaa, 0x0, 0x38, 0x9b, 0x71]);
enum WMMEDIASUBTYPE_WMV3 = GUID(0x33564d57, 0x0, 0x10, [0x80, 0x0, 0x0, 0xaa, 0x0, 0x38, 0x9b, 0x71]);
enum WMMEDIASUBTYPE_WMVP = GUID(0x50564d57, 0x0, 0x10, [0x80, 0x0, 0x0, 0xaa, 0x0, 0x38, 0x9b, 0x71]);
enum WMMEDIASUBTYPE_WVP2 = GUID(0x32505657, 0x0, 0x10, [0x80, 0x0, 0x0, 0xaa, 0x0, 0x38, 0x9b, 0x71]);
enum WMMEDIASUBTYPE_WMVA = GUID(0x41564d57, 0x0, 0x10, [0x80, 0x0, 0x0, 0xaa, 0x0, 0x38, 0x9b, 0x71]);
enum WMMEDIASUBTYPE_WVC1 = GUID(0x31435657, 0x0, 0x10, [0x80, 0x0, 0x0, 0xaa, 0x0, 0x38, 0x9b, 0x71]);
enum WMMEDIASUBTYPE_WMAudioV8 = GUID(0x161, 0x0, 0x10, [0x80, 0x0, 0x0, 0xaa, 0x0, 0x38, 0x9b, 0x71]);
enum WMMEDIASUBTYPE_WMAudioV7 = GUID(0x161, 0x0, 0x10, [0x80, 0x0, 0x0, 0xaa, 0x0, 0x38, 0x9b, 0x71]);
enum WMMEDIASUBTYPE_WMAudioV2 = GUID(0x161, 0x0, 0x10, [0x80, 0x0, 0x0, 0xaa, 0x0, 0x38, 0x9b, 0x71]);
enum WMMEDIASUBTYPE_ACELPnet = GUID(0x130, 0x0, 0x10, [0x80, 0x0, 0x0, 0xaa, 0x0, 0x38, 0x9b, 0x71]);
enum WMMEDIASUBTYPE_MP3 = GUID(0x55, 0x0, 0x10, [0x80, 0x0, 0x0, 0xaa, 0x0, 0x38, 0x9b, 0x71]);
enum WMMEDIASUBTYPE_WebStream = GUID(0x776257d4, 0xc627, 0x41cb, [0x8f, 0x81, 0x7a, 0xc7, 0xff, 0x1c, 0x40, 0xcc]);
enum WMMEDIATYPE_Script = GUID(0x73636d64, 0x0, 0x10, [0x80, 0x0, 0x0, 0xaa, 0x0, 0x38, 0x9b, 0x71]);
enum WMMEDIATYPE_Image = GUID(0x34a50fd8, 0x8aa5, 0x4386, [0x81, 0xfe, 0xa0, 0xef, 0xe0, 0x48, 0x8e, 0x31]);
enum WMMEDIATYPE_FileTransfer = GUID(0xd9e47579, 0x930e, 0x4427, [0xad, 0xfc, 0xad, 0x80, 0xf2, 0x90, 0xe4, 0x70]);
enum WMMEDIATYPE_Text = GUID(0x9bba1ea7, 0x5ab2, 0x4829, [0xba, 0x57, 0x9, 0x40, 0x20, 0x9b, 0xcf, 0x3e]);
enum WMFORMAT_VideoInfo = GUID(0x5589f80, 0xc356, 0x11ce, [0xbf, 0x1, 0x0, 0xaa, 0x0, 0x55, 0x59, 0x5a]);
enum WMFORMAT_MPEG2Video = GUID(0xe06d80e3, 0xdb46, 0x11cf, [0xb4, 0xd1, 0x0, 0x80, 0x5f, 0x6c, 0xbb, 0xea]);
enum WMFORMAT_WaveFormatEx = GUID(0x5589f81, 0xc356, 0x11ce, [0xbf, 0x1, 0x0, 0xaa, 0x0, 0x55, 0x59, 0x5a]);
enum WMFORMAT_Script = GUID(0x5c8510f2, 0xdebe, 0x4ca7, [0xbb, 0xa5, 0xf0, 0x7a, 0x10, 0x4f, 0x8d, 0xff]);
enum WMFORMAT_WebStream = GUID(0xda1e6b13, 0x8359, 0x4050, [0xb3, 0x98, 0x38, 0x8e, 0x96, 0x5b, 0xf0, 0xc]);
enum WMSCRIPTTYPE_TwoStrings = GUID(0x82f38a70, 0xc29f, 0x11d1, [0x97, 0xad, 0x0, 0xa0, 0xc9, 0x5e, 0xa8, 0x50]);
enum WM_SampleExtensionGUID_OutputCleanPoint = GUID(0xf72a3c6f, 0x6eb4, 0x4ebc, [0xb1, 0x92, 0x9, 0xad, 0x97, 0x59, 0xe8, 0x28]);
enum WM_SampleExtensionGUID_Timecode = GUID(0x399595ec, 0x8667, 0x4e2d, [0x8f, 0xdb, 0x98, 0x81, 0x4c, 0xe7, 0x6c, 0x1e]);
enum WM_SampleExtensionGUID_ChromaLocation = GUID(0x4c5acca0, 0x9276, 0x4b2c, [0x9e, 0x4c, 0xa0, 0xed, 0xef, 0xdd, 0x21, 0x7e]);
enum WM_SampleExtensionGUID_ColorSpaceInfo = GUID(0xf79ada56, 0x30eb, 0x4f2b, [0x9f, 0x7a, 0xf2, 0x4b, 0x13, 0x9a, 0x11, 0x57]);
enum WM_SampleExtensionGUID_UserDataInfo = GUID(0x732bb4fa, 0x78be, 0x4549, [0x99, 0xbd, 0x2, 0xdb, 0x1a, 0x55, 0xb7, 0xa8]);
enum WM_SampleExtensionGUID_FileName = GUID(0xe165ec0e, 0x19ed, 0x45d7, [0xb4, 0xa7, 0x25, 0xcb, 0xd1, 0xe2, 0x8e, 0x9b]);
enum WM_SampleExtensionGUID_ContentType = GUID(0xd590dc20, 0x7bc, 0x436c, [0x9c, 0xf7, 0xf3, 0xbb, 0xfb, 0xf1, 0xa4, 0xdc]);
enum WM_SampleExtensionGUID_PixelAspectRatio = GUID(0x1b1ee554, 0xf9ea, 0x4bc8, [0x82, 0x1a, 0x37, 0x6b, 0x74, 0xe4, 0xc4, 0xb8]);
enum WM_SampleExtensionGUID_SampleDuration = GUID(0xc6bd9450, 0x867f, 0x4907, [0x83, 0xa3, 0xc7, 0x79, 0x21, 0xb7, 0x33, 0xad]);
enum WM_SampleExtensionGUID_SampleProtectionSalt = GUID(0x5403deee, 0xb9ee, 0x438f, [0xaa, 0x83, 0x38, 0x4, 0x99, 0x7e, 0x56, 0x9d]);
enum CLSID_WMMUTEX_Language = GUID(0xd6e22a00, 0x35da, 0x11d1, [0x90, 0x34, 0x0, 0xa0, 0xc9, 0x3, 0x49, 0xbe]);
enum CLSID_WMMUTEX_Bitrate = GUID(0xd6e22a01, 0x35da, 0x11d1, [0x90, 0x34, 0x0, 0xa0, 0xc9, 0x3, 0x49, 0xbe]);
enum CLSID_WMMUTEX_Presentation = GUID(0xd6e22a02, 0x35da, 0x11d1, [0x90, 0x34, 0x0, 0xa0, 0xc9, 0x3, 0x49, 0xbe]);
enum CLSID_WMMUTEX_Unknown = GUID(0xd6e22a03, 0x35da, 0x11d1, [0x90, 0x34, 0x0, 0xa0, 0xc9, 0x3, 0x49, 0xbe]);
enum CLSID_WMBandwidthSharing_Exclusive = GUID(0xaf6060aa, 0x5197, 0x11d2, [0xb6, 0xaf, 0x0, 0xc0, 0x4f, 0xd9, 0x8, 0xe9]);
enum CLSID_WMBandwidthSharing_Partial = GUID(0xaf6060ab, 0x5197, 0x11d2, [0xb6, 0xaf, 0x0, 0xc0, 0x4f, 0xd9, 0x8, 0xe9]);
enum WMT_DMOCATEGORY_AUDIO_WATERMARK = GUID(0x65221c5a, 0xfa75, 0x4b39, [0xb5, 0xc, 0x6, 0xc3, 0x36, 0xb6, 0xa3, 0xef]);
enum WMT_DMOCATEGORY_VIDEO_WATERMARK = GUID(0x187cc922, 0x8efc, 0x4404, [0x9d, 0xaf, 0x63, 0xf4, 0x83, 0xd, 0xf1, 0xbc]);
enum CLSID_ClientNetManager = GUID(0xcd12a3ce, 0x9c42, 0x11d2, [0xbe, 0xed, 0x0, 0x60, 0x8, 0x2f, 0x20, 0x54]);
alias _AM_ASFWRITERCONFIG_PARAM = int;
enum : int
{
    AM_CONFIGASFWRITER_PARAM_AUTOINDEX    = 0x00000001,
    AM_CONFIGASFWRITER_PARAM_MULTIPASS    = 0x00000002,
    AM_CONFIGASFWRITER_PARAM_DONTCOMPRESS = 0x00000003,
}

struct AM_WMT_EVENT_DATA
{
    HRESULT hrStatus;
    void* pData;
}
enum IID_INSSBuffer = GUID(0xe1cd3524, 0x3d7, 0x11d2, [0x9e, 0xed, 0x0, 0x60, 0x97, 0xd2, 0xd7, 0xcf]);
interface INSSBuffer : IUnknown
{
    HRESULT GetLength(uint*);
    HRESULT SetLength(uint);
    HRESULT GetMaxLength(uint*);
    HRESULT GetBuffer(ubyte**);
    HRESULT GetBufferAndLength(ubyte**, uint*);
}
enum IID_INSSBuffer2 = GUID(0x4f528693, 0x1035, 0x43fe, [0xb4, 0x28, 0x75, 0x75, 0x61, 0xad, 0x3a, 0x68]);
interface INSSBuffer2 : INSSBuffer
{
    HRESULT GetSampleProperties(uint, ubyte*);
    HRESULT SetSampleProperties(uint, ubyte*);
}
enum IID_INSSBuffer3 = GUID(0xc87ceaaf, 0x75be, 0x4bc4, [0x84, 0xeb, 0xac, 0x27, 0x98, 0x50, 0x76, 0x72]);
interface INSSBuffer3 : INSSBuffer2
{
    HRESULT SetProperty(GUID, void*, uint);
    HRESULT GetProperty(GUID, void*, uint*);
}
enum IID_INSSBuffer4 = GUID(0xb6b8fd5a, 0x32e2, 0x49d4, [0xa9, 0x10, 0xc2, 0x6c, 0xc8, 0x54, 0x65, 0xed]);
interface INSSBuffer4 : INSSBuffer3
{
    HRESULT GetPropertyCount(uint*);
    HRESULT GetPropertyByIndex(uint, GUID*, void*, uint*);
}
enum IID_IWMSBufferAllocator = GUID(0x61103ca4, 0x2033, 0x11d2, [0x9e, 0xf1, 0x0, 0x60, 0x97, 0xd2, 0xd7, 0xcf]);
interface IWMSBufferAllocator : IUnknown
{
    HRESULT AllocateBuffer(uint, INSSBuffer*);
    HRESULT AllocatePageSizeBuffer(uint, INSSBuffer*);
}
alias WEBSTREAM_SAMPLE_TYPE = int;
enum : int
{
    WEBSTREAM_SAMPLE_TYPE_FILE   = 0x00000001,
    WEBSTREAM_SAMPLE_TYPE_RENDER = 0x00000002,
}

alias WM_SF_TYPE = int;
enum : int
{
    WM_SF_CLEANPOINT    = 0x00000001,
    WM_SF_DISCONTINUITY = 0x00000002,
    WM_SF_DATALOSS      = 0x00000004,
}

alias WM_SFEX_TYPE = int;
enum : int
{
    WM_SFEX_NOTASYNCPOINT = 0x00000002,
    WM_SFEX_DATALOSS      = 0x00000004,
}

alias WMT_STATUS = int;
enum : int
{
    WMT_ERROR                       = 0x00000000,
    WMT_OPENED                      = 0x00000001,
    WMT_BUFFERING_START             = 0x00000002,
    WMT_BUFFERING_STOP              = 0x00000003,
    WMT_EOF                         = 0x00000004,
    WMT_END_OF_FILE                 = 0x00000004,
    WMT_END_OF_SEGMENT              = 0x00000005,
    WMT_END_OF_STREAMING            = 0x00000006,
    WMT_LOCATING                    = 0x00000007,
    WMT_CONNECTING                  = 0x00000008,
    WMT_NO_RIGHTS                   = 0x00000009,
    WMT_MISSING_CODEC               = 0x0000000a,
    WMT_STARTED                     = 0x0000000b,
    WMT_STOPPED                     = 0x0000000c,
    WMT_CLOSED                      = 0x0000000d,
    WMT_STRIDING                    = 0x0000000e,
    WMT_TIMER                       = 0x0000000f,
    WMT_INDEX_PROGRESS              = 0x00000010,
    WMT_SAVEAS_START                = 0x00000011,
    WMT_SAVEAS_STOP                 = 0x00000012,
    WMT_NEW_SOURCEFLAGS             = 0x00000013,
    WMT_NEW_METADATA                = 0x00000014,
    WMT_BACKUPRESTORE_BEGIN         = 0x00000015,
    WMT_SOURCE_SWITCH               = 0x00000016,
    WMT_ACQUIRE_LICENSE             = 0x00000017,
    WMT_INDIVIDUALIZE               = 0x00000018,
    WMT_NEEDS_INDIVIDUALIZATION     = 0x00000019,
    WMT_NO_RIGHTS_EX                = 0x0000001a,
    WMT_BACKUPRESTORE_END           = 0x0000001b,
    WMT_BACKUPRESTORE_CONNECTING    = 0x0000001c,
    WMT_BACKUPRESTORE_DISCONNECTING = 0x0000001d,
    WMT_ERROR_WITHURL               = 0x0000001e,
    WMT_RESTRICTED_LICENSE          = 0x0000001f,
    WMT_CLIENT_CONNECT              = 0x00000020,
    WMT_CLIENT_DISCONNECT           = 0x00000021,
    WMT_NATIVE_OUTPUT_PROPS_CHANGED = 0x00000022,
    WMT_RECONNECT_START             = 0x00000023,
    WMT_RECONNECT_END               = 0x00000024,
    WMT_CLIENT_CONNECT_EX           = 0x00000025,
    WMT_CLIENT_DISCONNECT_EX        = 0x00000026,
    WMT_SET_FEC_SPAN                = 0x00000027,
    WMT_PREROLL_READY               = 0x00000028,
    WMT_PREROLL_COMPLETE            = 0x00000029,
    WMT_CLIENT_PROPERTIES           = 0x0000002a,
    WMT_LICENSEURL_SIGNATURE_STATE  = 0x0000002b,
    WMT_INIT_PLAYLIST_BURN          = 0x0000002c,
    WMT_TRANSCRYPTOR_INIT           = 0x0000002d,
    WMT_TRANSCRYPTOR_SEEKED         = 0x0000002e,
    WMT_TRANSCRYPTOR_READ           = 0x0000002f,
    WMT_TRANSCRYPTOR_CLOSED         = 0x00000030,
    WMT_PROXIMITY_RESULT            = 0x00000031,
    WMT_PROXIMITY_COMPLETED         = 0x00000032,
    WMT_CONTENT_ENABLER             = 0x00000033,
}

alias WMT_STREAM_SELECTION = int;
enum : int
{
    WMT_OFF             = 0x00000000,
    WMT_CLEANPOINT_ONLY = 0x00000001,
    WMT_ON              = 0x00000002,
}

alias WMT_IMAGE_TYPE = int;
enum : int
{
    WMT_IT_NONE   = 0x00000000,
    WMT_IT_BITMAP = 0x00000001,
    WMT_IT_JPEG   = 0x00000002,
    WMT_IT_GIF    = 0x00000003,
}

alias WMT_ATTR_DATATYPE = int;
enum : int
{
    WMT_TYPE_DWORD  = 0x00000000,
    WMT_TYPE_STRING = 0x00000001,
    WMT_TYPE_BINARY = 0x00000002,
    WMT_TYPE_BOOL   = 0x00000003,
    WMT_TYPE_QWORD  = 0x00000004,
    WMT_TYPE_WORD   = 0x00000005,
    WMT_TYPE_GUID   = 0x00000006,
}

alias WMT_ATTR_IMAGETYPE = int;
enum : int
{
    WMT_IMAGETYPE_BITMAP = 0x00000001,
    WMT_IMAGETYPE_JPEG   = 0x00000002,
    WMT_IMAGETYPE_GIF    = 0x00000003,
}

alias WMT_VERSION = int;
enum : int
{
    WMT_VER_4_0 = 0x00040000,
    WMT_VER_7_0 = 0x00070000,
    WMT_VER_8_0 = 0x00080000,
    WMT_VER_9_0 = 0x00090000,
}

alias WMT_STORAGE_FORMAT = int;
enum : int
{
    WMT_Storage_Format_MP3 = 0x00000000,
    WMT_Storage_Format_V1  = 0x00000001,
}

alias WMT_DRMLA_TRUST = int;
enum : int
{
    WMT_DRMLA_UNTRUSTED = 0x00000000,
    WMT_DRMLA_TRUSTED   = 0x00000001,
    WMT_DRMLA_TAMPERED  = 0x00000002,
}

alias WMT_TRANSPORT_TYPE = int;
enum : int
{
    WMT_Transport_Type_Unreliable = 0x00000000,
    WMT_Transport_Type_Reliable   = 0x00000001,
}

alias WMT_NET_PROTOCOL = int;
enum : int
{
    WMT_PROTOCOL_HTTP = 0x00000000,
}

alias WMT_PLAY_MODE = int;
enum : int
{
    WMT_PLAY_MODE_AUTOSELECT = 0x00000000,
    WMT_PLAY_MODE_LOCAL      = 0x00000001,
    WMT_PLAY_MODE_DOWNLOAD   = 0x00000002,
    WMT_PLAY_MODE_STREAMING  = 0x00000003,
}

alias WMT_PROXY_SETTINGS = int;
enum : int
{
    WMT_PROXY_SETTING_NONE    = 0x00000000,
    WMT_PROXY_SETTING_MANUAL  = 0x00000001,
    WMT_PROXY_SETTING_AUTO    = 0x00000002,
    WMT_PROXY_SETTING_BROWSER = 0x00000003,
    WMT_PROXY_SETTING_MAX     = 0x00000004,
}

alias WMT_CODEC_INFO_TYPE = int;
enum : int
{
    WMT_CODECINFO_AUDIO   = 0x00000000,
    WMT_CODECINFO_VIDEO   = 0x00000001,
    WMT_CODECINFO_UNKNOWN = 0xffffffff,
}

alias WM_DM_INTERLACED_TYPE = int;
enum : int
{
    WM_DM_NOTINTERLACED                          = 0x00000000,
    WM_DM_DEINTERLACE_NORMAL                     = 0x00000001,
    WM_DM_DEINTERLACE_HALFSIZE                   = 0x00000002,
    WM_DM_DEINTERLACE_HALFSIZEDOUBLERATE         = 0x00000003,
    WM_DM_DEINTERLACE_INVERSETELECINE            = 0x00000004,
    WM_DM_DEINTERLACE_VERTICALHALFSIZEDOUBLERATE = 0x00000005,
}

alias WM_DM_IT_FIRST_FRAME_COHERENCY = int;
enum : int
{
    WM_DM_IT_DISABLE_COHERENT_MODE            = 0x00000000,
    WM_DM_IT_FIRST_FRAME_IN_CLIP_IS_AA_TOP    = 0x00000001,
    WM_DM_IT_FIRST_FRAME_IN_CLIP_IS_BB_TOP    = 0x00000002,
    WM_DM_IT_FIRST_FRAME_IN_CLIP_IS_BC_TOP    = 0x00000003,
    WM_DM_IT_FIRST_FRAME_IN_CLIP_IS_CD_TOP    = 0x00000004,
    WM_DM_IT_FIRST_FRAME_IN_CLIP_IS_DD_TOP    = 0x00000005,
    WM_DM_IT_FIRST_FRAME_IN_CLIP_IS_AA_BOTTOM = 0x00000006,
    WM_DM_IT_FIRST_FRAME_IN_CLIP_IS_BB_BOTTOM = 0x00000007,
    WM_DM_IT_FIRST_FRAME_IN_CLIP_IS_BC_BOTTOM = 0x00000008,
    WM_DM_IT_FIRST_FRAME_IN_CLIP_IS_CD_BOTTOM = 0x00000009,
    WM_DM_IT_FIRST_FRAME_IN_CLIP_IS_DD_BOTTOM = 0x0000000a,
}

alias WMT_OFFSET_FORMAT = int;
enum : int
{
    WMT_OFFSET_FORMAT_100NS             = 0x00000000,
    WMT_OFFSET_FORMAT_FRAME_NUMBERS     = 0x00000001,
    WMT_OFFSET_FORMAT_PLAYLIST_OFFSET   = 0x00000002,
    WMT_OFFSET_FORMAT_TIMECODE          = 0x00000003,
    WMT_OFFSET_FORMAT_100NS_APPROXIMATE = 0x00000004,
}

alias WMT_INDEXER_TYPE = int;
enum : int
{
    WMT_IT_PRESENTATION_TIME = 0x00000000,
    WMT_IT_FRAME_NUMBERS     = 0x00000001,
    WMT_IT_TIMECODE          = 0x00000002,
}

alias WMT_INDEX_TYPE = int;
enum : int
{
    WMT_IT_NEAREST_DATA_UNIT   = 0x00000001,
    WMT_IT_NEAREST_OBJECT      = 0x00000002,
    WMT_IT_NEAREST_CLEAN_POINT = 0x00000003,
}

alias WMT_FILESINK_MODE = int;
enum : int
{
    WMT_FM_SINGLE_BUFFERS      = 0x00000001,
    WMT_FM_FILESINK_DATA_UNITS = 0x00000002,
    WMT_FM_FILESINK_UNBUFFERED = 0x00000004,
}

alias WMT_MUSICSPEECH_CLASS_MODE = int;
enum : int
{
    WMT_MS_CLASS_MUSIC  = 0x00000000,
    WMT_MS_CLASS_SPEECH = 0x00000001,
    WMT_MS_CLASS_MIXED  = 0x00000002,
}

alias WMT_WATERMARK_ENTRY_TYPE = int;
enum : int
{
    WMT_WMETYPE_AUDIO = 0x00000001,
    WMT_WMETYPE_VIDEO = 0x00000002,
}

alias WM_PLAYBACK_DRC_LEVEL = int;
enum : int
{
    WM_PLAYBACK_DRC_HIGH   = 0x00000000,
    WM_PLAYBACK_DRC_MEDIUM = 0x00000001,
    WM_PLAYBACK_DRC_LOW    = 0x00000002,
}

alias WMT_TIMECODE_FRAMERATE = int;
enum : int
{
    WMT_TIMECODE_FRAMERATE_30     = 0x00000000,
    WMT_TIMECODE_FRAMERATE_30DROP = 0x00000001,
    WMT_TIMECODE_FRAMERATE_25     = 0x00000002,
    WMT_TIMECODE_FRAMERATE_24     = 0x00000003,
}

alias WMT_CREDENTIAL_FLAGS = int;
enum : int
{
    WMT_CREDENTIAL_SAVE       = 0x00000001,
    WMT_CREDENTIAL_DONT_CACHE = 0x00000002,
    WMT_CREDENTIAL_CLEAR_TEXT = 0x00000004,
    WMT_CREDENTIAL_PROXY      = 0x00000008,
    WMT_CREDENTIAL_ENCRYPT    = 0x00000010,
}

alias WM_AETYPE = int;
enum : int
{
    WM_AETYPE_INCLUDE = 0x00000069,
    WM_AETYPE_EXCLUDE = 0x00000065,
}

alias WMT_RIGHTS = int;
enum : int
{
    WMT_RIGHT_PLAYBACK                = 0x00000001,
    WMT_RIGHT_COPY_TO_NON_SDMI_DEVICE = 0x00000002,
    WMT_RIGHT_COPY_TO_CD              = 0x00000008,
    WMT_RIGHT_COPY_TO_SDMI_DEVICE     = 0x00000010,
    WMT_RIGHT_ONE_TIME                = 0x00000020,
    WMT_RIGHT_SAVE_STREAM_PROTECTED   = 0x00000040,
    WMT_RIGHT_COPY                    = 0x00000080,
    WMT_RIGHT_COLLABORATIVE_PLAY      = 0x00000100,
    WMT_RIGHT_SDMI_TRIGGER            = 0x00010000,
    WMT_RIGHT_SDMI_NOMORECOPIES       = 0x00020000,
}

struct WM_STREAM_PRIORITY_RECORD
{
    align (2):
    ushort wStreamNumber;
    BOOL fMandatory;
}
struct WM_WRITER_STATISTICS
{
    ulong qwSampleCount;
    ulong qwByteCount;
    ulong qwDroppedSampleCount;
    ulong qwDroppedByteCount;
    uint dwCurrentBitrate;
    uint dwAverageBitrate;
    uint dwExpectedBitrate;
    uint dwCurrentSampleRate;
    uint dwAverageSampleRate;
    uint dwExpectedSampleRate;
}
struct WM_WRITER_STATISTICS_EX
{
    uint dwBitratePlusOverhead;
    uint dwCurrentSampleDropRateInQueue;
    uint dwCurrentSampleDropRateInCodec;
    uint dwCurrentSampleDropRateInMultiplexer;
    uint dwTotalSampleDropsInQueue;
    uint dwTotalSampleDropsInCodec;
    uint dwTotalSampleDropsInMultiplexer;
}
struct WM_READER_STATISTICS
{
    uint cbSize;
    uint dwBandwidth;
    uint cPacketsReceived;
    uint cPacketsRecovered;
    uint cPacketsLost;
    ushort wQuality;
}
struct WM_READER_CLIENTINFO
{
    uint cbSize;
    PWSTR wszLang;
    PWSTR wszBrowserUserAgent;
    PWSTR wszBrowserWebPage;
    ulong qwReserved;
    LPARAM* pReserved;
    PWSTR wszHostExe;
    ulong qwHostVersion;
    PWSTR wszPlayerUserAgent;
}
struct WM_CLIENT_PROPERTIES
{
    uint dwIPAddress;
    uint dwPort;
}
struct WM_CLIENT_PROPERTIES_EX
{
    uint cbSize;
    const(wchar)* pwszIPAddress;
    const(wchar)* pwszPort;
    const(wchar)* pwszDNSName;
}
struct WM_PORT_NUMBER_RANGE
{
    ushort wPortBegin;
    ushort wPortEnd;
}
struct WMT_BUFFER_SEGMENT
{
    INSSBuffer pBuffer;
    uint cbOffset;
    uint cbLength;
}
struct WMT_PAYLOAD_FRAGMENT
{
    uint dwPayloadIndex;
    WMT_BUFFER_SEGMENT segmentData;
}
struct WMT_FILESINK_DATA_UNIT
{
    WMT_BUFFER_SEGMENT packetHeaderBuffer;
    uint cPayloads;
    WMT_BUFFER_SEGMENT* pPayloadHeaderBuffers;
    uint cPayloadDataFragments;
    WMT_PAYLOAD_FRAGMENT* pPayloadDataFragments;
}
struct WMT_WEBSTREAM_FORMAT
{
    ushort cbSize;
    ushort cbSampleHeaderFixedData;
    ushort wVersion;
    ushort wReserved;
}
struct WMT_WEBSTREAM_SAMPLE_HEADER
{
    ushort cbLength;
    ushort wPart;
    ushort cTotalParts;
    ushort wSampleType;
    wchar[1] wszURL;
}
struct WM_ADDRESS_ACCESSENTRY
{
    uint dwIPAddress;
    uint dwMask;
}
struct WM_PICTURE
{
    align (1):
    PWSTR pwszMIMEType;
    ubyte bPictureType;
    PWSTR pwszDescription;
    uint dwDataLen;
    ubyte* pbData;
}
struct WM_SYNCHRONISED_LYRICS
{
    align (1):
    ubyte bTimeStampFormat;
    ubyte bContentType;
    PWSTR pwszContentDescriptor;
    uint dwLyricsLen;
    ubyte* pbLyrics;
}
struct WM_USER_WEB_URL
{
    align (1):
    PWSTR pwszDescription;
    PWSTR pwszURL;
}
struct WM_USER_TEXT
{
    align (1):
    PWSTR pwszDescription;
    PWSTR pwszText;
}
struct WM_LEAKY_BUCKET_PAIR
{
    align (1):
    uint dwBitrate;
    uint msBufferWindow;
}
struct WM_STREAM_TYPE_INFO
{
    align (1):
    GUID guidMajorType;
    uint cbFormat;
}
struct WMT_WATERMARK_ENTRY
{
    WMT_WATERMARK_ENTRY_TYPE wmetType;
    GUID clsid;
    uint cbDisplayName;
    PWSTR pwszDisplayName;
}
struct WMT_VIDEOIMAGE_SAMPLE
{
    uint dwMagic;
    uint cbStruct;
    uint dwControlFlags;
    uint dwInputFlagsCur;
    int lCurMotionXtoX;
    int lCurMotionYtoX;
    int lCurMotionXoffset;
    int lCurMotionXtoY;
    int lCurMotionYtoY;
    int lCurMotionYoffset;
    int lCurBlendCoef1;
    int lCurBlendCoef2;
    uint dwInputFlagsPrev;
    int lPrevMotionXtoX;
    int lPrevMotionYtoX;
    int lPrevMotionXoffset;
    int lPrevMotionXtoY;
    int lPrevMotionYtoY;
    int lPrevMotionYoffset;
    int lPrevBlendCoef1;
    int lPrevBlendCoef2;
}
struct WMT_VIDEOIMAGE_SAMPLE2
{
    uint dwMagic;
    uint dwStructSize;
    uint dwControlFlags;
    uint dwViewportWidth;
    uint dwViewportHeight;
    uint dwCurrImageWidth;
    uint dwCurrImageHeight;
    float fCurrRegionX0;
    float fCurrRegionY0;
    float fCurrRegionWidth;
    float fCurrRegionHeight;
    float fCurrBlendCoef;
    uint dwPrevImageWidth;
    uint dwPrevImageHeight;
    float fPrevRegionX0;
    float fPrevRegionY0;
    float fPrevRegionWidth;
    float fPrevRegionHeight;
    float fPrevBlendCoef;
    uint dwEffectType;
    uint dwNumEffectParas;
    float fEffectPara0;
    float fEffectPara1;
    float fEffectPara2;
    float fEffectPara3;
    float fEffectPara4;
    BOOL bKeepPrevImage;
}
struct WM_MEDIA_TYPE
{
    GUID majortype;
    GUID subtype;
    BOOL bFixedSizeSamples;
    BOOL bTemporalCompression;
    uint lSampleSize;
    GUID formattype;
    IUnknown pUnk;
    uint cbFormat;
    ubyte* pbFormat;
}
struct WMVIDEOINFOHEADER
{
    RECT rcSource;
    RECT rcTarget;
    uint dwBitRate;
    uint dwBitErrorRate;
    long AvgTimePerFrame;
    BITMAPINFOHEADER bmiHeader;
}
struct WMVIDEOINFOHEADER2
{
    RECT rcSource;
    RECT rcTarget;
    uint dwBitRate;
    uint dwBitErrorRate;
    long AvgTimePerFrame;
    uint dwInterlaceFlags;
    uint dwCopyProtectFlags;
    uint dwPictAspectRatioX;
    uint dwPictAspectRatioY;
    uint dwReserved1;
    uint dwReserved2;
    BITMAPINFOHEADER bmiHeader;
}
struct WMMPEG2VIDEOINFO
{
    WMVIDEOINFOHEADER2 hdr;
    uint dwStartTimeCode;
    uint cbSequenceHeader;
    uint dwProfile;
    uint dwLevel;
    uint dwFlags;
    uint[1] dwSequenceHeader;
}
struct WMSCRIPTFORMAT
{
    GUID scriptType;
}
struct WMT_COLORSPACEINFO_EXTENSION_DATA
{
    ubyte ucColorPrimaries;
    ubyte ucColorTransferChar;
    ubyte ucColorMatrixCoef;
}
struct WMT_TIMECODE_EXTENSION_DATA
{
    align (2):
    ushort wRange;
    uint dwTimecode;
    uint dwUserbits;
    uint dwAmFlags;
}
struct DRM_VAL16
{
    ubyte[16] val;
}
enum IID_IWMMediaProps = GUID(0x96406bce, 0x2b2b, 0x11d3, [0xb3, 0x6b, 0x0, 0xc0, 0x4f, 0x61, 0x8, 0xff]);
interface IWMMediaProps : IUnknown
{
    HRESULT GetType(GUID*);
    HRESULT GetMediaType(WM_MEDIA_TYPE*, uint*);
    HRESULT SetMediaType(WM_MEDIA_TYPE*);
}
enum IID_IWMVideoMediaProps = GUID(0x96406bcf, 0x2b2b, 0x11d3, [0xb3, 0x6b, 0x0, 0xc0, 0x4f, 0x61, 0x8, 0xff]);
interface IWMVideoMediaProps : IWMMediaProps
{
    HRESULT GetMaxKeyFrameSpacing(long*);
    HRESULT SetMaxKeyFrameSpacing(long);
    HRESULT GetQuality(uint*);
    HRESULT SetQuality(uint);
}
enum IID_IWMWriter = GUID(0x96406bd4, 0x2b2b, 0x11d3, [0xb3, 0x6b, 0x0, 0xc0, 0x4f, 0x61, 0x8, 0xff]);
interface IWMWriter : IUnknown
{
    HRESULT SetProfileByID(const(GUID)*);
    HRESULT SetProfile(IWMProfile);
    HRESULT SetOutputFilename(const(wchar)*);
    HRESULT GetInputCount(uint*);
    HRESULT GetInputProps(uint, IWMInputMediaProps*);
    HRESULT SetInputProps(uint, IWMInputMediaProps);
    HRESULT GetInputFormatCount(uint, uint*);
    HRESULT GetInputFormat(uint, uint, IWMInputMediaProps*);
    HRESULT BeginWriting();
    HRESULT EndWriting();
    HRESULT AllocateSample(uint, INSSBuffer*);
    HRESULT WriteSample(uint, ulong, uint, INSSBuffer);
    HRESULT Flush();
}
enum IID_IWMDRMWriter = GUID(0xd6ea5dd0, 0x12a0, 0x43f4, [0x90, 0xab, 0xa3, 0xfd, 0x45, 0x1e, 0x6a, 0x7]);
interface IWMDRMWriter : IUnknown
{
    HRESULT GenerateKeySeed(PWSTR, uint*);
    HRESULT GenerateKeyID(PWSTR, uint*);
    HRESULT GenerateSigningKeyPair(PWSTR, uint*, PWSTR, uint*);
    HRESULT SetDRMAttribute(ushort, const(wchar)*, WMT_ATTR_DATATYPE, const(ubyte)*, ushort);
}
struct WMDRM_IMPORT_INIT_STRUCT
{
    uint dwVersion;
    uint cbEncryptedSessionKeyMessage;
    ubyte* pbEncryptedSessionKeyMessage;
    uint cbEncryptedKeyMessage;
    ubyte* pbEncryptedKeyMessage;
}
enum IID_IWMDRMWriter2 = GUID(0x38ee7a94, 0x40e2, 0x4e10, [0xaa, 0x3f, 0x33, 0xfd, 0x32, 0x10, 0xed, 0x5b]);
interface IWMDRMWriter2 : IWMDRMWriter
{
    HRESULT SetWMDRMNetEncryption(BOOL, ubyte*, uint);
}
enum IID_IWMDRMWriter3 = GUID(0xa7184082, 0xa4aa, 0x4dde, [0xac, 0x9c, 0xe7, 0x5d, 0xbd, 0x11, 0x17, 0xce]);
interface IWMDRMWriter3 : IWMDRMWriter2
{
    HRESULT SetProtectStreamSamples(WMDRM_IMPORT_INIT_STRUCT*);
}
enum IID_IWMInputMediaProps = GUID(0x96406bd5, 0x2b2b, 0x11d3, [0xb3, 0x6b, 0x0, 0xc0, 0x4f, 0x61, 0x8, 0xff]);
interface IWMInputMediaProps : IWMMediaProps
{
    HRESULT GetConnectionName(PWSTR, ushort*);
    HRESULT GetGroupName(PWSTR, ushort*);
}
enum IID_IWMPropertyVault = GUID(0x72995a79, 0x5090, 0x42a4, [0x9c, 0x8c, 0xd9, 0xd0, 0xb6, 0xd3, 0x4b, 0xe5]);
interface IWMPropertyVault : IUnknown
{
    HRESULT GetPropertyCount(uint*);
    HRESULT GetPropertyByName(const(wchar)*, WMT_ATTR_DATATYPE*, ubyte*, uint*);
    HRESULT SetProperty(const(wchar)*, WMT_ATTR_DATATYPE, ubyte*, uint);
    HRESULT GetPropertyByIndex(uint, PWSTR, uint*, WMT_ATTR_DATATYPE*, ubyte*, uint*);
    HRESULT CopyPropertiesFrom(IWMPropertyVault);
    HRESULT Clear();
}
enum IID_IWMIStreamProps = GUID(0x6816dad3, 0x2b4b, 0x4c8e, [0x81, 0x49, 0x87, 0x4c, 0x34, 0x83, 0xa7, 0x53]);
interface IWMIStreamProps : IUnknown
{
    HRESULT GetProperty(const(wchar)*, WMT_ATTR_DATATYPE*, ubyte*, uint*);
}
enum IID_IWMReader = GUID(0x96406bd6, 0x2b2b, 0x11d3, [0xb3, 0x6b, 0x0, 0xc0, 0x4f, 0x61, 0x8, 0xff]);
interface IWMReader : IUnknown
{
    HRESULT Open(const(wchar)*, IWMReaderCallback, void*);
    HRESULT Close();
    HRESULT GetOutputCount(uint*);
    HRESULT GetOutputProps(uint, IWMOutputMediaProps*);
    HRESULT SetOutputProps(uint, IWMOutputMediaProps);
    HRESULT GetOutputFormatCount(uint, uint*);
    HRESULT GetOutputFormat(uint, uint, IWMOutputMediaProps*);
    HRESULT Start(ulong, ulong, float, void*);
    HRESULT Stop();
    HRESULT Pause();
    HRESULT Resume();
}
enum IID_IWMSyncReader = GUID(0x9397f121, 0x7705, 0x4dc9, [0xb0, 0x49, 0x98, 0xb6, 0x98, 0x18, 0x84, 0x14]);
interface IWMSyncReader : IUnknown
{
    HRESULT Open(const(wchar)*);
    HRESULT Close();
    HRESULT SetRange(ulong, long);
    HRESULT SetRangeByFrame(ushort, ulong, long);
    HRESULT GetNextSample(ushort, INSSBuffer*, ulong*, ulong*, uint*, uint*, ushort*);
    HRESULT SetStreamsSelected(ushort, ushort*, WMT_STREAM_SELECTION*);
    HRESULT GetStreamSelected(ushort, WMT_STREAM_SELECTION*);
    HRESULT SetReadStreamSamples(ushort, BOOL);
    HRESULT GetReadStreamSamples(ushort, BOOL*);
    HRESULT GetOutputSetting(uint, const(wchar)*, WMT_ATTR_DATATYPE*, ubyte*, ushort*);
    HRESULT SetOutputSetting(uint, const(wchar)*, WMT_ATTR_DATATYPE, const(ubyte)*, ushort);
    HRESULT GetOutputCount(uint*);
    HRESULT GetOutputProps(uint, IWMOutputMediaProps*);
    HRESULT SetOutputProps(uint, IWMOutputMediaProps);
    HRESULT GetOutputFormatCount(uint, uint*);
    HRESULT GetOutputFormat(uint, uint, IWMOutputMediaProps*);
    HRESULT GetOutputNumberForStream(ushort, uint*);
    HRESULT GetStreamNumberForOutput(uint, ushort*);
    HRESULT GetMaxOutputSampleSize(uint, uint*);
    HRESULT GetMaxStreamSampleSize(ushort, uint*);
    HRESULT OpenStream(IStream);
}
enum IID_IWMSyncReader2 = GUID(0xfaed3d21, 0x1b6b, 0x4af7, [0x8c, 0xb6, 0x3e, 0x18, 0x9b, 0xbc, 0x18, 0x7b]);
interface IWMSyncReader2 : IWMSyncReader
{
    HRESULT SetRangeByTimecode(ushort, WMT_TIMECODE_EXTENSION_DATA*, WMT_TIMECODE_EXTENSION_DATA*);
    HRESULT SetRangeByFrameEx(ushort, ulong, long, ulong*);
    HRESULT SetAllocateForOutput(uint, IWMReaderAllocatorEx);
    HRESULT GetAllocateForOutput(uint, IWMReaderAllocatorEx*);
    HRESULT SetAllocateForStream(ushort, IWMReaderAllocatorEx);
    HRESULT GetAllocateForStream(ushort, IWMReaderAllocatorEx*);
}
enum IID_IWMOutputMediaProps = GUID(0x96406bd7, 0x2b2b, 0x11d3, [0xb3, 0x6b, 0x0, 0xc0, 0x4f, 0x61, 0x8, 0xff]);
interface IWMOutputMediaProps : IWMMediaProps
{
    HRESULT GetStreamGroupName(PWSTR, ushort*);
    HRESULT GetConnectionName(PWSTR, ushort*);
}
enum IID_IWMStatusCallback = GUID(0x6d7cdc70, 0x9888, 0x11d3, [0x8e, 0xdc, 0x0, 0xc0, 0x4f, 0x61, 0x9, 0xcf]);
interface IWMStatusCallback : IUnknown
{
    HRESULT OnStatus(WMT_STATUS, HRESULT, WMT_ATTR_DATATYPE, ubyte*, void*);
}
enum IID_IWMReaderCallback = GUID(0x96406bd8, 0x2b2b, 0x11d3, [0xb3, 0x6b, 0x0, 0xc0, 0x4f, 0x61, 0x8, 0xff]);
interface IWMReaderCallback : IWMStatusCallback
{
    HRESULT OnSample(uint, ulong, ulong, uint, INSSBuffer, void*);
}
enum IID_IWMCredentialCallback = GUID(0x342e0eb7, 0xe651, 0x450c, [0x97, 0x5b, 0x2a, 0xce, 0x2c, 0x90, 0xc4, 0x8e]);
interface IWMCredentialCallback : IUnknown
{
    HRESULT AcquireCredentials(PWSTR, PWSTR, PWSTR, uint, PWSTR, uint, HRESULT, uint*);
}
enum IID_IWMMetadataEditor = GUID(0x96406bd9, 0x2b2b, 0x11d3, [0xb3, 0x6b, 0x0, 0xc0, 0x4f, 0x61, 0x8, 0xff]);
interface IWMMetadataEditor : IUnknown
{
    HRESULT Open(const(wchar)*);
    HRESULT Close();
    HRESULT Flush();
}
enum IID_IWMMetadataEditor2 = GUID(0x203cffe3, 0x2e18, 0x4fdf, [0xb5, 0x9d, 0x6e, 0x71, 0x53, 0x5, 0x34, 0xcf]);
interface IWMMetadataEditor2 : IWMMetadataEditor
{
    HRESULT OpenEx(const(wchar)*, uint, uint);
}
enum IID_IWMDRMEditor = GUID(0xff130ebc, 0xa6c3, 0x42a6, [0xb4, 0x1, 0xc3, 0x38, 0x2c, 0x3e, 0x8, 0xb3]);
interface IWMDRMEditor : IUnknown
{
    HRESULT GetDRMProperty(const(wchar)*, WMT_ATTR_DATATYPE*, ubyte*, ushort*);
}
enum IID_IWMHeaderInfo = GUID(0x96406bda, 0x2b2b, 0x11d3, [0xb3, 0x6b, 0x0, 0xc0, 0x4f, 0x61, 0x8, 0xff]);
interface IWMHeaderInfo : IUnknown
{
    HRESULT GetAttributeCount(ushort, ushort*);
    HRESULT GetAttributeByIndex(ushort, ushort*, PWSTR, ushort*, WMT_ATTR_DATATYPE*, ubyte*, ushort*);
    HRESULT GetAttributeByName(ushort*, const(wchar)*, WMT_ATTR_DATATYPE*, ubyte*, ushort*);
    HRESULT SetAttribute(ushort, const(wchar)*, WMT_ATTR_DATATYPE, const(ubyte)*, ushort);
    HRESULT GetMarkerCount(ushort*);
    HRESULT GetMarker(ushort, PWSTR, ushort*, ulong*);
    HRESULT AddMarker(PWSTR, ulong);
    HRESULT RemoveMarker(ushort);
    HRESULT GetScriptCount(ushort*);
    HRESULT GetScript(ushort, PWSTR, ushort*, PWSTR, ushort*, ulong*);
    HRESULT AddScript(PWSTR, PWSTR, ulong);
    HRESULT RemoveScript(ushort);
}
enum IID_IWMHeaderInfo2 = GUID(0x15cf9781, 0x454e, 0x482e, [0xb3, 0x93, 0x85, 0xfa, 0xe4, 0x87, 0xa8, 0x10]);
interface IWMHeaderInfo2 : IWMHeaderInfo
{
    HRESULT GetCodecInfoCount(uint*);
    HRESULT GetCodecInfo(uint, ushort*, PWSTR, ushort*, PWSTR, WMT_CODEC_INFO_TYPE*, ushort*, ubyte*);
}
enum IID_IWMHeaderInfo3 = GUID(0x15cc68e3, 0x27cc, 0x4ecd, [0xb2, 0x22, 0x3f, 0x5d, 0x2, 0xd8, 0xb, 0xd5]);
interface IWMHeaderInfo3 : IWMHeaderInfo2
{
    HRESULT GetAttributeCountEx(ushort, ushort*);
    HRESULT GetAttributeIndices(ushort, const(wchar)*, ushort*, ushort*, ushort*);
    HRESULT GetAttributeByIndexEx(ushort, ushort, PWSTR, ushort*, WMT_ATTR_DATATYPE*, ushort*, ubyte*, uint*);
    HRESULT ModifyAttribute(ushort, ushort, WMT_ATTR_DATATYPE, ushort, const(ubyte)*, uint);
    HRESULT AddAttribute(ushort, const(wchar)*, ushort*, WMT_ATTR_DATATYPE, ushort, const(ubyte)*, uint);
    HRESULT DeleteAttribute(ushort, ushort);
    HRESULT AddCodecInfo(PWSTR, PWSTR, WMT_CODEC_INFO_TYPE, ushort, ubyte*);
}
enum IID_IWMProfileManager = GUID(0xd16679f2, 0x6ca0, 0x472d, [0x8d, 0x31, 0x2f, 0x5d, 0x55, 0xae, 0xe1, 0x55]);
interface IWMProfileManager : IUnknown
{
    HRESULT CreateEmptyProfile(WMT_VERSION, IWMProfile*);
    HRESULT LoadProfileByID(const(GUID)*, IWMProfile*);
    HRESULT LoadProfileByData(const(wchar)*, IWMProfile*);
    HRESULT SaveProfile(IWMProfile, PWSTR, uint*);
    HRESULT GetSystemProfileCount(uint*);
    HRESULT LoadSystemProfile(uint, IWMProfile*);
}
enum IID_IWMProfileManager2 = GUID(0x7a924e51, 0x73c1, 0x494d, [0x80, 0x19, 0x23, 0xd3, 0x7e, 0xd9, 0xb8, 0x9a]);
interface IWMProfileManager2 : IWMProfileManager
{
    HRESULT GetSystemProfileVersion(WMT_VERSION*);
    HRESULT SetSystemProfileVersion(WMT_VERSION);
}
enum IID_IWMProfileManagerLanguage = GUID(0xba4dcc78, 0x7ee0, 0x4ab8, [0xb2, 0x7a, 0xdb, 0xce, 0x8b, 0xc5, 0x14, 0x54]);
interface IWMProfileManagerLanguage : IUnknown
{
    HRESULT GetUserLanguageID(ushort*);
    HRESULT SetUserLanguageID(ushort);
}
enum IID_IWMProfile = GUID(0x96406bdb, 0x2b2b, 0x11d3, [0xb3, 0x6b, 0x0, 0xc0, 0x4f, 0x61, 0x8, 0xff]);
interface IWMProfile : IUnknown
{
    HRESULT GetVersion(WMT_VERSION*);
    HRESULT GetName(PWSTR, uint*);
    HRESULT SetName(const(wchar)*);
    HRESULT GetDescription(PWSTR, uint*);
    HRESULT SetDescription(const(wchar)*);
    HRESULT GetStreamCount(uint*);
    HRESULT GetStream(uint, IWMStreamConfig*);
    HRESULT GetStreamByNumber(ushort, IWMStreamConfig*);
    HRESULT RemoveStream(IWMStreamConfig);
    HRESULT RemoveStreamByNumber(ushort);
    HRESULT AddStream(IWMStreamConfig);
    HRESULT ReconfigStream(IWMStreamConfig);
    HRESULT CreateNewStream(const(GUID)*, IWMStreamConfig*);
    HRESULT GetMutualExclusionCount(uint*);
    HRESULT GetMutualExclusion(uint, IWMMutualExclusion*);
    HRESULT RemoveMutualExclusion(IWMMutualExclusion);
    HRESULT AddMutualExclusion(IWMMutualExclusion);
    HRESULT CreateNewMutualExclusion(IWMMutualExclusion*);
}
enum IID_IWMProfile2 = GUID(0x7e72d33, 0xd94e, 0x4be7, [0x88, 0x43, 0x60, 0xae, 0x5f, 0xf7, 0xe5, 0xf5]);
interface IWMProfile2 : IWMProfile
{
    HRESULT GetProfileID(GUID*);
}
enum IID_IWMProfile3 = GUID(0xef96cc, 0xa461, 0x4546, [0x8b, 0xcd, 0xc9, 0xa2, 0x8f, 0xe, 0x6, 0xf5]);
interface IWMProfile3 : IWMProfile2
{
    HRESULT GetStorageFormat(WMT_STORAGE_FORMAT*);
    HRESULT SetStorageFormat(WMT_STORAGE_FORMAT);
    HRESULT GetBandwidthSharingCount(uint*);
    HRESULT GetBandwidthSharing(uint, IWMBandwidthSharing*);
    HRESULT RemoveBandwidthSharing(IWMBandwidthSharing);
    HRESULT AddBandwidthSharing(IWMBandwidthSharing);
    HRESULT CreateNewBandwidthSharing(IWMBandwidthSharing*);
    HRESULT GetStreamPrioritization(IWMStreamPrioritization*);
    HRESULT SetStreamPrioritization(IWMStreamPrioritization);
    HRESULT RemoveStreamPrioritization();
    HRESULT CreateNewStreamPrioritization(IWMStreamPrioritization*);
    HRESULT GetExpectedPacketCount(ulong, ulong*);
}
enum IID_IWMStreamConfig = GUID(0x96406bdc, 0x2b2b, 0x11d3, [0xb3, 0x6b, 0x0, 0xc0, 0x4f, 0x61, 0x8, 0xff]);
interface IWMStreamConfig : IUnknown
{
    HRESULT GetStreamType(GUID*);
    HRESULT GetStreamNumber(ushort*);
    HRESULT SetStreamNumber(ushort);
    HRESULT GetStreamName(PWSTR, ushort*);
    HRESULT SetStreamName(PWSTR);
    HRESULT GetConnectionName(PWSTR, ushort*);
    HRESULT SetConnectionName(PWSTR);
    HRESULT GetBitrate(uint*);
    HRESULT SetBitrate(uint);
    HRESULT GetBufferWindow(uint*);
    HRESULT SetBufferWindow(uint);
}
enum IID_IWMStreamConfig2 = GUID(0x7688d8cb, 0xfc0d, 0x43bd, [0x94, 0x59, 0x5a, 0x8d, 0xec, 0x20, 0xc, 0xfa]);
interface IWMStreamConfig2 : IWMStreamConfig
{
    HRESULT GetTransportType(WMT_TRANSPORT_TYPE*);
    HRESULT SetTransportType(WMT_TRANSPORT_TYPE);
    HRESULT AddDataUnitExtension(GUID, ushort, ubyte*, uint);
    HRESULT GetDataUnitExtensionCount(ushort*);
    HRESULT GetDataUnitExtension(ushort, GUID*, ushort*, ubyte*, uint*);
    HRESULT RemoveAllDataUnitExtensions();
}
enum IID_IWMStreamConfig3 = GUID(0xcb164104, 0x3aa9, 0x45a7, [0x9a, 0xc9, 0x4d, 0xae, 0xe1, 0x31, 0xd6, 0xe1]);
interface IWMStreamConfig3 : IWMStreamConfig2
{
    HRESULT GetLanguage(PWSTR, ushort*);
    HRESULT SetLanguage(PWSTR);
}
enum IID_IWMPacketSize = GUID(0xcdfb97ab, 0x188f, 0x40b3, [0xb6, 0x43, 0x5b, 0x79, 0x3, 0x97, 0x5c, 0x59]);
interface IWMPacketSize : IUnknown
{
    HRESULT GetMaxPacketSize(uint*);
    HRESULT SetMaxPacketSize(uint);
}
enum IID_IWMPacketSize2 = GUID(0x8bfc2b9e, 0xb646, 0x4233, [0xa8, 0x77, 0x1c, 0x6a, 0x7, 0x96, 0x69, 0xdc]);
interface IWMPacketSize2 : IWMPacketSize
{
    HRESULT GetMinPacketSize(uint*);
    HRESULT SetMinPacketSize(uint);
}
enum IID_IWMStreamList = GUID(0x96406bdd, 0x2b2b, 0x11d3, [0xb3, 0x6b, 0x0, 0xc0, 0x4f, 0x61, 0x8, 0xff]);
interface IWMStreamList : IUnknown
{
    HRESULT GetStreams(ushort*, ushort*);
    HRESULT AddStream(ushort);
    HRESULT RemoveStream(ushort);
}
enum IID_IWMMutualExclusion = GUID(0x96406bde, 0x2b2b, 0x11d3, [0xb3, 0x6b, 0x0, 0xc0, 0x4f, 0x61, 0x8, 0xff]);
interface IWMMutualExclusion : IWMStreamList
{
    HRESULT GetType(GUID*);
    HRESULT SetType(const(GUID)*);
}
enum IID_IWMMutualExclusion2 = GUID(0x302b57d, 0x89d1, 0x4ba2, [0x85, 0xc9, 0x16, 0x6f, 0x2c, 0x53, 0xeb, 0x91]);
interface IWMMutualExclusion2 : IWMMutualExclusion
{
    HRESULT GetName(PWSTR, ushort*);
    HRESULT SetName(PWSTR);
    HRESULT GetRecordCount(ushort*);
    HRESULT AddRecord();
    HRESULT RemoveRecord(ushort);
    HRESULT GetRecordName(ushort, PWSTR, ushort*);
    HRESULT SetRecordName(ushort, PWSTR);
    HRESULT GetStreamsForRecord(ushort, ushort*, ushort*);
    HRESULT AddStreamForRecord(ushort, ushort);
    HRESULT RemoveStreamForRecord(ushort, ushort);
}
enum IID_IWMBandwidthSharing = GUID(0xad694af1, 0xf8d9, 0x42f8, [0xbc, 0x47, 0x70, 0x31, 0x1b, 0xc, 0x4f, 0x9e]);
interface IWMBandwidthSharing : IWMStreamList
{
    HRESULT GetType(GUID*);
    HRESULT SetType(const(GUID)*);
    HRESULT GetBandwidth(uint*, uint*);
    HRESULT SetBandwidth(uint, uint);
}
enum IID_IWMStreamPrioritization = GUID(0x8c1c6090, 0xf9a8, 0x4748, [0x8e, 0xc3, 0xdd, 0x11, 0x8, 0xba, 0x1e, 0x77]);
interface IWMStreamPrioritization : IUnknown
{
    HRESULT GetPriorityRecords(WM_STREAM_PRIORITY_RECORD*, ushort*);
    HRESULT SetPriorityRecords(WM_STREAM_PRIORITY_RECORD*, ushort);
}
enum IID_IWMWriterAdvanced = GUID(0x96406be3, 0x2b2b, 0x11d3, [0xb3, 0x6b, 0x0, 0xc0, 0x4f, 0x61, 0x8, 0xff]);
interface IWMWriterAdvanced : IUnknown
{
    HRESULT GetSinkCount(uint*);
    HRESULT GetSink(uint, IWMWriterSink*);
    HRESULT AddSink(IWMWriterSink);
    HRESULT RemoveSink(IWMWriterSink);
    HRESULT WriteStreamSample(ushort, ulong, uint, ulong, uint, INSSBuffer);
    HRESULT SetLiveSource(BOOL);
    HRESULT IsRealTime(BOOL*);
    HRESULT GetWriterTime(ulong*);
    HRESULT GetStatistics(ushort, WM_WRITER_STATISTICS*);
    HRESULT SetSyncTolerance(uint);
    HRESULT GetSyncTolerance(uint*);
}
enum IID_IWMWriterAdvanced2 = GUID(0x962dc1ec, 0xc046, 0x4db8, [0x9c, 0xc7, 0x26, 0xce, 0xae, 0x50, 0x8, 0x17]);
interface IWMWriterAdvanced2 : IWMWriterAdvanced
{
    HRESULT GetInputSetting(uint, const(wchar)*, WMT_ATTR_DATATYPE*, ubyte*, ushort*);
    HRESULT SetInputSetting(uint, const(wchar)*, WMT_ATTR_DATATYPE, const(ubyte)*, ushort);
}
enum IID_IWMWriterAdvanced3 = GUID(0x2cd6492d, 0x7c37, 0x4e76, [0x9d, 0x3b, 0x59, 0x26, 0x11, 0x83, 0xa2, 0x2e]);
interface IWMWriterAdvanced3 : IWMWriterAdvanced2
{
    HRESULT GetStatisticsEx(ushort, WM_WRITER_STATISTICS_EX*);
    HRESULT SetNonBlocking();
}
enum IID_IWMWriterPreprocess = GUID(0xfc54a285, 0x38c4, 0x45b5, [0xaa, 0x23, 0x85, 0xb9, 0xf7, 0xcb, 0x42, 0x4b]);
interface IWMWriterPreprocess : IUnknown
{
    HRESULT GetMaxPreprocessingPasses(uint, uint, uint*);
    HRESULT SetNumPreprocessingPasses(uint, uint, uint);
    HRESULT BeginPreprocessingPass(uint, uint);
    HRESULT PreprocessSample(uint, ulong, uint, INSSBuffer);
    HRESULT EndPreprocessingPass(uint, uint);
}
enum IID_IWMWriterPostViewCallback = GUID(0xd9d6549d, 0xa193, 0x4f24, [0xb3, 0x8, 0x3, 0x12, 0x3d, 0x9b, 0x7f, 0x8d]);
interface IWMWriterPostViewCallback : IWMStatusCallback
{
    HRESULT OnPostViewSample(ushort, ulong, ulong, uint, INSSBuffer, void*);
    HRESULT AllocateForPostView(ushort, uint, INSSBuffer*, void*);
}
enum IID_IWMWriterPostView = GUID(0x81e20ce4, 0x75ef, 0x491a, [0x80, 0x4, 0xfc, 0x53, 0xc4, 0x5b, 0xdc, 0x3e]);
interface IWMWriterPostView : IUnknown
{
    HRESULT SetPostViewCallback(IWMWriterPostViewCallback, void*);
    HRESULT SetReceivePostViewSamples(ushort, BOOL);
    HRESULT GetReceivePostViewSamples(ushort, BOOL*);
    HRESULT GetPostViewProps(ushort, IWMMediaProps*);
    HRESULT SetPostViewProps(ushort, IWMMediaProps);
    HRESULT GetPostViewFormatCount(ushort, uint*);
    HRESULT GetPostViewFormat(ushort, uint, IWMMediaProps*);
    HRESULT SetAllocateForPostView(ushort, BOOL);
    HRESULT GetAllocateForPostView(ushort, BOOL*);
}
enum IID_IWMWriterSink = GUID(0x96406be4, 0x2b2b, 0x11d3, [0xb3, 0x6b, 0x0, 0xc0, 0x4f, 0x61, 0x8, 0xff]);
interface IWMWriterSink : IUnknown
{
    HRESULT OnHeader(INSSBuffer);
    HRESULT IsRealTime(BOOL*);
    HRESULT AllocateDataUnit(uint, INSSBuffer*);
    HRESULT OnDataUnit(INSSBuffer);
    HRESULT OnEndWriting();
}
enum IID_IWMRegisterCallback = GUID(0xcf4b1f99, 0x4de2, 0x4e49, [0xa3, 0x63, 0x25, 0x27, 0x40, 0xd9, 0x9b, 0xc1]);
interface IWMRegisterCallback : IUnknown
{
    HRESULT Advise(IWMStatusCallback, void*);
    HRESULT Unadvise(IWMStatusCallback, void*);
}
enum IID_IWMWriterFileSink = GUID(0x96406be5, 0x2b2b, 0x11d3, [0xb3, 0x6b, 0x0, 0xc0, 0x4f, 0x61, 0x8, 0xff]);
interface IWMWriterFileSink : IWMWriterSink
{
    HRESULT Open(const(wchar)*);
}
enum IID_IWMWriterFileSink2 = GUID(0x14282ba7, 0x4aef, 0x4205, [0x8c, 0xe5, 0xc2, 0x29, 0x3, 0x5a, 0x5, 0xbc]);
interface IWMWriterFileSink2 : IWMWriterFileSink
{
    HRESULT Start(ulong);
    HRESULT Stop(ulong);
    HRESULT IsStopped(BOOL*);
    HRESULT GetFileDuration(ulong*);
    HRESULT GetFileSize(ulong*);
    HRESULT Close();
    HRESULT IsClosed(BOOL*);
}
enum IID_IWMWriterFileSink3 = GUID(0x3fea4feb, 0x2945, 0x47a7, [0xa1, 0xdd, 0xc5, 0x3a, 0x8f, 0xc4, 0xc4, 0x5c]);
interface IWMWriterFileSink3 : IWMWriterFileSink2
{
    HRESULT SetAutoIndexing(BOOL);
    HRESULT GetAutoIndexing(BOOL*);
    HRESULT SetControlStream(ushort, BOOL);
    HRESULT GetMode(uint*);
    HRESULT OnDataUnitEx(WMT_FILESINK_DATA_UNIT*);
    HRESULT SetUnbufferedIO(BOOL, BOOL);
    HRESULT GetUnbufferedIO(BOOL*);
    HRESULT CompleteOperations();
}
enum IID_IWMWriterNetworkSink = GUID(0x96406be7, 0x2b2b, 0x11d3, [0xb3, 0x6b, 0x0, 0xc0, 0x4f, 0x61, 0x8, 0xff]);
interface IWMWriterNetworkSink : IWMWriterSink
{
    HRESULT SetMaximumClients(uint);
    HRESULT GetMaximumClients(uint*);
    HRESULT SetNetworkProtocol(WMT_NET_PROTOCOL);
    HRESULT GetNetworkProtocol(WMT_NET_PROTOCOL*);
    HRESULT GetHostURL(PWSTR, uint*);
    HRESULT Open(uint*);
    HRESULT Disconnect();
    HRESULT Close();
}
enum IID_IWMClientConnections = GUID(0x73c66010, 0xa299, 0x41df, [0xb1, 0xf0, 0xcc, 0xf0, 0x3b, 0x9, 0xc1, 0xc6]);
interface IWMClientConnections : IUnknown
{
    HRESULT GetClientCount(uint*);
    HRESULT GetClientProperties(uint, WM_CLIENT_PROPERTIES*);
}
enum IID_IWMClientConnections2 = GUID(0x4091571e, 0x4701, 0x4593, [0xbb, 0x3d, 0xd5, 0xf5, 0xf0, 0xc7, 0x42, 0x46]);
interface IWMClientConnections2 : IWMClientConnections
{
    HRESULT GetClientInfo(uint, PWSTR, uint*, PWSTR, uint*, PWSTR, uint*);
}
enum IID_IWMReaderAdvanced = GUID(0x96406bea, 0x2b2b, 0x11d3, [0xb3, 0x6b, 0x0, 0xc0, 0x4f, 0x61, 0x8, 0xff]);
interface IWMReaderAdvanced : IUnknown
{
    HRESULT SetUserProvidedClock(BOOL);
    HRESULT GetUserProvidedClock(BOOL*);
    HRESULT DeliverTime(ulong);
    HRESULT SetManualStreamSelection(BOOL);
    HRESULT GetManualStreamSelection(BOOL*);
    HRESULT SetStreamsSelected(ushort, ushort*, WMT_STREAM_SELECTION*);
    HRESULT GetStreamSelected(ushort, WMT_STREAM_SELECTION*);
    HRESULT SetReceiveSelectionCallbacks(BOOL);
    HRESULT GetReceiveSelectionCallbacks(BOOL*);
    HRESULT SetReceiveStreamSamples(ushort, BOOL);
    HRESULT GetReceiveStreamSamples(ushort, BOOL*);
    HRESULT SetAllocateForOutput(uint, BOOL);
    HRESULT GetAllocateForOutput(uint, BOOL*);
    HRESULT SetAllocateForStream(ushort, BOOL);
    HRESULT GetAllocateForStream(ushort, BOOL*);
    HRESULT GetStatistics(WM_READER_STATISTICS*);
    HRESULT SetClientInfo(WM_READER_CLIENTINFO*);
    HRESULT GetMaxOutputSampleSize(uint, uint*);
    HRESULT GetMaxStreamSampleSize(ushort, uint*);
    HRESULT NotifyLateDelivery(ulong);
}
enum IID_IWMReaderAdvanced2 = GUID(0xae14a945, 0xb90c, 0x4d0d, [0x91, 0x27, 0x80, 0xd6, 0x65, 0xf7, 0xd7, 0x3e]);
interface IWMReaderAdvanced2 : IWMReaderAdvanced
{
    HRESULT SetPlayMode(WMT_PLAY_MODE);
    HRESULT GetPlayMode(WMT_PLAY_MODE*);
    HRESULT GetBufferProgress(uint*, ulong*);
    HRESULT GetDownloadProgress(uint*, ulong*, ulong*);
    HRESULT GetSaveAsProgress(uint*);
    HRESULT SaveFileAs(const(wchar)*);
    HRESULT GetProtocolName(PWSTR, uint*);
    HRESULT StartAtMarker(ushort, ulong, float, void*);
    HRESULT GetOutputSetting(uint, const(wchar)*, WMT_ATTR_DATATYPE*, ubyte*, ushort*);
    HRESULT SetOutputSetting(uint, const(wchar)*, WMT_ATTR_DATATYPE, const(ubyte)*, ushort);
    HRESULT Preroll(ulong, ulong, float);
    HRESULT SetLogClientID(BOOL);
    HRESULT GetLogClientID(BOOL*);
    HRESULT StopBuffering();
    HRESULT OpenStream(IStream, IWMReaderCallback, void*);
}
enum IID_IWMReaderAdvanced3 = GUID(0x5dc0674b, 0xf04b, 0x4a4e, [0x9f, 0x2a, 0xb1, 0xaf, 0xde, 0x2c, 0x81, 0x0]);
interface IWMReaderAdvanced3 : IWMReaderAdvanced2
{
    HRESULT StopNetStreaming();
    HRESULT StartAtPosition(ushort, void*, void*, WMT_OFFSET_FORMAT, float, void*);
}
enum IID_IWMReaderAdvanced4 = GUID(0x945a76a2, 0x12ae, 0x4d48, [0xbd, 0x3c, 0xcd, 0x1d, 0x90, 0x39, 0x9b, 0x85]);
interface IWMReaderAdvanced4 : IWMReaderAdvanced3
{
    HRESULT GetLanguageCount(uint, ushort*);
    HRESULT GetLanguage(uint, ushort, PWSTR, ushort*);
    HRESULT GetMaxSpeedFactor(double*);
    HRESULT IsUsingFastCache(BOOL*);
    HRESULT AddLogParam(const(wchar)*, const(wchar)*, const(wchar)*);
    HRESULT SendLogParams();
    HRESULT CanSaveFileAs(BOOL*);
    HRESULT CancelSaveFileAs();
    HRESULT GetURL(PWSTR, uint*);
}
enum IID_IWMReaderAdvanced5 = GUID(0x24c44db0, 0x55d1, 0x49ae, [0xa5, 0xcc, 0xf1, 0x38, 0x15, 0xe3, 0x63, 0x63]);
interface IWMReaderAdvanced5 : IWMReaderAdvanced4
{
    HRESULT SetPlayerHook(uint, IWMPlayerHook);
}
enum IID_IWMReaderAdvanced6 = GUID(0x18a2e7f8, 0x428f, 0x4acd, [0x8a, 0x0, 0xe6, 0x46, 0x39, 0xbc, 0x93, 0xde]);
interface IWMReaderAdvanced6 : IWMReaderAdvanced5
{
    HRESULT SetProtectStreamSamples(ubyte*, uint, uint, uint, ubyte*, uint*);
}
enum IID_IWMPlayerHook = GUID(0xe5b7ca9a, 0xf1c, 0x4f66, [0x90, 0x2, 0x74, 0xec, 0x50, 0xd8, 0xb3, 0x4]);
interface IWMPlayerHook : IUnknown
{
    HRESULT PreDecode();
}
enum IID_IWMReaderAllocatorEx = GUID(0x9f762fa7, 0xa22e, 0x428d, [0x93, 0xc9, 0xac, 0x82, 0xf3, 0xaa, 0xfe, 0x5a]);
interface IWMReaderAllocatorEx : IUnknown
{
    HRESULT AllocateForStreamEx(ushort, uint, INSSBuffer*, uint, ulong, ulong, void*);
    HRESULT AllocateForOutputEx(uint, uint, INSSBuffer*, uint, ulong, ulong, void*);
}
enum IID_IWMReaderTypeNegotiation = GUID(0xfdbe5592, 0x81a1, 0x41ea, [0x93, 0xbd, 0x73, 0x5c, 0xad, 0x1a, 0xdc, 0x5]);
interface IWMReaderTypeNegotiation : IUnknown
{
    HRESULT TryOutputProps(uint, IWMOutputMediaProps);
}
enum IID_IWMReaderCallbackAdvanced = GUID(0x96406beb, 0x2b2b, 0x11d3, [0xb3, 0x6b, 0x0, 0xc0, 0x4f, 0x61, 0x8, 0xff]);
interface IWMReaderCallbackAdvanced : IUnknown
{
    HRESULT OnStreamSample(ushort, ulong, ulong, uint, INSSBuffer, void*);
    HRESULT OnTime(ulong, void*);
    HRESULT OnStreamSelection(ushort, ushort*, WMT_STREAM_SELECTION*, void*);
    HRESULT OnOutputPropsChanged(uint, WM_MEDIA_TYPE*, void*);
    HRESULT AllocateForStream(ushort, uint, INSSBuffer*, void*);
    HRESULT AllocateForOutput(uint, uint, INSSBuffer*, void*);
}
enum IID_IWMDRMReader = GUID(0xd2827540, 0x3ee7, 0x432c, [0xb1, 0x4c, 0xdc, 0x17, 0xf0, 0x85, 0xd3, 0xb3]);
interface IWMDRMReader : IUnknown
{
    HRESULT AcquireLicense(uint);
    HRESULT CancelLicenseAcquisition();
    HRESULT Individualize(uint);
    HRESULT CancelIndividualization();
    HRESULT MonitorLicenseAcquisition();
    HRESULT CancelMonitorLicenseAcquisition();
    HRESULT SetDRMProperty(const(wchar)*, WMT_ATTR_DATATYPE, const(ubyte)*, ushort);
    HRESULT GetDRMProperty(const(wchar)*, WMT_ATTR_DATATYPE*, ubyte*, ushort*);
}
struct DRM_MINIMUM_OUTPUT_PROTECTION_LEVELS
{
    ushort wCompressedDigitalVideo;
    ushort wUncompressedDigitalVideo;
    ushort wAnalogVideo;
    ushort wCompressedDigitalAudio;
    ushort wUncompressedDigitalAudio;
}
struct DRM_OPL_OUTPUT_IDS
{
    ushort cIds;
    GUID* rgIds;
}
struct DRM_OUTPUT_PROTECTION
{
    GUID guidId;
    ubyte bConfigData;
}
struct DRM_VIDEO_OUTPUT_PROTECTION_IDS
{
    ushort cEntries;
    DRM_OUTPUT_PROTECTION* rgVop;
}
struct DRM_PLAY_OPL
{
    DRM_MINIMUM_OUTPUT_PROTECTION_LEVELS minOPL;
    DRM_OPL_OUTPUT_IDS oplIdReserved;
    DRM_VIDEO_OUTPUT_PROTECTION_IDS vopi;
}
struct DRM_COPY_OPL
{
    ushort wMinimumCopyLevel;
    DRM_OPL_OUTPUT_IDS oplIdIncludes;
    DRM_OPL_OUTPUT_IDS oplIdExcludes;
}
enum IID_IWMDRMReader2 = GUID(0xbefe7a75, 0x9f1d, 0x4075, [0xb9, 0xd9, 0xa3, 0xc3, 0x7b, 0xda, 0x49, 0xa0]);
interface IWMDRMReader2 : IWMDRMReader
{
    HRESULT SetEvaluateOutputLevelLicenses(BOOL);
    HRESULT GetPlayOutputLevels(DRM_PLAY_OPL*, uint*, uint*);
    HRESULT GetCopyOutputLevels(DRM_COPY_OPL*, uint*, uint*);
    HRESULT TryNextLicense();
}
enum IID_IWMDRMReader3 = GUID(0xe08672de, 0xf1e7, 0x4ff4, [0xa0, 0xa3, 0xfc, 0x4b, 0x8, 0xe4, 0xca, 0xf8]);
interface IWMDRMReader3 : IWMDRMReader2
{
    HRESULT GetInclusionList(GUID**, uint*);
}
enum IID_IWMReaderPlaylistBurn = GUID(0xf28c0300, 0x9baa, 0x4477, [0xa8, 0x46, 0x17, 0x44, 0xd9, 0xcb, 0xf5, 0x33]);
interface IWMReaderPlaylistBurn : IUnknown
{
    HRESULT InitPlaylistBurn(uint, PWSTR*, IWMStatusCallback, void*);
    HRESULT GetInitResults(uint, HRESULT*);
    HRESULT Cancel();
    HRESULT EndPlaylistBurn(HRESULT);
}
enum IID_IWMReaderNetworkConfig = GUID(0x96406bec, 0x2b2b, 0x11d3, [0xb3, 0x6b, 0x0, 0xc0, 0x4f, 0x61, 0x8, 0xff]);
interface IWMReaderNetworkConfig : IUnknown
{
    HRESULT GetBufferingTime(ulong*);
    HRESULT SetBufferingTime(ulong);
    HRESULT GetUDPPortRanges(WM_PORT_NUMBER_RANGE*, uint*);
    HRESULT SetUDPPortRanges(WM_PORT_NUMBER_RANGE*, uint);
    HRESULT GetProxySettings(const(wchar)*, WMT_PROXY_SETTINGS*);
    HRESULT SetProxySettings(const(wchar)*, WMT_PROXY_SETTINGS);
    HRESULT GetProxyHostName(const(wchar)*, PWSTR, uint*);
    HRESULT SetProxyHostName(const(wchar)*, const(wchar)*);
    HRESULT GetProxyPort(const(wchar)*, uint*);
    HRESULT SetProxyPort(const(wchar)*, uint);
    HRESULT GetProxyExceptionList(const(wchar)*, PWSTR, uint*);
    HRESULT SetProxyExceptionList(const(wchar)*, const(wchar)*);
    HRESULT GetProxyBypassForLocal(const(wchar)*, BOOL*);
    HRESULT SetProxyBypassForLocal(const(wchar)*, BOOL);
    HRESULT GetForceRerunAutoProxyDetection(BOOL*);
    HRESULT SetForceRerunAutoProxyDetection(BOOL);
    HRESULT GetEnableMulticast(BOOL*);
    HRESULT SetEnableMulticast(BOOL);
    HRESULT GetEnableHTTP(BOOL*);
    HRESULT SetEnableHTTP(BOOL);
    HRESULT GetEnableUDP(BOOL*);
    HRESULT SetEnableUDP(BOOL);
    HRESULT GetEnableTCP(BOOL*);
    HRESULT SetEnableTCP(BOOL);
    HRESULT ResetProtocolRollover();
    HRESULT GetConnectionBandwidth(uint*);
    HRESULT SetConnectionBandwidth(uint);
    HRESULT GetNumProtocolsSupported(uint*);
    HRESULT GetSupportedProtocolName(uint, PWSTR, uint*);
    HRESULT AddLoggingUrl(const(wchar)*);
    HRESULT GetLoggingUrl(uint, PWSTR, uint*);
    HRESULT GetLoggingUrlCount(uint*);
    HRESULT ResetLoggingUrlList();
}
enum IID_IWMReaderNetworkConfig2 = GUID(0xd979a853, 0x42b, 0x4050, [0x83, 0x87, 0xc9, 0x39, 0xdb, 0x22, 0x1, 0x3f]);
interface IWMReaderNetworkConfig2 : IWMReaderNetworkConfig
{
    HRESULT GetEnableContentCaching(BOOL*);
    HRESULT SetEnableContentCaching(BOOL);
    HRESULT GetEnableFastCache(BOOL*);
    HRESULT SetEnableFastCache(BOOL);
    HRESULT GetAcceleratedStreamingDuration(ulong*);
    HRESULT SetAcceleratedStreamingDuration(ulong);
    HRESULT GetAutoReconnectLimit(uint*);
    HRESULT SetAutoReconnectLimit(uint);
    HRESULT GetEnableResends(BOOL*);
    HRESULT SetEnableResends(BOOL);
    HRESULT GetEnableThinning(BOOL*);
    HRESULT SetEnableThinning(BOOL);
    HRESULT GetMaxNetPacketSize(uint*);
}
enum IID_IWMReaderStreamClock = GUID(0x96406bed, 0x2b2b, 0x11d3, [0xb3, 0x6b, 0x0, 0xc0, 0x4f, 0x61, 0x8, 0xff]);
interface IWMReaderStreamClock : IUnknown
{
    HRESULT GetTime(ulong*);
    HRESULT SetTimer(ulong, void*, uint*);
    HRESULT KillTimer(uint);
}
enum IID_IWMIndexer = GUID(0x6d7cdc71, 0x9888, 0x11d3, [0x8e, 0xdc, 0x0, 0xc0, 0x4f, 0x61, 0x9, 0xcf]);
interface IWMIndexer : IUnknown
{
    HRESULT StartIndexing(const(wchar)*, IWMStatusCallback, void*);
    HRESULT Cancel();
}
enum IID_IWMIndexer2 = GUID(0xb70f1e42, 0x6255, 0x4df0, [0xa6, 0xb9, 0x2, 0xb2, 0x12, 0xd9, 0xe2, 0xbb]);
interface IWMIndexer2 : IWMIndexer
{
    HRESULT Configure(ushort, WMT_INDEXER_TYPE, void*, void*);
}
enum IID_IWMLicenseBackup = GUID(0x5e5ac9f, 0x3fb6, 0x4508, [0xbb, 0x43, 0xa4, 0x6, 0x7b, 0xa1, 0xeb, 0xe8]);
interface IWMLicenseBackup : IUnknown
{
    HRESULT BackupLicenses(uint, IWMStatusCallback);
    HRESULT CancelLicenseBackup();
}
enum IID_IWMLicenseRestore = GUID(0xc70b6334, 0xa22e, 0x4efb, [0xa2, 0x45, 0x15, 0xe6, 0x5a, 0x0, 0x4a, 0x13]);
interface IWMLicenseRestore : IUnknown
{
    HRESULT RestoreLicenses(uint, IWMStatusCallback);
    HRESULT CancelLicenseRestore();
}
enum IID_IWMBackupRestoreProps = GUID(0x3c8e0da6, 0x996f, 0x4ff3, [0xa1, 0xaf, 0x48, 0x38, 0xf9, 0x37, 0x7e, 0x2e]);
interface IWMBackupRestoreProps : IUnknown
{
    HRESULT GetPropCount(ushort*);
    HRESULT GetPropByIndex(ushort, PWSTR, ushort*, WMT_ATTR_DATATYPE*, ubyte*, ushort*);
    HRESULT GetPropByName(const(wchar)*, WMT_ATTR_DATATYPE*, ubyte*, ushort*);
    HRESULT SetProp(const(wchar)*, WMT_ATTR_DATATYPE, const(ubyte)*, ushort);
    HRESULT RemoveProp(const(wchar)*);
    HRESULT RemoveAllProps();
}
enum IID_IWMCodecInfo = GUID(0xa970f41e, 0x34de, 0x4a98, [0xb3, 0xba, 0xe4, 0xb3, 0xca, 0x75, 0x28, 0xf0]);
interface IWMCodecInfo : IUnknown
{
    HRESULT GetCodecInfoCount(const(GUID)*, uint*);
    HRESULT GetCodecFormatCount(const(GUID)*, uint, uint*);
    HRESULT GetCodecFormat(const(GUID)*, uint, uint, IWMStreamConfig*);
}
enum IID_IWMCodecInfo2 = GUID(0xaa65e273, 0xb686, 0x4056, [0x91, 0xec, 0xdd, 0x76, 0x8d, 0x4d, 0xf7, 0x10]);
interface IWMCodecInfo2 : IWMCodecInfo
{
    HRESULT GetCodecName(const(GUID)*, uint, PWSTR, uint*);
    HRESULT GetCodecFormatDesc(const(GUID)*, uint, uint, IWMStreamConfig*, PWSTR, uint*);
}
enum IID_IWMCodecInfo3 = GUID(0x7e51f487, 0x4d93, 0x4f98, [0x8a, 0xb4, 0x27, 0xd0, 0x56, 0x5a, 0xdc, 0x51]);
interface IWMCodecInfo3 : IWMCodecInfo2
{
    HRESULT GetCodecFormatProp(const(GUID)*, uint, uint, const(wchar)*, WMT_ATTR_DATATYPE*, ubyte*, uint*);
    HRESULT GetCodecProp(const(GUID)*, uint, const(wchar)*, WMT_ATTR_DATATYPE*, ubyte*, uint*);
    HRESULT SetCodecEnumerationSetting(const(GUID)*, uint, const(wchar)*, WMT_ATTR_DATATYPE, const(ubyte)*, uint);
    HRESULT GetCodecEnumerationSetting(const(GUID)*, uint, const(wchar)*, WMT_ATTR_DATATYPE*, ubyte*, uint*);
}
enum IID_IWMLanguageList = GUID(0xdf683f00, 0x2d49, 0x4d8e, [0x92, 0xb7, 0xfb, 0x19, 0xf6, 0xa0, 0xdc, 0x57]);
interface IWMLanguageList : IUnknown
{
    HRESULT GetLanguageCount(ushort*);
    HRESULT GetLanguageDetails(ushort, PWSTR, ushort*);
    HRESULT AddLanguageByRFC1766String(PWSTR, ushort*);
}
enum IID_IWMWriterPushSink = GUID(0xdc10e6a5, 0x72c, 0x467d, [0xbf, 0x57, 0x63, 0x30, 0xa9, 0xdd, 0xe1, 0x2a]);
interface IWMWriterPushSink : IWMWriterSink
{
    HRESULT Connect(const(wchar)*, const(wchar)*, BOOL);
    HRESULT Disconnect();
    HRESULT EndSession();
}
enum IID_IWMDeviceRegistration = GUID(0xf6211f03, 0x8d21, 0x4e94, [0x93, 0xe6, 0x85, 0x10, 0x80, 0x5f, 0x2d, 0x99]);
interface IWMDeviceRegistration : IUnknown
{
    HRESULT RegisterDevice(uint, ubyte*, uint, DRM_VAL16, IWMRegisteredDevice*);
    HRESULT UnregisterDevice(uint, ubyte*, uint, DRM_VAL16);
    HRESULT GetRegistrationStats(uint, uint*);
    HRESULT GetFirstRegisteredDevice(uint, IWMRegisteredDevice*);
    HRESULT GetNextRegisteredDevice(IWMRegisteredDevice*);
    HRESULT GetRegisteredDeviceByID(uint, ubyte*, uint, DRM_VAL16, IWMRegisteredDevice*);
}
enum IID_IWMRegisteredDevice = GUID(0xa4503bec, 0x5508, 0x4148, [0x97, 0xac, 0xbf, 0xa7, 0x57, 0x60, 0xa7, 0xd]);
interface IWMRegisteredDevice : IUnknown
{
    HRESULT GetDeviceSerialNumber(DRM_VAL16*);
    HRESULT GetDeviceCertificate(INSSBuffer*);
    HRESULT GetDeviceType(uint*);
    HRESULT GetAttributeCount(uint*);
    HRESULT GetAttributeByIndex(uint, BSTR*, BSTR*);
    HRESULT GetAttributeByName(BSTR, BSTR*);
    HRESULT SetAttributeByName(BSTR, BSTR);
    HRESULT Approve(BOOL);
    HRESULT IsValid(BOOL*);
    HRESULT IsApproved(BOOL*);
    HRESULT IsWmdrmCompliant(BOOL*);
    HRESULT IsOpened(BOOL*);
    HRESULT Open();
    HRESULT Close();
}
enum IID_IWMProximityDetection = GUID(0x6a9fd8ee, 0xb651, 0x4bf0, [0xb8, 0x49, 0x7d, 0x4e, 0xce, 0x79, 0xa2, 0xb1]);
interface IWMProximityDetection : IUnknown
{
    HRESULT StartDetection(ubyte*, uint, ubyte*, uint, uint, INSSBuffer*, IWMStatusCallback, void*);
}
enum IID_IWMDRMMessageParser = GUID(0xa73a0072, 0x25a0, 0x4c99, [0xb4, 0xa5, 0xed, 0xe8, 0x10, 0x1a, 0x6c, 0x39]);
interface IWMDRMMessageParser : IUnknown
{
    HRESULT ParseRegistrationReqMsg(ubyte*, uint, INSSBuffer*, DRM_VAL16*);
    HRESULT ParseLicenseRequestMsg(ubyte*, uint, INSSBuffer*, DRM_VAL16*, BSTR*);
}
enum IID_IWMDRMTranscryptor = GUID(0x69059850, 0x6e6f, 0x4bb2, [0x80, 0x6f, 0x71, 0x86, 0x3d, 0xdf, 0xc4, 0x71]);
interface IWMDRMTranscryptor : IUnknown
{
    HRESULT Initialize(BSTR, ubyte*, uint, INSSBuffer*, IWMStatusCallback, void*);
    HRESULT Seek(ulong);
    HRESULT Read(ubyte*, uint*);
    HRESULT Close();
}
enum IID_IWMDRMTranscryptor2 = GUID(0xe0da439f, 0xd331, 0x496a, [0xbe, 0xce, 0x18, 0xe5, 0xba, 0xc5, 0xdd, 0x23]);
interface IWMDRMTranscryptor2 : IWMDRMTranscryptor
{
    HRESULT SeekEx(ulong, ulong, float, BOOL);
    HRESULT ZeroAdjustTimestamps(BOOL);
    HRESULT GetSeekStartTime(ulong*);
    HRESULT GetDuration(ulong*);
}
enum IID_IWMDRMTranscryptionManager = GUID(0xb1a887b2, 0xa4f0, 0x407a, [0xb0, 0x2e, 0xef, 0xbd, 0x23, 0xbb, 0xec, 0xdf]);
interface IWMDRMTranscryptionManager : IUnknown
{
    HRESULT CreateTranscryptor(IWMDRMTranscryptor*);
}
enum IID_IWMWatermarkInfo = GUID(0x6f497062, 0xf2e2, 0x4624, [0x8e, 0xa7, 0x9d, 0xd4, 0xd, 0x81, 0xfc, 0x8d]);
interface IWMWatermarkInfo : IUnknown
{
    HRESULT GetWatermarkEntryCount(WMT_WATERMARK_ENTRY_TYPE, uint*);
    HRESULT GetWatermarkEntry(WMT_WATERMARK_ENTRY_TYPE, uint, WMT_WATERMARK_ENTRY*);
}
enum IID_IWMReaderAccelerator = GUID(0xbddc4d08, 0x944d, 0x4d52, [0xa6, 0x12, 0x46, 0xc3, 0xfd, 0xa0, 0x7d, 0xd4]);
interface IWMReaderAccelerator : IUnknown
{
    HRESULT GetCodecInterface(uint, const(GUID)*, void**);
    HRESULT Notify(uint, WM_MEDIA_TYPE*);
}
enum IID_IWMReaderTimecode = GUID(0xf369e2f0, 0xe081, 0x4fe6, [0x84, 0x50, 0xb8, 0x10, 0xb2, 0xf4, 0x10, 0xd1]);
interface IWMReaderTimecode : IUnknown
{
    HRESULT GetTimecodeRangeCount(ushort, ushort*);
    HRESULT GetTimecodeRangeBounds(ushort, ushort, uint*, uint*);
}
enum IID_IWMAddressAccess = GUID(0xbb3c6389, 0x1633, 0x4e92, [0xaf, 0x14, 0x9f, 0x31, 0x73, 0xba, 0x39, 0xd0]);
interface IWMAddressAccess : IUnknown
{
    HRESULT GetAccessEntryCount(WM_AETYPE, uint*);
    HRESULT GetAccessEntry(WM_AETYPE, uint, WM_ADDRESS_ACCESSENTRY*);
    HRESULT AddAccessEntry(WM_AETYPE, WM_ADDRESS_ACCESSENTRY*);
    HRESULT RemoveAccessEntry(WM_AETYPE, uint);
}
enum IID_IWMAddressAccess2 = GUID(0x65a83fc2, 0x3e98, 0x4d4d, [0x81, 0xb5, 0x2a, 0x74, 0x28, 0x86, 0xb3, 0x3d]);
interface IWMAddressAccess2 : IWMAddressAccess
{
    HRESULT GetAccessEntryEx(WM_AETYPE, uint, BSTR*, BSTR*);
    HRESULT AddAccessEntryEx(WM_AETYPE, BSTR, BSTR);
}
enum IID_IWMImageInfo = GUID(0x9f0aa3b6, 0x7267, 0x4d89, [0x88, 0xf2, 0xba, 0x91, 0x5a, 0xa5, 0xc4, 0xc6]);
interface IWMImageInfo : IUnknown
{
    HRESULT GetImageCount(uint*);
    HRESULT GetImage(uint, ushort*, PWSTR, ushort*, PWSTR, ushort*, uint*, ubyte*);
}
enum IID_IWMLicenseRevocationAgent = GUID(0x6967f2c9, 0x4e26, 0x4b57, [0x88, 0x94, 0x79, 0x98, 0x80, 0xf7, 0xac, 0x7b]);
interface IWMLicenseRevocationAgent : IUnknown
{
    HRESULT GetLRBChallenge(ubyte*, uint, ubyte*, uint, ubyte*, uint*);
    HRESULT ProcessLRB(ubyte*, uint, ubyte*, uint*);
}
enum IID_IWMAuthorizer = GUID(0xd9b67d36, 0xa9ad, 0x4eb4, [0xba, 0xef, 0xdb, 0x28, 0x4e, 0xf5, 0x50, 0x4c]);
interface IWMAuthorizer : IUnknown
{
    HRESULT GetCertCount(uint*);
    HRESULT GetCert(uint, ubyte**);
    HRESULT GetSharedData(uint, const(ubyte)*, ubyte*, ubyte**);
}
enum IID_IWMSecureChannel = GUID(0x2720598a, 0xd0f2, 0x4189, [0xbd, 0x10, 0x91, 0xc4, 0x6e, 0xf0, 0x93, 0x6f]);
interface IWMSecureChannel : IWMAuthorizer
{
    HRESULT WMSC_AddCertificate(IWMAuthorizer);
    HRESULT WMSC_AddSignature(ubyte*, uint);
    HRESULT WMSC_Connect(IWMSecureChannel);
    HRESULT WMSC_IsConnected(BOOL*);
    HRESULT WMSC_Disconnect();
    HRESULT WMSC_GetValidCertificate(ubyte**, uint*);
    HRESULT WMSC_Encrypt(ubyte*, uint);
    HRESULT WMSC_Decrypt(ubyte*, uint);
    HRESULT WMSC_Lock();
    HRESULT WMSC_Unlock();
    HRESULT WMSC_SetSharedData(uint, const(ubyte)*);
}
enum IID_IWMGetSecureChannel = GUID(0x94bc0598, 0xc3d2, 0x11d3, [0xbe, 0xdf, 0x0, 0xc0, 0x4f, 0x61, 0x29, 0x86]);
interface IWMGetSecureChannel : IUnknown
{
    HRESULT GetPeerSecureChannelInterface(IWMSecureChannel*);
}
enum IID_INSNetSourceCreator = GUID(0xc0e4080, 0x9081, 0x11d2, [0xbe, 0xec, 0x0, 0x60, 0x8, 0x2f, 0x20, 0x54]);
interface INSNetSourceCreator : IUnknown
{
    HRESULT Initialize();
    HRESULT CreateNetSource(const(wchar)*, IUnknown, ubyte*, IUnknown, IUnknown, ulong);
    HRESULT GetNetSourceProperties(const(wchar)*, IUnknown*);
    HRESULT GetNetSourceSharedNamespace(IUnknown*);
    HRESULT GetNetSourceAdminInterface(const(wchar)*, VARIANT*);
    HRESULT GetNumProtocolsSupported(uint*);
    HRESULT GetProtocolName(uint, PWSTR, ushort*);
    HRESULT Shutdown();
}
enum IID_IWMPlayerTimestampHook = GUID(0x28580dda, 0xd98e, 0x48d0, [0xb7, 0xae, 0x69, 0xe4, 0x73, 0xa0, 0x28, 0x25]);
interface IWMPlayerTimestampHook : IUnknown
{
    HRESULT MapTimestamp(long, long*);
}
alias NETSOURCE_URLCREDPOLICY_SETTINGS = int;
enum : int
{
    NETSOURCE_URLCREDPOLICY_SETTING_SILENTLOGONOK  = 0x00000000,
    NETSOURCE_URLCREDPOLICY_SETTING_MUSTPROMPTUSER = 0x00000001,
    NETSOURCE_URLCREDPOLICY_SETTING_ANONYMOUSONLY  = 0x00000002,
}

enum IID_IWMSInternalAdminNetSource = GUID(0x8bb23e5f, 0xd127, 0x4afb, [0x8d, 0x2, 0xae, 0x5b, 0x66, 0xd5, 0x4c, 0x78]);
interface IWMSInternalAdminNetSource : IUnknown
{
    HRESULT Initialize(IUnknown, IUnknown, INSNetSourceCreator, BOOL);
    HRESULT GetNetSourceCreator(INSNetSourceCreator*);
    HRESULT SetCredentials(BSTR, BSTR, BSTR, BOOL, BOOL);
    HRESULT GetCredentials(BSTR, BSTR*, BSTR*, BOOL*);
    HRESULT DeleteCredentials(BSTR);
    HRESULT GetCredentialFlags(uint*);
    HRESULT SetCredentialFlags(uint);
    HRESULT FindProxyForURL(BSTR, BSTR, BOOL*, BSTR*, uint*, uint*);
    HRESULT RegisterProxyFailure(HRESULT, uint);
    HRESULT ShutdownProxyContext(uint);
    HRESULT IsUsingIE(uint, BOOL*);
}
enum IID_IWMSInternalAdminNetSource2 = GUID(0xe74d58c3, 0xcf77, 0x4b51, [0xaf, 0x17, 0x74, 0x46, 0x87, 0xc4, 0x3e, 0xae]);
interface IWMSInternalAdminNetSource2 : IUnknown
{
    HRESULT SetCredentialsEx(BSTR, BSTR, BOOL, BSTR, BSTR, BOOL, BOOL);
    HRESULT GetCredentialsEx(BSTR, BSTR, BOOL, NETSOURCE_URLCREDPOLICY_SETTINGS*, BSTR*, BSTR*, BOOL*);
    HRESULT DeleteCredentialsEx(BSTR, BSTR, BOOL);
    HRESULT FindProxyForURLEx(BSTR, BSTR, BSTR, BOOL*, BSTR*, uint*, uint*);
}
enum IID_IWMSInternalAdminNetSource3 = GUID(0x6b63d08e, 0x4590, 0x44af, [0x9e, 0xb3, 0x57, 0xff, 0x1e, 0x73, 0xbf, 0x80]);
interface IWMSInternalAdminNetSource3 : IWMSInternalAdminNetSource2
{
    HRESULT GetNetSourceCreator2(IUnknown*);
    HRESULT FindProxyForURLEx2(BSTR, BSTR, BSTR, BOOL*, BSTR*, uint*, ulong*);
    HRESULT RegisterProxyFailure2(HRESULT, ulong);
    HRESULT ShutdownProxyContext2(ulong);
    HRESULT IsUsingIE2(ulong, BOOL*);
    HRESULT SetCredentialsEx2(BSTR, BSTR, BOOL, BSTR, BSTR, BOOL, BOOL, BOOL);
    HRESULT GetCredentialsEx2(BSTR, BSTR, BOOL, BOOL, NETSOURCE_URLCREDPOLICY_SETTINGS*, BSTR*, BSTR*, BOOL*);
}
