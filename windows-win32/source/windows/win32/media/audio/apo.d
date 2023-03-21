module windows.win32.media.audio.apo;

import windows.win32.guid : GUID;
import windows.win32.foundation : BOOL, HANDLE, HRESULT, LPARAM, PWSTR;
import windows.win32.media.audio_ : AUDIO_SYSTEMEFFECTS_PROPERTYSTORE_TYPE, AUDIO_VOLUME_NOTIFICATION_DATA, IMMDevice, IMMDeviceCollection, WAVEFORMATEX;
import windows.win32.system.com_ : IServiceProvider, IUnknown;
import windows.win32.ui.shell.propertiessystem : IPropertyStore, PROPERTYKEY;

version (Windows):
extern (Windows):

enum APOERR_ALREADY_INITIALIZED = 0xffffffff887d0001;
enum APOERR_NOT_INITIALIZED = 0xffffffff887d0002;
enum APOERR_FORMAT_NOT_SUPPORTED = 0xffffffff887d0003;
enum APOERR_INVALID_APO_CLSID = 0xffffffff887d0004;
enum APOERR_BUFFERS_OVERLAP = 0xffffffff887d0005;
enum APOERR_ALREADY_UNLOCKED = 0xffffffff887d0006;
enum APOERR_NUM_CONNECTIONS_INVALID = 0xffffffff887d0007;
enum APOERR_INVALID_OUTPUT_MAXFRAMECOUNT = 0xffffffff887d0008;
enum APOERR_INVALID_CONNECTION_FORMAT = 0xffffffff887d0009;
enum APOERR_APO_LOCKED = 0xffffffff887d000a;
enum APOERR_INVALID_COEFFCOUNT = 0xffffffff887d000b;
enum APOERR_INVALID_COEFFICIENT = 0xffffffff887d000c;
enum APOERR_INVALID_CURVE_PARAM = 0xffffffff887d000d;
enum APOERR_INVALID_INPUTID = 0xffffffff887d000e;
enum AUDIO_MIN_FRAMERATE = 10.000000;
enum AUDIO_MAX_FRAMERATE = 384000.000000;
enum AUDIO_MIN_CHANNELS = 0x00000001;
enum AUDIO_MAX_CHANNELS = 0x00001000;
//enum PKEY_FX_Association = [MISSING];
//enum PKEY_FX_PreMixEffectClsid = [MISSING];
//enum PKEY_FX_PostMixEffectClsid = [MISSING];
//enum PKEY_FX_UserInterfaceClsid = [MISSING];
//enum PKEY_FX_FriendlyName = [MISSING];
//enum PKEY_FX_StreamEffectClsid = [MISSING];
//enum PKEY_FX_ModeEffectClsid = [MISSING];
//enum PKEY_FX_EndpointEffectClsid = [MISSING];
//enum PKEY_FX_KeywordDetector_StreamEffectClsid = [MISSING];
//enum PKEY_FX_KeywordDetector_ModeEffectClsid = [MISSING];
//enum PKEY_FX_KeywordDetector_EndpointEffectClsid = [MISSING];
//enum PKEY_FX_Offload_StreamEffectClsid = [MISSING];
//enum PKEY_FX_Offload_ModeEffectClsid = [MISSING];
//enum PKEY_CompositeFX_StreamEffectClsid = [MISSING];
//enum PKEY_CompositeFX_ModeEffectClsid = [MISSING];
//enum PKEY_CompositeFX_EndpointEffectClsid = [MISSING];
//enum PKEY_CompositeFX_KeywordDetector_StreamEffectClsid = [MISSING];
//enum PKEY_CompositeFX_KeywordDetector_ModeEffectClsid = [MISSING];
//enum PKEY_CompositeFX_KeywordDetector_EndpointEffectClsid = [MISSING];
//enum PKEY_CompositeFX_Offload_StreamEffectClsid = [MISSING];
//enum PKEY_CompositeFX_Offload_ModeEffectClsid = [MISSING];
//enum PKEY_FX_SupportAppLauncher = [MISSING];
//enum PKEY_FX_SupportedFormats = [MISSING];
//enum PKEY_FX_Enumerator = [MISSING];
//enum PKEY_FX_VersionMajor = [MISSING];
//enum PKEY_FX_VersionMinor = [MISSING];
//enum PKEY_FX_Author = [MISSING];
//enum PKEY_FX_ObjectId = [MISSING];
//enum PKEY_FX_State = [MISSING];
//enum PKEY_FX_EffectPackSchema_Version = [MISSING];
//enum PKEY_FX_ApplyToBluetooth = [MISSING];
//enum PKEY_FX_ApplyToUsb = [MISSING];
//enum PKEY_FX_ApplyToRender = [MISSING];
//enum PKEY_FX_ApplyToCapture = [MISSING];
//enum PKEY_SFX_ProcessingModes_Supported_For_Streaming = [MISSING];
//enum PKEY_MFX_ProcessingModes_Supported_For_Streaming = [MISSING];
//enum PKEY_EFX_ProcessingModes_Supported_For_Streaming = [MISSING];
//enum PKEY_SFX_KeywordDetector_ProcessingModes_Supported_For_Streaming = [MISSING];
//enum PKEY_MFX_KeywordDetector_ProcessingModes_Supported_For_Streaming = [MISSING];
//enum PKEY_EFX_KeywordDetector_ProcessingModes_Supported_For_Streaming = [MISSING];
//enum PKEY_SFX_Offload_ProcessingModes_Supported_For_Streaming = [MISSING];
//enum PKEY_MFX_Offload_ProcessingModes_Supported_For_Streaming = [MISSING];
//enum PKEY_APO_SWFallback_ProcessingModes = [MISSING];
enum PKEY_FX_EffectPack_Schema_V1 = GUID(0x7abf23d9, 0x727e, 0x4d0b, [0x86, 0xa3, 0xdd, 0x50, 0x1d, 0x26, 0x0, 0x1]);
enum SID_AudioProcessingObjectRTQueue = GUID(0x458c1a1f, 0x6899, 0x4c12, [0x99, 0xac, 0xe2, 0xe6, 0xac, 0x25, 0x31, 0x4]);
enum SID_AudioProcessingObjectLoggingService = GUID(0x8b8008af, 0x9f9, 0x456e, [0xa1, 0x73, 0xbd, 0xb5, 0x84, 0x99, 0xbc, 0xe7]);
enum AUDIOMEDIATYPE_EQUAL_FORMAT_TYPES = 0x00000002;
enum AUDIOMEDIATYPE_EQUAL_FORMAT_DATA = 0x00000004;
enum AUDIOMEDIATYPE_EQUAL_FORMAT_USER_DATA = 0x00000008;
struct UNCOMPRESSEDAUDIOFORMAT
{
    GUID guidFormatType;
    uint dwSamplesPerFrame;
    uint dwBytesPerSampleContainer;
    uint dwValidBitsPerSample;
    float fFramesPerSecond;
    uint dwChannelMask;
}
enum IID_IAudioMediaType = GUID(0x4e997f73, 0xb71f, 0x4798, [0x87, 0x3b, 0xed, 0x7d, 0xfc, 0xf1, 0x5b, 0x4d]);
interface IAudioMediaType : IUnknown
{
    HRESULT IsCompressedFormat(BOOL*);
    HRESULT IsEqual(IAudioMediaType, uint*);
    WAVEFORMATEX* GetAudioFormat();
    HRESULT GetUncompressedAudioFormat(UNCOMPRESSEDAUDIOFORMAT*);
}
alias APO_BUFFER_FLAGS = int;
enum : int
{
    BUFFER_INVALID = 0x00000000,
    BUFFER_VALID   = 0x00000001,
    BUFFER_SILENT  = 0x00000002,
}

