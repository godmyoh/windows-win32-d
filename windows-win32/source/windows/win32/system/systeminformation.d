module windows.win32.system.systeminformation;

import windows.win32.foundation : BOOL, BOOLEAN, CHAR, FILETIME, HANDLE, HRESULT, PSTR, PWSTR, SYSTEMTIME;

version (Windows):
extern (Windows):

alias VER_FLAGS = uint;
enum : uint
{
    VER_MINORVERSION     = 0x00000001,
    VER_MAJORVERSION     = 0x00000002,
    VER_BUILDNUMBER      = 0x00000004,
    VER_PLATFORMID       = 0x00000008,
    VER_SERVICEPACKMINOR = 0x00000010,
    VER_SERVICEPACKMAJOR = 0x00000020,
    VER_SUITENAME        = 0x00000040,
    VER_PRODUCT_TYPE     = 0x00000080,
}

alias IMAGE_FILE_MACHINE = ushort;
enum : ushort
{
    IMAGE_FILE_MACHINE_AXP64       = 0x0284,
    IMAGE_FILE_MACHINE_I386        = 0x014c,
    IMAGE_FILE_MACHINE_IA64        = 0x0200,
    IMAGE_FILE_MACHINE_AMD64       = 0x8664,
    IMAGE_FILE_MACHINE_UNKNOWN     = 0x0000,
    IMAGE_FILE_MACHINE_TARGET_HOST = 0x0001,
    IMAGE_FILE_MACHINE_R3000       = 0x0162,
    IMAGE_FILE_MACHINE_R4000       = 0x0166,
    IMAGE_FILE_MACHINE_R10000      = 0x0168,
    IMAGE_FILE_MACHINE_WCEMIPSV2   = 0x0169,
    IMAGE_FILE_MACHINE_ALPHA       = 0x0184,
    IMAGE_FILE_MACHINE_SH3         = 0x01a2,
    IMAGE_FILE_MACHINE_SH3DSP      = 0x01a3,
    IMAGE_FILE_MACHINE_SH3E        = 0x01a4,
    IMAGE_FILE_MACHINE_SH4         = 0x01a6,
    IMAGE_FILE_MACHINE_SH5         = 0x01a8,
    IMAGE_FILE_MACHINE_ARM         = 0x01c0,
    IMAGE_FILE_MACHINE_THUMB       = 0x01c2,
    IMAGE_FILE_MACHINE_ARMNT       = 0x01c4,
    IMAGE_FILE_MACHINE_AM33        = 0x01d3,
    IMAGE_FILE_MACHINE_POWERPC     = 0x01f0,
    IMAGE_FILE_MACHINE_POWERPCFP   = 0x01f1,
    IMAGE_FILE_MACHINE_MIPS16      = 0x0266,
    IMAGE_FILE_MACHINE_ALPHA64     = 0x0284,
    IMAGE_FILE_MACHINE_MIPSFPU     = 0x0366,
    IMAGE_FILE_MACHINE_MIPSFPU16   = 0x0466,
    IMAGE_FILE_MACHINE_TRICORE     = 0x0520,
    IMAGE_FILE_MACHINE_CEF         = 0x0cef,
    IMAGE_FILE_MACHINE_EBC         = 0x0ebc,
    IMAGE_FILE_MACHINE_M32R        = 0x9041,
    IMAGE_FILE_MACHINE_ARM64       = 0xaa64,
    IMAGE_FILE_MACHINE_CEE         = 0xc0ee,
}

alias PROCESSOR_ARCHITECTURE = ushort;
enum : ushort
{
    PROCESSOR_ARCHITECTURE_INTEL          = 0x0000,
    PROCESSOR_ARCHITECTURE_MIPS           = 0x0001,
    PROCESSOR_ARCHITECTURE_ALPHA          = 0x0002,
    PROCESSOR_ARCHITECTURE_PPC            = 0x0003,
    PROCESSOR_ARCHITECTURE_SHX            = 0x0004,
    PROCESSOR_ARCHITECTURE_ARM            = 0x0005,
    PROCESSOR_ARCHITECTURE_IA64           = 0x0006,
    PROCESSOR_ARCHITECTURE_ALPHA64        = 0x0007,
    PROCESSOR_ARCHITECTURE_MSIL           = 0x0008,
    PROCESSOR_ARCHITECTURE_AMD64          = 0x0009,
    PROCESSOR_ARCHITECTURE_IA32_ON_WIN64  = 0x000a,
    PROCESSOR_ARCHITECTURE_NEUTRAL        = 0x000b,
    PROCESSOR_ARCHITECTURE_ARM64          = 0x000c,
    PROCESSOR_ARCHITECTURE_ARM32_ON_WIN64 = 0x000d,
    PROCESSOR_ARCHITECTURE_IA32_ON_ARM64  = 0x000e,
    PROCESSOR_ARCHITECTURE_UNKNOWN        = 0xffff,
}

alias FIRMWARE_TABLE_PROVIDER = uint;
enum : uint
{
    ACPI    = 0x41435049,
    FIRM    = 0x4649524d,
    RSMB    = 0x52534d42,
}

alias USER_CET_ENVIRONMENT = uint;
enum : uint
{
    USER_CET_ENVIRONMENT_WIN32_PROCESS     = 0x00000000,
    USER_CET_ENVIRONMENT_SGX2_ENCLAVE      = 0x00000002,
    USER_CET_ENVIRONMENT_VBS_ENCLAVE       = 0x00000010,
    USER_CET_ENVIRONMENT_VBS_BASIC_ENCLAVE = 0x00000011,
}

