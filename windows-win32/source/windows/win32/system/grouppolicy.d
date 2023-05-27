module windows.win32.system.grouppolicy;

import windows.win32.guid : GUID;
import windows.win32.foundation : BOOL, BSTR, CHAR, HANDLE, HRESULT, HWND, LPARAM, PSID, PSTR, PWSTR, SYSTEMTIME, VARIANT_BOOL;
import windows.win32.security : GENERIC_MAPPING, OBJECT_TYPE_LIST, PRIVILEGE_SET, PSECURITY_DESCRIPTOR;
import windows.win32.system.com : IDispatch, IUnknown, SAFEARRAY;
import windows.win32.system.ole : IEnumVARIANT;
import windows.win32.system.registry : HKEY;
import windows.win32.system.variant : VARIANT;
import windows.win32.system.wmi : IWbemClassObject, IWbemServices;
import windows.win32.ui.controls : HPROPSHEETPAGE;
import windows.win32.ui.shell : APPCATEGORYINFOLIST;

version (Windows):
extern (Windows):

BOOL RefreshPolicy(BOOL);
BOOL RefreshPolicyEx(BOOL, uint);
HANDLE EnterCriticalPolicySection(BOOL);
BOOL LeaveCriticalPolicySection(HANDLE);
BOOL RegisterGPNotification(HANDLE, BOOL);
BOOL UnregisterGPNotification(HANDLE);
BOOL GetGPOListA(HANDLE, const(char)*, const(char)*, const(char)*, uint, GROUP_POLICY_OBJECTA**);
BOOL GetGPOListW(HANDLE, const(wchar)*, const(wchar)*, const(wchar)*, uint, GROUP_POLICY_OBJECTW**);
BOOL FreeGPOListA(GROUP_POLICY_OBJECTA*);
BOOL FreeGPOListW(GROUP_POLICY_OBJECTW*);
uint GetAppliedGPOListA(uint, const(char)*, PSID, GUID*, GROUP_POLICY_OBJECTA**);
uint GetAppliedGPOListW(uint, const(wchar)*, PSID, GUID*, GROUP_POLICY_OBJECTW**);
uint ProcessGroupPolicyCompleted(GUID*, ulong, uint);
uint ProcessGroupPolicyCompletedEx(GUID*, ulong, uint, HRESULT);
HRESULT RsopAccessCheckByType(PSECURITY_DESCRIPTOR, PSID, void*, uint, OBJECT_TYPE_LIST*, uint, GENERIC_MAPPING*, PRIVILEGE_SET*, uint*, uint*, int*);
HRESULT RsopFileAccessCheck(PWSTR, void*, uint, uint*, int*);
HRESULT RsopSetPolicySettingStatus(uint, IWbemServices, IWbemClassObject, uint, POLICYSETTINGSTATUSINFO*);
HRESULT RsopResetPolicySettingStatus(uint, IWbemServices, IWbemClassObject);
uint GenerateGPNotification(BOOL, const(wchar)*, uint);
uint InstallApplication(INSTALLDATA*);
uint UninstallApplication(PWSTR, uint);
uint CommandLineFromMsiDescriptor(PWSTR, PWSTR, uint*);
uint GetManagedApplications(GUID*, uint, uint, uint*, MANAGEDAPPLICATION**);
uint GetLocalManagedApplications(BOOL, uint*, LOCALMANAGEDAPPLICATION**);
void GetLocalManagedApplicationData(PWSTR, PWSTR*, PWSTR*);
uint GetManagedApplicationCategories(uint, APPCATEGORYINFOLIST*);
HRESULT CreateGPOLink(PWSTR, PWSTR, BOOL);
HRESULT DeleteGPOLink(PWSTR, PWSTR);
HRESULT DeleteAllGPOLinks(PWSTR);
HRESULT BrowseForGPO(GPOBROWSEINFO*);
HRESULT ImportRSoPData(PWSTR, PWSTR);
HRESULT ExportRSoPData(PWSTR, PWSTR);
enum GPM_USE_PDC = 0x00000000;
enum GPM_USE_ANYDC = 0x00000001;
enum GPM_DONOTUSE_W2KDC = 0x00000002;
enum GPM_DONOT_VALIDATEDC = 0x00000001;
enum GPM_MIGRATIONTABLE_ONLY = 0x00000001;
enum GPM_PROCESS_SECURITY = 0x00000002;
enum RSOP_NO_COMPUTER = 0x00010000;
enum RSOP_NO_USER = 0x00020000;
enum RSOP_PLANNING_ASSUME_SLOW_LINK = 0x00000001;
enum RSOP_PLANNING_ASSUME_LOOPBACK_MERGE = 0x00000002;
enum RSOP_PLANNING_ASSUME_LOOPBACK_REPLACE = 0x00000004;
enum RSOP_PLANNING_ASSUME_USER_WQLFILTER_TRUE = 0x00000008;
enum RSOP_PLANNING_ASSUME_COMP_WQLFILTER_TRUE = 0x00000010;
enum PI_NOUI = 0x00000001;
enum PI_APPLYPOLICY = 0x00000002;
enum PT_TEMPORARY = 0x00000001;
enum PT_ROAMING = 0x00000002;
enum PT_MANDATORY = 0x00000004;
enum PT_ROAMING_PREEXISTING = 0x00000008;
enum RP_FORCE = 0x00000001;
enum RP_SYNC = 0x00000002;
enum GPC_BLOCK_POLICY = 0x00000001;
enum GPO_FLAG_DISABLE = 0x00000001;
enum GPO_FLAG_FORCE = 0x00000002;
enum GPO_LIST_FLAG_MACHINE = 0x00000001;
enum GPO_LIST_FLAG_SITEONLY = 0x00000002;
enum GPO_LIST_FLAG_NO_WMIFILTERS = 0x00000004;
enum GPO_LIST_FLAG_NO_SECURITYFILTERS = 0x00000008;
enum GP_DLLNAME = "DllName";
enum GP_ENABLEASYNCHRONOUSPROCESSING = "EnableAsynchronousProcessing";
enum GP_MAXNOGPOLISTCHANGESINTERVAL = "MaxNoGPOListChangesInterval";
enum GP_NOBACKGROUNDPOLICY = "NoBackgroundPolicy";
enum GP_NOGPOLISTCHANGES = "NoGPOListChanges";
enum GP_NOMACHINEPOLICY = "NoMachinePolicy";
enum GP_NOSLOWLINK = "NoSlowLink";
enum GP_NOTIFYLINKTRANSITION = "NotifyLinkTransition";
enum GP_NOUSERPOLICY = "NoUserPolicy";
enum GP_PERUSERLOCALSETTINGS = "PerUserLocalSettings";
enum GP_PROCESSGROUPPOLICY = "ProcessGroupPolicy";
enum GP_REQUIRESSUCCESSFULREGISTRY = "RequiresSuccessfulRegistry";
enum GPO_INFO_FLAG_MACHINE = 0x00000001;
enum GPO_INFO_FLAG_BACKGROUND = 0x00000010;
enum GPO_INFO_FLAG_SLOWLINK = 0x00000020;
enum GPO_INFO_FLAG_VERBOSE = 0x00000040;
enum GPO_INFO_FLAG_NOCHANGES = 0x00000080;
enum GPO_INFO_FLAG_LINKTRANSITION = 0x00000100;
enum GPO_INFO_FLAG_LOGRSOP_TRANSITION = 0x00000200;
enum GPO_INFO_FLAG_FORCED_REFRESH = 0x00000400;
enum GPO_INFO_FLAG_SAFEMODE_BOOT = 0x00000800;
enum GPO_INFO_FLAG_ASYNC_FOREGROUND = 0x00001000;
enum FLAG_NO_GPO_FILTER = 0x80000000;
enum FLAG_NO_CSE_INVOKE = 0x40000000;
enum FLAG_ASSUME_SLOW_LINK = 0x20000000;
enum FLAG_LOOPBACK_MERGE = 0x10000000;
enum FLAG_LOOPBACK_REPLACE = 0x08000000;
enum FLAG_ASSUME_USER_WQLFILTER_TRUE = 0x04000000;
enum FLAG_ASSUME_COMP_WQLFILTER_TRUE = 0x02000000;
enum FLAG_PLANNING_MODE = 0x01000000;
enum FLAG_NO_USER = 0x00000001;
enum FLAG_NO_COMPUTER = 0x00000002;
enum FLAG_FORCE_CREATENAMESPACE = 0x00000004;
enum RSOP_USER_ACCESS_DENIED = 0x00000001;
enum RSOP_COMPUTER_ACCESS_DENIED = 0x00000002;
enum RSOP_TEMPNAMESPACE_EXISTS = 0x00000004;
enum LOCALSTATE_ASSIGNED = 0x00000001;
enum LOCALSTATE_PUBLISHED = 0x00000002;
enum LOCALSTATE_UNINSTALL_UNMANAGED = 0x00000004;
enum LOCALSTATE_POLICYREMOVE_ORPHAN = 0x00000008;
enum LOCALSTATE_POLICYREMOVE_UNINSTALL = 0x00000010;
enum LOCALSTATE_ORPHANED = 0x00000020;
enum LOCALSTATE_UNINSTALLED = 0x00000040;
enum MANAGED_APPS_USERAPPLICATIONS = 0x00000001;
enum MANAGED_APPS_FROMCATEGORY = 0x00000002;
enum MANAGED_APPS_INFOLEVEL_DEFAULT = 0x00010000;
enum MANAGED_APPTYPE_WINDOWSINSTALLER = 0x00000001;
enum MANAGED_APPTYPE_SETUPEXE = 0x00000002;
enum MANAGED_APPTYPE_UNSUPPORTED = 0x00000003;
enum CLSID_GPESnapIn = GUID(0x8fc0b734, 0xa0e1, 0x11d1, [0xa7, 0xd3, 0x0, 0x0, 0xf8, 0x75, 0x71, 0xe3]);
enum NODEID_Machine = GUID(0x8fc0b737, 0xa0e1, 0x11d1, [0xa7, 0xd3, 0x0, 0x0, 0xf8, 0x75, 0x71, 0xe3]);
enum NODEID_MachineSWSettings = GUID(0x8fc0b73a, 0xa0e1, 0x11d1, [0xa7, 0xd3, 0x0, 0x0, 0xf8, 0x75, 0x71, 0xe3]);
enum NODEID_User = GUID(0x8fc0b738, 0xa0e1, 0x11d1, [0xa7, 0xd3, 0x0, 0x0, 0xf8, 0x75, 0x71, 0xe3]);
enum NODEID_UserSWSettings = GUID(0x8fc0b73c, 0xa0e1, 0x11d1, [0xa7, 0xd3, 0x0, 0x0, 0xf8, 0x75, 0x71, 0xe3]);
enum CLSID_GroupPolicyObject = GUID(0xea502722, 0xa23d, 0x11d1, [0xa7, 0xd3, 0x0, 0x0, 0xf8, 0x75, 0x71, 0xe3]);
enum CLSID_RSOPSnapIn = GUID(0x6dc3804b, 0x7212, 0x458d, [0xad, 0xb0, 0x9a, 0x7, 0xe2, 0xae, 0x1f, 0xa2]);
enum NODEID_RSOPMachine = GUID(0xbd4c1a2e, 0xb7a, 0x4a62, [0xa6, 0xb0, 0xc0, 0x57, 0x75, 0x39, 0xc9, 0x7e]);
enum NODEID_RSOPMachineSWSettings = GUID(0x6a76273e, 0xeb8e, 0x45db, [0x94, 0xc5, 0x25, 0x66, 0x3a, 0x5f, 0x2c, 0x1a]);
enum NODEID_RSOPUser = GUID(0xab87364f, 0xcec, 0x4cd8, [0x9b, 0xf8, 0x89, 0x8f, 0x34, 0x62, 0x8f, 0xb8]);
enum NODEID_RSOPUserSWSettings = GUID(0xe52c5ce3, 0xfd27, 0x4402, [0x84, 0xde, 0xd9, 0xa5, 0xf2, 0x85, 0x89, 0x10]);
enum GPO_SECTION_ROOT = 0x00000000;
enum GPO_SECTION_USER = 0x00000001;
enum GPO_SECTION_MACHINE = 0x00000002;
enum GPO_OPEN_LOAD_REGISTRY = 0x00000001;
enum GPO_OPEN_READ_ONLY = 0x00000002;
enum GPO_OPTION_DISABLE_USER = 0x00000001;
enum GPO_OPTION_DISABLE_MACHINE = 0x00000002;
enum RSOP_INFO_FLAG_DIAGNOSTIC_MODE = 0x00000001;
enum GPO_BROWSE_DISABLENEW = 0x00000001;
enum GPO_BROWSE_NOCOMPUTERS = 0x00000002;
enum GPO_BROWSE_NODSGPOS = 0x00000004;
enum GPO_BROWSE_OPENBUTTON = 0x00000008;
enum GPO_BROWSE_INITTOALL = 0x00000010;
enum GPO_BROWSE_NOUSERGPOS = 0x00000020;
enum GPO_BROWSE_SENDAPPLYONEDIT = 0x00000040;
alias GPMRSOPMode = int;
enum : int
{
    rsopUnknown  = 0x00000000,
    rsopPlanning = 0x00000001,
    rsopLogging  = 0x00000002,
}