struct APO_CONNECTION_PROPERTY
{
    ulong pBuffer;
    uint u32ValidFrameCount;
    APO_BUFFER_FLAGS u32BufferFlags;
    uint u32Signature;
}
struct APO_CONNECTION_PROPERTY_V2
{
    APO_CONNECTION_PROPERTY property;
    ulong u64QPCTime;
}
alias APO_CONNECTION_BUFFER_TYPE = int;
enum : int
{
    APO_CONNECTION_BUFFER_TYPE_ALLOCATED = 0x00000000,
    APO_CONNECTION_BUFFER_TYPE_EXTERNAL  = 0x00000001,
    APO_CONNECTION_BUFFER_TYPE_DEPENDANT = 0x00000002,
}

struct APO_CONNECTION_DESCRIPTOR
{
    APO_CONNECTION_BUFFER_TYPE Type;
    ulong pBuffer;
    uint u32MaxFrameCount;
    IAudioMediaType pFormat;
    uint u32Signature;
}
alias APO_FLAG = int;
enum : int
{
    APO_FLAG_NONE                       = 0x00000000,
    APO_FLAG_INPLACE                    = 0x00000001,
    APO_FLAG_SAMPLESPERFRAME_MUST_MATCH = 0x00000002,
    APO_FLAG_FRAMESPERSECOND_MUST_MATCH = 0x00000004,
    APO_FLAG_BITSPERSAMPLE_MUST_MATCH   = 0x00000008,
    APO_FLAG_MIXER                      = 0x00000010,
    APO_FLAG_DEFAULT                    = 0x0000000e,
}