alias OS_PRODUCT_TYPE = uint;
enum : uint
{
    PRODUCT_BUSINESS                            = 0x00000006,
    PRODUCT_BUSINESS_N                          = 0x00000010,
    PRODUCT_CLUSTER_SERVER                      = 0x00000012,
    PRODUCT_CLUSTER_SERVER_V                    = 0x00000040,
    PRODUCT_CORE                                = 0x00000065,
    PRODUCT_CORE_COUNTRYSPECIFIC                = 0x00000063,
    PRODUCT_CORE_N                              = 0x00000062,
    PRODUCT_CORE_SINGLELANGUAGE                 = 0x00000064,
    PRODUCT_DATACENTER_EVALUATION_SERVER        = 0x00000050,
    PRODUCT_DATACENTER_A_SERVER_CORE            = 0x00000091,
    PRODUCT_STANDARD_A_SERVER_CORE              = 0x00000092,
    PRODUCT_DATACENTER_SERVER                   = 0x00000008,
    PRODUCT_DATACENTER_SERVER_CORE              = 0x0000000c,
    PRODUCT_DATACENTER_SERVER_CORE_V            = 0x00000027,
    PRODUCT_DATACENTER_SERVER_V                 = 0x00000025,
    PRODUCT_EDUCATION                           = 0x00000079,
    PRODUCT_EDUCATION_N                         = 0x0000007a,
    PRODUCT_ENTERPRISE                          = 0x00000004,
    PRODUCT_ENTERPRISE_E                        = 0x00000046,
    PRODUCT_ENTERPRISE_EVALUATION               = 0x00000048,
    PRODUCT_ENTERPRISE_N                        = 0x0000001b,
    PRODUCT_ENTERPRISE_N_EVALUATION             = 0x00000054,
    PRODUCT_ENTERPRISE_S                        = 0x0000007d,
    PRODUCT_ENTERPRISE_S_EVALUATION             = 0x00000081,
    PRODUCT_ENTERPRISE_S_N                      = 0x0000007e,
    PRODUCT_ENTERPRISE_S_N_EVALUATION           = 0x00000082,
    PRODUCT_ENTERPRISE_SERVER                   = 0x0000000a,
    PRODUCT_ENTERPRISE_SERVER_CORE              = 0x0000000e,
    PRODUCT_ENTERPRISE_SERVER_CORE_V            = 0x00000029,
    PRODUCT_ENTERPRISE_SERVER_IA64              = 0x0000000f,
    PRODUCT_ENTERPRISE_SERVER_V                 = 0x00000026,
    PRODUCT_ESSENTIALBUSINESS_SERVER_ADDL       = 0x0000003c,
    PRODUCT_ESSENTIALBUSINESS_SERVER_ADDLSVC    = 0x0000003e,
    PRODUCT_ESSENTIALBUSINESS_SERVER_MGMT       = 0x0000003b,
    PRODUCT_ESSENTIALBUSINESS_SERVER_MGMTSVC    = 0x0000003d,
    PRODUCT_HOME_BASIC                          = 0x00000002,
    PRODUCT_HOME_BASIC_E                        = 0x00000043,
    PRODUCT_HOME_BASIC_N                        = 0x00000005,
    PRODUCT_HOME_PREMIUM                        = 0x00000003,
    PRODUCT_HOME_PREMIUM_E                      = 0x00000044,
    PRODUCT_HOME_PREMIUM_N                      = 0x0000001a,
    PRODUCT_HOME_PREMIUM_SERVER                 = 0x00000022,
    PRODUCT_HOME_SERVER                         = 0x00000013,
    PRODUCT_HYPERV                              = 0x0000002a,
    PRODUCT_IOTUAP                              = 0x0000007b,
    PRODUCT_IOTUAPCOMMERCIAL                    = 0x00000083,
    PRODUCT_MEDIUMBUSINESS_SERVER_MANAGEMENT    = 0x0000001e,
    PRODUCT_MEDIUMBUSINESS_SERVER_MESSAGING     = 0x00000020,
    PRODUCT_MEDIUMBUSINESS_SERVER_SECURITY      = 0x0000001f,
    PRODUCT_MOBILE_CORE                         = 0x00000068,
    PRODUCT_MOBILE_ENTERPRISE                   = 0x00000085,
    PRODUCT_MULTIPOINT_PREMIUM_SERVER           = 0x0000004d,
    PRODUCT_MULTIPOINT_STANDARD_SERVER          = 0x0000004c,
    PRODUCT_PRO_WORKSTATION                     = 0x000000a1,
    PRODUCT_PRO_WORKSTATION_N                   = 0x000000a2,
    PRODUCT_PROFESSIONAL                        = 0x00000030,
    PRODUCT_PROFESSIONAL_E                      = 0x00000045,
    PRODUCT_PROFESSIONAL_N                      = 0x00000031,
    PRODUCT_PROFESSIONAL_WMC                    = 0x00000067,
    PRODUCT_SB_SOLUTION_SERVER                  = 0x00000032,
    PRODUCT_SB_SOLUTION_SERVER_EM               = 0x00000036,
    PRODUCT_SERVER_FOR_SB_SOLUTIONS             = 0x00000033,
    PRODUCT_SERVER_FOR_SB_SOLUTIONS_EM          = 0x00000037,
    PRODUCT_SERVER_FOR_SMALLBUSINESS            = 0x00000018,
    PRODUCT_SERVER_FOR_SMALLBUSINESS_V          = 0x00000023,
    PRODUCT_SERVER_FOUNDATION                   = 0x00000021,
    PRODUCT_SMALLBUSINESS_SERVER                = 0x00000009,
    PRODUCT_SMALLBUSINESS_SERVER_PREMIUM        = 0x00000019,
    PRODUCT_SMALLBUSINESS_SERVER_PREMIUM_CORE   = 0x0000003f,
    PRODUCT_SOLUTION_EMBEDDEDSERVER             = 0x00000038,
    PRODUCT_STANDARD_EVALUATION_SERVER          = 0x0000004f,
    PRODUCT_STANDARD_SERVER                     = 0x00000007,
    PRODUCT_STANDARD_SERVER_CORE_               = 0x0000000d,
    PRODUCT_STANDARD_SERVER_CORE_V              = 0x00000028,
    PRODUCT_STANDARD_SERVER_V                   = 0x00000024,
    PRODUCT_STANDARD_SERVER_SOLUTIONS           = 0x00000034,
    PRODUCT_STANDARD_SERVER_SOLUTIONS_CORE      = 0x00000035,
    PRODUCT_STARTER                             = 0x0000000b,
    PRODUCT_STARTER_E                           = 0x00000042,
    PRODUCT_STARTER_N                           = 0x0000002f,
    PRODUCT_STORAGE_ENTERPRISE_SERVER           = 0x00000017,
    PRODUCT_STORAGE_ENTERPRISE_SERVER_CORE      = 0x0000002e,
    PRODUCT_STORAGE_EXPRESS_SERVER              = 0x00000014,
    PRODUCT_STORAGE_EXPRESS_SERVER_CORE         = 0x0000002b,
    PRODUCT_STORAGE_STANDARD_EVALUATION_SERVER  = 0x00000060,
    PRODUCT_STORAGE_STANDARD_SERVER             = 0x00000015,
    PRODUCT_STORAGE_STANDARD_SERVER_CORE        = 0x0000002c,
    PRODUCT_STORAGE_WORKGROUP_EVALUATION_SERVER = 0x0000005f,
    PRODUCT_STORAGE_WORKGROUP_SERVER            = 0x00000016,
    PRODUCT_STORAGE_WORKGROUP_SERVER_CORE       = 0x0000002d,
    PRODUCT_ULTIMATE                            = 0x00000001,
    PRODUCT_ULTIMATE_E                          = 0x00000047,
    PRODUCT_ULTIMATE_N                          = 0x0000001c,
    PRODUCT_UNDEFINED                           = 0x00000000,
    PRODUCT_WEB_SERVER                          = 0x00000011,
    PRODUCT_WEB_SERVER_CORE                     = 0x0000001d,
}

