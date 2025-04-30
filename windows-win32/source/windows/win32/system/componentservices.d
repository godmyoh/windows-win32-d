module windows.win32.system.componentservices;

import windows.win32.guid : GUID;
import windows.win32.foundation : BOOL, BSTR, FILETIME, HRESULT, PWSTR, VARIANT_BOOL;
import windows.win32.security : PSID;
import windows.win32.system.com : APTTYPE, BLOB, IClassFactory, IDispatch, IUnknown, SAFEARRAY;
import windows.win32.system.distributedtransactioncoordinator : ITransaction, ITransactionVoterBallotAsync2, ITransactionVoterNotifyAsync2;
import windows.win32.system.variant : VARIANT;

version (Windows):
extern (Windows):

HRESULT CoGetDefaultContext(APTTYPE aptType, const(GUID)* riid, void** ppv);
HRESULT CoCreateActivity(IUnknown pIUnknown, const(GUID)* riid, void** ppObj);
HRESULT CoEnterServiceDomain(IUnknown pConfigObject);
void CoLeaveServiceDomain(IUnknown pUnkStatus);
HRESULT GetManagedExtensions(uint* dwExts);
void* SafeRef(const(GUID)* rid, IUnknown pUnk);
HRESULT RecycleSurrogate(int lReasonCode);
HRESULT MTSCreateActivity(const(GUID)* riid, void** ppobj);
HRESULT GetDispenserManager(IDispenserManager* param0);
enum TRACKER_STARTSTOP_EVENT = "Global\\COM+ Tracker Push Event";
enum TRACKER_INIT_EVENT = "Global\\COM+ Tracker Init Event";
enum GUID_STRING_SIZE = 0x00000028;
enum DATA_NOT_AVAILABLE = 0xffffffff;
enum MTXDM_E_ENLISTRESOURCEFAILED = 0x8004e100;
enum CRR_NO_REASON_SUPPLIED = 0x00000000;
enum CRR_LIFETIME_LIMIT = 0xffffffff;
enum CRR_ACTIVATION_LIMIT = 0xfffffffe;
enum CRR_CALL_LIMIT = 0xfffffffd;
enum CRR_MEMORY_LIMIT = 0xfffffffc;
enum CRR_RECYCLED_FROM_UI = 0xfffffffb;
enum IID_ICOMAdminCatalog = GUID(0xdd662187, 0xdfc2, 0x11d1, [0xa2, 0xcf, 0x0, 0x80, 0x5f, 0xc7, 0x92, 0x35]);
interface ICOMAdminCatalog : IDispatch
{
    HRESULT GetCollection(BSTR bstrCollName, IDispatch* ppCatalogCollection);
    HRESULT Connect(BSTR bstrCatalogServerName, IDispatch* ppCatalogCollection);
    HRESULT get_MajorVersion(int* plMajorVersion);
    HRESULT get_MinorVersion(int* plMinorVersion);
    HRESULT GetCollectionByQuery(BSTR bstrCollName, SAFEARRAY** ppsaVarQuery, IDispatch* ppCatalogCollection);
    HRESULT ImportComponent(BSTR bstrApplIDOrName, BSTR bstrCLSIDOrProgID);
    HRESULT InstallComponent(BSTR bstrApplIDOrName, BSTR bstrDLL, BSTR bstrTLB, BSTR bstrPSDLL);
    HRESULT ShutdownApplication(BSTR bstrApplIDOrName);
    HRESULT ExportApplication(BSTR bstrApplIDOrName, BSTR bstrApplicationFile, COMAdminApplicationExportOptions lOptions);
    HRESULT InstallApplication(BSTR bstrApplicationFile, BSTR bstrDestinationDirectory, COMAdminApplicationInstallOptions lOptions, BSTR bstrUserId, BSTR bstrPassword, BSTR bstrRSN);
    HRESULT StopRouter();
    HRESULT RefreshRouter();
    HRESULT StartRouter();
    HRESULT Reserved1();
    HRESULT Reserved2();
    HRESULT InstallMultipleComponents(BSTR bstrApplIDOrName, SAFEARRAY** ppsaVarFileNames, SAFEARRAY** ppsaVarCLSIDs);
    HRESULT GetMultipleComponentsInfo(BSTR bstrApplIdOrName, SAFEARRAY** ppsaVarFileNames, SAFEARRAY** ppsaVarCLSIDs, SAFEARRAY** ppsaVarClassNames, SAFEARRAY** ppsaVarFileFlags, SAFEARRAY** ppsaVarComponentFlags);
    HRESULT RefreshComponents();
    HRESULT BackupREGDB(BSTR bstrBackupFilePath);
    HRESULT RestoreREGDB(BSTR bstrBackupFilePath);
    HRESULT QueryApplicationFile(BSTR bstrApplicationFile, BSTR* pbstrApplicationName, BSTR* pbstrApplicationDescription, VARIANT_BOOL* pbHasUsers, VARIANT_BOOL* pbIsProxy, SAFEARRAY** ppsaVarFileNames);
    HRESULT StartApplication(BSTR bstrApplIdOrName);
    HRESULT ServiceCheck(int lService, int* plStatus);
    HRESULT InstallMultipleEventClasses(BSTR bstrApplIdOrName, SAFEARRAY** ppsaVarFileNames, SAFEARRAY** ppsaVarCLSIDS);
    HRESULT InstallEventClass(BSTR bstrApplIdOrName, BSTR bstrDLL, BSTR bstrTLB, BSTR bstrPSDLL);
    HRESULT GetEventClassesForIID(BSTR bstrIID, SAFEARRAY** ppsaVarCLSIDs, SAFEARRAY** ppsaVarProgIDs, SAFEARRAY** ppsaVarDescriptions);
}
alias COMAdminInUse = int;
enum : int
{
    COMAdminNotInUse                 = 0x00000000,
    COMAdminInUseByCatalog           = 0x00000001,
    COMAdminInUseByRegistryUnknown   = 0x00000002,
    COMAdminInUseByRegistryProxyStub = 0x00000003,
    COMAdminInUseByRegistryTypeLib   = 0x00000004,
    COMAdminInUseByRegistryClsid     = 0x00000005,
}

enum IID_ICOMAdminCatalog2 = GUID(0x790c6e0b, 0x9194, 0x4cc9, [0x94, 0x26, 0xa4, 0x8a, 0x63, 0x18, 0x56, 0x96]);
interface ICOMAdminCatalog2 : ICOMAdminCatalog
{
    HRESULT GetCollectionByQuery2(BSTR bstrCollectionName, VARIANT* pVarQueryStrings, IDispatch* ppCatalogCollection);
    HRESULT GetApplicationInstanceIDFromProcessID(int lProcessID, BSTR* pbstrApplicationInstanceID);
    HRESULT ShutdownApplicationInstances(VARIANT* pVarApplicationInstanceID);
    HRESULT PauseApplicationInstances(VARIANT* pVarApplicationInstanceID);
    HRESULT ResumeApplicationInstances(VARIANT* pVarApplicationInstanceID);
    HRESULT RecycleApplicationInstances(VARIANT* pVarApplicationInstanceID, int lReasonCode);
    HRESULT AreApplicationInstancesPaused(VARIANT* pVarApplicationInstanceID, VARIANT_BOOL* pVarBoolPaused);
    HRESULT DumpApplicationInstance(BSTR bstrApplicationInstanceID, BSTR bstrDirectory, int lMaxImages, BSTR* pbstrDumpFile);
    HRESULT get_IsApplicationInstanceDumpSupported(VARIANT_BOOL* pVarBoolDumpSupported);
    HRESULT CreateServiceForApplication(BSTR bstrApplicationIDOrName, BSTR bstrServiceName, BSTR bstrStartType, BSTR bstrErrorControl, BSTR bstrDependencies, BSTR bstrRunAs, BSTR bstrPassword, VARIANT_BOOL bDesktopOk);
    HRESULT DeleteServiceForApplication(BSTR bstrApplicationIDOrName);
    HRESULT GetPartitionID(BSTR bstrApplicationIDOrName, BSTR* pbstrPartitionID);
    HRESULT GetPartitionName(BSTR bstrApplicationIDOrName, BSTR* pbstrPartitionName);
    HRESULT put_CurrentPartition(BSTR bstrPartitionIDOrName);
    HRESULT get_CurrentPartitionID(BSTR* pbstrPartitionID);
    HRESULT get_CurrentPartitionName(BSTR* pbstrPartitionName);
    HRESULT get_GlobalPartitionID(BSTR* pbstrGlobalPartitionID);
    HRESULT FlushPartitionCache();
    HRESULT CopyApplications(BSTR bstrSourcePartitionIDOrName, VARIANT* pVarApplicationID, BSTR bstrDestinationPartitionIDOrName);
    HRESULT CopyComponents(BSTR bstrSourceApplicationIDOrName, VARIANT* pVarCLSIDOrProgID, BSTR bstrDestinationApplicationIDOrName);
    HRESULT MoveComponents(BSTR bstrSourceApplicationIDOrName, VARIANT* pVarCLSIDOrProgID, BSTR bstrDestinationApplicationIDOrName);
    HRESULT AliasComponent(BSTR bstrSrcApplicationIDOrName, BSTR bstrCLSIDOrProgID, BSTR bstrDestApplicationIDOrName, BSTR bstrNewProgId, BSTR bstrNewClsid);
    HRESULT IsSafeToDelete(BSTR bstrDllName, COMAdminInUse* pCOMAdminInUse);
    HRESULT ImportUnconfiguredComponents(BSTR bstrApplicationIDOrName, VARIANT* pVarCLSIDOrProgID, VARIANT* pVarComponentType);
    HRESULT PromoteUnconfiguredComponents(BSTR bstrApplicationIDOrName, VARIANT* pVarCLSIDOrProgID, VARIANT* pVarComponentType);
    HRESULT ImportComponents(BSTR bstrApplicationIDOrName, VARIANT* pVarCLSIDOrProgID, VARIANT* pVarComponentType);
    HRESULT get_Is64BitCatalogServer(VARIANT_BOOL* pbIs64Bit);
    HRESULT ExportPartition(BSTR bstrPartitionIDOrName, BSTR bstrPartitionFileName, COMAdminApplicationExportOptions lOptions);
    HRESULT InstallPartition(BSTR bstrFileName, BSTR bstrDestDirectory, COMAdminApplicationInstallOptions lOptions, BSTR bstrUserID, BSTR bstrPassword, BSTR bstrRSN);
    HRESULT QueryApplicationFile2(BSTR bstrApplicationFile, IDispatch* ppFilesForImport);
    HRESULT GetComponentVersionCount(BSTR bstrCLSIDOrProgID, int* plVersionCount);
}
enum IID_ICatalogObject = GUID(0x6eb22871, 0x8a19, 0x11d0, [0x81, 0xb6, 0x0, 0xa0, 0xc9, 0x23, 0x1c, 0x29]);
interface ICatalogObject : IDispatch
{
    HRESULT get_Value(BSTR bstrPropName, VARIANT* pvarRetVal);
    HRESULT put_Value(BSTR bstrPropName, VARIANT val);
    HRESULT get_Key(VARIANT* pvarRetVal);
    HRESULT get_Name(VARIANT* pvarRetVal);
    HRESULT IsPropertyReadOnly(BSTR bstrPropName, VARIANT_BOOL* pbRetVal);
    HRESULT get_Valid(VARIANT_BOOL* pbRetVal);
    HRESULT IsPropertyWriteOnly(BSTR bstrPropName, VARIANT_BOOL* pbRetVal);
}
enum IID_ICatalogCollection = GUID(0x6eb22872, 0x8a19, 0x11d0, [0x81, 0xb6, 0x0, 0xa0, 0xc9, 0x23, 0x1c, 0x29]);
interface ICatalogCollection : IDispatch
{
    HRESULT get__NewEnum(IUnknown* ppEnumVariant);
    HRESULT get_Item(int lIndex, IDispatch* ppCatalogObject);
    HRESULT get_Count(int* plObjectCount);
    HRESULT Remove(int lIndex);
    HRESULT Add(IDispatch* ppCatalogObject);
    HRESULT Populate();
    HRESULT SaveChanges(int* pcChanges);
    HRESULT GetCollection(BSTR bstrCollName, VARIANT varObjectKey, IDispatch* ppCatalogCollection);
    HRESULT get_Name(VARIANT* pVarNamel);
    HRESULT get_AddEnabled(VARIANT_BOOL* pVarBool);
    HRESULT get_RemoveEnabled(VARIANT_BOOL* pVarBool);
    HRESULT GetUtilInterface(IDispatch* ppIDispatch);
    HRESULT get_DataStoreMajorVersion(int* plMajorVersion);
    HRESULT get_DataStoreMinorVersion(int* plMinorVersionl);
    HRESULT PopulateByKey(SAFEARRAY* psaKeys);
    HRESULT PopulateByQuery(BSTR bstrQueryString, int lQueryType);
}
alias COMAdminComponentType = int;
enum : int
{
    COMAdmin32BitComponent = 0x00000001,
    COMAdmin64BitComponent = 0x00000002,
}

alias COMAdminApplicationInstallOptions = int;
enum : int
{
    COMAdminInstallNoUsers               = 0x00000000,
    COMAdminInstallUsers                 = 0x00000001,
    COMAdminInstallForceOverwriteOfFiles = 0x00000002,
}

alias COMAdminApplicationExportOptions = int;
enum : int
{
    COMAdminExportNoUsers               = 0x00000000,
    COMAdminExportUsers                 = 0x00000001,
    COMAdminExportApplicationProxy      = 0x00000002,
    COMAdminExportForceOverwriteOfFiles = 0x00000004,
    COMAdminExportIn10Format            = 0x00000010,
}

alias COMAdminThreadingModels = int;
enum : int
{
    COMAdminThreadingModelApartment    = 0x00000000,
    COMAdminThreadingModelFree         = 0x00000001,
    COMAdminThreadingModelMain         = 0x00000002,
    COMAdminThreadingModelBoth         = 0x00000003,
    COMAdminThreadingModelNeutral      = 0x00000004,
    COMAdminThreadingModelNotSpecified = 0x00000005,
}

alias COMAdminTransactionOptions = int;
enum : int
{
    COMAdminTransactionIgnored     = 0x00000000,
    COMAdminTransactionNone        = 0x00000001,
    COMAdminTransactionSupported   = 0x00000002,
    COMAdminTransactionRequired    = 0x00000003,
    COMAdminTransactionRequiresNew = 0x00000004,
}

alias COMAdminTxIsolationLevelOptions = int;
enum : int
{
    COMAdminTxIsolationLevelAny             = 0x00000000,
    COMAdminTxIsolationLevelReadUnCommitted = 0x00000001,
    COMAdminTxIsolationLevelReadCommitted   = 0x00000002,
    COMAdminTxIsolationLevelRepeatableRead  = 0x00000003,
    COMAdminTxIsolationLevelSerializable    = 0x00000004,
}

alias COMAdminSynchronizationOptions = int;
enum : int
{
    COMAdminSynchronizationIgnored     = 0x00000000,
    COMAdminSynchronizationNone        = 0x00000001,
    COMAdminSynchronizationSupported   = 0x00000002,
    COMAdminSynchronizationRequired    = 0x00000003,
    COMAdminSynchronizationRequiresNew = 0x00000004,
}

