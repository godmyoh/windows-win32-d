module windows.win32.system.power;

import windows.win32.guid : GUID;
import windows.win32.devices.properties : DEVPROPKEY;
import windows.win32.foundation : BOOL, BOOLEAN, HANDLE, HRESULT, LPARAM, NTSTATUS, PWSTR, WIN32_ERROR;
import windows.win32.system.registry : HKEY, REG_SAM_FLAGS;
import windows.win32.system.threading : REASON_CONTEXT;
import windows.win32.ui.windowsandmessaging : REGISTER_NOTIFICATION_FLAGS;

version (Windows):
extern (Windows):

alias POWER_COOLING_MODE = ushort;
enum : ushort
{
    PO_TZ_ACTIVE       = 0x0000,
    PO_TZ_PASSIVE      = 0x0001,
    PO_TZ_INVALID_MODE = 0x0002,
}

struct PROCESSOR_POWER_INFORMATION
{
    uint Number;
    uint MaxMhz;
    uint CurrentMhz;
    uint MhzLimit;
    uint MaxIdleState;
    uint CurrentIdleState;
}
struct SYSTEM_POWER_INFORMATION
{
    uint MaxIdlenessAllowed;
    uint Idleness;
    uint TimeRemaining;
    POWER_COOLING_MODE CoolingMode;
}
alias POWER_PLATFORM_ROLE_VERSION = uint;
enum : uint
{
    POWER_PLATFORM_ROLE_V1 = 0x00000001,
    POWER_PLATFORM_ROLE_V2 = 0x00000002,
}

alias EXECUTION_STATE = uint;
enum : uint
{
    ES_AWAYMODE_REQUIRED = 0x00000040,
    ES_CONTINUOUS        = 0x80000000,
    ES_DISPLAY_REQUIRED  = 0x00000002,
    ES_SYSTEM_REQUIRED   = 0x00000001,
    ES_USER_PRESENT      = 0x00000004,
}

alias POWER_ACTION_POLICY_EVENT_CODE = uint;
enum : uint
{
    POWER_FORCE_TRIGGER_RESET     = 0x80000000,
    POWER_LEVEL_USER_NOTIFY_EXEC  = 0x00000004,
    POWER_LEVEL_USER_NOTIFY_SOUND = 0x00000002,
    POWER_LEVEL_USER_NOTIFY_TEXT  = 0x00000001,
    POWER_USER_NOTIFY_BUTTON      = 0x00000008,
    POWER_USER_NOTIFY_SHUTDOWN    = 0x00000010,
}