alias DEVICEFAMILYINFOENUM = uint;
enum : uint
{
    DEVICEFAMILYINFOENUM_UAP                   = 0x00000000,
    DEVICEFAMILYINFOENUM_WINDOWS_8X            = 0x00000001,
    DEVICEFAMILYINFOENUM_WINDOWS_PHONE_8X      = 0x00000002,
    DEVICEFAMILYINFOENUM_DESKTOP               = 0x00000003,
    DEVICEFAMILYINFOENUM_MOBILE                = 0x00000004,
    DEVICEFAMILYINFOENUM_XBOX                  = 0x00000005,
    DEVICEFAMILYINFOENUM_TEAM                  = 0x00000006,
    DEVICEFAMILYINFOENUM_IOT                   = 0x00000007,
    DEVICEFAMILYINFOENUM_IOT_HEADLESS          = 0x00000008,
    DEVICEFAMILYINFOENUM_SERVER                = 0x00000009,
    DEVICEFAMILYINFOENUM_HOLOGRAPHIC           = 0x0000000a,
    DEVICEFAMILYINFOENUM_XBOXSRA               = 0x0000000b,
    DEVICEFAMILYINFOENUM_XBOXERA               = 0x0000000c,
    DEVICEFAMILYINFOENUM_SERVER_NANO           = 0x0000000d,
    DEVICEFAMILYINFOENUM_8828080               = 0x0000000e,
    DEVICEFAMILYINFOENUM_7067329               = 0x0000000f,
    DEVICEFAMILYINFOENUM_WINDOWS_CORE          = 0x00000010,
    DEVICEFAMILYINFOENUM_WINDOWS_CORE_HEADLESS = 0x00000011,
    DEVICEFAMILYINFOENUM_MAX                   = 0x00000011,
}

