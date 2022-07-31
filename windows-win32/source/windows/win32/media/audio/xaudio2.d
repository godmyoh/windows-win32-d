module windows.win32.media.audio.xaudio2;

import windows.win32.guid : GUID;
import windows.win32.foundation : BOOL, HRESULT, PWSTR;
import windows.win32.media.audio_ : AUDIO_STREAM_CATEGORY, WAVEFORMATEX;
import windows.win32.system.com_ : IUnknown;

version (Windows):
extern (Windows):

HRESULT CreateFX(const(GUID)*, IUnknown*, const(void)*, uint);
HRESULT XAudio2CreateWithVersionInfo(IXAudio2*, uint, uint, uint);
HRESULT CreateAudioVolumeMeter(IUnknown*);
HRESULT CreateAudioReverb(IUnknown*);
HRESULT CreateHrtfApo(const(HrtfApoInit)*, IXAPO*);
enum FXEQ_MIN_FRAMERATE = 0x000055f0;
enum FXEQ_MAX_FRAMERATE = 0x0000bb80;
enum FXEQ_MIN_FREQUENCY_CENTER = 20.000000;
enum FXEQ_MAX_FREQUENCY_CENTER = 20000.000000;
enum FXEQ_DEFAULT_FREQUENCY_CENTER_0 = 100.000000;
enum FXEQ_DEFAULT_FREQUENCY_CENTER_1 = 800.000000;
enum FXEQ_DEFAULT_FREQUENCY_CENTER_2 = 2000.000000;
enum FXEQ_DEFAULT_FREQUENCY_CENTER_3 = 10000.000000;
enum FXEQ_MIN_GAIN = 0.126000;
enum FXEQ_MAX_GAIN = 7.940000;
enum FXEQ_DEFAULT_GAIN = 1.000000;
enum FXEQ_MIN_BANDWIDTH = 0.100000;
enum FXEQ_MAX_BANDWIDTH = 2.000000;
enum FXEQ_DEFAULT_BANDWIDTH = 1.000000;
enum FXMASTERINGLIMITER_MIN_RELEASE = 0x00000001;
enum FXMASTERINGLIMITER_MAX_RELEASE = 0x00000014;
enum FXMASTERINGLIMITER_DEFAULT_RELEASE = 0x00000006;
enum FXMASTERINGLIMITER_MIN_LOUDNESS = 0x00000001;
enum FXMASTERINGLIMITER_MAX_LOUDNESS = 0x00000708;
enum FXMASTERINGLIMITER_DEFAULT_LOUDNESS = 0x000003e8;
enum FXREVERB_MIN_DIFFUSION = 0.000000;
enum FXREVERB_MAX_DIFFUSION = 1.000000;
enum FXREVERB_DEFAULT_DIFFUSION = 0.900000;
enum FXREVERB_MIN_ROOMSIZE = 0.000100;
enum FXREVERB_MAX_ROOMSIZE = 1.000000;
enum FXREVERB_DEFAULT_ROOMSIZE = 0.600000;
enum FXLOUDNESS_DEFAULT_MOMENTARY_MS = 0x00000190;
enum FXLOUDNESS_DEFAULT_SHORTTERM_MS = 0x00000bb8;
enum FXECHO_MIN_WETDRYMIX = 0.000000;
enum FXECHO_MAX_WETDRYMIX = 1.000000;
enum FXECHO_DEFAULT_WETDRYMIX = 0.500000;
enum FXECHO_MIN_FEEDBACK = 0.000000;
enum FXECHO_MAX_FEEDBACK = 1.000000;
enum FXECHO_DEFAULT_FEEDBACK = 0.500000;
enum FXECHO_MIN_DELAY = 1.000000;
enum FXECHO_MAX_DELAY = 2000.000000;
enum FXECHO_DEFAULT_DELAY = 500.000000;
enum XAUDIO2_DLL_A = "xaudio2_9.dll";
enum XAUDIO2_DLL_W = "xaudio2_9.dll";
enum XAUDIO2D_DLL_A = "xaudio2_9d.dll";
enum XAUDIO2D_DLL_W = "xaudio2_9d.dll";
enum XAUDIO2_DLL = "xaudio2_9.dll";
enum XAUDIO2D_DLL = "xaudio2_9d.dll";
enum XAUDIO2_MAX_BUFFER_BYTES = 0x80000000;
enum XAUDIO2_MAX_QUEUED_BUFFERS = 0x00000040;
enum XAUDIO2_MAX_BUFFERS_SYSTEM = 0x00000002;
enum XAUDIO2_MAX_AUDIO_CHANNELS = 0x00000040;
enum XAUDIO2_MIN_SAMPLE_RATE = 0x000003e8;
enum XAUDIO2_MAX_SAMPLE_RATE = 0x00030d40;
enum XAUDIO2_MAX_VOLUME_LEVEL = 16777216.000000;
enum XAUDIO2_MAX_FREQ_RATIO = 1024.000000;
enum XAUDIO2_DEFAULT_FREQ_RATIO = 2.000000;
enum XAUDIO2_MAX_FILTER_ONEOVERQ = 1.500000;
enum XAUDIO2_MAX_FILTER_FREQUENCY = 1.000000;
enum XAUDIO2_MAX_LOOP_COUNT = 0x000000fe;
enum XAUDIO2_MAX_INSTANCES = 0x00000008;
enum XAUDIO2_MAX_RATIO_TIMES_RATE_XMA_MONO = 0x000927c0;
enum XAUDIO2_MAX_RATIO_TIMES_RATE_XMA_MULTICHANNEL = 0x000493e0;
enum XAUDIO2_COMMIT_NOW = 0x00000000;
enum XAUDIO2_COMMIT_ALL = 0x00000000;
enum XAUDIO2_NO_LOOP_REGION = 0x00000000;
enum XAUDIO2_LOOP_INFINITE = 0x000000ff;
enum XAUDIO2_DEFAULT_CHANNELS = 0x00000000;
enum XAUDIO2_DEFAULT_SAMPLERATE = 0x00000000;
enum XAUDIO2_DEBUG_ENGINE = 0x00000001;
enum XAUDIO2_VOICE_NOPITCH = 0x00000002;
enum XAUDIO2_VOICE_NOSRC = 0x00000004;
enum XAUDIO2_VOICE_USEFILTER = 0x00000008;
enum XAUDIO2_PLAY_TAILS = 0x00000020;
enum XAUDIO2_END_OF_STREAM = 0x00000040;
enum XAUDIO2_SEND_USEFILTER = 0x00000080;
enum XAUDIO2_VOICE_NOSAMPLESPLAYED = 0x00000100;
enum XAUDIO2_STOP_ENGINE_WHEN_IDLE = 0x00002000;
enum XAUDIO2_1024_QUANTUM = 0x00008000;
enum XAUDIO2_NO_VIRTUAL_AUDIO_CLIENT = 0x00010000;
enum XAUDIO2_DEFAULT_FILTER_FREQUENCY = 1.000000;
enum XAUDIO2_DEFAULT_FILTER_ONEOVERQ = 1.000000;
enum XAUDIO2_QUANTUM_NUMERATOR = 0x00000001;
enum XAUDIO2_QUANTUM_DENOMINATOR = 0x00000064;
enum FACILITY_XAUDIO2 = 0x00000896;
enum XAUDIO2_E_INVALID_CALL = 0xffffffff88960001;
enum XAUDIO2_E_XMA_DECODER_ERROR = 0xffffffff88960002;
enum XAUDIO2_E_XAPO_CREATION_FAILED = 0xffffffff88960003;
enum XAUDIO2_E_DEVICE_INVALIDATED = 0xffffffff88960004;
enum Processor1 = 0x00000001;
enum Processor2 = 0x00000002;
enum Processor3 = 0x00000004;
enum Processor4 = 0x00000008;
enum Processor5 = 0x00000010;
enum Processor6 = 0x00000020;
enum Processor7 = 0x00000040;
enum Processor8 = 0x00000080;
enum Processor9 = 0x00000100;
enum Processor10 = 0x00000200;
enum Processor11 = 0x00000400;
enum Processor12 = 0x00000800;
enum Processor13 = 0x00001000;
enum Processor14 = 0x00002000;
enum Processor15 = 0x00004000;
enum Processor16 = 0x00008000;
enum Processor17 = 0x00010000;
enum Processor18 = 0x00020000;
enum Processor19 = 0x00040000;
enum Processor20 = 0x00080000;
enum Processor21 = 0x00100000;
enum Processor22 = 0x00200000;
enum Processor23 = 0x00400000;
enum Processor24 = 0x00800000;
enum Processor25 = 0x01000000;
enum Processor26 = 0x02000000;
enum Processor27 = 0x04000000;
enum Processor28 = 0x08000000;
enum Processor29 = 0x10000000;
enum Processor30 = 0x20000000;
enum Processor31 = 0x40000000;
enum Processor32 = 0x80000000;
enum XAUDIO2_ANY_PROCESSOR = 0xffffffff;
enum XAUDIO2_USE_DEFAULT_PROCESSOR = 0x00000000;
enum XAUDIO2_DEFAULT_PROCESSOR = 0x00000001;
enum XAUDIO2_LOG_ERRORS = 0x00000001;
enum XAUDIO2_LOG_WARNINGS = 0x00000002;
enum XAUDIO2_LOG_INFO = 0x00000004;
enum XAUDIO2_LOG_DETAIL = 0x00000008;
enum XAUDIO2_LOG_API_CALLS = 0x00000010;
enum XAUDIO2_LOG_FUNC_CALLS = 0x00000020;
enum XAUDIO2_LOG_TIMING = 0x00000040;
enum XAUDIO2_LOG_LOCKS = 0x00000080;
enum XAUDIO2_LOG_MEMORY = 0x00000100;
enum XAUDIO2_LOG_STREAMING = 0x00001000;
enum XAUDIO2FX_REVERB_MIN_FRAMERATE = 0x00004e20;
enum XAUDIO2FX_REVERB_MAX_FRAMERATE = 0x0000bb80;
enum XAUDIO2FX_REVERB_MIN_WET_DRY_MIX = 0.000000;
enum XAUDIO2FX_REVERB_MIN_REFLECTIONS_DELAY = 0x00000000;
enum XAUDIO2FX_REVERB_MIN_REVERB_DELAY = 0x00000000;
enum XAUDIO2FX_REVERB_MIN_REAR_DELAY = 0x00000000;
enum XAUDIO2FX_REVERB_MIN_7POINT1_SIDE_DELAY = 0x00000000;
enum XAUDIO2FX_REVERB_MIN_7POINT1_REAR_DELAY = 0x00000000;
enum XAUDIO2FX_REVERB_MIN_POSITION = 0x00000000;
enum XAUDIO2FX_REVERB_MIN_DIFFUSION = 0x00000000;
enum XAUDIO2FX_REVERB_MIN_LOW_EQ_GAIN = 0x00000000;
enum XAUDIO2FX_REVERB_MIN_LOW_EQ_CUTOFF = 0x00000000;
enum XAUDIO2FX_REVERB_MIN_HIGH_EQ_GAIN = 0x00000000;
enum XAUDIO2FX_REVERB_MIN_HIGH_EQ_CUTOFF = 0x00000000;
enum XAUDIO2FX_REVERB_MIN_ROOM_FILTER_FREQ = 20.000000;
enum XAUDIO2FX_REVERB_MIN_ROOM_FILTER_MAIN = -100.000000;
enum XAUDIO2FX_REVERB_MIN_ROOM_FILTER_HF = -100.000000;
enum XAUDIO2FX_REVERB_MIN_REFLECTIONS_GAIN = -100.000000;
enum XAUDIO2FX_REVERB_MIN_REVERB_GAIN = -100.000000;
enum XAUDIO2FX_REVERB_MIN_DECAY_TIME = 0.100000;
enum XAUDIO2FX_REVERB_MIN_DENSITY = 0.000000;
enum XAUDIO2FX_REVERB_MIN_ROOM_SIZE = 0.000000;
enum XAUDIO2FX_REVERB_MAX_WET_DRY_MIX = 100.000000;
enum XAUDIO2FX_REVERB_MAX_REFLECTIONS_DELAY = 0x0000012c;
enum XAUDIO2FX_REVERB_MAX_REVERB_DELAY = 0x00000055;
enum XAUDIO2FX_REVERB_MAX_REAR_DELAY = 0x00000005;
enum XAUDIO2FX_REVERB_MAX_7POINT1_SIDE_DELAY = 0x00000005;
enum XAUDIO2FX_REVERB_MAX_7POINT1_REAR_DELAY = 0x00000014;
enum XAUDIO2FX_REVERB_MAX_POSITION = 0x0000001e;
enum XAUDIO2FX_REVERB_MAX_DIFFUSION = 0x0000000f;
enum XAUDIO2FX_REVERB_MAX_LOW_EQ_GAIN = 0x0000000c;
enum XAUDIO2FX_REVERB_MAX_LOW_EQ_CUTOFF = 0x00000009;
enum XAUDIO2FX_REVERB_MAX_HIGH_EQ_GAIN = 0x00000008;
enum XAUDIO2FX_REVERB_MAX_HIGH_EQ_CUTOFF = 0x0000000e;
enum XAUDIO2FX_REVERB_MAX_ROOM_FILTER_FREQ = 20000.000000;
enum XAUDIO2FX_REVERB_MAX_ROOM_FILTER_MAIN = 0.000000;
enum XAUDIO2FX_REVERB_MAX_ROOM_FILTER_HF = 0.000000;
enum XAUDIO2FX_REVERB_MAX_REFLECTIONS_GAIN = 20.000000;
enum XAUDIO2FX_REVERB_MAX_REVERB_GAIN = 20.000000;
enum XAUDIO2FX_REVERB_MAX_DENSITY = 100.000000;
enum XAUDIO2FX_REVERB_MAX_ROOM_SIZE = 100.000000;
enum XAUDIO2FX_REVERB_DEFAULT_WET_DRY_MIX = 100.000000;
enum XAUDIO2FX_REVERB_DEFAULT_REFLECTIONS_DELAY = 0x00000005;
enum XAUDIO2FX_REVERB_DEFAULT_REVERB_DELAY = 0x00000005;
enum XAUDIO2FX_REVERB_DEFAULT_REAR_DELAY = 0x00000005;
enum XAUDIO2FX_REVERB_DEFAULT_7POINT1_SIDE_DELAY = 0x00000005;
enum XAUDIO2FX_REVERB_DEFAULT_7POINT1_REAR_DELAY = 0x00000014;
enum XAUDIO2FX_REVERB_DEFAULT_POSITION = 0x00000006;
enum XAUDIO2FX_REVERB_DEFAULT_POSITION_MATRIX = 0x0000001b;
enum XAUDIO2FX_REVERB_DEFAULT_EARLY_DIFFUSION = 0x00000008;
enum XAUDIO2FX_REVERB_DEFAULT_LATE_DIFFUSION = 0x00000008;
enum XAUDIO2FX_REVERB_DEFAULT_LOW_EQ_GAIN = 0x00000008;
enum XAUDIO2FX_REVERB_DEFAULT_LOW_EQ_CUTOFF = 0x00000004;
enum XAUDIO2FX_REVERB_DEFAULT_HIGH_EQ_GAIN = 0x00000008;
enum XAUDIO2FX_REVERB_DEFAULT_HIGH_EQ_CUTOFF = 0x00000004;
enum XAUDIO2FX_REVERB_DEFAULT_ROOM_FILTER_FREQ = 5000.000000;
enum XAUDIO2FX_REVERB_DEFAULT_ROOM_FILTER_MAIN = 0.000000;
enum XAUDIO2FX_REVERB_DEFAULT_ROOM_FILTER_HF = 0.000000;
enum XAUDIO2FX_REVERB_DEFAULT_REFLECTIONS_GAIN = 0.000000;
enum XAUDIO2FX_REVERB_DEFAULT_REVERB_GAIN = 0.000000;
enum XAUDIO2FX_REVERB_DEFAULT_DECAY_TIME = 1.000000;
enum XAUDIO2FX_REVERB_DEFAULT_DENSITY = 100.000000;
enum XAUDIO2FX_REVERB_DEFAULT_ROOM_SIZE = 100.000000;
enum XAUDIO2FX_REVERB_DEFAULT_DISABLE_LATE_FIELD = 0x00000000;
enum HRTF_MAX_GAIN_LIMIT = 12.000000;
enum HRTF_MIN_GAIN_LIMIT = -96.000000;
enum HRTF_MIN_UNITY_GAIN_DISTANCE = 0.050000;
enum HRTF_DEFAULT_UNITY_GAIN_DISTANCE = 1.000000;
enum FACILITY_XAPO = 0x00000897;
enum XAPO_E_FORMAT_UNSUPPORTED = 0xffffffff88970001;
enum XAPO_MIN_CHANNELS = 0x00000001;
enum XAPO_MAX_CHANNELS = 0x00000040;
enum XAPO_MIN_FRAMERATE = 0x000003e8;
enum XAPO_MAX_FRAMERATE = 0x00030d40;
enum XAPO_REGISTRATION_STRING_LENGTH = 0x00000100;
enum XAPO_FLAG_CHANNELS_MUST_MATCH = 0x00000001;
enum XAPO_FLAG_FRAMERATE_MUST_MATCH = 0x00000002;
enum XAPO_FLAG_BITSPERSAMPLE_MUST_MATCH = 0x00000004;
enum XAPO_FLAG_BUFFERCOUNT_MUST_MATCH = 0x00000008;
enum XAPO_FLAG_INPLACE_REQUIRED = 0x00000020;
enum XAPO_FLAG_INPLACE_SUPPORTED = 0x00000010;
enum SPEAKER_MONO = 0x00000004;
enum X3DAUDIO_HANDLE_BYTESIZE = 0x00000014;
enum X3DAUDIO_PI = 3.141593;
enum X3DAUDIO_2PI = 6.283185;
enum X3DAUDIO_SPEED_OF_SOUND = 343.500000;
enum X3DAUDIO_CALCULATE_MATRIX = 0x00000001;
enum X3DAUDIO_CALCULATE_DELAY = 0x00000002;
enum X3DAUDIO_CALCULATE_LPF_DIRECT = 0x00000004;
enum X3DAUDIO_CALCULATE_LPF_REVERB = 0x00000008;
enum X3DAUDIO_CALCULATE_REVERB = 0x00000010;
enum X3DAUDIO_CALCULATE_DOPPLER = 0x00000020;
enum X3DAUDIO_CALCULATE_EMITTER_ANGLE = 0x00000040;
enum X3DAUDIO_CALCULATE_ZEROCENTER = 0x00010000;
enum X3DAUDIO_CALCULATE_REDIRECT_TO_LFE = 0x00020000;
struct XAPO_REGISTRATION_PROPERTIES
{
    align (1):
    GUID clsid;
    wchar[256] FriendlyName;
    wchar[256] CopyrightInfo;
    uint MajorVersion;
    uint MinorVersion;
    uint Flags;
    uint MinInputBufferCount;
    uint MaxInputBufferCount;
    uint MinOutputBufferCount;
    uint MaxOutputBufferCount;
}
struct XAPO_LOCKFORPROCESS_PARAMETERS
{
    align (1):
    const(WAVEFORMATEX)* pFormat;
    uint MaxFrameCount;
}
alias XAPO_BUFFER_FLAGS = int;
enum : int
{
    XAPO_BUFFER_SILENT = 0x00000000,
    XAPO_BUFFER_VALID  = 0x00000001,
}