NTSTATUS CallNtPowerInformation(POWER_INFORMATION_LEVEL, void*, uint, void*, uint);
BOOLEAN GetPwrCapabilities(SYSTEM_POWER_CAPABILITIES*);
POWER_PLATFORM_ROLE PowerDeterminePlatformRoleEx(POWER_PLATFORM_ROLE_VERSION);
WIN32_ERROR PowerRegisterSuspendResumeNotification(REGISTER_NOTIFICATION_FLAGS, HANDLE, void**);
WIN32_ERROR PowerUnregisterSuspendResumeNotification(HPOWERNOTIFY);
WIN32_ERROR PowerReadACValue(HKEY, const(GUID)*, const(GUID)*, const(GUID)*, uint*, ubyte*, uint*);
WIN32_ERROR PowerReadDCValue(HKEY, const(GUID)*, const(GUID)*, const(GUID)*, uint*, ubyte*, uint*);
uint PowerWriteACValueIndex(HKEY, const(GUID)*, const(GUID)*, const(GUID)*, uint);
uint PowerWriteDCValueIndex(HKEY, const(GUID)*, const(GUID)*, const(GUID)*, uint);
WIN32_ERROR PowerGetActiveScheme(HKEY, GUID**);
WIN32_ERROR PowerSetActiveScheme(HKEY, const(GUID)*);
WIN32_ERROR PowerSettingRegisterNotification(const(GUID)*, REGISTER_NOTIFICATION_FLAGS, HANDLE, void**);
WIN32_ERROR PowerSettingUnregisterNotification(HPOWERNOTIFY);
HRESULT PowerRegisterForEffectivePowerModeNotifications(uint, EFFECTIVE_POWER_MODE_CALLBACK, void*, void**);
HRESULT PowerUnregisterFromEffectivePowerModeNotifications(void*);
BOOLEAN GetPwrDiskSpindownRange(uint*, uint*);
BOOLEAN EnumPwrSchemes(PWRSCHEMESENUMPROC, LPARAM);
BOOLEAN ReadGlobalPwrPolicy(GLOBAL_POWER_POLICY*);
BOOLEAN ReadPwrScheme(uint, POWER_POLICY*);
BOOLEAN WritePwrScheme(uint*, const(wchar)*, const(wchar)*, POWER_POLICY*);
BOOLEAN WriteGlobalPwrPolicy(GLOBAL_POWER_POLICY*);
BOOLEAN DeletePwrScheme(uint);
BOOLEAN GetActivePwrScheme(uint*);
BOOLEAN SetActivePwrScheme(uint, GLOBAL_POWER_POLICY*, POWER_POLICY*);
BOOLEAN IsPwrSuspendAllowed();
BOOLEAN IsPwrHibernateAllowed();
BOOLEAN IsPwrShutdownAllowed();
BOOLEAN IsAdminOverrideActive(ADMINISTRATOR_POWER_POLICY*);
BOOLEAN SetSuspendState(BOOLEAN, BOOLEAN, BOOLEAN);
BOOLEAN GetCurrentPowerPolicies(GLOBAL_POWER_POLICY*, POWER_POLICY*);
BOOLEAN CanUserWritePwrScheme();
BOOLEAN ReadProcessorPwrScheme(uint, MACHINE_PROCESSOR_POWER_POLICY*);
BOOLEAN WriteProcessorPwrScheme(uint, MACHINE_PROCESSOR_POWER_POLICY*);
BOOLEAN ValidatePowerPolicies(GLOBAL_POWER_POLICY*, POWER_POLICY*);
BOOLEAN PowerIsSettingRangeDefined(const(GUID)*, const(GUID)*);
WIN32_ERROR PowerSettingAccessCheckEx(POWER_DATA_ACCESSOR, const(GUID)*, REG_SAM_FLAGS);
WIN32_ERROR PowerSettingAccessCheck(POWER_DATA_ACCESSOR, const(GUID)*);
uint PowerReadACValueIndex(HKEY, const(GUID)*, const(GUID)*, const(GUID)*, uint*);
uint PowerReadDCValueIndex(HKEY, const(GUID)*, const(GUID)*, const(GUID)*, uint*);
WIN32_ERROR PowerReadFriendlyName(HKEY, const(GUID)*, const(GUID)*, const(GUID)*, ubyte*, uint*);
WIN32_ERROR PowerReadDescription(HKEY, const(GUID)*, const(GUID)*, const(GUID)*, ubyte*, uint*);
WIN32_ERROR PowerReadPossibleValue(HKEY, const(GUID)*, const(GUID)*, uint*, uint, ubyte*, uint*);
WIN32_ERROR PowerReadPossibleFriendlyName(HKEY, const(GUID)*, const(GUID)*, uint, ubyte*, uint*);
WIN32_ERROR PowerReadPossibleDescription(HKEY, const(GUID)*, const(GUID)*, uint, ubyte*, uint*);
WIN32_ERROR PowerReadValueMin(HKEY, const(GUID)*, const(GUID)*, uint*);
WIN32_ERROR PowerReadValueMax(HKEY, const(GUID)*, const(GUID)*, uint*);
WIN32_ERROR PowerReadValueIncrement(HKEY, const(GUID)*, const(GUID)*, uint*);
WIN32_ERROR PowerReadValueUnitsSpecifier(HKEY, const(GUID)*, const(GUID)*, ubyte*, uint*);
uint PowerReadACDefaultIndex(HKEY, const(GUID)*, const(GUID)*, const(GUID)*, uint*);
uint PowerReadDCDefaultIndex(HKEY, const(GUID)*, const(GUID)*, const(GUID)*, uint*);
WIN32_ERROR PowerReadIconResourceSpecifier(HKEY, const(GUID)*, const(GUID)*, const(GUID)*, ubyte*, uint*);
uint PowerReadSettingAttributes(const(GUID)*, const(GUID)*);
WIN32_ERROR PowerWriteFriendlyName(HKEY, const(GUID)*, const(GUID)*, const(GUID)*, ubyte*, uint);
WIN32_ERROR PowerWriteDescription(HKEY, const(GUID)*, const(GUID)*, const(GUID)*, ubyte*, uint);
WIN32_ERROR PowerWritePossibleValue(HKEY, const(GUID)*, const(GUID)*, uint, uint, ubyte*, uint);
WIN32_ERROR PowerWritePossibleFriendlyName(HKEY, const(GUID)*, const(GUID)*, uint, ubyte*, uint);
WIN32_ERROR PowerWritePossibleDescription(HKEY, const(GUID)*, const(GUID)*, uint, ubyte*, uint);
WIN32_ERROR PowerWriteValueMin(HKEY, const(GUID)*, const(GUID)*, uint);
WIN32_ERROR PowerWriteValueMax(HKEY, const(GUID)*, const(GUID)*, uint);
WIN32_ERROR PowerWriteValueIncrement(HKEY, const(GUID)*, const(GUID)*, uint);
WIN32_ERROR PowerWriteValueUnitsSpecifier(HKEY, const(GUID)*, const(GUID)*, ubyte*, uint);
uint PowerWriteACDefaultIndex(HKEY, const(GUID)*, const(GUID)*, const(GUID)*, uint);
uint PowerWriteDCDefaultIndex(HKEY, const(GUID)*, const(GUID)*, const(GUID)*, uint);
WIN32_ERROR PowerWriteIconResourceSpecifier(HKEY, const(GUID)*, const(GUID)*, const(GUID)*, ubyte*, uint);
WIN32_ERROR PowerWriteSettingAttributes(const(GUID)*, const(GUID)*, uint);
WIN32_ERROR PowerDuplicateScheme(HKEY, const(GUID)*, GUID**);
WIN32_ERROR PowerImportPowerScheme(HKEY, const(wchar)*, GUID**);
WIN32_ERROR PowerDeleteScheme(HKEY, const(GUID)*);
WIN32_ERROR PowerRemovePowerSetting(const(GUID)*, const(GUID)*);
WIN32_ERROR PowerCreateSetting(HKEY, const(GUID)*, const(GUID)*);
WIN32_ERROR PowerCreatePossibleSetting(HKEY, const(GUID)*, const(GUID)*, uint);
WIN32_ERROR PowerEnumerate(HKEY, const(GUID)*, const(GUID)*, POWER_DATA_ACCESSOR, uint, ubyte*, uint*);
uint PowerOpenUserPowerKey(HKEY*, uint, BOOL);
uint PowerOpenSystemPowerKey(HKEY*, uint, BOOL);
WIN32_ERROR PowerCanRestoreIndividualDefaultPowerScheme(const(GUID)*);
WIN32_ERROR PowerRestoreIndividualDefaultPowerScheme(const(GUID)*);
WIN32_ERROR PowerRestoreDefaultPowerSchemes();
uint PowerReplaceDefaultPowerSchemes();
POWER_PLATFORM_ROLE PowerDeterminePlatformRole();
BOOLEAN DevicePowerEnumDevices(uint, uint, uint, ubyte*, uint*);
uint DevicePowerSetDeviceState(const(wchar)*, uint, void*);
BOOLEAN DevicePowerOpen(uint);
BOOLEAN DevicePowerClose();
WIN32_ERROR PowerReportThermalEvent(THERMAL_EVENT*);
HPOWERNOTIFY RegisterPowerSettingNotification(HANDLE, const(GUID)*, uint);
BOOL UnregisterPowerSettingNotification(HPOWERNOTIFY);
HPOWERNOTIFY RegisterSuspendResumeNotification(HANDLE, REGISTER_NOTIFICATION_FLAGS);
BOOL UnregisterSuspendResumeNotification(HPOWERNOTIFY);
BOOL RequestWakeupLatency(LATENCY_TIME);
BOOL IsSystemResumeAutomatic();
EXECUTION_STATE SetThreadExecutionState(EXECUTION_STATE);
HANDLE PowerCreateRequest(REASON_CONTEXT*);
BOOL PowerSetRequest(HANDLE, POWER_REQUEST_TYPE);
BOOL PowerClearRequest(HANDLE, POWER_REQUEST_TYPE);
BOOL GetDevicePowerState(HANDLE, BOOL*);
BOOL SetSystemPowerState(BOOL, BOOL);
BOOL GetSystemPowerStatus(SYSTEM_POWER_STATUS*);
enum PPM_FIRMWARE_ACPI1C2 = 0x00000001;
enum PPM_FIRMWARE_ACPI1C3 = 0x00000002;
enum PPM_FIRMWARE_ACPI1TSTATES = 0x00000004;
enum PPM_FIRMWARE_CST = 0x00000008;
enum PPM_FIRMWARE_CSD = 0x00000010;
enum PPM_FIRMWARE_PCT = 0x00000020;
enum PPM_FIRMWARE_PSS = 0x00000040;
enum PPM_FIRMWARE_XPSS = 0x00000080;
enum PPM_FIRMWARE_PPC = 0x00000100;
enum PPM_FIRMWARE_PSD = 0x00000200;
enum PPM_FIRMWARE_PTC = 0x00000400;
enum PPM_FIRMWARE_TSS = 0x00000800;
enum PPM_FIRMWARE_TPC = 0x00001000;
enum PPM_FIRMWARE_TSD = 0x00002000;
enum PPM_FIRMWARE_PCCH = 0x00004000;
enum PPM_FIRMWARE_PCCP = 0x00008000;
enum PPM_FIRMWARE_OSC = 0x00010000;
enum PPM_FIRMWARE_PDC = 0x00020000;
enum PPM_FIRMWARE_CPC = 0x00040000;
enum PPM_FIRMWARE_LPI = 0x00080000;
enum PPM_PERFORMANCE_IMPLEMENTATION_NONE = 0x00000000;
enum PPM_PERFORMANCE_IMPLEMENTATION_PSTATES = 0x00000001;
enum PPM_PERFORMANCE_IMPLEMENTATION_PCCV1 = 0x00000002;
enum PPM_PERFORMANCE_IMPLEMENTATION_CPPC = 0x00000003;
enum PPM_PERFORMANCE_IMPLEMENTATION_PEP = 0x00000004;
enum PPM_IDLE_IMPLEMENTATION_NONE = 0x00000000;
enum PPM_IDLE_IMPLEMENTATION_CSTATES = 0x00000001;
enum PPM_IDLE_IMPLEMENTATION_PEP = 0x00000002;
enum PPM_IDLE_IMPLEMENTATION_MICROPEP = 0x00000003;
enum PPM_IDLE_IMPLEMENTATION_LPISTATES = 0x00000004;
enum PPM_PERFSTATE_CHANGE_GUID = GUID(0xa5b32ddd, 0x7f39, 0x4abc, [0xb8, 0x92, 0x90, 0xe, 0x43, 0xb5, 0x9e, 0xbb]);
enum PPM_PERFSTATE_DOMAIN_CHANGE_GUID = GUID(0x995e6b7f, 0xd653, 0x497a, [0xb9, 0x78, 0x36, 0xa3, 0xc, 0x29, 0xbf, 0x1]);
enum PPM_IDLESTATE_CHANGE_GUID = GUID(0x4838fe4f, 0xf71c, 0x4e51, [0x9e, 0xcc, 0x84, 0x30, 0xa7, 0xac, 0x4c, 0x6c]);
enum PPM_PERFSTATES_DATA_GUID = GUID(0x5708cc20, 0x7d40, 0x4bf4, [0xb4, 0xaa, 0x2b, 0x1, 0x33, 0x8d, 0x1, 0x26]);
enum PPM_IDLESTATES_DATA_GUID = GUID(0xba138e10, 0xe250, 0x4ad7, [0x86, 0x16, 0xcf, 0x1a, 0x7a, 0xd4, 0x10, 0xe7]);
enum PPM_IDLE_ACCOUNTING_GUID = GUID(0xe2a26f78, 0xae07, 0x4ee0, [0xa3, 0xf, 0xce, 0x54, 0xf5, 0x5a, 0x94, 0xcd]);
enum PPM_IDLE_ACCOUNTING_EX_GUID = GUID(0xd67abd39, 0x81f8, 0x4a5e, [0x81, 0x52, 0x72, 0xe3, 0x1e, 0xc9, 0x12, 0xee]);
enum PPM_THERMALCONSTRAINT_GUID = GUID(0xa852c2c8, 0x1a4c, 0x423b, [0x8c, 0x2c, 0xf3, 0xd, 0x82, 0x93, 0x1a, 0x88]);
enum PPM_PERFMON_PERFSTATE_GUID = GUID(0x7fd18652, 0xcfe, 0x40d2, [0xb0, 0xa1, 0xb, 0x6, 0x6a, 0x87, 0x75, 0x9e]);
enum PPM_THERMAL_POLICY_CHANGE_GUID = GUID(0x48f377b8, 0x6880, 0x4c7b, [0x8b, 0xdc, 0x38, 0x1, 0x76, 0xc6, 0x65, 0x4d]);
enum PROCESSOR_NUMBER_PKEY = DEVPROPKEY(GUID(1462028317, 54703, 19487, [161, 3, 160, 110, 40, 242, 4, 198]), 1);
enum GUID_DEVICE_BATTERY = GUID(0x72631e54, 0x78a4, 0x11d0, [0xbc, 0xf7, 0x0, 0xaa, 0x0, 0xb7, 0xb3, 0x2a]);
enum GUID_DEVICE_APPLICATIONLAUNCH_BUTTON = GUID(0x629758ee, 0x986e, 0x4d9e, [0x8e, 0x47, 0xde, 0x27, 0xf8, 0xab, 0x5, 0x4d]);
enum GUID_DEVICE_SYS_BUTTON = GUID(0x4afa3d53, 0x74a7, 0x11d0, [0xbe, 0x5e, 0x0, 0xa0, 0xc9, 0x6, 0x28, 0x57]);
enum GUID_DEVICE_LID = GUID(0x4afa3d52, 0x74a7, 0x11d0, [0xbe, 0x5e, 0x0, 0xa0, 0xc9, 0x6, 0x28, 0x57]);
enum GUID_DEVICE_THERMAL_ZONE = GUID(0x4afa3d51, 0x74a7, 0x11d0, [0xbe, 0x5e, 0x0, 0xa0, 0xc9, 0x6, 0x28, 0x57]);
enum GUID_DEVICE_FAN = GUID(0x5ecd13d, 0x81da, 0x4a2a, [0x8a, 0x4c, 0x52, 0x4f, 0x23, 0xdd, 0x4d, 0xc9]);
enum GUID_DEVICE_PROCESSOR = GUID(0x97fadb10, 0x4e33, 0x40ae, [0x35, 0x9c, 0x8b, 0xef, 0x2, 0x9d, 0xbd, 0xd0]);
enum GUID_DEVICE_MEMORY = GUID(0x3fd0f03d, 0x92e0, 0x45fb, [0xb7, 0x5c, 0x5e, 0xd8, 0xff, 0xb0, 0x10, 0x21]);
enum GUID_DEVICE_ACPI_TIME = GUID(0x97f99bf6, 0x4497, 0x4f18, [0xbb, 0x22, 0x4b, 0x9f, 0xb2, 0xfb, 0xef, 0x9c]);
enum GUID_DEVICE_MESSAGE_INDICATOR = GUID(0xcd48a365, 0xfa94, 0x4ce2, [0xa2, 0x32, 0xa1, 0xb7, 0x64, 0xe5, 0xd8, 0xb4]);
enum GUID_CLASS_INPUT = GUID(0x4d1e55b2, 0xf16f, 0x11cf, [0x88, 0xcb, 0x0, 0x11, 0x11, 0x0, 0x0, 0x30]);
enum GUID_DEVINTERFACE_THERMAL_COOLING = GUID(0xdbe4373d, 0x3c81, 0x40cb, [0xac, 0xe4, 0xe0, 0xe5, 0xd0, 0x5f, 0xc, 0x9f]);
enum GUID_DEVINTERFACE_THERMAL_MANAGER = GUID(0x927ec093, 0x69a4, 0x4bc0, [0xbd, 0x2, 0x71, 0x16, 0x64, 0x71, 0x44, 0x63]);
enum BATTERY_UNKNOWN_CAPACITY = 0xffffffff;
enum UNKNOWN_CAPACITY = 0xffffffff;
enum BATTERY_SYSTEM_BATTERY = 0x80000000;
enum BATTERY_CAPACITY_RELATIVE = 0x40000000;
enum BATTERY_IS_SHORT_TERM = 0x20000000;
enum BATTERY_SEALED = 0x10000000;
enum BATTERY_SET_CHARGE_SUPPORTED = 0x00000001;
enum BATTERY_SET_DISCHARGE_SUPPORTED = 0x00000002;
enum BATTERY_SET_CHARGINGSOURCE_SUPPORTED = 0x00000004;
enum BATTERY_SET_CHARGER_ID_SUPPORTED = 0x00000008;
enum BATTERY_UNKNOWN_TIME = 0xffffffff;
enum BATTERY_UNKNOWN_CURRENT = 0xffffffff;
enum UNKNOWN_CURRENT = 0xffffffff;
enum BATTERY_USB_CHARGER_STATUS_FN_DEFAULT_USB = 0x00000001;
enum BATTERY_USB_CHARGER_STATUS_UCM_PD = 0x00000002;
enum BATTERY_UNKNOWN_VOLTAGE = 0xffffffff;
enum BATTERY_UNKNOWN_RATE = 0x80000000;
enum UNKNOWN_RATE = 0x80000000;
enum UNKNOWN_VOLTAGE = 0xffffffff;
enum BATTERY_POWER_ON_LINE = 0x00000001;
enum BATTERY_DISCHARGING = 0x00000002;
enum BATTERY_CHARGING = 0x00000004;
enum BATTERY_CRITICAL = 0x00000008;
enum MAX_BATTERY_STRING_SIZE = 0x00000080;
enum IOCTL_BATTERY_QUERY_TAG = 0x00294040;
enum IOCTL_BATTERY_QUERY_INFORMATION = 0x00294044;
enum IOCTL_BATTERY_SET_INFORMATION = 0x00298048;
enum IOCTL_BATTERY_QUERY_STATUS = 0x0029404c;
enum IOCTL_BATTERY_CHARGING_SOURCE_CHANGE = 0x00294050;
enum BATTERY_TAG_INVALID = 0x00000000;
enum MAX_ACTIVE_COOLING_LEVELS = 0x0000000a;
enum ACTIVE_COOLING = 0x00000000;
enum PASSIVE_COOLING = 0x00000001;
enum TZ_ACTIVATION_REASON_THERMAL = 0x00000001;
enum TZ_ACTIVATION_REASON_CURRENT = 0x00000002;
enum THERMAL_POLICY_VERSION_1 = 0x00000001;
enum THERMAL_POLICY_VERSION_2 = 0x00000002;
enum IOCTL_THERMAL_QUERY_INFORMATION = 0x00294080;
enum IOCTL_THERMAL_SET_COOLING_POLICY = 0x00298084;
enum IOCTL_RUN_ACTIVE_COOLING_METHOD = 0x00298088;
enum IOCTL_THERMAL_SET_PASSIVE_LIMIT = 0x0029808c;
enum IOCTL_THERMAL_READ_TEMPERATURE = 0x00294090;
enum IOCTL_THERMAL_READ_POLICY = 0x00294094;
enum IOCTL_QUERY_LID = 0x002940c0;
enum IOCTL_NOTIFY_SWITCH_EVENT = 0x00294100;
enum IOCTL_GET_SYS_BUTTON_CAPS = 0x00294140;
enum IOCTL_GET_SYS_BUTTON_EVENT = 0x00294144;
enum SYS_BUTTON_POWER = 0x00000001;
enum SYS_BUTTON_SLEEP = 0x00000002;
enum SYS_BUTTON_LID = 0x00000004;
enum SYS_BUTTON_WAKE = 0x80000000;
enum SYS_BUTTON_LID_STATE_MASK = 0x00030000;
enum SYS_BUTTON_LID_OPEN = 0x00010000;
enum SYS_BUTTON_LID_CLOSED = 0x00020000;
enum SYS_BUTTON_LID_INITIAL = 0x00040000;
enum SYS_BUTTON_LID_CHANGED = 0x00080000;
enum IOCTL_GET_PROCESSOR_OBJ_INFO = 0x00294180;
enum THERMAL_COOLING_INTERFACE_VERSION = 0x00000001;
enum THERMAL_DEVICE_INTERFACE_VERSION = 0x00000001;
enum IOCTL_SET_SYS_MESSAGE_INDICATOR = 0x002981c0;
enum IOCTL_SET_WAKE_ALARM_VALUE = 0x00298200;
enum IOCTL_SET_WAKE_ALARM_POLICY = 0x00298204;
enum IOCTL_GET_WAKE_ALARM_VALUE = 0x0029c208;
enum IOCTL_GET_WAKE_ALARM_POLICY = 0x0029c20c;
enum ACPI_TIME_ADJUST_DAYLIGHT = 0x00000001;
enum ACPI_TIME_IN_DAYLIGHT = 0x00000002;
enum ACPI_TIME_ZONE_UNKNOWN = 0x000007ff;
enum IOCTL_ACPI_GET_REAL_TIME = 0x00294210;
enum IOCTL_ACPI_SET_REAL_TIME = 0x00298214;
enum IOCTL_GET_WAKE_ALARM_SYSTEM_POWERSTATE = 0x00294218;
enum IOCTL_GET_ACPI_TIME_AND_ALARM_CAPABILITIES = 0x0029421c;
enum BATTERY_STATUS_WMI_GUID = GUID(0xfc4670d1, 0xebbf, 0x416e, [0x87, 0xce, 0x37, 0x4a, 0x4e, 0xbc, 0x11, 0x1a]);
enum BATTERY_RUNTIME_WMI_GUID = GUID(0x535a3767, 0x1ac2, 0x49bc, [0xa0, 0x77, 0x3f, 0x7a, 0x2, 0xe4, 0xa, 0xec]);
enum BATTERY_TEMPERATURE_WMI_GUID = GUID(0x1a52a14d, 0xadce, 0x4a44, [0x9a, 0x3e, 0xc8, 0xd8, 0xf1, 0x5f, 0xf2, 0xc2]);
enum BATTERY_FULL_CHARGED_CAPACITY_WMI_GUID = GUID(0x40b40565, 0x96f7, 0x4435, [0x86, 0x94, 0x97, 0xe0, 0xe4, 0x39, 0x59, 0x5]);
enum BATTERY_CYCLE_COUNT_WMI_GUID = GUID(0xef98db24, 0x14, 0x4c25, [0xa5, 0xb, 0xc7, 0x24, 0xae, 0x5c, 0xd3, 0x71]);
enum BATTERY_STATIC_DATA_WMI_GUID = GUID(0x5e1e463, 0xe4e2, 0x4ea9, [0x80, 0xcb, 0x9b, 0xd4, 0xb3, 0xca, 0x6, 0x55]);
enum BATTERY_STATUS_CHANGE_WMI_GUID = GUID(0xcddfa0c3, 0x7c5b, 0x4e43, [0xa0, 0x34, 0x5, 0x9f, 0xa5, 0xb8, 0x43, 0x64]);
enum BATTERY_TAG_CHANGE_WMI_GUID = GUID(0x5e1f6e19, 0x8786, 0x4d23, [0x94, 0xfc, 0x9e, 0x74, 0x6b, 0xd5, 0xd8, 0x88]);
enum BATTERY_MINIPORT_UPDATE_DATA_VER_1 = 0x00000001;
enum BATTERY_MINIPORT_UPDATE_DATA_VER_2 = 0x00000002;
enum BATTERY_CLASS_MAJOR_VERSION = 0x00000001;
enum BATTERY_CLASS_MINOR_VERSION = 0x00000000;
enum BATTERY_CLASS_MINOR_VERSION_1 = 0x00000001;
enum GUID_DEVICE_ENERGY_METER = GUID(0x45bd8344, 0x7ed6, 0x49cf, [0xa4, 0x40, 0xc2, 0x76, 0xc9, 0x33, 0xb0, 0x53]);
enum IOCTL_EMI_GET_VERSION = 0x00224000;
enum IOCTL_EMI_GET_METADATA_SIZE = 0x00224004;
enum IOCTL_EMI_GET_METADATA = 0x00224008;
enum IOCTL_EMI_GET_MEASUREMENT = 0x0022400c;
enum EMI_NAME_MAX = 0x00000010;
enum EMI_VERSION_V1 = 0x00000001;
enum EMI_VERSION_V2 = 0x00000002;
enum EFFECTIVE_POWER_MODE_V1 = 0x00000001;
enum EFFECTIVE_POWER_MODE_V2 = 0x00000002;
enum EnableSysTrayBatteryMeter = 0x00000001;
enum EnableMultiBatteryDisplay = 0x00000002;
enum EnablePasswordLogon = 0x00000004;
enum EnableWakeOnRing = 0x00000008;
enum EnableVideoDimDisplay = 0x00000010;
enum POWER_ATTRIBUTE_HIDE = 0x00000001;
enum POWER_ATTRIBUTE_SHOW_AOAC = 0x00000002;
enum DEVICEPOWER_HARDWAREID = 0x80000000;
enum DEVICEPOWER_AND_OPERATION = 0x40000000;
enum DEVICEPOWER_FILTER_DEVICES_PRESENT = 0x20000000;
enum DEVICEPOWER_FILTER_HARDWARE = 0x10000000;
enum DEVICEPOWER_FILTER_WAKEENABLED = 0x08000000;
enum DEVICEPOWER_FILTER_WAKEPROGRAMMABLE = 0x04000000;
enum DEVICEPOWER_FILTER_ON_NAME = 0x02000000;
enum DEVICEPOWER_SET_WAKEENABLED = 0x00000001;
enum DEVICEPOWER_CLEAR_WAKEENABLED = 0x00000002;
enum PDCAP_S0_SUPPORTED = 0x00010000;
enum PDCAP_S1_SUPPORTED = 0x00020000;
enum PDCAP_S2_SUPPORTED = 0x00040000;
enum PDCAP_S3_SUPPORTED = 0x00080000;
enum PDCAP_WAKE_FROM_S0_SUPPORTED = 0x00100000;
enum PDCAP_WAKE_FROM_S1_SUPPORTED = 0x00200000;
enum PDCAP_WAKE_FROM_S2_SUPPORTED = 0x00400000;
enum PDCAP_WAKE_FROM_S3_SUPPORTED = 0x00800000;
enum PDCAP_S4_SUPPORTED = 0x01000000;
enum PDCAP_S5_SUPPORTED = 0x02000000;
enum THERMAL_EVENT_VERSION = 0x00000001;
alias HPOWERNOTIFY = void*;
alias EFFECTIVE_POWER_MODE = int;
enum : int
{
    EffectivePowerModeBatterySaver    = 0x00000000,
    EffectivePowerModeBetterBattery   = 0x00000001,
    EffectivePowerModeBalanced        = 0x00000002,
    EffectivePowerModeHighPerformance = 0x00000003,
    EffectivePowerModeMaxPerformance  = 0x00000004,
    EffectivePowerModeGameMode        = 0x00000005,
    EffectivePowerModeMixedReality    = 0x00000006,
}

