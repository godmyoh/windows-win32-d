module windows.win32.system.windowsprogramming;

import windows.win32.guid : GUID;
import windows.win32.foundation : BOOL, BOOLEAN, BSTR, CHAR, FILETIME, HANDLE, HGLOBAL, HINSTANCE, HLOCAL, HMODULE, HRESULT, HWND, LPARAM, LRESULT, NTSTATUS, PSTR, PWSTR, RECT, UNICODE_STRING, VARIANT_BOOL, WPARAM;
import windows.win32.graphics.gdi : HDC, RGNDATA;
import windows.win32.security : SECURITY_ATTRIBUTES;
import windows.win32.system.com : IStream, IUnknown, SAFEARRAY;
import windows.win32.system.kernel : LIST_ENTRY, STRING;
import windows.win32.system.ole : OLE_HANDLE;
import windows.win32.system.registry : HKEY;

version (Windows):
extern (Windows):

alias TDIENTITY_ENTITY_TYPE = uint;
enum : uint
{
    GENERIC_ENTITY = 0x00000000,
    AT_ENTITY      = 0x00000280,
    CL_NL_ENTITY   = 0x00000301,
    CO_NL_ENTITY   = 0x00000300,
    CL_TL_ENTITY   = 0x00000401,
    CO_TL_ENTITY   = 0x00000400,
    ER_ENTITY      = 0x00000380,
    IF_ENTITY      = 0x00000200,
}

