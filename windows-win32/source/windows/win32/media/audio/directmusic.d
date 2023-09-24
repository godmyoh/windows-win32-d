module windows.win32.media.audio.directmusic;

import windows.win32.guid : GUID;
import windows.win32.foundation : BOOL, CHAR, HANDLE, HRESULT, HWND, PSTR, PWSTR;
import windows.win32.media : IReferenceClock;
import windows.win32.media.audio : HMIDI, WAVEFORMATEX;
import windows.win32.media.audio.directsound : IDirectSound, IDirectSoundBuffer;
import windows.win32.media.multimedia : MIDIOPENSTRMID;
import windows.win32.system.com : IUnknown;
import windows.win32.system.io : OVERLAPPED;

version (Windows):
extern (Windows):

enum DMUS_MAX_DESCRIPTION = 0x00000080;
enum DMUS_MAX_DRIVER = 0x00000080;
enum DMUS_EFFECT_NONE = 0x00000000;
enum DMUS_EFFECT_REVERB = 0x00000001;
enum DMUS_EFFECT_CHORUS = 0x00000002;
enum DMUS_EFFECT_DELAY = 0x00000004;
enum DMUS_PC_INPUTCLASS = 0x00000000;
enum DMUS_PC_OUTPUTCLASS = 0x00000001;
enum DMUS_PC_DLS = 0x00000001;
enum DMUS_PC_EXTERNAL = 0x00000002;
enum DMUS_PC_SOFTWARESYNTH = 0x00000004;
enum DMUS_PC_MEMORYSIZEFIXED = 0x00000008;
enum DMUS_PC_GMINHARDWARE = 0x00000010;
enum DMUS_PC_GSINHARDWARE = 0x00000020;
enum DMUS_PC_XGINHARDWARE = 0x00000040;
enum DMUS_PC_DIRECTSOUND = 0x00000080;
enum DMUS_PC_SHAREABLE = 0x00000100;
enum DMUS_PC_DLS2 = 0x00000200;
enum DMUS_PC_AUDIOPATH = 0x00000400;
enum DMUS_PC_WAVE = 0x00000800;
enum DMUS_PC_SYSTEMMEMORY = 0x7fffffff;
enum DMUS_PORT_WINMM_DRIVER = 0x00000000;
enum DMUS_PORT_USER_MODE_SYNTH = 0x00000001;
enum DMUS_PORT_KERNEL_MODE = 0x00000002;
enum DMUS_PORTPARAMS_VOICES = 0x00000001;
enum DMUS_PORTPARAMS_CHANNELGROUPS = 0x00000002;
enum DMUS_PORTPARAMS_AUDIOCHANNELS = 0x00000004;
enum DMUS_PORTPARAMS_SAMPLERATE = 0x00000008;
enum DMUS_PORTPARAMS_EFFECTS = 0x00000020;
enum DMUS_PORTPARAMS_SHARE = 0x00000040;
enum DMUS_PORTPARAMS_FEATURES = 0x00000080;
enum DMUS_PORT_FEATURE_AUDIOPATH = 0x00000001;
enum DMUS_PORT_FEATURE_STREAMING = 0x00000002;
enum DMUS_SYNTHSTATS_VOICES = 0x00000001;
enum DMUS_SYNTHSTATS_TOTAL_CPU = 0x00000002;
enum DMUS_SYNTHSTATS_CPU_PER_VOICE = 0x00000004;
enum DMUS_SYNTHSTATS_LOST_NOTES = 0x00000008;
enum DMUS_SYNTHSTATS_PEAK_VOLUME = 0x00000010;
enum DMUS_SYNTHSTATS_FREE_MEMORY = 0x00000020;
enum DMUS_SYNTHSTATS_SYSTEMMEMORY = 0x7fffffff;
enum DMUS_CLOCKF_GLOBAL = 0x00000001;
enum DSBUSID_FIRST_SPKR_LOC = 0x00000000;
enum DSBUSID_FRONT_LEFT = 0x00000000;
enum DSBUSID_LEFT = 0x00000000;
enum DSBUSID_FRONT_RIGHT = 0x00000001;
enum DSBUSID_RIGHT = 0x00000001;
enum DSBUSID_FRONT_CENTER = 0x00000002;
enum DSBUSID_LOW_FREQUENCY = 0x00000003;
enum DSBUSID_BACK_LEFT = 0x00000004;
enum DSBUSID_BACK_RIGHT = 0x00000005;
enum DSBUSID_FRONT_LEFT_OF_CENTER = 0x00000006;
enum DSBUSID_FRONT_RIGHT_OF_CENTER = 0x00000007;
enum DSBUSID_BACK_CENTER = 0x00000008;
enum DSBUSID_SIDE_LEFT = 0x00000009;
enum DSBUSID_SIDE_RIGHT = 0x0000000a;
enum DSBUSID_TOP_CENTER = 0x0000000b;
enum DSBUSID_TOP_FRONT_LEFT = 0x0000000c;
enum DSBUSID_TOP_FRONT_CENTER = 0x0000000d;
enum DSBUSID_TOP_FRONT_RIGHT = 0x0000000e;
enum DSBUSID_TOP_BACK_LEFT = 0x0000000f;
enum DSBUSID_TOP_BACK_CENTER = 0x00000010;
enum DSBUSID_TOP_BACK_RIGHT = 0x00000011;
enum DSBUSID_LAST_SPKR_LOC = 0x00000011;
enum DSBUSID_REVERB_SEND = 0x00000040;
enum DSBUSID_CHORUS_SEND = 0x00000041;
enum DSBUSID_DYNAMIC_0 = 0x00000200;
enum DSBUSID_NULL = 0xffffffff;
enum DAUD_CRITICAL_VOICE_PRIORITY = 0xf0000000;
enum DAUD_HIGH_VOICE_PRIORITY = 0xc0000000;
enum DAUD_STANDARD_VOICE_PRIORITY = 0x80000000;
enum DAUD_LOW_VOICE_PRIORITY = 0x40000000;
enum DAUD_PERSIST_VOICE_PRIORITY = 0x10000000;
enum DAUD_CHAN1_VOICE_PRIORITY_OFFSET = 0x0000000e;
enum DAUD_CHAN2_VOICE_PRIORITY_OFFSET = 0x0000000d;
enum DAUD_CHAN3_VOICE_PRIORITY_OFFSET = 0x0000000c;
enum DAUD_CHAN4_VOICE_PRIORITY_OFFSET = 0x0000000b;
enum DAUD_CHAN5_VOICE_PRIORITY_OFFSET = 0x0000000a;
enum DAUD_CHAN6_VOICE_PRIORITY_OFFSET = 0x00000009;
enum DAUD_CHAN7_VOICE_PRIORITY_OFFSET = 0x00000008;
enum DAUD_CHAN8_VOICE_PRIORITY_OFFSET = 0x00000007;
enum DAUD_CHAN9_VOICE_PRIORITY_OFFSET = 0x00000006;
enum DAUD_CHAN10_VOICE_PRIORITY_OFFSET = 0x0000000f;
enum DAUD_CHAN11_VOICE_PRIORITY_OFFSET = 0x00000005;
enum DAUD_CHAN12_VOICE_PRIORITY_OFFSET = 0x00000004;
enum DAUD_CHAN13_VOICE_PRIORITY_OFFSET = 0x00000003;
enum DAUD_CHAN14_VOICE_PRIORITY_OFFSET = 0x00000002;
enum DAUD_CHAN15_VOICE_PRIORITY_OFFSET = 0x00000001;
enum DAUD_CHAN16_VOICE_PRIORITY_OFFSET = 0x00000000;
enum CLSID_DirectMusic = GUID(0x636b9f10, 0xc7d, 0x11d1, [0x95, 0xb2, 0x0, 0x20, 0xaf, 0xdc, 0x74, 0x21]);
enum CLSID_DirectMusicCollection = GUID(0x480ff4b0, 0x28b2, 0x11d1, [0xbe, 0xf7, 0x0, 0xc0, 0x4f, 0xbf, 0x8f, 0xef]);
enum CLSID_DirectMusicSynth = GUID(0x58c2b4d0, 0x46e7, 0x11d1, [0x89, 0xac, 0x0, 0xa0, 0xc9, 0x5, 0x41, 0x29]);
enum GUID_DMUS_PROP_GM_Hardware = GUID(0x178f2f24, 0xc364, 0x11d1, [0xa7, 0x60, 0x0, 0x0, 0xf8, 0x75, 0xac, 0x12]);
enum GUID_DMUS_PROP_GS_Hardware = GUID(0x178f2f25, 0xc364, 0x11d1, [0xa7, 0x60, 0x0, 0x0, 0xf8, 0x75, 0xac, 0x12]);
enum GUID_DMUS_PROP_XG_Hardware = GUID(0x178f2f26, 0xc364, 0x11d1, [0xa7, 0x60, 0x0, 0x0, 0xf8, 0x75, 0xac, 0x12]);
enum GUID_DMUS_PROP_XG_Capable = GUID(0x6496aba1, 0x61b0, 0x11d2, [0xaf, 0xa6, 0x0, 0xaa, 0x0, 0x24, 0xd8, 0xb6]);
enum GUID_DMUS_PROP_GS_Capable = GUID(0x6496aba2, 0x61b0, 0x11d2, [0xaf, 0xa6, 0x0, 0xaa, 0x0, 0x24, 0xd8, 0xb6]);
enum GUID_DMUS_PROP_DLS1 = GUID(0x178f2f27, 0xc364, 0x11d1, [0xa7, 0x60, 0x0, 0x0, 0xf8, 0x75, 0xac, 0x12]);
enum GUID_DMUS_PROP_DLS2 = GUID(0xf14599e5, 0x4689, 0x11d2, [0xaf, 0xa6, 0x0, 0xaa, 0x0, 0x24, 0xd8, 0xb6]);
enum GUID_DMUS_PROP_INSTRUMENT2 = GUID(0x865fd372, 0x9f67, 0x11d2, [0x87, 0x2a, 0x0, 0x60, 0x8, 0x93, 0xb1, 0xbd]);
enum GUID_DMUS_PROP_SynthSink_DSOUND = GUID(0xaa97844, 0xc877, 0x11d1, [0x87, 0xc, 0x0, 0x60, 0x8, 0x93, 0xb1, 0xbd]);
enum GUID_DMUS_PROP_SynthSink_WAVE = GUID(0xaa97845, 0xc877, 0x11d1, [0x87, 0xc, 0x0, 0x60, 0x8, 0x93, 0xb1, 0xbd]);
enum GUID_DMUS_PROP_SampleMemorySize = GUID(0x178f2f28, 0xc364, 0x11d1, [0xa7, 0x60, 0x0, 0x0, 0xf8, 0x75, 0xac, 0x12]);
enum GUID_DMUS_PROP_SamplePlaybackRate = GUID(0x2a91f713, 0xa4bf, 0x11d2, [0xbb, 0xdf, 0x0, 0x60, 0x8, 0x33, 0xdb, 0xd8]);
enum GUID_DMUS_PROP_WriteLatency = GUID(0x268a0fa0, 0x60f2, 0x11d2, [0xaf, 0xa6, 0x0, 0xaa, 0x0, 0x24, 0xd8, 0xb6]);
enum GUID_DMUS_PROP_WritePeriod = GUID(0x268a0fa1, 0x60f2, 0x11d2, [0xaf, 0xa6, 0x0, 0xaa, 0x0, 0x24, 0xd8, 0xb6]);
enum GUID_DMUS_PROP_MemorySize = GUID(0x178f2f28, 0xc364, 0x11d1, [0xa7, 0x60, 0x0, 0x0, 0xf8, 0x75, 0xac, 0x12]);
enum GUID_DMUS_PROP_WavesReverb = GUID(0x4cb5622, 0x32e5, 0x11d2, [0xaf, 0xa6, 0x0, 0xaa, 0x0, 0x24, 0xd8, 0xb6]);
enum GUID_DMUS_PROP_Effects = GUID(0xcda8d611, 0x684a, 0x11d2, [0x87, 0x1e, 0x0, 0x60, 0x8, 0x93, 0xb1, 0xbd]);
enum GUID_DMUS_PROP_LegacyCaps = GUID(0xcfa7cdc2, 0xa1, 0x11d2, [0xaa, 0xd5, 0x0, 0x0, 0xf8, 0x75, 0xac, 0x12]);
enum GUID_DMUS_PROP_Volume = GUID(0xfedfae25, 0xe46e, 0x11d1, [0xaa, 0xce, 0x0, 0x0, 0xf8, 0x75, 0xac, 0x12]);
enum DMUS_VOLUME_MAX = 0x000007d0;
enum DMUS_VOLUME_MIN = 0xffffffffffffb1e0;
enum DMUS_EVENT_STRUCTURED = 0x00000001;
enum DMUS_DOWNLOADINFO_INSTRUMENT = 0x00000001;
enum DMUS_DOWNLOADINFO_WAVE = 0x00000002;
enum DMUS_DOWNLOADINFO_INSTRUMENT2 = 0x00000003;
enum DMUS_DOWNLOADINFO_WAVEARTICULATION = 0x00000004;
enum DMUS_DOWNLOADINFO_STREAMINGWAVE = 0x00000005;
enum DMUS_DOWNLOADINFO_ONESHOTWAVE = 0x00000006;
enum DMUS_DEFAULT_SIZE_OFFSETTABLE = 0x00000001;
enum DMUS_INSTRUMENT_GM_INSTRUMENT = 0x00000001;
enum DMUS_MIN_DATA_SIZE = 0x00000004;
enum CONN_SRC_NONE = 0x00000000;
enum CONN_SRC_LFO = 0x00000001;
enum CONN_SRC_KEYONVELOCITY = 0x00000002;
enum CONN_SRC_KEYNUMBER = 0x00000003;
enum CONN_SRC_EG1 = 0x00000004;
enum CONN_SRC_EG2 = 0x00000005;
enum CONN_SRC_PITCHWHEEL = 0x00000006;
enum CONN_SRC_CC1 = 0x00000081;
enum CONN_SRC_CC7 = 0x00000087;
enum CONN_SRC_CC10 = 0x0000008a;
enum CONN_SRC_CC11 = 0x0000008b;
enum CONN_DST_NONE = 0x00000000;
enum CONN_DST_ATTENUATION = 0x00000001;
enum CONN_DST_PITCH = 0x00000003;
enum CONN_DST_PAN = 0x00000004;
enum CONN_DST_LFO_FREQUENCY = 0x00000104;
enum CONN_DST_LFO_STARTDELAY = 0x00000105;
enum CONN_DST_EG1_ATTACKTIME = 0x00000206;
enum CONN_DST_EG1_DECAYTIME = 0x00000207;
enum CONN_DST_EG1_RELEASETIME = 0x00000209;
enum CONN_DST_EG1_SUSTAINLEVEL = 0x0000020a;
enum CONN_DST_EG2_ATTACKTIME = 0x0000030a;
enum CONN_DST_EG2_DECAYTIME = 0x0000030b;
enum CONN_DST_EG2_RELEASETIME = 0x0000030d;
enum CONN_DST_EG2_SUSTAINLEVEL = 0x0000030e;
enum CONN_TRN_NONE = 0x00000000;
enum CONN_TRN_CONCAVE = 0x00000001;
enum F_INSTRUMENT_DRUMS = 0x80000000;
enum F_RGN_OPTION_SELFNONEXCLUSIVE = 0x00000001;
enum WAVELINK_CHANNEL_LEFT = 0x00000001;
enum WAVELINK_CHANNEL_RIGHT = 0x00000002;
enum F_WAVELINK_PHASE_MASTER = 0x00000001;
enum POOL_CUE_NULL = 0xffffffffffffffff;
enum F_WSMP_NO_TRUNCATION = 0x00000001;
enum F_WSMP_NO_COMPRESSION = 0x00000002;
enum WLOOP_TYPE_FORWARD = 0x00000000;
enum CONN_SRC_POLYPRESSURE = 0x00000007;
enum CONN_SRC_CHANNELPRESSURE = 0x00000008;
enum CONN_SRC_VIBRATO = 0x00000009;
enum CONN_SRC_MONOPRESSURE = 0x0000000a;
enum CONN_SRC_CC91 = 0x000000db;
enum CONN_SRC_CC93 = 0x000000dd;
enum CONN_DST_GAIN = 0x00000001;
enum CONN_DST_KEYNUMBER = 0x00000005;
enum CONN_DST_LEFT = 0x00000010;
enum CONN_DST_RIGHT = 0x00000011;
enum CONN_DST_CENTER = 0x00000012;
enum CONN_DST_LEFTREAR = 0x00000013;
enum CONN_DST_RIGHTREAR = 0x00000014;
enum CONN_DST_LFE_CHANNEL = 0x00000015;
enum CONN_DST_CHORUS = 0x00000080;
enum CONN_DST_REVERB = 0x00000081;
enum CONN_DST_VIB_FREQUENCY = 0x00000114;
enum CONN_DST_VIB_STARTDELAY = 0x00000115;
enum CONN_DST_EG1_DELAYTIME = 0x0000020b;
enum CONN_DST_EG1_HOLDTIME = 0x0000020c;
enum CONN_DST_EG1_SHUTDOWNTIME = 0x0000020d;
enum CONN_DST_EG2_DELAYTIME = 0x0000030f;
enum CONN_DST_EG2_HOLDTIME = 0x00000310;
enum CONN_DST_FILTER_CUTOFF = 0x00000500;
enum CONN_DST_FILTER_Q = 0x00000501;
enum CONN_TRN_CONVEX = 0x00000002;
enum CONN_TRN_SWITCH = 0x00000003;
enum DLS_CDL_AND = 0x00000001;
enum DLS_CDL_OR = 0x00000002;
enum DLS_CDL_XOR = 0x00000003;
enum DLS_CDL_ADD = 0x00000004;
enum DLS_CDL_SUBTRACT = 0x00000005;
enum DLS_CDL_MULTIPLY = 0x00000006;
enum DLS_CDL_DIVIDE = 0x00000007;
enum DLS_CDL_LOGICAL_AND = 0x00000008;
enum DLS_CDL_LOGICAL_OR = 0x00000009;
enum DLS_CDL_LT = 0x0000000a;
enum DLS_CDL_LE = 0x0000000b;
enum DLS_CDL_GT = 0x0000000c;
enum DLS_CDL_GE = 0x0000000d;
enum DLS_CDL_EQ = 0x0000000e;
enum DLS_CDL_NOT = 0x0000000f;
enum DLS_CDL_CONST = 0x00000010;
enum DLS_CDL_QUERY = 0x00000011;
enum DLS_CDL_QUERYSUPPORTED = 0x00000012;
enum WLOOP_TYPE_RELEASE = 0x00000002;
enum F_WAVELINK_MULTICHANNEL = 0x00000002;
enum DLSID_GMInHardware = GUID(0x178f2f24, 0xc364, 0x11d1, [0xa7, 0x60, 0x0, 0x0, 0xf8, 0x75, 0xac, 0x12]);
enum DLSID_GSInHardware = GUID(0x178f2f25, 0xc364, 0x11d1, [0xa7, 0x60, 0x0, 0x0, 0xf8, 0x75, 0xac, 0x12]);
enum DLSID_XGInHardware = GUID(0x178f2f26, 0xc364, 0x11d1, [0xa7, 0x60, 0x0, 0x0, 0xf8, 0x75, 0xac, 0x12]);
enum DLSID_SupportsDLS1 = GUID(0x178f2f27, 0xc364, 0x11d1, [0xa7, 0x60, 0x0, 0x0, 0xf8, 0x75, 0xac, 0x12]);
enum DLSID_SupportsDLS2 = GUID(0xf14599e5, 0x4689, 0x11d2, [0xaf, 0xa6, 0x0, 0xaa, 0x0, 0x24, 0xd8, 0xb6]);
enum DLSID_SampleMemorySize = GUID(0x178f2f28, 0xc364, 0x11d1, [0xa7, 0x60, 0x0, 0x0, 0xf8, 0x75, 0xac, 0x12]);
enum DLSID_ManufacturersID = GUID(0xb03e1181, 0x8095, 0x11d2, [0xa1, 0xef, 0x0, 0x60, 0x8, 0x33, 0xdb, 0xd8]);
enum DLSID_ProductID = GUID(0xb03e1182, 0x8095, 0x11d2, [0xa1, 0xef, 0x0, 0x60, 0x8, 0x33, 0xdb, 0xd8]);
enum DLSID_SamplePlaybackRate = GUID(0x2a91f713, 0xa4bf, 0x11d2, [0xbb, 0xdf, 0x0, 0x60, 0x8, 0x33, 0xdb, 0xd8]);
enum REGSTR_PATH_SOFTWARESYNTHS = "Software\\Microsoft\\DirectMusic\\SoftwareSynths";
enum REFRESH_F_LASTBUFFER = 0x00000001;
enum CLSID_DirectMusicSynthSink = GUID(0xaec17ce3, 0xa514, 0x11d1, [0xaf, 0xa6, 0x0, 0xaa, 0x0, 0x24, 0xd8, 0xb6]);
enum GUID_DMUS_PROP_SetSynthSink = GUID(0xa3a5ba5, 0x37b6, 0x11d2, [0xb9, 0xf9, 0x0, 0x0, 0xf8, 0x75, 0xac, 0x12]);
enum GUID_DMUS_PROP_SinkUsesDSound = GUID(0xbe208857, 0x8952, 0x11d2, [0xba, 0x1c, 0x0, 0x0, 0xf8, 0x75, 0xac, 0x12]);
enum CLSID_DirectSoundPrivate = GUID(0x11ab3ec0, 0x25ec, 0x11d1, [0xa4, 0xd8, 0x0, 0xc0, 0x4f, 0xc2, 0x8a, 0xca]);
enum DSPROPSETID_DirectSoundDevice = GUID(0x84624f82, 0x25ec, 0x11d1, [0xa4, 0xd8, 0x0, 0xc0, 0x4f, 0xc2, 0x8a, 0xca]);
enum DV_DVSD_NTSC_FRAMESIZE = 0x0001d4c0;
enum DV_DVSD_PAL_FRAMESIZE = 0x00023280;
enum DV_SMCHN = 0x0000e000;
enum DV_AUDIOMODE = 0x00000f00;
enum DV_AUDIOSMP = 0x38000000;
enum DV_AUDIOQU = 0x07000000;
enum DV_NTSCPAL = 0x00200000;
enum DV_STYPE = 0x001f0000;
enum DV_NTSC = 0x00000000;
enum DV_PAL = 0x00000001;
enum DV_SD = 0x00000000;
enum DV_HD = 0x00000001;
enum DV_SL = 0x00000002;
enum DV_CAP_AUD16Bits = 0x00000000;
enum DV_CAP_AUD12Bits = 0x00000001;
enum SIZE_DVINFO = 0x00000020;
struct DLSID
{
    uint ulData1;
    ushort usData2;
    ushort usData3;
    ubyte[8] abData4;
}
struct DLSVERSION
{
    uint dwVersionMS;
    uint dwVersionLS;
}
struct CONNECTION
{
    ushort usSource;
    ushort usControl;
    ushort usDestination;
    ushort usTransform;
    int lScale;
}
struct CONNECTIONLIST
{
    uint cbSize;
    uint cConnections;
}
struct RGNRANGE
{
    ushort usLow;
    ushort usHigh;
}
struct MIDILOCALE
{
    uint ulBank;
    uint ulInstrument;
}
struct RGNHEADER
{
    RGNRANGE RangeKey;
    RGNRANGE RangeVelocity;
    ushort fusOptions;
    ushort usKeyGroup;
}
struct INSTHEADER
{
    uint cRegions;
    MIDILOCALE Locale;
}
struct DLSHEADER
{
    uint cInstruments;
}
struct WAVELINK
{
    ushort fusOptions;
    ushort usPhaseGroup;
    uint ulChannel;
    uint ulTableIndex;
}
struct POOLCUE
{
    uint ulOffset;
}
struct POOLTABLE
{
    uint cbSize;
    uint cCues;
}
struct WSMPL
{
    uint cbSize;
    ushort usUnityNote;
    short sFineTune;
    int lAttenuation;
    uint fulOptions;
    uint cSampleLoops;
}
struct WLOOP
{
    uint cbSize;
    uint ulType;
    uint ulStart;
    uint ulLength;
}
struct DMUS_DOWNLOADINFO
{
    uint dwDLType;
    uint dwDLId;
    uint dwNumOffsetTableEntries;
    uint cbSize;
}
struct DMUS_OFFSETTABLE
{
    uint[1] ulOffsetTable;
}
struct DMUS_INSTRUMENT
{
    uint ulPatch;
    uint ulFirstRegionIdx;
    uint ulGlobalArtIdx;
    uint ulFirstExtCkIdx;
    uint ulCopyrightIdx;
    uint ulFlags;
}
struct DMUS_REGION
{
    RGNRANGE RangeKey;
    RGNRANGE RangeVelocity;
    ushort fusOptions;
    ushort usKeyGroup;
    uint ulRegionArtIdx;
    uint ulNextRegionIdx;
    uint ulFirstExtCkIdx;
    WAVELINK WaveLink;
    WSMPL WSMP;
    WLOOP[1] WLOOP_;
}
struct DMUS_LFOPARAMS
{
    int pcFrequency;
    int tcDelay;
    int gcVolumeScale;
    int pcPitchScale;
    int gcMWToVolume;
    int pcMWToPitch;
}
struct DMUS_VEGPARAMS
{
    int tcAttack;
    int tcDecay;
    int ptSustain;
    int tcRelease;
    int tcVel2Attack;
    int tcKey2Decay;
}
struct DMUS_PEGPARAMS
{
    int tcAttack;
    int tcDecay;
    int ptSustain;
    int tcRelease;
    int tcVel2Attack;
    int tcKey2Decay;
    int pcRange;
}
struct DMUS_MSCPARAMS
{
    int ptDefaultPan;
}
struct DMUS_ARTICPARAMS
{
    DMUS_LFOPARAMS LFO;
    DMUS_VEGPARAMS VolEG;
    DMUS_PEGPARAMS PitchEG;
    DMUS_MSCPARAMS Misc;
}
struct DMUS_ARTICULATION
{
    uint ulArt1Idx;
    uint ulFirstExtCkIdx;
}
struct DMUS_ARTICULATION2
{
    uint ulArtIdx;
    uint ulFirstExtCkIdx;
    uint ulNextArtIdx;
}
struct DMUS_EXTENSIONCHUNK
{
    uint cbSize;
    uint ulNextExtCkIdx;
    uint ExtCkID;
    ubyte[4] byExtCk;
}
struct DMUS_COPYRIGHT
{
    uint cbSize;
    ubyte[4] byCopyright;
}
struct DMUS_WAVEDATA
{
    uint cbSize;
    ubyte[4] byData;
}
struct DMUS_WAVE
{
    uint ulFirstExtCkIdx;
    uint ulCopyrightIdx;
    uint ulWaveDataIdx;
    WAVEFORMATEX WaveformatEx;
}
struct DMUS_NOTERANGE
{
    uint dwLowNote;
    uint dwHighNote;
}
struct DMUS_WAVEARTDL
{
    uint ulDownloadIdIdx;
    uint ulBus;
    uint ulBuffers;
    uint ulMasterDLId;
    ushort usOptions;
}
struct DMUS_WAVEDL
{
    uint cbWaveData;
}
struct DMUS_EVENTHEADER
{
    align (4):
    uint cbEvent;
    uint dwChannelGroup;
    long rtDelta;
    uint dwFlags;
}
struct DMUS_BUFFERDESC
{
    uint dwSize;
    uint dwFlags;
    GUID guidBufferFormat;
    uint cbBuffer;
}
struct DMUS_PORTCAPS
{
    uint dwSize;
    uint dwFlags;
    GUID guidPort;
    uint dwClass;
    uint dwType;
    uint dwMemorySize;
    uint dwMaxChannelGroups;
    uint dwMaxVoices;
    uint dwMaxAudioChannels;
    uint dwEffectFlags;
    wchar[128] wszDescription;
}
struct DMUS_PORTPARAMS7
{
    uint dwSize;
    uint dwValidParams;
    uint dwVoices;
    uint dwChannelGroups;
    uint dwAudioChannels;
    uint dwSampleRate;
    uint dwEffectFlags;
    BOOL fShare;
}
struct DMUS_PORTPARAMS8
{
    uint dwSize;
    uint dwValidParams;
    uint dwVoices;
    uint dwChannelGroups;
    uint dwAudioChannels;
    uint dwSampleRate;
    uint dwEffectFlags;
    BOOL fShare;
    uint dwFeatures;
}
struct DMUS_SYNTHSTATS
{
    uint dwSize;
    uint dwValidStats;
    uint dwVoices;
    uint dwTotalCPU;
    uint dwCPUPerVoice;
    uint dwLostNotes;
    uint dwFreeMemory;
    int lPeakVolume;
}
struct DMUS_SYNTHSTATS8
{
    uint dwSize;
    uint dwValidStats;
    uint dwVoices;
    uint dwTotalCPU;
    uint dwCPUPerVoice;
    uint dwLostNotes;
    uint dwFreeMemory;
    int lPeakVolume;
    uint dwSynthMemUse;
}
struct DMUS_WAVES_REVERB_PARAMS
{
    float fInGain;
    float fReverbMix;
    float fReverbTime;
    float fHighFreqRTRatio;
}
alias DMUS_CLOCKTYPE = int;
enum : int
{
    DMUS_CLOCK_SYSTEM = 0x00000000,
    DMUS_CLOCK_WAVE   = 0x00000001,
}

