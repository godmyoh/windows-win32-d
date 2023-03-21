module windows.win32.web.internetexplorer;

import windows.win32.guid : GUID;
import windows.win32.foundation : BOOL, BSTR, FILETIME, HANDLE, HINSTANCE, HRESULT, HWND, LPARAM, LUID, POINT, PSTR, PWSTR, RECT, SIZE, VARIANT_BOOL, WPARAM;
import windows.win32.graphics.directdraw : IDirectDrawSurface;
import windows.win32.graphics.dxgi.common : DXGI_FORMAT, DXGI_MODE_ROTATION;
import windows.win32.graphics.gdi : HBITMAP, RGBQUAD;
import windows.win32.security_ : SECURITY_ATTRIBUTES;
import windows.win32.storage.filesystem : GET_FILEEX_INFO_LEVELS, WIN32_FIND_DATAA;
import windows.win32.system.com_ : BINDINFO, IBindCtx, IBindStatusCallback, IDispatch, IMoniker, IPersist, IStream, IUnknown, IUri, VARIANT;
import windows.win32.system.ole : IOleCommandTarget, IOleContainer;
import windows.win32.system.registry : HKEY;
import windows.win32.system.threading : PROCESS_INFORMATION;
import windows.win32.system.winrt_ : IInspectable;
import windows.win32.ui.windowsandmessaging : HICON;
import windows.win32.web.mshtml : IHTMLDocument2, IHTMLElement, IHTMLWindow2, VIEW_OBJECT_ALPHA_MODE, styleMsTouchAction;

version (Windows):
extern (Windows):