int uaw_lstrcmpW(ushort*, ushort*);
int uaw_lstrcmpiW(ushort*, ushort*);
int uaw_lstrlenW(ushort*);
ushort* uaw_wcschr(ushort*, wchar);
ushort* uaw_wcscpy(ushort*, ushort*);
int uaw_wcsicmp(ushort*, ushort*);
ulong uaw_wcslen(ushort*);
ushort* uaw_wcsrchr(ushort*, wchar);
ulong RtlGetReturnAddressHijackTarget();
uint RtlRaiseCustomSystemEventTrigger(CUSTOM_SYSTEM_EVENT_TRIGGER_CONFIG*);
BOOL IsApiSetImplemented(const(char)*);
BOOL QueryThreadCycleTime(HANDLE, ulong*);
BOOL QueryProcessCycleTime(HANDLE, ulong*);
BOOL QueryIdleProcessorCycleTime(uint*, ulong*);
BOOL QueryIdleProcessorCycleTimeEx(ushort, uint*, ulong*);
void QueryInterruptTimePrecise(ulong*);
void QueryUnbiasedInterruptTimePrecise(ulong*);
void QueryInterruptTime(ulong*);
BOOL QueryUnbiasedInterruptTime(ulong*);
HRESULT QueryAuxiliaryCounterFrequency(ulong*);
HRESULT ConvertAuxiliaryCounterToPerformanceCounter(ulong, ulong*, ulong*);
HRESULT ConvertPerformanceCounterToAuxiliaryCounter(ulong, ulong*, ulong*);
ulong GlobalCompact(uint);
void GlobalFix(HGLOBAL);
void GlobalUnfix(HGLOBAL);
void* GlobalWire(HGLOBAL);
BOOL GlobalUnWire(HGLOBAL);
ulong LocalShrink(HLOCAL, uint);
ulong LocalCompact(uint);
BOOL SetEnvironmentStringsA(PSTR);
uint SetHandleCount(uint);
BOOL RequestDeviceWakeup(HANDLE);
BOOL CancelDeviceWakeupRequest(HANDLE);
BOOL SetMessageWaitingIndicator(HANDLE, uint);
int MulDiv(int, int, int);
BOOL GetSystemRegistryQuota(uint*, uint*);
BOOL FileTimeToDosDateTime(const(FILETIME)*, ushort*, ushort*);
BOOL DosDateTimeToFileTime(ushort, ushort, FILETIME*);
int _lopen(const(char)*, int);
int _lcreat(const(char)*, int);
uint _lread(int, void*, uint);
uint _lwrite(int, const(char)*, uint);
int _hread(int, void*, int);
int _hwrite(int, const(char)*, int);
int _lclose(int);
int _llseek(int, int, int);
HANDLE OpenMutexA(uint, BOOL, const(char)*);
HANDLE OpenSemaphoreA(uint, BOOL, const(char)*);
HANDLE CreateWaitableTimerA(SECURITY_ATTRIBUTES*, BOOL, const(char)*);
HANDLE OpenWaitableTimerA(uint, BOOL, const(char)*);
HANDLE CreateWaitableTimerExA(SECURITY_ATTRIBUTES*, const(char)*, uint, uint);
uint GetFirmwareEnvironmentVariableA(const(char)*, const(char)*, void*, uint);
uint GetFirmwareEnvironmentVariableW(const(wchar)*, const(wchar)*, void*, uint);
uint GetFirmwareEnvironmentVariableExA(const(char)*, const(char)*, void*, uint, uint*);
uint GetFirmwareEnvironmentVariableExW(const(wchar)*, const(wchar)*, void*, uint, uint*);
BOOL SetFirmwareEnvironmentVariableA(const(char)*, const(char)*, void*, uint);
BOOL SetFirmwareEnvironmentVariableW(const(wchar)*, const(wchar)*, void*, uint);
BOOL SetFirmwareEnvironmentVariableExA(const(char)*, const(char)*, void*, uint, uint);
BOOL SetFirmwareEnvironmentVariableExW(const(wchar)*, const(wchar)*, void*, uint, uint);
BOOL IsNativeVhdBoot(BOOL*);
uint GetProfileIntA(const(char)*, const(char)*, int);
uint GetProfileIntW(const(wchar)*, const(wchar)*, int);
uint GetProfileStringA(const(char)*, const(char)*, const(char)*, PSTR, uint);
uint GetProfileStringW(const(wchar)*, const(wchar)*, const(wchar)*, PWSTR, uint);
BOOL WriteProfileStringA(const(char)*, const(char)*, const(char)*);
BOOL WriteProfileStringW(const(wchar)*, const(wchar)*, const(wchar)*);
uint GetProfileSectionA(const(char)*, PSTR, uint);
uint GetProfileSectionW(const(wchar)*, PWSTR, uint);
BOOL WriteProfileSectionA(const(char)*, const(char)*);
BOOL WriteProfileSectionW(const(wchar)*, const(wchar)*);
uint GetPrivateProfileIntA(const(char)*, const(char)*, int, const(char)*);
int GetPrivateProfileIntW(const(wchar)*, const(wchar)*, int, const(wchar)*);
uint GetPrivateProfileStringA(const(char)*, const(char)*, const(char)*, PSTR, uint, const(char)*);
uint GetPrivateProfileStringW(const(wchar)*, const(wchar)*, const(wchar)*, PWSTR, uint, const(wchar)*);
BOOL WritePrivateProfileStringA(const(char)*, const(char)*, const(char)*, const(char)*);
BOOL WritePrivateProfileStringW(const(wchar)*, const(wchar)*, const(wchar)*, const(wchar)*);
uint GetPrivateProfileSectionA(const(char)*, PSTR, uint, const(char)*);
uint GetPrivateProfileSectionW(const(wchar)*, PWSTR, uint, const(wchar)*);
BOOL WritePrivateProfileSectionA(const(char)*, const(char)*, const(char)*);
BOOL WritePrivateProfileSectionW(const(wchar)*, const(wchar)*, const(wchar)*);
uint GetPrivateProfileSectionNamesA(PSTR, uint, const(char)*);
uint GetPrivateProfileSectionNamesW(PWSTR, uint, const(wchar)*);
BOOL GetPrivateProfileStructA(const(char)*, const(char)*, void*, uint, const(char)*);
BOOL GetPrivateProfileStructW(const(wchar)*, const(wchar)*, void*, uint, const(wchar)*);
BOOL WritePrivateProfileStructA(const(char)*, const(char)*, void*, uint, const(char)*);
BOOL WritePrivateProfileStructW(const(wchar)*, const(wchar)*, void*, uint, const(wchar)*);
BOOL IsBadHugeReadPtr(const(void)*, ulong);
BOOL IsBadHugeWritePtr(void*, ulong);
BOOL GetComputerNameA(PSTR, uint*);
BOOL GetComputerNameW(PWSTR, uint*);
BOOL DnsHostnameToComputerNameA(const(char)*, PSTR, uint*);
BOOL DnsHostnameToComputerNameW(const(wchar)*, PWSTR, uint*);
BOOL GetUserNameA(PSTR, uint*);
BOOL GetUserNameW(PWSTR, uint*);
BOOL IsTokenUntrusted(HANDLE);
BOOL CancelTimerQueueTimer(HANDLE, HANDLE);
BOOL GetCurrentHwProfileA(HW_PROFILE_INFOA*);
BOOL GetCurrentHwProfileW(HW_PROFILE_INFOW*);
BOOL ReplacePartitionUnit(PWSTR, PWSTR, uint);
ulong GetThreadEnabledXStateFeatures();
BOOL EnableProcessOptionalXStateFeatures(ulong);
uint RaiseCustomSystemEventTrigger(CUSTOM_SYSTEM_EVENT_TRIGGER_CONFIG*);
BOOLEAN RtlIsNameLegalDOS8Dot3(UNICODE_STRING*, STRING*, BOOLEAN*);
NTSTATUS RtlLocalTimeToSystemTime(long*, long*);
BOOLEAN RtlTimeToSecondsSince1970(long*, uint*);
void RtlFreeAnsiString(STRING*);
void RtlFreeUnicodeString(UNICODE_STRING*);
void RtlFreeOemString(STRING*);
void RtlInitString(STRING*, byte*);
NTSTATUS RtlInitStringEx(STRING*, byte*);
void RtlInitAnsiString(STRING*, byte*);
NTSTATUS RtlInitAnsiStringEx(STRING*, byte*);
void RtlInitUnicodeString(UNICODE_STRING*, const(wchar)*);
NTSTATUS RtlAnsiStringToUnicodeString(UNICODE_STRING*, STRING*, BOOLEAN);
NTSTATUS RtlUnicodeStringToAnsiString(STRING*, UNICODE_STRING*, BOOLEAN);
NTSTATUS RtlUnicodeStringToOemString(STRING*, UNICODE_STRING*, BOOLEAN);
NTSTATUS RtlUnicodeToMultiByteSize(uint*, PWSTR, uint);
NTSTATUS RtlCharToInteger(byte*, uint, uint*);
uint RtlUniform(uint*);
FEATURE_ENABLED_STATE GetFeatureEnabledState(uint, FEATURE_CHANGE_TIME);
void RecordFeatureUsage(uint, uint, uint, const(char)*);
void RecordFeatureError(uint, const(FEATURE_ERROR)*);
void SubscribeFeatureStateChangeNotification(FEATURE_STATE_CHANGE_SUBSCRIPTION*, PFEATURE_STATE_CHANGE_CALLBACK, void*);
void UnsubscribeFeatureStateChangeNotification(FEATURE_STATE_CHANGE_SUBSCRIPTION);
uint GetFeatureVariant(uint, FEATURE_CHANGE_TIME, uint*, BOOL*);
HDC DCIOpenProvider();
void DCICloseProvider(HDC);
int DCICreatePrimary(HDC, DCISURFACEINFO**);
int DCICreateOffscreen(HDC, uint, uint, uint, uint, uint, uint, uint, uint, DCIOFFSCREEN**);
int DCICreateOverlay(HDC, void*, DCIOVERLAY**);
int DCIEnum(HDC, RECT*, RECT*, void*, void*);
int DCISetSrcDestClip(DCIOFFSCREEN*, RECT*, RECT*, RGNDATA*);
HWINWATCH WinWatchOpen(HWND);
void WinWatchClose(HWINWATCH);
uint WinWatchGetClipList(HWINWATCH, RECT*, uint, RGNDATA*);
BOOL WinWatchDidStatusChange(HWINWATCH);
uint GetWindowRegionData(HWND, uint, RGNDATA*);
uint GetDCRegionData(HDC, uint, RGNDATA*);
BOOL WinWatchNotify(HWINWATCH, WINWATCHNOTIFYPROC, LPARAM);
void DCIEndAccess(DCISURFACEINFO*);
int DCIBeginAccess(DCISURFACEINFO*, int, int, int, int);
void DCIDestroy(DCISURFACEINFO*);
int DCIDraw(DCIOFFSCREEN*);
int DCISetClipList(DCIOFFSCREEN*, RGNDATA*);
int DCISetDestination(DCIOFFSCREEN*, RECT*, RECT*);
uint GdiEntry13();
HRESULT RunSetupCommandA(HWND, const(char)*, const(char)*, const(char)*, const(char)*, HANDLE*, uint, void*);
HRESULT RunSetupCommandW(HWND, const(wchar)*, const(wchar)*, const(wchar)*, const(wchar)*, HANDLE*, uint, void*);
uint NeedRebootInit();
BOOL NeedReboot(uint);
HRESULT RebootCheckOnInstallA(HWND, const(char)*, const(char)*, uint);
HRESULT RebootCheckOnInstallW(HWND, const(wchar)*, const(wchar)*, uint);
HRESULT TranslateInfStringA(const(char)*, const(char)*, const(char)*, const(char)*, PSTR, uint, uint*, void*);
HRESULT TranslateInfStringW(const(wchar)*, const(wchar)*, const(wchar)*, const(wchar)*, PWSTR, uint, uint*, void*);
HRESULT RegInstallA(HMODULE, const(char)*, const(STRTABLEA)*);
HRESULT RegInstallW(HMODULE, const(wchar)*, const(STRTABLEW)*);
HRESULT LaunchINFSectionExW(HWND, HINSTANCE, PWSTR, int);
HRESULT ExecuteCabA(HWND, CABINFOA*, void*);
HRESULT ExecuteCabW(HWND, CABINFOW*, void*);
HRESULT AdvInstallFileA(HWND, const(char)*, const(char)*, const(char)*, const(char)*, uint, uint);
HRESULT AdvInstallFileW(HWND, const(wchar)*, const(wchar)*, const(wchar)*, const(wchar)*, uint, uint);
HRESULT RegSaveRestoreA(HWND, const(char)*, HKEY, const(char)*, const(char)*, const(char)*, uint);
HRESULT RegSaveRestoreW(HWND, const(wchar)*, HKEY, const(wchar)*, const(wchar)*, const(wchar)*, uint);
HRESULT RegSaveRestoreOnINFA(HWND, const(char)*, const(char)*, const(char)*, HKEY, HKEY, uint);
HRESULT RegSaveRestoreOnINFW(HWND, const(wchar)*, const(wchar)*, const(wchar)*, HKEY, HKEY, uint);
HRESULT RegRestoreAllA(HWND, const(char)*, HKEY);
HRESULT RegRestoreAllW(HWND, const(wchar)*, HKEY);
HRESULT FileSaveRestoreW(HWND, PWSTR, const(wchar)*, const(wchar)*, uint);
HRESULT FileSaveRestoreOnINFA(HWND, const(char)*, const(char)*, const(char)*, const(char)*, const(char)*, uint);
HRESULT FileSaveRestoreOnINFW(HWND, const(wchar)*, const(wchar)*, const(wchar)*, const(wchar)*, const(wchar)*, uint);
HRESULT AddDelBackupEntryA(const(char)*, const(char)*, const(char)*, uint);
HRESULT AddDelBackupEntryW(const(wchar)*, const(wchar)*, const(wchar)*, uint);
HRESULT FileSaveMarkNotExistA(const(char)*, const(char)*, const(char)*);
HRESULT FileSaveMarkNotExistW(const(wchar)*, const(wchar)*, const(wchar)*);
HRESULT GetVersionFromFileA(const(char)*, uint*, uint*, BOOL);
HRESULT GetVersionFromFileW(const(wchar)*, uint*, uint*, BOOL);
HRESULT GetVersionFromFileExA(const(char)*, uint*, uint*, BOOL);
HRESULT GetVersionFromFileExW(const(wchar)*, uint*, uint*, BOOL);
BOOL IsNTAdmin(uint, uint*);
HRESULT DelNodeA(const(char)*, uint);
HRESULT DelNodeW(const(wchar)*, uint);
HRESULT DelNodeRunDLL32W(HWND, HINSTANCE, PWSTR, int);
HRESULT OpenINFEngineA(const(char)*, const(char)*, uint, void**, void*);
HRESULT OpenINFEngineW(const(wchar)*, const(wchar)*, uint, void**, void*);
HRESULT TranslateInfStringExA(void*, const(char)*, const(char)*, const(char)*, PSTR, uint, uint*, void*);
HRESULT TranslateInfStringExW(void*, const(wchar)*, const(wchar)*, const(wchar)*, PWSTR, uint, uint*, void*);
HRESULT CloseINFEngine(void*);
HRESULT ExtractFilesA(const(char)*, const(char)*, uint, const(char)*, void*, uint);
HRESULT ExtractFilesW(const(wchar)*, const(wchar)*, uint, const(wchar)*, void*, uint);
int LaunchINFSectionW(HWND, HINSTANCE, PWSTR, int);
HRESULT UserInstStubWrapperA(HWND, HINSTANCE, const(char)*, int);
HRESULT UserInstStubWrapperW(HWND, HINSTANCE, const(wchar)*, int);
HRESULT UserUnInstStubWrapperA(HWND, HINSTANCE, const(char)*, int);
HRESULT UserUnInstStubWrapperW(HWND, HINSTANCE, const(wchar)*, int);
HRESULT SetPerUserSecValuesA(PERUSERSECTIONA*);
HRESULT SetPerUserSecValuesW(PERUSERSECTIONW*);
LRESULT SendIMEMessageExA(HWND, LPARAM);
LRESULT SendIMEMessageExW(HWND, LPARAM);
BOOL IMPGetIMEA(HWND, IMEPROA*);
BOOL IMPGetIMEW(HWND, IMEPROW*);
BOOL IMPQueryIMEA(IMEPROA*);
BOOL IMPQueryIMEW(IMEPROW*);
BOOL IMPSetIMEA(HWND, IMEPROA*);
BOOL IMPSetIMEW(HWND, IMEPROW*);
uint WINNLSGetIMEHotkey(HWND);
BOOL WINNLSEnableIME(HWND, BOOL);
BOOL WINNLSGetEnableStatus(HWND);
BOOL ApphelpCheckShellObject(const(GUID)*, BOOL, ulong*);
HRESULT WldpGetLockdownPolicy(WLDP_HOST_INFORMATION*, uint*, uint);
HRESULT WldpIsClassInApprovedList(const(GUID)*, WLDP_HOST_INFORMATION*, BOOL*, uint);
HRESULT WldpSetDynamicCodeTrust(HANDLE);
HRESULT WldpIsDynamicCodePolicyEnabled(BOOL*);
HRESULT WldpQueryDynamicCodeTrust(HANDLE, void*, uint);
HRESULT WldpQueryDeviceSecurityInformation(WLDP_DEVICE_SECURITY_INFORMATION*, uint, uint*);
HRESULT WldpCanExecuteFile(const(GUID)*, WLDP_EXECUTION_EVALUATION_OPTIONS, HANDLE, const(wchar)*, WLDP_EXECUTION_POLICY*);
HRESULT WldpCanExecuteBuffer(const(GUID)*, WLDP_EXECUTION_EVALUATION_OPTIONS, const(ubyte)*, uint, const(wchar)*, WLDP_EXECUTION_POLICY*);
HRESULT WldpCanExecuteStream(const(GUID)*, WLDP_EXECUTION_EVALUATION_OPTIONS, IStream, const(wchar)*, WLDP_EXECUTION_POLICY*);
enum WLDP_DLL = "WLDP.DLL";
enum WLDP_GETLOCKDOWNPOLICY_FN = "WldpGetLockdownPolicy";
enum WLDP_ISCLASSINAPPROVEDLIST_FN = "WldpIsClassInApprovedList";
enum WLDP_SETDYNAMICCODETRUST_FN = "WldpSetDynamicCodeTrust";
enum WLDP_ISDYNAMICCODEPOLICYENABLED_FN = "WldpIsDynamicCodePolicyEnabled";
enum WLDP_QUERYDANAMICCODETRUST_FN = "WldpQueryDynamicCodeTrust";
enum WLDP_QUERYDYNAMICCODETRUST_FN = "WldpQueryDynamicCodeTrust";
enum WLDP_QUERYWINDOWSLOCKDOWNMODE_FN = "WldpQueryWindowsLockdownMode";
enum WLDP_SETWINDOWSLOCKDOWNRESTRICTION_FN = "WldpSetWindowsLockdownRestriction";
enum WLDP_QUERYDEVICESECURITYINFORMATION_FN = "WldpQueryDeviceSecurityInformation";
enum WLDP_QUERYWINDOWSLOCKDOWNRESTRICTION_FN = "WldpQueryWindowsLockdownRestriction";
enum WLDP_ISAPPAPPROVEDBYPOLICY_FN = "WldpIsAppApprovedByPolicy";
enum WLDP_QUERYPOLICYSETTINGENABLED_FN = "WldpQueryPolicySettingEnabled";
enum WLDP_QUERYPOLICYSETTINGENABLED2_FN = "WldpQueryPolicySettingEnabled2";
enum WLDP_ISWCOSPRODUCTIONCONFIGURATION_FN = "WldpIsWcosProductionConfiguration";
enum WLDP_RESETWCOSPRODUCTIONCONFIGURATION_FN = "WldpResetWcosProductionConfiguration";
enum WLDP_ISPRODUCTIONCONFIGURATION_FN = "WldpIsProductionConfiguration";
enum WLDP_RESETPRODUCTIONCONFIGURATION_FN = "WldpResetProductionConfiguration";
enum WLDP_CANEXECUTEBUFFER_FN = "WldpCanExecuteBuffer";
enum WLDP_CANEXECUTEFILE_FN = "WldpCanExecuteFile";
enum WLDP_LOCKDOWN_UNDEFINED = 0x00000000;
enum WLDP_LOCKDOWN_DEFINED_FLAG = 0x80000000;
enum WLDP_LOCKDOWN_CONFIG_CI_FLAG = 0x00000001;
enum WLDP_LOCKDOWN_CONFIG_CI_AUDIT_FLAG = 0x00000002;
enum WLDP_LOCKDOWN_UMCIENFORCE_FLAG = 0x00000004;
enum WLDP_LOCKDOWN_AUDIT_FLAG = 0x00000008;
enum WLDP_LOCKDOWN_EXCLUSION_FLAG = 0x00000010;
enum WLDP_LOCKDOWN_OFF = 0x80000000;
enum WLDP_HOST_INFORMATION_REVISION = 0x00000001;
enum WLDP_FLAGS_SKIPSIGNATUREVALIDATION = 0x00000100;
enum MAX_TDI_ENTITIES = 0x00001000;
enum INFO_CLASS_GENERIC = 0x00000100;
enum INFO_CLASS_PROTOCOL = 0x00000200;
enum INFO_CLASS_IMPLEMENTATION = 0x00000300;
enum INFO_TYPE_PROVIDER = 0x00000100;
enum INFO_TYPE_ADDRESS_OBJECT = 0x00000200;
enum INFO_TYPE_CONNECTION = 0x00000300;
enum ENTITY_LIST_ID = 0x00000000;
enum INVALID_ENTITY_INSTANCE = 0xffffffffffffffff;
enum CONTEXT_SIZE = 0x00000010;
enum ENTITY_TYPE_ID = 0x00000001;
enum CO_TL_NBF = 0x00000400;
enum CO_TL_SPX = 0x00000402;
enum CO_TL_TCP = 0x00000404;
enum CO_TL_SPP = 0x00000406;
enum CL_TL_NBF = 0x00000401;
enum CL_TL_UDP = 0x00000403;
enum ER_ICMP = 0x00000380;
enum CL_NL_IPX = 0x00000301;
enum CL_NL_IP = 0x00000303;
enum AT_ARP = 0x00000280;
enum AT_NULL = 0x00000282;
enum IF_GENERIC = 0x00000200;
enum IF_MIB = 0x00000202;
enum IOCTL_TDI_TL_IO_CONTROL_ENDPOINT = 0x00210038;
enum DCI_VERSION = 0x00000100;
enum DCICREATEPRIMARYSURFACE = 0x00000001;
enum DCICREATEOFFSCREENSURFACE = 0x00000002;
enum DCICREATEOVERLAYSURFACE = 0x00000003;
enum DCIENUMSURFACE = 0x00000004;
enum DCIESCAPE = 0x00000005;
enum DCI_OK = 0x00000000;
enum DCI_FAIL_GENERIC = 0xffffffffffffffff;
enum DCI_FAIL_UNSUPPORTEDVERSION = 0xfffffffffffffffe;
enum DCI_FAIL_INVALIDSURFACE = 0xfffffffffffffffd;
enum DCI_FAIL_UNSUPPORTED = 0xfffffffffffffffc;
enum DCI_ERR_CURRENTLYNOTAVAIL = 0xfffffffffffffffb;
enum DCI_ERR_INVALIDRECT = 0xfffffffffffffffa;
enum DCI_ERR_UNSUPPORTEDFORMAT = 0xfffffffffffffff9;
enum DCI_ERR_UNSUPPORTEDMASK = 0xfffffffffffffff8;
enum DCI_ERR_TOOBIGHEIGHT = 0xfffffffffffffff7;
enum DCI_ERR_TOOBIGWIDTH = 0xfffffffffffffff6;
enum DCI_ERR_TOOBIGSIZE = 0xfffffffffffffff5;
enum DCI_ERR_OUTOFMEMORY = 0xfffffffffffffff4;
enum DCI_ERR_INVALIDPOSITION = 0xfffffffffffffff3;
enum DCI_ERR_INVALIDSTRETCH = 0xfffffffffffffff2;
enum DCI_ERR_INVALIDCLIPLIST = 0xfffffffffffffff1;
enum DCI_ERR_SURFACEISOBSCURED = 0xfffffffffffffff0;
enum DCI_ERR_XALIGN = 0xffffffffffffffef;
enum DCI_ERR_YALIGN = 0xffffffffffffffee;
enum DCI_ERR_XYALIGN = 0xffffffffffffffed;
enum DCI_ERR_WIDTHALIGN = 0xffffffffffffffec;
enum DCI_ERR_HEIGHTALIGN = 0xffffffffffffffeb;
enum DCI_STATUS_POINTERCHANGED = 0x00000001;
enum DCI_STATUS_STRIDECHANGED = 0x00000002;
enum DCI_STATUS_FORMATCHANGED = 0x00000004;
enum DCI_STATUS_SURFACEINFOCHANGED = 0x00000008;
enum DCI_STATUS_CHROMAKEYCHANGED = 0x00000010;
enum DCI_STATUS_WASSTILLDRAWING = 0x00000020;
enum DCI_SURFACE_TYPE = 0x0000000f;
enum DCI_PRIMARY = 0x00000000;
enum DCI_OFFSCREEN = 0x00000001;
enum DCI_OVERLAY = 0x00000002;
enum DCI_VISIBLE = 0x00000010;
enum DCI_CHROMAKEY = 0x00000020;
enum DCI_1632_ACCESS = 0x00000040;
enum DCI_DWORDSIZE = 0x00000080;
enum DCI_DWORDALIGN = 0x00000100;
enum DCI_WRITEONLY = 0x00000200;
enum DCI_ASYNC = 0x00000400;
enum DCI_CAN_STRETCHX = 0x00001000;
enum DCI_CAN_STRETCHY = 0x00002000;
enum DCI_CAN_STRETCHXN = 0x00004000;
enum DCI_CAN_STRETCHYN = 0x00008000;
enum DCI_CANOVERLAY = 0x00010000;
enum FILE_FLAG_OPEN_REQUIRING_OPLOCK = 0x00040000;
enum PROGRESS_CONTINUE = 0x00000000;
enum PROGRESS_CANCEL = 0x00000001;
enum PROGRESS_STOP = 0x00000002;
enum PROGRESS_QUIET = 0x00000003;
enum COPY_FILE_FAIL_IF_EXISTS = 0x00000001;
enum COPY_FILE_RESTARTABLE = 0x00000002;
enum COPY_FILE_OPEN_SOURCE_FOR_WRITE = 0x00000004;
enum COPY_FILE_ALLOW_DECRYPTED_DESTINATION = 0x00000008;
enum COPY_FILE_COPY_SYMLINK = 0x00000800;
enum COPY_FILE_NO_BUFFERING = 0x00001000;
enum COPY_FILE_REQUEST_SECURITY_PRIVILEGES = 0x00002000;
enum COPY_FILE_RESUME_FROM_PAUSE = 0x00004000;
enum COPY_FILE_NO_OFFLOAD = 0x00040000;
enum COPY_FILE_IGNORE_EDP_BLOCK = 0x00400000;
enum COPY_FILE_IGNORE_SOURCE_ENCRYPTION = 0x00800000;
enum COPY_FILE_DONT_REQUEST_DEST_WRITE_DAC = 0x02000000;
enum COPY_FILE_REQUEST_COMPRESSED_TRAFFIC = 0x10000000;
enum COPY_FILE_OPEN_AND_COPY_REPARSE_POINT = 0x00200000;
enum COPY_FILE_DIRECTORY = 0x00000080;
enum COPY_FILE_SKIP_ALTERNATE_STREAMS = 0x00008000;
enum COPY_FILE_DISABLE_PRE_ALLOCATION = 0x04000000;
enum COPY_FILE_ENABLE_LOW_FREE_SPACE_MODE = 0x08000000;
enum COPY_FILE_ENABLE_SPARSE_COPY = 0x20000000;
enum FAIL_FAST_GENERATE_EXCEPTION_ADDRESS = 0x00000001;
enum FAIL_FAST_NO_HARD_ERROR_DLG = 0x00000002;
enum SP_SERIALCOMM = 0x00000001;
enum PST_UNSPECIFIED = 0x00000000;
enum PST_RS232 = 0x00000001;
enum PST_PARALLELPORT = 0x00000002;
enum PST_RS422 = 0x00000003;
enum PST_RS423 = 0x00000004;
enum PST_RS449 = 0x00000005;
enum PST_MODEM = 0x00000006;
enum PST_FAX = 0x00000021;
enum PST_SCANNER = 0x00000022;
enum PST_NETWORK_BRIDGE = 0x00000100;
enum PST_LAT = 0x00000101;
enum PST_TCPIP_TELNET = 0x00000102;
enum PST_X25 = 0x00000103;
enum PCF_DTRDSR = 0x00000001;
enum PCF_RTSCTS = 0x00000002;
enum PCF_RLSD = 0x00000004;
enum PCF_PARITY_CHECK = 0x00000008;
enum PCF_XONXOFF = 0x00000010;
enum PCF_SETXCHAR = 0x00000020;
enum PCF_TOTALTIMEOUTS = 0x00000040;
enum PCF_INTTIMEOUTS = 0x00000080;
enum PCF_SPECIALCHARS = 0x00000100;
enum PCF_16BITMODE = 0x00000200;
enum SP_PARITY = 0x00000001;
enum SP_BAUD = 0x00000002;
enum SP_DATABITS = 0x00000004;
enum SP_STOPBITS = 0x00000008;
enum SP_HANDSHAKING = 0x00000010;
enum SP_PARITY_CHECK = 0x00000020;
enum SP_RLSD = 0x00000040;
enum BAUD_075 = 0x00000001;
enum BAUD_110 = 0x00000002;
enum BAUD_134_5 = 0x00000004;
enum BAUD_150 = 0x00000008;
enum BAUD_300 = 0x00000010;
enum BAUD_600 = 0x00000020;
enum BAUD_1200 = 0x00000040;
enum BAUD_1800 = 0x00000080;
enum BAUD_2400 = 0x00000100;
enum BAUD_4800 = 0x00000200;
enum BAUD_7200 = 0x00000400;
enum BAUD_9600 = 0x00000800;
enum BAUD_14400 = 0x00001000;
enum BAUD_19200 = 0x00002000;
enum BAUD_38400 = 0x00004000;
enum BAUD_56K = 0x00008000;
enum BAUD_128K = 0x00010000;
enum BAUD_115200 = 0x00020000;
enum BAUD_57600 = 0x00040000;
enum BAUD_USER = 0x10000000;
enum COMMPROP_INITIALIZED = 0xe73cf52e;
enum DTR_CONTROL_DISABLE = 0x00000000;
enum DTR_CONTROL_ENABLE = 0x00000001;
enum DTR_CONTROL_HANDSHAKE = 0x00000002;
enum RTS_CONTROL_DISABLE = 0x00000000;
enum RTS_CONTROL_ENABLE = 0x00000001;
enum RTS_CONTROL_HANDSHAKE = 0x00000002;
enum RTS_CONTROL_TOGGLE = 0x00000003;
enum GMEM_NOCOMPACT = 0x00000010;
enum GMEM_NODISCARD = 0x00000020;
enum GMEM_MODIFY = 0x00000080;
enum GMEM_DISCARDABLE = 0x00000100;
enum GMEM_NOT_BANKED = 0x00001000;
enum GMEM_SHARE = 0x00002000;
enum GMEM_DDESHARE = 0x00002000;
enum GMEM_NOTIFY = 0x00004000;
enum GMEM_LOWER = 0x00001000;
enum GMEM_VALID_FLAGS = 0x00007f72;
enum GMEM_INVALID_HANDLE = 0x00008000;
enum GMEM_DISCARDED = 0x00004000;
enum GMEM_LOCKCOUNT = 0x000000ff;
enum THREAD_PRIORITY_ERROR_RETURN = 0x7fffffff;
enum DRIVE_UNKNOWN = 0x00000000;
enum DRIVE_NO_ROOT_DIR = 0x00000001;
enum DRIVE_REMOVABLE = 0x00000002;
enum DRIVE_FIXED = 0x00000003;
enum DRIVE_REMOTE = 0x00000004;
enum DRIVE_CDROM = 0x00000005;
enum DRIVE_RAMDISK = 0x00000006;
enum IGNORE = 0x00000000;
enum CBR_110 = 0x0000006e;
enum CBR_300 = 0x0000012c;
enum CBR_600 = 0x00000258;
enum CBR_1200 = 0x000004b0;
enum CBR_2400 = 0x00000960;
enum CBR_4800 = 0x000012c0;
enum CBR_9600 = 0x00002580;
enum CBR_14400 = 0x00003840;
enum CBR_19200 = 0x00004b00;
enum CBR_38400 = 0x00009600;
enum CBR_56000 = 0x0000dac0;
enum CBR_57600 = 0x0000e100;
enum CBR_115200 = 0x0001c200;
enum CBR_128000 = 0x0001f400;
enum CBR_256000 = 0x0003e800;
enum CE_TXFULL = 0x00000100;
enum CE_PTO = 0x00000200;
enum CE_IOE = 0x00000400;
enum CE_DNS = 0x00000800;
enum CE_OOP = 0x00001000;
enum CE_MODE = 0x00008000;
enum IE_BADID = 0xffffffffffffffff;
enum IE_OPEN = 0xfffffffffffffffe;
enum IE_NOPEN = 0xfffffffffffffffd;
enum IE_MEMORY = 0xfffffffffffffffc;
enum IE_DEFAULT = 0xfffffffffffffffb;
enum IE_HARDWARE = 0xfffffffffffffff6;
enum IE_BYTESIZE = 0xfffffffffffffff5;
enum IE_BAUDRATE = 0xfffffffffffffff4;
enum RESETDEV = 0x00000007;
enum LPTx = 0x00000080;
enum S_QUEUEEMPTY = 0x00000000;
enum S_THRESHOLD = 0x00000001;
enum S_ALLTHRESHOLD = 0x00000002;
enum S_NORMAL = 0x00000000;
enum S_LEGATO = 0x00000001;
enum S_STACCATO = 0x00000002;
enum S_PERIOD512 = 0x00000000;
enum S_PERIOD1024 = 0x00000001;
enum S_PERIOD2048 = 0x00000002;
enum S_PERIODVOICE = 0x00000003;
enum S_WHITE512 = 0x00000004;
enum S_WHITE1024 = 0x00000005;
enum S_WHITE2048 = 0x00000006;
enum S_WHITEVOICE = 0x00000007;
enum S_SERDVNA = 0xffffffffffffffff;
enum S_SEROFM = 0xfffffffffffffffe;
enum S_SERMACT = 0xfffffffffffffffd;
enum S_SERQFUL = 0xfffffffffffffffc;
enum S_SERBDNT = 0xfffffffffffffffb;
enum S_SERDLN = 0xfffffffffffffffa;
enum S_SERDCC = 0xfffffffffffffff9;
enum S_SERDTP = 0xfffffffffffffff8;
enum S_SERDVL = 0xfffffffffffffff7;
enum S_SERDMD = 0xfffffffffffffff6;
enum S_SERDSH = 0xfffffffffffffff5;
enum S_SERDPT = 0xfffffffffffffff4;
enum S_SERDFQ = 0xfffffffffffffff3;
enum S_SERDDR = 0xfffffffffffffff2;
enum S_SERDSR = 0xfffffffffffffff1;
enum S_SERDST = 0xfffffffffffffff0;
enum FS_CASE_IS_PRESERVED = 0x00000002;
enum FS_CASE_SENSITIVE = 0x00000001;
enum FS_UNICODE_STORED_ON_DISK = 0x00000004;
enum FS_PERSISTENT_ACLS = 0x00000008;
enum FS_VOL_IS_COMPRESSED = 0x00008000;
enum FS_FILE_COMPRESSION = 0x00000010;
enum FS_FILE_ENCRYPTION = 0x00020000;
enum OFS_MAXPATHNAME = 0x00000080;
enum MAXINTATOM = 0x0000c000;
enum SCS_32BIT_BINARY = 0x00000000;
enum SCS_DOS_BINARY = 0x00000001;
enum SCS_WOW_BINARY = 0x00000002;
enum SCS_PIF_BINARY = 0x00000003;
enum SCS_POSIX_BINARY = 0x00000004;
enum SCS_OS216_BINARY = 0x00000005;
enum SCS_64BIT_BINARY = 0x00000006;
enum SCS_THIS_PLATFORM_BINARY = 0x00000006;
enum FIBER_FLAG_FLOAT_SWITCH = 0x00000001;
enum UMS_VERSION = 0x00000100;
enum FILE_SKIP_COMPLETION_PORT_ON_SUCCESS = 0x00000001;
enum FILE_SKIP_SET_EVENT_ON_HANDLE = 0x00000002;
enum CRITICAL_SECTION_NO_DEBUG_INFO = 0x01000000;
enum HINSTANCE_ERROR = 0x00000020;
enum FORMAT_MESSAGE_MAX_WIDTH_MASK = 0x000000ff;
enum FILE_ENCRYPTABLE = 0x00000000;
enum FILE_IS_ENCRYPTED = 0x00000001;
enum FILE_SYSTEM_ATTR = 0x00000002;
enum FILE_ROOT_DIR = 0x00000003;
enum FILE_SYSTEM_DIR = 0x00000004;
enum FILE_UNKNOWN = 0x00000005;
enum FILE_SYSTEM_NOT_SUPPORT = 0x00000006;
enum FILE_USER_DISALLOWED = 0x00000007;
enum FILE_READ_ONLY = 0x00000008;
enum FILE_DIR_DISALLOWED = 0x00000009;
enum EFS_USE_RECOVERY_KEYS = 0x00000001;
enum CREATE_FOR_IMPORT = 0x00000001;
enum CREATE_FOR_DIR = 0x00000002;
enum OVERWRITE_HIDDEN = 0x00000004;
enum EFSRPC_SECURE_ONLY = 0x00000008;
enum EFS_DROP_ALTERNATE_STREAMS = 0x00000010;
enum BACKUP_INVALID = 0x00000000;
enum BACKUP_GHOSTED_FILE_EXTENTS = 0x0000000b;
enum STREAM_NORMAL_ATTRIBUTE = 0x00000000;
enum STREAM_MODIFIED_WHEN_READ = 0x00000001;
enum STREAM_CONTAINS_SECURITY = 0x00000002;
enum STREAM_CONTAINS_PROPERTIES = 0x00000004;
enum STREAM_SPARSE_ATTRIBUTE = 0x00000008;
enum STREAM_CONTAINS_GHOSTED_FILE_EXTENTS = 0x00000010;
enum STARTF_HOLOGRAPHIC = 0x00040000;
enum SHUTDOWN_NORETRY = 0x00000001;
enum PROTECTION_LEVEL_SAME = 0xffffffff;
enum PROC_THREAD_ATTRIBUTE_NUMBER = 0x0000ffff;
enum PROC_THREAD_ATTRIBUTE_THREAD = 0x00010000;
enum PROC_THREAD_ATTRIBUTE_INPUT = 0x00020000;
enum PROC_THREAD_ATTRIBUTE_ADDITIVE = 0x00040000;
enum PROCESS_CREATION_MITIGATION_POLICY_DEP_ENABLE = 0x00000001;
enum PROCESS_CREATION_MITIGATION_POLICY_DEP_ATL_THUNK_ENABLE = 0x00000002;
enum PROCESS_CREATION_MITIGATION_POLICY_SEHOP_ENABLE = 0x00000004;
enum PROCESS_CREATION_CHILD_PROCESS_RESTRICTED = 0x00000001;
enum PROCESS_CREATION_CHILD_PROCESS_OVERRIDE = 0x00000002;
enum PROCESS_CREATION_CHILD_PROCESS_RESTRICTED_UNLESS_SECURE = 0x00000004;
enum PROCESS_CREATION_ALL_APPLICATION_PACKAGES_OPT_OUT = 0x00000001;
enum PROCESS_CREATION_DESKTOP_APP_BREAKAWAY_ENABLE_PROCESS_TREE = 0x00000001;
enum PROCESS_CREATION_DESKTOP_APP_BREAKAWAY_DISABLE_PROCESS_TREE = 0x00000002;
enum PROCESS_CREATION_DESKTOP_APP_BREAKAWAY_OVERRIDE = 0x00000004;
enum ATOM_FLAG_GLOBAL = 0x00000002;
enum GET_SYSTEM_WOW64_DIRECTORY_NAME_A_A = "GetSystemWow64DirectoryA";
enum GET_SYSTEM_WOW64_DIRECTORY_NAME_A_W = "GetSystemWow64DirectoryA";
enum GET_SYSTEM_WOW64_DIRECTORY_NAME_A_T = "GetSystemWow64DirectoryA";
enum GET_SYSTEM_WOW64_DIRECTORY_NAME_W_A = "GetSystemWow64DirectoryW";
enum GET_SYSTEM_WOW64_DIRECTORY_NAME_W_W = "GetSystemWow64DirectoryW";
enum GET_SYSTEM_WOW64_DIRECTORY_NAME_W_T = "GetSystemWow64DirectoryW";
enum GET_SYSTEM_WOW64_DIRECTORY_NAME_T_A = "GetSystemWow64DirectoryW";
enum GET_SYSTEM_WOW64_DIRECTORY_NAME_T_W = "GetSystemWow64DirectoryW";
enum GET_SYSTEM_WOW64_DIRECTORY_NAME_T_T = "GetSystemWow64DirectoryW";
enum BASE_SEARCH_PATH_ENABLE_SAFE_SEARCHMODE = 0x00000001;
enum BASE_SEARCH_PATH_DISABLE_SAFE_SEARCHMODE = 0x00010000;
enum BASE_SEARCH_PATH_PERMANENT = 0x00008000;
enum COPYFILE2_MESSAGE_COPY_OFFLOAD = 0x00000001;
enum COPYFILE2_IO_CYCLE_SIZE_MIN = 0x00001000;
enum COPYFILE2_IO_CYCLE_SIZE_MAX = 0x40000000;
enum COPYFILE2_IO_RATE_MIN = 0x00000200;
enum COPY_FILE2_V2_DONT_COPY_JUNCTIONS = 0x00000001;
enum COPY_FILE2_V2_VALID_FLAGS = 0x00000001;
enum EVENTLOG_FULL_INFO = 0x00000000;
enum OPERATION_API_VERSION = 0x00000001;
enum MAX_COMPUTERNAME_LENGTH = 0x0000000f;
enum LOGON32_PROVIDER_WINNT35 = 0x00000001;
enum LOGON32_PROVIDER_VIRTUAL = 0x00000004;
enum LOGON_ZERO_PASSWORD_BUFFER = 0x80000000;
enum HW_PROFILE_GUIDLEN = 0x00000027;
enum DOCKINFO_UNDOCKED = 0x00000001;
enum DOCKINFO_DOCKED = 0x00000002;
enum DOCKINFO_USER_SUPPLIED = 0x00000004;
enum TC_NORMAL = 0x00000000;
enum TC_HARDERR = 0x00000001;
enum TC_GP_TRAP = 0x00000002;
enum TC_SIGNAL = 0x00000003;
enum AC_LINE_OFFLINE = 0x00000000;
enum AC_LINE_ONLINE = 0x00000001;
enum AC_LINE_BACKUP_POWER = 0x00000002;
enum AC_LINE_UNKNOWN = 0x000000ff;
enum BATTERY_FLAG_HIGH = 0x00000001;
enum BATTERY_FLAG_LOW = 0x00000002;
enum BATTERY_FLAG_CRITICAL = 0x00000004;
enum BATTERY_FLAG_CHARGING = 0x00000008;
enum BATTERY_FLAG_NO_BATTERY = 0x00000080;
enum BATTERY_FLAG_UNKNOWN = 0x000000ff;
enum BATTERY_PERCENTAGE_UNKNOWN = 0x000000ff;
enum SYSTEM_STATUS_FLAG_POWER_SAVING_ON = 0x00000001;
enum BATTERY_LIFE_UNKNOWN = 0xffffffff;
enum ACTCTX_FLAG_PROCESSOR_ARCHITECTURE_VALID = 0x00000001;
enum ACTCTX_FLAG_LANGID_VALID = 0x00000002;
enum ACTCTX_FLAG_ASSEMBLY_DIRECTORY_VALID = 0x00000004;
enum ACTCTX_FLAG_RESOURCE_NAME_VALID = 0x00000008;
enum ACTCTX_FLAG_SET_PROCESS_DEFAULT = 0x00000010;
enum ACTCTX_FLAG_APPLICATION_NAME_VALID = 0x00000020;
enum ACTCTX_FLAG_SOURCE_IS_ASSEMBLYREF = 0x00000040;
enum ACTCTX_FLAG_HMODULE_VALID = 0x00000080;
enum DEACTIVATE_ACTCTX_FLAG_FORCE_EARLY_DEACTIVATION = 0x00000001;
enum FIND_ACTCTX_SECTION_KEY_RETURN_HACTCTX = 0x00000001;
enum FIND_ACTCTX_SECTION_KEY_RETURN_FLAGS = 0x00000002;
enum FIND_ACTCTX_SECTION_KEY_RETURN_ASSEMBLY_METADATA = 0x00000004;
enum ACTIVATION_CONTEXT_BASIC_INFORMATION_DEFINED = 0x00000001;
enum QUERY_ACTCTX_FLAG_USE_ACTIVE_ACTCTX = 0x00000004;
enum QUERY_ACTCTX_FLAG_ACTCTX_IS_HMODULE = 0x00000008;
enum QUERY_ACTCTX_FLAG_ACTCTX_IS_ADDRESS = 0x00000010;
enum QUERY_ACTCTX_FLAG_NO_ADDREF = 0x80000000;
enum RESTART_MAX_CMD_LINE = 0x00000400;
enum RECOVERY_DEFAULT_PING_INTERVAL = 0x00001388;
enum FILE_RENAME_FLAG_REPLACE_IF_EXISTS = 0x00000001;
enum FILE_RENAME_FLAG_POSIX_SEMANTICS = 0x00000002;
enum FILE_RENAME_FLAG_SUPPRESS_PIN_STATE_INHERITANCE = 0x00000004;
enum STORAGE_INFO_FLAGS_ALIGNED_DEVICE = 0x00000001;
enum STORAGE_INFO_FLAGS_PARTITION_ALIGNED_ON_DEVICE = 0x00000002;
enum STORAGE_INFO_OFFSET_UNKNOWN = 0xffffffff;
enum REMOTE_PROTOCOL_INFO_FLAG_LOOPBACK = 0x00000001;
enum REMOTE_PROTOCOL_INFO_FLAG_OFFLINE = 0x00000002;
enum REMOTE_PROTOCOL_INFO_FLAG_PERSISTENT_HANDLE = 0x00000004;
enum RPI_FLAG_SMB2_SHARECAP_TIMEWARP = 0x00000002;
enum RPI_FLAG_SMB2_SHARECAP_DFS = 0x00000008;
enum RPI_FLAG_SMB2_SHARECAP_CONTINUOUS_AVAILABILITY = 0x00000010;
enum RPI_FLAG_SMB2_SHARECAP_SCALEOUT = 0x00000020;
enum RPI_FLAG_SMB2_SHARECAP_CLUSTER = 0x00000040;
enum RPI_SMB2_SHAREFLAG_ENCRYPT_DATA = 0x00000001;
enum RPI_SMB2_SHAREFLAG_COMPRESS_DATA = 0x00000002;
enum RPI_SMB2_FLAG_SERVERCAP_DFS = 0x00000001;
enum RPI_SMB2_FLAG_SERVERCAP_LEASING = 0x00000002;
enum RPI_SMB2_FLAG_SERVERCAP_LARGEMTU = 0x00000004;
enum RPI_SMB2_FLAG_SERVERCAP_MULTICHANNEL = 0x00000008;
enum RPI_SMB2_FLAG_SERVERCAP_PERSISTENT_HANDLES = 0x00000010;
enum RPI_SMB2_FLAG_SERVERCAP_DIRECTORY_LEASING = 0x00000020;
enum MICROSOFT_WINDOWS_WINBASE_H_DEFINE_INTERLOCKED_CPLUSPLUS_OVERLOADS = 0x00000000;
enum MICROSOFT_WINBASE_H_DEFINE_INTERLOCKED_CPLUSPLUS_OVERLOADS = 0x00000000;
enum CODEINTEGRITY_OPTION_ENABLED = 0x00000001;
enum CODEINTEGRITY_OPTION_TESTSIGN = 0x00000002;
enum CODEINTEGRITY_OPTION_UMCI_ENABLED = 0x00000004;
enum CODEINTEGRITY_OPTION_UMCI_AUDITMODE_ENABLED = 0x00000008;
enum CODEINTEGRITY_OPTION_UMCI_EXCLUSIONPATHS_ENABLED = 0x00000010;
enum CODEINTEGRITY_OPTION_TEST_BUILD = 0x00000020;
enum CODEINTEGRITY_OPTION_PREPRODUCTION_BUILD = 0x00000040;
enum CODEINTEGRITY_OPTION_DEBUGMODE_ENABLED = 0x00000080;
enum CODEINTEGRITY_OPTION_FLIGHT_BUILD = 0x00000100;
enum CODEINTEGRITY_OPTION_FLIGHTING_ENABLED = 0x00000200;
enum CODEINTEGRITY_OPTION_HVCI_KMCI_ENABLED = 0x00000400;
enum CODEINTEGRITY_OPTION_HVCI_KMCI_AUDITMODE_ENABLED = 0x00000800;
enum CODEINTEGRITY_OPTION_HVCI_KMCI_STRICTMODE_ENABLED = 0x00001000;
enum CODEINTEGRITY_OPTION_HVCI_IUM_ENABLED = 0x00002000;
enum FILE_MAXIMUM_DISPOSITION = 0x00000005;
enum FILE_OPEN_REMOTE_INSTANCE = 0x00000400;
enum FILE_NO_COMPRESSION = 0x00008000;
enum FILE_OPEN_NO_RECALL = 0x00400000;
enum FILE_VALID_OPTION_FLAGS = 0x00ffffff;
enum FILE_VALID_PIPE_OPTION_FLAGS = 0x00000032;
enum FILE_VALID_MAILSLOT_OPTION_FLAGS = 0x00000032;
enum FILE_VALID_SET_FLAGS = 0x00000036;
enum FILE_SUPERSEDED = 0x00000000;
enum FILE_OPENED = 0x00000001;
enum FILE_CREATED = 0x00000002;
enum FILE_OVERWRITTEN = 0x00000003;
enum FILE_EXISTS = 0x00000004;
enum FILE_DOES_NOT_EXIST = 0x00000005;
enum WINWATCHNOTIFY_START = 0x00000000;
enum WINWATCHNOTIFY_STOP = 0x00000001;
enum WINWATCHNOTIFY_DESTROY = 0x00000002;
enum WINWATCHNOTIFY_CHANGING = 0x00000003;
enum WINWATCHNOTIFY_CHANGED = 0x00000004;
enum RSC_FLAG_INF = 0x00000001;
enum RSC_FLAG_SKIPDISKSPACECHECK = 0x00000002;
enum RSC_FLAG_QUIET = 0x00000004;
enum RSC_FLAG_NGCONV = 0x00000008;
enum RSC_FLAG_UPDHLPDLLS = 0x00000010;
enum RSC_FLAG_DELAYREGISTEROCX = 0x00000200;
enum RSC_FLAG_SETUPAPI = 0x00000400;
enum ALINF_QUIET = 0x00000004;
enum ALINF_NGCONV = 0x00000008;
enum ALINF_UPDHLPDLLS = 0x00000010;
enum ALINF_BKINSTALL = 0x00000020;
enum ALINF_ROLLBACK = 0x00000040;
enum ALINF_CHECKBKDATA = 0x00000080;
enum ALINF_ROLLBKDOALL = 0x00000100;
enum ALINF_DELAYREGISTEROCX = 0x00000200;
enum AIF_WARNIFSKIP = 0x00000001;
enum AIF_NOSKIP = 0x00000002;
enum AIF_NOVERSIONCHECK = 0x00000004;
enum AIF_FORCE_FILE_IN_USE = 0x00000008;
enum AIF_NOOVERWRITE = 0x00000010;
enum AIF_NO_VERSION_DIALOG = 0x00000020;
enum AIF_REPLACEONLY = 0x00000400;
enum AIF_NOLANGUAGECHECK = 0x10000000;
enum AIF_QUIET = 0x20000000;
enum IE4_RESTORE = 0x00000001;
enum IE4_BACKNEW = 0x00000002;
enum IE4_NODELETENEW = 0x00000004;
enum IE4_NOMESSAGES = 0x00000008;
enum IE4_NOPROGRESS = 0x00000010;
enum IE4_NOENUMKEY = 0x00000020;
enum IE4_NO_CRC_MAPPING = 0x00000040;
enum IE4_REGSECTION = 0x00000080;
enum IE4_FRDOALL = 0x00000100;
enum IE4_UPDREFCNT = 0x00000200;
enum IE4_USEREFCNT = 0x00000400;
enum IE4_EXTRAINCREFCNT = 0x00000800;
enum IE4_REMOVREGBKDATA = 0x00001000;
enum ARSR_RESTORE = 0x00000001;
enum ARSR_NOMESSAGES = 0x00000008;
enum ARSR_REGSECTION = 0x00000080;
enum ARSR_REMOVREGBKDATA = 0x00001000;
enum REG_SAVE_LOG_KEY = "RegSaveLogFile";
enum REG_RESTORE_LOG_KEY = "RegRestoreLogFile";
enum AFSR_RESTORE = 0x00000001;
enum AFSR_BACKNEW = 0x00000002;
enum AFSR_NODELETENEW = 0x00000004;
enum AFSR_NOMESSAGES = 0x00000008;
enum AFSR_NOPROGRESS = 0x00000010;
enum AFSR_UPDREFCNT = 0x00000200;
enum AFSR_USEREFCNT = 0x00000400;
enum AFSR_EXTRAINCREFCNT = 0x00000800;
enum AADBE_ADD_ENTRY = 0x00000001;
enum AADBE_DEL_ENTRY = 0x00000002;
enum ADN_DEL_IF_EMPTY = 0x00000001;
enum ADN_DONT_DEL_SUBDIRS = 0x00000002;
enum ADN_DONT_DEL_DIR = 0x00000004;
enum ADN_DEL_UNC_PATHS = 0x00000008;
enum LIS_QUIET = 0x00000001;
enum LIS_NOGRPCONV = 0x00000002;
enum RUNCMDS_QUIET = 0x00000001;
enum RUNCMDS_NOWAIT = 0x00000002;
enum RUNCMDS_DELAYPOSTCMD = 0x00000004;
enum IME_MAXPROCESS = 0x00000020;
enum CP_HWND = 0x00000000;
enum CP_OPEN = 0x00000001;
enum CP_DIRECT = 0x00000002;
enum CP_LEVEL = 0x00000003;
enum MCW_DEFAULT = 0x00000000;
enum MCW_RECT = 0x00000001;
enum MCW_WINDOW = 0x00000002;
enum MCW_SCREEN = 0x00000004;
enum MCW_VERTICAL = 0x00000008;
enum MCW_HIDDEN = 0x00000010;
enum IME_MODE_ALPHANUMERIC = 0x00000001;
enum IME_MODE_SBCSCHAR = 0x00000002;
enum IME_MODE_KATAKANA = 0x00000002;
enum IME_MODE_HIRAGANA = 0x00000004;
enum IME_MODE_HANJACONVERT = 0x00000004;
enum IME_MODE_DBCSCHAR = 0x00000010;
enum IME_MODE_ROMAN = 0x00000020;
enum IME_MODE_NOROMAN = 0x00000040;
enum IME_MODE_CODEINPUT = 0x00000080;
enum IME_MODE_NOCODEINPUT = 0x00000100;
enum IME_GETIMECAPS = 0x00000003;
enum IME_SETOPEN = 0x00000004;
enum IME_GETOPEN = 0x00000005;
enum IME_GETVERSION = 0x00000007;
enum IME_SETCONVERSIONWINDOW = 0x00000008;
enum IME_MOVEIMEWINDOW = 0x00000008;
enum IME_SETCONVERSIONMODE = 0x00000010;
enum IME_GETCONVERSIONMODE = 0x00000011;
enum IME_SET_MODE = 0x00000012;
enum IME_SENDVKEY = 0x00000013;
enum IME_ENTERWORDREGISTERMODE = 0x00000018;
enum IME_SETCONVERSIONFONTEX = 0x00000019;
enum IME_BANJAtoJUNJA = 0x00000013;
enum IME_JUNJAtoBANJA = 0x00000014;
enum IME_JOHABtoKS = 0x00000015;
enum IME_KStoJOHAB = 0x00000016;
enum IMEA_INIT = 0x00000001;
enum IMEA_NEXT = 0x00000002;
enum IMEA_PREV = 0x00000003;
enum IME_REQUEST_CONVERT = 0x00000001;
enum IME_ENABLE_CONVERT = 0x00000002;
enum INTERIM_WINDOW = 0x00000000;
enum MODE_WINDOW = 0x00000001;
enum HANJA_WINDOW = 0x00000002;
enum IME_RS_ERROR = 0x00000001;
enum IME_RS_NOIME = 0x00000002;
enum IME_RS_TOOLONG = 0x00000005;
enum IME_RS_ILLEGAL = 0x00000006;
enum IME_RS_NOTFOUND = 0x00000007;
enum IME_RS_NOROOM = 0x0000000a;
enum IME_RS_DISKERROR = 0x0000000e;
enum IME_RS_INVALID = 0x00000011;
enum IME_RS_NEST = 0x00000012;
enum IME_RS_SYSTEMMODAL = 0x00000013;
enum WM_IME_REPORT = 0x00000280;
enum IR_STRINGSTART = 0x00000100;
enum IR_STRINGEND = 0x00000101;
enum IR_OPENCONVERT = 0x00000120;
enum IR_CHANGECONVERT = 0x00000121;
enum IR_CLOSECONVERT = 0x00000122;
enum IR_FULLCONVERT = 0x00000123;
enum IR_IMESELECT = 0x00000130;
enum IR_STRING = 0x00000140;
enum IR_DBCSCHAR = 0x00000160;
enum IR_UNDETERMINE = 0x00000170;
enum IR_STRINGEX = 0x00000180;
enum IR_MODEINFO = 0x00000190;
enum WM_WNT_CONVERTREQUESTEX = 0x00000109;
enum WM_CONVERTREQUEST = 0x0000010a;
enum WM_CONVERTRESULT = 0x0000010b;
enum WM_INTERIM = 0x0000010c;
enum WM_IMEKEYDOWN = 0x00000290;
enum WM_IMEKEYUP = 0x00000291;
enum DELAYLOAD_GPA_FAILURE = 0x00000004;
enum CATID_DeleteBrowsingHistory = GUID(0x31caf6e4, 0xd6aa, 0x4090, [0xa0, 0x50, 0xa5, 0xac, 0x89, 0x72, 0xe9, 0xef]);
enum DELETE_BROWSING_HISTORY_HISTORY = 0x00000001;
enum DELETE_BROWSING_HISTORY_COOKIES = 0x00000002;
enum DELETE_BROWSING_HISTORY_TIF = 0x00000004;
enum DELETE_BROWSING_HISTORY_FORMDATA = 0x00000008;
enum DELETE_BROWSING_HISTORY_PASSWORDS = 0x00000010;
enum DELETE_BROWSING_HISTORY_PRESERVEFAVORITES = 0x00000020;
enum DELETE_BROWSING_HISTORY_DOWNLOADHISTORY = 0x00000040;
enum WLDP_HOST_CMD = GUID(0x5baea1d6, 0x6f1c, 0x488e, [0x84, 0x90, 0x34, 0x7f, 0xa5, 0xc5, 0x6, 0x7f]);
enum WLDP_HOST_POWERSHELL = GUID(0x8e9aaa7c, 0x198b, 0x4879, [0xae, 0x41, 0xa5, 0xd, 0x47, 0xad, 0x64, 0x58]);
enum WLDP_HOST_PYTHON = GUID(0xbfd557ef, 0x2448, 0x42ec, [0x81, 0xb, 0xd, 0x9f, 0x9, 0x35, 0x2d, 0x4a]);
enum WLDP_HOST_WINDOWS_SCRIPT_HOST = GUID(0xd30b84c5, 0x29ce, 0x4ff3, [0x86, 0xec, 0xa3, 0x0, 0x7, 0xa8, 0x2e, 0x49]);
enum WLDP_HOST_JAVASCRIPT = GUID(0x5629f0d5, 0x1cca, 0x4fed, [0xa1, 0xa3, 0x36, 0xa8, 0xc1, 0x8d, 0x74, 0xc0]);
enum WLDP_HOST_HTML = GUID(0xb35a71b6, 0xfe56, 0x48d6, [0x95, 0x43, 0x2d, 0xff, 0xe, 0xcd, 0xed, 0x66]);
enum WLDP_HOST_XML = GUID(0x5594be58, 0xc6bf, 0x4295, [0x82, 0xf4, 0xd4, 0x94, 0xd2, 0xe, 0x3a, 0x36]);
enum WLDP_HOST_MSI = GUID(0x624eb611, 0x6e7e, 0x4eec, [0x9b, 0xfe, 0xf0, 0xec, 0xdb, 0xfc, 0xf3, 0x90]);
enum WLDP_HOST_OTHER = GUID(0x626cbec3, 0xe1fa, 0x4227, [0x98, 0x0, 0xed, 0x21, 0x2, 0x74, 0xcf, 0x7c]);
alias HWINWATCH = void*;
alias FEATURE_STATE_CHANGE_SUBSCRIPTION = long;
alias FH_SERVICE_PIPE_HANDLE = long;
struct TCP_REQUEST_QUERY_INFORMATION_EX32_XP
{
    TDIObjectID ID;
    uint[4] Context;
}
struct DELAYLOAD_INFO
{
    uint Size;
    IMAGE_DELAYLOAD_DESCRIPTOR* DelayloadDescriptor;
    IMAGE_THUNK_DATA64* ThunkAddress;
    const(char)* TargetDllName;
    DELAYLOAD_PROC_DESCRIPTOR TargetApiDescriptor;
    void* TargetModuleBase;
    void* Unused;
    uint LastError;
}
struct IMAGE_THUNK_DATA64
{
    union _u1_e__Union
    {
        ulong ForwarderString;
        ulong Function;
        ulong Ordinal;
        ulong AddressOfData;
    }
}
struct IMAGE_THUNK_DATA32
{
    union _u1_e__Union
    {
        uint ForwarderString;
        uint Function;
        uint Ordinal;
        uint AddressOfData;
    }
}
struct IMAGE_DELAYLOAD_DESCRIPTOR
{
    union _Attributes_e__Union
    {
        uint AllAttributes;
        struct
        {
            uint _bitfield0;
        }
    }
    uint DllNameRVA;
    uint ModuleHandleRVA;
    uint ImportAddressTableRVA;
    uint ImportNameTableRVA;
    uint BoundImportAddressTableRVA;
    uint UnloadInformationTableRVA;
    uint TimeDateStamp;
}
struct CUSTOM_SYSTEM_EVENT_TRIGGER_CONFIG
{
    uint Size;
    const(wchar)* TriggerId;
}
alias PFIBER_CALLOUT_ROUTINE = void* function(void*);
struct JIT_DEBUG_INFO
{
    uint dwSize;
    uint dwProcessorArchitecture;
    uint dwThreadID;
    uint dwReserved0;
    ulong lpExceptionAddress;
    ulong lpExceptionRecord;
    ulong lpContextRecord;
}
struct HW_PROFILE_INFOA
{
    uint dwDockInfo;
    CHAR[39] szHwProfileGuid;
    CHAR[80] szHwProfileName;
}
struct HW_PROFILE_INFOW
{
    uint dwDockInfo;
    wchar[39] szHwProfileGuid;
    wchar[80] szHwProfileName;
}
struct ACTCTX_SECTION_KEYED_DATA_2600
{
    uint cbSize;
    uint ulDataFormatVersion;
    void* lpData;
    uint ulLength;
    void* lpSectionGlobalData;
    uint ulSectionGlobalDataLength;
    void* lpSectionBase;
    uint ulSectionTotalLength;
    HANDLE hActCtx;
    uint ulAssemblyRosterIndex;
}
struct ACTCTX_SECTION_KEYED_DATA_ASSEMBLY_METADATA
{
    void* lpInformation;
    void* lpSectionBase;
    uint ulSectionLength;
    void* lpSectionGlobalDataBase;
    uint ulSectionGlobalDataLength;
}
struct ACTIVATION_CONTEXT_BASIC_INFORMATION
{
    HANDLE hActCtx;
    uint dwFlags;
}
alias PQUERYACTCTXW_FUNC = BOOL function(uint, HANDLE, void*, uint, void*, ulong, ulong*);
alias APPLICATION_RECOVERY_CALLBACK = uint function(void*);
struct FILE_CASE_SENSITIVE_INFO
{
    uint Flags;
}
struct CLIENT_ID
{
    HANDLE UniqueProcess;
    HANDLE UniqueThread;
}
struct LDR_DATA_TABLE_ENTRY
{
    void*[2] Reserved1;
    LIST_ENTRY InMemoryOrderLinks;
    void*[2] Reserved2;
    void* DllBase;
    void*[2] Reserved3;
    UNICODE_STRING FullDllName;
    ubyte[8] Reserved4;
    void*[3] Reserved5;
    union
    {
        uint CheckSum;
        void* Reserved6;
    }
    uint TimeDateStamp;
}
struct SYSTEM_PROCESSOR_PERFORMANCE_INFORMATION
{
    long IdleTime;
    long KernelTime;
    long UserTime;
    long[2] Reserved1;
    uint Reserved2;
}
struct SYSTEM_PROCESS_INFORMATION
{
    uint NextEntryOffset;
    uint NumberOfThreads;
    ubyte[48] Reserved1;
    UNICODE_STRING ImageName;
    int BasePriority;
    HANDLE UniqueProcessId;
    void* Reserved2;
    uint HandleCount;
    uint SessionId;
    void* Reserved3;
    ulong PeakVirtualSize;
    ulong VirtualSize;
    uint Reserved4;
    ulong PeakWorkingSetSize;
    ulong WorkingSetSize;
    void* Reserved5;
    ulong QuotaPagedPoolUsage;
    void* Reserved6;
    ulong QuotaNonPagedPoolUsage;
    ulong PagefileUsage;
    ulong PeakPagefileUsage;
    ulong PrivatePageCount;
    long[6] Reserved7;
}
struct SYSTEM_THREAD_INFORMATION
{
    long[3] Reserved1;
    uint Reserved2;
    void* StartAddress;
    CLIENT_ID ClientId;
    int Priority;
    int BasePriority;
    uint Reserved3;
    uint ThreadState;
    uint WaitReason;
}
struct SYSTEM_REGISTRY_QUOTA_INFORMATION
{
    uint RegistryQuotaAllowed;
    uint RegistryQuotaUsed;
    void* Reserved1;
}
struct SYSTEM_BASIC_INFORMATION
{
    ubyte[24] Reserved1;
    void*[4] Reserved2;
    byte NumberOfProcessors;
}
struct SYSTEM_TIMEOFDAY_INFORMATION
{
    ubyte[48] Reserved1;
}
struct SYSTEM_PERFORMANCE_INFORMATION
{
    ubyte[312] Reserved1;
}
struct SYSTEM_EXCEPTION_INFORMATION
{
    ubyte[16] Reserved1;
}
struct SYSTEM_LOOKASIDE_INFORMATION
{
    ubyte[32] Reserved1;
}
struct SYSTEM_INTERRUPT_INFORMATION
{
    ubyte[24] Reserved1;
}
struct SYSTEM_POLICY_INFORMATION
{
    void*[2] Reserved1;
    uint[3] Reserved2;
}
alias FILE_INFORMATION_CLASS = int;
enum : int
{
    FileDirectoryInformation = 0x00000001,
}

