module windows.win32.devices.deviceanddriverinstallation;

import windows.win32.guid : GUID;
import windows.win32.data.htmlhelp : PRIORITY;
import windows.win32.devices.properties : DEVPROPKEY;
import windows.win32.foundation : BOOL, CHAR, FILETIME, HANDLE, HINSTANCE, HWND, LARGE_INTEGER, LPARAM, PSTR, PWSTR, RECT;
import windows.win32.graphics.gdi : HDC;
import windows.win32.system.diagnostics.debug__ : VER_PLATFORM;
import windows.win32.system.registry : HKEY;
import windows.win32.ui.controls_ : HIMAGELIST, HPROPSHEETPAGE, PROPSHEETHEADERA_V2, PROPSHEETHEADERW_V2;
import windows.win32.ui.windowsandmessaging : HICON;

version (Windows):
extern (Windows):

alias SP_COPY_STYLE = uint;
enum : uint
{
    SP_COPY_DELETESOURCE        = 0x00000001,
    SP_COPY_REPLACEONLY         = 0x00000002,
    SP_COPY_NEWER_OR_SAME       = 0x00000004,
    SP_COPY_NEWER_ONLY          = 0x00010000,
    SP_COPY_NOOVERWRITE         = 0x00000008,
    SP_COPY_NODECOMP            = 0x00000010,
    SP_COPY_LANGUAGEAWARE       = 0x00000020,
    SP_COPY_SOURCE_ABSOLUTE     = 0x00000040,
    SP_COPY_SOURCEPATH_ABSOLUTE = 0x00000080,
    SP_COPY_FORCE_IN_USE        = 0x00000200,
    SP_COPY_IN_USE_NEEDS_REBOOT = 0x00000100,
    SP_COPY_NOSKIP              = 0x00000400,
    SP_COPY_FORCE_NOOVERWRITE   = 0x00001000,
    SP_COPY_FORCE_NEWER         = 0x00002000,
    SP_COPY_WARNIFSKIP          = 0x00004000,
    SP_COPY_NOBROWSE            = 0x00008000,
    SP_COPY_NEWER               = 0x00000004,
    SP_COPY_RESERVED            = 0x00020000,
    SP_COPY_OEMINF_CATALOG_ONLY = 0x00040000,
    SP_COPY_REPLACE_BOOT_FILE   = 0x00080000,
    SP_COPY_NOPRUNE             = 0x00100000,
    SP_COPY_OEM_F6_INF          = 0x00200000,
    SP_COPY_ALREADYDECOMP       = 0x00400000,
    SP_COPY_WINDOWS_SIGNED      = 0x01000000,
    SP_COPY_PNPLOCKED           = 0x02000000,
    SP_COPY_IN_USE_TRY_RENAME   = 0x04000000,
    SP_COPY_INBOX_INF           = 0x08000000,
    SP_COPY_HARDLINK            = 0x10000000,
}

alias SETUP_FILE_OPERATION = uint;
enum : uint
{
    FILEOP_DELETE = 0x00000002,
    FILEOP_COPY   = 0x00000000,
}

alias OEM_SOURCE_MEDIA_TYPE = uint;
enum : uint
{
    SPOST_NONE = 0x00000000,
    SPOST_PATH = 0x00000001,
    SPOST_URL  = 0x00000002,
}

alias SETUP_DI_BUILD_DRIVER_DRIVER_TYPE = uint;
enum : uint
{
    SPDIT_CLASSDRIVER  = 0x00000001,
    SPDIT_COMPATDRIVER = 0x00000002,
}

alias SP_INF_STYLE = uint;
enum : uint
{
    INF_STYLE_NONE  = 0x00000000,
    INF_STYLE_OLDNT = 0x00000001,
    INF_STYLE_WIN4  = 0x00000002,
}

alias CONFIGRET = uint;
enum : uint
{
    CR_SUCCESS                  = 0x00000000,
    CR_DEFAULT                  = 0x00000001,
    CR_OUT_OF_MEMORY            = 0x00000002,
    CR_INVALID_POINTER          = 0x00000003,
    CR_INVALID_FLAG             = 0x00000004,
    CR_INVALID_DEVNODE          = 0x00000005,
    CR_INVALID_DEVINST          = 0x00000005,
    CR_INVALID_RES_DES          = 0x00000006,
    CR_INVALID_LOG_CONF         = 0x00000007,
    CR_INVALID_ARBITRATOR       = 0x00000008,
    CR_INVALID_NODELIST         = 0x00000009,
    CR_DEVNODE_HAS_REQS         = 0x0000000a,
    CR_DEVINST_HAS_REQS         = 0x0000000a,
    CR_INVALID_RESOURCEID       = 0x0000000b,
    CR_DLVXD_NOT_FOUND          = 0x0000000c,
    CR_NO_SUCH_DEVNODE          = 0x0000000d,
    CR_NO_SUCH_DEVINST          = 0x0000000d,
    CR_NO_MORE_LOG_CONF         = 0x0000000e,
    CR_NO_MORE_RES_DES          = 0x0000000f,
    CR_ALREADY_SUCH_DEVNODE     = 0x00000010,
    CR_ALREADY_SUCH_DEVINST     = 0x00000010,
    CR_INVALID_RANGE_LIST       = 0x00000011,
    CR_INVALID_RANGE            = 0x00000012,
    CR_FAILURE                  = 0x00000013,
    CR_NO_SUCH_LOGICAL_DEV      = 0x00000014,
    CR_CREATE_BLOCKED           = 0x00000015,
    CR_NOT_SYSTEM_VM            = 0x00000016,
    CR_REMOVE_VETOED            = 0x00000017,
    CR_APM_VETOED               = 0x00000018,
    CR_INVALID_LOAD_TYPE        = 0x00000019,
    CR_BUFFER_SMALL             = 0x0000001a,
    CR_NO_ARBITRATOR            = 0x0000001b,
    CR_NO_REGISTRY_HANDLE       = 0x0000001c,
    CR_REGISTRY_ERROR           = 0x0000001d,
    CR_INVALID_DEVICE_ID        = 0x0000001e,
    CR_INVALID_DATA             = 0x0000001f,
    CR_INVALID_API              = 0x00000020,
    CR_DEVLOADER_NOT_READY      = 0x00000021,
    CR_NEED_RESTART             = 0x00000022,
    CR_NO_MORE_HW_PROFILES      = 0x00000023,
    CR_DEVICE_NOT_THERE         = 0x00000024,
    CR_NO_SUCH_VALUE            = 0x00000025,
    CR_WRONG_TYPE               = 0x00000026,
    CR_INVALID_PRIORITY         = 0x00000027,
    CR_NOT_DISABLEABLE          = 0x00000028,
    CR_FREE_RESOURCES           = 0x00000029,
    CR_QUERY_VETOED             = 0x0000002a,
    CR_CANT_SHARE_IRQ           = 0x0000002b,
    CR_NO_DEPENDENT             = 0x0000002c,
    CR_SAME_RESOURCES           = 0x0000002d,
    CR_NO_SUCH_REGISTRY_KEY     = 0x0000002e,
    CR_INVALID_MACHINENAME      = 0x0000002f,
    CR_REMOTE_COMM_FAILURE      = 0x00000030,
    CR_MACHINE_UNAVAILABLE      = 0x00000031,
    CR_NO_CM_SERVICES           = 0x00000032,
    CR_ACCESS_DENIED            = 0x00000033,
    CR_CALL_NOT_IMPLEMENTED     = 0x00000034,
    CR_INVALID_PROPERTY         = 0x00000035,
    CR_DEVICE_INTERFACE_ACTIVE  = 0x00000036,
    CR_NO_SUCH_DEVICE_INTERFACE = 0x00000037,
    CR_INVALID_REFERENCE_STRING = 0x00000038,
    CR_INVALID_CONFLICT_LIST    = 0x00000039,
    CR_INVALID_INDEX            = 0x0000003a,
    CR_INVALID_STRUCTURE_SIZE   = 0x0000003b,
    NUM_CR_RESULTS              = 0x0000003c,
}