alias EFFECTIVE_POWER_MODE_CALLBACK = void function(EFFECTIVE_POWER_MODE, void*);
struct GLOBAL_MACHINE_POWER_POLICY
{
    uint Revision;
    SYSTEM_POWER_STATE LidOpenWakeAc;
    SYSTEM_POWER_STATE LidOpenWakeDc;
    uint BroadcastCapacityResolution;
}
struct GLOBAL_USER_POWER_POLICY
{
    uint Revision;
    POWER_ACTION_POLICY PowerButtonAc;
    POWER_ACTION_POLICY PowerButtonDc;
    POWER_ACTION_POLICY SleepButtonAc;
    POWER_ACTION_POLICY SleepButtonDc;
    POWER_ACTION_POLICY LidCloseAc;
    POWER_ACTION_POLICY LidCloseDc;
    SYSTEM_POWER_LEVEL[4] DischargePolicy;
    uint GlobalFlags;
}
struct GLOBAL_POWER_POLICY
{
    GLOBAL_USER_POWER_POLICY user;
    GLOBAL_MACHINE_POWER_POLICY mach;
}
struct MACHINE_POWER_POLICY
{
    uint Revision;
    SYSTEM_POWER_STATE MinSleepAc;
    SYSTEM_POWER_STATE MinSleepDc;
    SYSTEM_POWER_STATE ReducedLatencySleepAc;
    SYSTEM_POWER_STATE ReducedLatencySleepDc;
    uint DozeTimeoutAc;
    uint DozeTimeoutDc;
    uint DozeS4TimeoutAc;
    uint DozeS4TimeoutDc;
    ubyte MinThrottleAc;
    ubyte MinThrottleDc;
    ubyte[2] pad1;
    POWER_ACTION_POLICY OverThrottledAc;
    POWER_ACTION_POLICY OverThrottledDc;
}
struct MACHINE_PROCESSOR_POWER_POLICY
{
    uint Revision;
    PROCESSOR_POWER_POLICY ProcessorPolicyAc;
    PROCESSOR_POWER_POLICY ProcessorPolicyDc;
}
struct USER_POWER_POLICY
{
    uint Revision;
    POWER_ACTION_POLICY IdleAc;
    POWER_ACTION_POLICY IdleDc;
    uint IdleTimeoutAc;
    uint IdleTimeoutDc;
    ubyte IdleSensitivityAc;
    ubyte IdleSensitivityDc;
    ubyte ThrottlePolicyAc;
    ubyte ThrottlePolicyDc;
    SYSTEM_POWER_STATE MaxSleepAc;
    SYSTEM_POWER_STATE MaxSleepDc;
    uint[2] Reserved;
    uint VideoTimeoutAc;
    uint VideoTimeoutDc;
    uint SpindownTimeoutAc;
    uint SpindownTimeoutDc;
    BOOLEAN OptimizeForPowerAc;
    BOOLEAN OptimizeForPowerDc;
    ubyte FanThrottleToleranceAc;
    ubyte FanThrottleToleranceDc;
    ubyte ForcedThrottleAc;
    ubyte ForcedThrottleDc;
}
struct POWER_POLICY
{
    USER_POWER_POLICY user;
    MACHINE_POWER_POLICY mach;
}
alias PWRSCHEMESENUMPROC_V1 = BOOLEAN function(uint, uint, byte*, uint, byte*, POWER_POLICY*, LPARAM);
alias PWRSCHEMESENUMPROC = BOOLEAN function(uint, uint, PWSTR, uint, PWSTR, POWER_POLICY*, LPARAM);
alias POWER_DATA_ACCESSOR = int;
enum : int
{
    ACCESS_AC_POWER_SETTING_INDEX               = 0x00000000,
    ACCESS_DC_POWER_SETTING_INDEX               = 0x00000001,
    ACCESS_FRIENDLY_NAME                        = 0x00000002,
    ACCESS_DESCRIPTION                          = 0x00000003,
    ACCESS_POSSIBLE_POWER_SETTING               = 0x00000004,
    ACCESS_POSSIBLE_POWER_SETTING_FRIENDLY_NAME = 0x00000005,
    ACCESS_POSSIBLE_POWER_SETTING_DESCRIPTION   = 0x00000006,
    ACCESS_DEFAULT_AC_POWER_SETTING             = 0x00000007,
    ACCESS_DEFAULT_DC_POWER_SETTING             = 0x00000008,
    ACCESS_POSSIBLE_VALUE_MIN                   = 0x00000009,
    ACCESS_POSSIBLE_VALUE_MAX                   = 0x0000000a,
    ACCESS_POSSIBLE_VALUE_INCREMENT             = 0x0000000b,
    ACCESS_POSSIBLE_VALUE_UNITS                 = 0x0000000c,
    ACCESS_ICON_RESOURCE                        = 0x0000000d,
    ACCESS_DEFAULT_SECURITY_DESCRIPTOR          = 0x0000000e,
    ACCESS_ATTRIBUTES                           = 0x0000000f,
    ACCESS_SCHEME                               = 0x00000010,
    ACCESS_SUBGROUP                             = 0x00000011,
    ACCESS_INDIVIDUAL_SETTING                   = 0x00000012,
    ACCESS_ACTIVE_SCHEME                        = 0x00000013,
    ACCESS_CREATE_SCHEME                        = 0x00000014,
    ACCESS_AC_POWER_SETTING_MAX                 = 0x00000015,
    ACCESS_DC_POWER_SETTING_MAX                 = 0x00000016,
    ACCESS_AC_POWER_SETTING_MIN                 = 0x00000017,
    ACCESS_DC_POWER_SETTING_MIN                 = 0x00000018,
    ACCESS_PROFILE                              = 0x00000019,
    ACCESS_OVERLAY_SCHEME                       = 0x0000001a,
    ACCESS_ACTIVE_OVERLAY_SCHEME                = 0x0000001b,
}