HRESULT IEAssociateThreadWithTab(uint, uint);
HRESULT IEDisassociateThreadWithTab(uint, uint);
BOOL IEIsInPrivateBrowsing();
BOOL IEInPrivateFilteringEnabled();
BOOL IETrackingProtectionEnabled();
HRESULT IESaveFile(HANDLE, const(wchar)*);
HRESULT IECancelSaveFile(HANDLE);
HRESULT IEShowSaveFileDialog(HWND, const(wchar)*, const(wchar)*, const(wchar)*, const(wchar)*, uint, uint, PWSTR*, HANDLE*);
HRESULT IEShowOpenFileDialog(HWND, PWSTR, uint, const(wchar)*, const(wchar)*, const(wchar)*, uint, uint, HANDLE*);
HRESULT IEGetWriteableLowHKCU(HKEY*);
HRESULT IEGetWriteableFolderPath(const(GUID)*, PWSTR*);
HRESULT IEIsProtectedModeProcess(BOOL*);
HRESULT IEIsProtectedModeURL(const(wchar)*);
HRESULT IELaunchURL(const(wchar)*, PROCESS_INFORMATION*, void*);
HRESULT IERefreshElevationPolicy();
HRESULT IEGetProtectedModeCookie(const(wchar)*, const(wchar)*, PWSTR, uint*, uint);
HRESULT IESetProtectedModeCookie(const(wchar)*, const(wchar)*, const(wchar)*, uint);
HRESULT IERegisterWritableRegistryKey(GUID, const(wchar)*, BOOL);
HRESULT IERegisterWritableRegistryValue(GUID, const(wchar)*, const(wchar)*, uint, const(ubyte)*, uint);
HRESULT IEUnregisterWritableRegistry(GUID);
HRESULT IERegCreateKeyEx(const(wchar)*, uint, PWSTR, uint, uint, SECURITY_ATTRIBUTES*, HKEY*, uint*);
HRESULT IERegSetValueEx(const(wchar)*, const(wchar)*, uint, uint, const(ubyte)*, uint);
HANDLE IECreateFile(const(wchar)*, uint, uint, SECURITY_ATTRIBUTES*, uint, uint, HANDLE);
BOOL IEDeleteFile(const(wchar)*);
BOOL IERemoveDirectory(const(wchar)*);
BOOL IEMoveFileEx(const(wchar)*, const(wchar)*, uint);
BOOL IECreateDirectory(const(wchar)*, SECURITY_ATTRIBUTES*);
BOOL IEGetFileAttributesEx(const(wchar)*, GET_FILEEX_INFO_LEVELS, void*);
HANDLE IEFindFirstFile(const(wchar)*, WIN32_FIND_DATAA*);
HRESULT RatingEnable(HWND, const(char)*, BOOL);
HRESULT RatingEnableW(HWND, const(wchar)*, BOOL);
HRESULT RatingCheckUserAccess(const(char)*, const(char)*, const(char)*, ubyte*, uint, void**);
HRESULT RatingCheckUserAccessW(const(wchar)*, const(wchar)*, const(wchar)*, ubyte*, uint, void**);
HRESULT RatingAccessDeniedDialog(HWND, const(char)*, const(char)*, void*);
HRESULT RatingAccessDeniedDialogW(HWND, const(wchar)*, const(wchar)*, void*);
HRESULT RatingAccessDeniedDialog2(HWND, const(char)*, void*);
HRESULT RatingAccessDeniedDialog2W(HWND, const(wchar)*, void*);
HRESULT RatingFreeDetails(void*);
HRESULT RatingObtainCancel(HANDLE);
HRESULT RatingObtainQuery(const(char)*, uint, long, HANDLE*);
HRESULT RatingObtainQueryW(const(wchar)*, uint, long, HANDLE*);
HRESULT RatingSetupUI(HWND, const(char)*);
HRESULT RatingSetupUIW(HWND, const(wchar)*);
HRESULT RatingAddToApprovedSites(HWND, uint, ubyte*, const(wchar)*, BOOL, BOOL, BOOL);
HRESULT RatingClickedOnPRFInternal(HWND, HINSTANCE, PSTR, int);
HRESULT RatingClickedOnRATInternal(HWND, HINSTANCE, PSTR, int);
HRESULT RatingEnabledQuery();
HRESULT RatingInit();
HRESULT CreateMIMEMap(IMapMIMEToCLSID*);
HRESULT DecodeImage(IStream, IMapMIMEToCLSID, IUnknown);
HRESULT SniffStream(IStream, uint*, IStream*);
HRESULT GetMaxMIMEIDBytes(uint*);
HRESULT IdentifyMIMEType(const(ubyte)*, uint, uint*);
HRESULT ComputeInvCMAP(const(RGBQUAD)*, uint, ubyte*, uint);
HRESULT DitherTo8(ubyte*, int, ubyte*, int, const(GUID)*, RGBQUAD*, RGBQUAD*, ubyte*, int, int, int, int, int, int);
HRESULT CreateDDrawSurfaceOnDIB(HBITMAP, IDirectDrawSurface*);
HRESULT DecodeImageEx(IStream, IMapMIMEToCLSID, IUnknown, const(wchar)*);
enum DISPID_AMBIENT_OFFLINEIFNOTCONNECTED = 0xffffffffffffea83;
enum DISPID_AMBIENT_SILENT = 0xffffffffffffea82;
enum DISPID_BEFORENAVIGATE = 0x00000064;
enum DISPID_NAVIGATECOMPLETE = 0x00000065;
enum DISPID_STATUSTEXTCHANGE = 0x00000066;
enum DISPID_QUIT = 0x00000067;
enum DISPID_DOWNLOADCOMPLETE = 0x00000068;
enum DISPID_COMMANDSTATECHANGE = 0x00000069;
enum DISPID_DOWNLOADBEGIN = 0x0000006a;
enum DISPID_NEWWINDOW = 0x0000006b;
enum DISPID_PROGRESSCHANGE = 0x0000006c;
enum DISPID_WINDOWMOVE = 0x0000006d;
enum DISPID_WINDOWRESIZE = 0x0000006e;
enum DISPID_WINDOWACTIVATE = 0x0000006f;
enum DISPID_PROPERTYCHANGE = 0x00000070;
enum DISPID_TITLECHANGE = 0x00000071;
enum DISPID_TITLEICONCHANGE = 0x00000072;
enum DISPID_FRAMEBEFORENAVIGATE = 0x000000c8;
enum DISPID_FRAMENAVIGATECOMPLETE = 0x000000c9;
enum DISPID_FRAMENEWWINDOW = 0x000000cc;
enum DISPID_BEFORENAVIGATE2 = 0x000000fa;
enum DISPID_NEWWINDOW2 = 0x000000fb;
enum DISPID_NAVIGATECOMPLETE2 = 0x000000fc;
enum DISPID_ONQUIT = 0x000000fd;
enum DISPID_ONVISIBLE = 0x000000fe;
enum DISPID_ONTOOLBAR = 0x000000ff;
enum DISPID_ONMENUBAR = 0x00000100;
enum DISPID_ONSTATUSBAR = 0x00000101;
enum DISPID_ONFULLSCREEN = 0x00000102;
enum DISPID_DOCUMENTCOMPLETE = 0x00000103;
enum DISPID_ONTHEATERMODE = 0x00000104;
enum DISPID_ONADDRESSBAR = 0x00000105;
enum DISPID_WINDOWSETRESIZABLE = 0x00000106;
enum DISPID_WINDOWCLOSING = 0x00000107;
enum DISPID_WINDOWSETLEFT = 0x00000108;
enum DISPID_WINDOWSETTOP = 0x00000109;
enum DISPID_WINDOWSETWIDTH = 0x0000010a;
enum DISPID_WINDOWSETHEIGHT = 0x0000010b;
enum DISPID_CLIENTTOHOSTWINDOW = 0x0000010c;
enum DISPID_SETSECURELOCKICON = 0x0000010d;
enum DISPID_FILEDOWNLOAD = 0x0000010e;
enum DISPID_NAVIGATEERROR = 0x0000010f;
enum DISPID_PRIVACYIMPACTEDSTATECHANGE = 0x00000110;
enum DISPID_NEWWINDOW3 = 0x00000111;
enum DISPID_VIEWUPDATE = 0x00000119;
enum DISPID_SETPHISHINGFILTERSTATUS = 0x0000011a;
enum DISPID_WINDOWSTATECHANGED = 0x0000011b;
enum DISPID_NEWPROCESS = 0x0000011c;
enum DISPID_THIRDPARTYURLBLOCKED = 0x0000011d;
enum DISPID_REDIRECTXDOMAINBLOCKED = 0x0000011e;
enum DISPID_WEBWORKERSTARTED = 0x00000120;
enum DISPID_WEBWORKERFINISHED = 0x00000121;
enum DISPID_BEFORESCRIPTEXECUTE = 0x00000122;
enum DISPID_PRINTTEMPLATEINSTANTIATION = 0x000000e1;
enum DISPID_PRINTTEMPLATETEARDOWN = 0x000000e2;
enum DISPID_UPDATEPAGESTATUS = 0x000000e3;
enum DISPID_WINDOWREGISTERED = 0x000000c8;
enum DISPID_WINDOWREVOKED = 0x000000c9;
enum DISPID_RESETFIRSTBOOTMODE = 0x00000001;
enum DISPID_RESETSAFEMODE = 0x00000002;
enum DISPID_REFRESHOFFLINEDESKTOP = 0x00000003;
enum DISPID_ADDFAVORITE = 0x00000004;
enum DISPID_ADDCHANNEL = 0x00000005;
enum DISPID_ADDDESKTOPCOMPONENT = 0x00000006;
enum DISPID_ISSUBSCRIBED = 0x00000007;
enum DISPID_NAVIGATEANDFIND = 0x00000008;
enum DISPID_IMPORTEXPORTFAVORITES = 0x00000009;
enum DISPID_AUTOCOMPLETESAVEFORM = 0x0000000a;
enum DISPID_AUTOSCAN = 0x0000000b;
enum DISPID_AUTOCOMPLETEATTACH = 0x0000000c;
enum DISPID_SHOWBROWSERUI = 0x0000000d;
enum DISPID_ADDSEARCHPROVIDER = 0x0000000e;
enum DISPID_RUNONCESHOWN = 0x0000000f;
enum DISPID_SKIPRUNONCE = 0x00000010;
enum DISPID_CUSTOMIZESETTINGS = 0x00000011;
enum DISPID_SQMENABLED = 0x00000012;
enum DISPID_PHISHINGENABLED = 0x00000013;
enum DISPID_BRANDIMAGEURI = 0x00000014;
enum DISPID_SKIPTABSWELCOME = 0x00000015;
enum DISPID_DIAGNOSECONNECTION = 0x00000016;
enum DISPID_CUSTOMIZECLEARTYPE = 0x00000017;
enum DISPID_ISSEARCHPROVIDERINSTALLED = 0x00000018;
enum DISPID_ISSEARCHMIGRATED = 0x00000019;
enum DISPID_DEFAULTSEARCHPROVIDER = 0x0000001a;
enum DISPID_RUNONCEREQUIREDSETTINGSCOMPLETE = 0x0000001b;
enum DISPID_RUNONCEHASSHOWN = 0x0000001c;
enum DISPID_SEARCHGUIDEURL = 0x0000001d;
enum DISPID_ADDSERVICE = 0x0000001e;
enum DISPID_ISSERVICEINSTALLED = 0x0000001f;
enum DISPID_ADDTOFAVORITESBAR = 0x00000020;
enum DISPID_BUILDNEWTABPAGE = 0x00000021;
enum DISPID_SETRECENTLYCLOSEDVISIBLE = 0x00000022;
enum DISPID_SETACTIVITIESVISIBLE = 0x00000023;
enum DISPID_CONTENTDISCOVERYRESET = 0x00000024;
enum DISPID_INPRIVATEFILTERINGENABLED = 0x00000025;
enum DISPID_SUGGESTEDSITESENABLED = 0x00000026;
enum DISPID_ENABLESUGGESTEDSITES = 0x00000027;
enum DISPID_NAVIGATETOSUGGESTEDSITES = 0x00000028;
enum DISPID_SHOWTABSHELP = 0x00000029;
enum DISPID_SHOWINPRIVATEHELP = 0x0000002a;
enum DISPID_ISSITEMODE = 0x0000002b;
enum DISPID_SETSITEMODEICONOVERLAY = 0x0000002c;
enum DISPID_CLEARSITEMODEICONOVERLAY = 0x0000002d;
enum DISPID_UPDATETHUMBNAILBUTTON = 0x0000002e;
enum DISPID_SETTHUMBNAILBUTTONS = 0x0000002f;
enum DISPID_ADDTHUMBNAILBUTTONS = 0x00000030;
enum DISPID_ADDSITEMODE = 0x00000031;
enum DISPID_SETSITEMODEPROPERTIES = 0x00000032;
enum DISPID_SITEMODECREATEJUMPLIST = 0x00000033;
enum DISPID_SITEMODEADDJUMPLISTITEM = 0x00000034;
enum DISPID_SITEMODECLEARJUMPLIST = 0x00000035;
enum DISPID_SITEMODEADDBUTTONSTYLE = 0x00000036;
enum DISPID_SITEMODESHOWBUTTONSTYLE = 0x00000037;
enum DISPID_SITEMODESHOWJUMPLIST = 0x00000038;
enum DISPID_ADDTRACKINGPROTECTIONLIST = 0x00000039;
enum DISPID_SITEMODEACTIVATE = 0x0000003a;
enum DISPID_ISSITEMODEFIRSTRUN = 0x0000003b;
enum DISPID_TRACKINGPROTECTIONENABLED = 0x0000003c;
enum DISPID_ACTIVEXFILTERINGENABLED = 0x0000003d;
enum DISPID_PROVISIONNETWORKS = 0x0000003e;
enum DISPID_REPORTSAFEURL = 0x0000003f;
enum DISPID_SITEMODEREFRESHBADGE = 0x00000040;
enum DISPID_SITEMODECLEARBADGE = 0x00000041;
enum DISPID_DIAGNOSECONNECTIONUILESS = 0x00000042;
enum DISPID_LAUNCHNETWORKCLIENTHELP = 0x00000043;
enum DISPID_CHANGEDEFAULTBROWSER = 0x00000044;
enum DISPID_STOPPERIODICUPDATE = 0x00000045;
enum DISPID_STARTPERIODICUPDATE = 0x00000046;
enum DISPID_CLEARNOTIFICATION = 0x00000047;
enum DISPID_ENABLENOTIFICATIONQUEUE = 0x00000048;
enum DISPID_PINNEDSITESTATE = 0x00000049;
enum DISPID_LAUNCHINTERNETOPTIONS = 0x0000004a;
enum DISPID_STARTPERIODICUPDATEBATCH = 0x0000004b;
enum DISPID_ENABLENOTIFICATIONQUEUESQUARE = 0x0000004c;
enum DISPID_ENABLENOTIFICATIONQUEUEWIDE = 0x0000004d;
enum DISPID_ENABLENOTIFICATIONQUEUELARGE = 0x0000004e;
enum DISPID_SCHEDULEDTILENOTIFICATION = 0x0000004f;
enum DISPID_REMOVESCHEDULEDTILENOTIFICATION = 0x00000050;
enum DISPID_STARTBADGEUPDATE = 0x00000051;
enum DISPID_STOPBADGEUPDATE = 0x00000052;
enum DISPID_ISMETAREFERRERAVAILABLE = 0x00000053;
enum DISPID_SETEXPERIMENTALFLAG = 0x00000054;
enum DISPID_GETEXPERIMENTALFLAG = 0x00000055;
enum DISPID_SETEXPERIMENTALVALUE = 0x00000056;
enum DISPID_GETEXPERIMENTALVALUE = 0x00000057;
enum DISPID_HASNEEDIEAUTOLAUNCHFLAG = 0x00000058;
enum DISPID_GETNEEDIEAUTOLAUNCHFLAG = 0x00000059;
enum DISPID_SETNEEDIEAUTOLAUNCHFLAG = 0x0000005a;
enum DISPID_LAUNCHIE = 0x0000005b;
enum DISPID_RESETEXPERIMENTALFLAGS = 0x0000005c;
enum DISPID_GETCVLISTDATA = 0x0000005d;
enum DISPID_GETCVLISTLOCALDATA = 0x0000005e;
enum DISPID_GETEMIELISTDATA = 0x0000005f;
enum DISPID_GETEMIELISTLOCALDATA = 0x00000060;
enum DISPID_OPENFAVORITESPANE = 0x00000061;
enum DISPID_OPENFAVORITESSETTINGS = 0x00000062;
enum DISPID_LAUNCHINHVSI = 0x00000063;
enum DISPID_GETNEEDHVSIAUTOLAUNCHFLAG = 0x00000064;
enum DISPID_SETNEEDHVSIAUTOLAUNCHFLAG = 0x00000065;
enum DISPID_HASNEEDHVSIAUTOLAUNCHFLAG = 0x00000066;
enum DISPID_GETOSSKU = 0x00000067;
enum DISPID_SETMSDEFAULTS = 0x00000068;
enum DISPID_SHELLUIHELPERLAST = 0x00000069;
enum DISPID_ADVANCEERROR = 0x0000000a;
enum DISPID_RETREATERROR = 0x0000000b;
enum DISPID_CANADVANCEERROR = 0x0000000c;
enum DISPID_CANRETREATERROR = 0x0000000d;
enum DISPID_GETERRORLINE = 0x0000000e;
enum DISPID_GETERRORCHAR = 0x0000000f;
enum DISPID_GETERRORCODE = 0x00000010;
enum DISPID_GETERRORMSG = 0x00000011;
enum DISPID_GETERRORURL = 0x00000012;
enum DISPID_GETDETAILSSTATE = 0x00000013;
enum DISPID_SETDETAILSSTATE = 0x00000014;
enum DISPID_GETPERERRSTATE = 0x00000015;
enum DISPID_SETPERERRSTATE = 0x00000016;
enum DISPID_GETALWAYSSHOWLOCKSTATE = 0x00000017;
enum DISPID_FAVSELECTIONCHANGE = 0x00000001;
enum DISPID_SELECTIONCHANGE = 0x00000002;
enum DISPID_DOUBLECLICK = 0x00000003;
enum DISPID_INITIALIZED = 0x00000004;
enum DISPID_MOVESELECTIONUP = 0x00000001;
enum DISPID_MOVESELECTIONDOWN = 0x00000002;
enum DISPID_RESETSORT = 0x00000003;
enum DISPID_NEWFOLDER = 0x00000004;
enum DISPID_SYNCHRONIZE = 0x00000005;
enum DISPID_IMPORT = 0x00000006;
enum DISPID_EXPORT = 0x00000007;
enum DISPID_INVOKECONTEXTMENU = 0x00000008;
enum DISPID_MOVESELECTIONTO = 0x00000009;
enum DISPID_SUBSCRIPTIONSENABLED = 0x0000000a;
enum DISPID_CREATESUBSCRIPTION = 0x0000000b;
enum DISPID_DELETESUBSCRIPTION = 0x0000000c;
enum DISPID_SETROOT = 0x0000000d;
enum DISPID_ENUMOPTIONS = 0x0000000e;
enum DISPID_SELECTEDITEM = 0x0000000f;
enum DISPID_ROOT = 0x00000010;
enum DISPID_DEPTH = 0x00000011;
enum DISPID_MODE = 0x00000012;
enum DISPID_FLAGS = 0x00000013;
enum DISPID_TVFLAGS = 0x00000014;
enum DISPID_NSCOLUMNS = 0x00000015;
enum DISPID_COUNTVIEWTYPES = 0x00000016;
enum DISPID_SETVIEWTYPE = 0x00000017;
enum DISPID_SELECTEDITEMS = 0x00000018;
enum DISPID_EXPAND = 0x00000019;
enum DISPID_UNSELECTALL = 0x0000001a;
enum TF_NAVIGATE = 0x7faeabac;
enum TARGET_NOTIFY_OBJECT_NAME = "863a99a0-21bc-11d0-82b4-00a0c90c29c5";
enum IEPROCESS_MODULE_NAME = "IERtUtil.dll";
enum IEGetProcessModule_PROC_NAME = "IEGetProcessModule";
enum IEGetTabWindowExports_PROC_NAME = "IEGetTabWindowExports";
enum TSZMICROSOFTPATH = "Software\\Microsoft";
enum SZ_IE_MAIN = "Main";
enum REGSTR_VAL_SMOOTHSCROLL = "SmoothScroll";
enum REGSTR_VAL_SMOOTHSCROLL_DEF = 0x00000001;
enum REGSTR_VAL_SHOWTOOLBAR = "Show_ToolBar";
enum REGSTR_VAL_SHOWADDRESSBAR = "Show_URLToolBar";
enum REGSTR_VAL_STARTPAGE = "Start Page";
enum REGSTRA_VAL_STARTPAGE = "Start Page";
enum REGSTR_VAL_SEARCHPAGE = "Search Page";
enum REGSTR_VAL_LOCALPAGE = "Local Page";
enum REGSTR_VAL_USESTYLESHEETS = "Use Stylesheets";
enum REGSTR_VAL_USESTYLESHEETS_DEF = "yes";
enum REGSTR_VAL_USEICM = "UseICM";
enum REGSTR_VAL_USEICM_DEF = 0x00000000;
enum REGSTR_VAL_SHOWFOCUS = "Tabstop - MouseDown";
enum REGSTR_VAL_SHOWFOCUS_DEF = "no";
enum REGSTR_VAL_LOADIMAGES = "Display Inline Images";
enum REGSTR_VAL_PLAYSOUNDS = "Play_Background_Sounds";
enum REGSTR_VAL_PLAYVIDEOS = "Display Inline Videos";
enum REGSTR_VAL_ANCHORUNDERLINE = "Anchor Underline";
enum REGSTR_VAL_USEDLGCOLORS = "Use_DlgBox_Colors";
enum REGSTR_VAL_CHECKASSOC = "Check_Associations";
enum REGSTR_VAL_SHOWFULLURLS = "Show_FullURL";
enum REGSTR_VAL_AUTOSEARCH = "Do404Search";
enum REGSTR_VAL_AUTONAVIGATE = "SearchForExtensions";
enum REGSTR_VAL_HTTP_ERRORS = "Friendly http errors";
enum REGSTR_VAL_USEIBAR = "UseBar";
enum SZ_IE_SETTINGS = "Settings";
enum REGSTR_VAL_IE_CUSTOMCOLORS = "Custom Colors";
enum REGSTR_VAL_ANCHORCOLOR = "Anchor Color";
enum REGSTR_VAL_ANCHORCOLORVISITED = "Anchor Color Visited";
enum REGSTR_VAL_BACKGROUNDCOLOR = "Background Color";
enum REGSTR_VAL_TEXTCOLOR = "Text Color";
enum REGSTR_VAL_ANCHORCOLORHOVER = "Anchor Color Hover";
enum REGSTR_VAL_USEHOVERCOLOR = "Use Anchor Hover Color";
enum SZ_IE_SECURITY = "Security";
enum REGSTR_VAL_SAFETYWARNINGLEVEL = "Safety Warning Level";
enum SZ_IE_DEFAULT_HTML_EDITOR = "Default HTML Editor";
enum REGSTR_VAL_USEAUTOAPPEND = "Append Completion";
enum REGSTR_VAL_USEAUTOSUGGEST = "AutoSuggest";
enum REGSTR_VAL_USEAUTOCOMPLETE = "Use AutoComplete";
enum SZ_IE_IBAR = "Bar";
enum SZ_IE_IBAR_BANDS = "Bands";
enum REGSTR_VAL_USERAGENT = "User Agent";
enum REGSTR_VAL_INTERNETENTRY = "InternetProfile";
enum REGSTR_VAL_INTERNETPROFILE = "InternetProfile";
enum REGSTR_VAL_INTERNETENTRYBKUP = "BackupInternetProfile";
enum REGSTR_VAL_CODEDOWNLOAD = "Code Download";
enum REGSTR_VAL_CODEDOWNLOAD_DEF = "yes";
enum REGSTR_PATH_INETCPL_RESTRICTIONS = "Software\\Policies\\Microsoft\\Internet Explorer\\Control Panel";
enum REGSTR_VAL_INETCPL_GENERALTAB = "GeneralTab";
enum REGSTR_VAL_INETCPL_SECURITYTAB = "SecurityTab";
enum REGSTR_VAL_INETCPL_CONTENTTAB = "ContentTab";
enum REGSTR_VAL_INETCPL_CONNECTIONSTAB = "ConnectionsTab";
enum REGSTR_VAL_INETCPL_PROGRAMSTAB = "ProgramsTab";
enum REGSTR_VAL_INETCPL_ADVANCEDTAB = "AdvancedTab";
enum REGSTR_VAL_INETCPL_PRIVACYTAB = "PrivacyTab";
enum REGSTR_VAL_INETCPL_IEAK = "IEAKContext";
enum REGSTR_VAL_DIRECTORY = "Directory";
enum REGSTR_VAL_NEWDIRECTORY = "NewDirectory";
enum REGSTR_VAL_CACHEPREFIX = "CachePrefix";
enum SZ_IE_SEARCHSTRINGS = "UrlTemplate";
enum MAX_SEARCH_FORMAT_STRING = 0x000000ff;
enum SZ_IE_THRESHOLDS = "ErrorThresholds";
enum REGSTR_VAL_ACCESSMEDIUM = "AccessMedium";
enum REGSTR_VAL_ACCESSTYPE = "AccessType";
enum REGSTR_VAL_AUTODIALDLLNAME = "AutodialDllName";
enum REGSTR_VAL_AUTODIALFCNNAME = "AutodialFcnName";
enum REGSTR_VAL_AUTODIAL_MONITORCLASSNAME = "MS_AutodialMonitor";
enum REGSTR_VAL_AUTODIAL_TRYONLYONCE = "TryAutodialOnce";
enum REGSTR_PATH_REMOTEACCESS = "RemoteAccess";
enum REGSTR_PATH_REMOTEACESS = "RemoteAccess";
enum REGSTR_VAL_RNAINSTALLED = "Installed";
enum REGSTR_VAL_ENABLEAUTODIAL = "EnableAutodial";
enum REGSTR_VAL_ENABLEUNATTENDED = "EnableUnattended";
enum REGSTR_VAL_NONETAUTODIAL = "NoNetAutodial";
enum REGSTR_VAL_REDIALATTEMPTS = "RedialAttempts";
enum REGSTR_VAL_REDIALINTERVAL = "RedialWait";
enum REGSTR_VAL_ENABLEAUTODIALDISCONNECT = "EnableAutodisconnect";
enum REGSTR_VAL_ENABLEAUTODISCONNECT = "EnableAutodisconnect";
enum REGSTR_VAL_ENABLEEXITDISCONNECT = "EnableExitDisconnect";
enum REGSTR_VAL_ENABLESECURITYCHECK = "EnableSecurityCheck";
enum REGSTR_VAL_COVEREXCLUDE = "CoverExclude";
enum REGSTR_VAL_DISCONNECTIDLETIME = "DisconnectIdleTime";
enum REGSTR_VAL_MOSDISCONNECT = "DisconnectTimeout";
enum REGSTR_VAL_PROXYENABLE = "ProxyEnable";
enum REGSTR_VAL_PROXYSERVER = "ProxyServer";
enum REGSTR_VAL_PROXYOVERRIDE = "ProxyOverride";
enum REGSTR_VAL_BYPASSAUTOCONFIG = "BypassAutoconfig";
enum SZTRUSTWARNLEVEL = "Trust Warning Level";
enum REGSTR_VAL_TRUSTWARNINGLEVEL_HIGH = "High";
enum REGSTR_VAL_TRUSTWARNINGLEVEL_MED = "Medium";
enum REGSTR_VAL_TRUSTWARNINGLEVEL_LOW = "No Security";
enum REGSTR_VAL_SECURITYWARNONSEND = "WarnOnPost";
enum REGSTR_VAL_SECURITYWARNONSEND_DEF = 0x00000001;
enum REGSTR_VAL_SECURITYWARNONSENDALWAYS = "WarnAlwaysOnPost";
enum REGSTR_VAL_SECURITYWARNONSENDALWAYS_DEF = 0x00000001;
enum REGSTR_VAL_SECURITYWARNONVIEW = "WarnOnView";
enum REGSTR_VAL_SECURITYWARNONVIEW_DEF = 0x00000001;
enum REGSTR_VAL_SECURITYALLOWCOOKIES = "AllowCookies";
enum REGSTR_VAL_SECURITYALLOWCOOKIES_DEF = 0x00000001;
enum REGSTR_VAL_SECURITYWARNONZONECROSSING = "WarnOnZoneCrossing";
enum REGSTR_VAL_SECURITYWARNONZONECROSSING_DEF = 0x00000001;
enum REGSTR_VAL_SECURITYWARNONBADCERTVIEWING = "WarnOnBadCertRecving";
enum REGSTR_VAL_SECURITYWARNONBADCERTVIEWING_DEF = 0x00000001;
enum REGSTR_VAL_SECURITYWARNONBADCERTSENDING = "WarnOnBadCertSending";
enum REGSTR_VAL_SECURITYWARNONBADCERTSENDING_DEF = 0x00000001;
enum REGSTR_VAL_SECURITYDISABLECACHINGOFSSLPAGES = "DisableCachingOfSSLPages";
enum REGSTR_VAL_SECURITYDISABLECACHINGOFSSLPAGES_DEF = 0x00000000;
enum REGSTR_VAL_SECURITYACTIVEX = "Security_RunActiveXControls";
enum REGSTR_VAL_SECURITYACTIVEX_DEF = 0x00000001;
enum REGSTR_VAL_SECURITYACTICEXSCRIPTS = "Security_RunScripts";
enum REGSTR_VAL_SECURITYACTICEXSCRIPTS_DEF = 0x00000001;
enum REGSTR_VAL_SECURITYJAVA = "Security_RunJavaApplets";
enum REGSTR_VAL_SECURITYJAVA_DEF = 0x00000001;
enum SZJAVAVMPATH = "\\Java VM";
enum REGSTR_VAL_JAVAJIT = "EnableJIT";
enum REGSTR_VAL_JAVAJIT_DEF = 0x00000000;
enum REGSTR_VAL_JAVALOGGING = "EnableLogging";
enum REGSTR_VAL_JAVALOGGING_DEF = 0x00000000;
enum SZTOOLBAR = "\\Toolbar";
enum REGSTR_VAL_DAYSTOKEEP = "DaysToKeep";
enum SZNOTEXT = "NoText";
enum SZVISIBLE = "VisibleBands";
enum REGSTR_VAL_VISIBLEBANDS = "VisibleBands";
enum REGSTR_VAL_VISIBLEBANDS_DEF = 0x00000007;
enum TOOLSBAND = 0x00000001;
enum ADDRESSBAND = 0x00000002;
enum LINKSBAND = 0x00000004;
enum SZBACKBITMAP = "BackBitmap";
enum REGSTR_VAL_BACKBITMAP = "BackBitmap";
enum REGSTR_SHIFTQUICKSUFFIX = "ShiftQuickCompleteSuffix";
enum TSZSCHANNELPATH = "SYSTEM\\CurrentControlSet\\Control\\SecurityProviders\\SCHANNEL";
enum REGSTR_VAL_SCHANNELENABLEPROTOCOL = "Enabled";
enum REGSTR_VAL_SCHANNELENABLEPROTOCOL_DEF = 0x00000001;
enum TSZINTERNETCLIENTSPATH = "Software\\Microsoft\\Internet Explorer\\Unix";
enum REGSTR_PATH_DEFAULT = "default";
enum REGSTR_PATH_CURRENT = "current";
enum IE_USE_OE_PRESENT_HKEY = 0xffffffff80000002;
enum IE_USE_OE_PRESENT_KEY = "Software\\Microsoft\\Windows\\CurrentVersion\\app.paths\\msimn.exe";
enum IE_USE_OE_MAIL_HKEY = 0xffffffff80000001;
enum IE_USE_OE_MAIL_KEY = "Software\\Microsoft\\Internet Explorer\\Mail";
enum IE_USE_OE_MAIL_VALUE = "Use Outlook Express";
enum IE_USE_OE_NEWS_HKEY = 0xffffffff80000001;
enum IE_USE_OE_NEWS_KEY = "Software\\Microsoft\\Internet Explorer\\News";
enum IE_USE_OE_NEWS_VALUE = "Use Outlook Express";
enum TSZPROTOCOLSPATH = "Protocols\\";
enum TSZMAILTOPROTOCOL = "mailto";
enum TSZNEWSPROTOCOL = "news";
enum TSZCALLTOPROTOCOL = "callto";
enum TSZLDAPPROTOCOL = "ldap";
enum TSZCALENDARPROTOCOL = "unk";
enum TSZVSOURCEPROTOCOL = "view source";
enum REGSTR_VAL_DEFAULT_CODEPAGE = "Default_CodePage";
enum REGSTR_VAL_DEFAULT_SCRIPT = "Default_Script";
enum REGSTR_VAL_ACCEPT_LANGUAGE = "AcceptLanguage";
enum REGSTR_VAL_FONT_SCRIPTS = "Scripts";
enum REGSTR_VAL_FONT_SCRIPT = "Script";
enum REGSTR_VAL_FONT_SCRIPT_NAME = "Script";
enum REGSTR_VAL_DEF_ENCODING = "Default_Encoding";
enum REGSTR_VAL_DEF_INETENCODING = "Default_InternetEncoding";
enum REGSTR_VAL_FIXED_FONT = "IEFixedFontName";
enum REGSTR_VAL_SCRIPT_FIXED_FONT = "IEFixedFontName";
enum REGSTR_VAL_PROP_FONT = "IEPropFontName";
enum REGSTR_VAL_SCRIPT_PROP_FONT = "IEPropFontName";
enum REGSTR_VAL_FONT_SIZE = "IEFontSize";
enum REGSTR_VAL_FONT_SIZE_DEF = 0x00000002;
enum REGSTR_VAL_AUTODETECT = "AutoDetect";
enum REGSTR_PATH_MIME_DATABASE = "MIME\\Database";
enum REGSTR_VAL_CODEPAGE = "CodePage";
enum REGSTR_VAL_INETENCODING = "InternetEncoding";
enum REGSTR_VAL_FAMILY = "Family";
enum REGSTR_VAL_LEVEL = "Level";
enum REGSTR_VAL_ALIASTO = "AliasForCharset";
enum REGSTR_VAL_ENCODENAME = "EncodingName";
enum REGSTR_VAL_DESCRIPTION = "Description";
enum REGSTR_VAL_WEBCHARSET = "WebCharset";
enum REGSTR_VAL_BODYCHARSET = "BodyCharset";
enum REGSTR_VAL_HEADERCHARSET = "HeaderCharset";
enum REGSTR_VAL_FIXEDWIDTHFONT = "FixedWidthFont";
enum REGSTR_VAL_PROPORTIONALFONT = "ProportionalFont";
enum REGSTR_VAL_PRIVCONVERTER = "PrivConverter";
enum IECMDID_CLEAR_AUTOCOMPLETE_FOR_FORMS = 0x00000000;
enum IECMDID_SETID_AUTOCOMPLETE_FOR_FORMS = 0x00000001;
enum IECMDID_BEFORENAVIGATE_GETSHELLBROWSE = 0x00000002;
enum IECMDID_BEFORENAVIGATE_DOEXTERNALBROWSE = 0x00000003;
enum IECMDID_BEFORENAVIGATE_GETIDLIST = 0x00000004;
enum IECMDID_SET_INVOKE_DEFAULT_BROWSER_ON_NEW_WINDOW = 0x00000005;
enum IECMDID_GET_INVOKE_DEFAULT_BROWSER_ON_NEW_WINDOW = 0x00000006;
enum IECMDID_ARG_CLEAR_FORMS_ALL = 0x00000000;
enum IECMDID_ARG_CLEAR_FORMS_ALL_BUT_PASSWORDS = 0x00000001;
enum IECMDID_ARG_CLEAR_FORMS_PASSWORDS_ONLY = 0x00000002;
enum CATID_MSOfficeAntiVirus = GUID(0x56ffcc30, 0xd398, 0x11d0, [0xb2, 0xae, 0x0, 0xa0, 0xc9, 0x8, 0xfa, 0x49]);
enum msoedmEnable = 0x00000001;
enum msoedmDisable = 0x00000002;
enum msoedmDontOpen = 0x00000003;
enum msoslUndefined = 0x00000000;
enum msoslNone = 0x00000001;
enum msoslMedium = 0x00000002;
enum msoslHigh = 0x00000003;
enum msodsvNoMacros = 0x00000000;
enum msodsvUnsigned = 0x00000001;
enum msodsvPassedTrusted = 0x00000002;
enum msodsvFailed = 0x00000003;
enum msodsvLowSecurityLevel = 0x00000004;
enum msodsvPassedTrustedCert = 0x00000005;
enum STATURL_QUERYFLAG_ISCACHED = 0x00010000;
enum STATURL_QUERYFLAG_NOURL = 0x00020000;
enum STATURL_QUERYFLAG_NOTITLE = 0x00040000;
enum STATURL_QUERYFLAG_TOPLEVEL = 0x00080000;
enum STATURLFLAG_ISCACHED = 0x00000001;
enum STATURLFLAG_ISTOPLEVEL = 0x00000002;
enum SURFACE_LOCK_EXCLUSIVE = 0x00000001;
enum SURFACE_LOCK_ALLOW_DISCARD = 0x00000002;
enum SURFACE_LOCK_WAIT = 0x00000004;
enum E_SURFACE_NOSURFACE = 0xffffffff8000c000;
enum E_SURFACE_UNKNOWN_FORMAT = 0xffffffff8000c001;
enum E_SURFACE_NOTMYPOINTER = 0xffffffff8000c002;
enum E_SURFACE_DISCARDED = 0xffffffff8000c003;
enum E_SURFACE_NODC = 0xffffffff8000c004;
enum E_SURFACE_NOTMYDC = 0xffffffff8000c005;
enum S_SURFACE_DISCARDED = 0x0000c003;
enum COLOR_NO_TRANSPARENT = 0xffffffff;
enum IMGDECODE_EVENT_PROGRESS = 0x00000001;
enum IMGDECODE_EVENT_PALETTE = 0x00000002;
enum IMGDECODE_EVENT_BEGINBITS = 0x00000004;
enum IMGDECODE_EVENT_BITSCOMPLETE = 0x00000008;
enum IMGDECODE_EVENT_USEDDRAW = 0x00000010;
enum IMGDECODE_HINT_TOPDOWN = 0x00000001;
enum IMGDECODE_HINT_BOTTOMUP = 0x00000002;
enum IMGDECODE_HINT_FULLWIDTH = 0x00000004;
enum MAPMIME_DEFAULT = 0x00000000;
enum MAPMIME_CLSID = 0x00000001;
enum MAPMIME_DISABLE = 0x00000002;
enum MAPMIME_DEFAULT_ALWAYS = 0x00000003;
enum TIMERMODE_NORMAL = 0x00000000;
enum TIMERMODE_VISIBILITYAWARE = 0x00000001;
enum IID_IDocObjectService = GUID(0x3050f801, 0x98b5, 0x11cf, [0xbb, 0x82, 0x0, 0xaa, 0x0, 0xbd, 0xce, 0xb]);
interface IDocObjectService : IUnknown
{
    HRESULT FireBeforeNavigate2(IDispatch, const(wchar)*, uint, const(wchar)*, ubyte*, uint, const(wchar)*, BOOL, BOOL*);
    HRESULT FireNavigateComplete2(IHTMLWindow2, uint);
    HRESULT FireDownloadBegin();
    HRESULT FireDownloadComplete();
    HRESULT FireDocumentComplete(IHTMLWindow2, uint);
    HRESULT UpdateDesktopComponent(IHTMLWindow2);
    HRESULT GetPendingUrl(BSTR*);
    HRESULT ActiveElementChanged(IHTMLElement);
    HRESULT GetUrlSearchComponent(BSTR*);
    HRESULT IsErrorUrl(const(wchar)*, BOOL*);
}
enum IID_IDownloadManager = GUID(0x988934a4, 0x64b, 0x11d3, [0xbb, 0x80, 0x0, 0x10, 0x4b, 0x35, 0xe7, 0xf9]);
interface IDownloadManager : IUnknown
{
    HRESULT Download(IMoniker, IBindCtx, uint, int, BINDINFO*, const(wchar)*, const(wchar)*, uint);
}
alias ExtensionValidationContexts = int;
enum : int
{
    ExtensionValidationContextNone    = 0x00000000,
    ExtensionValidationContextDynamic = 0x00000001,
    ExtensionValidationContextParsed  = 0x00000002,
}

