module windows.win32.system.diagnostics.ceip;

import windows.win32.foundation : BOOL;

version (Windows):
extern (Windows):

BOOL CeipIsOptedIn();
