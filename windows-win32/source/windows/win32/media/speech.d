module windows.win32.media.speech;

import windows.win32.guid : GUID;
import windows.win32.foundation : BOOL, BSTR, FILETIME, HANDLE, HMODULE, HRESULT, HWND, LPARAM, LRESULT, PWSTR, VARIANT_BOOL, WPARAM;
import windows.win32.media.audio : WAVEFORMATEX;
import windows.win32.system.com : IDispatch, IServiceProvider, IStream, IUnknown;
import windows.win32.system.com.urlmon : IInternetSecurityManager;
import windows.win32.system.registry : HKEY;
import windows.win32.system.variant : VARIANT;

version (Windows):
extern (Windows):

enum SPDUI_EngineProperties = "EngineProperties";
enum SPDUI_AddRemoveWord = "AddRemoveWord";
enum SPDUI_UserTraining = "UserTraining";
enum SPDUI_MicTraining = "MicTraining";
enum SPDUI_RecoProfileProperties = "RecoProfileProperties";
enum SPDUI_AudioProperties = "AudioProperties";
enum SPDUI_AudioVolume = "AudioVolume";
enum SPDUI_UserEnrollment = "UserEnrollment";
enum SPDUI_ShareData = "ShareData";
enum SPDUI_Tutorial = "Tutorial";
enum SPREG_USER_ROOT = "HKEY_CURRENT_USER\\SOFTWARE\\Microsoft\\Speech";
enum SPREG_LOCAL_MACHINE_ROOT = "HKEY_LOCAL_MACHINE\\SOFTWARE\\Microsoft\\Speech";
enum SPCAT_AUDIOOUT = "HKEY_LOCAL_MACHINE\\SOFTWARE\\Microsoft\\Speech\\AudioOutput";
enum SPCAT_AUDIOIN = "HKEY_LOCAL_MACHINE\\SOFTWARE\\Microsoft\\Speech\\AudioInput";
enum SPCAT_VOICES = "HKEY_LOCAL_MACHINE\\SOFTWARE\\Microsoft\\Speech\\Voices";
enum SPCAT_RECOGNIZERS = "HKEY_LOCAL_MACHINE\\SOFTWARE\\Microsoft\\Speech\\Recognizers";
enum SPCAT_APPLEXICONS = "HKEY_LOCAL_MACHINE\\SOFTWARE\\Microsoft\\Speech\\AppLexicons";
enum SPCAT_PHONECONVERTERS = "HKEY_LOCAL_MACHINE\\SOFTWARE\\Microsoft\\Speech\\PhoneConverters";
enum SPCAT_TEXTNORMALIZERS = "HKEY_LOCAL_MACHINE\\SOFTWARE\\Microsoft\\Speech\\TextNormalizers";
enum SPCAT_RECOPROFILES = "HKEY_CURRENT_USER\\SOFTWARE\\Microsoft\\Speech\\RecoProfiles";
enum SPMMSYS_AUDIO_IN_TOKEN_ID = "HKEY_LOCAL_MACHINE\\SOFTWARE\\Microsoft\\Speech\\AudioInput\\TokenEnums\\MMAudioIn\\";
enum SPMMSYS_AUDIO_OUT_TOKEN_ID = "HKEY_LOCAL_MACHINE\\SOFTWARE\\Microsoft\\Speech\\AudioOutput\\TokenEnums\\MMAudioOut\\";
enum SPCURRENT_USER_LEXICON_TOKEN_ID = "HKEY_CURRENT_USER\\SOFTWARE\\Microsoft\\Speech\\CurrentUserLexicon";
enum SPCURRENT_USER_SHORTCUT_TOKEN_ID = "HKEY_CURRENT_USER\\SOFTWARE\\Microsoft\\Speech\\CurrentUserShortcut";
enum SPTOKENVALUE_CLSID = "CLSID";
enum SPTOKENKEY_FILES = "Files";
enum SPTOKENKEY_UI = "UI";
enum SPTOKENKEY_ATTRIBUTES = "Attributes";
enum SPTOKENKEY_RETAINEDAUDIO = "SecondsPerRetainedAudioEvent";
enum SPTOKENKEY_AUDIO_LATENCY_WARNING = "LatencyWarningThreshold";
enum SPTOKENKEY_AUDIO_LATENCY_TRUNCATE = "LatencyTruncateThreshold";
enum SPTOKENKEY_AUDIO_LATENCY_UPDATE_INTERVAL = "LatencyUpdateInterval";
enum SPVOICECATEGORY_TTSRATE = "DefaultTTSRate";
enum SPPROP_RESOURCE_USAGE = "ResourceUsage";
enum SPPROP_HIGH_CONFIDENCE_THRESHOLD = "HighConfidenceThreshold";
enum SPPROP_NORMAL_CONFIDENCE_THRESHOLD = "NormalConfidenceThreshold";
enum SPPROP_LOW_CONFIDENCE_THRESHOLD = "LowConfidenceThreshold";
enum SPPROP_RESPONSE_SPEED = "ResponseSpeed";
enum SPPROP_COMPLEX_RESPONSE_SPEED = "ComplexResponseSpeed";
enum SPPROP_ADAPTATION_ON = "AdaptationOn";
enum SPPROP_PERSISTED_BACKGROUND_ADAPTATION = "PersistedBackgroundAdaptation";
enum SPPROP_PERSISTED_LANGUAGE_MODEL_ADAPTATION = "PersistedLanguageModelAdaptation";
enum SPPROP_UX_IS_LISTENING = "UXIsListening";
enum SPTOPIC_SPELLING = "Spelling";
enum SPWILDCARD = "...";
enum SPDICTATION = "*";
enum SPINFDICTATION = "*+";
enum SPREG_SAFE_USER_TOKENS = "HKEY_LOCAL_MACHINE\\SOFTWARE\\Microsoft\\Speech\\UserTokens";
enum SP_LOW_CONFIDENCE = 0xffffffffffffffff;
enum SP_NORMAL_CONFIDENCE = 0x00000000;
enum DEFAULT_WEIGHT = 0x00000001;
enum SP_MAX_WORD_LENGTH = 0x00000080;
enum SP_MAX_PRON_LENGTH = 0x00000180;
enum SP_EMULATE_RESULT = 0x40000000;
enum SP_STREAMPOS_ASAP = 0x00000000;
enum SP_STREAMPOS_REALTIME = 0xffffffffffffffff;
enum SPRP_NORMAL = 0x00000000;
enum SP_MAX_LANGIDS = 0x00000014;
enum SPRECOEXTENSION = "RecoExtension";
enum SPALTERNATESCLSID = "AlternatesCLSID";
enum SR_LOCALIZED_DESCRIPTION = "Description";
enum SAPI_ERROR_BASE = 0x00005000;
enum Speech_Default_Weight = 1.000000;
enum Speech_Max_Word_Length = 0x00000080;
enum Speech_Max_Pron_Length = 0x00000180;
enum Speech_StreamPos_Asap = 0x00000000;
enum Speech_StreamPos_RealTime = 0xffffffffffffffff;
enum SpeechAllElements = 0xffffffffffffffff;
alias SPSTATEHANDLE = void*;
alias SPWORDHANDLE = void*;
alias SPRULEHANDLE = void*;
alias SPGRAMMARHANDLE = void*;
alias SPRECOCONTEXTHANDLE = void*;
alias SPPHRASERULEHANDLE = void*;
alias SPPHRASEPROPERTYHANDLE = void*;
alias SPTRANSITIONID = void*;
alias SPDATAKEYLOCATION = int;
enum : int
{
    SPDKL_DefaultLocation = 0x00000000,
    SPDKL_CurrentUser     = 0x00000001,
    SPDKL_LocalMachine    = 0x00000002,
    SPDKL_CurrentConfig   = 0x00000005,
}

alias SPSTREAMFORMAT = int;
enum : int
{
    SPSF_Default                 = 0xffffffff,
    SPSF_NoAssignedFormat        = 0x00000000,
    SPSF_Text                    = 0x00000001,
    SPSF_NonStandardFormat       = 0x00000002,
    SPSF_ExtendedAudioFormat     = 0x00000003,
    SPSF_8kHz8BitMono            = 0x00000004,
    SPSF_8kHz8BitStereo          = 0x00000005,
    SPSF_8kHz16BitMono           = 0x00000006,
    SPSF_8kHz16BitStereo         = 0x00000007,
    SPSF_11kHz8BitMono           = 0x00000008,
    SPSF_11kHz8BitStereo         = 0x00000009,
    SPSF_11kHz16BitMono          = 0x0000000a,
    SPSF_11kHz16BitStereo        = 0x0000000b,
    SPSF_12kHz8BitMono           = 0x0000000c,
    SPSF_12kHz8BitStereo         = 0x0000000d,
    SPSF_12kHz16BitMono          = 0x0000000e,
    SPSF_12kHz16BitStereo        = 0x0000000f,
    SPSF_16kHz8BitMono           = 0x00000010,
    SPSF_16kHz8BitStereo         = 0x00000011,
    SPSF_16kHz16BitMono          = 0x00000012,
    SPSF_16kHz16BitStereo        = 0x00000013,
    SPSF_22kHz8BitMono           = 0x00000014,
    SPSF_22kHz8BitStereo         = 0x00000015,
    SPSF_22kHz16BitMono          = 0x00000016,
    SPSF_22kHz16BitStereo        = 0x00000017,
    SPSF_24kHz8BitMono           = 0x00000018,
    SPSF_24kHz8BitStereo         = 0x00000019,
    SPSF_24kHz16BitMono          = 0x0000001a,
    SPSF_24kHz16BitStereo        = 0x0000001b,
    SPSF_32kHz8BitMono           = 0x0000001c,
    SPSF_32kHz8BitStereo         = 0x0000001d,
    SPSF_32kHz16BitMono          = 0x0000001e,
    SPSF_32kHz16BitStereo        = 0x0000001f,
    SPSF_44kHz8BitMono           = 0x00000020,
    SPSF_44kHz8BitStereo         = 0x00000021,
    SPSF_44kHz16BitMono          = 0x00000022,
    SPSF_44kHz16BitStereo        = 0x00000023,
    SPSF_48kHz8BitMono           = 0x00000024,
    SPSF_48kHz8BitStereo         = 0x00000025,
    SPSF_48kHz16BitMono          = 0x00000026,
    SPSF_48kHz16BitStereo        = 0x00000027,
    SPSF_TrueSpeech_8kHz1BitMono = 0x00000028,
    SPSF_CCITT_ALaw_8kHzMono     = 0x00000029,
    SPSF_CCITT_ALaw_8kHzStereo   = 0x0000002a,
    SPSF_CCITT_ALaw_11kHzMono    = 0x0000002b,
    SPSF_CCITT_ALaw_11kHzStereo  = 0x0000002c,
    SPSF_CCITT_ALaw_22kHzMono    = 0x0000002d,
    SPSF_CCITT_ALaw_22kHzStereo  = 0x0000002e,
    SPSF_CCITT_ALaw_44kHzMono    = 0x0000002f,
    SPSF_CCITT_ALaw_44kHzStereo  = 0x00000030,
    SPSF_CCITT_uLaw_8kHzMono     = 0x00000031,
    SPSF_CCITT_uLaw_8kHzStereo   = 0x00000032,
    SPSF_CCITT_uLaw_11kHzMono    = 0x00000033,
    SPSF_CCITT_uLaw_11kHzStereo  = 0x00000034,
    SPSF_CCITT_uLaw_22kHzMono    = 0x00000035,
    SPSF_CCITT_uLaw_22kHzStereo  = 0x00000036,
    SPSF_CCITT_uLaw_44kHzMono    = 0x00000037,
    SPSF_CCITT_uLaw_44kHzStereo  = 0x00000038,
    SPSF_ADPCM_8kHzMono          = 0x00000039,
    SPSF_ADPCM_8kHzStereo        = 0x0000003a,
    SPSF_ADPCM_11kHzMono         = 0x0000003b,
    SPSF_ADPCM_11kHzStereo       = 0x0000003c,
    SPSF_ADPCM_22kHzMono         = 0x0000003d,
    SPSF_ADPCM_22kHzStereo       = 0x0000003e,
    SPSF_ADPCM_44kHzMono         = 0x0000003f,
    SPSF_ADPCM_44kHzStereo       = 0x00000040,
    SPSF_GSM610_8kHzMono         = 0x00000041,
    SPSF_GSM610_11kHzMono        = 0x00000042,
    SPSF_GSM610_22kHzMono        = 0x00000043,
    SPSF_GSM610_44kHzMono        = 0x00000044,
    SPSF_NUM_FORMATS             = 0x00000045,
}

// [Not Found] IID_ISpNotifyCallback
interface ISpNotifyCallback
{
    HRESULT NotifyCallback(WPARAM wParam, LPARAM lParam);
}
alias SPNOTIFYCALLBACK = void function(WPARAM wParam, LPARAM lParam);
enum IID_ISpNotifySource = GUID(0x5eff4aef, 0x8487, 0x11d2, [0x96, 0x1c, 0x0, 0xc0, 0x4f, 0x8e, 0xe6, 0x28]);
interface ISpNotifySource : IUnknown
{
    HRESULT SetNotifySink(ISpNotifySink pNotifySink);
    HRESULT SetNotifyWindowMessage(HWND hWnd, uint Msg, WPARAM wParam, LPARAM lParam);
    HRESULT SetNotifyCallbackFunction(SPNOTIFYCALLBACK* pfnCallback, WPARAM wParam, LPARAM lParam);
    HRESULT SetNotifyCallbackInterface(ISpNotifyCallback pSpCallback, WPARAM wParam, LPARAM lParam);
    HRESULT SetNotifyWin32Event();
    HRESULT WaitForNotifyEvent(uint dwMilliseconds);
    HANDLE GetNotifyEventHandle();
}
enum IID_ISpNotifySink = GUID(0x259684dc, 0x37c3, 0x11d2, [0x96, 0x3, 0x0, 0xc0, 0x4f, 0x8e, 0xe6, 0x28]);
interface ISpNotifySink : IUnknown
{
    HRESULT Notify();
}
enum IID_ISpNotifyTranslator = GUID(0xaca16614, 0x5d3d, 0x11d2, [0x96, 0xe, 0x0, 0xc0, 0x4f, 0x8e, 0xe6, 0x28]);
interface ISpNotifyTranslator : ISpNotifySink
{
    HRESULT InitWindowMessage(HWND hWnd, uint Msg, WPARAM wParam, LPARAM lParam);
    HRESULT InitCallback(SPNOTIFYCALLBACK* pfnCallback, WPARAM wParam, LPARAM lParam);
    HRESULT InitSpNotifyCallback(ISpNotifyCallback pSpCallback, WPARAM wParam, LPARAM lParam);
    HRESULT InitWin32Event(HANDLE hEvent, BOOL fCloseHandleOnRelease);
    HRESULT Wait(uint dwMilliseconds);
    HANDLE GetEventHandle();
}
enum IID_ISpDataKey = GUID(0x14056581, 0xe16c, 0x11d2, [0xbb, 0x90, 0x0, 0xc0, 0x4f, 0x8e, 0xe6, 0xc0]);
interface ISpDataKey : IUnknown
{
    HRESULT SetData(const(wchar)* pszValueName, uint cbData, const(ubyte)* pData);
    HRESULT GetData(const(wchar)* pszValueName, uint* pcbData, ubyte* pData);
    HRESULT SetStringValue(const(wchar)* pszValueName, const(wchar)* pszValue);
    HRESULT GetStringValue(const(wchar)* pszValueName, PWSTR* ppszValue);
    HRESULT SetDWORD(const(wchar)* pszValueName, uint dwValue);
    HRESULT GetDWORD(const(wchar)* pszValueName, uint* pdwValue);
    HRESULT OpenKey(const(wchar)* pszSubKeyName, ISpDataKey* ppSubKey);
    HRESULT CreateKey(const(wchar)* pszSubKey, ISpDataKey* ppSubKey);
    HRESULT DeleteKey(const(wchar)* pszSubKey);
    HRESULT DeleteValue(const(wchar)* pszValueName);
    HRESULT EnumKeys(uint Index, PWSTR* ppszSubKeyName);
    HRESULT EnumValues(uint Index, PWSTR* ppszValueName);
}
enum IID_ISpRegDataKey = GUID(0x92a66e2b, 0xc830, 0x4149, [0x83, 0xdf, 0x6f, 0xc2, 0xba, 0x1e, 0x7a, 0x5b]);
interface ISpRegDataKey : ISpDataKey
{
    HRESULT SetKey(HKEY hkey, BOOL fReadOnly);
}
enum IID_ISpObjectTokenCategory = GUID(0x2d3d3845, 0x39af, 0x4850, [0xbb, 0xf9, 0x40, 0xb4, 0x97, 0x80, 0x1, 0x1d]);
interface ISpObjectTokenCategory : ISpDataKey
{
    HRESULT SetId(const(wchar)* pszCategoryId, BOOL fCreateIfNotExist);
    HRESULT GetId(PWSTR* ppszCoMemCategoryId);
    HRESULT GetDataKey(SPDATAKEYLOCATION spdkl, ISpDataKey* ppDataKey);
    HRESULT EnumTokens(const(wchar)* pzsReqAttribs, const(wchar)* pszOptAttribs, IEnumSpObjectTokens* ppEnum);
    HRESULT SetDefaultTokenId(const(wchar)* pszTokenId);
    HRESULT GetDefaultTokenId(PWSTR* ppszCoMemTokenId);
}
enum IID_ISpObjectToken = GUID(0x14056589, 0xe16c, 0x11d2, [0xbb, 0x90, 0x0, 0xc0, 0x4f, 0x8e, 0xe6, 0xc0]);
interface ISpObjectToken : ISpDataKey
{
    HRESULT SetId(const(wchar)* pszCategoryId, const(wchar)* pszTokenId, BOOL fCreateIfNotExist);
    HRESULT GetId(PWSTR* ppszCoMemTokenId);
    HRESULT GetCategory(ISpObjectTokenCategory* ppTokenCategory);
    HRESULT CreateInstance(IUnknown pUnkOuter, uint dwClsContext, const(GUID)* riid, void** ppvObject);
    HRESULT GetStorageFileName(const(GUID)* clsidCaller, const(wchar)* pszValueName, const(wchar)* pszFileNameSpecifier, uint nFolder, PWSTR* ppszFilePath);
    HRESULT RemoveStorageFileName(const(GUID)* clsidCaller, const(wchar)* pszKeyName, BOOL fDeleteFile);
    HRESULT Remove(const(GUID)* pclsidCaller);
    HRESULT IsUISupported(const(wchar)* pszTypeOfUI, void* pvExtraData, uint cbExtraData, IUnknown punkObject, BOOL* pfSupported);
    HRESULT DisplayUI(HWND hwndParent, const(wchar)* pszTitle, const(wchar)* pszTypeOfUI, void* pvExtraData, uint cbExtraData, IUnknown punkObject);
    HRESULT MatchesAttributes(const(wchar)* pszAttributes, BOOL* pfMatches);
}
enum IID_ISpObjectTokenInit = GUID(0xb8aab0cf, 0x346f, 0x49d8, [0x94, 0x99, 0xc8, 0xb0, 0x3f, 0x16, 0x1d, 0x51]);
interface ISpObjectTokenInit : ISpObjectToken
{
    HRESULT InitFromDataKey(const(wchar)* pszCategoryId, const(wchar)* pszTokenId, ISpDataKey pDataKey);
}
enum IID_IEnumSpObjectTokens = GUID(0x6b64f9e, 0x7fda, 0x11d2, [0xb4, 0xf2, 0x0, 0xc0, 0x4f, 0x79, 0x73, 0x96]);
interface IEnumSpObjectTokens : IUnknown
{
    HRESULT Next(uint celt, ISpObjectToken* pelt, uint* pceltFetched);
    HRESULT Skip(uint celt);
    HRESULT Reset();
    HRESULT Clone(IEnumSpObjectTokens* ppEnum);
    HRESULT Item(uint Index, ISpObjectToken* ppToken);
    HRESULT GetCount(uint* pCount);
}
enum IID_ISpObjectWithToken = GUID(0x5b559f40, 0xe952, 0x11d2, [0xbb, 0x91, 0x0, 0xc0, 0x4f, 0x8e, 0xe6, 0xc0]);
interface ISpObjectWithToken : IUnknown
{
    HRESULT SetObjectToken(ISpObjectToken pToken);
    HRESULT GetObjectToken(ISpObjectToken* ppToken);
}
enum IID_ISpResourceManager = GUID(0x93384e18, 0x5014, 0x43d5, [0xad, 0xbb, 0xa7, 0x8e, 0x5, 0x59, 0x26, 0xbd]);
interface ISpResourceManager : IServiceProvider
{
    HRESULT SetObject(const(GUID)* guidServiceId, IUnknown pUnkObject);
    HRESULT GetObject(const(GUID)* guidServiceId, const(GUID)* ObjectCLSID, const(GUID)* ObjectIID, BOOL fReleaseWhenLastExternalRefReleased, void** ppObject);
}
alias SPEVENTLPARAMTYPE = int;
enum : int
{
    SPET_LPARAM_IS_UNDEFINED = 0x00000000,
    SPET_LPARAM_IS_TOKEN     = 0x00000001,
    SPET_LPARAM_IS_OBJECT    = 0x00000002,
    SPET_LPARAM_IS_POINTER   = 0x00000003,
    SPET_LPARAM_IS_STRING    = 0x00000004,
}

alias SPEVENTENUM = int;
enum : int
{
    SPEI_UNDEFINED              = 0x00000000,
    SPEI_START_INPUT_STREAM     = 0x00000001,
    SPEI_END_INPUT_STREAM       = 0x00000002,
    SPEI_VOICE_CHANGE           = 0x00000003,
    SPEI_TTS_BOOKMARK           = 0x00000004,
    SPEI_WORD_BOUNDARY          = 0x00000005,
    SPEI_PHONEME                = 0x00000006,
    SPEI_SENTENCE_BOUNDARY      = 0x00000007,
    SPEI_VISEME                 = 0x00000008,
    SPEI_TTS_AUDIO_LEVEL        = 0x00000009,
    SPEI_TTS_PRIVATE            = 0x0000000f,
    SPEI_MIN_TTS                = 0x00000001,
    SPEI_MAX_TTS                = 0x0000000f,
    SPEI_END_SR_STREAM          = 0x00000022,
    SPEI_SOUND_START            = 0x00000023,
    SPEI_SOUND_END              = 0x00000024,
    SPEI_PHRASE_START           = 0x00000025,
    SPEI_RECOGNITION            = 0x00000026,
    SPEI_HYPOTHESIS             = 0x00000027,
    SPEI_SR_BOOKMARK            = 0x00000028,
    SPEI_PROPERTY_NUM_CHANGE    = 0x00000029,
    SPEI_PROPERTY_STRING_CHANGE = 0x0000002a,
    SPEI_FALSE_RECOGNITION      = 0x0000002b,
    SPEI_INTERFERENCE           = 0x0000002c,
    SPEI_REQUEST_UI             = 0x0000002d,
    SPEI_RECO_STATE_CHANGE      = 0x0000002e,
    SPEI_ADAPTATION             = 0x0000002f,
    SPEI_START_SR_STREAM        = 0x00000030,
    SPEI_RECO_OTHER_CONTEXT     = 0x00000031,
    SPEI_SR_AUDIO_LEVEL         = 0x00000032,
    SPEI_SR_RETAINEDAUDIO       = 0x00000033,
    SPEI_SR_PRIVATE             = 0x00000034,
    SPEI_RESERVED4              = 0x00000035,
    SPEI_RESERVED5              = 0x00000036,
    SPEI_RESERVED6              = 0x00000037,
    SPEI_MIN_SR                 = 0x00000022,
    SPEI_MAX_SR                 = 0x00000037,
    SPEI_RESERVED1              = 0x0000001e,
    SPEI_RESERVED2              = 0x00000021,
    SPEI_RESERVED3              = 0x0000003f,
}