alias PDEVICE_NOTIFY_CALLBACK_ROUTINE = uint function(void*, uint, void*);
struct DEVICE_NOTIFY_SUBSCRIBE_PARAMETERS
{
    PDEVICE_NOTIFY_CALLBACK_ROUTINE Callback;
    void* Context;
}
struct THERMAL_EVENT
{
    uint Version;
    uint Size;
    uint Type;
    uint Temperature;
    uint TripPointTemperature;
    PWSTR Initiator;
}
alias BATTERY_QUERY_INFORMATION_LEVEL = int;
enum : int
{
    BatteryInformation            = 0x00000000,
    BatteryGranularityInformation = 0x00000001,
    BatteryTemperature            = 0x00000002,
    BatteryEstimatedTime          = 0x00000003,
    BatteryDeviceName             = 0x00000004,
    BatteryManufactureDate        = 0x00000005,
    BatteryManufactureName        = 0x00000006,
    BatteryUniqueID               = 0x00000007,
    BatterySerialNumber           = 0x00000008,
}

struct BATTERY_QUERY_INFORMATION
{
    uint BatteryTag;
    BATTERY_QUERY_INFORMATION_LEVEL InformationLevel;
    uint AtRate;
}
struct BATTERY_INFORMATION
{
    uint Capabilities;
    ubyte Technology;
    ubyte[3] Reserved;
    ubyte[4] Chemistry;
    uint DesignedCapacity;
    uint FullChargedCapacity;
    uint DefaultAlert1;
    uint DefaultAlert2;
    uint CriticalBias;
    uint CycleCount;
}
alias BATTERY_CHARGING_SOURCE_TYPE = int;
enum : int
{
    BatteryChargingSourceType_AC       = 0x00000001,
    BatteryChargingSourceType_USB      = 0x00000002,
    BatteryChargingSourceType_Wireless = 0x00000003,
    BatteryChargingSourceType_Max      = 0x00000004,
}

