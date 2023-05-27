module windows.win32.system.transactionserver;

import windows.win32.guid : GUID;
import windows.win32.foundation : BSTR, HRESULT;
import windows.win32.system.com : IDispatch, SAFEARRAY;

version (Windows):
extern (Windows):

enum IID_ICatalog = GUID(0x6eb22870, 0x8a19, 0x11d0, [0x81, 0xb6, 0x0, 0xa0, 0xc9, 0x23, 0x1c, 0x29]);
interface ICatalog : IDispatch
{
    HRESULT GetCollection(BSTR, IDispatch*);
    HRESULT Connect(BSTR, IDispatch*);
    HRESULT get_MajorVersion(int*);
    HRESULT get_MinorVersion(int*);
}
enum IID_IComponentUtil = GUID(0x6eb22873, 0x8a19, 0x11d0, [0x81, 0xb6, 0x0, 0xa0, 0xc9, 0x23, 0x1c, 0x29]);
interface IComponentUtil : IDispatch
{
    HRESULT InstallComponent(BSTR, BSTR, BSTR);
    HRESULT ImportComponent(BSTR);
    HRESULT ImportComponentByName(BSTR);
    HRESULT GetCLSIDs(BSTR, BSTR, SAFEARRAY**);
}
enum IID_IPackageUtil = GUID(0x6eb22874, 0x8a19, 0x11d0, [0x81, 0xb6, 0x0, 0xa0, 0xc9, 0x23, 0x1c, 0x29]);
interface IPackageUtil : IDispatch
{
    HRESULT InstallPackage(BSTR, BSTR, int);
    HRESULT ExportPackage(BSTR, BSTR, int);
    HRESULT ShutdownPackage(BSTR);
}
enum IID_IRemoteComponentUtil = GUID(0x6eb22875, 0x8a19, 0x11d0, [0x81, 0xb6, 0x0, 0xa0, 0xc9, 0x23, 0x1c, 0x29]);
interface IRemoteComponentUtil : IDispatch
{
    HRESULT InstallRemoteComponent(BSTR, BSTR, BSTR);
    HRESULT InstallRemoteComponentByName(BSTR, BSTR, BSTR);
}
enum IID_IRoleAssociationUtil = GUID(0x6eb22876, 0x8a19, 0x11d0, [0x81, 0xb6, 0x0, 0xa0, 0xc9, 0x23, 0x1c, 0x29]);
interface IRoleAssociationUtil : IDispatch
{
    HRESULT AssociateRole(BSTR);
    HRESULT AssociateRoleByName(BSTR);
}
alias MTSPackageInstallOptions = int;
enum : int
{
    mtsInstallUsers = 0x00000001,
}

alias MTSPackageExportOptions = int;
enum : int
{
    mtsExportUsers = 0x00000001,
}

alias MTSAdminErrorCodes = int;
enum : int
{
    mtsErrObjectErrors           = 0x80110401,
    mtsErrObjectInvalid          = 0x80110402,
    mtsErrKeyMissing             = 0x80110403,
    mtsErrAlreadyInstalled       = 0x80110404,
    mtsErrDownloadFailed         = 0x80110405,
    mtsErrPDFWriteFail           = 0x80110407,
    mtsErrPDFReadFail            = 0x80110408,
    mtsErrPDFVersion             = 0x80110409,
    mtsErrCoReqCompInstalled     = 0x80110410,
    mtsErrBadPath                = 0x8011040a,
    mtsErrPackageExists          = 0x8011040b,
    mtsErrRoleExists             = 0x8011040c,
    mtsErrCantCopyFile           = 0x8011040d,
    mtsErrNoTypeLib              = 0x8011040e,
    mtsErrNoUser                 = 0x8011040f,
    mtsErrInvalidUserids         = 0x80110410,
    mtsErrNoRegistryCLSID        = 0x80110411,
    mtsErrBadRegistryProgID      = 0x80110412,
    mtsErrAuthenticationLevel    = 0x80110413,
    mtsErrUserPasswdNotValid     = 0x80110414,
    mtsErrNoRegistryRead         = 0x80110415,
    mtsErrNoRegistryWrite        = 0x80110416,
    mtsErrNoRegistryRepair       = 0x80110417,
    mtsErrCLSIDOrIIDMismatch     = 0x80110418,
    mtsErrRemoteInterface        = 0x80110419,
    mtsErrDllRegisterServer      = 0x8011041a,
    mtsErrNoServerShare          = 0x8011041b,
    mtsErrNoAccessToUNC          = 0x8011041c,
    mtsErrDllLoadFailed          = 0x8011041d,
    mtsErrBadRegistryLibID       = 0x8011041e,
    mtsErrPackDirNotFound        = 0x8011041f,
    mtsErrTreatAs                = 0x80110420,
    mtsErrBadForward             = 0x80110421,
    mtsErrBadIID                 = 0x80110422,
    mtsErrRegistrarFailed        = 0x80110423,
    mtsErrCompFileDoesNotExist   = 0x80110424,
    mtsErrCompFileLoadDLLFail    = 0x80110425,
    mtsErrCompFileGetClassObj    = 0x80110426,
    mtsErrCompFileClassNotAvail  = 0x80110427,
    mtsErrCompFileBadTLB         = 0x80110428,
    mtsErrCompFileNotInstallable = 0x80110429,
    mtsErrNotChangeable          = 0x8011042a,
    mtsErrNotDeletable           = 0x8011042b,
    mtsErrSession                = 0x8011042c,
    mtsErrCompFileNoRegistrar    = 0x80110434,
}

enum CLSID_Catalog = GUID(0x6eb22881, 0x8a19, 0x11d0, [0x81, 0xb6, 0x0, 0xa0, 0xc9, 0x23, 0x1c, 0x29]);
struct Catalog
{
}
enum CLSID_CatalogObject = GUID(0x6eb22882, 0x8a19, 0x11d0, [0x81, 0xb6, 0x0, 0xa0, 0xc9, 0x23, 0x1c, 0x29]);
struct CatalogObject
{
}
enum CLSID_CatalogCollection = GUID(0x6eb22883, 0x8a19, 0x11d0, [0x81, 0xb6, 0x0, 0xa0, 0xc9, 0x23, 0x1c, 0x29]);
struct CatalogCollection
{
}
enum CLSID_ComponentUtil = GUID(0x6eb22884, 0x8a19, 0x11d0, [0x81, 0xb6, 0x0, 0xa0, 0xc9, 0x23, 0x1c, 0x29]);
struct ComponentUtil
{
}
enum CLSID_PackageUtil = GUID(0x6eb22885, 0x8a19, 0x11d0, [0x81, 0xb6, 0x0, 0xa0, 0xc9, 0x23, 0x1c, 0x29]);
struct PackageUtil
{
}
enum CLSID_RemoteComponentUtil = GUID(0x6eb22886, 0x8a19, 0x11d0, [0x81, 0xb6, 0x0, 0xa0, 0xc9, 0x23, 0x1c, 0x29]);
struct RemoteComponentUtil
{
}
enum CLSID_RoleAssociationUtil = GUID(0x6eb22887, 0x8a19, 0x11d0, [0x81, 0xb6, 0x0, 0xa0, 0xc9, 0x23, 0x1c, 0x29]);
struct RoleAssociationUtil
{
}