struct SPEVENT
{
    int _bitfield0;
    uint ulStreamNum;
    ulong ullAudioStreamOffset;
    WPARAM wParam;
    LPARAM lParam;
}
struct SPSERIALIZEDEVENT
{
    int _bitfield0;
    uint ulStreamNum;
    ulong ullAudioStreamOffset;
    uint SerializedwParam;
    int SerializedlParam;
}
struct SPSERIALIZEDEVENT64
{
    int _bitfield0;
    uint ulStreamNum;
    ulong ullAudioStreamOffset;
    ulong SerializedwParam;
    long SerializedlParam;
}
struct SPEVENTEX
{
    int _bitfield0;
    uint ulStreamNum;
    ulong ullAudioStreamOffset;
    WPARAM wParam;
    LPARAM lParam;
    ulong ullAudioTimeOffset;
}
alias SPINTERFERENCE = int;
enum : int
{
    SPINTERFERENCE_NONE                   = 0x00000000,
    SPINTERFERENCE_NOISE                  = 0x00000001,
    SPINTERFERENCE_NOSIGNAL               = 0x00000002,
    SPINTERFERENCE_TOOLOUD                = 0x00000003,
    SPINTERFERENCE_TOOQUIET               = 0x00000004,
    SPINTERFERENCE_TOOFAST                = 0x00000005,
    SPINTERFERENCE_TOOSLOW                = 0x00000006,
    SPINTERFERENCE_LATENCY_WARNING        = 0x00000007,
    SPINTERFERENCE_LATENCY_TRUNCATE_BEGIN = 0x00000008,
    SPINTERFERENCE_LATENCY_TRUNCATE_END   = 0x00000009,
}

alias SPENDSRSTREAMFLAGS = int;
enum : int
{
    SPESF_NONE            = 0x00000000,
    SPESF_STREAM_RELEASED = 0x00000001,
    SPESF_EMULATED        = 0x00000002,
}

alias SPVFEATURE = int;
enum : int
{
    SPVFEATURE_STRESSED = 0x00000001,
    SPVFEATURE_EMPHASIS = 0x00000002,
}

alias SPVISEMES = int;
enum : int
{
    SP_VISEME_0  = 0x00000000,
    SP_VISEME_1  = 0x00000001,
    SP_VISEME_2  = 0x00000002,
    SP_VISEME_3  = 0x00000003,
    SP_VISEME_4  = 0x00000004,
    SP_VISEME_5  = 0x00000005,
    SP_VISEME_6  = 0x00000006,
    SP_VISEME_7  = 0x00000007,
    SP_VISEME_8  = 0x00000008,
    SP_VISEME_9  = 0x00000009,
    SP_VISEME_10 = 0x0000000a,
    SP_VISEME_11 = 0x0000000b,
    SP_VISEME_12 = 0x0000000c,
    SP_VISEME_13 = 0x0000000d,
    SP_VISEME_14 = 0x0000000e,
    SP_VISEME_15 = 0x0000000f,
    SP_VISEME_16 = 0x00000010,
    SP_VISEME_17 = 0x00000011,
    SP_VISEME_18 = 0x00000012,
    SP_VISEME_19 = 0x00000013,
    SP_VISEME_20 = 0x00000014,
    SP_VISEME_21 = 0x00000015,
}

struct SPEVENTSOURCEINFO
{
    ulong ullEventInterest;
    ulong ullQueuedInterest;
    uint ulCount;
}
enum IID_ISpEventSource = GUID(0xbe7a9cce, 0x5f9e, 0x11d2, [0x96, 0xf, 0x0, 0xc0, 0x4f, 0x8e, 0xe6, 0x28]);
interface ISpEventSource : ISpNotifySource
{
    HRESULT SetInterest(ulong ullEventInterest, ulong ullQueuedInterest);
    HRESULT GetEvents(uint ulCount, SPEVENT* pEventArray, uint* pulFetched);
    HRESULT GetInfo(SPEVENTSOURCEINFO* pInfo);
}
enum IID_ISpEventSource2 = GUID(0x2373a435, 0x6a4b, 0x429e, [0xa6, 0xac, 0xd4, 0x23, 0x1a, 0x61, 0x97, 0x5b]);
interface ISpEventSource2 : ISpEventSource
{
    HRESULT GetEventsEx(uint ulCount, SPEVENTEX* pEventArray, uint* pulFetched);
}
enum IID_ISpEventSink = GUID(0xbe7a9cc9, 0x5f9e, 0x11d2, [0x96, 0xf, 0x0, 0xc0, 0x4f, 0x8e, 0xe6, 0x28]);
interface ISpEventSink : IUnknown
{
    HRESULT AddEvents(const(SPEVENT)* pEventArray, uint ulCount);
    HRESULT GetEventInterest(ulong* pullEventInterest);
}
enum IID_ISpStreamFormat = GUID(0xbed530be, 0x2606, 0x4f4d, [0xa1, 0xc0, 0x54, 0xc5, 0xcd, 0xa5, 0x56, 0x6f]);
interface ISpStreamFormat : IStream
{
    HRESULT GetFormat(GUID* pguidFormatId, WAVEFORMATEX** ppCoMemWaveFormatEx);
}
alias SPFILEMODE = int;
enum : int
{
    SPFM_OPEN_READONLY  = 0x00000000,
    SPFM_OPEN_READWRITE = 0x00000001,
    SPFM_CREATE         = 0x00000002,
    SPFM_CREATE_ALWAYS  = 0x00000003,
    SPFM_NUM_MODES      = 0x00000004,
}

enum IID_ISpStream = GUID(0x12e3cca9, 0x7518, 0x44c5, [0xa5, 0xe7, 0xba, 0x5a, 0x79, 0xcb, 0x92, 0x9e]);
interface ISpStream : ISpStreamFormat
{
    HRESULT SetBaseStream(IStream pStream, const(GUID)* rguidFormat, const(WAVEFORMATEX)* pWaveFormatEx);
    HRESULT GetBaseStream(IStream* ppStream);
    HRESULT BindToFile(const(wchar)* pszFileName, SPFILEMODE eMode, const(GUID)* pFormatId, const(WAVEFORMATEX)* pWaveFormatEx, ulong ullEventInterest);
    HRESULT Close();
}
enum IID_ISpStreamFormatConverter = GUID(0x678a932c, 0xea71, 0x4446, [0x9b, 0x41, 0x78, 0xfd, 0xa6, 0x28, 0xa, 0x29]);
interface ISpStreamFormatConverter : ISpStreamFormat
{
    HRESULT SetBaseStream(ISpStreamFormat pStream, BOOL fSetFormatToBaseStreamFormat, BOOL fWriteToBaseStream);
    HRESULT GetBaseStream(ISpStreamFormat* ppStream);
    HRESULT SetFormat(const(GUID)* rguidFormatIdOfConvertedStream, const(WAVEFORMATEX)* pWaveFormatExOfConvertedStream);
    HRESULT ResetSeekPosition();
    HRESULT ScaleConvertedToBaseOffset(ulong ullOffsetConvertedStream, ulong* pullOffsetBaseStream);
    HRESULT ScaleBaseToConvertedOffset(ulong ullOffsetBaseStream, ulong* pullOffsetConvertedStream);
}
alias SPAUDIOSTATE = int;
enum : int
{
    SPAS_CLOSED = 0x00000000,
    SPAS_STOP   = 0x00000001,
    SPAS_PAUSE  = 0x00000002,
    SPAS_RUN    = 0x00000003,
}

struct SPAUDIOSTATUS
{
    int cbFreeBuffSpace;
    uint cbNonBlockingIO;
    SPAUDIOSTATE State;
    ulong CurSeekPos;
    ulong CurDevicePos;
    uint dwAudioLevel;
    uint dwReserved2;
}
struct SPAUDIOBUFFERINFO
{
    uint ulMsMinNotification;
    uint ulMsBufferSize;
    uint ulMsEventBias;
}
enum IID_ISpAudio = GUID(0xc05c768f, 0xfae8, 0x4ec2, [0x8e, 0x7, 0x33, 0x83, 0x21, 0xc1, 0x24, 0x52]);
interface ISpAudio : ISpStreamFormat
{
    HRESULT SetState(SPAUDIOSTATE NewState, ulong ullReserved);
    HRESULT SetFormat(const(GUID)* rguidFmtId, const(WAVEFORMATEX)* pWaveFormatEx);
    HRESULT GetStatus(SPAUDIOSTATUS* pStatus);
    HRESULT SetBufferInfo(const(SPAUDIOBUFFERINFO)* pBuffInfo);
    HRESULT GetBufferInfo(SPAUDIOBUFFERINFO* pBuffInfo);
    HRESULT GetDefaultFormat(GUID* pFormatId, WAVEFORMATEX** ppCoMemWaveFormatEx);
    HANDLE EventHandle();
    HRESULT GetVolumeLevel(uint* pLevel);
    HRESULT SetVolumeLevel(uint Level);
    HRESULT GetBufferNotifySize(uint* pcbSize);
    HRESULT SetBufferNotifySize(uint cbSize);
}
enum IID_ISpMMSysAudio = GUID(0x15806f6e, 0x1d70, 0x4b48, [0x98, 0xe6, 0x3b, 0x1a, 0x0, 0x75, 0x9, 0xab]);
interface ISpMMSysAudio : ISpAudio
{
    HRESULT GetDeviceId(uint* puDeviceId);
    HRESULT SetDeviceId(uint uDeviceId);
    HRESULT GetMMHandle(void** pHandle);
    HRESULT GetLineId(uint* puLineId);
    HRESULT SetLineId(uint uLineId);
}
enum IID_ISpTranscript = GUID(0x10f63bce, 0x201a, 0x11d3, [0xac, 0x70, 0x0, 0xc0, 0x4f, 0x8e, 0xe6, 0xc0]);
interface ISpTranscript : IUnknown
{
    HRESULT GetTranscript(PWSTR* ppszTranscript);
    HRESULT AppendTranscript(const(wchar)* pszTranscript);
}
alias SPDISPLAYATTRIBUTES = int;
enum : int
{
    SPAF_ONE_TRAILING_SPACE     = 0x00000002,
    SPAF_TWO_TRAILING_SPACES    = 0x00000004,
    SPAF_CONSUME_LEADING_SPACES = 0x00000008,
    SPAF_BUFFER_POSITION        = 0x00000010,
    SPAF_ALL                    = 0x0000001f,
    SPAF_USER_SPECIFIED         = 0x00000080,
}

struct SPPHRASEELEMENT
{
    uint ulAudioTimeOffset;
    uint ulAudioSizeTime;
    uint ulAudioStreamOffset;
    uint ulAudioSizeBytes;
    uint ulRetainedStreamOffset;
    uint ulRetainedSizeBytes;
    const(wchar)* pszDisplayText;
    const(wchar)* pszLexicalForm;
    const(ushort)* pszPronunciation;
    ubyte bDisplayAttributes;
    byte RequiredConfidence;
    byte ActualConfidence;
    ubyte Reserved;
    float SREngineConfidence;
}
struct SPPHRASERULE
{
    const(wchar)* pszName;
    uint ulId;
    uint ulFirstElement;
    uint ulCountOfElements;
    const(SPPHRASERULE)* pNextSibling;
    const(SPPHRASERULE)* pFirstChild;
    float SREngineConfidence;
    byte Confidence;
}
alias SPPHRASEPROPERTYUNIONTYPE = int;
enum : int
{
    SPPPUT_UNUSED      = 0x00000000,
    SPPPUT_ARRAY_INDEX = 0x00000001,
}

struct SPPHRASEPROPERTY
{
    const(wchar)* pszName;
    union
    {
        uint ulId;
        struct
        {
            ubyte bType;
            ubyte bReserved;
            ushort usArrayIndex;
        }
    }
    const(wchar)* pszValue;
    VARIANT vValue;
    uint ulFirstElement;
    uint ulCountOfElements;
    const(SPPHRASEPROPERTY)* pNextSibling;
    const(SPPHRASEPROPERTY)* pFirstChild;
    float SREngineConfidence;
    byte Confidence;
}
struct SPPHRASEREPLACEMENT
{
    ubyte bDisplayAttributes;
    const(wchar)* pszReplacementText;
    uint ulFirstElement;
    uint ulCountOfElements;
}
struct SPSEMANTICERRORINFO
{
    uint ulLineNumber;
    PWSTR pszScriptLine;
    PWSTR pszSource;
    PWSTR pszDescription;
    HRESULT hrResultCode;
}
alias SPSEMANTICFORMAT = int;
enum : int
{
    SPSMF_SAPI_PROPERTIES                 = 0x00000000,
    SPSMF_SRGS_SEMANTICINTERPRETATION_MS  = 0x00000001,
    SPSMF_SRGS_SAPIPROPERTIES             = 0x00000002,
    SPSMF_UPS                             = 0x00000004,
    SPSMF_SRGS_SEMANTICINTERPRETATION_W3C = 0x00000008,
}

struct SPPHRASE_50
{
    uint cbSize;
    ushort LangID;
    ushort wHomophoneGroupId;
    ulong ullGrammarID;
    ulong ftStartTime;
    ulong ullAudioStreamPosition;
    uint ulAudioSizeBytes;
    uint ulRetainedSizeBytes;
    uint ulAudioSizeTime;
    SPPHRASERULE Rule;
    const(SPPHRASEPROPERTY)* pProperties;
    const(SPPHRASEELEMENT)* pElements;
    uint cReplacements;
    const(SPPHRASEREPLACEMENT)* pReplacements;
    GUID SREngineID;
    uint ulSREnginePrivateDataSize;
    const(ubyte)* pSREnginePrivateData;
}
struct SPPHRASE
{
    SPPHRASE_50 Base;
    PWSTR pSML;
    SPSEMANTICERRORINFO* pSemanticErrorInfo;
}
struct SPSERIALIZEDPHRASE
{
    uint ulSerializedSize;
}
struct SPRULE
{
    const(wchar)* pszRuleName;
    uint ulRuleId;
    uint dwAttributes;
}
alias SPVALUETYPE = int;
enum : int
{
    SPDF_PROPERTY      = 0x00000001,
    SPDF_REPLACEMENT   = 0x00000002,
    SPDF_RULE          = 0x00000004,
    SPDF_DISPLAYTEXT   = 0x00000008,
    SPDF_LEXICALFORM   = 0x00000010,
    SPDF_PRONUNCIATION = 0x00000020,
    SPDF_AUDIO         = 0x00000040,
    SPDF_ALTERNATES    = 0x00000080,
    SPDF_ALL           = 0x000000ff,
}

struct SPBINARYGRAMMAR
{
    uint ulTotalSerializedSize;
}
alias SPPHRASERNG = int;
enum : int
{
    SPPR_ALL_ELEMENTS = 0xffffffff,
}

alias SPRECOEVENTFLAGS = int;
enum : int
{
    SPREF_AutoPause        = 0x00000001,
    SPREF_Emulated         = 0x00000002,
    SPREF_SMLTimeout       = 0x00000004,
    SPREF_ExtendableParse  = 0x00000008,
    SPREF_ReSent           = 0x00000010,
    SPREF_Hypothesis       = 0x00000020,
    SPREF_FalseRecognition = 0x00000040,
}

alias SPPARTOFSPEECH = int;
enum : int
{
    SPPS_NotOverriden = 0xffffffff,
    SPPS_Unknown      = 0x00000000,
    SPPS_Noun         = 0x00001000,
    SPPS_Verb         = 0x00002000,
    SPPS_Modifier     = 0x00003000,
    SPPS_Function     = 0x00004000,
    SPPS_Interjection = 0x00005000,
    SPPS_Noncontent   = 0x00006000,
    SPPS_LMA          = 0x00007000,
    SPPS_SuppressWord = 0x0000f000,
}

alias SPLEXICONTYPE = int;
enum : int
{
    eLEXTYPE_USER          = 0x00000001,
    eLEXTYPE_APP           = 0x00000002,
    eLEXTYPE_VENDORLEXICON = 0x00000004,
    eLEXTYPE_LETTERTOSOUND = 0x00000008,
    eLEXTYPE_MORPHOLOGY    = 0x00000010,
    eLEXTYPE_RESERVED4     = 0x00000020,
    eLEXTYPE_USER_SHORTCUT = 0x00000040,
    eLEXTYPE_RESERVED6     = 0x00000080,
    eLEXTYPE_RESERVED7     = 0x00000100,
    eLEXTYPE_RESERVED8     = 0x00000200,
    eLEXTYPE_RESERVED9     = 0x00000400,
    eLEXTYPE_RESERVED10    = 0x00000800,
    eLEXTYPE_PRIVATE1      = 0x00001000,
    eLEXTYPE_PRIVATE2      = 0x00002000,
    eLEXTYPE_PRIVATE3      = 0x00004000,
    eLEXTYPE_PRIVATE4      = 0x00008000,
    eLEXTYPE_PRIVATE5      = 0x00010000,
    eLEXTYPE_PRIVATE6      = 0x00020000,
    eLEXTYPE_PRIVATE7      = 0x00040000,
    eLEXTYPE_PRIVATE8      = 0x00080000,
    eLEXTYPE_PRIVATE9      = 0x00100000,
    eLEXTYPE_PRIVATE10     = 0x00200000,
    eLEXTYPE_PRIVATE11     = 0x00400000,
    eLEXTYPE_PRIVATE12     = 0x00800000,
    eLEXTYPE_PRIVATE13     = 0x01000000,
    eLEXTYPE_PRIVATE14     = 0x02000000,
    eLEXTYPE_PRIVATE15     = 0x04000000,
    eLEXTYPE_PRIVATE16     = 0x08000000,
    eLEXTYPE_PRIVATE17     = 0x10000000,
    eLEXTYPE_PRIVATE18     = 0x20000000,
    eLEXTYPE_PRIVATE19     = 0x40000000,
    eLEXTYPE_PRIVATE20     = 0x80000000,
}

alias SPWORDTYPE = int;
enum : int
{
    eWORDTYPE_ADDED   = 0x00000001,
    eWORDTYPE_DELETED = 0x00000002,
}

alias SPPRONUNCIATIONFLAGS = int;
enum : int
{
    ePRONFLAG_USED = 0x00000001,
}

struct SPWORDPRONUNCIATION
{
    SPWORDPRONUNCIATION* pNextWordPronunciation;
    SPLEXICONTYPE eLexiconType;
    ushort LangID;
    ushort wPronunciationFlags;
    SPPARTOFSPEECH ePartOfSpeech;
    ushort[1] szPronunciation;
}
struct SPWORDPRONUNCIATIONLIST
{
    uint ulSize;
    ubyte* pvBuffer;
    SPWORDPRONUNCIATION* pFirstWordPronunciation;
}
struct SPWORD
{
    SPWORD* pNextWord;
    ushort LangID;
    ushort wReserved;
    SPWORDTYPE eWordType;
    PWSTR pszWord;
    SPWORDPRONUNCIATION* pFirstWordPronunciation;
}
struct SPWORDLIST
{
    uint ulSize;
    ubyte* pvBuffer;
    SPWORD* pFirstWord;
}
enum IID_ISpLexicon = GUID(0xda41a7c2, 0x5383, 0x4db2, [0x91, 0x6b, 0x6c, 0x17, 0x19, 0xe3, 0xdb, 0x58]);
interface ISpLexicon : IUnknown
{
    HRESULT GetPronunciations(const(wchar)* pszWord, ushort LangID, uint dwFlags, SPWORDPRONUNCIATIONLIST* pWordPronunciationList);
    HRESULT AddPronunciation(const(wchar)* pszWord, ushort LangID, SPPARTOFSPEECH ePartOfSpeech, ushort* pszPronunciation);
    HRESULT RemovePronunciation(const(wchar)* pszWord, ushort LangID, SPPARTOFSPEECH ePartOfSpeech, ushort* pszPronunciation);
    HRESULT GetGeneration(uint* pdwGeneration);
    HRESULT GetGenerationChange(uint dwFlags, uint* pdwGeneration, SPWORDLIST* pWordList);
    HRESULT GetWords(uint dwFlags, uint* pdwGeneration, uint* pdwCookie, SPWORDLIST* pWordList);
}
enum IID_ISpContainerLexicon = GUID(0x8565572f, 0xc094, 0x41cc, [0xb5, 0x6e, 0x10, 0xbd, 0x9c, 0x3f, 0xf0, 0x44]);
interface ISpContainerLexicon : ISpLexicon
{
    HRESULT AddLexicon(ISpLexicon pAddLexicon, uint dwFlags);
}
alias SPSHORTCUTTYPE = int;
enum : int
{
    SPSHT_NotOverriden = 0xffffffff,
    SPSHT_Unknown      = 0x00000000,
    SPSHT_EMAIL        = 0x00001000,
    SPSHT_OTHER        = 0x00002000,
    SPPS_RESERVED1     = 0x00003000,
    SPPS_RESERVED2     = 0x00004000,
    SPPS_RESERVED3     = 0x00005000,
    SPPS_RESERVED4     = 0x0000f000,
}

struct SPSHORTCUTPAIR
{
    SPSHORTCUTPAIR* pNextSHORTCUTPAIR;
    ushort LangID;
    SPSHORTCUTTYPE shType;
    PWSTR pszDisplay;
    PWSTR pszSpoken;
}
struct SPSHORTCUTPAIRLIST
{
    uint ulSize;
    ubyte* pvBuffer;
    SPSHORTCUTPAIR* pFirstShortcutPair;
}
enum IID_ISpShortcut = GUID(0x3df681e2, 0xea56, 0x11d9, [0x8b, 0xde, 0xf6, 0x6b, 0xad, 0x1e, 0x3f, 0x3a]);
interface ISpShortcut : IUnknown
{
    HRESULT AddShortcut(const(wchar)* pszDisplay, ushort LangID, const(wchar)* pszSpoken, SPSHORTCUTTYPE shType);
    HRESULT RemoveShortcut(const(wchar)* pszDisplay, ushort LangID, const(wchar)* pszSpoken, SPSHORTCUTTYPE shType);
    HRESULT GetShortcuts(ushort LangID, SPSHORTCUTPAIRLIST* pShortcutpairList);
    HRESULT GetGeneration(uint* pdwGeneration);
    HRESULT GetWordsFromGenerationChange(uint* pdwGeneration, SPWORDLIST* pWordList);
    HRESULT GetWords(uint* pdwGeneration, uint* pdwCookie, SPWORDLIST* pWordList);
    HRESULT GetShortcutsForGeneration(uint* pdwGeneration, uint* pdwCookie, SPSHORTCUTPAIRLIST* pShortcutpairList);
    HRESULT GetGenerationChange(uint* pdwGeneration, SPSHORTCUTPAIRLIST* pShortcutpairList);
}
enum IID_ISpPhoneConverter = GUID(0x8445c581, 0xcac, 0x4a38, [0xab, 0xfe, 0x9b, 0x2c, 0xe2, 0x82, 0x64, 0x55]);
interface ISpPhoneConverter : ISpObjectWithToken
{
    HRESULT PhoneToId(const(wchar)* pszPhone, ushort* pId);
    HRESULT IdToPhone(ushort* pId, PWSTR pszPhone);
}
enum IID_ISpPhoneticAlphabetConverter = GUID(0x133adcd4, 0x19b4, 0x4020, [0x9f, 0xdc, 0x84, 0x2e, 0x78, 0x25, 0x3b, 0x17]);
interface ISpPhoneticAlphabetConverter : IUnknown
{
    HRESULT GetLangId(ushort* pLangID);
    HRESULT SetLangId(ushort LangID);
    HRESULT SAPI2UPS(const(ushort)* pszSAPIId, ushort* pszUPSId, uint cMaxLength);
    HRESULT UPS2SAPI(const(ushort)* pszUPSId, ushort* pszSAPIId, uint cMaxLength);
    HRESULT GetMaxConvertLength(uint cSrcLength, BOOL bSAPI2UPS, uint* pcMaxDestLength);
}
enum IID_ISpPhoneticAlphabetSelection = GUID(0xb2745efd, 0x42ce, 0x48ca, [0x81, 0xf1, 0xa9, 0x6e, 0x2, 0x53, 0x8a, 0x90]);
interface ISpPhoneticAlphabetSelection : IUnknown
{
    HRESULT IsAlphabetUPS(BOOL* pfIsUPS);
    HRESULT SetAlphabetToUPS(BOOL fForceUPS);
}
struct SPVPITCH
{
    int MiddleAdj;
    int RangeAdj;
}
alias SPVACTIONS = int;
enum : int
{
    SPVA_Speak           = 0x00000000,
    SPVA_Silence         = 0x00000001,
    SPVA_Pronounce       = 0x00000002,
    SPVA_Bookmark        = 0x00000003,
    SPVA_SpellOut        = 0x00000004,
    SPVA_Section         = 0x00000005,
    SPVA_ParseUnknownTag = 0x00000006,
}

struct SPVCONTEXT
{
    const(wchar)* pCategory;
    const(wchar)* pBefore;
    const(wchar)* pAfter;
}
struct SPVSTATE
{
    SPVACTIONS eAction;
    ushort LangID;
    ushort wReserved;
    int EmphAdj;
    int RateAdj;
    uint Volume;
    SPVPITCH PitchAdj;
    uint SilenceMSecs;
    ushort* pPhoneIds;
    SPPARTOFSPEECH ePartOfSpeech;
    SPVCONTEXT Context;
}
alias SPRUNSTATE = int;
enum : int
{
    SPRS_DONE        = 0x00000001,
    SPRS_IS_SPEAKING = 0x00000002,
}

