module windows.win32.media;

import windows.win32.guid : GUID;
import windows.win32.foundation : HANDLE, HRESULT;
import windows.win32.media.multimedia : HDRVR;
import windows.win32.system.com : IUnknown;

version (Windows):
extern (Windows):

alias TIMECODE_SAMPLE_FLAGS = uint;
enum : uint
{
    ED_DEVCAP_TIMECODE_READ = 0x00001019,
    ED_DEVCAP_ATN_READ      = 0x000013b7,
    ED_DEVCAP_RTC_READ      = 0x000013ba,
}

uint timeGetSystemTime(MMTIME*, uint);
uint timeGetTime();
uint timeGetDevCaps(TIMECAPS*, uint);
uint timeBeginPeriod(uint);
uint timeEndPeriod(uint);
uint timeSetEvent(uint, uint, LPTIMECALLBACK, ulong, uint);
uint timeKillEvent(uint);
enum TIMERR_NOERROR = 0x00000000;
enum TIMERR_NOCANDO = 0x00000061;
enum TIMERR_STRUCT = 0x00000081;
enum MAXPNAMELEN = 0x00000020;
enum MAXERRORLENGTH = 0x00000100;
enum MM_MICROSOFT = 0x00000001;
enum MM_MIDI_MAPPER = 0x00000001;
enum MM_WAVE_MAPPER = 0x00000002;
enum MM_SNDBLST_MIDIOUT = 0x00000003;
enum MM_SNDBLST_MIDIIN = 0x00000004;
enum MM_SNDBLST_SYNTH = 0x00000005;
enum MM_SNDBLST_WAVEOUT = 0x00000006;
enum MM_SNDBLST_WAVEIN = 0x00000007;
enum MM_ADLIB = 0x00000009;
enum MM_MPU401_MIDIOUT = 0x0000000a;
enum MM_MPU401_MIDIIN = 0x0000000b;
enum MM_PC_JOYSTICK = 0x0000000c;
enum TIME_MS = 0x00000001;
enum TIME_SAMPLES = 0x00000002;
enum TIME_BYTES = 0x00000004;
enum TIME_SMPTE = 0x00000008;
enum TIME_MIDI = 0x00000010;
enum TIME_TICKS = 0x00000020;
enum MM_JOY1MOVE = 0x000003a0;
enum MM_JOY2MOVE = 0x000003a1;
enum MM_JOY1ZMOVE = 0x000003a2;
enum MM_JOY2ZMOVE = 0x000003a3;
enum MM_JOY1BUTTONDOWN = 0x000003b5;
enum MM_JOY2BUTTONDOWN = 0x000003b6;
enum MM_JOY1BUTTONUP = 0x000003b7;
enum MM_JOY2BUTTONUP = 0x000003b8;
enum MM_MCINOTIFY = 0x000003b9;
enum MM_WOM_OPEN = 0x000003bb;
enum MM_WOM_CLOSE = 0x000003bc;
enum MM_WOM_DONE = 0x000003bd;
enum MM_WIM_OPEN = 0x000003be;
enum MM_WIM_CLOSE = 0x000003bf;
enum MM_WIM_DATA = 0x000003c0;
enum MM_MIM_OPEN = 0x000003c1;
enum MM_MIM_CLOSE = 0x000003c2;
enum MM_MIM_DATA = 0x000003c3;
enum MM_MIM_LONGDATA = 0x000003c4;
enum MM_MIM_ERROR = 0x000003c5;
enum MM_MIM_LONGERROR = 0x000003c6;
enum MM_MOM_OPEN = 0x000003c7;
enum MM_MOM_CLOSE = 0x000003c8;
enum MM_MOM_DONE = 0x000003c9;
enum MM_DRVM_OPEN = 0x000003d0;
enum MM_DRVM_CLOSE = 0x000003d1;
enum MM_DRVM_DATA = 0x000003d2;
enum MM_DRVM_ERROR = 0x000003d3;
enum MM_STREAM_OPEN = 0x000003d4;
enum MM_STREAM_CLOSE = 0x000003d5;
enum MM_STREAM_DONE = 0x000003d6;
enum MM_STREAM_ERROR = 0x000003d7;
enum MM_MOM_POSITIONCB = 0x000003ca;
enum MM_MCISIGNAL = 0x000003cb;
enum MM_MIM_MOREDATA = 0x000003cc;
enum MM_MIXM_LINE_CHANGE = 0x000003d0;
enum MM_MIXM_CONTROL_CHANGE = 0x000003d1;
enum MMSYSERR_BASE = 0x00000000;
enum WAVERR_BASE = 0x00000020;
enum MIDIERR_BASE = 0x00000040;
enum TIMERR_BASE = 0x00000060;
enum JOYERR_BASE = 0x000000a0;
enum MCIERR_BASE = 0x00000100;
enum MIXERR_BASE = 0x00000400;
enum MCI_STRING_OFFSET = 0x00000200;
enum MCI_VD_OFFSET = 0x00000400;
enum MCI_CD_OFFSET = 0x00000440;
enum MCI_WAVE_OFFSET = 0x00000480;
enum MCI_SEQ_OFFSET = 0x000004c0;
enum MMSYSERR_NOERROR = 0x00000000;
enum MMSYSERR_ERROR = 0x00000001;
enum MMSYSERR_BADDEVICEID = 0x00000002;
enum MMSYSERR_NOTENABLED = 0x00000003;
enum MMSYSERR_ALLOCATED = 0x00000004;
enum MMSYSERR_INVALHANDLE = 0x00000005;
enum MMSYSERR_NODRIVER = 0x00000006;
enum MMSYSERR_NOMEM = 0x00000007;
enum MMSYSERR_NOTSUPPORTED = 0x00000008;
enum MMSYSERR_BADERRNUM = 0x00000009;
enum MMSYSERR_INVALFLAG = 0x0000000a;
enum MMSYSERR_INVALPARAM = 0x0000000b;
enum MMSYSERR_HANDLEBUSY = 0x0000000c;
enum MMSYSERR_INVALIDALIAS = 0x0000000d;
enum MMSYSERR_BADDB = 0x0000000e;
enum MMSYSERR_KEYNOTFOUND = 0x0000000f;
enum MMSYSERR_READERROR = 0x00000010;
enum MMSYSERR_WRITEERROR = 0x00000011;
enum MMSYSERR_DELETEERROR = 0x00000012;
enum MMSYSERR_VALNOTFOUND = 0x00000013;
enum MMSYSERR_NODRIVERCB = 0x00000014;
enum MMSYSERR_MOREDATA = 0x00000015;
enum MMSYSERR_LASTERROR = 0x00000015;
enum TIME_ONESHOT = 0x00000000;
enum TIME_PERIODIC = 0x00000001;
enum TIME_CALLBACK_FUNCTION = 0x00000000;
enum TIME_CALLBACK_EVENT_SET = 0x00000010;
enum TIME_CALLBACK_EVENT_PULSE = 0x00000020;
enum TIME_KILL_SYNCHRONOUS = 0x00000100;
alias HTASK = void*;
struct MMTIME
{
    align (1):
    uint wType;
    union u
    {
        align (1):
        uint ms;
        uint sample;
        uint cb;
        uint ticks;
        struct smpte
        {
            ubyte hour;
            ubyte min;
            ubyte sec;
            ubyte frame;
            ubyte fps;
            ubyte dummy;
            ubyte[2] pad;
        }
        struct midi
        {
            align (1):
            uint songptrpos;
        }
    }
}
alias LPDRVCALLBACK = void function(HDRVR, uint, ulong, ulong, ulong);
struct TIMECAPS
{
    uint wPeriodMin;
    uint wPeriodMax;
}
alias LPTIMECALLBACK = void function(uint, uint, ulong, ulong, ulong);
enum IID_IReferenceClock = GUID(0x56a86897, 0xad4, 0x11ce, [0xb0, 0x3a, 0x0, 0x20, 0xaf, 0xb, 0xa7, 0x70]);
interface IReferenceClock : IUnknown
{
    HRESULT GetTime(long*);
    HRESULT AdviseTime(long, long, HANDLE, ulong*);
    HRESULT AdvisePeriodic(long, long, HANDLE, ulong*);
    HRESULT Unadvise(ulong);
}
enum IID_IReferenceClockTimerControl = GUID(0xebec459c, 0x2eca, 0x4d42, [0xa8, 0xaf, 0x30, 0xdf, 0x55, 0x76, 0x14, 0xb8]);
interface IReferenceClockTimerControl : IUnknown
{
    HRESULT SetDefaultTimerResolution(long);
    HRESULT GetDefaultTimerResolution(long*);
}
enum IID_IReferenceClock2 = GUID(0x36b73885, 0xc2c8, 0x11cf, [0x8b, 0x46, 0x0, 0x80, 0x5f, 0x6c, 0xef, 0x60]);
interface IReferenceClock2 : IReferenceClock
{
}
union TIMECODE
{
    struct
    {
        ushort wFrameRate;
        ushort wFrameFract;
        uint dwFrames;
    }
    ulong qw;
}
struct TIMECODE_SAMPLE
{
    long qwTick;
    TIMECODE timecode;
    uint dwUser;
    TIMECODE_SAMPLE_FLAGS dwFlags;
}