struct APO_REG_PROPERTIES
{
    GUID clsid;
    APO_FLAG Flags;
    wchar[256] szFriendlyName;
    wchar[256] szCopyrightInfo;
    uint u32MajorVersion;
    uint u32MinorVersion;
    uint u32MinInputConnections;
    uint u32MaxInputConnections;
    uint u32MinOutputConnections;
    uint u32MaxOutputConnections;
    uint u32MaxInstances;
    uint u32NumAPOInterfaces;
    GUID[1] iidAPOInterfaceList;
}
struct APOInitBaseStruct
{
    uint cbSize;
    GUID clsid;
}
alias AUDIO_FLOW_TYPE = int;
enum : int
{
    AUDIO_FLOW_PULL = 0x00000000,
    AUDIO_FLOW_PUSH = 0x00000001,
}

alias EAudioConstriction = int;
enum : int
{
    eAudioConstrictionOff   = 0x00000000,
    eAudioConstriction48_16 = 0x00000001,
    eAudioConstriction44_16 = 0x00000002,
    eAudioConstriction14_14 = 0x00000003,
    eAudioConstrictionMute  = 0x00000004,
}

enum IID_IAudioProcessingObjectRT = GUID(0x9e1d6a6d, 0xddbc, 0x4e95, [0xa4, 0xc7, 0xad, 0x64, 0xba, 0x37, 0x84, 0x6c]);
interface IAudioProcessingObjectRT : IUnknown
{
    void APOProcess(uint, APO_CONNECTION_PROPERTY**, uint, APO_CONNECTION_PROPERTY**);
    uint CalcInputFrames(uint);
    uint CalcOutputFrames(uint);
}
enum IID_IAudioProcessingObjectVBR = GUID(0x7ba1db8f, 0x78ad, 0x49cd, [0x95, 0x91, 0xf7, 0x9d, 0x80, 0xa1, 0x7c, 0x81]);
interface IAudioProcessingObjectVBR : IUnknown
{
    HRESULT CalcMaxInputFrames(uint, uint*);
    HRESULT CalcMaxOutputFrames(uint, uint*);
}
enum IID_IAudioProcessingObjectConfiguration = GUID(0xe5ed805, 0xaba6, 0x49c3, [0x8f, 0x9a, 0x2b, 0x8c, 0x88, 0x9c, 0x4f, 0xa8]);
interface IAudioProcessingObjectConfiguration : IUnknown
{
    HRESULT LockForProcess(uint, APO_CONNECTION_DESCRIPTOR**, uint, APO_CONNECTION_DESCRIPTOR**);
    HRESULT UnlockForProcess();
}
enum IID_IAudioProcessingObject = GUID(0xfd7f2b29, 0x24d0, 0x4b5c, [0xb1, 0x77, 0x59, 0x2c, 0x39, 0xf9, 0xca, 0x10]);
interface IAudioProcessingObject : IUnknown
{
    HRESULT Reset();
    HRESULT GetLatency(long*);
    HRESULT GetRegistrationProperties(APO_REG_PROPERTIES**);
    HRESULT Initialize(uint, ubyte*);
    HRESULT IsInputFormatSupported(IAudioMediaType, IAudioMediaType, IAudioMediaType*);
    HRESULT IsOutputFormatSupported(IAudioMediaType, IAudioMediaType, IAudioMediaType*);
    HRESULT GetInputChannelCount(uint*);
}
enum IID_IAudioDeviceModulesClient = GUID(0x98f37dac, 0xd0b6, 0x49f5, [0x89, 0x6a, 0xaa, 0x4d, 0x16, 0x9a, 0x4c, 0x48]);
interface IAudioDeviceModulesClient : IUnknown
{
    HRESULT SetAudioDeviceModulesManager(IUnknown);
}
alias FNAPONOTIFICATIONCALLBACK = HRESULT function(APO_REG_PROPERTIES*, void*);
enum IID_IAudioSystemEffects = GUID(0x5fa00f27, 0xadd6, 0x499a, [0x8a, 0x9d, 0x6b, 0x98, 0x52, 0x1f, 0xa7, 0x5b]);
interface IAudioSystemEffects : IUnknown
{
}
enum IID_IAudioSystemEffects2 = GUID(0xbafe99d2, 0x7436, 0x44ce, [0x9e, 0xe, 0x4d, 0x89, 0xaf, 0xbf, 0xff, 0x56]);
interface IAudioSystemEffects2 : IAudioSystemEffects
{
    HRESULT GetEffectsList(GUID**, uint*, HANDLE);
}
enum IID_IAudioSystemEffectsCustomFormats = GUID(0xb1176e34, 0xbb7f, 0x4f05, [0xbe, 0xbd, 0x1b, 0x18, 0xa5, 0x34, 0xe0, 0x97]);
interface IAudioSystemEffectsCustomFormats : IUnknown
{
    HRESULT GetFormatCount(uint*);
    HRESULT GetFormat(uint, IAudioMediaType*);
    HRESULT GetFormatRepresentation(uint, PWSTR*);
}
enum IID_IApoAuxiliaryInputConfiguration = GUID(0x4ceb0aab, 0xfa19, 0x48ed, [0xa8, 0x57, 0x87, 0x77, 0x1a, 0xe1, 0xb7, 0x68]);
interface IApoAuxiliaryInputConfiguration : IUnknown
{
    HRESULT AddAuxiliaryInput(uint, uint, ubyte*, APO_CONNECTION_DESCRIPTOR*);
    HRESULT RemoveAuxiliaryInput(uint);
    HRESULT IsInputFormatSupported(IAudioMediaType, IAudioMediaType*);
}
enum IID_IApoAuxiliaryInputRT = GUID(0xf851809c, 0xc177, 0x49a0, [0xb1, 0xb2, 0xb6, 0x6f, 0x1, 0x79, 0x43, 0xab]);
interface IApoAuxiliaryInputRT : IUnknown
{
    void AcceptInput(uint, const(APO_CONNECTION_PROPERTY)*);
}
enum IID_IApoAcousticEchoCancellation = GUID(0x25385759, 0x3236, 0x4101, [0xa9, 0x43, 0x25, 0x69, 0x3d, 0xfb, 0x5d, 0x2d]);
interface IApoAcousticEchoCancellation : IUnknown
{
}
struct APOInitSystemEffects
{
    APOInitBaseStruct APOInit;
    IPropertyStore pAPOEndpointProperties;
    IPropertyStore pAPOSystemEffectsProperties;
    void* pReserved;
    IMMDeviceCollection pDeviceCollection;
}
struct APOInitSystemEffects2
{
    APOInitBaseStruct APOInit;
    IPropertyStore pAPOEndpointProperties;
    IPropertyStore pAPOSystemEffectsProperties;
    void* pReserved;
    IMMDeviceCollection pDeviceCollection;
    uint nSoftwareIoDeviceInCollection;
    uint nSoftwareIoConnectorIndex;
    GUID AudioProcessingMode;
    BOOL InitializeForDiscoveryOnly;
}
struct AudioFXExtensionParams
{
    LPARAM AddPageParam;
    PWSTR pwstrEndpointID;
    IPropertyStore pFxProperties;
}
alias AUDIO_SYSTEMEFFECT_STATE = int;
enum : int
{
    AUDIO_SYSTEMEFFECT_STATE_OFF = 0x00000000,
    AUDIO_SYSTEMEFFECT_STATE_ON  = 0x00000001,
}