alias COMAdminActivationOptions = int;
enum : int
{
    COMAdminActivationInproc = 0x00000000,
    COMAdminActivationLocal  = 0x00000001,
}

alias COMAdminAccessChecksLevelOptions = int;
enum : int
{
    COMAdminAccessChecksApplicationLevel          = 0x00000000,
    COMAdminAccessChecksApplicationComponentLevel = 0x00000001,
}

alias COMAdminAuthenticationLevelOptions = int;
enum : int
{
    COMAdminAuthenticationDefault   = 0x00000000,
    COMAdminAuthenticationNone      = 0x00000001,
    COMAdminAuthenticationConnect   = 0x00000002,
    COMAdminAuthenticationCall      = 0x00000003,
    COMAdminAuthenticationPacket    = 0x00000004,
    COMAdminAuthenticationIntegrity = 0x00000005,
    COMAdminAuthenticationPrivacy   = 0x00000006,
}

alias COMAdminImpersonationLevelOptions = int;
enum : int
{
    COMAdminImpersonationAnonymous   = 0x00000001,
    COMAdminImpersonationIdentify    = 0x00000002,
    COMAdminImpersonationImpersonate = 0x00000003,
    COMAdminImpersonationDelegate    = 0x00000004,
}

alias COMAdminAuthenticationCapabilitiesOptions = int;
enum : int
{
    COMAdminAuthenticationCapabilitiesNone            = 0x00000000,
    COMAdminAuthenticationCapabilitiesSecureReference = 0x00000002,
    COMAdminAuthenticationCapabilitiesStaticCloaking  = 0x00000020,
    COMAdminAuthenticationCapabilitiesDynamicCloaking = 0x00000040,
}

alias COMAdminOS = int;
enum : int
{
    COMAdminOSNotInitialized                  = 0x00000000,
    COMAdminOSWindows3_1                      = 0x00000001,
    COMAdminOSWindows9x                       = 0x00000002,
    COMAdminOSWindows2000                     = 0x00000003,
    COMAdminOSWindows2000AdvancedServer       = 0x00000004,
    COMAdminOSWindows2000Unknown              = 0x00000005,
    COMAdminOSUnknown                         = 0x00000006,
    COMAdminOSWindowsXPPersonal               = 0x0000000b,
    COMAdminOSWindowsXPProfessional           = 0x0000000c,
    COMAdminOSWindowsNETStandardServer        = 0x0000000d,
    COMAdminOSWindowsNETEnterpriseServer      = 0x0000000e,
    COMAdminOSWindowsNETDatacenterServer      = 0x0000000f,
    COMAdminOSWindowsNETWebServer             = 0x00000010,
    COMAdminOSWindowsLonghornPersonal         = 0x00000011,
    COMAdminOSWindowsLonghornProfessional     = 0x00000012,
    COMAdminOSWindowsLonghornStandardServer   = 0x00000013,
    COMAdminOSWindowsLonghornEnterpriseServer = 0x00000014,
    COMAdminOSWindowsLonghornDatacenterServer = 0x00000015,
    COMAdminOSWindowsLonghornWebServer        = 0x00000016,
    COMAdminOSWindows7Personal                = 0x00000017,
    COMAdminOSWindows7Professional            = 0x00000018,
    COMAdminOSWindows7StandardServer          = 0x00000019,
    COMAdminOSWindows7EnterpriseServer        = 0x0000001a,
    COMAdminOSWindows7DatacenterServer        = 0x0000001b,
    COMAdminOSWindows7WebServer               = 0x0000001c,
    COMAdminOSWindows8Personal                = 0x0000001d,
    COMAdminOSWindows8Professional            = 0x0000001e,
    COMAdminOSWindows8StandardServer          = 0x0000001f,
    COMAdminOSWindows8EnterpriseServer        = 0x00000020,
    COMAdminOSWindows8DatacenterServer        = 0x00000021,
    COMAdminOSWindows8WebServer               = 0x00000022,
    COMAdminOSWindowsBluePersonal             = 0x00000023,
    COMAdminOSWindowsBlueProfessional         = 0x00000024,
    COMAdminOSWindowsBlueStandardServer       = 0x00000025,
    COMAdminOSWindowsBlueEnterpriseServer     = 0x00000026,
    COMAdminOSWindowsBlueDatacenterServer     = 0x00000027,
    COMAdminOSWindowsBlueWebServer            = 0x00000028,
}

alias COMAdminServiceOptions = int;
enum : int
{
    COMAdminServiceLoadBalanceRouter = 0x00000001,
}

alias COMAdminServiceStatusOptions = int;
enum : int
{
    COMAdminServiceStopped         = 0x00000000,
    COMAdminServiceStartPending    = 0x00000001,
    COMAdminServiceStopPending     = 0x00000002,
    COMAdminServiceRunning         = 0x00000003,
    COMAdminServiceContinuePending = 0x00000004,
    COMAdminServicePausePending    = 0x00000005,
    COMAdminServicePaused          = 0x00000006,
    COMAdminServiceUnknownState    = 0x00000007,
}

alias COMAdminQCMessageAuthenticateOptions = int;
enum : int
{
    COMAdminQCMessageAuthenticateSecureApps = 0x00000000,
    COMAdminQCMessageAuthenticateOff        = 0x00000001,
    COMAdminQCMessageAuthenticateOn         = 0x00000002,
}

alias COMAdminFileFlags = int;
enum : int
{
    COMAdminFileFlagLoadable          = 0x00000001,
    COMAdminFileFlagCOM               = 0x00000002,
    COMAdminFileFlagContainsPS        = 0x00000004,
    COMAdminFileFlagContainsComp      = 0x00000008,
    COMAdminFileFlagContainsTLB       = 0x00000010,
    COMAdminFileFlagSelfReg           = 0x00000020,
    COMAdminFileFlagSelfUnReg         = 0x00000040,
    COMAdminFileFlagUnloadableDLL     = 0x00000080,
    COMAdminFileFlagDoesNotExist      = 0x00000100,
    COMAdminFileFlagAlreadyInstalled  = 0x00000200,
    COMAdminFileFlagBadTLB            = 0x00000400,
    COMAdminFileFlagGetClassObjFailed = 0x00000800,
    COMAdminFileFlagClassNotAvailable = 0x00001000,
    COMAdminFileFlagRegistrar         = 0x00002000,
    COMAdminFileFlagNoRegistrar       = 0x00004000,
    COMAdminFileFlagDLLRegsvrFailed   = 0x00008000,
    COMAdminFileFlagRegTLBFailed      = 0x00010000,
    COMAdminFileFlagRegistrarFailed   = 0x00020000,
    COMAdminFileFlagError             = 0x00040000,
}

alias COMAdminComponentFlags = int;
enum : int
{
    COMAdminCompFlagTypeInfoFound          = 0x00000001,
    COMAdminCompFlagCOMPlusPropertiesFound = 0x00000002,
    COMAdminCompFlagProxyFound             = 0x00000004,
    COMAdminCompFlagInterfacesFound        = 0x00000008,
    COMAdminCompFlagAlreadyInstalled       = 0x00000010,
    COMAdminCompFlagNotInApplication       = 0x00000020,
}

alias COMAdminErrorCodes = int;
enum : int
{
    COMAdminErrObjectErrors                  = 0x80110401,
    COMAdminErrObjectInvalid                 = 0x80110402,
    COMAdminErrKeyMissing                    = 0x80110403,
    COMAdminErrAlreadyInstalled              = 0x80110404,
    COMAdminErrAppFileWriteFail              = 0x80110407,
    COMAdminErrAppFileReadFail               = 0x80110408,
    COMAdminErrAppFileVersion                = 0x80110409,
    COMAdminErrBadPath                       = 0x8011040a,
    COMAdminErrApplicationExists             = 0x8011040b,
    COMAdminErrRoleExists                    = 0x8011040c,
    COMAdminErrCantCopyFile                  = 0x8011040d,
    COMAdminErrNoUser                        = 0x8011040f,
    COMAdminErrInvalidUserids                = 0x80110410,
    COMAdminErrNoRegistryCLSID               = 0x80110411,
    COMAdminErrBadRegistryProgID             = 0x80110412,
    COMAdminErrAuthenticationLevel           = 0x80110413,
    COMAdminErrUserPasswdNotValid            = 0x80110414,
    COMAdminErrCLSIDOrIIDMismatch            = 0x80110418,
    COMAdminErrRemoteInterface               = 0x80110419,
    COMAdminErrDllRegisterServer             = 0x8011041a,
    COMAdminErrNoServerShare                 = 0x8011041b,
    COMAdminErrDllLoadFailed                 = 0x8011041d,
    COMAdminErrBadRegistryLibID              = 0x8011041e,
    COMAdminErrAppDirNotFound                = 0x8011041f,
    COMAdminErrRegistrarFailed               = 0x80110423,
    COMAdminErrCompFileDoesNotExist          = 0x80110424,
    COMAdminErrCompFileLoadDLLFail           = 0x80110425,
    COMAdminErrCompFileGetClassObj           = 0x80110426,
    COMAdminErrCompFileClassNotAvail         = 0x80110427,
    COMAdminErrCompFileBadTLB                = 0x80110428,
    COMAdminErrCompFileNotInstallable        = 0x80110429,
    COMAdminErrNotChangeable                 = 0x8011042a,
    COMAdminErrNotDeletable                  = 0x8011042b,
    COMAdminErrSession                       = 0x8011042c,
    COMAdminErrCompMoveLocked                = 0x8011042d,
    COMAdminErrCompMoveBadDest               = 0x8011042e,
    COMAdminErrRegisterTLB                   = 0x80110430,
    COMAdminErrSystemApp                     = 0x80110433,
    COMAdminErrCompFileNoRegistrar           = 0x80110434,
    COMAdminErrCoReqCompInstalled            = 0x80110435,
    COMAdminErrServiceNotInstalled           = 0x80110436,
    COMAdminErrPropertySaveFailed            = 0x80110437,
    COMAdminErrObjectExists                  = 0x80110438,
    COMAdminErrComponentExists               = 0x80110439,
    COMAdminErrRegFileCorrupt                = 0x8011043b,
    COMAdminErrPropertyOverflow              = 0x8011043c,
    COMAdminErrNotInRegistry                 = 0x8011043e,
    COMAdminErrObjectNotPoolable             = 0x8011043f,
    COMAdminErrApplidMatchesClsid            = 0x80110446,
    COMAdminErrRoleDoesNotExist              = 0x80110447,
    COMAdminErrStartAppNeedsComponents       = 0x80110448,
    COMAdminErrRequiresDifferentPlatform     = 0x80110449,
    COMAdminErrQueuingServiceNotAvailable    = 0x80110602,
    COMAdminErrObjectParentMissing           = 0x80110808,
    COMAdminErrObjectDoesNotExist            = 0x80110809,
    COMAdminErrCanNotExportAppProxy          = 0x8011044a,
    COMAdminErrCanNotStartApp                = 0x8011044b,
    COMAdminErrCanNotExportSystemApp         = 0x8011044c,
    COMAdminErrCanNotSubscribeToComponent    = 0x8011044d,
    COMAdminErrAppNotRunning                 = 0x8011080a,
    COMAdminErrEventClassCannotBeSubscriber  = 0x8011044e,
    COMAdminErrLibAppProxyIncompatible       = 0x8011044f,
    COMAdminErrBasePartitionOnly             = 0x80110450,
    COMAdminErrDuplicatePartitionName        = 0x80110457,
    COMAdminErrPartitionInUse                = 0x80110459,
    COMAdminErrImportedComponentsNotAllowed  = 0x8011045b,
    COMAdminErrRegdbNotInitialized           = 0x80110472,
    COMAdminErrRegdbNotOpen                  = 0x80110473,
    COMAdminErrRegdbSystemErr                = 0x80110474,
    COMAdminErrRegdbAlreadyRunning           = 0x80110475,
    COMAdminErrMigVersionNotSupported        = 0x80110480,
    COMAdminErrMigSchemaNotFound             = 0x80110481,
    COMAdminErrCatBitnessMismatch            = 0x80110482,
    COMAdminErrCatUnacceptableBitness        = 0x80110483,
    COMAdminErrCatWrongAppBitnessBitness     = 0x80110484,
    COMAdminErrCatPauseResumeNotSupported    = 0x80110485,
    COMAdminErrCatServerFault                = 0x80110486,
    COMAdminErrCantRecycleLibraryApps        = 0x8011080f,
    COMAdminErrCantRecycleServiceApps        = 0x80110811,
    COMAdminErrProcessAlreadyRecycled        = 0x80110812,
    COMAdminErrPausedProcessMayNotBeRecycled = 0x80110813,
    COMAdminErrInvalidPartition              = 0x8011080b,
    COMAdminErrPartitionMsiOnly              = 0x80110819,
    COMAdminErrStartAppDisabled              = 0x80110451,
    COMAdminErrCompMoveSource                = 0x8011081c,
    COMAdminErrCompMoveDest                  = 0x8011081d,
    COMAdminErrCompMovePrivate               = 0x8011081e,
    COMAdminErrCannotCopyEventClass          = 0x80110820,
}

