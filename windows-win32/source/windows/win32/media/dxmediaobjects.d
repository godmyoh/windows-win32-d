module windows.win32.media.dxmediaobjects;

import windows.win32.guid : GUID;
import windows.win32.foundation : BOOL, HRESULT, PWSTR;
import windows.win32.system.com : IUnknown;

version (Windows):
extern (Windows):

HRESULT DMORegister(const(wchar)*, const(GUID)*, const(GUID)*, uint, uint, const(DMO_PARTIAL_MEDIATYPE)*, uint, const(DMO_PARTIAL_MEDIATYPE)*);
HRESULT DMOUnregister(const(GUID)*, const(GUID)*);
HRESULT DMOEnum(const(GUID)*, uint, uint, const(DMO_PARTIAL_MEDIATYPE)*, uint, const(DMO_PARTIAL_MEDIATYPE)*, IEnumDMO*);
HRESULT DMOGetTypes(const(GUID)*, uint, uint*, DMO_PARTIAL_MEDIATYPE*, uint, uint*, DMO_PARTIAL_MEDIATYPE*);
HRESULT DMOGetName(const(GUID)*, PWSTR);
HRESULT MoInitMediaType(DMO_MEDIA_TYPE*, uint);
HRESULT MoFreeMediaType(DMO_MEDIA_TYPE*);
HRESULT MoCopyMediaType(DMO_MEDIA_TYPE*, const(DMO_MEDIA_TYPE)*);
HRESULT MoCreateMediaType(DMO_MEDIA_TYPE**, uint);
HRESULT MoDeleteMediaType(DMO_MEDIA_TYPE*);
HRESULT MoDuplicateMediaType(DMO_MEDIA_TYPE**, const(DMO_MEDIA_TYPE)*);
enum DMO_E_INVALIDSTREAMINDEX = 0xffffffff80040201;
enum DMO_E_INVALIDTYPE = 0xffffffff80040202;
enum DMO_E_TYPE_NOT_SET = 0xffffffff80040203;
enum DMO_E_NOTACCEPTING = 0xffffffff80040204;
enum DMO_E_TYPE_NOT_ACCEPTED = 0xffffffff80040205;
enum DMO_E_NO_MORE_ITEMS = 0xffffffff80040206;
enum DMOCATEGORY_AUDIO_DECODER = GUID(0x57f2db8b, 0xe6bb, 0x4513, [0x9d, 0x43, 0xdc, 0xd2, 0xa6, 0x59, 0x31, 0x25]);
enum DMOCATEGORY_AUDIO_ENCODER = GUID(0x33d9a761, 0x90c8, 0x11d0, [0xbd, 0x43, 0x0, 0xa0, 0xc9, 0x11, 0xce, 0x86]);
enum DMOCATEGORY_VIDEO_DECODER = GUID(0x4a69b442, 0x28be, 0x4991, [0x96, 0x9c, 0xb5, 0x0, 0xad, 0xf5, 0xd8, 0xa8]);
enum DMOCATEGORY_VIDEO_ENCODER = GUID(0x33d9a760, 0x90c8, 0x11d0, [0xbd, 0x43, 0x0, 0xa0, 0xc9, 0x11, 0xce, 0x86]);
enum DMOCATEGORY_AUDIO_EFFECT = GUID(0xf3602b3f, 0x592, 0x48df, [0xa4, 0xcd, 0x67, 0x47, 0x21, 0xe7, 0xeb, 0xeb]);
enum DMOCATEGORY_VIDEO_EFFECT = GUID(0xd990ee14, 0x776c, 0x4723, [0xbe, 0x46, 0x3d, 0xa2, 0xf5, 0x6f, 0x10, 0xb9]);
enum DMOCATEGORY_AUDIO_CAPTURE_EFFECT = GUID(0xf665aaba, 0x3e09, 0x4920, [0xaa, 0x5f, 0x21, 0x98, 0x11, 0x14, 0x8f, 0x9]);
enum DMOCATEGORY_ACOUSTIC_ECHO_CANCEL = GUID(0xbf963d80, 0xc559, 0x11d0, [0x8a, 0x2b, 0x0, 0xa0, 0xc9, 0x25, 0x5a, 0xc1]);
enum DMOCATEGORY_AUDIO_NOISE_SUPPRESS = GUID(0xe07f903f, 0x62fd, 0x4e60, [0x8c, 0xdd, 0xde, 0xa7, 0x23, 0x66, 0x65, 0xb5]);
enum DMOCATEGORY_AGC = GUID(0xe88c9ba0, 0xc557, 0x11d0, [0x8a, 0x2b, 0x0, 0xa0, 0xc9, 0x25, 0x5a, 0xc1]);
struct DMO_MEDIA_TYPE
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
alias _DMO_INPUT_DATA_BUFFER_FLAGS = int;
enum : int
{
    DMO_INPUT_DATA_BUFFERF_SYNCPOINT     = 0x00000001,
    DMO_INPUT_DATA_BUFFERF_TIME          = 0x00000002,
    DMO_INPUT_DATA_BUFFERF_TIMELENGTH    = 0x00000004,
    DMO_INPUT_DATA_BUFFERF_DISCONTINUITY = 0x00000008,
}