alias GPMPermissionType = int;
enum : int
{
    permGPOApply                 = 0x00010000,
    permGPORead                  = 0x00010100,
    permGPOEdit                  = 0x00010101,
    permGPOEditSecurityAndDelete = 0x00010102,
    permGPOCustom                = 0x00010103,
    permWMIFilterEdit            = 0x00020000,
    permWMIFilterFullControl     = 0x00020001,
    permWMIFilterCustom          = 0x00020002,
    permSOMLink                  = 0x001c0000,
    permSOMLogging               = 0x00180100,
    permSOMPlanning              = 0x00180200,
    permSOMWMICreate             = 0x00100300,
    permSOMWMIFullControl        = 0x00100301,
    permSOMGPOCreate             = 0x00100400,
    permStarterGPORead           = 0x00030500,
    permStarterGPOEdit           = 0x00030501,
    permStarterGPOFullControl    = 0x00030502,
    permStarterGPOCustom         = 0x00030503,
    permSOMStarterGPOCreate      = 0x00100500,
}

alias GPMSearchProperty = int;
enum : int
{
    gpoPermissions                 = 0x00000000,
    gpoEffectivePermissions        = 0x00000001,
    gpoDisplayName                 = 0x00000002,
    gpoWMIFilter                   = 0x00000003,
    gpoID                          = 0x00000004,
    gpoComputerExtensions          = 0x00000005,
    gpoUserExtensions              = 0x00000006,
    somLinks                       = 0x00000007,
    gpoDomain                      = 0x00000008,
    backupMostRecent               = 0x00000009,
    starterGPOPermissions          = 0x0000000a,
    starterGPOEffectivePermissions = 0x0000000b,
    starterGPODisplayName          = 0x0000000c,
    starterGPOID                   = 0x0000000d,
    starterGPODomain               = 0x0000000e,
}

alias GPMSearchOperation = int;
enum : int
{
    opEquals      = 0x00000000,
    opContains    = 0x00000001,
    opNotContains = 0x00000002,
    opNotEquals   = 0x00000003,
}

alias GPMReportType = int;
enum : int
{
    repXML                    = 0x00000000,
    repHTML                   = 0x00000001,
    repInfraXML               = 0x00000002,
    repInfraRefreshXML        = 0x00000003,
    repClientHealthXML        = 0x00000004,
    repClientHealthRefreshXML = 0x00000005,
}

alias GPMEntryType = int;
enum : int
{
    typeUser           = 0x00000000,
    typeComputer       = 0x00000001,
    typeLocalGroup     = 0x00000002,
    typeGlobalGroup    = 0x00000003,
    typeUniversalGroup = 0x00000004,
    typeUNCPath        = 0x00000005,
    typeUnknown        = 0x00000006,
}

alias GPMDestinationOption = int;
enum : int
{
    opDestinationSameAsSource   = 0x00000000,
    opDestinationNone           = 0x00000001,
    opDestinationByRelativeName = 0x00000002,
    opDestinationSet            = 0x00000003,
}

alias GPMReportingOptions = int;
enum : int
{
    opReportLegacy   = 0x00000000,
    opReportComments = 0x00000001,
}

