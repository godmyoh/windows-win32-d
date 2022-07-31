module windows.win32.ui.windowsandmessaging;

import windows.win32.foundation : BOOL, BOOLEAN, CHAR, HANDLE, HINSTANCE, HRESULT, HWND, LPARAM, LRESULT, POINT, PSTR, PWSTR, RECT, SIZE, WPARAM;
import windows.win32.graphics.gdi : BLENDFUNCTION, HBITMAP, HBRUSH, HDC, HRGN, LOGFONTA, LOGFONTW;
import windows.win32.system.power : POWER_SETTING_REGISTER_NOTIFICATION_FLAGS;
import windows.win32.ui.shell_ : HELPINFO;

version (Windows):
extern (Windows):

alias WNDCLASS_STYLES = uint;
enum : uint
{
    CS_VREDRAW         = 0x00000001,
    CS_HREDRAW         = 0x00000002,
    CS_DBLCLKS         = 0x00000008,
    CS_OWNDC           = 0x00000020,
    CS_CLASSDC         = 0x00000040,
    CS_PARENTDC        = 0x00000080,
    CS_NOCLOSE         = 0x00000200,
    CS_SAVEBITS        = 0x00000800,
    CS_BYTEALIGNCLIENT = 0x00001000,
    CS_BYTEALIGNWINDOW = 0x00002000,
    CS_GLOBALCLASS     = 0x00004000,
    CS_IME             = 0x00010000,
    CS_DROPSHADOW      = 0x00020000,
}

alias CWP_FLAGS = uint;
enum : uint
{
    CWP_ALL             = 0x00000000,
    CWP_SKIPINVISIBLE   = 0x00000001,
    CWP_SKIPDISABLED    = 0x00000002,
    CWP_SKIPTRANSPARENT = 0x00000004,
}

alias MESSAGEBOX_STYLE = uint;
enum : uint
{
    MB_ABORTRETRYIGNORE          = 0x00000002,
    MB_CANCELTRYCONTINUE         = 0x00000006,
    MB_HELP                      = 0x00004000,
    MB_OK                        = 0x00000000,
    MB_OKCANCEL                  = 0x00000001,
    MB_RETRYCANCEL               = 0x00000005,
    MB_YESNO                     = 0x00000004,
    MB_YESNOCANCEL               = 0x00000003,
    MB_ICONHAND                  = 0x00000010,
    MB_ICONQUESTION              = 0x00000020,
    MB_ICONEXCLAMATION           = 0x00000030,
    MB_ICONASTERISK              = 0x00000040,
    MB_USERICON                  = 0x00000080,
    MB_ICONWARNING               = 0x00000030,
    MB_ICONERROR                 = 0x00000010,
    MB_ICONINFORMATION           = 0x00000040,
    MB_ICONSTOP                  = 0x00000010,
    MB_DEFBUTTON1                = 0x00000000,
    MB_DEFBUTTON2                = 0x00000100,
    MB_DEFBUTTON3                = 0x00000200,
    MB_DEFBUTTON4                = 0x00000300,
    MB_APPLMODAL                 = 0x00000000,
    MB_SYSTEMMODAL               = 0x00001000,
    MB_TASKMODAL                 = 0x00002000,
    MB_NOFOCUS                   = 0x00008000,
    MB_SETFOREGROUND             = 0x00010000,
    MB_DEFAULT_DESKTOP_ONLY      = 0x00020000,
    MB_TOPMOST                   = 0x00040000,
    MB_RIGHT                     = 0x00080000,
    MB_RTLREADING                = 0x00100000,
    MB_SERVICE_NOTIFICATION      = 0x00200000,
    MB_SERVICE_NOTIFICATION_NT3X = 0x00040000,
    MB_TYPEMASK                  = 0x0000000f,
    MB_ICONMASK                  = 0x000000f0,
    MB_DEFMASK                   = 0x00000f00,
    MB_MODEMASK                  = 0x00003000,
    MB_MISCMASK                  = 0x0000c000,
}

alias MENU_ITEM_FLAGS = uint;
enum : uint
{
    MF_BYCOMMAND       = 0x00000000,
    MF_BYPOSITION      = 0x00000400,
    MF_BITMAP          = 0x00000004,
    MF_CHECKED         = 0x00000008,
    MF_DISABLED        = 0x00000002,
    MF_ENABLED         = 0x00000000,
    MF_GRAYED          = 0x00000001,
    MF_MENUBARBREAK    = 0x00000020,
    MF_MENUBREAK       = 0x00000040,
    MF_OWNERDRAW       = 0x00000100,
    MF_POPUP           = 0x00000010,
    MF_SEPARATOR       = 0x00000800,
    MF_STRING          = 0x00000000,
    MF_UNCHECKED       = 0x00000000,
    MF_INSERT          = 0x00000000,
    MF_CHANGE          = 0x00000080,
    MF_APPEND          = 0x00000100,
    MF_DELETE          = 0x00000200,
    MF_REMOVE          = 0x00001000,
    MF_USECHECKBITMAPS = 0x00000200,
    MF_UNHILITE        = 0x00000000,
    MF_HILITE          = 0x00000080,
    MF_DEFAULT         = 0x00001000,
    MF_SYSMENU         = 0x00002000,
    MF_HELP            = 0x00004000,
    MF_RIGHTJUSTIFY    = 0x00004000,
    MF_MOUSESELECT     = 0x00008000,
    MF_END             = 0x00000080,
}

alias SHOW_WINDOW_CMD = uint;
enum : uint
{
    SW_FORCEMINIMIZE   = 0x0000000b,
    SW_HIDE            = 0x00000000,
    SW_MAXIMIZE        = 0x00000003,
    SW_MINIMIZE        = 0x00000006,
    SW_RESTORE         = 0x00000009,
    SW_SHOW            = 0x00000005,
    SW_SHOWDEFAULT     = 0x0000000a,
    SW_SHOWMAXIMIZED   = 0x00000003,
    SW_SHOWMINIMIZED   = 0x00000002,
    SW_SHOWMINNOACTIVE = 0x00000007,
    SW_SHOWNA          = 0x00000008,
    SW_SHOWNOACTIVATE  = 0x00000004,
    SW_SHOWNORMAL      = 0x00000001,
    SW_NORMAL          = 0x00000001,
    SW_MAX             = 0x0000000b,
    SW_PARENTCLOSING   = 0x00000001,
    SW_OTHERZOOM       = 0x00000002,
    SW_PARENTOPENING   = 0x00000003,
    SW_OTHERUNZOOM     = 0x00000004,
    SW_SCROLLCHILDREN  = 0x00000001,
    SW_INVALIDATE      = 0x00000002,
    SW_ERASE           = 0x00000004,
    SW_SMOOTHSCROLL    = 0x00000010,
}

alias SYSTEM_PARAMETERS_INFO_ACTION = uint;
enum : uint
{
    SPI_GETBEEP                      = 0x00000001,
    SPI_SETBEEP                      = 0x00000002,
    SPI_GETMOUSE                     = 0x00000003,
    SPI_SETMOUSE                     = 0x00000004,
    SPI_GETBORDER                    = 0x00000005,
    SPI_SETBORDER                    = 0x00000006,
    SPI_GETKEYBOARDSPEED             = 0x0000000a,
    SPI_SETKEYBOARDSPEED             = 0x0000000b,
    SPI_LANGDRIVER                   = 0x0000000c,
    SPI_ICONHORIZONTALSPACING        = 0x0000000d,
    SPI_GETSCREENSAVETIMEOUT         = 0x0000000e,
    SPI_SETSCREENSAVETIMEOUT         = 0x0000000f,
    SPI_GETSCREENSAVEACTIVE          = 0x00000010,
    SPI_SETSCREENSAVEACTIVE          = 0x00000011,
    SPI_GETGRIDGRANULARITY           = 0x00000012,
    SPI_SETGRIDGRANULARITY           = 0x00000013,
    SPI_SETDESKWALLPAPER             = 0x00000014,
    SPI_SETDESKPATTERN               = 0x00000015,
    SPI_GETKEYBOARDDELAY             = 0x00000016,
    SPI_SETKEYBOARDDELAY             = 0x00000017,
    SPI_ICONVERTICALSPACING          = 0x00000018,
    SPI_GETICONTITLEWRAP             = 0x00000019,
    SPI_SETICONTITLEWRAP             = 0x0000001a,
    SPI_GETMENUDROPALIGNMENT         = 0x0000001b,
    SPI_SETMENUDROPALIGNMENT         = 0x0000001c,
    SPI_SETDOUBLECLKWIDTH            = 0x0000001d,
    SPI_SETDOUBLECLKHEIGHT           = 0x0000001e,
    SPI_GETICONTITLELOGFONT          = 0x0000001f,
    SPI_SETDOUBLECLICKTIME           = 0x00000020,
    SPI_SETMOUSEBUTTONSWAP           = 0x00000021,
    SPI_SETICONTITLELOGFONT          = 0x00000022,
    SPI_GETFASTTASKSWITCH            = 0x00000023,
    SPI_SETFASTTASKSWITCH            = 0x00000024,
    SPI_SETDRAGFULLWINDOWS           = 0x00000025,
    SPI_GETDRAGFULLWINDOWS           = 0x00000026,
    SPI_GETNONCLIENTMETRICS          = 0x00000029,
    SPI_SETNONCLIENTMETRICS          = 0x0000002a,
    SPI_GETMINIMIZEDMETRICS          = 0x0000002b,
    SPI_SETMINIMIZEDMETRICS          = 0x0000002c,
    SPI_GETICONMETRICS               = 0x0000002d,
    SPI_SETICONMETRICS               = 0x0000002e,
    SPI_SETWORKAREA                  = 0x0000002f,
    SPI_GETWORKAREA                  = 0x00000030,
    SPI_SETPENWINDOWS                = 0x00000031,
    SPI_GETHIGHCONTRAST              = 0x00000042,
    SPI_SETHIGHCONTRAST              = 0x00000043,
    SPI_GETKEYBOARDPREF              = 0x00000044,
    SPI_SETKEYBOARDPREF              = 0x00000045,
    SPI_GETSCREENREADER              = 0x00000046,
    SPI_SETSCREENREADER              = 0x00000047,
    SPI_GETANIMATION                 = 0x00000048,
    SPI_SETANIMATION                 = 0x00000049,
    SPI_GETFONTSMOOTHING             = 0x0000004a,
    SPI_SETFONTSMOOTHING             = 0x0000004b,
    SPI_SETDRAGWIDTH                 = 0x0000004c,
    SPI_SETDRAGHEIGHT                = 0x0000004d,
    SPI_SETHANDHELD                  = 0x0000004e,
    SPI_GETLOWPOWERTIMEOUT           = 0x0000004f,
    SPI_GETPOWEROFFTIMEOUT           = 0x00000050,
    SPI_SETLOWPOWERTIMEOUT           = 0x00000051,
    SPI_SETPOWEROFFTIMEOUT           = 0x00000052,
    SPI_GETLOWPOWERACTIVE            = 0x00000053,
    SPI_GETPOWEROFFACTIVE            = 0x00000054,
    SPI_SETLOWPOWERACTIVE            = 0x00000055,
    SPI_SETPOWEROFFACTIVE            = 0x00000056,
    SPI_SETCURSORS                   = 0x00000057,
    SPI_SETICONS                     = 0x00000058,
    SPI_GETDEFAULTINPUTLANG          = 0x00000059,
    SPI_SETDEFAULTINPUTLANG          = 0x0000005a,
    SPI_SETLANGTOGGLE                = 0x0000005b,
    SPI_GETWINDOWSEXTENSION          = 0x0000005c,
    SPI_SETMOUSETRAILS               = 0x0000005d,
    SPI_GETMOUSETRAILS               = 0x0000005e,
    SPI_SETSCREENSAVERRUNNING        = 0x00000061,
    SPI_SCREENSAVERRUNNING           = 0x00000061,
    SPI_GETFILTERKEYS                = 0x00000032,
    SPI_SETFILTERKEYS                = 0x00000033,
    SPI_GETTOGGLEKEYS                = 0x00000034,
    SPI_SETTOGGLEKEYS                = 0x00000035,
    SPI_GETMOUSEKEYS                 = 0x00000036,
    SPI_SETMOUSEKEYS                 = 0x00000037,
    SPI_GETSHOWSOUNDS                = 0x00000038,
    SPI_SETSHOWSOUNDS                = 0x00000039,
    SPI_GETSTICKYKEYS                = 0x0000003a,
    SPI_SETSTICKYKEYS                = 0x0000003b,
    SPI_GETACCESSTIMEOUT             = 0x0000003c,
    SPI_SETACCESSTIMEOUT             = 0x0000003d,
    SPI_GETSERIALKEYS                = 0x0000003e,
    SPI_SETSERIALKEYS                = 0x0000003f,
    SPI_GETSOUNDSENTRY               = 0x00000040,
    SPI_SETSOUNDSENTRY               = 0x00000041,
    SPI_GETSNAPTODEFBUTTON           = 0x0000005f,
    SPI_SETSNAPTODEFBUTTON           = 0x00000060,
    SPI_GETMOUSEHOVERWIDTH           = 0x00000062,
    SPI_SETMOUSEHOVERWIDTH           = 0x00000063,
    SPI_GETMOUSEHOVERHEIGHT          = 0x00000064,
    SPI_SETMOUSEHOVERHEIGHT          = 0x00000065,
    SPI_GETMOUSEHOVERTIME            = 0x00000066,
    SPI_SETMOUSEHOVERTIME            = 0x00000067,
    SPI_GETWHEELSCROLLLINES          = 0x00000068,
    SPI_SETWHEELSCROLLLINES          = 0x00000069,
    SPI_GETMENUSHOWDELAY             = 0x0000006a,
    SPI_SETMENUSHOWDELAY             = 0x0000006b,
    SPI_GETWHEELSCROLLCHARS          = 0x0000006c,
    SPI_SETWHEELSCROLLCHARS          = 0x0000006d,
    SPI_GETSHOWIMEUI                 = 0x0000006e,
    SPI_SETSHOWIMEUI                 = 0x0000006f,
    SPI_GETMOUSESPEED                = 0x00000070,
    SPI_SETMOUSESPEED                = 0x00000071,
    SPI_GETSCREENSAVERRUNNING        = 0x00000072,
    SPI_GETDESKWALLPAPER             = 0x00000073,
    SPI_GETAUDIODESCRIPTION          = 0x00000074,
    SPI_SETAUDIODESCRIPTION          = 0x00000075,
    SPI_GETSCREENSAVESECURE          = 0x00000076,
    SPI_SETSCREENSAVESECURE          = 0x00000077,
    SPI_GETHUNGAPPTIMEOUT            = 0x00000078,
    SPI_SETHUNGAPPTIMEOUT            = 0x00000079,
    SPI_GETWAITTOKILLTIMEOUT         = 0x0000007a,
    SPI_SETWAITTOKILLTIMEOUT         = 0x0000007b,
    SPI_GETWAITTOKILLSERVICETIMEOUT  = 0x0000007c,
    SPI_SETWAITTOKILLSERVICETIMEOUT  = 0x0000007d,
    SPI_GETMOUSEDOCKTHRESHOLD        = 0x0000007e,
    SPI_SETMOUSEDOCKTHRESHOLD        = 0x0000007f,
    SPI_GETPENDOCKTHRESHOLD          = 0x00000080,
    SPI_SETPENDOCKTHRESHOLD          = 0x00000081,
    SPI_GETWINARRANGING              = 0x00000082,
    SPI_SETWINARRANGING              = 0x00000083,
    SPI_GETMOUSEDRAGOUTTHRESHOLD     = 0x00000084,
    SPI_SETMOUSEDRAGOUTTHRESHOLD     = 0x00000085,
    SPI_GETPENDRAGOUTTHRESHOLD       = 0x00000086,
    SPI_SETPENDRAGOUTTHRESHOLD       = 0x00000087,
    SPI_GETMOUSESIDEMOVETHRESHOLD    = 0x00000088,
    SPI_SETMOUSESIDEMOVETHRESHOLD    = 0x00000089,
    SPI_GETPENSIDEMOVETHRESHOLD      = 0x0000008a,
    SPI_SETPENSIDEMOVETHRESHOLD      = 0x0000008b,
    SPI_GETDRAGFROMMAXIMIZE          = 0x0000008c,
    SPI_SETDRAGFROMMAXIMIZE          = 0x0000008d,
    SPI_GETSNAPSIZING                = 0x0000008e,
    SPI_SETSNAPSIZING                = 0x0000008f,
    SPI_GETDOCKMOVING                = 0x00000090,
    SPI_SETDOCKMOVING                = 0x00000091,
    SPI_GETTOUCHPREDICTIONPARAMETERS = 0x0000009c,
    SPI_SETTOUCHPREDICTIONPARAMETERS = 0x0000009d,
    SPI_GETLOGICALDPIOVERRIDE        = 0x0000009e,
    SPI_SETLOGICALDPIOVERRIDE        = 0x0000009f,
    SPI_GETMENURECT                  = 0x000000a2,
    SPI_SETMENURECT                  = 0x000000a3,
    SPI_GETACTIVEWINDOWTRACKING      = 0x00001000,
    SPI_SETACTIVEWINDOWTRACKING      = 0x00001001,
    SPI_GETMENUANIMATION             = 0x00001002,
    SPI_SETMENUANIMATION             = 0x00001003,
    SPI_GETCOMBOBOXANIMATION         = 0x00001004,
    SPI_SETCOMBOBOXANIMATION         = 0x00001005,
    SPI_GETLISTBOXSMOOTHSCROLLING    = 0x00001006,
    SPI_SETLISTBOXSMOOTHSCROLLING    = 0x00001007,
    SPI_GETGRADIENTCAPTIONS          = 0x00001008,
    SPI_SETGRADIENTCAPTIONS          = 0x00001009,
    SPI_GETKEYBOARDCUES              = 0x0000100a,
    SPI_SETKEYBOARDCUES              = 0x0000100b,
    SPI_GETMENUUNDERLINES            = 0x0000100a,
    SPI_SETMENUUNDERLINES            = 0x0000100b,
    SPI_GETACTIVEWNDTRKZORDER        = 0x0000100c,
    SPI_SETACTIVEWNDTRKZORDER        = 0x0000100d,
    SPI_GETHOTTRACKING               = 0x0000100e,
    SPI_SETHOTTRACKING               = 0x0000100f,
    SPI_GETMENUFADE                  = 0x00001012,
    SPI_SETMENUFADE                  = 0x00001013,
    SPI_GETSELECTIONFADE             = 0x00001014,
    SPI_SETSELECTIONFADE             = 0x00001015,
    SPI_GETTOOLTIPANIMATION          = 0x00001016,
    SPI_SETTOOLTIPANIMATION          = 0x00001017,
    SPI_GETTOOLTIPFADE               = 0x00001018,
    SPI_SETTOOLTIPFADE               = 0x00001019,
    SPI_GETCURSORSHADOW              = 0x0000101a,
    SPI_SETCURSORSHADOW              = 0x0000101b,
    SPI_GETMOUSESONAR                = 0x0000101c,
    SPI_SETMOUSESONAR                = 0x0000101d,
    SPI_GETMOUSECLICKLOCK            = 0x0000101e,
    SPI_SETMOUSECLICKLOCK            = 0x0000101f,
    SPI_GETMOUSEVANISH               = 0x00001020,
    SPI_SETMOUSEVANISH               = 0x00001021,
    SPI_GETFLATMENU                  = 0x00001022,
    SPI_SETFLATMENU                  = 0x00001023,
    SPI_GETDROPSHADOW                = 0x00001024,
    SPI_SETDROPSHADOW                = 0x00001025,
    SPI_GETBLOCKSENDINPUTRESETS      = 0x00001026,
    SPI_SETBLOCKSENDINPUTRESETS      = 0x00001027,
    SPI_GETUIEFFECTS                 = 0x0000103e,
    SPI_SETUIEFFECTS                 = 0x0000103f,
    SPI_GETDISABLEOVERLAPPEDCONTENT  = 0x00001040,
    SPI_SETDISABLEOVERLAPPEDCONTENT  = 0x00001041,
    SPI_GETCLIENTAREAANIMATION       = 0x00001042,
    SPI_SETCLIENTAREAANIMATION       = 0x00001043,
    SPI_GETCLEARTYPE                 = 0x00001048,
    SPI_SETCLEARTYPE                 = 0x00001049,
    SPI_GETSPEECHRECOGNITION         = 0x0000104a,
    SPI_SETSPEECHRECOGNITION         = 0x0000104b,
    SPI_GETCARETBROWSING             = 0x0000104c,
    SPI_SETCARETBROWSING             = 0x0000104d,
    SPI_GETTHREADLOCALINPUTSETTINGS  = 0x0000104e,
    SPI_SETTHREADLOCALINPUTSETTINGS  = 0x0000104f,
    SPI_GETSYSTEMLANGUAGEBAR         = 0x00001050,
    SPI_SETSYSTEMLANGUAGEBAR         = 0x00001051,
    SPI_GETFOREGROUNDLOCKTIMEOUT     = 0x00002000,
    SPI_SETFOREGROUNDLOCKTIMEOUT     = 0x00002001,
    SPI_GETACTIVEWNDTRKTIMEOUT       = 0x00002002,
    SPI_SETACTIVEWNDTRKTIMEOUT       = 0x00002003,
    SPI_GETFOREGROUNDFLASHCOUNT      = 0x00002004,
    SPI_SETFOREGROUNDFLASHCOUNT      = 0x00002005,
    SPI_GETCARETWIDTH                = 0x00002006,
    SPI_SETCARETWIDTH                = 0x00002007,
    SPI_GETMOUSECLICKLOCKTIME        = 0x00002008,
    SPI_SETMOUSECLICKLOCKTIME        = 0x00002009,
    SPI_GETFONTSMOOTHINGTYPE         = 0x0000200a,
    SPI_SETFONTSMOOTHINGTYPE         = 0x0000200b,
    SPI_GETFONTSMOOTHINGCONTRAST     = 0x0000200c,
    SPI_SETFONTSMOOTHINGCONTRAST     = 0x0000200d,
    SPI_GETFOCUSBORDERWIDTH          = 0x0000200e,
    SPI_SETFOCUSBORDERWIDTH          = 0x0000200f,
    SPI_GETFOCUSBORDERHEIGHT         = 0x00002010,
    SPI_SETFOCUSBORDERHEIGHT         = 0x00002011,
    SPI_GETFONTSMOOTHINGORIENTATION  = 0x00002012,
    SPI_SETFONTSMOOTHINGORIENTATION  = 0x00002013,
    SPI_GETMINIMUMHITRADIUS          = 0x00002014,
    SPI_SETMINIMUMHITRADIUS          = 0x00002015,
    SPI_GETMESSAGEDURATION           = 0x00002016,
    SPI_SETMESSAGEDURATION           = 0x00002017,
    SPI_GETCONTACTVISUALIZATION      = 0x00002018,
    SPI_SETCONTACTVISUALIZATION      = 0x00002019,
    SPI_GETGESTUREVISUALIZATION      = 0x0000201a,
    SPI_SETGESTUREVISUALIZATION      = 0x0000201b,
    SPI_GETMOUSEWHEELROUTING         = 0x0000201c,
    SPI_SETMOUSEWHEELROUTING         = 0x0000201d,
    SPI_GETPENVISUALIZATION          = 0x0000201e,
    SPI_SETPENVISUALIZATION          = 0x0000201f,
    SPI_GETPENARBITRATIONTYPE        = 0x00002020,
    SPI_SETPENARBITRATIONTYPE        = 0x00002021,
    SPI_GETCARETTIMEOUT              = 0x00002022,
    SPI_SETCARETTIMEOUT              = 0x00002023,
    SPI_GETHANDEDNESS                = 0x00002024,
    SPI_SETHANDEDNESS                = 0x00002025,
}

