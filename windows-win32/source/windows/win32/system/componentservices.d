module windows.win32.system.componentservices;

import windows.win32.guid : GUID;
import windows.win32.foundation : BOOL, BSTR, FILETIME, HRESULT, PSID, PWSTR;
import windows.win32.system.com_ : APTTYPE, BLOB, IClassFactory, IDispatch, IUnknown, SAFEARRAY, VARIANT;
import windows.win32.system.distributedtransactioncoordinator : ITransaction, ITransactionVoterBallotAsync2, ITransactionVoterNotifyAsync2;

version (Windows):
extern (Windows):

HRESULT CoGetDefaultContext(APTTYPE, const(GUID)*, void**);
HRESULT CoCreateActivity(IUnknown, const(GUID)*, void**);
HRESULT CoEnterServiceDomain(IUnknown);
void CoLeaveServiceDomain(IUnknown);
HRESULT GetManagedExtensions(uint*);
void* SafeRef(const(GUID)*, IUnknown);
HRESULT RecycleSurrogate(int);
HRESULT MTSCreateActivity(const(GUID)*, void**);
HRESULT GetDispenserManager(IDispenserManager*);
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
enum IID_ICOMAdminCatalog = GUID(0xdd662187, 0xdfc2, 0x11d1, [0xa2, 0xcf, 0x0, 0x80, 0x5f, 0xc7, 0x92, 0x35]);
interface ICOMAdminCatalog : IDispatch
{
    HRESULT GetCollection(BSTR, IDispatch*);
    HRESULT Connect(BSTR, IDispatch*);
    HRESULT get_MajorVersion(int*);
    HRESULT get_MinorVersion(int*);
    HRESULT GetCollectionByQuery(BSTR, SAFEARRAY**, IDispatch*);
    HRESULT ImportComponent(BSTR, BSTR);
    HRESULT InstallComponent(BSTR, BSTR, BSTR, BSTR);
    HRESULT ShutdownApplication(BSTR);
    HRESULT ExportApplication(BSTR, BSTR, COMAdminApplicationExportOptions);
    HRESULT InstallApplication(BSTR, BSTR, COMAdminApplicationInstallOptions, BSTR, BSTR, BSTR);
    HRESULT StopRouter();
    HRESULT RefreshRouter();
    HRESULT StartRouter();
    HRESULT Reserved1();
    HRESULT Reserved2();
    HRESULT InstallMultipleComponents(BSTR, SAFEARRAY**, SAFEARRAY**);
    HRESULT GetMultipleComponentsInfo(BSTR, SAFEARRAY**, SAFEARRAY**, SAFEARRAY**, SAFEARRAY**, SAFEARRAY**);
    HRESULT RefreshComponents();
    HRESULT BackupREGDB(BSTR);
    HRESULT RestoreREGDB(BSTR);
    HRESULT QueryApplicationFile(BSTR, BSTR*, BSTR*, short*, short*, SAFEARRAY**);
    HRESULT StartApplication(BSTR);
    HRESULT ServiceCheck(int, int*);
    HRESULT InstallMultipleEventClasses(BSTR, SAFEARRAY**, SAFEARRAY**);
    HRESULT InstallEventClass(BSTR, BSTR, BSTR, BSTR);
    HRESULT GetEventClassesForIID(BSTR, SAFEARRAY**, SAFEARRAY**, SAFEARRAY**);
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
    HRESULT GetCollectionByQuery2(BSTR, VARIANT*, IDispatch*);
    HRESULT GetApplicationInstanceIDFromProcessID(int, BSTR*);
    HRESULT ShutdownApplicationInstances(VARIANT*);
    HRESULT PauseApplicationInstances(VARIANT*);
    HRESULT ResumeApplicationInstances(VARIANT*);
    HRESULT RecycleApplicationInstances(VARIANT*, int);
    HRESULT AreApplicationInstancesPaused(VARIANT*, short*);
    HRESULT DumpApplicationInstance(BSTR, BSTR, int, BSTR*);
    HRESULT get_IsApplicationInstanceDumpSupported(short*);
    HRESULT CreateServiceForApplication(BSTR, BSTR, BSTR, BSTR, BSTR, BSTR, BSTR, short);
    HRESULT DeleteServiceForApplication(BSTR);
    HRESULT GetPartitionID(BSTR, BSTR*);
    HRESULT GetPartitionName(BSTR, BSTR*);
    HRESULT put_CurrentPartition(BSTR);
    HRESULT get_CurrentPartitionID(BSTR*);
    HRESULT get_CurrentPartitionName(BSTR*);
    HRESULT get_GlobalPartitionID(BSTR*);
    HRESULT FlushPartitionCache();
    HRESULT CopyApplications(BSTR, VARIANT*, BSTR);
    HRESULT CopyComponents(BSTR, VARIANT*, BSTR);
    HRESULT MoveComponents(BSTR, VARIANT*, BSTR);
    HRESULT AliasComponent(BSTR, BSTR, BSTR, BSTR, BSTR);
    HRESULT IsSafeToDelete(BSTR, COMAdminInUse*);
    HRESULT ImportUnconfiguredComponents(BSTR, VARIANT*, VARIANT*);
    HRESULT PromoteUnconfiguredComponents(BSTR, VARIANT*, VARIANT*);
    HRESULT ImportComponents(BSTR, VARIANT*, VARIANT*);
    HRESULT get_Is64BitCatalogServer(short*);
    HRESULT ExportPartition(BSTR, BSTR, COMAdminApplicationExportOptions);
    HRESULT InstallPartition(BSTR, BSTR, COMAdminApplicationInstallOptions, BSTR, BSTR, BSTR);
    HRESULT QueryApplicationFile2(BSTR, IDispatch*);
    HRESULT GetComponentVersionCount(BSTR, int*);
}
enum IID_ICatalogObject = GUID(0x6eb22871, 0x8a19, 0x11d0, [0x81, 0xb6, 0x0, 0xa0, 0xc9, 0x23, 0x1c, 0x29]);
interface ICatalogObject : IDispatch
{
    HRESULT get_Value(BSTR, VARIANT*);
    HRESULT put_Value(BSTR, VARIANT);
    HRESULT get_Key(VARIANT*);
    HRESULT get_Name(VARIANT*);
    HRESULT IsPropertyReadOnly(BSTR, short*);
    HRESULT get_Valid(short*);
    HRESULT IsPropertyWriteOnly(BSTR, short*);
}
enum IID_ICatalogCollection = GUID(0x6eb22872, 0x8a19, 0x11d0, [0x81, 0xb6, 0x0, 0xa0, 0xc9, 0x23, 0x1c, 0x29]);
interface ICatalogCollection : IDispatch
{
    HRESULT get__NewEnum(IUnknown*);
    HRESULT get_Item(int, IDispatch*);
    HRESULT get_Count(int*);
    HRESULT Remove(int);
    HRESULT Add(IDispatch*);
    HRESULT Populate();
    HRESULT SaveChanges(int*);
    HRESULT GetCollection(BSTR, VARIANT, IDispatch*);
    HRESULT get_Name(VARIANT*);
    HRESULT get_AddEnabled(short*);
    HRESULT get_RemoveEnabled(short*);
    HRESULT GetUtilInterface(IDispatch*);
    HRESULT get_DataStoreMajorVersion(int*);
    HRESULT get_DataStoreMinorVersion(int*);
    HRESULT PopulateByKey(SAFEARRAY*);
    HRESULT PopulateByQuery(BSTR, int);
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

enum IID_ISecurityIdentityColl = GUID(0xcafc823c, 0xb441, 0x11d1, [0xb8, 0x2b, 0x0, 0x0, 0xf8, 0x75, 0x7e, 0x2a]);
interface ISecurityIdentityColl : IDispatch
{
    HRESULT get_Count(int*);
    HRESULT get_Item(BSTR, VARIANT*);
    HRESULT get__NewEnum(IUnknown*);
}
enum IID_ISecurityCallersColl = GUID(0xcafc823d, 0xb441, 0x11d1, [0xb8, 0x2b, 0x0, 0x0, 0xf8, 0x75, 0x7e, 0x2a]);
interface ISecurityCallersColl : IDispatch
{
    HRESULT get_Count(int*);
    HRESULT get_Item(int, ISecurityIdentityColl*);
    HRESULT get__NewEnum(IUnknown*);
}
enum IID_ISecurityCallContext = GUID(0xcafc823e, 0xb441, 0x11d1, [0xb8, 0x2b, 0x0, 0x0, 0xf8, 0x75, 0x7e, 0x2a]);
interface ISecurityCallContext : IDispatch
{
    HRESULT get_Count(int*);
    HRESULT get_Item(BSTR, VARIANT*);
    HRESULT get__NewEnum(IUnknown*);
    HRESULT IsCallerInRole(BSTR, short*);
    HRESULT IsSecurityEnabled(short*);
    HRESULT IsUserInRole(VARIANT*, BSTR, short*);
}
enum IID_IGetSecurityCallContext = GUID(0xcafc823f, 0xb441, 0x11d1, [0xb8, 0x2b, 0x0, 0x0, 0xf8, 0x75, 0x7e, 0x2a]);
interface IGetSecurityCallContext : IDispatch
{
    HRESULT GetSecurityCallContext(ISecurityCallContext*);
}
enum IID_SecurityProperty = GUID(0xe74a7215, 0x14d, 0x11d1, [0xa6, 0x3c, 0x0, 0xa0, 0xc9, 0x11, 0xb4, 0xe0]);
interface SecurityProperty : IDispatch
{
    HRESULT GetDirectCallerName(BSTR*);
    HRESULT GetDirectCreatorName(BSTR*);
    HRESULT GetOriginalCallerName(BSTR*);
    HRESULT GetOriginalCreatorName(BSTR*);
}
enum IID_ContextInfo = GUID(0x19a5a02c, 0xac8, 0x11d2, [0xb2, 0x86, 0x0, 0xc0, 0x4f, 0x8e, 0xf9, 0x34]);
interface ContextInfo : IDispatch
{
    HRESULT IsInTransaction(short*);
    HRESULT GetTransaction(IUnknown*);
    HRESULT GetTransactionId(BSTR*);
    HRESULT GetActivityId(BSTR*);
    HRESULT GetContextId(BSTR*);
}
enum IID_ContextInfo2 = GUID(0xc99d6e75, 0x2375, 0x11d4, [0x83, 0x31, 0x0, 0xc0, 0x4f, 0x60, 0x55, 0x88]);
interface ContextInfo2 : ContextInfo
{
    HRESULT GetPartitionId(BSTR*);
    HRESULT GetApplicationId(BSTR*);
    HRESULT GetApplicationInstanceId(BSTR*);
}
enum IID_ObjectContext = GUID(0x74c08646, 0xcedb, 0x11cf, [0x8b, 0x49, 0x0, 0xaa, 0x0, 0xb8, 0xa7, 0x90]);
interface ObjectContext : IDispatch
{
    HRESULT CreateInstance(BSTR, VARIANT*);
    HRESULT SetComplete();
    HRESULT SetAbort();
    HRESULT EnableCommit();
    HRESULT DisableCommit();
    HRESULT IsInTransaction(short*);
    HRESULT IsSecurityEnabled(short*);
    HRESULT IsCallerInRole(BSTR, short*);
    HRESULT get_Count(int*);
    HRESULT get_Item(BSTR, VARIANT*);
    HRESULT get__NewEnum(IUnknown*);
    HRESULT get_Security(SecurityProperty*);
    HRESULT get_ContextInfo(ContextInfo*);
}
enum IID_ITransactionContextEx = GUID(0x7999fc22, 0xd3c6, 0x11cf, [0xac, 0xab, 0x0, 0xa0, 0x24, 0xa5, 0x5a, 0xef]);
interface ITransactionContextEx : IUnknown
{
    HRESULT CreateInstance(const(GUID)*, const(GUID)*, void**);
    HRESULT Commit();
    HRESULT Abort();
}
enum IID_ITransactionContext = GUID(0x7999fc21, 0xd3c6, 0x11cf, [0xac, 0xab, 0x0, 0xa0, 0x24, 0xa5, 0x5a, 0xef]);
interface ITransactionContext : IDispatch
{
    HRESULT CreateInstance(BSTR, VARIANT*);
    HRESULT Commit();
    HRESULT Abort();
}
enum IID_ICreateWithTransactionEx = GUID(0x455acf57, 0x5345, 0x11d2, [0x99, 0xcf, 0x0, 0xc0, 0x4f, 0x79, 0x7b, 0xc9]);
interface ICreateWithTransactionEx : IUnknown
{
    HRESULT CreateInstance(ITransaction, const(GUID)*, const(GUID)*, void**);
}
enum IID_ICreateWithLocalTransaction = GUID(0x227ac7a8, 0x8423, 0x42ce, [0xb7, 0xcf, 0x3, 0x6, 0x1e, 0xc9, 0xaa, 0xa3]);
interface ICreateWithLocalTransaction : IUnknown
{
    HRESULT CreateInstanceWithSysTx(IUnknown, const(GUID)*, const(GUID)*, void**);
}
enum IID_ICreateWithTipTransactionEx = GUID(0x455acf59, 0x5345, 0x11d2, [0x99, 0xcf, 0x0, 0xc0, 0x4f, 0x79, 0x7b, 0xc9]);
interface ICreateWithTipTransactionEx : IUnknown
{
    HRESULT CreateInstance(BSTR, const(GUID)*, const(GUID)*, void**);
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
    HRESULT OnLtxTransactionStart(COMSVCSEVENTINFO*, GUID, GUID, BOOL, int);
    HRESULT OnLtxTransactionPrepare(COMSVCSEVENTINFO*, GUID, BOOL);
    HRESULT OnLtxTransactionAbort(COMSVCSEVENTINFO*, GUID);
    HRESULT OnLtxTransactionCommit(COMSVCSEVENTINFO*, GUID);
    HRESULT OnLtxTransactionPromote(COMSVCSEVENTINFO*, GUID, GUID);
}
enum IID_IComUserEvent = GUID(0x683130a4, 0x2e50, 0x11d2, [0x98, 0xa5, 0x0, 0xc0, 0x4f, 0x8e, 0xe1, 0xc4]);
interface IComUserEvent : IUnknown
{
    HRESULT OnUserEvent(COMSVCSEVENTINFO*, VARIANT*);
}
enum IID_IComThreadEvents = GUID(0x683130a5, 0x2e50, 0x11d2, [0x98, 0xa5, 0x0, 0xc0, 0x4f, 0x8e, 0xe1, 0xc4]);
interface IComThreadEvents : IUnknown
{
    HRESULT OnThreadStart(COMSVCSEVENTINFO*, ulong, uint, uint);
    HRESULT OnThreadTerminate(COMSVCSEVENTINFO*, ulong, uint, uint);
    HRESULT OnThreadBindToApartment(COMSVCSEVENTINFO*, ulong, ulong, uint, uint);
    HRESULT OnThreadUnBind(COMSVCSEVENTINFO*, ulong, ulong, uint);
    HRESULT OnThreadWorkEnque(COMSVCSEVENTINFO*, ulong, ulong, uint);
    HRESULT OnThreadWorkPrivate(COMSVCSEVENTINFO*, ulong, ulong);
    HRESULT OnThreadWorkPublic(COMSVCSEVENTINFO*, ulong, ulong, uint);
    HRESULT OnThreadWorkRedirect(COMSVCSEVENTINFO*, ulong, ulong, uint, ulong);
    HRESULT OnThreadWorkReject(COMSVCSEVENTINFO*, ulong, ulong, uint);
    HRESULT OnThreadAssignApartment(COMSVCSEVENTINFO*, const(GUID)*, ulong);
    HRESULT OnThreadUnassignApartment(COMSVCSEVENTINFO*, ulong);
}
enum IID_IComAppEvents = GUID(0x683130a6, 0x2e50, 0x11d2, [0x98, 0xa5, 0x0, 0xc0, 0x4f, 0x8e, 0xe1, 0xc4]);
interface IComAppEvents : IUnknown
{
    HRESULT OnAppActivation(COMSVCSEVENTINFO*, GUID);
    HRESULT OnAppShutdown(COMSVCSEVENTINFO*, GUID);
    HRESULT OnAppForceShutdown(COMSVCSEVENTINFO*, GUID);
}
enum IID_IComInstanceEvents = GUID(0x683130a7, 0x2e50, 0x11d2, [0x98, 0xa5, 0x0, 0xc0, 0x4f, 0x8e, 0xe1, 0xc4]);
interface IComInstanceEvents : IUnknown
{
    HRESULT OnObjectCreate(COMSVCSEVENTINFO*, const(GUID)*, const(GUID)*, const(GUID)*, ulong, ulong);
    HRESULT OnObjectDestroy(COMSVCSEVENTINFO*, ulong);
}
enum IID_IComTransactionEvents = GUID(0x683130a8, 0x2e50, 0x11d2, [0x98, 0xa5, 0x0, 0xc0, 0x4f, 0x8e, 0xe1, 0xc4]);
interface IComTransactionEvents : IUnknown
{
    HRESULT OnTransactionStart(COMSVCSEVENTINFO*, const(GUID)*, const(GUID)*, BOOL);
    HRESULT OnTransactionPrepare(COMSVCSEVENTINFO*, const(GUID)*, BOOL);
    HRESULT OnTransactionAbort(COMSVCSEVENTINFO*, const(GUID)*);
    HRESULT OnTransactionCommit(COMSVCSEVENTINFO*, const(GUID)*);
}
enum IID_IComMethodEvents = GUID(0x683130a9, 0x2e50, 0x11d2, [0x98, 0xa5, 0x0, 0xc0, 0x4f, 0x8e, 0xe1, 0xc4]);
interface IComMethodEvents : IUnknown
{
    HRESULT OnMethodCall(COMSVCSEVENTINFO*, ulong, const(GUID)*, const(GUID)*, uint);
    HRESULT OnMethodReturn(COMSVCSEVENTINFO*, ulong, const(GUID)*, const(GUID)*, uint, HRESULT);
    HRESULT OnMethodException(COMSVCSEVENTINFO*, ulong, const(GUID)*, const(GUID)*, uint);
}
enum IID_IComObjectEvents = GUID(0x683130aa, 0x2e50, 0x11d2, [0x98, 0xa5, 0x0, 0xc0, 0x4f, 0x8e, 0xe1, 0xc4]);
interface IComObjectEvents : IUnknown
{
    HRESULT OnObjectActivate(COMSVCSEVENTINFO*, ulong, ulong);
    HRESULT OnObjectDeactivate(COMSVCSEVENTINFO*, ulong, ulong);
    HRESULT OnDisableCommit(COMSVCSEVENTINFO*, ulong);
    HRESULT OnEnableCommit(COMSVCSEVENTINFO*, ulong);
    HRESULT OnSetComplete(COMSVCSEVENTINFO*, ulong);
    HRESULT OnSetAbort(COMSVCSEVENTINFO*, ulong);
}
enum IID_IComResourceEvents = GUID(0x683130ab, 0x2e50, 0x11d2, [0x98, 0xa5, 0x0, 0xc0, 0x4f, 0x8e, 0xe1, 0xc4]);
interface IComResourceEvents : IUnknown
{
    HRESULT OnResourceCreate(COMSVCSEVENTINFO*, ulong, const(wchar)*, ulong, BOOL);
    HRESULT OnResourceAllocate(COMSVCSEVENTINFO*, ulong, const(wchar)*, ulong, BOOL, uint, uint);
    HRESULT OnResourceRecycle(COMSVCSEVENTINFO*, ulong, const(wchar)*, ulong);
    HRESULT OnResourceDestroy(COMSVCSEVENTINFO*, ulong, HRESULT, const(wchar)*, ulong);
    HRESULT OnResourceTrack(COMSVCSEVENTINFO*, ulong, const(wchar)*, ulong, BOOL);
}
enum IID_IComSecurityEvents = GUID(0x683130ac, 0x2e50, 0x11d2, [0x98, 0xa5, 0x0, 0xc0, 0x4f, 0x8e, 0xe1, 0xc4]);
interface IComSecurityEvents : IUnknown
{
    HRESULT OnAuthenticate(COMSVCSEVENTINFO*, const(GUID)*, ulong, const(GUID)*, uint, uint, ubyte*, uint, ubyte*, BOOL);
    HRESULT OnAuthenticateFail(COMSVCSEVENTINFO*, const(GUID)*, ulong, const(GUID)*, uint, uint, ubyte*, uint, ubyte*, BOOL);
}
enum IID_IComObjectPoolEvents = GUID(0x683130ad, 0x2e50, 0x11d2, [0x98, 0xa5, 0x0, 0xc0, 0x4f, 0x8e, 0xe1, 0xc4]);
interface IComObjectPoolEvents : IUnknown
{
    HRESULT OnObjPoolPutObject(COMSVCSEVENTINFO*, const(GUID)*, int, uint, ulong);
    HRESULT OnObjPoolGetObject(COMSVCSEVENTINFO*, const(GUID)*, const(GUID)*, uint, ulong);
    HRESULT OnObjPoolRecycleToTx(COMSVCSEVENTINFO*, const(GUID)*, const(GUID)*, const(GUID)*, ulong);
    HRESULT OnObjPoolGetFromTx(COMSVCSEVENTINFO*, const(GUID)*, const(GUID)*, const(GUID)*, ulong);
}
enum IID_IComObjectPoolEvents2 = GUID(0x683130ae, 0x2e50, 0x11d2, [0x98, 0xa5, 0x0, 0xc0, 0x4f, 0x8e, 0xe1, 0xc4]);
interface IComObjectPoolEvents2 : IUnknown
{
    HRESULT OnObjPoolCreateObject(COMSVCSEVENTINFO*, const(GUID)*, uint, ulong);
    HRESULT OnObjPoolDestroyObject(COMSVCSEVENTINFO*, const(GUID)*, uint, ulong);
    HRESULT OnObjPoolCreateDecision(COMSVCSEVENTINFO*, uint, uint, uint, uint, uint);
    HRESULT OnObjPoolTimeout(COMSVCSEVENTINFO*, const(GUID)*, const(GUID)*, uint);
    HRESULT OnObjPoolCreatePool(COMSVCSEVENTINFO*, const(GUID)*, uint, uint, uint);
}
enum IID_IComObjectConstructionEvents = GUID(0x683130af, 0x2e50, 0x11d2, [0x98, 0xa5, 0x0, 0xc0, 0x4f, 0x8e, 0xe1, 0xc4]);
interface IComObjectConstructionEvents : IUnknown
{
    HRESULT OnObjectConstruct(COMSVCSEVENTINFO*, const(GUID)*, const(wchar)*, ulong);
}
enum IID_IComActivityEvents = GUID(0x683130b0, 0x2e50, 0x11d2, [0x98, 0xa5, 0x0, 0xc0, 0x4f, 0x8e, 0xe1, 0xc4]);
interface IComActivityEvents : IUnknown
{
    HRESULT OnActivityCreate(COMSVCSEVENTINFO*, const(GUID)*);
    HRESULT OnActivityDestroy(COMSVCSEVENTINFO*, const(GUID)*);
    HRESULT OnActivityEnter(COMSVCSEVENTINFO*, const(GUID)*, const(GUID)*, uint);
    HRESULT OnActivityTimeout(COMSVCSEVENTINFO*, const(GUID)*, const(GUID)*, uint, uint);
    HRESULT OnActivityReenter(COMSVCSEVENTINFO*, const(GUID)*, uint, uint);
    HRESULT OnActivityLeave(COMSVCSEVENTINFO*, const(GUID)*, const(GUID)*);
    HRESULT OnActivityLeaveSame(COMSVCSEVENTINFO*, const(GUID)*, uint);
}
enum IID_IComIdentityEvents = GUID(0x683130b1, 0x2e50, 0x11d2, [0x98, 0xa5, 0x0, 0xc0, 0x4f, 0x8e, 0xe1, 0xc4]);
interface IComIdentityEvents : IUnknown
{
    HRESULT OnIISRequestInfo(COMSVCSEVENTINFO*, ulong, const(wchar)*, const(wchar)*, const(wchar)*);
}
enum IID_IComQCEvents = GUID(0x683130b2, 0x2e50, 0x11d2, [0x98, 0xa5, 0x0, 0xc0, 0x4f, 0x8e, 0xe1, 0xc4]);
interface IComQCEvents : IUnknown
{
    HRESULT OnQCRecord(COMSVCSEVENTINFO*, ulong, PWSTR, const(GUID)*, const(GUID)*, HRESULT);
    HRESULT OnQCQueueOpen(COMSVCSEVENTINFO*, PWSTR, ulong, HRESULT);
    HRESULT OnQCReceive(COMSVCSEVENTINFO*, ulong, const(GUID)*, const(GUID)*, HRESULT);
    HRESULT OnQCReceiveFail(COMSVCSEVENTINFO*, ulong, HRESULT);
    HRESULT OnQCMoveToReTryQueue(COMSVCSEVENTINFO*, const(GUID)*, const(GUID)*, uint);
    HRESULT OnQCMoveToDeadQueue(COMSVCSEVENTINFO*, const(GUID)*, const(GUID)*);
    HRESULT OnQCPlayback(COMSVCSEVENTINFO*, ulong, const(GUID)*, const(GUID)*, HRESULT);
}
enum IID_IComExceptionEvents = GUID(0x683130b3, 0x2e50, 0x11d2, [0x98, 0xa5, 0x0, 0xc0, 0x4f, 0x8e, 0xe1, 0xc4]);
interface IComExceptionEvents : IUnknown
{
    HRESULT OnExceptionUser(COMSVCSEVENTINFO*, uint, ulong, const(wchar)*);
}
enum IID_ILBEvents = GUID(0x683130b4, 0x2e50, 0x11d2, [0x98, 0xa5, 0x0, 0xc0, 0x4f, 0x8e, 0xe1, 0xc4]);
interface ILBEvents : IUnknown
{
    HRESULT TargetUp(BSTR, BSTR);
    HRESULT TargetDown(BSTR, BSTR);
    HRESULT EngineDefined(BSTR, VARIANT*, BSTR);
}
enum IID_IComCRMEvents = GUID(0x683130b5, 0x2e50, 0x11d2, [0x98, 0xa5, 0x0, 0xc0, 0x4f, 0x8e, 0xe1, 0xc4]);
interface IComCRMEvents : IUnknown
{
    HRESULT OnCRMRecoveryStart(COMSVCSEVENTINFO*, GUID);
    HRESULT OnCRMRecoveryDone(COMSVCSEVENTINFO*, GUID);
    HRESULT OnCRMCheckpoint(COMSVCSEVENTINFO*, GUID);
    HRESULT OnCRMBegin(COMSVCSEVENTINFO*, GUID, GUID, GUID, PWSTR, PWSTR);
    HRESULT OnCRMPrepare(COMSVCSEVENTINFO*, GUID);
    HRESULT OnCRMCommit(COMSVCSEVENTINFO*, GUID);
    HRESULT OnCRMAbort(COMSVCSEVENTINFO*, GUID);
    HRESULT OnCRMIndoubt(COMSVCSEVENTINFO*, GUID);
    HRESULT OnCRMDone(COMSVCSEVENTINFO*, GUID);
    HRESULT OnCRMRelease(COMSVCSEVENTINFO*, GUID);
    HRESULT OnCRMAnalyze(COMSVCSEVENTINFO*, GUID, uint, uint);
    HRESULT OnCRMWrite(COMSVCSEVENTINFO*, GUID, BOOL, uint);
    HRESULT OnCRMForget(COMSVCSEVENTINFO*, GUID);
    HRESULT OnCRMForce(COMSVCSEVENTINFO*, GUID);
    HRESULT OnCRMDeliver(COMSVCSEVENTINFO*, GUID, BOOL, uint);
}
enum IID_IComMethod2Events = GUID(0xfb388aaa, 0x567d, 0x4024, [0xaf, 0x8e, 0x6e, 0x93, 0xee, 0x74, 0x85, 0x73]);
interface IComMethod2Events : IUnknown
{
    HRESULT OnMethodCall2(COMSVCSEVENTINFO*, ulong, const(GUID)*, const(GUID)*, uint, uint);
    HRESULT OnMethodReturn2(COMSVCSEVENTINFO*, ulong, const(GUID)*, const(GUID)*, uint, uint, HRESULT);
    HRESULT OnMethodException2(COMSVCSEVENTINFO*, ulong, const(GUID)*, const(GUID)*, uint, uint);
}
enum IID_IComTrackingInfoEvents = GUID(0x4e6cdcc9, 0xfb25, 0x4fd5, [0x9c, 0xc5, 0xc9, 0xf4, 0xb6, 0x55, 0x9c, 0xec]);
interface IComTrackingInfoEvents : IUnknown
{
    HRESULT OnNewTrackingInfo(IUnknown);
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
    HRESULT Type(TRACKING_COLL_TYPE*);
    HRESULT Count(uint*);
    HRESULT Item(uint, const(GUID)*, void**);
}
enum IID_IComTrackingInfoObject = GUID(0x116e42c5, 0xd8b1, 0x47bf, [0xab, 0x1e, 0xc8, 0x95, 0xed, 0x3e, 0x23, 0x72]);
interface IComTrackingInfoObject : IUnknown
{
    HRESULT GetValue(PWSTR, VARIANT*);
}
enum IID_IComTrackingInfoProperties = GUID(0x789b42be, 0x6f6b, 0x443a, [0x89, 0x8e, 0x67, 0xab, 0xf3, 0x90, 0xaa, 0x14]);
interface IComTrackingInfoProperties : IUnknown
{
    HRESULT PropCount(uint*);
    HRESULT GetPropName(uint, PWSTR*);
}
enum IID_IComApp2Events = GUID(0x1290bc1a, 0xb219, 0x418d, [0xb0, 0x78, 0x59, 0x34, 0xde, 0xd0, 0x82, 0x42]);
interface IComApp2Events : IUnknown
{
    HRESULT OnAppActivation2(COMSVCSEVENTINFO*, GUID, GUID);
    HRESULT OnAppShutdown2(COMSVCSEVENTINFO*, GUID);
    HRESULT OnAppForceShutdown2(COMSVCSEVENTINFO*, GUID);
    HRESULT OnAppPaused2(COMSVCSEVENTINFO*, GUID, BOOL);
    HRESULT OnAppRecycle2(COMSVCSEVENTINFO*, GUID, GUID, int);
}
enum IID_IComTransaction2Events = GUID(0xa136f62a, 0x2f94, 0x4288, [0x86, 0xe0, 0xd8, 0xa1, 0xfa, 0x4c, 0x2, 0x99]);
interface IComTransaction2Events : IUnknown
{
    HRESULT OnTransactionStart2(COMSVCSEVENTINFO*, const(GUID)*, const(GUID)*, BOOL, int);
    HRESULT OnTransactionPrepare2(COMSVCSEVENTINFO*, const(GUID)*, BOOL);
    HRESULT OnTransactionAbort2(COMSVCSEVENTINFO*, const(GUID)*);
    HRESULT OnTransactionCommit2(COMSVCSEVENTINFO*, const(GUID)*);
}
enum IID_IComInstance2Events = GUID(0x20e3bf07, 0xb506, 0x4ad5, [0xa5, 0xc, 0xd2, 0xca, 0x5b, 0x9c, 0x15, 0x8e]);
interface IComInstance2Events : IUnknown
{
    HRESULT OnObjectCreate2(COMSVCSEVENTINFO*, const(GUID)*, const(GUID)*, const(GUID)*, ulong, ulong, const(GUID)*);
    HRESULT OnObjectDestroy2(COMSVCSEVENTINFO*, ulong);
}
enum IID_IComObjectPool2Events = GUID(0x65bf6534, 0x85ea, 0x4f64, [0x8c, 0xf4, 0x3d, 0x97, 0x4b, 0x2a, 0xb1, 0xcf]);
interface IComObjectPool2Events : IUnknown
{
    HRESULT OnObjPoolPutObject2(COMSVCSEVENTINFO*, const(GUID)*, int, uint, ulong);
    HRESULT OnObjPoolGetObject2(COMSVCSEVENTINFO*, const(GUID)*, const(GUID)*, uint, ulong, const(GUID)*);
    HRESULT OnObjPoolRecycleToTx2(COMSVCSEVENTINFO*, const(GUID)*, const(GUID)*, const(GUID)*, ulong);
    HRESULT OnObjPoolGetFromTx2(COMSVCSEVENTINFO*, const(GUID)*, const(GUID)*, const(GUID)*, ulong, const(GUID)*);
}
enum IID_IComObjectConstruction2Events = GUID(0x4b5a7827, 0x8df2, 0x45c0, [0x8f, 0x6f, 0x57, 0xea, 0x1f, 0x85, 0x6a, 0x9f]);
interface IComObjectConstruction2Events : IUnknown
{
    HRESULT OnObjectConstruct2(COMSVCSEVENTINFO*, const(GUID)*, const(wchar)*, ulong, const(GUID)*);
}
enum IID_ISystemAppEventData = GUID(0xd6d48a3c, 0xd5c5, 0x49e7, [0x8c, 0x74, 0x99, 0xe4, 0x88, 0x9e, 0xd5, 0x2f]);
interface ISystemAppEventData : IUnknown
{
    HRESULT Startup();
    HRESULT OnDataChanged(uint, uint, uint, BSTR, uint, ulong);
}
enum IID_IMtsEvents = GUID(0xbacedf4d, 0x74ab, 0x11d0, [0xb1, 0x62, 0x0, 0xaa, 0x0, 0xba, 0x32, 0x58]);
interface IMtsEvents : IDispatch
{
    HRESULT get_PackageName(BSTR*);
    HRESULT get_PackageGuid(BSTR*);
    HRESULT PostEvent(VARIANT*);
    HRESULT get_FireEvents(short*);
    HRESULT GetProcessID(int*);
}
enum IID_IMtsEventInfo = GUID(0xd56c3dc1, 0x8482, 0x11d0, [0xb1, 0x70, 0x0, 0xaa, 0x0, 0xba, 0x32, 0x58]);
interface IMtsEventInfo : IDispatch
{
    HRESULT get_Names(IUnknown*);
    HRESULT get_DisplayName(BSTR*);
    HRESULT get_EventID(BSTR*);
    HRESULT get_Count(int*);
    HRESULT get_Value(BSTR, VARIANT*);
}
enum IID_IMTSLocator = GUID(0xd19b8bfd, 0x7f88, 0x11d0, [0xb1, 0x6e, 0x0, 0xaa, 0x0, 0xba, 0x32, 0x58]);
interface IMTSLocator : IDispatch
{
    HRESULT GetEventDispatcher(IUnknown*);
}
enum IID_IMtsGrp = GUID(0x4b2e958c, 0x393, 0x11d1, [0xb1, 0xab, 0x0, 0xaa, 0x0, 0xba, 0x32, 0x58]);
interface IMtsGrp : IDispatch
{
    HRESULT get_Count(int*);
    HRESULT Item(int, IUnknown*);
    HRESULT Refresh();
}
enum IID_IMessageMover = GUID(0x588a085a, 0xb795, 0x11d1, [0x80, 0x54, 0x0, 0xc0, 0x4f, 0xc3, 0x40, 0xee]);
interface IMessageMover : IDispatch
{
    HRESULT get_SourcePath(BSTR*);
    HRESULT put_SourcePath(BSTR);
    HRESULT get_DestPath(BSTR*);
    HRESULT put_DestPath(BSTR);
    HRESULT get_CommitBatchSize(int*);
    HRESULT put_CommitBatchSize(int);
    HRESULT MoveMessages(int*);
}
enum IID_IEventServerTrace = GUID(0x9a9f12b8, 0x80af, 0x47ab, [0xa5, 0x79, 0x35, 0xea, 0x57, 0x72, 0x53, 0x70]);
interface IEventServerTrace : IDispatch
{
    HRESULT StartTraceGuid(BSTR, BSTR, int);
    HRESULT StopTraceGuid(BSTR, BSTR, int);
    HRESULT EnumTraceGuid(int*, BSTR*);
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
    HRESULT GetApplicationProcesses(const(GUID)*, const(GUID)*, uint, uint*, ApplicationProcessSummary**);
    HRESULT GetApplicationProcessDetails(const(GUID)*, uint, uint, ApplicationProcessSummary*, ApplicationProcessStatistics*, ApplicationProcessRecycleInfo*, BOOL*);
    HRESULT GetApplicationsInProcess(const(GUID)*, uint, const(GUID)*, uint, uint*, ApplicationSummary**);
    HRESULT GetComponentsInProcess(const(GUID)*, uint, const(GUID)*, const(GUID)*, uint, uint*, ComponentSummary**);
    HRESULT GetComponentDetails(const(GUID)*, uint, const(GUID)*, uint, ComponentSummary*, ComponentStatistics*, ComponentHangMonitorInfo*);
    HRESULT GetTrackerDataAsCollectionObject(IUnknown*);
    HRESULT GetSuggestedPollingInterval(uint*);
}
enum IID_IDispenserManager = GUID(0x5cb31e10, 0x2b5f, 0x11cf, [0xbe, 0x10, 0x0, 0xaa, 0x0, 0xa2, 0xfa, 0x25]);
interface IDispenserManager : IUnknown
{
    HRESULT RegisterDispenser(IDispenserDriver, const(wchar)*, IHolder*);
    HRESULT GetContext(ulong*, ulong*);
}
enum IID_IHolder = GUID(0xbf6a1850, 0x2b45, 0x11cf, [0xbe, 0x10, 0x0, 0xaa, 0x0, 0xa2, 0xfa, 0x25]);
interface IHolder : IUnknown
{
    HRESULT AllocResource(const(ulong), ulong*);
    HRESULT FreeResource(const(ulong));
    HRESULT TrackResource(const(ulong));
    HRESULT TrackResourceS(ushort*);
    HRESULT UntrackResource(const(ulong), const(BOOL));
    HRESULT UntrackResourceS(ushort*, const(BOOL));
    HRESULT Close();
    HRESULT RequestDestroyResource(const(ulong));
}
enum IID_IDispenserDriver = GUID(0x208b3651, 0x2b48, 0x11cf, [0xbe, 0x10, 0x0, 0xaa, 0x0, 0xa2, 0xfa, 0x25]);
interface IDispenserDriver : IUnknown
{
    HRESULT CreateResource(const(ulong), ulong*, int*);
    HRESULT RateResource(const(ulong), const(ulong), const(BOOL), uint*);
    HRESULT EnlistResource(const(ulong), const(ulong));
    HRESULT ResetResource(const(ulong));
    HRESULT DestroyResource(const(ulong));
    HRESULT DestroyResourceS(ushort*);
}
enum IID_ITransactionProxy = GUID(0x2558374, 0xdf2e, 0x4dae, [0xbd, 0x6b, 0x1d, 0x5c, 0x99, 0x4f, 0x9b, 0xdc]);
interface ITransactionProxy : IUnknown
{
    HRESULT Commit(GUID);
    HRESULT Abort();
    HRESULT Promote(ITransaction*);
    HRESULT CreateVoter(ITransactionVoterNotifyAsync2, ITransactionVoterBallotAsync2*);
    HRESULT GetIsolationLevel(int*);
    HRESULT GetIdentifier(GUID*);
    HRESULT IsReusable(BOOL*);
}
enum IID_IContextSecurityPerimeter = GUID(0xa7549a29, 0xa7c4, 0x42e1, [0x8d, 0xc1, 0x7e, 0x3d, 0x74, 0x8d, 0xc2, 0x4a]);
interface IContextSecurityPerimeter : IUnknown
{
    HRESULT GetPerimeterFlag(BOOL*);
    HRESULT SetPerimeterFlag(BOOL);
}
enum IID_ITxProxyHolder = GUID(0x13d86f31, 0x139, 0x41af, [0xbc, 0xad, 0xc7, 0xd5, 0x4, 0x35, 0xfe, 0x9f]);
interface ITxProxyHolder : IUnknown
{
    void GetIdentifier(GUID*);
}
enum IID_IObjectContext = GUID(0x51372ae0, 0xcae7, 0x11cf, [0xbe, 0x81, 0x0, 0xaa, 0x0, 0xa2, 0xfa, 0x25]);
interface IObjectContext : IUnknown
{
    HRESULT CreateInstance(const(GUID)*, const(GUID)*, void**);
    HRESULT SetComplete();
    HRESULT SetAbort();
    HRESULT EnableCommit();
    HRESULT DisableCommit();
    BOOL IsInTransaction();
    BOOL IsSecurityEnabled();
    HRESULT IsCallerInRole(BSTR, BOOL*);
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
    HRESULT Next(uint, BSTR*, uint*);
    HRESULT Skip(uint);
    HRESULT Reset();
    HRESULT Clone(IEnumNames*);
}
enum IID_ISecurityProperty = GUID(0x51372aea, 0xcae7, 0x11cf, [0xbe, 0x81, 0x0, 0xaa, 0x0, 0xa2, 0xfa, 0x25]);
interface ISecurityProperty : IUnknown
{
    HRESULT GetDirectCreatorSID(PSID*);
    HRESULT GetOriginalCreatorSID(PSID*);
    HRESULT GetDirectCallerSID(PSID*);
    HRESULT GetOriginalCallerSID(PSID*);
    HRESULT ReleaseSID(PSID);
}
enum IID_ObjectControl = GUID(0x7dc41850, 0xc31, 0x11d0, [0x8b, 0x79, 0x0, 0xaa, 0x0, 0xb8, 0xa7, 0x90]);
interface ObjectControl : IUnknown
{
    HRESULT Activate();
    HRESULT Deactivate();
    HRESULT CanBePooled(short*);
}
enum IID_ISharedProperty = GUID(0x2a005c01, 0xa5de, 0x11cf, [0x9e, 0x66, 0x0, 0xaa, 0x0, 0xa3, 0xf4, 0x64]);
interface ISharedProperty : IDispatch
{
    HRESULT get_Value(VARIANT*);
    HRESULT put_Value(VARIANT);
}
enum IID_ISharedPropertyGroup = GUID(0x2a005c07, 0xa5de, 0x11cf, [0x9e, 0x66, 0x0, 0xaa, 0x0, 0xa3, 0xf4, 0x64]);
interface ISharedPropertyGroup : IDispatch
{
    HRESULT CreatePropertyByPosition(int, short*, ISharedProperty*);
    HRESULT get_PropertyByPosition(int, ISharedProperty*);
    HRESULT CreateProperty(BSTR, short*, ISharedProperty*);
    HRESULT get_Property(BSTR, ISharedProperty*);
}
enum IID_ISharedPropertyGroupManager = GUID(0x2a005c0d, 0xa5de, 0x11cf, [0x9e, 0x66, 0x0, 0xaa, 0x0, 0xa3, 0xf4, 0x64]);
interface ISharedPropertyGroupManager : IDispatch
{
    HRESULT CreatePropertyGroup(BSTR, int*, int*, short*, ISharedPropertyGroup*);
    HRESULT get_Group(BSTR, ISharedPropertyGroup*);
    HRESULT get__NewEnum(IUnknown*);
}
enum IID_IObjectConstruct = GUID(0x41c4f8b3, 0x7439, 0x11d2, [0x98, 0xcb, 0x0, 0xc0, 0x4f, 0x8e, 0xe1, 0xc4]);
interface IObjectConstruct : IUnknown
{
    HRESULT Construct(IDispatch);
}
enum IID_IObjectConstructString = GUID(0x41c4f8b2, 0x7439, 0x11d2, [0x98, 0xcb, 0x0, 0xc0, 0x4f, 0x8e, 0xe1, 0xc4]);
interface IObjectConstructString : IDispatch
{
    HRESULT get_ConstructString(BSTR*);
}
enum IID_IObjectContextActivity = GUID(0x51372afc, 0xcae7, 0x11cf, [0xbe, 0x81, 0x0, 0xaa, 0x0, 0xa2, 0xfa, 0x25]);
interface IObjectContextActivity : IUnknown
{
    HRESULT GetActivityId(GUID*);
}
enum IID_IObjectContextInfo = GUID(0x75b52ddb, 0xe8ed, 0x11d1, [0x93, 0xad, 0x0, 0xaa, 0x0, 0xba, 0x32, 0x58]);
interface IObjectContextInfo : IUnknown
{
    BOOL IsInTransaction();
    HRESULT GetTransaction(IUnknown*);
    HRESULT GetTransactionId(GUID*);
    HRESULT GetActivityId(GUID*);
    HRESULT GetContextId(GUID*);
}
enum IID_IObjectContextInfo2 = GUID(0x594be71a, 0x4bc4, 0x438b, [0x91, 0x97, 0xcf, 0xd1, 0x76, 0x24, 0x8b, 0x9]);
interface IObjectContextInfo2 : IObjectContextInfo
{
    HRESULT GetPartitionId(GUID*);
    HRESULT GetApplicationId(GUID*);
    HRESULT GetApplicationInstanceId(GUID*);
}
enum IID_ITransactionStatus = GUID(0x61f589e8, 0x3724, 0x4898, [0xa0, 0xa4, 0x66, 0x4a, 0xe9, 0xe1, 0xd1, 0xb4]);
interface ITransactionStatus : IUnknown
{
    HRESULT SetTransactionStatus(HRESULT);
    HRESULT GetTransactionStatus(HRESULT*);
}
enum IID_IObjectContextTip = GUID(0x92fd41ca, 0xbad9, 0x11d2, [0x9a, 0x2d, 0x0, 0xc0, 0x4f, 0x79, 0x7b, 0xc9]);
interface IObjectContextTip : IUnknown
{
    HRESULT GetTipUrl(BSTR*);
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
    HRESULT Count(int*);
    HRESULT GetProperty(BSTR, VARIANT*);
    HRESULT EnumNames(IEnumNames*);
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
    HRESULT SetDeactivateOnReturn(short);
    HRESULT GetDeactivateOnReturn(short*);
    HRESULT SetMyTransactionVote(TransactionVote);
    HRESULT GetMyTransactionVote(TransactionVote*);
}
enum IID_IPoolManager = GUID(0xa469861, 0x5a91, 0x43a0, [0x99, 0xb6, 0xd5, 0xe1, 0x79, 0xbb, 0x6, 0x31]);
interface IPoolManager : IDispatch
{
    HRESULT ShutdownPool(BSTR);
}
enum IID_ISelectCOMLBServer = GUID(0xdcf443f4, 0x3f8a, 0x4872, [0xb9, 0xf0, 0x36, 0x9a, 0x79, 0x6d, 0x12, 0xd6]);
interface ISelectCOMLBServer : IUnknown
{
    HRESULT Init();
    HRESULT GetLBServer(IUnknown);
}
enum IID_ICOMLBArguments = GUID(0x3a0f150f, 0x8ee5, 0x4b94, [0xb4, 0xe, 0xae, 0xf2, 0xf9, 0xe4, 0x2e, 0xd2]);
interface ICOMLBArguments : IUnknown
{
    HRESULT GetCLSID(GUID*);
    HRESULT SetCLSID(GUID*);
    HRESULT GetMachineName(uint, PWSTR);
    HRESULT SetMachineName(uint, PWSTR);
}
enum IID_ICrmLogControl = GUID(0xa0e174b3, 0xd26e, 0x11d2, [0x8f, 0x84, 0x0, 0x80, 0x5f, 0xc7, 0xbc, 0xd9]);
interface ICrmLogControl : IUnknown
{
    HRESULT get_TransactionUOW(BSTR*);
    HRESULT RegisterCompensator(const(wchar)*, const(wchar)*, int);
    HRESULT WriteLogRecordVariants(VARIANT*);
    HRESULT ForceLog();
    HRESULT ForgetLogRecord();
    HRESULT ForceTransactionToAbort();
    HRESULT WriteLogRecord(BLOB*, uint);
}
enum IID_ICrmCompensatorVariants = GUID(0xf0baf8e4, 0x7804, 0x11d1, [0x82, 0xe9, 0x0, 0xa0, 0xc9, 0x1e, 0xed, 0xe9]);
interface ICrmCompensatorVariants : IUnknown
{
    HRESULT SetLogControlVariants(ICrmLogControl);
    HRESULT BeginPrepareVariants();
    HRESULT PrepareRecordVariants(VARIANT*, short*);
    HRESULT EndPrepareVariants(short*);
    HRESULT BeginCommitVariants(short);
    HRESULT CommitRecordVariants(VARIANT*, short*);
    HRESULT EndCommitVariants();
    HRESULT BeginAbortVariants(short);
    HRESULT AbortRecordVariants(VARIANT*, short*);
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
    HRESULT SetLogControl(ICrmLogControl);
    HRESULT BeginPrepare();
    HRESULT PrepareRecord(CrmLogRecordRead, BOOL*);
    HRESULT EndPrepare(BOOL*);
    HRESULT BeginCommit(BOOL);
    HRESULT CommitRecord(CrmLogRecordRead, BOOL*);
    HRESULT EndCommit();
    HRESULT BeginAbort(BOOL);
    HRESULT AbortRecord(CrmLogRecordRead, BOOL*);
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
    HRESULT get_Count(int*);
    HRESULT get_TransactionState(CrmTransactionState*);
    HRESULT get_StructuredRecords(short*);
    HRESULT GetLogRecord(uint, CrmLogRecordRead*);
    HRESULT GetLogRecordVariants(VARIANT, VARIANT*);
}
enum IID_ICrmMonitorClerks = GUID(0x70c8e442, 0xc7ed, 0x11d1, [0x82, 0xfb, 0x0, 0xa0, 0xc9, 0x1e, 0xed, 0xe9]);
interface ICrmMonitorClerks : IDispatch
{
    HRESULT Item(VARIANT, VARIANT*);
    HRESULT get__NewEnum(IUnknown*);
    HRESULT get_Count(int*);
    HRESULT ProgIdCompensator(VARIANT, VARIANT*);
    HRESULT Description(VARIANT, VARIANT*);
    HRESULT TransactionUOW(VARIANT, VARIANT*);
    HRESULT ActivityId(VARIANT, VARIANT*);
}
enum IID_ICrmMonitor = GUID(0x70c8e443, 0xc7ed, 0x11d1, [0x82, 0xfb, 0x0, 0xa0, 0xc9, 0x1e, 0xed, 0xe9]);
interface ICrmMonitor : IUnknown
{
    HRESULT GetClerks(ICrmMonitorClerks*);
    HRESULT HoldClerk(VARIANT, VARIANT*);
}
enum IID_ICrmFormatLogRecords = GUID(0x9c51d821, 0xc98b, 0x11d1, [0x82, 0xfb, 0x0, 0xa0, 0xc9, 0x1e, 0xed, 0xe9]);
interface ICrmFormatLogRecords : IUnknown
{
    HRESULT GetColumnCount(int*);
    HRESULT GetColumnHeaders(VARIANT*);
    HRESULT GetColumn(CrmLogRecordRead, VARIANT*);
    HRESULT GetColumnVariants(VARIANT, VARIANT*);
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
    HRESULT IISIntrinsicsConfig(CSC_IISIntrinsicsConfig);
}
enum IID_IServiceComTIIntrinsicsConfig = GUID(0x9e6831e, 0x4e1, 0x4ed4, [0x9d, 0xf, 0xe8, 0xb1, 0x68, 0xba, 0xfe, 0xaf]);
interface IServiceComTIIntrinsicsConfig : IUnknown
{
    HRESULT ComTIIntrinsicsConfig(CSC_COMTIIntrinsicsConfig);
}
enum IID_IServiceSxsConfig = GUID(0xc7cd7379, 0xf3f2, 0x4634, [0x81, 0x1b, 0x70, 0x32, 0x81, 0xd7, 0x3e, 0x8]);
interface IServiceSxsConfig : IUnknown
{
    HRESULT SxsConfig(CSC_SxsConfig);
    HRESULT SxsName(const(wchar)*);
    HRESULT SxsDirectory(const(wchar)*);
}
enum IID_ICheckSxsConfig = GUID(0xff5a96f, 0x11fc, 0x47d1, [0xba, 0xa6, 0x25, 0xdd, 0x34, 0x7e, 0x72, 0x42]);
interface ICheckSxsConfig : IUnknown
{
    HRESULT IsSameSxsConfig(const(wchar)*, const(wchar)*, const(wchar)*);
}
enum IID_IServiceInheritanceConfig = GUID(0x92186771, 0xd3b4, 0x4d77, [0xa8, 0xea, 0xee, 0x84, 0x2d, 0x58, 0x6f, 0x35]);
interface IServiceInheritanceConfig : IUnknown
{
    HRESULT ContainingContextTreatment(CSC_InheritanceConfig);
}
enum IID_IServiceThreadPoolConfig = GUID(0x186d89bc, 0xf277, 0x4bcc, [0x80, 0xd5, 0x4d, 0xf7, 0xb8, 0x36, 0xef, 0x4a]);
interface IServiceThreadPoolConfig : IUnknown
{
    HRESULT SelectThreadPool(CSC_ThreadPool);
    HRESULT SetBindingInfo(CSC_Binding);
}
enum IID_IServiceTransactionConfigBase = GUID(0x772b3fbe, 0x6ffd, 0x42fb, [0xb5, 0xf8, 0x8f, 0x9b, 0x26, 0xf, 0x38, 0x10]);
interface IServiceTransactionConfigBase : IUnknown
{
    HRESULT ConfigureTransaction(CSC_TransactionConfig);
    HRESULT IsolationLevel(COMAdminTxIsolationLevelOptions);
    HRESULT TransactionTimeout(uint);
    HRESULT BringYourOwnTransaction(const(wchar)*);
    HRESULT NewTransactionDescription(const(wchar)*);
}
enum IID_IServiceTransactionConfig = GUID(0x59f4c2a3, 0xd3d7, 0x4a31, [0xb6, 0xe4, 0x6a, 0xb3, 0x17, 0x7c, 0x50, 0xb9]);
interface IServiceTransactionConfig : IServiceTransactionConfigBase
{
    HRESULT ConfigureBYOT(ITransaction);
}
enum IID_IServiceSysTxnConfig = GUID(0x33caf1a1, 0xfcb8, 0x472b, [0xb4, 0x5e, 0x96, 0x74, 0x48, 0xde, 0xd6, 0xd8]);
interface IServiceSysTxnConfig : IServiceTransactionConfig
{
    HRESULT ConfigureBYOTSysTxn(ITransactionProxy);
}
enum IID_IServiceSynchronizationConfig = GUID(0xfd880e81, 0x6dce, 0x4c58, [0xaf, 0x83, 0xa2, 0x8, 0x84, 0x6c, 0x0, 0x30]);
interface IServiceSynchronizationConfig : IUnknown
{
    HRESULT ConfigureSynchronization(CSC_SynchronizationConfig);
}
enum IID_IServiceTrackerConfig = GUID(0x6c3a3e1d, 0xba6, 0x4036, [0xb7, 0x6f, 0xd0, 0x40, 0x4d, 0xb8, 0x16, 0xc9]);
interface IServiceTrackerConfig : IUnknown
{
    HRESULT TrackerConfig(CSC_TrackerConfig, const(wchar)*, const(wchar)*);
}
enum IID_IServicePartitionConfig = GUID(0x80182d03, 0x5ea4, 0x4831, [0xae, 0x97, 0x55, 0xbe, 0xff, 0xc2, 0xe5, 0x90]);
interface IServicePartitionConfig : IUnknown
{
    HRESULT PartitionConfig(CSC_PartitionConfig);
    HRESULT PartitionID(const(GUID)*);
}
enum IID_IServiceCall = GUID(0xbd3e2e12, 0x42dd, 0x40f4, [0xa0, 0x9a, 0x95, 0xa5, 0xc, 0x58, 0x30, 0x4b]);
interface IServiceCall : IUnknown
{
    HRESULT OnCall();
}
enum IID_IAsyncErrorNotify = GUID(0xfe6777fb, 0xa674, 0x4177, [0x8f, 0x32, 0x6d, 0x70, 0x7e, 0x11, 0x34, 0x84]);
interface IAsyncErrorNotify : IUnknown
{
    HRESULT OnError(HRESULT);
}
enum IID_IServiceActivity = GUID(0x67532e0c, 0x9e2f, 0x4450, [0xa3, 0x54, 0x3, 0x56, 0x33, 0x94, 0x4e, 0x17]);
interface IServiceActivity : IUnknown
{
    HRESULT SynchronousCall(IServiceCall);
    HRESULT AsynchronousCall(IServiceCall);
    HRESULT BindToCurrentThread();
    HRESULT UnbindFromThread();
}
enum IID_IThreadPoolKnobs = GUID(0x51372af7, 0xcae7, 0x11cf, [0xbe, 0x81, 0x0, 0xaa, 0x0, 0xa2, 0xfa, 0x25]);
interface IThreadPoolKnobs : IUnknown
{
    HRESULT GetMaxThreads(int*);
    HRESULT GetCurrentThreads(int*);
    HRESULT SetMaxThreads(int);
    HRESULT GetDeleteDelay(int*);
    HRESULT SetDeleteDelay(int);
    HRESULT GetMaxQueuedRequests(int*);
    HRESULT GetCurrentQueuedRequests(int*);
    HRESULT SetMaxQueuedRequests(int);
    HRESULT SetMinThreads(int);
    HRESULT SetQueueDepth(int);
}
enum IID_IComStaThreadPoolKnobs = GUID(0x324b64fa, 0x33b6, 0x11d2, [0x98, 0xb7, 0x0, 0xc0, 0x4f, 0x8e, 0xe1, 0xc4]);
interface IComStaThreadPoolKnobs : IUnknown
{
    HRESULT SetMinThreadCount(uint);
    HRESULT GetMinThreadCount(uint*);
    HRESULT SetMaxThreadCount(uint);
    HRESULT GetMaxThreadCount(uint*);
    HRESULT SetActivityPerThread(uint);
    HRESULT GetActivityPerThread(uint*);
    HRESULT SetActivityRatio(double);
    HRESULT GetActivityRatio(double*);
    HRESULT GetThreadCount(uint*);
    HRESULT GetQueueDepth(uint*);
    HRESULT SetQueueDepth(int);
}
enum IID_IComMtaThreadPoolKnobs = GUID(0xf9a76d2e, 0x76a5, 0x43eb, [0xa0, 0xc4, 0x49, 0xbe, 0xc8, 0xe4, 0x84, 0x80]);
interface IComMtaThreadPoolKnobs : IUnknown
{
    HRESULT MTASetMaxThreadCount(uint);
    HRESULT MTAGetMaxThreadCount(uint*);
    HRESULT MTASetThrottleValue(uint);
    HRESULT MTAGetThrottleValue(uint*);
}
enum IID_IComStaThreadPoolKnobs2 = GUID(0x73707523, 0xff9a, 0x4974, [0xbf, 0x84, 0x21, 0x8, 0xdc, 0x21, 0x37, 0x40]);
interface IComStaThreadPoolKnobs2 : IComStaThreadPoolKnobs
{
    HRESULT GetMaxCPULoad(uint*);
    HRESULT SetMaxCPULoad(int);
    HRESULT GetCPUMetricEnabled(BOOL*);
    HRESULT SetCPUMetricEnabled(BOOL);
    HRESULT GetCreateThreadsAggressively(BOOL*);
    HRESULT SetCreateThreadsAggressively(BOOL);
    HRESULT GetMaxCSR(uint*);
    HRESULT SetMaxCSR(int);
    HRESULT GetWaitTimeForThreadCleanup(uint*);
    HRESULT SetWaitTimeForThreadCleanup(int);
}
enum IID_IProcessInitializer = GUID(0x1113f52d, 0xdc7f, 0x4943, [0xae, 0xd6, 0x88, 0xd0, 0x40, 0x27, 0xe3, 0x2a]);
interface IProcessInitializer : IUnknown
{
    HRESULT Startup(IUnknown);
    HRESULT Shutdown();
}
enum IID_IServicePoolConfig = GUID(0xa9690656, 0x5bca, 0x470c, [0x84, 0x51, 0x25, 0xc, 0x1f, 0x43, 0xa3, 0x3e]);
interface IServicePoolConfig : IUnknown
{
    HRESULT put_MaxPoolSize(uint);
    HRESULT get_MaxPoolSize(uint*);
    HRESULT put_MinPoolSize(uint);
    HRESULT get_MinPoolSize(uint*);
    HRESULT put_CreationTimeout(uint);
    HRESULT get_CreationTimeout(uint*);
    HRESULT put_TransactionAffinity(BOOL);
    HRESULT get_TransactionAffinity(BOOL*);
    HRESULT put_ClassFactory(IClassFactory);
    HRESULT get_ClassFactory(IClassFactory*);
}
enum IID_IServicePool = GUID(0xb302df81, 0xea45, 0x451e, [0x99, 0xa2, 0x9, 0xf9, 0xfd, 0x1b, 0x1e, 0x13]);
interface IServicePool : IUnknown
{
    HRESULT Initialize(IUnknown);
    HRESULT GetObject(const(GUID)*, void**);
    HRESULT Shutdown();
}
enum IID_IManagedPooledObj = GUID(0xc5da4bea, 0x1b42, 0x4437, [0x89, 0x26, 0xb6, 0xa3, 0x88, 0x60, 0xa7, 0x70]);
interface IManagedPooledObj : IUnknown
{
    HRESULT SetHeld(BOOL);
}
enum IID_IManagedPoolAction = GUID(0xda91b74e, 0x5388, 0x4783, [0x94, 0x9d, 0xc1, 0xcd, 0x5f, 0xb0, 0x5, 0x6]);
interface IManagedPoolAction : IUnknown
{
    HRESULT LastRelease();
}
enum IID_IManagedObjectInfo = GUID(0x1427c51a, 0x4584, 0x49d8, [0x90, 0xa0, 0xc5, 0xd, 0x80, 0x86, 0xcb, 0xe9]);
interface IManagedObjectInfo : IUnknown
{
    HRESULT GetIUnknown(IUnknown*);
    HRESULT GetIObjectControl(IObjectControl*);
    HRESULT SetInPool(BOOL, IManagedPooledObj);
    HRESULT SetWrapperStrength(BOOL);
}
enum IID_IAppDomainHelper = GUID(0xc7b67079, 0x8255, 0x42c6, [0x9e, 0xc0, 0x69, 0x94, 0xa3, 0x54, 0x87, 0x80]);
interface IAppDomainHelper : IDispatch
{
    HRESULT Initialize(IUnknown, long, void*);
    HRESULT DoCallback(IUnknown, long, void*);
}
enum IID_IAssemblyLocator = GUID(0x391ffbb9, 0xa8ee, 0x432a, [0xab, 0xc8, 0xba, 0xa2, 0x38, 0xda, 0xb9, 0xf]);
interface IAssemblyLocator : IDispatch
{
    HRESULT GetModules(BSTR, BSTR, BSTR, SAFEARRAY**);
}
enum IID_IManagedActivationEvents = GUID(0xa5f325af, 0x572f, 0x46da, [0xb8, 0xab, 0x82, 0x7c, 0x3d, 0x95, 0xd9, 0x9e]);
interface IManagedActivationEvents : IUnknown
{
    HRESULT CreateManagedStub(IManagedObjectInfo, BOOL);
    HRESULT DestroyManagedStub(IManagedObjectInfo);
}
enum IID_ISendMethodEvents = GUID(0x2732fd59, 0xb2b4, 0x4d44, [0x87, 0x8c, 0x8b, 0x8f, 0x9, 0x62, 0x60, 0x8]);
interface ISendMethodEvents : IUnknown
{
    HRESULT SendMethodCall(const(void)*, const(GUID)*, uint);
    HRESULT SendMethodReturn(const(void)*, const(GUID)*, uint, HRESULT, HRESULT);
}
enum IID_ITransactionResourcePool = GUID(0xc5feb7c1, 0x346a, 0x11d1, [0xb1, 0xcc, 0x0, 0xaa, 0x0, 0xba, 0x32, 0x58]);
interface ITransactionResourcePool : IUnknown
{
    HRESULT PutResource(IObjPool, IUnknown);
    HRESULT GetResource(IObjPool, IUnknown*);
}
enum IID_IMTSCall = GUID(0x51372aef, 0xcae7, 0x11cf, [0xbe, 0x81, 0x0, 0xaa, 0x0, 0xa2, 0xfa, 0x25]);
interface IMTSCall : IUnknown
{
    HRESULT OnCall();
}
enum IID_IContextProperties = GUID(0xd396da85, 0xbf8f, 0x11d1, [0xbb, 0xae, 0x0, 0xc0, 0x4f, 0xc2, 0xfa, 0x5f]);
interface IContextProperties : IUnknown
{
    HRESULT Count(int*);
    HRESULT GetProperty(BSTR, VARIANT*);
    HRESULT EnumNames(IEnumNames*);
    HRESULT SetProperty(BSTR, VARIANT);
    HRESULT RemoveProperty(BSTR);
}
enum IID_IObjPool = GUID(0x7d8805a0, 0x2ea7, 0x11d1, [0xb1, 0xcc, 0x0, 0xaa, 0x0, 0xba, 0x32, 0x58]);
interface IObjPool : IUnknown
{
    void Reserved1();
    void Reserved2();
    void Reserved3();
    void Reserved4();
    void PutEndTx(IUnknown);
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
    HRESULT GetTransactionResourcePool(ITransactionResourcePool*);
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
    HRESULT SynchronousCall(IMTSCall);
    HRESULT AsyncCall(IMTSCall);
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

