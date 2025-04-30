module windows.win32.system.setupandmigration;

import windows.win32.foundation : BOOL;

version (Windows):
extern (Windows):

alias OOBE_COMPLETED_CALLBACK = void function(void* CallbackContext);
BOOL OOBEComplete(BOOL* isOOBEComplete);
BOOL RegisterWaitUntilOOBECompleted(OOBE_COMPLETED_CALLBACK OOBECompletedCallback, void* CallbackContext, void** WaitHandle);
BOOL UnregisterWaitUntilOOBECompleted(void* WaitHandle);
