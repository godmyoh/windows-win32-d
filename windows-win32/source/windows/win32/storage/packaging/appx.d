module windows.win32.storage.packaging.appx;

import windows.win32.guid : GUID;
import windows.win32.data.xml.msxml : IXMLDOMDocument;
import windows.win32.foundation : BOOL, HANDLE, HRESULT, PSID, PSTR, PWSTR, WIN32_ERROR;
import windows.win32.system.com_ : IStream, IUnknown, IUri;

version (Windows):
extern (Windows):

WIN32_ERROR GetCurrentPackageId(uint*, ubyte*);
WIN32_ERROR GetCurrentPackageFullName(uint*, PWSTR);
WIN32_ERROR GetCurrentPackageFamilyName(uint*, PWSTR);
WIN32_ERROR GetCurrentPackagePath(uint*, PWSTR);
WIN32_ERROR GetPackageId(HANDLE, uint*, ubyte*);
WIN32_ERROR GetPackageFullName(HANDLE, uint*, PWSTR);
WIN32_ERROR GetPackageFullNameFromToken(HANDLE, uint*, PWSTR);
WIN32_ERROR GetPackageFamilyName(HANDLE, uint*, PWSTR);
WIN32_ERROR GetPackageFamilyNameFromToken(HANDLE, uint*, PWSTR);
WIN32_ERROR GetPackagePath(const(PACKAGE_ID)*, const(uint), uint*, PWSTR);
WIN32_ERROR GetPackagePathByFullName(const(wchar)*, uint*, PWSTR);
WIN32_ERROR GetStagedPackagePathByFullName(const(wchar)*, uint*, PWSTR);
WIN32_ERROR GetPackagePathByFullName2(const(wchar)*, PackagePathType, uint*, PWSTR);
WIN32_ERROR GetStagedPackagePathByFullName2(const(wchar)*, PackagePathType, uint*, PWSTR);
WIN32_ERROR GetCurrentPackageInfo2(const(uint), PackagePathType, uint*, ubyte*, uint*);
WIN32_ERROR GetCurrentPackagePath2(PackagePathType, uint*, PWSTR);
WIN32_ERROR GetCurrentApplicationUserModelId(uint*, PWSTR);
WIN32_ERROR GetApplicationUserModelId(HANDLE, uint*, PWSTR);
WIN32_ERROR GetApplicationUserModelIdFromToken(HANDLE, uint*, PWSTR);
WIN32_ERROR VerifyPackageFullName(const(wchar)*);
WIN32_ERROR VerifyPackageFamilyName(const(wchar)*);
WIN32_ERROR VerifyPackageId(const(PACKAGE_ID)*);
WIN32_ERROR VerifyApplicationUserModelId(const(wchar)*);
WIN32_ERROR VerifyPackageRelativeApplicationId(const(wchar)*);
WIN32_ERROR PackageIdFromFullName(const(wchar)*, const(uint), uint*, ubyte*);
WIN32_ERROR PackageFullNameFromId(const(PACKAGE_ID)*, uint*, PWSTR);
WIN32_ERROR PackageFamilyNameFromId(const(PACKAGE_ID)*, uint*, PWSTR);
WIN32_ERROR PackageFamilyNameFromFullName(const(wchar)*, uint*, PWSTR);
WIN32_ERROR PackageNameAndPublisherIdFromFamilyName(const(wchar)*, uint*, PWSTR, uint*, PWSTR);
WIN32_ERROR FormatApplicationUserModelId(const(wchar)*, const(wchar)*, uint*, PWSTR);
WIN32_ERROR ParseApplicationUserModelId(const(wchar)*, uint*, PWSTR, uint*, PWSTR);
WIN32_ERROR GetPackagesByPackageFamily(const(wchar)*, uint*, PWSTR*, uint*, PWSTR);
WIN32_ERROR FindPackagesByPackageFamily(const(wchar)*, uint, uint*, PWSTR*, uint*, PWSTR, uint*);
WIN32_ERROR GetStagedPackageOrigin(const(wchar)*, PackageOrigin*);
WIN32_ERROR GetCurrentPackageInfo(const(uint), uint*, ubyte*, uint*);
WIN32_ERROR OpenPackageInfoByFullName(const(wchar)*, const(uint), _PACKAGE_INFO_REFERENCE**);
WIN32_ERROR OpenPackageInfoByFullNameForUser(PSID, const(wchar)*, const(uint), _PACKAGE_INFO_REFERENCE**);
WIN32_ERROR ClosePackageInfo(_PACKAGE_INFO_REFERENCE*);
WIN32_ERROR GetPackageInfo(_PACKAGE_INFO_REFERENCE*, const(uint), uint*, ubyte*, uint*);
WIN32_ERROR GetPackageApplicationIds(_PACKAGE_INFO_REFERENCE*, uint*, ubyte*, uint*);
WIN32_ERROR GetPackageInfo2(_PACKAGE_INFO_REFERENCE*, const(uint), PackagePathType, uint*, ubyte*, uint*);
HRESULT CheckIsMSIXPackage(const(wchar)*, BOOL*);
HRESULT TryCreatePackageDependency(PSID, const(wchar)*, PACKAGE_VERSION, PackageDependencyProcessorArchitectures, PackageDependencyLifetimeKind, const(wchar)*, CreatePackageDependencyOptions, PWSTR*);
HRESULT DeletePackageDependency(const(wchar)*);
HRESULT AddPackageDependency(const(wchar)*, int, AddPackageDependencyOptions, PACKAGEDEPENDENCY_CONTEXT__**, PWSTR*);
HRESULT RemovePackageDependency(PACKAGEDEPENDENCY_CONTEXT__*);
HRESULT GetResolvedPackageFullNameForPackageDependency(const(wchar)*, PWSTR*);
HRESULT GetIdForPackageDependencyContext(PACKAGEDEPENDENCY_CONTEXT__*, PWSTR*);
WIN32_ERROR AppPolicyGetLifecycleManagement(HANDLE, AppPolicyLifecycleManagement*);
WIN32_ERROR AppPolicyGetWindowingModel(HANDLE, AppPolicyWindowingModel*);
WIN32_ERROR AppPolicyGetMediaFoundationCodecLoading(HANDLE, AppPolicyMediaFoundationCodecLoading*);
WIN32_ERROR AppPolicyGetClrCompat(HANDLE, AppPolicyClrCompat*);
WIN32_ERROR AppPolicyGetThreadInitializationType(HANDLE, AppPolicyThreadInitializationType*);
WIN32_ERROR AppPolicyGetShowDeveloperDiagnostic(HANDLE, AppPolicyShowDeveloperDiagnostic*);
WIN32_ERROR AppPolicyGetProcessTerminationMethod(HANDLE, AppPolicyProcessTerminationMethod*);
WIN32_ERROR AppPolicyGetCreateFileAccess(HANDLE, AppPolicyCreateFileAccess*);
HRESULT CreatePackageVirtualizationContext(const(wchar)*, PACKAGE_VIRTUALIZATION_CONTEXT_HANDLE__**);
HRESULT ActivatePackageVirtualizationContext(PACKAGE_VIRTUALIZATION_CONTEXT_HANDLE__*, ulong*);
void ReleasePackageVirtualizationContext(PACKAGE_VIRTUALIZATION_CONTEXT_HANDLE__*);
void DeactivatePackageVirtualizationContext(ulong);
HRESULT DuplicatePackageVirtualizationContext(PACKAGE_VIRTUALIZATION_CONTEXT_HANDLE__*, PACKAGE_VIRTUALIZATION_CONTEXT_HANDLE__**);
PACKAGE_VIRTUALIZATION_CONTEXT_HANDLE__* GetCurrentPackageVirtualizationContext();
HRESULT GetProcessesInVirtualizationContext(const(wchar)*, uint*, HANDLE**);
enum PACKAGE_PROPERTY_FRAMEWORK = 0x00000001;
enum PACKAGE_PROPERTY_RESOURCE = 0x00000002;
enum PACKAGE_PROPERTY_BUNDLE = 0x00000004;
enum PACKAGE_PROPERTY_OPTIONAL = 0x00000008;
enum PACKAGE_FILTER_HEAD = 0x00000010;
enum PACKAGE_FILTER_DIRECT = 0x00000020;
enum PACKAGE_FILTER_RESOURCE = 0x00000040;
enum PACKAGE_FILTER_BUNDLE = 0x00000080;
enum PACKAGE_INFORMATION_BASIC = 0x00000000;
enum PACKAGE_INFORMATION_FULL = 0x00000100;
enum PACKAGE_PROPERTY_DEVELOPMENT_MODE = 0x00010000;
enum PACKAGE_FILTER_OPTIONAL = 0x00020000;
enum PACKAGE_PROPERTY_IS_IN_RELATED_SET = 0x00040000;
enum PACKAGE_FILTER_IS_IN_RELATED_SET = 0x00040000;
enum PACKAGE_PROPERTY_STATIC = 0x00080000;
enum PACKAGE_FILTER_STATIC = 0x00080000;
enum PACKAGE_PROPERTY_DYNAMIC = 0x00100000;
enum PACKAGE_FILTER_DYNAMIC = 0x00100000;
enum PACKAGE_PROPERTY_HOSTRUNTIME = 0x00200000;
enum PACKAGE_FILTER_HOSTRUNTIME = 0x00200000;
enum PACKAGE_FILTER_ALL_LOADED = 0x00000000;
enum PACKAGE_DEPENDENCY_RANK_DEFAULT = 0x00000000;
enum CLSID_AppxFactory = GUID(0x5842a140, 0xff9f, 0x4166, [0x8f, 0x5c, 0x62, 0xf5, 0xb7, 0xb0, 0xc7, 0x81]);
struct AppxFactory
{
}
enum CLSID_AppxBundleFactory = GUID(0x378e0446, 0x5384, 0x43b7, [0x88, 0x77, 0xe7, 0xdb, 0xdd, 0x88, 0x34, 0x46]);
struct AppxBundleFactory
{
}
enum CLSID_AppxPackagingDiagnosticEventSinkManager = GUID(0x50ca0a46, 0x1588, 0x4161, [0x8e, 0xd2, 0xef, 0x9e, 0x46, 0x9c, 0xed, 0x5d]);
struct AppxPackagingDiagnosticEventSinkManager
{
}
enum CLSID_AppxEncryptionFactory = GUID(0xdc664fdd, 0xd868, 0x46ee, [0x87, 0x80, 0x8d, 0x19, 0x6c, 0xb7, 0x39, 0xf7]);
struct AppxEncryptionFactory
{
}
enum CLSID_AppxPackageEditor = GUID(0xf004f2ca, 0xaebc, 0x4b0d, [0xbf, 0x58, 0xe5, 0x16, 0xd5, 0xbc, 0xc0, 0xab]);
struct AppxPackageEditor
{
}
struct APPX_PACKAGE_SETTINGS
{
    BOOL forceZip32;
    IUri hashMethod;
}
alias APPX_COMPRESSION_OPTION = int;
enum : int
{
    APPX_COMPRESSION_OPTION_NONE      = 0x00000000,
    APPX_COMPRESSION_OPTION_NORMAL    = 0x00000001,
    APPX_COMPRESSION_OPTION_MAXIMUM   = 0x00000002,
    APPX_COMPRESSION_OPTION_FAST      = 0x00000003,
    APPX_COMPRESSION_OPTION_SUPERFAST = 0x00000004,
}

