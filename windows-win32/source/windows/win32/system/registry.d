module windows.win32.system.registry;

import windows.win32.foundation : BOOL, FILETIME, HANDLE, PSTR, PWSTR, WIN32_ERROR;
import windows.win32.security : OBJECT_SECURITY_INFORMATION, PSECURITY_DESCRIPTOR, SECURITY_ATTRIBUTES;

version (Windows):
extern (Windows):

WIN32_ERROR RegCloseKey(HKEY);
WIN32_ERROR RegOverridePredefKey(HKEY, HKEY);
WIN32_ERROR RegOpenUserClassesRoot(HANDLE, uint, uint, HKEY*);
WIN32_ERROR RegOpenCurrentUser(uint, HKEY*);
WIN32_ERROR RegDisablePredefinedCache();
WIN32_ERROR RegDisablePredefinedCacheEx();
WIN32_ERROR RegConnectRegistryA(const(char)*, HKEY, HKEY*);
WIN32_ERROR RegConnectRegistryW(const(wchar)*, HKEY, HKEY*);
int RegConnectRegistryExA(const(char)*, HKEY, uint, HKEY*);
int RegConnectRegistryExW(const(wchar)*, HKEY, uint, HKEY*);
WIN32_ERROR RegCreateKeyA(HKEY, const(char)*, HKEY*);
WIN32_ERROR RegCreateKeyW(HKEY, const(wchar)*, HKEY*);
WIN32_ERROR RegCreateKeyExA(HKEY, const(char)*, uint, PSTR, REG_OPEN_CREATE_OPTIONS, REG_SAM_FLAGS, const(SECURITY_ATTRIBUTES)*, HKEY*, REG_CREATE_KEY_DISPOSITION*);
WIN32_ERROR RegCreateKeyExW(HKEY, const(wchar)*, uint, PWSTR, REG_OPEN_CREATE_OPTIONS, REG_SAM_FLAGS, const(SECURITY_ATTRIBUTES)*, HKEY*, REG_CREATE_KEY_DISPOSITION*);
WIN32_ERROR RegCreateKeyTransactedA(HKEY, const(char)*, uint, PSTR, REG_OPEN_CREATE_OPTIONS, REG_SAM_FLAGS, const(SECURITY_ATTRIBUTES)*, HKEY*, REG_CREATE_KEY_DISPOSITION*, HANDLE, void*);
WIN32_ERROR RegCreateKeyTransactedW(HKEY, const(wchar)*, uint, PWSTR, REG_OPEN_CREATE_OPTIONS, REG_SAM_FLAGS, const(SECURITY_ATTRIBUTES)*, HKEY*, REG_CREATE_KEY_DISPOSITION*, HANDLE, void*);
WIN32_ERROR RegDeleteKeyA(HKEY, const(char)*);
WIN32_ERROR RegDeleteKeyW(HKEY, const(wchar)*);
WIN32_ERROR RegDeleteKeyExA(HKEY, const(char)*, uint, uint);
WIN32_ERROR RegDeleteKeyExW(HKEY, const(wchar)*, uint, uint);
WIN32_ERROR RegDeleteKeyTransactedA(HKEY, const(char)*, uint, uint, HANDLE, void*);
WIN32_ERROR RegDeleteKeyTransactedW(HKEY, const(wchar)*, uint, uint, HANDLE, void*);
WIN32_ERROR RegDisableReflectionKey(HKEY);
WIN32_ERROR RegEnableReflectionKey(HKEY);
WIN32_ERROR RegQueryReflectionKey(HKEY, BOOL*);
WIN32_ERROR RegDeleteValueA(HKEY, const(char)*);
WIN32_ERROR RegDeleteValueW(HKEY, const(wchar)*);
WIN32_ERROR RegEnumKeyA(HKEY, uint, PSTR, uint);
WIN32_ERROR RegEnumKeyW(HKEY, uint, PWSTR, uint);
WIN32_ERROR RegEnumKeyExA(HKEY, uint, PSTR, uint*, uint*, PSTR, uint*, FILETIME*);
WIN32_ERROR RegEnumKeyExW(HKEY, uint, PWSTR, uint*, uint*, PWSTR, uint*, FILETIME*);
WIN32_ERROR RegEnumValueA(HKEY, uint, PSTR, uint*, uint*, uint*, ubyte*, uint*);
WIN32_ERROR RegEnumValueW(HKEY, uint, PWSTR, uint*, uint*, uint*, ubyte*, uint*);
WIN32_ERROR RegFlushKey(HKEY);
WIN32_ERROR RegGetKeySecurity(HKEY, OBJECT_SECURITY_INFORMATION, PSECURITY_DESCRIPTOR, uint*);
WIN32_ERROR RegLoadKeyA(HKEY, const(char)*, const(char)*);
WIN32_ERROR RegLoadKeyW(HKEY, const(wchar)*, const(wchar)*);
WIN32_ERROR RegNotifyChangeKeyValue(HKEY, BOOL, REG_NOTIFY_FILTER, HANDLE, BOOL);
WIN32_ERROR RegOpenKeyA(HKEY, const(char)*, HKEY*);
WIN32_ERROR RegOpenKeyW(HKEY, const(wchar)*, HKEY*);
WIN32_ERROR RegOpenKeyExA(HKEY, const(char)*, uint, REG_SAM_FLAGS, HKEY*);
WIN32_ERROR RegOpenKeyExW(HKEY, const(wchar)*, uint, REG_SAM_FLAGS, HKEY*);
WIN32_ERROR RegOpenKeyTransactedA(HKEY, const(char)*, uint, REG_SAM_FLAGS, HKEY*, HANDLE, void*);
WIN32_ERROR RegOpenKeyTransactedW(HKEY, const(wchar)*, uint, REG_SAM_FLAGS, HKEY*, HANDLE, void*);
WIN32_ERROR RegQueryInfoKeyA(HKEY, PSTR, uint*, uint*, uint*, uint*, uint*, uint*, uint*, uint*, uint*, FILETIME*);
WIN32_ERROR RegQueryInfoKeyW(HKEY, PWSTR, uint*, uint*, uint*, uint*, uint*, uint*, uint*, uint*, uint*, FILETIME*);
WIN32_ERROR RegQueryValueA(HKEY, const(char)*, PSTR, int*);
WIN32_ERROR RegQueryValueW(HKEY, const(wchar)*, PWSTR, int*);
WIN32_ERROR RegQueryMultipleValuesA(HKEY, VALENTA*, uint, PSTR, uint*);
WIN32_ERROR RegQueryMultipleValuesW(HKEY, VALENTW*, uint, PWSTR, uint*);
WIN32_ERROR RegQueryValueExA(HKEY, const(char)*, uint*, REG_VALUE_TYPE*, ubyte*, uint*);
WIN32_ERROR RegQueryValueExW(HKEY, const(wchar)*, uint*, REG_VALUE_TYPE*, ubyte*, uint*);
WIN32_ERROR RegReplaceKeyA(HKEY, const(char)*, const(char)*, const(char)*);
WIN32_ERROR RegReplaceKeyW(HKEY, const(wchar)*, const(wchar)*, const(wchar)*);
WIN32_ERROR RegRestoreKeyA(HKEY, const(char)*, uint);
WIN32_ERROR RegRestoreKeyW(HKEY, const(wchar)*, uint);
WIN32_ERROR RegRenameKey(HKEY, const(wchar)*, const(wchar)*);
WIN32_ERROR RegSaveKeyA(HKEY, const(char)*, const(SECURITY_ATTRIBUTES)*);
WIN32_ERROR RegSaveKeyW(HKEY, const(wchar)*, const(SECURITY_ATTRIBUTES)*);
WIN32_ERROR RegSetKeySecurity(HKEY, OBJECT_SECURITY_INFORMATION, PSECURITY_DESCRIPTOR);
WIN32_ERROR RegSetValueA(HKEY, const(char)*, REG_VALUE_TYPE, const(char)*, uint);
WIN32_ERROR RegSetValueW(HKEY, const(wchar)*, REG_VALUE_TYPE, const(wchar)*, uint);
WIN32_ERROR RegSetValueExA(HKEY, const(char)*, uint, REG_VALUE_TYPE, const(ubyte)*, uint);
WIN32_ERROR RegSetValueExW(HKEY, const(wchar)*, uint, REG_VALUE_TYPE, const(ubyte)*, uint);
WIN32_ERROR RegUnLoadKeyA(HKEY, const(char)*);
WIN32_ERROR RegUnLoadKeyW(HKEY, const(wchar)*);
WIN32_ERROR RegDeleteKeyValueA(HKEY, const(char)*, const(char)*);
WIN32_ERROR RegDeleteKeyValueW(HKEY, const(wchar)*, const(wchar)*);
WIN32_ERROR RegSetKeyValueA(HKEY, const(char)*, const(char)*, uint, const(void)*, uint);
WIN32_ERROR RegSetKeyValueW(HKEY, const(wchar)*, const(wchar)*, uint, const(void)*, uint);
WIN32_ERROR RegDeleteTreeA(HKEY, const(char)*);
WIN32_ERROR RegDeleteTreeW(HKEY, const(wchar)*);
WIN32_ERROR RegCopyTreeA(HKEY, const(char)*, HKEY);
WIN32_ERROR RegGetValueA(HKEY, const(char)*, const(char)*, REG_ROUTINE_FLAGS, REG_VALUE_TYPE*, void*, uint*);
WIN32_ERROR RegGetValueW(HKEY, const(wchar)*, const(wchar)*, REG_ROUTINE_FLAGS, REG_VALUE_TYPE*, void*, uint*);
WIN32_ERROR RegCopyTreeW(HKEY, const(wchar)*, HKEY);
WIN32_ERROR RegLoadMUIStringA(HKEY, const(char)*, PSTR, uint, uint*, uint, const(char)*);
WIN32_ERROR RegLoadMUIStringW(HKEY, const(wchar)*, PWSTR, uint, uint*, uint, const(wchar)*);
WIN32_ERROR RegLoadAppKeyA(const(char)*, HKEY*, uint, uint, uint);
WIN32_ERROR RegLoadAppKeyW(const(wchar)*, HKEY*, uint, uint, uint);
WIN32_ERROR RegSaveKeyExA(HKEY, const(char)*, const(SECURITY_ATTRIBUTES)*, REG_SAVE_FORMAT);
WIN32_ERROR RegSaveKeyExW(HKEY, const(wchar)*, const(SECURITY_ATTRIBUTES)*, REG_SAVE_FORMAT);
WIN32_ERROR GetRegistryValueWithFallbackW(HKEY, const(wchar)*, HKEY, const(wchar)*, const(wchar)*, uint, uint*, void*, uint, uint*);
enum HKEY_CLASSES_ROOT = 0xffffffff80000000;
enum HKEY_CURRENT_USER = 0xffffffff80000001;
enum HKEY_LOCAL_MACHINE = 0xffffffff80000002;
enum HKEY_USERS = 0xffffffff80000003;
enum HKEY_PERFORMANCE_DATA = 0xffffffff80000004;
enum HKEY_PERFORMANCE_TEXT = 0xffffffff80000050;
enum HKEY_PERFORMANCE_NLSTEXT = 0xffffffff80000060;
enum HKEY_CURRENT_CONFIG = 0xffffffff80000005;
enum HKEY_DYN_DATA = 0xffffffff80000006;
enum HKEY_CURRENT_USER_LOCAL_SETTINGS = 0xffffffff80000007;
enum REG_PROCESS_APPKEY = 0x00000001;
enum REG_USE_CURRENT_SECURITY_CONTEXT = 0x00000002;
enum PROVIDER_KEEPS_VALUE_LENGTH = 0x00000001;
enum REG_MUI_STRING_TRUNCATE = 0x00000001;
enum REG_SECURE_CONNECTION = 0x00000001;
enum REGSTR_KEY_CLASS = "Class";
enum REGSTR_KEY_CONFIG = "Config";
enum REGSTR_KEY_ENUM = "Enum";
enum REGSTR_KEY_ROOTENUM = "Root";
enum REGSTR_KEY_BIOSENUM = "BIOS";
enum REGSTR_KEY_ACPIENUM = "ACPI";
enum REGSTR_KEY_PCMCIAENUM = "PCMCIA";
enum REGSTR_KEY_PCIENUM = "PCI";
enum REGSTR_KEY_VPOWERDENUM = "VPOWERD";
enum REGSTR_KEY_ISAENUM = "ISAPnP";
enum REGSTR_KEY_EISAENUM = "EISA";
enum REGSTR_KEY_LOGCONFIG = "LogConfig";
enum REGSTR_KEY_SYSTEMBOARD = "*PNP0C01";
enum REGSTR_KEY_APM = "*PNP0C05";
enum REGSTR_KEY_INIUPDATE = "IniUpdate";
enum REG_KEY_INSTDEV = "Installed";
enum REGSTR_KEY_DOSOPTCDROM = "CD-ROM";
enum REGSTR_KEY_DOSOPTMOUSE = "MOUSE";
enum REGSTR_KEY_KNOWNDOCKINGSTATES = "Hardware Profiles";
enum REGSTR_KEY_DEVICEPARAMETERS = "Device Parameters";
enum REGSTR_KEY_DRIVERPARAMETERS = "Driver Parameters";
enum REGSTR_DEFAULT_INSTANCE = "0000";
enum REGSTR_PATH_SETUP = "Software\\Microsoft\\Windows\\CurrentVersion";
enum REGSTR_PATH_DRIVERSIGN = "Software\\Microsoft\\Driver Signing";
enum REGSTR_PATH_NONDRIVERSIGN = "Software\\Microsoft\\Non-Driver Signing";
enum REGSTR_PATH_DRIVERSIGN_POLICY = "Software\\Policies\\Microsoft\\Windows NT\\Driver Signing";
enum REGSTR_PATH_NONDRIVERSIGN_POLICY = "Software\\Policies\\Microsoft\\Windows NT\\Non-Driver Signing";
enum REGSTR_PATH_PIFCONVERT = "Software\\Microsoft\\Windows\\CurrentVersion\\PIFConvert";
enum REGSTR_PATH_MSDOSOPTS = "Software\\Microsoft\\Windows\\CurrentVersion\\MS-DOSOptions";
enum REGSTR_PATH_NOSUGGMSDOS = "Software\\Microsoft\\Windows\\CurrentVersion\\NoMSDOSWarn";
enum REGSTR_PATH_NEWDOSBOX = "Software\\Microsoft\\Windows\\CurrentVersion\\MS-DOSSpecialConfig";
enum REGSTR_PATH_RUNONCE = "Software\\Microsoft\\Windows\\CurrentVersion\\RunOnce";
enum REGSTR_PATH_RUNONCEEX = "Software\\Microsoft\\Windows\\CurrentVersion\\RunOnceEx";
enum REGSTR_PATH_RUN = "Software\\Microsoft\\Windows\\CurrentVersion\\Run";
enum REGSTR_PATH_RUNSERVICESONCE = "Software\\Microsoft\\Windows\\CurrentVersion\\RunServicesOnce";
enum REGSTR_PATH_RUNSERVICES = "Software\\Microsoft\\Windows\\CurrentVersion\\RunServices";
enum REGSTR_PATH_EXPLORER = "Software\\Microsoft\\Windows\\CurrentVersion\\Explorer";
enum REGSTR_PATH_PROPERTYSYSTEM = "Software\\Microsoft\\Windows\\CurrentVersion\\PropertySystem";
enum REGSTR_PATH_DETECT = "Software\\Microsoft\\Windows\\CurrentVersion\\Detect";
enum REGSTR_PATH_APPPATHS = "Software\\Microsoft\\Windows\\CurrentVersion\\App Paths";
enum REGSTR_PATH_UNINSTALL = "Software\\Microsoft\\Windows\\CurrentVersion\\Uninstall";
enum REGSTR_PATH_REALMODENET = "Software\\Microsoft\\Windows\\CurrentVersion\\Network\\Real Mode Net";
enum REGSTR_PATH_NETEQUIV = "Software\\Microsoft\\Windows\\CurrentVersion\\Network\\Equivalent";
enum REGSTR_PATH_CVNETWORK = "Software\\Microsoft\\Windows\\CurrentVersion\\Network";
enum REGSTR_PATH_WMI_SECURITY = "System\\CurrentControlSet\\Control\\Wmi\\Security";
enum REGSTR_PATH_RELIABILITY = "Software\\Microsoft\\Windows\\CurrentVersion\\Reliability";
enum REGSTR_PATH_RELIABILITY_POLICY = "Software\\Policies\\Microsoft\\Windows NT\\Reliability";
enum REGSTR_PATH_RELIABILITY_POLICY_SHUTDOWNREASONUI = "ShutdownReasonUI";
enum REGSTR_PATH_RELIABILITY_POLICY_SNAPSHOT = "Snapshot";
enum REGSTR_PATH_RELIABILITY_POLICY_REPORTSNAPSHOT = "ReportSnapshot";
enum REGSTR_PATH_REINSTALL = "SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\Reinstall";
enum REGSTR_PATH_NT_CURRENTVERSION = "Software\\Microsoft\\Windows NT\\CurrentVersion";
enum REGSTR_PATH_VOLUMECACHE = "Software\\Microsoft\\Windows\\CurrentVersion\\Explorer\\VolumeCaches";
enum REGSTR_VAL_DISPLAY = "display";
enum REGSTR_PATH_IDCONFIGDB = "System\\CurrentControlSet\\Control\\IDConfigDB";
enum REGSTR_PATH_CRITICALDEVICEDATABASE = "System\\CurrentControlSet\\Control\\CriticalDeviceDatabase";
enum REGSTR_PATH_CLASS = "System\\CurrentControlSet\\Services\\Class";
enum REGSTR_PATH_DISPLAYSETTINGS = "Display\\Settings";
enum REGSTR_PATH_FONTS = "Display\\Fonts";
enum REGSTR_PATH_ENUM = "Enum";
enum REGSTR_PATH_ROOT = "Enum\\Root";
enum REGSTR_PATH_CURRENTCONTROLSET = "System\\CurrentControlSet";
enum REGSTR_PATH_SYSTEMENUM = "System\\CurrentControlSet\\Enum";
enum REGSTR_PATH_HWPROFILES = "System\\CurrentControlSet\\Hardware Profiles";
enum REGSTR_PATH_HWPROFILESCURRENT = "System\\CurrentControlSet\\Hardware Profiles\\Current";
enum REGSTR_PATH_CLASS_NT = "System\\CurrentControlSet\\Control\\Class";
enum REGSTR_PATH_PER_HW_ID_STORAGE = "Software\\Microsoft\\Windows NT\\CurrentVersion\\PerHwIdStorage";
enum REGSTR_PATH_DEVICE_CLASSES = "System\\CurrentControlSet\\Control\\DeviceClasses";
enum REGSTR_PATH_CODEVICEINSTALLERS = "System\\CurrentControlSet\\Control\\CoDeviceInstallers";
enum REGSTR_PATH_BUSINFORMATION = "System\\CurrentControlSet\\Control\\PnP\\BusInformation";
enum REGSTR_PATH_SERVICES = "System\\CurrentControlSet\\Services";
enum REGSTR_PATH_VXD = "System\\CurrentControlSet\\Services\\VxD";
enum REGSTR_PATH_IOS = "System\\CurrentControlSet\\Services\\VxD\\IOS";
enum REGSTR_PATH_VMM = "System\\CurrentControlSet\\Services\\VxD\\VMM";
enum REGSTR_PATH_VPOWERD = "System\\CurrentControlSet\\Services\\VxD\\VPOWERD";
enum REGSTR_PATH_VNETSUP = "System\\CurrentControlSet\\Services\\VxD\\VNETSUP";
enum REGSTR_PATH_NWREDIR = "System\\CurrentControlSet\\Services\\VxD\\NWREDIR";
enum REGSTR_PATH_NCPSERVER = "System\\CurrentControlSet\\Services\\NcpServer\\Parameters";
enum REGSTR_PATH_VCOMM = "System\\CurrentControlSet\\Services\\VxD\\VCOMM";
enum REGSTR_PATH_IOARB = "System\\CurrentControlSet\\Services\\Arbitrators\\IOArb";
enum REGSTR_PATH_ADDRARB = "System\\CurrentControlSet\\Services\\Arbitrators\\AddrArb";
enum REGSTR_PATH_DMAARB = "System\\CurrentControlSet\\Services\\Arbitrators\\DMAArb";
enum REGSTR_PATH_IRQARB = "System\\CurrentControlSet\\Services\\Arbitrators\\IRQArb";
enum REGSTR_PATH_CODEPAGE = "System\\CurrentControlSet\\Control\\Nls\\Codepage";
enum REGSTR_PATH_FILESYSTEM = "System\\CurrentControlSet\\Control\\FileSystem";
enum REGSTR_PATH_FILESYSTEM_NOVOLTRACK = "System\\CurrentControlSet\\Control\\FileSystem\\NoVolTrack";
enum REGSTR_PATH_CDFS = "System\\CurrentControlSet\\Control\\FileSystem\\CDFS";
enum REGSTR_PATH_WINBOOT = "System\\CurrentControlSet\\Control\\WinBoot";
enum REGSTR_PATH_INSTALLEDFILES = "System\\CurrentControlSet\\Control\\InstalledFiles";
enum REGSTR_PATH_VMM32FILES = "System\\CurrentControlSet\\Control\\VMM32Files";
enum REGSTR_MAX_VALUE_LENGTH = 0x00000100;
enum REGSTR_KEY_DEVICE_PROPERTIES = "Properties";
enum REGSTR_VAL_SERVICE = "Service";
enum REGSTR_VAL_CLASSGUID = "ClassGUID";
enum REGSTR_VAL_DISABLECOUNT = "DisableCount";
enum REGSTR_VAL_DOCKSTATE = "DockState";
enum REGSTR_VAL_DEVICE_INSTANCE = "DeviceInstance";
enum REGSTR_VAL_SYMBOLIC_LINK = "SymbolicLink";
enum REGSTR_VAL_DEFAULT = "Default";
enum REGSTR_VAL_LOWERFILTERS = "LowerFilters";
enum REGSTR_VAL_UPPERFILTERS = "UpperFilters";
enum REGSTR_VAL_LOCATION_INFORMATION = "LocationInformation";
enum REGSTR_VAL_UI_NUMBER = "UINumber";
enum REGSTR_VAL_UI_NUMBER_DESC_FORMAT = "UINumberDescFormat";
enum REGSTR_VAL_CAPABILITIES = "Capabilities";
enum REGSTR_VAL_ADDRESS = "Address";
enum REGSTR_VAL_DEVICE_TYPE = "DeviceType";
enum REGSTR_VAL_DEVICE_CHARACTERISTICS = "DeviceCharacteristics";
enum REGSTR_VAL_DEVICE_SECURITY_DESCRIPTOR = "Security";
enum REGSTR_VAL_DEVICE_EXCLUSIVE = "Exclusive";
enum REGSTR_VAL_RESOURCE_PICKER_TAGS = "ResourcePickerTags";
enum REGSTR_VAL_RESOURCE_PICKER_EXCEPTIONS = "ResourcePickerExceptions";
enum REGSTR_VAL_CUSTOM_PROPERTY_CACHE_DATE = "CustomPropertyCacheDate";
enum REGSTR_VAL_CUSTOM_PROPERTY_HW_ID_KEY = "CustomPropertyHwIdKey";
enum REGSTR_VAL_LAST_UPDATE_TIME = "LastUpdateTime";
enum REGSTR_VAL_CONTAINERID = "ContainerID";
enum REGSTR_VAL_EJECT_PRIORITY = "EjectPriority";
enum REGSTR_KEY_CONTROL = "Control";
enum REGSTR_VAL_ACTIVESERVICE = "ActiveService";
enum REGSTR_VAL_LINKED = "Linked";
enum REGSTR_VAL_PHYSICALDEVICEOBJECT = "PhysicalDeviceObject";
enum REGSTR_VAL_REMOVAL_POLICY = "RemovalPolicy";
enum REGSTR_KEY_FILTERS = "Filters";
enum REGSTR_VAL_LOWER_FILTER_DEFAULT_LEVEL = "LowerFilterDefaultLevel";
enum REGSTR_VAL_UPPER_FILTER_DEFAULT_LEVEL = "UpperFilterDefaultLevel";
enum REGSTR_KEY_LOWER_FILTER_LEVEL_DEFAULT = "*Lower";
enum REGSTR_KEY_UPPER_FILTER_LEVEL_DEFAULT = "*Upper";
enum REGSTR_VAL_LOWER_FILTER_LEVELS = "LowerFilterLevels";
enum REGSTR_VAL_UPPER_FILTER_LEVELS = "UpperFilterLevels";
enum REGSTR_VAL_CURRENT_VERSION = "CurrentVersion";
enum REGSTR_VAL_CURRENT_BUILD = "CurrentBuildNumber";
enum REGSTR_VAL_CURRENT_CSDVERSION = "CSDVersion";
enum REGSTR_VAL_CURRENT_TYPE = "CurrentType";
enum REGSTR_VAL_BITSPERPIXEL = "BitsPerPixel";
enum REGSTR_VAL_RESOLUTION = "Resolution";
enum REGSTR_VAL_DPILOGICALX = "DPILogicalX";
enum REGSTR_VAL_DPILOGICALY = "DPILogicalY";
enum REGSTR_VAL_DPIPHYSICALX = "DPIPhysicalX";
enum REGSTR_VAL_DPIPHYSICALY = "DPIPhysicalY";
enum REGSTR_VAL_REFRESHRATE = "RefreshRate";
enum REGSTR_VAL_DISPLAYFLAGS = "DisplayFlags";
enum REGSTR_PATH_CONTROLPANEL = "Control Panel";
enum REGSTR_PATH_CONTROLSFOLDER = "Software\\Microsoft\\Windows\\CurrentVersion\\Controls Folder";
enum REGSTR_VAL_DOSCP = "OEMCP";
enum REGSTR_VAL_WINCP = "ACP";
enum REGSTR_VAL_DONTUSEMEM = "DontAllocLastMem";
enum REGSTR_VAL_SYSTEMROOT = "SystemRoot";
enum REGSTR_VAL_BOOTCOUNT = "BootCount";
enum REGSTR_VAL_REALNETSTART = "RealNetStart";
enum REGSTR_VAL_MEDIA = "MediaPath";
enum REGSTR_VAL_CONFIG = "ConfigPath";
enum REGSTR_VAL_DEVICEPATH = "DevicePath";
enum REGSTR_VAL_SRCPATH = "SourcePath";
enum REGSTR_VAL_DRIVERCACHEPATH = "DriverCachePath";
enum REGSTR_VAL_OLDWINDIR = "OldWinDir";
enum REGSTR_VAL_SETUPFLAGS = "SetupFlags";
enum REGSTR_VAL_REGOWNER = "RegisteredOwner";
enum REGSTR_VAL_REGORGANIZATION = "RegisteredOrganization";
enum REGSTR_VAL_LICENSINGINFO = "LicensingInfo";
enum REGSTR_VAL_OLDMSDOSVER = "OldMSDOSVer";
enum REGSTR_VAL_FIRSTINSTALLDATETIME = "FirstInstallDateTime";
enum REGSTR_VAL_INSTALLTYPE = "InstallType";
enum IT_COMPACT = 0x00000000;
enum IT_TYPICAL = 0x00000001;
enum IT_PORTABLE = 0x00000002;
enum IT_CUSTOM = 0x00000003;
enum REGSTR_VAL_WRAPPER = "Wrapper";
enum REGSTR_KEY_RUNHISTORY = "RunHistory";
enum REGSTR_VAL_LASTALIVEINTERVAL = "TimeStampInterval";
enum REGSTR_VAL_DIRTYSHUTDOWN = "DirtyShutdown";
enum REGSTR_VAL_DIRTYSHUTDOWNTIME = "DirtyShutdownTime";
enum REGSTR_VAL_BT = "6005BT";
enum REGSTR_VAL_LASTCOMPUTERNAME = "LastComputerName";
enum REGSTR_VAL_LASTALIVEBT = "LastAliveBT";
enum REGSTR_VAL_LASTALIVESTAMP = "LastAliveStamp";
enum REGSTR_VAL_LASTALIVESTAMPFORCED = "LastAliveStampForced";
enum REGSTR_VAL_LASTALIVESTAMPINTERVAL = "LastAliveStampInterval";
enum REGSTR_VAL_LASTALIVESTAMPPOLICYINTERVAL = "LastAliveStampPolicyInterval";
enum REGSTR_VAL_LASTALIVEUPTIME = "LastAliveUptime";
enum REGSTR_VAL_LASTALIVEPMPOLICY = "LastAlivePMPolicy";
enum REGSTR_VAL_REASONCODE = "ReasonCode";
enum REGSTR_VAL_COMMENT = "Comment";
enum REGSTR_VAL_SHUTDOWNREASON = "ShutdownReason";
enum REGSTR_VAL_SHUTDOWNREASON_CODE = "ShutdownReasonCode";
enum REGSTR_VAL_SHUTDOWNREASON_COMMENT = "ShutdownReasonComment";
enum REGSTR_VAL_SHUTDOWNREASON_PROCESS = "ShutdownReasonProcess";
enum REGSTR_VAL_SHUTDOWNREASON_USERNAME = "ShutdownReasonUserName";
enum REGSTR_VAL_SHOWREASONUI = "ShutdownReasonUI";
enum REGSTR_VAL_SHUTDOWN_IGNORE_PREDEFINED = "ShutdownIgnorePredefinedReasons";
enum REGSTR_VAL_SHUTDOWN_STATE_SNAPSHOT = "ShutdownStateSnapshot";
enum REGSTR_KEY_SETUP = "\\Setup";
enum REGSTR_VAL_BOOTDIR = "BootDir";
enum REGSTR_VAL_WINBOOTDIR = "WinbootDir";
enum REGSTR_VAL_WINDIR = "WinDir";
enum REGSTR_VAL_APPINSTPATH = "AppInstallPath";
enum REGSTR_KEY_EBDFILESLOCAL = "EBDFilesLocale";
enum REGSTR_KEY_EBDFILESKEYBOARD = "EBDFilesKeyboard";
enum REGSTR_KEY_EBDAUTOEXECBATLOCAL = "EBDAutoexecBatLocale";
enum REGSTR_KEY_EBDAUTOEXECBATKEYBOARD = "EBDAutoexecBatKeyboard";
enum REGSTR_KEY_EBDCONFIGSYSLOCAL = "EBDConfigSysLocale";
enum REGSTR_KEY_EBDCONFIGSYSKEYBOARD = "EBDConfigSysKeyboard";
enum REGSTR_VAL_POLICY = "Policy";
enum REGSTR_VAL_BEHAVIOR_ON_FAILED_VERIFY = "BehaviorOnFailedVerify";
enum DRIVERSIGN_NONE = 0x00000000;
enum DRIVERSIGN_WARNING = 0x00000001;
enum DRIVERSIGN_BLOCKING = 0x00000002;
enum REGSTR_VAL_MSDOSMODE = "MSDOSMode";
enum REGSTR_VAL_MSDOSMODEDISCARD = "Discard";
enum REGSTR_VAL_DOSOPTGLOBALFLAGS = "GlobalFlags";
enum DOSOPTGF_DEFCLEAN = 0x00000001;
enum REGSTR_VAL_DOSOPTFLAGS = "Flags";
enum REGSTR_VAL_OPTORDER = "Order";
enum REGSTR_VAL_CONFIGSYS = "Config.Sys";
enum REGSTR_VAL_AUTOEXEC = "Autoexec.Bat";
enum REGSTR_VAL_STDDOSOPTION = "StdOption";
enum REGSTR_VAL_DOSOPTTIP = "TipText";
enum DOSOPTF_DEFAULT = 0x00000001;
enum DOSOPTF_SUPPORTED = 0x00000002;
enum DOSOPTF_ALWAYSUSE = 0x00000004;
enum DOSOPTF_USESPMODE = 0x00000008;
enum DOSOPTF_PROVIDESUMB = 0x00000010;
enum DOSOPTF_NEEDSETUP = 0x00000020;
enum DOSOPTF_INDOSSTART = 0x00000040;
enum DOSOPTF_MULTIPLE = 0x00000080;
enum SUF_FIRSTTIME = 0x00000001;
enum SUF_EXPRESS = 0x00000002;
enum SUF_BATCHINF = 0x00000004;
enum SUF_CLEAN = 0x00000008;
enum SUF_INSETUP = 0x00000010;
enum SUF_NETSETUP = 0x00000020;
enum SUF_NETHDBOOT = 0x00000040;
enum SUF_NETRPLBOOT = 0x00000080;
enum SUF_SBSCOPYOK = 0x00000100;
enum REGSTR_VAL_DOSPAGER = "DOSPager";
enum REGSTR_VAL_VXDGROUPS = "VXDGroups";
enum REGSTR_VAL_VPOWERDFLAGS = "Flags";
enum VPDF_DISABLEPWRMGMT = 0x00000001;
enum VPDF_FORCEAPM10MODE = 0x00000002;
enum VPDF_SKIPINTELSLCHECK = 0x00000004;
enum VPDF_DISABLEPWRSTATUSPOLL = 0x00000008;
enum VPDF_DISABLERINGRESUME = 0x00000010;
enum VPDF_SHOWMULTIBATT = 0x00000020;
enum BIF_SHOWSIMILARDRIVERS = 0x00000001;
enum BIF_RAWDEVICENEEDSDRIVER = 0x00000002;
enum REGSTR_VAL_WORKGROUP = "Workgroup";
enum REGSTR_VAL_DIRECTHOST = "DirectHost";
enum REGSTR_VAL_FILESHARING = "FileSharing";
enum REGSTR_VAL_PRINTSHARING = "PrintSharing";
enum REGSTR_VAL_FIRSTNETDRIVE = "FirstNetworkDrive";
enum REGSTR_VAL_MAXCONNECTIONS = "MaxConnections";
enum REGSTR_VAL_APISUPPORT = "APISupport";
enum REGSTR_VAL_MAXRETRY = "MaxRetry";
enum REGSTR_VAL_MINRETRY = "MinRetry";
enum REGSTR_VAL_SUPPORTLFN = "SupportLFN";
enum REGSTR_VAL_SUPPORTBURST = "SupportBurst";
enum REGSTR_VAL_SUPPORTTUNNELLING = "SupportTunnelling";
enum REGSTR_VAL_FULLTRACE = "FullTrace";
enum REGSTR_VAL_READCACHING = "ReadCaching";
enum REGSTR_VAL_SHOWDOTS = "ShowDots";
enum REGSTR_VAL_GAPTIME = "GapTime";
enum REGSTR_VAL_SEARCHMODE = "SearchMode";
enum REGSTR_VAL_SHELLVERSION = "ShellVersion";
enum REGSTR_VAL_MAXLIP = "MaxLIP";
enum REGSTR_VAL_PRESERVECASE = "PreserveCase";
enum REGSTR_VAL_OPTIMIZESFN = "OptimizeSFN";
enum REGSTR_VAL_NCP_BROWSEMASTER = "BrowseMaster";
enum REGSTR_VAL_NCP_USEPEERBROWSING = "Use_PeerBrowsing";
enum REGSTR_VAL_NCP_USESAP = "Use_Sap";
enum REGSTR_VAL_PCCARD_POWER = "EnablePowerManagement";
enum REGSTR_VAL_WIN31FILESYSTEM = "Win31FileSystem";
enum REGSTR_VAL_PRESERVELONGNAMES = "PreserveLongNames";
enum REGSTR_VAL_DRIVEWRITEBEHIND = "DriveWriteBehind";
enum REGSTR_VAL_ASYNCFILECOMMIT = "AsyncFileCommit";
enum REGSTR_VAL_PATHCACHECOUNT = "PathCache";
enum REGSTR_VAL_NAMECACHECOUNT = "NameCache";
enum REGSTR_VAL_CONTIGFILEALLOC = "ContigFileAllocSize";
enum REGSTR_VAL_FREESPACERATIO = "FreeSpaceRatio";
enum REGSTR_VAL_VOLIDLETIMEOUT = "VolumeIdleTimeout";
enum REGSTR_VAL_BUFFIDLETIMEOUT = "BufferIdleTimeout";
enum REGSTR_VAL_BUFFAGETIMEOUT = "BufferAgeTimeout";
enum REGSTR_VAL_NAMENUMERICTAIL = "NameNumericTail";
enum REGSTR_VAL_READAHEADTHRESHOLD = "ReadAheadThreshold";
enum REGSTR_VAL_DOUBLEBUFFER = "DoubleBuffer";
enum REGSTR_VAL_SOFTCOMPATMODE = "SoftCompatMode";
enum REGSTR_VAL_DRIVESPINDOWN = "DriveSpinDown";
enum REGSTR_VAL_FORCEPMIO = "ForcePMIO";
enum REGSTR_VAL_FORCERMIO = "ForceRMIO";
enum REGSTR_VAL_LASTBOOTPMDRVS = "LastBootPMDrvs";
enum REGSTR_VAL_ACSPINDOWNPREVIOUS = "ACSpinDownPrevious";
enum REGSTR_VAL_BATSPINDOWNPREVIOUS = "BatSpinDownPrevious";
enum REGSTR_VAL_VIRTUALHDIRQ = "VirtualHDIRQ";
enum REGSTR_VAL_SRVNAMECACHECOUNT = "ServerNameCacheMax";
enum REGSTR_VAL_SRVNAMECACHE = "ServerNameCache";
enum REGSTR_VAL_SRVNAMECACHENETPROV = "ServerNameCacheNumNets";
enum REGSTR_VAL_AUTOMOUNT = "AutoMountDrives";
enum REGSTR_VAL_COMPRESSIONMETHOD = "CompressionAlgorithm";
enum REGSTR_VAL_COMPRESSIONTHRESHOLD = "CompressionThreshold";
enum REGSTR_VAL_ACDRIVESPINDOWN = "ACDriveSpinDown";
enum REGSTR_VAL_BATDRIVESPINDOWN = "BatDriveSpinDown";
enum REGSTR_VAL_CDCACHESIZE = "CacheSize";
enum REGSTR_VAL_CDPREFETCH = "Prefetch";
enum REGSTR_VAL_CDPREFETCHTAIL = "PrefetchTail";
enum REGSTR_VAL_CDRAWCACHE = "RawCache";
enum REGSTR_VAL_CDEXTERRORS = "ExtendedErrors";
enum REGSTR_VAL_CDSVDSENSE = "SVDSense";
enum REGSTR_VAL_CDSHOWVERSIONS = "ShowVersions";
enum REGSTR_VAL_CDCOMPATNAMES = "MSCDEXCompatNames";
enum REGSTR_VAL_CDNOREADAHEAD = "NoReadAhead";
enum REGSTR_VAL_SCSI = "SCSI\\";
enum REGSTR_VAL_ESDI = "ESDI\\";
enum REGSTR_VAL_FLOP = "FLOP\\";
enum REGSTR_VAL_DISK = "GenDisk";
enum REGSTR_VAL_CDROM = "GenCD";
enum REGSTR_VAL_TAPE = "TAPE";
enum REGSTR_VAL_SCANNER = "SCANNER";
enum REGSTR_VAL_FLOPPY = "FLOPPY";
enum REGSTR_VAL_SCSITID = "SCSITargetID";
enum REGSTR_VAL_SCSILUN = "SCSILUN";
enum REGSTR_VAL_REVLEVEL = "RevisionLevel";
enum REGSTR_VAL_PRODUCTID = "ProductId";
enum REGSTR_VAL_PRODUCTTYPE = "ProductType";
enum REGSTR_VAL_DEVTYPE = "DeviceType";
enum REGSTR_VAL_REMOVABLE = "Removable";
enum REGSTR_VAL_CURDRVLET = "CurrentDriveLetterAssignment";
enum REGSTR_VAL_USRDRVLET = "UserDriveLetterAssignment";
enum REGSTR_VAL_SYNCDATAXFER = "SyncDataXfer";
enum REGSTR_VAL_AUTOINSNOTE = "AutoInsertNotification";
enum REGSTR_VAL_DISCONNECT = "Disconnect";
enum REGSTR_VAL_INT13 = "Int13";
enum REGSTR_VAL_PMODE_INT13 = "PModeInt13";
enum REGSTR_VAL_USERSETTINGS = "AdapterSettings";
enum REGSTR_VAL_NOIDE = "NoIDE";
enum REGSTR_VAL_DISKCLASSNAME = "DiskDrive";
enum REGSTR_VAL_CDROMCLASSNAME = "CDROM";
enum REGSTR_VAL_FORCELOAD = "ForceLoadPD";
enum REGSTR_VAL_FORCEFIFO = "ForceFIFO";
enum REGSTR_VAL_FORCECL = "ForceChangeLine";
enum REGSTR_VAL_NOUSECLASS = "NoUseClass";
enum REGSTR_VAL_NOINSTALLCLASS = "NoInstallClass";
enum REGSTR_VAL_NODISPLAYCLASS = "NoDisplayClass";
enum REGSTR_VAL_SILENTINSTALL = "SilentInstall";
enum REGSTR_VAL_FSFILTERCLASS = "FSFilterClass";
enum REGSTR_KEY_PCMCIA_CLASS = "PCMCIA";
enum REGSTR_KEY_SCSI_CLASS = "SCSIAdapter";
enum REGSTR_KEY_PORTS_CLASS = "ports";
enum REGSTR_KEY_MEDIA_CLASS = "MEDIA";
enum REGSTR_KEY_DISPLAY_CLASS = "Display";
enum REGSTR_KEY_KEYBOARD_CLASS = "Keyboard";
enum REGSTR_KEY_MOUSE_CLASS = "Mouse";
enum REGSTR_KEY_MONITOR_CLASS = "Monitor";
enum REGSTR_KEY_MODEM_CLASS = "Modem";
enum REGSTR_VAL_PCMCIA_OPT = "Options";
enum PCMCIA_OPT_HAVE_SOCKET = 0x00000001;
enum PCMCIA_OPT_AUTOMEM = 0x00000004;
enum PCMCIA_OPT_NO_SOUND = 0x00000008;
enum PCMCIA_OPT_NO_AUDIO = 0x00000010;
enum PCMCIA_OPT_NO_APMREMOVE = 0x00000020;
enum REGSTR_VAL_PCMCIA_MEM = "Memory";
enum PCMCIA_DEF_MEMBEGIN = 0x000c0000;
enum PCMCIA_DEF_MEMEND = 0x00ffffff;
enum PCMCIA_DEF_MEMLEN = 0x00001000;
enum REGSTR_VAL_PCMCIA_ALLOC = "AllocMemWin";
enum REGSTR_VAL_PCMCIA_ATAD = "ATADelay";
enum REGSTR_VAL_PCMCIA_SIZ = "MinRegionSize";
enum PCMCIA_DEF_MIN_REGION = 0x00010000;
enum REGSTR_VAL_P1284MDL = "Model";
enum REGSTR_VAL_P1284MFG = "Manufacturer";
enum REGSTR_VAL_ISAPNP = "ISAPNP";
enum REGSTR_VAL_ISAPNP_RDP_OVERRIDE = "RDPOverRide";
enum REGSTR_VAL_PCI = "PCI";
enum REGSTR_PCI_OPTIONS = "Options";
enum REGSTR_PCI_DUAL_IDE = "PCIDualIDE";
enum PCI_OPTIONS_USE_BIOS = 0x00000001;
enum PCI_OPTIONS_USE_IRQ_STEERING = 0x00000002;
enum AGP_FLAG_NO_1X_RATE = 0x00000001;
enum AGP_FLAG_NO_2X_RATE = 0x00000002;
enum AGP_FLAG_NO_4X_RATE = 0x00000004;
enum AGP_FLAG_NO_8X_RATE = 0x00000008;
enum AGP_FLAG_REVERSE_INITIALIZATION = 0x00000080;
enum AGP_FLAG_NO_SBA_ENABLE = 0x00000100;
enum AGP_FLAG_NO_FW_ENABLE = 0x00000200;
enum AGP_FLAG_SPECIAL_TARGET = 0x000fffff;
enum AGP_FLAG_SPECIAL_RESERVE = 0x000f8000;
enum REGSTR_KEY_CRASHES = "Crashes";
enum REGSTR_KEY_DANGERS = "Dangers";
enum REGSTR_KEY_DETMODVARS = "DetModVars";
enum REGSTR_KEY_NDISINFO = "NDISInfo";
enum REGSTR_VAL_PROTINIPATH = "ProtIniPath";
enum REGSTR_VAL_RESOURCES = "Resources";
enum REGSTR_VAL_CRASHFUNCS = "CrashFuncs";
enum REGSTR_VAL_CLASS = "Class";
enum REGSTR_VAL_CLASSDESC = "ClassDesc";
enum REGSTR_VAL_DEVDESC = "DeviceDesc";
enum REGSTR_VAL_BOOTCONFIG = "BootConfig";
enum REGSTR_VAL_DETFUNC = "DetFunc";
enum REGSTR_VAL_DETFLAGS = "DetFlags";
enum REGSTR_VAL_COMPATIBLEIDS = "CompatibleIDs";
enum REGSTR_VAL_DETCONFIG = "DetConfig";
enum REGSTR_VAL_VERIFYKEY = "VerifyKey";
enum REGSTR_VAL_COMINFO = "ComInfo";
enum REGSTR_VAL_INFNAME = "InfName";
enum REGSTR_VAL_CARDSPECIFIC = "CardSpecific";
enum REGSTR_VAL_NETOSTYPE = "NetOSType";
enum REGSTR_DATA_NETOS_NDIS = "NDIS";
enum REGSTR_DATA_NETOS_ODI = "ODI";
enum REGSTR_DATA_NETOS_IPX = "IPX";
enum REGSTR_VAL_MFG = "Mfg";
enum REGSTR_VAL_SCAN_ONLY_FIRST = "ScanOnlyFirstDrive";
enum REGSTR_VAL_SHARE_IRQ = "ForceIRQSharing";
enum REGSTR_VAL_NONSTANDARD_ATAPI = "NonStandardATAPI";
enum REGSTR_VAL_IDE_FORCE_SERIALIZE = "ForceSerialization";
enum REGSTR_VAL_MAX_HCID_LEN = 0x00000400;
enum REGSTR_VAL_HWREV = "HWRevision";
enum REGSTR_VAL_ENABLEINTS = "EnableInts";
enum REGDF_NOTDETIO = 0x00000001;
enum REGDF_NOTDETMEM = 0x00000002;
enum REGDF_NOTDETIRQ = 0x00000004;
enum REGDF_NOTDETDMA = 0x00000008;
enum REGDF_NEEDFULLCONFIG = 0x00000010;
enum REGDF_GENFORCEDCONFIG = 0x00000020;
enum REGDF_NODETCONFIG = 0x00008000;
enum REGDF_CONFLICTIO = 0x00010000;
enum REGDF_CONFLICTMEM = 0x00020000;
enum REGDF_CONFLICTIRQ = 0x00040000;
enum REGDF_CONFLICTDMA = 0x00080000;
enum REGDF_MAPIRQ2TO9 = 0x00100000;
enum REGDF_NOTVERIFIED = 0x80000000;
enum REGSTR_VAL_APMBIOSVER = "APMBiosVer";
enum REGSTR_VAL_APMFLAGS = "APMFlags";
enum REGSTR_VAL_SLSUPPORT = "SLSupport";
enum REGSTR_VAL_MACHINETYPE = "MachineType";
enum REGSTR_VAL_SETUPMACHINETYPE = "SetupMachineType";
enum REGSTR_MACHTYPE_UNKNOWN = "Unknown";
enum REGSTR_MACHTYPE_IBMPC = "IBM PC";
enum REGSTR_MACHTYPE_IBMPCJR = "IBM PCjr";
enum REGSTR_MACHTYPE_IBMPCCONV = "IBM PC Convertible";
enum REGSTR_MACHTYPE_IBMPCXT = "IBM PC/XT";
enum REGSTR_MACHTYPE_IBMPCXT_286 = "IBM PC/XT 286";
enum REGSTR_MACHTYPE_IBMPCAT = "IBM PC/AT";
enum REGSTR_MACHTYPE_IBMPS2_25 = "IBM PS/2-25";
enum REGSTR_MACHTYPE_IBMPS2_30_286 = "IBM PS/2-30 286";
enum REGSTR_MACHTYPE_IBMPS2_30 = "IBM PS/2-30";
enum REGSTR_MACHTYPE_IBMPS2_50 = "IBM PS/2-50";
enum REGSTR_MACHTYPE_IBMPS2_50Z = "IBM PS/2-50Z";
enum REGSTR_MACHTYPE_IBMPS2_55SX = "IBM PS/2-55SX";
enum REGSTR_MACHTYPE_IBMPS2_60 = "IBM PS/2-60";
enum REGSTR_MACHTYPE_IBMPS2_65SX = "IBM PS/2-65SX";
enum REGSTR_MACHTYPE_IBMPS2_70 = "IBM PS/2-70";
enum REGSTR_MACHTYPE_IBMPS2_P70 = "IBM PS/2-P70";
enum REGSTR_MACHTYPE_IBMPS2_70_80 = "IBM PS/2-70/80";
enum REGSTR_MACHTYPE_IBMPS2_80 = "IBM PS/2-80";
enum REGSTR_MACHTYPE_IBMPS2_90 = "IBM PS/2-90";
enum REGSTR_MACHTYPE_IBMPS1 = "IBM PS/1";
enum REGSTR_MACHTYPE_PHOENIX_PCAT = "Phoenix PC/AT Compatible";
enum REGSTR_MACHTYPE_HP_VECTRA = "HP Vectra";
enum REGSTR_MACHTYPE_ATT_PC = "AT&T PC";
enum REGSTR_MACHTYPE_ZENITH_PC = "Zenith PC";
enum REGSTR_VAL_APMMENUSUSPEND = "APMMenuSuspend";
enum APMMENUSUSPEND_DISABLED = 0x00000000;
enum APMMENUSUSPEND_ENABLED = 0x00000001;
enum APMMENUSUSPEND_UNDOCKED = 0x00000002;
enum APMMENUSUSPEND_NOCHANGE = 0x00000080;
enum REGSTR_VAL_APMACTIMEOUT = "APMACTimeout";
enum REGSTR_VAL_APMBATTIMEOUT = "APMBatTimeout";
enum APMTIMEOUT_DISABLED = 0x00000000;
enum REGSTR_VAL_APMSHUTDOWNPOWER = "APMShutDownPower";
enum REGSTR_VAL_BUSTYPE = "BusType";
enum REGSTR_VAL_CPU = "CPU";
enum REGSTR_VAL_NDP = "NDP";
enum REGSTR_VAL_PNPBIOSVER = "PnPBIOSVer";
enum REGSTR_VAL_PNPSTRUCOFFSET = "PnPStrucOffset";
enum REGSTR_VAL_PCIBIOSVER = "PCIBIOSVer";
enum REGSTR_VAL_HWMECHANISM = "HWMechanism";
enum REGSTR_VAL_LASTPCIBUSNUM = "LastPCIBusNum";
enum REGSTR_VAL_CONVMEM = "ConvMem";
enum REGSTR_VAL_EXTMEM = "ExtMem";
enum REGSTR_VAL_COMPUTERNAME = "ComputerName";
enum REGSTR_VAL_BIOSNAME = "BIOSName";
enum REGSTR_VAL_BIOSVERSION = "BIOSVersion";
enum REGSTR_VAL_BIOSDATE = "BIOSDate";
enum REGSTR_VAL_MODEL = "Model";
enum REGSTR_VAL_SUBMODEL = "Submodel";
enum REGSTR_VAL_REVISION = "Revision";
enum REGSTR_VAL_FIFODEPTH = "FIFODepth";
enum REGSTR_VAL_RDINTTHRESHOLD = "RDIntThreshold";
enum REGSTR_VAL_WRINTTHRESHOLD = "WRIntThreshold";
enum REGSTR_VAL_PRIORITY = "Priority";
enum REGSTR_VAL_DRIVER = "Driver";
enum REGSTR_VAL_FUNCDESC = "FunctionDesc";
enum REGSTR_VAL_FORCEDCONFIG = "ForcedConfig";
enum REGSTR_VAL_CONFIGFLAGS = "ConfigFlags";
enum REGSTR_VAL_CSCONFIGFLAGS = "CSConfigFlags";
enum CSCONFIGFLAG_BITS = 0x00000007;
enum CSCONFIGFLAG_DISABLED = 0x00000001;
enum CSCONFIGFLAG_DO_NOT_CREATE = 0x00000002;
enum CSCONFIGFLAG_DO_NOT_START = 0x00000004;
enum DMSTATEFLAG_APPLYTOALL = 0x00000001;
enum REGSTR_VAL_ROOT_DEVNODE = "HTREE\\ROOT\\0";
enum REGSTR_VAL_RESERVED_DEVNODE = "HTREE\\RESERVED\\0";
enum REGSTR_PATH_MULTI_FUNCTION = "MF";
enum REGSTR_VAL_RESOURCE_MAP = "ResourceMap";
enum REGSTR_PATH_CHILD_PREFIX = "Child";
enum NUM_RESOURCE_MAP = 0x00000100;
enum REGSTR_VAL_MF_FLAGS = "MFFlags";
enum MF_FLAGS_EVEN_IF_NO_RESOURCE = 0x00000001;
enum MF_FLAGS_NO_CREATE_IF_NO_RESOURCE = 0x00000002;
enum MF_FLAGS_FILL_IN_UNKNOWN_RESOURCE = 0x00000004;
enum MF_FLAGS_CREATE_BUT_NO_SHOW_DISABLED = 0x00000008;
enum REGSTR_VAL_EISA_RANGES = "EISARanges";
enum REGSTR_VAL_EISA_FUNCTIONS = "EISAFunctions";
enum REGSTR_VAL_EISA_FUNCTIONS_MASK = "EISAFunctionsMask";
enum REGSTR_VAL_EISA_FLAGS = "EISAFlags";
enum REGSTR_VAL_EISA_SIMULATE_INT15 = "EISASimulateInt15";
enum EISAFLAG_NO_IO_MERGE = 0x00000001;
enum EISAFLAG_SLOT_IO_FIRST = 0x00000002;
enum EISA_NO_MAX_FUNCTION = 0x000000ff;
enum NUM_EISA_RANGES = 0x00000004;
enum REGSTR_VAL_DRVDESC = "DriverDesc";
enum REGSTR_VAL_DEVLOADER = "DevLoader";
enum REGSTR_VAL_STATICVXD = "StaticVxD";
enum REGSTR_VAL_PROPERTIES = "Properties";
enum REGSTR_VAL_MANUFACTURER = "Manufacturer";
enum REGSTR_VAL_EXISTS = "Exists";
enum REGSTR_VAL_CMENUMFLAGS = "CMEnumFlags";
enum REGSTR_VAL_CMDRIVFLAGS = "CMDrivFlags";
enum REGSTR_VAL_ENUMERATOR = "Enumerator";
enum REGSTR_VAL_DEVICEDRIVER = "DeviceDriver";
enum REGSTR_VAL_PORTNAME = "PortName";
enum REGSTR_VAL_INFPATH = "InfPath";
enum REGSTR_VAL_INFSECTION = "InfSection";
enum REGSTR_VAL_INFSECTIONEXT = "InfSectionExt";
enum REGSTR_VAL_POLLING = "Polling";
enum REGSTR_VAL_DONTLOADIFCONFLICT = "DontLoadIfConflict";
enum REGSTR_VAL_PORTSUBCLASS = "PortSubClass";
enum REGSTR_VAL_NETCLEAN = "NetClean";
enum REGSTR_VAL_IDE_NO_SERIALIZE = "IDENoSerialize";
enum REGSTR_VAL_NOCMOSORFDPT = "NoCMOSorFDPT";
enum REGSTR_VAL_COMVERIFYBASE = "COMVerifyBase";
enum REGSTR_VAL_MATCHINGDEVID = "MatchingDeviceId";
enum REGSTR_VAL_DRIVERDATE = "DriverDate";
enum REGSTR_VAL_DRIVERDATEDATA = "DriverDateData";
enum REGSTR_VAL_DRIVERVERSION = "DriverVersion";
enum REGSTR_VAL_LOCATION_INFORMATION_OVERRIDE = "LocationInformationOverride";
enum REGSTR_KEY_OVERRIDE = "Override";
enum REGSTR_VAL_CONFIGMG = "CONFIGMG";
enum REGSTR_VAL_SYSDM = "SysDM";
enum REGSTR_VAL_SYSDMFUNC = "SysDMFunc";
enum REGSTR_VAL_PRIVATE = "Private";
enum REGSTR_VAL_PRIVATEFUNC = "PrivateFunc";
enum REGSTR_VAL_DETECT = "Detect";
enum REGSTR_VAL_DETECTFUNC = "DetectFunc";
enum REGSTR_VAL_ASKFORCONFIG = "AskForConfig";
enum REGSTR_VAL_ASKFORCONFIGFUNC = "AskForConfigFunc";
enum REGSTR_VAL_WAITFORUNDOCK = "WaitForUndock";
enum REGSTR_VAL_WAITFORUNDOCKFUNC = "WaitForUndockFunc";
enum REGSTR_VAL_REMOVEROMOKAY = "RemoveRomOkay";
enum REGSTR_VAL_REMOVEROMOKAYFUNC = "RemoveRomOkayFunc";
enum REGSTR_VAL_CURCONFIG = "CurrentConfig";
enum REGSTR_VAL_FRIENDLYNAME = "FriendlyName";
enum REGSTR_VAL_CURRENTCONFIG = "CurrentConfig";
enum REGSTR_VAL_MAP = "Map";
enum REGSTR_VAL_ID = "CurrentID";
enum REGSTR_VAL_DOCKED = "CurrentDockedState";
enum REGSTR_VAL_CHECKSUM = "CurrentChecksum";
enum REGSTR_VAL_HWDETECT = "HardwareDetect";
enum REGSTR_VAL_INHIBITRESULTS = "InhibitResults";
enum REGSTR_VAL_PROFILEFLAGS = "ProfileFlags";
enum REGSTR_KEY_PCMCIA = "PCMCIA\\";
enum REGSTR_KEY_PCUNKNOWN = "UNKNOWN_MANUFACTURER";
enum REGSTR_VAL_PCSSDRIVER = "Driver";
enum REGSTR_KEY_PCMTD = "MTD-";
enum REGSTR_VAL_PCMTDRIVER = "MTD";
enum REGSTR_VAL_HARDWAREID = "HardwareID";
enum REGSTR_VAL_INSTALLER = "Installer";
enum REGSTR_VAL_INSTALLER_32 = "Installer32";
enum REGSTR_VAL_INSICON = "Icon";
enum REGSTR_VAL_ENUMPROPPAGES = "EnumPropPages";
enum REGSTR_VAL_ENUMPROPPAGES_32 = "EnumPropPages32";
enum REGSTR_VAL_BASICPROPERTIES = "BasicProperties";
enum REGSTR_VAL_BASICPROPERTIES_32 = "BasicProperties32";
enum REGSTR_VAL_COINSTALLERS_32 = "CoInstallers32";
enum REGSTR_VAL_PRIVATEPROBLEM = "PrivateProblem";
enum REGSTR_KEY_CURRENT = "Current";
enum REGSTR_KEY_DEFAULT = "Default";
enum REGSTR_KEY_MODES = "Modes";
enum REGSTR_VAL_MODE = "Mode";
enum REGSTR_VAL_BPP = "BPP";
enum REGSTR_VAL_HRES = "HRes";
enum REGSTR_VAL_VRES = "VRes";
enum REGSTR_VAL_FONTSIZE = "FontSize";
enum REGSTR_VAL_DRV = "drv";
enum REGSTR_VAL_GRB = "grb";
enum REGSTR_VAL_VDD = "vdd";
enum REGSTR_VAL_VER = "Ver";
enum REGSTR_VAL_MAXRES = "MaxResolution";
enum REGSTR_VAL_DPMS = "DPMS";
enum REGSTR_VAL_RESUMERESET = "ResumeReset";
enum REGSTR_KEY_SYSTEM = "System";
enum REGSTR_KEY_USER = "User";
enum REGSTR_VAL_DPI = "dpi";
enum REGSTR_VAL_PCICOPTIONS = "PCICOptions";
enum PCIC_DEFAULT_IRQMASK = 0x00004eb8;
enum PCIC_DEFAULT_NUMSOCKETS = 0x00000000;
enum REGSTR_VAL_PCICIRQMAP = "PCICIRQMap";
enum REGSTR_PATH_APPEARANCE = "Control Panel\\Appearance";
enum REGSTR_PATH_LOOKSCHEMES = "Control Panel\\Appearance\\Schemes";
enum REGSTR_VAL_CUSTOMCOLORS = "CustomColors";
enum REGSTR_PATH_SCREENSAVE = "Control Panel\\Desktop";
enum REGSTR_VALUE_USESCRPASSWORD = "ScreenSaveUsePassword";
enum REGSTR_VALUE_SCRPASSWORD = "ScreenSave_Data";
enum REGSTR_VALUE_LOWPOWERTIMEOUT = "ScreenSaveLowPowerTimeout";
enum REGSTR_VALUE_POWEROFFTIMEOUT = "ScreenSavePowerOffTimeout";
enum REGSTR_VALUE_LOWPOWERACTIVE = "ScreenSaveLowPowerActive";
enum REGSTR_VALUE_POWEROFFACTIVE = "ScreenSavePowerOffActive";
enum REGSTR_PATH_WINDOWSAPPLETS = "Software\\Microsoft\\Windows\\CurrentVersion\\Applets";
enum REGSTR_PATH_SYSTRAY = "Software\\Microsoft\\Windows\\CurrentVersion\\Applets\\SysTray";
enum REGSTR_VAL_SYSTRAYSVCS = "Services";
enum REGSTR_VAL_SYSTRAYBATFLAGS = "PowerFlags";
enum REGSTR_VAL_SYSTRAYPCCARDFLAGS = "PCMCIAFlags";
enum REGSTR_PATH_NETWORK_USERSETTINGS = "Network";
enum REGSTR_KEY_NETWORK_PERSISTENT = "\\Persistent";
enum REGSTR_KEY_NETWORK_RECENT = "\\Recent";
enum REGSTR_VAL_REMOTE_PATH = "RemotePath";
enum REGSTR_VAL_USER_NAME = "UserName";
enum REGSTR_VAL_PROVIDER_NAME = "ProviderName";
enum REGSTR_VAL_CONNECTION_TYPE = "ConnectionType";
enum REGSTR_VAL_UPGRADE = "Upgrade";
enum REGSTR_KEY_LOGON = "\\Logon";
enum REGSTR_VAL_MUSTBEVALIDATED = "MustBeValidated";
enum REGSTR_VAL_RUNLOGINSCRIPT = "ProcessLoginScript";
enum REGSTR_KEY_NETWORKPROVIDER = "\\NetworkProvider";
enum REGSTR_VAL_AUTHENT_AGENT = "AuthenticatingAgent";
enum REGSTR_VAL_PREFREDIR = "PreferredRedir";
enum REGSTR_VAL_AUTOSTART = "AutoStart";
enum REGSTR_VAL_AUTOLOGON = "AutoLogon";
enum REGSTR_VAL_NETCARD = "Netcard";
enum REGSTR_VAL_TRANSPORT = "Transport";
enum REGSTR_VAL_DYNAMIC = "Dynamic";
enum REGSTR_VAL_TRANSITION = "Transition";
enum REGSTR_VAL_STATICDRIVE = "StaticDrive";
enum REGSTR_VAL_LOADHI = "LoadHi";
enum REGSTR_VAL_LOADRMDRIVERS = "LoadRMDrivers";
enum REGSTR_VAL_SETUPN = "SetupN";
enum REGSTR_VAL_SETUPNPATH = "SetupNPath";
enum REGSTR_VAL_WRKGRP_FORCEMAPPING = "WrkgrpForceMapping";
enum REGSTR_VAL_WRKGRP_REQUIRED = "WrkgrpRequired";
enum REGSTR_PATH_CURRENT_CONTROL_SET = "System\\CurrentControlSet\\Control";
enum REGSTR_VAL_CURRENT_USER = "Current User";
enum REGSTR_PATH_PWDPROVIDER = "System\\CurrentControlSet\\Control\\PwdProvider";
enum REGSTR_VAL_PWDPROVIDER_PATH = "ProviderPath";
enum REGSTR_VAL_PWDPROVIDER_DESC = "Description";
enum REGSTR_VAL_PWDPROVIDER_CHANGEPWD = "ChangePassword";
enum REGSTR_VAL_PWDPROVIDER_CHANGEPWDHWND = "ChangePasswordHwnd";
enum REGSTR_VAL_PWDPROVIDER_GETPWDSTATUS = "GetPasswordStatus";
enum REGSTR_VAL_PWDPROVIDER_ISNP = "NetworkProvider";
enum REGSTR_VAL_PWDPROVIDER_CHANGEORDER = "ChangeOrder";
enum REGSTR_PATH_POLICIES = "Software\\Microsoft\\Windows\\CurrentVersion\\Policies";
enum REGSTR_PATH_UPDATE = "System\\CurrentControlSet\\Control\\Update";
enum REGSTR_VALUE_ENABLE = "Enable";
enum REGSTR_VALUE_VERBOSE = "Verbose";
enum REGSTR_VALUE_NETPATH = "NetworkPath";
enum REGSTR_VALUE_DEFAULTLOC = "UseDefaultNetLocation";
enum REGSTR_KEY_NETWORK = "Network";
enum REGSTR_KEY_PRINTERS = "Printers";
enum REGSTR_KEY_WINOLDAPP = "WinOldApp";
enum REGSTR_KEY_EXPLORER = "Explorer";
enum REGSTR_VAL_NOFILESHARING = "NoFileSharing";
enum REGSTR_VAL_NOPRINTSHARING = "NoPrintSharing";
enum REGSTR_VAL_NOFILESHARINGCTRL = "NoFileSharingControl";
enum REGSTR_VAL_NOPRINTSHARINGCTRL = "NoPrintSharingControl";
enum REGSTR_VAL_HIDESHAREPWDS = "HideSharePwds";
enum REGSTR_VAL_DISABLEPWDCACHING = "DisablePwdCaching";
enum REGSTR_VAL_ALPHANUMPWDS = "AlphanumPwds";
enum REGSTR_VAL_NETSETUP_DISABLE = "NoNetSetup";
enum REGSTR_VAL_NETSETUP_NOCONFIGPAGE = "NoNetSetupConfigPage";
enum REGSTR_VAL_NETSETUP_NOIDPAGE = "NoNetSetupIDPage";
enum REGSTR_VAL_NETSETUP_NOSECURITYPAGE = "NoNetSetupSecurityPage";
enum REGSTR_VAL_SYSTEMCPL_NOVIRTMEMPAGE = "NoVirtMemPage";
enum REGSTR_VAL_SYSTEMCPL_NODEVMGRPAGE = "NoDevMgrPage";
enum REGSTR_VAL_SYSTEMCPL_NOCONFIGPAGE = "NoConfigPage";
enum REGSTR_VAL_SYSTEMCPL_NOFILESYSPAGE = "NoFileSysPage";
enum REGSTR_VAL_DISPCPL_NODISPCPL = "NoDispCPL";
enum REGSTR_VAL_DISPCPL_NOBACKGROUNDPAGE = "NoDispBackgroundPage";
enum REGSTR_VAL_DISPCPL_NOSCRSAVPAGE = "NoDispScrSavPage";
enum REGSTR_VAL_DISPCPL_NOAPPEARANCEPAGE = "NoDispAppearancePage";
enum REGSTR_VAL_DISPCPL_NOSETTINGSPAGE = "NoDispSettingsPage";
enum REGSTR_VAL_SECCPL_NOSECCPL = "NoSecCPL";
enum REGSTR_VAL_SECCPL_NOPWDPAGE = "NoPwdPage";
enum REGSTR_VAL_SECCPL_NOADMINPAGE = "NoAdminPage";
enum REGSTR_VAL_SECCPL_NOPROFILEPAGE = "NoProfilePage";
enum REGSTR_VAL_PRINTERS_HIDETABS = "NoPrinterTabs";
enum REGSTR_VAL_PRINTERS_NODELETE = "NoDeletePrinter";
enum REGSTR_VAL_PRINTERS_NOADD = "NoAddPrinter";
enum REGSTR_VAL_WINOLDAPP_DISABLED = "Disabled";
enum REGSTR_VAL_WINOLDAPP_NOREALMODE = "NoRealMode";
enum REGSTR_VAL_NOENTIRENETWORK = "NoEntireNetwork";
enum REGSTR_VAL_NOWORKGROUPCONTENTS = "NoWorkgroupContents";
enum REGSTR_VAL_UNDOCK_WITHOUT_LOGON = "UndockWithoutLogon";
enum REGSTR_VAL_MINPWDLEN = "MinPwdLen";
enum REGSTR_VAL_PWDEXPIRATION = "PwdExpiration";
enum REGSTR_VAL_WIN31PROVIDER = "Win31Provider";
enum REGSTR_VAL_DISABLEREGTOOLS = "DisableRegistryTools";
enum REGSTR_PATH_WINLOGON = "Software\\Microsoft\\Windows\\CurrentVersion\\Winlogon";
enum REGSTR_VAL_LEGALNOTICECAPTION = "LegalNoticeCaption";
enum REGSTR_VAL_LEGALNOTICETEXT = "LegalNoticeText";
enum REGSTR_VAL_DRIVE_SPINDOWN = "NoDispSpinDown";
enum REGSTR_VAL_SHUTDOWN_FLAGS = "ShutdownFlags";
enum REGSTR_VAL_RESTRICTRUN = "RestrictRun";
enum REGSTR_KEY_POL_USERS = "Users";
enum REGSTR_KEY_POL_COMPUTERS = "Computers";
enum REGSTR_KEY_POL_USERGROUPS = "UserGroups";
enum REGSTR_KEY_POL_DEFAULT = ".default";
enum REGSTR_KEY_POL_USERGROUPDATA = "GroupData\\UserGroups\\Priority";
enum REGSTR_PATH_TIMEZONE = "System\\CurrentControlSet\\Control\\TimeZoneInformation";
enum REGSTR_VAL_TZBIAS = "Bias";
enum REGSTR_VAL_TZDLTBIAS = "DaylightBias";
enum REGSTR_VAL_TZSTDBIAS = "StandardBias";
enum REGSTR_VAL_TZACTBIAS = "ActiveTimeBias";
enum REGSTR_VAL_TZDLTFLAG = "DaylightFlag";
enum REGSTR_VAL_TZSTDSTART = "StandardStart";
enum REGSTR_VAL_TZDLTSTART = "DaylightStart";
enum REGSTR_VAL_TZDLTNAME = "DaylightName";
enum REGSTR_VAL_TZSTDNAME = "StandardName";
enum REGSTR_VAL_TZNOCHANGESTART = "NoChangeStart";
enum REGSTR_VAL_TZNOCHANGEEND = "NoChangeEnd";
enum REGSTR_VAL_TZNOAUTOTIME = "DisableAutoDaylightTimeSet";
enum REGSTR_PATH_FLOATINGPOINTPROCESSOR = "HARDWARE\\DESCRIPTION\\System\\FloatingPointProcessor";
enum REGSTR_PATH_FLOATINGPOINTPROCESSOR0 = "HARDWARE\\DESCRIPTION\\System\\FloatingPointProcessor\\0";
enum REGSTR_PATH_COMPUTRNAME = "System\\CurrentControlSet\\Control\\ComputerName\\ComputerName";
enum REGSTR_VAL_COMPUTRNAME = "ComputerName";
enum REGSTR_PATH_SHUTDOWN = "System\\CurrentControlSet\\Control\\Shutdown";
enum REGSTR_VAL_FORCEREBOOT = "ForceReboot";
enum REGSTR_VAL_SETUPPROGRAMRAN = "SetupProgramRan";
enum REGSTR_VAL_DOES_POLLING = "PollingSupportNeeded";
enum REGSTR_PATH_KNOWNDLLS = "System\\CurrentControlSet\\Control\\SessionManager\\KnownDLLs";
enum REGSTR_PATH_KNOWN16DLLS = "System\\CurrentControlSet\\Control\\SessionManager\\Known16DLLs";
enum REGSTR_PATH_CHECKVERDLLS = "System\\CurrentControlSet\\Control\\SessionManager\\CheckVerDLLs";
enum REGSTR_PATH_WARNVERDLLS = "System\\CurrentControlSet\\Control\\SessionManager\\WarnVerDLLs";
enum REGSTR_PATH_HACKINIFILE = "System\\CurrentControlSet\\Control\\SessionManager\\HackIniFiles";
enum REGSTR_PATH_CHECKBADAPPS = "System\\CurrentControlSet\\Control\\SessionManager\\CheckBadApps";
enum REGSTR_PATH_APPPATCH = "System\\CurrentControlSet\\Control\\SessionManager\\AppPatches";
enum REGSTR_PATH_CHECKBADAPPS400 = "System\\CurrentControlSet\\Control\\SessionManager\\CheckBadApps400";
enum REGSTR_PATH_KNOWNVXDS = "System\\CurrentControlSet\\Control\\SessionManager\\KnownVxDs";
enum REGSTR_VAL_UNINSTALLER_DISPLAYNAME = "DisplayName";
enum REGSTR_VAL_UNINSTALLER_COMMANDLINE = "UninstallString";
enum REGSTR_VAL_REINSTALL_DISPLAYNAME = "DisplayName";
enum REGSTR_VAL_REINSTALL_STRING = "ReinstallString";
enum REGSTR_VAL_REINSTALL_DEVICEINSTANCEIDS = "DeviceInstanceIds";
enum REGSTR_PATH_DESKTOP = "Control Panel\\Desktop";
enum REGSTR_PATH_MOUSE = "Control Panel\\Mouse";
enum REGSTR_PATH_KEYBOARD = "Control Panel\\Keyboard";
enum REGSTR_PATH_COLORS = "Control Panel\\Colors";
enum REGSTR_PATH_SOUND = "Control Panel\\Sound";
enum REGSTR_PATH_METRICS = "Control Panel\\Desktop\\WindowMetrics";
enum REGSTR_PATH_ICONS = "Control Panel\\Icons";
enum REGSTR_PATH_CURSORS = "Control Panel\\Cursors";
enum REGSTR_PATH_CHECKDISK = "Software\\Microsoft\\Windows\\CurrentVersion\\Applets\\Check Drive";
enum REGSTR_PATH_CHECKDISKSET = "Settings";
enum REGSTR_PATH_CHECKDISKUDRVS = "NoUnknownDDErrDrvs";
enum REGSTR_PATH_FAULT = "Software\\Microsoft\\Windows\\CurrentVersion\\Fault";
enum REGSTR_VAL_FAULT_LOGFILE = "LogFile";
enum REGSTR_PATH_AEDEBUG = "Software\\Microsoft\\Windows NT\\CurrentVersion\\AeDebug";
enum REGSTR_VAL_AEDEBUG_DEBUGGER = "Debugger";
enum REGSTR_VAL_AEDEBUG_AUTO = "Auto";
enum REGSTR_PATH_GRPCONV = "Software\\Microsoft\\Windows\\CurrentVersion\\GrpConv";
enum REGSTR_VAL_REGITEMDELETEMESSAGE = "Removal Message";
enum REGSTR_PATH_LASTCHECK = "Software\\Microsoft\\Windows\\CurrentVersion\\Explorer\\LastCheck";
enum REGSTR_PATH_LASTOPTIMIZE = "Software\\Microsoft\\Windows\\CurrentVersion\\Explorer\\LastOptimize";
enum REGSTR_PATH_LASTBACKUP = "Software\\Microsoft\\Windows\\CurrentVersion\\Explorer\\LastBackup";
enum REGSTR_PATH_CHKLASTCHECK = "Software\\Microsoft\\Windows\\CurrentVersion\\Applets\\Check Drive\\LastCheck";
enum REGSTR_PATH_CHKLASTSURFAN = "Software\\Microsoft\\Windows\\CurrentVersion\\Applets\\Check Drive\\LastSurfaceAnalysis";
enum DTRESULTOK = 0x00000000;
enum DTRESULTFIX = 0x00000001;
enum DTRESULTPROB = 0x00000002;
enum DTRESULTPART = 0x00000003;
enum REGSTR_KEY_SHARES = "Software\\Microsoft\\Windows\\CurrentVersion\\Network\\LanMan";
enum REGSTR_VAL_SHARES_FLAGS = "Flags";
enum REGSTR_VAL_SHARES_TYPE = "Type";
enum REGSTR_VAL_SHARES_PATH = "Path";
enum REGSTR_VAL_SHARES_REMARK = "Remark";
enum REGSTR_VAL_SHARES_RW_PASS = "Parm1";
enum REGSTR_VAL_SHARES_RO_PASS = "Parm2";
enum REGSTR_PATH_PRINT = "System\\CurrentControlSet\\Control\\Print";
enum REGSTR_PATH_PRINTERS = "System\\CurrentControlSet\\Control\\Print\\Printers";
enum REGSTR_PATH_PROVIDERS = "System\\CurrentControlSet\\Control\\Print\\Providers";
enum REGSTR_PATH_MONITORS = "System\\CurrentControlSet\\Control\\Print\\Monitors";
enum REGSTR_PATH_ENVIRONMENTS = "System\\CurrentControlSet\\Control\\Print\\Environments";
enum REGSTR_VAL_START_ON_BOOT = "StartOnBoot";
enum REGSTR_VAL_PRINTERS_MASK = "PrintersMask";
enum REGSTR_VAL_DOS_SPOOL_MASK = "DOSSpoolMask";
enum REGSTR_KEY_CURRENT_ENV = "\\Windows 4.0";
enum REGSTR_KEY_DRIVERS = "\\Drivers";
enum REGSTR_KEY_PRINT_PROC = "\\Print Processors";
enum REGSTR_PATH_EVENTLABELS = "AppEvents\\EventLabels";
enum REGSTR_PATH_SCHEMES = "AppEvents\\Schemes";
enum REGSTR_PATH_MULTIMEDIA_AUDIO = "Software\\Microsoft\\Multimedia\\Audio";
enum REGSTR_KEY_JOYCURR = "CurrentJoystickSettings";
enum REGSTR_KEY_JOYSETTINGS = "JoystickSettings";
enum REGSTR_VAL_JOYUSERVALUES = "JoystickUserValues";
enum REGSTR_VAL_JOYCALLOUT = "JoystickCallout";
enum REGSTR_VAL_JOYNCONFIG = "Joystick%dConfiguration";
enum REGSTR_VAL_JOYNOEMNAME = "Joystick%dOEMName";
enum REGSTR_VAL_JOYNOEMCALLOUT = "Joystick%dOEMCallout";
enum REGSTR_VAL_JOYOEMCALLOUT = "OEMCallout";
enum REGSTR_VAL_JOYOEMNAME = "OEMName";
enum REGSTR_VAL_JOYOEMDATA = "OEMData";
enum REGSTR_VAL_JOYOEMXYLABEL = "OEMXYLabel";
enum REGSTR_VAL_JOYOEMZLABEL = "OEMZLabel";
enum REGSTR_VAL_JOYOEMRLABEL = "OEMRLabel";
enum REGSTR_VAL_JOYOEMPOVLABEL = "OEMPOVLabel";
enum REGSTR_VAL_JOYOEMULABEL = "OEMULabel";
enum REGSTR_VAL_JOYOEMVLABEL = "OEMVLabel";
enum REGSTR_VAL_JOYOEMTESTMOVEDESC = "OEMTestMoveDesc";
enum REGSTR_VAL_JOYOEMTESTBUTTONDESC = "OEMTestButtonDesc";
enum REGSTR_VAL_JOYOEMTESTMOVECAP = "OEMTestMoveCap";
enum REGSTR_VAL_JOYOEMTESTBUTTONCAP = "OEMTestButtonCap";
enum REGSTR_VAL_JOYOEMTESTWINCAP = "OEMTestWinCap";
enum REGSTR_VAL_JOYOEMCALCAP = "OEMCalCap";
enum REGSTR_VAL_JOYOEMCALWINCAP = "OEMCalWinCap";
enum REGSTR_VAL_JOYOEMCAL1 = "OEMCal1";
enum REGSTR_VAL_JOYOEMCAL2 = "OEMCal2";
enum REGSTR_VAL_JOYOEMCAL3 = "OEMCal3";
enum REGSTR_VAL_JOYOEMCAL4 = "OEMCal4";
enum REGSTR_VAL_JOYOEMCAL5 = "OEMCal5";
enum REGSTR_VAL_JOYOEMCAL6 = "OEMCal6";
enum REGSTR_VAL_JOYOEMCAL7 = "OEMCal7";
enum REGSTR_VAL_JOYOEMCAL8 = "OEMCal8";
enum REGSTR_VAL_JOYOEMCAL9 = "OEMCal9";
enum REGSTR_VAL_JOYOEMCAL10 = "OEMCal10";
enum REGSTR_VAL_JOYOEMCAL11 = "OEMCal11";
enum REGSTR_VAL_JOYOEMCAL12 = "OEMCal12";
enum REGSTR_VAL_AUDIO_BITMAP = "bitmap";
enum REGSTR_VAL_AUDIO_ICON = "icon";
enum REGSTR_PATH_DEVICEINSTALLER = "Software\\Microsoft\\Windows\\CurrentVersion\\Device Installer";
enum REGSTR_PATH_DIFX = "Software\\Microsoft\\Windows\\CurrentVersion\\DIFX";
enum REGSTR_VAL_SEARCHOPTIONS = "SearchOptions";
enum REGSTR_PATH_BIOSINFO = "System\\CurrentControlSet\\Control\\BiosInfo";
enum REGSTR_PATH_PCIIR = "System\\CurrentControlSet\\Control\\Pnp\\PciIrqRouting";
enum REGSTR_VAL_OPTIONS = "Options";
enum REGSTR_VAL_STAT = "Status";
enum REGSTR_VAL_TABLE_STAT = "TableStatus";
enum REGSTR_VAL_MINIPORT_STAT = "MiniportStatus";
enum PIR_OPTION_ENABLED = 0x00000001;
enum PIR_OPTION_REGISTRY = 0x00000002;
enum PIR_OPTION_MSSPEC = 0x00000004;
enum PIR_OPTION_REALMODE = 0x00000008;
enum PIR_OPTION_DEFAULT = 0x0000000f;
enum PIR_STATUS_ERROR = 0x00000000;
enum PIR_STATUS_ENABLED = 0x00000001;
enum PIR_STATUS_DISABLED = 0x00000002;
enum PIR_STATUS_MAX = 0x00000003;
enum PIR_STATUS_TABLE_REGISTRY = 0x00000000;
enum PIR_STATUS_TABLE_MSSPEC = 0x00000001;
enum PIR_STATUS_TABLE_REALMODE = 0x00000002;
enum PIR_STATUS_TABLE_NONE = 0x00000003;
enum PIR_STATUS_TABLE_ERROR = 0x00000004;
enum PIR_STATUS_TABLE_BAD = 0x00000005;
enum PIR_STATUS_TABLE_SUCCESS = 0x00000006;
enum PIR_STATUS_TABLE_MAX = 0x00000007;
enum PIR_STATUS_MINIPORT_NORMAL = 0x00000000;
enum PIR_STATUS_MINIPORT_COMPATIBLE = 0x00000001;
enum PIR_STATUS_MINIPORT_OVERRIDE = 0x00000002;
enum PIR_STATUS_MINIPORT_NONE = 0x00000003;
enum PIR_STATUS_MINIPORT_ERROR = 0x00000004;
enum PIR_STATUS_MINIPORT_NOKEY = 0x00000005;
enum PIR_STATUS_MINIPORT_SUCCESS = 0x00000006;
enum PIR_STATUS_MINIPORT_INVALID = 0x00000007;
enum PIR_STATUS_MINIPORT_MAX = 0x00000008;
enum REGSTR_PATH_LASTGOOD = "System\\LastKnownGoodRecovery\\LastGood";
enum REGSTR_PATH_LASTGOODTMP = "System\\LastKnownGoodRecovery\\LastGood.Tmp";
enum LASTGOOD_OPERATION = 0x000000ff;
enum LASTGOOD_OPERATION_NOPOSTPROC = 0x00000000;
enum LASTGOOD_OPERATION_DELETE = 0x00000001;
alias REG_VALUE_TYPE = uint;
enum : uint
{
    REG_NONE                       = 0x00000000,
    REG_SZ                         = 0x00000001,
    REG_EXPAND_SZ                  = 0x00000002,
    REG_BINARY                     = 0x00000003,
    REG_DWORD                      = 0x00000004,
    REG_DWORD_LITTLE_ENDIAN        = 0x00000004,
    REG_DWORD_BIG_ENDIAN           = 0x00000005,
    REG_LINK                       = 0x00000006,
    REG_MULTI_SZ                   = 0x00000007,
    REG_RESOURCE_LIST              = 0x00000008,
    REG_FULL_RESOURCE_DESCRIPTOR   = 0x00000009,
    REG_RESOURCE_REQUIREMENTS_LIST = 0x0000000a,
    REG_QWORD                      = 0x0000000b,
    REG_QWORD_LITTLE_ENDIAN        = 0x0000000b,
}