alias SPVLIMITS = int;
enum : int
{
    SPMIN_VOLUME = 0x00000000,
    SPMAX_VOLUME = 0x00000064,
    SPMIN_RATE   = 0xfffffff6,
    SPMAX_RATE   = 0x0000000a,
}

alias SPVPRIORITY = int;
enum : int
{
    SPVPRI_NORMAL = 0x00000000,
    SPVPRI_ALERT  = 0x00000001,
    SPVPRI_OVER   = 0x00000002,
}

struct SPVOICESTATUS
{
    uint ulCurrentStream;
    uint ulLastStreamQueued;
    HRESULT hrLastResult;
    uint dwRunningState;
    uint ulInputWordPos;
    uint ulInputWordLen;
    uint ulInputSentPos;
    uint ulInputSentLen;
    int lBookmarkId;
    ushort PhonemeId;
    SPVISEMES VisemeId;
    uint dwReserved1;
    uint dwReserved2;
}
alias SPEAKFLAGS = int;
enum : int
{
    SPF_DEFAULT          = 0x00000000,
    SPF_ASYNC            = 0x00000001,
    SPF_PURGEBEFORESPEAK = 0x00000002,
    SPF_IS_FILENAME      = 0x00000004,
    SPF_IS_XML           = 0x00000008,
    SPF_IS_NOT_XML       = 0x00000010,
    SPF_PERSIST_XML      = 0x00000020,
    SPF_NLP_SPEAK_PUNC   = 0x00000040,
    SPF_PARSE_SAPI       = 0x00000080,
    SPF_PARSE_SSML       = 0x00000100,
    SPF_PARSE_AUTODETECT = 0x00000000,
    SPF_NLP_MASK         = 0x00000040,
    SPF_PARSE_MASK       = 0x00000180,
    SPF_VOICE_MASK       = 0x000001ff,
    SPF_UNUSED_FLAGS     = 0xfffffe00,
}

enum IID_ISpVoice = GUID(0x6c44df74, 0x72b9, 0x4992, [0xa1, 0xec, 0xef, 0x99, 0x6e, 0x4, 0x22, 0xd4]);
interface ISpVoice : ISpEventSource
{
    HRESULT SetOutput(IUnknown pUnkOutput, BOOL fAllowFormatChanges);
    HRESULT GetOutputObjectToken(ISpObjectToken* ppObjectToken);
    HRESULT GetOutputStream(ISpStreamFormat* ppStream);
    HRESULT Pause();
    HRESULT Resume();
    HRESULT SetVoice(ISpObjectToken pToken);
    HRESULT GetVoice(ISpObjectToken* ppToken);
    HRESULT Speak(const(wchar)* pwcs, uint dwFlags, uint* pulStreamNumber);
    HRESULT SpeakStream(IStream pStream, uint dwFlags, uint* pulStreamNumber);
    HRESULT GetStatus(SPVOICESTATUS* pStatus, PWSTR* ppszLastBookmark);
    HRESULT Skip(const(wchar)* pItemType, int lNumItems, uint* pulNumSkipped);
    HRESULT SetPriority(SPVPRIORITY ePriority);
    HRESULT GetPriority(SPVPRIORITY* pePriority);
    HRESULT SetAlertBoundary(SPEVENTENUM eBoundary);
    HRESULT GetAlertBoundary(SPEVENTENUM* peBoundary);
    HRESULT SetRate(int RateAdjust);
    HRESULT GetRate(int* pRateAdjust);
    HRESULT SetVolume(ushort usVolume);
    HRESULT GetVolume(ushort* pusVolume);
    HRESULT WaitUntilDone(uint msTimeout);
    HRESULT SetSyncSpeakTimeout(uint msTimeout);
    HRESULT GetSyncSpeakTimeout(uint* pmsTimeout);
    HANDLE SpeakCompleteEvent();
    HRESULT IsUISupported(const(wchar)* pszTypeOfUI, void* pvExtraData, uint cbExtraData, BOOL* pfSupported);
    HRESULT DisplayUI(HWND hwndParent, const(wchar)* pszTitle, const(wchar)* pszTypeOfUI, void* pvExtraData, uint cbExtraData);
}
enum IID_ISpPhrase = GUID(0x1a5c0354, 0xb621, 0x4b5a, [0x87, 0x91, 0xd3, 0x6, 0xed, 0x37, 0x9e, 0x53]);
interface ISpPhrase : IUnknown
{
    HRESULT GetPhrase(SPPHRASE** ppCoMemPhrase);
    HRESULT GetSerializedPhrase(SPSERIALIZEDPHRASE** ppCoMemPhrase);
    HRESULT GetText(uint ulStart, uint ulCount, BOOL fUseTextReplacements, PWSTR* ppszCoMemText, ubyte* pbDisplayAttributes);
    HRESULT Discard(uint dwValueTypes);
}
enum IID_ISpPhraseAlt = GUID(0x8fcebc98, 0x4e49, 0x4067, [0x9c, 0x6c, 0xd8, 0x6a, 0xe, 0x9, 0x2e, 0x3d]);
interface ISpPhraseAlt : ISpPhrase
{
    HRESULT GetAltInfo(ISpPhrase* ppParent, uint* pulStartElementInParent, uint* pcElementsInParent, uint* pcElementsInAlt);
    HRESULT Commit();
}
alias SPXMLRESULTOPTIONS = int;
enum : int
{
    SPXRO_SML            = 0x00000000,
    SPXRO_Alternates_SML = 0x00000001,
}

enum IID_ISpPhrase2 = GUID(0xf264da52, 0xe457, 0x4696, [0xb8, 0x56, 0xa7, 0x37, 0xb7, 0x17, 0xaf, 0x79]);
interface ISpPhrase2 : ISpPhrase
{
    HRESULT GetXMLResult(PWSTR* ppszCoMemXMLResult, SPXMLRESULTOPTIONS Options);
    HRESULT GetXMLErrorInfo(SPSEMANTICERRORINFO* pSemanticErrorInfo);
    HRESULT GetAudio(uint ulStartElement, uint cElements, ISpStreamFormat* ppStream);
}
struct SPRECORESULTTIMES
{
    FILETIME ftStreamTime;
    ulong ullLength;
    uint dwTickCount;
    ulong ullStart;
}
struct SPSERIALIZEDRESULT
{
    uint ulSerializedSize;
}
enum IID_ISpRecoResult = GUID(0x20b053be, 0xe235, 0x43cd, [0x9a, 0x2a, 0x8d, 0x17, 0xa4, 0x8b, 0x78, 0x42]);
interface ISpRecoResult : ISpPhrase
{
    HRESULT GetResultTimes(SPRECORESULTTIMES* pTimes);
    HRESULT GetAlternates(uint ulStartElement, uint cElements, uint ulRequestCount, ISpPhraseAlt* ppPhrases, uint* pcPhrasesReturned);
    HRESULT GetAudio(uint ulStartElement, uint cElements, ISpStreamFormat* ppStream);
    HRESULT SpeakAudio(uint ulStartElement, uint cElements, uint dwFlags, uint* pulStreamNumber);
    HRESULT Serialize(SPSERIALIZEDRESULT** ppCoMemSerializedResult);
    HRESULT ScaleAudio(const(GUID)* pAudioFormatId, const(WAVEFORMATEX)* pWaveFormatEx);
    HRESULT GetRecoContext(ISpRecoContext* ppRecoContext);
}
alias SPCOMMITFLAGS = int;
enum : int
{
    SPCF_NONE                = 0x00000000,
    SPCF_ADD_TO_USER_LEXICON = 0x00000001,
    SPCF_DEFINITE_CORRECTION = 0x00000002,
}

enum IID_ISpRecoResult2 = GUID(0x27cac6c4, 0x88f2, 0x41f2, [0x88, 0x17, 0xc, 0x95, 0xe5, 0x9f, 0x1e, 0x6e]);
interface ISpRecoResult2 : ISpRecoResult
{
    HRESULT CommitAlternate(ISpPhraseAlt pPhraseAlt, ISpRecoResult* ppNewResult);
    HRESULT CommitText(uint ulStartElement, uint cElements, const(wchar)* pszCorrectedData, uint eCommitFlags);
    HRESULT SetTextFeedback(const(wchar)* pszFeedback, BOOL fSuccessful);
}
enum IID_ISpXMLRecoResult = GUID(0xae39362b, 0x45a8, 0x4074, [0x9b, 0x9e, 0xcc, 0xf4, 0x9a, 0xa2, 0xd0, 0xb6]);
interface ISpXMLRecoResult : ISpRecoResult
{
    HRESULT GetXMLResult(PWSTR* ppszCoMemXMLResult, SPXMLRESULTOPTIONS Options);
    HRESULT GetXMLErrorInfo(SPSEMANTICERRORINFO* pSemanticErrorInfo);
}
struct SPTEXTSELECTIONINFO
{
    uint ulStartActiveOffset;
    uint cchActiveChars;
    uint ulStartSelection;
    uint cchSelection;
}
alias SPWORDPRONOUNCEABLE = int;
enum : int
{
    SPWP_UNKNOWN_WORD_UNPRONOUNCEABLE = 0x00000000,
    SPWP_UNKNOWN_WORD_PRONOUNCEABLE   = 0x00000001,
    SPWP_KNOWN_WORD_PRONOUNCEABLE     = 0x00000002,
}

alias SPGRAMMARSTATE = int;
enum : int
{
    SPGS_DISABLED  = 0x00000000,
    SPGS_ENABLED   = 0x00000001,
    SPGS_EXCLUSIVE = 0x00000003,
}

alias SPCONTEXTSTATE = int;
enum : int
{
    SPCS_DISABLED = 0x00000000,
    SPCS_ENABLED  = 0x00000001,
}

alias SPRULESTATE = int;
enum : int
{
    SPRS_INACTIVE               = 0x00000000,
    SPRS_ACTIVE                 = 0x00000001,
    SPRS_ACTIVE_WITH_AUTO_PAUSE = 0x00000003,
    SPRS_ACTIVE_USER_DELIMITED  = 0x00000004,
}

alias SPGRAMMARWORDTYPE = int;
enum : int
{
    SPWT_DISPLAY                  = 0x00000000,
    SPWT_LEXICAL                  = 0x00000001,
    SPWT_PRONUNCIATION            = 0x00000002,
    SPWT_LEXICAL_NO_SPECIAL_CHARS = 0x00000003,
}

struct SPPROPERTYINFO
{
    const(wchar)* pszName;
    uint ulId;
    const(wchar)* pszValue;
    VARIANT vValue;
}
alias SPCFGRULEATTRIBUTES = int;
enum : int
{
    SPRAF_TopLevel      = 0x00000001,
    SPRAF_Active        = 0x00000002,
    SPRAF_Export        = 0x00000004,
    SPRAF_Import        = 0x00000008,
    SPRAF_Interpreter   = 0x00000010,
    SPRAF_Dynamic       = 0x00000020,
    SPRAF_Root          = 0x00000040,
    SPRAF_AutoPause     = 0x00010000,
    SPRAF_UserDelimited = 0x00020000,
}

enum IID_ISpGrammarBuilder = GUID(0x8137828f, 0x591a, 0x4a42, [0xbe, 0x58, 0x49, 0xea, 0x7e, 0xba, 0xac, 0x68]);
interface ISpGrammarBuilder : IUnknown
{
    HRESULT ResetGrammar(ushort NewLanguage);
    HRESULT GetRule(const(wchar)* pszRuleName, uint dwRuleId, uint dwAttributes, BOOL fCreateIfNotExist, SPSTATEHANDLE* phInitialState);
    HRESULT ClearRule(SPSTATEHANDLE hState);
    HRESULT CreateNewState(SPSTATEHANDLE hState, SPSTATEHANDLE* phState);
    HRESULT AddWordTransition(SPSTATEHANDLE hFromState, SPSTATEHANDLE hToState, const(wchar)* psz, const(wchar)* pszSeparators, SPGRAMMARWORDTYPE eWordType, float Weight, const(SPPROPERTYINFO)* pPropInfo);
    HRESULT AddRuleTransition(SPSTATEHANDLE hFromState, SPSTATEHANDLE hToState, SPSTATEHANDLE hRule, float Weight, const(SPPROPERTYINFO)* pPropInfo);
    HRESULT AddResource(SPSTATEHANDLE hRuleState, const(wchar)* pszResourceName, const(wchar)* pszResourceValue);
    HRESULT Commit(uint dwReserved);
}
alias SPLOADOPTIONS = int;
enum : int
{
    SPLO_STATIC  = 0x00000000,
    SPLO_DYNAMIC = 0x00000001,
}

enum IID_ISpRecoGrammar = GUID(0x2177db29, 0x7f45, 0x47d0, [0x85, 0x54, 0x6, 0x7e, 0x91, 0xc8, 0x5, 0x2]);
interface ISpRecoGrammar : ISpGrammarBuilder
{
    HRESULT GetGrammarId(ulong* pullGrammarId);
    HRESULT GetRecoContext(ISpRecoContext* ppRecoCtxt);
    HRESULT LoadCmdFromFile(const(wchar)* pszFileName, SPLOADOPTIONS Options);
    HRESULT LoadCmdFromObject(const(GUID)* rcid, const(wchar)* pszGrammarName, SPLOADOPTIONS Options);
    HRESULT LoadCmdFromResource(HMODULE hModule, const(wchar)* pszResourceName, const(wchar)* pszResourceType, ushort wLanguage, SPLOADOPTIONS Options);
    HRESULT LoadCmdFromMemory(const(SPBINARYGRAMMAR)* pGrammar, SPLOADOPTIONS Options);
    HRESULT LoadCmdFromProprietaryGrammar(const(GUID)* rguidParam, const(wchar)* pszStringParam, const(void)* pvDataPrarm, uint cbDataSize, SPLOADOPTIONS Options);
    HRESULT SetRuleState(const(wchar)* pszName, void* pReserved, SPRULESTATE NewState);
    HRESULT SetRuleIdState(uint ulRuleId, SPRULESTATE NewState);
    HRESULT LoadDictation(const(wchar)* pszTopicName, SPLOADOPTIONS Options);
    HRESULT UnloadDictation();
    HRESULT SetDictationState(SPRULESTATE NewState);
    HRESULT SetWordSequenceData(const(wchar)* pText, uint cchText, const(SPTEXTSELECTIONINFO)* pInfo);
    HRESULT SetTextSelection(const(SPTEXTSELECTIONINFO)* pInfo);
    HRESULT IsPronounceable(const(wchar)* pszWord, SPWORDPRONOUNCEABLE* pWordPronounceable);
    HRESULT SetGrammarState(SPGRAMMARSTATE eGrammarState);
    HRESULT SaveCmd(IStream pStream, PWSTR* ppszCoMemErrorText);
    HRESULT GetGrammarState(SPGRAMMARSTATE* peGrammarState);
}
alias SPMATCHINGMODE = int;
enum : int
{
    AllWords                     = 0x00000000,
    Subsequence                  = 0x00000001,
    OrderedSubset                = 0x00000003,
    SubsequenceContentRequired   = 0x00000005,
    OrderedSubsetContentRequired = 0x00000007,
}

alias PHONETICALPHABET = int;
enum : int
{
    PA_Ipa  = 0x00000000,
    PA_Ups  = 0x00000001,
    PA_Sapi = 0x00000002,
}

enum IID_ISpGrammarBuilder2 = GUID(0x8ab10026, 0x20cc, 0x4b20, [0x8c, 0x22, 0xa4, 0x9c, 0x9b, 0xa7, 0x8f, 0x60]);
interface ISpGrammarBuilder2 : IUnknown
{
    HRESULT AddTextSubset(SPSTATEHANDLE hFromState, SPSTATEHANDLE hToState, const(wchar)* psz, SPMATCHINGMODE eMatchMode);
    HRESULT SetPhoneticAlphabet(PHONETICALPHABET phoneticALphabet);
}
enum IID_ISpRecoGrammar2 = GUID(0x4b37bc9e, 0x9ed6, 0x44a3, [0x93, 0xd3, 0x18, 0xf0, 0x22, 0xb7, 0x9e, 0xc3]);
interface ISpRecoGrammar2 : IUnknown
{
    HRESULT GetRules(SPRULE** ppCoMemRules, uint* puNumRules);
    HRESULT LoadCmdFromFile2(const(wchar)* pszFileName, SPLOADOPTIONS Options, const(wchar)* pszSharingUri, const(wchar)* pszBaseUri);
    HRESULT LoadCmdFromMemory2(const(SPBINARYGRAMMAR)* pGrammar, SPLOADOPTIONS Options, const(wchar)* pszSharingUri, const(wchar)* pszBaseUri);
    HRESULT SetRulePriority(const(wchar)* pszRuleName, uint ulRuleId, int nRulePriority);
    HRESULT SetRuleWeight(const(wchar)* pszRuleName, uint ulRuleId, float flWeight);
    HRESULT SetDictationWeight(float flWeight);
    HRESULT SetGrammarLoader(ISpeechResourceLoader pLoader);
    HRESULT SetSMLSecurityManager(IInternetSecurityManager pSMLSecurityManager);
}
enum IID_ISpeechResourceLoader = GUID(0xb9ac5783, 0xfcd0, 0x4b21, [0xb1, 0x19, 0xb4, 0xf8, 0xda, 0x8f, 0xd2, 0xc3]);
interface ISpeechResourceLoader : IDispatch
{
    HRESULT LoadResource(BSTR bstrResourceUri, VARIANT_BOOL fAlwaysReload, IUnknown* pStream, BSTR* pbstrMIMEType, VARIANT_BOOL* pfModified, BSTR* pbstrRedirectUrl);
    HRESULT GetLocalCopy(BSTR bstrResourceUri, BSTR* pbstrLocalPath, BSTR* pbstrMIMEType, BSTR* pbstrRedirectUrl);
    HRESULT ReleaseLocalCopy(BSTR pbstrLocalPath);
}
struct SPRECOCONTEXTSTATUS
{
    SPINTERFERENCE eInterference;
    wchar[255] szRequestTypeOfUI;
    uint dwReserved1;
    uint dwReserved2;
}
alias SPBOOKMARKOPTIONS = int;
enum : int
{
    SPBO_NONE       = 0x00000000,
    SPBO_PAUSE      = 0x00000001,
    SPBO_AHEAD      = 0x00000002,
    SPBO_TIME_UNITS = 0x00000004,
}

alias SPAUDIOOPTIONS = int;
enum : int
{
    SPAO_NONE         = 0x00000000,
    SPAO_RETAIN_AUDIO = 0x00000001,
}

enum IID_ISpRecoContext = GUID(0xf740a62f, 0x7c15, 0x489e, [0x82, 0x34, 0x94, 0xa, 0x33, 0xd9, 0x27, 0x2d]);
interface ISpRecoContext : ISpEventSource
{
    HRESULT GetRecognizer(ISpRecognizer* ppRecognizer);
    HRESULT CreateGrammar(ulong ullGrammarId, ISpRecoGrammar* ppGrammar);
    HRESULT GetStatus(SPRECOCONTEXTSTATUS* pStatus);
    HRESULT GetMaxAlternates(uint* pcAlternates);
    HRESULT SetMaxAlternates(uint cAlternates);
    HRESULT SetAudioOptions(SPAUDIOOPTIONS Options, const(GUID)* pAudioFormatId, const(WAVEFORMATEX)* pWaveFormatEx);
    HRESULT GetAudioOptions(SPAUDIOOPTIONS* pOptions, GUID* pAudioFormatId, WAVEFORMATEX** ppCoMemWFEX);
    HRESULT DeserializeResult(const(SPSERIALIZEDRESULT)* pSerializedResult, ISpRecoResult* ppResult);
    HRESULT Bookmark(SPBOOKMARKOPTIONS Options, ulong ullStreamPosition, LPARAM lparamEvent);
    HRESULT SetAdaptationData(const(wchar)* pAdaptationData, const(uint) cch);
    HRESULT Pause(uint dwReserved);
    HRESULT Resume(uint dwReserved);
    HRESULT SetVoice(ISpVoice pVoice, BOOL fAllowFormatChanges);
    HRESULT GetVoice(ISpVoice* ppVoice);
    HRESULT SetVoicePurgeEvent(ulong ullEventInterest);
    HRESULT GetVoicePurgeEvent(ulong* pullEventInterest);
    HRESULT SetContextState(SPCONTEXTSTATE eContextState);
    HRESULT GetContextState(SPCONTEXTSTATE* peContextState);
}
alias SPGRAMMAROPTIONS = int;
enum : int
{
    SPGO_SAPI            = 0x00000001,
    SPGO_SRGS            = 0x00000002,
    SPGO_UPS             = 0x00000004,
    SPGO_SRGS_MS_SCRIPT  = 0x00000008,
    SPGO_SRGS_W3C_SCRIPT = 0x00000100,
    SPGO_SRGS_STG_SCRIPT = 0x00000200,
    SPGO_SRGS_SCRIPT     = 0x0000030a,
    SPGO_FILE            = 0x00000010,
    SPGO_HTTP            = 0x00000020,
    SPGO_RES             = 0x00000040,
    SPGO_OBJECT          = 0x00000080,
    SPGO_DEFAULT         = 0x000003fb,
    SPGO_ALL             = 0x000003ff,
}

alias SPADAPTATIONSETTINGS = int;
enum : int
{
    SPADS_Default              = 0x00000000,
    SPADS_CurrentRecognizer    = 0x00000001,
    SPADS_RecoProfile          = 0x00000002,
    SPADS_Immediate            = 0x00000004,
    SPADS_Reset                = 0x00000008,
    SPADS_HighVolumeDataSource = 0x00000010,
}

alias SPADAPTATIONRELEVANCE = int;
enum : int
{
    SPAR_Unknown = 0x00000000,
    SPAR_Low     = 0x00000001,
    SPAR_Medium  = 0x00000002,
    SPAR_High    = 0x00000003,
}

enum IID_ISpRecoContext2 = GUID(0xbead311c, 0x52ff, 0x437f, [0x94, 0x64, 0x6b, 0x21, 0x5, 0x4c, 0xa7, 0x3d]);
interface ISpRecoContext2 : IUnknown
{
    HRESULT SetGrammarOptions(uint eGrammarOptions);
    HRESULT GetGrammarOptions(uint* peGrammarOptions);
    HRESULT SetAdaptationData2(const(wchar)* pAdaptationData, const(uint) cch, const(wchar)* pTopicName, uint eAdaptationSettings, SPADAPTATIONRELEVANCE eRelevance);
}
enum IID_ISpProperties = GUID(0x5b4fb971, 0xb115, 0x4de1, [0xad, 0x97, 0xe4, 0x82, 0xe3, 0xbf, 0x6e, 0xe4]);
interface ISpProperties : IUnknown
{
    HRESULT SetPropertyNum(const(wchar)* pName, int lValue);
    HRESULT GetPropertyNum(const(wchar)* pName, int* plValue);
    HRESULT SetPropertyString(const(wchar)* pName, const(wchar)* pValue);
    HRESULT GetPropertyString(const(wchar)* pName, PWSTR* ppCoMemValue);
}
struct SPRECOGNIZERSTATUS
{
    SPAUDIOSTATUS AudioStatus;
    ulong ullRecognitionStreamPos;
    uint ulStreamNumber;
    uint ulNumActive;
    GUID clsidEngine;
    uint cLangIDs;
    ushort[20] aLangID;
    ulong ullRecognitionStreamTime;
}
alias SPSTREAMFORMATTYPE = int;
enum : int
{
    SPWF_INPUT    = 0x00000000,
    SPWF_SRENGINE = 0x00000001,
}

alias SPRECOSTATE = int;
enum : int
{
    SPRST_INACTIVE            = 0x00000000,
    SPRST_ACTIVE              = 0x00000001,
    SPRST_ACTIVE_ALWAYS       = 0x00000002,
    SPRST_INACTIVE_WITH_PURGE = 0x00000003,
    SPRST_NUM_STATES          = 0x00000004,
}