alias DEVICEFAMILYDEVICEFORM = uint;
enum : uint
{
    DEVICEFAMILYDEVICEFORM_UNKNOWN               = 0x00000000,
    DEVICEFAMILYDEVICEFORM_PHONE                 = 0x00000001,
    DEVICEFAMILYDEVICEFORM_TABLET                = 0x00000002,
    DEVICEFAMILYDEVICEFORM_DESKTOP               = 0x00000003,
    DEVICEFAMILYDEVICEFORM_NOTEBOOK              = 0x00000004,
    DEVICEFAMILYDEVICEFORM_CONVERTIBLE           = 0x00000005,
    DEVICEFAMILYDEVICEFORM_DETACHABLE            = 0x00000006,
    DEVICEFAMILYDEVICEFORM_ALLINONE              = 0x00000007,
    DEVICEFAMILYDEVICEFORM_STICKPC               = 0x00000008,
    DEVICEFAMILYDEVICEFORM_PUCK                  = 0x00000009,
    DEVICEFAMILYDEVICEFORM_LARGESCREEN           = 0x0000000a,
    DEVICEFAMILYDEVICEFORM_HMD                   = 0x0000000b,
    DEVICEFAMILYDEVICEFORM_INDUSTRY_HANDHELD     = 0x0000000c,
    DEVICEFAMILYDEVICEFORM_INDUSTRY_TABLET       = 0x0000000d,
    DEVICEFAMILYDEVICEFORM_BANKING               = 0x0000000e,
    DEVICEFAMILYDEVICEFORM_BUILDING_AUTOMATION   = 0x0000000f,
    DEVICEFAMILYDEVICEFORM_DIGITAL_SIGNAGE       = 0x00000010,
    DEVICEFAMILYDEVICEFORM_GAMING                = 0x00000011,
    DEVICEFAMILYDEVICEFORM_HOME_AUTOMATION       = 0x00000012,
    DEVICEFAMILYDEVICEFORM_INDUSTRIAL_AUTOMATION = 0x00000013,
    DEVICEFAMILYDEVICEFORM_KIOSK                 = 0x00000014,
    DEVICEFAMILYDEVICEFORM_MAKER_BOARD           = 0x00000015,
    DEVICEFAMILYDEVICEFORM_MEDICAL               = 0x00000016,
    DEVICEFAMILYDEVICEFORM_NETWORKING            = 0x00000017,
    DEVICEFAMILYDEVICEFORM_POINT_OF_SERVICE      = 0x00000018,
    DEVICEFAMILYDEVICEFORM_PRINTING              = 0x00000019,
    DEVICEFAMILYDEVICEFORM_THIN_CLIENT           = 0x0000001a,
    DEVICEFAMILYDEVICEFORM_TOY                   = 0x0000001b,
    DEVICEFAMILYDEVICEFORM_VENDING               = 0x0000001c,
    DEVICEFAMILYDEVICEFORM_INDUSTRY_OTHER        = 0x0000001d,
    DEVICEFAMILYDEVICEFORM_XBOX_ONE              = 0x0000001e,
    DEVICEFAMILYDEVICEFORM_XBOX_ONE_S            = 0x0000001f,
    DEVICEFAMILYDEVICEFORM_XBOX_ONE_X            = 0x00000020,
    DEVICEFAMILYDEVICEFORM_XBOX_ONE_X_DEVKIT     = 0x00000021,
    DEVICEFAMILYDEVICEFORM_XBOX_SERIES_X         = 0x00000022,
    DEVICEFAMILYDEVICEFORM_XBOX_SERIES_X_DEVKIT  = 0x00000023,
    DEVICEFAMILYDEVICEFORM_XBOX_SERIES_S         = 0x00000024,
    DEVICEFAMILYDEVICEFORM_XBOX_RESERVED_01      = 0x00000025,
    DEVICEFAMILYDEVICEFORM_XBOX_RESERVED_02      = 0x00000026,
    DEVICEFAMILYDEVICEFORM_XBOX_RESERVED_03      = 0x00000027,
    DEVICEFAMILYDEVICEFORM_XBOX_RESERVED_04      = 0x00000028,
    DEVICEFAMILYDEVICEFORM_XBOX_RESERVED_05      = 0x00000029,
    DEVICEFAMILYDEVICEFORM_XBOX_RESERVED_06      = 0x0000002a,
    DEVICEFAMILYDEVICEFORM_XBOX_RESERVED_07      = 0x0000002b,
    DEVICEFAMILYDEVICEFORM_XBOX_RESERVED_08      = 0x0000002c,
    DEVICEFAMILYDEVICEFORM_XBOX_RESERVED_09      = 0x0000002d,
    DEVICEFAMILYDEVICEFORM_MAX                   = 0x0000002d,
}