struct BATTERY_CHARGING_SOURCE
{
    BATTERY_CHARGING_SOURCE_TYPE Type;
    uint MaxCurrent;
}
struct BATTERY_CHARGING_SOURCE_INFORMATION
{
    BATTERY_CHARGING_SOURCE_TYPE Type;
    BOOLEAN SourceOnline;
}
alias USB_CHARGER_PORT = int;
enum : int
{
    UsbChargerPort_Legacy = 0x00000000,
    UsbChargerPort_TypeC  = 0x00000001,
    UsbChargerPort_Max    = 0x00000002,
}

alias BATTERY_SET_INFORMATION_LEVEL = int;
enum : int
{
    BatteryCriticalBias   = 0x00000000,
    BatteryCharge         = 0x00000001,
    BatteryDischarge      = 0x00000002,
    BatteryChargingSource = 0x00000003,
    BatteryChargerId      = 0x00000004,
    BatteryChargerStatus  = 0x00000005,
}

struct BATTERY_SET_INFORMATION
{
    uint BatteryTag;
    BATTERY_SET_INFORMATION_LEVEL InformationLevel;
    ubyte[1] Buffer;
}
struct BATTERY_CHARGER_STATUS
{
    BATTERY_CHARGING_SOURCE_TYPE Type;
    uint[1] VaData;
}
struct BATTERY_USB_CHARGER_STATUS
{
    BATTERY_CHARGING_SOURCE_TYPE Type;
    uint Reserved;
    uint Flags;
    uint MaxCurrent;
    uint Voltage;
    USB_CHARGER_PORT PortType;
    ulong PortId;
    void* PowerSourceInformation;
    GUID OemCharger;
}
struct BATTERY_WAIT_STATUS
{
    uint BatteryTag;
    uint Timeout;
    uint PowerState;
    uint LowCapacity;
    uint HighCapacity;
}
struct BATTERY_STATUS
{
    uint PowerState;
    uint Capacity;
    uint Voltage;
    int Rate;
}
struct BATTERY_MANUFACTURE_DATE
{
    ubyte Day;
    ubyte Month;
    ushort Year;
}
struct THERMAL_INFORMATION
{
    uint ThermalStamp;
    uint ThermalConstant1;
    uint ThermalConstant2;
    ulong Processors;
    uint SamplingPeriod;
    uint CurrentTemperature;
    uint PassiveTripPoint;
    uint CriticalTripPoint;
    ubyte ActiveTripPointCount;
    uint[10] ActiveTripPoint;
}
struct THERMAL_WAIT_READ
{
    uint Timeout;
    uint LowTemperature;
    uint HighTemperature;
}
struct THERMAL_POLICY
{
    uint Version;
    BOOLEAN WaitForUpdate;
    BOOLEAN Hibernate;
    BOOLEAN Critical;
    BOOLEAN ThermalStandby;
    uint ActivationReasons;
    uint PassiveLimit;
    uint ActiveLevel;
    BOOLEAN OverThrottled;
}
struct PROCESSOR_OBJECT_INFO
{
    uint PhysicalID;
    uint PBlkAddress;
    ubyte PBlkLength;
}
struct PROCESSOR_OBJECT_INFO_EX
{
    uint PhysicalID;
    uint PBlkAddress;
    ubyte PBlkLength;
    uint InitialApicId;
}
struct WAKE_ALARM_INFORMATION
{
    uint TimerIdentifier;
    uint Timeout;
}
struct ACPI_REAL_TIME
{
    ushort Year;
    ubyte Month;
    ubyte Day;
    ubyte Hour;
    ubyte Minute;
    ubyte Second;
    ubyte Valid;
    ushort Milliseconds;
    short TimeZone;
    ubyte DayLight;
    ubyte[3] Reserved1;
}
alias ACPI_TIME_RESOLUTION = int;
enum : int
{
    AcpiTimeResolutionMilliseconds = 0x00000000,
    AcpiTimeResolutionSeconds      = 0x00000001,
    AcpiTimeResolutionMax          = 0x00000002,
}

struct ACPI_TIME_AND_ALARM_CAPABILITIES
{
    BOOLEAN AcWakeSupported;
    BOOLEAN DcWakeSupported;
    BOOLEAN S4AcWakeSupported;
    BOOLEAN S4DcWakeSupported;
    BOOLEAN S5AcWakeSupported;
    BOOLEAN S5DcWakeSupported;
    BOOLEAN S4S5WakeStatusSupported;
    uint DeepestWakeSystemState;
    BOOLEAN RealTimeFeaturesSupported;
    ACPI_TIME_RESOLUTION RealTimeResolution;
}
alias EMI_MEASUREMENT_UNIT = int;
enum : int
{
    EmiMeasurementUnitPicowattHours = 0x00000000,
}