struct XAPO_PROCESS_BUFFER_PARAMETERS
{
    align (1):
    void* pBuffer;
    XAPO_BUFFER_FLAGS BufferFlags;
    uint ValidFrameCount;
}
enum IID_IXAPO = GUID(0xa410b984, 0x9839, 0x4819, [0xa0, 0xbe, 0x28, 0x56, 0xae, 0x6b, 0x3a, 0xdb]);
interface IXAPO : IUnknown
{
    HRESULT GetRegistrationProperties(XAPO_REGISTRATION_PROPERTIES**);
    HRESULT IsInputFormatSupported(const(WAVEFORMATEX)*, const(WAVEFORMATEX)*, WAVEFORMATEX**);
    HRESULT IsOutputFormatSupported(const(WAVEFORMATEX)*, const(WAVEFORMATEX)*, WAVEFORMATEX**);
    HRESULT Initialize(const(void)*, uint);
    void Reset();
    HRESULT LockForProcess(uint, const(XAPO_LOCKFORPROCESS_PARAMETERS)*, uint, const(XAPO_LOCKFORPROCESS_PARAMETERS)*);
    void UnlockForProcess();
    void Process(uint, const(XAPO_PROCESS_BUFFER_PARAMETERS)*, uint, XAPO_PROCESS_BUFFER_PARAMETERS*, BOOL);
    uint CalcInputFrames(uint);
    uint CalcOutputFrames(uint);
}
enum IID_IXAPOParameters = GUID(0x26d95c66, 0x80f2, 0x499a, [0xad, 0x54, 0x5a, 0xe7, 0xf0, 0x1c, 0x6d, 0x98]);
interface IXAPOParameters : IUnknown
{
    void SetParameters(const(void)*, uint);
    void GetParameters(void*, uint);
}
enum CLSID_FXEQ = GUID(0xf5e01117, 0xd6c4, 0x485a, [0xa3, 0xf5, 0x69, 0x51, 0x96, 0xf3, 0xdb, 0xfa]);
struct FXEQ
{
}
enum CLSID_FXMasteringLimiter = GUID(0xc4137916, 0x2be1, 0x46fd, [0x85, 0x99, 0x44, 0x15, 0x36, 0xf4, 0x98, 0x56]);
struct FXMasteringLimiter
{
}
enum CLSID_FXReverb = GUID(0x7d9aca56, 0xcb68, 0x4807, [0xb6, 0x32, 0xb1, 0x37, 0x35, 0x2e, 0x85, 0x96]);
struct FXReverb
{
}
enum CLSID_FXEcho = GUID(0x5039d740, 0xf736, 0x449a, [0x84, 0xd3, 0xa5, 0x62, 0x2, 0x55, 0x7b, 0x87]);
struct FXEcho
{
}
struct FXEQ_PARAMETERS
{
    align (1):
    float FrequencyCenter0;
    float Gain0;
    float Bandwidth0;
    float FrequencyCenter1;
    float Gain1;
    float Bandwidth1;
    float FrequencyCenter2;
    float Gain2;
    float Bandwidth2;
    float FrequencyCenter3;
    float Gain3;
    float Bandwidth3;
}
struct FXMASTERINGLIMITER_PARAMETERS
{
    align (1):
    uint Release;
    uint Loudness;
}
struct FXREVERB_PARAMETERS
{
    align (1):
    float Diffusion;
    float RoomSize;
}
struct FXECHO_INITDATA
{
    align (1):
    float MaxDelay;
}
struct FXECHO_PARAMETERS
{
    align (1):
    float WetDryMix;
    float Feedback;
    float Delay;
}
struct XAUDIO2_VOICE_DETAILS
{
    align (1):
    uint CreationFlags;
    uint ActiveFlags;
    uint InputChannels;
    uint InputSampleRate;
}
struct XAUDIO2_SEND_DESCRIPTOR
{
    align (1):
    uint Flags;
    IXAudio2Voice pOutputVoice;
}
struct XAUDIO2_VOICE_SENDS
{
    align (1):
    uint SendCount;
    XAUDIO2_SEND_DESCRIPTOR* pSends;
}
struct XAUDIO2_EFFECT_DESCRIPTOR
{
    align (1):
    IUnknown pEffect;
    BOOL InitialState;
    uint OutputChannels;
}
struct XAUDIO2_EFFECT_CHAIN
{
    align (1):
    uint EffectCount;
    XAUDIO2_EFFECT_DESCRIPTOR* pEffectDescriptors;
}
alias XAUDIO2_FILTER_TYPE = int;
enum : int
{
    LowPassFilter         = 0x00000000,
    BandPassFilter        = 0x00000001,
    HighPassFilter        = 0x00000002,
    NotchFilter           = 0x00000003,
    LowPassOnePoleFilter  = 0x00000004,
    HighPassOnePoleFilter = 0x00000005,
}

