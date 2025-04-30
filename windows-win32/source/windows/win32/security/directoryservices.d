module windows.win32.security.directoryservices;

import windows.win32.foundation : HRESULT, HWND, LPARAM, PWSTR;
import windows.win32.security : PSECURITY_DESCRIPTOR;
import windows.win32.security.authorization.ui : ISecurityInformation;
import windows.win32.ui.controls : HPROPSHEETPAGE;

version (Windows):
extern (Windows):

HRESULT DSCreateISecurityInfoObject(const(wchar)* pwszObjectPath, const(wchar)* pwszObjectClass, uint dwFlags, ISecurityInformation* ppSI, PFNREADOBJECTSECURITY pfnReadSD, PFNWRITEOBJECTSECURITY pfnWriteSD, LPARAM lpContext);
HRESULT DSCreateISecurityInfoObjectEx(const(wchar)* pwszObjectPath, const(wchar)* pwszObjectClass, const(wchar)* pwszServer, const(wchar)* pwszUserName, const(wchar)* pwszPassword, uint dwFlags, ISecurityInformation* ppSI, PFNREADOBJECTSECURITY pfnReadSD, PFNWRITEOBJECTSECURITY pfnWriteSD, LPARAM lpContext);
HRESULT DSCreateSecurityPage(const(wchar)* pwszObjectPath, const(wchar)* pwszObjectClass, uint dwFlags, HPROPSHEETPAGE* phPage, PFNREADOBJECTSECURITY pfnReadSD, PFNWRITEOBJECTSECURITY pfnWriteSD, LPARAM lpContext);
HRESULT DSEditSecurity(HWND hwndOwner, const(wchar)* pwszObjectPath, const(wchar)* pwszObjectClass, uint dwFlags, const(wchar)* pwszCaption, PFNREADOBJECTSECURITY pfnReadSD, PFNWRITEOBJECTSECURITY pfnWriteSD, LPARAM lpContext);
enum DSSI_READ_ONLY = 0x00000001;
enum DSSI_NO_ACCESS_CHECK = 0x00000002;
enum DSSI_NO_EDIT_SACL = 0x00000004;
enum DSSI_NO_EDIT_OWNER = 0x00000008;
enum DSSI_IS_ROOT = 0x00000010;
enum DSSI_NO_FILTER = 0x00000020;
enum DSSI_NO_READONLY_MESSAGE = 0x00000040;
alias PFNREADOBJECTSECURITY = HRESULT function(const(wchar)* param0, uint param1, PSECURITY_DESCRIPTOR* param2, LPARAM param3);
alias PFNWRITEOBJECTSECURITY = HRESULT function(const(wchar)* param0, uint param1, PSECURITY_DESCRIPTOR param2, LPARAM param3);
alias PFNDSCREATEISECINFO = HRESULT function(const(wchar)* param0, const(wchar)* param1, uint param2, ISecurityInformation* param3, PFNREADOBJECTSECURITY param4, PFNWRITEOBJECTSECURITY param5, LPARAM param6);
alias PFNDSCREATEISECINFOEX = HRESULT function(const(wchar)* param0, const(wchar)* param1, const(wchar)* param2, const(wchar)* param3, const(wchar)* param4, uint param5, ISecurityInformation* param6, PFNREADOBJECTSECURITY param7, PFNWRITEOBJECTSECURITY param8, LPARAM param9);
alias PFNDSCREATESECPAGE = HRESULT function(const(wchar)* param0, const(wchar)* param1, uint param2, HPROPSHEETPAGE* param3, PFNREADOBJECTSECURITY param4, PFNWRITEOBJECTSECURITY param5, LPARAM param6);
alias PFNDSEDITSECURITY = HRESULT function(HWND param0, const(wchar)* param1, const(wchar)* param2, uint param3, const(wchar)* param4, PFNREADOBJECTSECURITY param5, PFNWRITEOBJECTSECURITY param6, LPARAM param7);