alias REG_SAM_FLAGS = uint;
enum : uint
{
    KEY_QUERY_VALUE        = 0x00000001,
    KEY_SET_VALUE          = 0x00000002,
    KEY_CREATE_SUB_KEY     = 0x00000004,
    KEY_ENUMERATE_SUB_KEYS = 0x00000008,
    KEY_NOTIFY             = 0x00000010,
    KEY_CREATE_LINK        = 0x00000020,
    KEY_WOW64_32KEY        = 0x00000200,
    KEY_WOW64_64KEY        = 0x00000100,
    KEY_WOW64_RES          = 0x00000300,
    KEY_READ               = 0x00020019,
    KEY_WRITE              = 0x00020006,
    KEY_EXECUTE            = 0x00020019,
    KEY_ALL_ACCESS         = 0x000f003f,
}

alias REG_OPEN_CREATE_OPTIONS = uint;
enum : uint
{
    REG_OPTION_RESERVED        = 0x00000000,
    REG_OPTION_NON_VOLATILE    = 0x00000000,
    REG_OPTION_VOLATILE        = 0x00000001,
    REG_OPTION_CREATE_LINK     = 0x00000002,
    REG_OPTION_BACKUP_RESTORE  = 0x00000004,
    REG_OPTION_OPEN_LINK       = 0x00000008,
    REG_OPTION_DONT_VIRTUALIZE = 0x00000010,
}