struct THREAD_NAME_INFORMATION
{
    UNICODE_STRING ThreadName;
}
struct SYSTEM_CODEINTEGRITY_INFORMATION
{
    uint Length;
    uint CodeIntegrityOptions;
}
struct PUBLIC_OBJECT_BASIC_INFORMATION
{
    uint Attributes;
    uint GrantedAccess;
    uint HandleCount;
    uint PointerCount;
    uint[10] Reserved;
}
struct PUBLIC_OBJECT_TYPE_INFORMATION
{
    UNICODE_STRING TypeName;
    uint[22] Reserved;
}
alias WINSTATIONINFOCLASS = int;
enum : int
{
    WinStationInformation = 0x00000008,
}

struct WINSTATIONINFORMATIONW
{
    ubyte[70] Reserved2;
    uint LogonId;
    ubyte[1140] Reserved3;
}
alias PWINSTATIONQUERYINFORMATIONW = BOOLEAN function(HANDLE, uint, WINSTATIONINFOCLASS, void*, uint, uint*);
alias CameraUIControlMode = int;
enum : int
{
    Browse  = 0x00000000,
    Linear  = 0x00000001,
}

alias CameraUIControlLinearSelectionMode = int;
enum : int
{
    Single   = 0x00000000,
    Multiple = 0x00000001,
}

