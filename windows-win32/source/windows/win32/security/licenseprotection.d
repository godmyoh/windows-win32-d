module windows.win32.security.licenseprotection;

import windows.win32.foundation : FILETIME, HRESULT, PWSTR;

version (Windows):
extern (Windows):

alias LicenseProtectionStatus = int;
enum : int
{
    Success                 = 0x00000000,
    LicenseKeyNotFound      = 0x00000001,
    LicenseKeyUnprotected   = 0x00000002,
    LicenseKeyCorrupted     = 0x00000003,
    LicenseKeyAlreadyExists = 0x00000004,
}

HRESULT RegisterLicenseKeyWithExpiration(const(wchar)*, uint, LicenseProtectionStatus*);
HRESULT ValidateLicenseKeyProtection(const(wchar)*, FILETIME*, FILETIME*, LicenseProtectionStatus*);