struct DMUS_CLOCKINFO7
{
    uint dwSize;
    DMUS_CLOCKTYPE ctType;
    GUID guidClock;
    wchar[128] wszDescription;
}
struct DMUS_CLOCKINFO8
{
    uint dwSize;
    DMUS_CLOCKTYPE ctType;
    GUID guidClock;
    wchar[128] wszDescription;
    uint dwFlags;
}
enum IID_IDirectMusic = GUID(0x6536115a, 0x7b2d, 0x11d2, [0xba, 0x18, 0x0, 0x0, 0xf8, 0x75, 0xac, 0x12]);
interface IDirectMusic : IUnknown
{
    HRESULT EnumPort(uint, DMUS_PORTCAPS*);
    HRESULT CreateMusicBuffer(DMUS_BUFFERDESC*, IDirectMusicBuffer*, IUnknown);
    HRESULT CreatePort(const(GUID)*, DMUS_PORTPARAMS8*, IDirectMusicPort*, IUnknown);
    HRESULT EnumMasterClock(uint, DMUS_CLOCKINFO8*);
    HRESULT GetMasterClock(GUID*, IReferenceClock*);
    HRESULT SetMasterClock(const(GUID)*);
    HRESULT Activate(BOOL);
    HRESULT GetDefaultPort(GUID*);
    HRESULT SetDirectSound(IDirectSound, HWND);
}
enum IID_IDirectMusic8 = GUID(0x2d3629f7, 0x813d, 0x4939, [0x85, 0x8, 0xf0, 0x5c, 0x6b, 0x75, 0xfd, 0x97]);
interface IDirectMusic8 : IDirectMusic
{
    HRESULT SetExternalMasterClock(IReferenceClock);
}
enum IID_IDirectMusicBuffer = GUID(0xd2ac2878, 0xb39b, 0x11d1, [0x87, 0x4, 0x0, 0x60, 0x8, 0x93, 0xb1, 0xbd]);
interface IDirectMusicBuffer : IUnknown
{
    HRESULT Flush();
    HRESULT TotalTime(long*);
    HRESULT PackStructured(long, uint, uint);
    HRESULT PackUnstructured(long, uint, uint, ubyte*);
    HRESULT ResetReadPtr();
    HRESULT GetNextEvent(long*, uint*, uint*, ubyte**);
    HRESULT GetRawBufferPtr(ubyte**);
    HRESULT GetStartTime(long*);
    HRESULT GetUsedBytes(uint*);
    HRESULT GetMaxBytes(uint*);
    HRESULT GetBufferFormat(GUID*);
    HRESULT SetStartTime(long);
    HRESULT SetUsedBytes(uint);
}
enum IID_IDirectMusicInstrument = GUID(0xd2ac287d, 0xb39b, 0x11d1, [0x87, 0x4, 0x0, 0x60, 0x8, 0x93, 0xb1, 0xbd]);
interface IDirectMusicInstrument : IUnknown
{
    HRESULT GetPatch(uint*);
    HRESULT SetPatch(uint);
}
enum IID_IDirectMusicDownloadedInstrument = GUID(0xd2ac287e, 0xb39b, 0x11d1, [0x87, 0x4, 0x0, 0x60, 0x8, 0x93, 0xb1, 0xbd]);
interface IDirectMusicDownloadedInstrument : IUnknown
{
}
enum IID_IDirectMusicCollection = GUID(0xd2ac287c, 0xb39b, 0x11d1, [0x87, 0x4, 0x0, 0x60, 0x8, 0x93, 0xb1, 0xbd]);
interface IDirectMusicCollection : IUnknown
{
    HRESULT GetInstrument(uint, IDirectMusicInstrument*);
    HRESULT EnumInstrument(uint, uint*, PWSTR, uint);
}
enum IID_IDirectMusicDownload = GUID(0xd2ac287b, 0xb39b, 0x11d1, [0x87, 0x4, 0x0, 0x60, 0x8, 0x93, 0xb1, 0xbd]);
interface IDirectMusicDownload : IUnknown
{
    HRESULT GetBuffer(void**, uint*);
}
enum IID_IDirectMusicPortDownload = GUID(0xd2ac287a, 0xb39b, 0x11d1, [0x87, 0x4, 0x0, 0x60, 0x8, 0x93, 0xb1, 0xbd]);
interface IDirectMusicPortDownload : IUnknown
{
    HRESULT GetBuffer(uint, IDirectMusicDownload*);
    HRESULT AllocateBuffer(uint, IDirectMusicDownload*);
    HRESULT GetDLId(uint*, uint);
    HRESULT GetAppend(uint*);
    HRESULT Download(IDirectMusicDownload);
    HRESULT Unload(IDirectMusicDownload);
}
enum IID_IDirectMusicPort = GUID(0x8f2d8c9, 0x37c2, 0x11d2, [0xb9, 0xf9, 0x0, 0x0, 0xf8, 0x75, 0xac, 0x12]);
interface IDirectMusicPort : IUnknown
{
    HRESULT PlayBuffer(IDirectMusicBuffer);
    HRESULT SetReadNotificationHandle(HANDLE);
    HRESULT Read(IDirectMusicBuffer);
    HRESULT DownloadInstrument(IDirectMusicInstrument, IDirectMusicDownloadedInstrument*, DMUS_NOTERANGE*, uint);
    HRESULT UnloadInstrument(IDirectMusicDownloadedInstrument);
    HRESULT GetLatencyClock(IReferenceClock*);
    HRESULT GetRunningStats(DMUS_SYNTHSTATS*);
    HRESULT Compact();
    HRESULT GetCaps(DMUS_PORTCAPS*);
    HRESULT DeviceIoControl(uint, void*, uint, void*, uint, uint*, OVERLAPPED*);
    HRESULT SetNumChannelGroups(uint);
    HRESULT GetNumChannelGroups(uint*);
    HRESULT Activate(BOOL);
    HRESULT SetChannelPriority(uint, uint, uint);
    HRESULT GetChannelPriority(uint, uint, uint*);
    HRESULT SetDirectSound(IDirectSound, IDirectSoundBuffer);
    HRESULT GetFormat(WAVEFORMATEX*, uint*, uint*);
}
enum IID_IDirectMusicThru = GUID(0xced153e7, 0x3606, 0x11d2, [0xb9, 0xf9, 0x0, 0x0, 0xf8, 0x75, 0xac, 0x12]);
interface IDirectMusicThru : IUnknown
{
    HRESULT ThruChannel(uint, uint, uint, uint, IDirectMusicPort);
}
struct DMUS_VOICE_STATE
{
    BOOL bExists;
    ulong spPosition;
}
enum IID_IDirectMusicSynth = GUID(0x9823661, 0x5c85, 0x11d2, [0xaf, 0xa6, 0x0, 0xaa, 0x0, 0x24, 0xd8, 0xb6]);
interface IDirectMusicSynth : IUnknown
{
    HRESULT Open(DMUS_PORTPARAMS8*);
    HRESULT Close();
    HRESULT SetNumChannelGroups(uint);
    HRESULT Download(HANDLE*, void*, BOOL*);
    HRESULT Unload(HANDLE, long, HANDLE);
    HRESULT PlayBuffer(long, ubyte*, uint);
    HRESULT GetRunningStats(DMUS_SYNTHSTATS*);
    HRESULT GetPortCaps(DMUS_PORTCAPS*);
    HRESULT SetMasterClock(IReferenceClock);
    HRESULT GetLatencyClock(IReferenceClock*);
    HRESULT Activate(BOOL);
    HRESULT SetSynthSink(IDirectMusicSynthSink);
    HRESULT Render(short*, uint, long);
    HRESULT SetChannelPriority(uint, uint, uint);
    HRESULT GetChannelPriority(uint, uint, uint*);
    HRESULT GetFormat(WAVEFORMATEX*, uint*);
    HRESULT GetAppend(uint*);
}
enum IID_IDirectMusicSynth8 = GUID(0x53cab625, 0x2711, 0x4c9f, [0x9d, 0xe7, 0x1b, 0x7f, 0x92, 0x5f, 0x6f, 0xc8]);
interface IDirectMusicSynth8 : IDirectMusicSynth
{
    HRESULT PlayVoice(long, uint, uint, uint, uint, int, int, ulong, ulong, ulong);
    HRESULT StopVoice(long, uint);
    HRESULT GetVoiceState(uint*, uint, DMUS_VOICE_STATE*);
    HRESULT Refresh(uint, uint);
    HRESULT AssignChannelToBuses(uint, uint, uint*, uint);
}
enum IID_IDirectMusicSynthSink = GUID(0x9823663, 0x5c85, 0x11d2, [0xaf, 0xa6, 0x0, 0xaa, 0x0, 0x24, 0xd8, 0xb6]);
interface IDirectMusicSynthSink : IUnknown
{
    HRESULT Init(IDirectMusicSynth);
    HRESULT SetMasterClock(IReferenceClock);
    HRESULT GetLatencyClock(IReferenceClock*);
    HRESULT Activate(BOOL);
    HRESULT SampleToRefTime(long, long*);
    HRESULT RefTimeToSample(long, long*);
    HRESULT SetDirectSound(IDirectSound, IDirectSoundBuffer);
    HRESULT GetDesiredBufferSize(uint*);
}
alias DSPROPERTY_DIRECTSOUNDDEVICE = int;
enum : int
{
    DSPROPERTY_DIRECTSOUNDDEVICE_WAVEDEVICEMAPPING_A = 0x00000001,
    DSPROPERTY_DIRECTSOUNDDEVICE_DESCRIPTION_1       = 0x00000002,
    DSPROPERTY_DIRECTSOUNDDEVICE_ENUMERATE_1         = 0x00000003,
    DSPROPERTY_DIRECTSOUNDDEVICE_WAVEDEVICEMAPPING_W = 0x00000004,
    DSPROPERTY_DIRECTSOUNDDEVICE_DESCRIPTION_A       = 0x00000005,
    DSPROPERTY_DIRECTSOUNDDEVICE_DESCRIPTION_W       = 0x00000006,
    DSPROPERTY_DIRECTSOUNDDEVICE_ENUMERATE_A         = 0x00000007,
    DSPROPERTY_DIRECTSOUNDDEVICE_ENUMERATE_W         = 0x00000008,
}