enum IID_IGPM = GUID(0xf5fae809, 0x3bd6, 0x4da9, [0xa6, 0x5e, 0x17, 0x66, 0x5b, 0x41, 0xd7, 0x63]);
interface IGPM : IDispatch
{
    HRESULT GetDomain(BSTR, BSTR, int, IGPMDomain*);
    HRESULT GetBackupDir(BSTR, IGPMBackupDir*);
    HRESULT GetSitesContainer(BSTR, BSTR, BSTR, int, IGPMSitesContainer*);
    HRESULT GetRSOP(GPMRSOPMode, BSTR, int, IGPMRSOP*);
    HRESULT CreatePermission(BSTR, GPMPermissionType, VARIANT_BOOL, IGPMPermission*);
    HRESULT CreateSearchCriteria(IGPMSearchCriteria*);
    HRESULT CreateTrustee(BSTR, IGPMTrustee*);
    HRESULT GetClientSideExtensions(IGPMCSECollection*);
    HRESULT GetConstants(IGPMConstants*);
    HRESULT GetMigrationTable(BSTR, IGPMMigrationTable*);
    HRESULT CreateMigrationTable(IGPMMigrationTable*);
    HRESULT InitializeReporting(BSTR);
}
enum IID_IGPMDomain = GUID(0x6b21cc14, 0x5a00, 0x4f44, [0xa7, 0x38, 0xfe, 0xec, 0x8a, 0x94, 0xc7, 0xe3]);
interface IGPMDomain : IDispatch
{
    HRESULT get_DomainController(BSTR*);
    HRESULT get_Domain(BSTR*);
    HRESULT CreateGPO(IGPMGPO*);
    HRESULT GetGPO(BSTR, IGPMGPO*);
    HRESULT SearchGPOs(IGPMSearchCriteria, IGPMGPOCollection*);
    HRESULT RestoreGPO(IGPMBackup, int, VARIANT*, VARIANT*, IGPMResult*);
    HRESULT GetSOM(BSTR, IGPMSOM*);
    HRESULT SearchSOMs(IGPMSearchCriteria, IGPMSOMCollection*);
    HRESULT GetWMIFilter(BSTR, IGPMWMIFilter*);
    HRESULT SearchWMIFilters(IGPMSearchCriteria, IGPMWMIFilterCollection*);
}
enum IID_IGPMBackupDir = GUID(0xb1568bed, 0xa93, 0x4acc, [0x81, 0xf, 0xaf, 0xe7, 0x8, 0x10, 0x19, 0xb9]);
interface IGPMBackupDir : IDispatch
{
    HRESULT get_BackupDirectory(BSTR*);
    HRESULT GetBackup(BSTR, IGPMBackup*);
    HRESULT SearchBackups(IGPMSearchCriteria, IGPMBackupCollection*);
}
enum IID_IGPMSitesContainer = GUID(0x4725a899, 0x2782, 0x4d27, [0xa6, 0xbb, 0xd4, 0x99, 0x24, 0x6f, 0xfd, 0x72]);
interface IGPMSitesContainer : IDispatch
{
    HRESULT get_DomainController(BSTR*);
    HRESULT get_Domain(BSTR*);
    HRESULT get_Forest(BSTR*);
    HRESULT GetSite(BSTR, IGPMSOM*);
    HRESULT SearchSites(IGPMSearchCriteria, IGPMSOMCollection*);
}
enum IID_IGPMSearchCriteria = GUID(0xd6f11c42, 0x829b, 0x48d4, [0x83, 0xf5, 0x36, 0x15, 0xb6, 0x7d, 0xfc, 0x22]);
interface IGPMSearchCriteria : IDispatch
{
    HRESULT Add(GPMSearchProperty, GPMSearchOperation, VARIANT);
}
enum IID_IGPMTrustee = GUID(0x3b466da8, 0xc1a4, 0x4b2a, [0x99, 0x9a, 0xbe, 0xfc, 0xdd, 0x56, 0xce, 0xfb]);
interface IGPMTrustee : IDispatch
{
    HRESULT get_TrusteeSid(BSTR*);
    HRESULT get_TrusteeName(BSTR*);
    HRESULT get_TrusteeDomain(BSTR*);
    HRESULT get_TrusteeDSPath(BSTR*);
    HRESULT get_TrusteeType(int*);
}
enum IID_IGPMPermission = GUID(0x35ebca40, 0xe1a1, 0x4a02, [0x89, 0x5, 0xd7, 0x94, 0x16, 0xfb, 0x46, 0x4a]);
interface IGPMPermission : IDispatch
{
    HRESULT get_Inherited(VARIANT_BOOL*);
    HRESULT get_Inheritable(VARIANT_BOOL*);
    HRESULT get_Denied(VARIANT_BOOL*);
    HRESULT get_Permission(GPMPermissionType*);
    HRESULT get_Trustee(IGPMTrustee*);
}
enum IID_IGPMSecurityInfo = GUID(0xb6c31ed4, 0x1c93, 0x4d3e, [0xae, 0x84, 0xeb, 0x6d, 0x61, 0x16, 0x1b, 0x60]);
interface IGPMSecurityInfo : IDispatch
{
    HRESULT get_Count(int*);
    HRESULT get_Item(int, VARIANT*);
    HRESULT get__NewEnum(IEnumVARIANT*);
    HRESULT Add(IGPMPermission);
    HRESULT Remove(IGPMPermission);
    HRESULT RemoveTrustee(BSTR);
}
enum IID_IGPMBackup = GUID(0xd8a16a35, 0x3b0d, 0x416b, [0x8d, 0x2, 0x4d, 0xf6, 0xf9, 0x5a, 0x71, 0x19]);
interface IGPMBackup : IDispatch
{
    HRESULT get_ID(BSTR*);
    HRESULT get_GPOID(BSTR*);
    HRESULT get_GPODomain(BSTR*);
    HRESULT get_GPODisplayName(BSTR*);
    HRESULT get_Timestamp(double*);
    HRESULT get_Comment(BSTR*);
    HRESULT get_BackupDir(BSTR*);
    HRESULT Delete();
    HRESULT GenerateReport(GPMReportType, VARIANT*, VARIANT*, IGPMResult*);
    HRESULT GenerateReportToFile(GPMReportType, BSTR, IGPMResult*);
}
enum IID_IGPMBackupCollection = GUID(0xc786fc0f, 0x26d8, 0x4bab, [0xa7, 0x45, 0x39, 0xca, 0x7e, 0x80, 0xc, 0xac]);
interface IGPMBackupCollection : IDispatch
{
    HRESULT get_Count(int*);
    HRESULT get_Item(int, VARIANT*);
    HRESULT get__NewEnum(IEnumVARIANT*);
}
alias GPMSOMType = int;
enum : int
{
    somSite   = 0x00000000,
    somDomain = 0x00000001,
    somOU     = 0x00000002,
}