enum IID_ISpRecognizer = GUID(0xc2b5f241, 0xdaa0, 0x4507, [0x9e, 0x16, 0x5a, 0x1e, 0xaa, 0x2b, 0x7a, 0x5c]);
interface ISpRecognizer : ISpProperties
{
    HRESULT SetRecognizer(ISpObjectToken pRecognizer);
    HRESULT GetRecognizer(ISpObjectToken* ppRecognizer);
    HRESULT SetInput(IUnknown pUnkInput, BOOL fAllowFormatChanges);
    HRESULT GetInputObjectToken(ISpObjectToken* ppToken);
    HRESULT GetInputStream(ISpStreamFormat* ppStream);
    HRESULT CreateRecoContext(ISpRecoContext* ppNewCtxt);
    HRESULT GetRecoProfile(ISpObjectToken* ppToken);
    HRESULT SetRecoProfile(ISpObjectToken pToken);
    HRESULT IsSharedInstance();
    HRESULT GetRecoState(SPRECOSTATE* pState);
    HRESULT SetRecoState(SPRECOSTATE NewState);
    HRESULT GetStatus(SPRECOGNIZERSTATUS* pStatus);
    HRESULT GetFormat(SPSTREAMFORMATTYPE WaveFormatType, GUID* pFormatId, WAVEFORMATEX** ppCoMemWFEX);
    HRESULT IsUISupported(const(wchar)* pszTypeOfUI, void* pvExtraData, uint cbExtraData, BOOL* pfSupported);
    HRESULT DisplayUI(HWND hwndParent, const(wchar)* pszTitle, const(wchar)* pszTypeOfUI, void* pvExtraData, uint cbExtraData);
    HRESULT EmulateRecognition(ISpPhrase pPhrase);
}
enum IID_ISpSerializeState = GUID(0x21b501a0, 0xec7, 0x46c9, [0x92, 0xc3, 0xa2, 0xbc, 0x78, 0x4c, 0x54, 0xb9]);
interface ISpSerializeState : IUnknown
{
    HRESULT GetSerializedState(ubyte** ppbData, uint* pulSize, uint dwReserved);
    HRESULT SetSerializedState(ubyte* pbData, uint ulSize, uint dwReserved);
}
enum IID_ISpRecognizer2 = GUID(0x8fc6d974, 0xc81e, 0x4098, [0x93, 0xc5, 0x1, 0x47, 0xf6, 0x1e, 0xd4, 0xd3]);
interface ISpRecognizer2 : IUnknown
{
    HRESULT EmulateRecognitionEx(ISpPhrase pPhrase, uint dwCompareFlags);
    HRESULT SetTrainingState(BOOL fDoingTraining, BOOL fAdaptFromTrainingData);
    HRESULT ResetAcousticModelAdaptation();
}
struct SPNORMALIZATIONLIST
{
    uint ulSize;
    ushort** ppszzNormalizedList;
}
enum IID_ISpEnginePronunciation = GUID(0xc360ce4b, 0x76d1, 0x4214, [0xad, 0x68, 0x52, 0x65, 0x7d, 0x50, 0x83, 0xda]);
interface ISpEnginePronunciation : IUnknown
{
    HRESULT Normalize(const(wchar)* pszWord, const(wchar)* pszLeftContext, const(wchar)* pszRightContext, ushort LangID, SPNORMALIZATIONLIST* pNormalizationList);
    HRESULT GetPronunciations(const(wchar)* pszWord, const(wchar)* pszLeftContext, const(wchar)* pszRightContext, ushort LangID, SPWORDPRONUNCIATIONLIST* pEnginePronunciationList);
}
struct SPDISPLAYTOKEN
{
    const(wchar)* pszLexical;
    const(wchar)* pszDisplay;
    ubyte bDisplayAttributes;
}
struct SPDISPLAYPHRASE
{
    uint ulNumTokens;
    SPDISPLAYTOKEN* pTokens;
}
enum IID_ISpDisplayAlternates = GUID(0xc8d7c7e2, 0xdde, 0x44b7, [0xaf, 0xe3, 0xb0, 0xc9, 0x91, 0xfb, 0xeb, 0x5e]);
interface ISpDisplayAlternates : IUnknown
{
    HRESULT GetDisplayAlternates(const(SPDISPLAYPHRASE)* pPhrase, uint cRequestCount, SPDISPLAYPHRASE** ppCoMemPhrases, uint* pcPhrasesReturned);
    HRESULT SetFullStopTrailSpace(uint ulTrailSpace);
}
alias DISPID_SpeechDataKey = int;
enum : int
{
    DISPID_SDKSetBinaryValue = 0x00000001,
    DISPID_SDKGetBinaryValue = 0x00000002,
    DISPID_SDKSetStringValue = 0x00000003,
    DISPID_SDKGetStringValue = 0x00000004,
    DISPID_SDKSetLongValue   = 0x00000005,
    DISPID_SDKGetlongValue   = 0x00000006,
    DISPID_SDKOpenKey        = 0x00000007,
    DISPID_SDKCreateKey      = 0x00000008,
    DISPID_SDKDeleteKey      = 0x00000009,
    DISPID_SDKDeleteValue    = 0x0000000a,
    DISPID_SDKEnumKeys       = 0x0000000b,
    DISPID_SDKEnumValues     = 0x0000000c,
}

alias DISPID_SpeechObjectToken = int;
enum : int
{
    DISPID_SOTId                    = 0x00000001,
    DISPID_SOTDataKey               = 0x00000002,
    DISPID_SOTCategory              = 0x00000003,
    DISPID_SOTGetDescription        = 0x00000004,
    DISPID_SOTSetId                 = 0x00000005,
    DISPID_SOTGetAttribute          = 0x00000006,
    DISPID_SOTCreateInstance        = 0x00000007,
    DISPID_SOTRemove                = 0x00000008,
    DISPID_SOTGetStorageFileName    = 0x00000009,
    DISPID_SOTRemoveStorageFileName = 0x0000000a,
    DISPID_SOTIsUISupported         = 0x0000000b,
    DISPID_SOTDisplayUI             = 0x0000000c,
    DISPID_SOTMatchesAttributes     = 0x0000000d,
}

alias SpeechDataKeyLocation = int;
enum : int
{
    SDKLDefaultLocation = 0x00000000,
    SDKLCurrentUser     = 0x00000001,
    SDKLLocalMachine    = 0x00000002,
    SDKLCurrentConfig   = 0x00000005,
}

alias SpeechTokenContext = uint;
enum : uint
{
    STCInprocServer  = 0x00000001,
    STCInprocHandler = 0x00000002,
    STCLocalServer   = 0x00000004,
    STCRemoteServer  = 0x00000010,
    STCAll           = 0x00000017,
}

alias SpeechTokenShellFolder = int;
enum : int
{
    STSF_AppData       = 0x0000001a,
    STSF_LocalAppData  = 0x0000001c,
    STSF_CommonAppData = 0x00000023,
    STSF_FlagCreate    = 0x00008000,
}

alias DISPID_SpeechObjectTokens = int;
enum : int
{
    DISPID_SOTsCount    = 0x00000001,
    DISPID_SOTsItem     = 0x00000000,
    DISPID_SOTs_NewEnum = 0xfffffffc,
}

alias DISPID_SpeechObjectTokenCategory = int;
enum : int
{
    DISPID_SOTCId              = 0x00000001,
    DISPID_SOTCDefault         = 0x00000002,
    DISPID_SOTCSetId           = 0x00000003,
    DISPID_SOTCGetDataKey      = 0x00000004,
    DISPID_SOTCEnumerateTokens = 0x00000005,
}

alias SpeechAudioFormatType = int;
enum : int
{
    SAFTDefault                 = 0xffffffff,
    SAFTNoAssignedFormat        = 0x00000000,
    SAFTText                    = 0x00000001,
    SAFTNonStandardFormat       = 0x00000002,
    SAFTExtendedAudioFormat     = 0x00000003,
    SAFT8kHz8BitMono            = 0x00000004,
    SAFT8kHz8BitStereo          = 0x00000005,
    SAFT8kHz16BitMono           = 0x00000006,
    SAFT8kHz16BitStereo         = 0x00000007,
    SAFT11kHz8BitMono           = 0x00000008,
    SAFT11kHz8BitStereo         = 0x00000009,
    SAFT11kHz16BitMono          = 0x0000000a,
    SAFT11kHz16BitStereo        = 0x0000000b,
    SAFT12kHz8BitMono           = 0x0000000c,
    SAFT12kHz8BitStereo         = 0x0000000d,
    SAFT12kHz16BitMono          = 0x0000000e,
    SAFT12kHz16BitStereo        = 0x0000000f,
    SAFT16kHz8BitMono           = 0x00000010,
    SAFT16kHz8BitStereo         = 0x00000011,
    SAFT16kHz16BitMono          = 0x00000012,
    SAFT16kHz16BitStereo        = 0x00000013,
    SAFT22kHz8BitMono           = 0x00000014,
    SAFT22kHz8BitStereo         = 0x00000015,
    SAFT22kHz16BitMono          = 0x00000016,
    SAFT22kHz16BitStereo        = 0x00000017,
    SAFT24kHz8BitMono           = 0x00000018,
    SAFT24kHz8BitStereo         = 0x00000019,
    SAFT24kHz16BitMono          = 0x0000001a,
    SAFT24kHz16BitStereo        = 0x0000001b,
    SAFT32kHz8BitMono           = 0x0000001c,
    SAFT32kHz8BitStereo         = 0x0000001d,
    SAFT32kHz16BitMono          = 0x0000001e,
    SAFT32kHz16BitStereo        = 0x0000001f,
    SAFT44kHz8BitMono           = 0x00000020,
    SAFT44kHz8BitStereo         = 0x00000021,
    SAFT44kHz16BitMono          = 0x00000022,
    SAFT44kHz16BitStereo        = 0x00000023,
    SAFT48kHz8BitMono           = 0x00000024,
    SAFT48kHz8BitStereo         = 0x00000025,
    SAFT48kHz16BitMono          = 0x00000026,
    SAFT48kHz16BitStereo        = 0x00000027,
    SAFTTrueSpeech_8kHz1BitMono = 0x00000028,
    SAFTCCITT_ALaw_8kHzMono     = 0x00000029,
    SAFTCCITT_ALaw_8kHzStereo   = 0x0000002a,
    SAFTCCITT_ALaw_11kHzMono    = 0x0000002b,
    SAFTCCITT_ALaw_11kHzStereo  = 0x0000002c,
    SAFTCCITT_ALaw_22kHzMono    = 0x0000002d,
    SAFTCCITT_ALaw_22kHzStereo  = 0x0000002e,
    SAFTCCITT_ALaw_44kHzMono    = 0x0000002f,
    SAFTCCITT_ALaw_44kHzStereo  = 0x00000030,
    SAFTCCITT_uLaw_8kHzMono     = 0x00000031,
    SAFTCCITT_uLaw_8kHzStereo   = 0x00000032,
    SAFTCCITT_uLaw_11kHzMono    = 0x00000033,
    SAFTCCITT_uLaw_11kHzStereo  = 0x00000034,
    SAFTCCITT_uLaw_22kHzMono    = 0x00000035,
    SAFTCCITT_uLaw_22kHzStereo  = 0x00000036,
    SAFTCCITT_uLaw_44kHzMono    = 0x00000037,
    SAFTCCITT_uLaw_44kHzStereo  = 0x00000038,
    SAFTADPCM_8kHzMono          = 0x00000039,
    SAFTADPCM_8kHzStereo        = 0x0000003a,
    SAFTADPCM_11kHzMono         = 0x0000003b,
    SAFTADPCM_11kHzStereo       = 0x0000003c,
    SAFTADPCM_22kHzMono         = 0x0000003d,
    SAFTADPCM_22kHzStereo       = 0x0000003e,
    SAFTADPCM_44kHzMono         = 0x0000003f,
    SAFTADPCM_44kHzStereo       = 0x00000040,
    SAFTGSM610_8kHzMono         = 0x00000041,
    SAFTGSM610_11kHzMono        = 0x00000042,
    SAFTGSM610_22kHzMono        = 0x00000043,
    SAFTGSM610_44kHzMono        = 0x00000044,
}

alias DISPID_SpeechAudioFormat = int;
enum : int
{
    DISPID_SAFType            = 0x00000001,
    DISPID_SAFGuid            = 0x00000002,
    DISPID_SAFGetWaveFormatEx = 0x00000003,
    DISPID_SAFSetWaveFormatEx = 0x00000004,
}

alias DISPID_SpeechBaseStream = int;
enum : int
{
    DISPID_SBSFormat = 0x00000001,
    DISPID_SBSRead   = 0x00000002,
    DISPID_SBSWrite  = 0x00000003,
    DISPID_SBSSeek   = 0x00000004,
}

alias SpeechStreamSeekPositionType = uint;
enum : uint
{
    SSSPTRelativeToStart           = 0x00000000,
    SSSPTRelativeToCurrentPosition = 0x00000001,
    SSSPTRelativeToEnd             = 0x00000002,
}

alias DISPID_SpeechAudio = int;
enum : int
{
    DISPID_SAStatus           = 0x000000c8,
    DISPID_SABufferInfo       = 0x000000c9,
    DISPID_SADefaultFormat    = 0x000000ca,
    DISPID_SAVolume           = 0x000000cb,
    DISPID_SABufferNotifySize = 0x000000cc,
    DISPID_SAEventHandle      = 0x000000cd,
    DISPID_SASetState         = 0x000000ce,
}

alias SpeechAudioState = int;
enum : int
{
    SASClosed = 0x00000000,
    SASStop   = 0x00000001,
    SASPause  = 0x00000002,
    SASRun    = 0x00000003,
}

alias DISPID_SpeechMMSysAudio = int;
enum : int
{
    DISPID_SMSADeviceId = 0x0000012c,
    DISPID_SMSALineId   = 0x0000012d,
    DISPID_SMSAMMHandle = 0x0000012e,
}

alias DISPID_SpeechFileStream = int;
enum : int
{
    DISPID_SFSOpen  = 0x00000064,
    DISPID_SFSClose = 0x00000065,
}

alias SpeechStreamFileMode = int;
enum : int
{
    SSFMOpenForRead    = 0x00000000,
    SSFMOpenReadWrite  = 0x00000001,
    SSFMCreate         = 0x00000002,
    SSFMCreateForWrite = 0x00000003,
}

alias DISPID_SpeechCustomStream = int;
enum : int
{
    DISPID_SCSBaseStream = 0x00000064,
}

alias DISPID_SpeechMemoryStream = int;
enum : int
{
    DISPID_SMSSetData = 0x00000064,
    DISPID_SMSGetData = 0x00000065,
}

alias DISPID_SpeechAudioStatus = int;
enum : int
{
    DISPID_SASFreeBufferSpace       = 0x00000001,
    DISPID_SASNonBlockingIO         = 0x00000002,
    DISPID_SASState                 = 0x00000003,
    DISPID_SASCurrentSeekPosition   = 0x00000004,
    DISPID_SASCurrentDevicePosition = 0x00000005,
}

alias DISPID_SpeechAudioBufferInfo = int;
enum : int
{
    DISPID_SABIMinNotification = 0x00000001,
    DISPID_SABIBufferSize      = 0x00000002,
    DISPID_SABIEventBias       = 0x00000003,
}

alias DISPID_SpeechWaveFormatEx = int;
enum : int
{
    DISPID_SWFEFormatTag      = 0x00000001,
    DISPID_SWFEChannels       = 0x00000002,
    DISPID_SWFESamplesPerSec  = 0x00000003,
    DISPID_SWFEAvgBytesPerSec = 0x00000004,
    DISPID_SWFEBlockAlign     = 0x00000005,
    DISPID_SWFEBitsPerSample  = 0x00000006,
    DISPID_SWFEExtraData      = 0x00000007,
}

alias DISPID_SpeechVoice = int;
enum : int
{
    DISPID_SVStatus                                = 0x00000001,
    DISPID_SVVoice                                 = 0x00000002,
    DISPID_SVAudioOutput                           = 0x00000003,
    DISPID_SVAudioOutputStream                     = 0x00000004,
    DISPID_SVRate                                  = 0x00000005,
    DISPID_SVVolume                                = 0x00000006,
    DISPID_SVAllowAudioOuputFormatChangesOnNextSet = 0x00000007,
    DISPID_SVEventInterests                        = 0x00000008,
    DISPID_SVPriority                              = 0x00000009,
    DISPID_SVAlertBoundary                         = 0x0000000a,
    DISPID_SVSyncronousSpeakTimeout                = 0x0000000b,
    DISPID_SVSpeak                                 = 0x0000000c,
    DISPID_SVSpeakStream                           = 0x0000000d,
    DISPID_SVPause                                 = 0x0000000e,
    DISPID_SVResume                                = 0x0000000f,
    DISPID_SVSkip                                  = 0x00000010,
    DISPID_SVGetVoices                             = 0x00000011,
    DISPID_SVGetAudioOutputs                       = 0x00000012,
    DISPID_SVWaitUntilDone                         = 0x00000013,
    DISPID_SVSpeakCompleteEvent                    = 0x00000014,
    DISPID_SVIsUISupported                         = 0x00000015,
    DISPID_SVDisplayUI                             = 0x00000016,
}

alias SpeechVoicePriority = int;
enum : int
{
    SVPNormal = 0x00000000,
    SVPAlert  = 0x00000001,
    SVPOver   = 0x00000002,
}

alias SpeechVoiceSpeakFlags = int;
enum : int
{
    SVSFDefault          = 0x00000000,
    SVSFlagsAsync        = 0x00000001,
    SVSFPurgeBeforeSpeak = 0x00000002,
    SVSFIsFilename       = 0x00000004,
    SVSFIsXML            = 0x00000008,
    SVSFIsNotXML         = 0x00000010,
    SVSFPersistXML       = 0x00000020,
    SVSFNLPSpeakPunc     = 0x00000040,
    SVSFParseSapi        = 0x00000080,
    SVSFParseSsml        = 0x00000100,
    SVSFParseAutodetect  = 0x00000000,
    SVSFNLPMask          = 0x00000040,
    SVSFParseMask        = 0x00000180,
    SVSFVoiceMask        = 0x000001ff,
    SVSFUnusedFlags      = 0xfffffe00,
}

alias SpeechVoiceEvents = int;
enum : int
{
    SVEStartInputStream = 0x00000002,
    SVEEndInputStream   = 0x00000004,
    SVEVoiceChange      = 0x00000008,
    SVEBookmark         = 0x00000010,
    SVEWordBoundary     = 0x00000020,
    SVEPhoneme          = 0x00000040,
    SVESentenceBoundary = 0x00000080,
    SVEViseme           = 0x00000100,
    SVEAudioLevel       = 0x00000200,
    SVEPrivate          = 0x00008000,
    SVEAllEvents        = 0x000083fe,
}

alias DISPID_SpeechVoiceStatus = int;
enum : int
{
    DISPID_SVSCurrentStreamNumber    = 0x00000001,
    DISPID_SVSLastStreamNumberQueued = 0x00000002,
    DISPID_SVSLastResult             = 0x00000003,
    DISPID_SVSRunningState           = 0x00000004,
    DISPID_SVSInputWordPosition      = 0x00000005,
    DISPID_SVSInputWordLength        = 0x00000006,
    DISPID_SVSInputSentencePosition  = 0x00000007,
    DISPID_SVSInputSentenceLength    = 0x00000008,
    DISPID_SVSLastBookmark           = 0x00000009,
    DISPID_SVSLastBookmarkId         = 0x0000000a,
    DISPID_SVSPhonemeId              = 0x0000000b,
    DISPID_SVSVisemeId               = 0x0000000c,
}

alias SpeechRunState = int;
enum : int
{
    SRSEDone       = 0x00000001,
    SRSEIsSpeaking = 0x00000002,
}

alias SpeechVisemeType = int;
enum : int
{
    SVP_0   = 0x00000000,
    SVP_1   = 0x00000001,
    SVP_2   = 0x00000002,
    SVP_3   = 0x00000003,
    SVP_4   = 0x00000004,
    SVP_5   = 0x00000005,
    SVP_6   = 0x00000006,
    SVP_7   = 0x00000007,
    SVP_8   = 0x00000008,
    SVP_9   = 0x00000009,
    SVP_10  = 0x0000000a,
    SVP_11  = 0x0000000b,
    SVP_12  = 0x0000000c,
    SVP_13  = 0x0000000d,
    SVP_14  = 0x0000000e,
    SVP_15  = 0x0000000f,
    SVP_16  = 0x00000010,
    SVP_17  = 0x00000011,
    SVP_18  = 0x00000012,
    SVP_19  = 0x00000013,
    SVP_20  = 0x00000014,
    SVP_21  = 0x00000015,
}

alias SpeechVisemeFeature = int;
enum : int
{
    SVF_None     = 0x00000000,
    SVF_Stressed = 0x00000001,
    SVF_Emphasis = 0x00000002,
}

alias DISPID_SpeechVoiceEvent = int;
enum : int
{
    DISPID_SVEStreamStart      = 0x00000001,
    DISPID_SVEStreamEnd        = 0x00000002,
    DISPID_SVEVoiceChange      = 0x00000003,
    DISPID_SVEBookmark         = 0x00000004,
    DISPID_SVEWord             = 0x00000005,
    DISPID_SVEPhoneme          = 0x00000006,
    DISPID_SVESentenceBoundary = 0x00000007,
    DISPID_SVEViseme           = 0x00000008,
    DISPID_SVEAudioLevel       = 0x00000009,
    DISPID_SVEEnginePrivate    = 0x0000000a,
}

alias DISPID_SpeechRecognizer = int;
enum : int
{
    DISPID_SRRecognizer                            = 0x00000001,
    DISPID_SRAllowAudioInputFormatChangesOnNextSet = 0x00000002,
    DISPID_SRAudioInput                            = 0x00000003,
    DISPID_SRAudioInputStream                      = 0x00000004,
    DISPID_SRIsShared                              = 0x00000005,
    DISPID_SRState                                 = 0x00000006,
    DISPID_SRStatus                                = 0x00000007,
    DISPID_SRProfile                               = 0x00000008,
    DISPID_SREmulateRecognition                    = 0x00000009,
    DISPID_SRCreateRecoContext                     = 0x0000000a,
    DISPID_SRGetFormat                             = 0x0000000b,
    DISPID_SRSetPropertyNumber                     = 0x0000000c,
    DISPID_SRGetPropertyNumber                     = 0x0000000d,
    DISPID_SRSetPropertyString                     = 0x0000000e,
    DISPID_SRGetPropertyString                     = 0x0000000f,
    DISPID_SRIsUISupported                         = 0x00000010,
    DISPID_SRDisplayUI                             = 0x00000011,
    DISPID_SRGetRecognizers                        = 0x00000012,
    DISPID_SVGetAudioInputs                        = 0x00000013,
    DISPID_SVGetProfiles                           = 0x00000014,
}

alias SpeechRecognizerState = int;
enum : int
{
    SRSInactive          = 0x00000000,
    SRSActive            = 0x00000001,
    SRSActiveAlways      = 0x00000002,
    SRSInactiveWithPurge = 0x00000003,
}

alias SpeechDisplayAttributes = int;
enum : int
{
    SDA_No_Trailing_Space      = 0x00000000,
    SDA_One_Trailing_Space     = 0x00000002,
    SDA_Two_Trailing_Spaces    = 0x00000004,
    SDA_Consume_Leading_Spaces = 0x00000008,
}

alias SpeechFormatType = int;
enum : int
{
    SFTInput    = 0x00000000,
    SFTSREngine = 0x00000001,
}

alias SpeechEmulationCompareFlags = int;
enum : int
{
    SECFIgnoreCase     = 0x00000001,
    SECFIgnoreKanaType = 0x00010000,
    SECFIgnoreWidth    = 0x00020000,
    SECFNoSpecialChars = 0x20000000,
    SECFEmulateResult  = 0x40000000,
    SECFDefault        = 0x00030001,
}

alias DISPID_SpeechRecognizerStatus = int;
enum : int
{
    DISPID_SRSAudioStatus           = 0x00000001,
    DISPID_SRSCurrentStreamPosition = 0x00000002,
    DISPID_SRSCurrentStreamNumber   = 0x00000003,
    DISPID_SRSNumberOfActiveRules   = 0x00000004,
    DISPID_SRSClsidEngine           = 0x00000005,
    DISPID_SRSSupportedLanguages    = 0x00000006,
}

alias DISPID_SpeechRecoContext = int;
enum : int
{
    DISPID_SRCRecognizer                       = 0x00000001,
    DISPID_SRCAudioInInterferenceStatus        = 0x00000002,
    DISPID_SRCRequestedUIType                  = 0x00000003,
    DISPID_SRCVoice                            = 0x00000004,
    DISPID_SRAllowVoiceFormatMatchingOnNextSet = 0x00000005,
    DISPID_SRCVoicePurgeEvent                  = 0x00000006,
    DISPID_SRCEventInterests                   = 0x00000007,
    DISPID_SRCCmdMaxAlternates                 = 0x00000008,
    DISPID_SRCState                            = 0x00000009,
    DISPID_SRCRetainedAudio                    = 0x0000000a,
    DISPID_SRCRetainedAudioFormat              = 0x0000000b,
    DISPID_SRCPause                            = 0x0000000c,
    DISPID_SRCResume                           = 0x0000000d,
    DISPID_SRCCreateGrammar                    = 0x0000000e,
    DISPID_SRCCreateResultFromMemory           = 0x0000000f,
    DISPID_SRCBookmark                         = 0x00000010,
    DISPID_SRCSetAdaptationData                = 0x00000011,
}