alias TRACK_POPUP_MENU_FLAGS = uint;
enum : uint
{
    TPM_LEFTBUTTON      = 0x00000000,
    TPM_RIGHTBUTTON     = 0x00000002,
    TPM_LEFTALIGN       = 0x00000000,
    TPM_CENTERALIGN     = 0x00000004,
    TPM_RIGHTALIGN      = 0x00000008,
    TPM_TOPALIGN        = 0x00000000,
    TPM_VCENTERALIGN    = 0x00000010,
    TPM_BOTTOMALIGN     = 0x00000020,
    TPM_HORIZONTAL      = 0x00000000,
    TPM_VERTICAL        = 0x00000040,
    TPM_NONOTIFY        = 0x00000080,
    TPM_RETURNCMD       = 0x00000100,
    TPM_RECURSE         = 0x00000001,
    TPM_HORPOSANIMATION = 0x00000400,
    TPM_HORNEGANIMATION = 0x00000800,
    TPM_VERPOSANIMATION = 0x00001000,
    TPM_VERNEGANIMATION = 0x00002000,
    TPM_NOANIMATION     = 0x00004000,
    TPM_LAYOUTRTL       = 0x00008000,
    TPM_WORKAREA        = 0x00010000,
}

alias WINDOW_EX_STYLE = uint;
enum : uint
{
    WS_EX_DLGMODALFRAME       = 0x00000001,
    WS_EX_NOPARENTNOTIFY      = 0x00000004,
    WS_EX_TOPMOST             = 0x00000008,
    WS_EX_ACCEPTFILES         = 0x00000010,
    WS_EX_TRANSPARENT         = 0x00000020,
    WS_EX_MDICHILD            = 0x00000040,
    WS_EX_TOOLWINDOW          = 0x00000080,
    WS_EX_WINDOWEDGE          = 0x00000100,
    WS_EX_CLIENTEDGE          = 0x00000200,
    WS_EX_CONTEXTHELP         = 0x00000400,
    WS_EX_RIGHT               = 0x00001000,
    WS_EX_LEFT                = 0x00000000,
    WS_EX_RTLREADING          = 0x00002000,
    WS_EX_LTRREADING          = 0x00000000,
    WS_EX_LEFTSCROLLBAR       = 0x00004000,
    WS_EX_RIGHTSCROLLBAR      = 0x00000000,
    WS_EX_CONTROLPARENT       = 0x00010000,
    WS_EX_STATICEDGE          = 0x00020000,
    WS_EX_APPWINDOW           = 0x00040000,
    WS_EX_OVERLAPPEDWINDOW    = 0x00000300,
    WS_EX_PALETTEWINDOW       = 0x00000188,
    WS_EX_LAYERED             = 0x00080000,
    WS_EX_NOINHERITLAYOUT     = 0x00100000,
    WS_EX_NOREDIRECTIONBITMAP = 0x00200000,
    WS_EX_LAYOUTRTL           = 0x00400000,
    WS_EX_COMPOSITED          = 0x02000000,
    WS_EX_NOACTIVATE          = 0x08000000,
}

alias WINDOW_STYLE = uint;
enum : uint
{
    WS_OVERLAPPED       = 0x00000000,
    WS_POPUP            = 0x80000000,
    WS_CHILD            = 0x40000000,
    WS_MINIMIZE         = 0x20000000,
    WS_VISIBLE          = 0x10000000,
    WS_DISABLED         = 0x08000000,
    WS_CLIPSIBLINGS     = 0x04000000,
    WS_CLIPCHILDREN     = 0x02000000,
    WS_MAXIMIZE         = 0x01000000,
    WS_CAPTION          = 0x00c00000,
    WS_BORDER           = 0x00800000,
    WS_DLGFRAME         = 0x00400000,
    WS_VSCROLL          = 0x00200000,
    WS_HSCROLL          = 0x00100000,
    WS_SYSMENU          = 0x00080000,
    WS_THICKFRAME       = 0x00040000,
    WS_GROUP            = 0x00020000,
    WS_TABSTOP          = 0x00010000,
    WS_MINIMIZEBOX      = 0x00020000,
    WS_MAXIMIZEBOX      = 0x00010000,
    WS_TILED            = 0x00000000,
    WS_ICONIC           = 0x20000000,
    WS_SIZEBOX          = 0x00040000,
    WS_TILEDWINDOW      = 0x00cf0000,
    WS_OVERLAPPEDWINDOW = 0x00cf0000,
    WS_POPUPWINDOW      = 0x80880000,
    WS_CHILDWINDOW      = 0x40000000,
    WS_ACTIVECAPTION    = 0x00000001,
}

alias OBJECT_IDENTIFIER = int;
enum : int
{
    OBJID_WINDOW            = 0x00000000,
    OBJID_SYSMENU           = 0xffffffff,
    OBJID_TITLEBAR          = 0xfffffffe,
    OBJID_MENU              = 0xfffffffd,
    OBJID_CLIENT            = 0xfffffffc,
    OBJID_VSCROLL           = 0xfffffffb,
    OBJID_HSCROLL           = 0xfffffffa,
    OBJID_SIZEGRIP          = 0xfffffff9,
    OBJID_CARET             = 0xfffffff8,
    OBJID_CURSOR            = 0xfffffff7,
    OBJID_ALERT             = 0xfffffff6,
    OBJID_SOUND             = 0xfffffff5,
    OBJID_QUERYCLASSNAMEIDX = 0xfffffff4,
    OBJID_NATIVEOM          = 0xfffffff0,
}

alias MENU_ITEM_TYPE = uint;
enum : uint
{
    MFT_BITMAP       = 0x00000004,
    MFT_MENUBARBREAK = 0x00000020,
    MFT_MENUBREAK    = 0x00000040,
    MFT_OWNERDRAW    = 0x00000100,
    MFT_RADIOCHECK   = 0x00000200,
    MFT_RIGHTJUSTIFY = 0x00004000,
    MFT_RIGHTORDER   = 0x00002000,
    MFT_SEPARATOR    = 0x00000800,
    MFT_STRING       = 0x00000000,
}

alias MESSAGEBOX_RESULT = int;
enum : int
{
    IDOK       = 0x00000001,
    IDCANCEL   = 0x00000002,
    IDABORT    = 0x00000003,
    IDRETRY    = 0x00000004,
    IDIGNORE   = 0x00000005,
    IDYES      = 0x00000006,
    IDNO       = 0x00000007,
    IDCLOSE    = 0x00000008,
    IDHELP     = 0x00000009,
    IDTRYAGAIN = 0x0000000a,
    IDCONTINUE = 0x0000000b,
    IDASYNC    = 0x00007d01,
    IDTIMEOUT  = 0x00007d00,
}

alias MENU_ITEM_STATE = uint;
enum : uint
{
    MFS_GRAYED    = 0x00000003,
    MFS_DISABLED  = 0x00000003,
    MFS_CHECKED   = 0x00000008,
    MFS_HILITE    = 0x00000080,
    MFS_ENABLED   = 0x00000000,
    MFS_UNCHECKED = 0x00000000,
    MFS_UNHILITE  = 0x00000000,
    MFS_DEFAULT   = 0x00001000,
}

alias SCROLLBAR_CONSTANTS = uint;
enum : uint
{
    SB_CTL  = 0x00000002,
    SB_HORZ = 0x00000000,
    SB_VERT = 0x00000001,
    SB_BOTH = 0x00000003,
}

alias GET_CLASS_LONG_INDEX = int;
enum : int
{
    GCW_ATOM           = 0xffffffe0,
    GCL_CBCLSEXTRA     = 0xffffffec,
    GCL_CBWNDEXTRA     = 0xffffffee,
    GCL_HBRBACKGROUND  = 0xfffffff6,
    GCL_HCURSOR        = 0xfffffff4,
    GCL_HICON          = 0xfffffff2,
    GCL_HICONSM        = 0xffffffde,
    GCL_HMODULE        = 0xfffffff0,
    GCL_MENUNAME       = 0xfffffff8,
    GCL_STYLE          = 0xffffffe6,
    GCL_WNDPROC        = 0xffffffe8,
    GCLP_HBRBACKGROUND = 0xfffffff6,
    GCLP_HCURSOR       = 0xfffffff4,
    GCLP_HICON         = 0xfffffff2,
    GCLP_HICONSM       = 0xffffffde,
    GCLP_HMODULE       = 0xfffffff0,
    GCLP_MENUNAME      = 0xfffffff8,
    GCLP_WNDPROC       = 0xffffffe8,
}

alias UPDATE_LAYERED_WINDOW_FLAGS = uint;
enum : uint
{
    ULW_ALPHA       = 0x00000002,
    ULW_COLORKEY    = 0x00000001,
    ULW_OPAQUE      = 0x00000004,
    ULW_EX_NORESIZE = 0x00000008,
}

alias WINDOW_LONG_PTR_INDEX = int;
enum : int
{
    GWL_EXSTYLE     = 0xffffffec,
    GWLP_HINSTANCE  = 0xfffffffa,
    GWLP_HWNDPARENT = 0xfffffff8,
    GWLP_ID         = 0xfffffff4,
    GWL_STYLE       = 0xfffffff0,
    GWLP_USERDATA   = 0xffffffeb,
    GWLP_WNDPROC    = 0xfffffffc,
    GWL_HINSTANCE   = 0xfffffffa,
    GWL_ID          = 0xfffffff4,
    GWL_USERDATA    = 0xffffffeb,
    GWL_WNDPROC     = 0xfffffffc,
    GWL_HWNDPARENT  = 0xfffffff8,
}

alias ANIMATE_WINDOW_FLAGS = uint;
enum : uint
{
    AW_ACTIVATE     = 0x00020000,
    AW_BLEND        = 0x00080000,
    AW_CENTER       = 0x00000010,
    AW_HIDE         = 0x00010000,
    AW_HOR_POSITIVE = 0x00000001,
    AW_HOR_NEGATIVE = 0x00000002,
    AW_SLIDE        = 0x00040000,
    AW_VER_POSITIVE = 0x00000004,
    AW_VER_NEGATIVE = 0x00000008,
}

alias CHANGE_WINDOW_MESSAGE_FILTER_FLAGS = uint;
enum : uint
{
    MSGFLT_ADD    = 0x00000001,
    MSGFLT_REMOVE = 0x00000002,
}

alias GDI_IMAGE_TYPE = uint;
enum : uint
{
    IMAGE_BITMAP = 0x00000000,
    IMAGE_CURSOR = 0x00000002,
    IMAGE_ICON   = 0x00000001,
}

alias WINDOWS_HOOK_ID = int;
enum : int
{
    WH_CALLWNDPROC     = 0x00000004,
    WH_CALLWNDPROCRET  = 0x0000000c,
    WH_CBT             = 0x00000005,
    WH_DEBUG           = 0x00000009,
    WH_FOREGROUNDIDLE  = 0x0000000b,
    WH_GETMESSAGE      = 0x00000003,
    WH_JOURNALPLAYBACK = 0x00000001,
    WH_JOURNALRECORD   = 0x00000000,
    WH_KEYBOARD        = 0x00000002,
    WH_KEYBOARD_LL     = 0x0000000d,
    WH_MOUSE           = 0x00000007,
    WH_MOUSE_LL        = 0x0000000e,
    WH_MSGFILTER       = 0xffffffff,
    WH_SHELL           = 0x0000000a,
    WH_SYSMSGFILTER    = 0x00000006,
}

alias IMAGE_FLAGS = uint;
enum : uint
{
    LR_CREATEDIBSECTION = 0x00002000,
    LR_DEFAULTCOLOR     = 0x00000000,
    LR_DEFAULTSIZE      = 0x00000040,
    LR_LOADFROMFILE     = 0x00000010,
    LR_LOADMAP3DCOLORS  = 0x00001000,
    LR_LOADTRANSPARENT  = 0x00000020,
    LR_MONOCHROME       = 0x00000001,
    LR_SHARED           = 0x00008000,
    LR_VGACOLOR         = 0x00000080,
    LR_COPYDELETEORG    = 0x00000008,
    LR_COPYFROMRESOURCE = 0x00004000,
    LR_COPYRETURNORG    = 0x00000004,
}

alias SYSTEM_PARAMETERS_INFO_UPDATE_FLAGS = uint;
enum : uint
{
    SPIF_UPDATEINIFILE    = 0x00000001,
    SPIF_SENDCHANGE       = 0x00000002,
    SPIF_SENDWININICHANGE = 0x00000002,
}

alias SET_WINDOW_POS_FLAGS = uint;
enum : uint
{
    SWP_ASYNCWINDOWPOS = 0x00004000,
    SWP_DEFERERASE     = 0x00002000,
    SWP_DRAWFRAME      = 0x00000020,
    SWP_FRAMECHANGED   = 0x00000020,
    SWP_HIDEWINDOW     = 0x00000080,
    SWP_NOACTIVATE     = 0x00000010,
    SWP_NOCOPYBITS     = 0x00000100,
    SWP_NOMOVE         = 0x00000002,
    SWP_NOOWNERZORDER  = 0x00000200,
    SWP_NOREDRAW       = 0x00000008,
    SWP_NOREPOSITION   = 0x00000200,
    SWP_NOSENDCHANGING = 0x00000400,
    SWP_NOSIZE         = 0x00000001,
    SWP_NOZORDER       = 0x00000004,
    SWP_SHOWWINDOW     = 0x00000040,
    SWP__NOOWNERZORDER = 0x00000200,
}

alias MSG_WAIT_FOR_MULTIPLE_OBJECTS_EX_FLAGS = uint;
enum : uint
{
    MWMO_NONE           = 0x00000000,
    MWMO_ALERTABLE      = 0x00000002,
    MWMO_INPUTAVAILABLE = 0x00000004,
    MWMO_WAITALL        = 0x00000001,
}

alias QUEUE_STATUS_FLAGS = uint;
enum : uint
{
    QS_ALLEVENTS      = 0x000004bf,
    QS_ALLINPUT       = 0x000004ff,
    QS_ALLPOSTMESSAGE = 0x00000100,
    QS_HOTKEY         = 0x00000080,
    QS_INPUT          = 0x00000407,
    QS_KEY            = 0x00000001,
    QS_MOUSE          = 0x00000006,
    QS_MOUSEBUTTON    = 0x00000004,
    QS_MOUSEMOVE      = 0x00000002,
    QS_PAINT          = 0x00000020,
    QS_POSTMESSAGE    = 0x00000008,
    QS_RAWINPUT       = 0x00000400,
    QS_SENDMESSAGE    = 0x00000040,
    QS_TIMER          = 0x00000010,
}

alias SYSTEM_CURSOR_ID = uint;
enum : uint
{
    OCR_APPSTARTING = 0x00007f8a,
    OCR_NORMAL      = 0x00007f00,
    OCR_CROSS       = 0x00007f03,
    OCR_HAND        = 0x00007f89,
    OCR_HELP        = 0x00007f8b,
    OCR_IBEAM       = 0x00007f01,
    OCR_NO          = 0x00007f88,
    OCR_SIZEALL     = 0x00007f86,
    OCR_SIZENESW    = 0x00007f83,
    OCR_SIZENS      = 0x00007f85,
    OCR_SIZENWSE    = 0x00007f82,
    OCR_SIZEWE      = 0x00007f84,
    OCR_UP          = 0x00007f04,
    OCR_WAIT        = 0x00007f02,
}

alias LAYERED_WINDOW_ATTRIBUTES_FLAGS = uint;
enum : uint
{
    LWA_ALPHA    = 0x00000002,
    LWA_COLORKEY = 0x00000001,
}

alias SEND_MESSAGE_TIMEOUT_FLAGS = uint;
enum : uint
{
    SMTO_ABORTIFHUNG        = 0x00000002,
    SMTO_BLOCK              = 0x00000001,
    SMTO_NORMAL             = 0x00000000,
    SMTO_NOTIMEOUTIFNOTHUNG = 0x00000008,
    SMTO_ERRORONEXIT        = 0x00000020,
}

alias PEEK_MESSAGE_REMOVE_TYPE = uint;
enum : uint
{
    PM_NOREMOVE       = 0x00000000,
    PM_REMOVE         = 0x00000001,
    PM_NOYIELD        = 0x00000002,
    PM_QS_INPUT       = 0x04070000,
    PM_QS_POSTMESSAGE = 0x00980000,
    PM_QS_PAINT       = 0x00200000,
    PM_QS_SENDMESSAGE = 0x00400000,
}

alias SYS_COLOR_INDEX = uint;
enum : uint
{
    COLOR_3DDKSHADOW              = 0x00000015,
    COLOR_3DFACE                  = 0x0000000f,
    COLOR_3DHIGHLIGHT             = 0x00000014,
    COLOR_3DHILIGHT               = 0x00000014,
    COLOR_3DLIGHT                 = 0x00000016,
    COLOR_3DSHADOW                = 0x00000010,
    COLOR_ACTIVEBORDER            = 0x0000000a,
    COLOR_ACTIVECAPTION           = 0x00000002,
    COLOR_APPWORKSPACE            = 0x0000000c,
    COLOR_BACKGROUND              = 0x00000001,
    COLOR_BTNFACE                 = 0x0000000f,
    COLOR_BTNHIGHLIGHT            = 0x00000014,
    COLOR_BTNHILIGHT              = 0x00000014,
    COLOR_BTNSHADOW               = 0x00000010,
    COLOR_BTNTEXT                 = 0x00000012,
    COLOR_CAPTIONTEXT             = 0x00000009,
    COLOR_DESKTOP                 = 0x00000001,
    COLOR_GRADIENTACTIVECAPTION   = 0x0000001b,
    COLOR_GRADIENTINACTIVECAPTION = 0x0000001c,
    COLOR_GRAYTEXT                = 0x00000011,
    COLOR_HIGHLIGHT               = 0x0000000d,
    COLOR_HIGHLIGHTTEXT           = 0x0000000e,
    COLOR_HOTLIGHT                = 0x0000001a,
    COLOR_INACTIVEBORDER          = 0x0000000b,
    COLOR_INACTIVECAPTION         = 0x00000003,
    COLOR_INACTIVECAPTIONTEXT     = 0x00000013,
    COLOR_INFOBK                  = 0x00000018,
    COLOR_INFOTEXT                = 0x00000017,
    COLOR_MENU                    = 0x00000004,
    COLOR_MENUHILIGHT             = 0x0000001d,
    COLOR_MENUBAR                 = 0x0000001e,
    COLOR_MENUTEXT                = 0x00000007,
    COLOR_SCROLLBAR               = 0x00000000,
    COLOR_WINDOW                  = 0x00000005,
    COLOR_WINDOWFRAME             = 0x00000006,
    COLOR_WINDOWTEXT              = 0x00000008,
}

alias GET_WINDOW_CMD = uint;
enum : uint
{
    GW_CHILD        = 0x00000005,
    GW_ENABLEDPOPUP = 0x00000006,
    GW_HWNDFIRST    = 0x00000000,
    GW_HWNDLAST     = 0x00000001,
    GW_HWNDNEXT     = 0x00000002,
    GW_HWNDPREV     = 0x00000003,
    GW_OWNER        = 0x00000004,
}

alias SYSTEM_METRICS_INDEX = uint;
enum : uint
{
    SM_ARRANGE                     = 0x00000038,
    SM_CLEANBOOT                   = 0x00000043,
    SM_CMONITORS                   = 0x00000050,
    SM_CMOUSEBUTTONS               = 0x0000002b,
    SM_CONVERTIBLESLATEMODE        = 0x00002003,
    SM_CXBORDER                    = 0x00000005,
    SM_CXCURSOR                    = 0x0000000d,
    SM_CXDLGFRAME                  = 0x00000007,
    SM_CXDOUBLECLK                 = 0x00000024,
    SM_CXDRAG                      = 0x00000044,
    SM_CXEDGE                      = 0x0000002d,
    SM_CXFIXEDFRAME                = 0x00000007,
    SM_CXFOCUSBORDER               = 0x00000053,
    SM_CXFRAME                     = 0x00000020,
    SM_CXFULLSCREEN                = 0x00000010,
    SM_CXHSCROLL                   = 0x00000015,
    SM_CXHTHUMB                    = 0x0000000a,
    SM_CXICON                      = 0x0000000b,
    SM_CXICONSPACING               = 0x00000026,
    SM_CXMAXIMIZED                 = 0x0000003d,
    SM_CXMAXTRACK                  = 0x0000003b,
    SM_CXMENUCHECK                 = 0x00000047,
    SM_CXMENUSIZE                  = 0x00000036,
    SM_CXMIN                       = 0x0000001c,
    SM_CXMINIMIZED                 = 0x00000039,
    SM_CXMINSPACING                = 0x0000002f,
    SM_CXMINTRACK                  = 0x00000022,
    SM_CXPADDEDBORDER              = 0x0000005c,
    SM_CXSCREEN                    = 0x00000000,
    SM_CXSIZE                      = 0x0000001e,
    SM_CXSIZEFRAME                 = 0x00000020,
    SM_CXSMICON                    = 0x00000031,
    SM_CXSMSIZE                    = 0x00000034,
    SM_CXVIRTUALSCREEN             = 0x0000004e,
    SM_CXVSCROLL                   = 0x00000002,
    SM_CYBORDER                    = 0x00000006,
    SM_CYCAPTION                   = 0x00000004,
    SM_CYCURSOR                    = 0x0000000e,
    SM_CYDLGFRAME                  = 0x00000008,
    SM_CYDOUBLECLK                 = 0x00000025,
    SM_CYDRAG                      = 0x00000045,
    SM_CYEDGE                      = 0x0000002e,
    SM_CYFIXEDFRAME                = 0x00000008,
    SM_CYFOCUSBORDER               = 0x00000054,
    SM_CYFRAME                     = 0x00000021,
    SM_CYFULLSCREEN                = 0x00000011,
    SM_CYHSCROLL                   = 0x00000003,
    SM_CYICON                      = 0x0000000c,
    SM_CYICONSPACING               = 0x00000027,
    SM_CYKANJIWINDOW               = 0x00000012,
    SM_CYMAXIMIZED                 = 0x0000003e,
    SM_CYMAXTRACK                  = 0x0000003c,
    SM_CYMENU                      = 0x0000000f,
    SM_CYMENUCHECK                 = 0x00000048,
    SM_CYMENUSIZE                  = 0x00000037,
    SM_CYMIN                       = 0x0000001d,
    SM_CYMINIMIZED                 = 0x0000003a,
    SM_CYMINSPACING                = 0x00000030,
    SM_CYMINTRACK                  = 0x00000023,
    SM_CYSCREEN                    = 0x00000001,
    SM_CYSIZE                      = 0x0000001f,
    SM_CYSIZEFRAME                 = 0x00000021,
    SM_CYSMCAPTION                 = 0x00000033,
    SM_CYSMICON                    = 0x00000032,
    SM_CYSMSIZE                    = 0x00000035,
    SM_CYVIRTUALSCREEN             = 0x0000004f,
    SM_CYVSCROLL                   = 0x00000014,
    SM_CYVTHUMB                    = 0x00000009,
    SM_DBCSENABLED                 = 0x0000002a,
    SM_DEBUG                       = 0x00000016,
    SM_DIGITIZER                   = 0x0000005e,
    SM_IMMENABLED                  = 0x00000052,
    SM_MAXIMUMTOUCHES              = 0x0000005f,
    SM_MEDIACENTER                 = 0x00000057,
    SM_MENUDROPALIGNMENT           = 0x00000028,
    SM_MIDEASTENABLED              = 0x0000004a,
    SM_MOUSEPRESENT                = 0x00000013,
    SM_MOUSEHORIZONTALWHEELPRESENT = 0x0000005b,
    SM_MOUSEWHEELPRESENT           = 0x0000004b,
    SM_NETWORK                     = 0x0000003f,
    SM_PENWINDOWS                  = 0x00000029,
    SM_REMOTECONTROL               = 0x00002001,
    SM_REMOTESESSION               = 0x00001000,
    SM_SAMEDISPLAYFORMAT           = 0x00000051,
    SM_SECURE                      = 0x0000002c,
    SM_SERVERR2                    = 0x00000059,
    SM_SHOWSOUNDS                  = 0x00000046,
    SM_SHUTTINGDOWN                = 0x00002000,
    SM_SLOWMACHINE                 = 0x00000049,
    SM_STARTER                     = 0x00000058,
    SM_SWAPBUTTON                  = 0x00000017,
    SM_SYSTEMDOCKED                = 0x00002004,
    SM_TABLETPC                    = 0x00000056,
    SM_XVIRTUALSCREEN              = 0x0000004c,
    SM_YVIRTUALSCREEN              = 0x0000004d,
}

