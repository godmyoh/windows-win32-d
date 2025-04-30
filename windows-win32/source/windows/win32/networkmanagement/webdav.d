module windows.win32.networkmanagement.webdav;

import windows.win32.foundation : BOOL, HANDLE, PWSTR;

version (Windows):
extern (Windows):

uint DavAddConnection(HANDLE* ConnectionHandle, const(wchar)* RemoteName, const(wchar)* UserName, const(wchar)* Password, ubyte* ClientCert, uint CertSize);
uint DavDeleteConnection(HANDLE ConnectionHandle);
uint DavGetUNCFromHTTPPath(const(wchar)* Url, PWSTR UncPath, uint* lpSize);
uint DavGetHTTPFromUNCPath(const(wchar)* UncPath, PWSTR Url, uint* lpSize);
uint DavGetTheLockOwnerOfTheFile(const(wchar)* FileName, PWSTR LockOwnerName, uint* LockOwnerNameLengthInBytes);
uint DavGetExtendedError(HANDLE hFile, uint* ExtError, PWSTR ExtErrorString, uint* cChSize);
uint DavFlushFile(HANDLE hFile);
uint DavInvalidateCache(const(wchar)* URLName);
uint DavCancelConnectionsToServer(PWSTR lpName, BOOL fForce);
uint DavRegisterAuthCallback(PFNDAVAUTHCALLBACK CallBack, uint Version);
void DavUnregisterAuthCallback(uint hCallback);
enum DAV_AUTHN_SCHEME_BASIC = 0x00000001;
enum DAV_AUTHN_SCHEME_NTLM = 0x00000002;
enum DAV_AUTHN_SCHEME_PASSPORT = 0x00000004;
enum DAV_AUTHN_SCHEME_DIGEST = 0x00000008;
enum DAV_AUTHN_SCHEME_NEGOTIATE = 0x00000010;
enum DAV_AUTHN_SCHEME_CERT = 0x00010000;
enum DAV_AUTHN_SCHEME_FBA = 0x00100000;
struct DAV_CALLBACK_AUTH_BLOB
{
    void* pBuffer;
    uint ulSize;
    uint ulType;
}
struct DAV_CALLBACK_AUTH_UNP
{
    PWSTR pszUserName;
    uint ulUserNameLength;
    PWSTR pszPassword;
    uint ulPasswordLength;
}
struct DAV_CALLBACK_CRED
{
    DAV_CALLBACK_AUTH_BLOB AuthBlob;
    DAV_CALLBACK_AUTH_UNP UNPBlob;
    BOOL bAuthBlobValid;
    BOOL bSave;
}
alias AUTHNEXTSTEP = int;
enum : int
{
    DefaultBehavior = 0x00000000,
    RetryRequest    = 0x00000001,
    CancelRequest   = 0x00000002,
}

alias PFNDAVAUTHCALLBACK_FREECRED = uint function(void* pbuffer);
alias PFNDAVAUTHCALLBACK = uint function(PWSTR lpwzServerName, PWSTR lpwzRemoteName, uint dwAuthScheme, uint dwFlags, DAV_CALLBACK_CRED* pCallbackCred, AUTHNEXTSTEP* NextStep, PFNDAVAUTHCALLBACK_FREECRED* pFreeCred);