struct AUDIO_SYSTEMEFFECT
{
    GUID id;
    BOOL canSetState;
    AUDIO_SYSTEMEFFECT_STATE state;
}
enum IID_IAudioSystemEffects3 = GUID(0xc58b31cd, 0xfc6a, 0x4255, [0xbc, 0x1f, 0xad, 0x29, 0xbb, 0xa, 0x4a, 0x17]);
interface IAudioSystemEffects3 : IAudioSystemEffects2
{
    HRESULT GetControllableSystemEffectsList(AUDIO_SYSTEMEFFECT**, uint*, HANDLE);
    HRESULT SetAudioSystemEffectState(GUID, AUDIO_SYSTEMEFFECT_STATE);
}
struct APOInitSystemEffects3
{
    APOInitBaseStruct APOInit;
    IPropertyStore pAPOEndpointProperties;
    IServiceProvider pServiceProvider;
    IMMDeviceCollection pDeviceCollection;
    uint nSoftwareIoDeviceInCollection;
    uint nSoftwareIoConnectorIndex;
    GUID AudioProcessingMode;
    BOOL InitializeForDiscoveryOnly;
}
enum IID_IAudioProcessingObjectRTQueueService = GUID(0xacd65e2f, 0x955b, 0x4b57, [0xb9, 0xbf, 0xac, 0x29, 0x7b, 0xb7, 0x52, 0xc9]);
interface IAudioProcessingObjectRTQueueService : IUnknown
{
    HRESULT GetRealTimeWorkQueue(uint*);
}
alias APO_LOG_LEVEL = int;
enum : int
{
    APO_LOG_LEVEL_ALWAYS   = 0x00000000,
    APO_LOG_LEVEL_CRITICAL = 0x00000001,
    APO_LOG_LEVEL_ERROR    = 0x00000002,
    APO_LOG_LEVEL_WARNING  = 0x00000003,
    APO_LOG_LEVEL_INFO     = 0x00000004,
    APO_LOG_LEVEL_VERBOSE  = 0x00000005,
}