alias ExtensionValidationResults = int;
enum : int
{
    ExtensionValidationResultNone             = 0x00000000,
    ExtensionValidationResultDoNotInstantiate = 0x00000001,
    ExtensionValidationResultArrestPageLoad   = 0x00000002,
}

enum IID_IExtensionValidation = GUID(0x7d33f73d, 0x8525, 0x4e0f, [0x87, 0xdb, 0x83, 0x2, 0x88, 0xba, 0xff, 0x44]);
interface IExtensionValidation : IUnknown
{
    HRESULT Validate(const(GUID)*, PWSTR, uint, uint, IHTMLDocument2, IHTMLDocument2, IHTMLElement, ExtensionValidationContexts, ExtensionValidationResults*);
    HRESULT DisplayName(PWSTR*);
}
enum CLSID_HomePageSetting = GUID(0x374cede0, 0x873a, 0x4c4f, [0xbc, 0x86, 0xbc, 0xc8, 0xcf, 0x51, 0x16, 0xa3]);
struct HomePageSetting
{
}
enum IID_IHomePageSetting = GUID(0xfdfc244f, 0x18fa, 0x4ff2, [0xb0, 0x8e, 0x1d, 0x61, 0x8f, 0x3f, 0xfb, 0xe4]);
interface IHomePageSetting : IUnknown
{
    HRESULT SetHomePage(HWND, const(wchar)*, const(wchar)*);
    HRESULT IsHomePage(const(wchar)*, BOOL*);
    HRESULT SetHomePageToBrowserDefault();
}
enum IID_ITargetNotify = GUID(0x863a99a0, 0x21bc, 0x11d0, [0x82, 0xb4, 0x0, 0xa0, 0xc9, 0xc, 0x29, 0xc5]);
interface ITargetNotify : IUnknown
{
    HRESULT OnCreate(IUnknown, uint);
    HRESULT OnReuse(IUnknown);
}
enum IID_ITargetNotify2 = GUID(0x3050f6b1, 0x98b5, 0x11cf, [0xbb, 0x82, 0x0, 0xaa, 0x0, 0xbd, 0xce, 0xb]);
interface ITargetNotify2 : ITargetNotify
{
    HRESULT GetOptionString(BSTR*);
}
alias FINDFRAME_FLAGS = int;
enum : int
{
    FINDFRAME_NONE              = 0x00000000,
    FINDFRAME_JUSTTESTEXISTENCE = 0x00000001,
    FINDFRAME_INTERNAL          = 0x80000000,
}