alias GET_ANCESTOR_FLAGS = uint;
enum : uint
{
    GA_PARENT    = 0x00000001,
    GA_ROOT      = 0x00000002,
    GA_ROOTOWNER = 0x00000003,
}

alias TILE_WINDOWS_HOW = uint;
enum : uint
{
    MDITILE_HORIZONTAL = 0x00000001,
    MDITILE_VERTICAL   = 0x00000000,
}

alias WINDOW_DISPLAY_AFFINITY = uint;
enum : uint
{
    WDA_NONE               = 0x00000000,
    WDA_MONITOR            = 0x00000001,
    WDA_EXCLUDEFROMCAPTURE = 0x00000011,
}

alias FOREGROUND_WINDOW_LOCK_CODE = uint;
enum : uint
{
    LSFW_LOCK   = 0x00000001,
    LSFW_UNLOCK = 0x00000002,
}

alias CASCADE_WINDOWS_HOW = uint;
enum : uint
{
    MDITILE_SKIPDISABLED = 0x00000002,
    MDITILE_ZORDER       = 0x00000004,
}

alias WINDOW_MESSAGE_FILTER_ACTION = uint;
enum : uint
{
    MSGFLT_ALLOW    = 0x00000001,
    MSGFLT_DISALLOW = 0x00000002,
    MSGFLT_RESET    = 0x00000000,
}

alias GET_MENU_DEFAULT_ITEM_FLAGS = uint;
enum : uint
{
    GMDI_GOINTOPOPUPS = 0x00000002,
    GMDI_USEDISABLED  = 0x00000001,
}

alias MSGFLTINFO_STATUS = uint;
enum : uint
{
    MSGFLTINFO_NONE                     = 0x00000000,
    MSGFLTINFO_ALLOWED_HIGHER           = 0x00000003,
    MSGFLTINFO_ALREADYALLOWED_FORWND    = 0x00000001,
    MSGFLTINFO_ALREADYDISALLOWED_FORWND = 0x00000002,
}

alias MOUSEHOOKSTRUCTEX_MOUSE_DATA = uint;
enum : uint
{
    XBUTTON1 = 0x00000001,
    XBUTTON2 = 0x00000002,
}

alias MENU_ITEM_MASK = uint;
enum : uint
{
    MIIM_BITMAP     = 0x00000080,
    MIIM_CHECKMARKS = 0x00000008,
    MIIM_DATA       = 0x00000020,
    MIIM_FTYPE      = 0x00000100,
    MIIM_ID         = 0x00000002,
    MIIM_STATE      = 0x00000001,
    MIIM_STRING     = 0x00000040,
    MIIM_SUBMENU    = 0x00000004,
    MIIM_TYPE       = 0x00000010,
}

alias FLASHWINFO_FLAGS = uint;
enum : uint
{
    FLASHW_ALL       = 0x00000003,
    FLASHW_CAPTION   = 0x00000001,
    FLASHW_STOP      = 0x00000000,
    FLASHW_TIMER     = 0x00000004,
    FLASHW_TIMERNOFG = 0x0000000c,
    FLASHW_TRAY      = 0x00000002,
}

alias CURSORINFO_FLAGS = uint;
enum : uint
{
    CURSOR_SHOWING    = 0x00000001,
    CURSOR_SUPPRESSED = 0x00000002,
}

alias MENUINFO_STYLE = uint;
enum : uint
{
    MNS_AUTODISMISS = 0x10000000,
    MNS_CHECKORBMP  = 0x04000000,
    MNS_DRAGDROP    = 0x20000000,
    MNS_MODELESS    = 0x40000000,
    MNS_NOCHECK     = 0x80000000,
    MNS_NOTIFYBYPOS = 0x08000000,
}

alias WINDOWPLACEMENT_FLAGS = uint;
enum : uint
{
    WPF_ASYNCWINDOWPLACEMENT = 0x00000004,
    WPF_RESTORETOMAXIMIZED   = 0x00000002,
    WPF_SETMINPOSITION       = 0x00000001,
}

alias MENUINFO_MASK = uint;
enum : uint
{
    MIM_APPLYTOSUBMENUS = 0x80000000,
    MIM_BACKGROUND      = 0x00000002,
    MIM_HELPID          = 0x00000004,
    MIM_MAXHEIGHT       = 0x00000001,
    MIM_MENUDATA        = 0x00000008,
    MIM_STYLE           = 0x00000010,
}

alias MINIMIZEDMETRICS_ARRANGE = int;
enum : int
{
    ARW_BOTTOMLEFT  = 0x00000000,
    ARW_BOTTOMRIGHT = 0x00000001,
    ARW_TOPLEFT     = 0x00000002,
    ARW_TOPRIGHT    = 0x00000003,
}

alias SCROLLINFO_MASK = uint;
enum : uint
{
    SIF_ALL             = 0x00000017,
    SIF_DISABLENOSCROLL = 0x00000008,
    SIF_PAGE            = 0x00000002,
    SIF_POS             = 0x00000004,
    SIF_RANGE           = 0x00000001,
    SIF_TRACKPOS        = 0x00000010,
}

alias MENUGETOBJECTINFO_FLAGS = uint;
enum : uint
{
    MNGOF_BOTTOMGAP = 0x00000002,
    MNGOF_TOPGAP    = 0x00000001,
}

alias GUITHREADINFO_FLAGS = uint;
enum : uint
{
    GUI_CARETBLINKING  = 0x00000001,
    GUI_INMENUMODE     = 0x00000004,
    GUI_INMOVESIZE     = 0x00000002,
    GUI_POPUPMENUMODE  = 0x00000010,
    GUI_SYSTEMMENUMODE = 0x00000008,
}

alias KBDLLHOOKSTRUCT_FLAGS = uint;
enum : uint
{
    LLKHF_EXTENDED          = 0x00000001,
    LLKHF_ALTDOWN           = 0x00000020,
    LLKHF_UP                = 0x00000080,
    LLKHF_INJECTED          = 0x00000010,
    LLKHF_LOWER_IL_INJECTED = 0x00000002,
}

