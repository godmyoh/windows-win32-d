module windows.win32.devices.properties;

import windows.win32.guid : GUID;
import windows.win32.foundation : PWSTR;

version (Windows):
extern (Windows):

enum DEVPROP_TRUE = 0xff;
enum DEVPROP_FALSE = 0x00;
//enum DEVPKEY_DeviceInterface_Autoplay_Silent = [MISSING];
//enum DEVPKEY_NAME = [MISSING];
//enum DEVPKEY_Device_DeviceDesc = [MISSING];
//enum DEVPKEY_Device_HardwareIds = [MISSING];
//enum DEVPKEY_Device_CompatibleIds = [MISSING];
//enum DEVPKEY_Device_Service = [MISSING];
//enum DEVPKEY_Device_Class = [MISSING];
//enum DEVPKEY_Device_ClassGuid = [MISSING];
//enum DEVPKEY_Device_Driver = [MISSING];
//enum DEVPKEY_Device_ConfigFlags = [MISSING];
//enum DEVPKEY_Device_Manufacturer = [MISSING];
//enum DEVPKEY_Device_FriendlyName = [MISSING];
//enum DEVPKEY_Device_LocationInfo = [MISSING];
//enum DEVPKEY_Device_PDOName = [MISSING];
//enum DEVPKEY_Device_Capabilities = [MISSING];
//enum DEVPKEY_Device_UINumber = [MISSING];
//enum DEVPKEY_Device_UpperFilters = [MISSING];
//enum DEVPKEY_Device_LowerFilters = [MISSING];
//enum DEVPKEY_Device_BusTypeGuid = [MISSING];
//enum DEVPKEY_Device_LegacyBusType = [MISSING];
//enum DEVPKEY_Device_BusNumber = [MISSING];
//enum DEVPKEY_Device_EnumeratorName = [MISSING];
//enum DEVPKEY_Device_Security = [MISSING];
//enum DEVPKEY_Device_SecuritySDS = [MISSING];
//enum DEVPKEY_Device_DevType = [MISSING];
//enum DEVPKEY_Device_Exclusive = [MISSING];
//enum DEVPKEY_Device_Characteristics = [MISSING];
//enum DEVPKEY_Device_Address = [MISSING];
//enum DEVPKEY_Device_UINumberDescFormat = [MISSING];
//enum DEVPKEY_Device_PowerData = [MISSING];
//enum DEVPKEY_Device_RemovalPolicy = [MISSING];
//enum DEVPKEY_Device_RemovalPolicyDefault = [MISSING];
//enum DEVPKEY_Device_RemovalPolicyOverride = [MISSING];
//enum DEVPKEY_Device_InstallState = [MISSING];
//enum DEVPKEY_Device_LocationPaths = [MISSING];
//enum DEVPKEY_Device_BaseContainerId = [MISSING];
//enum DEVPKEY_Device_InstanceId = [MISSING];
//enum DEVPKEY_Device_DevNodeStatus = [MISSING];
//enum DEVPKEY_Device_ProblemCode = [MISSING];
//enum DEVPKEY_Device_EjectionRelations = [MISSING];
//enum DEVPKEY_Device_RemovalRelations = [MISSING];
//enum DEVPKEY_Device_PowerRelations = [MISSING];
//enum DEVPKEY_Device_BusRelations = [MISSING];
//enum DEVPKEY_Device_Parent = [MISSING];
//enum DEVPKEY_Device_Children = [MISSING];
//enum DEVPKEY_Device_Siblings = [MISSING];
//enum DEVPKEY_Device_TransportRelations = [MISSING];
//enum DEVPKEY_Device_ProblemStatus = [MISSING];
//enum DEVPKEY_Device_Reported = [MISSING];
//enum DEVPKEY_Device_Legacy = [MISSING];
//enum DEVPKEY_Device_ContainerId = [MISSING];
//enum DEVPKEY_Device_InLocalMachineContainer = [MISSING];
//enum DEVPKEY_Device_Model = [MISSING];
//enum DEVPKEY_Device_ModelId = [MISSING];
//enum DEVPKEY_Device_FriendlyNameAttributes = [MISSING];
//enum DEVPKEY_Device_ManufacturerAttributes = [MISSING];
//enum DEVPKEY_Device_PresenceNotForDevice = [MISSING];
//enum DEVPKEY_Device_SignalStrength = [MISSING];
//enum DEVPKEY_Device_IsAssociateableByUserAction = [MISSING];
//enum DEVPKEY_Device_ShowInUninstallUI = [MISSING];
//enum DEVPKEY_Device_Numa_Proximity_Domain = [MISSING];
//enum DEVPKEY_Device_DHP_Rebalance_Policy = [MISSING];
//enum DEVPKEY_Device_Numa_Node = [MISSING];
//enum DEVPKEY_Device_BusReportedDeviceDesc = [MISSING];
//enum DEVPKEY_Device_IsPresent = [MISSING];
//enum DEVPKEY_Device_HasProblem = [MISSING];
//enum DEVPKEY_Device_ConfigurationId = [MISSING];
//enum DEVPKEY_Device_ReportedDeviceIdsHash = [MISSING];
//enum DEVPKEY_Device_PhysicalDeviceLocation = [MISSING];
//enum DEVPKEY_Device_BiosDeviceName = [MISSING];
//enum DEVPKEY_Device_DriverProblemDesc = [MISSING];
//enum DEVPKEY_Device_DebuggerSafe = [MISSING];
//enum DEVPKEY_Device_PostInstallInProgress = [MISSING];
//enum DEVPKEY_Device_Stack = [MISSING];
//enum DEVPKEY_Device_ExtendedConfigurationIds = [MISSING];
//enum DEVPKEY_Device_IsRebootRequired = [MISSING];
//enum DEVPKEY_Device_FirmwareDate = [MISSING];
//enum DEVPKEY_Device_FirmwareVersion = [MISSING];
//enum DEVPKEY_Device_FirmwareRevision = [MISSING];
//enum DEVPKEY_Device_DependencyProviders = [MISSING];
//enum DEVPKEY_Device_DependencyDependents = [MISSING];
//enum DEVPKEY_Device_SoftRestartSupported = [MISSING];
//enum DEVPKEY_Device_ExtendedAddress = [MISSING];
//enum DEVPKEY_Device_AssignedToGuest = [MISSING];
//enum DEVPKEY_Device_CreatorProcessId = [MISSING];
//enum DEVPKEY_Device_FirmwareVendor = [MISSING];
//enum DEVPKEY_Device_SessionId = [MISSING];
//enum DEVPKEY_Device_InstallDate = [MISSING];
//enum DEVPKEY_Device_FirstInstallDate = [MISSING];
//enum DEVPKEY_Device_LastArrivalDate = [MISSING];
//enum DEVPKEY_Device_LastRemovalDate = [MISSING];
//enum DEVPKEY_Device_DriverDate = [MISSING];
//enum DEVPKEY_Device_DriverVersion = [MISSING];
//enum DEVPKEY_Device_DriverDesc = [MISSING];
//enum DEVPKEY_Device_DriverInfPath = [MISSING];
//enum DEVPKEY_Device_DriverInfSection = [MISSING];
//enum DEVPKEY_Device_DriverInfSectionExt = [MISSING];
//enum DEVPKEY_Device_MatchingDeviceId = [MISSING];
//enum DEVPKEY_Device_DriverProvider = [MISSING];
//enum DEVPKEY_Device_DriverPropPageProvider = [MISSING];
//enum DEVPKEY_Device_DriverCoInstallers = [MISSING];
//enum DEVPKEY_Device_ResourcePickerTags = [MISSING];
//enum DEVPKEY_Device_ResourcePickerExceptions = [MISSING];
//enum DEVPKEY_Device_DriverRank = [MISSING];
//enum DEVPKEY_Device_DriverLogoLevel = [MISSING];
//enum DEVPKEY_Device_NoConnectSound = [MISSING];
//enum DEVPKEY_Device_GenericDriverInstalled = [MISSING];
//enum DEVPKEY_Device_AdditionalSoftwareRequested = [MISSING];
//enum DEVPKEY_Device_SafeRemovalRequired = [MISSING];
//enum DEVPKEY_Device_SafeRemovalRequiredOverride = [MISSING];
//enum DEVPKEY_DrvPkg_Model = [MISSING];
//enum DEVPKEY_DrvPkg_VendorWebSite = [MISSING];
//enum DEVPKEY_DrvPkg_DetailedDescription = [MISSING];
//enum DEVPKEY_DrvPkg_DocumentationLink = [MISSING];
//enum DEVPKEY_DrvPkg_Icon = [MISSING];
//enum DEVPKEY_DrvPkg_BrandingIcon = [MISSING];
//enum DEVPKEY_DeviceClass_UpperFilters = [MISSING];
//enum DEVPKEY_DeviceClass_LowerFilters = [MISSING];
//enum DEVPKEY_DeviceClass_Security = [MISSING];
//enum DEVPKEY_DeviceClass_SecuritySDS = [MISSING];
//enum DEVPKEY_DeviceClass_DevType = [MISSING];
//enum DEVPKEY_DeviceClass_Exclusive = [MISSING];
//enum DEVPKEY_DeviceClass_Characteristics = [MISSING];
//enum DEVPKEY_DeviceClass_Name = [MISSING];
//enum DEVPKEY_DeviceClass_ClassName = [MISSING];
//enum DEVPKEY_DeviceClass_Icon = [MISSING];
//enum DEVPKEY_DeviceClass_ClassInstaller = [MISSING];
//enum DEVPKEY_DeviceClass_PropPageProvider = [MISSING];
//enum DEVPKEY_DeviceClass_NoInstallClass = [MISSING];
//enum DEVPKEY_DeviceClass_NoDisplayClass = [MISSING];
//enum DEVPKEY_DeviceClass_SilentInstall = [MISSING];
//enum DEVPKEY_DeviceClass_NoUseClass = [MISSING];
//enum DEVPKEY_DeviceClass_DefaultService = [MISSING];
//enum DEVPKEY_DeviceClass_IconPath = [MISSING];
//enum DEVPKEY_DeviceClass_DHPRebalanceOptOut = [MISSING];
//enum DEVPKEY_DeviceClass_ClassCoInstallers = [MISSING];
//enum DEVPKEY_DeviceInterface_FriendlyName = [MISSING];
//enum DEVPKEY_DeviceInterface_Enabled = [MISSING];
//enum DEVPKEY_DeviceInterface_ClassGuid = [MISSING];
//enum DEVPKEY_DeviceInterface_ReferenceString = [MISSING];
//enum DEVPKEY_DeviceInterface_Restricted = [MISSING];
//enum DEVPKEY_DeviceInterface_UnrestrictedAppCapabilities = [MISSING];
//enum DEVPKEY_DeviceInterface_SchematicName = [MISSING];
//enum DEVPKEY_DeviceInterfaceClass_DefaultInterface = [MISSING];
//enum DEVPKEY_DeviceInterfaceClass_Name = [MISSING];
//enum DEVPKEY_DeviceContainer_Address = [MISSING];
//enum DEVPKEY_DeviceContainer_DiscoveryMethod = [MISSING];
//enum DEVPKEY_DeviceContainer_IsEncrypted = [MISSING];
//enum DEVPKEY_DeviceContainer_IsAuthenticated = [MISSING];
//enum DEVPKEY_DeviceContainer_IsConnected = [MISSING];
//enum DEVPKEY_DeviceContainer_IsPaired = [MISSING];
//enum DEVPKEY_DeviceContainer_Icon = [MISSING];
//enum DEVPKEY_DeviceContainer_Version = [MISSING];
//enum DEVPKEY_DeviceContainer_Last_Seen = [MISSING];
//enum DEVPKEY_DeviceContainer_Last_Connected = [MISSING];
//enum DEVPKEY_DeviceContainer_IsShowInDisconnectedState = [MISSING];
//enum DEVPKEY_DeviceContainer_IsLocalMachine = [MISSING];
//enum DEVPKEY_DeviceContainer_MetadataPath = [MISSING];
//enum DEVPKEY_DeviceContainer_IsMetadataSearchInProgress = [MISSING];
//enum DEVPKEY_DeviceContainer_MetadataChecksum = [MISSING];
//enum DEVPKEY_DeviceContainer_IsNotInterestingForDisplay = [MISSING];
//enum DEVPKEY_DeviceContainer_LaunchDeviceStageOnDeviceConnect = [MISSING];
//enum DEVPKEY_DeviceContainer_LaunchDeviceStageFromExplorer = [MISSING];
//enum DEVPKEY_DeviceContainer_BaselineExperienceId = [MISSING];
//enum DEVPKEY_DeviceContainer_IsDeviceUniquelyIdentifiable = [MISSING];
//enum DEVPKEY_DeviceContainer_AssociationArray = [MISSING];
//enum DEVPKEY_DeviceContainer_DeviceDescription1 = [MISSING];
//enum DEVPKEY_DeviceContainer_DeviceDescription2 = [MISSING];
//enum DEVPKEY_DeviceContainer_HasProblem = [MISSING];
//enum DEVPKEY_DeviceContainer_IsSharedDevice = [MISSING];
//enum DEVPKEY_DeviceContainer_IsNetworkDevice = [MISSING];
//enum DEVPKEY_DeviceContainer_IsDefaultDevice = [MISSING];
//enum DEVPKEY_DeviceContainer_MetadataCabinet = [MISSING];
//enum DEVPKEY_DeviceContainer_RequiresPairingElevation = [MISSING];
//enum DEVPKEY_DeviceContainer_ExperienceId = [MISSING];
//enum DEVPKEY_DeviceContainer_Category = [MISSING];
//enum DEVPKEY_DeviceContainer_Category_Desc_Singular = [MISSING];
//enum DEVPKEY_DeviceContainer_Category_Desc_Plural = [MISSING];
//enum DEVPKEY_DeviceContainer_Category_Icon = [MISSING];
//enum DEVPKEY_DeviceContainer_CategoryGroup_Desc = [MISSING];
//enum DEVPKEY_DeviceContainer_CategoryGroup_Icon = [MISSING];
//enum DEVPKEY_DeviceContainer_PrimaryCategory = [MISSING];
//enum DEVPKEY_DeviceContainer_UnpairUninstall = [MISSING];
//enum DEVPKEY_DeviceContainer_RequiresUninstallElevation = [MISSING];
//enum DEVPKEY_DeviceContainer_DeviceFunctionSubRank = [MISSING];
//enum DEVPKEY_DeviceContainer_AlwaysShowDeviceAsConnected = [MISSING];
//enum DEVPKEY_DeviceContainer_ConfigFlags = [MISSING];
//enum DEVPKEY_DeviceContainer_PrivilegedPackageFamilyNames = [MISSING];
//enum DEVPKEY_DeviceContainer_CustomPrivilegedPackageFamilyNames = [MISSING];
//enum DEVPKEY_DeviceContainer_IsRebootRequired = [MISSING];
//enum DEVPKEY_DeviceContainer_FriendlyName = [MISSING];
//enum DEVPKEY_DeviceContainer_Manufacturer = [MISSING];
//enum DEVPKEY_DeviceContainer_ModelName = [MISSING];
//enum DEVPKEY_DeviceContainer_ModelNumber = [MISSING];
//enum DEVPKEY_DeviceContainer_InstallInProgress = [MISSING];
//enum DEVPKEY_DevQuery_ObjectType = [MISSING];
enum DEVPROP_TYPEMOD_ARRAY = 0x00001000;
enum DEVPROP_TYPEMOD_LIST = 0x00002000;
enum MAX_DEVPROP_TYPE = 0x00000019;
enum MAX_DEVPROP_TYPEMOD = 0x00002000;
enum DEVPROP_MASK_TYPE = 0x00000fff;
enum DEVPROP_MASK_TYPEMOD = 0x0000f000;
enum DEVPROPID_FIRST_USABLE = 0x00000002;
alias DEVPROPTYPE = uint;
enum : uint
{
    DEVPROP_TYPE_EMPTY                      = 0x00000000,
    DEVPROP_TYPE_NULL                       = 0x00000001,
    DEVPROP_TYPE_SBYTE                      = 0x00000002,
    DEVPROP_TYPE_BYTE                       = 0x00000003,
    DEVPROP_TYPE_INT16                      = 0x00000004,
    DEVPROP_TYPE_UINT16                     = 0x00000005,
    DEVPROP_TYPE_INT32                      = 0x00000006,
    DEVPROP_TYPE_UINT32                     = 0x00000007,
    DEVPROP_TYPE_INT64                      = 0x00000008,
    DEVPROP_TYPE_UINT64                     = 0x00000009,
    DEVPROP_TYPE_FLOAT                      = 0x0000000a,
    DEVPROP_TYPE_DOUBLE                     = 0x0000000b,
    DEVPROP_TYPE_DECIMAL                    = 0x0000000c,
    DEVPROP_TYPE_GUID                       = 0x0000000d,
    DEVPROP_TYPE_CURRENCY                   = 0x0000000e,
    DEVPROP_TYPE_DATE                       = 0x0000000f,
    DEVPROP_TYPE_FILETIME                   = 0x00000010,
    DEVPROP_TYPE_BOOLEAN                    = 0x00000011,
    DEVPROP_TYPE_STRING                     = 0x00000012,
    DEVPROP_TYPE_STRING_LIST                = 0x00002012,
    DEVPROP_TYPE_SECURITY_DESCRIPTOR        = 0x00000013,
    DEVPROP_TYPE_SECURITY_DESCRIPTOR_STRING = 0x00000014,
    DEVPROP_TYPE_DEVPROPKEY                 = 0x00000015,
    DEVPROP_TYPE_DEVPROPTYPE                = 0x00000016,
    DEVPROP_TYPE_BINARY                     = 0x00001003,
    DEVPROP_TYPE_ERROR                      = 0x00000017,
    DEVPROP_TYPE_NTSTATUS                   = 0x00000018,
    DEVPROP_TYPE_STRING_INDIRECT            = 0x00000019,
}

alias DEVPROP_BOOLEAN = ubyte;
struct DEVPROPKEY
{
    GUID fmtid;
    uint pid;
}
alias DEVPROPSTORE = int;
enum : int
{
    DEVPROP_STORE_SYSTEM = 0x00000000,
    DEVPROP_STORE_USER   = 0x00000001,
}

struct DEVPROPCOMPKEY
{
    DEVPROPKEY Key;
    DEVPROPSTORE Store;
    const(wchar)* LocaleName;
}
struct DEVPROPERTY
{
    DEVPROPCOMPKEY CompKey;
    DEVPROPTYPE Type;
    uint BufferSize;
    void* Buffer;
}