alias _DMO_OUTPUT_DATA_BUFFER_FLAGS = int;
enum : int
{
    DMO_OUTPUT_DATA_BUFFERF_SYNCPOINT     = 0x00000001,
    DMO_OUTPUT_DATA_BUFFERF_TIME          = 0x00000002,
    DMO_OUTPUT_DATA_BUFFERF_TIMELENGTH    = 0x00000004,
    DMO_OUTPUT_DATA_BUFFERF_DISCONTINUITY = 0x00000008,
    DMO_OUTPUT_DATA_BUFFERF_INCOMPLETE    = 0x01000000,
}

alias _DMO_INPUT_STATUS_FLAGS = int;
enum : int
{
    DMO_INPUT_STATUSF_ACCEPT_DATA = 0x00000001,
}

alias _DMO_INPUT_STREAM_INFO_FLAGS = int;
enum : int
{
    DMO_INPUT_STREAMF_WHOLE_SAMPLES            = 0x00000001,
    DMO_INPUT_STREAMF_SINGLE_SAMPLE_PER_BUFFER = 0x00000002,
    DMO_INPUT_STREAMF_FIXED_SAMPLE_SIZE        = 0x00000004,
    DMO_INPUT_STREAMF_HOLDS_BUFFERS            = 0x00000008,
}

alias _DMO_OUTPUT_STREAM_INFO_FLAGS = int;
enum : int
{
    DMO_OUTPUT_STREAMF_WHOLE_SAMPLES            = 0x00000001,
    DMO_OUTPUT_STREAMF_SINGLE_SAMPLE_PER_BUFFER = 0x00000002,
    DMO_OUTPUT_STREAMF_FIXED_SAMPLE_SIZE        = 0x00000004,
    DMO_OUTPUT_STREAMF_DISCARDABLE              = 0x00000008,
    DMO_OUTPUT_STREAMF_OPTIONAL                 = 0x00000010,
}

alias _DMO_SET_TYPE_FLAGS = int;
enum : int
{
    DMO_SET_TYPEF_TEST_ONLY = 0x00000001,
    DMO_SET_TYPEF_CLEAR     = 0x00000002,
}

alias _DMO_PROCESS_OUTPUT_FLAGS = int;
enum : int
{
    DMO_PROCESS_OUTPUT_DISCARD_WHEN_NO_BUFFER = 0x00000001,
}