alias FRAMEOPTIONS_FLAGS = int;
enum : int
{
    FRAMEOPTIONS_SCROLL_YES  = 0x00000001,
    FRAMEOPTIONS_SCROLL_NO   = 0x00000002,
    FRAMEOPTIONS_SCROLL_AUTO = 0x00000004,
    FRAMEOPTIONS_NORESIZE    = 0x00000008,
    FRAMEOPTIONS_NO3DBORDER  = 0x00000010,
    FRAMEOPTIONS_DESKTOP     = 0x00000020,
    FRAMEOPTIONS_BROWSERBAND = 0x00000040,
}

enum IID_ITargetFrame2 = GUID(0x86d52e11, 0x94a8, 0x11d0, [0x82, 0xaf, 0x0, 0xc0, 0x4f, 0xd5, 0xae, 0x38]);
interface ITargetFrame2 : IUnknown
{
    HRESULT SetFrameName(const(wchar)*);
    HRESULT GetFrameName(PWSTR*);
    HRESULT GetParentFrame(IUnknown*);
    HRESULT SetFrameSrc(const(wchar)*);
    HRESULT GetFrameSrc(PWSTR*);
    HRESULT GetFramesContainer(IOleContainer*);
    HRESULT SetFrameOptions(uint);
    HRESULT GetFrameOptions(uint*);
    HRESULT SetFrameMargins(uint, uint);
    HRESULT GetFrameMargins(uint*, uint*);
    HRESULT FindFrame(const(wchar)*, uint, IUnknown*);
    HRESULT GetTargetAlias(const(wchar)*, PWSTR*);
}
enum IID_ITargetContainer = GUID(0x7847ec01, 0x2bec, 0x11d0, [0x82, 0xb4, 0x0, 0xa0, 0xc9, 0xc, 0x29, 0xc5]);
interface ITargetContainer : IUnknown
{
    HRESULT GetFrameUrl(PWSTR*);
    HRESULT GetFramesContainer(IOleContainer*);
}
alias NAVIGATEFRAME_FLAGS = int;
enum : int
{
    NAVIGATEFRAME_FL_RECORD                   = 0x00000001,
    NAVIGATEFRAME_FL_POST                     = 0x00000002,
    NAVIGATEFRAME_FL_NO_DOC_CACHE             = 0x00000004,
    NAVIGATEFRAME_FL_NO_IMAGE_CACHE           = 0x00000008,
    NAVIGATEFRAME_FL_AUTH_FAIL_CACHE_OK       = 0x00000010,
    NAVIGATEFRAME_FL_SENDING_FROM_FORM        = 0x00000020,
    NAVIGATEFRAME_FL_REALLY_SENDING_FROM_FORM = 0x00000040,
}