struct APPX_PACKAGE_WRITER_PAYLOAD_STREAM
{
    IStream inputStream;
    const(wchar)* fileName;
    const(wchar)* contentType;
    APPX_COMPRESSION_OPTION compressionOption;
}
alias APPX_FOOTPRINT_FILE_TYPE = int;
enum : int
{
    APPX_FOOTPRINT_FILE_TYPE_MANIFEST        = 0x00000000,
    APPX_FOOTPRINT_FILE_TYPE_BLOCKMAP        = 0x00000001,
    APPX_FOOTPRINT_FILE_TYPE_SIGNATURE       = 0x00000002,
    APPX_FOOTPRINT_FILE_TYPE_CODEINTEGRITY   = 0x00000003,
    APPX_FOOTPRINT_FILE_TYPE_CONTENTGROUPMAP = 0x00000004,
}

alias APPX_BUNDLE_FOOTPRINT_FILE_TYPE = int;
enum : int
{
    APPX_BUNDLE_FOOTPRINT_FILE_TYPE_FIRST     = 0x00000000,
    APPX_BUNDLE_FOOTPRINT_FILE_TYPE_MANIFEST  = 0x00000000,
    APPX_BUNDLE_FOOTPRINT_FILE_TYPE_BLOCKMAP  = 0x00000001,
    APPX_BUNDLE_FOOTPRINT_FILE_TYPE_SIGNATURE = 0x00000002,
    APPX_BUNDLE_FOOTPRINT_FILE_TYPE_LAST      = 0x00000002,
}

alias APPX_CAPABILITIES = int;
enum : int
{
    APPX_CAPABILITY_INTERNET_CLIENT               = 0x00000001,
    APPX_CAPABILITY_INTERNET_CLIENT_SERVER        = 0x00000002,
    APPX_CAPABILITY_PRIVATE_NETWORK_CLIENT_SERVER = 0x00000004,
    APPX_CAPABILITY_DOCUMENTS_LIBRARY             = 0x00000008,
    APPX_CAPABILITY_PICTURES_LIBRARY              = 0x00000010,
    APPX_CAPABILITY_VIDEOS_LIBRARY                = 0x00000020,
    APPX_CAPABILITY_MUSIC_LIBRARY                 = 0x00000040,
    APPX_CAPABILITY_ENTERPRISE_AUTHENTICATION     = 0x00000080,
    APPX_CAPABILITY_SHARED_USER_CERTIFICATES      = 0x00000100,
    APPX_CAPABILITY_REMOVABLE_STORAGE             = 0x00000200,
    APPX_CAPABILITY_APPOINTMENTS                  = 0x00000400,
    APPX_CAPABILITY_CONTACTS                      = 0x00000800,
}

alias APPX_PACKAGE_ARCHITECTURE = int;
enum : int
{
    APPX_PACKAGE_ARCHITECTURE_X86     = 0x00000000,
    APPX_PACKAGE_ARCHITECTURE_ARM     = 0x00000005,
    APPX_PACKAGE_ARCHITECTURE_X64     = 0x00000009,
    APPX_PACKAGE_ARCHITECTURE_NEUTRAL = 0x0000000b,
    APPX_PACKAGE_ARCHITECTURE_ARM64   = 0x0000000c,
}

alias APPX_PACKAGE_ARCHITECTURE2 = int;
enum : int
{
    APPX_PACKAGE_ARCHITECTURE2_X86          = 0x00000000,
    APPX_PACKAGE_ARCHITECTURE2_ARM          = 0x00000005,
    APPX_PACKAGE_ARCHITECTURE2_X64          = 0x00000009,
    APPX_PACKAGE_ARCHITECTURE2_NEUTRAL      = 0x0000000b,
    APPX_PACKAGE_ARCHITECTURE2_ARM64        = 0x0000000c,
    APPX_PACKAGE_ARCHITECTURE2_X86_ON_ARM64 = 0x0000000e,
    APPX_PACKAGE_ARCHITECTURE2_UNKNOWN      = 0x0000ffff,
}

alias APPX_BUNDLE_PAYLOAD_PACKAGE_TYPE = int;
enum : int
{
    APPX_BUNDLE_PAYLOAD_PACKAGE_TYPE_APPLICATION = 0x00000000,
    APPX_BUNDLE_PAYLOAD_PACKAGE_TYPE_RESOURCE    = 0x00000001,
}

alias DX_FEATURE_LEVEL = int;
enum : int
{
    DX_FEATURE_LEVEL_UNSPECIFIED = 0x00000000,
    DX_FEATURE_LEVEL_9           = 0x00000001,
    DX_FEATURE_LEVEL_10          = 0x00000002,
    DX_FEATURE_LEVEL_11          = 0x00000003,
}

alias APPX_CAPABILITY_CLASS_TYPE = int;
enum : int
{
    APPX_CAPABILITY_CLASS_DEFAULT    = 0x00000000,
    APPX_CAPABILITY_CLASS_GENERAL    = 0x00000001,
    APPX_CAPABILITY_CLASS_RESTRICTED = 0x00000002,
    APPX_CAPABILITY_CLASS_WINDOWS    = 0x00000004,
    APPX_CAPABILITY_CLASS_ALL        = 0x00000007,
    APPX_CAPABILITY_CLASS_CUSTOM     = 0x00000008,
}

alias APPX_PACKAGING_CONTEXT_CHANGE_TYPE = int;
enum : int
{
    APPX_PACKAGING_CONTEXT_CHANGE_TYPE_START   = 0x00000000,
    APPX_PACKAGING_CONTEXT_CHANGE_TYPE_CHANGE  = 0x00000001,
    APPX_PACKAGING_CONTEXT_CHANGE_TYPE_DETAILS = 0x00000002,
    APPX_PACKAGING_CONTEXT_CHANGE_TYPE_END     = 0x00000003,
}