BOOL SetupGetInfInformationA(const(void)*, uint, SP_INF_INFORMATION*, uint, uint*);
BOOL SetupGetInfInformationW(const(void)*, uint, SP_INF_INFORMATION*, uint, uint*);
BOOL SetupQueryInfFileInformationA(SP_INF_INFORMATION*, uint, PSTR, uint, uint*);
BOOL SetupQueryInfFileInformationW(SP_INF_INFORMATION*, uint, PWSTR, uint, uint*);
BOOL SetupQueryInfOriginalFileInformationA(SP_INF_INFORMATION*, uint, SP_ALTPLATFORM_INFO_V2*, SP_ORIGINAL_FILE_INFO_A*);
BOOL SetupQueryInfOriginalFileInformationW(SP_INF_INFORMATION*, uint, SP_ALTPLATFORM_INFO_V2*, SP_ORIGINAL_FILE_INFO_W*);
BOOL SetupQueryInfVersionInformationA(SP_INF_INFORMATION*, uint, const(char)*, PSTR, uint, uint*);
BOOL SetupQueryInfVersionInformationW(SP_INF_INFORMATION*, uint, const(wchar)*, PWSTR, uint, uint*);
BOOL SetupGetInfDriverStoreLocationA(const(char)*, SP_ALTPLATFORM_INFO_V2*, const(char)*, PSTR, uint, uint*);
BOOL SetupGetInfDriverStoreLocationW(const(wchar)*, SP_ALTPLATFORM_INFO_V2*, const(wchar)*, PWSTR, uint, uint*);
BOOL SetupGetInfPublishedNameA(const(char)*, PSTR, uint, uint*);
BOOL SetupGetInfPublishedNameW(const(wchar)*, PWSTR, uint, uint*);
BOOL SetupGetInfFileListA(const(char)*, uint, PSTR, uint, uint*);
BOOL SetupGetInfFileListW(const(wchar)*, uint, PWSTR, uint, uint*);
void* SetupOpenInfFileW(const(wchar)*, const(wchar)*, uint, uint*);
void* SetupOpenInfFileA(const(char)*, const(char)*, uint, uint*);
void* SetupOpenMasterInf();
BOOL SetupOpenAppendInfFileW(const(wchar)*, void*, uint*);
BOOL SetupOpenAppendInfFileA(const(char)*, void*, uint*);
void SetupCloseInfFile(void*);
BOOL SetupFindFirstLineA(void*, const(char)*, const(char)*, INFCONTEXT*);
BOOL SetupFindFirstLineW(void*, const(wchar)*, const(wchar)*, INFCONTEXT*);
BOOL SetupFindNextLine(INFCONTEXT*, INFCONTEXT*);
BOOL SetupFindNextMatchLineA(INFCONTEXT*, const(char)*, INFCONTEXT*);
BOOL SetupFindNextMatchLineW(INFCONTEXT*, const(wchar)*, INFCONTEXT*);
BOOL SetupGetLineByIndexA(void*, const(char)*, uint, INFCONTEXT*);
BOOL SetupGetLineByIndexW(void*, const(wchar)*, uint, INFCONTEXT*);
int SetupGetLineCountA(void*, const(char)*);
int SetupGetLineCountW(void*, const(wchar)*);
BOOL SetupGetLineTextA(INFCONTEXT*, void*, const(char)*, const(char)*, PSTR, uint, uint*);
BOOL SetupGetLineTextW(INFCONTEXT*, void*, const(wchar)*, const(wchar)*, PWSTR, uint, uint*);
uint SetupGetFieldCount(INFCONTEXT*);
BOOL SetupGetStringFieldA(INFCONTEXT*, uint, PSTR, uint, uint*);
BOOL SetupGetStringFieldW(INFCONTEXT*, uint, PWSTR, uint, uint*);
BOOL SetupGetIntField(INFCONTEXT*, uint, int*);
BOOL SetupGetMultiSzFieldA(INFCONTEXT*, uint, PSTR, uint, uint*);
BOOL SetupGetMultiSzFieldW(INFCONTEXT*, uint, PWSTR, uint, uint*);
BOOL SetupGetBinaryField(INFCONTEXT*, uint, ubyte*, uint, uint*);
uint SetupGetFileCompressionInfoA(const(char)*, PSTR*, uint*, uint*, uint*);
uint SetupGetFileCompressionInfoW(const(wchar)*, PWSTR*, uint*, uint*, uint*);
BOOL SetupGetFileCompressionInfoExA(const(char)*, PSTR, uint, uint*, uint*, uint*, uint*);
BOOL SetupGetFileCompressionInfoExW(const(wchar)*, PWSTR, uint, uint*, uint*, uint*, uint*);
uint SetupDecompressOrCopyFileA(const(char)*, const(char)*, uint*);
uint SetupDecompressOrCopyFileW(const(wchar)*, const(wchar)*, uint*);
BOOL SetupGetSourceFileLocationA(void*, INFCONTEXT*, const(char)*, uint*, PSTR, uint, uint*);
BOOL SetupGetSourceFileLocationW(void*, INFCONTEXT*, const(wchar)*, uint*, PWSTR, uint, uint*);
BOOL SetupGetSourceFileSizeA(void*, INFCONTEXT*, const(char)*, const(char)*, uint*, uint);
BOOL SetupGetSourceFileSizeW(void*, INFCONTEXT*, const(wchar)*, const(wchar)*, uint*, uint);
BOOL SetupGetTargetPathA(void*, INFCONTEXT*, const(char)*, PSTR, uint, uint*);
BOOL SetupGetTargetPathW(void*, INFCONTEXT*, const(wchar)*, PWSTR, uint, uint*);
BOOL SetupSetSourceListA(uint, PSTR*, uint);
BOOL SetupSetSourceListW(uint, PWSTR*, uint);
BOOL SetupCancelTemporarySourceList();
BOOL SetupAddToSourceListA(uint, const(char)*);
BOOL SetupAddToSourceListW(uint, const(wchar)*);
BOOL SetupRemoveFromSourceListA(uint, const(char)*);
BOOL SetupRemoveFromSourceListW(uint, const(wchar)*);
BOOL SetupQuerySourceListA(uint, PSTR**, uint*);
BOOL SetupQuerySourceListW(uint, PWSTR**, uint*);
BOOL SetupFreeSourceListA(PSTR**, uint);
BOOL SetupFreeSourceListW(PWSTR**, uint);
uint SetupPromptForDiskA(HWND, const(char)*, const(char)*, const(char)*, const(char)*, const(char)*, uint, PSTR, uint, uint*);
uint SetupPromptForDiskW(HWND, const(wchar)*, const(wchar)*, const(wchar)*, const(wchar)*, const(wchar)*, uint, PWSTR, uint, uint*);
uint SetupCopyErrorA(HWND, const(char)*, const(char)*, const(char)*, const(char)*, const(char)*, uint, uint, PSTR, uint, uint*);
uint SetupCopyErrorW(HWND, const(wchar)*, const(wchar)*, const(wchar)*, const(wchar)*, const(wchar)*, uint, uint, PWSTR, uint, uint*);
uint SetupRenameErrorA(HWND, const(char)*, const(char)*, const(char)*, uint, uint);
uint SetupRenameErrorW(HWND, const(wchar)*, const(wchar)*, const(wchar)*, uint, uint);
uint SetupDeleteErrorA(HWND, const(char)*, const(char)*, uint, uint);
uint SetupDeleteErrorW(HWND, const(wchar)*, const(wchar)*, uint, uint);
uint SetupBackupErrorA(HWND, const(char)*, const(char)*, const(char)*, uint, uint);
uint SetupBackupErrorW(HWND, const(wchar)*, const(wchar)*, const(wchar)*, uint, uint);
BOOL SetupSetDirectoryIdA(void*, uint, const(char)*);
BOOL SetupSetDirectoryIdW(void*, uint, const(wchar)*);
BOOL SetupSetDirectoryIdExA(void*, uint, const(char)*, uint, uint, void*);
BOOL SetupSetDirectoryIdExW(void*, uint, const(wchar)*, uint, uint, void*);
BOOL SetupGetSourceInfoA(void*, uint, uint, PSTR, uint, uint*);
BOOL SetupGetSourceInfoW(void*, uint, uint, PWSTR, uint, uint*);
BOOL SetupInstallFileA(void*, INFCONTEXT*, const(char)*, const(char)*, const(char)*, SP_COPY_STYLE, PSP_FILE_CALLBACK_A, void*);
BOOL SetupInstallFileW(void*, INFCONTEXT*, const(wchar)*, const(wchar)*, const(wchar)*, SP_COPY_STYLE, PSP_FILE_CALLBACK_W, void*);
BOOL SetupInstallFileExA(void*, INFCONTEXT*, const(char)*, const(char)*, const(char)*, SP_COPY_STYLE, PSP_FILE_CALLBACK_A, void*, BOOL*);
BOOL SetupInstallFileExW(void*, INFCONTEXT*, const(wchar)*, const(wchar)*, const(wchar)*, SP_COPY_STYLE, PSP_FILE_CALLBACK_W, void*, BOOL*);
void* SetupOpenFileQueue();
BOOL SetupCloseFileQueue(void*);
BOOL SetupSetFileQueueAlternatePlatformA(void*, SP_ALTPLATFORM_INFO_V2*, const(char)*);
BOOL SetupSetFileQueueAlternatePlatformW(void*, SP_ALTPLATFORM_INFO_V2*, const(wchar)*);
BOOL SetupSetPlatformPathOverrideA(const(char)*);
BOOL SetupSetPlatformPathOverrideW(const(wchar)*);
BOOL SetupQueueCopyA(void*, const(char)*, const(char)*, const(char)*, const(char)*, const(char)*, const(char)*, const(char)*, uint);
BOOL SetupQueueCopyW(void*, const(wchar)*, const(wchar)*, const(wchar)*, const(wchar)*, const(wchar)*, const(wchar)*, const(wchar)*, uint);
BOOL SetupQueueCopyIndirectA(SP_FILE_COPY_PARAMS_A*);
BOOL SetupQueueCopyIndirectW(SP_FILE_COPY_PARAMS_W*);
BOOL SetupQueueDefaultCopyA(void*, void*, const(char)*, const(char)*, const(char)*, uint);
BOOL SetupQueueDefaultCopyW(void*, void*, const(wchar)*, const(wchar)*, const(wchar)*, uint);
BOOL SetupQueueCopySectionA(void*, const(char)*, void*, void*, const(char)*, uint);
BOOL SetupQueueCopySectionW(void*, const(wchar)*, void*, void*, const(wchar)*, uint);
BOOL SetupQueueDeleteA(void*, const(char)*, const(char)*);
BOOL SetupQueueDeleteW(void*, const(wchar)*, const(wchar)*);
BOOL SetupQueueDeleteSectionA(void*, void*, void*, const(char)*);
BOOL SetupQueueDeleteSectionW(void*, void*, void*, const(wchar)*);
BOOL SetupQueueRenameA(void*, const(char)*, const(char)*, const(char)*, const(char)*);
BOOL SetupQueueRenameW(void*, const(wchar)*, const(wchar)*, const(wchar)*, const(wchar)*);
BOOL SetupQueueRenameSectionA(void*, void*, void*, const(char)*);
BOOL SetupQueueRenameSectionW(void*, void*, void*, const(wchar)*);
BOOL SetupCommitFileQueueA(HWND, void*, PSP_FILE_CALLBACK_A, void*);
BOOL SetupCommitFileQueueW(HWND, void*, PSP_FILE_CALLBACK_W, void*);
BOOL SetupScanFileQueueA(void*, uint, HWND, PSP_FILE_CALLBACK_A, void*, uint*);
BOOL SetupScanFileQueueW(void*, uint, HWND, PSP_FILE_CALLBACK_W, void*, uint*);
BOOL SetupGetFileQueueCount(void*, uint, uint*);
BOOL SetupGetFileQueueFlags(void*, uint*);
BOOL SetupSetFileQueueFlags(void*, uint, uint);
BOOL SetupCopyOEMInfA(const(char)*, const(char)*, OEM_SOURCE_MEDIA_TYPE, uint, PSTR, uint, uint*, PSTR*);
BOOL SetupCopyOEMInfW(const(wchar)*, const(wchar)*, OEM_SOURCE_MEDIA_TYPE, uint, PWSTR, uint, uint*, PWSTR*);
BOOL SetupUninstallOEMInfA(const(char)*, uint, void*);
BOOL SetupUninstallOEMInfW(const(wchar)*, uint, void*);
BOOL SetupUninstallNewlyCopiedInfs(void*, uint, void*);
void* SetupCreateDiskSpaceListA(void*, uint, uint);
void* SetupCreateDiskSpaceListW(void*, uint, uint);
void* SetupDuplicateDiskSpaceListA(void*, void*, uint, uint);
void* SetupDuplicateDiskSpaceListW(void*, void*, uint, uint);
BOOL SetupDestroyDiskSpaceList(void*);
BOOL SetupQueryDrivesInDiskSpaceListA(void*, PSTR, uint, uint*);
BOOL SetupQueryDrivesInDiskSpaceListW(void*, PWSTR, uint, uint*);
BOOL SetupQuerySpaceRequiredOnDriveA(void*, const(char)*, long*, void*, uint);
BOOL SetupQuerySpaceRequiredOnDriveW(void*, const(wchar)*, long*, void*, uint);
BOOL SetupAdjustDiskSpaceListA(void*, const(char)*, long, void*, uint);
BOOL SetupAdjustDiskSpaceListW(void*, const(wchar)*, long, void*, uint);
BOOL SetupAddToDiskSpaceListA(void*, const(char)*, long, SETUP_FILE_OPERATION, void*, uint);
BOOL SetupAddToDiskSpaceListW(void*, const(wchar)*, long, SETUP_FILE_OPERATION, void*, uint);
BOOL SetupAddSectionToDiskSpaceListA(void*, void*, void*, const(char)*, SETUP_FILE_OPERATION, void*, uint);
BOOL SetupAddSectionToDiskSpaceListW(void*, void*, void*, const(wchar)*, SETUP_FILE_OPERATION, void*, uint);
BOOL SetupAddInstallSectionToDiskSpaceListA(void*, void*, void*, const(char)*, void*, uint);
BOOL SetupAddInstallSectionToDiskSpaceListW(void*, void*, void*, const(wchar)*, void*, uint);
BOOL SetupRemoveFromDiskSpaceListA(void*, const(char)*, SETUP_FILE_OPERATION, void*, uint);
BOOL SetupRemoveFromDiskSpaceListW(void*, const(wchar)*, SETUP_FILE_OPERATION, void*, uint);
BOOL SetupRemoveSectionFromDiskSpaceListA(void*, void*, void*, const(char)*, SETUP_FILE_OPERATION, void*, uint);
BOOL SetupRemoveSectionFromDiskSpaceListW(void*, void*, void*, const(wchar)*, SETUP_FILE_OPERATION, void*, uint);
BOOL SetupRemoveInstallSectionFromDiskSpaceListA(void*, void*, void*, const(char)*, void*, uint);
BOOL SetupRemoveInstallSectionFromDiskSpaceListW(void*, void*, void*, const(wchar)*, void*, uint);
BOOL SetupIterateCabinetA(const(char)*, uint, PSP_FILE_CALLBACK_A, void*);
BOOL SetupIterateCabinetW(const(wchar)*, uint, PSP_FILE_CALLBACK_W, void*);
int SetupPromptReboot(void*, HWND, BOOL);
void* SetupInitDefaultQueueCallback(HWND);
void* SetupInitDefaultQueueCallbackEx(HWND, HWND, uint, uint, void*);
void SetupTermDefaultQueueCallback(void*);
uint SetupDefaultQueueCallbackA(void*, uint, ulong, ulong);
uint SetupDefaultQueueCallbackW(void*, uint, ulong, ulong);
BOOL SetupInstallFromInfSectionA(HWND, void*, const(char)*, uint, HKEY, const(char)*, uint, PSP_FILE_CALLBACK_A, void*, HDEVINFO, SP_DEVINFO_DATA*);
BOOL SetupInstallFromInfSectionW(HWND, void*, const(wchar)*, uint, HKEY, const(wchar)*, uint, PSP_FILE_CALLBACK_W, void*, HDEVINFO, SP_DEVINFO_DATA*);
BOOL SetupInstallFilesFromInfSectionA(void*, void*, void*, const(char)*, const(char)*, uint);
BOOL SetupInstallFilesFromInfSectionW(void*, void*, void*, const(wchar)*, const(wchar)*, uint);
BOOL SetupInstallServicesFromInfSectionA(void*, const(char)*, uint);
BOOL SetupInstallServicesFromInfSectionW(void*, const(wchar)*, uint);
BOOL SetupInstallServicesFromInfSectionExA(void*, const(char)*, uint, HDEVINFO, SP_DEVINFO_DATA*, void*, void*);
BOOL SetupInstallServicesFromInfSectionExW(void*, const(wchar)*, uint, HDEVINFO, SP_DEVINFO_DATA*, void*, void*);
void InstallHinfSectionA(HWND, HINSTANCE, const(char)*, int);
void InstallHinfSectionW(HWND, HINSTANCE, const(wchar)*, int);
void* SetupInitializeFileLogA(const(char)*, uint);
void* SetupInitializeFileLogW(const(wchar)*, uint);
BOOL SetupTerminateFileLog(void*);
BOOL SetupLogFileA(void*, const(char)*, const(char)*, const(char)*, uint, const(char)*, const(char)*, const(char)*, uint);
BOOL SetupLogFileW(void*, const(wchar)*, const(wchar)*, const(wchar)*, uint, const(wchar)*, const(wchar)*, const(wchar)*, uint);
BOOL SetupRemoveFileLogEntryA(void*, const(char)*, const(char)*);
BOOL SetupRemoveFileLogEntryW(void*, const(wchar)*, const(wchar)*);
BOOL SetupQueryFileLogA(void*, const(char)*, const(char)*, SetupFileLogInfo, PSTR, uint, uint*);
BOOL SetupQueryFileLogW(void*, const(wchar)*, const(wchar)*, SetupFileLogInfo, PWSTR, uint, uint*);
BOOL SetupOpenLog(BOOL);
BOOL SetupLogErrorA(const(char)*, uint);
BOOL SetupLogErrorW(const(wchar)*, uint);
void SetupCloseLog();
ulong SetupGetThreadLogToken();
void SetupSetThreadLogToken(ulong);
void SetupWriteTextLog(ulong, uint, uint, const(char)*);
void SetupWriteTextLogError(ulong, uint, uint, uint, const(char)*);
void SetupWriteTextLogInfLine(ulong, uint, void*, INFCONTEXT*);
BOOL SetupGetBackupInformationA(void*, SP_BACKUP_QUEUE_PARAMS_V2_A*);
BOOL SetupGetBackupInformationW(void*, SP_BACKUP_QUEUE_PARAMS_V2_W*);
BOOL SetupPrepareQueueForRestoreA(void*, const(char)*, uint);
BOOL SetupPrepareQueueForRestoreW(void*, const(wchar)*, uint);
BOOL SetupSetNonInteractiveMode(BOOL);
BOOL SetupGetNonInteractiveMode();
HDEVINFO SetupDiCreateDeviceInfoList(const(GUID)*, HWND);
HDEVINFO SetupDiCreateDeviceInfoListExA(const(GUID)*, HWND, const(char)*, void*);
HDEVINFO SetupDiCreateDeviceInfoListExW(const(GUID)*, HWND, const(wchar)*, void*);
BOOL SetupDiGetDeviceInfoListClass(HDEVINFO, GUID*);
BOOL SetupDiGetDeviceInfoListDetailA(HDEVINFO, SP_DEVINFO_LIST_DETAIL_DATA_A*);
BOOL SetupDiGetDeviceInfoListDetailW(HDEVINFO, SP_DEVINFO_LIST_DETAIL_DATA_W*);
BOOL SetupDiCreateDeviceInfoA(HDEVINFO, const(char)*, const(GUID)*, const(char)*, HWND, uint, SP_DEVINFO_DATA*);
BOOL SetupDiCreateDeviceInfoW(HDEVINFO, const(wchar)*, const(GUID)*, const(wchar)*, HWND, uint, SP_DEVINFO_DATA*);
BOOL SetupDiOpenDeviceInfoA(HDEVINFO, const(char)*, HWND, uint, SP_DEVINFO_DATA*);
BOOL SetupDiOpenDeviceInfoW(HDEVINFO, const(wchar)*, HWND, uint, SP_DEVINFO_DATA*);
BOOL SetupDiGetDeviceInstanceIdA(HDEVINFO, SP_DEVINFO_DATA*, PSTR, uint, uint*);
BOOL SetupDiGetDeviceInstanceIdW(HDEVINFO, SP_DEVINFO_DATA*, PWSTR, uint, uint*);
BOOL SetupDiDeleteDeviceInfo(HDEVINFO, SP_DEVINFO_DATA*);
BOOL SetupDiEnumDeviceInfo(HDEVINFO, uint, SP_DEVINFO_DATA*);
BOOL SetupDiDestroyDeviceInfoList(HDEVINFO);
BOOL SetupDiEnumDeviceInterfaces(HDEVINFO, SP_DEVINFO_DATA*, const(GUID)*, uint, SP_DEVICE_INTERFACE_DATA*);
BOOL SetupDiCreateDeviceInterfaceA(HDEVINFO, SP_DEVINFO_DATA*, const(GUID)*, const(char)*, uint, SP_DEVICE_INTERFACE_DATA*);
BOOL SetupDiCreateDeviceInterfaceW(HDEVINFO, SP_DEVINFO_DATA*, const(GUID)*, const(wchar)*, uint, SP_DEVICE_INTERFACE_DATA*);
BOOL SetupDiOpenDeviceInterfaceA(HDEVINFO, const(char)*, uint, SP_DEVICE_INTERFACE_DATA*);
BOOL SetupDiOpenDeviceInterfaceW(HDEVINFO, const(wchar)*, uint, SP_DEVICE_INTERFACE_DATA*);
BOOL SetupDiGetDeviceInterfaceAlias(HDEVINFO, SP_DEVICE_INTERFACE_DATA*, const(GUID)*, SP_DEVICE_INTERFACE_DATA*);
BOOL SetupDiDeleteDeviceInterfaceData(HDEVINFO, SP_DEVICE_INTERFACE_DATA*);
BOOL SetupDiRemoveDeviceInterface(HDEVINFO, SP_DEVICE_INTERFACE_DATA*);
BOOL SetupDiGetDeviceInterfaceDetailA(HDEVINFO, SP_DEVICE_INTERFACE_DATA*, SP_DEVICE_INTERFACE_DETAIL_DATA_A*, uint, uint*, SP_DEVINFO_DATA*);
BOOL SetupDiGetDeviceInterfaceDetailW(HDEVINFO, SP_DEVICE_INTERFACE_DATA*, SP_DEVICE_INTERFACE_DETAIL_DATA_W*, uint, uint*, SP_DEVINFO_DATA*);
BOOL SetupDiInstallDeviceInterfaces(HDEVINFO, SP_DEVINFO_DATA*);
BOOL SetupDiSetDeviceInterfaceDefault(HDEVINFO, SP_DEVICE_INTERFACE_DATA*, uint, void*);
BOOL SetupDiRegisterDeviceInfo(HDEVINFO, SP_DEVINFO_DATA*, uint, PSP_DETSIG_CMPPROC, void*, SP_DEVINFO_DATA*);
BOOL SetupDiBuildDriverInfoList(HDEVINFO, SP_DEVINFO_DATA*, SETUP_DI_BUILD_DRIVER_DRIVER_TYPE);
BOOL SetupDiCancelDriverInfoSearch(HDEVINFO);
BOOL SetupDiEnumDriverInfoA(HDEVINFO, SP_DEVINFO_DATA*, uint, uint, SP_DRVINFO_DATA_V2_A*);
BOOL SetupDiEnumDriverInfoW(HDEVINFO, SP_DEVINFO_DATA*, uint, uint, SP_DRVINFO_DATA_V2_W*);
BOOL SetupDiGetSelectedDriverA(HDEVINFO, SP_DEVINFO_DATA*, SP_DRVINFO_DATA_V2_A*);
BOOL SetupDiGetSelectedDriverW(HDEVINFO, SP_DEVINFO_DATA*, SP_DRVINFO_DATA_V2_W*);
BOOL SetupDiSetSelectedDriverA(HDEVINFO, SP_DEVINFO_DATA*, SP_DRVINFO_DATA_V2_A*);
BOOL SetupDiSetSelectedDriverW(HDEVINFO, SP_DEVINFO_DATA*, SP_DRVINFO_DATA_V2_W*);
BOOL SetupDiGetDriverInfoDetailA(HDEVINFO, SP_DEVINFO_DATA*, SP_DRVINFO_DATA_V2_A*, SP_DRVINFO_DETAIL_DATA_A*, uint, uint*);
BOOL SetupDiGetDriverInfoDetailW(HDEVINFO, SP_DEVINFO_DATA*, SP_DRVINFO_DATA_V2_W*, SP_DRVINFO_DETAIL_DATA_W*, uint, uint*);
BOOL SetupDiDestroyDriverInfoList(HDEVINFO, SP_DEVINFO_DATA*, uint);
HDEVINFO SetupDiGetClassDevsA(const(GUID)*, const(char)*, HWND, uint);
HDEVINFO SetupDiGetClassDevsW(const(GUID)*, const(wchar)*, HWND, uint);
HDEVINFO SetupDiGetClassDevsExA(const(GUID)*, const(char)*, HWND, uint, HDEVINFO, const(char)*, void*);
HDEVINFO SetupDiGetClassDevsExW(const(GUID)*, const(wchar)*, HWND, uint, HDEVINFO, const(wchar)*, void*);
BOOL SetupDiGetINFClassA(const(char)*, GUID*, PSTR, uint, uint*);
BOOL SetupDiGetINFClassW(const(wchar)*, GUID*, PWSTR, uint, uint*);
BOOL SetupDiBuildClassInfoList(uint, GUID*, uint, uint*);
BOOL SetupDiBuildClassInfoListExA(uint, GUID*, uint, uint*, const(char)*, void*);
BOOL SetupDiBuildClassInfoListExW(uint, GUID*, uint, uint*, const(wchar)*, void*);
BOOL SetupDiGetClassDescriptionA(const(GUID)*, PSTR, uint, uint*);
BOOL SetupDiGetClassDescriptionW(const(GUID)*, PWSTR, uint, uint*);
BOOL SetupDiGetClassDescriptionExA(const(GUID)*, PSTR, uint, uint*, const(char)*, void*);
BOOL SetupDiGetClassDescriptionExW(const(GUID)*, PWSTR, uint, uint*, const(wchar)*, void*);
BOOL SetupDiCallClassInstaller(uint, HDEVINFO, SP_DEVINFO_DATA*);
BOOL SetupDiSelectDevice(HDEVINFO, SP_DEVINFO_DATA*);
BOOL SetupDiSelectBestCompatDrv(HDEVINFO, SP_DEVINFO_DATA*);
BOOL SetupDiInstallDevice(HDEVINFO, SP_DEVINFO_DATA*);
BOOL SetupDiInstallDriverFiles(HDEVINFO, SP_DEVINFO_DATA*);
BOOL SetupDiRegisterCoDeviceInstallers(HDEVINFO, SP_DEVINFO_DATA*);
BOOL SetupDiRemoveDevice(HDEVINFO, SP_DEVINFO_DATA*);
BOOL SetupDiUnremoveDevice(HDEVINFO, SP_DEVINFO_DATA*);
BOOL SetupDiRestartDevices(HDEVINFO, SP_DEVINFO_DATA*);
BOOL SetupDiChangeState(HDEVINFO, SP_DEVINFO_DATA*);
BOOL SetupDiInstallClassA(HWND, const(char)*, uint, void*);
BOOL SetupDiInstallClassW(HWND, const(wchar)*, uint, void*);
BOOL SetupDiInstallClassExA(HWND, const(char)*, uint, void*, const(GUID)*, void*, void*);
BOOL SetupDiInstallClassExW(HWND, const(wchar)*, uint, void*, const(GUID)*, void*, void*);
HKEY SetupDiOpenClassRegKey(const(GUID)*, uint);
HKEY SetupDiOpenClassRegKeyExA(const(GUID)*, uint, uint, const(char)*, void*);
HKEY SetupDiOpenClassRegKeyExW(const(GUID)*, uint, uint, const(wchar)*, void*);
HKEY SetupDiCreateDeviceInterfaceRegKeyA(HDEVINFO, SP_DEVICE_INTERFACE_DATA*, uint, uint, void*, const(char)*);
HKEY SetupDiCreateDeviceInterfaceRegKeyW(HDEVINFO, SP_DEVICE_INTERFACE_DATA*, uint, uint, void*, const(wchar)*);
HKEY SetupDiOpenDeviceInterfaceRegKey(HDEVINFO, SP_DEVICE_INTERFACE_DATA*, uint, uint);
BOOL SetupDiDeleteDeviceInterfaceRegKey(HDEVINFO, SP_DEVICE_INTERFACE_DATA*, uint);
HKEY SetupDiCreateDevRegKeyA(HDEVINFO, SP_DEVINFO_DATA*, uint, uint, uint, void*, const(char)*);
HKEY SetupDiCreateDevRegKeyW(HDEVINFO, SP_DEVINFO_DATA*, uint, uint, uint, void*, const(wchar)*);
HKEY SetupDiOpenDevRegKey(HDEVINFO, SP_DEVINFO_DATA*, uint, uint, uint, uint);
BOOL SetupDiDeleteDevRegKey(HDEVINFO, SP_DEVINFO_DATA*, uint, uint, uint);
BOOL SetupDiGetHwProfileList(uint*, uint, uint*, uint*);
BOOL SetupDiGetHwProfileListExA(uint*, uint, uint*, uint*, const(char)*, void*);
BOOL SetupDiGetHwProfileListExW(uint*, uint, uint*, uint*, const(wchar)*, void*);
BOOL SetupDiGetDevicePropertyKeys(HDEVINFO, SP_DEVINFO_DATA*, DEVPROPKEY*, uint, uint*, uint);
BOOL SetupDiGetDevicePropertyW(HDEVINFO, SP_DEVINFO_DATA*, const(DEVPROPKEY)*, uint*, ubyte*, uint, uint*, uint);
BOOL SetupDiSetDevicePropertyW(HDEVINFO, SP_DEVINFO_DATA*, const(DEVPROPKEY)*, uint, const(ubyte)*, uint, uint);
BOOL SetupDiGetDeviceInterfacePropertyKeys(HDEVINFO, SP_DEVICE_INTERFACE_DATA*, DEVPROPKEY*, uint, uint*, uint);
BOOL SetupDiGetDeviceInterfacePropertyW(HDEVINFO, SP_DEVICE_INTERFACE_DATA*, const(DEVPROPKEY)*, uint*, ubyte*, uint, uint*, uint);
BOOL SetupDiSetDeviceInterfacePropertyW(HDEVINFO, SP_DEVICE_INTERFACE_DATA*, const(DEVPROPKEY)*, uint, const(ubyte)*, uint, uint);
BOOL SetupDiGetClassPropertyKeys(const(GUID)*, DEVPROPKEY*, uint, uint*, uint);
BOOL SetupDiGetClassPropertyKeysExW(const(GUID)*, DEVPROPKEY*, uint, uint*, uint, const(wchar)*, void*);
BOOL SetupDiGetClassPropertyW(const(GUID)*, const(DEVPROPKEY)*, uint*, ubyte*, uint, uint*, uint);
BOOL SetupDiGetClassPropertyExW(const(GUID)*, const(DEVPROPKEY)*, uint*, ubyte*, uint, uint*, uint, const(wchar)*, void*);
BOOL SetupDiSetClassPropertyW(const(GUID)*, const(DEVPROPKEY)*, uint, const(ubyte)*, uint, uint);
BOOL SetupDiSetClassPropertyExW(const(GUID)*, const(DEVPROPKEY)*, uint, const(ubyte)*, uint, uint, const(wchar)*, void*);
BOOL SetupDiGetDeviceRegistryPropertyA(HDEVINFO, SP_DEVINFO_DATA*, uint, uint*, ubyte*, uint, uint*);
BOOL SetupDiGetDeviceRegistryPropertyW(HDEVINFO, SP_DEVINFO_DATA*, uint, uint*, ubyte*, uint, uint*);
BOOL SetupDiGetClassRegistryPropertyA(const(GUID)*, uint, uint*, ubyte*, uint, uint*, const(char)*, void*);
BOOL SetupDiGetClassRegistryPropertyW(const(GUID)*, uint, uint*, ubyte*, uint, uint*, const(wchar)*, void*);
BOOL SetupDiSetDeviceRegistryPropertyA(HDEVINFO, SP_DEVINFO_DATA*, uint, const(ubyte)*, uint);
BOOL SetupDiSetDeviceRegistryPropertyW(HDEVINFO, SP_DEVINFO_DATA*, uint, const(ubyte)*, uint);
BOOL SetupDiSetClassRegistryPropertyA(const(GUID)*, uint, const(ubyte)*, uint, const(char)*, void*);
BOOL SetupDiSetClassRegistryPropertyW(const(GUID)*, uint, const(ubyte)*, uint, const(wchar)*, void*);
BOOL SetupDiGetDeviceInstallParamsA(HDEVINFO, SP_DEVINFO_DATA*, SP_DEVINSTALL_PARAMS_A*);
BOOL SetupDiGetDeviceInstallParamsW(HDEVINFO, SP_DEVINFO_DATA*, SP_DEVINSTALL_PARAMS_W*);
BOOL SetupDiGetClassInstallParamsA(HDEVINFO, SP_DEVINFO_DATA*, SP_CLASSINSTALL_HEADER*, uint, uint*);
BOOL SetupDiGetClassInstallParamsW(HDEVINFO, SP_DEVINFO_DATA*, SP_CLASSINSTALL_HEADER*, uint, uint*);
BOOL SetupDiSetDeviceInstallParamsA(HDEVINFO, SP_DEVINFO_DATA*, SP_DEVINSTALL_PARAMS_A*);
BOOL SetupDiSetDeviceInstallParamsW(HDEVINFO, SP_DEVINFO_DATA*, SP_DEVINSTALL_PARAMS_W*);
BOOL SetupDiSetClassInstallParamsA(HDEVINFO, SP_DEVINFO_DATA*, SP_CLASSINSTALL_HEADER*, uint);
BOOL SetupDiSetClassInstallParamsW(HDEVINFO, SP_DEVINFO_DATA*, SP_CLASSINSTALL_HEADER*, uint);
BOOL SetupDiGetDriverInstallParamsA(HDEVINFO, SP_DEVINFO_DATA*, SP_DRVINFO_DATA_V2_A*, SP_DRVINSTALL_PARAMS*);
BOOL SetupDiGetDriverInstallParamsW(HDEVINFO, SP_DEVINFO_DATA*, SP_DRVINFO_DATA_V2_W*, SP_DRVINSTALL_PARAMS*);
BOOL SetupDiSetDriverInstallParamsA(HDEVINFO, SP_DEVINFO_DATA*, SP_DRVINFO_DATA_V2_A*, SP_DRVINSTALL_PARAMS*);
BOOL SetupDiSetDriverInstallParamsW(HDEVINFO, SP_DEVINFO_DATA*, SP_DRVINFO_DATA_V2_W*, SP_DRVINSTALL_PARAMS*);
BOOL SetupDiLoadClassIcon(const(GUID)*, HICON*, int*);
BOOL SetupDiLoadDeviceIcon(HDEVINFO, SP_DEVINFO_DATA*, uint, uint, uint, HICON*);
int SetupDiDrawMiniIcon(HDC, RECT, int, uint);
BOOL SetupDiGetClassBitmapIndex(const(GUID)*, int*);
BOOL SetupDiGetClassImageList(SP_CLASSIMAGELIST_DATA*);
BOOL SetupDiGetClassImageListExA(SP_CLASSIMAGELIST_DATA*, const(char)*, void*);
BOOL SetupDiGetClassImageListExW(SP_CLASSIMAGELIST_DATA*, const(wchar)*, void*);
BOOL SetupDiGetClassImageIndex(SP_CLASSIMAGELIST_DATA*, const(GUID)*, int*);
BOOL SetupDiDestroyClassImageList(SP_CLASSIMAGELIST_DATA*);
BOOL SetupDiGetClassDevPropertySheetsA(HDEVINFO, SP_DEVINFO_DATA*, PROPSHEETHEADERA_V2*, uint, uint*, uint);
BOOL SetupDiGetClassDevPropertySheetsW(HDEVINFO, SP_DEVINFO_DATA*, PROPSHEETHEADERW_V2*, uint, uint*, uint);
BOOL SetupDiAskForOEMDisk(HDEVINFO, SP_DEVINFO_DATA*);
BOOL SetupDiSelectOEMDrv(HWND, HDEVINFO, SP_DEVINFO_DATA*);
BOOL SetupDiClassNameFromGuidA(const(GUID)*, PSTR, uint, uint*);
BOOL SetupDiClassNameFromGuidW(const(GUID)*, PWSTR, uint, uint*);
BOOL SetupDiClassNameFromGuidExA(const(GUID)*, PSTR, uint, uint*, const(char)*, void*);
BOOL SetupDiClassNameFromGuidExW(const(GUID)*, PWSTR, uint, uint*, const(wchar)*, void*);
BOOL SetupDiClassGuidsFromNameA(const(char)*, GUID*, uint, uint*);
BOOL SetupDiClassGuidsFromNameW(const(wchar)*, GUID*, uint, uint*);
BOOL SetupDiClassGuidsFromNameExA(const(char)*, GUID*, uint, uint*, const(char)*, void*);
BOOL SetupDiClassGuidsFromNameExW(const(wchar)*, GUID*, uint, uint*, const(wchar)*, void*);
BOOL SetupDiGetHwProfileFriendlyNameA(uint, PSTR, uint, uint*);
BOOL SetupDiGetHwProfileFriendlyNameW(uint, PWSTR, uint, uint*);
BOOL SetupDiGetHwProfileFriendlyNameExA(uint, PSTR, uint, uint*, const(char)*, void*);
BOOL SetupDiGetHwProfileFriendlyNameExW(uint, PWSTR, uint, uint*, const(wchar)*, void*);
HPROPSHEETPAGE SetupDiGetWizardPage(HDEVINFO, SP_DEVINFO_DATA*, SP_INSTALLWIZARD_DATA*, uint, uint);
BOOL SetupDiGetSelectedDevice(HDEVINFO, SP_DEVINFO_DATA*);
BOOL SetupDiSetSelectedDevice(HDEVINFO, SP_DEVINFO_DATA*);
BOOL SetupDiGetActualModelsSectionA(INFCONTEXT*, SP_ALTPLATFORM_INFO_V2*, PSTR, uint, uint*, void*);
BOOL SetupDiGetActualModelsSectionW(INFCONTEXT*, SP_ALTPLATFORM_INFO_V2*, PWSTR, uint, uint*, void*);
BOOL SetupDiGetActualSectionToInstallA(void*, const(char)*, PSTR, uint, uint*, PSTR*);
BOOL SetupDiGetActualSectionToInstallW(void*, const(wchar)*, PWSTR, uint, uint*, PWSTR*);
BOOL SetupDiGetActualSectionToInstallExA(void*, const(char)*, SP_ALTPLATFORM_INFO_V2*, PSTR, uint, uint*, PSTR*, void*);
BOOL SetupDiGetActualSectionToInstallExW(void*, const(wchar)*, SP_ALTPLATFORM_INFO_V2*, PWSTR, uint, uint*, PWSTR*, void*);
BOOL SetupEnumInfSectionsA(void*, uint, PSTR, uint, uint*);
BOOL SetupEnumInfSectionsW(void*, uint, PWSTR, uint, uint*);
BOOL SetupVerifyInfFileA(const(char)*, SP_ALTPLATFORM_INFO_V2*, SP_INF_SIGNER_INFO_V2_A*);
BOOL SetupVerifyInfFileW(const(wchar)*, SP_ALTPLATFORM_INFO_V2*, SP_INF_SIGNER_INFO_V2_W*);
BOOL SetupDiGetCustomDevicePropertyA(HDEVINFO, SP_DEVINFO_DATA*, const(char)*, uint, uint*, ubyte*, uint, uint*);
BOOL SetupDiGetCustomDevicePropertyW(HDEVINFO, SP_DEVINFO_DATA*, const(wchar)*, uint, uint*, ubyte*, uint, uint*);
BOOL SetupConfigureWmiFromInfSectionA(void*, const(char)*, uint);
BOOL SetupConfigureWmiFromInfSectionW(void*, const(wchar)*, uint);
CONFIGRET CM_Add_Empty_Log_Conf(ulong*, uint, PRIORITY, uint);
CONFIGRET CM_Add_Empty_Log_Conf_Ex(ulong*, uint, PRIORITY, uint, long);
CONFIGRET CM_Add_IDA(uint, PSTR, uint);
CONFIGRET CM_Add_IDW(uint, PWSTR, uint);
CONFIGRET CM_Add_ID_ExA(uint, PSTR, uint, long);
CONFIGRET CM_Add_ID_ExW(uint, PWSTR, uint, long);
CONFIGRET CM_Add_Range(ulong, ulong, ulong, uint);
CONFIGRET CM_Add_Res_Des(ulong*, ulong, uint, void*, uint, uint);
CONFIGRET CM_Add_Res_Des_Ex(ulong*, ulong, uint, void*, uint, uint, long);
CONFIGRET CM_Connect_MachineA(const(char)*, long*);
CONFIGRET CM_Connect_MachineW(const(wchar)*, long*);
CONFIGRET CM_Create_DevNodeA(uint*, byte*, uint, uint);
CONFIGRET CM_Create_DevNodeW(uint*, ushort*, uint, uint);
CONFIGRET CM_Create_DevNode_ExA(uint*, byte*, uint, uint, long);
CONFIGRET CM_Create_DevNode_ExW(uint*, ushort*, uint, uint, long);
CONFIGRET CM_Create_Range_List(ulong*, uint);
CONFIGRET CM_Delete_Class_Key(GUID*, uint);
CONFIGRET CM_Delete_Class_Key_Ex(GUID*, uint, long);
CONFIGRET CM_Delete_DevNode_Key(uint, uint, uint);
CONFIGRET CM_Delete_DevNode_Key_Ex(uint, uint, uint, long);
CONFIGRET CM_Delete_Range(ulong, ulong, ulong, uint);
CONFIGRET CM_Detect_Resource_Conflict(uint, uint, void*, uint, BOOL*, uint);
CONFIGRET CM_Detect_Resource_Conflict_Ex(uint, uint, void*, uint, BOOL*, uint, long);
CONFIGRET CM_Disable_DevNode(uint, uint);
CONFIGRET CM_Disable_DevNode_Ex(uint, uint, long);
CONFIGRET CM_Disconnect_Machine(long);
CONFIGRET CM_Dup_Range_List(ulong, ulong, uint);
CONFIGRET CM_Enable_DevNode(uint, uint);
CONFIGRET CM_Enable_DevNode_Ex(uint, uint, long);
CONFIGRET CM_Enumerate_Classes(uint, GUID*, uint);
CONFIGRET CM_Enumerate_Classes_Ex(uint, GUID*, uint, long);
CONFIGRET CM_Enumerate_EnumeratorsA(uint, PSTR, uint*, uint);
CONFIGRET CM_Enumerate_EnumeratorsW(uint, PWSTR, uint*, uint);
CONFIGRET CM_Enumerate_Enumerators_ExA(uint, PSTR, uint*, uint, long);
CONFIGRET CM_Enumerate_Enumerators_ExW(uint, PWSTR, uint*, uint, long);
CONFIGRET CM_Find_Range(ulong*, ulong, uint, ulong, ulong, ulong, uint);
CONFIGRET CM_First_Range(ulong, ulong*, ulong*, ulong*, uint);
CONFIGRET CM_Free_Log_Conf(ulong, uint);
CONFIGRET CM_Free_Log_Conf_Ex(ulong, uint, long);
CONFIGRET CM_Free_Log_Conf_Handle(ulong);
CONFIGRET CM_Free_Range_List(ulong, uint);
CONFIGRET CM_Free_Res_Des(ulong*, ulong, uint);
CONFIGRET CM_Free_Res_Des_Ex(ulong*, ulong, uint, long);
CONFIGRET CM_Free_Res_Des_Handle(ulong);
CONFIGRET CM_Get_Child(uint*, uint, uint);
CONFIGRET CM_Get_Child_Ex(uint*, uint, uint, long);
CONFIGRET CM_Get_Class_NameA(GUID*, PSTR, uint*, uint);
CONFIGRET CM_Get_Class_NameW(GUID*, PWSTR, uint*, uint);
CONFIGRET CM_Get_Class_Name_ExA(GUID*, PSTR, uint*, uint, long);
CONFIGRET CM_Get_Class_Name_ExW(GUID*, PWSTR, uint*, uint, long);
CONFIGRET CM_Get_Class_Key_NameA(GUID*, PSTR, uint*, uint);
CONFIGRET CM_Get_Class_Key_NameW(GUID*, PWSTR, uint*, uint);
CONFIGRET CM_Get_Class_Key_Name_ExA(GUID*, PSTR, uint*, uint, long);
CONFIGRET CM_Get_Class_Key_Name_ExW(GUID*, PWSTR, uint*, uint, long);
CONFIGRET CM_Get_Depth(uint*, uint, uint);
CONFIGRET CM_Get_Depth_Ex(uint*, uint, uint, long);
CONFIGRET CM_Get_Device_IDA(uint, PSTR, uint, uint);
CONFIGRET CM_Get_Device_IDW(uint, PWSTR, uint, uint);
CONFIGRET CM_Get_Device_ID_ExA(uint, PSTR, uint, uint, long);
CONFIGRET CM_Get_Device_ID_ExW(uint, PWSTR, uint, uint, long);
CONFIGRET CM_Get_Device_ID_ListA(const(char)*, PSTR, uint, uint);
CONFIGRET CM_Get_Device_ID_ListW(const(wchar)*, PWSTR, uint, uint);
CONFIGRET CM_Get_Device_ID_List_ExA(const(char)*, PSTR, uint, uint, long);
CONFIGRET CM_Get_Device_ID_List_ExW(const(wchar)*, PWSTR, uint, uint, long);
CONFIGRET CM_Get_Device_ID_List_SizeA(uint*, const(char)*, uint);
CONFIGRET CM_Get_Device_ID_List_SizeW(uint*, const(wchar)*, uint);
CONFIGRET CM_Get_Device_ID_List_Size_ExA(uint*, const(char)*, uint, long);
CONFIGRET CM_Get_Device_ID_List_Size_ExW(uint*, const(wchar)*, uint, long);
CONFIGRET CM_Get_Device_ID_Size(uint*, uint, uint);
CONFIGRET CM_Get_Device_ID_Size_Ex(uint*, uint, uint, long);
CONFIGRET CM_Get_DevNode_PropertyW(uint, const(DEVPROPKEY)*, uint*, ubyte*, uint*, uint);
CONFIGRET CM_Get_DevNode_Property_ExW(uint, const(DEVPROPKEY)*, uint*, ubyte*, uint*, uint, long);
CONFIGRET CM_Get_DevNode_Property_Keys(uint, DEVPROPKEY*, uint*, uint);
CONFIGRET CM_Get_DevNode_Property_Keys_Ex(uint, DEVPROPKEY*, uint*, uint, long);
CONFIGRET CM_Get_DevNode_Registry_PropertyA(uint, uint, uint*, void*, uint*, uint);
CONFIGRET CM_Get_DevNode_Registry_PropertyW(uint, uint, uint*, void*, uint*, uint);
CONFIGRET CM_Get_DevNode_Registry_Property_ExA(uint, uint, uint*, void*, uint*, uint, long);
CONFIGRET CM_Get_DevNode_Registry_Property_ExW(uint, uint, uint*, void*, uint*, uint, long);
CONFIGRET CM_Get_DevNode_Custom_PropertyA(uint, const(char)*, uint*, void*, uint*, uint);
CONFIGRET CM_Get_DevNode_Custom_PropertyW(uint, const(wchar)*, uint*, void*, uint*, uint);
CONFIGRET CM_Get_DevNode_Custom_Property_ExA(uint, const(char)*, uint*, void*, uint*, uint, long);
CONFIGRET CM_Get_DevNode_Custom_Property_ExW(uint, const(wchar)*, uint*, void*, uint*, uint, long);
CONFIGRET CM_Get_DevNode_Status(uint*, uint*, uint, uint);
CONFIGRET CM_Get_DevNode_Status_Ex(uint*, uint*, uint, uint, long);
CONFIGRET CM_Get_First_Log_Conf(ulong*, uint, uint);
CONFIGRET CM_Get_First_Log_Conf_Ex(ulong*, uint, uint, long);
CONFIGRET CM_Get_Global_State(uint*, uint);
CONFIGRET CM_Get_Global_State_Ex(uint*, uint, long);
CONFIGRET CM_Get_Hardware_Profile_InfoA(uint, HWProfileInfo_sA*, uint);
CONFIGRET CM_Get_Hardware_Profile_Info_ExA(uint, HWProfileInfo_sA*, uint, long);
CONFIGRET CM_Get_Hardware_Profile_InfoW(uint, HWProfileInfo_sW*, uint);
CONFIGRET CM_Get_Hardware_Profile_Info_ExW(uint, HWProfileInfo_sW*, uint, long);
CONFIGRET CM_Get_HW_Prof_FlagsA(byte*, uint, uint*, uint);
CONFIGRET CM_Get_HW_Prof_FlagsW(ushort*, uint, uint*, uint);
CONFIGRET CM_Get_HW_Prof_Flags_ExA(byte*, uint, uint*, uint, long);
CONFIGRET CM_Get_HW_Prof_Flags_ExW(ushort*, uint, uint*, uint, long);
CONFIGRET CM_Get_Device_Interface_AliasA(const(char)*, GUID*, PSTR, uint*, uint);
CONFIGRET CM_Get_Device_Interface_AliasW(const(wchar)*, GUID*, PWSTR, uint*, uint);
CONFIGRET CM_Get_Device_Interface_Alias_ExA(const(char)*, GUID*, PSTR, uint*, uint, long);
CONFIGRET CM_Get_Device_Interface_Alias_ExW(const(wchar)*, GUID*, PWSTR, uint*, uint, long);
CONFIGRET CM_Get_Device_Interface_ListA(GUID*, byte*, PSTR, uint, uint);
CONFIGRET CM_Get_Device_Interface_ListW(GUID*, ushort*, PWSTR, uint, uint);
CONFIGRET CM_Get_Device_Interface_List_ExA(GUID*, byte*, PSTR, uint, uint, long);
CONFIGRET CM_Get_Device_Interface_List_ExW(GUID*, ushort*, PWSTR, uint, uint, long);
CONFIGRET CM_Get_Device_Interface_List_SizeA(uint*, GUID*, byte*, uint);
CONFIGRET CM_Get_Device_Interface_List_SizeW(uint*, GUID*, ushort*, uint);
CONFIGRET CM_Get_Device_Interface_List_Size_ExA(uint*, GUID*, byte*, uint, long);
CONFIGRET CM_Get_Device_Interface_List_Size_ExW(uint*, GUID*, ushort*, uint, long);
CONFIGRET CM_Get_Device_Interface_PropertyW(const(wchar)*, const(DEVPROPKEY)*, uint*, ubyte*, uint*, uint);
CONFIGRET CM_Get_Device_Interface_Property_ExW(const(wchar)*, const(DEVPROPKEY)*, uint*, ubyte*, uint*, uint, long);
CONFIGRET CM_Get_Device_Interface_Property_KeysW(const(wchar)*, DEVPROPKEY*, uint*, uint);
CONFIGRET CM_Get_Device_Interface_Property_Keys_ExW(const(wchar)*, DEVPROPKEY*, uint*, uint, long);
CONFIGRET CM_Get_Log_Conf_Priority(ulong, uint*, uint);
CONFIGRET CM_Get_Log_Conf_Priority_Ex(ulong, uint*, uint, long);
CONFIGRET CM_Get_Next_Log_Conf(ulong*, ulong, uint);
CONFIGRET CM_Get_Next_Log_Conf_Ex(ulong*, ulong, uint, long);
CONFIGRET CM_Get_Parent(uint*, uint, uint);
CONFIGRET CM_Get_Parent_Ex(uint*, uint, uint, long);
CONFIGRET CM_Get_Res_Des_Data(ulong, void*, uint, uint);
CONFIGRET CM_Get_Res_Des_Data_Ex(ulong, void*, uint, uint, long);
CONFIGRET CM_Get_Res_Des_Data_Size(uint*, ulong, uint);
CONFIGRET CM_Get_Res_Des_Data_Size_Ex(uint*, ulong, uint, long);
CONFIGRET CM_Get_Sibling(uint*, uint, uint);
CONFIGRET CM_Get_Sibling_Ex(uint*, uint, uint, long);
ushort CM_Get_Version();
ushort CM_Get_Version_Ex(long);
BOOL CM_Is_Version_Available(ushort);
BOOL CM_Is_Version_Available_Ex(ushort, long);
CONFIGRET CM_Intersect_Range_List(ulong, ulong, ulong, uint);
CONFIGRET CM_Invert_Range_List(ulong, ulong, ulong, uint);
CONFIGRET CM_Locate_DevNodeA(uint*, byte*, uint);
CONFIGRET CM_Locate_DevNodeW(uint*, ushort*, uint);
CONFIGRET CM_Locate_DevNode_ExA(uint*, byte*, uint, long);
CONFIGRET CM_Locate_DevNode_ExW(uint*, ushort*, uint, long);
CONFIGRET CM_Merge_Range_List(ulong, ulong, ulong, uint);
CONFIGRET CM_Modify_Res_Des(ulong*, ulong, uint, void*, uint, uint);
CONFIGRET CM_Modify_Res_Des_Ex(ulong*, ulong, uint, void*, uint, uint, long);
CONFIGRET CM_Move_DevNode(uint, uint, uint);
CONFIGRET CM_Move_DevNode_Ex(uint, uint, uint, long);
CONFIGRET CM_Next_Range(ulong*, ulong*, ulong*, uint);
CONFIGRET CM_Get_Next_Res_Des(ulong*, ulong, uint, uint*, uint);
CONFIGRET CM_Get_Next_Res_Des_Ex(ulong*, ulong, uint, uint*, uint, long);
CONFIGRET CM_Open_Class_KeyA(GUID*, const(char)*, uint, uint, HKEY*, uint);
CONFIGRET CM_Open_Class_KeyW(GUID*, const(wchar)*, uint, uint, HKEY*, uint);
CONFIGRET CM_Open_Class_Key_ExA(GUID*, const(char)*, uint, uint, HKEY*, uint, long);
CONFIGRET CM_Open_Class_Key_ExW(GUID*, const(wchar)*, uint, uint, HKEY*, uint, long);
CONFIGRET CM_Open_DevNode_Key(uint, uint, uint, uint, HKEY*, uint);
CONFIGRET CM_Open_DevNode_Key_Ex(uint, uint, uint, uint, HKEY*, uint, long);
CONFIGRET CM_Open_Device_Interface_KeyA(const(char)*, uint, uint, HKEY*, uint);
CONFIGRET CM_Open_Device_Interface_KeyW(const(wchar)*, uint, uint, HKEY*, uint);
CONFIGRET CM_Open_Device_Interface_Key_ExA(const(char)*, uint, uint, HKEY*, uint, long);
CONFIGRET CM_Open_Device_Interface_Key_ExW(const(wchar)*, uint, uint, HKEY*, uint, long);
CONFIGRET CM_Delete_Device_Interface_KeyA(const(char)*, uint);
CONFIGRET CM_Delete_Device_Interface_KeyW(const(wchar)*, uint);
CONFIGRET CM_Delete_Device_Interface_Key_ExA(const(char)*, uint, long);
CONFIGRET CM_Delete_Device_Interface_Key_ExW(const(wchar)*, uint, long);
CONFIGRET CM_Query_Arbitrator_Free_Data(void*, uint, uint, uint, uint);
CONFIGRET CM_Query_Arbitrator_Free_Data_Ex(void*, uint, uint, uint, uint, long);
CONFIGRET CM_Query_Arbitrator_Free_Size(uint*, uint, uint, uint);
CONFIGRET CM_Query_Arbitrator_Free_Size_Ex(uint*, uint, uint, uint, long);
CONFIGRET CM_Query_Remove_SubTree(uint, uint);
CONFIGRET CM_Query_Remove_SubTree_Ex(uint, uint, long);
CONFIGRET CM_Query_And_Remove_SubTreeA(uint, PNP_VETO_TYPE*, PSTR, uint, uint);
CONFIGRET CM_Query_And_Remove_SubTreeW(uint, PNP_VETO_TYPE*, PWSTR, uint, uint);
CONFIGRET CM_Query_And_Remove_SubTree_ExA(uint, PNP_VETO_TYPE*, PSTR, uint, uint, long);
CONFIGRET CM_Query_And_Remove_SubTree_ExW(uint, PNP_VETO_TYPE*, PWSTR, uint, uint, long);
CONFIGRET CM_Request_Device_EjectA(uint, PNP_VETO_TYPE*, PSTR, uint, uint);
CONFIGRET CM_Request_Device_Eject_ExA(uint, PNP_VETO_TYPE*, PSTR, uint, uint, long);
CONFIGRET CM_Request_Device_EjectW(uint, PNP_VETO_TYPE*, PWSTR, uint, uint);
CONFIGRET CM_Request_Device_Eject_ExW(uint, PNP_VETO_TYPE*, PWSTR, uint, uint, long);
CONFIGRET CM_Reenumerate_DevNode(uint, uint);
CONFIGRET CM_Reenumerate_DevNode_Ex(uint, uint, long);
CONFIGRET CM_Register_Device_InterfaceA(uint, GUID*, const(char)*, PSTR, uint*, uint);
CONFIGRET CM_Register_Device_InterfaceW(uint, GUID*, const(wchar)*, PWSTR, uint*, uint);
CONFIGRET CM_Register_Device_Interface_ExA(uint, GUID*, const(char)*, PSTR, uint*, uint, long);
CONFIGRET CM_Register_Device_Interface_ExW(uint, GUID*, const(wchar)*, PWSTR, uint*, uint, long);
CONFIGRET CM_Set_DevNode_Problem_Ex(uint, uint, uint, long);
CONFIGRET CM_Set_DevNode_Problem(uint, uint, uint);
CONFIGRET CM_Unregister_Device_InterfaceA(const(char)*, uint);
CONFIGRET CM_Unregister_Device_InterfaceW(const(wchar)*, uint);
CONFIGRET CM_Unregister_Device_Interface_ExA(const(char)*, uint, long);
CONFIGRET CM_Unregister_Device_Interface_ExW(const(wchar)*, uint, long);
CONFIGRET CM_Register_Device_Driver(uint, uint);
CONFIGRET CM_Register_Device_Driver_Ex(uint, uint, long);
CONFIGRET CM_Remove_SubTree(uint, uint);
CONFIGRET CM_Remove_SubTree_Ex(uint, uint, long);
CONFIGRET CM_Set_DevNode_PropertyW(uint, const(DEVPROPKEY)*, uint, const(ubyte)*, uint, uint);
CONFIGRET CM_Set_DevNode_Property_ExW(uint, const(DEVPROPKEY)*, uint, const(ubyte)*, uint, uint, long);
CONFIGRET CM_Set_DevNode_Registry_PropertyA(uint, uint, void*, uint, uint);
CONFIGRET CM_Set_DevNode_Registry_PropertyW(uint, uint, void*, uint, uint);
CONFIGRET CM_Set_DevNode_Registry_Property_ExA(uint, uint, void*, uint, uint, long);
CONFIGRET CM_Set_DevNode_Registry_Property_ExW(uint, uint, void*, uint, uint, long);
CONFIGRET CM_Set_Device_Interface_PropertyW(const(wchar)*, const(DEVPROPKEY)*, uint, const(ubyte)*, uint, uint);
CONFIGRET CM_Set_Device_Interface_Property_ExW(const(wchar)*, const(DEVPROPKEY)*, uint, const(ubyte)*, uint, uint, long);
CONFIGRET CM_Is_Dock_Station_Present(BOOL*);
CONFIGRET CM_Is_Dock_Station_Present_Ex(BOOL*, long);
CONFIGRET CM_Request_Eject_PC();
CONFIGRET CM_Request_Eject_PC_Ex(long);
CONFIGRET CM_Set_HW_Prof_FlagsA(byte*, uint, uint, uint);
CONFIGRET CM_Set_HW_Prof_FlagsW(ushort*, uint, uint, uint);
CONFIGRET CM_Set_HW_Prof_Flags_ExA(byte*, uint, uint, uint, long);
CONFIGRET CM_Set_HW_Prof_Flags_ExW(ushort*, uint, uint, uint, long);
CONFIGRET CM_Setup_DevNode(uint, uint);
CONFIGRET CM_Setup_DevNode_Ex(uint, uint, long);
CONFIGRET CM_Test_Range_Available(ulong, ulong, ulong, uint);
CONFIGRET CM_Uninstall_DevNode(uint, uint);
CONFIGRET CM_Uninstall_DevNode_Ex(uint, uint, long);
CONFIGRET CM_Run_Detection(uint);
CONFIGRET CM_Run_Detection_Ex(uint, long);
CONFIGRET CM_Set_HW_Prof(uint, uint);
CONFIGRET CM_Set_HW_Prof_Ex(uint, uint, long);
CONFIGRET CM_Query_Resource_Conflict_List(ulong*, uint, uint, void*, uint, uint, long);
CONFIGRET CM_Free_Resource_Conflict_Handle(ulong);
CONFIGRET CM_Get_Resource_Conflict_Count(ulong, uint*);
CONFIGRET CM_Get_Resource_Conflict_DetailsA(ulong, uint, CONFLICT_DETAILS_A*);
CONFIGRET CM_Get_Resource_Conflict_DetailsW(ulong, uint, CONFLICT_DETAILS_W*);
CONFIGRET CM_Get_Class_PropertyW(const(GUID)*, const(DEVPROPKEY)*, uint*, ubyte*, uint*, uint);
CONFIGRET CM_Get_Class_Property_ExW(const(GUID)*, const(DEVPROPKEY)*, uint*, ubyte*, uint*, uint, long);
CONFIGRET CM_Get_Class_Property_Keys(const(GUID)*, DEVPROPKEY*, uint*, uint);
CONFIGRET CM_Get_Class_Property_Keys_Ex(const(GUID)*, DEVPROPKEY*, uint*, uint, long);
CONFIGRET CM_Set_Class_PropertyW(const(GUID)*, const(DEVPROPKEY)*, uint, const(ubyte)*, uint, uint);
CONFIGRET CM_Set_Class_Property_ExW(const(GUID)*, const(DEVPROPKEY)*, uint, const(ubyte)*, uint, uint, long);
CONFIGRET CM_Get_Class_Registry_PropertyA(GUID*, uint, uint*, void*, uint*, uint, long);
CONFIGRET CM_Get_Class_Registry_PropertyW(GUID*, uint, uint*, void*, uint*, uint, long);
CONFIGRET CM_Set_Class_Registry_PropertyA(GUID*, uint, void*, uint, uint, long);
CONFIGRET CM_Set_Class_Registry_PropertyW(GUID*, uint, void*, uint, uint, long);
uint CMP_WaitNoPendingInstallEvents(uint);
CONFIGRET CM_Register_Notification(CM_NOTIFY_FILTER*, void*, PCM_NOTIFY_CALLBACK, long*);
CONFIGRET CM_Unregister_Notification(HCMNOTIFICATION);
uint CM_MapCrToWin32Err(CONFIGRET, uint);
BOOL UpdateDriverForPlugAndPlayDevicesA(HWND, const(char)*, const(char)*, uint, BOOL*);
BOOL UpdateDriverForPlugAndPlayDevicesW(HWND, const(wchar)*, const(wchar)*, uint, BOOL*);
BOOL DiInstallDevice(HWND, HDEVINFO, SP_DEVINFO_DATA*, SP_DRVINFO_DATA_V2_A*, uint, BOOL*);
BOOL DiInstallDriverW(HWND, const(wchar)*, uint, BOOL*);
BOOL DiInstallDriverA(HWND, const(char)*, uint, BOOL*);
BOOL DiUninstallDevice(HWND, HDEVINFO, SP_DEVINFO_DATA*, uint, BOOL*);
BOOL DiUninstallDriverW(HWND, const(wchar)*, uint, BOOL*);
BOOL DiUninstallDriverA(HWND, const(char)*, uint, BOOL*);
BOOL DiShowUpdateDevice(HWND, HDEVINFO, SP_DEVINFO_DATA*, uint, BOOL*);
BOOL DiRollbackDriver(HDEVINFO, SP_DEVINFO_DATA*, HWND, uint, BOOL*);
BOOL DiShowUpdateDriver(HWND, const(wchar)*, uint, BOOL*);
enum CM_PROB_NOT_CONFIGURED = 0x00000001;
enum CM_PROB_DEVLOADER_FAILED = 0x00000002;
enum CM_PROB_OUT_OF_MEMORY = 0x00000003;
enum CM_PROB_ENTRY_IS_WRONG_TYPE = 0x00000004;
enum CM_PROB_LACKED_ARBITRATOR = 0x00000005;
enum CM_PROB_BOOT_CONFIG_CONFLICT = 0x00000006;
enum CM_PROB_FAILED_FILTER = 0x00000007;
enum CM_PROB_DEVLOADER_NOT_FOUND = 0x00000008;
enum CM_PROB_INVALID_DATA = 0x00000009;
enum CM_PROB_FAILED_START = 0x0000000a;
enum CM_PROB_LIAR = 0x0000000b;
enum CM_PROB_NORMAL_CONFLICT = 0x0000000c;
enum CM_PROB_NOT_VERIFIED = 0x0000000d;
enum CM_PROB_NEED_RESTART = 0x0000000e;
enum CM_PROB_REENUMERATION = 0x0000000f;
enum CM_PROB_PARTIAL_LOG_CONF = 0x00000010;
enum CM_PROB_UNKNOWN_RESOURCE = 0x00000011;
enum CM_PROB_REINSTALL = 0x00000012;
enum CM_PROB_REGISTRY = 0x00000013;
enum CM_PROB_VXDLDR = 0x00000014;
enum CM_PROB_WILL_BE_REMOVED = 0x00000015;
enum CM_PROB_DISABLED = 0x00000016;
enum CM_PROB_DEVLOADER_NOT_READY = 0x00000017;
enum CM_PROB_DEVICE_NOT_THERE = 0x00000018;
enum CM_PROB_MOVED = 0x00000019;
enum CM_PROB_TOO_EARLY = 0x0000001a;
enum CM_PROB_NO_VALID_LOG_CONF = 0x0000001b;
enum CM_PROB_FAILED_INSTALL = 0x0000001c;
enum CM_PROB_HARDWARE_DISABLED = 0x0000001d;
enum CM_PROB_CANT_SHARE_IRQ = 0x0000001e;
enum CM_PROB_FAILED_ADD = 0x0000001f;
enum CM_PROB_DISABLED_SERVICE = 0x00000020;
enum CM_PROB_TRANSLATION_FAILED = 0x00000021;
enum CM_PROB_NO_SOFTCONFIG = 0x00000022;
enum CM_PROB_BIOS_TABLE = 0x00000023;
enum CM_PROB_IRQ_TRANSLATION_FAILED = 0x00000024;
enum CM_PROB_FAILED_DRIVER_ENTRY = 0x00000025;
enum CM_PROB_DRIVER_FAILED_PRIOR_UNLOAD = 0x00000026;
enum CM_PROB_DRIVER_FAILED_LOAD = 0x00000027;
enum CM_PROB_DRIVER_SERVICE_KEY_INVALID = 0x00000028;
enum CM_PROB_LEGACY_SERVICE_NO_DEVICES = 0x00000029;
enum CM_PROB_DUPLICATE_DEVICE = 0x0000002a;
enum CM_PROB_FAILED_POST_START = 0x0000002b;
enum CM_PROB_HALTED = 0x0000002c;
enum CM_PROB_PHANTOM = 0x0000002d;
enum CM_PROB_SYSTEM_SHUTDOWN = 0x0000002e;
enum CM_PROB_HELD_FOR_EJECT = 0x0000002f;
enum CM_PROB_DRIVER_BLOCKED = 0x00000030;
enum CM_PROB_REGISTRY_TOO_LARGE = 0x00000031;
enum CM_PROB_SETPROPERTIES_FAILED = 0x00000032;
enum CM_PROB_WAITING_ON_DEPENDENCY = 0x00000033;
enum CM_PROB_UNSIGNED_DRIVER = 0x00000034;
enum CM_PROB_USED_BY_DEBUGGER = 0x00000035;
enum CM_PROB_DEVICE_RESET = 0x00000036;
enum CM_PROB_CONSOLE_LOCKED = 0x00000037;
enum CM_PROB_NEED_CLASS_CONFIG = 0x00000038;
enum CM_PROB_GUEST_ASSIGNMENT_FAILED = 0x00000039;
enum NUM_CM_PROB_V1 = 0x00000025;
enum NUM_CM_PROB_V2 = 0x00000032;
enum NUM_CM_PROB_V3 = 0x00000033;
enum NUM_CM_PROB_V4 = 0x00000034;
enum NUM_CM_PROB_V5 = 0x00000035;
enum NUM_CM_PROB_V6 = 0x00000036;
enum NUM_CM_PROB_V7 = 0x00000037;
enum NUM_CM_PROB_V8 = 0x00000039;
enum NUM_CM_PROB_V9 = 0x0000003a;
enum NUM_CM_PROB = 0x0000003a;
enum DN_ROOT_ENUMERATED = 0x00000001;
enum DN_DRIVER_LOADED = 0x00000002;
enum DN_ENUM_LOADED = 0x00000004;
enum DN_STARTED = 0x00000008;
enum DN_MANUAL = 0x00000010;
enum DN_NEED_TO_ENUM = 0x00000020;
enum DN_NOT_FIRST_TIME = 0x00000040;
enum DN_HARDWARE_ENUM = 0x00000080;
enum DN_LIAR = 0x00000100;
enum DN_HAS_MARK = 0x00000200;
enum DN_HAS_PROBLEM = 0x00000400;
enum DN_FILTERED = 0x00000800;
enum DN_MOVED = 0x00001000;
enum DN_DISABLEABLE = 0x00002000;
enum DN_REMOVABLE = 0x00004000;
enum DN_PRIVATE_PROBLEM = 0x00008000;
enum DN_MF_PARENT = 0x00010000;
enum DN_MF_CHILD = 0x00020000;
enum DN_WILL_BE_REMOVED = 0x00040000;
enum DN_NOT_FIRST_TIMEE = 0x00080000;
enum DN_STOP_FREE_RES = 0x00100000;
enum DN_REBAL_CANDIDATE = 0x00200000;
enum DN_BAD_PARTIAL = 0x00400000;
enum DN_NT_ENUMERATOR = 0x00800000;
enum DN_NT_DRIVER = 0x01000000;
enum DN_NEEDS_LOCKING = 0x02000000;
enum DN_ARM_WAKEUP = 0x04000000;
enum DN_APM_ENUMERATOR = 0x08000000;
enum DN_APM_DRIVER = 0x10000000;
enum DN_SILENT_INSTALL = 0x20000000;
enum DN_NO_SHOW_IN_DM = 0x40000000;
enum DN_BOOT_LOG_PROB = 0x80000000;
enum DN_NEED_RESTART = 0x00000100;
enum DN_DRIVER_BLOCKED = 0x00000040;
enum DN_LEGACY_DRIVER = 0x00001000;
enum DN_CHILD_WITH_INVALID_ID = 0x00000200;
enum DN_DEVICE_DISCONNECTED = 0x02000000;
enum DN_QUERY_REMOVE_PENDING = 0x00010000;
enum DN_QUERY_REMOVE_ACTIVE = 0x00020000;
enum LCPRI_FORCECONFIG = 0x00000000;
enum LCPRI_BOOTCONFIG = 0x00000001;
enum LCPRI_DESIRED = 0x00002000;
enum LCPRI_NORMAL = 0x00003000;
enum LCPRI_LASTBESTCONFIG = 0x00003fff;
enum LCPRI_SUBOPTIMAL = 0x00005000;
enum LCPRI_LASTSOFTCONFIG = 0x00007fff;
enum LCPRI_RESTART = 0x00008000;
enum LCPRI_REBOOT = 0x00009000;
enum LCPRI_POWEROFF = 0x0000a000;
enum LCPRI_HARDRECONFIG = 0x0000c000;
enum LCPRI_HARDWIRED = 0x0000e000;
enum LCPRI_IMPOSSIBLE = 0x0000f000;
enum LCPRI_DISABLED = 0x0000ffff;
enum MAX_LCPRI = 0x0000ffff;
enum CM_DEVICE_PANEL_SIDE_UNKNOWN = 0x00000000;
enum CM_DEVICE_PANEL_SIDE_TOP = 0x00000001;
enum CM_DEVICE_PANEL_SIDE_BOTTOM = 0x00000002;
enum CM_DEVICE_PANEL_SIDE_LEFT = 0x00000003;
enum CM_DEVICE_PANEL_SIDE_RIGHT = 0x00000004;
enum CM_DEVICE_PANEL_SIDE_FRONT = 0x00000005;
enum CM_DEVICE_PANEL_SIDE_BACK = 0x00000006;
enum CM_DEVICE_PANEL_EDGE_UNKNOWN = 0x00000000;
enum CM_DEVICE_PANEL_EDGE_TOP = 0x00000001;
enum CM_DEVICE_PANEL_EDGE_BOTTOM = 0x00000002;
enum CM_DEVICE_PANEL_EDGE_LEFT = 0x00000003;
enum CM_DEVICE_PANEL_EDGE_RIGHT = 0x00000004;
enum CM_DEVICE_PANEL_SHAPE_UNKNOWN = 0x00000000;
enum CM_DEVICE_PANEL_SHAPE_RECTANGLE = 0x00000001;
enum CM_DEVICE_PANEL_SHAPE_OVAL = 0x00000002;
enum CM_DEVICE_PANEL_ORIENTATION_HORIZONTAL = 0x00000000;
enum CM_DEVICE_PANEL_ORIENTATION_VERTICAL = 0x00000001;
enum CM_DEVICE_PANEL_JOINT_TYPE_UNKNOWN = 0x00000000;
enum CM_DEVICE_PANEL_JOINT_TYPE_PLANAR = 0x00000001;
enum CM_DEVICE_PANEL_JOINT_TYPE_HINGE = 0x00000002;
enum CM_DEVICE_PANEL_JOINT_TYPE_PIVOT = 0x00000003;
enum CM_DEVICE_PANEL_JOINT_TYPE_SWIVEL = 0x00000004;
enum GUID_DEVCLASS_1394 = GUID(0x6bdd1fc1, 0x810f, 0x11d0, [0xbe, 0xc7, 0x8, 0x0, 0x2b, 0xe2, 0x9, 0x2f]);
enum GUID_DEVCLASS_1394DEBUG = GUID(0x66f250d6, 0x7801, 0x4a64, [0xb1, 0x39, 0xee, 0xa8, 0xa, 0x45, 0xb, 0x24]);
enum GUID_DEVCLASS_61883 = GUID(0x7ebefbc0, 0x3200, 0x11d2, [0xb4, 0xc2, 0x0, 0xa0, 0xc9, 0x69, 0x7d, 0x7]);
enum GUID_DEVCLASS_ADAPTER = GUID(0x4d36e964, 0xe325, 0x11ce, [0xbf, 0xc1, 0x8, 0x0, 0x2b, 0xe1, 0x3, 0x18]);
enum GUID_DEVCLASS_APMSUPPORT = GUID(0xd45b1c18, 0xc8fa, 0x11d1, [0x9f, 0x77, 0x0, 0x0, 0xf8, 0x5, 0xf5, 0x30]);
enum GUID_DEVCLASS_AVC = GUID(0xc06ff265, 0xae09, 0x48f0, [0x81, 0x2c, 0x16, 0x75, 0x3d, 0x7c, 0xba, 0x83]);
enum GUID_DEVCLASS_BATTERY = GUID(0x72631e54, 0x78a4, 0x11d0, [0xbc, 0xf7, 0x0, 0xaa, 0x0, 0xb7, 0xb3, 0x2a]);
enum GUID_DEVCLASS_BIOMETRIC = GUID(0x53d29ef7, 0x377c, 0x4d14, [0x86, 0x4b, 0xeb, 0x3a, 0x85, 0x76, 0x93, 0x59]);
enum GUID_DEVCLASS_BLUETOOTH = GUID(0xe0cbf06c, 0xcd8b, 0x4647, [0xbb, 0x8a, 0x26, 0x3b, 0x43, 0xf0, 0xf9, 0x74]);
enum GUID_DEVCLASS_CAMERA = GUID(0xca3e7ab9, 0xb4c3, 0x4ae6, [0x82, 0x51, 0x57, 0x9e, 0xf9, 0x33, 0x89, 0xf]);
enum GUID_DEVCLASS_CDROM = GUID(0x4d36e965, 0xe325, 0x11ce, [0xbf, 0xc1, 0x8, 0x0, 0x2b, 0xe1, 0x3, 0x18]);
enum GUID_DEVCLASS_COMPUTEACCELERATOR = GUID(0xf01a9d53, 0x3ff6, 0x48d2, [0x9f, 0x97, 0xc8, 0xa7, 0x0, 0x4b, 0xe1, 0xc]);
enum GUID_DEVCLASS_COMPUTER = GUID(0x4d36e966, 0xe325, 0x11ce, [0xbf, 0xc1, 0x8, 0x0, 0x2b, 0xe1, 0x3, 0x18]);
enum GUID_DEVCLASS_DECODER = GUID(0x6bdd1fc2, 0x810f, 0x11d0, [0xbe, 0xc7, 0x8, 0x0, 0x2b, 0xe2, 0x9, 0x2f]);
enum GUID_DEVCLASS_DISKDRIVE = GUID(0x4d36e967, 0xe325, 0x11ce, [0xbf, 0xc1, 0x8, 0x0, 0x2b, 0xe1, 0x3, 0x18]);
enum GUID_DEVCLASS_DISPLAY = GUID(0x4d36e968, 0xe325, 0x11ce, [0xbf, 0xc1, 0x8, 0x0, 0x2b, 0xe1, 0x3, 0x18]);
enum GUID_DEVCLASS_DOT4 = GUID(0x48721b56, 0x6795, 0x11d2, [0xb1, 0xa8, 0x0, 0x80, 0xc7, 0x2e, 0x74, 0xa2]);
enum GUID_DEVCLASS_DOT4PRINT = GUID(0x49ce6ac8, 0x6f86, 0x11d2, [0xb1, 0xe5, 0x0, 0x80, 0xc7, 0x2e, 0x74, 0xa2]);
enum GUID_DEVCLASS_EHSTORAGESILO = GUID(0x9da2b80f, 0xf89f, 0x4a49, [0xa5, 0xc2, 0x51, 0x1b, 0x8, 0x5b, 0x9e, 0x8a]);
enum GUID_DEVCLASS_ENUM1394 = GUID(0xc459df55, 0xdb08, 0x11d1, [0xb0, 0x9, 0x0, 0xa0, 0xc9, 0x8, 0x1f, 0xf6]);
enum GUID_DEVCLASS_EXTENSION = GUID(0xe2f84ce7, 0x8efa, 0x411c, [0xaa, 0x69, 0x97, 0x45, 0x4c, 0xa4, 0xcb, 0x57]);
enum GUID_DEVCLASS_FDC = GUID(0x4d36e969, 0xe325, 0x11ce, [0xbf, 0xc1, 0x8, 0x0, 0x2b, 0xe1, 0x3, 0x18]);
enum GUID_DEVCLASS_FIRMWARE = GUID(0xf2e7dd72, 0x6468, 0x4e36, [0xb6, 0xf1, 0x64, 0x88, 0xf4, 0x2c, 0x1b, 0x52]);
enum GUID_DEVCLASS_FLOPPYDISK = GUID(0x4d36e980, 0xe325, 0x11ce, [0xbf, 0xc1, 0x8, 0x0, 0x2b, 0xe1, 0x3, 0x18]);
enum GUID_DEVCLASS_GPS = GUID(0x6bdd1fc3, 0x810f, 0x11d0, [0xbe, 0xc7, 0x8, 0x0, 0x2b, 0xe2, 0x9, 0x2f]);
enum GUID_DEVCLASS_HDC = GUID(0x4d36e96a, 0xe325, 0x11ce, [0xbf, 0xc1, 0x8, 0x0, 0x2b, 0xe1, 0x3, 0x18]);
enum GUID_DEVCLASS_HIDCLASS = GUID(0x745a17a0, 0x74d3, 0x11d0, [0xb6, 0xfe, 0x0, 0xa0, 0xc9, 0xf, 0x57, 0xda]);
enum GUID_DEVCLASS_HOLOGRAPHIC = GUID(0xd612553d, 0x6b1, 0x49ca, [0x89, 0x38, 0xe3, 0x9e, 0xf8, 0xe, 0xb1, 0x6f]);
enum GUID_DEVCLASS_IMAGE = GUID(0x6bdd1fc6, 0x810f, 0x11d0, [0xbe, 0xc7, 0x8, 0x0, 0x2b, 0xe2, 0x9, 0x2f]);
enum GUID_DEVCLASS_INFINIBAND = GUID(0x30ef7132, 0xd858, 0x4a0c, [0xac, 0x24, 0xb9, 0x2, 0x8a, 0x5c, 0xca, 0x3f]);
enum GUID_DEVCLASS_INFRARED = GUID(0x6bdd1fc5, 0x810f, 0x11d0, [0xbe, 0xc7, 0x8, 0x0, 0x2b, 0xe2, 0x9, 0x2f]);
enum GUID_DEVCLASS_KEYBOARD = GUID(0x4d36e96b, 0xe325, 0x11ce, [0xbf, 0xc1, 0x8, 0x0, 0x2b, 0xe1, 0x3, 0x18]);
enum GUID_DEVCLASS_LEGACYDRIVER = GUID(0x8ecc055d, 0x47f, 0x11d1, [0xa5, 0x37, 0x0, 0x0, 0xf8, 0x75, 0x3e, 0xd1]);
enum GUID_DEVCLASS_MEDIA = GUID(0x4d36e96c, 0xe325, 0x11ce, [0xbf, 0xc1, 0x8, 0x0, 0x2b, 0xe1, 0x3, 0x18]);
enum GUID_DEVCLASS_MEDIUM_CHANGER = GUID(0xce5939ae, 0xebde, 0x11d0, [0xb1, 0x81, 0x0, 0x0, 0xf8, 0x75, 0x3e, 0xc4]);
enum GUID_DEVCLASS_MEMORY = GUID(0x5099944a, 0xf6b9, 0x4057, [0xa0, 0x56, 0x8c, 0x55, 0x2, 0x28, 0x54, 0x4c]);
enum GUID_DEVCLASS_MODEM = GUID(0x4d36e96d, 0xe325, 0x11ce, [0xbf, 0xc1, 0x8, 0x0, 0x2b, 0xe1, 0x3, 0x18]);
enum GUID_DEVCLASS_MONITOR = GUID(0x4d36e96e, 0xe325, 0x11ce, [0xbf, 0xc1, 0x8, 0x0, 0x2b, 0xe1, 0x3, 0x18]);
enum GUID_DEVCLASS_MOUSE = GUID(0x4d36e96f, 0xe325, 0x11ce, [0xbf, 0xc1, 0x8, 0x0, 0x2b, 0xe1, 0x3, 0x18]);
enum GUID_DEVCLASS_MTD = GUID(0x4d36e970, 0xe325, 0x11ce, [0xbf, 0xc1, 0x8, 0x0, 0x2b, 0xe1, 0x3, 0x18]);
enum GUID_DEVCLASS_MULTIFUNCTION = GUID(0x4d36e971, 0xe325, 0x11ce, [0xbf, 0xc1, 0x8, 0x0, 0x2b, 0xe1, 0x3, 0x18]);
enum GUID_DEVCLASS_MULTIPORTSERIAL = GUID(0x50906cb8, 0xba12, 0x11d1, [0xbf, 0x5d, 0x0, 0x0, 0xf8, 0x5, 0xf5, 0x30]);
enum GUID_DEVCLASS_NET = GUID(0x4d36e972, 0xe325, 0x11ce, [0xbf, 0xc1, 0x8, 0x0, 0x2b, 0xe1, 0x3, 0x18]);
enum GUID_DEVCLASS_NETCLIENT = GUID(0x4d36e973, 0xe325, 0x11ce, [0xbf, 0xc1, 0x8, 0x0, 0x2b, 0xe1, 0x3, 0x18]);
enum GUID_DEVCLASS_NETDRIVER = GUID(0x87ef9ad1, 0x8f70, 0x49ee, [0xb2, 0x15, 0xab, 0x1f, 0xca, 0xdc, 0xbe, 0x3c]);
enum GUID_DEVCLASS_NETSERVICE = GUID(0x4d36e974, 0xe325, 0x11ce, [0xbf, 0xc1, 0x8, 0x0, 0x2b, 0xe1, 0x3, 0x18]);
enum GUID_DEVCLASS_NETTRANS = GUID(0x4d36e975, 0xe325, 0x11ce, [0xbf, 0xc1, 0x8, 0x0, 0x2b, 0xe1, 0x3, 0x18]);
enum GUID_DEVCLASS_NETUIO = GUID(0x78912bc1, 0xcb8e, 0x4b28, [0xa3, 0x29, 0xf3, 0x22, 0xeb, 0xad, 0xbe, 0xf]);
enum GUID_DEVCLASS_NODRIVER = GUID(0x4d36e976, 0xe325, 0x11ce, [0xbf, 0xc1, 0x8, 0x0, 0x2b, 0xe1, 0x3, 0x18]);
enum GUID_DEVCLASS_PCMCIA = GUID(0x4d36e977, 0xe325, 0x11ce, [0xbf, 0xc1, 0x8, 0x0, 0x2b, 0xe1, 0x3, 0x18]);
enum GUID_DEVCLASS_PNPPRINTERS = GUID(0x4658ee7e, 0xf050, 0x11d1, [0xb6, 0xbd, 0x0, 0xc0, 0x4f, 0xa3, 0x72, 0xa7]);
enum GUID_DEVCLASS_PORTS = GUID(0x4d36e978, 0xe325, 0x11ce, [0xbf, 0xc1, 0x8, 0x0, 0x2b, 0xe1, 0x3, 0x18]);
enum GUID_DEVCLASS_PRINTER = GUID(0x4d36e979, 0xe325, 0x11ce, [0xbf, 0xc1, 0x8, 0x0, 0x2b, 0xe1, 0x3, 0x18]);
enum GUID_DEVCLASS_PRINTERUPGRADE = GUID(0x4d36e97a, 0xe325, 0x11ce, [0xbf, 0xc1, 0x8, 0x0, 0x2b, 0xe1, 0x3, 0x18]);
enum GUID_DEVCLASS_PRINTQUEUE = GUID(0x1ed2bbf9, 0x11f0, 0x4084, [0xb2, 0x1f, 0xad, 0x83, 0xa8, 0xe6, 0xdc, 0xdc]);
enum GUID_DEVCLASS_PROCESSOR = GUID(0x50127dc3, 0xf36, 0x415e, [0xa6, 0xcc, 0x4c, 0xb3, 0xbe, 0x91, 0xb, 0x65]);
enum GUID_DEVCLASS_SBP2 = GUID(0xd48179be, 0xec20, 0x11d1, [0xb6, 0xb8, 0x0, 0xc0, 0x4f, 0xa3, 0x72, 0xa7]);
enum GUID_DEVCLASS_SCMDISK = GUID(0x53966cb1, 0x4d46, 0x4166, [0xbf, 0x23, 0xc5, 0x22, 0x40, 0x3c, 0xd4, 0x95]);
enum GUID_DEVCLASS_SCMVOLUME = GUID(0x53ccb149, 0xe543, 0x4c84, [0xb6, 0xe0, 0xbc, 0xe4, 0xf6, 0xb7, 0xe8, 0x6]);
enum GUID_DEVCLASS_SCSIADAPTER = GUID(0x4d36e97b, 0xe325, 0x11ce, [0xbf, 0xc1, 0x8, 0x0, 0x2b, 0xe1, 0x3, 0x18]);
enum GUID_DEVCLASS_SECURITYACCELERATOR = GUID(0x268c95a1, 0xedfe, 0x11d3, [0x95, 0xc3, 0x0, 0x10, 0xdc, 0x40, 0x50, 0xa5]);
enum GUID_DEVCLASS_SENSOR = GUID(0x5175d334, 0xc371, 0x4806, [0xb3, 0xba, 0x71, 0xfd, 0x53, 0xc9, 0x25, 0x8d]);
enum GUID_DEVCLASS_SIDESHOW = GUID(0x997b5d8d, 0xc442, 0x4f2e, [0xba, 0xf3, 0x9c, 0x8e, 0x67, 0x1e, 0x9e, 0x21]);
enum GUID_DEVCLASS_SMARTCARDREADER = GUID(0x50dd5230, 0xba8a, 0x11d1, [0xbf, 0x5d, 0x0, 0x0, 0xf8, 0x5, 0xf5, 0x30]);
enum GUID_DEVCLASS_SMRDISK = GUID(0x53487c23, 0x680f, 0x4585, [0xac, 0xc3, 0x1f, 0x10, 0xd6, 0x77, 0x7e, 0x82]);
enum GUID_DEVCLASS_SMRVOLUME = GUID(0x53b3cf03, 0x8f5a, 0x4788, [0x91, 0xb6, 0xd1, 0x9e, 0xd9, 0xfc, 0xcc, 0xbf]);
enum GUID_DEVCLASS_SOFTWARECOMPONENT = GUID(0x5c4c3332, 0x344d, 0x483c, [0x87, 0x39, 0x25, 0x9e, 0x93, 0x4c, 0x9c, 0xc8]);
enum GUID_DEVCLASS_SOUND = GUID(0x4d36e97c, 0xe325, 0x11ce, [0xbf, 0xc1, 0x8, 0x0, 0x2b, 0xe1, 0x3, 0x18]);
enum GUID_DEVCLASS_SYSTEM = GUID(0x4d36e97d, 0xe325, 0x11ce, [0xbf, 0xc1, 0x8, 0x0, 0x2b, 0xe1, 0x3, 0x18]);
enum GUID_DEVCLASS_TAPEDRIVE = GUID(0x6d807884, 0x7d21, 0x11cf, [0x80, 0x1c, 0x8, 0x0, 0x2b, 0xe1, 0x3, 0x18]);
enum GUID_DEVCLASS_UNKNOWN = GUID(0x4d36e97e, 0xe325, 0x11ce, [0xbf, 0xc1, 0x8, 0x0, 0x2b, 0xe1, 0x3, 0x18]);
enum GUID_DEVCLASS_UCM = GUID(0xe6f1aa1c, 0x7f3b, 0x4473, [0xb2, 0xe8, 0xc9, 0x7d, 0x8a, 0xc7, 0x1d, 0x53]);
enum GUID_DEVCLASS_USB = GUID(0x36fc9e60, 0xc465, 0x11cf, [0x80, 0x56, 0x44, 0x45, 0x53, 0x54, 0x0, 0x0]);
enum GUID_DEVCLASS_VOLUME = GUID(0x71a27cdd, 0x812a, 0x11d0, [0xbe, 0xc7, 0x8, 0x0, 0x2b, 0xe2, 0x9, 0x2f]);
enum GUID_DEVCLASS_VOLUMESNAPSHOT = GUID(0x533c5b84, 0xec70, 0x11d2, [0x95, 0x5, 0x0, 0xc0, 0x4f, 0x79, 0xde, 0xaf]);
enum GUID_DEVCLASS_WCEUSBS = GUID(0x25dbce51, 0x6c8f, 0x4a72, [0x8a, 0x6d, 0xb5, 0x4c, 0x2b, 0x4f, 0xc8, 0x35]);
enum GUID_DEVCLASS_WPD = GUID(0xeec5ad98, 0x8080, 0x425f, [0x92, 0x2a, 0xda, 0xbf, 0x3d, 0xe3, 0xf6, 0x9a]);
enum GUID_DEVCLASS_FSFILTER_TOP = GUID(0xb369baf4, 0x5568, 0x4e82, [0xa8, 0x7e, 0xa9, 0x3e, 0xb1, 0x6b, 0xca, 0x87]);
enum GUID_DEVCLASS_FSFILTER_ACTIVITYMONITOR = GUID(0xb86dff51, 0xa31e, 0x4bac, [0xb3, 0xcf, 0xe8, 0xcf, 0xe7, 0x5c, 0x9f, 0xc2]);
enum GUID_DEVCLASS_FSFILTER_UNDELETE = GUID(0xfe8f1572, 0xc67a, 0x48c0, [0xbb, 0xac, 0xb, 0x5c, 0x6d, 0x66, 0xca, 0xfb]);
enum GUID_DEVCLASS_FSFILTER_ANTIVIRUS = GUID(0xb1d1a169, 0xc54f, 0x4379, [0x81, 0xdb, 0xbe, 0xe7, 0xd8, 0x8d, 0x74, 0x54]);
enum GUID_DEVCLASS_FSFILTER_REPLICATION = GUID(0x48d3ebc4, 0x4cf8, 0x48ff, [0xb8, 0x69, 0x9c, 0x68, 0xad, 0x42, 0xeb, 0x9f]);
enum GUID_DEVCLASS_FSFILTER_CONTINUOUSBACKUP = GUID(0x71aa14f8, 0x6fad, 0x4622, [0xad, 0x77, 0x92, 0xbb, 0x9d, 0x7e, 0x69, 0x47]);
enum GUID_DEVCLASS_FSFILTER_CONTENTSCREENER = GUID(0x3e3f0674, 0xc83c, 0x4558, [0xbb, 0x26, 0x98, 0x20, 0xe1, 0xeb, 0xa5, 0xc5]);
enum GUID_DEVCLASS_FSFILTER_QUOTAMANAGEMENT = GUID(0x8503c911, 0xa6c7, 0x4919, [0x8f, 0x79, 0x50, 0x28, 0xf5, 0x86, 0x6b, 0xc]);
enum GUID_DEVCLASS_FSFILTER_SYSTEMRECOVERY = GUID(0x2db15374, 0x706e, 0x4131, [0xa0, 0xc7, 0xd7, 0xc7, 0x8e, 0xb0, 0x28, 0x9a]);
enum GUID_DEVCLASS_FSFILTER_CFSMETADATASERVER = GUID(0xcdcf0939, 0xb75b, 0x4630, [0xbf, 0x76, 0x80, 0xf7, 0xba, 0x65, 0x58, 0x84]);
enum GUID_DEVCLASS_FSFILTER_HSM = GUID(0xd546500a, 0x2aeb, 0x45f6, [0x94, 0x82, 0xf4, 0xb1, 0x79, 0x9c, 0x31, 0x77]);
enum GUID_DEVCLASS_FSFILTER_COMPRESSION = GUID(0xf3586baf, 0xb5aa, 0x49b5, [0x8d, 0x6c, 0x5, 0x69, 0x28, 0x4c, 0x63, 0x9f]);
enum GUID_DEVCLASS_FSFILTER_ENCRYPTION = GUID(0xa0a701c0, 0xa511, 0x42ff, [0xaa, 0x6c, 0x6, 0xdc, 0x3, 0x95, 0x57, 0x6f]);
enum GUID_DEVCLASS_FSFILTER_VIRTUALIZATION = GUID(0xf75a86c0, 0x10d8, 0x4c3a, [0xb2, 0x33, 0xed, 0x60, 0xe4, 0xcd, 0xfa, 0xac]);
enum GUID_DEVCLASS_FSFILTER_PHYSICALQUOTAMANAGEMENT = GUID(0x6a0a8e78, 0xbba6, 0x4fc4, [0xa7, 0x9, 0x1e, 0x33, 0xcd, 0x9, 0xd6, 0x7e]);
enum GUID_DEVCLASS_FSFILTER_OPENFILEBACKUP = GUID(0xf8ecafa6, 0x66d1, 0x41a5, [0x89, 0x9b, 0x66, 0x58, 0x5d, 0x72, 0x16, 0xb7]);
enum GUID_DEVCLASS_FSFILTER_SECURITYENHANCER = GUID(0xd02bc3da, 0xc8e, 0x4945, [0x9b, 0xd5, 0xf1, 0x88, 0x3c, 0x22, 0x6c, 0x8c]);
enum GUID_DEVCLASS_FSFILTER_COPYPROTECTION = GUID(0x89786ff1, 0x9c12, 0x402f, [0x9c, 0x9e, 0x17, 0x75, 0x3c, 0x7f, 0x43, 0x75]);
enum GUID_DEVCLASS_FSFILTER_BOTTOM = GUID(0x37765ea0, 0x5958, 0x4fc9, [0xb0, 0x4b, 0x2f, 0xdf, 0xef, 0x97, 0xe5, 0x9e]);
enum GUID_DEVCLASS_FSFILTER_SYSTEM = GUID(0x5d1b9aaa, 0x1e2, 0x46af, [0x84, 0x9f, 0x27, 0x2b, 0x3f, 0x32, 0x4c, 0x46]);
enum GUID_DEVCLASS_FSFILTER_INFRASTRUCTURE = GUID(0xe55fa6f9, 0x128c, 0x4d04, [0xab, 0xab, 0x63, 0xc, 0x74, 0xb1, 0x45, 0x3a]);
enum LINE_LEN = 0x00000100;
enum MAX_INF_STRING_LENGTH = 0x00001000;
enum MAX_INF_SECTION_NAME_LENGTH = 0x000000ff;
enum MAX_TITLE_LEN = 0x0000003c;
enum MAX_INSTRUCTION_LEN = 0x00000100;
enum MAX_LABEL_LEN = 0x0000001e;
enum MAX_SERVICE_NAME_LEN = 0x00000100;
enum MAX_SUBTITLE_LEN = 0x00000100;
enum SP_MAX_MACHINENAME_LENGTH = 0x00000107;
enum SP_ALTPLATFORM_FLAGS_VERSION_RANGE = 0x00000001;
enum SP_ALTPLATFORM_FLAGS_SUITE_MASK = 0x00000002;
enum INF_STYLE_CACHE_ENABLE = 0x00000010;
enum INF_STYLE_CACHE_DISABLE = 0x00000020;
enum INF_STYLE_CACHE_IGNORE = 0x00000040;
enum DIRID_ABSOLUTE = 0xffffffffffffffff;
enum DIRID_ABSOLUTE_16BIT = 0x0000ffff;
enum DIRID_NULL = 0x00000000;
enum DIRID_SRCPATH = 0x00000001;
enum DIRID_WINDOWS = 0x0000000a;
enum DIRID_SYSTEM = 0x0000000b;
enum DIRID_DRIVERS = 0x0000000c;
enum DIRID_IOSUBSYS = 0x0000000c;
enum DIRID_DRIVER_STORE = 0x0000000d;
enum DIRID_INF = 0x00000011;
enum DIRID_HELP = 0x00000012;
enum DIRID_FONTS = 0x00000014;
enum DIRID_VIEWERS = 0x00000015;
enum DIRID_COLOR = 0x00000017;
enum DIRID_APPS = 0x00000018;
enum DIRID_SHARED = 0x00000019;
enum DIRID_BOOT = 0x0000001e;
enum DIRID_SYSTEM16 = 0x00000032;
enum DIRID_SPOOL = 0x00000033;
enum DIRID_SPOOLDRIVERS = 0x00000034;
enum DIRID_USERPROFILE = 0x00000035;
enum DIRID_LOADER = 0x00000036;
enum DIRID_PRINTPROCESSOR = 0x00000037;
enum DIRID_DEFAULT = 0x0000000b;
enum DIRID_COMMON_STARTMENU = 0x00004016;
enum DIRID_COMMON_PROGRAMS = 0x00004017;
enum DIRID_COMMON_STARTUP = 0x00004018;
enum DIRID_COMMON_DESKTOPDIRECTORY = 0x00004019;
enum DIRID_COMMON_FAVORITES = 0x0000401f;
enum DIRID_COMMON_APPDATA = 0x00004023;
enum DIRID_PROGRAM_FILES = 0x00004026;
enum DIRID_SYSTEM_X86 = 0x00004029;
enum DIRID_PROGRAM_FILES_X86 = 0x0000402a;
enum DIRID_PROGRAM_FILES_COMMON = 0x0000402b;
enum DIRID_PROGRAM_FILES_COMMONX86 = 0x0000402c;
enum DIRID_COMMON_TEMPLATES = 0x0000402d;
enum DIRID_COMMON_DOCUMENTS = 0x0000402e;
enum DIRID_USER = 0x00008000;
enum SPFILENOTIFY_STARTQUEUE = 0x00000001;
enum SPFILENOTIFY_ENDQUEUE = 0x00000002;
enum SPFILENOTIFY_STARTSUBQUEUE = 0x00000003;
enum SPFILENOTIFY_ENDSUBQUEUE = 0x00000004;
enum SPFILENOTIFY_STARTDELETE = 0x00000005;
enum SPFILENOTIFY_ENDDELETE = 0x00000006;
enum SPFILENOTIFY_DELETEERROR = 0x00000007;
enum SPFILENOTIFY_STARTRENAME = 0x00000008;
enum SPFILENOTIFY_ENDRENAME = 0x00000009;
enum SPFILENOTIFY_RENAMEERROR = 0x0000000a;
enum SPFILENOTIFY_STARTCOPY = 0x0000000b;
enum SPFILENOTIFY_ENDCOPY = 0x0000000c;
enum SPFILENOTIFY_COPYERROR = 0x0000000d;
enum SPFILENOTIFY_NEEDMEDIA = 0x0000000e;
enum SPFILENOTIFY_QUEUESCAN = 0x0000000f;
enum SPFILENOTIFY_CABINETINFO = 0x00000010;
enum SPFILENOTIFY_FILEINCABINET = 0x00000011;
enum SPFILENOTIFY_NEEDNEWCABINET = 0x00000012;
enum SPFILENOTIFY_FILEEXTRACTED = 0x00000013;
enum SPFILENOTIFY_FILEOPDELAYED = 0x00000014;
enum SPFILENOTIFY_STARTBACKUP = 0x00000015;
enum SPFILENOTIFY_BACKUPERROR = 0x00000016;
enum SPFILENOTIFY_ENDBACKUP = 0x00000017;
enum SPFILENOTIFY_QUEUESCAN_EX = 0x00000018;
enum SPFILENOTIFY_STARTREGISTRATION = 0x00000019;
enum SPFILENOTIFY_ENDREGISTRATION = 0x00000020;
enum SPFILENOTIFY_QUEUESCAN_SIGNERINFO = 0x00000040;
enum SPFILENOTIFY_LANGMISMATCH = 0x00010000;
enum SPFILENOTIFY_TARGETEXISTS = 0x00020000;
enum SPFILENOTIFY_TARGETNEWER = 0x00040000;
enum FILEOP_RENAME = 0x00000001;
enum FILEOP_BACKUP = 0x00000003;
enum FILEOP_ABORT = 0x00000000;
enum FILEOP_DOIT = 0x00000001;
enum FILEOP_SKIP = 0x00000002;
enum FILEOP_RETRY = 0x00000001;
enum FILEOP_NEWPATH = 0x00000004;
enum COPYFLG_WARN_IF_SKIP = 0x00000001;
enum COPYFLG_NOSKIP = 0x00000002;
enum COPYFLG_NOVERSIONCHECK = 0x00000004;
enum COPYFLG_FORCE_FILE_IN_USE = 0x00000008;
enum COPYFLG_NO_OVERWRITE = 0x00000010;
enum COPYFLG_NO_VERSION_DIALOG = 0x00000020;
enum COPYFLG_OVERWRITE_OLDER_ONLY = 0x00000040;
enum COPYFLG_PROTECTED_WINDOWS_DRIVER_FILE = 0x00000100;
enum COPYFLG_REPLACEONLY = 0x00000400;
enum COPYFLG_NODECOMP = 0x00000800;
enum COPYFLG_REPLACE_BOOT_FILE = 0x00001000;
enum COPYFLG_NOPRUNE = 0x00002000;
enum COPYFLG_IN_USE_TRY_RENAME = 0x00004000;
enum DELFLG_IN_USE = 0x00000001;
enum DELFLG_IN_USE1 = 0x00010000;
enum SPREG_SUCCESS = 0x00000000;
enum SPREG_LOADLIBRARY = 0x00000001;
enum SPREG_GETPROCADDR = 0x00000002;
enum SPREG_REGSVR = 0x00000003;
enum SPREG_DLLINSTALL = 0x00000004;
enum SPREG_TIMEOUT = 0x00000005;
enum SPREG_UNKNOWN = 0xffffffff;
enum SPINT_ACTIVE = 0x00000001;
enum SPINT_DEFAULT = 0x00000002;
enum SPINT_REMOVED = 0x00000004;
enum SPID_ACTIVE = 0x00000001;
enum SPID_DEFAULT = 0x00000002;
enum SPID_REMOVED = 0x00000004;
enum DIF_SELECTDEVICE = 0x00000001;
enum DIF_INSTALLDEVICE = 0x00000002;
enum DIF_ASSIGNRESOURCES = 0x00000003;
enum DIF_PROPERTIES = 0x00000004;
enum DIF_REMOVE = 0x00000005;
enum DIF_FIRSTTIMESETUP = 0x00000006;
enum DIF_FOUNDDEVICE = 0x00000007;
enum DIF_SELECTCLASSDRIVERS = 0x00000008;
enum DIF_VALIDATECLASSDRIVERS = 0x00000009;
enum DIF_INSTALLCLASSDRIVERS = 0x0000000a;
enum DIF_CALCDISKSPACE = 0x0000000b;
enum DIF_DESTROYPRIVATEDATA = 0x0000000c;
enum DIF_VALIDATEDRIVER = 0x0000000d;
enum DIF_DETECT = 0x0000000f;
enum DIF_INSTALLWIZARD = 0x00000010;
enum DIF_DESTROYWIZARDDATA = 0x00000011;
enum DIF_PROPERTYCHANGE = 0x00000012;
enum DIF_ENABLECLASS = 0x00000013;
enum DIF_DETECTVERIFY = 0x00000014;
enum DIF_INSTALLDEVICEFILES = 0x00000015;
enum DIF_UNREMOVE = 0x00000016;
enum DIF_SELECTBESTCOMPATDRV = 0x00000017;
enum DIF_ALLOW_INSTALL = 0x00000018;
enum DIF_REGISTERDEVICE = 0x00000019;
enum DIF_NEWDEVICEWIZARD_PRESELECT = 0x0000001a;
enum DIF_NEWDEVICEWIZARD_SELECT = 0x0000001b;
enum DIF_NEWDEVICEWIZARD_PREANALYZE = 0x0000001c;
enum DIF_NEWDEVICEWIZARD_POSTANALYZE = 0x0000001d;
enum DIF_NEWDEVICEWIZARD_FINISHINSTALL = 0x0000001e;
enum DIF_UNUSED1 = 0x0000001f;
enum DIF_INSTALLINTERFACES = 0x00000020;
enum DIF_DETECTCANCEL = 0x00000021;
enum DIF_REGISTER_COINSTALLERS = 0x00000022;
enum DIF_ADDPROPERTYPAGE_ADVANCED = 0x00000023;
enum DIF_ADDPROPERTYPAGE_BASIC = 0x00000024;
enum DIF_RESERVED1 = 0x00000025;
enum DIF_TROUBLESHOOTER = 0x00000026;
enum DIF_POWERMESSAGEWAKE = 0x00000027;
enum DIF_ADDREMOTEPROPERTYPAGE_ADVANCED = 0x00000028;
enum DIF_UPDATEDRIVER_UI = 0x00000029;
enum DIF_FINISHINSTALL_ACTION = 0x0000002a;
enum DIF_RESERVED2 = 0x00000030;
enum DIF_MOVEDEVICE = 0x0000000e;
enum DI_SHOWOEM = 0x00000001;
enum DI_SHOWCOMPAT = 0x00000002;
enum DI_SHOWCLASS = 0x00000004;
enum DI_SHOWALL = 0x00000007;
enum DI_NOVCP = 0x00000008;
enum DI_DIDCOMPAT = 0x00000010;
enum DI_DIDCLASS = 0x00000020;
enum DI_AUTOASSIGNRES = 0x00000040;
enum DI_NEEDRESTART = 0x00000080;
enum DI_NEEDREBOOT = 0x00000100;
enum DI_NOBROWSE = 0x00000200;
enum DI_MULTMFGS = 0x00000400;
enum DI_DISABLED = 0x00000800;
enum DI_GENERALPAGE_ADDED = 0x00001000;
enum DI_RESOURCEPAGE_ADDED = 0x00002000;
enum DI_PROPERTIES_CHANGE = 0x00004000;
enum DI_INF_IS_SORTED = 0x00008000;
enum DI_ENUMSINGLEINF = 0x00010000;
enum DI_DONOTCALLCONFIGMG = 0x00020000;
enum DI_INSTALLDISABLED = 0x00040000;
enum DI_COMPAT_FROM_CLASS = 0x00080000;
enum DI_CLASSINSTALLPARAMS = 0x00100000;
enum DI_NODI_DEFAULTACTION = 0x00200000;
enum DI_QUIETINSTALL = 0x00800000;
enum DI_NOFILECOPY = 0x01000000;
enum DI_FORCECOPY = 0x02000000;
enum DI_DRIVERPAGE_ADDED = 0x04000000;
enum DI_USECI_SELECTSTRINGS = 0x08000000;
enum DI_OVERRIDE_INFFLAGS = 0x10000000;
enum DI_PROPS_NOCHANGEUSAGE = 0x20000000;
enum DI_NOSELECTICONS = 0x40000000;
enum DI_NOWRITE_IDS = 0xffffffff80000000;
enum DI_FLAGSEX_RESERVED2 = 0x00000001;
enum DI_FLAGSEX_RESERVED3 = 0x00000002;
enum DI_FLAGSEX_CI_FAILED = 0x00000004;
enum DI_FLAGSEX_FINISHINSTALL_ACTION = 0x00000008;
enum DI_FLAGSEX_DIDINFOLIST = 0x00000010;
enum DI_FLAGSEX_DIDCOMPATINFO = 0x00000020;
enum DI_FLAGSEX_FILTERCLASSES = 0x00000040;
enum DI_FLAGSEX_SETFAILEDINSTALL = 0x00000080;
enum DI_FLAGSEX_DEVICECHANGE = 0x00000100;
enum DI_FLAGSEX_ALWAYSWRITEIDS = 0x00000200;
enum DI_FLAGSEX_PROPCHANGE_PENDING = 0x00000400;
enum DI_FLAGSEX_ALLOWEXCLUDEDDRVS = 0x00000800;
enum DI_FLAGSEX_NOUIONQUERYREMOVE = 0x00001000;
enum DI_FLAGSEX_USECLASSFORCOMPAT = 0x00002000;
enum DI_FLAGSEX_RESERVED4 = 0x00004000;
enum DI_FLAGSEX_NO_DRVREG_MODIFY = 0x00008000;
enum DI_FLAGSEX_IN_SYSTEM_SETUP = 0x00010000;
enum DI_FLAGSEX_INET_DRIVER = 0x00020000;
enum DI_FLAGSEX_APPENDDRIVERLIST = 0x00040000;
enum DI_FLAGSEX_PREINSTALLBACKUP = 0x00080000;
enum DI_FLAGSEX_BACKUPONREPLACE = 0x00100000;
enum DI_FLAGSEX_DRIVERLIST_FROM_URL = 0x00200000;
enum DI_FLAGSEX_RESERVED1 = 0x00400000;
enum DI_FLAGSEX_EXCLUDE_OLD_INET_DRIVERS = 0x00800000;
enum DI_FLAGSEX_POWERPAGE_ADDED = 0x01000000;
enum DI_FLAGSEX_FILTERSIMILARDRIVERS = 0x02000000;
enum DI_FLAGSEX_INSTALLEDDRIVER = 0x04000000;
enum DI_FLAGSEX_NO_CLASSLIST_NODE_MERGE = 0x08000000;
enum DI_FLAGSEX_ALTPLATFORM_DRVSEARCH = 0x10000000;
enum DI_FLAGSEX_RESTART_DEVICE_ONLY = 0x20000000;
enum DI_FLAGSEX_RECURSIVESEARCH = 0x40000000;
enum DI_FLAGSEX_SEARCH_PUBLISHED_INFS = 0xffffffff80000000;
enum ENABLECLASS_QUERY = 0x00000000;
enum ENABLECLASS_SUCCESS = 0x00000001;
enum ENABLECLASS_FAILURE = 0x00000002;
enum DICS_ENABLE = 0x00000001;
enum DICS_DISABLE = 0x00000002;
enum DICS_PROPCHANGE = 0x00000003;
enum DICS_START = 0x00000004;
enum DICS_STOP = 0x00000005;
enum DICS_FLAG_GLOBAL = 0x00000001;
enum DICS_FLAG_CONFIGSPECIFIC = 0x00000002;
enum DICS_FLAG_CONFIGGENERAL = 0x00000004;
enum DI_REMOVEDEVICE_GLOBAL = 0x00000001;
enum DI_REMOVEDEVICE_CONFIGSPECIFIC = 0x00000002;
enum DI_UNREMOVEDEVICE_CONFIGSPECIFIC = 0x00000002;
enum MAX_INSTALLWIZARD_DYNAPAGES = 0x00000014;
enum NDW_INSTALLFLAG_DIDFACTDEFS = 0x00000001;
enum NDW_INSTALLFLAG_HARDWAREALLREADYIN = 0x00000002;
enum NDW_INSTALLFLAG_NEEDRESTART = 0x00000080;
enum NDW_INSTALLFLAG_NEEDREBOOT = 0x00000100;
enum NDW_INSTALLFLAG_NEEDSHUTDOWN = 0x00000200;
enum NDW_INSTALLFLAG_EXPRESSINTRO = 0x00000400;
enum NDW_INSTALLFLAG_SKIPISDEVINSTALLED = 0x00000800;
enum NDW_INSTALLFLAG_NODETECTEDDEVS = 0x00001000;
enum NDW_INSTALLFLAG_INSTALLSPECIFIC = 0x00002000;
enum NDW_INSTALLFLAG_SKIPCLASSLIST = 0x00004000;
enum NDW_INSTALLFLAG_CI_PICKED_OEM = 0x00008000;
enum NDW_INSTALLFLAG_PCMCIAMODE = 0x00010000;
enum NDW_INSTALLFLAG_PCMCIADEVICE = 0x00020000;
enum NDW_INSTALLFLAG_USERCANCEL = 0x00040000;
enum NDW_INSTALLFLAG_KNOWNCLASS = 0x00080000;
enum DYNAWIZ_FLAG_PAGESADDED = 0x00000001;
enum DYNAWIZ_FLAG_ANALYZE_HANDLECONFLICT = 0x00000008;
enum DYNAWIZ_FLAG_INSTALLDET_NEXT = 0x00000002;
enum DYNAWIZ_FLAG_INSTALLDET_PREV = 0x00000004;
enum MIN_IDD_DYNAWIZ_RESOURCE_ID = 0x00002710;
enum MAX_IDD_DYNAWIZ_RESOURCE_ID = 0x00002af8;
enum IDD_DYNAWIZ_FIRSTPAGE = 0x00002710;
enum IDD_DYNAWIZ_SELECT_PREVPAGE = 0x00002711;
enum IDD_DYNAWIZ_SELECT_NEXTPAGE = 0x00002712;
enum IDD_DYNAWIZ_ANALYZE_PREVPAGE = 0x00002713;
enum IDD_DYNAWIZ_ANALYZE_NEXTPAGE = 0x00002714;
enum IDD_DYNAWIZ_SELECTDEV_PAGE = 0x00002719;
enum IDD_DYNAWIZ_ANALYZEDEV_PAGE = 0x0000271a;
enum IDD_DYNAWIZ_INSTALLDETECTEDDEVS_PAGE = 0x0000271b;
enum IDD_DYNAWIZ_SELECTCLASS_PAGE = 0x0000271c;
enum IDD_DYNAWIZ_INSTALLDETECTED_PREVPAGE = 0x00002716;
enum IDD_DYNAWIZ_INSTALLDETECTED_NEXTPAGE = 0x00002717;
enum IDD_DYNAWIZ_INSTALLDETECTED_NODEVS = 0x00002718;
enum DNF_DUPDESC = 0x00000001;
enum DNF_OLDDRIVER = 0x00000002;
enum DNF_EXCLUDEFROMLIST = 0x00000004;
enum DNF_NODRIVER = 0x00000008;
enum DNF_LEGACYINF = 0x00000010;
enum DNF_CLASS_DRIVER = 0x00000020;
enum DNF_COMPATIBLE_DRIVER = 0x00000040;
enum DNF_INET_DRIVER = 0x00000080;
enum DNF_UNUSED1 = 0x00000100;
enum DNF_UNUSED2 = 0x00000200;
enum DNF_OLD_INET_DRIVER = 0x00000400;
enum DNF_BAD_DRIVER = 0x00000800;
enum DNF_DUPPROVIDER = 0x00001000;
enum DNF_INF_IS_SIGNED = 0x00002000;
enum DNF_OEM_F6_INF = 0x00004000;
enum DNF_DUPDRIVERVER = 0x00008000;
enum DNF_BASIC_DRIVER = 0x00010000;
enum DNF_AUTHENTICODE_SIGNED = 0x00020000;
enum DNF_INSTALLEDDRIVER = 0x00040000;
enum DNF_ALWAYSEXCLUDEFROMLIST = 0x00080000;
enum DNF_INBOX_DRIVER = 0x00100000;
enum DNF_REQUESTADDITIONALSOFTWARE = 0x00200000;
enum DNF_UNUSED_22 = 0x00400000;
enum DNF_UNUSED_23 = 0x00800000;
enum DNF_UNUSED_24 = 0x01000000;
enum DNF_UNUSED_25 = 0x02000000;
enum DNF_UNUSED_26 = 0x04000000;
enum DNF_UNUSED_27 = 0x08000000;
enum DNF_UNUSED_28 = 0x10000000;
enum DNF_UNUSED_29 = 0x20000000;
enum DNF_UNUSED_30 = 0x40000000;
enum DNF_UNUSED_31 = 0x80000000;
enum DRIVER_HARDWAREID_RANK = 0x00000fff;
enum DRIVER_HARDWAREID_MASK = 0x80000fff;
enum DRIVER_UNTRUSTED_RANK = 0x80000000;
enum DRIVER_W9X_SUSPECT_RANK = 0xc0000000;
enum DRIVER_COMPATID_RANK = 0x00003fff;
enum DRIVER_UNTRUSTED_HARDWAREID_RANK = 0x00008fff;
enum DRIVER_UNTRUSTED_COMPATID_RANK = 0x0000bfff;
enum DRIVER_W9X_SUSPECT_HARDWAREID_RANK = 0x0000cfff;
enum DRIVER_W9X_SUSPECT_COMPATID_RANK = 0x0000ffff;
enum SPPSR_SELECT_DEVICE_RESOURCES = 0x00000001;
enum SPPSR_ENUM_BASIC_DEVICE_PROPERTIES = 0x00000002;
enum SPPSR_ENUM_ADV_DEVICE_PROPERTIES = 0x00000003;
enum INFINFO_INF_SPEC_IS_HINF = 0x00000001;
enum INFINFO_INF_NAME_IS_ABSOLUTE = 0x00000002;
enum INFINFO_DEFAULT_SEARCH = 0x00000003;
enum INFINFO_REVERSE_DEFAULT_SEARCH = 0x00000004;
enum INFINFO_INF_PATH_LIST_SEARCH = 0x00000005;
enum FILE_COMPRESSION_NONE = 0x00000000;
enum FILE_COMPRESSION_WINLZA = 0x00000001;
enum FILE_COMPRESSION_MSZIP = 0x00000002;
enum FILE_COMPRESSION_NTCAB = 0x00000003;
enum SRCLIST_TEMPORARY = 0x00000001;
enum SRCLIST_NOBROWSE = 0x00000002;
enum SRCLIST_SYSTEM = 0x00000010;
enum SRCLIST_USER = 0x00000020;
enum SRCLIST_SYSIFADMIN = 0x00000040;
enum SRCLIST_SUBDIRS = 0x00000100;
enum SRCLIST_APPEND = 0x00000200;
enum SRCLIST_NOSTRIPPLATFORM = 0x00000400;
enum IDF_NOBROWSE = 0x00000001;
enum IDF_NOSKIP = 0x00000002;
enum IDF_NODETAILS = 0x00000004;
enum IDF_NOCOMPRESSED = 0x00000008;
enum IDF_CHECKFIRST = 0x00000100;
enum IDF_NOBEEP = 0x00000200;
enum IDF_NOFOREGROUND = 0x00000400;
enum IDF_WARNIFSKIP = 0x00000800;
enum IDF_NOREMOVABLEMEDIAPROMPT = 0x00001000;
enum IDF_USEDISKNAMEASPROMPT = 0x00002000;
enum IDF_OEMDISK = 0x80000000;
enum DPROMPT_SUCCESS = 0x00000000;
enum DPROMPT_CANCEL = 0x00000001;
enum DPROMPT_SKIPFILE = 0x00000002;
enum DPROMPT_BUFFERTOOSMALL = 0x00000003;
enum DPROMPT_OUTOFMEMORY = 0x00000004;
enum SETDIRID_NOT_FULL_PATH = 0x00000001;
enum SRCINFO_PATH = 0x00000001;
enum SRCINFO_TAGFILE = 0x00000002;
enum SRCINFO_DESCRIPTION = 0x00000003;
enum SRCINFO_FLAGS = 0x00000004;
enum SRCINFO_TAGFILE2 = 0x00000005;
enum SRC_FLAGS_CABFILE = 0x00000010;
enum SP_FLAG_CABINETCONTINUATION = 0x00000800;
enum SP_BACKUP_BACKUPPASS = 0x00000001;
enum SP_BACKUP_DEMANDPASS = 0x00000002;
enum SP_BACKUP_SPECIAL = 0x00000004;
enum SP_BACKUP_BOOTFILE = 0x00000008;
enum SPQ_SCAN_FILE_PRESENCE = 0x00000001;
enum SPQ_SCAN_FILE_VALIDITY = 0x00000002;
enum SPQ_SCAN_USE_CALLBACK = 0x00000004;
enum SPQ_SCAN_USE_CALLBACKEX = 0x00000008;
enum SPQ_SCAN_INFORM_USER = 0x00000010;
enum SPQ_SCAN_PRUNE_COPY_QUEUE = 0x00000020;
enum SPQ_SCAN_USE_CALLBACK_SIGNERINFO = 0x00000040;
enum SPQ_SCAN_PRUNE_DELREN = 0x00000080;
enum SPQ_SCAN_FILE_PRESENCE_WITHOUT_SOURCE = 0x00000100;
enum SPQ_SCAN_FILE_COMPARISON = 0x00000200;
enum SPQ_SCAN_ACTIVATE_DRP = 0x00000400;
enum SPQ_DELAYED_COPY = 0x00000001;
enum SPQ_FLAG_BACKUP_AWARE = 0x00000001;
enum SPQ_FLAG_ABORT_IF_UNSIGNED = 0x00000002;
enum SPQ_FLAG_FILES_MODIFIED = 0x00000004;
enum SPQ_FLAG_DO_SHUFFLEMOVE = 0x00000008;
enum SPQ_FLAG_VALID = 0x0000000f;
enum SPOST_MAX = 0x00000003;
enum SUOI_FORCEDELETE = 0x00000001;
enum SUOI_INTERNAL1 = 0x00000002;
enum SPDSL_IGNORE_DISK = 0x00000001;
enum SPDSL_DISALLOW_NEGATIVE_ADJUST = 0x00000002;
enum SPFILEQ_FILE_IN_USE = 0x00000001;
enum SPFILEQ_REBOOT_RECOMMENDED = 0x00000002;
enum SPFILEQ_REBOOT_IN_PROGRESS = 0x00000004;
enum FLG_ADDREG_DELREG_BIT = 0x00008000;
enum FLG_ADDREG_BINVALUETYPE = 0x00000001;
enum FLG_ADDREG_NOCLOBBER = 0x00000002;
enum FLG_ADDREG_DELVAL = 0x00000004;
enum FLG_ADDREG_APPEND = 0x00000008;
enum FLG_ADDREG_KEYONLY = 0x00000010;
enum FLG_ADDREG_OVERWRITEONLY = 0x00000020;
enum FLG_ADDREG_64BITKEY = 0x00001000;
enum FLG_ADDREG_KEYONLY_COMMON = 0x00002000;
enum FLG_ADDREG_32BITKEY = 0x00004000;
enum FLG_ADDREG_TYPE_SZ = 0x00000000;
enum FLG_ADDREG_TYPE_MULTI_SZ = 0x00010000;
enum FLG_ADDREG_TYPE_EXPAND_SZ = 0x00020000;
enum FLG_DELREG_VALUE = 0x00000000;
enum FLG_DELREG_TYPE_SZ = 0x00000000;
enum FLG_DELREG_TYPE_MULTI_SZ = 0x00010000;
enum FLG_DELREG_TYPE_EXPAND_SZ = 0x00020000;
enum FLG_DELREG_64BITKEY = 0x00001000;
enum FLG_DELREG_KEYONLY_COMMON = 0x00002000;
enum FLG_DELREG_32BITKEY = 0x00004000;
enum FLG_DELREG_OPERATION_MASK = 0x000000fe;
enum FLG_BITREG_CLEARBITS = 0x00000000;
enum FLG_BITREG_SETBITS = 0x00000001;
enum FLG_BITREG_64BITKEY = 0x00001000;
enum FLG_BITREG_32BITKEY = 0x00004000;
enum FLG_INI2REG_64BITKEY = 0x00001000;
enum FLG_INI2REG_32BITKEY = 0x00004000;
enum FLG_REGSVR_DLLREGISTER = 0x00000001;
enum FLG_REGSVR_DLLINSTALL = 0x00000002;
enum FLG_PROFITEM_CURRENTUSER = 0x00000001;
enum FLG_PROFITEM_DELETE = 0x00000002;
enum FLG_PROFITEM_GROUP = 0x00000004;
enum FLG_PROFITEM_CSIDL = 0x00000008;
enum FLG_ADDPROPERTY_NOCLOBBER = 0x00000001;
enum FLG_ADDPROPERTY_OVERWRITEONLY = 0x00000002;
enum FLG_ADDPROPERTY_APPEND = 0x00000004;
enum FLG_ADDPROPERTY_OR = 0x00000008;
enum FLG_ADDPROPERTY_AND = 0x00000010;
enum FLG_DELPROPERTY_MULTI_SZ_DELSTRING = 0x00000001;
enum SPINST_LOGCONFIG = 0x00000001;
enum SPINST_INIFILES = 0x00000002;
enum SPINST_REGISTRY = 0x00000004;
enum SPINST_INI2REG = 0x00000008;
enum SPINST_FILES = 0x00000010;
enum SPINST_BITREG = 0x00000020;
enum SPINST_REGSVR = 0x00000040;
enum SPINST_UNREGSVR = 0x00000080;
enum SPINST_PROFILEITEMS = 0x00000100;
enum SPINST_COPYINF = 0x00000200;
enum SPINST_PROPERTIES = 0x00000400;
enum SPINST_ALL = 0x000007ff;
enum SPINST_SINGLESECTION = 0x00010000;
enum SPINST_LOGCONFIG_IS_FORCED = 0x00020000;
enum SPINST_LOGCONFIGS_ARE_OVERRIDES = 0x00040000;
enum SPINST_REGISTERCALLBACKAWARE = 0x00080000;
enum SPINST_DEVICEINSTALL = 0x00100000;
enum SPSVCINST_TAGTOFRONT = 0x00000001;
enum SPSVCINST_ASSOCSERVICE = 0x00000002;
enum SPSVCINST_DELETEEVENTLOGENTRY = 0x00000004;
enum SPSVCINST_NOCLOBBER_DISPLAYNAME = 0x00000008;
enum SPSVCINST_NOCLOBBER_STARTTYPE = 0x00000010;
enum SPSVCINST_NOCLOBBER_ERRORCONTROL = 0x00000020;
enum SPSVCINST_NOCLOBBER_LOADORDERGROUP = 0x00000040;
enum SPSVCINST_NOCLOBBER_DEPENDENCIES = 0x00000080;
enum SPSVCINST_NOCLOBBER_DESCRIPTION = 0x00000100;
enum SPSVCINST_STOPSERVICE = 0x00000200;
enum SPSVCINST_CLOBBER_SECURITY = 0x00000400;
enum SPSVCINST_STARTSERVICE = 0x00000800;
enum SPSVCINST_NOCLOBBER_REQUIREDPRIVILEGES = 0x00001000;
enum SPSVCINST_NOCLOBBER_TRIGGERS = 0x00002000;
enum SPSVCINST_NOCLOBBER_SERVICESIDTYPE = 0x00004000;
enum SPSVCINST_NOCLOBBER_DELAYEDAUTOSTART = 0x00008000;
enum SPSVCINST_UNIQUE_NAME = 0x00010000;
enum SPFILELOG_SYSTEMLOG = 0x00000001;
enum SPFILELOG_FORCENEW = 0x00000002;
enum SPFILELOG_QUERYONLY = 0x00000004;
enum SPFILELOG_OEMFILE = 0x00000001;
enum LogSevInformation = 0x00000000;
enum LogSevWarning = 0x00000001;
enum LogSevError = 0x00000002;
enum LogSevFatalError = 0x00000003;
enum LogSevMaximum = 0x00000004;
enum DICD_GENERATE_ID = 0x00000001;
enum DICD_INHERIT_CLASSDRVS = 0x00000002;
enum DIOD_INHERIT_CLASSDRVS = 0x00000002;
enum DIOD_CANCEL_REMOVE = 0x00000004;
enum DIODI_NO_ADD = 0x00000001;
enum SPRDI_FIND_DUPS = 0x00000001;
enum SPDIT_NODRIVER = 0x00000000;
enum DIGCF_DEFAULT = 0x00000001;
enum DIGCF_PRESENT = 0x00000002;
enum DIGCF_ALLCLASSES = 0x00000004;
enum DIGCF_PROFILE = 0x00000008;
enum DIGCF_DEVICEINTERFACE = 0x00000010;
enum DIGCF_INTERFACEDEVICE = 0x00000010;
enum DIBCI_NOINSTALLCLASS = 0x00000001;
enum DIBCI_NODISPLAYCLASS = 0x00000002;
enum DIOCR_INSTALLER = 0x00000001;
enum DIOCR_INTERFACE = 0x00000002;
enum DIREG_DEV = 0x00000001;
enum DIREG_DRV = 0x00000002;
enum DIREG_BOTH = 0x00000004;
enum DICLASSPROP_INSTALLER = 0x00000001;
enum DICLASSPROP_INTERFACE = 0x00000002;
enum SPDRP_DEVICEDESC = 0x00000000;
enum SPDRP_HARDWAREID = 0x00000001;
enum SPDRP_COMPATIBLEIDS = 0x00000002;
enum SPDRP_UNUSED0 = 0x00000003;
enum SPDRP_SERVICE = 0x00000004;
enum SPDRP_UNUSED1 = 0x00000005;
enum SPDRP_UNUSED2 = 0x00000006;
enum SPDRP_CLASS = 0x00000007;
enum SPDRP_CLASSGUID = 0x00000008;
enum SPDRP_DRIVER = 0x00000009;
enum SPDRP_CONFIGFLAGS = 0x0000000a;
enum SPDRP_MFG = 0x0000000b;
enum SPDRP_FRIENDLYNAME = 0x0000000c;
enum SPDRP_LOCATION_INFORMATION = 0x0000000d;
enum SPDRP_PHYSICAL_DEVICE_OBJECT_NAME = 0x0000000e;
enum SPDRP_CAPABILITIES = 0x0000000f;
enum SPDRP_UI_NUMBER = 0x00000010;
enum SPDRP_UPPERFILTERS = 0x00000011;
enum SPDRP_LOWERFILTERS = 0x00000012;
enum SPDRP_BUSTYPEGUID = 0x00000013;
enum SPDRP_LEGACYBUSTYPE = 0x00000014;
enum SPDRP_BUSNUMBER = 0x00000015;
enum SPDRP_ENUMERATOR_NAME = 0x00000016;
enum SPDRP_SECURITY = 0x00000017;
enum SPDRP_SECURITY_SDS = 0x00000018;
enum SPDRP_DEVTYPE = 0x00000019;
enum SPDRP_EXCLUSIVE = 0x0000001a;
enum SPDRP_CHARACTERISTICS = 0x0000001b;
enum SPDRP_ADDRESS = 0x0000001c;
enum SPDRP_UI_NUMBER_DESC_FORMAT = 0x0000001d;
enum SPDRP_DEVICE_POWER_DATA = 0x0000001e;
enum SPDRP_REMOVAL_POLICY = 0x0000001f;
enum SPDRP_REMOVAL_POLICY_HW_DEFAULT = 0x00000020;
enum SPDRP_REMOVAL_POLICY_OVERRIDE = 0x00000021;
enum SPDRP_INSTALL_STATE = 0x00000022;
enum SPDRP_LOCATION_PATHS = 0x00000023;
enum SPDRP_BASE_CONTAINERID = 0x00000024;
enum SPDRP_MAXIMUM_PROPERTY = 0x00000025;
enum SPCRP_UPPERFILTERS = 0x00000011;
enum SPCRP_LOWERFILTERS = 0x00000012;
enum SPCRP_SECURITY = 0x00000017;
enum SPCRP_SECURITY_SDS = 0x00000018;
enum SPCRP_DEVTYPE = 0x00000019;
enum SPCRP_EXCLUSIVE = 0x0000001a;
enum SPCRP_CHARACTERISTICS = 0x0000001b;
enum SPCRP_MAXIMUM_PROPERTY = 0x0000001c;
enum DMI_MASK = 0x00000001;
enum DMI_BKCOLOR = 0x00000002;
enum DMI_USERECT = 0x00000004;
enum DIGCDP_FLAG_BASIC = 0x00000001;
enum DIGCDP_FLAG_ADVANCED = 0x00000002;
enum DIGCDP_FLAG_REMOTE_BASIC = 0x00000003;
enum DIGCDP_FLAG_REMOTE_ADVANCED = 0x00000004;
enum IDI_RESOURCEFIRST = 0x0000009f;
enum IDI_RESOURCE = 0x0000009f;
enum IDI_RESOURCELAST = 0x000000a1;
enum IDI_RESOURCEOVERLAYFIRST = 0x000000a1;
enum IDI_RESOURCEOVERLAYLAST = 0x000000a1;
enum IDI_CONFLICT = 0x000000a1;
enum IDI_CLASSICON_OVERLAYFIRST = 0x000001f4;
enum IDI_CLASSICON_OVERLAYLAST = 0x000001f6;
enum IDI_PROBLEM_OVL = 0x000001f4;
enum IDI_DISABLED_OVL = 0x000001f5;
enum IDI_FORCED_OVL = 0x000001f6;
enum SPWPT_SELECTDEVICE = 0x00000001;
enum SPWP_USE_DEVINFO_DATA = 0x00000001;
enum SIGNERSCORE_UNKNOWN = 0xff000000;
enum SIGNERSCORE_W9X_SUSPECT = 0xc0000000;
enum SIGNERSCORE_UNSIGNED = 0x80000000;
enum SIGNERSCORE_AUTHENTICODE = 0x0f000000;
enum SIGNERSCORE_WHQL = 0x0d000005;
enum SIGNERSCORE_UNCLASSIFIED = 0x0d000004;
enum SIGNERSCORE_INBOX = 0x0d000003;
enum SIGNERSCORE_LOGO_STANDARD = 0x0d000002;
enum SIGNERSCORE_LOGO_PREMIUM = 0x0d000001;
enum SIGNERSCORE_MASK = 0xff000000;
enum SIGNERSCORE_SIGNED_MASK = 0xf0000000;
enum DICUSTOMDEVPROP_MERGE_MULTISZ = 0x00000001;
enum SCWMI_CLOBBER_SECURITY = 0x00000001;
enum MAX_DEVICE_ID_LEN = 0x000000c8;
enum MAX_DEVNODE_ID_LEN = 0x000000c8;
enum MAX_GUID_STRING_LEN = 0x00000027;
enum MAX_CLASS_NAME_LEN = 0x00000020;
enum MAX_PROFILE_LEN = 0x00000050;
enum MAX_CONFIG_VALUE = 0x0000270f;
enum MAX_INSTANCE_VALUE = 0x0000270f;
enum MAX_MEM_REGISTERS = 0x00000009;
enum MAX_IO_PORTS = 0x00000014;
enum MAX_IRQS = 0x00000007;
enum MAX_DMA_CHANNELS = 0x00000007;
enum DWORD_MAX = 0xffffffff;
enum CONFIGMG_VERSION = 0x00000400;
enum CM_CDMASK_DEVINST = 0x00000001;
enum CM_CDMASK_RESDES = 0x00000002;
enum CM_CDMASK_FLAGS = 0x00000004;
enum CM_CDMASK_DESCRIPTION = 0x00000008;
enum CM_CDMASK_VALID = 0x0000000f;
enum CM_CDFLAGS_DRIVER = 0x00000001;
enum CM_CDFLAGS_ROOT_OWNED = 0x00000002;
enum CM_CDFLAGS_RESERVED = 0x00000004;
enum mMD_MemoryType = 0x00000001;
enum fMD_MemoryType = 0x00000001;
enum fMD_ROM = 0x00000000;
enum fMD_RAM = 0x00000001;
enum mMD_32_24 = 0x00000002;
enum fMD_32_24 = 0x00000002;
enum fMD_24 = 0x00000000;
enum fMD_32 = 0x00000002;
enum mMD_Prefetchable = 0x00000004;
enum fMD_Prefetchable = 0x00000004;
enum fMD_Pref = 0x00000004;
enum fMD_PrefetchDisallowed = 0x00000000;
enum fMD_PrefetchAllowed = 0x00000004;
enum mMD_Readable = 0x00000008;
enum fMD_Readable = 0x00000008;
enum fMD_ReadAllowed = 0x00000000;
enum fMD_ReadDisallowed = 0x00000008;
enum mMD_CombinedWrite = 0x00000010;
enum fMD_CombinedWrite = 0x00000010;
enum fMD_CombinedWriteDisallowed = 0x00000000;
enum fMD_CombinedWriteAllowed = 0x00000010;
enum mMD_Cacheable = 0x00000020;
enum fMD_NonCacheable = 0x00000000;
enum fMD_Cacheable = 0x00000020;
enum fMD_WINDOW_DECODE = 0x00000040;
enum fMD_MEMORY_BAR = 0x00000080;
enum fIOD_PortType = 0x00000001;
enum fIOD_Memory = 0x00000000;
enum fIOD_IO = 0x00000001;
enum fIOD_DECODE = 0x000000fc;
enum fIOD_10_BIT_DECODE = 0x00000004;
enum fIOD_12_BIT_DECODE = 0x00000008;
enum fIOD_16_BIT_DECODE = 0x00000010;
enum fIOD_POSITIVE_DECODE = 0x00000020;
enum fIOD_PASSIVE_DECODE = 0x00000040;
enum fIOD_WINDOW_DECODE = 0x00000080;
enum fIOD_PORT_BAR = 0x00000100;
enum IO_ALIAS_10_BIT_DECODE = 0x00000004;
enum IO_ALIAS_12_BIT_DECODE = 0x00000010;
enum IO_ALIAS_16_BIT_DECODE = 0x00000000;
enum IO_ALIAS_POSITIVE_DECODE = 0x000000ff;
enum IOA_Local = 0x000000ff;
enum mDD_Width = 0x00000003;
enum fDD_BYTE = 0x00000000;
enum fDD_WORD = 0x00000001;
enum fDD_DWORD = 0x00000002;
enum fDD_BYTE_AND_WORD = 0x00000003;
enum mDD_BusMaster = 0x00000004;
enum fDD_NoBusMaster = 0x00000000;
enum fDD_BusMaster = 0x00000004;
enum mDD_Type = 0x00000018;
enum fDD_TypeStandard = 0x00000000;
enum fDD_TypeA = 0x00000008;
enum fDD_TypeB = 0x00000010;
enum fDD_TypeF = 0x00000018;
enum mIRQD_Share = 0x00000001;
enum fIRQD_Exclusive = 0x00000000;
enum fIRQD_Share = 0x00000001;
enum fIRQD_Share_Bit = 0x00000000;
enum fIRQD_Level_Bit = 0x00000001;
enum mIRQD_Edge_Level = 0x00000002;
enum fIRQD_Level = 0x00000000;
enum fIRQD_Edge = 0x00000002;
enum CM_RESDES_WIDTH_DEFAULT = 0x00000000;
enum CM_RESDES_WIDTH_32 = 0x00000001;
enum CM_RESDES_WIDTH_64 = 0x00000002;
enum CM_RESDES_WIDTH_BITS = 0x00000003;
enum mPCD_IO_8_16 = 0x00000001;
enum fPCD_IO_8 = 0x00000000;
enum fPCD_IO_16 = 0x00000001;
enum mPCD_MEM_8_16 = 0x00000002;
enum fPCD_MEM_8 = 0x00000000;
enum fPCD_MEM_16 = 0x00000002;
enum mPCD_MEM_A_C = 0x0000000c;
enum fPCD_MEM1_A = 0x00000004;
enum fPCD_MEM2_A = 0x00000008;
enum fPCD_IO_ZW_8 = 0x00000010;
enum fPCD_IO_SRC_16 = 0x00000020;
enum fPCD_IO_WS_16 = 0x00000040;
enum mPCD_MEM_WS = 0x00000300;
enum fPCD_MEM_WS_ONE = 0x00000100;
enum fPCD_MEM_WS_TWO = 0x00000200;
enum fPCD_MEM_WS_THREE = 0x00000300;
enum fPCD_MEM_A = 0x00000004;
enum fPCD_ATTRIBUTES_PER_WINDOW = 0x00008000;
enum fPCD_IO1_16 = 0x00010000;
enum fPCD_IO1_ZW_8 = 0x00020000;
enum fPCD_IO1_SRC_16 = 0x00040000;
enum fPCD_IO1_WS_16 = 0x00080000;
enum fPCD_IO2_16 = 0x00100000;
enum fPCD_IO2_ZW_8 = 0x00200000;
enum fPCD_IO2_SRC_16 = 0x00400000;
enum fPCD_IO2_WS_16 = 0x00800000;
enum mPCD_MEM1_WS = 0x03000000;
enum fPCD_MEM1_WS_ONE = 0x01000000;
enum fPCD_MEM1_WS_TWO = 0x02000000;
enum fPCD_MEM1_WS_THREE = 0x03000000;
enum fPCD_MEM1_16 = 0x04000000;
enum mPCD_MEM2_WS = 0x30000000;
enum fPCD_MEM2_WS_ONE = 0x10000000;
enum fPCD_MEM2_WS_TWO = 0x20000000;
enum fPCD_MEM2_WS_THREE = 0x30000000;
enum fPCD_MEM2_16 = 0x40000000;
enum PCD_MAX_MEMORY = 0x00000002;
enum PCD_MAX_IO = 0x00000002;
enum mPMF_AUDIO_ENABLE = 0x00000008;
enum fPMF_AUDIO_ENABLE = 0x00000008;
enum CM_HWPI_NOT_DOCKABLE = 0x00000000;
enum CM_HWPI_UNDOCKED = 0x00000001;
enum CM_HWPI_DOCKED = 0x00000002;
enum ResType_All = 0x00000000;
enum ResType_None = 0x00000000;
enum ResType_Mem = 0x00000001;
enum ResType_IO = 0x00000002;
enum ResType_DMA = 0x00000003;
enum ResType_IRQ = 0x00000004;
enum ResType_DoNotUse = 0x00000005;
enum ResType_BusNumber = 0x00000006;
enum ResType_MemLarge = 0x00000007;
enum ResType_MAX = 0x00000007;
enum ResType_Ignored_Bit = 0x00008000;
enum ResType_ClassSpecific = 0x0000ffff;
enum ResType_Reserved = 0x00008000;
enum ResType_DevicePrivate = 0x00008001;
enum ResType_PcCardConfig = 0x00008002;
enum ResType_MfCardConfig = 0x00008003;
enum ResType_Connection = 0x00008004;
enum CM_ADD_RANGE_ADDIFCONFLICT = 0x00000000;
enum CM_ADD_RANGE_DONOTADDIFCONFLICT = 0x00000001;
enum CM_ADD_RANGE_BITS = 0x00000001;
enum BASIC_LOG_CONF = 0x00000000;
enum FILTERED_LOG_CONF = 0x00000001;
enum ALLOC_LOG_CONF = 0x00000002;
enum BOOT_LOG_CONF = 0x00000003;
enum FORCED_LOG_CONF = 0x00000004;
enum OVERRIDE_LOG_CONF = 0x00000005;
enum NUM_LOG_CONF = 0x00000006;
enum LOG_CONF_BITS = 0x00000007;
enum PRIORITY_EQUAL_FIRST = 0x00000008;
enum PRIORITY_EQUAL_LAST = 0x00000000;
enum PRIORITY_BIT = 0x00000008;
enum RegDisposition_OpenAlways = 0x00000000;
enum RegDisposition_OpenExisting = 0x00000001;
enum RegDisposition_Bits = 0x00000001;
enum CM_ADD_ID_HARDWARE = 0x00000000;
enum CM_ADD_ID_COMPATIBLE = 0x00000001;
enum CM_ADD_ID_BITS = 0x00000001;
enum CM_CREATE_DEVNODE_NORMAL = 0x00000000;
enum CM_CREATE_DEVNODE_NO_WAIT_INSTALL = 0x00000001;
enum CM_CREATE_DEVNODE_PHANTOM = 0x00000002;
enum CM_CREATE_DEVNODE_GENERATE_ID = 0x00000004;
enum CM_CREATE_DEVNODE_DO_NOT_INSTALL = 0x00000008;
enum CM_CREATE_DEVNODE_BITS = 0x0000000f;
enum CM_CREATE_DEVINST_NORMAL = 0x00000000;
enum CM_CREATE_DEVINST_NO_WAIT_INSTALL = 0x00000001;
enum CM_CREATE_DEVINST_PHANTOM = 0x00000002;
enum CM_CREATE_DEVINST_GENERATE_ID = 0x00000004;
enum CM_CREATE_DEVINST_DO_NOT_INSTALL = 0x00000008;
enum CM_CREATE_DEVINST_BITS = 0x0000000f;
enum CM_DELETE_CLASS_ONLY = 0x00000000;
enum CM_DELETE_CLASS_SUBKEYS = 0x00000001;
enum CM_DELETE_CLASS_INTERFACE = 0x00000002;
enum CM_DELETE_CLASS_BITS = 0x00000003;
enum CM_ENUMERATE_CLASSES_INSTALLER = 0x00000000;
enum CM_ENUMERATE_CLASSES_INTERFACE = 0x00000001;
enum CM_ENUMERATE_CLASSES_BITS = 0x00000001;
enum CM_DETECT_NEW_PROFILE = 0x00000001;
enum CM_DETECT_CRASHED = 0x00000002;
enum CM_DETECT_HWPROF_FIRST_BOOT = 0x00000004;
enum CM_DETECT_RUN = 0x80000000;
enum CM_DETECT_BITS = 0x80000007;
enum CM_DISABLE_POLITE = 0x00000000;
enum CM_DISABLE_ABSOLUTE = 0x00000001;
enum CM_DISABLE_HARDWARE = 0x00000002;
enum CM_DISABLE_UI_NOT_OK = 0x00000004;
enum CM_DISABLE_PERSIST = 0x00000008;
enum CM_DISABLE_BITS = 0x0000000f;
enum CM_GETIDLIST_FILTER_NONE = 0x00000000;
enum CM_GETIDLIST_FILTER_ENUMERATOR = 0x00000001;
enum CM_GETIDLIST_FILTER_SERVICE = 0x00000002;
enum CM_GETIDLIST_FILTER_EJECTRELATIONS = 0x00000004;
enum CM_GETIDLIST_FILTER_REMOVALRELATIONS = 0x00000008;
enum CM_GETIDLIST_FILTER_POWERRELATIONS = 0x00000010;
enum CM_GETIDLIST_FILTER_BUSRELATIONS = 0x00000020;
enum CM_GETIDLIST_DONOTGENERATE = 0x10000040;
enum CM_GETIDLIST_FILTER_BITS = 0x1000007f;
enum CM_GETIDLIST_FILTER_TRANSPORTRELATIONS = 0x00000080;
enum CM_GETIDLIST_FILTER_PRESENT = 0x00000100;
enum CM_GETIDLIST_FILTER_CLASS = 0x00000200;
enum CM_GET_DEVICE_INTERFACE_LIST_PRESENT = 0x00000000;
enum CM_GET_DEVICE_INTERFACE_LIST_ALL_DEVICES = 0x00000001;
enum CM_GET_DEVICE_INTERFACE_LIST_BITS = 0x00000001;
enum CM_DRP_DEVICEDESC = 0x00000001;
enum CM_DRP_HARDWAREID = 0x00000002;
enum CM_DRP_COMPATIBLEIDS = 0x00000003;
enum CM_DRP_UNUSED0 = 0x00000004;
enum CM_DRP_SERVICE = 0x00000005;
enum CM_DRP_UNUSED1 = 0x00000006;
enum CM_DRP_UNUSED2 = 0x00000007;
enum CM_DRP_CLASS = 0x00000008;
enum CM_DRP_CLASSGUID = 0x00000009;
enum CM_DRP_DRIVER = 0x0000000a;
enum CM_DRP_CONFIGFLAGS = 0x0000000b;
enum CM_DRP_MFG = 0x0000000c;
enum CM_DRP_FRIENDLYNAME = 0x0000000d;
enum CM_DRP_LOCATION_INFORMATION = 0x0000000e;
enum CM_DRP_PHYSICAL_DEVICE_OBJECT_NAME = 0x0000000f;
enum CM_DRP_CAPABILITIES = 0x00000010;
enum CM_DRP_UI_NUMBER = 0x00000011;
enum CM_DRP_UPPERFILTERS = 0x00000012;
enum CM_CRP_UPPERFILTERS = 0x00000012;
enum CM_DRP_LOWERFILTERS = 0x00000013;
enum CM_CRP_LOWERFILTERS = 0x00000013;
enum CM_DRP_BUSTYPEGUID = 0x00000014;
enum CM_DRP_LEGACYBUSTYPE = 0x00000015;
enum CM_DRP_BUSNUMBER = 0x00000016;
enum CM_DRP_ENUMERATOR_NAME = 0x00000017;
enum CM_DRP_SECURITY = 0x00000018;
enum CM_CRP_SECURITY = 0x00000018;
enum CM_DRP_SECURITY_SDS = 0x00000019;
enum CM_CRP_SECURITY_SDS = 0x00000019;
enum CM_DRP_DEVTYPE = 0x0000001a;
enum CM_CRP_DEVTYPE = 0x0000001a;
enum CM_DRP_EXCLUSIVE = 0x0000001b;
enum CM_CRP_EXCLUSIVE = 0x0000001b;
enum CM_DRP_CHARACTERISTICS = 0x0000001c;
enum CM_CRP_CHARACTERISTICS = 0x0000001c;
enum CM_DRP_ADDRESS = 0x0000001d;
enum CM_DRP_UI_NUMBER_DESC_FORMAT = 0x0000001e;
enum CM_DRP_DEVICE_POWER_DATA = 0x0000001f;
enum CM_DRP_REMOVAL_POLICY = 0x00000020;
enum CM_DRP_REMOVAL_POLICY_HW_DEFAULT = 0x00000021;
enum CM_DRP_REMOVAL_POLICY_OVERRIDE = 0x00000022;
enum CM_DRP_INSTALL_STATE = 0x00000023;
enum CM_DRP_LOCATION_PATHS = 0x00000024;
enum CM_DRP_BASE_CONTAINERID = 0x00000025;
enum CM_DRP_MIN = 0x00000001;
enum CM_CRP_MIN = 0x00000001;
enum CM_DRP_MAX = 0x00000025;
enum CM_CRP_MAX = 0x00000025;
enum CM_DEVCAP_LOCKSUPPORTED = 0x00000001;
enum CM_DEVCAP_EJECTSUPPORTED = 0x00000002;
enum CM_DEVCAP_REMOVABLE = 0x00000004;
enum CM_DEVCAP_DOCKDEVICE = 0x00000008;
enum CM_DEVCAP_UNIQUEID = 0x00000010;
enum CM_DEVCAP_SILENTINSTALL = 0x00000020;
enum CM_DEVCAP_RAWDEVICEOK = 0x00000040;
enum CM_DEVCAP_SURPRISEREMOVALOK = 0x00000080;
enum CM_DEVCAP_HARDWAREDISABLED = 0x00000100;
enum CM_DEVCAP_NONDYNAMIC = 0x00000200;
enum CM_DEVCAP_SECUREDEVICE = 0x00000400;
enum CM_REMOVAL_POLICY_EXPECT_NO_REMOVAL = 0x00000001;
enum CM_REMOVAL_POLICY_EXPECT_ORDERLY_REMOVAL = 0x00000002;
enum CM_REMOVAL_POLICY_EXPECT_SURPRISE_REMOVAL = 0x00000003;
enum CM_INSTALL_STATE_INSTALLED = 0x00000000;
enum CM_INSTALL_STATE_NEEDS_REINSTALL = 0x00000001;
enum CM_INSTALL_STATE_FAILED_INSTALL = 0x00000002;
enum CM_INSTALL_STATE_FINISH_INSTALL = 0x00000003;
enum CM_LOCATE_DEVNODE_NORMAL = 0x00000000;
enum CM_LOCATE_DEVNODE_PHANTOM = 0x00000001;
enum CM_LOCATE_DEVNODE_CANCELREMOVE = 0x00000002;
enum CM_LOCATE_DEVNODE_NOVALIDATION = 0x00000004;
enum CM_LOCATE_DEVNODE_BITS = 0x00000007;
enum CM_LOCATE_DEVINST_NORMAL = 0x00000000;
enum CM_LOCATE_DEVINST_PHANTOM = 0x00000001;
enum CM_LOCATE_DEVINST_CANCELREMOVE = 0x00000002;
enum CM_LOCATE_DEVINST_NOVALIDATION = 0x00000004;
enum CM_LOCATE_DEVINST_BITS = 0x00000007;
enum CM_OPEN_CLASS_KEY_INSTALLER = 0x00000000;
enum CM_OPEN_CLASS_KEY_INTERFACE = 0x00000001;
enum CM_OPEN_CLASS_KEY_BITS = 0x00000001;
enum CM_REMOVE_UI_OK = 0x00000000;
enum CM_REMOVE_UI_NOT_OK = 0x00000001;
enum CM_REMOVE_NO_RESTART = 0x00000002;
enum CM_REMOVE_DISABLE = 0x00000004;
enum CM_REMOVE_BITS = 0x00000007;
enum CM_QUERY_REMOVE_UI_OK = 0x00000000;
enum CM_QUERY_REMOVE_UI_NOT_OK = 0x00000001;
enum CM_REENUMERATE_NORMAL = 0x00000000;
enum CM_REENUMERATE_SYNCHRONOUS = 0x00000001;
enum CM_REENUMERATE_RETRY_INSTALLATION = 0x00000002;
enum CM_REENUMERATE_ASYNCHRONOUS = 0x00000004;
enum CM_REENUMERATE_BITS = 0x00000007;
enum CM_REGISTER_DEVICE_DRIVER_STATIC = 0x00000000;
enum CM_REGISTER_DEVICE_DRIVER_DISABLEABLE = 0x00000001;
enum CM_REGISTER_DEVICE_DRIVER_REMOVABLE = 0x00000002;
enum CM_REGISTER_DEVICE_DRIVER_BITS = 0x00000003;
enum CM_REGISTRY_HARDWARE = 0x00000000;
enum CM_REGISTRY_SOFTWARE = 0x00000001;
enum CM_REGISTRY_USER = 0x00000100;
enum CM_REGISTRY_CONFIG = 0x00000200;
enum CM_REGISTRY_BITS = 0x00000301;
enum CM_SET_DEVNODE_PROBLEM_NORMAL = 0x00000000;
enum CM_SET_DEVNODE_PROBLEM_OVERRIDE = 0x00000001;
enum CM_SET_DEVNODE_PROBLEM_BITS = 0x00000001;
enum CM_SET_DEVINST_PROBLEM_NORMAL = 0x00000000;
enum CM_SET_DEVINST_PROBLEM_OVERRIDE = 0x00000001;
enum CM_SET_DEVINST_PROBLEM_BITS = 0x00000001;
enum CM_SET_HW_PROF_FLAGS_UI_NOT_OK = 0x00000001;
enum CM_SET_HW_PROF_FLAGS_BITS = 0x00000001;
enum CM_SETUP_DEVNODE_READY = 0x00000000;
enum CM_SETUP_DEVINST_READY = 0x00000000;
enum CM_SETUP_DOWNLOAD = 0x00000001;
enum CM_SETUP_WRITE_LOG_CONFS = 0x00000002;
enum CM_SETUP_PROP_CHANGE = 0x00000003;
enum CM_SETUP_DEVNODE_RESET = 0x00000004;
enum CM_SETUP_DEVINST_RESET = 0x00000004;
enum CM_SETUP_DEVNODE_CONFIG = 0x00000005;
enum CM_SETUP_DEVINST_CONFIG = 0x00000005;
enum CM_SETUP_DEVNODE_CONFIG_CLASS = 0x00000006;
enum CM_SETUP_DEVINST_CONFIG_CLASS = 0x00000006;
enum CM_SETUP_DEVNODE_CONFIG_EXTENSIONS = 0x00000007;
enum CM_SETUP_DEVINST_CONFIG_EXTENSIONS = 0x00000007;
enum CM_SETUP_DEVNODE_CONFIG_RESET = 0x00000008;
enum CM_SETUP_DEVINST_CONFIG_RESET = 0x00000008;
enum CM_SETUP_BITS = 0x0000000f;
enum CM_QUERY_ARBITRATOR_RAW = 0x00000000;
enum CM_QUERY_ARBITRATOR_TRANSLATED = 0x00000001;
enum CM_QUERY_ARBITRATOR_BITS = 0x00000001;
enum CM_CUSTOMDEVPROP_MERGE_MULTISZ = 0x00000001;
enum CM_CUSTOMDEVPROP_BITS = 0x00000001;
enum CM_NAME_ATTRIBUTE_NAME_RETRIEVED_FROM_DEVICE = 0x00000001;
enum CM_NAME_ATTRIBUTE_USER_ASSIGNED_NAME = 0x00000002;
enum CM_CLASS_PROPERTY_INSTALLER = 0x00000000;
enum CM_CLASS_PROPERTY_INTERFACE = 0x00000001;
enum CM_CLASS_PROPERTY_BITS = 0x00000001;
enum CM_NOTIFY_FILTER_FLAG_ALL_INTERFACE_CLASSES = 0x00000001;
enum CM_NOTIFY_FILTER_FLAG_ALL_DEVICE_INSTANCES = 0x00000002;
enum CM_GLOBAL_STATE_CAN_DO_UI = 0x00000001;
enum CM_GLOBAL_STATE_ON_BIG_STACK = 0x00000002;
enum CM_GLOBAL_STATE_SERVICES_AVAILABLE = 0x00000004;
enum CM_GLOBAL_STATE_SHUTTING_DOWN = 0x00000008;
enum CM_GLOBAL_STATE_DETECTION_PENDING = 0x00000010;
enum CM_GLOBAL_STATE_REBOOT_REQUIRED = 0x00000020;
enum INSTALLFLAG_FORCE = 0x00000001;
enum INSTALLFLAG_READONLY = 0x00000002;
enum INSTALLFLAG_NONINTERACTIVE = 0x00000004;
enum INSTALLFLAG_BITS = 0x00000007;
enum DIIDFLAG_SHOWSEARCHUI = 0x00000001;
enum DIIDFLAG_NOFINISHINSTALLUI = 0x00000002;
enum DIIDFLAG_INSTALLNULLDRIVER = 0x00000004;
enum DIIDFLAG_INSTALLCOPYINFDRIVERS = 0x00000008;
enum DIIDFLAG_BITS = 0x0000000f;
enum DIIRFLAG_INF_ALREADY_COPIED = 0x00000001;
enum DIIRFLAG_FORCE_INF = 0x00000002;
enum DIIRFLAG_HW_USING_THE_INF = 0x00000004;
enum DIIRFLAG_HOTPATCH = 0x00000008;
enum DIIRFLAG_NOBACKUP = 0x00000010;
enum DIIRFLAG_PRE_CONFIGURE_INF = 0x00000020;
enum DIIRFLAG_INSTALL_AS_SET = 0x00000040;
enum DIURFLAG_NO_REMOVE_INF = 0x00000001;
enum DIURFLAG_RESERVED = 0x00000002;
enum ROLLBACK_FLAG_NO_UI = 0x00000001;
enum ROLLBACK_BITS = 0x00000001;
enum MAX_KEY_LEN = 0x00000064;
enum SZ_KEY_OPTIONDESC = "OptionDesc";
enum SZ_KEY_LDIDOEM = "LdidOEM";
enum SZ_KEY_SRCDISKFILES = "SourceDisksFiles";
enum SZ_KEY_SRCDISKNAMES = "SourceDisksNames";
enum SZ_KEY_STRINGS = "Strings";
enum SZ_KEY_DESTDIRS = "DestinationDirs";
enum SZ_KEY_LAYOUT_FILE = "LayoutFile";
enum SZ_KEY_DEFDESTDIR = "DefaultDestDir";
enum SZ_KEY_LFN_SECTION = "VarLDID.LFN";
enum SZ_KEY_SFN_SECTION = "VarLDID.SFN";
enum SZ_KEY_UPDATEINIS = "UpdateInis";
enum SZ_KEY_UPDATEINIFIELDS = "UpdateIniFields";
enum SZ_KEY_INI2REG = "Ini2Reg";
enum SZ_KEY_COPYFILES = "CopyFiles";
enum SZ_KEY_RENFILES = "RenFiles";
enum SZ_KEY_DELFILES = "DelFiles";
enum SZ_KEY_ADDREG = "AddReg";
enum SZ_KEY_ADDREGNOCLOBBER = "AddRegNoClobber";
enum SZ_KEY_DELREG = "DelReg";
enum SZ_KEY_BITREG = "BitReg";
enum SZ_KEY_COPYINF = "CopyINF";
enum SZ_KEY_LOGCONFIG = "LogConfig";
enum SZ_KEY_ADDSERVICE = "AddService";
enum SZ_KEY_DELSERVICE = "DelService";
enum SZ_KEY_ADDTRIGGER = "AddTrigger";
enum SZ_KEY_ADDINTERFACE = "AddInterface";
enum SZ_KEY_ADDIME = "AddIme";
enum SZ_KEY_DELIME = "DelIme";
enum SZ_KEY_REGSVR = "RegisterDlls";
enum SZ_KEY_UNREGSVR = "UnregisterDlls";
enum SZ_KEY_PROFILEITEMS = "ProfileItems";
enum SZ_KEY_MODULES = "Modules";
enum SZ_KEY_DEFAULTOPTION = "DefaultOption";
enum SZ_KEY_LISTOPTIONS = "ListOptions";
enum SZ_KEY_CLEANONLY = "CleanOnly";
enum SZ_KEY_UPGRADEONLY = "UpgradeOnly";
enum SZ_KEY_EXCLUDEID = "ExcludeId";
enum SZ_KEY_ADDPOWERSETTING = "AddPowerSetting";
enum SZ_KEY_ADDPROP = "AddProperty";
enum SZ_KEY_DELPROP = "DelProperty";
enum SZ_KEY_FEATURESCORE = "FeatureScore";
enum SZ_KEY_ADDEVENTPROVIDER = "AddEventProvider";
enum SZ_KEY_ADDCHANNEL = "AddChannel";
enum SZ_KEY_IMPORTCHANNEL = "ImportChannel";
enum SZ_KEY_ADDAUTOLOGGER = "AddAutoLogger";
enum SZ_KEY_UPDATEAUTOLOGGER = "UpdateAutoLogger";
enum SZ_KEY_ADDAUTOLOGGERPROVIDER = "AddAutoLoggerProvider";
enum SZ_KEY_ADDFILTER = "AddFilter";
enum SZ_KEY_FILTERLEVEL = "FilterLevel";
enum SZ_KEY_FILTERPOSITION = "FilterPosition";
enum SZ_KEY_PHASE1 = "Phase1";
enum SZ_KEY_HARDWARE = "Hardware";
enum INFSTR_KEY_CONFIGPRIORITY = "ConfigPriority";
enum MAX_PRIORITYSTR_LEN = 0x00000010;
enum INFSTR_CFGPRI_HARDWIRED = "HARDWIRED";
enum INFSTR_CFGPRI_DESIRED = "DESIRED";
enum INFSTR_CFGPRI_NORMAL = "NORMAL";
enum INFSTR_CFGPRI_SUBOPTIMAL = "SUBOPTIMAL";
enum INFSTR_CFGPRI_DISABLED = "DISABLED";
enum INFSTR_CFGPRI_RESTART = "RESTART";
enum INFSTR_CFGPRI_REBOOT = "REBOOT";
enum INFSTR_CFGPRI_POWEROFF = "POWEROFF";
enum INFSTR_CFGPRI_HARDRECONFIG = "HARDRECONFIG";
enum INFSTR_CFGPRI_FORCECONFIG = "FORCECONFIG";
enum INFSTR_CFGTYPE_BASIC = "BASIC";
enum INFSTR_CFGTYPE_FORCED = "FORCED";
enum INFSTR_CFGTYPE_OVERRIDE = "OVERRIDE";
enum INFSTR_KEY_MEMCONFIG = "MemConfig";
enum INFSTR_KEY_MEMLARGECONFIG = "MemLargeConfig";
enum INFSTR_KEY_IOCONFIG = "IOConfig";
enum INFSTR_KEY_IRQCONFIG = "IRQConfig";
enum INFSTR_KEY_DMACONFIG = "DMAConfig";
enum INFSTR_KEY_PCCARDCONFIG = "PcCardConfig";
enum INFSTR_KEY_MFCARDCONFIG = "MfCardConfig";
enum INFSTR_SECT_CLASS_INSTALL = "ClassInstall";
enum INFSTR_SECT_CLASS_INSTALL_32 = "ClassInstall32";
enum INFSTR_SECT_DEFAULT_INSTALL = "DefaultInstall";
enum INFSTR_SECT_DEFAULT_UNINSTALL = "DefaultUninstall";
enum INFSTR_SECT_INTERFACE_INSTALL_32 = "InterfaceInstall32";
enum INFSTR_SECT_VERSION = "Version";
enum INFSTR_KEY_PROVIDER = "Provider";
enum INFSTR_KEY_SIGNATURE = "Signature";
enum INFSTR_KEY_DRIVERSET = "DriverSet";
enum MAX_INF_FLAG = 0x00000014;
enum INFSTR_KEY_HARDWARE_CLASS = "Class";
enum INFSTR_KEY_HARDWARE_CLASSGUID = "ClassGUID";
enum INFSTR_KEY_NOSETUPINF = "NoSetupInf";
enum INFSTR_KEY_FROMINET = "FromINet";
enum INFSTR_KEY_CATALOGFILE = "CatalogFile";
enum INFSTR_KEY_PNPLOCKDOWN = "PnpLockDown";
enum INFSTR_KEY_EXTENSIONID = "ExtensionId";
enum INFSTR_SECT_MFG = "Manufacturer";
enum INFSTR_SECT_TARGETCOMPUTERS = "TargetComputers";
enum INFSTR_SECT_EXTENSIONCONTRACTS = "ExtensionContracts";
enum INFSTR_KEY_CLASS = "Class";
enum INFSTR_KEY_CLASSGUID = "ClassGUID";
enum INFSTR_RESTART = "Restart";
enum INFSTR_REBOOT = "Reboot";
enum INFSTR_KEY_DISPLAYNAME = "DisplayName";
enum INFSTR_KEY_SERVICETYPE = "ServiceType";
enum INFSTR_KEY_STARTTYPE = "StartType";
enum INFSTR_KEY_ERRORCONTROL = "ErrorControl";
enum INFSTR_KEY_SERVICEBINARY = "ServiceBinary";
enum INFSTR_KEY_LOADORDERGROUP = "LoadOrderGroup";
enum INFSTR_KEY_DEPENDENCIES = "Dependencies";
enum INFSTR_KEY_REQUIREDPRIVILEGES = "RequiredPrivileges";
enum INFSTR_KEY_STARTNAME = "StartName";
enum INFSTR_KEY_SECURITY = "Security";
enum INFSTR_KEY_DESCRIPTION = "Description";
enum INFSTR_KEY_SERVICESIDTYPE = "ServiceSidType";
enum INFSTR_KEY_DELAYEDAUTOSTART = "DelayedAutoStart";
enum INFSTR_KEY_TRIGGER_TYPE = "TriggerType";
enum INFSTR_KEY_ACTION = "Action";
enum INFSTR_KEY_SUB_TYPE = "SubType";
enum INFSTR_KEY_DATA_ITEM = "DataItem";
enum INFSTR_KEY_PROVIDER_NAME = "ProviderName";
enum INFSTR_KEY_RESOURCE_FILE = "ResourceFile";
enum INFSTR_KEY_MESSAGE_FILE = "MessageFile";
enum INFSTR_KEY_PARAMETER_FILE = "ParameterFile";
enum INFSTR_KEY_CHANNEL_ACCESS = "Access";
enum INFSTR_KEY_CHANNEL_ISOLATION = "Isolation";
enum INFSTR_KEY_CHANNEL_ENABLED = "Enabled";
enum INFSTR_KEY_CHANNEL_VALUE = "Value";
enum INFSTR_KEY_LOGGING_MAXSIZE = "LoggingMaxSize";
enum INFSTR_KEY_LOGGING_RETENTION = "LoggingRetention";
enum INFSTR_KEY_LOGGING_AUTOBACKUP = "LoggingAutoBackup";
enum INFSTR_KEY_START = "Start";
enum INFSTR_KEY_BUFFER_SIZE = "BufferSize";
enum INFSTR_KEY_CLOCK_TYPE = "ClockType";
enum INFSTR_KEY_DISABLE_REALTIME_PERSISTENCE = "DisableRealtimePersistence";
enum INFSTR_KEY_FILE_NAME = "FileName";
enum INFSTR_KEY_FILE_MAX = "FileMax";
enum INFSTR_KEY_FLUSH_TIMER = "FlushTimer";
enum INFSTR_KEY_LOG_FILE_MODE = "LogFileMode";
enum INFSTR_KEY_MAX_FILE_SIZE = "MaxFileSize";
enum INFSTR_KEY_MAXIMUM_BUFFERS = "MaximumBuffers";
enum INFSTR_KEY_MINIMUM_BUFFERS = "MinimumBuffers";
enum INFSTR_KEY_ENABLED = "Enabled";
enum INFSTR_KEY_ENABLE_FLAGS = "EnableFlags";
enum INFSTR_KEY_ENABLE_LEVEL = "EnableLevel";
enum INFSTR_KEY_ENABLE_PROPERTY = "EnableProperty";
enum INFSTR_KEY_MATCH_ANY_KEYWORD = "MatchAnyKeyword";
enum INFSTR_KEY_MATCH_ALL_KEYWORD = "MatchAllKeyword";
enum INFSTR_SECT_DETMODULES = "Det.Modules";
enum INFSTR_SECT_DETCLASSINFO = "Det.ClassInfo";
enum INFSTR_SECT_MANUALDEV = "Det.ManualDev";
enum INFSTR_SECT_AVOIDCFGSYSDEV = "Det.AvoidCfgSysDev";
enum INFSTR_SECT_REGCFGSYSDEV = "Det.RegCfgSysDev";
enum INFSTR_SECT_DEVINFS = "Det.DevINFs";
enum INFSTR_SECT_AVOIDINIDEV = "Det.AvoidIniDev";
enum INFSTR_SECT_AVOIDENVDEV = "Det.AvoidEnvDev";
enum INFSTR_SECT_REGINIDEV = "Det.RegIniDev";
enum INFSTR_SECT_REGENVDEV = "Det.RegEnvDev";
enum INFSTR_SECT_HPOMNIBOOK = "Det.HPOmnibook";
enum INFSTR_SECT_FORCEHWVERIFY = "Det.ForceHWVerify";
enum INFSTR_SECT_DETOPTIONS = "Det.Options";
enum INFSTR_SECT_BADPNPBIOS = "BadPnpBios";
enum INFSTR_SECT_GOODACPIBIOS = "GoodACPIBios";
enum INFSTR_SECT_BADACPIBIOS = "BadACPIBios";
enum INFSTR_SECT_BADROUTINGTABLEBIOS = "BadPCIIRQRoutingTableBios";
enum INFSTR_SECT_BADPMCALLBIOS = "BadProtectedModeCallBios";
enum INFSTR_SECT_BADRMCALLBIOS = "BadRealModeCallBios";
enum INFSTR_SECT_MACHINEIDBIOS = "MachineIDBios";
enum INFSTR_SECT_BADDISKBIOS = "BadDiskBios";
enum INFSTR_SECT_BADDSBIOS = "BadDSBios";
enum INFSTR_KEY_DETPARAMS = "Params";
enum INFSTR_KEY_SKIPLIST = "SkipList";
enum INFSTR_KEY_DETECTLIST = "DetectList";
enum INFSTR_KEY_EXCLUDERES = "ExcludeRes";
enum INFSTR_SUBKEY_LOGCONFIG = "LogConfig";
enum INFSTR_SUBKEY_DET = "Det";
enum INFSTR_SUBKEY_FACTDEF = "FactDef";
enum INFSTR_SUBKEY_POSSIBLEDUPS = "PosDup";
enum INFSTR_SUBKEY_NORESOURCEDUPS = "NoResDup";
enum INFSTR_SUBKEY_HW = "Hw";
enum INFSTR_SUBKEY_CTL = "CTL";
enum INFSTR_SUBKEY_SERVICES = "Services";
enum INFSTR_SUBKEY_SOFTWARE = "Software";
enum INFSTR_SUBKEY_INTERFACES = "Interfaces";
enum INFSTR_SUBKEY_COINSTALLERS = "CoInstallers";
enum INFSTR_SUBKEY_LOGCONFIGOVERRIDE = "LogConfigOverride";
enum INFSTR_SUBKEY_WMI = "WMI";
enum INFSTR_SUBKEY_EVENTS = "Events";
enum INFSTR_SUBKEY_FILTERS = "Filters";
enum INFSTR_CONTROLFLAGS_SECTION = "ControlFlags";
enum INFSTR_KEY_COPYFILESONLY = "CopyFilesOnly";
enum INFSTR_KEY_EXCLUDEFROMSELECT = "ExcludeFromSelect";
enum INFSTR_KEY_ALWAYSEXCLUDEFROMSELECT = "AlwaysExcludeFromSelect";
enum INFSTR_KEY_INTERACTIVEINSTALL = "InteractiveInstall";
enum INFSTR_KEY_REQUESTADDITIONALSOFTWARE = "RequestAdditionalSoftware";
enum INFSTR_PLATFORM_WIN = "Win";
enum INFSTR_PLATFORM_NT = "NT";
enum INFSTR_PLATFORM_NTX86 = "NTx86";
enum INFSTR_PLATFORM_NTMIPS = "NTMIPS";
enum INFSTR_PLATFORM_NTALPHA = "NTAlpha";
enum INFSTR_PLATFORM_NTPPC = "NTPPC";
enum INFSTR_PLATFORM_NTIA64 = "NTIA64";
enum INFSTR_PLATFORM_NTAXP64 = "NTAXP64";
enum INFSTR_PLATFORM_NTAMD64 = "NTAMD64";
enum INFSTR_PLATFORM_NTARM = "NTARM";
enum INFSTR_PLATFORM_NTARM64 = "NTARM64";
enum MAX_INFSTR_STRKEY_LEN = 0x00000020;
enum INFSTR_STRKEY_DRVDESC = "DriverDesc";
enum INFSTR_DRIVERSELECT_SECTION = "DriverSelect";
enum INFSTR_DRIVERSELECT_FUNCTIONS = "DriverSelectFunctions";
enum INFSTR_DRIVERVERSION_SECTION = "DriverVer";
enum INFSTR_SOFTWAREVERSION_SECTION = "SoftwareVersion";
enum INFSTR_SECT_CFGSYS = "ConfigSysDrivers";
enum INFSTR_SECT_AUTOEXECBAT = "AutoexecBatDrivers";
enum INFSTR_SECT_SYSINI = "SystemIniDrivers";
enum INFSTR_SECT_SYSINIDRV = "SystemIniDriversLine";
enum INFSTR_SECT_WININIRUN = "WinIniRunLine";
enum INFSTR_KEY_PATH = "Path";
enum INFSTR_KEY_NAME = "Name";
enum INFSTR_KEY_IO = "IO";
enum INFSTR_KEY_MEM = "Mem";
enum INFSTR_KEY_IRQ = "IRQ";
enum INFSTR_KEY_DMA = "DMA";
enum INFSTR_BUS_ISA = "BUS_ISA";
enum INFSTR_BUS_EISA = "BUS_EISA";
enum INFSTR_BUS_MCA = "BUS_MCA";
enum INFSTR_BUS_ALL = "BUS_ALL";
enum INFSTR_RISK_NONE = "RISK_NONE";
enum INFSTR_RISK_VERYLOW = "RISK_VERYLOW";
enum INFSTR_RISK_BIOSROMRD = "RISK_BIOSROMRD";
enum INFSTR_RISK_QUERYDRV = "RISK_QUERYDRV";
enum INFSTR_RISK_SWINT = "RISK_SWINT";
enum INFSTR_RISK_LOW = "RISK_LOW";
enum INFSTR_RISK_DELICATE = "RISK_DELICATE";
enum INFSTR_RISK_MEMRD = "RISK_MEMRD";
enum INFSTR_RISK_IORD = "RISK_IORD";
enum INFSTR_RISK_MEMWR = "RISK_MEMWR";
enum INFSTR_RISK_IOWR = "RISK_IOWR";
enum INFSTR_RISK_UNRELIABLE = "RISK_UNRELIABLE";
enum INFSTR_RISK_VERYHIGH = "RISK_VERYHIGH";
enum INFSTR_CLASS_SAFEEXCL = "SAFE_EXCL";
enum INFSTR_SECT_DISPLAY_CLEANUP = "DisplayCleanup";
enum GUID_HWPROFILE_QUERY_CHANGE = GUID(0xcb3a4001, 0x46f0, 0x11d0, [0xb0, 0x8f, 0x0, 0x60, 0x97, 0x13, 0x5, 0x3f]);
enum GUID_HWPROFILE_CHANGE_CANCELLED = GUID(0xcb3a4002, 0x46f0, 0x11d0, [0xb0, 0x8f, 0x0, 0x60, 0x97, 0x13, 0x5, 0x3f]);
enum GUID_HWPROFILE_CHANGE_COMPLETE = GUID(0xcb3a4003, 0x46f0, 0x11d0, [0xb0, 0x8f, 0x0, 0x60, 0x97, 0x13, 0x5, 0x3f]);
enum GUID_DEVICE_INTERFACE_ARRIVAL = GUID(0xcb3a4004, 0x46f0, 0x11d0, [0xb0, 0x8f, 0x0, 0x60, 0x97, 0x13, 0x5, 0x3f]);
enum GUID_DEVICE_INTERFACE_REMOVAL = GUID(0xcb3a4005, 0x46f0, 0x11d0, [0xb0, 0x8f, 0x0, 0x60, 0x97, 0x13, 0x5, 0x3f]);
enum GUID_TARGET_DEVICE_QUERY_REMOVE = GUID(0xcb3a4006, 0x46f0, 0x11d0, [0xb0, 0x8f, 0x0, 0x60, 0x97, 0x13, 0x5, 0x3f]);
enum GUID_TARGET_DEVICE_REMOVE_CANCELLED = GUID(0xcb3a4007, 0x46f0, 0x11d0, [0xb0, 0x8f, 0x0, 0x60, 0x97, 0x13, 0x5, 0x3f]);
enum GUID_TARGET_DEVICE_REMOVE_COMPLETE = GUID(0xcb3a4008, 0x46f0, 0x11d0, [0xb0, 0x8f, 0x0, 0x60, 0x97, 0x13, 0x5, 0x3f]);
enum GUID_PNP_CUSTOM_NOTIFICATION = GUID(0xaca73f8e, 0x8d23, 0x11d1, [0xac, 0x7d, 0x0, 0x0, 0xf8, 0x75, 0x71, 0xd0]);
enum GUID_PNP_POWER_NOTIFICATION = GUID(0xc2cf0660, 0xeb7a, 0x11d1, [0xbd, 0x7f, 0x0, 0x0, 0xf8, 0x75, 0x71, 0xd0]);
enum GUID_PNP_POWER_SETTING_CHANGE = GUID(0x29c69b3e, 0xc79a, 0x43bf, [0xbb, 0xde, 0xa9, 0x32, 0xfa, 0x1b, 0xea, 0x7e]);
enum GUID_TARGET_DEVICE_TRANSPORT_RELATIONS_CHANGED = GUID(0xfcf528f6, 0xa82f, 0x47b1, [0xad, 0x3a, 0x80, 0x50, 0x59, 0x4c, 0xad, 0x28]);
enum GUID_KERNEL_SOFT_RESTART_PREPARE = GUID(0xde373def, 0xa85c, 0x4f76, [0x8c, 0xbf, 0xf9, 0x6b, 0xea, 0x8b, 0xd1, 0xf]);
enum GUID_KERNEL_SOFT_RESTART_CANCEL = GUID(0x31d737e7, 0x8c0b, 0x468a, [0x95, 0x6e, 0x9f, 0x43, 0x3e, 0xc3, 0x58, 0xfb]);
enum GUID_RECOVERY_PCI_PREPARE_SHUTDOWN = GUID(0x90d889de, 0x8704, 0x44cf, [0x81, 0x15, 0xed, 0x85, 0x28, 0xd2, 0xb2, 0xda]);
enum GUID_RECOVERY_NVMED_PREPARE_SHUTDOWN = GUID(0x4b9770ea, 0xbde7, 0x400b, [0xa9, 0xb9, 0x4f, 0x68, 0x4f, 0x54, 0xcc, 0x2a]);
enum GUID_KERNEL_SOFT_RESTART_FINALIZE = GUID(0x20e91abd, 0x350a, 0x4d4f, [0x85, 0x77, 0x99, 0xc8, 0x15, 0x7, 0x47, 0x3a]);
enum GUID_BUS_INTERFACE_STANDARD = GUID(0x496b8280, 0x6f25, 0x11d0, [0xbe, 0xaf, 0x8, 0x0, 0x2b, 0xe2, 0x9, 0x2f]);
enum GUID_PCI_BUS_INTERFACE_STANDARD = GUID(0x496b8281, 0x6f25, 0x11d0, [0xbe, 0xaf, 0x8, 0x0, 0x2b, 0xe2, 0x9, 0x2f]);
enum GUID_PCI_BUS_INTERFACE_STANDARD2 = GUID(0xde94e966, 0xfdff, 0x4c9c, [0x99, 0x98, 0x67, 0x47, 0xb1, 0x50, 0xe7, 0x4c]);
enum GUID_ARBITER_INTERFACE_STANDARD = GUID(0xe644f185, 0x8c0e, 0x11d0, [0xbe, 0xcf, 0x8, 0x0, 0x2b, 0xe2, 0x9, 0x2f]);
enum GUID_TRANSLATOR_INTERFACE_STANDARD = GUID(0x6c154a92, 0xaacf, 0x11d0, [0x8d, 0x2a, 0x0, 0xa0, 0xc9, 0x6, 0xb2, 0x44]);
enum GUID_ACPI_INTERFACE_STANDARD = GUID(0xb091a08a, 0xba97, 0x11d0, [0xbd, 0x14, 0x0, 0xaa, 0x0, 0xb7, 0xb3, 0x2a]);
enum GUID_INT_ROUTE_INTERFACE_STANDARD = GUID(0x70941bf4, 0x73, 0x11d1, [0xa0, 0x9e, 0x0, 0xc0, 0x4f, 0xc3, 0x40, 0xb1]);
enum GUID_PCMCIA_BUS_INTERFACE_STANDARD = GUID(0x76173af0, 0xc504, 0x11d1, [0x94, 0x7f, 0x0, 0xc0, 0x4f, 0xb9, 0x60, 0xee]);
enum GUID_ACPI_REGS_INTERFACE_STANDARD = GUID(0x6141966, 0x7245, 0x6369, [0x46, 0x2e, 0x4e, 0x65, 0x6c, 0x73, 0x6f, 0x6e]);
enum GUID_LEGACY_DEVICE_DETECTION_STANDARD = GUID(0x50feb0de, 0x596a, 0x11d2, [0xa5, 0xb8, 0x0, 0x0, 0xf8, 0x1a, 0x46, 0x19]);
enum GUID_PCI_DEVICE_PRESENT_INTERFACE = GUID(0xd1b82c26, 0xbf49, 0x45ef, [0xb2, 0x16, 0x71, 0xcb, 0xd7, 0x88, 0x9b, 0x57]);
enum GUID_MF_ENUMERATION_INTERFACE = GUID(0xaeb895f0, 0x5586, 0x11d1, [0x8d, 0x84, 0x0, 0xa0, 0xc9, 0x6, 0xb2, 0x44]);
enum GUID_REENUMERATE_SELF_INTERFACE_STANDARD = GUID(0x2aeb0243, 0x6a6e, 0x486b, [0x82, 0xfc, 0xd8, 0x15, 0xf6, 0xb9, 0x70, 0x6]);
enum GUID_AGP_TARGET_BUS_INTERFACE_STANDARD = GUID(0xb15cfce8, 0x6d1, 0x4d37, [0x9d, 0x4c, 0xbe, 0xdd, 0xe0, 0xc2, 0xa6, 0xff]);
enum GUID_ACPI_CMOS_INTERFACE_STANDARD = GUID(0x3a8d0384, 0x6505, 0x40ca, [0xbc, 0x39, 0x56, 0xc1, 0x5f, 0x8c, 0x5f, 0xed]);
enum GUID_ACPI_PORT_RANGES_INTERFACE_STANDARD = GUID(0xf14f609b, 0xcbbd, 0x4957, [0xa6, 0x74, 0xbc, 0x0, 0x21, 0x3f, 0x1c, 0x97]);
enum GUID_ACPI_INTERFACE_STANDARD2 = GUID(0xe8695f63, 0x1831, 0x4870, [0xa8, 0xcf, 0x9c, 0x2f, 0x3, 0xf9, 0xdc, 0xb5]);
enum GUID_PNP_LOCATION_INTERFACE = GUID(0x70211b0e, 0xafb, 0x47db, [0xaf, 0xc1, 0x41, 0xb, 0xf8, 0x42, 0x49, 0x7a]);
enum GUID_PCI_EXPRESS_LINK_QUIESCENT_INTERFACE = GUID(0x146cd41c, 0xdae3, 0x4437, [0x8a, 0xff, 0x2a, 0xf3, 0xf0, 0x38, 0x9, 0x9b]);
enum GUID_PCI_EXPRESS_ROOT_PORT_INTERFACE = GUID(0x83a7734a, 0x84c7, 0x4161, [0x9a, 0x98, 0x60, 0x0, 0xed, 0xc, 0x4a, 0x33]);
enum GUID_MSIX_TABLE_CONFIG_INTERFACE = GUID(0x1a6a460b, 0x194f, 0x455d, [0xb3, 0x4b, 0xb8, 0x4c, 0x5b, 0x5, 0x71, 0x2b]);
enum GUID_D3COLD_SUPPORT_INTERFACE = GUID(0xb38290e5, 0x3cd0, 0x4f9d, [0x99, 0x37, 0xf5, 0xfe, 0x2b, 0x44, 0xd4, 0x7a]);
enum GUID_PROCESSOR_PCC_INTERFACE_STANDARD = GUID(0x37b17e9a, 0xc21c, 0x4296, [0x97, 0x2d, 0x11, 0xc4, 0xb3, 0x2b, 0x28, 0xf0]);
enum GUID_PCI_VIRTUALIZATION_INTERFACE = GUID(0x64897b47, 0x3a4a, 0x4d75, [0xbc, 0x74, 0x89, 0xdd, 0x6c, 0x7, 0x82, 0x93]);
enum GUID_PCC_INTERFACE_STANDARD = GUID(0x3ee8ba63, 0xf59, 0x4a24, [0x8a, 0x45, 0x35, 0x80, 0x8b, 0xdd, 0x12, 0x49]);
enum GUID_PCC_INTERFACE_INTERNAL = GUID(0x7cce62ce, 0xc189, 0x4814, [0xa6, 0xa7, 0x12, 0x11, 0x20, 0x89, 0xe9, 0x38]);
enum GUID_THERMAL_COOLING_INTERFACE = GUID(0xecbe47a8, 0xc498, 0x4bb9, [0xbd, 0x70, 0xe8, 0x67, 0xe0, 0x94, 0xd, 0x22]);
enum GUID_DMA_CACHE_COHERENCY_INTERFACE = GUID(0xb520f7fa, 0x8a5a, 0x4e40, [0xa3, 0xf6, 0x6b, 0xe1, 0xe1, 0x62, 0xd9, 0x35]);
enum GUID_DEVICE_RESET_INTERFACE_STANDARD = GUID(0x649fdf26, 0x3bc0, 0x4813, [0xad, 0x24, 0x7e, 0xc, 0x1e, 0xda, 0x3f, 0xa3]);
enum GUID_IOMMU_BUS_INTERFACE = GUID(0x1efee0b2, 0xd278, 0x4ae4, [0xbd, 0xdc, 0x1b, 0x34, 0xdd, 0x64, 0x80, 0x43]);
enum GUID_PCI_SECURITY_INTERFACE = GUID(0x6e7f1451, 0x199e, 0x4acc, [0xba, 0x2d, 0x76, 0x2b, 0x4e, 0xdf, 0x46, 0x74]);
enum GUID_SCM_BUS_INTERFACE = GUID(0x25944783, 0xce79, 0x4232, [0x81, 0x5e, 0x4a, 0x30, 0x1, 0x4e, 0x8e, 0xb4]);
enum GUID_SECURE_DRIVER_INTERFACE = GUID(0x370f67e1, 0x4ff5, 0x4a94, [0x9a, 0x35, 0x6, 0xc5, 0xd9, 0xcc, 0x30, 0xe2]);
enum GUID_SDEV_IDENTIFIER_INTERFACE = GUID(0x49d67af8, 0x916c, 0x4ee8, [0x9d, 0xf1, 0x88, 0x9f, 0x17, 0xd2, 0x1e, 0x91]);
enum GUID_SCM_BUS_NVD_INTERFACE = GUID(0x8de064ff, 0xb630, 0x42e4, [0x88, 0xea, 0x6f, 0x24, 0xc8, 0x64, 0x11, 0x75]);
enum GUID_SCM_BUS_LD_INTERFACE = GUID(0x9b89307d, 0xd76b, 0x4f48, [0xb1, 0x86, 0x54, 0x4, 0x1a, 0xe9, 0x2e, 0x8d]);
enum GUID_SCM_PHYSICAL_NVDIMM_INTERFACE = GUID(0x79c21b, 0x917e, 0x405e, [0xa9, 0xce, 0x7, 0x32, 0xb5, 0xbb, 0xce, 0xbd]);
enum GUID_PNP_EXTENDED_ADDRESS_INTERFACE = GUID(0xb8e992ec, 0xa797, 0x4dc4, [0x88, 0x46, 0x84, 0xd0, 0x41, 0x70, 0x74, 0x46]);
enum GUID_D3COLD_AUX_POWER_AND_TIMING_INTERFACE = GUID(0x44d8aa, 0xf664, 0x4588, [0x9f, 0xfc, 0x2a, 0xfe, 0xaf, 0x59, 0x50, 0xb9]);
enum GUID_PCI_FPGA_CONTROL_INTERFACE = GUID(0x2df3f7a8, 0xb9b3, 0x4063, [0x92, 0x15, 0xb5, 0xd1, 0x4a, 0xb, 0x26, 0x6e]);
enum GUID_PCI_PTM_CONTROL_INTERFACE = GUID(0x348a5ebb, 0xba24, 0x44b7, [0x99, 0x16, 0x28, 0x56, 0x87, 0x73, 0x51, 0x17]);
enum GUID_BUS_RESOURCE_UPDATE_INTERFACE = GUID(0x27d0102d, 0xbfb2, 0x4164, [0x81, 0xdd, 0xdb, 0xb8, 0x2f, 0x96, 0x8b, 0x48]);
enum GUID_NPEM_CONTROL_INTERFACE = GUID(0x4d95573d, 0xb774, 0x488a, [0xb1, 0x20, 0x4f, 0x28, 0x4a, 0x9e, 0xff, 0x51]);
enum GUID_PCI_ATS_INTERFACE = GUID(0x10a7fe8, 0x96f5, 0x4943, [0xbe, 0xdf, 0x95, 0xe6, 0x51, 0xb9, 0x34, 0x12]);
enum GUID_BUS_TYPE_INTERNAL = GUID(0x1530ea73, 0x86b, 0x11d1, [0xa0, 0x9f, 0x0, 0xc0, 0x4f, 0xc3, 0x40, 0xb1]);
enum GUID_BUS_TYPE_PCMCIA = GUID(0x9343630, 0xaf9f, 0x11d0, [0x92, 0xe9, 0x0, 0x0, 0xf8, 0x1e, 0x1b, 0x30]);
enum GUID_BUS_TYPE_PCI = GUID(0xc8ebdfb0, 0xb510, 0x11d0, [0x80, 0xe5, 0x0, 0xa0, 0xc9, 0x25, 0x42, 0xe3]);
enum GUID_BUS_TYPE_ISAPNP = GUID(0xe676f854, 0xd87d, 0x11d0, [0x92, 0xb2, 0x0, 0xa0, 0xc9, 0x5, 0x5f, 0xc5]);
enum GUID_BUS_TYPE_EISA = GUID(0xddc35509, 0xf3fc, 0x11d0, [0xa5, 0x37, 0x0, 0x0, 0xf8, 0x75, 0x3e, 0xd1]);
enum GUID_BUS_TYPE_MCA = GUID(0x1c75997a, 0xdc33, 0x11d0, [0x92, 0xb2, 0x0, 0xa0, 0xc9, 0x5, 0x5f, 0xc5]);
enum GUID_BUS_TYPE_SERENUM = GUID(0x77114a87, 0x8944, 0x11d1, [0xbd, 0x90, 0x0, 0xa0, 0xc9, 0x6, 0xbe, 0x2d]);
enum GUID_BUS_TYPE_USB = GUID(0x9d7debbc, 0xc85d, 0x11d1, [0x9e, 0xb4, 0x0, 0x60, 0x8, 0xc3, 0xa1, 0x9a]);
enum GUID_BUS_TYPE_LPTENUM = GUID(0xc4ca1000, 0x2ddc, 0x11d5, [0xa1, 0x7a, 0x0, 0xc0, 0x4f, 0x60, 0x52, 0x4d]);
enum GUID_BUS_TYPE_USBPRINT = GUID(0x441ee000, 0x4342, 0x11d5, [0xa1, 0x84, 0x0, 0xc0, 0x4f, 0x60, 0x52, 0x4d]);
enum GUID_BUS_TYPE_DOT4PRT = GUID(0x441ee001, 0x4342, 0x11d5, [0xa1, 0x84, 0x0, 0xc0, 0x4f, 0x60, 0x52, 0x4d]);
enum GUID_BUS_TYPE_1394 = GUID(0xf74e73eb, 0x9ac5, 0x45eb, [0xbe, 0x4d, 0x77, 0x2c, 0xc7, 0x1d, 0xdf, 0xb3]);
enum GUID_BUS_TYPE_HID = GUID(0xeeaf37d0, 0x1963, 0x47c4, [0xaa, 0x48, 0x72, 0x47, 0x6d, 0xb7, 0xcf, 0x49]);
enum GUID_BUS_TYPE_AVC = GUID(0xc06ff265, 0xae09, 0x48f0, [0x81, 0x2c, 0x16, 0x75, 0x3d, 0x7c, 0xba, 0x83]);
enum GUID_BUS_TYPE_IRDA = GUID(0x7ae17dc1, 0xc944, 0x44d6, [0x88, 0x1f, 0x4c, 0x2e, 0x61, 0x5, 0x3b, 0xc1]);
enum GUID_BUS_TYPE_SD = GUID(0xe700cc04, 0x4036, 0x4e89, [0x95, 0x79, 0x89, 0xeb, 0xf4, 0x5f, 0x0, 0xcd]);
enum GUID_BUS_TYPE_ACPI = GUID(0xd7b46895, 0x1a, 0x4942, [0x89, 0x1f, 0xa7, 0xd4, 0x66, 0x10, 0xa8, 0x43]);
enum GUID_BUS_TYPE_SW_DEVICE = GUID(0x6d10322, 0x7de0, 0x4cef, [0x8e, 0x25, 0x19, 0x7d, 0xe, 0x74, 0x42, 0xe2]);
enum GUID_BUS_TYPE_SCM = GUID(0x375a5912, 0x804c, 0x45aa, [0xbd, 0xc2, 0xfd, 0xd2, 0x5a, 0x1d, 0x95, 0x12]);
enum GUID_POWER_DEVICE_ENABLE = GUID(0x827c0a6f, 0xfeb0, 0x11d0, [0xbd, 0x26, 0x0, 0xaa, 0x0, 0xb7, 0xb3, 0x2a]);
enum GUID_POWER_DEVICE_TIMEOUTS = GUID(0xa45da735, 0xfeb0, 0x11d0, [0xbd, 0x26, 0x0, 0xaa, 0x0, 0xb7, 0xb3, 0x2a]);
enum GUID_POWER_DEVICE_WAKE_ENABLE = GUID(0xa9546a82, 0xfeb0, 0x11d0, [0xbd, 0x26, 0x0, 0xaa, 0x0, 0xb7, 0xb3, 0x2a]);
enum GUID_WUDF_DEVICE_HOST_PROBLEM = GUID(0xc43d25bd, 0x9346, 0x40ee, [0xa2, 0xd2, 0xd7, 0xc, 0x15, 0xf8, 0xb7, 0x5b]);
enum GUID_PARTITION_UNIT_INTERFACE_STANDARD = GUID(0x52363f5b, 0xd891, 0x429b, [0x81, 0x95, 0xae, 0xc5, 0xfe, 0xf6, 0x85, 0x3c]);
enum GUID_QUERY_CRASHDUMP_FUNCTIONS = GUID(0x9cc6b8ff, 0x32e2, 0x4834, [0xb1, 0xde, 0xb3, 0x2e, 0xf8, 0x88, 0xa, 0x4b]);
alias HCMNOTIFICATION = void*;
alias HDEVINFO = void*;
struct INFCONTEXT
{
    void* Inf;
    void* CurrentInf;
    uint Section;
    uint Line;
}
struct SP_INF_INFORMATION
{
    SP_INF_STYLE InfStyle;
    uint InfCount;
    ubyte[1] VersionData;
}
struct SP_ALTPLATFORM_INFO_V3
{
    uint cbSize;
    uint Platform;
    uint MajorVersion;
    uint MinorVersion;
    ushort ProcessorArchitecture;
    union
    {
        ushort Reserved;
        ushort Flags;
    }
    uint FirstValidatedMajorVersion;
    uint FirstValidatedMinorVersion;
    ubyte ProductType;
    ushort SuiteMask;
    uint BuildNumber;
}
struct SP_ALTPLATFORM_INFO_V2
{
    uint cbSize;
    VER_PLATFORM Platform;
    uint MajorVersion;
    uint MinorVersion;
    ushort ProcessorArchitecture;
    union
    {
        ushort Reserved;
        ushort Flags;
    }
    uint FirstValidatedMajorVersion;
    uint FirstValidatedMinorVersion;
}
struct SP_ALTPLATFORM_INFO_V1
{
    uint cbSize;
    VER_PLATFORM Platform;
    uint MajorVersion;
    uint MinorVersion;
    ushort ProcessorArchitecture;
    ushort Reserved;
}
struct SP_ORIGINAL_FILE_INFO_A
{
    uint cbSize;
    CHAR[260] OriginalInfName;
    CHAR[260] OriginalCatalogName;
}
struct SP_ORIGINAL_FILE_INFO_W
{
    uint cbSize;
    wchar[260] OriginalInfName;
    wchar[260] OriginalCatalogName;
}
alias PSP_FILE_CALLBACK_A = uint function(void*, uint, ulong, ulong);
alias PSP_FILE_CALLBACK_W = uint function(void*, uint, ulong, ulong);
struct FILEPATHS_A
{
    const(char)* Target;
    const(char)* Source;
    uint Win32Error;
    uint Flags;
}
struct FILEPATHS_W
{
    const(wchar)* Target;
    const(wchar)* Source;
    uint Win32Error;
    uint Flags;
}
struct FILEPATHS_SIGNERINFO_A
{
    const(char)* Target;
    const(char)* Source;
    uint Win32Error;
    uint Flags;
    const(char)* DigitalSigner;
    const(char)* Version;
    const(char)* CatalogFile;
}
struct FILEPATHS_SIGNERINFO_W
{
    const(wchar)* Target;
    const(wchar)* Source;
    uint Win32Error;
    uint Flags;
    const(wchar)* DigitalSigner;
    const(wchar)* Version;
    const(wchar)* CatalogFile;
}
struct SOURCE_MEDIA_A
{
    const(char)* Reserved;
    const(char)* Tagfile;
    const(char)* Description;
    const(char)* SourcePath;
    const(char)* SourceFile;
    uint Flags;
}
struct SOURCE_MEDIA_W
{
    const(wchar)* Reserved;
    const(wchar)* Tagfile;
    const(wchar)* Description;
    const(wchar)* SourcePath;
    const(wchar)* SourceFile;
    uint Flags;
}
struct CABINET_INFO_A
{
    const(char)* CabinetPath;
    const(char)* CabinetFile;
    const(char)* DiskName;
    ushort SetId;
    ushort CabinetNumber;
}
struct CABINET_INFO_W
{
    const(wchar)* CabinetPath;
    const(wchar)* CabinetFile;
    const(wchar)* DiskName;
    ushort SetId;
    ushort CabinetNumber;
}
struct FILE_IN_CABINET_INFO_A
{
    const(char)* NameInCabinet;
    uint FileSize;
    uint Win32Error;
    ushort DosDate;
    ushort DosTime;
    ushort DosAttribs;
    CHAR[260] FullTargetName;
}
struct FILE_IN_CABINET_INFO_W
{
    const(wchar)* NameInCabinet;
    uint FileSize;
    uint Win32Error;
    ushort DosDate;
    ushort DosTime;
    ushort DosAttribs;
    wchar[260] FullTargetName;
}
struct SP_REGISTER_CONTROL_STATUSA
{
    uint cbSize;
    const(char)* FileName;
    uint Win32Error;
    uint FailureCode;
}
struct SP_REGISTER_CONTROL_STATUSW
{
    uint cbSize;
    const(wchar)* FileName;
    uint Win32Error;
    uint FailureCode;
}
struct SP_FILE_COPY_PARAMS_A
{
    uint cbSize;
    void* QueueHandle;
    const(char)* SourceRootPath;
    const(char)* SourcePath;
    const(char)* SourceFilename;
    const(char)* SourceDescription;
    const(char)* SourceTagfile;
    const(char)* TargetDirectory;
    const(char)* TargetFilename;
    uint CopyStyle;
    void* LayoutInf;
    const(char)* SecurityDescriptor;
}
struct SP_FILE_COPY_PARAMS_W
{
    uint cbSize;
    void* QueueHandle;
    const(wchar)* SourceRootPath;
    const(wchar)* SourcePath;
    const(wchar)* SourceFilename;
    const(wchar)* SourceDescription;
    const(wchar)* SourceTagfile;
    const(wchar)* TargetDirectory;
    const(wchar)* TargetFilename;
    uint CopyStyle;
    void* LayoutInf;
    const(wchar)* SecurityDescriptor;
}
struct SP_DEVINFO_DATA
{
    uint cbSize;
    GUID ClassGuid;
    uint DevInst;
    ulong Reserved;
}
struct SP_DEVICE_INTERFACE_DATA
{
    uint cbSize;
    GUID InterfaceClassGuid;
    uint Flags;
    ulong Reserved;
}
struct SP_DEVICE_INTERFACE_DETAIL_DATA_A
{
    uint cbSize;
    CHAR[1] DevicePath;
}
struct SP_DEVICE_INTERFACE_DETAIL_DATA_W
{
    uint cbSize;
    wchar[1] DevicePath;
}
struct SP_DEVINFO_LIST_DETAIL_DATA_A
{
    uint cbSize;
    GUID ClassGuid;
    HANDLE RemoteMachineHandle;
    CHAR[263] RemoteMachineName;
}
struct SP_DEVINFO_LIST_DETAIL_DATA_W
{
    uint cbSize;
    GUID ClassGuid;
    HANDLE RemoteMachineHandle;
    wchar[263] RemoteMachineName;
}
struct SP_DEVINSTALL_PARAMS_A
{
    uint cbSize;
    uint Flags;
    uint FlagsEx;
    HWND hwndParent;
    PSP_FILE_CALLBACK_A InstallMsgHandler;
    void* InstallMsgHandlerContext;
    void* FileQueue;
    ulong ClassInstallReserved;
    uint Reserved;
    CHAR[260] DriverPath;
}
struct SP_DEVINSTALL_PARAMS_W
{
    uint cbSize;
    uint Flags;
    uint FlagsEx;
    HWND hwndParent;
    PSP_FILE_CALLBACK_A InstallMsgHandler;
    void* InstallMsgHandlerContext;
    void* FileQueue;
    ulong ClassInstallReserved;
    uint Reserved;
    wchar[260] DriverPath;
}
struct SP_CLASSINSTALL_HEADER
{
    uint cbSize;
    uint InstallFunction;
}
struct SP_ENABLECLASS_PARAMS
{
    SP_CLASSINSTALL_HEADER ClassInstallHeader;
    GUID ClassGuid;
    uint EnableMessage;
}
struct SP_PROPCHANGE_PARAMS
{
    SP_CLASSINSTALL_HEADER ClassInstallHeader;
    uint StateChange;
    uint Scope;
    uint HwProfile;
}
struct SP_REMOVEDEVICE_PARAMS
{
    SP_CLASSINSTALL_HEADER ClassInstallHeader;
    uint Scope;
    uint HwProfile;
}
struct SP_UNREMOVEDEVICE_PARAMS
{
    SP_CLASSINSTALL_HEADER ClassInstallHeader;
    uint Scope;
    uint HwProfile;
}
struct SP_SELECTDEVICE_PARAMS_A
{
    SP_CLASSINSTALL_HEADER ClassInstallHeader;
    CHAR[60] Title;
    CHAR[256] Instructions;
    CHAR[30] ListLabel;
    CHAR[256] SubTitle;
    ubyte[2] Reserved;
}
struct SP_SELECTDEVICE_PARAMS_W
{
    SP_CLASSINSTALL_HEADER ClassInstallHeader;
    wchar[60] Title;
    wchar[256] Instructions;
    wchar[30] ListLabel;
    wchar[256] SubTitle;
}
alias PDETECT_PROGRESS_NOTIFY = BOOL function(void*, uint);
struct SP_DETECTDEVICE_PARAMS
{
    SP_CLASSINSTALL_HEADER ClassInstallHeader;
    PDETECT_PROGRESS_NOTIFY DetectProgressNotify;
    void* ProgressNotifyParam;
}
struct SP_INSTALLWIZARD_DATA
{
    SP_CLASSINSTALL_HEADER ClassInstallHeader;
    uint Flags;
    HPROPSHEETPAGE[20] DynamicPages;
    uint NumDynamicPages;
    uint DynamicPageFlags;
    uint PrivateFlags;
    LPARAM PrivateData;
    HWND hwndWizardDlg;
}
struct SP_NEWDEVICEWIZARD_DATA
{
    SP_CLASSINSTALL_HEADER ClassInstallHeader;
    uint Flags;
    HPROPSHEETPAGE[20] DynamicPages;
    uint NumDynamicPages;
    HWND hwndWizardDlg;
}
struct SP_TROUBLESHOOTER_PARAMS_A
{
    SP_CLASSINSTALL_HEADER ClassInstallHeader;
    CHAR[260] ChmFile;
    CHAR[260] HtmlTroubleShooter;
}
struct SP_TROUBLESHOOTER_PARAMS_W
{
    SP_CLASSINSTALL_HEADER ClassInstallHeader;
    wchar[260] ChmFile;
    wchar[260] HtmlTroubleShooter;
}
struct SP_POWERMESSAGEWAKE_PARAMS_A
{
    SP_CLASSINSTALL_HEADER ClassInstallHeader;
    CHAR[512] PowerMessageWake;
}
struct SP_POWERMESSAGEWAKE_PARAMS_W
{
    SP_CLASSINSTALL_HEADER ClassInstallHeader;
    wchar[512] PowerMessageWake;
}
struct SP_DRVINFO_DATA_V2_A
{
    uint cbSize;
    uint DriverType;
    ulong Reserved;
    CHAR[256] Description;
    CHAR[256] MfgName;
    CHAR[256] ProviderName;
    FILETIME DriverDate;
    ulong DriverVersion;
}
struct SP_DRVINFO_DATA_V2_W
{
    uint cbSize;
    uint DriverType;
    ulong Reserved;
    wchar[256] Description;
    wchar[256] MfgName;
    wchar[256] ProviderName;
    FILETIME DriverDate;
    ulong DriverVersion;
}
struct SP_DRVINFO_DATA_V1_A
{
    uint cbSize;
    uint DriverType;
    ulong Reserved;
    CHAR[256] Description;
    CHAR[256] MfgName;
    CHAR[256] ProviderName;
}
struct SP_DRVINFO_DATA_V1_W
{
    uint cbSize;
    uint DriverType;
    ulong Reserved;
    wchar[256] Description;
    wchar[256] MfgName;
    wchar[256] ProviderName;
}
struct SP_DRVINFO_DETAIL_DATA_A
{
    uint cbSize;
    FILETIME InfDate;
    uint CompatIDsOffset;
    uint CompatIDsLength;
    ulong Reserved;
    CHAR[256] SectionName;
    CHAR[260] InfFileName;
    CHAR[256] DrvDescription;
    CHAR[1] HardwareID;
}
struct SP_DRVINFO_DETAIL_DATA_W
{
    uint cbSize;
    FILETIME InfDate;
    uint CompatIDsOffset;
    uint CompatIDsLength;
    ulong Reserved;
    wchar[256] SectionName;
    wchar[260] InfFileName;
    wchar[256] DrvDescription;
    wchar[1] HardwareID;
}
struct SP_DRVINSTALL_PARAMS
{
    uint cbSize;
    uint Rank;
    uint Flags;
    ulong PrivateData;
    uint Reserved;
}
alias PSP_DETSIG_CMPPROC = uint function(HDEVINFO, SP_DEVINFO_DATA*, SP_DEVINFO_DATA*, void*);
struct COINSTALLER_CONTEXT_DATA
{
    BOOL PostProcessing;
    uint InstallResult;
    void* PrivateData;
}
struct SP_CLASSIMAGELIST_DATA
{
    uint cbSize;
    HIMAGELIST ImageList;
    ulong Reserved;
}
struct SP_PROPSHEETPAGE_REQUEST
{
    uint cbSize;
    uint PageRequested;
    HDEVINFO DeviceInfoSet;
    SP_DEVINFO_DATA* DeviceInfoData;
}
struct SP_BACKUP_QUEUE_PARAMS_V2_A
{
    uint cbSize;
    CHAR[260] FullInfPath;
    int FilenameOffset;
    CHAR[260] ReinstallInstance;
}
struct SP_BACKUP_QUEUE_PARAMS_V2_W
{
    uint cbSize;
    wchar[260] FullInfPath;
    int FilenameOffset;
    wchar[260] ReinstallInstance;
}
struct SP_BACKUP_QUEUE_PARAMS_V1_A
{
    uint cbSize;
    CHAR[260] FullInfPath;
    int FilenameOffset;
}
struct SP_BACKUP_QUEUE_PARAMS_V1_W
{
    uint cbSize;
    wchar[260] FullInfPath;
    int FilenameOffset;
}
alias SetupFileLogInfo = int;
enum : int
{
    SetupFileLogSourceFilename  = 0x00000000,
    SetupFileLogChecksum        = 0x00000001,
    SetupFileLogDiskTagfile     = 0x00000002,
    SetupFileLogDiskDescription = 0x00000003,
    SetupFileLogOtherInfo       = 0x00000004,
    SetupFileLogMax             = 0x00000005,
}