struct NAVIGATEDATA
{
    uint ulTarget;
    uint ulURL;
    uint ulRefURL;
    uint ulPostData;
    uint dwFlags;
}
enum IID_ITargetFrame = GUID(0xd5f78c80, 0x5252, 0x11cf, [0x90, 0xfa, 0x0, 0xaa, 0x0, 0x42, 0x10, 0x6e]);
interface ITargetFrame : IUnknown
{
    HRESULT SetFrameName(const(wchar)*);
    HRESULT GetFrameName(PWSTR*);
    HRESULT GetParentFrame(IUnknown*);
    HRESULT FindFrame(const(wchar)*, IUnknown, uint, IUnknown*);
    HRESULT SetFrameSrc(const(wchar)*);
    HRESULT GetFrameSrc(PWSTR*);
    HRESULT GetFramesContainer(IOleContainer*);
    HRESULT SetFrameOptions(uint);
    HRESULT GetFrameOptions(uint*);
    HRESULT SetFrameMargins(uint, uint);
    HRESULT GetFrameMargins(uint*, uint*);
    HRESULT RemoteNavigate(uint, uint*);
    HRESULT OnChildFrameActivate(IUnknown);
    HRESULT OnChildFrameDeactivate(IUnknown);
}
enum IID_ITargetEmbedding = GUID(0x548793c0, 0x9e74, 0x11cf, [0x96, 0x55, 0x0, 0xa0, 0xc9, 0x3, 0x49, 0x23]);
interface ITargetEmbedding : IUnknown
{
    HRESULT GetTargetFrame(ITargetFrame*);
}
enum IID_ITargetFramePriv = GUID(0x9216e421, 0x2bf5, 0x11d0, [0x82, 0xb4, 0x0, 0xa0, 0xc9, 0xc, 0x29, 0xc5]);
interface ITargetFramePriv : IUnknown
{
    HRESULT FindFrameDownwards(const(wchar)*, uint, IUnknown*);
    HRESULT FindFrameInContext(const(wchar)*, IUnknown, uint, IUnknown*);
    HRESULT OnChildFrameActivate(IUnknown);
    HRESULT OnChildFrameDeactivate(IUnknown);
    HRESULT NavigateHack(uint, IBindCtx, IBindStatusCallback, const(wchar)*, const(wchar)*, const(wchar)*);
    HRESULT FindBrowserByIndex(uint, IUnknown*);
}
enum IID_ITargetFramePriv2 = GUID(0xb2c867e6, 0x69d6, 0x46f2, [0xa6, 0x11, 0xde, 0xd9, 0xa4, 0xbd, 0x7f, 0xef]);
interface ITargetFramePriv2 : ITargetFramePriv
{
    HRESULT AggregatedNavigation2(uint, IBindCtx, IBindStatusCallback, const(wchar)*, IUri, const(wchar)*);
}
enum IID_ISurfacePresenterFlipBuffer = GUID(0xe43f4a08, 0x8bbc, 0x4665, [0xac, 0x92, 0xc5, 0x5c, 0xe6, 0x1f, 0xd7, 0xe7]);
interface ISurfacePresenterFlipBuffer : IUnknown
{
    HRESULT BeginDraw(const(GUID)*, void**);
    HRESULT EndDraw();
}
enum IID_ISurfacePresenterFlip = GUID(0x30510848, 0x98b5, 0x11cf, [0xbb, 0x82, 0x0, 0xaa, 0x0, 0xbd, 0xce, 0xb]);
interface ISurfacePresenterFlip : IUnknown
{
    HRESULT Present();
    HRESULT GetBuffer(uint, const(GUID)*, void**);
}
enum IID_ISurfacePresenterFlip2 = GUID(0x30510865, 0x98b5, 0x11cf, [0xbb, 0x82, 0x0, 0xaa, 0x0, 0xbd, 0xce, 0xb]);
interface ISurfacePresenterFlip2 : IUnknown
{
    HRESULT SetRotation(DXGI_MODE_ROTATION);
}
enum IID_IViewObjectPresentFlipSite = GUID(0x30510846, 0x98b5, 0x11cf, [0xbb, 0x82, 0x0, 0xaa, 0x0, 0xbd, 0xce, 0xb]);
interface IViewObjectPresentFlipSite : IUnknown
{
    HRESULT CreateSurfacePresenterFlip(IUnknown, uint, uint, uint, DXGI_FORMAT, VIEW_OBJECT_ALPHA_MODE, ISurfacePresenterFlip*);
    HRESULT GetDeviceLuid(LUID*);
    HRESULT EnterFullScreen();
    HRESULT ExitFullScreen();
    HRESULT IsFullScreen(BOOL*);
    HRESULT GetBoundingRect(RECT*);
    HRESULT GetMetrics(POINT*, SIZE*, float*, float*);
    HRESULT GetFullScreenSize(SIZE*);
}
enum IID_IViewObjectPresentFlipSite2 = GUID(0xaad0cbf1, 0xe7fd, 0x4f12, [0x89, 0x2, 0xc7, 0x81, 0x32, 0xa8, 0xe0, 0x1d]);
interface IViewObjectPresentFlipSite2 : IUnknown
{
    HRESULT GetRotationForCurrentOutput(DXGI_MODE_ROTATION*);
}
enum IID_IViewObjectPresentFlip = GUID(0x30510847, 0x98b5, 0x11cf, [0xbb, 0x82, 0x0, 0xaa, 0x0, 0xbd, 0xce, 0xb]);
interface IViewObjectPresentFlip : IUnknown
{
    HRESULT NotifyRender(BOOL);
    HRESULT RenderObjectToBitmap(IUnknown);
    HRESULT RenderObjectToSharedBuffer(ISurfacePresenterFlipBuffer);
}
enum IID_IViewObjectPresentFlip2 = GUID(0x30510856, 0x98b5, 0x11cf, [0xbb, 0x82, 0x0, 0xaa, 0x0, 0xbd, 0xce, 0xb]);
interface IViewObjectPresentFlip2 : IUnknown
{
    HRESULT NotifyLeavingView();
}
enum IID_IActiveXUIHandlerSite2 = GUID(0x7e3707b2, 0xd087, 0x4542, [0xac, 0x1f, 0xa0, 0xd2, 0xfc, 0xd0, 0x80, 0xfd]);
interface IActiveXUIHandlerSite2 : IUnknown
{
    HRESULT AddSuspensionExemption(ulong*);
    HRESULT RemoveSuspensionExemption(ulong);
}
enum IID_ICaretPositionProvider = GUID(0x58da43a2, 0x108e, 0x4d5b, [0x9f, 0x75, 0xe5, 0xf7, 0x4f, 0x93, 0xff, 0xf5]);
interface ICaretPositionProvider : IUnknown
{
    HRESULT GetCaretPosition(POINT*, float*);
}
enum IID_ITridentTouchInput = GUID(0x30510850, 0x98b5, 0x11cf, [0xbb, 0x82, 0x0, 0xaa, 0x0, 0xbd, 0xce, 0xb]);
interface ITridentTouchInput : IUnknown
{
    HRESULT OnPointerMessage(uint, WPARAM, LPARAM, BOOL*);
}
enum IID_ITridentTouchInputSite = GUID(0x30510849, 0x98b5, 0x11cf, [0xbb, 0x82, 0x0, 0xaa, 0x0, 0xbd, 0xce, 0xb]);
interface ITridentTouchInputSite : IUnknown
{
    HRESULT SetManipulationMode(styleMsTouchAction);
    HRESULT ZoomToPoint(int, int);
}
alias MEDIA_ACTIVITY_NOTIFY_TYPE = int;
enum : int
{
    MediaPlayback  = 0x00000000,
    MediaRecording = 0x00000001,
    MediaCasting   = 0x00000002,
}