enum IID_IAppxFactory = GUID(0xbeb94909, 0xe451, 0x438b, [0xb5, 0xa7, 0xd7, 0x9e, 0x76, 0x7b, 0x75, 0xd8]);
interface IAppxFactory : IUnknown
{
    HRESULT CreatePackageWriter(IStream, APPX_PACKAGE_SETTINGS*, IAppxPackageWriter*);
    HRESULT CreatePackageReader(IStream, IAppxPackageReader*);
    HRESULT CreateManifestReader(IStream, IAppxManifestReader*);
    HRESULT CreateBlockMapReader(IStream, IAppxBlockMapReader*);
    HRESULT CreateValidatedBlockMapReader(IStream, const(wchar)*, IAppxBlockMapReader*);
}
enum IID_IAppxFactory2 = GUID(0xf1346df2, 0xc282, 0x4e22, [0xb9, 0x18, 0x74, 0x3a, 0x92, 0x9a, 0x8d, 0x55]);
interface IAppxFactory2 : IUnknown
{
    HRESULT CreateContentGroupMapReader(IStream, IAppxContentGroupMapReader*);
    HRESULT CreateSourceContentGroupMapReader(IStream, IAppxSourceContentGroupMapReader*);
    HRESULT CreateContentGroupMapWriter(IStream, IAppxContentGroupMapWriter*);
}
enum IID_IAppxFactory3 = GUID(0x776b2c05, 0xe21d, 0x4e24, [0xba, 0x1a, 0xcd, 0x52, 0x9a, 0x8b, 0xfd, 0xbb]);
interface IAppxFactory3 : IUnknown
{
    HRESULT CreatePackageReader2(IStream, const(wchar)*, IAppxPackageReader*);
    HRESULT CreateManifestReader2(IStream, const(wchar)*, IAppxManifestReader*);
    HRESULT CreateAppInstallerReader(IStream, const(wchar)*, IAppxAppInstallerReader*);
}
enum IID_IAppxPackageReader = GUID(0xb5c49650, 0x99bc, 0x481c, [0x9a, 0x34, 0x3d, 0x53, 0xa4, 0x10, 0x67, 0x8]);
interface IAppxPackageReader : IUnknown
{
    HRESULT GetBlockMap(IAppxBlockMapReader*);
    HRESULT GetFootprintFile(APPX_FOOTPRINT_FILE_TYPE, IAppxFile*);
    HRESULT GetPayloadFile(const(wchar)*, IAppxFile*);
    HRESULT GetPayloadFiles(IAppxFilesEnumerator*);
    HRESULT GetManifest(IAppxManifestReader*);
}
enum IID_IAppxPackageWriter = GUID(0x9099e33b, 0x246f, 0x41e4, [0x88, 0x1a, 0x0, 0x8e, 0xb6, 0x13, 0xf8, 0x58]);
interface IAppxPackageWriter : IUnknown
{
    HRESULT AddPayloadFile(const(wchar)*, const(wchar)*, APPX_COMPRESSION_OPTION, IStream);
    HRESULT Close(IStream);
}
enum IID_IAppxPackageWriter2 = GUID(0x2cf5c4fd, 0xe54c, 0x4ea5, [0xba, 0x4e, 0xf8, 0xc4, 0xb1, 0x5, 0xa8, 0xc8]);
interface IAppxPackageWriter2 : IUnknown
{
    HRESULT Close(IStream, IStream);
}
enum IID_IAppxPackageWriter3 = GUID(0xa83aacd3, 0x41c0, 0x4501, [0xb8, 0xa3, 0x74, 0x16, 0x4f, 0x50, 0xb2, 0xfd]);
interface IAppxPackageWriter3 : IUnknown
{
    HRESULT AddPayloadFiles(uint, APPX_PACKAGE_WRITER_PAYLOAD_STREAM*, ulong);
}
enum IID_IAppxFile = GUID(0x91df827b, 0x94fd, 0x468f, [0x82, 0x7b, 0x57, 0xf4, 0x1b, 0x2f, 0x6f, 0x2e]);
interface IAppxFile : IUnknown
{
    HRESULT GetCompressionOption(APPX_COMPRESSION_OPTION*);
    HRESULT GetContentType(PWSTR*);
    HRESULT GetName(PWSTR*);
    HRESULT GetSize(ulong*);
    HRESULT GetStream(IStream*);
}
enum IID_IAppxFilesEnumerator = GUID(0xf007eeaf, 0x9831, 0x411c, [0x98, 0x47, 0x91, 0x7c, 0xdc, 0x62, 0xd1, 0xfe]);
interface IAppxFilesEnumerator : IUnknown
{
    HRESULT GetCurrent(IAppxFile*);
    HRESULT GetHasCurrent(BOOL*);
    HRESULT MoveNext(BOOL*);
}
enum IID_IAppxBlockMapReader = GUID(0x5efec991, 0xbca3, 0x42d1, [0x9e, 0xc2, 0xe9, 0x2d, 0x60, 0x9e, 0xc2, 0x2a]);
interface IAppxBlockMapReader : IUnknown
{
    HRESULT GetFile(const(wchar)*, IAppxBlockMapFile*);
    HRESULT GetFiles(IAppxBlockMapFilesEnumerator*);
    HRESULT GetHashMethod(IUri*);
    HRESULT GetStream(IStream*);
}
enum IID_IAppxBlockMapFile = GUID(0x277672ac, 0x4f63, 0x42c1, [0x8a, 0xbc, 0xbe, 0xae, 0x36, 0x0, 0xeb, 0x59]);
interface IAppxBlockMapFile : IUnknown
{
    HRESULT GetBlocks(IAppxBlockMapBlocksEnumerator*);
    HRESULT GetLocalFileHeaderSize(uint*);
    HRESULT GetName(PWSTR*);
    HRESULT GetUncompressedSize(ulong*);
    HRESULT ValidateFileHash(IStream, BOOL*);
}
enum IID_IAppxBlockMapFilesEnumerator = GUID(0x2b856a2, 0x4262, 0x4070, [0xba, 0xcb, 0x1a, 0x8c, 0xbb, 0xc4, 0x23, 0x5]);
interface IAppxBlockMapFilesEnumerator : IUnknown
{
    HRESULT GetCurrent(IAppxBlockMapFile*);
    HRESULT GetHasCurrent(BOOL*);
    HRESULT MoveNext(BOOL*);
}
enum IID_IAppxBlockMapBlock = GUID(0x75cf3930, 0x3244, 0x4fe0, [0xa8, 0xc8, 0xe0, 0xbc, 0xb2, 0x70, 0xb8, 0x89]);
interface IAppxBlockMapBlock : IUnknown
{
    HRESULT GetHash(uint*, ubyte**);
    HRESULT GetCompressedSize(uint*);
}
enum IID_IAppxBlockMapBlocksEnumerator = GUID(0x6b429b5b, 0x36ef, 0x479e, [0xb9, 0xeb, 0xc, 0x14, 0x82, 0xb4, 0x9e, 0x16]);
interface IAppxBlockMapBlocksEnumerator : IUnknown
{
    HRESULT GetCurrent(IAppxBlockMapBlock*);
    HRESULT GetHasCurrent(BOOL*);
    HRESULT MoveNext(BOOL*);
}
enum IID_IAppxManifestReader = GUID(0x4e1bd148, 0x55a0, 0x4480, [0xa3, 0xd1, 0x15, 0x54, 0x47, 0x10, 0x63, 0x7c]);
interface IAppxManifestReader : IUnknown
{
    HRESULT GetPackageId(IAppxManifestPackageId*);
    HRESULT GetProperties(IAppxManifestProperties*);
    HRESULT GetPackageDependencies(IAppxManifestPackageDependenciesEnumerator*);
    HRESULT GetCapabilities(APPX_CAPABILITIES*);
    HRESULT GetResources(IAppxManifestResourcesEnumerator*);
    HRESULT GetDeviceCapabilities(IAppxManifestDeviceCapabilitiesEnumerator*);
    HRESULT GetPrerequisite(const(wchar)*, ulong*);
    HRESULT GetApplications(IAppxManifestApplicationsEnumerator*);
    HRESULT GetStream(IStream*);
}
enum IID_IAppxManifestReader2 = GUID(0xd06f67bc, 0xb31d, 0x4eba, [0xa8, 0xaf, 0x63, 0x8e, 0x73, 0xe7, 0x7b, 0x4d]);
interface IAppxManifestReader2 : IAppxManifestReader
{
    HRESULT GetQualifiedResources(IAppxManifestQualifiedResourcesEnumerator*);
}
enum IID_IAppxManifestReader3 = GUID(0xc43825ab, 0x69b7, 0x400a, [0x97, 0x9, 0xcc, 0x37, 0xf5, 0xa7, 0x2d, 0x24]);
interface IAppxManifestReader3 : IAppxManifestReader2
{
    HRESULT GetCapabilitiesByCapabilityClass(APPX_CAPABILITY_CLASS_TYPE, IAppxManifestCapabilitiesEnumerator*);
    HRESULT GetTargetDeviceFamilies(IAppxManifestTargetDeviceFamiliesEnumerator*);
}
enum IID_IAppxManifestReader4 = GUID(0x4579bb7c, 0x741d, 0x4161, [0xb5, 0xa1, 0x47, 0xbd, 0x3b, 0x78, 0xad, 0x9b]);
interface IAppxManifestReader4 : IAppxManifestReader3
{
    HRESULT GetOptionalPackageInfo(IAppxManifestOptionalPackageInfo*);
}
enum IID_IAppxManifestReader5 = GUID(0x8d7ae132, 0xa690, 0x4c00, [0xb7, 0x5a, 0x6a, 0xae, 0x1f, 0xea, 0xac, 0x80]);
interface IAppxManifestReader5 : IUnknown
{
    HRESULT GetMainPackageDependencies(IAppxManifestMainPackageDependenciesEnumerator*);
}
enum IID_IAppxManifestReader6 = GUID(0x34deaca4, 0xd3c0, 0x4e3e, [0xb3, 0x12, 0xe4, 0x26, 0x25, 0xe3, 0x80, 0x7e]);
interface IAppxManifestReader6 : IUnknown
{
    HRESULT GetIsNonQualifiedResourcePackage(BOOL*);
}
enum IID_IAppxManifestReader7 = GUID(0x8efe6f27, 0xce0, 0x4988, [0xb3, 0x2d, 0x73, 0x8e, 0xb6, 0x3d, 0xb3, 0xb7]);
interface IAppxManifestReader7 : IUnknown
{
    HRESULT GetDriverDependencies(IAppxManifestDriverDependenciesEnumerator*);
    HRESULT GetOSPackageDependencies(IAppxManifestOSPackageDependenciesEnumerator*);
    HRESULT GetHostRuntimeDependencies(IAppxManifestHostRuntimeDependenciesEnumerator*);
}
enum IID_IAppxManifestDriverDependenciesEnumerator = GUID(0xfe039db2, 0x467f, 0x4755, [0x84, 0x4, 0x8f, 0x5e, 0xb6, 0x86, 0x5b, 0x33]);
interface IAppxManifestDriverDependenciesEnumerator : IUnknown
{
    HRESULT GetCurrent(IAppxManifestDriverDependency*);
    HRESULT GetHasCurrent(BOOL*);
    HRESULT MoveNext(BOOL*);
}
enum IID_IAppxManifestDriverDependency = GUID(0x1210cb94, 0x5a92, 0x4602, [0xbe, 0x24, 0x79, 0xf3, 0x18, 0xaf, 0x4a, 0xf9]);
interface IAppxManifestDriverDependency : IUnknown
{
    HRESULT GetDriverConstraints(IAppxManifestDriverConstraintsEnumerator*);
}
enum IID_IAppxManifestDriverConstraintsEnumerator = GUID(0xd402b2d1, 0xf600, 0x49e0, [0x95, 0xe6, 0x97, 0x5d, 0x8d, 0xa1, 0x3d, 0x89]);
interface IAppxManifestDriverConstraintsEnumerator : IUnknown
{
    HRESULT GetCurrent(IAppxManifestDriverConstraint*);
    HRESULT GetHasCurrent(BOOL*);
    HRESULT MoveNext(BOOL*);
}
enum IID_IAppxManifestDriverConstraint = GUID(0xc031bee4, 0xbbcc, 0x48ea, [0xa2, 0x37, 0xc3, 0x40, 0x45, 0xc8, 0xa, 0x7]);
interface IAppxManifestDriverConstraint : IUnknown
{
    HRESULT GetName(PWSTR*);
    HRESULT GetMinVersion(ulong*);
    HRESULT GetMinDate(PWSTR*);
}
enum IID_IAppxManifestOSPackageDependenciesEnumerator = GUID(0xb84e2fc3, 0xf8ec, 0x4bc1, [0x8a, 0xe2, 0x15, 0x63, 0x46, 0xf5, 0xff, 0xea]);
interface IAppxManifestOSPackageDependenciesEnumerator : IUnknown
{
    HRESULT GetCurrent(IAppxManifestOSPackageDependency*);
    HRESULT GetHasCurrent(BOOL*);
    HRESULT MoveNext(BOOL*);
}
enum IID_IAppxManifestOSPackageDependency = GUID(0x154995ee, 0x54a6, 0x4f14, [0xac, 0x97, 0xd8, 0xcf, 0x5, 0x19, 0x64, 0x4b]);
interface IAppxManifestOSPackageDependency : IUnknown
{
    HRESULT GetName(PWSTR*);
    HRESULT GetVersion(ulong*);
}
enum IID_IAppxManifestHostRuntimeDependenciesEnumerator = GUID(0x6427a646, 0x7f49, 0x433e, [0xb1, 0xa6, 0xd, 0xa3, 0x9, 0xf6, 0x88, 0x5a]);
interface IAppxManifestHostRuntimeDependenciesEnumerator : IUnknown
{
    HRESULT GetCurrent(IAppxManifestHostRuntimeDependency*);
    HRESULT GetHasCurrent(BOOL*);
    HRESULT MoveNext(BOOL*);
}
enum IID_IAppxManifestHostRuntimeDependency = GUID(0x3455d234, 0x8414, 0x410d, [0x95, 0xc7, 0x7b, 0x35, 0x25, 0x5b, 0x83, 0x91]);
interface IAppxManifestHostRuntimeDependency : IUnknown
{
    HRESULT GetName(PWSTR*);
    HRESULT GetPublisher(PWSTR*);
    HRESULT GetMinVersion(ulong*);
}
enum IID_IAppxManifestHostRuntimeDependency2 = GUID(0xc26f23a8, 0xee10, 0x4ad6, [0xb8, 0x98, 0x2b, 0x4d, 0x7a, 0xeb, 0xfe, 0x6a]);
interface IAppxManifestHostRuntimeDependency2 : IUnknown
{
    HRESULT GetPackageFamilyName(PWSTR*);
}
enum IID_IAppxManifestOptionalPackageInfo = GUID(0x2634847d, 0x5b5d, 0x4fe5, [0xa2, 0x43, 0x0, 0x2f, 0xf9, 0x5e, 0xdc, 0x7e]);
interface IAppxManifestOptionalPackageInfo : IUnknown
{
    HRESULT GetIsOptionalPackage(BOOL*);
    HRESULT GetMainPackageName(PWSTR*);
}
enum IID_IAppxManifestMainPackageDependenciesEnumerator = GUID(0xa99c4f00, 0x51d2, 0x4f0f, [0xba, 0x46, 0x7e, 0xd5, 0x25, 0x5e, 0xbd, 0xff]);
interface IAppxManifestMainPackageDependenciesEnumerator : IUnknown
{
    HRESULT GetCurrent(IAppxManifestMainPackageDependency*);
    HRESULT GetHasCurrent(BOOL*);
    HRESULT MoveNext(BOOL*);
}
enum IID_IAppxManifestMainPackageDependency = GUID(0x5d0611c, 0xbc29, 0x46d5, [0x97, 0xe2, 0x84, 0xb9, 0xc7, 0x9b, 0xd8, 0xae]);
interface IAppxManifestMainPackageDependency : IUnknown
{
    HRESULT GetName(PWSTR*);
    HRESULT GetPublisher(PWSTR*);
    HRESULT GetPackageFamilyName(PWSTR*);
}
enum IID_IAppxManifestPackageId = GUID(0x283ce2d7, 0x7153, 0x4a91, [0x96, 0x49, 0x7a, 0xf, 0x72, 0x40, 0x94, 0x5f]);
interface IAppxManifestPackageId : IUnknown
{
    HRESULT GetName(PWSTR*);
    HRESULT GetArchitecture(APPX_PACKAGE_ARCHITECTURE*);
    HRESULT GetPublisher(PWSTR*);
    HRESULT GetVersion(ulong*);
    HRESULT GetResourceId(PWSTR*);
    HRESULT ComparePublisher(const(wchar)*, BOOL*);
    HRESULT GetPackageFullName(PWSTR*);
    HRESULT GetPackageFamilyName(PWSTR*);
}
enum IID_IAppxManifestPackageId2 = GUID(0x2256999d, 0xd617, 0x42f1, [0x88, 0xe, 0xb, 0xa4, 0x54, 0x23, 0x19, 0xd5]);
interface IAppxManifestPackageId2 : IAppxManifestPackageId
{
    HRESULT GetArchitecture2(APPX_PACKAGE_ARCHITECTURE2*);
}
enum IID_IAppxManifestProperties = GUID(0x3faf64d, 0xf26f, 0x4b2c, [0xaa, 0xf7, 0x8f, 0xe7, 0x78, 0x9b, 0x8b, 0xca]);
interface IAppxManifestProperties : IUnknown
{
    HRESULT GetBoolValue(const(wchar)*, BOOL*);
    HRESULT GetStringValue(const(wchar)*, PWSTR*);
}
enum IID_IAppxManifestTargetDeviceFamiliesEnumerator = GUID(0x36537f36, 0x27a4, 0x4788, [0x88, 0xc0, 0x73, 0x38, 0x19, 0x57, 0x50, 0x17]);
interface IAppxManifestTargetDeviceFamiliesEnumerator : IUnknown
{
    HRESULT GetCurrent(IAppxManifestTargetDeviceFamily*);
    HRESULT GetHasCurrent(BOOL*);
    HRESULT MoveNext(BOOL*);
}
enum IID_IAppxManifestTargetDeviceFamily = GUID(0x9091b09b, 0xc8d5, 0x4f31, [0x86, 0x87, 0xa3, 0x38, 0x25, 0x9f, 0xae, 0xfb]);
interface IAppxManifestTargetDeviceFamily : IUnknown
{
    HRESULT GetName(PWSTR*);
    HRESULT GetMinVersion(ulong*);
    HRESULT GetMaxVersionTested(ulong*);
}
enum IID_IAppxManifestPackageDependenciesEnumerator = GUID(0xb43bbcf9, 0x65a6, 0x42dd, [0xba, 0xc0, 0x8c, 0x67, 0x41, 0xe7, 0xf5, 0xa4]);
interface IAppxManifestPackageDependenciesEnumerator : IUnknown
{
    HRESULT GetCurrent(IAppxManifestPackageDependency*);
    HRESULT GetHasCurrent(BOOL*);
    HRESULT MoveNext(BOOL*);
}
enum IID_IAppxManifestPackageDependency = GUID(0xe4946b59, 0x733e, 0x43f0, [0xa7, 0x24, 0x3b, 0xde, 0x4c, 0x12, 0x85, 0xa0]);
interface IAppxManifestPackageDependency : IUnknown
{
    HRESULT GetName(PWSTR*);
    HRESULT GetPublisher(PWSTR*);
    HRESULT GetMinVersion(ulong*);
}
enum IID_IAppxManifestPackageDependency2 = GUID(0xdda0b713, 0xf3ff, 0x49d3, [0x89, 0x8a, 0x27, 0x86, 0x78, 0xc, 0x5d, 0x98]);
interface IAppxManifestPackageDependency2 : IAppxManifestPackageDependency
{
    HRESULT GetMaxMajorVersionTested(ushort*);
}
enum IID_IAppxManifestPackageDependency3 = GUID(0x1ac56374, 0x6198, 0x4d6b, [0x92, 0xe4, 0x74, 0x9d, 0x5a, 0xb8, 0xa8, 0x95]);
interface IAppxManifestPackageDependency3 : IUnknown
{
    HRESULT GetIsOptional(BOOL*);
}
enum IID_IAppxManifestResourcesEnumerator = GUID(0xde4dfbbd, 0x881a, 0x48bb, [0x85, 0x8c, 0xd6, 0xf2, 0xba, 0xea, 0xe6, 0xed]);
interface IAppxManifestResourcesEnumerator : IUnknown
{
    HRESULT GetCurrent(PWSTR*);
    HRESULT GetHasCurrent(BOOL*);
    HRESULT MoveNext(BOOL*);
}
enum IID_IAppxManifestDeviceCapabilitiesEnumerator = GUID(0x30204541, 0x427b, 0x4a1c, [0xba, 0xcf, 0x65, 0x5b, 0xf4, 0x63, 0xa5, 0x40]);
interface IAppxManifestDeviceCapabilitiesEnumerator : IUnknown
{
    HRESULT GetCurrent(PWSTR*);
    HRESULT GetHasCurrent(BOOL*);
    HRESULT MoveNext(BOOL*);
}
enum IID_IAppxManifestCapabilitiesEnumerator = GUID(0x11d22258, 0xf470, 0x42c1, [0xb2, 0x91, 0x83, 0x61, 0xc5, 0x43, 0x7e, 0x41]);
interface IAppxManifestCapabilitiesEnumerator : IUnknown
{
    HRESULT GetCurrent(PWSTR*);
    HRESULT GetHasCurrent(BOOL*);
    HRESULT MoveNext(BOOL*);
}
enum IID_IAppxManifestApplicationsEnumerator = GUID(0x9eb8a55a, 0xf04b, 0x4d0d, [0x80, 0x8d, 0x68, 0x61, 0x85, 0xd4, 0x84, 0x7a]);
interface IAppxManifestApplicationsEnumerator : IUnknown
{
    HRESULT GetCurrent(IAppxManifestApplication*);
    HRESULT GetHasCurrent(BOOL*);
    HRESULT MoveNext(BOOL*);
}
enum IID_IAppxManifestApplication = GUID(0x5da89bf4, 0x3773, 0x46be, [0xb6, 0x50, 0x7e, 0x74, 0x48, 0x63, 0xb7, 0xe8]);
interface IAppxManifestApplication : IUnknown
{
    HRESULT GetStringValue(const(wchar)*, PWSTR*);
    HRESULT GetAppUserModelId(PWSTR*);
}
enum IID_IAppxManifestQualifiedResourcesEnumerator = GUID(0x8ef6adfe, 0x3762, 0x4a8f, [0x93, 0x73, 0x2f, 0xc5, 0xd4, 0x44, 0xc8, 0xd2]);
interface IAppxManifestQualifiedResourcesEnumerator : IUnknown
{
    HRESULT GetCurrent(IAppxManifestQualifiedResource*);
    HRESULT GetHasCurrent(BOOL*);
    HRESULT MoveNext(BOOL*);
}
enum IID_IAppxManifestQualifiedResource = GUID(0x3b53a497, 0x3c5c, 0x48d1, [0x9e, 0xa3, 0xbb, 0x7e, 0xac, 0x8c, 0xd7, 0xd4]);
interface IAppxManifestQualifiedResource : IUnknown
{
    HRESULT GetLanguage(PWSTR*);
    HRESULT GetScale(uint*);
    HRESULT GetDXFeatureLevel(DX_FEATURE_LEVEL*);
}
enum IID_IAppxBundleFactory = GUID(0xbba65864, 0x965f, 0x4a5f, [0x85, 0x5f, 0xf0, 0x74, 0xbd, 0xbf, 0x3a, 0x7b]);
interface IAppxBundleFactory : IUnknown
{
    HRESULT CreateBundleWriter(IStream, ulong, IAppxBundleWriter*);
    HRESULT CreateBundleReader(IStream, IAppxBundleReader*);
    HRESULT CreateBundleManifestReader(IStream, IAppxBundleManifestReader*);
}
enum IID_IAppxBundleFactory2 = GUID(0x7325b83d, 0x185, 0x42c4, [0x82, 0xac, 0xbe, 0x34, 0xab, 0x1a, 0x2a, 0x8a]);
interface IAppxBundleFactory2 : IUnknown
{
    HRESULT CreateBundleReader2(IStream, const(wchar)*, IAppxBundleReader*);
}
enum IID_IAppxBundleWriter = GUID(0xec446fe8, 0xbfec, 0x4c64, [0xab, 0x4f, 0x49, 0xf0, 0x38, 0xf0, 0xc6, 0xd2]);
interface IAppxBundleWriter : IUnknown
{
    HRESULT AddPayloadPackage(const(wchar)*, IStream);
    HRESULT Close();
}
enum IID_IAppxBundleWriter2 = GUID(0x6d8fe971, 0x1cc, 0x49a0, [0xb6, 0x85, 0x23, 0x38, 0x51, 0x27, 0x99, 0x62]);
interface IAppxBundleWriter2 : IUnknown
{
    HRESULT AddExternalPackageReference(const(wchar)*, IStream);
}
enum IID_IAppxBundleWriter3 = GUID(0xad711152, 0xf969, 0x4193, [0x82, 0xd5, 0x9d, 0xdf, 0x27, 0x86, 0xd2, 0x1a]);
interface IAppxBundleWriter3 : IUnknown
{
    HRESULT AddPackageReference(const(wchar)*, IStream);
    HRESULT Close(const(wchar)*);
}
enum IID_IAppxBundleWriter4 = GUID(0x9cd9d523, 0x5009, 0x4c01, [0x98, 0x82, 0xdc, 0x2, 0x9f, 0xbd, 0x47, 0xa3]);
interface IAppxBundleWriter4 : IUnknown
{
    HRESULT AddPayloadPackage(const(wchar)*, IStream, BOOL);
    HRESULT AddPackageReference(const(wchar)*, IStream, BOOL);
    HRESULT AddExternalPackageReference(const(wchar)*, IStream, BOOL);
}
enum IID_IAppxBundleReader = GUID(0xdd75b8c0, 0xba76, 0x43b0, [0xae, 0xf, 0x68, 0x65, 0x6a, 0x1d, 0xc5, 0xc8]);
interface IAppxBundleReader : IUnknown
{
    HRESULT GetFootprintFile(APPX_BUNDLE_FOOTPRINT_FILE_TYPE, IAppxFile*);
    HRESULT GetBlockMap(IAppxBlockMapReader*);
    HRESULT GetManifest(IAppxBundleManifestReader*);
    HRESULT GetPayloadPackages(IAppxFilesEnumerator*);
    HRESULT GetPayloadPackage(const(wchar)*, IAppxFile*);
}
enum IID_IAppxBundleManifestReader = GUID(0xcf0ebbc1, 0xcc99, 0x4106, [0x91, 0xeb, 0xe6, 0x74, 0x62, 0xe0, 0x4f, 0xb0]);
interface IAppxBundleManifestReader : IUnknown
{
    HRESULT GetPackageId(IAppxManifestPackageId*);
    HRESULT GetPackageInfoItems(IAppxBundleManifestPackageInfoEnumerator*);
    HRESULT GetStream(IStream*);
}
enum IID_IAppxBundleManifestReader2 = GUID(0x5517df70, 0x33f, 0x4af2, [0x82, 0x13, 0x87, 0xd7, 0x66, 0x80, 0x5c, 0x2]);
interface IAppxBundleManifestReader2 : IUnknown
{
    HRESULT GetOptionalBundles(IAppxBundleManifestOptionalBundleInfoEnumerator*);
}
enum IID_IAppxBundleManifestPackageInfoEnumerator = GUID(0xf9b856ee, 0x49a6, 0x4e19, [0xb2, 0xb0, 0x6a, 0x24, 0x6, 0xd6, 0x3a, 0x32]);
interface IAppxBundleManifestPackageInfoEnumerator : IUnknown
{
    HRESULT GetCurrent(IAppxBundleManifestPackageInfo*);
    HRESULT GetHasCurrent(BOOL*);
    HRESULT MoveNext(BOOL*);
}
enum IID_IAppxBundleManifestPackageInfo = GUID(0x54cd06c1, 0x268f, 0x40bb, [0x8e, 0xd2, 0x75, 0x7a, 0x9e, 0xba, 0xec, 0x8d]);
interface IAppxBundleManifestPackageInfo : IUnknown
{
    HRESULT GetPackageType(APPX_BUNDLE_PAYLOAD_PACKAGE_TYPE*);
    HRESULT GetPackageId(IAppxManifestPackageId*);
    HRESULT GetFileName(PWSTR*);
    HRESULT GetOffset(ulong*);
    HRESULT GetSize(ulong*);
    HRESULT GetResources(IAppxManifestQualifiedResourcesEnumerator*);
}
enum IID_IAppxBundleManifestPackageInfo2 = GUID(0x44c2acbc, 0xb2cf, 0x4ccb, [0xbb, 0xdb, 0x9c, 0x6d, 0xa8, 0xc3, 0xbc, 0x9e]);
interface IAppxBundleManifestPackageInfo2 : IUnknown
{
    HRESULT GetIsPackageReference(BOOL*);
    HRESULT GetIsNonQualifiedResourcePackage(BOOL*);
    HRESULT GetIsDefaultApplicablePackage(BOOL*);
}
enum IID_IAppxBundleManifestPackageInfo3 = GUID(0x6ba74b98, 0xbb74, 0x4296, [0x80, 0xd0, 0x5f, 0x42, 0x56, 0xa9, 0x96, 0x75]);
interface IAppxBundleManifestPackageInfo3 : IUnknown
{
    HRESULT GetTargetDeviceFamilies(IAppxManifestTargetDeviceFamiliesEnumerator*);
}
enum IID_IAppxBundleManifestPackageInfo4 = GUID(0x5da6f13d, 0xa8a7, 0x4532, [0x85, 0x7c, 0x13, 0x93, 0xd6, 0x59, 0x37, 0x1d]);
interface IAppxBundleManifestPackageInfo4 : IUnknown
{
    HRESULT GetIsStub(BOOL*);
}
enum IID_IAppxBundleManifestOptionalBundleInfoEnumerator = GUID(0x9a178793, 0xf97e, 0x46ac, [0xaa, 0xca, 0xdd, 0x5b, 0xa4, 0xc1, 0x77, 0xc8]);
interface IAppxBundleManifestOptionalBundleInfoEnumerator : IUnknown
{
    HRESULT GetCurrent(IAppxBundleManifestOptionalBundleInfo*);
    HRESULT GetHasCurrent(BOOL*);
    HRESULT MoveNext(BOOL*);
}
enum IID_IAppxBundleManifestOptionalBundleInfo = GUID(0x515bf2e8, 0xbcb0, 0x4d69, [0x8c, 0x48, 0xe3, 0x83, 0x14, 0x7b, 0x6e, 0x12]);
interface IAppxBundleManifestOptionalBundleInfo : IUnknown
{
    HRESULT GetPackageId(IAppxManifestPackageId*);
    HRESULT GetFileName(PWSTR*);
    HRESULT GetPackageInfoItems(IAppxBundleManifestPackageInfoEnumerator*);
}
enum IID_IAppxContentGroupFilesEnumerator = GUID(0x1a09a2fd, 0x7440, 0x44eb, [0x8c, 0x84, 0x84, 0x82, 0x5, 0xa6, 0xa1, 0xcc]);
interface IAppxContentGroupFilesEnumerator : IUnknown
{
    HRESULT GetCurrent(PWSTR*);
    HRESULT GetHasCurrent(BOOL*);
    HRESULT MoveNext(BOOL*);
}
enum IID_IAppxContentGroup = GUID(0x328f6468, 0xc04f, 0x4e3c, [0xb6, 0xfa, 0x6b, 0x8d, 0x27, 0xf3, 0x0, 0x3a]);
interface IAppxContentGroup : IUnknown
{
    HRESULT GetName(PWSTR*);
    HRESULT GetFiles(IAppxContentGroupFilesEnumerator*);
}
enum IID_IAppxContentGroupsEnumerator = GUID(0x3264e477, 0x16d1, 0x4d63, [0x82, 0x3e, 0x7d, 0x29, 0x84, 0x69, 0x66, 0x34]);
interface IAppxContentGroupsEnumerator : IUnknown
{
    HRESULT GetCurrent(IAppxContentGroup*);
    HRESULT GetHasCurrent(BOOL*);
    HRESULT MoveNext(BOOL*);
}
enum IID_IAppxContentGroupMapReader = GUID(0x418726d8, 0xdd99, 0x4f5d, [0x98, 0x86, 0x15, 0x7a, 0xdd, 0x20, 0xde, 0x1]);
interface IAppxContentGroupMapReader : IUnknown
{
    HRESULT GetRequiredGroup(IAppxContentGroup*);
    HRESULT GetAutomaticGroups(IAppxContentGroupsEnumerator*);
}
enum IID_IAppxSourceContentGroupMapReader = GUID(0xf329791d, 0x540b, 0x4a9f, [0xbc, 0x75, 0x32, 0x82, 0xb7, 0xd7, 0x31, 0x93]);
interface IAppxSourceContentGroupMapReader : IUnknown
{
    HRESULT GetRequiredGroup(IAppxContentGroup*);
    HRESULT GetAutomaticGroups(IAppxContentGroupsEnumerator*);
}
enum IID_IAppxContentGroupMapWriter = GUID(0xd07ab776, 0xa9de, 0x4798, [0x8c, 0x14, 0x3d, 0xb3, 0x1e, 0x68, 0x7c, 0x78]);
interface IAppxContentGroupMapWriter : IUnknown
{
    HRESULT AddAutomaticGroup(const(wchar)*);
    HRESULT AddAutomaticFile(const(wchar)*);
    HRESULT Close();
}
enum IID_IAppxPackagingDiagnosticEventSink = GUID(0x17239d47, 0x6adb, 0x45d2, [0x80, 0xf6, 0xf9, 0xcb, 0xc3, 0xbf, 0x5, 0x9d]);
interface IAppxPackagingDiagnosticEventSink : IUnknown
{
    HRESULT ReportContextChange(APPX_PACKAGING_CONTEXT_CHANGE_TYPE, int, const(char)*, const(wchar)*, const(wchar)*);
    HRESULT ReportError(const(wchar)*);
}
enum IID_IAppxPackagingDiagnosticEventSinkManager = GUID(0x369648fa, 0xa7eb, 0x4909, [0xa1, 0x5d, 0x69, 0x54, 0xa0, 0x78, 0xf1, 0x8a]);
interface IAppxPackagingDiagnosticEventSinkManager : IUnknown
{
    HRESULT SetSinkForProcess(IAppxPackagingDiagnosticEventSink);
}
enum IID_IAppxAppInstallerReader = GUID(0xf35bc38c, 0x1d2f, 0x43db, [0xa1, 0xf4, 0x58, 0x64, 0x30, 0xd1, 0xfe, 0xd2]);
interface IAppxAppInstallerReader : IUnknown
{
    HRESULT GetXmlDom(IXMLDOMDocument*);
}
enum IID_IAppxDigestProvider = GUID(0x9fe2702b, 0x7640, 0x4659, [0x8e, 0x6c, 0x34, 0x9e, 0x43, 0xc4, 0xcd, 0xbd]);
interface IAppxDigestProvider : IUnknown
{
    HRESULT GetDigest(PWSTR*);
}
struct APPX_ENCRYPTED_PACKAGE_SETTINGS
{
    uint keyLength;
    const(wchar)* encryptionAlgorithm;
    BOOL useDiffusion;
    IUri blockMapHashAlgorithm;
}
alias APPX_ENCRYPTED_PACKAGE_OPTIONS = int;
enum : int
{
    APPX_ENCRYPTED_PACKAGE_OPTION_NONE         = 0x00000000,
    APPX_ENCRYPTED_PACKAGE_OPTION_DIFFUSION    = 0x00000001,
    APPX_ENCRYPTED_PACKAGE_OPTION_PAGE_HASHING = 0x00000002,
}