alias SpeechRetainedAudioOptions = int;
enum : int
{
    SRAONone        = 0x00000000,
    SRAORetainAudio = 0x00000001,
}

alias SpeechBookmarkOptions = int;
enum : int
{
    SBONone  = 0x00000000,
    SBOPause = 0x00000001,
}

alias SpeechInterference = int;
enum : int
{
    SINone     = 0x00000000,
    SINoise    = 0x00000001,
    SINoSignal = 0x00000002,
    SITooLoud  = 0x00000003,
    SITooQuiet = 0x00000004,
    SITooFast  = 0x00000005,
    SITooSlow  = 0x00000006,
}

alias SpeechRecoEvents = int;
enum : int
{
    SREStreamEnd            = 0x00000001,
    SRESoundStart           = 0x00000002,
    SRESoundEnd             = 0x00000004,
    SREPhraseStart          = 0x00000008,
    SRERecognition          = 0x00000010,
    SREHypothesis           = 0x00000020,
    SREBookmark             = 0x00000040,
    SREPropertyNumChange    = 0x00000080,
    SREPropertyStringChange = 0x00000100,
    SREFalseRecognition     = 0x00000200,
    SREInterference         = 0x00000400,
    SRERequestUI            = 0x00000800,
    SREStateChange          = 0x00001000,
    SREAdaptation           = 0x00002000,
    SREStreamStart          = 0x00004000,
    SRERecoOtherContext     = 0x00008000,
    SREAudioLevel           = 0x00010000,
    SREPrivate              = 0x00040000,
    SREAllEvents            = 0x0005ffff,
}

alias SpeechRecoContextState = int;
enum : int
{
    SRCS_Disabled = 0x00000000,
    SRCS_Enabled  = 0x00000001,
}

alias DISPIDSPRG = int;
enum : int
{
    DISPID_SRGId                            = 0x00000001,
    DISPID_SRGRecoContext                   = 0x00000002,
    DISPID_SRGState                         = 0x00000003,
    DISPID_SRGRules                         = 0x00000004,
    DISPID_SRGReset                         = 0x00000005,
    DISPID_SRGCommit                        = 0x00000006,
    DISPID_SRGCmdLoadFromFile               = 0x00000007,
    DISPID_SRGCmdLoadFromObject             = 0x00000008,
    DISPID_SRGCmdLoadFromResource           = 0x00000009,
    DISPID_SRGCmdLoadFromMemory             = 0x0000000a,
    DISPID_SRGCmdLoadFromProprietaryGrammar = 0x0000000b,
    DISPID_SRGCmdSetRuleState               = 0x0000000c,
    DISPID_SRGCmdSetRuleIdState             = 0x0000000d,
    DISPID_SRGDictationLoad                 = 0x0000000e,
    DISPID_SRGDictationUnload               = 0x0000000f,
    DISPID_SRGDictationSetState             = 0x00000010,
    DISPID_SRGSetWordSequenceData           = 0x00000011,
    DISPID_SRGSetTextSelection              = 0x00000012,
    DISPID_SRGIsPronounceable               = 0x00000013,
}

alias SpeechLoadOption = int;
enum : int
{
    SLOStatic  = 0x00000000,
    SLODynamic = 0x00000001,
}

alias SpeechWordPronounceable = int;
enum : int
{
    SWPUnknownWordUnpronounceable = 0x00000000,
    SWPUnknownWordPronounceable   = 0x00000001,
    SWPKnownWordPronounceable     = 0x00000002,
}

alias SpeechGrammarState = int;
enum : int
{
    SGSEnabled   = 0x00000001,
    SGSDisabled  = 0x00000000,
    SGSExclusive = 0x00000003,
}

alias SpeechRuleState = int;
enum : int
{
    SGDSInactive            = 0x00000000,
    SGDSActive              = 0x00000001,
    SGDSActiveWithAutoPause = 0x00000003,
    SGDSActiveUserDelimited = 0x00000004,
}

alias SpeechRuleAttributes = int;
enum : int
{
    SRATopLevel        = 0x00000001,
    SRADefaultToActive = 0x00000002,
    SRAExport          = 0x00000004,
    SRAImport          = 0x00000008,
    SRAInterpreter     = 0x00000010,
    SRADynamic         = 0x00000020,
    SRARoot            = 0x00000040,
}

alias SpeechGrammarWordType = int;
enum : int
{
    SGDisplay               = 0x00000000,
    SGLexical               = 0x00000001,
    SGPronounciation        = 0x00000002,
    SGLexicalNoSpecialChars = 0x00000003,
}

alias DISPID_SpeechRecoContextEvents = int;
enum : int
{
    DISPID_SRCEStartStream                = 0x00000001,
    DISPID_SRCEEndStream                  = 0x00000002,
    DISPID_SRCEBookmark                   = 0x00000003,
    DISPID_SRCESoundStart                 = 0x00000004,
    DISPID_SRCESoundEnd                   = 0x00000005,
    DISPID_SRCEPhraseStart                = 0x00000006,
    DISPID_SRCERecognition                = 0x00000007,
    DISPID_SRCEHypothesis                 = 0x00000008,
    DISPID_SRCEPropertyNumberChange       = 0x00000009,
    DISPID_SRCEPropertyStringChange       = 0x0000000a,
    DISPID_SRCEFalseRecognition           = 0x0000000b,
    DISPID_SRCEInterference               = 0x0000000c,
    DISPID_SRCERequestUI                  = 0x0000000d,
    DISPID_SRCERecognizerStateChange      = 0x0000000e,
    DISPID_SRCEAdaptation                 = 0x0000000f,
    DISPID_SRCERecognitionForOtherContext = 0x00000010,
    DISPID_SRCEAudioLevel                 = 0x00000011,
    DISPID_SRCEEnginePrivate              = 0x00000012,
}

alias SpeechRecognitionType = int;
enum : int
{
    SRTStandard        = 0x00000000,
    SRTAutopause       = 0x00000001,
    SRTEmulated        = 0x00000002,
    SRTSMLTimeout      = 0x00000004,
    SRTExtendableParse = 0x00000008,
    SRTReSent          = 0x00000010,
}

alias DISPID_SpeechGrammarRule = int;
enum : int
{
    DISPID_SGRAttributes   = 0x00000001,
    DISPID_SGRInitialState = 0x00000002,
    DISPID_SGRName         = 0x00000003,
    DISPID_SGRId           = 0x00000004,
    DISPID_SGRClear        = 0x00000005,
    DISPID_SGRAddResource  = 0x00000006,
    DISPID_SGRAddState     = 0x00000007,
}

alias DISPID_SpeechGrammarRules = int;
enum : int
{
    DISPID_SGRsCount         = 0x00000001,
    DISPID_SGRsDynamic       = 0x00000002,
    DISPID_SGRsAdd           = 0x00000003,
    DISPID_SGRsCommit        = 0x00000004,
    DISPID_SGRsCommitAndSave = 0x00000005,
    DISPID_SGRsFindRule      = 0x00000006,
    DISPID_SGRsItem          = 0x00000000,
    DISPID_SGRs_NewEnum      = 0xfffffffc,
}

alias DISPID_SpeechGrammarRuleState = int;
enum : int
{
    DISPID_SGRSRule                 = 0x00000001,
    DISPID_SGRSTransitions          = 0x00000002,
    DISPID_SGRSAddWordTransition    = 0x00000003,
    DISPID_SGRSAddRuleTransition    = 0x00000004,
    DISPID_SGRSAddSpecialTransition = 0x00000005,
}

alias SpeechSpecialTransitionType = int;
enum : int
{
    SSTTWildcard   = 0x00000001,
    SSTTDictation  = 0x00000002,
    SSTTTextBuffer = 0x00000003,
}

alias DISPID_SpeechGrammarRuleStateTransitions = int;
enum : int
{
    DISPID_SGRSTsCount    = 0x00000001,
    DISPID_SGRSTsItem     = 0x00000000,
    DISPID_SGRSTs_NewEnum = 0xfffffffc,
}

alias DISPID_SpeechGrammarRuleStateTransition = int;
enum : int
{
    DISPID_SGRSTType          = 0x00000001,
    DISPID_SGRSTText          = 0x00000002,
    DISPID_SGRSTRule          = 0x00000003,
    DISPID_SGRSTWeight        = 0x00000004,
    DISPID_SGRSTPropertyName  = 0x00000005,
    DISPID_SGRSTPropertyId    = 0x00000006,
    DISPID_SGRSTPropertyValue = 0x00000007,
    DISPID_SGRSTNextState     = 0x00000008,
}

alias SpeechGrammarRuleStateTransitionType = int;
enum : int
{
    SGRSTTEpsilon    = 0x00000000,
    SGRSTTWord       = 0x00000001,
    SGRSTTRule       = 0x00000002,
    SGRSTTDictation  = 0x00000003,
    SGRSTTWildcard   = 0x00000004,
    SGRSTTTextBuffer = 0x00000005,
}

alias DISPIDSPTSI = int;
enum : int
{
    DISPIDSPTSI_ActiveOffset    = 0x00000001,
    DISPIDSPTSI_ActiveLength    = 0x00000002,
    DISPIDSPTSI_SelectionOffset = 0x00000003,
    DISPIDSPTSI_SelectionLength = 0x00000004,
}

alias DISPID_SpeechRecoResult = int;
enum : int
{
    DISPID_SRRRecoContext       = 0x00000001,
    DISPID_SRRTimes             = 0x00000002,
    DISPID_SRRAudioFormat       = 0x00000003,
    DISPID_SRRPhraseInfo        = 0x00000004,
    DISPID_SRRAlternates        = 0x00000005,
    DISPID_SRRAudio             = 0x00000006,
    DISPID_SRRSpeakAudio        = 0x00000007,
    DISPID_SRRSaveToMemory      = 0x00000008,
    DISPID_SRRDiscardResultInfo = 0x00000009,
}

alias SpeechDiscardType = int;
enum : int
{
    SDTProperty      = 0x00000001,
    SDTReplacement   = 0x00000002,
    SDTRule          = 0x00000004,
    SDTDisplayText   = 0x00000008,
    SDTLexicalForm   = 0x00000010,
    SDTPronunciation = 0x00000020,
    SDTAudio         = 0x00000040,
    SDTAlternates    = 0x00000080,
    SDTAll           = 0x000000ff,
}

alias DISPID_SpeechXMLRecoResult = int;
enum : int
{
    DISPID_SRRGetXMLResult    = 0x0000000a,
    DISPID_SRRGetXMLErrorInfo = 0x0000000b,
}

alias DISPID_SpeechRecoResult2 = int;
enum : int
{
    DISPID_SRRSetTextFeedback = 0x0000000c,
}

alias DISPID_SpeechPhraseBuilder = int;
enum : int
{
    DISPID_SPPBRestorePhraseFromMemory = 0x00000001,
}

alias DISPID_SpeechRecoResultTimes = int;
enum : int
{
    DISPID_SRRTStreamTime      = 0x00000001,
    DISPID_SRRTLength          = 0x00000002,
    DISPID_SRRTTickCount       = 0x00000003,
    DISPID_SRRTOffsetFromStart = 0x00000004,
}

alias DISPID_SpeechPhraseAlternate = int;
enum : int
{
    DISPID_SPARecoResult               = 0x00000001,
    DISPID_SPAStartElementInResult     = 0x00000002,
    DISPID_SPANumberOfElementsInResult = 0x00000003,
    DISPID_SPAPhraseInfo               = 0x00000004,
    DISPID_SPACommit                   = 0x00000005,
}

alias DISPID_SpeechPhraseAlternates = int;
enum : int
{
    DISPID_SPAsCount    = 0x00000001,
    DISPID_SPAsItem     = 0x00000000,
    DISPID_SPAs_NewEnum = 0xfffffffc,
}

alias DISPID_SpeechPhraseInfo = int;
enum : int
{
    DISPID_SPILanguageId           = 0x00000001,
    DISPID_SPIGrammarId            = 0x00000002,
    DISPID_SPIStartTime            = 0x00000003,
    DISPID_SPIAudioStreamPosition  = 0x00000004,
    DISPID_SPIAudioSizeBytes       = 0x00000005,
    DISPID_SPIRetainedSizeBytes    = 0x00000006,
    DISPID_SPIAudioSizeTime        = 0x00000007,
    DISPID_SPIRule                 = 0x00000008,
    DISPID_SPIProperties           = 0x00000009,
    DISPID_SPIElements             = 0x0000000a,
    DISPID_SPIReplacements         = 0x0000000b,
    DISPID_SPIEngineId             = 0x0000000c,
    DISPID_SPIEnginePrivateData    = 0x0000000d,
    DISPID_SPISaveToMemory         = 0x0000000e,
    DISPID_SPIGetText              = 0x0000000f,
    DISPID_SPIGetDisplayAttributes = 0x00000010,
}

alias DISPID_SpeechPhraseElement = int;
enum : int
{
    DISPID_SPEAudioTimeOffset      = 0x00000001,
    DISPID_SPEAudioSizeTime        = 0x00000002,
    DISPID_SPEAudioStreamOffset    = 0x00000003,
    DISPID_SPEAudioSizeBytes       = 0x00000004,
    DISPID_SPERetainedStreamOffset = 0x00000005,
    DISPID_SPERetainedSizeBytes    = 0x00000006,
    DISPID_SPEDisplayText          = 0x00000007,
    DISPID_SPELexicalForm          = 0x00000008,
    DISPID_SPEPronunciation        = 0x00000009,
    DISPID_SPEDisplayAttributes    = 0x0000000a,
    DISPID_SPERequiredConfidence   = 0x0000000b,
    DISPID_SPEActualConfidence     = 0x0000000c,
    DISPID_SPEEngineConfidence     = 0x0000000d,
}

alias SpeechEngineConfidence = int;
enum : int
{
    SECLowConfidence    = 0xffffffff,
    SECNormalConfidence = 0x00000000,
    SECHighConfidence   = 0x00000001,
}

alias DISPID_SpeechPhraseElements = int;
enum : int
{
    DISPID_SPEsCount    = 0x00000001,
    DISPID_SPEsItem     = 0x00000000,
    DISPID_SPEs_NewEnum = 0xfffffffc,
}

alias DISPID_SpeechPhraseReplacement = int;
enum : int
{
    DISPID_SPRDisplayAttributes = 0x00000001,
    DISPID_SPRText              = 0x00000002,
    DISPID_SPRFirstElement      = 0x00000003,
    DISPID_SPRNumberOfElements  = 0x00000004,
}

alias DISPID_SpeechPhraseReplacements = int;
enum : int
{
    DISPID_SPRsCount    = 0x00000001,
    DISPID_SPRsItem     = 0x00000000,
    DISPID_SPRs_NewEnum = 0xfffffffc,
}

alias DISPID_SpeechPhraseProperty = int;
enum : int
{
    DISPID_SPPName             = 0x00000001,
    DISPID_SPPId               = 0x00000002,
    DISPID_SPPValue            = 0x00000003,
    DISPID_SPPFirstElement     = 0x00000004,
    DISPID_SPPNumberOfElements = 0x00000005,
    DISPID_SPPEngineConfidence = 0x00000006,
    DISPID_SPPConfidence       = 0x00000007,
    DISPID_SPPParent           = 0x00000008,
    DISPID_SPPChildren         = 0x00000009,
}

alias DISPID_SpeechPhraseProperties = int;
enum : int
{
    DISPID_SPPsCount    = 0x00000001,
    DISPID_SPPsItem     = 0x00000000,
    DISPID_SPPs_NewEnum = 0xfffffffc,
}

alias DISPID_SpeechPhraseRule = int;
enum : int
{
    DISPID_SPRuleName             = 0x00000001,
    DISPID_SPRuleId               = 0x00000002,
    DISPID_SPRuleFirstElement     = 0x00000003,
    DISPID_SPRuleNumberOfElements = 0x00000004,
    DISPID_SPRuleParent           = 0x00000005,
    DISPID_SPRuleChildren         = 0x00000006,
    DISPID_SPRuleConfidence       = 0x00000007,
    DISPID_SPRuleEngineConfidence = 0x00000008,
}

alias DISPID_SpeechPhraseRules = int;
enum : int
{
    DISPID_SPRulesCount    = 0x00000001,
    DISPID_SPRulesItem     = 0x00000000,
    DISPID_SPRules_NewEnum = 0xfffffffc,
}

alias DISPID_SpeechLexicon = int;
enum : int
{
    DISPID_SLGenerationId                  = 0x00000001,
    DISPID_SLGetWords                      = 0x00000002,
    DISPID_SLAddPronunciation              = 0x00000003,
    DISPID_SLAddPronunciationByPhoneIds    = 0x00000004,
    DISPID_SLRemovePronunciation           = 0x00000005,
    DISPID_SLRemovePronunciationByPhoneIds = 0x00000006,
    DISPID_SLGetPronunciations             = 0x00000007,
    DISPID_SLGetGenerationChange           = 0x00000008,
}

alias SpeechLexiconType = int;
enum : int
{
    SLTUser = 0x00000001,
    SLTApp  = 0x00000002,
}

alias SpeechPartOfSpeech = int;
enum : int
{
    SPSNotOverriden = 0xffffffff,
    SPSUnknown      = 0x00000000,
    SPSNoun         = 0x00001000,
    SPSVerb         = 0x00002000,
    SPSModifier     = 0x00003000,
    SPSFunction     = 0x00004000,
    SPSInterjection = 0x00005000,
    SPSLMA          = 0x00007000,
    SPSSuppressWord = 0x0000f000,
}

alias DISPID_SpeechLexiconWords = int;
enum : int
{
    DISPID_SLWsCount    = 0x00000001,
    DISPID_SLWsItem     = 0x00000000,
    DISPID_SLWs_NewEnum = 0xfffffffc,
}

alias SpeechWordType = int;
enum : int
{
    SWTAdded   = 0x00000001,
    SWTDeleted = 0x00000002,
}

alias DISPID_SpeechLexiconWord = int;
enum : int
{
    DISPID_SLWLangId         = 0x00000001,
    DISPID_SLWType           = 0x00000002,
    DISPID_SLWWord           = 0x00000003,
    DISPID_SLWPronunciations = 0x00000004,
}

alias DISPID_SpeechLexiconProns = int;
enum : int
{
    DISPID_SLPsCount    = 0x00000001,
    DISPID_SLPsItem     = 0x00000000,
    DISPID_SLPs_NewEnum = 0xfffffffc,
}

alias DISPID_SpeechLexiconPronunciation = int;
enum : int
{
    DISPID_SLPType         = 0x00000001,
    DISPID_SLPLangId       = 0x00000002,
    DISPID_SLPPartOfSpeech = 0x00000003,
    DISPID_SLPPhoneIds     = 0x00000004,
    DISPID_SLPSymbolic     = 0x00000005,
}

alias DISPID_SpeechPhoneConverter = int;
enum : int
{
    DISPID_SPCLangId    = 0x00000001,
    DISPID_SPCPhoneToId = 0x00000002,
    DISPID_SPCIdToPhone = 0x00000003,
}