enum CLSID_COMAdminCatalog = GUID(0xf618c514, 0xdfb8, 0x11d1, [0xa2, 0xcf, 0x0, 0x80, 0x5f, 0xc7, 0x92, 0x35]);
struct COMAdminCatalog
{
}
enum CLSID_COMAdminCatalogObject = GUID(0xf618c515, 0xdfb8, 0x11d1, [0xa2, 0xcf, 0x0, 0x80, 0x5f, 0xc7, 0x92, 0x35]);
struct COMAdminCatalogObject
{
}
enum CLSID_COMAdminCatalogCollection = GUID(0xf618c516, 0xdfb8, 0x11d1, [0xa2, 0xcf, 0x0, 0x80, 0x5f, 0xc7, 0x92, 0x35]);
struct COMAdminCatalogCollection
{
}
enum IID_ISecurityIdentityColl = GUID(0xcafc823c, 0xb441, 0x11d1, [0xb8, 0x2b, 0x0, 0x0, 0xf8, 0x75, 0x7e, 0x2a]);
interface ISecurityIdentityColl : IDispatch
{
    HRESULT get_Count(int* plCount);
    HRESULT get_Item(BSTR name, VARIANT* pItem);
    HRESULT get__NewEnum(IUnknown* ppEnum);
}
enum IID_ISecurityCallersColl = GUID(0xcafc823d, 0xb441, 0x11d1, [0xb8, 0x2b, 0x0, 0x0, 0xf8, 0x75, 0x7e, 0x2a]);
interface ISecurityCallersColl : IDispatch
{
    HRESULT get_Count(int* plCount);
    HRESULT get_Item(int lIndex, ISecurityIdentityColl* pObj);
    HRESULT get__NewEnum(IUnknown* ppEnum);
}
enum IID_ISecurityCallContext = GUID(0xcafc823e, 0xb441, 0x11d1, [0xb8, 0x2b, 0x0, 0x0, 0xf8, 0x75, 0x7e, 0x2a]);
interface ISecurityCallContext : IDispatch
{
    HRESULT get_Count(int* plCount);
    HRESULT get_Item(BSTR name, VARIANT* pItem);
    HRESULT get__NewEnum(IUnknown* ppEnum);
    HRESULT IsCallerInRole(BSTR bstrRole, VARIANT_BOOL* pfInRole);
    HRESULT IsSecurityEnabled(VARIANT_BOOL* pfIsEnabled);
    HRESULT IsUserInRole(VARIANT* pUser, BSTR bstrRole, VARIANT_BOOL* pfInRole);
}
enum IID_IGetSecurityCallContext = GUID(0xcafc823f, 0xb441, 0x11d1, [0xb8, 0x2b, 0x0, 0x0, 0xf8, 0x75, 0x7e, 0x2a]);
interface IGetSecurityCallContext : IDispatch
{
    HRESULT GetSecurityCallContext(ISecurityCallContext* ppObject);
}
enum IID_SecurityProperty = GUID(0xe74a7215, 0x14d, 0x11d1, [0xa6, 0x3c, 0x0, 0xa0, 0xc9, 0x11, 0xb4, 0xe0]);
interface SecurityProperty : IDispatch
{
    HRESULT GetDirectCallerName(BSTR* bstrUserName);
    HRESULT GetDirectCreatorName(BSTR* bstrUserName);
    HRESULT GetOriginalCallerName(BSTR* bstrUserName);
    HRESULT GetOriginalCreatorName(BSTR* bstrUserName);
}
enum IID_ContextInfo = GUID(0x19a5a02c, 0xac8, 0x11d2, [0xb2, 0x86, 0x0, 0xc0, 0x4f, 0x8e, 0xf9, 0x34]);
interface ContextInfo : IDispatch
{
    HRESULT IsInTransaction(VARIANT_BOOL* pbIsInTx);
    HRESULT GetTransaction(IUnknown* ppTx);
    HRESULT GetTransactionId(BSTR* pbstrTxId);
    HRESULT GetActivityId(BSTR* pbstrActivityId);
    HRESULT GetContextId(BSTR* pbstrCtxId);
}
enum IID_ContextInfo2 = GUID(0xc99d6e75, 0x2375, 0x11d4, [0x83, 0x31, 0x0, 0xc0, 0x4f, 0x60, 0x55, 0x88]);
interface ContextInfo2 : ContextInfo
{
    HRESULT GetPartitionId(BSTR* __MIDL__ContextInfo20000);
    HRESULT GetApplicationId(BSTR* __MIDL__ContextInfo20001);
    HRESULT GetApplicationInstanceId(BSTR* __MIDL__ContextInfo20002);
}
enum IID_ObjectContext = GUID(0x74c08646, 0xcedb, 0x11cf, [0x8b, 0x49, 0x0, 0xaa, 0x0, 0xb8, 0xa7, 0x90]);
interface ObjectContext : IDispatch
{
    HRESULT CreateInstance(BSTR bstrProgID, VARIANT* pObject);
    HRESULT SetComplete();
    HRESULT SetAbort();
    HRESULT EnableCommit();
    HRESULT DisableCommit();
    HRESULT IsInTransaction(VARIANT_BOOL* pbIsInTx);
    HRESULT IsSecurityEnabled(VARIANT_BOOL* pbIsEnabled);
    HRESULT IsCallerInRole(BSTR bstrRole, VARIANT_BOOL* pbInRole);
    HRESULT get_Count(int* plCount);
    HRESULT get_Item(BSTR name, VARIANT* pItem);
    HRESULT get__NewEnum(IUnknown* ppEnum);
    HRESULT get_Security(SecurityProperty* ppSecurityProperty);
    HRESULT get_ContextInfo(ContextInfo* ppContextInfo);
}
enum IID_ITransactionContextEx = GUID(0x7999fc22, 0xd3c6, 0x11cf, [0xac, 0xab, 0x0, 0xa0, 0x24, 0xa5, 0x5a, 0xef]);
interface ITransactionContextEx : IUnknown
{
    HRESULT CreateInstance(const(GUID)* rclsid, const(GUID)* riid, void** pObject);
    HRESULT Commit();
    HRESULT Abort();
}
enum IID_ITransactionContext = GUID(0x7999fc21, 0xd3c6, 0x11cf, [0xac, 0xab, 0x0, 0xa0, 0x24, 0xa5, 0x5a, 0xef]);
interface ITransactionContext : IDispatch
{
    HRESULT CreateInstance(BSTR pszProgId, VARIANT* pObject);
    HRESULT Commit();
    HRESULT Abort();
}
enum IID_ICreateWithTransactionEx = GUID(0x455acf57, 0x5345, 0x11d2, [0x99, 0xcf, 0x0, 0xc0, 0x4f, 0x79, 0x7b, 0xc9]);
interface ICreateWithTransactionEx : IUnknown
{
    HRESULT CreateInstance(ITransaction pTransaction, const(GUID)* rclsid, const(GUID)* riid, void** pObject);
}
enum IID_ICreateWithLocalTransaction = GUID(0x227ac7a8, 0x8423, 0x42ce, [0xb7, 0xcf, 0x3, 0x6, 0x1e, 0xc9, 0xaa, 0xa3]);
interface ICreateWithLocalTransaction : IUnknown
{
    HRESULT CreateInstanceWithSysTx(IUnknown pTransaction, const(GUID)* rclsid, const(GUID)* riid, void** pObject);
}
enum IID_ICreateWithTipTransactionEx = GUID(0x455acf59, 0x5345, 0x11d2, [0x99, 0xcf, 0x0, 0xc0, 0x4f, 0x79, 0x7b, 0xc9]);
interface ICreateWithTipTransactionEx : IUnknown
{
    HRESULT CreateInstance(BSTR bstrTipUrl, const(GUID)* rclsid, const(GUID)* riid, void** pObject);
}
struct COMSVCSEVENTINFO
{
    uint cbSize;
    uint dwPid;
    long lTime;
    int lMicroTime;
    long perfCount;
    GUID guidApp;
    PWSTR sMachineName;
}
enum IID_IComLTxEvents = GUID(0x605cf82c, 0x578e, 0x4298, [0x97, 0x5d, 0x82, 0xba, 0xbc, 0xd9, 0xe0, 0x53]);
interface IComLTxEvents : IUnknown
{
    HRESULT OnLtxTransactionStart(COMSVCSEVENTINFO* pInfo, GUID guidLtx, GUID tsid, BOOL fRoot, int nIsolationLevel);
    HRESULT OnLtxTransactionPrepare(COMSVCSEVENTINFO* pInfo, GUID guidLtx, BOOL fVote);
    HRESULT OnLtxTransactionAbort(COMSVCSEVENTINFO* pInfo, GUID guidLtx);
    HRESULT OnLtxTransactionCommit(COMSVCSEVENTINFO* pInfo, GUID guidLtx);
    HRESULT OnLtxTransactionPromote(COMSVCSEVENTINFO* pInfo, GUID guidLtx, GUID txnId);
}
enum IID_IComUserEvent = GUID(0x683130a4, 0x2e50, 0x11d2, [0x98, 0xa5, 0x0, 0xc0, 0x4f, 0x8e, 0xe1, 0xc4]);
interface IComUserEvent : IUnknown
{
    HRESULT OnUserEvent(COMSVCSEVENTINFO* pInfo, VARIANT* pvarEvent);
}
enum IID_IComThreadEvents = GUID(0x683130a5, 0x2e50, 0x11d2, [0x98, 0xa5, 0x0, 0xc0, 0x4f, 0x8e, 0xe1, 0xc4]);
interface IComThreadEvents : IUnknown
{
    HRESULT OnThreadStart(COMSVCSEVENTINFO* pInfo, ulong ThreadID, uint dwThread, uint dwTheadCnt);
    HRESULT OnThreadTerminate(COMSVCSEVENTINFO* pInfo, ulong ThreadID, uint dwThread, uint dwTheadCnt);
    HRESULT OnThreadBindToApartment(COMSVCSEVENTINFO* pInfo, ulong ThreadID, ulong AptID, uint dwActCnt, uint dwLowCnt);
    HRESULT OnThreadUnBind(COMSVCSEVENTINFO* pInfo, ulong ThreadID, ulong AptID, uint dwActCnt);
    HRESULT OnThreadWorkEnque(COMSVCSEVENTINFO* pInfo, ulong ThreadID, ulong MsgWorkID, uint QueueLen);
    HRESULT OnThreadWorkPrivate(COMSVCSEVENTINFO* pInfo, ulong ThreadID, ulong MsgWorkID);
    HRESULT OnThreadWorkPublic(COMSVCSEVENTINFO* pInfo, ulong ThreadID, ulong MsgWorkID, uint QueueLen);
    HRESULT OnThreadWorkRedirect(COMSVCSEVENTINFO* pInfo, ulong ThreadID, ulong MsgWorkID, uint QueueLen, ulong ThreadNum);
    HRESULT OnThreadWorkReject(COMSVCSEVENTINFO* pInfo, ulong ThreadID, ulong MsgWorkID, uint QueueLen);
    HRESULT OnThreadAssignApartment(COMSVCSEVENTINFO* pInfo, const(GUID)* guidActivity, ulong AptID);
    HRESULT OnThreadUnassignApartment(COMSVCSEVENTINFO* pInfo, ulong AptID);
}
enum IID_IComAppEvents = GUID(0x683130a6, 0x2e50, 0x11d2, [0x98, 0xa5, 0x0, 0xc0, 0x4f, 0x8e, 0xe1, 0xc4]);
interface IComAppEvents : IUnknown
{
    HRESULT OnAppActivation(COMSVCSEVENTINFO* pInfo, GUID guidApp);
    HRESULT OnAppShutdown(COMSVCSEVENTINFO* pInfo, GUID guidApp);
    HRESULT OnAppForceShutdown(COMSVCSEVENTINFO* pInfo, GUID guidApp);
}
enum IID_IComInstanceEvents = GUID(0x683130a7, 0x2e50, 0x11d2, [0x98, 0xa5, 0x0, 0xc0, 0x4f, 0x8e, 0xe1, 0xc4]);
interface IComInstanceEvents : IUnknown
{
    HRESULT OnObjectCreate(COMSVCSEVENTINFO* pInfo, const(GUID)* guidActivity, const(GUID)* clsid, const(GUID)* tsid, ulong CtxtID, ulong ObjectID);
    HRESULT OnObjectDestroy(COMSVCSEVENTINFO* pInfo, ulong CtxtID);
}
enum IID_IComTransactionEvents = GUID(0x683130a8, 0x2e50, 0x11d2, [0x98, 0xa5, 0x0, 0xc0, 0x4f, 0x8e, 0xe1, 0xc4]);
interface IComTransactionEvents : IUnknown
{
    HRESULT OnTransactionStart(COMSVCSEVENTINFO* pInfo, const(GUID)* guidTx, const(GUID)* tsid, BOOL fRoot);
    HRESULT OnTransactionPrepare(COMSVCSEVENTINFO* pInfo, const(GUID)* guidTx, BOOL fVoteYes);
    HRESULT OnTransactionAbort(COMSVCSEVENTINFO* pInfo, const(GUID)* guidTx);
    HRESULT OnTransactionCommit(COMSVCSEVENTINFO* pInfo, const(GUID)* guidTx);
}
enum IID_IComMethodEvents = GUID(0x683130a9, 0x2e50, 0x11d2, [0x98, 0xa5, 0x0, 0xc0, 0x4f, 0x8e, 0xe1, 0xc4]);
interface IComMethodEvents : IUnknown
{
    HRESULT OnMethodCall(COMSVCSEVENTINFO* pInfo, ulong oid, const(GUID)* guidCid, const(GUID)* guidRid, uint iMeth);
    HRESULT OnMethodReturn(COMSVCSEVENTINFO* pInfo, ulong oid, const(GUID)* guidCid, const(GUID)* guidRid, uint iMeth, HRESULT hresult);
    HRESULT OnMethodException(COMSVCSEVENTINFO* pInfo, ulong oid, const(GUID)* guidCid, const(GUID)* guidRid, uint iMeth);
}
enum IID_IComObjectEvents = GUID(0x683130aa, 0x2e50, 0x11d2, [0x98, 0xa5, 0x0, 0xc0, 0x4f, 0x8e, 0xe1, 0xc4]);
interface IComObjectEvents : IUnknown
{
    HRESULT OnObjectActivate(COMSVCSEVENTINFO* pInfo, ulong CtxtID, ulong ObjectID);
    HRESULT OnObjectDeactivate(COMSVCSEVENTINFO* pInfo, ulong CtxtID, ulong ObjectID);
    HRESULT OnDisableCommit(COMSVCSEVENTINFO* pInfo, ulong CtxtID);
    HRESULT OnEnableCommit(COMSVCSEVENTINFO* pInfo, ulong CtxtID);
    HRESULT OnSetComplete(COMSVCSEVENTINFO* pInfo, ulong CtxtID);
    HRESULT OnSetAbort(COMSVCSEVENTINFO* pInfo, ulong CtxtID);
}
enum IID_IComResourceEvents = GUID(0x683130ab, 0x2e50, 0x11d2, [0x98, 0xa5, 0x0, 0xc0, 0x4f, 0x8e, 0xe1, 0xc4]);
interface IComResourceEvents : IUnknown
{
    HRESULT OnResourceCreate(COMSVCSEVENTINFO* pInfo, ulong ObjectID, const(wchar)* pszType, ulong resId, BOOL enlisted);
    HRESULT OnResourceAllocate(COMSVCSEVENTINFO* pInfo, ulong ObjectID, const(wchar)* pszType, ulong resId, BOOL enlisted, uint NumRated, uint Rating);
    HRESULT OnResourceRecycle(COMSVCSEVENTINFO* pInfo, ulong ObjectID, const(wchar)* pszType, ulong resId);
    HRESULT OnResourceDestroy(COMSVCSEVENTINFO* pInfo, ulong ObjectID, HRESULT hr, const(wchar)* pszType, ulong resId);
    HRESULT OnResourceTrack(COMSVCSEVENTINFO* pInfo, ulong ObjectID, const(wchar)* pszType, ulong resId, BOOL enlisted);
}
enum IID_IComSecurityEvents = GUID(0x683130ac, 0x2e50, 0x11d2, [0x98, 0xa5, 0x0, 0xc0, 0x4f, 0x8e, 0xe1, 0xc4]);
interface IComSecurityEvents : IUnknown
{
    HRESULT OnAuthenticate(COMSVCSEVENTINFO* pInfo, const(GUID)* guidActivity, ulong ObjectID, const(GUID)* guidIID, uint iMeth, uint cbByteOrig, ubyte* pSidOriginalUser, uint cbByteCur, ubyte* pSidCurrentUser, BOOL bCurrentUserInpersonatingInProc);
    HRESULT OnAuthenticateFail(COMSVCSEVENTINFO* pInfo, const(GUID)* guidActivity, ulong ObjectID, const(GUID)* guidIID, uint iMeth, uint cbByteOrig, ubyte* pSidOriginalUser, uint cbByteCur, ubyte* pSidCurrentUser, BOOL bCurrentUserInpersonatingInProc);
}
enum IID_IComObjectPoolEvents = GUID(0x683130ad, 0x2e50, 0x11d2, [0x98, 0xa5, 0x0, 0xc0, 0x4f, 0x8e, 0xe1, 0xc4]);
interface IComObjectPoolEvents : IUnknown
{
    HRESULT OnObjPoolPutObject(COMSVCSEVENTINFO* pInfo, const(GUID)* guidObject, int nReason, uint dwAvailable, ulong oid);
    HRESULT OnObjPoolGetObject(COMSVCSEVENTINFO* pInfo, const(GUID)* guidActivity, const(GUID)* guidObject, uint dwAvailable, ulong oid);
    HRESULT OnObjPoolRecycleToTx(COMSVCSEVENTINFO* pInfo, const(GUID)* guidActivity, const(GUID)* guidObject, const(GUID)* guidTx, ulong objid);
    HRESULT OnObjPoolGetFromTx(COMSVCSEVENTINFO* pInfo, const(GUID)* guidActivity, const(GUID)* guidObject, const(GUID)* guidTx, ulong objid);
}
enum IID_IComObjectPoolEvents2 = GUID(0x683130ae, 0x2e50, 0x11d2, [0x98, 0xa5, 0x0, 0xc0, 0x4f, 0x8e, 0xe1, 0xc4]);
interface IComObjectPoolEvents2 : IUnknown
{
    HRESULT OnObjPoolCreateObject(COMSVCSEVENTINFO* pInfo, const(GUID)* guidObject, uint dwObjsCreated, ulong oid);
    HRESULT OnObjPoolDestroyObject(COMSVCSEVENTINFO* pInfo, const(GUID)* guidObject, uint dwObjsCreated, ulong oid);
    HRESULT OnObjPoolCreateDecision(COMSVCSEVENTINFO* pInfo, uint dwThreadsWaiting, uint dwAvail, uint dwCreated, uint dwMin, uint dwMax);
    HRESULT OnObjPoolTimeout(COMSVCSEVENTINFO* pInfo, const(GUID)* guidObject, const(GUID)* guidActivity, uint dwTimeout);
    HRESULT OnObjPoolCreatePool(COMSVCSEVENTINFO* pInfo, const(GUID)* guidObject, uint dwMin, uint dwMax, uint dwTimeout);
}
enum IID_IComObjectConstructionEvents = GUID(0x683130af, 0x2e50, 0x11d2, [0x98, 0xa5, 0x0, 0xc0, 0x4f, 0x8e, 0xe1, 0xc4]);
interface IComObjectConstructionEvents : IUnknown
{
    HRESULT OnObjectConstruct(COMSVCSEVENTINFO* pInfo, const(GUID)* guidObject, const(wchar)* sConstructString, ulong oid);
}
enum IID_IComActivityEvents = GUID(0x683130b0, 0x2e50, 0x11d2, [0x98, 0xa5, 0x0, 0xc0, 0x4f, 0x8e, 0xe1, 0xc4]);
interface IComActivityEvents : IUnknown
{
    HRESULT OnActivityCreate(COMSVCSEVENTINFO* pInfo, const(GUID)* guidActivity);
    HRESULT OnActivityDestroy(COMSVCSEVENTINFO* pInfo, const(GUID)* guidActivity);
    HRESULT OnActivityEnter(COMSVCSEVENTINFO* pInfo, const(GUID)* guidCurrent, const(GUID)* guidEntered, uint dwThread);
    HRESULT OnActivityTimeout(COMSVCSEVENTINFO* pInfo, const(GUID)* guidCurrent, const(GUID)* guidEntered, uint dwThread, uint dwTimeout);
    HRESULT OnActivityReenter(COMSVCSEVENTINFO* pInfo, const(GUID)* guidCurrent, uint dwThread, uint dwCallDepth);
    HRESULT OnActivityLeave(COMSVCSEVENTINFO* pInfo, const(GUID)* guidCurrent, const(GUID)* guidLeft);
    HRESULT OnActivityLeaveSame(COMSVCSEVENTINFO* pInfo, const(GUID)* guidCurrent, uint dwCallDepth);
}
enum IID_IComIdentityEvents = GUID(0x683130b1, 0x2e50, 0x11d2, [0x98, 0xa5, 0x0, 0xc0, 0x4f, 0x8e, 0xe1, 0xc4]);
interface IComIdentityEvents : IUnknown
{
    HRESULT OnIISRequestInfo(COMSVCSEVENTINFO* pInfo, ulong ObjId, const(wchar)* pszClientIP, const(wchar)* pszServerIP, const(wchar)* pszURL);
}
enum IID_IComQCEvents = GUID(0x683130b2, 0x2e50, 0x11d2, [0x98, 0xa5, 0x0, 0xc0, 0x4f, 0x8e, 0xe1, 0xc4]);
interface IComQCEvents : IUnknown
{
    HRESULT OnQCRecord(COMSVCSEVENTINFO* pInfo, ulong objid, PWSTR szQueue, const(GUID)* guidMsgId, const(GUID)* guidWorkFlowId, HRESULT msmqhr);
    HRESULT OnQCQueueOpen(COMSVCSEVENTINFO* pInfo, PWSTR szQueue, ulong QueueID, HRESULT hr);
    HRESULT OnQCReceive(COMSVCSEVENTINFO* pInfo, ulong QueueID, const(GUID)* guidMsgId, const(GUID)* guidWorkFlowId, HRESULT hr);
    HRESULT OnQCReceiveFail(COMSVCSEVENTINFO* pInfo, ulong QueueID, HRESULT msmqhr);
    HRESULT OnQCMoveToReTryQueue(COMSVCSEVENTINFO* pInfo, const(GUID)* guidMsgId, const(GUID)* guidWorkFlowId, uint RetryIndex);
    HRESULT OnQCMoveToDeadQueue(COMSVCSEVENTINFO* pInfo, const(GUID)* guidMsgId, const(GUID)* guidWorkFlowId);
    HRESULT OnQCPlayback(COMSVCSEVENTINFO* pInfo, ulong objid, const(GUID)* guidMsgId, const(GUID)* guidWorkFlowId, HRESULT hr);
}
enum IID_IComExceptionEvents = GUID(0x683130b3, 0x2e50, 0x11d2, [0x98, 0xa5, 0x0, 0xc0, 0x4f, 0x8e, 0xe1, 0xc4]);
interface IComExceptionEvents : IUnknown
{
    HRESULT OnExceptionUser(COMSVCSEVENTINFO* pInfo, uint code, ulong address, const(wchar)* pszStackTrace);
}
enum IID_ILBEvents = GUID(0x683130b4, 0x2e50, 0x11d2, [0x98, 0xa5, 0x0, 0xc0, 0x4f, 0x8e, 0xe1, 0xc4]);
interface ILBEvents : IUnknown
{
    HRESULT TargetUp(BSTR bstrServerName, BSTR bstrClsidEng);
    HRESULT TargetDown(BSTR bstrServerName, BSTR bstrClsidEng);
    HRESULT EngineDefined(BSTR bstrPropName, VARIANT* varPropValue, BSTR bstrClsidEng);
}
enum IID_IComCRMEvents = GUID(0x683130b5, 0x2e50, 0x11d2, [0x98, 0xa5, 0x0, 0xc0, 0x4f, 0x8e, 0xe1, 0xc4]);
interface IComCRMEvents : IUnknown
{
    HRESULT OnCRMRecoveryStart(COMSVCSEVENTINFO* pInfo, GUID guidApp);
    HRESULT OnCRMRecoveryDone(COMSVCSEVENTINFO* pInfo, GUID guidApp);
    HRESULT OnCRMCheckpoint(COMSVCSEVENTINFO* pInfo, GUID guidApp);
    HRESULT OnCRMBegin(COMSVCSEVENTINFO* pInfo, GUID guidClerkCLSID, GUID guidActivity, GUID guidTx, PWSTR szProgIdCompensator, PWSTR szDescription);
    HRESULT OnCRMPrepare(COMSVCSEVENTINFO* pInfo, GUID guidClerkCLSID);
    HRESULT OnCRMCommit(COMSVCSEVENTINFO* pInfo, GUID guidClerkCLSID);
    HRESULT OnCRMAbort(COMSVCSEVENTINFO* pInfo, GUID guidClerkCLSID);
    HRESULT OnCRMIndoubt(COMSVCSEVENTINFO* pInfo, GUID guidClerkCLSID);
    HRESULT OnCRMDone(COMSVCSEVENTINFO* pInfo, GUID guidClerkCLSID);
    HRESULT OnCRMRelease(COMSVCSEVENTINFO* pInfo, GUID guidClerkCLSID);
    HRESULT OnCRMAnalyze(COMSVCSEVENTINFO* pInfo, GUID guidClerkCLSID, uint dwCrmRecordType, uint dwRecordSize);
    HRESULT OnCRMWrite(COMSVCSEVENTINFO* pInfo, GUID guidClerkCLSID, BOOL fVariants, uint dwRecordSize);
    HRESULT OnCRMForget(COMSVCSEVENTINFO* pInfo, GUID guidClerkCLSID);
    HRESULT OnCRMForce(COMSVCSEVENTINFO* pInfo, GUID guidClerkCLSID);
    HRESULT OnCRMDeliver(COMSVCSEVENTINFO* pInfo, GUID guidClerkCLSID, BOOL fVariants, uint dwRecordSize);
}
enum IID_IComMethod2Events = GUID(0xfb388aaa, 0x567d, 0x4024, [0xaf, 0x8e, 0x6e, 0x93, 0xee, 0x74, 0x85, 0x73]);
interface IComMethod2Events : IUnknown
{
    HRESULT OnMethodCall2(COMSVCSEVENTINFO* pInfo, ulong oid, const(GUID)* guidCid, const(GUID)* guidRid, uint dwThread, uint iMeth);
    HRESULT OnMethodReturn2(COMSVCSEVENTINFO* pInfo, ulong oid, const(GUID)* guidCid, const(GUID)* guidRid, uint dwThread, uint iMeth, HRESULT hresult);
    HRESULT OnMethodException2(COMSVCSEVENTINFO* pInfo, ulong oid, const(GUID)* guidCid, const(GUID)* guidRid, uint dwThread, uint iMeth);
}
enum IID_IComTrackingInfoEvents = GUID(0x4e6cdcc9, 0xfb25, 0x4fd5, [0x9c, 0xc5, 0xc9, 0xf4, 0xb6, 0x55, 0x9c, 0xec]);
interface IComTrackingInfoEvents : IUnknown
{
    HRESULT OnNewTrackingInfo(IUnknown pToplevelCollection);
}
alias TRACKING_COLL_TYPE = int;
enum : int
{
    TRKCOLL_PROCESSES    = 0x00000000,
    TRKCOLL_APPLICATIONS = 0x00000001,
    TRKCOLL_COMPONENTS   = 0x00000002,
}

