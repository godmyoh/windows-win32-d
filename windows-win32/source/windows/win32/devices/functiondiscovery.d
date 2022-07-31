module windows.win32.devices.functiondiscovery;

import windows.win32.guid : GUID;
import windows.win32.foundation : BOOL, HRESULT, PWSTR;
import windows.win32.system.com_ : IServiceProvider, IUnknown;
import windows.win32.system.com.structuredstorage : PROPVARIANT, STGM;
import windows.win32.ui.shell.propertiessystem : IPropertyStore, PROPERTYKEY;

version (Windows):
extern (Windows):

enum FD_EVENTID_PRIVATE = 0x00000064;
enum FD_EVENTID = 0x000003e8;
enum FD_EVENTID_SEARCHCOMPLETE = 0x000003e8;
enum FD_EVENTID_ASYNCTHREADEXIT = 0x000003e9;
enum FD_EVENTID_SEARCHSTART = 0x000003ea;
enum FD_EVENTID_IPADDRESSCHANGE = 0x000003eb;
enum FD_EVENTID_QUERYREFRESH = 0x000003ec;
enum SID_PnpProvider = GUID(0x8101368e, 0xcabb, 0x4426, [0xac, 0xff, 0x96, 0xc4, 0x10, 0x81, 0x20, 0x0]);
enum SID_UPnPActivator = GUID(0xd0d66eb, 0xcf74, 0x4164, [0xb5, 0x2f, 0x8, 0x34, 0x46, 0x72, 0xdd, 0x46]);
enum SID_EnumInterface = GUID(0x40eab0b9, 0x4d7f, 0x4b53, [0xa3, 0x34, 0x15, 0x81, 0xdd, 0x90, 0x41, 0xf4]);
enum SID_PNPXPropertyStore = GUID(0xa86530b1, 0x542f, 0x439f, [0xb7, 0x1c, 0xb0, 0x75, 0x6b, 0x13, 0x67, 0x7a]);
enum SID_PNPXAssociation = GUID(0xcee8ccc9, 0x4f6b, 0x4469, [0xa2, 0x35, 0x5a, 0x22, 0x86, 0x9e, 0xef, 0x3]);
enum SID_PNPXServiceCollection = GUID(0x439e80ee, 0xa217, 0x4712, [0x9f, 0xa6, 0xde, 0xab, 0xd9, 0xc2, 0xa7, 0x27]);
enum SID_FDPairingHandler = GUID(0x383b69fa, 0x5486, 0x49da, [0x91, 0xf5, 0xd6, 0x3c, 0x24, 0xc8, 0xe9, 0xd0]);
enum SID_EnumDeviceFunction = GUID(0x13e0e9e2, 0xc3fa, 0x4e3c, [0x90, 0x6e, 0x64, 0x50, 0x2f, 0xa4, 0xdc, 0x95]);
enum SID_UnpairProvider = GUID(0x89a502fc, 0x857b, 0x4698, [0xa0, 0xb7, 0x2, 0x71, 0x92, 0x0, 0x2f, 0x9e]);
enum SID_DeviceDisplayStatusManager = GUID(0xf59aa553, 0x8309, 0x46ca, [0x97, 0x36, 0x1a, 0xc3, 0xc6, 0x2d, 0x60, 0x31]);
enum SID_FunctionDiscoveryProviderRefresh = GUID(0x2b4cbdc9, 0x31c4, 0x40d4, [0xa6, 0x2d, 0x77, 0x2a, 0xa1, 0x74, 0xed, 0x52]);
enum SID_UninstallDeviceFunction = GUID(0xc920566e, 0x5671, 0x4496, [0x80, 0x25, 0xbf, 0xb, 0x89, 0xbd, 0x44, 0xcd]);
//enum PKEY_FunctionInstance = [MISSING];
enum FMTID_FD = GUID(0x904b03a2, 0x471d, 0x423c, [0xa5, 0x84, 0xf3, 0x48, 0x32, 0x38, 0xa1, 0x46]);
enum FD_Visibility_Default = 0x00000000;
enum FD_Visibility_Hidden = 0x00000001;
enum FMTID_Device = GUID(0x78c34fc8, 0x104a, 0x4aca, [0x9e, 0xa4, 0x52, 0x4d, 0x52, 0x99, 0x6e, 0x57]);
enum FMTID_DeviceInterface = GUID(0x53808008, 0x7bb, 0x4661, [0xbc, 0x3c, 0xb5, 0x95, 0x3e, 0x70, 0x85, 0x60]);
//enum PKEY_DeviceDisplay_Address = [MISSING];
//enum PKEY_DeviceDisplay_DiscoveryMethod = [MISSING];
//enum PKEY_DeviceDisplay_IsEncrypted = [MISSING];
//enum PKEY_DeviceDisplay_IsAuthenticated = [MISSING];
//enum PKEY_DeviceDisplay_IsConnected = [MISSING];
//enum PKEY_DeviceDisplay_IsPaired = [MISSING];
//enum PKEY_DeviceDisplay_Icon = [MISSING];
//enum PKEY_DeviceDisplay_Version = [MISSING];
//enum PKEY_DeviceDisplay_Last_Seen = [MISSING];
//enum PKEY_DeviceDisplay_Last_Connected = [MISSING];
//enum PKEY_DeviceDisplay_IsShowInDisconnectedState = [MISSING];
//enum PKEY_DeviceDisplay_IsLocalMachine = [MISSING];
//enum PKEY_DeviceDisplay_MetadataPath = [MISSING];
//enum PKEY_DeviceDisplay_IsMetadataSearchInProgress = [MISSING];
//enum PKEY_DeviceDisplay_MetadataChecksum = [MISSING];
//enum PKEY_DeviceDisplay_IsNotInterestingForDisplay = [MISSING];
//enum PKEY_DeviceDisplay_LaunchDeviceStageOnDeviceConnect = [MISSING];
//enum PKEY_DeviceDisplay_LaunchDeviceStageFromExplorer = [MISSING];
//enum PKEY_DeviceDisplay_BaselineExperienceId = [MISSING];
//enum PKEY_DeviceDisplay_IsDeviceUniquelyIdentifiable = [MISSING];
//enum PKEY_DeviceDisplay_AssociationArray = [MISSING];
//enum PKEY_DeviceDisplay_DeviceDescription1 = [MISSING];
//enum PKEY_DeviceDisplay_DeviceDescription2 = [MISSING];
//enum PKEY_DeviceDisplay_IsNotWorkingProperly = [MISSING];
//enum PKEY_DeviceDisplay_IsSharedDevice = [MISSING];
//enum PKEY_DeviceDisplay_IsNetworkDevice = [MISSING];
//enum PKEY_DeviceDisplay_IsDefaultDevice = [MISSING];
//enum PKEY_DeviceDisplay_MetadataCabinet = [MISSING];
//enum PKEY_DeviceDisplay_RequiresPairingElevation = [MISSING];
//enum PKEY_DeviceDisplay_ExperienceId = [MISSING];
//enum PKEY_DeviceDisplay_Category = [MISSING];
//enum PKEY_DeviceDisplay_Category_Desc_Singular = [MISSING];
//enum PKEY_DeviceDisplay_Category_Desc_Plural = [MISSING];
//enum PKEY_DeviceDisplay_Category_Icon = [MISSING];
//enum PKEY_DeviceDisplay_CategoryGroup_Desc = [MISSING];
//enum PKEY_DeviceDisplay_CategoryGroup_Icon = [MISSING];
//enum PKEY_DeviceDisplay_PrimaryCategory = [MISSING];
//enum PKEY_DeviceDisplay_UnpairUninstall = [MISSING];
//enum PKEY_DeviceDisplay_RequiresUninstallElevation = [MISSING];
//enum PKEY_DeviceDisplay_DeviceFunctionSubRank = [MISSING];
//enum PKEY_DeviceDisplay_AlwaysShowDeviceAsConnected = [MISSING];
//enum PKEY_DeviceDisplay_FriendlyName = [MISSING];
//enum PKEY_DeviceDisplay_Manufacturer = [MISSING];
//enum PKEY_DeviceDisplay_ModelName = [MISSING];
//enum PKEY_DeviceDisplay_ModelNumber = [MISSING];
//enum PKEY_DeviceDisplay_InstallInProgress = [MISSING];
enum FMTID_Pairing = GUID(0x8807cae6, 0x7db6, 0x4f10, [0x8e, 0xe4, 0x43, 0x5e, 0xaa, 0x13, 0x92, 0xbc]);
//enum PKEY_Pairing_ListItemText = [MISSING];
//enum PKEY_Pairing_ListItemDescription = [MISSING];
//enum PKEY_Pairing_ListItemIcon = [MISSING];
//enum PKEY_Pairing_ListItemDefault = [MISSING];
//enum PKEY_Pairing_IsWifiOnlyDevice = [MISSING];
enum DEVICEDISPLAY_DISCOVERYMETHOD_BLUETOOTH = "Bluetooth";
enum DEVICEDISPLAY_DISCOVERYMETHOD_BLUETOOTH_LE = "Bluetooth Low Energy";
enum DEVICEDISPLAY_DISCOVERYMETHOD_NETBIOS = "NetBIOS";
enum DEVICEDISPLAY_DISCOVERYMETHOD_AD_PRINTER = "Published Printer";
enum DEVICEDISPLAY_DISCOVERYMETHOD_PNP = "PnP";
enum DEVICEDISPLAY_DISCOVERYMETHOD_UPNP = "UPnP";
enum DEVICEDISPLAY_DISCOVERYMETHOD_WSD = "WSD";
enum DEVICEDISPLAY_DISCOVERYMETHOD_WUSB = "WUSB";
enum DEVICEDISPLAY_DISCOVERYMETHOD_WFD = "WiFiDirect";
enum DEVICEDISPLAY_DISCOVERYMETHOD_ASP_INFRA = "AspInfra";
//enum PKEY_Device_BIOSVersion = [MISSING];
enum FMTID_WSD = GUID(0x92506491, 0xff95, 0x4724, [0xa0, 0x5a, 0x5b, 0x81, 0x88, 0x5a, 0x7c, 0x92]);
enum FMTID_PNPX = GUID(0x656a3bb3, 0xecc0, 0x43fd, [0x84, 0x77, 0x4a, 0xe0, 0x40, 0x4a, 0x96, 0xcd]);
//enum PKEY_PNPX_GlobalIdentity = [MISSING];
//enum PKEY_PNPX_Types = [MISSING];
//enum PKEY_PNPX_Scopes = [MISSING];
//enum PKEY_PNPX_XAddrs = [MISSING];
//enum PKEY_PNPX_MetadataVersion = [MISSING];
//enum PKEY_PNPX_ID = [MISSING];
//enum PKEY_PNPX_RemoteAddress = [MISSING];
//enum PKEY_PNPX_RootProxy = [MISSING];
//enum PKEY_PNPX_ManufacturerUrl = [MISSING];
//enum PKEY_PNPX_ModelUrl = [MISSING];
//enum PKEY_PNPX_Upc = [MISSING];
//enum PKEY_PNPX_PresentationUrl = [MISSING];
//enum PKEY_PNPX_FirmwareVersion = [MISSING];
//enum PKEY_PNPX_SerialNumber = [MISSING];
//enum PKEY_PNPX_DeviceCategory = [MISSING];
//enum PKEY_PNPX_SecureChannel = [MISSING];
//enum PKEY_PNPX_CompactSignature = [MISSING];
//enum PKEY_PNPX_DeviceCertHash = [MISSING];
enum PNPX_DEVICECATEGORY_COMPUTER = "Computers";
enum PNPX_DEVICECATEGORY_INPUTDEVICE = "Input";
enum PNPX_DEVICECATEGORY_PRINTER = "Printers";
enum PNPX_DEVICECATEGORY_SCANNER = "Scanners";
enum PNPX_DEVICECATEGORY_FAX = "FAX";
enum PNPX_DEVICECATEGORY_MFP = "MFP";
enum PNPX_DEVICECATEGORY_CAMERA = "Cameras";
enum PNPX_DEVICECATEGORY_STORAGE = "Storage";
enum PNPX_DEVICECATEGORY_NETWORK_INFRASTRUCTURE = "NetworkInfrastructure";
enum PNPX_DEVICECATEGORY_DISPLAYS = "Displays";
enum PNPX_DEVICECATEGORY_MULTIMEDIA_DEVICE = "MediaDevices";
enum PNPX_DEVICECATEGORY_GAMING_DEVICE = "Gaming";
enum PNPX_DEVICECATEGORY_TELEPHONE = "Phones";
enum PNPX_DEVICECATEGORY_HOME_AUTOMATION_SYSTEM = "HomeAutomation";
enum PNPX_DEVICECATEGORY_HOME_SECURITY_SYSTEM = "HomeSecurity";
enum PNPX_DEVICECATEGORY_OTHER = "Other";
//enum PKEY_PNPX_DeviceCategory_Desc = [MISSING];
//enum PKEY_PNPX_Category_Desc_NonPlural = [MISSING];
//enum PKEY_PNPX_PhysicalAddress = [MISSING];
//enum PKEY_PNPX_NetworkInterfaceLuid = [MISSING];
//enum PKEY_PNPX_NetworkInterfaceGuid = [MISSING];
//enum PKEY_PNPX_IpAddress = [MISSING];
//enum PKEY_PNPX_ServiceAddress = [MISSING];
//enum PKEY_PNPX_ServiceId = [MISSING];
//enum PKEY_PNPX_ServiceTypes = [MISSING];
//enum PKEY_PNPX_ServiceControlUrl = [MISSING];
//enum PKEY_PNPX_ServiceDescUrl = [MISSING];
//enum PKEY_PNPX_ServiceEventSubUrl = [MISSING];
//enum PKEY_PNPX_DomainName = [MISSING];
//enum PKEY_PNPX_ShareName = [MISSING];
//enum PKEY_SSDP_AltLocationInfo = [MISSING];
//enum PKEY_SSDP_DevLifeTime = [MISSING];
//enum PKEY_SSDP_NetworkInterface = [MISSING];
enum FMTID_PNPXDynamicProperty = GUID(0x4fc5077e, 0xb686, 0x44be, [0x93, 0xe3, 0x86, 0xca, 0xfe, 0x36, 0x8c, 0xcd]);
//enum PKEY_PNPX_Installable = [MISSING];
//enum PKEY_PNPX_Associated = [MISSING];
//enum PKEY_PNPX_CompatibleTypes = [MISSING];
//enum PKEY_PNPX_InstallState = [MISSING];
enum PNPX_INSTALLSTATE_NOTINSTALLED = 0x00000000;
enum PNPX_INSTALLSTATE_INSTALLED = 0x00000001;
enum PNPX_INSTALLSTATE_INSTALLING = 0x00000002;
enum PNPX_INSTALLSTATE_FAILED = 0x00000003;
//enum PKEY_PNPX_Removable = [MISSING];
//enum PKEY_PNPX_IPBusEnumerated = [MISSING];
//enum PKEY_WNET_Scope = [MISSING];
//enum PKEY_WNET_Type = [MISSING];
//enum PKEY_WNET_DisplayType = [MISSING];
//enum PKEY_WNET_Usage = [MISSING];
//enum PKEY_WNET_LocalName = [MISSING];
//enum PKEY_WNET_RemoteName = [MISSING];
//enum PKEY_WNET_Comment = [MISSING];
//enum PKEY_WNET_Provider = [MISSING];
//enum PKEY_WCN_Version = [MISSING];
//enum PKEY_WCN_RequestType = [MISSING];
//enum PKEY_WCN_AuthType = [MISSING];
//enum PKEY_WCN_EncryptType = [MISSING];
//enum PKEY_WCN_ConnType = [MISSING];
//enum PKEY_WCN_ConfigMethods = [MISSING];
//enum PKEY_WCN_RfBand = [MISSING];
//enum PKEY_WCN_AssocState = [MISSING];
//enum PKEY_WCN_ConfigError = [MISSING];
//enum PKEY_WCN_ConfigState = [MISSING];
//enum PKEY_WCN_DevicePasswordId = [MISSING];
//enum PKEY_WCN_OSVersion = [MISSING];
//enum PKEY_WCN_VendorExtension = [MISSING];
//enum PKEY_WCN_RegistrarType = [MISSING];
//enum PKEY_Hardware_Devinst = [MISSING];
//enum PKEY_Hardware_DisplayAttribute = [MISSING];
//enum PKEY_Hardware_DriverDate = [MISSING];
//enum PKEY_Hardware_DriverProvider = [MISSING];
//enum PKEY_Hardware_DriverVersion = [MISSING];
//enum PKEY_Hardware_Function = [MISSING];
//enum PKEY_Hardware_Icon = [MISSING];
//enum PKEY_Hardware_Image = [MISSING];
//enum PKEY_Hardware_Manufacturer = [MISSING];
//enum PKEY_Hardware_Model = [MISSING];
//enum PKEY_Hardware_Name = [MISSING];
//enum PKEY_Hardware_SerialNumber = [MISSING];
//enum PKEY_Hardware_ShellAttributes = [MISSING];
//enum PKEY_Hardware_Status = [MISSING];
//enum PKEY_NAME = [MISSING];
//enum PKEY_Device_DeviceDesc = [MISSING];
//enum PKEY_Device_HardwareIds = [MISSING];
//enum PKEY_Device_CompatibleIds = [MISSING];
//enum PKEY_Device_Service = [MISSING];
//enum PKEY_Device_Class = [MISSING];
//enum PKEY_Device_ClassGuid = [MISSING];
//enum PKEY_Device_Driver = [MISSING];
//enum PKEY_Device_ConfigFlags = [MISSING];
//enum PKEY_Device_Manufacturer = [MISSING];
//enum PKEY_Device_FriendlyName = [MISSING];
//enum PKEY_Device_LocationInfo = [MISSING];
//enum PKEY_Device_PDOName = [MISSING];
//enum PKEY_Device_Capabilities = [MISSING];
//enum PKEY_Device_UINumber = [MISSING];
//enum PKEY_Device_UpperFilters = [MISSING];
//enum PKEY_Device_LowerFilters = [MISSING];
//enum PKEY_Device_BusTypeGuid = [MISSING];
//enum PKEY_Device_LegacyBusType = [MISSING];
//enum PKEY_Device_BusNumber = [MISSING];
//enum PKEY_Device_EnumeratorName = [MISSING];
//enum PKEY_Device_Security = [MISSING];
//enum PKEY_Device_SecuritySDS = [MISSING];
//enum PKEY_Device_DevType = [MISSING];
//enum PKEY_Device_Exclusive = [MISSING];
//enum PKEY_Device_Characteristics = [MISSING];
//enum PKEY_Device_Address = [MISSING];
//enum PKEY_Device_UINumberDescFormat = [MISSING];
//enum PKEY_Device_PowerData = [MISSING];
//enum PKEY_Device_RemovalPolicy = [MISSING];
//enum PKEY_Device_RemovalPolicyDefault = [MISSING];
//enum PKEY_Device_RemovalPolicyOverride = [MISSING];
//enum PKEY_Device_InstallState = [MISSING];
//enum PKEY_Device_LocationPaths = [MISSING];
//enum PKEY_Device_BaseContainerId = [MISSING];
//enum PKEY_Device_DevNodeStatus = [MISSING];
//enum PKEY_Device_ProblemCode = [MISSING];
//enum PKEY_Device_EjectionRelations = [MISSING];
//enum PKEY_Device_RemovalRelations = [MISSING];
//enum PKEY_Device_PowerRelations = [MISSING];
//enum PKEY_Device_BusRelations = [MISSING];
//enum PKEY_Device_Parent = [MISSING];
//enum PKEY_Device_Children = [MISSING];
//enum PKEY_Device_Siblings = [MISSING];
//enum PKEY_Device_TransportRelations = [MISSING];
//enum PKEY_Device_Reported = [MISSING];
//enum PKEY_Device_Legacy = [MISSING];
//enum PKEY_Device_InstanceId = [MISSING];
//enum PKEY_Device_ContainerId = [MISSING];
//enum PKEY_Device_ModelId = [MISSING];
//enum PKEY_Device_FriendlyNameAttributes = [MISSING];
//enum PKEY_Device_ManufacturerAttributes = [MISSING];
//enum PKEY_Device_PresenceNotForDevice = [MISSING];
//enum PKEY_Device_SignalStrength = [MISSING];
//enum PKEY_Device_IsAssociateableByUserAction = [MISSING];
//enum PKEY_Numa_Proximity_Domain = [MISSING];
//enum PKEY_Device_DHP_Rebalance_Policy = [MISSING];
//enum PKEY_Device_Numa_Node = [MISSING];
//enum PKEY_Device_BusReportedDeviceDesc = [MISSING];
//enum PKEY_Device_InstallInProgress = [MISSING];
//enum PKEY_Device_DriverDate = [MISSING];
//enum PKEY_Device_DriverVersion = [MISSING];
//enum PKEY_Device_DriverDesc = [MISSING];
//enum PKEY_Device_DriverInfPath = [MISSING];
//enum PKEY_Device_DriverInfSection = [MISSING];
//enum PKEY_Device_DriverInfSectionExt = [MISSING];
//enum PKEY_Device_MatchingDeviceId = [MISSING];
//enum PKEY_Device_DriverProvider = [MISSING];
//enum PKEY_Device_DriverPropPageProvider = [MISSING];
//enum PKEY_Device_DriverCoInstallers = [MISSING];
//enum PKEY_Device_ResourcePickerTags = [MISSING];
//enum PKEY_Device_ResourcePickerExceptions = [MISSING];
//enum PKEY_Device_DriverRank = [MISSING];
//enum PKEY_Device_DriverLogoLevel = [MISSING];
//enum PKEY_Device_NoConnectSound = [MISSING];
//enum PKEY_Device_GenericDriverInstalled = [MISSING];
//enum PKEY_Device_AdditionalSoftwareRequested = [MISSING];
//enum PKEY_Device_SafeRemovalRequired = [MISSING];
//enum PKEY_Device_SafeRemovalRequiredOverride = [MISSING];
//enum PKEY_DrvPkg_Model = [MISSING];
//enum PKEY_DrvPkg_VendorWebSite = [MISSING];
//enum PKEY_DrvPkg_DetailedDescription = [MISSING];
//enum PKEY_DrvPkg_DocumentationLink = [MISSING];
//enum PKEY_DrvPkg_Icon = [MISSING];
//enum PKEY_DrvPkg_BrandingIcon = [MISSING];
//enum PKEY_DeviceClass_UpperFilters = [MISSING];
//enum PKEY_DeviceClass_LowerFilters = [MISSING];
//enum PKEY_DeviceClass_Security = [MISSING];
//enum PKEY_DeviceClass_SecuritySDS = [MISSING];
//enum PKEY_DeviceClass_DevType = [MISSING];
//enum PKEY_DeviceClass_Exclusive = [MISSING];
//enum PKEY_DeviceClass_Characteristics = [MISSING];
//enum PKEY_DeviceClass_Name = [MISSING];
//enum PKEY_DeviceClass_ClassName = [MISSING];
//enum PKEY_DeviceClass_Icon = [MISSING];
//enum PKEY_DeviceClass_ClassInstaller = [MISSING];
//enum PKEY_DeviceClass_PropPageProvider = [MISSING];
//enum PKEY_DeviceClass_NoInstallClass = [MISSING];
//enum PKEY_DeviceClass_NoDisplayClass = [MISSING];
//enum PKEY_DeviceClass_SilentInstall = [MISSING];
//enum PKEY_DeviceClass_NoUseClass = [MISSING];
//enum PKEY_DeviceClass_DefaultService = [MISSING];
//enum PKEY_DeviceClass_IconPath = [MISSING];
//enum PKEY_DeviceClass_ClassCoInstallers = [MISSING];
//enum PKEY_DeviceInterface_FriendlyName = [MISSING];
//enum PKEY_DeviceInterface_Enabled = [MISSING];
//enum PKEY_DeviceInterface_ClassGuid = [MISSING];
//enum PKEY_DeviceInterfaceClass_DefaultInterface = [MISSING];
enum FD_LONGHORN = 0x00000001;
enum FD_SUBKEY = "SOFTWARE\\Microsoft\\Function Discovery\\";
enum FCTN_CATEGORY_PNP = "Provider\\Microsoft.Base.PnP";
enum FCTN_CATEGORY_REGISTRY = "Provider\\Microsoft.Base.Registry";
enum FCTN_CATEGORY_SSDP = "Provider\\Microsoft.Networking.SSDP";
enum FCTN_CATEGORY_WSDISCOVERY = "Provider\\Microsoft.Networking.WSD";
enum FCTN_CATEGORY_NETBIOS = "Provider\\Microsoft.Networking.Netbios";
enum FCTN_CATEGORY_WCN = "Provider\\Microsoft.Networking.WCN";
enum FCTN_CATEGORY_PUBLICATION = "Provider\\Microsoft.Base.Publication";
enum FCTN_CATEGORY_PNPXASSOCIATION = "Provider\\Microsoft.PnPX.Association";
enum FCTN_CATEGORY_BT = "Provider\\Microsoft.Devices.Bluetooth";
enum FCTN_CATEGORY_WUSB = "Provider\\Microsoft.Devices.WirelessUSB";
enum FCTN_CATEGORY_DEVICEDISPLAYOBJECTS = "Provider\\Microsoft.Base.DeviceDisplayObjects";
enum FCTN_CATEGORY_DEVQUERYOBJECTS = "Provider\\Microsoft.Base.DevQueryObjects";
enum FCTN_CATEGORY_NETWORKDEVICES = "Layered\\Microsoft.Networking.Devices";
enum FCTN_CATEGORY_DEVICES = "Layered\\Microsoft.Base.Devices";
enum FCTN_CATEGORY_DEVICEFUNCTIONENUMERATORS = "Layered\\Microsoft.Devices.FunctionEnumerators";
enum FCTN_CATEGORY_DEVICEPAIRING = "Layered\\Microsoft.Base.DevicePairing";
enum FCTN_SUBCAT_DEVICES_WSDPRINTERS = "WSDPrinters";
enum FCTN_SUBCAT_NETWORKDEVICES_SSDP = "SSDP";
enum FCTN_SUBCAT_NETWORKDEVICES_WSD = "WSD";
enum FCTN_SUBCAT_REG_PUBLICATION = "Publication";
enum FCTN_SUBCAT_REG_DIRECTED = "Directed";
enum MAX_FDCONSTRAINTNAME_LENGTH = 0x00000064;
enum MAX_FDCONSTRAINTVALUE_LENGTH = 0x000003e8;
enum FD_QUERYCONSTRAINT_PROVIDERINSTANCEID = "ProviderInstanceID";
enum FD_QUERYCONSTRAINT_SUBCATEGORY = "Subcategory";
enum FD_QUERYCONSTRAINT_RECURSESUBCATEGORY = "RecurseSubcategory";
enum FD_QUERYCONSTRAINT_VISIBILITY = "Visibility";
enum FD_QUERYCONSTRAINT_COMCLSCONTEXT = "COMClsContext";
enum FD_QUERYCONSTRAINT_ROUTINGSCOPE = "RoutingScope";
enum FD_CONSTRAINTVALUE_TRUE = "TRUE";
enum FD_CONSTRAINTVALUE_FALSE = "FALSE";
enum FD_CONSTRAINTVALUE_RECURSESUBCATEGORY_TRUE = "TRUE";
enum FD_CONSTRAINTVALUE_VISIBILITY_DEFAULT = "0";
enum FD_CONSTRAINTVALUE_VISIBILITY_ALL = "1";
enum FD_CONSTRAINTVALUE_COMCLSCONTEXT_INPROC_SERVER = "1";
enum FD_CONSTRAINTVALUE_COMCLSCONTEXT_LOCAL_SERVER = "4";
enum FD_CONSTRAINTVALUE_PAIRED = "Paired";
enum FD_CONSTRAINTVALUE_UNPAIRED = "UnPaired";
enum FD_CONSTRAINTVALUE_ALL = "All";
enum FD_CONSTRAINTVALUE_ROUTINGSCOPE_ALL = "All";
enum FD_CONSTRAINTVALUE_ROUTINGSCOPE_DIRECT = "Direct";
enum FD_QUERYCONSTRAINT_PAIRING_STATE = "PairingState";
enum FD_QUERYCONSTRAINT_INQUIRY_TIMEOUT = "InquiryModeTimeout";
enum PROVIDERPNP_QUERYCONSTRAINT_INTERFACECLASS = "InterfaceClass";
enum PROVIDERPNP_QUERYCONSTRAINT_NOTPRESENT = "NotPresent";
enum PROVIDERPNP_QUERYCONSTRAINT_NOTIFICATIONSONLY = "NotifyOnly";
enum PNP_CONSTRAINTVALUE_NOTPRESENT = "TRUE";
enum PNP_CONSTRAINTVALUE_NOTIFICATIONSONLY = "TRUE";
enum PROVIDERSSDP_QUERYCONSTRAINT_TYPE = "Type";
enum PROVIDERSSDP_QUERYCONSTRAINT_CUSTOMXMLPROPERTY = "CustomXmlProperty";
enum SSDP_CONSTRAINTVALUE_TYPE_ALL = "ssdp:all";
enum SSDP_CONSTRAINTVALUE_TYPE_ROOT = "upnp:rootdevice";
enum SSDP_CONSTRAINTVALUE_TYPE_DEVICE_PREFIX = "urn:schemas-upnp-org:device:";
enum SSDP_CONSTRAINTVALUE_TYPE_SVC_PREFIX = "urn:schemas-upnp-org:service:";
enum PROVIDERWSD_QUERYCONSTRAINT_DIRECTEDADDRESS = "RemoteAddress";
enum PROVIDERWSD_QUERYCONSTRAINT_TYPE = "Type";
enum PROVIDERWSD_QUERYCONSTRAINT_SCOPE = "Scope";
enum PROVIDERWSD_QUERYCONSTRAINT_SECURITY_REQUIREMENTS = "SecurityRequirements";
enum PROVIDERWSD_QUERYCONSTRAINT_SSL_CERT_FOR_CLIENT_AUTH = "SSLClientAuthCert";
enum PROVIDERWSD_QUERYCONSTRAINT_SSL_CERTHASH_FOR_SERVER_AUTH = "SSLServerAuthCertHash";
enum WSD_CONSTRAINTVALUE_REQUIRE_SECURECHANNEL = "1";
enum WSD_CONSTRAINTVALUE_REQUIRE_SECURECHANNEL_AND_COMPACTSIGNATURE = "2";
enum WSD_CONSTRAINTVALUE_NO_TRUST_VERIFICATION = "3";
enum PROVIDERWNET_QUERYCONSTRAINT_TYPE = "Type";
enum PROVIDERWNET_QUERYCONSTRAINT_PROPERTIES = "Properties";
enum PROVIDERWNET_QUERYCONSTRAINT_RESOURCETYPE = "ResourceType";
enum WNET_CONSTRAINTVALUE_TYPE_ALL = "All";
enum WNET_CONSTRAINTVALUE_TYPE_SERVER = "Server";
enum WNET_CONSTRAINTVALUE_TYPE_DOMAIN = "Domain";
enum WNET_CONSTRAINTVALUE_PROPERTIES_ALL = "All";
enum WNET_CONSTRAINTVALUE_PROPERTIES_LIMITED = "Limited";
enum WNET_CONSTRAINTVALUE_RESOURCETYPE_DISK = "Disk";
enum WNET_CONSTRAINTVALUE_RESOURCETYPE_PRINTER = "Printer";
enum WNET_CONSTRAINTVALUE_RESOURCETYPE_DISKORPRINTER = "DiskOrPrinter";
enum ONLINE_PROVIDER_DEVICES_QUERYCONSTRAINT_OWNERNAME = "OwnerName";
enum PROVIDERDDO_QUERYCONSTRAINT_DEVICEFUNCTIONDISPLAYOBJECTS = "DeviceFunctionDisplayObjects";
enum PROVIDERDDO_QUERYCONSTRAINT_ONLYCONNECTEDDEVICES = "OnlyConnectedDevices";
enum PROVIDERDDO_QUERYCONSTRAINT_DEVICEINTERFACES = "DeviceInterfaces";
enum E_FDPAIRING_NOCONNECTION = 0xffffffff8fd00001;
enum E_FDPAIRING_HWFAILURE = 0xffffffff8fd00002;
enum E_FDPAIRING_AUTHFAILURE = 0xffffffff8fd00003;
enum E_FDPAIRING_CONNECTTIMEOUT = 0xffffffff8fd00004;
enum E_FDPAIRING_TOOMANYCONNECTIONS = 0xffffffff8fd00005;
enum E_FDPAIRING_AUTHNOTALLOWED = 0xffffffff8fd00006;
enum E_FDPAIRING_IPBUSDISABLED = 0xffffffff8fd00007;
enum E_FDPAIRING_NOPROFILES = 0xffffffff8fd00008;
alias PropertyConstraint = int;
enum : int
{
    QC_EQUALS             = 0x00000000,
    QC_NOTEQUAL           = 0x00000001,
    QC_LESSTHAN           = 0x00000002,
    QC_LESSTHANOREQUAL    = 0x00000003,
    QC_GREATERTHAN        = 0x00000004,
    QC_GREATERTHANOREQUAL = 0x00000005,
    QC_STARTSWITH         = 0x00000006,
    QC_EXISTS             = 0x00000007,
    QC_DOESNOTEXIST       = 0x00000008,
    QC_CONTAINS           = 0x00000009,
}