enum IID_ISpeechDataKey = GUID(0xce17c09b, 0x4efa, 0x44d5, [0xa4, 0xc9, 0x59, 0xd9, 0x58, 0x5a, 0xb0, 0xcd]);
interface ISpeechDataKey : IDispatch
{
    HRESULT SetBinaryValue(const(BSTR) ValueName, VARIANT Value);
    HRESULT GetBinaryValue(const(BSTR) ValueName, VARIANT* Value);
    HRESULT SetStringValue(const(BSTR) ValueName, const(BSTR) Value);
    HRESULT GetStringValue(const(BSTR) ValueName, BSTR* Value);
    HRESULT SetLongValue(const(BSTR) ValueName, int Value);
    HRESULT GetLongValue(const(BSTR) ValueName, int* Value);
    HRESULT OpenKey(const(BSTR) SubKeyName, ISpeechDataKey* SubKey);
    HRESULT CreateKey(const(BSTR) SubKeyName, ISpeechDataKey* SubKey);
    HRESULT DeleteKey(const(BSTR) SubKeyName);
    HRESULT DeleteValue(const(BSTR) ValueName);
    HRESULT EnumKeys(int Index, BSTR* SubKeyName);
    HRESULT EnumValues(int Index, BSTR* ValueName);
}
enum IID_ISpeechObjectToken = GUID(0xc74a3adc, 0xb727, 0x4500, [0xa8, 0x4a, 0xb5, 0x26, 0x72, 0x1c, 0x8b, 0x8c]);
interface ISpeechObjectToken : IDispatch
{
    HRESULT get_Id(BSTR* ObjectId);
    HRESULT get_DataKey(ISpeechDataKey* DataKey);
    HRESULT get_Category(ISpeechObjectTokenCategory* Category);
    HRESULT GetDescription(int Locale, BSTR* Description);
    HRESULT SetId(BSTR Id, BSTR CategoryID, VARIANT_BOOL CreateIfNotExist);
    HRESULT GetAttribute(BSTR AttributeName, BSTR* AttributeValue);
    HRESULT CreateInstance(IUnknown pUnkOuter, SpeechTokenContext ClsContext, IUnknown* Object);
    HRESULT Remove(BSTR ObjectStorageCLSID);
    HRESULT GetStorageFileName(BSTR ObjectStorageCLSID, BSTR KeyName, BSTR FileName, SpeechTokenShellFolder Folder, BSTR* FilePath);
    HRESULT RemoveStorageFileName(BSTR ObjectStorageCLSID, BSTR KeyName, VARIANT_BOOL DeleteFile);
    HRESULT IsUISupported(const(BSTR) TypeOfUI, const(VARIANT)* ExtraData, IUnknown Object, VARIANT_BOOL* Supported);
    HRESULT DisplayUI(int hWnd, BSTR Title, const(BSTR) TypeOfUI, const(VARIANT)* ExtraData, IUnknown Object);
    HRESULT MatchesAttributes(BSTR Attributes, VARIANT_BOOL* Matches);
}
enum IID_ISpeechObjectTokens = GUID(0x9285b776, 0x2e7b, 0x4bc0, [0xb5, 0x3e, 0x58, 0xe, 0xb6, 0xfa, 0x96, 0x7f]);
interface ISpeechObjectTokens : IDispatch
{
    HRESULT get_Count(int* Count);
    HRESULT Item(int Index, ISpeechObjectToken* Token);
    HRESULT get__NewEnum(IUnknown* ppEnumVARIANT);
}
enum IID_ISpeechObjectTokenCategory = GUID(0xca7eac50, 0x2d01, 0x4145, [0x86, 0xd4, 0x5a, 0xe7, 0xd7, 0xf, 0x44, 0x69]);
interface ISpeechObjectTokenCategory : IDispatch
{
    HRESULT get_Id(BSTR* Id);
    HRESULT put_Default(const(BSTR) TokenId);
    HRESULT get_Default(BSTR* TokenId);
    HRESULT SetId(const(BSTR) Id, VARIANT_BOOL CreateIfNotExist);
    HRESULT GetDataKey(SpeechDataKeyLocation Location, ISpeechDataKey* DataKey);
    HRESULT EnumerateTokens(BSTR RequiredAttributes, BSTR OptionalAttributes, ISpeechObjectTokens* Tokens);
}
enum IID_ISpeechAudioBufferInfo = GUID(0x11b103d8, 0x1142, 0x4edf, [0xa0, 0x93, 0x82, 0xfb, 0x39, 0x15, 0xf8, 0xcc]);
interface ISpeechAudioBufferInfo : IDispatch
{
    HRESULT get_MinNotification(int* MinNotification);
    HRESULT put_MinNotification(int MinNotification);
    HRESULT get_BufferSize(int* BufferSize);
    HRESULT put_BufferSize(int BufferSize);
    HRESULT get_EventBias(int* EventBias);
    HRESULT put_EventBias(int EventBias);
}
enum IID_ISpeechAudioStatus = GUID(0xc62d9c91, 0x7458, 0x47f6, [0x86, 0x2d, 0x1e, 0xf8, 0x6f, 0xb0, 0xb2, 0x78]);
interface ISpeechAudioStatus : IDispatch
{
    HRESULT get_FreeBufferSpace(int* FreeBufferSpace);
    HRESULT get_NonBlockingIO(int* NonBlockingIO);
    HRESULT get_State(SpeechAudioState* State);
    HRESULT get_CurrentSeekPosition(VARIANT* CurrentSeekPosition);
    HRESULT get_CurrentDevicePosition(VARIANT* CurrentDevicePosition);
}
enum IID_ISpeechAudioFormat = GUID(0xe6e9c590, 0x3e18, 0x40e3, [0x82, 0x99, 0x6, 0x1f, 0x98, 0xbd, 0xe7, 0xc7]);
interface ISpeechAudioFormat : IDispatch
{
    HRESULT get_Type(SpeechAudioFormatType* AudioFormat);
    HRESULT put_Type(SpeechAudioFormatType AudioFormat);
    HRESULT get_Guid(BSTR* Guid);
    HRESULT put_Guid(BSTR Guid);
    HRESULT GetWaveFormatEx(ISpeechWaveFormatEx* SpeechWaveFormatEx);
    HRESULT SetWaveFormatEx(ISpeechWaveFormatEx SpeechWaveFormatEx);
}
enum IID_ISpeechWaveFormatEx = GUID(0x7a1ef0d5, 0x1581, 0x4741, [0x88, 0xe4, 0x20, 0x9a, 0x49, 0xf1, 0x1a, 0x10]);
interface ISpeechWaveFormatEx : IDispatch
{
    HRESULT get_FormatTag(short* FormatTag);
    HRESULT put_FormatTag(short FormatTag);
    HRESULT get_Channels(short* Channels);
    HRESULT put_Channels(short Channels);
    HRESULT get_SamplesPerSec(int* SamplesPerSec);
    HRESULT put_SamplesPerSec(int SamplesPerSec);
    HRESULT get_AvgBytesPerSec(int* AvgBytesPerSec);
    HRESULT put_AvgBytesPerSec(int AvgBytesPerSec);
    HRESULT get_BlockAlign(short* BlockAlign);
    HRESULT put_BlockAlign(short BlockAlign);
    HRESULT get_BitsPerSample(short* BitsPerSample);
    HRESULT put_BitsPerSample(short BitsPerSample);
    HRESULT get_ExtraData(VARIANT* ExtraData);
    HRESULT put_ExtraData(VARIANT ExtraData);
}
enum IID_ISpeechBaseStream = GUID(0x6450336f, 0x7d49, 0x4ced, [0x80, 0x97, 0x49, 0xd6, 0xde, 0xe3, 0x72, 0x94]);
interface ISpeechBaseStream : IDispatch
{
    HRESULT get_Format(ISpeechAudioFormat* AudioFormat);
    HRESULT putref_Format(ISpeechAudioFormat AudioFormat);
    HRESULT Read(VARIANT* Buffer, int NumberOfBytes, int* BytesRead);
    HRESULT Write(VARIANT Buffer, int* BytesWritten);
    HRESULT Seek(VARIANT Position, SpeechStreamSeekPositionType Origin, VARIANT* NewPosition);
}
enum IID_ISpeechFileStream = GUID(0xaf67f125, 0xab39, 0x4e93, [0xb4, 0xa2, 0xcc, 0x2e, 0x66, 0xe1, 0x82, 0xa7]);
interface ISpeechFileStream : ISpeechBaseStream
{
    HRESULT Open(BSTR FileName, SpeechStreamFileMode FileMode, VARIANT_BOOL DoEvents);
    HRESULT Close();
}
enum IID_ISpeechMemoryStream = GUID(0xeeb14b68, 0x808b, 0x4abe, [0xa5, 0xea, 0xb5, 0x1d, 0xa7, 0x58, 0x80, 0x8]);
interface ISpeechMemoryStream : ISpeechBaseStream
{
    HRESULT SetData(VARIANT Data);
    HRESULT GetData(VARIANT* pData);
}
enum IID_ISpeechCustomStream = GUID(0x1a9e9f4f, 0x104f, 0x4db8, [0xa1, 0x15, 0xef, 0xd7, 0xfd, 0xc, 0x97, 0xae]);
interface ISpeechCustomStream : ISpeechBaseStream
{
    HRESULT get_BaseStream(IUnknown* ppUnkStream);
    HRESULT putref_BaseStream(IUnknown pUnkStream);
}
enum IID_ISpeechAudio = GUID(0xcff8e175, 0x19e, 0x11d3, [0xa0, 0x8e, 0x0, 0xc0, 0x4f, 0x8e, 0xf9, 0xb5]);
interface ISpeechAudio : ISpeechBaseStream
{
    HRESULT get_Status(ISpeechAudioStatus* Status);
    HRESULT get_BufferInfo(ISpeechAudioBufferInfo* BufferInfo);
    HRESULT get_DefaultFormat(ISpeechAudioFormat* StreamFormat);
    HRESULT get_Volume(int* Volume);
    HRESULT put_Volume(int Volume);
    HRESULT get_BufferNotifySize(int* BufferNotifySize);
    HRESULT put_BufferNotifySize(int BufferNotifySize);
    HRESULT get_EventHandle(int* EventHandle);
    HRESULT SetState(SpeechAudioState State);
}
enum IID_ISpeechMMSysAudio = GUID(0x3c76af6d, 0x1fd7, 0x4831, [0x81, 0xd1, 0x3b, 0x71, 0xd5, 0xa1, 0x3c, 0x44]);
interface ISpeechMMSysAudio : ISpeechAudio
{
    HRESULT get_DeviceId(int* DeviceId);
    HRESULT put_DeviceId(int DeviceId);
    HRESULT get_LineId(int* LineId);
    HRESULT put_LineId(int LineId);
    HRESULT get_MMHandle(int* Handle);
}
enum IID_ISpeechVoice = GUID(0x269316d8, 0x57bd, 0x11d2, [0x9e, 0xee, 0x0, 0xc0, 0x4f, 0x79, 0x73, 0x96]);
interface ISpeechVoice : IDispatch
{
    HRESULT get_Status(ISpeechVoiceStatus* Status);
    HRESULT get_Voice(ISpeechObjectToken* Voice);
    HRESULT putref_Voice(ISpeechObjectToken Voice);
    HRESULT get_AudioOutput(ISpeechObjectToken* AudioOutput);
    HRESULT putref_AudioOutput(ISpeechObjectToken AudioOutput);
    HRESULT get_AudioOutputStream(ISpeechBaseStream* AudioOutputStream);
    HRESULT putref_AudioOutputStream(ISpeechBaseStream AudioOutputStream);
    HRESULT get_Rate(int* Rate);
    HRESULT put_Rate(int Rate);
    HRESULT get_Volume(int* Volume);
    HRESULT put_Volume(int Volume);
    HRESULT put_AllowAudioOutputFormatChangesOnNextSet(VARIANT_BOOL Allow);
    HRESULT get_AllowAudioOutputFormatChangesOnNextSet(VARIANT_BOOL* Allow);
    HRESULT get_EventInterests(SpeechVoiceEvents* EventInterestFlags);
    HRESULT put_EventInterests(SpeechVoiceEvents EventInterestFlags);
    HRESULT put_Priority(SpeechVoicePriority Priority);
    HRESULT get_Priority(SpeechVoicePriority* Priority);
    HRESULT put_AlertBoundary(SpeechVoiceEvents Boundary);
    HRESULT get_AlertBoundary(SpeechVoiceEvents* Boundary);
    HRESULT put_SynchronousSpeakTimeout(int msTimeout);
    HRESULT get_SynchronousSpeakTimeout(int* msTimeout);
    HRESULT Speak(BSTR Text, SpeechVoiceSpeakFlags Flags, int* StreamNumber);
    HRESULT SpeakStream(ISpeechBaseStream Stream, SpeechVoiceSpeakFlags Flags, int* StreamNumber);
    HRESULT Pause();
    HRESULT Resume();
    HRESULT Skip(const(BSTR) Type, int NumItems, int* NumSkipped);
    HRESULT GetVoices(BSTR RequiredAttributes, BSTR OptionalAttributes, ISpeechObjectTokens* ObjectTokens);
    HRESULT GetAudioOutputs(BSTR RequiredAttributes, BSTR OptionalAttributes, ISpeechObjectTokens* ObjectTokens);
    HRESULT WaitUntilDone(int msTimeout, VARIANT_BOOL* Done);
    HRESULT SpeakCompleteEvent(int* Handle);
    HRESULT IsUISupported(const(BSTR) TypeOfUI, const(VARIANT)* ExtraData, VARIANT_BOOL* Supported);
    HRESULT DisplayUI(int hWndParent, BSTR Title, const(BSTR) TypeOfUI, const(VARIANT)* ExtraData);
}
enum IID_ISpeechVoiceStatus = GUID(0x8be47b07, 0x57f6, 0x11d2, [0x9e, 0xee, 0x0, 0xc0, 0x4f, 0x79, 0x73, 0x96]);
interface ISpeechVoiceStatus : IDispatch
{
    HRESULT get_CurrentStreamNumber(int* StreamNumber);
    HRESULT get_LastStreamNumberQueued(int* StreamNumber);
    HRESULT get_LastHResult(int* HResult);
    HRESULT get_RunningState(SpeechRunState* State);
    HRESULT get_InputWordPosition(int* Position);
    HRESULT get_InputWordLength(int* Length);
    HRESULT get_InputSentencePosition(int* Position);
    HRESULT get_InputSentenceLength(int* Length);
    HRESULT get_LastBookmark(BSTR* Bookmark);
    HRESULT get_LastBookmarkId(int* BookmarkId);
    HRESULT get_PhonemeId(short* PhoneId);
    HRESULT get_VisemeId(short* VisemeId);
}
enum IID__ISpeechVoiceEvents = GUID(0xa372acd1, 0x3bef, 0x4bbd, [0x8f, 0xfb, 0xcb, 0x3e, 0x2b, 0x41, 0x6a, 0xf8]);
interface _ISpeechVoiceEvents : IDispatch
{
}
enum IID_ISpeechRecognizer = GUID(0x2d5f1c0c, 0xbd75, 0x4b08, [0x94, 0x78, 0x3b, 0x11, 0xfe, 0xa2, 0x58, 0x6c]);
interface ISpeechRecognizer : IDispatch
{
    HRESULT putref_Recognizer(ISpeechObjectToken Recognizer);
    HRESULT get_Recognizer(ISpeechObjectToken* Recognizer);
    HRESULT put_AllowAudioInputFormatChangesOnNextSet(VARIANT_BOOL Allow);
    HRESULT get_AllowAudioInputFormatChangesOnNextSet(VARIANT_BOOL* Allow);
    HRESULT putref_AudioInput(ISpeechObjectToken AudioInput);
    HRESULT get_AudioInput(ISpeechObjectToken* AudioInput);
    HRESULT putref_AudioInputStream(ISpeechBaseStream AudioInputStream);
    HRESULT get_AudioInputStream(ISpeechBaseStream* AudioInputStream);
    HRESULT get_IsShared(VARIANT_BOOL* Shared);
    HRESULT put_State(SpeechRecognizerState State);
    HRESULT get_State(SpeechRecognizerState* State);
    HRESULT get_Status(ISpeechRecognizerStatus* Status);
    HRESULT putref_Profile(ISpeechObjectToken Profile);
    HRESULT get_Profile(ISpeechObjectToken* Profile);
    HRESULT EmulateRecognition(VARIANT TextElements, VARIANT* ElementDisplayAttributes, int LanguageId);
    HRESULT CreateRecoContext(ISpeechRecoContext* NewContext);
    HRESULT GetFormat(SpeechFormatType Type, ISpeechAudioFormat* Format);
    HRESULT SetPropertyNumber(const(BSTR) Name, int Value, VARIANT_BOOL* Supported);
    HRESULT GetPropertyNumber(const(BSTR) Name, int* Value, VARIANT_BOOL* Supported);
    HRESULT SetPropertyString(const(BSTR) Name, const(BSTR) Value, VARIANT_BOOL* Supported);
    HRESULT GetPropertyString(const(BSTR) Name, BSTR* Value, VARIANT_BOOL* Supported);
    HRESULT IsUISupported(const(BSTR) TypeOfUI, const(VARIANT)* ExtraData, VARIANT_BOOL* Supported);
    HRESULT DisplayUI(int hWndParent, BSTR Title, const(BSTR) TypeOfUI, const(VARIANT)* ExtraData);
    HRESULT GetRecognizers(BSTR RequiredAttributes, BSTR OptionalAttributes, ISpeechObjectTokens* ObjectTokens);
    HRESULT GetAudioInputs(BSTR RequiredAttributes, BSTR OptionalAttributes, ISpeechObjectTokens* ObjectTokens);
    HRESULT GetProfiles(BSTR RequiredAttributes, BSTR OptionalAttributes, ISpeechObjectTokens* ObjectTokens);
}
enum IID_ISpeechRecognizerStatus = GUID(0xbff9e781, 0x53ec, 0x484e, [0xbb, 0x8a, 0xe, 0x1b, 0x55, 0x51, 0xe3, 0x5c]);
interface ISpeechRecognizerStatus : IDispatch
{
    HRESULT get_AudioStatus(ISpeechAudioStatus* AudioStatus);
    HRESULT get_CurrentStreamPosition(VARIANT* pCurrentStreamPos);
    HRESULT get_CurrentStreamNumber(int* StreamNumber);
    HRESULT get_NumberOfActiveRules(int* NumberOfActiveRules);
    HRESULT get_ClsidEngine(BSTR* ClsidEngine);
    HRESULT get_SupportedLanguages(VARIANT* SupportedLanguages);
}
enum IID_ISpeechRecoContext = GUID(0x580aa49d, 0x7e1e, 0x4809, [0xb8, 0xe2, 0x57, 0xda, 0x80, 0x61, 0x4, 0xb8]);
interface ISpeechRecoContext : IDispatch
{
    HRESULT get_Recognizer(ISpeechRecognizer* Recognizer);
    HRESULT get_AudioInputInterferenceStatus(SpeechInterference* Interference);
    HRESULT get_RequestedUIType(BSTR* UIType);
    HRESULT putref_Voice(ISpeechVoice Voice);
    HRESULT get_Voice(ISpeechVoice* Voice);
    HRESULT put_AllowVoiceFormatMatchingOnNextSet(VARIANT_BOOL Allow);
    HRESULT get_AllowVoiceFormatMatchingOnNextSet(VARIANT_BOOL* pAllow);
    HRESULT put_VoicePurgeEvent(SpeechRecoEvents EventInterest);
    HRESULT get_VoicePurgeEvent(SpeechRecoEvents* EventInterest);
    HRESULT put_EventInterests(SpeechRecoEvents EventInterest);
    HRESULT get_EventInterests(SpeechRecoEvents* EventInterest);
    HRESULT put_CmdMaxAlternates(int MaxAlternates);
    HRESULT get_CmdMaxAlternates(int* MaxAlternates);
    HRESULT put_State(SpeechRecoContextState State);
    HRESULT get_State(SpeechRecoContextState* State);
    HRESULT put_RetainedAudio(SpeechRetainedAudioOptions Option);
    HRESULT get_RetainedAudio(SpeechRetainedAudioOptions* Option);
    HRESULT putref_RetainedAudioFormat(ISpeechAudioFormat Format);
    HRESULT get_RetainedAudioFormat(ISpeechAudioFormat* Format);
    HRESULT Pause();
    HRESULT Resume();
    HRESULT CreateGrammar(VARIANT GrammarId, ISpeechRecoGrammar* Grammar);
    HRESULT CreateResultFromMemory(VARIANT* ResultBlock, ISpeechRecoResult* Result);
    HRESULT Bookmark(SpeechBookmarkOptions Options, VARIANT StreamPos, VARIANT BookmarkId);
    HRESULT SetAdaptationData(BSTR AdaptationString);
}
enum IID_ISpeechRecoGrammar = GUID(0xb6d6f79f, 0x2158, 0x4e50, [0xb5, 0xbc, 0x9a, 0x9c, 0xcd, 0x85, 0x2a, 0x9]);
interface ISpeechRecoGrammar : IDispatch
{
    HRESULT get_Id(VARIANT* Id);
    HRESULT get_RecoContext(ISpeechRecoContext* RecoContext);
    HRESULT put_State(SpeechGrammarState State);
    HRESULT get_State(SpeechGrammarState* State);
    HRESULT get_Rules(ISpeechGrammarRules* Rules);
    HRESULT Reset(int NewLanguage);
    HRESULT CmdLoadFromFile(const(BSTR) FileName, SpeechLoadOption LoadOption);
    HRESULT CmdLoadFromObject(const(BSTR) ClassId, const(BSTR) GrammarName, SpeechLoadOption LoadOption);
    HRESULT CmdLoadFromResource(int hModule, VARIANT ResourceName, VARIANT ResourceType, int LanguageId, SpeechLoadOption LoadOption);
    HRESULT CmdLoadFromMemory(VARIANT GrammarData, SpeechLoadOption LoadOption);
    HRESULT CmdLoadFromProprietaryGrammar(const(BSTR) ProprietaryGuid, const(BSTR) ProprietaryString, VARIANT ProprietaryData, SpeechLoadOption LoadOption);
    HRESULT CmdSetRuleState(const(BSTR) Name, SpeechRuleState State);
    HRESULT CmdSetRuleIdState(int RuleId, SpeechRuleState State);
    HRESULT DictationLoad(const(BSTR) TopicName, SpeechLoadOption LoadOption);
    HRESULT DictationUnload();
    HRESULT DictationSetState(SpeechRuleState State);
    HRESULT SetWordSequenceData(const(BSTR) Text, int TextLength, ISpeechTextSelectionInformation Info);
    HRESULT SetTextSelection(ISpeechTextSelectionInformation Info);
    HRESULT IsPronounceable(const(BSTR) Word, SpeechWordPronounceable* WordPronounceable);
}
enum IID__ISpeechRecoContextEvents = GUID(0x7b8fcb42, 0xe9d, 0x4f00, [0xa0, 0x48, 0x7b, 0x4, 0xd6, 0x17, 0x9d, 0x3d]);
interface _ISpeechRecoContextEvents : IDispatch
{
}
enum IID_ISpeechGrammarRule = GUID(0xafe719cf, 0x5dd1, 0x44f2, [0x99, 0x9c, 0x7a, 0x39, 0x9f, 0x1c, 0xfc, 0xcc]);
interface ISpeechGrammarRule : IDispatch
{
    HRESULT get_Attributes(SpeechRuleAttributes* Attributes);
    HRESULT get_InitialState(ISpeechGrammarRuleState* State);
    HRESULT get_Name(BSTR* Name);
    HRESULT get_Id(int* Id);
    HRESULT Clear();
    HRESULT AddResource(const(BSTR) ResourceName, const(BSTR) ResourceValue);
    HRESULT AddState(ISpeechGrammarRuleState* State);
}
enum IID_ISpeechGrammarRules = GUID(0x6ffa3b44, 0xfc2d, 0x40d1, [0x8a, 0xfc, 0x32, 0x91, 0x1c, 0x7f, 0x1a, 0xd1]);
interface ISpeechGrammarRules : IDispatch
{
    HRESULT get_Count(int* Count);
    HRESULT FindRule(VARIANT RuleNameOrId, ISpeechGrammarRule* Rule);
    HRESULT Item(int Index, ISpeechGrammarRule* Rule);
    HRESULT get__NewEnum(IUnknown* EnumVARIANT);
    HRESULT get_Dynamic(VARIANT_BOOL* Dynamic);
    HRESULT Add(BSTR RuleName, SpeechRuleAttributes Attributes, int RuleId, ISpeechGrammarRule* Rule);
    HRESULT Commit();
    HRESULT CommitAndSave(BSTR* ErrorText, VARIANT* SaveStream);
}
enum IID_ISpeechGrammarRuleState = GUID(0xd4286f2c, 0xee67, 0x45ae, [0xb9, 0x28, 0x28, 0xd6, 0x95, 0x36, 0x2e, 0xda]);
interface ISpeechGrammarRuleState : IDispatch
{
    HRESULT get_Rule(ISpeechGrammarRule* Rule);
    HRESULT get_Transitions(ISpeechGrammarRuleStateTransitions* Transitions);
    HRESULT AddWordTransition(ISpeechGrammarRuleState DestState, const(BSTR) Words, const(BSTR) Separators, SpeechGrammarWordType Type, const(BSTR) PropertyName, int PropertyId, VARIANT* PropertyValue, float Weight);
    HRESULT AddRuleTransition(ISpeechGrammarRuleState DestinationState, ISpeechGrammarRule Rule, const(BSTR) PropertyName, int PropertyId, VARIANT* PropertyValue, float Weight);
    HRESULT AddSpecialTransition(ISpeechGrammarRuleState DestinationState, SpeechSpecialTransitionType Type, const(BSTR) PropertyName, int PropertyId, VARIANT* PropertyValue, float Weight);
}
enum IID_ISpeechGrammarRuleStateTransition = GUID(0xcafd1db1, 0x41d1, 0x4a06, [0x98, 0x63, 0xe2, 0xe8, 0x1d, 0xa1, 0x7a, 0x9a]);
interface ISpeechGrammarRuleStateTransition : IDispatch
{
    HRESULT get_Type(SpeechGrammarRuleStateTransitionType* Type);
    HRESULT get_Text(BSTR* Text);
    HRESULT get_Rule(ISpeechGrammarRule* Rule);
    HRESULT get_Weight(VARIANT* Weight);
    HRESULT get_PropertyName(BSTR* PropertyName);
    HRESULT get_PropertyId(int* PropertyId);
    HRESULT get_PropertyValue(VARIANT* PropertyValue);
    HRESULT get_NextState(ISpeechGrammarRuleState* NextState);
}
enum IID_ISpeechGrammarRuleStateTransitions = GUID(0xeabce657, 0x75bc, 0x44a2, [0xaa, 0x7f, 0xc5, 0x64, 0x76, 0x74, 0x29, 0x63]);
interface ISpeechGrammarRuleStateTransitions : IDispatch
{
    HRESULT get_Count(int* Count);
    HRESULT Item(int Index, ISpeechGrammarRuleStateTransition* Transition);
    HRESULT get__NewEnum(IUnknown* EnumVARIANT);
}
enum IID_ISpeechTextSelectionInformation = GUID(0x3b9c7e7a, 0x6eee, 0x4ded, [0x90, 0x92, 0x11, 0x65, 0x72, 0x79, 0xad, 0xbe]);
interface ISpeechTextSelectionInformation : IDispatch
{
    HRESULT put_ActiveOffset(int ActiveOffset);
    HRESULT get_ActiveOffset(int* ActiveOffset);
    HRESULT put_ActiveLength(int ActiveLength);
    HRESULT get_ActiveLength(int* ActiveLength);
    HRESULT put_SelectionOffset(int SelectionOffset);
    HRESULT get_SelectionOffset(int* SelectionOffset);
    HRESULT put_SelectionLength(int SelectionLength);
    HRESULT get_SelectionLength(int* SelectionLength);
}
enum IID_ISpeechRecoResult = GUID(0xed2879cf, 0xced9, 0x4ee6, [0xa5, 0x34, 0xde, 0x1, 0x91, 0xd5, 0x46, 0x8d]);
interface ISpeechRecoResult : IDispatch
{
    HRESULT get_RecoContext(ISpeechRecoContext* RecoContext);
    HRESULT get_Times(ISpeechRecoResultTimes* Times);
    HRESULT putref_AudioFormat(ISpeechAudioFormat Format);
    HRESULT get_AudioFormat(ISpeechAudioFormat* Format);
    HRESULT get_PhraseInfo(ISpeechPhraseInfo* PhraseInfo);
    HRESULT Alternates(int RequestCount, int StartElement, int Elements, ISpeechPhraseAlternates* Alternates);
    HRESULT Audio(int StartElement, int Elements, ISpeechMemoryStream* Stream);
    HRESULT SpeakAudio(int StartElement, int Elements, SpeechVoiceSpeakFlags Flags, int* StreamNumber);
    HRESULT SaveToMemory(VARIANT* ResultBlock);
    HRESULT DiscardResultInfo(SpeechDiscardType ValueTypes);
}
enum IID_ISpeechRecoResult2 = GUID(0x8e0a246d, 0xd3c8, 0x45de, [0x86, 0x57, 0x4, 0x29, 0xc, 0x45, 0x8c, 0x3c]);
interface ISpeechRecoResult2 : ISpeechRecoResult
{
    HRESULT SetTextFeedback(BSTR Feedback, VARIANT_BOOL WasSuccessful);
}
enum IID_ISpeechRecoResultTimes = GUID(0x62b3b8fb, 0xf6e7, 0x41be, [0xbd, 0xcb, 0x5, 0x6b, 0x1c, 0x29, 0xef, 0xc0]);
interface ISpeechRecoResultTimes : IDispatch
{
    HRESULT get_StreamTime(VARIANT* Time);
    HRESULT get_Length(VARIANT* Length);
    HRESULT get_TickCount(int* TickCount);
    HRESULT get_OffsetFromStart(VARIANT* OffsetFromStart);
}
enum IID_ISpeechPhraseAlternate = GUID(0x27864a2a, 0x2b9f, 0x4cb8, [0x92, 0xd3, 0xd, 0x27, 0x22, 0xfd, 0x1e, 0x73]);
interface ISpeechPhraseAlternate : IDispatch
{
    HRESULT get_RecoResult(ISpeechRecoResult* RecoResult);
    HRESULT get_StartElementInResult(int* StartElement);
    HRESULT get_NumberOfElementsInResult(int* NumberOfElements);
    HRESULT get_PhraseInfo(ISpeechPhraseInfo* PhraseInfo);
    HRESULT Commit();
}
enum IID_ISpeechPhraseAlternates = GUID(0xb238b6d5, 0xf276, 0x4c3d, [0xa6, 0xc1, 0x29, 0x74, 0x80, 0x1c, 0x3c, 0xc2]);
interface ISpeechPhraseAlternates : IDispatch
{
    HRESULT get_Count(int* Count);
    HRESULT Item(int Index, ISpeechPhraseAlternate* PhraseAlternate);
    HRESULT get__NewEnum(IUnknown* EnumVARIANT);
}
enum IID_ISpeechPhraseInfo = GUID(0x961559cf, 0x4e67, 0x4662, [0x8b, 0xf0, 0xd9, 0x3f, 0x1f, 0xcd, 0x61, 0xb3]);
interface ISpeechPhraseInfo : IDispatch
{
    HRESULT get_LanguageId(int* LanguageId);
    HRESULT get_GrammarId(VARIANT* GrammarId);
    HRESULT get_StartTime(VARIANT* StartTime);
    HRESULT get_AudioStreamPosition(VARIANT* AudioStreamPosition);
    HRESULT get_AudioSizeBytes(int* pAudioSizeBytes);
    HRESULT get_RetainedSizeBytes(int* RetainedSizeBytes);
    HRESULT get_AudioSizeTime(int* AudioSizeTime);
    HRESULT get_Rule(ISpeechPhraseRule* Rule);
    HRESULT get_Properties(ISpeechPhraseProperties* Properties);
    HRESULT get_Elements(ISpeechPhraseElements* Elements);
    HRESULT get_Replacements(ISpeechPhraseReplacements* Replacements);
    HRESULT get_EngineId(BSTR* EngineIdGuid);
    HRESULT get_EnginePrivateData(VARIANT* PrivateData);
    HRESULT SaveToMemory(VARIANT* PhraseBlock);
    HRESULT GetText(int StartElement, int Elements, VARIANT_BOOL UseReplacements, BSTR* Text);
    HRESULT GetDisplayAttributes(int StartElement, int Elements, VARIANT_BOOL UseReplacements, SpeechDisplayAttributes* DisplayAttributes);
}
enum IID_ISpeechPhraseElement = GUID(0xe6176f96, 0xe373, 0x4801, [0xb2, 0x23, 0x3b, 0x62, 0xc0, 0x68, 0xc0, 0xb4]);
interface ISpeechPhraseElement : IDispatch
{
    HRESULT get_AudioTimeOffset(int* AudioTimeOffset);
    HRESULT get_AudioSizeTime(int* AudioSizeTime);
    HRESULT get_AudioStreamOffset(int* AudioStreamOffset);
    HRESULT get_AudioSizeBytes(int* AudioSizeBytes);
    HRESULT get_RetainedStreamOffset(int* RetainedStreamOffset);
    HRESULT get_RetainedSizeBytes(int* RetainedSizeBytes);
    HRESULT get_DisplayText(BSTR* DisplayText);
    HRESULT get_LexicalForm(BSTR* LexicalForm);
    HRESULT get_Pronunciation(VARIANT* Pronunciation);
    HRESULT get_DisplayAttributes(SpeechDisplayAttributes* DisplayAttributes);
    HRESULT get_RequiredConfidence(SpeechEngineConfidence* RequiredConfidence);
    HRESULT get_ActualConfidence(SpeechEngineConfidence* ActualConfidence);
    HRESULT get_EngineConfidence(float* EngineConfidence);
}
enum IID_ISpeechPhraseElements = GUID(0x626b328, 0x3478, 0x467d, [0xa0, 0xb3, 0xd0, 0x85, 0x3b, 0x93, 0xdd, 0xa3]);
interface ISpeechPhraseElements : IDispatch
{
    HRESULT get_Count(int* Count);
    HRESULT Item(int Index, ISpeechPhraseElement* Element);
    HRESULT get__NewEnum(IUnknown* EnumVARIANT);
}
enum IID_ISpeechPhraseReplacement = GUID(0x2890a410, 0x53a7, 0x4fb5, [0x94, 0xec, 0x6, 0xd4, 0x99, 0x8e, 0x3d, 0x2]);
interface ISpeechPhraseReplacement : IDispatch
{
    HRESULT get_DisplayAttributes(SpeechDisplayAttributes* DisplayAttributes);
    HRESULT get_Text(BSTR* Text);
    HRESULT get_FirstElement(int* FirstElement);
    HRESULT get_NumberOfElements(int* NumberOfElements);
}
enum IID_ISpeechPhraseReplacements = GUID(0x38bc662f, 0x2257, 0x4525, [0x95, 0x9e, 0x20, 0x69, 0xd2, 0x59, 0x6c, 0x5]);
interface ISpeechPhraseReplacements : IDispatch
{
    HRESULT get_Count(int* Count);
    HRESULT Item(int Index, ISpeechPhraseReplacement* Reps);
    HRESULT get__NewEnum(IUnknown* EnumVARIANT);
}
enum IID_ISpeechPhraseProperty = GUID(0xce563d48, 0x961e, 0x4732, [0xa2, 0xe1, 0x37, 0x8a, 0x42, 0xb4, 0x30, 0xbe]);
interface ISpeechPhraseProperty : IDispatch
{
    HRESULT get_Name(BSTR* Name);
    HRESULT get_Id(int* Id);
    HRESULT get_Value(VARIANT* Value);
    HRESULT get_FirstElement(int* FirstElement);
    HRESULT get_NumberOfElements(int* NumberOfElements);
    HRESULT get_EngineConfidence(float* Confidence);
    HRESULT get_Confidence(SpeechEngineConfidence* Confidence);
    HRESULT get_Parent(ISpeechPhraseProperty* ParentProperty);
    HRESULT get_Children(ISpeechPhraseProperties* Children);
}
enum IID_ISpeechPhraseProperties = GUID(0x8166b47, 0x102e, 0x4b23, [0xa5, 0x99, 0xbd, 0xb9, 0x8d, 0xbf, 0xd1, 0xf4]);
interface ISpeechPhraseProperties : IDispatch
{
    HRESULT get_Count(int* Count);
    HRESULT Item(int Index, ISpeechPhraseProperty* Property);
    HRESULT get__NewEnum(IUnknown* EnumVARIANT);
}
enum IID_ISpeechPhraseRule = GUID(0xa7bfe112, 0xa4a0, 0x48d9, [0xb6, 0x2, 0xc3, 0x13, 0x84, 0x3f, 0x69, 0x64]);
interface ISpeechPhraseRule : IDispatch
{
    HRESULT get_Name(BSTR* Name);
    HRESULT get_Id(int* Id);
    HRESULT get_FirstElement(int* FirstElement);
    HRESULT get_NumberOfElements(int* NumberOfElements);
    HRESULT get_Parent(ISpeechPhraseRule* Parent);
    HRESULT get_Children(ISpeechPhraseRules* Children);
    HRESULT get_Confidence(SpeechEngineConfidence* ActualConfidence);
    HRESULT get_EngineConfidence(float* EngineConfidence);
}
enum IID_ISpeechPhraseRules = GUID(0x9047d593, 0x1dd, 0x4b72, [0x81, 0xa3, 0xe4, 0xa0, 0xca, 0x69, 0xf4, 0x7]);
interface ISpeechPhraseRules : IDispatch
{
    HRESULT get_Count(int* Count);
    HRESULT Item(int Index, ISpeechPhraseRule* Rule);
    HRESULT get__NewEnum(IUnknown* EnumVARIANT);
}
enum IID_ISpeechLexicon = GUID(0x3da7627a, 0xc7ae, 0x4b23, [0x87, 0x8, 0x63, 0x8c, 0x50, 0x36, 0x2c, 0x25]);
interface ISpeechLexicon : IDispatch
{
    HRESULT get_GenerationId(int* GenerationId);
    HRESULT GetWords(SpeechLexiconType Flags, int* GenerationID, ISpeechLexiconWords* Words);
    HRESULT AddPronunciation(BSTR bstrWord, int LangId, SpeechPartOfSpeech PartOfSpeech, BSTR bstrPronunciation);
    HRESULT AddPronunciationByPhoneIds(BSTR bstrWord, int LangId, SpeechPartOfSpeech PartOfSpeech, VARIANT* PhoneIds);
    HRESULT RemovePronunciation(BSTR bstrWord, int LangId, SpeechPartOfSpeech PartOfSpeech, BSTR bstrPronunciation);
    HRESULT RemovePronunciationByPhoneIds(BSTR bstrWord, int LangId, SpeechPartOfSpeech PartOfSpeech, VARIANT* PhoneIds);
    HRESULT GetPronunciations(BSTR bstrWord, int LangId, SpeechLexiconType TypeFlags, ISpeechLexiconPronunciations* ppPronunciations);
    HRESULT GetGenerationChange(int* GenerationID, ISpeechLexiconWords* ppWords);
}
enum IID_ISpeechLexiconWords = GUID(0x8d199862, 0x415e, 0x47d5, [0xac, 0x4f, 0xfa, 0xa6, 0x8, 0xb4, 0x24, 0xe6]);
interface ISpeechLexiconWords : IDispatch
{
    HRESULT get_Count(int* Count);
    HRESULT Item(int Index, ISpeechLexiconWord* Word);
    HRESULT get__NewEnum(IUnknown* EnumVARIANT);
}
enum IID_ISpeechLexiconWord = GUID(0x4e5b933c, 0xc9be, 0x48ed, [0x88, 0x42, 0x1e, 0xe5, 0x1b, 0xb1, 0xd4, 0xff]);
interface ISpeechLexiconWord : IDispatch
{
    HRESULT get_LangId(int* LangId);
    HRESULT get_Type(SpeechWordType* WordType);
    HRESULT get_Word(BSTR* Word);
    HRESULT get_Pronunciations(ISpeechLexiconPronunciations* Pronunciations);
}
enum IID_ISpeechLexiconPronunciations = GUID(0x72829128, 0x5682, 0x4704, [0xa0, 0xd4, 0x3e, 0x2b, 0xb6, 0xf2, 0xea, 0xd3]);
interface ISpeechLexiconPronunciations : IDispatch
{
    HRESULT get_Count(int* Count);
    HRESULT Item(int Index, ISpeechLexiconPronunciation* Pronunciation);
    HRESULT get__NewEnum(IUnknown* EnumVARIANT);
}
enum IID_ISpeechLexiconPronunciation = GUID(0x95252c5d, 0x9e43, 0x4f4a, [0x98, 0x99, 0x48, 0xee, 0x73, 0x35, 0x2f, 0x9f]);
interface ISpeechLexiconPronunciation : IDispatch
{
    HRESULT get_Type(SpeechLexiconType* LexiconType);
    HRESULT get_LangId(int* LangId);
    HRESULT get_PartOfSpeech(SpeechPartOfSpeech* PartOfSpeech);
    HRESULT get_PhoneIds(VARIANT* PhoneIds);
    HRESULT get_Symbolic(BSTR* Symbolic);
}
enum IID_ISpeechXMLRecoResult = GUID(0xaaec54af, 0x8f85, 0x4924, [0x94, 0x4d, 0xb7, 0x9d, 0x39, 0xd7, 0x2e, 0x19]);
interface ISpeechXMLRecoResult : ISpeechRecoResult
{
    HRESULT GetXMLResult(SPXMLRESULTOPTIONS Options, BSTR* pResult);
    HRESULT GetXMLErrorInfo(int* LineNumber, BSTR* ScriptLine, BSTR* Source, BSTR* Description, int* ResultCode, VARIANT_BOOL* IsError);
}
enum IID_ISpeechRecoResultDispatch = GUID(0x6d60eb64, 0xaced, 0x40a6, [0xbb, 0xf3, 0x4e, 0x55, 0x7f, 0x71, 0xde, 0xe2]);
interface ISpeechRecoResultDispatch : IDispatch
{
    HRESULT get_RecoContext(ISpeechRecoContext* RecoContext);
    HRESULT get_Times(ISpeechRecoResultTimes* Times);
    HRESULT putref_AudioFormat(ISpeechAudioFormat Format);
    HRESULT get_AudioFormat(ISpeechAudioFormat* Format);
    HRESULT get_PhraseInfo(ISpeechPhraseInfo* PhraseInfo);
    HRESULT Alternates(int RequestCount, int StartElement, int Elements, ISpeechPhraseAlternates* Alternates);
    HRESULT Audio(int StartElement, int Elements, ISpeechMemoryStream* Stream);
    HRESULT SpeakAudio(int StartElement, int Elements, SpeechVoiceSpeakFlags Flags, int* StreamNumber);
    HRESULT SaveToMemory(VARIANT* ResultBlock);
    HRESULT DiscardResultInfo(SpeechDiscardType ValueTypes);
    HRESULT GetXMLResult(SPXMLRESULTOPTIONS Options, BSTR* pResult);
    HRESULT GetXMLErrorInfo(int* LineNumber, BSTR* ScriptLine, BSTR* Source, BSTR* Description, HRESULT* ResultCode, VARIANT_BOOL* IsError);
    HRESULT SetTextFeedback(BSTR Feedback, VARIANT_BOOL WasSuccessful);
}
enum IID_ISpeechPhraseInfoBuilder = GUID(0x3b151836, 0xdf3a, 0x4e0a, [0x84, 0x6c, 0xd2, 0xad, 0xc9, 0x33, 0x43, 0x33]);
interface ISpeechPhraseInfoBuilder : IDispatch
{
    HRESULT RestorePhraseFromMemory(VARIANT* PhraseInMemory, ISpeechPhraseInfo* PhraseInfo);
}
enum IID_ISpeechPhoneConverter = GUID(0xc3e4f353, 0x433f, 0x43d6, [0x89, 0xa1, 0x6a, 0x62, 0xa7, 0x5, 0x4c, 0x3d]);
interface ISpeechPhoneConverter : IDispatch
{
    HRESULT get_LanguageId(int* LanguageId);
    HRESULT put_LanguageId(int LanguageId);
    HRESULT PhoneToId(const(BSTR) Phonemes, VARIANT* IdArray);
    HRESULT IdToPhone(const(VARIANT) IdArray, BSTR* Phonemes);
}
enum CLSID_SpNotifyTranslator = GUID(0xe2ae5372, 0x5d40, 0x11d2, [0x96, 0xe, 0x0, 0xc0, 0x4f, 0x8e, 0xe6, 0x28]);
struct SpNotifyTranslator
{
}
enum CLSID_SpObjectTokenCategory = GUID(0xa910187f, 0xc7a, 0x45ac, [0x92, 0xcc, 0x59, 0xed, 0xaf, 0xb7, 0x7b, 0x53]);
struct SpObjectTokenCategory
{
}
enum CLSID_SpObjectToken = GUID(0xef411752, 0x3736, 0x4cb4, [0x9c, 0x8c, 0x8e, 0xf4, 0xcc, 0xb5, 0x8e, 0xfe]);
struct SpObjectToken
{
}
enum CLSID_SpResourceManager = GUID(0x96749373, 0x3391, 0x11d2, [0x9e, 0xe3, 0x0, 0xc0, 0x4f, 0x79, 0x73, 0x96]);
struct SpResourceManager
{
}
enum CLSID_SpStreamFormatConverter = GUID(0x7013943a, 0xe2ec, 0x11d2, [0xa0, 0x86, 0x0, 0xc0, 0x4f, 0x8e, 0xf9, 0xb5]);
struct SpStreamFormatConverter
{
}
enum CLSID_SpMMAudioEnum = GUID(0xab1890a0, 0xe91f, 0x11d2, [0xbb, 0x91, 0x0, 0xc0, 0x4f, 0x8e, 0xe6, 0xc0]);
struct SpMMAudioEnum
{
}
enum CLSID_SpMMAudioIn = GUID(0xcf3d2e50, 0x53f2, 0x11d2, [0x96, 0xc, 0x0, 0xc0, 0x4f, 0x8e, 0xe6, 0x28]);
struct SpMMAudioIn
{
}
enum CLSID_SpMMAudioOut = GUID(0xa8c680eb, 0x3d32, 0x11d2, [0x9e, 0xe7, 0x0, 0xc0, 0x4f, 0x79, 0x73, 0x96]);
struct SpMMAudioOut
{
}
enum CLSID_SpStream = GUID(0x715d9c59, 0x4442, 0x11d2, [0x96, 0x5, 0x0, 0xc0, 0x4f, 0x8e, 0xe6, 0x28]);
struct SpStream
{
}
enum CLSID_SpVoice = GUID(0x96749377, 0x3391, 0x11d2, [0x9e, 0xe3, 0x0, 0xc0, 0x4f, 0x79, 0x73, 0x96]);
struct SpVoice
{
}
enum CLSID_SpSharedRecoContext = GUID(0x47206204, 0x5eca, 0x11d2, [0x96, 0xf, 0x0, 0xc0, 0x4f, 0x8e, 0xe6, 0x28]);
struct SpSharedRecoContext
{
}
enum CLSID_SpInprocRecognizer = GUID(0x41b89b6b, 0x9399, 0x11d2, [0x96, 0x23, 0x0, 0xc0, 0x4f, 0x8e, 0xe6, 0x28]);
struct SpInprocRecognizer
{
}
enum CLSID_SpSharedRecognizer = GUID(0x3bee4890, 0x4fe9, 0x4a37, [0x8c, 0x1e, 0x5e, 0x7e, 0x12, 0x79, 0x1c, 0x1f]);
struct SpSharedRecognizer
{
}
enum CLSID_SpLexicon = GUID(0x655e396, 0x25d0, 0x11d3, [0x9c, 0x26, 0x0, 0xc0, 0x4f, 0x8e, 0xf8, 0x7c]);
struct SpLexicon
{
}
enum CLSID_SpUnCompressedLexicon = GUID(0xc9e37c15, 0xdf92, 0x4727, [0x85, 0xd6, 0x72, 0xe5, 0xee, 0xb6, 0x99, 0x5a]);
struct SpUnCompressedLexicon
{
}
enum CLSID_SpCompressedLexicon = GUID(0x90903716, 0x2f42, 0x11d3, [0x9c, 0x26, 0x0, 0xc0, 0x4f, 0x8e, 0xf8, 0x7c]);
struct SpCompressedLexicon
{
}
enum CLSID_SpShortcut = GUID(0xd722f1a, 0x9fcf, 0x4e62, [0x96, 0xd8, 0x6d, 0xf8, 0xf0, 0x1a, 0x26, 0xaa]);
struct SpShortcut
{
}
enum CLSID_SpPhoneConverter = GUID(0x9185f743, 0x1143, 0x4c28, [0x86, 0xb5, 0xbf, 0xf1, 0x4f, 0x20, 0xe5, 0xc8]);
struct SpPhoneConverter
{
}
enum CLSID_SpPhoneticAlphabetConverter = GUID(0x4f414126, 0xdfe3, 0x4629, [0x99, 0xee, 0x79, 0x79, 0x78, 0x31, 0x7e, 0xad]);
struct SpPhoneticAlphabetConverter
{
}
enum CLSID_SpNullPhoneConverter = GUID(0x455f24e9, 0x7396, 0x4a16, [0x97, 0x15, 0x7c, 0xf, 0xdb, 0xe3, 0xef, 0xe3]);
struct SpNullPhoneConverter
{
}
enum CLSID_SpTextSelectionInformation = GUID(0xf92030a, 0xcbfd, 0x4ab8, [0xa1, 0x64, 0xff, 0x59, 0x85, 0x54, 0x7f, 0xf6]);
struct SpTextSelectionInformation
{
}
enum CLSID_SpPhraseInfoBuilder = GUID(0xc23fc28d, 0xc55f, 0x4720, [0x8b, 0x32, 0x91, 0xf7, 0x3c, 0x2b, 0xd5, 0xd1]);
struct SpPhraseInfoBuilder
{
}
enum CLSID_SpAudioFormat = GUID(0x9ef96870, 0xe160, 0x4792, [0x82, 0xd, 0x48, 0xcf, 0x6, 0x49, 0xe4, 0xec]);
struct SpAudioFormat
{
}
enum CLSID_SpWaveFormatEx = GUID(0xc79a574c, 0x63be, 0x44b9, [0x80, 0x1f, 0x28, 0x3f, 0x87, 0xf8, 0x98, 0xbe]);
struct SpWaveFormatEx
{
}
enum CLSID_SpInProcRecoContext = GUID(0x73ad6842, 0xace0, 0x45e8, [0xa4, 0xdd, 0x87, 0x95, 0x88, 0x1a, 0x2c, 0x2a]);
struct SpInProcRecoContext
{
}
enum CLSID_SpCustomStream = GUID(0x8dbef13f, 0x1948, 0x4aa8, [0x8c, 0xf0, 0x4, 0x8e, 0xeb, 0xed, 0x95, 0xd8]);
struct SpCustomStream
{
}
enum CLSID_SpFileStream = GUID(0x947812b3, 0x2ae1, 0x4644, [0xba, 0x86, 0x9e, 0x90, 0xde, 0xd7, 0xec, 0x91]);
struct SpFileStream
{
}
enum CLSID_SpMemoryStream = GUID(0x5fb7ef7d, 0xdff4, 0x468a, [0xb6, 0xb7, 0x2f, 0xcb, 0xd1, 0x88, 0xf9, 0x94]);
struct SpMemoryStream
{
}
enum IID_ISpTokenUI = GUID(0xf8e690f0, 0x39cb, 0x4843, [0xb8, 0xd7, 0xc8, 0x46, 0x96, 0xe1, 0x11, 0x9d]);
interface ISpTokenUI : IUnknown
{
    HRESULT IsUISupported(const(wchar)* pszTypeOfUI, void* pvExtraData, uint cbExtraData, IUnknown punkObject, BOOL* pfSupported);
    HRESULT DisplayUI(HWND hwndParent, const(wchar)* pszTitle, const(wchar)* pszTypeOfUI, void* pvExtraData, uint cbExtraData, ISpObjectToken pToken, IUnknown punkObject);
}
enum IID_ISpObjectTokenEnumBuilder = GUID(0x6b64f9f, 0x7fda, 0x11d2, [0xb4, 0xf2, 0x0, 0xc0, 0x4f, 0x79, 0x73, 0x96]);
interface ISpObjectTokenEnumBuilder : IEnumSpObjectTokens
{
    HRESULT SetAttribs(const(wchar)* pszReqAttribs, const(wchar)* pszOptAttribs);
    HRESULT AddTokens(uint cTokens, ISpObjectToken* pToken);
    HRESULT AddTokensFromDataKey(ISpDataKey pDataKey, const(wchar)* pszSubKey, const(wchar)* pszCategoryId);
    HRESULT AddTokensFromTokenEnum(IEnumSpObjectTokens pTokenEnum);
    HRESULT Sort(const(wchar)* pszTokenIdToListFirst);
}
enum IID_ISpErrorLog = GUID(0xf4711347, 0xe608, 0x11d2, [0xa0, 0x86, 0x0, 0xc0, 0x4f, 0x8e, 0xf9, 0xb5]);
interface ISpErrorLog : IUnknown
{
    HRESULT AddError(const(int) lLineNumber, HRESULT hr, const(wchar)* pszDescription, const(wchar)* pszHelpFile, uint dwHelpContext);
}
enum IID_ISpGrammarCompiler = GUID(0xb1e29d58, 0xa675, 0x11d2, [0x83, 0x2, 0x0, 0xc0, 0x4f, 0x8e, 0xe6, 0xc0]);
interface ISpGrammarCompiler : IUnknown
{
    HRESULT CompileStream(IStream pSource, IStream pDest, IStream pHeader, IUnknown pReserved, ISpErrorLog pErrorLog, uint dwFlags);
}
enum IID_ISpGramCompBackend = GUID(0x3ddca27c, 0x665c, 0x4786, [0x9f, 0x97, 0x8c, 0x90, 0xc3, 0x48, 0x8b, 0x61]);
interface ISpGramCompBackend : ISpGrammarBuilder
{
    HRESULT SetSaveObjects(IStream pStream, ISpErrorLog pErrorLog);
    HRESULT InitFromBinaryGrammar(const(SPBINARYGRAMMAR)* pBinaryData);
}
enum IID_ISpITNProcessor = GUID(0x12d7360f, 0xa1c9, 0x11d3, [0xbc, 0x90, 0x0, 0xc0, 0x4f, 0x72, 0xdf, 0x9f]);
interface ISpITNProcessor : IUnknown
{
    HRESULT LoadITNGrammar(PWSTR pszCLSID);
    HRESULT ITNPhrase(ISpPhraseBuilder pPhrase);
}
enum IID_ISpPhraseBuilder = GUID(0x88a3342a, 0xbed, 0x4834, [0x92, 0x2b, 0x88, 0xd4, 0x31, 0x73, 0x16, 0x2f]);
interface ISpPhraseBuilder : ISpPhrase
{
    HRESULT InitFromPhrase(const(SPPHRASE)* pPhrase);
    HRESULT InitFromSerializedPhrase(const(SPSERIALIZEDPHRASE)* pPhrase);
    HRESULT AddElements(uint cElements, const(SPPHRASEELEMENT)* pElement);
    HRESULT AddRules(const(SPPHRASERULEHANDLE) hParent, const(SPPHRASERULE)* pRule, SPPHRASERULEHANDLE* phNewRule);
    HRESULT AddProperties(const(SPPHRASEPROPERTYHANDLE) hParent, const(SPPHRASEPROPERTY)* pProperty, SPPHRASEPROPERTYHANDLE* phNewProperty);
    HRESULT AddReplacements(uint cReplacements, const(SPPHRASEREPLACEMENT)* pReplacements);
}
// [Not Found] IID_ISpTask
interface ISpTask
{
    HRESULT Execute(void* pvTaskData, const(int)* pfContinueProcessing);
}
// [Not Found] IID_ISpThreadTask
interface ISpThreadTask
{
    HRESULT InitThread(void* pvTaskData, HWND hwnd);
    HRESULT ThreadProc(void* pvTaskData, HANDLE hExitThreadEvent, HANDLE hNotifyEvent, HWND hwndWorker, const(int)* pfContinueProcessing);
    LRESULT WindowMessage(void* pvTaskData, HWND hWnd, uint Msg, WPARAM wParam, LPARAM lParam);
}
enum IID_ISpThreadControl = GUID(0xa6be4d73, 0x4403, 0x4358, [0xb2, 0x2d, 0x3, 0x46, 0xe2, 0x3b, 0x17, 0x64]);
interface ISpThreadControl : ISpNotifySink
{
    HRESULT StartThread(uint dwFlags, HWND* phwnd);
    HRESULT WaitForThreadDone(BOOL fForceStop, HRESULT* phrThreadResult, uint msTimeOut);
    HRESULT TerminateThread();
    HANDLE ThreadHandle();
    uint ThreadId();
    HANDLE NotifyEvent();
    HWND WindowHandle();
    HANDLE ThreadCompleteEvent();
    HANDLE ExitThreadEvent();
}
struct SPTMTHREADINFO
{
    int lPoolSize;
    int lPriority;
    uint ulConcurrencyLimit;
    uint ulMaxQuickAllocThreads;
}
enum IID_ISpTaskManager = GUID(0x2baeef81, 0x2ca3, 0x4331, [0x98, 0xf3, 0x26, 0xec, 0x5a, 0xbe, 0xfb, 0x3]);
interface ISpTaskManager : IUnknown
{
    HRESULT SetThreadPoolInfo(const(SPTMTHREADINFO)* pPoolInfo);
    HRESULT GetThreadPoolInfo(SPTMTHREADINFO* pPoolInfo);
    HRESULT QueueTask(ISpTask pTask, void* pvTaskData, HANDLE hCompEvent, uint* pdwGroupId, uint* pTaskID);
    HRESULT CreateReoccurringTask(ISpTask pTask, void* pvTaskData, HANDLE hCompEvent, ISpNotifySink* ppTaskCtrl);
    HRESULT CreateThreadControl(ISpThreadTask pTask, void* pvTaskData, int nPriority, ISpThreadControl* ppTaskCtrl);
    HRESULT TerminateTask(uint dwTaskId, uint ulWaitPeriod);
    HRESULT TerminateTaskGroup(uint dwGroupId, uint ulWaitPeriod);
}
alias SPVSKIPTYPE = int;
enum : int
{
    SPVST_SENTENCE = 0x00000001,
}