struct APPX_ENCRYPTED_PACKAGE_SETTINGS2
{
    uint keyLength;
    const(wchar)* encryptionAlgorithm;
    IUri blockMapHashAlgorithm;
    uint options;
}
struct APPX_KEY_INFO
{
    uint keyLength;
    uint keyIdLength;
    ubyte* key;
    ubyte* keyId;
}
struct APPX_ENCRYPTED_EXEMPTIONS
{
    uint count;
    const(wchar)** plainTextFiles;
}
enum IID_IAppxEncryptionFactory = GUID(0x80e8e04d, 0x8c88, 0x44ae, [0xa0, 0x11, 0x7c, 0xad, 0xf6, 0xfb, 0x2e, 0x72]);
interface IAppxEncryptionFactory : IUnknown
{
    HRESULT EncryptPackage(IStream, IStream, const(APPX_ENCRYPTED_PACKAGE_SETTINGS)*, const(APPX_KEY_INFO)*, const(APPX_ENCRYPTED_EXEMPTIONS)*);
    HRESULT DecryptPackage(IStream, IStream, const(APPX_KEY_INFO)*);
    HRESULT CreateEncryptedPackageWriter(IStream, IStream, const(APPX_ENCRYPTED_PACKAGE_SETTINGS)*, const(APPX_KEY_INFO)*, const(APPX_ENCRYPTED_EXEMPTIONS)*, IAppxEncryptedPackageWriter*);
    HRESULT CreateEncryptedPackageReader(IStream, const(APPX_KEY_INFO)*, IAppxPackageReader*);
    HRESULT EncryptBundle(IStream, IStream, const(APPX_ENCRYPTED_PACKAGE_SETTINGS)*, const(APPX_KEY_INFO)*, const(APPX_ENCRYPTED_EXEMPTIONS)*);
    HRESULT DecryptBundle(IStream, IStream, const(APPX_KEY_INFO)*);
    HRESULT CreateEncryptedBundleWriter(IStream, ulong, const(APPX_ENCRYPTED_PACKAGE_SETTINGS)*, const(APPX_KEY_INFO)*, const(APPX_ENCRYPTED_EXEMPTIONS)*, IAppxEncryptedBundleWriter*);
    HRESULT CreateEncryptedBundleReader(IStream, const(APPX_KEY_INFO)*, IAppxBundleReader*);
}
enum IID_IAppxEncryptionFactory2 = GUID(0xc1b11eee, 0xc4ba, 0x4ab2, [0xa5, 0x5d, 0xd0, 0x15, 0xfe, 0x8f, 0xf6, 0x4f]);
interface IAppxEncryptionFactory2 : IUnknown
{
    HRESULT CreateEncryptedPackageWriter(IStream, IStream, IStream, const(APPX_ENCRYPTED_PACKAGE_SETTINGS)*, const(APPX_KEY_INFO)*, const(APPX_ENCRYPTED_EXEMPTIONS)*, IAppxEncryptedPackageWriter*);
}
enum IID_IAppxEncryptionFactory3 = GUID(0x9edca37, 0xcd64, 0x47d6, [0xb7, 0xe8, 0x1c, 0xb1, 0x1d, 0x4f, 0x7e, 0x5]);
interface IAppxEncryptionFactory3 : IUnknown
{
    HRESULT EncryptPackage(IStream, IStream, const(APPX_ENCRYPTED_PACKAGE_SETTINGS2)*, const(APPX_KEY_INFO)*, const(APPX_ENCRYPTED_EXEMPTIONS)*);
    HRESULT CreateEncryptedPackageWriter(IStream, IStream, IStream, const(APPX_ENCRYPTED_PACKAGE_SETTINGS2)*, const(APPX_KEY_INFO)*, const(APPX_ENCRYPTED_EXEMPTIONS)*, IAppxEncryptedPackageWriter*);
    HRESULT EncryptBundle(IStream, IStream, const(APPX_ENCRYPTED_PACKAGE_SETTINGS2)*, const(APPX_KEY_INFO)*, const(APPX_ENCRYPTED_EXEMPTIONS)*);
    HRESULT CreateEncryptedBundleWriter(IStream, ulong, const(APPX_ENCRYPTED_PACKAGE_SETTINGS2)*, const(APPX_KEY_INFO)*, const(APPX_ENCRYPTED_EXEMPTIONS)*, IAppxEncryptedBundleWriter*);
}
enum IID_IAppxEncryptionFactory4 = GUID(0xa879611f, 0x12fd, 0x41fe, [0x85, 0xd5, 0x6, 0xae, 0x77, 0x9b, 0xba, 0xf5]);
interface IAppxEncryptionFactory4 : IUnknown
{
    HRESULT EncryptPackage(IStream, IStream, const(APPX_ENCRYPTED_PACKAGE_SETTINGS2)*, const(APPX_KEY_INFO)*, const(APPX_ENCRYPTED_EXEMPTIONS)*, ulong);
}
enum IID_IAppxEncryptionFactory5 = GUID(0x68d6e77a, 0xf446, 0x480f, [0xb0, 0xf0, 0xd9, 0x1a, 0x24, 0xc6, 0x7, 0x46]);
interface IAppxEncryptionFactory5 : IUnknown
{
    HRESULT CreateEncryptedPackageReader2(IStream, const(APPX_KEY_INFO)*, const(wchar)*, IAppxPackageReader*);
    HRESULT CreateEncryptedBundleReader2(IStream, const(APPX_KEY_INFO)*, const(wchar)*, IAppxBundleReader*);
}
enum IID_IAppxEncryptedPackageWriter = GUID(0xf43d0b0b, 0x1379, 0x40e2, [0x9b, 0x29, 0x68, 0x2e, 0xa2, 0xbf, 0x42, 0xaf]);
interface IAppxEncryptedPackageWriter : IUnknown
{
    HRESULT AddPayloadFileEncrypted(const(wchar)*, APPX_COMPRESSION_OPTION, IStream);
    HRESULT Close();
}
enum IID_IAppxEncryptedPackageWriter2 = GUID(0x3e475447, 0x3a25, 0x40b5, [0x8a, 0xd2, 0xf9, 0x53, 0xae, 0x50, 0xc9, 0x2d]);
interface IAppxEncryptedPackageWriter2 : IUnknown
{
    HRESULT AddPayloadFilesEncrypted(uint, APPX_PACKAGE_WRITER_PAYLOAD_STREAM*, ulong);
}
enum IID_IAppxEncryptedBundleWriter = GUID(0x80b0902f, 0x7bf0, 0x4117, [0xb8, 0xc6, 0x42, 0x79, 0xef, 0x81, 0xee, 0x77]);
interface IAppxEncryptedBundleWriter : IUnknown
{
    HRESULT AddPayloadPackageEncrypted(const(wchar)*, IStream);
    HRESULT Close();
}
enum IID_IAppxEncryptedBundleWriter2 = GUID(0xe644be82, 0xf0fa, 0x42b8, [0xa9, 0x56, 0x8d, 0x1c, 0xb4, 0x8e, 0xe3, 0x79]);
interface IAppxEncryptedBundleWriter2 : IUnknown
{
    HRESULT AddExternalPackageReference(const(wchar)*, IStream);
}
alias APPX_PACKAGE_EDITOR_UPDATE_PACKAGE_OPTION = int;
enum : int
{
    APPX_PACKAGE_EDITOR_UPDATE_PACKAGE_OPTION_APPEND_DELTA = 0x00000000,
}