enum IID_IComTrackingInfoCollection = GUID(0xc266c677, 0xc9ad, 0x49ab, [0x9f, 0xd9, 0xd9, 0x66, 0x10, 0x78, 0x58, 0x8a]);
interface IComTrackingInfoCollection : IUnknown
{
    HRESULT Type(TRACKING_COLL_TYPE* pType);
    HRESULT Count(uint* pCount);
    HRESULT Item(uint ulIndex, const(GUID)* riid, void** ppv);
}
enum IID_IComTrackingInfoObject = GUID(0x116e42c5, 0xd8b1, 0x47bf, [0xab, 0x1e, 0xc8, 0x95, 0xed, 0x3e, 0x23, 0x72]);
interface IComTrackingInfoObject : IUnknown
{
    HRESULT GetValue(PWSTR szPropertyName, VARIANT* pvarOut);
}
enum IID_IComTrackingInfoProperties = GUID(0x789b42be, 0x6f6b, 0x443a, [0x89, 0x8e, 0x67, 0xab, 0xf3, 0x90, 0xaa, 0x14]);
interface IComTrackingInfoProperties : IUnknown
{
    HRESULT PropCount(uint* pCount);
    HRESULT GetPropName(uint ulIndex, PWSTR* ppszPropName);
}
enum IID_IComApp2Events = GUID(0x1290bc1a, 0xb219, 0x418d, [0xb0, 0x78, 0x59, 0x34, 0xde, 0xd0, 0x82, 0x42]);
interface IComApp2Events : IUnknown
{
    HRESULT OnAppActivation2(COMSVCSEVENTINFO* pInfo, GUID guidApp, GUID guidProcess);
    HRESULT OnAppShutdown2(COMSVCSEVENTINFO* pInfo, GUID guidApp);
    HRESULT OnAppForceShutdown2(COMSVCSEVENTINFO* pInfo, GUID guidApp);
    HRESULT OnAppPaused2(COMSVCSEVENTINFO* pInfo, GUID guidApp, BOOL bPaused);
    HRESULT OnAppRecycle2(COMSVCSEVENTINFO* pInfo, GUID guidApp, GUID guidProcess, int lReason);
}
enum IID_IComTransaction2Events = GUID(0xa136f62a, 0x2f94, 0x4288, [0x86, 0xe0, 0xd8, 0xa1, 0xfa, 0x4c, 0x2, 0x99]);
interface IComTransaction2Events : IUnknown
{
    HRESULT OnTransactionStart2(COMSVCSEVENTINFO* pInfo, const(GUID)* guidTx, const(GUID)* tsid, BOOL fRoot, int nIsolationLevel);
    HRESULT OnTransactionPrepare2(COMSVCSEVENTINFO* pInfo, const(GUID)* guidTx, BOOL fVoteYes);
    HRESULT OnTransactionAbort2(COMSVCSEVENTINFO* pInfo, const(GUID)* guidTx);
    HRESULT OnTransactionCommit2(COMSVCSEVENTINFO* pInfo, const(GUID)* guidTx);
}
enum IID_IComInstance2Events = GUID(0x20e3bf07, 0xb506, 0x4ad5, [0xa5, 0xc, 0xd2, 0xca, 0x5b, 0x9c, 0x15, 0x8e]);
interface IComInstance2Events : IUnknown
{
    HRESULT OnObjectCreate2(COMSVCSEVENTINFO* pInfo, const(GUID)* guidActivity, const(GUID)* clsid, const(GUID)* tsid, ulong CtxtID, ulong ObjectID, const(GUID)* guidPartition);
    HRESULT OnObjectDestroy2(COMSVCSEVENTINFO* pInfo, ulong CtxtID);
}
enum IID_IComObjectPool2Events = GUID(0x65bf6534, 0x85ea, 0x4f64, [0x8c, 0xf4, 0x3d, 0x97, 0x4b, 0x2a, 0xb1, 0xcf]);
interface IComObjectPool2Events : IUnknown
{
    HRESULT OnObjPoolPutObject2(COMSVCSEVENTINFO* pInfo, const(GUID)* guidObject, int nReason, uint dwAvailable, ulong oid);
    HRESULT OnObjPoolGetObject2(COMSVCSEVENTINFO* pInfo, const(GUID)* guidActivity, const(GUID)* guidObject, uint dwAvailable, ulong oid, const(GUID)* guidPartition);
    HRESULT OnObjPoolRecycleToTx2(COMSVCSEVENTINFO* pInfo, const(GUID)* guidActivity, const(GUID)* guidObject, const(GUID)* guidTx, ulong objid);
    HRESULT OnObjPoolGetFromTx2(COMSVCSEVENTINFO* pInfo, const(GUID)* guidActivity, const(GUID)* guidObject, const(GUID)* guidTx, ulong objid, const(GUID)* guidPartition);
}
enum IID_IComObjectConstruction2Events = GUID(0x4b5a7827, 0x8df2, 0x45c0, [0x8f, 0x6f, 0x57, 0xea, 0x1f, 0x85, 0x6a, 0x9f]);
interface IComObjectConstruction2Events : IUnknown
{
    HRESULT OnObjectConstruct2(COMSVCSEVENTINFO* pInfo, const(GUID)* guidObject, const(wchar)* sConstructString, ulong oid, const(GUID)* guidPartition);
}
enum IID_ISystemAppEventData = GUID(0xd6d48a3c, 0xd5c5, 0x49e7, [0x8c, 0x74, 0x99, 0xe4, 0x88, 0x9e, 0xd5, 0x2f]);
interface ISystemAppEventData : IUnknown
{
    HRESULT Startup();
    HRESULT OnDataChanged(uint dwPID, uint dwMask, uint dwNumberSinks, BSTR bstrDwMethodMask, uint dwReason, ulong u64TraceHandle);
}
enum IID_IMtsEvents = GUID(0xbacedf4d, 0x74ab, 0x11d0, [0xb1, 0x62, 0x0, 0xaa, 0x0, 0xba, 0x32, 0x58]);
interface IMtsEvents : IDispatch
{
    HRESULT get_PackageName(BSTR* pVal);
    HRESULT get_PackageGuid(BSTR* pVal);
    HRESULT PostEvent(VARIANT* vEvent);
    HRESULT get_FireEvents(VARIANT_BOOL* pVal);
    HRESULT GetProcessID(int* id);
}
enum IID_IMtsEventInfo = GUID(0xd56c3dc1, 0x8482, 0x11d0, [0xb1, 0x70, 0x0, 0xaa, 0x0, 0xba, 0x32, 0x58]);
interface IMtsEventInfo : IDispatch
{
    HRESULT get_Names(IUnknown* pUnk);
    HRESULT get_DisplayName(BSTR* sDisplayName);
    HRESULT get_EventID(BSTR* sGuidEventID);
    HRESULT get_Count(int* lCount);
    HRESULT get_Value(BSTR sKey, VARIANT* pVal);
}
enum IID_IMTSLocator = GUID(0xd19b8bfd, 0x7f88, 0x11d0, [0xb1, 0x6e, 0x0, 0xaa, 0x0, 0xba, 0x32, 0x58]);
interface IMTSLocator : IDispatch
{
    HRESULT GetEventDispatcher(IUnknown* pUnk);
}
enum IID_IMtsGrp = GUID(0x4b2e958c, 0x393, 0x11d1, [0xb1, 0xab, 0x0, 0xaa, 0x0, 0xba, 0x32, 0x58]);
interface IMtsGrp : IDispatch
{
    HRESULT get_Count(int* pVal);
    HRESULT Item(int lIndex, IUnknown* ppUnkDispatcher);
    HRESULT Refresh();
}
enum IID_IMessageMover = GUID(0x588a085a, 0xb795, 0x11d1, [0x80, 0x54, 0x0, 0xc0, 0x4f, 0xc3, 0x40, 0xee]);
interface IMessageMover : IDispatch
{
    HRESULT get_SourcePath(BSTR* pVal);
    HRESULT put_SourcePath(BSTR newVal);
    HRESULT get_DestPath(BSTR* pVal);
    HRESULT put_DestPath(BSTR newVal);
    HRESULT get_CommitBatchSize(int* pVal);
    HRESULT put_CommitBatchSize(int newVal);
    HRESULT MoveMessages(int* plMessagesMoved);
}
enum IID_IEventServerTrace = GUID(0x9a9f12b8, 0x80af, 0x47ab, [0xa5, 0x79, 0x35, 0xea, 0x57, 0x72, 0x53, 0x70]);
interface IEventServerTrace : IDispatch
{
    HRESULT StartTraceGuid(BSTR bstrguidEvent, BSTR bstrguidFilter, int lPidFilter);
    HRESULT StopTraceGuid(BSTR bstrguidEvent, BSTR bstrguidFilter, int lPidFilter);
    HRESULT EnumTraceGuid(int* plCntGuids, BSTR* pbstrGuidList);
}
struct RECYCLE_INFO
{
    GUID guidCombaseProcessIdentifier;
    long ProcessStartTime;
    uint dwRecycleLifetimeLimit;
    uint dwRecycleMemoryLimit;
    uint dwRecycleExpirationTimeout;
}
alias DUMPTYPE = int;
enum : int
{
    DUMPTYPE_FULL = 0x00000000,
    DUMPTYPE_MINI = 0x00000001,
    DUMPTYPE_NONE = 0x00000002,
}