enum IID_IAudioProcessingObjectLoggingService = GUID(0x698f0107, 0x1745, 0x4708, [0x95, 0xa5, 0xd8, 0x44, 0x78, 0xa6, 0x2a, 0x65]);
interface IAudioProcessingObjectLoggingService : IUnknown
{
    void ApoLog(APO_LOG_LEVEL, const(wchar)*);
}
alias APO_NOTIFICATION_TYPE = int;
enum : int
{
    APO_NOTIFICATION_TYPE_NONE                           = 0x00000000,
    APO_NOTIFICATION_TYPE_ENDPOINT_VOLUME                = 0x00000001,
    APO_NOTIFICATION_TYPE_ENDPOINT_PROPERTY_CHANGE       = 0x00000002,
    APO_NOTIFICATION_TYPE_SYSTEM_EFFECTS_PROPERTY_CHANGE = 0x00000003,
    APO_NOTIFICATION_TYPE_ENDPOINT_VOLUME2               = 0x00000004,
    APO_NOTIFICATION_TYPE_DEVICE_ORIENTATION             = 0x00000005,
    APO_NOTIFICATION_TYPE_MICROPHONE_BOOST               = 0x00000006,
}

struct AUDIO_ENDPOINT_VOLUME_CHANGE_NOTIFICATION
{
    IMMDevice endpoint;
    AUDIO_VOLUME_NOTIFICATION_DATA* volume;
}
struct AUDIO_ENDPOINT_PROPERTY_CHANGE_NOTIFICATION
{
    IMMDevice endpoint;
    IPropertyStore propertyStore;
    PROPERTYKEY propertyKey;
}
struct AUDIO_SYSTEMEFFECTS_PROPERTY_CHANGE_NOTIFICATION
{
    IMMDevice endpoint;
    GUID propertyStoreContext;
    AUDIO_SYSTEMEFFECTS_PROPERTYSTORE_TYPE propertyStoreType;
    IPropertyStore propertyStore;
    PROPERTYKEY propertyKey;
}
struct AUDIO_VOLUME_NOTIFICATION_DATA2
{
    AUDIO_VOLUME_NOTIFICATION_DATA* notificationData;
    float masterVolumeInDb;
    float volumeMinInDb;
    float volumeMaxInDb;
    float volumeIncrementInDb;
    uint step;
    uint stepCount;
    float[1] channelVolumesInDb;
}
struct AUDIO_ENDPOINT_VOLUME_CHANGE_NOTIFICATION2
{
    IMMDevice endpoint;
    AUDIO_VOLUME_NOTIFICATION_DATA2* volume;
}
alias DEVICE_ORIENTATION_TYPE = int;
enum : int
{
    DEVICE_NOT_ROTATED                   = 0x00000000,
    DEVICE_ROTATED_90_DEGREES_CLOCKWISE  = 0x00000001,
    DEVICE_ROTATED_180_DEGREES_CLOCKWISE = 0x00000002,
    DEVICE_ROTATED_270_DEGREES_CLOCKWISE = 0x00000003,
}