enum IID_IMediaActivityNotifySite = GUID(0x8165cfef, 0x179d, 0x46c2, [0xbc, 0x71, 0x3f, 0xa7, 0x26, 0xdc, 0x1f, 0x8d]);
interface IMediaActivityNotifySite : IUnknown
{
    HRESULT OnMediaActivityStarted(MEDIA_ACTIVITY_NOTIFY_TYPE);
    HRESULT OnMediaActivityStopped(MEDIA_ACTIVITY_NOTIFY_TYPE);
}
enum IID_IAudioSessionSite = GUID(0xd7d8b684, 0xd02d, 0x4517, [0xb6, 0xb7, 0x19, 0xe3, 0xdf, 0xe2, 0x9c, 0x45]);
interface IAudioSessionSite : IUnknown
{
    HRESULT GetAudioSessionGuid(GUID*);
    HRESULT OnAudioStreamCreated(const(wchar)*);
    HRESULT OnAudioStreamDestroyed(const(wchar)*);
}
enum IID_IPrintTaskRequestHandler = GUID(0x191cd340, 0xcf36, 0x44ff, [0xbd, 0x53, 0xd1, 0xb7, 0x1, 0x79, 0x9d, 0x9b]);
interface IPrintTaskRequestHandler : IUnknown
{
    HRESULT HandlePrintTaskRequest(IInspectable);
}
enum IID_IPrintTaskRequestFactory = GUID(0xbb516745, 0x8c34, 0x4f8b, [0x96, 0x5, 0x68, 0x4d, 0xcb, 0x14, 0x4b, 0xe5]);
interface IPrintTaskRequestFactory : IUnknown
{
    HRESULT CreatePrintTaskRequest(IPrintTaskRequestHandler);
}
enum IID_IScrollableContextMenu = GUID(0x30510854, 0x98b5, 0x11cf, [0xbb, 0x82, 0x0, 0xaa, 0x0, 0xbd, 0xce, 0xb]);
interface IScrollableContextMenu : IUnknown
{
    HRESULT AddItem(const(wchar)*, uint);
    HRESULT ShowModal(int, int, uint*);
}
alias SCROLLABLECONTEXTMENU_PLACEMENT = int;
enum : int
{
    SCMP_TOP    = 0x00000000,
    SCMP_BOTTOM = 0x00000001,
    SCMP_LEFT   = 0x00000002,
    SCMP_RIGHT  = 0x00000003,
    SCMP_FULL   = 0x00000004,
}

enum IID_IScrollableContextMenu2 = GUID(0xf77e9056, 0x8674, 0x4936, [0x92, 0x4c, 0xe, 0x4a, 0x6, 0xfa, 0x63, 0x4a]);
interface IScrollableContextMenu2 : IScrollableContextMenu
{
    HRESULT AddSeparator();
    HRESULT SetPlacement(SCROLLABLECONTEXTMENU_PLACEMENT);
}
enum IID_IActiveXUIHandlerSite = GUID(0x30510853, 0x98b5, 0x11cf, [0xbb, 0x82, 0x0, 0xaa, 0x0, 0xbd, 0xce, 0xb]);
interface IActiveXUIHandlerSite : IUnknown
{
    HRESULT CreateScrollableContextMenu(IScrollableContextMenu*);
    HRESULT PickFileAndGetResult(IUnknown, BOOL, IUnknown*);
}
enum IID_IActiveXUIHandlerSite3 = GUID(0x7904009a, 0x1238, 0x47f4, [0x90, 0x1c, 0x87, 0x13, 0x75, 0xc3, 0x46, 0x8]);
interface IActiveXUIHandlerSite3 : IUnknown
{
    HRESULT MessageBoxW(HWND, const(wchar)*, const(wchar)*, uint, int*);
}
enum CLSID_InternetExplorerManager = GUID(0xdf4fcc34, 0x67a, 0x4e0a, [0x83, 0x52, 0x4a, 0x1a, 0x50, 0x95, 0x34, 0x6e]);
struct InternetExplorerManager
{
}
alias INTERNETEXPLORERCONFIGURATION = int;
enum : int
{
    INTERNETEXPLORERCONFIGURATION_HOST            = 0x00000001,
    INTERNETEXPLORERCONFIGURATION_WEB_DRIVER      = 0x00000002,
    INTERNETEXPLORERCONFIGURATION_WEB_DRIVER_EDGE = 0x00000004,
}

enum IID_IEnumManagerFrames = GUID(0x3caa826a, 0x9b1f, 0x4a79, [0xbc, 0x81, 0xf0, 0x43, 0xd, 0xed, 0x16, 0x48]);
interface IEnumManagerFrames : IUnknown
{
    HRESULT Next(uint, HWND**, uint*);
    HRESULT Count(uint*);
    HRESULT Skip(uint);
    HRESULT Reset();
    HRESULT Clone(IEnumManagerFrames*);
}
enum IID_IInternetExplorerManager = GUID(0xacc84351, 0x4ff, 0x44f9, [0xb2, 0x3f, 0x65, 0x5e, 0xd1, 0x68, 0xc6, 0xd5]);
interface IInternetExplorerManager : IUnknown
{
    HRESULT CreateObject(uint, const(wchar)*, const(GUID)*, void**);
}
enum IID_IInternetExplorerManager2 = GUID(0xdfbb5136, 0x9259, 0x4895, [0xb4, 0xa7, 0xc1, 0x93, 0x44, 0x29, 0x91, 0x9a]);
interface IInternetExplorerManager2 : IUnknown
{
    HRESULT EnumFrameWindows(IEnumManagerFrames*);
}
alias IELAUNCHOPTION_FLAGS = int;
enum : int
{
    IELAUNCHOPTION_SCRIPTDEBUG  = 0x00000001,
    IELAUNCHOPTION_FORCE_COMPAT = 0x00000002,
    IELAUNCHOPTION_FORCE_EDGE   = 0x00000004,
    IELAUNCHOPTION_LOCK_ENGINE  = 0x00000008,
}

