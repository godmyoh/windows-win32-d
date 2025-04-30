module windows.win32.system.mailslots;

import windows.win32.foundation : BOOL, HANDLE, PSTR, PWSTR;
import windows.win32.security : SECURITY_ATTRIBUTES;

version (Windows):
extern (Windows):

HANDLE CreateMailslotA(const(char)* lpName, uint nMaxMessageSize, uint lReadTimeout, SECURITY_ATTRIBUTES* lpSecurityAttributes);
HANDLE CreateMailslotW(const(wchar)* lpName, uint nMaxMessageSize, uint lReadTimeout, SECURITY_ATTRIBUTES* lpSecurityAttributes);
BOOL GetMailslotInfo(HANDLE hMailslot, uint* lpMaxMessageSize, uint* lpNextSize, uint* lpMessageCount, uint* lpReadTimeout);
BOOL SetMailslotInfo(HANDLE hMailslot, uint lReadTimeout);