struct EMI_VERSION
{
    ushort EmiVersion;
}
struct EMI_METADATA_SIZE
{
    uint MetadataSize;
}
struct EMI_CHANNEL_MEASUREMENT_DATA
{
    ulong AbsoluteEnergy;
    ulong AbsoluteTime;
}
struct EMI_METADATA_V1
{
    EMI_MEASUREMENT_UNIT MeasurementUnit;
    wchar[16] HardwareOEM;
    wchar[16] HardwareModel;
    ushort HardwareRevision;
    ushort MeteredHardwareNameSize;
    wchar[1] MeteredHardwareName;
}
struct EMI_CHANNEL_V2
{
    EMI_MEASUREMENT_UNIT MeasurementUnit;
    ushort ChannelNameSize;
    wchar[1] ChannelName;
}
struct EMI_METADATA_V2
{
    wchar[16] HardwareOEM;
    wchar[16] HardwareModel;
    ushort HardwareRevision;
    ushort ChannelCount;
    EMI_CHANNEL_V2[1] Channels;
}
struct EMI_MEASUREMENT_DATA_V2
{
    EMI_CHANNEL_MEASUREMENT_DATA[1] ChannelData;
}
alias SYSTEM_POWER_STATE = int;
enum : int
{
    PowerSystemUnspecified = 0x00000000,
    PowerSystemWorking     = 0x00000001,
    PowerSystemSleeping1   = 0x00000002,
    PowerSystemSleeping2   = 0x00000003,
    PowerSystemSleeping3   = 0x00000004,
    PowerSystemHibernate   = 0x00000005,
    PowerSystemShutdown    = 0x00000006,
    PowerSystemMaximum     = 0x00000007,
}

alias POWER_ACTION = int;
enum : int
{
    PowerActionNone          = 0x00000000,
    PowerActionReserved      = 0x00000001,
    PowerActionSleep         = 0x00000002,
    PowerActionHibernate     = 0x00000003,
    PowerActionShutdown      = 0x00000004,
    PowerActionShutdownReset = 0x00000005,
    PowerActionShutdownOff   = 0x00000006,
    PowerActionWarmEject     = 0x00000007,
    PowerActionDisplayOff    = 0x00000008,
}

alias DEVICE_POWER_STATE = int;
enum : int
{
    PowerDeviceUnspecified = 0x00000000,
    PowerDeviceD0          = 0x00000001,
    PowerDeviceD1          = 0x00000002,
    PowerDeviceD2          = 0x00000003,
    PowerDeviceD3          = 0x00000004,
    PowerDeviceMaximum     = 0x00000005,
}

alias USER_ACTIVITY_PRESENCE = int;
enum : int
{
    PowerUserPresent    = 0x00000000,
    PowerUserNotPresent = 0x00000001,
    PowerUserInactive   = 0x00000002,
    PowerUserMaximum    = 0x00000003,
    PowerUserInvalid    = 0x00000003,
}

alias LATENCY_TIME = int;
enum : int
{
    LT_DONT_CARE      = 0x00000000,
    LT_LOWEST_LATENCY = 0x00000001,
}

alias POWER_REQUEST_TYPE = int;
enum : int
{
    PowerRequestDisplayRequired   = 0x00000000,
    PowerRequestSystemRequired    = 0x00000001,
    PowerRequestAwayModeRequired  = 0x00000002,
    PowerRequestExecutionRequired = 0x00000003,
}

struct CM_POWER_DATA
{
    uint PD_Size;
    DEVICE_POWER_STATE PD_MostRecentPowerState;
    uint PD_Capabilities;
    uint PD_D1Latency;
    uint PD_D2Latency;
    uint PD_D3Latency;
    DEVICE_POWER_STATE[7] PD_PowerStateMapping;
    SYSTEM_POWER_STATE PD_DeepestSystemWake;
}
alias POWER_INFORMATION_LEVEL = int;
enum : int
{
    SystemPowerPolicyAc                = 0x00000000,
    SystemPowerPolicyDc                = 0x00000001,
    VerifySystemPolicyAc               = 0x00000002,
    VerifySystemPolicyDc               = 0x00000003,
    SystemPowerCapabilities            = 0x00000004,
    SystemBatteryState                 = 0x00000005,
    SystemPowerStateHandler            = 0x00000006,
    ProcessorStateHandler              = 0x00000007,
    SystemPowerPolicyCurrent           = 0x00000008,
    AdministratorPowerPolicy           = 0x00000009,
    SystemReserveHiberFile             = 0x0000000a,
    ProcessorInformation               = 0x0000000b,
    SystemPowerInformation             = 0x0000000c,
    ProcessorStateHandler2             = 0x0000000d,
    LastWakeTime                       = 0x0000000e,
    LastSleepTime                      = 0x0000000f,
    SystemExecutionState               = 0x00000010,
    SystemPowerStateNotifyHandler      = 0x00000011,
    ProcessorPowerPolicyAc             = 0x00000012,
    ProcessorPowerPolicyDc             = 0x00000013,
    VerifyProcessorPowerPolicyAc       = 0x00000014,
    VerifyProcessorPowerPolicyDc       = 0x00000015,
    ProcessorPowerPolicyCurrent        = 0x00000016,
    SystemPowerStateLogging            = 0x00000017,
    SystemPowerLoggingEntry            = 0x00000018,
    SetPowerSettingValue               = 0x00000019,
    NotifyUserPowerSetting             = 0x0000001a,
    PowerInformationLevelUnused0       = 0x0000001b,
    SystemMonitorHiberBootPowerOff     = 0x0000001c,
    SystemVideoState                   = 0x0000001d,
    TraceApplicationPowerMessage       = 0x0000001e,
    TraceApplicationPowerMessageEnd    = 0x0000001f,
    ProcessorPerfStates                = 0x00000020,
    ProcessorIdleStates                = 0x00000021,
    ProcessorCap                       = 0x00000022,
    SystemWakeSource                   = 0x00000023,
    SystemHiberFileInformation         = 0x00000024,
    TraceServicePowerMessage           = 0x00000025,
    ProcessorLoad                      = 0x00000026,
    PowerShutdownNotification          = 0x00000027,
    MonitorCapabilities                = 0x00000028,
    SessionPowerInit                   = 0x00000029,
    SessionDisplayState                = 0x0000002a,
    PowerRequestCreate                 = 0x0000002b,
    PowerRequestAction                 = 0x0000002c,
    GetPowerRequestList                = 0x0000002d,
    ProcessorInformationEx             = 0x0000002e,
    NotifyUserModeLegacyPowerEvent     = 0x0000002f,
    GroupPark                          = 0x00000030,
    ProcessorIdleDomains               = 0x00000031,
    WakeTimerList                      = 0x00000032,
    SystemHiberFileSize                = 0x00000033,
    ProcessorIdleStatesHv              = 0x00000034,
    ProcessorPerfStatesHv              = 0x00000035,
    ProcessorPerfCapHv                 = 0x00000036,
    ProcessorSetIdle                   = 0x00000037,
    LogicalProcessorIdling             = 0x00000038,
    UserPresence                       = 0x00000039,
    PowerSettingNotificationName       = 0x0000003a,
    GetPowerSettingValue               = 0x0000003b,
    IdleResiliency                     = 0x0000003c,
    SessionRITState                    = 0x0000003d,
    SessionConnectNotification         = 0x0000003e,
    SessionPowerCleanup                = 0x0000003f,
    SessionLockState                   = 0x00000040,
    SystemHiberbootState               = 0x00000041,
    PlatformInformation                = 0x00000042,
    PdcInvocation                      = 0x00000043,
    MonitorInvocation                  = 0x00000044,
    FirmwareTableInformationRegistered = 0x00000045,
    SetShutdownSelectedTime            = 0x00000046,
    SuspendResumeInvocation            = 0x00000047,
    PlmPowerRequestCreate              = 0x00000048,
    ScreenOff                          = 0x00000049,
    CsDeviceNotification               = 0x0000004a,
    PlatformRole                       = 0x0000004b,
    LastResumePerformance              = 0x0000004c,
    DisplayBurst                       = 0x0000004d,
    ExitLatencySamplingPercentage      = 0x0000004e,
    RegisterSpmPowerSettings           = 0x0000004f,
    PlatformIdleStates                 = 0x00000050,
    ProcessorIdleVeto                  = 0x00000051,
    PlatformIdleVeto                   = 0x00000052,
    SystemBatteryStatePrecise          = 0x00000053,
    ThermalEvent                       = 0x00000054,
    PowerRequestActionInternal         = 0x00000055,
    BatteryDeviceState                 = 0x00000056,
    PowerInformationInternal           = 0x00000057,
    ThermalStandby                     = 0x00000058,
    SystemHiberFileType                = 0x00000059,
    PhysicalPowerButtonPress           = 0x0000005a,
    QueryPotentialDripsConstraint      = 0x0000005b,
    EnergyTrackerCreate                = 0x0000005c,
    EnergyTrackerQuery                 = 0x0000005d,
    UpdateBlackBoxRecorder             = 0x0000005e,
    SessionAllowExternalDmaDevices     = 0x0000005f,
    SendSuspendResumeNotification      = 0x00000060,
    BlackBoxRecorderDirectAccessBuffer = 0x00000061,
    PowerInformationLevelMaximum       = 0x00000062,
}

