module windows.win32.devices.properties;

import windows.win32.guid : GUID;
import windows.win32.foundation : PWSTR;

version (Windows):
extern (Windows):

enum DEVPROP_TRUE = 0xff;
enum DEVPROP_FALSE = 0x00;
enum DEVPKEY_DeviceInterface_Autoplay_Silent = DEVPROPKEY(GUID(1129173647, 40565, 17674, [154, 185, 255, 97, 230, 24, 186, 208]), 2);
enum DEVPKEY_NAME = DEVPROPKEY(GUID(3072717104, 18415, 4122, [165, 241, 2, 96, 140, 158, 235, 172]), 10);
enum DEVPKEY_Device_DeviceDesc = DEVPROPKEY(GUID(2757502286, 57116, 20221, [128, 32, 103, 209, 70, 168, 80, 224]), 2);
enum DEVPKEY_Device_HardwareIds = DEVPROPKEY(GUID(2757502286, 57116, 20221, [128, 32, 103, 209, 70, 168, 80, 224]), 3);
enum DEVPKEY_Device_CompatibleIds = DEVPROPKEY(GUID(2757502286, 57116, 20221, [128, 32, 103, 209, 70, 168, 80, 224]), 4);
enum DEVPKEY_Device_Service = DEVPROPKEY(GUID(2757502286, 57116, 20221, [128, 32, 103, 209, 70, 168, 80, 224]), 6);
enum DEVPKEY_Device_Class = DEVPROPKEY(GUID(2757502286, 57116, 20221, [128, 32, 103, 209, 70, 168, 80, 224]), 9);
enum DEVPKEY_Device_ClassGuid = DEVPROPKEY(GUID(2757502286, 57116, 20221, [128, 32, 103, 209, 70, 168, 80, 224]), 10);
enum DEVPKEY_Device_Driver = DEVPROPKEY(GUID(2757502286, 57116, 20221, [128, 32, 103, 209, 70, 168, 80, 224]), 11);
enum DEVPKEY_Device_ConfigFlags = DEVPROPKEY(GUID(2757502286, 57116, 20221, [128, 32, 103, 209, 70, 168, 80, 224]), 12);
enum DEVPKEY_Device_Manufacturer = DEVPROPKEY(GUID(2757502286, 57116, 20221, [128, 32, 103, 209, 70, 168, 80, 224]), 13);
enum DEVPKEY_Device_FriendlyName = DEVPROPKEY(GUID(2757502286, 57116, 20221, [128, 32, 103, 209, 70, 168, 80, 224]), 14);
enum DEVPKEY_Device_LocationInfo = DEVPROPKEY(GUID(2757502286, 57116, 20221, [128, 32, 103, 209, 70, 168, 80, 224]), 15);
enum DEVPKEY_Device_PDOName = DEVPROPKEY(GUID(2757502286, 57116, 20221, [128, 32, 103, 209, 70, 168, 80, 224]), 16);
enum DEVPKEY_Device_Capabilities = DEVPROPKEY(GUID(2757502286, 57116, 20221, [128, 32, 103, 209, 70, 168, 80, 224]), 17);
enum DEVPKEY_Device_UINumber = DEVPROPKEY(GUID(2757502286, 57116, 20221, [128, 32, 103, 209, 70, 168, 80, 224]), 18);
enum DEVPKEY_Device_UpperFilters = DEVPROPKEY(GUID(2757502286, 57116, 20221, [128, 32, 103, 209, 70, 168, 80, 224]), 19);
enum DEVPKEY_Device_LowerFilters = DEVPROPKEY(GUID(2757502286, 57116, 20221, [128, 32, 103, 209, 70, 168, 80, 224]), 20);
enum DEVPKEY_Device_BusTypeGuid = DEVPROPKEY(GUID(2757502286, 57116, 20221, [128, 32, 103, 209, 70, 168, 80, 224]), 21);
enum DEVPKEY_Device_LegacyBusType = DEVPROPKEY(GUID(2757502286, 57116, 20221, [128, 32, 103, 209, 70, 168, 80, 224]), 22);
enum DEVPKEY_Device_BusNumber = DEVPROPKEY(GUID(2757502286, 57116, 20221, [128, 32, 103, 209, 70, 168, 80, 224]), 23);
enum DEVPKEY_Device_EnumeratorName = DEVPROPKEY(GUID(2757502286, 57116, 20221, [128, 32, 103, 209, 70, 168, 80, 224]), 24);
enum DEVPKEY_Device_Security = DEVPROPKEY(GUID(2757502286, 57116, 20221, [128, 32, 103, 209, 70, 168, 80, 224]), 25);
enum DEVPKEY_Device_SecuritySDS = DEVPROPKEY(GUID(2757502286, 57116, 20221, [128, 32, 103, 209, 70, 168, 80, 224]), 26);
enum DEVPKEY_Device_DevType = DEVPROPKEY(GUID(2757502286, 57116, 20221, [128, 32, 103, 209, 70, 168, 80, 224]), 27);
enum DEVPKEY_Device_Exclusive = DEVPROPKEY(GUID(2757502286, 57116, 20221, [128, 32, 103, 209, 70, 168, 80, 224]), 28);
enum DEVPKEY_Device_Characteristics = DEVPROPKEY(GUID(2757502286, 57116, 20221, [128, 32, 103, 209, 70, 168, 80, 224]), 29);
enum DEVPKEY_Device_Address = DEVPROPKEY(GUID(2757502286, 57116, 20221, [128, 32, 103, 209, 70, 168, 80, 224]), 30);
enum DEVPKEY_Device_UINumberDescFormat = DEVPROPKEY(GUID(2757502286, 57116, 20221, [128, 32, 103, 209, 70, 168, 80, 224]), 31);
enum DEVPKEY_Device_PowerData = DEVPROPKEY(GUID(2757502286, 57116, 20221, [128, 32, 103, 209, 70, 168, 80, 224]), 32);
enum DEVPKEY_Device_RemovalPolicy = DEVPROPKEY(GUID(2757502286, 57116, 20221, [128, 32, 103, 209, 70, 168, 80, 224]), 33);
enum DEVPKEY_Device_RemovalPolicyDefault = DEVPROPKEY(GUID(2757502286, 57116, 20221, [128, 32, 103, 209, 70, 168, 80, 224]), 34);
enum DEVPKEY_Device_RemovalPolicyOverride = DEVPROPKEY(GUID(2757502286, 57116, 20221, [128, 32, 103, 209, 70, 168, 80, 224]), 35);
enum DEVPKEY_Device_InstallState = DEVPROPKEY(GUID(2757502286, 57116, 20221, [128, 32, 103, 209, 70, 168, 80, 224]), 36);
enum DEVPKEY_Device_LocationPaths = DEVPROPKEY(GUID(2757502286, 57116, 20221, [128, 32, 103, 209, 70, 168, 80, 224]), 37);
enum DEVPKEY_Device_BaseContainerId = DEVPROPKEY(GUID(2757502286, 57116, 20221, [128, 32, 103, 209, 70, 168, 80, 224]), 38);
enum DEVPKEY_Device_InstanceId = DEVPROPKEY(GUID(2026065864, 4170, 19146, [158, 164, 82, 77, 82, 153, 110, 87]), 256);
enum DEVPKEY_Device_DevNodeStatus = DEVPROPKEY(GUID(1128310469, 37882, 18182, [151, 44, 123, 100, 128, 8, 165, 167]), 2);
enum DEVPKEY_Device_ProblemCode = DEVPROPKEY(GUID(1128310469, 37882, 18182, [151, 44, 123, 100, 128, 8, 165, 167]), 3);
enum DEVPKEY_Device_EjectionRelations = DEVPROPKEY(GUID(1128310469, 37882, 18182, [151, 44, 123, 100, 128, 8, 165, 167]), 4);
enum DEVPKEY_Device_RemovalRelations = DEVPROPKEY(GUID(1128310469, 37882, 18182, [151, 44, 123, 100, 128, 8, 165, 167]), 5);
enum DEVPKEY_Device_PowerRelations = DEVPROPKEY(GUID(1128310469, 37882, 18182, [151, 44, 123, 100, 128, 8, 165, 167]), 6);
enum DEVPKEY_Device_BusRelations = DEVPROPKEY(GUID(1128310469, 37882, 18182, [151, 44, 123, 100, 128, 8, 165, 167]), 7);
enum DEVPKEY_Device_Parent = DEVPROPKEY(GUID(1128310469, 37882, 18182, [151, 44, 123, 100, 128, 8, 165, 167]), 8);
enum DEVPKEY_Device_Children = DEVPROPKEY(GUID(1128310469, 37882, 18182, [151, 44, 123, 100, 128, 8, 165, 167]), 9);
enum DEVPKEY_Device_Siblings = DEVPROPKEY(GUID(1128310469, 37882, 18182, [151, 44, 123, 100, 128, 8, 165, 167]), 10);
enum DEVPKEY_Device_TransportRelations = DEVPROPKEY(GUID(1128310469, 37882, 18182, [151, 44, 123, 100, 128, 8, 165, 167]), 11);
enum DEVPKEY_Device_ProblemStatus = DEVPROPKEY(GUID(1128310469, 37882, 18182, [151, 44, 123, 100, 128, 8, 165, 167]), 12);
enum DEVPKEY_Device_Reported = DEVPROPKEY(GUID(2152296704, 35955, 18617, [170, 217, 206, 56, 126, 25, 197, 110]), 2);
enum DEVPKEY_Device_Legacy = DEVPROPKEY(GUID(2152296704, 35955, 18617, [170, 217, 206, 56, 126, 25, 197, 110]), 3);
enum DEVPKEY_Device_ContainerId = DEVPROPKEY(GUID(2357121542, 16266, 18471, [179, 171, 174, 158, 31, 174, 252, 108]), 2);
enum DEVPKEY_Device_InLocalMachineContainer = DEVPROPKEY(GUID(2357121542, 16266, 18471, [179, 171, 174, 158, 31, 174, 252, 108]), 4);
enum DEVPKEY_Device_Model = DEVPROPKEY(GUID(2026065864, 4170, 19146, [158, 164, 82, 77, 82, 153, 110, 87]), 39);
enum DEVPKEY_Device_ModelId = DEVPROPKEY(GUID(2161647270, 29811, 19212, [130, 22, 239, 193, 26, 44, 76, 139]), 2);
enum DEVPKEY_Device_FriendlyNameAttributes = DEVPROPKEY(GUID(2161647270, 29811, 19212, [130, 22, 239, 193, 26, 44, 76, 139]), 3);
enum DEVPKEY_Device_ManufacturerAttributes = DEVPROPKEY(GUID(2161647270, 29811, 19212, [130, 22, 239, 193, 26, 44, 76, 139]), 4);
enum DEVPKEY_Device_PresenceNotForDevice = DEVPROPKEY(GUID(2161647270, 29811, 19212, [130, 22, 239, 193, 26, 44, 76, 139]), 5);
enum DEVPKEY_Device_SignalStrength = DEVPROPKEY(GUID(2161647270, 29811, 19212, [130, 22, 239, 193, 26, 44, 76, 139]), 6);
enum DEVPKEY_Device_IsAssociateableByUserAction = DEVPROPKEY(GUID(2161647270, 29811, 19212, [130, 22, 239, 193, 26, 44, 76, 139]), 7);
enum DEVPKEY_Device_ShowInUninstallUI = DEVPROPKEY(GUID(2161647270, 29811, 19212, [130, 22, 239, 193, 26, 44, 76, 139]), 8);
enum DEVPKEY_Device_CompanionApps = DEVPROPKEY(GUID(1785996884, 53426, 17440, [165, 35, 224, 104, 53, 42, 193, 223]), 2);
enum DEVPKEY_Device_PrimaryCompanionApp = DEVPROPKEY(GUID(1785996884, 53426, 17440, [165, 35, 224, 104, 53, 42, 193, 223]), 3);
enum DEVPKEY_Device_Numa_Proximity_Domain = DEVPROPKEY(GUID(1410045054, 35648, 17852, [168, 162, 106, 11, 137, 76, 189, 162]), 1);
enum DEVPKEY_Device_DHP_Rebalance_Policy = DEVPROPKEY(GUID(1410045054, 35648, 17852, [168, 162, 106, 11, 137, 76, 189, 162]), 2);
enum DEVPKEY_Device_Numa_Node = DEVPROPKEY(GUID(1410045054, 35648, 17852, [168, 162, 106, 11, 137, 76, 189, 162]), 3);
enum DEVPKEY_Device_BusReportedDeviceDesc = DEVPROPKEY(GUID(1410045054, 35648, 17852, [168, 162, 106, 11, 137, 76, 189, 162]), 4);
enum DEVPKEY_Device_IsPresent = DEVPROPKEY(GUID(1410045054, 35648, 17852, [168, 162, 106, 11, 137, 76, 189, 162]), 5);
enum DEVPKEY_Device_HasProblem = DEVPROPKEY(GUID(1410045054, 35648, 17852, [168, 162, 106, 11, 137, 76, 189, 162]), 6);
enum DEVPKEY_Device_ConfigurationId = DEVPROPKEY(GUID(1410045054, 35648, 17852, [168, 162, 106, 11, 137, 76, 189, 162]), 7);
enum DEVPKEY_Device_ReportedDeviceIdsHash = DEVPROPKEY(GUID(1410045054, 35648, 17852, [168, 162, 106, 11, 137, 76, 189, 162]), 8);
enum DEVPKEY_Device_PhysicalDeviceLocation = DEVPROPKEY(GUID(1410045054, 35648, 17852, [168, 162, 106, 11, 137, 76, 189, 162]), 9);
enum DEVPKEY_Device_BiosDeviceName = DEVPROPKEY(GUID(1410045054, 35648, 17852, [168, 162, 106, 11, 137, 76, 189, 162]), 10);
enum DEVPKEY_Device_DriverProblemDesc = DEVPROPKEY(GUID(1410045054, 35648, 17852, [168, 162, 106, 11, 137, 76, 189, 162]), 11);
enum DEVPKEY_Device_DebuggerSafe = DEVPROPKEY(GUID(1410045054, 35648, 17852, [168, 162, 106, 11, 137, 76, 189, 162]), 12);
enum DEVPKEY_Device_PostInstallInProgress = DEVPROPKEY(GUID(1410045054, 35648, 17852, [168, 162, 106, 11, 137, 76, 189, 162]), 13);
enum DEVPKEY_Device_Stack = DEVPROPKEY(GUID(1410045054, 35648, 17852, [168, 162, 106, 11, 137, 76, 189, 162]), 14);
enum DEVPKEY_Device_ExtendedConfigurationIds = DEVPROPKEY(GUID(1410045054, 35648, 17852, [168, 162, 106, 11, 137, 76, 189, 162]), 15);
enum DEVPKEY_Device_IsRebootRequired = DEVPROPKEY(GUID(1410045054, 35648, 17852, [168, 162, 106, 11, 137, 76, 189, 162]), 16);
enum DEVPKEY_Device_FirmwareDate = DEVPROPKEY(GUID(1410045054, 35648, 17852, [168, 162, 106, 11, 137, 76, 189, 162]), 17);
enum DEVPKEY_Device_FirmwareVersion = DEVPROPKEY(GUID(1410045054, 35648, 17852, [168, 162, 106, 11, 137, 76, 189, 162]), 18);
enum DEVPKEY_Device_FirmwareRevision = DEVPROPKEY(GUID(1410045054, 35648, 17852, [168, 162, 106, 11, 137, 76, 189, 162]), 19);
enum DEVPKEY_Device_DependencyProviders = DEVPROPKEY(GUID(1410045054, 35648, 17852, [168, 162, 106, 11, 137, 76, 189, 162]), 20);
enum DEVPKEY_Device_DependencyDependents = DEVPROPKEY(GUID(1410045054, 35648, 17852, [168, 162, 106, 11, 137, 76, 189, 162]), 21);
enum DEVPKEY_Device_SoftRestartSupported = DEVPROPKEY(GUID(1410045054, 35648, 17852, [168, 162, 106, 11, 137, 76, 189, 162]), 22);
enum DEVPKEY_Device_ExtendedAddress = DEVPROPKEY(GUID(1410045054, 35648, 17852, [168, 162, 106, 11, 137, 76, 189, 162]), 23);
enum DEVPKEY_Device_AssignedToGuest = DEVPROPKEY(GUID(1410045054, 35648, 17852, [168, 162, 106, 11, 137, 76, 189, 162]), 24);
enum DEVPKEY_Device_CreatorProcessId = DEVPROPKEY(GUID(1410045054, 35648, 17852, [168, 162, 106, 11, 137, 76, 189, 162]), 25);
enum DEVPKEY_Device_FirmwareVendor = DEVPROPKEY(GUID(1410045054, 35648, 17852, [168, 162, 106, 11, 137, 76, 189, 162]), 26);
enum DEVPKEY_Device_SessionId = DEVPROPKEY(GUID(2212127526, 38822, 16520, [148, 83, 161, 146, 63, 87, 59, 41]), 6);
enum DEVPKEY_Device_InstallDate = DEVPROPKEY(GUID(2212127526, 38822, 16520, [148, 83, 161, 146, 63, 87, 59, 41]), 100);
enum DEVPKEY_Device_FirstInstallDate = DEVPROPKEY(GUID(2212127526, 38822, 16520, [148, 83, 161, 146, 63, 87, 59, 41]), 101);
enum DEVPKEY_Device_LastArrivalDate = DEVPROPKEY(GUID(2212127526, 38822, 16520, [148, 83, 161, 146, 63, 87, 59, 41]), 102);
enum DEVPKEY_Device_LastRemovalDate = DEVPROPKEY(GUID(2212127526, 38822, 16520, [148, 83, 161, 146, 63, 87, 59, 41]), 103);
enum DEVPKEY_Device_DriverDate = DEVPROPKEY(GUID(2830656989, 11837, 16532, [173, 151, 229, 147, 167, 12, 117, 214]), 2);
enum DEVPKEY_Device_DriverVersion = DEVPROPKEY(GUID(2830656989, 11837, 16532, [173, 151, 229, 147, 167, 12, 117, 214]), 3);
enum DEVPKEY_Device_DriverDesc = DEVPROPKEY(GUID(2830656989, 11837, 16532, [173, 151, 229, 147, 167, 12, 117, 214]), 4);
enum DEVPKEY_Device_DriverInfPath = DEVPROPKEY(GUID(2830656989, 11837, 16532, [173, 151, 229, 147, 167, 12, 117, 214]), 5);
enum DEVPKEY_Device_DriverInfSection = DEVPROPKEY(GUID(2830656989, 11837, 16532, [173, 151, 229, 147, 167, 12, 117, 214]), 6);
enum DEVPKEY_Device_DriverInfSectionExt = DEVPROPKEY(GUID(2830656989, 11837, 16532, [173, 151, 229, 147, 167, 12, 117, 214]), 7);
enum DEVPKEY_Device_MatchingDeviceId = DEVPROPKEY(GUID(2830656989, 11837, 16532, [173, 151, 229, 147, 167, 12, 117, 214]), 8);
enum DEVPKEY_Device_DriverProvider = DEVPROPKEY(GUID(2830656989, 11837, 16532, [173, 151, 229, 147, 167, 12, 117, 214]), 9);
enum DEVPKEY_Device_DriverPropPageProvider = DEVPROPKEY(GUID(2830656989, 11837, 16532, [173, 151, 229, 147, 167, 12, 117, 214]), 10);
enum DEVPKEY_Device_DriverCoInstallers = DEVPROPKEY(GUID(2830656989, 11837, 16532, [173, 151, 229, 147, 167, 12, 117, 214]), 11);
enum DEVPKEY_Device_ResourcePickerTags = DEVPROPKEY(GUID(2830656989, 11837, 16532, [173, 151, 229, 147, 167, 12, 117, 214]), 12);
enum DEVPKEY_Device_ResourcePickerExceptions = DEVPROPKEY(GUID(2830656989, 11837, 16532, [173, 151, 229, 147, 167, 12, 117, 214]), 13);
enum DEVPKEY_Device_DriverRank = DEVPROPKEY(GUID(2830656989, 11837, 16532, [173, 151, 229, 147, 167, 12, 117, 214]), 14);
enum DEVPKEY_Device_DriverLogoLevel = DEVPROPKEY(GUID(2830656989, 11837, 16532, [173, 151, 229, 147, 167, 12, 117, 214]), 15);
enum DEVPKEY_Device_NoConnectSound = DEVPROPKEY(GUID(2830656989, 11837, 16532, [173, 151, 229, 147, 167, 12, 117, 214]), 17);
enum DEVPKEY_Device_GenericDriverInstalled = DEVPROPKEY(GUID(2830656989, 11837, 16532, [173, 151, 229, 147, 167, 12, 117, 214]), 18);
enum DEVPKEY_Device_AdditionalSoftwareRequested = DEVPROPKEY(GUID(2830656989, 11837, 16532, [173, 151, 229, 147, 167, 12, 117, 214]), 19);
enum DEVPKEY_Device_SafeRemovalRequired = DEVPROPKEY(GUID(2950264384, 34467, 16912, [182, 124, 40, 156, 65, 170, 190, 85]), 2);
enum DEVPKEY_Device_SafeRemovalRequiredOverride = DEVPROPKEY(GUID(2950264384, 34467, 16912, [182, 124, 40, 156, 65, 170, 190, 85]), 3);
enum DEVPKEY_DrvPkg_Model = DEVPROPKEY(GUID(3480468305, 15039, 17570, [133, 224, 154, 61, 199, 161, 33, 50]), 2);
enum DEVPKEY_DrvPkg_VendorWebSite = DEVPROPKEY(GUID(3480468305, 15039, 17570, [133, 224, 154, 61, 199, 161, 33, 50]), 3);
enum DEVPKEY_DrvPkg_DetailedDescription = DEVPROPKEY(GUID(3480468305, 15039, 17570, [133, 224, 154, 61, 199, 161, 33, 50]), 4);
enum DEVPKEY_DrvPkg_DocumentationLink = DEVPROPKEY(GUID(3480468305, 15039, 17570, [133, 224, 154, 61, 199, 161, 33, 50]), 5);
enum DEVPKEY_DrvPkg_Icon = DEVPROPKEY(GUID(3480468305, 15039, 17570, [133, 224, 154, 61, 199, 161, 33, 50]), 6);
enum DEVPKEY_DrvPkg_BrandingIcon = DEVPROPKEY(GUID(3480468305, 15039, 17570, [133, 224, 154, 61, 199, 161, 33, 50]), 7);
enum DEVPKEY_DeviceClass_UpperFilters = DEVPROPKEY(GUID(1126273419, 63134, 18189, [165, 222, 77, 136, 199, 90, 210, 75]), 19);
enum DEVPKEY_DeviceClass_LowerFilters = DEVPROPKEY(GUID(1126273419, 63134, 18189, [165, 222, 77, 136, 199, 90, 210, 75]), 20);
enum DEVPKEY_DeviceClass_Security = DEVPROPKEY(GUID(1126273419, 63134, 18189, [165, 222, 77, 136, 199, 90, 210, 75]), 25);
enum DEVPKEY_DeviceClass_SecuritySDS = DEVPROPKEY(GUID(1126273419, 63134, 18189, [165, 222, 77, 136, 199, 90, 210, 75]), 26);
enum DEVPKEY_DeviceClass_DevType = DEVPROPKEY(GUID(1126273419, 63134, 18189, [165, 222, 77, 136, 199, 90, 210, 75]), 27);
enum DEVPKEY_DeviceClass_Exclusive = DEVPROPKEY(GUID(1126273419, 63134, 18189, [165, 222, 77, 136, 199, 90, 210, 75]), 28);
enum DEVPKEY_DeviceClass_Characteristics = DEVPROPKEY(GUID(1126273419, 63134, 18189, [165, 222, 77, 136, 199, 90, 210, 75]), 29);
enum DEVPKEY_DeviceClass_Name = DEVPROPKEY(GUID(630898684, 20647, 18382, [175, 8, 104, 201, 167, 215, 51, 102]), 2);
enum DEVPKEY_DeviceClass_ClassName = DEVPROPKEY(GUID(630898684, 20647, 18382, [175, 8, 104, 201, 167, 215, 51, 102]), 3);
enum DEVPKEY_DeviceClass_Icon = DEVPROPKEY(GUID(630898684, 20647, 18382, [175, 8, 104, 201, 167, 215, 51, 102]), 4);
enum DEVPKEY_DeviceClass_ClassInstaller = DEVPROPKEY(GUID(630898684, 20647, 18382, [175, 8, 104, 201, 167, 215, 51, 102]), 5);
enum DEVPKEY_DeviceClass_PropPageProvider = DEVPROPKEY(GUID(630898684, 20647, 18382, [175, 8, 104, 201, 167, 215, 51, 102]), 6);
enum DEVPKEY_DeviceClass_NoInstallClass = DEVPROPKEY(GUID(630898684, 20647, 18382, [175, 8, 104, 201, 167, 215, 51, 102]), 7);
enum DEVPKEY_DeviceClass_NoDisplayClass = DEVPROPKEY(GUID(630898684, 20647, 18382, [175, 8, 104, 201, 167, 215, 51, 102]), 8);
enum DEVPKEY_DeviceClass_SilentInstall = DEVPROPKEY(GUID(630898684, 20647, 18382, [175, 8, 104, 201, 167, 215, 51, 102]), 9);
enum DEVPKEY_DeviceClass_NoUseClass = DEVPROPKEY(GUID(630898684, 20647, 18382, [175, 8, 104, 201, 167, 215, 51, 102]), 10);
enum DEVPKEY_DeviceClass_DefaultService = DEVPROPKEY(GUID(630898684, 20647, 18382, [175, 8, 104, 201, 167, 215, 51, 102]), 11);
enum DEVPKEY_DeviceClass_IconPath = DEVPROPKEY(GUID(630898684, 20647, 18382, [175, 8, 104, 201, 167, 215, 51, 102]), 12);
enum DEVPKEY_DeviceClass_DHPRebalanceOptOut = DEVPROPKEY(GUID(3511500531, 26319, 19362, [157, 56, 13, 219, 55, 171, 71, 1]), 2);
enum DEVPKEY_DeviceClass_ClassCoInstallers = DEVPROPKEY(GUID(1899828995, 41698, 18933, [146, 20, 86, 71, 46, 243, 218, 92]), 2);
enum DEVPKEY_DeviceInterface_FriendlyName = DEVPROPKEY(GUID(40784238, 47124, 16715, [131, 205, 133, 109, 111, 239, 72, 34]), 2);
enum DEVPKEY_DeviceInterface_Enabled = DEVPROPKEY(GUID(40784238, 47124, 16715, [131, 205, 133, 109, 111, 239, 72, 34]), 3);
enum DEVPKEY_DeviceInterface_ClassGuid = DEVPROPKEY(GUID(40784238, 47124, 16715, [131, 205, 133, 109, 111, 239, 72, 34]), 4);
enum DEVPKEY_DeviceInterface_ReferenceString = DEVPROPKEY(GUID(40784238, 47124, 16715, [131, 205, 133, 109, 111, 239, 72, 34]), 5);
enum DEVPKEY_DeviceInterface_Restricted = DEVPROPKEY(GUID(40784238, 47124, 16715, [131, 205, 133, 109, 111, 239, 72, 34]), 6);
enum DEVPKEY_DeviceInterface_UnrestrictedAppCapabilities = DEVPROPKEY(GUID(40784238, 47124, 16715, [131, 205, 133, 109, 111, 239, 72, 34]), 8);
enum DEVPKEY_DeviceInterface_SchematicName = DEVPROPKEY(GUID(40784238, 47124, 16715, [131, 205, 133, 109, 111, 239, 72, 34]), 9);
enum DEVPKEY_DeviceInterfaceClass_DefaultInterface = DEVPROPKEY(GUID(348666521, 2879, 17591, [190, 76, 161, 120, 211, 153, 5, 100]), 2);
enum DEVPKEY_DeviceInterfaceClass_Name = DEVPROPKEY(GUID(348666521, 2879, 17591, [190, 76, 161, 120, 211, 153, 5, 100]), 3);
enum DEVPKEY_DeviceContainer_Address = DEVPROPKEY(GUID(2026065864, 4170, 19146, [158, 164, 82, 77, 82, 153, 110, 87]), 51);
enum DEVPKEY_DeviceContainer_DiscoveryMethod = DEVPROPKEY(GUID(2026065864, 4170, 19146, [158, 164, 82, 77, 82, 153, 110, 87]), 52);
enum DEVPKEY_DeviceContainer_IsEncrypted = DEVPROPKEY(GUID(2026065864, 4170, 19146, [158, 164, 82, 77, 82, 153, 110, 87]), 53);
enum DEVPKEY_DeviceContainer_IsAuthenticated = DEVPROPKEY(GUID(2026065864, 4170, 19146, [158, 164, 82, 77, 82, 153, 110, 87]), 54);
enum DEVPKEY_DeviceContainer_IsConnected = DEVPROPKEY(GUID(2026065864, 4170, 19146, [158, 164, 82, 77, 82, 153, 110, 87]), 55);
enum DEVPKEY_DeviceContainer_IsPaired = DEVPROPKEY(GUID(2026065864, 4170, 19146, [158, 164, 82, 77, 82, 153, 110, 87]), 56);
enum DEVPKEY_DeviceContainer_Icon = DEVPROPKEY(GUID(2026065864, 4170, 19146, [158, 164, 82, 77, 82, 153, 110, 87]), 57);
enum DEVPKEY_DeviceContainer_Version = DEVPROPKEY(GUID(2026065864, 4170, 19146, [158, 164, 82, 77, 82, 153, 110, 87]), 65);
enum DEVPKEY_DeviceContainer_Last_Seen = DEVPROPKEY(GUID(2026065864, 4170, 19146, [158, 164, 82, 77, 82, 153, 110, 87]), 66);
enum DEVPKEY_DeviceContainer_Last_Connected = DEVPROPKEY(GUID(2026065864, 4170, 19146, [158, 164, 82, 77, 82, 153, 110, 87]), 67);
enum DEVPKEY_DeviceContainer_IsShowInDisconnectedState = DEVPROPKEY(GUID(2026065864, 4170, 19146, [158, 164, 82, 77, 82, 153, 110, 87]), 68);
enum DEVPKEY_DeviceContainer_IsLocalMachine = DEVPROPKEY(GUID(2026065864, 4170, 19146, [158, 164, 82, 77, 82, 153, 110, 87]), 70);
enum DEVPKEY_DeviceContainer_MetadataPath = DEVPROPKEY(GUID(2026065864, 4170, 19146, [158, 164, 82, 77, 82, 153, 110, 87]), 71);
enum DEVPKEY_DeviceContainer_IsMetadataSearchInProgress = DEVPROPKEY(GUID(2026065864, 4170, 19146, [158, 164, 82, 77, 82, 153, 110, 87]), 72);
enum DEVPKEY_DeviceContainer_MetadataChecksum = DEVPROPKEY(GUID(2026065864, 4170, 19146, [158, 164, 82, 77, 82, 153, 110, 87]), 73);
enum DEVPKEY_DeviceContainer_IsNotInterestingForDisplay = DEVPROPKEY(GUID(2026065864, 4170, 19146, [158, 164, 82, 77, 82, 153, 110, 87]), 74);
enum DEVPKEY_DeviceContainer_LaunchDeviceStageOnDeviceConnect = DEVPROPKEY(GUID(2026065864, 4170, 19146, [158, 164, 82, 77, 82, 153, 110, 87]), 76);
enum DEVPKEY_DeviceContainer_LaunchDeviceStageFromExplorer = DEVPROPKEY(GUID(2026065864, 4170, 19146, [158, 164, 82, 77, 82, 153, 110, 87]), 77);
enum DEVPKEY_DeviceContainer_BaselineExperienceId = DEVPROPKEY(GUID(2026065864, 4170, 19146, [158, 164, 82, 77, 82, 153, 110, 87]), 78);
enum DEVPKEY_DeviceContainer_IsDeviceUniquelyIdentifiable = DEVPROPKEY(GUID(2026065864, 4170, 19146, [158, 164, 82, 77, 82, 153, 110, 87]), 79);
enum DEVPKEY_DeviceContainer_AssociationArray = DEVPROPKEY(GUID(2026065864, 4170, 19146, [158, 164, 82, 77, 82, 153, 110, 87]), 80);
enum DEVPKEY_DeviceContainer_DeviceDescription1 = DEVPROPKEY(GUID(2026065864, 4170, 19146, [158, 164, 82, 77, 82, 153, 110, 87]), 81);
enum DEVPKEY_DeviceContainer_DeviceDescription2 = DEVPROPKEY(GUID(2026065864, 4170, 19146, [158, 164, 82, 77, 82, 153, 110, 87]), 82);
enum DEVPKEY_DeviceContainer_HasProblem = DEVPROPKEY(GUID(2026065864, 4170, 19146, [158, 164, 82, 77, 82, 153, 110, 87]), 83);
enum DEVPKEY_DeviceContainer_IsSharedDevice = DEVPROPKEY(GUID(2026065864, 4170, 19146, [158, 164, 82, 77, 82, 153, 110, 87]), 84);
enum DEVPKEY_DeviceContainer_IsNetworkDevice = DEVPROPKEY(GUID(2026065864, 4170, 19146, [158, 164, 82, 77, 82, 153, 110, 87]), 85);
enum DEVPKEY_DeviceContainer_IsDefaultDevice = DEVPROPKEY(GUID(2026065864, 4170, 19146, [158, 164, 82, 77, 82, 153, 110, 87]), 86);
enum DEVPKEY_DeviceContainer_MetadataCabinet = DEVPROPKEY(GUID(2026065864, 4170, 19146, [158, 164, 82, 77, 82, 153, 110, 87]), 87);
enum DEVPKEY_DeviceContainer_RequiresPairingElevation = DEVPROPKEY(GUID(2026065864, 4170, 19146, [158, 164, 82, 77, 82, 153, 110, 87]), 88);
enum DEVPKEY_DeviceContainer_ExperienceId = DEVPROPKEY(GUID(2026065864, 4170, 19146, [158, 164, 82, 77, 82, 153, 110, 87]), 89);
enum DEVPKEY_DeviceContainer_Category = DEVPROPKEY(GUID(2026065864, 4170, 19146, [158, 164, 82, 77, 82, 153, 110, 87]), 90);
enum DEVPKEY_DeviceContainer_Category_Desc_Singular = DEVPROPKEY(GUID(2026065864, 4170, 19146, [158, 164, 82, 77, 82, 153, 110, 87]), 91);
enum DEVPKEY_DeviceContainer_Category_Desc_Plural = DEVPROPKEY(GUID(2026065864, 4170, 19146, [158, 164, 82, 77, 82, 153, 110, 87]), 92);
enum DEVPKEY_DeviceContainer_Category_Icon = DEVPROPKEY(GUID(2026065864, 4170, 19146, [158, 164, 82, 77, 82, 153, 110, 87]), 93);
enum DEVPKEY_DeviceContainer_CategoryGroup_Desc = DEVPROPKEY(GUID(2026065864, 4170, 19146, [158, 164, 82, 77, 82, 153, 110, 87]), 94);
enum DEVPKEY_DeviceContainer_CategoryGroup_Icon = DEVPROPKEY(GUID(2026065864, 4170, 19146, [158, 164, 82, 77, 82, 153, 110, 87]), 95);
enum DEVPKEY_DeviceContainer_PrimaryCategory = DEVPROPKEY(GUID(2026065864, 4170, 19146, [158, 164, 82, 77, 82, 153, 110, 87]), 97);
enum DEVPKEY_DeviceContainer_UnpairUninstall = DEVPROPKEY(GUID(2026065864, 4170, 19146, [158, 164, 82, 77, 82, 153, 110, 87]), 98);
enum DEVPKEY_DeviceContainer_RequiresUninstallElevation = DEVPROPKEY(GUID(2026065864, 4170, 19146, [158, 164, 82, 77, 82, 153, 110, 87]), 99);
enum DEVPKEY_DeviceContainer_DeviceFunctionSubRank = DEVPROPKEY(GUID(2026065864, 4170, 19146, [158, 164, 82, 77, 82, 153, 110, 87]), 100);
enum DEVPKEY_DeviceContainer_AlwaysShowDeviceAsConnected = DEVPROPKEY(GUID(2026065864, 4170, 19146, [158, 164, 82, 77, 82, 153, 110, 87]), 101);
enum DEVPKEY_DeviceContainer_ConfigFlags = DEVPROPKEY(GUID(2026065864, 4170, 19146, [158, 164, 82, 77, 82, 153, 110, 87]), 105);
enum DEVPKEY_DeviceContainer_PrivilegedPackageFamilyNames = DEVPROPKEY(GUID(2026065864, 4170, 19146, [158, 164, 82, 77, 82, 153, 110, 87]), 106);
enum DEVPKEY_DeviceContainer_CustomPrivilegedPackageFamilyNames = DEVPROPKEY(GUID(2026065864, 4170, 19146, [158, 164, 82, 77, 82, 153, 110, 87]), 107);
enum DEVPKEY_DeviceContainer_IsRebootRequired = DEVPROPKEY(GUID(2026065864, 4170, 19146, [158, 164, 82, 77, 82, 153, 110, 87]), 108);
enum DEVPKEY_DeviceContainer_FriendlyName = DEVPROPKEY(GUID(1701460915, 60608, 17405, [132, 119, 74, 224, 64, 74, 150, 205]), 12288);
enum DEVPKEY_DeviceContainer_Manufacturer = DEVPROPKEY(GUID(1701460915, 60608, 17405, [132, 119, 74, 224, 64, 74, 150, 205]), 8192);
enum DEVPKEY_DeviceContainer_ModelName = DEVPROPKEY(GUID(1701460915, 60608, 17405, [132, 119, 74, 224, 64, 74, 150, 205]), 8194);
enum DEVPKEY_DeviceContainer_ModelNumber = DEVPROPKEY(GUID(1701460915, 60608, 17405, [132, 119, 74, 224, 64, 74, 150, 205]), 8195);
enum DEVPKEY_DeviceContainer_InstallInProgress = DEVPROPKEY(GUID(2212127526, 38822, 16520, [148, 83, 161, 146, 63, 87, 59, 41]), 9);
enum DEVPKEY_DevQuery_ObjectType = DEVPROPKEY(GUID(325533506, 41942, 18934, [180, 218, 174, 70, 224, 197, 35, 124]), 2);
enum MAX_DEVPROP_TYPE = 0x00000019;
enum MAX_DEVPROP_TYPEMOD = 0x00002000;
enum DEVPROP_MASK_TYPE = 0x00000fff;
enum DEVPROP_MASK_TYPEMOD = 0x0000f000;
enum DEVPROPID_FIRST_USABLE = 0x00000002;
alias DEVPROPTYPE = uint;
enum : uint
{
    DEVPROP_TYPEMOD_ARRAY                   = 0x00001000,
    DEVPROP_TYPEMOD_LIST                    = 0x00002000,
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