int LoadStringA(HINSTANCE, uint, PSTR, int);
int LoadStringW(HINSTANCE, uint, PWSTR, int);
int wvsprintfA(PSTR, const(char)*, byte*);
int wvsprintfW(PWSTR, const(wchar)*, byte*);
int wsprintfA(PSTR, const(char)*);
int wsprintfW(PWSTR, const(wchar)*);
BOOL IsHungAppWindow(HWND);
void DisableProcessWindowsGhosting();
uint RegisterWindowMessageA(const(char)*);
uint RegisterWindowMessageW(const(wchar)*);
BOOL GetMessageA(MSG*, HWND, uint, uint);
BOOL GetMessageW(MSG*, HWND, uint, uint);
BOOL TranslateMessage(const(MSG)*);
LRESULT DispatchMessageA(const(MSG)*);
LRESULT DispatchMessageW(const(MSG)*);
BOOL SetMessageQueue(int);
BOOL PeekMessageA(MSG*, HWND, uint, uint, PEEK_MESSAGE_REMOVE_TYPE);
BOOL PeekMessageW(MSG*, HWND, uint, uint, PEEK_MESSAGE_REMOVE_TYPE);
uint GetMessagePos();
int GetMessageTime();
LPARAM GetMessageExtraInfo();
BOOL IsWow64Message();
LPARAM SetMessageExtraInfo(LPARAM);
LRESULT SendMessageA(HWND, uint, WPARAM, LPARAM);
LRESULT SendMessageW(HWND, uint, WPARAM, LPARAM);
LRESULT SendMessageTimeoutA(HWND, uint, WPARAM, LPARAM, SEND_MESSAGE_TIMEOUT_FLAGS, uint, ulong*);
LRESULT SendMessageTimeoutW(HWND, uint, WPARAM, LPARAM, SEND_MESSAGE_TIMEOUT_FLAGS, uint, ulong*);
BOOL SendNotifyMessageA(HWND, uint, WPARAM, LPARAM);
BOOL SendNotifyMessageW(HWND, uint, WPARAM, LPARAM);
BOOL SendMessageCallbackA(HWND, uint, WPARAM, LPARAM, SENDASYNCPROC, ulong);
BOOL SendMessageCallbackW(HWND, uint, WPARAM, LPARAM, SENDASYNCPROC, ulong);
void* RegisterDeviceNotificationA(HANDLE, void*, POWER_SETTING_REGISTER_NOTIFICATION_FLAGS);
void* RegisterDeviceNotificationW(HANDLE, void*, POWER_SETTING_REGISTER_NOTIFICATION_FLAGS);
BOOL PostMessageA(HWND, uint, WPARAM, LPARAM);
BOOL PostMessageW(HWND, uint, WPARAM, LPARAM);
BOOL PostThreadMessageA(uint, uint, WPARAM, LPARAM);
BOOL PostThreadMessageW(uint, uint, WPARAM, LPARAM);
BOOL ReplyMessage(LRESULT);
BOOL WaitMessage();
LRESULT DefWindowProcA(HWND, uint, WPARAM, LPARAM);
LRESULT DefWindowProcW(HWND, uint, WPARAM, LPARAM);
void PostQuitMessage(int);
LRESULT CallWindowProcA(WNDPROC, HWND, uint, WPARAM, LPARAM);
LRESULT CallWindowProcW(WNDPROC, HWND, uint, WPARAM, LPARAM);
BOOL InSendMessage();
uint InSendMessageEx(void*);
ushort RegisterClassA(const(WNDCLASSA)*);
ushort RegisterClassW(const(WNDCLASSW)*);
BOOL UnregisterClassA(const(char)*, HINSTANCE);
BOOL UnregisterClassW(const(wchar)*, HINSTANCE);
BOOL GetClassInfoA(HINSTANCE, const(char)*, WNDCLASSA*);
BOOL GetClassInfoW(HINSTANCE, const(wchar)*, WNDCLASSW*);
ushort RegisterClassExA(const(WNDCLASSEXA)*);
ushort RegisterClassExW(const(WNDCLASSEXW)*);
BOOL GetClassInfoExA(HINSTANCE, const(char)*, WNDCLASSEXA*);
BOOL GetClassInfoExW(HINSTANCE, const(wchar)*, WNDCLASSEXW*);
HWND CreateWindowExA(WINDOW_EX_STYLE, const(char)*, const(char)*, WINDOW_STYLE, int, int, int, int, HWND, HMENU, HINSTANCE, void*);
HWND CreateWindowExW(WINDOW_EX_STYLE, const(wchar)*, const(wchar)*, WINDOW_STYLE, int, int, int, int, HWND, HMENU, HINSTANCE, void*);
BOOL IsWindow(HWND);
BOOL IsMenu(HMENU);
BOOL IsChild(HWND, HWND);
BOOL DestroyWindow(HWND);
BOOL ShowWindow(HWND, SHOW_WINDOW_CMD);
BOOL AnimateWindow(HWND, uint, ANIMATE_WINDOW_FLAGS);
BOOL UpdateLayeredWindow(HWND, HDC, POINT*, SIZE*, HDC, POINT*, uint, BLENDFUNCTION*, UPDATE_LAYERED_WINDOW_FLAGS);
BOOL UpdateLayeredWindowIndirect(HWND, const(UPDATELAYEREDWINDOWINFO)*);
BOOL GetLayeredWindowAttributes(HWND, uint*, ubyte*, LAYERED_WINDOW_ATTRIBUTES_FLAGS*);
BOOL SetLayeredWindowAttributes(HWND, uint, ubyte, LAYERED_WINDOW_ATTRIBUTES_FLAGS);
BOOL ShowWindowAsync(HWND, SHOW_WINDOW_CMD);
BOOL FlashWindow(HWND, BOOL);
BOOL FlashWindowEx(FLASHWINFO*);
BOOL ShowOwnedPopups(HWND, BOOL);
BOOL OpenIcon(HWND);
BOOL CloseWindow(HWND);
BOOL MoveWindow(HWND, int, int, int, int, BOOL);
BOOL SetWindowPos(HWND, HWND, int, int, int, int, SET_WINDOW_POS_FLAGS);
BOOL GetWindowPlacement(HWND, WINDOWPLACEMENT*);
BOOL SetWindowPlacement(HWND, const(WINDOWPLACEMENT)*);
BOOL GetWindowDisplayAffinity(HWND, uint*);
BOOL SetWindowDisplayAffinity(HWND, WINDOW_DISPLAY_AFFINITY);
long BeginDeferWindowPos(int);
long DeferWindowPos(long, HWND, HWND, int, int, int, int, SET_WINDOW_POS_FLAGS);
BOOL EndDeferWindowPos(long);
BOOL IsWindowVisible(HWND);
BOOL IsIconic(HWND);
BOOL AnyPopup();
BOOL BringWindowToTop(HWND);
BOOL IsZoomed(HWND);
HWND CreateDialogParamA(HINSTANCE, const(char)*, HWND, DLGPROC, LPARAM);
HWND CreateDialogParamW(HINSTANCE, const(wchar)*, HWND, DLGPROC, LPARAM);
HWND CreateDialogIndirectParamA(HINSTANCE, DLGTEMPLATE*, HWND, DLGPROC, LPARAM);
HWND CreateDialogIndirectParamW(HINSTANCE, DLGTEMPLATE*, HWND, DLGPROC, LPARAM);
long DialogBoxParamA(HINSTANCE, const(char)*, HWND, DLGPROC, LPARAM);
long DialogBoxParamW(HINSTANCE, const(wchar)*, HWND, DLGPROC, LPARAM);
long DialogBoxIndirectParamA(HINSTANCE, DLGTEMPLATE*, HWND, DLGPROC, LPARAM);
long DialogBoxIndirectParamW(HINSTANCE, DLGTEMPLATE*, HWND, DLGPROC, LPARAM);
BOOL EndDialog(HWND, long);
HWND GetDlgItem(HWND, int);
BOOL SetDlgItemInt(HWND, int, uint, BOOL);
uint GetDlgItemInt(HWND, int, BOOL*, BOOL);
BOOL SetDlgItemTextA(HWND, int, const(char)*);
BOOL SetDlgItemTextW(HWND, int, const(wchar)*);
uint GetDlgItemTextA(HWND, int, PSTR, int);
uint GetDlgItemTextW(HWND, int, PWSTR, int);
LRESULT SendDlgItemMessageA(HWND, int, uint, WPARAM, LPARAM);
LRESULT SendDlgItemMessageW(HWND, int, uint, WPARAM, LPARAM);
HWND GetNextDlgGroupItem(HWND, HWND, BOOL);
HWND GetNextDlgTabItem(HWND, HWND, BOOL);
int GetDlgCtrlID(HWND);
int GetDialogBaseUnits();
LRESULT DefDlgProcA(HWND, uint, WPARAM, LPARAM);
LRESULT DefDlgProcW(HWND, uint, WPARAM, LPARAM);
BOOL CallMsgFilterA(MSG*, int);
BOOL CallMsgFilterW(MSG*, int);
BOOL CharToOemA(const(char)*, PSTR);
BOOL CharToOemW(const(wchar)*, PSTR);
BOOL OemToCharA(const(char)*, PSTR);
BOOL OemToCharW(const(char)*, PWSTR);
BOOL CharToOemBuffA(const(char)*, PSTR, uint);
BOOL CharToOemBuffW(const(wchar)*, PSTR, uint);
BOOL OemToCharBuffA(const(char)*, PSTR, uint);
BOOL OemToCharBuffW(const(char)*, PWSTR, uint);
PSTR CharUpperA(PSTR);
PWSTR CharUpperW(PWSTR);
uint CharUpperBuffA(PSTR, uint);
uint CharUpperBuffW(PWSTR, uint);
PSTR CharLowerA(PSTR);
PWSTR CharLowerW(PWSTR);
uint CharLowerBuffA(PSTR, uint);
uint CharLowerBuffW(PWSTR, uint);
PSTR CharNextA(const(char)*);
PWSTR CharNextW(const(wchar)*);
PSTR CharPrevA(const(char)*, const(char)*);
PWSTR CharPrevW(const(wchar)*, const(wchar)*);
PSTR CharNextExA(ushort, const(char)*, uint);
PSTR CharPrevExA(ushort, const(char)*, const(char)*, uint);
BOOL IsCharAlphaA(CHAR);
BOOL IsCharAlphaW(wchar);
BOOL IsCharAlphaNumericA(CHAR);
BOOL IsCharAlphaNumericW(wchar);
BOOL IsCharUpperA(CHAR);
BOOL IsCharUpperW(wchar);
BOOL IsCharLowerA(CHAR);
BOOL GetInputState();
uint GetQueueStatus(QUEUE_STATUS_FLAGS);
uint MsgWaitForMultipleObjects(uint, const(HANDLE)*, BOOL, uint, QUEUE_STATUS_FLAGS);
uint MsgWaitForMultipleObjectsEx(uint, const(HANDLE)*, uint, QUEUE_STATUS_FLAGS, MSG_WAIT_FOR_MULTIPLE_OBJECTS_EX_FLAGS);
ulong SetTimer(HWND, ulong, uint, TIMERPROC);
ulong SetCoalescableTimer(HWND, ulong, uint, TIMERPROC, uint);
BOOL KillTimer(HWND, ulong);
BOOL IsWindowUnicode(HWND);
HACCEL LoadAcceleratorsA(HINSTANCE, const(char)*);
HACCEL LoadAcceleratorsW(HINSTANCE, const(wchar)*);
HACCEL CreateAcceleratorTableA(ACCEL*, int);
HACCEL CreateAcceleratorTableW(ACCEL*, int);
BOOL DestroyAcceleratorTable(HACCEL);
int CopyAcceleratorTableA(HACCEL, ACCEL*, int);
int CopyAcceleratorTableW(HACCEL, ACCEL*, int);
int TranslateAcceleratorA(HWND, HACCEL, MSG*);
int TranslateAcceleratorW(HWND, HACCEL, MSG*);
int GetSystemMetrics(SYSTEM_METRICS_INDEX);
HMENU LoadMenuA(HINSTANCE, const(char)*);
HMENU LoadMenuW(HINSTANCE, const(wchar)*);
HMENU LoadMenuIndirectA(const(void)*);
HMENU LoadMenuIndirectW(const(void)*);
HMENU GetMenu(HWND);
BOOL SetMenu(HWND, HMENU);
BOOL ChangeMenuA(HMENU, uint, const(char)*, uint, uint);
BOOL ChangeMenuW(HMENU, uint, const(wchar)*, uint, uint);
BOOL HiliteMenuItem(HWND, HMENU, uint, uint);
int GetMenuStringA(HMENU, uint, PSTR, int, MENU_ITEM_FLAGS);
int GetMenuStringW(HMENU, uint, PWSTR, int, MENU_ITEM_FLAGS);
uint GetMenuState(HMENU, uint, MENU_ITEM_FLAGS);
BOOL DrawMenuBar(HWND);
HMENU GetSystemMenu(HWND, BOOL);
HMENU CreateMenu();
HMENU CreatePopupMenu();
BOOL DestroyMenu(HMENU);
uint CheckMenuItem(HMENU, uint, uint);
BOOL EnableMenuItem(HMENU, uint, MENU_ITEM_FLAGS);
HMENU GetSubMenu(HMENU, int);
uint GetMenuItemID(HMENU, int);
int GetMenuItemCount(HMENU);
BOOL InsertMenuA(HMENU, uint, MENU_ITEM_FLAGS, ulong, const(char)*);
BOOL InsertMenuW(HMENU, uint, MENU_ITEM_FLAGS, ulong, const(wchar)*);
BOOL AppendMenuA(HMENU, MENU_ITEM_FLAGS, ulong, const(char)*);
BOOL AppendMenuW(HMENU, MENU_ITEM_FLAGS, ulong, const(wchar)*);
BOOL ModifyMenuA(HMENU, uint, MENU_ITEM_FLAGS, ulong, const(char)*);
BOOL ModifyMenuW(HMENU, uint, MENU_ITEM_FLAGS, ulong, const(wchar)*);
BOOL RemoveMenu(HMENU, uint, MENU_ITEM_FLAGS);
BOOL DeleteMenu(HMENU, uint, MENU_ITEM_FLAGS);
BOOL SetMenuItemBitmaps(HMENU, uint, MENU_ITEM_FLAGS, HBITMAP, HBITMAP);
int GetMenuCheckMarkDimensions();
BOOL TrackPopupMenu(HMENU, TRACK_POPUP_MENU_FLAGS, int, int, int, HWND, const(RECT)*);
BOOL TrackPopupMenuEx(HMENU, uint, int, int, HWND, TPMPARAMS*);
BOOL CalculatePopupWindowPosition(const(POINT)*, const(SIZE)*, uint, RECT*, RECT*);
BOOL GetMenuInfo(HMENU, MENUINFO*);
BOOL SetMenuInfo(HMENU, MENUINFO*);
BOOL EndMenu();
BOOL InsertMenuItemA(HMENU, uint, BOOL, MENUITEMINFOA*);
BOOL InsertMenuItemW(HMENU, uint, BOOL, MENUITEMINFOW*);
BOOL GetMenuItemInfoA(HMENU, uint, BOOL, MENUITEMINFOA*);
BOOL GetMenuItemInfoW(HMENU, uint, BOOL, MENUITEMINFOW*);
BOOL SetMenuItemInfoA(HMENU, uint, BOOL, MENUITEMINFOA*);
BOOL SetMenuItemInfoW(HMENU, uint, BOOL, MENUITEMINFOW*);
uint GetMenuDefaultItem(HMENU, uint, GET_MENU_DEFAULT_ITEM_FLAGS);
BOOL SetMenuDefaultItem(HMENU, uint, uint);
BOOL GetMenuItemRect(HWND, HMENU, uint, RECT*);
int MenuItemFromPoint(HWND, HMENU, POINT);
uint DragObject(HWND, HWND, uint, ulong, HCURSOR);
BOOL DrawIcon(HDC, int, int, HICON);
HWND GetForegroundWindow();
void SwitchToThisWindow(HWND, BOOL);
BOOL SetForegroundWindow(HWND);
BOOL AllowSetForegroundWindow(uint);
BOOL LockSetForegroundWindow(FOREGROUND_WINDOW_LOCK_CODE);
BOOL ScrollWindow(HWND, int, int, const(RECT)*, const(RECT)*);
BOOL ScrollDC(HDC, int, int, const(RECT)*, const(RECT)*, HRGN, RECT*);
int ScrollWindowEx(HWND, int, int, const(RECT)*, const(RECT)*, HRGN, RECT*, SHOW_WINDOW_CMD);
int GetScrollPos(HWND, SCROLLBAR_CONSTANTS);
BOOL GetScrollRange(HWND, SCROLLBAR_CONSTANTS, int*, int*);
BOOL SetPropA(HWND, const(char)*, HANDLE);
BOOL SetPropW(HWND, const(wchar)*, HANDLE);
HANDLE GetPropA(HWND, const(char)*);
HANDLE GetPropW(HWND, const(wchar)*);
HANDLE RemovePropA(HWND, const(char)*);
HANDLE RemovePropW(HWND, const(wchar)*);
int EnumPropsExA(HWND, PROPENUMPROCEXA, LPARAM);
int EnumPropsExW(HWND, PROPENUMPROCEXW, LPARAM);
int EnumPropsA(HWND, PROPENUMPROCA);
int EnumPropsW(HWND, PROPENUMPROCW);
BOOL SetWindowTextA(HWND, const(char)*);
BOOL SetWindowTextW(HWND, const(wchar)*);
int GetWindowTextA(HWND, PSTR, int);
int GetWindowTextW(HWND, PWSTR, int);
int GetWindowTextLengthA(HWND);
int GetWindowTextLengthW(HWND);
BOOL GetClientRect(HWND, RECT*);
BOOL GetWindowRect(HWND, RECT*);
BOOL AdjustWindowRect(RECT*, WINDOW_STYLE, BOOL);
BOOL AdjustWindowRectEx(RECT*, WINDOW_STYLE, BOOL, WINDOW_EX_STYLE);
MESSAGEBOX_RESULT MessageBoxA(HWND, const(char)*, const(char)*, MESSAGEBOX_STYLE);
MESSAGEBOX_RESULT MessageBoxW(HWND, const(wchar)*, const(wchar)*, MESSAGEBOX_STYLE);
MESSAGEBOX_RESULT MessageBoxExA(HWND, const(char)*, const(char)*, MESSAGEBOX_STYLE, ushort);
MESSAGEBOX_RESULT MessageBoxExW(HWND, const(wchar)*, const(wchar)*, MESSAGEBOX_STYLE, ushort);
MESSAGEBOX_RESULT MessageBoxIndirectA(const(MSGBOXPARAMSA)*);
MESSAGEBOX_RESULT MessageBoxIndirectW(const(MSGBOXPARAMSW)*);
int ShowCursor(BOOL);
BOOL SetCursorPos(int, int);
BOOL SetPhysicalCursorPos(int, int);
HCURSOR SetCursor(HCURSOR);
BOOL GetCursorPos(POINT*);
BOOL GetPhysicalCursorPos(POINT*);
BOOL GetClipCursor(RECT*);
HCURSOR GetCursor();
BOOL CreateCaret(HWND, HBITMAP, int, int);
uint GetCaretBlinkTime();
BOOL SetCaretBlinkTime(uint);
BOOL DestroyCaret();
BOOL HideCaret(HWND);
BOOL ShowCaret(HWND);
BOOL SetCaretPos(int, int);
BOOL GetCaretPos(POINT*);
BOOL LogicalToPhysicalPoint(HWND, POINT*);
BOOL PhysicalToLogicalPoint(HWND, POINT*);
HWND WindowFromPoint(POINT);
HWND WindowFromPhysicalPoint(POINT);
HWND ChildWindowFromPoint(HWND, POINT);
BOOL ClipCursor(const(RECT)*);
HWND ChildWindowFromPointEx(HWND, POINT, CWP_FLAGS);
uint GetSysColor(SYS_COLOR_INDEX);
BOOL SetSysColors(int, const(int)*, const(uint)*);
ushort GetWindowWord(HWND, int);
ushort SetWindowWord(HWND, int, ushort);
int GetWindowLongA(HWND, WINDOW_LONG_PTR_INDEX);
int GetWindowLongW(HWND, WINDOW_LONG_PTR_INDEX);
int SetWindowLongA(HWND, WINDOW_LONG_PTR_INDEX, int);
int SetWindowLongW(HWND, WINDOW_LONG_PTR_INDEX, int);
long GetWindowLongPtrA(HWND, WINDOW_LONG_PTR_INDEX);
long GetWindowLongPtrW(HWND, WINDOW_LONG_PTR_INDEX);
long SetWindowLongPtrA(HWND, WINDOW_LONG_PTR_INDEX, long);
long SetWindowLongPtrW(HWND, WINDOW_LONG_PTR_INDEX, long);
ushort GetClassWord(HWND, int);
ushort SetClassWord(HWND, int, ushort);
uint GetClassLongA(HWND, GET_CLASS_LONG_INDEX);
uint GetClassLongW(HWND, GET_CLASS_LONG_INDEX);
uint SetClassLongA(HWND, GET_CLASS_LONG_INDEX, int);
uint SetClassLongW(HWND, GET_CLASS_LONG_INDEX, int);
ulong GetClassLongPtrA(HWND, GET_CLASS_LONG_INDEX);
ulong GetClassLongPtrW(HWND, GET_CLASS_LONG_INDEX);
ulong SetClassLongPtrA(HWND, GET_CLASS_LONG_INDEX, long);
ulong SetClassLongPtrW(HWND, GET_CLASS_LONG_INDEX, long);
BOOL GetProcessDefaultLayout(uint*);
BOOL SetProcessDefaultLayout(uint);
HWND GetDesktopWindow();
HWND GetParent(HWND);
HWND SetParent(HWND, HWND);
BOOL EnumChildWindows(HWND, WNDENUMPROC, LPARAM);
HWND FindWindowA(const(char)*, const(char)*);
HWND FindWindowW(const(wchar)*, const(wchar)*);
HWND FindWindowExA(HWND, HWND, const(char)*, const(char)*);
HWND FindWindowExW(HWND, HWND, const(wchar)*, const(wchar)*);
HWND GetShellWindow();
BOOL RegisterShellHookWindow(HWND);
BOOL DeregisterShellHookWindow(HWND);
BOOL EnumWindows(WNDENUMPROC, LPARAM);
BOOL EnumThreadWindows(uint, WNDENUMPROC, LPARAM);
int GetClassNameA(HWND, PSTR, int);
int GetClassNameW(HWND, PWSTR, int);
HWND GetTopWindow(HWND);
uint GetWindowThreadProcessId(HWND, uint*);
BOOL IsGUIThread(BOOL);
HWND GetLastActivePopup(HWND);
HWND GetWindow(HWND, GET_WINDOW_CMD);
HHOOK SetWindowsHookA(int, HOOKPROC);
HHOOK SetWindowsHookW(int, HOOKPROC);
BOOL UnhookWindowsHook(int, HOOKPROC);
HHOOK SetWindowsHookExA(WINDOWS_HOOK_ID, HOOKPROC, HINSTANCE, uint);
HHOOK SetWindowsHookExW(WINDOWS_HOOK_ID, HOOKPROC, HINSTANCE, uint);
BOOL UnhookWindowsHookEx(HHOOK);
LRESULT CallNextHookEx(HHOOK, int, WPARAM, LPARAM);
BOOL CheckMenuRadioItem(HMENU, uint, uint, uint, uint);
HCURSOR LoadCursorA(HINSTANCE, const(char)*);
HCURSOR LoadCursorW(HINSTANCE, const(wchar)*);
HCURSOR LoadCursorFromFileA(const(char)*);
HCURSOR LoadCursorFromFileW(const(wchar)*);
HCURSOR CreateCursor(HINSTANCE, int, int, int, int, const(void)*, const(void)*);
BOOL DestroyCursor(HCURSOR);
BOOL SetSystemCursor(HCURSOR, SYSTEM_CURSOR_ID);
HICON LoadIconA(HINSTANCE, const(char)*);
HICON LoadIconW(HINSTANCE, const(wchar)*);
uint PrivateExtractIconsA(const(char)*, int, int, int, HICON*, uint*, uint, uint);
uint PrivateExtractIconsW(const(wchar)*, int, int, int, HICON*, uint*, uint, uint);
HICON CreateIcon(HINSTANCE, int, int, ubyte, ubyte, const(ubyte)*, const(ubyte)*);
BOOL DestroyIcon(HICON);
int LookupIconIdFromDirectory(ubyte*, BOOL);
int LookupIconIdFromDirectoryEx(ubyte*, BOOL, int, int, IMAGE_FLAGS);
HICON CreateIconFromResource(ubyte*, uint, BOOL, uint);
HICON CreateIconFromResourceEx(ubyte*, uint, BOOL, uint, int, int, IMAGE_FLAGS);
HANDLE LoadImageA(HINSTANCE, const(char)*, GDI_IMAGE_TYPE, int, int, IMAGE_FLAGS);
HANDLE LoadImageW(HINSTANCE, const(wchar)*, GDI_IMAGE_TYPE, int, int, IMAGE_FLAGS);
HANDLE CopyImage(HANDLE, GDI_IMAGE_TYPE, int, int, IMAGE_FLAGS);
BOOL DrawIconEx(HDC, int, int, HICON, int, int, uint, HBRUSH, DI_FLAGS);
HICON CreateIconIndirect(ICONINFO*);
HICON CopyIcon(HICON);
BOOL GetIconInfo(HICON, ICONINFO*);
BOOL GetIconInfoExA(HICON, ICONINFOEXA*);
BOOL GetIconInfoExW(HICON, ICONINFOEXW*);
BOOL IsDialogMessageA(HWND, MSG*);
BOOL IsDialogMessageW(HWND, MSG*);
BOOL MapDialogRect(HWND, RECT*);
BOOL GetScrollInfo(HWND, SCROLLBAR_CONSTANTS, SCROLLINFO*);
LRESULT DefFrameProcA(HWND, HWND, uint, WPARAM, LPARAM);
LRESULT DefFrameProcW(HWND, HWND, uint, WPARAM, LPARAM);
LRESULT DefMDIChildProcA(HWND, uint, WPARAM, LPARAM);
LRESULT DefMDIChildProcW(HWND, uint, WPARAM, LPARAM);
BOOL TranslateMDISysAccel(HWND, MSG*);
uint ArrangeIconicWindows(HWND);
HWND CreateMDIWindowA(const(char)*, const(char)*, WINDOW_STYLE, int, int, int, int, HWND, HINSTANCE, LPARAM);
HWND CreateMDIWindowW(const(wchar)*, const(wchar)*, WINDOW_STYLE, int, int, int, int, HWND, HINSTANCE, LPARAM);
ushort TileWindows(HWND, TILE_WINDOWS_HOW, const(RECT)*, uint, const(HWND)*);
ushort CascadeWindows(HWND, CASCADE_WINDOWS_HOW, const(RECT)*, uint, const(HWND)*);
BOOL SystemParametersInfoA(SYSTEM_PARAMETERS_INFO_ACTION, uint, void*, SYSTEM_PARAMETERS_INFO_UPDATE_FLAGS);
BOOL SystemParametersInfoW(SYSTEM_PARAMETERS_INFO_ACTION, uint, void*, SYSTEM_PARAMETERS_INFO_UPDATE_FLAGS);
BOOL SoundSentry();
void SetDebugErrorLevel(uint);
int InternalGetWindowText(HWND, PWSTR, int);
BOOL CancelShutdown();
BOOL GetGUIThreadInfo(uint, GUITHREADINFO*);
BOOL SetProcessDPIAware();
BOOL IsProcessDPIAware();
BOOL InheritWindowMonitor(HWND, HWND);
uint GetWindowModuleFileNameA(HWND, PSTR, uint);
uint GetWindowModuleFileNameW(HWND, PWSTR, uint);
BOOL GetCursorInfo(CURSORINFO*);
BOOL GetWindowInfo(HWND, WINDOWINFO*);
BOOL GetTitleBarInfo(HWND, TITLEBARINFO*);
BOOL GetMenuBarInfo(HWND, OBJECT_IDENTIFIER, int, MENUBARINFO*);
BOOL GetScrollBarInfo(HWND, OBJECT_IDENTIFIER, SCROLLBARINFO*);
HWND GetAncestor(HWND, GET_ANCESTOR_FLAGS);
HWND RealChildWindowFromPoint(HWND, POINT);
uint RealGetWindowClassA(HWND, PSTR, uint);
uint RealGetWindowClassW(HWND, PWSTR, uint);
BOOL GetAltTabInfoA(HWND, int, ALTTABINFO*, PSTR, uint);
BOOL GetAltTabInfoW(HWND, int, ALTTABINFO*, PWSTR, uint);
BOOL ChangeWindowMessageFilter(uint, CHANGE_WINDOW_MESSAGE_FILTER_FLAGS);
BOOL ChangeWindowMessageFilterEx(HWND, uint, WINDOW_MESSAGE_FILTER_ACTION, CHANGEFILTERSTRUCT*);
HRESULT CreateResourceIndexer(const(wchar)*, const(wchar)*, void**);
void DestroyResourceIndexer(void*);
HRESULT IndexFilePath(void*, const(wchar)*, PWSTR*, uint*, IndexedResourceQualifier**);
void DestroyIndexedResults(PWSTR, uint, IndexedResourceQualifier*);
HRESULT MrmCreateResourceIndexer(const(wchar)*, const(wchar)*, MrmPlatformVersion, const(wchar)*, MrmResourceIndexerHandle*);
HRESULT MrmCreateResourceIndexerFromPreviousSchemaFile(const(wchar)*, MrmPlatformVersion, const(wchar)*, const(wchar)*, MrmResourceIndexerHandle*);
HRESULT MrmCreateResourceIndexerFromPreviousPriFile(const(wchar)*, MrmPlatformVersion, const(wchar)*, const(wchar)*, MrmResourceIndexerHandle*);
HRESULT MrmCreateResourceIndexerFromPreviousSchemaData(const(wchar)*, MrmPlatformVersion, const(wchar)*, ubyte*, uint, MrmResourceIndexerHandle*);
HRESULT MrmCreateResourceIndexerFromPreviousPriData(const(wchar)*, MrmPlatformVersion, const(wchar)*, ubyte*, uint, MrmResourceIndexerHandle*);
HRESULT MrmCreateResourceIndexerWithFlags(const(wchar)*, const(wchar)*, MrmPlatformVersion, const(wchar)*, MrmIndexerFlags, MrmResourceIndexerHandle*);
HRESULT MrmIndexString(MrmResourceIndexerHandle, const(wchar)*, const(wchar)*, const(wchar)*);
HRESULT MrmIndexEmbeddedData(MrmResourceIndexerHandle, const(wchar)*, const(ubyte)*, uint, const(wchar)*);
HRESULT MrmIndexFile(MrmResourceIndexerHandle, const(wchar)*, const(wchar)*, const(wchar)*);
HRESULT MrmIndexFileAutoQualifiers(MrmResourceIndexerHandle, const(wchar)*);
HRESULT MrmIndexResourceContainerAutoQualifiers(MrmResourceIndexerHandle, const(wchar)*);
HRESULT MrmCreateResourceFile(MrmResourceIndexerHandle, MrmPackagingMode, MrmPackagingOptions, const(wchar)*);
HRESULT MrmCreateResourceFileWithChecksum(MrmResourceIndexerHandle, MrmPackagingMode, MrmPackagingOptions, uint, const(wchar)*);
HRESULT MrmCreateResourceFileInMemory(MrmResourceIndexerHandle, MrmPackagingMode, MrmPackagingOptions, ubyte**, uint*);
HRESULT MrmPeekResourceIndexerMessages(MrmResourceIndexerHandle, MrmResourceIndexerMessage**, uint*);
HRESULT MrmDestroyIndexerAndMessages(MrmResourceIndexerHandle);
HRESULT MrmFreeMemory(ubyte*);
HRESULT MrmDumpPriFile(const(wchar)*, const(wchar)*, MrmDumpType, const(wchar)*);
HRESULT MrmDumpPriFileInMemory(const(wchar)*, const(wchar)*, MrmDumpType, ubyte**, uint*);
HRESULT MrmDumpPriDataInMemory(ubyte*, uint, ubyte*, uint, MrmDumpType, ubyte**, uint*);
HRESULT MrmCreateConfig(MrmPlatformVersion, const(wchar)*, const(wchar)*);
HRESULT MrmCreateConfigInMemory(MrmPlatformVersion, const(wchar)*, ubyte**, uint*);
HRESULT MrmGetPriFileContentChecksum(const(wchar)*, uint*);
enum WM_DEVICECHANGE = 0x00000219;
enum BSM_VXDS = 0x00000001;
enum BSM_NETDRIVER = 0x00000002;
enum BSM_INSTALLABLEDRIVERS = 0x00000004;
enum WM_CONTEXTMENU = 0x0000007b;
enum WM_UNICHAR = 0x00000109;
enum WM_PRINTCLIENT = 0x00000318;
enum WM_NOTIFY = 0x0000004e;
enum RT_CURSOR = 0x00000001;
enum RT_BITMAP = 0x00000002;
enum RT_ICON = 0x00000003;
enum RT_MENU = 0x00000004;
enum RT_DIALOG = 0x00000005;
enum RT_FONTDIR = 0x00000007;
enum RT_FONT = 0x00000008;
enum RT_ACCELERATOR = 0x00000009;
enum RT_MESSAGETABLE = 0x0000000b;
enum DIFFERENCE = 0x0000000b;
enum RT_VERSION = 0x00000010;
enum RT_DLGINCLUDE = 0x00000011;
enum RT_PLUGPLAY = 0x00000013;
enum RT_VXD = 0x00000014;
enum RT_ANICURSOR = 0x00000015;
enum RT_ANIICON = 0x00000016;
enum RT_HTML = 0x00000017;
enum RT_MANIFEST = 0x00000018;
enum CREATEPROCESS_MANIFEST_RESOURCE_ID = 0x00000001;
enum ISOLATIONAWARE_MANIFEST_RESOURCE_ID = 0x00000002;
enum ISOLATIONAWARE_NOSTATICIMPORT_MANIFEST_RESOURCE_ID = 0x00000003;
enum ISOLATIONPOLICY_MANIFEST_RESOURCE_ID = 0x00000004;
enum ISOLATIONPOLICY_BROWSER_MANIFEST_RESOURCE_ID = 0x00000005;
enum MINIMUM_RESERVED_MANIFEST_RESOURCE_ID = 0x00000001;
enum MAXIMUM_RESERVED_MANIFEST_RESOURCE_ID = 0x00000010;
enum SB_LINEUP = 0x00000000;
enum SB_LINELEFT = 0x00000000;
enum SB_LINEDOWN = 0x00000001;
enum SB_LINERIGHT = 0x00000001;
enum SB_PAGEUP = 0x00000002;
enum SB_PAGELEFT = 0x00000002;
enum SB_PAGEDOWN = 0x00000003;
enum SB_PAGERIGHT = 0x00000003;
enum SB_THUMBPOSITION = 0x00000004;
enum SB_THUMBTRACK = 0x00000005;
enum SB_TOP = 0x00000006;
enum SB_LEFT = 0x00000006;
enum SB_BOTTOM = 0x00000007;
enum SB_RIGHT = 0x00000007;
enum SB_ENDSCROLL = 0x00000008;
enum HIDE_WINDOW = 0x00000000;
enum SHOW_OPENWINDOW = 0x00000001;
enum SHOW_ICONWINDOW = 0x00000002;
enum SHOW_FULLSCREEN = 0x00000003;
enum SHOW_OPENNOACTIVATE = 0x00000004;
enum KF_EXTENDED = 0x00000100;
enum KF_DLGMODE = 0x00000800;
enum KF_MENUMODE = 0x00001000;
enum KF_ALTDOWN = 0x00002000;
enum KF_REPEAT = 0x00004000;
enum KF_UP = 0x00008000;
enum WH_MIN = 0xffffffffffffffff;
enum WH_HARDWARE = 0x00000008;
enum WH_MAX = 0x0000000e;
enum WH_MINHOOK = 0xffffffffffffffff;
enum WH_MAXHOOK = 0x0000000e;
enum HC_ACTION = 0x00000000;
enum HC_GETNEXT = 0x00000001;
enum HC_SKIP = 0x00000002;
enum HC_NOREMOVE = 0x00000003;
enum HC_NOREM = 0x00000003;
enum HC_SYSMODALON = 0x00000004;
enum HC_SYSMODALOFF = 0x00000005;
enum HCBT_MOVESIZE = 0x00000000;
enum HCBT_MINMAX = 0x00000001;
enum HCBT_QS = 0x00000002;
enum HCBT_CREATEWND = 0x00000003;
enum HCBT_DESTROYWND = 0x00000004;
enum HCBT_ACTIVATE = 0x00000005;
enum HCBT_CLICKSKIPPED = 0x00000006;
enum HCBT_KEYSKIPPED = 0x00000007;
enum HCBT_SYSCOMMAND = 0x00000008;
enum HCBT_SETFOCUS = 0x00000009;
enum WTS_CONSOLE_CONNECT = 0x00000001;
enum WTS_CONSOLE_DISCONNECT = 0x00000002;
enum WTS_REMOTE_CONNECT = 0x00000003;
enum WTS_REMOTE_DISCONNECT = 0x00000004;
enum WTS_SESSION_LOGON = 0x00000005;
enum WTS_SESSION_LOGOFF = 0x00000006;
enum WTS_SESSION_LOCK = 0x00000007;
enum WTS_SESSION_UNLOCK = 0x00000008;
enum WTS_SESSION_REMOTE_CONTROL = 0x00000009;
enum WTS_SESSION_CREATE = 0x0000000a;
enum WTS_SESSION_TERMINATE = 0x0000000b;
enum MSGF_DIALOGBOX = 0x00000000;
enum MSGF_MESSAGEBOX = 0x00000001;
enum MSGF_MENU = 0x00000002;
enum MSGF_SCROLLBAR = 0x00000005;
enum MSGF_NEXTWINDOW = 0x00000006;
enum MSGF_MAX = 0x00000008;
enum MSGF_USER = 0x00001000;
enum HSHELL_WINDOWCREATED = 0x00000001;
enum HSHELL_WINDOWDESTROYED = 0x00000002;
enum HSHELL_ACTIVATESHELLWINDOW = 0x00000003;
enum HSHELL_WINDOWACTIVATED = 0x00000004;
enum HSHELL_GETMINRECT = 0x00000005;
enum HSHELL_REDRAW = 0x00000006;
enum HSHELL_TASKMAN = 0x00000007;
enum HSHELL_LANGUAGE = 0x00000008;
enum HSHELL_SYSMENU = 0x00000009;
enum HSHELL_ENDTASK = 0x0000000a;
enum HSHELL_ACCESSIBILITYSTATE = 0x0000000b;
enum HSHELL_APPCOMMAND = 0x0000000c;
enum HSHELL_WINDOWREPLACED = 0x0000000d;
enum HSHELL_WINDOWREPLACING = 0x0000000e;
enum HSHELL_MONITORCHANGED = 0x00000010;
enum HSHELL_HIGHBIT = 0x00008000;
enum FAPPCOMMAND_MOUSE = 0x00008000;
enum FAPPCOMMAND_KEY = 0x00000000;
enum FAPPCOMMAND_OEM = 0x00001000;
enum FAPPCOMMAND_MASK = 0x0000f000;
enum LLMHF_INJECTED = 0x00000001;
enum LLMHF_LOWER_IL_INJECTED = 0x00000002;
enum HKL_PREV = 0x00000000;
enum HKL_NEXT = 0x00000001;
enum INPUTLANGCHANGE_SYSCHARSET = 0x00000001;
enum INPUTLANGCHANGE_FORWARD = 0x00000002;
enum INPUTLANGCHANGE_BACKWARD = 0x00000004;
enum KL_NAMELENGTH = 0x00000009;
enum DESKTOP_READOBJECTS = 0x00000001;
enum DESKTOP_CREATEWINDOW = 0x00000002;
enum DESKTOP_CREATEMENU = 0x00000004;
enum DESKTOP_HOOKCONTROL = 0x00000008;
enum DESKTOP_JOURNALRECORD = 0x00000010;
enum DESKTOP_JOURNALPLAYBACK = 0x00000020;
enum DESKTOP_ENUMERATE = 0x00000040;
enum DESKTOP_WRITEOBJECTS = 0x00000080;
enum DESKTOP_SWITCHDESKTOP = 0x00000100;
enum DF_ALLOWOTHERACCOUNTHOOK = 0x00000001;
enum WINSTA_ENUMDESKTOPS = 0x00000001;
enum WINSTA_READATTRIBUTES = 0x00000002;
enum WINSTA_ACCESSCLIPBOARD = 0x00000004;
enum WINSTA_CREATEDESKTOP = 0x00000008;
enum WINSTA_WRITEATTRIBUTES = 0x00000010;
enum WINSTA_ACCESSGLOBALATOMS = 0x00000020;
enum WINSTA_EXITWINDOWS = 0x00000040;
enum WINSTA_ENUMERATE = 0x00000100;
enum WINSTA_READSCREEN = 0x00000200;
enum CWF_CREATE_ONLY = 0x00000001;
enum WSF_VISIBLE = 0x00000001;
enum UOI_TIMERPROC_EXCEPTION_SUPPRESSION = 0x00000007;
enum WM_NULL = 0x00000000;
enum WM_CREATE = 0x00000001;
enum WM_DESTROY = 0x00000002;
enum WM_MOVE = 0x00000003;
enum WM_SIZE = 0x00000005;
enum WM_ACTIVATE = 0x00000006;
enum WA_INACTIVE = 0x00000000;
enum WA_ACTIVE = 0x00000001;
enum WA_CLICKACTIVE = 0x00000002;
enum WM_SETFOCUS = 0x00000007;
enum WM_KILLFOCUS = 0x00000008;
enum WM_ENABLE = 0x0000000a;
enum WM_SETREDRAW = 0x0000000b;
enum WM_SETTEXT = 0x0000000c;
enum WM_GETTEXT = 0x0000000d;
enum WM_GETTEXTLENGTH = 0x0000000e;
enum WM_PAINT = 0x0000000f;
enum WM_CLOSE = 0x00000010;
enum WM_QUERYENDSESSION = 0x00000011;
enum WM_QUERYOPEN = 0x00000013;
enum WM_ENDSESSION = 0x00000016;
enum WM_QUIT = 0x00000012;
enum WM_ERASEBKGND = 0x00000014;
enum WM_SYSCOLORCHANGE = 0x00000015;
enum WM_SHOWWINDOW = 0x00000018;
enum WM_WININICHANGE = 0x0000001a;
enum WM_SETTINGCHANGE = 0x0000001a;
enum WM_DEVMODECHANGE = 0x0000001b;
enum WM_ACTIVATEAPP = 0x0000001c;
enum WM_FONTCHANGE = 0x0000001d;
enum WM_TIMECHANGE = 0x0000001e;
enum WM_CANCELMODE = 0x0000001f;
enum WM_SETCURSOR = 0x00000020;
enum WM_MOUSEACTIVATE = 0x00000021;
enum WM_CHILDACTIVATE = 0x00000022;
enum WM_QUEUESYNC = 0x00000023;
enum WM_GETMINMAXINFO = 0x00000024;
enum WM_PAINTICON = 0x00000026;
enum WM_ICONERASEBKGND = 0x00000027;
enum WM_NEXTDLGCTL = 0x00000028;
enum WM_SPOOLERSTATUS = 0x0000002a;
enum WM_DRAWITEM = 0x0000002b;
enum WM_MEASUREITEM = 0x0000002c;
enum WM_DELETEITEM = 0x0000002d;
enum WM_VKEYTOITEM = 0x0000002e;
enum WM_CHARTOITEM = 0x0000002f;
enum WM_SETFONT = 0x00000030;
enum WM_GETFONT = 0x00000031;
enum WM_SETHOTKEY = 0x00000032;
enum WM_GETHOTKEY = 0x00000033;
enum WM_QUERYDRAGICON = 0x00000037;
enum WM_COMPAREITEM = 0x00000039;
enum WM_GETOBJECT = 0x0000003d;
enum WM_COMPACTING = 0x00000041;
enum WM_COMMNOTIFY = 0x00000044;
enum WM_WINDOWPOSCHANGING = 0x00000046;
enum WM_WINDOWPOSCHANGED = 0x00000047;
enum WM_POWER = 0x00000048;
enum PWR_OK = 0x00000001;
enum PWR_FAIL = 0xffffffffffffffff;
enum PWR_SUSPENDREQUEST = 0x00000001;
enum PWR_SUSPENDRESUME = 0x00000002;
enum PWR_CRITICALRESUME = 0x00000003;
enum WM_COPYDATA = 0x0000004a;
enum WM_CANCELJOURNAL = 0x0000004b;
enum WM_INPUTLANGCHANGEREQUEST = 0x00000050;
enum WM_INPUTLANGCHANGE = 0x00000051;
enum WM_TCARD = 0x00000052;
enum WM_HELP = 0x00000053;
enum WM_USERCHANGED = 0x00000054;
enum WM_NOTIFYFORMAT = 0x00000055;
enum NFR_ANSI = 0x00000001;
enum NFR_UNICODE = 0x00000002;
enum NF_QUERY = 0x00000003;
enum NF_REQUERY = 0x00000004;
enum WM_STYLECHANGING = 0x0000007c;
enum WM_STYLECHANGED = 0x0000007d;
enum WM_DISPLAYCHANGE = 0x0000007e;
enum WM_GETICON = 0x0000007f;
enum WM_SETICON = 0x00000080;
enum WM_NCCREATE = 0x00000081;
enum WM_NCDESTROY = 0x00000082;
enum WM_NCCALCSIZE = 0x00000083;
enum WM_NCHITTEST = 0x00000084;
enum WM_NCPAINT = 0x00000085;
enum WM_NCACTIVATE = 0x00000086;
enum WM_GETDLGCODE = 0x00000087;
enum WM_SYNCPAINT = 0x00000088;
enum WM_NCMOUSEMOVE = 0x000000a0;
enum WM_NCLBUTTONDOWN = 0x000000a1;
enum WM_NCLBUTTONUP = 0x000000a2;
enum WM_NCLBUTTONDBLCLK = 0x000000a3;
enum WM_NCRBUTTONDOWN = 0x000000a4;
enum WM_NCRBUTTONUP = 0x000000a5;
enum WM_NCRBUTTONDBLCLK = 0x000000a6;
enum WM_NCMBUTTONDOWN = 0x000000a7;
enum WM_NCMBUTTONUP = 0x000000a8;
enum WM_NCMBUTTONDBLCLK = 0x000000a9;
enum WM_NCXBUTTONDOWN = 0x000000ab;
enum WM_NCXBUTTONUP = 0x000000ac;
enum WM_NCXBUTTONDBLCLK = 0x000000ad;
enum WM_INPUT_DEVICE_CHANGE = 0x000000fe;
enum WM_INPUT = 0x000000ff;
enum WM_KEYFIRST = 0x00000100;
enum WM_KEYDOWN = 0x00000100;
enum WM_KEYUP = 0x00000101;
enum WM_CHAR = 0x00000102;
enum WM_DEADCHAR = 0x00000103;
enum WM_SYSKEYDOWN = 0x00000104;
enum WM_SYSKEYUP = 0x00000105;
enum WM_SYSCHAR = 0x00000106;
enum WM_SYSDEADCHAR = 0x00000107;
enum WM_KEYLAST = 0x00000109;
enum UNICODE_NOCHAR = 0x0000ffff;
enum WM_IME_STARTCOMPOSITION = 0x0000010d;
enum WM_IME_ENDCOMPOSITION = 0x0000010e;
enum WM_IME_COMPOSITION = 0x0000010f;
enum WM_IME_KEYLAST = 0x0000010f;
enum WM_INITDIALOG = 0x00000110;
enum WM_COMMAND = 0x00000111;
enum WM_SYSCOMMAND = 0x00000112;
enum WM_TIMER = 0x00000113;
enum WM_HSCROLL = 0x00000114;
enum WM_VSCROLL = 0x00000115;
enum WM_INITMENU = 0x00000116;
enum WM_INITMENUPOPUP = 0x00000117;
enum WM_GESTURE = 0x00000119;
enum WM_GESTURENOTIFY = 0x0000011a;
enum WM_MENUSELECT = 0x0000011f;
enum WM_MENUCHAR = 0x00000120;
enum WM_ENTERIDLE = 0x00000121;
enum WM_MENURBUTTONUP = 0x00000122;
enum WM_MENUDRAG = 0x00000123;
enum WM_MENUGETOBJECT = 0x00000124;
enum WM_UNINITMENUPOPUP = 0x00000125;
enum WM_MENUCOMMAND = 0x00000126;
enum WM_CHANGEUISTATE = 0x00000127;
enum WM_UPDATEUISTATE = 0x00000128;
enum WM_QUERYUISTATE = 0x00000129;
enum UIS_SET = 0x00000001;
enum UIS_CLEAR = 0x00000002;
enum UIS_INITIALIZE = 0x00000003;
enum UISF_HIDEFOCUS = 0x00000001;
enum UISF_HIDEACCEL = 0x00000002;
enum UISF_ACTIVE = 0x00000004;
enum WM_CTLCOLORMSGBOX = 0x00000132;
enum WM_CTLCOLOREDIT = 0x00000133;
enum WM_CTLCOLORLISTBOX = 0x00000134;
enum WM_CTLCOLORBTN = 0x00000135;
enum WM_CTLCOLORDLG = 0x00000136;
enum WM_CTLCOLORSCROLLBAR = 0x00000137;
enum WM_CTLCOLORSTATIC = 0x00000138;
enum MN_GETHMENU = 0x000001e1;
enum WM_MOUSEFIRST = 0x00000200;
enum WM_MOUSEMOVE = 0x00000200;
enum WM_LBUTTONDOWN = 0x00000201;
enum WM_LBUTTONUP = 0x00000202;
enum WM_LBUTTONDBLCLK = 0x00000203;
enum WM_RBUTTONDOWN = 0x00000204;
enum WM_RBUTTONUP = 0x00000205;
enum WM_RBUTTONDBLCLK = 0x00000206;
enum WM_MBUTTONDOWN = 0x00000207;
enum WM_MBUTTONUP = 0x00000208;
enum WM_MBUTTONDBLCLK = 0x00000209;
enum WM_MOUSEWHEEL = 0x0000020a;
enum WM_XBUTTONDOWN = 0x0000020b;
enum WM_XBUTTONUP = 0x0000020c;
enum WM_XBUTTONDBLCLK = 0x0000020d;
enum WM_MOUSEHWHEEL = 0x0000020e;
enum WM_MOUSELAST = 0x0000020e;
enum WHEEL_DELTA = 0x00000078;
enum WM_PARENTNOTIFY = 0x00000210;
enum WM_ENTERMENULOOP = 0x00000211;
enum WM_EXITMENULOOP = 0x00000212;
enum WM_NEXTMENU = 0x00000213;
enum WM_SIZING = 0x00000214;
enum WM_CAPTURECHANGED = 0x00000215;
enum WM_MOVING = 0x00000216;
enum WM_POWERBROADCAST = 0x00000218;
enum PBT_APMQUERYSUSPEND = 0x00000000;
enum PBT_APMQUERYSTANDBY = 0x00000001;
enum PBT_APMQUERYSUSPENDFAILED = 0x00000002;
enum PBT_APMQUERYSTANDBYFAILED = 0x00000003;
enum PBT_APMSUSPEND = 0x00000004;
enum PBT_APMSTANDBY = 0x00000005;
enum PBT_APMRESUMECRITICAL = 0x00000006;
enum PBT_APMRESUMESUSPEND = 0x00000007;
enum PBT_APMRESUMESTANDBY = 0x00000008;
enum PBTF_APMRESUMEFROMFAILURE = 0x00000001;
enum PBT_APMBATTERYLOW = 0x00000009;
enum PBT_APMPOWERSTATUSCHANGE = 0x0000000a;
enum PBT_APMOEMEVENT = 0x0000000b;
enum PBT_APMRESUMEAUTOMATIC = 0x00000012;
enum PBT_POWERSETTINGCHANGE = 0x00008013;
enum WM_MDICREATE = 0x00000220;
enum WM_MDIDESTROY = 0x00000221;
enum WM_MDIACTIVATE = 0x00000222;
enum WM_MDIRESTORE = 0x00000223;
enum WM_MDINEXT = 0x00000224;
enum WM_MDIMAXIMIZE = 0x00000225;
enum WM_MDITILE = 0x00000226;
enum WM_MDICASCADE = 0x00000227;
enum WM_MDIICONARRANGE = 0x00000228;
enum WM_MDIGETACTIVE = 0x00000229;
enum WM_MDISETMENU = 0x00000230;
enum WM_ENTERSIZEMOVE = 0x00000231;
enum WM_EXITSIZEMOVE = 0x00000232;
enum WM_DROPFILES = 0x00000233;
enum WM_MDIREFRESHMENU = 0x00000234;
enum WM_POINTERDEVICECHANGE = 0x00000238;
enum WM_POINTERDEVICEINRANGE = 0x00000239;
enum WM_POINTERDEVICEOUTOFRANGE = 0x0000023a;
enum WM_TOUCH = 0x00000240;
enum WM_NCPOINTERUPDATE = 0x00000241;
enum WM_NCPOINTERDOWN = 0x00000242;
enum WM_NCPOINTERUP = 0x00000243;
enum WM_POINTERUPDATE = 0x00000245;
enum WM_POINTERDOWN = 0x00000246;
enum WM_POINTERUP = 0x00000247;
enum WM_POINTERENTER = 0x00000249;
enum WM_POINTERLEAVE = 0x0000024a;
enum WM_POINTERACTIVATE = 0x0000024b;
enum WM_POINTERCAPTURECHANGED = 0x0000024c;
enum WM_TOUCHHITTESTING = 0x0000024d;
enum WM_POINTERWHEEL = 0x0000024e;
enum WM_POINTERHWHEEL = 0x0000024f;
enum DM_POINTERHITTEST = 0x00000250;
enum WM_POINTERROUTEDTO = 0x00000251;
enum WM_POINTERROUTEDAWAY = 0x00000252;
enum WM_POINTERROUTEDRELEASED = 0x00000253;
enum WM_IME_SETCONTEXT = 0x00000281;
enum WM_IME_NOTIFY = 0x00000282;
enum WM_IME_CONTROL = 0x00000283;
enum WM_IME_COMPOSITIONFULL = 0x00000284;
enum WM_IME_SELECT = 0x00000285;
enum WM_IME_CHAR = 0x00000286;
enum WM_IME_REQUEST = 0x00000288;
enum WM_IME_KEYDOWN = 0x00000290;
enum WM_IME_KEYUP = 0x00000291;
enum WM_NCMOUSEHOVER = 0x000002a0;
enum WM_NCMOUSELEAVE = 0x000002a2;
enum WM_WTSSESSION_CHANGE = 0x000002b1;
enum WM_TABLET_FIRST = 0x000002c0;
enum WM_TABLET_LAST = 0x000002df;
enum WM_DPICHANGED = 0x000002e0;
enum WM_DPICHANGED_BEFOREPARENT = 0x000002e2;
enum WM_DPICHANGED_AFTERPARENT = 0x000002e3;
enum WM_GETDPISCALEDSIZE = 0x000002e4;
enum WM_CUT = 0x00000300;
enum WM_COPY = 0x00000301;
enum WM_PASTE = 0x00000302;
enum WM_CLEAR = 0x00000303;
enum WM_UNDO = 0x00000304;
enum WM_RENDERFORMAT = 0x00000305;
enum WM_RENDERALLFORMATS = 0x00000306;
enum WM_DESTROYCLIPBOARD = 0x00000307;
enum WM_DRAWCLIPBOARD = 0x00000308;
enum WM_PAINTCLIPBOARD = 0x00000309;
enum WM_VSCROLLCLIPBOARD = 0x0000030a;
enum WM_SIZECLIPBOARD = 0x0000030b;
enum WM_ASKCBFORMATNAME = 0x0000030c;
enum WM_CHANGECBCHAIN = 0x0000030d;
enum WM_HSCROLLCLIPBOARD = 0x0000030e;
enum WM_QUERYNEWPALETTE = 0x0000030f;
enum WM_PALETTEISCHANGING = 0x00000310;
enum WM_PALETTECHANGED = 0x00000311;
enum WM_HOTKEY = 0x00000312;
enum WM_PRINT = 0x00000317;
enum WM_APPCOMMAND = 0x00000319;
enum WM_THEMECHANGED = 0x0000031a;
enum WM_CLIPBOARDUPDATE = 0x0000031d;
enum WM_DWMCOMPOSITIONCHANGED = 0x0000031e;
enum WM_DWMNCRENDERINGCHANGED = 0x0000031f;
enum WM_DWMCOLORIZATIONCOLORCHANGED = 0x00000320;
enum WM_DWMWINDOWMAXIMIZEDCHANGE = 0x00000321;
enum WM_DWMSENDICONICTHUMBNAIL = 0x00000323;
enum WM_DWMSENDICONICLIVEPREVIEWBITMAP = 0x00000326;
enum WM_GETTITLEBARINFOEX = 0x0000033f;
enum WM_HANDHELDFIRST = 0x00000358;
enum WM_HANDHELDLAST = 0x0000035f;
enum WM_AFXFIRST = 0x00000360;
enum WM_AFXLAST = 0x0000037f;
enum WM_PENWINFIRST = 0x00000380;
enum WM_PENWINLAST = 0x0000038f;
enum WM_APP = 0x00008000;
enum WM_USER = 0x00000400;
enum WMSZ_LEFT = 0x00000001;
enum WMSZ_RIGHT = 0x00000002;
enum WMSZ_TOP = 0x00000003;
enum WMSZ_TOPLEFT = 0x00000004;
enum WMSZ_TOPRIGHT = 0x00000005;
enum WMSZ_BOTTOM = 0x00000006;
enum WMSZ_BOTTOMLEFT = 0x00000007;
enum WMSZ_BOTTOMRIGHT = 0x00000008;
enum HTERROR = 0xfffffffffffffffe;
enum HTTRANSPARENT = 0xffffffffffffffff;
enum HTNOWHERE = 0x00000000;
enum HTCLIENT = 0x00000001;
enum HTCAPTION = 0x00000002;
enum HTSYSMENU = 0x00000003;
enum HTGROWBOX = 0x00000004;
enum HTSIZE = 0x00000004;
enum HTMENU = 0x00000005;
enum HTHSCROLL = 0x00000006;
enum HTVSCROLL = 0x00000007;
enum HTMINBUTTON = 0x00000008;
enum HTMAXBUTTON = 0x00000009;
enum HTLEFT = 0x0000000a;
enum HTRIGHT = 0x0000000b;
enum HTTOP = 0x0000000c;
enum HTTOPLEFT = 0x0000000d;
enum HTTOPRIGHT = 0x0000000e;
enum HTBOTTOM = 0x0000000f;
enum HTBOTTOMLEFT = 0x00000010;
enum HTBOTTOMRIGHT = 0x00000011;
enum HTBORDER = 0x00000012;
enum HTREDUCE = 0x00000008;
enum HTZOOM = 0x00000009;
enum HTSIZEFIRST = 0x0000000a;
enum HTSIZELAST = 0x00000011;
enum HTOBJECT = 0x00000013;
enum HTCLOSE = 0x00000014;
enum HTHELP = 0x00000015;
enum MA_ACTIVATE = 0x00000001;
enum MA_ACTIVATEANDEAT = 0x00000002;
enum MA_NOACTIVATE = 0x00000003;
enum MA_NOACTIVATEANDEAT = 0x00000004;
enum ICON_SMALL = 0x00000000;
enum ICON_BIG = 0x00000001;
enum ICON_SMALL2 = 0x00000002;
enum SIZE_RESTORED = 0x00000000;
enum SIZE_MINIMIZED = 0x00000001;
enum SIZE_MAXIMIZED = 0x00000002;
enum SIZE_MAXSHOW = 0x00000003;
enum SIZE_MAXHIDE = 0x00000004;
enum SIZENORMAL = 0x00000000;
enum SIZEICONIC = 0x00000001;
enum SIZEFULLSCREEN = 0x00000002;
enum SIZEZOOMSHOW = 0x00000003;
enum SIZEZOOMHIDE = 0x00000004;
enum WVR_ALIGNTOP = 0x00000010;
enum WVR_ALIGNLEFT = 0x00000020;
enum WVR_ALIGNBOTTOM = 0x00000040;
enum WVR_ALIGNRIGHT = 0x00000080;
enum WVR_HREDRAW = 0x00000100;
enum WVR_VREDRAW = 0x00000200;
enum WVR_VALIDRECTS = 0x00000400;
enum MK_LBUTTON = 0x00000001;
enum MK_RBUTTON = 0x00000002;
enum MK_SHIFT = 0x00000004;
enum MK_CONTROL = 0x00000008;
enum MK_MBUTTON = 0x00000010;
enum MK_XBUTTON1 = 0x00000020;
enum MK_XBUTTON2 = 0x00000040;
enum PRF_CHECKVISIBLE = 0x00000001;
enum PRF_NONCLIENT = 0x00000002;
enum PRF_CLIENT = 0x00000004;
enum PRF_ERASEBKGND = 0x00000008;
enum PRF_CHILDREN = 0x00000010;
enum PRF_OWNED = 0x00000020;
enum IDANI_OPEN = 0x00000001;
enum IDANI_CAPTION = 0x00000003;
enum FVIRTKEY = 0x00000001;
enum FNOINVERT = 0x00000002;
enum FSHIFT = 0x00000004;
enum FCONTROL = 0x00000008;
enum FALT = 0x00000010;
enum ODA_DRAWENTIRE = 0x00000001;
enum ODA_SELECT = 0x00000002;
enum ODA_FOCUS = 0x00000004;
enum ODS_SELECTED = 0x00000001;
enum ODS_GRAYED = 0x00000002;
enum ODS_DISABLED = 0x00000004;
enum ODS_CHECKED = 0x00000008;
enum ODS_FOCUS = 0x00000010;
enum ODS_DEFAULT = 0x00000020;
enum ODS_COMBOBOXEDIT = 0x00001000;
enum ODS_HOTLIGHT = 0x00000040;
enum ODS_INACTIVE = 0x00000080;
enum ODS_NOACCEL = 0x00000100;
enum ODS_NOFOCUSRECT = 0x00000200;
enum IDHOT_SNAPWINDOW = 0xffffffffffffffff;
enum IDHOT_SNAPDESKTOP = 0xfffffffffffffffe;
enum ENDSESSION_CLOSEAPP = 0x00000001;
enum ENDSESSION_CRITICAL = 0x40000000;
enum ENDSESSION_LOGOFF = 0x80000000;
enum EWX_FORCE = 0x00000004;
enum EWX_FORCEIFHUNG = 0x00000010;
enum EWX_QUICKRESOLVE = 0x00000020;
enum EWX_BOOTOPTIONS = 0x01000000;
enum EWX_ARSO = 0x04000000;
enum EWX_CHECK_SAFE_FOR_SERVER = 0x08000000;
enum EWX_SYSTEM_INITIATED = 0x10000000;
enum BROADCAST_QUERY_DENY = 0x424d5144;
enum DEVICE_NOTIFY_ALL_INTERFACE_CLASSES = 0x00000004;
enum HWND_MESSAGE = 0xfffffffffffffffd;
enum ISMEX_NOSEND = 0x00000000;
enum ISMEX_SEND = 0x00000001;
enum ISMEX_NOTIFY = 0x00000002;
enum ISMEX_CALLBACK = 0x00000004;
enum ISMEX_REPLIED = 0x00000008;
enum HWND_DESKTOP = 0x00000000;
enum PW_RENDERFULLCONTENT = 0x00000002;
enum HWND_TOP = 0x00000000;
enum HWND_BOTTOM = 0x00000001;
enum HWND_TOPMOST = 0xffffffffffffffff;
enum HWND_NOTOPMOST = 0xfffffffffffffffe;
enum DLGWINDOWEXTRA = 0x0000001e;
enum POINTER_MOD_SHIFT = 0x00000004;
enum POINTER_MOD_CTRL = 0x00000008;
enum TOUCH_FLAG_NONE = 0x00000000;
enum TOUCH_MASK_NONE = 0x00000000;
enum TOUCH_MASK_CONTACTAREA = 0x00000001;
enum TOUCH_MASK_ORIENTATION = 0x00000002;
enum TOUCH_MASK_PRESSURE = 0x00000004;
enum PEN_FLAG_NONE = 0x00000000;
enum PEN_FLAG_BARREL = 0x00000001;
enum PEN_FLAG_INVERTED = 0x00000002;
enum PEN_FLAG_ERASER = 0x00000004;
enum PEN_MASK_NONE = 0x00000000;
enum PEN_MASK_PRESSURE = 0x00000001;
enum PEN_MASK_ROTATION = 0x00000002;
enum PEN_MASK_TILT_X = 0x00000004;
enum PEN_MASK_TILT_Y = 0x00000008;
enum POINTER_MESSAGE_FLAG_NEW = 0x00000001;
enum POINTER_MESSAGE_FLAG_INRANGE = 0x00000002;
enum POINTER_MESSAGE_FLAG_INCONTACT = 0x00000004;
enum POINTER_MESSAGE_FLAG_FIRSTBUTTON = 0x00000010;
enum POINTER_MESSAGE_FLAG_SECONDBUTTON = 0x00000020;
enum POINTER_MESSAGE_FLAG_THIRDBUTTON = 0x00000040;
enum POINTER_MESSAGE_FLAG_FOURTHBUTTON = 0x00000080;
enum POINTER_MESSAGE_FLAG_FIFTHBUTTON = 0x00000100;
enum POINTER_MESSAGE_FLAG_PRIMARY = 0x00002000;
enum POINTER_MESSAGE_FLAG_CONFIDENCE = 0x00004000;
enum POINTER_MESSAGE_FLAG_CANCELED = 0x00008000;
enum PA_ACTIVATE = 0x00000001;
enum PA_NOACTIVATE = 0x00000003;
enum MAX_TOUCH_COUNT = 0x00000100;
enum TOUCH_HIT_TESTING_DEFAULT = 0x00000000;
enum TOUCH_HIT_TESTING_CLIENT = 0x00000001;
enum TOUCH_HIT_TESTING_NONE = 0x00000002;
enum TOUCH_HIT_TESTING_PROXIMITY_CLOSEST = 0x00000000;
enum TOUCH_HIT_TESTING_PROXIMITY_FARTHEST = 0x00000fff;
enum GWFS_INCLUDE_ANCESTORS = 0x00000001;
enum MAPVK_VK_TO_VSC = 0x00000000;
enum MAPVK_VSC_TO_VK = 0x00000001;
enum MAPVK_VK_TO_CHAR = 0x00000002;
enum MAPVK_VSC_TO_VK_EX = 0x00000003;
enum MAPVK_VK_TO_VSC_EX = 0x00000004;
enum QS_TOUCH = 0x00000800;
enum QS_POINTER = 0x00001000;
enum USER_TIMER_MAXIMUM = 0x7fffffff;
enum USER_TIMER_MINIMUM = 0x0000000a;
enum TIMERV_DEFAULT_COALESCING = 0x00000000;
enum TIMERV_NO_COALESCING = 0xffffffff;
enum TIMERV_COALESCING_MIN = 0x00000001;
enum TIMERV_COALESCING_MAX = 0x7ffffff5;
enum SM_RESERVED1 = 0x00000018;
enum SM_RESERVED2 = 0x00000019;
enum SM_RESERVED3 = 0x0000001a;
enum SM_RESERVED4 = 0x0000001b;
enum SM_CMETRICS = 0x0000004c;
enum SM_CARETBLINKINGENABLED = 0x00002002;
enum PMB_ACTIVE = 0x00000001;
enum MNC_IGNORE = 0x00000000;
enum MNC_CLOSE = 0x00000001;
enum MNC_EXECUTE = 0x00000002;
enum MNC_SELECT = 0x00000003;
enum MND_CONTINUE = 0x00000000;
enum MND_ENDMENU = 0x00000001;
enum MNGO_NOINTERFACE = 0x00000000;
enum MNGO_NOERROR = 0x00000001;
enum DOF_EXECUTABLE = 0x00008001;
enum DOF_DOCUMENT = 0x00008002;
enum DOF_DIRECTORY = 0x00008003;
enum DOF_MULTIPLE = 0x00008004;
enum DOF_PROGMAN = 0x00000001;
enum DOF_SHELLDATA = 0x00000002;
enum DO_DROPFILE = 0x454c4946;
enum DO_PRINTFILE = 0x544e5250;
enum ASFW_ANY = 0xffffffff;
enum DCX_EXCLUDEUPDATE = 0x00000100;
enum HELPINFO_WINDOW = 0x00000001;
enum HELPINFO_MENUITEM = 0x00000002;
enum CTLCOLOR_MSGBOX = 0x00000000;
enum CTLCOLOR_EDIT = 0x00000001;
enum CTLCOLOR_LISTBOX = 0x00000002;
enum CTLCOLOR_BTN = 0x00000003;
enum CTLCOLOR_DLG = 0x00000004;
enum CTLCOLOR_SCROLLBAR = 0x00000005;
enum CTLCOLOR_STATIC = 0x00000006;
enum CTLCOLOR_MAX = 0x00000007;
enum GW_MAX = 0x00000005;
enum SC_SIZE = 0x0000f000;
enum SC_MOVE = 0x0000f010;
enum SC_MINIMIZE = 0x0000f020;
enum SC_MAXIMIZE = 0x0000f030;
enum SC_NEXTWINDOW = 0x0000f040;
enum SC_PREVWINDOW = 0x0000f050;
enum SC_CLOSE = 0x0000f060;
enum SC_VSCROLL = 0x0000f070;
enum SC_HSCROLL = 0x0000f080;
enum SC_MOUSEMENU = 0x0000f090;
enum SC_KEYMENU = 0x0000f100;
enum SC_ARRANGE = 0x0000f110;
enum SC_RESTORE = 0x0000f120;
enum SC_TASKLIST = 0x0000f130;
enum SC_HOTKEY = 0x0000f150;
enum SC_DEFAULT = 0x0000f160;
enum SC_MONITORPOWER = 0x0000f170;
enum SC_CONTEXTHELP = 0x0000f180;
enum SC_SEPARATOR = 0x0000f00f;
enum SCF_ISSECURE = 0x00000001;
enum SC_ICON = 0x0000f020;
enum SC_ZOOM = 0x0000f030;
enum IDC_ARROW = 0x00007f00;
enum IDC_IBEAM = 0x00007f01;
enum IDC_WAIT = 0x00007f02;
enum IDC_CROSS = 0x00007f03;
enum IDC_UPARROW = 0x00007f04;
enum IDC_SIZE = 0x00007f80;
enum IDC_ICON = 0x00007f81;
enum IDC_SIZENWSE = 0x00007f82;
enum IDC_SIZENESW = 0x00007f83;
enum IDC_SIZEWE = 0x00007f84;
enum IDC_SIZENS = 0x00007f85;
enum IDC_SIZEALL = 0x00007f86;
enum IDC_NO = 0x00007f88;
enum IDC_HAND = 0x00007f89;
enum IDC_APPSTARTING = 0x00007f8a;
enum IDC_HELP = 0x00007f8b;
enum IDC_PIN = 0x00007f9f;
enum IDC_PERSON = 0x00007fa0;
enum CURSOR_CREATION_SCALING_NONE = 0x00000001;
enum CURSOR_CREATION_SCALING_DEFAULT = 0x00000002;
enum IMAGE_ENHMETAFILE = 0x00000003;
enum LR_COLOR = 0x00000002;
enum RES_ICON = 0x00000001;
enum RES_CURSOR = 0x00000002;
enum OBM_CLOSE = 0x00007ff2;
enum OBM_UPARROW = 0x00007ff1;
enum OBM_DNARROW = 0x00007ff0;
enum OBM_RGARROW = 0x00007fef;
enum OBM_LFARROW = 0x00007fee;
enum OBM_REDUCE = 0x00007fed;
enum OBM_ZOOM = 0x00007fec;
enum OBM_RESTORE = 0x00007feb;
enum OBM_REDUCED = 0x00007fea;
enum OBM_ZOOMD = 0x00007fe9;
enum OBM_RESTORED = 0x00007fe8;
enum OBM_UPARROWD = 0x00007fe7;
enum OBM_DNARROWD = 0x00007fe6;
enum OBM_RGARROWD = 0x00007fe5;
enum OBM_LFARROWD = 0x00007fe4;
enum OBM_MNARROW = 0x00007fe3;
enum OBM_COMBO = 0x00007fe2;
enum OBM_UPARROWI = 0x00007fe1;
enum OBM_DNARROWI = 0x00007fe0;
enum OBM_RGARROWI = 0x00007fdf;
enum OBM_LFARROWI = 0x00007fde;
enum OBM_OLD_CLOSE = 0x00007fff;
enum OBM_SIZE = 0x00007ffe;
enum OBM_OLD_UPARROW = 0x00007ffd;
enum OBM_OLD_DNARROW = 0x00007ffc;
enum OBM_OLD_RGARROW = 0x00007ffb;
enum OBM_OLD_LFARROW = 0x00007ffa;
enum OBM_BTSIZE = 0x00007ff9;
enum OBM_CHECK = 0x00007ff8;
enum OBM_CHECKBOXES = 0x00007ff7;
enum OBM_BTNCORNERS = 0x00007ff6;
enum OBM_OLD_REDUCE = 0x00007ff5;
enum OBM_OLD_ZOOM = 0x00007ff4;
enum OBM_OLD_RESTORE = 0x00007ff3;
enum OCR_SIZE = 0x00007f80;
enum OCR_ICON = 0x00007f81;
enum OCR_ICOCUR = 0x00007f87;
enum OIC_SAMPLE = 0x00007f00;
enum OIC_HAND = 0x00007f01;
enum OIC_QUES = 0x00007f02;
enum OIC_BANG = 0x00007f03;
enum OIC_NOTE = 0x00007f04;
enum OIC_WINLOGO = 0x00007f05;
enum OIC_WARNING = 0x00007f03;
enum OIC_ERROR = 0x00007f01;
enum OIC_INFORMATION = 0x00007f04;
enum OIC_SHIELD = 0x00007f06;
enum ORD_LANGDRIVER = 0x00000001;
enum IDI_APPLICATION = 0x00007f00;
enum IDI_HAND = 0x00007f01;
enum IDI_QUESTION = 0x00007f02;
enum IDI_EXCLAMATION = 0x00007f03;
enum IDI_ASTERISK = 0x00007f04;
enum IDI_WINLOGO = 0x00007f05;
enum IDI_SHIELD = 0x00007f06;
enum IDI_WARNING = 0x00007f03;
enum IDI_ERROR = 0x00007f01;
enum IDI_INFORMATION = 0x00007f04;
enum ES_LEFT = 0x00000000;
enum ES_CENTER = 0x00000001;
enum ES_RIGHT = 0x00000002;
enum ES_MULTILINE = 0x00000004;
enum ES_UPPERCASE = 0x00000008;
enum ES_LOWERCASE = 0x00000010;
enum ES_PASSWORD = 0x00000020;
enum ES_AUTOVSCROLL = 0x00000040;
enum ES_AUTOHSCROLL = 0x00000080;
enum ES_NOHIDESEL = 0x00000100;
enum ES_OEMCONVERT = 0x00000400;
enum ES_READONLY = 0x00000800;
enum ES_WANTRETURN = 0x00001000;
enum ES_NUMBER = 0x00002000;
enum EN_SETFOCUS = 0x00000100;
enum EN_KILLFOCUS = 0x00000200;
enum EN_CHANGE = 0x00000300;
enum EN_UPDATE = 0x00000400;
enum EN_ERRSPACE = 0x00000500;
enum EN_MAXTEXT = 0x00000501;
enum EN_HSCROLL = 0x00000601;
enum EN_VSCROLL = 0x00000602;
enum EN_ALIGN_LTR_EC = 0x00000700;
enum EN_ALIGN_RTL_EC = 0x00000701;
enum EN_BEFORE_PASTE = 0x00000800;
enum EN_AFTER_PASTE = 0x00000801;
enum EC_LEFTMARGIN = 0x00000001;
enum EC_RIGHTMARGIN = 0x00000002;
enum EC_USEFONTINFO = 0x0000ffff;
enum EMSIS_COMPOSITIONSTRING = 0x00000001;
enum EIMES_GETCOMPSTRATONCE = 0x00000001;
enum EIMES_CANCELCOMPSTRINFOCUS = 0x00000002;
enum EIMES_COMPLETECOMPSTRKILLFOCUS = 0x00000004;
enum BS_PUSHBUTTON = 0x00000000;
enum BS_DEFPUSHBUTTON = 0x00000001;
enum BS_CHECKBOX = 0x00000002;
enum BS_AUTOCHECKBOX = 0x00000003;
enum BS_RADIOBUTTON = 0x00000004;
enum BS_3STATE = 0x00000005;
enum BS_AUTO3STATE = 0x00000006;
enum BS_GROUPBOX = 0x00000007;
enum BS_USERBUTTON = 0x00000008;
enum BS_AUTORADIOBUTTON = 0x00000009;
enum BS_PUSHBOX = 0x0000000a;
enum BS_OWNERDRAW = 0x0000000b;
enum BS_TYPEMASK = 0x0000000f;
enum BS_LEFTTEXT = 0x00000020;
enum BS_TEXT = 0x00000000;
enum BS_ICON = 0x00000040;
enum BS_BITMAP = 0x00000080;
enum BS_LEFT = 0x00000100;
enum BS_RIGHT = 0x00000200;
enum BS_CENTER = 0x00000300;
enum BS_TOP = 0x00000400;
enum BS_BOTTOM = 0x00000800;
enum BS_VCENTER = 0x00000c00;
enum BS_PUSHLIKE = 0x00001000;
enum BS_MULTILINE = 0x00002000;
enum BS_NOTIFY = 0x00004000;
enum BS_FLAT = 0x00008000;
enum BS_RIGHTBUTTON = 0x00000020;
enum BN_CLICKED = 0x00000000;
enum BN_PAINT = 0x00000001;
enum BN_HILITE = 0x00000002;
enum BN_UNHILITE = 0x00000003;
enum BN_DISABLE = 0x00000004;
enum BN_DOUBLECLICKED = 0x00000005;
enum BN_PUSHED = 0x00000002;
enum BN_UNPUSHED = 0x00000003;
enum BN_DBLCLK = 0x00000005;
enum BN_SETFOCUS = 0x00000006;
enum BN_KILLFOCUS = 0x00000007;
enum BM_GETCHECK = 0x000000f0;
enum BM_SETCHECK = 0x000000f1;
enum BM_GETSTATE = 0x000000f2;
enum BM_SETSTATE = 0x000000f3;
enum BM_SETSTYLE = 0x000000f4;
enum BM_CLICK = 0x000000f5;
enum BM_GETIMAGE = 0x000000f6;
enum BM_SETIMAGE = 0x000000f7;
enum BM_SETDONTCLICK = 0x000000f8;
enum BST_PUSHED = 0x00000004;
enum BST_FOCUS = 0x00000008;
enum SS_LEFT = 0x00000000;
enum SS_CENTER = 0x00000001;
enum SS_RIGHT = 0x00000002;
enum SS_ICON = 0x00000003;
enum SS_BLACKRECT = 0x00000004;
enum SS_GRAYRECT = 0x00000005;
enum SS_WHITERECT = 0x00000006;
enum SS_BLACKFRAME = 0x00000007;
enum SS_GRAYFRAME = 0x00000008;
enum SS_WHITEFRAME = 0x00000009;
enum SS_USERITEM = 0x0000000a;
enum SS_SIMPLE = 0x0000000b;
enum SS_LEFTNOWORDWRAP = 0x0000000c;
enum SS_OWNERDRAW = 0x0000000d;
enum SS_BITMAP = 0x0000000e;
enum SS_ENHMETAFILE = 0x0000000f;
enum SS_ETCHEDHORZ = 0x00000010;
enum SS_ETCHEDVERT = 0x00000011;
enum SS_ETCHEDFRAME = 0x00000012;
enum SS_TYPEMASK = 0x0000001f;
enum SS_REALSIZECONTROL = 0x00000040;
enum SS_NOPREFIX = 0x00000080;
enum SS_NOTIFY = 0x00000100;
enum SS_CENTERIMAGE = 0x00000200;
enum SS_RIGHTJUST = 0x00000400;
enum SS_REALSIZEIMAGE = 0x00000800;
enum SS_SUNKEN = 0x00001000;
enum SS_EDITCONTROL = 0x00002000;
enum SS_ENDELLIPSIS = 0x00004000;
enum SS_PATHELLIPSIS = 0x00008000;
enum SS_WORDELLIPSIS = 0x0000c000;
enum SS_ELLIPSISMASK = 0x0000c000;
enum STM_SETICON = 0x00000170;
enum STM_GETICON = 0x00000171;
enum STM_SETIMAGE = 0x00000172;
enum STM_GETIMAGE = 0x00000173;
enum STN_CLICKED = 0x00000000;
enum STN_DBLCLK = 0x00000001;
enum STN_ENABLE = 0x00000002;
enum STN_DISABLE = 0x00000003;
enum STM_MSGMAX = 0x00000174;
enum DWL_MSGRESULT = 0x00000000;
enum DWL_DLGPROC = 0x00000004;
enum DWL_USER = 0x00000008;
enum DWLP_MSGRESULT = 0x00000000;
enum DS_ABSALIGN = 0x00000001;
enum DS_SYSMODAL = 0x00000002;
enum DS_LOCALEDIT = 0x00000020;
enum DS_SETFONT = 0x00000040;
enum DS_MODALFRAME = 0x00000080;
enum DS_NOIDLEMSG = 0x00000100;
enum DS_SETFOREGROUND = 0x00000200;
enum DS_3DLOOK = 0x00000004;
enum DS_FIXEDSYS = 0x00000008;
enum DS_NOFAILCREATE = 0x00000010;
enum DS_CONTROL = 0x00000400;
enum DS_CENTER = 0x00000800;
enum DS_CENTERMOUSE = 0x00001000;
enum DS_CONTEXTHELP = 0x00002000;
enum DS_USEPIXELS = 0x00008000;
enum DM_GETDEFID = 0x00000400;
enum DM_SETDEFID = 0x00000401;
enum DM_REPOSITION = 0x00000402;
enum DC_HASDEFID = 0x0000534b;
enum DLGC_WANTARROWS = 0x00000001;
enum DLGC_WANTTAB = 0x00000002;
enum DLGC_WANTALLKEYS = 0x00000004;
enum DLGC_WANTMESSAGE = 0x00000004;
enum DLGC_HASSETSEL = 0x00000008;
enum DLGC_DEFPUSHBUTTON = 0x00000010;
enum DLGC_UNDEFPUSHBUTTON = 0x00000020;
enum DLGC_RADIOBUTTON = 0x00000040;
enum DLGC_WANTCHARS = 0x00000080;
enum DLGC_STATIC = 0x00000100;
enum DLGC_BUTTON = 0x00002000;
enum LB_CTLCODE = 0x00000000;
enum LB_OKAY = 0x00000000;
enum LB_ERR = 0xffffffffffffffff;
enum LB_ERRSPACE = 0xfffffffffffffffe;
enum LBN_ERRSPACE = 0xfffffffffffffffe;
enum LBN_SELCHANGE = 0x00000001;
enum LBN_DBLCLK = 0x00000002;
enum LBN_SELCANCEL = 0x00000003;
enum LBN_SETFOCUS = 0x00000004;
enum LBN_KILLFOCUS = 0x00000005;
enum LB_ADDSTRING = 0x00000180;
enum LB_INSERTSTRING = 0x00000181;
enum LB_DELETESTRING = 0x00000182;
enum LB_SELITEMRANGEEX = 0x00000183;
enum LB_RESETCONTENT = 0x00000184;
enum LB_SETSEL = 0x00000185;
enum LB_SETCURSEL = 0x00000186;
enum LB_GETSEL = 0x00000187;
enum LB_GETCURSEL = 0x00000188;
enum LB_GETTEXT = 0x00000189;
enum LB_GETTEXTLEN = 0x0000018a;
enum LB_GETCOUNT = 0x0000018b;
enum LB_SELECTSTRING = 0x0000018c;
enum LB_DIR = 0x0000018d;
enum LB_GETTOPINDEX = 0x0000018e;
enum LB_FINDSTRING = 0x0000018f;
enum LB_GETSELCOUNT = 0x00000190;
enum LB_GETSELITEMS = 0x00000191;
enum LB_SETTABSTOPS = 0x00000192;
enum LB_GETHORIZONTALEXTENT = 0x00000193;
enum LB_SETHORIZONTALEXTENT = 0x00000194;
enum LB_SETCOLUMNWIDTH = 0x00000195;
enum LB_ADDFILE = 0x00000196;
enum LB_SETTOPINDEX = 0x00000197;
enum LB_GETITEMRECT = 0x00000198;
enum LB_GETITEMDATA = 0x00000199;
enum LB_SETITEMDATA = 0x0000019a;
enum LB_SELITEMRANGE = 0x0000019b;
enum LB_SETANCHORINDEX = 0x0000019c;
enum LB_GETANCHORINDEX = 0x0000019d;
enum LB_SETCARETINDEX = 0x0000019e;
enum LB_GETCARETINDEX = 0x0000019f;
enum LB_SETITEMHEIGHT = 0x000001a0;
enum LB_GETITEMHEIGHT = 0x000001a1;
enum LB_FINDSTRINGEXACT = 0x000001a2;
enum LB_SETLOCALE = 0x000001a5;
enum LB_GETLOCALE = 0x000001a6;
enum LB_SETCOUNT = 0x000001a7;
enum LB_INITSTORAGE = 0x000001a8;
enum LB_ITEMFROMPOINT = 0x000001a9;
enum LB_MULTIPLEADDSTRING = 0x000001b1;
enum LB_GETLISTBOXINFO = 0x000001b2;
enum LB_MSGMAX = 0x000001b3;
enum LBS_NOTIFY = 0x00000001;
enum LBS_SORT = 0x00000002;
enum LBS_NOREDRAW = 0x00000004;
enum LBS_MULTIPLESEL = 0x00000008;
enum LBS_OWNERDRAWFIXED = 0x00000010;
enum LBS_OWNERDRAWVARIABLE = 0x00000020;
enum LBS_HASSTRINGS = 0x00000040;
enum LBS_USETABSTOPS = 0x00000080;
enum LBS_NOINTEGRALHEIGHT = 0x00000100;
enum LBS_MULTICOLUMN = 0x00000200;
enum LBS_WANTKEYBOARDINPUT = 0x00000400;
enum LBS_EXTENDEDSEL = 0x00000800;
enum LBS_DISABLENOSCROLL = 0x00001000;
enum LBS_NODATA = 0x00002000;
enum LBS_NOSEL = 0x00004000;
enum LBS_COMBOBOX = 0x00008000;
enum CB_OKAY = 0x00000000;
enum CB_ERR = 0xffffffffffffffff;
enum CB_ERRSPACE = 0xfffffffffffffffe;
enum CBN_ERRSPACE = 0xffffffffffffffff;
enum CBN_SELCHANGE = 0x00000001;
enum CBN_DBLCLK = 0x00000002;
enum CBN_SETFOCUS = 0x00000003;
enum CBN_KILLFOCUS = 0x00000004;
enum CBN_EDITCHANGE = 0x00000005;
enum CBN_EDITUPDATE = 0x00000006;
enum CBN_DROPDOWN = 0x00000007;
enum CBN_CLOSEUP = 0x00000008;
enum CBN_SELENDOK = 0x00000009;
enum CBN_SELENDCANCEL = 0x0000000a;
enum CBS_SIMPLE = 0x00000001;
enum CBS_DROPDOWN = 0x00000002;
enum CBS_DROPDOWNLIST = 0x00000003;
enum CBS_OWNERDRAWFIXED = 0x00000010;
enum CBS_OWNERDRAWVARIABLE = 0x00000020;
enum CBS_AUTOHSCROLL = 0x00000040;
enum CBS_OEMCONVERT = 0x00000080;
enum CBS_SORT = 0x00000100;
enum CBS_HASSTRINGS = 0x00000200;
enum CBS_NOINTEGRALHEIGHT = 0x00000400;
enum CBS_DISABLENOSCROLL = 0x00000800;
enum CBS_UPPERCASE = 0x00002000;
enum CBS_LOWERCASE = 0x00004000;
enum CB_GETEDITSEL = 0x00000140;
enum CB_LIMITTEXT = 0x00000141;
enum CB_SETEDITSEL = 0x00000142;
enum CB_ADDSTRING = 0x00000143;
enum CB_DELETESTRING = 0x00000144;
enum CB_DIR = 0x00000145;
enum CB_GETCOUNT = 0x00000146;
enum CB_GETCURSEL = 0x00000147;
enum CB_GETLBTEXT = 0x00000148;
enum CB_GETLBTEXTLEN = 0x00000149;
enum CB_INSERTSTRING = 0x0000014a;
enum CB_RESETCONTENT = 0x0000014b;
enum CB_FINDSTRING = 0x0000014c;
enum CB_SELECTSTRING = 0x0000014d;
enum CB_SETCURSEL = 0x0000014e;
enum CB_SHOWDROPDOWN = 0x0000014f;
enum CB_GETITEMDATA = 0x00000150;
enum CB_SETITEMDATA = 0x00000151;
enum CB_GETDROPPEDCONTROLRECT = 0x00000152;
enum CB_SETITEMHEIGHT = 0x00000153;
enum CB_GETITEMHEIGHT = 0x00000154;
enum CB_SETEXTENDEDUI = 0x00000155;
enum CB_GETEXTENDEDUI = 0x00000156;
enum CB_GETDROPPEDSTATE = 0x00000157;
enum CB_FINDSTRINGEXACT = 0x00000158;
enum CB_SETLOCALE = 0x00000159;
enum CB_GETLOCALE = 0x0000015a;
enum CB_GETTOPINDEX = 0x0000015b;
enum CB_SETTOPINDEX = 0x0000015c;
enum CB_GETHORIZONTALEXTENT = 0x0000015d;
enum CB_SETHORIZONTALEXTENT = 0x0000015e;
enum CB_GETDROPPEDWIDTH = 0x0000015f;
enum CB_SETDROPPEDWIDTH = 0x00000160;
enum CB_INITSTORAGE = 0x00000161;
enum CB_MULTIPLEADDSTRING = 0x00000163;
enum CB_GETCOMBOBOXINFO = 0x00000164;
enum CB_MSGMAX = 0x00000165;
enum SBS_HORZ = 0x00000000;
enum SBS_VERT = 0x00000001;
enum SBS_TOPALIGN = 0x00000002;
enum SBS_LEFTALIGN = 0x00000002;
enum SBS_BOTTOMALIGN = 0x00000004;
enum SBS_RIGHTALIGN = 0x00000004;
enum SBS_SIZEBOXTOPLEFTALIGN = 0x00000002;
enum SBS_SIZEBOXBOTTOMRIGHTALIGN = 0x00000004;
enum SBS_SIZEBOX = 0x00000008;
enum SBS_SIZEGRIP = 0x00000010;
enum SBM_SETPOS = 0x000000e0;
enum SBM_GETPOS = 0x000000e1;
enum SBM_SETRANGE = 0x000000e2;
enum SBM_SETRANGEREDRAW = 0x000000e6;
enum SBM_GETRANGE = 0x000000e3;
enum SBM_ENABLE_ARROWS = 0x000000e4;
enum SBM_SETSCROLLINFO = 0x000000e9;
enum SBM_GETSCROLLINFO = 0x000000ea;
enum SBM_GETSCROLLBARINFO = 0x000000eb;
enum MDIS_ALLCHILDSTYLES = 0x00000001;
enum HELP_CONTEXT = 0x00000001;
enum HELP_QUIT = 0x00000002;
enum HELP_INDEX = 0x00000003;
enum HELP_CONTENTS = 0x00000003;
enum HELP_HELPONHELP = 0x00000004;
enum HELP_SETINDEX = 0x00000005;
enum HELP_SETCONTENTS = 0x00000005;
enum HELP_CONTEXTPOPUP = 0x00000008;
enum HELP_FORCEFILE = 0x00000009;
enum HELP_KEY = 0x00000101;
enum HELP_COMMAND = 0x00000102;
enum HELP_PARTIALKEY = 0x00000105;
enum HELP_MULTIKEY = 0x00000201;
enum HELP_SETWINPOS = 0x00000203;
enum HELP_CONTEXTMENU = 0x0000000a;
enum HELP_FINDER = 0x0000000b;
enum HELP_WM_HELP = 0x0000000c;
enum HELP_SETPOPUP_POS = 0x0000000d;
enum HELP_TCARD = 0x00008000;
enum HELP_TCARD_DATA = 0x00000010;
enum HELP_TCARD_OTHER_CALLER = 0x00000011;
enum IDH_NO_HELP = 0x00006f18;
enum IDH_MISSING_CONTEXT = 0x00006f19;
enum IDH_GENERIC_HELP_BUTTON = 0x00006f1a;
enum IDH_OK = 0x00006f1b;
enum IDH_CANCEL = 0x00006f1c;
enum IDH_HELP = 0x00006f1d;
enum MAX_TOUCH_PREDICTION_FILTER_TAPS = 0x00000003;
enum TOUCHPREDICTIONPARAMETERS_DEFAULT_LATENCY = 0x00000008;
enum TOUCHPREDICTIONPARAMETERS_DEFAULT_SAMPLETIME = 0x00000008;
enum TOUCHPREDICTIONPARAMETERS_DEFAULT_USE_HW_TIMESTAMP = 0x00000001;
enum TOUCHPREDICTIONPARAMETERS_DEFAULT_RLS_DELTA = 0.001000;
enum TOUCHPREDICTIONPARAMETERS_DEFAULT_RLS_LAMBDA_MIN = 0.900000;
enum TOUCHPREDICTIONPARAMETERS_DEFAULT_RLS_LAMBDA_MAX = 0.999000;
enum TOUCHPREDICTIONPARAMETERS_DEFAULT_RLS_LAMBDA_LEARNING_RATE = 0.001000;
enum TOUCHPREDICTIONPARAMETERS_DEFAULT_RLS_EXPO_SMOOTH_ALPHA = 0.990000;
enum MAX_LOGICALDPIOVERRIDE = 0x00000002;
enum MIN_LOGICALDPIOVERRIDE = 0xfffffffffffffffe;
enum FE_FONTSMOOTHINGSTANDARD = 0x00000001;
enum FE_FONTSMOOTHINGCLEARTYPE = 0x00000002;
enum FE_FONTSMOOTHINGORIENTATIONBGR = 0x00000000;
enum FE_FONTSMOOTHINGORIENTATIONRGB = 0x00000001;
enum CONTACTVISUALIZATION_OFF = 0x00000000;
enum CONTACTVISUALIZATION_ON = 0x00000001;
enum CONTACTVISUALIZATION_PRESENTATIONMODE = 0x00000002;
enum GESTUREVISUALIZATION_OFF = 0x00000000;
enum GESTUREVISUALIZATION_ON = 0x0000001f;
enum GESTUREVISUALIZATION_TAP = 0x00000001;
enum GESTUREVISUALIZATION_DOUBLETAP = 0x00000002;
enum GESTUREVISUALIZATION_PRESSANDTAP = 0x00000004;
enum GESTUREVISUALIZATION_PRESSANDHOLD = 0x00000008;
enum GESTUREVISUALIZATION_RIGHTTAP = 0x00000010;
enum MOUSEWHEEL_ROUTING_FOCUS = 0x00000000;
enum MOUSEWHEEL_ROUTING_HYBRID = 0x00000001;
enum MOUSEWHEEL_ROUTING_MOUSE_POS = 0x00000002;
enum PENVISUALIZATION_ON = 0x00000023;
enum PENVISUALIZATION_OFF = 0x00000000;
enum PENVISUALIZATION_TAP = 0x00000001;
enum PENVISUALIZATION_DOUBLETAP = 0x00000002;
enum PENVISUALIZATION_CURSOR = 0x00000020;
enum PENARBITRATIONTYPE_NONE = 0x00000000;
enum PENARBITRATIONTYPE_WIN8 = 0x00000001;
enum PENARBITRATIONTYPE_FIS = 0x00000002;
enum PENARBITRATIONTYPE_SPT = 0x00000003;
enum PENARBITRATIONTYPE_MAX = 0x00000004;
enum METRICS_USEDEFAULT = 0xffffffffffffffff;
enum ARW_STARTMASK = 0x00000003;
enum ARW_STARTRIGHT = 0x00000001;
enum ARW_STARTTOP = 0x00000002;
enum ARW_LEFT = 0x00000000;
enum ARW_RIGHT = 0x00000000;
enum ARW_UP = 0x00000004;
enum ARW_DOWN = 0x00000004;
enum ARW_HIDE = 0x00000008;
enum HCF_LOGONDESKTOP = 0x00000100;
enum HCF_DEFAULTDESKTOP = 0x00000200;
enum EDS_RAWMODE = 0x00000002;
enum EDS_ROTATEDMODE = 0x00000004;
enum EDD_GET_DEVICE_INTERFACE_NAME = 0x00000001;
enum FKF_FILTERKEYSON = 0x00000001;
enum FKF_AVAILABLE = 0x00000002;
enum FKF_HOTKEYACTIVE = 0x00000004;
enum FKF_CONFIRMHOTKEY = 0x00000008;
enum FKF_HOTKEYSOUND = 0x00000010;
enum FKF_INDICATOR = 0x00000020;
enum FKF_CLICKON = 0x00000040;
enum MKF_MOUSEKEYSON = 0x00000001;
enum MKF_AVAILABLE = 0x00000002;
enum MKF_HOTKEYACTIVE = 0x00000004;
enum MKF_CONFIRMHOTKEY = 0x00000008;
enum MKF_HOTKEYSOUND = 0x00000010;
enum MKF_INDICATOR = 0x00000020;
enum MKF_MODIFIERS = 0x00000040;
enum MKF_REPLACENUMBERS = 0x00000080;
enum MKF_LEFTBUTTONSEL = 0x10000000;
enum MKF_RIGHTBUTTONSEL = 0x20000000;
enum MKF_LEFTBUTTONDOWN = 0x01000000;
enum MKF_RIGHTBUTTONDOWN = 0x02000000;
enum MKF_MOUSEMODE = 0x80000000;
enum TKF_TOGGLEKEYSON = 0x00000001;
enum TKF_AVAILABLE = 0x00000002;
enum TKF_HOTKEYACTIVE = 0x00000004;
enum TKF_CONFIRMHOTKEY = 0x00000008;
enum TKF_HOTKEYSOUND = 0x00000010;
enum TKF_INDICATOR = 0x00000020;
enum MONITORINFOF_PRIMARY = 0x00000001;
enum WINEVENT_OUTOFCONTEXT = 0x00000000;
enum WINEVENT_SKIPOWNTHREAD = 0x00000001;
enum WINEVENT_SKIPOWNPROCESS = 0x00000002;
enum WINEVENT_INCONTEXT = 0x00000004;
enum CHILDID_SELF = 0x00000000;
enum INDEXID_OBJECT = 0x00000000;
enum INDEXID_CONTAINER = 0x00000000;
enum EVENT_MIN = 0x00000001;
enum EVENT_MAX = 0x7fffffff;
enum EVENT_SYSTEM_SOUND = 0x00000001;
enum EVENT_SYSTEM_ALERT = 0x00000002;
enum EVENT_SYSTEM_FOREGROUND = 0x00000003;
enum EVENT_SYSTEM_MENUSTART = 0x00000004;
enum EVENT_SYSTEM_MENUEND = 0x00000005;
enum EVENT_SYSTEM_MENUPOPUPSTART = 0x00000006;
enum EVENT_SYSTEM_MENUPOPUPEND = 0x00000007;
enum EVENT_SYSTEM_CAPTURESTART = 0x00000008;
enum EVENT_SYSTEM_CAPTUREEND = 0x00000009;
enum EVENT_SYSTEM_MOVESIZESTART = 0x0000000a;
enum EVENT_SYSTEM_MOVESIZEEND = 0x0000000b;
enum EVENT_SYSTEM_CONTEXTHELPSTART = 0x0000000c;
enum EVENT_SYSTEM_CONTEXTHELPEND = 0x0000000d;
enum EVENT_SYSTEM_DRAGDROPSTART = 0x0000000e;
enum EVENT_SYSTEM_DRAGDROPEND = 0x0000000f;
enum EVENT_SYSTEM_DIALOGSTART = 0x00000010;
enum EVENT_SYSTEM_DIALOGEND = 0x00000011;
enum EVENT_SYSTEM_SCROLLINGSTART = 0x00000012;
enum EVENT_SYSTEM_SCROLLINGEND = 0x00000013;
enum EVENT_SYSTEM_SWITCHSTART = 0x00000014;
enum EVENT_SYSTEM_SWITCHEND = 0x00000015;
enum EVENT_SYSTEM_MINIMIZESTART = 0x00000016;
enum EVENT_SYSTEM_MINIMIZEEND = 0x00000017;
enum EVENT_SYSTEM_DESKTOPSWITCH = 0x00000020;
enum EVENT_SYSTEM_SWITCHER_APPGRABBED = 0x00000024;
enum EVENT_SYSTEM_SWITCHER_APPOVERTARGET = 0x00000025;
enum EVENT_SYSTEM_SWITCHER_APPDROPPED = 0x00000026;
enum EVENT_SYSTEM_SWITCHER_CANCELLED = 0x00000027;
enum EVENT_SYSTEM_IME_KEY_NOTIFICATION = 0x00000029;
enum EVENT_SYSTEM_END = 0x000000ff;
enum EVENT_OEM_DEFINED_START = 0x00000101;
enum EVENT_OEM_DEFINED_END = 0x000001ff;
enum EVENT_UIA_EVENTID_START = 0x00004e00;
enum EVENT_UIA_EVENTID_END = 0x00004eff;
enum EVENT_UIA_PROPID_START = 0x00007500;
enum EVENT_UIA_PROPID_END = 0x000075ff;
enum EVENT_CONSOLE_CARET = 0x00004001;
enum EVENT_CONSOLE_UPDATE_REGION = 0x00004002;
enum EVENT_CONSOLE_UPDATE_SIMPLE = 0x00004003;
enum EVENT_CONSOLE_UPDATE_SCROLL = 0x00004004;
enum EVENT_CONSOLE_LAYOUT = 0x00004005;
enum EVENT_CONSOLE_START_APPLICATION = 0x00004006;
enum EVENT_CONSOLE_END_APPLICATION = 0x00004007;
enum CONSOLE_APPLICATION_16BIT = 0x00000000;
enum CONSOLE_CARET_SELECTION = 0x00000001;
enum CONSOLE_CARET_VISIBLE = 0x00000002;
enum EVENT_CONSOLE_END = 0x000040ff;
enum EVENT_OBJECT_CREATE = 0x00008000;
enum EVENT_OBJECT_DESTROY = 0x00008001;
enum EVENT_OBJECT_SHOW = 0x00008002;
enum EVENT_OBJECT_HIDE = 0x00008003;
enum EVENT_OBJECT_REORDER = 0x00008004;
enum EVENT_OBJECT_FOCUS = 0x00008005;
enum EVENT_OBJECT_SELECTION = 0x00008006;
enum EVENT_OBJECT_SELECTIONADD = 0x00008007;
enum EVENT_OBJECT_SELECTIONREMOVE = 0x00008008;
enum EVENT_OBJECT_SELECTIONWITHIN = 0x00008009;
enum EVENT_OBJECT_STATECHANGE = 0x0000800a;
enum EVENT_OBJECT_LOCATIONCHANGE = 0x0000800b;
enum EVENT_OBJECT_NAMECHANGE = 0x0000800c;
enum EVENT_OBJECT_DESCRIPTIONCHANGE = 0x0000800d;
enum EVENT_OBJECT_VALUECHANGE = 0x0000800e;
enum EVENT_OBJECT_PARENTCHANGE = 0x0000800f;
enum EVENT_OBJECT_HELPCHANGE = 0x00008010;
enum EVENT_OBJECT_DEFACTIONCHANGE = 0x00008011;
enum EVENT_OBJECT_ACCELERATORCHANGE = 0x00008012;
enum EVENT_OBJECT_INVOKED = 0x00008013;
enum EVENT_OBJECT_TEXTSELECTIONCHANGED = 0x00008014;
enum EVENT_OBJECT_CONTENTSCROLLED = 0x00008015;
enum EVENT_SYSTEM_ARRANGMENTPREVIEW = 0x00008016;
enum EVENT_OBJECT_CLOAKED = 0x00008017;
enum EVENT_OBJECT_UNCLOAKED = 0x00008018;
enum EVENT_OBJECT_LIVEREGIONCHANGED = 0x00008019;
enum EVENT_OBJECT_HOSTEDOBJECTSINVALIDATED = 0x00008020;
enum EVENT_OBJECT_DRAGSTART = 0x00008021;
enum EVENT_OBJECT_DRAGCANCEL = 0x00008022;
enum EVENT_OBJECT_DRAGCOMPLETE = 0x00008023;
enum EVENT_OBJECT_DRAGENTER = 0x00008024;
enum EVENT_OBJECT_DRAGLEAVE = 0x00008025;
enum EVENT_OBJECT_DRAGDROPPED = 0x00008026;
enum EVENT_OBJECT_IME_SHOW = 0x00008027;
enum EVENT_OBJECT_IME_HIDE = 0x00008028;
enum EVENT_OBJECT_IME_CHANGE = 0x00008029;
enum EVENT_OBJECT_TEXTEDIT_CONVERSIONTARGETCHANGED = 0x00008030;
enum EVENT_OBJECT_END = 0x000080ff;
enum EVENT_AIA_START = 0x0000a000;
enum EVENT_AIA_END = 0x0000afff;
enum SOUND_SYSTEM_STARTUP = 0x00000001;
enum SOUND_SYSTEM_SHUTDOWN = 0x00000002;
enum SOUND_SYSTEM_BEEP = 0x00000003;
enum SOUND_SYSTEM_ERROR = 0x00000004;
enum SOUND_SYSTEM_QUESTION = 0x00000005;
enum SOUND_SYSTEM_WARNING = 0x00000006;
enum SOUND_SYSTEM_INFORMATION = 0x00000007;
enum SOUND_SYSTEM_MAXIMIZE = 0x00000008;
enum SOUND_SYSTEM_MINIMIZE = 0x00000009;
enum SOUND_SYSTEM_RESTOREUP = 0x0000000a;
enum SOUND_SYSTEM_RESTOREDOWN = 0x0000000b;
enum SOUND_SYSTEM_APPSTART = 0x0000000c;
enum SOUND_SYSTEM_FAULT = 0x0000000d;
enum SOUND_SYSTEM_APPEND = 0x0000000e;
enum SOUND_SYSTEM_MENUCOMMAND = 0x0000000f;
enum SOUND_SYSTEM_MENUPOPUP = 0x00000010;
enum CSOUND_SYSTEM = 0x00000010;
enum CALERT_SYSTEM = 0x00000006;
enum GUI_16BITTASK = 0x00000000;
enum USER_DEFAULT_SCREEN_DPI = 0x00000060;
enum STATE_SYSTEM_SELECTED = 0x00000002;
enum STATE_SYSTEM_FOCUSED = 0x00000004;
enum STATE_SYSTEM_CHECKED = 0x00000010;
enum STATE_SYSTEM_MIXED = 0x00000020;
enum STATE_SYSTEM_INDETERMINATE = 0x00000020;
enum STATE_SYSTEM_READONLY = 0x00000040;
enum STATE_SYSTEM_HOTTRACKED = 0x00000080;
enum STATE_SYSTEM_DEFAULT = 0x00000100;
enum STATE_SYSTEM_EXPANDED = 0x00000200;
enum STATE_SYSTEM_COLLAPSED = 0x00000400;
enum STATE_SYSTEM_BUSY = 0x00000800;
enum STATE_SYSTEM_FLOATING = 0x00001000;
enum STATE_SYSTEM_MARQUEED = 0x00002000;
enum STATE_SYSTEM_ANIMATED = 0x00004000;
enum STATE_SYSTEM_SIZEABLE = 0x00020000;
enum STATE_SYSTEM_MOVEABLE = 0x00040000;
enum STATE_SYSTEM_SELFVOICING = 0x00080000;
enum STATE_SYSTEM_SELECTABLE = 0x00200000;
enum STATE_SYSTEM_LINKED = 0x00400000;
enum STATE_SYSTEM_TRAVERSED = 0x00800000;
enum STATE_SYSTEM_MULTISELECTABLE = 0x01000000;
enum STATE_SYSTEM_EXTSELECTABLE = 0x02000000;
enum STATE_SYSTEM_ALERT_LOW = 0x04000000;
enum STATE_SYSTEM_ALERT_MEDIUM = 0x08000000;
enum STATE_SYSTEM_ALERT_HIGH = 0x10000000;
enum STATE_SYSTEM_PROTECTED = 0x20000000;
enum STATE_SYSTEM_VALID = 0x3fffffff;
enum CCHILDREN_TITLEBAR = 0x00000005;
enum CCHILDREN_SCROLLBAR = 0x00000005;
enum RIM_INPUT = 0x00000000;
enum RIM_INPUTSINK = 0x00000001;
enum RIM_TYPEMAX = 0x00000002;
enum RI_MOUSE_LEFT_BUTTON_DOWN = 0x00000001;
enum RI_MOUSE_LEFT_BUTTON_UP = 0x00000002;
enum RI_MOUSE_RIGHT_BUTTON_DOWN = 0x00000004;
enum RI_MOUSE_RIGHT_BUTTON_UP = 0x00000008;
enum RI_MOUSE_MIDDLE_BUTTON_DOWN = 0x00000010;
enum RI_MOUSE_MIDDLE_BUTTON_UP = 0x00000020;
enum RI_MOUSE_BUTTON_1_DOWN = 0x00000001;
enum RI_MOUSE_BUTTON_1_UP = 0x00000002;
enum RI_MOUSE_BUTTON_2_DOWN = 0x00000004;
enum RI_MOUSE_BUTTON_2_UP = 0x00000008;
enum RI_MOUSE_BUTTON_3_DOWN = 0x00000010;
enum RI_MOUSE_BUTTON_3_UP = 0x00000020;
enum RI_MOUSE_BUTTON_4_DOWN = 0x00000040;
enum RI_MOUSE_BUTTON_4_UP = 0x00000080;
enum RI_MOUSE_BUTTON_5_DOWN = 0x00000100;
enum RI_MOUSE_BUTTON_5_UP = 0x00000200;
enum RI_MOUSE_WHEEL = 0x00000400;
enum RI_MOUSE_HWHEEL = 0x00000800;
enum RI_KEY_MAKE = 0x00000000;
enum RI_KEY_BREAK = 0x00000001;
enum RI_KEY_E0 = 0x00000002;
enum RI_KEY_E1 = 0x00000004;
enum RI_KEY_TERMSRV_SET_LED = 0x00000008;
enum RI_KEY_TERMSRV_SHADOW = 0x00000010;
enum RIDEV_EXMODEMASK = 0x000000f0;
enum GIDC_ARRIVAL = 0x00000001;
enum GIDC_REMOVAL = 0x00000002;
enum POINTER_DEVICE_PRODUCT_STRING_MAX = 0x00000208;
enum PDC_ARRIVAL = 0x00000001;
enum PDC_REMOVAL = 0x00000002;
enum PDC_ORIENTATION_0 = 0x00000004;
enum PDC_ORIENTATION_90 = 0x00000008;
enum PDC_ORIENTATION_180 = 0x00000010;
enum PDC_ORIENTATION_270 = 0x00000020;
enum PDC_MODE_DEFAULT = 0x00000040;
enum PDC_MODE_CENTERED = 0x00000080;
enum PDC_MAPPING_CHANGE = 0x00000100;
enum PDC_RESOLUTION = 0x00000200;
enum PDC_ORIGIN = 0x00000400;
enum PDC_MODE_ASPECTRATIOPRESERVED = 0x00000800;
enum GF_BEGIN = 0x00000001;
enum GF_INERTIA = 0x00000002;
enum GF_END = 0x00000004;
enum GESTURECONFIGMAXCOUNT = 0x00000100;
enum GCF_INCLUDE_ANCESTORS = 0x00000001;
enum NID_INTEGRATED_TOUCH = 0x00000001;
enum NID_EXTERNAL_TOUCH = 0x00000002;
enum NID_INTEGRATED_PEN = 0x00000004;
enum NID_EXTERNAL_PEN = 0x00000008;
enum NID_MULTI_INPUT = 0x00000040;
enum NID_READY = 0x00000080;
enum MAX_STR_BLOCKREASON = 0x00000100;
enum STRSAFE_USE_SECURE_CRT = 0x00000000;
enum STRSAFE_MAX_CCH = 0x7fffffff;
enum STRSAFE_IGNORE_NULLS = 0x00000100;
enum STRSAFE_FILL_BEHIND_NULL = 0x00000200;
enum STRSAFE_FILL_ON_FAILURE = 0x00000400;
enum STRSAFE_NULL_ON_FAILURE = 0x00000800;
enum STRSAFE_NO_TRUNCATION = 0x00001000;
enum STRSAFE_E_INSUFFICIENT_BUFFER = 0xffffffff8007007a;
enum STRSAFE_E_INVALID_PARAMETER = 0xffffffff80070057;
enum STRSAFE_E_END_OF_FILE = 0xffffffff80070026;
enum __WARNING_CYCLOMATIC_COMPLEXITY = 0x0000703e;
enum __WARNING_USING_UNINIT_VAR = 0x00001771;
enum __WARNING_RETURN_UNINIT_VAR = 0x000017d5;
enum __WARNING_DEREF_NULL_PTR = 0x0000177b;
enum __WARNING_MISSING_ZERO_TERMINATION2 = 0x000017a6;
enum __WARNING_INVALID_PARAM_VALUE_1 = 0x000018f3;
enum __WARNING_INCORRECT_ANNOTATION = 0x00006597;
enum __WARNING_POTENTIAL_BUFFER_OVERFLOW_HIGH_PRIORITY = 0x0000659f;
enum __WARNING_PRECONDITION_NULLTERMINATION_VIOLATION = 0x000065b3;
enum __WARNING_POSTCONDITION_NULLTERMINATION_VIOLATION = 0x000065b4;
enum __WARNING_HIGH_PRIORITY_OVERFLOW_POSTCONDITION = 0x000065bd;
enum __WARNING_RANGE_POSTCONDITION_VIOLATION = 0x000065cd;
enum __WARNING_POTENTIAL_RANGE_POSTCONDITION_VIOLATION = 0x000065d7;
enum __WARNING_INVALID_PARAM_VALUE_3 = 0x00006e17;
enum __WARNING_RETURNING_BAD_RESULT = 0x00006e24;
enum __WARNING_BANNED_API_USAGE = 0x0000702f;
enum __WARNING_POST_EXPECTED = 0x00006e32;
enum HBMMENU_CALLBACK = 0xffffffffffffffff;
enum HBMMENU_SYSTEM = 0x00000001;
enum HBMMENU_MBAR_RESTORE = 0x00000002;
enum HBMMENU_MBAR_MINIMIZE = 0x00000003;
enum HBMMENU_MBAR_CLOSE = 0x00000005;
enum HBMMENU_MBAR_CLOSE_D = 0x00000006;
enum HBMMENU_MBAR_MINIMIZE_D = 0x00000007;
enum HBMMENU_POPUP_CLOSE = 0x00000008;
enum HBMMENU_POPUP_RESTORE = 0x00000009;
enum HBMMENU_POPUP_MAXIMIZE = 0x0000000a;
enum HBMMENU_POPUP_MINIMIZE = 0x0000000b;
enum CW_USEDEFAULT = 0xffffffff80000000;
enum LBS_STANDARD = 0x00a00003;
alias DI_FLAGS = uint;
enum : uint
{
    DI_MASK        = 0x00000001,
    DI_IMAGE       = 0x00000002,
    DI_NORMAL      = 0x00000003,
    DI_COMPAT      = 0x00000004,
    DI_DEFAULTSIZE = 0x00000008,
    DI_NOMIRROR    = 0x00000010,
}

