module windows.win32.system.mailslots;

import windows.win32.foundation : BOOL, HANDLE, PSTR, PWSTR;
import windows.win32.security : SECURITY_ATTRIBUTES;

version (Windows):
extern (Windows):

HANDLE CreateMailslotA(const(char)*, uint, uint, SECURITY_ATTRIBUTES*);
HANDLE CreateMailslotW(const(wchar)*, uint, uint, SECURITY_ATTRIBUTES*);
BOOL GetMailslotInfo(HANDLE, uint*, uint*, uint*, uint*);
BOOL SetMailslotInfo(HANDLE, uint);