struct HANG_INFO
{
    BOOL fAppHangMonitorEnabled;
    BOOL fTerminateOnHang;
    DUMPTYPE DumpType;
    uint dwHangTimeout;
    uint dwDumpCount;
    uint dwInfoMsgCount;
}
alias COMPLUS_APPTYPE = int;
enum : int
{
    APPTYPE_UNKNOWN = 0xffffffff,
    APPTYPE_SERVER  = 0x00000001,
    APPTYPE_LIBRARY = 0x00000000,
    APPTYPE_SWC     = 0x00000002,
}

struct APPSTATISTICS
{
    uint m_cTotalCalls;
    uint m_cTotalInstances;
    uint m_cTotalClasses;
    uint m_cCallsPerSecond;
}
struct APPDATA
{
    uint m_idApp;
    wchar[40] m_szAppGuid;
    uint m_dwAppProcessId;
    APPSTATISTICS m_AppStatistics;
}
struct CLSIDDATA
{
    GUID m_clsid;
    uint m_cReferences;
    uint m_cBound;
    uint m_cPooled;
    uint m_cInCall;
    uint m_dwRespTime;
    uint m_cCallsCompleted;
    uint m_cCallsFailed;
}
struct CLSIDDATA2
{
    GUID m_clsid;
    GUID m_appid;
    GUID m_partid;
    PWSTR m_pwszAppName;
    PWSTR m_pwszCtxName;
    COMPLUS_APPTYPE m_eAppType;
    uint m_cReferences;
    uint m_cBound;
    uint m_cPooled;
    uint m_cInCall;
    uint m_dwRespTime;
    uint m_cCallsCompleted;
    uint m_cCallsFailed;
}
alias GetAppTrackerDataFlags = int;
enum : int
{
    GATD_INCLUDE_PROCESS_EXE_NAME = 0x00000001,
    GATD_INCLUDE_LIBRARY_APPS     = 0x00000002,
    GATD_INCLUDE_SWC              = 0x00000004,
    GATD_INCLUDE_CLASS_NAME       = 0x00000008,
    GATD_INCLUDE_APPLICATION_NAME = 0x00000010,
}

struct ApplicationProcessSummary
{
    GUID PartitionIdPrimaryApplication;
    GUID ApplicationIdPrimaryApplication;
    GUID ApplicationInstanceId;
    uint ProcessId;
    COMPLUS_APPTYPE Type;
    PWSTR ProcessExeName;
    BOOL IsService;
    BOOL IsPaused;
    BOOL IsRecycled;
}
struct ApplicationProcessStatistics
{
    uint NumCallsOutstanding;
    uint NumTrackedComponents;
    uint NumComponentInstances;
    uint AvgCallsPerSecond;
    uint Reserved1;
    uint Reserved2;
    uint Reserved3;
    uint Reserved4;
}
struct ApplicationProcessRecycleInfo
{
    BOOL IsRecyclable;
    BOOL IsRecycled;
    FILETIME TimeRecycled;
    FILETIME TimeToTerminate;
    int RecycleReasonCode;
    BOOL IsPendingRecycle;
    BOOL HasAutomaticLifetimeRecycling;
    FILETIME TimeForAutomaticRecycling;
    uint MemoryLimitInKB;
    uint MemoryUsageInKBLastCheck;
    uint ActivationLimit;
    uint NumActivationsLastReported;
    uint CallLimit;
    uint NumCallsLastReported;
}
struct ApplicationSummary
{
    GUID ApplicationInstanceId;
    GUID PartitionId;
    GUID ApplicationId;
    COMPLUS_APPTYPE Type;
    PWSTR ApplicationName;
    uint NumTrackedComponents;
    uint NumComponentInstances;
}
struct ComponentSummary
{
    GUID ApplicationInstanceId;
    GUID PartitionId;
    GUID ApplicationId;
    GUID Clsid;
    PWSTR ClassName;
    PWSTR ApplicationName;
}
struct ComponentStatistics
{
    uint NumInstances;
    uint NumBoundReferences;
    uint NumPooledObjects;
    uint NumObjectsInCall;
    uint AvgResponseTimeInMs;
    uint NumCallsCompletedRecent;
    uint NumCallsFailedRecent;
    uint NumCallsCompletedTotal;
    uint NumCallsFailedTotal;
    uint Reserved1;
    uint Reserved2;
    uint Reserved3;
    uint Reserved4;
}
struct ComponentHangMonitorInfo
{
    BOOL IsMonitored;
    BOOL TerminateOnHang;
    uint AvgCallThresholdInMs;
}
enum IID_IGetAppTrackerData = GUID(0x507c3ac8, 0x3e12, 0x4cb0, [0x93, 0x66, 0x65, 0x3d, 0x3e, 0x5, 0x6, 0x38]);
interface IGetAppTrackerData : IUnknown
{
    HRESULT GetApplicationProcesses(const(GUID)* PartitionId, const(GUID)* ApplicationId, uint Flags, uint* NumApplicationProcesses, ApplicationProcessSummary** ApplicationProcesses);
    HRESULT GetApplicationProcessDetails(const(GUID)* ApplicationInstanceId, uint ProcessId, uint Flags, ApplicationProcessSummary* Summary, ApplicationProcessStatistics* Statistics, ApplicationProcessRecycleInfo* RecycleInfo, BOOL* AnyComponentsHangMonitored);
    HRESULT GetApplicationsInProcess(const(GUID)* ApplicationInstanceId, uint ProcessId, const(GUID)* PartitionId, uint Flags, uint* NumApplicationsInProcess, ApplicationSummary** Applications);
    HRESULT GetComponentsInProcess(const(GUID)* ApplicationInstanceId, uint ProcessId, const(GUID)* PartitionId, const(GUID)* ApplicationId, uint Flags, uint* NumComponentsInProcess, ComponentSummary** Components);
    HRESULT GetComponentDetails(const(GUID)* ApplicationInstanceId, uint ProcessId, const(GUID)* Clsid, uint Flags, ComponentSummary* Summary, ComponentStatistics* Statistics, ComponentHangMonitorInfo* HangMonitorInfo);
    HRESULT GetTrackerDataAsCollectionObject(IUnknown* TopLevelCollection);
    HRESULT GetSuggestedPollingInterval(uint* PollingIntervalInSeconds);
}
enum IID_IDispenserManager = GUID(0x5cb31e10, 0x2b5f, 0x11cf, [0xbe, 0x10, 0x0, 0xaa, 0x0, 0xa2, 0xfa, 0x25]);
interface IDispenserManager : IUnknown
{
    HRESULT RegisterDispenser(IDispenserDriver __MIDL__IDispenserManager0000, const(wchar)* szDispenserName, IHolder* __MIDL__IDispenserManager0001);
    HRESULT GetContext(ulong* __MIDL__IDispenserManager0002, ulong* __MIDL__IDispenserManager0003);
}
enum IID_IHolder = GUID(0xbf6a1850, 0x2b45, 0x11cf, [0xbe, 0x10, 0x0, 0xaa, 0x0, 0xa2, 0xfa, 0x25]);
interface IHolder : IUnknown
{
    HRESULT AllocResource(const(ulong) __MIDL__IHolder0000, ulong* __MIDL__IHolder0001);
    HRESULT FreeResource(const(ulong) __MIDL__IHolder0002);
    HRESULT TrackResource(const(ulong) __MIDL__IHolder0003);
    HRESULT TrackResourceS(ushort* __MIDL__IHolder0004);
    HRESULT UntrackResource(const(ulong) __MIDL__IHolder0005, const(BOOL) __MIDL__IHolder0006);
    HRESULT UntrackResourceS(ushort* __MIDL__IHolder0007, const(BOOL) __MIDL__IHolder0008);
    HRESULT Close();
    HRESULT RequestDestroyResource(const(ulong) __MIDL__IHolder0009);
}
enum IID_IDispenserDriver = GUID(0x208b3651, 0x2b48, 0x11cf, [0xbe, 0x10, 0x0, 0xaa, 0x0, 0xa2, 0xfa, 0x25]);
interface IDispenserDriver : IUnknown
{
    HRESULT CreateResource(const(ulong) ResTypId, ulong* pResId, int* pSecsFreeBeforeDestroy);
    HRESULT RateResource(const(ulong) ResTypId, const(ulong) ResId, const(BOOL) fRequiresTransactionEnlistment, uint* pRating);
    HRESULT EnlistResource(const(ulong) ResId, const(ulong) TransId);
    HRESULT ResetResource(const(ulong) ResId);
    HRESULT DestroyResource(const(ulong) ResId);
    HRESULT DestroyResourceS(ushort* ResId);
}
enum IID_ITransactionProxy = GUID(0x2558374, 0xdf2e, 0x4dae, [0xbd, 0x6b, 0x1d, 0x5c, 0x99, 0x4f, 0x9b, 0xdc]);
interface ITransactionProxy : IUnknown
{
    HRESULT Commit(GUID guid);
    HRESULT Abort();
    HRESULT Promote(ITransaction* pTransaction);
    HRESULT CreateVoter(ITransactionVoterNotifyAsync2 pTxAsync, ITransactionVoterBallotAsync2* ppBallot);
    HRESULT GetIsolationLevel(int* __MIDL__ITransactionProxy0000);
    HRESULT GetIdentifier(GUID* pbstrIdentifier);
    HRESULT IsReusable(BOOL* pfIsReusable);
}
enum IID_IContextSecurityPerimeter = GUID(0xa7549a29, 0xa7c4, 0x42e1, [0x8d, 0xc1, 0x7e, 0x3d, 0x74, 0x8d, 0xc2, 0x4a]);
interface IContextSecurityPerimeter : IUnknown
{
    HRESULT GetPerimeterFlag(BOOL* pFlag);
    HRESULT SetPerimeterFlag(BOOL fFlag);
}
enum IID_ITxProxyHolder = GUID(0x13d86f31, 0x139, 0x41af, [0xbc, 0xad, 0xc7, 0xd5, 0x4, 0x35, 0xfe, 0x9f]);
interface ITxProxyHolder : IUnknown
{
    void GetIdentifier(GUID* pGuidLtx);
}
enum IID_IObjectContext = GUID(0x51372ae0, 0xcae7, 0x11cf, [0xbe, 0x81, 0x0, 0xaa, 0x0, 0xa2, 0xfa, 0x25]);
interface IObjectContext : IUnknown
{
    HRESULT CreateInstance(const(GUID)* rclsid, const(GUID)* riid, void** ppv);
    HRESULT SetComplete();
    HRESULT SetAbort();
    HRESULT EnableCommit();
    HRESULT DisableCommit();
    BOOL IsInTransaction();
    BOOL IsSecurityEnabled();
    HRESULT IsCallerInRole(BSTR bstrRole, BOOL* pfIsInRole);
}
enum IID_IObjectControl = GUID(0x51372aec, 0xcae7, 0x11cf, [0xbe, 0x81, 0x0, 0xaa, 0x0, 0xa2, 0xfa, 0x25]);
interface IObjectControl : IUnknown
{
    HRESULT Activate();
    void Deactivate();
    BOOL CanBePooled();
}
enum IID_IEnumNames = GUID(0x51372af2, 0xcae7, 0x11cf, [0xbe, 0x81, 0x0, 0xaa, 0x0, 0xa2, 0xfa, 0x25]);
interface IEnumNames : IUnknown
{
    HRESULT Next(uint celt, BSTR* rgname, uint* pceltFetched);
    HRESULT Skip(uint celt);
    HRESULT Reset();
    HRESULT Clone(IEnumNames* ppenum);
}
enum IID_ISecurityProperty = GUID(0x51372aea, 0xcae7, 0x11cf, [0xbe, 0x81, 0x0, 0xaa, 0x0, 0xa2, 0xfa, 0x25]);
interface ISecurityProperty : IUnknown
{
    HRESULT GetDirectCreatorSID(PSID* pSID);
    HRESULT GetOriginalCreatorSID(PSID* pSID);
    HRESULT GetDirectCallerSID(PSID* pSID);
    HRESULT GetOriginalCallerSID(PSID* pSID);
    HRESULT ReleaseSID(PSID pSID);
}
enum IID_ObjectControl = GUID(0x7dc41850, 0xc31, 0x11d0, [0x8b, 0x79, 0x0, 0xaa, 0x0, 0xb8, 0xa7, 0x90]);
interface ObjectControl : IUnknown
{
    HRESULT Activate();
    HRESULT Deactivate();
    HRESULT CanBePooled(VARIANT_BOOL* pbPoolable);
}
enum IID_ISharedProperty = GUID(0x2a005c01, 0xa5de, 0x11cf, [0x9e, 0x66, 0x0, 0xaa, 0x0, 0xa3, 0xf4, 0x64]);
interface ISharedProperty : IDispatch
{
    HRESULT get_Value(VARIANT* pVal);
    HRESULT put_Value(VARIANT val);
}
enum IID_ISharedPropertyGroup = GUID(0x2a005c07, 0xa5de, 0x11cf, [0x9e, 0x66, 0x0, 0xaa, 0x0, 0xa3, 0xf4, 0x64]);
interface ISharedPropertyGroup : IDispatch
{
    HRESULT CreatePropertyByPosition(int Index, VARIANT_BOOL* fExists, ISharedProperty* ppProp);
    HRESULT get_PropertyByPosition(int Index, ISharedProperty* ppProperty);
    HRESULT CreateProperty(BSTR Name, VARIANT_BOOL* fExists, ISharedProperty* ppProp);
    HRESULT get_Property(BSTR Name, ISharedProperty* ppProperty);
}
enum IID_ISharedPropertyGroupManager = GUID(0x2a005c0d, 0xa5de, 0x11cf, [0x9e, 0x66, 0x0, 0xaa, 0x0, 0xa3, 0xf4, 0x64]);
interface ISharedPropertyGroupManager : IDispatch
{
    HRESULT CreatePropertyGroup(BSTR Name, int* dwIsoMode, int* dwRelMode, VARIANT_BOOL* fExists, ISharedPropertyGroup* ppGroup);
    HRESULT get_Group(BSTR Name, ISharedPropertyGroup* ppGroup);
    HRESULT get__NewEnum(IUnknown* retval);
}
enum IID_IObjectConstruct = GUID(0x41c4f8b3, 0x7439, 0x11d2, [0x98, 0xcb, 0x0, 0xc0, 0x4f, 0x8e, 0xe1, 0xc4]);
interface IObjectConstruct : IUnknown
{
    HRESULT Construct(IDispatch pCtorObj);
}
enum IID_IObjectConstructString = GUID(0x41c4f8b2, 0x7439, 0x11d2, [0x98, 0xcb, 0x0, 0xc0, 0x4f, 0x8e, 0xe1, 0xc4]);
interface IObjectConstructString : IDispatch
{
    HRESULT get_ConstructString(BSTR* pVal);
}
enum IID_IObjectContextActivity = GUID(0x51372afc, 0xcae7, 0x11cf, [0xbe, 0x81, 0x0, 0xaa, 0x0, 0xa2, 0xfa, 0x25]);
interface IObjectContextActivity : IUnknown
{
    HRESULT GetActivityId(GUID* pGUID);
}
enum IID_IObjectContextInfo = GUID(0x75b52ddb, 0xe8ed, 0x11d1, [0x93, 0xad, 0x0, 0xaa, 0x0, 0xba, 0x32, 0x58]);
interface IObjectContextInfo : IUnknown
{
    BOOL IsInTransaction();
    HRESULT GetTransaction(IUnknown* pptrans);
    HRESULT GetTransactionId(GUID* pGuid);
    HRESULT GetActivityId(GUID* pGUID);
    HRESULT GetContextId(GUID* pGuid);
}
enum IID_IObjectContextInfo2 = GUID(0x594be71a, 0x4bc4, 0x438b, [0x91, 0x97, 0xcf, 0xd1, 0x76, 0x24, 0x8b, 0x9]);
interface IObjectContextInfo2 : IObjectContextInfo
{
    HRESULT GetPartitionId(GUID* pGuid);
    HRESULT GetApplicationId(GUID* pGuid);
    HRESULT GetApplicationInstanceId(GUID* pGuid);
}
enum IID_ITransactionStatus = GUID(0x61f589e8, 0x3724, 0x4898, [0xa0, 0xa4, 0x66, 0x4a, 0xe9, 0xe1, 0xd1, 0xb4]);
interface ITransactionStatus : IUnknown
{
    HRESULT SetTransactionStatus(HRESULT hrStatus);
    HRESULT GetTransactionStatus(HRESULT* pHrStatus);
}
enum IID_IObjectContextTip = GUID(0x92fd41ca, 0xbad9, 0x11d2, [0x9a, 0x2d, 0x0, 0xc0, 0x4f, 0x79, 0x7b, 0xc9]);
interface IObjectContextTip : IUnknown
{
    HRESULT GetTipUrl(BSTR* pTipUrl);
}
enum IID_IPlaybackControl = GUID(0x51372afd, 0xcae7, 0x11cf, [0xbe, 0x81, 0x0, 0xaa, 0x0, 0xa2, 0xfa, 0x25]);
interface IPlaybackControl : IUnknown
{
    HRESULT FinalClientRetry();
    HRESULT FinalServerRetry();
}
enum IID_IGetContextProperties = GUID(0x51372af4, 0xcae7, 0x11cf, [0xbe, 0x81, 0x0, 0xaa, 0x0, 0xa2, 0xfa, 0x25]);
interface IGetContextProperties : IUnknown
{
    HRESULT Count(int* plCount);
    HRESULT GetProperty(BSTR name, VARIANT* pProperty);
    HRESULT EnumNames(IEnumNames* ppenum);
}
alias TransactionVote = int;
enum : int
{
    TxCommit = 0x00000000,
    TxAbort  = 0x00000001,
}