alias HHOOK = void*;
alias HICON = void*;
alias HMENU = void*;
alias HCURSOR = void*;
alias HACCEL = void*;
struct MESSAGE_RESOURCE_ENTRY
{
    ushort Length;
    ushort Flags;
    ubyte[1] Text;
}
struct MESSAGE_RESOURCE_BLOCK
{
    uint LowId;
    uint HighId;
    uint OffsetToEntries;
}
struct MESSAGE_RESOURCE_DATA
{
    uint NumberOfBlocks;
    MESSAGE_RESOURCE_BLOCK[1] Blocks;
}
alias WNDPROC = LRESULT function(HWND, uint, WPARAM, LPARAM);
alias DLGPROC = long function(HWND, uint, WPARAM, LPARAM);
alias TIMERPROC = void function(HWND, uint, ulong, uint);
alias WNDENUMPROC = BOOL function(HWND, LPARAM);
alias HOOKPROC = LRESULT function(int, WPARAM, LPARAM);
alias SENDASYNCPROC = void function(HWND, uint, ulong, LRESULT);
alias PROPENUMPROCA = BOOL function(HWND, const(char)*, HANDLE);
alias PROPENUMPROCW = BOOL function(HWND, const(wchar)*, HANDLE);
alias PROPENUMPROCEXA = BOOL function(HWND, PSTR, HANDLE, ulong);
alias PROPENUMPROCEXW = BOOL function(HWND, PWSTR, HANDLE, ulong);
alias NAMEENUMPROCA = BOOL function(PSTR, LPARAM);
alias NAMEENUMPROCW = BOOL function(PWSTR, LPARAM);
struct CBT_CREATEWNDA
{
    CREATESTRUCTA* lpcs;
    HWND hwndInsertAfter;
}
struct CBT_CREATEWNDW
{
    CREATESTRUCTW* lpcs;
    HWND hwndInsertAfter;
}
struct CBTACTIVATESTRUCT
{
    BOOL fMouse;
    HWND hWndActive;
}
struct SHELLHOOKINFO
{
    HWND hwnd;
    RECT rc;
}
struct EVENTMSG
{
    uint message;
    uint paramL;
    uint paramH;
    uint time;
    HWND hwnd;
}
struct CWPSTRUCT
{
    LPARAM lParam;
    WPARAM wParam;
    uint message;
    HWND hwnd;
}
struct CWPRETSTRUCT
{
    LRESULT lResult;
    LPARAM lParam;
    WPARAM wParam;
    uint message;
    HWND hwnd;
}
struct KBDLLHOOKSTRUCT
{
    uint vkCode;
    uint scanCode;
    KBDLLHOOKSTRUCT_FLAGS flags;
    uint time;
    ulong dwExtraInfo;
}
struct MSLLHOOKSTRUCT
{
    POINT pt;
    MOUSEHOOKSTRUCTEX_MOUSE_DATA mouseData;
    uint flags;
    uint time;
    ulong dwExtraInfo;
}
struct DEBUGHOOKINFO
{
    uint idThread;
    uint idThreadInstaller;
    LPARAM lParam;
    WPARAM wParam;
    int code;
}
struct MOUSEHOOKSTRUCT
{
    POINT pt;
    HWND hwnd;
    uint wHitTestCode;
    ulong dwExtraInfo;
}
struct MOUSEHOOKSTRUCTEX
{
    MOUSEHOOKSTRUCT __AnonymousBase_winuser_L1166_C46;
    MOUSEHOOKSTRUCTEX_MOUSE_DATA mouseData;
}
struct HARDWAREHOOKSTRUCT
{
    HWND hwnd;
    uint message;
    WPARAM wParam;
    LPARAM lParam;
}
struct WNDCLASSEXA
{
    uint cbSize;
    WNDCLASS_STYLES style;
    WNDPROC lpfnWndProc;
    int cbClsExtra;
    int cbWndExtra;
    HINSTANCE hInstance;
    HICON hIcon;
    HCURSOR hCursor;
    HBRUSH hbrBackground;
    const(char)* lpszMenuName;
    const(char)* lpszClassName;
    HICON hIconSm;
}
struct WNDCLASSEXW
{
    uint cbSize;
    WNDCLASS_STYLES style;
    WNDPROC lpfnWndProc;
    int cbClsExtra;
    int cbWndExtra;
    HINSTANCE hInstance;
    HICON hIcon;
    HCURSOR hCursor;
    HBRUSH hbrBackground;
    const(wchar)* lpszMenuName;
    const(wchar)* lpszClassName;
    HICON hIconSm;
}
struct WNDCLASSA
{
    WNDCLASS_STYLES style;
    WNDPROC lpfnWndProc;
    int cbClsExtra;
    int cbWndExtra;
    HINSTANCE hInstance;
    HICON hIcon;
    HCURSOR hCursor;
    HBRUSH hbrBackground;
    const(char)* lpszMenuName;
    const(char)* lpszClassName;
}
struct WNDCLASSW
{
    WNDCLASS_STYLES style;
    WNDPROC lpfnWndProc;
    int cbClsExtra;
    int cbWndExtra;
    HINSTANCE hInstance;
    HICON hIcon;
    HCURSOR hCursor;
    HBRUSH hbrBackground;
    const(wchar)* lpszMenuName;
    const(wchar)* lpszClassName;
}
struct MSG
{
    HWND hwnd;
    uint message;
    WPARAM wParam;
    LPARAM lParam;
    uint time;
    POINT pt;
}
struct MINMAXINFO
{
    POINT ptReserved;
    POINT ptMaxSize;
    POINT ptMaxPosition;
    POINT ptMinTrackSize;
    POINT ptMaxTrackSize;
}
struct MDINEXTMENU
{
    HMENU hmenuIn;
    HMENU hmenuNext;
    HWND hwndNext;
}
struct WINDOWPOS
{
    HWND hwnd;
    HWND hwndInsertAfter;
    int x;
    int y;
    int cx;
    int cy;
    SET_WINDOW_POS_FLAGS flags;
}
struct NCCALCSIZE_PARAMS
{
    RECT[3] rgrc;
    WINDOWPOS* lppos;
}
struct ACCEL
{
    ubyte fVirt;
    ushort key;
    ushort cmd;
}
struct CREATESTRUCTA
{
    void* lpCreateParams;
    HINSTANCE hInstance;
    HMENU hMenu;
    HWND hwndParent;
    int cy;
    int cx;
    int y;
    int x;
    int style;
    const(char)* lpszName;
    const(char)* lpszClass;
    uint dwExStyle;
}
struct CREATESTRUCTW
{
    void* lpCreateParams;
    HINSTANCE hInstance;
    HMENU hMenu;
    HWND hwndParent;
    int cy;
    int cx;
    int y;
    int x;
    int style;
    const(wchar)* lpszName;
    const(wchar)* lpszClass;
    uint dwExStyle;
}
struct WINDOWPLACEMENT
{
    uint length;
    WINDOWPLACEMENT_FLAGS flags;
    SHOW_WINDOW_CMD showCmd;
    POINT ptMinPosition;
    POINT ptMaxPosition;
    RECT rcNormalPosition;
}
struct STYLESTRUCT
{
    uint styleOld;
    uint styleNew;
}
alias PREGISTERCLASSNAMEW = BOOLEAN function(const(wchar)*);
struct UPDATELAYEREDWINDOWINFO
{
    uint cbSize;
    HDC hdcDst;
    const(POINT)* pptDst;
    const(SIZE)* psize;
    HDC hdcSrc;
    const(POINT)* pptSrc;
    uint crKey;
    const(BLENDFUNCTION)* pblend;
    UPDATE_LAYERED_WINDOW_FLAGS dwFlags;
    const(RECT)* prcDirty;
}
struct FLASHWINFO
{
    uint cbSize;
    HWND hwnd;
    FLASHWINFO_FLAGS dwFlags;
    uint uCount;
    uint dwTimeout;
}
struct DLGTEMPLATE
{
    align (2):
    uint style;
    uint dwExtendedStyle;
    ushort cdit;
    short x;
    short y;
    short cx;
    short cy;
}
struct DLGITEMTEMPLATE
{
    align (2):
    uint style;
    uint dwExtendedStyle;
    short x;
    short y;
    short cx;
    short cy;
    ushort id;
}
alias POINTER_INPUT_TYPE = int;
enum : int
{
    PT_POINTER  = 0x00000001,
    PT_TOUCH    = 0x00000002,
    PT_PEN      = 0x00000003,
    PT_MOUSE    = 0x00000004,
    PT_TOUCHPAD = 0x00000005,
}