enum IID_IGPMSOM = GUID(0xc0a7f09e, 0x5a1, 0x4f0c, [0x81, 0x58, 0x9e, 0x5c, 0x33, 0x68, 0x4f, 0x6b]);
interface IGPMSOM : IDispatch
{
    HRESULT get_GPOInheritanceBlocked(VARIANT_BOOL*);
    HRESULT put_GPOInheritanceBlocked(VARIANT_BOOL);
    HRESULT get_Name(BSTR*);
    HRESULT get_Path(BSTR*);
    HRESULT CreateGPOLink(int, IGPMGPO, IGPMGPOLink*);
    HRESULT get_Type(GPMSOMType*);
    HRESULT GetGPOLinks(IGPMGPOLinksCollection*);
    HRESULT GetInheritedGPOLinks(IGPMGPOLinksCollection*);
    HRESULT GetSecurityInfo(IGPMSecurityInfo*);
    HRESULT SetSecurityInfo(IGPMSecurityInfo);
}
enum IID_IGPMSOMCollection = GUID(0xadc1688e, 0xe4, 0x4495, [0xab, 0xba, 0xbe, 0xd2, 0x0, 0xdf, 0xc, 0xab]);
interface IGPMSOMCollection : IDispatch
{
    HRESULT get_Count(int*);
    HRESULT get_Item(int, VARIANT*);
    HRESULT get__NewEnum(IEnumVARIANT*);
}
enum IID_IGPMWMIFilter = GUID(0xef2ff9b4, 0x3c27, 0x459a, [0xb9, 0x79, 0x3, 0x83, 0x5, 0xce, 0xc7, 0x5d]);
interface IGPMWMIFilter : IDispatch
{
    HRESULT get_Path(BSTR*);
    HRESULT put_Name(BSTR);
    HRESULT get_Name(BSTR*);
    HRESULT put_Description(BSTR);
    HRESULT get_Description(BSTR*);
    HRESULT GetQueryList(VARIANT*);
    HRESULT GetSecurityInfo(IGPMSecurityInfo*);
    HRESULT SetSecurityInfo(IGPMSecurityInfo);
}
enum IID_IGPMWMIFilterCollection = GUID(0x5782d582, 0x1a36, 0x4661, [0x8a, 0x94, 0xc3, 0xc3, 0x25, 0x51, 0x94, 0x5b]);
interface IGPMWMIFilterCollection : IDispatch
{
    HRESULT get_Count(int*);
    HRESULT get_Item(int, VARIANT*);
    HRESULT get__NewEnum(IEnumVARIANT*);
}
enum IID_IGPMRSOP = GUID(0x49ed785a, 0x3237, 0x4ff2, [0xb1, 0xf0, 0xfd, 0xf5, 0xa8, 0xd5, 0xa1, 0xee]);
interface IGPMRSOP : IDispatch
{
    HRESULT get_Mode(GPMRSOPMode*);
    HRESULT get_Namespace(BSTR*);
    HRESULT put_LoggingComputer(BSTR);
    HRESULT get_LoggingComputer(BSTR*);
    HRESULT put_LoggingUser(BSTR);
    HRESULT get_LoggingUser(BSTR*);
    HRESULT put_LoggingFlags(int);
    HRESULT get_LoggingFlags(int*);
    HRESULT put_PlanningFlags(int);
    HRESULT get_PlanningFlags(int*);
    HRESULT put_PlanningDomainController(BSTR);
    HRESULT get_PlanningDomainController(BSTR*);
    HRESULT put_PlanningSiteName(BSTR);
    HRESULT get_PlanningSiteName(BSTR*);
    HRESULT put_PlanningUser(BSTR);
    HRESULT get_PlanningUser(BSTR*);
    HRESULT put_PlanningUserSOM(BSTR);
    HRESULT get_PlanningUserSOM(BSTR*);
    HRESULT put_PlanningUserWMIFilters(VARIANT);
    HRESULT get_PlanningUserWMIFilters(VARIANT*);
    HRESULT put_PlanningUserSecurityGroups(VARIANT);
    HRESULT get_PlanningUserSecurityGroups(VARIANT*);
    HRESULT put_PlanningComputer(BSTR);
    HRESULT get_PlanningComputer(BSTR*);
    HRESULT put_PlanningComputerSOM(BSTR);
    HRESULT get_PlanningComputerSOM(BSTR*);
    HRESULT put_PlanningComputerWMIFilters(VARIANT);
    HRESULT get_PlanningComputerWMIFilters(VARIANT*);
    HRESULT put_PlanningComputerSecurityGroups(VARIANT);
    HRESULT get_PlanningComputerSecurityGroups(VARIANT*);
    HRESULT LoggingEnumerateUsers(VARIANT*);
    HRESULT CreateQueryResults();
    HRESULT ReleaseQueryResults();
    HRESULT GenerateReport(GPMReportType, VARIANT*, VARIANT*, IGPMResult*);
    HRESULT GenerateReportToFile(GPMReportType, BSTR, IGPMResult*);
}
enum IID_IGPMGPO = GUID(0x58cc4352, 0x1ca3, 0x48e5, [0x98, 0x64, 0x1d, 0xa4, 0xd6, 0xe0, 0xd6, 0xf]);
interface IGPMGPO : IDispatch
{
    HRESULT get_DisplayName(BSTR*);
    HRESULT put_DisplayName(BSTR);
    HRESULT get_Path(BSTR*);
    HRESULT get_ID(BSTR*);
    HRESULT get_DomainName(BSTR*);
    HRESULT get_CreationTime(double*);
    HRESULT get_ModificationTime(double*);
    HRESULT get_UserDSVersionNumber(int*);
    HRESULT get_ComputerDSVersionNumber(int*);
    HRESULT get_UserSysvolVersionNumber(int*);
    HRESULT get_ComputerSysvolVersionNumber(int*);
    HRESULT GetWMIFilter(IGPMWMIFilter*);
    HRESULT SetWMIFilter(IGPMWMIFilter);
    HRESULT SetUserEnabled(VARIANT_BOOL);
    HRESULT SetComputerEnabled(VARIANT_BOOL);
    HRESULT IsUserEnabled(VARIANT_BOOL*);
    HRESULT IsComputerEnabled(VARIANT_BOOL*);
    HRESULT GetSecurityInfo(IGPMSecurityInfo*);
    HRESULT SetSecurityInfo(IGPMSecurityInfo);
    HRESULT Delete();
    HRESULT Backup(BSTR, BSTR, VARIANT*, VARIANT*, IGPMResult*);
    HRESULT Import(int, IGPMBackup, VARIANT*, VARIANT*, VARIANT*, IGPMResult*);
    HRESULT GenerateReport(GPMReportType, VARIANT*, VARIANT*, IGPMResult*);
    HRESULT GenerateReportToFile(GPMReportType, BSTR, IGPMResult*);
    HRESULT CopyTo(int, IGPMDomain, VARIANT*, VARIANT*, VARIANT*, VARIANT*, IGPMResult*);
    HRESULT SetSecurityDescriptor(int, IDispatch);
    HRESULT GetSecurityDescriptor(int, IDispatch*);
    HRESULT IsACLConsistent(VARIANT_BOOL*);
    HRESULT MakeACLConsistent();
}
enum IID_IGPMGPOCollection = GUID(0xf0f0d5cf, 0x70ca, 0x4c39, [0x9e, 0x29, 0xb6, 0x42, 0xf8, 0x72, 0x6c, 0x1]);
interface IGPMGPOCollection : IDispatch
{
    HRESULT get_Count(int*);
    HRESULT get_Item(int, VARIANT*);
    HRESULT get__NewEnum(IEnumVARIANT*);
}
enum IID_IGPMGPOLink = GUID(0x434b99bd, 0x5de7, 0x478a, [0x80, 0x9c, 0xc2, 0x51, 0x72, 0x1d, 0xf7, 0xc]);
interface IGPMGPOLink : IDispatch
{
    HRESULT get_GPOID(BSTR*);
    HRESULT get_GPODomain(BSTR*);
    HRESULT get_Enabled(VARIANT_BOOL*);
    HRESULT put_Enabled(VARIANT_BOOL);
    HRESULT get_Enforced(VARIANT_BOOL*);
    HRESULT put_Enforced(VARIANT_BOOL);
    HRESULT get_SOMLinkOrder(int*);
    HRESULT get_SOM(IGPMSOM*);
    HRESULT Delete();
}
enum IID_IGPMGPOLinksCollection = GUID(0x189d7b68, 0x16bd, 0x4d0d, [0xa2, 0xec, 0x2e, 0x6a, 0xa2, 0x28, 0x8c, 0x7f]);
interface IGPMGPOLinksCollection : IDispatch
{
    HRESULT get_Count(int*);
    HRESULT get_Item(int, VARIANT*);
    HRESULT get__NewEnum(IEnumVARIANT*);
}
enum IID_IGPMCSECollection = GUID(0x2e52a97d, 0xa4a, 0x4a6f, [0x85, 0xdb, 0x20, 0x16, 0x22, 0x45, 0x5d, 0xa0]);
interface IGPMCSECollection : IDispatch
{
    HRESULT get_Count(int*);
    HRESULT get_Item(int, VARIANT*);
    HRESULT get__NewEnum(IEnumVARIANT*);
}
enum IID_IGPMClientSideExtension = GUID(0x69da7488, 0xb8db, 0x415e, [0x92, 0x66, 0x90, 0x1b, 0xe4, 0xd4, 0x99, 0x28]);
interface IGPMClientSideExtension : IDispatch
{
    HRESULT get_ID(BSTR*);
    HRESULT get_DisplayName(BSTR*);
    HRESULT IsUserEnabled(VARIANT_BOOL*);
    HRESULT IsComputerEnabled(VARIANT_BOOL*);
}
enum IID_IGPMAsyncCancel = GUID(0xddc67754, 0xbe67, 0x4541, [0x81, 0x66, 0xf4, 0x81, 0x66, 0x86, 0x8c, 0x9c]);
interface IGPMAsyncCancel : IDispatch
{
    HRESULT Cancel();
}
enum IID_IGPMAsyncProgress = GUID(0x6aac29f8, 0x5948, 0x4324, [0xbf, 0x70, 0x42, 0x38, 0x18, 0x94, 0x2d, 0xbc]);
interface IGPMAsyncProgress : IDispatch
{
    HRESULT Status(int, int, HRESULT, VARIANT*, IGPMStatusMsgCollection);
}
enum IID_IGPMStatusMsgCollection = GUID(0x9b6e1af0, 0x1a92, 0x40f3, [0xa5, 0x9d, 0xf3, 0x6a, 0xc1, 0xf7, 0x28, 0xb7]);
interface IGPMStatusMsgCollection : IDispatch
{
    HRESULT get_Count(int*);
    HRESULT get_Item(int, VARIANT*);
    HRESULT get__NewEnum(IEnumVARIANT*);
}
enum IID_IGPMStatusMessage = GUID(0x8496c22f, 0xf3de, 0x4a1f, [0x8f, 0x58, 0x60, 0x3c, 0xaa, 0xa9, 0x3d, 0x7b]);
interface IGPMStatusMessage : IDispatch
{
    HRESULT get_ObjectPath(BSTR*);
    HRESULT ErrorCode();
    HRESULT get_ExtensionName(BSTR*);
    HRESULT get_SettingsName(BSTR*);
    HRESULT OperationCode();
    HRESULT get_Message(BSTR*);
}
enum IID_IGPMConstants = GUID(0x50ef73e6, 0xd35c, 0x4c8d, [0xbe, 0x63, 0x7e, 0xa5, 0xd2, 0xaa, 0xc5, 0xc4]);
interface IGPMConstants : IDispatch
{
    HRESULT get_PermGPOApply(GPMPermissionType*);
    HRESULT get_PermGPORead(GPMPermissionType*);
    HRESULT get_PermGPOEdit(GPMPermissionType*);
    HRESULT get_PermGPOEditSecurityAndDelete(GPMPermissionType*);
    HRESULT get_PermGPOCustom(GPMPermissionType*);
    HRESULT get_PermWMIFilterEdit(GPMPermissionType*);
    HRESULT get_PermWMIFilterFullControl(GPMPermissionType*);
    HRESULT get_PermWMIFilterCustom(GPMPermissionType*);
    HRESULT get_PermSOMLink(GPMPermissionType*);
    HRESULT get_PermSOMLogging(GPMPermissionType*);
    HRESULT get_PermSOMPlanning(GPMPermissionType*);
    HRESULT get_PermSOMGPOCreate(GPMPermissionType*);
    HRESULT get_PermSOMWMICreate(GPMPermissionType*);
    HRESULT get_PermSOMWMIFullControl(GPMPermissionType*);
    HRESULT get_SearchPropertyGPOPermissions(GPMSearchProperty*);
    HRESULT get_SearchPropertyGPOEffectivePermissions(GPMSearchProperty*);
    HRESULT get_SearchPropertyGPODisplayName(GPMSearchProperty*);
    HRESULT get_SearchPropertyGPOWMIFilter(GPMSearchProperty*);
    HRESULT get_SearchPropertyGPOID(GPMSearchProperty*);
    HRESULT get_SearchPropertyGPOComputerExtensions(GPMSearchProperty*);
    HRESULT get_SearchPropertyGPOUserExtensions(GPMSearchProperty*);
    HRESULT get_SearchPropertySOMLinks(GPMSearchProperty*);
    HRESULT get_SearchPropertyGPODomain(GPMSearchProperty*);
    HRESULT get_SearchPropertyBackupMostRecent(GPMSearchProperty*);
    HRESULT get_SearchOpEquals(GPMSearchOperation*);
    HRESULT get_SearchOpContains(GPMSearchOperation*);
    HRESULT get_SearchOpNotContains(GPMSearchOperation*);
    HRESULT get_SearchOpNotEquals(GPMSearchOperation*);
    HRESULT get_UsePDC(int*);
    HRESULT get_UseAnyDC(int*);
    HRESULT get_DoNotUseW2KDC(int*);
    HRESULT get_SOMSite(GPMSOMType*);
    HRESULT get_SOMDomain(GPMSOMType*);
    HRESULT get_SOMOU(GPMSOMType*);
    HRESULT get_SecurityFlags(VARIANT_BOOL, VARIANT_BOOL, VARIANT_BOOL, VARIANT_BOOL, int*);
    HRESULT get_DoNotValidateDC(int*);
    HRESULT get_ReportHTML(GPMReportType*);
    HRESULT get_ReportXML(GPMReportType*);
    HRESULT get_RSOPModeUnknown(GPMRSOPMode*);
    HRESULT get_RSOPModePlanning(GPMRSOPMode*);
    HRESULT get_RSOPModeLogging(GPMRSOPMode*);
    HRESULT get_EntryTypeUser(GPMEntryType*);
    HRESULT get_EntryTypeComputer(GPMEntryType*);
    HRESULT get_EntryTypeLocalGroup(GPMEntryType*);
    HRESULT get_EntryTypeGlobalGroup(GPMEntryType*);
    HRESULT get_EntryTypeUniversalGroup(GPMEntryType*);
    HRESULT get_EntryTypeUNCPath(GPMEntryType*);
    HRESULT get_EntryTypeUnknown(GPMEntryType*);
    HRESULT get_DestinationOptionSameAsSource(GPMDestinationOption*);
    HRESULT get_DestinationOptionNone(GPMDestinationOption*);
    HRESULT get_DestinationOptionByRelativeName(GPMDestinationOption*);
    HRESULT get_DestinationOptionSet(GPMDestinationOption*);
    HRESULT get_MigrationTableOnly(int*);
    HRESULT get_ProcessSecurity(int*);
    HRESULT get_RsopLoggingNoComputer(int*);
    HRESULT get_RsopLoggingNoUser(int*);
    HRESULT get_RsopPlanningAssumeSlowLink(int*);
    HRESULT get_RsopPlanningLoopbackOption(VARIANT_BOOL, int*);
    HRESULT get_RsopPlanningAssumeUserWQLFilterTrue(int*);
    HRESULT get_RsopPlanningAssumeCompWQLFilterTrue(int*);
}
enum IID_IGPMResult = GUID(0x86dff7e9, 0xf76f, 0x42ab, [0x95, 0x70, 0xce, 0xbc, 0x6b, 0xe8, 0xa5, 0x2d]);
interface IGPMResult : IDispatch
{
    HRESULT get_Status(IGPMStatusMsgCollection*);
    HRESULT get_Result(VARIANT*);
    HRESULT OverallStatus();
}
enum IID_IGPMMapEntryCollection = GUID(0xbb0bf49b, 0xe53f, 0x443f, [0xb8, 0x7, 0x8b, 0xe2, 0x2b, 0xfb, 0x6d, 0x42]);
interface IGPMMapEntryCollection : IDispatch
{
    HRESULT get_Count(int*);
    HRESULT get_Item(int, VARIANT*);
    HRESULT get__NewEnum(IEnumVARIANT*);
}
enum IID_IGPMMapEntry = GUID(0x8e79ad06, 0x2381, 0x4444, [0xbe, 0x4c, 0xff, 0x69, 0x3e, 0x6e, 0x6f, 0x2b]);
interface IGPMMapEntry : IDispatch
{
    HRESULT get_Source(BSTR*);
    HRESULT get_Destination(BSTR*);
    HRESULT get_DestinationOption(GPMDestinationOption*);
    HRESULT get_EntryType(GPMEntryType*);
}
enum IID_IGPMMigrationTable = GUID(0x48f823b1, 0xefaf, 0x470b, [0xb6, 0xed, 0x40, 0xd1, 0x4e, 0xe1, 0xa4, 0xec]);
interface IGPMMigrationTable : IDispatch
{
    HRESULT Save(BSTR);
    HRESULT Add(int, VARIANT);
    HRESULT AddEntry(BSTR, GPMEntryType, VARIANT*, IGPMMapEntry*);
    HRESULT GetEntry(BSTR, IGPMMapEntry*);
    HRESULT DeleteEntry(BSTR);
    HRESULT UpdateDestination(BSTR, VARIANT*, IGPMMapEntry*);
    HRESULT Validate(IGPMResult*);
    HRESULT GetEntries(IGPMMapEntryCollection*);
}
alias GPMBackupType = int;
enum : int
{
    typeGPO        = 0x00000000,
    typeStarterGPO = 0x00000001,
}