struct SP_INF_SIGNER_INFO_V1_A
{
    uint cbSize;
    CHAR[260] CatalogFile;
    CHAR[260] DigitalSigner;
    CHAR[260] DigitalSignerVersion;
}
struct SP_INF_SIGNER_INFO_V1_W
{
    uint cbSize;
    wchar[260] CatalogFile;
    wchar[260] DigitalSigner;
    wchar[260] DigitalSignerVersion;
}
struct SP_INF_SIGNER_INFO_V2_A
{
    uint cbSize;
    CHAR[260] CatalogFile;
    CHAR[260] DigitalSigner;
    CHAR[260] DigitalSignerVersion;
    uint SignerScore;
}
struct SP_INF_SIGNER_INFO_V2_W
{
    uint cbSize;
    wchar[260] CatalogFile;
    wchar[260] DigitalSigner;
    wchar[260] DigitalSignerVersion;
    uint SignerScore;
}
alias PNP_VETO_TYPE = int;
enum : int
{
    PNP_VetoTypeUnknown          = 0x00000000,
    PNP_VetoLegacyDevice         = 0x00000001,
    PNP_VetoPendingClose         = 0x00000002,
    PNP_VetoWindowsApp           = 0x00000003,
    PNP_VetoWindowsService       = 0x00000004,
    PNP_VetoOutstandingOpen      = 0x00000005,
    PNP_VetoDevice               = 0x00000006,
    PNP_VetoDriver               = 0x00000007,
    PNP_VetoIllegalDeviceRequest = 0x00000008,
    PNP_VetoInsufficientPower    = 0x00000009,
    PNP_VetoNonDisableable       = 0x0000000a,
    PNP_VetoLegacyDriver         = 0x0000000b,
    PNP_VetoInsufficientRights   = 0x0000000c,
    PNP_VetoAlreadyRemoved       = 0x0000000d,
}

