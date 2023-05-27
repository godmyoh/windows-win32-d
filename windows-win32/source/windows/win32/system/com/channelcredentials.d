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
    HRESULT SetWindowsCredential(BSTR, BSTR, BSTR, int, BOOL);
    HRESULT SetUserNameCredential(BSTR, BSTR);
    HRESULT SetClientCertificateFromStore(BSTR, BSTR, BSTR, VARIANT);
    HRESULT SetClientCertificateFromStoreByName(BSTR, BSTR, BSTR);
    HRESULT SetClientCertificateFromFile(BSTR, BSTR, BSTR);
    HRESULT SetDefaultServiceCertificateFromStore(BSTR, BSTR, BSTR, VARIANT);
    HRESULT SetDefaultServiceCertificateFromStoreByName(BSTR, BSTR, BSTR);
    HRESULT SetDefaultServiceCertificateFromFile(BSTR, BSTR, BSTR);
    HRESULT SetServiceCertificateAuthentication(BSTR, BSTR, BSTR);
    HRESULT SetIssuedToken(BSTR, BSTR, BSTR);
}