alias GPMStarterGPOType = int;
enum : int
{
    typeSystem = 0x00000000,
    typeCustom = 0x00000001,
}

enum IID_IGPMBackupDirEx = GUID(0xf8dc55ed, 0x3ba0, 0x4864, [0xaa, 0xd4, 0xd3, 0x65, 0x18, 0x9e, 0xe1, 0xd5]);
interface IGPMBackupDirEx : IDispatch
{
    HRESULT get_BackupDir(BSTR*);
    HRESULT get_BackupType(GPMBackupType*);
    HRESULT GetBackup(BSTR, VARIANT*);
    HRESULT SearchBackups(IGPMSearchCriteria, VARIANT*);
}
enum IID_IGPMStarterGPOBackupCollection = GUID(0xc998031d, 0xadd0, 0x4bb5, [0x8d, 0xea, 0x29, 0x85, 0x5, 0xd8, 0x42, 0x3b]);
interface IGPMStarterGPOBackupCollection : IDispatch
{
    HRESULT get_Count(int*);
    HRESULT get_Item(int, VARIANT*);
    HRESULT get__NewEnum(IEnumVARIANT*);
}
enum IID_IGPMStarterGPOBackup = GUID(0x51d98eda, 0xa87e, 0x43dd, [0xb8, 0xa, 0xb, 0x66, 0xef, 0x19, 0x38, 0xd6]);
interface IGPMStarterGPOBackup : IDispatch
{
    HRESULT get_BackupDir(BSTR*);
    HRESULT get_Comment(BSTR*);
    HRESULT get_DisplayName(BSTR*);
    HRESULT get_Domain(BSTR*);
    HRESULT get_StarterGPOID(BSTR*);
    HRESULT get_ID(BSTR*);
    HRESULT get_Timestamp(double*);
    HRESULT get_Type(GPMStarterGPOType*);
    HRESULT Delete();
    HRESULT GenerateReport(GPMReportType, VARIANT*, VARIANT*, IGPMResult*);
    HRESULT GenerateReportToFile(GPMReportType, BSTR, IGPMResult*);
}
enum IID_IGPM2 = GUID(0x238f8a, 0x3d86, 0x41ac, [0x8f, 0x5e, 0x6, 0xa6, 0x63, 0x8a, 0x63, 0x4a]);
interface IGPM2 : IGPM
{
    HRESULT GetBackupDirEx(BSTR, GPMBackupType, IGPMBackupDirEx*);
    HRESULT InitializeReportingEx(BSTR, int);
}
enum IID_IGPMStarterGPO = GUID(0xdfc3f61b, 0x8880, 0x4490, [0x93, 0x37, 0xd2, 0x9c, 0x7b, 0xa8, 0xc2, 0xf0]);
interface IGPMStarterGPO : IDispatch
{
    HRESULT get_DisplayName(BSTR*);
    HRESULT put_DisplayName(BSTR);
    HRESULT get_Description(BSTR*);
    HRESULT put_Description(BSTR);
    HRESULT get_Author(BSTR*);
    HRESULT get_Product(BSTR*);
    HRESULT get_CreationTime(double*);
    HRESULT get_ID(BSTR*);
    HRESULT get_ModifiedTime(double*);
    HRESULT get_Type(GPMStarterGPOType*);
    HRESULT get_ComputerVersion(ushort*);
    HRESULT get_UserVersion(ushort*);
    HRESULT get_StarterGPOVersion(BSTR*);
    HRESULT Delete();
    HRESULT Save(BSTR, VARIANT_BOOL, VARIANT_BOOL, VARIANT*, VARIANT*, VARIANT*, VARIANT*, VARIANT*, VARIANT*, VARIANT*, IGPMResult*);
    HRESULT Backup(BSTR, BSTR, VARIANT*, VARIANT*, IGPMResult*);
    HRESULT CopyTo(VARIANT*, VARIANT*, VARIANT*, IGPMResult*);
    HRESULT GenerateReport(GPMReportType, VARIANT*, VARIANT*, IGPMResult*);
    HRESULT GenerateReportToFile(GPMReportType, BSTR, IGPMResult*);
    HRESULT GetSecurityInfo(IGPMSecurityInfo*);
    HRESULT SetSecurityInfo(IGPMSecurityInfo);
}
enum IID_IGPMStarterGPOCollection = GUID(0x2e522729, 0x2219, 0x44ad, [0x93, 0x3a, 0x64, 0xdf, 0xd6, 0x50, 0xc4, 0x23]);
interface IGPMStarterGPOCollection : IDispatch
{
    HRESULT get_Count(int*);
    HRESULT get_Item(int, VARIANT*);
    HRESULT get__NewEnum(IEnumVARIANT*);
}
enum IID_IGPMDomain2 = GUID(0x7ca6bb8b, 0xf1eb, 0x490a, [0x93, 0x8d, 0x3c, 0x4e, 0x51, 0xc7, 0x68, 0xe6]);
interface IGPMDomain2 : IGPMDomain
{
    HRESULT CreateStarterGPO(IGPMStarterGPO*);
    HRESULT CreateGPOFromStarterGPO(IGPMStarterGPO, IGPMGPO*);
    HRESULT GetStarterGPO(BSTR, IGPMStarterGPO*);
    HRESULT SearchStarterGPOs(IGPMSearchCriteria, IGPMStarterGPOCollection*);
    HRESULT LoadStarterGPO(BSTR, VARIANT_BOOL, VARIANT*, VARIANT*, IGPMResult*);
    HRESULT RestoreStarterGPO(IGPMStarterGPOBackup, VARIANT*, VARIANT*, IGPMResult*);
}
enum IID_IGPMConstants2 = GUID(0x5ae21b0, 0xac09, 0x4032, [0xa2, 0x6f, 0x9e, 0x7d, 0xa7, 0x86, 0xdc, 0x19]);
interface IGPMConstants2 : IGPMConstants
{
    HRESULT get_BackupTypeGPO(GPMBackupType*);
    HRESULT get_BackupTypeStarterGPO(GPMBackupType*);
    HRESULT get_StarterGPOTypeSystem(GPMStarterGPOType*);
    HRESULT get_StarterGPOTypeCustom(GPMStarterGPOType*);
    HRESULT get_SearchPropertyStarterGPOPermissions(GPMSearchProperty*);
    HRESULT get_SearchPropertyStarterGPOEffectivePermissions(GPMSearchProperty*);
    HRESULT get_SearchPropertyStarterGPODisplayName(GPMSearchProperty*);
    HRESULT get_SearchPropertyStarterGPOID(GPMSearchProperty*);
    HRESULT get_SearchPropertyStarterGPODomain(GPMSearchProperty*);
    HRESULT get_PermStarterGPORead(GPMPermissionType*);
    HRESULT get_PermStarterGPOEdit(GPMPermissionType*);
    HRESULT get_PermStarterGPOFullControl(GPMPermissionType*);
    HRESULT get_PermStarterGPOCustom(GPMPermissionType*);
    HRESULT get_ReportLegacy(GPMReportingOptions*);
    HRESULT get_ReportComments(GPMReportingOptions*);
}
enum IID_IGPMGPO2 = GUID(0x8a66a210, 0xb78b, 0x4d99, [0x88, 0xe2, 0xc3, 0x6, 0xa8, 0x17, 0xc9, 0x25]);
interface IGPMGPO2 : IGPMGPO
{
    HRESULT get_Description(BSTR*);
    HRESULT put_Description(BSTR);
}
enum IID_IGPMDomain3 = GUID(0x77fdfe, 0x88c7, 0x4acf, [0xa1, 0x1d, 0xd1, 0xa, 0x7c, 0x31, 0xa, 0x3]);
interface IGPMDomain3 : IGPMDomain2
{
    HRESULT GenerateReport(GPMReportType, VARIANT*, VARIANT*, IGPMResult*);
    HRESULT get_InfrastructureDC(BSTR*);
    HRESULT put_InfrastructureDC(BSTR);
    HRESULT put_InfrastructureFlags(uint);
}
enum IID_IGPMGPO3 = GUID(0x7cf123a1, 0xf94a, 0x4112, [0xbf, 0xae, 0x6a, 0xa1, 0xdb, 0x9c, 0xb2, 0x48]);
interface IGPMGPO3 : IGPMGPO2
{
    HRESULT get_InfrastructureDC(BSTR*);
    HRESULT put_InfrastructureDC(BSTR);
    HRESULT put_InfrastructureFlags(uint);
}
enum CLSID_GPM = GUID(0xf5694708, 0x88fe, 0x4b35, [0xba, 0xbf, 0xe5, 0x61, 0x62, 0xd5, 0xfb, 0xc8]);
struct GPM
{
}
enum CLSID_GPMDomain = GUID(0x710901be, 0x1050, 0x4cb1, [0x83, 0x8a, 0xc5, 0xcf, 0xf2, 0x59, 0xe1, 0x83]);
struct GPMDomain
{
}
enum CLSID_GPMSitesContainer = GUID(0x229f5c42, 0x852c, 0x4b30, [0x94, 0x5f, 0xc5, 0x22, 0xbe, 0x9b, 0xd3, 0x86]);
struct GPMSitesContainer
{
}
enum CLSID_GPMBackupDir = GUID(0xfce4a59d, 0xf21, 0x4afa, [0xb8, 0x59, 0xe6, 0xd0, 0xc6, 0x2c, 0xd1, 0xc]);
struct GPMBackupDir
{
}
enum CLSID_GPMSOM = GUID(0x32d93fac, 0x450e, 0x44cf, [0x82, 0x9c, 0x8b, 0x22, 0xff, 0x6b, 0xda, 0xe1]);
struct GPMSOM
{
}
enum CLSID_GPMSearchCriteria = GUID(0x17aaca26, 0x5ce0, 0x44fa, [0x8c, 0xc0, 0x52, 0x59, 0xe6, 0x48, 0x35, 0x66]);
struct GPMSearchCriteria
{
}
enum CLSID_GPMPermission = GUID(0x5871a40a, 0xe9c0, 0x46ec, [0x91, 0x3e, 0x94, 0x4e, 0xf9, 0x22, 0x5a, 0x94]);
struct GPMPermission
{
}
enum CLSID_GPMSecurityInfo = GUID(0x547a5e8f, 0x9162, 0x4516, [0xa4, 0xdf, 0x9d, 0xdb, 0x96, 0x86, 0xd8, 0x46]);
struct GPMSecurityInfo
{
}
enum CLSID_GPMBackup = GUID(0xed1a54b8, 0x5efa, 0x482a, [0x93, 0xc0, 0x8a, 0xd8, 0x6f, 0xd, 0x68, 0xc3]);
struct GPMBackup
{
}
enum CLSID_GPMBackupCollection = GUID(0xeb8f035b, 0x70db, 0x4a9f, [0x96, 0x76, 0x37, 0xc2, 0x59, 0x94, 0xe9, 0xdc]);
struct GPMBackupCollection
{
}
enum CLSID_GPMSOMCollection = GUID(0x24c1f147, 0x3720, 0x4f5b, [0xa9, 0xc3, 0x6, 0xb4, 0xe4, 0xf9, 0x31, 0xd2]);
struct GPMSOMCollection
{
}
enum CLSID_GPMWMIFilter = GUID(0x626745d8, 0xdea, 0x4062, [0xbf, 0x60, 0xcf, 0xc5, 0xb1, 0xca, 0x12, 0x86]);
struct GPMWMIFilter
{
}
enum CLSID_GPMWMIFilterCollection = GUID(0x74dc6d28, 0xe820, 0x47d6, [0xa0, 0xb8, 0xf0, 0x8d, 0x93, 0xd7, 0xfa, 0x33]);
struct GPMWMIFilterCollection
{
}
enum CLSID_GPMRSOP = GUID(0x489b0caf, 0x9ec2, 0x4eb7, [0x91, 0xf5, 0xb6, 0xf7, 0x1d, 0x43, 0xda, 0x8c]);
struct GPMRSOP
{
}
enum CLSID_GPMGPO = GUID(0xd2ce2994, 0x59b5, 0x4064, [0xb5, 0x81, 0x4d, 0x68, 0x48, 0x6a, 0x16, 0xc4]);
struct GPMGPO
{
}
enum CLSID_GPMGPOCollection = GUID(0x7a057325, 0x832d, 0x4de3, [0xa4, 0x1f, 0xc7, 0x80, 0x43, 0x6a, 0x4e, 0x9]);
struct GPMGPOCollection
{
}
enum CLSID_GPMGPOLink = GUID(0xc1df9880, 0x5303, 0x42c6, [0x8a, 0x3c, 0x4, 0x88, 0xe1, 0xbf, 0x73, 0x64]);
struct GPMGPOLink
{
}
enum CLSID_GPMGPOLinksCollection = GUID(0xf6ed581a, 0x49a5, 0x47e2, [0xb7, 0x71, 0xfd, 0x8d, 0xc0, 0x2b, 0x62, 0x59]);
struct GPMGPOLinksCollection
{
}
enum CLSID_GPMAsyncCancel = GUID(0x372796a9, 0x76ec, 0x479d, [0xad, 0x6c, 0x55, 0x63, 0x18, 0xed, 0x5f, 0x9d]);
struct GPMAsyncCancel
{
}
enum CLSID_GPMStatusMsgCollection = GUID(0x2824e4be, 0x4bcc, 0x4cac, [0x9e, 0x60, 0xe, 0x3e, 0xd7, 0xf1, 0x24, 0x96]);
struct GPMStatusMsgCollection
{
}
enum CLSID_GPMStatusMessage = GUID(0x4b77cc94, 0xd255, 0x409b, [0xbc, 0x62, 0x37, 0x8, 0x81, 0x71, 0x5a, 0x19]);
struct GPMStatusMessage
{
}
enum CLSID_GPMTrustee = GUID(0xc54a700d, 0x19b6, 0x4211, [0xbc, 0xb0, 0xe8, 0xe2, 0x47, 0x5e, 0x47, 0x1e]);
struct GPMTrustee
{
}
enum CLSID_GPMClientSideExtension = GUID(0xc1a2e70e, 0x659c, 0x4b1a, [0x94, 0xb, 0xf8, 0x8b, 0xa, 0xf9, 0xc8, 0xa4]);
struct GPMClientSideExtension
{
}
enum CLSID_GPMCSECollection = GUID(0xcf92b828, 0x2d44, 0x4b61, [0xb1, 0xa, 0xb3, 0x27, 0xaf, 0xd4, 0x2d, 0xa8]);
struct GPMCSECollection
{
}
enum CLSID_GPMConstants = GUID(0x3855e880, 0xcd9e, 0x4d0c, [0x9e, 0xaf, 0x15, 0x79, 0x28, 0x3a, 0x18, 0x88]);
struct GPMConstants
{
}
enum CLSID_GPMResult = GUID(0x92101ac0, 0x9287, 0x4206, [0xa3, 0xb2, 0x4b, 0xdb, 0x73, 0xd2, 0x25, 0xf6]);
struct GPMResult
{
}
enum CLSID_GPMMapEntryCollection = GUID(0xcf75d5b, 0xa3a1, 0x4c55, [0xb4, 0xfe, 0x9e, 0x14, 0x9c, 0x41, 0xf6, 0x6d]);
struct GPMMapEntryCollection
{
}
enum CLSID_GPMMapEntry = GUID(0x8c975253, 0x5431, 0x4471, [0xb3, 0x5d, 0x6, 0x26, 0xc9, 0x28, 0x25, 0x8a]);
struct GPMMapEntry
{
}
enum CLSID_GPMMigrationTable = GUID(0x55af4043, 0x2a06, 0x4f72, [0xab, 0xef, 0x63, 0x1b, 0x44, 0x7, 0x9c, 0x76]);
struct GPMMigrationTable
{
}
enum CLSID_GPMBackupDirEx = GUID(0xe8c0988a, 0xcf03, 0x4c5b, [0x8b, 0xe2, 0x2a, 0xa9, 0xad, 0x32, 0xaa, 0xda]);
struct GPMBackupDirEx
{
}
enum CLSID_GPMStarterGPOBackupCollection = GUID(0xe75ea59d, 0x1aeb, 0x4cb5, [0xa7, 0x8a, 0x28, 0x1d, 0xaa, 0x58, 0x24, 0x6]);
struct GPMStarterGPOBackupCollection
{
}
enum CLSID_GPMStarterGPOBackup = GUID(0x389e400a, 0xd8ef, 0x455b, [0xa8, 0x61, 0x5f, 0x9c, 0xa3, 0x4a, 0x6a, 0x2]);
struct GPMStarterGPOBackup
{
}
enum CLSID_GPMTemplate = GUID(0xecf1d454, 0x71da, 0x4e2f, [0xa8, 0xc0, 0x81, 0x85, 0x46, 0x59, 0x11, 0xd9]);
struct GPMTemplate
{
}
enum CLSID_GPMStarterGPOCollection = GUID(0x82f8aa8b, 0x49ba, 0x43b2, [0x95, 0x6e, 0x33, 0x97, 0xf9, 0xb9, 0x4c, 0x3a]);
struct GPMStarterGPOCollection
{
}
alias GPO_LINK = int;
enum : int
{
    GPLinkUnknown            = 0x00000000,
    GPLinkMachine            = 0x00000001,
    GPLinkSite               = 0x00000002,
    GPLinkDomain             = 0x00000003,
    GPLinkOrganizationalUnit = 0x00000004,
}

