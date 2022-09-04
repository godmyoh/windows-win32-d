module windows.win32.media.mediafoundation;

import windows.win32.guid : GUID;
import windows.win32.devices.properties : DEVPROPKEY;
import windows.win32.foundation : BOOL, BSTR, COLORREF, FILETIME, HANDLE, HRESULT, HWND, LUID, POINT, PSTR, PWSTR, RECT, SIZE;
import windows.win32.graphics.direct3d12 : D3D12_COMMAND_LIST_SUPPORT_FLAGS, D3D12_DISCARD_REGION, D3D12_PREDICATION_OP, D3D12_QUERY_TYPE, D3D12_RESOURCE_BARRIER, D3D12_WRITEBUFFERIMMEDIATE_MODE, D3D12_WRITEBUFFERIMMEDIATE_PARAMETER, ID3D12CommandAllocator, ID3D12CommandList, ID3D12CommandQueue, ID3D12Device, ID3D12Pageable, ID3D12ProtectedResourceSession, ID3D12QueryHeap, ID3D12Resource;
import windows.win32.graphics.direct3d9 : D3DAUTHENTICATEDCHANNELTYPE, D3DAUTHENTICATEDCHANNEL_CONFIGURE_OUTPUT, D3DDEVTYPE, D3DDISPLAYMODEEX, D3DDISPLAYROTATION, D3DENCRYPTED_BLOCK_INFO, D3DFORMAT, D3DPOOL, IDirect3DDevice9, IDirect3DDevice9Ex, IDirect3DSurface9;
import windows.win32.graphics.dxgi.common : DXGI_COLOR_SPACE_TYPE, DXGI_FORMAT, DXGI_RATIONAL;
import windows.win32.graphics.gdi : BITMAPINFOHEADER, HDC, HMONITOR;
import windows.win32.media.audio_ : AudioObjectType, ISpatialAudioMetadataItems, WAVEFORMATEX;
import windows.win32.media.dxmediaobjects : DMO_MEDIA_TYPE, IMediaBuffer;
import windows.win32.system.com_ : IClassFactory, IStream, IUnknown, VARIANT;
import windows.win32.system.com.structuredstorage : PROPVARIANT;
import windows.win32.system.winrt_ : IInspectable;
import windows.win32.ui.shell.propertiessystem : INamedPropertyStore, IPropertyStore;

version (Windows):
extern (Windows):

alias MEDIA_EVENT_GENERATOR_GET_EVENT_FLAGS = uint;
enum : uint
{
    MF_EVENT_FLAG_NONE    = 0x00000000,
    MF_EVENT_FLAG_NO_WAIT = 0x00000001,
}

alias MPEG2VIDEOINFO_FLAGS = uint;
enum : uint
{
    AMMPEG2_DoPanScan           = 0x00000001,
    AMMPEG2_DVDLine21Field1     = 0x00000002,
    AMMPEG2_DVDLine21Field2     = 0x00000004,
    AMMPEG2_SourceIsLetterboxed = 0x00000008,
    AMMPEG2_FilmCameraMode      = 0x00000010,
    AMMPEG2_LetterboxAnalogOut  = 0x00000020,
    AMMPEG2_DSS_UserData        = 0x00000040,
    AMMPEG2_DVB_UserData        = 0x00000080,
    AMMPEG2_27MhzTimebase       = 0x00000100,
    AMMPEG2_WidescreenAnalogOut = 0x00000200,
}

alias MF_Plugin_Type = int;
enum : int
{
    MF_Plugin_Type_MFT                 = 0x00000000,
    MF_Plugin_Type_MediaSource         = 0x00000001,
    MF_Plugin_Type_MFT_MatchOutputType = 0x00000002,
    MF_Plugin_Type_Other               = 0xffffffff,
}

HRESULT DXVAHD_CreateDevice(IDirect3DDevice9Ex, const(DXVAHD_CONTENT_DESC)*, DXVAHD_DEVICE_USAGE, PDXVAHDSW_Plugin, IDXVAHD_Device*);
HRESULT DXVA2CreateDirect3DDeviceManager9(uint*, IDirect3DDeviceManager9*);
HRESULT DXVA2CreateVideoService(IDirect3DDevice9, const(GUID)*, void**);
HRESULT OPMGetVideoOutputsFromHMONITOR(HMONITOR, OPM_VIDEO_OUTPUT_SEMANTICS, uint*, IOPMVideoOutput**);
HRESULT OPMGetVideoOutputForTarget(LUID*, uint, OPM_VIDEO_OUTPUT_SEMANTICS, IOPMVideoOutput*);
HRESULT OPMGetVideoOutputsFromIDirect3DDevice9Object(IDirect3DDevice9, OPM_VIDEO_OUTPUT_SEMANTICS, uint*, IOPMVideoOutput**);
HRESULT MFSerializeAttributesToStream(IMFAttributes, uint, IStream);
HRESULT MFDeserializeAttributesFromStream(IMFAttributes, uint, IStream);
HRESULT MFCreateTransformActivate(IMFActivate*);
HRESULT MFCreateMediaSession(IMFAttributes, IMFMediaSession*);
HRESULT MFCreatePMPMediaSession(uint, IMFAttributes, IMFMediaSession*, IMFActivate*);
HRESULT MFCreateSourceResolver(IMFSourceResolver*);
HRESULT CreatePropertyStore(IPropertyStore*);
HRESULT MFGetSupportedSchemes(PROPVARIANT*);
HRESULT MFGetSupportedMimeTypes(PROPVARIANT*);
HRESULT MFCreateTopology(IMFTopology*);
HRESULT MFCreateTopologyNode(MF_TOPOLOGY_TYPE, IMFTopologyNode*);
HRESULT MFGetTopoNodeCurrentType(IMFTopologyNode, uint, BOOL, IMFMediaType*);
HRESULT MFGetService(IUnknown, const(GUID)*, const(GUID)*, void**);
long MFGetSystemTime();
HRESULT MFCreatePresentationClock(IMFPresentationClock*);
HRESULT MFCreateSystemTimeSource(IMFPresentationTimeSource*);
HRESULT MFCreatePresentationDescriptor(uint, IMFStreamDescriptor*, IMFPresentationDescriptor*);
HRESULT MFRequireProtectedEnvironment(IMFPresentationDescriptor);
HRESULT MFSerializePresentationDescriptor(IMFPresentationDescriptor, uint*, ubyte**);
HRESULT MFDeserializePresentationDescriptor(uint, ubyte*, IMFPresentationDescriptor*);
HRESULT MFCreateStreamDescriptor(uint, uint, IMFMediaType*, IMFStreamDescriptor*);
HRESULT MFCreateSimpleTypeHandler(IMFMediaTypeHandler*);
HRESULT MFShutdownObject(IUnknown);
HRESULT MFCreateAudioRenderer(IMFAttributes, IMFMediaSink*);
HRESULT MFCreateAudioRendererActivate(IMFActivate*);
HRESULT MFCreateVideoRendererActivate(HWND, IMFActivate*);
HRESULT MFCreateMPEG4MediaSink(IMFByteStream, IMFMediaType, IMFMediaType, IMFMediaSink*);
HRESULT MFCreate3GPMediaSink(IMFByteStream, IMFMediaType, IMFMediaType, IMFMediaSink*);
HRESULT MFCreateMP3MediaSink(IMFByteStream, IMFMediaSink*);
HRESULT MFCreateAC3MediaSink(IMFByteStream, IMFMediaType, IMFMediaSink*);
HRESULT MFCreateADTSMediaSink(IMFByteStream, IMFMediaType, IMFMediaSink*);
HRESULT MFCreateMuxSink(GUID, IMFAttributes, IMFByteStream, IMFMediaSink*);
HRESULT MFCreateFMPEG4MediaSink(IMFByteStream, IMFMediaType, IMFMediaType, IMFMediaSink*);
HRESULT MFCreateAVIMediaSink(IMFByteStream, IMFMediaType, IMFMediaType, IMFMediaSink*);
HRESULT MFCreateWAVEMediaSink(IMFByteStream, IMFMediaType, IMFMediaSink*);
HRESULT MFCreateTopoLoader(IMFTopoLoader*);
HRESULT MFCreateSampleGrabberSinkActivate(IMFMediaType, IMFSampleGrabberSinkCallback, IMFActivate*);
HRESULT MFCreateStandardQualityManager(IMFQualityManager*);
HRESULT MFCreateSequencerSource(IUnknown, IMFSequencerSource*);
HRESULT MFCreateSequencerSegmentOffset(uint, long, PROPVARIANT*);
HRESULT MFCreateAggregateSource(IMFCollection, IMFMediaSource*);
HRESULT MFCreateCredentialCache(IMFNetCredentialCache*);
HRESULT MFCreateProxyLocator(const(wchar)*, IPropertyStore, IMFNetProxyLocator*);
HRESULT MFCreateNetSchemePlugin(const(GUID)*, void**);
HRESULT MFCreatePMPServer(uint, IMFPMPServer*);
HRESULT MFCreateRemoteDesktopPlugin(IMFRemoteDesktopPlugin*);
HRESULT CreateNamedPropertyStore(INamedPropertyStore*);
HRESULT MFCreateSampleCopierMFT(IMFTransform*);
HRESULT MFCreateTranscodeProfile(IMFTranscodeProfile*);
HRESULT MFCreateTranscodeTopology(IMFMediaSource, const(wchar)*, IMFTranscodeProfile, IMFTopology*);
HRESULT MFCreateTranscodeTopologyFromByteStream(IMFMediaSource, IMFByteStream, IMFTranscodeProfile, IMFTopology*);
HRESULT MFTranscodeGetAudioOutputAvailableTypes(const(GUID)*, uint, IMFAttributes, IMFCollection*);
HRESULT MFCreateTranscodeSinkActivate(IMFActivate*);
HRESULT MFCreateTrackedSample(IMFTrackedSample*);
HRESULT MFCreateMFByteStreamOnStream(IStream, IMFByteStream*);
HRESULT MFCreateStreamOnMFByteStream(IMFByteStream, IStream*);
HRESULT MFCreateMFByteStreamOnStreamEx(IUnknown, IMFByteStream*);
HRESULT MFCreateStreamOnMFByteStreamEx(IMFByteStream, const(GUID)*, void**);
HRESULT MFCreateMediaTypeFromProperties(IUnknown, IMFMediaType*);
HRESULT MFCreatePropertiesFromMediaType(IMFMediaType, const(GUID)*, void**);
HRESULT MFEnumDeviceSources(IMFAttributes, IMFActivate**, uint*);
HRESULT MFCreateDeviceSource(IMFAttributes, IMFMediaSource*);
HRESULT MFCreateDeviceSourceActivate(IMFAttributes, IMFActivate*);
HRESULT MFCreateProtectedEnvironmentAccess(IMFProtectedEnvironmentAccess*);
HRESULT MFLoadSignedLibrary(const(wchar)*, IMFSignedLibrary*);
HRESULT MFGetSystemId(IMFSystemId*);
HRESULT MFGetLocalId(const(ubyte)*, uint, PWSTR*);
HRESULT MFCreateContentProtectionDevice(const(GUID)*, IMFContentProtectionDevice*);
HRESULT MFIsContentProtectionDeviceSupported(const(GUID)*, BOOL*);
HRESULT MFCreateContentDecryptorContext(const(GUID)*, IMFDXGIDeviceManager, IMFContentProtectionDevice, IMFContentDecryptorContext*);
HRESULT MFCreateSensorGroup(const(wchar)*, IMFSensorGroup*);
HRESULT MFCreateSensorStream(uint, IMFAttributes, IMFCollection, IMFSensorStream*);
HRESULT MFCreateSensorProfile(const(GUID)*, uint, const(wchar)*, IMFSensorProfile*);
HRESULT MFCreateSensorProfileCollection(IMFSensorProfileCollection*);
HRESULT MFCreateSensorActivityMonitor(IMFSensorActivitiesReportCallback, IMFSensorActivityMonitor*);
HRESULT MFCreateExtendedCameraIntrinsics(IMFExtendedCameraIntrinsics*);
HRESULT MFCreateExtendedCameraIntrinsicModel(const(MFCameraIntrinsic_DistortionModelType), IMFExtendedCameraIntrinsicModel*);
HRESULT MFCreateRelativePanelWatcher(const(wchar)*, const(wchar)*, IMFRelativePanelWatcher*);
HRESULT MFCreateCameraOcclusionStateMonitor(const(wchar)*, IMFCameraOcclusionStateReportCallback, IMFCameraOcclusionStateMonitor*);
HRESULT MFCreateASFContentInfo(IMFASFContentInfo*);
HRESULT MFCreateASFIndexer(IMFASFIndexer*);
HRESULT MFCreateASFIndexerByteStream(IMFByteStream, ulong, IMFByteStream*);
HRESULT MFCreateASFSplitter(IMFASFSplitter*);
HRESULT MFCreateASFProfile(IMFASFProfile*);
HRESULT MFCreateASFProfileFromPresentationDescriptor(IMFPresentationDescriptor, IMFASFProfile*);
HRESULT MFCreatePresentationDescriptorFromASFProfile(IMFASFProfile, IMFPresentationDescriptor*);
HRESULT MFCreateASFMultiplexer(IMFASFMultiplexer*);
HRESULT MFCreateASFStreamSelector(IMFASFProfile, IMFASFStreamSelector*);
HRESULT MFCreateASFMediaSink(IMFByteStream, IMFMediaSink*);
HRESULT MFCreateASFMediaSinkActivate(const(wchar)*, IMFASFContentInfo, IMFActivate*);
HRESULT MFCreateWMVEncoderActivate(IMFMediaType, IPropertyStore, IMFActivate*);
HRESULT MFCreateWMAEncoderActivate(IMFMediaType, IPropertyStore, IMFActivate*);
HRESULT MFCreateASFStreamingMediaSink(IMFByteStream, IMFMediaSink*);
HRESULT MFCreateASFStreamingMediaSinkActivate(IMFActivate, IMFASFContentInfo, IMFActivate*);
HRESULT MFCreateD3D12SynchronizationObject(ID3D12Device, const(GUID)*, void**);
HRESULT MFStartup(uint, uint);
HRESULT MFShutdown();
HRESULT MFLockPlatform();
HRESULT MFUnlockPlatform();
HRESULT MFPutWorkItem(uint, IMFAsyncCallback, IUnknown);
HRESULT MFPutWorkItem2(uint, int, IMFAsyncCallback, IUnknown);
HRESULT MFPutWorkItemEx(uint, IMFAsyncResult);
HRESULT MFPutWorkItemEx2(uint, int, IMFAsyncResult);
HRESULT MFPutWaitingWorkItem(HANDLE, int, IMFAsyncResult, ulong*);
HRESULT MFAllocateSerialWorkQueue(uint, uint*);
HRESULT MFScheduleWorkItemEx(IMFAsyncResult, long, ulong*);
HRESULT MFScheduleWorkItem(IMFAsyncCallback, IUnknown, long, ulong*);
HRESULT MFCancelWorkItem(ulong);
HRESULT MFGetTimerPeriodicity(uint*);
HRESULT MFAddPeriodicCallback(MFPERIODICCALLBACK, IUnknown, uint*);
HRESULT MFRemovePeriodicCallback(uint);
HRESULT MFAllocateWorkQueueEx(MFASYNC_WORKQUEUE_TYPE, uint*);
HRESULT MFAllocateWorkQueue(uint*);
HRESULT MFLockWorkQueue(uint);
HRESULT MFUnlockWorkQueue(uint);
HRESULT MFBeginRegisterWorkQueueWithMMCSS(uint, const(wchar)*, uint, IMFAsyncCallback, IUnknown);
HRESULT MFBeginRegisterWorkQueueWithMMCSSEx(uint, const(wchar)*, uint, int, IMFAsyncCallback, IUnknown);
HRESULT MFEndRegisterWorkQueueWithMMCSS(IMFAsyncResult, uint*);
HRESULT MFBeginUnregisterWorkQueueWithMMCSS(uint, IMFAsyncCallback, IUnknown);
HRESULT MFEndUnregisterWorkQueueWithMMCSS(IMFAsyncResult);
HRESULT MFGetWorkQueueMMCSSClass(uint, PWSTR, uint*);
HRESULT MFGetWorkQueueMMCSSTaskId(uint, uint*);
HRESULT MFRegisterPlatformWithMMCSS(const(wchar)*, uint*, int);
HRESULT MFUnregisterPlatformFromMMCSS();
HRESULT MFLockSharedWorkQueue(const(wchar)*, int, uint*, uint*);
HRESULT MFGetWorkQueueMMCSSPriority(uint, int*);
HRESULT MFCreateAsyncResult(IUnknown, IMFAsyncCallback, IUnknown, IMFAsyncResult*);
HRESULT MFInvokeCallback(IMFAsyncResult);
HRESULT MFCreateFile(MF_FILE_ACCESSMODE, MF_FILE_OPENMODE, MF_FILE_FLAGS, const(wchar)*, IMFByteStream*);
HRESULT MFCreateTempFile(MF_FILE_ACCESSMODE, MF_FILE_OPENMODE, MF_FILE_FLAGS, IMFByteStream*);
HRESULT MFBeginCreateFile(MF_FILE_ACCESSMODE, MF_FILE_OPENMODE, MF_FILE_FLAGS, const(wchar)*, IMFAsyncCallback, IUnknown, IUnknown*);
HRESULT MFEndCreateFile(IMFAsyncResult, IMFByteStream*);
HRESULT MFCancelCreateFile(IUnknown);
HRESULT MFCreateMemoryBuffer(uint, IMFMediaBuffer*);
HRESULT MFCreateMediaBufferWrapper(IMFMediaBuffer, uint, uint, IMFMediaBuffer*);
HRESULT MFCreateLegacyMediaBufferOnMFMediaBuffer(IMFSample, IMFMediaBuffer, uint, IMediaBuffer*);
DXGI_FORMAT MFMapDX9FormatToDXGIFormat(uint);
uint MFMapDXGIFormatToDX9Format(DXGI_FORMAT);
HRESULT MFLockDXGIDeviceManager(uint*, IMFDXGIDeviceManager*);
HRESULT MFUnlockDXGIDeviceManager();
HRESULT MFCreateDXSurfaceBuffer(const(GUID)*, IUnknown, BOOL, IMFMediaBuffer*);
HRESULT MFCreateWICBitmapBuffer(const(GUID)*, IUnknown, IMFMediaBuffer*);
HRESULT MFCreateDXGISurfaceBuffer(const(GUID)*, IUnknown, uint, BOOL, IMFMediaBuffer*);
HRESULT MFCreateVideoSampleAllocatorEx(const(GUID)*, void**);
HRESULT MFCreateDXGIDeviceManager(uint*, IMFDXGIDeviceManager*);
HRESULT MFCreateAlignedMemoryBuffer(uint, uint, IMFMediaBuffer*);
HRESULT MFCreateMediaEvent(uint, const(GUID)*, HRESULT, const(PROPVARIANT)*, IMFMediaEvent*);
HRESULT MFCreateEventQueue(IMFMediaEventQueue*);
HRESULT MFCreateSample(IMFSample*);
HRESULT MFCreateAttributes(IMFAttributes*, uint);
HRESULT MFInitAttributesFromBlob(IMFAttributes, const(ubyte)*, uint);
HRESULT MFGetAttributesAsBlobSize(IMFAttributes, uint*);
HRESULT MFGetAttributesAsBlob(IMFAttributes, ubyte*, uint);
HRESULT MFTRegister(GUID, GUID, PWSTR, uint, uint, MFT_REGISTER_TYPE_INFO*, uint, MFT_REGISTER_TYPE_INFO*, IMFAttributes);
HRESULT MFTUnregister(GUID);
HRESULT MFTRegisterLocal(IClassFactory, const(GUID)*, const(wchar)*, uint, uint, const(MFT_REGISTER_TYPE_INFO)*, uint, const(MFT_REGISTER_TYPE_INFO)*);
HRESULT MFTUnregisterLocal(IClassFactory);
HRESULT MFTRegisterLocalByCLSID(const(GUID)*, const(GUID)*, const(wchar)*, uint, uint, const(MFT_REGISTER_TYPE_INFO)*, uint, const(MFT_REGISTER_TYPE_INFO)*);
HRESULT MFTUnregisterLocalByCLSID(GUID);
HRESULT MFTEnum(GUID, uint, MFT_REGISTER_TYPE_INFO*, MFT_REGISTER_TYPE_INFO*, IMFAttributes, GUID**, uint*);
HRESULT MFTEnumEx(GUID, MFT_ENUM_FLAG, const(MFT_REGISTER_TYPE_INFO)*, const(MFT_REGISTER_TYPE_INFO)*, IMFActivate**, uint*);
HRESULT MFTEnum2(GUID, MFT_ENUM_FLAG, const(MFT_REGISTER_TYPE_INFO)*, const(MFT_REGISTER_TYPE_INFO)*, IMFAttributes, IMFActivate**, uint*);
HRESULT MFTGetInfo(GUID, PWSTR*, MFT_REGISTER_TYPE_INFO**, uint*, MFT_REGISTER_TYPE_INFO**, uint*, IMFAttributes*);
HRESULT MFGetPluginControl(IMFPluginControl*);
HRESULT MFGetMFTMerit(IUnknown, uint, const(ubyte)*, uint*);
HRESULT MFRegisterLocalSchemeHandler(const(wchar)*, IMFActivate);
HRESULT MFRegisterLocalByteStreamHandler(const(wchar)*, const(wchar)*, IMFActivate);
HRESULT MFCreateMFByteStreamWrapper(IMFByteStream, IMFByteStream*);
HRESULT MFCreateMediaExtensionActivate(const(wchar)*, IUnknown, const(GUID)*, void**);
HRESULT MFCreateMuxStreamAttributes(IMFCollection, IMFAttributes*);
HRESULT MFCreateMuxStreamMediaType(IMFCollection, IMFMediaType*);
HRESULT MFCreateMuxStreamSample(IMFCollection, IMFSample*);
HRESULT MFValidateMediaTypeSize(GUID, ubyte*, uint);
HRESULT MFCreateMediaType(IMFMediaType*);
HRESULT MFCreateMFVideoFormatFromMFMediaType(IMFMediaType, MFVIDEOFORMAT**, uint*);
HRESULT MFCreateWaveFormatExFromMFMediaType(IMFMediaType, WAVEFORMATEX**, uint*, uint);
HRESULT MFInitMediaTypeFromVideoInfoHeader(IMFMediaType, const(VIDEOINFOHEADER)*, uint, const(GUID)*);
HRESULT MFInitMediaTypeFromVideoInfoHeader2(IMFMediaType, const(VIDEOINFOHEADER2)*, uint, const(GUID)*);
HRESULT MFInitMediaTypeFromMPEG1VideoInfo(IMFMediaType, const(MPEG1VIDEOINFO)*, uint, const(GUID)*);
HRESULT MFInitMediaTypeFromMPEG2VideoInfo(IMFMediaType, const(MPEG2VIDEOINFO)*, uint, const(GUID)*);
HRESULT MFCalculateBitmapImageSize(const(BITMAPINFOHEADER)*, uint, uint*, BOOL*);
HRESULT MFCalculateImageSize(const(GUID)*, uint, uint, uint*);
HRESULT MFFrameRateToAverageTimePerFrame(uint, uint, ulong*);
HRESULT MFAverageTimePerFrameToFrameRate(ulong, uint*, uint*);
HRESULT MFInitMediaTypeFromMFVideoFormat(IMFMediaType, const(MFVIDEOFORMAT)*, uint);
HRESULT MFInitMediaTypeFromWaveFormatEx(IMFMediaType, const(WAVEFORMATEX)*, uint);
HRESULT MFInitMediaTypeFromAMMediaType(IMFMediaType, const(AM_MEDIA_TYPE)*);
HRESULT MFInitAMMediaTypeFromMFMediaType(IMFMediaType, GUID, AM_MEDIA_TYPE*);
HRESULT MFCreateAMMediaTypeFromMFMediaType(IMFMediaType, GUID, AM_MEDIA_TYPE**);
BOOL MFCompareFullToPartialMediaType(IMFMediaType, IMFMediaType);
HRESULT MFWrapMediaType(IMFMediaType, const(GUID)*, const(GUID)*, IMFMediaType*);
HRESULT MFUnwrapMediaType(IMFMediaType, IMFMediaType*);
HRESULT MFCreateVideoMediaType(const(MFVIDEOFORMAT)*, IMFVideoMediaType*);
HRESULT MFCreateVideoMediaTypeFromSubtype(const(GUID)*, IMFVideoMediaType*);
BOOL MFIsFormatYUV(uint);
HRESULT MFCreateVideoMediaTypeFromBitMapInfoHeader(const(BITMAPINFOHEADER)*, uint, uint, MFVideoInterlaceMode, ulong, ulong, ulong, uint, IMFVideoMediaType*);
HRESULT MFGetStrideForBitmapInfoHeader(uint, uint, int*);
HRESULT MFGetPlaneSize(uint, uint, uint, uint*);
HRESULT MFCreateVideoMediaTypeFromBitMapInfoHeaderEx(const(BITMAPINFOHEADER)*, uint, uint, uint, MFVideoInterlaceMode, ulong, uint, uint, uint, IMFVideoMediaType*);
HRESULT MFCreateMediaTypeFromRepresentation(GUID, void*, IMFMediaType*);
HRESULT MFCreateAudioMediaType(const(WAVEFORMATEX)*, IMFAudioMediaType*);
uint MFGetUncompressedVideoFormat(const(MFVIDEOFORMAT)*);
HRESULT MFInitVideoFormat(MFVIDEOFORMAT*, MFStandardVideoFormat);
HRESULT MFInitVideoFormat_RGB(MFVIDEOFORMAT*, uint, uint, uint);
HRESULT MFConvertColorInfoToDXVA(uint*, const(MFVIDEOFORMAT)*);
HRESULT MFConvertColorInfoFromDXVA(MFVIDEOFORMAT*, uint);
HRESULT MFCopyImage(ubyte*, int, const(ubyte)*, int, uint, uint);
HRESULT MFConvertFromFP16Array(float*, const(ushort)*, uint);
HRESULT MFConvertToFP16Array(ushort*, const(float)*, uint);
HRESULT MFCreate2DMediaBuffer(uint, uint, uint, BOOL, IMFMediaBuffer*);
HRESULT MFCreateMediaBufferFromMediaType(IMFMediaType, long, uint, uint, IMFMediaBuffer*);
HRESULT MFCreateCollection(IMFCollection*);
void* MFHeapAlloc(ulong, uint, PSTR, int, EAllocationType);
void MFHeapFree(void*);
long MFllMulDiv(long, long, long, long);
HRESULT MFGetContentProtectionSystemCLSID(const(GUID)*, GUID*);
HRESULT MFCombineSamples(IMFSample, IMFSample, uint, BOOL*);
HRESULT MFSplitSample(IMFSample, IMFSample*, uint, uint*);
HRESULT MFCreateSourceReaderFromURL(const(wchar)*, IMFAttributes, IMFSourceReader*);
HRESULT MFCreateSourceReaderFromByteStream(IMFByteStream, IMFAttributes, IMFSourceReader*);
HRESULT MFCreateSourceReaderFromMediaSource(IMFMediaSource, IMFAttributes, IMFSourceReader*);
HRESULT MFCreateSinkWriterFromURL(const(wchar)*, IMFByteStream, IMFAttributes, IMFSinkWriter*);
HRESULT MFCreateSinkWriterFromMediaSink(IMFMediaSink, IMFAttributes, IMFSinkWriter*);
HRESULT MFCreateVideoPresenter(IUnknown, const(GUID)*, const(GUID)*, void**);
HRESULT MFCreateVideoMixer(IUnknown, const(GUID)*, const(GUID)*, void**);
HRESULT MFCreateVideoMixerAndPresenter(IUnknown, IUnknown, const(GUID)*, void**, const(GUID)*, void**);
HRESULT MFCreateVideoRenderer(const(GUID)*, void**);
HRESULT MFCreateVideoSampleFromSurface(IUnknown, IMFSample*);
HRESULT MFCreateVideoSampleAllocator(const(GUID)*, void**);
HRESULT MFPCreateMediaPlayer(const(wchar)*, BOOL, MFP_CREATION_OPTIONS, IMFPMediaPlayerCallback, HWND, IMFPMediaPlayer*);
HRESULT MFCreateEncryptedMediaExtensionsStoreActivate(IMFPMPHostApp, IStream, const(wchar)*, IMFActivate*);
HRESULT MFCreateVirtualCamera(MFVirtualCameraType, MFVirtualCameraLifetime, MFVirtualCameraAccess, const(wchar)*, const(wchar)*, const(GUID)*, uint, IMFVirtualCamera*);
HRESULT MFIsVirtualCameraTypeSupported(MFVirtualCameraType, BOOL*);
HRESULT OPMXboxEnableHDCP(OPM_HDCP_TYPE);
HRESULT OPMXboxGetHDCPStatus(OPM_HDCP_STATUS*);
HRESULT OPMXboxGetHDCPStatusAndType(OPM_HDCP_STATUS*, OPM_HDCP_TYPE*);
enum MEDIASUBTYPE_None = GUID(0xe436eb8e, 0x524f, 0x11ce, [0x9f, 0x53, 0x0, 0x20, 0xaf, 0xb, 0xa7, 0x70]);
enum MEDIATYPE_Video = GUID(0x73646976, 0x0, 0x10, [0x80, 0x0, 0x0, 0xaa, 0x0, 0x38, 0x9b, 0x71]);
enum MEDIATYPE_Audio = GUID(0x73647561, 0x0, 0x10, [0x80, 0x0, 0x0, 0xaa, 0x0, 0x38, 0x9b, 0x71]);
enum MEDIATYPE_Text = GUID(0x73747874, 0x0, 0x10, [0x80, 0x0, 0x0, 0xaa, 0x0, 0x38, 0x9b, 0x71]);
enum MEDIATYPE_Midi = GUID(0x7364696d, 0x0, 0x10, [0x80, 0x0, 0x0, 0xaa, 0x0, 0x38, 0x9b, 0x71]);
enum MEDIATYPE_Stream = GUID(0xe436eb83, 0x524f, 0x11ce, [0x9f, 0x53, 0x0, 0x20, 0xaf, 0xb, 0xa7, 0x70]);
enum MEDIATYPE_Interleaved = GUID(0x73766169, 0x0, 0x10, [0x80, 0x0, 0x0, 0xaa, 0x0, 0x38, 0x9b, 0x71]);
enum MEDIATYPE_File = GUID(0x656c6966, 0x0, 0x10, [0x80, 0x0, 0x0, 0xaa, 0x0, 0x38, 0x9b, 0x71]);
enum MEDIATYPE_ScriptCommand = GUID(0x73636d64, 0x0, 0x10, [0x80, 0x0, 0x0, 0xaa, 0x0, 0x38, 0x9b, 0x71]);
enum MEDIATYPE_AUXLine21Data = GUID(0x670aea80, 0x3a82, 0x11d0, [0xb7, 0x9b, 0x0, 0xaa, 0x0, 0x37, 0x67, 0xa7]);
enum MEDIATYPE_AUXTeletextPage = GUID(0x11264acb, 0x37de, 0x4eba, [0x8c, 0x35, 0x7f, 0x4, 0xa1, 0xa6, 0x83, 0x32]);
enum MEDIATYPE_CC_CONTAINER = GUID(0xaeb312e9, 0x3357, 0x43ca, [0xb7, 0x1, 0x97, 0xec, 0x19, 0x8e, 0x2b, 0x62]);
enum MEDIATYPE_DTVCCData = GUID(0xfb77e152, 0x53b2, 0x499c, [0xb4, 0x6b, 0x50, 0x9f, 0xc3, 0x3e, 0xdf, 0xd7]);
enum MEDIATYPE_MSTVCaption = GUID(0xb88b8a89, 0xb049, 0x4c80, [0xad, 0xcf, 0x58, 0x98, 0x98, 0x5e, 0x22, 0xc1]);
enum MEDIATYPE_VBI = GUID(0xf72a76e1, 0xeb0a, 0x11d0, [0xac, 0xe4, 0x0, 0x0, 0xc0, 0xcc, 0x16, 0xba]);
enum MEDIASUBTYPE_DVB_SUBTITLES = GUID(0x34ffcbc3, 0xd5b3, 0x4171, [0x90, 0x2, 0xd4, 0xc6, 0x3, 0x1, 0x69, 0x7f]);
enum MEDIASUBTYPE_ISDB_CAPTIONS = GUID(0x59dd67d, 0x2e55, 0x4d41, [0x8d, 0x1b, 0x1, 0xf5, 0xe4, 0xf5, 0x6, 0x7]);
enum MEDIASUBTYPE_ISDB_SUPERIMPOSE = GUID(0x36dc6d28, 0xf1a6, 0x4216, [0x90, 0x48, 0x9c, 0xfc, 0xef, 0xeb, 0x5e, 0xba]);
enum MEDIATYPE_Timecode = GUID(0x482dee3, 0x7817, 0x11cf, [0x8a, 0x3, 0x0, 0xaa, 0x0, 0x6e, 0xcb, 0x65]);
enum MEDIATYPE_LMRT = GUID(0x74726c6d, 0x0, 0x10, [0x80, 0x0, 0x0, 0xaa, 0x0, 0x38, 0x9b, 0x71]);
enum MEDIATYPE_URL_STREAM = GUID(0x736c7275, 0x0, 0x10, [0x80, 0x0, 0x0, 0xaa, 0x0, 0x38, 0x9b, 0x71]);
enum MEDIASUBTYPE_CLPL = GUID(0x4c504c43, 0x0, 0x10, [0x80, 0x0, 0x0, 0xaa, 0x0, 0x38, 0x9b, 0x71]);
enum MEDIASUBTYPE_YUYV = GUID(0x56595559, 0x0, 0x10, [0x80, 0x0, 0x0, 0xaa, 0x0, 0x38, 0x9b, 0x71]);
enum MEDIASUBTYPE_IYUV = GUID(0x56555949, 0x0, 0x10, [0x80, 0x0, 0x0, 0xaa, 0x0, 0x38, 0x9b, 0x71]);
enum MEDIASUBTYPE_YVU9 = GUID(0x39555659, 0x0, 0x10, [0x80, 0x0, 0x0, 0xaa, 0x0, 0x38, 0x9b, 0x71]);
enum MEDIASUBTYPE_Y411 = GUID(0x31313459, 0x0, 0x10, [0x80, 0x0, 0x0, 0xaa, 0x0, 0x38, 0x9b, 0x71]);
enum MEDIASUBTYPE_Y41P = GUID(0x50313459, 0x0, 0x10, [0x80, 0x0, 0x0, 0xaa, 0x0, 0x38, 0x9b, 0x71]);
enum MEDIASUBTYPE_YUY2 = GUID(0x32595559, 0x0, 0x10, [0x80, 0x0, 0x0, 0xaa, 0x0, 0x38, 0x9b, 0x71]);
enum MEDIASUBTYPE_YVYU = GUID(0x55595659, 0x0, 0x10, [0x80, 0x0, 0x0, 0xaa, 0x0, 0x38, 0x9b, 0x71]);
enum MEDIASUBTYPE_UYVY = GUID(0x59565955, 0x0, 0x10, [0x80, 0x0, 0x0, 0xaa, 0x0, 0x38, 0x9b, 0x71]);
enum MEDIASUBTYPE_Y211 = GUID(0x31313259, 0x0, 0x10, [0x80, 0x0, 0x0, 0xaa, 0x0, 0x38, 0x9b, 0x71]);
enum MEDIASUBTYPE_CLJR = GUID(0x524a4c43, 0x0, 0x10, [0x80, 0x0, 0x0, 0xaa, 0x0, 0x38, 0x9b, 0x71]);
enum MEDIASUBTYPE_IF09 = GUID(0x39304649, 0x0, 0x10, [0x80, 0x0, 0x0, 0xaa, 0x0, 0x38, 0x9b, 0x71]);
enum MEDIASUBTYPE_CPLA = GUID(0x414c5043, 0x0, 0x10, [0x80, 0x0, 0x0, 0xaa, 0x0, 0x38, 0x9b, 0x71]);
enum MEDIASUBTYPE_MJPG = GUID(0x47504a4d, 0x0, 0x10, [0x80, 0x0, 0x0, 0xaa, 0x0, 0x38, 0x9b, 0x71]);
enum MEDIASUBTYPE_TVMJ = GUID(0x4a4d5654, 0x0, 0x10, [0x80, 0x0, 0x0, 0xaa, 0x0, 0x38, 0x9b, 0x71]);
enum MEDIASUBTYPE_WAKE = GUID(0x454b4157, 0x0, 0x10, [0x80, 0x0, 0x0, 0xaa, 0x0, 0x38, 0x9b, 0x71]);
enum MEDIASUBTYPE_CFCC = GUID(0x43434643, 0x0, 0x10, [0x80, 0x0, 0x0, 0xaa, 0x0, 0x38, 0x9b, 0x71]);
enum MEDIASUBTYPE_IJPG = GUID(0x47504a49, 0x0, 0x10, [0x80, 0x0, 0x0, 0xaa, 0x0, 0x38, 0x9b, 0x71]);
enum MEDIASUBTYPE_Plum = GUID(0x6d756c50, 0x0, 0x10, [0x80, 0x0, 0x0, 0xaa, 0x0, 0x38, 0x9b, 0x71]);
enum MEDIASUBTYPE_DVCS = GUID(0x53435644, 0x0, 0x10, [0x80, 0x0, 0x0, 0xaa, 0x0, 0x38, 0x9b, 0x71]);
enum MEDIASUBTYPE_H264 = GUID(0x34363248, 0x0, 0x10, [0x80, 0x0, 0x0, 0xaa, 0x0, 0x38, 0x9b, 0x71]);
enum MEDIASUBTYPE_DVSD = GUID(0x44535644, 0x0, 0x10, [0x80, 0x0, 0x0, 0xaa, 0x0, 0x38, 0x9b, 0x71]);
enum MEDIASUBTYPE_MDVF = GUID(0x4656444d, 0x0, 0x10, [0x80, 0x0, 0x0, 0xaa, 0x0, 0x38, 0x9b, 0x71]);
enum MEDIASUBTYPE_RGB1 = GUID(0xe436eb78, 0x524f, 0x11ce, [0x9f, 0x53, 0x0, 0x20, 0xaf, 0xb, 0xa7, 0x70]);
enum MEDIASUBTYPE_RGB4 = GUID(0xe436eb79, 0x524f, 0x11ce, [0x9f, 0x53, 0x0, 0x20, 0xaf, 0xb, 0xa7, 0x70]);
enum MEDIASUBTYPE_RGB8 = GUID(0xe436eb7a, 0x524f, 0x11ce, [0x9f, 0x53, 0x0, 0x20, 0xaf, 0xb, 0xa7, 0x70]);
enum MEDIASUBTYPE_RGB565 = GUID(0xe436eb7b, 0x524f, 0x11ce, [0x9f, 0x53, 0x0, 0x20, 0xaf, 0xb, 0xa7, 0x70]);
enum MEDIASUBTYPE_RGB555 = GUID(0xe436eb7c, 0x524f, 0x11ce, [0x9f, 0x53, 0x0, 0x20, 0xaf, 0xb, 0xa7, 0x70]);
enum MEDIASUBTYPE_RGB24 = GUID(0xe436eb7d, 0x524f, 0x11ce, [0x9f, 0x53, 0x0, 0x20, 0xaf, 0xb, 0xa7, 0x70]);
enum MEDIASUBTYPE_RGB32 = GUID(0xe436eb7e, 0x524f, 0x11ce, [0x9f, 0x53, 0x0, 0x20, 0xaf, 0xb, 0xa7, 0x70]);
enum MEDIASUBTYPE_ARGB1555 = GUID(0x297c55af, 0xe209, 0x4cb3, [0xb7, 0x57, 0xc7, 0x6d, 0x6b, 0x9c, 0x88, 0xa8]);
enum MEDIASUBTYPE_ARGB4444 = GUID(0x6e6415e6, 0x5c24, 0x425f, [0x93, 0xcd, 0x80, 0x10, 0x2b, 0x3d, 0x1c, 0xca]);
enum MEDIASUBTYPE_ARGB32 = GUID(0x773c9ac0, 0x3274, 0x11d0, [0xb7, 0x24, 0x0, 0xaa, 0x0, 0x6c, 0x1a, 0x1]);
enum MEDIASUBTYPE_A2R10G10B10 = GUID(0x2f8bb76d, 0xb644, 0x4550, [0xac, 0xf3, 0xd3, 0xc, 0xaa, 0x65, 0xd5, 0xc5]);
enum MEDIASUBTYPE_A2B10G10R10 = GUID(0x576f7893, 0xbdf6, 0x48c4, [0x87, 0x5f, 0xae, 0x7b, 0x81, 0x83, 0x45, 0x67]);
enum MEDIASUBTYPE_AYUV = GUID(0x56555941, 0x0, 0x10, [0x80, 0x0, 0x0, 0xaa, 0x0, 0x38, 0x9b, 0x71]);
enum MEDIASUBTYPE_AI44 = GUID(0x34344941, 0x0, 0x10, [0x80, 0x0, 0x0, 0xaa, 0x0, 0x38, 0x9b, 0x71]);
enum MEDIASUBTYPE_IA44 = GUID(0x34344149, 0x0, 0x10, [0x80, 0x0, 0x0, 0xaa, 0x0, 0x38, 0x9b, 0x71]);
enum MEDIASUBTYPE_RGB32_D3D_DX7_RT = GUID(0x32335237, 0x0, 0x10, [0x80, 0x0, 0x0, 0xaa, 0x0, 0x38, 0x9b, 0x71]);
enum MEDIASUBTYPE_RGB16_D3D_DX7_RT = GUID(0x36315237, 0x0, 0x10, [0x80, 0x0, 0x0, 0xaa, 0x0, 0x38, 0x9b, 0x71]);
enum MEDIASUBTYPE_ARGB32_D3D_DX7_RT = GUID(0x38384137, 0x0, 0x10, [0x80, 0x0, 0x0, 0xaa, 0x0, 0x38, 0x9b, 0x71]);
enum MEDIASUBTYPE_ARGB4444_D3D_DX7_RT = GUID(0x34344137, 0x0, 0x10, [0x80, 0x0, 0x0, 0xaa, 0x0, 0x38, 0x9b, 0x71]);
enum MEDIASUBTYPE_ARGB1555_D3D_DX7_RT = GUID(0x35314137, 0x0, 0x10, [0x80, 0x0, 0x0, 0xaa, 0x0, 0x38, 0x9b, 0x71]);
enum MEDIASUBTYPE_RGB32_D3D_DX9_RT = GUID(0x32335239, 0x0, 0x10, [0x80, 0x0, 0x0, 0xaa, 0x0, 0x38, 0x9b, 0x71]);
enum MEDIASUBTYPE_RGB16_D3D_DX9_RT = GUID(0x36315239, 0x0, 0x10, [0x80, 0x0, 0x0, 0xaa, 0x0, 0x38, 0x9b, 0x71]);
enum MEDIASUBTYPE_ARGB32_D3D_DX9_RT = GUID(0x38384139, 0x0, 0x10, [0x80, 0x0, 0x0, 0xaa, 0x0, 0x38, 0x9b, 0x71]);
enum MEDIASUBTYPE_ARGB4444_D3D_DX9_RT = GUID(0x34344139, 0x0, 0x10, [0x80, 0x0, 0x0, 0xaa, 0x0, 0x38, 0x9b, 0x71]);
enum MEDIASUBTYPE_ARGB1555_D3D_DX9_RT = GUID(0x35314139, 0x0, 0x10, [0x80, 0x0, 0x0, 0xaa, 0x0, 0x38, 0x9b, 0x71]);
enum MEDIASUBTYPE_YV12 = GUID(0x32315659, 0x0, 0x10, [0x80, 0x0, 0x0, 0xaa, 0x0, 0x38, 0x9b, 0x71]);
enum MEDIASUBTYPE_NV12 = GUID(0x3231564e, 0x0, 0x10, [0x80, 0x0, 0x0, 0xaa, 0x0, 0x38, 0x9b, 0x71]);
enum MEDIASUBTYPE_NV11 = GUID(0x3131564e, 0x0, 0x10, [0x80, 0x0, 0x0, 0xaa, 0x0, 0x38, 0x9b, 0x71]);
enum MEDIASUBTYPE_P208 = GUID(0x38303250, 0x0, 0x10, [0x80, 0x0, 0x0, 0xaa, 0x0, 0x38, 0x9b, 0x71]);
enum MEDIASUBTYPE_P210 = GUID(0x30313250, 0x0, 0x10, [0x80, 0x0, 0x0, 0xaa, 0x0, 0x38, 0x9b, 0x71]);
enum MEDIASUBTYPE_P216 = GUID(0x36313250, 0x0, 0x10, [0x80, 0x0, 0x0, 0xaa, 0x0, 0x38, 0x9b, 0x71]);
enum MEDIASUBTYPE_P010 = GUID(0x30313050, 0x0, 0x10, [0x80, 0x0, 0x0, 0xaa, 0x0, 0x38, 0x9b, 0x71]);
enum MEDIASUBTYPE_P016 = GUID(0x36313050, 0x0, 0x10, [0x80, 0x0, 0x0, 0xaa, 0x0, 0x38, 0x9b, 0x71]);
enum MEDIASUBTYPE_Y210 = GUID(0x30313259, 0x0, 0x10, [0x80, 0x0, 0x0, 0xaa, 0x0, 0x38, 0x9b, 0x71]);
enum MEDIASUBTYPE_Y216 = GUID(0x36313259, 0x0, 0x10, [0x80, 0x0, 0x0, 0xaa, 0x0, 0x38, 0x9b, 0x71]);
enum MEDIASUBTYPE_P408 = GUID(0x38303450, 0x0, 0x10, [0x80, 0x0, 0x0, 0xaa, 0x0, 0x38, 0x9b, 0x71]);
enum MEDIASUBTYPE_NV24 = GUID(0x3432564e, 0x0, 0x10, [0x80, 0x0, 0x0, 0xaa, 0x0, 0x38, 0x9b, 0x71]);
enum MEDIASUBTYPE_420O = GUID(0x4f303234, 0x0, 0x10, [0x80, 0x0, 0x0, 0xaa, 0x0, 0x38, 0x9b, 0x71]);
enum MEDIASUBTYPE_IMC1 = GUID(0x31434d49, 0x0, 0x10, [0x80, 0x0, 0x0, 0xaa, 0x0, 0x38, 0x9b, 0x71]);
enum MEDIASUBTYPE_IMC2 = GUID(0x32434d49, 0x0, 0x10, [0x80, 0x0, 0x0, 0xaa, 0x0, 0x38, 0x9b, 0x71]);
enum MEDIASUBTYPE_IMC3 = GUID(0x33434d49, 0x0, 0x10, [0x80, 0x0, 0x0, 0xaa, 0x0, 0x38, 0x9b, 0x71]);
enum MEDIASUBTYPE_IMC4 = GUID(0x34434d49, 0x0, 0x10, [0x80, 0x0, 0x0, 0xaa, 0x0, 0x38, 0x9b, 0x71]);
enum MEDIASUBTYPE_S340 = GUID(0x30343353, 0x0, 0x10, [0x80, 0x0, 0x0, 0xaa, 0x0, 0x38, 0x9b, 0x71]);
enum MEDIASUBTYPE_S342 = GUID(0x32343353, 0x0, 0x10, [0x80, 0x0, 0x0, 0xaa, 0x0, 0x38, 0x9b, 0x71]);
enum MEDIASUBTYPE_Overlay = GUID(0xe436eb7f, 0x524f, 0x11ce, [0x9f, 0x53, 0x0, 0x20, 0xaf, 0xb, 0xa7, 0x70]);
enum MEDIASUBTYPE_MPEG1Packet = GUID(0xe436eb80, 0x524f, 0x11ce, [0x9f, 0x53, 0x0, 0x20, 0xaf, 0xb, 0xa7, 0x70]);
enum MEDIASUBTYPE_MPEG1Payload = GUID(0xe436eb81, 0x524f, 0x11ce, [0x9f, 0x53, 0x0, 0x20, 0xaf, 0xb, 0xa7, 0x70]);
enum MEDIASUBTYPE_MPEG1AudioPayload = GUID(0x50, 0x0, 0x10, [0x80, 0x0, 0x0, 0xaa, 0x0, 0x38, 0x9b, 0x71]);
enum MEDIATYPE_MPEG1SystemStream = GUID(0xe436eb82, 0x524f, 0x11ce, [0x9f, 0x53, 0x0, 0x20, 0xaf, 0xb, 0xa7, 0x70]);
enum MEDIASUBTYPE_MPEG1System = GUID(0xe436eb84, 0x524f, 0x11ce, [0x9f, 0x53, 0x0, 0x20, 0xaf, 0xb, 0xa7, 0x70]);
enum MEDIASUBTYPE_MPEG1VideoCD = GUID(0xe436eb85, 0x524f, 0x11ce, [0x9f, 0x53, 0x0, 0x20, 0xaf, 0xb, 0xa7, 0x70]);
enum MEDIASUBTYPE_MPEG1Video = GUID(0xe436eb86, 0x524f, 0x11ce, [0x9f, 0x53, 0x0, 0x20, 0xaf, 0xb, 0xa7, 0x70]);
enum MEDIASUBTYPE_MPEG1Audio = GUID(0xe436eb87, 0x524f, 0x11ce, [0x9f, 0x53, 0x0, 0x20, 0xaf, 0xb, 0xa7, 0x70]);
enum MEDIASUBTYPE_Avi = GUID(0xe436eb88, 0x524f, 0x11ce, [0x9f, 0x53, 0x0, 0x20, 0xaf, 0xb, 0xa7, 0x70]);
enum MEDIASUBTYPE_Asf = GUID(0x3db80f90, 0x9412, 0x11d1, [0xad, 0xed, 0x0, 0x0, 0xf8, 0x75, 0x4b, 0x99]);
enum MEDIASUBTYPE_QTMovie = GUID(0xe436eb89, 0x524f, 0x11ce, [0x9f, 0x53, 0x0, 0x20, 0xaf, 0xb, 0xa7, 0x70]);
enum MEDIASUBTYPE_QTRpza = GUID(0x617a7072, 0x0, 0x10, [0x80, 0x0, 0x0, 0xaa, 0x0, 0x38, 0x9b, 0x71]);
enum MEDIASUBTYPE_QTSmc = GUID(0x20636d73, 0x0, 0x10, [0x80, 0x0, 0x0, 0xaa, 0x0, 0x38, 0x9b, 0x71]);
enum MEDIASUBTYPE_QTRle = GUID(0x20656c72, 0x0, 0x10, [0x80, 0x0, 0x0, 0xaa, 0x0, 0x38, 0x9b, 0x71]);
enum MEDIASUBTYPE_QTJpeg = GUID(0x6765706a, 0x0, 0x10, [0x80, 0x0, 0x0, 0xaa, 0x0, 0x38, 0x9b, 0x71]);
enum MEDIASUBTYPE_PCMAudio_Obsolete = GUID(0xe436eb8a, 0x524f, 0x11ce, [0x9f, 0x53, 0x0, 0x20, 0xaf, 0xb, 0xa7, 0x70]);
enum MEDIASUBTYPE_PCM = GUID(0x1, 0x0, 0x10, [0x80, 0x0, 0x0, 0xaa, 0x0, 0x38, 0x9b, 0x71]);
enum MEDIASUBTYPE_WAVE = GUID(0xe436eb8b, 0x524f, 0x11ce, [0x9f, 0x53, 0x0, 0x20, 0xaf, 0xb, 0xa7, 0x70]);
enum MEDIASUBTYPE_AU = GUID(0xe436eb8c, 0x524f, 0x11ce, [0x9f, 0x53, 0x0, 0x20, 0xaf, 0xb, 0xa7, 0x70]);
enum MEDIASUBTYPE_AIFF = GUID(0xe436eb8d, 0x524f, 0x11ce, [0x9f, 0x53, 0x0, 0x20, 0xaf, 0xb, 0xa7, 0x70]);
enum MEDIASUBTYPE_dvsd = GUID(0x64737664, 0x0, 0x10, [0x80, 0x0, 0x0, 0xaa, 0x0, 0x38, 0x9b, 0x71]);
enum MEDIASUBTYPE_dvhd = GUID(0x64687664, 0x0, 0x10, [0x80, 0x0, 0x0, 0xaa, 0x0, 0x38, 0x9b, 0x71]);
enum MEDIASUBTYPE_dvsl = GUID(0x6c737664, 0x0, 0x10, [0x80, 0x0, 0x0, 0xaa, 0x0, 0x38, 0x9b, 0x71]);
enum MEDIASUBTYPE_dv25 = GUID(0x35327664, 0x0, 0x10, [0x80, 0x0, 0x0, 0xaa, 0x0, 0x38, 0x9b, 0x71]);
enum MEDIASUBTYPE_dv50 = GUID(0x30357664, 0x0, 0x10, [0x80, 0x0, 0x0, 0xaa, 0x0, 0x38, 0x9b, 0x71]);
enum MEDIASUBTYPE_dvh1 = GUID(0x31687664, 0x0, 0x10, [0x80, 0x0, 0x0, 0xaa, 0x0, 0x38, 0x9b, 0x71]);
enum MEDIASUBTYPE_Line21_BytePair = GUID(0x6e8d4a22, 0x310c, 0x11d0, [0xb7, 0x9a, 0x0, 0xaa, 0x0, 0x37, 0x67, 0xa7]);
enum MEDIASUBTYPE_Line21_GOPPacket = GUID(0x6e8d4a23, 0x310c, 0x11d0, [0xb7, 0x9a, 0x0, 0xaa, 0x0, 0x37, 0x67, 0xa7]);
enum MEDIASUBTYPE_Line21_VBIRawData = GUID(0x6e8d4a24, 0x310c, 0x11d0, [0xb7, 0x9a, 0x0, 0xaa, 0x0, 0x37, 0x67, 0xa7]);
enum MEDIASUBTYPE_708_608Data = GUID(0xaf414bc, 0x4ed2, 0x445e, [0x98, 0x39, 0x8f, 0x9, 0x55, 0x68, 0xab, 0x3c]);
enum MEDIASUBTYPE_DtvCcData = GUID(0xf52addaa, 0x36f0, 0x43f5, [0x95, 0xea, 0x6d, 0x86, 0x64, 0x84, 0x26, 0x2a]);
enum MEDIASUBTYPE_CC_CONTAINER = GUID(0x7ea626db, 0x54da, 0x437b, [0xbe, 0x9f, 0xf7, 0x30, 0x73, 0xad, 0xfa, 0x3c]);
enum MEDIASUBTYPE_TELETEXT = GUID(0xf72a76e3, 0xeb0a, 0x11d0, [0xac, 0xe4, 0x0, 0x0, 0xc0, 0xcc, 0x16, 0xba]);
enum MEDIASUBTYPE_VBI = GUID(0x663da43c, 0x3e8, 0x4e9a, [0x9c, 0xd5, 0xbf, 0x11, 0xed, 0xd, 0xef, 0x76]);
enum MEDIASUBTYPE_WSS = GUID(0x2791d576, 0x8e7a, 0x466f, [0x9e, 0x90, 0x5d, 0x3f, 0x30, 0x83, 0x73, 0x8b]);
enum MEDIASUBTYPE_XDS = GUID(0x1ca73e3, 0xdce6, 0x4575, [0xaf, 0xe1, 0x2b, 0xf1, 0xc9, 0x2, 0xca, 0xf3]);
enum MEDIASUBTYPE_VPS = GUID(0xa1b3f620, 0x9792, 0x4d8d, [0x81, 0xa4, 0x86, 0xaf, 0x25, 0x77, 0x20, 0x90]);
enum MEDIASUBTYPE_DRM_Audio = GUID(0x9, 0x0, 0x10, [0x80, 0x0, 0x0, 0xaa, 0x0, 0x38, 0x9b, 0x71]);
enum MEDIASUBTYPE_IEEE_FLOAT = GUID(0x3, 0x0, 0x10, [0x80, 0x0, 0x0, 0xaa, 0x0, 0x38, 0x9b, 0x71]);
enum MEDIASUBTYPE_DOLBY_AC3_SPDIF = GUID(0x92, 0x0, 0x10, [0x80, 0x0, 0x0, 0xaa, 0x0, 0x38, 0x9b, 0x71]);
enum MEDIASUBTYPE_RAW_SPORT = GUID(0x240, 0x0, 0x10, [0x80, 0x0, 0x0, 0xaa, 0x0, 0x38, 0x9b, 0x71]);
enum MEDIASUBTYPE_SPDIF_TAG_241h = GUID(0x241, 0x0, 0x10, [0x80, 0x0, 0x0, 0xaa, 0x0, 0x38, 0x9b, 0x71]);
enum MEDIASUBTYPE_DssVideo = GUID(0xa0af4f81, 0xe163, 0x11d0, [0xba, 0xd9, 0x0, 0x60, 0x97, 0x44, 0x11, 0x1a]);
enum MEDIASUBTYPE_DssAudio = GUID(0xa0af4f82, 0xe163, 0x11d0, [0xba, 0xd9, 0x0, 0x60, 0x97, 0x44, 0x11, 0x1a]);
enum MEDIASUBTYPE_VPVideo = GUID(0x5a9b6a40, 0x1a22, 0x11d1, [0xba, 0xd9, 0x0, 0x60, 0x97, 0x44, 0x11, 0x1a]);
enum MEDIASUBTYPE_VPVBI = GUID(0x5a9b6a41, 0x1a22, 0x11d1, [0xba, 0xd9, 0x0, 0x60, 0x97, 0x44, 0x11, 0x1a]);
enum CLSID_CaptureGraphBuilder = GUID(0xbf87b6e0, 0x8c27, 0x11d0, [0xb3, 0xf0, 0x0, 0xaa, 0x0, 0x37, 0x61, 0xc5]);
enum CLSID_CaptureGraphBuilder2 = GUID(0xbf87b6e1, 0x8c27, 0x11d0, [0xb3, 0xf0, 0x0, 0xaa, 0x0, 0x37, 0x61, 0xc5]);
enum CLSID_ProtoFilterGraph = GUID(0xe436ebb0, 0x524f, 0x11ce, [0x9f, 0x53, 0x0, 0x20, 0xaf, 0xb, 0xa7, 0x70]);
enum CLSID_SystemClock = GUID(0xe436ebb1, 0x524f, 0x11ce, [0x9f, 0x53, 0x0, 0x20, 0xaf, 0xb, 0xa7, 0x70]);
enum CLSID_FilterMapper = GUID(0xe436ebb2, 0x524f, 0x11ce, [0x9f, 0x53, 0x0, 0x20, 0xaf, 0xb, 0xa7, 0x70]);
enum CLSID_FilterGraph = GUID(0xe436ebb3, 0x524f, 0x11ce, [0x9f, 0x53, 0x0, 0x20, 0xaf, 0xb, 0xa7, 0x70]);
enum CLSID_FilterGraphNoThread = GUID(0xe436ebb8, 0x524f, 0x11ce, [0x9f, 0x53, 0x0, 0x20, 0xaf, 0xb, 0xa7, 0x70]);
enum CLSID_FilterGraphPrivateThread = GUID(0xa3ecbc41, 0x581a, 0x4476, [0xb6, 0x93, 0xa6, 0x33, 0x40, 0x46, 0x2d, 0x8b]);
enum CLSID_MPEG1Doc = GUID(0xe4bbd160, 0x4269, 0x11ce, [0x83, 0x8d, 0x0, 0xaa, 0x0, 0x55, 0x59, 0x5a]);
enum CLSID_FileSource = GUID(0x701722e0, 0x8ae3, 0x11ce, [0xa8, 0x5c, 0x0, 0xaa, 0x0, 0x2f, 0xea, 0xb5]);
enum CLSID_MPEG1PacketPlayer = GUID(0x26c25940, 0x4ca9, 0x11ce, [0xa8, 0x28, 0x0, 0xaa, 0x0, 0x2f, 0xea, 0xb5]);
enum CLSID_MPEG1Splitter = GUID(0x336475d0, 0x942a, 0x11ce, [0xa8, 0x70, 0x0, 0xaa, 0x0, 0x2f, 0xea, 0xb5]);
enum CLSID_CMpegVideoCodec = GUID(0xfeb50740, 0x7bef, 0x11ce, [0x9b, 0xd9, 0x0, 0x0, 0xe2, 0x2, 0x59, 0x9c]);
enum CLSID_CMpegAudioCodec = GUID(0x4a2286e0, 0x7bef, 0x11ce, [0x9b, 0xd9, 0x0, 0x0, 0xe2, 0x2, 0x59, 0x9c]);
enum CLSID_TextRender = GUID(0xe30629d3, 0x27e5, 0x11ce, [0x87, 0x5d, 0x0, 0x60, 0x8c, 0xb7, 0x80, 0x66]);
enum CLSID_InfTee = GUID(0xf8388a40, 0xd5bb, 0x11d0, [0xbe, 0x5a, 0x0, 0x80, 0xc7, 0x6, 0x56, 0x8e]);
enum CLSID_AviSplitter = GUID(0x1b544c20, 0xfd0b, 0x11ce, [0x8c, 0x63, 0x0, 0xaa, 0x0, 0x44, 0xb5, 0x1e]);
enum CLSID_AviReader = GUID(0x1b544c21, 0xfd0b, 0x11ce, [0x8c, 0x63, 0x0, 0xaa, 0x0, 0x44, 0xb5, 0x1e]);
enum CLSID_VfwCapture = GUID(0x1b544c22, 0xfd0b, 0x11ce, [0x8c, 0x63, 0x0, 0xaa, 0x0, 0x44, 0xb5, 0x1e]);
enum CLSID_CaptureProperties = GUID(0x1b544c22, 0xfd0b, 0x11ce, [0x8c, 0x63, 0x0, 0xaa, 0x0, 0x44, 0xb5, 0x1f]);
enum CLSID_FGControl = GUID(0xe436ebb4, 0x524f, 0x11ce, [0x9f, 0x53, 0x0, 0x20, 0xaf, 0xb, 0xa7, 0x70]);
enum CLSID_MOVReader = GUID(0x44584800, 0xf8ee, 0x11ce, [0xb2, 0xd4, 0x0, 0xdd, 0x1, 0x10, 0x1b, 0x85]);
enum CLSID_QuickTimeParser = GUID(0xd51bd5a0, 0x7548, 0x11cf, [0xa5, 0x20, 0x0, 0x80, 0xc7, 0x7e, 0xf5, 0x8a]);
enum CLSID_QTDec = GUID(0xfdfe9681, 0x74a3, 0x11d0, [0xaf, 0xa7, 0x0, 0xaa, 0x0, 0xb6, 0x7a, 0x42]);
enum CLSID_AVIDoc = GUID(0xd3588ab0, 0x781, 0x11ce, [0xb0, 0x3a, 0x0, 0x20, 0xaf, 0xb, 0xa7, 0x70]);
enum CLSID_VideoRenderer = GUID(0x70e102b0, 0x5556, 0x11ce, [0x97, 0xc0, 0x0, 0xaa, 0x0, 0x55, 0x59, 0x5a]);
enum CLSID_Colour = GUID(0x1643e180, 0x90f5, 0x11ce, [0x97, 0xd5, 0x0, 0xaa, 0x0, 0x55, 0x59, 0x5a]);
enum CLSID_Dither = GUID(0x1da08500, 0x9edc, 0x11cf, [0xbc, 0x10, 0x0, 0xaa, 0x0, 0xac, 0x74, 0xf6]);
enum CLSID_ModexRenderer = GUID(0x7167665, 0x5011, 0x11cf, [0xbf, 0x33, 0x0, 0xaa, 0x0, 0x55, 0x59, 0x5a]);
enum CLSID_AudioRender = GUID(0xe30629d1, 0x27e5, 0x11ce, [0x87, 0x5d, 0x0, 0x60, 0x8c, 0xb7, 0x80, 0x66]);
enum CLSID_AudioProperties = GUID(0x5589faf, 0xc356, 0x11ce, [0xbf, 0x1, 0x0, 0xaa, 0x0, 0x55, 0x59, 0x5a]);
enum CLSID_DSoundRender = GUID(0x79376820, 0x7d0, 0x11cf, [0xa2, 0x4d, 0x0, 0x20, 0xaf, 0xd7, 0x97, 0x67]);
enum CLSID_AudioRecord = GUID(0xe30629d2, 0x27e5, 0x11ce, [0x87, 0x5d, 0x0, 0x60, 0x8c, 0xb7, 0x80, 0x66]);
enum CLSID_AudioInputMixerProperties = GUID(0x2ca8ca52, 0x3c3f, 0x11d2, [0xb7, 0x3d, 0x0, 0xc0, 0x4f, 0xb6, 0xbd, 0x3d]);
enum CLSID_AVIDec = GUID(0xcf49d4e0, 0x1115, 0x11ce, [0xb0, 0x3a, 0x0, 0x20, 0xaf, 0xb, 0xa7, 0x70]);
enum CLSID_AVIDraw = GUID(0xa888df60, 0x1e90, 0x11cf, [0xac, 0x98, 0x0, 0xaa, 0x0, 0x4c, 0xf, 0xa9]);
enum CLSID_ACMWrapper = GUID(0x6a08cf80, 0xe18, 0x11cf, [0xa2, 0x4d, 0x0, 0x20, 0xaf, 0xd7, 0x97, 0x67]);
enum CLSID_AsyncReader = GUID(0xe436ebb5, 0x524f, 0x11ce, [0x9f, 0x53, 0x0, 0x20, 0xaf, 0xb, 0xa7, 0x70]);
enum CLSID_URLReader = GUID(0xe436ebb6, 0x524f, 0x11ce, [0x9f, 0x53, 0x0, 0x20, 0xaf, 0xb, 0xa7, 0x70]);
enum CLSID_PersistMonikerPID = GUID(0xe436ebb7, 0x524f, 0x11ce, [0x9f, 0x53, 0x0, 0x20, 0xaf, 0xb, 0xa7, 0x70]);
enum CLSID_AVICo = GUID(0xd76e2820, 0x1563, 0x11cf, [0xac, 0x98, 0x0, 0xaa, 0x0, 0x4c, 0xf, 0xa9]);
enum CLSID_FileWriter = GUID(0x8596e5f0, 0xda5, 0x11d0, [0xbd, 0x21, 0x0, 0xa0, 0xc9, 0x11, 0xce, 0x86]);
enum CLSID_AviDest = GUID(0xe2510970, 0xf137, 0x11ce, [0x8b, 0x67, 0x0, 0xaa, 0x0, 0xa3, 0xf1, 0xa6]);
enum CLSID_AviMuxProptyPage = GUID(0xc647b5c0, 0x157c, 0x11d0, [0xbd, 0x23, 0x0, 0xa0, 0xc9, 0x11, 0xce, 0x86]);
enum CLSID_AviMuxProptyPage1 = GUID(0xa9ae910, 0x85c0, 0x11d0, [0xbd, 0x42, 0x0, 0xa0, 0xc9, 0x11, 0xce, 0x86]);
enum CLSID_AVIMIDIRender = GUID(0x7b65360, 0xc445, 0x11ce, [0xaf, 0xde, 0x0, 0xaa, 0x0, 0x6c, 0x14, 0xf4]);
enum CLSID_WMAsfReader = GUID(0x187463a0, 0x5bb7, 0x11d3, [0xac, 0xbe, 0x0, 0x80, 0xc7, 0x5e, 0x24, 0x6e]);
enum CLSID_WMAsfWriter = GUID(0x7c23220e, 0x55bb, 0x11d3, [0x8b, 0x16, 0x0, 0xc0, 0x4f, 0xb6, 0xbd, 0x3d]);
enum CLSID_MPEG2Demultiplexer = GUID(0xafb6c280, 0x2c41, 0x11d3, [0x8a, 0x60, 0x0, 0x0, 0xf8, 0x1e, 0xe, 0x4a]);
enum CLSID_MPEG2Demultiplexer_NoClock = GUID(0x687d3367, 0x3644, 0x467a, [0xad, 0xfe, 0x6c, 0xd7, 0xa8, 0x5c, 0x4a, 0x2c]);
enum CLSID_MMSPLITTER = GUID(0x3ae86b20, 0x7be8, 0x11d1, [0xab, 0xe6, 0x0, 0xa0, 0xc9, 0x5, 0xf3, 0x75]);
enum CLSID_StreamBufferSink = GUID(0x2db47ae5, 0xcf39, 0x43c2, [0xb4, 0xd6, 0xc, 0xd8, 0xd9, 0x9, 0x46, 0xf4]);
enum CLSID_SBE2Sink = GUID(0xe2448508, 0x95da, 0x4205, [0x9a, 0x27, 0x7e, 0xc8, 0x1e, 0x72, 0x3b, 0x1a]);
enum CLSID_StreamBufferSource = GUID(0xc9f5fe02, 0xf851, 0x4eb5, [0x99, 0xee, 0xad, 0x60, 0x2a, 0xf1, 0xe6, 0x19]);
enum CLSID_StreamBufferConfig = GUID(0xfa8a68b2, 0xc864, 0x4ba2, [0xad, 0x53, 0xd3, 0x87, 0x6a, 0x87, 0x49, 0x4b]);
enum CLSID_StreamBufferPropertyHandler = GUID(0xe37a73f8, 0xfb01, 0x43dc, [0x91, 0x4e, 0xaa, 0xee, 0x76, 0x9, 0x5a, 0xb9]);
enum CLSID_StreamBufferThumbnailHandler = GUID(0x713790ee, 0x5ee1, 0x45ba, [0x80, 0x70, 0xa1, 0x33, 0x7d, 0x27, 0x62, 0xfa]);
enum CLSID_Mpeg2VideoStreamAnalyzer = GUID(0x6cfad761, 0x735d, 0x4aa5, [0x8a, 0xfc, 0xaf, 0x91, 0xa7, 0xd6, 0x1e, 0xba]);
enum CLSID_StreamBufferRecordingAttributes = GUID(0xccaa63ac, 0x1057, 0x4778, [0xae, 0x92, 0x12, 0x6, 0xab, 0x9a, 0xce, 0xe6]);
enum CLSID_StreamBufferComposeRecording = GUID(0xd682c4ba, 0xa90a, 0x42fe, [0xb9, 0xe1, 0x3, 0x10, 0x98, 0x49, 0xc4, 0x23]);
enum CLSID_SBE2File = GUID(0x93a094d7, 0x51e8, 0x485b, [0x90, 0x4a, 0x8d, 0x6b, 0x97, 0xdc, 0x6b, 0x39]);
enum CLSID_DVVideoCodec = GUID(0xb1b77c00, 0xc3e4, 0x11cf, [0xaf, 0x79, 0x0, 0xaa, 0x0, 0xb6, 0x7a, 0x42]);
enum CLSID_DVVideoEnc = GUID(0x13aa3650, 0xbb6f, 0x11d0, [0xaf, 0xb9, 0x0, 0xaa, 0x0, 0xb6, 0x7a, 0x42]);
enum CLSID_DVSplitter = GUID(0x4eb31670, 0x9fc6, 0x11cf, [0xaf, 0x6e, 0x0, 0xaa, 0x0, 0xb6, 0x7a, 0x42]);
enum CLSID_DVMux = GUID(0x129d7e40, 0xc10d, 0x11d0, [0xaf, 0xb9, 0x0, 0xaa, 0x0, 0xb6, 0x7a, 0x42]);
enum CLSID_SeekingPassThru = GUID(0x60af76c, 0x68dd, 0x11d0, [0x8f, 0xc1, 0x0, 0xc0, 0x4f, 0xd9, 0x18, 0x9d]);
enum CLSID_Line21Decoder = GUID(0x6e8d4a20, 0x310c, 0x11d0, [0xb7, 0x9a, 0x0, 0xaa, 0x0, 0x37, 0x67, 0xa7]);
enum CLSID_Line21Decoder2 = GUID(0xe4206432, 0x1a1, 0x4bee, [0xb3, 0xe1, 0x37, 0x2, 0xc8, 0xed, 0xc5, 0x74]);
enum CLSID_CCAFilter = GUID(0x3d07a539, 0x35ca, 0x447c, [0x9b, 0x5, 0x8d, 0x85, 0xce, 0x92, 0x4f, 0x9e]);
enum CLSID_OverlayMixer = GUID(0xcd8743a1, 0x3736, 0x11d0, [0x9e, 0x69, 0x0, 0xc0, 0x4f, 0xd7, 0xc1, 0x5b]);
enum CLSID_VBISurfaces = GUID(0x814b9800, 0x1c88, 0x11d1, [0xba, 0xd9, 0x0, 0x60, 0x97, 0x44, 0x11, 0x1a]);
enum CLSID_WSTDecoder = GUID(0x70bc06e0, 0x5666, 0x11d3, [0xa1, 0x84, 0x0, 0x10, 0x5a, 0xef, 0x9f, 0x33]);
enum CLSID_MjpegDec = GUID(0x301056d0, 0x6dff, 0x11d2, [0x9e, 0xeb, 0x0, 0x60, 0x8, 0x3, 0x9e, 0x37]);
enum CLSID_MJPGEnc = GUID(0xb80ab0a0, 0x7416, 0x11d2, [0x9e, 0xeb, 0x0, 0x60, 0x8, 0x3, 0x9e, 0x37]);
enum CLSID_SystemDeviceEnum = GUID(0x62be5d10, 0x60eb, 0x11d0, [0xbd, 0x3b, 0x0, 0xa0, 0xc9, 0x11, 0xce, 0x86]);
enum CLSID_CDeviceMoniker = GUID(0x4315d437, 0x5b8c, 0x11d0, [0xbd, 0x3b, 0x0, 0xa0, 0xc9, 0x11, 0xce, 0x86]);
enum CLSID_VideoInputDeviceCategory = GUID(0x860bb310, 0x5d01, 0x11d0, [0xbd, 0x3b, 0x0, 0xa0, 0xc9, 0x11, 0xce, 0x86]);
enum CLSID_CVidCapClassManager = GUID(0x860bb310, 0x5d01, 0x11d0, [0xbd, 0x3b, 0x0, 0xa0, 0xc9, 0x11, 0xce, 0x86]);
enum CLSID_LegacyAmFilterCategory = GUID(0x83863f1, 0x70de, 0x11d0, [0xbd, 0x40, 0x0, 0xa0, 0xc9, 0x11, 0xce, 0x86]);
enum CLSID_CQzFilterClassManager = GUID(0x83863f1, 0x70de, 0x11d0, [0xbd, 0x40, 0x0, 0xa0, 0xc9, 0x11, 0xce, 0x86]);
enum CLSID_VideoCompressorCategory = GUID(0x33d9a760, 0x90c8, 0x11d0, [0xbd, 0x43, 0x0, 0xa0, 0xc9, 0x11, 0xce, 0x86]);
enum CLSID_CIcmCoClassManager = GUID(0x33d9a760, 0x90c8, 0x11d0, [0xbd, 0x43, 0x0, 0xa0, 0xc9, 0x11, 0xce, 0x86]);
enum CLSID_AudioCompressorCategory = GUID(0x33d9a761, 0x90c8, 0x11d0, [0xbd, 0x43, 0x0, 0xa0, 0xc9, 0x11, 0xce, 0x86]);
enum CLSID_CAcmCoClassManager = GUID(0x33d9a761, 0x90c8, 0x11d0, [0xbd, 0x43, 0x0, 0xa0, 0xc9, 0x11, 0xce, 0x86]);
enum CLSID_AudioInputDeviceCategory = GUID(0x33d9a762, 0x90c8, 0x11d0, [0xbd, 0x43, 0x0, 0xa0, 0xc9, 0x11, 0xce, 0x86]);
enum CLSID_CWaveinClassManager = GUID(0x33d9a762, 0x90c8, 0x11d0, [0xbd, 0x43, 0x0, 0xa0, 0xc9, 0x11, 0xce, 0x86]);
enum CLSID_AudioRendererCategory = GUID(0xe0f158e1, 0xcb04, 0x11d0, [0xbd, 0x4e, 0x0, 0xa0, 0xc9, 0x11, 0xce, 0x86]);
enum CLSID_CWaveOutClassManager = GUID(0xe0f158e1, 0xcb04, 0x11d0, [0xbd, 0x4e, 0x0, 0xa0, 0xc9, 0x11, 0xce, 0x86]);
enum CLSID_MidiRendererCategory = GUID(0x4efe2452, 0x168a, 0x11d1, [0xbc, 0x76, 0x0, 0xc0, 0x4f, 0xb9, 0x45, 0x3b]);
enum CLSID_CMidiOutClassManager = GUID(0x4efe2452, 0x168a, 0x11d1, [0xbc, 0x76, 0x0, 0xc0, 0x4f, 0xb9, 0x45, 0x3b]);
enum CLSID_TransmitCategory = GUID(0xcc7bfb41, 0xf175, 0x11d1, [0xa3, 0x92, 0x0, 0xe0, 0x29, 0x1f, 0x39, 0x59]);
enum CLSID_DeviceControlCategory = GUID(0xcc7bfb46, 0xf175, 0x11d1, [0xa3, 0x92, 0x0, 0xe0, 0x29, 0x1f, 0x39, 0x59]);
enum CLSID_ActiveMovieCategories = GUID(0xda4e3da0, 0xd07d, 0x11d0, [0xbd, 0x50, 0x0, 0xa0, 0xc9, 0x11, 0xce, 0x86]);
enum CLSID_DVDHWDecodersCategory = GUID(0x2721ae20, 0x7e70, 0x11d0, [0xa5, 0xd6, 0x28, 0xdb, 0x4, 0xc1, 0x0, 0x0]);
enum CLSID_MediaEncoderCategory = GUID(0x7d22e920, 0x5ca9, 0x4787, [0x8c, 0x2b, 0xa6, 0x77, 0x9b, 0xd1, 0x17, 0x81]);
enum CLSID_MediaMultiplexerCategory = GUID(0x236c9559, 0xadce, 0x4736, [0xbf, 0x72, 0xba, 0xb3, 0x4e, 0x39, 0x21, 0x96]);
enum CLSID_FilterMapper2 = GUID(0xcda42200, 0xbd88, 0x11d0, [0xbd, 0x4e, 0x0, 0xa0, 0xc9, 0x11, 0xce, 0x86]);
enum CLSID_MemoryAllocator = GUID(0x1e651cc0, 0xb199, 0x11d0, [0x82, 0x12, 0x0, 0xc0, 0x4f, 0xc3, 0x2c, 0x45]);
enum CLSID_MediaPropertyBag = GUID(0xcdbd8d00, 0xc193, 0x11d0, [0xbd, 0x4e, 0x0, 0xa0, 0xc9, 0x11, 0xce, 0x86]);
enum CLSID_DvdGraphBuilder = GUID(0xfcc152b7, 0xf372, 0x11d0, [0x8e, 0x0, 0x0, 0xc0, 0x4f, 0xd7, 0xc0, 0x8b]);
enum CLSID_DVDNavigator = GUID(0x9b8c4620, 0x2c1a, 0x11d0, [0x84, 0x93, 0x0, 0xa0, 0x24, 0x38, 0xad, 0x48]);
enum CLSID_DVDState = GUID(0xf963c5cf, 0xa659, 0x4a93, [0x96, 0x38, 0xca, 0xf3, 0xcd, 0x27, 0x7d, 0x13]);
enum CLSID_SmartTee = GUID(0xcc58e280, 0x8aa1, 0x11d1, [0xb3, 0xf1, 0x0, 0xaa, 0x0, 0x37, 0x61, 0xc5]);
enum CLSID_DtvCcFilter = GUID(0xfb056ba0, 0x2502, 0x45b9, [0x8e, 0x86, 0x2b, 0x40, 0xde, 0x84, 0xad, 0x29]);
enum CLSID_CaptionsFilter = GUID(0x2f7ee4b6, 0x6ff5, 0x4eb4, [0xb2, 0x4a, 0x2b, 0xfc, 0x41, 0x11, 0x71, 0x71]);
enum CLSID_SubtitlesFilter = GUID(0x9f22cfea, 0xce07, 0x41ab, [0x8b, 0xa0, 0xc7, 0x36, 0x4a, 0xf9, 0xa, 0xf9]);
enum CLSID_DirectShowPluginControl = GUID(0x8670c736, 0xf614, 0x427b, [0x8a, 0xda, 0xbb, 0xad, 0xc5, 0x87, 0x19, 0x4b]);
enum FORMAT_None = GUID(0xf6417d6, 0xc318, 0x11d0, [0xa4, 0x3f, 0x0, 0xa0, 0xc9, 0x22, 0x31, 0x96]);
enum FORMAT_VideoInfo = GUID(0x5589f80, 0xc356, 0x11ce, [0xbf, 0x1, 0x0, 0xaa, 0x0, 0x55, 0x59, 0x5a]);
enum FORMAT_VideoInfo2 = GUID(0xf72a76a0, 0xeb0a, 0x11d0, [0xac, 0xe4, 0x0, 0x0, 0xc0, 0xcc, 0x16, 0xba]);
enum FORMAT_WaveFormatEx = GUID(0x5589f81, 0xc356, 0x11ce, [0xbf, 0x1, 0x0, 0xaa, 0x0, 0x55, 0x59, 0x5a]);
enum FORMAT_MPEGVideo = GUID(0x5589f82, 0xc356, 0x11ce, [0xbf, 0x1, 0x0, 0xaa, 0x0, 0x55, 0x59, 0x5a]);
enum FORMAT_MPEGStreams = GUID(0x5589f83, 0xc356, 0x11ce, [0xbf, 0x1, 0x0, 0xaa, 0x0, 0x55, 0x59, 0x5a]);
enum FORMAT_DvInfo = GUID(0x5589f84, 0xc356, 0x11ce, [0xbf, 0x1, 0x0, 0xaa, 0x0, 0x55, 0x59, 0x5a]);
enum FORMAT_525WSS = GUID(0xc7ecf04d, 0x4582, 0x4869, [0x9a, 0xbb, 0xbf, 0xb5, 0x23, 0xb6, 0x2e, 0xdf]);
enum CLSID_DirectDrawProperties = GUID(0x944d4c00, 0xdd52, 0x11ce, [0xbf, 0xe, 0x0, 0xaa, 0x0, 0x55, 0x59, 0x5a]);
enum CLSID_PerformanceProperties = GUID(0x59ce6880, 0xacf8, 0x11cf, [0xb5, 0x6e, 0x0, 0x80, 0xc7, 0xc4, 0xb6, 0x8a]);
enum CLSID_QualityProperties = GUID(0x418afb70, 0xf8b8, 0x11ce, [0xaa, 0xc6, 0x0, 0x20, 0xaf, 0xb, 0x99, 0xa3]);
enum CLSID_VPObject = GUID(0xce292861, 0xfc88, 0x11d0, [0x9e, 0x69, 0x0, 0xc0, 0x4f, 0xd7, 0xc1, 0x5b]);
enum CLSID_VPVBIObject = GUID(0x814b9801, 0x1c88, 0x11d1, [0xba, 0xd9, 0x0, 0x60, 0x97, 0x44, 0x11, 0x1a]);
enum CLSID_DVDecPropertiesPage = GUID(0x101193c0, 0xbfe, 0x11d0, [0xaf, 0x91, 0x0, 0xaa, 0x0, 0xb6, 0x7a, 0x42]);
enum CLSID_DVEncPropertiesPage = GUID(0x4150f050, 0xbb6f, 0x11d0, [0xaf, 0xb9, 0x0, 0xaa, 0x0, 0xb6, 0x7a, 0x42]);
enum CLSID_DVMuxPropertyPage = GUID(0x4db880e0, 0xc10d, 0x11d0, [0xaf, 0xb9, 0x0, 0xaa, 0x0, 0xb6, 0x7a, 0x42]);
enum CLSID_WstDecoderPropertyPage = GUID(0x4e27f80, 0x91e4, 0x11d3, [0xa1, 0x84, 0x0, 0x10, 0x5a, 0xef, 0x9f, 0x33]);
enum FORMAT_AnalogVideo = GUID(0x482dde0, 0x7817, 0x11cf, [0x8a, 0x3, 0x0, 0xaa, 0x0, 0x6e, 0xcb, 0x65]);
enum MEDIATYPE_AnalogVideo = GUID(0x482dde1, 0x7817, 0x11cf, [0x8a, 0x3, 0x0, 0xaa, 0x0, 0x6e, 0xcb, 0x65]);
enum MEDIASUBTYPE_AnalogVideo_NTSC_M = GUID(0x482dde2, 0x7817, 0x11cf, [0x8a, 0x3, 0x0, 0xaa, 0x0, 0x6e, 0xcb, 0x65]);
enum MEDIASUBTYPE_AnalogVideo_PAL_B = GUID(0x482dde5, 0x7817, 0x11cf, [0x8a, 0x3, 0x0, 0xaa, 0x0, 0x6e, 0xcb, 0x65]);
enum MEDIASUBTYPE_AnalogVideo_PAL_D = GUID(0x482dde6, 0x7817, 0x11cf, [0x8a, 0x3, 0x0, 0xaa, 0x0, 0x6e, 0xcb, 0x65]);
enum MEDIASUBTYPE_AnalogVideo_PAL_G = GUID(0x482dde7, 0x7817, 0x11cf, [0x8a, 0x3, 0x0, 0xaa, 0x0, 0x6e, 0xcb, 0x65]);
enum MEDIASUBTYPE_AnalogVideo_PAL_H = GUID(0x482dde8, 0x7817, 0x11cf, [0x8a, 0x3, 0x0, 0xaa, 0x0, 0x6e, 0xcb, 0x65]);
enum MEDIASUBTYPE_AnalogVideo_PAL_I = GUID(0x482dde9, 0x7817, 0x11cf, [0x8a, 0x3, 0x0, 0xaa, 0x0, 0x6e, 0xcb, 0x65]);
enum MEDIASUBTYPE_AnalogVideo_PAL_M = GUID(0x482ddea, 0x7817, 0x11cf, [0x8a, 0x3, 0x0, 0xaa, 0x0, 0x6e, 0xcb, 0x65]);
enum MEDIASUBTYPE_AnalogVideo_PAL_N = GUID(0x482ddeb, 0x7817, 0x11cf, [0x8a, 0x3, 0x0, 0xaa, 0x0, 0x6e, 0xcb, 0x65]);
enum MEDIASUBTYPE_AnalogVideo_PAL_N_COMBO = GUID(0x482ddec, 0x7817, 0x11cf, [0x8a, 0x3, 0x0, 0xaa, 0x0, 0x6e, 0xcb, 0x65]);
enum MEDIASUBTYPE_AnalogVideo_SECAM_B = GUID(0x482ddf0, 0x7817, 0x11cf, [0x8a, 0x3, 0x0, 0xaa, 0x0, 0x6e, 0xcb, 0x65]);
enum MEDIASUBTYPE_AnalogVideo_SECAM_D = GUID(0x482ddf1, 0x7817, 0x11cf, [0x8a, 0x3, 0x0, 0xaa, 0x0, 0x6e, 0xcb, 0x65]);
enum MEDIASUBTYPE_AnalogVideo_SECAM_G = GUID(0x482ddf2, 0x7817, 0x11cf, [0x8a, 0x3, 0x0, 0xaa, 0x0, 0x6e, 0xcb, 0x65]);
enum MEDIASUBTYPE_AnalogVideo_SECAM_H = GUID(0x482ddf3, 0x7817, 0x11cf, [0x8a, 0x3, 0x0, 0xaa, 0x0, 0x6e, 0xcb, 0x65]);
enum MEDIASUBTYPE_AnalogVideo_SECAM_K = GUID(0x482ddf4, 0x7817, 0x11cf, [0x8a, 0x3, 0x0, 0xaa, 0x0, 0x6e, 0xcb, 0x65]);
enum MEDIASUBTYPE_AnalogVideo_SECAM_K1 = GUID(0x482ddf5, 0x7817, 0x11cf, [0x8a, 0x3, 0x0, 0xaa, 0x0, 0x6e, 0xcb, 0x65]);
enum MEDIASUBTYPE_AnalogVideo_SECAM_L = GUID(0x482ddf6, 0x7817, 0x11cf, [0x8a, 0x3, 0x0, 0xaa, 0x0, 0x6e, 0xcb, 0x65]);
enum MEDIATYPE_AnalogAudio = GUID(0x482dee1, 0x7817, 0x11cf, [0x8a, 0x3, 0x0, 0xaa, 0x0, 0x6e, 0xcb, 0x65]);
enum FORMAT_CAPTIONED_H264VIDEO = GUID(0xa4efc024, 0x873e, 0x4da3, [0x89, 0x8b, 0x47, 0x4d, 0xdb, 0xd7, 0x9f, 0xd0]);
enum FORMAT_CC_CONTAINER = GUID(0x50997a4a, 0xe508, 0x4054, [0xa2, 0xb2, 0x10, 0xff, 0xa, 0xc1, 0xa6, 0x9a]);
enum CAPTION_FORMAT_ATSC = GUID(0x3ed9cb31, 0xfd10, 0x4ade, [0xbc, 0xcc, 0xfb, 0x91, 0x5, 0xd2, 0xf3, 0xef]);
enum CAPTION_FORMAT_DVB = GUID(0x12230db4, 0xff2a, 0x447e, [0xbb, 0x88, 0x68, 0x41, 0xc4, 0x16, 0xd0, 0x68]);
enum CAPTION_FORMAT_DIRECTV = GUID(0xe9ca1ce7, 0x915e, 0x47be, [0x9b, 0xb9, 0xbf, 0x1d, 0x8a, 0x13, 0xa5, 0xec]);
enum CAPTION_FORMAT_ECHOSTAR = GUID(0xebb1a262, 0x1158, 0x4b99, [0xae, 0x80, 0x92, 0xac, 0x77, 0x69, 0x52, 0xc4]);
enum FORMAT_CAPTIONED_MPEG2VIDEO = GUID(0x7ab2ada2, 0x81b6, 0x4f14, [0xb3, 0xc8, 0xd0, 0xc4, 0x86, 0x39, 0x3b, 0x67]);
enum TIME_FORMAT_NONE = GUID(0x0, 0x0, 0x0, [0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0]);
enum TIME_FORMAT_FRAME = GUID(0x7b785570, 0x8c82, 0x11cf, [0xbc, 0xc, 0x0, 0xaa, 0x0, 0xac, 0x74, 0xf6]);
enum TIME_FORMAT_BYTE = GUID(0x7b785571, 0x8c82, 0x11cf, [0xbc, 0xc, 0x0, 0xaa, 0x0, 0xac, 0x74, 0xf6]);
enum TIME_FORMAT_SAMPLE = GUID(0x7b785572, 0x8c82, 0x11cf, [0xbc, 0xc, 0x0, 0xaa, 0x0, 0xac, 0x74, 0xf6]);
enum TIME_FORMAT_FIELD = GUID(0x7b785573, 0x8c82, 0x11cf, [0xbc, 0xc, 0x0, 0xaa, 0x0, 0xac, 0x74, 0xf6]);
enum TIME_FORMAT_MEDIA_TIME = GUID(0x7b785574, 0x8c82, 0x11cf, [0xbc, 0xc, 0x0, 0xaa, 0x0, 0xac, 0x74, 0xf6]);
enum AMPROPSETID_Pin = GUID(0x9b00f101, 0x1567, 0x11d1, [0xb3, 0xf1, 0x0, 0xaa, 0x0, 0x37, 0x61, 0xc5]);
enum PIN_CATEGORY_CAPTURE = GUID(0xfb6c4281, 0x353, 0x11d1, [0x90, 0x5f, 0x0, 0x0, 0xc0, 0xcc, 0x16, 0xba]);
enum PIN_CATEGORY_PREVIEW = GUID(0xfb6c4282, 0x353, 0x11d1, [0x90, 0x5f, 0x0, 0x0, 0xc0, 0xcc, 0x16, 0xba]);
enum PIN_CATEGORY_ANALOGVIDEOIN = GUID(0xfb6c4283, 0x353, 0x11d1, [0x90, 0x5f, 0x0, 0x0, 0xc0, 0xcc, 0x16, 0xba]);
enum PIN_CATEGORY_VBI = GUID(0xfb6c4284, 0x353, 0x11d1, [0x90, 0x5f, 0x0, 0x0, 0xc0, 0xcc, 0x16, 0xba]);
enum PIN_CATEGORY_VIDEOPORT = GUID(0xfb6c4285, 0x353, 0x11d1, [0x90, 0x5f, 0x0, 0x0, 0xc0, 0xcc, 0x16, 0xba]);
enum PIN_CATEGORY_NABTS = GUID(0xfb6c4286, 0x353, 0x11d1, [0x90, 0x5f, 0x0, 0x0, 0xc0, 0xcc, 0x16, 0xba]);
enum PIN_CATEGORY_EDS = GUID(0xfb6c4287, 0x353, 0x11d1, [0x90, 0x5f, 0x0, 0x0, 0xc0, 0xcc, 0x16, 0xba]);
enum PIN_CATEGORY_TELETEXT = GUID(0xfb6c4288, 0x353, 0x11d1, [0x90, 0x5f, 0x0, 0x0, 0xc0, 0xcc, 0x16, 0xba]);
enum PIN_CATEGORY_CC = GUID(0xfb6c4289, 0x353, 0x11d1, [0x90, 0x5f, 0x0, 0x0, 0xc0, 0xcc, 0x16, 0xba]);
enum PIN_CATEGORY_STILL = GUID(0xfb6c428a, 0x353, 0x11d1, [0x90, 0x5f, 0x0, 0x0, 0xc0, 0xcc, 0x16, 0xba]);
enum PIN_CATEGORY_TIMECODE = GUID(0xfb6c428b, 0x353, 0x11d1, [0x90, 0x5f, 0x0, 0x0, 0xc0, 0xcc, 0x16, 0xba]);
enum PIN_CATEGORY_VIDEOPORT_VBI = GUID(0xfb6c428c, 0x353, 0x11d1, [0x90, 0x5f, 0x0, 0x0, 0xc0, 0xcc, 0x16, 0xba]);
enum LOOK_UPSTREAM_ONLY = GUID(0xac798be0, 0x98e3, 0x11d1, [0xb3, 0xf1, 0x0, 0xaa, 0x0, 0x37, 0x61, 0xc5]);
enum LOOK_DOWNSTREAM_ONLY = GUID(0xac798be1, 0x98e3, 0x11d1, [0xb3, 0xf1, 0x0, 0xaa, 0x0, 0x37, 0x61, 0xc5]);
enum CLSID_TVTunerFilterPropertyPage = GUID(0x266eee41, 0x6c63, 0x11cf, [0x8a, 0x3, 0x0, 0xaa, 0x0, 0x6e, 0xcb, 0x65]);
enum CLSID_CrossbarFilterPropertyPage = GUID(0x71f96461, 0x78f3, 0x11d0, [0xa1, 0x8c, 0x0, 0xa0, 0xc9, 0x11, 0x89, 0x56]);
enum CLSID_TVAudioFilterPropertyPage = GUID(0x71f96463, 0x78f3, 0x11d0, [0xa1, 0x8c, 0x0, 0xa0, 0xc9, 0x11, 0x89, 0x56]);
enum CLSID_VideoProcAmpPropertyPage = GUID(0x71f96464, 0x78f3, 0x11d0, [0xa1, 0x8c, 0x0, 0xa0, 0xc9, 0x11, 0x89, 0x56]);
enum CLSID_CameraControlPropertyPage = GUID(0x71f96465, 0x78f3, 0x11d0, [0xa1, 0x8c, 0x0, 0xa0, 0xc9, 0x11, 0x89, 0x56]);
enum CLSID_AnalogVideoDecoderPropertyPage = GUID(0x71f96466, 0x78f3, 0x11d0, [0xa1, 0x8c, 0x0, 0xa0, 0xc9, 0x11, 0x89, 0x56]);
enum CLSID_VideoStreamConfigPropertyPage = GUID(0x71f96467, 0x78f3, 0x11d0, [0xa1, 0x8c, 0x0, 0xa0, 0xc9, 0x11, 0x89, 0x56]);
enum CLSID_AudioRendererAdvancedProperties = GUID(0x37e92a92, 0xd9aa, 0x11d2, [0xbf, 0x84, 0x8e, 0xf2, 0xb1, 0x55, 0x5a, 0xed]);
enum CLSID_VideoMixingRenderer = GUID(0xb87beb7b, 0x8d29, 0x423f, [0xae, 0x4d, 0x65, 0x82, 0xc1, 0x1, 0x75, 0xac]);
enum CLSID_VideoRendererDefault = GUID(0x6bc1cffa, 0x8fc1, 0x4261, [0xac, 0x22, 0xcf, 0xb4, 0xcc, 0x38, 0xdb, 0x50]);
enum CLSID_AllocPresenter = GUID(0x99d54f63, 0x1a69, 0x41ae, [0xaa, 0x4d, 0xc9, 0x76, 0xeb, 0x3f, 0x7, 0x13]);
enum CLSID_AllocPresenterDDXclMode = GUID(0x4444ac9e, 0x242e, 0x471b, [0xa3, 0xc7, 0x45, 0xdc, 0xd4, 0x63, 0x52, 0xbc]);
enum CLSID_VideoPortManager = GUID(0x6f26a6cd, 0x967b, 0x47fd, [0x87, 0x4a, 0x7a, 0xed, 0x2c, 0x9d, 0x25, 0xa2]);
enum CLSID_VideoMixingRenderer9 = GUID(0x51b4abf3, 0x748f, 0x4e3b, [0xa2, 0x76, 0xc8, 0x28, 0x33, 0xe, 0x92, 0x6a]);
enum CLSID_EnhancedVideoRenderer = GUID(0xfa10746c, 0x9b63, 0x4b6c, [0xbc, 0x49, 0xfc, 0x30, 0xe, 0xa5, 0xf2, 0x56]);
enum CLSID_MFVideoMixer9 = GUID(0xe474e05a, 0xab65, 0x4f6a, [0x82, 0x7c, 0x21, 0x8b, 0x1b, 0xaa, 0xf3, 0x1f]);
enum CLSID_MFVideoPresenter9 = GUID(0x98455561, 0x5136, 0x4d28, [0xab, 0x8, 0x4c, 0xee, 0x40, 0xea, 0x27, 0x81]);
enum CLSID_EVRTearlessWindowPresenter9 = GUID(0xa0a7a57b, 0x59b2, 0x4919, [0xa6, 0x94, 0xad, 0xd0, 0xa5, 0x26, 0xc3, 0x73]);
enum CLSID_EVRPlaybackPipelineOptimizer = GUID(0x62079164, 0x233b, 0x41f8, [0xa8, 0xf, 0xf0, 0x17, 0x5, 0xf5, 0x14, 0xa8]);
enum EVRConfig_ForceBob = GUID(0xe447df01, 0x10ca, 0x4d17, [0xb1, 0x7e, 0x6a, 0x84, 0xf, 0x8a, 0x3a, 0x4c]);
enum EVRConfig_ForceThrottle = GUID(0xe447df03, 0x10ca, 0x4d17, [0xb1, 0x7e, 0x6a, 0x84, 0xf, 0x8a, 0x3a, 0x4c]);
enum EVRConfig_ForceHalfInterlace = GUID(0xe447df05, 0x10ca, 0x4d17, [0xb1, 0x7e, 0x6a, 0x84, 0xf, 0x8a, 0x3a, 0x4c]);
enum EVRConfig_ForceScaling = GUID(0xe447df07, 0x10ca, 0x4d17, [0xb1, 0x7e, 0x6a, 0x84, 0xf, 0x8a, 0x3a, 0x4c]);
enum EVRConfig_ForceBatching = GUID(0xe447df09, 0x10ca, 0x4d17, [0xb1, 0x7e, 0x6a, 0x84, 0xf, 0x8a, 0x3a, 0x4c]);
enum CLSID_NetworkProvider = GUID(0xb2f3a67c, 0x29da, 0x4c78, [0x88, 0x31, 0x9, 0x1e, 0xd5, 0x9, 0xa4, 0x75]);
enum CLSID_ATSCNetworkProvider = GUID(0xdad2fdd, 0x5fd7, 0x11d3, [0x8f, 0x50, 0x0, 0xc0, 0x4f, 0x79, 0x71, 0xe2]);
enum CLSID_ATSCNetworkPropertyPage = GUID(0xe3444d16, 0x5ac4, 0x4386, [0x88, 0xdf, 0x13, 0xfd, 0x23, 0xe, 0x1d, 0xda]);
enum CLSID_DVBSNetworkProvider = GUID(0xfa4b375a, 0x45b4, 0x4d45, [0x84, 0x40, 0x26, 0x39, 0x57, 0xb1, 0x16, 0x23]);
enum CLSID_DVBTNetworkProvider = GUID(0x216c62df, 0x6d7f, 0x4e9a, [0x85, 0x71, 0x5, 0xf1, 0x4e, 0xdb, 0x76, 0x6a]);
enum CLSID_DVBCNetworkProvider = GUID(0xdc0c0fe7, 0x485, 0x4266, [0xb9, 0x3f, 0x68, 0xfb, 0xf8, 0xe, 0xd8, 0x34]);
enum DSATTRIB_UDCRTag = GUID(0xeb7836ca, 0x14ff, 0x4919, [0xbc, 0xe7, 0x3a, 0xf1, 0x23, 0x19, 0xe5, 0xc]);
enum DSATTRIB_PicSampleSeq = GUID(0x2f5bae02, 0x7b8f, 0x4f60, [0x82, 0xd6, 0xe4, 0xea, 0x2f, 0x1f, 0x4c, 0x99]);
enum DSATTRIB_OptionalVideoAttributes = GUID(0x5a5f08ca, 0x55c2, 0x4033, [0x92, 0xab, 0x55, 0xdb, 0x8f, 0x78, 0x12, 0x26]);
enum DSATTRIB_CC_CONTAINER_INFO = GUID(0xe7e050fb, 0xdd5d, 0x40dd, [0x99, 0x15, 0x35, 0xdc, 0xb8, 0x1b, 0xdc, 0x8a]);
enum DSATTRIB_TRANSPORT_PROPERTIES = GUID(0xb622f612, 0x47ad, 0x4671, [0xad, 0x6c, 0x5, 0xa9, 0x8e, 0x65, 0xde, 0x3a]);
enum DSATTRIB_PBDATAG_ATTRIBUTE = GUID(0xe0b56679, 0x12b9, 0x43cc, [0xb7, 0xdf, 0x57, 0x8c, 0xaa, 0x5a, 0x7b, 0x63]);
enum DSATTRIB_CAPTURE_STREAMTIME = GUID(0xc1a5614, 0x30cd, 0x4f40, [0xbc, 0xbf, 0xd0, 0x3e, 0x52, 0x30, 0x62, 0x7]);
enum DSATTRIB_DSHOW_STREAM_DESC = GUID(0x5fb5673b, 0xa2a, 0x4565, [0x82, 0x7b, 0x68, 0x53, 0xfd, 0x75, 0xe6, 0x11]);
enum DSATTRIB_SAMPLE_LIVE_STREAM_TIME = GUID(0x892cd111, 0x72f3, 0x411d, [0x8b, 0x91, 0xa9, 0xe9, 0x12, 0x3a, 0xc2, 0x9a]);
enum UUID_UdriTagTables = GUID(0xe1b98d74, 0x9778, 0x4878, [0xb6, 0x64, 0xeb, 0x20, 0x20, 0x36, 0x4d, 0x88]);
enum UUID_WMDRMTagTables = GUID(0x5dcd1101, 0x9263, 0x45bb, [0xa4, 0xd5, 0xc4, 0x15, 0xab, 0x8c, 0x58, 0x9c]);
enum CLSID_DShowTVEFilter = GUID(0x5500280, 0xfaa5, 0x4df9, [0x82, 0x46, 0xbf, 0xc2, 0x3a, 0xc5, 0xce, 0xa8]);
enum CLSID_TVEFilterTuneProperties = GUID(0x5500281, 0xfaa5, 0x4df9, [0x82, 0x46, 0xbf, 0xc2, 0x3a, 0xc5, 0xce, 0xa8]);
enum CLSID_TVEFilterCCProperties = GUID(0x5500282, 0xfaa5, 0x4df9, [0x82, 0x46, 0xbf, 0xc2, 0x3a, 0xc5, 0xce, 0xa8]);
enum CLSID_TVEFilterStatsProperties = GUID(0x5500283, 0xfaa5, 0x4df9, [0x82, 0x46, 0xbf, 0xc2, 0x3a, 0xc5, 0xce, 0xa8]);
enum CLSID_IVideoEncoderProxy = GUID(0xb43c4eec, 0x8c32, 0x4791, [0x91, 0x2, 0x50, 0x8a, 0xda, 0x5e, 0xe8, 0xe7]);
enum CLSID_ICodecAPIProxy = GUID(0x7ff0997a, 0x1999, 0x4286, [0xa7, 0x3c, 0x62, 0x2b, 0x88, 0x14, 0xe7, 0xeb]);
enum CLSID_IVideoEncoderCodecAPIProxy = GUID(0xb05dabd9, 0x56e5, 0x4fdc, [0xaf, 0xa4, 0x8a, 0x47, 0xe9, 0x1f, 0x1c, 0x9c]);
enum ENCAPIPARAM_BITRATE = GUID(0x49cc4c43, 0xca83, 0x4ad4, [0xa9, 0xaf, 0xf3, 0x69, 0x6a, 0xf6, 0x66, 0xdf]);
enum ENCAPIPARAM_PEAK_BITRATE = GUID(0x703f16a9, 0x3d48, 0x44a1, [0xb0, 0x77, 0x1, 0x8d, 0xff, 0x91, 0x5d, 0x19]);
enum ENCAPIPARAM_BITRATE_MODE = GUID(0xee5fb25c, 0xc713, 0x40d1, [0x9d, 0x58, 0xc0, 0xd7, 0x24, 0x1e, 0x25, 0xf]);
enum ENCAPIPARAM_SAP_MODE = GUID(0xc0171db, 0xfefc, 0x4af7, [0x99, 0x91, 0xa5, 0x65, 0x7c, 0x19, 0x1c, 0xd1]);
enum CODECAPI_CHANGELISTS = GUID(0x62b12acf, 0xf6b0, 0x47d9, [0x94, 0x56, 0x96, 0xf2, 0x2c, 0x4e, 0xb, 0x9d]);
enum CODECAPI_VIDEO_ENCODER = GUID(0x7112e8e1, 0x3d03, 0x47ef, [0x8e, 0x60, 0x3, 0xf1, 0xcf, 0x53, 0x73, 0x1]);
enum CODECAPI_AUDIO_ENCODER = GUID(0xb9d19a3e, 0xf897, 0x429c, [0xbc, 0x46, 0x81, 0x38, 0xb7, 0x27, 0x2b, 0x2d]);
enum CODECAPI_SETALLDEFAULTS = GUID(0x6c5e6a7c, 0xacf8, 0x4f55, [0xa9, 0x99, 0x1a, 0x62, 0x81, 0x9, 0x5, 0x1b]);
enum CODECAPI_ALLSETTINGS = GUID(0x6a577e92, 0x83e1, 0x4113, [0xad, 0xc2, 0x4f, 0xce, 0xc3, 0x2f, 0x83, 0xa1]);
enum CODECAPI_SUPPORTSEVENTS = GUID(0x581af97, 0x7693, 0x4dbd, [0x9d, 0xca, 0x3f, 0x9e, 0xbd, 0x65, 0x85, 0xa1]);
enum CODECAPI_CURRENTCHANGELIST = GUID(0x1cb14e83, 0x7d72, 0x4657, [0x83, 0xfd, 0x47, 0xa2, 0xc5, 0xb9, 0xd1, 0x3d]);
enum CLSID_SBE2MediaTypeProfile = GUID(0x1f26a602, 0x2b5c, 0x4b63, [0xb8, 0xe8, 0x9e, 0xa5, 0xc1, 0xa7, 0xdc, 0x2e]);
enum CLSID_SBE2FileScan = GUID(0x3e458037, 0xca6, 0x41aa, [0xa5, 0x94, 0x2a, 0xa6, 0xc0, 0x2d, 0x70, 0x9b]);
enum CODECAPI_AVDecMmcssClass = GUID(0xe0ad4828, 0xdf66, 0x4893, [0x9f, 0x33, 0x78, 0x8a, 0xa4, 0xec, 0x40, 0x82]);
enum AVENC_H263V_LEVELCOUNT = 0x00000008;
enum AVENC_H264V_LEVELCOUNT = 0x00000010;
enum AVENC_H264V_MAX_MBBITS = 0x00000c80;
enum D3D12_VIDEO_DECODE_PROFILE_MPEG2 = GUID(0xee27417f, 0x5e28, 0x4e65, [0xbe, 0xea, 0x1d, 0x26, 0xb5, 0x8, 0xad, 0xc9]);
enum D3D12_VIDEO_DECODE_PROFILE_MPEG1_AND_MPEG2 = GUID(0x86695f12, 0x340e, 0x4f04, [0x9f, 0xd3, 0x92, 0x53, 0xdd, 0x32, 0x74, 0x60]);
enum D3D12_VIDEO_DECODE_PROFILE_H264 = GUID(0x1b81be68, 0xa0c7, 0x11d3, [0xb9, 0x84, 0x0, 0xc0, 0x4f, 0x2e, 0x73, 0xc5]);
enum D3D12_VIDEO_DECODE_PROFILE_H264_STEREO_PROGRESSIVE = GUID(0xd79be8da, 0xcf1, 0x4c81, [0xb8, 0x2a, 0x69, 0xa4, 0xe2, 0x36, 0xf4, 0x3d]);
enum D3D12_VIDEO_DECODE_PROFILE_H264_STEREO = GUID(0xf9aaccbb, 0xc2b6, 0x4cfc, [0x87, 0x79, 0x57, 0x7, 0xb1, 0x76, 0x5, 0x52]);
enum D3D12_VIDEO_DECODE_PROFILE_H264_MULTIVIEW = GUID(0x705b9d82, 0x76cf, 0x49d6, [0xb7, 0xe6, 0xac, 0x88, 0x72, 0xdb, 0x1, 0x3c]);
enum D3D12_VIDEO_DECODE_PROFILE_VC1 = GUID(0x1b81bea3, 0xa0c7, 0x11d3, [0xb9, 0x84, 0x0, 0xc0, 0x4f, 0x2e, 0x73, 0xc5]);
enum D3D12_VIDEO_DECODE_PROFILE_VC1_D2010 = GUID(0x1b81bea4, 0xa0c7, 0x11d3, [0xb9, 0x84, 0x0, 0xc0, 0x4f, 0x2e, 0x73, 0xc5]);
enum D3D12_VIDEO_DECODE_PROFILE_MPEG4PT2_SIMPLE = GUID(0xefd64d74, 0xc9e8, 0x41d7, [0xa5, 0xe9, 0xe9, 0xb0, 0xe3, 0x9f, 0xa3, 0x19]);
enum D3D12_VIDEO_DECODE_PROFILE_MPEG4PT2_ADVSIMPLE_NOGMC = GUID(0xed418a9f, 0x10d, 0x4eda, [0x9a, 0xe3, 0x9a, 0x65, 0x35, 0x8d, 0x8d, 0x2e]);
enum D3D12_VIDEO_DECODE_PROFILE_HEVC_MAIN = GUID(0x5b11d51b, 0x2f4c, 0x4452, [0xbc, 0xc3, 0x9, 0xf2, 0xa1, 0x16, 0xc, 0xc0]);
enum D3D12_VIDEO_DECODE_PROFILE_HEVC_MAIN10 = GUID(0x107af0e0, 0xef1a, 0x4d19, [0xab, 0xa8, 0x67, 0xa1, 0x63, 0x7, 0x3d, 0x13]);
enum D3D12_VIDEO_DECODE_PROFILE_VP9 = GUID(0x463707f8, 0xa1d0, 0x4585, [0x87, 0x6d, 0x83, 0xaa, 0x6d, 0x60, 0xb8, 0x9e]);
enum D3D12_VIDEO_DECODE_PROFILE_VP9_10BIT_PROFILE2 = GUID(0xa4c749ef, 0x6ecf, 0x48aa, [0x84, 0x48, 0x50, 0xa7, 0xa1, 0x16, 0x5f, 0xf7]);
enum D3D12_VIDEO_DECODE_PROFILE_VP8 = GUID(0x90b899ea, 0x3a62, 0x4705, [0x88, 0xb3, 0x8d, 0xf0, 0x4b, 0x27, 0x44, 0xe7]);
enum D3D12_VIDEO_DECODE_PROFILE_AV1_PROFILE0 = GUID(0xb8be4ccb, 0xcf53, 0x46ba, [0x8d, 0x59, 0xd6, 0xb8, 0xa6, 0xda, 0x5d, 0x2a]);
enum D3D12_VIDEO_DECODE_PROFILE_AV1_PROFILE1 = GUID(0x6936ff0f, 0x45b1, 0x4163, [0x9c, 0xc1, 0x64, 0x6e, 0xf6, 0x94, 0x61, 0x8]);
enum D3D12_VIDEO_DECODE_PROFILE_AV1_PROFILE2 = GUID(0xc5f2aa1, 0xe541, 0x4089, [0xbb, 0x7b, 0x98, 0x11, 0xa, 0x19, 0xd7, 0xc8]);
enum D3D12_VIDEO_DECODE_PROFILE_AV1_12BIT_PROFILE2 = GUID(0x17127009, 0xa00f, 0x4ce1, [0x99, 0x4e, 0xbf, 0x40, 0x81, 0xf6, 0xf3, 0xf0]);
enum D3D12_VIDEO_DECODE_PROFILE_AV1_12BIT_PROFILE2_420 = GUID(0x2d80bed6, 0x9cac, 0x4835, [0x9e, 0x91, 0x32, 0x7b, 0xbc, 0x4f, 0x9e, 0xe8]);
enum DXVA2_ModeMPEG2_MoComp = GUID(0xe6a9f44b, 0x61b0, 0x4563, [0x9e, 0xa4, 0x63, 0xd2, 0xa3, 0xc6, 0xfe, 0x66]);
enum DXVA2_ModeMPEG2_IDCT = GUID(0xbf22ad00, 0x3ea, 0x4690, [0x80, 0x77, 0x47, 0x33, 0x46, 0x20, 0x9b, 0x7e]);
enum DXVA2_ModeMPEG2_VLD = GUID(0xee27417f, 0x5e28, 0x4e65, [0xbe, 0xea, 0x1d, 0x26, 0xb5, 0x8, 0xad, 0xc9]);
enum DXVA2_ModeMPEG1_VLD = GUID(0x6f3ec719, 0x3735, 0x42cc, [0x80, 0x63, 0x65, 0xcc, 0x3c, 0xb3, 0x66, 0x16]);
enum DXVA2_ModeMPEG2and1_VLD = GUID(0x86695f12, 0x340e, 0x4f04, [0x9f, 0xd3, 0x92, 0x53, 0xdd, 0x32, 0x74, 0x60]);
enum DXVA2_ModeH264_A = GUID(0x1b81be64, 0xa0c7, 0x11d3, [0xb9, 0x84, 0x0, 0xc0, 0x4f, 0x2e, 0x73, 0xc5]);
enum DXVA2_ModeH264_B = GUID(0x1b81be65, 0xa0c7, 0x11d3, [0xb9, 0x84, 0x0, 0xc0, 0x4f, 0x2e, 0x73, 0xc5]);
enum DXVA2_ModeH264_C = GUID(0x1b81be66, 0xa0c7, 0x11d3, [0xb9, 0x84, 0x0, 0xc0, 0x4f, 0x2e, 0x73, 0xc5]);
enum DXVA2_ModeH264_D = GUID(0x1b81be67, 0xa0c7, 0x11d3, [0xb9, 0x84, 0x0, 0xc0, 0x4f, 0x2e, 0x73, 0xc5]);
enum DXVA2_ModeH264_E = GUID(0x1b81be68, 0xa0c7, 0x11d3, [0xb9, 0x84, 0x0, 0xc0, 0x4f, 0x2e, 0x73, 0xc5]);
enum DXVA2_ModeH264_F = GUID(0x1b81be69, 0xa0c7, 0x11d3, [0xb9, 0x84, 0x0, 0xc0, 0x4f, 0x2e, 0x73, 0xc5]);
enum DXVA2_ModeH264_VLD_WithFMOASO_NoFGT = GUID(0xd5f04ff9, 0x3418, 0x45d8, [0x95, 0x61, 0x32, 0xa7, 0x6a, 0xae, 0x2d, 0xdd]);
enum DXVA2_ModeH264_VLD_Stereo_Progressive_NoFGT = GUID(0xd79be8da, 0xcf1, 0x4c81, [0xb8, 0x2a, 0x69, 0xa4, 0xe2, 0x36, 0xf4, 0x3d]);
enum DXVA2_ModeH264_VLD_Stereo_NoFGT = GUID(0xf9aaccbb, 0xc2b6, 0x4cfc, [0x87, 0x79, 0x57, 0x7, 0xb1, 0x76, 0x5, 0x52]);
enum DXVA2_ModeH264_VLD_Multiview_NoFGT = GUID(0x705b9d82, 0x76cf, 0x49d6, [0xb7, 0xe6, 0xac, 0x88, 0x72, 0xdb, 0x1, 0x3c]);
enum DXVA2_ModeWMV8_A = GUID(0x1b81be80, 0xa0c7, 0x11d3, [0xb9, 0x84, 0x0, 0xc0, 0x4f, 0x2e, 0x73, 0xc5]);
enum DXVA2_ModeWMV8_B = GUID(0x1b81be81, 0xa0c7, 0x11d3, [0xb9, 0x84, 0x0, 0xc0, 0x4f, 0x2e, 0x73, 0xc5]);
enum DXVA2_ModeWMV9_A = GUID(0x1b81be90, 0xa0c7, 0x11d3, [0xb9, 0x84, 0x0, 0xc0, 0x4f, 0x2e, 0x73, 0xc5]);
enum DXVA2_ModeWMV9_B = GUID(0x1b81be91, 0xa0c7, 0x11d3, [0xb9, 0x84, 0x0, 0xc0, 0x4f, 0x2e, 0x73, 0xc5]);
enum DXVA2_ModeWMV9_C = GUID(0x1b81be94, 0xa0c7, 0x11d3, [0xb9, 0x84, 0x0, 0xc0, 0x4f, 0x2e, 0x73, 0xc5]);
enum DXVA2_ModeVC1_A = GUID(0x1b81bea0, 0xa0c7, 0x11d3, [0xb9, 0x84, 0x0, 0xc0, 0x4f, 0x2e, 0x73, 0xc5]);
enum DXVA2_ModeVC1_B = GUID(0x1b81bea1, 0xa0c7, 0x11d3, [0xb9, 0x84, 0x0, 0xc0, 0x4f, 0x2e, 0x73, 0xc5]);
enum DXVA2_ModeVC1_C = GUID(0x1b81bea2, 0xa0c7, 0x11d3, [0xb9, 0x84, 0x0, 0xc0, 0x4f, 0x2e, 0x73, 0xc5]);
enum DXVA2_ModeVC1_D = GUID(0x1b81bea3, 0xa0c7, 0x11d3, [0xb9, 0x84, 0x0, 0xc0, 0x4f, 0x2e, 0x73, 0xc5]);
enum DXVA2_ModeVC1_D2010 = GUID(0x1b81bea4, 0xa0c7, 0x11d3, [0xb9, 0x84, 0x0, 0xc0, 0x4f, 0x2e, 0x73, 0xc5]);
enum DXVA2_NoEncrypt = GUID(0x1b81bed0, 0xa0c7, 0x11d3, [0xb9, 0x84, 0x0, 0xc0, 0x4f, 0x2e, 0x73, 0xc5]);
enum DXVA2_VideoProcProgressiveDevice = GUID(0x5a54a0c9, 0xc7ec, 0x4bd9, [0x8e, 0xde, 0xf3, 0xc7, 0x5d, 0xc4, 0x39, 0x3b]);
enum DXVA2_VideoProcBobDevice = GUID(0x335aa36e, 0x7884, 0x43a4, [0x9c, 0x91, 0x7f, 0x87, 0xfa, 0xf3, 0xe3, 0x7e]);
enum DXVA2_VideoProcSoftwareDevice = GUID(0x4553d47f, 0xee7e, 0x4e3f, [0x94, 0x75, 0xdb, 0xf1, 0x37, 0x6c, 0x48, 0x10]);
enum DXVA2_ModeMPEG4pt2_VLD_Simple = GUID(0xefd64d74, 0xc9e8, 0x41d7, [0xa5, 0xe9, 0xe9, 0xb0, 0xe3, 0x9f, 0xa3, 0x19]);
enum DXVA2_ModeMPEG4pt2_VLD_AdvSimple_NoGMC = GUID(0xed418a9f, 0x10d, 0x4eda, [0x9a, 0xe3, 0x9a, 0x65, 0x35, 0x8d, 0x8d, 0x2e]);
enum DXVA2_ModeMPEG4pt2_VLD_AdvSimple_GMC = GUID(0xab998b5b, 0x4258, 0x44a9, [0x9f, 0xeb, 0x94, 0xe5, 0x97, 0xa6, 0xba, 0xae]);
enum DXVA2_ModeHEVC_VLD_Main = GUID(0x5b11d51b, 0x2f4c, 0x4452, [0xbc, 0xc3, 0x9, 0xf2, 0xa1, 0x16, 0xc, 0xc0]);
enum DXVA2_ModeHEVC_VLD_Main10 = GUID(0x107af0e0, 0xef1a, 0x4d19, [0xab, 0xa8, 0x67, 0xa1, 0x63, 0x7, 0x3d, 0x13]);
enum DXVA2_ModeVP9_VLD_Profile0 = GUID(0x463707f8, 0xa1d0, 0x4585, [0x87, 0x6d, 0x83, 0xaa, 0x6d, 0x60, 0xb8, 0x9e]);
enum DXVA2_ModeVP9_VLD_10bit_Profile2 = GUID(0xa4c749ef, 0x6ecf, 0x48aa, [0x84, 0x48, 0x50, 0xa7, 0xa1, 0x16, 0x5f, 0xf7]);
enum DXVA2_ModeVP8_VLD = GUID(0x90b899ea, 0x3a62, 0x4705, [0x88, 0xb3, 0x8d, 0xf0, 0x4b, 0x27, 0x44, 0xe7]);
enum DXVA2_E_NOT_INITIALIZED = 0xffffffff80041000;
enum DXVA2_E_NEW_VIDEO_DEVICE = 0xffffffff80041001;
enum DXVA2_E_VIDEO_DEVICE_LOCKED = 0xffffffff80041002;
enum DXVA2_E_NOT_AVAILABLE = 0xffffffff80041003;
enum MAX_SUBSTREAMS = 0x0000000f;
enum DXVA2_DECODE_GET_DRIVER_HANDLE = 0x00000725;
enum DXVA2_DECODE_SPECIFY_ENCRYPTED_BLOCKS = 0x00000724;
enum DXVAp_ModeMPEG2_A = GUID(0x1b81be0a, 0xa0c7, 0x11d3, [0xb9, 0x84, 0x0, 0xc0, 0x4f, 0x2e, 0x73, 0xc5]);
enum DXVAp_ModeMPEG2_C = GUID(0x1b81be0c, 0xa0c7, 0x11d3, [0xb9, 0x84, 0x0, 0xc0, 0x4f, 0x2e, 0x73, 0xc5]);
enum DXVAp_NoEncrypt = GUID(0x1b81bed0, 0xa0c7, 0x11d3, [0xb9, 0x84, 0x0, 0xc0, 0x4f, 0x2e, 0x73, 0xc5]);
enum DXVAp_DeinterlaceBobDevice = GUID(0x335aa36e, 0x7884, 0x43a4, [0x9c, 0x91, 0x7f, 0x87, 0xfa, 0xf3, 0xe3, 0x7e]);
enum DXVAp_DeinterlaceContainerDevice = GUID(0xe85cb93, 0x3046, 0x4ff0, [0xae, 0xcc, 0xd5, 0x8c, 0xb5, 0xf0, 0x35, 0xfd]);
enum DXVAHD_STREAM_STATE_PRIVATE_IVTC = GUID(0x9c601e3c, 0xf33, 0x414c, [0xa7, 0x39, 0x99, 0x54, 0xe, 0xe4, 0x2d, 0xa5]);
enum DXVAHDControlGuid = GUID(0xa0386e75, 0xf70c, 0x464c, [0xa9, 0xce, 0x33, 0xc4, 0x4e, 0x9, 0x16, 0x23]);
enum DXVAHDETWGUID_CREATEVIDEOPROCESSOR = GUID(0x681e3d1e, 0x5674, 0x4fb3, [0xa5, 0x3, 0x2f, 0x20, 0x55, 0xe9, 0x1f, 0x60]);
enum DXVAHDETWGUID_VIDEOPROCESSBLTSTATE = GUID(0x76c94b5a, 0x193f, 0x4692, [0x94, 0x84, 0xa4, 0xd9, 0x99, 0xda, 0x81, 0xa8]);
enum DXVAHDETWGUID_VIDEOPROCESSSTREAMSTATE = GUID(0x262c0b02, 0x209d, 0x47ed, [0x94, 0xd8, 0x82, 0xae, 0x2, 0xb8, 0x4a, 0xa7]);
enum DXVAHDETWGUID_VIDEOPROCESSBLTHD = GUID(0xbef3d435, 0x78c7, 0x4de3, [0x97, 0x7, 0xcd, 0x1b, 0x8, 0x3b, 0x16, 0xa]);
enum DXVAHDETWGUID_VIDEOPROCESSBLTHD_STREAM = GUID(0x27ae473e, 0xa5fc, 0x4be5, [0xb4, 0xe3, 0xf2, 0x49, 0x94, 0xd3, 0xc4, 0x95]);
enum DXVAHDETWGUID_DESTROYVIDEOPROCESSOR = GUID(0xf943f0a0, 0x3f16, 0x43e0, [0x80, 0x93, 0x10, 0x5a, 0x98, 0x6a, 0xa5, 0xf1]);
enum MR_VIDEO_RENDER_SERVICE = GUID(0x1092a86c, 0xab1a, 0x459a, [0xa3, 0x36, 0x83, 0x1f, 0xbc, 0x4d, 0x11, 0xff]);
enum MR_VIDEO_MIXER_SERVICE = GUID(0x73cd2fc, 0x6cf4, 0x40b7, [0x88, 0x59, 0xe8, 0x95, 0x52, 0xc8, 0x41, 0xf8]);
enum MR_VIDEO_ACCELERATION_SERVICE = GUID(0xefef5175, 0x5c7d, 0x4ce2, [0xbb, 0xbd, 0x34, 0xff, 0x8b, 0xca, 0x65, 0x54]);
enum MR_BUFFER_SERVICE = GUID(0xa562248c, 0x9ac6, 0x4ffc, [0x9f, 0xba, 0x3a, 0xf8, 0xf8, 0xad, 0x1a, 0x4d]);
enum VIDEO_ZOOM_RECT = GUID(0x7aaa1638, 0x1b7f, 0x4c93, [0xbd, 0x89, 0x5b, 0x9c, 0x9f, 0xb6, 0xfc, 0xf0]);
enum MFEVRDLL = 0x00000000;
enum MF_SDK_VERSION = 0x00000002;
enum MF_API_VERSION = 0x00000070;
enum MFSTARTUP_NOSOCKET = 0x00000001;
enum MFSTARTUP_LITE = 0x00000001;
enum MFSTARTUP_FULL = 0x00000000;
enum MF_E_DXGI_DEVICE_NOT_INITIALIZED = 0xffffffff80041000;
enum MF_E_DXGI_NEW_VIDEO_DEVICE = 0xffffffff80041001;
enum MF_E_DXGI_VIDEO_DEVICE_LOCKED = 0xffffffff80041002;
enum MF_1_BYTE_ALIGNMENT = 0x00000000;
enum MF_2_BYTE_ALIGNMENT = 0x00000001;
enum MF_4_BYTE_ALIGNMENT = 0x00000003;
enum MF_8_BYTE_ALIGNMENT = 0x00000007;
enum MF_16_BYTE_ALIGNMENT = 0x0000000f;
enum MF_32_BYTE_ALIGNMENT = 0x0000001f;
enum MF_64_BYTE_ALIGNMENT = 0x0000003f;
enum MF_128_BYTE_ALIGNMENT = 0x0000007f;
enum MF_256_BYTE_ALIGNMENT = 0x000000ff;
enum MF_512_BYTE_ALIGNMENT = 0x000001ff;
enum MF_1024_BYTE_ALIGNMENT = 0x000003ff;
enum MF_2048_BYTE_ALIGNMENT = 0x000007ff;
enum MF_4096_BYTE_ALIGNMENT = 0x00000fff;
enum MF_8192_BYTE_ALIGNMENT = 0x00001fff;
enum MF_EVENT_SESSIONCAPS = GUID(0x7e5ebcd0, 0x11b8, 0x4abe, [0xaf, 0xad, 0x10, 0xf6, 0x59, 0x9a, 0x7f, 0x42]);
enum MF_EVENT_SESSIONCAPS_DELTA = GUID(0x7e5ebcd1, 0x11b8, 0x4abe, [0xaf, 0xad, 0x10, 0xf6, 0x59, 0x9a, 0x7f, 0x42]);
enum MFSESSIONCAP_START = 0x00000001;
enum MFSESSIONCAP_SEEK = 0x00000002;
enum MFSESSIONCAP_PAUSE = 0x00000004;
enum MFSESSIONCAP_RATE_FORWARD = 0x00000010;
enum MFSESSIONCAP_RATE_REVERSE = 0x00000020;
enum MFSESSIONCAP_DOES_NOT_USE_NETWORK = 0x00000040;
enum MF_EVENT_TOPOLOGY_STATUS = GUID(0x30c5018d, 0x9a53, 0x454b, [0xad, 0x9e, 0x6d, 0x5f, 0x8f, 0xa7, 0xc4, 0x3b]);
enum MF_EVENT_START_PRESENTATION_TIME = GUID(0x5ad914d0, 0x9b45, 0x4a8d, [0xa2, 0xc0, 0x81, 0xd1, 0xe5, 0xb, 0xfb, 0x7]);
enum MF_EVENT_PRESENTATION_TIME_OFFSET = GUID(0x5ad914d1, 0x9b45, 0x4a8d, [0xa2, 0xc0, 0x81, 0xd1, 0xe5, 0xb, 0xfb, 0x7]);
enum MF_EVENT_START_PRESENTATION_TIME_AT_OUTPUT = GUID(0x5ad914d2, 0x9b45, 0x4a8d, [0xa2, 0xc0, 0x81, 0xd1, 0xe5, 0xb, 0xfb, 0x7]);
enum MF_EVENT_SOURCE_FAKE_START = GUID(0xa8cc55a7, 0x6b31, 0x419f, [0x84, 0x5d, 0xff, 0xb3, 0x51, 0xa2, 0x43, 0x4b]);
enum MF_EVENT_SOURCE_PROJECTSTART = GUID(0xa8cc55a8, 0x6b31, 0x419f, [0x84, 0x5d, 0xff, 0xb3, 0x51, 0xa2, 0x43, 0x4b]);
enum MF_EVENT_SOURCE_ACTUAL_START = GUID(0xa8cc55a9, 0x6b31, 0x419f, [0x84, 0x5d, 0xff, 0xb3, 0x51, 0xa2, 0x43, 0x4b]);
enum MF_EVENT_SOURCE_TOPOLOGY_CANCELED = GUID(0xdb62f650, 0x9a5e, 0x4704, [0xac, 0xf3, 0x56, 0x3b, 0xc6, 0xa7, 0x33, 0x64]);
enum MF_EVENT_SOURCE_CHARACTERISTICS = GUID(0x47db8490, 0x8b22, 0x4f52, [0xaf, 0xda, 0x9c, 0xe1, 0xb2, 0xd3, 0xcf, 0xa8]);
enum MF_EVENT_SOURCE_CHARACTERISTICS_OLD = GUID(0x47db8491, 0x8b22, 0x4f52, [0xaf, 0xda, 0x9c, 0xe1, 0xb2, 0xd3, 0xcf, 0xa8]);
enum MF_EVENT_DO_THINNING = GUID(0x321ea6fb, 0xdad9, 0x46e4, [0xb3, 0x1d, 0xd2, 0xea, 0xe7, 0x9, 0xe, 0x30]);
enum MF_EVENT_SCRUBSAMPLE_TIME = GUID(0x9ac712b3, 0xdcb8, 0x44d5, [0x8d, 0xc, 0x37, 0x45, 0x5a, 0x27, 0x82, 0xe3]);
enum MF_EVENT_OUTPUT_NODE = GUID(0x830f1a8b, 0xc060, 0x46dd, [0xa8, 0x1, 0x1c, 0x95, 0xde, 0xc9, 0xb1, 0x7]);
enum MF_EVENT_MFT_INPUT_STREAM_ID = GUID(0xf29c2cca, 0x7ae6, 0x42d2, [0xb2, 0x84, 0xbf, 0x83, 0x7c, 0xc8, 0x74, 0xe2]);
enum MF_EVENT_MFT_CONTEXT = GUID(0xb7cd31f1, 0x899e, 0x4b41, [0x80, 0xc9, 0x26, 0xa8, 0x96, 0xd3, 0x29, 0x77]);
enum MF_EVENT_STREAM_METADATA_KEYDATA = GUID(0xcd59a4a1, 0x4a3b, 0x4bbd, [0x86, 0x65, 0x72, 0xa4, 0xf, 0xbe, 0xa7, 0x76]);
enum MF_EVENT_STREAM_METADATA_CONTENT_KEYIDS = GUID(0x5063449d, 0xcc29, 0x4fc6, [0xa7, 0x5a, 0xd2, 0x47, 0xb3, 0x5a, 0xf8, 0x5c]);
enum MF_EVENT_STREAM_METADATA_SYSTEMID = GUID(0x1ea2ef64, 0xba16, 0x4a36, [0x87, 0x19, 0xfe, 0x75, 0x60, 0xba, 0x32, 0xad]);
enum MFSampleExtension_MaxDecodeFrameSize = GUID(0xd3cc654f, 0xf9f3, 0x4a13, [0x88, 0x9f, 0xf0, 0x4e, 0xb2, 0xb5, 0xb9, 0x57]);
enum MFSampleExtension_AccumulatedNonRefPicPercent = GUID(0x79ea74df, 0xa740, 0x445b, [0xbc, 0x98, 0xc9, 0xed, 0x1f, 0x26, 0xe, 0xee]);
enum MFSampleExtension_Encryption_ProtectionScheme = GUID(0xd054d096, 0x28bb, 0x45da, [0x87, 0xec, 0x74, 0xf3, 0x51, 0x87, 0x14, 0x6]);
enum MFSampleExtension_Encryption_CryptByteBlock = GUID(0x9d84289b, 0xc7f, 0x4713, [0xab, 0x95, 0x10, 0x8a, 0xb4, 0x2a, 0xd8, 0x1]);
enum MFSampleExtension_Encryption_SkipByteBlock = GUID(0xd550548, 0x8317, 0x4ab1, [0x84, 0x5f, 0xd0, 0x63, 0x6, 0xe2, 0x93, 0xe3]);
enum MFSampleExtension_Encryption_SubSample_Mapping = GUID(0x8444f27a, 0x69a1, 0x48da, [0xbd, 0x8, 0x11, 0xce, 0xf3, 0x68, 0x30, 0xd2]);
enum MFSampleExtension_Encryption_ClearSliceHeaderData = GUID(0x5509a4f4, 0x320d, 0x4e6c, [0x8d, 0x1a, 0x94, 0xc6, 0x6d, 0xd2, 0xc, 0xb0]);
enum MFSampleExtension_Encryption_HardwareProtection_KeyInfoID = GUID(0x8cbfcceb, 0x94a5, 0x4de1, [0x82, 0x31, 0xa8, 0x5e, 0x47, 0xcf, 0x81, 0xe7]);
enum MFSampleExtension_Encryption_HardwareProtection_KeyInfo = GUID(0xb2372080, 0x455b, 0x4dd7, [0x99, 0x89, 0x1a, 0x95, 0x57, 0x84, 0xb7, 0x54]);
enum MFSampleExtension_Encryption_HardwareProtection_VideoDecryptorContext = GUID(0x693470c8, 0xe837, 0x47a0, [0x88, 0xcb, 0x53, 0x5b, 0x90, 0x5e, 0x35, 0x82]);
enum MFSampleExtension_Encryption_Opaque_Data = GUID(0x224d77e5, 0x1391, 0x4ffb, [0x9f, 0x41, 0xb4, 0x32, 0xf6, 0x8c, 0x61, 0x1d]);
enum MFSampleExtension_NALULengthInfo = GUID(0x19124e7c, 0xad4b, 0x465f, [0xbb, 0x18, 0x20, 0x18, 0x62, 0x87, 0xb6, 0xaf]);
enum MFSampleExtension_Encryption_ResumeVideoOutput = GUID(0xa435aba5, 0xafde, 0x4cf5, [0xbc, 0x1c, 0xf6, 0xac, 0xaf, 0x13, 0x94, 0x9d]);
enum MFSampleExtension_Encryption_NALUTypes = GUID(0xb0f067c7, 0x714c, 0x416c, [0x8d, 0x59, 0x5f, 0x4d, 0xdf, 0x89, 0x13, 0xb6]);
enum MFSampleExtension_Encryption_SPSPPSData = GUID(0xaede0fa2, 0xe0c, 0x453c, [0xb7, 0xf3, 0xde, 0x86, 0x93, 0x36, 0x4d, 0x11]);
enum MFSampleExtension_Encryption_SEIData = GUID(0x3cf0e972, 0x4542, 0x4687, [0x99, 0x99, 0x58, 0x5f, 0x56, 0x5f, 0xba, 0x7d]);
enum MFSampleExtension_Encryption_HardwareProtection = GUID(0x9a2b2d2b, 0x8270, 0x43e3, [0x84, 0x48, 0x99, 0x4f, 0x42, 0x6e, 0x88, 0x86]);
enum MFSampleExtension_CleanPoint = GUID(0x9cdf01d8, 0xa0f0, 0x43ba, [0xb0, 0x77, 0xea, 0xa0, 0x6c, 0xbd, 0x72, 0x8a]);
enum MFSampleExtension_Discontinuity = GUID(0x9cdf01d9, 0xa0f0, 0x43ba, [0xb0, 0x77, 0xea, 0xa0, 0x6c, 0xbd, 0x72, 0x8a]);
enum MFSampleExtension_Token = GUID(0x8294da66, 0xf328, 0x4805, [0xb5, 0x51, 0x0, 0xde, 0xb4, 0xc5, 0x7a, 0x61]);
enum MFSampleExtension_ClosedCaption_CEA708 = GUID(0x26f09068, 0xe744, 0x47dc, [0xaa, 0x3, 0xdb, 0xf2, 0x4, 0x3, 0xbd, 0xe6]);
enum MFSampleExtension_ClosedCaption_CEA708_MAX_SIZE = 0x00000100;
enum MFSampleExtension_DecodeTimestamp = GUID(0x73a954d4, 0x9e2, 0x4861, [0xbe, 0xfc, 0x94, 0xbd, 0x97, 0xc0, 0x8e, 0x6e]);
enum MFSampleExtension_VideoEncodeQP = GUID(0xb2efe478, 0xf979, 0x4c66, [0xb9, 0x5e, 0xee, 0x2b, 0x82, 0xc8, 0x2f, 0x36]);
enum MFSampleExtension_VideoEncodePictureType = GUID(0x973704e6, 0xcd14, 0x483c, [0x8f, 0x20, 0xc9, 0xfc, 0x9, 0x28, 0xba, 0xd5]);
enum MFSampleExtension_FrameCorruption = GUID(0xb4dd4a8c, 0xbeb, 0x44c4, [0x8b, 0x75, 0xb0, 0x2b, 0x91, 0x3b, 0x4, 0xf0]);
enum MFSampleExtension_DirtyRects = GUID(0x9ba70225, 0xb342, 0x4e97, [0x91, 0x26, 0xb, 0x56, 0x6a, 0xb7, 0xea, 0x7e]);
enum MFSampleExtension_MoveRegions = GUID(0xe2a6c693, 0x3a8b, 0x4b8d, [0x95, 0xd0, 0xf6, 0x2, 0x81, 0xa1, 0x2f, 0xb7]);
enum MFSampleExtension_HDCP_OptionalHeader = GUID(0x9a2e7390, 0x121f, 0x455f, [0x83, 0x76, 0xc9, 0x74, 0x28, 0xe0, 0xb5, 0x40]);
enum MFSampleExtension_HDCP_FrameCounter = GUID(0x9d389c60, 0xf507, 0x4aa6, [0xa4, 0xa, 0x71, 0x2, 0x7a, 0x2, 0xf3, 0xde]);
enum MFSampleExtension_HDCP_StreamID = GUID(0x177e5d74, 0xc370, 0x4a7a, [0x95, 0xa2, 0x36, 0x83, 0x3c, 0x1, 0xd0, 0xaf]);
enum MFSampleExtension_Timestamp = GUID(0x1e436999, 0x69be, 0x4c7a, [0x93, 0x69, 0x70, 0x6, 0x8c, 0x2, 0x60, 0xcb]);
enum MFSampleExtension_RepeatFrame = GUID(0x88be738f, 0x711, 0x4f42, [0xb4, 0x58, 0x34, 0x4a, 0xed, 0x42, 0xec, 0x2f]);
enum MFT_ENCODER_ERROR = GUID(0xc8d1eda4, 0x98e4, 0x41d5, [0x92, 0x97, 0x44, 0xf5, 0x38, 0x52, 0xf9, 0xe]);
enum MFT_GFX_DRIVER_VERSION_ID_Attribute = GUID(0xf34b9093, 0x5e0, 0x4b16, [0x99, 0x3d, 0x3e, 0x2a, 0x2c, 0xde, 0x6a, 0xd3]);
enum MFSampleExtension_DescrambleData = GUID(0x43483be6, 0x4903, 0x4314, [0xb0, 0x32, 0x29, 0x51, 0x36, 0x59, 0x36, 0xfc]);
enum MFSampleExtension_SampleKeyID = GUID(0x9ed713c8, 0x9b87, 0x4b26, [0x82, 0x97, 0xa9, 0x3b, 0xc, 0x5a, 0x8a, 0xcc]);
enum MFSampleExtension_GenKeyFunc = GUID(0x441ca1ee, 0x6b1f, 0x4501, [0x90, 0x3a, 0xde, 0x87, 0xdf, 0x42, 0xf6, 0xed]);
enum MFSampleExtension_GenKeyCtx = GUID(0x188120cb, 0xd7da, 0x4b59, [0x9b, 0x3e, 0x92, 0x52, 0xfd, 0x37, 0x30, 0x1c]);
enum MFSampleExtension_PacketCrossOffsets = GUID(0x2789671d, 0x389f, 0x40bb, [0x90, 0xd9, 0xc2, 0x82, 0xf7, 0x7f, 0x9a, 0xbd]);
enum MFSampleExtension_Encryption_SampleID = GUID(0x6698b84e, 0xafa, 0x4330, [0xae, 0xb2, 0x1c, 0xa, 0x98, 0xd7, 0xa4, 0x4d]);
enum MFSampleExtension_Encryption_KeyID = GUID(0x76376591, 0x795f, 0x4da1, [0x86, 0xed, 0x9d, 0x46, 0xec, 0xa1, 0x9, 0xa9]);
enum MFSampleExtension_Content_KeyID = GUID(0xc6c7f5b0, 0xacca, 0x415b, [0x87, 0xd9, 0x10, 0x44, 0x14, 0x69, 0xef, 0xc6]);
enum MFSampleExtension_Encryption_SubSampleMappingSplit = GUID(0xfe0254b9, 0x2aa5, 0x4edc, [0x99, 0xf7, 0x17, 0xe8, 0x9d, 0xbf, 0x91, 0x74]);
enum MFSampleExtension_Interlaced = GUID(0xb1d5830a, 0xdeb8, 0x40e3, [0x90, 0xfa, 0x38, 0x99, 0x43, 0x71, 0x64, 0x61]);
enum MFSampleExtension_BottomFieldFirst = GUID(0x941ce0a3, 0x6ae3, 0x4dda, [0x9a, 0x8, 0xa6, 0x42, 0x98, 0x34, 0x6, 0x17]);
enum MFSampleExtension_RepeatFirstField = GUID(0x304d257c, 0x7493, 0x4fbd, [0xb1, 0x49, 0x92, 0x28, 0xde, 0x8d, 0x9a, 0x99]);
enum MFSampleExtension_SingleField = GUID(0x9d85f816, 0x658b, 0x455a, [0xbd, 0xe0, 0x9f, 0xa7, 0xe1, 0x5a, 0xb8, 0xf9]);
enum MFSampleExtension_DerivedFromTopField = GUID(0x6852465a, 0xae1c, 0x4553, [0x8e, 0x9b, 0xc3, 0x42, 0xf, 0xcb, 0x16, 0x37]);
enum MFSampleExtension_MeanAbsoluteDifference = GUID(0x1cdbde11, 0x8b4, 0x4311, [0xa6, 0xdd, 0xf, 0x9f, 0x37, 0x19, 0x7, 0xaa]);
enum MFSampleExtension_LongTermReferenceFrameInfo = GUID(0x9154733f, 0xe1bd, 0x41bf, [0x81, 0xd3, 0xfc, 0xd9, 0x18, 0xf7, 0x13, 0x32]);
enum MFSampleExtension_ROIRectangle = GUID(0x3414a438, 0x4998, 0x4d2c, [0xbe, 0x82, 0xbe, 0x3c, 0xa0, 0xb2, 0x4d, 0x43]);
enum MFSampleExtension_LastSlice = GUID(0x2b5d5457, 0x5547, 0x4f07, [0xb8, 0xc8, 0xb4, 0xa3, 0xa9, 0xa1, 0xda, 0xac]);
enum MACROBLOCK_FLAG_SKIP = 0x00000001;
enum MACROBLOCK_FLAG_DIRTY = 0x00000002;
enum MACROBLOCK_FLAG_MOTION = 0x00000004;
enum MACROBLOCK_FLAG_VIDEO = 0x00000008;
enum MACROBLOCK_FLAG_HAS_MOTION_VECTOR = 0x00000010;
enum MACROBLOCK_FLAG_HAS_QP = 0x00000020;
enum MFSampleExtension_FeatureMap = GUID(0xa032d165, 0x46fc, 0x400a, [0xb4, 0x49, 0x49, 0xde, 0x53, 0xe6, 0x2a, 0x6e]);
enum MFSampleExtension_ChromaOnly = GUID(0x1eb9179c, 0xa01f, 0x4845, [0x8c, 0x4, 0xe, 0x65, 0xa2, 0x6e, 0xb0, 0x4f]);
enum MFSampleExtension_PhotoThumbnail = GUID(0x74bbc85c, 0xc8bb, 0x42dc, [0xb5, 0x86, 0xda, 0x17, 0xff, 0xd3, 0x5d, 0xcc]);
enum MFSampleExtension_PhotoThumbnailMediaType = GUID(0x61ad5420, 0xebf8, 0x4143, [0x89, 0xaf, 0x6b, 0xf2, 0x5f, 0x67, 0x2d, 0xef]);
enum MFSampleExtension_CaptureMetadata = GUID(0x2ebe23a8, 0xfaf5, 0x444a, [0xa6, 0xa2, 0xeb, 0x81, 0x8, 0x80, 0xab, 0x5d]);
enum MFSampleExtension_MDLCacheCookie = GUID(0x5f002af9, 0xd8f9, 0x41a3, [0xb6, 0xc3, 0xa2, 0xad, 0x43, 0xf6, 0x47, 0xad]);
enum MF_CAPTURE_METADATA_PHOTO_FRAME_FLASH = GUID(0xf9dd6c6, 0x6003, 0x45d8, [0xbd, 0x59, 0xf1, 0xf5, 0x3e, 0x3d, 0x4, 0xe8]);
enum MF_CAPTURE_METADATA_FRAME_RAWSTREAM = GUID(0x9252077b, 0x2680, 0x49b9, [0xae, 0x2, 0xb1, 0x90, 0x75, 0x97, 0x3b, 0x70]);
enum MF_CAPTURE_METADATA_FOCUSSTATE = GUID(0xa87ee154, 0x997f, 0x465d, [0xb9, 0x1f, 0x29, 0xd5, 0x3b, 0x98, 0x2b, 0x88]);
enum MF_CAPTURE_METADATA_REQUESTED_FRAME_SETTING_ID = GUID(0xbb3716d9, 0x8a61, 0x47a4, [0x81, 0x97, 0x45, 0x9c, 0x7f, 0xf1, 0x74, 0xd5]);
enum MF_CAPTURE_METADATA_EXPOSURE_TIME = GUID(0x16b9ae99, 0xcd84, 0x4063, [0x87, 0x9d, 0xa2, 0x8c, 0x76, 0x33, 0x72, 0x9e]);
enum MF_CAPTURE_METADATA_EXPOSURE_COMPENSATION = GUID(0xd198aa75, 0x4b62, 0x4345, [0xab, 0xf3, 0x3c, 0x31, 0xfa, 0x12, 0xc2, 0x99]);
enum MF_CAPTURE_METADATA_ISO_SPEED = GUID(0xe528a68f, 0xb2e3, 0x44fe, [0x8b, 0x65, 0x7, 0xbf, 0x4b, 0x5a, 0x13, 0xff]);
enum MF_CAPTURE_METADATA_LENS_POSITION = GUID(0xb5fc8e86, 0x11d1, 0x4e70, [0x81, 0x9b, 0x72, 0x3a, 0x89, 0xfa, 0x45, 0x20]);
enum MF_CAPTURE_METADATA_SCENE_MODE = GUID(0x9cc3b54d, 0x5ed3, 0x4bae, [0xb3, 0x88, 0x76, 0x70, 0xae, 0xf5, 0x9e, 0x13]);
enum MF_CAPTURE_METADATA_FLASH = GUID(0x4a51520b, 0xfb36, 0x446c, [0x9d, 0xf2, 0x68, 0x17, 0x1b, 0x9a, 0x3, 0x89]);
enum MF_CAPTURE_METADATA_FLASH_POWER = GUID(0x9c0e0d49, 0x205, 0x491a, [0xbc, 0x9d, 0x2d, 0x6e, 0x1f, 0x4d, 0x56, 0x84]);
enum MF_CAPTURE_METADATA_WHITEBALANCE = GUID(0xc736fd77, 0xfb9, 0x4e2e, [0x97, 0xa2, 0xfc, 0xd4, 0x90, 0x73, 0x9e, 0xe9]);
enum MF_CAPTURE_METADATA_ZOOMFACTOR = GUID(0xe50b0b81, 0xe501, 0x42c2, [0xab, 0xf2, 0x85, 0x7e, 0xcb, 0x13, 0xfa, 0x5c]);
enum MF_CAPTURE_METADATA_FACEROIS = GUID(0x864f25a6, 0x349f, 0x46b1, [0xa3, 0xe, 0x54, 0xcc, 0x22, 0x92, 0x8a, 0x47]);
enum MF_CAPTURE_METADATA_FACEROITIMESTAMPS = GUID(0xe94d50cc, 0x3da0, 0x44d4, [0xbb, 0x34, 0x83, 0x19, 0x8a, 0x74, 0x18, 0x68]);
enum MF_CAPTURE_METADATA_FACEROICHARACTERIZATIONS = GUID(0xb927a1a8, 0x18ef, 0x46d3, [0xb3, 0xaf, 0x69, 0x37, 0x2f, 0x94, 0xd9, 0xb2]);
enum MF_CAPTURE_METADATA_ISO_GAINS = GUID(0x5802ac9, 0xe1d, 0x41c7, [0xa8, 0xc8, 0x7e, 0x73, 0x69, 0xf8, 0x4e, 0x1e]);
enum MF_CAPTURE_METADATA_SENSORFRAMERATE = GUID(0xdb51357e, 0x9d3d, 0x4962, [0xb0, 0x6d, 0x7, 0xce, 0x65, 0xd, 0x9a, 0xa]);
enum MF_CAPTURE_METADATA_WHITEBALANCE_GAINS = GUID(0xe7570c8f, 0x2dcb, 0x4c7c, [0xaa, 0xce, 0x22, 0xec, 0xe7, 0xcc, 0xe6, 0x47]);
enum MF_CAPTURE_METADATA_HISTOGRAM = GUID(0x85358432, 0x2ef6, 0x4ba9, [0xa3, 0xfb, 0x6, 0xd8, 0x29, 0x74, 0xb8, 0x95]);
enum MF_CAPTURE_METADATA_EXIF = GUID(0x2e9575b8, 0x8c31, 0x4a02, [0x85, 0x75, 0x42, 0xb1, 0x97, 0xb7, 0x15, 0x92]);
enum MF_CAPTURE_METADATA_FRAME_ILLUMINATION = GUID(0x6d688ffc, 0x63d3, 0x46fe, [0xba, 0xda, 0x5b, 0x94, 0x7d, 0xb0, 0xd0, 0x80]);
enum MF_CAPTURE_METADATA_UVC_PAYLOADHEADER = GUID(0xf9f88a87, 0xe1dd, 0x441e, [0x95, 0xcb, 0x42, 0xe2, 0x1a, 0x64, 0xf1, 0xd9]);
enum MFSampleExtension_Depth_MinReliableDepth = GUID(0x5f8582b2, 0xe36b, 0x47c8, [0x9b, 0x87, 0xfe, 0xe1, 0xca, 0x72, 0xc5, 0xb0]);
enum MFSampleExtension_Depth_MaxReliableDepth = GUID(0xe45545d1, 0x1f0f, 0x4a32, [0xa8, 0xa7, 0x61, 0x1, 0xa2, 0x4e, 0xa8, 0xbe]);
enum MF_CAPTURE_METADATA_FIRST_SCANLINE_START_TIME_QPC = GUID(0x6a2c49f1, 0xe052, 0x46b6, [0xb2, 0xd9, 0x73, 0xc1, 0x55, 0x87, 0x9, 0xaf]);
enum MF_CAPTURE_METADATA_LAST_SCANLINE_END_TIME_QPC = GUID(0xdccadecb, 0xc4d4, 0x400d, [0xb4, 0x18, 0x10, 0xe8, 0x85, 0x25, 0xe1, 0xf6]);
enum MF_CAPTURE_METADATA_SCANLINE_TIME_QPC_ACCURACY = GUID(0x4cd79c51, 0xf765, 0x4b09, [0xb1, 0xe1, 0x27, 0xd1, 0xf7, 0xeb, 0xea, 0x9]);
enum MF_CAPTURE_METADATA_SCANLINE_DIRECTION = GUID(0x6496a3ba, 0x1907, 0x49e6, [0xb0, 0xc3, 0x12, 0x37, 0x95, 0xf3, 0x80, 0xa9]);
enum MFCAPTURE_METADATA_SCAN_RIGHT_LEFT = 0x00000001;
enum MFCAPTURE_METADATA_SCAN_BOTTOM_TOP = 0x00000002;
enum MFCAPTURE_METADATA_SCANLINE_VERTICAL = 0x00000004;
enum MF_CAPTURE_METADATA_DIGITALWINDOW = GUID(0x276f72a2, 0x59c8, 0x4f69, [0x97, 0xb4, 0x6, 0x8b, 0x8c, 0xe, 0xc0, 0x44]);
enum MF_CAPTURE_METADATA_FRAME_BACKGROUND_MASK = GUID(0x3f14dd3, 0x75dd, 0x433a, [0xa8, 0xe2, 0x1e, 0x3f, 0x5f, 0x2a, 0x50, 0xa0]);
enum MF_METADATAFACIALEXPRESSION_SMILE = 0x00000001;
enum MF_METADATATIMESTAMPS_DEVICE = 0x00000001;
enum MF_METADATATIMESTAMPS_PRESENTATION = 0x00000002;
enum MF_HISTOGRAM_CHANNEL_Y = 0x00000001;
enum MF_HISTOGRAM_CHANNEL_R = 0x00000002;
enum MF_HISTOGRAM_CHANNEL_G = 0x00000004;
enum MF_HISTOGRAM_CHANNEL_B = 0x00000008;
enum MF_HISTOGRAM_CHANNEL_Cb = 0x00000010;
enum MF_HISTOGRAM_CHANNEL_Cr = 0x00000020;
enum MFT_CATEGORY_VIDEO_DECODER = GUID(0xd6c02d4b, 0x6833, 0x45b4, [0x97, 0x1a, 0x5, 0xa4, 0xb0, 0x4b, 0xab, 0x91]);
enum MFT_CATEGORY_VIDEO_ENCODER = GUID(0xf79eac7d, 0xe545, 0x4387, [0xbd, 0xee, 0xd6, 0x47, 0xd7, 0xbd, 0xe4, 0x2a]);
enum MFT_CATEGORY_VIDEO_EFFECT = GUID(0x12e17c21, 0x532c, 0x4a6e, [0x8a, 0x1c, 0x40, 0x82, 0x5a, 0x73, 0x63, 0x97]);
enum MFT_CATEGORY_MULTIPLEXER = GUID(0x59c561e, 0x5ae, 0x4b61, [0xb6, 0x9d, 0x55, 0xb6, 0x1e, 0xe5, 0x4a, 0x7b]);
enum MFT_CATEGORY_DEMULTIPLEXER = GUID(0xa8700a7a, 0x939b, 0x44c5, [0x99, 0xd7, 0x76, 0x22, 0x6b, 0x23, 0xb3, 0xf1]);
enum MFT_CATEGORY_AUDIO_DECODER = GUID(0x9ea73fb4, 0xef7a, 0x4559, [0x8d, 0x5d, 0x71, 0x9d, 0x8f, 0x4, 0x26, 0xc7]);
enum MFT_CATEGORY_AUDIO_ENCODER = GUID(0x91c64bd0, 0xf91e, 0x4d8c, [0x92, 0x76, 0xdb, 0x24, 0x82, 0x79, 0xd9, 0x75]);
enum MFT_CATEGORY_AUDIO_EFFECT = GUID(0x11064c48, 0x3648, 0x4ed0, [0x93, 0x2e, 0x5, 0xce, 0x8a, 0xc8, 0x11, 0xb7]);
enum MFT_CATEGORY_VIDEO_PROCESSOR = GUID(0x302ea3fc, 0xaa5f, 0x47f9, [0x9f, 0x7a, 0xc2, 0x18, 0x8b, 0xb1, 0x63, 0x2]);
enum MFT_CATEGORY_OTHER = GUID(0x90175d57, 0xb7ea, 0x4901, [0xae, 0xb3, 0x93, 0x3a, 0x87, 0x47, 0x75, 0x6f]);
enum MFT_CATEGORY_ENCRYPTOR = GUID(0xb0c687be, 0x1cd, 0x44b5, [0xb8, 0xb2, 0x7c, 0x1d, 0x7e, 0x5, 0x8b, 0x1f]);
enum MFT_CATEGORY_VIDEO_RENDERER_EFFECT = GUID(0x145cd8b4, 0x92f4, 0x4b23, [0x8a, 0xe7, 0xe0, 0xdf, 0x6, 0xc2, 0xda, 0x95]);
enum MFT_ENUM_VIDEO_RENDERER_EXTENSION_PROFILE = GUID(0x62c56928, 0x9a4e, 0x443b, [0xb9, 0xdc, 0xca, 0xc8, 0x30, 0xc2, 0x41, 0x0]);
enum MFT_ENUM_ADAPTER_LUID = GUID(0x1d39518c, 0xe220, 0x4da8, [0xa0, 0x7f, 0xba, 0x17, 0x25, 0x52, 0xd6, 0xb1]);
enum MFT_SUPPORT_DYNAMIC_FORMAT_CHANGE = GUID(0x53476a11, 0x3f13, 0x49fb, [0xac, 0x42, 0xee, 0x27, 0x33, 0xc9, 0x67, 0x41]);
enum LOCAL_D3DFMT_DEFINES = 0x00000001;
enum MFVideoFormat_Base = GUID(0x0, 0x0, 0x10, [0x80, 0x0, 0x0, 0xaa, 0x0, 0x38, 0x9b, 0x71]);
enum MFVideoFormat_RGB32 = GUID(0x16, 0x0, 0x10, [0x80, 0x0, 0x0, 0xaa, 0x0, 0x38, 0x9b, 0x71]);
enum MFVideoFormat_ARGB32 = GUID(0x15, 0x0, 0x10, [0x80, 0x0, 0x0, 0xaa, 0x0, 0x38, 0x9b, 0x71]);
enum MFVideoFormat_RGB24 = GUID(0x14, 0x0, 0x10, [0x80, 0x0, 0x0, 0xaa, 0x0, 0x38, 0x9b, 0x71]);
enum MFVideoFormat_RGB555 = GUID(0x18, 0x0, 0x10, [0x80, 0x0, 0x0, 0xaa, 0x0, 0x38, 0x9b, 0x71]);
enum MFVideoFormat_RGB565 = GUID(0x17, 0x0, 0x10, [0x80, 0x0, 0x0, 0xaa, 0x0, 0x38, 0x9b, 0x71]);
enum MFVideoFormat_RGB8 = GUID(0x29, 0x0, 0x10, [0x80, 0x0, 0x0, 0xaa, 0x0, 0x38, 0x9b, 0x71]);
enum MFVideoFormat_L8 = GUID(0x32, 0x0, 0x10, [0x80, 0x0, 0x0, 0xaa, 0x0, 0x38, 0x9b, 0x71]);
enum MFVideoFormat_L16 = GUID(0x51, 0x0, 0x10, [0x80, 0x0, 0x0, 0xaa, 0x0, 0x38, 0x9b, 0x71]);
enum MFVideoFormat_D16 = GUID(0x50, 0x0, 0x10, [0x80, 0x0, 0x0, 0xaa, 0x0, 0x38, 0x9b, 0x71]);
enum MFVideoFormat_AI44 = GUID(0x34344941, 0x0, 0x10, [0x80, 0x0, 0x0, 0xaa, 0x0, 0x38, 0x9b, 0x71]);
enum MFVideoFormat_AYUV = GUID(0x56555941, 0x0, 0x10, [0x80, 0x0, 0x0, 0xaa, 0x0, 0x38, 0x9b, 0x71]);
enum MFVideoFormat_YUY2 = GUID(0x32595559, 0x0, 0x10, [0x80, 0x0, 0x0, 0xaa, 0x0, 0x38, 0x9b, 0x71]);
enum MFVideoFormat_YVYU = GUID(0x55595659, 0x0, 0x10, [0x80, 0x0, 0x0, 0xaa, 0x0, 0x38, 0x9b, 0x71]);
enum MFVideoFormat_YVU9 = GUID(0x39555659, 0x0, 0x10, [0x80, 0x0, 0x0, 0xaa, 0x0, 0x38, 0x9b, 0x71]);
enum MFVideoFormat_UYVY = GUID(0x59565955, 0x0, 0x10, [0x80, 0x0, 0x0, 0xaa, 0x0, 0x38, 0x9b, 0x71]);
enum MFVideoFormat_NV11 = GUID(0x3131564e, 0x0, 0x10, [0x80, 0x0, 0x0, 0xaa, 0x0, 0x38, 0x9b, 0x71]);
enum MFVideoFormat_NV12 = GUID(0x3231564e, 0x0, 0x10, [0x80, 0x0, 0x0, 0xaa, 0x0, 0x38, 0x9b, 0x71]);
enum MFVideoFormat_NV21 = GUID(0x3132564e, 0x0, 0x10, [0x80, 0x0, 0x0, 0xaa, 0x0, 0x38, 0x9b, 0x71]);
enum MFVideoFormat_YV12 = GUID(0x32315659, 0x0, 0x10, [0x80, 0x0, 0x0, 0xaa, 0x0, 0x38, 0x9b, 0x71]);
enum MFVideoFormat_I420 = GUID(0x30323449, 0x0, 0x10, [0x80, 0x0, 0x0, 0xaa, 0x0, 0x38, 0x9b, 0x71]);
enum MFVideoFormat_IYUV = GUID(0x56555949, 0x0, 0x10, [0x80, 0x0, 0x0, 0xaa, 0x0, 0x38, 0x9b, 0x71]);
enum MFVideoFormat_Y210 = GUID(0x30313259, 0x0, 0x10, [0x80, 0x0, 0x0, 0xaa, 0x0, 0x38, 0x9b, 0x71]);
enum MFVideoFormat_Y216 = GUID(0x36313259, 0x0, 0x10, [0x80, 0x0, 0x0, 0xaa, 0x0, 0x38, 0x9b, 0x71]);
enum MFVideoFormat_Y410 = GUID(0x30313459, 0x0, 0x10, [0x80, 0x0, 0x0, 0xaa, 0x0, 0x38, 0x9b, 0x71]);
enum MFVideoFormat_Y416 = GUID(0x36313459, 0x0, 0x10, [0x80, 0x0, 0x0, 0xaa, 0x0, 0x38, 0x9b, 0x71]);
enum MFVideoFormat_Y41P = GUID(0x50313459, 0x0, 0x10, [0x80, 0x0, 0x0, 0xaa, 0x0, 0x38, 0x9b, 0x71]);
enum MFVideoFormat_Y41T = GUID(0x54313459, 0x0, 0x10, [0x80, 0x0, 0x0, 0xaa, 0x0, 0x38, 0x9b, 0x71]);
enum MFVideoFormat_Y42T = GUID(0x54323459, 0x0, 0x10, [0x80, 0x0, 0x0, 0xaa, 0x0, 0x38, 0x9b, 0x71]);
enum MFVideoFormat_P210 = GUID(0x30313250, 0x0, 0x10, [0x80, 0x0, 0x0, 0xaa, 0x0, 0x38, 0x9b, 0x71]);
enum MFVideoFormat_P216 = GUID(0x36313250, 0x0, 0x10, [0x80, 0x0, 0x0, 0xaa, 0x0, 0x38, 0x9b, 0x71]);
enum MFVideoFormat_P010 = GUID(0x30313050, 0x0, 0x10, [0x80, 0x0, 0x0, 0xaa, 0x0, 0x38, 0x9b, 0x71]);
enum MFVideoFormat_P016 = GUID(0x36313050, 0x0, 0x10, [0x80, 0x0, 0x0, 0xaa, 0x0, 0x38, 0x9b, 0x71]);
enum MFVideoFormat_v210 = GUID(0x30313276, 0x0, 0x10, [0x80, 0x0, 0x0, 0xaa, 0x0, 0x38, 0x9b, 0x71]);
enum MFVideoFormat_v216 = GUID(0x36313276, 0x0, 0x10, [0x80, 0x0, 0x0, 0xaa, 0x0, 0x38, 0x9b, 0x71]);
enum MFVideoFormat_v410 = GUID(0x30313476, 0x0, 0x10, [0x80, 0x0, 0x0, 0xaa, 0x0, 0x38, 0x9b, 0x71]);
enum MFVideoFormat_MP43 = GUID(0x3334504d, 0x0, 0x10, [0x80, 0x0, 0x0, 0xaa, 0x0, 0x38, 0x9b, 0x71]);
enum MFVideoFormat_MP4S = GUID(0x5334504d, 0x0, 0x10, [0x80, 0x0, 0x0, 0xaa, 0x0, 0x38, 0x9b, 0x71]);
enum MFVideoFormat_M4S2 = GUID(0x3253344d, 0x0, 0x10, [0x80, 0x0, 0x0, 0xaa, 0x0, 0x38, 0x9b, 0x71]);
enum MFVideoFormat_MP4V = GUID(0x5634504d, 0x0, 0x10, [0x80, 0x0, 0x0, 0xaa, 0x0, 0x38, 0x9b, 0x71]);
enum MFVideoFormat_WMV1 = GUID(0x31564d57, 0x0, 0x10, [0x80, 0x0, 0x0, 0xaa, 0x0, 0x38, 0x9b, 0x71]);
enum MFVideoFormat_WMV2 = GUID(0x32564d57, 0x0, 0x10, [0x80, 0x0, 0x0, 0xaa, 0x0, 0x38, 0x9b, 0x71]);
enum MFVideoFormat_WMV3 = GUID(0x33564d57, 0x0, 0x10, [0x80, 0x0, 0x0, 0xaa, 0x0, 0x38, 0x9b, 0x71]);
enum MFVideoFormat_WVC1 = GUID(0x31435657, 0x0, 0x10, [0x80, 0x0, 0x0, 0xaa, 0x0, 0x38, 0x9b, 0x71]);
enum MFVideoFormat_MSS1 = GUID(0x3153534d, 0x0, 0x10, [0x80, 0x0, 0x0, 0xaa, 0x0, 0x38, 0x9b, 0x71]);
enum MFVideoFormat_MSS2 = GUID(0x3253534d, 0x0, 0x10, [0x80, 0x0, 0x0, 0xaa, 0x0, 0x38, 0x9b, 0x71]);
enum MFVideoFormat_MPG1 = GUID(0x3147504d, 0x0, 0x10, [0x80, 0x0, 0x0, 0xaa, 0x0, 0x38, 0x9b, 0x71]);
enum MFVideoFormat_DVSL = GUID(0x6c737664, 0x0, 0x10, [0x80, 0x0, 0x0, 0xaa, 0x0, 0x38, 0x9b, 0x71]);
enum MFVideoFormat_DVSD = GUID(0x64737664, 0x0, 0x10, [0x80, 0x0, 0x0, 0xaa, 0x0, 0x38, 0x9b, 0x71]);
enum MFVideoFormat_DVHD = GUID(0x64687664, 0x0, 0x10, [0x80, 0x0, 0x0, 0xaa, 0x0, 0x38, 0x9b, 0x71]);
enum MFVideoFormat_DV25 = GUID(0x35327664, 0x0, 0x10, [0x80, 0x0, 0x0, 0xaa, 0x0, 0x38, 0x9b, 0x71]);
enum MFVideoFormat_DV50 = GUID(0x30357664, 0x0, 0x10, [0x80, 0x0, 0x0, 0xaa, 0x0, 0x38, 0x9b, 0x71]);
enum MFVideoFormat_DVH1 = GUID(0x31687664, 0x0, 0x10, [0x80, 0x0, 0x0, 0xaa, 0x0, 0x38, 0x9b, 0x71]);
enum MFVideoFormat_H264 = GUID(0x34363248, 0x0, 0x10, [0x80, 0x0, 0x0, 0xaa, 0x0, 0x38, 0x9b, 0x71]);
enum MFVideoFormat_H265 = GUID(0x35363248, 0x0, 0x10, [0x80, 0x0, 0x0, 0xaa, 0x0, 0x38, 0x9b, 0x71]);
enum MFVideoFormat_MJPG = GUID(0x47504a4d, 0x0, 0x10, [0x80, 0x0, 0x0, 0xaa, 0x0, 0x38, 0x9b, 0x71]);
enum MFVideoFormat_420O = GUID(0x4f303234, 0x0, 0x10, [0x80, 0x0, 0x0, 0xaa, 0x0, 0x38, 0x9b, 0x71]);
enum MFVideoFormat_HEVC = GUID(0x43564548, 0x0, 0x10, [0x80, 0x0, 0x0, 0xaa, 0x0, 0x38, 0x9b, 0x71]);
enum MFVideoFormat_HEVC_ES = GUID(0x53564548, 0x0, 0x10, [0x80, 0x0, 0x0, 0xaa, 0x0, 0x38, 0x9b, 0x71]);
enum MFVideoFormat_VP80 = GUID(0x30385056, 0x0, 0x10, [0x80, 0x0, 0x0, 0xaa, 0x0, 0x38, 0x9b, 0x71]);
enum MFVideoFormat_VP90 = GUID(0x30395056, 0x0, 0x10, [0x80, 0x0, 0x0, 0xaa, 0x0, 0x38, 0x9b, 0x71]);
enum MFVideoFormat_ORAW = GUID(0x5741524f, 0x0, 0x10, [0x80, 0x0, 0x0, 0xaa, 0x0, 0x38, 0x9b, 0x71]);
enum MFVideoFormat_H263 = GUID(0x33363248, 0x0, 0x10, [0x80, 0x0, 0x0, 0xaa, 0x0, 0x38, 0x9b, 0x71]);
enum MFVideoFormat_A2R10G10B10 = GUID(0x1f, 0x0, 0x10, [0x80, 0x0, 0x0, 0xaa, 0x0, 0x38, 0x9b, 0x71]);
enum MFVideoFormat_A16B16G16R16F = GUID(0x71, 0x0, 0x10, [0x80, 0x0, 0x0, 0xaa, 0x0, 0x38, 0x9b, 0x71]);
enum MFVideoFormat_VP10 = GUID(0x30315056, 0x0, 0x10, [0x80, 0x0, 0x0, 0xaa, 0x0, 0x38, 0x9b, 0x71]);
enum MFVideoFormat_AV1 = GUID(0x31305641, 0x0, 0x10, [0x80, 0x0, 0x0, 0xaa, 0x0, 0x38, 0x9b, 0x71]);
enum MFVideoFormat_Theora = GUID(0x6f656874, 0x0, 0x10, [0x80, 0x0, 0x0, 0xaa, 0x0, 0x38, 0x9b, 0x71]);
enum MFVideoFormat_H264_ES = GUID(0x3f40f4f0, 0x5622, 0x4ff8, [0xb6, 0xd8, 0xa1, 0x7a, 0x58, 0x4b, 0xee, 0x5e]);
enum MFVideoFormat_MPEG2 = GUID(0xe06d8026, 0xdb46, 0x11cf, [0xb4, 0xd1, 0x0, 0x80, 0x5f, 0x6c, 0xbb, 0xea]);
enum MFAudioFormat_Base = GUID(0x0, 0x0, 0x10, [0x80, 0x0, 0x0, 0xaa, 0x0, 0x38, 0x9b, 0x71]);
enum MFAudioFormat_PCM = GUID(0x1, 0x0, 0x10, [0x80, 0x0, 0x0, 0xaa, 0x0, 0x38, 0x9b, 0x71]);
enum MFAudioFormat_Float = GUID(0x3, 0x0, 0x10, [0x80, 0x0, 0x0, 0xaa, 0x0, 0x38, 0x9b, 0x71]);
enum MFAudioFormat_DTS = GUID(0x8, 0x0, 0x10, [0x80, 0x0, 0x0, 0xaa, 0x0, 0x38, 0x9b, 0x71]);
enum MFAudioFormat_Dolby_AC3_SPDIF = GUID(0x92, 0x0, 0x10, [0x80, 0x0, 0x0, 0xaa, 0x0, 0x38, 0x9b, 0x71]);
enum MFAudioFormat_DRM = GUID(0x9, 0x0, 0x10, [0x80, 0x0, 0x0, 0xaa, 0x0, 0x38, 0x9b, 0x71]);
enum MFAudioFormat_WMAudioV8 = GUID(0x161, 0x0, 0x10, [0x80, 0x0, 0x0, 0xaa, 0x0, 0x38, 0x9b, 0x71]);
enum MFAudioFormat_WMAudioV9 = GUID(0x162, 0x0, 0x10, [0x80, 0x0, 0x0, 0xaa, 0x0, 0x38, 0x9b, 0x71]);
enum MFAudioFormat_WMAudio_Lossless = GUID(0x163, 0x0, 0x10, [0x80, 0x0, 0x0, 0xaa, 0x0, 0x38, 0x9b, 0x71]);
enum MFAudioFormat_WMASPDIF = GUID(0x164, 0x0, 0x10, [0x80, 0x0, 0x0, 0xaa, 0x0, 0x38, 0x9b, 0x71]);
enum MFAudioFormat_MSP1 = GUID(0xa, 0x0, 0x10, [0x80, 0x0, 0x0, 0xaa, 0x0, 0x38, 0x9b, 0x71]);
enum MFAudioFormat_MP3 = GUID(0x55, 0x0, 0x10, [0x80, 0x0, 0x0, 0xaa, 0x0, 0x38, 0x9b, 0x71]);
enum MFAudioFormat_MPEG = GUID(0x50, 0x0, 0x10, [0x80, 0x0, 0x0, 0xaa, 0x0, 0x38, 0x9b, 0x71]);
enum MFAudioFormat_AAC = GUID(0x1610, 0x0, 0x10, [0x80, 0x0, 0x0, 0xaa, 0x0, 0x38, 0x9b, 0x71]);
enum MFAudioFormat_ADTS = GUID(0x1600, 0x0, 0x10, [0x80, 0x0, 0x0, 0xaa, 0x0, 0x38, 0x9b, 0x71]);
enum MFAudioFormat_AMR_NB = GUID(0x7361, 0x0, 0x10, [0x80, 0x0, 0x0, 0xaa, 0x0, 0x38, 0x9b, 0x71]);
enum MFAudioFormat_AMR_WB = GUID(0x7362, 0x0, 0x10, [0x80, 0x0, 0x0, 0xaa, 0x0, 0x38, 0x9b, 0x71]);
enum MFAudioFormat_AMR_WP = GUID(0x7363, 0x0, 0x10, [0x80, 0x0, 0x0, 0xaa, 0x0, 0x38, 0x9b, 0x71]);
enum MFAudioFormat_FLAC = GUID(0xf1ac, 0x0, 0x10, [0x80, 0x0, 0x0, 0xaa, 0x0, 0x38, 0x9b, 0x71]);
enum MFAudioFormat_ALAC = GUID(0x6c61, 0x0, 0x10, [0x80, 0x0, 0x0, 0xaa, 0x0, 0x38, 0x9b, 0x71]);
enum MFAudioFormat_Opus = GUID(0x704f, 0x0, 0x10, [0x80, 0x0, 0x0, 0xaa, 0x0, 0x38, 0x9b, 0x71]);
enum MFAudioFormat_Dolby_AC4 = GUID(0xac40, 0x0, 0x10, [0x80, 0x0, 0x0, 0xaa, 0x0, 0x38, 0x9b, 0x71]);
enum MFAudioFormat_Dolby_AC3 = GUID(0xe06d802c, 0xdb46, 0x11cf, [0xb4, 0xd1, 0x0, 0x80, 0x5f, 0x6c, 0xbb, 0xea]);
enum MFAudioFormat_Dolby_DDPlus = GUID(0xa7fb87af, 0x2d02, 0x42fb, [0xa4, 0xd4, 0x5, 0xcd, 0x93, 0x84, 0x3b, 0xdd]);
enum MFAudioFormat_Dolby_AC4_V1 = GUID(0x36b7927c, 0x3d87, 0x4a2a, [0x91, 0x96, 0xa2, 0x1a, 0xd9, 0xe9, 0x35, 0xe6]);
enum MFAudioFormat_Dolby_AC4_V2 = GUID(0x7998b2a0, 0x17dd, 0x49b6, [0x8d, 0xfa, 0x9b, 0x27, 0x85, 0x52, 0xa2, 0xac]);
enum MFAudioFormat_Dolby_AC4_V1_ES = GUID(0x9d8dccc6, 0xd156, 0x4fb8, [0x97, 0x9c, 0xa8, 0x5b, 0xe7, 0xd2, 0x1d, 0xfa]);
enum MFAudioFormat_Dolby_AC4_V2_ES = GUID(0x7e58c9f9, 0xb070, 0x45f4, [0x8c, 0xcd, 0xa9, 0x9a, 0x4, 0x17, 0xc1, 0xac]);
enum MFAudioFormat_Vorbis = GUID(0x8d2fd10b, 0x5841, 0x4a6b, [0x89, 0x5, 0x58, 0x8f, 0xec, 0x1a, 0xde, 0xd9]);
enum MFAudioFormat_DTS_RAW = GUID(0xe06d8033, 0xdb46, 0x11cf, [0xb4, 0xd1, 0x0, 0x80, 0x5f, 0x6c, 0xbb, 0xea]);
enum MFAudioFormat_DTS_HD = GUID(0xa2e58eb7, 0xfa9, 0x48bb, [0xa4, 0xc, 0xfa, 0xe, 0x15, 0x6d, 0x6, 0x45]);
enum MFAudioFormat_DTS_XLL = GUID(0x45b37c1b, 0x8c70, 0x4e59, [0xa7, 0xbe, 0xa1, 0xe4, 0x2c, 0x81, 0xc8, 0xd]);
enum MFAudioFormat_DTS_LBR = GUID(0xc2fe6f0a, 0x4e3c, 0x4df1, [0x9b, 0x60, 0x50, 0x86, 0x30, 0x91, 0xe4, 0xb9]);
enum MFAudioFormat_DTS_UHD = GUID(0x87020117, 0xace3, 0x42de, [0xb7, 0x3e, 0xc6, 0x56, 0x70, 0x62, 0x63, 0xf8]);
enum MFAudioFormat_DTS_UHDY = GUID(0x9b9cca00, 0x91b9, 0x4ccc, [0x88, 0x3a, 0x8f, 0x78, 0x7a, 0xc3, 0xcc, 0x86]);
enum MFAudioFormat_Float_SpatialObjects = GUID(0xfa39cd94, 0xbc64, 0x4ab1, [0x9b, 0x71, 0xdc, 0xd0, 0x9d, 0x5a, 0x7e, 0x7a]);
enum MFAudioFormat_LPCM = GUID(0xe06d8032, 0xdb46, 0x11cf, [0xb4, 0xd1, 0x0, 0x80, 0x5f, 0x6c, 0xbb, 0xea]);
enum MFAudioFormat_PCM_HDCP = GUID(0xa5e7ff01, 0x8411, 0x4acc, [0xa8, 0x65, 0x5f, 0x49, 0x41, 0x28, 0x8d, 0x80]);
enum MFAudioFormat_Dolby_AC3_HDCP = GUID(0x97663a80, 0x8ffb, 0x4445, [0xa6, 0xba, 0x79, 0x2d, 0x90, 0x8f, 0x49, 0x7f]);
enum MFAudioFormat_AAC_HDCP = GUID(0x419bce76, 0x8b72, 0x400f, [0xad, 0xeb, 0x84, 0xb5, 0x7d, 0x63, 0x48, 0x4d]);
enum MFAudioFormat_ADTS_HDCP = GUID(0xda4963a3, 0x14d8, 0x4dcf, [0x92, 0xb7, 0x19, 0x3e, 0xb8, 0x43, 0x63, 0xdb]);
enum MFAudioFormat_Base_HDCP = GUID(0x3884b5bc, 0xe277, 0x43fd, [0x98, 0x3d, 0x3, 0x8a, 0xa8, 0xd9, 0xb6, 0x5]);
enum MFVideoFormat_H264_HDCP = GUID(0x5d0ce9dd, 0x9817, 0x49da, [0xbd, 0xfd, 0xf5, 0xf5, 0xb9, 0x8f, 0x18, 0xa6]);
enum MFVideoFormat_HEVC_HDCP = GUID(0x3cfe0fe6, 0x5c4, 0x47dc, [0x9d, 0x70, 0x4b, 0xdb, 0x29, 0x59, 0x72, 0xf]);
enum MFVideoFormat_Base_HDCP = GUID(0xeac3b9d5, 0xbd14, 0x4237, [0x8f, 0x1f, 0xba, 0xb4, 0x28, 0xe4, 0x93, 0x12]);
enum MFMPEG4Format_Base = GUID(0x0, 0x767a, 0x494d, [0xb4, 0x78, 0xf2, 0x9d, 0x25, 0xdc, 0x90, 0x37]);
enum MFSubtitleFormat_XML = GUID(0x2006f94f, 0x29ca, 0x4195, [0xb8, 0xdb, 0x0, 0xde, 0xd8, 0xff, 0xc, 0x97]);
enum MFSubtitleFormat_TTML = GUID(0x73e73992, 0x9a10, 0x4356, [0x95, 0x57, 0x71, 0x94, 0xe9, 0x1e, 0x3e, 0x54]);
enum MFSubtitleFormat_ATSC = GUID(0x7fa7faa3, 0xfeae, 0x4e16, [0xae, 0xdf, 0x36, 0xb9, 0xac, 0xfb, 0xb0, 0x99]);
enum MFSubtitleFormat_WebVTT = GUID(0xc886d215, 0xf485, 0x40bb, [0x8d, 0xb6, 0xfa, 0xdb, 0xc6, 0x19, 0xa4, 0x5d]);
enum MFSubtitleFormat_SRT = GUID(0x5e467f2e, 0x77ca, 0x4ca5, [0x83, 0x91, 0xd1, 0x42, 0xed, 0x4b, 0x76, 0xc8]);
enum MFSubtitleFormat_SSA = GUID(0x57176a1b, 0x1a9e, 0x4eea, [0xab, 0xef, 0xc6, 0x17, 0x60, 0x19, 0x8a, 0xc4]);
enum MFSubtitleFormat_CustomUserData = GUID(0x1bb3d849, 0x6614, 0x4d80, [0x88, 0x82, 0xed, 0x24, 0xaa, 0x82, 0xda, 0x92]);
enum MFSubtitleFormat_PGS = GUID(0x71f40e4a, 0x1278, 0x4442, [0xb3, 0xd, 0x39, 0xdd, 0x1d, 0x77, 0x22, 0xbc]);
enum MFSubtitleFormat_VobSub = GUID(0x6b8e40f4, 0x8d2c, 0x4ced, [0xad, 0x91, 0x59, 0x60, 0xe4, 0x5b, 0x44, 0x33]);
enum MF_MT_MAJOR_TYPE = GUID(0x48eba18e, 0xf8c9, 0x4687, [0xbf, 0x11, 0xa, 0x74, 0xc9, 0xf9, 0x6a, 0x8f]);
enum MF_MT_SUBTYPE = GUID(0xf7e34c9a, 0x42e8, 0x4714, [0xb7, 0x4b, 0xcb, 0x29, 0xd7, 0x2c, 0x35, 0xe5]);
enum MF_MT_ALL_SAMPLES_INDEPENDENT = GUID(0xc9173739, 0x5e56, 0x461c, [0xb7, 0x13, 0x46, 0xfb, 0x99, 0x5c, 0xb9, 0x5f]);
enum MF_MT_FIXED_SIZE_SAMPLES = GUID(0xb8ebefaf, 0xb718, 0x4e04, [0xb0, 0xa9, 0x11, 0x67, 0x75, 0xe3, 0x32, 0x1b]);
enum MF_MT_COMPRESSED = GUID(0x3afd0cee, 0x18f2, 0x4ba5, [0xa1, 0x10, 0x8b, 0xea, 0x50, 0x2e, 0x1f, 0x92]);
enum MF_MT_SAMPLE_SIZE = GUID(0xdad3ab78, 0x1990, 0x408b, [0xbc, 0xe2, 0xeb, 0xa6, 0x73, 0xda, 0xcc, 0x10]);
enum MF_MT_WRAPPED_TYPE = GUID(0x4d3f7b23, 0xd02f, 0x4e6c, [0x9b, 0xee, 0xe4, 0xbf, 0x2c, 0x6c, 0x69, 0x5d]);
enum MF_MT_VIDEO_3D = GUID(0xcb5e88cf, 0x7b5b, 0x476b, [0x85, 0xaa, 0x1c, 0xa5, 0xae, 0x18, 0x75, 0x55]);
enum MF_MT_VIDEO_3D_FORMAT = GUID(0x5315d8a0, 0x87c5, 0x4697, [0xb7, 0x93, 0x66, 0x6, 0xc6, 0x7c, 0x4, 0x9b]);
enum MF_MT_VIDEO_3D_NUM_VIEWS = GUID(0xbb077e8a, 0xdcbf, 0x42eb, [0xaf, 0x60, 0x41, 0x8d, 0xf9, 0x8a, 0xa4, 0x95]);
enum MF_MT_VIDEO_3D_LEFT_IS_BASE = GUID(0x6d4b7bff, 0x5629, 0x4404, [0x94, 0x8c, 0xc6, 0x34, 0xf4, 0xce, 0x26, 0xd4]);
enum MF_MT_VIDEO_3D_FIRST_IS_LEFT = GUID(0xec298493, 0xada, 0x4ea1, [0xa4, 0xfe, 0xcb, 0xbd, 0x36, 0xce, 0x93, 0x31]);
enum MFSampleExtension_3DVideo = GUID(0xf86f97a4, 0xdd54, 0x4e2e, [0x9a, 0x5e, 0x55, 0xfc, 0x2d, 0x74, 0xa0, 0x5]);
enum MFSampleExtension_3DVideo_SampleFormat = GUID(0x8671772, 0xe36f, 0x4cff, [0x97, 0xb3, 0xd7, 0x2e, 0x20, 0x98, 0x7a, 0x48]);
enum MF_MT_VIDEO_ROTATION = GUID(0xc380465d, 0x2271, 0x428c, [0x9b, 0x83, 0xec, 0xea, 0x3b, 0x4a, 0x85, 0xc1]);
enum MF_DEVICESTREAM_MULTIPLEXED_MANAGER = GUID(0x6ea542b0, 0x281f, 0x4231, [0xa4, 0x64, 0xfe, 0x2f, 0x50, 0x22, 0x50, 0x1c]);
enum MF_MEDIATYPE_MULTIPLEXED_MANAGER = GUID(0x13c78fb5, 0xf275, 0x4ea0, [0xbb, 0x5f, 0x2, 0x49, 0x83, 0x2b, 0xd, 0x6e]);
enum MFSampleExtension_MULTIPLEXED_MANAGER = GUID(0x8dcdee79, 0x6b5a, 0x4c45, [0x8d, 0xb9, 0x20, 0xb3, 0x95, 0xf0, 0x2f, 0xcf]);
enum MF_MT_SECURE = GUID(0xc5acc4fd, 0x304, 0x4ecf, [0x80, 0x9f, 0x47, 0xbc, 0x97, 0xff, 0x63, 0xbd]);
enum MF_DEVICESTREAM_ATTRIBUTE_FRAMESOURCE_TYPES = GUID(0x17145fd1, 0x1b2b, 0x423c, [0x80, 0x1, 0x2b, 0x68, 0x33, 0xed, 0x35, 0x88]);
enum MF_MT_ALPHA_MODE = GUID(0x5d959b0d, 0x4cbf, 0x4d04, [0x91, 0x9f, 0x3f, 0x5f, 0x7f, 0x28, 0x42, 0x11]);
enum MF_MT_DEPTH_MEASUREMENT = GUID(0xfd5ac489, 0x917, 0x4bb6, [0x9d, 0x54, 0x31, 0x22, 0xbf, 0x70, 0x14, 0x4b]);
enum MF_MT_DEPTH_VALUE_UNIT = GUID(0x21a800f5, 0x3189, 0x4797, [0xbe, 0xba, 0xf1, 0x3c, 0xd9, 0xa3, 0x1a, 0x5e]);
enum MF_MT_VIDEO_NO_FRAME_ORDERING = GUID(0x3f5b106f, 0x6bc2, 0x4ee3, [0xb7, 0xed, 0x89, 0x2, 0xc1, 0x8f, 0x53, 0x51]);
enum MF_MT_VIDEO_H264_NO_FMOASO = GUID(0xed461cd6, 0xec9f, 0x416a, [0xa8, 0xa3, 0x26, 0xd7, 0xd3, 0x10, 0x18, 0xd7]);
enum MFSampleExtension_ForwardedDecodeUnits = GUID(0x424c754c, 0x97c8, 0x48d6, [0x87, 0x77, 0xfc, 0x41, 0xf7, 0xb6, 0x8, 0x79]);
enum MFSampleExtension_TargetGlobalLuminance = GUID(0x3f60ef36, 0x31ef, 0x4daf, [0x83, 0x60, 0x94, 0x3, 0x97, 0xe4, 0x1e, 0xf3]);
enum MFSampleExtension_ForwardedDecodeUnitType = GUID(0x89e57c7, 0x47d3, 0x4a26, [0xbf, 0x9c, 0x4b, 0x64, 0xfa, 0xfb, 0x5d, 0x1e]);
enum MF_MT_FORWARD_CUSTOM_NALU = GUID(0xed336efd, 0x244f, 0x428d, [0x91, 0x53, 0x28, 0xf3, 0x99, 0x45, 0x88, 0x90]);
enum MF_MT_FORWARD_CUSTOM_SEI = GUID(0xe27362f1, 0xb136, 0x41d1, [0x95, 0x94, 0x3a, 0x7e, 0x4f, 0xeb, 0xf2, 0xd1]);
enum MF_MT_VIDEO_RENDERER_EXTENSION_PROFILE = GUID(0x8437d4b9, 0xd448, 0x4fcd, [0x9b, 0x6b, 0x83, 0x9b, 0xf9, 0x6c, 0x77, 0x98]);
enum MF_DECODER_FWD_CUSTOM_SEI_DECODE_ORDER = GUID(0xf13bbe3c, 0x36d4, 0x410a, [0xb9, 0x85, 0x7a, 0x95, 0x1a, 0x1e, 0x62, 0x94]);
enum MF_VIDEO_RENDERER_EFFECT_APP_SERVICE_NAME = GUID(0xc6052a80, 0x6d9c, 0x40a3, [0x9d, 0xb8, 0xf0, 0x27, 0xa2, 0x5c, 0x9a, 0xb9]);
enum MF_MT_AUDIO_NUM_CHANNELS = GUID(0x37e48bf5, 0x645e, 0x4c5b, [0x89, 0xde, 0xad, 0xa9, 0xe2, 0x9b, 0x69, 0x6a]);
enum MF_MT_AUDIO_SAMPLES_PER_SECOND = GUID(0x5faeeae7, 0x290, 0x4c31, [0x9e, 0x8a, 0xc5, 0x34, 0xf6, 0x8d, 0x9d, 0xba]);
enum MF_MT_AUDIO_FLOAT_SAMPLES_PER_SECOND = GUID(0xfb3b724a, 0xcfb5, 0x4319, [0xae, 0xfe, 0x6e, 0x42, 0xb2, 0x40, 0x61, 0x32]);
enum MF_MT_AUDIO_AVG_BYTES_PER_SECOND = GUID(0x1aab75c8, 0xcfef, 0x451c, [0xab, 0x95, 0xac, 0x3, 0x4b, 0x8e, 0x17, 0x31]);
enum MF_MT_AUDIO_BLOCK_ALIGNMENT = GUID(0x322de230, 0x9eeb, 0x43bd, [0xab, 0x7a, 0xff, 0x41, 0x22, 0x51, 0x54, 0x1d]);
enum MF_MT_AUDIO_BITS_PER_SAMPLE = GUID(0xf2deb57f, 0x40fa, 0x4764, [0xaa, 0x33, 0xed, 0x4f, 0x2d, 0x1f, 0xf6, 0x69]);
enum MF_MT_AUDIO_VALID_BITS_PER_SAMPLE = GUID(0xd9bf8d6a, 0x9530, 0x4b7c, [0x9d, 0xdf, 0xff, 0x6f, 0xd5, 0x8b, 0xbd, 0x6]);
enum MF_MT_AUDIO_SAMPLES_PER_BLOCK = GUID(0xaab15aac, 0xe13a, 0x4995, [0x92, 0x22, 0x50, 0x1e, 0xa1, 0x5c, 0x68, 0x77]);
enum MF_MT_AUDIO_CHANNEL_MASK = GUID(0x55fb5765, 0x644a, 0x4caf, [0x84, 0x79, 0x93, 0x89, 0x83, 0xbb, 0x15, 0x88]);
enum MF_MT_AUDIO_FOLDDOWN_MATRIX = GUID(0x9d62927c, 0x36be, 0x4cf2, [0xb5, 0xc4, 0xa3, 0x92, 0x6e, 0x3e, 0x87, 0x11]);
enum MF_MT_AUDIO_WMADRC_PEAKREF = GUID(0x9d62927d, 0x36be, 0x4cf2, [0xb5, 0xc4, 0xa3, 0x92, 0x6e, 0x3e, 0x87, 0x11]);
enum MF_MT_AUDIO_WMADRC_PEAKTARGET = GUID(0x9d62927e, 0x36be, 0x4cf2, [0xb5, 0xc4, 0xa3, 0x92, 0x6e, 0x3e, 0x87, 0x11]);
enum MF_MT_AUDIO_WMADRC_AVGREF = GUID(0x9d62927f, 0x36be, 0x4cf2, [0xb5, 0xc4, 0xa3, 0x92, 0x6e, 0x3e, 0x87, 0x11]);
enum MF_MT_AUDIO_WMADRC_AVGTARGET = GUID(0x9d629280, 0x36be, 0x4cf2, [0xb5, 0xc4, 0xa3, 0x92, 0x6e, 0x3e, 0x87, 0x11]);
enum MF_MT_AUDIO_PREFER_WAVEFORMATEX = GUID(0xa901aaba, 0xe037, 0x458a, [0xbd, 0xf6, 0x54, 0x5b, 0xe2, 0x7, 0x40, 0x42]);
enum MF_MT_AAC_PAYLOAD_TYPE = GUID(0xbfbabe79, 0x7434, 0x4d1c, [0x94, 0xf0, 0x72, 0xa3, 0xb9, 0xe1, 0x71, 0x88]);
enum MF_MT_AAC_AUDIO_PROFILE_LEVEL_INDICATION = GUID(0x7632f0e6, 0x9538, 0x4d61, [0xac, 0xda, 0xea, 0x29, 0xc8, 0xc1, 0x44, 0x56]);
enum MF_MT_AUDIO_FLAC_MAX_BLOCK_SIZE = GUID(0x8b81adae, 0x4b5a, 0x4d40, [0x80, 0x22, 0xf3, 0x8d, 0x9, 0xca, 0x3c, 0x5c]);
enum MF_MT_SPATIAL_AUDIO_MAX_DYNAMIC_OBJECTS = GUID(0xdcfba24a, 0x2609, 0x4240, [0xa7, 0x21, 0x3f, 0xae, 0xa7, 0x6a, 0x4d, 0xf9]);
enum MF_MT_SPATIAL_AUDIO_OBJECT_METADATA_FORMAT_ID = GUID(0x2ab71bc0, 0x6223, 0x4ba7, [0xad, 0x64, 0x7b, 0x94, 0xb4, 0x7a, 0xe7, 0x92]);
enum MF_MT_SPATIAL_AUDIO_OBJECT_METADATA_LENGTH = GUID(0x94ba8be, 0xd723, 0x489f, [0x92, 0xfa, 0x76, 0x67, 0x77, 0xb3, 0x47, 0x26]);
enum MF_MT_SPATIAL_AUDIO_MAX_METADATA_ITEMS = GUID(0x11aa80b4, 0xe0da, 0x47c6, [0x80, 0x60, 0x96, 0xc1, 0x25, 0x9a, 0xe5, 0xd]);
enum MF_MT_SPATIAL_AUDIO_MIN_METADATA_ITEM_OFFSET_SPACING = GUID(0x83e96ec9, 0x1184, 0x417e, [0x82, 0x54, 0x9f, 0x26, 0x91, 0x58, 0xfc, 0x6]);
enum MF_MT_SPATIAL_AUDIO_DATA_PRESENT = GUID(0x6842f6e7, 0xd43e, 0x4ebb, [0x9c, 0x9c, 0xc9, 0x6f, 0x41, 0x78, 0x48, 0x63]);
enum MF_MT_FRAME_SIZE = GUID(0x1652c33d, 0xd6b2, 0x4012, [0xb8, 0x34, 0x72, 0x3, 0x8, 0x49, 0xa3, 0x7d]);
enum MF_MT_FRAME_RATE = GUID(0xc459a2e8, 0x3d2c, 0x4e44, [0xb1, 0x32, 0xfe, 0xe5, 0x15, 0x6c, 0x7b, 0xb0]);
enum MF_MT_PIXEL_ASPECT_RATIO = GUID(0xc6376a1e, 0x8d0a, 0x4027, [0xbe, 0x45, 0x6d, 0x9a, 0xa, 0xd3, 0x9b, 0xb6]);
enum MF_MT_DRM_FLAGS = GUID(0x8772f323, 0x355a, 0x4cc7, [0xbb, 0x78, 0x6d, 0x61, 0xa0, 0x48, 0xae, 0x82]);
enum MF_MT_TIMESTAMP_CAN_BE_DTS = GUID(0x24974215, 0x1b7b, 0x41e4, [0x86, 0x25, 0xac, 0x46, 0x9f, 0x2d, 0xed, 0xaa]);
enum MF_MT_PAD_CONTROL_FLAGS = GUID(0x4d0e73e5, 0x80ea, 0x4354, [0xa9, 0xd0, 0x11, 0x76, 0xce, 0xb0, 0x28, 0xea]);
enum MF_MT_SOURCE_CONTENT_HINT = GUID(0x68aca3cc, 0x22d0, 0x44e6, [0x85, 0xf8, 0x28, 0x16, 0x71, 0x97, 0xfa, 0x38]);
enum MF_MT_VIDEO_CHROMA_SITING = GUID(0x65df2370, 0xc773, 0x4c33, [0xaa, 0x64, 0x84, 0x3e, 0x6, 0x8e, 0xfb, 0xc]);
enum MF_MT_INTERLACE_MODE = GUID(0xe2724bb8, 0xe676, 0x4806, [0xb4, 0xb2, 0xa8, 0xd6, 0xef, 0xb4, 0x4c, 0xcd]);
enum MF_MT_TRANSFER_FUNCTION = GUID(0x5fb0fce9, 0xbe5c, 0x4935, [0xa8, 0x11, 0xec, 0x83, 0x8f, 0x8e, 0xed, 0x93]);
enum MF_MT_VIDEO_PRIMARIES = GUID(0xdbfbe4d7, 0x740, 0x4ee0, [0x81, 0x92, 0x85, 0xa, 0xb0, 0xe2, 0x19, 0x35]);
enum MF_MT_MAX_LUMINANCE_LEVEL = GUID(0x50253128, 0xc110, 0x4de4, [0x98, 0xae, 0x46, 0xa3, 0x24, 0xfa, 0xe6, 0xda]);
enum MF_MT_MAX_FRAME_AVERAGE_LUMINANCE_LEVEL = GUID(0x58d4bf57, 0x6f52, 0x4733, [0xa1, 0x95, 0xa9, 0xe2, 0x9e, 0xcf, 0x9e, 0x27]);
enum MF_MT_MAX_MASTERING_LUMINANCE = GUID(0xd6c6b997, 0x272f, 0x4ca1, [0x8d, 0x0, 0x80, 0x42, 0x11, 0x1a, 0xf, 0xf6]);
enum MF_MT_MIN_MASTERING_LUMINANCE = GUID(0x839a4460, 0x4e7e, 0x4b4f, [0xae, 0x79, 0xcc, 0x8, 0x90, 0x5c, 0x7b, 0x27]);
enum MF_MT_DECODER_USE_MAX_RESOLUTION = GUID(0x4c547c24, 0xaf9a, 0x4f38, [0x96, 0xad, 0x97, 0x87, 0x73, 0xcf, 0x53, 0xe7]);
enum MF_MT_DECODER_MAX_DPB_COUNT = GUID(0x67be144c, 0x88b7, 0x4ca9, [0x96, 0x28, 0xc8, 0x8, 0xd5, 0x26, 0x22, 0x17]);
enum MF_MT_CUSTOM_VIDEO_PRIMARIES = GUID(0x47537213, 0x8cfb, 0x4722, [0xaa, 0x34, 0xfb, 0xc9, 0xe2, 0x4d, 0x77, 0xb8]);
enum MF_MT_YUV_MATRIX = GUID(0x3e23d450, 0x2c75, 0x4d25, [0xa0, 0xe, 0xb9, 0x16, 0x70, 0xd1, 0x23, 0x27]);
enum MF_MT_VIDEO_LIGHTING = GUID(0x53a0529c, 0x890b, 0x4216, [0x8b, 0xf9, 0x59, 0x93, 0x67, 0xad, 0x6d, 0x20]);
enum MF_MT_VIDEO_NOMINAL_RANGE = GUID(0xc21b8ee5, 0xb956, 0x4071, [0x8d, 0xaf, 0x32, 0x5e, 0xdf, 0x5c, 0xab, 0x11]);
enum MF_MT_GEOMETRIC_APERTURE = GUID(0x66758743, 0x7e5f, 0x400d, [0x98, 0xa, 0xaa, 0x85, 0x96, 0xc8, 0x56, 0x96]);
enum MF_MT_MINIMUM_DISPLAY_APERTURE = GUID(0xd7388766, 0x18fe, 0x48c6, [0xa1, 0x77, 0xee, 0x89, 0x48, 0x67, 0xc8, 0xc4]);
enum MF_MT_PAN_SCAN_APERTURE = GUID(0x79614dde, 0x9187, 0x48fb, [0xb8, 0xc7, 0x4d, 0x52, 0x68, 0x9d, 0xe6, 0x49]);
enum MF_MT_PAN_SCAN_ENABLED = GUID(0x4b7f6bc3, 0x8b13, 0x40b2, [0xa9, 0x93, 0xab, 0xf6, 0x30, 0xb8, 0x20, 0x4e]);
enum MF_MT_AVG_BITRATE = GUID(0x20332624, 0xfb0d, 0x4d9e, [0xbd, 0xd, 0xcb, 0xf6, 0x78, 0x6c, 0x10, 0x2e]);
enum MF_MT_AVG_BIT_ERROR_RATE = GUID(0x799cabd6, 0x3508, 0x4db4, [0xa3, 0xc7, 0x56, 0x9c, 0xd5, 0x33, 0xde, 0xb1]);
enum MF_MT_MAX_KEYFRAME_SPACING = GUID(0xc16eb52b, 0x73a1, 0x476f, [0x8d, 0x62, 0x83, 0x9d, 0x6a, 0x2, 0x6, 0x52]);
enum MF_MT_USER_DATA = GUID(0xb6bc765f, 0x4c3b, 0x40a4, [0xbd, 0x51, 0x25, 0x35, 0xb6, 0x6f, 0xe0, 0x9d]);
enum MF_MT_OUTPUT_BUFFER_NUM = GUID(0xa505d3ac, 0xf930, 0x436e, [0x8e, 0xde, 0x93, 0xa5, 0x9, 0xce, 0x23, 0xb2]);
enum MF_MT_REALTIME_CONTENT = GUID(0xbb12d222, 0x2bdb, 0x425e, [0x91, 0xec, 0x23, 0x8, 0xe1, 0x89, 0xa5, 0x8f]);
enum MF_MT_DEFAULT_STRIDE = GUID(0x644b4e48, 0x1e02, 0x4516, [0xb0, 0xeb, 0xc0, 0x1c, 0xa9, 0xd4, 0x9a, 0xc6]);
enum MF_MT_PALETTE = GUID(0x6d283f42, 0x9846, 0x4410, [0xaf, 0xd9, 0x65, 0x4d, 0x50, 0x3b, 0x1a, 0x54]);
enum MF_MT_AM_FORMAT_TYPE = GUID(0x73d1072d, 0x1870, 0x4174, [0xa0, 0x63, 0x29, 0xff, 0x4f, 0xf6, 0xc1, 0x1e]);
enum MF_MT_VIDEO_PROFILE = GUID(0xad76a80b, 0x2d5c, 0x4e0b, [0xb3, 0x75, 0x64, 0xe5, 0x20, 0x13, 0x70, 0x36]);
enum MF_MT_VIDEO_LEVEL = GUID(0x96f66574, 0x11c5, 0x4015, [0x86, 0x66, 0xbf, 0xf5, 0x16, 0x43, 0x6d, 0xa7]);
enum MF_MT_MPEG_START_TIME_CODE = GUID(0x91f67885, 0x4333, 0x4280, [0x97, 0xcd, 0xbd, 0x5a, 0x6c, 0x3, 0xa0, 0x6e]);
enum MF_MT_MPEG2_PROFILE = GUID(0xad76a80b, 0x2d5c, 0x4e0b, [0xb3, 0x75, 0x64, 0xe5, 0x20, 0x13, 0x70, 0x36]);
enum MF_MT_MPEG2_LEVEL = GUID(0x96f66574, 0x11c5, 0x4015, [0x86, 0x66, 0xbf, 0xf5, 0x16, 0x43, 0x6d, 0xa7]);
enum MF_MT_MPEG2_FLAGS = GUID(0x31e3991d, 0xf701, 0x4b2f, [0xb4, 0x26, 0x8a, 0xe3, 0xbd, 0xa9, 0xe0, 0x4b]);
enum MF_MT_MPEG_SEQUENCE_HEADER = GUID(0x3c036de7, 0x3ad0, 0x4c9e, [0x92, 0x16, 0xee, 0x6d, 0x6a, 0xc2, 0x1c, 0xb3]);
enum MF_MT_MPEG2_STANDARD = GUID(0xa20af9e8, 0x928a, 0x4b26, [0xaa, 0xa9, 0xf0, 0x5c, 0x74, 0xca, 0xc4, 0x7c]);
enum MF_MT_MPEG2_TIMECODE = GUID(0x5229ba10, 0xe29d, 0x4f80, [0xa5, 0x9c, 0xdf, 0x4f, 0x18, 0x2, 0x7, 0xd2]);
enum MF_MT_MPEG2_CONTENT_PACKET = GUID(0x825d55e4, 0x4f12, 0x4197, [0x9e, 0xb3, 0x59, 0xb6, 0xe4, 0x71, 0xf, 0x6]);
enum MF_MT_MPEG2_ONE_FRAME_PER_PACKET = GUID(0x91a49eb5, 0x1d20, 0x4b42, [0xac, 0xe8, 0x80, 0x42, 0x69, 0xbf, 0x95, 0xed]);
enum MF_MT_MPEG2_HDCP = GUID(0x168f1b4a, 0x3e91, 0x450f, [0xae, 0xa7, 0xe4, 0xba, 0xea, 0xda, 0xe5, 0xba]);
enum MF_MT_H264_MAX_CODEC_CONFIG_DELAY = GUID(0xf5929986, 0x4c45, 0x4fbb, [0xbb, 0x49, 0x6c, 0xc5, 0x34, 0xd0, 0x5b, 0x9b]);
enum MF_MT_H264_SUPPORTED_SLICE_MODES = GUID(0xc8be1937, 0x4d64, 0x4549, [0x83, 0x43, 0xa8, 0x8, 0x6c, 0xb, 0xfd, 0xa5]);
enum MF_MT_H264_SUPPORTED_SYNC_FRAME_TYPES = GUID(0x89a52c01, 0xf282, 0x48d2, [0xb5, 0x22, 0x22, 0xe6, 0xae, 0x63, 0x31, 0x99]);
enum MF_MT_H264_RESOLUTION_SCALING = GUID(0xe3854272, 0xf715, 0x4757, [0xba, 0x90, 0x1b, 0x69, 0x6c, 0x77, 0x34, 0x57]);
enum MF_MT_H264_SIMULCAST_SUPPORT = GUID(0x9ea2d63d, 0x53f0, 0x4a34, [0xb9, 0x4e, 0x9d, 0xe4, 0x9a, 0x7, 0x8c, 0xb3]);
enum MF_MT_H264_SUPPORTED_RATE_CONTROL_MODES = GUID(0x6a8ac47e, 0x519c, 0x4f18, [0x9b, 0xb3, 0x7e, 0xea, 0xae, 0xa5, 0x59, 0x4d]);
enum MF_MT_H264_MAX_MB_PER_SEC = GUID(0x45256d30, 0x7215, 0x4576, [0x93, 0x36, 0xb0, 0xf1, 0xbc, 0xd5, 0x9b, 0xb2]);
enum MF_MT_H264_SUPPORTED_USAGES = GUID(0x60b1a998, 0xdc01, 0x40ce, [0x97, 0x36, 0xab, 0xa8, 0x45, 0xa2, 0xdb, 0xdc]);
enum MF_MT_H264_CAPABILITIES = GUID(0xbb3bd508, 0x490a, 0x11e0, [0x99, 0xe4, 0x13, 0x16, 0xdf, 0xd7, 0x20, 0x85]);
enum MF_MT_H264_SVC_CAPABILITIES = GUID(0xf8993abe, 0xd937, 0x4a8f, [0xbb, 0xca, 0x69, 0x66, 0xfe, 0x9e, 0x11, 0x52]);
enum MF_MT_H264_USAGE = GUID(0x359ce3a5, 0xaf00, 0x49ca, [0xa2, 0xf4, 0x2a, 0xc9, 0x4c, 0xa8, 0x2b, 0x61]);
enum MF_MT_H264_RATE_CONTROL_MODES = GUID(0x705177d8, 0x45cb, 0x11e0, [0xac, 0x7d, 0xb9, 0x1c, 0xe0, 0xd7, 0x20, 0x85]);
enum MF_MT_H264_LAYOUT_PER_STREAM = GUID(0x85e299b2, 0x90e3, 0x4fe8, [0xb2, 0xf5, 0xc0, 0x67, 0xe0, 0xbf, 0xe5, 0x7a]);
enum MF_MT_IN_BAND_PARAMETER_SET = GUID(0x75da5090, 0x910b, 0x4a03, [0x89, 0x6c, 0x7b, 0x89, 0x8f, 0xee, 0xa5, 0xaf]);
enum MF_MT_MPEG4_TRACK_TYPE = GUID(0x54f486dd, 0x9327, 0x4f6d, [0x80, 0xab, 0x6f, 0x70, 0x9e, 0xbb, 0x4c, 0xce]);
enum MF_MT_CONTAINER_RATE_SCALING = GUID(0x83877f5e, 0x444, 0x4e28, [0x84, 0x79, 0x6d, 0xb0, 0x98, 0x9b, 0x8c, 0x9]);
enum MF_MT_DV_AAUX_SRC_PACK_0 = GUID(0x84bd5d88, 0xfb8, 0x4ac8, [0xbe, 0x4b, 0xa8, 0x84, 0x8b, 0xef, 0x98, 0xf3]);
enum MF_MT_DV_AAUX_CTRL_PACK_0 = GUID(0xf731004e, 0x1dd1, 0x4515, [0xaa, 0xbe, 0xf0, 0xc0, 0x6a, 0xa5, 0x36, 0xac]);
enum MF_MT_DV_AAUX_SRC_PACK_1 = GUID(0x720e6544, 0x225, 0x4003, [0xa6, 0x51, 0x1, 0x96, 0x56, 0x3a, 0x95, 0x8e]);
enum MF_MT_DV_AAUX_CTRL_PACK_1 = GUID(0xcd1f470d, 0x1f04, 0x4fe0, [0xbf, 0xb9, 0xd0, 0x7a, 0xe0, 0x38, 0x6a, 0xd8]);
enum MF_MT_DV_VAUX_SRC_PACK = GUID(0x41402d9d, 0x7b57, 0x43c6, [0xb1, 0x29, 0x2c, 0xb9, 0x97, 0xf1, 0x50, 0x9]);
enum MF_MT_DV_VAUX_CTRL_PACK = GUID(0x2f84e1c4, 0xda1, 0x4788, [0x93, 0x8e, 0xd, 0xfb, 0xfb, 0xb3, 0x4b, 0x48]);
enum MF_MT_ARBITRARY_HEADER = GUID(0x9e6bd6f5, 0x109, 0x4f95, [0x84, 0xac, 0x93, 0x9, 0x15, 0x3a, 0x19, 0xfc]);
enum MF_MT_ARBITRARY_FORMAT = GUID(0x5a75b249, 0xd7d, 0x49a1, [0xa1, 0xc3, 0xe0, 0xd8, 0x7f, 0xc, 0xad, 0xe5]);
enum MF_MT_IMAGE_LOSS_TOLERANT = GUID(0xed062cf4, 0xe34e, 0x4922, [0xbe, 0x99, 0x93, 0x40, 0x32, 0x13, 0x3d, 0x7c]);
enum MF_MT_MPEG4_SAMPLE_DESCRIPTION = GUID(0x261e9d83, 0x9529, 0x4b8f, [0xa1, 0x11, 0x8b, 0x9c, 0x95, 0xa, 0x81, 0xa9]);
enum MF_MT_MPEG4_CURRENT_SAMPLE_ENTRY = GUID(0x9aa7e155, 0xb64a, 0x4c1d, [0xa5, 0x0, 0x45, 0x5d, 0x60, 0xb, 0x65, 0x60]);
enum MF_SD_AMBISONICS_SAMPLE3D_DESCRIPTION = GUID(0xf715cf3e, 0xa964, 0x4c3f, [0x94, 0xae, 0x9d, 0x6b, 0xa7, 0x26, 0x46, 0x41]);
enum MF_MT_ORIGINAL_4CC = GUID(0xd7be3fe0, 0x2bc7, 0x492d, [0xb8, 0x43, 0x61, 0xa1, 0x91, 0x9b, 0x70, 0xc3]);
enum MF_MT_ORIGINAL_WAVE_FORMAT_TAG = GUID(0x8cbbc843, 0x9fd9, 0x49c2, [0x88, 0x2f, 0xa7, 0x25, 0x86, 0xc4, 0x8, 0xad]);
enum MF_MT_FRAME_RATE_RANGE_MIN = GUID(0xd2e7558c, 0xdc1f, 0x403f, [0x9a, 0x72, 0xd2, 0x8b, 0xb1, 0xeb, 0x3b, 0x5e]);
enum MF_MT_FRAME_RATE_RANGE_MAX = GUID(0xe3371d41, 0xb4cf, 0x4a05, [0xbd, 0x4e, 0x20, 0xb8, 0x8b, 0xb2, 0xc4, 0xd6]);
enum MF_LOW_LATENCY = GUID(0x9c27891a, 0xed7a, 0x40e1, [0x88, 0xe8, 0xb2, 0x27, 0x27, 0xa0, 0x24, 0xee]);
enum MF_VIDEO_MAX_MB_PER_SEC = GUID(0xe3f2e203, 0xd445, 0x4b8c, [0x92, 0x11, 0xae, 0x39, 0xd, 0x3b, 0xa0, 0x17]);
enum MF_DISABLE_FRAME_CORRUPTION_INFO = GUID(0x7086e16c, 0x49c5, 0x4201, [0x88, 0x2a, 0x85, 0x38, 0xf3, 0x8c, 0xf1, 0x3a]);
enum MFStreamExtension_CameraExtrinsics = GUID(0x686196d0, 0x13e2, 0x41d9, [0x96, 0x38, 0xef, 0x3, 0x2c, 0x27, 0x2a, 0x52]);
enum MFSampleExtension_CameraExtrinsics = GUID(0x6b761658, 0xb7ec, 0x4c3b, [0x82, 0x25, 0x86, 0x23, 0xca, 0xbe, 0xc3, 0x1d]);
enum MFStreamExtension_PinholeCameraIntrinsics = GUID(0xdbac0455, 0xec8, 0x4aef, [0x9c, 0x32, 0x7a, 0x3e, 0xe3, 0x45, 0x6f, 0x53]);
enum MFSampleExtension_PinholeCameraIntrinsics = GUID(0x4ee3b6c5, 0x6a15, 0x4e72, [0x97, 0x61, 0x70, 0xc1, 0xdb, 0x8b, 0x9f, 0xe3]);
enum MFMediaType_Default = GUID(0x81a412e6, 0x8103, 0x4b06, [0x85, 0x7f, 0x18, 0x62, 0x78, 0x10, 0x24, 0xac]);
enum MFMediaType_Audio = GUID(0x73647561, 0x0, 0x10, [0x80, 0x0, 0x0, 0xaa, 0x0, 0x38, 0x9b, 0x71]);
enum MFMediaType_Video = GUID(0x73646976, 0x0, 0x10, [0x80, 0x0, 0x0, 0xaa, 0x0, 0x38, 0x9b, 0x71]);
enum MFMediaType_Protected = GUID(0x7b4b6fe6, 0x9d04, 0x4494, [0xbe, 0x14, 0x7e, 0xb, 0xd0, 0x76, 0xc8, 0xe4]);
enum MFMediaType_SAMI = GUID(0xe69669a0, 0x3dcd, 0x40cb, [0x9e, 0x2e, 0x37, 0x8, 0x38, 0x7c, 0x6, 0x16]);
enum MFMediaType_Script = GUID(0x72178c22, 0xe45b, 0x11d5, [0xbc, 0x2a, 0x0, 0xb0, 0xd0, 0xf3, 0xf4, 0xab]);
enum MFMediaType_Image = GUID(0x72178c23, 0xe45b, 0x11d5, [0xbc, 0x2a, 0x0, 0xb0, 0xd0, 0xf3, 0xf4, 0xab]);
enum MFMediaType_HTML = GUID(0x72178c24, 0xe45b, 0x11d5, [0xbc, 0x2a, 0x0, 0xb0, 0xd0, 0xf3, 0xf4, 0xab]);
enum MFMediaType_Binary = GUID(0x72178c25, 0xe45b, 0x11d5, [0xbc, 0x2a, 0x0, 0xb0, 0xd0, 0xf3, 0xf4, 0xab]);
enum MFMediaType_FileTransfer = GUID(0x72178c26, 0xe45b, 0x11d5, [0xbc, 0x2a, 0x0, 0xb0, 0xd0, 0xf3, 0xf4, 0xab]);
enum MFMediaType_Stream = GUID(0xe436eb83, 0x524f, 0x11ce, [0x9f, 0x53, 0x0, 0x20, 0xaf, 0xb, 0xa7, 0x70]);
enum MFMediaType_MultiplexedFrames = GUID(0x6ea542b0, 0x281f, 0x4231, [0xa4, 0x64, 0xfe, 0x2f, 0x50, 0x22, 0x50, 0x1c]);
enum MFMediaType_Subtitle = GUID(0xa6d13581, 0xed50, 0x4e65, [0xae, 0x8, 0x26, 0x6, 0x55, 0x76, 0xaa, 0xcc]);
enum MFMediaType_Perception = GUID(0x597ff6f9, 0x6ea2, 0x4670, [0x85, 0xb4, 0xea, 0x84, 0x7, 0x3f, 0xe9, 0x40]);
enum MFImageFormat_JPEG = GUID(0x19e4a5aa, 0x5662, 0x4fc5, [0xa0, 0xc0, 0x17, 0x58, 0x2, 0x8e, 0x10, 0x57]);
enum MFImageFormat_RGB32 = GUID(0x16, 0x0, 0x10, [0x80, 0x0, 0x0, 0xaa, 0x0, 0x38, 0x9b, 0x71]);
enum MFStreamFormat_MPEG2Transport = GUID(0xe06d8023, 0xdb46, 0x11cf, [0xb4, 0xd1, 0x0, 0x80, 0x5f, 0x6c, 0xbb, 0xea]);
enum MFStreamFormat_MPEG2Program = GUID(0x263067d1, 0xd330, 0x45dc, [0xb6, 0x69, 0x34, 0xd9, 0x86, 0xe4, 0xe3, 0xe1]);
enum AM_MEDIA_TYPE_REPRESENTATION = GUID(0xe2e42ad2, 0x132c, 0x491e, [0xa2, 0x68, 0x3c, 0x7c, 0x2d, 0xca, 0x18, 0x1f]);
enum FORMAT_MFVideoFormat = GUID(0xaed4ab2d, 0x7326, 0x43cb, [0x94, 0x64, 0xc8, 0x79, 0xca, 0xb9, 0xc4, 0x3d]);
enum MFMediaType_Metadata = GUID(0x2c8fa20c, 0x82bb, 0x4782, [0x90, 0xa0, 0x98, 0xa2, 0xa5, 0xbd, 0x8e, 0xf8]);
enum CLSID_MFSourceResolver = GUID(0x90eab60f, 0xe43a, 0x4188, [0xbc, 0xc4, 0xe4, 0x7f, 0xdf, 0x4, 0x86, 0x8c]);
enum MF_DEVICESTREAM_ATTRIBUTE_FACEAUTH_CAPABILITY = GUID(0xcb6fd12a, 0x2248, 0x4e41, [0xad, 0x46, 0xe7, 0x8b, 0xb9, 0xa, 0xb9, 0xfc]);
enum MF_DEVICESTREAM_ATTRIBUTE_SECURE_CAPABILITY = GUID(0x940fd626, 0xea6e, 0x4684, [0x98, 0x40, 0x36, 0xbd, 0x6e, 0xc9, 0xfb, 0xef]);
enum MEDIASINK_FIXED_STREAMS = 0x00000001;
enum MEDIASINK_CANNOT_MATCH_CLOCK = 0x00000002;
enum MEDIASINK_RATELESS = 0x00000004;
enum MEDIASINK_CLOCK_REQUIRED = 0x00000008;
enum MEDIASINK_CAN_PREROLL = 0x00000010;
enum MEDIASINK_REQUIRE_REFERENCE_MEDIATYPE = 0x00000020;
enum MFCLOCK_FREQUENCY_HNS = 0x00989680;
enum MFCLOCK_TOLERANCE_UNKNOWN = 0x0000c350;
enum MFCLOCK_JITTER_ISR = 0x000003e8;
enum MFCLOCK_JITTER_DPC = 0x00000fa0;
enum MFCLOCK_JITTER_PASSIVE = 0x00002710;
enum PRESENTATION_CURRENT_POSITION = 0x7fffffffffffffff;
enum MF_PD_ADAPTIVE_STREAMING = GUID(0xea0d5d97, 0x29f9, 0x488b, [0xae, 0x6b, 0x7d, 0x6b, 0x41, 0x36, 0x11, 0x2b]);
enum MF_AUDIO_RENDERER_ATTRIBUTE_FLAGS_CROSSPROCESS = 0x00000001;
enum MF_AUDIO_RENDERER_ATTRIBUTE_FLAGS_NOPERSIST = 0x00000002;
enum MF_AUDIO_RENDERER_ATTRIBUTE_FLAGS_DONT_ALLOW_FORMAT_CHANGES = 0x00000004;
enum MFRR_INFO_VERSION = 0x00000000;
enum MF_USER_MODE_COMPONENT_LOAD = 0x00000001;
enum MF_KERNEL_MODE_COMPONENT_LOAD = 0x00000002;
enum MF_GRL_LOAD_FAILED = 0x00000010;
enum MF_INVALID_GRL_SIGNATURE = 0x00000020;
enum MF_GRL_ABSENT = 0x00001000;
enum MF_COMPONENT_REVOKED = 0x00002000;
enum MF_COMPONENT_INVALID_EKU = 0x00004000;
enum MF_COMPONENT_CERT_REVOKED = 0x00008000;
enum MF_COMPONENT_INVALID_ROOT = 0x00010000;
enum MF_COMPONENT_HS_CERT_REVOKED = 0x00020000;
enum MF_COMPONENT_LS_CERT_REVOKED = 0x00040000;
enum MF_BOOT_DRIVER_VERIFICATION_FAILED = 0x00100000;
enum MF_TEST_SIGNED_COMPONENT_LOADING = 0x01000000;
enum MF_MINCRYPT_FAILURE = 0x10000000;
enum SHA_HASH_LEN = 0x00000014;
enum MFSEQUENCER_INVALID_ELEMENT_ID = 0xffffffff;
enum MF_WRAPPED_BUFFER_SERVICE = GUID(0xab544072, 0xc269, 0x4ebc, [0xa5, 0x52, 0x1c, 0x3b, 0x32, 0xbe, 0xd5, 0xca]);
enum CLSID_MPEG2ByteStreamPlugin = GUID(0x40871c59, 0xab40, 0x471f, [0x8d, 0xc3, 0x1f, 0x25, 0x9d, 0x86, 0x24, 0x79]);
enum MFCONTENTPROTECTIONDEVICE_FUNCTIONID_START = 0x04000000;
enum MFCONTENTPROTECTIONDEVICE_REALTIMECLIENT_DATA_FUNCTIONID = 0x04000000;
enum MF_UNKNOWN_DURATION = 0x00000000;
enum MFStreamExtension_ExtendedCameraIntrinsics = GUID(0xaa74b3df, 0x9a2c, 0x48d6, [0x83, 0x93, 0x5b, 0xd1, 0xc1, 0xa8, 0x1e, 0x6e]);
enum MFSampleExtension_ExtendedCameraIntrinsics = GUID(0x560bc4a5, 0x4de0, 0x4113, [0x9c, 0xdc, 0x83, 0x2d, 0xb9, 0x74, 0xf, 0x3d]);
enum MF_INVALID_PRESENTATION_TIME = 0x8000000000000000;
enum MF_MEDIATYPE_EQUAL_MAJOR_TYPES = 0x00000001;
enum MF_MEDIATYPE_EQUAL_FORMAT_TYPES = 0x00000002;
enum MF_MEDIATYPE_EQUAL_FORMAT_DATA = 0x00000004;
enum MF_MEDIATYPE_EQUAL_FORMAT_USER_DATA = 0x00000008;
enum MFASYNC_FAST_IO_PROCESSING_CALLBACK = 0x00000001;
enum MFASYNC_SIGNAL_CALLBACK = 0x00000002;
enum MFASYNC_BLOCKING_CALLBACK = 0x00000004;
enum MFASYNC_REPLY_CALLBACK = 0x00000008;
enum MFASYNC_LOCALIZE_REMOTE_CALLBACK = 0x00000010;
enum MFASYNC_CALLBACK_QUEUE_UNDEFINED = 0x00000000;
enum MFASYNC_CALLBACK_QUEUE_STANDARD = 0x00000001;
enum MFASYNC_CALLBACK_QUEUE_RT = 0x00000002;
enum MFASYNC_CALLBACK_QUEUE_IO = 0x00000003;
enum MFASYNC_CALLBACK_QUEUE_TIMER = 0x00000004;
enum MFASYNC_CALLBACK_QUEUE_MULTITHREADED = 0x00000005;
enum MFASYNC_CALLBACK_QUEUE_LONG_FUNCTION = 0x00000007;
enum MFASYNC_CALLBACK_QUEUE_PRIVATE_MASK = 0xffff0000;
enum MFASYNC_CALLBACK_QUEUE_ALL = 0xffffffff;
enum MFBYTESTREAM_IS_READABLE = 0x00000001;
enum MFBYTESTREAM_IS_WRITABLE = 0x00000002;
enum MFBYTESTREAM_IS_SEEKABLE = 0x00000004;
enum MFBYTESTREAM_IS_REMOTE = 0x00000008;
enum MFBYTESTREAM_IS_DIRECTORY = 0x00000080;
enum MFBYTESTREAM_HAS_SLOW_SEEK = 0x00000100;
enum MFBYTESTREAM_IS_PARTIALLY_DOWNLOADED = 0x00000200;
enum MFBYTESTREAM_SHARE_WRITE = 0x00000400;
enum MFBYTESTREAM_DOES_NOT_USE_NETWORK = 0x00000800;
enum MFBYTESTREAM_SEEK_FLAG_CANCEL_PENDING_IO = 0x00000001;
enum MF_MEDIA_SHARING_ENGINE_INITIAL_SEEK_TIME = GUID(0x6f3497f5, 0xd528, 0x4a4f, [0x8d, 0xd7, 0xdb, 0x36, 0x65, 0x7e, 0xc4, 0xc9]);
enum MF_SHUTDOWN_RENDERER_ON_ENGINE_SHUTDOWN = GUID(0xc112d94d, 0x6b9c, 0x48f8, [0xb6, 0xf9, 0x79, 0x50, 0xff, 0x9a, 0xb7, 0x1e]);
enum MF_PREFERRED_SOURCE_URI = GUID(0x5fc85488, 0x436a, 0x4db8, [0x90, 0xaf, 0x4d, 0xb4, 0x2, 0xae, 0x5c, 0x57]);
enum MF_SHARING_ENGINE_SHAREDRENDERER = GUID(0xefa446a0, 0x73e7, 0x404e, [0x8a, 0xe2, 0xfe, 0xf6, 0xa, 0xf5, 0xa3, 0x2b]);
enum MF_SHARING_ENGINE_CALLBACK = GUID(0x57dc1e95, 0xd252, 0x43fa, [0x9b, 0xbc, 0x18, 0x0, 0x70, 0xee, 0xfe, 0x6d]);
enum MFT_STREAMS_UNLIMITED = 0xffffffff;
enum MFT_OUTPUT_BOUND_UPPER_UNBOUNDED = 0x7fffffffffffffff;
enum OPM_GET_CURRENT_HDCP_SRM_VERSION = GUID(0x99c5ceff, 0x5f1d, 0x4879, [0x81, 0xc1, 0xc5, 0x24, 0x43, 0xc9, 0x48, 0x2b]);
enum OPM_GET_CONNECTED_HDCP_DEVICE_INFORMATION = GUID(0xdb59d74, 0xa992, 0x492e, [0xa0, 0xbd, 0xc2, 0x3f, 0xda, 0x56, 0x4e, 0x0]);
enum OPM_GET_ACP_AND_CGMSA_SIGNALING = GUID(0x6629a591, 0x3b79, 0x4cf3, [0x92, 0x4a, 0x11, 0xe8, 0xe7, 0x81, 0x16, 0x71]);
enum OPM_GET_CONNECTOR_TYPE = GUID(0x81d0bfd5, 0x6afe, 0x48c2, [0x99, 0xc0, 0x95, 0xa0, 0x8f, 0x97, 0xc5, 0xda]);
enum OPM_GET_SUPPORTED_PROTECTION_TYPES = GUID(0x38f2a801, 0x9a6c, 0x48bb, [0x91, 0x7, 0xb6, 0x69, 0x6e, 0x6f, 0x17, 0x97]);
enum OPM_GET_VIRTUAL_PROTECTION_LEVEL = GUID(0xb2075857, 0x3eda, 0x4d5d, [0x88, 0xdb, 0x74, 0x8f, 0x8c, 0x1a, 0x5, 0x49]);
enum OPM_GET_ACTUAL_PROTECTION_LEVEL = GUID(0x1957210a, 0x7766, 0x452a, [0xb9, 0x9a, 0xd2, 0x7a, 0xed, 0x54, 0xf0, 0x3a]);
enum OPM_GET_ACTUAL_OUTPUT_FORMAT = GUID(0xd7bf1ba3, 0xad13, 0x4f8e, [0xaf, 0x98, 0xd, 0xcb, 0x3c, 0xa2, 0x4, 0xcc]);
enum OPM_GET_ADAPTER_BUS_TYPE = GUID(0xc6f4d673, 0x6174, 0x4184, [0x8e, 0x35, 0xf6, 0xdb, 0x52, 0x0, 0xbc, 0xba]);
enum OPM_GET_OUTPUT_ID = GUID(0x72cb6df3, 0x244f, 0x40ce, [0xb0, 0x9e, 0x20, 0x50, 0x6a, 0xf6, 0x30, 0x2f]);
enum OPM_GET_DVI_CHARACTERISTICS = GUID(0xa470b3bb, 0x5dd7, 0x4172, [0x83, 0x9c, 0x3d, 0x37, 0x76, 0xe0, 0xeb, 0xf5]);
enum OPM_GET_CODEC_INFO = GUID(0x4f374491, 0x8f5f, 0x4445, [0x9d, 0xba, 0x95, 0x58, 0x8f, 0x6b, 0x58, 0xb4]);
enum OPM_GET_OUTPUT_HARDWARE_PROTECTION_SUPPORT = GUID(0x3b129589, 0x2af8, 0x4ef0, [0x96, 0xa2, 0x70, 0x4a, 0x84, 0x5a, 0x21, 0x8e]);
enum OPM_SET_PROTECTION_LEVEL = GUID(0x9bb9327c, 0x4eb5, 0x4727, [0x9f, 0x0, 0xb4, 0x2b, 0x9, 0x19, 0xc0, 0xda]);
enum OPM_SET_ACP_AND_CGMSA_SIGNALING = GUID(0x9a631a5, 0xd684, 0x4c60, [0x8e, 0x4d, 0xd3, 0xbb, 0xf, 0xb, 0xe3, 0xee]);
enum OPM_SET_HDCP_SRM = GUID(0x8b5ef5d1, 0xc30d, 0x44ff, [0x84, 0xa5, 0xea, 0x71, 0xdc, 0xe7, 0x8f, 0x13]);
enum OPM_SET_PROTECTION_LEVEL_ACCORDING_TO_CSS_DVD = GUID(0x39ce333e, 0x4cc0, 0x44ae, [0xbf, 0xcc, 0xda, 0x50, 0xb5, 0xf8, 0x2e, 0x72]);
enum WM_CODEC_ONEPASS_CBR = 0x00000001;
enum WM_CODEC_ONEPASS_VBR = 0x00000002;
enum WM_CODEC_TWOPASS_CBR = 0x00000004;
enum WM_CODEC_TWOPASS_VBR_UNCONSTRAINED = 0x00000008;
enum WM_CODEC_TWOPASS_VBR_PEAKCONSTRAINED = 0x00000010;
enum SYSFXUI_DONOTSHOW_LOUDNESSEQUALIZATION = 0x00000001;
enum SYSFXUI_DONOTSHOW_ROOMCORRECTION = 0x00000002;
enum SYSFXUI_DONOTSHOW_BASSMANAGEMENT = 0x00000004;
enum SYSFXUI_DONOTSHOW_BASSBOOST = 0x00000008;
enum SYSFXUI_DONOTSHOW_HEADPHONEVIRTUALIZATION = 0x00000010;
enum SYSFXUI_DONOTSHOW_VIRTUALSURROUND = 0x00000020;
enum SYSFXUI_DONOTSHOW_SPEAKERFILLING = 0x00000040;
enum SYSFXUI_DONOTSHOW_CHANNELPHANTOMING = 0x00000080;
enum AEC_MAX_SYSTEM_MODES = 0x00000006;
enum WMAAECMA_E_NO_ACTIVE_RENDER_STREAM = 0x87cc000a;
enum MEDIASUBTYPE_Y41T = GUID(0x54313459, 0x0, 0x10, [0x80, 0x0, 0x0, 0xaa, 0x0, 0x38, 0x9b, 0x71]);
enum MEDIASUBTYPE_Y42T = GUID(0x54323459, 0x0, 0x10, [0x80, 0x0, 0x0, 0xaa, 0x0, 0x38, 0x9b, 0x71]);
enum MEDIASUBTYPE_V216 = GUID(0x36313256, 0x0, 0x10, [0x80, 0x0, 0x0, 0xaa, 0x0, 0x38, 0x9b, 0x71]);
enum MEDIASUBTYPE_V410 = GUID(0x30313456, 0x0, 0x10, [0x80, 0x0, 0x0, 0xaa, 0x0, 0x38, 0x9b, 0x71]);
enum MEDIASUBTYPE_v210 = GUID(0x30313276, 0x0, 0x10, [0x80, 0x0, 0x0, 0xaa, 0x0, 0x38, 0x9b, 0x71]);
enum MEDIASUBTYPE_I420 = GUID(0x30323449, 0x0, 0x10, [0x80, 0x0, 0x0, 0xaa, 0x0, 0x38, 0x9b, 0x71]);
enum MEDIASUBTYPE_WVC1 = GUID(0x31435657, 0x0, 0x10, [0x80, 0x0, 0x0, 0xaa, 0x0, 0x38, 0x9b, 0x71]);
enum MEDIASUBTYPE_wvc1 = GUID(0x31637677, 0x0, 0x10, [0x80, 0x0, 0x0, 0xaa, 0x0, 0x38, 0x9b, 0x71]);
enum MEDIASUBTYPE_WMVA = GUID(0x41564d57, 0x0, 0x10, [0x80, 0x0, 0x0, 0xaa, 0x0, 0x38, 0x9b, 0x71]);
enum MEDIASUBTYPE_wmva = GUID(0x61766d77, 0x0, 0x10, [0x80, 0x0, 0x0, 0xaa, 0x0, 0x38, 0x9b, 0x71]);
enum MEDIASUBTYPE_WMVB = GUID(0x42564d57, 0x0, 0x10, [0x80, 0x0, 0x0, 0xaa, 0x0, 0x38, 0x9b, 0x71]);
enum MEDIASUBTYPE_wmvb = GUID(0x62766d77, 0x0, 0x10, [0x80, 0x0, 0x0, 0xaa, 0x0, 0x38, 0x9b, 0x71]);
enum MEDIASUBTYPE_WMVR = GUID(0x52564d57, 0x0, 0x10, [0x80, 0x0, 0x0, 0xaa, 0x0, 0x38, 0x9b, 0x71]);
enum MEDIASUBTYPE_wmvr = GUID(0x72766d77, 0x0, 0x10, [0x80, 0x0, 0x0, 0xaa, 0x0, 0x38, 0x9b, 0x71]);
enum MEDIASUBTYPE_WMVP = GUID(0x50564d57, 0x0, 0x10, [0x80, 0x0, 0x0, 0xaa, 0x0, 0x38, 0x9b, 0x71]);
enum MEDIASUBTYPE_wmvp = GUID(0x70766d77, 0x0, 0x10, [0x80, 0x0, 0x0, 0xaa, 0x0, 0x38, 0x9b, 0x71]);
enum MEDIASUBTYPE_WVP2 = GUID(0x32505657, 0x0, 0x10, [0x80, 0x0, 0x0, 0xaa, 0x0, 0x38, 0x9b, 0x71]);
enum MEDIASUBTYPE_wvp2 = GUID(0x32707677, 0x0, 0x10, [0x80, 0x0, 0x0, 0xaa, 0x0, 0x38, 0x9b, 0x71]);
enum MEDIASUBTYPE_WMV3 = GUID(0x33564d57, 0x0, 0x10, [0x80, 0x0, 0x0, 0xaa, 0x0, 0x38, 0x9b, 0x71]);
enum MEDIASUBTYPE_wmv3 = GUID(0x33766d77, 0x0, 0x10, [0x80, 0x0, 0x0, 0xaa, 0x0, 0x38, 0x9b, 0x71]);
enum MEDIASUBTYPE_WMV2 = GUID(0x32564d57, 0x0, 0x10, [0x80, 0x0, 0x0, 0xaa, 0x0, 0x38, 0x9b, 0x71]);
enum MEDIASUBTYPE_wmv2 = GUID(0x32766d77, 0x0, 0x10, [0x80, 0x0, 0x0, 0xaa, 0x0, 0x38, 0x9b, 0x71]);
enum MEDIASUBTYPE_WMV1 = GUID(0x31564d57, 0x0, 0x10, [0x80, 0x0, 0x0, 0xaa, 0x0, 0x38, 0x9b, 0x71]);
enum MEDIASUBTYPE_wmv1 = GUID(0x31766d77, 0x0, 0x10, [0x80, 0x0, 0x0, 0xaa, 0x0, 0x38, 0x9b, 0x71]);
enum MEDIASUBTYPE_MPG4 = GUID(0x3447504d, 0x0, 0x10, [0x80, 0x0, 0x0, 0xaa, 0x0, 0x38, 0x9b, 0x71]);
enum MEDIASUBTYPE_mpg4 = GUID(0x3467706d, 0x0, 0x10, [0x80, 0x0, 0x0, 0xaa, 0x0, 0x38, 0x9b, 0x71]);
enum MEDIASUBTYPE_MP42 = GUID(0x3234504d, 0x0, 0x10, [0x80, 0x0, 0x0, 0xaa, 0x0, 0x38, 0x9b, 0x71]);
enum MEDIASUBTYPE_mp42 = GUID(0x3234706d, 0x0, 0x10, [0x80, 0x0, 0x0, 0xaa, 0x0, 0x38, 0x9b, 0x71]);
enum MEDIASUBTYPE_MP43 = GUID(0x3334504d, 0x0, 0x10, [0x80, 0x0, 0x0, 0xaa, 0x0, 0x38, 0x9b, 0x71]);
enum MEDIASUBTYPE_mp43 = GUID(0x3334706d, 0x0, 0x10, [0x80, 0x0, 0x0, 0xaa, 0x0, 0x38, 0x9b, 0x71]);
enum MEDIASUBTYPE_MP4S = GUID(0x5334504d, 0x0, 0x10, [0x80, 0x0, 0x0, 0xaa, 0x0, 0x38, 0x9b, 0x71]);
enum MEDIASUBTYPE_mp4s = GUID(0x7334706d, 0x0, 0x10, [0x80, 0x0, 0x0, 0xaa, 0x0, 0x38, 0x9b, 0x71]);
enum MEDIASUBTYPE_M4S2 = GUID(0x3253344d, 0x0, 0x10, [0x80, 0x0, 0x0, 0xaa, 0x0, 0x38, 0x9b, 0x71]);
enum MEDIASUBTYPE_m4s2 = GUID(0x3273346d, 0x0, 0x10, [0x80, 0x0, 0x0, 0xaa, 0x0, 0x38, 0x9b, 0x71]);
enum MEDIASUBTYPE_MSS1 = GUID(0x3153534d, 0x0, 0x10, [0x80, 0x0, 0x0, 0xaa, 0x0, 0x38, 0x9b, 0x71]);
enum MEDIASUBTYPE_MSS2 = GUID(0x3253534d, 0x0, 0x10, [0x80, 0x0, 0x0, 0xaa, 0x0, 0x38, 0x9b, 0x71]);
enum MEDIASUBTYPE_MSAUDIO1 = GUID(0x160, 0x0, 0x10, [0x80, 0x0, 0x0, 0xaa, 0x0, 0x38, 0x9b, 0x71]);
enum MEDIASUBTYPE_WMAUDIO2 = GUID(0x161, 0x0, 0x10, [0x80, 0x0, 0x0, 0xaa, 0x0, 0x38, 0x9b, 0x71]);
enum MEDIASUBTYPE_WMAUDIO3 = GUID(0x162, 0x0, 0x10, [0x80, 0x0, 0x0, 0xaa, 0x0, 0x38, 0x9b, 0x71]);
enum MEDIASUBTYPE_WMAUDIO_LOSSLESS = GUID(0x163, 0x0, 0x10, [0x80, 0x0, 0x0, 0xaa, 0x0, 0x38, 0x9b, 0x71]);
enum MEDIASUBTYPE_WMASPDIF = GUID(0x164, 0x0, 0x10, [0x80, 0x0, 0x0, 0xaa, 0x0, 0x38, 0x9b, 0x71]);
enum MEDIASUBTYPE_WMAUDIO4 = GUID(0x168, 0x0, 0x10, [0x80, 0x0, 0x0, 0xaa, 0x0, 0x38, 0x9b, 0x71]);
enum MEDIASUBTYPE_MPEG_ADTS_AAC = GUID(0x1600, 0x0, 0x10, [0x80, 0x0, 0x0, 0xaa, 0x0, 0x38, 0x9b, 0x71]);
enum MEDIASUBTYPE_MPEG_RAW_AAC = GUID(0x1601, 0x0, 0x10, [0x80, 0x0, 0x0, 0xaa, 0x0, 0x38, 0x9b, 0x71]);
enum MEDIASUBTYPE_MPEG_LOAS = GUID(0x1602, 0x0, 0x10, [0x80, 0x0, 0x0, 0xaa, 0x0, 0x38, 0x9b, 0x71]);
enum MEDIASUBTYPE_NOKIA_MPEG_ADTS_AAC = GUID(0x1608, 0x0, 0x10, [0x80, 0x0, 0x0, 0xaa, 0x0, 0x38, 0x9b, 0x71]);
enum MEDIASUBTYPE_NOKIA_MPEG_RAW_AAC = GUID(0x1609, 0x0, 0x10, [0x80, 0x0, 0x0, 0xaa, 0x0, 0x38, 0x9b, 0x71]);
enum MEDIASUBTYPE_VODAFONE_MPEG_ADTS_AAC = GUID(0x160a, 0x0, 0x10, [0x80, 0x0, 0x0, 0xaa, 0x0, 0x38, 0x9b, 0x71]);
enum MEDIASUBTYPE_VODAFONE_MPEG_RAW_AAC = GUID(0x160b, 0x0, 0x10, [0x80, 0x0, 0x0, 0xaa, 0x0, 0x38, 0x9b, 0x71]);
enum MEDIASUBTYPE_MPEG_HEAAC = GUID(0x1610, 0x0, 0x10, [0x80, 0x0, 0x0, 0xaa, 0x0, 0x38, 0x9b, 0x71]);
enum MEDIASUBTYPE_RAW_AAC1 = GUID(0xff, 0x0, 0x10, [0x80, 0x0, 0x0, 0xaa, 0x0, 0x38, 0x9b, 0x71]);
enum MEDIASUBTYPE_DVM = GUID(0x2000, 0x0, 0x10, [0x80, 0x0, 0x0, 0xaa, 0x0, 0x38, 0x9b, 0x71]);
enum MEDIASUBTYPE_DTS2 = GUID(0x2001, 0x0, 0x10, [0x80, 0x0, 0x0, 0xaa, 0x0, 0x38, 0x9b, 0x71]);
enum MEDIASUBTYPE_DOLBY_DDPLUS = GUID(0xa7fb87af, 0x2d02, 0x42fb, [0xa4, 0xd4, 0x5, 0xcd, 0x93, 0x84, 0x3b, 0xdd]);
enum MEDIASUBTYPE_DOLBY_TRUEHD = GUID(0xeb27cec4, 0x163e, 0x4ca3, [0x8b, 0x74, 0x8e, 0x25, 0xf9, 0x1b, 0x51, 0x7e]);
enum MEDIASUBTYPE_DTS_HD = GUID(0xa2e58eb7, 0xfa9, 0x48bb, [0xa4, 0xc, 0xfa, 0xe, 0x15, 0x6d, 0x6, 0x45]);
enum MEDIASUBTYPE_DTS_HD_HRA = GUID(0xa61ac364, 0xad0e, 0x4744, [0x89, 0xff, 0x21, 0x3c, 0xe0, 0xdf, 0x88, 0x4]);
enum MEDIASUBTYPE_h264 = GUID(0x34363268, 0x0, 0x10, [0x80, 0x0, 0x0, 0xaa, 0x0, 0x38, 0x9b, 0x71]);
enum MEDIASUBTYPE_AVC1 = GUID(0x31435641, 0x0, 0x10, [0x80, 0x0, 0x0, 0xaa, 0x0, 0x38, 0x9b, 0x71]);
enum MEDIASUBTYPE_X264 = GUID(0x34363258, 0x0, 0x10, [0x80, 0x0, 0x0, 0xaa, 0x0, 0x38, 0x9b, 0x71]);
enum MEDIASUBTYPE_x264 = GUID(0x34363278, 0x0, 0x10, [0x80, 0x0, 0x0, 0xaa, 0x0, 0x38, 0x9b, 0x71]);
enum MF_VIDEODSP_MODE = GUID(0x16d720f0, 0x768c, 0x11de, [0x8a, 0x39, 0x8, 0x0, 0x20, 0xc, 0x9a, 0x66]);
enum MFSampleExtension_VideoDSPMode = GUID(0xc12d55cb, 0xd7d9, 0x476d, [0x81, 0xf3, 0x69, 0x11, 0x7f, 0x16, 0x3e, 0xa0]);
enum CLSID_CTocEntry = GUID(0xf22f5e05, 0x585c, 0x4def, [0x85, 0x23, 0x65, 0x55, 0xcf, 0xbc, 0xc, 0xb3]);
enum CLSID_CTocEntryList = GUID(0x3a8cccbc, 0xefd, 0x43a3, [0xb8, 0x38, 0xf3, 0x8a, 0x55, 0x2b, 0xa2, 0x37]);
enum CLSID_CToc = GUID(0x4fe24495, 0x28ce, 0x4920, [0xa4, 0xc4, 0xe5, 0x56, 0xe1, 0xf0, 0xdf, 0x2a]);
enum CLSID_CTocCollection = GUID(0x5058292d, 0xa244, 0x4840, [0xab, 0x44, 0x48, 0x9, 0x75, 0xc4, 0xff, 0xe4]);
enum CLSID_CTocParser = GUID(0x499eaeea, 0x2737, 0x4849, [0x8b, 0xb6, 0x47, 0xf1, 0x7, 0xea, 0xf3, 0x58]);
enum CLSID_CAsfTocParser = GUID(0x9b77c0f2, 0x8735, 0x46c5, [0xb9, 0xf, 0x5f, 0xb, 0x30, 0x3e, 0xf6, 0xab]);
enum CLSID_CAviTocParser = GUID(0x3adce5cc, 0x13c8, 0x4573, [0xb3, 0x28, 0xed, 0x43, 0x8e, 0xb6, 0x94, 0xf9]);
enum CLSID_CFileIo = GUID(0x11993195, 0x1244, 0x4840, [0xab, 0x44, 0x48, 0x9, 0x75, 0xc4, 0xff, 0xe4]);
enum CLSID_CFileClient = GUID(0xbfccd195, 0x1244, 0x4840, [0xab, 0x44, 0x48, 0x9, 0x75, 0xc4, 0xff, 0xe4]);
enum CLSID_CClusterDetectorEx = GUID(0x47354492, 0x827e, 0x4b8a, [0xb3, 0x18, 0xc8, 0xe, 0xba, 0x13, 0x81, 0xf0]);
enum E_TOCPARSER_INVALIDASFFILE = 0xffffffff99000001;
enum E_TOCPARSER_INVALIDRIFFFILE = 0xffffffff99000002;
enum TOC_MAX_DESCRIPTION_SIZE = 0x0000ffff;
enum TOC_ENTRY_MAX_TITLE_SIZE = 0x0000ffff;
enum MFASFINDEXER_PER_ENTRY_BYTES_DYNAMIC = 0x0000ffff;
enum MFASFINDEXER_NO_FIXED_INTERVAL = 0xffffffff;
enum MFASFINDEXER_READ_FOR_REVERSEPLAYBACK_OUTOFDATASEGMENT = 0xffffffffffffffff;
enum MFASFINDEXER_APPROX_SEEK_TIME_UNKNOWN = 0xffffffffffffffff;
enum MFASF_MAX_STREAM_NUMBER = 0x0000007f;
enum MFASF_INVALID_STREAM_NUMBER = 0x00000080;
enum MFASF_PAYLOADEXTENSION_MAX_SIZE = 0x000000ff;
enum MFASF_PAYLOADEXTENSION_VARIABLE_SIZE = 0x0000ffff;
enum MFASF_DEFAULT_BUFFER_WINDOW_MS = 0x00000bb8;
enum FACILITY_MF = 0x0000000d;
enum FACILITY_MF_WIN32 = 0x00000007;
enum MF_E_PLATFORM_NOT_INITIALIZED = 0xffffffffc00d36b0;
enum MF_E_BUFFERTOOSMALL = 0xffffffffc00d36b1;
enum MF_E_INVALIDREQUEST = 0xffffffffc00d36b2;
enum MF_E_INVALIDSTREAMNUMBER = 0xffffffffc00d36b3;
enum MF_E_INVALIDMEDIATYPE = 0xffffffffc00d36b4;
enum MF_E_NOTACCEPTING = 0xffffffffc00d36b5;
enum MF_E_NOT_INITIALIZED = 0xffffffffc00d36b6;
enum MF_E_UNSUPPORTED_REPRESENTATION = 0xffffffffc00d36b7;
enum MF_E_NO_MORE_TYPES = 0xffffffffc00d36b9;
enum MF_E_UNSUPPORTED_SERVICE = 0xffffffffc00d36ba;
enum MF_E_UNEXPECTED = 0xffffffffc00d36bb;
enum MF_E_INVALIDNAME = 0xffffffffc00d36bc;
enum MF_E_INVALIDTYPE = 0xffffffffc00d36bd;
enum MF_E_INVALID_FILE_FORMAT = 0xffffffffc00d36be;
enum MF_E_INVALIDINDEX = 0xffffffffc00d36bf;
enum MF_E_INVALID_TIMESTAMP = 0xffffffffc00d36c0;
enum MF_E_UNSUPPORTED_SCHEME = 0xffffffffc00d36c3;
enum MF_E_UNSUPPORTED_BYTESTREAM_TYPE = 0xffffffffc00d36c4;
enum MF_E_UNSUPPORTED_TIME_FORMAT = 0xffffffffc00d36c5;
enum MF_E_NO_SAMPLE_TIMESTAMP = 0xffffffffc00d36c8;
enum MF_E_NO_SAMPLE_DURATION = 0xffffffffc00d36c9;
enum MF_E_INVALID_STREAM_DATA = 0xffffffffc00d36cb;
enum MF_E_RT_UNAVAILABLE = 0xffffffffc00d36cf;
enum MF_E_UNSUPPORTED_RATE = 0xffffffffc00d36d0;
enum MF_E_THINNING_UNSUPPORTED = 0xffffffffc00d36d1;
enum MF_E_REVERSE_UNSUPPORTED = 0xffffffffc00d36d2;
enum MF_E_UNSUPPORTED_RATE_TRANSITION = 0xffffffffc00d36d3;
enum MF_E_RATE_CHANGE_PREEMPTED = 0xffffffffc00d36d4;
enum MF_E_NOT_FOUND = 0xffffffffc00d36d5;
enum MF_E_NOT_AVAILABLE = 0xffffffffc00d36d6;
enum MF_E_NO_CLOCK = 0xffffffffc00d36d7;
enum MF_S_MULTIPLE_BEGIN = 0x000d36d8;
enum MF_E_MULTIPLE_BEGIN = 0xffffffffc00d36d9;
enum MF_E_MULTIPLE_SUBSCRIBERS = 0xffffffffc00d36da;
enum MF_E_TIMER_ORPHANED = 0xffffffffc00d36db;
enum MF_E_STATE_TRANSITION_PENDING = 0xffffffffc00d36dc;
enum MF_E_UNSUPPORTED_STATE_TRANSITION = 0xffffffffc00d36dd;
enum MF_E_UNRECOVERABLE_ERROR_OCCURRED = 0xffffffffc00d36de;
enum MF_E_SAMPLE_HAS_TOO_MANY_BUFFERS = 0xffffffffc00d36df;
enum MF_E_SAMPLE_NOT_WRITABLE = 0xffffffffc00d36e0;
enum MF_E_INVALID_KEY = 0xffffffffc00d36e2;
enum MF_E_BAD_STARTUP_VERSION = 0xffffffffc00d36e3;
enum MF_E_UNSUPPORTED_CAPTION = 0xffffffffc00d36e4;
enum MF_E_INVALID_POSITION = 0xffffffffc00d36e5;
enum MF_E_ATTRIBUTENOTFOUND = 0xffffffffc00d36e6;
enum MF_E_PROPERTY_TYPE_NOT_ALLOWED = 0xffffffffc00d36e7;
enum MF_E_PROPERTY_TYPE_NOT_SUPPORTED = 0xffffffffc00d36e8;
enum MF_E_PROPERTY_EMPTY = 0xffffffffc00d36e9;
enum MF_E_PROPERTY_NOT_EMPTY = 0xffffffffc00d36ea;
enum MF_E_PROPERTY_VECTOR_NOT_ALLOWED = 0xffffffffc00d36eb;
enum MF_E_PROPERTY_VECTOR_REQUIRED = 0xffffffffc00d36ec;
enum MF_E_OPERATION_CANCELLED = 0xffffffffc00d36ed;
enum MF_E_BYTESTREAM_NOT_SEEKABLE = 0xffffffffc00d36ee;
enum MF_E_DISABLED_IN_SAFEMODE = 0xffffffffc00d36ef;
enum MF_E_CANNOT_PARSE_BYTESTREAM = 0xffffffffc00d36f0;
enum MF_E_SOURCERESOLVER_MUTUALLY_EXCLUSIVE_FLAGS = 0xffffffffc00d36f1;
enum MF_E_MEDIAPROC_WRONGSTATE = 0xffffffffc00d36f2;
enum MF_E_RT_THROUGHPUT_NOT_AVAILABLE = 0xffffffffc00d36f3;
enum MF_E_RT_TOO_MANY_CLASSES = 0xffffffffc00d36f4;
enum MF_E_RT_WOULDBLOCK = 0xffffffffc00d36f5;
enum MF_E_NO_BITPUMP = 0xffffffffc00d36f6;
enum MF_E_RT_OUTOFMEMORY = 0xffffffffc00d36f7;
enum MF_E_RT_WORKQUEUE_CLASS_NOT_SPECIFIED = 0xffffffffc00d36f8;
enum MF_E_INSUFFICIENT_BUFFER = 0xffffffffc00d7170;
enum MF_E_CANNOT_CREATE_SINK = 0xffffffffc00d36fa;
enum MF_E_BYTESTREAM_UNKNOWN_LENGTH = 0xffffffffc00d36fb;
enum MF_E_SESSION_PAUSEWHILESTOPPED = 0xffffffffc00d36fc;
enum MF_S_ACTIVATE_REPLACED = 0x000d36fd;
enum MF_E_FORMAT_CHANGE_NOT_SUPPORTED = 0xffffffffc00d36fe;
enum MF_E_INVALID_WORKQUEUE = 0xffffffffc00d36ff;
enum MF_E_DRM_UNSUPPORTED = 0xffffffffc00d3700;
enum MF_E_UNAUTHORIZED = 0xffffffffc00d3701;
enum MF_E_OUT_OF_RANGE = 0xffffffffc00d3702;
enum MF_E_INVALID_CODEC_MERIT = 0xffffffffc00d3703;
enum MF_E_HW_MFT_FAILED_START_STREAMING = 0xffffffffc00d3704;
enum MF_E_OPERATION_IN_PROGRESS = 0xffffffffc00d3705;
enum MF_E_HARDWARE_DRM_UNSUPPORTED = 0xffffffffc00d3706;
enum MF_E_DURATION_TOO_LONG = 0xffffffffc00d3707;
enum MF_E_OPERATION_UNSUPPORTED_AT_D3D_FEATURE_LEVEL = 0xffffffffc00d3708;
enum MF_E_UNSUPPORTED_MEDIATYPE_AT_D3D_FEATURE_LEVEL = 0xffffffffc00d3709;
enum MF_S_ASF_PARSEINPROGRESS = 0x400d3a98;
enum MF_E_ASF_PARSINGINCOMPLETE = 0xffffffffc00d3a98;
enum MF_E_ASF_MISSINGDATA = 0xffffffffc00d3a99;
enum MF_E_ASF_INVALIDDATA = 0xffffffffc00d3a9a;
enum MF_E_ASF_OPAQUEPACKET = 0xffffffffc00d3a9b;
enum MF_E_ASF_NOINDEX = 0xffffffffc00d3a9c;
enum MF_E_ASF_OUTOFRANGE = 0xffffffffc00d3a9d;
enum MF_E_ASF_INDEXNOTLOADED = 0xffffffffc00d3a9e;
enum MF_E_ASF_TOO_MANY_PAYLOADS = 0xffffffffc00d3a9f;
enum MF_E_ASF_UNSUPPORTED_STREAM_TYPE = 0xffffffffc00d3aa0;
enum MF_E_ASF_DROPPED_PACKET = 0xffffffffc00d3aa1;
enum MF_E_NO_EVENTS_AVAILABLE = 0xffffffffc00d3e80;
enum MF_E_INVALID_STATE_TRANSITION = 0xffffffffc00d3e82;
enum MF_E_END_OF_STREAM = 0xffffffffc00d3e84;
enum MF_E_SHUTDOWN = 0xffffffffc00d3e85;
enum MF_E_MP3_NOTFOUND = 0xffffffffc00d3e86;
enum MF_E_MP3_OUTOFDATA = 0xffffffffc00d3e87;
enum MF_E_MP3_NOTMP3 = 0xffffffffc00d3e88;
enum MF_E_MP3_NOTSUPPORTED = 0xffffffffc00d3e89;
enum MF_E_NO_DURATION = 0xffffffffc00d3e8a;
enum MF_E_INVALID_FORMAT = 0xffffffffc00d3e8c;
enum MF_E_PROPERTY_NOT_FOUND = 0xffffffffc00d3e8d;
enum MF_E_PROPERTY_READ_ONLY = 0xffffffffc00d3e8e;
enum MF_E_PROPERTY_NOT_ALLOWED = 0xffffffffc00d3e8f;
enum MF_E_MEDIA_SOURCE_NOT_STARTED = 0xffffffffc00d3e91;
enum MF_E_UNSUPPORTED_FORMAT = 0xffffffffc00d3e98;
enum MF_E_MP3_BAD_CRC = 0xffffffffc00d3e99;
enum MF_E_NOT_PROTECTED = 0xffffffffc00d3e9a;
enum MF_E_MEDIA_SOURCE_WRONGSTATE = 0xffffffffc00d3e9b;
enum MF_E_MEDIA_SOURCE_NO_STREAMS_SELECTED = 0xffffffffc00d3e9c;
enum MF_E_CANNOT_FIND_KEYFRAME_SAMPLE = 0xffffffffc00d3e9d;
enum MF_E_UNSUPPORTED_CHARACTERISTICS = 0xffffffffc00d3e9e;
enum MF_E_NO_AUDIO_RECORDING_DEVICE = 0xffffffffc00d3e9f;
enum MF_E_AUDIO_RECORDING_DEVICE_IN_USE = 0xffffffffc00d3ea0;
enum MF_E_AUDIO_RECORDING_DEVICE_INVALIDATED = 0xffffffffc00d3ea1;
enum MF_E_VIDEO_RECORDING_DEVICE_INVALIDATED = 0xffffffffc00d3ea2;
enum MF_E_VIDEO_RECORDING_DEVICE_PREEMPTED = 0xffffffffc00d3ea3;
enum MF_E_NETWORK_RESOURCE_FAILURE = 0xffffffffc00d4268;
enum MF_E_NET_WRITE = 0xffffffffc00d4269;
enum MF_E_NET_READ = 0xffffffffc00d426a;
enum MF_E_NET_REQUIRE_NETWORK = 0xffffffffc00d426b;
enum MF_E_NET_REQUIRE_ASYNC = 0xffffffffc00d426c;
enum MF_E_NET_BWLEVEL_NOT_SUPPORTED = 0xffffffffc00d426d;
enum MF_E_NET_STREAMGROUPS_NOT_SUPPORTED = 0xffffffffc00d426e;
enum MF_E_NET_MANUALSS_NOT_SUPPORTED = 0xffffffffc00d426f;
enum MF_E_NET_INVALID_PRESENTATION_DESCRIPTOR = 0xffffffffc00d4270;
enum MF_E_NET_CACHESTREAM_NOT_FOUND = 0xffffffffc00d4271;
enum MF_I_MANUAL_PROXY = 0x400d4272;
enum MF_E_NET_REQUIRE_INPUT = 0xffffffffc00d4274;
enum MF_E_NET_REDIRECT = 0xffffffffc00d4275;
enum MF_E_NET_REDIRECT_TO_PROXY = 0xffffffffc00d4276;
enum MF_E_NET_TOO_MANY_REDIRECTS = 0xffffffffc00d4277;
enum MF_E_NET_TIMEOUT = 0xffffffffc00d4278;
enum MF_E_NET_CLIENT_CLOSE = 0xffffffffc00d4279;
enum MF_E_NET_BAD_CONTROL_DATA = 0xffffffffc00d427a;
enum MF_E_NET_INCOMPATIBLE_SERVER = 0xffffffffc00d427b;
enum MF_E_NET_UNSAFE_URL = 0xffffffffc00d427c;
enum MF_E_NET_CACHE_NO_DATA = 0xffffffffc00d427d;
enum MF_E_NET_EOL = 0xffffffffc00d427e;
enum MF_E_NET_BAD_REQUEST = 0xffffffffc00d427f;
enum MF_E_NET_INTERNAL_SERVER_ERROR = 0xffffffffc00d4280;
enum MF_E_NET_SESSION_NOT_FOUND = 0xffffffffc00d4281;
enum MF_E_NET_NOCONNECTION = 0xffffffffc00d4282;
enum MF_E_NET_CONNECTION_FAILURE = 0xffffffffc00d4283;
enum MF_E_NET_INCOMPATIBLE_PUSHSERVER = 0xffffffffc00d4284;
enum MF_E_NET_SERVER_ACCESSDENIED = 0xffffffffc00d4285;
enum MF_E_NET_PROXY_ACCESSDENIED = 0xffffffffc00d4286;
enum MF_E_NET_CANNOTCONNECT = 0xffffffffc00d4287;
enum MF_E_NET_INVALID_PUSH_TEMPLATE = 0xffffffffc00d4288;
enum MF_E_NET_INVALID_PUSH_PUBLISHING_POINT = 0xffffffffc00d4289;
enum MF_E_NET_BUSY = 0xffffffffc00d428a;
enum MF_E_NET_RESOURCE_GONE = 0xffffffffc00d428b;
enum MF_E_NET_ERROR_FROM_PROXY = 0xffffffffc00d428c;
enum MF_E_NET_PROXY_TIMEOUT = 0xffffffffc00d428d;
enum MF_E_NET_SERVER_UNAVAILABLE = 0xffffffffc00d428e;
enum MF_E_NET_TOO_MUCH_DATA = 0xffffffffc00d428f;
enum MF_E_NET_SESSION_INVALID = 0xffffffffc00d4290;
enum MF_E_OFFLINE_MODE = 0xffffffffc00d4291;
enum MF_E_NET_UDP_BLOCKED = 0xffffffffc00d4292;
enum MF_E_NET_UNSUPPORTED_CONFIGURATION = 0xffffffffc00d4293;
enum MF_E_NET_PROTOCOL_DISABLED = 0xffffffffc00d4294;
enum MF_E_NET_COMPANION_DRIVER_DISCONNECT = 0xffffffffc00d4295;
enum MF_E_ALREADY_INITIALIZED = 0xffffffffc00d4650;
enum MF_E_BANDWIDTH_OVERRUN = 0xffffffffc00d4651;
enum MF_E_LATE_SAMPLE = 0xffffffffc00d4652;
enum MF_E_FLUSH_NEEDED = 0xffffffffc00d4653;
enum MF_E_INVALID_PROFILE = 0xffffffffc00d4654;
enum MF_E_INDEX_NOT_COMMITTED = 0xffffffffc00d4655;
enum MF_E_NO_INDEX = 0xffffffffc00d4656;
enum MF_E_CANNOT_INDEX_IN_PLACE = 0xffffffffc00d4657;
enum MF_E_MISSING_ASF_LEAKYBUCKET = 0xffffffffc00d4658;
enum MF_E_INVALID_ASF_STREAMID = 0xffffffffc00d4659;
enum MF_E_STREAMSINK_REMOVED = 0xffffffffc00d4a38;
enum MF_E_STREAMSINKS_OUT_OF_SYNC = 0xffffffffc00d4a3a;
enum MF_E_STREAMSINKS_FIXED = 0xffffffffc00d4a3b;
enum MF_E_STREAMSINK_EXISTS = 0xffffffffc00d4a3c;
enum MF_E_SAMPLEALLOCATOR_CANCELED = 0xffffffffc00d4a3d;
enum MF_E_SAMPLEALLOCATOR_EMPTY = 0xffffffffc00d4a3e;
enum MF_E_SINK_ALREADYSTOPPED = 0xffffffffc00d4a3f;
enum MF_E_ASF_FILESINK_BITRATE_UNKNOWN = 0xffffffffc00d4a40;
enum MF_E_SINK_NO_STREAMS = 0xffffffffc00d4a41;
enum MF_S_SINK_NOT_FINALIZED = 0x000d4a42;
enum MF_E_METADATA_TOO_LONG = 0xffffffffc00d4a43;
enum MF_E_SINK_NO_SAMPLES_PROCESSED = 0xffffffffc00d4a44;
enum MF_E_SINK_HEADERS_NOT_FOUND = 0xffffffffc00d4a45;
enum MF_E_VIDEO_REN_NO_PROCAMP_HW = 0xffffffffc00d4e20;
enum MF_E_VIDEO_REN_NO_DEINTERLACE_HW = 0xffffffffc00d4e21;
enum MF_E_VIDEO_REN_COPYPROT_FAILED = 0xffffffffc00d4e22;
enum MF_E_VIDEO_REN_SURFACE_NOT_SHARED = 0xffffffffc00d4e23;
enum MF_E_VIDEO_DEVICE_LOCKED = 0xffffffffc00d4e24;
enum MF_E_NEW_VIDEO_DEVICE = 0xffffffffc00d4e25;
enum MF_E_NO_VIDEO_SAMPLE_AVAILABLE = 0xffffffffc00d4e26;
enum MF_E_NO_AUDIO_PLAYBACK_DEVICE = 0xffffffffc00d4e84;
enum MF_E_AUDIO_PLAYBACK_DEVICE_IN_USE = 0xffffffffc00d4e85;
enum MF_E_AUDIO_PLAYBACK_DEVICE_INVALIDATED = 0xffffffffc00d4e86;
enum MF_E_AUDIO_SERVICE_NOT_RUNNING = 0xffffffffc00d4e87;
enum MF_E_AUDIO_BUFFER_SIZE_ERROR = 0xffffffffc00d4e88;
enum MF_E_AUDIO_CLIENT_WRAPPER_SPOOF_ERROR = 0xffffffffc00d4e89;
enum MF_E_TOPO_INVALID_OPTIONAL_NODE = 0xffffffffc00d520e;
enum MF_E_TOPO_CANNOT_FIND_DECRYPTOR = 0xffffffffc00d5211;
enum MF_E_TOPO_CODEC_NOT_FOUND = 0xffffffffc00d5212;
enum MF_E_TOPO_CANNOT_CONNECT = 0xffffffffc00d5213;
enum MF_E_TOPO_UNSUPPORTED = 0xffffffffc00d5214;
enum MF_E_TOPO_INVALID_TIME_ATTRIBUTES = 0xffffffffc00d5215;
enum MF_E_TOPO_LOOPS_IN_TOPOLOGY = 0xffffffffc00d5216;
enum MF_E_TOPO_MISSING_PRESENTATION_DESCRIPTOR = 0xffffffffc00d5217;
enum MF_E_TOPO_MISSING_STREAM_DESCRIPTOR = 0xffffffffc00d5218;
enum MF_E_TOPO_STREAM_DESCRIPTOR_NOT_SELECTED = 0xffffffffc00d5219;
enum MF_E_TOPO_MISSING_SOURCE = 0xffffffffc00d521a;
enum MF_E_TOPO_SINK_ACTIVATES_UNSUPPORTED = 0xffffffffc00d521b;
enum MF_E_SEQUENCER_UNKNOWN_SEGMENT_ID = 0xffffffffc00d61ac;
enum MF_S_SEQUENCER_CONTEXT_CANCELED = 0x000d61ad;
enum MF_E_NO_SOURCE_IN_CACHE = 0xffffffffc00d61ae;
enum MF_S_SEQUENCER_SEGMENT_AT_END_OF_STREAM = 0x000d61af;
enum MF_E_TRANSFORM_TYPE_NOT_SET = 0xffffffffc00d6d60;
enum MF_E_TRANSFORM_STREAM_CHANGE = 0xffffffffc00d6d61;
enum MF_E_TRANSFORM_INPUT_REMAINING = 0xffffffffc00d6d62;
enum MF_E_TRANSFORM_PROFILE_MISSING = 0xffffffffc00d6d63;
enum MF_E_TRANSFORM_PROFILE_INVALID_OR_CORRUPT = 0xffffffffc00d6d64;
enum MF_E_TRANSFORM_PROFILE_TRUNCATED = 0xffffffffc00d6d65;
enum MF_E_TRANSFORM_PROPERTY_PID_NOT_RECOGNIZED = 0xffffffffc00d6d66;
enum MF_E_TRANSFORM_PROPERTY_VARIANT_TYPE_WRONG = 0xffffffffc00d6d67;
enum MF_E_TRANSFORM_PROPERTY_NOT_WRITEABLE = 0xffffffffc00d6d68;
enum MF_E_TRANSFORM_PROPERTY_ARRAY_VALUE_WRONG_NUM_DIM = 0xffffffffc00d6d69;
enum MF_E_TRANSFORM_PROPERTY_VALUE_SIZE_WRONG = 0xffffffffc00d6d6a;
enum MF_E_TRANSFORM_PROPERTY_VALUE_OUT_OF_RANGE = 0xffffffffc00d6d6b;
enum MF_E_TRANSFORM_PROPERTY_VALUE_INCOMPATIBLE = 0xffffffffc00d6d6c;
enum MF_E_TRANSFORM_NOT_POSSIBLE_FOR_CURRENT_OUTPUT_MEDIATYPE = 0xffffffffc00d6d6d;
enum MF_E_TRANSFORM_NOT_POSSIBLE_FOR_CURRENT_INPUT_MEDIATYPE = 0xffffffffc00d6d6e;
enum MF_E_TRANSFORM_NOT_POSSIBLE_FOR_CURRENT_MEDIATYPE_COMBINATION = 0xffffffffc00d6d6f;
enum MF_E_TRANSFORM_CONFLICTS_WITH_OTHER_CURRENTLY_ENABLED_FEATURES = 0xffffffffc00d6d70;
enum MF_E_TRANSFORM_NEED_MORE_INPUT = 0xffffffffc00d6d72;
enum MF_E_TRANSFORM_NOT_POSSIBLE_FOR_CURRENT_SPKR_CONFIG = 0xffffffffc00d6d73;
enum MF_E_TRANSFORM_CANNOT_CHANGE_MEDIATYPE_WHILE_PROCESSING = 0xffffffffc00d6d74;
enum MF_S_TRANSFORM_DO_NOT_PROPAGATE_EVENT = 0x000d6d75;
enum MF_E_UNSUPPORTED_D3D_TYPE = 0xffffffffc00d6d76;
enum MF_E_TRANSFORM_ASYNC_LOCKED = 0xffffffffc00d6d77;
enum MF_E_TRANSFORM_CANNOT_INITIALIZE_ACM_DRIVER = 0xffffffffc00d6d78;
enum MF_E_TRANSFORM_STREAM_INVALID_RESOLUTION = 0xffffffffc00d6d79;
enum MF_E_TRANSFORM_ASYNC_MFT_NOT_SUPPORTED = 0xffffffffc00d6d7a;
enum MF_E_TRANSFORM_EXATTRIBUTE_NOT_SUPPORTED = 0xffffffffc00d6d7c;
enum MF_E_LICENSE_INCORRECT_RIGHTS = 0xffffffffc00d7148;
enum MF_E_LICENSE_OUTOFDATE = 0xffffffffc00d7149;
enum MF_E_LICENSE_REQUIRED = 0xffffffffc00d714a;
enum MF_E_DRM_HARDWARE_INCONSISTENT = 0xffffffffc00d714b;
enum MF_E_NO_CONTENT_PROTECTION_MANAGER = 0xffffffffc00d714c;
enum MF_E_LICENSE_RESTORE_NO_RIGHTS = 0xffffffffc00d714d;
enum MF_E_BACKUP_RESTRICTED_LICENSE = 0xffffffffc00d714e;
enum MF_E_LICENSE_RESTORE_NEEDS_INDIVIDUALIZATION = 0xffffffffc00d714f;
enum MF_S_PROTECTION_NOT_REQUIRED = 0x000d7150;
enum MF_E_COMPONENT_REVOKED = 0xffffffffc00d7151;
enum MF_E_TRUST_DISABLED = 0xffffffffc00d7152;
enum MF_E_WMDRMOTA_NO_ACTION = 0xffffffffc00d7153;
enum MF_E_WMDRMOTA_ACTION_ALREADY_SET = 0xffffffffc00d7154;
enum MF_E_WMDRMOTA_DRM_HEADER_NOT_AVAILABLE = 0xffffffffc00d7155;
enum MF_E_WMDRMOTA_DRM_ENCRYPTION_SCHEME_NOT_SUPPORTED = 0xffffffffc00d7156;
enum MF_E_WMDRMOTA_ACTION_MISMATCH = 0xffffffffc00d7157;
enum MF_E_WMDRMOTA_INVALID_POLICY = 0xffffffffc00d7158;
enum MF_E_POLICY_UNSUPPORTED = 0xffffffffc00d7159;
enum MF_E_OPL_NOT_SUPPORTED = 0xffffffffc00d715a;
enum MF_E_TOPOLOGY_VERIFICATION_FAILED = 0xffffffffc00d715b;
enum MF_E_SIGNATURE_VERIFICATION_FAILED = 0xffffffffc00d715c;
enum MF_E_DEBUGGING_NOT_ALLOWED = 0xffffffffc00d715d;
enum MF_E_CODE_EXPIRED = 0xffffffffc00d715e;
enum MF_E_GRL_VERSION_TOO_LOW = 0xffffffffc00d715f;
enum MF_E_GRL_RENEWAL_NOT_FOUND = 0xffffffffc00d7160;
enum MF_E_GRL_EXTENSIBLE_ENTRY_NOT_FOUND = 0xffffffffc00d7161;
enum MF_E_KERNEL_UNTRUSTED = 0xffffffffc00d7162;
enum MF_E_PEAUTH_UNTRUSTED = 0xffffffffc00d7163;
enum MF_E_NON_PE_PROCESS = 0xffffffffc00d7165;
enum MF_E_REBOOT_REQUIRED = 0xffffffffc00d7167;
enum MF_S_WAIT_FOR_POLICY_SET = 0x000d7168;
enum MF_S_VIDEO_DISABLED_WITH_UNKNOWN_SOFTWARE_OUTPUT = 0x000d7169;
enum MF_E_GRL_INVALID_FORMAT = 0xffffffffc00d716a;
enum MF_E_GRL_UNRECOGNIZED_FORMAT = 0xffffffffc00d716b;
enum MF_E_ALL_PROCESS_RESTART_REQUIRED = 0xffffffffc00d716c;
enum MF_E_PROCESS_RESTART_REQUIRED = 0xffffffffc00d716d;
enum MF_E_USERMODE_UNTRUSTED = 0xffffffffc00d716e;
enum MF_E_PEAUTH_SESSION_NOT_STARTED = 0xffffffffc00d716f;
enum MF_E_PEAUTH_PUBLICKEY_REVOKED = 0xffffffffc00d7171;
enum MF_E_GRL_ABSENT = 0xffffffffc00d7172;
enum MF_S_PE_TRUSTED = 0x000d7173;
enum MF_E_PE_UNTRUSTED = 0xffffffffc00d7174;
enum MF_E_PEAUTH_NOT_STARTED = 0xffffffffc00d7175;
enum MF_E_INCOMPATIBLE_SAMPLE_PROTECTION = 0xffffffffc00d7176;
enum MF_E_PE_SESSIONS_MAXED = 0xffffffffc00d7177;
enum MF_E_HIGH_SECURITY_LEVEL_CONTENT_NOT_ALLOWED = 0xffffffffc00d7178;
enum MF_E_TEST_SIGNED_COMPONENTS_NOT_ALLOWED = 0xffffffffc00d7179;
enum MF_E_ITA_UNSUPPORTED_ACTION = 0xffffffffc00d717a;
enum MF_E_ITA_ERROR_PARSING_SAP_PARAMETERS = 0xffffffffc00d717b;
enum MF_E_POLICY_MGR_ACTION_OUTOFBOUNDS = 0xffffffffc00d717c;
enum MF_E_BAD_OPL_STRUCTURE_FORMAT = 0xffffffffc00d717d;
enum MF_E_ITA_UNRECOGNIZED_ANALOG_VIDEO_PROTECTION_GUID = 0xffffffffc00d717e;
enum MF_E_NO_PMP_HOST = 0xffffffffc00d717f;
enum MF_E_ITA_OPL_DATA_NOT_INITIALIZED = 0xffffffffc00d7180;
enum MF_E_ITA_UNRECOGNIZED_ANALOG_VIDEO_OUTPUT = 0xffffffffc00d7181;
enum MF_E_ITA_UNRECOGNIZED_DIGITAL_VIDEO_OUTPUT = 0xffffffffc00d7182;
enum MF_E_RESOLUTION_REQUIRES_PMP_CREATION_CALLBACK = 0xffffffffc00d7183;
enum MF_E_INVALID_AKE_CHANNEL_PARAMETERS = 0xffffffffc00d7184;
enum MF_E_CONTENT_PROTECTION_SYSTEM_NOT_ENABLED = 0xffffffffc00d7185;
enum MF_E_UNSUPPORTED_CONTENT_PROTECTION_SYSTEM = 0xffffffffc00d7186;
enum MF_E_DRM_MIGRATION_NOT_SUPPORTED = 0xffffffffc00d7187;
enum MF_E_HDCP_AUTHENTICATION_FAILURE = 0xffffffffc00d7188;
enum MF_E_HDCP_LINK_FAILURE = 0xffffffffc00d7189;
enum MF_E_CLOCK_INVALID_CONTINUITY_KEY = 0xffffffffc00d9c40;
enum MF_E_CLOCK_NO_TIME_SOURCE = 0xffffffffc00d9c41;
enum MF_E_CLOCK_STATE_ALREADY_SET = 0xffffffffc00d9c42;
enum MF_E_CLOCK_NOT_SIMPLE = 0xffffffffc00d9c43;
enum MF_S_CLOCK_STOPPED = 0x000d9c44;
enum MF_E_CLOCK_AUDIO_DEVICE_POSITION_UNEXPECTED = 0x000d9c45;
enum MF_E_CLOCK_AUDIO_RENDER_POSITION_UNEXPECTED = 0x000d9c46;
enum MF_E_CLOCK_AUDIO_RENDER_TIME_UNEXPECTED = 0x000d9c47;
enum MF_E_NO_MORE_DROP_MODES = 0xffffffffc00da028;
enum MF_E_NO_MORE_QUALITY_LEVELS = 0xffffffffc00da029;
enum MF_E_DROPTIME_NOT_SUPPORTED = 0xffffffffc00da02a;
enum MF_E_QUALITYKNOB_WAIT_LONGER = 0xffffffffc00da02b;
enum MF_E_QM_INVALIDSTATE = 0xffffffffc00da02c;
enum MF_E_TRANSCODE_NO_CONTAINERTYPE = 0xffffffffc00da410;
enum MF_E_TRANSCODE_PROFILE_NO_MATCHING_STREAMS = 0xffffffffc00da411;
enum MF_E_TRANSCODE_NO_MATCHING_ENCODER = 0xffffffffc00da412;
enum MF_E_TRANSCODE_INVALID_PROFILE = 0xffffffffc00da413;
enum MF_E_ALLOCATOR_NOT_INITIALIZED = 0xffffffffc00da7f8;
enum MF_E_ALLOCATOR_NOT_COMMITED = 0xffffffffc00da7f9;
enum MF_E_ALLOCATOR_ALREADY_COMMITED = 0xffffffffc00da7fa;
enum MF_E_STREAM_ERROR = 0xffffffffc00da7fb;
enum MF_E_INVALID_STREAM_STATE = 0xffffffffc00da7fc;
enum MF_E_HW_STREAM_NOT_CONNECTED = 0xffffffffc00da7fd;
enum MF_E_NO_CAPTURE_DEVICES_AVAILABLE = 0xffffffffc00dabe0;
enum MF_E_CAPTURE_SINK_OUTPUT_NOT_SET = 0xffffffffc00dabe1;
enum MF_E_CAPTURE_SINK_MIRROR_ERROR = 0xffffffffc00dabe2;
enum MF_E_CAPTURE_SINK_ROTATE_ERROR = 0xffffffffc00dabe3;
enum MF_E_CAPTURE_ENGINE_INVALID_OP = 0xffffffffc00dabe4;
enum MF_E_CAPTURE_ENGINE_ALL_EFFECTS_REMOVED = 0xffffffffc00dabe5;
enum MF_E_CAPTURE_SOURCE_NO_INDEPENDENT_PHOTO_STREAM_PRESENT = 0xffffffffc00dabe6;
enum MF_E_CAPTURE_SOURCE_NO_VIDEO_STREAM_PRESENT = 0xffffffffc00dabe7;
enum MF_E_CAPTURE_SOURCE_NO_AUDIO_STREAM_PRESENT = 0xffffffffc00dabe8;
enum MF_E_CAPTURE_SOURCE_DEVICE_EXTENDEDPROP_OP_IN_PROGRESS = 0xffffffffc00dabe9;
enum MF_E_CAPTURE_PROPERTY_SET_DURING_PHOTO = 0xffffffffc00dabea;
enum MF_E_CAPTURE_NO_SAMPLES_IN_QUEUE = 0xffffffffc00dabeb;
enum MF_E_HW_ACCELERATED_THUMBNAIL_NOT_SUPPORTED = 0xffffffffc00dabec;
enum MF_E_UNSUPPORTED_CAPTURE_DEVICE_PRESENT = 0xffffffffc00dabed;
enum MF_E_TIMELINECONTROLLER_UNSUPPORTED_SOURCE_TYPE = 0xffffffffc00dafc8;
enum MF_E_TIMELINECONTROLLER_NOT_ALLOWED = 0xffffffffc00dafc9;
enum MF_E_TIMELINECONTROLLER_CANNOT_ATTACH = 0xffffffffc00dafca;
enum MF_E_MEDIA_EXTENSION_APPSERVICE_CONNECTION_FAILED = 0xffffffffc00db3b0;
enum MF_E_MEDIA_EXTENSION_APPSERVICE_REQUEST_FAILED = 0xffffffffc00db3b1;
enum MF_E_MEDIA_EXTENSION_PACKAGE_INTEGRITY_CHECK_FAILED = 0xffffffffc00db3b2;
enum MF_E_MEDIA_EXTENSION_PACKAGE_LICENSE_INVALID = 0xffffffffc00db3b3;
enum MF_INDEX_SIZE_ERR = 0x80700001;
enum MF_NOT_FOUND_ERR = 0x80700008;
enum MF_NOT_SUPPORTED_ERR = 0x80700009;
enum MF_INVALID_STATE_ERR = 0x8070000b;
enum MF_SYNTAX_ERR = 0x8070000c;
enum MF_INVALID_ACCESS_ERR = 0x8070000f;
enum MF_QUOTA_EXCEEDED_ERR = 0x80700016;
enum MF_PARSE_ERR = 0x80700051;
enum MF_TYPE_ERR = 0x80704005;
//enum DEVPKEY_DeviceInterface_IsVirtualCamera = [MISSING];
enum g_wszSpeechFormatCaps = "SpeechFormatCap";
enum g_wszWMCPCodecName = "_CODECNAME";
enum g_wszWMCPSupportedVBRModes = "_SUPPORTEDVBRMODES";
enum g_wszWMCPAudioVBRSupported = "_VBRENABLED";
enum g_wszWMCPAudioVBRQuality = "_VBRQUALITY";
enum g_wszWMCPMaxPasses = "_PASSESRECOMMENDED";
enum g_wszWMCPDefaultCrisp = "_DEFAULTCRISP";
enum COPP_ProtectionType_Unknown = 0xffffffff80000000;
enum COPP_ProtectionType_None = 0x00000000;
enum COPP_ProtectionType_HDCP = 0x00000001;
enum COPP_ProtectionType_ACP = 0x00000002;
enum COPP_ProtectionType_CGMSA = 0x00000004;
enum COPP_ProtectionType_Mask = 0xffffffff80000007;
enum COPP_ProtectionType_Reserved = 0x7ffffff8;
enum MF_BYTESTREAM_ORIGIN_NAME = GUID(0xfc358288, 0x3cb6, 0x460c, [0xa4, 0x24, 0xb6, 0x68, 0x12, 0x60, 0x37, 0x5a]);
enum MF_BYTESTREAM_CONTENT_TYPE = GUID(0xfc358289, 0x3cb6, 0x460c, [0xa4, 0x24, 0xb6, 0x68, 0x12, 0x60, 0x37, 0x5a]);
enum MF_BYTESTREAM_DURATION = GUID(0xfc35828a, 0x3cb6, 0x460c, [0xa4, 0x24, 0xb6, 0x68, 0x12, 0x60, 0x37, 0x5a]);
enum MF_BYTESTREAM_LAST_MODIFIED_TIME = GUID(0xfc35828b, 0x3cb6, 0x460c, [0xa4, 0x24, 0xb6, 0x68, 0x12, 0x60, 0x37, 0x5a]);
enum MF_BYTESTREAM_IFO_FILE_URI = GUID(0xfc35828c, 0x3cb6, 0x460c, [0xa4, 0x24, 0xb6, 0x68, 0x12, 0x60, 0x37, 0x5a]);
enum MF_BYTESTREAM_DLNA_PROFILE_ID = GUID(0xfc35828d, 0x3cb6, 0x460c, [0xa4, 0x24, 0xb6, 0x68, 0x12, 0x60, 0x37, 0x5a]);
enum MF_BYTESTREAM_EFFECTIVE_URL = GUID(0x9afa0209, 0x89d1, 0x42af, [0x84, 0x56, 0x1d, 0xe6, 0xb5, 0x62, 0xd6, 0x91]);
enum MF_BYTESTREAM_TRANSCODED = GUID(0xb6c5c282, 0x4dc9, 0x4db9, [0xab, 0x48, 0xcf, 0x3b, 0x6d, 0x8b, 0xc5, 0xe0]);
enum CLSID_MFByteStreamProxyClassFactory = GUID(0x770e8e77, 0x4916, 0x441c, [0xa9, 0xa7, 0xb3, 0x42, 0xd0, 0xee, 0xbc, 0x71]);
enum MEDeviceStreamCreated = GUID(0x252a1cf, 0x3540, 0x43b4, [0x91, 0x64, 0xd7, 0x2e, 0xb4, 0x5, 0xfa, 0x40]);
enum MF_SA_D3D_AWARE = GUID(0xeaa35c29, 0x775e, 0x488e, [0x9b, 0x61, 0xb3, 0x28, 0x3e, 0x49, 0x58, 0x3b]);
enum MF_SA_REQUIRED_SAMPLE_COUNT = GUID(0x18802c61, 0x324b, 0x4952, [0xab, 0xd0, 0x17, 0x6f, 0xf5, 0xc6, 0x96, 0xff]);
enum MFT_END_STREAMING_AWARE = GUID(0x70fbc845, 0xb07e, 0x4089, [0xb0, 0x64, 0x39, 0x9d, 0xc6, 0x11, 0xf, 0x29]);
enum MF_SA_AUDIO_ENDPOINT_AWARE = GUID(0xc0381701, 0x805c, 0x42b2, [0xac, 0x8d, 0xe2, 0xb4, 0xbf, 0x21, 0xf4, 0xf8]);
enum MFT_AUDIO_DECODER_AUDIO_ENDPOINT_ID = GUID(0xc7ccdd6e, 0x5398, 0x4695, [0x8b, 0xe7, 0x51, 0xb3, 0xe9, 0x51, 0x11, 0xbd]);
enum MFT_AUDIO_DECODER_SPATIAL_METADATA_CLIENT = GUID(0x5987df4, 0x1270, 0x4999, [0x92, 0x5f, 0x8e, 0x93, 0x9a, 0x7c, 0xa, 0xf7]);
enum MF_DMFT_FRAME_BUFFER_INFO = GUID(0x396ce1c9, 0x67a9, 0x454c, [0x87, 0x97, 0x95, 0xa4, 0x57, 0x99, 0xd8, 0x4]);
enum MF_SA_REQUIRED_SAMPLE_COUNT_PROGRESSIVE = GUID(0xb172d58e, 0xfa77, 0x4e48, [0x8d, 0x2a, 0x1d, 0xf2, 0xd8, 0x50, 0xea, 0xc2]);
enum MF_SA_MINIMUM_OUTPUT_SAMPLE_COUNT = GUID(0x851745d5, 0xc3d6, 0x476d, [0x95, 0x27, 0x49, 0x8e, 0xf2, 0xd1, 0xd, 0x18]);
enum MF_SA_MINIMUM_OUTPUT_SAMPLE_COUNT_PROGRESSIVE = GUID(0xf5523a5, 0x1cb2, 0x47c5, [0xa5, 0x50, 0x2e, 0xeb, 0x84, 0xb4, 0xd1, 0x4a]);
enum MFT_SUPPORT_3DVIDEO = GUID(0x93f81b1, 0x4f2e, 0x4631, [0x81, 0x68, 0x79, 0x34, 0x3, 0x2a, 0x1, 0xd3]);
enum MF_ENABLE_3DVIDEO_OUTPUT = GUID(0xbdad7bca, 0xe5f, 0x4b10, [0xab, 0x16, 0x26, 0xde, 0x38, 0x1b, 0x62, 0x93]);
enum MF_SA_D3D11_BINDFLAGS = GUID(0xeacf97ad, 0x65c, 0x4408, [0xbe, 0xe3, 0xfd, 0xcb, 0xfd, 0x12, 0x8b, 0xe2]);
enum MF_SA_D3D11_USAGE = GUID(0xe85fe442, 0x2ca3, 0x486e, [0xa9, 0xc7, 0x10, 0x9d, 0xda, 0x60, 0x98, 0x80]);
enum MF_SA_D3D11_AWARE = GUID(0x206b4fc8, 0xfcf9, 0x4c51, [0xaf, 0xe3, 0x97, 0x64, 0x36, 0x9e, 0x33, 0xa0]);
enum MF_SA_D3D11_SHARED = GUID(0x7b8f32c3, 0x6d96, 0x4b89, [0x92, 0x3, 0xdd, 0x38, 0xb6, 0x14, 0x14, 0xf3]);
enum MF_SA_D3D11_SHARED_WITHOUT_MUTEX = GUID(0x39dbd44d, 0x2e44, 0x4931, [0xa4, 0xc8, 0x35, 0x2d, 0x3d, 0xc4, 0x21, 0x15]);
enum MF_SA_D3D11_ALLOW_DYNAMIC_YUV_TEXTURE = GUID(0xce06d49f, 0x613, 0x4b9d, [0x86, 0xa6, 0xd8, 0xc4, 0xf9, 0xc1, 0x0, 0x75]);
enum MF_SA_D3D11_HW_PROTECTED = GUID(0x3a8ba9d9, 0x92ca, 0x4307, [0xa3, 0x91, 0x69, 0x99, 0xdb, 0xf3, 0xb6, 0xce]);
enum MF_SA_BUFFERS_PER_SAMPLE = GUID(0x873c5171, 0x1e3d, 0x4e25, [0x98, 0x8d, 0xb4, 0x33, 0xce, 0x4, 0x19, 0x83]);
enum MF_SA_D3D11_ALLOCATE_DISPLAYABLE_RESOURCES = GUID(0xeeface6d, 0x2ea9, 0x4adf, [0xbb, 0xdf, 0x7b, 0xbc, 0x48, 0x2a, 0x1b, 0x6d]);
enum MFT_DECODER_EXPOSE_OUTPUT_TYPES_IN_NATIVE_ORDER = GUID(0xef80833f, 0xf8fa, 0x44d9, [0x80, 0xd8, 0x41, 0xed, 0x62, 0x32, 0x67, 0xc]);
enum MFT_DECODER_QUALITY_MANAGEMENT_CUSTOM_CONTROL = GUID(0xa24e30d7, 0xde25, 0x4558, [0xbb, 0xfb, 0x71, 0x7, 0xa, 0x2d, 0x33, 0x2e]);
enum MFT_DECODER_QUALITY_MANAGEMENT_RECOVERY_WITHOUT_ARTIFACTS = GUID(0xd8980deb, 0xa48, 0x425f, [0x86, 0x23, 0x61, 0x1d, 0xb4, 0x1d, 0x38, 0x10]);
enum MFT_REMUX_MARK_I_PICTURE_AS_CLEAN_POINT = GUID(0x364e8f85, 0x3f2e, 0x436c, [0xb2, 0xa2, 0x44, 0x40, 0xa0, 0x12, 0xa9, 0xe8]);
enum MFT_DECODER_FINAL_VIDEO_RESOLUTION_HINT = GUID(0xdc2f8496, 0x15c4, 0x407a, [0xb6, 0xf0, 0x1b, 0x66, 0xab, 0x5f, 0xbf, 0x53]);
enum MFT_ENCODER_SUPPORTS_CONFIG_EVENT = GUID(0x86a355ae, 0x3a77, 0x4ec4, [0x9f, 0x31, 0x1, 0x14, 0x9a, 0x4e, 0x92, 0xde]);
enum MFT_ENUM_HARDWARE_VENDOR_ID_Attribute = GUID(0x3aecb0cc, 0x35b, 0x4bcc, [0x81, 0x85, 0x2b, 0x8d, 0x55, 0x1e, 0xf3, 0xaf]);
enum MF_TRANSFORM_ASYNC = GUID(0xf81a699a, 0x649a, 0x497d, [0x8c, 0x73, 0x29, 0xf8, 0xfe, 0xd6, 0xad, 0x7a]);
enum MF_TRANSFORM_ASYNC_UNLOCK = GUID(0xe5666d6b, 0x3422, 0x4eb6, [0xa4, 0x21, 0xda, 0x7d, 0xb1, 0xf8, 0xe2, 0x7]);
enum MF_TRANSFORM_FLAGS_Attribute = GUID(0x9359bb7e, 0x6275, 0x46c4, [0xa0, 0x25, 0x1c, 0x1, 0xe4, 0x5f, 0x1a, 0x86]);
enum MF_TRANSFORM_CATEGORY_Attribute = GUID(0xceabba49, 0x506d, 0x4757, [0xa6, 0xff, 0x66, 0xc1, 0x84, 0x98, 0x7e, 0x4e]);
enum MFT_TRANSFORM_CLSID_Attribute = GUID(0x6821c42b, 0x65a4, 0x4e82, [0x99, 0xbc, 0x9a, 0x88, 0x20, 0x5e, 0xcd, 0xc]);
enum MFT_INPUT_TYPES_Attributes = GUID(0x4276c9b1, 0x759d, 0x4bf3, [0x9c, 0xd0, 0xd, 0x72, 0x3d, 0x13, 0x8f, 0x96]);
enum MFT_OUTPUT_TYPES_Attributes = GUID(0x8eae8cf3, 0xa44f, 0x4306, [0xba, 0x5c, 0xbf, 0x5d, 0xda, 0x24, 0x28, 0x18]);
enum MFT_ENUM_HARDWARE_URL_Attribute = GUID(0x2fb866ac, 0xb078, 0x4942, [0xab, 0x6c, 0x0, 0x3d, 0x5, 0xcd, 0xa6, 0x74]);
enum MFT_FRIENDLY_NAME_Attribute = GUID(0x314ffbae, 0x5b41, 0x4c95, [0x9c, 0x19, 0x4e, 0x7d, 0x58, 0x6f, 0xac, 0xe3]);
enum MFT_CONNECTED_STREAM_ATTRIBUTE = GUID(0x71eeb820, 0xa59f, 0x4de2, [0xbc, 0xec, 0x38, 0xdb, 0x1d, 0xd6, 0x11, 0xa4]);
enum MFT_CONNECTED_TO_HW_STREAM = GUID(0x34e6e728, 0x6d6, 0x4491, [0xa5, 0x53, 0x47, 0x95, 0x65, 0xd, 0xb9, 0x12]);
enum MFT_PREFERRED_OUTPUTTYPE_Attribute = GUID(0x7e700499, 0x396a, 0x49ee, [0xb1, 0xb4, 0xf6, 0x28, 0x2, 0x1e, 0x8c, 0x9d]);
enum MFT_PROCESS_LOCAL_Attribute = GUID(0x543186e4, 0x4649, 0x4e65, [0xb5, 0x88, 0x4a, 0xa3, 0x52, 0xaf, 0xf3, 0x79]);
enum MFT_PREFERRED_ENCODER_PROFILE = GUID(0x53004909, 0x1ef5, 0x46d7, [0xa1, 0x8e, 0x5a, 0x75, 0xf8, 0xb5, 0x90, 0x5f]);
enum MFT_HW_TIMESTAMP_WITH_QPC_Attribute = GUID(0x8d030fb8, 0xcc43, 0x4258, [0xa2, 0x2e, 0x92, 0x10, 0xbe, 0xf8, 0x9b, 0xe4]);
enum MFT_FIELDOFUSE_UNLOCK_Attribute = GUID(0x8ec2e9fd, 0x9148, 0x410d, [0x83, 0x1e, 0x70, 0x24, 0x39, 0x46, 0x1a, 0x8e]);
enum MFT_CODEC_MERIT_Attribute = GUID(0x88a7cb15, 0x7b07, 0x4a34, [0x91, 0x28, 0xe6, 0x4c, 0x67, 0x3, 0xc4, 0xd3]);
enum MFT_ENUM_TRANSCODE_ONLY_ATTRIBUTE = GUID(0x111ea8cd, 0xb62a, 0x4bdb, [0x89, 0xf6, 0x67, 0xff, 0xcd, 0xc2, 0x45, 0x8b]);
enum MFT_AUDIO_DECODER_DEGRADATION_INFO_ATTRIBUTE = GUID(0x6c3386ad, 0xec20, 0x430d, [0xb2, 0xa5, 0x50, 0x5c, 0x71, 0x78, 0xd9, 0xc4]);
enum MFT_POLICY_SET_AWARE = GUID(0x5a633b19, 0xcc39, 0x4fa8, [0x8c, 0xa5, 0x59, 0x98, 0x1b, 0x7a, 0x0, 0x18]);
enum MFT_USING_HARDWARE_DRM = GUID(0x34faa77d, 0xd79e, 0x4957, [0xb8, 0xce, 0x36, 0x2b, 0x26, 0x84, 0x99, 0x6c]);
enum MF_WVC1_PROG_SINGLE_SLICE_CONTENT = GUID(0x67ec2559, 0xf2f, 0x4420, [0xa4, 0xdd, 0x2f, 0x8e, 0xe7, 0xa5, 0x73, 0x8b]);
enum MF_PROGRESSIVE_CODING_CONTENT = GUID(0x8f020eea, 0x1508, 0x471f, [0x9d, 0xa6, 0x50, 0x7d, 0x7c, 0xfa, 0x40, 0xdb]);
enum MF_NALU_LENGTH_SET = GUID(0xa7911d53, 0x12a4, 0x4965, [0xae, 0x70, 0x6e, 0xad, 0xd6, 0xff, 0x5, 0x51]);
enum MF_NALU_LENGTH_INFORMATION = GUID(0x19124e7c, 0xad4b, 0x465f, [0xbb, 0x18, 0x20, 0x18, 0x62, 0x87, 0xb6, 0xaf]);
enum MF_USER_DATA_PAYLOAD = GUID(0xd1d4985d, 0xdc92, 0x457a, [0xb3, 0xa0, 0x65, 0x1a, 0x33, 0xa3, 0x10, 0x47]);
enum MF_MPEG4SINK_SPSPPS_PASSTHROUGH = GUID(0x5601a134, 0x2005, 0x4ad2, [0xb3, 0x7d, 0x22, 0xa6, 0xc5, 0x54, 0xde, 0xb2]);
enum MF_MPEG4SINK_MOOV_BEFORE_MDAT = GUID(0xf672e3ac, 0xe1e6, 0x4f10, [0xb5, 0xec, 0x5f, 0x3b, 0x30, 0x82, 0x88, 0x16]);
enum MF_MPEG4SINK_MINIMUM_PROPERTIES_SIZE = GUID(0xdca1ed52, 0x450e, 0x4a22, [0x8c, 0x62, 0x4e, 0xd4, 0x52, 0xf7, 0xa1, 0x87]);
enum MF_MPEG4SINK_MIN_FRAGMENT_DURATION = GUID(0xa30b570c, 0x8efd, 0x45e8, [0x94, 0xfe, 0x27, 0xc8, 0x4b, 0x5b, 0xdf, 0xf6]);
enum MF_MPEG4SINK_MAX_CODED_SEQUENCES_PER_FRAGMENT = GUID(0xfc1b3bd6, 0x692d, 0x4ce5, [0x92, 0x99, 0x73, 0x8a, 0xa5, 0x46, 0x3e, 0x9a]);
enum MF_SESSION_TOPOLOADER = GUID(0x1e83d482, 0x1f1c, 0x4571, [0x84, 0x5, 0x88, 0xf4, 0xb2, 0x18, 0x1f, 0x71]);
enum MF_SESSION_GLOBAL_TIME = GUID(0x1e83d482, 0x1f1c, 0x4571, [0x84, 0x5, 0x88, 0xf4, 0xb2, 0x18, 0x1f, 0x72]);
enum MF_SESSION_QUALITY_MANAGER = GUID(0x1e83d482, 0x1f1c, 0x4571, [0x84, 0x5, 0x88, 0xf4, 0xb2, 0x18, 0x1f, 0x73]);
enum MF_SESSION_CONTENT_PROTECTION_MANAGER = GUID(0x1e83d482, 0x1f1c, 0x4571, [0x84, 0x5, 0x88, 0xf4, 0xb2, 0x18, 0x1f, 0x74]);
enum MF_SESSION_SERVER_CONTEXT = GUID(0xafe5b291, 0x50fa, 0x46e8, [0xb9, 0xbe, 0xc, 0xc, 0x3c, 0xe4, 0xb3, 0xa5]);
enum MF_SESSION_REMOTE_SOURCE_MODE = GUID(0xf4033ef4, 0x9bb3, 0x4378, [0x94, 0x1f, 0x85, 0xa0, 0x85, 0x6b, 0xc2, 0x44]);
enum MF_SESSION_APPROX_EVENT_OCCURRENCE_TIME = GUID(0x190e852f, 0x6238, 0x42d1, [0xb5, 0xaf, 0x69, 0xea, 0x33, 0x8e, 0xf8, 0x50]);
enum MF_PMP_SERVER_CONTEXT = GUID(0x2f00c910, 0xd2cf, 0x4278, [0x8b, 0x6a, 0xd0, 0x77, 0xfa, 0xc3, 0xa2, 0x5f]);
enum MF_TIME_FORMAT_ENTRY_RELATIVE = GUID(0x4399f178, 0x46d3, 0x4504, [0xaf, 0xda, 0x20, 0xd3, 0x2e, 0x9b, 0xa3, 0x60]);
enum MF_SOURCE_STREAM_SUPPORTS_HW_CONNECTION = GUID(0xa38253aa, 0x6314, 0x42fd, [0xa3, 0xce, 0xbb, 0x27, 0xb6, 0x85, 0x99, 0x46]);
enum MF_STREAM_SINK_SUPPORTS_HW_CONNECTION = GUID(0x9b465cbf, 0x597, 0x4f9e, [0x9f, 0x3c, 0xb9, 0x7e, 0xee, 0xf9, 0x3, 0x59]);
enum MF_STREAM_SINK_SUPPORTS_ROTATION = GUID(0xb3e96280, 0xbd05, 0x41a5, [0x97, 0xad, 0x8a, 0x7f, 0xee, 0x24, 0xb9, 0x12]);
enum MF_SINK_VIDEO_PTS = GUID(0x2162bde7, 0x421e, 0x4b90, [0x9b, 0x33, 0xe5, 0x8f, 0xbf, 0x1d, 0x58, 0xb6]);
enum MF_SINK_VIDEO_NATIVE_WIDTH = GUID(0xe6d6a707, 0x1505, 0x4747, [0x9b, 0x10, 0x72, 0xd2, 0xd1, 0x58, 0xcb, 0x3a]);
enum MF_SINK_VIDEO_NATIVE_HEIGHT = GUID(0xf0ca6705, 0x490c, 0x43e8, [0x94, 0x1c, 0xc0, 0xb3, 0x20, 0x6b, 0x9a, 0x65]);
enum MF_SINK_VIDEO_DISPLAY_ASPECT_RATIO_NUMERATOR = GUID(0xd0f33b22, 0xb78a, 0x4879, [0xb4, 0x55, 0xf0, 0x3e, 0xf3, 0xfa, 0x82, 0xcd]);
enum MF_SINK_VIDEO_DISPLAY_ASPECT_RATIO_DENOMINATOR = GUID(0x6ea1eb97, 0x1fe0, 0x4f10, [0xa6, 0xe4, 0x1f, 0x4f, 0x66, 0x15, 0x64, 0xe0]);
enum MF_BD_MVC_PLANE_OFFSET_METADATA = GUID(0x62a654e4, 0xb76c, 0x4901, [0x98, 0x23, 0x2c, 0xb6, 0x15, 0xd4, 0x73, 0x18]);
enum MF_LUMA_KEY_ENABLE = GUID(0x7369820f, 0x76de, 0x43ca, [0x92, 0x84, 0x47, 0xb8, 0xf3, 0x7e, 0x6, 0x49]);
enum MF_LUMA_KEY_LOWER = GUID(0x93d7b8d5, 0xb81, 0x4715, [0xae, 0xa0, 0x87, 0x25, 0x87, 0x16, 0x21, 0xe9]);
enum MF_LUMA_KEY_UPPER = GUID(0xd09f39bb, 0x4602, 0x4c31, [0xa7, 0x6, 0xa1, 0x21, 0x71, 0xa5, 0x11, 0xa]);
enum MF_USER_EXTENDED_ATTRIBUTES = GUID(0xc02abac6, 0xfeb2, 0x4541, [0x92, 0x2f, 0x92, 0xb, 0x43, 0x70, 0x27, 0x22]);
enum MF_INDEPENDENT_STILL_IMAGE = GUID(0xea12af41, 0x710, 0x42c9, [0xa1, 0x27, 0xda, 0xa3, 0xe7, 0x84, 0x83, 0xa5]);
enum MF_XVP_SAMPLE_LOCK_TIMEOUT = GUID(0xaa4ddb29, 0x5134, 0x4363, [0xac, 0x72, 0x83, 0xec, 0x4b, 0xc1, 0x4, 0x26]);
enum MF_TOPOLOGY_PROJECTSTART = GUID(0x7ed3f802, 0x86bb, 0x4b3f, [0xb7, 0xe4, 0x7c, 0xb4, 0x3a, 0xfd, 0x4b, 0x80]);
enum MF_TOPOLOGY_PROJECTSTOP = GUID(0x7ed3f803, 0x86bb, 0x4b3f, [0xb7, 0xe4, 0x7c, 0xb4, 0x3a, 0xfd, 0x4b, 0x80]);
enum MF_TOPOLOGY_NO_MARKIN_MARKOUT = GUID(0x7ed3f804, 0x86bb, 0x4b3f, [0xb7, 0xe4, 0x7c, 0xb4, 0x3a, 0xfd, 0x4b, 0x80]);
enum MF_TOPOLOGY_DXVA_MODE = GUID(0x1e8d34f6, 0xf5ab, 0x4e23, [0xbb, 0x88, 0x87, 0x4a, 0xa3, 0xa1, 0xa7, 0x4d]);
enum MF_TOPOLOGY_ENABLE_XVP_FOR_PLAYBACK = GUID(0x1967731f, 0xcd78, 0x42fc, [0xb0, 0x26, 0x9, 0x92, 0xa5, 0x6e, 0x56, 0x93]);
enum MF_TOPOLOGY_STATIC_PLAYBACK_OPTIMIZATIONS = GUID(0xb86cac42, 0x41a6, 0x4b79, [0x89, 0x7a, 0x1a, 0xb0, 0xe5, 0x2b, 0x4a, 0x1b]);
enum MF_TOPOLOGY_PLAYBACK_MAX_DIMS = GUID(0x5715cf19, 0x5768, 0x44aa, [0xad, 0x6e, 0x87, 0x21, 0xf1, 0xb0, 0xf9, 0xbb]);
enum MF_TOPOLOGY_HARDWARE_MODE = GUID(0xd2d362fd, 0x4e4f, 0x4191, [0xa5, 0x79, 0xc6, 0x18, 0xb6, 0x67, 0x6, 0xaf]);
enum MF_TOPOLOGY_PLAYBACK_FRAMERATE = GUID(0xc164737a, 0xc2b1, 0x4553, [0x83, 0xbb, 0x5a, 0x52, 0x60, 0x72, 0x44, 0x8f]);
enum MF_TOPOLOGY_DYNAMIC_CHANGE_NOT_ALLOWED = GUID(0xd529950b, 0xd484, 0x4527, [0xa9, 0xcd, 0xb1, 0x90, 0x95, 0x32, 0xb5, 0xb0]);
enum MF_TOPOLOGY_ENUMERATE_SOURCE_TYPES = GUID(0x6248c36d, 0x5d0b, 0x4f40, [0xa0, 0xbb, 0xb0, 0xb3, 0x5, 0xf7, 0x76, 0x98]);
enum MF_TOPOLOGY_START_TIME_ON_PRESENTATION_SWITCH = GUID(0xc8cc113f, 0x7951, 0x4548, [0xaa, 0xd6, 0x9e, 0xd6, 0x20, 0x2e, 0x62, 0xb3]);
enum MF_DISABLE_LOCALLY_REGISTERED_PLUGINS = GUID(0x66b16da9, 0xadd4, 0x47e0, [0xa1, 0x6b, 0x5a, 0xf1, 0xfb, 0x48, 0x36, 0x34]);
enum MF_LOCAL_PLUGIN_CONTROL_POLICY = GUID(0xd91b0085, 0xc86d, 0x4f81, [0x88, 0x22, 0x8c, 0x68, 0xe1, 0xd7, 0xfa, 0x4]);
enum MF_TOPONODE_FLUSH = GUID(0x494bbce8, 0xb031, 0x4e38, [0x97, 0xc4, 0xd5, 0x42, 0x2d, 0xd6, 0x18, 0xdc]);
enum MF_TOPONODE_DRAIN = GUID(0x494bbce9, 0xb031, 0x4e38, [0x97, 0xc4, 0xd5, 0x42, 0x2d, 0xd6, 0x18, 0xdc]);
enum MF_TOPONODE_D3DAWARE = GUID(0x494bbced, 0xb031, 0x4e38, [0x97, 0xc4, 0xd5, 0x42, 0x2d, 0xd6, 0x18, 0xdc]);
enum MF_TOPOLOGY_RESOLUTION_STATUS = GUID(0x494bbcde, 0xb031, 0x4e38, [0x97, 0xc4, 0xd5, 0x42, 0x2d, 0xd6, 0x18, 0xdc]);
enum MF_TOPONODE_ERRORCODE = GUID(0x494bbcee, 0xb031, 0x4e38, [0x97, 0xc4, 0xd5, 0x42, 0x2d, 0xd6, 0x18, 0xdc]);
enum MF_TOPONODE_CONNECT_METHOD = GUID(0x494bbcf1, 0xb031, 0x4e38, [0x97, 0xc4, 0xd5, 0x42, 0x2d, 0xd6, 0x18, 0xdc]);
enum MF_TOPONODE_LOCKED = GUID(0x494bbcf7, 0xb031, 0x4e38, [0x97, 0xc4, 0xd5, 0x42, 0x2d, 0xd6, 0x18, 0xdc]);
enum MF_TOPONODE_WORKQUEUE_ID = GUID(0x494bbcf8, 0xb031, 0x4e38, [0x97, 0xc4, 0xd5, 0x42, 0x2d, 0xd6, 0x18, 0xdc]);
enum MF_TOPONODE_WORKQUEUE_MMCSS_CLASS = GUID(0x494bbcf9, 0xb031, 0x4e38, [0x97, 0xc4, 0xd5, 0x42, 0x2d, 0xd6, 0x18, 0xdc]);
enum MF_TOPONODE_DECRYPTOR = GUID(0x494bbcfa, 0xb031, 0x4e38, [0x97, 0xc4, 0xd5, 0x42, 0x2d, 0xd6, 0x18, 0xdc]);
enum MF_TOPONODE_DISCARDABLE = GUID(0x494bbcfb, 0xb031, 0x4e38, [0x97, 0xc4, 0xd5, 0x42, 0x2d, 0xd6, 0x18, 0xdc]);
enum MF_TOPONODE_ERROR_MAJORTYPE = GUID(0x494bbcfd, 0xb031, 0x4e38, [0x97, 0xc4, 0xd5, 0x42, 0x2d, 0xd6, 0x18, 0xdc]);
enum MF_TOPONODE_ERROR_SUBTYPE = GUID(0x494bbcfe, 0xb031, 0x4e38, [0x97, 0xc4, 0xd5, 0x42, 0x2d, 0xd6, 0x18, 0xdc]);
enum MF_TOPONODE_WORKQUEUE_MMCSS_TASKID = GUID(0x494bbcff, 0xb031, 0x4e38, [0x97, 0xc4, 0xd5, 0x42, 0x2d, 0xd6, 0x18, 0xdc]);
enum MF_TOPONODE_WORKQUEUE_MMCSS_PRIORITY = GUID(0x5001f840, 0x2816, 0x48f4, [0x93, 0x64, 0xad, 0x1e, 0xf6, 0x61, 0xa1, 0x23]);
enum MF_TOPONODE_WORKQUEUE_ITEM_PRIORITY = GUID(0xa1ff99be, 0x5e97, 0x4a53, [0xb4, 0x94, 0x56, 0x8c, 0x64, 0x2c, 0xf, 0xf3]);
enum MF_TOPONODE_MARKIN_HERE = GUID(0x494bbd00, 0xb031, 0x4e38, [0x97, 0xc4, 0xd5, 0x42, 0x2d, 0xd6, 0x18, 0xdc]);
enum MF_TOPONODE_MARKOUT_HERE = GUID(0x494bbd01, 0xb031, 0x4e38, [0x97, 0xc4, 0xd5, 0x42, 0x2d, 0xd6, 0x18, 0xdc]);
enum MF_TOPONODE_DECODER = GUID(0x494bbd02, 0xb031, 0x4e38, [0x97, 0xc4, 0xd5, 0x42, 0x2d, 0xd6, 0x18, 0xdc]);
enum MF_TOPONODE_MEDIASTART = GUID(0x835c58ea, 0xe075, 0x4bc7, [0xbc, 0xba, 0x4d, 0xe0, 0x0, 0xdf, 0x9a, 0xe6]);
enum MF_TOPONODE_MEDIASTOP = GUID(0x835c58eb, 0xe075, 0x4bc7, [0xbc, 0xba, 0x4d, 0xe0, 0x0, 0xdf, 0x9a, 0xe6]);
enum MF_TOPONODE_SOURCE = GUID(0x835c58ec, 0xe075, 0x4bc7, [0xbc, 0xba, 0x4d, 0xe0, 0x0, 0xdf, 0x9a, 0xe6]);
enum MF_TOPONODE_PRESENTATION_DESCRIPTOR = GUID(0x835c58ed, 0xe075, 0x4bc7, [0xbc, 0xba, 0x4d, 0xe0, 0x0, 0xdf, 0x9a, 0xe6]);
enum MF_TOPONODE_STREAM_DESCRIPTOR = GUID(0x835c58ee, 0xe075, 0x4bc7, [0xbc, 0xba, 0x4d, 0xe0, 0x0, 0xdf, 0x9a, 0xe6]);
enum MF_TOPONODE_SEQUENCE_ELEMENTID = GUID(0x835c58ef, 0xe075, 0x4bc7, [0xbc, 0xba, 0x4d, 0xe0, 0x0, 0xdf, 0x9a, 0xe6]);
enum MF_TOPONODE_TRANSFORM_OBJECTID = GUID(0x88dcc0c9, 0x293e, 0x4e8b, [0x9a, 0xeb, 0xa, 0xd6, 0x4c, 0xc0, 0x16, 0xb0]);
enum MF_TOPONODE_STREAMID = GUID(0x14932f9b, 0x9087, 0x4bb4, [0x84, 0x12, 0x51, 0x67, 0x14, 0x5c, 0xbe, 0x4]);
enum MF_TOPONODE_NOSHUTDOWN_ON_REMOVE = GUID(0x14932f9c, 0x9087, 0x4bb4, [0x84, 0x12, 0x51, 0x67, 0x14, 0x5c, 0xbe, 0x4]);
enum MF_TOPONODE_RATELESS = GUID(0x14932f9d, 0x9087, 0x4bb4, [0x84, 0x12, 0x51, 0x67, 0x14, 0x5c, 0xbe, 0x4]);
enum MF_TOPONODE_DISABLE_PREROLL = GUID(0x14932f9e, 0x9087, 0x4bb4, [0x84, 0x12, 0x51, 0x67, 0x14, 0x5c, 0xbe, 0x4]);
enum MF_TOPONODE_PRIMARYOUTPUT = GUID(0x6304ef99, 0x16b2, 0x4ebe, [0x9d, 0x67, 0xe4, 0xc5, 0x39, 0xb3, 0xa2, 0x59]);
enum MF_PD_PMPHOST_CONTEXT = GUID(0x6c990d31, 0xbb8e, 0x477a, [0x85, 0x98, 0xd, 0x5d, 0x96, 0xfc, 0xd8, 0x8a]);
enum MF_PD_APP_CONTEXT = GUID(0x6c990d32, 0xbb8e, 0x477a, [0x85, 0x98, 0xd, 0x5d, 0x96, 0xfc, 0xd8, 0x8a]);
enum MF_PD_DURATION = GUID(0x6c990d33, 0xbb8e, 0x477a, [0x85, 0x98, 0xd, 0x5d, 0x96, 0xfc, 0xd8, 0x8a]);
enum MF_PD_TOTAL_FILE_SIZE = GUID(0x6c990d34, 0xbb8e, 0x477a, [0x85, 0x98, 0xd, 0x5d, 0x96, 0xfc, 0xd8, 0x8a]);
enum MF_PD_AUDIO_ENCODING_BITRATE = GUID(0x6c990d35, 0xbb8e, 0x477a, [0x85, 0x98, 0xd, 0x5d, 0x96, 0xfc, 0xd8, 0x8a]);
enum MF_PD_VIDEO_ENCODING_BITRATE = GUID(0x6c990d36, 0xbb8e, 0x477a, [0x85, 0x98, 0xd, 0x5d, 0x96, 0xfc, 0xd8, 0x8a]);
enum MF_PD_MIME_TYPE = GUID(0x6c990d37, 0xbb8e, 0x477a, [0x85, 0x98, 0xd, 0x5d, 0x96, 0xfc, 0xd8, 0x8a]);
enum MF_PD_LAST_MODIFIED_TIME = GUID(0x6c990d38, 0xbb8e, 0x477a, [0x85, 0x98, 0xd, 0x5d, 0x96, 0xfc, 0xd8, 0x8a]);
enum MF_PD_PLAYBACK_ELEMENT_ID = GUID(0x6c990d39, 0xbb8e, 0x477a, [0x85, 0x98, 0xd, 0x5d, 0x96, 0xfc, 0xd8, 0x8a]);
enum MF_PD_PREFERRED_LANGUAGE = GUID(0x6c990d3a, 0xbb8e, 0x477a, [0x85, 0x98, 0xd, 0x5d, 0x96, 0xfc, 0xd8, 0x8a]);
enum MF_PD_PLAYBACK_BOUNDARY_TIME = GUID(0x6c990d3b, 0xbb8e, 0x477a, [0x85, 0x98, 0xd, 0x5d, 0x96, 0xfc, 0xd8, 0x8a]);
enum MF_PD_AUDIO_ISVARIABLEBITRATE = GUID(0x33026ee0, 0xe387, 0x4582, [0xae, 0xa, 0x34, 0xa2, 0xad, 0x3b, 0xaa, 0x18]);
enum MF_SD_LANGUAGE = GUID(0xaf2180, 0xbdc2, 0x423c, [0xab, 0xca, 0xf5, 0x3, 0x59, 0x3b, 0xc1, 0x21]);
enum MF_SD_PROTECTED = GUID(0xaf2181, 0xbdc2, 0x423c, [0xab, 0xca, 0xf5, 0x3, 0x59, 0x3b, 0xc1, 0x21]);
enum MF_SD_STREAM_NAME = GUID(0x4f1b099d, 0xd314, 0x41e5, [0xa7, 0x81, 0x7f, 0xef, 0xaa, 0x4c, 0x50, 0x1f]);
enum MF_SD_MUTUALLY_EXCLUSIVE = GUID(0x23ef79c, 0x388d, 0x487f, [0xac, 0x17, 0x69, 0x6c, 0xd6, 0xe3, 0xc6, 0xf5]);
enum MF_ACTIVATE_CUSTOM_VIDEO_MIXER_CLSID = GUID(0xba491360, 0xbe50, 0x451e, [0x95, 0xab, 0x6d, 0x4a, 0xcc, 0xc7, 0xda, 0xd8]);
enum MF_ACTIVATE_CUSTOM_VIDEO_MIXER_ACTIVATE = GUID(0xba491361, 0xbe50, 0x451e, [0x95, 0xab, 0x6d, 0x4a, 0xcc, 0xc7, 0xda, 0xd8]);
enum MF_ACTIVATE_CUSTOM_VIDEO_MIXER_FLAGS = GUID(0xba491362, 0xbe50, 0x451e, [0x95, 0xab, 0x6d, 0x4a, 0xcc, 0xc7, 0xda, 0xd8]);
enum MF_ACTIVATE_CUSTOM_VIDEO_PRESENTER_CLSID = GUID(0xba491364, 0xbe50, 0x451e, [0x95, 0xab, 0x6d, 0x4a, 0xcc, 0xc7, 0xda, 0xd8]);
enum MF_ACTIVATE_CUSTOM_VIDEO_PRESENTER_ACTIVATE = GUID(0xba491365, 0xbe50, 0x451e, [0x95, 0xab, 0x6d, 0x4a, 0xcc, 0xc7, 0xda, 0xd8]);
enum MF_ACTIVATE_CUSTOM_VIDEO_PRESENTER_FLAGS = GUID(0xba491366, 0xbe50, 0x451e, [0x95, 0xab, 0x6d, 0x4a, 0xcc, 0xc7, 0xda, 0xd8]);
enum MF_ACTIVATE_MFT_LOCKED = GUID(0xc1f6093c, 0x7f65, 0x4fbd, [0x9e, 0x39, 0x5f, 0xae, 0xc3, 0xc4, 0xfb, 0xd7]);
enum MF_ACTIVATE_VIDEO_WINDOW = GUID(0x9a2dbbdd, 0xf57e, 0x4162, [0x82, 0xb9, 0x68, 0x31, 0x37, 0x76, 0x82, 0xd3]);
enum MF_AUDIO_RENDERER_ATTRIBUTE_FLAGS = GUID(0xede4b5e0, 0xf805, 0x4d6c, [0x99, 0xb3, 0xdb, 0x1, 0xbf, 0x95, 0xdf, 0xab]);
enum MF_AUDIO_RENDERER_ATTRIBUTE_SESSION_ID = GUID(0xede4b5e3, 0xf805, 0x4d6c, [0x99, 0xb3, 0xdb, 0x1, 0xbf, 0x95, 0xdf, 0xab]);
enum MF_AUDIO_RENDERER_ATTRIBUTE_ENDPOINT_ID = GUID(0xb10aaec3, 0xef71, 0x4cc3, [0xb8, 0x73, 0x5, 0xa9, 0xa0, 0x8b, 0x9f, 0x8e]);
enum MF_AUDIO_RENDERER_ATTRIBUTE_ENDPOINT_ROLE = GUID(0x6ba644ff, 0x27c5, 0x4d02, [0x98, 0x87, 0xc2, 0x86, 0x19, 0xfd, 0xb9, 0x1b]);
enum MF_AUDIO_RENDERER_ATTRIBUTE_STREAM_CATEGORY = GUID(0xa9770471, 0x92ec, 0x4df4, [0x94, 0xfe, 0x81, 0xc3, 0x6f, 0xc, 0x3a, 0x7a]);
enum MFENABLETYPE_WMDRMV1_LicenseAcquisition = GUID(0x4ff6eeaf, 0xb43, 0x4797, [0x9b, 0x85, 0xab, 0xf3, 0x18, 0x15, 0xe7, 0xb0]);
enum MFENABLETYPE_WMDRMV7_LicenseAcquisition = GUID(0x3306df, 0x4a06, 0x4884, [0xa0, 0x97, 0xef, 0x6d, 0x22, 0xec, 0x84, 0xa3]);
enum MFENABLETYPE_WMDRMV7_Individualization = GUID(0xacd2c84a, 0xb303, 0x4f65, [0xbc, 0x2c, 0x2c, 0x84, 0x8d, 0x1, 0xa9, 0x89]);
enum MFENABLETYPE_MF_UpdateRevocationInformation = GUID(0xe558b0b5, 0xb3c4, 0x44a0, [0x92, 0x4c, 0x50, 0xd1, 0x78, 0x93, 0x23, 0x85]);
enum MFENABLETYPE_MF_UpdateUntrustedComponent = GUID(0x9879f3d6, 0xcee2, 0x48e6, [0xb5, 0x73, 0x97, 0x67, 0xab, 0x17, 0x2f, 0x16]);
enum MFENABLETYPE_MF_RebootRequired = GUID(0x6d4d3d4b, 0xece, 0x4652, [0x8b, 0x3a, 0xf2, 0xd2, 0x42, 0x60, 0xd8, 0x87]);
enum MF_METADATA_PROVIDER_SERVICE = GUID(0xdb214084, 0x58a4, 0x4d2e, [0xb8, 0x4f, 0x6f, 0x75, 0x5b, 0x2f, 0x7a, 0xd]);
enum MF_PROPERTY_HANDLER_SERVICE = GUID(0xa3face02, 0x32b8, 0x41dd, [0x90, 0xe7, 0x5f, 0xef, 0x7c, 0x89, 0x91, 0xb5]);
enum MF_RATE_CONTROL_SERVICE = GUID(0x866fa297, 0xb802, 0x4bf8, [0x9d, 0xc9, 0x5e, 0x3b, 0x6a, 0x9f, 0x53, 0xc9]);
enum MF_TIMECODE_SERVICE = GUID(0xa0d502a7, 0xeb3, 0x4885, [0xb1, 0xb9, 0x9f, 0xeb, 0xd, 0x8, 0x34, 0x54]);
enum MR_POLICY_VOLUME_SERVICE = GUID(0x1abaa2ac, 0x9d3b, 0x47c6, [0xab, 0x48, 0xc5, 0x95, 0x6, 0xde, 0x78, 0x4d]);
enum MR_CAPTURE_POLICY_VOLUME_SERVICE = GUID(0x24030acd, 0x107a, 0x4265, [0x97, 0x5c, 0x41, 0x4e, 0x33, 0xe6, 0x5f, 0x2a]);
enum MR_STREAM_VOLUME_SERVICE = GUID(0xf8b5fa2f, 0x32ef, 0x46f5, [0xb1, 0x72, 0x13, 0x21, 0x21, 0x2f, 0xb2, 0xc4]);
enum MR_AUDIO_POLICY_SERVICE = GUID(0x911fd737, 0x6775, 0x4ab0, [0xa6, 0x14, 0x29, 0x78, 0x62, 0xfd, 0xac, 0x88]);
enum MF_SAMPLEGRABBERSINK_SAMPLE_TIME_OFFSET = GUID(0x62e3d776, 0x8100, 0x4e03, [0xa6, 0xe8, 0xbd, 0x38, 0x57, 0xac, 0x9c, 0x47]);
enum MF_SAMPLEGRABBERSINK_IGNORE_CLOCK = GUID(0xefda2c0, 0x2b69, 0x4e2e, [0xab, 0x8d, 0x46, 0xdc, 0xbf, 0xf7, 0xd2, 0x5d]);
enum MF_QUALITY_SERVICES = GUID(0xb7e2be11, 0x2f96, 0x4640, [0xb5, 0x2c, 0x28, 0x23, 0x65, 0xbd, 0xf1, 0x6c]);
enum MF_WORKQUEUE_SERVICES = GUID(0x8e37d489, 0x41e0, 0x413a, [0x90, 0x68, 0x28, 0x7c, 0x88, 0x6d, 0x8d, 0xda]);
enum MF_QUALITY_NOTIFY_PROCESSING_LATENCY = GUID(0xf6b44af8, 0x604d, 0x46fe, [0xa9, 0x5d, 0x45, 0x47, 0x9b, 0x10, 0xc9, 0xbc]);
enum MF_QUALITY_NOTIFY_SAMPLE_LAG = GUID(0x30d15206, 0xed2a, 0x4760, [0xbe, 0x17, 0xeb, 0x4a, 0x9f, 0x12, 0x29, 0x5c]);
enum MF_TIME_FORMAT_SEGMENT_OFFSET = GUID(0xc8b8be77, 0x869c, 0x431d, [0x81, 0x2e, 0x16, 0x96, 0x93, 0xf6, 0x5a, 0x39]);
enum MF_SOURCE_PRESENTATION_PROVIDER_SERVICE = GUID(0xe002aadc, 0xf4af, 0x4ee5, [0x98, 0x47, 0x5, 0x3e, 0xdf, 0x84, 0x4, 0x26]);
enum MF_TOPONODE_ATTRIBUTE_EDITOR_SERVICE = GUID(0x65656e1a, 0x77f, 0x4472, [0x83, 0xef, 0x31, 0x6f, 0x11, 0xd5, 0x8, 0x7a]);
enum MFNETSOURCE_SSLCERTIFICATE_MANAGER = GUID(0x55e6cb27, 0xe69b, 0x4267, [0x94, 0xc, 0x2d, 0x7e, 0xc5, 0xbb, 0x8a, 0xf]);
enum MFNETSOURCE_RESOURCE_FILTER = GUID(0x815d0ff6, 0x265a, 0x4477, [0x9e, 0x46, 0x7b, 0x80, 0xad, 0x80, 0xb5, 0xfb]);
enum MFNET_SAVEJOB_SERVICE = GUID(0xb85a587f, 0x3d02, 0x4e52, [0x95, 0x65, 0x55, 0xd3, 0xec, 0x1e, 0x7f, 0xf7]);
enum MFNETSOURCE_STATISTICS_SERVICE = GUID(0x3cb1f275, 0x505, 0x4c5d, [0xae, 0x71, 0xa, 0x55, 0x63, 0x44, 0xef, 0xa1]);
enum MFNETSOURCE_STATISTICS = GUID(0x3cb1f274, 0x505, 0x4c5d, [0xae, 0x71, 0xa, 0x55, 0x63, 0x44, 0xef, 0xa1]);
enum MFNETSOURCE_BUFFERINGTIME = GUID(0x3cb1f276, 0x505, 0x4c5d, [0xae, 0x71, 0xa, 0x55, 0x63, 0x44, 0xef, 0xa1]);
enum MFNETSOURCE_ACCELERATEDSTREAMINGDURATION = GUID(0x3cb1f277, 0x505, 0x4c5d, [0xae, 0x71, 0xa, 0x55, 0x63, 0x44, 0xef, 0xa1]);
enum MFNETSOURCE_MAXUDPACCELERATEDSTREAMINGDURATION = GUID(0x4aab2879, 0xbbe1, 0x4994, [0x9f, 0xf0, 0x54, 0x95, 0xbd, 0x25, 0x1, 0x29]);
enum MFNETSOURCE_MAXBUFFERTIMEMS = GUID(0x408b24e6, 0x4038, 0x4401, [0xb5, 0xb2, 0xfe, 0x70, 0x1a, 0x9e, 0xbf, 0x10]);
enum MFNETSOURCE_CONNECTIONBANDWIDTH = GUID(0x3cb1f278, 0x505, 0x4c5d, [0xae, 0x71, 0xa, 0x55, 0x63, 0x44, 0xef, 0xa1]);
enum MFNETSOURCE_CACHEENABLED = GUID(0x3cb1f279, 0x505, 0x4c5d, [0xae, 0x71, 0xa, 0x55, 0x63, 0x44, 0xef, 0xa1]);
enum MFNETSOURCE_AUTORECONNECTLIMIT = GUID(0x3cb1f27a, 0x505, 0x4c5d, [0xae, 0x71, 0xa, 0x55, 0x63, 0x44, 0xef, 0xa1]);
enum MFNETSOURCE_RESENDSENABLED = GUID(0x3cb1f27b, 0x505, 0x4c5d, [0xae, 0x71, 0xa, 0x55, 0x63, 0x44, 0xef, 0xa1]);
enum MFNETSOURCE_THINNINGENABLED = GUID(0x3cb1f27c, 0x505, 0x4c5d, [0xae, 0x71, 0xa, 0x55, 0x63, 0x44, 0xef, 0xa1]);
enum MFNETSOURCE_PROTOCOL = GUID(0x3cb1f27d, 0x505, 0x4c5d, [0xae, 0x71, 0xa, 0x55, 0x63, 0x44, 0xef, 0xa1]);
enum MFNETSOURCE_TRANSPORT = GUID(0x3cb1f27e, 0x505, 0x4c5d, [0xae, 0x71, 0xa, 0x55, 0x63, 0x44, 0xef, 0xa1]);
enum MFNETSOURCE_PREVIEWMODEENABLED = GUID(0x3cb1f27f, 0x505, 0x4c5d, [0xae, 0x71, 0xa, 0x55, 0x63, 0x44, 0xef, 0xa1]);
enum MFNETSOURCE_CREDENTIAL_MANAGER = GUID(0x3cb1f280, 0x505, 0x4c5d, [0xae, 0x71, 0xa, 0x55, 0x63, 0x44, 0xef, 0xa1]);
enum MFNETSOURCE_PPBANDWIDTH = GUID(0x3cb1f281, 0x505, 0x4c5d, [0xae, 0x71, 0xa, 0x55, 0x63, 0x44, 0xef, 0xa1]);
enum MFNETSOURCE_AUTORECONNECTPROGRESS = GUID(0x3cb1f282, 0x505, 0x4c5d, [0xae, 0x71, 0xa, 0x55, 0x63, 0x44, 0xef, 0xa1]);
enum MFNETSOURCE_PROXYLOCATORFACTORY = GUID(0x3cb1f283, 0x505, 0x4c5d, [0xae, 0x71, 0xa, 0x55, 0x63, 0x44, 0xef, 0xa1]);
enum MFNETSOURCE_BROWSERUSERAGENT = GUID(0x3cb1f28b, 0x505, 0x4c5d, [0xae, 0x71, 0xa, 0x55, 0x63, 0x44, 0xef, 0xa1]);
enum MFNETSOURCE_BROWSERWEBPAGE = GUID(0x3cb1f28c, 0x505, 0x4c5d, [0xae, 0x71, 0xa, 0x55, 0x63, 0x44, 0xef, 0xa1]);
enum MFNETSOURCE_PLAYERVERSION = GUID(0x3cb1f28d, 0x505, 0x4c5d, [0xae, 0x71, 0xa, 0x55, 0x63, 0x44, 0xef, 0xa1]);
enum MFNETSOURCE_PLAYERID = GUID(0x3cb1f28e, 0x505, 0x4c5d, [0xae, 0x71, 0xa, 0x55, 0x63, 0x44, 0xef, 0xa1]);
enum MFNETSOURCE_HOSTEXE = GUID(0x3cb1f28f, 0x505, 0x4c5d, [0xae, 0x71, 0xa, 0x55, 0x63, 0x44, 0xef, 0xa1]);
enum MFNETSOURCE_HOSTVERSION = GUID(0x3cb1f291, 0x505, 0x4c5d, [0xae, 0x71, 0xa, 0x55, 0x63, 0x44, 0xef, 0xa1]);
enum MFNETSOURCE_PLAYERUSERAGENT = GUID(0x3cb1f292, 0x505, 0x4c5d, [0xae, 0x71, 0xa, 0x55, 0x63, 0x44, 0xef, 0xa1]);
enum MFNETSOURCE_CLIENTGUID = GUID(0x60a2c4a6, 0xf197, 0x4c14, [0xa5, 0xbf, 0x88, 0x83, 0xd, 0x24, 0x58, 0xaf]);
enum MFNETSOURCE_LOGURL = GUID(0x3cb1f293, 0x505, 0x4c5d, [0xae, 0x71, 0xa, 0x55, 0x63, 0x44, 0xef, 0xa1]);
enum MFNETSOURCE_ENABLE_UDP = GUID(0x3cb1f294, 0x505, 0x4c5d, [0xae, 0x71, 0xa, 0x55, 0x63, 0x44, 0xef, 0xa1]);
enum MFNETSOURCE_ENABLE_TCP = GUID(0x3cb1f295, 0x505, 0x4c5d, [0xae, 0x71, 0xa, 0x55, 0x63, 0x44, 0xef, 0xa1]);
enum MFNETSOURCE_ENABLE_MSB = GUID(0x3cb1f296, 0x505, 0x4c5d, [0xae, 0x71, 0xa, 0x55, 0x63, 0x44, 0xef, 0xa1]);
enum MFNETSOURCE_ENABLE_RTSP = GUID(0x3cb1f298, 0x505, 0x4c5d, [0xae, 0x71, 0xa, 0x55, 0x63, 0x44, 0xef, 0xa1]);
enum MFNETSOURCE_ENABLE_HTTP = GUID(0x3cb1f299, 0x505, 0x4c5d, [0xae, 0x71, 0xa, 0x55, 0x63, 0x44, 0xef, 0xa1]);
enum MFNETSOURCE_ENABLE_STREAMING = GUID(0x3cb1f29c, 0x505, 0x4c5d, [0xae, 0x71, 0xa, 0x55, 0x63, 0x44, 0xef, 0xa1]);
enum MFNETSOURCE_ENABLE_DOWNLOAD = GUID(0x3cb1f29d, 0x505, 0x4c5d, [0xae, 0x71, 0xa, 0x55, 0x63, 0x44, 0xef, 0xa1]);
enum MFNETSOURCE_ENABLE_PRIVATEMODE = GUID(0x824779d8, 0xf18b, 0x4405, [0x8c, 0xf1, 0x46, 0x4f, 0xb5, 0xaa, 0x8f, 0x71]);
enum MFNETSOURCE_UDP_PORT_RANGE = GUID(0x3cb1f29a, 0x505, 0x4c5d, [0xae, 0x71, 0xa, 0x55, 0x63, 0x44, 0xef, 0xa1]);
enum MFNETSOURCE_PROXYINFO = GUID(0x3cb1f29b, 0x505, 0x4c5d, [0xae, 0x71, 0xa, 0x55, 0x63, 0x44, 0xef, 0xa1]);
enum MFNETSOURCE_DRMNET_LICENSE_REPRESENTATION = GUID(0x47eae1bd, 0xbdfe, 0x42e2, [0x82, 0xf3, 0x54, 0xa4, 0x8c, 0x17, 0x96, 0x2d]);
enum MFNETSOURCE_PROXYSETTINGS = GUID(0x3cb1f287, 0x505, 0x4c5d, [0xae, 0x71, 0xa, 0x55, 0x63, 0x44, 0xef, 0xa1]);
enum MFNETSOURCE_PROXYHOSTNAME = GUID(0x3cb1f284, 0x505, 0x4c5d, [0xae, 0x71, 0xa, 0x55, 0x63, 0x44, 0xef, 0xa1]);
enum MFNETSOURCE_PROXYPORT = GUID(0x3cb1f288, 0x505, 0x4c5d, [0xae, 0x71, 0xa, 0x55, 0x63, 0x44, 0xef, 0xa1]);
enum MFNETSOURCE_PROXYEXCEPTIONLIST = GUID(0x3cb1f285, 0x505, 0x4c5d, [0xae, 0x71, 0xa, 0x55, 0x63, 0x44, 0xef, 0xa1]);
enum MFNETSOURCE_PROXYBYPASSFORLOCAL = GUID(0x3cb1f286, 0x505, 0x4c5d, [0xae, 0x71, 0xa, 0x55, 0x63, 0x44, 0xef, 0xa1]);
enum MFNETSOURCE_PROXYRERUNAUTODETECTION = GUID(0x3cb1f289, 0x505, 0x4c5d, [0xae, 0x71, 0xa, 0x55, 0x63, 0x44, 0xef, 0xa1]);
enum MFNETSOURCE_STREAM_LANGUAGE = GUID(0x9ab44318, 0xf7cd, 0x4f2d, [0x8d, 0x6d, 0xfa, 0x35, 0xb4, 0x92, 0xce, 0xcb]);
enum MFNETSOURCE_LOGPARAMS = GUID(0x64936ae8, 0x9418, 0x453a, [0x8c, 0xda, 0x3e, 0xa, 0x66, 0x8b, 0x35, 0x3b]);
enum MFNETSOURCE_PEERMANAGER = GUID(0x48b29adb, 0xfebf, 0x45ee, [0xa9, 0xbf, 0xef, 0xb8, 0x1c, 0x49, 0x2e, 0xfc]);
enum MFNETSOURCE_FRIENDLYNAME = GUID(0x5b2a7757, 0xbc6b, 0x447e, [0xaa, 0x6, 0xd, 0xda, 0x1c, 0x64, 0x6e, 0x2f]);
enum MF_BYTESTREAMHANDLER_ACCEPTS_SHARE_WRITE = GUID(0xa6e1f733, 0x3001, 0x4915, [0x81, 0x50, 0x15, 0x58, 0xa2, 0x18, 0xe, 0xc8]);
enum MF_BYTESTREAM_SERVICE = GUID(0xab025e2b, 0x16d9, 0x4180, [0xa1, 0x27, 0xba, 0x6c, 0x70, 0x15, 0x61, 0x61]);
enum MF_MEDIA_PROTECTION_MANAGER_PROPERTIES = GUID(0x38bd81a9, 0xacea, 0x4c73, [0x89, 0xb2, 0x55, 0x32, 0xc0, 0xae, 0xca, 0x79]);
enum MFCONNECTOR_SPDIF = GUID(0xb94a712, 0xad3e, 0x4cee, [0x83, 0xce, 0xce, 0x32, 0xe3, 0xdb, 0x65, 0x22]);
enum MFCONNECTOR_UNKNOWN = GUID(0xac3aef5c, 0xce43, 0x11d9, [0x92, 0xdb, 0x0, 0xb, 0xdb, 0x28, 0xff, 0x98]);
enum MFCONNECTOR_PCI = GUID(0xac3aef5d, 0xce43, 0x11d9, [0x92, 0xdb, 0x0, 0xb, 0xdb, 0x28, 0xff, 0x98]);
enum MFCONNECTOR_PCIX = GUID(0xac3aef5e, 0xce43, 0x11d9, [0x92, 0xdb, 0x0, 0xb, 0xdb, 0x28, 0xff, 0x98]);
enum MFCONNECTOR_PCI_Express = GUID(0xac3aef5f, 0xce43, 0x11d9, [0x92, 0xdb, 0x0, 0xb, 0xdb, 0x28, 0xff, 0x98]);
enum MFCONNECTOR_AGP = GUID(0xac3aef60, 0xce43, 0x11d9, [0x92, 0xdb, 0x0, 0xb, 0xdb, 0x28, 0xff, 0x98]);
enum MFCONNECTOR_VGA = GUID(0x57cd5968, 0xce47, 0x11d9, [0x92, 0xdb, 0x0, 0xb, 0xdb, 0x28, 0xff, 0x98]);
enum MFCONNECTOR_SVIDEO = GUID(0x57cd5969, 0xce47, 0x11d9, [0x92, 0xdb, 0x0, 0xb, 0xdb, 0x28, 0xff, 0x98]);
enum MFCONNECTOR_COMPOSITE = GUID(0x57cd596a, 0xce47, 0x11d9, [0x92, 0xdb, 0x0, 0xb, 0xdb, 0x28, 0xff, 0x98]);
enum MFCONNECTOR_COMPONENT = GUID(0x57cd596b, 0xce47, 0x11d9, [0x92, 0xdb, 0x0, 0xb, 0xdb, 0x28, 0xff, 0x98]);
enum MFCONNECTOR_DVI = GUID(0x57cd596c, 0xce47, 0x11d9, [0x92, 0xdb, 0x0, 0xb, 0xdb, 0x28, 0xff, 0x98]);
enum MFCONNECTOR_HDMI = GUID(0x57cd596d, 0xce47, 0x11d9, [0x92, 0xdb, 0x0, 0xb, 0xdb, 0x28, 0xff, 0x98]);
enum MFCONNECTOR_LVDS = GUID(0x57cd596e, 0xce47, 0x11d9, [0x92, 0xdb, 0x0, 0xb, 0xdb, 0x28, 0xff, 0x98]);
enum MFCONNECTOR_D_JPN = GUID(0x57cd5970, 0xce47, 0x11d9, [0x92, 0xdb, 0x0, 0xb, 0xdb, 0x28, 0xff, 0x98]);
enum MFCONNECTOR_SDI = GUID(0x57cd5971, 0xce47, 0x11d9, [0x92, 0xdb, 0x0, 0xb, 0xdb, 0x28, 0xff, 0x98]);
enum MFCONNECTOR_DISPLAYPORT_EXTERNAL = GUID(0x57cd5972, 0xce47, 0x11d9, [0x92, 0xdb, 0x0, 0xb, 0xdb, 0x28, 0xff, 0x98]);
enum MFCONNECTOR_DISPLAYPORT_EMBEDDED = GUID(0x57cd5973, 0xce47, 0x11d9, [0x92, 0xdb, 0x0, 0xb, 0xdb, 0x28, 0xff, 0x98]);
enum MFCONNECTOR_UDI_EXTERNAL = GUID(0x57cd5974, 0xce47, 0x11d9, [0x92, 0xdb, 0x0, 0xb, 0xdb, 0x28, 0xff, 0x98]);
enum MFCONNECTOR_UDI_EMBEDDED = GUID(0x57cd5975, 0xce47, 0x11d9, [0x92, 0xdb, 0x0, 0xb, 0xdb, 0x28, 0xff, 0x98]);
enum MFCONNECTOR_MIRACAST = GUID(0x57cd5977, 0xce47, 0x11d9, [0x92, 0xdb, 0x0, 0xb, 0xdb, 0x28, 0xff, 0x98]);
enum MFCONNECTOR_TRANSPORT_AGNOSTIC_DIGITAL_MODE_A = GUID(0x57cd5978, 0xce47, 0x11d9, [0x92, 0xdb, 0x0, 0xb, 0xdb, 0x28, 0xff, 0x98]);
enum MFCONNECTOR_TRANSPORT_AGNOSTIC_DIGITAL_MODE_B = GUID(0x57cd5979, 0xce47, 0x11d9, [0x92, 0xdb, 0x0, 0xb, 0xdb, 0x28, 0xff, 0x98]);
enum MF_POLICY_ID = GUID(0xb160c24d, 0xc059, 0x48f1, [0xa9, 0x1, 0x9e, 0xe2, 0x98, 0xa9, 0xa8, 0xc3]);
enum MFPROTECTION_DISABLE = GUID(0x8cc6d81b, 0xfec6, 0x4d8f, [0x96, 0x4b, 0xcf, 0xba, 0xb, 0xd, 0xad, 0xd]);
enum MFPROTECTION_CONSTRICTVIDEO = GUID(0x193370ce, 0xc5e4, 0x4c3a, [0x8a, 0x66, 0x69, 0x59, 0xb4, 0xda, 0x44, 0x42]);
enum MFPROTECTION_CONSTRICTVIDEO_NOOPM = GUID(0xa580e8cd, 0xc247, 0x4957, [0xb9, 0x83, 0x3c, 0x2e, 0xeb, 0xd1, 0xff, 0x59]);
enum MFPROTECTION_CONSTRICTAUDIO = GUID(0xffc99b44, 0xdf48, 0x4e16, [0x8e, 0x66, 0x9, 0x68, 0x92, 0xc1, 0x57, 0x8a]);
enum MFPROTECTION_TRUSTEDAUDIODRIVERS = GUID(0x65bdf3d2, 0x168, 0x4816, [0xa5, 0x33, 0x55, 0xd4, 0x7b, 0x2, 0x71, 0x1]);
enum MFPROTECTION_HDCP = GUID(0xae7cc03d, 0xc828, 0x4021, [0xac, 0xb7, 0xd5, 0x78, 0xd2, 0x7a, 0xaf, 0x13]);
enum MFPROTECTION_CGMSA = GUID(0xe57e69e9, 0x226b, 0x4d31, [0xb4, 0xe3, 0xd3, 0xdb, 0x0, 0x87, 0x36, 0xdd]);
enum MFPROTECTION_ACP = GUID(0xc3fd11c6, 0xf8b7, 0x4d20, [0xb0, 0x8, 0x1d, 0xb1, 0x7d, 0x61, 0xf2, 0xda]);
enum MFPROTECTION_WMDRMOTA = GUID(0xa267a6a1, 0x362e, 0x47d0, [0x88, 0x5, 0x46, 0x28, 0x59, 0x8a, 0x23, 0xe4]);
enum MFPROTECTION_FFT = GUID(0x462a56b2, 0x2866, 0x4bb6, [0x98, 0xd, 0x6d, 0x8d, 0x9e, 0xdb, 0x1a, 0x8c]);
enum MFPROTECTION_PROTECTED_SURFACE = GUID(0x4f5d9566, 0xe742, 0x4a25, [0x8d, 0x1f, 0xd2, 0x87, 0xb5, 0xfa, 0xa, 0xde]);
enum MFPROTECTION_DISABLE_SCREEN_SCRAPE = GUID(0xa21179a4, 0xb7cd, 0x40d8, [0x96, 0x14, 0x8e, 0xf2, 0x37, 0x1b, 0xa7, 0x8d]);
enum MFPROTECTION_VIDEO_FRAMES = GUID(0x36a59cbc, 0x7401, 0x4a8c, [0xbc, 0x20, 0x46, 0xa7, 0xc9, 0xe5, 0x97, 0xf0]);
enum MFPROTECTION_HARDWARE = GUID(0x4ee7f0c1, 0x9ed7, 0x424f, [0xb6, 0xbe, 0x99, 0x6b, 0x33, 0x52, 0x88, 0x56]);
enum MFPROTECTION_HDCP_WITH_TYPE_ENFORCEMENT = GUID(0xa4a585e8, 0xed60, 0x442d, [0x81, 0x4d, 0xdb, 0x4d, 0x42, 0x20, 0xa0, 0x6d]);
enum MFPROTECTIONATTRIBUTE_BEST_EFFORT = GUID(0xc8e06331, 0x75f0, 0x4ec1, [0x8e, 0x77, 0x17, 0x57, 0x8f, 0x77, 0x3b, 0x46]);
enum MFPROTECTIONATTRIBUTE_FAIL_OVER = GUID(0x8536abc5, 0x38f1, 0x4151, [0x9c, 0xce, 0xf5, 0x5d, 0x94, 0x12, 0x29, 0xac]);
enum MFPROTECTION_GRAPHICS_TRANSFER_AES_ENCRYPTION = GUID(0xc873de64, 0xd8a5, 0x49e6, [0x88, 0xbb, 0xfb, 0x96, 0x3f, 0xd3, 0xd4, 0xce]);
enum MFPROTECTIONATTRIBUTE_CONSTRICTVIDEO_IMAGESIZE = GUID(0x8476fc, 0x4b58, 0x4d80, [0xa7, 0x90, 0xe7, 0x29, 0x76, 0x73, 0x16, 0x1d]);
enum MFPROTECTIONATTRIBUTE_HDCP_SRM = GUID(0x6f302107, 0x3477, 0x4468, [0x8a, 0x8, 0xee, 0xf9, 0xdb, 0x10, 0xe2, 0xf]);
enum MF_SampleProtectionSalt = GUID(0x5403deee, 0xb9ee, 0x438f, [0xaa, 0x83, 0x38, 0x4, 0x99, 0x7e, 0x56, 0x9d]);
enum MF_REMOTE_PROXY = GUID(0x2f00c90e, 0xd2cf, 0x4278, [0x8b, 0x6a, 0xd0, 0x77, 0xfa, 0xc3, 0xa2, 0x5f]);
enum CLSID_CreateMediaExtensionObject = GUID(0xef65a54d, 0x788, 0x45b8, [0x8b, 0x14, 0xbc, 0xf, 0x6a, 0x6b, 0x51, 0x37]);
enum MF_SAMI_SERVICE = GUID(0x49a89ae7, 0xb4d9, 0x4ef2, [0xaa, 0x5c, 0xf6, 0x5a, 0x3e, 0x5, 0xae, 0x4e]);
enum MF_PD_SAMI_STYLELIST = GUID(0xe0b73c7f, 0x486d, 0x484e, [0x98, 0x72, 0x4d, 0xe5, 0x19, 0x2a, 0x7b, 0xf8]);
enum MF_SD_SAMI_LANGUAGE = GUID(0x36fcb98a, 0x6cd0, 0x44cb, [0xac, 0xb9, 0xa8, 0xf5, 0x60, 0xd, 0xd0, 0xbb]);
enum MF_TRANSCODE_CONTAINERTYPE = GUID(0x150ff23f, 0x4abc, 0x478b, [0xac, 0x4f, 0xe1, 0x91, 0x6f, 0xba, 0x1c, 0xca]);
enum MFTranscodeContainerType_ASF = GUID(0x430f6f6e, 0xb6bf, 0x4fc1, [0xa0, 0xbd, 0x9e, 0xe4, 0x6e, 0xee, 0x2a, 0xfb]);
enum MFTranscodeContainerType_MPEG4 = GUID(0xdc6cd05d, 0xb9d0, 0x40ef, [0xbd, 0x35, 0xfa, 0x62, 0x2c, 0x1a, 0xb2, 0x8a]);
enum MFTranscodeContainerType_MP3 = GUID(0xe438b912, 0x83f1, 0x4de6, [0x9e, 0x3a, 0x9f, 0xfb, 0xc6, 0xdd, 0x24, 0xd1]);
enum MFTranscodeContainerType_FLAC = GUID(0x31344aa3, 0x5a9, 0x42b5, [0x90, 0x1b, 0x8e, 0x9d, 0x42, 0x57, 0xf7, 0x5e]);
enum MFTranscodeContainerType_3GP = GUID(0x34c50167, 0x4472, 0x4f34, [0x9e, 0xa0, 0xc4, 0x9f, 0xba, 0xcf, 0x3, 0x7d]);
enum MFTranscodeContainerType_AC3 = GUID(0x6d8d91c3, 0x8c91, 0x4ed1, [0x87, 0x42, 0x8c, 0x34, 0x7d, 0x5b, 0x44, 0xd0]);
enum MFTranscodeContainerType_ADTS = GUID(0x132fd27d, 0xf02, 0x43de, [0xa3, 0x1, 0x38, 0xfb, 0xbb, 0xb3, 0x83, 0x4e]);
enum MFTranscodeContainerType_MPEG2 = GUID(0xbfc2dbf9, 0x7bb4, 0x4f8f, [0xaf, 0xde, 0xe1, 0x12, 0xc4, 0x4b, 0xa8, 0x82]);
enum MFTranscodeContainerType_WAVE = GUID(0x64c3453c, 0xf26, 0x4741, [0xbe, 0x63, 0x87, 0xbd, 0xf8, 0xbb, 0x93, 0x5b]);
enum MFTranscodeContainerType_AVI = GUID(0x7edfe8af, 0x402f, 0x4d76, [0xa3, 0x3c, 0x61, 0x9f, 0xd1, 0x57, 0xd0, 0xf1]);
enum MFTranscodeContainerType_FMPEG4 = GUID(0x9ba876f1, 0x419f, 0x4b77, [0xa1, 0xe0, 0x35, 0x95, 0x9d, 0x9d, 0x40, 0x4]);
enum MFTranscodeContainerType_AMR = GUID(0x25d5ad3, 0x621a, 0x475b, [0x96, 0x4d, 0x66, 0xb1, 0xc8, 0x24, 0xf0, 0x79]);
enum MF_TRANSCODE_SKIP_METADATA_TRANSFER = GUID(0x4e4469ef, 0xb571, 0x4959, [0x8f, 0x83, 0x3d, 0xcf, 0xba, 0x33, 0xa3, 0x93]);
enum MF_TRANSCODE_TOPOLOGYMODE = GUID(0x3e3df610, 0x394a, 0x40b2, [0x9d, 0xea, 0x3b, 0xab, 0x65, 0xb, 0xeb, 0xf2]);
enum MF_TRANSCODE_ADJUST_PROFILE = GUID(0x9c37c21b, 0x60f, 0x487c, [0xa6, 0x90, 0x80, 0xd7, 0xf5, 0xd, 0x1c, 0x72]);
enum MF_TRANSCODE_ENCODINGPROFILE = GUID(0x6947787c, 0xf508, 0x4ea9, [0xb1, 0xe9, 0xa1, 0xfe, 0x3a, 0x49, 0xfb, 0xc9]);
enum MF_TRANSCODE_QUALITYVSSPEED = GUID(0x98332df8, 0x3cd, 0x476b, [0x89, 0xfa, 0x3f, 0x9e, 0x44, 0x2d, 0xec, 0x9f]);
enum MF_TRANSCODE_DONOT_INSERT_ENCODER = GUID(0xf45aa7ce, 0xab24, 0x4012, [0xa1, 0x1b, 0xdc, 0x82, 0x20, 0x20, 0x14, 0x10]);
enum MF_VIDEO_PROCESSOR_ALGORITHM = GUID(0x4a0a1e1f, 0x272c, 0x4fb6, [0x9e, 0xb1, 0xdb, 0x33, 0xc, 0xbc, 0x97, 0xca]);
enum MF_XVP_DISABLE_FRC = GUID(0x2c0afa19, 0x7a97, 0x4d5a, [0x9e, 0xe8, 0x16, 0xd4, 0xfc, 0x51, 0x8d, 0x8c]);
enum MF_XVP_CALLER_ALLOCATES_OUTPUT = GUID(0x4a2cabc, 0xcab, 0x40b1, [0xa1, 0xb9, 0x75, 0xbc, 0x36, 0x58, 0xf0, 0x0]);
enum MF_LOCAL_MFT_REGISTRATION_SERVICE = GUID(0xddf5cf9c, 0x4506, 0x45aa, [0xab, 0xf0, 0x6d, 0x5d, 0x94, 0xdd, 0x1b, 0x4a]);
enum MF_WRAPPED_SAMPLE_SERVICE = GUID(0x31f52bf2, 0xd03e, 0x4048, [0x80, 0xd0, 0x9c, 0x10, 0x46, 0xd8, 0x7c, 0x61]);
enum MF_WRAPPED_OBJECT = GUID(0x2b182c4c, 0xd6ac, 0x49f4, [0x89, 0x15, 0xf7, 0x18, 0x87, 0xdb, 0x70, 0xcd]);
enum CLSID_HttpSchemePlugin = GUID(0x44cb442b, 0x9da9, 0x49df, [0xb3, 0xfd, 0x2, 0x37, 0x77, 0xb1, 0x6e, 0x50]);
enum CLSID_UrlmonSchemePlugin = GUID(0x9ec4b4f9, 0x3029, 0x45ad, [0x94, 0x7b, 0x34, 0x4d, 0xe2, 0xa2, 0x49, 0xe2]);
enum CLSID_NetSchemePlugin = GUID(0xe9f4ebab, 0xd97b, 0x463e, [0xa2, 0xb1, 0xc5, 0x4e, 0xe3, 0xf9, 0x41, 0x4d]);
enum MF_DEVSOURCE_ATTRIBUTE_SOURCE_TYPE = GUID(0xc60ac5fe, 0x252a, 0x478f, [0xa0, 0xef, 0xbc, 0x8f, 0xa5, 0xf7, 0xca, 0xd3]);
enum MF_DEVSOURCE_ATTRIBUTE_SOURCE_TYPE_VIDCAP_HW_SOURCE = GUID(0xde7046ba, 0x54d6, 0x4487, [0xa2, 0xa4, 0xec, 0x7c, 0xd, 0x1b, 0xd1, 0x63]);
enum MF_DEVSOURCE_ATTRIBUTE_FRIENDLY_NAME = GUID(0x60d0e559, 0x52f8, 0x4fa2, [0xbb, 0xce, 0xac, 0xdb, 0x34, 0xa8, 0xec, 0x1]);
enum MF_DEVSOURCE_ATTRIBUTE_MEDIA_TYPE = GUID(0x56a819ca, 0xc78, 0x4de4, [0xa0, 0xa7, 0x3d, 0xda, 0xba, 0xf, 0x24, 0xd4]);
enum MF_DEVSOURCE_ATTRIBUTE_SOURCE_TYPE_VIDCAP_CATEGORY = GUID(0x77f0ae69, 0xc3bd, 0x4509, [0x94, 0x1d, 0x46, 0x7e, 0x4d, 0x24, 0x89, 0x9e]);
enum MF_DEVSOURCE_ATTRIBUTE_SOURCE_TYPE_VIDCAP_SYMBOLIC_LINK = GUID(0x58f0aad8, 0x22bf, 0x4f8a, [0xbb, 0x3d, 0xd2, 0xc4, 0x97, 0x8c, 0x6e, 0x2f]);
enum MF_DEVSOURCE_ATTRIBUTE_SOURCE_TYPE_AUDCAP_SYMBOLIC_LINK = GUID(0x98d24b5e, 0x5930, 0x4614, [0xb5, 0xa1, 0xf6, 0x0, 0xf9, 0x35, 0x5a, 0x78]);
enum MF_DEVSOURCE_ATTRIBUTE_SOURCE_TYPE_VIDCAP_MAX_BUFFERS = GUID(0x7dd9b730, 0x4f2d, 0x41d5, [0x8f, 0x95, 0xc, 0xc9, 0xa9, 0x12, 0xba, 0x26]);
enum MF_DEVSOURCE_ATTRIBUTE_SOURCE_TYPE_AUDCAP_ENDPOINT_ID = GUID(0x30da9258, 0xfeb9, 0x47a7, [0xa4, 0x53, 0x76, 0x3a, 0x7a, 0x8e, 0x1c, 0x5f]);
enum MF_DEVSOURCE_ATTRIBUTE_SOURCE_TYPE_AUDCAP_ROLE = GUID(0xbc9d118e, 0x8c67, 0x4a18, [0x85, 0xd4, 0x12, 0xd3, 0x0, 0x40, 0x5, 0x52]);
enum MF_DEVSOURCE_ATTRIBUTE_SOURCE_TYPE_VIDCAP_PROVIDER_DEVICE_ID = GUID(0x36689d42, 0xa06c, 0x40ae, [0x84, 0xcf, 0xf5, 0xa0, 0x34, 0x6, 0x7c, 0xc4]);
enum MF_DEVSOURCE_ATTRIBUTE_SOURCE_XADDRESS = GUID(0xbca0be52, 0xc327, 0x44c7, [0x9b, 0x7d, 0x7f, 0xa8, 0xd9, 0xb5, 0xbc, 0xda]);
enum MF_DEVSOURCE_ATTRIBUTE_SOURCE_STREAM_URL = GUID(0x9d7b40d2, 0x3617, 0x4043, [0x93, 0xe3, 0x8d, 0x6d, 0xa9, 0xbb, 0x34, 0x92]);
enum MF_DEVSOURCE_ATTRIBUTE_SOURCE_USERNAME = GUID(0x5d01add, 0x949f, 0x46eb, [0xbc, 0x8e, 0x8b, 0xd, 0x2b, 0x32, 0xd7, 0x9d]);
enum MF_DEVSOURCE_ATTRIBUTE_SOURCE_PASSWORD = GUID(0xa0fd7e16, 0x42d9, 0x49df, [0x84, 0xc0, 0xe8, 0x2c, 0x5e, 0xab, 0x88, 0x74]);
enum CLSID_FrameServerNetworkCameraSource = GUID(0x7a213aa7, 0x866f, 0x414a, [0x8c, 0x1a, 0x27, 0x5c, 0x72, 0x83, 0xa3, 0x95]);
enum MF_DEVSOURCE_ATTRIBUTE_SOURCE_TYPE_AUDCAP_GUID = GUID(0x14dd9a1c, 0x7cff, 0x41be, [0xb1, 0xb9, 0xba, 0x1a, 0xc6, 0xec, 0xb5, 0x71]);
enum MF_DEVSOURCE_ATTRIBUTE_SOURCE_TYPE_VIDCAP_GUID = GUID(0x8ac3587a, 0x4ae7, 0x42d8, [0x99, 0xe0, 0xa, 0x60, 0x13, 0xee, 0xf9, 0xf]);
enum MF_DEVICESTREAM_IMAGE_STREAM = GUID(0xa7ffb865, 0xe7b2, 0x43b0, [0x9f, 0x6f, 0x9a, 0xf2, 0xa0, 0xe5, 0xf, 0xc0]);
enum MF_DEVICESTREAM_INDEPENDENT_IMAGE_STREAM = GUID(0x3eeec7e, 0xd605, 0x4576, [0x8b, 0x29, 0x65, 0x80, 0xb4, 0x90, 0xd7, 0xd3]);
enum MF_DEVICESTREAM_STREAM_ID = GUID(0x11bd5120, 0xd124, 0x446b, [0x88, 0xe6, 0x17, 0x6, 0x2, 0x57, 0xff, 0xf9]);
enum MF_DEVICESTREAM_STREAM_CATEGORY = GUID(0x2939e7b8, 0xa62e, 0x4579, [0xb6, 0x74, 0xd4, 0x7, 0x3d, 0xfa, 0xbb, 0xba]);
enum MF_DEVICESTREAM_FRAMESERVER_SHARED = GUID(0x1cb378e9, 0xb279, 0x41d4, [0xaf, 0x97, 0x34, 0xa2, 0x43, 0xe6, 0x83, 0x20]);
enum MF_DEVICESTREAM_TRANSFORM_STREAM_ID = GUID(0xe63937b7, 0xdaaf, 0x4d49, [0x81, 0x5f, 0xd8, 0x26, 0xf8, 0xad, 0x31, 0xe7]);
enum MF_DEVICESTREAM_EXTENSION_PLUGIN_CLSID = GUID(0x48e6558, 0x60c4, 0x4173, [0xbd, 0x5b, 0x6a, 0x3c, 0xa2, 0x89, 0x6a, 0xee]);
enum MF_DEVICEMFT_EXTENSION_PLUGIN_CLSID = GUID(0x844dbae, 0x34fa, 0x48a0, [0xa7, 0x83, 0x8e, 0x69, 0x6f, 0xb1, 0xc9, 0xa8]);
enum MF_DEVICESTREAM_EXTENSION_PLUGIN_CONNECTION_POINT = GUID(0x37f9375c, 0xe664, 0x4ea4, [0xaa, 0xe4, 0xcb, 0x6d, 0x1d, 0xac, 0xa1, 0xf4]);
enum MF_DEVICESTREAM_TAKEPHOTO_TRIGGER = GUID(0x1d180e34, 0x538c, 0x4fbb, [0xa7, 0x5a, 0x85, 0x9a, 0xf7, 0xd2, 0x61, 0xa6]);
enum MF_DEVICESTREAM_MAX_FRAME_BUFFERS = GUID(0x1684cebe, 0x3175, 0x4985, [0x88, 0x2c, 0xe, 0xfd, 0x3e, 0x8a, 0xc1, 0x1e]);
enum MF_DEVICEMFT_CONNECTED_FILTER_KSCONTROL = GUID(0x6a2c4fa6, 0xd179, 0x41cd, [0x95, 0x23, 0x82, 0x23, 0x71, 0xea, 0x40, 0xe5]);
enum MF_DEVICEMFT_CONNECTED_PIN_KSCONTROL = GUID(0xe63310f7, 0xb244, 0x4ef8, [0x9a, 0x7d, 0x24, 0xc7, 0x4e, 0x32, 0xeb, 0xd0]);
enum MF_DEVICE_THERMAL_STATE_CHANGED = GUID(0x70ccd0af, 0xfc9f, 0x4deb, [0xa8, 0x75, 0x9f, 0xec, 0xd1, 0x6c, 0x5b, 0xd4]);
enum MFSampleExtension_DeviceTimestamp = GUID(0x8f3e35e7, 0x2dcd, 0x4887, [0x86, 0x22, 0x2a, 0x58, 0xba, 0xa6, 0x52, 0xb0]);
enum MFSampleExtension_Spatial_CameraViewTransform = GUID(0x4e251fa4, 0x830f, 0x4770, [0x85, 0x9a, 0x4b, 0x8d, 0x99, 0xaa, 0x80, 0x9b]);
enum MFSampleExtension_Spatial_CameraCoordinateSystem = GUID(0x9d13c82f, 0x2199, 0x4e67, [0x91, 0xcd, 0xd1, 0xa4, 0x18, 0x1f, 0x25, 0x34]);
enum MFSampleExtension_Spatial_CameraProjectionTransform = GUID(0x47f9fcb5, 0x2a02, 0x4f26, [0xa4, 0x77, 0x79, 0x2f, 0xdf, 0x95, 0x88, 0x6a]);
enum MF_MEDIASOURCE_SERVICE = GUID(0xf09992f7, 0x9fba, 0x4c4a, [0xa3, 0x7f, 0x8c, 0x47, 0xb4, 0xe1, 0xdf, 0xe7]);
enum MF_ACCESS_CONTROLLED_MEDIASOURCE_SERVICE = GUID(0x14a5031, 0x2f05, 0x4c6a, [0x9f, 0x9c, 0x7d, 0xd, 0xc4, 0xed, 0xa5, 0xf4]);
enum MF_CONTENT_DECRYPTOR_SERVICE = GUID(0x68a72927, 0xfc7b, 0x44ee, [0x85, 0xf4, 0x7c, 0x51, 0xbd, 0x55, 0xa6, 0x59]);
enum MF_CONTENT_PROTECTION_DEVICE_SERVICE = GUID(0xff58436f, 0x76a0, 0x41fe, [0xb5, 0x66, 0x10, 0xcc, 0x53, 0x96, 0x2e, 0xdd]);
enum MF_SD_AUDIO_ENCODER_DELAY = GUID(0x8e85422c, 0x73de, 0x403f, [0x9a, 0x35, 0x55, 0xa, 0xd6, 0xe8, 0xb9, 0x51]);
enum MF_SD_AUDIO_ENCODER_PADDING = GUID(0x529c7f2c, 0xac4b, 0x4e3f, [0xbf, 0xc3, 0x9, 0x2, 0x19, 0x49, 0x82, 0xcb]);
enum CLSID_MSH264DecoderMFT = GUID(0x62ce7e72, 0x4c71, 0x4d20, [0xb1, 0x5d, 0x45, 0x28, 0x31, 0xa8, 0x7d, 0x9d]);
enum CLSID_MSH264EncoderMFT = GUID(0x6ca50344, 0x51a, 0x4ded, [0x97, 0x79, 0xa4, 0x33, 0x5, 0x16, 0x5e, 0x35]);
enum CLSID_MSDDPlusDecMFT = GUID(0x177c0afe, 0x900b, 0x48d4, [0x9e, 0x4c, 0x57, 0xad, 0xd2, 0x50, 0xb3, 0xd4]);
enum CLSID_MP3DecMediaObject = GUID(0xbbeea841, 0xa63, 0x4f52, [0xa7, 0xab, 0xa9, 0xb3, 0xa8, 0x4e, 0xd3, 0x8a]);
enum CLSID_MSAACDecMFT = GUID(0x32d186a7, 0x218f, 0x4c75, [0x88, 0x76, 0xdd, 0x77, 0x27, 0x3a, 0x89, 0x99]);
enum CLSID_MSH265DecoderMFT = GUID(0x420a51a3, 0xd605, 0x430c, [0xb4, 0xfc, 0x45, 0x27, 0x4f, 0xa6, 0xc5, 0x62]);
enum CLSID_WMVDecoderMFT = GUID(0x82d353df, 0x90bd, 0x4382, [0x8b, 0xc2, 0x3f, 0x61, 0x92, 0xb7, 0x6e, 0x34]);
enum CLSID_WMADecMediaObject = GUID(0x2eeb4adf, 0x4578, 0x4d10, [0xbc, 0xa7, 0xbb, 0x95, 0x5f, 0x56, 0x32, 0xa]);
enum CLSID_MSMPEGAudDecMFT = GUID(0x70707b39, 0xb2ca, 0x4015, [0xab, 0xea, 0xf8, 0x44, 0x7d, 0x22, 0xd8, 0x8b]);
enum CLSID_MSMPEGDecoderMFT = GUID(0x2d709e52, 0x123f, 0x49b5, [0x9c, 0xbc, 0x9a, 0xf5, 0xcd, 0xe2, 0x8f, 0xb9]);
enum CLSID_AudioResamplerMediaObject = GUID(0xf447b69e, 0x1884, 0x4a7e, [0x80, 0x55, 0x34, 0x6f, 0x74, 0xd6, 0xed, 0xb3]);
enum CLSID_MSVPxDecoder = GUID(0xe3aaf548, 0xc9a4, 0x4c6e, [0x23, 0x4d, 0x5a, 0xda, 0x37, 0x4b, 0x0, 0x0]);
enum CLSID_MSOpusDecoder = GUID(0x63e17c10, 0x2d43, 0x4c42, [0x8f, 0xe3, 0x8d, 0x8b, 0x63, 0xe4, 0x6a, 0x6a]);
enum CLSID_VideoProcessorMFT = GUID(0x88753b26, 0x5b24, 0x49bd, [0xb2, 0xe7, 0xc, 0x44, 0x5c, 0x78, 0xc9, 0x82]);
enum MFNETSOURCE_CROSS_ORIGIN_SUPPORT = GUID(0x9842207c, 0xb02c, 0x4271, [0xa2, 0xfc, 0x72, 0xe4, 0x93, 0x8, 0xe5, 0xc2]);
enum MFNETSOURCE_HTTP_DOWNLOAD_SESSION_PROVIDER = GUID(0x7d55081e, 0x307d, 0x4d6d, [0xa6, 0x63, 0xa9, 0x3b, 0xe9, 0x7c, 0x4b, 0x5c]);
enum MF_SD_MEDIASOURCE_STATUS = GUID(0x1913678b, 0xfc0f, 0x44da, [0x8f, 0x43, 0x1b, 0xa3, 0xb5, 0x26, 0xf4, 0xae]);
enum MF_SD_VIDEO_SPHERICAL = GUID(0xa51da449, 0x3fdc, 0x478c, [0xbc, 0xb5, 0x30, 0xbe, 0x76, 0x59, 0x5f, 0x55]);
enum MF_SD_VIDEO_SPHERICAL_FORMAT = GUID(0x4a8fc407, 0x6ea1, 0x46c8, [0xb5, 0x67, 0x69, 0x71, 0xd4, 0xa1, 0x39, 0xc3]);
enum MF_SD_VIDEO_SPHERICAL_INITIAL_VIEWDIRECTION = GUID(0x11d25a49, 0xbb62, 0x467f, [0x9d, 0xb1, 0xc1, 0x71, 0x65, 0x71, 0x6c, 0x49]);
enum MF_MEDIASOURCE_EXPOSE_ALL_STREAMS = GUID(0xe7f250b8, 0x8fd9, 0x4a09, [0xb6, 0xc1, 0x6a, 0x31, 0x5c, 0x7c, 0x72, 0xe]);
enum MF_ST_MEDIASOURCE_COLLECTION = GUID(0x616de972, 0x83ad, 0x4950, [0x81, 0x70, 0x63, 0xd, 0x19, 0xcb, 0xe3, 0x7]);
enum MF_DEVICESTREAM_FILTER_KSCONTROL = GUID(0x46783cca, 0x3df5, 0x4923, [0xa9, 0xef, 0x36, 0xb7, 0x22, 0x3e, 0xdd, 0xe0]);
enum MF_DEVICESTREAM_PIN_KSCONTROL = GUID(0xef3ef9a7, 0x87f2, 0x48ca, [0xbe, 0x2, 0x67, 0x48, 0x78, 0x91, 0x8e, 0x98]);
enum MF_DEVICESTREAM_SOURCE_ATTRIBUTES = GUID(0x2f8cb617, 0x361b, 0x434f, [0x85, 0xea, 0x99, 0xa0, 0x3e, 0x1c, 0xe4, 0xe0]);
enum MF_DEVICESTREAM_FRAMESERVER_HIDDEN = GUID(0xf402567b, 0x4d91, 0x4179, [0x96, 0xd1, 0x74, 0xc8, 0x48, 0xc, 0x20, 0x34]);
enum MF_STF_VERSION_INFO = GUID(0x6770bd39, 0xef82, 0x44ee, [0xa4, 0x9b, 0x93, 0x4b, 0xeb, 0x24, 0xae, 0xf7]);
enum MF_STF_VERSION_DATE = GUID(0x31a165d5, 0xdf67, 0x4095, [0x8e, 0x44, 0x88, 0x68, 0xfc, 0x20, 0xdb, 0xfd]);
enum MF_DEVICESTREAM_REQUIRED_CAPABILITIES = GUID(0x6d8b957e, 0x7cf6, 0x43f4, [0xaf, 0x56, 0x9c, 0xe, 0x1e, 0x4f, 0xcb, 0xe1]);
enum MF_DEVICESTREAM_REQUIRED_SDDL = GUID(0x331ae85d, 0xc0d3, 0x49ba, [0x83, 0xba, 0x82, 0xa1, 0x2d, 0x63, 0xcd, 0xd6]);
enum MF_DEVICEMFT_SENSORPROFILE_COLLECTION = GUID(0x36ebdc44, 0xb12c, 0x441b, [0x89, 0xf4, 0x8, 0xb2, 0xf4, 0x1a, 0x9c, 0xfc]);
enum MF_DEVICESTREAM_SENSORSTREAM_ID = GUID(0xe35b9fe4, 0x659, 0x4cad, [0xbb, 0x51, 0x33, 0x16, 0xb, 0xe7, 0xe4, 0x13]);
enum MF_PD_ASF_FILEPROPERTIES_FILE_ID = GUID(0x3de649b4, 0xd76d, 0x4e66, [0x9e, 0xc9, 0x78, 0x12, 0xf, 0xb4, 0xc7, 0xe3]);
enum MF_PD_ASF_FILEPROPERTIES_CREATION_TIME = GUID(0x3de649b6, 0xd76d, 0x4e66, [0x9e, 0xc9, 0x78, 0x12, 0xf, 0xb4, 0xc7, 0xe3]);
enum MF_PD_ASF_FILEPROPERTIES_PACKETS = GUID(0x3de649b7, 0xd76d, 0x4e66, [0x9e, 0xc9, 0x78, 0x12, 0xf, 0xb4, 0xc7, 0xe3]);
enum MF_PD_ASF_FILEPROPERTIES_PLAY_DURATION = GUID(0x3de649b8, 0xd76d, 0x4e66, [0x9e, 0xc9, 0x78, 0x12, 0xf, 0xb4, 0xc7, 0xe3]);
enum MF_PD_ASF_FILEPROPERTIES_SEND_DURATION = GUID(0x3de649b9, 0xd76d, 0x4e66, [0x9e, 0xc9, 0x78, 0x12, 0xf, 0xb4, 0xc7, 0xe3]);
enum MF_PD_ASF_FILEPROPERTIES_PREROLL = GUID(0x3de649ba, 0xd76d, 0x4e66, [0x9e, 0xc9, 0x78, 0x12, 0xf, 0xb4, 0xc7, 0xe3]);
enum MF_PD_ASF_FILEPROPERTIES_FLAGS = GUID(0x3de649bb, 0xd76d, 0x4e66, [0x9e, 0xc9, 0x78, 0x12, 0xf, 0xb4, 0xc7, 0xe3]);
enum MF_PD_ASF_FILEPROPERTIES_MIN_PACKET_SIZE = GUID(0x3de649bc, 0xd76d, 0x4e66, [0x9e, 0xc9, 0x78, 0x12, 0xf, 0xb4, 0xc7, 0xe3]);
enum MF_PD_ASF_FILEPROPERTIES_MAX_PACKET_SIZE = GUID(0x3de649bd, 0xd76d, 0x4e66, [0x9e, 0xc9, 0x78, 0x12, 0xf, 0xb4, 0xc7, 0xe3]);
enum MF_PD_ASF_FILEPROPERTIES_MAX_BITRATE = GUID(0x3de649be, 0xd76d, 0x4e66, [0x9e, 0xc9, 0x78, 0x12, 0xf, 0xb4, 0xc7, 0xe3]);
enum CLSID_WMDRMSystemID = GUID(0x8948bb22, 0x11bd, 0x4796, [0x93, 0xe3, 0x97, 0x4d, 0x1b, 0x57, 0x56, 0x78]);
enum MF_PD_ASF_CONTENTENCRYPTION_TYPE = GUID(0x8520fe3d, 0x277e, 0x46ea, [0x99, 0xe4, 0xe3, 0xa, 0x86, 0xdb, 0x12, 0xbe]);
enum MF_PD_ASF_CONTENTENCRYPTION_KEYID = GUID(0x8520fe3e, 0x277e, 0x46ea, [0x99, 0xe4, 0xe3, 0xa, 0x86, 0xdb, 0x12, 0xbe]);
enum MF_PD_ASF_CONTENTENCRYPTION_SECRET_DATA = GUID(0x8520fe3f, 0x277e, 0x46ea, [0x99, 0xe4, 0xe3, 0xa, 0x86, 0xdb, 0x12, 0xbe]);
enum MF_PD_ASF_CONTENTENCRYPTION_LICENSE_URL = GUID(0x8520fe40, 0x277e, 0x46ea, [0x99, 0xe4, 0xe3, 0xa, 0x86, 0xdb, 0x12, 0xbe]);
enum MF_PD_ASF_CONTENTENCRYPTIONEX_ENCRYPTION_DATA = GUID(0x62508be5, 0xecdf, 0x4924, [0xa3, 0x59, 0x72, 0xba, 0xb3, 0x39, 0x7b, 0x9d]);
enum MF_PD_ASF_LANGLIST = GUID(0xf23de43c, 0x9977, 0x460d, [0xa6, 0xec, 0x32, 0x93, 0x7f, 0x16, 0xf, 0x7d]);
enum MF_PD_ASF_LANGLIST_LEGACYORDER = GUID(0xf23de43d, 0x9977, 0x460d, [0xa6, 0xec, 0x32, 0x93, 0x7f, 0x16, 0xf, 0x7d]);
enum MF_PD_ASF_MARKER = GUID(0x5134330e, 0x83a6, 0x475e, [0xa9, 0xd5, 0x4f, 0xb8, 0x75, 0xfb, 0x2e, 0x31]);
enum MF_PD_ASF_SCRIPT = GUID(0xe29cd0d7, 0xd602, 0x4923, [0xa7, 0xfe, 0x73, 0xfd, 0x97, 0xec, 0xc6, 0x50]);
enum MF_PD_ASF_CODECLIST = GUID(0xe4bb3509, 0xc18d, 0x4df1, [0xbb, 0x99, 0x7a, 0x36, 0xb3, 0xcc, 0x41, 0x19]);
enum MF_PD_ASF_METADATA_IS_VBR = GUID(0x5fc6947a, 0xef60, 0x445d, [0xb4, 0x49, 0x44, 0x2e, 0xcc, 0x78, 0xb4, 0xc1]);
enum MF_PD_ASF_METADATA_V8_VBRPEAK = GUID(0x5fc6947b, 0xef60, 0x445d, [0xb4, 0x49, 0x44, 0x2e, 0xcc, 0x78, 0xb4, 0xc1]);
enum MF_PD_ASF_METADATA_V8_BUFFERAVERAGE = GUID(0x5fc6947c, 0xef60, 0x445d, [0xb4, 0x49, 0x44, 0x2e, 0xcc, 0x78, 0xb4, 0xc1]);
enum MF_PD_ASF_METADATA_LEAKY_BUCKET_PAIRS = GUID(0x5fc6947d, 0xef60, 0x445d, [0xb4, 0x49, 0x44, 0x2e, 0xcc, 0x78, 0xb4, 0xc1]);
enum MF_PD_ASF_DATA_START_OFFSET = GUID(0xe7d5b3e7, 0x1f29, 0x45d3, [0x88, 0x22, 0x3e, 0x78, 0xfa, 0xe2, 0x72, 0xed]);
enum MF_PD_ASF_DATA_LENGTH = GUID(0xe7d5b3e8, 0x1f29, 0x45d3, [0x88, 0x22, 0x3e, 0x78, 0xfa, 0xe2, 0x72, 0xed]);
enum MF_SD_ASF_EXTSTRMPROP_LANGUAGE_ID_INDEX = GUID(0x48f8a522, 0x305d, 0x422d, [0x85, 0x24, 0x25, 0x2, 0xdd, 0xa3, 0x36, 0x80]);
enum MF_SD_ASF_EXTSTRMPROP_AVG_DATA_BITRATE = GUID(0x48f8a523, 0x305d, 0x422d, [0x85, 0x24, 0x25, 0x2, 0xdd, 0xa3, 0x36, 0x80]);
enum MF_SD_ASF_EXTSTRMPROP_AVG_BUFFERSIZE = GUID(0x48f8a524, 0x305d, 0x422d, [0x85, 0x24, 0x25, 0x2, 0xdd, 0xa3, 0x36, 0x80]);
enum MF_SD_ASF_EXTSTRMPROP_MAX_DATA_BITRATE = GUID(0x48f8a525, 0x305d, 0x422d, [0x85, 0x24, 0x25, 0x2, 0xdd, 0xa3, 0x36, 0x80]);
enum MF_SD_ASF_EXTSTRMPROP_MAX_BUFFERSIZE = GUID(0x48f8a526, 0x305d, 0x422d, [0x85, 0x24, 0x25, 0x2, 0xdd, 0xa3, 0x36, 0x80]);
enum MF_SD_ASF_STREAMBITRATES_BITRATE = GUID(0xa8e182ed, 0xafc8, 0x43d0, [0xb0, 0xd1, 0xf6, 0x5b, 0xad, 0x9d, 0xa5, 0x58]);
enum MF_SD_ASF_METADATA_DEVICE_CONFORMANCE_TEMPLATE = GUID(0x245e929d, 0xc44e, 0x4f7e, [0xbb, 0x3c, 0x77, 0xd4, 0xdf, 0xd2, 0x7f, 0x8a]);
enum MF_PD_ASF_INFO_HAS_AUDIO = GUID(0x80e62295, 0x2296, 0x4a44, [0xb3, 0x1c, 0xd1, 0x3, 0xc6, 0xfe, 0xd2, 0x3c]);
enum MF_PD_ASF_INFO_HAS_VIDEO = GUID(0x80e62296, 0x2296, 0x4a44, [0xb3, 0x1c, 0xd1, 0x3, 0xc6, 0xfe, 0xd2, 0x3c]);
enum MF_PD_ASF_INFO_HAS_NON_AUDIO_VIDEO = GUID(0x80e62297, 0x2296, 0x4a44, [0xb3, 0x1c, 0xd1, 0x3, 0xc6, 0xfe, 0xd2, 0x3c]);
enum MF_ASFPROFILE_MINPACKETSIZE = GUID(0x22587626, 0x47de, 0x4168, [0x87, 0xf5, 0xb5, 0xaa, 0x9b, 0x12, 0xa8, 0xf0]);
enum MF_ASFPROFILE_MAXPACKETSIZE = GUID(0x22587627, 0x47de, 0x4168, [0x87, 0xf5, 0xb5, 0xaa, 0x9b, 0x12, 0xa8, 0xf0]);
enum MF_ASFSTREAMCONFIG_LEAKYBUCKET1 = GUID(0xc69b5901, 0xea1a, 0x4c9b, [0xb6, 0x92, 0xe2, 0xa0, 0xd2, 0x9a, 0x8a, 0xdd]);
enum MF_ASFSTREAMCONFIG_LEAKYBUCKET2 = GUID(0xc69b5902, 0xea1a, 0x4c9b, [0xb6, 0x92, 0xe2, 0xa0, 0xd2, 0x9a, 0x8a, 0xdd]);
enum MFASFSampleExtension_SampleDuration = GUID(0xc6bd9450, 0x867f, 0x4907, [0x83, 0xa3, 0xc7, 0x79, 0x21, 0xb7, 0x33, 0xad]);
enum MFASFSampleExtension_OutputCleanPoint = GUID(0xf72a3c6f, 0x6eb4, 0x4ebc, [0xb1, 0x92, 0x9, 0xad, 0x97, 0x59, 0xe8, 0x28]);
enum MFASFSampleExtension_SMPTE = GUID(0x399595ec, 0x8667, 0x4e2d, [0x8f, 0xdb, 0x98, 0x81, 0x4c, 0xe7, 0x6c, 0x1e]);
enum MFASFSampleExtension_FileName = GUID(0xe165ec0e, 0x19ed, 0x45d7, [0xb4, 0xa7, 0x25, 0xcb, 0xd1, 0xe2, 0x8e, 0x9b]);
enum MFASFSampleExtension_ContentType = GUID(0xd590dc20, 0x7bc, 0x436c, [0x9c, 0xf7, 0xf3, 0xbb, 0xfb, 0xf1, 0xa4, 0xdc]);
enum MFASFSampleExtension_PixelAspectRatio = GUID(0x1b1ee554, 0xf9ea, 0x4bc8, [0x82, 0x1a, 0x37, 0x6b, 0x74, 0xe4, 0xc4, 0xb8]);
enum MFASFSampleExtension_Encryption_SampleID = GUID(0x6698b84e, 0xafa, 0x4330, [0xae, 0xb2, 0x1c, 0xa, 0x98, 0xd7, 0xa4, 0x4d]);
enum MFASFSampleExtension_Encryption_KeyID = GUID(0x76376591, 0x795f, 0x4da1, [0x86, 0xed, 0x9d, 0x46, 0xec, 0xa1, 0x9, 0xa9]);
enum MFASFMutexType_Language = GUID(0x72178c2b, 0xe45b, 0x11d5, [0xbc, 0x2a, 0x0, 0xb0, 0xd0, 0xf3, 0xf4, 0xab]);
enum MFASFMutexType_Bitrate = GUID(0x72178c2c, 0xe45b, 0x11d5, [0xbc, 0x2a, 0x0, 0xb0, 0xd0, 0xf3, 0xf4, 0xab]);
enum MFASFMutexType_Presentation = GUID(0x72178c2d, 0xe45b, 0x11d5, [0xbc, 0x2a, 0x0, 0xb0, 0xd0, 0xf3, 0xf4, 0xab]);
enum MFASFMutexType_Unknown = GUID(0x72178c2e, 0xe45b, 0x11d5, [0xbc, 0x2a, 0x0, 0xb0, 0xd0, 0xf3, 0xf4, 0xab]);
enum MFASFSPLITTER_PACKET_BOUNDARY = GUID(0xfe584a05, 0xe8d6, 0x42e3, [0xb1, 0x76, 0xf1, 0x21, 0x17, 0x5, 0xfb, 0x6f]);
enum MFASFINDEXER_TYPE_TIMECODE = GUID(0x49815231, 0x6bad, 0x44fd, [0x81, 0xa, 0x3f, 0x60, 0x98, 0x4e, 0xc7, 0xfd]);
enum MF_CAPTURE_ENGINE_INITIALIZED = GUID(0x219992bc, 0xcf92, 0x4531, [0xa1, 0xae, 0x96, 0xe1, 0xe8, 0x86, 0xc8, 0xf1]);
enum MF_CAPTURE_ENGINE_PREVIEW_STARTED = GUID(0xa416df21, 0xf9d3, 0x4a74, [0x99, 0x1b, 0xb8, 0x17, 0x29, 0x89, 0x52, 0xc4]);
enum MF_CAPTURE_ENGINE_PREVIEW_STOPPED = GUID(0x13d5143c, 0x1edd, 0x4e50, [0xa2, 0xef, 0x35, 0xa, 0x47, 0x67, 0x80, 0x60]);
enum MF_CAPTURE_ENGINE_RECORD_STARTED = GUID(0xac2b027b, 0xddf9, 0x48a0, [0x89, 0xbe, 0x38, 0xab, 0x35, 0xef, 0x45, 0xc0]);
enum MF_CAPTURE_ENGINE_RECORD_STOPPED = GUID(0x55e5200a, 0xf98f, 0x4c0d, [0xa9, 0xec, 0x9e, 0xb2, 0x5e, 0xd3, 0xd7, 0x73]);
enum MF_CAPTURE_ENGINE_PHOTO_TAKEN = GUID(0x3c50c445, 0x7304, 0x48eb, [0x86, 0x5d, 0xbb, 0xa1, 0x9b, 0xa3, 0xaf, 0x5c]);
enum MF_CAPTURE_SOURCE_CURRENT_DEVICE_MEDIA_TYPE_SET = GUID(0xe7e75e4c, 0x39c, 0x4410, [0x81, 0x5b, 0x87, 0x41, 0x30, 0x7b, 0x63, 0xaa]);
enum MF_CAPTURE_ENGINE_ERROR = GUID(0x46b89fc6, 0x33cc, 0x4399, [0x9d, 0xad, 0x78, 0x4d, 0xe7, 0x7d, 0x58, 0x7c]);
enum MF_CAPTURE_ENGINE_EFFECT_ADDED = GUID(0xaa8dc7b5, 0xa048, 0x4e13, [0x8e, 0xbe, 0xf2, 0x3c, 0x46, 0xc8, 0x30, 0xc1]);
enum MF_CAPTURE_ENGINE_EFFECT_REMOVED = GUID(0xc6e8db07, 0xfb09, 0x4a48, [0x89, 0xc6, 0xbf, 0x92, 0xa0, 0x42, 0x22, 0xc9]);
enum MF_CAPTURE_ENGINE_ALL_EFFECTS_REMOVED = GUID(0xfded7521, 0x8ed8, 0x431a, [0xa9, 0x6b, 0xf3, 0xe2, 0x56, 0x5e, 0x98, 0x1c]);
enum MF_CAPTURE_SINK_PREPARED = GUID(0x7bfce257, 0x12b1, 0x4409, [0x8c, 0x34, 0xd4, 0x45, 0xda, 0xab, 0x75, 0x78]);
enum MF_CAPTURE_ENGINE_OUTPUT_MEDIA_TYPE_SET = GUID(0xcaaad994, 0x83ec, 0x45e9, [0xa3, 0xa, 0x1f, 0x20, 0xaa, 0xdb, 0x98, 0x31]);
enum MF_CAPTURE_ENGINE_CAMERA_STREAM_BLOCKED = GUID(0xa4209417, 0x8d39, 0x46f3, [0xb7, 0x59, 0x59, 0x12, 0x52, 0x8f, 0x42, 0x7]);
enum MF_CAPTURE_ENGINE_CAMERA_STREAM_UNBLOCKED = GUID(0x9be9eef0, 0xcdaf, 0x4717, [0x85, 0x64, 0x83, 0x4a, 0xae, 0x66, 0x41, 0x5c]);
enum MF_CAPTURE_ENGINE_D3D_MANAGER = GUID(0x76e25e7b, 0xd595, 0x4283, [0x96, 0x2c, 0xc5, 0x94, 0xaf, 0xd7, 0x8d, 0xdf]);
enum MF_CAPTURE_ENGINE_RECORD_SINK_VIDEO_MAX_UNPROCESSED_SAMPLES = GUID(0xb467f705, 0x7913, 0x4894, [0x9d, 0x42, 0xa2, 0x15, 0xfe, 0xa2, 0x3d, 0xa9]);
enum MF_CAPTURE_ENGINE_RECORD_SINK_AUDIO_MAX_UNPROCESSED_SAMPLES = GUID(0x1cddb141, 0xa7f4, 0x4d58, [0x98, 0x96, 0x4d, 0x15, 0xa5, 0x3c, 0x4e, 0xfe]);
enum MF_CAPTURE_ENGINE_RECORD_SINK_VIDEO_MAX_PROCESSED_SAMPLES = GUID(0xe7b4a49e, 0x382c, 0x4aef, [0xa9, 0x46, 0xae, 0xd5, 0x49, 0xb, 0x71, 0x11]);
enum MF_CAPTURE_ENGINE_RECORD_SINK_AUDIO_MAX_PROCESSED_SAMPLES = GUID(0x9896e12a, 0xf707, 0x4500, [0xb6, 0xbd, 0xdb, 0x8e, 0xb8, 0x10, 0xb5, 0xf]);
enum MF_CAPTURE_ENGINE_USE_AUDIO_DEVICE_ONLY = GUID(0x1c8077da, 0x8466, 0x4dc4, [0x8b, 0x8e, 0x27, 0x6b, 0x3f, 0x85, 0x92, 0x3b]);
enum MF_CAPTURE_ENGINE_USE_VIDEO_DEVICE_ONLY = GUID(0x7e025171, 0xcf32, 0x4f2e, [0x8f, 0x19, 0x41, 0x5, 0x77, 0xb7, 0x3a, 0x66]);
enum MF_CAPTURE_ENGINE_DISABLE_HARDWARE_TRANSFORMS = GUID(0xb7c42a6b, 0x3207, 0x4495, [0xb4, 0xe7, 0x81, 0xf9, 0xc3, 0x5d, 0x59, 0x91]);
enum MF_CAPTURE_ENGINE_DISABLE_DXVA = GUID(0xf9818862, 0x179d, 0x433f, [0xa3, 0x2f, 0x74, 0xcb, 0xcf, 0x74, 0x46, 0x6d]);
enum MF_CAPTURE_ENGINE_MEDIASOURCE_CONFIG = GUID(0xbc6989d2, 0xfc1, 0x46e1, [0xa7, 0x4f, 0xef, 0xd3, 0x6b, 0xc7, 0x88, 0xde]);
enum MF_CAPTURE_ENGINE_DECODER_MFT_FIELDOFUSE_UNLOCK_Attribute = GUID(0x2b8ad2e8, 0x7acb, 0x4321, [0xa6, 0x6, 0x32, 0x5c, 0x42, 0x49, 0xf4, 0xfc]);
enum MF_CAPTURE_ENGINE_ENCODER_MFT_FIELDOFUSE_UNLOCK_Attribute = GUID(0x54c63a00, 0x78d5, 0x422f, [0xaa, 0x3e, 0x5e, 0x99, 0xac, 0x64, 0x92, 0x69]);
enum MF_CAPTURE_ENGINE_ENABLE_CAMERA_STREAMSTATE_NOTIFICATION = GUID(0x4c808e9d, 0xaaed, 0x4713, [0x90, 0xfb, 0xcb, 0x24, 0x6, 0x4a, 0xb8, 0xda]);
enum MF_CAPTURE_ENGINE_MEDIA_CATEGORY = GUID(0x8e3f5bd5, 0xdbbf, 0x42f0, [0x85, 0x42, 0xd0, 0x7a, 0x39, 0x71, 0x76, 0x2a]);
enum MF_CAPTURE_ENGINE_AUDIO_PROCESSING = GUID(0x10f1be5e, 0x7e11, 0x410b, [0x97, 0x3d, 0xf4, 0xb6, 0x10, 0x90, 0x0, 0xfe]);
enum MF_CAPTURE_ENGINE_EVENT_GENERATOR_GUID = GUID(0xabfa8ad5, 0xfc6d, 0x4911, [0x87, 0xe0, 0x96, 0x19, 0x45, 0xf8, 0xf7, 0xce]);
enum MF_CAPTURE_ENGINE_EVENT_STREAM_INDEX = GUID(0x82697f44, 0xb1cf, 0x42eb, [0x97, 0x53, 0xf8, 0x6d, 0x64, 0x9c, 0x88, 0x65]);
enum MF_CAPTURE_ENGINE_SELECTEDCAMERAPROFILE = GUID(0x3160b7e, 0x1c6f, 0x4db2, [0xad, 0x56, 0xa7, 0xc4, 0x30, 0xf8, 0x23, 0x92]);
enum MF_CAPTURE_ENGINE_SELECTEDCAMERAPROFILE_INDEX = GUID(0x3ce88613, 0x2214, 0x46c3, [0xb4, 0x17, 0x82, 0xf8, 0xa3, 0x13, 0xc9, 0xc3]);
enum CLSID_MFCaptureEngine = GUID(0xefce38d3, 0x8914, 0x4674, [0xa7, 0xdf, 0xae, 0x1b, 0x3d, 0x65, 0x4b, 0x8a]);
enum CLSID_MFCaptureEngineClassFactory = GUID(0xefce38d3, 0x8914, 0x4674, [0xa7, 0xdf, 0xae, 0x1b, 0x3d, 0x65, 0x4b, 0x8a]);
enum MFSampleExtension_DeviceReferenceSystemTime = GUID(0x6523775a, 0xba2d, 0x405f, [0xb2, 0xc5, 0x1, 0xff, 0x88, 0xe2, 0xe8, 0xf6]);
enum MF_D3D12_SYNCHRONIZATION_OBJECT = GUID(0x2a7c8d6a, 0x85a6, 0x494d, [0xa0, 0x46, 0x6, 0xea, 0x1a, 0x13, 0x8f, 0x4b]);
enum MF_MT_D3D_RESOURCE_VERSION = GUID(0x174f1e85, 0xfe26, 0x453d, [0xb5, 0x2e, 0x5b, 0xdd, 0x4e, 0x55, 0xb9, 0x44]);
enum MF_MT_D3D12_CPU_READBACK = GUID(0x28ee9fe3, 0xd481, 0x46a6, [0xb9, 0x8a, 0x7f, 0x69, 0xd5, 0x28, 0xe, 0x82]);
enum MF_MT_D3D12_TEXTURE_LAYOUT = GUID(0x97c85caa, 0xbeb, 0x4ee1, [0x97, 0x15, 0xf2, 0x2f, 0xad, 0x8c, 0x10, 0xf5]);
enum MF_MT_D3D12_RESOURCE_FLAG_ALLOW_RENDER_TARGET = GUID(0xeeac2585, 0x3430, 0x498c, [0x84, 0xa2, 0x77, 0xb1, 0xbb, 0xa5, 0x70, 0xf6]);
enum MF_MT_D3D12_RESOURCE_FLAG_ALLOW_DEPTH_STENCIL = GUID(0xb1138dc3, 0x1d5, 0x4c14, [0x9b, 0xdc, 0xcd, 0xc9, 0x33, 0x6f, 0x55, 0xb9]);
enum MF_MT_D3D12_RESOURCE_FLAG_ALLOW_UNORDERED_ACCESS = GUID(0x82c85647, 0x5057, 0x4960, [0x95, 0x59, 0xf4, 0x5b, 0x8e, 0x27, 0x14, 0x27]);
enum MF_MT_D3D12_RESOURCE_FLAG_DENY_SHADER_RESOURCE = GUID(0xba06bfac, 0xffe3, 0x474a, [0xab, 0x55, 0x16, 0x1e, 0xe4, 0x41, 0x7a, 0x2e]);
enum MF_MT_D3D12_RESOURCE_FLAG_ALLOW_CROSS_ADAPTER = GUID(0xa6a1e439, 0x2f96, 0x4ab5, [0x98, 0xdc, 0xad, 0xf7, 0x49, 0x73, 0x50, 0x5d]);
enum MF_MT_D3D12_RESOURCE_FLAG_ALLOW_SIMULTANEOUS_ACCESS = GUID(0xa4940b2, 0xcfd6, 0x4738, [0x9d, 0x2, 0x98, 0x11, 0x37, 0x34, 0x1, 0x5a]);
enum MF_SA_D3D12_HEAP_FLAGS = GUID(0x496b3266, 0xd28f, 0x4f8c, [0x93, 0xa7, 0x4a, 0x59, 0x6b, 0x1a, 0x31, 0xa1]);
enum MF_SA_D3D12_HEAP_TYPE = GUID(0x56f26a76, 0xbbc1, 0x4ce0, [0xbb, 0x11, 0xe2, 0x23, 0x68, 0xd8, 0x74, 0xed]);
enum MF_SA_D3D12_CLEAR_VALUE = GUID(0x86ba9a39, 0x526, 0x495d, [0x9a, 0xb5, 0x54, 0xec, 0x9f, 0xad, 0x6f, 0xc3]);
enum MF_MSE_CALLBACK = GUID(0x9063a7c0, 0x42c5, 0x4ffd, [0xa8, 0xa8, 0x6f, 0xcf, 0x9e, 0xa3, 0xd0, 0xc]);
enum MF_MSE_ACTIVELIST_CALLBACK = GUID(0x949bda0f, 0x4549, 0x46d5, [0xad, 0x7f, 0xb8, 0x46, 0xe1, 0xab, 0x16, 0x52]);
enum MF_MSE_BUFFERLIST_CALLBACK = GUID(0x42e669b0, 0xd60e, 0x4afb, [0xa8, 0x5b, 0xd8, 0xe5, 0xfe, 0x6b, 0xda, 0xb5]);
enum MF_MSE_VP9_SUPPORT = GUID(0x92d78429, 0xd88b, 0x4ff0, [0x83, 0x22, 0x80, 0x3e, 0xfa, 0x6e, 0x96, 0x26]);
enum MF_MSE_OPUS_SUPPORT = GUID(0x4d224cc1, 0x8cc4, 0x48a3, [0xa7, 0xa7, 0xe4, 0xc1, 0x6c, 0xe6, 0x38, 0x8a]);
enum MF_MEDIA_ENGINE_NEEDKEY_CALLBACK = GUID(0x7ea80843, 0xb6e4, 0x432c, [0x8e, 0xa4, 0x78, 0x48, 0xff, 0xe4, 0x22, 0xe]);
enum MF_MEDIA_ENGINE_CALLBACK = GUID(0xc60381b8, 0x83a4, 0x41f8, [0xa3, 0xd0, 0xde, 0x5, 0x7, 0x68, 0x49, 0xa9]);
enum MF_MEDIA_ENGINE_DXGI_MANAGER = GUID(0x65702da, 0x1094, 0x486d, [0x86, 0x17, 0xee, 0x7c, 0xc4, 0xee, 0x46, 0x48]);
enum MF_MEDIA_ENGINE_EXTENSION = GUID(0x3109fd46, 0x60d, 0x4b62, [0x8d, 0xcf, 0xfa, 0xff, 0x81, 0x13, 0x18, 0xd2]);
enum MF_MEDIA_ENGINE_PLAYBACK_HWND = GUID(0xd988879b, 0x67c9, 0x4d92, [0xba, 0xa7, 0x6e, 0xad, 0xd4, 0x46, 0x3, 0x9d]);
enum MF_MEDIA_ENGINE_OPM_HWND = GUID(0xa0be8ee7, 0x572, 0x4f2c, [0xa8, 0x1, 0x2a, 0x15, 0x1b, 0xd3, 0xe7, 0x26]);
enum MF_MEDIA_ENGINE_PLAYBACK_VISUAL = GUID(0x6debd26f, 0x6ab9, 0x4d7e, [0xb0, 0xee, 0xc6, 0x1a, 0x73, 0xff, 0xad, 0x15]);
enum MF_MEDIA_ENGINE_COREWINDOW = GUID(0xfccae4dc, 0xb7f, 0x41c2, [0x9f, 0x96, 0x46, 0x59, 0x94, 0x8a, 0xcd, 0xdc]);
enum MF_MEDIA_ENGINE_VIDEO_OUTPUT_FORMAT = GUID(0x5066893c, 0x8cf9, 0x42bc, [0x8b, 0x8a, 0x47, 0x22, 0x12, 0xe5, 0x27, 0x26]);
enum MF_MEDIA_ENGINE_CONTENT_PROTECTION_FLAGS = GUID(0xe0350223, 0x5aaf, 0x4d76, [0xa7, 0xc3, 0x6, 0xde, 0x70, 0x89, 0x4d, 0xb4]);
enum MF_MEDIA_ENGINE_CONTENT_PROTECTION_MANAGER = GUID(0xfdd6dfaa, 0xbd85, 0x4af3, [0x9e, 0xf, 0xa0, 0x1d, 0x53, 0x9d, 0x87, 0x6a]);
enum MF_MEDIA_ENGINE_AUDIO_ENDPOINT_ROLE = GUID(0xd2cb93d1, 0x116a, 0x44f2, [0x93, 0x85, 0xf7, 0xd0, 0xfd, 0xa2, 0xfb, 0x46]);
enum MF_MEDIA_ENGINE_AUDIO_CATEGORY = GUID(0xc8d4c51d, 0x350e, 0x41f2, [0xba, 0x46, 0xfa, 0xeb, 0xbb, 0x8, 0x57, 0xf6]);
enum MF_MEDIA_ENGINE_STREAM_CONTAINS_ALPHA_CHANNEL = GUID(0x5cbfaf44, 0xd2b2, 0x4cfb, [0x80, 0xa7, 0xd4, 0x29, 0xc7, 0x4c, 0x78, 0x9d]);
enum MF_MEDIA_ENGINE_BROWSER_COMPATIBILITY_MODE = GUID(0x4e0212e2, 0xe18f, 0x41e1, [0x95, 0xe5, 0xc0, 0xe7, 0xe9, 0x23, 0x5b, 0xc3]);
enum MF_MEDIA_ENGINE_BROWSER_COMPATIBILITY_MODE_IE9 = GUID(0x52c2d39, 0x40c0, 0x4188, [0xab, 0x86, 0xf8, 0x28, 0x27, 0x3b, 0x75, 0x22]);
enum MF_MEDIA_ENGINE_BROWSER_COMPATIBILITY_MODE_IE10 = GUID(0x11a47afd, 0x6589, 0x4124, [0xb3, 0x12, 0x61, 0x58, 0xec, 0x51, 0x7f, 0xc3]);
enum MF_MEDIA_ENGINE_BROWSER_COMPATIBILITY_MODE_IE11 = GUID(0x1cf1315f, 0xce3f, 0x4035, [0x93, 0x91, 0x16, 0x14, 0x2f, 0x77, 0x51, 0x89]);
enum MF_MEDIA_ENGINE_BROWSER_COMPATIBILITY_MODE_IE_EDGE = GUID(0xa6f3e465, 0x3aca, 0x442c, [0xa3, 0xf0, 0xad, 0x6d, 0xda, 0xd8, 0x39, 0xae]);
enum MF_MEDIA_ENGINE_COMPATIBILITY_MODE = GUID(0x3ef26ad4, 0xdc54, 0x45de, [0xb9, 0xaf, 0x76, 0xc8, 0xc6, 0x6b, 0xfa, 0x8e]);
enum MF_MEDIA_ENGINE_COMPATIBILITY_MODE_WWA_EDGE = GUID(0x15b29098, 0x9f01, 0x4e4d, [0xb6, 0x5a, 0xc0, 0x6c, 0x6c, 0x89, 0xda, 0x2a]);
enum MF_MEDIA_ENGINE_COMPATIBILITY_MODE_WIN10 = GUID(0x5b25e089, 0x6ca7, 0x4139, [0xa2, 0xcb, 0xfc, 0xaa, 0xb3, 0x95, 0x52, 0xa3]);
enum MF_MEDIA_ENGINE_SOURCE_RESOLVER_CONFIG_STORE = GUID(0xac0c497, 0xb3c4, 0x48c9, [0x9c, 0xde, 0xbb, 0x8c, 0xa2, 0x44, 0x2c, 0xa3]);
enum MF_MEDIA_ENGINE_TRACK_ID = GUID(0x65bea312, 0x4043, 0x4815, [0x8e, 0xab, 0x44, 0xdc, 0xe2, 0xef, 0x8f, 0x2a]);
enum MF_MEDIA_ENGINE_TELEMETRY_APPLICATION_ID = GUID(0x1e7b273b, 0xa7e4, 0x402a, [0x8f, 0x51, 0xc4, 0x8e, 0x88, 0xa2, 0xca, 0xbc]);
enum MF_MEDIA_ENGINE_SYNCHRONOUS_CLOSE = GUID(0xc3c2e12f, 0x7e0e, 0x4e43, [0xb9, 0x1c, 0xdc, 0x99, 0x2c, 0xcd, 0xfa, 0x5e]);
enum MF_MEDIA_ENGINE_MEDIA_PLAYER_MODE = GUID(0x3ddd8d45, 0x5aa1, 0x4112, [0x82, 0xe5, 0x36, 0xf6, 0xa2, 0x19, 0x7e, 0x6e]);
enum CLSID_MFMediaEngineClassFactory = GUID(0xb44392da, 0x499b, 0x446b, [0xa4, 0xcb, 0x0, 0x5f, 0xea, 0xd0, 0xe6, 0xd5]);
enum MF_MEDIA_ENGINE_TIMEDTEXT = GUID(0x805ea411, 0x92e0, 0x4e59, [0x9b, 0x6e, 0x5c, 0x7d, 0x79, 0x15, 0xe6, 0x4f]);
enum MF_MEDIA_ENGINE_CONTINUE_ON_CODEC_ERROR = GUID(0xdbcdb7f9, 0x48e4, 0x4295, [0xb7, 0xd, 0xd5, 0x18, 0x23, 0x4e, 0xeb, 0x38]);
enum MF_MEDIA_ENGINE_EME_CALLBACK = GUID(0x494553a7, 0xa481, 0x4cb7, [0xbe, 0xc5, 0x38, 0x9, 0x3, 0x51, 0x37, 0x31]);
enum CLSID_MPEG2DLNASink = GUID(0xfa5fe7c5, 0x6a1d, 0x4b11, [0xb4, 0x1f, 0xf9, 0x59, 0xd6, 0xc7, 0x65, 0x0]);
enum MF_MP2DLNA_USE_MMCSS = GUID(0x54f3e2ee, 0xa2a2, 0x497d, [0x98, 0x34, 0x97, 0x3a, 0xfd, 0xe5, 0x21, 0xeb]);
enum MF_MP2DLNA_VIDEO_BIT_RATE = GUID(0xe88548de, 0x73b4, 0x42d7, [0x9c, 0x75, 0xad, 0xfa, 0xa, 0x2a, 0x6e, 0x4c]);
enum MF_MP2DLNA_AUDIO_BIT_RATE = GUID(0x2d1c070e, 0x2b5f, 0x4ab3, [0xa7, 0xe6, 0x8d, 0x94, 0x3b, 0xa8, 0xd0, 0xa]);
enum MF_MP2DLNA_ENCODE_QUALITY = GUID(0xb52379d7, 0x1d46, 0x4fb6, [0xa3, 0x17, 0xa4, 0xa5, 0xf6, 0x9, 0x59, 0xf8]);
enum MF_MP2DLNA_STATISTICS = GUID(0x75e488a3, 0xd5ad, 0x4898, [0x85, 0xe0, 0xbc, 0xce, 0x24, 0xa7, 0x22, 0xd7]);
enum CLSID_MFReadWriteClassFactory = GUID(0x48e2ed0f, 0x98c2, 0x4a37, [0xbe, 0xd5, 0x16, 0x63, 0x12, 0xdd, 0xd8, 0x3f]);
enum CLSID_MFSourceReader = GUID(0x1777133c, 0x881, 0x411b, [0xa5, 0x77, 0xad, 0x54, 0x5f, 0x7, 0x14, 0xc4]);
enum MF_SOURCE_READER_ASYNC_CALLBACK = GUID(0x1e3dbeac, 0xbb43, 0x4c35, [0xb5, 0x7, 0xcd, 0x64, 0x44, 0x64, 0xc9, 0x65]);
enum MF_SOURCE_READER_D3D_MANAGER = GUID(0xec822da2, 0xe1e9, 0x4b29, [0xa0, 0xd8, 0x56, 0x3c, 0x71, 0x9f, 0x52, 0x69]);
enum MF_SOURCE_READER_DISABLE_DXVA = GUID(0xaa456cfd, 0x3943, 0x4a1e, [0xa7, 0x7d, 0x18, 0x38, 0xc0, 0xea, 0x2e, 0x35]);
enum MF_SOURCE_READER_MEDIASOURCE_CONFIG = GUID(0x9085abeb, 0x354, 0x48f9, [0xab, 0xb5, 0x20, 0xd, 0xf8, 0x38, 0xc6, 0x8e]);
enum MF_SOURCE_READER_MEDIASOURCE_CHARACTERISTICS = GUID(0x6d23f5c8, 0xc5d7, 0x4a9b, [0x99, 0x71, 0x5d, 0x11, 0xf8, 0xbc, 0xa8, 0x80]);
enum MF_SOURCE_READER_ENABLE_VIDEO_PROCESSING = GUID(0xfb394f3d, 0xccf1, 0x42ee, [0xbb, 0xb3, 0xf9, 0xb8, 0x45, 0xd5, 0x68, 0x1d]);
enum MF_SOURCE_READER_ENABLE_ADVANCED_VIDEO_PROCESSING = GUID(0xf81da2c, 0xb537, 0x4672, [0xa8, 0xb2, 0xa6, 0x81, 0xb1, 0x73, 0x7, 0xa3]);
enum MF_SOURCE_READER_DISABLE_CAMERA_PLUGINS = GUID(0x9d3365dd, 0x58f, 0x4cfb, [0x9f, 0x97, 0xb3, 0x14, 0xcc, 0x99, 0xc8, 0xad]);
enum MF_SOURCE_READER_DISCONNECT_MEDIASOURCE_ON_SHUTDOWN = GUID(0x56b67165, 0x219e, 0x456d, [0xa2, 0x2e, 0x2d, 0x30, 0x4, 0xc7, 0xfe, 0x56]);
enum MF_SOURCE_READER_ENABLE_TRANSCODE_ONLY_TRANSFORMS = GUID(0xdfd4f008, 0xb5fd, 0x4e78, [0xae, 0x44, 0x62, 0xa1, 0xe6, 0x7b, 0xbe, 0x27]);
enum MF_SOURCE_READER_D3D11_BIND_FLAGS = GUID(0x33f3197b, 0xf73a, 0x4e14, [0x8d, 0x85, 0xe, 0x4c, 0x43, 0x68, 0x78, 0x8d]);
enum CLSID_MFSinkWriter = GUID(0xa3bbfb17, 0x8273, 0x4e52, [0x9e, 0xe, 0x97, 0x39, 0xdc, 0x88, 0x79, 0x90]);
enum MF_SINK_WRITER_ASYNC_CALLBACK = GUID(0x48cb183e, 0x7b0b, 0x46f4, [0x82, 0x2e, 0x5e, 0x1d, 0x2d, 0xda, 0x43, 0x54]);
enum MF_SINK_WRITER_DISABLE_THROTTLING = GUID(0x8b845d8, 0x2b74, 0x4afe, [0x9d, 0x53, 0xbe, 0x16, 0xd2, 0xd5, 0xae, 0x4f]);
enum MF_SINK_WRITER_D3D_MANAGER = GUID(0xec822da2, 0xe1e9, 0x4b29, [0xa0, 0xd8, 0x56, 0x3c, 0x71, 0x9f, 0x52, 0x69]);
enum MF_SINK_WRITER_ENCODER_CONFIG = GUID(0xad91cd04, 0xa7cc, 0x4ac7, [0x99, 0xb6, 0xa5, 0x7b, 0x9a, 0x4a, 0x7c, 0x70]);
enum MF_READWRITE_DISABLE_CONVERTERS = GUID(0x98d5b065, 0x1374, 0x4847, [0x8d, 0x5d, 0x31, 0x52, 0xf, 0xee, 0x71, 0x56]);
enum MF_READWRITE_ENABLE_HARDWARE_TRANSFORMS = GUID(0xa634a91c, 0x822b, 0x41b9, [0xa4, 0x94, 0x4d, 0xe4, 0x64, 0x36, 0x12, 0xb0]);
enum MF_READWRITE_MMCSS_CLASS = GUID(0x39384300, 0xd0eb, 0x40b1, [0x87, 0xa0, 0x33, 0x18, 0x87, 0x1b, 0x5a, 0x53]);
enum MF_READWRITE_MMCSS_PRIORITY = GUID(0x43ad19ce, 0xf33f, 0x4ba9, [0xa5, 0x80, 0xe4, 0xcd, 0x12, 0xf2, 0xd1, 0x44]);
enum MF_READWRITE_MMCSS_CLASS_AUDIO = GUID(0x430847da, 0x890, 0x4b0e, [0x93, 0x8c, 0x5, 0x43, 0x32, 0xc5, 0x47, 0xe1]);
enum MF_READWRITE_MMCSS_PRIORITY_AUDIO = GUID(0x273db885, 0x2de2, 0x4db2, [0xa6, 0xa7, 0xfd, 0xb6, 0x6f, 0xb4, 0xb, 0x61]);
enum MF_READWRITE_D3D_OPTIONAL = GUID(0x216479d9, 0x3071, 0x42ca, [0xbb, 0x6c, 0x4c, 0x22, 0x10, 0x2e, 0x1d, 0x18]);
enum MF_MEDIASINK_AUTOFINALIZE_SUPPORTED = GUID(0x48c131be, 0x135a, 0x41cb, [0x82, 0x90, 0x3, 0x65, 0x25, 0x9, 0xc9, 0x99]);
enum MF_MEDIASINK_ENABLE_AUTOFINALIZE = GUID(0x34014265, 0xcb7e, 0x4cde, [0xac, 0x7c, 0xef, 0xfd, 0x3b, 0x3c, 0x25, 0x30]);
enum MF_READWRITE_ENABLE_AUTOFINALIZE = GUID(0xdd7ca129, 0x8cd1, 0x4dc5, [0x9d, 0xde, 0xce, 0x16, 0x86, 0x75, 0xde, 0x61]);
enum MFP_POSITIONTYPE_100NS = GUID(0x0, 0x0, 0x0, [0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0]);
enum MF_MEDIA_SHARING_ENGINE_DEVICE_NAME = GUID(0x771e05d1, 0x862f, 0x4299, [0x95, 0xac, 0xae, 0x81, 0xfd, 0x14, 0xf3, 0xe7]);
enum MF_MEDIA_SHARING_ENGINE_DEVICE = GUID(0xb461c58a, 0x7a08, 0x4b98, [0x99, 0xa8, 0x70, 0xfd, 0x5f, 0x3b, 0xad, 0xfd]);
enum CLSID_MFMediaSharingEngineClassFactory = GUID(0xf8e307fb, 0x6d45, 0x4ad3, [0x99, 0x93, 0x66, 0xcd, 0x5a, 0x52, 0x96, 0x59]);
enum CLSID_MFImageSharingEngineClassFactory = GUID(0xb22c3339, 0x87f3, 0x4059, [0xa0, 0xc5, 0x3, 0x7a, 0xa9, 0x70, 0x7e, 0xaf]);
enum CLSID_PlayToSourceClassFactory = GUID(0xda17539a, 0x3dc3, 0x42c1, [0xa7, 0x49, 0xa1, 0x83, 0xb5, 0x1f, 0x8, 0x5e]);
enum GUID_PlayToService = GUID(0xf6a8ff9d, 0x9e14, 0x41c9, [0xbf, 0xf, 0x12, 0xa, 0x2b, 0x3c, 0xe1, 0x20]);
enum GUID_NativeDeviceService = GUID(0xef71e53c, 0x52f4, 0x43c5, [0xb8, 0x6a, 0xad, 0x6c, 0xb2, 0x16, 0xa6, 0x1e]);
enum MF_CONTENTDECRYPTIONMODULE_SERVICE = GUID(0x15320c45, 0xff80, 0x484a, [0x9d, 0xcb, 0xd, 0xf8, 0x94, 0xe6, 0x9a, 0x1]);
enum MF_VIRTUALCAMERA_CONFIGURATION_APP_PACKAGE_FAMILY_NAME = GUID(0x658abe51, 0x8044, 0x462e, [0x97, 0xea, 0xe6, 0x76, 0xfd, 0x72, 0x5, 0x5f]);
enum MF_FRAMESERVER_VCAMEVENT_EXTENDED_SOURCE_INITIALIZE = GUID(0xe52c4dff, 0xe46d, 0x4d0b, [0xbc, 0x75, 0xdd, 0xd4, 0xc8, 0x72, 0x3f, 0x96]);
enum MF_FRAMESERVER_VCAMEVENT_EXTENDED_SOURCE_START = GUID(0xb1eeb989, 0xb456, 0x4f4a, [0xae, 0x40, 0x7, 0x9c, 0x28, 0xe2, 0x4a, 0xf8]);
enum MF_FRAMESERVER_VCAMEVENT_EXTENDED_SOURCE_STOP = GUID(0xb7fe7a61, 0xfe91, 0x415e, [0x86, 0x8, 0xd3, 0x7d, 0xed, 0xb1, 0xa5, 0x8b]);
enum MF_FRAMESERVER_VCAMEVENT_EXTENDED_SOURCE_UNINITIALIZE = GUID(0xa0ebaba7, 0xa422, 0x4e33, [0x84, 0x1, 0xb3, 0x7d, 0x28, 0x0, 0xaa, 0x67]);
enum MF_FRAMESERVER_VCAMEVENT_EXTENDED_PIPELINE_SHUTDOWN = GUID(0x45a81b31, 0x43f8, 0x4e5d, [0x8c, 0xe2, 0x22, 0xdc, 0xe0, 0x26, 0x99, 0x6d]);
enum MF_FRAMESERVER_VCAMEVENT_EXTENDED_CUSTOM_EVENT = GUID(0x6e59489c, 0x47d3, 0x4467, [0x83, 0xef, 0x12, 0xd3, 0x4e, 0x87, 0x16, 0x65]);
struct AM_MEDIA_TYPE
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
struct CodecAPIEventData
{
    GUID guid;
    uint dataLength;
    uint[3] reserved;
}
enum IID_ICodecAPI = GUID(0x901db4c7, 0x31ce, 0x41a2, [0x85, 0xdc, 0x8f, 0xa0, 0xbf, 0x41, 0xb8, 0xda]);
interface ICodecAPI : IUnknown
{
    HRESULT IsSupported(const(GUID)*);
    HRESULT IsModifiable(const(GUID)*);
    HRESULT GetParameterRange(const(GUID)*, VARIANT*, VARIANT*, VARIANT*);
    HRESULT GetParameterValues(const(GUID)*, VARIANT**, uint*);
    HRESULT GetDefaultValue(const(GUID)*, VARIANT*);
    HRESULT GetValue(const(GUID)*, VARIANT*);
    HRESULT SetValue(const(GUID)*, VARIANT*);
    HRESULT RegisterForEvent(const(GUID)*, long);
    HRESULT UnregisterForEvent(const(GUID)*);
    HRESULT SetAllDefaults();
    HRESULT SetValueWithNotify(const(GUID)*, VARIANT*, GUID**, uint*);
    HRESULT SetAllDefaultsWithNotify(GUID**, uint*);
    HRESULT GetAllSettings(IStream);
    HRESULT SetAllSettings(IStream);
    HRESULT SetAllSettingsWithNotify(IStream, GUID**, uint*);
}
struct VIDEOINFOHEADER
{
    RECT rcSource;
    RECT rcTarget;
    uint dwBitRate;
    uint dwBitErrorRate;
    long AvgTimePerFrame;
    BITMAPINFOHEADER bmiHeader;
}
struct MPEG1VIDEOINFO
{
    VIDEOINFOHEADER hdr;
    uint dwStartTimeCode;
    uint cbSequenceHeader;
    ubyte[1] bSequenceHeader;
}
struct VIDEOINFOHEADER2
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
    union
    {
        uint dwControlFlags;
        uint dwReserved1;
    }
    uint dwReserved2;
    BITMAPINFOHEADER bmiHeader;
}
struct MPEG2VIDEOINFO
{
    VIDEOINFOHEADER2 hdr;
    uint dwStartTimeCode;
    uint cbSequenceHeader;
    uint dwProfile;
    uint dwLevel;
    MPEG2VIDEOINFO_FLAGS dwFlags;
    uint[1] dwSequenceHeader;
}
struct D3DOVERLAYCAPS
{
    uint Caps;
    uint MaxOverlayDisplayWidth;
    uint MaxOverlayDisplayHeight;
}
struct D3DCONTENTPROTECTIONCAPS
{
    uint Caps;
    GUID KeyExchangeType;
    uint BufferAlignmentStart;
    uint BlockAlignmentSize;
    ulong ProtectedMemorySize;
}
enum IID_IDirect3D9ExOverlayExtension = GUID(0x187aeb13, 0xaaf5, 0x4c59, [0x87, 0x6d, 0xe0, 0x59, 0x8, 0x8c, 0xd, 0xf8]);
interface IDirect3D9ExOverlayExtension : IUnknown
{
    HRESULT CheckDeviceOverlayType(uint, D3DDEVTYPE, uint, uint, D3DFORMAT, D3DDISPLAYMODEEX*, D3DDISPLAYROTATION, D3DOVERLAYCAPS*);
}
enum IID_IDirect3DDevice9Video = GUID(0x26dc4561, 0xa1ee, 0x4ae7, [0x96, 0xda, 0x11, 0x8a, 0x36, 0xc0, 0xec, 0x95]);
interface IDirect3DDevice9Video : IUnknown
{
    HRESULT GetContentProtectionCaps(const(GUID)*, const(GUID)*, D3DCONTENTPROTECTIONCAPS*);
    HRESULT CreateAuthenticatedChannel(D3DAUTHENTICATEDCHANNELTYPE, IDirect3DAuthenticatedChannel9*, HANDLE*);
    HRESULT CreateCryptoSession(const(GUID)*, const(GUID)*, IDirect3DCryptoSession9*, HANDLE*);
}
enum IID_IDirect3DAuthenticatedChannel9 = GUID(0xff24beee, 0xda21, 0x4beb, [0x98, 0xb5, 0xd2, 0xf8, 0x99, 0xf9, 0x8a, 0xf9]);
interface IDirect3DAuthenticatedChannel9 : IUnknown
{
    HRESULT GetCertificateSize(uint*);
    HRESULT GetCertificate(uint, ubyte*);
    HRESULT NegotiateKeyExchange(uint, void*);
    HRESULT Query(uint, const(void)*, uint, void*);
    HRESULT Configure(uint, const(void)*, D3DAUTHENTICATEDCHANNEL_CONFIGURE_OUTPUT*);
}
enum IID_IDirect3DCryptoSession9 = GUID(0xfa0ab799, 0x7a9c, 0x48ca, [0x8c, 0x5b, 0x23, 0x7e, 0x71, 0xa5, 0x44, 0x34]);
interface IDirect3DCryptoSession9 : IUnknown
{
    HRESULT GetCertificateSize(uint*);
    HRESULT GetCertificate(uint, ubyte*);
    HRESULT NegotiateKeyExchange(uint, void*);
    HRESULT EncryptionBlt(IDirect3DSurface9, IDirect3DSurface9, uint, void*);
    HRESULT DecryptionBlt(IDirect3DSurface9, IDirect3DSurface9, uint, D3DENCRYPTED_BLOCK_INFO*, void*, void*);
    HRESULT GetSurfacePitch(IDirect3DSurface9, uint*);
    HRESULT StartSessionKeyRefresh(void*, uint);
    HRESULT FinishSessionKeyRefresh();
    HRESULT GetEncryptionBltKey(void*, uint);
}
alias D3D12_VIDEO_FIELD_TYPE = int;
enum : int
{
    D3D12_VIDEO_FIELD_TYPE_NONE                          = 0x00000000,
    D3D12_VIDEO_FIELD_TYPE_INTERLACED_TOP_FIELD_FIRST    = 0x00000001,
    D3D12_VIDEO_FIELD_TYPE_INTERLACED_BOTTOM_FIELD_FIRST = 0x00000002,
}

alias D3D12_VIDEO_FRAME_STEREO_FORMAT = int;
enum : int
{
    D3D12_VIDEO_FRAME_STEREO_FORMAT_NONE       = 0x00000000,
    D3D12_VIDEO_FRAME_STEREO_FORMAT_MONO       = 0x00000001,
    D3D12_VIDEO_FRAME_STEREO_FORMAT_HORIZONTAL = 0x00000002,
    D3D12_VIDEO_FRAME_STEREO_FORMAT_VERTICAL   = 0x00000003,
    D3D12_VIDEO_FRAME_STEREO_FORMAT_SEPARATE   = 0x00000004,
}

struct D3D12_VIDEO_FORMAT
{
    DXGI_FORMAT Format;
    DXGI_COLOR_SPACE_TYPE ColorSpace;
}
struct D3D12_VIDEO_SAMPLE
{
    uint Width;
    uint Height;
    D3D12_VIDEO_FORMAT Format;
}
alias D3D12_VIDEO_FRAME_CODED_INTERLACE_TYPE = int;
enum : int
{
    D3D12_VIDEO_FRAME_CODED_INTERLACE_TYPE_NONE        = 0x00000000,
    D3D12_VIDEO_FRAME_CODED_INTERLACE_TYPE_FIELD_BASED = 0x00000001,
}

alias D3D12_FEATURE_VIDEO = int;
enum : int
{
    D3D12_FEATURE_VIDEO_DECODE_SUPPORT                       = 0x00000000,
    D3D12_FEATURE_VIDEO_DECODE_PROFILES                      = 0x00000001,
    D3D12_FEATURE_VIDEO_DECODE_FORMATS                       = 0x00000002,
    D3D12_FEATURE_VIDEO_DECODE_CONVERSION_SUPPORT            = 0x00000003,
    D3D12_FEATURE_VIDEO_PROCESS_SUPPORT                      = 0x00000005,
    D3D12_FEATURE_VIDEO_PROCESS_MAX_INPUT_STREAMS            = 0x00000006,
    D3D12_FEATURE_VIDEO_PROCESS_REFERENCE_INFO               = 0x00000007,
    D3D12_FEATURE_VIDEO_DECODER_HEAP_SIZE                    = 0x00000008,
    D3D12_FEATURE_VIDEO_PROCESSOR_SIZE                       = 0x00000009,
    D3D12_FEATURE_VIDEO_DECODE_PROFILE_COUNT                 = 0x0000000a,
    D3D12_FEATURE_VIDEO_DECODE_FORMAT_COUNT                  = 0x0000000b,
    D3D12_FEATURE_VIDEO_ARCHITECTURE                         = 0x00000011,
    D3D12_FEATURE_VIDEO_DECODE_HISTOGRAM                     = 0x00000012,
    D3D12_FEATURE_VIDEO_FEATURE_AREA_SUPPORT                 = 0x00000013,
    D3D12_FEATURE_VIDEO_MOTION_ESTIMATOR                     = 0x00000014,
    D3D12_FEATURE_VIDEO_MOTION_ESTIMATOR_SIZE                = 0x00000015,
    D3D12_FEATURE_VIDEO_EXTENSION_COMMAND_COUNT              = 0x00000016,
    D3D12_FEATURE_VIDEO_EXTENSION_COMMANDS                   = 0x00000017,
    D3D12_FEATURE_VIDEO_EXTENSION_COMMAND_PARAMETER_COUNT    = 0x00000018,
    D3D12_FEATURE_VIDEO_EXTENSION_COMMAND_PARAMETERS         = 0x00000019,
    D3D12_FEATURE_VIDEO_EXTENSION_COMMAND_SUPPORT            = 0x0000001a,
    D3D12_FEATURE_VIDEO_EXTENSION_COMMAND_SIZE               = 0x0000001b,
    D3D12_FEATURE_VIDEO_DECODE_PROTECTED_RESOURCES           = 0x0000001c,
    D3D12_FEATURE_VIDEO_PROCESS_PROTECTED_RESOURCES          = 0x0000001d,
    D3D12_FEATURE_VIDEO_MOTION_ESTIMATOR_PROTECTED_RESOURCES = 0x0000001e,
    D3D12_FEATURE_VIDEO_DECODER_HEAP_SIZE1                   = 0x0000001f,
    D3D12_FEATURE_VIDEO_PROCESSOR_SIZE1                      = 0x00000020,
}

alias D3D12_BITSTREAM_ENCRYPTION_TYPE = int;
enum : int
{
    D3D12_BITSTREAM_ENCRYPTION_TYPE_NONE = 0x00000000,
}

struct D3D12_VIDEO_DECODE_CONFIGURATION
{
    GUID DecodeProfile;
    D3D12_BITSTREAM_ENCRYPTION_TYPE BitstreamEncryption;
    D3D12_VIDEO_FRAME_CODED_INTERLACE_TYPE InterlaceType;
}
struct D3D12_VIDEO_DECODER_DESC
{
    uint NodeMask;
    D3D12_VIDEO_DECODE_CONFIGURATION Configuration;
}
struct D3D12_VIDEO_DECODER_HEAP_DESC
{
    uint NodeMask;
    D3D12_VIDEO_DECODE_CONFIGURATION Configuration;
    uint DecodeWidth;
    uint DecodeHeight;
    DXGI_FORMAT Format;
    DXGI_RATIONAL FrameRate;
    uint BitRate;
    uint MaxDecodePictureBufferCount;
}
struct D3D12_VIDEO_SIZE_RANGE
{
    uint MaxWidth;
    uint MaxHeight;
    uint MinWidth;
    uint MinHeight;
}
alias D3D12_VIDEO_PROCESS_FILTER = int;
enum : int
{
    D3D12_VIDEO_PROCESS_FILTER_BRIGHTNESS         = 0x00000000,
    D3D12_VIDEO_PROCESS_FILTER_CONTRAST           = 0x00000001,
    D3D12_VIDEO_PROCESS_FILTER_HUE                = 0x00000002,
    D3D12_VIDEO_PROCESS_FILTER_SATURATION         = 0x00000003,
    D3D12_VIDEO_PROCESS_FILTER_NOISE_REDUCTION    = 0x00000004,
    D3D12_VIDEO_PROCESS_FILTER_EDGE_ENHANCEMENT   = 0x00000005,
    D3D12_VIDEO_PROCESS_FILTER_ANAMORPHIC_SCALING = 0x00000006,
    D3D12_VIDEO_PROCESS_FILTER_STEREO_ADJUSTMENT  = 0x00000007,
}

alias D3D12_VIDEO_PROCESS_FILTER_FLAGS = uint;
enum : uint
{
    D3D12_VIDEO_PROCESS_FILTER_FLAG_NONE               = 0x00000000,
    D3D12_VIDEO_PROCESS_FILTER_FLAG_BRIGHTNESS         = 0x00000001,
    D3D12_VIDEO_PROCESS_FILTER_FLAG_CONTRAST           = 0x00000002,
    D3D12_VIDEO_PROCESS_FILTER_FLAG_HUE                = 0x00000004,
    D3D12_VIDEO_PROCESS_FILTER_FLAG_SATURATION         = 0x00000008,
    D3D12_VIDEO_PROCESS_FILTER_FLAG_NOISE_REDUCTION    = 0x00000010,
    D3D12_VIDEO_PROCESS_FILTER_FLAG_EDGE_ENHANCEMENT   = 0x00000020,
    D3D12_VIDEO_PROCESS_FILTER_FLAG_ANAMORPHIC_SCALING = 0x00000040,
    D3D12_VIDEO_PROCESS_FILTER_FLAG_STEREO_ADJUSTMENT  = 0x00000080,
}

alias D3D12_VIDEO_PROCESS_DEINTERLACE_FLAGS = uint;
enum : uint
{
    D3D12_VIDEO_PROCESS_DEINTERLACE_FLAG_NONE   = 0x00000000,
    D3D12_VIDEO_PROCESS_DEINTERLACE_FLAG_BOB    = 0x00000001,
    D3D12_VIDEO_PROCESS_DEINTERLACE_FLAG_CUSTOM = 0x80000000,
}

struct D3D12_VIDEO_PROCESS_ALPHA_BLENDING
{
    BOOL Enable;
    float Alpha;
}
struct D3D12_VIDEO_PROCESS_LUMA_KEY
{
    BOOL Enable;
    float Lower;
    float Upper;
}
struct D3D12_VIDEO_PROCESS_INPUT_STREAM_DESC
{
    DXGI_FORMAT Format;
    DXGI_COLOR_SPACE_TYPE ColorSpace;
    DXGI_RATIONAL SourceAspectRatio;
    DXGI_RATIONAL DestinationAspectRatio;
    DXGI_RATIONAL FrameRate;
    D3D12_VIDEO_SIZE_RANGE SourceSizeRange;
    D3D12_VIDEO_SIZE_RANGE DestinationSizeRange;
    BOOL EnableOrientation;
    D3D12_VIDEO_PROCESS_FILTER_FLAGS FilterFlags;
    D3D12_VIDEO_FRAME_STEREO_FORMAT StereoFormat;
    D3D12_VIDEO_FIELD_TYPE FieldType;
    D3D12_VIDEO_PROCESS_DEINTERLACE_FLAGS DeinterlaceMode;
    BOOL EnableAlphaBlending;
    D3D12_VIDEO_PROCESS_LUMA_KEY LumaKey;
    uint NumPastFrames;
    uint NumFutureFrames;
    BOOL EnableAutoProcessing;
}
alias D3D12_VIDEO_PROCESS_ALPHA_FILL_MODE = int;
enum : int
{
    D3D12_VIDEO_PROCESS_ALPHA_FILL_MODE_OPAQUE        = 0x00000000,
    D3D12_VIDEO_PROCESS_ALPHA_FILL_MODE_BACKGROUND    = 0x00000001,
    D3D12_VIDEO_PROCESS_ALPHA_FILL_MODE_DESTINATION   = 0x00000002,
    D3D12_VIDEO_PROCESS_ALPHA_FILL_MODE_SOURCE_STREAM = 0x00000003,
}

struct D3D12_VIDEO_PROCESS_OUTPUT_STREAM_DESC
{
    DXGI_FORMAT Format;
    DXGI_COLOR_SPACE_TYPE ColorSpace;
    D3D12_VIDEO_PROCESS_ALPHA_FILL_MODE AlphaFillMode;
    uint AlphaFillModeSourceStreamIndex;
    float[4] BackgroundColor;
    DXGI_RATIONAL FrameRate;
    BOOL EnableStereo;
}
enum IID_ID3D12VideoDecoderHeap = GUID(0x946b7c9, 0xebf6, 0x4047, [0xbb, 0x73, 0x86, 0x83, 0xe2, 0x7d, 0xbb, 0x1f]);
interface ID3D12VideoDecoderHeap : ID3D12Pageable
{
    D3D12_VIDEO_DECODER_HEAP_DESC GetDesc();
}
enum IID_ID3D12VideoDevice = GUID(0x1f052807, 0xb46, 0x4acc, [0x8a, 0x89, 0x36, 0x4f, 0x79, 0x37, 0x18, 0xa4]);
interface ID3D12VideoDevice : IUnknown
{
    HRESULT CheckFeatureSupport(D3D12_FEATURE_VIDEO, void*, uint);
    HRESULT CreateVideoDecoder(const(D3D12_VIDEO_DECODER_DESC)*, const(GUID)*, void**);
    HRESULT CreateVideoDecoderHeap(const(D3D12_VIDEO_DECODER_HEAP_DESC)*, const(GUID)*, void**);
    HRESULT CreateVideoProcessor(uint, const(D3D12_VIDEO_PROCESS_OUTPUT_STREAM_DESC)*, uint, const(D3D12_VIDEO_PROCESS_INPUT_STREAM_DESC)*, const(GUID)*, void**);
}
enum IID_ID3D12VideoDecoder = GUID(0xc59b6bdc, 0x7720, 0x4074, [0xa1, 0x36, 0x17, 0xa1, 0x56, 0x3, 0x74, 0x70]);
interface ID3D12VideoDecoder : ID3D12Pageable
{
    D3D12_VIDEO_DECODER_DESC GetDesc();
}
alias D3D12_VIDEO_DECODE_TIER = int;
enum : int
{
    D3D12_VIDEO_DECODE_TIER_NOT_SUPPORTED = 0x00000000,
    D3D12_VIDEO_DECODE_TIER_1             = 0x00000001,
    D3D12_VIDEO_DECODE_TIER_2             = 0x00000002,
    D3D12_VIDEO_DECODE_TIER_3             = 0x00000003,
}

alias D3D12_VIDEO_DECODE_SUPPORT_FLAGS = uint;
enum : uint
{
    D3D12_VIDEO_DECODE_SUPPORT_FLAG_NONE      = 0x00000000,
    D3D12_VIDEO_DECODE_SUPPORT_FLAG_SUPPORTED = 0x00000001,
}

alias D3D12_VIDEO_DECODE_CONFIGURATION_FLAGS = uint;
enum : uint
{
    D3D12_VIDEO_DECODE_CONFIGURATION_FLAG_NONE                                     = 0x00000000,
    D3D12_VIDEO_DECODE_CONFIGURATION_FLAG_HEIGHT_ALIGNMENT_MULTIPLE_32_REQUIRED    = 0x00000001,
    D3D12_VIDEO_DECODE_CONFIGURATION_FLAG_POST_PROCESSING_SUPPORTED                = 0x00000002,
    D3D12_VIDEO_DECODE_CONFIGURATION_FLAG_REFERENCE_ONLY_ALLOCATIONS_REQUIRED      = 0x00000004,
    D3D12_VIDEO_DECODE_CONFIGURATION_FLAG_ALLOW_RESOLUTION_CHANGE_ON_NON_KEY_FRAME = 0x00000008,
}

alias D3D12_VIDEO_DECODE_STATUS = int;
enum : int
{
    D3D12_VIDEO_DECODE_STATUS_OK                    = 0x00000000,
    D3D12_VIDEO_DECODE_STATUS_CONTINUE              = 0x00000001,
    D3D12_VIDEO_DECODE_STATUS_CONTINUE_SKIP_DISPLAY = 0x00000002,
    D3D12_VIDEO_DECODE_STATUS_RESTART               = 0x00000003,
    D3D12_VIDEO_DECODE_STATUS_RATE_EXCEEDED         = 0x00000004,
}

alias D3D12_VIDEO_DECODE_ARGUMENT_TYPE = int;
enum : int
{
    D3D12_VIDEO_DECODE_ARGUMENT_TYPE_PICTURE_PARAMETERS          = 0x00000000,
    D3D12_VIDEO_DECODE_ARGUMENT_TYPE_INVERSE_QUANTIZATION_MATRIX = 0x00000001,
    D3D12_VIDEO_DECODE_ARGUMENT_TYPE_SLICE_CONTROL               = 0x00000002,
    D3D12_VIDEO_DECODE_ARGUMENT_TYPE_MAX_VALID                   = 0x00000003,
}

struct D3D12_FEATURE_DATA_VIDEO_DECODE_SUPPORT
{
    uint NodeIndex;
    D3D12_VIDEO_DECODE_CONFIGURATION Configuration;
    uint Width;
    uint Height;
    DXGI_FORMAT DecodeFormat;
    DXGI_RATIONAL FrameRate;
    uint BitRate;
    D3D12_VIDEO_DECODE_SUPPORT_FLAGS SupportFlags;
    D3D12_VIDEO_DECODE_CONFIGURATION_FLAGS ConfigurationFlags;
    D3D12_VIDEO_DECODE_TIER DecodeTier;
}
struct D3D12_FEATURE_DATA_VIDEO_DECODE_PROFILE_COUNT
{
    uint NodeIndex;
    uint ProfileCount;
}
struct D3D12_FEATURE_DATA_VIDEO_DECODE_PROFILES
{
    uint NodeIndex;
    uint ProfileCount;
    GUID* pProfiles;
}
struct D3D12_FEATURE_DATA_VIDEO_DECODE_FORMAT_COUNT
{
    uint NodeIndex;
    D3D12_VIDEO_DECODE_CONFIGURATION Configuration;
    uint FormatCount;
}
struct D3D12_FEATURE_DATA_VIDEO_DECODE_FORMATS
{
    uint NodeIndex;
    D3D12_VIDEO_DECODE_CONFIGURATION Configuration;
    uint FormatCount;
    DXGI_FORMAT* pOutputFormats;
}
struct D3D12_FEATURE_DATA_VIDEO_ARCHITECTURE
{
    BOOL IOCoherent;
}
alias D3D12_VIDEO_DECODE_HISTOGRAM_COMPONENT = int;
enum : int
{
    D3D12_VIDEO_DECODE_HISTOGRAM_COMPONENT_Y = 0x00000000,
    D3D12_VIDEO_DECODE_HISTOGRAM_COMPONENT_U = 0x00000001,
    D3D12_VIDEO_DECODE_HISTOGRAM_COMPONENT_V = 0x00000002,
    D3D12_VIDEO_DECODE_HISTOGRAM_COMPONENT_R = 0x00000000,
    D3D12_VIDEO_DECODE_HISTOGRAM_COMPONENT_G = 0x00000001,
    D3D12_VIDEO_DECODE_HISTOGRAM_COMPONENT_B = 0x00000002,
    D3D12_VIDEO_DECODE_HISTOGRAM_COMPONENT_A = 0x00000003,
}

alias D3D12_VIDEO_DECODE_HISTOGRAM_COMPONENT_FLAGS = uint;
enum : uint
{
    D3D12_VIDEO_DECODE_HISTOGRAM_COMPONENT_FLAG_NONE = 0x00000000,
    D3D12_VIDEO_DECODE_HISTOGRAM_COMPONENT_FLAG_Y    = 0x00000001,
    D3D12_VIDEO_DECODE_HISTOGRAM_COMPONENT_FLAG_U    = 0x00000002,
    D3D12_VIDEO_DECODE_HISTOGRAM_COMPONENT_FLAG_V    = 0x00000004,
    D3D12_VIDEO_DECODE_HISTOGRAM_COMPONENT_FLAG_R    = 0x00000001,
    D3D12_VIDEO_DECODE_HISTOGRAM_COMPONENT_FLAG_G    = 0x00000002,
    D3D12_VIDEO_DECODE_HISTOGRAM_COMPONENT_FLAG_B    = 0x00000004,
    D3D12_VIDEO_DECODE_HISTOGRAM_COMPONENT_FLAG_A    = 0x00000008,
}

struct D3D12_FEATURE_DATA_VIDEO_DECODE_HISTOGRAM
{
    uint NodeIndex;
    GUID DecodeProfile;
    uint Width;
    uint Height;
    DXGI_FORMAT DecodeFormat;
    D3D12_VIDEO_DECODE_HISTOGRAM_COMPONENT_FLAGS Components;
    uint BinCount;
    uint CounterBitDepth;
}
alias D3D12_VIDEO_DECODE_CONVERSION_SUPPORT_FLAGS = uint;
enum : uint
{
    D3D12_VIDEO_DECODE_CONVERSION_SUPPORT_FLAG_NONE      = 0x00000000,
    D3D12_VIDEO_DECODE_CONVERSION_SUPPORT_FLAG_SUPPORTED = 0x00000001,
}

alias D3D12_VIDEO_SCALE_SUPPORT_FLAGS = uint;
enum : uint
{
    D3D12_VIDEO_SCALE_SUPPORT_FLAG_NONE                 = 0x00000000,
    D3D12_VIDEO_SCALE_SUPPORT_FLAG_POW2_ONLY            = 0x00000001,
    D3D12_VIDEO_SCALE_SUPPORT_FLAG_EVEN_DIMENSIONS_ONLY = 0x00000002,
}

struct D3D12_VIDEO_SCALE_SUPPORT
{
    D3D12_VIDEO_SIZE_RANGE OutputSizeRange;
    D3D12_VIDEO_SCALE_SUPPORT_FLAGS Flags;
}
struct D3D12_FEATURE_DATA_VIDEO_DECODE_CONVERSION_SUPPORT
{
    uint NodeIndex;
    D3D12_VIDEO_DECODE_CONFIGURATION Configuration;
    D3D12_VIDEO_SAMPLE DecodeSample;
    D3D12_VIDEO_FORMAT OutputFormat;
    DXGI_RATIONAL FrameRate;
    uint BitRate;
    D3D12_VIDEO_DECODE_CONVERSION_SUPPORT_FLAGS SupportFlags;
    D3D12_VIDEO_SCALE_SUPPORT ScaleSupport;
}
struct D3D12_FEATURE_DATA_VIDEO_DECODER_HEAP_SIZE
{
    D3D12_VIDEO_DECODER_HEAP_DESC VideoDecoderHeapDesc;
    ulong MemoryPoolL0Size;
    ulong MemoryPoolL1Size;
}
struct D3D12_FEATURE_DATA_VIDEO_PROCESSOR_SIZE
{
    uint NodeMask;
    const(D3D12_VIDEO_PROCESS_OUTPUT_STREAM_DESC)* pOutputStreamDesc;
    uint NumInputStreamDescs;
    const(D3D12_VIDEO_PROCESS_INPUT_STREAM_DESC)* pInputStreamDescs;
    ulong MemoryPoolL0Size;
    ulong MemoryPoolL1Size;
}
struct D3D12_QUERY_DATA_VIDEO_DECODE_STATISTICS
{
    ulong Status;
    ulong NumMacroblocksAffected;
    DXGI_RATIONAL FrameRate;
    uint BitRate;
}
struct D3D12_VIDEO_DECODE_FRAME_ARGUMENT
{
    D3D12_VIDEO_DECODE_ARGUMENT_TYPE Type;
    uint Size;
    void* pData;
}
struct D3D12_VIDEO_DECODE_REFERENCE_FRAMES
{
    uint NumTexture2Ds;
    ID3D12Resource* ppTexture2Ds;
    uint* pSubresources;
    ID3D12VideoDecoderHeap* ppHeaps;
}
struct D3D12_VIDEO_DECODE_COMPRESSED_BITSTREAM
{
    ID3D12Resource pBuffer;
    ulong Offset;
    ulong Size;
}
struct D3D12_VIDEO_DECODE_CONVERSION_ARGUMENTS
{
    BOOL Enable;
    ID3D12Resource pReferenceTexture2D;
    uint ReferenceSubresource;
    DXGI_COLOR_SPACE_TYPE OutputColorSpace;
    DXGI_COLOR_SPACE_TYPE DecodeColorSpace;
}
struct D3D12_VIDEO_DECODE_INPUT_STREAM_ARGUMENTS
{
    uint NumFrameArguments;
    D3D12_VIDEO_DECODE_FRAME_ARGUMENT[10] FrameArguments;
    D3D12_VIDEO_DECODE_REFERENCE_FRAMES ReferenceFrames;
    D3D12_VIDEO_DECODE_COMPRESSED_BITSTREAM CompressedBitstream;
    ID3D12VideoDecoderHeap pHeap;
}
struct D3D12_VIDEO_DECODE_OUTPUT_STREAM_ARGUMENTS
{
    ID3D12Resource pOutputTexture2D;
    uint OutputSubresource;
    D3D12_VIDEO_DECODE_CONVERSION_ARGUMENTS ConversionArguments;
}
enum IID_ID3D12VideoProcessor = GUID(0x304fdb32, 0xbede, 0x410a, [0x85, 0x45, 0x94, 0x3a, 0xc6, 0xa4, 0x61, 0x38]);
interface ID3D12VideoProcessor : ID3D12Pageable
{
    uint GetNodeMask();
    uint GetNumInputStreamDescs();
    HRESULT GetInputStreamDescs(uint, D3D12_VIDEO_PROCESS_INPUT_STREAM_DESC*);
    D3D12_VIDEO_PROCESS_OUTPUT_STREAM_DESC GetOutputStreamDesc();
}
alias D3D12_VIDEO_PROCESS_FEATURE_FLAGS = uint;
enum : uint
{
    D3D12_VIDEO_PROCESS_FEATURE_FLAG_NONE               = 0x00000000,
    D3D12_VIDEO_PROCESS_FEATURE_FLAG_ALPHA_FILL         = 0x00000001,
    D3D12_VIDEO_PROCESS_FEATURE_FLAG_LUMA_KEY           = 0x00000002,
    D3D12_VIDEO_PROCESS_FEATURE_FLAG_STEREO             = 0x00000004,
    D3D12_VIDEO_PROCESS_FEATURE_FLAG_ROTATION           = 0x00000008,
    D3D12_VIDEO_PROCESS_FEATURE_FLAG_FLIP               = 0x00000010,
    D3D12_VIDEO_PROCESS_FEATURE_FLAG_ALPHA_BLENDING     = 0x00000020,
    D3D12_VIDEO_PROCESS_FEATURE_FLAG_PIXEL_ASPECT_RATIO = 0x00000040,
}

alias D3D12_VIDEO_PROCESS_AUTO_PROCESSING_FLAGS = uint;
enum : uint
{
    D3D12_VIDEO_PROCESS_AUTO_PROCESSING_FLAG_NONE                = 0x00000000,
    D3D12_VIDEO_PROCESS_AUTO_PROCESSING_FLAG_DENOISE             = 0x00000001,
    D3D12_VIDEO_PROCESS_AUTO_PROCESSING_FLAG_DERINGING           = 0x00000002,
    D3D12_VIDEO_PROCESS_AUTO_PROCESSING_FLAG_EDGE_ENHANCEMENT    = 0x00000004,
    D3D12_VIDEO_PROCESS_AUTO_PROCESSING_FLAG_COLOR_CORRECTION    = 0x00000008,
    D3D12_VIDEO_PROCESS_AUTO_PROCESSING_FLAG_FLESH_TONE_MAPPING  = 0x00000010,
    D3D12_VIDEO_PROCESS_AUTO_PROCESSING_FLAG_IMAGE_STABILIZATION = 0x00000020,
    D3D12_VIDEO_PROCESS_AUTO_PROCESSING_FLAG_SUPER_RESOLUTION    = 0x00000040,
    D3D12_VIDEO_PROCESS_AUTO_PROCESSING_FLAG_ANAMORPHIC_SCALING  = 0x00000080,
    D3D12_VIDEO_PROCESS_AUTO_PROCESSING_FLAG_CUSTOM              = 0x80000000,
}

alias D3D12_VIDEO_PROCESS_ORIENTATION = int;
enum : int
{
    D3D12_VIDEO_PROCESS_ORIENTATION_DEFAULT                       = 0x00000000,
    D3D12_VIDEO_PROCESS_ORIENTATION_FLIP_HORIZONTAL               = 0x00000001,
    D3D12_VIDEO_PROCESS_ORIENTATION_CLOCKWISE_90                  = 0x00000002,
    D3D12_VIDEO_PROCESS_ORIENTATION_CLOCKWISE_90_FLIP_HORIZONTAL  = 0x00000003,
    D3D12_VIDEO_PROCESS_ORIENTATION_CLOCKWISE_180                 = 0x00000004,
    D3D12_VIDEO_PROCESS_ORIENTATION_FLIP_VERTICAL                 = 0x00000005,
    D3D12_VIDEO_PROCESS_ORIENTATION_CLOCKWISE_270                 = 0x00000006,
    D3D12_VIDEO_PROCESS_ORIENTATION_CLOCKWISE_270_FLIP_HORIZONTAL = 0x00000007,
}

alias D3D12_VIDEO_PROCESS_INPUT_STREAM_FLAGS = uint;
enum : uint
{
    D3D12_VIDEO_PROCESS_INPUT_STREAM_FLAG_NONE                = 0x00000000,
    D3D12_VIDEO_PROCESS_INPUT_STREAM_FLAG_FRAME_DISCONTINUITY = 0x00000001,
    D3D12_VIDEO_PROCESS_INPUT_STREAM_FLAG_FRAME_REPEAT        = 0x00000002,
}

struct D3D12_VIDEO_PROCESS_FILTER_RANGE
{
    int Minimum;
    int Maximum;
    int Default;
    float Multiplier;
}
alias D3D12_VIDEO_PROCESS_SUPPORT_FLAGS = uint;
enum : uint
{
    D3D12_VIDEO_PROCESS_SUPPORT_FLAG_NONE      = 0x00000000,
    D3D12_VIDEO_PROCESS_SUPPORT_FLAG_SUPPORTED = 0x00000001,
}

struct D3D12_FEATURE_DATA_VIDEO_PROCESS_SUPPORT
{
    uint NodeIndex;
    D3D12_VIDEO_SAMPLE InputSample;
    D3D12_VIDEO_FIELD_TYPE InputFieldType;
    D3D12_VIDEO_FRAME_STEREO_FORMAT InputStereoFormat;
    DXGI_RATIONAL InputFrameRate;
    D3D12_VIDEO_FORMAT OutputFormat;
    D3D12_VIDEO_FRAME_STEREO_FORMAT OutputStereoFormat;
    DXGI_RATIONAL OutputFrameRate;
    D3D12_VIDEO_PROCESS_SUPPORT_FLAGS SupportFlags;
    D3D12_VIDEO_SCALE_SUPPORT ScaleSupport;
    D3D12_VIDEO_PROCESS_FEATURE_FLAGS FeatureSupport;
    D3D12_VIDEO_PROCESS_DEINTERLACE_FLAGS DeinterlaceSupport;
    D3D12_VIDEO_PROCESS_AUTO_PROCESSING_FLAGS AutoProcessingSupport;
    D3D12_VIDEO_PROCESS_FILTER_FLAGS FilterSupport;
    D3D12_VIDEO_PROCESS_FILTER_RANGE[32] FilterRangeSupport;
}
struct D3D12_FEATURE_DATA_VIDEO_PROCESS_MAX_INPUT_STREAMS
{
    uint NodeIndex;
    uint MaxInputStreams;
}
struct D3D12_FEATURE_DATA_VIDEO_PROCESS_REFERENCE_INFO
{
    uint NodeIndex;
    D3D12_VIDEO_PROCESS_DEINTERLACE_FLAGS DeinterlaceMode;
    D3D12_VIDEO_PROCESS_FILTER_FLAGS Filters;
    D3D12_VIDEO_PROCESS_FEATURE_FLAGS FeatureSupport;
    DXGI_RATIONAL InputFrameRate;
    DXGI_RATIONAL OutputFrameRate;
    BOOL EnableAutoProcessing;
    uint PastFrames;
    uint FutureFrames;
}
struct D3D12_VIDEO_PROCESS_REFERENCE_SET
{
    uint NumPastFrames;
    ID3D12Resource* ppPastFrames;
    uint* pPastSubresources;
    uint NumFutureFrames;
    ID3D12Resource* ppFutureFrames;
    uint* pFutureSubresources;
}
struct D3D12_VIDEO_PROCESS_TRANSFORM
{
    RECT SourceRectangle;
    RECT DestinationRectangle;
    D3D12_VIDEO_PROCESS_ORIENTATION Orientation;
}
struct D3D12_VIDEO_PROCESS_INPUT_STREAM_RATE
{
    uint OutputIndex;
    uint InputFrameOrField;
}
struct D3D12_VIDEO_PROCESS_INPUT_STREAM
{
    ID3D12Resource pTexture2D;
    uint Subresource;
    D3D12_VIDEO_PROCESS_REFERENCE_SET ReferenceSet;
}
struct D3D12_VIDEO_PROCESS_INPUT_STREAM_ARGUMENTS
{
    D3D12_VIDEO_PROCESS_INPUT_STREAM[2] InputStream;
    D3D12_VIDEO_PROCESS_TRANSFORM Transform;
    D3D12_VIDEO_PROCESS_INPUT_STREAM_FLAGS Flags;
    D3D12_VIDEO_PROCESS_INPUT_STREAM_RATE RateInfo;
    int[32] FilterLevels;
    D3D12_VIDEO_PROCESS_ALPHA_BLENDING AlphaBlending;
}
struct D3D12_VIDEO_PROCESS_OUTPUT_STREAM
{
    ID3D12Resource pTexture2D;
    uint Subresource;
}
struct D3D12_VIDEO_PROCESS_OUTPUT_STREAM_ARGUMENTS
{
    D3D12_VIDEO_PROCESS_OUTPUT_STREAM[2] OutputStream;
    RECT TargetRectangle;
}
enum IID_ID3D12VideoDecodeCommandList = GUID(0x3b60536e, 0xad29, 0x4e64, [0xa2, 0x69, 0xf8, 0x53, 0x83, 0x7e, 0x5e, 0x53]);
interface ID3D12VideoDecodeCommandList : ID3D12CommandList
{
    HRESULT Close();
    HRESULT Reset(ID3D12CommandAllocator);
    void ClearState();
    void ResourceBarrier(uint, const(D3D12_RESOURCE_BARRIER)*);
    void DiscardResource(ID3D12Resource, const(D3D12_DISCARD_REGION)*);
    void BeginQuery(ID3D12QueryHeap, D3D12_QUERY_TYPE, uint);
    void EndQuery(ID3D12QueryHeap, D3D12_QUERY_TYPE, uint);
    void ResolveQueryData(ID3D12QueryHeap, D3D12_QUERY_TYPE, uint, uint, ID3D12Resource, ulong);
    void SetPredication(ID3D12Resource, ulong, D3D12_PREDICATION_OP);
    void SetMarker(uint, const(void)*, uint);
    void BeginEvent(uint, const(void)*, uint);
    void EndEvent();
    void DecodeFrame(ID3D12VideoDecoder, const(D3D12_VIDEO_DECODE_OUTPUT_STREAM_ARGUMENTS)*, const(D3D12_VIDEO_DECODE_INPUT_STREAM_ARGUMENTS)*);
    void WriteBufferImmediate(uint, const(D3D12_WRITEBUFFERIMMEDIATE_PARAMETER)*, const(D3D12_WRITEBUFFERIMMEDIATE_MODE)*);
}
enum IID_ID3D12VideoProcessCommandList = GUID(0xaeb2543a, 0x167f, 0x4682, [0xac, 0xc8, 0xd1, 0x59, 0xed, 0x4a, 0x62, 0x9]);
interface ID3D12VideoProcessCommandList : ID3D12CommandList
{
    HRESULT Close();
    HRESULT Reset(ID3D12CommandAllocator);
    void ClearState();
    void ResourceBarrier(uint, const(D3D12_RESOURCE_BARRIER)*);
    void DiscardResource(ID3D12Resource, const(D3D12_DISCARD_REGION)*);
    void BeginQuery(ID3D12QueryHeap, D3D12_QUERY_TYPE, uint);
    void EndQuery(ID3D12QueryHeap, D3D12_QUERY_TYPE, uint);
    void ResolveQueryData(ID3D12QueryHeap, D3D12_QUERY_TYPE, uint, uint, ID3D12Resource, ulong);
    void SetPredication(ID3D12Resource, ulong, D3D12_PREDICATION_OP);
    void SetMarker(uint, const(void)*, uint);
    void BeginEvent(uint, const(void)*, uint);
    void EndEvent();
    void ProcessFrames(ID3D12VideoProcessor, const(D3D12_VIDEO_PROCESS_OUTPUT_STREAM_ARGUMENTS)*, uint, const(D3D12_VIDEO_PROCESS_INPUT_STREAM_ARGUMENTS)*);
    void WriteBufferImmediate(uint, const(D3D12_WRITEBUFFERIMMEDIATE_PARAMETER)*, const(D3D12_WRITEBUFFERIMMEDIATE_MODE)*);
}
struct D3D12_VIDEO_DECODE_OUTPUT_HISTOGRAM
{
    ulong Offset;
    ID3D12Resource pBuffer;
}
struct D3D12_VIDEO_DECODE_CONVERSION_ARGUMENTS1
{
    BOOL Enable;
    ID3D12Resource pReferenceTexture2D;
    uint ReferenceSubresource;
    DXGI_COLOR_SPACE_TYPE OutputColorSpace;
    DXGI_COLOR_SPACE_TYPE DecodeColorSpace;
    uint OutputWidth;
    uint OutputHeight;
}
struct D3D12_VIDEO_DECODE_OUTPUT_STREAM_ARGUMENTS1
{
    ID3D12Resource pOutputTexture2D;
    uint OutputSubresource;
    D3D12_VIDEO_DECODE_CONVERSION_ARGUMENTS1 ConversionArguments;
    D3D12_VIDEO_DECODE_OUTPUT_HISTOGRAM[4] Histograms;
}
enum IID_ID3D12VideoDecodeCommandList1 = GUID(0xd52f011b, 0xb56e, 0x453c, [0xa0, 0x5a, 0xa7, 0xf3, 0x11, 0xc8, 0xf4, 0x72]);
interface ID3D12VideoDecodeCommandList1 : ID3D12VideoDecodeCommandList
{
    void DecodeFrame1(ID3D12VideoDecoder, const(D3D12_VIDEO_DECODE_OUTPUT_STREAM_ARGUMENTS1)*, const(D3D12_VIDEO_DECODE_INPUT_STREAM_ARGUMENTS)*);
}
struct D3D12_VIDEO_PROCESS_INPUT_STREAM_ARGUMENTS1
{
    D3D12_VIDEO_PROCESS_INPUT_STREAM[2] InputStream;
    D3D12_VIDEO_PROCESS_TRANSFORM Transform;
    D3D12_VIDEO_PROCESS_INPUT_STREAM_FLAGS Flags;
    D3D12_VIDEO_PROCESS_INPUT_STREAM_RATE RateInfo;
    int[32] FilterLevels;
    D3D12_VIDEO_PROCESS_ALPHA_BLENDING AlphaBlending;
    D3D12_VIDEO_FIELD_TYPE FieldType;
}
enum IID_ID3D12VideoProcessCommandList1 = GUID(0x542c5c4d, 0x7596, 0x434f, [0x8c, 0x93, 0x4e, 0xfa, 0x67, 0x66, 0xf2, 0x67]);
interface ID3D12VideoProcessCommandList1 : ID3D12VideoProcessCommandList
{
    void ProcessFrames1(ID3D12VideoProcessor, const(D3D12_VIDEO_PROCESS_OUTPUT_STREAM_ARGUMENTS)*, uint, const(D3D12_VIDEO_PROCESS_INPUT_STREAM_ARGUMENTS1)*);
}
alias D3D12_VIDEO_MOTION_ESTIMATOR_SEARCH_BLOCK_SIZE = int;
enum : int
{
    D3D12_VIDEO_MOTION_ESTIMATOR_SEARCH_BLOCK_SIZE_8X8   = 0x00000000,
    D3D12_VIDEO_MOTION_ESTIMATOR_SEARCH_BLOCK_SIZE_16X16 = 0x00000001,
}

alias D3D12_VIDEO_MOTION_ESTIMATOR_SEARCH_BLOCK_SIZE_FLAGS = uint;
enum : uint
{
    D3D12_VIDEO_MOTION_ESTIMATOR_SEARCH_BLOCK_SIZE_FLAG_NONE  = 0x00000000,
    D3D12_VIDEO_MOTION_ESTIMATOR_SEARCH_BLOCK_SIZE_FLAG_8X8   = 0x00000001,
    D3D12_VIDEO_MOTION_ESTIMATOR_SEARCH_BLOCK_SIZE_FLAG_16X16 = 0x00000002,
}

alias D3D12_VIDEO_MOTION_ESTIMATOR_VECTOR_PRECISION = int;
enum : int
{
    D3D12_VIDEO_MOTION_ESTIMATOR_VECTOR_PRECISION_QUARTER_PEL = 0x00000000,
}

alias D3D12_VIDEO_MOTION_ESTIMATOR_VECTOR_PRECISION_FLAGS = uint;
enum : uint
{
    D3D12_VIDEO_MOTION_ESTIMATOR_VECTOR_PRECISION_FLAG_NONE        = 0x00000000,
    D3D12_VIDEO_MOTION_ESTIMATOR_VECTOR_PRECISION_FLAG_QUARTER_PEL = 0x00000001,
}

struct D3D12_FEATURE_DATA_VIDEO_FEATURE_AREA_SUPPORT
{
    uint NodeIndex;
    BOOL VideoDecodeSupport;
    BOOL VideoProcessSupport;
    BOOL VideoEncodeSupport;
}
struct D3D12_FEATURE_DATA_VIDEO_MOTION_ESTIMATOR
{
    uint NodeIndex;
    DXGI_FORMAT InputFormat;
    D3D12_VIDEO_MOTION_ESTIMATOR_SEARCH_BLOCK_SIZE_FLAGS BlockSizeFlags;
    D3D12_VIDEO_MOTION_ESTIMATOR_VECTOR_PRECISION_FLAGS PrecisionFlags;
    D3D12_VIDEO_SIZE_RANGE SizeRange;
}
struct D3D12_FEATURE_DATA_VIDEO_MOTION_ESTIMATOR_SIZE
{
    uint NodeIndex;
    DXGI_FORMAT InputFormat;
    D3D12_VIDEO_MOTION_ESTIMATOR_SEARCH_BLOCK_SIZE BlockSize;
    D3D12_VIDEO_MOTION_ESTIMATOR_VECTOR_PRECISION Precision;
    D3D12_VIDEO_SIZE_RANGE SizeRange;
    BOOL Protected;
    ulong MotionVectorHeapMemoryPoolL0Size;
    ulong MotionVectorHeapMemoryPoolL1Size;
    ulong MotionEstimatorMemoryPoolL0Size;
    ulong MotionEstimatorMemoryPoolL1Size;
}
struct D3D12_VIDEO_MOTION_ESTIMATOR_DESC
{
    uint NodeMask;
    DXGI_FORMAT InputFormat;
    D3D12_VIDEO_MOTION_ESTIMATOR_SEARCH_BLOCK_SIZE BlockSize;
    D3D12_VIDEO_MOTION_ESTIMATOR_VECTOR_PRECISION Precision;
    D3D12_VIDEO_SIZE_RANGE SizeRange;
}
enum IID_ID3D12VideoMotionEstimator = GUID(0x33fdae0e, 0x98b, 0x428f, [0x87, 0xbb, 0x34, 0xb6, 0x95, 0xde, 0x8, 0xf8]);
interface ID3D12VideoMotionEstimator : ID3D12Pageable
{
    D3D12_VIDEO_MOTION_ESTIMATOR_DESC GetDesc();
    HRESULT GetProtectedResourceSession(const(GUID)*, void**);
}
struct D3D12_VIDEO_MOTION_VECTOR_HEAP_DESC
{
    uint NodeMask;
    DXGI_FORMAT InputFormat;
    D3D12_VIDEO_MOTION_ESTIMATOR_SEARCH_BLOCK_SIZE BlockSize;
    D3D12_VIDEO_MOTION_ESTIMATOR_VECTOR_PRECISION Precision;
    D3D12_VIDEO_SIZE_RANGE SizeRange;
}
enum IID_ID3D12VideoMotionVectorHeap = GUID(0x5be17987, 0x743a, 0x4061, [0x83, 0x4b, 0x23, 0xd2, 0x2d, 0xae, 0xa5, 0x5]);
interface ID3D12VideoMotionVectorHeap : ID3D12Pageable
{
    D3D12_VIDEO_MOTION_VECTOR_HEAP_DESC GetDesc();
    HRESULT GetProtectedResourceSession(const(GUID)*, void**);
}
enum IID_ID3D12VideoDevice1 = GUID(0x981611ad, 0xa144, 0x4c83, [0x98, 0x90, 0xf3, 0xe, 0x26, 0xd6, 0x58, 0xab]);
interface ID3D12VideoDevice1 : ID3D12VideoDevice
{
    HRESULT CreateVideoMotionEstimator(const(D3D12_VIDEO_MOTION_ESTIMATOR_DESC)*, ID3D12ProtectedResourceSession, const(GUID)*, void**);
    HRESULT CreateVideoMotionVectorHeap(const(D3D12_VIDEO_MOTION_VECTOR_HEAP_DESC)*, ID3D12ProtectedResourceSession, const(GUID)*, void**);
}
struct D3D12_RESOURCE_COORDINATE
{
    ulong X;
    uint Y;
    uint Z;
    uint SubresourceIndex;
}
struct D3D12_VIDEO_MOTION_ESTIMATOR_OUTPUT
{
    ID3D12VideoMotionVectorHeap pMotionVectorHeap;
}
struct D3D12_VIDEO_MOTION_ESTIMATOR_INPUT
{
    ID3D12Resource pInputTexture2D;
    uint InputSubresourceIndex;
    ID3D12Resource pReferenceTexture2D;
    uint ReferenceSubresourceIndex;
    ID3D12VideoMotionVectorHeap pHintMotionVectorHeap;
}
struct D3D12_RESOLVE_VIDEO_MOTION_VECTOR_HEAP_OUTPUT
{
    ID3D12Resource pMotionVectorTexture2D;
    D3D12_RESOURCE_COORDINATE MotionVectorCoordinate;
}
struct D3D12_RESOLVE_VIDEO_MOTION_VECTOR_HEAP_INPUT
{
    ID3D12VideoMotionVectorHeap pMotionVectorHeap;
    uint PixelWidth;
    uint PixelHeight;
}
enum IID_ID3D12VideoEncodeCommandList = GUID(0x8455293a, 0xcbd, 0x4831, [0x9b, 0x39, 0xfb, 0xdb, 0xab, 0x72, 0x47, 0x23]);
interface ID3D12VideoEncodeCommandList : ID3D12CommandList
{
    HRESULT Close();
    HRESULT Reset(ID3D12CommandAllocator);
    void ClearState();
    void ResourceBarrier(uint, const(D3D12_RESOURCE_BARRIER)*);
    void DiscardResource(ID3D12Resource, const(D3D12_DISCARD_REGION)*);
    void BeginQuery(ID3D12QueryHeap, D3D12_QUERY_TYPE, uint);
    void EndQuery(ID3D12QueryHeap, D3D12_QUERY_TYPE, uint);
    void ResolveQueryData(ID3D12QueryHeap, D3D12_QUERY_TYPE, uint, uint, ID3D12Resource, ulong);
    void SetPredication(ID3D12Resource, ulong, D3D12_PREDICATION_OP);
    void SetMarker(uint, const(void)*, uint);
    void BeginEvent(uint, const(void)*, uint);
    void EndEvent();
    void EstimateMotion(ID3D12VideoMotionEstimator, const(D3D12_VIDEO_MOTION_ESTIMATOR_OUTPUT)*, const(D3D12_VIDEO_MOTION_ESTIMATOR_INPUT)*);
    void ResolveMotionVectorHeap(const(D3D12_RESOLVE_VIDEO_MOTION_VECTOR_HEAP_OUTPUT)*, const(D3D12_RESOLVE_VIDEO_MOTION_VECTOR_HEAP_INPUT)*);
    void WriteBufferImmediate(uint, const(D3D12_WRITEBUFFERIMMEDIATE_PARAMETER)*, const(D3D12_WRITEBUFFERIMMEDIATE_MODE)*);
    void SetProtectedResourceSession(ID3D12ProtectedResourceSession);
}
alias D3D12_VIDEO_PROTECTED_RESOURCE_SUPPORT_FLAGS = uint;
enum : uint
{
    D3D12_VIDEO_PROTECTED_RESOURCE_SUPPORT_FLAG_NONE      = 0x00000000,
    D3D12_VIDEO_PROTECTED_RESOURCE_SUPPORT_FLAG_SUPPORTED = 0x00000001,
}

struct D3D12_FEATURE_DATA_VIDEO_DECODE_PROTECTED_RESOURCES
{
    uint NodeIndex;
    D3D12_VIDEO_DECODE_CONFIGURATION Configuration;
    D3D12_VIDEO_PROTECTED_RESOURCE_SUPPORT_FLAGS SupportFlags;
}
struct D3D12_FEATURE_DATA_VIDEO_PROCESS_PROTECTED_RESOURCES
{
    uint NodeIndex;
    D3D12_VIDEO_PROTECTED_RESOURCE_SUPPORT_FLAGS SupportFlags;
}
struct D3D12_FEATURE_DATA_VIDEO_MOTION_ESTIMATOR_PROTECTED_RESOURCES
{
    uint NodeIndex;
    D3D12_VIDEO_PROTECTED_RESOURCE_SUPPORT_FLAGS SupportFlags;
}
struct D3D12_FEATURE_DATA_VIDEO_DECODER_HEAP_SIZE1
{
    D3D12_VIDEO_DECODER_HEAP_DESC VideoDecoderHeapDesc;
    BOOL Protected;
    ulong MemoryPoolL0Size;
    ulong MemoryPoolL1Size;
}
struct D3D12_FEATURE_DATA_VIDEO_PROCESSOR_SIZE1
{
    uint NodeMask;
    const(D3D12_VIDEO_PROCESS_OUTPUT_STREAM_DESC)* pOutputStreamDesc;
    uint NumInputStreamDescs;
    const(D3D12_VIDEO_PROCESS_INPUT_STREAM_DESC)* pInputStreamDescs;
    BOOL Protected;
    ulong MemoryPoolL0Size;
    ulong MemoryPoolL1Size;
}
alias D3D12_VIDEO_EXTENSION_COMMAND_PARAMETER_STAGE = int;
enum : int
{
    D3D12_VIDEO_EXTENSION_COMMAND_PARAMETER_STAGE_CREATION              = 0x00000000,
    D3D12_VIDEO_EXTENSION_COMMAND_PARAMETER_STAGE_INITIALIZATION        = 0x00000001,
    D3D12_VIDEO_EXTENSION_COMMAND_PARAMETER_STAGE_EXECUTION             = 0x00000002,
    D3D12_VIDEO_EXTENSION_COMMAND_PARAMETER_STAGE_CAPS_INPUT            = 0x00000003,
    D3D12_VIDEO_EXTENSION_COMMAND_PARAMETER_STAGE_CAPS_OUTPUT           = 0x00000004,
    D3D12_VIDEO_EXTENSION_COMMAND_PARAMETER_STAGE_DEVICE_EXECUTE_INPUT  = 0x00000005,
    D3D12_VIDEO_EXTENSION_COMMAND_PARAMETER_STAGE_DEVICE_EXECUTE_OUTPUT = 0x00000006,
}

alias D3D12_VIDEO_EXTENSION_COMMAND_PARAMETER_TYPE = int;
enum : int
{
    D3D12_VIDEO_EXTENSION_COMMAND_PARAMETER_TYPE_UINT8    = 0x00000000,
    D3D12_VIDEO_EXTENSION_COMMAND_PARAMETER_TYPE_UINT16   = 0x00000001,
    D3D12_VIDEO_EXTENSION_COMMAND_PARAMETER_TYPE_UINT32   = 0x00000002,
    D3D12_VIDEO_EXTENSION_COMMAND_PARAMETER_TYPE_UINT64   = 0x00000003,
    D3D12_VIDEO_EXTENSION_COMMAND_PARAMETER_TYPE_SINT8    = 0x00000004,
    D3D12_VIDEO_EXTENSION_COMMAND_PARAMETER_TYPE_SINT16   = 0x00000005,
    D3D12_VIDEO_EXTENSION_COMMAND_PARAMETER_TYPE_SINT32   = 0x00000006,
    D3D12_VIDEO_EXTENSION_COMMAND_PARAMETER_TYPE_SINT64   = 0x00000007,
    D3D12_VIDEO_EXTENSION_COMMAND_PARAMETER_TYPE_FLOAT    = 0x00000008,
    D3D12_VIDEO_EXTENSION_COMMAND_PARAMETER_TYPE_DOUBLE   = 0x00000009,
    D3D12_VIDEO_EXTENSION_COMMAND_PARAMETER_TYPE_RESOURCE = 0x0000000a,
}

alias D3D12_VIDEO_EXTENSION_COMMAND_PARAMETER_FLAGS = uint;
enum : uint
{
    D3D12_VIDEO_EXTENSION_COMMAND_PARAMETER_FLAG_NONE  = 0x00000000,
    D3D12_VIDEO_EXTENSION_COMMAND_PARAMETER_FLAG_READ  = 0x00000001,
    D3D12_VIDEO_EXTENSION_COMMAND_PARAMETER_FLAG_WRITE = 0x00000002,
}

struct D3D12_FEATURE_DATA_VIDEO_EXTENSION_COMMAND_COUNT
{
    uint NodeIndex;
    uint CommandCount;
}
struct D3D12_VIDEO_EXTENSION_COMMAND_INFO
{
    GUID CommandId;
    const(wchar)* Name;
    D3D12_COMMAND_LIST_SUPPORT_FLAGS CommandListSupportFlags;
}
struct D3D12_FEATURE_DATA_VIDEO_EXTENSION_COMMANDS
{
    uint NodeIndex;
    uint CommandCount;
    D3D12_VIDEO_EXTENSION_COMMAND_INFO* pCommandInfos;
}
struct D3D12_FEATURE_DATA_VIDEO_EXTENSION_COMMAND_PARAMETER_COUNT
{
    GUID CommandId;
    D3D12_VIDEO_EXTENSION_COMMAND_PARAMETER_STAGE Stage;
    uint ParameterCount;
    uint ParameterPacking;
}
struct D3D12_VIDEO_EXTENSION_COMMAND_PARAMETER_INFO
{
    const(wchar)* Name;
    D3D12_VIDEO_EXTENSION_COMMAND_PARAMETER_TYPE Type;
    D3D12_VIDEO_EXTENSION_COMMAND_PARAMETER_FLAGS Flags;
}
struct D3D12_FEATURE_DATA_VIDEO_EXTENSION_COMMAND_PARAMETERS
{
    GUID CommandId;
    D3D12_VIDEO_EXTENSION_COMMAND_PARAMETER_STAGE Stage;
    uint ParameterCount;
    D3D12_VIDEO_EXTENSION_COMMAND_PARAMETER_INFO* pParameterInfos;
}
struct D3D12_FEATURE_DATA_VIDEO_EXTENSION_COMMAND_SUPPORT
{
    uint NodeIndex;
    GUID CommandId;
    const(void)* pInputData;
    ulong InputDataSizeInBytes;
    void* pOutputData;
    ulong OutputDataSizeInBytes;
}
struct D3D12_FEATURE_DATA_VIDEO_EXTENSION_COMMAND_SIZE
{
    uint NodeIndex;
    GUID CommandId;
    const(void)* pCreationParameters;
    ulong CreationParametersSizeInBytes;
    ulong MemoryPoolL0Size;
    ulong MemoryPoolL1Size;
}
struct D3D12_VIDEO_EXTENSION_COMMAND_DESC
{
    uint NodeMask;
    GUID CommandId;
}
enum IID_ID3D12VideoDecoder1 = GUID(0x79a2e5fb, 0xccd2, 0x469a, [0x9f, 0xde, 0x19, 0x5d, 0x10, 0x95, 0x1f, 0x7e]);
interface ID3D12VideoDecoder1 : ID3D12VideoDecoder
{
    HRESULT GetProtectedResourceSession(const(GUID)*, void**);
}
enum IID_ID3D12VideoDecoderHeap1 = GUID(0xda1d98c5, 0x539f, 0x41b2, [0xbf, 0x6b, 0x11, 0x98, 0xa0, 0x3b, 0x6d, 0x26]);
interface ID3D12VideoDecoderHeap1 : ID3D12VideoDecoderHeap
{
    HRESULT GetProtectedResourceSession(const(GUID)*, void**);
}
enum IID_ID3D12VideoProcessor1 = GUID(0xf3cfe615, 0x553f, 0x425c, [0x86, 0xd8, 0xee, 0x8c, 0x1b, 0x1f, 0xb0, 0x1c]);
interface ID3D12VideoProcessor1 : ID3D12VideoProcessor
{
    HRESULT GetProtectedResourceSession(const(GUID)*, void**);
}
enum IID_ID3D12VideoExtensionCommand = GUID(0x554e41e8, 0xae8e, 0x4a8c, [0xb7, 0xd2, 0x5b, 0x4f, 0x27, 0x4a, 0x30, 0xe4]);
interface ID3D12VideoExtensionCommand : ID3D12Pageable
{
    D3D12_VIDEO_EXTENSION_COMMAND_DESC GetDesc();
    HRESULT GetProtectedResourceSession(const(GUID)*, void**);
}
enum IID_ID3D12VideoDevice2 = GUID(0xf019ac49, 0xf838, 0x4a95, [0x9b, 0x17, 0x57, 0x94, 0x37, 0xc8, 0xf5, 0x13]);
interface ID3D12VideoDevice2 : ID3D12VideoDevice1
{
    HRESULT CreateVideoDecoder1(const(D3D12_VIDEO_DECODER_DESC)*, ID3D12ProtectedResourceSession, const(GUID)*, void**);
    HRESULT CreateVideoDecoderHeap1(const(D3D12_VIDEO_DECODER_HEAP_DESC)*, ID3D12ProtectedResourceSession, const(GUID)*, void**);
    HRESULT CreateVideoProcessor1(uint, const(D3D12_VIDEO_PROCESS_OUTPUT_STREAM_DESC)*, uint, const(D3D12_VIDEO_PROCESS_INPUT_STREAM_DESC)*, ID3D12ProtectedResourceSession, const(GUID)*, void**);
    HRESULT CreateVideoExtensionCommand(const(D3D12_VIDEO_EXTENSION_COMMAND_DESC)*, const(void)*, ulong, ID3D12ProtectedResourceSession, const(GUID)*, void**);
    HRESULT ExecuteExtensionCommand(ID3D12VideoExtensionCommand, const(void)*, ulong, void*, ulong);
}
enum IID_ID3D12VideoDecodeCommandList2 = GUID(0x6e120880, 0xc114, 0x4153, [0x80, 0x36, 0xd2, 0x47, 0x5, 0x1e, 0x17, 0x29]);
interface ID3D12VideoDecodeCommandList2 : ID3D12VideoDecodeCommandList1
{
    void SetProtectedResourceSession(ID3D12ProtectedResourceSession);
    void InitializeExtensionCommand(ID3D12VideoExtensionCommand, const(void)*, ulong);
    void ExecuteExtensionCommand(ID3D12VideoExtensionCommand, const(void)*, ulong);
}
enum IID_ID3D12VideoProcessCommandList2 = GUID(0xdb525ae4, 0x6ad6, 0x473c, [0xba, 0xa7, 0x59, 0xb2, 0xe3, 0x70, 0x82, 0xe4]);
interface ID3D12VideoProcessCommandList2 : ID3D12VideoProcessCommandList1
{
    void SetProtectedResourceSession(ID3D12ProtectedResourceSession);
    void InitializeExtensionCommand(ID3D12VideoExtensionCommand, const(void)*, ulong);
    void ExecuteExtensionCommand(ID3D12VideoExtensionCommand, const(void)*, ulong);
}
enum IID_ID3D12VideoEncodeCommandList1 = GUID(0x94971eca, 0x2bdb, 0x4769, [0x88, 0xcf, 0x36, 0x75, 0xea, 0x75, 0x7e, 0xbc]);
interface ID3D12VideoEncodeCommandList1 : ID3D12VideoEncodeCommandList
{
    void InitializeExtensionCommand(ID3D12VideoExtensionCommand, const(void)*, ulong);
    void ExecuteExtensionCommand(ID3D12VideoExtensionCommand, const(void)*, ulong);
}
alias D3D12_VIDEO_ENCODER_RATE_CONTROL_MODE = int;
enum : int
{
    D3D12_VIDEO_ENCODER_RATE_CONTROL_MODE_ABSOLUTE_QP_MAP = 0x00000000,
    D3D12_VIDEO_ENCODER_RATE_CONTROL_MODE_CQP             = 0x00000001,
    D3D12_VIDEO_ENCODER_RATE_CONTROL_MODE_CBR             = 0x00000002,
    D3D12_VIDEO_ENCODER_RATE_CONTROL_MODE_VBR             = 0x00000003,
    D3D12_VIDEO_ENCODER_RATE_CONTROL_MODE_QVBR            = 0x00000004,
}

alias D3D12_VIDEO_ENCODER_RATE_CONTROL_FLAGS = uint;
enum : uint
{
    D3D12_VIDEO_ENCODER_RATE_CONTROL_FLAG_NONE                  = 0x00000000,
    D3D12_VIDEO_ENCODER_RATE_CONTROL_FLAG_ENABLE_DELTA_QP       = 0x00000001,
    D3D12_VIDEO_ENCODER_RATE_CONTROL_FLAG_ENABLE_FRAME_ANALYSIS = 0x00000002,
    D3D12_VIDEO_ENCODER_RATE_CONTROL_FLAG_ENABLE_QP_RANGE       = 0x00000004,
    D3D12_VIDEO_ENCODER_RATE_CONTROL_FLAG_ENABLE_INITIAL_QP     = 0x00000008,
    D3D12_VIDEO_ENCODER_RATE_CONTROL_FLAG_ENABLE_MAX_FRAME_SIZE = 0x00000010,
    D3D12_VIDEO_ENCODER_RATE_CONTROL_FLAG_ENABLE_VBV_SIZES      = 0x00000020,
}

struct D3D12_VIDEO_ENCODER_RATE_CONTROL_CQP
{
    uint ConstantQP_FullIntracodedFrame;
    uint ConstantQP_InterPredictedFrame_PrevRefOnly;
    uint ConstantQP_InterPredictedFrame_BiDirectionalRef;
}
struct D3D12_VIDEO_ENCODER_RATE_CONTROL_CBR
{
    uint InitialQP;
    uint MinQP;
    uint MaxQP;
    ulong MaxFrameBitSize;
    ulong TargetBitRate;
    ulong VBVCapacity;
    ulong InitialVBVFullness;
}
struct D3D12_VIDEO_ENCODER_RATE_CONTROL_VBR
{
    uint InitialQP;
    uint MinQP;
    uint MaxQP;
    ulong MaxFrameBitSize;
    ulong TargetAvgBitRate;
    ulong PeakBitRate;
    ulong VBVCapacity;
    ulong InitialVBVFullness;
}
struct D3D12_VIDEO_ENCODER_RATE_CONTROL_QVBR
{
    uint InitialQP;
    uint MinQP;
    uint MaxQP;
    ulong MaxFrameBitSize;
    ulong TargetAvgBitRate;
    ulong PeakBitRate;
    uint ConstantQualityTarget;
}
struct D3D12_VIDEO_ENCODER_RATE_CONTROL_CONFIGURATION_PARAMS
{
    uint DataSize;
    union
    {
        const(D3D12_VIDEO_ENCODER_RATE_CONTROL_CQP)* pConfiguration_CQP;
        const(D3D12_VIDEO_ENCODER_RATE_CONTROL_CBR)* pConfiguration_CBR;
        const(D3D12_VIDEO_ENCODER_RATE_CONTROL_VBR)* pConfiguration_VBR;
        const(D3D12_VIDEO_ENCODER_RATE_CONTROL_QVBR)* pConfiguration_QVBR;
    }
}
struct D3D12_VIDEO_ENCODER_RATE_CONTROL
{
    D3D12_VIDEO_ENCODER_RATE_CONTROL_MODE Mode;
    D3D12_VIDEO_ENCODER_RATE_CONTROL_FLAGS Flags;
    D3D12_VIDEO_ENCODER_RATE_CONTROL_CONFIGURATION_PARAMS ConfigParams;
    DXGI_RATIONAL TargetFrameRate;
}
alias D3D12_VIDEO_ENCODER_CODEC = int;
enum : int
{
    D3D12_VIDEO_ENCODER_CODEC_H264 = 0x00000000,
    D3D12_VIDEO_ENCODER_CODEC_HEVC = 0x00000001,
}

struct D3D12_FEATURE_DATA_VIDEO_ENCODER_CODEC
{
    uint NodeIndex;
    D3D12_VIDEO_ENCODER_CODEC Codec;
    BOOL IsSupported;
}
alias D3D12_VIDEO_ENCODER_PROFILE_H264 = int;
enum : int
{
    D3D12_VIDEO_ENCODER_PROFILE_H264_MAIN    = 0x00000000,
    D3D12_VIDEO_ENCODER_PROFILE_H264_HIGH    = 0x00000001,
    D3D12_VIDEO_ENCODER_PROFILE_H264_HIGH_10 = 0x00000002,
}

alias D3D12_VIDEO_ENCODER_PROFILE_HEVC = int;
enum : int
{
    D3D12_VIDEO_ENCODER_PROFILE_HEVC_MAIN   = 0x00000000,
    D3D12_VIDEO_ENCODER_PROFILE_HEVC_MAIN10 = 0x00000001,
}

struct D3D12_VIDEO_ENCODER_PROFILE_DESC
{
    uint DataSize;
    union
    {
        D3D12_VIDEO_ENCODER_PROFILE_H264* pH264Profile;
        D3D12_VIDEO_ENCODER_PROFILE_HEVC* pHEVCProfile;
    }
}
alias D3D12_VIDEO_ENCODER_LEVELS_H264 = int;
enum : int
{
    D3D12_VIDEO_ENCODER_LEVELS_H264_1  = 0x00000000,
    D3D12_VIDEO_ENCODER_LEVELS_H264_1b = 0x00000001,
    D3D12_VIDEO_ENCODER_LEVELS_H264_11 = 0x00000002,
    D3D12_VIDEO_ENCODER_LEVELS_H264_12 = 0x00000003,
    D3D12_VIDEO_ENCODER_LEVELS_H264_13 = 0x00000004,
    D3D12_VIDEO_ENCODER_LEVELS_H264_2  = 0x00000005,
    D3D12_VIDEO_ENCODER_LEVELS_H264_21 = 0x00000006,
    D3D12_VIDEO_ENCODER_LEVELS_H264_22 = 0x00000007,
    D3D12_VIDEO_ENCODER_LEVELS_H264_3  = 0x00000008,
    D3D12_VIDEO_ENCODER_LEVELS_H264_31 = 0x00000009,
    D3D12_VIDEO_ENCODER_LEVELS_H264_32 = 0x0000000a,
    D3D12_VIDEO_ENCODER_LEVELS_H264_4  = 0x0000000b,
    D3D12_VIDEO_ENCODER_LEVELS_H264_41 = 0x0000000c,
    D3D12_VIDEO_ENCODER_LEVELS_H264_42 = 0x0000000d,
    D3D12_VIDEO_ENCODER_LEVELS_H264_5  = 0x0000000e,
    D3D12_VIDEO_ENCODER_LEVELS_H264_51 = 0x0000000f,
    D3D12_VIDEO_ENCODER_LEVELS_H264_52 = 0x00000010,
    D3D12_VIDEO_ENCODER_LEVELS_H264_6  = 0x00000011,
    D3D12_VIDEO_ENCODER_LEVELS_H264_61 = 0x00000012,
    D3D12_VIDEO_ENCODER_LEVELS_H264_62 = 0x00000013,
}

alias D3D12_VIDEO_ENCODER_TIER_HEVC = int;
enum : int
{
    D3D12_VIDEO_ENCODER_TIER_HEVC_MAIN = 0x00000000,
    D3D12_VIDEO_ENCODER_TIER_HEVC_HIGH = 0x00000001,
}

alias D3D12_VIDEO_ENCODER_LEVELS_HEVC = int;
enum : int
{
    D3D12_VIDEO_ENCODER_LEVELS_HEVC_1  = 0x00000000,
    D3D12_VIDEO_ENCODER_LEVELS_HEVC_2  = 0x00000001,
    D3D12_VIDEO_ENCODER_LEVELS_HEVC_21 = 0x00000002,
    D3D12_VIDEO_ENCODER_LEVELS_HEVC_3  = 0x00000003,
    D3D12_VIDEO_ENCODER_LEVELS_HEVC_31 = 0x00000004,
    D3D12_VIDEO_ENCODER_LEVELS_HEVC_4  = 0x00000005,
    D3D12_VIDEO_ENCODER_LEVELS_HEVC_41 = 0x00000006,
    D3D12_VIDEO_ENCODER_LEVELS_HEVC_5  = 0x00000007,
    D3D12_VIDEO_ENCODER_LEVELS_HEVC_51 = 0x00000008,
    D3D12_VIDEO_ENCODER_LEVELS_HEVC_52 = 0x00000009,
    D3D12_VIDEO_ENCODER_LEVELS_HEVC_6  = 0x0000000a,
    D3D12_VIDEO_ENCODER_LEVELS_HEVC_61 = 0x0000000b,
    D3D12_VIDEO_ENCODER_LEVELS_HEVC_62 = 0x0000000c,
}

struct D3D12_VIDEO_ENCODER_LEVEL_TIER_CONSTRAINTS_HEVC
{
    D3D12_VIDEO_ENCODER_LEVELS_HEVC Level;
    D3D12_VIDEO_ENCODER_TIER_HEVC Tier;
}
struct D3D12_VIDEO_ENCODER_LEVEL_SETTING
{
    uint DataSize;
    union
    {
        D3D12_VIDEO_ENCODER_LEVELS_H264* pH264LevelSetting;
        D3D12_VIDEO_ENCODER_LEVEL_TIER_CONSTRAINTS_HEVC* pHEVCLevelSetting;
    }
}
struct D3D12_FEATURE_DATA_VIDEO_ENCODER_PROFILE_LEVEL
{
    uint NodeIndex;
    D3D12_VIDEO_ENCODER_CODEC Codec;
    D3D12_VIDEO_ENCODER_PROFILE_DESC Profile;
    BOOL IsSupported;
    D3D12_VIDEO_ENCODER_LEVEL_SETTING MinSupportedLevel;
    D3D12_VIDEO_ENCODER_LEVEL_SETTING MaxSupportedLevel;
}
struct D3D12_VIDEO_ENCODER_PICTURE_RESOLUTION_DESC
{
    uint Width;
    uint Height;
}
struct D3D12_VIDEO_ENCODER_PICTURE_RESOLUTION_RATIO_DESC
{
    uint WidthRatio;
    uint HeightRatio;
}
struct D3D12_FEATURE_DATA_VIDEO_ENCODER_OUTPUT_RESOLUTION_RATIOS_COUNT
{
    uint NodeIndex;
    D3D12_VIDEO_ENCODER_CODEC Codec;
    uint ResolutionRatiosCount;
}
struct D3D12_FEATURE_DATA_VIDEO_ENCODER_OUTPUT_RESOLUTION
{
    uint NodeIndex;
    D3D12_VIDEO_ENCODER_CODEC Codec;
    uint ResolutionRatiosCount;
    BOOL IsSupported;
    D3D12_VIDEO_ENCODER_PICTURE_RESOLUTION_DESC MinResolutionSupported;
    D3D12_VIDEO_ENCODER_PICTURE_RESOLUTION_DESC MaxResolutionSupported;
    uint ResolutionWidthMultipleRequirement;
    uint ResolutionHeightMultipleRequirement;
    D3D12_VIDEO_ENCODER_PICTURE_RESOLUTION_RATIO_DESC* pResolutionRatios;
}
struct D3D12_FEATURE_DATA_VIDEO_ENCODER_INPUT_FORMAT
{
    uint NodeIndex;
    D3D12_VIDEO_ENCODER_CODEC Codec;
    D3D12_VIDEO_ENCODER_PROFILE_DESC Profile;
    DXGI_FORMAT Format;
    BOOL IsSupported;
}
struct D3D12_FEATURE_DATA_VIDEO_ENCODER_RATE_CONTROL_MODE
{
    uint NodeIndex;
    D3D12_VIDEO_ENCODER_CODEC Codec;
    D3D12_VIDEO_ENCODER_RATE_CONTROL_MODE RateControlMode;
    BOOL IsSupported;
}
alias D3D12_VIDEO_ENCODER_INTRA_REFRESH_MODE = int;
enum : int
{
    D3D12_VIDEO_ENCODER_INTRA_REFRESH_MODE_NONE      = 0x00000000,
    D3D12_VIDEO_ENCODER_INTRA_REFRESH_MODE_ROW_BASED = 0x00000001,
}

struct D3D12_FEATURE_DATA_VIDEO_ENCODER_INTRA_REFRESH_MODE
{
    uint NodeIndex;
    D3D12_VIDEO_ENCODER_CODEC Codec;
    D3D12_VIDEO_ENCODER_PROFILE_DESC Profile;
    D3D12_VIDEO_ENCODER_LEVEL_SETTING Level;
    D3D12_VIDEO_ENCODER_INTRA_REFRESH_MODE IntraRefreshMode;
    BOOL IsSupported;
}
alias D3D12_VIDEO_ENCODER_FRAME_SUBREGION_LAYOUT_MODE = int;
enum : int
{
    D3D12_VIDEO_ENCODER_FRAME_SUBREGION_LAYOUT_MODE_FULL_FRAME                                = 0x00000000,
    D3D12_VIDEO_ENCODER_FRAME_SUBREGION_LAYOUT_MODE_BYTES_PER_SUBREGION                       = 0x00000001,
    D3D12_VIDEO_ENCODER_FRAME_SUBREGION_LAYOUT_MODE_SQUARE_UNITS_PER_SUBREGION_ROW_UNALIGNED  = 0x00000002,
    D3D12_VIDEO_ENCODER_FRAME_SUBREGION_LAYOUT_MODE_UNIFORM_PARTITIONING_ROWS_PER_SUBREGION   = 0x00000003,
    D3D12_VIDEO_ENCODER_FRAME_SUBREGION_LAYOUT_MODE_UNIFORM_PARTITIONING_SUBREGIONS_PER_FRAME = 0x00000004,
}

struct D3D12_FEATURE_DATA_VIDEO_ENCODER_FRAME_SUBREGION_LAYOUT_MODE
{
    uint NodeIndex;
    D3D12_VIDEO_ENCODER_CODEC Codec;
    D3D12_VIDEO_ENCODER_PROFILE_DESC Profile;
    D3D12_VIDEO_ENCODER_LEVEL_SETTING Level;
    D3D12_VIDEO_ENCODER_FRAME_SUBREGION_LAYOUT_MODE SubregionMode;
    BOOL IsSupported;
}
alias D3D12_VIDEO_ENCODER_HEAP_FLAGS = uint;
enum : uint
{
    D3D12_VIDEO_ENCODER_HEAP_FLAG_NONE = 0x00000000,
}

struct D3D12_VIDEO_ENCODER_HEAP_DESC
{
    uint NodeMask;
    D3D12_VIDEO_ENCODER_HEAP_FLAGS Flags;
    D3D12_VIDEO_ENCODER_CODEC EncodeCodec;
    D3D12_VIDEO_ENCODER_PROFILE_DESC EncodeProfile;
    D3D12_VIDEO_ENCODER_LEVEL_SETTING EncodeLevel;
    uint ResolutionsListCount;
    const(D3D12_VIDEO_ENCODER_PICTURE_RESOLUTION_DESC)* pResolutionList;
}
struct D3D12_FEATURE_DATA_VIDEO_ENCODER_HEAP_SIZE
{
    D3D12_VIDEO_ENCODER_HEAP_DESC HeapDesc;
    BOOL IsSupported;
    ulong MemoryPoolL0Size;
    ulong MemoryPoolL1Size;
}
alias D3D12_VIDEO_ENCODER_CODEC_CONFIGURATION_SUPPORT_H264_FLAGS = uint;
enum : uint
{
    D3D12_VIDEO_ENCODER_CODEC_CONFIGURATION_SUPPORT_H264_FLAG_NONE                                     = 0x00000000,
    D3D12_VIDEO_ENCODER_CODEC_CONFIGURATION_SUPPORT_H264_FLAG_CABAC_ENCODING_SUPPORT                   = 0x00000001,
    D3D12_VIDEO_ENCODER_CODEC_CONFIGURATION_SUPPORT_H264_FLAG_INTRA_SLICE_CONSTRAINED_ENCODING_SUPPORT = 0x00000002,
    D3D12_VIDEO_ENCODER_CODEC_CONFIGURATION_SUPPORT_H264_FLAG_BFRAME_LTR_COMBINED_SUPPORT              = 0x00000004,
    D3D12_VIDEO_ENCODER_CODEC_CONFIGURATION_SUPPORT_H264_FLAG_ADAPTIVE_8x8_TRANSFORM_ENCODING_SUPPORT  = 0x00000008,
    D3D12_VIDEO_ENCODER_CODEC_CONFIGURATION_SUPPORT_H264_FLAG_DIRECT_SPATIAL_ENCODING_SUPPORT          = 0x00000010,
    D3D12_VIDEO_ENCODER_CODEC_CONFIGURATION_SUPPORT_H264_FLAG_DIRECT_TEMPORAL_ENCODING_SUPPORT         = 0x00000020,
    D3D12_VIDEO_ENCODER_CODEC_CONFIGURATION_SUPPORT_H264_FLAG_CONSTRAINED_INTRAPREDICTION_SUPPORT      = 0x00000040,
}

alias D3D12_VIDEO_ENCODER_CODEC_CONFIGURATION_H264_SLICES_DEBLOCKING_MODES = int;
enum : int
{
    D3D12_VIDEO_ENCODER_CODEC_CONFIGURATION_H264_SLICES_DEBLOCKING_MODE_0_ALL_LUMA_CHROMA_SLICE_BLOCK_EDGES_ALWAYS_FILTERED            = 0x00000000,
    D3D12_VIDEO_ENCODER_CODEC_CONFIGURATION_H264_SLICES_DEBLOCKING_MODE_1_DISABLE_ALL_SLICE_BLOCK_EDGES                                = 0x00000001,
    D3D12_VIDEO_ENCODER_CODEC_CONFIGURATION_H264_SLICES_DEBLOCKING_MODE_2_DISABLE_SLICE_BOUNDARIES_BLOCKS                              = 0x00000002,
    D3D12_VIDEO_ENCODER_CODEC_CONFIGURATION_H264_SLICES_DEBLOCKING_MODE_3_USE_TWO_STAGE_DEBLOCKING                                     = 0x00000003,
    D3D12_VIDEO_ENCODER_CODEC_CONFIGURATION_H264_SLICES_DEBLOCKING_MODE_4_DISABLE_CHROMA_BLOCK_EDGES                                   = 0x00000004,
    D3D12_VIDEO_ENCODER_CODEC_CONFIGURATION_H264_SLICES_DEBLOCKING_MODE_5_DISABLE_CHROMA_BLOCK_EDGES_AND_LUMA_BOUNDARIES               = 0x00000005,
    D3D12_VIDEO_ENCODER_CODEC_CONFIGURATION_H264_SLICES_DEBLOCKING_MODE_6_DISABLE_CHROMA_BLOCK_EDGES_AND_USE_LUMA_TWO_STAGE_DEBLOCKING = 0x00000006,
}

alias D3D12_VIDEO_ENCODER_CODEC_CONFIGURATION_H264_SLICES_DEBLOCKING_MODE_FLAGS = uint;
enum : uint
{
    D3D12_VIDEO_ENCODER_CODEC_CONFIGURATION_H264_SLICES_DEBLOCKING_MODE_FLAG_NONE                                                           = 0x00000000,
    D3D12_VIDEO_ENCODER_CODEC_CONFIGURATION_H264_SLICES_DEBLOCKING_MODE_FLAG_0_ALL_LUMA_CHROMA_SLICE_BLOCK_EDGES_ALWAYS_FILTERED            = 0x00000001,
    D3D12_VIDEO_ENCODER_CODEC_CONFIGURATION_H264_SLICES_DEBLOCKING_MODE_FLAG_1_DISABLE_ALL_SLICE_BLOCK_EDGES                                = 0x00000002,
    D3D12_VIDEO_ENCODER_CODEC_CONFIGURATION_H264_SLICES_DEBLOCKING_MODE_FLAG_2_DISABLE_SLICE_BOUNDARIES_BLOCKS                              = 0x00000004,
    D3D12_VIDEO_ENCODER_CODEC_CONFIGURATION_H264_SLICES_DEBLOCKING_MODE_FLAG_3_USE_TWO_STAGE_DEBLOCKING                                     = 0x00000008,
    D3D12_VIDEO_ENCODER_CODEC_CONFIGURATION_H264_SLICES_DEBLOCKING_MODE_FLAG_4_DISABLE_CHROMA_BLOCK_EDGES                                   = 0x00000010,
    D3D12_VIDEO_ENCODER_CODEC_CONFIGURATION_H264_SLICES_DEBLOCKING_MODE_FLAG_5_DISABLE_CHROMA_BLOCK_EDGES_AND_LUMA_BOUNDARIES               = 0x00000020,
    D3D12_VIDEO_ENCODER_CODEC_CONFIGURATION_H264_SLICES_DEBLOCKING_MODE_FLAG_6_DISABLE_CHROMA_BLOCK_EDGES_AND_USE_LUMA_TWO_STAGE_DEBLOCKING = 0x00000040,
}

struct D3D12_VIDEO_ENCODER_CODEC_CONFIGURATION_SUPPORT_H264
{
    D3D12_VIDEO_ENCODER_CODEC_CONFIGURATION_SUPPORT_H264_FLAGS SupportFlags;
    D3D12_VIDEO_ENCODER_CODEC_CONFIGURATION_H264_SLICES_DEBLOCKING_MODE_FLAGS DisableDeblockingFilterSupportedModes;
}
alias D3D12_VIDEO_ENCODER_CODEC_CONFIGURATION_SUPPORT_HEVC_FLAGS = uint;
enum : uint
{
    D3D12_VIDEO_ENCODER_CODEC_CONFIGURATION_SUPPORT_HEVC_FLAG_NONE                                        = 0x00000000,
    D3D12_VIDEO_ENCODER_CODEC_CONFIGURATION_SUPPORT_HEVC_FLAG_BFRAME_LTR_COMBINED_SUPPORT                 = 0x00000001,
    D3D12_VIDEO_ENCODER_CODEC_CONFIGURATION_SUPPORT_HEVC_FLAG_INTRA_SLICE_CONSTRAINED_ENCODING_SUPPORT    = 0x00000002,
    D3D12_VIDEO_ENCODER_CODEC_CONFIGURATION_SUPPORT_HEVC_FLAG_CONSTRAINED_INTRAPREDICTION_SUPPORT         = 0x00000004,
    D3D12_VIDEO_ENCODER_CODEC_CONFIGURATION_SUPPORT_HEVC_FLAG_SAO_FILTER_SUPPORT                          = 0x00000008,
    D3D12_VIDEO_ENCODER_CODEC_CONFIGURATION_SUPPORT_HEVC_FLAG_ASYMETRIC_MOTION_PARTITION_SUPPORT          = 0x00000010,
    D3D12_VIDEO_ENCODER_CODEC_CONFIGURATION_SUPPORT_HEVC_FLAG_ASYMETRIC_MOTION_PARTITION_REQUIRED         = 0x00000020,
    D3D12_VIDEO_ENCODER_CODEC_CONFIGURATION_SUPPORT_HEVC_FLAG_TRANSFORM_SKIP_SUPPORT                      = 0x00000040,
    D3D12_VIDEO_ENCODER_CODEC_CONFIGURATION_SUPPORT_HEVC_FLAG_DISABLING_LOOP_FILTER_ACROSS_SLICES_SUPPORT = 0x00000080,
    D3D12_VIDEO_ENCODER_CODEC_CONFIGURATION_SUPPORT_HEVC_FLAG_P_FRAMES_IMPLEMENTED_AS_LOW_DELAY_B_FRAMES  = 0x00000100,
}

alias D3D12_VIDEO_ENCODER_CODEC_CONFIGURATION_HEVC_CUSIZE = int;
enum : int
{
    D3D12_VIDEO_ENCODER_CODEC_CONFIGURATION_HEVC_CUSIZE_8x8   = 0x00000000,
    D3D12_VIDEO_ENCODER_CODEC_CONFIGURATION_HEVC_CUSIZE_16x16 = 0x00000001,
    D3D12_VIDEO_ENCODER_CODEC_CONFIGURATION_HEVC_CUSIZE_32x32 = 0x00000002,
    D3D12_VIDEO_ENCODER_CODEC_CONFIGURATION_HEVC_CUSIZE_64x64 = 0x00000003,
}

alias D3D12_VIDEO_ENCODER_CODEC_CONFIGURATION_HEVC_TUSIZE = int;
enum : int
{
    D3D12_VIDEO_ENCODER_CODEC_CONFIGURATION_HEVC_TUSIZE_4x4   = 0x00000000,
    D3D12_VIDEO_ENCODER_CODEC_CONFIGURATION_HEVC_TUSIZE_8x8   = 0x00000001,
    D3D12_VIDEO_ENCODER_CODEC_CONFIGURATION_HEVC_TUSIZE_16x16 = 0x00000002,
    D3D12_VIDEO_ENCODER_CODEC_CONFIGURATION_HEVC_TUSIZE_32x32 = 0x00000003,
}

struct D3D12_VIDEO_ENCODER_CODEC_CONFIGURATION_SUPPORT_HEVC
{
    D3D12_VIDEO_ENCODER_CODEC_CONFIGURATION_SUPPORT_HEVC_FLAGS SupportFlags;
    D3D12_VIDEO_ENCODER_CODEC_CONFIGURATION_HEVC_CUSIZE MinLumaCodingUnitSize;
    D3D12_VIDEO_ENCODER_CODEC_CONFIGURATION_HEVC_CUSIZE MaxLumaCodingUnitSize;
    D3D12_VIDEO_ENCODER_CODEC_CONFIGURATION_HEVC_TUSIZE MinLumaTransformUnitSize;
    D3D12_VIDEO_ENCODER_CODEC_CONFIGURATION_HEVC_TUSIZE MaxLumaTransformUnitSize;
    ubyte max_transform_hierarchy_depth_inter;
    ubyte max_transform_hierarchy_depth_intra;
}
struct D3D12_VIDEO_ENCODER_CODEC_CONFIGURATION_SUPPORT
{
    uint DataSize;
    union
    {
        D3D12_VIDEO_ENCODER_CODEC_CONFIGURATION_SUPPORT_H264* pH264Support;
        D3D12_VIDEO_ENCODER_CODEC_CONFIGURATION_SUPPORT_HEVC* pHEVCSupport;
    }
}
struct D3D12_FEATURE_DATA_VIDEO_ENCODER_CODEC_CONFIGURATION_SUPPORT
{
    uint NodeIndex;
    D3D12_VIDEO_ENCODER_CODEC Codec;
    D3D12_VIDEO_ENCODER_PROFILE_DESC Profile;
    BOOL IsSupported;
    D3D12_VIDEO_ENCODER_CODEC_CONFIGURATION_SUPPORT CodecSupportLimits;
}
struct D3D12_VIDEO_ENCODER_CODEC_PICTURE_CONTROL_SUPPORT_H264
{
    uint MaxL0ReferencesForP;
    uint MaxL0ReferencesForB;
    uint MaxL1ReferencesForB;
    uint MaxLongTermReferences;
    uint MaxDPBCapacity;
}
struct D3D12_VIDEO_ENCODER_CODEC_PICTURE_CONTROL_SUPPORT_HEVC
{
    uint MaxL0ReferencesForP;
    uint MaxL0ReferencesForB;
    uint MaxL1ReferencesForB;
    uint MaxLongTermReferences;
    uint MaxDPBCapacity;
}
struct D3D12_VIDEO_ENCODER_CODEC_PICTURE_CONTROL_SUPPORT
{
    uint DataSize;
    union
    {
        D3D12_VIDEO_ENCODER_CODEC_PICTURE_CONTROL_SUPPORT_H264* pH264Support;
        D3D12_VIDEO_ENCODER_CODEC_PICTURE_CONTROL_SUPPORT_HEVC* pHEVCSupport;
    }
}
struct D3D12_FEATURE_DATA_VIDEO_ENCODER_CODEC_PICTURE_CONTROL_SUPPORT
{
    uint NodeIndex;
    D3D12_VIDEO_ENCODER_CODEC Codec;
    D3D12_VIDEO_ENCODER_PROFILE_DESC Profile;
    BOOL IsSupported;
    D3D12_VIDEO_ENCODER_CODEC_PICTURE_CONTROL_SUPPORT PictureSupport;
}
alias D3D12_VIDEO_ENCODER_SUPPORT_FLAGS = uint;
enum : uint
{
    D3D12_VIDEO_ENCODER_SUPPORT_FLAG_NONE                                             = 0x00000000,
    D3D12_VIDEO_ENCODER_SUPPORT_FLAG_GENERAL_SUPPORT_OK                               = 0x00000001,
    D3D12_VIDEO_ENCODER_SUPPORT_FLAG_RATE_CONTROL_RECONFIGURATION_AVAILABLE           = 0x00000002,
    D3D12_VIDEO_ENCODER_SUPPORT_FLAG_RESOLUTION_RECONFIGURATION_AVAILABLE             = 0x00000004,
    D3D12_VIDEO_ENCODER_SUPPORT_FLAG_RATE_CONTROL_VBV_SIZE_CONFIG_AVAILABLE           = 0x00000008,
    D3D12_VIDEO_ENCODER_SUPPORT_FLAG_RATE_CONTROL_FRAME_ANALYSIS_AVAILABLE            = 0x00000010,
    D3D12_VIDEO_ENCODER_SUPPORT_FLAG_RECONSTRUCTED_FRAMES_REQUIRE_TEXTURE_ARRAYS      = 0x00000020,
    D3D12_VIDEO_ENCODER_SUPPORT_FLAG_RATE_CONTROL_DELTA_QP_AVAILABLE                  = 0x00000040,
    D3D12_VIDEO_ENCODER_SUPPORT_FLAG_SUBREGION_LAYOUT_RECONFIGURATION_AVAILABLE       = 0x00000080,
    D3D12_VIDEO_ENCODER_SUPPORT_FLAG_RATE_CONTROL_ADJUSTABLE_QP_RANGE_AVAILABLE       = 0x00000100,
    D3D12_VIDEO_ENCODER_SUPPORT_FLAG_RATE_CONTROL_INITIAL_QP_AVAILABLE                = 0x00000200,
    D3D12_VIDEO_ENCODER_SUPPORT_FLAG_RATE_CONTROL_MAX_FRAME_SIZE_AVAILABLE            = 0x00000400,
    D3D12_VIDEO_ENCODER_SUPPORT_FLAG_SEQUENCE_GOP_RECONFIGURATION_AVAILABLE           = 0x00000800,
    D3D12_VIDEO_ENCODER_SUPPORT_FLAG_MOTION_ESTIMATION_PRECISION_MODE_LIMIT_AVAILABLE = 0x00001000,
}

alias D3D12_VIDEO_ENCODER_CODEC_CONFIGURATION_H264_FLAGS = uint;
enum : uint
{
    D3D12_VIDEO_ENCODER_CODEC_CONFIGURATION_H264_FLAG_NONE                                   = 0x00000000,
    D3D12_VIDEO_ENCODER_CODEC_CONFIGURATION_H264_FLAG_USE_CONSTRAINED_INTRAPREDICTION        = 0x00000001,
    D3D12_VIDEO_ENCODER_CODEC_CONFIGURATION_H264_FLAG_USE_ADAPTIVE_8x8_TRANSFORM             = 0x00000002,
    D3D12_VIDEO_ENCODER_CODEC_CONFIGURATION_H264_FLAG_ENABLE_CABAC_ENCODING                  = 0x00000004,
    D3D12_VIDEO_ENCODER_CODEC_CONFIGURATION_H264_FLAG_ALLOW_REQUEST_INTRA_CONSTRAINED_SLICES = 0x00000008,
}

alias D3D12_VIDEO_ENCODER_CODEC_CONFIGURATION_H264_DIRECT_MODES = int;
enum : int
{
    D3D12_VIDEO_ENCODER_CODEC_CONFIGURATION_H264_DIRECT_MODES_DISABLED = 0x00000000,
    D3D12_VIDEO_ENCODER_CODEC_CONFIGURATION_H264_DIRECT_MODES_TEMPORAL = 0x00000001,
    D3D12_VIDEO_ENCODER_CODEC_CONFIGURATION_H264_DIRECT_MODES_SPATIAL  = 0x00000002,
}

struct D3D12_VIDEO_ENCODER_CODEC_CONFIGURATION_H264
{
    D3D12_VIDEO_ENCODER_CODEC_CONFIGURATION_H264_FLAGS ConfigurationFlags;
    D3D12_VIDEO_ENCODER_CODEC_CONFIGURATION_H264_DIRECT_MODES DirectModeConfig;
    D3D12_VIDEO_ENCODER_CODEC_CONFIGURATION_H264_SLICES_DEBLOCKING_MODES DisableDeblockingFilterConfig;
}
alias D3D12_VIDEO_ENCODER_CODEC_CONFIGURATION_HEVC_FLAGS = uint;
enum : uint
{
    D3D12_VIDEO_ENCODER_CODEC_CONFIGURATION_HEVC_FLAG_NONE                                   = 0x00000000,
    D3D12_VIDEO_ENCODER_CODEC_CONFIGURATION_HEVC_FLAG_DISABLE_LOOP_FILTER_ACROSS_SLICES      = 0x00000001,
    D3D12_VIDEO_ENCODER_CODEC_CONFIGURATION_HEVC_FLAG_ALLOW_REQUEST_INTRA_CONSTRAINED_SLICES = 0x00000002,
    D3D12_VIDEO_ENCODER_CODEC_CONFIGURATION_HEVC_FLAG_ENABLE_SAO_FILTER                      = 0x00000004,
    D3D12_VIDEO_ENCODER_CODEC_CONFIGURATION_HEVC_FLAG_ENABLE_LONG_TERM_REFERENCES            = 0x00000008,
    D3D12_VIDEO_ENCODER_CODEC_CONFIGURATION_HEVC_FLAG_USE_ASYMETRIC_MOTION_PARTITION         = 0x00000010,
    D3D12_VIDEO_ENCODER_CODEC_CONFIGURATION_HEVC_FLAG_ENABLE_TRANSFORM_SKIPPING              = 0x00000020,
    D3D12_VIDEO_ENCODER_CODEC_CONFIGURATION_HEVC_FLAG_USE_CONSTRAINED_INTRAPREDICTION        = 0x00000040,
}

struct D3D12_VIDEO_ENCODER_CODEC_CONFIGURATION_HEVC
{
    D3D12_VIDEO_ENCODER_CODEC_CONFIGURATION_HEVC_FLAGS ConfigurationFlags;
    D3D12_VIDEO_ENCODER_CODEC_CONFIGURATION_HEVC_CUSIZE MinLumaCodingUnitSize;
    D3D12_VIDEO_ENCODER_CODEC_CONFIGURATION_HEVC_CUSIZE MaxLumaCodingUnitSize;
    D3D12_VIDEO_ENCODER_CODEC_CONFIGURATION_HEVC_TUSIZE MinLumaTransformUnitSize;
    D3D12_VIDEO_ENCODER_CODEC_CONFIGURATION_HEVC_TUSIZE MaxLumaTransformUnitSize;
    ubyte max_transform_hierarchy_depth_inter;
    ubyte max_transform_hierarchy_depth_intra;
}
struct D3D12_VIDEO_ENCODER_CODEC_CONFIGURATION
{
    uint DataSize;
    union
    {
        D3D12_VIDEO_ENCODER_CODEC_CONFIGURATION_H264* pH264Config;
        D3D12_VIDEO_ENCODER_CODEC_CONFIGURATION_HEVC* pHEVCConfig;
    }
}
struct D3D12_VIDEO_ENCODER_INTRA_REFRESH
{
    D3D12_VIDEO_ENCODER_INTRA_REFRESH_MODE Mode;
    uint IntraRefreshDuration;
}
alias D3D12_VIDEO_ENCODER_MOTION_ESTIMATION_PRECISION_MODE = int;
enum : int
{
    D3D12_VIDEO_ENCODER_MOTION_ESTIMATION_PRECISION_MODE_MAXIMUM       = 0x00000000,
    D3D12_VIDEO_ENCODER_MOTION_ESTIMATION_PRECISION_MODE_FULL_PIXEL    = 0x00000001,
    D3D12_VIDEO_ENCODER_MOTION_ESTIMATION_PRECISION_MODE_HALF_PIXEL    = 0x00000002,
    D3D12_VIDEO_ENCODER_MOTION_ESTIMATION_PRECISION_MODE_QUARTER_PIXEL = 0x00000003,
}

struct D3D12_FEATURE_DATA_VIDEO_ENCODER_RESOLUTION_SUPPORT_LIMITS
{
    uint MaxSubregionsNumber;
    uint MaxIntraRefreshFrameDuration;
    uint SubregionBlockPixelsSize;
    uint QPMapRegionPixelsSize;
}
alias D3D12_VIDEO_ENCODER_VALIDATION_FLAGS = uint;
enum : uint
{
    D3D12_VIDEO_ENCODER_VALIDATION_FLAG_NONE                                     = 0x00000000,
    D3D12_VIDEO_ENCODER_VALIDATION_FLAG_CODEC_NOT_SUPPORTED                      = 0x00000001,
    D3D12_VIDEO_ENCODER_VALIDATION_FLAG_INPUT_FORMAT_NOT_SUPPORTED               = 0x00000008,
    D3D12_VIDEO_ENCODER_VALIDATION_FLAG_CODEC_CONFIGURATION_NOT_SUPPORTED        = 0x00000010,
    D3D12_VIDEO_ENCODER_VALIDATION_FLAG_RATE_CONTROL_MODE_NOT_SUPPORTED          = 0x00000020,
    D3D12_VIDEO_ENCODER_VALIDATION_FLAG_RATE_CONTROL_CONFIGURATION_NOT_SUPPORTED = 0x00000040,
    D3D12_VIDEO_ENCODER_VALIDATION_FLAG_INTRA_REFRESH_MODE_NOT_SUPPORTED         = 0x00000080,
    D3D12_VIDEO_ENCODER_VALIDATION_FLAG_SUBREGION_LAYOUT_MODE_NOT_SUPPORTED      = 0x00000100,
    D3D12_VIDEO_ENCODER_VALIDATION_FLAG_RESOLUTION_NOT_SUPPORTED_IN_LIST         = 0x00000200,
    D3D12_VIDEO_ENCODER_VALIDATION_FLAG_GOP_STRUCTURE_NOT_SUPPORTED              = 0x00000800,
}

struct D3D12_VIDEO_ENCODER_SEQUENCE_GOP_STRUCTURE_H264
{
    uint GOPLength;
    uint PPicturePeriod;
    ubyte pic_order_cnt_type;
    ubyte log2_max_frame_num_minus4;
    ubyte log2_max_pic_order_cnt_lsb_minus4;
}
struct D3D12_VIDEO_ENCODER_SEQUENCE_GOP_STRUCTURE_HEVC
{
    uint GOPLength;
    uint PPicturePeriod;
    ubyte log2_max_pic_order_cnt_lsb_minus4;
}
struct D3D12_VIDEO_ENCODER_SEQUENCE_GOP_STRUCTURE
{
    uint DataSize;
    union
    {
        D3D12_VIDEO_ENCODER_SEQUENCE_GOP_STRUCTURE_H264* pH264GroupOfPictures;
        D3D12_VIDEO_ENCODER_SEQUENCE_GOP_STRUCTURE_HEVC* pHEVCGroupOfPictures;
    }
}
struct D3D12_FEATURE_DATA_VIDEO_ENCODER_SUPPORT
{
    uint NodeIndex;
    D3D12_VIDEO_ENCODER_CODEC Codec;
    DXGI_FORMAT InputFormat;
    D3D12_VIDEO_ENCODER_CODEC_CONFIGURATION CodecConfiguration;
    D3D12_VIDEO_ENCODER_SEQUENCE_GOP_STRUCTURE CodecGopSequence;
    D3D12_VIDEO_ENCODER_RATE_CONTROL RateControl;
    D3D12_VIDEO_ENCODER_INTRA_REFRESH_MODE IntraRefresh;
    D3D12_VIDEO_ENCODER_FRAME_SUBREGION_LAYOUT_MODE SubregionFrameEncoding;
    uint ResolutionsListCount;
    const(D3D12_VIDEO_ENCODER_PICTURE_RESOLUTION_DESC)* pResolutionList;
    uint MaxReferenceFramesInDPB;
    D3D12_VIDEO_ENCODER_VALIDATION_FLAGS ValidationFlags;
    D3D12_VIDEO_ENCODER_SUPPORT_FLAGS SupportFlags;
    D3D12_VIDEO_ENCODER_PROFILE_DESC SuggestedProfile;
    D3D12_VIDEO_ENCODER_LEVEL_SETTING SuggestedLevel;
    D3D12_FEATURE_DATA_VIDEO_ENCODER_RESOLUTION_SUPPORT_LIMITS* pResolutionDependentSupport;
}
struct D3D12_FEATURE_DATA_VIDEO_ENCODER_RESOURCE_REQUIREMENTS
{
    uint NodeIndex;
    D3D12_VIDEO_ENCODER_CODEC Codec;
    D3D12_VIDEO_ENCODER_PROFILE_DESC Profile;
    DXGI_FORMAT InputFormat;
    D3D12_VIDEO_ENCODER_PICTURE_RESOLUTION_DESC PictureTargetResolution;
    BOOL IsSupported;
    uint CompressedBitstreamBufferAccessAlignment;
    uint EncoderMetadataBufferAccessAlignment;
    uint MaxEncoderOutputMetadataBufferSize;
}
alias D3D12_VIDEO_ENCODER_FLAGS = uint;
enum : uint
{
    D3D12_VIDEO_ENCODER_FLAG_NONE = 0x00000000,
}

struct D3D12_VIDEO_ENCODER_DESC
{
    uint NodeMask;
    D3D12_VIDEO_ENCODER_FLAGS Flags;
    D3D12_VIDEO_ENCODER_CODEC EncodeCodec;
    D3D12_VIDEO_ENCODER_PROFILE_DESC EncodeProfile;
    DXGI_FORMAT InputFormat;
    D3D12_VIDEO_ENCODER_CODEC_CONFIGURATION CodecConfiguration;
    D3D12_VIDEO_ENCODER_MOTION_ESTIMATION_PRECISION_MODE MaxMotionEstimationPrecision;
}
enum IID_ID3D12VideoEncoder = GUID(0x2e0d212d, 0x8df9, 0x44a6, [0xa7, 0x70, 0xbb, 0x28, 0x9b, 0x18, 0x27, 0x37]);
interface ID3D12VideoEncoder : ID3D12Pageable
{
    uint GetNodeMask();
    D3D12_VIDEO_ENCODER_FLAGS GetEncoderFlags();
    D3D12_VIDEO_ENCODER_CODEC GetCodec();
    HRESULT GetCodecProfile(D3D12_VIDEO_ENCODER_PROFILE_DESC);
    HRESULT GetCodecConfiguration(D3D12_VIDEO_ENCODER_CODEC_CONFIGURATION);
    DXGI_FORMAT GetInputFormat();
    D3D12_VIDEO_ENCODER_MOTION_ESTIMATION_PRECISION_MODE GetMaxMotionEstimationPrecision();
}
enum IID_ID3D12VideoEncoderHeap = GUID(0x22b35d96, 0x876a, 0x44c0, [0xb2, 0x5e, 0xfb, 0x8c, 0x9c, 0x7f, 0x1c, 0x4a]);
interface ID3D12VideoEncoderHeap : ID3D12Pageable
{
    uint GetNodeMask();
    D3D12_VIDEO_ENCODER_HEAP_FLAGS GetEncoderHeapFlags();
    D3D12_VIDEO_ENCODER_CODEC GetCodec();
    HRESULT GetCodecProfile(D3D12_VIDEO_ENCODER_PROFILE_DESC);
    HRESULT GetCodecLevel(D3D12_VIDEO_ENCODER_LEVEL_SETTING);
    uint GetResolutionListCount();
    HRESULT GetResolutionList(const(uint), D3D12_VIDEO_ENCODER_PICTURE_RESOLUTION_DESC*);
}
enum IID_ID3D12VideoDevice3 = GUID(0x4243adb4, 0x3a32, 0x4666, [0x97, 0x3c, 0xc, 0xcc, 0x56, 0x25, 0xdc, 0x44]);
interface ID3D12VideoDevice3 : ID3D12VideoDevice2
{
    HRESULT CreateVideoEncoder(const(D3D12_VIDEO_ENCODER_DESC)*, const(GUID)*, void**);
    HRESULT CreateVideoEncoderHeap(const(D3D12_VIDEO_ENCODER_HEAP_DESC)*, const(GUID)*, void**);
}
alias D3D12_VIDEO_ENCODER_FRAME_TYPE_H264 = int;
enum : int
{
    D3D12_VIDEO_ENCODER_FRAME_TYPE_H264_I_FRAME   = 0x00000000,
    D3D12_VIDEO_ENCODER_FRAME_TYPE_H264_P_FRAME   = 0x00000001,
    D3D12_VIDEO_ENCODER_FRAME_TYPE_H264_B_FRAME   = 0x00000002,
    D3D12_VIDEO_ENCODER_FRAME_TYPE_H264_IDR_FRAME = 0x00000003,
}

struct D3D12_VIDEO_ENCODER_REFERENCE_PICTURE_DESCRIPTOR_H264
{
    uint ReconstructedPictureResourceIndex;
    BOOL IsLongTermReference;
    uint LongTermPictureIdx;
    uint PictureOrderCountNumber;
    uint FrameDecodingOrderNumber;
    uint TemporalLayerIndex;
}
alias D3D12_VIDEO_ENCODER_PICTURE_CONTROL_CODEC_DATA_H264_FLAGS = uint;
enum : uint
{
    D3D12_VIDEO_ENCODER_PICTURE_CONTROL_CODEC_DATA_H264_FLAG_NONE                             = 0x00000000,
    D3D12_VIDEO_ENCODER_PICTURE_CONTROL_CODEC_DATA_H264_FLAG_REQUEST_INTRA_CONSTRAINED_SLICES = 0x00000001,
}

struct D3D12_VIDEO_ENCODER_PICTURE_CONTROL_CODEC_DATA_H264_REFERENCE_PICTURE_MARKING_OPERATION
{
    ubyte memory_management_control_operation;
    uint difference_of_pic_nums_minus1;
    uint long_term_pic_num;
    uint long_term_frame_idx;
    uint max_long_term_frame_idx_plus1;
}
struct D3D12_VIDEO_ENCODER_PICTURE_CONTROL_CODEC_DATA_H264_REFERENCE_PICTURE_LIST_MODIFICATION_OPERATION
{
    ubyte modification_of_pic_nums_idc;
    uint abs_diff_pic_num_minus1;
    uint long_term_pic_num;
}
struct D3D12_VIDEO_ENCODER_PICTURE_CONTROL_CODEC_DATA_H264
{
    D3D12_VIDEO_ENCODER_PICTURE_CONTROL_CODEC_DATA_H264_FLAGS Flags;
    D3D12_VIDEO_ENCODER_FRAME_TYPE_H264 FrameType;
    uint pic_parameter_set_id;
    uint idr_pic_id;
    uint PictureOrderCountNumber;
    uint FrameDecodingOrderNumber;
    uint TemporalLayerIndex;
    uint List0ReferenceFramesCount;
    uint* pList0ReferenceFrames;
    uint List1ReferenceFramesCount;
    uint* pList1ReferenceFrames;
    uint ReferenceFramesReconPictureDescriptorsCount;
    D3D12_VIDEO_ENCODER_REFERENCE_PICTURE_DESCRIPTOR_H264* pReferenceFramesReconPictureDescriptors;
    ubyte adaptive_ref_pic_marking_mode_flag;
    uint RefPicMarkingOperationsCommandsCount;
    D3D12_VIDEO_ENCODER_PICTURE_CONTROL_CODEC_DATA_H264_REFERENCE_PICTURE_MARKING_OPERATION* pRefPicMarkingOperationsCommands;
    uint List0RefPicModificationsCount;
    D3D12_VIDEO_ENCODER_PICTURE_CONTROL_CODEC_DATA_H264_REFERENCE_PICTURE_LIST_MODIFICATION_OPERATION* pList0RefPicModifications;
    uint List1RefPicModificationsCount;
    D3D12_VIDEO_ENCODER_PICTURE_CONTROL_CODEC_DATA_H264_REFERENCE_PICTURE_LIST_MODIFICATION_OPERATION* pList1RefPicModifications;
    uint QPMapValuesCount;
    byte* pRateControlQPMap;
}
alias D3D12_VIDEO_ENCODER_FRAME_TYPE_HEVC = int;
enum : int
{
    D3D12_VIDEO_ENCODER_FRAME_TYPE_HEVC_I_FRAME   = 0x00000000,
    D3D12_VIDEO_ENCODER_FRAME_TYPE_HEVC_P_FRAME   = 0x00000001,
    D3D12_VIDEO_ENCODER_FRAME_TYPE_HEVC_B_FRAME   = 0x00000002,
    D3D12_VIDEO_ENCODER_FRAME_TYPE_HEVC_IDR_FRAME = 0x00000003,
}

struct D3D12_VIDEO_ENCODER_REFERENCE_PICTURE_DESCRIPTOR_HEVC
{
    uint ReconstructedPictureResourceIndex;
    BOOL IsRefUsedByCurrentPic;
    BOOL IsLongTermReference;
    uint PictureOrderCountNumber;
    uint TemporalLayerIndex;
}
alias D3D12_VIDEO_ENCODER_PICTURE_CONTROL_CODEC_DATA_HEVC_FLAGS = uint;
enum : uint
{
    D3D12_VIDEO_ENCODER_PICTURE_CONTROL_CODEC_DATA_HEVC_FLAG_NONE                             = 0x00000000,
    D3D12_VIDEO_ENCODER_PICTURE_CONTROL_CODEC_DATA_HEVC_FLAG_REQUEST_INTRA_CONSTRAINED_SLICES = 0x00000001,
}

struct D3D12_VIDEO_ENCODER_PICTURE_CONTROL_CODEC_DATA_HEVC
{
    D3D12_VIDEO_ENCODER_PICTURE_CONTROL_CODEC_DATA_HEVC_FLAGS Flags;
    D3D12_VIDEO_ENCODER_FRAME_TYPE_HEVC FrameType;
    uint slice_pic_parameter_set_id;
    uint PictureOrderCountNumber;
    uint TemporalLayerIndex;
    uint List0ReferenceFramesCount;
    uint* pList0ReferenceFrames;
    uint List1ReferenceFramesCount;
    uint* pList1ReferenceFrames;
    uint ReferenceFramesReconPictureDescriptorsCount;
    D3D12_VIDEO_ENCODER_REFERENCE_PICTURE_DESCRIPTOR_HEVC* pReferenceFramesReconPictureDescriptors;
    uint List0RefPicModificationsCount;
    uint* pList0RefPicModifications;
    uint List1RefPicModificationsCount;
    uint* pList1RefPicModifications;
    uint QPMapValuesCount;
    byte* pRateControlQPMap;
}
struct D3D12_VIDEO_ENCODER_PICTURE_CONTROL_CODEC_DATA
{
    uint DataSize;
    union
    {
        D3D12_VIDEO_ENCODER_PICTURE_CONTROL_CODEC_DATA_H264* pH264PicData;
        D3D12_VIDEO_ENCODER_PICTURE_CONTROL_CODEC_DATA_HEVC* pHEVCPicData;
    }
}
struct D3D12_VIDEO_ENCODE_REFERENCE_FRAMES
{
    uint NumTexture2Ds;
    ID3D12Resource* ppTexture2Ds;
    uint* pSubresources;
}
alias D3D12_VIDEO_ENCODER_PICTURE_CONTROL_FLAGS = uint;
enum : uint
{
    D3D12_VIDEO_ENCODER_PICTURE_CONTROL_FLAG_NONE                      = 0x00000000,
    D3D12_VIDEO_ENCODER_PICTURE_CONTROL_FLAG_USED_AS_REFERENCE_PICTURE = 0x00000001,
}

struct D3D12_VIDEO_ENCODER_PICTURE_CONTROL_DESC
{
    uint IntraRefreshFrameIndex;
    D3D12_VIDEO_ENCODER_PICTURE_CONTROL_FLAGS Flags;
    D3D12_VIDEO_ENCODER_PICTURE_CONTROL_CODEC_DATA PictureControlCodecData;
    D3D12_VIDEO_ENCODE_REFERENCE_FRAMES ReferenceFrames;
}
alias D3D12_VIDEO_ENCODER_SEQUENCE_CONTROL_FLAGS = uint;
enum : uint
{
    D3D12_VIDEO_ENCODER_SEQUENCE_CONTROL_FLAG_NONE                    = 0x00000000,
    D3D12_VIDEO_ENCODER_SEQUENCE_CONTROL_FLAG_RESOLUTION_CHANGE       = 0x00000001,
    D3D12_VIDEO_ENCODER_SEQUENCE_CONTROL_FLAG_RATE_CONTROL_CHANGE     = 0x00000002,
    D3D12_VIDEO_ENCODER_SEQUENCE_CONTROL_FLAG_SUBREGION_LAYOUT_CHANGE = 0x00000004,
    D3D12_VIDEO_ENCODER_SEQUENCE_CONTROL_FLAG_REQUEST_INTRA_REFRESH   = 0x00000008,
    D3D12_VIDEO_ENCODER_SEQUENCE_CONTROL_FLAG_GOP_SEQUENCE_CHANGE     = 0x00000010,
}

struct D3D12_VIDEO_ENCODER_PICTURE_CONTROL_SUBREGIONS_LAYOUT_DATA_SLICES
{
    union
    {
        uint MaxBytesPerSlice;
        uint NumberOfCodingUnitsPerSlice;
        uint NumberOfRowsPerSlice;
        uint NumberOfSlicesPerFrame;
    }
}
struct D3D12_VIDEO_ENCODER_PICTURE_CONTROL_SUBREGIONS_LAYOUT_DATA
{
    uint DataSize;
    union
    {
        const(D3D12_VIDEO_ENCODER_PICTURE_CONTROL_SUBREGIONS_LAYOUT_DATA_SLICES)* pSlicesPartition_H264;
        const(D3D12_VIDEO_ENCODER_PICTURE_CONTROL_SUBREGIONS_LAYOUT_DATA_SLICES)* pSlicesPartition_HEVC;
    }
}
struct D3D12_VIDEO_ENCODER_SEQUENCE_CONTROL_DESC
{
    D3D12_VIDEO_ENCODER_SEQUENCE_CONTROL_FLAGS Flags;
    D3D12_VIDEO_ENCODER_INTRA_REFRESH IntraRefreshConfig;
    D3D12_VIDEO_ENCODER_RATE_CONTROL RateControl;
    D3D12_VIDEO_ENCODER_PICTURE_RESOLUTION_DESC PictureTargetResolution;
    D3D12_VIDEO_ENCODER_FRAME_SUBREGION_LAYOUT_MODE SelectedLayoutMode;
    D3D12_VIDEO_ENCODER_PICTURE_CONTROL_SUBREGIONS_LAYOUT_DATA FrameSubregionsLayoutData;
    D3D12_VIDEO_ENCODER_SEQUENCE_GOP_STRUCTURE CodecGopSequence;
}
struct D3D12_VIDEO_ENCODER_ENCODEFRAME_INPUT_ARGUMENTS
{
    D3D12_VIDEO_ENCODER_SEQUENCE_CONTROL_DESC SequenceControlDesc;
    D3D12_VIDEO_ENCODER_PICTURE_CONTROL_DESC PictureControlDesc;
    ID3D12Resource pInputFrame;
    uint InputFrameSubresource;
    uint CurrentFrameBitstreamMetadataSize;
}
struct D3D12_VIDEO_ENCODER_COMPRESSED_BITSTREAM
{
    ID3D12Resource pBuffer;
    ulong FrameStartOffset;
}
struct D3D12_VIDEO_ENCODER_RECONSTRUCTED_PICTURE
{
    ID3D12Resource pReconstructedPicture;
    uint ReconstructedPictureSubresource;
}
struct D3D12_VIDEO_ENCODER_FRAME_SUBREGION_METADATA
{
    ulong bSize;
    ulong bStartOffset;
    ulong bHeaderSize;
}
alias D3D12_VIDEO_ENCODER_ENCODE_ERROR_FLAGS = uint;
enum : uint
{
    D3D12_VIDEO_ENCODER_ENCODE_ERROR_FLAG_NO_ERROR                                     = 0x00000000,
    D3D12_VIDEO_ENCODER_ENCODE_ERROR_FLAG_CODEC_PICTURE_CONTROL_NOT_SUPPORTED          = 0x00000001,
    D3D12_VIDEO_ENCODER_ENCODE_ERROR_FLAG_SUBREGION_LAYOUT_CONFIGURATION_NOT_SUPPORTED = 0x00000002,
    D3D12_VIDEO_ENCODER_ENCODE_ERROR_FLAG_INVALID_REFERENCE_PICTURES                   = 0x00000004,
    D3D12_VIDEO_ENCODER_ENCODE_ERROR_FLAG_RECONFIGURATION_REQUEST_NOT_SUPPORTED        = 0x00000008,
    D3D12_VIDEO_ENCODER_ENCODE_ERROR_FLAG_INVALID_METADATA_BUFFER_SOURCE               = 0x00000010,
}

struct D3D12_VIDEO_ENCODER_OUTPUT_METADATA_STATISTICS
{
    ulong AverageQP;
    ulong IntraCodingUnitsCount;
    ulong InterCodingUnitsCount;
    ulong SkipCodingUnitsCount;
    ulong AverageMotionEstimationXDirection;
    ulong AverageMotionEstimationYDirection;
}
struct D3D12_VIDEO_ENCODER_OUTPUT_METADATA
{
    ulong EncodeErrorFlags;
    D3D12_VIDEO_ENCODER_OUTPUT_METADATA_STATISTICS EncodeStats;
    ulong EncodedBitstreamWrittenBytesCount;
    ulong WrittenSubregionsCount;
}
struct D3D12_VIDEO_ENCODER_ENCODE_OPERATION_METADATA_BUFFER
{
    ID3D12Resource pBuffer;
    ulong Offset;
}
struct D3D12_VIDEO_ENCODER_RESOLVE_METADATA_INPUT_ARGUMENTS
{
    D3D12_VIDEO_ENCODER_CODEC EncoderCodec;
    D3D12_VIDEO_ENCODER_PROFILE_DESC EncoderProfile;
    DXGI_FORMAT EncoderInputFormat;
    D3D12_VIDEO_ENCODER_PICTURE_RESOLUTION_DESC EncodedPictureEffectiveResolution;
    D3D12_VIDEO_ENCODER_ENCODE_OPERATION_METADATA_BUFFER HWLayoutMetadata;
}
struct D3D12_VIDEO_ENCODER_RESOLVE_METADATA_OUTPUT_ARGUMENTS
{
    D3D12_VIDEO_ENCODER_ENCODE_OPERATION_METADATA_BUFFER ResolvedLayoutMetadata;
}
struct D3D12_VIDEO_ENCODER_ENCODEFRAME_OUTPUT_ARGUMENTS
{
    D3D12_VIDEO_ENCODER_COMPRESSED_BITSTREAM Bitstream;
    D3D12_VIDEO_ENCODER_RECONSTRUCTED_PICTURE ReconstructedPicture;
    D3D12_VIDEO_ENCODER_ENCODE_OPERATION_METADATA_BUFFER EncoderOutputMetadata;
}
enum IID_ID3D12VideoEncodeCommandList2 = GUID(0x895491e2, 0xe701, 0x46a9, [0x9a, 0x1f, 0x8d, 0x34, 0x80, 0xed, 0x86, 0x7a]);
interface ID3D12VideoEncodeCommandList2 : ID3D12VideoEncodeCommandList1
{
    void EncodeFrame(ID3D12VideoEncoder, ID3D12VideoEncoderHeap, const(D3D12_VIDEO_ENCODER_ENCODEFRAME_INPUT_ARGUMENTS)*, const(D3D12_VIDEO_ENCODER_ENCODEFRAME_OUTPUT_ARGUMENTS)*);
    void ResolveEncoderOutputMetadata(const(D3D12_VIDEO_ENCODER_RESOLVE_METADATA_INPUT_ARGUMENTS)*, const(D3D12_VIDEO_ENCODER_RESOLVE_METADATA_OUTPUT_ARGUMENTS)*);
}
enum CLSID_CMpeg4DecMediaObject = GUID(0xf371728a, 0x6052, 0x4d47, [0x82, 0x7c, 0xd0, 0x39, 0x33, 0x5d, 0xfe, 0xa]);
struct CMpeg4DecMediaObject
{
}
enum CLSID_CMpeg43DecMediaObject = GUID(0xcba9e78b, 0x49a3, 0x49ea, [0x93, 0xd4, 0x6b, 0xcb, 0xa8, 0xc4, 0xde, 0x7]);
struct CMpeg43DecMediaObject
{
}
enum CLSID_CMpeg4sDecMediaObject = GUID(0x2a11bae2, 0xfe6e, 0x4249, [0x86, 0x4b, 0x9e, 0x9e, 0xd6, 0xe8, 0xdb, 0xc2]);
struct CMpeg4sDecMediaObject
{
}
enum CLSID_CMpeg4sDecMFT = GUID(0x5686a0d9, 0xfe39, 0x409f, [0x9d, 0xff, 0x3f, 0xdb, 0xc8, 0x49, 0xf9, 0xf5]);
struct CMpeg4sDecMFT
{
}
enum CLSID_CZuneM4S2DecMediaObject = GUID(0xc56fc25c, 0xfc6, 0x404a, [0x95, 0x3, 0xb1, 0xb, 0xf5, 0x1a, 0x8a, 0xb9]);
struct CZuneM4S2DecMediaObject
{
}
enum CLSID_CMpeg4EncMediaObject = GUID(0x24f258d8, 0xc651, 0x4042, [0x93, 0xe4, 0xca, 0x65, 0x4a, 0xbb, 0x68, 0x2c]);
struct CMpeg4EncMediaObject
{
}
enum CLSID_CMpeg4sEncMediaObject = GUID(0x6ec5a7be, 0xd81e, 0x4f9e, [0xad, 0xa3, 0xcd, 0x1b, 0xf2, 0x62, 0xb6, 0xd8]);
struct CMpeg4sEncMediaObject
{
}
enum CLSID_CMSSCDecMediaObject = GUID(0x7bafb3b1, 0xd8f4, 0x4279, [0x92, 0x53, 0x27, 0xda, 0x42, 0x31, 0x8, 0xde]);
struct CMSSCDecMediaObject
{
}
enum CLSID_CMSSCEncMediaObject = GUID(0x8cb9cc06, 0xd139, 0x4ae6, [0x8b, 0xb4, 0x41, 0xe6, 0x12, 0xe1, 0x41, 0xd5]);
struct CMSSCEncMediaObject
{
}
enum CLSID_CMSSCEncMediaObject2 = GUID(0xf7ffe0a0, 0xa4f5, 0x44b5, [0x94, 0x9e, 0x15, 0xed, 0x2b, 0xc6, 0x6f, 0x9d]);
struct CMSSCEncMediaObject2
{
}
enum CLSID_CWMADecMediaObject = GUID(0x2eeb4adf, 0x4578, 0x4d10, [0xbc, 0xa7, 0xbb, 0x95, 0x5f, 0x56, 0x32, 0xa]);
struct CWMADecMediaObject
{
}
enum CLSID_CWMAEncMediaObject = GUID(0x70f598e9, 0xf4ab, 0x495a, [0x99, 0xe2, 0xa7, 0xc4, 0xd3, 0xd8, 0x9a, 0xbf]);
struct CWMAEncMediaObject
{
}
enum CLSID_CWMATransMediaObject = GUID(0xedcad9cb, 0x3127, 0x40df, [0xb5, 0x27, 0x1, 0x52, 0xcc, 0xb3, 0xf6, 0xf5]);
struct CWMATransMediaObject
{
}
enum CLSID_CWMSPDecMediaObject = GUID(0x874131cb, 0x4ecc, 0x443b, [0x89, 0x48, 0x74, 0x6b, 0x89, 0x59, 0x5d, 0x20]);
struct CWMSPDecMediaObject
{
}
enum CLSID_CWMSPEncMediaObject = GUID(0x67841b03, 0xc689, 0x4188, [0xad, 0x3f, 0x4c, 0x9e, 0xbe, 0xec, 0x71, 0xb]);
struct CWMSPEncMediaObject
{
}
enum CLSID_CWMSPEncMediaObject2 = GUID(0x1f1f4e1a, 0x2252, 0x4063, [0x84, 0xbb, 0xee, 0xe7, 0x5f, 0x88, 0x56, 0xd5]);
struct CWMSPEncMediaObject2
{
}
enum CLSID_CWMTDecMediaObject = GUID(0xf9dbc64e, 0x2dd0, 0x45dd, [0x9b, 0x52, 0x66, 0x64, 0x2e, 0xf9, 0x44, 0x31]);
struct CWMTDecMediaObject
{
}
enum CLSID_CWMTEncMediaObject = GUID(0x60b67652, 0xe46b, 0x4e44, [0x86, 0x9, 0xf7, 0x4b, 0xff, 0xdc, 0x8, 0x3c]);
struct CWMTEncMediaObject
{
}
enum CLSID_CWMVDecMediaObject = GUID(0x82d353df, 0x90bd, 0x4382, [0x8b, 0xc2, 0x3f, 0x61, 0x92, 0xb7, 0x6e, 0x34]);
struct CWMVDecMediaObject
{
}
enum CLSID_CWMVEncMediaObject2 = GUID(0x96b57cdd, 0x8966, 0x410c, [0xbb, 0x1f, 0xc9, 0x7e, 0xea, 0x76, 0x5c, 0x4]);
struct CWMVEncMediaObject2
{
}
enum CLSID_CWMVXEncMediaObject = GUID(0x7e320092, 0x596a, 0x41b2, [0xbb, 0xeb, 0x17, 0x5d, 0x10, 0x50, 0x4e, 0xb6]);
struct CWMVXEncMediaObject
{
}
enum CLSID_CWMV9EncMediaObject = GUID(0xd23b90d0, 0x144f, 0x46bd, [0x84, 0x1d, 0x59, 0xe4, 0xeb, 0x19, 0xdc, 0x59]);
struct CWMV9EncMediaObject
{
}
enum CLSID_CWVC1DecMediaObject = GUID(0xc9bfbccf, 0xe60e, 0x4588, [0xa3, 0xdf, 0x5a, 0x3, 0xb1, 0xfd, 0x95, 0x85]);
struct CWVC1DecMediaObject
{
}
enum CLSID_CWVC1EncMediaObject = GUID(0x44653d0d, 0x8cca, 0x41e7, [0xba, 0xca, 0x88, 0x43, 0x37, 0xb7, 0x47, 0xac]);
struct CWVC1EncMediaObject
{
}
enum CLSID_CDeColorConvMediaObject = GUID(0x49034c05, 0xf43c, 0x400f, [0x84, 0xc1, 0x90, 0xa6, 0x83, 0x19, 0x5a, 0x3a]);
struct CDeColorConvMediaObject
{
}
enum CLSID_CDVDecoderMediaObject = GUID(0xe54709c5, 0x1e17, 0x4c8d, [0x94, 0xe7, 0x47, 0x89, 0x40, 0x43, 0x35, 0x84]);
struct CDVDecoderMediaObject
{
}
enum CLSID_CDVEncoderMediaObject = GUID(0xc82ae729, 0xc327, 0x4cce, [0x91, 0x4d, 0x81, 0x71, 0xfe, 0xfe, 0xbe, 0xfb]);
struct CDVEncoderMediaObject
{
}
enum CLSID_CMpeg2DecMediaObject = GUID(0x863d66cd, 0xcdce, 0x4617, [0xb4, 0x7f, 0xc8, 0x92, 0x9c, 0xfc, 0x28, 0xa6]);
struct CMpeg2DecMediaObject
{
}
enum CLSID_CPK_DS_MPEG2Decoder = GUID(0x9910c5cd, 0x95c9, 0x4e06, [0x86, 0x5a, 0xef, 0xa1, 0xc8, 0x1, 0x6b, 0xf4]);
struct CPK_DS_MPEG2Decoder
{
}
enum CLSID_CAC3DecMediaObject = GUID(0x3d7c802, 0xecfa, 0x47d9, [0xb2, 0x68, 0x5f, 0xb3, 0xe3, 0x10, 0xde, 0xe4]);
struct CAC3DecMediaObject
{
}
enum CLSID_CPK_DS_AC3Decoder = GUID(0x6c9c69d6, 0xffc, 0x4481, [0xaf, 0xdb, 0xcd, 0xf1, 0xc7, 0x9c, 0x6f, 0x3e]);
struct CPK_DS_AC3Decoder
{
}
enum CLSID_CMP3DecMediaObject = GUID(0xbbeea841, 0xa63, 0x4f52, [0xa7, 0xab, 0xa9, 0xb3, 0xa8, 0x4e, 0xd3, 0x8a]);
struct CMP3DecMediaObject
{
}
enum CLSID_CResamplerMediaObject = GUID(0xf447b69e, 0x1884, 0x4a7e, [0x80, 0x55, 0x34, 0x6f, 0x74, 0xd6, 0xed, 0xb3]);
struct CResamplerMediaObject
{
}
enum CLSID_CResizerMediaObject = GUID(0xd3ec8b8b, 0x7728, 0x4fd8, [0x9f, 0xe0, 0x7b, 0x67, 0xd1, 0x9f, 0x73, 0xa3]);
struct CResizerMediaObject
{
}
enum CLSID_CInterlaceMediaObject = GUID(0xb5a89c80, 0x4901, 0x407b, [0x9a, 0xbc, 0x90, 0xd9, 0xa6, 0x44, 0xbb, 0x46]);
struct CInterlaceMediaObject
{
}
enum CLSID_CWMAudioLFXAPO = GUID(0x62dc1a93, 0xae24, 0x464c, [0xa4, 0x3e, 0x45, 0x2f, 0x82, 0x4c, 0x42, 0x50]);
struct CWMAudioLFXAPO
{
}
enum CLSID_CWMAudioGFXAPO = GUID(0x637c490d, 0xeee3, 0x4c0a, [0x97, 0x3f, 0x37, 0x19, 0x58, 0x80, 0x2d, 0xa2]);
struct CWMAudioGFXAPO
{
}
enum CLSID_CWMAudioCAPXLFXAPO = GUID(0xc9453e73, 0x8c5c, 0x4463, [0x99, 0x84, 0xaf, 0x8b, 0xab, 0x2f, 0x54, 0x47]);
struct CWMAudioCAPXLFXAPO
{
}
enum CLSID_CWMAudioCAPXGFXAPO = GUID(0x13ab3ebd, 0x137e, 0x4903, [0x9d, 0x89, 0x60, 0xbe, 0x82, 0x77, 0xfd, 0x17]);
struct CWMAudioCAPXGFXAPO
{
}
enum CLSID_CWMAudioSpdTxDMO = GUID(0x5210f8e4, 0xb0bb, 0x47c3, [0xa8, 0xd9, 0x7b, 0x22, 0x82, 0xcc, 0x79, 0xed]);
struct CWMAudioSpdTxDMO
{
}
enum CLSID_CWMAudioAEC = GUID(0x745057c7, 0xf353, 0x4f2d, [0xa7, 0xee, 0x58, 0x43, 0x44, 0x77, 0x73, 0xe]);
struct CWMAudioAEC
{
}
enum CLSID_CClusterDetectorDmo = GUID(0x36e820c4, 0x165a, 0x4521, [0x86, 0x3c, 0x61, 0x9e, 0x11, 0x60, 0xd4, 0xd4]);
struct CClusterDetectorDmo
{
}
enum CLSID_CColorControlDmo = GUID(0x798059f0, 0x89ca, 0x4160, [0xb3, 0x25, 0xae, 0xb4, 0x8e, 0xfe, 0x4f, 0x9a]);
struct CColorControlDmo
{
}
enum CLSID_CColorConvertDMO = GUID(0x98230571, 0x87, 0x4204, [0xb0, 0x20, 0x32, 0x82, 0x53, 0x8e, 0x57, 0xd3]);
struct CColorConvertDMO
{
}
enum CLSID_CColorLegalizerDmo = GUID(0xfdfaa753, 0xe48e, 0x4e33, [0x9c, 0x74, 0x98, 0xa2, 0x7f, 0xc6, 0x72, 0x6a]);
struct CColorLegalizerDmo
{
}
enum CLSID_CFrameInterpDMO = GUID(0xa7cfe1b, 0x6ab5, 0x4334, [0x9e, 0xd8, 0x3f, 0x97, 0xcb, 0x37, 0xda, 0xa1]);
struct CFrameInterpDMO
{
}
enum CLSID_CFrameRateConvertDmo = GUID(0x1f36ce2, 0x907, 0x4d8b, [0x97, 0x9d, 0xf1, 0x51, 0xbe, 0x91, 0xc8, 0x83]);
struct CFrameRateConvertDmo
{
}
enum CLSID_CResizerDMO = GUID(0x1ea1ea14, 0x48f4, 0x4054, [0xad, 0x1a, 0xe8, 0xae, 0xe1, 0xa, 0xc8, 0x5]);
struct CResizerDMO
{
}
enum CLSID_CShotDetectorDmo = GUID(0x56aefacd, 0x110c, 0x4397, [0x92, 0x92, 0xb0, 0xa0, 0xc6, 0x1b, 0x67, 0x50]);
struct CShotDetectorDmo
{
}
enum CLSID_CSmpteTransformsDmo = GUID(0xbde6388b, 0xda25, 0x485d, [0xba, 0x7f, 0xfa, 0xbc, 0x28, 0xb2, 0x3, 0x18]);
struct CSmpteTransformsDmo
{
}
enum CLSID_CThumbnailGeneratorDmo = GUID(0x559c6bad, 0x1ea8, 0x4963, [0xa0, 0x87, 0x8a, 0x68, 0x10, 0xf9, 0x21, 0x8b]);
struct CThumbnailGeneratorDmo
{
}
enum CLSID_CTocGeneratorDmo = GUID(0x4dda1941, 0x77a0, 0x4fb1, [0xa5, 0x18, 0xe2, 0x18, 0x50, 0x41, 0xd7, 0xc]);
struct CTocGeneratorDmo
{
}
enum CLSID_CMPEGAACDecMediaObject = GUID(0x8dde1772, 0xedad, 0x41c3, [0xb4, 0xbe, 0x1f, 0x30, 0xfb, 0x4e, 0xe0, 0xd6]);
struct CMPEGAACDecMediaObject
{
}
enum CLSID_CNokiaAACDecMediaObject = GUID(0x3cb2bde4, 0x4e29, 0x4c44, [0xa7, 0x3e, 0x2d, 0x7c, 0x2c, 0x46, 0xd6, 0xec]);
struct CNokiaAACDecMediaObject
{
}
enum CLSID_CVodafoneAACDecMediaObject = GUID(0x7f36f942, 0xdcf3, 0x4d82, [0x92, 0x89, 0x5b, 0x18, 0x20, 0x27, 0x8f, 0x7c]);
struct CVodafoneAACDecMediaObject
{
}
enum CLSID_CZuneAACCCDecMediaObject = GUID(0xa74e98f2, 0x52d6, 0x4b4e, [0x88, 0x5b, 0xe0, 0xa6, 0xca, 0x4f, 0x18, 0x7a]);
struct CZuneAACCCDecMediaObject
{
}
enum CLSID_CNokiaAACCCDecMediaObject = GUID(0xeabf7a6f, 0xccba, 0x4d60, [0x86, 0x20, 0xb1, 0x52, 0xcc, 0x97, 0x72, 0x63]);
struct CNokiaAACCCDecMediaObject
{
}
enum CLSID_CVodafoneAACCCDecMediaObject = GUID(0x7e76bf7f, 0xc993, 0x4e26, [0x8f, 0xab, 0x47, 0xa, 0x70, 0xc0, 0xd5, 0x9c]);
struct CVodafoneAACCCDecMediaObject
{
}
enum CLSID_CMPEG2EncoderDS = GUID(0x5f5aff4a, 0x2f7f, 0x4279, [0x88, 0xc2, 0xcd, 0x88, 0xeb, 0x39, 0xd1, 0x44]);
struct CMPEG2EncoderDS
{
}
enum CLSID_CMPEG2EncoderVideoDS = GUID(0x42150cd9, 0xca9a, 0x4ea5, [0x99, 0x39, 0x30, 0xee, 0x3, 0x7f, 0x6e, 0x74]);
struct CMPEG2EncoderVideoDS
{
}
enum CLSID_CMPEG2EncoderAudioDS = GUID(0xacd453bc, 0xc58a, 0x44d1, [0xbb, 0xf5, 0xbf, 0xb3, 0x25, 0xbe, 0x2d, 0x78]);
struct CMPEG2EncoderAudioDS
{
}
enum CLSID_CMPEG2AudDecoderDS = GUID(0xe1f1a0b8, 0xbeee, 0x490d, [0xba, 0x7c, 0x6, 0x6c, 0x40, 0xb5, 0xe2, 0xb9]);
struct CMPEG2AudDecoderDS
{
}
enum CLSID_CMPEG2VidDecoderDS = GUID(0x212690fb, 0x83e5, 0x4526, [0x8f, 0xd7, 0x74, 0x47, 0x8b, 0x79, 0x39, 0xcd]);
struct CMPEG2VidDecoderDS
{
}
enum CLSID_CDTVAudDecoderDS = GUID(0x8e269032, 0xfe03, 0x4753, [0x9b, 0x17, 0x18, 0x25, 0x3c, 0x21, 0x72, 0x2e]);
struct CDTVAudDecoderDS
{
}
enum CLSID_CDTVVidDecoderDS = GUID(0x64777dc8, 0x4e24, 0x4beb, [0x9d, 0x19, 0x60, 0xa3, 0x5b, 0xe1, 0xda, 0xaf]);
struct CDTVVidDecoderDS
{
}
enum CLSID_CMSAC3Enc = GUID(0xc6b400e2, 0x20a7, 0x4e58, [0xa2, 0xfe, 0x24, 0x61, 0x96, 0x82, 0xce, 0x6c]);
struct CMSAC3Enc
{
}
enum CLSID_CMSH264DecoderMFT = GUID(0x62ce7e72, 0x4c71, 0x4d20, [0xb1, 0x5d, 0x45, 0x28, 0x31, 0xa8, 0x7d, 0x9d]);
struct CMSH264DecoderMFT
{
}
enum CLSID_CMSH263EncoderMFT = GUID(0xbc47fcfe, 0x98a0, 0x4f27, [0xbb, 0x7, 0x69, 0x8a, 0xf2, 0x4f, 0x2b, 0x38]);
struct CMSH263EncoderMFT
{
}
enum CLSID_CMSH264EncoderMFT = GUID(0x6ca50344, 0x51a, 0x4ded, [0x97, 0x79, 0xa4, 0x33, 0x5, 0x16, 0x5e, 0x35]);
struct CMSH264EncoderMFT
{
}
enum CLSID_CMSH265EncoderMFT = GUID(0xf2f84074, 0x8bca, 0x40bd, [0x91, 0x59, 0xe8, 0x80, 0xf6, 0x73, 0xdd, 0x3b]);
struct CMSH265EncoderMFT
{
}
enum CLSID_CMSVPXEncoderMFT = GUID(0xaeb6c755, 0x2546, 0x4881, [0x82, 0xcc, 0xe1, 0x5a, 0xe5, 0xeb, 0xff, 0x3d]);
struct CMSVPXEncoderMFT
{
}
enum CLSID_CMSH264RemuxMFT = GUID(0x5a47ebb, 0x8bf0, 0x4cbf, [0xad, 0x2f, 0x3b, 0x71, 0xd7, 0x58, 0x66, 0xf5]);
struct CMSH264RemuxMFT
{
}
enum CLSID_CMSAACDecMFT = GUID(0x32d186a7, 0x218f, 0x4c75, [0x88, 0x76, 0xdd, 0x77, 0x27, 0x3a, 0x89, 0x99]);
struct CMSAACDecMFT
{
}
enum CLSID_AACMFTEncoder = GUID(0x93af0c51, 0x2275, 0x45d2, [0xa3, 0x5b, 0xf2, 0xba, 0x21, 0xca, 0xed, 0x0]);
struct AACMFTEncoder
{
}
enum CLSID_CMSDDPlusDecMFT = GUID(0x177c0afe, 0x900b, 0x48d4, [0x9e, 0x4c, 0x57, 0xad, 0xd2, 0x50, 0xb3, 0xd4]);
struct CMSDDPlusDecMFT
{
}
enum CLSID_CMPEG2VideoEncoderMFT = GUID(0xe6335f02, 0x80b7, 0x4dc4, [0xad, 0xfa, 0xdf, 0xe7, 0x21, 0xd, 0x20, 0xd5]);
struct CMPEG2VideoEncoderMFT
{
}
enum CLSID_CMPEG2AudioEncoderMFT = GUID(0x46a4dd5c, 0x73f8, 0x4304, [0x94, 0xdf, 0x30, 0x8f, 0x76, 0x9, 0x74, 0xf4]);
struct CMPEG2AudioEncoderMFT
{
}
enum CLSID_CMSMPEGDecoderMFT = GUID(0x2d709e52, 0x123f, 0x49b5, [0x9c, 0xbc, 0x9a, 0xf5, 0xcd, 0xe2, 0x8f, 0xb9]);
struct CMSMPEGDecoderMFT
{
}
enum CLSID_CMSMPEGAudDecMFT = GUID(0x70707b39, 0xb2ca, 0x4015, [0xab, 0xea, 0xf8, 0x44, 0x7d, 0x22, 0xd8, 0x8b]);
struct CMSMPEGAudDecMFT
{
}
enum CLSID_CMSDolbyDigitalEncMFT = GUID(0xac3315c9, 0xf481, 0x45d7, [0x82, 0x6c, 0xb, 0x40, 0x6c, 0x1f, 0x64, 0xb8]);
struct CMSDolbyDigitalEncMFT
{
}
enum CLSID_MP3ACMCodecWrapper = GUID(0x11103421, 0x354c, 0x4cca, [0xa7, 0xa3, 0x1a, 0xff, 0x9a, 0x5b, 0x67, 0x1]);
struct MP3ACMCodecWrapper
{
}
enum CLSID_ALawCodecWrapper = GUID(0x36cb6e0c, 0x78c1, 0x42b2, [0x99, 0x43, 0x84, 0x62, 0x62, 0xf3, 0x17, 0x86]);
struct ALawCodecWrapper
{
}
enum CLSID_MULawCodecWrapper = GUID(0x92b66080, 0x5e2d, 0x449e, [0x90, 0xc4, 0xc4, 0x1f, 0x26, 0x8e, 0x55, 0x14]);
struct MULawCodecWrapper
{
}
enum CLSID_CMSVideoDSPMFT = GUID(0x51571744, 0x7fe4, 0x4ff2, [0xa4, 0x98, 0x2d, 0xc3, 0x4f, 0xf7, 0x4f, 0x1b]);
struct CMSVideoDSPMFT
{
}
enum CLSID_VorbisDecoderMFT = GUID(0x1a198ef2, 0x60e5, 0x4ea8, [0x90, 0xd8, 0xda, 0x1f, 0x28, 0x32, 0xc2, 0x88]);
struct VorbisDecoderMFT
{
}
enum CLSID_CMSFLACDecMFT = GUID(0x6b0b3e6b, 0xa2c5, 0x4514, [0x80, 0x55, 0xaf, 0xe8, 0xa9, 0x52, 0x42, 0xd9]);
struct CMSFLACDecMFT
{
}
enum CLSID_CMSFLACEncMFT = GUID(0x128509e9, 0xc44e, 0x45dc, [0x95, 0xe9, 0xc2, 0x55, 0xb8, 0xf4, 0x66, 0xa6]);
struct CMSFLACEncMFT
{
}
enum CLSID_MFFLACBytestreamHandler = GUID(0xe41cfb8, 0x506, 0x40f4, [0xa5, 0x16, 0x77, 0xcc, 0x23, 0x64, 0x2d, 0x91]);
struct MFFLACBytestreamHandler
{
}
enum CLSID_MFFLACSinkClassFactory = GUID(0x7d39c56f, 0x6075, 0x47c9, [0x9b, 0xae, 0x8c, 0xf9, 0xe5, 0x31, 0xb5, 0xf5]);
struct MFFLACSinkClassFactory
{
}
enum CLSID_CMSALACDecMFT = GUID(0xc0cd7d12, 0x31fc, 0x4bbc, [0xb3, 0x63, 0x73, 0x22, 0xee, 0x3e, 0x18, 0x79]);
struct CMSALACDecMFT
{
}
enum CLSID_CMSALACEncMFT = GUID(0x9ab6a28c, 0x748e, 0x4b6a, [0xbf, 0xff, 0xcc, 0x44, 0x3b, 0x8e, 0x8f, 0xb4]);
struct CMSALACEncMFT
{
}
enum CLSID_CMSOpusDecMFT = GUID(0x63e17c10, 0x2d43, 0x4c42, [0x8f, 0xe3, 0x8d, 0x8b, 0x63, 0xe4, 0x6a, 0x6a]);
struct CMSOpusDecMFT
{
}
enum CLSID_MSAMRNBDecoder = GUID(0x265011ae, 0x5481, 0x4f77, [0xa2, 0x95, 0xab, 0xb6, 0xff, 0xe8, 0xd6, 0x3e]);
struct MSAMRNBDecoder
{
}
enum CLSID_MSAMRNBEncoder = GUID(0x2fae8afe, 0x4a3, 0x423a, [0xa8, 0x14, 0x85, 0xdb, 0x45, 0x47, 0x12, 0xb0]);
struct MSAMRNBEncoder
{
}
enum CLSID_MFAMRNBByteStreamHandler = GUID(0xefe6208a, 0xa2c, 0x49fa, [0x8a, 0x1, 0x37, 0x68, 0xb5, 0x59, 0xb6, 0xda]);
struct MFAMRNBByteStreamHandler
{
}
enum CLSID_MFAMRNBSinkClassFactory = GUID(0xb0271158, 0x70d2, 0x4c5b, [0x9f, 0x94, 0x76, 0xf5, 0x49, 0xd9, 0xf, 0xdf]);
struct MFAMRNBSinkClassFactory
{
}
alias WMT_PROP_DATATYPE = int;
enum : int
{
    WMT_PROP_TYPE_DWORD  = 0x00000000,
    WMT_PROP_TYPE_STRING = 0x00000001,
    WMT_PROP_TYPE_BINARY = 0x00000002,
    WMT_PROP_TYPE_BOOL   = 0x00000003,
    WMT_PROP_TYPE_QWORD  = 0x00000004,
    WMT_PROP_TYPE_WORD   = 0x00000005,
    WMT_PROP_TYPE_GUID   = 0x00000006,
}

enum IID_IWMValidate = GUID(0xcee3def2, 0x3808, 0x414d, [0xbe, 0x66, 0xfa, 0xfd, 0x47, 0x22, 0x10, 0xbc]);
interface IWMValidate : IUnknown
{
    HRESULT SetIdentifier(GUID);
}
enum IID_IValidateBinding = GUID(0x4a578b2, 0xe778, 0x422a, [0xa8, 0x5, 0xb3, 0xee, 0x54, 0xd9, 0xb, 0xd9]);
interface IValidateBinding : IUnknown
{
    HRESULT GetIdentifier(GUID, ubyte*, uint, ubyte**, uint*);
}
enum IID_IWMVideoDecoderHurryup = GUID(0x352bb3bd, 0x2d4d, 0x4323, [0x9e, 0x71, 0xdc, 0xdc, 0xfb, 0xd5, 0x3c, 0xa6]);
interface IWMVideoDecoderHurryup : IUnknown
{
    HRESULT SetHurryup(int);
    HRESULT GetHurryup(int*);
}
enum IID_IWMVideoForceKeyFrame = GUID(0x9f8496be, 0x5b9a, 0x41b9, [0xa9, 0xe8, 0xf2, 0x1c, 0xd8, 0x5, 0x96, 0xc2]);
interface IWMVideoForceKeyFrame : IUnknown
{
    HRESULT SetKeyFrame();
}
enum IID_IWMCodecStrings = GUID(0xa7b2504b, 0xe58a, 0x47fb, [0x95, 0x8b, 0xca, 0xc7, 0x16, 0x5a, 0x5, 0x7d]);
interface IWMCodecStrings : IUnknown
{
    HRESULT GetName(DMO_MEDIA_TYPE*, uint, PWSTR, uint*);
    HRESULT GetDescription(DMO_MEDIA_TYPE*, uint, PWSTR, uint*);
}
enum IID_IWMCodecProps = GUID(0x2573e11a, 0xf01a, 0x4fdd, [0xa9, 0x8d, 0x63, 0xb8, 0xe0, 0xba, 0x95, 0x89]);
interface IWMCodecProps : IUnknown
{
    HRESULT GetFormatProp(DMO_MEDIA_TYPE*, const(wchar)*, WMT_PROP_DATATYPE*, ubyte*, uint*);
    HRESULT GetCodecProp(uint, const(wchar)*, WMT_PROP_DATATYPE*, ubyte*, uint*);
}
enum IID_IWMCodecLeakyBucket = GUID(0xa81ba647, 0x6227, 0x43b7, [0xb2, 0x31, 0xc7, 0xb1, 0x51, 0x35, 0xdd, 0x7d]);
interface IWMCodecLeakyBucket : IUnknown
{
    HRESULT SetBufferSizeBits(uint);
    HRESULT GetBufferSizeBits(uint*);
    HRESULT SetBufferFullnessBits(uint);
    HRESULT GetBufferFullnessBits(uint*);
}
enum IID_IWMCodecOutputTimestamp = GUID(0xb72adf95, 0x7adc, 0x4a72, [0xbc, 0x5, 0x57, 0x7d, 0x8e, 0xa6, 0xbf, 0x68]);
interface IWMCodecOutputTimestamp : IUnknown
{
    HRESULT GetNextOutputTime(long*);
}
enum IID_IWMVideoDecoderReconBuffer = GUID(0x45bda2ac, 0x88e2, 0x4923, [0x98, 0xba, 0x39, 0x49, 0x8, 0x7, 0x11, 0xa3]);
interface IWMVideoDecoderReconBuffer : IUnknown
{
    HRESULT GetReconstructedVideoFrameSize(uint*);
    HRESULT GetReconstructedVideoFrame(IMediaBuffer);
    HRESULT SetReconstructedVideoFrame(IMediaBuffer);
}
enum IID_IWMCodecPrivateData = GUID(0x73f0be8e, 0x57f7, 0x4f01, [0xaa, 0x66, 0x9f, 0x57, 0x34, 0xc, 0xfe, 0xe]);
interface IWMCodecPrivateData : IUnknown
{
    HRESULT SetPartialOutputType(DMO_MEDIA_TYPE*);
    HRESULT GetPrivateData(ubyte*, uint*);
}
enum IID_IWMSampleExtensionSupport = GUID(0x9bca9884, 0x604, 0x4c2a, [0x87, 0xda, 0x79, 0x3f, 0xf4, 0xd5, 0x86, 0xc3]);
interface IWMSampleExtensionSupport : IUnknown
{
    HRESULT SetUseSampleExtensions(BOOL);
}
enum IID_IWMResamplerProps = GUID(0xe7e9984f, 0xf09f, 0x4da4, [0x90, 0x3f, 0x6e, 0x2e, 0xe, 0xfe, 0x56, 0xb5]);
interface IWMResamplerProps : IUnknown
{
    HRESULT SetHalfFilterLength(int);
    HRESULT SetUserChannelMtx(float*);
}
enum IID_IWMResizerProps = GUID(0x57665d4c, 0x414, 0x4faa, [0x90, 0x5b, 0x10, 0xe5, 0x46, 0xf8, 0x1c, 0x33]);
interface IWMResizerProps : IUnknown
{
    HRESULT SetResizerQuality(int);
    HRESULT SetInterlaceMode(int);
    HRESULT SetClipRegion(int, int, int, int);
    HRESULT SetFullCropRegion(int, int, int, int, int, int, int, int);
    HRESULT GetFullCropRegion(int*, int*, int*, int*, int*, int*, int*, int*);
}
enum IID_IWMColorLegalizerProps = GUID(0x776c93b3, 0xb72d, 0x4508, [0xb6, 0xd0, 0x20, 0x87, 0x85, 0xf5, 0x53, 0xe7]);
interface IWMColorLegalizerProps : IUnknown
{
    HRESULT SetColorLegalizerQuality(int);
}
enum IID_IWMInterlaceProps = GUID(0x7b12e5d1, 0xbd22, 0x48ea, [0xbc, 0x6, 0x98, 0xe8, 0x93, 0x22, 0x1c, 0x89]);
interface IWMInterlaceProps : IUnknown
{
    HRESULT SetProcessType(int);
    HRESULT SetInitInverseTeleCinePattern(int);
    HRESULT SetLastFrame();
}
enum IID_IWMFrameInterpProps = GUID(0x4c06bb9b, 0x626c, 0x4614, [0x83, 0x29, 0xcc, 0x6a, 0x21, 0xb9, 0x3f, 0xa0]);
interface IWMFrameInterpProps : IUnknown
{
    HRESULT SetFrameRateIn(int, int);
    HRESULT SetFrameRateOut(int, int);
    HRESULT SetFrameInterpEnabled(BOOL);
    HRESULT SetComplexityLevel(int);
}
enum IID_IWMColorConvProps = GUID(0xe6a49e22, 0xc099, 0x421d, [0xaa, 0xd3, 0xc0, 0x61, 0xfb, 0x4a, 0xe8, 0x5b]);
interface IWMColorConvProps : IUnknown
{
    HRESULT SetMode(int);
    HRESULT SetFullCroppingParam(int, int, int, int, int, int);
}
alias WMV_DYNAMIC_FLAGS = int;
enum : int
{
    WMV_DYNAMIC_BITRATE    = 0x00000001,
    WMV_DYNAMIC_RESOLUTION = 0x00000002,
    WMV_DYNAMIC_COMPLEXITY = 0x00000004,
}

alias MF_AUVRHP_ROOMMODEL = int;
enum : int
{
    VRHP_SMALLROOM      = 0x00000000,
    VRHP_MEDIUMROOM     = 0x00000001,
    VRHP_BIGROOM        = 0x00000002,
    VRHP_CUSTUMIZEDROOM = 0x00000003,
}

alias AEC_SYSTEM_MODE = int;
enum : int
{
    SINGLE_CHANNEL_AEC     = 0x00000000,
    ADAPTIVE_ARRAY_ONLY    = 0x00000001,
    OPTIBEAM_ARRAY_ONLY    = 0x00000002,
    ADAPTIVE_ARRAY_AND_AEC = 0x00000003,
    OPTIBEAM_ARRAY_AND_AEC = 0x00000004,
    SINGLE_CHANNEL_NSAGC   = 0x00000005,
    MODE_NOT_SET           = 0x00000006,
}

struct AecQualityMetrics_Struct
{
    long i64Timestamp;
    ubyte ConvergenceFlag;
    ubyte MicClippedFlag;
    ubyte MicSilenceFlag;
    ubyte PstvFeadbackFlag;
    ubyte SpkClippedFlag;
    ubyte SpkMuteFlag;
    ubyte GlitchFlag;
    ubyte DoubleTalkFlag;
    uint uGlitchCount;
    uint uMicClipCount;
    float fDuration;
    float fTSVariance;
    float fTSDriftRate;
    float fVoiceLevel;
    float fNoiseLevel;
    float fERLE;
    float fAvgERLE;
    uint dwReserved;
}
alias AEC_VAD_MODE = int;
enum : int
{
    AEC_VAD_DISABLED                = 0x00000000,
    AEC_VAD_NORMAL                  = 0x00000001,
    AEC_VAD_FOR_AGC                 = 0x00000002,
    AEC_VAD_FOR_SILENCE_SUPPRESSION = 0x00000003,
}

alias AEC_INPUT_STREAM = int;
enum : int
{
    AEC_CAPTURE_STREAM   = 0x00000000,
    AEC_REFERENCE_STREAM = 0x00000001,
}

alias MIC_ARRAY_MODE = int;
enum : int
{
    MICARRAY_SINGLE_CHAN = 0x00000000,
    MICARRAY_SIMPLE_SUM  = 0x00000100,
    MICARRAY_SINGLE_BEAM = 0x00000200,
    MICARRAY_FIXED_BEAM  = 0x00000400,
    MICARRAY_EXTERN_BEAM = 0x00000800,
}

alias MFVideoDSPMode = int;
enum : int
{
    MFVideoDSPMode_Passthrough   = 0x00000001,
    MFVideoDSPMode_Stabilization = 0x00000004,
}

struct TOC_DESCRIPTOR
{
    GUID guidID;
    ushort wStreamNumber;
    GUID guidType;
    ushort wLanguageIndex;
}
struct TOC_ENTRY_DESCRIPTOR
{
    ulong qwStartTime;
    ulong qwEndTime;
    ulong qwStartPacketOffset;
    ulong qwEndPacketOffset;
    ulong qwRepresentativeFrameTime;
}
alias TOC_POS_TYPE = int;
enum : int
{
    TOC_POS_INHEADER       = 0x00000000,
    TOC_POS_TOPLEVELOBJECT = 0x00000001,
}

enum IID_ITocEntry = GUID(0xf22f5e06, 0x585c, 0x4def, [0x85, 0x23, 0x65, 0x55, 0xcf, 0xbc, 0xc, 0xb3]);
interface ITocEntry : IUnknown
{
    HRESULT SetTitle(const(wchar)*);
    HRESULT GetTitle(ushort*, PWSTR);
    HRESULT SetDescriptor(TOC_ENTRY_DESCRIPTOR*);
    HRESULT GetDescriptor(TOC_ENTRY_DESCRIPTOR*);
    HRESULT SetSubEntries(uint, ushort*);
    HRESULT GetSubEntries(uint*, ushort*);
    HRESULT SetDescriptionData(uint, ubyte*, GUID*);
    HRESULT GetDescriptionData(uint*, ubyte*, GUID*);
}
enum IID_ITocEntryList = GUID(0x3a8cccbd, 0xefd, 0x43a3, [0xb8, 0x38, 0xf3, 0x8a, 0x55, 0x2b, 0xa2, 0x37]);
interface ITocEntryList : IUnknown
{
    HRESULT GetEntryCount(uint*);
    HRESULT GetEntryByIndex(uint, ITocEntry*);
    HRESULT AddEntry(ITocEntry, uint*);
    HRESULT AddEntryByIndex(uint, ITocEntry);
    HRESULT RemoveEntryByIndex(uint);
}
enum IID_IToc = GUID(0xd6f05441, 0xa919, 0x423b, [0x91, 0xa0, 0x89, 0xd5, 0xb4, 0xa8, 0xab, 0x77]);
interface IToc : IUnknown
{
    HRESULT SetDescriptor(TOC_DESCRIPTOR*);
    HRESULT GetDescriptor(TOC_DESCRIPTOR*);
    HRESULT SetDescription(const(wchar)*);
    HRESULT GetDescription(ushort*, PWSTR);
    HRESULT SetContext(uint, ubyte*);
    HRESULT GetContext(uint*, ubyte*);
    HRESULT GetEntryListCount(ushort*);
    HRESULT GetEntryListByIndex(ushort, ITocEntryList*);
    HRESULT AddEntryList(ITocEntryList, ushort*);
    HRESULT AddEntryListByIndex(ushort, ITocEntryList);
    HRESULT RemoveEntryListByIndex(ushort);
}
enum IID_ITocCollection = GUID(0x23fee831, 0xae96, 0x42df, [0xb1, 0x70, 0x25, 0xa0, 0x48, 0x47, 0xa3, 0xca]);
interface ITocCollection : IUnknown
{
    HRESULT GetEntryCount(uint*);
    HRESULT GetEntryByIndex(uint, IToc*);
    HRESULT AddEntry(IToc, uint*);
    HRESULT AddEntryByIndex(uint, IToc);
    HRESULT RemoveEntryByIndex(uint);
}
enum IID_ITocParser = GUID(0xecfb9a55, 0x9298, 0x4f49, [0x88, 0x7f, 0xb, 0x36, 0x20, 0x65, 0x99, 0xd2]);
interface ITocParser : IUnknown
{
    HRESULT Init(const(wchar)*);
    HRESULT GetTocCount(TOC_POS_TYPE, uint*);
    HRESULT GetTocByIndex(TOC_POS_TYPE, uint, IToc*);
    HRESULT GetTocByType(TOC_POS_TYPE, GUID, ITocCollection*);
    HRESULT AddToc(TOC_POS_TYPE, IToc, uint*);
    HRESULT RemoveTocByIndex(TOC_POS_TYPE, uint);
    HRESULT RemoveTocByType(TOC_POS_TYPE, GUID);
    HRESULT Commit();
}
alias FILE_OPENMODE = int;
enum : int
{
    OPENMODE_FAIL_IF_NOT_EXIST = 0x00000000,
    OPENMODE_FAIL_IF_EXIST     = 0x00000001,
    OPENMODE_RESET_IF_EXIST    = 0x00000002,
    OPENMODE_APPEND_IF_EXIST   = 0x00000003,
    OPENMODE_DELETE_IF_EXIST   = 0x00000004,
}

alias SEEK_ORIGIN = int;
enum : int
{
    _msoBegin   = 0x00000000,
    _msoCurrent = 0x00000001,
}

alias FILE_ACCESSMODE = int;
enum : int
{
    ACCESSMODE_READ            = 0x00000001,
    ACCESSMODE_WRITE           = 0x00000002,
    ACCESSMODE_READWRITE       = 0x00000003,
    ACCESSMODE_WRITE_EXCLUSIVE = 0x00000004,
}

enum IID_IFileIo = GUID(0x11993196, 0x1244, 0x4840, [0xab, 0x44, 0x48, 0x9, 0x75, 0xc4, 0xff, 0xe4]);
interface IFileIo : IUnknown
{
    HRESULT Initialize(FILE_ACCESSMODE, FILE_OPENMODE, const(wchar)*);
    HRESULT GetLength(ulong*);
    HRESULT SetLength(ulong);
    HRESULT GetCurrentPosition(ulong*);
    HRESULT SetCurrentPosition(ulong);
    HRESULT IsEndOfStream(BOOL*);
    HRESULT Read(ubyte*, uint, uint*);
    HRESULT Write(ubyte*, uint, uint*);
    HRESULT Seek(SEEK_ORIGIN, ulong, uint, ulong*);
    HRESULT Close();
}
enum IID_IFileClient = GUID(0xbfccd196, 0x1244, 0x4840, [0xab, 0x44, 0x48, 0x9, 0x75, 0xc4, 0xff, 0xe4]);
interface IFileClient : IUnknown
{
    HRESULT GetObjectDiskSize(ulong*);
    HRESULT Write(IFileIo);
    HRESULT Read(IFileIo);
}
enum IID_IClusterDetector = GUID(0x3f07f7b7, 0xc680, 0x41d9, [0x94, 0x23, 0x91, 0x51, 0x7, 0xec, 0x9f, 0xf9]);
interface IClusterDetector : IUnknown
{
    HRESULT Initialize(ushort, ushort);
    HRESULT Detect(uint, float, float, IToc, IToc*);
}
struct DXVA_AYUVsample2
{
    ubyte bCrValue;
    ubyte bCbValue;
    ubyte bY_Value;
    ubyte bSampleAlpha8;
}
struct DXVA_BufferDescription
{
    align (1):
    uint dwTypeIndex;
    uint dwBufferIndex;
    uint dwDataOffset;
    uint dwDataSize;
    uint dwFirstMBaddress;
    uint dwNumMBsInBuffer;
    uint dwWidth;
    uint dwHeight;
    uint dwStride;
    uint dwReservedBits;
}
struct DXVA_ConfigPictureDecode
{
    align (1):
    uint dwFunction;
    uint[3] dwReservedBits;
    GUID guidConfigBitstreamEncryption;
    GUID guidConfigMBcontrolEncryption;
    GUID guidConfigResidDiffEncryption;
    ubyte bConfigBitstreamRaw;
    ubyte bConfigMBcontrolRasterOrder;
    ubyte bConfigResidDiffHost;
    ubyte bConfigSpatialResid8;
    ubyte bConfigResid8Subtraction;
    ubyte bConfigSpatialHost8or9Clipping;
    ubyte bConfigSpatialResidInterleaved;
    ubyte bConfigIntraResidUnsigned;
    ubyte bConfigResidDiffAccelerator;
    ubyte bConfigHostInverseScan;
    ubyte bConfigSpecificIDCT;
    ubyte bConfig4GroupedCoefs;
}
struct DXVA_PictureParameters
{
    align (1):
    ushort wDecodedPictureIndex;
    ushort wDeblockedPictureIndex;
    ushort wForwardRefPictureIndex;
    ushort wBackwardRefPictureIndex;
    ushort wPicWidthInMBminus1;
    ushort wPicHeightInMBminus1;
    ubyte bMacroblockWidthMinus1;
    ubyte bMacroblockHeightMinus1;
    ubyte bBlockWidthMinus1;
    ubyte bBlockHeightMinus1;
    ubyte bBPPminus1;
    ubyte bPicStructure;
    ubyte bSecondField;
    ubyte bPicIntra;
    ubyte bPicBackwardPrediction;
    ubyte bBidirectionalAveragingMode;
    ubyte bMVprecisionAndChromaRelation;
    ubyte bChromaFormat;
    ubyte bPicScanFixed;
    ubyte bPicScanMethod;
    ubyte bPicReadbackRequests;
    ubyte bRcontrol;
    ubyte bPicSpatialResid8;
    ubyte bPicOverflowBlocks;
    ubyte bPicExtrapolation;
    ubyte bPicDeblocked;
    ubyte bPicDeblockConfined;
    ubyte bPic4MVallowed;
    ubyte bPicOBMC;
    ubyte bPicBinPB;
    ubyte bMV_RPS;
    ubyte bReservedBits;
    ushort wBitstreamFcodes;
    ushort wBitstreamPCEelements;
    ubyte bBitstreamConcealmentNeed;
    ubyte bBitstreamConcealmentMethod;
}
struct DXVAUncompDataInfo
{
    uint UncompWidth;
    uint UncompHeight;
    D3DFORMAT UncompFormat;
}
struct DXVACompBufferInfo
{
    uint NumCompBuffers;
    uint WidthToCreate;
    uint HeightToCreate;
    uint BytesToAllocate;
    uint Usage;
    D3DPOOL Pool;
    D3DFORMAT Format;
}
struct DXVABufferInfo
{
    void* pCompSurface;
    uint DataOffset;
    uint DataSize;
}
alias DXVA_SampleFormat = int;
enum : int
{
    DXVA_SampleFormatMask                = 0x000000ff,
    DXVA_SampleUnknown                   = 0x00000000,
    DXVA_SamplePreviousFrame             = 0x00000001,
    DXVA_SampleProgressiveFrame          = 0x00000002,
    DXVA_SampleFieldInterleavedEvenFirst = 0x00000003,
    DXVA_SampleFieldInterleavedOddFirst  = 0x00000004,
    DXVA_SampleFieldSingleEven           = 0x00000005,
    DXVA_SampleFieldSingleOdd            = 0x00000006,
    DXVA_SampleSubStream                 = 0x00000007,
}

alias DXVA_VideoTransferFunction = int;
enum : int
{
    DXVA_VideoTransFuncShift         = 0x0000001b,
    DXVA_VideoTransFuncMask          = 0xf8000000,
    DXVA_VideoTransFunc_Unknown      = 0x00000000,
    DXVA_VideoTransFunc_10           = 0x00000001,
    DXVA_VideoTransFunc_18           = 0x00000002,
    DXVA_VideoTransFunc_20           = 0x00000003,
    DXVA_VideoTransFunc_22           = 0x00000004,
    DXVA_VideoTransFunc_22_709       = 0x00000005,
    DXVA_VideoTransFunc_22_240M      = 0x00000006,
    DXVA_VideoTransFunc_22_8bit_sRGB = 0x00000007,
    DXVA_VideoTransFunc_28           = 0x00000008,
}

alias DXVA_VideoPrimaries = int;
enum : int
{
    DXVA_VideoPrimariesShift          = 0x00000016,
    DXVA_VideoPrimariesMask           = 0x07c00000,
    DXVA_VideoPrimaries_Unknown       = 0x00000000,
    DXVA_VideoPrimaries_reserved      = 0x00000001,
    DXVA_VideoPrimaries_BT709         = 0x00000002,
    DXVA_VideoPrimaries_BT470_2_SysM  = 0x00000003,
    DXVA_VideoPrimaries_BT470_2_SysBG = 0x00000004,
    DXVA_VideoPrimaries_SMPTE170M     = 0x00000005,
    DXVA_VideoPrimaries_SMPTE240M     = 0x00000006,
    DXVA_VideoPrimaries_EBU3213       = 0x00000007,
    DXVA_VideoPrimaries_SMPTE_C       = 0x00000008,
}

alias DXVA_VideoLighting = int;
enum : int
{
    DXVA_VideoLightingShift    = 0x00000012,
    DXVA_VideoLightingMask     = 0x003c0000,
    DXVA_VideoLighting_Unknown = 0x00000000,
    DXVA_VideoLighting_bright  = 0x00000001,
    DXVA_VideoLighting_office  = 0x00000002,
    DXVA_VideoLighting_dim     = 0x00000003,
    DXVA_VideoLighting_dark    = 0x00000004,
}

alias DXVA_VideoTransferMatrix = int;
enum : int
{
    DXVA_VideoTransferMatrixShift      = 0x0000000f,
    DXVA_VideoTransferMatrixMask       = 0x00038000,
    DXVA_VideoTransferMatrix_Unknown   = 0x00000000,
    DXVA_VideoTransferMatrix_BT709     = 0x00000001,
    DXVA_VideoTransferMatrix_BT601     = 0x00000002,
    DXVA_VideoTransferMatrix_SMPTE240M = 0x00000003,
}

alias DXVA_NominalRange = int;
enum : int
{
    DXVA_NominalRangeShift    = 0x0000000c,
    DXVA_NominalRangeMask     = 0x00007000,
    DXVA_NominalRange_Unknown = 0x00000000,
    DXVA_NominalRange_Normal  = 0x00000001,
    DXVA_NominalRange_Wide    = 0x00000002,
    DXVA_NominalRange_0_255   = 0x00000001,
    DXVA_NominalRange_16_235  = 0x00000002,
    DXVA_NominalRange_48_208  = 0x00000003,
}

alias DXVA_VideoChromaSubsampling = int;
enum : int
{
    DXVA_VideoChromaSubsamplingShift                           = 0x00000008,
    DXVA_VideoChromaSubsamplingMask                            = 0x00000f00,
    DXVA_VideoChromaSubsampling_Unknown                        = 0x00000000,
    DXVA_VideoChromaSubsampling_ProgressiveChroma              = 0x00000008,
    DXVA_VideoChromaSubsampling_Horizontally_Cosited           = 0x00000004,
    DXVA_VideoChromaSubsampling_Vertically_Cosited             = 0x00000002,
    DXVA_VideoChromaSubsampling_Vertically_AlignedChromaPlanes = 0x00000001,
    DXVA_VideoChromaSubsampling_MPEG2                          = 0x00000005,
    DXVA_VideoChromaSubsampling_MPEG1                          = 0x00000001,
    DXVA_VideoChromaSubsampling_DV_PAL                         = 0x00000006,
    DXVA_VideoChromaSubsampling_Cosited                        = 0x00000007,
}

struct DXVA_ExtendedFormat
{
    uint _bitfield0;
}
struct DXVA_Frequency
{
    uint Numerator;
    uint Denominator;
}
struct DXVA_VideoDesc
{
    uint Size;
    uint SampleWidth;
    uint SampleHeight;
    uint SampleFormat;
    D3DFORMAT d3dFormat;
    DXVA_Frequency InputSampleFreq;
    DXVA_Frequency OutputFrameFreq;
}
alias DXVA_VideoProcessCaps = int;
enum : int
{
    DXVA_VideoProcess_None               = 0x00000000,
    DXVA_VideoProcess_YUV2RGB            = 0x00000001,
    DXVA_VideoProcess_StretchX           = 0x00000002,
    DXVA_VideoProcess_StretchY           = 0x00000004,
    DXVA_VideoProcess_AlphaBlend         = 0x00000008,
    DXVA_VideoProcess_SubRects           = 0x00000010,
    DXVA_VideoProcess_SubStreams         = 0x00000020,
    DXVA_VideoProcess_SubStreamsExtended = 0x00000040,
    DXVA_VideoProcess_YUV2RGBExtended    = 0x00000080,
    DXVA_VideoProcess_AlphaBlendExtended = 0x00000100,
}

alias DXVA_DeinterlaceTech = int;
enum : int
{
    DXVA_DeinterlaceTech_Unknown                = 0x00000000,
    DXVA_DeinterlaceTech_BOBLineReplicate       = 0x00000001,
    DXVA_DeinterlaceTech_BOBVerticalStretch     = 0x00000002,
    DXVA_DeinterlaceTech_BOBVerticalStretch4Tap = 0x00000100,
    DXVA_DeinterlaceTech_MedianFiltering        = 0x00000004,
    DXVA_DeinterlaceTech_EdgeFiltering          = 0x00000010,
    DXVA_DeinterlaceTech_FieldAdaptive          = 0x00000020,
    DXVA_DeinterlaceTech_PixelAdaptive          = 0x00000040,
    DXVA_DeinterlaceTech_MotionVectorSteered    = 0x00000080,
}

struct DXVA_VideoSample
{
    long rtStart;
    long rtEnd;
    DXVA_SampleFormat SampleFormat;
    void* lpDDSSrcSurface;
}
alias DXVA_SampleFlags = int;
enum : int
{
    DXVA_SampleFlagsMask              = 0x0000000f,
    DXVA_SampleFlag_Palette_Changed   = 0x00000001,
    DXVA_SampleFlag_SrcRect_Changed   = 0x00000002,
    DXVA_SampleFlag_DstRect_Changed   = 0x00000004,
    DXVA_SampleFlag_ColorData_Changed = 0x00000008,
}

alias DXVA_DestinationFlags = int;
enum : int
{
    DXVA_DestinationFlagMask                = 0x0000000f,
    DXVA_DestinationFlag_Background_Changed = 0x00000001,
    DXVA_DestinationFlag_TargetRect_Changed = 0x00000002,
    DXVA_DestinationFlag_ColorData_Changed  = 0x00000004,
    DXVA_DestinationFlag_Alpha_Changed      = 0x00000008,
}

struct DXVA_VideoSample2
{
    uint Size;
    uint Reserved;
    long rtStart;
    long rtEnd;
    uint SampleFormat;
    uint SampleFlags;
    void* lpDDSSrcSurface;
    RECT rcSrc;
    RECT rcDst;
    DXVA_AYUVsample2[16] Palette;
}
struct DXVA_DeinterlaceCaps
{
    uint Size;
    uint NumPreviousOutputFrames;
    uint InputPool;
    uint NumForwardRefSamples;
    uint NumBackwardRefSamples;
    D3DFORMAT d3dOutputFormat;
    DXVA_VideoProcessCaps VideoProcessingCaps;
    DXVA_DeinterlaceTech DeinterlaceTechnology;
}
struct DXVA_VideoSample32
{
    long rtStart;
    long rtEnd;
    uint SampleFormat;
    uint SampleFlags;
    uint lpDDSSrcSurface;
    RECT rcSrc;
    RECT rcDst;
    DXVA_AYUVsample2[16] Palette;
}
struct DXVA_DeinterlaceBltEx32
{
    uint Size;
    DXVA_AYUVsample2 BackgroundColor;
    RECT rcTarget;
    long rtTarget;
    uint NumSourceSurfaces;
    float Alpha;
    DXVA_VideoSample32[32] Source;
    uint DestinationFormat;
    uint DestinationFlags;
}
struct DXVA_DeinterlaceBlt
{
    uint Size;
    uint Reserved;
    long rtTarget;
    RECT DstRect;
    RECT SrcRect;
    uint NumSourceSurfaces;
    float Alpha;
    DXVA_VideoSample[32] Source;
}
struct DXVA_DeinterlaceBltEx
{
    uint Size;
    DXVA_AYUVsample2 BackgroundColor;
    RECT rcTarget;
    long rtTarget;
    uint NumSourceSurfaces;
    float Alpha;
    DXVA_VideoSample2[32] Source;
    uint DestinationFormat;
    uint DestinationFlags;
}
struct DXVA_DeinterlaceQueryAvailableModes
{
    uint Size;
    uint NumGuids;
    GUID[32] Guids;
}
struct DXVA_DeinterlaceQueryModeCaps
{
    uint Size;
    GUID Guid;
    DXVA_VideoDesc VideoDesc;
}
alias DXVA_ProcAmpControlProp = int;
enum : int
{
    DXVA_ProcAmp_None       = 0x00000000,
    DXVA_ProcAmp_Brightness = 0x00000001,
    DXVA_ProcAmp_Contrast   = 0x00000002,
    DXVA_ProcAmp_Hue        = 0x00000004,
    DXVA_ProcAmp_Saturation = 0x00000008,
}

struct DXVA_ProcAmpControlCaps
{
    uint Size;
    uint InputPool;
    D3DFORMAT d3dOutputFormat;
    uint ProcAmpControlProps;
    uint VideoProcessingCaps;
}
struct DXVA_ProcAmpControlQueryRange
{
    uint Size;
    DXVA_ProcAmpControlProp ProcAmpControlProp;
    DXVA_VideoDesc VideoDesc;
}
struct DXVA_VideoPropertyRange
{
    float MinValue;
    float MaxValue;
    float DefaultValue;
    float StepSize;
}
struct DXVA_ProcAmpControlBlt
{
    uint Size;
    RECT DstRect;
    RECT SrcRect;
    float Alpha;
    float Brightness;
    float Contrast;
    float Hue;
    float Saturation;
}
struct DXVA_COPPSignature
{
    ubyte[256] Signature;
}
struct DXVA_COPPCommand
{
    GUID macKDI;
    GUID guidCommandID;
    uint dwSequence;
    uint cbSizeData;
    ubyte[4056] CommandData;
}
struct DXVA_COPPStatusInput
{
    GUID rApp;
    GUID guidStatusRequestID;
    uint dwSequence;
    uint cbSizeData;
    ubyte[4056] StatusData;
}
struct DXVA_COPPStatusOutput
{
    GUID macKDI;
    uint cbSizeData;
    ubyte[4076] COPPStatus;
}
enum CLSID_CODECAPI_AVEncCommonFormatConstraint = GUID(0x57cbb9b8, 0x116f, 0x4951, [0xb4, 0xc, 0xc2, 0xa0, 0x35, 0xed, 0x8f, 0x17]);
struct CODECAPI_AVEncCommonFormatConstraint
{
}
enum CLSID_CODECAPI_GUID_AVEncCommonFormatUnSpecified = GUID(0xaf46a35a, 0x6024, 0x4525, [0xa4, 0x8a, 0x9, 0x4b, 0x97, 0xf5, 0xb3, 0xc2]);
struct CODECAPI_GUID_AVEncCommonFormatUnSpecified
{
}
enum CLSID_CODECAPI_GUID_AVEncCommonFormatDVD_V = GUID(0xcc9598c4, 0xe7fe, 0x451d, [0xb1, 0xca, 0x76, 0x1b, 0xc8, 0x40, 0xb7, 0xf3]);
struct CODECAPI_GUID_AVEncCommonFormatDVD_V
{
}
enum CLSID_CODECAPI_GUID_AVEncCommonFormatDVD_DashVR = GUID(0xe55199d6, 0x44c, 0x4dae, [0xa4, 0x88, 0x53, 0x1e, 0xd3, 0x6, 0x23, 0x5b]);
struct CODECAPI_GUID_AVEncCommonFormatDVD_DashVR
{
}
enum CLSID_CODECAPI_GUID_AVEncCommonFormatDVD_PlusVR = GUID(0xe74c6f2e, 0xec37, 0x478d, [0x9a, 0xf4, 0xa5, 0xe1, 0x35, 0xb6, 0x27, 0x1c]);
struct CODECAPI_GUID_AVEncCommonFormatDVD_PlusVR
{
}
enum CLSID_CODECAPI_GUID_AVEncCommonFormatVCD = GUID(0x95035bf7, 0x9d90, 0x40ff, [0xad, 0x5c, 0x5c, 0xf8, 0xcf, 0x71, 0xca, 0x1d]);
struct CODECAPI_GUID_AVEncCommonFormatVCD
{
}
enum CLSID_CODECAPI_GUID_AVEncCommonFormatSVCD = GUID(0x51d85818, 0x8220, 0x448c, [0x80, 0x66, 0xd6, 0x9b, 0xed, 0x16, 0xc9, 0xad]);
struct CODECAPI_GUID_AVEncCommonFormatSVCD
{
}
enum CLSID_CODECAPI_GUID_AVEncCommonFormatATSC = GUID(0x8d7b897c, 0xa019, 0x4670, [0xaa, 0x76, 0x2e, 0xdc, 0xac, 0x7a, 0xc2, 0x96]);
struct CODECAPI_GUID_AVEncCommonFormatATSC
{
}
enum CLSID_CODECAPI_GUID_AVEncCommonFormatDVB = GUID(0x71830d8f, 0x6c33, 0x430d, [0x84, 0x4b, 0xc2, 0x70, 0x5b, 0xaa, 0xe6, 0xdb]);
struct CODECAPI_GUID_AVEncCommonFormatDVB
{
}
enum CLSID_CODECAPI_GUID_AVEncCommonFormatMP3 = GUID(0x349733cd, 0xeb08, 0x4dc2, [0x81, 0x97, 0xe4, 0x98, 0x35, 0xef, 0x82, 0x8b]);
struct CODECAPI_GUID_AVEncCommonFormatMP3
{
}
enum CLSID_CODECAPI_GUID_AVEncCommonFormatHighMAT = GUID(0x1eabe760, 0xfb2b, 0x4928, [0x90, 0xd1, 0x78, 0xdb, 0x88, 0xee, 0xe8, 0x89]);
struct CODECAPI_GUID_AVEncCommonFormatHighMAT
{
}
enum CLSID_CODECAPI_GUID_AVEncCommonFormatHighMPV = GUID(0xa2d25db8, 0xb8f9, 0x42c2, [0x8b, 0xc7, 0xb, 0x93, 0xcf, 0x60, 0x47, 0x88]);
struct CODECAPI_GUID_AVEncCommonFormatHighMPV
{
}
enum CLSID_CODECAPI_AVEncCodecType = GUID(0x8af4ac1, 0xf3f2, 0x4c74, [0x9d, 0xcf, 0x37, 0xf2, 0xec, 0x79, 0xf8, 0x26]);
struct CODECAPI_AVEncCodecType
{
}
enum CLSID_CODECAPI_GUID_AVEncMPEG1Video = GUID(0xc8dafefe, 0xda1e, 0x4774, [0xb2, 0x7d, 0x11, 0x83, 0xc, 0x16, 0xb1, 0xfe]);
struct CODECAPI_GUID_AVEncMPEG1Video
{
}
enum CLSID_CODECAPI_GUID_AVEncMPEG2Video = GUID(0x46dc19a, 0x6677, 0x4aaa, [0xa3, 0x1d, 0xc1, 0xab, 0x71, 0x6f, 0x45, 0x60]);
struct CODECAPI_GUID_AVEncMPEG2Video
{
}
enum CLSID_CODECAPI_GUID_AVEncMPEG1Audio = GUID(0xd4dd1362, 0xcd4a, 0x4cd6, [0x81, 0x38, 0xb9, 0x4d, 0xb4, 0x54, 0x2b, 0x4]);
struct CODECAPI_GUID_AVEncMPEG1Audio
{
}
enum CLSID_CODECAPI_GUID_AVEncMPEG2Audio = GUID(0xee4cbb1f, 0x9c3f, 0x4770, [0x92, 0xb5, 0xfc, 0xb7, 0xc2, 0xa8, 0xd3, 0x81]);
struct CODECAPI_GUID_AVEncMPEG2Audio
{
}
enum CLSID_CODECAPI_GUID_AVEncWMV = GUID(0x4e0fef9b, 0x1d43, 0x41bd, [0xb8, 0xbd, 0x4d, 0x7b, 0xf7, 0x45, 0x7a, 0x2a]);
struct CODECAPI_GUID_AVEncWMV
{
}
enum CLSID_CODECAPI_GUID_AVEndMPEG4Video = GUID(0xdd37b12a, 0x9503, 0x4f8b, [0xb8, 0xd0, 0x32, 0x4a, 0x0, 0xc0, 0xa1, 0xcf]);
struct CODECAPI_GUID_AVEndMPEG4Video
{
}
enum CLSID_CODECAPI_GUID_AVEncH264Video = GUID(0x95044eab, 0x31b3, 0x47de, [0x8e, 0x75, 0x38, 0xa4, 0x2b, 0xb0, 0x3e, 0x28]);
struct CODECAPI_GUID_AVEncH264Video
{
}
enum CLSID_CODECAPI_GUID_AVEncDV = GUID(0x9b769c7, 0x3329, 0x44fb, [0x89, 0x54, 0xfa, 0x30, 0x93, 0x7d, 0x3d, 0x5a]);
struct CODECAPI_GUID_AVEncDV
{
}
enum CLSID_CODECAPI_GUID_AVEncWMAPro = GUID(0x1955f90c, 0x33f7, 0x4a68, [0xab, 0x81, 0x53, 0xf5, 0x65, 0x71, 0x25, 0xc4]);
struct CODECAPI_GUID_AVEncWMAPro
{
}
enum CLSID_CODECAPI_GUID_AVEncWMALossless = GUID(0x55ca7265, 0x23d8, 0x4761, [0x90, 0x31, 0xb7, 0x4f, 0xbe, 0x12, 0xf4, 0xc1]);
struct CODECAPI_GUID_AVEncWMALossless
{
}
enum CLSID_CODECAPI_GUID_AVEncWMAVoice = GUID(0x13ed18cb, 0x50e8, 0x4276, [0xa2, 0x88, 0xa6, 0xaa, 0x22, 0x83, 0x82, 0xd9]);
struct CODECAPI_GUID_AVEncWMAVoice
{
}
enum CLSID_CODECAPI_GUID_AVEncDolbyDigitalPro = GUID(0xf5be76cc, 0xff8, 0x40eb, [0x9c, 0xb1, 0xbb, 0xa9, 0x40, 0x4, 0xd4, 0x4f]);
struct CODECAPI_GUID_AVEncDolbyDigitalPro
{
}
enum CLSID_CODECAPI_GUID_AVEncDolbyDigitalConsumer = GUID(0xc1a7bf6c, 0x59, 0x4bfa, [0x94, 0xef, 0xef, 0x74, 0x7a, 0x76, 0x8d, 0x52]);
struct CODECAPI_GUID_AVEncDolbyDigitalConsumer
{
}
enum CLSID_CODECAPI_GUID_AVEncDolbyDigitalPlus = GUID(0x698d1b80, 0xf7dd, 0x415c, [0x97, 0x1c, 0x42, 0x49, 0x2a, 0x20, 0x56, 0xc6]);
struct CODECAPI_GUID_AVEncDolbyDigitalPlus
{
}
enum CLSID_CODECAPI_GUID_AVEncDTSHD = GUID(0x2052e630, 0x469d, 0x4bfb, [0x80, 0xca, 0x1d, 0x65, 0x6e, 0x7e, 0x91, 0x8f]);
struct CODECAPI_GUID_AVEncDTSHD
{
}
enum CLSID_CODECAPI_GUID_AVEncDTS = GUID(0x45fbcaa2, 0x5e6e, 0x4ab0, [0x88, 0x93, 0x59, 0x3, 0xbe, 0xe9, 0x3a, 0xcf]);
struct CODECAPI_GUID_AVEncDTS
{
}
enum CLSID_CODECAPI_GUID_AVEncMLP = GUID(0x5f73e29, 0xf0d1, 0x431e, [0xa4, 0x1c, 0xa4, 0x74, 0x32, 0xec, 0x5a, 0x66]);
struct CODECAPI_GUID_AVEncMLP
{
}
enum CLSID_CODECAPI_GUID_AVEncPCM = GUID(0x844be7f4, 0x26cf, 0x4779, [0xb3, 0x86, 0xcc, 0x5, 0xd1, 0x87, 0x99, 0xc]);
struct CODECAPI_GUID_AVEncPCM
{
}
enum CLSID_CODECAPI_GUID_AVEncSDDS = GUID(0x1dc1b82f, 0x11c8, 0x4c71, [0xb7, 0xb6, 0xee, 0x3e, 0xb9, 0xbc, 0x2b, 0x94]);
struct CODECAPI_GUID_AVEncSDDS
{
}
enum CLSID_CODECAPI_AVEncCommonRateControlMode = GUID(0x1c0608e9, 0x370c, 0x4710, [0x8a, 0x58, 0xcb, 0x61, 0x81, 0xc4, 0x24, 0x23]);
struct CODECAPI_AVEncCommonRateControlMode
{
}
alias eAVEncCommonRateControlMode = int;
enum : int
{
    eAVEncCommonRateControlMode_CBR                = 0x00000000,
    eAVEncCommonRateControlMode_PeakConstrainedVBR = 0x00000001,
    eAVEncCommonRateControlMode_UnconstrainedVBR   = 0x00000002,
    eAVEncCommonRateControlMode_Quality            = 0x00000003,
    eAVEncCommonRateControlMode_LowDelayVBR        = 0x00000004,
    eAVEncCommonRateControlMode_GlobalVBR          = 0x00000005,
    eAVEncCommonRateControlMode_GlobalLowDelayVBR  = 0x00000006,
}

enum CLSID_CODECAPI_AVEncCommonLowLatency = GUID(0x9d3ecd55, 0x89e8, 0x490a, [0x97, 0xa, 0xc, 0x95, 0x48, 0xd5, 0xa5, 0x6e]);
struct CODECAPI_AVEncCommonLowLatency
{
}
enum CLSID_CODECAPI_AVEncCommonMultipassMode = GUID(0x22533d4c, 0x47e1, 0x41b5, [0x93, 0x52, 0xa2, 0xb7, 0x78, 0xe, 0x7a, 0xc4]);
struct CODECAPI_AVEncCommonMultipassMode
{
}
enum CLSID_CODECAPI_AVEncCommonPassStart = GUID(0x6a67739f, 0x4eb5, 0x4385, [0x99, 0x28, 0xf2, 0x76, 0xa9, 0x39, 0xef, 0x95]);
struct CODECAPI_AVEncCommonPassStart
{
}
enum CLSID_CODECAPI_AVEncCommonPassEnd = GUID(0xe3d01bc, 0xc85c, 0x467d, [0x8b, 0x60, 0xc4, 0x10, 0x12, 0xee, 0x3b, 0xf6]);
struct CODECAPI_AVEncCommonPassEnd
{
}
enum CLSID_CODECAPI_AVEncCommonRealTime = GUID(0x143a0ff6, 0xa131, 0x43da, [0xb8, 0x1e, 0x98, 0xfb, 0xb8, 0xec, 0x37, 0x8e]);
struct CODECAPI_AVEncCommonRealTime
{
}
enum CLSID_CODECAPI_AVEncCommonQuality = GUID(0xfcbf57a3, 0x7ea5, 0x4b0c, [0x96, 0x44, 0x69, 0xb4, 0xc, 0x39, 0xc3, 0x91]);
struct CODECAPI_AVEncCommonQuality
{
}
enum CLSID_CODECAPI_AVEncCommonQualityVsSpeed = GUID(0x98332df8, 0x3cd, 0x476b, [0x89, 0xfa, 0x3f, 0x9e, 0x44, 0x2d, 0xec, 0x9f]);
struct CODECAPI_AVEncCommonQualityVsSpeed
{
}
enum CLSID_CODECAPI_AVEncCommonTranscodeEncodingProfile = GUID(0x6947787c, 0xf508, 0x4ea9, [0xb1, 0xe9, 0xa1, 0xfe, 0x3a, 0x49, 0xfb, 0xc9]);
struct CODECAPI_AVEncCommonTranscodeEncodingProfile
{
}
enum CLSID_CODECAPI_AVEncCommonMeanBitRate = GUID(0xf7222374, 0x2144, 0x4815, [0xb5, 0x50, 0xa3, 0x7f, 0x8e, 0x12, 0xee, 0x52]);
struct CODECAPI_AVEncCommonMeanBitRate
{
}
enum CLSID_CODECAPI_AVEncCommonMeanBitRateInterval = GUID(0xbfaa2f0c, 0xcb82, 0x4bc0, [0x84, 0x74, 0xf0, 0x6a, 0x8a, 0xd, 0x2, 0x58]);
struct CODECAPI_AVEncCommonMeanBitRateInterval
{
}
enum CLSID_CODECAPI_AVEncCommonMaxBitRate = GUID(0x9651eae4, 0x39b9, 0x4ebf, [0x85, 0xef, 0xd7, 0xf4, 0x44, 0xec, 0x74, 0x65]);
struct CODECAPI_AVEncCommonMaxBitRate
{
}
enum CLSID_CODECAPI_AVEncCommonMinBitRate = GUID(0x101405b2, 0x2083, 0x4034, [0xa8, 0x6, 0xef, 0xbe, 0xdd, 0xd7, 0xc9, 0xff]);
struct CODECAPI_AVEncCommonMinBitRate
{
}
enum CLSID_CODECAPI_AVEncCommonBufferSize = GUID(0xdb96574, 0xb6a4, 0x4c8b, [0x81, 0x6, 0x37, 0x73, 0xde, 0x3, 0x10, 0xcd]);
struct CODECAPI_AVEncCommonBufferSize
{
}
enum CLSID_CODECAPI_AVEncCommonBufferInLevel = GUID(0xd9c5c8db, 0xfc74, 0x4064, [0x94, 0xe9, 0xcd, 0x19, 0xf9, 0x47, 0xed, 0x45]);
struct CODECAPI_AVEncCommonBufferInLevel
{
}
enum CLSID_CODECAPI_AVEncCommonBufferOutLevel = GUID(0xccae7f49, 0xd0bc, 0x4e3d, [0xa5, 0x7e, 0xfb, 0x57, 0x40, 0x14, 0x0, 0x69]);
struct CODECAPI_AVEncCommonBufferOutLevel
{
}
enum CLSID_CODECAPI_AVEncCommonStreamEndHandling = GUID(0x6aad30af, 0x6ba8, 0x4ccc, [0x8f, 0xca, 0x18, 0xd1, 0x9b, 0xea, 0xeb, 0x1c]);
struct CODECAPI_AVEncCommonStreamEndHandling
{
}
alias eAVEncCommonStreamEndHandling = int;
enum : int
{
    eAVEncCommonStreamEndHandling_DiscardPartial = 0x00000000,
    eAVEncCommonStreamEndHandling_EnsureComplete = 0x00000001,
}

enum CLSID_CODECAPI_AVEncStatCommonCompletedPasses = GUID(0x3e5de533, 0x9df7, 0x438c, [0x85, 0x4f, 0x9f, 0x7d, 0xd3, 0x68, 0x3d, 0x34]);
struct CODECAPI_AVEncStatCommonCompletedPasses
{
}
enum CLSID_CODECAPI_AVEncVideoOutputFrameRate = GUID(0xea85e7c3, 0x9567, 0x4d99, [0x87, 0xc4, 0x2, 0xc1, 0xc2, 0x78, 0xca, 0x7c]);
struct CODECAPI_AVEncVideoOutputFrameRate
{
}
enum CLSID_CODECAPI_AVEncVideoOutputFrameRateConversion = GUID(0x8c068bf4, 0x369a, 0x4ba3, [0x82, 0xfd, 0xb2, 0x51, 0x8f, 0xb3, 0x39, 0x6e]);
struct CODECAPI_AVEncVideoOutputFrameRateConversion
{
}
alias eAVEncVideoOutputFrameRateConversion = int;
enum : int
{
    eAVEncVideoOutputFrameRateConversion_Disable = 0x00000000,
    eAVEncVideoOutputFrameRateConversion_Enable  = 0x00000001,
    eAVEncVideoOutputFrameRateConversion_Alias   = 0x00000002,
}

enum CLSID_CODECAPI_AVEncVideoPixelAspectRatio = GUID(0x3cdc718f, 0xb3e9, 0x4eb6, [0xa5, 0x7f, 0xcf, 0x1f, 0x1b, 0x32, 0x1b, 0x87]);
struct CODECAPI_AVEncVideoPixelAspectRatio
{
}
enum CLSID_CODECAPI_AVDecVideoAcceleration_MPEG2 = GUID(0xf7db8a2e, 0x4f48, 0x4ee8, [0xae, 0x31, 0x8b, 0x6e, 0xbe, 0x55, 0x8a, 0xe2]);
struct CODECAPI_AVDecVideoAcceleration_MPEG2
{
}
enum CLSID_CODECAPI_AVDecVideoAcceleration_H264 = GUID(0xf7db8a2f, 0x4f48, 0x4ee8, [0xae, 0x31, 0x8b, 0x6e, 0xbe, 0x55, 0x8a, 0xe2]);
struct CODECAPI_AVDecVideoAcceleration_H264
{
}
enum CLSID_CODECAPI_AVDecVideoAcceleration_VC1 = GUID(0xf7db8a30, 0x4f48, 0x4ee8, [0xae, 0x31, 0x8b, 0x6e, 0xbe, 0x55, 0x8a, 0xe2]);
struct CODECAPI_AVDecVideoAcceleration_VC1
{
}
enum CLSID_CODECAPI_AVDecVideoProcDeinterlaceCSC = GUID(0xf7db8a31, 0x4f48, 0x4ee8, [0xae, 0x31, 0x8b, 0x6e, 0xbe, 0x55, 0x8a, 0xe2]);
struct CODECAPI_AVDecVideoProcDeinterlaceCSC
{
}
enum CLSID_CODECAPI_AVDecVideoThumbnailGenerationMode = GUID(0x2efd8eee, 0x1150, 0x4328, [0x9c, 0xf5, 0x66, 0xdc, 0xe9, 0x33, 0xfc, 0xf4]);
struct CODECAPI_AVDecVideoThumbnailGenerationMode
{
}
enum CLSID_CODECAPI_AVDecVideoMaxCodedWidth = GUID(0x5ae557b8, 0x77af, 0x41f5, [0x9f, 0xa6, 0x4d, 0xb2, 0xfe, 0x1d, 0x4b, 0xca]);
struct CODECAPI_AVDecVideoMaxCodedWidth
{
}
enum CLSID_CODECAPI_AVDecVideoMaxCodedHeight = GUID(0x7262a16a, 0xd2dc, 0x4e75, [0x9b, 0xa8, 0x65, 0xc0, 0xc6, 0xd3, 0x2b, 0x13]);
struct CODECAPI_AVDecVideoMaxCodedHeight
{
}
enum CLSID_CODECAPI_AVDecNumWorkerThreads = GUID(0x9561c3e8, 0xea9e, 0x4435, [0x9b, 0x1e, 0xa9, 0x3e, 0x69, 0x18, 0x94, 0xd8]);
struct CODECAPI_AVDecNumWorkerThreads
{
}
enum CLSID_CODECAPI_AVDecSoftwareDynamicFormatChange = GUID(0x862e2f0a, 0x507b, 0x47ff, [0xaf, 0x47, 0x1, 0xe2, 0x62, 0x42, 0x98, 0xb7]);
struct CODECAPI_AVDecSoftwareDynamicFormatChange
{
}
enum CLSID_CODECAPI_AVDecDisableVideoPostProcessing = GUID(0xf8749193, 0x667a, 0x4f2c, [0xa9, 0xe8, 0x5d, 0x4a, 0xf9, 0x24, 0xf0, 0x8f]);
struct CODECAPI_AVDecDisableVideoPostProcessing
{
}
enum CLSID_CODECAPI_AVDecVideoDropPicWithMissingRef = GUID(0xf8226383, 0x14c2, 0x4567, [0x97, 0x34, 0x50, 0x4, 0xe9, 0x6f, 0xf8, 0x87]);
struct CODECAPI_AVDecVideoDropPicWithMissingRef
{
}
enum CLSID_CODECAPI_AVDecVideoSoftwareDeinterlaceMode = GUID(0xc08d1ce, 0x9ced, 0x4540, [0xba, 0xe3, 0xce, 0xb3, 0x80, 0x14, 0x11, 0x9]);
struct CODECAPI_AVDecVideoSoftwareDeinterlaceMode
{
}
alias eAVDecVideoSoftwareDeinterlaceMode = int;
enum : int
{
    eAVDecVideoSoftwareDeinterlaceMode_NoDeinterlacing          = 0x00000000,
    eAVDecVideoSoftwareDeinterlaceMode_ProgressiveDeinterlacing = 0x00000001,
    eAVDecVideoSoftwareDeinterlaceMode_BOBDeinterlacing         = 0x00000002,
    eAVDecVideoSoftwareDeinterlaceMode_SmartBOBDeinterlacing    = 0x00000003,
}

enum CLSID_CODECAPI_AVDecVideoFastDecodeMode = GUID(0x6b529f7d, 0xd3b1, 0x49c6, [0xa9, 0x99, 0x9e, 0xc6, 0x91, 0x1b, 0xed, 0xbf]);
struct CODECAPI_AVDecVideoFastDecodeMode
{
}
alias eAVFastDecodeMode = int;
enum : int
{
    eVideoDecodeCompliant = 0x00000000,
    eVideoDecodeOptimalLF = 0x00000001,
    eVideoDecodeDisableLF = 0x00000002,
    eVideoDecodeFastest   = 0x00000020,
}

enum CLSID_CODECAPI_AVLowLatencyMode = GUID(0x9c27891a, 0xed7a, 0x40e1, [0x88, 0xe8, 0xb2, 0x27, 0x27, 0xa0, 0x24, 0xee]);
struct CODECAPI_AVLowLatencyMode
{
}
enum CLSID_CODECAPI_AVDecVideoH264ErrorConcealment = GUID(0xececace8, 0x3436, 0x462c, [0x92, 0x94, 0xcd, 0x7b, 0xac, 0xd7, 0x58, 0xa9]);
struct CODECAPI_AVDecVideoH264ErrorConcealment
{
}
alias eAVDecVideoH264ErrorConcealment = int;
enum : int
{
    eErrorConcealmentTypeDrop         = 0x00000000,
    eErrorConcealmentTypeBasic        = 0x00000001,
    eErrorConcealmentTypeAdvanced     = 0x00000002,
    eErrorConcealmentTypeDXVASetBlack = 0x00000003,
}

enum CLSID_CODECAPI_AVDecVideoMPEG2ErrorConcealment = GUID(0x9d2bfe18, 0x728d, 0x48d2, [0xb3, 0x58, 0xbc, 0x7e, 0x43, 0x6c, 0x66, 0x74]);
struct CODECAPI_AVDecVideoMPEG2ErrorConcealment
{
}
alias eAVDecVideoMPEG2ErrorConcealment = int;
enum : int
{
    eErrorConcealmentOff = 0x00000000,
    eErrorConcealmentOn  = 0x00000001,
}

enum CLSID_CODECAPI_AVDecVideoCodecType = GUID(0x434528e5, 0x21f0, 0x46b6, [0xb6, 0x2c, 0x9b, 0x1b, 0x6b, 0x65, 0x8c, 0xd1]);
struct CODECAPI_AVDecVideoCodecType
{
}
alias eAVDecVideoCodecType = int;
enum : int
{
    eAVDecVideoCodecType_NOTPLAYING = 0x00000000,
    eAVDecVideoCodecType_MPEG2      = 0x00000001,
    eAVDecVideoCodecType_H264       = 0x00000002,
}

enum CLSID_CODECAPI_AVDecVideoDXVAMode = GUID(0xf758f09e, 0x7337, 0x4ae7, [0x83, 0x87, 0x73, 0xdc, 0x2d, 0x54, 0xe6, 0x7d]);
struct CODECAPI_AVDecVideoDXVAMode
{
}
alias eAVDecVideoDXVAMode = int;
enum : int
{
    eAVDecVideoDXVAMode_NOTPLAYING = 0x00000000,
    eAVDecVideoDXVAMode_SW         = 0x00000001,
    eAVDecVideoDXVAMode_MC         = 0x00000002,
    eAVDecVideoDXVAMode_IDCT       = 0x00000003,
    eAVDecVideoDXVAMode_VLD        = 0x00000004,
}

enum CLSID_CODECAPI_AVDecVideoDXVABusEncryption = GUID(0x42153c8b, 0xfd0b, 0x4765, [0xa4, 0x62, 0xdd, 0xd9, 0xe8, 0xbc, 0xc3, 0x88]);
struct CODECAPI_AVDecVideoDXVABusEncryption
{
}
alias eAVDecVideoDXVABusEncryption = int;
enum : int
{
    eAVDecVideoDXVABusEncryption_NONE    = 0x00000000,
    eAVDecVideoDXVABusEncryption_PRIVATE = 0x00000001,
    eAVDecVideoDXVABusEncryption_AES     = 0x00000002,
}

enum CLSID_CODECAPI_AVEncVideoForceSourceScanType = GUID(0x1ef2065f, 0x58a, 0x4765, [0xa4, 0xfc, 0x8a, 0x86, 0x4c, 0x10, 0x30, 0x12]);
struct CODECAPI_AVEncVideoForceSourceScanType
{
}
alias eAVEncVideoSourceScanType = int;
enum : int
{
    eAVEncVideoSourceScan_Automatic   = 0x00000000,
    eAVEncVideoSourceScan_Interlaced  = 0x00000001,
    eAVEncVideoSourceScan_Progressive = 0x00000002,
}

enum CLSID_CODECAPI_AVEncVideoNoOfFieldsToEncode = GUID(0x61e4bbe2, 0x4ee0, 0x40e7, [0x80, 0xab, 0x51, 0xdd, 0xee, 0xbe, 0x62, 0x91]);
struct CODECAPI_AVEncVideoNoOfFieldsToEncode
{
}
enum CLSID_CODECAPI_AVEncVideoNoOfFieldsToSkip = GUID(0xa97e1240, 0x1427, 0x4c16, [0xa7, 0xf7, 0x3d, 0xcf, 0xd8, 0xba, 0x4c, 0xc5]);
struct CODECAPI_AVEncVideoNoOfFieldsToSkip
{
}
enum CLSID_CODECAPI_AVEncVideoEncodeDimension = GUID(0x1074df28, 0x7e0f, 0x47a4, [0xa4, 0x53, 0xcd, 0xd7, 0x38, 0x70, 0xf5, 0xce]);
struct CODECAPI_AVEncVideoEncodeDimension
{
}
enum CLSID_CODECAPI_AVEncVideoEncodeOffsetOrigin = GUID(0x6bc098fe, 0xa71a, 0x4454, [0x85, 0x2e, 0x4d, 0x2d, 0xde, 0xb2, 0xcd, 0x24]);
struct CODECAPI_AVEncVideoEncodeOffsetOrigin
{
}
enum CLSID_CODECAPI_AVEncVideoDisplayDimension = GUID(0xde053668, 0xf4ec, 0x47a9, [0x86, 0xd0, 0x83, 0x67, 0x70, 0xf0, 0xc1, 0xd5]);
struct CODECAPI_AVEncVideoDisplayDimension
{
}
enum CLSID_CODECAPI_AVEncVideoOutputScanType = GUID(0x460b5576, 0x842e, 0x49ab, [0xa6, 0x2d, 0xb3, 0x6f, 0x73, 0x12, 0xc9, 0xdb]);
struct CODECAPI_AVEncVideoOutputScanType
{
}
alias eAVEncVideoOutputScanType = int;
enum : int
{
    eAVEncVideoOutputScan_Progressive = 0x00000000,
    eAVEncVideoOutputScan_Interlaced  = 0x00000001,
    eAVEncVideoOutputScan_SameAsInput = 0x00000002,
    eAVEncVideoOutputScan_Automatic   = 0x00000003,
}

enum CLSID_CODECAPI_AVEncVideoInverseTelecineEnable = GUID(0x2ea9098b, 0xe76d, 0x4ccd, [0xa0, 0x30, 0xd3, 0xb8, 0x89, 0xc1, 0xb6, 0x4c]);
struct CODECAPI_AVEncVideoInverseTelecineEnable
{
}
enum CLSID_CODECAPI_AVEncVideoInverseTelecineThreshold = GUID(0x40247d84, 0xe895, 0x497f, [0xb4, 0x4c, 0xb7, 0x45, 0x60, 0xac, 0xfe, 0x27]);
struct CODECAPI_AVEncVideoInverseTelecineThreshold
{
}
enum CLSID_CODECAPI_AVEncVideoSourceFilmContent = GUID(0x1791c64b, 0xccfc, 0x4827, [0xa0, 0xed, 0x25, 0x57, 0x79, 0x3b, 0x2b, 0x1c]);
struct CODECAPI_AVEncVideoSourceFilmContent
{
}
alias eAVEncVideoFilmContent = int;
enum : int
{
    eAVEncVideoFilmContent_VideoOnly = 0x00000000,
    eAVEncVideoFilmContent_FilmOnly  = 0x00000001,
    eAVEncVideoFilmContent_Mixed     = 0x00000002,
}

enum CLSID_CODECAPI_AVEncVideoSourceIsBW = GUID(0x42ffc49b, 0x1812, 0x4fdc, [0x8d, 0x24, 0x70, 0x54, 0xc5, 0x21, 0xe6, 0xeb]);
struct CODECAPI_AVEncVideoSourceIsBW
{
}
enum CLSID_CODECAPI_AVEncVideoFieldSwap = GUID(0xfefd7569, 0x4e0a, 0x49f2, [0x9f, 0x2b, 0x36, 0xe, 0xa4, 0x8c, 0x19, 0xa2]);
struct CODECAPI_AVEncVideoFieldSwap
{
}
enum CLSID_CODECAPI_AVEncVideoInputChromaResolution = GUID(0xbb0cec33, 0x16f1, 0x47b0, [0x8a, 0x88, 0x37, 0x81, 0x5b, 0xee, 0x17, 0x39]);
struct CODECAPI_AVEncVideoInputChromaResolution
{
}
enum CLSID_CODECAPI_AVEncVideoOutputChromaResolution = GUID(0x6097b4c9, 0x7c1d, 0x4e64, [0xbf, 0xcc, 0x9e, 0x97, 0x65, 0x31, 0x8a, 0xe7]);
struct CODECAPI_AVEncVideoOutputChromaResolution
{
}
alias eAVEncVideoChromaResolution = int;
enum : int
{
    eAVEncVideoChromaResolution_SameAsSource = 0x00000000,
    eAVEncVideoChromaResolution_444          = 0x00000001,
    eAVEncVideoChromaResolution_422          = 0x00000002,
    eAVEncVideoChromaResolution_420          = 0x00000003,
    eAVEncVideoChromaResolution_411          = 0x00000004,
}

enum CLSID_CODECAPI_AVEncVideoInputChromaSubsampling = GUID(0xa8e73a39, 0x4435, 0x4ec3, [0xa6, 0xea, 0x98, 0x30, 0xf, 0x4b, 0x36, 0xf7]);
struct CODECAPI_AVEncVideoInputChromaSubsampling
{
}
enum CLSID_CODECAPI_AVEncVideoOutputChromaSubsampling = GUID(0xfa561c6c, 0x7d17, 0x44f0, [0x83, 0xc9, 0x32, 0xed, 0x12, 0xe9, 0x63, 0x43]);
struct CODECAPI_AVEncVideoOutputChromaSubsampling
{
}
alias eAVEncVideoChromaSubsampling = int;
enum : int
{
    eAVEncVideoChromaSubsamplingFormat_SameAsSource                   = 0x00000000,
    eAVEncVideoChromaSubsamplingFormat_ProgressiveChroma              = 0x00000008,
    eAVEncVideoChromaSubsamplingFormat_Horizontally_Cosited           = 0x00000004,
    eAVEncVideoChromaSubsamplingFormat_Vertically_Cosited             = 0x00000002,
    eAVEncVideoChromaSubsamplingFormat_Vertically_AlignedChromaPlanes = 0x00000001,
}

enum CLSID_CODECAPI_AVEncVideoInputColorPrimaries = GUID(0xc24d783f, 0x7ce6, 0x4278, [0x90, 0xab, 0x28, 0xa4, 0xf1, 0xe5, 0xf8, 0x6c]);
struct CODECAPI_AVEncVideoInputColorPrimaries
{
}
enum CLSID_CODECAPI_AVEncVideoOutputColorPrimaries = GUID(0xbe95907c, 0x9d04, 0x4921, [0x89, 0x85, 0xa6, 0xd6, 0xd8, 0x7d, 0x1a, 0x6c]);
struct CODECAPI_AVEncVideoOutputColorPrimaries
{
}
alias eAVEncVideoColorPrimaries = int;
enum : int
{
    eAVEncVideoColorPrimaries_SameAsSource  = 0x00000000,
    eAVEncVideoColorPrimaries_Reserved      = 0x00000001,
    eAVEncVideoColorPrimaries_BT709         = 0x00000002,
    eAVEncVideoColorPrimaries_BT470_2_SysM  = 0x00000003,
    eAVEncVideoColorPrimaries_BT470_2_SysBG = 0x00000004,
    eAVEncVideoColorPrimaries_SMPTE170M     = 0x00000005,
    eAVEncVideoColorPrimaries_SMPTE240M     = 0x00000006,
    eAVEncVideoColorPrimaries_EBU3231       = 0x00000007,
    eAVEncVideoColorPrimaries_SMPTE_C       = 0x00000008,
}

enum CLSID_CODECAPI_AVEncVideoInputColorTransferFunction = GUID(0x8c056111, 0xa9c3, 0x4b08, [0xa0, 0xa0, 0xce, 0x13, 0xf8, 0xa2, 0x7c, 0x75]);
struct CODECAPI_AVEncVideoInputColorTransferFunction
{
}
enum CLSID_CODECAPI_AVEncVideoOutputColorTransferFunction = GUID(0x4a7f884a, 0xea11, 0x460d, [0xbf, 0x57, 0xb8, 0x8b, 0xc7, 0x59, 0x0, 0xde]);
struct CODECAPI_AVEncVideoOutputColorTransferFunction
{
}
alias eAVEncVideoColorTransferFunction = int;
enum : int
{
    eAVEncVideoColorTransferFunction_SameAsSource = 0x00000000,
    eAVEncVideoColorTransferFunction_10           = 0x00000001,
    eAVEncVideoColorTransferFunction_18           = 0x00000002,
    eAVEncVideoColorTransferFunction_20           = 0x00000003,
    eAVEncVideoColorTransferFunction_22           = 0x00000004,
    eAVEncVideoColorTransferFunction_22_709       = 0x00000005,
    eAVEncVideoColorTransferFunction_22_240M      = 0x00000006,
    eAVEncVideoColorTransferFunction_22_8bit_sRGB = 0x00000007,
    eAVEncVideoColorTransferFunction_28           = 0x00000008,
}

enum CLSID_CODECAPI_AVEncVideoInputColorTransferMatrix = GUID(0x52ed68b9, 0x72d5, 0x4089, [0x95, 0x8d, 0xf5, 0x40, 0x5d, 0x55, 0x8, 0x1c]);
struct CODECAPI_AVEncVideoInputColorTransferMatrix
{
}
enum CLSID_CODECAPI_AVEncVideoOutputColorTransferMatrix = GUID(0xa9b90444, 0xaf40, 0x4310, [0x8f, 0xbe, 0xed, 0x6d, 0x93, 0x3f, 0x89, 0x2b]);
struct CODECAPI_AVEncVideoOutputColorTransferMatrix
{
}
alias eAVEncVideoColorTransferMatrix = int;
enum : int
{
    eAVEncVideoColorTransferMatrix_SameAsSource = 0x00000000,
    eAVEncVideoColorTransferMatrix_BT709        = 0x00000001,
    eAVEncVideoColorTransferMatrix_BT601        = 0x00000002,
    eAVEncVideoColorTransferMatrix_SMPTE240M    = 0x00000003,
}

enum CLSID_CODECAPI_AVEncVideoInputColorLighting = GUID(0x46a99549, 0x15, 0x4a45, [0x9c, 0x30, 0x1d, 0x5c, 0xfa, 0x25, 0x83, 0x16]);
struct CODECAPI_AVEncVideoInputColorLighting
{
}
enum CLSID_CODECAPI_AVEncVideoOutputColorLighting = GUID(0xe5aaac6, 0xace6, 0x4c5c, [0x99, 0x8e, 0x1a, 0x8c, 0x9c, 0x6c, 0xf, 0x89]);
struct CODECAPI_AVEncVideoOutputColorLighting
{
}
alias eAVEncVideoColorLighting = int;
enum : int
{
    eAVEncVideoColorLighting_SameAsSource = 0x00000000,
    eAVEncVideoColorLighting_Unknown      = 0x00000001,
    eAVEncVideoColorLighting_Bright       = 0x00000002,
    eAVEncVideoColorLighting_Office       = 0x00000003,
    eAVEncVideoColorLighting_Dim          = 0x00000004,
    eAVEncVideoColorLighting_Dark         = 0x00000005,
}

enum CLSID_CODECAPI_AVEncVideoInputColorNominalRange = GUID(0x16cf25c6, 0xa2a6, 0x48e9, [0xae, 0x80, 0x21, 0xae, 0xc4, 0x1d, 0x42, 0x7e]);
struct CODECAPI_AVEncVideoInputColorNominalRange
{
}
enum CLSID_CODECAPI_AVEncVideoOutputColorNominalRange = GUID(0x972835ed, 0x87b5, 0x4e95, [0x95, 0x0, 0xc7, 0x39, 0x58, 0x56, 0x6e, 0x54]);
struct CODECAPI_AVEncVideoOutputColorNominalRange
{
}
alias eAVEncVideoColorNominalRange = int;
enum : int
{
    eAVEncVideoColorNominalRange_SameAsSource = 0x00000000,
    eAVEncVideoColorNominalRange_0_255        = 0x00000001,
    eAVEncVideoColorNominalRange_16_235       = 0x00000002,
    eAVEncVideoColorNominalRange_48_208       = 0x00000003,
}

enum CLSID_CODECAPI_AVEncInputVideoSystem = GUID(0xbede146d, 0xb616, 0x4dc7, [0x92, 0xb2, 0xf5, 0xd9, 0xfa, 0x92, 0x98, 0xf7]);
struct CODECAPI_AVEncInputVideoSystem
{
}
alias eAVEncInputVideoSystem = int;
enum : int
{
    eAVEncInputVideoSystem_Unspecified = 0x00000000,
    eAVEncInputVideoSystem_PAL         = 0x00000001,
    eAVEncInputVideoSystem_NTSC        = 0x00000002,
    eAVEncInputVideoSystem_SECAM       = 0x00000003,
    eAVEncInputVideoSystem_MAC         = 0x00000004,
    eAVEncInputVideoSystem_HDV         = 0x00000005,
    eAVEncInputVideoSystem_Component   = 0x00000006,
}

enum CLSID_CODECAPI_AVEncVideoHeaderDropFrame = GUID(0x6ed9e124, 0x7925, 0x43fe, [0x97, 0x1b, 0xe0, 0x19, 0xf6, 0x22, 0x22, 0xb4]);
struct CODECAPI_AVEncVideoHeaderDropFrame
{
}
enum CLSID_CODECAPI_AVEncVideoHeaderHours = GUID(0x2acc7702, 0xe2da, 0x4158, [0xbf, 0x9b, 0x88, 0x88, 0x1, 0x29, 0xd7, 0x40]);
struct CODECAPI_AVEncVideoHeaderHours
{
}
enum CLSID_CODECAPI_AVEncVideoHeaderMinutes = GUID(0xdc1a99ce, 0x307, 0x408b, [0x88, 0xb, 0xb8, 0x34, 0x8e, 0xe8, 0xca, 0x7f]);
struct CODECAPI_AVEncVideoHeaderMinutes
{
}
enum CLSID_CODECAPI_AVEncVideoHeaderSeconds = GUID(0x4a2e1a05, 0xa780, 0x4f58, [0x81, 0x20, 0x9a, 0x44, 0x9d, 0x69, 0x65, 0x6b]);
struct CODECAPI_AVEncVideoHeaderSeconds
{
}
enum CLSID_CODECAPI_AVEncVideoHeaderFrames = GUID(0xafd5f567, 0x5c1b, 0x4adc, [0xbd, 0xaf, 0x73, 0x56, 0x10, 0x38, 0x14, 0x36]);
struct CODECAPI_AVEncVideoHeaderFrames
{
}
enum CLSID_CODECAPI_AVEncVideoDefaultUpperFieldDominant = GUID(0x810167c4, 0xbc1, 0x47ca, [0x8f, 0xc2, 0x57, 0x5, 0x5a, 0x14, 0x74, 0xa5]);
struct CODECAPI_AVEncVideoDefaultUpperFieldDominant
{
}
enum CLSID_CODECAPI_AVEncVideoCBRMotionTradeoff = GUID(0xd49451e, 0x18d5, 0x4367, [0xa4, 0xef, 0x32, 0x40, 0xdf, 0x16, 0x93, 0xc4]);
struct CODECAPI_AVEncVideoCBRMotionTradeoff
{
}
enum CLSID_CODECAPI_AVEncVideoCodedVideoAccessUnitSize = GUID(0xb4b10c15, 0x14a7, 0x4ce8, [0xb1, 0x73, 0xdc, 0x90, 0xa0, 0xb4, 0xfc, 0xdb]);
struct CODECAPI_AVEncVideoCodedVideoAccessUnitSize
{
}
enum CLSID_CODECAPI_AVEncVideoMaxKeyframeDistance = GUID(0x2987123a, 0xba93, 0x4704, [0xb4, 0x89, 0xec, 0x1e, 0x5f, 0x25, 0x29, 0x2c]);
struct CODECAPI_AVEncVideoMaxKeyframeDistance
{
}
enum CLSID_CODECAPI_AVEncH264CABACEnable = GUID(0xee6cad62, 0xd305, 0x4248, [0xa5, 0xe, 0xe1, 0xb2, 0x55, 0xf7, 0xca, 0xf8]);
struct CODECAPI_AVEncH264CABACEnable
{
}
enum CLSID_CODECAPI_AVEncVideoContentType = GUID(0x66117aca, 0xeb77, 0x459d, [0x93, 0xc, 0xa4, 0x8d, 0x9d, 0x6, 0x83, 0xfc]);
struct CODECAPI_AVEncVideoContentType
{
}
alias eAVEncVideoContentType = int;
enum : int
{
    eAVEncVideoContentType_Unknown          = 0x00000000,
    eAVEncVideoContentType_FixedCameraAngle = 0x00000001,
}

enum CLSID_CODECAPI_AVEncNumWorkerThreads = GUID(0xb0c8bf60, 0x16f7, 0x4951, [0xa3, 0xb, 0x1d, 0xb1, 0x60, 0x92, 0x93, 0xd6]);
struct CODECAPI_AVEncNumWorkerThreads
{
}
enum CLSID_CODECAPI_AVEncVideoEncodeQP = GUID(0x2cb5696b, 0x23fb, 0x4ce1, [0xa0, 0xf9, 0xef, 0x5b, 0x90, 0xfd, 0x55, 0xca]);
struct CODECAPI_AVEncVideoEncodeQP
{
}
enum CLSID_CODECAPI_AVEncVideoMinQP = GUID(0xee22c6a, 0xa37c, 0x4568, [0xb5, 0xf1, 0x9d, 0x4c, 0x2b, 0x3a, 0xb8, 0x86]);
struct CODECAPI_AVEncVideoMinQP
{
}
enum CLSID_CODECAPI_AVEncVideoForceKeyFrame = GUID(0x398c1b98, 0x8353, 0x475a, [0x9e, 0xf2, 0x8f, 0x26, 0x5d, 0x26, 0x3, 0x45]);
struct CODECAPI_AVEncVideoForceKeyFrame
{
}
enum CLSID_CODECAPI_AVEncH264SPSID = GUID(0x50f38f51, 0x2b79, 0x40e3, [0xb3, 0x9c, 0x7e, 0x9f, 0xa0, 0x77, 0x5, 0x1]);
struct CODECAPI_AVEncH264SPSID
{
}
enum CLSID_CODECAPI_AVEncH264PPSID = GUID(0xbfe29ec2, 0x56c, 0x4d68, [0xa3, 0x8d, 0xae, 0x59, 0x44, 0xc8, 0x58, 0x2e]);
struct CODECAPI_AVEncH264PPSID
{
}
enum CLSID_CODECAPI_AVEncAdaptiveMode = GUID(0x4419b185, 0xda1f, 0x4f53, [0xbc, 0x76, 0x9, 0x7d, 0xc, 0x1e, 0xfb, 0x1e]);
struct CODECAPI_AVEncAdaptiveMode
{
}
enum CLSID_CODECAPI_AVScenarioInfo = GUID(0xb28a6e64, 0x3ff9, 0x446a, [0x8a, 0x4b, 0xd, 0x7a, 0x53, 0x41, 0x32, 0x36]);
struct CODECAPI_AVScenarioInfo
{
}
enum CLSID_CODECAPI_AVEncMPVGOPSizeMin = GUID(0x7155cf20, 0xd440, 0x4852, [0xad, 0xf, 0x9c, 0x4a, 0xbf, 0xe3, 0x7a, 0x6a]);
struct CODECAPI_AVEncMPVGOPSizeMin
{
}
enum CLSID_CODECAPI_AVEncMPVGOPSizeMax = GUID(0xfe7de4c4, 0x1936, 0x4fe2, [0xbd, 0xf7, 0x1f, 0x18, 0xca, 0x1d, 0x0, 0x1f]);
struct CODECAPI_AVEncMPVGOPSizeMax
{
}
enum CLSID_CODECAPI_AVEncVideoMaxCTBSize = GUID(0x822363ff, 0xcec8, 0x43e5, [0x92, 0xfd, 0xe0, 0x97, 0x48, 0x84, 0x85, 0xe9]);
struct CODECAPI_AVEncVideoMaxCTBSize
{
}
enum CLSID_CODECAPI_AVEncVideoCTBSize = GUID(0xd47db8b2, 0xe73b, 0x4cb9, [0x8c, 0x3e, 0xbd, 0x87, 0x7d, 0x6, 0xd7, 0x7b]);
struct CODECAPI_AVEncVideoCTBSize
{
}
enum CLSID_CODECAPI_VideoEncoderDisplayContentType = GUID(0x79b90b27, 0xf4b1, 0x42dc, [0x9d, 0xd7, 0xcd, 0xaf, 0x81, 0x35, 0xc4, 0x0]);
struct CODECAPI_VideoEncoderDisplayContentType
{
}
enum CLSID_CODECAPI_AVEncEnableVideoProcessing = GUID(0x6f4bf6, 0xea3, 0x4d42, [0x87, 0x2, 0xb5, 0xd8, 0xbe, 0xf, 0x7a, 0x92]);
struct CODECAPI_AVEncEnableVideoProcessing
{
}
enum CLSID_CODECAPI_AVEncVideoGradualIntraRefresh = GUID(0x8f347dee, 0xcb0d, 0x49ba, [0xb4, 0x62, 0xdb, 0x69, 0x27, 0xee, 0x21, 0x1]);
struct CODECAPI_AVEncVideoGradualIntraRefresh
{
}
enum CLSID_CODECAPI_GetOPMContext = GUID(0x2f036c05, 0x4c14, 0x4689, [0x88, 0x39, 0x29, 0x4c, 0x6d, 0x73, 0xe0, 0x53]);
struct CODECAPI_GetOPMContext
{
}
enum CLSID_CODECAPI_SetHDCPManagerContext = GUID(0x6d2d1fc8, 0x3dc9, 0x47eb, [0xa1, 0xa2, 0x47, 0x1c, 0x80, 0xcd, 0x60, 0xd0]);
struct CODECAPI_SetHDCPManagerContext
{
}
enum CLSID_CODECAPI_AVEncVideoMaxTemporalLayers = GUID(0x9c668cfe, 0x8e1, 0x424a, [0x93, 0x4e, 0xb7, 0x64, 0xb0, 0x64, 0x80, 0x2a]);
struct CODECAPI_AVEncVideoMaxTemporalLayers
{
}
enum CLSID_CODECAPI_AVEncVideoNumGOPsPerIDR = GUID(0x83bc5bdb, 0x5b89, 0x4521, [0x8f, 0x66, 0x33, 0x15, 0x1c, 0x37, 0x31, 0x76]);
struct CODECAPI_AVEncVideoNumGOPsPerIDR
{
}
enum CLSID_CODECAPI_AVEncCommonAllowFrameDrops = GUID(0xd8477dcb, 0x9598, 0x48e3, [0x8d, 0xc, 0x75, 0x2b, 0xf2, 0x6, 0x9, 0x3e]);
struct CODECAPI_AVEncCommonAllowFrameDrops
{
}
enum CLSID_CODECAPI_AVEncVideoIntraLayerPrediction = GUID(0xd3af46b8, 0xbf47, 0x44bb, [0xa2, 0x83, 0x69, 0xf0, 0xb0, 0x22, 0x8f, 0xf9]);
struct CODECAPI_AVEncVideoIntraLayerPrediction
{
}
enum CLSID_CODECAPI_AVEncVideoInstantTemporalUpSwitching = GUID(0xa3308307, 0xd96, 0x4ba4, [0xb1, 0xf0, 0xb9, 0x1a, 0x5e, 0x49, 0xdf, 0x10]);
struct CODECAPI_AVEncVideoInstantTemporalUpSwitching
{
}
enum CLSID_CODECAPI_AVEncLowPowerEncoder = GUID(0xb668d582, 0x8bad, 0x4f6a, [0x91, 0x41, 0x37, 0x5a, 0x95, 0x35, 0x8b, 0x6d]);
struct CODECAPI_AVEncLowPowerEncoder
{
}
enum CLSID_CODECAPI_AVEnableInLoopDeblockFilter = GUID(0xd2e8e399, 0x623, 0x4bf3, [0x92, 0xa8, 0x4d, 0x18, 0x18, 0x52, 0x9d, 0xed]);
struct CODECAPI_AVEnableInLoopDeblockFilter
{
}
alias eAVEncAdaptiveMode = int;
enum : int
{
    eAVEncAdaptiveMode_None       = 0x00000000,
    eAVEncAdaptiveMode_Resolution = 0x00000001,
    eAVEncAdaptiveMode_FrameRate  = 0x00000002,
}

alias eAVScenarioInfo = int;
enum : int
{
    eAVScenarioInfo_Unknown                       = 0x00000000,
    eAVScenarioInfo_DisplayRemoting               = 0x00000001,
    eAVScenarioInfo_VideoConference               = 0x00000002,
    eAVScenarioInfo_Archive                       = 0x00000003,
    eAVScenarioInfo_LiveStreaming                 = 0x00000004,
    eAVScenarioInfo_CameraRecord                  = 0x00000005,
    eAVScenarioInfo_DisplayRemotingWithFeatureMap = 0x00000006,
}

alias eVideoEncoderDisplayContentType = int;
enum : int
{
    eVideoEncoderDisplayContent_Unknown         = 0x00000000,
    eVideoEncoderDisplayContent_FullScreenVideo = 0x00000001,
}

enum CLSID_CODECAPI_AVEncVideoSelectLayer = GUID(0xeb1084f5, 0x6aaa, 0x4914, [0xbb, 0x2f, 0x61, 0x47, 0x22, 0x7f, 0x12, 0xe7]);
struct CODECAPI_AVEncVideoSelectLayer
{
}
enum CLSID_CODECAPI_AVEncVideoTemporalLayerCount = GUID(0x19caebff, 0xb74d, 0x4cfd, [0x8c, 0x27, 0xc2, 0xf9, 0xd9, 0x7d, 0x5f, 0x52]);
struct CODECAPI_AVEncVideoTemporalLayerCount
{
}
enum CLSID_CODECAPI_AVEncVideoUsage = GUID(0x1f636849, 0x5dc1, 0x49f1, [0xb1, 0xd8, 0xce, 0x3c, 0xf6, 0x2e, 0xa3, 0x85]);
struct CODECAPI_AVEncVideoUsage
{
}
enum CLSID_CODECAPI_AVEncVideoRateControlParams = GUID(0x87d43767, 0x7645, 0x44ec, [0xb4, 0x38, 0xd3, 0x32, 0x2f, 0xbc, 0xa2, 0x9f]);
struct CODECAPI_AVEncVideoRateControlParams
{
}
enum CLSID_CODECAPI_AVEncVideoSupportedControls = GUID(0xd3f40fdd, 0x77b9, 0x473d, [0x81, 0x96, 0x6, 0x12, 0x59, 0xe6, 0x9c, 0xff]);
struct CODECAPI_AVEncVideoSupportedControls
{
}
enum CLSID_CODECAPI_AVEncVideoEncodeFrameTypeQP = GUID(0xaa70b610, 0xe03f, 0x450c, [0xad, 0x7, 0x7, 0x31, 0x4e, 0x63, 0x9c, 0xe7]);
struct CODECAPI_AVEncVideoEncodeFrameTypeQP
{
}
enum CLSID_CODECAPI_AVEncSliceControlMode = GUID(0xe9e782ef, 0x5f18, 0x44c9, [0xa9, 0xb, 0xe9, 0xc3, 0xc2, 0xc1, 0x7b, 0xb]);
struct CODECAPI_AVEncSliceControlMode
{
}
enum CLSID_CODECAPI_AVEncSliceControlSize = GUID(0x92f51df3, 0x7a5, 0x4172, [0xae, 0xfe, 0xc6, 0x9c, 0xa3, 0xb6, 0xe, 0x35]);
struct CODECAPI_AVEncSliceControlSize
{
}
enum CLSID_CODECAPI_AVEncSliceGenerationMode = GUID(0x8a6bc67f, 0x9497, 0x4286, [0xb4, 0x6b, 0x2, 0xdb, 0x8d, 0x60, 0xed, 0xbc]);
struct CODECAPI_AVEncSliceGenerationMode
{
}
enum CLSID_CODECAPI_AVEncVideoMaxNumRefFrame = GUID(0x964829ed, 0x94f9, 0x43b4, [0xb7, 0x4d, 0xef, 0x40, 0x94, 0x4b, 0x69, 0xa0]);
struct CODECAPI_AVEncVideoMaxNumRefFrame
{
}
enum CLSID_CODECAPI_AVEncVideoMeanAbsoluteDifference = GUID(0xe5c0c10f, 0x81a4, 0x422d, [0x8c, 0x3f, 0xb4, 0x74, 0xa4, 0x58, 0x13, 0x36]);
struct CODECAPI_AVEncVideoMeanAbsoluteDifference
{
}
enum CLSID_CODECAPI_AVEncVideoMaxQP = GUID(0x3daf6f66, 0xa6a7, 0x45e0, [0xa8, 0xe5, 0xf2, 0x74, 0x3f, 0x46, 0xa3, 0xa2]);
struct CODECAPI_AVEncVideoMaxQP
{
}
enum CLSID_CODECAPI_AVEncVideoLTRBufferControl = GUID(0xa4a0e93d, 0x4cbc, 0x444c, [0x89, 0xf4, 0x82, 0x6d, 0x31, 0xe, 0x92, 0xa7]);
struct CODECAPI_AVEncVideoLTRBufferControl
{
}
enum CLSID_CODECAPI_AVEncVideoMarkLTRFrame = GUID(0xe42f4748, 0xa06d, 0x4ef9, [0x8c, 0xea, 0x3d, 0x5, 0xfd, 0xe3, 0xbd, 0x3b]);
struct CODECAPI_AVEncVideoMarkLTRFrame
{
}
enum CLSID_CODECAPI_AVEncVideoUseLTRFrame = GUID(0x752db8, 0x55f7, 0x4f80, [0x89, 0x5b, 0x27, 0x63, 0x91, 0x95, 0xf2, 0xad]);
struct CODECAPI_AVEncVideoUseLTRFrame
{
}
enum CLSID_CODECAPI_AVEncVideoROIEnabled = GUID(0xd74f7f18, 0x44dd, 0x4b85, [0xab, 0xa3, 0x5, 0xd9, 0xf4, 0x2a, 0x82, 0x80]);
struct CODECAPI_AVEncVideoROIEnabled
{
}
enum CLSID_CODECAPI_AVEncVideoDirtyRectEnabled = GUID(0x8acb8fdd, 0x5e0c, 0x4c66, [0x87, 0x29, 0xb8, 0xf6, 0x29, 0xab, 0x4, 0xfb]);
struct CODECAPI_AVEncVideoDirtyRectEnabled
{
}
enum CLSID_CODECAPI_AVEncMaxFrameRate = GUID(0xb98e1b31, 0x19fa, 0x4d4f, [0x99, 0x31, 0xd6, 0xa5, 0xb8, 0xaa, 0xb9, 0x3c]);
struct CODECAPI_AVEncMaxFrameRate
{
}
enum CLSID_CODECAPI_AVEncMuxOutputStreamType = GUID(0xcedd9e8f, 0x34d3, 0x44db, [0xa1, 0xd8, 0xf8, 0x15, 0x20, 0x25, 0x4f, 0x3e]);
struct CODECAPI_AVEncMuxOutputStreamType
{
}
alias eAVEncMuxOutput = int;
enum : int
{
    eAVEncMuxOutputAuto = 0x00000000,
    eAVEncMuxOutputPS   = 0x00000001,
    eAVEncMuxOutputTS   = 0x00000002,
}

enum CLSID_CODECAPI_AVEncStatVideoOutputFrameRate = GUID(0xbe747849, 0x9ab4, 0x4a63, [0x98, 0xfe, 0xf1, 0x43, 0xf0, 0x4f, 0x8e, 0xe9]);
struct CODECAPI_AVEncStatVideoOutputFrameRate
{
}
enum CLSID_CODECAPI_AVEncStatVideoCodedFrames = GUID(0xd47f8d61, 0x6f5a, 0x4a26, [0xbb, 0x9f, 0xcd, 0x95, 0x18, 0x46, 0x2b, 0xcd]);
struct CODECAPI_AVEncStatVideoCodedFrames
{
}
enum CLSID_CODECAPI_AVEncStatVideoTotalFrames = GUID(0xfdaa9916, 0x119a, 0x4222, [0x9a, 0xd6, 0x3f, 0x7c, 0xab, 0x99, 0xcc, 0x8b]);
struct CODECAPI_AVEncStatVideoTotalFrames
{
}
enum CLSID_CODECAPI_AVEncAudioIntervalToEncode = GUID(0x866e4b4d, 0x725a, 0x467c, [0xbb, 0x1, 0xb4, 0x96, 0xb2, 0x3b, 0x25, 0xf9]);
struct CODECAPI_AVEncAudioIntervalToEncode
{
}
enum CLSID_CODECAPI_AVEncAudioIntervalToSkip = GUID(0x88c15f94, 0xc38c, 0x4796, [0xa9, 0xe8, 0x96, 0xe9, 0x67, 0x98, 0x3f, 0x26]);
struct CODECAPI_AVEncAudioIntervalToSkip
{
}
enum CLSID_CODECAPI_AVEncAudioDualMono = GUID(0x3648126b, 0xa3e8, 0x4329, [0x9b, 0x3a, 0x5c, 0xe5, 0x66, 0xa4, 0x3b, 0xd3]);
struct CODECAPI_AVEncAudioDualMono
{
}
alias eAVEncAudioDualMono = int;
enum : int
{
    eAVEncAudioDualMono_SameAsInput = 0x00000000,
    eAVEncAudioDualMono_Off         = 0x00000001,
    eAVEncAudioDualMono_On          = 0x00000002,
}

enum CLSID_CODECAPI_AVEncAudioMeanBitRate = GUID(0x921295bb, 0x4fca, 0x4679, [0xaa, 0xb8, 0x9e, 0x2a, 0x1d, 0x75, 0x33, 0x84]);
struct CODECAPI_AVEncAudioMeanBitRate
{
}
enum CLSID_CODECAPI_AVEncAudioMapDestChannel0 = GUID(0xbc5d0b60, 0xdf6a, 0x4e16, [0x98, 0x3, 0xb8, 0x20, 0x7, 0xa3, 0xc, 0x8d]);
struct CODECAPI_AVEncAudioMapDestChannel0
{
}
enum CLSID_CODECAPI_AVEncAudioMapDestChannel1 = GUID(0xbc5d0b61, 0xdf6a, 0x4e16, [0x98, 0x3, 0xb8, 0x20, 0x7, 0xa3, 0xc, 0x8d]);
struct CODECAPI_AVEncAudioMapDestChannel1
{
}
enum CLSID_CODECAPI_AVEncAudioMapDestChannel2 = GUID(0xbc5d0b62, 0xdf6a, 0x4e16, [0x98, 0x3, 0xb8, 0x20, 0x7, 0xa3, 0xc, 0x8d]);
struct CODECAPI_AVEncAudioMapDestChannel2
{
}
enum CLSID_CODECAPI_AVEncAudioMapDestChannel3 = GUID(0xbc5d0b63, 0xdf6a, 0x4e16, [0x98, 0x3, 0xb8, 0x20, 0x7, 0xa3, 0xc, 0x8d]);
struct CODECAPI_AVEncAudioMapDestChannel3
{
}
enum CLSID_CODECAPI_AVEncAudioMapDestChannel4 = GUID(0xbc5d0b64, 0xdf6a, 0x4e16, [0x98, 0x3, 0xb8, 0x20, 0x7, 0xa3, 0xc, 0x8d]);
struct CODECAPI_AVEncAudioMapDestChannel4
{
}
enum CLSID_CODECAPI_AVEncAudioMapDestChannel5 = GUID(0xbc5d0b65, 0xdf6a, 0x4e16, [0x98, 0x3, 0xb8, 0x20, 0x7, 0xa3, 0xc, 0x8d]);
struct CODECAPI_AVEncAudioMapDestChannel5
{
}
enum CLSID_CODECAPI_AVEncAudioMapDestChannel6 = GUID(0xbc5d0b66, 0xdf6a, 0x4e16, [0x98, 0x3, 0xb8, 0x20, 0x7, 0xa3, 0xc, 0x8d]);
struct CODECAPI_AVEncAudioMapDestChannel6
{
}
enum CLSID_CODECAPI_AVEncAudioMapDestChannel7 = GUID(0xbc5d0b67, 0xdf6a, 0x4e16, [0x98, 0x3, 0xb8, 0x20, 0x7, 0xa3, 0xc, 0x8d]);
struct CODECAPI_AVEncAudioMapDestChannel7
{
}
enum CLSID_CODECAPI_AVEncAudioMapDestChannel8 = GUID(0xbc5d0b68, 0xdf6a, 0x4e16, [0x98, 0x3, 0xb8, 0x20, 0x7, 0xa3, 0xc, 0x8d]);
struct CODECAPI_AVEncAudioMapDestChannel8
{
}
enum CLSID_CODECAPI_AVEncAudioMapDestChannel9 = GUID(0xbc5d0b69, 0xdf6a, 0x4e16, [0x98, 0x3, 0xb8, 0x20, 0x7, 0xa3, 0xc, 0x8d]);
struct CODECAPI_AVEncAudioMapDestChannel9
{
}
enum CLSID_CODECAPI_AVEncAudioMapDestChannel10 = GUID(0xbc5d0b6a, 0xdf6a, 0x4e16, [0x98, 0x3, 0xb8, 0x20, 0x7, 0xa3, 0xc, 0x8d]);
struct CODECAPI_AVEncAudioMapDestChannel10
{
}
enum CLSID_CODECAPI_AVEncAudioMapDestChannel11 = GUID(0xbc5d0b6b, 0xdf6a, 0x4e16, [0x98, 0x3, 0xb8, 0x20, 0x7, 0xa3, 0xc, 0x8d]);
struct CODECAPI_AVEncAudioMapDestChannel11
{
}
enum CLSID_CODECAPI_AVEncAudioMapDestChannel12 = GUID(0xbc5d0b6c, 0xdf6a, 0x4e16, [0x98, 0x3, 0xb8, 0x20, 0x7, 0xa3, 0xc, 0x8d]);
struct CODECAPI_AVEncAudioMapDestChannel12
{
}
enum CLSID_CODECAPI_AVEncAudioMapDestChannel13 = GUID(0xbc5d0b6d, 0xdf6a, 0x4e16, [0x98, 0x3, 0xb8, 0x20, 0x7, 0xa3, 0xc, 0x8d]);
struct CODECAPI_AVEncAudioMapDestChannel13
{
}
enum CLSID_CODECAPI_AVEncAudioMapDestChannel14 = GUID(0xbc5d0b6e, 0xdf6a, 0x4e16, [0x98, 0x3, 0xb8, 0x20, 0x7, 0xa3, 0xc, 0x8d]);
struct CODECAPI_AVEncAudioMapDestChannel14
{
}
enum CLSID_CODECAPI_AVEncAudioMapDestChannel15 = GUID(0xbc5d0b6f, 0xdf6a, 0x4e16, [0x98, 0x3, 0xb8, 0x20, 0x7, 0xa3, 0xc, 0x8d]);
struct CODECAPI_AVEncAudioMapDestChannel15
{
}
enum CLSID_CODECAPI_AVEncAudioInputContent = GUID(0x3e226c2b, 0x60b9, 0x4a39, [0xb0, 0xb, 0xa7, 0xb4, 0xf, 0x70, 0xd5, 0x66]);
struct CODECAPI_AVEncAudioInputContent
{
}
alias eAVEncAudioInputContent = int;
enum : int
{
    AVEncAudioInputContent_Unknown = 0x00000000,
    AVEncAudioInputContent_Voice   = 0x00000001,
    AVEncAudioInputContent_Music   = 0x00000002,
}

enum CLSID_CODECAPI_AVEncStatAudioPeakPCMValue = GUID(0xdce7fd34, 0xdc00, 0x4c16, [0x82, 0x1b, 0x35, 0xd9, 0xeb, 0x0, 0xfb, 0x1a]);
struct CODECAPI_AVEncStatAudioPeakPCMValue
{
}
enum CLSID_CODECAPI_AVEncStatAudioAveragePCMValue = GUID(0x979272f8, 0xd17f, 0x4e32, [0xbb, 0x73, 0x4e, 0x73, 0x1c, 0x68, 0xba, 0x2d]);
struct CODECAPI_AVEncStatAudioAveragePCMValue
{
}
enum CLSID_CODECAPI_AVEncStatAudioAverageBPS = GUID(0xca6724db, 0x7059, 0x4351, [0x8b, 0x43, 0xf8, 0x21, 0x98, 0x82, 0x6a, 0x14]);
struct CODECAPI_AVEncStatAudioAverageBPS
{
}
enum CLSID_CODECAPI_AVEncStatAverageBPS = GUID(0xca6724db, 0x7059, 0x4351, [0x8b, 0x43, 0xf8, 0x21, 0x98, 0x82, 0x6a, 0x14]);
struct CODECAPI_AVEncStatAverageBPS
{
}
enum CLSID_CODECAPI_AVEncStatHardwareProcessorUtilitization = GUID(0x995dc027, 0xcb95, 0x49e6, [0xb9, 0x1b, 0x59, 0x67, 0x75, 0x3c, 0xdc, 0xb8]);
struct CODECAPI_AVEncStatHardwareProcessorUtilitization
{
}
enum CLSID_CODECAPI_AVEncStatHardwareBandwidthUtilitization = GUID(0x124ba9b, 0xdc41, 0x4826, [0xb4, 0x5f, 0x18, 0xac, 0x1, 0xb3, 0xd5, 0xa8]);
struct CODECAPI_AVEncStatHardwareBandwidthUtilitization
{
}
enum CLSID_CODECAPI_AVEncMPVGOPSize = GUID(0x95f31b26, 0x95a4, 0x41aa, [0x93, 0x3, 0x24, 0x6a, 0x7f, 0xc6, 0xee, 0xf1]);
struct CODECAPI_AVEncMPVGOPSize
{
}
enum CLSID_CODECAPI_AVEncMPVGOPOpen = GUID(0xb1d5d4a6, 0x3300, 0x49b1, [0xae, 0x61, 0xa0, 0x99, 0x37, 0xab, 0xe, 0x49]);
struct CODECAPI_AVEncMPVGOPOpen
{
}
enum CLSID_CODECAPI_AVEncMPVDefaultBPictureCount = GUID(0x8d390aac, 0xdc5c, 0x4200, [0xb5, 0x7f, 0x81, 0x4d, 0x4, 0xba, 0xba, 0xb2]);
struct CODECAPI_AVEncMPVDefaultBPictureCount
{
}
enum CLSID_CODECAPI_AVEncMPVProfile = GUID(0xdabb534a, 0x1d99, 0x4284, [0x97, 0x5a, 0xd9, 0xe, 0x22, 0x39, 0xba, 0xa1]);
struct CODECAPI_AVEncMPVProfile
{
}
alias eAVEncMPVProfile = int;
enum : int
{
    eAVEncMPVProfile_unknown = 0x00000000,
    eAVEncMPVProfile_Simple  = 0x00000001,
    eAVEncMPVProfile_Main    = 0x00000002,
    eAVEncMPVProfile_High    = 0x00000003,
    eAVEncMPVProfile_422     = 0x00000004,
}

enum CLSID_CODECAPI_AVEncMPVLevel = GUID(0x6ee40c40, 0xa60c, 0x41ef, [0x8f, 0x50, 0x37, 0xc2, 0x24, 0x9e, 0x2c, 0xb3]);
struct CODECAPI_AVEncMPVLevel
{
}
alias eAVEncMPVLevel = int;
enum : int
{
    eAVEncMPVLevel_Low      = 0x00000001,
    eAVEncMPVLevel_Main     = 0x00000002,
    eAVEncMPVLevel_High1440 = 0x00000003,
    eAVEncMPVLevel_High     = 0x00000004,
}

alias eAVEncH263VProfile = int;
enum : int
{
    eAVEncH263VProfile_Base            = 0x00000000,
    eAVEncH263VProfile_CompatibilityV2 = 0x00000001,
    eAVEncH263VProfile_CompatibilityV1 = 0x00000002,
    eAVEncH263VProfile_WirelessV2      = 0x00000003,
    eAVEncH263VProfile_WirelessV3      = 0x00000004,
    eAVEncH263VProfile_HighCompression = 0x00000005,
    eAVEncH263VProfile_Internet        = 0x00000006,
    eAVEncH263VProfile_Interlace       = 0x00000007,
    eAVEncH263VProfile_HighLatency     = 0x00000008,
}

alias eAVEncH264VProfile = int;
enum : int
{
    eAVEncH264VProfile_unknown                   = 0x00000000,
    eAVEncH264VProfile_Simple                    = 0x00000042,
    eAVEncH264VProfile_Base                      = 0x00000042,
    eAVEncH264VProfile_Main                      = 0x0000004d,
    eAVEncH264VProfile_High                      = 0x00000064,
    eAVEncH264VProfile_422                       = 0x0000007a,
    eAVEncH264VProfile_High10                    = 0x0000006e,
    eAVEncH264VProfile_444                       = 0x000000f4,
    eAVEncH264VProfile_Extended                  = 0x00000058,
    eAVEncH264VProfile_ScalableBase              = 0x00000053,
    eAVEncH264VProfile_ScalableHigh              = 0x00000056,
    eAVEncH264VProfile_MultiviewHigh             = 0x00000076,
    eAVEncH264VProfile_StereoHigh                = 0x00000080,
    eAVEncH264VProfile_ConstrainedBase           = 0x00000100,
    eAVEncH264VProfile_UCConstrainedHigh         = 0x00000101,
    eAVEncH264VProfile_UCScalableConstrainedBase = 0x00000102,
    eAVEncH264VProfile_UCScalableConstrainedHigh = 0x00000103,
}

alias eAVEncH265VProfile = int;
enum : int
{
    eAVEncH265VProfile_unknown          = 0x00000000,
    eAVEncH265VProfile_Main_420_8       = 0x00000001,
    eAVEncH265VProfile_Main_420_10      = 0x00000002,
    eAVEncH265VProfile_Main_420_12      = 0x00000003,
    eAVEncH265VProfile_Main_422_10      = 0x00000004,
    eAVEncH265VProfile_Main_422_12      = 0x00000005,
    eAVEncH265VProfile_Main_444_8       = 0x00000006,
    eAVEncH265VProfile_Main_444_10      = 0x00000007,
    eAVEncH265VProfile_Main_444_12      = 0x00000008,
    eAVEncH265VProfile_Monochrome_12    = 0x00000009,
    eAVEncH265VProfile_Monochrome_16    = 0x0000000a,
    eAVEncH265VProfile_MainIntra_420_8  = 0x0000000b,
    eAVEncH265VProfile_MainIntra_420_10 = 0x0000000c,
    eAVEncH265VProfile_MainIntra_420_12 = 0x0000000d,
    eAVEncH265VProfile_MainIntra_422_10 = 0x0000000e,
    eAVEncH265VProfile_MainIntra_422_12 = 0x0000000f,
    eAVEncH265VProfile_MainIntra_444_8  = 0x00000010,
    eAVEncH265VProfile_MainIntra_444_10 = 0x00000011,
    eAVEncH265VProfile_MainIntra_444_12 = 0x00000012,
    eAVEncH265VProfile_MainIntra_444_16 = 0x00000013,
    eAVEncH265VProfile_MainStill_420_8  = 0x00000014,
    eAVEncH265VProfile_MainStill_444_8  = 0x00000015,
    eAVEncH265VProfile_MainStill_444_16 = 0x00000016,
}

alias eAVEncVP9VProfile = int;
enum : int
{
    eAVEncVP9VProfile_unknown = 0x00000000,
    eAVEncVP9VProfile_420_8   = 0x00000001,
    eAVEncVP9VProfile_420_10  = 0x00000002,
    eAVEncVP9VProfile_420_12  = 0x00000003,
}

alias eAVEncH263PictureType = int;
enum : int
{
    eAVEncH263PictureType_I = 0x00000000,
    eAVEncH263PictureType_P = 0x00000001,
    eAVEncH263PictureType_B = 0x00000002,
}

alias eAVEncH264PictureType = int;
enum : int
{
    eAVEncH264PictureType_IDR = 0x00000000,
    eAVEncH264PictureType_P   = 0x00000001,
    eAVEncH264PictureType_B   = 0x00000002,
}

alias eAVEncH263VLevel = int;
enum : int
{
    eAVEncH263VLevel1   = 0x0000000a,
    eAVEncH263VLevel2   = 0x00000014,
    eAVEncH263VLevel3   = 0x0000001e,
    eAVEncH263VLevel4   = 0x00000028,
    eAVEncH263VLevel4_5 = 0x0000002d,
    eAVEncH263VLevel5   = 0x00000032,
    eAVEncH263VLevel6   = 0x0000003c,
    eAVEncH263VLevel7   = 0x00000046,
}

alias eAVEncH264VLevel = int;
enum : int
{
    eAVEncH264VLevel1   = 0x0000000a,
    eAVEncH264VLevel1_b = 0x0000000b,
    eAVEncH264VLevel1_1 = 0x0000000b,
    eAVEncH264VLevel1_2 = 0x0000000c,
    eAVEncH264VLevel1_3 = 0x0000000d,
    eAVEncH264VLevel2   = 0x00000014,
    eAVEncH264VLevel2_1 = 0x00000015,
    eAVEncH264VLevel2_2 = 0x00000016,
    eAVEncH264VLevel3   = 0x0000001e,
    eAVEncH264VLevel3_1 = 0x0000001f,
    eAVEncH264VLevel3_2 = 0x00000020,
    eAVEncH264VLevel4   = 0x00000028,
    eAVEncH264VLevel4_1 = 0x00000029,
    eAVEncH264VLevel4_2 = 0x0000002a,
    eAVEncH264VLevel5   = 0x00000032,
    eAVEncH264VLevel5_1 = 0x00000033,
    eAVEncH264VLevel5_2 = 0x00000034,
}

alias eAVEncH265VLevel = int;
enum : int
{
    eAVEncH265VLevel1   = 0x0000001e,
    eAVEncH265VLevel2   = 0x0000003c,
    eAVEncH265VLevel2_1 = 0x0000003f,
    eAVEncH265VLevel3   = 0x0000005a,
    eAVEncH265VLevel3_1 = 0x0000005d,
    eAVEncH265VLevel4   = 0x00000078,
    eAVEncH265VLevel4_1 = 0x0000007b,
    eAVEncH265VLevel5   = 0x00000096,
    eAVEncH265VLevel5_1 = 0x00000099,
    eAVEncH265VLevel5_2 = 0x0000009c,
    eAVEncH265VLevel6   = 0x000000b4,
    eAVEncH265VLevel6_1 = 0x000000b7,
    eAVEncH265VLevel6_2 = 0x000000ba,
}

enum CLSID_CODECAPI_AVEncMPVFrameFieldMode = GUID(0xacb5de96, 0x7b93, 0x4c2f, [0x88, 0x25, 0xb0, 0x29, 0x5f, 0xa9, 0x3b, 0xf4]);
struct CODECAPI_AVEncMPVFrameFieldMode
{
}
alias eAVEncMPVFrameFieldMode = int;
enum : int
{
    eAVEncMPVFrameFieldMode_FieldMode = 0x00000000,
    eAVEncMPVFrameFieldMode_FrameMode = 0x00000001,
}

enum CLSID_CODECAPI_AVEncMPVAddSeqEndCode = GUID(0xa823178f, 0x57df, 0x4c7a, [0xb8, 0xfd, 0xe5, 0xec, 0x88, 0x87, 0x70, 0x8d]);
struct CODECAPI_AVEncMPVAddSeqEndCode
{
}
enum CLSID_CODECAPI_AVEncMPVGOPSInSeq = GUID(0x993410d4, 0x2691, 0x4192, [0x99, 0x78, 0x98, 0xdc, 0x26, 0x3, 0x66, 0x9f]);
struct CODECAPI_AVEncMPVGOPSInSeq
{
}
enum CLSID_CODECAPI_AVEncMPVUseConcealmentMotionVectors = GUID(0xec770cf3, 0x6908, 0x4b4b, [0xaa, 0x30, 0x7f, 0xb9, 0x86, 0x21, 0x4f, 0xea]);
struct CODECAPI_AVEncMPVUseConcealmentMotionVectors
{
}
enum CLSID_CODECAPI_AVEncMPVSceneDetection = GUID(0x552799f1, 0xdb4c, 0x405b, [0x8a, 0x3a, 0xc9, 0x3f, 0x2d, 0x6, 0x74, 0xdc]);
struct CODECAPI_AVEncMPVSceneDetection
{
}
alias eAVEncMPVSceneDetection = int;
enum : int
{
    eAVEncMPVSceneDetection_None                 = 0x00000000,
    eAVEncMPVSceneDetection_InsertIPicture       = 0x00000001,
    eAVEncMPVSceneDetection_StartNewGOP          = 0x00000002,
    eAVEncMPVSceneDetection_StartNewLocatableGOP = 0x00000003,
}

enum CLSID_CODECAPI_AVEncMPVGenerateHeaderSeqExt = GUID(0xd5e78611, 0x82d, 0x4e6b, [0x98, 0xaf, 0xf, 0x51, 0xab, 0x13, 0x92, 0x22]);
struct CODECAPI_AVEncMPVGenerateHeaderSeqExt
{
}
enum CLSID_CODECAPI_AVEncMPVGenerateHeaderSeqDispExt = GUID(0x6437aa6f, 0x5a3c, 0x4de9, [0x8a, 0x16, 0x53, 0xd9, 0xc4, 0xad, 0x32, 0x6f]);
struct CODECAPI_AVEncMPVGenerateHeaderSeqDispExt
{
}
enum CLSID_CODECAPI_AVEncMPVGenerateHeaderPicExt = GUID(0x1b8464ab, 0x944f, 0x45f0, [0xb7, 0x4e, 0x3a, 0x58, 0xda, 0xd1, 0x1f, 0x37]);
struct CODECAPI_AVEncMPVGenerateHeaderPicExt
{
}
enum CLSID_CODECAPI_AVEncMPVGenerateHeaderPicDispExt = GUID(0xc6412f84, 0xc03f, 0x4f40, [0xa0, 0xc, 0x42, 0x93, 0xdf, 0x83, 0x95, 0xbb]);
struct CODECAPI_AVEncMPVGenerateHeaderPicDispExt
{
}
enum CLSID_CODECAPI_AVEncMPVGenerateHeaderSeqScaleExt = GUID(0x722d62f, 0xdd59, 0x4a86, [0x9c, 0xd5, 0x64, 0x4f, 0x8e, 0x26, 0x53, 0xd8]);
struct CODECAPI_AVEncMPVGenerateHeaderSeqScaleExt
{
}
enum CLSID_CODECAPI_AVEncMPVScanPattern = GUID(0x7f8a478e, 0x7bbb, 0x4ae2, [0xb2, 0xfc, 0x96, 0xd1, 0x7f, 0xc4, 0xa2, 0xd6]);
struct CODECAPI_AVEncMPVScanPattern
{
}
alias eAVEncMPVScanPattern = int;
enum : int
{
    eAVEncMPVScanPattern_Auto          = 0x00000000,
    eAVEncMPVScanPattern_ZigZagScan    = 0x00000001,
    eAVEncMPVScanPattern_AlternateScan = 0x00000002,
}

enum CLSID_CODECAPI_AVEncMPVIntraDCPrecision = GUID(0xa0116151, 0xcbc8, 0x4af3, [0x97, 0xdc, 0xd0, 0xc, 0xce, 0xb8, 0x2d, 0x79]);
struct CODECAPI_AVEncMPVIntraDCPrecision
{
}
enum CLSID_CODECAPI_AVEncMPVQScaleType = GUID(0x2b79ebb7, 0xf484, 0x4af7, [0xbb, 0x58, 0xa2, 0xa1, 0x88, 0xc5, 0xcb, 0xbe]);
struct CODECAPI_AVEncMPVQScaleType
{
}
alias eAVEncMPVQScaleType = int;
enum : int
{
    eAVEncMPVQScaleType_Auto      = 0x00000000,
    eAVEncMPVQScaleType_Linear    = 0x00000001,
    eAVEncMPVQScaleType_NonLinear = 0x00000002,
}

enum CLSID_CODECAPI_AVEncMPVIntraVLCTable = GUID(0xa2b83ff5, 0x1a99, 0x405a, [0xaf, 0x95, 0xc5, 0x99, 0x7d, 0x55, 0x8d, 0x3a]);
struct CODECAPI_AVEncMPVIntraVLCTable
{
}
alias eAVEncMPVIntraVLCTable = int;
enum : int
{
    eAVEncMPVIntraVLCTable_Auto      = 0x00000000,
    eAVEncMPVIntraVLCTable_MPEG1     = 0x00000001,
    eAVEncMPVIntraVLCTable_Alternate = 0x00000002,
}

enum CLSID_CODECAPI_AVEncMPVQuantMatrixIntra = GUID(0x9bea04f3, 0x6621, 0x442c, [0x8b, 0xa1, 0x3a, 0xc3, 0x78, 0x97, 0x96, 0x98]);
struct CODECAPI_AVEncMPVQuantMatrixIntra
{
}
enum CLSID_CODECAPI_AVEncMPVQuantMatrixNonIntra = GUID(0x87f441d8, 0x997, 0x4beb, [0xa0, 0x8e, 0x85, 0x73, 0xd4, 0x9, 0xcf, 0x75]);
struct CODECAPI_AVEncMPVQuantMatrixNonIntra
{
}
enum CLSID_CODECAPI_AVEncMPVQuantMatrixChromaIntra = GUID(0x9eb9ecd4, 0x18d, 0x4ffd, [0x8f, 0x2d, 0x39, 0xe4, 0x9f, 0x7, 0xb1, 0x7a]);
struct CODECAPI_AVEncMPVQuantMatrixChromaIntra
{
}
enum CLSID_CODECAPI_AVEncMPVQuantMatrixChromaNonIntra = GUID(0x1415b6b1, 0x362a, 0x4338, [0xba, 0x9a, 0x1e, 0xf5, 0x87, 0x3, 0xc0, 0x5b]);
struct CODECAPI_AVEncMPVQuantMatrixChromaNonIntra
{
}
enum CLSID_CODECAPI_AVEncMPALayer = GUID(0x9d377230, 0xf91b, 0x453d, [0x9c, 0xe0, 0x78, 0x44, 0x54, 0x14, 0xc2, 0x2d]);
struct CODECAPI_AVEncMPALayer
{
}
alias eAVEncMPALayer = int;
enum : int
{
    eAVEncMPALayer_1 = 0x00000001,
    eAVEncMPALayer_2 = 0x00000002,
    eAVEncMPALayer_3 = 0x00000003,
}

enum CLSID_CODECAPI_AVEncMPACodingMode = GUID(0xb16ade03, 0x4b93, 0x43d7, [0xa5, 0x50, 0x90, 0xb4, 0xfe, 0x22, 0x45, 0x37]);
struct CODECAPI_AVEncMPACodingMode
{
}
alias eAVEncMPACodingMode = int;
enum : int
{
    eAVEncMPACodingMode_Mono        = 0x00000000,
    eAVEncMPACodingMode_Stereo      = 0x00000001,
    eAVEncMPACodingMode_DualChannel = 0x00000002,
    eAVEncMPACodingMode_JointStereo = 0x00000003,
    eAVEncMPACodingMode_Surround    = 0x00000004,
}

enum CLSID_CODECAPI_AVEncMPACopyright = GUID(0xa6ae762a, 0xd0a9, 0x4454, [0xb8, 0xef, 0xf2, 0xdb, 0xee, 0xfd, 0xd3, 0xbd]);
struct CODECAPI_AVEncMPACopyright
{
}
enum CLSID_CODECAPI_AVEncMPAOriginalBitstream = GUID(0x3cfb7855, 0x9cc9, 0x47ff, [0xb8, 0x29, 0xb3, 0x67, 0x86, 0xc9, 0x23, 0x46]);
struct CODECAPI_AVEncMPAOriginalBitstream
{
}
enum CLSID_CODECAPI_AVEncMPAEnableRedundancyProtection = GUID(0x5e54b09e, 0xb2e7, 0x4973, [0xa8, 0x9b, 0xb, 0x36, 0x50, 0xa3, 0xbe, 0xda]);
struct CODECAPI_AVEncMPAEnableRedundancyProtection
{
}
enum CLSID_CODECAPI_AVEncMPAPrivateUserBit = GUID(0xafa505ce, 0xc1e3, 0x4e3d, [0x85, 0x1b, 0x61, 0xb7, 0x0, 0xe5, 0xe6, 0xcc]);
struct CODECAPI_AVEncMPAPrivateUserBit
{
}
enum CLSID_CODECAPI_AVEncMPAEmphasisType = GUID(0x2d59fcda, 0xbf4e, 0x4ed6, [0xb5, 0xdf, 0x5b, 0x3, 0xb3, 0x6b, 0xa, 0x1f]);
struct CODECAPI_AVEncMPAEmphasisType
{
}
alias eAVEncMPAEmphasisType = int;
enum : int
{
    eAVEncMPAEmphasisType_None      = 0x00000000,
    eAVEncMPAEmphasisType_50_15     = 0x00000001,
    eAVEncMPAEmphasisType_Reserved  = 0x00000002,
    eAVEncMPAEmphasisType_CCITT_J17 = 0x00000003,
}

enum CLSID_CODECAPI_AVEncDDService = GUID(0xd2e1bec7, 0x5172, 0x4d2a, [0xa5, 0xe, 0x2f, 0x3b, 0x82, 0xb1, 0xdd, 0xf8]);
struct CODECAPI_AVEncDDService
{
}
alias eAVEncDDService = int;
enum : int
{
    eAVEncDDService_CM = 0x00000000,
    eAVEncDDService_ME = 0x00000001,
    eAVEncDDService_VI = 0x00000002,
    eAVEncDDService_HI = 0x00000003,
    eAVEncDDService_D  = 0x00000004,
    eAVEncDDService_C  = 0x00000005,
    eAVEncDDService_E  = 0x00000006,
    eAVEncDDService_VO = 0x00000007,
}

enum CLSID_CODECAPI_AVEncDDDialogNormalization = GUID(0xd7055acf, 0xf125, 0x437d, [0xa7, 0x4, 0x79, 0xc7, 0x9f, 0x4, 0x4, 0xa8]);
struct CODECAPI_AVEncDDDialogNormalization
{
}
enum CLSID_CODECAPI_AVEncDDCentreDownMixLevel = GUID(0xe285072c, 0xc958, 0x4a81, [0xaf, 0xd2, 0xe5, 0xe0, 0xda, 0xf1, 0xb1, 0x48]);
struct CODECAPI_AVEncDDCentreDownMixLevel
{
}
enum CLSID_CODECAPI_AVEncDDSurroundDownMixLevel = GUID(0x7b20d6e5, 0xbcf, 0x4273, [0xa4, 0x87, 0x50, 0x6b, 0x4, 0x79, 0x97, 0xe9]);
struct CODECAPI_AVEncDDSurroundDownMixLevel
{
}
enum CLSID_CODECAPI_AVEncDDProductionInfoExists = GUID(0xb0b7fe5f, 0xb6ab, 0x4f40, [0x96, 0x4d, 0x8d, 0x91, 0xf1, 0x7c, 0x19, 0xe8]);
struct CODECAPI_AVEncDDProductionInfoExists
{
}
enum CLSID_CODECAPI_AVEncDDProductionRoomType = GUID(0xdad7ad60, 0x23d8, 0x4ab7, [0xa2, 0x84, 0x55, 0x69, 0x86, 0xd8, 0xa6, 0xfe]);
struct CODECAPI_AVEncDDProductionRoomType
{
}
alias eAVEncDDProductionRoomType = int;
enum : int
{
    eAVEncDDProductionRoomType_NotIndicated = 0x00000000,
    eAVEncDDProductionRoomType_Large        = 0x00000001,
    eAVEncDDProductionRoomType_Small        = 0x00000002,
}

enum CLSID_CODECAPI_AVEncDDProductionMixLevel = GUID(0x301d103a, 0xcbf9, 0x4776, [0x88, 0x99, 0x7c, 0x15, 0xb4, 0x61, 0xab, 0x26]);
struct CODECAPI_AVEncDDProductionMixLevel
{
}
enum CLSID_CODECAPI_AVEncDDCopyright = GUID(0x8694f076, 0xcd75, 0x481d, [0xa5, 0xc6, 0xa9, 0x4, 0xdc, 0xc8, 0x28, 0xf0]);
struct CODECAPI_AVEncDDCopyright
{
}
enum CLSID_CODECAPI_AVEncDDOriginalBitstream = GUID(0x966ae800, 0x5bd3, 0x4ff9, [0x95, 0xb9, 0xd3, 0x5, 0x66, 0x27, 0x38, 0x56]);
struct CODECAPI_AVEncDDOriginalBitstream
{
}
enum CLSID_CODECAPI_AVEncDDDigitalDeemphasis = GUID(0xe024a2c2, 0x947c, 0x45ac, [0x87, 0xd8, 0xf1, 0x3, 0xc, 0x5c, 0x0, 0x82]);
struct CODECAPI_AVEncDDDigitalDeemphasis
{
}
enum CLSID_CODECAPI_AVEncDDDCHighPassFilter = GUID(0x9565239f, 0x861c, 0x4ac8, [0xbf, 0xda, 0xe0, 0xc, 0xb4, 0xdb, 0x85, 0x48]);
struct CODECAPI_AVEncDDDCHighPassFilter
{
}
enum CLSID_CODECAPI_AVEncDDChannelBWLowPassFilter = GUID(0xe197821d, 0xd2e7, 0x43e2, [0xad, 0x2c, 0x0, 0x58, 0x2f, 0x51, 0x85, 0x45]);
struct CODECAPI_AVEncDDChannelBWLowPassFilter
{
}
enum CLSID_CODECAPI_AVEncDDLFELowPassFilter = GUID(0xd3b80f6f, 0x9d15, 0x45e5, [0x91, 0xbe, 0x1, 0x9c, 0x3f, 0xab, 0x1f, 0x1]);
struct CODECAPI_AVEncDDLFELowPassFilter
{
}
enum CLSID_CODECAPI_AVEncDDSurround90DegreeePhaseShift = GUID(0x25ecec9d, 0x3553, 0x42c0, [0xbb, 0x56, 0xd2, 0x57, 0x92, 0x10, 0x4f, 0x80]);
struct CODECAPI_AVEncDDSurround90DegreeePhaseShift
{
}
enum CLSID_CODECAPI_AVEncDDSurround3dBAttenuation = GUID(0x4d43b99d, 0x31e2, 0x48b9, [0xbf, 0x2e, 0x5c, 0xbf, 0x1a, 0x57, 0x27, 0x84]);
struct CODECAPI_AVEncDDSurround3dBAttenuation
{
}
enum CLSID_CODECAPI_AVEncDDDynamicRangeCompressionControl = GUID(0xcfc2ff6d, 0x79b8, 0x4b8d, [0xa8, 0xaa, 0xa0, 0xc9, 0xbd, 0x1c, 0x29, 0x40]);
struct CODECAPI_AVEncDDDynamicRangeCompressionControl
{
}
alias eAVEncDDDynamicRangeCompressionControl = int;
enum : int
{
    eAVEncDDDynamicRangeCompressionControl_None          = 0x00000000,
    eAVEncDDDynamicRangeCompressionControl_FilmStandard  = 0x00000001,
    eAVEncDDDynamicRangeCompressionControl_FilmLight     = 0x00000002,
    eAVEncDDDynamicRangeCompressionControl_MusicStandard = 0x00000003,
    eAVEncDDDynamicRangeCompressionControl_MusicLight    = 0x00000004,
    eAVEncDDDynamicRangeCompressionControl_Speech        = 0x00000005,
}

enum CLSID_CODECAPI_AVEncDDRFPreEmphasisFilter = GUID(0x21af44c0, 0x244e, 0x4f3d, [0xa2, 0xcc, 0x3d, 0x30, 0x68, 0xb2, 0xe7, 0x3f]);
struct CODECAPI_AVEncDDRFPreEmphasisFilter
{
}
enum CLSID_CODECAPI_AVEncDDSurroundExMode = GUID(0x91607cee, 0xdbdd, 0x4eb6, [0xbc, 0xa2, 0xaa, 0xdf, 0xaf, 0xa3, 0xdd, 0x68]);
struct CODECAPI_AVEncDDSurroundExMode
{
}
alias eAVEncDDSurroundExMode = int;
enum : int
{
    eAVEncDDSurroundExMode_NotIndicated = 0x00000000,
    eAVEncDDSurroundExMode_No           = 0x00000001,
    eAVEncDDSurroundExMode_Yes          = 0x00000002,
}

enum CLSID_CODECAPI_AVEncDDPreferredStereoDownMixMode = GUID(0x7f4e6b31, 0x9185, 0x403d, [0xb0, 0xa2, 0x76, 0x37, 0x43, 0xe6, 0xf0, 0x63]);
struct CODECAPI_AVEncDDPreferredStereoDownMixMode
{
}
alias eAVEncDDPreferredStereoDownMixMode = int;
enum : int
{
    eAVEncDDPreferredStereoDownMixMode_LtRt = 0x00000000,
    eAVEncDDPreferredStereoDownMixMode_LoRo = 0x00000001,
}

enum CLSID_CODECAPI_AVEncDDLtRtCenterMixLvl_x10 = GUID(0xdca128a2, 0x491f, 0x4600, [0xb2, 0xda, 0x76, 0xe3, 0x34, 0x4b, 0x41, 0x97]);
struct CODECAPI_AVEncDDLtRtCenterMixLvl_x10
{
}
enum CLSID_CODECAPI_AVEncDDLtRtSurroundMixLvl_x10 = GUID(0x212246c7, 0x3d2c, 0x4dfa, [0xbc, 0x21, 0x65, 0x2a, 0x90, 0x98, 0x69, 0xd]);
struct CODECAPI_AVEncDDLtRtSurroundMixLvl_x10
{
}
enum CLSID_CODECAPI_AVEncDDLoRoCenterMixLvl_x10 = GUID(0x1cfba222, 0x25b3, 0x4bf4, [0x9b, 0xfd, 0xe7, 0x11, 0x12, 0x67, 0x85, 0x8c]);
struct CODECAPI_AVEncDDLoRoCenterMixLvl_x10
{
}
enum CLSID_CODECAPI_AVEncDDLoRoSurroundMixLvl_x10 = GUID(0xe725cff6, 0xeb56, 0x40c7, [0x84, 0x50, 0x2b, 0x93, 0x67, 0xe9, 0x15, 0x55]);
struct CODECAPI_AVEncDDLoRoSurroundMixLvl_x10
{
}
enum CLSID_CODECAPI_AVEncDDAtoDConverterType = GUID(0x719f9612, 0x81a1, 0x47e0, [0x9a, 0x5, 0xd9, 0x4a, 0xd5, 0xfc, 0xa9, 0x48]);
struct CODECAPI_AVEncDDAtoDConverterType
{
}
alias eAVEncDDAtoDConverterType = int;
enum : int
{
    eAVEncDDAtoDConverterType_Standard = 0x00000000,
    eAVEncDDAtoDConverterType_HDCD     = 0x00000001,
}

enum CLSID_CODECAPI_AVEncDDHeadphoneMode = GUID(0x4052dbec, 0x52f5, 0x42f5, [0x9b, 0x0, 0xd1, 0x34, 0xb1, 0x34, 0x1b, 0x9d]);
struct CODECAPI_AVEncDDHeadphoneMode
{
}
alias eAVEncDDHeadphoneMode = int;
enum : int
{
    eAVEncDDHeadphoneMode_NotIndicated = 0x00000000,
    eAVEncDDHeadphoneMode_NotEncoded   = 0x00000001,
    eAVEncDDHeadphoneMode_Encoded      = 0x00000002,
}

enum CLSID_CODECAPI_AVEncWMVKeyFrameDistance = GUID(0x5569055e, 0xe268, 0x4771, [0xb8, 0x3e, 0x95, 0x55, 0xea, 0x28, 0xae, 0xd3]);
struct CODECAPI_AVEncWMVKeyFrameDistance
{
}
enum CLSID_CODECAPI_AVEncWMVInterlacedEncoding = GUID(0xe3d00f8a, 0xc6f5, 0x4e14, [0xa5, 0x88, 0xe, 0xc8, 0x7a, 0x72, 0x6f, 0x9b]);
struct CODECAPI_AVEncWMVInterlacedEncoding
{
}
enum CLSID_CODECAPI_AVEncWMVDecoderComplexity = GUID(0xf32c0dab, 0xf3cb, 0x4217, [0xb7, 0x9f, 0x87, 0x62, 0x76, 0x8b, 0x5f, 0x67]);
struct CODECAPI_AVEncWMVDecoderComplexity
{
}
enum CLSID_CODECAPI_AVEncWMVKeyFrameBufferLevelMarker = GUID(0x51ff1115, 0x33ac, 0x426c, [0xa1, 0xb1, 0x9, 0x32, 0x1b, 0xdf, 0x96, 0xb4]);
struct CODECAPI_AVEncWMVKeyFrameBufferLevelMarker
{
}
enum CLSID_CODECAPI_AVEncWMVProduceDummyFrames = GUID(0xd669d001, 0x183c, 0x42e3, [0xa3, 0xca, 0x2f, 0x45, 0x86, 0xd2, 0x39, 0x6c]);
struct CODECAPI_AVEncWMVProduceDummyFrames
{
}
enum CLSID_CODECAPI_AVEncStatWMVCBAvg = GUID(0x6aa6229f, 0xd602, 0x4b9d, [0xb6, 0x8c, 0xc1, 0xad, 0x78, 0x88, 0x4b, 0xef]);
struct CODECAPI_AVEncStatWMVCBAvg
{
}
enum CLSID_CODECAPI_AVEncStatWMVCBMax = GUID(0xe976bef8, 0xfe, 0x44b4, [0xb6, 0x25, 0x8f, 0x23, 0x8b, 0xc0, 0x34, 0x99]);
struct CODECAPI_AVEncStatWMVCBMax
{
}
enum CLSID_CODECAPI_AVEncStatWMVDecoderComplexityProfile = GUID(0x89e69fc3, 0xf9b, 0x436c, [0x97, 0x4a, 0xdf, 0x82, 0x12, 0x27, 0xc9, 0xd]);
struct CODECAPI_AVEncStatWMVDecoderComplexityProfile
{
}
enum CLSID_CODECAPI_AVEncStatMPVSkippedEmptyFrames = GUID(0x32195fd3, 0x590d, 0x4812, [0xa7, 0xed, 0x6d, 0x63, 0x9a, 0x1f, 0x97, 0x11]);
struct CODECAPI_AVEncStatMPVSkippedEmptyFrames
{
}
enum CLSID_CODECAPI_AVEncMP12PktzSTDBuffer = GUID(0xb751bd0, 0x819e, 0x478c, [0x94, 0x35, 0x75, 0x20, 0x89, 0x26, 0xb3, 0x77]);
struct CODECAPI_AVEncMP12PktzSTDBuffer
{
}
enum CLSID_CODECAPI_AVEncMP12PktzStreamID = GUID(0xc834d038, 0xf5e8, 0x4408, [0x9b, 0x60, 0x88, 0xf3, 0x64, 0x93, 0xfe, 0xdf]);
struct CODECAPI_AVEncMP12PktzStreamID
{
}
enum CLSID_CODECAPI_AVEncMP12PktzInitialPTS = GUID(0x2a4f2065, 0x9a63, 0x4d20, [0xae, 0x22, 0xa, 0x1b, 0xc8, 0x96, 0xa3, 0x15]);
struct CODECAPI_AVEncMP12PktzInitialPTS
{
}
enum CLSID_CODECAPI_AVEncMP12PktzPacketSize = GUID(0xab71347a, 0x1332, 0x4dde, [0xa0, 0xe5, 0xcc, 0xf7, 0xda, 0x8a, 0xf, 0x22]);
struct CODECAPI_AVEncMP12PktzPacketSize
{
}
enum CLSID_CODECAPI_AVEncMP12PktzCopyright = GUID(0xc8f4b0c1, 0x94c, 0x43c7, [0x8e, 0x68, 0xa5, 0x95, 0x40, 0x5a, 0x6e, 0xf8]);
struct CODECAPI_AVEncMP12PktzCopyright
{
}
enum CLSID_CODECAPI_AVEncMP12PktzOriginal = GUID(0x6b178416, 0x31b9, 0x4964, [0x94, 0xcb, 0x6b, 0xff, 0x86, 0x6c, 0xdf, 0x83]);
struct CODECAPI_AVEncMP12PktzOriginal
{
}
enum CLSID_CODECAPI_AVEncMP12MuxPacketOverhead = GUID(0xe40bd720, 0x3955, 0x4453, [0xac, 0xf9, 0xb7, 0x91, 0x32, 0xa3, 0x8f, 0xa0]);
struct CODECAPI_AVEncMP12MuxPacketOverhead
{
}
enum CLSID_CODECAPI_AVEncMP12MuxNumStreams = GUID(0xf7164a41, 0xdced, 0x4659, [0xa8, 0xf2, 0xfb, 0x69, 0x3f, 0x2a, 0x4c, 0xd0]);
struct CODECAPI_AVEncMP12MuxNumStreams
{
}
enum CLSID_CODECAPI_AVEncMP12MuxEarliestPTS = GUID(0x157232b6, 0xf809, 0x474e, [0x94, 0x64, 0xa7, 0xf9, 0x30, 0x14, 0xa8, 0x17]);
struct CODECAPI_AVEncMP12MuxEarliestPTS
{
}
enum CLSID_CODECAPI_AVEncMP12MuxLargestPacketSize = GUID(0x35ceb711, 0xf461, 0x4b92, [0xa4, 0xef, 0x17, 0xb6, 0x84, 0x1e, 0xd2, 0x54]);
struct CODECAPI_AVEncMP12MuxLargestPacketSize
{
}
enum CLSID_CODECAPI_AVEncMP12MuxInitialSCR = GUID(0x3433ad21, 0x1b91, 0x4a0b, [0xb1, 0x90, 0x2b, 0x77, 0x6, 0x3b, 0x63, 0xa4]);
struct CODECAPI_AVEncMP12MuxInitialSCR
{
}
enum CLSID_CODECAPI_AVEncMP12MuxMuxRate = GUID(0xee047c72, 0x4bdb, 0x4a9d, [0x8e, 0x21, 0x41, 0x92, 0x6c, 0x82, 0x3d, 0xa7]);
struct CODECAPI_AVEncMP12MuxMuxRate
{
}
enum CLSID_CODECAPI_AVEncMP12MuxPackSize = GUID(0xf916053a, 0x1ce8, 0x4faf, [0xaa, 0xb, 0xba, 0x31, 0xc8, 0x0, 0x34, 0xb8]);
struct CODECAPI_AVEncMP12MuxPackSize
{
}
enum CLSID_CODECAPI_AVEncMP12MuxSysSTDBufferBound = GUID(0x35746903, 0xb545, 0x43e7, [0xbb, 0x35, 0xc5, 0xe0, 0xa7, 0xd5, 0x9, 0x3c]);
struct CODECAPI_AVEncMP12MuxSysSTDBufferBound
{
}
enum CLSID_CODECAPI_AVEncMP12MuxSysRateBound = GUID(0x5f0428a, 0xee30, 0x489d, [0xae, 0x28, 0x20, 0x5c, 0x72, 0x44, 0x67, 0x10]);
struct CODECAPI_AVEncMP12MuxSysRateBound
{
}
enum CLSID_CODECAPI_AVEncMP12MuxTargetPacketizer = GUID(0xd862212a, 0x2015, 0x45dd, [0x9a, 0x32, 0x1b, 0x3a, 0xa8, 0x82, 0x5, 0xa0]);
struct CODECAPI_AVEncMP12MuxTargetPacketizer
{
}
enum CLSID_CODECAPI_AVEncMP12MuxSysFixed = GUID(0xcefb987e, 0x894f, 0x452e, [0x8f, 0x89, 0xa4, 0xef, 0x8c, 0xec, 0x6, 0x3a]);
struct CODECAPI_AVEncMP12MuxSysFixed
{
}
enum CLSID_CODECAPI_AVEncMP12MuxSysCSPS = GUID(0x7952ff45, 0x9c0d, 0x4822, [0xbc, 0x82, 0x8a, 0xd7, 0x72, 0xe0, 0x29, 0x93]);
struct CODECAPI_AVEncMP12MuxSysCSPS
{
}
enum CLSID_CODECAPI_AVEncMP12MuxSysVideoLock = GUID(0xb8296408, 0x2430, 0x4d37, [0xa2, 0xa1, 0x95, 0xb3, 0xe4, 0x35, 0xa9, 0x1d]);
struct CODECAPI_AVEncMP12MuxSysVideoLock
{
}
enum CLSID_CODECAPI_AVEncMP12MuxSysAudioLock = GUID(0xfbb5752, 0x1d43, 0x47bf, [0xbd, 0x79, 0xf2, 0x29, 0x3d, 0x8c, 0xe3, 0x37]);
struct CODECAPI_AVEncMP12MuxSysAudioLock
{
}
enum CLSID_CODECAPI_AVEncMP12MuxDVDNavPacks = GUID(0xc7607ced, 0x8cf1, 0x4a99, [0x83, 0xa1, 0xee, 0x54, 0x61, 0xbe, 0x35, 0x74]);
struct CODECAPI_AVEncMP12MuxDVDNavPacks
{
}
enum CLSID_CODECAPI_AVDecCommonInputFormat = GUID(0xe5005239, 0xbd89, 0x4be3, [0x9c, 0xf, 0x5d, 0xde, 0x31, 0x79, 0x88, 0xcc]);
struct CODECAPI_AVDecCommonInputFormat
{
}
enum CLSID_CODECAPI_AVDecCommonOutputFormat = GUID(0x3c790028, 0xc0ce, 0x4256, [0xb1, 0xa2, 0x1b, 0xf, 0xc8, 0xb1, 0xdc, 0xdc]);
struct CODECAPI_AVDecCommonOutputFormat
{
}
enum CLSID_CODECAPI_AVDecCommonMeanBitRate = GUID(0x59488217, 0x7a, 0x4f7a, [0x8e, 0x41, 0x5c, 0x48, 0xb1, 0xea, 0xc5, 0xc6]);
struct CODECAPI_AVDecCommonMeanBitRate
{
}
enum CLSID_CODECAPI_AVDecCommonMeanBitRateInterval = GUID(0xee437c6, 0x38a7, 0x4c5c, [0x94, 0x4c, 0x68, 0xab, 0x42, 0x11, 0x6b, 0x85]);
struct CODECAPI_AVDecCommonMeanBitRateInterval
{
}
enum CLSID_CODECAPI_GUID_AVDecAudioOutputFormat_PCM_Stereo_MatrixEncoded = GUID(0x696e1d30, 0x548f, 0x4036, [0x82, 0x5f, 0x70, 0x26, 0xc6, 0x0, 0x11, 0xbd]);
struct CODECAPI_GUID_AVDecAudioOutputFormat_PCM_Stereo_MatrixEncoded
{
}
enum CLSID_CODECAPI_GUID_AVDecAudioOutputFormat_PCM = GUID(0x696e1d31, 0x548f, 0x4036, [0x82, 0x5f, 0x70, 0x26, 0xc6, 0x0, 0x11, 0xbd]);
struct CODECAPI_GUID_AVDecAudioOutputFormat_PCM
{
}
enum CLSID_CODECAPI_GUID_AVDecAudioOutputFormat_SPDIF_PCM = GUID(0x696e1d32, 0x548f, 0x4036, [0x82, 0x5f, 0x70, 0x26, 0xc6, 0x0, 0x11, 0xbd]);
struct CODECAPI_GUID_AVDecAudioOutputFormat_SPDIF_PCM
{
}
enum CLSID_CODECAPI_GUID_AVDecAudioOutputFormat_SPDIF_Bitstream = GUID(0x696e1d33, 0x548f, 0x4036, [0x82, 0x5f, 0x70, 0x26, 0xc6, 0x0, 0x11, 0xbd]);
struct CODECAPI_GUID_AVDecAudioOutputFormat_SPDIF_Bitstream
{
}
enum CLSID_CODECAPI_GUID_AVDecAudioOutputFormat_PCM_Headphones = GUID(0x696e1d34, 0x548f, 0x4036, [0x82, 0x5f, 0x70, 0x26, 0xc6, 0x0, 0x11, 0xbd]);
struct CODECAPI_GUID_AVDecAudioOutputFormat_PCM_Headphones
{
}
enum CLSID_CODECAPI_GUID_AVDecAudioOutputFormat_PCM_Stereo_Auto = GUID(0x696e1d35, 0x548f, 0x4036, [0x82, 0x5f, 0x70, 0x26, 0xc6, 0x0, 0x11, 0xbd]);
struct CODECAPI_GUID_AVDecAudioOutputFormat_PCM_Stereo_Auto
{
}
enum CLSID_CODECAPI_AVDecVideoImageSize = GUID(0x5ee5747c, 0x6801, 0x4cab, [0xaa, 0xf1, 0x62, 0x48, 0xfa, 0x84, 0x1b, 0xa4]);
struct CODECAPI_AVDecVideoImageSize
{
}
enum CLSID_CODECAPI_AVDecVideoPixelAspectRatio = GUID(0xb0cf8245, 0xf32d, 0x41df, [0xb0, 0x2c, 0x87, 0xbd, 0x30, 0x4d, 0x12, 0xab]);
struct CODECAPI_AVDecVideoPixelAspectRatio
{
}
enum CLSID_CODECAPI_AVDecVideoInputScanType = GUID(0x38477e1f, 0xea7, 0x42cd, [0x8c, 0xd1, 0x13, 0xc, 0xed, 0x57, 0xc5, 0x80]);
struct CODECAPI_AVDecVideoInputScanType
{
}
alias eAVDecVideoInputScanType = int;
enum : int
{
    eAVDecVideoInputScan_Unknown                    = 0x00000000,
    eAVDecVideoInputScan_Progressive                = 0x00000001,
    eAVDecVideoInputScan_Interlaced_UpperFieldFirst = 0x00000002,
    eAVDecVideoInputScan_Interlaced_LowerFieldFirst = 0x00000003,
}

enum CLSID_CODECAPI_AVDecVideoSWPowerLevel = GUID(0xfb5d2347, 0x4dd8, 0x4509, [0xae, 0xd0, 0xdb, 0x5f, 0xa9, 0xaa, 0x93, 0xf4]);
struct CODECAPI_AVDecVideoSWPowerLevel
{
}
alias eAVDecVideoSWPowerLevel = int;
enum : int
{
    eAVDecVideoSWPowerLevel_BatteryLife  = 0x00000000,
    eAVDecVideoSWPowerLevel_Balanced     = 0x00000032,
    eAVDecVideoSWPowerLevel_VideoQuality = 0x00000064,
}

enum CLSID_CODECAPI_GUID_AVDecAudioInputWMA = GUID(0xc95e8dcf, 0x4058, 0x4204, [0x8c, 0x42, 0xcb, 0x24, 0xd9, 0x1e, 0x4b, 0x9b]);
struct CODECAPI_GUID_AVDecAudioInputWMA
{
}
enum CLSID_CODECAPI_GUID_AVDecAudioInputWMAPro = GUID(0x128b7c7, 0xda72, 0x4fe3, [0xbe, 0xf8, 0x5c, 0x52, 0xe3, 0x55, 0x77, 0x4]);
struct CODECAPI_GUID_AVDecAudioInputWMAPro
{
}
enum CLSID_CODECAPI_GUID_AVDecAudioInputDolby = GUID(0x8e4228a0, 0xf000, 0x4e0b, [0x8f, 0x54, 0xab, 0x8d, 0x24, 0xad, 0x61, 0xa2]);
struct CODECAPI_GUID_AVDecAudioInputDolby
{
}
enum CLSID_CODECAPI_GUID_AVDecAudioInputDTS = GUID(0x600bc0ca, 0x6a1f, 0x4e91, [0xb2, 0x41, 0x1b, 0xbe, 0xb1, 0xcb, 0x19, 0xe0]);
struct CODECAPI_GUID_AVDecAudioInputDTS
{
}
enum CLSID_CODECAPI_GUID_AVDecAudioInputPCM = GUID(0xf2421da5, 0xbbb4, 0x4cd5, [0xa9, 0x96, 0x93, 0x3c, 0x6b, 0x5d, 0x13, 0x47]);
struct CODECAPI_GUID_AVDecAudioInputPCM
{
}
enum CLSID_CODECAPI_GUID_AVDecAudioInputMPEG = GUID(0x91106f36, 0x2c5, 0x4f75, [0x97, 0x19, 0x3b, 0x7a, 0xbf, 0x75, 0xe1, 0xf6]);
struct CODECAPI_GUID_AVDecAudioInputMPEG
{
}
enum CLSID_CODECAPI_GUID_AVDecAudioInputAAC = GUID(0x97df7828, 0xb94a, 0x47e2, [0xa4, 0xbc, 0x51, 0x19, 0x4d, 0xb2, 0x2a, 0x4d]);
struct CODECAPI_GUID_AVDecAudioInputAAC
{
}
enum CLSID_CODECAPI_GUID_AVDecAudioInputHEAAC = GUID(0x16efb4aa, 0x330e, 0x4f5c, [0x98, 0xa8, 0xcf, 0x6a, 0xc5, 0x5c, 0xbe, 0x60]);
struct CODECAPI_GUID_AVDecAudioInputHEAAC
{
}
enum CLSID_CODECAPI_GUID_AVDecAudioInputDolbyDigitalPlus = GUID(0x803e185, 0x8f5d, 0x47f5, [0x99, 0x8, 0x19, 0xa5, 0xbb, 0xc9, 0xfe, 0x34]);
struct CODECAPI_GUID_AVDecAudioInputDolbyDigitalPlus
{
}
enum CLSID_CODECAPI_AVDecAACDownmixMode = GUID(0x1274475, 0xf6bb, 0x4017, [0xb0, 0x84, 0x81, 0xa7, 0x63, 0xc9, 0x42, 0xd4]);
struct CODECAPI_AVDecAACDownmixMode
{
}
alias eAVDecAACDownmixMode = int;
enum : int
{
    eAVDecAACUseISODownmix  = 0x00000000,
    eAVDecAACUseARIBDownmix = 0x00000001,
}

enum CLSID_CODECAPI_AVDecHEAACDynamicRangeControl = GUID(0x287c8abe, 0x69a4, 0x4d39, [0x80, 0x80, 0xd3, 0xd9, 0x71, 0x21, 0x78, 0xa0]);
struct CODECAPI_AVDecHEAACDynamicRangeControl
{
}
alias eAVDecHEAACDynamicRangeControl = int;
enum : int
{
    eAVDecHEAACDynamicRangeControl_OFF = 0x00000000,
    eAVDecHEAACDynamicRangeControl_ON  = 0x00000001,
}

enum CLSID_CODECAPI_AVDecAudioDualMono = GUID(0x4a52cda8, 0x30f8, 0x4216, [0xbe, 0xf, 0xba, 0xb, 0x20, 0x25, 0x92, 0x1d]);
struct CODECAPI_AVDecAudioDualMono
{
}
alias eAVDecAudioDualMono = int;
enum : int
{
    eAVDecAudioDualMono_IsNotDualMono = 0x00000000,
    eAVDecAudioDualMono_IsDualMono    = 0x00000001,
    eAVDecAudioDualMono_UnSpecified   = 0x00000002,
}

enum CLSID_CODECAPI_AVDecAudioDualMonoReproMode = GUID(0xa5106186, 0xcc94, 0x4bc9, [0x8c, 0xd9, 0xaa, 0x2f, 0x61, 0xf6, 0x80, 0x7e]);
struct CODECAPI_AVDecAudioDualMonoReproMode
{
}
alias eAVDecAudioDualMonoReproMode = int;
enum : int
{
    eAVDecAudioDualMonoReproMode_STEREO     = 0x00000000,
    eAVDecAudioDualMonoReproMode_LEFT_MONO  = 0x00000001,
    eAVDecAudioDualMonoReproMode_RIGHT_MONO = 0x00000002,
    eAVDecAudioDualMonoReproMode_MIX_MONO   = 0x00000003,
}

enum CLSID_CODECAPI_AVAudioChannelCount = GUID(0x1d3583c4, 0x1583, 0x474e, [0xb7, 0x1a, 0x5e, 0xe4, 0x63, 0xc1, 0x98, 0xe4]);
struct CODECAPI_AVAudioChannelCount
{
}
enum CLSID_CODECAPI_AVAudioChannelConfig = GUID(0x17f89cb3, 0xc38d, 0x4368, [0x9e, 0xde, 0x63, 0xb9, 0x4d, 0x17, 0x7f, 0x9f]);
struct CODECAPI_AVAudioChannelConfig
{
}
alias eAVAudioChannelConfig = int;
enum : int
{
    eAVAudioChannelConfig_FRONT_LEFT            = 0x00000001,
    eAVAudioChannelConfig_FRONT_RIGHT           = 0x00000002,
    eAVAudioChannelConfig_FRONT_CENTER          = 0x00000004,
    eAVAudioChannelConfig_LOW_FREQUENCY         = 0x00000008,
    eAVAudioChannelConfig_BACK_LEFT             = 0x00000010,
    eAVAudioChannelConfig_BACK_RIGHT            = 0x00000020,
    eAVAudioChannelConfig_FRONT_LEFT_OF_CENTER  = 0x00000040,
    eAVAudioChannelConfig_FRONT_RIGHT_OF_CENTER = 0x00000080,
    eAVAudioChannelConfig_BACK_CENTER           = 0x00000100,
    eAVAudioChannelConfig_SIDE_LEFT             = 0x00000200,
    eAVAudioChannelConfig_SIDE_RIGHT            = 0x00000400,
    eAVAudioChannelConfig_TOP_CENTER            = 0x00000800,
    eAVAudioChannelConfig_TOP_FRONT_LEFT        = 0x00001000,
    eAVAudioChannelConfig_TOP_FRONT_CENTER      = 0x00002000,
    eAVAudioChannelConfig_TOP_FRONT_RIGHT       = 0x00004000,
    eAVAudioChannelConfig_TOP_BACK_LEFT         = 0x00008000,
    eAVAudioChannelConfig_TOP_BACK_CENTER       = 0x00010000,
    eAVAudioChannelConfig_TOP_BACK_RIGHT        = 0x00020000,
}

enum CLSID_CODECAPI_AVAudioSampleRate = GUID(0x971d2723, 0x1acb, 0x42e7, [0x85, 0x5c, 0x52, 0xa, 0x4b, 0x70, 0xa5, 0xf2]);
struct CODECAPI_AVAudioSampleRate
{
}
enum CLSID_CODECAPI_AVDDSurroundMode = GUID(0x99f2f386, 0x98d1, 0x4452, [0xa1, 0x63, 0xab, 0xc7, 0x8a, 0x6e, 0xb7, 0x70]);
struct CODECAPI_AVDDSurroundMode
{
}
alias eAVDDSurroundMode = int;
enum : int
{
    eAVDDSurroundMode_NotIndicated = 0x00000000,
    eAVDDSurroundMode_No           = 0x00000001,
    eAVDDSurroundMode_Yes          = 0x00000002,
}

enum CLSID_CODECAPI_AVDecDDOperationalMode = GUID(0xd6d6c6d1, 0x64e, 0x4fdd, [0xa4, 0xe, 0x3e, 0xcb, 0xfc, 0xb7, 0xeb, 0xd0]);
struct CODECAPI_AVDecDDOperationalMode
{
}
alias eAVDecDDOperationalMode = int;
enum : int
{
    eAVDecDDOperationalMode_NONE       = 0x00000000,
    eAVDecDDOperationalMode_LINE       = 0x00000001,
    eAVDecDDOperationalMode_RF         = 0x00000002,
    eAVDecDDOperationalMode_CUSTOM0    = 0x00000003,
    eAVDecDDOperationalMode_CUSTOM1    = 0x00000004,
    eAVDecDDOperationalMode_PORTABLE8  = 0x00000005,
    eAVDecDDOperationalMode_PORTABLE11 = 0x00000006,
    eAVDecDDOperationalMode_PORTABLE14 = 0x00000007,
}

enum CLSID_CODECAPI_AVDecDDMatrixDecodingMode = GUID(0xddc811a5, 0x4ed, 0x4bf3, [0xa0, 0xca, 0xd0, 0x4, 0x49, 0xf9, 0x35, 0x5f]);
struct CODECAPI_AVDecDDMatrixDecodingMode
{
}
alias eAVDecDDMatrixDecodingMode = int;
enum : int
{
    eAVDecDDMatrixDecodingMode_OFF  = 0x00000000,
    eAVDecDDMatrixDecodingMode_ON   = 0x00000001,
    eAVDecDDMatrixDecodingMode_AUTO = 0x00000002,
}

enum CLSID_CODECAPI_AVDecDDDynamicRangeScaleHigh = GUID(0x50196c21, 0x1f33, 0x4af5, [0xb2, 0x96, 0x11, 0x42, 0x6d, 0x6c, 0x87, 0x89]);
struct CODECAPI_AVDecDDDynamicRangeScaleHigh
{
}
enum CLSID_CODECAPI_AVDecDDDynamicRangeScaleLow = GUID(0x44e62e4, 0x11a5, 0x42d5, [0xa3, 0xb2, 0x3b, 0xb2, 0xc7, 0xc2, 0xd7, 0xcf]);
struct CODECAPI_AVDecDDDynamicRangeScaleLow
{
}
enum CLSID_CODECAPI_AVDecDDStereoDownMixMode = GUID(0x6ce4122c, 0x3ee9, 0x4182, [0xb4, 0xae, 0xc1, 0xf, 0xc0, 0x88, 0x64, 0x9d]);
struct CODECAPI_AVDecDDStereoDownMixMode
{
}
alias eAVDecDDStereoDownMixMode = int;
enum : int
{
    eAVDecDDStereoDownMixMode_Auto = 0x00000000,
    eAVDecDDStereoDownMixMode_LtRt = 0x00000001,
    eAVDecDDStereoDownMixMode_LoRo = 0x00000002,
}

enum CLSID_CODECAPI_AVDSPLoudnessEqualization = GUID(0x8afd1a15, 0x1812, 0x4cbf, [0x93, 0x19, 0x43, 0x3a, 0x5b, 0x2a, 0x3b, 0x27]);
struct CODECAPI_AVDSPLoudnessEqualization
{
}
alias eAVDSPLoudnessEqualization = int;
enum : int
{
    eAVDSPLoudnessEqualization_OFF  = 0x00000000,
    eAVDSPLoudnessEqualization_ON   = 0x00000001,
    eAVDSPLoudnessEqualization_AUTO = 0x00000002,
}

enum CLSID_CODECAPI_AVDSPSpeakerFill = GUID(0x5612bca1, 0x56da, 0x4582, [0x8d, 0xa1, 0xca, 0x80, 0x90, 0xf9, 0x27, 0x68]);
struct CODECAPI_AVDSPSpeakerFill
{
}
alias eAVDSPSpeakerFill = int;
enum : int
{
    eAVDSPSpeakerFill_OFF  = 0x00000000,
    eAVDSPSpeakerFill_ON   = 0x00000001,
    eAVDSPSpeakerFill_AUTO = 0x00000002,
}

enum CLSID_CODECAPI_AVPriorityControl = GUID(0x54ba3dc8, 0xbdde, 0x4329, [0xb1, 0x87, 0x20, 0x18, 0xbc, 0x5c, 0x2b, 0xa1]);
struct CODECAPI_AVPriorityControl
{
}
enum CLSID_CODECAPI_AVRealtimeControl = GUID(0x6f440632, 0xc4ad, 0x4bf7, [0x9e, 0x52, 0x45, 0x69, 0x42, 0xb4, 0x54, 0xb0]);
struct CODECAPI_AVRealtimeControl
{
}
enum CLSID_CODECAPI_AVEncNoInputCopy = GUID(0xd2b46a2a, 0xe8ee, 0x4ec5, [0x86, 0x9e, 0x44, 0x9b, 0x6c, 0x62, 0xc8, 0x1a]);
struct CODECAPI_AVEncNoInputCopy
{
}
alias eAVEncChromaEncodeMode = int;
enum : int
{
    eAVEncChromaEncodeMode_420    = 0x00000000,
    eAVEncChromaEncodeMode_444    = 0x00000001,
    eAVEncChromaEncodeMode_444_v2 = 0x00000002,
}

enum CLSID_CODECAPI_AVEncChromaEncodeMode = GUID(0x8a47ab5a, 0x4798, 0x4c93, [0xb5, 0xa5, 0x55, 0x4f, 0x9a, 0x3b, 0x9f, 0x50]);
struct CODECAPI_AVEncChromaEncodeMode
{
}
enum CLSID_CODECAPI_AVEncProgressiveUpdateTime = GUID(0x649faf66, 0xafc6, 0x4828, [0x8f, 0xdc, 0x7, 0x71, 0xcd, 0x9a, 0xb1, 0x7d]);
struct CODECAPI_AVEncProgressiveUpdateTime
{
}
enum CLSID_CODECAPI_AVEncChromaUpdateTime = GUID(0x4b4fd998, 0x4274, 0x40bb, [0x8e, 0xe4, 0x7, 0x55, 0x3e, 0x7e, 0x2d, 0x3a]);
struct CODECAPI_AVEncChromaUpdateTime
{
}
alias DXVAHD_FRAME_FORMAT = int;
enum : int
{
    DXVAHD_FRAME_FORMAT_PROGRESSIVE                   = 0x00000000,
    DXVAHD_FRAME_FORMAT_INTERLACED_TOP_FIELD_FIRST    = 0x00000001,
    DXVAHD_FRAME_FORMAT_INTERLACED_BOTTOM_FIELD_FIRST = 0x00000002,
}

alias DXVAHD_DEVICE_USAGE = int;
enum : int
{
    DXVAHD_DEVICE_USAGE_PLAYBACK_NORMAL = 0x00000000,
    DXVAHD_DEVICE_USAGE_OPTIMAL_SPEED   = 0x00000001,
    DXVAHD_DEVICE_USAGE_OPTIMAL_QUALITY = 0x00000002,
}

alias DXVAHD_SURFACE_TYPE = int;
enum : int
{
    DXVAHD_SURFACE_TYPE_VIDEO_INPUT         = 0x00000000,
    DXVAHD_SURFACE_TYPE_VIDEO_INPUT_PRIVATE = 0x00000001,
    DXVAHD_SURFACE_TYPE_VIDEO_OUTPUT        = 0x00000002,
}

alias DXVAHD_DEVICE_TYPE = int;
enum : int
{
    DXVAHD_DEVICE_TYPE_HARDWARE  = 0x00000000,
    DXVAHD_DEVICE_TYPE_SOFTWARE  = 0x00000001,
    DXVAHD_DEVICE_TYPE_REFERENCE = 0x00000002,
    DXVAHD_DEVICE_TYPE_OTHER     = 0x00000003,
}

alias DXVAHD_DEVICE_CAPS = int;
enum : int
{
    DXVAHD_DEVICE_CAPS_LINEAR_SPACE            = 0x00000001,
    DXVAHD_DEVICE_CAPS_xvYCC                   = 0x00000002,
    DXVAHD_DEVICE_CAPS_RGB_RANGE_CONVERSION    = 0x00000004,
    DXVAHD_DEVICE_CAPS_YCbCr_MATRIX_CONVERSION = 0x00000008,
}

alias DXVAHD_FEATURE_CAPS = int;
enum : int
{
    DXVAHD_FEATURE_CAPS_ALPHA_FILL    = 0x00000001,
    DXVAHD_FEATURE_CAPS_CONSTRICTION  = 0x00000002,
    DXVAHD_FEATURE_CAPS_LUMA_KEY      = 0x00000004,
    DXVAHD_FEATURE_CAPS_ALPHA_PALETTE = 0x00000008,
}

alias DXVAHD_FILTER_CAPS = int;
enum : int
{
    DXVAHD_FILTER_CAPS_BRIGHTNESS         = 0x00000001,
    DXVAHD_FILTER_CAPS_CONTRAST           = 0x00000002,
    DXVAHD_FILTER_CAPS_HUE                = 0x00000004,
    DXVAHD_FILTER_CAPS_SATURATION         = 0x00000008,
    DXVAHD_FILTER_CAPS_NOISE_REDUCTION    = 0x00000010,
    DXVAHD_FILTER_CAPS_EDGE_ENHANCEMENT   = 0x00000020,
    DXVAHD_FILTER_CAPS_ANAMORPHIC_SCALING = 0x00000040,
}

alias DXVAHD_INPUT_FORMAT_CAPS = int;
enum : int
{
    DXVAHD_INPUT_FORMAT_CAPS_RGB_INTERLACED     = 0x00000001,
    DXVAHD_INPUT_FORMAT_CAPS_RGB_PROCAMP        = 0x00000002,
    DXVAHD_INPUT_FORMAT_CAPS_RGB_LUMA_KEY       = 0x00000004,
    DXVAHD_INPUT_FORMAT_CAPS_PALETTE_INTERLACED = 0x00000008,
}

alias DXVAHD_PROCESSOR_CAPS = int;
enum : int
{
    DXVAHD_PROCESSOR_CAPS_DEINTERLACE_BLEND               = 0x00000001,
    DXVAHD_PROCESSOR_CAPS_DEINTERLACE_BOB                 = 0x00000002,
    DXVAHD_PROCESSOR_CAPS_DEINTERLACE_ADAPTIVE            = 0x00000004,
    DXVAHD_PROCESSOR_CAPS_DEINTERLACE_MOTION_COMPENSATION = 0x00000008,
    DXVAHD_PROCESSOR_CAPS_INVERSE_TELECINE                = 0x00000010,
    DXVAHD_PROCESSOR_CAPS_FRAME_RATE_CONVERSION           = 0x00000020,
}

alias DXVAHD_ITELECINE_CAPS = int;
enum : int
{
    DXVAHD_ITELECINE_CAPS_32           = 0x00000001,
    DXVAHD_ITELECINE_CAPS_22           = 0x00000002,
    DXVAHD_ITELECINE_CAPS_2224         = 0x00000004,
    DXVAHD_ITELECINE_CAPS_2332         = 0x00000008,
    DXVAHD_ITELECINE_CAPS_32322        = 0x00000010,
    DXVAHD_ITELECINE_CAPS_55           = 0x00000020,
    DXVAHD_ITELECINE_CAPS_64           = 0x00000040,
    DXVAHD_ITELECINE_CAPS_87           = 0x00000080,
    DXVAHD_ITELECINE_CAPS_222222222223 = 0x00000100,
    DXVAHD_ITELECINE_CAPS_OTHER        = 0x80000000,
}

alias DXVAHD_FILTER = int;
enum : int
{
    DXVAHD_FILTER_BRIGHTNESS         = 0x00000000,
    DXVAHD_FILTER_CONTRAST           = 0x00000001,
    DXVAHD_FILTER_HUE                = 0x00000002,
    DXVAHD_FILTER_SATURATION         = 0x00000003,
    DXVAHD_FILTER_NOISE_REDUCTION    = 0x00000004,
    DXVAHD_FILTER_EDGE_ENHANCEMENT   = 0x00000005,
    DXVAHD_FILTER_ANAMORPHIC_SCALING = 0x00000006,
}

alias DXVAHD_BLT_STATE = int;
enum : int
{
    DXVAHD_BLT_STATE_TARGET_RECT        = 0x00000000,
    DXVAHD_BLT_STATE_BACKGROUND_COLOR   = 0x00000001,
    DXVAHD_BLT_STATE_OUTPUT_COLOR_SPACE = 0x00000002,
    DXVAHD_BLT_STATE_ALPHA_FILL         = 0x00000003,
    DXVAHD_BLT_STATE_CONSTRICTION       = 0x00000004,
    DXVAHD_BLT_STATE_PRIVATE            = 0x000003e8,
}

alias DXVAHD_ALPHA_FILL_MODE = int;
enum : int
{
    DXVAHD_ALPHA_FILL_MODE_OPAQUE        = 0x00000000,
    DXVAHD_ALPHA_FILL_MODE_BACKGROUND    = 0x00000001,
    DXVAHD_ALPHA_FILL_MODE_DESTINATION   = 0x00000002,
    DXVAHD_ALPHA_FILL_MODE_SOURCE_STREAM = 0x00000003,
}

alias DXVAHD_STREAM_STATE = int;
enum : int
{
    DXVAHD_STREAM_STATE_D3DFORMAT                 = 0x00000000,
    DXVAHD_STREAM_STATE_FRAME_FORMAT              = 0x00000001,
    DXVAHD_STREAM_STATE_INPUT_COLOR_SPACE         = 0x00000002,
    DXVAHD_STREAM_STATE_OUTPUT_RATE               = 0x00000003,
    DXVAHD_STREAM_STATE_SOURCE_RECT               = 0x00000004,
    DXVAHD_STREAM_STATE_DESTINATION_RECT          = 0x00000005,
    DXVAHD_STREAM_STATE_ALPHA                     = 0x00000006,
    DXVAHD_STREAM_STATE_PALETTE                   = 0x00000007,
    DXVAHD_STREAM_STATE_LUMA_KEY                  = 0x00000008,
    DXVAHD_STREAM_STATE_ASPECT_RATIO              = 0x00000009,
    DXVAHD_STREAM_STATE_FILTER_BRIGHTNESS         = 0x00000064,
    DXVAHD_STREAM_STATE_FILTER_CONTRAST           = 0x00000065,
    DXVAHD_STREAM_STATE_FILTER_HUE                = 0x00000066,
    DXVAHD_STREAM_STATE_FILTER_SATURATION         = 0x00000067,
    DXVAHD_STREAM_STATE_FILTER_NOISE_REDUCTION    = 0x00000068,
    DXVAHD_STREAM_STATE_FILTER_EDGE_ENHANCEMENT   = 0x00000069,
    DXVAHD_STREAM_STATE_FILTER_ANAMORPHIC_SCALING = 0x0000006a,
    DXVAHD_STREAM_STATE_PRIVATE                   = 0x000003e8,
}

alias DXVAHD_OUTPUT_RATE = int;
enum : int
{
    DXVAHD_OUTPUT_RATE_NORMAL = 0x00000000,
    DXVAHD_OUTPUT_RATE_HALF   = 0x00000001,
    DXVAHD_OUTPUT_RATE_CUSTOM = 0x00000002,
}

struct DXVAHD_RATIONAL
{
    uint Numerator;
    uint Denominator;
}
struct DXVAHD_COLOR_RGBA
{
    float R;
    float G;
    float B;
    float A;
}
struct DXVAHD_COLOR_YCbCrA
{
    float Y;
    float Cb;
    float Cr;
    float A;
}
union DXVAHD_COLOR
{
    DXVAHD_COLOR_RGBA RGB;
    DXVAHD_COLOR_YCbCrA YCbCr;
}
struct DXVAHD_CONTENT_DESC
{
    DXVAHD_FRAME_FORMAT InputFrameFormat;
    DXVAHD_RATIONAL InputFrameRate;
    uint InputWidth;
    uint InputHeight;
    DXVAHD_RATIONAL OutputFrameRate;
    uint OutputWidth;
    uint OutputHeight;
}
struct DXVAHD_VPDEVCAPS
{
    DXVAHD_DEVICE_TYPE DeviceType;
    uint DeviceCaps;
    uint FeatureCaps;
    uint FilterCaps;
    uint InputFormatCaps;
    D3DPOOL InputPool;
    uint OutputFormatCount;
    uint InputFormatCount;
    uint VideoProcessorCount;
    uint MaxInputStreams;
    uint MaxStreamStates;
}
struct DXVAHD_VPCAPS
{
    GUID VPGuid;
    uint PastFrames;
    uint FutureFrames;
    uint ProcessorCaps;
    uint ITelecineCaps;
    uint CustomRateCount;
}
struct DXVAHD_CUSTOM_RATE_DATA
{
    DXVAHD_RATIONAL CustomRate;
    uint OutputFrames;
    BOOL InputInterlaced;
    uint InputFramesOrFields;
}
struct DXVAHD_FILTER_RANGE_DATA
{
    int Minimum;
    int Maximum;
    int Default;
    float Multiplier;
}
struct DXVAHD_BLT_STATE_TARGET_RECT_DATA
{
    BOOL Enable;
    RECT TargetRect;
}
struct DXVAHD_BLT_STATE_BACKGROUND_COLOR_DATA
{
    BOOL YCbCr;
    DXVAHD_COLOR BackgroundColor;
}
struct DXVAHD_BLT_STATE_OUTPUT_COLOR_SPACE_DATA
{
    union
    {
        struct
        {
            uint _bitfield0;
        }
        uint Value;
    }
}
struct DXVAHD_BLT_STATE_ALPHA_FILL_DATA
{
    DXVAHD_ALPHA_FILL_MODE Mode;
    uint StreamNumber;
}
struct DXVAHD_BLT_STATE_CONSTRICTION_DATA
{
    BOOL Enable;
    SIZE Size;
}
struct DXVAHD_BLT_STATE_PRIVATE_DATA
{
    GUID Guid;
    uint DataSize;
    void* pData;
}
struct DXVAHD_STREAM_STATE_D3DFORMAT_DATA
{
    D3DFORMAT Format;
}
struct DXVAHD_STREAM_STATE_FRAME_FORMAT_DATA
{
    DXVAHD_FRAME_FORMAT FrameFormat;
}
struct DXVAHD_STREAM_STATE_INPUT_COLOR_SPACE_DATA
{
    union
    {
        struct
        {
            uint _bitfield0;
        }
        uint Value;
    }
}
struct DXVAHD_STREAM_STATE_OUTPUT_RATE_DATA
{
    BOOL RepeatFrame;
    DXVAHD_OUTPUT_RATE OutputRate;
    DXVAHD_RATIONAL CustomRate;
}
struct DXVAHD_STREAM_STATE_SOURCE_RECT_DATA
{
    BOOL Enable;
    RECT SourceRect;
}
struct DXVAHD_STREAM_STATE_DESTINATION_RECT_DATA
{
    BOOL Enable;
    RECT DestinationRect;
}
struct DXVAHD_STREAM_STATE_ALPHA_DATA
{
    BOOL Enable;
    float Alpha;
}
struct DXVAHD_STREAM_STATE_PALETTE_DATA
{
    uint Count;
    uint* pEntries;
}
struct DXVAHD_STREAM_STATE_LUMA_KEY_DATA
{
    BOOL Enable;
    float Lower;
    float Upper;
}
struct DXVAHD_STREAM_STATE_ASPECT_RATIO_DATA
{
    BOOL Enable;
    DXVAHD_RATIONAL SourceAspectRatio;
    DXVAHD_RATIONAL DestinationAspectRatio;
}
struct DXVAHD_STREAM_STATE_FILTER_DATA
{
    BOOL Enable;
    int Level;
}
struct DXVAHD_STREAM_STATE_PRIVATE_DATA
{
    GUID Guid;
    uint DataSize;
    void* pData;
}
struct DXVAHD_STREAM_DATA
{
    BOOL Enable;
    uint OutputIndex;
    uint InputFrameOrField;
    uint PastFrames;
    uint FutureFrames;
    IDirect3DSurface9* ppPastSurfaces;
    IDirect3DSurface9 pInputSurface;
    IDirect3DSurface9* ppFutureSurfaces;
}
struct DXVAHD_STREAM_STATE_PRIVATE_IVTC_DATA
{
    BOOL Enable;
    uint ITelecineFlags;
    uint Frames;
    uint InputField;
}
enum IID_IDXVAHD_Device = GUID(0x95f12dfd, 0xd77e, 0x49be, [0x81, 0x5f, 0x57, 0xd5, 0x79, 0x63, 0x4d, 0x6d]);
interface IDXVAHD_Device : IUnknown
{
    HRESULT CreateVideoSurface(uint, uint, D3DFORMAT, D3DPOOL, uint, DXVAHD_SURFACE_TYPE, uint, IDirect3DSurface9*, HANDLE*);
    HRESULT GetVideoProcessorDeviceCaps(DXVAHD_VPDEVCAPS*);
    HRESULT GetVideoProcessorOutputFormats(uint, D3DFORMAT*);
    HRESULT GetVideoProcessorInputFormats(uint, D3DFORMAT*);
    HRESULT GetVideoProcessorCaps(uint, DXVAHD_VPCAPS*);
    HRESULT GetVideoProcessorCustomRates(const(GUID)*, uint, DXVAHD_CUSTOM_RATE_DATA*);
    HRESULT GetVideoProcessorFilterRange(DXVAHD_FILTER, DXVAHD_FILTER_RANGE_DATA*);
    HRESULT CreateVideoProcessor(const(GUID)*, IDXVAHD_VideoProcessor*);
}
enum IID_IDXVAHD_VideoProcessor = GUID(0x95f4edf4, 0x6e03, 0x4cd7, [0xbe, 0x1b, 0x30, 0x75, 0xd6, 0x65, 0xaa, 0x52]);
interface IDXVAHD_VideoProcessor : IUnknown
{
    HRESULT SetVideoProcessBltState(DXVAHD_BLT_STATE, uint, const(void)*);
    HRESULT GetVideoProcessBltState(DXVAHD_BLT_STATE, uint, void*);
    HRESULT SetVideoProcessStreamState(uint, DXVAHD_STREAM_STATE, uint, const(void)*);
    HRESULT GetVideoProcessStreamState(uint, DXVAHD_STREAM_STATE, uint, void*);
    HRESULT VideoProcessBltHD(IDirect3DSurface9, uint, uint, const(DXVAHD_STREAM_DATA)*);
}
alias PDXVAHDSW_CreateDevice = HRESULT function(IDirect3DDevice9Ex, HANDLE*);
alias PDXVAHDSW_ProposeVideoPrivateFormat = HRESULT function(HANDLE, D3DFORMAT*);
alias PDXVAHDSW_GetVideoProcessorDeviceCaps = HRESULT function(HANDLE, const(DXVAHD_CONTENT_DESC)*, DXVAHD_DEVICE_USAGE, DXVAHD_VPDEVCAPS*);
alias PDXVAHDSW_GetVideoProcessorOutputFormats = HRESULT function(HANDLE, const(DXVAHD_CONTENT_DESC)*, DXVAHD_DEVICE_USAGE, uint, D3DFORMAT*);
alias PDXVAHDSW_GetVideoProcessorInputFormats = HRESULT function(HANDLE, const(DXVAHD_CONTENT_DESC)*, DXVAHD_DEVICE_USAGE, uint, D3DFORMAT*);
alias PDXVAHDSW_GetVideoProcessorCaps = HRESULT function(HANDLE, const(DXVAHD_CONTENT_DESC)*, DXVAHD_DEVICE_USAGE, uint, DXVAHD_VPCAPS*);
alias PDXVAHDSW_GetVideoProcessorCustomRates = HRESULT function(HANDLE, const(GUID)*, uint, DXVAHD_CUSTOM_RATE_DATA*);
alias PDXVAHDSW_GetVideoProcessorFilterRange = HRESULT function(HANDLE, DXVAHD_FILTER, DXVAHD_FILTER_RANGE_DATA*);
alias PDXVAHDSW_DestroyDevice = HRESULT function(HANDLE);
alias PDXVAHDSW_CreateVideoProcessor = HRESULT function(HANDLE, const(GUID)*, HANDLE*);
alias PDXVAHDSW_SetVideoProcessBltState = HRESULT function(HANDLE, DXVAHD_BLT_STATE, uint, const(void)*);
alias PDXVAHDSW_GetVideoProcessBltStatePrivate = HRESULT function(HANDLE, DXVAHD_BLT_STATE_PRIVATE_DATA*);
alias PDXVAHDSW_SetVideoProcessStreamState = HRESULT function(HANDLE, uint, DXVAHD_STREAM_STATE, uint, const(void)*);
alias PDXVAHDSW_GetVideoProcessStreamStatePrivate = HRESULT function(HANDLE, uint, DXVAHD_STREAM_STATE_PRIVATE_DATA*);
alias PDXVAHDSW_VideoProcessBltHD = HRESULT function(HANDLE, IDirect3DSurface9, uint, uint, const(DXVAHD_STREAM_DATA)*);
alias PDXVAHDSW_DestroyVideoProcessor = HRESULT function(HANDLE);
struct DXVAHDSW_CALLBACKS
{
    PDXVAHDSW_CreateDevice CreateDevice;
    PDXVAHDSW_ProposeVideoPrivateFormat ProposeVideoPrivateFormat;
    PDXVAHDSW_GetVideoProcessorDeviceCaps GetVideoProcessorDeviceCaps;
    PDXVAHDSW_GetVideoProcessorOutputFormats GetVideoProcessorOutputFormats;
    PDXVAHDSW_GetVideoProcessorInputFormats GetVideoProcessorInputFormats;
    PDXVAHDSW_GetVideoProcessorCaps GetVideoProcessorCaps;
    PDXVAHDSW_GetVideoProcessorCustomRates GetVideoProcessorCustomRates;
    PDXVAHDSW_GetVideoProcessorFilterRange GetVideoProcessorFilterRange;
    PDXVAHDSW_DestroyDevice DestroyDevice;
    PDXVAHDSW_CreateVideoProcessor CreateVideoProcessor;
    PDXVAHDSW_SetVideoProcessBltState SetVideoProcessBltState;
    PDXVAHDSW_GetVideoProcessBltStatePrivate GetVideoProcessBltStatePrivate;
    PDXVAHDSW_SetVideoProcessStreamState SetVideoProcessStreamState;
    PDXVAHDSW_GetVideoProcessStreamStatePrivate GetVideoProcessStreamStatePrivate;
    PDXVAHDSW_VideoProcessBltHD VideoProcessBltHD;
    PDXVAHDSW_DestroyVideoProcessor DestroyVideoProcessor;
}
alias PDXVAHDSW_Plugin = HRESULT function(uint, void*);
struct DXVAHDETW_CREATEVIDEOPROCESSOR
{
    ulong pObject;
    ulong pD3D9Ex;
    GUID VPGuid;
}
struct DXVAHDETW_VIDEOPROCESSBLTSTATE
{
    ulong pObject;
    DXVAHD_BLT_STATE State;
    uint DataSize;
    BOOL SetState;
}
struct DXVAHDETW_VIDEOPROCESSSTREAMSTATE
{
    ulong pObject;
    uint StreamNumber;
    DXVAHD_STREAM_STATE State;
    uint DataSize;
    BOOL SetState;
}
struct DXVAHDETW_VIDEOPROCESSBLTHD
{
    ulong pObject;
    ulong pOutputSurface;
    RECT TargetRect;
    D3DFORMAT OutputFormat;
    uint ColorSpace;
    uint OutputFrame;
    uint StreamCount;
    BOOL Enter;
}
struct DXVAHDETW_VIDEOPROCESSBLTHD_STREAM
{
    ulong pObject;
    ulong pInputSurface;
    RECT SourceRect;
    RECT DestinationRect;
    D3DFORMAT InputFormat;
    DXVAHD_FRAME_FORMAT FrameFormat;
    uint ColorSpace;
    uint StreamNumber;
    uint OutputIndex;
    uint InputFrameOrField;
    uint PastFrames;
    uint FutureFrames;
}
struct DXVAHDETW_DESTROYVIDEOPROCESSOR
{
    ulong pObject;
}
alias PDXVAHD_CreateDevice = HRESULT function(IDirect3DDevice9Ex, const(DXVAHD_CONTENT_DESC)*, DXVAHD_DEVICE_USAGE, PDXVAHDSW_Plugin, IDXVAHD_Device*);
struct DXVA2_ExtendedFormat
{
    union
    {
        struct
        {
            uint _bitfield0;
        }
        uint value;
    }
}
alias DXVA2_SampleFormat = int;
enum : int
{
    DXVA2_SampleFormatMask                = 0x000000ff,
    DXVA2_SampleUnknown                   = 0x00000000,
    DXVA2_SampleProgressiveFrame          = 0x00000002,
    DXVA2_SampleFieldInterleavedEvenFirst = 0x00000003,
    DXVA2_SampleFieldInterleavedOddFirst  = 0x00000004,
    DXVA2_SampleFieldSingleEven           = 0x00000005,
    DXVA2_SampleFieldSingleOdd            = 0x00000006,
    DXVA2_SampleSubStream                 = 0x00000007,
}

alias DXVA2_VideoChromaSubSampling = int;
enum : int
{
    DXVA2_VideoChromaSubsamplingMask                            = 0x0000000f,
    DXVA2_VideoChromaSubsampling_Unknown                        = 0x00000000,
    DXVA2_VideoChromaSubsampling_ProgressiveChroma              = 0x00000008,
    DXVA2_VideoChromaSubsampling_Horizontally_Cosited           = 0x00000004,
    DXVA2_VideoChromaSubsampling_Vertically_Cosited             = 0x00000002,
    DXVA2_VideoChromaSubsampling_Vertically_AlignedChromaPlanes = 0x00000001,
    DXVA2_VideoChromaSubsampling_MPEG2                          = 0x00000005,
    DXVA2_VideoChromaSubsampling_MPEG1                          = 0x00000001,
    DXVA2_VideoChromaSubsampling_DV_PAL                         = 0x00000006,
    DXVA2_VideoChromaSubsampling_Cosited                        = 0x00000007,
}

alias DXVA2_NominalRange = int;
enum : int
{
    DXVA2_NominalRangeMask     = 0x00000007,
    DXVA2_NominalRange_Unknown = 0x00000000,
    DXVA2_NominalRange_Normal  = 0x00000001,
    DXVA2_NominalRange_Wide    = 0x00000002,
    DXVA2_NominalRange_0_255   = 0x00000001,
    DXVA2_NominalRange_16_235  = 0x00000002,
    DXVA2_NominalRange_48_208  = 0x00000003,
}

alias DXVA2_VideoTransferMatrix = int;
enum : int
{
    DXVA2_VideoTransferMatrixMask       = 0x00000007,
    DXVA2_VideoTransferMatrix_Unknown   = 0x00000000,
    DXVA2_VideoTransferMatrix_BT709     = 0x00000001,
    DXVA2_VideoTransferMatrix_BT601     = 0x00000002,
    DXVA2_VideoTransferMatrix_SMPTE240M = 0x00000003,
}

alias DXVA2_VideoLighting = int;
enum : int
{
    DXVA2_VideoLightingMask     = 0x0000000f,
    DXVA2_VideoLighting_Unknown = 0x00000000,
    DXVA2_VideoLighting_bright  = 0x00000001,
    DXVA2_VideoLighting_office  = 0x00000002,
    DXVA2_VideoLighting_dim     = 0x00000003,
    DXVA2_VideoLighting_dark    = 0x00000004,
}

alias DXVA2_VideoPrimaries = int;
enum : int
{
    DXVA2_VideoPrimariesMask           = 0x0000001f,
    DXVA2_VideoPrimaries_Unknown       = 0x00000000,
    DXVA2_VideoPrimaries_reserved      = 0x00000001,
    DXVA2_VideoPrimaries_BT709         = 0x00000002,
    DXVA2_VideoPrimaries_BT470_2_SysM  = 0x00000003,
    DXVA2_VideoPrimaries_BT470_2_SysBG = 0x00000004,
    DXVA2_VideoPrimaries_SMPTE170M     = 0x00000005,
    DXVA2_VideoPrimaries_SMPTE240M     = 0x00000006,
    DXVA2_VideoPrimaries_EBU3213       = 0x00000007,
    DXVA2_VideoPrimaries_SMPTE_C       = 0x00000008,
}

alias DXVA2_VideoTransferFunction = int;
enum : int
{
    DXVA2_VideoTransFuncMask     = 0x0000001f,
    DXVA2_VideoTransFunc_Unknown = 0x00000000,
    DXVA2_VideoTransFunc_10      = 0x00000001,
    DXVA2_VideoTransFunc_18      = 0x00000002,
    DXVA2_VideoTransFunc_20      = 0x00000003,
    DXVA2_VideoTransFunc_22      = 0x00000004,
    DXVA2_VideoTransFunc_709     = 0x00000005,
    DXVA2_VideoTransFunc_240M    = 0x00000006,
    DXVA2_VideoTransFunc_sRGB    = 0x00000007,
    DXVA2_VideoTransFunc_28      = 0x00000008,
}

struct DXVA2_Frequency
{
    uint Numerator;
    uint Denominator;
}
struct DXVA2_VideoDesc
{
    uint SampleWidth;
    uint SampleHeight;
    DXVA2_ExtendedFormat SampleFormat;
    D3DFORMAT Format;
    DXVA2_Frequency InputSampleFreq;
    DXVA2_Frequency OutputFrameFreq;
    uint UABProtectionLevel;
    uint Reserved;
}
alias DXVA2_DeinterlaceTech = int;
enum : int
{
    DXVA2_DeinterlaceTech_Unknown                = 0x00000000,
    DXVA2_DeinterlaceTech_BOBLineReplicate       = 0x00000001,
    DXVA2_DeinterlaceTech_BOBVerticalStretch     = 0x00000002,
    DXVA2_DeinterlaceTech_BOBVerticalStretch4Tap = 0x00000004,
    DXVA2_DeinterlaceTech_MedianFiltering        = 0x00000008,
    DXVA2_DeinterlaceTech_EdgeFiltering          = 0x00000010,
    DXVA2_DeinterlaceTech_FieldAdaptive          = 0x00000020,
    DXVA2_DeinterlaceTech_PixelAdaptive          = 0x00000040,
    DXVA2_DeinterlaceTech_MotionVectorSteered    = 0x00000080,
    DXVA2_DeinterlaceTech_InverseTelecine        = 0x00000100,
    DXVA2_DeinterlaceTech_Mask                   = 0x000001ff,
}

alias DXVA2_FilterType = int;
enum : int
{
    DXVA2_NoiseFilterLumaLevel        = 0x00000001,
    DXVA2_NoiseFilterLumaThreshold    = 0x00000002,
    DXVA2_NoiseFilterLumaRadius       = 0x00000003,
    DXVA2_NoiseFilterChromaLevel      = 0x00000004,
    DXVA2_NoiseFilterChromaThreshold  = 0x00000005,
    DXVA2_NoiseFilterChromaRadius     = 0x00000006,
    DXVA2_DetailFilterLumaLevel       = 0x00000007,
    DXVA2_DetailFilterLumaThreshold   = 0x00000008,
    DXVA2_DetailFilterLumaRadius      = 0x00000009,
    DXVA2_DetailFilterChromaLevel     = 0x0000000a,
    DXVA2_DetailFilterChromaThreshold = 0x0000000b,
    DXVA2_DetailFilterChromaRadius    = 0x0000000c,
}

alias DXVA2_NoiseFilterTech = int;
enum : int
{
    DXVA2_NoiseFilterTech_Unsupported   = 0x00000000,
    DXVA2_NoiseFilterTech_Unknown       = 0x00000001,
    DXVA2_NoiseFilterTech_Median        = 0x00000002,
    DXVA2_NoiseFilterTech_Temporal      = 0x00000004,
    DXVA2_NoiseFilterTech_BlockNoise    = 0x00000008,
    DXVA2_NoiseFilterTech_MosquitoNoise = 0x00000010,
    DXVA2_NoiseFilterTech_Mask          = 0x0000001f,
}

alias DXVA2_DetailFilterTech = int;
enum : int
{
    DXVA2_DetailFilterTech_Unsupported = 0x00000000,
    DXVA2_DetailFilterTech_Unknown     = 0x00000001,
    DXVA2_DetailFilterTech_Edge        = 0x00000002,
    DXVA2_DetailFilterTech_Sharpening  = 0x00000004,
    DXVA2_DetailFilterTech_Mask        = 0x00000007,
}

alias DXVA2_ProcAmp = int;
enum : int
{
    DXVA2_ProcAmp_None       = 0x00000000,
    DXVA2_ProcAmp_Brightness = 0x00000001,
    DXVA2_ProcAmp_Contrast   = 0x00000002,
    DXVA2_ProcAmp_Hue        = 0x00000004,
    DXVA2_ProcAmp_Saturation = 0x00000008,
    DXVA2_ProcAmp_Mask       = 0x0000000f,
}

alias DXVA2_VideoProcess = int;
enum : int
{
    DXVA2_VideoProcess_None                       = 0x00000000,
    DXVA2_VideoProcess_YUV2RGB                    = 0x00000001,
    DXVA2_VideoProcess_StretchX                   = 0x00000002,
    DXVA2_VideoProcess_StretchY                   = 0x00000004,
    DXVA2_VideoProcess_AlphaBlend                 = 0x00000008,
    DXVA2_VideoProcess_SubRects                   = 0x00000010,
    DXVA2_VideoProcess_SubStreams                 = 0x00000020,
    DXVA2_VideoProcess_SubStreamsExtended         = 0x00000040,
    DXVA2_VideoProcess_YUV2RGBExtended            = 0x00000080,
    DXVA2_VideoProcess_AlphaBlendExtended         = 0x00000100,
    DXVA2_VideoProcess_Constriction               = 0x00000200,
    DXVA2_VideoProcess_NoiseFilter                = 0x00000400,
    DXVA2_VideoProcess_DetailFilter               = 0x00000800,
    DXVA2_VideoProcess_PlanarAlpha                = 0x00001000,
    DXVA2_VideoProcess_LinearScaling              = 0x00002000,
    DXVA2_VideoProcess_GammaCompensated           = 0x00004000,
    DXVA2_VideoProcess_MaintainsOriginalFieldData = 0x00008000,
    DXVA2_VideoProcess_Mask                       = 0x0000ffff,
}

alias DXVA2_VPDev = int;
enum : int
{
    DXVA2_VPDev_HardwareDevice = 0x00000001,
    DXVA2_VPDev_EmulatedDXVA1  = 0x00000002,
    DXVA2_VPDev_SoftwareDevice = 0x00000004,
    DXVA2_VPDev_Mask           = 0x00000007,
}

alias DXVA2_SampleData = int;
enum : int
{
    DXVA2_SampleData_RFF             = 0x00000001,
    DXVA2_SampleData_TFF             = 0x00000002,
    DXVA2_SampleData_RFF_TFF_Present = 0x00000004,
    DXVA2_SampleData_Mask            = 0x0000ffff,
}

alias DXVA2_DestData = int;
enum : int
{
    DXVA2_DestData_RFF             = 0x00000001,
    DXVA2_DestData_TFF             = 0x00000002,
    DXVA2_DestData_RFF_TFF_Present = 0x00000004,
    DXVA2_DestData_Mask            = 0x0000ffff,
}

struct DXVA2_VideoProcessorCaps
{
    uint DeviceCaps;
    D3DPOOL InputPool;
    uint NumForwardRefSamples;
    uint NumBackwardRefSamples;
    uint Reserved;
    uint DeinterlaceTechnology;
    uint ProcAmpControlCaps;
    uint VideoProcessorOperations;
    uint NoiseFilterTechnology;
    uint DetailFilterTechnology;
}
struct DXVA2_Fixed32
{
    union
    {
        struct
        {
            ushort Fraction;
            short Value;
        }
        int ll;
    }
}
struct DXVA2_AYUVSample8
{
    ubyte Cr;
    ubyte Cb;
    ubyte Y;
    ubyte Alpha;
}
struct DXVA2_AYUVSample16
{
    ushort Cr;
    ushort Cb;
    ushort Y;
    ushort Alpha;
}
struct DXVA2_VideoSample
{
    long Start;
    long End;
    DXVA2_ExtendedFormat SampleFormat;
    IDirect3DSurface9 SrcSurface;
    RECT SrcRect;
    RECT DstRect;
    DXVA2_AYUVSample8[16] Pal;
    DXVA2_Fixed32 PlanarAlpha;
    uint SampleData;
}
struct DXVA2_ValueRange
{
    DXVA2_Fixed32 MinValue;
    DXVA2_Fixed32 MaxValue;
    DXVA2_Fixed32 DefaultValue;
    DXVA2_Fixed32 StepSize;
}
struct DXVA2_ProcAmpValues
{
    DXVA2_Fixed32 Brightness;
    DXVA2_Fixed32 Contrast;
    DXVA2_Fixed32 Hue;
    DXVA2_Fixed32 Saturation;
}
struct DXVA2_FilterValues
{
    DXVA2_Fixed32 Level;
    DXVA2_Fixed32 Threshold;
    DXVA2_Fixed32 Radius;
}
struct DXVA2_VideoProcessBltParams
{
    long TargetFrame;
    RECT TargetRect;
    SIZE ConstrictionSize;
    uint StreamingFlags;
    DXVA2_AYUVSample16 BackgroundColor;
    DXVA2_ExtendedFormat DestFormat;
    DXVA2_ProcAmpValues ProcAmpValues;
    DXVA2_Fixed32 Alpha;
    DXVA2_FilterValues NoiseFilterLuma;
    DXVA2_FilterValues NoiseFilterChroma;
    DXVA2_FilterValues DetailFilterLuma;
    DXVA2_FilterValues DetailFilterChroma;
    uint DestData;
}
alias DXVA2_BufferfType = int;
enum : int
{
    DXVA2_PictureParametersBufferType         = 0x00000000,
    DXVA2_MacroBlockControlBufferType         = 0x00000001,
    DXVA2_ResidualDifferenceBufferType        = 0x00000002,
    DXVA2_DeblockingControlBufferType         = 0x00000003,
    DXVA2_InverseQuantizationMatrixBufferType = 0x00000004,
    DXVA2_SliceControlBufferType              = 0x00000005,
    DXVA2_BitStreamDateBufferType             = 0x00000006,
    DXVA2_MotionVectorBuffer                  = 0x00000007,
    DXVA2_FilmGrainBuffer                     = 0x00000008,
}

alias DXVA2_VideoRenderTargetType = int;
enum : int
{
    DXVA2_VideoDecoderRenderTarget   = 0x00000000,
    DXVA2_VideoProcessorRenderTarget = 0x00000001,
    DXVA2_VideoSoftwareRenderTarget  = 0x00000002,
}

struct DXVA2_ConfigPictureDecode
{
    GUID guidConfigBitstreamEncryption;
    GUID guidConfigMBcontrolEncryption;
    GUID guidConfigResidDiffEncryption;
    uint ConfigBitstreamRaw;
    uint ConfigMBcontrolRasterOrder;
    uint ConfigResidDiffHost;
    uint ConfigSpatialResid8;
    uint ConfigResid8Subtraction;
    uint ConfigSpatialHost8or9Clipping;
    uint ConfigSpatialResidInterleaved;
    uint ConfigIntraResidUnsigned;
    uint ConfigResidDiffAccelerator;
    uint ConfigHostInverseScan;
    uint ConfigSpecificIDCT;
    uint Config4GroupedCoefs;
    ushort ConfigMinRenderTargetBuffCount;
    ushort ConfigDecoderSpecific;
}
struct DXVA2_DecodeBufferDesc
{
    DXVA2_BufferfType CompressedBufferType;
    uint BufferIndex;
    uint DataOffset;
    uint DataSize;
    uint FirstMBaddress;
    uint NumMBsInBuffer;
    uint Width;
    uint Height;
    uint Stride;
    uint ReservedBits;
    void* pvPVPState;
}
struct DXVA2_AES_CTR_IV
{
    ulong IV;
    ulong Count;
}
struct DXVA2_DecodeExtensionData
{
    uint Function;
    void* pPrivateInputData;
    uint PrivateInputDataSize;
    void* pPrivateOutputData;
    uint PrivateOutputDataSize;
}
struct DXVA2_DecodeExecuteParams
{
    uint NumCompBuffers;
    DXVA2_DecodeBufferDesc* pCompressedBuffers;
    DXVA2_DecodeExtensionData* pExtensionData;
}
enum IID_IDirect3DDeviceManager9 = GUID(0xa0cade0f, 0x6d5, 0x4cf4, [0xa1, 0xc7, 0xf3, 0xcd, 0xd7, 0x25, 0xaa, 0x75]);
interface IDirect3DDeviceManager9 : IUnknown
{
    HRESULT ResetDevice(IDirect3DDevice9, uint);
    HRESULT OpenDeviceHandle(HANDLE*);
    HRESULT CloseDeviceHandle(HANDLE);
    HRESULT TestDevice(HANDLE);
    HRESULT LockDevice(HANDLE, IDirect3DDevice9*, BOOL);
    HRESULT UnlockDevice(HANDLE, BOOL);
    HRESULT GetVideoService(HANDLE, const(GUID)*, void**);
}
enum IID_IDirectXVideoAccelerationService = GUID(0xfc51a550, 0xd5e7, 0x11d9, [0xaf, 0x55, 0x0, 0x5, 0x4e, 0x43, 0xff, 0x2]);
interface IDirectXVideoAccelerationService : IUnknown
{
    HRESULT CreateSurface(uint, uint, uint, D3DFORMAT, D3DPOOL, uint, DXVA2_VideoRenderTargetType, IDirect3DSurface9*, HANDLE*);
}
enum IID_IDirectXVideoDecoderService = GUID(0xfc51a551, 0xd5e7, 0x11d9, [0xaf, 0x55, 0x0, 0x5, 0x4e, 0x43, 0xff, 0x2]);
interface IDirectXVideoDecoderService : IDirectXVideoAccelerationService
{
    HRESULT GetDecoderDeviceGuids(uint*, GUID**);
    HRESULT GetDecoderRenderTargets(const(GUID)*, uint*, D3DFORMAT**);
    HRESULT GetDecoderConfigurations(const(GUID)*, const(DXVA2_VideoDesc)*, void*, uint*, DXVA2_ConfigPictureDecode**);
    HRESULT CreateVideoDecoder(const(GUID)*, const(DXVA2_VideoDesc)*, const(DXVA2_ConfigPictureDecode)*, IDirect3DSurface9*, uint, IDirectXVideoDecoder*);
}
enum IID_IDirectXVideoProcessorService = GUID(0xfc51a552, 0xd5e7, 0x11d9, [0xaf, 0x55, 0x0, 0x5, 0x4e, 0x43, 0xff, 0x2]);
interface IDirectXVideoProcessorService : IDirectXVideoAccelerationService
{
    HRESULT RegisterVideoProcessorSoftwareDevice(void*);
    HRESULT GetVideoProcessorDeviceGuids(const(DXVA2_VideoDesc)*, uint*, GUID**);
    HRESULT GetVideoProcessorRenderTargets(const(GUID)*, const(DXVA2_VideoDesc)*, uint*, D3DFORMAT**);
    HRESULT GetVideoProcessorSubStreamFormats(const(GUID)*, const(DXVA2_VideoDesc)*, D3DFORMAT, uint*, D3DFORMAT**);
    HRESULT GetVideoProcessorCaps(const(GUID)*, const(DXVA2_VideoDesc)*, D3DFORMAT, DXVA2_VideoProcessorCaps*);
    HRESULT GetProcAmpRange(const(GUID)*, const(DXVA2_VideoDesc)*, D3DFORMAT, uint, DXVA2_ValueRange*);
    HRESULT GetFilterPropertyRange(const(GUID)*, const(DXVA2_VideoDesc)*, D3DFORMAT, uint, DXVA2_ValueRange*);
    HRESULT CreateVideoProcessor(const(GUID)*, const(DXVA2_VideoDesc)*, D3DFORMAT, uint, IDirectXVideoProcessor*);
}
enum IID_IDirectXVideoDecoder = GUID(0xf2b0810a, 0xfd00, 0x43c9, [0x91, 0x8c, 0xdf, 0x94, 0xe2, 0xd8, 0xef, 0x7d]);
interface IDirectXVideoDecoder : IUnknown
{
    HRESULT GetVideoDecoderService(IDirectXVideoDecoderService*);
    HRESULT GetCreationParameters(GUID*, DXVA2_VideoDesc*, DXVA2_ConfigPictureDecode*, IDirect3DSurface9**, uint*);
    HRESULT GetBuffer(DXVA2_BufferfType, void**, uint*);
    HRESULT ReleaseBuffer(uint);
    HRESULT BeginFrame(IDirect3DSurface9, void*);
    HRESULT EndFrame(HANDLE*);
    HRESULT Execute(const(DXVA2_DecodeExecuteParams)*);
}
enum IID_IDirectXVideoProcessor = GUID(0x8c3a39f0, 0x916e, 0x4690, [0x80, 0x4f, 0x4c, 0x80, 0x1, 0x35, 0x5d, 0x25]);
interface IDirectXVideoProcessor : IUnknown
{
    HRESULT GetVideoProcessorService(IDirectXVideoProcessorService*);
    HRESULT GetCreationParameters(GUID*, DXVA2_VideoDesc*, D3DFORMAT*, uint*);
    HRESULT GetVideoProcessorCaps(DXVA2_VideoProcessorCaps*);
    HRESULT GetProcAmpRange(uint, DXVA2_ValueRange*);
    HRESULT GetFilterPropertyRange(uint, DXVA2_ValueRange*);
    HRESULT VideoProcessBlt(IDirect3DSurface9, const(DXVA2_VideoProcessBltParams)*, const(DXVA2_VideoSample)*, uint, HANDLE*);
}
alias DXVA2_SurfaceType = int;
enum : int
{
    DXVA2_SurfaceType_DecoderRenderTarget    = 0x00000000,
    DXVA2_SurfaceType_ProcessorRenderTarget  = 0x00000001,
    DXVA2_SurfaceType_D3DRenderTargetTexture = 0x00000002,
}

enum IID_IDirectXVideoMemoryConfiguration = GUID(0xb7f916dd, 0xdb3b, 0x49c1, [0x84, 0xd7, 0xe4, 0x5e, 0xf9, 0x9e, 0xc7, 0x26]);
interface IDirectXVideoMemoryConfiguration : IUnknown
{
    HRESULT GetAvailableSurfaceTypeByIndex(uint, DXVA2_SurfaceType*);
    HRESULT SetSurfaceType(DXVA2_SurfaceType);
}
alias OPM_TYPE = int;
enum : int
{
    OPM_OMAC_SIZE                                = 0x00000010,
    OPM_128_BIT_RANDOM_NUMBER_SIZE               = 0x00000010,
    OPM_ENCRYPTED_INITIALIZATION_PARAMETERS_SIZE = 0x00000100,
    OPM_CONFIGURE_SETTING_DATA_SIZE              = 0x00000fd8,
    OPM_GET_INFORMATION_PARAMETERS_SIZE          = 0x00000fd8,
    OPM_REQUESTED_INFORMATION_SIZE               = 0x00000fec,
    OPM_HDCP_KEY_SELECTION_VECTOR_SIZE           = 0x00000005,
    OPM_PROTECTION_TYPE_SIZE                     = 0x00000004,
    OPM_BUS_TYPE_MASK                            = 0x0000ffff,
    OPM_BUS_IMPLEMENTATION_MODIFIER_MASK         = 0x00007fff,
}

alias OPM_VIDEO_OUTPUT_SEMANTICS = int;
enum : int
{
    OPM_VOS_COPP_SEMANTICS       = 0x00000000,
    OPM_VOS_OPM_SEMANTICS        = 0x00000001,
    OPM_VOS_OPM_INDIRECT_DISPLAY = 0x00000002,
}

alias OPM_HDCP_FLAGS = uint;
enum : uint
{
    OPM_HDCP_FLAG_NONE     = 0x00000000,
    OPM_HDCP_FLAG_REPEATER = 0x00000001,
}

alias OPM_STATUS = int;
enum : int
{
    OPM_STATUS_NORMAL                       = 0x00000000,
    OPM_STATUS_LINK_LOST                    = 0x00000001,
    OPM_STATUS_RENEGOTIATION_REQUIRED       = 0x00000002,
    OPM_STATUS_TAMPERING_DETECTED           = 0x00000004,
    OPM_STATUS_REVOKED_HDCP_DEVICE_ATTACHED = 0x00000008,
}

alias OPM_CONNECTOR_TYPE = int;
enum : int
{
    OPM_CONNECTOR_TYPE_OTHER                             = 0xffffffff,
    OPM_CONNECTOR_TYPE_VGA                               = 0x00000000,
    OPM_CONNECTOR_TYPE_SVIDEO                            = 0x00000001,
    OPM_CONNECTOR_TYPE_COMPOSITE_VIDEO                   = 0x00000002,
    OPM_CONNECTOR_TYPE_COMPONENT_VIDEO                   = 0x00000003,
    OPM_CONNECTOR_TYPE_DVI                               = 0x00000004,
    OPM_CONNECTOR_TYPE_HDMI                              = 0x00000005,
    OPM_CONNECTOR_TYPE_LVDS                              = 0x00000006,
    OPM_CONNECTOR_TYPE_D_JPN                             = 0x00000008,
    OPM_CONNECTOR_TYPE_SDI                               = 0x00000009,
    OPM_CONNECTOR_TYPE_DISPLAYPORT_EXTERNAL              = 0x0000000a,
    OPM_CONNECTOR_TYPE_DISPLAYPORT_EMBEDDED              = 0x0000000b,
    OPM_CONNECTOR_TYPE_UDI_EXTERNAL                      = 0x0000000c,
    OPM_CONNECTOR_TYPE_UDI_EMBEDDED                      = 0x0000000d,
    OPM_CONNECTOR_TYPE_RESERVED                          = 0x0000000e,
    OPM_CONNECTOR_TYPE_MIRACAST                          = 0x0000000f,
    OPM_CONNECTOR_TYPE_TRANSPORT_AGNOSTIC_DIGITAL_MODE_A = 0x00000010,
    OPM_CONNECTOR_TYPE_TRANSPORT_AGNOSTIC_DIGITAL_MODE_B = 0x00000011,
    OPM_COPP_COMPATIBLE_CONNECTOR_TYPE_INTERNAL          = 0x80000000,
}

alias OPM_DVI_CHARACTERISTIC = int;
enum : int
{
    OPM_DVI_CHARACTERISTIC_1_0          = 0x00000001,
    OPM_DVI_CHARACTERISTIC_1_1_OR_ABOVE = 0x00000002,
}

alias OPM_OUTPUT_HARDWARE_PROTECTION = int;
enum : int
{
    OPM_OUTPUT_HARDWARE_PROTECTION_NOT_SUPPORTED = 0x00000000,
    OPM_OUTPUT_HARDWARE_PROTECTION_SUPPORTED     = 0x00000001,
}

alias OPM_BUS_TYPE = int;
enum : int
{
    OPM_BUS_TYPE_OTHER                                                      = 0x00000000,
    OPM_BUS_TYPE_PCI                                                        = 0x00000001,
    OPM_BUS_TYPE_PCIX                                                       = 0x00000002,
    OPM_BUS_TYPE_PCIEXPRESS                                                 = 0x00000003,
    OPM_BUS_TYPE_AGP                                                        = 0x00000004,
    OPM_BUS_IMPLEMENTATION_MODIFIER_INSIDE_OF_CHIPSET                       = 0x00010000,
    OPM_BUS_IMPLEMENTATION_MODIFIER_TRACKS_ON_MOTHER_BOARD_TO_CHIP          = 0x00020000,
    OPM_BUS_IMPLEMENTATION_MODIFIER_TRACKS_ON_MOTHER_BOARD_TO_SOCKET        = 0x00030000,
    OPM_BUS_IMPLEMENTATION_MODIFIER_DAUGHTER_BOARD_CONNECTOR                = 0x00040000,
    OPM_BUS_IMPLEMENTATION_MODIFIER_DAUGHTER_BOARD_CONNECTOR_INSIDE_OF_NUAE = 0x00050000,
    OPM_BUS_IMPLEMENTATION_MODIFIER_NON_STANDARD                            = 0x80000000,
    OPM_COPP_COMPATIBLE_BUS_TYPE_INTEGRATED                                 = 0x80000000,
}

alias OPM_DPCP_PROTECTION_LEVEL = int;
enum : int
{
    OPM_DPCP_OFF         = 0x00000000,
    OPM_DPCP_ON          = 0x00000001,
    OPM_DPCP_FORCE_ULONG = 0x7fffffff,
}

alias OPM_HDCP_PROTECTION_LEVEL = int;
enum : int
{
    OPM_HDCP_OFF         = 0x00000000,
    OPM_HDCP_ON          = 0x00000001,
    OPM_HDCP_FORCE_ULONG = 0x7fffffff,
}

alias OPM_TYPE_ENFORCEMENT_HDCP_PROTECTION_LEVEL = int;
enum : int
{
    OPM_TYPE_ENFORCEMENT_HDCP_OFF                         = 0x00000000,
    OPM_TYPE_ENFORCEMENT_HDCP_ON_WITH_NO_TYPE_RESTRICTION = 0x00000001,
    OPM_TYPE_ENFORCEMENT_HDCP_ON_WITH_TYPE1_RESTRICTION   = 0x00000002,
    OPM_TYPE_ENFORCEMENT_HDCP_FORCE_ULONG                 = 0x7fffffff,
}

alias OPM_CGMSA = int;
enum : int
{
    OPM_CGMSA_OFF                             = 0x00000000,
    OPM_CGMSA_COPY_FREELY                     = 0x00000001,
    OPM_CGMSA_COPY_NO_MORE                    = 0x00000002,
    OPM_CGMSA_COPY_ONE_GENERATION             = 0x00000003,
    OPM_CGMSA_COPY_NEVER                      = 0x00000004,
    OPM_CGMSA_REDISTRIBUTION_CONTROL_REQUIRED = 0x00000008,
}

alias OPM_ACP_PROTECTION_LEVEL = int;
enum : int
{
    OPM_ACP_OFF         = 0x00000000,
    OPM_ACP_LEVEL_ONE   = 0x00000001,
    OPM_ACP_LEVEL_TWO   = 0x00000002,
    OPM_ACP_LEVEL_THREE = 0x00000003,
    OPM_ACP_FORCE_ULONG = 0x7fffffff,
}

alias OPM_PROTECTION_TYPE = int;
enum : int
{
    OPM_PROTECTION_TYPE_OTHER                 = 0x80000000,
    OPM_PROTECTION_TYPE_NONE                  = 0x00000000,
    OPM_PROTECTION_TYPE_COPP_COMPATIBLE_HDCP  = 0x00000001,
    OPM_PROTECTION_TYPE_ACP                   = 0x00000002,
    OPM_PROTECTION_TYPE_CGMSA                 = 0x00000004,
    OPM_PROTECTION_TYPE_HDCP                  = 0x00000008,
    OPM_PROTECTION_TYPE_DPCP                  = 0x00000010,
    OPM_PROTECTION_TYPE_TYPE_ENFORCEMENT_HDCP = 0x00000020,
}

alias OPM_PROTECTION_STANDARD_TYPE = uint;
enum : uint
{
    OPM_PROTECTION_STANDARD_OTHER               = 0x80000000,
    OPM_PROTECTION_STANDARD_NONE                = 0x00000000,
    OPM_PROTECTION_STANDARD_IEC61880_525I       = 0x00000001,
    OPM_PROTECTION_STANDARD_IEC61880_2_525I     = 0x00000002,
    OPM_PROTECTION_STANDARD_IEC62375_625P       = 0x00000004,
    OPM_PROTECTION_STANDARD_EIA608B_525         = 0x00000008,
    OPM_PROTECTION_STANDARD_EN300294_625I       = 0x00000010,
    OPM_PROTECTION_STANDARD_CEA805A_TYPEA_525P  = 0x00000020,
    OPM_PROTECTION_STANDARD_CEA805A_TYPEA_750P  = 0x00000040,
    OPM_PROTECTION_STANDARD_CEA805A_TYPEA_1125I = 0x00000080,
    OPM_PROTECTION_STANDARD_CEA805A_TYPEB_525P  = 0x00000100,
    OPM_PROTECTION_STANDARD_CEA805A_TYPEB_750P  = 0x00000200,
    OPM_PROTECTION_STANDARD_CEA805A_TYPEB_1125I = 0x00000400,
    OPM_PROTECTION_STANDARD_ARIBTRB15_525I      = 0x00000800,
    OPM_PROTECTION_STANDARD_ARIBTRB15_525P      = 0x00001000,
    OPM_PROTECTION_STANDARD_ARIBTRB15_750P      = 0x00002000,
    OPM_PROTECTION_STANDARD_ARIBTRB15_1125I     = 0x00004000,
}

alias OPM_IMAGE_ASPECT_RATIO_EN300294 = int;
enum : int
{
    OPM_ASPECT_RATIO_EN300294_FULL_FORMAT_4_BY_3                  = 0x00000000,
    OPM_ASPECT_RATIO_EN300294_BOX_14_BY_9_CENTER                  = 0x00000001,
    OPM_ASPECT_RATIO_EN300294_BOX_14_BY_9_TOP                     = 0x00000002,
    OPM_ASPECT_RATIO_EN300294_BOX_16_BY_9_CENTER                  = 0x00000003,
    OPM_ASPECT_RATIO_EN300294_BOX_16_BY_9_TOP                     = 0x00000004,
    OPM_ASPECT_RATIO_EN300294_BOX_GT_16_BY_9_CENTER               = 0x00000005,
    OPM_ASPECT_RATIO_EN300294_FULL_FORMAT_4_BY_3_PROTECTED_CENTER = 0x00000006,
    OPM_ASPECT_RATIO_EN300294_FULL_FORMAT_16_BY_9_ANAMORPHIC      = 0x00000007,
    OPM_ASPECT_RATIO_FORCE_ULONG                                  = 0x7fffffff,
}

struct OPM_RANDOM_NUMBER
{
    ubyte[16] abRandomNumber;
}
struct OPM_OMAC
{
    ubyte[16] abOMAC;
}
struct OPM_ENCRYPTED_INITIALIZATION_PARAMETERS
{
    ubyte[256] abEncryptedInitializationParameters;
}
struct OPM_GET_INFO_PARAMETERS
{
    align (1):
    OPM_OMAC omac;
    OPM_RANDOM_NUMBER rnRandomNumber;
    GUID guidInformation;
    uint ulSequenceNumber;
    uint cbParametersSize;
    ubyte[4056] abParameters;
}
struct OPM_COPP_COMPATIBLE_GET_INFO_PARAMETERS
{
    align (1):
    OPM_RANDOM_NUMBER rnRandomNumber;
    GUID guidInformation;
    uint ulSequenceNumber;
    uint cbParametersSize;
    ubyte[4056] abParameters;
}
struct OPM_HDCP_KEY_SELECTION_VECTOR
{
    ubyte[5] abKeySelectionVector;
}
struct OPM_CONNECTED_HDCP_DEVICE_INFORMATION
{
    align (1):
    OPM_RANDOM_NUMBER rnRandomNumber;
    uint ulStatusFlags;
    uint ulHDCPFlags;
    OPM_HDCP_KEY_SELECTION_VECTOR ksvB;
    ubyte[11] Reserved;
    ubyte[16] Reserved2;
    ubyte[16] Reserved3;
}
struct OPM_REQUESTED_INFORMATION
{
    align (1):
    OPM_OMAC omac;
    uint cbRequestedInformationSize;
    ubyte[4076] abRequestedInformation;
}
struct OPM_STANDARD_INFORMATION
{
    align (1):
    OPM_RANDOM_NUMBER rnRandomNumber;
    uint ulStatusFlags;
    uint ulInformation;
    uint ulReserved;
    uint ulReserved2;
}
struct OPM_ACTUAL_OUTPUT_FORMAT
{
    align (1):
    OPM_RANDOM_NUMBER rnRandomNumber;
    uint ulStatusFlags;
    uint ulDisplayWidth;
    uint ulDisplayHeight;
    DXVA2_SampleFormat dsfSampleInterleaveFormat;
    D3DFORMAT d3dFormat;
    uint ulFrequencyNumerator;
    uint ulFrequencyDenominator;
}
struct OPM_ACP_AND_CGMSA_SIGNALING
{
    align (1):
    OPM_RANDOM_NUMBER rnRandomNumber;
    uint ulStatusFlags;
    uint ulAvailableTVProtectionStandards;
    uint ulActiveTVProtectionStandard;
    uint ulReserved;
    uint ulAspectRatioValidMask1;
    uint ulAspectRatioData1;
    uint ulAspectRatioValidMask2;
    uint ulAspectRatioData2;
    uint ulAspectRatioValidMask3;
    uint ulAspectRatioData3;
    uint[4] ulReserved2;
    uint[4] ulReserved3;
}
struct OPM_OUTPUT_ID_DATA
{
    align (1):
    OPM_RANDOM_NUMBER rnRandomNumber;
    uint ulStatusFlags;
    ulong OutputId;
}
struct OPM_CONFIGURE_PARAMETERS
{
    align (1):
    OPM_OMAC omac;
    GUID guidSetting;
    uint ulSequenceNumber;
    uint cbParametersSize;
    ubyte[4056] abParameters;
}
struct OPM_SET_PROTECTION_LEVEL_PARAMETERS
{
    align (1):
    uint ulProtectionType;
    uint ulProtectionLevel;
    uint Reserved;
    uint Reserved2;
}
struct OPM_SET_ACP_AND_CGMSA_SIGNALING_PARAMETERS
{
    align (1):
    uint ulNewTVProtectionStandard;
    uint ulAspectRatioChangeMask1;
    uint ulAspectRatioData1;
    uint ulAspectRatioChangeMask2;
    uint ulAspectRatioData2;
    uint ulAspectRatioChangeMask3;
    uint ulAspectRatioData3;
    uint[4] ulReserved;
    uint[4] ulReserved2;
    uint ulReserved3;
}
struct OPM_SET_HDCP_SRM_PARAMETERS
{
    align (1):
    uint ulSRMVersion;
}
struct OPM_GET_CODEC_INFO_PARAMETERS
{
    align (1):
    uint cbVerifier;
    ubyte[4052] Verifier;
}
struct OPM_GET_CODEC_INFO_INFORMATION
{
    align (1):
    OPM_RANDOM_NUMBER rnRandomNumber;
    uint Merit;
}
enum IID_IOPMVideoOutput = GUID(0xa15159d, 0x41c7, 0x4456, [0x93, 0xe1, 0x28, 0x4c, 0xd6, 0x1d, 0x4e, 0x8d]);
interface IOPMVideoOutput : IUnknown
{
    HRESULT StartInitialization(OPM_RANDOM_NUMBER*, ubyte**, uint*);
    HRESULT FinishInitialization(const(OPM_ENCRYPTED_INITIALIZATION_PARAMETERS)*);
    HRESULT GetInformation(const(OPM_GET_INFO_PARAMETERS)*, OPM_REQUESTED_INFORMATION*);
    HRESULT COPPCompatibleGetInformation(const(OPM_COPP_COMPATIBLE_GET_INFO_PARAMETERS)*, OPM_REQUESTED_INFORMATION*);
    HRESULT Configure(const(OPM_CONFIGURE_PARAMETERS)*, uint, const(ubyte)*);
}
enum CLSID_KSPROPSETID_OPMVideoOutput = GUID(0x6f414bb, 0xf43a, 0x4fe2, [0xa5, 0x66, 0x77, 0x4b, 0x4c, 0x81, 0xf0, 0xdb]);
struct KSPROPSETID_OPMVideoOutput
{
}
alias KSMETHOD_OPMVIDEOOUTPUT = int;
enum : int
{
    KSMETHOD_OPMVIDEOOUTPUT_STARTINITIALIZATION  = 0x00000000,
    KSMETHOD_OPMVIDEOOUTPUT_FINISHINITIALIZATION = 0x00000001,
    KSMETHOD_OPMVIDEOOUTPUT_GETINFORMATION       = 0x00000002,
}

alias MF_ATTRIBUTE_TYPE = int;
enum : int
{
    MF_ATTRIBUTE_UINT32   = 0x00000013,
    MF_ATTRIBUTE_UINT64   = 0x00000015,
    MF_ATTRIBUTE_DOUBLE   = 0x00000005,
    MF_ATTRIBUTE_GUID     = 0x00000048,
    MF_ATTRIBUTE_STRING   = 0x0000001f,
    MF_ATTRIBUTE_BLOB     = 0x00001011,
    MF_ATTRIBUTE_IUNKNOWN = 0x0000000d,
}

alias MF_ATTRIBUTES_MATCH_TYPE = int;
enum : int
{
    MF_ATTRIBUTES_MATCH_OUR_ITEMS    = 0x00000000,
    MF_ATTRIBUTES_MATCH_THEIR_ITEMS  = 0x00000001,
    MF_ATTRIBUTES_MATCH_ALL_ITEMS    = 0x00000002,
    MF_ATTRIBUTES_MATCH_INTERSECTION = 0x00000003,
    MF_ATTRIBUTES_MATCH_SMALLER      = 0x00000004,
}

enum IID_IMFAttributes = GUID(0x2cd2d921, 0xc447, 0x44a7, [0xa1, 0x3c, 0x4a, 0xda, 0xbf, 0xc2, 0x47, 0xe3]);
interface IMFAttributes : IUnknown
{
    HRESULT GetItem(const(GUID)*, PROPVARIANT*);
    HRESULT GetItemType(const(GUID)*, MF_ATTRIBUTE_TYPE*);
    HRESULT CompareItem(const(GUID)*, const(PROPVARIANT)*, BOOL*);
    HRESULT Compare(IMFAttributes, MF_ATTRIBUTES_MATCH_TYPE, BOOL*);
    HRESULT GetUINT32(const(GUID)*, uint*);
    HRESULT GetUINT64(const(GUID)*, ulong*);
    HRESULT GetDouble(const(GUID)*, double*);
    HRESULT GetGUID(const(GUID)*, GUID*);
    HRESULT GetStringLength(const(GUID)*, uint*);
    HRESULT GetString(const(GUID)*, PWSTR, uint, uint*);
    HRESULT GetAllocatedString(const(GUID)*, PWSTR*, uint*);
    HRESULT GetBlobSize(const(GUID)*, uint*);
    HRESULT GetBlob(const(GUID)*, ubyte*, uint, uint*);
    HRESULT GetAllocatedBlob(const(GUID)*, ubyte**, uint*);
    HRESULT GetUnknown(const(GUID)*, const(GUID)*, void**);
    HRESULT SetItem(const(GUID)*, const(PROPVARIANT)*);
    HRESULT DeleteItem(const(GUID)*);
    HRESULT DeleteAllItems();
    HRESULT SetUINT32(const(GUID)*, uint);
    HRESULT SetUINT64(const(GUID)*, ulong);
    HRESULT SetDouble(const(GUID)*, double);
    HRESULT SetGUID(const(GUID)*, const(GUID)*);
    HRESULT SetString(const(GUID)*, const(wchar)*);
    HRESULT SetBlob(const(GUID)*, const(ubyte)*, uint);
    HRESULT SetUnknown(const(GUID)*, IUnknown);
    HRESULT LockStore();
    HRESULT UnlockStore();
    HRESULT GetCount(uint*);
    HRESULT GetItemByIndex(uint, GUID*, PROPVARIANT*);
    HRESULT CopyAllItems(IMFAttributes);
}
alias MF_ATTRIBUTE_SERIALIZE_OPTIONS = int;
enum : int
{
    MF_ATTRIBUTE_SERIALIZE_UNKNOWN_BYREF = 0x00000001,
}

enum IID_IMFMediaBuffer = GUID(0x45fa593, 0x8799, 0x42b8, [0xbc, 0x8d, 0x89, 0x68, 0xc6, 0x45, 0x35, 0x7]);
interface IMFMediaBuffer : IUnknown
{
    HRESULT Lock(ubyte**, uint*, uint*);
    HRESULT Unlock();
    HRESULT GetCurrentLength(uint*);
    HRESULT SetCurrentLength(uint);
    HRESULT GetMaxLength(uint*);
}
enum IID_IMFSample = GUID(0xc40a00f2, 0xb93a, 0x4d80, [0xae, 0x8c, 0x5a, 0x1c, 0x63, 0x4f, 0x58, 0xe4]);
interface IMFSample : IMFAttributes
{
    HRESULT GetSampleFlags(uint*);
    HRESULT SetSampleFlags(uint);
    HRESULT GetSampleTime(long*);
    HRESULT SetSampleTime(long);
    HRESULT GetSampleDuration(long*);
    HRESULT SetSampleDuration(long);
    HRESULT GetBufferCount(uint*);
    HRESULT GetBufferByIndex(uint, IMFMediaBuffer*);
    HRESULT ConvertToContiguousBuffer(IMFMediaBuffer*);
    HRESULT AddBuffer(IMFMediaBuffer);
    HRESULT RemoveBufferByIndex(uint);
    HRESULT RemoveAllBuffers();
    HRESULT GetTotalLength(uint*);
    HRESULT CopyToBuffer(IMFMediaBuffer);
}
enum IID_IMF2DBuffer = GUID(0x7dc9d5f9, 0x9ed9, 0x44ec, [0x9b, 0xbf, 0x6, 0x0, 0xbb, 0x58, 0x9f, 0xbb]);
interface IMF2DBuffer : IUnknown
{
    HRESULT Lock2D(ubyte**, int*);
    HRESULT Unlock2D();
    HRESULT GetScanline0AndPitch(ubyte**, int*);
    HRESULT IsContiguousFormat(BOOL*);
    HRESULT GetContiguousLength(uint*);
    HRESULT ContiguousCopyTo(ubyte*, uint);
    HRESULT ContiguousCopyFrom(const(ubyte)*, uint);
}
alias MF2DBuffer_LockFlags = int;
enum : int
{
    MF2DBuffer_LockFlags_LockTypeMask = 0x00000003,
    MF2DBuffer_LockFlags_Read         = 0x00000001,
    MF2DBuffer_LockFlags_Write        = 0x00000002,
    MF2DBuffer_LockFlags_ReadWrite    = 0x00000003,
    MF2DBuffer_LockFlags_ForceDWORD   = 0x7fffffff,
}

enum IID_IMF2DBuffer2 = GUID(0x33ae5ea6, 0x4316, 0x436f, [0x8d, 0xdd, 0xd7, 0x3d, 0x22, 0xf8, 0x29, 0xec]);
interface IMF2DBuffer2 : IMF2DBuffer
{
    HRESULT Lock2DSize(MF2DBuffer_LockFlags, ubyte**, int*, ubyte**, uint*);
    HRESULT Copy2DTo(IMF2DBuffer2);
}
enum IID_IMFDXGIBuffer = GUID(0xe7174cfa, 0x1c9e, 0x48b1, [0x88, 0x66, 0x62, 0x62, 0x26, 0xbf, 0xc2, 0x58]);
interface IMFDXGIBuffer : IUnknown
{
    HRESULT GetResource(const(GUID)*, void**);
    HRESULT GetSubresourceIndex(uint*);
    HRESULT GetUnknown(const(GUID)*, const(GUID)*, void**);
    HRESULT SetUnknown(const(GUID)*, IUnknown);
}
enum IID_IMFMediaType = GUID(0x44ae0fa8, 0xea31, 0x4109, [0x8d, 0x2e, 0x4c, 0xae, 0x49, 0x97, 0xc5, 0x55]);
interface IMFMediaType : IMFAttributes
{
    HRESULT GetMajorType(GUID*);
    HRESULT IsCompressedFormat(BOOL*);
    HRESULT IsEqual(IMFMediaType, uint*);
    HRESULT GetRepresentation(GUID, void**);
    HRESULT FreeRepresentation(GUID, void*);
}
enum IID_IMFAudioMediaType = GUID(0x26a0adc3, 0xce26, 0x4672, [0x93, 0x4, 0x69, 0x55, 0x2e, 0xdd, 0x3f, 0xaf]);
interface IMFAudioMediaType : IMFMediaType
{
    WAVEFORMATEX* GetAudioFormat();
}
struct MFT_REGISTER_TYPE_INFO
{
    GUID guidMajorType;
    GUID guidSubtype;
}
alias MFVideoInterlaceMode = int;
enum : int
{
    MFVideoInterlace_Unknown                     = 0x00000000,
    MFVideoInterlace_Progressive                 = 0x00000002,
    MFVideoInterlace_FieldInterleavedUpperFirst  = 0x00000003,
    MFVideoInterlace_FieldInterleavedLowerFirst  = 0x00000004,
    MFVideoInterlace_FieldSingleUpper            = 0x00000005,
    MFVideoInterlace_FieldSingleLower            = 0x00000006,
    MFVideoInterlace_MixedInterlaceOrProgressive = 0x00000007,
    MFVideoInterlace_Last                        = 0x00000008,
    MFVideoInterlace_ForceDWORD                  = 0x7fffffff,
}

alias MFVideoTransferFunction = int;
enum : int
{
    MFVideoTransFunc_Unknown    = 0x00000000,
    MFVideoTransFunc_10         = 0x00000001,
    MFVideoTransFunc_18         = 0x00000002,
    MFVideoTransFunc_20         = 0x00000003,
    MFVideoTransFunc_22         = 0x00000004,
    MFVideoTransFunc_709        = 0x00000005,
    MFVideoTransFunc_240M       = 0x00000006,
    MFVideoTransFunc_sRGB       = 0x00000007,
    MFVideoTransFunc_28         = 0x00000008,
    MFVideoTransFunc_Log_100    = 0x00000009,
    MFVideoTransFunc_Log_316    = 0x0000000a,
    MFVideoTransFunc_709_sym    = 0x0000000b,
    MFVideoTransFunc_2020_const = 0x0000000c,
    MFVideoTransFunc_2020       = 0x0000000d,
    MFVideoTransFunc_26         = 0x0000000e,
    MFVideoTransFunc_2084       = 0x0000000f,
    MFVideoTransFunc_HLG        = 0x00000010,
    MFVideoTransFunc_10_rel     = 0x00000011,
    MFVideoTransFunc_Last       = 0x00000012,
    MFVideoTransFunc_ForceDWORD = 0x7fffffff,
}

alias MFVideoPrimaries = int;
enum : int
{
    MFVideoPrimaries_Unknown       = 0x00000000,
    MFVideoPrimaries_reserved      = 0x00000001,
    MFVideoPrimaries_BT709         = 0x00000002,
    MFVideoPrimaries_BT470_2_SysM  = 0x00000003,
    MFVideoPrimaries_BT470_2_SysBG = 0x00000004,
    MFVideoPrimaries_SMPTE170M     = 0x00000005,
    MFVideoPrimaries_SMPTE240M     = 0x00000006,
    MFVideoPrimaries_EBU3213       = 0x00000007,
    MFVideoPrimaries_SMPTE_C       = 0x00000008,
    MFVideoPrimaries_BT2020        = 0x00000009,
    MFVideoPrimaries_XYZ           = 0x0000000a,
    MFVideoPrimaries_DCI_P3        = 0x0000000b,
    MFVideoPrimaries_ACES          = 0x0000000c,
    MFVideoPrimaries_Last          = 0x0000000d,
    MFVideoPrimaries_ForceDWORD    = 0x7fffffff,
}

alias MFVideoLighting = int;
enum : int
{
    MFVideoLighting_Unknown    = 0x00000000,
    MFVideoLighting_bright     = 0x00000001,
    MFVideoLighting_office     = 0x00000002,
    MFVideoLighting_dim        = 0x00000003,
    MFVideoLighting_dark       = 0x00000004,
    MFVideoLighting_Last       = 0x00000005,
    MFVideoLighting_ForceDWORD = 0x7fffffff,
}

alias MFVideoTransferMatrix = int;
enum : int
{
    MFVideoTransferMatrix_Unknown    = 0x00000000,
    MFVideoTransferMatrix_BT709      = 0x00000001,
    MFVideoTransferMatrix_BT601      = 0x00000002,
    MFVideoTransferMatrix_SMPTE240M  = 0x00000003,
    MFVideoTransferMatrix_BT2020_10  = 0x00000004,
    MFVideoTransferMatrix_BT2020_12  = 0x00000005,
    MFVideoTransferMatrix_Last       = 0x00000006,
    MFVideoTransferMatrix_ForceDWORD = 0x7fffffff,
}

alias MFVideoChromaSubsampling = int;
enum : int
{
    MFVideoChromaSubsampling_Unknown                        = 0x00000000,
    MFVideoChromaSubsampling_ProgressiveChroma              = 0x00000008,
    MFVideoChromaSubsampling_Horizontally_Cosited           = 0x00000004,
    MFVideoChromaSubsampling_Vertically_Cosited             = 0x00000002,
    MFVideoChromaSubsampling_Vertically_AlignedChromaPlanes = 0x00000001,
    MFVideoChromaSubsampling_MPEG2                          = 0x00000005,
    MFVideoChromaSubsampling_MPEG1                          = 0x00000001,
    MFVideoChromaSubsampling_DV_PAL                         = 0x00000006,
    MFVideoChromaSubsampling_Cosited                        = 0x00000007,
    MFVideoChromaSubsampling_Last                           = 0x00000008,
    MFVideoChromaSubsampling_ForceDWORD                     = 0x7fffffff,
}

alias MFNominalRange = int;
enum : int
{
    MFNominalRange_Unknown    = 0x00000000,
    MFNominalRange_Normal     = 0x00000001,
    MFNominalRange_Wide       = 0x00000002,
    MFNominalRange_0_255      = 0x00000001,
    MFNominalRange_16_235     = 0x00000002,
    MFNominalRange_48_208     = 0x00000003,
    MFNominalRange_64_127     = 0x00000004,
    MFNominalRange_Last       = 0x00000005,
    MFNominalRange_ForceDWORD = 0x7fffffff,
}

alias MFVideoFlags = int;
enum : int
{
    MFVideoFlag_PAD_TO_Mask           = 0x00000003,
    MFVideoFlag_PAD_TO_None           = 0x00000000,
    MFVideoFlag_PAD_TO_4x3            = 0x00000001,
    MFVideoFlag_PAD_TO_16x9           = 0x00000002,
    MFVideoFlag_SrcContentHintMask    = 0x0000001c,
    MFVideoFlag_SrcContentHintNone    = 0x00000000,
    MFVideoFlag_SrcContentHint16x9    = 0x00000004,
    MFVideoFlag_SrcContentHint235_1   = 0x00000008,
    MFVideoFlag_AnalogProtected       = 0x00000020,
    MFVideoFlag_DigitallyProtected    = 0x00000040,
    MFVideoFlag_ProgressiveContent    = 0x00000080,
    MFVideoFlag_FieldRepeatCountMask  = 0x00000700,
    MFVideoFlag_FieldRepeatCountShift = 0x00000008,
    MFVideoFlag_ProgressiveSeqReset   = 0x00000800,
    MFVideoFlag_PanScanEnabled        = 0x00020000,
    MFVideoFlag_LowerFieldFirst       = 0x00040000,
    MFVideoFlag_BottomUpLinearRep     = 0x00080000,
    MFVideoFlags_DXVASurface          = 0x00100000,
    MFVideoFlags_RenderTargetSurface  = 0x00400000,
    MFVideoFlags_ForceQWORD           = 0x7fffffff,
}

struct MFRatio
{
    uint Numerator;
    uint Denominator;
}
struct MFOffset
{
    ushort fract;
    short value;
}
struct MFVideoArea
{
    MFOffset OffsetX;
    MFOffset OffsetY;
    SIZE Area;
}
struct MFVideoInfo
{
    uint dwWidth;
    uint dwHeight;
    MFRatio PixelAspectRatio;
    MFVideoChromaSubsampling SourceChromaSubsampling;
    MFVideoInterlaceMode InterlaceMode;
    MFVideoTransferFunction TransferFunction;
    MFVideoPrimaries ColorPrimaries;
    MFVideoTransferMatrix TransferMatrix;
    MFVideoLighting SourceLighting;
    MFRatio FramesPerSecond;
    MFNominalRange NominalRange;
    MFVideoArea GeometricAperture;
    MFVideoArea MinimumDisplayAperture;
    MFVideoArea PanScanAperture;
    ulong VideoFlags;
}
struct MFAYUVSample
{
    ubyte bCrValue;
    ubyte bCbValue;
    ubyte bYValue;
    ubyte bSampleAlpha8;
}
struct MFARGB
{
    ubyte rgbBlue;
    ubyte rgbGreen;
    ubyte rgbRed;
    ubyte rgbAlpha;
}
union MFPaletteEntry
{
    MFARGB ARGB;
    MFAYUVSample AYCbCr;
}
struct MFVideoSurfaceInfo
{
    uint Format;
    uint PaletteEntries;
    MFPaletteEntry[1] Palette;
}
struct MFVideoCompressedInfo
{
    long AvgBitrate;
    long AvgBitErrorRate;
    uint MaxKeyFrameSpacing;
}
struct MFVIDEOFORMAT
{
    uint dwSize;
    MFVideoInfo videoInfo;
    GUID guidFormat;
    MFVideoCompressedInfo compressedInfo;
    MFVideoSurfaceInfo surfaceInfo;
}
alias MFStandardVideoFormat = int;
enum : int
{
    MFStdVideoFormat_reserved     = 0x00000000,
    MFStdVideoFormat_NTSC         = 0x00000001,
    MFStdVideoFormat_PAL          = 0x00000002,
    MFStdVideoFormat_DVD_NTSC     = 0x00000003,
    MFStdVideoFormat_DVD_PAL      = 0x00000004,
    MFStdVideoFormat_DV_PAL       = 0x00000005,
    MFStdVideoFormat_DV_NTSC      = 0x00000006,
    MFStdVideoFormat_ATSC_SD480i  = 0x00000007,
    MFStdVideoFormat_ATSC_HD1080i = 0x00000008,
    MFStdVideoFormat_ATSC_HD720p  = 0x00000009,
}

enum IID_IMFVideoMediaType = GUID(0xb99f381f, 0xa8f9, 0x47a2, [0xa5, 0xaf, 0xca, 0x3a, 0x22, 0x5a, 0x38, 0x90]);
interface IMFVideoMediaType : IMFMediaType
{
    MFVIDEOFORMAT* GetVideoFormat();
    HRESULT GetVideoRepresentation(GUID, void**, int);
}
enum IID_IMFAsyncResult = GUID(0xac6b7889, 0x740, 0x4d51, [0x86, 0x19, 0x90, 0x59, 0x94, 0xa5, 0x5c, 0xc6]);
interface IMFAsyncResult : IUnknown
{
    HRESULT GetState(IUnknown*);
    HRESULT GetStatus();
    HRESULT SetStatus(HRESULT);
    HRESULT GetObject(IUnknown*);
    IUnknown GetStateNoAddRef();
}
enum IID_IMFAsyncCallback = GUID(0xa27003cf, 0x2354, 0x4f2a, [0x8d, 0x6a, 0xab, 0x7c, 0xff, 0x15, 0x43, 0x7e]);
interface IMFAsyncCallback : IUnknown
{
    HRESULT GetParameters(uint*, uint*);
    HRESULT Invoke(IMFAsyncResult);
}
enum IID_IMFAsyncCallbackLogging = GUID(0xc7a4dca1, 0xf5f0, 0x47b6, [0xb9, 0x2b, 0xbf, 0x1, 0x6, 0xd2, 0x57, 0x91]);
interface IMFAsyncCallbackLogging : IMFAsyncCallback
{
    void* GetObjectPointer();
    uint GetObjectTag();
}
alias MF_EVENT_TYPE = int;
enum : int
{
    MEUnknown                                  = 0x00000000,
    MEError                                    = 0x00000001,
    MEExtendedType                             = 0x00000002,
    MENonFatalError                            = 0x00000003,
    MEGenericV1Anchor                          = 0x00000003,
    MESessionUnknown                           = 0x00000064,
    MESessionTopologySet                       = 0x00000065,
    MESessionTopologiesCleared                 = 0x00000066,
    MESessionStarted                           = 0x00000067,
    MESessionPaused                            = 0x00000068,
    MESessionStopped                           = 0x00000069,
    MESessionClosed                            = 0x0000006a,
    MESessionEnded                             = 0x0000006b,
    MESessionRateChanged                       = 0x0000006c,
    MESessionScrubSampleComplete               = 0x0000006d,
    MESessionCapabilitiesChanged               = 0x0000006e,
    MESessionTopologyStatus                    = 0x0000006f,
    MESessionNotifyPresentationTime            = 0x00000070,
    MENewPresentation                          = 0x00000071,
    MELicenseAcquisitionStart                  = 0x00000072,
    MELicenseAcquisitionCompleted              = 0x00000073,
    MEIndividualizationStart                   = 0x00000074,
    MEIndividualizationCompleted               = 0x00000075,
    MEEnablerProgress                          = 0x00000076,
    MEEnablerCompleted                         = 0x00000077,
    MEPolicyError                              = 0x00000078,
    MEPolicyReport                             = 0x00000079,
    MEBufferingStarted                         = 0x0000007a,
    MEBufferingStopped                         = 0x0000007b,
    MEConnectStart                             = 0x0000007c,
    MEConnectEnd                               = 0x0000007d,
    MEReconnectStart                           = 0x0000007e,
    MEReconnectEnd                             = 0x0000007f,
    MERendererEvent                            = 0x00000080,
    MESessionStreamSinkFormatChanged           = 0x00000081,
    MESessionV1Anchor                          = 0x00000081,
    MESourceUnknown                            = 0x000000c8,
    MESourceStarted                            = 0x000000c9,
    MEStreamStarted                            = 0x000000ca,
    MESourceSeeked                             = 0x000000cb,
    MEStreamSeeked                             = 0x000000cc,
    MENewStream                                = 0x000000cd,
    MEUpdatedStream                            = 0x000000ce,
    MESourceStopped                            = 0x000000cf,
    MEStreamStopped                            = 0x000000d0,
    MESourcePaused                             = 0x000000d1,
    MEStreamPaused                             = 0x000000d2,
    MEEndOfPresentation                        = 0x000000d3,
    MEEndOfStream                              = 0x000000d4,
    MEMediaSample                              = 0x000000d5,
    MEStreamTick                               = 0x000000d6,
    MEStreamThinMode                           = 0x000000d7,
    MEStreamFormatChanged                      = 0x000000d8,
    MESourceRateChanged                        = 0x000000d9,
    MEEndOfPresentationSegment                 = 0x000000da,
    MESourceCharacteristicsChanged             = 0x000000db,
    MESourceRateChangeRequested                = 0x000000dc,
    MESourceMetadataChanged                    = 0x000000dd,
    MESequencerSourceTopologyUpdated           = 0x000000de,
    MESourceV1Anchor                           = 0x000000de,
    MESinkUnknown                              = 0x0000012c,
    MEStreamSinkStarted                        = 0x0000012d,
    MEStreamSinkStopped                        = 0x0000012e,
    MEStreamSinkPaused                         = 0x0000012f,
    MEStreamSinkRateChanged                    = 0x00000130,
    MEStreamSinkRequestSample                  = 0x00000131,
    MEStreamSinkMarker                         = 0x00000132,
    MEStreamSinkPrerolled                      = 0x00000133,
    MEStreamSinkScrubSampleComplete            = 0x00000134,
    MEStreamSinkFormatChanged                  = 0x00000135,
    MEStreamSinkDeviceChanged                  = 0x00000136,
    MEQualityNotify                            = 0x00000137,
    MESinkInvalidated                          = 0x00000138,
    MEAudioSessionNameChanged                  = 0x00000139,
    MEAudioSessionVolumeChanged                = 0x0000013a,
    MEAudioSessionDeviceRemoved                = 0x0000013b,
    MEAudioSessionServerShutdown               = 0x0000013c,
    MEAudioSessionGroupingParamChanged         = 0x0000013d,
    MEAudioSessionIconChanged                  = 0x0000013e,
    MEAudioSessionFormatChanged                = 0x0000013f,
    MEAudioSessionDisconnected                 = 0x00000140,
    MEAudioSessionExclusiveModeOverride        = 0x00000141,
    MESinkV1Anchor                             = 0x00000141,
    MECaptureAudioSessionVolumeChanged         = 0x00000142,
    MECaptureAudioSessionDeviceRemoved         = 0x00000143,
    MECaptureAudioSessionFormatChanged         = 0x00000144,
    MECaptureAudioSessionDisconnected          = 0x00000145,
    MECaptureAudioSessionExclusiveModeOverride = 0x00000146,
    MECaptureAudioSessionServerShutdown        = 0x00000147,
    MESinkV2Anchor                             = 0x00000147,
    METrustUnknown                             = 0x00000190,
    MEPolicyChanged                            = 0x00000191,
    MEContentProtectionMessage                 = 0x00000192,
    MEPolicySet                                = 0x00000193,
    METrustV1Anchor                            = 0x00000193,
    MEWMDRMLicenseBackupCompleted              = 0x000001f4,
    MEWMDRMLicenseBackupProgress               = 0x000001f5,
    MEWMDRMLicenseRestoreCompleted             = 0x000001f6,
    MEWMDRMLicenseRestoreProgress              = 0x000001f7,
    MEWMDRMLicenseAcquisitionCompleted         = 0x000001fa,
    MEWMDRMIndividualizationCompleted          = 0x000001fc,
    MEWMDRMIndividualizationProgress           = 0x00000201,
    MEWMDRMProximityCompleted                  = 0x00000202,
    MEWMDRMLicenseStoreCleaned                 = 0x00000203,
    MEWMDRMRevocationDownloadCompleted         = 0x00000204,
    MEWMDRMV1Anchor                            = 0x00000204,
    METransformUnknown                         = 0x00000258,
    METransformNeedInput                       = 0x00000259,
    METransformHaveOutput                      = 0x0000025a,
    METransformDrainComplete                   = 0x0000025b,
    METransformMarker                          = 0x0000025c,
    METransformInputStreamStateChanged         = 0x0000025d,
    MEByteStreamCharacteristicsChanged         = 0x000002bc,
    MEVideoCaptureDeviceRemoved                = 0x00000320,
    MEVideoCaptureDevicePreempted              = 0x00000321,
    MEStreamSinkFormatInvalidated              = 0x00000322,
    MEEncodingParameters                       = 0x00000323,
    MEContentProtectionMetadata                = 0x00000384,
    MEDeviceThermalStateChanged                = 0x000003b6,
    MEReservedMax                              = 0x00002710,
}

enum IID_IMFMediaEvent = GUID(0xdf598932, 0xf10c, 0x4e39, [0xbb, 0xa2, 0xc3, 0x8, 0xf1, 0x1, 0xda, 0xa3]);
interface IMFMediaEvent : IMFAttributes
{
    HRESULT GetType(uint*);
    HRESULT GetExtendedType(GUID*);
    HRESULT GetStatus(HRESULT*);
    HRESULT GetValue(PROPVARIANT*);
}
enum IID_IMFMediaEventGenerator = GUID(0x2cd0bd52, 0xbcd5, 0x4b89, [0xb6, 0x2c, 0xea, 0xdc, 0xc, 0x3, 0x1e, 0x7d]);
interface IMFMediaEventGenerator : IUnknown
{
    HRESULT GetEvent(MEDIA_EVENT_GENERATOR_GET_EVENT_FLAGS, IMFMediaEvent*);
    HRESULT BeginGetEvent(IMFAsyncCallback, IUnknown);
    HRESULT EndGetEvent(IMFAsyncResult, IMFMediaEvent*);
    HRESULT QueueEvent(uint, const(GUID)*, HRESULT, const(PROPVARIANT)*);
}
enum IID_IMFRemoteAsyncCallback = GUID(0xa27003d0, 0x2354, 0x4f2a, [0x8d, 0x6a, 0xab, 0x7c, 0xff, 0x15, 0x43, 0x7e]);
interface IMFRemoteAsyncCallback : IUnknown
{
    HRESULT Invoke(HRESULT, IUnknown);
}
alias MFBYTESTREAM_SEEK_ORIGIN = int;
enum : int
{
    msoBegin   = 0x00000000,
    msoCurrent = 0x00000001,
}

enum IID_IMFByteStream = GUID(0xad4c1b00, 0x4bf7, 0x422f, [0x91, 0x75, 0x75, 0x66, 0x93, 0xd9, 0x13, 0xd]);
interface IMFByteStream : IUnknown
{
    HRESULT GetCapabilities(uint*);
    HRESULT GetLength(ulong*);
    HRESULT SetLength(ulong);
    HRESULT GetCurrentPosition(ulong*);
    HRESULT SetCurrentPosition(ulong);
    HRESULT IsEndOfStream(BOOL*);
    HRESULT Read(ubyte*, uint, uint*);
    HRESULT BeginRead(ubyte*, uint, IMFAsyncCallback, IUnknown);
    HRESULT EndRead(IMFAsyncResult, uint*);
    HRESULT Write(const(ubyte)*, uint, uint*);
    HRESULT BeginWrite(const(ubyte)*, uint, IMFAsyncCallback, IUnknown);
    HRESULT EndWrite(IMFAsyncResult, uint*);
    HRESULT Seek(MFBYTESTREAM_SEEK_ORIGIN, long, uint, ulong*);
    HRESULT Flush();
    HRESULT Close();
}
enum IID_IMFByteStreamProxyClassFactory = GUID(0xa6b43f84, 0x5c0a, 0x42e8, [0xa4, 0x4d, 0xb1, 0x85, 0x7a, 0x76, 0x99, 0x2f]);
interface IMFByteStreamProxyClassFactory : IUnknown
{
    HRESULT CreateByteStreamProxy(IMFByteStream, IMFAttributes, const(GUID)*, void**);
}
alias MF_FILE_ACCESSMODE = int;
enum : int
{
    MF_ACCESSMODE_READ      = 0x00000001,
    MF_ACCESSMODE_WRITE     = 0x00000002,
    MF_ACCESSMODE_READWRITE = 0x00000003,
}

alias MF_FILE_OPENMODE = int;
enum : int
{
    MF_OPENMODE_FAIL_IF_NOT_EXIST = 0x00000000,
    MF_OPENMODE_FAIL_IF_EXIST     = 0x00000001,
    MF_OPENMODE_RESET_IF_EXIST    = 0x00000002,
    MF_OPENMODE_APPEND_IF_EXIST   = 0x00000003,
    MF_OPENMODE_DELETE_IF_EXIST   = 0x00000004,
}

alias MF_FILE_FLAGS = int;
enum : int
{
    MF_FILEFLAGS_NONE                = 0x00000000,
    MF_FILEFLAGS_NOBUFFERING         = 0x00000001,
    MF_FILEFLAGS_ALLOW_WRITE_SHARING = 0x00000002,
}

enum IID_IMFSampleOutputStream = GUID(0x8feed468, 0x6f7e, 0x440d, [0x86, 0x9a, 0x49, 0xbd, 0xd2, 0x83, 0xad, 0xd]);
interface IMFSampleOutputStream : IUnknown
{
    HRESULT BeginWriteSample(IMFSample, IMFAsyncCallback, IUnknown);
    HRESULT EndWriteSample(IMFAsyncResult);
    HRESULT Close();
}
enum IID_IMFCollection = GUID(0x5bc8a76b, 0x869a, 0x46a3, [0x9b, 0x3, 0xfa, 0x21, 0x8a, 0x66, 0xae, 0xbe]);
interface IMFCollection : IUnknown
{
    HRESULT GetElementCount(uint*);
    HRESULT GetElement(uint, IUnknown*);
    HRESULT AddElement(IUnknown);
    HRESULT RemoveElement(uint, IUnknown*);
    HRESULT InsertElementAt(uint, IUnknown);
    HRESULT RemoveAllElements();
}
enum IID_IMFMediaEventQueue = GUID(0x36f846fc, 0x2256, 0x48b6, [0xb5, 0x8e, 0xe2, 0xb6, 0x38, 0x31, 0x65, 0x81]);
interface IMFMediaEventQueue : IUnknown
{
    HRESULT GetEvent(uint, IMFMediaEvent*);
    HRESULT BeginGetEvent(IMFAsyncCallback, IUnknown);
    HRESULT EndGetEvent(IMFAsyncResult, IMFMediaEvent*);
    HRESULT QueueEvent(IMFMediaEvent);
    HRESULT QueueEventParamVar(uint, const(GUID)*, HRESULT, const(PROPVARIANT)*);
    HRESULT QueueEventParamUnk(uint, const(GUID)*, HRESULT, IUnknown);
    HRESULT Shutdown();
}
enum IID_IMFActivate = GUID(0x7fee9e9a, 0x4a89, 0x47a6, [0x89, 0x9c, 0xb6, 0xa5, 0x3a, 0x70, 0xfb, 0x67]);
interface IMFActivate : IMFAttributes
{
    HRESULT ActivateObject(const(GUID)*, void**);
    HRESULT ShutdownObject();
    HRESULT DetachObject();
}
enum IID_IMFPluginControl = GUID(0x5c6c44bf, 0x1db6, 0x435b, [0x92, 0x49, 0xe8, 0xcd, 0x10, 0xfd, 0xec, 0x96]);
interface IMFPluginControl : IUnknown
{
    HRESULT GetPreferredClsid(uint, const(wchar)*, GUID*);
    HRESULT GetPreferredClsidByIndex(uint, uint, PWSTR*, GUID*);
    HRESULT SetPreferredClsid(uint, const(wchar)*, const(GUID)*);
    HRESULT IsDisabled(uint, const(GUID)*);
    HRESULT GetDisabledByIndex(uint, uint, GUID*);
    HRESULT SetDisabled(uint, const(GUID)*, BOOL);
}
alias MF_PLUGIN_CONTROL_POLICY = int;
enum : int
{
    MF_PLUGIN_CONTROL_POLICY_USE_ALL_PLUGINS          = 0x00000000,
    MF_PLUGIN_CONTROL_POLICY_USE_APPROVED_PLUGINS     = 0x00000001,
    MF_PLUGIN_CONTROL_POLICY_USE_WEB_PLUGINS          = 0x00000002,
    MF_PLUGIN_CONTROL_POLICY_USE_WEB_PLUGINS_EDGEMODE = 0x00000003,
}

enum IID_IMFPluginControl2 = GUID(0xc6982083, 0x3ddc, 0x45cb, [0xaf, 0x5e, 0xf, 0x7a, 0x8c, 0xe4, 0xde, 0x77]);
interface IMFPluginControl2 : IMFPluginControl
{
    HRESULT SetPolicy(MF_PLUGIN_CONTROL_POLICY);
}
enum IID_IMFDXGIDeviceManager = GUID(0xeb533d5d, 0x2db6, 0x40f8, [0x97, 0xa9, 0x49, 0x46, 0x92, 0x1, 0x4f, 0x7]);
interface IMFDXGIDeviceManager : IUnknown
{
    HRESULT CloseDeviceHandle(HANDLE);
    HRESULT GetVideoService(HANDLE, const(GUID)*, void**);
    HRESULT LockDevice(HANDLE, const(GUID)*, void**, BOOL);
    HRESULT OpenDeviceHandle(HANDLE*);
    HRESULT ResetDevice(IUnknown, uint);
    HRESULT TestDevice(HANDLE);
    HRESULT UnlockDevice(HANDLE, BOOL);
}
alias MF_STREAM_STATE = int;
enum : int
{
    MF_STREAM_STATE_STOPPED = 0x00000000,
    MF_STREAM_STATE_PAUSED  = 0x00000001,
    MF_STREAM_STATE_RUNNING = 0x00000002,
}

enum IID_IMFMuxStreamAttributesManager = GUID(0xce8bd576, 0xe440, 0x43b3, [0xbe, 0x34, 0x1e, 0x53, 0xf5, 0x65, 0xf7, 0xe8]);
interface IMFMuxStreamAttributesManager : IUnknown
{
    HRESULT GetStreamCount(uint*);
    HRESULT GetAttributes(uint, IMFAttributes*);
}
enum IID_IMFMuxStreamMediaTypeManager = GUID(0x505a2c72, 0x42f7, 0x4690, [0xae, 0xab, 0x8f, 0x51, 0x3d, 0xf, 0xfd, 0xb8]);
interface IMFMuxStreamMediaTypeManager : IUnknown
{
    HRESULT GetStreamCount(uint*);
    HRESULT GetMediaType(uint, IMFMediaType*);
    HRESULT GetStreamConfigurationCount(uint*);
    HRESULT AddStreamConfiguration(ulong);
    HRESULT RemoveStreamConfiguration(ulong);
    HRESULT GetStreamConfiguration(uint, ulong*);
}
enum IID_IMFMuxStreamSampleManager = GUID(0x74abbc19, 0xb1cc, 0x4e41, [0xbb, 0x8b, 0x9d, 0x9b, 0x86, 0xa8, 0xf6, 0xca]);
interface IMFMuxStreamSampleManager : IUnknown
{
    HRESULT GetStreamCount(uint*);
    HRESULT GetSample(uint, IMFSample*);
    ulong GetStreamConfiguration();
}
enum IID_IMFSecureBuffer = GUID(0xc1209904, 0xe584, 0x4752, [0xa2, 0xd6, 0x7f, 0x21, 0x69, 0x3f, 0x8b, 0x21]);
interface IMFSecureBuffer : IUnknown
{
    HRESULT GetIdentifier(GUID*);
}
alias _MFT_INPUT_DATA_BUFFER_FLAGS = int;
enum : int
{
    MFT_INPUT_DATA_BUFFER_PLACEHOLDER = 0xffffffff,
}

alias _MFT_OUTPUT_DATA_BUFFER_FLAGS = int;
enum : int
{
    MFT_OUTPUT_DATA_BUFFER_INCOMPLETE    = 0x01000000,
    MFT_OUTPUT_DATA_BUFFER_FORMAT_CHANGE = 0x00000100,
    MFT_OUTPUT_DATA_BUFFER_STREAM_END    = 0x00000200,
    MFT_OUTPUT_DATA_BUFFER_NO_SAMPLE     = 0x00000300,
}

alias _MFT_INPUT_STATUS_FLAGS = int;
enum : int
{
    MFT_INPUT_STATUS_ACCEPT_DATA = 0x00000001,
}

alias _MFT_OUTPUT_STATUS_FLAGS = int;
enum : int
{
    MFT_OUTPUT_STATUS_SAMPLE_READY = 0x00000001,
}

alias _MFT_INPUT_STREAM_INFO_FLAGS = int;
enum : int
{
    MFT_INPUT_STREAM_WHOLE_SAMPLES            = 0x00000001,
    MFT_INPUT_STREAM_SINGLE_SAMPLE_PER_BUFFER = 0x00000002,
    MFT_INPUT_STREAM_FIXED_SAMPLE_SIZE        = 0x00000004,
    MFT_INPUT_STREAM_HOLDS_BUFFERS            = 0x00000008,
    MFT_INPUT_STREAM_DOES_NOT_ADDREF          = 0x00000100,
    MFT_INPUT_STREAM_REMOVABLE                = 0x00000200,
    MFT_INPUT_STREAM_OPTIONAL                 = 0x00000400,
    MFT_INPUT_STREAM_PROCESSES_IN_PLACE       = 0x00000800,
}

alias _MFT_OUTPUT_STREAM_INFO_FLAGS = int;
enum : int
{
    MFT_OUTPUT_STREAM_WHOLE_SAMPLES            = 0x00000001,
    MFT_OUTPUT_STREAM_SINGLE_SAMPLE_PER_BUFFER = 0x00000002,
    MFT_OUTPUT_STREAM_FIXED_SAMPLE_SIZE        = 0x00000004,
    MFT_OUTPUT_STREAM_DISCARDABLE              = 0x00000008,
    MFT_OUTPUT_STREAM_OPTIONAL                 = 0x00000010,
    MFT_OUTPUT_STREAM_PROVIDES_SAMPLES         = 0x00000100,
    MFT_OUTPUT_STREAM_CAN_PROVIDE_SAMPLES      = 0x00000200,
    MFT_OUTPUT_STREAM_LAZY_READ                = 0x00000400,
    MFT_OUTPUT_STREAM_REMOVABLE                = 0x00000800,
}

alias _MFT_SET_TYPE_FLAGS = int;
enum : int
{
    MFT_SET_TYPE_TEST_ONLY = 0x00000001,
}

alias _MFT_PROCESS_OUTPUT_FLAGS = int;
enum : int
{
    MFT_PROCESS_OUTPUT_DISCARD_WHEN_NO_BUFFER = 0x00000001,
    MFT_PROCESS_OUTPUT_REGENERATE_LAST_OUTPUT = 0x00000002,
}

alias _MFT_PROCESS_OUTPUT_STATUS = int;
enum : int
{
    MFT_PROCESS_OUTPUT_STATUS_NEW_STREAMS = 0x00000100,
}

alias MFT_DRAIN_TYPE = int;
enum : int
{
    MFT_DRAIN_PRODUCE_TAILS = 0x00000000,
    MFT_DRAIN_NO_TAILS      = 0x00000001,
}

alias MFT_MESSAGE_TYPE = int;
enum : int
{
    MFT_MESSAGE_COMMAND_FLUSH                   = 0x00000000,
    MFT_MESSAGE_COMMAND_DRAIN                   = 0x00000001,
    MFT_MESSAGE_SET_D3D_MANAGER                 = 0x00000002,
    MFT_MESSAGE_DROP_SAMPLES                    = 0x00000003,
    MFT_MESSAGE_COMMAND_TICK                    = 0x00000004,
    MFT_MESSAGE_NOTIFY_BEGIN_STREAMING          = 0x10000000,
    MFT_MESSAGE_NOTIFY_END_STREAMING            = 0x10000001,
    MFT_MESSAGE_NOTIFY_END_OF_STREAM            = 0x10000002,
    MFT_MESSAGE_NOTIFY_START_OF_STREAM          = 0x10000003,
    MFT_MESSAGE_NOTIFY_RELEASE_RESOURCES        = 0x10000004,
    MFT_MESSAGE_NOTIFY_REACQUIRE_RESOURCES      = 0x10000005,
    MFT_MESSAGE_NOTIFY_EVENT                    = 0x10000006,
    MFT_MESSAGE_COMMAND_SET_OUTPUT_STREAM_STATE = 0x10000007,
    MFT_MESSAGE_COMMAND_FLUSH_OUTPUT_STREAM     = 0x10000008,
    MFT_MESSAGE_COMMAND_MARKER                  = 0x20000000,
}

struct MFT_INPUT_STREAM_INFO
{
    long hnsMaxLatency;
    uint dwFlags;
    uint cbSize;
    uint cbMaxLookahead;
    uint cbAlignment;
}
struct MFT_OUTPUT_STREAM_INFO
{
    uint dwFlags;
    uint cbSize;
    uint cbAlignment;
}
struct MFT_OUTPUT_DATA_BUFFER
{
    uint dwStreamID;
    IMFSample pSample;
    uint dwStatus;
    IMFCollection pEvents;
}
enum IID_IMFTransform = GUID(0xbf94c121, 0x5b05, 0x4e6f, [0x80, 0x0, 0xba, 0x59, 0x89, 0x61, 0x41, 0x4d]);
interface IMFTransform : IUnknown
{
    HRESULT GetStreamLimits(uint*, uint*, uint*, uint*);
    HRESULT GetStreamCount(uint*, uint*);
    HRESULT GetStreamIDs(uint, uint*, uint, uint*);
    HRESULT GetInputStreamInfo(uint, MFT_INPUT_STREAM_INFO*);
    HRESULT GetOutputStreamInfo(uint, MFT_OUTPUT_STREAM_INFO*);
    HRESULT GetAttributes(IMFAttributes*);
    HRESULT GetInputStreamAttributes(uint, IMFAttributes*);
    HRESULT GetOutputStreamAttributes(uint, IMFAttributes*);
    HRESULT DeleteInputStream(uint);
    HRESULT AddInputStreams(uint, uint*);
    HRESULT GetInputAvailableType(uint, uint, IMFMediaType*);
    HRESULT GetOutputAvailableType(uint, uint, IMFMediaType*);
    HRESULT SetInputType(uint, IMFMediaType, uint);
    HRESULT SetOutputType(uint, IMFMediaType, uint);
    HRESULT GetInputCurrentType(uint, IMFMediaType*);
    HRESULT GetOutputCurrentType(uint, IMFMediaType*);
    HRESULT GetInputStatus(uint, uint*);
    HRESULT GetOutputStatus(uint*);
    HRESULT SetOutputBounds(long, long);
    HRESULT ProcessEvent(uint, IMFMediaEvent);
    HRESULT ProcessMessage(MFT_MESSAGE_TYPE, ulong);
    HRESULT ProcessInput(uint, IMFSample, uint);
    HRESULT ProcessOutput(uint, uint, MFT_OUTPUT_DATA_BUFFER*, uint*);
}
alias DeviceStreamState = int;
enum : int
{
    DeviceStreamState_Stop     = 0x00000000,
    DeviceStreamState_Pause    = 0x00000001,
    DeviceStreamState_Run      = 0x00000002,
    DeviceStreamState_Disabled = 0x00000003,
}

struct STREAM_MEDIUM
{
    GUID gidMedium;
    uint unMediumInstance;
}
enum IID_IMFDeviceTransform = GUID(0xd818fbd8, 0xfc46, 0x42f2, [0x87, 0xac, 0x1e, 0xa2, 0xd1, 0xf9, 0xbf, 0x32]);
interface IMFDeviceTransform : IUnknown
{
    HRESULT InitializeTransform(IMFAttributes);
    HRESULT GetInputAvailableType(uint, uint, IMFMediaType*);
    HRESULT GetInputCurrentType(uint, IMFMediaType*);
    HRESULT GetInputStreamAttributes(uint, IMFAttributes*);
    HRESULT GetOutputAvailableType(uint, uint, IMFMediaType*);
    HRESULT GetOutputCurrentType(uint, IMFMediaType*);
    HRESULT GetOutputStreamAttributes(uint, IMFAttributes*);
    HRESULT GetStreamCount(uint*, uint*);
    HRESULT GetStreamIDs(uint, uint*, uint, uint*);
    HRESULT ProcessEvent(uint, IMFMediaEvent);
    HRESULT ProcessInput(uint, IMFSample, uint);
    HRESULT ProcessMessage(MFT_MESSAGE_TYPE, ulong);
    HRESULT ProcessOutput(uint, uint, MFT_OUTPUT_DATA_BUFFER*, uint*);
    HRESULT SetInputStreamState(uint, IMFMediaType, DeviceStreamState, uint);
    HRESULT GetInputStreamState(uint, DeviceStreamState*);
    HRESULT SetOutputStreamState(uint, IMFMediaType, DeviceStreamState, uint);
    HRESULT GetOutputStreamState(uint, DeviceStreamState*);
    HRESULT GetInputStreamPreferredState(uint, DeviceStreamState*, IMFMediaType*);
    HRESULT FlushInputStream(uint, uint);
    HRESULT FlushOutputStream(uint, uint);
}
enum IID_IMFDeviceTransformCallback = GUID(0x6d5cb646, 0x29ec, 0x41fb, [0x81, 0x79, 0x8c, 0x4c, 0x6d, 0x75, 0x8, 0x11]);
interface IMFDeviceTransformCallback : IUnknown
{
    HRESULT OnBufferSent(IMFAttributes, uint);
}
alias MF3DVideoOutputType = int;
enum : int
{
    MF3DVideoOutputType_BaseView = 0x00000000,
    MF3DVideoOutputType_Stereo   = 0x00000001,
}

alias MFT_AUDIO_DECODER_DEGRADATION_REASON = int;
enum : int
{
    MFT_AUDIO_DECODER_DEGRADATION_REASON_NONE                  = 0x00000000,
    MFT_AUDIO_DECODER_DEGRADATION_REASON_LICENSING_REQUIREMENT = 0x00000001,
}

alias MFT_AUDIO_DECODER_DEGRADATION_TYPE = int;
enum : int
{
    MFT_AUDIO_DECODER_DEGRADATION_TYPE_NONE            = 0x00000000,
    MFT_AUDIO_DECODER_DEGRADATION_TYPE_DOWNMIX2CHANNEL = 0x00000001,
    MFT_AUDIO_DECODER_DEGRADATION_TYPE_DOWNMIX6CHANNEL = 0x00000002,
    MFT_AUDIO_DECODER_DEGRADATION_TYPE_DOWNMIX8CHANNEL = 0x00000003,
}

struct MFAudioDecoderDegradationInfo
{
    MFT_AUDIO_DECODER_DEGRADATION_REASON eDegradationReason;
    MFT_AUDIO_DECODER_DEGRADATION_TYPE eType;
}
struct MFT_STREAM_STATE_PARAM
{
    uint StreamId;
    MF_STREAM_STATE State;
}
alias MFSESSION_SETTOPOLOGY_FLAGS = int;
enum : int
{
    MFSESSION_SETTOPOLOGY_IMMEDIATE     = 0x00000001,
    MFSESSION_SETTOPOLOGY_NORESOLUTION  = 0x00000002,
    MFSESSION_SETTOPOLOGY_CLEAR_CURRENT = 0x00000004,
}

alias MFSESSION_GETFULLTOPOLOGY_FLAGS = int;
enum : int
{
    MFSESSION_GETFULLTOPOLOGY_CURRENT = 0x00000001,
}

alias MFPMPSESSION_CREATION_FLAGS = int;
enum : int
{
    MFPMPSESSION_UNPROTECTED_PROCESS = 0x00000001,
    MFPMPSESSION_IN_PROCESS          = 0x00000002,
}

enum IID_IMFMediaSession = GUID(0x90377834, 0x21d0, 0x4dee, [0x82, 0x14, 0xba, 0x2e, 0x3e, 0x6c, 0x11, 0x27]);
interface IMFMediaSession : IMFMediaEventGenerator
{
    HRESULT SetTopology(uint, IMFTopology);
    HRESULT ClearTopologies();
    HRESULT Start(const(GUID)*, const(PROPVARIANT)*);
    HRESULT Pause();
    HRESULT Stop();
    HRESULT Close();
    HRESULT Shutdown();
    HRESULT GetClock(IMFClock*);
    HRESULT GetSessionCapabilities(uint*);
    HRESULT GetFullTopology(uint, ulong, IMFTopology*);
}
alias MF_OBJECT_TYPE = int;
enum : int
{
    MF_OBJECT_MEDIASOURCE = 0x00000000,
    MF_OBJECT_BYTESTREAM  = 0x00000001,
    MF_OBJECT_INVALID     = 0x00000002,
}

alias MF_RESOLUTION_FLAGS = uint;
enum : uint
{
    MF_RESOLUTION_MEDIASOURCE                                           = 0x00000001,
    MF_RESOLUTION_BYTESTREAM                                            = 0x00000002,
    MF_RESOLUTION_CONTENT_DOES_NOT_HAVE_TO_MATCH_EXTENSION_OR_MIME_TYPE = 0x00000010,
    MF_RESOLUTION_KEEP_BYTE_STREAM_ALIVE_ON_FAIL                        = 0x00000020,
    MF_RESOLUTION_DISABLE_LOCAL_PLUGINS                                 = 0x00000040,
    MF_RESOLUTION_PLUGIN_CONTROL_POLICY_APPROVED_ONLY                   = 0x00000080,
    MF_RESOLUTION_PLUGIN_CONTROL_POLICY_WEB_ONLY                        = 0x00000100,
    MF_RESOLUTION_PLUGIN_CONTROL_POLICY_WEB_ONLY_EDGEMODE               = 0x00000200,
    MF_RESOLUTION_ENABLE_STORE_PLUGINS                                  = 0x00000400,
    MF_RESOLUTION_READ                                                  = 0x00010000,
    MF_RESOLUTION_WRITE                                                 = 0x00020000,
}

alias MF_CONNECT_METHOD = int;
enum : int
{
    MF_CONNECT_DIRECT                          = 0x00000000,
    MF_CONNECT_ALLOW_CONVERTER                 = 0x00000001,
    MF_CONNECT_ALLOW_DECODER                   = 0x00000003,
    MF_CONNECT_RESOLVE_INDEPENDENT_OUTPUTTYPES = 0x00000004,
    MF_CONNECT_AS_OPTIONAL                     = 0x00010000,
    MF_CONNECT_AS_OPTIONAL_BRANCH              = 0x00020000,
}

alias MF_TOPOLOGY_RESOLUTION_STATUS_FLAGS = int;
enum : int
{
    MF_TOPOLOGY_RESOLUTION_SUCCEEDED            = 0x00000000,
    MF_OPTIONAL_NODE_REJECTED_MEDIA_TYPE        = 0x00000001,
    MF_OPTIONAL_NODE_REJECTED_PROTECTED_PROCESS = 0x00000002,
}

enum IID_IMFSourceResolver = GUID(0xfbe5a32d, 0xa497, 0x4b61, [0xbb, 0x85, 0x97, 0xb1, 0xa8, 0x48, 0xa6, 0xe3]);
interface IMFSourceResolver : IUnknown
{
    HRESULT CreateObjectFromURL(const(wchar)*, uint, IPropertyStore, MF_OBJECT_TYPE*, IUnknown*);
    HRESULT CreateObjectFromByteStream(IMFByteStream, const(wchar)*, uint, IPropertyStore, MF_OBJECT_TYPE*, IUnknown*);
    HRESULT BeginCreateObjectFromURL(const(wchar)*, uint, IPropertyStore, IUnknown*, IMFAsyncCallback, IUnknown);
    HRESULT EndCreateObjectFromURL(IMFAsyncResult, MF_OBJECT_TYPE*, IUnknown*);
    HRESULT BeginCreateObjectFromByteStream(IMFByteStream, const(wchar)*, uint, IPropertyStore, IUnknown*, IMFAsyncCallback, IUnknown);
    HRESULT EndCreateObjectFromByteStream(IMFAsyncResult, MF_OBJECT_TYPE*, IUnknown*);
    HRESULT CancelObjectCreation(IUnknown);
}
alias MFMEDIASOURCE_CHARACTERISTICS = int;
enum : int
{
    MFMEDIASOURCE_IS_LIVE                    = 0x00000001,
    MFMEDIASOURCE_CAN_SEEK                   = 0x00000002,
    MFMEDIASOURCE_CAN_PAUSE                  = 0x00000004,
    MFMEDIASOURCE_HAS_SLOW_SEEK              = 0x00000008,
    MFMEDIASOURCE_HAS_MULTIPLE_PRESENTATIONS = 0x00000010,
    MFMEDIASOURCE_CAN_SKIPFORWARD            = 0x00000020,
    MFMEDIASOURCE_CAN_SKIPBACKWARD           = 0x00000040,
    MFMEDIASOURCE_DOES_NOT_USE_NETWORK       = 0x00000080,
}

enum IID_IMFMediaSource = GUID(0x279a808d, 0xaec7, 0x40c8, [0x9c, 0x6b, 0xa6, 0xb4, 0x92, 0xc7, 0x8a, 0x66]);
interface IMFMediaSource : IMFMediaEventGenerator
{
    HRESULT GetCharacteristics(uint*);
    HRESULT CreatePresentationDescriptor(IMFPresentationDescriptor*);
    HRESULT Start(IMFPresentationDescriptor, const(GUID)*, const(PROPVARIANT)*);
    HRESULT Stop();
    HRESULT Pause();
    HRESULT Shutdown();
}
enum IID_IMFMediaSourceEx = GUID(0x3c9b2eb9, 0x86d5, 0x4514, [0xa3, 0x94, 0xf5, 0x66, 0x64, 0xf9, 0xf0, 0xd8]);
interface IMFMediaSourceEx : IMFMediaSource
{
    HRESULT GetSourceAttributes(IMFAttributes*);
    HRESULT GetStreamAttributes(uint, IMFAttributes*);
    HRESULT SetD3DManager(IUnknown);
}
enum IID_IMFClockConsumer = GUID(0x6ef2a662, 0x47c0, 0x4666, [0xb1, 0x3d, 0xcb, 0xb7, 0x17, 0xf2, 0xfa, 0x2c]);
interface IMFClockConsumer : IUnknown
{
    HRESULT SetPresentationClock(IMFPresentationClock);
    HRESULT GetPresentationClock(IMFPresentationClock*);
}
enum IID_IMFMediaStream = GUID(0xd182108f, 0x4ec6, 0x443f, [0xaa, 0x42, 0xa7, 0x11, 0x6, 0xec, 0x82, 0x5f]);
interface IMFMediaStream : IMFMediaEventGenerator
{
    HRESULT GetMediaSource(IMFMediaSource*);
    HRESULT GetStreamDescriptor(IMFStreamDescriptor*);
    HRESULT RequestSample(IUnknown);
}
enum IID_IMFMediaSink = GUID(0x6ef2a660, 0x47c0, 0x4666, [0xb1, 0x3d, 0xcb, 0xb7, 0x17, 0xf2, 0xfa, 0x2c]);
interface IMFMediaSink : IUnknown
{
    HRESULT GetCharacteristics(uint*);
    HRESULT AddStreamSink(uint, IMFMediaType, IMFStreamSink*);
    HRESULT RemoveStreamSink(uint);
    HRESULT GetStreamSinkCount(uint*);
    HRESULT GetStreamSinkByIndex(uint, IMFStreamSink*);
    HRESULT GetStreamSinkById(uint, IMFStreamSink*);
    HRESULT SetPresentationClock(IMFPresentationClock);
    HRESULT GetPresentationClock(IMFPresentationClock*);
    HRESULT Shutdown();
}
alias MFSTREAMSINK_MARKER_TYPE = int;
enum : int
{
    MFSTREAMSINK_MARKER_DEFAULT      = 0x00000000,
    MFSTREAMSINK_MARKER_ENDOFSEGMENT = 0x00000001,
    MFSTREAMSINK_MARKER_TICK         = 0x00000002,
    MFSTREAMSINK_MARKER_EVENT        = 0x00000003,
}

enum IID_IMFStreamSink = GUID(0xa97b3cf, 0x8e7c, 0x4a3d, [0x8f, 0x8c, 0xc, 0x84, 0x3d, 0xc2, 0x47, 0xfb]);
interface IMFStreamSink : IMFMediaEventGenerator
{
    HRESULT GetMediaSink(IMFMediaSink*);
    HRESULT GetIdentifier(uint*);
    HRESULT GetMediaTypeHandler(IMFMediaTypeHandler*);
    HRESULT ProcessSample(IMFSample);
    HRESULT PlaceMarker(MFSTREAMSINK_MARKER_TYPE, const(PROPVARIANT)*, const(PROPVARIANT)*);
    HRESULT Flush();
}
enum IID_IMFVideoSampleAllocator = GUID(0x86cbc910, 0xe533, 0x4751, [0x8e, 0x3b, 0xf1, 0x9b, 0x5b, 0x80, 0x6a, 0x3]);
interface IMFVideoSampleAllocator : IUnknown
{
    HRESULT SetDirectXManager(IUnknown);
    HRESULT UninitializeSampleAllocator();
    HRESULT InitializeSampleAllocator(uint, IMFMediaType);
    HRESULT AllocateSample(IMFSample*);
}
enum IID_IMFVideoSampleAllocatorNotify = GUID(0xa792cdbe, 0xc374, 0x4e89, [0x83, 0x35, 0x27, 0x8e, 0x7b, 0x99, 0x56, 0xa4]);
interface IMFVideoSampleAllocatorNotify : IUnknown
{
    HRESULT NotifyRelease();
}
enum IID_IMFVideoSampleAllocatorNotifyEx = GUID(0x3978aa1a, 0x6d5b, 0x4b7f, [0xa3, 0x40, 0x90, 0x89, 0x91, 0x89, 0xae, 0x34]);
interface IMFVideoSampleAllocatorNotifyEx : IMFVideoSampleAllocatorNotify
{
    HRESULT NotifyPrune(IMFSample);
}
enum IID_IMFVideoSampleAllocatorCallback = GUID(0x992388b4, 0x3372, 0x4f67, [0x8b, 0x6f, 0xc8, 0x4c, 0x7, 0x1f, 0x47, 0x51]);
interface IMFVideoSampleAllocatorCallback : IUnknown
{
    HRESULT SetCallback(IMFVideoSampleAllocatorNotify);
    HRESULT GetFreeSampleCount(int*);
}
enum IID_IMFVideoSampleAllocatorEx = GUID(0x545b3a48, 0x3283, 0x4f62, [0x86, 0x6f, 0xa6, 0x2d, 0x8f, 0x59, 0x8f, 0x9f]);
interface IMFVideoSampleAllocatorEx : IMFVideoSampleAllocator
{
    HRESULT InitializeSampleAllocatorEx(uint, uint, IMFAttributes, IMFMediaType);
}
enum IID_IMFDXGIDeviceManagerSource = GUID(0x20bc074b, 0x7a8d, 0x4609, [0x8c, 0x3b, 0x64, 0xa0, 0xa3, 0xb5, 0xd7, 0xce]);
interface IMFDXGIDeviceManagerSource : IUnknown
{
    HRESULT GetManager(IMFDXGIDeviceManager*);
}
alias MF_VIDEO_PROCESSOR_ROTATION = int;
enum : int
{
    ROTATION_NONE   = 0x00000000,
    ROTATION_NORMAL = 0x00000001,
}

alias MF_VIDEO_PROCESSOR_MIRROR = int;
enum : int
{
    MIRROR_NONE       = 0x00000000,
    MIRROR_HORIZONTAL = 0x00000001,
    MIRROR_VERTICAL   = 0x00000002,
}

enum IID_IMFVideoProcessorControl = GUID(0xa3f675d5, 0x6119, 0x4f7f, [0xa1, 0x0, 0x1d, 0x8b, 0x28, 0xf, 0xe, 0xfb]);
interface IMFVideoProcessorControl : IUnknown
{
    HRESULT SetBorderColor(MFARGB*);
    HRESULT SetSourceRectangle(RECT*);
    HRESULT SetDestinationRectangle(RECT*);
    HRESULT SetMirror(MF_VIDEO_PROCESSOR_MIRROR);
    HRESULT SetRotation(MF_VIDEO_PROCESSOR_ROTATION);
    HRESULT SetConstrictionSize(SIZE*);
}
enum IID_IMFVideoProcessorControl2 = GUID(0xbde633d3, 0xe1dc, 0x4a7f, [0xa6, 0x93, 0xbb, 0xae, 0x39, 0x9c, 0x4a, 0x20]);
interface IMFVideoProcessorControl2 : IMFVideoProcessorControl
{
    HRESULT SetRotationOverride(uint);
    HRESULT EnableHardwareEffects(BOOL);
    HRESULT GetSupportedHardwareEffects(uint*);
}
alias MFVideoSphericalFormat = int;
enum : int
{
    MFVideoSphericalFormat_Unsupported     = 0x00000000,
    MFVideoSphericalFormat_Equirectangular = 0x00000001,
    MFVideoSphericalFormat_CubeMap         = 0x00000002,
    MFVideoSphericalFormat_3DMesh          = 0x00000003,
}

alias MFVideoSphericalProjectionMode = int;
enum : int
{
    MFVideoSphericalProjectionMode_Spherical = 0x00000000,
    MFVideoSphericalProjectionMode_Flat      = 0x00000001,
}

enum IID_IMFVideoProcessorControl3 = GUID(0x2424b3f2, 0xeb23, 0x40f1, [0x91, 0xaa, 0x74, 0xbd, 0xde, 0xea, 0x8, 0x83]);
interface IMFVideoProcessorControl3 : IMFVideoProcessorControl2
{
    HRESULT GetNaturalOutputType(IMFMediaType*);
    HRESULT EnableSphericalVideoProcessing(BOOL, MFVideoSphericalFormat, MFVideoSphericalProjectionMode);
    HRESULT SetSphericalVideoProperties(float, float, float, float, float);
    HRESULT SetOutputDevice(IUnknown);
}
enum IID_IMFVideoRendererEffectControl = GUID(0x604d33d7, 0xcf23, 0x41d5, [0x82, 0x24, 0x5b, 0xbb, 0xb1, 0xa8, 0x74, 0x75]);
interface IMFVideoRendererEffectControl : IUnknown
{
    HRESULT OnAppServiceConnectionEstablished(IUnknown);
}
enum IID_IMFTopology = GUID(0x83cf873a, 0xf6da, 0x4bc8, [0x82, 0x3f, 0xba, 0xcf, 0xd5, 0x5d, 0xc4, 0x33]);
interface IMFTopology : IMFAttributes
{
    HRESULT GetTopologyID(ulong*);
    HRESULT AddNode(IMFTopologyNode);
    HRESULT RemoveNode(IMFTopologyNode);
    HRESULT GetNodeCount(ushort*);
    HRESULT GetNode(ushort, IMFTopologyNode*);
    HRESULT Clear();
    HRESULT CloneFrom(IMFTopology);
    HRESULT GetNodeByID(ulong, IMFTopologyNode*);
    HRESULT GetSourceNodeCollection(IMFCollection*);
    HRESULT GetOutputNodeCollection(IMFCollection*);
}
alias MFTOPOLOGY_DXVA_MODE = int;
enum : int
{
    MFTOPOLOGY_DXVA_DEFAULT = 0x00000000,
    MFTOPOLOGY_DXVA_NONE    = 0x00000001,
    MFTOPOLOGY_DXVA_FULL    = 0x00000002,
}

alias MFTOPOLOGY_HARDWARE_MODE = int;
enum : int
{
    MFTOPOLOGY_HWMODE_SOFTWARE_ONLY     = 0x00000000,
    MFTOPOLOGY_HWMODE_USE_HARDWARE      = 0x00000001,
    MFTOPOLOGY_HWMODE_USE_ONLY_HARDWARE = 0x00000002,
}

alias MF_TOPOLOGY_TYPE = int;
enum : int
{
    MF_TOPOLOGY_OUTPUT_NODE       = 0x00000000,
    MF_TOPOLOGY_SOURCESTREAM_NODE = 0x00000001,
    MF_TOPOLOGY_TRANSFORM_NODE    = 0x00000002,
    MF_TOPOLOGY_TEE_NODE          = 0x00000003,
    MF_TOPOLOGY_MAX               = 0xffffffff,
}

enum IID_IMFTopologyNode = GUID(0x83cf873a, 0xf6da, 0x4bc8, [0x82, 0x3f, 0xba, 0xcf, 0xd5, 0x5d, 0xc4, 0x30]);
interface IMFTopologyNode : IMFAttributes
{
    HRESULT SetObject(IUnknown);
    HRESULT GetObject(IUnknown*);
    HRESULT GetNodeType(MF_TOPOLOGY_TYPE*);
    HRESULT GetTopoNodeID(ulong*);
    HRESULT SetTopoNodeID(ulong);
    HRESULT GetInputCount(uint*);
    HRESULT GetOutputCount(uint*);
    HRESULT ConnectOutput(uint, IMFTopologyNode, uint);
    HRESULT DisconnectOutput(uint);
    HRESULT GetInput(uint, IMFTopologyNode*, uint*);
    HRESULT GetOutput(uint, IMFTopologyNode*, uint*);
    HRESULT SetOutputPrefType(uint, IMFMediaType);
    HRESULT GetOutputPrefType(uint, IMFMediaType*);
    HRESULT SetInputPrefType(uint, IMFMediaType);
    HRESULT GetInputPrefType(uint, IMFMediaType*);
    HRESULT CloneFrom(IMFTopologyNode);
}
alias MF_TOPONODE_FLUSH_MODE = int;
enum : int
{
    MF_TOPONODE_FLUSH_ALWAYS = 0x00000000,
    MF_TOPONODE_FLUSH_SEEK   = 0x00000001,
    MF_TOPONODE_FLUSH_NEVER  = 0x00000002,
}

alias MF_TOPONODE_DRAIN_MODE = int;
enum : int
{
    MF_TOPONODE_DRAIN_DEFAULT = 0x00000000,
    MF_TOPONODE_DRAIN_ALWAYS  = 0x00000001,
    MF_TOPONODE_DRAIN_NEVER   = 0x00000002,
}

enum IID_IMFGetService = GUID(0xfa993888, 0x4383, 0x415a, [0xa9, 0x30, 0xdd, 0x47, 0x2a, 0x8c, 0xf6, 0xf7]);
interface IMFGetService : IUnknown
{
    HRESULT GetService(const(GUID)*, const(GUID)*, void**);
}
alias MFCLOCK_CHARACTERISTICS_FLAGS = int;
enum : int
{
    MFCLOCK_CHARACTERISTICS_FLAG_FREQUENCY_10MHZ = 0x00000002,
    MFCLOCK_CHARACTERISTICS_FLAG_ALWAYS_RUNNING  = 0x00000004,
    MFCLOCK_CHARACTERISTICS_FLAG_IS_SYSTEM_CLOCK = 0x00000008,
}

alias MFCLOCK_STATE = int;
enum : int
{
    MFCLOCK_STATE_INVALID = 0x00000000,
    MFCLOCK_STATE_RUNNING = 0x00000001,
    MFCLOCK_STATE_STOPPED = 0x00000002,
    MFCLOCK_STATE_PAUSED  = 0x00000003,
}

alias MFCLOCK_RELATIONAL_FLAGS = int;
enum : int
{
    MFCLOCK_RELATIONAL_FLAG_JITTER_NEVER_AHEAD = 0x00000001,
}

struct MFCLOCK_PROPERTIES
{
    ulong qwCorrelationRate;
    GUID guidClockId;
    uint dwClockFlags;
    ulong qwClockFrequency;
    uint dwClockTolerance;
    uint dwClockJitter;
}
enum IID_IMFClock = GUID(0x2eb1e945, 0x18b8, 0x4139, [0x9b, 0x1a, 0xd5, 0xd5, 0x84, 0x81, 0x85, 0x30]);
interface IMFClock : IUnknown
{
    HRESULT GetClockCharacteristics(uint*);
    HRESULT GetCorrelatedTime(uint, long*, long*);
    HRESULT GetContinuityKey(uint*);
    HRESULT GetState(uint, MFCLOCK_STATE*);
    HRESULT GetProperties(MFCLOCK_PROPERTIES*);
}
enum IID_IMFPresentationClock = GUID(0x868ce85c, 0x8ea9, 0x4f55, [0xab, 0x82, 0xb0, 0x9, 0xa9, 0x10, 0xa8, 0x5]);
interface IMFPresentationClock : IMFClock
{
    HRESULT SetTimeSource(IMFPresentationTimeSource);
    HRESULT GetTimeSource(IMFPresentationTimeSource*);
    HRESULT GetTime(long*);
    HRESULT AddClockStateSink(IMFClockStateSink);
    HRESULT RemoveClockStateSink(IMFClockStateSink);
    HRESULT Start(long);
    HRESULT Stop();
    HRESULT Pause();
}
enum IID_IMFPresentationTimeSource = GUID(0x7ff12cce, 0xf76f, 0x41c2, [0x86, 0x3b, 0x16, 0x66, 0xc8, 0xe5, 0xe1, 0x39]);
interface IMFPresentationTimeSource : IMFClock
{
    HRESULT GetUnderlyingClock(IMFClock*);
}
enum IID_IMFClockStateSink = GUID(0xf6696e82, 0x74f7, 0x4f3d, [0xa1, 0x78, 0x8a, 0x5e, 0x9, 0xc3, 0x65, 0x9f]);
interface IMFClockStateSink : IUnknown
{
    HRESULT OnClockStart(long, long);
    HRESULT OnClockStop(long);
    HRESULT OnClockPause(long);
    HRESULT OnClockRestart(long);
    HRESULT OnClockSetRate(long, float);
}
enum IID_IMFPresentationDescriptor = GUID(0x3cb2711, 0x24d7, 0x4db6, [0xa1, 0x7f, 0xf3, 0xa7, 0xa4, 0x79, 0xa5, 0x36]);
interface IMFPresentationDescriptor : IMFAttributes
{
    HRESULT GetStreamDescriptorCount(uint*);
    HRESULT GetStreamDescriptorByIndex(uint, BOOL*, IMFStreamDescriptor*);
    HRESULT SelectStream(uint);
    HRESULT DeselectStream(uint);
    HRESULT Clone(IMFPresentationDescriptor*);
}
enum IID_IMFStreamDescriptor = GUID(0x56c03d9c, 0x9dbb, 0x45f5, [0xab, 0x4b, 0xd8, 0xf, 0x47, 0xc0, 0x59, 0x38]);
interface IMFStreamDescriptor : IMFAttributes
{
    HRESULT GetStreamIdentifier(uint*);
    HRESULT GetMediaTypeHandler(IMFMediaTypeHandler*);
}
enum IID_IMFMediaTypeHandler = GUID(0xe93dcf6c, 0x4b07, 0x4e1e, [0x81, 0x23, 0xaa, 0x16, 0xed, 0x6e, 0xad, 0xf5]);
interface IMFMediaTypeHandler : IUnknown
{
    HRESULT IsMediaTypeSupported(IMFMediaType, IMFMediaType*);
    HRESULT GetMediaTypeCount(uint*);
    HRESULT GetMediaTypeByIndex(uint, IMFMediaType*);
    HRESULT SetCurrentMediaType(IMFMediaType);
    HRESULT GetCurrentMediaType(IMFMediaType*);
    HRESULT GetMajorType(GUID*);
}
alias MFTIMER_FLAGS = int;
enum : int
{
    MFTIMER_RELATIVE = 0x00000001,
}

enum IID_IMFTimer = GUID(0xe56e4cbd, 0x8f70, 0x49d8, [0xa0, 0xf8, 0xed, 0xb3, 0xd6, 0xab, 0x9b, 0xf2]);
interface IMFTimer : IUnknown
{
    HRESULT SetTimer(uint, long, IMFAsyncCallback, IUnknown, IUnknown*);
    HRESULT CancelTimer(IUnknown);
}
alias MF_ACTIVATE_CUSTOM_MIXER = int;
enum : int
{
    MF_ACTIVATE_CUSTOM_MIXER_ALLOWFAIL = 0x00000001,
}

alias MF_ACTIVATE_CUSTOM_PRESENTER = int;
enum : int
{
    MF_ACTIVATE_CUSTOM_PRESENTER_ALLOWFAIL = 0x00000001,
}

alias MFSHUTDOWN_STATUS = int;
enum : int
{
    MFSHUTDOWN_INITIATED = 0x00000000,
    MFSHUTDOWN_COMPLETED = 0x00000001,
}

enum IID_IMFShutdown = GUID(0x97ec2ea4, 0xe42, 0x4937, [0x97, 0xac, 0x9d, 0x6d, 0x32, 0x88, 0x24, 0xe1]);
interface IMFShutdown : IUnknown
{
    HRESULT Shutdown();
    HRESULT GetShutdownStatus(MFSHUTDOWN_STATUS*);
}
enum IID_IMFTopoLoader = GUID(0xde9a6157, 0xf660, 0x4643, [0xb5, 0x6a, 0xdf, 0x9f, 0x79, 0x98, 0xc7, 0xcd]);
interface IMFTopoLoader : IUnknown
{
    HRESULT Load(IMFTopology, IMFTopology*, IMFTopology);
}
enum IID_IMFContentProtectionManager = GUID(0xacf92459, 0x6a61, 0x42bd, [0xb5, 0x7c, 0xb4, 0x3e, 0x51, 0x20, 0x3c, 0xb0]);
interface IMFContentProtectionManager : IUnknown
{
    HRESULT BeginEnableContent(IMFActivate, IMFTopology, IMFAsyncCallback, IUnknown);
    HRESULT EndEnableContent(IMFAsyncResult);
}
alias MF_URL_TRUST_STATUS = int;
enum : int
{
    MF_LICENSE_URL_UNTRUSTED = 0x00000000,
    MF_LICENSE_URL_TRUSTED   = 0x00000001,
    MF_LICENSE_URL_TAMPERED  = 0x00000002,
}

enum IID_IMFContentEnabler = GUID(0xd3c4ef59, 0x49ce, 0x4381, [0x90, 0x71, 0xd5, 0xbc, 0xd0, 0x44, 0xc7, 0x70]);
interface IMFContentEnabler : IUnknown
{
    HRESULT GetEnableType(GUID*);
    HRESULT GetEnableURL(PWSTR*, uint*, MF_URL_TRUST_STATUS*);
    HRESULT GetEnableData(ubyte**, uint*);
    HRESULT IsAutomaticSupported(BOOL*);
    HRESULT AutomaticEnable();
    HRESULT MonitorEnable();
    HRESULT Cancel();
}
struct MFRR_COMPONENT_HASH_INFO
{
    uint ulReason;
    wchar[43] rgHeaderHash;
    wchar[43] rgPublicKeyHash;
    wchar[260] wszName;
}
struct MFRR_COMPONENTS
{
    uint dwRRInfoVersion;
    uint dwRRComponents;
    MFRR_COMPONENT_HASH_INFO* pRRComponents;
}
struct ASF_FLAT_PICTURE
{
    align (1):
    ubyte bPictureType;
    uint dwDataLen;
}
struct ASF_FLAT_SYNCHRONISED_LYRICS
{
    align (1):
    ubyte bTimeStampFormat;
    ubyte bContentType;
    uint dwLyricsLen;
}
enum IID_IMFMetadata = GUID(0xf88cfb8c, 0xef16, 0x4991, [0xb4, 0x50, 0xcb, 0x8c, 0x69, 0xe5, 0x17, 0x4]);
interface IMFMetadata : IUnknown
{
    HRESULT SetLanguage(const(wchar)*);
    HRESULT GetLanguage(PWSTR*);
    HRESULT GetAllLanguages(PROPVARIANT*);
    HRESULT SetProperty(const(wchar)*, const(PROPVARIANT)*);
    HRESULT GetProperty(const(wchar)*, PROPVARIANT*);
    HRESULT DeleteProperty(const(wchar)*);
    HRESULT GetAllPropertyNames(PROPVARIANT*);
}
enum IID_IMFMetadataProvider = GUID(0x56181d2d, 0xe221, 0x4adb, [0xb1, 0xc8, 0x3c, 0xee, 0x6a, 0x53, 0xf7, 0x6f]);
interface IMFMetadataProvider : IUnknown
{
    HRESULT GetMFMetadata(IMFPresentationDescriptor, uint, uint, IMFMetadata*);
}
alias MFRATE_DIRECTION = int;
enum : int
{
    MFRATE_FORWARD = 0x00000000,
    MFRATE_REVERSE = 0x00000001,
}

enum IID_IMFRateSupport = GUID(0xa9ccdbc, 0xd797, 0x4563, [0x96, 0x67, 0x94, 0xec, 0x5d, 0x79, 0x29, 0x2d]);
interface IMFRateSupport : IUnknown
{
    HRESULT GetSlowestRate(MFRATE_DIRECTION, BOOL, float*);
    HRESULT GetFastestRate(MFRATE_DIRECTION, BOOL, float*);
    HRESULT IsRateSupported(BOOL, float, float*);
}
enum IID_IMFRateControl = GUID(0x88ddcd21, 0x3c3, 0x4275, [0x91, 0xed, 0x55, 0xee, 0x39, 0x29, 0x32, 0x8f]);
interface IMFRateControl : IUnknown
{
    HRESULT SetRate(BOOL, float);
    HRESULT GetRate(BOOL*, float*);
}
enum IID_IMFTimecodeTranslate = GUID(0xab9d8661, 0xf7e8, 0x4ef4, [0x98, 0x61, 0x89, 0xf3, 0x34, 0xf9, 0x4e, 0x74]);
interface IMFTimecodeTranslate : IUnknown
{
    HRESULT BeginConvertTimecodeToHNS(const(PROPVARIANT)*, IMFAsyncCallback, IUnknown);
    HRESULT EndConvertTimecodeToHNS(IMFAsyncResult, long*);
    HRESULT BeginConvertHNSToTimecode(long, IMFAsyncCallback, IUnknown);
    HRESULT EndConvertHNSToTimecode(IMFAsyncResult, PROPVARIANT*);
}
enum IID_IMFSeekInfo = GUID(0x26afea53, 0xd9ed, 0x42b5, [0xab, 0x80, 0xe6, 0x4f, 0x9e, 0xe3, 0x47, 0x79]);
interface IMFSeekInfo : IUnknown
{
    HRESULT GetNearestKeyFrames(const(GUID)*, const(PROPVARIANT)*, PROPVARIANT*, PROPVARIANT*);
}
enum IID_IMFSimpleAudioVolume = GUID(0x89edf13, 0xcf71, 0x4338, [0x8d, 0x13, 0x9e, 0x56, 0x9d, 0xbd, 0xc3, 0x19]);
interface IMFSimpleAudioVolume : IUnknown
{
    HRESULT SetMasterVolume(float);
    HRESULT GetMasterVolume(float*);
    HRESULT SetMute(const(BOOL));
    HRESULT GetMute(BOOL*);
}
enum IID_IMFAudioStreamVolume = GUID(0x76b1bbdb, 0x4ec8, 0x4f36, [0xb1, 0x6, 0x70, 0xa9, 0x31, 0x6d, 0xf5, 0x93]);
interface IMFAudioStreamVolume : IUnknown
{
    HRESULT GetChannelCount(uint*);
    HRESULT SetChannelVolume(uint, const(float));
    HRESULT GetChannelVolume(uint, float*);
    HRESULT SetAllVolumes(uint, const(float)*);
    HRESULT GetAllVolumes(uint, float*);
}
enum IID_IMFAudioPolicy = GUID(0xa0638c2b, 0x6465, 0x4395, [0x9a, 0xe7, 0xa3, 0x21, 0xa9, 0xfd, 0x28, 0x56]);
interface IMFAudioPolicy : IUnknown
{
    HRESULT SetGroupingParam(const(GUID)*);
    HRESULT GetGroupingParam(GUID*);
    HRESULT SetDisplayName(const(wchar)*);
    HRESULT GetDisplayName(PWSTR*);
    HRESULT SetIconPath(const(wchar)*);
    HRESULT GetIconPath(PWSTR*);
}
enum IID_IMFSampleGrabberSinkCallback = GUID(0x8c7b80bf, 0xee42, 0x4b59, [0xb1, 0xdf, 0x55, 0x66, 0x8e, 0x1b, 0xdc, 0xa8]);
interface IMFSampleGrabberSinkCallback : IMFClockStateSink
{
    HRESULT OnSetPresentationClock(IMFPresentationClock);
    HRESULT OnProcessSample(const(GUID)*, uint, long, long, const(ubyte)*, uint);
    HRESULT OnShutdown();
}
enum IID_IMFSampleGrabberSinkCallback2 = GUID(0xca86aa50, 0xc46e, 0x429e, [0xab, 0x27, 0x16, 0xd6, 0xac, 0x68, 0x44, 0xcb]);
interface IMFSampleGrabberSinkCallback2 : IMFSampleGrabberSinkCallback
{
    HRESULT OnProcessSampleEx(const(GUID)*, uint, long, long, const(ubyte)*, uint, IMFAttributes);
}
enum IID_IMFWorkQueueServices = GUID(0x35fe1bb8, 0xa3a9, 0x40fe, [0xbb, 0xec, 0xeb, 0x56, 0x9c, 0x9c, 0xcc, 0xa3]);
interface IMFWorkQueueServices : IUnknown
{
    HRESULT BeginRegisterTopologyWorkQueuesWithMMCSS(IMFAsyncCallback, IUnknown);
    HRESULT EndRegisterTopologyWorkQueuesWithMMCSS(IMFAsyncResult);
    HRESULT BeginUnregisterTopologyWorkQueuesWithMMCSS(IMFAsyncCallback, IUnknown);
    HRESULT EndUnregisterTopologyWorkQueuesWithMMCSS(IMFAsyncResult);
    HRESULT GetTopologyWorkQueueMMCSSClass(uint, PWSTR, uint*);
    HRESULT GetTopologyWorkQueueMMCSSTaskId(uint, uint*);
    HRESULT BeginRegisterPlatformWorkQueueWithMMCSS(uint, const(wchar)*, uint, IMFAsyncCallback, IUnknown);
    HRESULT EndRegisterPlatformWorkQueueWithMMCSS(IMFAsyncResult, uint*);
    HRESULT BeginUnregisterPlatformWorkQueueWithMMCSS(uint, IMFAsyncCallback, IUnknown);
    HRESULT EndUnregisterPlatformWorkQueueWithMMCSS(IMFAsyncResult);
    HRESULT GetPlaftormWorkQueueMMCSSClass(uint, PWSTR, uint*);
    HRESULT GetPlatformWorkQueueMMCSSTaskId(uint, uint*);
}
enum IID_IMFWorkQueueServicesEx = GUID(0x96bf961b, 0x40fe, 0x42f1, [0xba, 0x9d, 0x32, 0x2, 0x38, 0xb4, 0x97, 0x0]);
interface IMFWorkQueueServicesEx : IMFWorkQueueServices
{
    HRESULT GetTopologyWorkQueueMMCSSPriority(uint, int*);
    HRESULT BeginRegisterPlatformWorkQueueWithMMCSSEx(uint, const(wchar)*, uint, int, IMFAsyncCallback, IUnknown);
    HRESULT GetPlatformWorkQueueMMCSSPriority(uint, int*);
}
alias MF_QUALITY_DROP_MODE = int;
enum : int
{
    MF_DROP_MODE_NONE = 0x00000000,
    MF_DROP_MODE_1    = 0x00000001,
    MF_DROP_MODE_2    = 0x00000002,
    MF_DROP_MODE_3    = 0x00000003,
    MF_DROP_MODE_4    = 0x00000004,
    MF_DROP_MODE_5    = 0x00000005,
    MF_NUM_DROP_MODES = 0x00000006,
}

alias MF_QUALITY_LEVEL = int;
enum : int
{
    MF_QUALITY_NORMAL         = 0x00000000,
    MF_QUALITY_NORMAL_MINUS_1 = 0x00000001,
    MF_QUALITY_NORMAL_MINUS_2 = 0x00000002,
    MF_QUALITY_NORMAL_MINUS_3 = 0x00000003,
    MF_QUALITY_NORMAL_MINUS_4 = 0x00000004,
    MF_QUALITY_NORMAL_MINUS_5 = 0x00000005,
    MF_NUM_QUALITY_LEVELS     = 0x00000006,
}

alias MF_QUALITY_ADVISE_FLAGS = int;
enum : int
{
    MF_QUALITY_CANNOT_KEEP_UP = 0x00000001,
}

enum IID_IMFQualityManager = GUID(0x8d009d86, 0x5b9f, 0x4115, [0xb1, 0xfc, 0x9f, 0x80, 0xd5, 0x2a, 0xb8, 0xab]);
interface IMFQualityManager : IUnknown
{
    HRESULT NotifyTopology(IMFTopology);
    HRESULT NotifyPresentationClock(IMFPresentationClock);
    HRESULT NotifyProcessInput(IMFTopologyNode, int, IMFSample);
    HRESULT NotifyProcessOutput(IMFTopologyNode, int, IMFSample);
    HRESULT NotifyQualityEvent(IUnknown, IMFMediaEvent);
    HRESULT Shutdown();
}
enum IID_IMFQualityAdvise = GUID(0xec15e2e9, 0xe36b, 0x4f7c, [0x87, 0x58, 0x77, 0xd4, 0x52, 0xef, 0x4c, 0xe7]);
interface IMFQualityAdvise : IUnknown
{
    HRESULT SetDropMode(MF_QUALITY_DROP_MODE);
    HRESULT SetQualityLevel(MF_QUALITY_LEVEL);
    HRESULT GetDropMode(MF_QUALITY_DROP_MODE*);
    HRESULT GetQualityLevel(MF_QUALITY_LEVEL*);
    HRESULT DropTime(long);
}
enum IID_IMFQualityAdvise2 = GUID(0xf3706f0d, 0x8ea2, 0x4886, [0x80, 0x0, 0x71, 0x55, 0xe9, 0xec, 0x2e, 0xae]);
interface IMFQualityAdvise2 : IMFQualityAdvise
{
    HRESULT NotifyQualityEvent(IMFMediaEvent, uint*);
}
enum IID_IMFQualityAdviseLimits = GUID(0xdfcd8e4d, 0x30b5, 0x4567, [0xac, 0xaa, 0x8e, 0xb5, 0xb7, 0x85, 0x3d, 0xc9]);
interface IMFQualityAdviseLimits : IUnknown
{
    HRESULT GetMaximumDropMode(MF_QUALITY_DROP_MODE*);
    HRESULT GetMinimumQualityLevel(MF_QUALITY_LEVEL*);
}
enum IID_IMFRealTimeClient = GUID(0x2347d60b, 0x3fb5, 0x480c, [0x88, 0x3, 0x8d, 0xf3, 0xad, 0xcd, 0x3e, 0xf0]);
interface IMFRealTimeClient : IUnknown
{
    HRESULT RegisterThreads(uint, const(wchar)*);
    HRESULT UnregisterThreads();
    HRESULT SetWorkQueue(uint);
}
enum IID_IMFRealTimeClientEx = GUID(0x3910848, 0xab16, 0x4611, [0xb1, 0x0, 0x17, 0xb8, 0x8a, 0xe2, 0xf2, 0x48]);
interface IMFRealTimeClientEx : IUnknown
{
    HRESULT RegisterThreadsEx(uint*, const(wchar)*, int);
    HRESULT UnregisterThreads();
    HRESULT SetWorkQueueEx(uint, int);
}
alias MFSequencerTopologyFlags = int;
enum : int
{
    SequencerTopologyFlags_Last = 0x00000001,
}

enum IID_IMFSequencerSource = GUID(0x197cd219, 0x19cb, 0x4de1, [0xa6, 0x4c, 0xac, 0xf2, 0xed, 0xcb, 0xe5, 0x9e]);
interface IMFSequencerSource : IUnknown
{
    HRESULT AppendTopology(IMFTopology, uint, uint*);
    HRESULT DeleteTopology(uint);
    HRESULT GetPresentationContext(IMFPresentationDescriptor, uint*, IMFTopology*);
    HRESULT UpdateTopology(uint, IMFTopology);
    HRESULT UpdateTopologyFlags(uint, uint);
}
enum IID_IMFMediaSourceTopologyProvider = GUID(0xe1d6009, 0xc9f3, 0x442d, [0x8c, 0x51, 0xa4, 0x2d, 0x2d, 0x49, 0x45, 0x2f]);
interface IMFMediaSourceTopologyProvider : IUnknown
{
    HRESULT GetMediaSourceTopology(IMFPresentationDescriptor, IMFTopology*);
}
enum IID_IMFMediaSourcePresentationProvider = GUID(0xe1d600a, 0xc9f3, 0x442d, [0x8c, 0x51, 0xa4, 0x2d, 0x2d, 0x49, 0x45, 0x2f]);
interface IMFMediaSourcePresentationProvider : IUnknown
{
    HRESULT ForceEndOfPresentation(IMFPresentationDescriptor);
}
struct MFTOPONODE_ATTRIBUTE_UPDATE
{
    ulong NodeId;
    GUID guidAttributeKey;
    MF_ATTRIBUTE_TYPE attrType;
    union
    {
        uint u32;
        ulong u64;
        double d;
    }
}
enum IID_IMFTopologyNodeAttributeEditor = GUID(0x676aa6dd, 0x238a, 0x410d, [0xbb, 0x99, 0x65, 0x66, 0x8d, 0x1, 0x60, 0x5a]);
interface IMFTopologyNodeAttributeEditor : IUnknown
{
    HRESULT UpdateNodeAttributes(ulong, uint, MFTOPONODE_ATTRIBUTE_UPDATE*);
}
struct MF_LEAKY_BUCKET_PAIR
{
    uint dwBitrate;
    uint msBufferWindow;
}
struct MFBYTESTREAM_BUFFERING_PARAMS
{
    ulong cbTotalFileSize;
    ulong cbPlayableDataSize;
    MF_LEAKY_BUCKET_PAIR* prgBuckets;
    uint cBuckets;
    ulong qwNetBufferingTime;
    ulong qwExtraBufferingTimeDuringSeek;
    ulong qwPlayDuration;
    float dRate;
}
enum IID_IMFByteStreamBuffering = GUID(0x6d66d782, 0x1d4f, 0x4db7, [0x8c, 0x63, 0xcb, 0x8c, 0x77, 0xf1, 0xef, 0x5e]);
interface IMFByteStreamBuffering : IUnknown
{
    HRESULT SetBufferingParams(MFBYTESTREAM_BUFFERING_PARAMS*);
    HRESULT EnableBuffering(BOOL);
    HRESULT StopBuffering();
}
enum IID_IMFByteStreamCacheControl = GUID(0xf5042ea4, 0x7a96, 0x4a75, [0xaa, 0x7b, 0x2b, 0xe1, 0xef, 0x7f, 0x88, 0xd5]);
interface IMFByteStreamCacheControl : IUnknown
{
    HRESULT StopBackgroundTransfer();
}
enum IID_IMFByteStreamTimeSeek = GUID(0x64976bfa, 0xfb61, 0x4041, [0x90, 0x69, 0x8c, 0x9a, 0x5f, 0x65, 0x9b, 0xeb]);
interface IMFByteStreamTimeSeek : IUnknown
{
    HRESULT IsTimeSeekSupported(BOOL*);
    HRESULT TimeSeek(ulong);
    HRESULT GetTimeSeekResult(ulong*, ulong*, ulong*);
}
struct MF_BYTE_STREAM_CACHE_RANGE
{
    ulong qwStartOffset;
    ulong qwEndOffset;
}
enum IID_IMFByteStreamCacheControl2 = GUID(0x71ce469c, 0xf34b, 0x49ea, [0xa5, 0x6b, 0x2d, 0x2a, 0x10, 0xe5, 0x11, 0x49]);
interface IMFByteStreamCacheControl2 : IMFByteStreamCacheControl
{
    HRESULT GetByteRanges(uint*, MF_BYTE_STREAM_CACHE_RANGE**);
    HRESULT SetCacheLimit(ulong);
    HRESULT IsBackgroundTransferActive(BOOL*);
}
enum IID_IMFNetCredential = GUID(0x5b87ef6a, 0x7ed8, 0x434f, [0xba, 0xe, 0x18, 0x4f, 0xac, 0x16, 0x28, 0xd1]);
interface IMFNetCredential : IUnknown
{
    HRESULT SetUser(ubyte*, uint, BOOL);
    HRESULT SetPassword(ubyte*, uint, BOOL);
    HRESULT GetUser(ubyte*, uint*, BOOL);
    HRESULT GetPassword(ubyte*, uint*, BOOL);
    HRESULT LoggedOnUser(BOOL*);
}
struct MFNetCredentialManagerGetParam
{
    HRESULT hrOp;
    BOOL fAllowLoggedOnUser;
    BOOL fClearTextPackage;
    const(wchar)* pszUrl;
    const(wchar)* pszSite;
    const(wchar)* pszRealm;
    const(wchar)* pszPackage;
    int nRetries;
}
enum IID_IMFNetCredentialManager = GUID(0x5b87ef6b, 0x7ed8, 0x434f, [0xba, 0xe, 0x18, 0x4f, 0xac, 0x16, 0x28, 0xd1]);
interface IMFNetCredentialManager : IUnknown
{
    HRESULT BeginGetCredentials(MFNetCredentialManagerGetParam*, IMFAsyncCallback, IUnknown);
    HRESULT EndGetCredentials(IMFAsyncResult, IMFNetCredential*);
    HRESULT SetGood(IMFNetCredential, BOOL);
}
alias MFNetCredentialRequirements = int;
enum : int
{
    REQUIRE_PROMPT        = 0x00000001,
    REQUIRE_SAVE_SELECTED = 0x00000002,
}

alias MFNetCredentialOptions = int;
enum : int
{
    MFNET_CREDENTIAL_SAVE             = 0x00000001,
    MFNET_CREDENTIAL_DONT_CACHE       = 0x00000002,
    MFNET_CREDENTIAL_ALLOW_CLEAR_TEXT = 0x00000004,
}

alias MFNetAuthenticationFlags = int;
enum : int
{
    MFNET_AUTHENTICATION_PROXY          = 0x00000001,
    MFNET_AUTHENTICATION_CLEAR_TEXT     = 0x00000002,
    MFNET_AUTHENTICATION_LOGGED_ON_USER = 0x00000004,
}

enum IID_IMFNetCredentialCache = GUID(0x5b87ef6c, 0x7ed8, 0x434f, [0xba, 0xe, 0x18, 0x4f, 0xac, 0x16, 0x28, 0xd1]);
interface IMFNetCredentialCache : IUnknown
{
    HRESULT GetCredential(const(wchar)*, const(wchar)*, uint, IMFNetCredential*, uint*);
    HRESULT SetGood(IMFNetCredential, BOOL);
    HRESULT SetUserOptions(IMFNetCredential, uint);
}
enum IID_IMFSSLCertificateManager = GUID(0x61f7d887, 0x1230, 0x4a8b, [0xae, 0xba, 0x8a, 0xd4, 0x34, 0xd1, 0xa6, 0x4d]);
interface IMFSSLCertificateManager : IUnknown
{
    HRESULT GetClientCertificate(const(wchar)*, ubyte**, uint*);
    HRESULT BeginGetClientCertificate(const(wchar)*, IMFAsyncCallback, IUnknown);
    HRESULT EndGetClientCertificate(IMFAsyncResult, ubyte**, uint*);
    HRESULT GetCertificatePolicy(const(wchar)*, BOOL*, BOOL*);
    HRESULT OnServerCertificate(const(wchar)*, ubyte*, uint, BOOL*);
}
enum IID_IMFNetResourceFilter = GUID(0x91878a3, 0xbf11, 0x4a5c, [0xbc, 0x9f, 0x33, 0x99, 0x5b, 0x6, 0xef, 0x2d]);
interface IMFNetResourceFilter : IUnknown
{
    HRESULT OnRedirect(const(wchar)*, short*);
    HRESULT OnSendingRequest(const(wchar)*);
}
enum IID_IMFSourceOpenMonitor = GUID(0x59054b3, 0x27c, 0x494c, [0xa2, 0x7d, 0x91, 0x13, 0x29, 0x1c, 0xf8, 0x7f]);
interface IMFSourceOpenMonitor : IUnknown
{
    HRESULT OnSourceEvent(IMFMediaEvent);
}
enum IID_IMFNetProxyLocator = GUID(0xe9cd0383, 0xa268, 0x4bb4, [0x82, 0xde, 0x65, 0x8d, 0x53, 0x57, 0x4d, 0x41]);
interface IMFNetProxyLocator : IUnknown
{
    HRESULT FindFirstProxy(const(wchar)*, const(wchar)*, BOOL);
    HRESULT FindNextProxy();
    HRESULT RegisterProxyResult(HRESULT);
    HRESULT GetCurrentProxy(PWSTR, uint*);
    HRESULT Clone(IMFNetProxyLocator*);
}
enum IID_IMFNetProxyLocatorFactory = GUID(0xe9cd0384, 0xa268, 0x4bb4, [0x82, 0xde, 0x65, 0x8d, 0x53, 0x57, 0x4d, 0x41]);
interface IMFNetProxyLocatorFactory : IUnknown
{
    HRESULT CreateProxyLocator(const(wchar)*, IMFNetProxyLocator*);
}
enum IID_IMFSaveJob = GUID(0xe9931663, 0x80bf, 0x4c6e, [0x98, 0xaf, 0x5d, 0xcf, 0x58, 0x74, 0x7d, 0x1f]);
interface IMFSaveJob : IUnknown
{
    HRESULT BeginSave(IMFByteStream, IMFAsyncCallback, IUnknown);
    HRESULT EndSave(IMFAsyncResult);
    HRESULT CancelSave();
    HRESULT GetProgress(uint*);
}
alias MFNETSOURCE_PROTOCOL_TYPE = int;
enum : int
{
    MFNETSOURCE_UNDEFINED = 0x00000000,
    MFNETSOURCE_HTTP      = 0x00000001,
    MFNETSOURCE_RTSP      = 0x00000002,
    MFNETSOURCE_FILE      = 0x00000003,
    MFNETSOURCE_MULTICAST = 0x00000004,
}

enum IID_IMFNetSchemeHandlerConfig = GUID(0x7be19e73, 0xc9bf, 0x468a, [0xac, 0x5a, 0xa5, 0xe8, 0x65, 0x3b, 0xec, 0x87]);
interface IMFNetSchemeHandlerConfig : IUnknown
{
    HRESULT GetNumberOfSupportedProtocols(uint*);
    HRESULT GetSupportedProtocolType(uint, MFNETSOURCE_PROTOCOL_TYPE*);
    HRESULT ResetProtocolRolloverSettings();
}
alias MFNETSOURCE_TRANSPORT_TYPE = int;
enum : int
{
    MFNETSOURCE_UDP = 0x00000000,
    MFNETSOURCE_TCP = 0x00000001,
}

alias MFNETSOURCE_CACHE_STATE = int;
enum : int
{
    MFNETSOURCE_CACHE_UNAVAILABLE     = 0x00000000,
    MFNETSOURCE_CACHE_ACTIVE_WRITING  = 0x00000001,
    MFNETSOURCE_CACHE_ACTIVE_COMPLETE = 0x00000002,
}

alias MFNETSOURCE_STATISTICS_IDS = int;
enum : int
{
    MFNETSOURCE_RECVPACKETS_ID              = 0x00000000,
    MFNETSOURCE_LOSTPACKETS_ID              = 0x00000001,
    MFNETSOURCE_RESENDSREQUESTED_ID         = 0x00000002,
    MFNETSOURCE_RESENDSRECEIVED_ID          = 0x00000003,
    MFNETSOURCE_RECOVEREDBYECCPACKETS_ID    = 0x00000004,
    MFNETSOURCE_RECOVEREDBYRTXPACKETS_ID    = 0x00000005,
    MFNETSOURCE_OUTPACKETS_ID               = 0x00000006,
    MFNETSOURCE_RECVRATE_ID                 = 0x00000007,
    MFNETSOURCE_AVGBANDWIDTHBPS_ID          = 0x00000008,
    MFNETSOURCE_BYTESRECEIVED_ID            = 0x00000009,
    MFNETSOURCE_PROTOCOL_ID                 = 0x0000000a,
    MFNETSOURCE_TRANSPORT_ID                = 0x0000000b,
    MFNETSOURCE_CACHE_STATE_ID              = 0x0000000c,
    MFNETSOURCE_LINKBANDWIDTH_ID            = 0x0000000d,
    MFNETSOURCE_CONTENTBITRATE_ID           = 0x0000000e,
    MFNETSOURCE_SPEEDFACTOR_ID              = 0x0000000f,
    MFNETSOURCE_BUFFERSIZE_ID               = 0x00000010,
    MFNETSOURCE_BUFFERPROGRESS_ID           = 0x00000011,
    MFNETSOURCE_LASTBWSWITCHTS_ID           = 0x00000012,
    MFNETSOURCE_SEEKRANGESTART_ID           = 0x00000013,
    MFNETSOURCE_SEEKRANGEEND_ID             = 0x00000014,
    MFNETSOURCE_BUFFERINGCOUNT_ID           = 0x00000015,
    MFNETSOURCE_INCORRECTLYSIGNEDPACKETS_ID = 0x00000016,
    MFNETSOURCE_SIGNEDSESSION_ID            = 0x00000017,
    MFNETSOURCE_MAXBITRATE_ID               = 0x00000018,
    MFNETSOURCE_RECEPTION_QUALITY_ID        = 0x00000019,
    MFNETSOURCE_RECOVEREDPACKETS_ID         = 0x0000001a,
    MFNETSOURCE_VBR_ID                      = 0x0000001b,
    MFNETSOURCE_DOWNLOADPROGRESS_ID         = 0x0000001c,
    MFNETSOURCE_UNPREDEFINEDPROTOCOLNAME_ID = 0x0000001d,
}

alias MFNET_PROXYSETTINGS = int;
enum : int
{
    MFNET_PROXYSETTING_NONE    = 0x00000000,
    MFNET_PROXYSETTING_MANUAL  = 0x00000001,
    MFNET_PROXYSETTING_AUTO    = 0x00000002,
    MFNET_PROXYSETTING_BROWSER = 0x00000003,
}

enum IID_IMFSchemeHandler = GUID(0x6d4c7b74, 0x52a0, 0x4bb7, [0xb0, 0xdb, 0x55, 0xf2, 0x9f, 0x47, 0xa6, 0x68]);
interface IMFSchemeHandler : IUnknown
{
    HRESULT BeginCreateObject(const(wchar)*, uint, IPropertyStore, IUnknown*, IMFAsyncCallback, IUnknown);
    HRESULT EndCreateObject(IMFAsyncResult, MF_OBJECT_TYPE*, IUnknown*);
    HRESULT CancelObjectCreation(IUnknown);
}
enum IID_IMFByteStreamHandler = GUID(0xbb420aa4, 0x765b, 0x4a1f, [0x91, 0xfe, 0xd6, 0xa8, 0xa1, 0x43, 0x92, 0x4c]);
interface IMFByteStreamHandler : IUnknown
{
    HRESULT BeginCreateObject(IMFByteStream, const(wchar)*, uint, IPropertyStore, IUnknown*, IMFAsyncCallback, IUnknown);
    HRESULT EndCreateObject(IMFAsyncResult, MF_OBJECT_TYPE*, IUnknown*);
    HRESULT CancelObjectCreation(IUnknown);
    HRESULT GetMaxNumberOfBytesRequiredForResolution(ulong*);
}
enum IID_IMFTrustedInput = GUID(0x542612c4, 0xa1b8, 0x4632, [0xb5, 0x21, 0xde, 0x11, 0xea, 0x64, 0xa0, 0xb0]);
interface IMFTrustedInput : IUnknown
{
    HRESULT GetInputTrustAuthority(uint, const(GUID)*, IUnknown*);
}
alias MFPOLICYMANAGER_ACTION = int;
enum : int
{
    PEACTION_NO        = 0x00000000,
    PEACTION_PLAY      = 0x00000001,
    PEACTION_COPY      = 0x00000002,
    PEACTION_EXPORT    = 0x00000003,
    PEACTION_EXTRACT   = 0x00000004,
    PEACTION_RESERVED1 = 0x00000005,
    PEACTION_RESERVED2 = 0x00000006,
    PEACTION_RESERVED3 = 0x00000007,
    PEACTION_LAST      = 0x00000007,
}

struct MFINPUTTRUSTAUTHORITY_ACCESS_ACTION
{
    MFPOLICYMANAGER_ACTION Action;
    ubyte* pbTicket;
    uint cbTicket;
}
struct MFINPUTTRUSTAUTHORITY_ACCESS_PARAMS
{
    uint dwSize;
    uint dwVer;
    uint cbSignatureOffset;
    uint cbSignatureSize;
    uint cbExtensionOffset;
    uint cbExtensionSize;
    uint cActions;
    MFINPUTTRUSTAUTHORITY_ACCESS_ACTION[1] rgOutputActions;
}
enum IID_IMFInputTrustAuthority = GUID(0xd19f8e98, 0xb126, 0x4446, [0x89, 0xc, 0x5d, 0xcb, 0x7a, 0xd7, 0x14, 0x53]);
interface IMFInputTrustAuthority : IUnknown
{
    HRESULT GetDecrypter(const(GUID)*, void**);
    HRESULT RequestAccess(MFPOLICYMANAGER_ACTION, IMFActivate*);
    HRESULT GetPolicy(MFPOLICYMANAGER_ACTION, IMFOutputPolicy*);
    HRESULT BindAccess(MFINPUTTRUSTAUTHORITY_ACCESS_PARAMS*);
    HRESULT UpdateAccess(MFINPUTTRUSTAUTHORITY_ACCESS_PARAMS*);
    HRESULT Reset();
}
enum IID_IMFTrustedOutput = GUID(0xd19f8e95, 0xb126, 0x4446, [0x89, 0xc, 0x5d, 0xcb, 0x7a, 0xd7, 0x14, 0x53]);
interface IMFTrustedOutput : IUnknown
{
    HRESULT GetOutputTrustAuthorityCount(uint*);
    HRESULT GetOutputTrustAuthorityByIndex(uint, IMFOutputTrustAuthority*);
    HRESULT IsFinal(BOOL*);
}
enum IID_IMFOutputTrustAuthority = GUID(0xd19f8e94, 0xb126, 0x4446, [0x89, 0xc, 0x5d, 0xcb, 0x7a, 0xd7, 0x14, 0x53]);
interface IMFOutputTrustAuthority : IUnknown
{
    HRESULT GetAction(MFPOLICYMANAGER_ACTION*);
    HRESULT SetPolicy(IMFOutputPolicy*, uint, ubyte**, uint*);
}
enum IID_IMFOutputPolicy = GUID(0x7f00f10a, 0xdaed, 0x41af, [0xab, 0x26, 0x5f, 0xdf, 0xa4, 0xdf, 0xba, 0x3c]);
interface IMFOutputPolicy : IMFAttributes
{
    HRESULT GenerateRequiredSchemas(uint, GUID, GUID*, uint, IMFCollection*);
    HRESULT GetOriginatorID(GUID*);
    HRESULT GetMinimumGRLVersion(uint*);
}
enum IID_IMFOutputSchema = GUID(0x7be0fc5b, 0xabd9, 0x44fb, [0xa5, 0xc8, 0xf5, 0x1, 0x36, 0xe7, 0x15, 0x99]);
interface IMFOutputSchema : IMFAttributes
{
    HRESULT GetSchemaType(GUID*);
    HRESULT GetConfigurationData(uint*);
    HRESULT GetOriginatorID(GUID*);
}
alias MF_OPM_CGMSA_PROTECTION_LEVEL = int;
enum : int
{
    MF_OPM_CGMSA_OFF                             = 0x00000000,
    MF_OPM_CGMSA_COPY_FREELY                     = 0x00000001,
    MF_OPM_CGMSA_COPY_NO_MORE                    = 0x00000002,
    MF_OPM_CGMSA_COPY_ONE_GENERATION             = 0x00000003,
    MF_OPM_CGMSA_COPY_NEVER                      = 0x00000004,
    MF_OPM_CGMSA_REDISTRIBUTION_CONTROL_REQUIRED = 0x00000008,
}

alias MF_OPM_ACP_PROTECTION_LEVEL = int;
enum : int
{
    MF_OPM_ACP_OFF         = 0x00000000,
    MF_OPM_ACP_LEVEL_ONE   = 0x00000001,
    MF_OPM_ACP_LEVEL_TWO   = 0x00000002,
    MF_OPM_ACP_LEVEL_THREE = 0x00000003,
    MF_OPM_ACP_FORCE_ULONG = 0x7fffffff,
}

alias MFAudioConstriction = int;
enum : int
{
    MFaudioConstrictionOff   = 0x00000000,
    MFaudioConstriction48_16 = 0x00000001,
    MFaudioConstriction44_16 = 0x00000002,
    MFaudioConstriction14_14 = 0x00000003,
    MFaudioConstrictionMute  = 0x00000004,
}

enum IID_IMFSecureChannel = GUID(0xd0ae555d, 0x3b12, 0x4d97, [0xb0, 0x60, 0x9, 0x90, 0xbc, 0x5a, 0xeb, 0x67]);
interface IMFSecureChannel : IUnknown
{
    HRESULT GetCertificate(ubyte**, uint*);
    HRESULT SetupSession(ubyte*, uint);
}
alias SAMPLE_PROTECTION_VERSION = int;
enum : int
{
    SAMPLE_PROTECTION_VERSION_NO         = 0x00000000,
    SAMPLE_PROTECTION_VERSION_BASIC_LOKI = 0x00000001,
    SAMPLE_PROTECTION_VERSION_SCATTER    = 0x00000002,
    SAMPLE_PROTECTION_VERSION_RC4        = 0x00000003,
    SAMPLE_PROTECTION_VERSION_AES128CTR  = 0x00000004,
}

enum IID_IMFSampleProtection = GUID(0x8e36395f, 0xc7b9, 0x43c4, [0xa5, 0x4d, 0x51, 0x2b, 0x4a, 0xf6, 0x3c, 0x95]);
interface IMFSampleProtection : IUnknown
{
    HRESULT GetInputProtectionVersion(uint*);
    HRESULT GetOutputProtectionVersion(uint*);
    HRESULT GetProtectionCertificate(uint, ubyte**, uint*);
    HRESULT InitOutputProtection(uint, uint, ubyte*, uint, ubyte**, uint*);
    HRESULT InitInputProtection(uint, uint, ubyte*, uint);
}
enum IID_IMFMediaSinkPreroll = GUID(0x5dfd4b2a, 0x7674, 0x4110, [0xa4, 0xe6, 0x8a, 0x68, 0xfd, 0x5f, 0x36, 0x88]);
interface IMFMediaSinkPreroll : IUnknown
{
    HRESULT NotifyPreroll(long);
}
enum IID_IMFFinalizableMediaSink = GUID(0xeaecb74a, 0x9a50, 0x42ce, [0x95, 0x41, 0x6a, 0x7f, 0x57, 0xaa, 0x4a, 0xd7]);
interface IMFFinalizableMediaSink : IMFMediaSink
{
    HRESULT BeginFinalize(IMFAsyncCallback, IUnknown);
    HRESULT EndFinalize(IMFAsyncResult);
}
enum IID_IMFStreamingSinkConfig = GUID(0x9db7aa41, 0x3cc5, 0x40d4, [0x85, 0x9, 0x55, 0x58, 0x4, 0xad, 0x34, 0xcc]);
interface IMFStreamingSinkConfig : IUnknown
{
    HRESULT StartStreaming(BOOL, ulong);
}
enum IID_IMFRemoteProxy = GUID(0x994e23ad, 0x1cc2, 0x493c, [0xb9, 0xfa, 0x46, 0xf1, 0xcb, 0x4, 0xf, 0xa4]);
interface IMFRemoteProxy : IUnknown
{
    HRESULT GetRemoteObject(const(GUID)*, void**);
    HRESULT GetRemoteHost(const(GUID)*, void**);
}
enum IID_IMFObjectReferenceStream = GUID(0x9ef5be3, 0xc8a7, 0x469e, [0x8b, 0x70, 0x73, 0xbf, 0x25, 0xbb, 0x19, 0x3f]);
interface IMFObjectReferenceStream : IUnknown
{
    HRESULT SaveReference(const(GUID)*, IUnknown);
    HRESULT LoadReference(const(GUID)*, void**);
}
enum IID_IMFPMPHost = GUID(0xf70ca1a9, 0xfdc7, 0x4782, [0xb9, 0x94, 0xad, 0xff, 0xb1, 0xc9, 0x86, 0x6]);
interface IMFPMPHost : IUnknown
{
    HRESULT LockProcess();
    HRESULT UnlockProcess();
    HRESULT CreateObjectByCLSID(const(GUID)*, IStream, const(GUID)*, void**);
}
enum IID_IMFPMPClient = GUID(0x6c4e655d, 0xead8, 0x4421, [0xb6, 0xb9, 0x54, 0xdc, 0xdb, 0xbd, 0xf8, 0x20]);
interface IMFPMPClient : IUnknown
{
    HRESULT SetPMPHost(IMFPMPHost);
}
enum IID_IMFPMPServer = GUID(0x994e23af, 0x1cc2, 0x493c, [0xb9, 0xfa, 0x46, 0xf1, 0xcb, 0x4, 0xf, 0xa4]);
interface IMFPMPServer : IUnknown
{
    HRESULT LockProcess();
    HRESULT UnlockProcess();
    HRESULT CreateObjectByCLSID(const(GUID)*, const(GUID)*, void**);
}
enum IID_IMFRemoteDesktopPlugin = GUID(0x1cde6309, 0xcae0, 0x4940, [0x90, 0x7e, 0xc1, 0xec, 0x9c, 0x3d, 0x1d, 0x4a]);
interface IMFRemoteDesktopPlugin : IUnknown
{
    HRESULT UpdateTopology(IMFTopology);
}
enum IID_IMFSAMIStyle = GUID(0xa7e025dd, 0x5303, 0x4a62, [0x89, 0xd6, 0xe7, 0x47, 0xe1, 0xef, 0xac, 0x73]);
interface IMFSAMIStyle : IUnknown
{
    HRESULT GetStyleCount(uint*);
    HRESULT GetStyles(PROPVARIANT*);
    HRESULT SetSelectedStyle(const(wchar)*);
    HRESULT GetSelectedStyle(PWSTR*);
}
enum IID_IMFTranscodeProfile = GUID(0x4adfdba3, 0x7ab0, 0x4953, [0xa6, 0x2b, 0x46, 0x1e, 0x7f, 0xf3, 0xda, 0x1e]);
interface IMFTranscodeProfile : IUnknown
{
    HRESULT SetAudioAttributes(IMFAttributes);
    HRESULT GetAudioAttributes(IMFAttributes*);
    HRESULT SetVideoAttributes(IMFAttributes);
    HRESULT GetVideoAttributes(IMFAttributes*);
    HRESULT SetContainerAttributes(IMFAttributes);
    HRESULT GetContainerAttributes(IMFAttributes*);
}
alias MF_TRANSCODE_TOPOLOGYMODE_FLAGS = int;
enum : int
{
    MF_TRANSCODE_TOPOLOGYMODE_SOFTWARE_ONLY    = 0x00000000,
    MF_TRANSCODE_TOPOLOGYMODE_HARDWARE_ALLOWED = 0x00000001,
}

alias MF_TRANSCODE_ADJUST_PROFILE_FLAGS = int;
enum : int
{
    MF_TRANSCODE_ADJUST_PROFILE_DEFAULT               = 0x00000000,
    MF_TRANSCODE_ADJUST_PROFILE_USE_SOURCE_ATTRIBUTES = 0x00000001,
}

alias MF_VIDEO_PROCESSOR_ALGORITHM_TYPE = int;
enum : int
{
    MF_VIDEO_PROCESSOR_ALGORITHM_DEFAULT     = 0x00000000,
    MF_VIDEO_PROCESSOR_ALGORITHM_MRF_CRF_444 = 0x00000001,
}

struct MF_TRANSCODE_SINK_INFO
{
    uint dwVideoStreamID;
    IMFMediaType pVideoMediaType;
    uint dwAudioStreamID;
    IMFMediaType pAudioMediaType;
}
enum IID_IMFTranscodeSinkInfoProvider = GUID(0x8cffcd2e, 0x5a03, 0x4a3a, [0xaf, 0xf7, 0xed, 0xcd, 0x10, 0x7c, 0x62, 0xe]);
interface IMFTranscodeSinkInfoProvider : IUnknown
{
    HRESULT SetOutputFile(const(wchar)*);
    HRESULT SetOutputByteStream(IMFActivate);
    HRESULT SetProfile(IMFTranscodeProfile);
    HRESULT GetSinkInfo(MF_TRANSCODE_SINK_INFO*);
}
enum IID_IMFFieldOfUseMFTUnlock = GUID(0x508e71d3, 0xec66, 0x4fc3, [0x87, 0x75, 0xb4, 0xb9, 0xed, 0x6b, 0xa8, 0x47]);
interface IMFFieldOfUseMFTUnlock : IUnknown
{
    HRESULT Unlock(IUnknown);
}
struct MFT_REGISTRATION_INFO
{
    GUID clsid;
    GUID guidCategory;
    uint uiFlags;
    const(wchar)* pszName;
    uint cInTypes;
    MFT_REGISTER_TYPE_INFO* pInTypes;
    uint cOutTypes;
    MFT_REGISTER_TYPE_INFO* pOutTypes;
}
enum IID_IMFLocalMFTRegistration = GUID(0x149c4d73, 0xb4be, 0x4f8d, [0x8b, 0x87, 0x7, 0x9e, 0x92, 0x6b, 0x6a, 0xdd]);
interface IMFLocalMFTRegistration : IUnknown
{
    HRESULT RegisterMFTs(MFT_REGISTRATION_INFO*, uint);
}
enum IID_IMFCapturePhotoConfirmation = GUID(0x19f68549, 0xca8a, 0x4706, [0xa4, 0xef, 0x48, 0x1d, 0xbc, 0x95, 0xe1, 0x2c]);
interface IMFCapturePhotoConfirmation : IUnknown
{
    HRESULT SetPhotoConfirmationCallback(IMFAsyncCallback);
    HRESULT SetPixelFormat(GUID);
    HRESULT GetPixelFormat(GUID*);
}
enum IID_IMFPMPHostApp = GUID(0x84d2054a, 0x3aa1, 0x4728, [0xa3, 0xb0, 0x44, 0xa, 0x41, 0x8c, 0xf4, 0x9c]);
interface IMFPMPHostApp : IUnknown
{
    HRESULT LockProcess();
    HRESULT UnlockProcess();
    HRESULT ActivateClassById(const(wchar)*, IStream, const(GUID)*, void**);
}
enum IID_IMFPMPClientApp = GUID(0xc004f646, 0xbe2c, 0x48f3, [0x93, 0xa2, 0xa0, 0x98, 0x3e, 0xba, 0x11, 0x8]);
interface IMFPMPClientApp : IUnknown
{
    HRESULT SetPMPHost(IMFPMPHostApp);
}
enum IID_IMFMediaStreamSourceSampleRequest = GUID(0x380b9af9, 0xa85b, 0x4e78, [0xa2, 0xaf, 0xea, 0x5c, 0xe6, 0x45, 0xc6, 0xb4]);
interface IMFMediaStreamSourceSampleRequest : IUnknown
{
    HRESULT SetSample(IMFSample);
}
enum IID_IMFTrackedSample = GUID(0x245bf8e9, 0x755, 0x40f7, [0x88, 0xa5, 0xae, 0xf, 0x18, 0xd5, 0x5e, 0x17]);
interface IMFTrackedSample : IUnknown
{
    HRESULT SetAllocator(IMFAsyncCallback, IUnknown);
}
enum IID_IMFProtectedEnvironmentAccess = GUID(0xef5dc845, 0xf0d9, 0x4ec9, [0xb0, 0xc, 0xcb, 0x51, 0x83, 0xd3, 0x84, 0x34]);
interface IMFProtectedEnvironmentAccess : IUnknown
{
    HRESULT Call(uint, const(ubyte)*, uint, ubyte*);
    HRESULT ReadGRL(uint*, ubyte**);
}
enum IID_IMFSignedLibrary = GUID(0x4a724bca, 0xff6a, 0x4c07, [0x8e, 0xd, 0x7a, 0x35, 0x84, 0x21, 0xcf, 0x6]);
interface IMFSignedLibrary : IUnknown
{
    HRESULT GetProcedureAddress(const(char)*, void**);
}
enum IID_IMFSystemId = GUID(0xfff4af3a, 0x1fc1, 0x4ef9, [0xa2, 0x9b, 0xd2, 0x6c, 0x49, 0xe2, 0xf3, 0x1a]);
interface IMFSystemId : IUnknown
{
    HRESULT GetData(uint*, ubyte**);
    HRESULT Setup(uint, uint, const(ubyte)*, uint*, ubyte**);
}
struct MFCONTENTPROTECTIONDEVICE_INPUT_DATA
{
    uint HWProtectionFunctionID;
    uint PrivateDataByteCount;
    uint HWProtectionDataByteCount;
    uint Reserved;
    ubyte[4] InputData;
}
struct MFCONTENTPROTECTIONDEVICE_OUTPUT_DATA
{
    uint PrivateDataByteCount;
    uint MaxHWProtectionDataByteCount;
    uint HWProtectionDataByteCount;
    HRESULT Status;
    long TransportTimeInHundredsOfNanoseconds;
    long ExecutionTimeInHundredsOfNanoseconds;
    ubyte[4] OutputData;
}
struct MFCONTENTPROTECTIONDEVICE_REALTIMECLIENT_DATA
{
    uint TaskIndex;
    wchar[260] ClassName;
    int BasePriority;
}
enum IID_IMFContentProtectionDevice = GUID(0xe6257174, 0xa060, 0x4c9a, [0xa0, 0x88, 0x3b, 0x1b, 0x47, 0x1c, 0xad, 0x28]);
interface IMFContentProtectionDevice : IUnknown
{
    HRESULT InvokeFunction(uint, uint, const(ubyte)*, uint*, ubyte*);
    HRESULT GetPrivateDataByteCount(uint*, uint*);
}
enum IID_IMFContentDecryptorContext = GUID(0x7ec4b1bd, 0x43fb, 0x4763, [0x85, 0xd2, 0x64, 0xfc, 0xb5, 0xc5, 0xf4, 0xcb]);
interface IMFContentDecryptorContext : IUnknown
{
    HRESULT InitializeHardwareKey(uint, const(void)*, ulong*);
}
alias MF_MEDIAKEYSESSION_TYPE = int;
enum : int
{
    MF_MEDIAKEYSESSION_TYPE_TEMPORARY                  = 0x00000000,
    MF_MEDIAKEYSESSION_TYPE_PERSISTENT_LICENSE         = 0x00000001,
    MF_MEDIAKEYSESSION_TYPE_PERSISTENT_RELEASE_MESSAGE = 0x00000002,
    MF_MEDIAKEYSESSION_TYPE_PERSISTENT_USAGE_RECORD    = 0x00000003,
}

alias MF_MEDIAKEY_STATUS = int;
enum : int
{
    MF_MEDIAKEY_STATUS_USABLE             = 0x00000000,
    MF_MEDIAKEY_STATUS_EXPIRED            = 0x00000001,
    MF_MEDIAKEY_STATUS_OUTPUT_DOWNSCALED  = 0x00000002,
    MF_MEDIAKEY_STATUS_OUTPUT_NOT_ALLOWED = 0x00000003,
    MF_MEDIAKEY_STATUS_STATUS_PENDING     = 0x00000004,
    MF_MEDIAKEY_STATUS_INTERNAL_ERROR     = 0x00000005,
    MF_MEDIAKEY_STATUS_RELEASED           = 0x00000006,
    MF_MEDIAKEY_STATUS_OUTPUT_RESTRICTED  = 0x00000007,
}

struct MFMediaKeyStatus
{
    ubyte* pbKeyId;
    uint cbKeyId;
    MF_MEDIAKEY_STATUS eMediaKeyStatus;
}
alias MF_MEDIAKEYSESSION_MESSAGETYPE = int;
enum : int
{
    MF_MEDIAKEYSESSION_MESSAGETYPE_LICENSE_REQUEST           = 0x00000000,
    MF_MEDIAKEYSESSION_MESSAGETYPE_LICENSE_RENEWAL           = 0x00000001,
    MF_MEDIAKEYSESSION_MESSAGETYPE_LICENSE_RELEASE           = 0x00000002,
    MF_MEDIAKEYSESSION_MESSAGETYPE_INDIVIDUALIZATION_REQUEST = 0x00000003,
}

alias MF_CROSS_ORIGIN_POLICY = int;
enum : int
{
    MF_CROSS_ORIGIN_POLICY_NONE            = 0x00000000,
    MF_CROSS_ORIGIN_POLICY_ANONYMOUS       = 0x00000001,
    MF_CROSS_ORIGIN_POLICY_USE_CREDENTIALS = 0x00000002,
}

enum IID_IMFNetCrossOriginSupport = GUID(0xbc2b7d44, 0xa72d, 0x49d5, [0x83, 0x76, 0x14, 0x80, 0xde, 0xe5, 0x8b, 0x22]);
interface IMFNetCrossOriginSupport : IUnknown
{
    HRESULT GetCrossOriginPolicy(MF_CROSS_ORIGIN_POLICY*);
    HRESULT GetSourceOrigin(PWSTR*);
    HRESULT IsSameOrigin(const(wchar)*, BOOL*);
}
enum IID_IMFHttpDownloadRequest = GUID(0xf779fddf, 0x26e7, 0x4270, [0x8a, 0x8b, 0xb9, 0x83, 0xd1, 0x85, 0x9d, 0xe0]);
interface IMFHttpDownloadRequest : IUnknown
{
    HRESULT AddHeader(const(wchar)*);
    HRESULT BeginSendRequest(const(ubyte)*, uint, IMFAsyncCallback, IUnknown);
    HRESULT EndSendRequest(IMFAsyncResult);
    HRESULT BeginReceiveResponse(IMFAsyncCallback, IUnknown);
    HRESULT EndReceiveResponse(IMFAsyncResult);
    HRESULT BeginReadPayload(ubyte*, uint, IMFAsyncCallback, IUnknown);
    HRESULT EndReadPayload(IMFAsyncResult, ulong*, uint*);
    HRESULT QueryHeader(const(wchar)*, uint, PWSTR*);
    HRESULT GetURL(PWSTR*);
    HRESULT HasNullSourceOrigin(BOOL*);
    HRESULT GetTimeSeekResult(ulong*, ulong*, ulong*);
    HRESULT GetHttpStatus(uint*);
    HRESULT GetAtEndOfPayload(BOOL*);
    HRESULT GetTotalLength(ulong*);
    HRESULT GetRangeEndOffset(ulong*);
    HRESULT Close();
}
enum IID_IMFHttpDownloadSession = GUID(0x71fa9a2c, 0x53ce, 0x4662, [0xa1, 0x32, 0x1a, 0x7e, 0x8c, 0xbf, 0x62, 0xdb]);
interface IMFHttpDownloadSession : IUnknown
{
    HRESULT SetServer(const(wchar)*, uint);
    HRESULT CreateRequest(const(wchar)*, BOOL, BOOL, const(wchar)*, const(wchar)*, IMFHttpDownloadRequest*);
    HRESULT Close();
}
enum IID_IMFHttpDownloadSessionProvider = GUID(0x1b4cf4b9, 0x3a16, 0x4115, [0x83, 0x9d, 0x3, 0xcc, 0x5c, 0x99, 0xdf, 0x1]);
interface IMFHttpDownloadSessionProvider : IUnknown
{
    HRESULT CreateHttpDownloadSession(const(wchar)*, IMFHttpDownloadSession*);
}
struct MF_VIDEO_SPHERICAL_VIEWDIRECTION
{
    int iHeading;
    int iPitch;
    int iRoll;
}
enum IID_IMFMediaSource2 = GUID(0xfbb03414, 0xd13b, 0x4786, [0x83, 0x19, 0x5a, 0xc5, 0x1f, 0xc0, 0xa1, 0x36]);
interface IMFMediaSource2 : IMFMediaSourceEx
{
    HRESULT SetMediaType(uint, IMFMediaType);
}
enum IID_IMFMediaStream2 = GUID(0xc5bc37d6, 0x75c7, 0x46a1, [0xa1, 0x32, 0x81, 0xb5, 0xf7, 0x23, 0xc2, 0xf]);
interface IMFMediaStream2 : IMFMediaStream
{
    HRESULT SetStreamState(MF_STREAM_STATE);
    HRESULT GetStreamState(MF_STREAM_STATE*);
}
alias MFSensorDeviceType = int;
enum : int
{
    MFSensorDeviceType_Unknown         = 0x00000000,
    MFSensorDeviceType_Device          = 0x00000001,
    MFSensorDeviceType_MediaSource     = 0x00000002,
    MFSensorDeviceType_FrameProvider   = 0x00000003,
    MFSensorDeviceType_SensorTransform = 0x00000004,
}

alias MFSensorStreamType = int;
enum : int
{
    MFSensorStreamType_Unknown = 0x00000000,
    MFSensorStreamType_Input   = 0x00000001,
    MFSensorStreamType_Output  = 0x00000002,
}

alias MFSensorDeviceMode = int;
enum : int
{
    MFSensorDeviceMode_Controller = 0x00000000,
    MFSensorDeviceMode_Shared     = 0x00000001,
}

enum IID_IMFSensorDevice = GUID(0xfb9f48f2, 0x2a18, 0x4e28, [0x97, 0x30, 0x78, 0x6f, 0x30, 0xf0, 0x4d, 0xc4]);
interface IMFSensorDevice : IUnknown
{
    HRESULT GetDeviceId(ulong*);
    HRESULT GetDeviceType(MFSensorDeviceType*);
    HRESULT GetFlags(ulong*);
    HRESULT GetSymbolicLink(PWSTR, int, int*);
    HRESULT GetDeviceAttributes(IMFAttributes*);
    HRESULT GetStreamAttributesCount(MFSensorStreamType, uint*);
    HRESULT GetStreamAttributes(MFSensorStreamType, uint, IMFAttributes*);
    HRESULT SetSensorDeviceMode(MFSensorDeviceMode);
    HRESULT GetSensorDeviceMode(MFSensorDeviceMode*);
}
enum IID_IMFSensorGroup = GUID(0x4110243a, 0x9757, 0x461f, [0x89, 0xf1, 0xf2, 0x23, 0x45, 0xbc, 0xab, 0x4e]);
interface IMFSensorGroup : IUnknown
{
    HRESULT GetSymbolicLink(PWSTR, int, int*);
    HRESULT GetFlags(ulong*);
    HRESULT GetSensorGroupAttributes(IMFAttributes*);
    HRESULT GetSensorDeviceCount(uint*);
    HRESULT GetSensorDevice(uint, IMFSensorDevice*);
    HRESULT SetDefaultSensorDeviceIndex(uint);
    HRESULT GetDefaultSensorDeviceIndex(uint*);
    HRESULT CreateMediaSource(IMFMediaSource*);
}
enum IID_IMFSensorStream = GUID(0xe9a42171, 0xc56e, 0x498a, [0x8b, 0x39, 0xed, 0xa5, 0xa0, 0x70, 0xb7, 0xfc]);
interface IMFSensorStream : IMFAttributes
{
    HRESULT GetMediaTypeCount(uint*);
    HRESULT GetMediaType(uint, IMFMediaType*);
    HRESULT CloneSensorStream(IMFSensorStream*);
}
enum IID_IMFSensorTransformFactory = GUID(0xeed9c2ee, 0x66b4, 0x4f18, [0xa6, 0x97, 0xac, 0x7d, 0x39, 0x60, 0x21, 0x5c]);
interface IMFSensorTransformFactory : IUnknown
{
    HRESULT GetFactoryAttributes(IMFAttributes*);
    HRESULT InitializeFactory(uint, IMFCollection, IMFAttributes);
    HRESULT GetTransformCount(uint*);
    HRESULT GetTransformInformation(uint, GUID*, IMFAttributes*, IMFCollection*);
    HRESULT CreateTransform(const(GUID)*, IMFAttributes, IMFDeviceTransform*);
}
struct SENSORPROFILEID
{
    GUID Type;
    uint Index;
    uint Unused;
}
enum IID_IMFSensorProfile = GUID(0x22f765d1, 0x8dab, 0x4107, [0x84, 0x6d, 0x56, 0xba, 0xf7, 0x22, 0x15, 0xe7]);
interface IMFSensorProfile : IUnknown
{
    HRESULT GetProfileId(SENSORPROFILEID*);
    HRESULT AddProfileFilter(uint, const(wchar)*);
    HRESULT IsMediaTypeSupported(uint, IMFMediaType, BOOL*);
    HRESULT AddBlockedControl(const(wchar)*);
}
enum IID_IMFSensorProfileCollection = GUID(0xc95ea55b, 0x187, 0x48be, [0x93, 0x53, 0x8d, 0x25, 0x7, 0x66, 0x23, 0x51]);
interface IMFSensorProfileCollection : IUnknown
{
    uint GetProfileCount();
    HRESULT GetProfile(uint, IMFSensorProfile*);
    HRESULT AddProfile(IMFSensorProfile);
    HRESULT FindProfile(SENSORPROFILEID*, IMFSensorProfile*);
    void RemoveProfileByIndex(uint);
    void RemoveProfile(SENSORPROFILEID*);
}
enum IID_IMFSensorProcessActivity = GUID(0x39dc7f4a, 0xb141, 0x4719, [0x81, 0x3c, 0xa7, 0xf4, 0x61, 0x62, 0xa2, 0xb8]);
interface IMFSensorProcessActivity : IUnknown
{
    HRESULT GetProcessId(uint*);
    HRESULT GetStreamingState(BOOL*);
    HRESULT GetStreamingMode(MFSensorDeviceMode*);
    HRESULT GetReportTime(FILETIME*);
}
enum IID_IMFSensorActivityReport = GUID(0x3e8c4be1, 0xa8c2, 0x4528, [0x90, 0xde, 0x28, 0x51, 0xbd, 0xe5, 0xfe, 0xad]);
interface IMFSensorActivityReport : IUnknown
{
    HRESULT GetFriendlyName(PWSTR, uint, uint*);
    HRESULT GetSymbolicLink(PWSTR, uint, uint*);
    HRESULT GetProcessCount(uint*);
    HRESULT GetProcessActivity(uint, IMFSensorProcessActivity*);
}
enum IID_IMFSensorActivitiesReport = GUID(0x683f7a5e, 0x4a19, 0x43cd, [0xb1, 0xa9, 0xdb, 0xf4, 0xab, 0x3f, 0x77, 0x77]);
interface IMFSensorActivitiesReport : IUnknown
{
    HRESULT GetCount(uint*);
    HRESULT GetActivityReport(uint, IMFSensorActivityReport*);
    HRESULT GetActivityReportByDeviceName(const(wchar)*, IMFSensorActivityReport*);
}
enum IID_IMFSensorActivitiesReportCallback = GUID(0xde5072ee, 0xdbe3, 0x46dc, [0x8a, 0x87, 0xb6, 0xf6, 0x31, 0x19, 0x47, 0x51]);
interface IMFSensorActivitiesReportCallback : IUnknown
{
    HRESULT OnActivitiesReport(IMFSensorActivitiesReport);
}
enum IID_IMFSensorActivityMonitor = GUID(0xd0cef145, 0xb3f4, 0x4340, [0xa2, 0xe5, 0x7a, 0x50, 0x80, 0xca, 0x5, 0xcb]);
interface IMFSensorActivityMonitor : IUnknown
{
    HRESULT Start();
    HRESULT Stop();
}
struct MFCameraIntrinsic_CameraModel
{
    float FocalLength_x;
    float FocalLength_y;
    float PrincipalPoint_x;
    float PrincipalPoint_y;
}
struct MFCameraIntrinsic_DistortionModel6KT
{
    float Radial_k1;
    float Radial_k2;
    float Radial_k3;
    float Radial_k4;
    float Radial_k5;
    float Radial_k6;
    float Tangential_p1;
    float Tangential_p2;
}
struct MFCameraIntrinsic_DistortionModelArcTan
{
    float Radial_k0;
    float DistortionCenter_x;
    float DistortionCenter_y;
    float Tangential_x;
    float Tangential_y;
}
alias MFCameraIntrinsic_DistortionModelType = int;
enum : int
{
    MFCameraIntrinsic_DistortionModelType_6KT    = 0x00000000,
    MFCameraIntrinsic_DistortionModelType_ArcTan = 0x00000001,
}

struct MFExtendedCameraIntrinsic_IntrinsicModel
{
    uint Width;
    uint Height;
    uint SplitFrameId;
    MFCameraIntrinsic_CameraModel CameraModel;
}
enum IID_IMFExtendedCameraIntrinsicModel = GUID(0x5c595e64, 0x4630, 0x4231, [0x85, 0x5a, 0x12, 0x84, 0x2f, 0x73, 0x32, 0x45]);
interface IMFExtendedCameraIntrinsicModel : IUnknown
{
    HRESULT GetModel(MFExtendedCameraIntrinsic_IntrinsicModel*);
    HRESULT SetModel(const(MFExtendedCameraIntrinsic_IntrinsicModel)*);
    HRESULT GetDistortionModelType(MFCameraIntrinsic_DistortionModelType*);
}
enum IID_IMFExtendedCameraIntrinsicsDistortionModel6KT = GUID(0x74c2653b, 0x5f55, 0x4eb1, [0x9f, 0xf, 0x18, 0xb8, 0xf6, 0x8b, 0x7d, 0x3d]);
interface IMFExtendedCameraIntrinsicsDistortionModel6KT : IUnknown
{
    HRESULT GetDistortionModel(MFCameraIntrinsic_DistortionModel6KT*);
    HRESULT SetDistortionModel(const(MFCameraIntrinsic_DistortionModel6KT)*);
}
enum IID_IMFExtendedCameraIntrinsicsDistortionModelArcTan = GUID(0x812d5f95, 0xb572, 0x45dc, [0xba, 0xfc, 0xae, 0x24, 0x19, 0x9d, 0xdd, 0xa8]);
interface IMFExtendedCameraIntrinsicsDistortionModelArcTan : IUnknown
{
    HRESULT GetDistortionModel(MFCameraIntrinsic_DistortionModelArcTan*);
    HRESULT SetDistortionModel(const(MFCameraIntrinsic_DistortionModelArcTan)*);
}
enum IID_IMFExtendedCameraIntrinsics = GUID(0x687f6dac, 0x6987, 0x4750, [0xa1, 0x6a, 0x73, 0x4d, 0x1e, 0x7a, 0x10, 0xfe]);
interface IMFExtendedCameraIntrinsics : IUnknown
{
    HRESULT InitializeFromBuffer(ubyte*, uint);
    HRESULT GetBufferSize(uint*);
    HRESULT SerializeToBuffer(ubyte*, uint*);
    HRESULT GetIntrinsicModelCount(uint*);
    HRESULT GetIntrinsicModelByIndex(uint, IMFExtendedCameraIntrinsicModel*);
    HRESULT AddIntrinsicModel(IMFExtendedCameraIntrinsicModel);
}
enum IID_IMFExtendedCameraControl = GUID(0x38e33520, 0xfca1, 0x4845, [0xa2, 0x7a, 0x68, 0xb7, 0xc6, 0xab, 0x37, 0x89]);
interface IMFExtendedCameraControl : IUnknown
{
    ulong GetCapabilities();
    HRESULT SetFlags(ulong);
    ulong GetFlags();
    HRESULT LockPayload(ubyte**, uint*);
    HRESULT UnlockPayload();
    HRESULT CommitSettings();
}
enum IID_IMFExtendedCameraController = GUID(0xb91ebfee, 0xca03, 0x4af4, [0x8a, 0x82, 0xa3, 0x17, 0x52, 0xf4, 0xa0, 0xfc]);
interface IMFExtendedCameraController : IUnknown
{
    HRESULT GetExtendedCameraControl(uint, uint, IMFExtendedCameraControl*);
}
enum IID_IMFRelativePanelReport = GUID(0xf25362ea, 0x2c0e, 0x447f, [0x81, 0xe2, 0x75, 0x59, 0x14, 0xcd, 0xc0, 0xc3]);
interface IMFRelativePanelReport : IUnknown
{
    HRESULT GetRelativePanel(uint*);
}
enum IID_IMFRelativePanelWatcher = GUID(0x421af7f6, 0x573e, 0x4ad0, [0x8f, 0xda, 0x2e, 0x57, 0xce, 0xdb, 0x18, 0xc6]);
interface IMFRelativePanelWatcher : IMFShutdown
{
    HRESULT BeginGetReport(IMFAsyncCallback, IUnknown);
    HRESULT EndGetReport(IMFAsyncResult, IMFRelativePanelReport*);
    HRESULT GetReport(IMFRelativePanelReport*);
}
alias MFCameraOcclusionState = int;
enum : int
{
    MFCameraOcclusionState_Open                     = 0x00000000,
    MFCameraOcclusionState_OccludedByLid            = 0x00000001,
    MFCameraOcclusionState_OccludedByCameraHardware = 0x00000002,
}

enum IID_IMFCameraOcclusionStateReport = GUID(0x1640b2cf, 0x74da, 0x4462, [0xa4, 0x3b, 0xb7, 0x6d, 0x3b, 0xdc, 0x14, 0x34]);
interface IMFCameraOcclusionStateReport : IUnknown
{
    HRESULT GetOcclusionState(uint*);
}
enum IID_IMFCameraOcclusionStateReportCallback = GUID(0x6e5841c7, 0x3889, 0x4019, [0x90, 0x35, 0x78, 0x3f, 0xb1, 0x9b, 0x59, 0x48]);
interface IMFCameraOcclusionStateReportCallback : IUnknown
{
    HRESULT OnOcclusionStateReport(IMFCameraOcclusionStateReport);
}
enum IID_IMFCameraOcclusionStateMonitor = GUID(0xcc692f46, 0xc697, 0x47e2, [0xa7, 0x2d, 0x7b, 0x6, 0x46, 0x17, 0x74, 0x9b]);
interface IMFCameraOcclusionStateMonitor : IUnknown
{
    HRESULT Start();
    HRESULT Stop();
    uint GetSupportedStates();
}
enum IID_IMFVideoCaptureSampleAllocator = GUID(0x725b77c7, 0xca9f, 0x4fe5, [0x9d, 0x72, 0x99, 0x46, 0xbf, 0x9b, 0x3c, 0x70]);
interface IMFVideoCaptureSampleAllocator : IMFVideoSampleAllocator
{
    HRESULT InitializeCaptureSampleAllocator(uint, uint, uint, uint, IMFAttributes, IMFMediaType);
}
alias MFSampleAllocatorUsage = int;
enum : int
{
    MFSampleAllocatorUsage_UsesProvidedAllocator = 0x00000000,
    MFSampleAllocatorUsage_UsesCustomAllocator   = 0x00000001,
    MFSampleAllocatorUsage_DoesNotAllocate       = 0x00000002,
}

enum IID_IMFSampleAllocatorControl = GUID(0xda62b958, 0x3a38, 0x4a97, [0xbd, 0x27, 0x14, 0x9c, 0x64, 0xc, 0x7, 0x71]);
interface IMFSampleAllocatorControl : IUnknown
{
    HRESULT SetDefaultAllocator(uint, IUnknown);
    HRESULT GetAllocatorUsage(uint, uint*, MFSampleAllocatorUsage*);
}
enum IID_IMFASFContentInfo = GUID(0xb1dca5cd, 0xd5da, 0x4451, [0x8e, 0x9e, 0xdb, 0x5c, 0x59, 0x91, 0x4e, 0xad]);
interface IMFASFContentInfo : IUnknown
{
    HRESULT GetHeaderSize(IMFMediaBuffer, ulong*);
    HRESULT ParseHeader(IMFMediaBuffer, ulong);
    HRESULT GenerateHeader(IMFMediaBuffer, uint*);
    HRESULT GetProfile(IMFASFProfile*);
    HRESULT SetProfile(IMFASFProfile);
    HRESULT GeneratePresentationDescriptor(IMFPresentationDescriptor*);
    HRESULT GetEncodingConfigurationPropertyStore(ushort, IPropertyStore*);
}
enum IID_IMFASFProfile = GUID(0xd267bf6a, 0x28b, 0x4e0d, [0x90, 0x3d, 0x43, 0xf0, 0xef, 0x82, 0xd0, 0xd4]);
interface IMFASFProfile : IMFAttributes
{
    HRESULT GetStreamCount(uint*);
    HRESULT GetStream(uint, ushort*, IMFASFStreamConfig*);
    HRESULT GetStreamByNumber(ushort, IMFASFStreamConfig*);
    HRESULT SetStream(IMFASFStreamConfig);
    HRESULT RemoveStream(ushort);
    HRESULT CreateStream(IMFMediaType, IMFASFStreamConfig*);
    HRESULT GetMutualExclusionCount(uint*);
    HRESULT GetMutualExclusion(uint, IMFASFMutualExclusion*);
    HRESULT AddMutualExclusion(IMFASFMutualExclusion);
    HRESULT RemoveMutualExclusion(uint);
    HRESULT CreateMutualExclusion(IMFASFMutualExclusion*);
    HRESULT GetStreamPrioritization(IMFASFStreamPrioritization*);
    HRESULT AddStreamPrioritization(IMFASFStreamPrioritization);
    HRESULT RemoveStreamPrioritization();
    HRESULT CreateStreamPrioritization(IMFASFStreamPrioritization*);
    HRESULT Clone(IMFASFProfile*);
}
enum IID_IMFASFStreamConfig = GUID(0x9e8ae8d2, 0xdbbd, 0x4200, [0x9a, 0xca, 0x6, 0xe6, 0xdf, 0x48, 0x49, 0x13]);
interface IMFASFStreamConfig : IMFAttributes
{
    HRESULT GetStreamType(GUID*);
    ushort GetStreamNumber();
    HRESULT SetStreamNumber(ushort);
    HRESULT GetMediaType(IMFMediaType*);
    HRESULT SetMediaType(IMFMediaType);
    HRESULT GetPayloadExtensionCount(ushort*);
    HRESULT GetPayloadExtension(ushort, GUID*, ushort*, ubyte*, uint*);
    HRESULT AddPayloadExtension(GUID, ushort, ubyte*, uint);
    HRESULT RemoveAllPayloadExtensions();
    HRESULT Clone(IMFASFStreamConfig*);
}
enum IID_IMFASFMutualExclusion = GUID(0x12558291, 0xe399, 0x11d5, [0xbc, 0x2a, 0x0, 0xb0, 0xd0, 0xf3, 0xf4, 0xab]);
interface IMFASFMutualExclusion : IUnknown
{
    HRESULT GetType(GUID*);
    HRESULT SetType(const(GUID)*);
    HRESULT GetRecordCount(uint*);
    HRESULT GetStreamsForRecord(uint, ushort*, uint*);
    HRESULT AddStreamForRecord(uint, ushort);
    HRESULT RemoveStreamFromRecord(uint, ushort);
    HRESULT RemoveRecord(uint);
    HRESULT AddRecord(uint*);
    HRESULT Clone(IMFASFMutualExclusion*);
}
enum IID_IMFASFStreamPrioritization = GUID(0x699bdc27, 0xbbaf, 0x49ff, [0x8e, 0x38, 0x9c, 0x39, 0xc9, 0xb5, 0xe0, 0x88]);
interface IMFASFStreamPrioritization : IUnknown
{
    HRESULT GetStreamCount(uint*);
    HRESULT GetStream(uint, ushort*, ushort*);
    HRESULT AddStream(ushort, ushort);
    HRESULT RemoveStream(uint);
    HRESULT Clone(IMFASFStreamPrioritization*);
}
alias MFASF_INDEXER_FLAGS = int;
enum : int
{
    MFASF_INDEXER_WRITE_NEW_INDEX          = 0x00000001,
    MFASF_INDEXER_READ_FOR_REVERSEPLAYBACK = 0x00000002,
    MFASF_INDEXER_WRITE_FOR_LIVEREAD       = 0x00000004,
}

struct ASF_INDEX_IDENTIFIER
{
    GUID guidIndexType;
    ushort wStreamNumber;
}
struct ASF_INDEX_DESCRIPTOR
{
    ASF_INDEX_IDENTIFIER Identifier;
    ushort cPerEntryBytes;
    wchar[32] szDescription;
    uint dwInterval;
}
enum IID_IMFASFIndexer = GUID(0x53590f48, 0xdc3b, 0x4297, [0x81, 0x3f, 0x78, 0x77, 0x61, 0xad, 0x7b, 0x3e]);
interface IMFASFIndexer : IUnknown
{
    HRESULT SetFlags(uint);
    HRESULT GetFlags(uint*);
    HRESULT Initialize(IMFASFContentInfo);
    HRESULT GetIndexPosition(IMFASFContentInfo, ulong*);
    HRESULT SetIndexByteStreams(IMFByteStream*, uint);
    HRESULT GetIndexByteStreamCount(uint*);
    HRESULT GetIndexStatus(ASF_INDEX_IDENTIFIER*, BOOL*, ubyte*, uint*);
    HRESULT SetIndexStatus(ubyte*, uint, BOOL);
    HRESULT GetSeekPositionForValue(const(PROPVARIANT)*, ASF_INDEX_IDENTIFIER*, ulong*, long*, uint*);
    HRESULT GenerateIndexEntries(IMFSample);
    HRESULT CommitIndex(IMFASFContentInfo);
    HRESULT GetIndexWriteSpace(ulong*);
    HRESULT GetCompletedIndex(IMFMediaBuffer, ulong);
}
enum IID_IMFASFSplitter = GUID(0x12558295, 0xe399, 0x11d5, [0xbc, 0x2a, 0x0, 0xb0, 0xd0, 0xf3, 0xf4, 0xab]);
interface IMFASFSplitter : IUnknown
{
    HRESULT Initialize(IMFASFContentInfo);
    HRESULT SetFlags(uint);
    HRESULT GetFlags(uint*);
    HRESULT SelectStreams(ushort*, ushort);
    HRESULT GetSelectedStreams(ushort*, ushort*);
    HRESULT ParseData(IMFMediaBuffer, uint, uint);
    HRESULT GetNextSample(ASF_STATUSFLAGS*, ushort*, IMFSample*);
    HRESULT Flush();
    HRESULT GetLastSendTime(uint*);
}
alias MFASF_SPLITTERFLAGS = int;
enum : int
{
    MFASF_SPLITTER_REVERSE = 0x00000001,
    MFASF_SPLITTER_WMDRM   = 0x00000002,
}

alias ASF_STATUSFLAGS = int;
enum : int
{
    ASF_STATUSFLAGS_INCOMPLETE     = 0x00000001,
    ASF_STATUSFLAGS_NONFATAL_ERROR = 0x00000002,
}

alias MFASF_MULTIPLEXERFLAGS = int;
enum : int
{
    MFASF_MULTIPLEXER_AUTOADJUST_BITRATE = 0x00000001,
}

struct ASF_MUX_STATISTICS
{
    uint cFramesWritten;
    uint cFramesDropped;
}
enum IID_IMFASFMultiplexer = GUID(0x57bdd80a, 0x9b38, 0x4838, [0xb7, 0x37, 0xc5, 0x8f, 0x67, 0xd, 0x7d, 0x4f]);
interface IMFASFMultiplexer : IUnknown
{
    HRESULT Initialize(IMFASFContentInfo);
    HRESULT SetFlags(uint);
    HRESULT GetFlags(uint*);
    HRESULT ProcessSample(ushort, IMFSample, long);
    HRESULT GetNextPacket(uint*, IMFSample*);
    HRESULT Flush();
    HRESULT End(IMFASFContentInfo);
    HRESULT GetStatistics(ushort, ASF_MUX_STATISTICS*);
    HRESULT SetSyncTolerance(uint);
}
alias MFASF_STREAMSELECTOR_FLAGS = int;
enum : int
{
    MFASF_STREAMSELECTOR_DISABLE_THINNING    = 0x00000001,
    MFASF_STREAMSELECTOR_USE_AVERAGE_BITRATE = 0x00000002,
}

alias ASF_SELECTION_STATUS = int;
enum : int
{
    ASF_STATUS_NOTSELECTED     = 0x00000000,
    ASF_STATUS_CLEANPOINTSONLY = 0x00000001,
    ASF_STATUS_ALLDATAUNITS    = 0x00000002,
}

enum IID_IMFASFStreamSelector = GUID(0xd01bad4a, 0x4fa0, 0x4a60, [0x93, 0x49, 0xc2, 0x7e, 0x62, 0xda, 0x9d, 0x41]);
interface IMFASFStreamSelector : IUnknown
{
    HRESULT GetStreamCount(uint*);
    HRESULT GetOutputCount(uint*);
    HRESULT GetOutputStreamCount(uint, uint*);
    HRESULT GetOutputStreamNumbers(uint, ushort*);
    HRESULT GetOutputFromStream(ushort, uint*);
    HRESULT GetOutputOverride(uint, ASF_SELECTION_STATUS*);
    HRESULT SetOutputOverride(uint, ASF_SELECTION_STATUS);
    HRESULT GetOutputMutexCount(uint, uint*);
    HRESULT GetOutputMutex(uint, uint, IUnknown*);
    HRESULT SetOutputMutexSelection(uint, uint, ushort);
    HRESULT GetBandwidthStepCount(uint*);
    HRESULT GetBandwidthStep(uint, uint*, ushort*, ASF_SELECTION_STATUS*);
    HRESULT BitrateToStepNumber(uint, uint*);
    HRESULT SetStreamSelectorFlags(uint);
}
alias MFSINK_WMDRMACTION = int;
enum : int
{
    MFSINK_WMDRMACTION_UNDEFINED  = 0x00000000,
    MFSINK_WMDRMACTION_ENCODE     = 0x00000001,
    MFSINK_WMDRMACTION_TRANSCODE  = 0x00000002,
    MFSINK_WMDRMACTION_TRANSCRYPT = 0x00000003,
    MFSINK_WMDRMACTION_LAST       = 0x00000003,
}

enum IID_IMFDRMNetHelper = GUID(0x3d1ff0ea, 0x679a, 0x4190, [0x8d, 0x46, 0x7f, 0xa6, 0x9e, 0x8c, 0x7e, 0x15]);
interface IMFDRMNetHelper : IUnknown
{
    HRESULT ProcessLicenseRequest(ubyte*, uint, ubyte**, uint*, BSTR*);
    HRESULT GetChainedLicenseResponse(ubyte**, uint*);
}
struct MFVideoNormalizedRect
{
    float left;
    float top;
    float right;
    float bottom;
}
alias MF_CAPTURE_ENGINE_DEVICE_TYPE = int;
enum : int
{
    MF_CAPTURE_ENGINE_DEVICE_TYPE_AUDIO = 0x00000000,
    MF_CAPTURE_ENGINE_DEVICE_TYPE_VIDEO = 0x00000001,
}

alias MF_CAPTURE_ENGINE_SINK_TYPE = int;
enum : int
{
    MF_CAPTURE_ENGINE_SINK_TYPE_RECORD  = 0x00000000,
    MF_CAPTURE_ENGINE_SINK_TYPE_PREVIEW = 0x00000001,
    MF_CAPTURE_ENGINE_SINK_TYPE_PHOTO   = 0x00000002,
}

alias MF_CAPTURE_ENGINE_SOURCE = uint;
enum : uint
{
    MF_CAPTURE_ENGINE_PREFERRED_SOURCE_STREAM_FOR_VIDEO_PREVIEW = 0xfffffffa,
    MF_CAPTURE_ENGINE_PREFERRED_SOURCE_STREAM_FOR_VIDEO_RECORD  = 0xfffffff9,
    MF_CAPTURE_ENGINE_PREFERRED_SOURCE_STREAM_FOR_PHOTO         = 0xfffffff8,
    MF_CAPTURE_ENGINE_PREFERRED_SOURCE_STREAM_FOR_AUDIO         = 0xfffffff7,
    MF_CAPTURE_ENGINE_PREFERRED_SOURCE_STREAM_FOR_METADATA      = 0xfffffff6,
    MF_CAPTURE_ENGINE_MEDIASOURCE                               = 0xffffffff,
}

alias MF_CAPTURE_ENGINE_STREAM_CATEGORY = int;
enum : int
{
    MF_CAPTURE_ENGINE_STREAM_CATEGORY_VIDEO_PREVIEW     = 0x00000000,
    MF_CAPTURE_ENGINE_STREAM_CATEGORY_VIDEO_CAPTURE     = 0x00000001,
    MF_CAPTURE_ENGINE_STREAM_CATEGORY_PHOTO_INDEPENDENT = 0x00000002,
    MF_CAPTURE_ENGINE_STREAM_CATEGORY_PHOTO_DEPENDENT   = 0x00000003,
    MF_CAPTURE_ENGINE_STREAM_CATEGORY_AUDIO             = 0x00000004,
    MF_CAPTURE_ENGINE_STREAM_CATEGORY_UNSUPPORTED       = 0x00000005,
    MF_CAPTURE_ENGINE_STREAM_CATEGORY_METADATA          = 0x00000006,
}

alias MF_CAPTURE_ENGINE_MEDIA_CATEGORY_TYPE = int;
enum : int
{
    MF_CAPTURE_ENGINE_MEDIA_CATEGORY_TYPE_OTHER          = 0x00000000,
    MF_CAPTURE_ENGINE_MEDIA_CATEGORY_TYPE_COMMUNICATIONS = 0x00000001,
    MF_CAPTURE_ENGINE_MEDIA_CATEGORY_TYPE_MEDIA          = 0x00000002,
    MF_CAPTURE_ENGINE_MEDIA_CATEGORY_TYPE_GAMECHAT       = 0x00000003,
    MF_CAPTURE_ENGINE_MEDIA_CATEGORY_TYPE_SPEECH         = 0x00000004,
    MF_CAPTURE_ENGINE_MEDIA_CATEGORY_TYPE_FARFIELDSPEECH = 0x00000005,
    MF_CAPTURE_ENGINE_MEDIA_CATEGORY_TYPE_UNIFORMSPEECH  = 0x00000006,
    MF_CAPTURE_ENGINE_MEDIA_CATEGORY_TYPE_VOICETYPING    = 0x00000007,
}

alias MF_CAPTURE_ENGINE_AUDIO_PROCESSING_MODE = int;
enum : int
{
    MF_CAPTURE_ENGINE_AUDIO_PROCESSING_DEFAULT = 0x00000000,
    MF_CAPTURE_ENGINE_AUDIO_PROCESSING_RAW     = 0x00000001,
}

enum IID_IMFCaptureEngineOnEventCallback = GUID(0xaeda51c0, 0x9025, 0x4983, [0x90, 0x12, 0xde, 0x59, 0x7b, 0x88, 0xb0, 0x89]);
interface IMFCaptureEngineOnEventCallback : IUnknown
{
    HRESULT OnEvent(IMFMediaEvent);
}
enum IID_IMFCaptureEngineOnSampleCallback = GUID(0x52150b82, 0xab39, 0x4467, [0x98, 0xf, 0xe4, 0x8b, 0xf0, 0x82, 0x2e, 0xcd]);
interface IMFCaptureEngineOnSampleCallback : IUnknown
{
    HRESULT OnSample(IMFSample);
}
enum IID_IMFCaptureSink = GUID(0x72d6135b, 0x35e9, 0x412c, [0xb9, 0x26, 0xfd, 0x52, 0x65, 0xf2, 0xa8, 0x85]);
interface IMFCaptureSink : IUnknown
{
    HRESULT GetOutputMediaType(uint, IMFMediaType*);
    HRESULT GetService(uint, const(GUID)*, const(GUID)*, IUnknown*);
    HRESULT AddStream(uint, IMFMediaType, IMFAttributes, uint*);
    HRESULT Prepare();
    HRESULT RemoveAllStreams();
}
enum IID_IMFCaptureRecordSink = GUID(0x3323b55a, 0xf92a, 0x4fe2, [0x8e, 0xdc, 0xe9, 0xbf, 0xc0, 0x63, 0x4d, 0x77]);
interface IMFCaptureRecordSink : IMFCaptureSink
{
    HRESULT SetOutputByteStream(IMFByteStream, const(GUID)*);
    HRESULT SetOutputFileName(const(wchar)*);
    HRESULT SetSampleCallback(uint, IMFCaptureEngineOnSampleCallback);
    HRESULT SetCustomSink(IMFMediaSink);
    HRESULT GetRotation(uint, uint*);
    HRESULT SetRotation(uint, uint);
}
enum IID_IMFCapturePreviewSink = GUID(0x77346cfd, 0x5b49, 0x4d73, [0xac, 0xe0, 0x5b, 0x52, 0xa8, 0x59, 0xf2, 0xe0]);
interface IMFCapturePreviewSink : IMFCaptureSink
{
    HRESULT SetRenderHandle(HANDLE);
    HRESULT SetRenderSurface(IUnknown);
    HRESULT UpdateVideo(const(MFVideoNormalizedRect)*, const(RECT)*, const(COLORREF)*);
    HRESULT SetSampleCallback(uint, IMFCaptureEngineOnSampleCallback);
    HRESULT GetMirrorState(BOOL*);
    HRESULT SetMirrorState(BOOL);
    HRESULT GetRotation(uint, uint*);
    HRESULT SetRotation(uint, uint);
    HRESULT SetCustomSink(IMFMediaSink);
}
enum IID_IMFCapturePhotoSink = GUID(0xd2d43cc8, 0x48bb, 0x4aa7, [0x95, 0xdb, 0x10, 0xc0, 0x69, 0x77, 0xe7, 0x77]);
interface IMFCapturePhotoSink : IMFCaptureSink
{
    HRESULT SetOutputFileName(const(wchar)*);
    HRESULT SetSampleCallback(IMFCaptureEngineOnSampleCallback);
    HRESULT SetOutputByteStream(IMFByteStream);
}
enum IID_IMFCaptureSource = GUID(0x439a42a8, 0xd2c, 0x4505, [0xbe, 0x83, 0xf7, 0x9b, 0x2a, 0x5, 0xd5, 0xc4]);
interface IMFCaptureSource : IUnknown
{
    HRESULT GetCaptureDeviceSource(MF_CAPTURE_ENGINE_DEVICE_TYPE, IMFMediaSource*);
    HRESULT GetCaptureDeviceActivate(MF_CAPTURE_ENGINE_DEVICE_TYPE, IMFActivate*);
    HRESULT GetService(const(GUID)*, const(GUID)*, IUnknown*);
    HRESULT AddEffect(uint, IUnknown);
    HRESULT RemoveEffect(uint, IUnknown);
    HRESULT RemoveAllEffects(uint);
    HRESULT GetAvailableDeviceMediaType(uint, uint, IMFMediaType*);
    HRESULT SetCurrentDeviceMediaType(uint, IMFMediaType);
    HRESULT GetCurrentDeviceMediaType(uint, IMFMediaType*);
    HRESULT GetDeviceStreamCount(uint*);
    HRESULT GetDeviceStreamCategory(uint, MF_CAPTURE_ENGINE_STREAM_CATEGORY*);
    HRESULT GetMirrorState(uint, BOOL*);
    HRESULT SetMirrorState(uint, BOOL);
    HRESULT GetStreamIndexFromFriendlyName(uint, uint*);
}
enum IID_IMFCaptureEngine = GUID(0xa6bba433, 0x176b, 0x48b2, [0xb3, 0x75, 0x53, 0xaa, 0x3, 0x47, 0x32, 0x7]);
interface IMFCaptureEngine : IUnknown
{
    HRESULT Initialize(IMFCaptureEngineOnEventCallback, IMFAttributes, IUnknown, IUnknown);
    HRESULT StartPreview();
    HRESULT StopPreview();
    HRESULT StartRecord();
    HRESULT StopRecord(BOOL, BOOL);
    HRESULT TakePhoto();
    HRESULT GetSink(MF_CAPTURE_ENGINE_SINK_TYPE, IMFCaptureSink*);
    HRESULT GetSource(IMFCaptureSource*);
}
enum IID_IMFCaptureEngineClassFactory = GUID(0x8f02d140, 0x56fc, 0x4302, [0xa7, 0x5, 0x3a, 0x97, 0xc7, 0x8b, 0xe7, 0x79]);
interface IMFCaptureEngineClassFactory : IUnknown
{
    HRESULT CreateInstance(const(GUID)*, const(GUID)*, void**);
}
enum IID_IMFCaptureEngineOnSampleCallback2 = GUID(0xe37ceed7, 0x340f, 0x4514, [0x9f, 0x4d, 0x9c, 0x2a, 0xe0, 0x26, 0x10, 0xb]);
interface IMFCaptureEngineOnSampleCallback2 : IMFCaptureEngineOnSampleCallback
{
    HRESULT OnSynchronizedEvent(IMFMediaEvent);
}
enum IID_IMFCaptureSink2 = GUID(0xf9e4219e, 0x6197, 0x4b5e, [0xb8, 0x88, 0xbe, 0xe3, 0x10, 0xab, 0x2c, 0x59]);
interface IMFCaptureSink2 : IMFCaptureSink
{
    HRESULT SetOutputMediaType(uint, IMFMediaType, IMFAttributes);
}
enum IID_IMFD3D12SynchronizationObjectCommands = GUID(0x9d0f835, 0x92ff, 0x4e53, [0x8e, 0xfa, 0x40, 0xfa, 0xa5, 0x51, 0xf2, 0x33]);
interface IMFD3D12SynchronizationObjectCommands : IUnknown
{
    HRESULT EnqueueResourceReady(ID3D12CommandQueue);
    HRESULT EnqueueResourceReadyWait(ID3D12CommandQueue);
    HRESULT SignalEventOnResourceReady(HANDLE);
    HRESULT EnqueueResourceRelease(ID3D12CommandQueue);
}
enum IID_IMFD3D12SynchronizationObject = GUID(0x802302b0, 0x82de, 0x45e1, [0xb4, 0x21, 0xf1, 0x9e, 0xe5, 0xbd, 0xaf, 0x23]);
interface IMFD3D12SynchronizationObject : IUnknown
{
    HRESULT SignalEventOnFinalResourceRelease(HANDLE);
    HRESULT Reset();
}
alias MF_MT_D3D_RESOURCE_VERSION_ENUM = int;
enum : int
{
    MF_D3D11_RESOURCE = 0x00000000,
    MF_D3D12_RESOURCE = 0x00000001,
}

alias MFPERIODICCALLBACK = void function(IUnknown);
alias MFASYNC_WORKQUEUE_TYPE = int;
enum : int
{
    MF_STANDARD_WORKQUEUE      = 0x00000000,
    MF_WINDOW_WORKQUEUE        = 0x00000001,
    MF_MULTITHREADED_WORKQUEUE = 0x00000002,
}

// [Not Found] IID_MFASYNCRESULT
interface MFASYNCRESULT : IMFAsyncResult
{
}
alias MF_TOPOSTATUS = int;
enum : int
{
    MF_TOPOSTATUS_INVALID         = 0x00000000,
    MF_TOPOSTATUS_READY           = 0x00000064,
    MF_TOPOSTATUS_STARTED_SOURCE  = 0x000000c8,
    MF_TOPOSTATUS_DYNAMIC_CHANGED = 0x000000d2,
    MF_TOPOSTATUS_SINK_SWITCHED   = 0x0000012c,
    MF_TOPOSTATUS_ENDED           = 0x00000190,
}

alias MFSampleEncryptionProtectionScheme = int;
enum : int
{
    MF_SAMPLE_ENCRYPTION_PROTECTION_SCHEME_NONE    = 0x00000000,
    MF_SAMPLE_ENCRYPTION_PROTECTION_SCHEME_AES_CTR = 0x00000001,
    MF_SAMPLE_ENCRYPTION_PROTECTION_SCHEME_AES_CBC = 0x00000002,
}

struct MOVE_RECT
{
    POINT SourcePoint;
    RECT DestRect;
}
struct DIRTYRECT_INFO
{
    uint FrameNumber;
    uint NumDirtyRects;
    RECT[1] DirtyRects;
}
struct MOVEREGION_INFO
{
    uint FrameNumber;
    uint NumMoveRegions;
    MOVE_RECT[1] MoveRegions;
}
struct ROI_AREA
{
    RECT rect;
    int QPDelta;
}
struct MACROBLOCK_DATA
{
    uint flags;
    short motionVectorX;
    short motionVectorY;
    int QPDelta;
}
struct DigitalWindowSetting
{
    double OriginX;
    double OriginY;
    double WindowSize;
}
alias MFT_ENUM_FLAG = uint;
enum : uint
{
    MFT_ENUM_FLAG_SYNCMFT                         = 0x00000001,
    MFT_ENUM_FLAG_ASYNCMFT                        = 0x00000002,
    MFT_ENUM_FLAG_HARDWARE                        = 0x00000004,
    MFT_ENUM_FLAG_FIELDOFUSE                      = 0x00000008,
    MFT_ENUM_FLAG_LOCALMFT                        = 0x00000010,
    MFT_ENUM_FLAG_TRANSCODE_ONLY                  = 0x00000020,
    MFT_ENUM_FLAG_SORTANDFILTER                   = 0x00000040,
    MFT_ENUM_FLAG_SORTANDFILTER_APPROVED_ONLY     = 0x000000c0,
    MFT_ENUM_FLAG_SORTANDFILTER_WEB_ONLY          = 0x00000140,
    MFT_ENUM_FLAG_SORTANDFILTER_WEB_ONLY_EDGEMODE = 0x00000240,
    MFT_ENUM_FLAG_UNTRUSTED_STOREMFT              = 0x00000400,
    MFT_ENUM_FLAG_ALL                             = 0x0000003f,
}

alias MFFrameSourceTypes = int;
enum : int
{
    MFFrameSourceTypes_Color    = 0x00000001,
    MFFrameSourceTypes_Infrared = 0x00000002,
    MFFrameSourceTypes_Depth    = 0x00000004,
    MFFrameSourceTypes_Image    = 0x00000008,
    MFFrameSourceTypes_Custom   = 0x00000080,
}

alias MFVideo3DFormat = int;
enum : int
{
    MFVideo3DSampleFormat_BaseView         = 0x00000000,
    MFVideo3DSampleFormat_MultiView        = 0x00000001,
    MFVideo3DSampleFormat_Packed_LeftRight = 0x00000002,
    MFVideo3DSampleFormat_Packed_TopBottom = 0x00000003,
}

alias MFVideo3DSampleFormat = int;
enum : int
{
    MFSampleExtension_3DVideo_MultiView = 0x00000001,
    MFSampleExtension_3DVideo_Packed    = 0x00000000,
}

alias MFVideoRotationFormat = int;
enum : int
{
    MFVideoRotationFormat_0   = 0x00000000,
    MFVideoRotationFormat_90  = 0x0000005a,
    MFVideoRotationFormat_180 = 0x000000b4,
    MFVideoRotationFormat_270 = 0x0000010e,
}

alias MFDepthMeasurement = int;
enum : int
{
    DistanceToFocalPlane    = 0x00000000,
    DistanceToOpticalCenter = 0x00000001,
}

alias MF_CUSTOM_DECODE_UNIT_TYPE = int;
enum : int
{
    MF_DECODE_UNIT_NAL = 0x00000000,
    MF_DECODE_UNIT_SEI = 0x00000001,
}

struct MFFOLDDOWN_MATRIX
{
    uint cbSize;
    uint cSrcChannels;
    uint cDstChannels;
    uint dwChannelMask;
    int[64] Coeff;
}
alias MFVideoDRMFlags = int;
enum : int
{
    MFVideoDRMFlag_None               = 0x00000000,
    MFVideoDRMFlag_AnalogProtected    = 0x00000001,
    MFVideoDRMFlag_DigitallyProtected = 0x00000002,
}

alias MFVideoPadFlags = int;
enum : int
{
    MFVideoPadFlag_PAD_TO_None = 0x00000000,
    MFVideoPadFlag_PAD_TO_4x3  = 0x00000001,
    MFVideoPadFlag_PAD_TO_16x9 = 0x00000002,
}

alias MFVideoSrcContentHintFlags = int;
enum : int
{
    MFVideoSrcContentHintFlag_None  = 0x00000000,
    MFVideoSrcContentHintFlag_16x9  = 0x00000001,
    MFVideoSrcContentHintFlag_235_1 = 0x00000002,
}

struct MT_CUSTOM_VIDEO_PRIMARIES
{
    float fRx;
    float fRy;
    float fGx;
    float fGy;
    float fBx;
    float fBy;
    float fWx;
    float fWy;
}
struct MT_ARBITRARY_HEADER
{
    GUID majortype;
    GUID subtype;
    BOOL bFixedSizeSamples;
    BOOL bTemporalCompression;
    uint lSampleSize;
    GUID formattype;
}
struct MF_FLOAT2
{
    float x;
    float y;
}
struct MF_FLOAT3
{
    float x;
    float y;
    float z;
}
struct MF_QUATERNION
{
    float x;
    float y;
    float z;
    float w;
}
struct MFCameraExtrinsic_CalibratedTransform
{
    GUID CalibrationId;
    MF_FLOAT3 Position;
    MF_QUATERNION Orientation;
}
struct MFCameraExtrinsics
{
    uint TransformCount;
    MFCameraExtrinsic_CalibratedTransform[1] CalibratedTransforms;
}
struct MFCameraIntrinsic_PinholeCameraModel
{
    MF_FLOAT2 FocalLength;
    MF_FLOAT2 PrincipalPoint;
}
struct MFCameraIntrinsic_DistortionModel
{
    float Radial_k1;
    float Radial_k2;
    float Radial_k3;
    float Tangential_p1;
    float Tangential_p2;
}
struct MFPinholeCameraIntrinsic_IntrinsicModel
{
    uint Width;
    uint Height;
    MFCameraIntrinsic_PinholeCameraModel CameraModel;
    MFCameraIntrinsic_DistortionModel DistortionModel;
}
struct MFPinholeCameraIntrinsics
{
    uint IntrinsicModelCount;
    MFPinholeCameraIntrinsic_IntrinsicModel[1] IntrinsicModels;
}
alias MFWaveFormatExConvertFlags = int;
enum : int
{
    MFWaveFormatExConvertFlag_Normal          = 0x00000000,
    MFWaveFormatExConvertFlag_ForceExtensible = 0x00000001,
}

alias EAllocationType = int;
enum : int
{
    eAllocationTypeDynamic  = 0x00000000,
    eAllocationTypeRT       = 0x00000001,
    eAllocationTypePageable = 0x00000002,
    eAllocationTypeIgnore   = 0x00000003,
}

alias MF_MEDIA_ENGINE_ERR = int;
enum : int
{
    MF_MEDIA_ENGINE_ERR_NOERROR           = 0x00000000,
    MF_MEDIA_ENGINE_ERR_ABORTED           = 0x00000001,
    MF_MEDIA_ENGINE_ERR_NETWORK           = 0x00000002,
    MF_MEDIA_ENGINE_ERR_DECODE            = 0x00000003,
    MF_MEDIA_ENGINE_ERR_SRC_NOT_SUPPORTED = 0x00000004,
    MF_MEDIA_ENGINE_ERR_ENCRYPTED         = 0x00000005,
}

enum IID_IMFMediaError = GUID(0xfc0e10d2, 0xab2a, 0x4501, [0xa9, 0x51, 0x6, 0xbb, 0x10, 0x75, 0x18, 0x4c]);
interface IMFMediaError : IUnknown
{
    ushort GetErrorCode();
    HRESULT GetExtendedErrorCode();
    HRESULT SetErrorCode(MF_MEDIA_ENGINE_ERR);
    HRESULT SetExtendedErrorCode(HRESULT);
}
enum IID_IMFMediaTimeRange = GUID(0xdb71a2fc, 0x78a, 0x414e, [0x9d, 0xf9, 0x8c, 0x25, 0x31, 0xb0, 0xaa, 0x6c]);
interface IMFMediaTimeRange : IUnknown
{
    uint GetLength();
    HRESULT GetStart(uint, double*);
    HRESULT GetEnd(uint, double*);
    BOOL ContainsTime(double);
    HRESULT AddRange(double, double);
    HRESULT Clear();
}
alias MF_MEDIA_ENGINE_EVENT = int;
enum : int
{
    MF_MEDIA_ENGINE_EVENT_LOADSTART              = 0x00000001,
    MF_MEDIA_ENGINE_EVENT_PROGRESS               = 0x00000002,
    MF_MEDIA_ENGINE_EVENT_SUSPEND                = 0x00000003,
    MF_MEDIA_ENGINE_EVENT_ABORT                  = 0x00000004,
    MF_MEDIA_ENGINE_EVENT_ERROR                  = 0x00000005,
    MF_MEDIA_ENGINE_EVENT_EMPTIED                = 0x00000006,
    MF_MEDIA_ENGINE_EVENT_STALLED                = 0x00000007,
    MF_MEDIA_ENGINE_EVENT_PLAY                   = 0x00000008,
    MF_MEDIA_ENGINE_EVENT_PAUSE                  = 0x00000009,
    MF_MEDIA_ENGINE_EVENT_LOADEDMETADATA         = 0x0000000a,
    MF_MEDIA_ENGINE_EVENT_LOADEDDATA             = 0x0000000b,
    MF_MEDIA_ENGINE_EVENT_WAITING                = 0x0000000c,
    MF_MEDIA_ENGINE_EVENT_PLAYING                = 0x0000000d,
    MF_MEDIA_ENGINE_EVENT_CANPLAY                = 0x0000000e,
    MF_MEDIA_ENGINE_EVENT_CANPLAYTHROUGH         = 0x0000000f,
    MF_MEDIA_ENGINE_EVENT_SEEKING                = 0x00000010,
    MF_MEDIA_ENGINE_EVENT_SEEKED                 = 0x00000011,
    MF_MEDIA_ENGINE_EVENT_TIMEUPDATE             = 0x00000012,
    MF_MEDIA_ENGINE_EVENT_ENDED                  = 0x00000013,
    MF_MEDIA_ENGINE_EVENT_RATECHANGE             = 0x00000014,
    MF_MEDIA_ENGINE_EVENT_DURATIONCHANGE         = 0x00000015,
    MF_MEDIA_ENGINE_EVENT_VOLUMECHANGE           = 0x00000016,
    MF_MEDIA_ENGINE_EVENT_FORMATCHANGE           = 0x000003e8,
    MF_MEDIA_ENGINE_EVENT_PURGEQUEUEDEVENTS      = 0x000003e9,
    MF_MEDIA_ENGINE_EVENT_TIMELINE_MARKER        = 0x000003ea,
    MF_MEDIA_ENGINE_EVENT_BALANCECHANGE          = 0x000003eb,
    MF_MEDIA_ENGINE_EVENT_DOWNLOADCOMPLETE       = 0x000003ec,
    MF_MEDIA_ENGINE_EVENT_BUFFERINGSTARTED       = 0x000003ed,
    MF_MEDIA_ENGINE_EVENT_BUFFERINGENDED         = 0x000003ee,
    MF_MEDIA_ENGINE_EVENT_FRAMESTEPCOMPLETED     = 0x000003ef,
    MF_MEDIA_ENGINE_EVENT_NOTIFYSTABLESTATE      = 0x000003f0,
    MF_MEDIA_ENGINE_EVENT_FIRSTFRAMEREADY        = 0x000003f1,
    MF_MEDIA_ENGINE_EVENT_TRACKSCHANGE           = 0x000003f2,
    MF_MEDIA_ENGINE_EVENT_OPMINFO                = 0x000003f3,
    MF_MEDIA_ENGINE_EVENT_RESOURCELOST           = 0x000003f4,
    MF_MEDIA_ENGINE_EVENT_DELAYLOADEVENT_CHANGED = 0x000003f5,
    MF_MEDIA_ENGINE_EVENT_STREAMRENDERINGERROR   = 0x000003f6,
    MF_MEDIA_ENGINE_EVENT_SUPPORTEDRATES_CHANGED = 0x000003f7,
    MF_MEDIA_ENGINE_EVENT_AUDIOENDPOINTCHANGE    = 0x000003f8,
}

enum IID_IMFMediaEngineNotify = GUID(0xfee7c112, 0xe776, 0x42b5, [0x9b, 0xbf, 0x0, 0x48, 0x52, 0x4e, 0x2b, 0xd5]);
interface IMFMediaEngineNotify : IUnknown
{
    HRESULT EventNotify(uint, ulong, uint);
}
enum IID_IMFMediaEngineSrcElements = GUID(0x7a5e5354, 0xb114, 0x4c72, [0xb9, 0x91, 0x31, 0x31, 0xd7, 0x50, 0x32, 0xea]);
interface IMFMediaEngineSrcElements : IUnknown
{
    uint GetLength();
    HRESULT GetURL(uint, BSTR*);
    HRESULT GetType(uint, BSTR*);
    HRESULT GetMedia(uint, BSTR*);
    HRESULT AddElement(BSTR, BSTR, BSTR);
    HRESULT RemoveAllElements();
}
alias MF_MEDIA_ENGINE_NETWORK = int;
enum : int
{
    MF_MEDIA_ENGINE_NETWORK_EMPTY     = 0x00000000,
    MF_MEDIA_ENGINE_NETWORK_IDLE      = 0x00000001,
    MF_MEDIA_ENGINE_NETWORK_LOADING   = 0x00000002,
    MF_MEDIA_ENGINE_NETWORK_NO_SOURCE = 0x00000003,
}

alias MF_MEDIA_ENGINE_READY = int;
enum : int
{
    MF_MEDIA_ENGINE_READY_HAVE_NOTHING      = 0x00000000,
    MF_MEDIA_ENGINE_READY_HAVE_METADATA     = 0x00000001,
    MF_MEDIA_ENGINE_READY_HAVE_CURRENT_DATA = 0x00000002,
    MF_MEDIA_ENGINE_READY_HAVE_FUTURE_DATA  = 0x00000003,
    MF_MEDIA_ENGINE_READY_HAVE_ENOUGH_DATA  = 0x00000004,
}

alias MF_MEDIA_ENGINE_CANPLAY = int;
enum : int
{
    MF_MEDIA_ENGINE_CANPLAY_NOT_SUPPORTED = 0x00000000,
    MF_MEDIA_ENGINE_CANPLAY_MAYBE         = 0x00000001,
    MF_MEDIA_ENGINE_CANPLAY_PROBABLY      = 0x00000002,
}

alias MF_MEDIA_ENGINE_PRELOAD = int;
enum : int
{
    MF_MEDIA_ENGINE_PRELOAD_MISSING   = 0x00000000,
    MF_MEDIA_ENGINE_PRELOAD_EMPTY     = 0x00000001,
    MF_MEDIA_ENGINE_PRELOAD_NONE      = 0x00000002,
    MF_MEDIA_ENGINE_PRELOAD_METADATA  = 0x00000003,
    MF_MEDIA_ENGINE_PRELOAD_AUTOMATIC = 0x00000004,
}

enum IID_IMFMediaEngine = GUID(0x98a1b0bb, 0x3eb, 0x4935, [0xae, 0x7c, 0x93, 0xc1, 0xfa, 0xe, 0x1c, 0x93]);
interface IMFMediaEngine : IUnknown
{
    HRESULT GetError(IMFMediaError*);
    HRESULT SetErrorCode(MF_MEDIA_ENGINE_ERR);
    HRESULT SetSourceElements(IMFMediaEngineSrcElements);
    HRESULT SetSource(BSTR);
    HRESULT GetCurrentSource(BSTR*);
    ushort GetNetworkState();
    MF_MEDIA_ENGINE_PRELOAD GetPreload();
    HRESULT SetPreload(MF_MEDIA_ENGINE_PRELOAD);
    HRESULT GetBuffered(IMFMediaTimeRange*);
    HRESULT Load();
    HRESULT CanPlayType(BSTR, MF_MEDIA_ENGINE_CANPLAY*);
    ushort GetReadyState();
    BOOL IsSeeking();
    double GetCurrentTime();
    HRESULT SetCurrentTime(double);
    double GetStartTime();
    double GetDuration();
    BOOL IsPaused();
    double GetDefaultPlaybackRate();
    HRESULT SetDefaultPlaybackRate(double);
    double GetPlaybackRate();
    HRESULT SetPlaybackRate(double);
    HRESULT GetPlayed(IMFMediaTimeRange*);
    HRESULT GetSeekable(IMFMediaTimeRange*);
    BOOL IsEnded();
    BOOL GetAutoPlay();
    HRESULT SetAutoPlay(BOOL);
    BOOL GetLoop();
    HRESULT SetLoop(BOOL);
    HRESULT Play();
    HRESULT Pause();
    BOOL GetMuted();
    HRESULT SetMuted(BOOL);
    double GetVolume();
    HRESULT SetVolume(double);
    BOOL HasVideo();
    BOOL HasAudio();
    HRESULT GetNativeVideoSize(uint*, uint*);
    HRESULT GetVideoAspectRatio(uint*, uint*);
    HRESULT Shutdown();
    HRESULT TransferVideoFrame(IUnknown, const(MFVideoNormalizedRect)*, const(RECT)*, const(MFARGB)*);
    HRESULT OnVideoStreamTick(long*);
}
alias MF_MEDIA_ENGINE_S3D_PACKING_MODE = int;
enum : int
{
    MF_MEDIA_ENGINE_S3D_PACKING_MODE_NONE         = 0x00000000,
    MF_MEDIA_ENGINE_S3D_PACKING_MODE_SIDE_BY_SIDE = 0x00000001,
    MF_MEDIA_ENGINE_S3D_PACKING_MODE_TOP_BOTTOM   = 0x00000002,
}

alias MF_MEDIA_ENGINE_STATISTIC = int;
enum : int
{
    MF_MEDIA_ENGINE_STATISTIC_FRAMES_RENDERED   = 0x00000000,
    MF_MEDIA_ENGINE_STATISTIC_FRAMES_DROPPED    = 0x00000001,
    MF_MEDIA_ENGINE_STATISTIC_BYTES_DOWNLOADED  = 0x00000002,
    MF_MEDIA_ENGINE_STATISTIC_BUFFER_PROGRESS   = 0x00000003,
    MF_MEDIA_ENGINE_STATISTIC_FRAMES_PER_SECOND = 0x00000004,
    MF_MEDIA_ENGINE_STATISTIC_PLAYBACK_JITTER   = 0x00000005,
    MF_MEDIA_ENGINE_STATISTIC_FRAMES_CORRUPTED  = 0x00000006,
    MF_MEDIA_ENGINE_STATISTIC_TOTAL_FRAME_DELAY = 0x00000007,
}

alias MF_MEDIA_ENGINE_SEEK_MODE = int;
enum : int
{
    MF_MEDIA_ENGINE_SEEK_MODE_NORMAL      = 0x00000000,
    MF_MEDIA_ENGINE_SEEK_MODE_APPROXIMATE = 0x00000001,
}

enum IID_IMFMediaEngineEx = GUID(0x83015ead, 0xb1e6, 0x40d0, [0xa9, 0x8a, 0x37, 0x14, 0x5f, 0xfe, 0x1a, 0xd1]);
interface IMFMediaEngineEx : IMFMediaEngine
{
    HRESULT SetSourceFromByteStream(IMFByteStream, BSTR);
    HRESULT GetStatistics(MF_MEDIA_ENGINE_STATISTIC, PROPVARIANT*);
    HRESULT UpdateVideoStream(const(MFVideoNormalizedRect)*, const(RECT)*, const(MFARGB)*);
    double GetBalance();
    HRESULT SetBalance(double);
    BOOL IsPlaybackRateSupported(double);
    HRESULT FrameStep(BOOL);
    HRESULT GetResourceCharacteristics(uint*);
    HRESULT GetPresentationAttribute(const(GUID)*, PROPVARIANT*);
    HRESULT GetNumberOfStreams(uint*);
    HRESULT GetStreamAttribute(uint, const(GUID)*, PROPVARIANT*);
    HRESULT GetStreamSelection(uint, BOOL*);
    HRESULT SetStreamSelection(uint, BOOL);
    HRESULT ApplyStreamSelections();
    HRESULT IsProtected(BOOL*);
    HRESULT InsertVideoEffect(IUnknown, BOOL);
    HRESULT InsertAudioEffect(IUnknown, BOOL);
    HRESULT RemoveAllEffects();
    HRESULT SetTimelineMarkerTimer(double);
    HRESULT GetTimelineMarkerTimer(double*);
    HRESULT CancelTimelineMarkerTimer();
    BOOL IsStereo3D();
    HRESULT GetStereo3DFramePackingMode(MF_MEDIA_ENGINE_S3D_PACKING_MODE*);
    HRESULT SetStereo3DFramePackingMode(MF_MEDIA_ENGINE_S3D_PACKING_MODE);
    HRESULT GetStereo3DRenderMode(MF3DVideoOutputType*);
    HRESULT SetStereo3DRenderMode(MF3DVideoOutputType);
    HRESULT EnableWindowlessSwapchainMode(BOOL);
    HRESULT GetVideoSwapchainHandle(HANDLE*);
    HRESULT EnableHorizontalMirrorMode(BOOL);
    HRESULT GetAudioStreamCategory(uint*);
    HRESULT SetAudioStreamCategory(uint);
    HRESULT GetAudioEndpointRole(uint*);
    HRESULT SetAudioEndpointRole(uint);
    HRESULT GetRealTimeMode(BOOL*);
    HRESULT SetRealTimeMode(BOOL);
    HRESULT SetCurrentTimeEx(double, MF_MEDIA_ENGINE_SEEK_MODE);
    HRESULT EnableTimeUpdateTimer(BOOL);
}
enum IID_IMFMediaEngineAudioEndpointId = GUID(0x7a3bac98, 0xe76, 0x49fb, [0x8c, 0x20, 0x8a, 0x86, 0xfd, 0x98, 0xea, 0xf2]);
interface IMFMediaEngineAudioEndpointId : IUnknown
{
    HRESULT SetAudioEndpointId(const(wchar)*);
    HRESULT GetAudioEndpointId(PWSTR*);
}
alias MF_MEDIA_ENGINE_EXTENSION_TYPE = int;
enum : int
{
    MF_MEDIA_ENGINE_EXTENSION_TYPE_MEDIASOURCE = 0x00000000,
    MF_MEDIA_ENGINE_EXTENSION_TYPE_BYTESTREAM  = 0x00000001,
}

enum IID_IMFMediaEngineExtension = GUID(0x2f69d622, 0x20b5, 0x41e9, [0xaf, 0xdf, 0x89, 0xce, 0xd1, 0xdd, 0xa0, 0x4e]);
interface IMFMediaEngineExtension : IUnknown
{
    HRESULT CanPlayType(BOOL, BSTR, MF_MEDIA_ENGINE_CANPLAY*);
    HRESULT BeginCreateObject(BSTR, IMFByteStream, MF_OBJECT_TYPE, IUnknown*, IMFAsyncCallback, IUnknown);
    HRESULT CancelObjectCreation(IUnknown);
    HRESULT EndCreateObject(IMFAsyncResult, IUnknown*);
}
alias MF_MEDIA_ENGINE_FRAME_PROTECTION_FLAGS = int;
enum : int
{
    MF_MEDIA_ENGINE_FRAME_PROTECTION_FLAG_PROTECTED                              = 0x00000001,
    MF_MEDIA_ENGINE_FRAME_PROTECTION_FLAG_REQUIRES_SURFACE_PROTECTION            = 0x00000002,
    MF_MEDIA_ENGINE_FRAME_PROTECTION_FLAG_REQUIRES_ANTI_SCREEN_SCRAPE_PROTECTION = 0x00000004,
}

enum IID_IMFMediaEngineProtectedContent = GUID(0x9f8021e8, 0x9c8c, 0x487e, [0xbb, 0x5c, 0x79, 0xaa, 0x47, 0x79, 0x93, 0x8c]);
interface IMFMediaEngineProtectedContent : IUnknown
{
    HRESULT ShareResources(IUnknown);
    HRESULT GetRequiredProtections(uint*);
    HRESULT SetOPMWindow(HWND);
    HRESULT TransferVideoFrame(IUnknown, const(MFVideoNormalizedRect)*, const(RECT)*, const(MFARGB)*, uint*);
    HRESULT SetContentProtectionManager(IMFContentProtectionManager);
    HRESULT SetApplicationCertificate(const(ubyte)*, uint);
}
enum IID_IAudioSourceProvider = GUID(0xebbaf249, 0xafc2, 0x4582, [0x91, 0xc6, 0xb6, 0xd, 0xf2, 0xe8, 0x49, 0x54]);
interface IAudioSourceProvider : IUnknown
{
    HRESULT ProvideInput(uint, uint*, float*);
}
enum IID_IMFMediaEngineWebSupport = GUID(0xba2743a1, 0x7e0, 0x48ef, [0x84, 0xb6, 0x9a, 0x2e, 0xd0, 0x23, 0xca, 0x6c]);
interface IMFMediaEngineWebSupport : IUnknown
{
    BOOL ShouldDelayTheLoadEvent();
    HRESULT ConnectWebAudio(uint, IAudioSourceProvider*);
    HRESULT DisconnectWebAudio();
}
alias MF_MSE_VP9_SUPPORT_TYPE = int;
enum : int
{
    MF_MSE_VP9_SUPPORT_DEFAULT = 0x00000000,
    MF_MSE_VP9_SUPPORT_ON      = 0x00000001,
    MF_MSE_VP9_SUPPORT_OFF     = 0x00000002,
}

alias MF_MSE_OPUS_SUPPORT_TYPE = int;
enum : int
{
    MF_MSE_OPUS_SUPPORT_ON  = 0x00000000,
    MF_MSE_OPUS_SUPPORT_OFF = 0x00000001,
}

enum IID_IMFMediaSourceExtensionNotify = GUID(0xa7901327, 0x5dd, 0x4469, [0xa7, 0xb7, 0xe, 0x1, 0x97, 0x9e, 0x36, 0x1d]);
interface IMFMediaSourceExtensionNotify : IUnknown
{
    void OnSourceOpen();
    void OnSourceEnded();
    void OnSourceClose();
}
enum IID_IMFBufferListNotify = GUID(0x24cd47f7, 0x81d8, 0x4785, [0xad, 0xb2, 0xaf, 0x69, 0x7a, 0x96, 0x3c, 0xd2]);
interface IMFBufferListNotify : IUnknown
{
    void OnAddSourceBuffer();
    void OnRemoveSourceBuffer();
}
enum IID_IMFSourceBufferNotify = GUID(0x87e47623, 0x2ceb, 0x45d6, [0x9b, 0x88, 0xd8, 0x52, 0xc, 0x4d, 0xcb, 0xbc]);
interface IMFSourceBufferNotify : IUnknown
{
    void OnUpdateStart();
    void OnAbort();
    void OnError(HRESULT);
    void OnUpdate();
    void OnUpdateEnd();
}
enum IID_IMFSourceBuffer = GUID(0xe2cd3a4b, 0xaf25, 0x4d3d, [0x91, 0x10, 0xda, 0xe, 0x6f, 0x8e, 0xe8, 0x77]);
interface IMFSourceBuffer : IUnknown
{
    BOOL GetUpdating();
    HRESULT GetBuffered(IMFMediaTimeRange*);
    double GetTimeStampOffset();
    HRESULT SetTimeStampOffset(double);
    double GetAppendWindowStart();
    HRESULT SetAppendWindowStart(double);
    double GetAppendWindowEnd();
    HRESULT SetAppendWindowEnd(double);
    HRESULT Append(const(ubyte)*, uint);
    HRESULT AppendByteStream(IMFByteStream, ulong*);
    HRESULT Abort();
    HRESULT Remove(double, double);
}
alias MF_MSE_APPEND_MODE = int;
enum : int
{
    MF_MSE_APPEND_MODE_SEGMENTS = 0x00000000,
    MF_MSE_APPEND_MODE_SEQUENCE = 0x00000001,
}

enum IID_IMFSourceBufferAppendMode = GUID(0x19666fb4, 0xbabe, 0x4c55, [0xbc, 0x3, 0xa, 0x7, 0x4d, 0xa3, 0x7e, 0x2a]);
interface IMFSourceBufferAppendMode : IUnknown
{
    MF_MSE_APPEND_MODE GetAppendMode();
    HRESULT SetAppendMode(MF_MSE_APPEND_MODE);
}
enum IID_IMFSourceBufferList = GUID(0x249981f8, 0x8325, 0x41f3, [0xb8, 0xc, 0x3b, 0x9e, 0x3a, 0xad, 0xc, 0xbe]);
interface IMFSourceBufferList : IUnknown
{
    uint GetLength();
    IMFSourceBuffer GetSourceBuffer(uint);
}
alias MF_MSE_READY = int;
enum : int
{
    MF_MSE_READY_CLOSED = 0x00000001,
    MF_MSE_READY_OPEN   = 0x00000002,
    MF_MSE_READY_ENDED  = 0x00000003,
}

alias MF_MSE_ERROR = int;
enum : int
{
    MF_MSE_ERROR_NOERROR       = 0x00000000,
    MF_MSE_ERROR_NETWORK       = 0x00000001,
    MF_MSE_ERROR_DECODE        = 0x00000002,
    MF_MSE_ERROR_UNKNOWN_ERROR = 0x00000003,
}

enum IID_IMFMediaSourceExtension = GUID(0xe467b94e, 0xa713, 0x4562, [0xa8, 0x2, 0x81, 0x6a, 0x42, 0xe9, 0x0, 0x8a]);
interface IMFMediaSourceExtension : IUnknown
{
    IMFSourceBufferList GetSourceBuffers();
    IMFSourceBufferList GetActiveSourceBuffers();
    MF_MSE_READY GetReadyState();
    double GetDuration();
    HRESULT SetDuration(double);
    HRESULT AddSourceBuffer(BSTR, IMFSourceBufferNotify, IMFSourceBuffer*);
    HRESULT RemoveSourceBuffer(IMFSourceBuffer);
    HRESULT SetEndOfStream(MF_MSE_ERROR);
    BOOL IsTypeSupported(BSTR);
    IMFSourceBuffer GetSourceBuffer(uint);
}
enum IID_IMFMediaSourceExtensionLiveSeekableRange = GUID(0x5d1abfd6, 0x450a, 0x4d92, [0x9e, 0xfc, 0xd6, 0xb6, 0xcb, 0xc1, 0xf4, 0xda]);
interface IMFMediaSourceExtensionLiveSeekableRange : IUnknown
{
    HRESULT SetLiveSeekableRange(double, double);
    HRESULT ClearLiveSeekableRange();
}
enum IID_IMFMediaEngineEME = GUID(0x50dc93e4, 0xba4f, 0x4275, [0xae, 0x66, 0x83, 0xe8, 0x36, 0xe5, 0x74, 0x69]);
interface IMFMediaEngineEME : IUnknown
{
    HRESULT get_Keys(IMFMediaKeys*);
    HRESULT SetMediaKeys(IMFMediaKeys);
}
enum IID_IMFMediaEngineSrcElementsEx = GUID(0x654a6bb3, 0xe1a3, 0x424a, [0x99, 0x8, 0x53, 0xa4, 0x3a, 0xd, 0xfd, 0xa0]);
interface IMFMediaEngineSrcElementsEx : IMFMediaEngineSrcElements
{
    HRESULT AddElementEx(BSTR, BSTR, BSTR, BSTR);
    HRESULT GetKeySystem(uint, BSTR*);
}
enum IID_IMFMediaEngineNeedKeyNotify = GUID(0x46a30204, 0xa696, 0x4b18, [0x88, 0x4, 0x24, 0x6b, 0x8f, 0x3, 0x1b, 0xb1]);
interface IMFMediaEngineNeedKeyNotify : IUnknown
{
    void NeedKey(const(ubyte)*, uint);
}
enum IID_IMFMediaKeys = GUID(0x5cb31c05, 0x61ff, 0x418f, [0xaf, 0xda, 0xca, 0xaf, 0x41, 0x42, 0x1a, 0x38]);
interface IMFMediaKeys : IUnknown
{
    HRESULT CreateSession(BSTR, const(ubyte)*, uint, const(ubyte)*, uint, IMFMediaKeySessionNotify, IMFMediaKeySession*);
    HRESULT get_KeySystem(BSTR*);
    HRESULT Shutdown();
    HRESULT GetSuspendNotify(IMFCdmSuspendNotify*);
}
alias MF_MEDIA_ENGINE_KEYERR = int;
enum : int
{
    MF_MEDIAENGINE_KEYERR_UNKNOWN        = 0x00000001,
    MF_MEDIAENGINE_KEYERR_CLIENT         = 0x00000002,
    MF_MEDIAENGINE_KEYERR_SERVICE        = 0x00000003,
    MF_MEDIAENGINE_KEYERR_OUTPUT         = 0x00000004,
    MF_MEDIAENGINE_KEYERR_HARDWARECHANGE = 0x00000005,
    MF_MEDIAENGINE_KEYERR_DOMAIN         = 0x00000006,
}

enum IID_IMFMediaKeySession = GUID(0x24fa67d5, 0xd1d0, 0x4dc5, [0x99, 0x5c, 0xc0, 0xef, 0xdc, 0x19, 0x1f, 0xb5]);
interface IMFMediaKeySession : IUnknown
{
    HRESULT GetError(ushort*, uint*);
    HRESULT get_KeySystem(BSTR*);
    HRESULT get_SessionId(BSTR*);
    HRESULT Update(const(ubyte)*, uint);
    HRESULT Close();
}
enum IID_IMFMediaKeySessionNotify = GUID(0x6a0083f9, 0x8947, 0x4c1d, [0x9c, 0xe0, 0xcd, 0xee, 0x22, 0xb2, 0x31, 0x35]);
interface IMFMediaKeySessionNotify : IUnknown
{
    void KeyMessage(BSTR, const(ubyte)*, uint);
    void KeyAdded();
    void KeyError(ushort, uint);
}
enum IID_IMFCdmSuspendNotify = GUID(0x7a5645d2, 0x43bd, 0x47fd, [0x87, 0xb7, 0xdc, 0xd2, 0x4c, 0xc7, 0xd6, 0x92]);
interface IMFCdmSuspendNotify : IUnknown
{
    HRESULT Begin();
    HRESULT End();
}
alias MF_HDCP_STATUS = int;
enum : int
{
    MF_HDCP_STATUS_ON                       = 0x00000000,
    MF_HDCP_STATUS_OFF                      = 0x00000001,
    MF_HDCP_STATUS_ON_WITH_TYPE_ENFORCEMENT = 0x00000002,
}

enum IID_IMFHDCPStatus = GUID(0xde400f54, 0x5bf1, 0x40cf, [0x89, 0x64, 0xb, 0xea, 0x13, 0x6b, 0x1e, 0x3d]);
interface IMFHDCPStatus : IUnknown
{
    HRESULT Query(MF_HDCP_STATUS*, BOOL*);
    HRESULT Set(MF_HDCP_STATUS);
}
alias MF_MEDIA_ENGINE_OPM_STATUS = int;
enum : int
{
    MF_MEDIA_ENGINE_OPM_NOT_REQUESTED          = 0x00000000,
    MF_MEDIA_ENGINE_OPM_ESTABLISHED            = 0x00000001,
    MF_MEDIA_ENGINE_OPM_FAILED_VM              = 0x00000002,
    MF_MEDIA_ENGINE_OPM_FAILED_BDA             = 0x00000003,
    MF_MEDIA_ENGINE_OPM_FAILED_UNSIGNED_DRIVER = 0x00000004,
    MF_MEDIA_ENGINE_OPM_FAILED                 = 0x00000005,
}

enum IID_IMFMediaEngineOPMInfo = GUID(0x765763e6, 0x6c01, 0x4b01, [0xbb, 0xf, 0xb8, 0x29, 0xf6, 0xe, 0xd2, 0x8c]);
interface IMFMediaEngineOPMInfo : IUnknown
{
    HRESULT GetOPMInfo(MF_MEDIA_ENGINE_OPM_STATUS*, BOOL*);
}
alias MF_MEDIA_ENGINE_CREATEFLAGS = int;
enum : int
{
    MF_MEDIA_ENGINE_AUDIOONLY             = 0x00000001,
    MF_MEDIA_ENGINE_WAITFORSTABLE_STATE   = 0x00000002,
    MF_MEDIA_ENGINE_FORCEMUTE             = 0x00000004,
    MF_MEDIA_ENGINE_REAL_TIME_MODE        = 0x00000008,
    MF_MEDIA_ENGINE_DISABLE_LOCAL_PLUGINS = 0x00000010,
    MF_MEDIA_ENGINE_CREATEFLAGS_MASK      = 0x0000001f,
}

alias MF_MEDIA_ENGINE_PROTECTION_FLAGS = int;
enum : int
{
    MF_MEDIA_ENGINE_ENABLE_PROTECTED_CONTENT = 0x00000001,
    MF_MEDIA_ENGINE_USE_PMP_FOR_ALL_CONTENT  = 0x00000002,
    MF_MEDIA_ENGINE_USE_UNPROTECTED_PMP      = 0x00000004,
}

enum IID_IMFMediaEngineClassFactory = GUID(0x4d645ace, 0x26aa, 0x4688, [0x9b, 0xe1, 0xdf, 0x35, 0x16, 0x99, 0xb, 0x93]);
interface IMFMediaEngineClassFactory : IUnknown
{
    HRESULT CreateInstance(uint, IMFAttributes, IMFMediaEngine*);
    HRESULT CreateTimeRange(IMFMediaTimeRange*);
    HRESULT CreateError(IMFMediaError*);
}
enum IID_IMFMediaEngineClassFactoryEx = GUID(0xc56156c6, 0xea5b, 0x48a5, [0x9d, 0xf8, 0xfb, 0xe0, 0x35, 0xd0, 0x92, 0x9e]);
interface IMFMediaEngineClassFactoryEx : IMFMediaEngineClassFactory
{
    HRESULT CreateMediaSourceExtension(uint, IMFAttributes, IMFMediaSourceExtension*);
    HRESULT CreateMediaKeys(BSTR, BSTR, IMFMediaKeys*);
    HRESULT IsTypeSupported(BSTR, BSTR, BOOL*);
}
enum IID_IMFMediaEngineClassFactory2 = GUID(0x9083cef, 0x867f, 0x4bf6, [0x87, 0x76, 0xde, 0xe3, 0xa7, 0xb4, 0x2f, 0xca]);
interface IMFMediaEngineClassFactory2 : IUnknown
{
    HRESULT CreateMediaKeys2(BSTR, BSTR, BSTR, IMFMediaKeys*);
}
enum IID_IMFExtendedDRMTypeSupport = GUID(0x332ec562, 0x3758, 0x468d, [0xa7, 0x84, 0xe3, 0x8f, 0x23, 0x55, 0x21, 0x28]);
interface IMFExtendedDRMTypeSupport : IUnknown
{
    HRESULT IsTypeSupportedEx(BSTR, BSTR, MF_MEDIA_ENGINE_CANPLAY*);
}
enum IID_IMFMediaEngineSupportsSourceTransfer = GUID(0xa724b056, 0x1b2e, 0x4642, [0xa6, 0xf3, 0xdb, 0x94, 0x20, 0xc5, 0x29, 0x8]);
interface IMFMediaEngineSupportsSourceTransfer : IUnknown
{
    HRESULT ShouldTransferSource(BOOL*);
    HRESULT DetachMediaSource(IMFByteStream*, IMFMediaSource*, IMFMediaSourceExtension*);
    HRESULT AttachMediaSource(IMFByteStream, IMFMediaSource, IMFMediaSourceExtension);
}
enum IID_IMFMediaEngineTransferSource = GUID(0x24230452, 0xfe54, 0x40cc, [0x94, 0xf3, 0xfc, 0xc3, 0x94, 0xc3, 0x40, 0xd6]);
interface IMFMediaEngineTransferSource : IUnknown
{
    HRESULT TransferSourceToMediaEngine(IMFMediaEngine);
}
alias MF_TIMED_TEXT_TRACK_KIND = int;
enum : int
{
    MF_TIMED_TEXT_TRACK_KIND_UNKNOWN   = 0x00000000,
    MF_TIMED_TEXT_TRACK_KIND_SUBTITLES = 0x00000001,
    MF_TIMED_TEXT_TRACK_KIND_CAPTIONS  = 0x00000002,
    MF_TIMED_TEXT_TRACK_KIND_METADATA  = 0x00000003,
}

alias MF_TIMED_TEXT_UNIT_TYPE = int;
enum : int
{
    MF_TIMED_TEXT_UNIT_TYPE_PIXELS     = 0x00000000,
    MF_TIMED_TEXT_UNIT_TYPE_PERCENTAGE = 0x00000001,
}

alias MF_TIMED_TEXT_FONT_STYLE = int;
enum : int
{
    MF_TIMED_TEXT_FONT_STYLE_NORMAL  = 0x00000000,
    MF_TIMED_TEXT_FONT_STYLE_OBLIQUE = 0x00000001,
    MF_TIMED_TEXT_FONT_STYLE_ITALIC  = 0x00000002,
}

alias MF_TIMED_TEXT_ALIGNMENT = int;
enum : int
{
    MF_TIMED_TEXT_ALIGNMENT_START  = 0x00000000,
    MF_TIMED_TEXT_ALIGNMENT_END    = 0x00000001,
    MF_TIMED_TEXT_ALIGNMENT_CENTER = 0x00000002,
}

alias MF_TIMED_TEXT_DISPLAY_ALIGNMENT = int;
enum : int
{
    MF_TIMED_TEXT_DISPLAY_ALIGNMENT_BEFORE = 0x00000000,
    MF_TIMED_TEXT_DISPLAY_ALIGNMENT_AFTER  = 0x00000001,
    MF_TIMED_TEXT_DISPLAY_ALIGNMENT_CENTER = 0x00000002,
}

alias MF_TIMED_TEXT_DECORATION = int;
enum : int
{
    MF_TIMED_TEXT_DECORATION_NONE         = 0x00000000,
    MF_TIMED_TEXT_DECORATION_UNDERLINE    = 0x00000001,
    MF_TIMED_TEXT_DECORATION_LINE_THROUGH = 0x00000002,
    MF_TIMED_TEXT_DECORATION_OVERLINE     = 0x00000004,
}

alias MF_TIMED_TEXT_WRITING_MODE = int;
enum : int
{
    MF_TIMED_TEXT_WRITING_MODE_LRTB = 0x00000000,
    MF_TIMED_TEXT_WRITING_MODE_RLTB = 0x00000001,
    MF_TIMED_TEXT_WRITING_MODE_TBRL = 0x00000002,
    MF_TIMED_TEXT_WRITING_MODE_TBLR = 0x00000003,
    MF_TIMED_TEXT_WRITING_MODE_LR   = 0x00000004,
    MF_TIMED_TEXT_WRITING_MODE_RL   = 0x00000005,
    MF_TIMED_TEXT_WRITING_MODE_TB   = 0x00000006,
}

alias MF_TIMED_TEXT_SCROLL_MODE = int;
enum : int
{
    MF_TIMED_TEXT_SCROLL_MODE_POP_ON  = 0x00000000,
    MF_TIMED_TEXT_SCROLL_MODE_ROLL_UP = 0x00000001,
}

alias MF_TIMED_TEXT_ERROR_CODE = int;
enum : int
{
    MF_TIMED_TEXT_ERROR_CODE_NOERROR     = 0x00000000,
    MF_TIMED_TEXT_ERROR_CODE_FATAL       = 0x00000001,
    MF_TIMED_TEXT_ERROR_CODE_DATA_FORMAT = 0x00000002,
    MF_TIMED_TEXT_ERROR_CODE_NETWORK     = 0x00000003,
    MF_TIMED_TEXT_ERROR_CODE_INTERNAL    = 0x00000004,
}

alias MF_TIMED_TEXT_CUE_EVENT = int;
enum : int
{
    MF_TIMED_TEXT_CUE_EVENT_ACTIVE   = 0x00000000,
    MF_TIMED_TEXT_CUE_EVENT_INACTIVE = 0x00000001,
    MF_TIMED_TEXT_CUE_EVENT_CLEAR    = 0x00000002,
}

alias MF_TIMED_TEXT_TRACK_READY_STATE = int;
enum : int
{
    MF_TIMED_TEXT_TRACK_READY_STATE_NONE    = 0x00000000,
    MF_TIMED_TEXT_TRACK_READY_STATE_LOADING = 0x00000001,
    MF_TIMED_TEXT_TRACK_READY_STATE_LOADED  = 0x00000002,
    MF_TIMED_TEXT_TRACK_READY_STATE_ERROR   = 0x00000003,
}

alias MF_TIMED_TEXT_RUBY_POSITION = int;
enum : int
{
    MF_TIMED_TEXT_RUBY_POSITION_BEFORE  = 0x00000000,
    MF_TIMED_TEXT_RUBY_POSITION_AFTER   = 0x00000001,
    MF_TIMED_TEXT_RUBY_POSITION_OUTSIDE = 0x00000002,
}

alias MF_TIMED_TEXT_RUBY_ALIGN = int;
enum : int
{
    MF_TIMED_TEXT_RUBY_ALIGN_CENTER       = 0x00000000,
    MF_TIMED_TEXT_RUBY_ALIGN_START        = 0x00000001,
    MF_TIMED_TEXT_RUBY_ALIGN_END          = 0x00000002,
    MF_TIMED_TEXT_RUBY_ALIGN_SPACEAROUND  = 0x00000003,
    MF_TIMED_TEXT_RUBY_ALIGN_SPACEBETWEEN = 0x00000004,
    MF_TIMED_TEXT_RUBY_ALIGN_WITHBASE     = 0x00000005,
}

alias MF_TIMED_TEXT_RUBY_RESERVE = int;
enum : int
{
    MF_TIMED_TEXT_RUBY_RESERVE_NONE    = 0x00000000,
    MF_TIMED_TEXT_RUBY_RESERVE_BEFORE  = 0x00000001,
    MF_TIMED_TEXT_RUBY_RESERVE_AFTER   = 0x00000002,
    MF_TIMED_TEXT_RUBY_RESERVE_BOTH    = 0x00000003,
    MF_TIMED_TEXT_RUBY_RESERVE_OUTSIDE = 0x00000004,
}

alias MF_TIMED_TEXT_BOUTEN_TYPE = int;
enum : int
{
    MF_TIMED_TEXT_BOUTEN_TYPE_NONE         = 0x00000000,
    MF_TIMED_TEXT_BOUTEN_TYPE_AUTO         = 0x00000001,
    MF_TIMED_TEXT_BOUTEN_TYPE_FILLEDCIRCLE = 0x00000002,
    MF_TIMED_TEXT_BOUTEN_TYPE_OPENCIRCLE   = 0x00000003,
    MF_TIMED_TEXT_BOUTEN_TYPE_FILLEDDOT    = 0x00000004,
    MF_TIMED_TEXT_BOUTEN_TYPE_OPENDOT      = 0x00000005,
    MF_TIMED_TEXT_BOUTEN_TYPE_FILLEDSESAME = 0x00000006,
    MF_TIMED_TEXT_BOUTEN_TYPE_OPENSESAME   = 0x00000007,
}

alias MF_TIMED_TEXT_BOUTEN_POSITION = int;
enum : int
{
    MF_TIMED_TEXT_BOUTEN_POSITION_BEFORE  = 0x00000000,
    MF_TIMED_TEXT_BOUTEN_POSITION_AFTER   = 0x00000001,
    MF_TIMED_TEXT_BOUTEN_POSITION_OUTSIDE = 0x00000002,
}

enum IID_IMFTimedText = GUID(0x1f2a94c9, 0xa3df, 0x430d, [0x9d, 0xf, 0xac, 0xd8, 0x5d, 0xdc, 0x29, 0xaf]);
interface IMFTimedText : IUnknown
{
    HRESULT RegisterNotifications(IMFTimedTextNotify);
    HRESULT SelectTrack(uint, BOOL);
    HRESULT AddDataSource(IMFByteStream, const(wchar)*, const(wchar)*, MF_TIMED_TEXT_TRACK_KIND, BOOL, uint*);
    HRESULT AddDataSourceFromUrl(const(wchar)*, const(wchar)*, const(wchar)*, MF_TIMED_TEXT_TRACK_KIND, BOOL, uint*);
    HRESULT AddTrack(const(wchar)*, const(wchar)*, MF_TIMED_TEXT_TRACK_KIND, IMFTimedTextTrack*);
    HRESULT RemoveTrack(IMFTimedTextTrack);
    HRESULT GetCueTimeOffset(double*);
    HRESULT SetCueTimeOffset(double);
    HRESULT GetTracks(IMFTimedTextTrackList*);
    HRESULT GetActiveTracks(IMFTimedTextTrackList*);
    HRESULT GetTextTracks(IMFTimedTextTrackList*);
    HRESULT GetMetadataTracks(IMFTimedTextTrackList*);
    HRESULT SetInBandEnabled(BOOL);
    BOOL IsInBandEnabled();
}
enum IID_IMFTimedTextNotify = GUID(0xdf6b87b6, 0xce12, 0x45db, [0xab, 0xa7, 0x43, 0x2f, 0xe0, 0x54, 0xe5, 0x7d]);
interface IMFTimedTextNotify : IUnknown
{
    void TrackAdded(uint);
    void TrackRemoved(uint);
    void TrackSelected(uint, BOOL);
    void TrackReadyStateChanged(uint);
    void Error(MF_TIMED_TEXT_ERROR_CODE, HRESULT, uint);
    void Cue(MF_TIMED_TEXT_CUE_EVENT, double, IMFTimedTextCue);
    void Reset();
}
enum IID_IMFTimedTextTrack = GUID(0x8822c32d, 0x654e, 0x4233, [0xbf, 0x21, 0xd7, 0xf2, 0xe6, 0x7d, 0x30, 0xd4]);
interface IMFTimedTextTrack : IUnknown
{
    uint GetId();
    HRESULT GetLabel(PWSTR*);
    HRESULT SetLabel(const(wchar)*);
    HRESULT GetLanguage(PWSTR*);
    MF_TIMED_TEXT_TRACK_KIND GetTrackKind();
    BOOL IsInBand();
    HRESULT GetInBandMetadataTrackDispatchType(PWSTR*);
    BOOL IsActive();
    MF_TIMED_TEXT_ERROR_CODE GetErrorCode();
    HRESULT GetExtendedErrorCode();
    HRESULT GetDataFormat(GUID*);
    MF_TIMED_TEXT_TRACK_READY_STATE GetReadyState();
    HRESULT GetCueList(IMFTimedTextCueList*);
}
enum IID_IMFTimedTextTrackList = GUID(0x23ff334c, 0x442c, 0x445f, [0xbc, 0xcc, 0xed, 0xc4, 0x38, 0xaa, 0x11, 0xe2]);
interface IMFTimedTextTrackList : IUnknown
{
    uint GetLength();
    HRESULT GetTrack(uint, IMFTimedTextTrack*);
    HRESULT GetTrackById(uint, IMFTimedTextTrack*);
}
enum IID_IMFTimedTextCue = GUID(0x1e560447, 0x9a2b, 0x43e1, [0xa9, 0x4c, 0xb0, 0xaa, 0xab, 0xfb, 0xfb, 0xc9]);
interface IMFTimedTextCue : IUnknown
{
    uint GetId();
    HRESULT GetOriginalId(PWSTR*);
    MF_TIMED_TEXT_TRACK_KIND GetCueKind();
    double GetStartTime();
    double GetDuration();
    uint GetTrackId();
    HRESULT GetData(IMFTimedTextBinary*);
    HRESULT GetRegion(IMFTimedTextRegion*);
    HRESULT GetStyle(IMFTimedTextStyle*);
    uint GetLineCount();
    HRESULT GetLine(uint, IMFTimedTextFormattedText*);
}
enum IID_IMFTimedTextFormattedText = GUID(0xe13af3c1, 0x4d47, 0x4354, [0xb1, 0xf5, 0xe8, 0x3a, 0xe0, 0xec, 0xae, 0x60]);
interface IMFTimedTextFormattedText : IUnknown
{
    HRESULT GetText(PWSTR*);
    uint GetSubformattingCount();
    HRESULT GetSubformatting(uint, uint*, uint*, IMFTimedTextStyle*);
}
enum IID_IMFTimedTextStyle = GUID(0x9b2455d, 0xb834, 0x4f01, [0xa3, 0x47, 0x90, 0x52, 0xe2, 0x1c, 0x45, 0xe]);
interface IMFTimedTextStyle : IUnknown
{
    HRESULT GetName(PWSTR*);
    BOOL IsExternal();
    HRESULT GetFontFamily(PWSTR*);
    HRESULT GetFontSize(double*, MF_TIMED_TEXT_UNIT_TYPE*);
    HRESULT GetColor(MFARGB*);
    HRESULT GetBackgroundColor(MFARGB*);
    HRESULT GetShowBackgroundAlways(BOOL*);
    HRESULT GetFontStyle(MF_TIMED_TEXT_FONT_STYLE*);
    HRESULT GetBold(BOOL*);
    HRESULT GetRightToLeft(BOOL*);
    HRESULT GetTextAlignment(MF_TIMED_TEXT_ALIGNMENT*);
    HRESULT GetTextDecoration(uint*);
    HRESULT GetTextOutline(MFARGB*, double*, double*, MF_TIMED_TEXT_UNIT_TYPE*);
}
enum IID_IMFTimedTextRegion = GUID(0xc8d22afc, 0xbc47, 0x4bdf, [0x9b, 0x4, 0x78, 0x7e, 0x49, 0xce, 0x3f, 0x58]);
interface IMFTimedTextRegion : IUnknown
{
    HRESULT GetName(PWSTR*);
    HRESULT GetPosition(double*, double*, MF_TIMED_TEXT_UNIT_TYPE*);
    HRESULT GetExtent(double*, double*, MF_TIMED_TEXT_UNIT_TYPE*);
    HRESULT GetBackgroundColor(MFARGB*);
    HRESULT GetWritingMode(MF_TIMED_TEXT_WRITING_MODE*);
    HRESULT GetDisplayAlignment(MF_TIMED_TEXT_DISPLAY_ALIGNMENT*);
    HRESULT GetLineHeight(double*, MF_TIMED_TEXT_UNIT_TYPE*);
    HRESULT GetClipOverflow(BOOL*);
    HRESULT GetPadding(double*, double*, double*, double*, MF_TIMED_TEXT_UNIT_TYPE*);
    HRESULT GetWrap(BOOL*);
    HRESULT GetZIndex(int*);
    HRESULT GetScrollMode(MF_TIMED_TEXT_SCROLL_MODE*);
}
enum IID_IMFTimedTextBinary = GUID(0x4ae3a412, 0x545, 0x43c4, [0xbf, 0x6f, 0x6b, 0x97, 0xa5, 0xc6, 0xc4, 0x32]);
interface IMFTimedTextBinary : IUnknown
{
    HRESULT GetData(const(ubyte)**, uint*);
}
enum IID_IMFTimedTextCueList = GUID(0xad128745, 0x211b, 0x40a0, [0x99, 0x81, 0xfe, 0x65, 0xf1, 0x66, 0xd0, 0xfd]);
interface IMFTimedTextCueList : IUnknown
{
    uint GetLength();
    HRESULT GetCueByIndex(uint, IMFTimedTextCue*);
    HRESULT GetCueById(uint, IMFTimedTextCue*);
    HRESULT GetCueByOriginalId(const(wchar)*, IMFTimedTextCue*);
    HRESULT AddTextCue(double, double, const(wchar)*, IMFTimedTextCue*);
    HRESULT AddDataCue(double, double, const(ubyte)*, uint, IMFTimedTextCue*);
    HRESULT RemoveCue(IMFTimedTextCue);
}
enum IID_IMFTimedTextRuby = GUID(0x76c6a6f5, 0x4955, 0x4de5, [0xb2, 0x7b, 0x14, 0xb7, 0x34, 0xcc, 0x14, 0xb4]);
interface IMFTimedTextRuby : IUnknown
{
    HRESULT GetRubyText(PWSTR*);
    HRESULT GetRubyPosition(MF_TIMED_TEXT_RUBY_POSITION*);
    HRESULT GetRubyAlign(MF_TIMED_TEXT_RUBY_ALIGN*);
    HRESULT GetRubyReserve(MF_TIMED_TEXT_RUBY_RESERVE*);
}
enum IID_IMFTimedTextBouten = GUID(0x3c5f3e8a, 0x90c0, 0x464e, [0x81, 0x36, 0x89, 0x8d, 0x29, 0x75, 0xf8, 0x47]);
interface IMFTimedTextBouten : IUnknown
{
    HRESULT GetBoutenType(MF_TIMED_TEXT_BOUTEN_TYPE*);
    HRESULT GetBoutenColor(MFARGB*);
    HRESULT GetBoutenPosition(MF_TIMED_TEXT_BOUTEN_POSITION*);
}
enum IID_IMFTimedTextStyle2 = GUID(0xdb639199, 0xc809, 0x4c89, [0xbf, 0xca, 0xd0, 0xbb, 0xb9, 0x72, 0x9d, 0x6e]);
interface IMFTimedTextStyle2 : IUnknown
{
    HRESULT GetRuby(IMFTimedTextRuby*);
    HRESULT GetBouten(IMFTimedTextBouten*);
    HRESULT IsTextCombined(BOOL*);
    HRESULT GetFontAngleInDegrees(double*);
}
alias MF_MEDIA_ENGINE_STREAMTYPE_FAILED = int;
enum : int
{
    MF_MEDIA_ENGINE_STREAMTYPE_FAILED_UNKNOWN = 0x00000000,
    MF_MEDIA_ENGINE_STREAMTYPE_FAILED_AUDIO   = 0x00000001,
    MF_MEDIA_ENGINE_STREAMTYPE_FAILED_VIDEO   = 0x00000002,
}

enum IID_IMFMediaEngineEMENotify = GUID(0x9e184d15, 0xcdb7, 0x4f86, [0xb4, 0x9e, 0x56, 0x66, 0x89, 0xf4, 0xa6, 0x1]);
interface IMFMediaEngineEMENotify : IUnknown
{
    void Encrypted(const(ubyte)*, uint, BSTR);
    void WaitingForKey();
}
alias MF_MEDIAKEYS_REQUIREMENT = int;
enum : int
{
    MF_MEDIAKEYS_REQUIREMENT_REQUIRED    = 0x00000001,
    MF_MEDIAKEYS_REQUIREMENT_OPTIONAL    = 0x00000002,
    MF_MEDIAKEYS_REQUIREMENT_NOT_ALLOWED = 0x00000003,
}

enum IID_IMFMediaKeySessionNotify2 = GUID(0xc3a9e92a, 0xda88, 0x46b0, [0xa1, 0x10, 0x6c, 0xf9, 0x53, 0x2, 0x6c, 0xb9]);
interface IMFMediaKeySessionNotify2 : IMFMediaKeySessionNotify
{
    void KeyMessage2(MF_MEDIAKEYSESSION_MESSAGETYPE, BSTR, const(ubyte)*, uint);
    void KeyStatusChange();
}
enum IID_IMFMediaKeySystemAccess = GUID(0xaec63fda, 0x7a97, 0x4944, [0xb3, 0x5c, 0x6c, 0x6d, 0xf8, 0x8, 0x5c, 0xc3]);
interface IMFMediaKeySystemAccess : IUnknown
{
    HRESULT CreateMediaKeys(IPropertyStore, IMFMediaKeys2*);
    HRESULT get_SupportedConfiguration(IPropertyStore*);
    HRESULT get_KeySystem(BSTR*);
}
enum IID_IMFMediaEngineClassFactory3 = GUID(0x3787614f, 0x65f7, 0x4003, [0xb6, 0x73, 0xea, 0xd8, 0x29, 0x3a, 0xe, 0x60]);
interface IMFMediaEngineClassFactory3 : IUnknown
{
    HRESULT CreateMediaKeySystemAccess(BSTR, IPropertyStore*, uint, IMFMediaKeySystemAccess*);
}
enum IID_IMFMediaKeys2 = GUID(0x45892507, 0xad66, 0x4de2, [0x83, 0xa2, 0xac, 0xbb, 0x13, 0xcd, 0x8d, 0x43]);
interface IMFMediaKeys2 : IMFMediaKeys
{
    HRESULT CreateSession2(MF_MEDIAKEYSESSION_TYPE, IMFMediaKeySessionNotify2, IMFMediaKeySession2*);
    HRESULT SetServerCertificate(const(ubyte)*, uint);
    HRESULT GetDOMException(HRESULT, HRESULT*);
}
enum IID_IMFMediaKeySession2 = GUID(0xe9707e05, 0x6d55, 0x4636, [0xb1, 0x85, 0x3d, 0xe2, 0x12, 0x10, 0xbd, 0x75]);
interface IMFMediaKeySession2 : IMFMediaKeySession
{
    HRESULT get_KeyStatuses(MFMediaKeyStatus**, uint*);
    HRESULT Load(BSTR, BOOL*);
    HRESULT GenerateRequest(BSTR, const(ubyte)*, uint);
    HRESULT get_Expiration(double*);
    HRESULT Remove();
    HRESULT Shutdown();
}
enum IID_IMFMediaEngineClassFactory4 = GUID(0xfbe256c1, 0x43cf, 0x4a9b, [0x8c, 0xb8, 0xce, 0x86, 0x32, 0xa3, 0x41, 0x86]);
interface IMFMediaEngineClassFactory4 : IUnknown
{
    HRESULT CreateContentDecryptionModuleFactory(const(wchar)*, const(GUID)*, void**);
}
enum IID_IMFDLNASinkInit = GUID(0xc012799, 0x1b61, 0x4c10, [0xbd, 0xa9, 0x4, 0x44, 0x5b, 0xe5, 0xf5, 0x61]);
interface IMFDLNASinkInit : IUnknown
{
    HRESULT Initialize(IMFByteStream, BOOL);
}
struct MFMPEG2DLNASINKSTATS
{
    ulong cBytesWritten;
    BOOL fPAL;
    uint fccVideo;
    uint dwVideoWidth;
    uint dwVideoHeight;
    ulong cVideoFramesReceived;
    ulong cVideoFramesEncoded;
    ulong cVideoFramesSkipped;
    ulong cBlackVideoFramesEncoded;
    ulong cVideoFramesDuplicated;
    uint cAudioSamplesPerSec;
    uint cAudioChannels;
    ulong cAudioBytesReceived;
    ulong cAudioFramesEncoded;
}
enum IID_IMFReadWriteClassFactory = GUID(0xe7fe2e12, 0x661c, 0x40da, [0x92, 0xf9, 0x4f, 0x0, 0x2a, 0xb6, 0x76, 0x27]);
interface IMFReadWriteClassFactory : IUnknown
{
    HRESULT CreateInstanceFromURL(const(GUID)*, const(wchar)*, IMFAttributes, const(GUID)*, void**);
    HRESULT CreateInstanceFromObject(const(GUID)*, IUnknown, IMFAttributes, const(GUID)*, void**);
}
alias MF_SOURCE_READER_FLAG = int;
enum : int
{
    MF_SOURCE_READERF_ERROR                   = 0x00000001,
    MF_SOURCE_READERF_ENDOFSTREAM             = 0x00000002,
    MF_SOURCE_READERF_NEWSTREAM               = 0x00000004,
    MF_SOURCE_READERF_NATIVEMEDIATYPECHANGED  = 0x00000010,
    MF_SOURCE_READERF_CURRENTMEDIATYPECHANGED = 0x00000020,
    MF_SOURCE_READERF_STREAMTICK              = 0x00000100,
    MF_SOURCE_READERF_ALLEFFECTSREMOVED       = 0x00000200,
}

alias MF_SOURCE_READER_CONTROL_FLAG = int;
enum : int
{
    MF_SOURCE_READER_CONTROLF_DRAIN = 0x00000001,
}

alias MF_SOURCE_READER_CONSTANTS = int;
enum : int
{
    MF_SOURCE_READER_INVALID_STREAM_INDEX = 0xffffffff,
    MF_SOURCE_READER_ALL_STREAMS          = 0xfffffffe,
    MF_SOURCE_READER_ANY_STREAM           = 0xfffffffe,
    MF_SOURCE_READER_FIRST_AUDIO_STREAM   = 0xfffffffd,
    MF_SOURCE_READER_FIRST_VIDEO_STREAM   = 0xfffffffc,
    MF_SOURCE_READER_MEDIASOURCE          = 0xffffffff,
}

alias MF_SOURCE_READER_CURRENT_TYPE_CONSTANTS = int;
enum : int
{
    MF_SOURCE_READER_CURRENT_TYPE_INDEX = 0xffffffff,
}

enum IID_IMFSourceReader = GUID(0x70ae66f2, 0xc809, 0x4e4f, [0x89, 0x15, 0xbd, 0xcb, 0x40, 0x6b, 0x79, 0x93]);
interface IMFSourceReader : IUnknown
{
    HRESULT GetStreamSelection(uint, BOOL*);
    HRESULT SetStreamSelection(uint, BOOL);
    HRESULT GetNativeMediaType(uint, uint, IMFMediaType*);
    HRESULT GetCurrentMediaType(uint, IMFMediaType*);
    HRESULT SetCurrentMediaType(uint, uint*, IMFMediaType);
    HRESULT SetCurrentPosition(const(GUID)*, const(PROPVARIANT)*);
    HRESULT ReadSample(uint, uint, uint*, uint*, long*, IMFSample*);
    HRESULT Flush(uint);
    HRESULT GetServiceForStream(uint, const(GUID)*, const(GUID)*, void**);
    HRESULT GetPresentationAttribute(uint, const(GUID)*, PROPVARIANT*);
}
enum IID_IMFSourceReaderEx = GUID(0x7b981cf0, 0x560e, 0x4116, [0x98, 0x75, 0xb0, 0x99, 0x89, 0x5f, 0x23, 0xd7]);
interface IMFSourceReaderEx : IMFSourceReader
{
    HRESULT SetNativeMediaType(uint, IMFMediaType, uint*);
    HRESULT AddTransformForStream(uint, IUnknown);
    HRESULT RemoveAllTransformsForStream(uint);
    HRESULT GetTransformForStream(uint, uint, GUID*, IMFTransform*);
}
enum IID_IMFSourceReaderCallback = GUID(0xdeec8d99, 0xfa1d, 0x4d82, [0x84, 0xc2, 0x2c, 0x89, 0x69, 0x94, 0x48, 0x67]);
interface IMFSourceReaderCallback : IUnknown
{
    HRESULT OnReadSample(HRESULT, uint, uint, long, IMFSample);
    HRESULT OnFlush(uint);
    HRESULT OnEvent(uint, IMFMediaEvent);
}
enum IID_IMFSourceReaderCallback2 = GUID(0xcf839fe6, 0x8c2a, 0x4dd2, [0xb6, 0xea, 0xc2, 0x2d, 0x69, 0x61, 0xaf, 0x5]);
interface IMFSourceReaderCallback2 : IMFSourceReaderCallback
{
    HRESULT OnTransformChange();
    HRESULT OnStreamError(uint, HRESULT);
}
alias MF_SINK_WRITER_CONSTANTS = uint;
enum : uint
{
    MF_SINK_WRITER_INVALID_STREAM_INDEX = 0xffffffff,
    MF_SINK_WRITER_ALL_STREAMS          = 0xfffffffe,
    MF_SINK_WRITER_MEDIASINK            = 0xffffffff,
}

struct MF_SINK_WRITER_STATISTICS
{
    uint cb;
    long llLastTimestampReceived;
    long llLastTimestampEncoded;
    long llLastTimestampProcessed;
    long llLastStreamTickReceived;
    long llLastSinkSampleRequest;
    ulong qwNumSamplesReceived;
    ulong qwNumSamplesEncoded;
    ulong qwNumSamplesProcessed;
    ulong qwNumStreamTicksReceived;
    uint dwByteCountQueued;
    ulong qwByteCountProcessed;
    uint dwNumOutstandingSinkSampleRequests;
    uint dwAverageSampleRateReceived;
    uint dwAverageSampleRateEncoded;
    uint dwAverageSampleRateProcessed;
}
enum IID_IMFSinkWriter = GUID(0x3137f1cd, 0xfe5e, 0x4805, [0xa5, 0xd8, 0xfb, 0x47, 0x74, 0x48, 0xcb, 0x3d]);
interface IMFSinkWriter : IUnknown
{
    HRESULT AddStream(IMFMediaType, uint*);
    HRESULT SetInputMediaType(uint, IMFMediaType, IMFAttributes);
    HRESULT BeginWriting();
    HRESULT WriteSample(uint, IMFSample);
    HRESULT SendStreamTick(uint, long);
    HRESULT PlaceMarker(uint, void*);
    HRESULT NotifyEndOfSegment(uint);
    HRESULT Flush(uint);
    HRESULT Finalize();
    HRESULT GetServiceForStream(uint, const(GUID)*, const(GUID)*, void**);
    HRESULT GetStatistics(uint, MF_SINK_WRITER_STATISTICS*);
}
enum IID_IMFSinkWriterEx = GUID(0x588d72ab, 0x5bc1, 0x496a, [0x87, 0x14, 0xb7, 0x6, 0x17, 0x14, 0x1b, 0x25]);
interface IMFSinkWriterEx : IMFSinkWriter
{
    HRESULT GetTransformForStream(uint, uint, GUID*, IMFTransform*);
}
enum IID_IMFSinkWriterEncoderConfig = GUID(0x17c3779e, 0x3cde, 0x4ede, [0x8c, 0x60, 0x38, 0x99, 0xf5, 0xf5, 0x3a, 0xd6]);
interface IMFSinkWriterEncoderConfig : IUnknown
{
    HRESULT SetTargetMediaType(uint, IMFMediaType, IMFAttributes);
    HRESULT PlaceEncodingParameters(uint, IMFAttributes);
}
enum IID_IMFSinkWriterCallback = GUID(0x666f76de, 0x33d2, 0x41b9, [0xa4, 0x58, 0x29, 0xed, 0xa, 0x97, 0x2c, 0x58]);
interface IMFSinkWriterCallback : IUnknown
{
    HRESULT OnFinalize(HRESULT);
    HRESULT OnMarker(uint, void*);
}
enum IID_IMFSinkWriterCallback2 = GUID(0x2456bd58, 0xc067, 0x4513, [0x84, 0xfe, 0x8d, 0xc, 0x88, 0xff, 0xdc, 0x61]);
interface IMFSinkWriterCallback2 : IMFSinkWriterCallback
{
    HRESULT OnTransformChange();
    HRESULT OnStreamError(uint, HRESULT);
}
enum IID_IMFVideoPositionMapper = GUID(0x1f6a9f17, 0xe70b, 0x4e24, [0x8a, 0xe4, 0xb, 0x2c, 0x3b, 0xa7, 0xa4, 0xae]);
interface IMFVideoPositionMapper : IUnknown
{
    HRESULT MapOutputCoordinateToInputStream(float, float, uint, uint, float*, float*);
}
enum IID_IMFVideoDeviceID = GUID(0xa38d9567, 0x5a9c, 0x4f3c, [0xb2, 0x93, 0x8e, 0xb4, 0x15, 0xb2, 0x79, 0xba]);
interface IMFVideoDeviceID : IUnknown
{
    HRESULT GetDeviceID(GUID*);
}
alias MFVideoAspectRatioMode = int;
enum : int
{
    MFVideoARMode_None             = 0x00000000,
    MFVideoARMode_PreservePicture  = 0x00000001,
    MFVideoARMode_PreservePixel    = 0x00000002,
    MFVideoARMode_NonLinearStretch = 0x00000004,
    MFVideoARMode_Mask             = 0x00000007,
}

alias MFVideoRenderPrefs = int;
enum : int
{
    MFVideoRenderPrefs_DoNotRenderBorder     = 0x00000001,
    MFVideoRenderPrefs_DoNotClipToDevice     = 0x00000002,
    MFVideoRenderPrefs_AllowOutputThrottling = 0x00000004,
    MFVideoRenderPrefs_ForceOutputThrottling = 0x00000008,
    MFVideoRenderPrefs_ForceBatching         = 0x00000010,
    MFVideoRenderPrefs_AllowBatching         = 0x00000020,
    MFVideoRenderPrefs_ForceScaling          = 0x00000040,
    MFVideoRenderPrefs_AllowScaling          = 0x00000080,
    MFVideoRenderPrefs_DoNotRepaintOnStop    = 0x00000100,
    MFVideoRenderPrefs_Mask                  = 0x000001ff,
}

enum IID_IMFVideoDisplayControl = GUID(0xa490b1e4, 0xab84, 0x4d31, [0xa1, 0xb2, 0x18, 0x1e, 0x3, 0xb1, 0x7, 0x7a]);
interface IMFVideoDisplayControl : IUnknown
{
    HRESULT GetNativeVideoSize(SIZE*, SIZE*);
    HRESULT GetIdealVideoSize(SIZE*, SIZE*);
    HRESULT SetVideoPosition(const(MFVideoNormalizedRect)*, const(RECT)*);
    HRESULT GetVideoPosition(MFVideoNormalizedRect*, RECT*);
    HRESULT SetAspectRatioMode(uint);
    HRESULT GetAspectRatioMode(uint*);
    HRESULT SetVideoWindow(HWND);
    HRESULT GetVideoWindow(HWND*);
    HRESULT RepaintVideo();
    HRESULT GetCurrentImage(BITMAPINFOHEADER*, ubyte**, uint*, long*);
    HRESULT SetBorderColor(COLORREF);
    HRESULT GetBorderColor(COLORREF*);
    HRESULT SetRenderingPrefs(uint);
    HRESULT GetRenderingPrefs(uint*);
    HRESULT SetFullscreen(BOOL);
    HRESULT GetFullscreen(BOOL*);
}
alias MFVP_MESSAGE_TYPE = int;
enum : int
{
    MFVP_MESSAGE_FLUSH               = 0x00000000,
    MFVP_MESSAGE_INVALIDATEMEDIATYPE = 0x00000001,
    MFVP_MESSAGE_PROCESSINPUTNOTIFY  = 0x00000002,
    MFVP_MESSAGE_BEGINSTREAMING      = 0x00000003,
    MFVP_MESSAGE_ENDSTREAMING        = 0x00000004,
    MFVP_MESSAGE_ENDOFSTREAM         = 0x00000005,
    MFVP_MESSAGE_STEP                = 0x00000006,
    MFVP_MESSAGE_CANCELSTEP          = 0x00000007,
}

enum IID_IMFVideoPresenter = GUID(0x29aff080, 0x182a, 0x4a5d, [0xaf, 0x3b, 0x44, 0x8f, 0x3a, 0x63, 0x46, 0xcb]);
interface IMFVideoPresenter : IMFClockStateSink
{
    HRESULT ProcessMessage(MFVP_MESSAGE_TYPE, ulong);
    HRESULT GetCurrentMediaType(IMFVideoMediaType*);
}
enum IID_IMFDesiredSample = GUID(0x56c294d0, 0x753e, 0x4260, [0x8d, 0x61, 0xa3, 0xd8, 0x82, 0xb, 0x1d, 0x54]);
interface IMFDesiredSample : IUnknown
{
    HRESULT GetDesiredSampleTimeAndDuration(long*, long*);
    void SetDesiredSampleTimeAndDuration(long, long);
    void Clear();
}
enum IID_IMFVideoMixerControl = GUID(0xa5c6c53f, 0xc202, 0x4aa5, [0x96, 0x95, 0x17, 0x5b, 0xa8, 0xc5, 0x8, 0xa5]);
interface IMFVideoMixerControl : IUnknown
{
    HRESULT SetStreamZOrder(uint, uint);
    HRESULT GetStreamZOrder(uint, uint*);
    HRESULT SetStreamOutputRect(uint, const(MFVideoNormalizedRect)*);
    HRESULT GetStreamOutputRect(uint, MFVideoNormalizedRect*);
}
alias MFVideoMixPrefs = int;
enum : int
{
    MFVideoMixPrefs_ForceHalfInterlace       = 0x00000001,
    MFVideoMixPrefs_AllowDropToHalfInterlace = 0x00000002,
    MFVideoMixPrefs_AllowDropToBob           = 0x00000004,
    MFVideoMixPrefs_ForceBob                 = 0x00000008,
    MFVideoMixPrefs_EnableRotation           = 0x00000010,
    MFVideoMixPrefs_Mask                     = 0x0000001f,
}

enum IID_IMFVideoMixerControl2 = GUID(0x8459616d, 0x966e, 0x4930, [0xb6, 0x58, 0x54, 0xfa, 0x7e, 0x5a, 0x16, 0xd3]);
interface IMFVideoMixerControl2 : IMFVideoMixerControl
{
    HRESULT SetMixingPrefs(uint);
    HRESULT GetMixingPrefs(uint*);
}
enum IID_IMFVideoRenderer = GUID(0xdfdfd197, 0xa9ca, 0x43d8, [0xb3, 0x41, 0x6a, 0xf3, 0x50, 0x37, 0x92, 0xcd]);
interface IMFVideoRenderer : IUnknown
{
    HRESULT InitializeRenderer(IMFTransform, IMFVideoPresenter);
}
enum IID_IEVRFilterConfig = GUID(0x83e91e85, 0x82c1, 0x4ea7, [0x80, 0x1d, 0x85, 0xdc, 0x50, 0xb7, 0x50, 0x86]);
interface IEVRFilterConfig : IUnknown
{
    HRESULT SetNumberOfStreams(uint);
    HRESULT GetNumberOfStreams(uint*);
}
alias EVRFilterConfigPrefs = int;
enum : int
{
    EVRFilterConfigPrefs_EnableQoS = 0x00000001,
    EVRFilterConfigPrefs_Mask      = 0x00000001,
}

enum IID_IEVRFilterConfigEx = GUID(0xaea36028, 0x796d, 0x454f, [0xbe, 0xee, 0xb4, 0x80, 0x71, 0xe2, 0x43, 0x4]);
interface IEVRFilterConfigEx : IEVRFilterConfig
{
    HRESULT SetConfigPrefs(uint);
    HRESULT GetConfigPrefs(uint*);
}
alias MF_SERVICE_LOOKUP_TYPE = int;
enum : int
{
    MF_SERVICE_LOOKUP_UPSTREAM          = 0x00000000,
    MF_SERVICE_LOOKUP_UPSTREAM_DIRECT   = 0x00000001,
    MF_SERVICE_LOOKUP_DOWNSTREAM        = 0x00000002,
    MF_SERVICE_LOOKUP_DOWNSTREAM_DIRECT = 0x00000003,
    MF_SERVICE_LOOKUP_ALL               = 0x00000004,
    MF_SERVICE_LOOKUP_GLOBAL            = 0x00000005,
}

enum IID_IMFTopologyServiceLookup = GUID(0xfa993889, 0x4383, 0x415a, [0xa9, 0x30, 0xdd, 0x47, 0x2a, 0x8c, 0xf6, 0xf7]);
interface IMFTopologyServiceLookup : IUnknown
{
    HRESULT LookupService(MF_SERVICE_LOOKUP_TYPE, uint, const(GUID)*, const(GUID)*, void**, uint*);
}
enum IID_IMFTopologyServiceLookupClient = GUID(0xfa99388a, 0x4383, 0x415a, [0xa9, 0x30, 0xdd, 0x47, 0x2a, 0x8c, 0xf6, 0xf7]);
interface IMFTopologyServiceLookupClient : IUnknown
{
    HRESULT InitServicePointers(IMFTopologyServiceLookup);
    HRESULT ReleaseServicePointers();
}
enum IID_IEVRTrustedVideoPlugin = GUID(0x83a4ce40, 0x7710, 0x494b, [0xa8, 0x93, 0xa4, 0x72, 0x4, 0x9a, 0xf6, 0x30]);
interface IEVRTrustedVideoPlugin : IUnknown
{
    HRESULT IsInTrustedVideoMode(BOOL*);
    HRESULT CanConstrict(BOOL*);
    HRESULT SetConstriction(uint);
    HRESULT DisableImageExport(BOOL);
}
alias MFP_CREATION_OPTIONS = int;
enum : int
{
    MFP_OPTION_NONE                           = 0x00000000,
    MFP_OPTION_FREE_THREADED_CALLBACK         = 0x00000001,
    MFP_OPTION_NO_MMCSS                       = 0x00000002,
    MFP_OPTION_NO_REMOTE_DESKTOP_OPTIMIZATION = 0x00000004,
}

alias MFP_MEDIAPLAYER_STATE = int;
enum : int
{
    MFP_MEDIAPLAYER_STATE_EMPTY    = 0x00000000,
    MFP_MEDIAPLAYER_STATE_STOPPED  = 0x00000001,
    MFP_MEDIAPLAYER_STATE_PLAYING  = 0x00000002,
    MFP_MEDIAPLAYER_STATE_PAUSED   = 0x00000003,
    MFP_MEDIAPLAYER_STATE_SHUTDOWN = 0x00000004,
}

alias _MFP_MEDIAITEM_CHARACTERISTICS = int;
enum : int
{
    MFP_MEDIAITEM_IS_LIVE       = 0x00000001,
    MFP_MEDIAITEM_CAN_SEEK      = 0x00000002,
    MFP_MEDIAITEM_CAN_PAUSE     = 0x00000004,
    MFP_MEDIAITEM_HAS_SLOW_SEEK = 0x00000008,
}

alias _MFP_CREDENTIAL_FLAGS = int;
enum : int
{
    MFP_CREDENTIAL_PROMPT         = 0x00000001,
    MFP_CREDENTIAL_SAVE           = 0x00000002,
    MFP_CREDENTIAL_DO_NOT_CACHE   = 0x00000004,
    MFP_CREDENTIAL_CLEAR_TEXT     = 0x00000008,
    MFP_CREDENTIAL_PROXY          = 0x00000010,
    MFP_CREDENTIAL_LOGGED_ON_USER = 0x00000020,
}

enum IID_IMFPMediaPlayer = GUID(0xa714590a, 0x58af, 0x430a, [0x85, 0xbf, 0x44, 0xf5, 0xec, 0x83, 0x8d, 0x85]);
interface IMFPMediaPlayer : IUnknown
{
    HRESULT Play();
    HRESULT Pause();
    HRESULT Stop();
    HRESULT FrameStep();
    HRESULT SetPosition(const(GUID)*, const(PROPVARIANT)*);
    HRESULT GetPosition(const(GUID)*, PROPVARIANT*);
    HRESULT GetDuration(const(GUID)*, PROPVARIANT*);
    HRESULT SetRate(float);
    HRESULT GetRate(float*);
    HRESULT GetSupportedRates(BOOL, float*, float*);
    HRESULT GetState(MFP_MEDIAPLAYER_STATE*);
    HRESULT CreateMediaItemFromURL(const(wchar)*, BOOL, ulong, IMFPMediaItem*);
    HRESULT CreateMediaItemFromObject(IUnknown, BOOL, ulong, IMFPMediaItem*);
    HRESULT SetMediaItem(IMFPMediaItem);
    HRESULT ClearMediaItem();
    HRESULT GetMediaItem(IMFPMediaItem*);
    HRESULT GetVolume(float*);
    HRESULT SetVolume(float);
    HRESULT GetBalance(float*);
    HRESULT SetBalance(float);
    HRESULT GetMute(BOOL*);
    HRESULT SetMute(BOOL);
    HRESULT GetNativeVideoSize(SIZE*, SIZE*);
    HRESULT GetIdealVideoSize(SIZE*, SIZE*);
    HRESULT SetVideoSourceRect(const(MFVideoNormalizedRect)*);
    HRESULT GetVideoSourceRect(MFVideoNormalizedRect*);
    HRESULT SetAspectRatioMode(uint);
    HRESULT GetAspectRatioMode(uint*);
    HRESULT GetVideoWindow(HWND*);
    HRESULT UpdateVideo();
    HRESULT SetBorderColor(COLORREF);
    HRESULT GetBorderColor(COLORREF*);
    HRESULT InsertEffect(IUnknown, BOOL);
    HRESULT RemoveEffect(IUnknown);
    HRESULT RemoveAllEffects();
    HRESULT Shutdown();
}
enum IID_IMFPMediaItem = GUID(0x90eb3e6b, 0xecbf, 0x45cc, [0xb1, 0xda, 0xc6, 0xfe, 0x3e, 0xa7, 0xd, 0x57]);
interface IMFPMediaItem : IUnknown
{
    HRESULT GetMediaPlayer(IMFPMediaPlayer*);
    HRESULT GetURL(PWSTR*);
    HRESULT GetObject(IUnknown*);
    HRESULT GetUserData(ulong*);
    HRESULT SetUserData(ulong);
    HRESULT GetStartStopPosition(GUID*, PROPVARIANT*, GUID*, PROPVARIANT*);
    HRESULT SetStartStopPosition(const(GUID)*, const(PROPVARIANT)*, const(GUID)*, const(PROPVARIANT)*);
    HRESULT HasVideo(BOOL*, BOOL*);
    HRESULT HasAudio(BOOL*, BOOL*);
    HRESULT IsProtected(BOOL*);
    HRESULT GetDuration(const(GUID)*, PROPVARIANT*);
    HRESULT GetNumberOfStreams(uint*);
    HRESULT GetStreamSelection(uint, BOOL*);
    HRESULT SetStreamSelection(uint, BOOL);
    HRESULT GetStreamAttribute(uint, const(GUID)*, PROPVARIANT*);
    HRESULT GetPresentationAttribute(const(GUID)*, PROPVARIANT*);
    HRESULT GetCharacteristics(uint*);
    HRESULT SetStreamSink(uint, IUnknown);
    HRESULT GetMetadata(IPropertyStore*);
}
alias MFP_EVENT_TYPE = int;
enum : int
{
    MFP_EVENT_TYPE_PLAY                    = 0x00000000,
    MFP_EVENT_TYPE_PAUSE                   = 0x00000001,
    MFP_EVENT_TYPE_STOP                    = 0x00000002,
    MFP_EVENT_TYPE_POSITION_SET            = 0x00000003,
    MFP_EVENT_TYPE_RATE_SET                = 0x00000004,
    MFP_EVENT_TYPE_MEDIAITEM_CREATED       = 0x00000005,
    MFP_EVENT_TYPE_MEDIAITEM_SET           = 0x00000006,
    MFP_EVENT_TYPE_FRAME_STEP              = 0x00000007,
    MFP_EVENT_TYPE_MEDIAITEM_CLEARED       = 0x00000008,
    MFP_EVENT_TYPE_MF                      = 0x00000009,
    MFP_EVENT_TYPE_ERROR                   = 0x0000000a,
    MFP_EVENT_TYPE_PLAYBACK_ENDED          = 0x0000000b,
    MFP_EVENT_TYPE_ACQUIRE_USER_CREDENTIAL = 0x0000000c,
}

struct MFP_EVENT_HEADER
{
    MFP_EVENT_TYPE eEventType;
    HRESULT hrEvent;
    IMFPMediaPlayer pMediaPlayer;
    MFP_MEDIAPLAYER_STATE eState;
    IPropertyStore pPropertyStore;
}
struct MFP_PLAY_EVENT
{
    MFP_EVENT_HEADER header;
    IMFPMediaItem pMediaItem;
}
struct MFP_PAUSE_EVENT
{
    MFP_EVENT_HEADER header;
    IMFPMediaItem pMediaItem;
}
struct MFP_STOP_EVENT
{
    MFP_EVENT_HEADER header;
    IMFPMediaItem pMediaItem;
}
struct MFP_POSITION_SET_EVENT
{
    MFP_EVENT_HEADER header;
    IMFPMediaItem pMediaItem;
}
struct MFP_RATE_SET_EVENT
{
    MFP_EVENT_HEADER header;
    IMFPMediaItem pMediaItem;
    float flRate;
}
struct MFP_MEDIAITEM_CREATED_EVENT
{
    MFP_EVENT_HEADER header;
    IMFPMediaItem pMediaItem;
    ulong dwUserData;
}
struct MFP_MEDIAITEM_SET_EVENT
{
    MFP_EVENT_HEADER header;
    IMFPMediaItem pMediaItem;
}
struct MFP_FRAME_STEP_EVENT
{
    MFP_EVENT_HEADER header;
    IMFPMediaItem pMediaItem;
}
struct MFP_MEDIAITEM_CLEARED_EVENT
{
    MFP_EVENT_HEADER header;
    IMFPMediaItem pMediaItem;
}
struct MFP_MF_EVENT
{
    MFP_EVENT_HEADER header;
    uint MFEventType;
    IMFMediaEvent pMFMediaEvent;
    IMFPMediaItem pMediaItem;
}
struct MFP_ERROR_EVENT
{
    MFP_EVENT_HEADER header;
}
struct MFP_PLAYBACK_ENDED_EVENT
{
    MFP_EVENT_HEADER header;
    IMFPMediaItem pMediaItem;
}
struct MFP_ACQUIRE_USER_CREDENTIAL_EVENT
{
    MFP_EVENT_HEADER header;
    ulong dwUserData;
    BOOL fProceedWithAuthentication;
    HRESULT hrAuthenticationStatus;
    const(wchar)* pwszURL;
    const(wchar)* pwszSite;
    const(wchar)* pwszRealm;
    const(wchar)* pwszPackage;
    int nRetries;
    uint flags;
    IMFNetCredential pCredential;
}
enum IID_IMFPMediaPlayerCallback = GUID(0x766c8ffb, 0x5fdb, 0x4fea, [0xa2, 0x8d, 0xb9, 0x12, 0x99, 0x6f, 0x51, 0xbd]);
interface IMFPMediaPlayerCallback : IUnknown
{
    void OnMediaPlayerEvent(MFP_EVENT_HEADER*);
}
struct DEVICE_INFO
{
    BSTR pFriendlyDeviceName;
    BSTR pUniqueDeviceName;
    BSTR pManufacturerName;
    BSTR pModelName;
    BSTR pIconURL;
}
alias MF_SHARING_ENGINE_EVENT = int;
enum : int
{
    MF_SHARING_ENGINE_EVENT_DISCONNECT            = 0x000007d0,
    MF_SHARING_ENGINE_EVENT_LOCALRENDERINGSTARTED = 0x000007d1,
    MF_SHARING_ENGINE_EVENT_LOCALRENDERINGENDED   = 0x000007d2,
    MF_SHARING_ENGINE_EVENT_STOPPED               = 0x000007d3,
    MF_SHARING_ENGINE_EVENT_ERROR                 = 0x000009c5,
}

alias MF_MEDIA_SHARING_ENGINE_EVENT = int;
enum : int
{
    MF_MEDIA_SHARING_ENGINE_EVENT_DISCONNECT = 0x000007d0,
}

enum IID_IMFSharingEngineClassFactory = GUID(0x2ba61f92, 0x8305, 0x413b, [0x97, 0x33, 0xfa, 0xf1, 0x5f, 0x25, 0x93, 0x84]);
interface IMFSharingEngineClassFactory : IUnknown
{
    HRESULT CreateInstance(uint, IMFAttributes, IUnknown*);
}
enum IID_IMFMediaSharingEngine = GUID(0x8d3ce1bf, 0x2367, 0x40e0, [0x9e, 0xee, 0x40, 0xd3, 0x77, 0xcc, 0x1b, 0x46]);
interface IMFMediaSharingEngine : IMFMediaEngine
{
    HRESULT GetDevice(DEVICE_INFO*);
}
enum IID_IMFMediaSharingEngineClassFactory = GUID(0x524d2bc4, 0xb2b1, 0x4fe5, [0x8f, 0xac, 0xfa, 0x4e, 0x45, 0x12, 0xb4, 0xe0]);
interface IMFMediaSharingEngineClassFactory : IUnknown
{
    HRESULT CreateInstance(uint, IMFAttributes, IMFMediaSharingEngine*);
}
enum IID_IMFImageSharingEngine = GUID(0xcfa0ae8e, 0x7e1c, 0x44d2, [0xae, 0x68, 0xfc, 0x4c, 0x14, 0x8a, 0x63, 0x54]);
interface IMFImageSharingEngine : IUnknown
{
    HRESULT SetSource(IUnknown);
    HRESULT GetDevice(DEVICE_INFO*);
    HRESULT Shutdown();
}
enum IID_IMFImageSharingEngineClassFactory = GUID(0x1fc55727, 0xa7fb, 0x4fc8, [0x83, 0xae, 0x8a, 0xf0, 0x24, 0x99, 0xa, 0xf1]);
interface IMFImageSharingEngineClassFactory : IUnknown
{
    HRESULT CreateInstanceFromUDN(BSTR, IMFImageSharingEngine*);
}
alias PLAYTO_SOURCE_CREATEFLAGS = int;
enum : int
{
    PLAYTO_SOURCE_NONE      = 0x00000000,
    PLAYTO_SOURCE_IMAGE     = 0x00000001,
    PLAYTO_SOURCE_AUDIO     = 0x00000002,
    PLAYTO_SOURCE_VIDEO     = 0x00000004,
    PLAYTO_SOURCE_PROTECTED = 0x00000008,
}

enum IID_IPlayToControl = GUID(0x607574eb, 0xf4b6, 0x45c1, [0xb0, 0x8c, 0xcb, 0x71, 0x51, 0x22, 0x90, 0x1d]);
interface IPlayToControl : IUnknown
{
    HRESULT Connect(IMFSharingEngineClassFactory);
    HRESULT Disconnect();
}
enum IID_IPlayToControlWithCapabilities = GUID(0xaa9dd80f, 0xc50a, 0x4220, [0x91, 0xc1, 0x33, 0x22, 0x87, 0xf8, 0x2a, 0x34]);
interface IPlayToControlWithCapabilities : IPlayToControl
{
    HRESULT GetCapabilities(PLAYTO_SOURCE_CREATEFLAGS*);
}
enum IID_IPlayToSourceClassFactory = GUID(0x842b32a3, 0x9b9b, 0x4d1c, [0xb3, 0xf3, 0x49, 0x19, 0x32, 0x48, 0xa5, 0x54]);
interface IPlayToSourceClassFactory : IUnknown
{
    HRESULT CreateInstance(uint, IPlayToControl, IInspectable*);
}
enum IID_IEVRVideoStreamControl = GUID(0xd0cfe38b, 0x93e7, 0x4772, [0x89, 0x57, 0x4, 0x0, 0xc4, 0x9a, 0x44, 0x85]);
interface IEVRVideoStreamControl : IUnknown
{
    HRESULT SetStreamActiveState(BOOL);
    HRESULT GetStreamActiveState(BOOL*);
}
enum IID_IMFVideoProcessor = GUID(0x6ab0000c, 0xfece, 0x4d1f, [0xa2, 0xac, 0xa9, 0x57, 0x35, 0x30, 0x65, 0x6e]);
interface IMFVideoProcessor : IUnknown
{
    HRESULT GetAvailableVideoProcessorModes(uint*, GUID**);
    HRESULT GetVideoProcessorCaps(GUID*, DXVA2_VideoProcessorCaps*);
    HRESULT GetVideoProcessorMode(GUID*);
    HRESULT SetVideoProcessorMode(GUID*);
    HRESULT GetProcAmpRange(uint, DXVA2_ValueRange*);
    HRESULT GetProcAmpValues(uint, DXVA2_ProcAmpValues*);
    HRESULT SetProcAmpValues(uint, DXVA2_ProcAmpValues*);
    HRESULT GetFilteringRange(uint, DXVA2_ValueRange*);
    HRESULT GetFilteringValue(uint, DXVA2_Fixed32*);
    HRESULT SetFilteringValue(uint, DXVA2_Fixed32*);
    HRESULT GetBackgroundColor(COLORREF*);
    HRESULT SetBackgroundColor(COLORREF);
}
struct MFVideoAlphaBitmapParams
{
    uint dwFlags;
    COLORREF clrSrcKey;
    RECT rcSrc;
    MFVideoNormalizedRect nrcDest;
    float fAlpha;
    uint dwFilterMode;
}
struct MFVideoAlphaBitmap
{
    BOOL GetBitmapFromDC;
    union _bitmap_e__Union
    {
        HDC hdc;
        IDirect3DSurface9 pDDS;
    }
    MFVideoAlphaBitmapParams params;
}
alias MFVideoAlphaBitmapFlags = int;
enum : int
{
    MFVideoAlphaBitmap_EntireDDS   = 0x00000001,
    MFVideoAlphaBitmap_SrcColorKey = 0x00000002,
    MFVideoAlphaBitmap_SrcRect     = 0x00000004,
    MFVideoAlphaBitmap_DestRect    = 0x00000008,
    MFVideoAlphaBitmap_FilterMode  = 0x00000010,
    MFVideoAlphaBitmap_Alpha       = 0x00000020,
    MFVideoAlphaBitmap_BitMask     = 0x0000003f,
}

enum IID_IMFVideoMixerBitmap = GUID(0x814c7b20, 0xfdb, 0x4eec, [0xaf, 0x8f, 0xf9, 0x57, 0xc8, 0xf6, 0x9e, 0xdc]);
interface IMFVideoMixerBitmap : IUnknown
{
    HRESULT SetAlphaBitmap(const(MFVideoAlphaBitmap)*);
    HRESULT ClearAlphaBitmap();
    HRESULT UpdateAlphaBitmapParameters(const(MFVideoAlphaBitmapParams)*);
    HRESULT GetAlphaBitmapParameters(MFVideoAlphaBitmapParams*);
}
enum IID_IAdvancedMediaCaptureInitializationSettings = GUID(0x3de21209, 0x8ba6, 0x4f2a, [0xa5, 0x77, 0x28, 0x19, 0xb5, 0x6f, 0xf1, 0x4d]);
interface IAdvancedMediaCaptureInitializationSettings : IUnknown
{
    HRESULT SetDirectxDeviceManager(IMFDXGIDeviceManager);
}
enum IID_IAdvancedMediaCaptureSettings = GUID(0x24e0485f, 0xa33e, 0x4aa1, [0xb5, 0x64, 0x60, 0x19, 0xb1, 0xd1, 0x4f, 0x65]);
interface IAdvancedMediaCaptureSettings : IUnknown
{
    HRESULT GetDirectxDeviceManager(IMFDXGIDeviceManager*);
}
enum IID_IAdvancedMediaCapture = GUID(0xd0751585, 0xd216, 0x4344, [0xb5, 0xbf, 0x46, 0x3b, 0x68, 0xf9, 0x77, 0xbb]);
interface IAdvancedMediaCapture : IUnknown
{
    HRESULT GetAdvancedMediaCaptureSettings(IAdvancedMediaCaptureSettings*);
}
enum IID_IMFSpatialAudioObjectBuffer = GUID(0xd396ec8c, 0x605e, 0x4249, [0x97, 0x8d, 0x72, 0xad, 0x1c, 0x31, 0x28, 0x72]);
interface IMFSpatialAudioObjectBuffer : IMFMediaBuffer
{
    HRESULT SetID(uint);
    HRESULT GetID(uint*);
    HRESULT SetType(AudioObjectType);
    HRESULT GetType(AudioObjectType*);
    HRESULT GetMetadataItems(ISpatialAudioMetadataItems*);
}
enum IID_IMFSpatialAudioSample = GUID(0xabf28a9b, 0x3393, 0x4290, [0xba, 0x79, 0x5f, 0xfc, 0x46, 0xd9, 0x86, 0xb2]);
interface IMFSpatialAudioSample : IMFSample
{
    HRESULT GetObjectCount(uint*);
    HRESULT AddSpatialAudioObject(IMFSpatialAudioObjectBuffer);
    HRESULT GetSpatialAudioObjectByIndex(uint, IMFSpatialAudioObjectBuffer*);
}
enum IID_IMFContentDecryptionModuleSession = GUID(0x4e233efd, 0x1dd2, 0x49e8, [0xb5, 0x77, 0xd6, 0x3e, 0xee, 0x4c, 0xd, 0x33]);
interface IMFContentDecryptionModuleSession : IUnknown
{
    HRESULT GetSessionId(PWSTR*);
    HRESULT GetExpiration(double*);
    HRESULT GetKeyStatuses(MFMediaKeyStatus**, uint*);
    HRESULT Load(const(wchar)*, BOOL*);
    HRESULT GenerateRequest(const(wchar)*, const(ubyte)*, uint);
    HRESULT Update(const(ubyte)*, uint);
    HRESULT Close();
    HRESULT Remove();
}
enum IID_IMFContentDecryptionModuleSessionCallbacks = GUID(0x3f96ee40, 0xad81, 0x4096, [0x84, 0x70, 0x59, 0xa4, 0xb7, 0x70, 0xf8, 0x9a]);
interface IMFContentDecryptionModuleSessionCallbacks : IUnknown
{
    HRESULT KeyMessage(MF_MEDIAKEYSESSION_MESSAGETYPE, const(ubyte)*, uint, const(wchar)*);
    HRESULT KeyStatusChanged();
}
enum IID_IMFContentDecryptionModule = GUID(0x87be986c, 0x10be, 0x4943, [0xbf, 0x48, 0x4b, 0x54, 0xce, 0x19, 0x83, 0xa2]);
interface IMFContentDecryptionModule : IUnknown
{
    HRESULT SetContentEnabler(IMFContentEnabler, IMFAsyncResult);
    HRESULT GetSuspendNotify(IMFCdmSuspendNotify*);
    HRESULT SetPMPHostApp(IMFPMPHostApp);
    HRESULT CreateSession(MF_MEDIAKEYSESSION_TYPE, IMFContentDecryptionModuleSessionCallbacks, IMFContentDecryptionModuleSession*);
    HRESULT SetServerCertificate(const(ubyte)*, uint);
    HRESULT CreateTrustedInput(const(ubyte)*, uint, IMFTrustedInput*);
    HRESULT GetProtectionSystemIds(GUID**, uint*);
}
enum IID_IMFContentDecryptionModuleAccess = GUID(0xa853d1f4, 0xe2a0, 0x4303, [0x9e, 0xdc, 0xf1, 0xa6, 0x8e, 0xe4, 0x31, 0x36]);
interface IMFContentDecryptionModuleAccess : IUnknown
{
    HRESULT CreateContentDecryptionModule(IPropertyStore, IMFContentDecryptionModule*);
    HRESULT GetConfiguration(IPropertyStore*);
    HRESULT GetKeySystem(PWSTR*);
}
enum IID_IMFContentDecryptionModuleFactory = GUID(0x7d5abf16, 0x4cbb, 0x4e08, [0xb9, 0x77, 0x9b, 0xa5, 0x90, 0x49, 0x94, 0x3e]);
interface IMFContentDecryptionModuleFactory : IUnknown
{
    BOOL IsTypeSupported(const(wchar)*, const(wchar)*);
    HRESULT CreateContentDecryptionModuleAccess(const(wchar)*, IPropertyStore*, uint, IMFContentDecryptionModuleAccess*);
}
alias MFVirtualCameraType = int;
enum : int
{
    MFVirtualCameraType_SoftwareCameraSource = 0x00000000,
}

alias MFVirtualCameraLifetime = int;
enum : int
{
    MFVirtualCameraLifetime_Session = 0x00000000,
    MFVirtualCameraLifetime_System  = 0x00000001,
}

alias MFVirtualCameraAccess = int;
enum : int
{
    MFVirtualCameraAccess_CurrentUser = 0x00000000,
    MFVirtualCameraAccess_AllUsers    = 0x00000001,
}

enum IID_IMFCameraSyncObject = GUID(0x6338b23a, 0x3042, 0x49d2, [0xa3, 0xea, 0xec, 0xf, 0xed, 0x81, 0x54, 0x7]);
interface IMFCameraSyncObject : IUnknown
{
    HRESULT WaitOnSignal(uint);
    void Shutdown();
}
enum IID_IMFVirtualCamera = GUID(0x1c08a864, 0xef6c, 0x4c75, [0xaf, 0x59, 0x5f, 0x2d, 0x68, 0xda, 0x95, 0x63]);
interface IMFVirtualCamera : IMFAttributes
{
    HRESULT AddDeviceSourceInfo(const(wchar)*);
    HRESULT AddProperty(const(DEVPROPKEY)*, uint, const(ubyte)*, uint);
    HRESULT AddRegistryEntry(const(wchar)*, const(wchar)*, uint, const(ubyte)*, uint);
    HRESULT Start(IMFAsyncCallback);
    HRESULT Stop();
    HRESULT Remove();
    HRESULT GetMediaSource(IMFMediaSource*);
    HRESULT SendCameraProperty(const(GUID)*, uint, uint, void*, uint, void*, uint, uint*);
    HRESULT CreateSyncEvent(const(GUID)*, uint, uint, HANDLE, IMFCameraSyncObject*);
    HRESULT CreateSyncSemaphore(const(GUID)*, uint, uint, HANDLE, int, IMFCameraSyncObject*);
    HRESULT Shutdown();
}
alias OPM_HDCP_TYPE = int;
enum : int
{
    OPM_HDCP_TYPE_0 = 0x00000000,
    OPM_HDCP_TYPE_1 = 0x00000001,
}

alias OPM_HDCP_STATUS = int;
enum : int
{
    OPM_HDCP_STATUS_ON  = 0x00000000,
    OPM_HDCP_STATUS_OFF = 0x00000001,
}

/+ [CONFLICTED] struct D3DCONTENTPROTECTIONCAPS
{
    align (4):
    uint Caps;
    GUID KeyExchangeType;
    uint BufferAlignmentStart;
    uint BlockAlignmentSize;
    ulong ProtectedMemorySize;
}
+/
/+ [CONFLICTED] struct DXVA_VideoSample2
{
    long rtStart;
    long rtEnd;
    uint SampleFormat;
    uint SampleFlags;
    void* lpDDSSrcSurface;
    RECT rcSrc;
    RECT rcDst;
    DXVA_AYUVsample2[16] Palette;
}
+/