alias APPX_PACKAGE_EDITOR_UPDATE_PACKAGE_MANIFEST_OPTIONS = int;
enum : int
{
    APPX_PACKAGE_EDITOR_UPDATE_PACKAGE_MANIFEST_OPTION_NONE            = 0x00000000,
    APPX_PACKAGE_EDITOR_UPDATE_PACKAGE_MANIFEST_OPTION_SKIP_VALIDATION = 0x00000001,
    APPX_PACKAGE_EDITOR_UPDATE_PACKAGE_MANIFEST_OPTION_LOCALIZED       = 0x00000002,
}

enum IID_IAppxEncryptedBundleWriter3 = GUID(0xd34deb3, 0x5cae, 0x4dd3, [0x97, 0x7c, 0x50, 0x49, 0x32, 0xa5, 0x1d, 0x31]);
interface IAppxEncryptedBundleWriter3 : IUnknown
{
    HRESULT AddPayloadPackageEncrypted(const(wchar)*, IStream, BOOL);
    HRESULT AddExternalPackageReference(const(wchar)*, IStream, BOOL);
}
enum IID_IAppxPackageEditor = GUID(0xe2adb6dc, 0x5e71, 0x4416, [0x86, 0xb6, 0x86, 0xe5, 0xf5, 0x29, 0x1a, 0x6b]);
interface IAppxPackageEditor : IUnknown
{
    HRESULT SetWorkingDirectory(const(wchar)*);
    HRESULT CreateDeltaPackage(IStream, IStream, IStream);
    HRESULT CreateDeltaPackageUsingBaselineBlockMap(IStream, IStream, const(wchar)*, IStream);
    HRESULT UpdatePackage(IStream, IStream, APPX_PACKAGE_EDITOR_UPDATE_PACKAGE_OPTION);
    HRESULT UpdateEncryptedPackage(IStream, IStream, APPX_PACKAGE_EDITOR_UPDATE_PACKAGE_OPTION, const(APPX_ENCRYPTED_PACKAGE_SETTINGS2)*, const(APPX_KEY_INFO)*);
    HRESULT UpdatePackageManifest(IStream, IStream, BOOL, APPX_PACKAGE_EDITOR_UPDATE_PACKAGE_MANIFEST_OPTIONS);
}
struct PACKAGE_VERSION
{
    union
    {
        align (4):
        ulong Version;
        struct
        {
            ushort Revision;
            ushort Build;
            ushort Minor;
            ushort Major;
        }
    }
}
struct PACKAGE_ID
{
    align (4):
    uint reserved;
    uint processorArchitecture;
    PACKAGE_VERSION version_;
    PWSTR name;
    PWSTR publisher;
    PWSTR resourceId;
    PWSTR publisherId;
}
alias PackagePathType = int;
enum : int
{
    PackagePathType_Install           = 0x00000000,
    PackagePathType_Mutable           = 0x00000001,
    PackagePathType_Effective         = 0x00000002,
    PackagePathType_MachineExternal   = 0x00000003,
    PackagePathType_UserExternal      = 0x00000004,
    PackagePathType_EffectiveExternal = 0x00000005,
}