struct GROUP_POLICY_OBJECTA
{
    uint dwOptions;
    uint dwVersion;
    PSTR lpDSPath;
    PSTR lpFileSysPath;
    PSTR lpDisplayName;
    CHAR[50] szGPOName;
    GPO_LINK GPOLink;
    LPARAM lParam;
    GROUP_POLICY_OBJECTA* pNext;
    GROUP_POLICY_OBJECTA* pPrev;
    PSTR lpExtensions;
    LPARAM lParam2;
    PSTR lpLink;
}
struct GROUP_POLICY_OBJECTW
{
    uint dwOptions;
    uint dwVersion;
    PWSTR lpDSPath;
    PWSTR lpFileSysPath;
    PWSTR lpDisplayName;
    wchar[50] szGPOName;
    GPO_LINK GPOLink;
    LPARAM lParam;
    GROUP_POLICY_OBJECTW* pNext;
    GROUP_POLICY_OBJECTW* pPrev;
    PWSTR lpExtensions;
    LPARAM lParam2;
    PWSTR lpLink;
}
alias PFNSTATUSMESSAGECALLBACK = uint function(BOOL, PWSTR);
alias PFNPROCESSGROUPPOLICY = uint function(uint, HANDLE, HKEY, GROUP_POLICY_OBJECTA*, GROUP_POLICY_OBJECTA*, ulong, BOOL*, PFNSTATUSMESSAGECALLBACK);
alias PFNPROCESSGROUPPOLICYEX = uint function(uint, HANDLE, HKEY, GROUP_POLICY_OBJECTA*, GROUP_POLICY_OBJECTA*, ulong, BOOL*, PFNSTATUSMESSAGECALLBACK, IWbemServices, HRESULT*);
struct RSOP_TARGET
{
    PWSTR pwszAccountName;
    PWSTR pwszNewSOM;
    SAFEARRAY* psaSecurityGroups;
    void* pRsopToken;
    GROUP_POLICY_OBJECTA* pGPOList;
    IWbemServices pWbemServices;
}
alias PFNGENERATEGROUPPOLICY = uint function(uint, BOOL*, PWSTR, RSOP_TARGET*, RSOP_TARGET*);
alias SETTINGSTATUS = int;
enum : int
{
    RSOPUnspecified      = 0x00000000,
    RSOPApplied          = 0x00000001,
    RSOPIgnored          = 0x00000002,
    RSOPFailed           = 0x00000003,
    RSOPSubsettingFailed = 0x00000004,
}