alias DIRECTSOUNDDEVICE_TYPE = int;
enum : int
{
    DIRECTSOUNDDEVICE_TYPE_EMULATED = 0x00000000,
    DIRECTSOUNDDEVICE_TYPE_VXD      = 0x00000001,
    DIRECTSOUNDDEVICE_TYPE_WDM      = 0x00000002,
}

alias DIRECTSOUNDDEVICE_DATAFLOW = int;
enum : int
{
    DIRECTSOUNDDEVICE_DATAFLOW_RENDER  = 0x00000000,
    DIRECTSOUNDDEVICE_DATAFLOW_CAPTURE = 0x00000001,
}

struct DSPROPERTY_DIRECTSOUNDDEVICE_WAVEDEVICEMAPPING_A_DATA
{
    PSTR DeviceName;
    DIRECTSOUNDDEVICE_DATAFLOW DataFlow;
    GUID DeviceId;
}
struct DSPROPERTY_DIRECTSOUNDDEVICE_WAVEDEVICEMAPPING_W_DATA
{
    PWSTR DeviceName;
    DIRECTSOUNDDEVICE_DATAFLOW DataFlow;
    GUID DeviceId;
}
struct DSPROPERTY_DIRECTSOUNDDEVICE_DESCRIPTION_1_DATA
{
    GUID DeviceId;
    CHAR[256] DescriptionA;
    wchar[256] DescriptionW;
    CHAR[260] ModuleA;
    wchar[260] ModuleW;
    DIRECTSOUNDDEVICE_TYPE Type;
    DIRECTSOUNDDEVICE_DATAFLOW DataFlow;
    uint WaveDeviceId;
    uint Devnode;
}
struct DSPROPERTY_DIRECTSOUNDDEVICE_DESCRIPTION_A_DATA
{
    DIRECTSOUNDDEVICE_TYPE Type;
    DIRECTSOUNDDEVICE_DATAFLOW DataFlow;
    GUID DeviceId;
    PSTR Description;
    PSTR Module;
    PSTR Interface;
    uint WaveDeviceId;
}
struct DSPROPERTY_DIRECTSOUNDDEVICE_DESCRIPTION_W_DATA
{
    DIRECTSOUNDDEVICE_TYPE Type;
    DIRECTSOUNDDEVICE_DATAFLOW DataFlow;
    GUID DeviceId;
    PWSTR Description;
    PWSTR Module;
    PWSTR Interface;
    uint WaveDeviceId;
}
alias LPFNDIRECTSOUNDDEVICEENUMERATECALLBACK1 = BOOL function(DSPROPERTY_DIRECTSOUNDDEVICE_DESCRIPTION_1_DATA*, void*);
alias LPFNDIRECTSOUNDDEVICEENUMERATECALLBACKA = BOOL function(DSPROPERTY_DIRECTSOUNDDEVICE_DESCRIPTION_A_DATA*, void*);
alias LPFNDIRECTSOUNDDEVICEENUMERATECALLBACKW = BOOL function(DSPROPERTY_DIRECTSOUNDDEVICE_DESCRIPTION_W_DATA*, void*);
struct DSPROPERTY_DIRECTSOUNDDEVICE_ENUMERATE_1_DATA
{
    LPFNDIRECTSOUNDDEVICEENUMERATECALLBACK1 Callback;
    void* Context;
}
struct DSPROPERTY_DIRECTSOUNDDEVICE_ENUMERATE_A_DATA
{
    LPFNDIRECTSOUNDDEVICEENUMERATECALLBACKA Callback;
    void* Context;
}
struct DSPROPERTY_DIRECTSOUNDDEVICE_ENUMERATE_W_DATA
{
    LPFNDIRECTSOUNDDEVICEENUMERATECALLBACKW Callback;
    void* Context;
}
struct DVAudInfo
{
    ubyte[2] bAudStyle;
    ubyte[2] bAudQu;
    ubyte bNumAudPin;
    ushort[2] wAvgSamplesPerPinPerFrm;
    ushort wBlkMode;
    ushort wDIFMode;
    ushort wBlkDiv;
}
struct MDEVICECAPSEX
{
    align (1):
    uint cbSize;
    void* pCaps;
}
struct MIDIOPENDESC
{
    align (1):
    HMIDI hMidi;
    ulong dwCallback;
    ulong dwInstance;
    ulong dnDevNode;
    uint cIds;
    MIDIOPENSTRMID[1] rgIds;
}