alias CameraUIControlCaptureMode = int;
enum : int
{
    PhotoOrVideo = 0x00000000,
    Photo        = 0x00000001,
    Video        = 0x00000002,
}

alias CameraUIControlPhotoFormat = int;
enum : int
{
    Jpeg    = 0x00000000,
    Png     = 0x00000001,
    JpegXR  = 0x00000002,
}

alias CameraUIControlVideoFormat = int;
enum : int
{
    Mp4     = 0x00000000,
    Wmv     = 0x00000001,
}

alias CameraUIControlViewType = int;
enum : int
{
    SingleItem = 0x00000000,
    ItemList   = 0x00000001,
}

enum IID_ICameraUIControlEventCallback = GUID(0x1bfa0c2c, 0xfbcd, 0x4776, [0xbd, 0xa4, 0x88, 0xbf, 0x97, 0x4e, 0x74, 0xf4]);
interface ICameraUIControlEventCallback : IUnknown
{
    void OnStartupComplete();
    void OnSuspendComplete();
    void OnItemCaptured(const(wchar)*);
    void OnItemDeleted(const(wchar)*);
    void OnClosed();
}
enum IID_ICameraUIControl = GUID(0xb8733adf, 0x3d68, 0x4b8f, [0xbb, 0x8, 0xe2, 0x8a, 0xb, 0xed, 0x3, 0x76]);
interface ICameraUIControl : IUnknown
{
    HRESULT Show(IUnknown, CameraUIControlMode, CameraUIControlLinearSelectionMode, CameraUIControlCaptureMode, CameraUIControlPhotoFormat, CameraUIControlVideoFormat, BOOL, ICameraUIControlEventCallback);
    HRESULT Close();
    HRESULT Suspend(BOOL*);
    HRESULT Resume();
    HRESULT GetCurrentViewType(CameraUIControlViewType*);
    HRESULT GetActiveItem(BSTR*);
    HRESULT GetSelectedItems(SAFEARRAY**);
    HRESULT RemoveCapturedItem(const(wchar)*);
}
enum CLSID_CameraUIControl = GUID(0x16d5a2be, 0xb1c5, 0x47b3, [0x8e, 0xae, 0xcc, 0xbc, 0xf4, 0x52, 0xc7, 0xe8]);
struct CameraUIControl
{
}
enum IID_IEditionUpgradeHelper = GUID(0xd3e9e342, 0x5deb, 0x43b6, [0x84, 0x9e, 0x69, 0x13, 0xb8, 0x5d, 0x50, 0x3a]);
interface IEditionUpgradeHelper : IUnknown
{
    HRESULT CanUpgrade(BOOL*);
    HRESULT UpdateOperatingSystem(const(wchar)*);
    HRESULT ShowProductKeyUI();
    HRESULT GetOsProductContentId(PWSTR*);
    HRESULT GetGenuineLocalStatus(BOOL*);
}
enum IID_IWindowsLockModeHelper = GUID(0xf342d19e, 0xcc22, 0x4648, [0xbb, 0x5d, 0x3, 0xcc, 0xf7, 0x5b, 0x47, 0xc5]);
interface IWindowsLockModeHelper : IUnknown
{
    HRESULT GetSMode(BOOL*);
}
enum IID_IEditionUpgradeBroker = GUID(0xff19cbcf, 0x9455, 0x4937, [0xb8, 0x72, 0x6b, 0x79, 0x29, 0xa4, 0x60, 0xaf]);
interface IEditionUpgradeBroker : IUnknown
{
    HRESULT InitializeParentWindow(OLE_HANDLE);
    HRESULT UpdateOperatingSystem(BSTR);
    HRESULT ShowProductKeyUI();
    HRESULT CanUpgrade();
}
enum IID_IContainerActivationHelper = GUID(0xb524f93f, 0x80d5, 0x4ec7, [0xae, 0x9e, 0xd6, 0x6e, 0x93, 0xad, 0xe1, 0xfa]);
interface IContainerActivationHelper : IUnknown
{
    HRESULT CanActivateClientVM(VARIANT_BOOL*);
}
enum IID_IClipServiceNotificationHelper = GUID(0xc39948f0, 0x6142, 0x44fd, [0x98, 0xca, 0xe1, 0x68, 0x1a, 0x8d, 0x68, 0xb5]);
interface IClipServiceNotificationHelper : IUnknown
{
    HRESULT ShowToast(BSTR, BSTR, BSTR, BSTR, BSTR);
}
enum IID_IFClipNotificationHelper = GUID(0x3d5e3d21, 0xbd41, 0x4c2a, [0xa6, 0x69, 0xb1, 0x7c, 0xe8, 0x7f, 0xb5, 0xb]);
interface IFClipNotificationHelper : IUnknown
{
    HRESULT ShowSystemDialog(BSTR, BSTR);
}
enum CLSID_EditionUpgradeHelper = GUID(0x1776df3, 0xb9af, 0x4e50, [0x9b, 0x1c, 0x56, 0xe9, 0x31, 0x16, 0xd7, 0x4]);
struct EditionUpgradeHelper
{
}
enum CLSID_EditionUpgradeBroker = GUID(0xc4270827, 0x4f39, 0x45df, [0x92, 0x88, 0x12, 0xff, 0x6b, 0x85, 0xa9, 0x21]);
struct EditionUpgradeBroker
{
}
alias FEATURE_CHANGE_TIME = int;
enum : int
{
    FEATURE_CHANGE_TIME_READ          = 0x00000000,
    FEATURE_CHANGE_TIME_MODULE_RELOAD = 0x00000001,
    FEATURE_CHANGE_TIME_SESSION       = 0x00000002,
    FEATURE_CHANGE_TIME_REBOOT        = 0x00000003,
}