struct POLICYSETTINGSTATUSINFO
{
    PWSTR szKey;
    PWSTR szEventSource;
    PWSTR szEventLogName;
    uint dwEventID;
    uint dwErrorCode;
    SETTINGSTATUS status;
    SYSTEMTIME timeLogged;
}
alias INSTALLSPECTYPE = int;
enum : int
{
    APPNAME  = 0x00000001,
    FILEEXT  = 0x00000002,
    PROGID   = 0x00000003,
    COMCLASS = 0x00000004,
}

union INSTALLSPEC
{
    struct _AppName_e__Struct
    {
        PWSTR Name;
        GUID GPOId;
    }
    PWSTR FileExt;
    PWSTR ProgId;
    struct _COMClass_e__Struct
    {
        GUID Clsid;
        uint ClsCtx;
    }
}
struct INSTALLDATA
{
    INSTALLSPECTYPE Type;
    INSTALLSPEC Spec;
}
alias APPSTATE = int;
enum : int
{
    ABSENT    = 0x00000000,
    ASSIGNED  = 0x00000001,
    PUBLISHED = 0x00000002,
}

struct LOCALMANAGEDAPPLICATION
{
    PWSTR pszDeploymentName;
    PWSTR pszPolicyName;
    PWSTR pszProductId;
    uint dwState;
}
struct MANAGEDAPPLICATION
{
    PWSTR pszPackageName;
    PWSTR pszPublisher;
    uint dwVersionHi;
    uint dwVersionLo;
    uint dwRevision;
    GUID GpoId;
    PWSTR pszPolicyName;
    GUID ProductId;
    ushort Language;
    PWSTR pszOwner;
    PWSTR pszCompany;
    PWSTR pszComments;
    PWSTR pszContact;
    PWSTR pszSupportUrl;
    uint dwPathType;
    BOOL bInstalled;
}
alias GROUP_POLICY_OBJECT_TYPE = int;
enum : int
{
    GPOTypeLocal      = 0x00000000,
    GPOTypeRemote     = 0x00000001,
    GPOTypeDS         = 0x00000002,
    GPOTypeLocalUser  = 0x00000003,
    GPOTypeLocalGroup = 0x00000004,
}

