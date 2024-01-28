module windows.win32.media.audio.endpoints;

import windows.win32.guid : GUID;
import windows.win32.foundation : BOOL, HRESULT, PWSTR;
import windows.win32.media.audio : AUDIO_VOLUME_NOTIFICATION_DATA, IMMDevice, WAVEFORMATEX;
import windows.win32.media.audio.apo : APO_CONNECTION_PROPERTY;
import windows.win32.media.kernelstreaming : AUDIO_CURVE_TYPE;
import windows.win32.system.com : IUnknown;
import windows.win32.ui.shell.propertiessystem : PROPERTYKEY;

version (Windows):
extern (Windows):

enum DEVPKEY_AudioEndpointPlugin_FactoryCLSID = PROPERTYKEY(GUID(316160983, 53010, 18110, [133, 64, 129, 39, 16, 211, 2, 28]), 1);
enum DEVPKEY_AudioEndpointPlugin_DataFlow = PROPERTYKEY(GUID(316160983, 53010, 18110, [133, 64, 129, 39, 16, 211, 2, 28]), 2);
enum DEVPKEY_AudioEndpointPlugin_PnPInterface = PROPERTYKEY(GUID(316160983, 53010, 18110, [133, 64, 129, 39, 16, 211, 2, 28]), 3);
enum DEVPKEY_AudioEndpointPlugin2_FactoryCLSID = PROPERTYKEY(GUID(316160983, 53010, 18110, [133, 64, 129, 39, 16, 211, 2, 28]), 4);
enum IID_IAudioEndpointFormatControl = GUID(0x784cfd40, 0x9f89, 0x456e, [0xa1, 0xa6, 0x87, 0x3b, 0x0, 0x6a, 0x66, 0x4e]);
interface IAudioEndpointFormatControl : IUnknown
{
    HRESULT ResetToDefault(uint);
}
alias EndpointConnectorType = int;
enum : int
{
    eHostProcessConnector     = 0x00000000,
    eOffloadConnector         = 0x00000001,
    eLoopbackConnector        = 0x00000002,
    eKeywordDetectorConnector = 0x00000003,
    eConnectorCount           = 0x00000004,
}