alias SPVESACTIONS = int;
enum : int
{
    SPVES_CONTINUE = 0x00000000,
    SPVES_ABORT    = 0x00000001,
    SPVES_SKIP     = 0x00000002,
    SPVES_RATE     = 0x00000004,
    SPVES_VOLUME   = 0x00000008,
}

enum IID_ISpTTSEngineSite = GUID(0x9880499b, 0xcce9, 0x11d2, [0xb5, 0x3, 0x0, 0xc0, 0x4f, 0x79, 0x73, 0x96]);
interface ISpTTSEngineSite : ISpEventSink
{
    uint GetActions();
    HRESULT Write(const(void)* pBuff, uint cb, uint* pcbWritten);
    HRESULT GetRate(int* pRateAdjust);
    HRESULT GetVolume(ushort* pusVolume);
    HRESULT GetSkipInfo(SPVSKIPTYPE* peType, int* plNumItems);
    HRESULT CompleteSkip(int ulNumSkipped);
}
struct SPVTEXTFRAG
{
    SPVTEXTFRAG* pNext;
    SPVSTATE State;
    const(wchar)* pTextStart;
    uint ulTextLen;
    uint ulTextSrcOffset;
}
enum IID_ISpTTSEngine = GUID(0xa74d7c8e, 0x4cc5, 0x4f2f, [0xa6, 0xeb, 0x80, 0x4d, 0xee, 0x18, 0x50, 0xe]);
interface ISpTTSEngine : IUnknown
{
    HRESULT Speak(uint dwSpeakFlags, const(GUID)* rguidFormatId, const(WAVEFORMATEX)* pWaveFormatEx, const(SPVTEXTFRAG)* pTextFragList, ISpTTSEngineSite pOutputSite);
    HRESULT GetOutputFormat(const(GUID)* pTargetFmtId, const(WAVEFORMATEX)* pTargetWaveFormatEx, GUID* pOutputFormatId, WAVEFORMATEX** ppCoMemOutputWaveFormatEx);
}
struct SPWORDENTRY
{
    SPWORDHANDLE hWord;
    ushort LangID;
    PWSTR pszDisplayText;
    PWSTR pszLexicalForm;
    ushort* aPhoneId;
    void* pvClientContext;
}
struct SPRULEENTRY
{
    SPRULEHANDLE hRule;
    SPSTATEHANDLE hInitialState;
    uint Attributes;
    void* pvClientRuleContext;
    void* pvClientGrammarContext;
}
alias SPTRANSITIONTYPE = int;
enum : int
{
    SPTRANSEPSILON   = 0x00000000,
    SPTRANSWORD      = 0x00000001,
    SPTRANSRULE      = 0x00000002,
    SPTRANSTEXTBUF   = 0x00000003,
    SPTRANSWILDCARD  = 0x00000004,
    SPTRANSDICTATION = 0x00000005,
}

