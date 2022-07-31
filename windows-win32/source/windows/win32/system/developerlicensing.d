module windows.win32.system.developerlicensing;

import windows.win32.foundation : FILETIME, HRESULT, HWND;

version (Windows):
extern (Windows):

HRESULT CheckDeveloperLicense(FILETIME*);
HRESULT AcquireDeveloperLicense(HWND, FILETIME*);
HRESULT RemoveDeveloperLicense(HWND);
