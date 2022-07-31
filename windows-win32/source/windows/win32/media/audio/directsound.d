module windows.win32.media.audio.directsound;

import windows.win32.guid : GUID;
import windows.win32.foundation : BOOL, HANDLE, HRESULT, HWND, PSTR, PWSTR;
import windows.win32.graphics.direct3d_ : D3DVECTOR;
import windows.win32.media.audio_ : WAVEFORMATEX;
import windows.win32.system.com_ : IUnknown;

version (Windows):
extern (Windows):

HRESULT DirectSoundCreate(const(GUID)*, IDirectSound*, IUnknown);
HRESULT DirectSoundEnumerateA(LPDSENUMCALLBACKA, void*);
HRESULT DirectSoundEnumerateW(LPDSENUMCALLBACKW, void*);
HRESULT DirectSoundCaptureCreate(const(GUID)*, IDirectSoundCapture*, IUnknown);
HRESULT DirectSoundCaptureEnumerateA(LPDSENUMCALLBACKA, void*);
HRESULT DirectSoundCaptureEnumerateW(LPDSENUMCALLBACKW, void*);
HRESULT DirectSoundCreate8(const(GUID)*, IDirectSound8*, IUnknown);
HRESULT DirectSoundCaptureCreate8(const(GUID)*, IDirectSoundCapture*, IUnknown);
HRESULT DirectSoundFullDuplexCreate(const(GUID)*, const(GUID)*, DSCBUFFERDESC*, DSBUFFERDESC*, HWND, uint, IDirectSoundFullDuplex*, IDirectSoundCaptureBuffer8*, IDirectSoundBuffer8*, IUnknown);
HRESULT GetDeviceID(const(GUID)*, GUID*);
enum DIRECTSOUND_VERSION = 0x00000700;
enum _FACDS = 0x00000878;
enum CLSID_DirectSound = GUID(0x47d4d946, 0x62e8, 0x11cf, [0x93, 0xbc, 0x44, 0x45, 0x53, 0x54, 0x0, 0x0]);
enum CLSID_DirectSound8 = GUID(0x3901cc3f, 0x84b5, 0x4fa4, [0xba, 0x35, 0xaa, 0x81, 0x72, 0xb8, 0xa0, 0x9b]);
enum CLSID_DirectSoundCapture = GUID(0xb0210780, 0x89cd, 0x11d0, [0xaf, 0x8, 0x0, 0xa0, 0xc9, 0x25, 0xcd, 0x16]);
enum CLSID_DirectSoundCapture8 = GUID(0xe4bcac13, 0x7f99, 0x4908, [0x9a, 0x8e, 0x74, 0xe3, 0xbf, 0x24, 0xb6, 0xe1]);
enum CLSID_DirectSoundFullDuplex = GUID(0xfea4300c, 0x7959, 0x4147, [0xb2, 0x6a, 0x23, 0x77, 0xb9, 0xe7, 0xa9, 0x1d]);
enum DSDEVID_DefaultPlayback = GUID(0xdef00000, 0x9c6d, 0x47ed, [0xaa, 0xf1, 0x4d, 0xda, 0x8f, 0x2b, 0x5c, 0x3]);
enum DSDEVID_DefaultCapture = GUID(0xdef00001, 0x9c6d, 0x47ed, [0xaa, 0xf1, 0x4d, 0xda, 0x8f, 0x2b, 0x5c, 0x3]);
enum DSDEVID_DefaultVoicePlayback = GUID(0xdef00002, 0x9c6d, 0x47ed, [0xaa, 0xf1, 0x4d, 0xda, 0x8f, 0x2b, 0x5c, 0x3]);
enum DSDEVID_DefaultVoiceCapture = GUID(0xdef00003, 0x9c6d, 0x47ed, [0xaa, 0xf1, 0x4d, 0xda, 0x8f, 0x2b, 0x5c, 0x3]);
enum DSFX_LOCHARDWARE = 0x00000001;
enum DSFX_LOCSOFTWARE = 0x00000002;
enum DSCFX_LOCHARDWARE = 0x00000001;
enum DSCFX_LOCSOFTWARE = 0x00000002;
enum DSCFXR_LOCHARDWARE = 0x00000010;
enum DSCFXR_LOCSOFTWARE = 0x00000020;
enum GUID_All_Objects = GUID(0xaa114de5, 0xc262, 0x4169, [0xa1, 0xc8, 0x23, 0xd6, 0x98, 0xcc, 0x73, 0xb5]);
enum KSPROPERTY_SUPPORT_GET = 0x00000001;
enum KSPROPERTY_SUPPORT_SET = 0x00000002;
enum DSFXGARGLE_WAVE_TRIANGLE = 0x00000000;
enum DSFXGARGLE_WAVE_SQUARE = 0x00000001;
enum DSFXGARGLE_RATEHZ_MIN = 0x00000001;
enum DSFXGARGLE_RATEHZ_MAX = 0x000003e8;
enum DSFXCHORUS_WAVE_TRIANGLE = 0x00000000;
enum DSFXCHORUS_WAVE_SIN = 0x00000001;
enum DSFXCHORUS_WETDRYMIX_MIN = 0.000000;
enum DSFXCHORUS_WETDRYMIX_MAX = 100.000000;
enum DSFXCHORUS_DEPTH_MIN = 0.000000;
enum DSFXCHORUS_DEPTH_MAX = 100.000000;
enum DSFXCHORUS_FEEDBACK_MIN = -99.000000;
enum DSFXCHORUS_FEEDBACK_MAX = 99.000000;
enum DSFXCHORUS_FREQUENCY_MIN = 0.000000;
enum DSFXCHORUS_FREQUENCY_MAX = 10.000000;
enum DSFXCHORUS_DELAY_MIN = 0.000000;
enum DSFXCHORUS_DELAY_MAX = 20.000000;
enum DSFXCHORUS_PHASE_MIN = 0x00000000;
enum DSFXCHORUS_PHASE_MAX = 0x00000004;
enum DSFXCHORUS_PHASE_NEG_180 = 0x00000000;
enum DSFXCHORUS_PHASE_NEG_90 = 0x00000001;
enum DSFXCHORUS_PHASE_ZERO = 0x00000002;
enum DSFXCHORUS_PHASE_90 = 0x00000003;
enum DSFXCHORUS_PHASE_180 = 0x00000004;
enum DSFXFLANGER_WAVE_TRIANGLE = 0x00000000;
enum DSFXFLANGER_WAVE_SIN = 0x00000001;
enum DSFXFLANGER_WETDRYMIX_MIN = 0.000000;
enum DSFXFLANGER_WETDRYMIX_MAX = 100.000000;
enum DSFXFLANGER_FREQUENCY_MIN = 0.000000;
enum DSFXFLANGER_FREQUENCY_MAX = 10.000000;
enum DSFXFLANGER_DEPTH_MIN = 0.000000;
enum DSFXFLANGER_DEPTH_MAX = 100.000000;
enum DSFXFLANGER_PHASE_MIN = 0x00000000;
enum DSFXFLANGER_PHASE_MAX = 0x00000004;
enum DSFXFLANGER_FEEDBACK_MIN = -99.000000;
enum DSFXFLANGER_FEEDBACK_MAX = 99.000000;
enum DSFXFLANGER_DELAY_MIN = 0.000000;
enum DSFXFLANGER_DELAY_MAX = 4.000000;
enum DSFXFLANGER_PHASE_NEG_180 = 0x00000000;
enum DSFXFLANGER_PHASE_NEG_90 = 0x00000001;
enum DSFXFLANGER_PHASE_ZERO = 0x00000002;
enum DSFXFLANGER_PHASE_90 = 0x00000003;
enum DSFXFLANGER_PHASE_180 = 0x00000004;
enum DSFXECHO_WETDRYMIX_MIN = 0.000000;
enum DSFXECHO_WETDRYMIX_MAX = 100.000000;
enum DSFXECHO_FEEDBACK_MIN = 0.000000;
enum DSFXECHO_FEEDBACK_MAX = 100.000000;
enum DSFXECHO_LEFTDELAY_MIN = 1.000000;
enum DSFXECHO_LEFTDELAY_MAX = 2000.000000;
enum DSFXECHO_RIGHTDELAY_MIN = 1.000000;
enum DSFXECHO_RIGHTDELAY_MAX = 2000.000000;
enum DSFXECHO_PANDELAY_MIN = 0x00000000;
enum DSFXECHO_PANDELAY_MAX = 0x00000001;
enum DSFXDISTORTION_GAIN_MIN = -60.000000;
enum DSFXDISTORTION_GAIN_MAX = 0.000000;
enum DSFXDISTORTION_EDGE_MIN = 0.000000;
enum DSFXDISTORTION_EDGE_MAX = 100.000000;
enum DSFXDISTORTION_POSTEQCENTERFREQUENCY_MIN = 100.000000;
enum DSFXDISTORTION_POSTEQCENTERFREQUENCY_MAX = 8000.000000;
enum DSFXDISTORTION_POSTEQBANDWIDTH_MIN = 100.000000;
enum DSFXDISTORTION_POSTEQBANDWIDTH_MAX = 8000.000000;
enum DSFXDISTORTION_PRELOWPASSCUTOFF_MIN = 100.000000;
enum DSFXDISTORTION_PRELOWPASSCUTOFF_MAX = 8000.000000;
enum DSFXCOMPRESSOR_GAIN_MIN = -60.000000;
enum DSFXCOMPRESSOR_GAIN_MAX = 60.000000;
enum DSFXCOMPRESSOR_ATTACK_MIN = 0.010000;
enum DSFXCOMPRESSOR_ATTACK_MAX = 500.000000;
enum DSFXCOMPRESSOR_RELEASE_MIN = 50.000000;
enum DSFXCOMPRESSOR_RELEASE_MAX = 3000.000000;
enum DSFXCOMPRESSOR_THRESHOLD_MIN = -60.000000;
enum DSFXCOMPRESSOR_THRESHOLD_MAX = 0.000000;
enum DSFXCOMPRESSOR_RATIO_MIN = 1.000000;
enum DSFXCOMPRESSOR_RATIO_MAX = 100.000000;
enum DSFXCOMPRESSOR_PREDELAY_MIN = 0.000000;
enum DSFXCOMPRESSOR_PREDELAY_MAX = 4.000000;
enum DSFXPARAMEQ_CENTER_MIN = 80.000000;
enum DSFXPARAMEQ_CENTER_MAX = 16000.000000;
enum DSFXPARAMEQ_BANDWIDTH_MIN = 1.000000;
enum DSFXPARAMEQ_BANDWIDTH_MAX = 36.000000;
enum DSFXPARAMEQ_GAIN_MIN = -15.000000;
enum DSFXPARAMEQ_GAIN_MAX = 15.000000;
enum DSFX_I3DL2REVERB_ROOM_MIN = 0xffffffffffffd8f0;
enum DSFX_I3DL2REVERB_ROOM_MAX = 0x00000000;
enum DSFX_I3DL2REVERB_ROOM_DEFAULT = 0xfffffffffffffc18;
enum DSFX_I3DL2REVERB_ROOMHF_MIN = 0xffffffffffffd8f0;
enum DSFX_I3DL2REVERB_ROOMHF_MAX = 0x00000000;
enum DSFX_I3DL2REVERB_ROOMHF_DEFAULT = 0xffffffffffffff9c;
enum DSFX_I3DL2REVERB_ROOMROLLOFFFACTOR_MIN = 0.000000;
enum DSFX_I3DL2REVERB_ROOMROLLOFFFACTOR_MAX = 10.000000;
enum DSFX_I3DL2REVERB_ROOMROLLOFFFACTOR_DEFAULT = 0.000000;
enum DSFX_I3DL2REVERB_DECAYTIME_MIN = 0.100000;
enum DSFX_I3DL2REVERB_DECAYTIME_MAX = 20.000000;
enum DSFX_I3DL2REVERB_DECAYTIME_DEFAULT = 1.490000;
enum DSFX_I3DL2REVERB_DECAYHFRATIO_MIN = 0.100000;
enum DSFX_I3DL2REVERB_DECAYHFRATIO_MAX = 2.000000;
enum DSFX_I3DL2REVERB_DECAYHFRATIO_DEFAULT = 0.830000;
enum DSFX_I3DL2REVERB_REFLECTIONS_MIN = 0xffffffffffffd8f0;
enum DSFX_I3DL2REVERB_REFLECTIONS_MAX = 0x000003e8;
enum DSFX_I3DL2REVERB_REFLECTIONS_DEFAULT = 0xfffffffffffff5d6;
enum DSFX_I3DL2REVERB_REFLECTIONSDELAY_MIN = 0.000000;
enum DSFX_I3DL2REVERB_REFLECTIONSDELAY_MAX = 0.300000;
enum DSFX_I3DL2REVERB_REFLECTIONSDELAY_DEFAULT = 0.007000;
enum DSFX_I3DL2REVERB_REVERB_MIN = 0xffffffffffffd8f0;
enum DSFX_I3DL2REVERB_REVERB_MAX = 0x000007d0;
enum DSFX_I3DL2REVERB_REVERB_DEFAULT = 0x000000c8;
enum DSFX_I3DL2REVERB_REVERBDELAY_MIN = 0.000000;
enum DSFX_I3DL2REVERB_REVERBDELAY_MAX = 0.100000;
enum DSFX_I3DL2REVERB_REVERBDELAY_DEFAULT = 0.011000;
enum DSFX_I3DL2REVERB_DIFFUSION_MIN = 0.000000;
enum DSFX_I3DL2REVERB_DIFFUSION_MAX = 100.000000;
enum DSFX_I3DL2REVERB_DIFFUSION_DEFAULT = 100.000000;
enum DSFX_I3DL2REVERB_DENSITY_MIN = 0.000000;
enum DSFX_I3DL2REVERB_DENSITY_MAX = 100.000000;
enum DSFX_I3DL2REVERB_DENSITY_DEFAULT = 100.000000;
enum DSFX_I3DL2REVERB_HFREFERENCE_MIN = 20.000000;
enum DSFX_I3DL2REVERB_HFREFERENCE_MAX = 20000.000000;
enum DSFX_I3DL2REVERB_HFREFERENCE_DEFAULT = 5000.000000;
enum DSFX_I3DL2REVERB_QUALITY_MIN = 0x00000000;
enum DSFX_I3DL2REVERB_QUALITY_MAX = 0x00000003;
enum DSFX_I3DL2REVERB_QUALITY_DEFAULT = 0x00000002;
enum DSFX_WAVESREVERB_INGAIN_MIN = -96.000000;
enum DSFX_WAVESREVERB_INGAIN_MAX = 0.000000;
enum DSFX_WAVESREVERB_INGAIN_DEFAULT = 0.000000;
enum DSFX_WAVESREVERB_REVERBMIX_MIN = -96.000000;
enum DSFX_WAVESREVERB_REVERBMIX_MAX = 0.000000;
enum DSFX_WAVESREVERB_REVERBMIX_DEFAULT = 0.000000;
enum DSFX_WAVESREVERB_REVERBTIME_MIN = 0.001000;
enum DSFX_WAVESREVERB_REVERBTIME_MAX = 3000.000000;
enum DSFX_WAVESREVERB_REVERBTIME_DEFAULT = 1000.000000;
enum DSFX_WAVESREVERB_HIGHFREQRTRATIO_MIN = 0.001000;
enum DSFX_WAVESREVERB_HIGHFREQRTRATIO_MAX = 0.999000;
enum DSFX_WAVESREVERB_HIGHFREQRTRATIO_DEFAULT = 0.001000;
enum DSCFX_AEC_MODE_PASS_THROUGH = 0x00000000;
enum DSCFX_AEC_MODE_HALF_DUPLEX = 0x00000001;
enum DSCFX_AEC_MODE_FULL_DUPLEX = 0x00000002;
enum DSCFX_AEC_STATUS_HISTORY_UNINITIALIZED = 0x00000000;
enum DSCFX_AEC_STATUS_HISTORY_CONTINUOUSLY_CONVERGED = 0x00000001;
enum DSCFX_AEC_STATUS_HISTORY_PREVIOUSLY_DIVERGED = 0x00000002;
enum DSCFX_AEC_STATUS_CURRENTLY_CONVERGED = 0x00000008;
enum DS_NO_VIRTUALIZATION = 0x0878000a;
enum DSCAPS_PRIMARYMONO = 0x00000001;
enum DSCAPS_PRIMARYSTEREO = 0x00000002;
enum DSCAPS_PRIMARY8BIT = 0x00000004;
enum DSCAPS_PRIMARY16BIT = 0x00000008;
enum DSCAPS_CONTINUOUSRATE = 0x00000010;
enum DSCAPS_EMULDRIVER = 0x00000020;
enum DSCAPS_CERTIFIED = 0x00000040;
enum DSCAPS_SECONDARYMONO = 0x00000100;
enum DSCAPS_SECONDARYSTEREO = 0x00000200;
enum DSCAPS_SECONDARY8BIT = 0x00000400;
enum DSCAPS_SECONDARY16BIT = 0x00000800;
enum DSSCL_NORMAL = 0x00000001;
enum DSSCL_PRIORITY = 0x00000002;
enum DSSCL_EXCLUSIVE = 0x00000003;
enum DSSCL_WRITEPRIMARY = 0x00000004;
enum DSSPEAKER_DIRECTOUT = 0x00000000;
enum DSSPEAKER_HEADPHONE = 0x00000001;
enum DSSPEAKER_MONO = 0x00000002;
enum DSSPEAKER_QUAD = 0x00000003;
enum DSSPEAKER_STEREO = 0x00000004;
enum DSSPEAKER_SURROUND = 0x00000005;
enum DSSPEAKER_5POINT1 = 0x00000006;
enum DSSPEAKER_7POINT1 = 0x00000007;
enum DSSPEAKER_7POINT1_SURROUND = 0x00000008;
enum DSSPEAKER_5POINT1_SURROUND = 0x00000009;
enum DSSPEAKER_7POINT1_WIDE = 0x00000007;
enum DSSPEAKER_5POINT1_BACK = 0x00000006;
enum DSSPEAKER_GEOMETRY_MIN = 0x00000005;
enum DSSPEAKER_GEOMETRY_NARROW = 0x0000000a;
enum DSSPEAKER_GEOMETRY_WIDE = 0x00000014;
enum DSSPEAKER_GEOMETRY_MAX = 0x000000b4;
enum DSBCAPS_PRIMARYBUFFER = 0x00000001;
enum DSBCAPS_STATIC = 0x00000002;
enum DSBCAPS_LOCHARDWARE = 0x00000004;
enum DSBCAPS_LOCSOFTWARE = 0x00000008;
enum DSBCAPS_CTRL3D = 0x00000010;
enum DSBCAPS_CTRLFREQUENCY = 0x00000020;
enum DSBCAPS_CTRLPAN = 0x00000040;
enum DSBCAPS_CTRLVOLUME = 0x00000080;
enum DSBCAPS_CTRLPOSITIONNOTIFY = 0x00000100;
enum DSBCAPS_CTRLFX = 0x00000200;
enum DSBCAPS_STICKYFOCUS = 0x00004000;
enum DSBCAPS_GLOBALFOCUS = 0x00008000;
enum DSBCAPS_GETCURRENTPOSITION2 = 0x00010000;
enum DSBCAPS_MUTE3DATMAXDISTANCE = 0x00020000;
enum DSBCAPS_LOCDEFER = 0x00040000;
enum DSBCAPS_TRUEPLAYPOSITION = 0x00080000;
enum DSBPLAY_LOOPING = 0x00000001;
enum DSBPLAY_LOCHARDWARE = 0x00000002;
enum DSBPLAY_LOCSOFTWARE = 0x00000004;
enum DSBPLAY_TERMINATEBY_TIME = 0x00000008;
enum DSBPLAY_TERMINATEBY_DISTANCE = 0x0000000000000010;
enum DSBPLAY_TERMINATEBY_PRIORITY = 0x0000000000000020;
enum DSBSTATUS_PLAYING = 0x00000001;
enum DSBSTATUS_BUFFERLOST = 0x00000002;
enum DSBSTATUS_LOOPING = 0x00000004;
enum DSBSTATUS_LOCHARDWARE = 0x00000008;
enum DSBSTATUS_LOCSOFTWARE = 0x00000010;
enum DSBSTATUS_TERMINATED = 0x00000020;
enum DSBLOCK_FROMWRITECURSOR = 0x00000001;
enum DSBLOCK_ENTIREBUFFER = 0x00000002;
enum DSBFREQUENCY_ORIGINAL = 0x00000000;
enum DSBFREQUENCY_MIN = 0x00000064;
enum DSBFREQUENCY_MAX = 0x00030d40;
enum DSBPAN_LEFT = 0xffffffffffffd8f0;
enum DSBPAN_CENTER = 0x00000000;
enum DSBPAN_RIGHT = 0x00002710;
enum DSBVOLUME_MIN = 0xffffffffffffd8f0;
enum DSBVOLUME_MAX = 0x00000000;
enum DSBSIZE_MIN = 0x00000004;
enum DSBSIZE_MAX = 0x0fffffff;
enum DSBSIZE_FX_MIN = 0x00000096;
enum DSBNOTIFICATIONS_MAX = 0x000186a0;
enum DS3DMODE_NORMAL = 0x00000000;
enum DS3DMODE_HEADRELATIVE = 0x00000001;
enum DS3DMODE_DISABLE = 0x00000002;
enum DS3D_IMMEDIATE = 0x00000000;
enum DS3D_DEFERRED = 0x00000001;
enum DS3D_DEFAULTDISTANCEFACTOR = 1.000000;
enum DS3D_MINROLLOFFFACTOR = 0.000000;
enum DS3D_MAXROLLOFFFACTOR = 10.000000;
enum DS3D_DEFAULTROLLOFFFACTOR = 1.000000;
enum DS3D_MINDOPPLERFACTOR = 0.000000;
enum DS3D_MAXDOPPLERFACTOR = 10.000000;
enum DS3D_DEFAULTDOPPLERFACTOR = 1.000000;
enum DS3D_DEFAULTMINDISTANCE = 1.000000;
enum DS3D_DEFAULTMAXDISTANCE = 1000000000.000000;
enum DS3D_MINCONEANGLE = 0x00000000;
enum DS3D_MAXCONEANGLE = 0x00000168;
enum DS3D_DEFAULTCONEANGLE = 0x00000168;
enum DS3D_DEFAULTCONEOUTSIDEVOLUME = 0x00000000;
enum DSCCAPS_EMULDRIVER = 0x00000020;
enum DSCCAPS_CERTIFIED = 0x00000040;
enum DSCCAPS_MULTIPLECAPTURE = 0x00000001;
enum DSCBCAPS_WAVEMAPPED = 0x80000000;
enum DSCBCAPS_CTRLFX = 0x00000200;
enum DSCBLOCK_ENTIREBUFFER = 0x00000001;
enum DSCBSTATUS_CAPTURING = 0x00000001;
enum DSCBSTATUS_LOOPING = 0x00000002;
enum DSCBSTART_LOOPING = 0x00000001;
enum DSBPN_OFFSETSTOP = 0xffffffff;
enum DS_CERTIFIED = 0x00000000;
enum DS_UNCERTIFIED = 0x00000001;
enum DS3DALG_NO_VIRTUALIZATION = GUID(0xc241333f, 0x1c1b, 0x11d2, [0x94, 0xf5, 0x0, 0xc0, 0x4f, 0xc2, 0x8a, 0xca]);
enum DS3DALG_HRTF_FULL = GUID(0xc2413340, 0x1c1b, 0x11d2, [0x94, 0xf5, 0x0, 0xc0, 0x4f, 0xc2, 0x8a, 0xca]);
enum DS3DALG_HRTF_LIGHT = GUID(0xc2413342, 0x1c1b, 0x11d2, [0x94, 0xf5, 0x0, 0xc0, 0x4f, 0xc2, 0x8a, 0xca]);
enum GUID_DSFX_STANDARD_GARGLE = GUID(0xdafd8210, 0x5711, 0x4b91, [0x9f, 0xe3, 0xf7, 0x5b, 0x7a, 0xe2, 0x79, 0xbf]);
enum GUID_DSFX_STANDARD_CHORUS = GUID(0xefe6629c, 0x81f7, 0x4281, [0xbd, 0x91, 0xc9, 0xd6, 0x4, 0xa9, 0x5a, 0xf6]);
enum GUID_DSFX_STANDARD_FLANGER = GUID(0xefca3d92, 0xdfd8, 0x4672, [0xa6, 0x3, 0x74, 0x20, 0x89, 0x4b, 0xad, 0x98]);
enum GUID_DSFX_STANDARD_ECHO = GUID(0xef3e932c, 0xd40b, 0x4f51, [0x8c, 0xcf, 0x3f, 0x98, 0xf1, 0xb2, 0x9d, 0x5d]);
enum GUID_DSFX_STANDARD_DISTORTION = GUID(0xef114c90, 0xcd1d, 0x484e, [0x96, 0xe5, 0x9, 0xcf, 0xaf, 0x91, 0x2a, 0x21]);
enum GUID_DSFX_STANDARD_COMPRESSOR = GUID(0xef011f79, 0x4000, 0x406d, [0x87, 0xaf, 0xbf, 0xfb, 0x3f, 0xc3, 0x9d, 0x57]);
enum GUID_DSFX_STANDARD_PARAMEQ = GUID(0x120ced89, 0x3bf4, 0x4173, [0xa1, 0x32, 0x3c, 0xb4, 0x6, 0xcf, 0x32, 0x31]);
enum GUID_DSFX_STANDARD_I3DL2REVERB = GUID(0xef985e71, 0xd5c7, 0x42d4, [0xba, 0x4d, 0x2d, 0x7, 0x3e, 0x2e, 0x96, 0xf4]);
enum GUID_DSFX_WAVES_REVERB = GUID(0x87fc0268, 0x9a55, 0x4360, [0x95, 0xaa, 0x0, 0x4a, 0x1d, 0x9d, 0xe2, 0x6c]);
enum GUID_DSCFX_CLASS_AEC = GUID(0xbf963d80, 0xc559, 0x11d0, [0x8a, 0x2b, 0x0, 0xa0, 0xc9, 0x25, 0x5a, 0xc1]);
enum GUID_DSCFX_MS_AEC = GUID(0xcdebb919, 0x379a, 0x488a, [0x87, 0x65, 0xf5, 0x3c, 0xfd, 0x36, 0xde, 0x40]);
enum GUID_DSCFX_SYSTEM_AEC = GUID(0x1c22c56d, 0x9879, 0x4f5b, [0xa3, 0x89, 0x27, 0x99, 0x6d, 0xdc, 0x28, 0x10]);
enum GUID_DSCFX_CLASS_NS = GUID(0xe07f903f, 0x62fd, 0x4e60, [0x8c, 0xdd, 0xde, 0xa7, 0x23, 0x66, 0x65, 0xb5]);
enum GUID_DSCFX_MS_NS = GUID(0x11c5c73b, 0x66e9, 0x4ba1, [0xa0, 0xba, 0xe8, 0x14, 0xc6, 0xee, 0xd9, 0x2d]);
enum GUID_DSCFX_SYSTEM_NS = GUID(0x5ab0882e, 0x7274, 0x4516, [0x87, 0x7d, 0x4e, 0xee, 0x99, 0xba, 0x4f, 0xd0]);
enum DSFXR_PRESENT = 0x00000000;
enum DSFXR_LOCHARDWARE = 0x00000001;
enum DSFXR_LOCSOFTWARE = 0x00000002;
enum DSFXR_UNALLOCATED = 0x00000003;
enum DSFXR_FAILED = 0x00000004;
enum DSFXR_UNKNOWN = 0x00000005;
enum DSFXR_SENDLOOP = 0x00000006;
enum DSFX_I3DL2_MATERIAL_PRESET_SINGLEWINDOW = 0x00000000;
enum DSFX_I3DL2_MATERIAL_PRESET_DOUBLEWINDOW = 0x00000001;
enum DSFX_I3DL2_MATERIAL_PRESET_THINDOOR = 0x00000002;
enum DSFX_I3DL2_MATERIAL_PRESET_THICKDOOR = 0x00000003;
enum DSFX_I3DL2_MATERIAL_PRESET_WOODWALL = 0x00000004;
enum DSFX_I3DL2_MATERIAL_PRESET_BRICKWALL = 0x00000005;
enum DSFX_I3DL2_MATERIAL_PRESET_STONEWALL = 0x00000006;
enum DSFX_I3DL2_MATERIAL_PRESET_CURTAIN = 0x00000007;
enum DSFX_I3DL2_ENVIRONMENT_PRESET_DEFAULT = 0x00000000;
enum DSFX_I3DL2_ENVIRONMENT_PRESET_GENERIC = 0x00000001;
enum DSFX_I3DL2_ENVIRONMENT_PRESET_PADDEDCELL = 0x00000002;
enum DSFX_I3DL2_ENVIRONMENT_PRESET_ROOM = 0x00000003;
enum DSFX_I3DL2_ENVIRONMENT_PRESET_BATHROOM = 0x00000004;
enum DSFX_I3DL2_ENVIRONMENT_PRESET_LIVINGROOM = 0x00000005;
enum DSFX_I3DL2_ENVIRONMENT_PRESET_STONEROOM = 0x00000006;
enum DSFX_I3DL2_ENVIRONMENT_PRESET_AUDITORIUM = 0x00000007;
enum DSFX_I3DL2_ENVIRONMENT_PRESET_CONCERTHALL = 0x00000008;
enum DSFX_I3DL2_ENVIRONMENT_PRESET_CAVE = 0x00000009;
enum DSFX_I3DL2_ENVIRONMENT_PRESET_ARENA = 0x0000000a;
enum DSFX_I3DL2_ENVIRONMENT_PRESET_HANGAR = 0x0000000b;
enum DSFX_I3DL2_ENVIRONMENT_PRESET_CARPETEDHALLWAY = 0x0000000c;
enum DSFX_I3DL2_ENVIRONMENT_PRESET_HALLWAY = 0x0000000d;
enum DSFX_I3DL2_ENVIRONMENT_PRESET_STONECORRIDOR = 0x0000000e;
enum DSFX_I3DL2_ENVIRONMENT_PRESET_ALLEY = 0x0000000f;
enum DSFX_I3DL2_ENVIRONMENT_PRESET_FOREST = 0x00000010;
enum DSFX_I3DL2_ENVIRONMENT_PRESET_CITY = 0x00000011;
enum DSFX_I3DL2_ENVIRONMENT_PRESET_MOUNTAINS = 0x00000012;
enum DSFX_I3DL2_ENVIRONMENT_PRESET_QUARRY = 0x00000013;
enum DSFX_I3DL2_ENVIRONMENT_PRESET_PLAIN = 0x00000014;
enum DSFX_I3DL2_ENVIRONMENT_PRESET_PARKINGLOT = 0x00000015;
enum DSFX_I3DL2_ENVIRONMENT_PRESET_SEWERPIPE = 0x00000016;
enum DSFX_I3DL2_ENVIRONMENT_PRESET_UNDERWATER = 0x00000017;
enum DSFX_I3DL2_ENVIRONMENT_PRESET_SMALLROOM = 0x00000018;
enum DSFX_I3DL2_ENVIRONMENT_PRESET_MEDIUMROOM = 0x00000019;
enum DSFX_I3DL2_ENVIRONMENT_PRESET_LARGEROOM = 0x0000001a;
enum DSFX_I3DL2_ENVIRONMENT_PRESET_MEDIUMHALL = 0x0000001b;
enum DSFX_I3DL2_ENVIRONMENT_PRESET_LARGEHALL = 0x0000001c;
enum DSFX_I3DL2_ENVIRONMENT_PRESET_PLATE = 0x0000001d;
struct DSCAPS
{
    uint dwSize;
    uint dwFlags;
    uint dwMinSecondarySampleRate;
    uint dwMaxSecondarySampleRate;
    uint dwPrimaryBuffers;
    uint dwMaxHwMixingAllBuffers;
    uint dwMaxHwMixingStaticBuffers;
    uint dwMaxHwMixingStreamingBuffers;
    uint dwFreeHwMixingAllBuffers;
    uint dwFreeHwMixingStaticBuffers;
    uint dwFreeHwMixingStreamingBuffers;
    uint dwMaxHw3DAllBuffers;
    uint dwMaxHw3DStaticBuffers;
    uint dwMaxHw3DStreamingBuffers;
    uint dwFreeHw3DAllBuffers;
    uint dwFreeHw3DStaticBuffers;
    uint dwFreeHw3DStreamingBuffers;
    uint dwTotalHwMemBytes;
    uint dwFreeHwMemBytes;
    uint dwMaxContigFreeHwMemBytes;
    uint dwUnlockTransferRateHwBuffers;
    uint dwPlayCpuOverheadSwBuffers;
    uint dwReserved1;
    uint dwReserved2;
}
struct DSBCAPS
{
    uint dwSize;
    uint dwFlags;
    uint dwBufferBytes;
    uint dwUnlockTransferRate;
    uint dwPlayCpuOverhead;
}
struct DSEFFECTDESC
{
    uint dwSize;
    uint dwFlags;
    GUID guidDSFXClass;
    ulong dwReserved1;
    ulong dwReserved2;
}
struct DSCEFFECTDESC
{
    uint dwSize;
    uint dwFlags;
    GUID guidDSCFXClass;
    GUID guidDSCFXInstance;
    uint dwReserved1;
    uint dwReserved2;
}
struct DSBUFFERDESC
{
    uint dwSize;
    uint dwFlags;
    uint dwBufferBytes;
    uint dwReserved;
    WAVEFORMATEX* lpwfxFormat;
    GUID guid3DAlgorithm;
}
struct DSBUFFERDESC1
{
    uint dwSize;
    uint dwFlags;
    uint dwBufferBytes;
    uint dwReserved;
    WAVEFORMATEX* lpwfxFormat;
}
struct DS3DBUFFER
{
    uint dwSize;
    D3DVECTOR vPosition;
    D3DVECTOR vVelocity;
    uint dwInsideConeAngle;
    uint dwOutsideConeAngle;
    D3DVECTOR vConeOrientation;
    int lConeOutsideVolume;
    float flMinDistance;
    float flMaxDistance;
    uint dwMode;
}
struct DS3DLISTENER
{
    uint dwSize;
    D3DVECTOR vPosition;
    D3DVECTOR vVelocity;
    D3DVECTOR vOrientFront;
    D3DVECTOR vOrientTop;
    float flDistanceFactor;
    float flRolloffFactor;
    float flDopplerFactor;
}
struct DSCCAPS
{
    uint dwSize;
    uint dwFlags;
    uint dwFormats;
    uint dwChannels;
}
struct DSCBUFFERDESC1
{
    uint dwSize;
    uint dwFlags;
    uint dwBufferBytes;
    uint dwReserved;
    WAVEFORMATEX* lpwfxFormat;
}
struct DSCBUFFERDESC
{
    uint dwSize;
    uint dwFlags;
    uint dwBufferBytes;
    uint dwReserved;
    WAVEFORMATEX* lpwfxFormat;
    uint dwFXCount;
    DSCEFFECTDESC* lpDSCFXDesc;
}
struct DSCBCAPS
{
    uint dwSize;
    uint dwFlags;
    uint dwBufferBytes;
    uint dwReserved;
}
struct DSBPOSITIONNOTIFY
{
    uint dwOffset;
    HANDLE hEventNotify;
}
alias LPDSENUMCALLBACKA = BOOL function(GUID*, const(char)*, const(char)*, void*);
alias LPDSENUMCALLBACKW = BOOL function(GUID*, const(wchar)*, const(wchar)*, void*);
enum IID_IDirectSound = GUID(0x279afa83, 0x4981, 0x11ce, [0xa5, 0x21, 0x0, 0x20, 0xaf, 0xb, 0xe5, 0x60]);
interface IDirectSound : IUnknown
{
    HRESULT CreateSoundBuffer(DSBUFFERDESC*, IDirectSoundBuffer*, IUnknown);
    HRESULT GetCaps(DSCAPS*);
    HRESULT DuplicateSoundBuffer(IDirectSoundBuffer, IDirectSoundBuffer*);
    HRESULT SetCooperativeLevel(HWND, uint);
    HRESULT Compact();
    HRESULT GetSpeakerConfig(uint*);
    HRESULT SetSpeakerConfig(uint);
    HRESULT Initialize(const(GUID)*);
}
enum IID_IDirectSound8 = GUID(0xc50a7e93, 0xf395, 0x4834, [0x9e, 0xf6, 0x7f, 0xa9, 0x9d, 0xe5, 0x9, 0x66]);
interface IDirectSound8 : IDirectSound
{
    HRESULT VerifyCertification(uint*);
}
enum IID_IDirectSoundBuffer = GUID(0x279afa85, 0x4981, 0x11ce, [0xa5, 0x21, 0x0, 0x20, 0xaf, 0xb, 0xe5, 0x60]);
interface IDirectSoundBuffer : IUnknown
{
    HRESULT GetCaps(DSBCAPS*);
    HRESULT GetCurrentPosition(uint*, uint*);
    HRESULT GetFormat(WAVEFORMATEX*, uint, uint*);
    HRESULT GetVolume(int*);
    HRESULT GetPan(int*);
    HRESULT GetFrequency(uint*);
    HRESULT GetStatus(uint*);
    HRESULT Initialize(IDirectSound, DSBUFFERDESC*);
    HRESULT Lock(uint, uint, void**, uint*, void**, uint*, uint);
    HRESULT Play(uint, uint, uint);
    HRESULT SetCurrentPosition(uint);
    HRESULT SetFormat(WAVEFORMATEX*);
    HRESULT SetVolume(int);
    HRESULT SetPan(int);
    HRESULT SetFrequency(uint);
    HRESULT Stop();
    HRESULT Unlock(void*, uint, void*, uint);
    HRESULT Restore();
}
enum IID_IDirectSoundBuffer8 = GUID(0x6825a449, 0x7524, 0x4d82, [0x92, 0xf, 0x50, 0xe3, 0x6a, 0xb3, 0xab, 0x1e]);
interface IDirectSoundBuffer8 : IDirectSoundBuffer
{
    HRESULT SetFX(uint, DSEFFECTDESC*, uint*);
    HRESULT AcquireResources(uint, uint, uint*);
    HRESULT GetObjectInPath(const(GUID)*, uint, const(GUID)*, void**);
}
enum IID_IDirectSound3DListener = GUID(0x279afa84, 0x4981, 0x11ce, [0xa5, 0x21, 0x0, 0x20, 0xaf, 0xb, 0xe5, 0x60]);
interface IDirectSound3DListener : IUnknown
{
    HRESULT GetAllParameters(DS3DLISTENER*);
    HRESULT GetDistanceFactor(float*);
    HRESULT GetDopplerFactor(float*);
    HRESULT GetOrientation(D3DVECTOR*, D3DVECTOR*);
    HRESULT GetPosition(D3DVECTOR*);
    HRESULT GetRolloffFactor(float*);
    HRESULT GetVelocity(D3DVECTOR*);
    HRESULT SetAllParameters(DS3DLISTENER*, uint);
    HRESULT SetDistanceFactor(float, uint);
    HRESULT SetDopplerFactor(float, uint);
    HRESULT SetOrientation(float, float, float, float, float, float, uint);
    HRESULT SetPosition(float, float, float, uint);
    HRESULT SetRolloffFactor(float, uint);
    HRESULT SetVelocity(float, float, float, uint);
    HRESULT CommitDeferredSettings();
}
enum IID_IDirectSound3DBuffer = GUID(0x279afa86, 0x4981, 0x11ce, [0xa5, 0x21, 0x0, 0x20, 0xaf, 0xb, 0xe5, 0x60]);
interface IDirectSound3DBuffer : IUnknown
{
    HRESULT GetAllParameters(DS3DBUFFER*);
    HRESULT GetConeAngles(uint*, uint*);
    HRESULT GetConeOrientation(D3DVECTOR*);
    HRESULT GetConeOutsideVolume(int*);
    HRESULT GetMaxDistance(float*);
    HRESULT GetMinDistance(float*);
    HRESULT GetMode(uint*);
    HRESULT GetPosition(D3DVECTOR*);
    HRESULT GetVelocity(D3DVECTOR*);
    HRESULT SetAllParameters(DS3DBUFFER*, uint);
    HRESULT SetConeAngles(uint, uint, uint);
    HRESULT SetConeOrientation(float, float, float, uint);
    HRESULT SetConeOutsideVolume(int, uint);
    HRESULT SetMaxDistance(float, uint);
    HRESULT SetMinDistance(float, uint);
    HRESULT SetMode(uint, uint);
    HRESULT SetPosition(float, float, float, uint);
    HRESULT SetVelocity(float, float, float, uint);
}
enum IID_IDirectSoundCapture = GUID(0xb0210781, 0x89cd, 0x11d0, [0xaf, 0x8, 0x0, 0xa0, 0xc9, 0x25, 0xcd, 0x16]);
interface IDirectSoundCapture : IUnknown
{
    HRESULT CreateCaptureBuffer(DSCBUFFERDESC*, IDirectSoundCaptureBuffer*, IUnknown);
    HRESULT GetCaps(DSCCAPS*);
    HRESULT Initialize(const(GUID)*);
}
enum IID_IDirectSoundCaptureBuffer = GUID(0xb0210782, 0x89cd, 0x11d0, [0xaf, 0x8, 0x0, 0xa0, 0xc9, 0x25, 0xcd, 0x16]);
interface IDirectSoundCaptureBuffer : IUnknown
{
    HRESULT GetCaps(DSCBCAPS*);
    HRESULT GetCurrentPosition(uint*, uint*);
    HRESULT GetFormat(WAVEFORMATEX*, uint, uint*);
    HRESULT GetStatus(uint*);
    HRESULT Initialize(IDirectSoundCapture, DSCBUFFERDESC*);
    HRESULT Lock(uint, uint, void**, uint*, void**, uint*, uint);
    HRESULT Start(uint);
    HRESULT Stop();
    HRESULT Unlock(void*, uint, void*, uint);
}
enum IID_IDirectSoundCaptureBuffer8 = GUID(0x990df4, 0xdbb, 0x4872, [0x83, 0x3e, 0x6d, 0x30, 0x3e, 0x80, 0xae, 0xb6]);
interface IDirectSoundCaptureBuffer8 : IDirectSoundCaptureBuffer
{
    HRESULT GetObjectInPath(const(GUID)*, uint, const(GUID)*, void**);
    HRESULT GetFXStatus(uint, uint*);
}
enum IID_IDirectSoundNotify = GUID(0xb0210783, 0x89cd, 0x11d0, [0xaf, 0x8, 0x0, 0xa0, 0xc9, 0x25, 0xcd, 0x16]);
interface IDirectSoundNotify : IUnknown
{
    HRESULT SetNotificationPositions(uint, DSBPOSITIONNOTIFY*);
}
struct DSFXGargle
{
    uint dwRateHz;
    uint dwWaveShape;
}
enum IID_IDirectSoundFXGargle = GUID(0xd616f352, 0xd622, 0x11ce, [0xaa, 0xc5, 0x0, 0x20, 0xaf, 0xb, 0x99, 0xa3]);
interface IDirectSoundFXGargle : IUnknown
{
    HRESULT SetAllParameters(DSFXGargle*);
    HRESULT GetAllParameters(DSFXGargle*);
}
struct DSFXChorus
{
    float fWetDryMix;
    float fDepth;
    float fFeedback;
    float fFrequency;
    int lWaveform;
    float fDelay;
    int lPhase;
}
enum IID_IDirectSoundFXChorus = GUID(0x880842e3, 0x145f, 0x43e6, [0xa9, 0x34, 0xa7, 0x18, 0x6, 0xe5, 0x5, 0x47]);
interface IDirectSoundFXChorus : IUnknown
{
    HRESULT SetAllParameters(DSFXChorus*);
    HRESULT GetAllParameters(DSFXChorus*);
}
struct DSFXFlanger
{
    float fWetDryMix;
    float fDepth;
    float fFeedback;
    float fFrequency;
    int lWaveform;
    float fDelay;
    int lPhase;
}
enum IID_IDirectSoundFXFlanger = GUID(0x903e9878, 0x2c92, 0x4072, [0x9b, 0x2c, 0xea, 0x68, 0xf5, 0x39, 0x67, 0x83]);
interface IDirectSoundFXFlanger : IUnknown
{
    HRESULT SetAllParameters(DSFXFlanger*);
    HRESULT GetAllParameters(DSFXFlanger*);
}
struct DSFXEcho
{
    float fWetDryMix;
    float fFeedback;
    float fLeftDelay;
    float fRightDelay;
    int lPanDelay;
}
enum IID_IDirectSoundFXEcho = GUID(0x8bd28edf, 0x50db, 0x4e92, [0xa2, 0xbd, 0x44, 0x54, 0x88, 0xd1, 0xed, 0x42]);
interface IDirectSoundFXEcho : IUnknown
{
    HRESULT SetAllParameters(DSFXEcho*);
    HRESULT GetAllParameters(DSFXEcho*);
}
struct DSFXDistortion
{
    float fGain;
    float fEdge;
    float fPostEQCenterFrequency;
    float fPostEQBandwidth;
    float fPreLowpassCutoff;
}
enum IID_IDirectSoundFXDistortion = GUID(0x8ecf4326, 0x455f, 0x4d8b, [0xbd, 0xa9, 0x8d, 0x5d, 0x3e, 0x9e, 0x3e, 0xb]);
interface IDirectSoundFXDistortion : IUnknown
{
    HRESULT SetAllParameters(DSFXDistortion*);
    HRESULT GetAllParameters(DSFXDistortion*);
}
struct DSFXCompressor
{
    float fGain;
    float fAttack;
    float fRelease;
    float fThreshold;
    float fRatio;
    float fPredelay;
}
enum IID_IDirectSoundFXCompressor = GUID(0x4bbd1154, 0x62f6, 0x4e2c, [0xa1, 0x5c, 0xd3, 0xb6, 0xc4, 0x17, 0xf7, 0xa0]);
interface IDirectSoundFXCompressor : IUnknown
{
    HRESULT SetAllParameters(DSFXCompressor*);
    HRESULT GetAllParameters(DSFXCompressor*);
}
struct DSFXParamEq
{
    float fCenter;
    float fBandwidth;
    float fGain;
}
enum IID_IDirectSoundFXParamEq = GUID(0xc03ca9fe, 0xfe90, 0x4204, [0x80, 0x78, 0x82, 0x33, 0x4c, 0xd1, 0x77, 0xda]);
interface IDirectSoundFXParamEq : IUnknown
{
    HRESULT SetAllParameters(DSFXParamEq*);
    HRESULT GetAllParameters(DSFXParamEq*);
}
struct DSFXI3DL2Reverb
{
    int lRoom;
    int lRoomHF;
    float flRoomRolloffFactor;
    float flDecayTime;
    float flDecayHFRatio;
    int lReflections;
    float flReflectionsDelay;
    int lReverb;
    float flReverbDelay;
    float flDiffusion;
    float flDensity;
    float flHFReference;
}
enum IID_IDirectSoundFXI3DL2Reverb = GUID(0x4b166a6a, 0xd66, 0x43f3, [0x80, 0xe3, 0xee, 0x62, 0x80, 0xde, 0xe1, 0xa4]);
interface IDirectSoundFXI3DL2Reverb : IUnknown
{
    HRESULT SetAllParameters(DSFXI3DL2Reverb*);
    HRESULT GetAllParameters(DSFXI3DL2Reverb*);
    HRESULT SetPreset(uint);
    HRESULT GetPreset(uint*);
    HRESULT SetQuality(int);
    HRESULT GetQuality(int*);
}
struct DSFXWavesReverb
{
    float fInGain;
    float fReverbMix;
    float fReverbTime;
    float fHighFreqRTRatio;
}
enum IID_IDirectSoundFXWavesReverb = GUID(0x46858c3a, 0xdc6, 0x45e3, [0xb7, 0x60, 0xd4, 0xee, 0xf1, 0x6c, 0xb3, 0x25]);
interface IDirectSoundFXWavesReverb : IUnknown
{
    HRESULT SetAllParameters(DSFXWavesReverb*);
    HRESULT GetAllParameters(DSFXWavesReverb*);
}
struct DSCFXAec
{
    BOOL fEnable;
    BOOL fNoiseFill;
    uint dwMode;
}
enum IID_IDirectSoundCaptureFXAec = GUID(0xad74143d, 0x903d, 0x4ab7, [0x80, 0x66, 0x28, 0xd3, 0x63, 0x3, 0x6d, 0x65]);
interface IDirectSoundCaptureFXAec : IUnknown
{
    HRESULT SetAllParameters(DSCFXAec*);
    HRESULT GetAllParameters(DSCFXAec*);
    HRESULT GetStatus(uint*);
    HRESULT Reset();
}
struct DSCFXNoiseSuppress
{
    BOOL fEnable;
}
enum IID_IDirectSoundCaptureFXNoiseSuppress = GUID(0xed311e41, 0xfbae, 0x4175, [0x96, 0x25, 0xcd, 0x8, 0x54, 0xf6, 0x93, 0xca]);
interface IDirectSoundCaptureFXNoiseSuppress : IUnknown
{
    HRESULT SetAllParameters(DSCFXNoiseSuppress*);
    HRESULT GetAllParameters(DSCFXNoiseSuppress*);
    HRESULT Reset();
}
enum IID_IDirectSoundFullDuplex = GUID(0xedcb4c7a, 0xdaab, 0x4216, [0xa4, 0x2e, 0x6c, 0x50, 0x59, 0x6d, 0xdc, 0x1d]);
interface IDirectSoundFullDuplex : IUnknown
{
    HRESULT Initialize(const(GUID)*, const(GUID)*, DSCBUFFERDESC*, DSBUFFERDESC*, HWND, uint, IDirectSoundCaptureBuffer8*, IDirectSoundBuffer8*);
}