alias GROUP_POLICY_HINT_TYPE = int;
enum : int
{
    GPHintUnknown            = 0x00000000,
    GPHintMachine            = 0x00000001,
    GPHintSite               = 0x00000002,
    GPHintDomain             = 0x00000003,
    GPHintOrganizationalUnit = 0x00000004,
}

enum IID_IGPEInformation = GUID(0x8fc0b735, 0xa0e1, 0x11d1, [0xa7, 0xd3, 0x0, 0x0, 0xf8, 0x75, 0x71, 0xe3]);
interface IGPEInformation : IUnknown
{
    HRESULT GetName(PWSTR, int);
    HRESULT GetDisplayName(PWSTR, int);
    HRESULT GetRegistryKey(uint, HKEY*);
    HRESULT GetDSPath(uint, PWSTR, int);
    HRESULT GetFileSysPath(uint, PWSTR, int);
    HRESULT GetOptions(uint*);
    HRESULT GetType(GROUP_POLICY_OBJECT_TYPE*);
    HRESULT GetHint(GROUP_POLICY_HINT_TYPE*);
    HRESULT PolicyChanged(BOOL, BOOL, GUID*, GUID*);
}
enum IID_IGroupPolicyObject = GUID(0xea502723, 0xa23d, 0x11d1, [0xa7, 0xd3, 0x0, 0x0, 0xf8, 0x75, 0x71, 0xe3]);
interface IGroupPolicyObject : IUnknown
{
    HRESULT New(PWSTR, PWSTR, uint);
    HRESULT OpenDSGPO(PWSTR, uint);
    HRESULT OpenLocalMachineGPO(uint);
    HRESULT OpenRemoteMachineGPO(PWSTR, uint);
    HRESULT Save(BOOL, BOOL, GUID*, GUID*);
    HRESULT Delete();
    HRESULT GetName(PWSTR, int);
    HRESULT GetDisplayName(PWSTR, int);
    HRESULT SetDisplayName(PWSTR);
    HRESULT GetPath(PWSTR, int);
    HRESULT GetDSPath(uint, PWSTR, int);
    HRESULT GetFileSysPath(uint, PWSTR, int);
    HRESULT GetRegistryKey(uint, HKEY*);
    HRESULT GetOptions(uint*);
    HRESULT SetOptions(uint, uint);
    HRESULT GetType(GROUP_POLICY_OBJECT_TYPE*);
    HRESULT GetMachineName(PWSTR, int);
    HRESULT GetPropertySheetPages(HPROPSHEETPAGE**, uint*);
}
enum IID_IRSOPInformation = GUID(0x9a5a81b5, 0xd9c7, 0x49ef, [0x9d, 0x11, 0xdd, 0xf5, 0x9, 0x68, 0xc4, 0x8d]);
interface IRSOPInformation : IUnknown
{
    HRESULT GetNamespace(uint, PWSTR, int);
    HRESULT GetFlags(uint*);
    HRESULT GetEventLogEntryText(PWSTR, PWSTR, PWSTR, uint, PWSTR*);
}
struct GPOBROWSEINFO
{
    uint dwSize;
    uint dwFlags;
    HWND hwndOwner;
    PWSTR lpTitle;
    PWSTR lpInitialOU;
    PWSTR lpDSPath;
    uint dwDSPathSize;
    PWSTR lpName;
    uint dwNameSize;
    GROUP_POLICY_OBJECT_TYPE gpoType;
    GROUP_POLICY_HINT_TYPE gpoHint;
}