struct IELAUNCHURLINFO
{
    uint cbSize;
    uint dwCreationFlags;
    uint dwLaunchOptionFlags;
}
enum CLSID_IEWebDriverManager = GUID(0x90314af2, 0x5250, 0x47b3, [0x89, 0xd8, 0x62, 0x95, 0xfc, 0x23, 0xbc, 0x22]);
struct IEWebDriverManager
{
}
enum IID_IIEWebDriverSite = GUID(0xffb84444, 0x453d, 0x4fbc, [0x9f, 0x9d, 0x8d, 0xb5, 0xc4, 0x71, 0xec, 0x75]);
interface IIEWebDriverSite : IDispatch
{
    HRESULT WindowOperation(uint, uint);
    HRESULT DetachWebdriver(IUnknown);
    HRESULT GetCapabilityValue(IUnknown, PWSTR, VARIANT*);
}
enum IID_IIEWebDriverManager = GUID(0xbd1dc630, 0x6590, 0x4ca2, [0xa2, 0x93, 0x6b, 0xc7, 0x2b, 0x24, 0x38, 0xd8]);
interface IIEWebDriverManager : IDispatch
{
    HRESULT ExecuteCommand(PWSTR, PWSTR*);
}
struct HTMLPersistEvents
{
}
struct LayoutRectEvents
{
}
enum CLSID_PeerFactory = GUID(0x3050f4cf, 0x98b5, 0x11cf, [0xbb, 0x82, 0x0, 0xaa, 0x0, 0xbd, 0xce, 0xb]);
struct PeerFactory
{
}
enum CLSID_IntelliForms = GUID(0x613ab92e, 0x16bf, 0x11d2, [0xbc, 0xa5, 0x0, 0xc0, 0x4f, 0xd9, 0x29, 0xdb]);
struct IntelliForms
{
}
enum CLSID_HomePage = GUID(0x766bf2ae, 0xd650, 0x11d1, [0x98, 0x11, 0x0, 0xc0, 0x4f, 0xc3, 0x1d, 0x2e]);
struct HomePage
{
}
enum CLSID_CPersistUserData = GUID(0x3050f48e, 0x98b5, 0x11cf, [0xbb, 0x82, 0x0, 0xaa, 0x0, 0xbd, 0xce, 0xb]);
struct CPersistUserData
{
}
enum CLSID_CPersistDataPeer = GUID(0x3050f487, 0x98b5, 0x11cf, [0xbb, 0x82, 0x0, 0xaa, 0x0, 0xbd, 0xce, 0xb]);
struct CPersistDataPeer
{
}
enum CLSID_CPersistShortcut = GUID(0x3050f4c6, 0x98b5, 0x11cf, [0xbb, 0x82, 0x0, 0xaa, 0x0, 0xbd, 0xce, 0xb]);
struct CPersistShortcut
{
}
enum CLSID_CPersistHistory = GUID(0x3050f4c8, 0x98b5, 0x11cf, [0xbb, 0x82, 0x0, 0xaa, 0x0, 0xbd, 0xce, 0xb]);
struct CPersistHistory
{
}
enum CLSID_CPersistSnapshot = GUID(0x3050f4c9, 0x98b5, 0x11cf, [0xbb, 0x82, 0x0, 0xaa, 0x0, 0xbd, 0xce, 0xb]);
struct CPersistSnapshot
{
}
enum CLSID_CDownloadBehavior = GUID(0x3050f5be, 0x98b5, 0x11cf, [0xbb, 0x82, 0x0, 0xaa, 0x0, 0xbd, 0xce, 0xb]);
struct CDownloadBehavior
{
}
enum CLSID_wfolders = GUID(0xbae31f9a, 0x1b81, 0x11d2, [0xa9, 0x7a, 0x0, 0xc0, 0x4f, 0x8e, 0xcb, 0x2]);
struct wfolders
{
}
enum CLSID_AnchorClick = GUID(0x13d5413c, 0x33b9, 0x11d2, [0x95, 0xa7, 0x0, 0xc0, 0x4f, 0x8e, 0xcb, 0x2]);
struct AnchorClick
{
}
enum CLSID_CLayoutRect = GUID(0x3050f664, 0x98b5, 0x11cf, [0xbb, 0x82, 0x0, 0xaa, 0x0, 0xbd, 0xce, 0xb]);
struct CLayoutRect
{
}
enum CLSID_CDeviceRect = GUID(0x3050f6d4, 0x98b5, 0x11cf, [0xbb, 0x82, 0x0, 0xaa, 0x0, 0xbd, 0xce, 0xb]);
struct CDeviceRect
{
}
enum CLSID_CHeaderFooter = GUID(0x3050f6cd, 0x98b5, 0x11cf, [0xbb, 0x82, 0x0, 0xaa, 0x0, 0xbd, 0xce, 0xb]);
struct CHeaderFooter
{
}
enum IID_IPeerFactory = GUID(0x6663f9d3, 0xb482, 0x11d1, [0x89, 0xc6, 0x0, 0xc0, 0x4f, 0xb6, 0xbf, 0xc4]);
interface IPeerFactory : IUnknown
{
}
enum IID_IHomePage = GUID(0x766bf2af, 0xd650, 0x11d1, [0x98, 0x11, 0x0, 0xc0, 0x4f, 0xc3, 0x1d, 0x2e]);
interface IHomePage : IDispatch
{
    HRESULT navigateHomePage();
    HRESULT setHomePage(BSTR);
    HRESULT isHomePage(BSTR, VARIANT_BOOL*);
}
enum IID_IIntelliForms = GUID(0x9b9f68e6, 0x1aaa, 0x11d2, [0xbc, 0xa5, 0x0, 0xc0, 0x4f, 0xd9, 0x29, 0xdb]);
interface IIntelliForms : IDispatch
{
    HRESULT get_enabled(VARIANT_BOOL*);
    HRESULT put_enabled(VARIANT_BOOL);
}
enum IID_Iwfolders = GUID(0xbae31f98, 0x1b81, 0x11d2, [0xa9, 0x7a, 0x0, 0xc0, 0x4f, 0x8e, 0xcb, 0x2]);
interface Iwfolders : IDispatch
{
    HRESULT navigate(BSTR, BSTR*);
    HRESULT navigateFrame(BSTR, BSTR, BSTR*);
    HRESULT navigateNoSite(BSTR, BSTR, uint, IUnknown);
}
enum IID_IAnchorClick = GUID(0x13d5413b, 0x33b9, 0x11d2, [0x95, 0xa7, 0x0, 0xc0, 0x4f, 0x8e, 0xcb, 0x2]);
interface IAnchorClick : IDispatch
{
    HRESULT ProcOnClick();
}
enum IID_IHTMLUserDataOM = GUID(0x3050f48f, 0x98b5, 0x11cf, [0xbb, 0x82, 0x0, 0xaa, 0x0, 0xbd, 0xce, 0xb]);
interface IHTMLUserDataOM : IDispatch
{
    HRESULT get_XMLDocument(IDispatch*);
    HRESULT save(BSTR);
    HRESULT load(BSTR);
    HRESULT getAttribute(BSTR, VARIANT*);
    HRESULT setAttribute(BSTR, VARIANT);
    HRESULT removeAttribute(BSTR);
    HRESULT put_expires(BSTR);
    HRESULT get_expires(BSTR*);
}
enum IID_IHTMLPersistDataOM = GUID(0x3050f4c0, 0x98b5, 0x11cf, [0xbb, 0x82, 0x0, 0xaa, 0x0, 0xbd, 0xce, 0xb]);
interface IHTMLPersistDataOM : IDispatch
{
    HRESULT get_XMLDocument(IDispatch*);
    HRESULT getAttribute(BSTR, VARIANT*);
    HRESULT setAttribute(BSTR, VARIANT);
    HRESULT removeAttribute(BSTR);
}
enum IID_IHTMLPersistData = GUID(0x3050f4c5, 0x98b5, 0x11cf, [0xbb, 0x82, 0x0, 0xaa, 0x0, 0xbd, 0xce, 0xb]);
interface IHTMLPersistData : IUnknown
{
    HRESULT save(IUnknown, int, VARIANT_BOOL*);
    HRESULT load(IUnknown, int, VARIANT_BOOL*);
    HRESULT queryType(int, VARIANT_BOOL*);
}
enum IID_IDownloadBehavior = GUID(0x3050f5bd, 0x98b5, 0x11cf, [0xbb, 0x82, 0x0, 0xaa, 0x0, 0xbd, 0xce, 0xb]);
interface IDownloadBehavior : IDispatch
{
    HRESULT startDownload(BSTR, IDispatch);
}
enum IID_ILayoutRect = GUID(0x3050f665, 0x98b5, 0x11cf, [0xbb, 0x82, 0x0, 0xaa, 0x0, 0xbd, 0xce, 0xb]);
interface ILayoutRect : IDispatch
{
    HRESULT put_nextRect(BSTR);
    HRESULT get_nextRect(BSTR*);
    HRESULT put_contentSrc(VARIANT);
    HRESULT get_contentSrc(VARIANT*);
    HRESULT put_honorPageBreaks(VARIANT_BOOL);
    HRESULT get_honorPageBreaks(VARIANT_BOOL*);
    HRESULT put_honorPageRules(VARIANT_BOOL);
    HRESULT get_honorPageRules(VARIANT_BOOL*);
    HRESULT put_nextRectElement(IDispatch);
    HRESULT get_nextRectElement(IDispatch*);
    HRESULT get_contentDocument(IDispatch*);
}
enum IID_IDeviceRect = GUID(0x3050f6d5, 0x98b5, 0x11cf, [0xbb, 0x82, 0x0, 0xaa, 0x0, 0xbd, 0xce, 0xb]);
interface IDeviceRect : IDispatch
{
}
enum IID_IHeaderFooter = GUID(0x3050f6ce, 0x98b5, 0x11cf, [0xbb, 0x82, 0x0, 0xaa, 0x0, 0xbd, 0xce, 0xb]);
interface IHeaderFooter : IDispatch
{
    HRESULT get_htmlHead(BSTR*);
    HRESULT get_htmlFoot(BSTR*);
    HRESULT put_textHead(BSTR);
    HRESULT get_textHead(BSTR*);
    HRESULT put_textFoot(BSTR);
    HRESULT get_textFoot(BSTR*);
    HRESULT put_page(uint);
    HRESULT get_page(uint*);
    HRESULT put_pageTotal(uint);
    HRESULT get_pageTotal(uint*);
    HRESULT put_URL(BSTR);
    HRESULT get_URL(BSTR*);
    HRESULT put_title(BSTR);
    HRESULT get_title(BSTR*);
    HRESULT put_dateShort(BSTR);
    HRESULT get_dateShort(BSTR*);
    HRESULT put_dateLong(BSTR);
    HRESULT get_dateLong(BSTR*);
    HRESULT put_timeShort(BSTR);
    HRESULT get_timeShort(BSTR*);
    HRESULT put_timeLong(BSTR);
    HRESULT get_timeLong(BSTR*);
}
enum IID_IHeaderFooter2 = GUID(0x305104a5, 0x98b5, 0x11cf, [0xbb, 0x82, 0x0, 0xaa, 0x0, 0xbd, 0xce, 0xb]);
interface IHeaderFooter2 : IHeaderFooter
{
    HRESULT put_font(BSTR);
    HRESULT get_font(BSTR*);
}
enum CLSID_OpenServiceManager = GUID(0x98870b6, 0x39ea, 0x480b, [0xb8, 0xb5, 0xdd, 0x1, 0x67, 0xc4, 0xdb, 0x59]);
struct OpenServiceManager
{
}
enum CLSID_OpenServiceActivityManager = GUID(0xc5efd803, 0x50f8, 0x43cd, [0x9a, 0xb8, 0xaa, 0xfc, 0x13, 0x94, 0xc9, 0xe0]);
struct OpenServiceActivityManager
{
}
alias OpenServiceErrors = int;
enum : int
{
    OS_E_NOTFOUND     = 0x80030002,
    OS_E_NOTSUPPORTED = 0x80004021,
    OS_E_CANCELLED    = 0x80002ef1,
    OS_E_GPDISABLED   = 0xc00d0bdc,
}

alias OpenServiceActivityContentType = int;
enum : int
{
    ActivityContentNone      = 0xffffffff,
    ActivityContentDocument  = 0x00000000,
    ActivityContentSelection = 0x00000001,
    ActivityContentLink      = 0x00000002,
    ActivityContentCount     = 0x00000003,
}

enum IID_IOpenServiceActivityInput = GUID(0x75cb4db9, 0x6da0, 0x4da3, [0x83, 0xce, 0x42, 0x2b, 0x6a, 0x43, 0x33, 0x46]);
interface IOpenServiceActivityInput : IUnknown
{
    HRESULT GetVariable(const(wchar)*, const(wchar)*, BSTR*);
    HRESULT HasVariable(const(wchar)*, const(wchar)*, BOOL*);
    HRESULT GetType(OpenServiceActivityContentType*);
}
enum IID_IOpenServiceActivityOutputContext = GUID(0xe289deab, 0xf709, 0x49a9, [0xb9, 0x9e, 0x28, 0x23, 0x64, 0x7, 0x45, 0x71]);
interface IOpenServiceActivityOutputContext : IUnknown
{
    HRESULT Navigate(const(wchar)*, const(wchar)*, const(wchar)*, IStream);
    HRESULT CanNavigate(const(wchar)*, const(wchar)*, const(wchar)*, IStream, BOOL*);
}
enum IID_IOpenService = GUID(0xc2952ed1, 0x6a89, 0x4606, [0x92, 0x5f, 0x1e, 0xd8, 0xb4, 0xbe, 0x6, 0x30]);
interface IOpenService : IUnknown
{
    HRESULT IsDefault(BOOL*);
    HRESULT SetDefault(BOOL, HWND);
    HRESULT GetID(BSTR*);
}
enum IID_IOpenServiceManager = GUID(0x5664125f, 0x4e10, 0x4e90, [0x98, 0xe4, 0xe4, 0x51, 0x3d, 0x95, 0x5a, 0x14]);
interface IOpenServiceManager : IUnknown
{
    HRESULT InstallService(const(wchar)*, IOpenService*);
    HRESULT UninstallService(IOpenService);
    HRESULT GetServiceByID(const(wchar)*, IOpenService*);
}
enum IID_IOpenServiceActivity = GUID(0x13645c88, 0x221a, 0x4905, [0x8e, 0xd1, 0x4f, 0x51, 0x12, 0xcf, 0xc1, 0x8]);
interface IOpenServiceActivity : IOpenService
{
    HRESULT Execute(IOpenServiceActivityInput, IOpenServiceActivityOutputContext);
    HRESULT CanExecute(IOpenServiceActivityInput, IOpenServiceActivityOutputContext, BOOL*);
    HRESULT CanExecuteType(OpenServiceActivityContentType, BOOL*);
    HRESULT Preview(IOpenServiceActivityInput, IOpenServiceActivityOutputContext);
    HRESULT CanPreview(IOpenServiceActivityInput, IOpenServiceActivityOutputContext, BOOL*);
    HRESULT CanPreviewType(OpenServiceActivityContentType, BOOL*);
    HRESULT GetStatusText(IOpenServiceActivityInput, BSTR*);
    HRESULT GetHomepageUrl(BSTR*);
    HRESULT GetDisplayName(BSTR*);
    HRESULT GetDescription(BSTR*);
    HRESULT GetCategoryName(BSTR*);
    HRESULT GetIconPath(BSTR*);
    HRESULT GetIcon(BOOL, HICON*);
    HRESULT GetDescriptionFilePath(BSTR*);
    HRESULT GetDownloadUrl(BSTR*);
    HRESULT GetInstallUrl(BSTR*);
    HRESULT IsEnabled(BOOL*);
    HRESULT SetEnabled(BOOL);
}
enum IID_IEnumOpenServiceActivity = GUID(0xa436d7d2, 0x17c3, 0x4ef4, [0xa1, 0xe8, 0x5c, 0x86, 0xfa, 0xff, 0x26, 0xc0]);
interface IEnumOpenServiceActivity : IUnknown
{
    HRESULT Next(uint, IOpenServiceActivity*, uint*);
    HRESULT Skip(uint);
    HRESULT Reset();
    HRESULT Clone(IEnumOpenServiceActivity*);
}
enum IID_IOpenServiceActivityCategory = GUID(0x850af9d6, 0x7309, 0x40b5, [0xbd, 0xb8, 0x78, 0x6c, 0x10, 0x6b, 0x21, 0x53]);
interface IOpenServiceActivityCategory : IUnknown
{
    HRESULT HasDefaultActivity(BOOL*);
    HRESULT GetDefaultActivity(IOpenServiceActivity*);
    HRESULT SetDefaultActivity(IOpenServiceActivity, HWND);
    HRESULT GetName(BSTR*);
    HRESULT GetActivityEnumerator(IOpenServiceActivityInput, IOpenServiceActivityOutputContext, IEnumOpenServiceActivity*);
}
enum IID_IEnumOpenServiceActivityCategory = GUID(0x33627a56, 0x8c9a, 0x4430, [0x8f, 0xd1, 0xb5, 0xf5, 0xc7, 0x71, 0xaf, 0xb6]);
interface IEnumOpenServiceActivityCategory : IUnknown
{
    HRESULT Next(uint, IOpenServiceActivityCategory*, uint*);
    HRESULT Skip(uint);
    HRESULT Reset();
    HRESULT Clone(IEnumOpenServiceActivityCategory*);
}
enum IID_IOpenServiceActivityManager = GUID(0x8a2d0a9d, 0xe920, 0x4bdc, [0xa2, 0x91, 0xd3, 0xf, 0x65, 0xb, 0xc4, 0xf1]);
interface IOpenServiceActivityManager : IUnknown
{
    HRESULT GetCategoryEnumerator(OpenServiceActivityContentType, IEnumOpenServiceActivityCategory*);
    HRESULT GetActivityByID(const(wchar)*, IOpenServiceActivity*);
    HRESULT GetActivityByHomepageAndCategory(const(wchar)*, const(wchar)*, IOpenServiceActivity*);
    HRESULT GetVersionCookie(uint*);
}
enum IID_IPersistHistory = GUID(0x91a565c1, 0xe38f, 0x11d0, [0x94, 0xbf, 0x0, 0xa0, 0xc9, 0x5, 0x5c, 0xbf]);
interface IPersistHistory : IPersist
{
    HRESULT LoadHistory(IStream, IBindCtx);
    HRESULT SaveHistory(IStream);
    HRESULT SetPositionCookie(uint);
    HRESULT GetPositionCookie(uint*);
}
alias ADDURL_FLAG = int;
enum : int
{
    ADDURL_FIRST                = 0x00000000,
    ADDURL_ADDTOHISTORYANDCACHE = 0x00000000,
    ADDURL_ADDTOCACHE           = 0x00000001,
    ADDURL_Max                  = 0x7fffffff,
}