alias PackageOrigin = int;
enum : int
{
    PackageOrigin_Unknown           = 0x00000000,
    PackageOrigin_Unsigned          = 0x00000001,
    PackageOrigin_Inbox             = 0x00000002,
    PackageOrigin_Store             = 0x00000003,
    PackageOrigin_DeveloperUnsigned = 0x00000004,
    PackageOrigin_DeveloperSigned   = 0x00000005,
    PackageOrigin_LineOfBusiness    = 0x00000006,
}

struct _PACKAGE_INFO_REFERENCE
{
    void* reserved;
}
struct PACKAGE_INFO
{
    align (4):
    uint reserved;
    uint flags;
    PWSTR path;
    PWSTR packageFullName;
    PWSTR packageFamilyName;
    PACKAGE_ID packageId;
}
alias CreatePackageDependencyOptions = int;
enum : int
{
    CreatePackageDependencyOptions_None                            = 0x00000000,
    CreatePackageDependencyOptions_DoNotVerifyDependencyResolution = 0x00000001,
    CreatePackageDependencyOptions_ScopeIsSystem                   = 0x00000002,
}

alias PackageDependencyLifetimeKind = int;
enum : int
{
    PackageDependencyLifetimeKind_Process     = 0x00000000,
    PackageDependencyLifetimeKind_FilePath    = 0x00000001,
    PackageDependencyLifetimeKind_RegistryKey = 0x00000002,
}