alias REG_CREATE_KEY_DISPOSITION = uint;
enum : uint
{
    REG_CREATED_NEW_KEY     = 0x00000001,
    REG_OPENED_EXISTING_KEY = 0x00000002,
}

alias REG_SAVE_FORMAT = uint;
enum : uint
{
    REG_STANDARD_FORMAT = 0x00000001,
    REG_LATEST_FORMAT   = 0x00000002,
    REG_NO_COMPRESSION  = 0x00000004,
}

alias REG_RESTORE_KEY_FLAGS = int;
enum : int
{
    REG_FORCE_RESTORE       = 0x00000008,
    REG_WHOLE_HIVE_VOLATILE = 0x00000001,
}

alias REG_NOTIFY_FILTER = uint;
enum : uint
{
    REG_NOTIFY_CHANGE_NAME       = 0x00000001,
    REG_NOTIFY_CHANGE_ATTRIBUTES = 0x00000002,
    REG_NOTIFY_CHANGE_LAST_SET   = 0x00000004,
    REG_NOTIFY_CHANGE_SECURITY   = 0x00000008,
    REG_NOTIFY_THREAD_AGNOSTIC   = 0x10000000,
}

alias REG_ROUTINE_FLAGS = uint;
enum : uint
{
    RRF_RT_DWORD          = 0x00000018,
    RRF_RT_QWORD          = 0x00000048,
    RRF_RT_REG_NONE       = 0x00000001,
    RRF_RT_REG_SZ         = 0x00000002,
    RRF_RT_REG_EXPAND_SZ  = 0x00000004,
    RRF_RT_REG_BINARY     = 0x00000008,
    RRF_RT_REG_DWORD      = 0x00000010,
    RRF_RT_REG_MULTI_SZ   = 0x00000020,
    RRF_RT_REG_QWORD      = 0x00000040,
    RRF_RT_ANY            = 0x0000ffff,
    RRF_SUBKEY_WOW6464KEY = 0x00010000,
    RRF_SUBKEY_WOW6432KEY = 0x00020000,
    RRF_WOW64_MASK        = 0x00030000,
    RRF_NOEXPAND          = 0x10000000,
    RRF_ZEROONFAILURE     = 0x20000000,
}