struct XAUDIO2_FILTER_PARAMETERS
{
    align (1):
    XAUDIO2_FILTER_TYPE Type;
    float Frequency;
    float OneOverQ;
}
struct XAUDIO2_BUFFER
{
    align (1):
    uint Flags;
    uint AudioBytes;
    const(ubyte)* pAudioData;
    uint PlayBegin;
    uint PlayLength;
    uint LoopBegin;
    uint LoopLength;
    uint LoopCount;
    void* pContext;
}
struct XAUDIO2_BUFFER_WMA
{
    align (1):
    const(uint)* pDecodedPacketCumulativeBytes;
    uint PacketCount;
}
struct XAUDIO2_VOICE_STATE
{
    align (1):
    void* pCurrentBufferContext;
    uint BuffersQueued;
    ulong SamplesPlayed;
}
struct XAUDIO2_PERFORMANCE_DATA
{
    align (1):
    ulong AudioCyclesSinceLastQuery;
    ulong TotalCyclesSinceLastQuery;
    uint MinimumCyclesPerQuantum;
    uint MaximumCyclesPerQuantum;
    uint MemoryUsageInBytes;
    uint CurrentLatencyInSamples;
    uint GlitchesSinceEngineStarted;
    uint ActiveSourceVoiceCount;
    uint TotalSourceVoiceCount;
    uint ActiveSubmixVoiceCount;
    uint ActiveResamplerCount;
    uint ActiveMatrixMixCount;
    uint ActiveXmaSourceVoices;
    uint ActiveXmaStreams;
}
struct XAUDIO2_DEBUG_CONFIGURATION
{
    align (1):
    uint TraceMask;
    uint BreakMask;
    BOOL LogThreadID;
    BOOL LogFileline;
    BOOL LogFunctionName;
    BOOL LogTiming;
}
enum IID_IXAudio2 = GUID(0x2b02e3cf, 0x2e0b, 0x4ec3, [0xbe, 0x45, 0x1b, 0x2a, 0x3f, 0xe7, 0x21, 0xd]);
interface IXAudio2 : IUnknown
{
    HRESULT RegisterForCallbacks(IXAudio2EngineCallback);
    void UnregisterForCallbacks(IXAudio2EngineCallback);
    HRESULT CreateSourceVoice(IXAudio2SourceVoice*, const(WAVEFORMATEX)*, uint, float, IXAudio2VoiceCallback, const(XAUDIO2_VOICE_SENDS)*, const(XAUDIO2_EFFECT_CHAIN)*);
    HRESULT CreateSubmixVoice(IXAudio2SubmixVoice*, uint, uint, uint, uint, const(XAUDIO2_VOICE_SENDS)*, const(XAUDIO2_EFFECT_CHAIN)*);
    HRESULT CreateMasteringVoice(IXAudio2MasteringVoice*, uint, uint, uint, const(wchar)*, const(XAUDIO2_EFFECT_CHAIN)*, AUDIO_STREAM_CATEGORY);
    HRESULT StartEngine();
    void StopEngine();
    HRESULT CommitChanges(uint);
    void GetPerformanceData(XAUDIO2_PERFORMANCE_DATA*);
    void SetDebugConfiguration(const(XAUDIO2_DEBUG_CONFIGURATION)*, void*);
}
enum IID_IXAudio2Extension = GUID(0x84ac29bb, 0xd619, 0x44d2, [0xb1, 0x97, 0xe4, 0xac, 0xf7, 0xdf, 0x3e, 0xd6]);
interface IXAudio2Extension : IUnknown
{
    void GetProcessingQuantum(uint*, uint*);
    void GetProcessor(uint*);
}
// [Not Found] IID_IXAudio2Voice
interface IXAudio2Voice
{
    void GetVoiceDetails(XAUDIO2_VOICE_DETAILS*);
    HRESULT SetOutputVoices(const(XAUDIO2_VOICE_SENDS)*);
    HRESULT SetEffectChain(const(XAUDIO2_EFFECT_CHAIN)*);
    HRESULT EnableEffect(uint, uint);
    HRESULT DisableEffect(uint, uint);
    void GetEffectState(uint, BOOL*);
    HRESULT SetEffectParameters(uint, const(void)*, uint, uint);
    HRESULT GetEffectParameters(uint, void*, uint);
    HRESULT SetFilterParameters(const(XAUDIO2_FILTER_PARAMETERS)*, uint);
    void GetFilterParameters(XAUDIO2_FILTER_PARAMETERS*);
    HRESULT SetOutputFilterParameters(IXAudio2Voice, const(XAUDIO2_FILTER_PARAMETERS)*, uint);
    void GetOutputFilterParameters(IXAudio2Voice, XAUDIO2_FILTER_PARAMETERS*);
    HRESULT SetVolume(float, uint);
    void GetVolume(float*);
    HRESULT SetChannelVolumes(uint, const(float)*, uint);
    void GetChannelVolumes(uint, float*);
    HRESULT SetOutputMatrix(IXAudio2Voice, uint, uint, const(float)*, uint);
    void GetOutputMatrix(IXAudio2Voice, uint, uint, float*);
    void DestroyVoice();
}
// [Not Found] IID_IXAudio2SourceVoice
interface IXAudio2SourceVoice : IXAudio2Voice
{
    HRESULT Start(uint, uint);
    HRESULT Stop(uint, uint);
    HRESULT SubmitSourceBuffer(const(XAUDIO2_BUFFER)*, const(XAUDIO2_BUFFER_WMA)*);
    HRESULT FlushSourceBuffers();
    HRESULT Discontinuity();
    HRESULT ExitLoop(uint);
    void GetState(XAUDIO2_VOICE_STATE*, uint);
    HRESULT SetFrequencyRatio(float, uint);
    void GetFrequencyRatio(float*);
    HRESULT SetSourceSampleRate(uint);
}
// [Not Found] IID_IXAudio2SubmixVoice
interface IXAudio2SubmixVoice : IXAudio2Voice
{
}
// [Not Found] IID_IXAudio2MasteringVoice
interface IXAudio2MasteringVoice : IXAudio2Voice
{
    HRESULT GetChannelMask(uint*);
}
// [Not Found] IID_IXAudio2EngineCallback
interface IXAudio2EngineCallback
{
    void OnProcessingPassStart();
    void OnProcessingPassEnd();
    void OnCriticalError(HRESULT);
}
// [Not Found] IID_IXAudio2VoiceCallback
interface IXAudio2VoiceCallback
{
    void OnVoiceProcessingPassStart(uint);
    void OnVoiceProcessingPassEnd();
    void OnStreamEnd();
    void OnBufferStart(void*);
    void OnBufferEnd(void*);
    void OnLoopEnd(void*);
    void OnVoiceError(void*, HRESULT);
}
enum CLSID_AudioVolumeMeter = GUID(0x4fc3b166, 0x972a, 0x40cf, [0xbc, 0x37, 0x7d, 0xb0, 0x3d, 0xb2, 0xfb, 0xa3]);
struct AudioVolumeMeter
{
}
enum CLSID_AudioReverb = GUID(0xc2633b16, 0x471b, 0x4498, [0xb8, 0xc5, 0x4f, 0x9, 0x59, 0xe2, 0xec, 0x9]);
struct AudioReverb
{
}
struct XAUDIO2FX_VOLUMEMETER_LEVELS
{
    align (1):
    float* pPeakLevels;
    float* pRMSLevels;
    uint ChannelCount;
}
struct XAUDIO2FX_REVERB_PARAMETERS
{
    align (1):
    float WetDryMix;
    uint ReflectionsDelay;
    ubyte ReverbDelay;
    ubyte RearDelay;
    ubyte SideDelay;
    ubyte PositionLeft;
    ubyte PositionRight;
    ubyte PositionMatrixLeft;
    ubyte PositionMatrixRight;
    ubyte EarlyDiffusion;
    ubyte LateDiffusion;
    ubyte LowEQGain;
    ubyte LowEQCutoff;
    ubyte HighEQGain;
    ubyte HighEQCutoff;
    float RoomFilterFreq;
    float RoomFilterMain;
    float RoomFilterHF;
    float ReflectionsGain;
    float ReverbGain;
    float DecayTime;
    float Density;
    float RoomSize;
    BOOL DisableLateField;
}
struct XAUDIO2FX_REVERB_I3DL2_PARAMETERS
{
    align (1):
    float WetDryMix;
    int Room;
    int RoomHF;
    float RoomRolloffFactor;
    float DecayTime;
    float DecayHFRatio;
    int Reflections;
    float ReflectionsDelay;
    int Reverb;
    float ReverbDelay;
    float Diffusion;
    float Density;
    float HFReference;
}
struct HrtfPosition
{
    float x;
    float y;
    float z;
}
struct HrtfOrientation
{
    float[9] element;
}
alias HrtfDirectivityType = int;
enum : int
{
    OmniDirectional = 0x00000000,
    Cardioid        = 0x00000001,
    Cone            = 0x00000002,
}