struct AUDIO_MICROPHONE_BOOST_NOTIFICATION
{
    IMMDevice endpoint;
    GUID eventContext;
    BOOL microphoneBoostEnabled;
    float levelInDb;
    float levelMinInDb;
    float levelMaxInDb;
    float levelStepInDb;
    BOOL muteSupported;
    BOOL mute;
}
struct APO_NOTIFICATION
{
    APO_NOTIFICATION_TYPE type;
    union
    {
        AUDIO_ENDPOINT_VOLUME_CHANGE_NOTIFICATION audioEndpointVolumeChange;
        AUDIO_ENDPOINT_PROPERTY_CHANGE_NOTIFICATION audioEndpointPropertyChange;
        AUDIO_SYSTEMEFFECTS_PROPERTY_CHANGE_NOTIFICATION audioSystemEffectsPropertyChange;
        AUDIO_ENDPOINT_VOLUME_CHANGE_NOTIFICATION2 audioEndpointVolumeChange2;
        DEVICE_ORIENTATION_TYPE deviceOrientation;
        AUDIO_MICROPHONE_BOOST_NOTIFICATION audioMicrophoneBoostChange;
    }
}
struct AUDIO_ENDPOINT_VOLUME_APO_NOTIFICATION_DESCRIPTOR
{
    IMMDevice device;
}
struct AUDIO_ENDPOINT_PROPERTY_CHANGE_APO_NOTIFICATION_DESCRIPTOR
{
    IMMDevice device;
}
struct AUDIO_SYSTEMEFFECTS_PROPERTY_CHANGE_APO_NOTIFICATION_DESCRIPTOR
{
    IMMDevice device;
    GUID propertyStoreContext;
}
struct AUDIO_MICROPHONE_BOOST_APO_NOTIFICATION_DESCRIPTOR
{
    IMMDevice device;
}
struct APO_NOTIFICATION_DESCRIPTOR
{
    APO_NOTIFICATION_TYPE type;
    union
    {
        AUDIO_ENDPOINT_VOLUME_APO_NOTIFICATION_DESCRIPTOR audioEndpointVolume;
        AUDIO_ENDPOINT_PROPERTY_CHANGE_APO_NOTIFICATION_DESCRIPTOR audioEndpointPropertyChange;
        AUDIO_SYSTEMEFFECTS_PROPERTY_CHANGE_APO_NOTIFICATION_DESCRIPTOR audioSystemEffectsPropertyChange;
        AUDIO_MICROPHONE_BOOST_APO_NOTIFICATION_DESCRIPTOR audioMicrophoneBoost;
    }
}
enum IID_IAudioProcessingObjectNotifications = GUID(0x56b0c76f, 0x2fd, 0x4b21, [0xa5, 0x2e, 0x9f, 0x82, 0x19, 0xfc, 0x86, 0xe4]);
interface IAudioProcessingObjectNotifications : IUnknown
{
    HRESULT GetApoNotificationRegistrationInfo(APO_NOTIFICATION_DESCRIPTOR**, uint*);
    void HandleNotification(APO_NOTIFICATION*);
}
enum IID_IAudioProcessingObjectNotifications2 = GUID(0xca2cfbde, 0xa9d6, 0x4eb0, [0xbc, 0x95, 0xc4, 0xd0, 0x26, 0xb3, 0x80, 0xf0]);
interface IAudioProcessingObjectNotifications2 : IAudioProcessingObjectNotifications
{
    HRESULT GetApoNotificationRegistrationInfo2(APO_NOTIFICATION_TYPE, APO_NOTIFICATION_DESCRIPTOR**, uint*);
}
