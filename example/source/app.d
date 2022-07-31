module app;

import windows.win32.foundation;
import windows.win32.ui.windowsandmessaging;

extern (Windows) int WinMain(HINSTANCE hInstance, HINSTANCE hPrevInstance, const(char)* lpCmdLine, int nCmdShow)
{
	MessageBoxW(null, "windows-win32-d"w.ptr, "Message"w.ptr, MB_OK);
	return 0;
}