BOOL GlobalMemoryStatusEx(MEMORYSTATUSEX*);
void GetSystemInfo(SYSTEM_INFO*);
void GetSystemTime(SYSTEMTIME*);
void GetSystemTimeAsFileTime(FILETIME*);
void GetLocalTime(SYSTEMTIME*);
BOOL IsUserCetAvailableInEnvironment(USER_CET_ENVIRONMENT);
BOOL GetSystemLeapSecondInformation(BOOL*, uint*);
uint GetVersion();
BOOL SetLocalTime(const(SYSTEMTIME)*);
uint GetTickCount();
ulong GetTickCount64();
BOOL GetSystemTimeAdjustment(uint*, uint*, BOOL*);
BOOL GetSystemTimeAdjustmentPrecise(ulong*, ulong*, BOOL*);
uint GetSystemDirectoryA(PSTR, uint);
uint GetSystemDirectoryW(PWSTR, uint);
uint GetWindowsDirectoryA(PSTR, uint);
uint GetWindowsDirectoryW(PWSTR, uint);
uint GetSystemWindowsDirectoryA(PSTR, uint);
uint GetSystemWindowsDirectoryW(PWSTR, uint);
BOOL GetComputerNameExA(COMPUTER_NAME_FORMAT, PSTR, uint*);
BOOL GetComputerNameExW(COMPUTER_NAME_FORMAT, PWSTR, uint*);
BOOL SetComputerNameExW(COMPUTER_NAME_FORMAT, const(wchar)*);
BOOL SetSystemTime(const(SYSTEMTIME)*);
BOOL GetVersionExA(OSVERSIONINFOA*);
BOOL GetVersionExW(OSVERSIONINFOW*);
BOOL GetLogicalProcessorInformation(SYSTEM_LOGICAL_PROCESSOR_INFORMATION*, uint*);
BOOL GetLogicalProcessorInformationEx(LOGICAL_PROCESSOR_RELATIONSHIP, SYSTEM_LOGICAL_PROCESSOR_INFORMATION_EX*, uint*);
void GetNativeSystemInfo(SYSTEM_INFO*);
void GetSystemTimePreciseAsFileTime(FILETIME*);
BOOL GetProductInfo(uint, uint, uint, uint, OS_PRODUCT_TYPE*);
ulong VerSetConditionMask(ulong, VER_FLAGS, ubyte);
BOOL GetOsSafeBootMode(uint*);
uint EnumSystemFirmwareTables(FIRMWARE_TABLE_PROVIDER, ubyte*, uint);
uint GetSystemFirmwareTable(FIRMWARE_TABLE_PROVIDER, uint, ubyte*, uint);
BOOL DnsHostnameToComputerNameExW(const(wchar)*, PWSTR, uint*);
BOOL GetPhysicallyInstalledSystemMemory(ulong*);
BOOL SetComputerNameEx2W(COMPUTER_NAME_FORMAT, uint, const(wchar)*);
BOOL SetSystemTimeAdjustment(uint, BOOL);
BOOL SetSystemTimeAdjustmentPrecise(ulong, BOOL);
BOOL GetProcessorSystemCycleTime(ushort, SYSTEM_PROCESSOR_CYCLE_TIME_INFORMATION*, uint*);
BOOL GetOsManufacturingMode(BOOL*);
HRESULT GetIntegratedDisplaySize(double*);
BOOL SetComputerNameA(const(char)*);
BOOL SetComputerNameW(const(wchar)*);
BOOL SetComputerNameExA(COMPUTER_NAME_FORMAT, const(char)*);
DEVELOPER_DRIVE_ENABLEMENT_STATE GetDeveloperDriveEnablementState();
BOOL GetSystemCpuSetInformation(SYSTEM_CPU_SET_INFORMATION*, uint, uint*, HANDLE, uint);
uint GetSystemWow64DirectoryA(PSTR, uint);
uint GetSystemWow64DirectoryW(PWSTR, uint);
uint GetSystemWow64Directory2A(PSTR, uint, IMAGE_FILE_MACHINE);
uint GetSystemWow64Directory2W(PWSTR, uint, IMAGE_FILE_MACHINE);
HRESULT IsWow64GuestMachineSupported(IMAGE_FILE_MACHINE, BOOL*);
BOOLEAN RtlGetProductInfo(uint, uint, uint, uint, uint*);
OS_DEPLOYEMENT_STATE_VALUES RtlOsDeploymentState(uint);
uint RtlGetSystemGlobalData(RTL_SYSTEM_GLOBAL_DATA_ID, void*, uint);
void RtlGetDeviceFamilyInfoEnum(ulong*, DEVICEFAMILYINFOENUM*, DEVICEFAMILYDEVICEFORM*);
uint RtlConvertDeviceFamilyInfoToString(uint*, uint*, PWSTR, PWSTR);
uint RtlSwitchedVVI(OSVERSIONINFOEXW*, uint, ulong);
void GlobalMemoryStatus(MEMORYSTATUS*);
DEP_SYSTEM_POLICY_TYPE GetSystemDEPPolicy();
BOOL GetFirmwareType(FIRMWARE_TYPE*);
BOOL VerifyVersionInfoA(OSVERSIONINFOEXA*, VER_FLAGS, ulong);
BOOL VerifyVersionInfoW(OSVERSIONINFOEXW*, VER_FLAGS, ulong);
enum NTDDI_WIN2K = 0x05000000;
enum NTDDI_WINXP = 0x05010000;
enum NTDDI_WINXPSP2 = 0x05010200;
enum NTDDI_WS03SP1 = 0x05020100;
enum NTDDI_VISTA = 0x06000000;
enum NTDDI_VISTASP1 = 0x06000100;
enum NTDDI_WIN7 = 0x06010000;
enum NTDDI_WIN8 = 0x06020000;
enum NTDDI_WINBLUE = 0x06030000;
enum NTDDI_WINTHRESHOLD = 0x0a000000;
enum SYSTEM_CPU_SET_INFORMATION_PARKED = 0x00000001;
enum SYSTEM_CPU_SET_INFORMATION_ALLOCATED = 0x00000002;
enum SYSTEM_CPU_SET_INFORMATION_ALLOCATED_TO_TARGET_PROCESS = 0x00000004;
enum SYSTEM_CPU_SET_INFORMATION_REALTIME = 0x00000008;
enum _WIN32_WINNT_NT4 = 0x00000400;
enum _WIN32_WINNT_WIN2K = 0x00000500;
enum _WIN32_WINNT_WINXP = 0x00000501;
enum _WIN32_WINNT_WS03 = 0x00000502;
enum _WIN32_WINNT_WIN6 = 0x00000600;
enum _WIN32_WINNT_VISTA = 0x00000600;
enum _WIN32_WINNT_WS08 = 0x00000600;
enum _WIN32_WINNT_LONGHORN = 0x00000600;
enum _WIN32_WINNT_WIN7 = 0x00000601;
enum _WIN32_WINNT_WIN8 = 0x00000602;
enum _WIN32_WINNT_WINBLUE = 0x00000603;
enum _WIN32_WINNT_WINTHRESHOLD = 0x00000a00;
enum _WIN32_WINNT_WIN10 = 0x00000a00;
enum _WIN32_IE_IE20 = 0x00000200;
enum _WIN32_IE_IE30 = 0x00000300;
enum _WIN32_IE_IE302 = 0x00000302;
enum _WIN32_IE_IE40 = 0x00000400;
enum _WIN32_IE_IE401 = 0x00000401;
enum _WIN32_IE_IE50 = 0x00000500;
enum _WIN32_IE_IE501 = 0x00000501;
enum _WIN32_IE_IE55 = 0x00000550;
enum _WIN32_IE_IE60 = 0x00000600;
enum _WIN32_IE_IE60SP1 = 0x00000601;
enum _WIN32_IE_IE60SP2 = 0x00000603;
enum _WIN32_IE_IE70 = 0x00000700;
enum _WIN32_IE_IE80 = 0x00000800;
enum _WIN32_IE_IE90 = 0x00000900;
enum _WIN32_IE_IE100 = 0x00000a00;
enum _WIN32_IE_IE110 = 0x00000a00;
enum _WIN32_IE_NT4 = 0x00000200;
enum _WIN32_IE_NT4SP1 = 0x00000200;
enum _WIN32_IE_NT4SP2 = 0x00000200;
enum _WIN32_IE_NT4SP3 = 0x00000302;
enum _WIN32_IE_NT4SP4 = 0x00000401;
enum _WIN32_IE_NT4SP5 = 0x00000401;
enum _WIN32_IE_NT4SP6 = 0x00000500;
enum _WIN32_IE_WIN98 = 0x00000401;
enum _WIN32_IE_WIN98SE = 0x00000500;
enum _WIN32_IE_WINME = 0x00000550;
enum _WIN32_IE_WIN2K = 0x00000501;
enum _WIN32_IE_WIN2KSP1 = 0x00000501;
enum _WIN32_IE_WIN2KSP2 = 0x00000501;
enum _WIN32_IE_WIN2KSP3 = 0x00000501;
enum _WIN32_IE_WIN2KSP4 = 0x00000501;
enum _WIN32_IE_XP = 0x00000600;
enum _WIN32_IE_XPSP1 = 0x00000601;
enum _WIN32_IE_XPSP2 = 0x00000603;
enum _WIN32_IE_WS03 = 0x00000602;
enum _WIN32_IE_WS03SP1 = 0x00000603;
enum _WIN32_IE_WIN6 = 0x00000700;
enum _WIN32_IE_LONGHORN = 0x00000700;
enum _WIN32_IE_WIN7 = 0x00000800;
enum _WIN32_IE_WIN8 = 0x00000a00;
enum _WIN32_IE_WINBLUE = 0x00000a00;
enum _WIN32_IE_WINTHRESHOLD = 0x00000a00;
enum _WIN32_IE_WIN10 = 0x00000a00;
enum NTDDI_WIN4 = 0x04000000;
enum NTDDI_WIN2KSP1 = 0x05000100;
enum NTDDI_WIN2KSP2 = 0x05000200;
enum NTDDI_WIN2KSP3 = 0x05000300;
enum NTDDI_WIN2KSP4 = 0x05000400;
enum NTDDI_WINXPSP1 = 0x05010100;
enum NTDDI_WINXPSP3 = 0x05010300;
enum NTDDI_WINXPSP4 = 0x05010400;
enum NTDDI_WS03 = 0x05020000;
enum NTDDI_WS03SP2 = 0x05020200;
enum NTDDI_WS03SP3 = 0x05020300;
enum NTDDI_WS03SP4 = 0x05020400;
enum NTDDI_WIN6 = 0x06000000;
enum NTDDI_WIN6SP1 = 0x06000100;
enum NTDDI_WIN6SP2 = 0x06000200;
enum NTDDI_WIN6SP3 = 0x06000300;
enum NTDDI_WIN6SP4 = 0x06000400;
enum NTDDI_VISTASP2 = 0x06000200;
enum NTDDI_VISTASP3 = 0x06000300;
enum NTDDI_VISTASP4 = 0x06000400;
enum NTDDI_LONGHORN = 0x06000000;
enum NTDDI_WS08 = 0x06000100;
enum NTDDI_WS08SP2 = 0x06000200;
enum NTDDI_WS08SP3 = 0x06000300;
enum NTDDI_WS08SP4 = 0x06000400;
enum NTDDI_WIN10 = 0x0a000000;
enum NTDDI_WIN10_TH2 = 0x0a000001;
enum NTDDI_WIN10_RS1 = 0x0a000002;
enum NTDDI_WIN10_RS2 = 0x0a000003;
enum NTDDI_WIN10_RS3 = 0x0a000004;
enum NTDDI_WIN10_RS4 = 0x0a000005;
enum NTDDI_WIN10_RS5 = 0x0a000006;
enum NTDDI_WIN10_19H1 = 0x0a000007;
enum NTDDI_WIN10_VB = 0x0a000008;
enum NTDDI_WIN10_MN = 0x0a000009;
enum NTDDI_WIN10_FE = 0x0a00000a;
enum NTDDI_WIN10_CO = 0x0a00000b;
enum NTDDI_WIN10_NI = 0x0a00000c;
enum WDK_NTDDI_VERSION = 0x0a00000c;
enum OSVERSION_MASK = 0xffff0000;
enum SPVERSION_MASK = 0x0000ff00;
enum SUBVERSION_MASK = 0x000000ff;
enum NTDDI_VERSION = 0x0a00000c;
enum SCEX2_ALT_NETBIOS_NAME = 0x00000001;
struct GROUP_AFFINITY
{
    ulong Mask;
    ushort Group;
    ushort[3] Reserved;
}
struct SYSTEM_INFO
{
    union
    {
        uint dwOemId;
        struct
        {
            PROCESSOR_ARCHITECTURE wProcessorArchitecture;
            ushort wReserved;
        }
    }
    uint dwPageSize;
    void* lpMinimumApplicationAddress;
    void* lpMaximumApplicationAddress;
    ulong dwActiveProcessorMask;
    uint dwNumberOfProcessors;
    uint dwProcessorType;
    uint dwAllocationGranularity;
    ushort wProcessorLevel;
    ushort wProcessorRevision;
}
struct MEMORYSTATUSEX
{
    uint dwLength;
    uint dwMemoryLoad;
    ulong ullTotalPhys;
    ulong ullAvailPhys;
    ulong ullTotalPageFile;
    ulong ullAvailPageFile;
    ulong ullTotalVirtual;
    ulong ullAvailVirtual;
    ulong ullAvailExtendedVirtual;
}
alias COMPUTER_NAME_FORMAT = int;
enum : int
{
    ComputerNameNetBIOS                   = 0x00000000,
    ComputerNameDnsHostname               = 0x00000001,
    ComputerNameDnsDomain                 = 0x00000002,
    ComputerNameDnsFullyQualified         = 0x00000003,
    ComputerNamePhysicalNetBIOS           = 0x00000004,
    ComputerNamePhysicalDnsHostname       = 0x00000005,
    ComputerNamePhysicalDnsDomain         = 0x00000006,
    ComputerNamePhysicalDnsFullyQualified = 0x00000007,
    ComputerNameMax                       = 0x00000008,
}