enum IID_IMediaBuffer = GUID(0x59eff8b9, 0x938c, 0x4a26, [0x82, 0xf2, 0x95, 0xcb, 0x84, 0xcd, 0xc8, 0x37]);
interface IMediaBuffer : IUnknown
{
    HRESULT SetLength(uint);
    HRESULT GetMaxLength(uint*);
    HRESULT GetBufferAndLength(ubyte**, uint*);
}
struct DMO_OUTPUT_DATA_BUFFER
{
    IMediaBuffer pBuffer;
    uint dwStatus;
    long rtTimestamp;
    long rtTimelength;
}
enum IID_IMediaObject = GUID(0xd8ad0f58, 0x5494, 0x4102, [0x97, 0xc5, 0xec, 0x79, 0x8e, 0x59, 0xbc, 0xf4]);
interface IMediaObject : IUnknown
{
    HRESULT GetStreamCount(uint*, uint*);
    HRESULT GetInputStreamInfo(uint, uint*);
    HRESULT GetOutputStreamInfo(uint, uint*);
    HRESULT GetInputType(uint, uint, DMO_MEDIA_TYPE*);
    HRESULT GetOutputType(uint, uint, DMO_MEDIA_TYPE*);
    HRESULT SetInputType(uint, const(DMO_MEDIA_TYPE)*, uint);
    HRESULT SetOutputType(uint, const(DMO_MEDIA_TYPE)*, uint);
    HRESULT GetInputCurrentType(uint, DMO_MEDIA_TYPE*);
    HRESULT GetOutputCurrentType(uint, DMO_MEDIA_TYPE*);
    HRESULT GetInputSizeInfo(uint, uint*, uint*, uint*);
    HRESULT GetOutputSizeInfo(uint, uint*, uint*);
    HRESULT GetInputMaxLatency(uint, long*);
    HRESULT SetInputMaxLatency(uint, long);
    HRESULT Flush();
    HRESULT Discontinuity(uint);
    HRESULT AllocateStreamingResources();
    HRESULT FreeStreamingResources();
    HRESULT GetInputStatus(uint, uint*);
    HRESULT ProcessInput(uint, IMediaBuffer, uint, long, long);
    HRESULT ProcessOutput(uint, uint, DMO_OUTPUT_DATA_BUFFER*, uint*);
    HRESULT Lock(int);
}
enum IID_IEnumDMO = GUID(0x2c3cd98a, 0x2bfa, 0x4a53, [0x9c, 0x27, 0x52, 0x49, 0xba, 0x64, 0xba, 0xf]);
interface IEnumDMO : IUnknown
{
    HRESULT Next(uint, GUID*, PWSTR*, uint*);
    HRESULT Skip(uint);
    HRESULT Reset();
    HRESULT Clone(IEnumDMO*);
}
alias _DMO_INPLACE_PROCESS_FLAGS = int;
enum : int
{
    DMO_INPLACE_NORMAL = 0x00000000,
    DMO_INPLACE_ZERO   = 0x00000001,
}

enum IID_IMediaObjectInPlace = GUID(0x651b9ad0, 0xfc7, 0x4aa9, [0x95, 0x38, 0xd8, 0x99, 0x31, 0x1, 0x7, 0x41]);
interface IMediaObjectInPlace : IUnknown
{
    HRESULT Process(uint, ubyte*, long, uint);
    HRESULT Clone(IMediaObjectInPlace*);
    HRESULT GetLatency(long*);
}
alias _DMO_QUALITY_STATUS_FLAGS = int;
enum : int
{
    DMO_QUALITY_STATUS_ENABLED = 0x00000001,
}

enum IID_IDMOQualityControl = GUID(0x65abea96, 0xcf36, 0x453f, [0xaf, 0x8a, 0x70, 0x5e, 0x98, 0xf1, 0x62, 0x60]);
interface IDMOQualityControl : IUnknown
{
    HRESULT SetNow(long);
    HRESULT SetStatus(uint);
    HRESULT GetStatus(uint*);
}
alias _DMO_VIDEO_OUTPUT_STREAM_FLAGS = int;
enum : int
{
    DMO_VOSF_NEEDS_PREVIOUS_SAMPLE = 0x00000001,
}

enum IID_IDMOVideoOutputOptimizations = GUID(0xbe8f4f4e, 0x5b16, 0x4d29, [0xb3, 0x50, 0x7f, 0x6b, 0x5d, 0x92, 0x98, 0xac]);
interface IDMOVideoOutputOptimizations : IUnknown
{
    HRESULT QueryOperationModePreferences(uint, uint*);
    HRESULT SetOperationMode(uint, uint);
    HRESULT GetCurrentOperationMode(uint, uint*);
    HRESULT GetCurrentSampleRequirements(uint, uint*);
}
struct DMO_PARTIAL_MEDIATYPE
{
    GUID type;
    GUID subtype;
}
alias DMO_REGISTER_FLAGS = int;
enum : int
{
    DMO_REGISTERF_IS_KEYED = 0x00000001,
}

alias DMO_ENUM_FLAGS = int;
enum : int
{
    DMO_ENUMF_INCLUDE_KEYED = 0x00000001,
}