struct TPMPARAMS
{
    uint cbSize;
    RECT rcExclude;
}
struct MENUINFO
{
    uint cbSize;
    MENUINFO_MASK fMask;
    MENUINFO_STYLE dwStyle;
    uint cyMax;
    HBRUSH hbrBack;
    uint dwContextHelpID;
    ulong dwMenuData;
}
struct MENUGETOBJECTINFO
{
    MENUGETOBJECTINFO_FLAGS dwFlags;
    uint uPos;
    HMENU hmenu;
    void* riid;
    void* pvObj;
}
struct MENUITEMINFOA
{
    uint cbSize;
    MENU_ITEM_MASK fMask;
    MENU_ITEM_TYPE fType;
    MENU_ITEM_STATE fState;
    uint wID;
    HMENU hSubMenu;
    HBITMAP hbmpChecked;
    HBITMAP hbmpUnchecked;
    ulong dwItemData;
    PSTR dwTypeData;
    uint cch;
    HBITMAP hbmpItem;
}
struct MENUITEMINFOW
{
    uint cbSize;
    MENU_ITEM_MASK fMask;
    MENU_ITEM_TYPE fType;
    MENU_ITEM_STATE fState;
    uint wID;
    HMENU hSubMenu;
    HBITMAP hbmpChecked;
    HBITMAP hbmpUnchecked;
    ulong dwItemData;
    PWSTR dwTypeData;
    uint cch;
    HBITMAP hbmpItem;
}
struct DROPSTRUCT
{
    HWND hwndSource;
    HWND hwndSink;
    uint wFmt;
    ulong dwData;
    POINT ptDrop;
    uint dwControlData;
}
alias MSGBOXCALLBACK = void function(HELPINFO*);
struct MSGBOXPARAMSA
{
    uint cbSize;
    HWND hwndOwner;
    HINSTANCE hInstance;
    const(char)* lpszText;
    const(char)* lpszCaption;
    MESSAGEBOX_STYLE dwStyle;
    const(char)* lpszIcon;
    ulong dwContextHelpId;
    MSGBOXCALLBACK lpfnMsgBoxCallback;
    uint dwLanguageId;
}
struct MSGBOXPARAMSW
{
    uint cbSize;
    HWND hwndOwner;
    HINSTANCE hInstance;
    const(wchar)* lpszText;
    const(wchar)* lpszCaption;
    MESSAGEBOX_STYLE dwStyle;
    const(wchar)* lpszIcon;
    ulong dwContextHelpId;
    MSGBOXCALLBACK lpfnMsgBoxCallback;
    uint dwLanguageId;
}
struct MENUITEMTEMPLATEHEADER
{
    ushort versionNumber;
    ushort offset;
}
struct MENUITEMTEMPLATE
{
    ushort mtOption;
    ushort mtID;
    wchar[1] mtString;
}
struct ICONINFO
{
    BOOL fIcon;
    uint xHotspot;
    uint yHotspot;
    HBITMAP hbmMask;
    HBITMAP hbmColor;
}
struct CURSORSHAPE
{
    int xHotSpot;
    int yHotSpot;
    int cx;
    int cy;
    int cbWidth;
    ubyte Planes;
    ubyte BitsPixel;
}
struct ICONINFOEXA
{
    uint cbSize;
    BOOL fIcon;
    uint xHotspot;
    uint yHotspot;
    HBITMAP hbmMask;
    HBITMAP hbmColor;
    ushort wResID;
    CHAR[260] szModName;
    CHAR[260] szResName;
}
struct ICONINFOEXW
{
    uint cbSize;
    BOOL fIcon;
    uint xHotspot;
    uint yHotspot;
    HBITMAP hbmMask;
    HBITMAP hbmColor;
    ushort wResID;
    wchar[260] szModName;
    wchar[260] szResName;
}
alias EDIT_CONTROL_FEATURE = int;
enum : int
{
    EDIT_CONTROL_FEATURE_ENTERPRISE_DATA_PROTECTION_PASTE_SUPPORT = 0x00000000,
    EDIT_CONTROL_FEATURE_PASTE_NOTIFICATIONS                      = 0x00000001,
}