struct CONFLICT_DETAILS_A
{
    uint CD_ulSize;
    uint CD_ulMask;
    uint CD_dnDevInst;
    ulong CD_rdResDes;
    uint CD_ulFlags;
    CHAR[260] CD_szDescription;
}
struct CONFLICT_DETAILS_W
{
    uint CD_ulSize;
    uint CD_ulMask;
    uint CD_dnDevInst;
    ulong CD_rdResDes;
    uint CD_ulFlags;
    wchar[260] CD_szDescription;
}
struct MEM_RANGE
{
    align (1):
    ulong MR_Align;
    uint MR_nBytes;
    ulong MR_Min;
    ulong MR_Max;
    uint MR_Flags;
    uint MR_Reserved;
}
struct MEM_DES
{
    align (1):
    uint MD_Count;
    uint MD_Type;
    ulong MD_Alloc_Base;
    ulong MD_Alloc_End;
    uint MD_Flags;
    uint MD_Reserved;
}
struct MEM_RESOURCE
{
    MEM_DES MEM_Header;
    MEM_RANGE[1] MEM_Data;
}
struct Mem_Large_Range_s
{
    align (1):
    ulong MLR_Align;
    ulong MLR_nBytes;
    ulong MLR_Min;
    ulong MLR_Max;
    uint MLR_Flags;
    uint MLR_Reserved;
}
struct Mem_Large_Des_s
{
    align (1):
    uint MLD_Count;
    uint MLD_Type;
    ulong MLD_Alloc_Base;
    ulong MLD_Alloc_End;
    uint MLD_Flags;
    uint MLD_Reserved;
}
struct Mem_Large_Resource_s
{
    Mem_Large_Des_s MEM_LARGE_Header;
    Mem_Large_Range_s[1] MEM_LARGE_Data;
}
struct IO_RANGE
{
    align (1):
    ulong IOR_Align;
    uint IOR_nPorts;
    ulong IOR_Min;
    ulong IOR_Max;
    uint IOR_RangeFlags;
    ulong IOR_Alias;
}
struct IO_DES
{
    align (1):
    uint IOD_Count;
    uint IOD_Type;
    ulong IOD_Alloc_Base;
    ulong IOD_Alloc_End;
    uint IOD_DesFlags;
}
struct IO_RESOURCE
{
    IO_DES IO_Header;
    IO_RANGE[1] IO_Data;
}
struct DMA_RANGE
{
    align (1):
    uint DR_Min;
    uint DR_Max;
    uint DR_Flags;
}
struct DMA_DES
{
    align (1):
    uint DD_Count;
    uint DD_Type;
    uint DD_Flags;
    uint DD_Alloc_Chan;
}
struct DMA_RESOURCE
{
    DMA_DES DMA_Header;
    DMA_RANGE[1] DMA_Data;
}
struct IRQ_RANGE
{
    align (1):
    uint IRQR_Min;
    uint IRQR_Max;
    uint IRQR_Flags;
}
struct IRQ_DES_32
{
    align (1):
    uint IRQD_Count;
    uint IRQD_Type;
    uint IRQD_Flags;
    uint IRQD_Alloc_Num;
    uint IRQD_Affinity;
}
struct IRQ_DES_64
{
    align (1):
    uint IRQD_Count;
    uint IRQD_Type;
    uint IRQD_Flags;
    uint IRQD_Alloc_Num;
    ulong IRQD_Affinity;
}
struct IRQ_RESOURCE_32
{
    IRQ_DES_32 IRQ_Header;
    IRQ_RANGE[1] IRQ_Data;
}
struct IRQ_RESOURCE_64
{
    IRQ_DES_64 IRQ_Header;
    IRQ_RANGE[1] IRQ_Data;
}
struct DevPrivate_Range_s
{
    align (1):
    uint PR_Data1;
    uint PR_Data2;
    uint PR_Data3;
}
struct DevPrivate_Des_s
{
    align (1):
    uint PD_Count;
    uint PD_Type;
    uint PD_Data1;
    uint PD_Data2;
    uint PD_Data3;
    uint PD_Flags;
}
struct DevPrivate_Resource_s
{
    DevPrivate_Des_s PRV_Header;
    DevPrivate_Range_s[1] PRV_Data;
}
struct CS_DES
{
    align (1):
    uint CSD_SignatureLength;
    uint CSD_LegacyDataOffset;
    uint CSD_LegacyDataSize;
    uint CSD_Flags;
    GUID CSD_ClassGuid;
    ubyte[1] CSD_Signature;
}
struct CS_RESOURCE
{
    CS_DES CS_Header;
}
struct PCCARD_DES
{
    align (1):
    uint PCD_Count;
    uint PCD_Type;
    uint PCD_Flags;
    ubyte PCD_ConfigIndex;
    ubyte[3] PCD_Reserved;
    uint PCD_MemoryCardBase1;
    uint PCD_MemoryCardBase2;
    uint[2] PCD_MemoryCardBase;
    ushort[2] PCD_MemoryFlags;
    ubyte[2] PCD_IoFlags;
}
struct PCCARD_RESOURCE
{
    PCCARD_DES PcCard_Header;
}
struct MFCARD_DES
{
    align (1):
    uint PMF_Count;
    uint PMF_Type;
    uint PMF_Flags;
    ubyte PMF_ConfigOptions;
    ubyte PMF_IoResourceIndex;
    ubyte[2] PMF_Reserved;
    uint PMF_ConfigRegisterBase;
}
struct MFCARD_RESOURCE
{
    MFCARD_DES MfCard_Header;
}
struct BUSNUMBER_RANGE
{
    align (1):
    uint BUSR_Min;
    uint BUSR_Max;
    uint BUSR_nBusNumbers;
    uint BUSR_Flags;
}
struct BUSNUMBER_DES
{
    align (1):
    uint BUSD_Count;
    uint BUSD_Type;
    uint BUSD_Flags;
    uint BUSD_Alloc_Base;
    uint BUSD_Alloc_End;
}
struct BUSNUMBER_RESOURCE
{
    BUSNUMBER_DES BusNumber_Header;
    BUSNUMBER_RANGE[1] BusNumber_Data;
}
struct Connection_Des_s
{
    align (1):
    uint COND_Type;
    uint COND_Flags;
    ubyte COND_Class;
    ubyte COND_ClassType;
    ubyte COND_Reserved1;
    ubyte COND_Reserved2;
    LARGE_INTEGER COND_Id;
}
struct Connection_Resource_s
{
    Connection_Des_s Connection_Header;
}
struct HWProfileInfo_sA
{
    align (1):
    uint HWPI_ulHWProfile;
    CHAR[80] HWPI_szFriendlyName;
    uint HWPI_dwFlags;
}
struct HWProfileInfo_sW
{
    align (1):
    uint HWPI_ulHWProfile;
    wchar[80] HWPI_szFriendlyName;
    uint HWPI_dwFlags;
}
alias CM_NOTIFY_FILTER_TYPE = int;
enum : int
{
    CM_NOTIFY_FILTER_TYPE_DEVICEINTERFACE = 0x00000000,
    CM_NOTIFY_FILTER_TYPE_DEVICEHANDLE    = 0x00000001,
    CM_NOTIFY_FILTER_TYPE_DEVICEINSTANCE  = 0x00000002,
    CM_NOTIFY_FILTER_TYPE_MAX             = 0x00000003,
}