alias HrtfEnvironment = int;
enum : int
{
    Small    = 0x00000000,
    Medium   = 0x00000001,
    Large    = 0x00000002,
    Outdoors = 0x00000003,
}

struct HrtfDirectivity
{
    HrtfDirectivityType type;
    float scaling;
}
struct HrtfDirectivityCardioid
{
    HrtfDirectivity directivity;
    float order;
}
struct HrtfDirectivityCone
{
    HrtfDirectivity directivity;
    float innerAngle;
    float outerAngle;
}
alias HrtfDistanceDecayType = int;
enum : int
{
    NaturalDecay = 0x00000000,
    CustomDecay  = 0x00000001,
}

struct HrtfDistanceDecay
{
    HrtfDistanceDecayType type;
    float maxGain;
    float minGain;
    float unityGainDistance;
    float cutoffDistance;
}
struct HrtfApoInit
{
    HrtfDistanceDecay* distanceDecay;
    HrtfDirectivity* directivity;
}
enum IID_IXAPOHrtfParameters = GUID(0x15b3cd66, 0xe9de, 0x4464, [0xb6, 0xe6, 0x2b, 0xc3, 0xcf, 0x63, 0xd4, 0x55]);
interface IXAPOHrtfParameters : IUnknown
{
    HRESULT SetSourcePosition(const(HrtfPosition)*);
    HRESULT SetSourceOrientation(const(HrtfOrientation)*);
    HRESULT SetSourceGain(float);
    HRESULT SetEnvironment(HrtfEnvironment);
}