alias DEVELOPER_DRIVE_ENABLEMENT_STATE = int;
enum : int
{
    DeveloperDriveEnablementStateError   = 0x00000000,
    DeveloperDriveEnabled                = 0x00000001,
    DeveloperDriveDisabledBySystemPolicy = 0x00000002,
    DeveloperDriveDisabledByGroupPolicy  = 0x00000003,
}

alias FIRMWARE_TYPE = int;
enum : int
{
    FirmwareTypeUnknown = 0x00000000,
    FirmwareTypeBios    = 0x00000001,
    FirmwareTypeUefi    = 0x00000002,
    FirmwareTypeMax     = 0x00000003,
}

alias LOGICAL_PROCESSOR_RELATIONSHIP = int;
enum : int
{
    RelationProcessorCore    = 0x00000000,
    RelationNumaNode         = 0x00000001,
    RelationCache            = 0x00000002,
    RelationProcessorPackage = 0x00000003,
    RelationGroup            = 0x00000004,
    RelationProcessorDie     = 0x00000005,
    RelationNumaNodeEx       = 0x00000006,
    RelationProcessorModule  = 0x00000007,
    RelationAll              = 0x0000ffff,
}

alias PROCESSOR_CACHE_TYPE = int;
enum : int
{
    CacheUnified     = 0x00000000,
    CacheInstruction = 0x00000001,
    CacheData        = 0x00000002,
    CacheTrace       = 0x00000003,
}