alias FEATURE_ENABLED_STATE = int;
enum : int
{
    FEATURE_ENABLED_STATE_DEFAULT  = 0x00000000,
    FEATURE_ENABLED_STATE_DISABLED = 0x00000001,
    FEATURE_ENABLED_STATE_ENABLED  = 0x00000002,
}

struct FEATURE_ERROR
{
    HRESULT hr;
    ushort lineNumber;
    const(char)* file;
    const(char)* process;
    const(char)* module_;
    uint callerReturnAddressOffset;
    const(char)* callerModule;
    const(char)* message;
    ushort originLineNumber;
    const(char)* originFile;
    const(char)* originModule;
    uint originCallerReturnAddressOffset;
    const(char)* originCallerModule;
    const(char)* originName;
}
alias PFEATURE_STATE_CHANGE_CALLBACK = void function(void*);
struct DCICMD
{
    uint dwCommand;
    uint dwParam1;
    uint dwParam2;
    uint dwVersion;
    uint dwReserved;
}
struct DCICREATEINPUT
{
    DCICMD cmd;
    uint dwCompression;
    uint[3] dwMask;
    uint dwWidth;
    uint dwHeight;
    uint dwDCICaps;
    uint dwBitCount;
    void* lpSurface;
}
struct DCISURFACEINFO
{
    uint dwSize;
    uint dwDCICaps;
    uint dwCompression;
    uint[3] dwMask;
    uint dwWidth;
    uint dwHeight;
    int lStride;
    uint dwBitCount;
    ulong dwOffSurface;
    ushort wSelSurface;
    ushort wReserved;
    uint dwReserved1;
    uint dwReserved2;
    uint dwReserved3;
    long BeginAccess;
    long EndAccess;
    long DestroySurface;
}
alias ENUM_CALLBACK = void function(DCISURFACEINFO*, void*);
struct DCIENUMINPUT
{
    DCICMD cmd;
    RECT rSrc;
    RECT rDst;
    long EnumCallback;
    void* lpContext;
}
struct DCIOFFSCREEN
{
    DCISURFACEINFO dciInfo;
    long Draw;
    long SetClipList;
    long SetDestination;
}
struct DCIOVERLAY
{
    DCISURFACEINFO dciInfo;
    uint dwChromakeyValue;
    uint dwChromakeyMask;
}
alias WINWATCHNOTIFYPROC = void function(HWINWATCH, HWND, uint, LPARAM);
struct STRENTRYA
{
    PSTR pszName;
    PSTR pszValue;
}
struct STRENTRYW
{
    PWSTR pszName;
    PWSTR pszValue;
}
struct STRTABLEA
{
    uint cEntries;
    STRENTRYA* pse;
}
struct STRTABLEW
{
    uint cEntries;
    STRENTRYW* pse;
}
alias REGINSTALLA = HRESULT function(HMODULE, const(char)*, const(STRTABLEA)*);
struct CABINFOA
{
    PSTR pszCab;
    PSTR pszInf;
    PSTR pszSection;
    CHAR[260] szSrcPath;
    uint dwFlags;
}
struct CABINFOW
{
    PWSTR pszCab;
    PWSTR pszInf;
    PWSTR pszSection;
    wchar[260] szSrcPath;
    uint dwFlags;
}
struct PERUSERSECTIONA
{
    CHAR[59] szGUID;
    CHAR[128] szDispName;
    CHAR[10] szLocale;
    CHAR[1040] szStub;
    CHAR[32] szVersion;
    CHAR[128] szCompID;
    uint dwIsInstalled;
    BOOL bRollback;
}
struct PERUSERSECTIONW
{
    wchar[59] szGUID;
    wchar[128] szDispName;
    wchar[10] szLocale;
    wchar[1040] szStub;
    wchar[32] szVersion;
    wchar[128] szCompID;
    uint dwIsInstalled;
    BOOL bRollback;
}
struct IMESTRUCT
{
    uint fnc;
    WPARAM wParam;
    uint wCount;
    uint dchSource;
    uint dchDest;
    LPARAM lParam1;
    LPARAM lParam2;
    LPARAM lParam3;
}
struct UNDETERMINESTRUCT
{
    uint dwSize;
    uint uDefIMESize;
    uint uDefIMEPos;
    uint uUndetTextLen;
    uint uUndetTextPos;
    uint uUndetAttrPos;
    uint uCursorPos;
    uint uDeltaStart;
    uint uDetermineTextLen;
    uint uDetermineTextPos;
    uint uDetermineDelimPos;
    uint uYomiTextLen;
    uint uYomiTextPos;
    uint uYomiDelimPos;
}
struct STRINGEXSTRUCT
{
    uint dwSize;
    uint uDeterminePos;
    uint uDetermineDelimPos;
    uint uYomiPos;
    uint uYomiDelimPos;
}
struct DATETIME
{
    ushort year;
    ushort month;
    ushort day;
    ushort hour;
    ushort min;
    ushort sec;
}
struct IMEPROA
{
    HWND hWnd;
    DATETIME InstDate;
    uint wVersion;
    ubyte[50] szDescription;
    ubyte[80] szName;
    ubyte[30] szOptions;
}
struct IMEPROW
{
    HWND hWnd;
    DATETIME InstDate;
    uint wVersion;
    wchar[50] szDescription;
    wchar[80] szName;
    wchar[30] szOptions;
}
struct JAVA_TRUST
{
    uint cbSize;
    uint flag;
    BOOL fAllActiveXPermissions;
    BOOL fAllPermissions;
    uint dwEncodingType;
    ubyte* pbJavaPermissions;
    uint cbJavaPermissions;
    ubyte* pbSigner;
    uint cbSigner;
    const(wchar)* pwszZone;
    GUID guidZone;
    HRESULT hVerify;
}
struct TDIEntityID
{
    TDIENTITY_ENTITY_TYPE tei_entity;
    uint tei_instance;
}
struct TDIObjectID
{
    TDIEntityID toi_entity;
    uint toi_class;
    uint toi_type;
    uint toi_id;
}
struct TCP_REQUEST_QUERY_INFORMATION_EX_XP
{
    TDIObjectID ID;
    ulong[4] Context;
}
struct TCP_REQUEST_QUERY_INFORMATION_EX_W2K
{
    TDIObjectID ID;
    ubyte[16] Context;
}
struct TCP_REQUEST_SET_INFORMATION_EX
{
    TDIObjectID ID;
    uint BufferSize;
    ubyte[1] Buffer;
}
alias TDI_TL_IO_CONTROL_TYPE = int;
enum : int
{
    EndpointIoControlType   = 0x00000000,
    SetSockOptIoControlType = 0x00000001,
    GetSockOptIoControlType = 0x00000002,
    SocketIoControlType     = 0x00000003,
}

