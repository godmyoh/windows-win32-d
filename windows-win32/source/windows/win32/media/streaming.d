module windows.win32.media.streaming;

import windows.win32.guid : GUID;
import windows.win32.devices.properties : DEVPROPKEY;
import windows.win32.foundation : RECT;

version (Windows):
extern (Windows):

enum DEVPKEY_Device_PacketWakeSupported = DEVPROPKEY(GUID(2293053915, 3340, 19000, [132, 53, 64, 67, 130, 107, 92, 145]), 0);
enum DEVPKEY_Device_SendPacketWakeSupported = DEVPROPKEY(GUID(2293053915, 3340, 19000, [132, 53, 64, 67, 130, 107, 92, 145]), 1);
enum DEVPKEY_Device_UDN = DEVPROPKEY(GUID(2293053915, 3340, 19000, [132, 53, 64, 67, 130, 107, 92, 145]), 6);
enum DEVPKEY_Device_SupportsAudio = DEVPROPKEY(GUID(2293053915, 3340, 19000, [132, 53, 64, 67, 130, 107, 92, 145]), 8);
enum DEVPKEY_Device_SupportsVideo = DEVPROPKEY(GUID(2293053915, 3340, 19000, [132, 53, 64, 67, 130, 107, 92, 145]), 9);
enum DEVPKEY_Device_SupportsImages = DEVPROPKEY(GUID(2293053915, 3340, 19000, [132, 53, 64, 67, 130, 107, 92, 145]), 10);
enum DEVPKEY_Device_SinkProtocolInfo = DEVPROPKEY(GUID(2293053915, 3340, 19000, [132, 53, 64, 67, 130, 107, 92, 145]), 14);
enum DEVPKEY_Device_DLNADOC = DEVPROPKEY(GUID(2293053915, 3340, 19000, [132, 53, 64, 67, 130, 107, 92, 145]), 15);
enum DEVPKEY_Device_DLNACAP = DEVPROPKEY(GUID(2293053915, 3340, 19000, [132, 53, 64, 67, 130, 107, 92, 145]), 16);
enum DEVPKEY_Device_SupportsSearch = DEVPROPKEY(GUID(2293053915, 3340, 19000, [132, 53, 64, 67, 130, 107, 92, 145]), 17);
enum DEVPKEY_Device_SupportsMute = DEVPROPKEY(GUID(2293053915, 3340, 19000, [132, 53, 64, 67, 130, 107, 92, 145]), 18);
enum DEVPKEY_Device_MaxVolume = DEVPROPKEY(GUID(2293053915, 3340, 19000, [132, 53, 64, 67, 130, 107, 92, 145]), 19);
enum DEVPKEY_Device_SupportsSetNextAVT = DEVPROPKEY(GUID(2293053915, 3340, 19000, [132, 53, 64, 67, 130, 107, 92, 145]), 20);
enum GUID_DEVINTERFACE_DMR = GUID(0xd0875fb4, 0x2196, 0x4c7a, [0xa6, 0x3d, 0xe4, 0x16, 0xad, 0xdd, 0x60, 0xa1]);
enum GUID_DEVINTERFACE_DMP = GUID(0x25b4e268, 0x2a05, 0x496e, [0x80, 0x3b, 0x26, 0x68, 0x37, 0xfb, 0xda, 0x4b]);
enum GUID_DEVINTERFACE_DMS = GUID(0xc96037ae, 0xa558, 0x4470, [0xb4, 0x32, 0x11, 0x5a, 0x31, 0xb8, 0x55, 0x53]);
alias MF_TRANSFER_VIDEO_FRAME_FLAGS = int;
enum : int
{
    MF_TRANSFER_VIDEO_FRAME_DEFAULT    = 0x00000000,
    MF_TRANSFER_VIDEO_FRAME_STRETCH    = 0x00000001,
    MF_TRANSFER_VIDEO_FRAME_IGNORE_PAR = 0x00000002,
}

alias MF_MEDIASOURCE_STATUS_INFO = int;
enum : int
{
    MF_MEDIASOURCE_STATUS_INFO_FULLYSUPPORTED = 0x00000000,
    MF_MEDIASOURCE_STATUS_INFO_UNKNOWN        = 0x00000001,
}

struct FaceRectInfoBlobHeader
{
    uint Size;
    uint Count;
}
struct FaceRectInfo
{
    RECT Region;
    int confidenceLevel;
}
struct FaceCharacterizationBlobHeader
{
    uint Size;
    uint Count;
}
struct FaceCharacterization
{
    uint BlinkScoreLeft;
    uint BlinkScoreRight;
    uint FacialExpression;
    uint FacialExpressionScore;
}
struct CapturedMetadataExposureCompensation
{
    ulong Flags;
    int Value;
}
struct CapturedMetadataISOGains
{
    float AnalogGain;
    float DigitalGain;
}
struct CapturedMetadataWhiteBalanceGains
{
    float R;
    float G;
    float B;
}
struct MetadataTimeStamps
{
    uint Flags;
    long Device;
    long Presentation;
}
struct HistogramGrid
{
    uint Width;
    uint Height;
    RECT Region;
}
struct HistogramBlobHeader
{
    uint Size;
    uint Histograms;
}
struct HistogramHeader
{
    uint Size;
    uint Bins;
    uint FourCC;
    uint ChannelMasks;
    HistogramGrid Grid;
}
struct HistogramDataHeader
{
    uint Size;
    uint ChannelMask;
    uint Linear;
}