alias HKEY = void*;
struct val_context
{
    int valuelen;
    void* value_context;
    void* val_buff_ptr;
}
struct PVALUEA
{
    PSTR pv_valuename;
    int pv_valuelen;
    void* pv_value_context;
    uint pv_type;
}
struct PVALUEW
{
    PWSTR pv_valuename;
    int pv_valuelen;
    void* pv_value_context;
    uint pv_type;
}
alias PQUERYHANDLER = uint function(void*, val_context*, uint, void*, uint*, uint);
struct REG_PROVIDER
{
    PQUERYHANDLER pi_R0_1val;
    PQUERYHANDLER pi_R0_allvals;
    PQUERYHANDLER pi_R3_1val;
    PQUERYHANDLER pi_R3_allvals;
    uint pi_flags;
    void* pi_key_context;
}
struct VALENTA
{
    PSTR ve_valuename;
    uint ve_valuelen;
    ulong ve_valueptr;
    REG_VALUE_TYPE ve_type;
}
struct VALENTW
{
    PWSTR ve_valuename;
    uint ve_valuelen;
    ulong ve_valueptr;
    REG_VALUE_TYPE ve_type;
}
struct DSKTLSYSTEMTIME
{
    ushort wYear;
    ushort wMonth;
    ushort wDayOfWeek;
    ushort wDay;
    ushort wHour;
    ushort wMinute;
    ushort wSecond;
    ushort wMilliseconds;
    ushort wResult;
}