alias POWER_USER_PRESENCE_TYPE = int;
enum : int
{
    UserNotPresent = 0x00000000,
    UserPresent    = 0x00000001,
    UserUnknown    = 0x000000ff,
}

struct POWER_USER_PRESENCE
{
    POWER_USER_PRESENCE_TYPE UserPresence;
}
struct POWER_SESSION_CONNECT
{
    BOOLEAN Connected;
    BOOLEAN Console;
}
struct POWER_SESSION_TIMEOUTS
{
    uint InputTimeout;
    uint DisplayTimeout;
}
struct POWER_SESSION_RIT_STATE
{
    BOOLEAN Active;
    ulong LastInputTime;
}
struct POWER_SESSION_WINLOGON
{
    uint SessionId;
    BOOLEAN Console;
    BOOLEAN Locked;
}
struct POWER_SESSION_ALLOW_EXTERNAL_DMA_DEVICES
{
    BOOLEAN IsAllowed;
}
struct POWER_IDLE_RESILIENCY
{
    uint CoalescingTimeout;
    uint IdleResiliencyPeriod;
}
alias POWER_MONITOR_REQUEST_REASON = int;
enum : int
{
    MonitorRequestReasonUnknown                        = 0x00000000,
    MonitorRequestReasonPowerButton                    = 0x00000001,
    MonitorRequestReasonRemoteConnection               = 0x00000002,
    MonitorRequestReasonScMonitorpower                 = 0x00000003,
    MonitorRequestReasonUserInput                      = 0x00000004,
    MonitorRequestReasonAcDcDisplayBurst               = 0x00000005,
    MonitorRequestReasonUserDisplayBurst               = 0x00000006,
    MonitorRequestReasonPoSetSystemState               = 0x00000007,
    MonitorRequestReasonSetThreadExecutionState        = 0x00000008,
    MonitorRequestReasonFullWake                       = 0x00000009,
    MonitorRequestReasonSessionUnlock                  = 0x0000000a,
    MonitorRequestReasonScreenOffRequest               = 0x0000000b,
    MonitorRequestReasonIdleTimeout                    = 0x0000000c,
    MonitorRequestReasonPolicyChange                   = 0x0000000d,
    MonitorRequestReasonSleepButton                    = 0x0000000e,
    MonitorRequestReasonLid                            = 0x0000000f,
    MonitorRequestReasonBatteryCountChange             = 0x00000010,
    MonitorRequestReasonGracePeriod                    = 0x00000011,
    MonitorRequestReasonPnP                            = 0x00000012,
    MonitorRequestReasonDP                             = 0x00000013,
    MonitorRequestReasonSxTransition                   = 0x00000014,
    MonitorRequestReasonSystemIdle                     = 0x00000015,
    MonitorRequestReasonNearProximity                  = 0x00000016,
    MonitorRequestReasonThermalStandby                 = 0x00000017,
    MonitorRequestReasonResumePdc                      = 0x00000018,
    MonitorRequestReasonResumeS4                       = 0x00000019,
    MonitorRequestReasonTerminal                       = 0x0000001a,
    MonitorRequestReasonPdcSignal                      = 0x0000001b,
    MonitorRequestReasonAcDcDisplayBurstSuppressed     = 0x0000001c,
    MonitorRequestReasonSystemStateEntered             = 0x0000001d,
    MonitorRequestReasonWinrt                          = 0x0000001e,
    MonitorRequestReasonUserInputKeyboard              = 0x0000001f,
    MonitorRequestReasonUserInputMouse                 = 0x00000020,
    MonitorRequestReasonUserInputTouchpad              = 0x00000021,
    MonitorRequestReasonUserInputPen                   = 0x00000022,
    MonitorRequestReasonUserInputAccelerometer         = 0x00000023,
    MonitorRequestReasonUserInputHid                   = 0x00000024,
    MonitorRequestReasonUserInputPoUserPresent         = 0x00000025,
    MonitorRequestReasonUserInputSessionSwitch         = 0x00000026,
    MonitorRequestReasonUserInputInitialization        = 0x00000027,
    MonitorRequestReasonPdcSignalWindowsMobilePwrNotif = 0x00000028,
    MonitorRequestReasonPdcSignalWindowsMobileShell    = 0x00000029,
    MonitorRequestReasonPdcSignalHeyCortana            = 0x0000002a,
    MonitorRequestReasonPdcSignalHolographicShell      = 0x0000002b,
    MonitorRequestReasonPdcSignalFingerprint           = 0x0000002c,
    MonitorRequestReasonDirectedDrips                  = 0x0000002d,
    MonitorRequestReasonDim                            = 0x0000002e,
    MonitorRequestReasonBuiltinPanel                   = 0x0000002f,
    MonitorRequestReasonDisplayRequiredUnDim           = 0x00000030,
    MonitorRequestReasonBatteryCountChangeSuppressed   = 0x00000031,
    MonitorRequestReasonResumeModernStandby            = 0x00000032,
    MonitorRequestReasonTerminalInit                   = 0x00000033,
    MonitorRequestReasonPdcSignalSensorsHumanPresence  = 0x00000034,
    MonitorRequestReasonBatteryPreCritical             = 0x00000035,
    MonitorRequestReasonUserInputTouch                 = 0x00000036,
    MonitorRequestReasonMax                            = 0x00000037,
}

alias POWER_MONITOR_REQUEST_TYPE = int;
enum : int
{
    MonitorRequestTypeOff          = 0x00000000,
    MonitorRequestTypeOnAndPresent = 0x00000001,
    MonitorRequestTypeToggleOn     = 0x00000002,
}

struct POWER_MONITOR_INVOCATION
{
    BOOLEAN Console;
    POWER_MONITOR_REQUEST_REASON RequestReason;
}
struct RESUME_PERFORMANCE
{
    uint PostTimeMs;
    ulong TotalResumeTimeMs;
    ulong ResumeCompleteTimestamp;
}
alias SYSTEM_POWER_CONDITION = int;
enum : int
{
    PoAc               = 0x00000000,
    PoDc               = 0x00000001,
    PoHot              = 0x00000002,
    PoConditionMaximum = 0x00000003,
}

struct SET_POWER_SETTING_VALUE
{
    uint Version;
    GUID Guid;
    SYSTEM_POWER_CONDITION PowerCondition;
    uint DataLength;
    ubyte[1] Data;
}
alias POWER_PLATFORM_ROLE = int;
enum : int
{
    PlatformRoleUnspecified       = 0x00000000,
    PlatformRoleDesktop           = 0x00000001,
    PlatformRoleMobile            = 0x00000002,
    PlatformRoleWorkstation       = 0x00000003,
    PlatformRoleEnterpriseServer  = 0x00000004,
    PlatformRoleSOHOServer        = 0x00000005,
    PlatformRoleAppliancePC       = 0x00000006,
    PlatformRolePerformanceServer = 0x00000007,
    PlatformRoleSlate             = 0x00000008,
    PlatformRoleMaximum           = 0x00000009,
}

struct POWER_PLATFORM_INFORMATION
{
    BOOLEAN AoAc;
}
alias POWER_SETTING_ALTITUDE = int;
enum : int
{
    ALTITUDE_GROUP_POLICY      = 0x00000000,
    ALTITUDE_USER              = 0x00000001,
    ALTITUDE_RUNTIME_OVERRIDE  = 0x00000002,
    ALTITUDE_PROVISIONING      = 0x00000003,
    ALTITUDE_OEM_CUSTOMIZATION = 0x00000004,
    ALTITUDE_INTERNAL_OVERRIDE = 0x00000005,
    ALTITUDE_OS_DEFAULT        = 0x00000006,
}