struct TDI_TL_IO_CONTROL_ENDPOINT
{
    TDI_TL_IO_CONTROL_TYPE Type;
    uint Level;
    union
    {
        uint IoControlCode;
        uint OptionName;
    }
    void* InputBuffer;
    uint InputBufferLength;
    void* OutputBuffer;
    uint OutputBufferLength;
}
alias WLDP_HOST = int;
enum : int
{
    WLDP_HOST_RUNDLL32 = 0x00000000,
    WLDP_HOST_SVCHOST  = 0x00000001,
    WLDP_HOST_MAX      = 0x00000002,
}

alias WLDP_HOST_ID = int;
enum : int
{
    WLDP_HOST_ID_UNKNOWN    = 0x00000000,
    WLDP_HOST_ID_GLOBAL     = 0x00000001,
    WLDP_HOST_ID_VBA        = 0x00000002,
    WLDP_HOST_ID_WSH        = 0x00000003,
    WLDP_HOST_ID_POWERSHELL = 0x00000004,
    WLDP_HOST_ID_IE         = 0x00000005,
    WLDP_HOST_ID_MSI        = 0x00000006,
    WLDP_HOST_ID_ALL        = 0x00000007,
    WLDP_HOST_ID_MAX        = 0x00000008,
}

alias DECISION_LOCATION = int;
enum : int
{
    DECISION_LOCATION_REFRESH_GLOBAL_DATA         = 0x00000000,
    DECISION_LOCATION_PARAMETER_VALIDATION        = 0x00000001,
    DECISION_LOCATION_AUDIT                       = 0x00000002,
    DECISION_LOCATION_FAILED_CONVERT_GUID         = 0x00000003,
    DECISION_LOCATION_ENTERPRISE_DEFINED_CLASS_ID = 0x00000004,
    DECISION_LOCATION_GLOBAL_BUILT_IN_LIST        = 0x00000005,
    DECISION_LOCATION_PROVIDER_BUILT_IN_LIST      = 0x00000006,
    DECISION_LOCATION_ENFORCE_STATE_LIST          = 0x00000007,
    DECISION_LOCATION_NOT_FOUND                   = 0x00000008,
    DECISION_LOCATION_UNKNOWN                     = 0x00000009,
}