struct CM_NOTIFY_FILTER
{
    uint cbSize;
    uint Flags;
    CM_NOTIFY_FILTER_TYPE FilterType;
    uint Reserved;
    union _u_e__Union
    {
        struct _DeviceInterface_e__Struct
        {
            GUID ClassGuid;
        }
        struct _DeviceHandle_e__Struct
        {
            HANDLE hTarget;
        }
        struct _DeviceInstance_e__Struct
        {
            wchar[200] InstanceId;
        }
    }
}
alias CM_NOTIFY_ACTION = int;
enum : int
{
    CM_NOTIFY_ACTION_DEVICEINTERFACEARRIVAL   = 0x00000000,
    CM_NOTIFY_ACTION_DEVICEINTERFACEREMOVAL   = 0x00000001,
    CM_NOTIFY_ACTION_DEVICEQUERYREMOVE        = 0x00000002,
    CM_NOTIFY_ACTION_DEVICEQUERYREMOVEFAILED  = 0x00000003,
    CM_NOTIFY_ACTION_DEVICEREMOVEPENDING      = 0x00000004,
    CM_NOTIFY_ACTION_DEVICEREMOVECOMPLETE     = 0x00000005,
    CM_NOTIFY_ACTION_DEVICECUSTOMEVENT        = 0x00000006,
    CM_NOTIFY_ACTION_DEVICEINSTANCEENUMERATED = 0x00000007,
    CM_NOTIFY_ACTION_DEVICEINSTANCESTARTED    = 0x00000008,
    CM_NOTIFY_ACTION_DEVICEINSTANCEREMOVED    = 0x00000009,
    CM_NOTIFY_ACTION_MAX                      = 0x0000000a,
}