alias AddPackageDependencyOptions = int;
enum : int
{
    AddPackageDependencyOptions_None                   = 0x00000000,
    AddPackageDependencyOptions_PrependIfRankCollision = 0x00000001,
}

alias PackageDependencyProcessorArchitectures = int;
enum : int
{
    PackageDependencyProcessorArchitectures_None    = 0x00000000,
    PackageDependencyProcessorArchitectures_Neutral = 0x00000001,
    PackageDependencyProcessorArchitectures_X86     = 0x00000002,
    PackageDependencyProcessorArchitectures_X64     = 0x00000004,
    PackageDependencyProcessorArchitectures_Arm     = 0x00000008,
    PackageDependencyProcessorArchitectures_Arm64   = 0x00000010,
    PackageDependencyProcessorArchitectures_X86A64  = 0x00000020,
}

struct PACKAGEDEPENDENCY_CONTEXT__
{
    int unused;
}
alias AppPolicyLifecycleManagement = int;
enum : int
{
    AppPolicyLifecycleManagement_Unmanaged = 0x00000000,
    AppPolicyLifecycleManagement_Managed   = 0x00000001,
}

alias AppPolicyWindowingModel = int;
enum : int
{
    AppPolicyWindowingModel_None           = 0x00000000,
    AppPolicyWindowingModel_Universal      = 0x00000001,
    AppPolicyWindowingModel_ClassicDesktop = 0x00000002,
    AppPolicyWindowingModel_ClassicPhone   = 0x00000003,
}