enum IID_IContextState = GUID(0x3c05e54b, 0xa42a, 0x11d2, [0xaf, 0xc4, 0x0, 0xc0, 0x4f, 0x8e, 0xe1, 0xc4]);
interface IContextState : IUnknown
{
    HRESULT SetDeactivateOnReturn(VARIANT_BOOL bDeactivate);
    HRESULT GetDeactivateOnReturn(VARIANT_BOOL* pbDeactivate);
    HRESULT SetMyTransactionVote(TransactionVote txVote);
    HRESULT GetMyTransactionVote(TransactionVote* ptxVote);
}
enum IID_IPoolManager = GUID(0xa469861, 0x5a91, 0x43a0, [0x99, 0xb6, 0xd5, 0xe1, 0x79, 0xbb, 0x6, 0x31]);
interface IPoolManager : IDispatch
{
    HRESULT ShutdownPool(BSTR CLSIDOrProgID);
}
enum IID_ISelectCOMLBServer = GUID(0xdcf443f4, 0x3f8a, 0x4872, [0xb9, 0xf0, 0x36, 0x9a, 0x79, 0x6d, 0x12, 0xd6]);
interface ISelectCOMLBServer : IUnknown
{
    HRESULT Init();
    HRESULT GetLBServer(IUnknown pUnk);
}
enum IID_ICOMLBArguments = GUID(0x3a0f150f, 0x8ee5, 0x4b94, [0xb4, 0xe, 0xae, 0xf2, 0xf9, 0xe4, 0x2e, 0xd2]);
interface ICOMLBArguments : IUnknown
{
    HRESULT GetCLSID(GUID* pCLSID);
    HRESULT SetCLSID(GUID* pCLSID);
    HRESULT GetMachineName(uint cchSvr, PWSTR szServerName);
    HRESULT SetMachineName(uint cchSvr, PWSTR szServerName);
}
enum IID_ICrmLogControl = GUID(0xa0e174b3, 0xd26e, 0x11d2, [0x8f, 0x84, 0x0, 0x80, 0x5f, 0xc7, 0xbc, 0xd9]);
interface ICrmLogControl : IUnknown
{
    HRESULT get_TransactionUOW(BSTR* pVal);
    HRESULT RegisterCompensator(const(wchar)* lpcwstrProgIdCompensator, const(wchar)* lpcwstrDescription, int lCrmRegFlags);
    HRESULT WriteLogRecordVariants(VARIANT* pLogRecord);
    HRESULT ForceLog();
    HRESULT ForgetLogRecord();
    HRESULT ForceTransactionToAbort();
    HRESULT WriteLogRecord(BLOB* rgBlob, uint cBlob);
}
enum IID_ICrmCompensatorVariants = GUID(0xf0baf8e4, 0x7804, 0x11d1, [0x82, 0xe9, 0x0, 0xa0, 0xc9, 0x1e, 0xed, 0xe9]);
interface ICrmCompensatorVariants : IUnknown
{
    HRESULT SetLogControlVariants(ICrmLogControl pLogControl);
    HRESULT BeginPrepareVariants();
    HRESULT PrepareRecordVariants(VARIANT* pLogRecord, VARIANT_BOOL* pbForget);
    HRESULT EndPrepareVariants(VARIANT_BOOL* pbOkToPrepare);
    HRESULT BeginCommitVariants(VARIANT_BOOL bRecovery);
    HRESULT CommitRecordVariants(VARIANT* pLogRecord, VARIANT_BOOL* pbForget);
    HRESULT EndCommitVariants();
    HRESULT BeginAbortVariants(VARIANT_BOOL bRecovery);
    HRESULT AbortRecordVariants(VARIANT* pLogRecord, VARIANT_BOOL* pbForget);
    HRESULT EndAbortVariants();
}
struct CrmLogRecordRead
{
    uint dwCrmFlags;
    uint dwSequenceNumber;
    BLOB blobUserData;
}
enum IID_ICrmCompensator = GUID(0xbbc01830, 0x8d3b, 0x11d1, [0x82, 0xec, 0x0, 0xa0, 0xc9, 0x1e, 0xed, 0xe9]);
interface ICrmCompensator : IUnknown
{
    HRESULT SetLogControl(ICrmLogControl pLogControl);
    HRESULT BeginPrepare();
    HRESULT PrepareRecord(CrmLogRecordRead crmLogRec, BOOL* pfForget);
    HRESULT EndPrepare(BOOL* pfOkToPrepare);
    HRESULT BeginCommit(BOOL fRecovery);
    HRESULT CommitRecord(CrmLogRecordRead crmLogRec, BOOL* pfForget);
    HRESULT EndCommit();
    HRESULT BeginAbort(BOOL fRecovery);
    HRESULT AbortRecord(CrmLogRecordRead crmLogRec, BOOL* pfForget);
    HRESULT EndAbort();
}
alias CrmTransactionState = int;
enum : int
{
    TxState_Active    = 0x00000000,
    TxState_Committed = 0x00000001,
    TxState_Aborted   = 0x00000002,
    TxState_Indoubt   = 0x00000003,
}

enum IID_ICrmMonitorLogRecords = GUID(0x70c8e441, 0xc7ed, 0x11d1, [0x82, 0xfb, 0x0, 0xa0, 0xc9, 0x1e, 0xed, 0xe9]);
interface ICrmMonitorLogRecords : IUnknown
{
    HRESULT get_Count(int* pVal);
    HRESULT get_TransactionState(CrmTransactionState* pVal);
    HRESULT get_StructuredRecords(VARIANT_BOOL* pVal);
    HRESULT GetLogRecord(uint dwIndex, CrmLogRecordRead* pCrmLogRec);
    HRESULT GetLogRecordVariants(VARIANT IndexNumber, VARIANT* pLogRecord);
}
enum IID_ICrmMonitorClerks = GUID(0x70c8e442, 0xc7ed, 0x11d1, [0x82, 0xfb, 0x0, 0xa0, 0xc9, 0x1e, 0xed, 0xe9]);
interface ICrmMonitorClerks : IDispatch
{
    HRESULT Item(VARIANT Index, VARIANT* pItem);
    HRESULT get__NewEnum(IUnknown* pVal);
    HRESULT get_Count(int* pVal);
    HRESULT ProgIdCompensator(VARIANT Index, VARIANT* pItem);
    HRESULT Description(VARIANT Index, VARIANT* pItem);
    HRESULT TransactionUOW(VARIANT Index, VARIANT* pItem);
    HRESULT ActivityId(VARIANT Index, VARIANT* pItem);
}
enum IID_ICrmMonitor = GUID(0x70c8e443, 0xc7ed, 0x11d1, [0x82, 0xfb, 0x0, 0xa0, 0xc9, 0x1e, 0xed, 0xe9]);
interface ICrmMonitor : IUnknown
{
    HRESULT GetClerks(ICrmMonitorClerks* pClerks);
    HRESULT HoldClerk(VARIANT Index, VARIANT* pItem);
}
enum IID_ICrmFormatLogRecords = GUID(0x9c51d821, 0xc98b, 0x11d1, [0x82, 0xfb, 0x0, 0xa0, 0xc9, 0x1e, 0xed, 0xe9]);
interface ICrmFormatLogRecords : IUnknown
{
    HRESULT GetColumnCount(int* plColumnCount);
    HRESULT GetColumnHeaders(VARIANT* pHeaders);
    HRESULT GetColumn(CrmLogRecordRead CrmLogRec, VARIANT* pFormattedLogRecord);
    HRESULT GetColumnVariants(VARIANT LogRecord, VARIANT* pFormattedLogRecord);
}
alias CSC_InheritanceConfig = int;
enum : int
{
    CSC_Inherit = 0x00000000,
    CSC_Ignore  = 0x00000001,
}