struct AUDIO_ENDPOINT_SHARED_CREATE_PARAMS
{
    uint u32Size;
    uint u32TSSessionId;
    EndpointConnectorType targetEndpointConnectorType;
    WAVEFORMATEX wfxDeviceFormat;
}
enum IID_IAudioEndpointOffloadStreamVolume = GUID(0x64f1dd49, 0x71ca, 0x4281, [0x86, 0x72, 0x3a, 0x9e, 0xdd, 0xd1, 0xd0, 0xb6]);
interface IAudioEndpointOffloadStreamVolume : IUnknown
{
    HRESULT GetVolumeChannelCount(uint*);
    HRESULT SetChannelVolumes(uint, float*, AUDIO_CURVE_TYPE, long*);
    HRESULT GetChannelVolumes(uint, float*);
}
enum IID_IAudioEndpointOffloadStreamMute = GUID(0xdfe21355, 0x5ec2, 0x40e0, [0x8d, 0x6b, 0x71, 0xa, 0xc3, 0xc0, 0x2, 0x49]);
interface IAudioEndpointOffloadStreamMute : IUnknown
{
    HRESULT SetMute(ubyte);
    HRESULT GetMute(ubyte*);
}
enum IID_IAudioEndpointOffloadStreamMeter = GUID(0xe1546dce, 0x9dd1, 0x418b, [0x9a, 0xb2, 0x34, 0x8c, 0xed, 0x16, 0x1c, 0x86]);
interface IAudioEndpointOffloadStreamMeter : IUnknown
{
    HRESULT GetMeterChannelCount(uint*);
    HRESULT GetMeteringData(uint, float*);
}
enum IID_IAudioEndpointLastBufferControl = GUID(0xf8520dd3, 0x8f9d, 0x4437, [0x98, 0x61, 0x62, 0xf5, 0x84, 0xc3, 0x3d, 0xd6]);
interface IAudioEndpointLastBufferControl : IUnknown
{
    BOOL IsLastBufferControlSupported();
    void ReleaseOutputDataPointerForLastBuffer(const(APO_CONNECTION_PROPERTY)*);
}
enum IID_IAudioLfxControl = GUID(0x76a6922, 0xd802, 0x4f83, [0xba, 0xf6, 0x40, 0x9d, 0x9c, 0xa1, 0x1b, 0xfe]);
interface IAudioLfxControl : IUnknown
{
    HRESULT SetLocalEffectsState(BOOL);
    HRESULT GetLocalEffectsState(BOOL*);
}
enum IID_IHardwareAudioEngineBase = GUID(0xeddce3e4, 0xf3c1, 0x453a, [0xb4, 0x61, 0x22, 0x35, 0x63, 0xcb, 0xd8, 0x86]);
interface IHardwareAudioEngineBase : IUnknown
{
    HRESULT GetAvailableOffloadConnectorCount(PWSTR, uint, uint*);
    HRESULT GetEngineFormat(IMMDevice, BOOL, WAVEFORMATEX**);
    HRESULT SetEngineDeviceFormat(IMMDevice, WAVEFORMATEX*);
    HRESULT SetGfxState(IMMDevice, BOOL);
    HRESULT GetGfxState(IMMDevice, BOOL*);
}
enum CLSID_DEVINTERFACE_AUDIOENDPOINTPLUGIN = GUID(0x9f2f7b66, 0x65ac, 0x4fa6, [0x8a, 0xe4, 0x12, 0x3c, 0x78, 0xb8, 0x93, 0x13]);
struct DEVINTERFACE_AUDIOENDPOINTPLUGIN
{
}
enum IID_IAudioEndpointVolumeCallback = GUID(0x657804fa, 0xd6ad, 0x4496, [0x8a, 0x60, 0x35, 0x27, 0x52, 0xaf, 0x4f, 0x89]);
interface IAudioEndpointVolumeCallback : IUnknown
{
    HRESULT OnNotify(AUDIO_VOLUME_NOTIFICATION_DATA*);
}
enum IID_IAudioEndpointVolume = GUID(0x5cdf2c82, 0x841e, 0x4546, [0x97, 0x22, 0xc, 0xf7, 0x40, 0x78, 0x22, 0x9a]);
interface IAudioEndpointVolume : IUnknown
{
    HRESULT RegisterControlChangeNotify(IAudioEndpointVolumeCallback);
    HRESULT UnregisterControlChangeNotify(IAudioEndpointVolumeCallback);
    HRESULT GetChannelCount(uint*);
    HRESULT SetMasterVolumeLevel(float, const(GUID)*);
    HRESULT SetMasterVolumeLevelScalar(float, const(GUID)*);
    HRESULT GetMasterVolumeLevel(float*);
    HRESULT GetMasterVolumeLevelScalar(float*);
    HRESULT SetChannelVolumeLevel(uint, float, const(GUID)*);
    HRESULT SetChannelVolumeLevelScalar(uint, float, const(GUID)*);
    HRESULT GetChannelVolumeLevel(uint, float*);
    HRESULT GetChannelVolumeLevelScalar(uint, float*);
    HRESULT SetMute(BOOL, const(GUID)*);
    HRESULT GetMute(BOOL*);
    HRESULT GetVolumeStepInfo(uint*, uint*);
    HRESULT VolumeStepUp(const(GUID)*);
    HRESULT VolumeStepDown(const(GUID)*);
    HRESULT QueryHardwareSupport(uint*);
    HRESULT GetVolumeRange(float*, float*, float*);
}
enum IID_IAudioEndpointVolumeEx = GUID(0x66e11784, 0xf695, 0x4f28, [0xa5, 0x5, 0xa7, 0x8, 0x0, 0x81, 0xa7, 0x8f]);
interface IAudioEndpointVolumeEx : IAudioEndpointVolume
{
    HRESULT GetVolumeRangeChannel(uint, float*, float*, float*);
}
enum IID_IAudioMeterInformation = GUID(0xc02216f6, 0x8c67, 0x4b5b, [0x9d, 0x0, 0xd0, 0x8, 0xe7, 0x3e, 0x0, 0x64]);
interface IAudioMeterInformation : IUnknown
{
    HRESULT GetPeakValue(float*);
    HRESULT GetMeteringChannelCount(uint*);
    HRESULT GetChannelsPeakValues(uint, float*);
    HRESULT QueryHardwareSupport(uint*);
}