struct CM_NOTIFY_EVENT_DATA
{
    CM_NOTIFY_FILTER_TYPE FilterType;
    uint Reserved;
    union _u_e__Union
    {
        struct _DeviceInterface_e__Struct
        {
            GUID ClassGuid;
            wchar[1] SymbolicLink;
        }
        struct _DeviceHandle_e__Struct
        {
            GUID EventGuid;
            int NameOffset;
            uint DataSize;
            ubyte[1] Data;
        }
        struct _DeviceInstance_e__Struct
        {
            wchar[1] InstanceId;
        }
    }
}
alias PCM_NOTIFY_CALLBACK = uint function(HCMNOTIFICATION, void*, CM_NOTIFY_ACTION, CM_NOTIFY_EVENT_DATA*, uint);
/+ [CONFLICTED] struct INFCONTEXT
{
    align (1):
    void* Inf;
    void* CurrentInf;
    uint Section;
    uint Line;
}
+/
/+ [CONFLICTED] struct SP_INF_INFORMATION
{
    align (1):
    SP_INF_STYLE InfStyle;
    uint InfCount;
    ubyte[1] VersionData;
}
+/
/+ [CONFLICTED] struct SP_ALTPLATFORM_INFO_V3
{
    align (1):
    uint cbSize;
    uint Platform;
    uint MajorVersion;
    uint MinorVersion;
    ushort ProcessorArchitecture;
    union
    {
        align (1):
        ushort Reserved;
        ushort Flags;
    }
    uint FirstValidatedMajorVersion;
    uint FirstValidatedMinorVersion;
    ubyte ProductType;
    ushort SuiteMask;
    uint BuildNumber;
}
+/
/+ [CONFLICTED] struct SP_ALTPLATFORM_INFO_V2
{
    align (1):
    uint cbSize;
    VER_PLATFORM Platform;
    uint MajorVersion;
    uint MinorVersion;
    ushort ProcessorArchitecture;
    union
    {
        align (1):
        ushort Reserved;
        ushort Flags;
    }
    uint FirstValidatedMajorVersion;
    uint FirstValidatedMinorVersion;
}
+/
/+ [CONFLICTED] struct SP_ALTPLATFORM_INFO_V1
{
    align (1):
    uint cbSize;
    VER_PLATFORM Platform;
    uint MajorVersion;
    uint MinorVersion;
    ushort ProcessorArchitecture;
    ushort Reserved;
}
+/
/+ [CONFLICTED] struct SP_ORIGINAL_FILE_INFO_A
{
    align (1):
    uint cbSize;
    CHAR[260] OriginalInfName;
    CHAR[260] OriginalCatalogName;
}
+/
/+ [CONFLICTED] struct SP_ORIGINAL_FILE_INFO_W
{
    align (1):
    uint cbSize;
    wchar[260] OriginalInfName;
    wchar[260] OriginalCatalogName;
}
+/
/+ [CONFLICTED] struct FILEPATHS_A
{
    align (1):
    const(char)* Target;
    const(char)* Source;
    uint Win32Error;
    uint Flags;
}
+/
/+ [CONFLICTED] struct FILEPATHS_W
{
    align (1):
    const(wchar)* Target;
    const(wchar)* Source;
    uint Win32Error;
    uint Flags;
}
+/
/+ [CONFLICTED] struct FILEPATHS_SIGNERINFO_A
{
    align (1):
    const(char)* Target;
    const(char)* Source;
    uint Win32Error;
    uint Flags;
    const(char)* DigitalSigner;
    const(char)* Version;
    const(char)* CatalogFile;
}
+/
/+ [CONFLICTED] struct FILEPATHS_SIGNERINFO_W
{
    align (1):
    const(wchar)* Target;
    const(wchar)* Source;
    uint Win32Error;
    uint Flags;
    const(wchar)* DigitalSigner;
    const(wchar)* Version;
    const(wchar)* CatalogFile;
}
+/
/+ [CONFLICTED] struct SOURCE_MEDIA_A
{
    align (1):
    const(char)* Reserved;
    const(char)* Tagfile;
    const(char)* Description;
    const(char)* SourcePath;
    const(char)* SourceFile;
    uint Flags;
}
+/
/+ [CONFLICTED] struct SOURCE_MEDIA_W
{
    align (1):
    const(wchar)* Reserved;
    const(wchar)* Tagfile;
    const(wchar)* Description;
    const(wchar)* SourcePath;
    const(wchar)* SourceFile;
    uint Flags;
}
+/
/+ [CONFLICTED] struct CABINET_INFO_A
{
    align (1):
    const(char)* CabinetPath;
    const(char)* CabinetFile;
    const(char)* DiskName;
    ushort SetId;
    ushort CabinetNumber;
}
+/
/+ [CONFLICTED] struct CABINET_INFO_W
{
    align (1):
    const(wchar)* CabinetPath;
    const(wchar)* CabinetFile;
    const(wchar)* DiskName;
    ushort SetId;
    ushort CabinetNumber;
}
+/
/+ [CONFLICTED] struct FILE_IN_CABINET_INFO_A
{
    align (1):
    const(char)* NameInCabinet;
    uint FileSize;
    uint Win32Error;
    ushort DosDate;
    ushort DosTime;
    ushort DosAttribs;
    CHAR[260] FullTargetName;
}
+/
/+ [CONFLICTED] struct FILE_IN_CABINET_INFO_W
{
    align (1):
    const(wchar)* NameInCabinet;
    uint FileSize;
    uint Win32Error;
    ushort DosDate;
    ushort DosTime;
    ushort DosAttribs;
    wchar[260] FullTargetName;
}
+/
/+ [CONFLICTED] struct SP_REGISTER_CONTROL_STATUSA
{
    align (1):
    uint cbSize;
    const(char)* FileName;
    uint Win32Error;
    uint FailureCode;
}
+/
/+ [CONFLICTED] struct SP_REGISTER_CONTROL_STATUSW
{
    align (1):
    uint cbSize;
    const(wchar)* FileName;
    uint Win32Error;
    uint FailureCode;
}
+/
/+ [CONFLICTED] struct SP_FILE_COPY_PARAMS_A
{
    align (1):
    uint cbSize;
    void* QueueHandle;
    const(char)* SourceRootPath;
    const(char)* SourcePath;
    const(char)* SourceFilename;
    const(char)* SourceDescription;
    const(char)* SourceTagfile;
    const(char)* TargetDirectory;
    const(char)* TargetFilename;
    uint CopyStyle;
    void* LayoutInf;
    const(char)* SecurityDescriptor;
}
+/
/+ [CONFLICTED] struct SP_FILE_COPY_PARAMS_W
{
    align (1):
    uint cbSize;
    void* QueueHandle;
    const(wchar)* SourceRootPath;
    const(wchar)* SourcePath;
    const(wchar)* SourceFilename;
    const(wchar)* SourceDescription;
    const(wchar)* SourceTagfile;
    const(wchar)* TargetDirectory;
    const(wchar)* TargetFilename;
    uint CopyStyle;
    void* LayoutInf;
    const(wchar)* SecurityDescriptor;
}
+/
/+ [CONFLICTED] struct SP_DEVINFO_DATA
{
    align (1):
    uint cbSize;
    GUID ClassGuid;
    uint DevInst;
    ulong Reserved;
}
+/
/+ [CONFLICTED] struct SP_DEVICE_INTERFACE_DATA
{
    align (1):
    uint cbSize;
    GUID InterfaceClassGuid;
    uint Flags;
    ulong Reserved;
}
+/
/+ [CONFLICTED] struct SP_DEVICE_INTERFACE_DETAIL_DATA_A
{
    align (1):
    uint cbSize;
    CHAR[1] DevicePath;
}
+/
/+ [CONFLICTED] struct SP_DEVICE_INTERFACE_DETAIL_DATA_W
{
    align (1):
    uint cbSize;
    wchar[1] DevicePath;
}
+/
/+ [CONFLICTED] struct SP_DEVINFO_LIST_DETAIL_DATA_A
{
    align (1):
    uint cbSize;
    GUID ClassGuid;
    HANDLE RemoteMachineHandle;
    CHAR[263] RemoteMachineName;
}
+/
/+ [CONFLICTED] struct SP_DEVINFO_LIST_DETAIL_DATA_W
{
    align (1):
    uint cbSize;
    GUID ClassGuid;
    HANDLE RemoteMachineHandle;
    wchar[263] RemoteMachineName;
}
+/
/+ [CONFLICTED] struct SP_DEVINSTALL_PARAMS_A
{
    align (1):
    uint cbSize;
    uint Flags;
    uint FlagsEx;
    HWND hwndParent;
    PSP_FILE_CALLBACK_A InstallMsgHandler;
    void* InstallMsgHandlerContext;
    void* FileQueue;
    ulong ClassInstallReserved;
    uint Reserved;
    CHAR[260] DriverPath;
}
+/
/+ [CONFLICTED] struct SP_DEVINSTALL_PARAMS_W
{
    align (1):
    uint cbSize;
    uint Flags;
    uint FlagsEx;
    HWND hwndParent;
    PSP_FILE_CALLBACK_A InstallMsgHandler;
    void* InstallMsgHandlerContext;
    void* FileQueue;
    ulong ClassInstallReserved;
    uint Reserved;
    wchar[260] DriverPath;
}
+/
/+ [CONFLICTED] struct SP_CLASSINSTALL_HEADER
{
    align (1):
    uint cbSize;
    uint InstallFunction;
}
+/
/+ [CONFLICTED] struct SP_ENABLECLASS_PARAMS
{
    align (1):
    SP_CLASSINSTALL_HEADER ClassInstallHeader;
    GUID ClassGuid;
    uint EnableMessage;
}
+/
/+ [CONFLICTED] struct SP_PROPCHANGE_PARAMS
{
    align (1):
    SP_CLASSINSTALL_HEADER ClassInstallHeader;
    uint StateChange;
    uint Scope;
    uint HwProfile;
}
+/
/+ [CONFLICTED] struct SP_REMOVEDEVICE_PARAMS
{
    align (1):
    SP_CLASSINSTALL_HEADER ClassInstallHeader;
    uint Scope;
    uint HwProfile;
}
+/
/+ [CONFLICTED] struct SP_UNREMOVEDEVICE_PARAMS
{
    align (1):
    SP_CLASSINSTALL_HEADER ClassInstallHeader;
    uint Scope;
    uint HwProfile;
}
+/
/+ [CONFLICTED] struct SP_SELECTDEVICE_PARAMS_W
{
    align (1):
    SP_CLASSINSTALL_HEADER ClassInstallHeader;
    wchar[60] Title;
    wchar[256] Instructions;
    wchar[30] ListLabel;
    wchar[256] SubTitle;
}
+/
/+ [CONFLICTED] struct SP_DETECTDEVICE_PARAMS
{
    align (1):
    SP_CLASSINSTALL_HEADER ClassInstallHeader;
    PDETECT_PROGRESS_NOTIFY DetectProgressNotify;
    void* ProgressNotifyParam;
}
+/
/+ [CONFLICTED] struct SP_INSTALLWIZARD_DATA
{
    align (1):
    SP_CLASSINSTALL_HEADER ClassInstallHeader;
    uint Flags;
    HPROPSHEETPAGE[20] DynamicPages;
    uint NumDynamicPages;
    uint DynamicPageFlags;
    uint PrivateFlags;
    LPARAM PrivateData;
    HWND hwndWizardDlg;
}
+/
/+ [CONFLICTED] struct SP_NEWDEVICEWIZARD_DATA
{
    align (1):
    SP_CLASSINSTALL_HEADER ClassInstallHeader;
    uint Flags;
    HPROPSHEETPAGE[20] DynamicPages;
    uint NumDynamicPages;
    HWND hwndWizardDlg;
}
+/
/+ [CONFLICTED] struct SP_TROUBLESHOOTER_PARAMS_W
{
    align (1):
    SP_CLASSINSTALL_HEADER ClassInstallHeader;
    wchar[260] ChmFile;
    wchar[260] HtmlTroubleShooter;
}
+/
/+ [CONFLICTED] struct SP_POWERMESSAGEWAKE_PARAMS_W
{
    align (1):
    SP_CLASSINSTALL_HEADER ClassInstallHeader;
    wchar[512] PowerMessageWake;
}
+/
/+ [CONFLICTED] struct SP_DRVINFO_DATA_V2_A
{
    align (1):
    uint cbSize;
    uint DriverType;
    ulong Reserved;
    CHAR[256] Description;
    CHAR[256] MfgName;
    CHAR[256] ProviderName;
    FILETIME DriverDate;
    ulong DriverVersion;
}
+/
/+ [CONFLICTED] struct SP_DRVINFO_DATA_V2_W
{
    align (1):
    uint cbSize;
    uint DriverType;
    ulong Reserved;
    wchar[256] Description;
    wchar[256] MfgName;
    wchar[256] ProviderName;
    FILETIME DriverDate;
    ulong DriverVersion;
}
+/
/+ [CONFLICTED] struct SP_DRVINFO_DATA_V1_A
{
    align (1):
    uint cbSize;
    uint DriverType;
    ulong Reserved;
    CHAR[256] Description;
    CHAR[256] MfgName;
    CHAR[256] ProviderName;
}
+/
/+ [CONFLICTED] struct SP_DRVINFO_DATA_V1_W
{
    align (1):
    uint cbSize;
    uint DriverType;
    ulong Reserved;
    wchar[256] Description;
    wchar[256] MfgName;
    wchar[256] ProviderName;
}
+/
/+ [CONFLICTED] struct SP_DRVINFO_DETAIL_DATA_A
{
    align (1):
    uint cbSize;
    FILETIME InfDate;
    uint CompatIDsOffset;
    uint CompatIDsLength;
    ulong Reserved;
    CHAR[256] SectionName;
    CHAR[260] InfFileName;
    CHAR[256] DrvDescription;
    CHAR[1] HardwareID;
}
+/
/+ [CONFLICTED] struct SP_DRVINFO_DETAIL_DATA_W
{
    align (1):
    uint cbSize;
    FILETIME InfDate;
    uint CompatIDsOffset;
    uint CompatIDsLength;
    ulong Reserved;
    wchar[256] SectionName;
    wchar[260] InfFileName;
    wchar[256] DrvDescription;
    wchar[1] HardwareID;
}
+/
/+ [CONFLICTED] struct SP_DRVINSTALL_PARAMS
{
    align (1):
    uint cbSize;
    uint Rank;
    uint Flags;
    ulong PrivateData;
    uint Reserved;
}
+/
/+ [CONFLICTED] struct COINSTALLER_CONTEXT_DATA
{
    align (1):
    BOOL PostProcessing;
    uint InstallResult;
    void* PrivateData;
}
+/
/+ [CONFLICTED] struct SP_CLASSIMAGELIST_DATA
{
    align (1):
    uint cbSize;
    HIMAGELIST ImageList;
    ulong Reserved;
}
+/
/+ [CONFLICTED] struct SP_PROPSHEETPAGE_REQUEST
{
    align (1):
    uint cbSize;
    uint PageRequested;
    HDEVINFO DeviceInfoSet;
    SP_DEVINFO_DATA* DeviceInfoData;
}
+/
/+ [CONFLICTED] struct SP_BACKUP_QUEUE_PARAMS_V2_A
{
    align (1):
    uint cbSize;
    CHAR[260] FullInfPath;
    int FilenameOffset;
    CHAR[260] ReinstallInstance;
}
+/
/+ [CONFLICTED] struct SP_BACKUP_QUEUE_PARAMS_V2_W
{
    align (1):
    uint cbSize;
    wchar[260] FullInfPath;
    int FilenameOffset;
    wchar[260] ReinstallInstance;
}
+/
/+ [CONFLICTED] struct SP_BACKUP_QUEUE_PARAMS_V1_A
{
    align (1):
    uint cbSize;
    CHAR[260] FullInfPath;
    int FilenameOffset;
}
+/
/+ [CONFLICTED] struct SP_BACKUP_QUEUE_PARAMS_V1_W
{
    align (1):
    uint cbSize;
    wchar[260] FullInfPath;
    int FilenameOffset;
}
+/
/+ [CONFLICTED] struct SP_INF_SIGNER_INFO_V1_A
{
    align (1):
    uint cbSize;
    CHAR[260] CatalogFile;
    CHAR[260] DigitalSigner;
    CHAR[260] DigitalSignerVersion;
}
+/
/+ [CONFLICTED] struct SP_INF_SIGNER_INFO_V1_W
{
    align (1):
    uint cbSize;
    wchar[260] CatalogFile;
    wchar[260] DigitalSigner;
    wchar[260] DigitalSignerVersion;
}
+/
/+ [CONFLICTED] struct SP_INF_SIGNER_INFO_V2_A
{
    align (1):
    uint cbSize;
    CHAR[260] CatalogFile;
    CHAR[260] DigitalSigner;
    CHAR[260] DigitalSignerVersion;
    uint SignerScore;
}
+/
/+ [CONFLICTED] struct SP_INF_SIGNER_INFO_V2_W
{
    align (1):
    uint cbSize;
    wchar[260] CatalogFile;
    wchar[260] DigitalSigner;
    wchar[260] DigitalSignerVersion;
    uint SignerScore;
}
+/