struct SPTRANSITIONENTRY
{
    SPTRANSITIONID ID;
    SPSTATEHANDLE hNextState;
    ubyte Type;
    ubyte RequiredConfidence;
    struct
    {
        uint fHasProperty;
    }
    float Weight;
    union
    {
        struct
        {
            SPSTATEHANDLE hRuleInitialState;
            SPRULEHANDLE hRule;
            void* pvClientRuleContext;
        }
        struct
        {
            SPWORDHANDLE hWord;
            void* pvClientWordContext;
        }
        struct
        {
            void* pvGrammarCookie;
        }
    }
}
struct SPTRANSITIONPROPERTY
{
    const(wchar)* pszName;
    uint ulId;
    const(wchar)* pszValue;
    VARIANT vValue;
}
struct SPSTATEINFO
{
    uint cAllocatedEntries;
    SPTRANSITIONENTRY* pTransitions;
    uint cEpsilons;
    uint cRules;
    uint cWords;
    uint cSpecialTransitions;
}
struct SPPATHENTRY
{
    SPTRANSITIONID hTransition;
    SPPHRASEELEMENT elem;
}
enum IID_ISpCFGInterpreterSite = GUID(0x6a6ffad8, 0x78b6, 0x473d, [0xb8, 0x44, 0x98, 0x15, 0x2e, 0x4f, 0xb1, 0x6b]);
interface ISpCFGInterpreterSite : IUnknown
{
    HRESULT AddTextReplacement(SPPHRASEREPLACEMENT* pReplace);
    HRESULT AddProperty(const(SPPHRASEPROPERTY)* pProperty);
    HRESULT GetResourceValue(const(wchar)* pszResourceName, PWSTR* ppCoMemResource);
}
enum IID_ISpCFGInterpreter = GUID(0xf3d3f926, 0x11fc, 0x11d3, [0xbb, 0x97, 0x0, 0xc0, 0x4f, 0x8e, 0xe6, 0xc0]);
interface ISpCFGInterpreter : IUnknown
{
    HRESULT InitGrammar(const(wchar)* pszGrammarName, const(void)** pvGrammarData);
    HRESULT Interpret(ISpPhraseBuilder pPhrase, const(uint) ulFirstElement, const(uint) ulCountOfElements, ISpCFGInterpreterSite pSite);
}
alias SPCFGNOTIFY = int;
enum : int
{
    SPCFGN_ADD        = 0x00000000,
    SPCFGN_REMOVE     = 0x00000001,
    SPCFGN_INVALIDATE = 0x00000002,
    SPCFGN_ACTIVATE   = 0x00000003,
    SPCFGN_DEACTIVATE = 0x00000004,
}

alias SPRESULTTYPE = int;
enum : int
{
    SPRT_CFG               = 0x00000000,
    SPRT_SLM               = 0x00000001,
    SPRT_PROPRIETARY       = 0x00000002,
    SPRT_FALSE_RECOGNITION = 0x00000004,
    SPRT_TYPE_MASK         = 0x00000003,
    SPRT_EMULATED          = 0x00000008,
    SPRT_EXTENDABLE_PARSE  = 0x00000010,
}

struct SPPHRASEALT
{
    ISpPhraseBuilder pPhrase;
    uint ulStartElementInParent;
    uint cElementsInParent;
    uint cElementsInAlternate;
    void* pvAltExtra;
    uint cbAltExtra;
}
struct SPRECORESULTINFO
{
    uint cbSize;
    SPRESULTTYPE eResultType;
    BOOL fHypothesis;
    BOOL fProprietaryAutoPause;
    ulong ullStreamPosStart;
    ulong ullStreamPosEnd;
    SPGRAMMARHANDLE hGrammar;
    uint ulSizeEngineData;
    void* pvEngineData;
    ISpPhraseBuilder pPhrase;
    SPPHRASEALT* aPhraseAlts;
    uint ulNumAlts;
}
struct SPRECORESULTINFOEX
{
    SPRECORESULTINFO Base;
    ulong ullStreamTimeStart;
    ulong ullStreamTimeEnd;
}
alias SPWORDINFOOPT = int;
enum : int
{
    SPWIO_NONE      = 0x00000000,
    SPWIO_WANT_TEXT = 0x00000001,
}

alias SPRULEINFOOPT = int;
enum : int
{
    SPRIO_NONE = 0x00000000,
}

struct SPPARSEINFO
{
    uint cbSize;
    SPRULEHANDLE hRule;
    ulong ullAudioStreamPosition;
    uint ulAudioSize;
    uint cTransitions;
    SPPATHENTRY* pPath;
    GUID SREngineID;
    uint ulSREnginePrivateDataSize;
    const(ubyte)* pSREnginePrivateData;
    BOOL fHypothesis;
}
enum IID_ISpSREngineSite = GUID(0x3b414aec, 0x720c, 0x4883, [0xb9, 0xef, 0x17, 0x8c, 0xd3, 0x94, 0xfb, 0x3a]);
interface ISpSREngineSite : IUnknown
{
    HRESULT Read(void* pv, uint cb, uint* pcbRead);
    HRESULT DataAvailable(uint* pcb);
    HRESULT SetBufferNotifySize(uint cbSize);
    HRESULT ParseFromTransitions(const(SPPARSEINFO)* pParseInfo, ISpPhraseBuilder* ppNewPhrase);
    HRESULT Recognition(const(SPRECORESULTINFO)* pResultInfo);
    HRESULT AddEvent(const(SPEVENT)* pEvent, SPRECOCONTEXTHANDLE hSAPIRecoContext);
    HRESULT Synchronize(ulong ullProcessedThruPos);
    HRESULT GetWordInfo(SPWORDENTRY* pWordEntry, SPWORDINFOOPT Options);
    HRESULT SetWordClientContext(SPWORDHANDLE hWord, void* pvClientContext);
    HRESULT GetRuleInfo(SPRULEENTRY* pRuleEntry, SPRULEINFOOPT Options);
    HRESULT SetRuleClientContext(SPRULEHANDLE hRule, void* pvClientContext);
    HRESULT GetStateInfo(SPSTATEHANDLE hState, SPSTATEINFO* pStateInfo);
    HRESULT GetResource(SPRULEHANDLE hRule, const(wchar)* pszResourceName, PWSTR* ppCoMemResource);
    HRESULT GetTransitionProperty(SPTRANSITIONID ID, SPTRANSITIONPROPERTY** ppCoMemProperty);
    HRESULT IsAlternate(SPRULEHANDLE hRule, SPRULEHANDLE hAltRule);
    HRESULT GetMaxAlternates(SPRULEHANDLE hRule, uint* pulNumAlts);
    HRESULT GetContextMaxAlternates(SPRECOCONTEXTHANDLE hContext, uint* pulNumAlts);
    HRESULT UpdateRecoPos(ulong ullCurrentRecoPos);
}
enum IID_ISpSREngineSite2 = GUID(0x7bc6e012, 0x684a, 0x493e, [0xbd, 0xd4, 0x2b, 0xf5, 0xfb, 0xf4, 0x8c, 0xfe]);
interface ISpSREngineSite2 : ISpSREngineSite
{
    HRESULT AddEventEx(const(SPEVENTEX)* pEvent, SPRECOCONTEXTHANDLE hSAPIRecoContext);
    HRESULT UpdateRecoPosEx(ulong ullCurrentRecoPos, ulong ullCurrentRecoTime);
    HRESULT GetRuleTransition(uint ulGrammarID, uint RuleIndex, SPTRANSITIONENTRY* pTrans);
    HRESULT RecognitionEx(const(SPRECORESULTINFOEX)* pResultInfo);
}
alias SPPROPSRC = int;
enum : int
{
    SPPROPSRC_RECO_INST    = 0x00000000,
    SPPROPSRC_RECO_CTX     = 0x00000001,
    SPPROPSRC_RECO_GRAMMAR = 0x00000002,
}

enum IID_ISpSREngine = GUID(0x2f472991, 0x854b, 0x4465, [0xb6, 0x13, 0xfb, 0xaf, 0xb3, 0xad, 0x8e, 0xd8]);
interface ISpSREngine : IUnknown
{
    HRESULT SetSite(ISpSREngineSite pSite);
    HRESULT GetInputAudioFormat(const(GUID)* pguidSourceFormatId, const(WAVEFORMATEX)* pSourceWaveFormatEx, GUID* pguidDesiredFormatId, WAVEFORMATEX** ppCoMemDesiredWaveFormatEx);
    HRESULT RecognizeStream(const(GUID)* rguidFmtId, const(WAVEFORMATEX)* pWaveFormatEx, HANDLE hRequestSync, HANDLE hDataAvailable, HANDLE hExit, BOOL fNewAudioStream, BOOL fRealTimeAudio, ISpObjectToken pAudioObjectToken);
    HRESULT SetRecoProfile(ISpObjectToken pProfile);
    HRESULT OnCreateGrammar(void* pvEngineRecoContext, SPGRAMMARHANDLE hSAPIGrammar, void** ppvEngineGrammarContext);
    HRESULT OnDeleteGrammar(void* pvEngineGrammar);
    HRESULT LoadProprietaryGrammar(void* pvEngineGrammar, const(GUID)* rguidParam, const(wchar)* pszStringParam, const(void)* pvDataParam, uint ulDataSize, SPLOADOPTIONS Options);
    HRESULT UnloadProprietaryGrammar(void* pvEngineGrammar);
    HRESULT SetProprietaryRuleState(void* pvEngineGrammar, const(wchar)* pszName, void* pReserved, SPRULESTATE NewState, uint* pcRulesChanged);
    HRESULT SetProprietaryRuleIdState(void* pvEngineGrammar, uint dwRuleId, SPRULESTATE NewState);
    HRESULT LoadSLM(void* pvEngineGrammar, const(wchar)* pszTopicName);
    HRESULT UnloadSLM(void* pvEngineGrammar);
    HRESULT SetSLMState(void* pvEngineGrammar, SPRULESTATE NewState);
    HRESULT SetWordSequenceData(void* pvEngineGrammar, const(wchar)* pText, uint cchText, const(SPTEXTSELECTIONINFO)* pInfo);
    HRESULT SetTextSelection(void* pvEngineGrammar, const(SPTEXTSELECTIONINFO)* pInfo);
    HRESULT IsPronounceable(void* pvEngineGrammar, const(wchar)* pszWord, SPWORDPRONOUNCEABLE* pWordPronounceable);
    HRESULT OnCreateRecoContext(SPRECOCONTEXTHANDLE hSAPIRecoContext, void** ppvEngineContext);
    HRESULT OnDeleteRecoContext(void* pvEngineContext);
    HRESULT PrivateCall(void* pvEngineContext, void* pCallFrame, uint ulCallFrameSize);
    HRESULT SetAdaptationData(void* pvEngineContext, const(wchar)* pAdaptationData, const(uint) cch);
    HRESULT SetPropertyNum(SPPROPSRC eSrc, void* pvSrcObj, const(wchar)* pName, int lValue);
    HRESULT GetPropertyNum(SPPROPSRC eSrc, void* pvSrcObj, const(wchar)* pName, int* lValue);
    HRESULT SetPropertyString(SPPROPSRC eSrc, void* pvSrcObj, const(wchar)* pName, const(wchar)* pValue);
    HRESULT GetPropertyString(SPPROPSRC eSrc, void* pvSrcObj, const(wchar)* pName, PWSTR* ppCoMemValue);
    HRESULT SetGrammarState(void* pvEngineGrammar, SPGRAMMARSTATE eGrammarState);
    HRESULT WordNotify(SPCFGNOTIFY Action, uint cWords, const(SPWORDENTRY)* pWords);
    HRESULT RuleNotify(SPCFGNOTIFY Action, uint cRules, const(SPRULEENTRY)* pRules);
    HRESULT PrivateCallEx(void* pvEngineContext, const(void)* pInCallFrame, uint ulInCallFrameSize, void** ppvCoMemResponse, uint* pulResponseSize);
    HRESULT SetContextState(void* pvEngineContext, SPCONTEXTSTATE eContextState);
}
enum IID_ISpSREngine2 = GUID(0x7ba627d8, 0x33f9, 0x4375, [0x90, 0xc5, 0x99, 0x85, 0xae, 0xe5, 0xed, 0xe5]);
interface ISpSREngine2 : ISpSREngine
{
    HRESULT PrivateCallImmediate(void* pvEngineContext, const(void)* pInCallFrame, uint ulInCallFrameSize, void** ppvCoMemResponse, uint* pulResponseSize);
    HRESULT SetAdaptationData2(void* pvEngineContext, const(wchar)* pAdaptationData, const(uint) cch, const(wchar)* pTopicName, SPADAPTATIONSETTINGS eSettings, SPADAPTATIONRELEVANCE eRelevance);
    HRESULT SetGrammarPrefix(void* pvEngineGrammar, const(wchar)* pszPrefix, BOOL fIsPrefixRequired);
    HRESULT SetRulePriority(SPRULEHANDLE hRule, void* pvClientRuleContext, int nRulePriority);
    HRESULT EmulateRecognition(ISpPhrase pPhrase, uint dwCompareFlags);
    HRESULT SetSLMWeight(void* pvEngineGrammar, float flWeight);
    HRESULT SetRuleWeight(SPRULEHANDLE hRule, void* pvClientRuleContext, float flWeight);
    HRESULT SetTrainingState(BOOL fDoingTraining, BOOL fAdaptFromTrainingData);
    HRESULT ResetAcousticModelAdaptation();
    HRESULT OnLoadCFG(void* pvEngineGrammar, const(SPBINARYGRAMMAR)* pGrammarData, uint ulGrammarID);
    HRESULT OnUnloadCFG(void* pvEngineGrammar, uint ulGrammarID);
}
struct SPPHRASEALTREQUEST
{
    uint ulStartElement;
    uint cElements;
    uint ulRequestAltCount;
    void* pvResultExtra;
    uint cbResultExtra;
    ISpPhrase pPhrase;
    ISpRecoContext pRecoContext;
}
enum IID_ISpSRAlternates = GUID(0xfece8294, 0x2be1, 0x408f, [0x8e, 0x68, 0x2d, 0xe3, 0x77, 0x9, 0x2f, 0xe]);
interface ISpSRAlternates : IUnknown
{
    HRESULT GetAlternates(SPPHRASEALTREQUEST* pAltRequest, SPPHRASEALT** ppAlts, uint* pcAlts);
    HRESULT Commit(SPPHRASEALTREQUEST* pAltRequest, SPPHRASEALT* pAlt, void** ppvResultExtra, uint* pcbResultExtra);
}
enum IID_ISpSRAlternates2 = GUID(0xf338f437, 0xcb33, 0x4020, [0x9c, 0xab, 0xc7, 0x1f, 0xf9, 0xce, 0x12, 0xd3]);
interface ISpSRAlternates2 : ISpSRAlternates
{
    HRESULT CommitText(SPPHRASEALTREQUEST* pAltRequest, const(wchar)* pcszNewText, SPCOMMITFLAGS commitFlags);
}
enum IID__ISpPrivateEngineCall = GUID(0x8e7c791e, 0x4467, 0x11d3, [0x97, 0x23, 0x0, 0xc0, 0x4f, 0x72, 0xdb, 0x8]);
interface _ISpPrivateEngineCall : IUnknown
{
    HRESULT CallEngine(void* pCallFrame, uint ulCallFrameSize);
    HRESULT CallEngineEx(const(void)* pInFrame, uint ulInFrameSize, void** ppCoMemOutFrame, uint* pulOutFrameSize);
}
enum IID_ISpPrivateEngineCallEx = GUID(0xdefd682a, 0xfe0a, 0x42b9, [0xbf, 0xa1, 0x56, 0xd3, 0xd6, 0xce, 0xcf, 0xaf]);
interface ISpPrivateEngineCallEx : IUnknown
{
    HRESULT CallEngineSynchronize(const(void)* pInFrame, uint ulInFrameSize, void** ppCoMemOutFrame, uint* pulOutFrameSize);
    HRESULT CallEngineImmediate(const(void)* pInFrame, uint ulInFrameSize, void** ppCoMemOutFrame, uint* pulOutFrameSize);
}
enum CLSID_SpDataKey = GUID(0xd9f6ee60, 0x58c9, 0x458b, [0x88, 0xe1, 0x2f, 0x90, 0x8f, 0xd7, 0xf8, 0x7c]);
struct SpDataKey
{
}
enum CLSID_SpObjectTokenEnum = GUID(0x3918d75f, 0xacb, 0x41f2, [0xb7, 0x33, 0x92, 0xaa, 0x15, 0xbc, 0xec, 0xf6]);
struct SpObjectTokenEnum
{
}
enum CLSID_SpPhraseBuilder = GUID(0x777b6bbd, 0x2ff2, 0x11d3, [0x88, 0xfe, 0x0, 0xc0, 0x4f, 0x8e, 0xf9, 0xb5]);
struct SpPhraseBuilder
{
}
enum CLSID_SpITNProcessor = GUID(0x12d73610, 0xa1c9, 0x11d3, [0xbc, 0x90, 0x0, 0xc0, 0x4f, 0x72, 0xdf, 0x9f]);
struct SpITNProcessor
{
}
enum CLSID_SpGrammarCompiler = GUID(0xb1e29d59, 0xa675, 0x11d2, [0x83, 0x2, 0x0, 0xc0, 0x4f, 0x8e, 0xe6, 0xc0]);
struct SpGrammarCompiler
{
}
enum CLSID_SpW3CGrammarCompiler = GUID(0xd2c13906, 0x51ef, 0x454e, [0xbc, 0x67, 0xa5, 0x24, 0x75, 0xff, 0x7, 0x4c]);
struct SpW3CGrammarCompiler
{
}
enum CLSID_SpGramCompBackend = GUID(0xda93e903, 0xc843, 0x11d2, [0xa0, 0x84, 0x0, 0xc0, 0x4f, 0x8e, 0xf9, 0xb5]);
struct SpGramCompBackend
{
}