struct SCROLLINFO
{
    uint cbSize;
    SCROLLINFO_MASK fMask;
    int nMin;
    int nMax;
    uint nPage;
    int nPos;
    int nTrackPos;
}
struct MDICREATESTRUCTA
{
    const(char)* szClass;
    const(char)* szTitle;
    HANDLE hOwner;
    int x;
    int y;
    int cx;
    int cy;
    WINDOW_STYLE style;
    LPARAM lParam;
}
struct MDICREATESTRUCTW
{
    const(wchar)* szClass;
    const(wchar)* szTitle;
    HANDLE hOwner;
    int x;
    int y;
    int cx;
    int cy;
    WINDOW_STYLE style;
    LPARAM lParam;
}
struct CLIENTCREATESTRUCT
{
    HANDLE hWindowMenu;
    uint idFirstChild;
}
struct TouchPredictionParameters
{
    uint cbSize;
    uint dwLatency;
    uint dwSampleTime;
    uint bUseHWTimeStamp;
}
alias HANDEDNESS = int;
enum : int
{
    HANDEDNESS_LEFT  = 0x00000000,
    HANDEDNESS_RIGHT = 0x00000001,
}

struct NONCLIENTMETRICSA
{
    uint cbSize;
    int iBorderWidth;
    int iScrollWidth;
    int iScrollHeight;
    int iCaptionWidth;
    int iCaptionHeight;
    LOGFONTA lfCaptionFont;
    int iSmCaptionWidth;
    int iSmCaptionHeight;
    LOGFONTA lfSmCaptionFont;
    int iMenuWidth;
    int iMenuHeight;
    LOGFONTA lfMenuFont;
    LOGFONTA lfStatusFont;
    LOGFONTA lfMessageFont;
    int iPaddedBorderWidth;
}
struct NONCLIENTMETRICSW
{
    uint cbSize;
    int iBorderWidth;
    int iScrollWidth;
    int iScrollHeight;
    int iCaptionWidth;
    int iCaptionHeight;
    LOGFONTW lfCaptionFont;
    int iSmCaptionWidth;
    int iSmCaptionHeight;
    LOGFONTW lfSmCaptionFont;
    int iMenuWidth;
    int iMenuHeight;
    LOGFONTW lfMenuFont;
    LOGFONTW lfStatusFont;
    LOGFONTW lfMessageFont;
    int iPaddedBorderWidth;
}
struct MINIMIZEDMETRICS
{
    uint cbSize;
    int iWidth;
    int iHorzGap;
    int iVertGap;
    MINIMIZEDMETRICS_ARRANGE iArrange;
}
struct ICONMETRICSA
{
    uint cbSize;
    int iHorzSpacing;
    int iVertSpacing;
    int iTitleWrap;
    LOGFONTA lfFont;
}
struct ICONMETRICSW
{
    uint cbSize;
    int iHorzSpacing;
    int iVertSpacing;
    int iTitleWrap;
    LOGFONTW lfFont;
}
struct ANIMATIONINFO
{
    uint cbSize;
    int iMinAnimate;
}
struct AUDIODESCRIPTION
{
    uint cbSize;
    BOOL Enabled;
    uint Locale;
}
struct GUITHREADINFO
{
    uint cbSize;
    GUITHREADINFO_FLAGS flags;
    HWND hwndActive;
    HWND hwndFocus;
    HWND hwndCapture;
    HWND hwndMenuOwner;
    HWND hwndMoveSize;
    HWND hwndCaret;
    RECT rcCaret;
}
struct CURSORINFO
{
    uint cbSize;
    CURSORINFO_FLAGS flags;
    HCURSOR hCursor;
    POINT ptScreenPos;
}
struct WINDOWINFO
{
    uint cbSize;
    RECT rcWindow;
    RECT rcClient;
    uint dwStyle;
    uint dwExStyle;
    uint dwWindowStatus;
    uint cxWindowBorders;
    uint cyWindowBorders;
    ushort atomWindowType;
    ushort wCreatorVersion;
}
struct TITLEBARINFO
{
    uint cbSize;
    RECT rcTitleBar;
    uint[6] rgstate;
}
struct TITLEBARINFOEX
{
    uint cbSize;
    RECT rcTitleBar;
    uint[6] rgstate;
    RECT[6] rgrect;
}
struct MENUBARINFO
{
    uint cbSize;
    RECT rcBar;
    HMENU hMenu;
    HWND hwndMenu;
    int _bitfield0;
}
struct SCROLLBARINFO
{
    uint cbSize;
    RECT rcScrollBar;
    int dxyLineButton;
    int xyThumbTop;
    int xyThumbBottom;
    int reserved;
    uint[6] rgstate;
}
struct ALTTABINFO
{
    uint cbSize;
    int cItems;
    int cColumns;
    int cRows;
    int iColFocus;
    int iRowFocus;
    int cxItem;
    int cyItem;
    POINT ptStart;
}
struct CHANGEFILTERSTRUCT
{
    uint cbSize;
    MSGFLTINFO_STATUS ExtStatus;
}
struct IndexedResourceQualifier
{
    PWSTR name;
    PWSTR value;
}
alias MrmPlatformVersion = int;
enum : int
{
    MrmPlatformVersion_Default         = 0x00000000,
    MrmPlatformVersion_Windows10_0_0_0 = 0x010a0000,
    MrmPlatformVersion_Windows10_0_0_5 = 0x010a0005,
}