struct CACHE_DESCRIPTOR
{
    ubyte Level;
    ubyte Associativity;
    ushort LineSize;
    uint Size;
    PROCESSOR_CACHE_TYPE Type;
}
struct SYSTEM_LOGICAL_PROCESSOR_INFORMATION
{
    ulong ProcessorMask;
    LOGICAL_PROCESSOR_RELATIONSHIP Relationship;
    union
    {
        struct ProcessorCore
        {
            ubyte Flags;
        }
        struct NumaNode
        {
            uint NodeNumber;
        }
        CACHE_DESCRIPTOR Cache;
        ulong[2] Reserved;
    }
}
struct PROCESSOR_RELATIONSHIP
{
    ubyte Flags;
    ubyte EfficiencyClass;
    ubyte[20] Reserved;
    ushort GroupCount;
    GROUP_AFFINITY[1] GroupMask;
}
struct NUMA_NODE_RELATIONSHIP
{
    uint NodeNumber;
    ubyte[18] Reserved;
    ushort GroupCount;
    union
    {
        GROUP_AFFINITY GroupMask;
        GROUP_AFFINITY[1] GroupMasks;
    }
}
struct CACHE_RELATIONSHIP
{
    ubyte Level;
    ubyte Associativity;
    ushort LineSize;
    uint CacheSize;
    PROCESSOR_CACHE_TYPE Type;
    ubyte[18] Reserved;
    ushort GroupCount;
    union
    {
        GROUP_AFFINITY GroupMask;
        GROUP_AFFINITY[1] GroupMasks;
    }
}
struct PROCESSOR_GROUP_INFO
{
    ubyte MaximumProcessorCount;
    ubyte ActiveProcessorCount;
    ubyte[38] Reserved;
    ulong ActiveProcessorMask;
}
struct GROUP_RELATIONSHIP
{
    ushort MaximumGroupCount;
    ushort ActiveGroupCount;
    ubyte[20] Reserved;
    PROCESSOR_GROUP_INFO[1] GroupInfo;
}
struct SYSTEM_LOGICAL_PROCESSOR_INFORMATION_EX
{
    LOGICAL_PROCESSOR_RELATIONSHIP Relationship;
    uint Size;
    union
    {
        PROCESSOR_RELATIONSHIP Processor;
        NUMA_NODE_RELATIONSHIP NumaNode;
        CACHE_RELATIONSHIP Cache;
        GROUP_RELATIONSHIP Group;
    }
}
alias CPU_SET_INFORMATION_TYPE = int;
enum : int
{
    CpuSetInformation = 0x00000000,
}

