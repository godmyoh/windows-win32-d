module windows.win32.system.com.channelcredentials;

import windows.win32.guid : GUID;
import windows.win32.foundation : BOOL, BSTR, HRESULT;
import windows.win32.system.com : IDispatch;
import windows.win32.system.variant : VARIANT;

version (Windows):
extern (Windows):

enum IID_IChannelCredentials = GUID(0x181b448c, 0xc17c, 0x4b17, [0xac, 0x6d, 0x6, 0x69, 0x9b, 0x93, 0x19, 0x8f]);
interface IChannelCredentials : IDispatch
{
    HRESULT SetWindowsCredential(BSTR domain, BSTR username, BSTR password, int impersonationLevel, BOOL allowNtlm);
    HRESULT SetUserNameCredential(BSTR username, BSTR password);
    HRESULT SetClientCertificateFromStore(BSTR storeLocation, BSTR storeName, BSTR findYype, VARIANT findValue);
    HRESULT SetClientCertificateFromStoreByName(BSTR subjectName, BSTR storeLocation, BSTR storeName);
    HRESULT SetClientCertificateFromFile(BSTR filename, BSTR password, BSTR keystorageFlags);
    HRESULT SetDefaultServiceCertificateFromStore(BSTR storeLocation, BSTR storeName, BSTR findType, VARIANT findValue);
    HRESULT SetDefaultServiceCertificateFromStoreByName(BSTR subjectName, BSTR storeLocation, BSTR storeName);
    HRESULT SetDefaultServiceCertificateFromFile(BSTR filename, BSTR password, BSTR keystorageFlags);
    HRESULT SetServiceCertificateAuthentication(BSTR storeLocation, BSTR revocationMode, BSTR certificateValidationMode);
    HRESULT SetIssuedToken(BSTR localIssuerAddres, BSTR localIssuerBindingType, BSTR localIssuerBinding);
}
