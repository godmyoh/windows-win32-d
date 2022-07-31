module windows.win32.networkmanagement.webdav;

import windows.win32.foundation : BOOL, HANDLE, PWSTR;

version (Windows):
extern (Windows):

uint DavAddConnection(HANDLE*, const(wchar)*, const(wchar)*, const(wchar)*, ubyte*, uint);
uint DavDeleteConnection(HANDLE);
uint DavGetUNCFromHTTPPath(const(wchar)*, PWSTR, uint*);
uint DavGetHTTPFromUNCPath(const(wchar)*, PWSTR, uint*);
uint DavGetTheLockOwnerOfTheFile(const(wchar)*, PWSTR, uint*);
uint DavGetExtendedError(HANDLE, uint*, PWSTR, uint*);
uint DavFlushFile(HANDLE);
uint DavInvalidateCache(const(wchar)*);
uint DavCancelConnectionsToServer(PWSTR, BOOL);
uint DavRegisterAuthCallback(PFNDAVAUTHCALLBACK, uint);
void DavUnregisterAuthCallback(uint);
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

alias PFNDAVAUTHCALLBACK_FREECRED = uint function(void*);
alias PFNDAVAUTHCALLBACK = uint function(PWSTR, PWSTR, uint, uint, DAV_CALLBACK_CRED*, AUTHNEXTSTEP*, PFNDAVAUTHCALLBACK_FREECRED*);
