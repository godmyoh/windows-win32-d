module windows.win32.media.streaming;

import windows.win32.foundation : RECT;

version (Windows):
extern (Windows):

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