struct BATTERY_REPORTING_SCALE
{
    uint Granularity;
    uint Capacity;
}
struct PPM_WMI_LEGACY_PERFSTATE
{
    uint Frequency;
    uint Flags;
    uint PercentFrequency;
}
struct PPM_WMI_IDLE_STATE
{
    uint Latency;
    uint Power;
    uint TimeCheck;
    ubyte PromotePercent;
    ubyte DemotePercent;
    ubyte StateType;
    ubyte Reserved;
    uint StateFlags;
    uint Context;
    uint IdleHandler;
    uint Reserved1;
}
struct PPM_WMI_IDLE_STATES
{
    uint Type;
    uint Count;
    uint TargetState;
    uint OldState;
    ulong TargetProcessors;
    PPM_WMI_IDLE_STATE[1] State;
}
struct PPM_WMI_IDLE_STATES_EX
{
    uint Type;
    uint Count;
    uint TargetState;
    uint OldState;
    void* TargetProcessors;
    PPM_WMI_IDLE_STATE[1] State;
}
struct PPM_WMI_PERF_STATE
{
    uint Frequency;
    uint Power;
    ubyte PercentFrequency;
    ubyte IncreaseLevel;
    ubyte DecreaseLevel;
    ubyte Type;
    uint IncreaseTime;
    uint DecreaseTime;
    ulong Control;
    ulong Status;
    uint HitCount;
    uint Reserved1;
    ulong Reserved2;
    ulong Reserved3;
}
struct PPM_WMI_PERF_STATES
{
    uint Count;
    uint MaxFrequency;
    uint CurrentState;
    uint MaxPerfState;
    uint MinPerfState;
    uint LowestPerfState;
    uint ThermalConstraint;
    ubyte BusyAdjThreshold;
    ubyte PolicyType;
    ubyte Type;
    ubyte Reserved;
    uint TimerInterval;
    ulong TargetProcessors;
    uint PStateHandler;
    uint PStateContext;
    uint TStateHandler;
    uint TStateContext;
    uint FeedbackHandler;
    uint Reserved1;
    ulong Reserved2;
    PPM_WMI_PERF_STATE[1] State;
}
struct PPM_WMI_PERF_STATES_EX
{
    uint Count;
    uint MaxFrequency;
    uint CurrentState;
    uint MaxPerfState;
    uint MinPerfState;
    uint LowestPerfState;
    uint ThermalConstraint;
    ubyte BusyAdjThreshold;
    ubyte PolicyType;
    ubyte Type;
    ubyte Reserved;
    uint TimerInterval;
    void* TargetProcessors;
    uint PStateHandler;
    uint PStateContext;
    uint TStateHandler;
    uint TStateContext;
    uint FeedbackHandler;
    uint Reserved1;
    ulong Reserved2;
    PPM_WMI_PERF_STATE[1] State;
}
struct PPM_IDLE_STATE_ACCOUNTING
{
    uint IdleTransitions;
    uint FailedTransitions;
    uint InvalidBucketIndex;
    ulong TotalTime;
    uint[6] IdleTimeBuckets;
}
struct PPM_IDLE_ACCOUNTING
{
    uint StateCount;
    uint TotalTransitions;
    uint ResetCount;
    ulong StartTime;
    PPM_IDLE_STATE_ACCOUNTING[1] State;
}
struct PPM_IDLE_STATE_BUCKET_EX
{
    ulong TotalTimeUs;
    uint MinTimeUs;
    uint MaxTimeUs;
    uint Count;
}
struct PPM_IDLE_STATE_ACCOUNTING_EX
{
    ulong TotalTime;
    uint IdleTransitions;
    uint FailedTransitions;
    uint InvalidBucketIndex;
    uint MinTimeUs;
    uint MaxTimeUs;
    uint CancelledTransitions;
    PPM_IDLE_STATE_BUCKET_EX[16] IdleTimeBuckets;
}
struct PPM_IDLE_ACCOUNTING_EX
{
    uint StateCount;
    uint TotalTransitions;
    uint ResetCount;
    uint AbortCount;
    ulong StartTime;
    PPM_IDLE_STATE_ACCOUNTING_EX[1] State;
}
struct PPM_PERFSTATE_EVENT
{
    uint State;
    uint Status;
    uint Latency;
    uint Speed;
    uint Processor;
}
struct PPM_PERFSTATE_DOMAIN_EVENT
{
    uint State;
    uint Latency;
    uint Speed;
    ulong Processors;
}
struct PPM_IDLESTATE_EVENT
{
    uint NewState;
    uint OldState;
    ulong Processors;
}
struct PPM_THERMALCHANGE_EVENT
{
    uint ThermalConstraint;
    ulong Processors;
}
struct PPM_THERMAL_POLICY_EVENT
{
    ubyte Mode;
    ulong Processors;
}
struct POWER_ACTION_POLICY
{
    POWER_ACTION Action;
    uint Flags;
    POWER_ACTION_POLICY_EVENT_CODE EventCode;
}
struct SYSTEM_POWER_LEVEL
{
    BOOLEAN Enable;
    ubyte[3] Spare;
    uint BatteryLevel;
    POWER_ACTION_POLICY PowerPolicy;
    SYSTEM_POWER_STATE MinSystemState;
}
struct SYSTEM_POWER_POLICY
{
    uint Revision;
    POWER_ACTION_POLICY PowerButton;
    POWER_ACTION_POLICY SleepButton;
    POWER_ACTION_POLICY LidClose;
    SYSTEM_POWER_STATE LidOpenWake;
    uint Reserved;
    POWER_ACTION_POLICY Idle;
    uint IdleTimeout;
    ubyte IdleSensitivity;
    ubyte DynamicThrottle;
    ubyte[2] Spare2;
    SYSTEM_POWER_STATE MinSleep;
    SYSTEM_POWER_STATE MaxSleep;
    SYSTEM_POWER_STATE ReducedLatencySleep;
    uint WinLogonFlags;
    uint Spare3;
    uint DozeS4Timeout;
    uint BroadcastCapacityResolution;
    SYSTEM_POWER_LEVEL[4] DischargePolicy;
    uint VideoTimeout;
    BOOLEAN VideoDimDisplay;
    uint[3] VideoReserved;
    uint SpindownTimeout;
    BOOLEAN OptimizeForPower;
    ubyte FanThrottleTolerance;
    ubyte ForcedThrottle;
    ubyte MinThrottle;
    POWER_ACTION_POLICY OverThrottled;
}
struct PROCESSOR_POWER_POLICY_INFO
{
    uint TimeCheck;
    uint DemoteLimit;
    uint PromoteLimit;
    ubyte DemotePercent;
    ubyte PromotePercent;
    ubyte[2] Spare;
    uint _bitfield0;
}
struct PROCESSOR_POWER_POLICY
{
    uint Revision;
    ubyte DynamicThrottle;
    ubyte[3] Spare;
    uint _bitfield0;
    uint PolicyCount;
    PROCESSOR_POWER_POLICY_INFO[3] Policy;
}
struct ADMINISTRATOR_POWER_POLICY
{
    SYSTEM_POWER_STATE MinSleep;
    SYSTEM_POWER_STATE MaxSleep;
    uint MinVideoTimeout;
    uint MaxVideoTimeout;
    uint MinSpindownTimeout;
    uint MaxSpindownTimeout;
}
struct SYSTEM_POWER_CAPABILITIES
{
    BOOLEAN PowerButtonPresent;
    BOOLEAN SleepButtonPresent;
    BOOLEAN LidPresent;
    BOOLEAN SystemS1;
    BOOLEAN SystemS2;
    BOOLEAN SystemS3;
    BOOLEAN SystemS4;
    BOOLEAN SystemS5;
    BOOLEAN HiberFilePresent;
    BOOLEAN FullWake;
    BOOLEAN VideoDimPresent;
    BOOLEAN ApmPresent;
    BOOLEAN UpsPresent;
    BOOLEAN ThermalControl;
    BOOLEAN ProcessorThrottle;
    ubyte ProcessorMinThrottle;
    ubyte ProcessorMaxThrottle;
    BOOLEAN FastSystemS4;
    BOOLEAN Hiberboot;
    BOOLEAN WakeAlarmPresent;
    BOOLEAN AoAc;
    BOOLEAN DiskSpinDown;
    ubyte HiberFileType;
    BOOLEAN AoAcConnectivitySupported;
    ubyte[6] spare3;
    BOOLEAN SystemBatteriesPresent;
    BOOLEAN BatteriesAreShortTerm;
    BATTERY_REPORTING_SCALE[3] BatteryScale;
    SYSTEM_POWER_STATE AcOnLineWake;
    SYSTEM_POWER_STATE SoftLidWake;
    SYSTEM_POWER_STATE RtcWake;
    SYSTEM_POWER_STATE MinDeviceWakeState;
    SYSTEM_POWER_STATE DefaultLowLatencyWake;
}
struct SYSTEM_BATTERY_STATE
{
    BOOLEAN AcOnLine;
    BOOLEAN BatteryPresent;
    BOOLEAN Charging;
    BOOLEAN Discharging;
    BOOLEAN[3] Spare1;
    ubyte Tag;
    uint MaxCapacity;
    uint RemainingCapacity;
    uint Rate;
    uint EstimatedTime;
    uint DefaultAlert1;
    uint DefaultAlert2;
}
struct POWERBROADCAST_SETTING
{
    GUID PowerSetting;
    uint DataLength;
    ubyte[1] Data;
}
struct SYSTEM_POWER_STATUS
{
    ubyte ACLineStatus;
    ubyte BatteryFlag;
    ubyte BatteryLifePercent;
    ubyte SystemStatusFlag;
    uint BatteryLifeTime;
    uint BatteryFullLifeTime;
}