alias CSC_ThreadPool = int;
enum : int
{
    CSC_ThreadPoolNone    = 0x00000000,
    CSC_ThreadPoolInherit = 0x00000001,
    CSC_STAThreadPool     = 0x00000002,
    CSC_MTAThreadPool     = 0x00000003,
}

alias CSC_Binding = int;
enum : int
{
    CSC_NoBinding        = 0x00000000,
    CSC_BindToPoolThread = 0x00000001,
}

alias CSC_TransactionConfig = int;
enum : int
{
    CSC_NoTransaction                = 0x00000000,
    CSC_IfContainerIsTransactional   = 0x00000001,
    CSC_CreateTransactionIfNecessary = 0x00000002,
    CSC_NewTransaction               = 0x00000003,
}

alias CSC_SynchronizationConfig = int;
enum : int
{
    CSC_NoSynchronization             = 0x00000000,
    CSC_IfContainerIsSynchronized     = 0x00000001,
    CSC_NewSynchronizationIfNecessary = 0x00000002,
    CSC_NewSynchronization            = 0x00000003,
}

alias CSC_TrackerConfig = int;
enum : int
{
    CSC_DontUseTracker = 0x00000000,
    CSC_UseTracker     = 0x00000001,
}

alias CSC_PartitionConfig = int;
enum : int
{
    CSC_NoPartition      = 0x00000000,
    CSC_InheritPartition = 0x00000001,
    CSC_NewPartition     = 0x00000002,
}

alias CSC_IISIntrinsicsConfig = int;
enum : int
{
    CSC_NoIISIntrinsics      = 0x00000000,
    CSC_InheritIISIntrinsics = 0x00000001,
}

alias CSC_COMTIIntrinsicsConfig = int;
enum : int
{
    CSC_NoCOMTIIntrinsics      = 0x00000000,
    CSC_InheritCOMTIIntrinsics = 0x00000001,
}

alias CSC_SxsConfig = int;
enum : int
{
    CSC_NoSxs      = 0x00000000,
    CSC_InheritSxs = 0x00000001,
    CSC_NewSxs     = 0x00000002,
}

enum IID_IServiceIISIntrinsicsConfig = GUID(0x1a0cf920, 0xd452, 0x46f4, [0xbc, 0x36, 0x48, 0x11, 0x8d, 0x54, 0xea, 0x52]);
interface IServiceIISIntrinsicsConfig : IUnknown
{
    HRESULT IISIntrinsicsConfig(CSC_IISIntrinsicsConfig iisIntrinsicsConfig);
}
enum IID_IServiceComTIIntrinsicsConfig = GUID(0x9e6831e, 0x4e1, 0x4ed4, [0x9d, 0xf, 0xe8, 0xb1, 0x68, 0xba, 0xfe, 0xaf]);
interface IServiceComTIIntrinsicsConfig : IUnknown
{
    HRESULT ComTIIntrinsicsConfig(CSC_COMTIIntrinsicsConfig comtiIntrinsicsConfig);
}
enum IID_IServiceSxsConfig = GUID(0xc7cd7379, 0xf3f2, 0x4634, [0x81, 0x1b, 0x70, 0x32, 0x81, 0xd7, 0x3e, 0x8]);
interface IServiceSxsConfig : IUnknown
{
    HRESULT SxsConfig(CSC_SxsConfig scsConfig);
    HRESULT SxsName(const(wchar)* szSxsName);
    HRESULT SxsDirectory(const(wchar)* szSxsDirectory);
}
enum IID_ICheckSxsConfig = GUID(0xff5a96f, 0x11fc, 0x47d1, [0xba, 0xa6, 0x25, 0xdd, 0x34, 0x7e, 0x72, 0x42]);
interface ICheckSxsConfig : IUnknown
{
    HRESULT IsSameSxsConfig(const(wchar)* wszSxsName, const(wchar)* wszSxsDirectory, const(wchar)* wszSxsAppName);
}
enum IID_IServiceInheritanceConfig = GUID(0x92186771, 0xd3b4, 0x4d77, [0xa8, 0xea, 0xee, 0x84, 0x2d, 0x58, 0x6f, 0x35]);
interface IServiceInheritanceConfig : IUnknown
{
    HRESULT ContainingContextTreatment(CSC_InheritanceConfig inheritanceConfig);
}
enum IID_IServiceThreadPoolConfig = GUID(0x186d89bc, 0xf277, 0x4bcc, [0x80, 0xd5, 0x4d, 0xf7, 0xb8, 0x36, 0xef, 0x4a]);
interface IServiceThreadPoolConfig : IUnknown
{
    HRESULT SelectThreadPool(CSC_ThreadPool threadPool);
    HRESULT SetBindingInfo(CSC_Binding binding);
}
enum IID_IServiceTransactionConfigBase = GUID(0x772b3fbe, 0x6ffd, 0x42fb, [0xb5, 0xf8, 0x8f, 0x9b, 0x26, 0xf, 0x38, 0x10]);
interface IServiceTransactionConfigBase : IUnknown
{
    HRESULT ConfigureTransaction(CSC_TransactionConfig transactionConfig);
    HRESULT IsolationLevel(COMAdminTxIsolationLevelOptions option);
    HRESULT TransactionTimeout(uint ulTimeoutSec);
    HRESULT BringYourOwnTransaction(const(wchar)* szTipURL);
    HRESULT NewTransactionDescription(const(wchar)* szTxDesc);
}
enum IID_IServiceTransactionConfig = GUID(0x59f4c2a3, 0xd3d7, 0x4a31, [0xb6, 0xe4, 0x6a, 0xb3, 0x17, 0x7c, 0x50, 0xb9]);
interface IServiceTransactionConfig : IServiceTransactionConfigBase
{
    HRESULT ConfigureBYOT(ITransaction pITxByot);
}
enum IID_IServiceSysTxnConfig = GUID(0x33caf1a1, 0xfcb8, 0x472b, [0xb4, 0x5e, 0x96, 0x74, 0x48, 0xde, 0xd6, 0xd8]);
interface IServiceSysTxnConfig : IServiceTransactionConfig
{
    HRESULT ConfigureBYOTSysTxn(ITransactionProxy pTxProxy);
}
enum IID_IServiceSynchronizationConfig = GUID(0xfd880e81, 0x6dce, 0x4c58, [0xaf, 0x83, 0xa2, 0x8, 0x84, 0x6c, 0x0, 0x30]);
interface IServiceSynchronizationConfig : IUnknown
{
    HRESULT ConfigureSynchronization(CSC_SynchronizationConfig synchConfig);
}
enum IID_IServiceTrackerConfig = GUID(0x6c3a3e1d, 0xba6, 0x4036, [0xb7, 0x6f, 0xd0, 0x40, 0x4d, 0xb8, 0x16, 0xc9]);
interface IServiceTrackerConfig : IUnknown
{
    HRESULT TrackerConfig(CSC_TrackerConfig trackerConfig, const(wchar)* szTrackerAppName, const(wchar)* szTrackerCtxName);
}
enum IID_IServicePartitionConfig = GUID(0x80182d03, 0x5ea4, 0x4831, [0xae, 0x97, 0x55, 0xbe, 0xff, 0xc2, 0xe5, 0x90]);
interface IServicePartitionConfig : IUnknown
{
    HRESULT PartitionConfig(CSC_PartitionConfig partitionConfig);
    HRESULT PartitionID(const(GUID)* guidPartitionID);
}
enum IID_IServiceCall = GUID(0xbd3e2e12, 0x42dd, 0x40f4, [0xa0, 0x9a, 0x95, 0xa5, 0xc, 0x58, 0x30, 0x4b]);
interface IServiceCall : IUnknown
{
    HRESULT OnCall();
}
enum IID_IAsyncErrorNotify = GUID(0xfe6777fb, 0xa674, 0x4177, [0x8f, 0x32, 0x6d, 0x70, 0x7e, 0x11, 0x34, 0x84]);
interface IAsyncErrorNotify : IUnknown
{
    HRESULT OnError(HRESULT hr);
}
enum IID_IServiceActivity = GUID(0x67532e0c, 0x9e2f, 0x4450, [0xa3, 0x54, 0x3, 0x56, 0x33, 0x94, 0x4e, 0x17]);
interface IServiceActivity : IUnknown
{
    HRESULT SynchronousCall(IServiceCall pIServiceCall);
    HRESULT AsynchronousCall(IServiceCall pIServiceCall);
    HRESULT BindToCurrentThread();
    HRESULT UnbindFromThread();
}
enum IID_IThreadPoolKnobs = GUID(0x51372af7, 0xcae7, 0x11cf, [0xbe, 0x81, 0x0, 0xaa, 0x0, 0xa2, 0xfa, 0x25]);
interface IThreadPoolKnobs : IUnknown
{
    HRESULT GetMaxThreads(int* plcMaxThreads);
    HRESULT GetCurrentThreads(int* plcCurrentThreads);
    HRESULT SetMaxThreads(int lcMaxThreads);
    HRESULT GetDeleteDelay(int* pmsecDeleteDelay);
    HRESULT SetDeleteDelay(int msecDeleteDelay);
    HRESULT GetMaxQueuedRequests(int* plcMaxQueuedRequests);
    HRESULT GetCurrentQueuedRequests(int* plcCurrentQueuedRequests);
    HRESULT SetMaxQueuedRequests(int lcMaxQueuedRequests);
    HRESULT SetMinThreads(int lcMinThreads);
    HRESULT SetQueueDepth(int lcQueueDepth);
}
enum IID_IComStaThreadPoolKnobs = GUID(0x324b64fa, 0x33b6, 0x11d2, [0x98, 0xb7, 0x0, 0xc0, 0x4f, 0x8e, 0xe1, 0xc4]);
interface IComStaThreadPoolKnobs : IUnknown
{
    HRESULT SetMinThreadCount(uint minThreads);
    HRESULT GetMinThreadCount(uint* minThreads);
    HRESULT SetMaxThreadCount(uint maxThreads);
    HRESULT GetMaxThreadCount(uint* maxThreads);
    HRESULT SetActivityPerThread(uint activitiesPerThread);
    HRESULT GetActivityPerThread(uint* activitiesPerThread);
    HRESULT SetActivityRatio(double activityRatio);
    HRESULT GetActivityRatio(double* activityRatio);
    HRESULT GetThreadCount(uint* pdwThreads);
    HRESULT GetQueueDepth(uint* pdwQDepth);
    HRESULT SetQueueDepth(int dwQDepth);
}
enum IID_IComMtaThreadPoolKnobs = GUID(0xf9a76d2e, 0x76a5, 0x43eb, [0xa0, 0xc4, 0x49, 0xbe, 0xc8, 0xe4, 0x84, 0x80]);
interface IComMtaThreadPoolKnobs : IUnknown
{
    HRESULT MTASetMaxThreadCount(uint dwMaxThreads);
    HRESULT MTAGetMaxThreadCount(uint* pdwMaxThreads);
    HRESULT MTASetThrottleValue(uint dwThrottle);
    HRESULT MTAGetThrottleValue(uint* pdwThrottle);
}
enum IID_IComStaThreadPoolKnobs2 = GUID(0x73707523, 0xff9a, 0x4974, [0xbf, 0x84, 0x21, 0x8, 0xdc, 0x21, 0x37, 0x40]);
interface IComStaThreadPoolKnobs2 : IComStaThreadPoolKnobs
{
    HRESULT GetMaxCPULoad(uint* pdwLoad);
    HRESULT SetMaxCPULoad(int pdwLoad);
    HRESULT GetCPUMetricEnabled(BOOL* pbMetricEnabled);
    HRESULT SetCPUMetricEnabled(BOOL bMetricEnabled);
    HRESULT GetCreateThreadsAggressively(BOOL* pbMetricEnabled);
    HRESULT SetCreateThreadsAggressively(BOOL bMetricEnabled);
    HRESULT GetMaxCSR(uint* pdwCSR);
    HRESULT SetMaxCSR(int dwCSR);
    HRESULT GetWaitTimeForThreadCleanup(uint* pdwThreadCleanupWaitTime);
    HRESULT SetWaitTimeForThreadCleanup(int dwThreadCleanupWaitTime);
}
enum IID_IProcessInitializer = GUID(0x1113f52d, 0xdc7f, 0x4943, [0xae, 0xd6, 0x88, 0xd0, 0x40, 0x27, 0xe3, 0x2a]);
interface IProcessInitializer : IUnknown
{
    HRESULT Startup(IUnknown punkProcessControl);
    HRESULT Shutdown();
}
enum IID_IServicePoolConfig = GUID(0xa9690656, 0x5bca, 0x470c, [0x84, 0x51, 0x25, 0xc, 0x1f, 0x43, 0xa3, 0x3e]);
interface IServicePoolConfig : IUnknown
{
    HRESULT put_MaxPoolSize(uint dwMaxPool);
    HRESULT get_MaxPoolSize(uint* pdwMaxPool);
    HRESULT put_MinPoolSize(uint dwMinPool);
    HRESULT get_MinPoolSize(uint* pdwMinPool);
    HRESULT put_CreationTimeout(uint dwCreationTimeout);
    HRESULT get_CreationTimeout(uint* pdwCreationTimeout);
    HRESULT put_TransactionAffinity(BOOL fTxAffinity);
    HRESULT get_TransactionAffinity(BOOL* pfTxAffinity);
    HRESULT put_ClassFactory(IClassFactory pFactory);
    HRESULT get_ClassFactory(IClassFactory* pFactory);
}
enum IID_IServicePool = GUID(0xb302df81, 0xea45, 0x451e, [0x99, 0xa2, 0x9, 0xf9, 0xfd, 0x1b, 0x1e, 0x13]);
interface IServicePool : IUnknown
{
    HRESULT Initialize(IUnknown pPoolConfig);
    HRESULT GetObject(const(GUID)* riid, void** ppv);
    HRESULT Shutdown();
}
enum IID_IManagedPooledObj = GUID(0xc5da4bea, 0x1b42, 0x4437, [0x89, 0x26, 0xb6, 0xa3, 0x88, 0x60, 0xa7, 0x70]);
interface IManagedPooledObj : IUnknown
{
    HRESULT SetHeld(BOOL m_bHeld);
}
enum IID_IManagedPoolAction = GUID(0xda91b74e, 0x5388, 0x4783, [0x94, 0x9d, 0xc1, 0xcd, 0x5f, 0xb0, 0x5, 0x6]);
interface IManagedPoolAction : IUnknown
{
    HRESULT LastRelease();
}
enum IID_IManagedObjectInfo = GUID(0x1427c51a, 0x4584, 0x49d8, [0x90, 0xa0, 0xc5, 0xd, 0x80, 0x86, 0xcb, 0xe9]);
interface IManagedObjectInfo : IUnknown
{
    HRESULT GetIUnknown(IUnknown* pUnk);
    HRESULT GetIObjectControl(IObjectControl* pCtrl);
    HRESULT SetInPool(BOOL bInPool, IManagedPooledObj pPooledObj);
    HRESULT SetWrapperStrength(BOOL bStrong);
}
enum IID_IAppDomainHelper = GUID(0xc7b67079, 0x8255, 0x42c6, [0x9e, 0xc0, 0x69, 0x94, 0xa3, 0x54, 0x87, 0x80]);
interface IAppDomainHelper : IDispatch
{
    HRESULT Initialize(IUnknown pUnkAD, long __MIDL__IAppDomainHelper0000, void* pPool);
    HRESULT DoCallback(IUnknown pUnkAD, long __MIDL__IAppDomainHelper0001, void* pPool);
}
enum IID_IAssemblyLocator = GUID(0x391ffbb9, 0xa8ee, 0x432a, [0xab, 0xc8, 0xba, 0xa2, 0x38, 0xda, 0xb9, 0xf]);
interface IAssemblyLocator : IDispatch
{
    HRESULT GetModules(BSTR applicationDir, BSTR applicationName, BSTR assemblyName, SAFEARRAY** pModules);
}
enum IID_IManagedActivationEvents = GUID(0xa5f325af, 0x572f, 0x46da, [0xb8, 0xab, 0x82, 0x7c, 0x3d, 0x95, 0xd9, 0x9e]);
interface IManagedActivationEvents : IUnknown
{
    HRESULT CreateManagedStub(IManagedObjectInfo pInfo, BOOL fDist);
    HRESULT DestroyManagedStub(IManagedObjectInfo pInfo);
}
enum IID_ISendMethodEvents = GUID(0x2732fd59, 0xb2b4, 0x4d44, [0x87, 0x8c, 0x8b, 0x8f, 0x9, 0x62, 0x60, 0x8]);
interface ISendMethodEvents : IUnknown
{
    HRESULT SendMethodCall(const(void)* pIdentity, const(GUID)* riid, uint dwMeth);
    HRESULT SendMethodReturn(const(void)* pIdentity, const(GUID)* riid, uint dwMeth, HRESULT hrCall, HRESULT hrServer);
}
enum IID_ITransactionResourcePool = GUID(0xc5feb7c1, 0x346a, 0x11d1, [0xb1, 0xcc, 0x0, 0xaa, 0x0, 0xba, 0x32, 0x58]);
interface ITransactionResourcePool : IUnknown
{
    HRESULT PutResource(IObjPool pPool, IUnknown pUnk);
    HRESULT GetResource(IObjPool pPool, IUnknown* ppUnk);
}
enum IID_IMTSCall = GUID(0x51372aef, 0xcae7, 0x11cf, [0xbe, 0x81, 0x0, 0xaa, 0x0, 0xa2, 0xfa, 0x25]);
interface IMTSCall : IUnknown
{
    HRESULT OnCall();
}
enum IID_IContextProperties = GUID(0xd396da85, 0xbf8f, 0x11d1, [0xbb, 0xae, 0x0, 0xc0, 0x4f, 0xc2, 0xfa, 0x5f]);
interface IContextProperties : IUnknown
{
    HRESULT Count(int* plCount);
    HRESULT GetProperty(BSTR name, VARIANT* pProperty);
    HRESULT EnumNames(IEnumNames* ppenum);
    HRESULT SetProperty(BSTR name, VARIANT property);
    HRESULT RemoveProperty(BSTR name);
}
enum IID_IObjPool = GUID(0x7d8805a0, 0x2ea7, 0x11d1, [0xb1, 0xcc, 0x0, 0xaa, 0x0, 0xba, 0x32, 0x58]);
interface IObjPool : IUnknown
{
    void Reserved1();
    void Reserved2();
    void Reserved3();
    void Reserved4();
    void PutEndTx(IUnknown pObj);
    void Reserved5();
    void Reserved6();
}
enum IID_ITransactionProperty = GUID(0x788ea814, 0x87b1, 0x11d1, [0xbb, 0xa6, 0x0, 0xc0, 0x4f, 0xc2, 0xfa, 0x5f]);
interface ITransactionProperty : IUnknown
{
    void Reserved1();
    void Reserved2();
    void Reserved3();
    void Reserved4();
    void Reserved5();
    void Reserved6();
    void Reserved7();
    void Reserved8();
    void Reserved9();
    HRESULT GetTransactionResourcePool(ITransactionResourcePool* ppTxPool);
    void Reserved10();
    void Reserved11();
    void Reserved12();
    void Reserved13();
    void Reserved14();
    void Reserved15();
    void Reserved16();
    void Reserved17();
}
enum IID_IMTSActivity = GUID(0x51372af0, 0xcae7, 0x11cf, [0xbe, 0x81, 0x0, 0xaa, 0x0, 0xa2, 0xfa, 0x25]);
interface IMTSActivity : IUnknown
{
    HRESULT SynchronousCall(IMTSCall pCall);
    HRESULT AsyncCall(IMTSCall pCall);
    void Reserved1();
    HRESULT BindToCurrentThread();
    HRESULT UnbindFromThread();
}
alias AutoSvcs_Error_Constants = uint;
enum : uint
{
    mtsErrCtxAborted                   = 0x8004e002,
    mtsErrCtxAborting                  = 0x8004e003,
    mtsErrCtxNoContext                 = 0x8004e004,
    mtsErrCtxNotRegistered             = 0x8004e005,
    mtsErrCtxSynchTimeout              = 0x8004e006,
    mtsErrCtxOldReference              = 0x8004e007,
    mtsErrCtxRoleNotFound              = 0x8004e00c,
    mtsErrCtxNoSecurity                = 0x8004e00d,
    mtsErrCtxWrongThread               = 0x8004e00e,
    mtsErrCtxTMNotAvailable            = 0x8004e00f,
    comQCErrApplicationNotQueued       = 0x80110600,
    comQCErrNoQueueableInterfaces      = 0x80110601,
    comQCErrQueuingServiceNotAvailable = 0x80110602,
    comQCErrQueueTransactMismatch      = 0x80110603,
    comqcErrRecorderMarshalled         = 0x80110604,
    comqcErrOutParam                   = 0x80110605,
    comqcErrRecorderNotTrusted         = 0x80110606,
    comqcErrPSLoad                     = 0x80110607,
    comqcErrMarshaledObjSameTxn        = 0x80110608,
    comqcErrInvalidMessage             = 0x80110650,
    comqcErrMsmqSidUnavailable         = 0x80110651,
    comqcErrWrongMsgExtension          = 0x80110652,
    comqcErrMsmqServiceUnavailable     = 0x80110653,
    comqcErrMsgNotAuthenticated        = 0x80110654,
    comqcErrMsmqConnectorUsed          = 0x80110655,
    comqcErrBadMarshaledObject         = 0x80110656,
}