alias WLDP_KEY = int;
enum : int
{
    KEY_UNKNOWN  = 0x00000000,
    KEY_OVERRIDE = 0x00000001,
    KEY_ALL_KEYS = 0x00000002,
}

alias VALUENAME = int;
enum : int
{
    VALUENAME_UNKNOWN                     = 0x00000000,
    VALUENAME_ENTERPRISE_DEFINED_CLASS_ID = 0x00000001,
    VALUENAME_BUILT_IN_LIST               = 0x00000002,
}

alias WLDP_WINDOWS_LOCKDOWN_MODE = int;
enum : int
{
    WLDP_WINDOWS_LOCKDOWN_MODE_UNLOCKED = 0x00000000,
    WLDP_WINDOWS_LOCKDOWN_MODE_TRIAL    = 0x00000001,
    WLDP_WINDOWS_LOCKDOWN_MODE_LOCKED   = 0x00000002,
    WLDP_WINDOWS_LOCKDOWN_MODE_MAX      = 0x00000003,
}

alias WLDP_WINDOWS_LOCKDOWN_RESTRICTION = int;
enum : int
{
    WLDP_WINDOWS_LOCKDOWN_RESTRICTION_NONE               = 0x00000000,
    WLDP_WINDOWS_LOCKDOWN_RESTRICTION_NOUNLOCK           = 0x00000001,
    WLDP_WINDOWS_LOCKDOWN_RESTRICTION_NOUNLOCK_PERMANENT = 0x00000002,
    WLDP_WINDOWS_LOCKDOWN_RESTRICTION_MAX                = 0x00000003,
}