struct MrmResourceIndexerHandle
{
    void* handle;
}
alias MrmPackagingMode = int;
enum : int
{
    MrmPackagingModeStandaloneFile = 0x00000000,
    MrmPackagingModeAutoSplit      = 0x00000001,
    MrmPackagingModeResourcePack   = 0x00000002,
}

alias MrmPackagingOptions = int;
enum : int
{
    MrmPackagingOptionsNone                        = 0x00000000,
    MrmPackagingOptionsOmitSchemaFromResourcePacks = 0x00000001,
    MrmPackagingOptionsSplitLanguageVariants       = 0x00000002,
}

alias MrmDumpType = int;
enum : int
{
    MrmDumpType_Basic    = 0x00000000,
    MrmDumpType_Detailed = 0x00000001,
    MrmDumpType_Schema   = 0x00000002,
}

alias MrmResourceIndexerMessageSeverity = int;
enum : int
{
    MrmResourceIndexerMessageSeverityVerbose = 0x00000000,
    MrmResourceIndexerMessageSeverityInfo    = 0x00000001,
    MrmResourceIndexerMessageSeverityWarning = 0x00000002,
    MrmResourceIndexerMessageSeverityError   = 0x00000003,
}

alias MrmIndexerFlags = int;
enum : int
{
    MrmIndexerFlagsNone                  = 0x00000000,
    MrmIndexerFlagsAutoMerge             = 0x00000001,
    MrmIndexerFlagsCreateContentChecksum = 0x00000002,
}

struct MrmResourceIndexerMessage
{
    MrmResourceIndexerMessageSeverity severity;
    uint id;
    const(wchar)* text;
}
