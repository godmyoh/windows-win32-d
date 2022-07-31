module windows.win32.system.setupandmigration;

import windows.win32.foundation : BOOL;

version (Windows):
extern (Windows):

alias OOBE_COMPLETED_CALLBACK = void function(void*);
BOOL OOBEComplete(BOOL*);
BOOL RegisterWaitUntilOOBECompleted(OOBE_COMPLETED_CALLBACK, void*, void**);
BOOL UnregisterWaitUntilOOBECompleted(void*);