alias WLDP_POLICY_SETTING = int;
enum : int
{
    WLDP_POLICY_SETTING_AV_PERF_MODE = 0x000003e8,
}

struct WLDP_HOST_INFORMATION
{
    uint dwRevision;
    WLDP_HOST_ID dwHostId;
    const(wchar)* szSource;
    HANDLE hSource;
}
struct WLDP_DEVICE_SECURITY_INFORMATION
{
    uint UnlockIdSize;
    ubyte* UnlockId;
    uint ManufacturerIDLength;
    PWSTR ManufacturerID;
}
alias WLDP_EXECUTION_POLICY = int;
enum : int
{
    WLDP_EXECUTION_POLICY_BLOCKED         = 0x00000000,
    WLDP_EXECUTION_POLICY_ALLOWED         = 0x00000001,
    WLDP_EXECUTION_POLICY_REQUIRE_SANDBOX = 0x00000002,
}

alias WLDP_EXECUTION_EVALUATION_OPTIONS = int;
enum : int
{
    WLDP_EXECUTION_EVALUATION_OPTION_NONE                           = 0x00000000,
    WLDP_EXECUTION_EVALUATION_OPTION_EXECUTE_IN_INTERACTIVE_SESSION = 0x00000001,
}

alias PWLDP_SETDYNAMICCODETRUST_API = HRESULT function(HANDLE);
alias PWLDP_ISDYNAMICCODEPOLICYENABLED_API = HRESULT function(BOOL*);
alias PWLDP_QUERYDYNAMICODETRUST_API = HRESULT function(HANDLE, void*, uint);
alias PWLDP_QUERYWINDOWSLOCKDOWNMODE_API = HRESULT function(WLDP_WINDOWS_LOCKDOWN_MODE*);
alias PWLDP_QUERYDEVICESECURITYINFORMATION_API = HRESULT function(WLDP_DEVICE_SECURITY_INFORMATION*, uint, uint*);
alias PWLDP_QUERYWINDOWSLOCKDOWNRESTRICTION_API = HRESULT function(WLDP_WINDOWS_LOCKDOWN_RESTRICTION*);
alias PWLDP_SETWINDOWSLOCKDOWNRESTRICTION_API = HRESULT function(WLDP_WINDOWS_LOCKDOWN_RESTRICTION);
alias PWLDP_ISAPPAPPROVEDBYPOLICY_API = HRESULT function(const(wchar)*, ulong);
alias PWLDP_QUERYPOLICYSETTINGENABLED_API = HRESULT function(WLDP_POLICY_SETTING, BOOL*);
alias PWLDP_QUERYPOLICYSETTINGENABLED2_API = HRESULT function(const(wchar)*, BOOL*);
alias PWLDP_ISWCOSPRODUCTIONCONFIGURATION_API = HRESULT function(BOOL*);
alias PWLDP_RESETWCOSPRODUCTIONCONFIGURATION_API = HRESULT function();
alias PWLDP_ISPRODUCTIONCONFIGURATION_API = HRESULT function(BOOL*);
alias PWLDP_RESETPRODUCTIONCONFIGURATION_API = HRESULT function();
alias PWLDP_CANEXECUTEFILE_API = HRESULT function(const(GUID)*, WLDP_EXECUTION_EVALUATION_OPTIONS, HANDLE, const(wchar)*, WLDP_EXECUTION_POLICY*);
alias PWLDP_CANEXECUTEBUFFER_API = HRESULT function(const(GUID)*, WLDP_EXECUTION_EVALUATION_OPTIONS, const(ubyte)*, uint, const(wchar)*, WLDP_EXECUTION_POLICY*);
alias PWLDP_CANEXECUTESTREAM_API = HRESULT function(const(GUID)*, WLDP_EXECUTION_EVALUATION_OPTIONS, IStream, const(wchar)*, WLDP_EXECUTION_POLICY*);
enum IID_IDefaultBrowserSyncSettings = GUID(0x7a27faad, 0x5ae6, 0x4255, [0x90, 0x30, 0xc5, 0x30, 0x93, 0x62, 0x92, 0xe3]);
interface IDefaultBrowserSyncSettings : IUnknown
{
    BOOL IsEnabled();
}
enum CLSID_DefaultBrowserSyncSettings = GUID(0x3ac83423, 0x3112, 0x4aa6, [0x9b, 0x5b, 0x1f, 0xeb, 0x23, 0xd0, 0xc5, 0xf9]);
struct DefaultBrowserSyncSettings
{
}
struct DELAYLOAD_PROC_DESCRIPTOR
{
    uint ImportDescribedByName;
    union _Description_e__Union
    {
        const(char)* Name;
        uint Ordinal;
    }
}
/+ [CONFLICTED] struct DELAYLOAD_INFO
{
    uint Size;
    IMAGE_DELAYLOAD_DESCRIPTOR* DelayloadDescriptor;
    IMAGE_THUNK_DATA32* ThunkAddress;
    const(char)* TargetDllName;
    DELAYLOAD_PROC_DESCRIPTOR TargetApiDescriptor;
    void* TargetModuleBase;
    void* Unused;
    uint LastError;
}
+/
alias PDELAYLOAD_FAILURE_DLL_CALLBACK = void* function(uint, DELAYLOAD_INFO*);
enum IID_IDeleteBrowsingHistory = GUID(0xcf38ed4b, 0x2be7, 0x4461, [0x8b, 0x5e, 0x9a, 0x46, 0x6d, 0xc8, 0x2a, 0xe3]);
interface IDeleteBrowsingHistory : IUnknown
{
    HRESULT DeleteBrowsingHistory(uint);
}