struct SYSTEM_CPU_SET_INFORMATION
{
    uint Size;
    CPU_SET_INFORMATION_TYPE Type;
    union
    {
        struct CpuSet
        {
            uint Id;
            ushort Group;
            ubyte LogicalProcessorIndex;
            ubyte CoreIndex;
            ubyte LastLevelCacheIndex;
            ubyte NumaNodeIndex;
            ubyte EfficiencyClass;
            union
            {
                ubyte AllFlags;
                struct
                {
                    ubyte _bitfield0;
                }
            }
            union
            {
                uint Reserved;
                ubyte SchedulingClass;
            }
            ulong AllocationTag;
        }
    }
}
struct SYSTEM_POOL_ZEROING_INFORMATION
{
    BOOLEAN PoolZeroingSupportPresent;
}
struct SYSTEM_PROCESSOR_CYCLE_TIME_INFORMATION
{
    ulong CycleTime;
}
struct SYSTEM_SUPPORTED_PROCESSOR_ARCHITECTURES_INFORMATION
{
    uint _bitfield0;
}
struct OSVERSIONINFOA
{
    uint dwOSVersionInfoSize;
    uint dwMajorVersion;
    uint dwMinorVersion;
    uint dwBuildNumber;
    uint dwPlatformId;
    CHAR[128] szCSDVersion;
}
struct OSVERSIONINFOW
{
    uint dwOSVersionInfoSize;
    uint dwMajorVersion;
    uint dwMinorVersion;
    uint dwBuildNumber;
    uint dwPlatformId;
    wchar[128] szCSDVersion;
}
struct OSVERSIONINFOEXA
{
    uint dwOSVersionInfoSize;
    uint dwMajorVersion;
    uint dwMinorVersion;
    uint dwBuildNumber;
    uint dwPlatformId;
    CHAR[128] szCSDVersion;
    ushort wServicePackMajor;
    ushort wServicePackMinor;
    ushort wSuiteMask;
    ubyte wProductType;
    ubyte wReserved;
}
struct OSVERSIONINFOEXW
{
    uint dwOSVersionInfoSize;
    uint dwMajorVersion;
    uint dwMinorVersion;
    uint dwBuildNumber;
    uint dwPlatformId;
    wchar[128] szCSDVersion;
    ushort wServicePackMajor;
    ushort wServicePackMinor;
    ushort wSuiteMask;
    ubyte wProductType;
    ubyte wReserved;
}
alias OS_DEPLOYEMENT_STATE_VALUES = int;
enum : int
{
    OS_DEPLOYMENT_STANDARD = 0x00000001,
    OS_DEPLOYMENT_COMPACT  = 0x00000002,
}

alias RTL_SYSTEM_GLOBAL_DATA_ID = int;
enum : int
{
    GlobalDataIdUnknown                     = 0x00000000,
    GlobalDataIdRngSeedVersion              = 0x00000001,
    GlobalDataIdInterruptTime               = 0x00000002,
    GlobalDataIdTimeZoneBias                = 0x00000003,
    GlobalDataIdImageNumberLow              = 0x00000004,
    GlobalDataIdImageNumberHigh             = 0x00000005,
    GlobalDataIdTimeZoneId                  = 0x00000006,
    GlobalDataIdNtMajorVersion              = 0x00000007,
    GlobalDataIdNtMinorVersion              = 0x00000008,
    GlobalDataIdSystemExpirationDate        = 0x00000009,
    GlobalDataIdKdDebuggerEnabled           = 0x0000000a,
    GlobalDataIdCyclesPerYield              = 0x0000000b,
    GlobalDataIdSafeBootMode                = 0x0000000c,
    GlobalDataIdLastSystemRITEventTickCount = 0x0000000d,
    GlobalDataIdConsoleSharedDataFlags      = 0x0000000e,
    GlobalDataIdNtSystemRootDrive           = 0x0000000f,
    GlobalDataIdQpcShift                    = 0x00000010,
    GlobalDataIdQpcBypassEnabled            = 0x00000011,
    GlobalDataIdQpcData                     = 0x00000012,
    GlobalDataIdQpcBias                     = 0x00000013,
}

struct MEMORYSTATUS
{
    uint dwLength;
    uint dwMemoryLoad;
    ulong dwTotalPhys;
    ulong dwAvailPhys;
    ulong dwTotalPageFile;
    ulong dwAvailPageFile;
    ulong dwTotalVirtual;
    ulong dwAvailVirtual;
}
alias DEP_SYSTEM_POLICY_TYPE = int;
enum : int
{
    DEPPolicyAlwaysOff  = 0x00000000,
    DEPPolicyAlwaysOn   = 0x00000001,
    DEPPolicyOptIn      = 0x00000002,
    DEPPolicyOptOut     = 0x00000003,
    DEPTotalPolicyCount = 0x00000004,
}

alias PGET_SYSTEM_WOW64_DIRECTORY_A = uint function(PSTR, uint);
alias PGET_SYSTEM_WOW64_DIRECTORY_W = uint function(PWSTR, uint);
