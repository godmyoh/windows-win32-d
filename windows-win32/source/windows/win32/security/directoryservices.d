module windows.win32.security.directoryservices;

import windows.win32.foundation : HRESULT, HWND, LPARAM, PWSTR;
import windows.win32.security : PSECURITY_DESCRIPTOR;
import windows.win32.security.authorization.ui : ISecurityInformation;
import windows.win32.ui.controls : HPROPSHEETPAGE;

version (Windows):
extern (Windows):

HRESULT DSCreateISecurityInfoObject(const(wchar)*, const(wchar)*, uint, ISecurityInformation*, PFNREADOBJECTSECURITY, PFNWRITEOBJECTSECURITY, LPARAM);
HRESULT DSCreateISecurityInfoObjectEx(const(wchar)*, const(wchar)*, const(wchar)*, const(wchar)*, const(wchar)*, uint, ISecurityInformation*, PFNREADOBJECTSECURITY, PFNWRITEOBJECTSECURITY, LPARAM);
HRESULT DSCreateSecurityPage(const(wchar)*, const(wchar)*, uint, HPROPSHEETPAGE*, PFNREADOBJECTSECURITY, PFNWRITEOBJECTSECURITY, LPARAM);
HRESULT DSEditSecurity(HWND, const(wchar)*, const(wchar)*, uint, const(wchar)*, PFNREADOBJECTSECURITY, PFNWRITEOBJECTSECURITY, LPARAM);
enum DSSI_READ_ONLY = 0x00000001;
enum DSSI_NO_ACCESS_CHECK = 0x00000002;
enum DSSI_NO_EDIT_SACL = 0x00000004;
enum DSSI_NO_EDIT_OWNER = 0x00000008;
enum DSSI_IS_ROOT = 0x00000010;
enum DSSI_NO_FILTER = 0x00000020;
enum DSSI_NO_READONLY_MESSAGE = 0x00000040;
alias PFNREADOBJECTSECURITY = HRESULT function(const(wchar)*, uint, PSECURITY_DESCRIPTOR*, LPARAM);
alias PFNWRITEOBJECTSECURITY = HRESULT function(const(wchar)*, uint, PSECURITY_DESCRIPTOR, LPARAM);
alias PFNDSCREATEISECINFO = HRESULT function(const(wchar)*, const(wchar)*, uint, ISecurityInformation*, PFNREADOBJECTSECURITY, PFNWRITEOBJECTSECURITY, LPARAM);
alias PFNDSCREATEISECINFOEX = HRESULT function(const(wchar)*, const(wchar)*, const(wchar)*, const(wchar)*, const(wchar)*, uint, ISecurityInformation*, PFNREADOBJECTSECURITY, PFNWRITEOBJECTSECURITY, LPARAM);
alias PFNDSCREATESECPAGE = HRESULT function(const(wchar)*, const(wchar)*, uint, HPROPSHEETPAGE*, PFNREADOBJECTSECURITY, PFNWRITEOBJECTSECURITY, LPARAM);
alias PFNDSEDITSECURITY = HRESULT function(HWND, const(wchar)*, const(wchar)*, uint, const(wchar)*, PFNREADOBJECTSECURITY, PFNWRITEOBJECTSECURITY, LPARAM);