alias AppPolicyMediaFoundationCodecLoading = int;
enum : int
{
    AppPolicyMediaFoundationCodecLoading_All       = 0x00000000,
    AppPolicyMediaFoundationCodecLoading_InboxOnly = 0x00000001,
}

alias AppPolicyClrCompat = int;
enum : int
{
    AppPolicyClrCompat_Other           = 0x00000000,
    AppPolicyClrCompat_ClassicDesktop  = 0x00000001,
    AppPolicyClrCompat_Universal       = 0x00000002,
    AppPolicyClrCompat_PackagedDesktop = 0x00000003,
}

alias AppPolicyThreadInitializationType = int;
enum : int
{
    AppPolicyThreadInitializationType_None            = 0x00000000,
    AppPolicyThreadInitializationType_InitializeWinRT = 0x00000001,
}

alias AppPolicyShowDeveloperDiagnostic = int;
enum : int
{
    AppPolicyShowDeveloperDiagnostic_None   = 0x00000000,
    AppPolicyShowDeveloperDiagnostic_ShowUI = 0x00000001,
}

alias AppPolicyProcessTerminationMethod = int;
enum : int
{
    AppPolicyProcessTerminationMethod_ExitProcess      = 0x00000000,
    AppPolicyProcessTerminationMethod_TerminateProcess = 0x00000001,
}

alias AppPolicyCreateFileAccess = int;
enum : int
{
    AppPolicyCreateFileAccess_Full    = 0x00000000,
    AppPolicyCreateFileAccess_Limited = 0x00000001,
}

struct PACKAGE_VIRTUALIZATION_CONTEXT_HANDLE__
{
    int unused;
}