alias SystemVisibilityFlags = int;
enum : int
{
    SVF_SYSTEM = 0x00000000,
    SVF_USER   = 0x00000001,
}

alias QueryUpdateAction = int;
enum : int
{
    QUA_ADD    = 0x00000000,
    QUA_REMOVE = 0x00000001,
    QUA_CHANGE = 0x00000002,
}

alias QueryCategoryType = int;
enum : int
{
    QCT_PROVIDER = 0x00000000,
    QCT_LAYERED  = 0x00000001,
}

enum IID_IFunctionDiscoveryNotification = GUID(0x5f6c1ba8, 0x5330, 0x422e, [0xa3, 0x68, 0x57, 0x2b, 0x24, 0x4d, 0x3f, 0x87]);
interface IFunctionDiscoveryNotification : IUnknown
{
    HRESULT OnUpdate(QueryUpdateAction, ulong, IFunctionInstance);
    HRESULT OnError(HRESULT, ulong, const(wchar)*);
    HRESULT OnEvent(uint, ulong, const(wchar)*);
}
enum IID_IFunctionDiscovery = GUID(0x4df99b70, 0xe148, 0x4432, [0xb0, 0x4, 0x4c, 0x9e, 0xeb, 0x53, 0x5a, 0x5e]);
interface IFunctionDiscovery : IUnknown
{
    HRESULT GetInstanceCollection(const(wchar)*, const(wchar)*, BOOL, IFunctionInstanceCollection*);
    HRESULT GetInstance(const(wchar)*, IFunctionInstance*);
    HRESULT CreateInstanceCollectionQuery(const(wchar)*, const(wchar)*, BOOL, IFunctionDiscoveryNotification, ulong*, IFunctionInstanceCollectionQuery*);
    HRESULT CreateInstanceQuery(const(wchar)*, IFunctionDiscoveryNotification, ulong*, IFunctionInstanceQuery*);
    HRESULT AddInstance(SystemVisibilityFlags, const(wchar)*, const(wchar)*, const(wchar)*, IFunctionInstance*);
    HRESULT RemoveInstance(SystemVisibilityFlags, const(wchar)*, const(wchar)*, const(wchar)*);
}
enum IID_IFunctionInstance = GUID(0x33591c10, 0xbed, 0x4f02, [0xb0, 0xab, 0x15, 0x30, 0xd5, 0x53, 0x3e, 0xe9]);
interface IFunctionInstance : IServiceProvider
{
    HRESULT GetID(ushort**);
    HRESULT GetProviderInstanceID(ushort**);
    HRESULT OpenPropertyStore(STGM, IPropertyStore*);
    HRESULT GetCategory(ushort**, ushort**);
}
enum IID_IFunctionInstanceCollection = GUID(0xf0a3d895, 0x855c, 0x42a2, [0x94, 0x8d, 0x2f, 0x97, 0xd4, 0x50, 0xec, 0xb1]);
interface IFunctionInstanceCollection : IUnknown
{
    HRESULT GetCount(uint*);
    HRESULT Get(const(wchar)*, uint*, IFunctionInstance*);
    HRESULT Item(uint, IFunctionInstance*);
    HRESULT Add(IFunctionInstance);
    HRESULT Remove(uint, IFunctionInstance*);
    HRESULT Delete(uint);
    HRESULT DeleteAll();
}
enum IID_IPropertyStoreCollection = GUID(0xd14d9c30, 0x12d2, 0x42d8, [0xbc, 0xe4, 0xc6, 0xc, 0x2b, 0xb2, 0x26, 0xfa]);
interface IPropertyStoreCollection : IUnknown
{
    HRESULT GetCount(uint*);
    HRESULT Get(const(wchar)*, uint*, IPropertyStore*);
    HRESULT Item(uint, IPropertyStore*);
    HRESULT Add(IPropertyStore);
    HRESULT Remove(uint, IPropertyStore*);
    HRESULT Delete(uint);
    HRESULT DeleteAll();
}
enum IID_IFunctionInstanceQuery = GUID(0x6242bc6b, 0x90ec, 0x4b37, [0xbb, 0x46, 0xe2, 0x29, 0xfd, 0x84, 0xed, 0x95]);
interface IFunctionInstanceQuery : IUnknown
{
    HRESULT Execute(IFunctionInstance*);
}
enum IID_IFunctionInstanceCollectionQuery = GUID(0x57cc6fd2, 0xc09a, 0x4289, [0xbb, 0x72, 0x25, 0xf0, 0x41, 0x42, 0x5, 0x8e]);
interface IFunctionInstanceCollectionQuery : IUnknown
{
    HRESULT AddQueryConstraint(const(wchar)*, const(wchar)*);
    HRESULT AddPropertyConstraint(const(PROPERTYKEY)*, const(PROPVARIANT)*, PropertyConstraint);
    HRESULT Execute(IFunctionInstanceCollection*);
}
enum IID_IFunctionDiscoveryProvider = GUID(0xdcde394f, 0x1478, 0x4813, [0xa4, 0x2, 0xf6, 0xfb, 0x10, 0x65, 0x72, 0x22]);
interface IFunctionDiscoveryProvider : IUnknown
{
    HRESULT Initialize(IFunctionDiscoveryProviderFactory, IFunctionDiscoveryNotification, uint, uint*);
    HRESULT Query(IFunctionDiscoveryProviderQuery, IFunctionInstanceCollection*);
    HRESULT EndQuery();
    HRESULT InstancePropertyStoreValidateAccess(IFunctionInstance, long, const(uint));
    HRESULT InstancePropertyStoreOpen(IFunctionInstance, long, const(uint), IPropertyStore*);
    HRESULT InstancePropertyStoreFlush(IFunctionInstance, long);
    HRESULT InstanceQueryService(IFunctionInstance, long, const(GUID)*, const(GUID)*, IUnknown*);
    HRESULT InstanceReleased(IFunctionInstance, long);
}
enum IID_IProviderProperties = GUID(0xcf986ea6, 0x3b5f, 0x4c5f, [0xb8, 0x8a, 0x2f, 0x8b, 0x20, 0xce, 0xef, 0x17]);
interface IProviderProperties : IUnknown
{
    HRESULT GetCount(IFunctionInstance, long, uint*);
    HRESULT GetAt(IFunctionInstance, long, uint, PROPERTYKEY*);
    HRESULT GetValue(IFunctionInstance, long, const(PROPERTYKEY)*, PROPVARIANT*);
    HRESULT SetValue(IFunctionInstance, long, const(PROPERTYKEY)*, const(PROPVARIANT)*);
}
enum IID_IProviderPublishing = GUID(0xcd1b9a04, 0x206c, 0x4a05, [0xa0, 0xc8, 0x16, 0x35, 0xa2, 0x1a, 0x2b, 0x7c]);
interface IProviderPublishing : IUnknown
{
    HRESULT CreateInstance(SystemVisibilityFlags, const(wchar)*, const(wchar)*, IFunctionInstance*);
    HRESULT RemoveInstance(SystemVisibilityFlags, const(wchar)*, const(wchar)*);
}
enum IID_IFunctionDiscoveryProviderFactory = GUID(0x86443ff0, 0x1ad5, 0x4e68, [0xa4, 0x5a, 0x40, 0xc2, 0xc3, 0x29, 0xde, 0x3b]);
interface IFunctionDiscoveryProviderFactory : IUnknown
{
    HRESULT CreatePropertyStore(IPropertyStore*);
    HRESULT CreateInstance(const(wchar)*, const(wchar)*, long, IPropertyStore, IFunctionDiscoveryProvider, IFunctionInstance*);
    HRESULT CreateFunctionInstanceCollection(IFunctionInstanceCollection*);
}
enum IID_IFunctionDiscoveryProviderQuery = GUID(0x6876ea98, 0xbaec, 0x46db, [0xbc, 0x20, 0x75, 0xa7, 0x6e, 0x26, 0x7a, 0x3a]);
interface IFunctionDiscoveryProviderQuery : IUnknown
{
    HRESULT IsInstanceQuery(BOOL*, ushort**);
    HRESULT IsSubcategoryQuery(BOOL*, ushort**);
    HRESULT GetQueryConstraints(IProviderQueryConstraintCollection*);
    HRESULT GetPropertyConstraints(IProviderPropertyConstraintCollection*);
}
enum IID_IProviderQueryConstraintCollection = GUID(0x9c243e11, 0x3261, 0x4bcd, [0xb9, 0x22, 0x84, 0xa8, 0x73, 0xd4, 0x60, 0xae]);
interface IProviderQueryConstraintCollection : IUnknown
{
    HRESULT GetCount(uint*);
    HRESULT Get(const(wchar)*, ushort**);
    HRESULT Item(uint, ushort**, ushort**);
    HRESULT Next(ushort**, ushort**);
    HRESULT Skip();
    HRESULT Reset();
}
enum IID_IProviderPropertyConstraintCollection = GUID(0xf4fae42f, 0x5778, 0x4a13, [0x85, 0x40, 0xb5, 0xfd, 0x8c, 0x13, 0x98, 0xdd]);
interface IProviderPropertyConstraintCollection : IUnknown
{
    HRESULT GetCount(uint*);
    HRESULT Get(const(PROPERTYKEY)*, PROPVARIANT*, uint*);
    HRESULT Item(uint, PROPERTYKEY*, PROPVARIANT*, uint*);
    HRESULT Next(PROPERTYKEY*, PROPVARIANT*, uint*);
    HRESULT Skip();
    HRESULT Reset();
}
enum IID_IFunctionDiscoveryServiceProvider = GUID(0x4c81ed02, 0x1b04, 0x43f2, [0xa4, 0x51, 0x69, 0x96, 0x6c, 0xbc, 0xd1, 0xc2]);
interface IFunctionDiscoveryServiceProvider : IUnknown
{
    HRESULT Initialize(IFunctionInstance, const(GUID)*, void**);
}
enum CLSID_PNPXAssociation = GUID(0xcee8ccc9, 0x4f6b, 0x4469, [0xa2, 0x35, 0x5a, 0x22, 0x86, 0x9e, 0xef, 0x3]);
struct PNPXAssociation
{
}
enum CLSID_PNPXPairingHandler = GUID(0xb8a27942, 0xade7, 0x4085, [0xaa, 0x6e, 0x4f, 0xad, 0xc7, 0xad, 0xa1, 0xef]);
struct PNPXPairingHandler
{
}
enum IID_IPNPXAssociation = GUID(0xbd7e521, 0x4da6, 0x42d5, [0x81, 0xba, 0x19, 0x81, 0xb6, 0xb9, 0x40, 0x75]);
interface IPNPXAssociation : IUnknown
{
    HRESULT Associate(const(wchar)*);
    HRESULT Unassociate(const(wchar)*);
    HRESULT Delete(const(wchar)*);
}
enum IID_IPNPXDeviceAssociation = GUID(0xeed366d0, 0x35b8, 0x4fc5, [0x8d, 0x20, 0x7e, 0x5b, 0xd3, 0x1f, 0x6d, 0xed]);
interface IPNPXDeviceAssociation : IUnknown
{
    HRESULT Associate(const(wchar)*, IFunctionDiscoveryNotification);
    HRESULT Unassociate(const(wchar)*, IFunctionDiscoveryNotification);
    HRESULT Delete(const(wchar)*, IFunctionDiscoveryNotification);
}
enum CLSID_FunctionDiscovery = GUID(0xc72be2ec, 0x8e90, 0x452c, [0xb2, 0x9a, 0xab, 0x8f, 0xf1, 0xc0, 0x71, 0xfc]);
struct FunctionDiscovery
{
}
enum CLSID_PropertyStore = GUID(0xe4796550, 0xdf61, 0x448b, [0x91, 0x93, 0x13, 0xfc, 0x13, 0x41, 0xb1, 0x63]);
struct PropertyStore
{
}
enum CLSID_FunctionInstanceCollection = GUID(0xba818ce5, 0xb55f, 0x443f, [0xad, 0x39, 0x2f, 0xe8, 0x9b, 0xe6, 0x19, 0x1f]);
struct FunctionInstanceCollection
{
}
enum CLSID_PropertyStoreCollection = GUID(0xedd36029, 0xd753, 0x4862, [0xaa, 0x5b, 0x5b, 0xcc, 0xad, 0x2a, 0x4d, 0x29]);
struct PropertyStoreCollection
{
}