struct STATURL
{
    uint cbSize;
    PWSTR pwcsUrl;
    PWSTR pwcsTitle;
    FILETIME ftLastVisited;
    FILETIME ftLastUpdated;
    FILETIME ftExpires;
    uint dwFlags;
}
enum IID_IEnumSTATURL = GUID(0x3c374a42, 0xbae4, 0x11cf, [0xbf, 0x7d, 0x0, 0xaa, 0x0, 0x69, 0x46, 0xee]);
interface IEnumSTATURL : IUnknown
{
    HRESULT Next(uint, STATURL*, uint*);
    HRESULT Skip(uint);
    HRESULT Reset();
    HRESULT Clone(IEnumSTATURL*);
    HRESULT SetFilter(const(wchar)*, uint);
}
enum IID_IUrlHistoryStg = GUID(0x3c374a41, 0xbae4, 0x11cf, [0xbf, 0x7d, 0x0, 0xaa, 0x0, 0x69, 0x46, 0xee]);
interface IUrlHistoryStg : IUnknown
{
    HRESULT AddUrl(const(wchar)*, const(wchar)*, uint);
    HRESULT DeleteUrl(const(wchar)*, uint);
    HRESULT QueryUrl(const(wchar)*, uint, STATURL*);
    HRESULT BindToObject(const(wchar)*, const(GUID)*, void**);
    HRESULT EnumUrls(IEnumSTATURL*);
}
enum IID_IUrlHistoryStg2 = GUID(0xafa0dc11, 0xc313, 0x11d0, [0x83, 0x1a, 0x0, 0xc0, 0x4f, 0xd5, 0xae, 0x38]);
interface IUrlHistoryStg2 : IUrlHistoryStg
{
    HRESULT AddUrlAndNotify(const(wchar)*, const(wchar)*, uint, BOOL, IOleCommandTarget, IUnknown);
    HRESULT ClearHistory();
}
enum IID_IUrlHistoryNotify = GUID(0xbc40bec1, 0xc493, 0x11d0, [0x83, 0x1b, 0x0, 0xc0, 0x4f, 0xd5, 0xae, 0x38]);
interface IUrlHistoryNotify : IOleCommandTarget
{
}
enum IID_IWebBrowserEventsService = GUID(0x54a8f188, 0x9ebd, 0x4795, [0xad, 0x16, 0x9b, 0x49, 0x45, 0x11, 0x96, 0x36]);
interface IWebBrowserEventsService : IUnknown
{
    HRESULT FireBeforeNavigate2Event(VARIANT_BOOL*);
    HRESULT FireNavigateComplete2Event();
    HRESULT FireDownloadBeginEvent();
    HRESULT FireDownloadCompleteEvent();
    HRESULT FireDocumentCompleteEvent();
}
enum IID_IWebBrowserEventsUrlService = GUID(0x87cc5d04, 0xeafa, 0x4833, [0x98, 0x20, 0x8f, 0x98, 0x65, 0x30, 0xcc, 0x0]);
interface IWebBrowserEventsUrlService : IUnknown
{
    HRESULT GetUrlForEvents(BSTR*);
}
enum IID_ITimerService = GUID(0x3050f35f, 0x98b5, 0x11cf, [0xbb, 0x82, 0x0, 0xaa, 0x0, 0xbd, 0xce, 0xb]);
interface ITimerService : IUnknown
{
    HRESULT CreateTimer(ITimer, ITimer*);
    HRESULT GetNamedTimer(const(GUID)*, ITimer*);
    HRESULT SetNamedTimerReference(const(GUID)*, ITimer);
}
enum IID_ITimer = GUID(0x3050f360, 0x98b5, 0x11cf, [0xbb, 0x82, 0x0, 0xaa, 0x0, 0xbd, 0xce, 0xb]);
interface ITimer : IUnknown
{
    HRESULT Advise(VARIANT, VARIANT, VARIANT, uint, ITimerSink, uint*);
    HRESULT Unadvise(uint);
    HRESULT Freeze(BOOL);
    HRESULT GetTime(VARIANT*);
}
enum IID_ITimerEx = GUID(0x30510414, 0x98b5, 0x11cf, [0xbb, 0x82, 0x0, 0xaa, 0x0, 0xbd, 0xce, 0xb]);
interface ITimerEx : ITimer
{
    HRESULT SetMode(uint);
}
enum IID_ITimerSink = GUID(0x3050f361, 0x98b5, 0x11cf, [0xbb, 0x82, 0x0, 0xaa, 0x0, 0xbd, 0xce, 0xb]);
interface ITimerSink : IUnknown
{
    HRESULT OnTimer(VARIANT);
}
enum IID_IMapMIMEToCLSID = GUID(0xd9e89500, 0x30fa, 0x11d0, [0xb7, 0x24, 0x0, 0xaa, 0x0, 0x6c, 0x1a, 0x1]);
interface IMapMIMEToCLSID : IUnknown
{
    HRESULT EnableDefaultMappings(BOOL);
    HRESULT MapMIMEToCLSID(const(wchar)*, GUID*);
    HRESULT SetMapping(const(wchar)*, uint, const(GUID)*);
}
enum IID_IImageDecodeFilter = GUID(0xa3ccedf3, 0x2de2, 0x11d0, [0x86, 0xf4, 0x0, 0xa0, 0xc9, 0x13, 0xf7, 0x50]);
interface IImageDecodeFilter : IUnknown
{
    HRESULT Initialize(IImageDecodeEventSink);
    HRESULT Process(IStream);
    HRESULT Terminate(HRESULT);
}
enum IID_IImageDecodeEventSink = GUID(0xbaa342a0, 0x2ded, 0x11d0, [0x86, 0xf4, 0x0, 0xa0, 0xc9, 0x13, 0xf7, 0x50]);
interface IImageDecodeEventSink : IUnknown
{
    HRESULT GetSurface(int, int, const(GUID)*, uint, uint, IUnknown*);
    HRESULT OnBeginDecode(uint*, uint*, GUID**);
    HRESULT OnBitsComplete();
    HRESULT OnDecodeComplete(HRESULT);
    HRESULT OnPalette();
    HRESULT OnProgress(RECT*, BOOL);
}
enum IID_IImageDecodeEventSink2 = GUID(0x8ebd8a57, 0x8a96, 0x48c9, [0x84, 0xa6, 0x96, 0x2e, 0x2d, 0xb9, 0xc9, 0x31]);
interface IImageDecodeEventSink2 : IImageDecodeEventSink
{
    HRESULT IsAlphaPremultRequired(BOOL*);
}
enum CLSID_CoDitherToRGB8 = GUID(0xa860ce50, 0x3910, 0x11d0, [0x86, 0xfc, 0x0, 0xa0, 0xc9, 0x13, 0xf7, 0x50]);
struct CoDitherToRGB8
{
}
enum CLSID_CoSniffStream = GUID(0x6a01fda0, 0x30df, 0x11d0, [0xb7, 0x24, 0x0, 0xaa, 0x0, 0x6c, 0x1a, 0x1]);
struct CoSniffStream
{
}
enum CLSID_CoMapMIMEToCLSID = GUID(0x30c3b080, 0x30fb, 0x11d0, [0xb7, 0x24, 0x0, 0xaa, 0x0, 0x6c, 0x1a, 0x1]);
struct CoMapMIMEToCLSID
{
}
enum IID_ISniffStream = GUID(0x4ef17940, 0x30e0, 0x11d0, [0xb7, 0x24, 0x0, 0xaa, 0x0, 0x6c, 0x1a, 0x1]);
interface ISniffStream : IUnknown
{
    HRESULT Init(IStream);
    HRESULT Peek(void*, uint, uint*);
}
enum IID_IDithererImpl = GUID(0x7c48e840, 0x3910, 0x11d0, [0x86, 0xfc, 0x0, 0xa0, 0xc9, 0x13, 0xf7, 0x50]);
interface IDithererImpl : IUnknown
{
    HRESULT SetDestColorTable(uint, const(RGBQUAD)*);
    HRESULT SetEventSink(IImageDecodeEventSink);
}