alias LockModes = int;
enum : int
{
    LockSetGet = 0x00000000,
    LockMethod = 0x00000001,
}

alias ReleaseModes = int;
enum : int
{
    Standard = 0x00000000,
    Process  = 0x00000001,
}

alias CRMFLAGS = int;
enum : int
{
    CRMFLAG_FORGETTARGET          = 0x00000001,
    CRMFLAG_WRITTENDURINGPREPARE  = 0x00000002,
    CRMFLAG_WRITTENDURINGCOMMIT   = 0x00000004,
    CRMFLAG_WRITTENDURINGABORT    = 0x00000008,
    CRMFLAG_WRITTENDURINGRECOVERY = 0x00000010,
    CRMFLAG_WRITTENDURINGREPLAY   = 0x00000020,
    CRMFLAG_REPLAYINPROGRESS      = 0x00000040,
}

alias CRMREGFLAGS = int;
enum : int
{
    CRMREGFLAG_PREPAREPHASE         = 0x00000001,
    CRMREGFLAG_COMMITPHASE          = 0x00000002,
    CRMREGFLAG_ABORTPHASE           = 0x00000004,
    CRMREGFLAG_ALLPHASES            = 0x00000007,
    CRMREGFLAG_FAILIFINDOUBTSREMAIN = 0x00000010,
}

enum CLSID_SecurityIdentity = GUID(0xecabb0a5, 0x7f19, 0x11d2, [0x97, 0x8e, 0x0, 0x0, 0xf8, 0x75, 0x7e, 0x2a]);
struct SecurityIdentity
{
}
enum CLSID_SecurityCallers = GUID(0xecabb0a6, 0x7f19, 0x11d2, [0x97, 0x8e, 0x0, 0x0, 0xf8, 0x75, 0x7e, 0x2a]);
struct SecurityCallers
{
}
enum CLSID_SecurityCallContext = GUID(0xecabb0a7, 0x7f19, 0x11d2, [0x97, 0x8e, 0x0, 0x0, 0xf8, 0x75, 0x7e, 0x2a]);
struct SecurityCallContext
{
}
enum CLSID_GetSecurityCallContextAppObject = GUID(0xecabb0a8, 0x7f19, 0x11d2, [0x97, 0x8e, 0x0, 0x0, 0xf8, 0x75, 0x7e, 0x2a]);
struct GetSecurityCallContextAppObject
{
}
enum CLSID_Dummy30040732 = GUID(0xecabb0a9, 0x7f19, 0x11d2, [0x97, 0x8e, 0x0, 0x0, 0xf8, 0x75, 0x7e, 0x2a]);
struct Dummy30040732
{
}
enum CLSID_TransactionContext = GUID(0x7999fc25, 0xd3c6, 0x11cf, [0xac, 0xab, 0x0, 0xa0, 0x24, 0xa5, 0x5a, 0xef]);
struct TransactionContext
{
}
enum CLSID_TransactionContextEx = GUID(0x5cb66670, 0xd3d4, 0x11cf, [0xac, 0xab, 0x0, 0xa0, 0x24, 0xa5, 0x5a, 0xef]);
struct TransactionContextEx
{
}
enum CLSID_ByotServerEx = GUID(0xecabb0aa, 0x7f19, 0x11d2, [0x97, 0x8e, 0x0, 0x0, 0xf8, 0x75, 0x7e, 0x2a]);
struct ByotServerEx
{
}
enum CLSID_CServiceConfig = GUID(0xecabb0c8, 0x7f19, 0x11d2, [0x97, 0x8e, 0x0, 0x0, 0xf8, 0x75, 0x7e, 0x2a]);
struct CServiceConfig
{
}
enum CLSID_ServicePool = GUID(0xecabb0c9, 0x7f19, 0x11d2, [0x97, 0x8e, 0x0, 0x0, 0xf8, 0x75, 0x7e, 0x2a]);
struct ServicePool
{
}
enum CLSID_ServicePoolConfig = GUID(0xecabb0ca, 0x7f19, 0x11d2, [0x97, 0x8e, 0x0, 0x0, 0xf8, 0x75, 0x7e, 0x2a]);
struct ServicePoolConfig
{
}
enum CLSID_SharedProperty = GUID(0x2a005c05, 0xa5de, 0x11cf, [0x9e, 0x66, 0x0, 0xaa, 0x0, 0xa3, 0xf4, 0x64]);
struct SharedProperty
{
}
enum CLSID_SharedPropertyGroup = GUID(0x2a005c0b, 0xa5de, 0x11cf, [0x9e, 0x66, 0x0, 0xaa, 0x0, 0xa3, 0xf4, 0x64]);
struct SharedPropertyGroup
{
}
enum CLSID_SharedPropertyGroupManager = GUID(0x2a005c11, 0xa5de, 0x11cf, [0x9e, 0x66, 0x0, 0xaa, 0x0, 0xa3, 0xf4, 0x64]);
struct SharedPropertyGroupManager
{
}
enum CLSID_COMEvents = GUID(0xecabb0ab, 0x7f19, 0x11d2, [0x97, 0x8e, 0x0, 0x0, 0xf8, 0x75, 0x7e, 0x2a]);
struct COMEvents
{
}
enum CLSID_CoMTSLocator = GUID(0xecabb0ac, 0x7f19, 0x11d2, [0x97, 0x8e, 0x0, 0x0, 0xf8, 0x75, 0x7e, 0x2a]);
struct CoMTSLocator
{
}
enum CLSID_MtsGrp = GUID(0x4b2e958d, 0x393, 0x11d1, [0xb1, 0xab, 0x0, 0xaa, 0x0, 0xba, 0x32, 0x58]);
struct MtsGrp
{
}
enum CLSID_ComServiceEvents = GUID(0xecabb0c3, 0x7f19, 0x11d2, [0x97, 0x8e, 0x0, 0x0, 0xf8, 0x75, 0x7e, 0x2a]);
struct ComServiceEvents
{
}
enum CLSID_ComSystemAppEventData = GUID(0xecabb0c6, 0x7f19, 0x11d2, [0x97, 0x8e, 0x0, 0x0, 0xf8, 0x75, 0x7e, 0x2a]);
struct ComSystemAppEventData
{
}
enum CLSID_CRMClerk = GUID(0xecabb0bd, 0x7f19, 0x11d2, [0x97, 0x8e, 0x0, 0x0, 0xf8, 0x75, 0x7e, 0x2a]);
struct CRMClerk
{
}
enum CLSID_CRMRecoveryClerk = GUID(0xecabb0be, 0x7f19, 0x11d2, [0x97, 0x8e, 0x0, 0x0, 0xf8, 0x75, 0x7e, 0x2a]);
struct CRMRecoveryClerk
{
}
enum CLSID_LBEvents = GUID(0xecabb0c1, 0x7f19, 0x11d2, [0x97, 0x8e, 0x0, 0x0, 0xf8, 0x75, 0x7e, 0x2a]);
struct LBEvents
{
}
enum CLSID_MessageMover = GUID(0xecabb0bf, 0x7f19, 0x11d2, [0x97, 0x8e, 0x0, 0x0, 0xf8, 0x75, 0x7e, 0x2a]);
struct MessageMover
{
}
enum CLSID_DispenserManager = GUID(0xecabb0c0, 0x7f19, 0x11d2, [0x97, 0x8e, 0x0, 0x0, 0xf8, 0x75, 0x7e, 0x2a]);
struct DispenserManager
{
}
enum CLSID_PoolMgr = GUID(0xecabafb5, 0x7f19, 0x11d2, [0x97, 0x8e, 0x0, 0x0, 0xf8, 0x75, 0x7e, 0x2a]);
struct PoolMgr
{
}
enum CLSID_EventServer = GUID(0xecabafbc, 0x7f19, 0x11d2, [0x97, 0x8e, 0x0, 0x0, 0xf8, 0x75, 0x7e, 0x2a]);
struct EventServer
{
}
enum CLSID_TrackerServer = GUID(0xecabafb9, 0x7f19, 0x11d2, [0x97, 0x8e, 0x0, 0x0, 0xf8, 0x75, 0x7e, 0x2a]);
struct TrackerServer
{
}
enum CLSID_AppDomainHelper = GUID(0xef24f689, 0x14f8, 0x4d92, [0xb4, 0xaf, 0xd7, 0xb1, 0xf0, 0xe7, 0xf, 0xd4]);
struct AppDomainHelper
{
}
enum CLSID_ClrAssemblyLocator = GUID(0x458aa3b5, 0x265a, 0x4b75, [0xbc, 0x5, 0x9b, 0xea, 0x46, 0x30, 0xcf, 0x18]);
struct ClrAssemblyLocator
{
}
