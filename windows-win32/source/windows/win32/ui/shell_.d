module windows.win32.ui.shell_;

import windows.win32.guid : GUID;
import windows.win32.data.xml.msxml : IXMLDOMDocument;
import windows.win32.foundation : BOOL, BOOLEAN, BSTR, CHAR, COLORREF, FILETIME, HANDLE, HINSTANCE, HRESULT, HWND, LARGE_INTEGER, LPARAM, LRESULT, NTSTATUS, POINT, POINTL, PSTR, PWSTR, RECT, RECTL, SHANDLE_PTR, SIZE, SYSTEMTIME, ULARGE_INTEGER, WIN32_ERROR, WPARAM;
import windows.win32.graphics.directcomposition : IDCompositionAnimation;
import windows.win32.graphics.gdi : HBITMAP, HDC, HMONITOR, HPALETTE, LOGFONTW;
import windows.win32.networkmanagement.wnet : NETRESOURCEA;
import windows.win32.security_ : SECURITY_ATTRIBUTES;
import windows.win32.storage.filesystem : FILE_FLAGS_AND_ATTRIBUTES, WIN32_FIND_DATAA, WIN32_FIND_DATAW;
import windows.win32.system.com_ : BYTE_BLOB, DISPPARAMS, EXCEPINFO, FORMATETC, IBindCtx, IBindStatusCallback, IConnectionPoint, IDataObject, IDispatch, IEnumFORMATETC, IEnumGUID, IEnumString, IEnumUnknown, IMalloc, IMoniker, IPersist, IServiceProvider, IStream, IUnknown, VARENUM, VARIANT;
import windows.win32.system.com.structuredstorage : IPropertyBag, IPropertySetStorage, IStorage, PROPVARIANT;
import windows.win32.system.com.urlmon : SOFTDISTINFO;
import windows.win32.system.console : COORD;
import windows.win32.system.io : OVERLAPPED;
import windows.win32.system.ole : DROPEFFECT, IDropSource, IDropTarget, IOleCommandTarget, IOleInPlaceSite, IOleObject, IOleWindow, OLECMDEXECOPT, OLECMDF, OLECMDID, OleMenuGroupWidths, READYSTATE;
import windows.win32.system.registry : HKEY;
import windows.win32.system.search_ : ICondition;
import windows.win32.system.threading : LPTHREAD_START_ROUTINE, PROCESS_INFORMATION, STARTUPINFOW;
import windows.win32.ui.controls_ : HIMAGELIST, HPROPSHEETPAGE, LPFNSVADDPROPSHEETPAGE, NMHDR, TBBUTTON;
import windows.win32.ui.shell.common : COMDLG_FILTERSPEC, DEVICE_SCALE_FACTOR, IObjectArray, ITEMIDLIST, PERCEIVED, SHELLDETAILS, SHITEMID, STRRET;
import windows.win32.ui.shell.propertiessystem : GETPROPERTYSTOREFLAGS, IPropertyChangeArray, IPropertyDescriptionList, IPropertyStore, PDOPSTATUS, PROPERTYKEY;
import windows.win32.ui.windowsandmessaging : CREATESTRUCTW, HACCEL, HICON, HMENU, MSG;

version (Windows):
extern (Windows):

BOOL LoadUserProfileA(HANDLE, PROFILEINFOA*);
BOOL LoadUserProfileW(HANDLE, PROFILEINFOW*);
BOOL UnloadUserProfile(HANDLE, HANDLE);
BOOL GetProfilesDirectoryA(PSTR, uint*);
BOOL GetProfilesDirectoryW(PWSTR, uint*);
BOOL GetProfileType(uint*);
BOOL DeleteProfileA(const(char)*, const(char)*, const(char)*);
BOOL DeleteProfileW(const(wchar)*, const(wchar)*, const(wchar)*);
HRESULT CreateProfile(const(wchar)*, const(wchar)*, PWSTR, uint);
BOOL GetDefaultUserProfileDirectoryA(PSTR, uint*);
BOOL GetDefaultUserProfileDirectoryW(PWSTR, uint*);
BOOL GetAllUsersProfileDirectoryA(PSTR, uint*);
BOOL GetAllUsersProfileDirectoryW(PWSTR, uint*);
BOOL GetUserProfileDirectoryA(HANDLE, PSTR, uint*);
BOOL GetUserProfileDirectoryW(HANDLE, PWSTR, uint*);
BOOL SetWindowSubclass(HWND, SUBCLASSPROC, ulong, ulong);
BOOL GetWindowSubclass(HWND, SUBCLASSPROC, ulong, ulong*);
BOOL RemoveWindowSubclass(HWND, SUBCLASSPROC, ulong);
LRESULT DefSubclassProc(HWND, uint, WPARAM, LPARAM);
BOOL SetWindowContextHelpId(HWND, uint);
uint GetWindowContextHelpId(HWND);
BOOL SetMenuContextHelpId(HMENU, uint);
uint GetMenuContextHelpId(HMENU);
BOOL WinHelpA(HWND, const(char)*, uint, ulong);
BOOL WinHelpW(HWND, const(wchar)*, uint, ulong);
ITEMIDLIST* SHSimpleIDListFromPath(const(wchar)*);
HRESULT SHCreateItemFromIDList(ITEMIDLIST*, const(GUID)*, void**);
HRESULT SHCreateItemFromParsingName(const(wchar)*, IBindCtx, const(GUID)*, void**);
HRESULT SHCreateItemWithParent(ITEMIDLIST*, IShellFolder, ITEMIDLIST*, const(GUID)*, void**);
HRESULT SHCreateItemFromRelativeName(IShellItem, const(wchar)*, IBindCtx, const(GUID)*, void**);
HRESULT SHCreateItemInKnownFolder(const(GUID)*, uint, const(wchar)*, const(GUID)*, void**);
HRESULT SHGetIDListFromObject(IUnknown, ITEMIDLIST**);
HRESULT SHGetItemFromObject(IUnknown, const(GUID)*, void**);
HRESULT SHGetNameFromIDList(ITEMIDLIST*, SIGDN, PWSTR*);
HRESULT SHGetItemFromDataObject(IDataObject, DATAOBJ_GET_ITEM_FLAGS, const(GUID)*, void**);
HRESULT SHCreateShellItemArray(ITEMIDLIST*, IShellFolder, uint, ITEMIDLIST**, IShellItemArray*);
HRESULT SHCreateShellItemArrayFromDataObject(IDataObject, const(GUID)*, void**);
HRESULT SHCreateShellItemArrayFromIDLists(uint, ITEMIDLIST**, IShellItemArray*);
HRESULT SHCreateShellItemArrayFromShellItem(IShellItem, const(GUID)*, void**);
HRESULT SHCreateAssociationRegistration(const(GUID)*, void**);
HRESULT SHCreateDefaultExtractIcon(const(GUID)*, void**);
HRESULT SetCurrentProcessExplicitAppUserModelID(const(wchar)*);
HRESULT GetCurrentProcessExplicitAppUserModelID(PWSTR*);
HRESULT SHGetTemporaryPropertyForItem(IShellItem, const(PROPERTYKEY)*, PROPVARIANT*);
HRESULT SHSetTemporaryPropertyForItem(IShellItem, const(PROPERTYKEY)*, const(PROPVARIANT)*);
HRESULT SHShowManageLibraryUI(IShellItem, HWND, const(wchar)*, const(wchar)*, LIBRARYMANAGEDIALOGOPTIONS);
HRESULT SHResolveLibrary(IShellItem);
HRESULT SHAssocEnumHandlers(const(wchar)*, ASSOC_FILTER, IEnumAssocHandlers*);
HRESULT SHAssocEnumHandlersForProtocolByApplication(const(wchar)*, const(GUID)*, void**);
uint HMONITOR_UserSize(uint*, uint, HMONITOR*);
ubyte* HMONITOR_UserMarshal(uint*, ubyte*, HMONITOR*);
ubyte* HMONITOR_UserUnmarshal(uint*, ubyte*, HMONITOR*);
void HMONITOR_UserFree(uint*, HMONITOR*);
uint HMONITOR_UserSize64(uint*, uint, HMONITOR*);
ubyte* HMONITOR_UserMarshal64(uint*, ubyte*, HMONITOR*);
ubyte* HMONITOR_UserUnmarshal64(uint*, ubyte*, HMONITOR*);
void HMONITOR_UserFree64(uint*, HMONITOR*);
HRESULT SHCreateDefaultPropertiesOp(IShellItem, IFileOperation*);
HRESULT SHSetDefaultProperties(HWND, IShellItem, uint, IFileOperationProgressSink);
HRESULT SHGetMalloc(IMalloc*);
void* SHAlloc(ulong);
void SHFree(void*);
int SHGetIconOverlayIndexA(const(char)*, int);
int SHGetIconOverlayIndexW(const(wchar)*, int);
ITEMIDLIST* ILClone(ITEMIDLIST*);
ITEMIDLIST* ILCloneFirst(ITEMIDLIST*);
ITEMIDLIST* ILCombine(ITEMIDLIST*, ITEMIDLIST*);
void ILFree(ITEMIDLIST*);
ITEMIDLIST* ILGetNext(ITEMIDLIST*);
uint ILGetSize(ITEMIDLIST*);
ITEMIDLIST* ILFindChild(ITEMIDLIST*, ITEMIDLIST*);
ITEMIDLIST* ILFindLastID(ITEMIDLIST*);
BOOL ILRemoveLastID(ITEMIDLIST*);
BOOL ILIsEqual(ITEMIDLIST*, ITEMIDLIST*);
BOOL ILIsParent(ITEMIDLIST*, ITEMIDLIST*, BOOL);
HRESULT ILSaveToStream(IStream, ITEMIDLIST*);
HRESULT ILLoadFromStreamEx(IStream, ITEMIDLIST**);
ITEMIDLIST* ILCreateFromPathA(const(char)*);
ITEMIDLIST* ILCreateFromPathW(const(wchar)*);
HRESULT SHILCreateFromPath(const(wchar)*, ITEMIDLIST**, uint*);
ITEMIDLIST* ILAppendID(ITEMIDLIST*, SHITEMID*, BOOL);
BOOL SHGetPathFromIDListEx(ITEMIDLIST*, PWSTR, uint, int);
BOOL SHGetPathFromIDListA(ITEMIDLIST*, PSTR);
BOOL SHGetPathFromIDListW(ITEMIDLIST*, PWSTR);
int SHCreateDirectory(HWND, const(wchar)*);
int SHCreateDirectoryExA(HWND, const(char)*, const(SECURITY_ATTRIBUTES)*);
int SHCreateDirectoryExW(HWND, const(wchar)*, const(SECURITY_ATTRIBUTES)*);
HRESULT SHOpenFolderAndSelectItems(ITEMIDLIST*, uint, ITEMIDLIST**, uint);
HRESULT SHCreateShellItem(ITEMIDLIST*, IShellFolder, ITEMIDLIST*, IShellItem*);
HRESULT SHGetSpecialFolderLocation(HWND, int, ITEMIDLIST**);
ITEMIDLIST* SHCloneSpecialIDList(HWND, int, BOOL);
BOOL SHGetSpecialFolderPathA(HWND, PSTR, int, BOOL);
BOOL SHGetSpecialFolderPathW(HWND, PWSTR, int, BOOL);
void SHFlushSFCache();
HRESULT SHGetFolderPathA(HWND, int, HANDLE, uint, PSTR);
HRESULT SHGetFolderPathW(HWND, int, HANDLE, uint, PWSTR);
HRESULT SHGetFolderLocation(HWND, int, HANDLE, uint, ITEMIDLIST**);
HRESULT SHSetFolderPathA(int, HANDLE, uint, const(char)*);
HRESULT SHSetFolderPathW(int, HANDLE, uint, const(wchar)*);
HRESULT SHGetFolderPathAndSubDirA(HWND, int, HANDLE, uint, const(char)*, PSTR);
HRESULT SHGetFolderPathAndSubDirW(HWND, int, HANDLE, uint, const(wchar)*, PWSTR);
HRESULT SHGetKnownFolderIDList(const(GUID)*, uint, HANDLE, ITEMIDLIST**);
HRESULT SHSetKnownFolderPath(const(GUID)*, uint, HANDLE, const(wchar)*);
HRESULT SHGetKnownFolderPath(const(GUID)*, uint, HANDLE, PWSTR*);
HRESULT SHGetKnownFolderItem(const(GUID)*, KNOWN_FOLDER_FLAG, HANDLE, const(GUID)*, void**);
HRESULT SHGetSetFolderCustomSettings(SHFOLDERCUSTOMSETTINGS*, const(wchar)*, uint);
ITEMIDLIST* SHBrowseForFolderA(BROWSEINFOA*);
ITEMIDLIST* SHBrowseForFolderW(BROWSEINFOW*);
HRESULT SHLoadInProc(const(GUID)*);
HRESULT SHGetDesktopFolder(IShellFolder*);
void SHChangeNotify(SHCNE_ID, SHCNF_FLAGS, const(void)*, const(void)*);
void SHAddToRecentDocs(uint, const(void)*);
int SHHandleUpdateImage(ITEMIDLIST*);
void SHUpdateImageA(const(char)*, int, uint, int);
void SHUpdateImageW(const(wchar)*, int, uint, int);
uint SHChangeNotifyRegister(HWND, SHCNRF_SOURCE, int, uint, int, const(SHChangeNotifyEntry)*);
BOOL SHChangeNotifyDeregister(uint);
ShFindChangeNotificationHandle SHChangeNotification_Lock(HANDLE, uint, ITEMIDLIST***, int*);
BOOL SHChangeNotification_Unlock(HANDLE);
HRESULT SHGetRealIDL(IShellFolder, ITEMIDLIST*, ITEMIDLIST**);
HRESULT SHGetInstanceExplorer(IUnknown*);
HRESULT SHGetDataFromIDListA(IShellFolder, ITEMIDLIST*, SHGDFIL_FORMAT, void*, int);
HRESULT SHGetDataFromIDListW(IShellFolder, ITEMIDLIST*, SHGDFIL_FORMAT, void*, int);
int RestartDialog(HWND, const(wchar)*, uint);
int RestartDialogEx(HWND, const(wchar)*, uint, uint);
HRESULT SHCoCreateInstance(const(wchar)*, const(GUID)*, IUnknown, const(GUID)*, void**);
HRESULT SHCreateDataObject(ITEMIDLIST*, uint, ITEMIDLIST**, IDataObject, const(GUID)*, void**);
HRESULT CIDLData_CreateFromIDArray(ITEMIDLIST*, uint, ITEMIDLIST**, IDataObject*);
HRESULT SHCreateStdEnumFmtEtc(uint, const(FORMATETC)*, IEnumFORMATETC*);
HRESULT SHDoDragDrop(HWND, IDataObject, IDropSource, DROPEFFECT, DROPEFFECT*);
BOOL DAD_SetDragImage(HIMAGELIST, POINT*);
BOOL DAD_DragEnterEx(HWND, const(POINT));
BOOL DAD_DragEnterEx2(HWND, const(POINT), IDataObject);
BOOL DAD_ShowDragImage(BOOL);
BOOL DAD_DragMove(POINT);
BOOL DAD_DragLeave();
BOOL DAD_AutoScroll(HWND, AUTO_SCROLL_DATA*, const(POINT)*);
BOOL ReadCabinetState(CABINETSTATE*, int);
BOOL WriteCabinetState(CABINETSTATE*);
BOOL PathMakeUniqueName(PWSTR, uint, const(wchar)*, const(wchar)*, const(wchar)*);
BOOL PathIsExe(const(wchar)*);
PCS_RET PathCleanupSpec(const(wchar)*, PWSTR);
int PathResolve(PWSTR, ushort**, PRF_FLAGS);
BOOL GetFileNameFromBrowse(HWND, PWSTR, uint, const(wchar)*, const(wchar)*, const(wchar)*, const(wchar)*);
int DriveType(int);
int RealDriveType(int, BOOL);
int IsNetDrive(int);
uint Shell_MergeMenus(HMENU, HMENU, uint, uint, uint, MM_FLAGS);
BOOL SHObjectProperties(HWND, SHOP_TYPE, const(wchar)*, const(wchar)*);
uint SHFormatDrive(HWND, uint, SHFMT_ID, SHFMT_OPT);
void SHDestroyPropSheetExtArray(HPSXA);
uint SHAddFromPropSheetExtArray(HPSXA, LPFNSVADDPROPSHEETPAGE, LPARAM);
uint SHReplaceFromPropSheetExtArray(HPSXA, uint, LPFNSVADDPROPSHEETPAGE, LPARAM);
IStream OpenRegStream(HKEY, const(wchar)*, const(wchar)*, uint);
BOOL SHFindFiles(ITEMIDLIST*, ITEMIDLIST*);
void PathGetShortPath(PWSTR);
BOOL PathYetAnotherMakeUniqueName(PWSTR, const(wchar)*, const(wchar)*, const(wchar)*);
BOOL Win32DeleteFile(const(wchar)*);
uint SHRestricted(RESTRICTIONS);
BOOL SignalFileOpen(ITEMIDLIST*);
HRESULT AssocGetDetailsOfPropKey(IShellFolder, ITEMIDLIST*, const(PROPERTYKEY)*, VARIANT*, BOOL*);
HRESULT SHStartNetConnectionDialogW(HWND, const(wchar)*, uint);
HRESULT SHDefExtractIconA(const(char)*, int, uint, HICON*, HICON*, uint);
HRESULT SHDefExtractIconW(const(wchar)*, int, uint, HICON*, HICON*, uint);
HRESULT SHOpenWithDialog(HWND, const(OPENASINFO)*);
BOOL Shell_GetImageLists(HIMAGELIST*, HIMAGELIST*);
int Shell_GetCachedImageIndex(const(wchar)*, int, uint);
int Shell_GetCachedImageIndexA(const(char)*, int, uint);
int Shell_GetCachedImageIndexW(const(wchar)*, int, uint);
BOOL SHValidateUNC(HWND, PWSTR, VALIDATEUNC_OPTION);
void SHSetInstanceExplorer(IUnknown);
BOOL IsUserAnAdmin();
LRESULT SHShellFolderView_Message(HWND, uint, LPARAM);
HRESULT SHCreateShellFolderView(const(SFV_CREATE)*, IShellView*);
HRESULT CDefFolderMenu_Create2(ITEMIDLIST*, HWND, uint, ITEMIDLIST**, IShellFolder, LPFNDFMCALLBACK, uint, const(HKEY)*, IContextMenu*);
HRESULT SHCreateDefaultContextMenu(const(DEFCONTEXTMENU)*, const(GUID)*, void**);
IContextMenu SHFind_InitMenuPopup(HMENU, HWND, uint, uint);
HRESULT SHCreateShellFolderViewEx(CSFV*, IShellView*);
void SHGetSetSettings(SHELLSTATEA*, SSF_MASK, BOOL);
void SHGetSettings(SHELLFLAGSTATE*, uint);
HRESULT SHBindToParent(ITEMIDLIST*, const(GUID)*, void**, ITEMIDLIST**);
HRESULT SHBindToFolderIDListParent(IShellFolder, ITEMIDLIST*, const(GUID)*, void**, ITEMIDLIST**);
HRESULT SHBindToFolderIDListParentEx(IShellFolder, ITEMIDLIST*, IBindCtx, const(GUID)*, void**, ITEMIDLIST**);
HRESULT SHBindToObject(IShellFolder, ITEMIDLIST*, IBindCtx, const(GUID)*, void**);
HRESULT SHParseDisplayName(const(wchar)*, IBindCtx, ITEMIDLIST**, uint, uint*);
HRESULT SHPathPrepareForWriteA(HWND, IUnknown, const(char)*, uint);
HRESULT SHPathPrepareForWriteW(HWND, IUnknown, const(wchar)*, uint);
HRESULT SHCreateFileExtractIconW(const(wchar)*, uint, const(GUID)*, void**);
HRESULT SHLimitInputEdit(HWND, IShellFolder);
HRESULT SHGetAttributesFromDataObject(IDataObject, uint, uint*, uint*);
int SHMapPIDLToSystemImageListIndex(IShellFolder, ITEMIDLIST*, int*);
HRESULT SHCLSIDFromString(const(wchar)*, GUID*);
int PickIconDlg(HWND, PWSTR, uint, int*);
HRESULT StgMakeUniqueName(IStorage, const(wchar)*, uint, const(GUID)*, void**);
void SHChangeNotifyRegisterThread(SCNRT_STATUS);
void PathQualify(PWSTR);
BOOL PathIsSlowA(const(char)*, uint);
BOOL PathIsSlowW(const(wchar)*, uint);
HPSXA SHCreatePropSheetExtArray(HKEY, const(wchar)*, uint);
BOOL SHOpenPropSheetW(const(wchar)*, HKEY*, uint, const(GUID)*, IDataObject, IShellBrowser, const(wchar)*);
uint SoftwareUpdateMessageBox(HWND, const(wchar)*, uint, SOFTDISTINFO*);
HRESULT SHMultiFileProperties(IDataObject, uint);
HRESULT SHCreateQueryCancelAutoPlayMoniker(IMoniker*);
BOOL ImportPrivacySettings(const(wchar)*, BOOL*, BOOL*);
DEVICE_SCALE_FACTOR GetScaleFactorForDevice(DISPLAY_DEVICE_TYPE);
HRESULT RegisterScaleChangeNotifications(DISPLAY_DEVICE_TYPE, HWND, uint, uint*);
HRESULT RevokeScaleChangeNotifications(DISPLAY_DEVICE_TYPE, uint);
HRESULT GetScaleFactorForMonitor(HMONITOR, DEVICE_SCALE_FACTOR*);
HRESULT RegisterScaleChangeEvent(HANDLE, ulong*);
HRESULT UnregisterScaleChangeEvent(ulong);
uint GetDpiForShellUIComponent(SHELL_UI_COMPONENT);
PWSTR* CommandLineToArgvW(const(wchar)*, int*);
uint DragQueryFileA(HDROP, uint, PSTR, uint);
uint DragQueryFileW(HDROP, uint, PWSTR, uint);
BOOL DragQueryPoint(HDROP, POINT*);
void DragFinish(HDROP);
void DragAcceptFiles(HWND, BOOL);
HINSTANCE ShellExecuteA(HWND, const(char)*, const(char)*, const(char)*, const(char)*, int);
HINSTANCE ShellExecuteW(HWND, const(wchar)*, const(wchar)*, const(wchar)*, const(wchar)*, int);
HINSTANCE FindExecutableA(const(char)*, const(char)*, PSTR);
HINSTANCE FindExecutableW(const(wchar)*, const(wchar)*, PWSTR);
int ShellAboutA(HWND, const(char)*, const(char)*, HICON);
int ShellAboutW(HWND, const(wchar)*, const(wchar)*, HICON);
HICON DuplicateIcon(HINSTANCE, HICON);
HICON ExtractAssociatedIconA(HINSTANCE, PSTR, ushort*);
HICON ExtractAssociatedIconW(HINSTANCE, PWSTR, ushort*);
HICON ExtractAssociatedIconExA(HINSTANCE, PSTR, ushort*, ushort*);
HICON ExtractAssociatedIconExW(HINSTANCE, PWSTR, ushort*, ushort*);
HICON ExtractIconA(HINSTANCE, const(char)*, uint);
HICON ExtractIconW(HINSTANCE, const(wchar)*, uint);
ulong SHAppBarMessage(uint, APPBARDATA*);
uint DoEnvironmentSubstA(PSTR, uint);
uint DoEnvironmentSubstW(PWSTR, uint);
uint ExtractIconExA(const(char)*, int, HICON*, HICON*, uint);
uint ExtractIconExW(const(wchar)*, int, HICON*, HICON*, uint);
int SHFileOperationA(SHFILEOPSTRUCTA*);
int SHFileOperationW(SHFILEOPSTRUCTW*);
void SHFreeNameMappings(HANDLE);
BOOL ShellExecuteExA(SHELLEXECUTEINFOA*);
BOOL ShellExecuteExW(SHELLEXECUTEINFOW*);
BOOL SHCreateProcessAsUserW(SHCREATEPROCESSINFOW*);
HRESULT SHEvaluateSystemCommandTemplate(const(wchar)*, PWSTR*, PWSTR*, PWSTR*);
HRESULT AssocCreateForClasses(const(ASSOCIATIONELEMENT)*, uint, const(GUID)*, void**);
HRESULT SHQueryRecycleBinA(const(char)*, SHQUERYRBINFO*);
HRESULT SHQueryRecycleBinW(const(wchar)*, SHQUERYRBINFO*);
HRESULT SHEmptyRecycleBinA(HWND, const(char)*, uint);
HRESULT SHEmptyRecycleBinW(HWND, const(wchar)*, uint);
HRESULT SHQueryUserNotificationState(QUERY_USER_NOTIFICATION_STATE*);
BOOL Shell_NotifyIconA(NOTIFY_ICON_MESSAGE, NOTIFYICONDATAA*);
BOOL Shell_NotifyIconW(NOTIFY_ICON_MESSAGE, NOTIFYICONDATAW*);
HRESULT Shell_NotifyIconGetRect(const(NOTIFYICONIDENTIFIER)*, RECT*);
ulong SHGetFileInfoA(const(char)*, FILE_FLAGS_AND_ATTRIBUTES, SHFILEINFOA*, uint, SHGFI_FLAGS);
ulong SHGetFileInfoW(const(wchar)*, FILE_FLAGS_AND_ATTRIBUTES, SHFILEINFOW*, uint, SHGFI_FLAGS);
HRESULT SHGetStockIconInfo(SHSTOCKICONID, uint, SHSTOCKICONINFO*);
BOOL SHGetDiskFreeSpaceExA(const(char)*, ULARGE_INTEGER*, ULARGE_INTEGER*, ULARGE_INTEGER*);
BOOL SHGetDiskFreeSpaceExW(const(wchar)*, ULARGE_INTEGER*, ULARGE_INTEGER*, ULARGE_INTEGER*);
BOOL SHGetNewLinkInfoA(const(char)*, const(char)*, PSTR, BOOL*, uint);
BOOL SHGetNewLinkInfoW(const(wchar)*, const(wchar)*, PWSTR, BOOL*, uint);
BOOL SHInvokePrinterCommandA(HWND, uint, const(char)*, const(char)*, BOOL);
BOOL SHInvokePrinterCommandW(HWND, uint, const(wchar)*, const(wchar)*, BOOL);
HRESULT SHLoadNonloadedIconOverlayIdentifiers();
HRESULT SHIsFileAvailableOffline(const(wchar)*, uint*);
HRESULT SHSetLocalizedName(const(wchar)*, const(wchar)*, int);
HRESULT SHRemoveLocalizedName(const(wchar)*);
HRESULT SHGetLocalizedName(const(wchar)*, PWSTR, uint, int*);
int ShellMessageBoxA(HINSTANCE, HWND, const(char)*, const(char)*, uint);
int ShellMessageBoxW(HINSTANCE, HWND, const(wchar)*, const(wchar)*, uint);
BOOL IsLFNDriveA(const(char)*);
BOOL IsLFNDriveW(const(wchar)*);
HRESULT SHEnumerateUnreadMailAccountsW(HKEY, uint, PWSTR, int);
HRESULT SHGetUnreadMailCountW(HKEY, const(wchar)*, uint*, FILETIME*, PWSTR, int);
HRESULT SHSetUnreadMailCountW(const(wchar)*, uint, const(wchar)*);
BOOL SHTestTokenMembership(HANDLE, uint);
HRESULT SHGetImageList(int, const(GUID)*, void**);
BOOL InitNetworkAddressControl();
HRESULT SHGetDriveMedia(const(wchar)*, uint*);
PSTR StrChrA(const(char)*, ushort);
PWSTR StrChrW(const(wchar)*, wchar);
PSTR StrChrIA(const(char)*, ushort);
PWSTR StrChrIW(const(wchar)*, wchar);
PWSTR StrChrNW(const(wchar)*, wchar, uint);
PWSTR StrChrNIW(const(wchar)*, wchar, uint);
int StrCmpNA(const(char)*, const(char)*, int);
int StrCmpNW(const(wchar)*, const(wchar)*, int);
int StrCmpNIA(const(char)*, const(char)*, int);
int StrCmpNIW(const(wchar)*, const(wchar)*, int);
int StrCSpnA(const(char)*, const(char)*);
int StrCSpnW(const(wchar)*, const(wchar)*);
int StrCSpnIA(const(char)*, const(char)*);
int StrCSpnIW(const(wchar)*, const(wchar)*);
PSTR StrDupA(const(char)*);
PWSTR StrDupW(const(wchar)*);
HRESULT StrFormatByteSizeEx(ulong, SFBS_FLAGS, PWSTR, uint);
PSTR StrFormatByteSizeA(uint, PSTR, uint);
PSTR StrFormatByteSize64A(long, PSTR, uint);
PWSTR StrFormatByteSizeW(long, PWSTR, uint);
PWSTR StrFormatKBSizeW(long, PWSTR, uint);
PSTR StrFormatKBSizeA(long, PSTR, uint);
int StrFromTimeIntervalA(PSTR, uint, uint, int);
int StrFromTimeIntervalW(PWSTR, uint, uint, int);
BOOL StrIsIntlEqualA(BOOL, const(char)*, const(char)*, int);
BOOL StrIsIntlEqualW(BOOL, const(wchar)*, const(wchar)*, int);
PSTR StrNCatA(PSTR, const(char)*, int);
PWSTR StrNCatW(PWSTR, const(wchar)*, int);
PSTR StrPBrkA(const(char)*, const(char)*);
PWSTR StrPBrkW(const(wchar)*, const(wchar)*);
PSTR StrRChrA(const(char)*, const(char)*, ushort);
PWSTR StrRChrW(const(wchar)*, const(wchar)*, wchar);
PSTR StrRChrIA(const(char)*, const(char)*, ushort);
PWSTR StrRChrIW(const(wchar)*, const(wchar)*, wchar);
PSTR StrRStrIA(const(char)*, const(char)*, const(char)*);
PWSTR StrRStrIW(const(wchar)*, const(wchar)*, const(wchar)*);
int StrSpnA(const(char)*, const(char)*);
int StrSpnW(const(wchar)*, const(wchar)*);
PSTR StrStrA(const(char)*, const(char)*);
PWSTR StrStrW(const(wchar)*, const(wchar)*);
PSTR StrStrIA(const(char)*, const(char)*);
PWSTR StrStrIW(const(wchar)*, const(wchar)*);
PWSTR StrStrNW(const(wchar)*, const(wchar)*, uint);
PWSTR StrStrNIW(const(wchar)*, const(wchar)*, uint);
int StrToIntA(const(char)*);
int StrToIntW(const(wchar)*);
BOOL StrToIntExA(const(char)*, int, int*);
BOOL StrToIntExW(const(wchar)*, int, int*);
BOOL StrToInt64ExA(const(char)*, int, long*);
BOOL StrToInt64ExW(const(wchar)*, int, long*);
BOOL StrTrimA(PSTR, const(char)*);
BOOL StrTrimW(PWSTR, const(wchar)*);
PWSTR StrCatW(PWSTR, const(wchar)*);
int StrCmpW(const(wchar)*, const(wchar)*);
int StrCmpIW(const(wchar)*, const(wchar)*);
PWSTR StrCpyW(PWSTR, const(wchar)*);
PWSTR StrCpyNW(PWSTR, const(wchar)*, int);
PWSTR StrCatBuffW(PWSTR, const(wchar)*, int);
PSTR StrCatBuffA(PSTR, const(char)*, int);
BOOL ChrCmpIA(ushort, ushort);
BOOL ChrCmpIW(wchar, wchar);
int wvnsprintfA(PSTR, int, const(char)*, byte*);
int wvnsprintfW(PWSTR, int, const(wchar)*, byte*);
int wnsprintfA(PSTR, int, const(char)*);
int wnsprintfW(PWSTR, int, const(wchar)*);
HRESULT StrRetToStrA(STRRET*, ITEMIDLIST*, PSTR*);
HRESULT StrRetToStrW(STRRET*, ITEMIDLIST*, PWSTR*);
HRESULT StrRetToBufA(STRRET*, ITEMIDLIST*, PSTR, uint);
HRESULT StrRetToBufW(STRRET*, ITEMIDLIST*, PWSTR, uint);
HRESULT SHStrDupA(const(char)*, PWSTR*);
HRESULT SHStrDupW(const(wchar)*, PWSTR*);
int StrCmpLogicalW(const(wchar)*, const(wchar)*);
uint StrCatChainW(PWSTR, uint, uint, const(wchar)*);
HRESULT StrRetToBSTR(STRRET*, ITEMIDLIST*, BSTR*);
HRESULT SHLoadIndirectString(const(wchar)*, PWSTR, uint, void**);
BOOL IsCharSpaceA(CHAR);
BOOL IsCharSpaceW(wchar);
int StrCmpCA(const(char)*, const(char)*);
int StrCmpCW(const(wchar)*, const(wchar)*);
int StrCmpICA(const(char)*, const(char)*);
int StrCmpICW(const(wchar)*, const(wchar)*);
int StrCmpNCA(const(char)*, const(char)*, int);
int StrCmpNCW(const(wchar)*, const(wchar)*, int);
int StrCmpNICA(const(char)*, const(char)*, int);
int StrCmpNICW(const(wchar)*, const(wchar)*, int);
BOOL IntlStrEqWorkerA(BOOL, const(char)*, const(char)*, int);
BOOL IntlStrEqWorkerW(BOOL, const(wchar)*, const(wchar)*, int);
PSTR PathAddBackslashA(PSTR);
PWSTR PathAddBackslashW(PWSTR);
BOOL PathAddExtensionA(PSTR, const(char)*);
BOOL PathAddExtensionW(PWSTR, const(wchar)*);
BOOL PathAppendA(PSTR, const(char)*);
BOOL PathAppendW(PWSTR, const(wchar)*);
PSTR PathBuildRootA(PSTR, int);
PWSTR PathBuildRootW(PWSTR, int);
BOOL PathCanonicalizeA(PSTR, const(char)*);
BOOL PathCanonicalizeW(PWSTR, const(wchar)*);
PSTR PathCombineA(PSTR, const(char)*, const(char)*);
PWSTR PathCombineW(PWSTR, const(wchar)*, const(wchar)*);
BOOL PathCompactPathA(HDC, PSTR, uint);
BOOL PathCompactPathW(HDC, PWSTR, uint);
BOOL PathCompactPathExA(PSTR, const(char)*, uint, uint);
BOOL PathCompactPathExW(PWSTR, const(wchar)*, uint, uint);
int PathCommonPrefixA(const(char)*, const(char)*, PSTR);
int PathCommonPrefixW(const(wchar)*, const(wchar)*, PWSTR);
BOOL PathFileExistsA(const(char)*);
BOOL PathFileExistsW(const(wchar)*);
PSTR PathFindExtensionA(const(char)*);
PWSTR PathFindExtensionW(const(wchar)*);
PSTR PathFindFileNameA(const(char)*);
PWSTR PathFindFileNameW(const(wchar)*);
PSTR PathFindNextComponentA(const(char)*);
PWSTR PathFindNextComponentW(const(wchar)*);
BOOL PathFindOnPathA(PSTR, byte**);
BOOL PathFindOnPathW(PWSTR, ushort**);
PSTR PathFindSuffixArrayA(const(char)*, const(char)**, int);
PWSTR PathFindSuffixArrayW(const(wchar)*, const(wchar)**, int);
PSTR PathGetArgsA(const(char)*);
PWSTR PathGetArgsW(const(wchar)*);
BOOL PathIsLFNFileSpecA(const(char)*);
BOOL PathIsLFNFileSpecW(const(wchar)*);
uint PathGetCharTypeA(ubyte);
uint PathGetCharTypeW(wchar);
int PathGetDriveNumberA(const(char)*);
int PathGetDriveNumberW(const(wchar)*);
BOOL PathIsDirectoryA(const(char)*);
BOOL PathIsDirectoryW(const(wchar)*);
BOOL PathIsDirectoryEmptyA(const(char)*);
BOOL PathIsDirectoryEmptyW(const(wchar)*);
BOOL PathIsFileSpecA(const(char)*);
BOOL PathIsFileSpecW(const(wchar)*);
BOOL PathIsPrefixA(const(char)*, const(char)*);
BOOL PathIsPrefixW(const(wchar)*, const(wchar)*);
BOOL PathIsRelativeA(const(char)*);
BOOL PathIsRelativeW(const(wchar)*);
BOOL PathIsRootA(const(char)*);
BOOL PathIsRootW(const(wchar)*);
BOOL PathIsSameRootA(const(char)*, const(char)*);
BOOL PathIsSameRootW(const(wchar)*, const(wchar)*);
BOOL PathIsUNCA(const(char)*);
BOOL PathIsUNCW(const(wchar)*);
BOOL PathIsNetworkPathA(const(char)*);
BOOL PathIsNetworkPathW(const(wchar)*);
BOOL PathIsUNCServerA(const(char)*);
BOOL PathIsUNCServerW(const(wchar)*);
BOOL PathIsUNCServerShareA(const(char)*);
BOOL PathIsUNCServerShareW(const(wchar)*);
BOOL PathIsContentTypeA(const(char)*, const(char)*);
BOOL PathIsContentTypeW(const(wchar)*, const(wchar)*);
BOOL PathIsURLA(const(char)*);
BOOL PathIsURLW(const(wchar)*);
BOOL PathMakePrettyA(PSTR);
BOOL PathMakePrettyW(PWSTR);
BOOL PathMatchSpecA(const(char)*, const(char)*);
BOOL PathMatchSpecW(const(wchar)*, const(wchar)*);
HRESULT PathMatchSpecExA(const(char)*, const(char)*, uint);
HRESULT PathMatchSpecExW(const(wchar)*, const(wchar)*, uint);
int PathParseIconLocationA(PSTR);
int PathParseIconLocationW(PWSTR);
BOOL PathQuoteSpacesA(PSTR);
BOOL PathQuoteSpacesW(PWSTR);
BOOL PathRelativePathToA(PSTR, const(char)*, uint, const(char)*, uint);
BOOL PathRelativePathToW(PWSTR, const(wchar)*, uint, const(wchar)*, uint);
void PathRemoveArgsA(PSTR);
void PathRemoveArgsW(PWSTR);
PSTR PathRemoveBackslashA(PSTR);
PWSTR PathRemoveBackslashW(PWSTR);
void PathRemoveBlanksA(PSTR);
void PathRemoveBlanksW(PWSTR);
void PathRemoveExtensionA(PSTR);
void PathRemoveExtensionW(PWSTR);
BOOL PathRemoveFileSpecA(PSTR);
BOOL PathRemoveFileSpecW(PWSTR);
BOOL PathRenameExtensionA(PSTR, const(char)*);
BOOL PathRenameExtensionW(PWSTR, const(wchar)*);
BOOL PathSearchAndQualifyA(const(char)*, PSTR, uint);
BOOL PathSearchAndQualifyW(const(wchar)*, PWSTR, uint);
void PathSetDlgItemPathA(HWND, int, const(char)*);
void PathSetDlgItemPathW(HWND, int, const(wchar)*);
PSTR PathSkipRootA(const(char)*);
PWSTR PathSkipRootW(const(wchar)*);
void PathStripPathA(PSTR);
void PathStripPathW(PWSTR);
BOOL PathStripToRootA(PSTR);
BOOL PathStripToRootW(PWSTR);
BOOL PathUnquoteSpacesA(PSTR);
BOOL PathUnquoteSpacesW(PWSTR);
BOOL PathMakeSystemFolderA(const(char)*);
BOOL PathMakeSystemFolderW(const(wchar)*);
BOOL PathUnmakeSystemFolderA(const(char)*);
BOOL PathUnmakeSystemFolderW(const(wchar)*);
BOOL PathIsSystemFolderA(const(char)*, uint);
BOOL PathIsSystemFolderW(const(wchar)*, uint);
void PathUndecorateA(PSTR);
void PathUndecorateW(PWSTR);
BOOL PathUnExpandEnvStringsA(const(char)*, PSTR, uint);
BOOL PathUnExpandEnvStringsW(const(wchar)*, PWSTR, uint);
int UrlCompareA(const(char)*, const(char)*, BOOL);
int UrlCompareW(const(wchar)*, const(wchar)*, BOOL);
HRESULT UrlCombineA(const(char)*, const(char)*, PSTR, uint*, uint);
HRESULT UrlCombineW(const(wchar)*, const(wchar)*, PWSTR, uint*, uint);
HRESULT UrlCanonicalizeA(const(char)*, PSTR, uint*, uint);
HRESULT UrlCanonicalizeW(const(wchar)*, PWSTR, uint*, uint);
BOOL UrlIsOpaqueA(const(char)*);
BOOL UrlIsOpaqueW(const(wchar)*);
BOOL UrlIsNoHistoryA(const(char)*);
BOOL UrlIsNoHistoryW(const(wchar)*);
BOOL UrlIsA(const(char)*, URLIS);
BOOL UrlIsW(const(wchar)*, URLIS);
PSTR UrlGetLocationA(const(char)*);
PWSTR UrlGetLocationW(const(wchar)*);
HRESULT UrlUnescapeA(PSTR, PSTR, uint*, uint);
HRESULT UrlUnescapeW(PWSTR, PWSTR, uint*, uint);
HRESULT UrlEscapeA(const(char)*, PSTR, uint*, uint);
HRESULT UrlEscapeW(const(wchar)*, PWSTR, uint*, uint);
HRESULT UrlCreateFromPathA(const(char)*, PSTR, uint*, uint);
HRESULT UrlCreateFromPathW(const(wchar)*, PWSTR, uint*, uint);
HRESULT PathCreateFromUrlA(const(char)*, PSTR, uint*, uint);
HRESULT PathCreateFromUrlW(const(wchar)*, PWSTR, uint*, uint);
HRESULT PathCreateFromUrlAlloc(const(wchar)*, PWSTR*, uint);
HRESULT UrlHashA(const(char)*, ubyte*, uint);
HRESULT UrlHashW(const(wchar)*, ubyte*, uint);
HRESULT UrlGetPartW(const(wchar)*, PWSTR, uint*, uint, uint);
HRESULT UrlGetPartA(const(char)*, PSTR, uint*, uint, uint);
HRESULT UrlApplySchemeA(const(char)*, PSTR, uint*, uint);
HRESULT UrlApplySchemeW(const(wchar)*, PWSTR, uint*, uint);
HRESULT HashData(ubyte*, uint, ubyte*, uint);
HRESULT UrlFixupW(const(wchar)*, PWSTR, uint);
HRESULT ParseURLA(const(char)*, PARSEDURLA*);
HRESULT ParseURLW(const(wchar)*, PARSEDURLW*);
WIN32_ERROR SHDeleteEmptyKeyA(HKEY, const(char)*);
WIN32_ERROR SHDeleteEmptyKeyW(HKEY, const(wchar)*);
WIN32_ERROR SHDeleteKeyA(HKEY, const(char)*);
WIN32_ERROR SHDeleteKeyW(HKEY, const(wchar)*);
HKEY SHRegDuplicateHKey(HKEY);
WIN32_ERROR SHDeleteValueA(HKEY, const(char)*, const(char)*);
WIN32_ERROR SHDeleteValueW(HKEY, const(wchar)*, const(wchar)*);
WIN32_ERROR SHGetValueA(HKEY, const(char)*, const(char)*, uint*, void*, uint*);
WIN32_ERROR SHGetValueW(HKEY, const(wchar)*, const(wchar)*, uint*, void*, uint*);
int SHSetValueA(HKEY, const(char)*, const(char)*, uint, const(void)*, uint);
int SHSetValueW(HKEY, const(wchar)*, const(wchar)*, uint, const(void)*, uint);
WIN32_ERROR SHRegGetValueA(HKEY, const(char)*, const(char)*, int, uint*, void*, uint*);
WIN32_ERROR SHRegGetValueW(HKEY, const(wchar)*, const(wchar)*, int, uint*, void*, uint*);
WIN32_ERROR SHRegGetValueFromHKCUHKLM(const(wchar)*, const(wchar)*, int, uint*, void*, uint*);
WIN32_ERROR SHQueryValueExA(HKEY, const(char)*, uint*, uint*, void*, uint*);
WIN32_ERROR SHQueryValueExW(HKEY, const(wchar)*, uint*, uint*, void*, uint*);
WIN32_ERROR SHEnumKeyExA(HKEY, uint, PSTR, uint*);
WIN32_ERROR SHEnumKeyExW(HKEY, uint, PWSTR, uint*);
WIN32_ERROR SHEnumValueA(HKEY, uint, PSTR, uint*, uint*, void*, uint*);
WIN32_ERROR SHEnumValueW(HKEY, uint, PWSTR, uint*, uint*, void*, uint*);
WIN32_ERROR SHQueryInfoKeyA(HKEY, uint*, uint*, uint*, uint*);
WIN32_ERROR SHQueryInfoKeyW(HKEY, uint*, uint*, uint*, uint*);
WIN32_ERROR SHCopyKeyA(HKEY, const(char)*, HKEY, uint);
WIN32_ERROR SHCopyKeyW(HKEY, const(wchar)*, HKEY, uint);
WIN32_ERROR SHRegGetPathA(HKEY, const(char)*, const(char)*, PSTR, uint);
WIN32_ERROR SHRegGetPathW(HKEY, const(wchar)*, const(wchar)*, PWSTR, uint);
WIN32_ERROR SHRegSetPathA(HKEY, const(char)*, const(char)*, const(char)*, uint);
WIN32_ERROR SHRegSetPathW(HKEY, const(wchar)*, const(wchar)*, const(wchar)*, uint);
WIN32_ERROR SHRegCreateUSKeyA(const(char)*, uint, long, long*, uint);
WIN32_ERROR SHRegCreateUSKeyW(const(wchar)*, uint, long, long*, uint);
WIN32_ERROR SHRegOpenUSKeyA(const(char)*, uint, long, long*, BOOL);
WIN32_ERROR SHRegOpenUSKeyW(const(wchar)*, uint, long, long*, BOOL);
WIN32_ERROR SHRegQueryUSValueA(long, const(char)*, uint*, void*, uint*, BOOL, void*, uint);
WIN32_ERROR SHRegQueryUSValueW(long, const(wchar)*, uint*, void*, uint*, BOOL, void*, uint);
WIN32_ERROR SHRegWriteUSValueA(long, const(char)*, uint, const(void)*, uint, uint);
WIN32_ERROR SHRegWriteUSValueW(long, const(wchar)*, uint, const(void)*, uint, uint);
WIN32_ERROR SHRegDeleteUSValueA(long, const(char)*, SHREGDEL_FLAGS);
WIN32_ERROR SHRegDeleteUSValueW(long, const(wchar)*, SHREGDEL_FLAGS);
WIN32_ERROR SHRegDeleteEmptyUSKeyW(long, const(wchar)*, SHREGDEL_FLAGS);
WIN32_ERROR SHRegDeleteEmptyUSKeyA(long, const(char)*, SHREGDEL_FLAGS);
WIN32_ERROR SHRegEnumUSKeyA(long, uint, PSTR, uint*, SHREGENUM_FLAGS);
WIN32_ERROR SHRegEnumUSKeyW(long, uint, PWSTR, uint*, SHREGENUM_FLAGS);
WIN32_ERROR SHRegEnumUSValueA(long, uint, PSTR, uint*, uint*, void*, uint*, SHREGENUM_FLAGS);
WIN32_ERROR SHRegEnumUSValueW(long, uint, PWSTR, uint*, uint*, void*, uint*, SHREGENUM_FLAGS);
WIN32_ERROR SHRegQueryInfoUSKeyA(long, uint*, uint*, uint*, uint*, SHREGENUM_FLAGS);
WIN32_ERROR SHRegQueryInfoUSKeyW(long, uint*, uint*, uint*, uint*, SHREGENUM_FLAGS);
WIN32_ERROR SHRegCloseUSKey(long);
WIN32_ERROR SHRegGetUSValueA(const(char)*, const(char)*, uint*, void*, uint*, BOOL, void*, uint);
WIN32_ERROR SHRegGetUSValueW(const(wchar)*, const(wchar)*, uint*, void*, uint*, BOOL, void*, uint);
WIN32_ERROR SHRegSetUSValueA(const(char)*, const(char)*, uint, const(void)*, uint, uint);
WIN32_ERROR SHRegSetUSValueW(const(wchar)*, const(wchar)*, uint, const(void)*, uint, uint);
WIN32_ERROR SHRegGetIntW(HKEY, const(wchar)*, int);
BOOL SHRegGetBoolUSValueA(const(char)*, const(char)*, BOOL, BOOL);
BOOL SHRegGetBoolUSValueW(const(wchar)*, const(wchar)*, BOOL, BOOL);
HRESULT AssocCreate(GUID, const(GUID)*, void**);
HRESULT AssocQueryStringA(uint, ASSOCSTR, const(char)*, const(char)*, PSTR, uint*);
HRESULT AssocQueryStringW(uint, ASSOCSTR, const(wchar)*, const(wchar)*, PWSTR, uint*);
HRESULT AssocQueryStringByKeyA(uint, ASSOCSTR, HKEY, const(char)*, PSTR, uint*);
HRESULT AssocQueryStringByKeyW(uint, ASSOCSTR, HKEY, const(wchar)*, PWSTR, uint*);
HRESULT AssocQueryKeyA(uint, ASSOCKEY, const(char)*, const(char)*, HKEY*);
HRESULT AssocQueryKeyW(uint, ASSOCKEY, const(wchar)*, const(wchar)*, HKEY*);
BOOL AssocIsDangerous(const(wchar)*);
HRESULT AssocGetPerceivedType(const(wchar)*, PERCEIVED*, uint*, PWSTR*);
IStream SHOpenRegStreamA(HKEY, const(char)*, const(char)*, uint);
IStream SHOpenRegStreamW(HKEY, const(wchar)*, const(wchar)*, uint);
IStream SHOpenRegStream2A(HKEY, const(char)*, const(char)*, uint);
IStream SHOpenRegStream2W(HKEY, const(wchar)*, const(wchar)*, uint);
HRESULT SHCreateStreamOnFileA(const(char)*, uint, IStream*);
HRESULT SHCreateStreamOnFileW(const(wchar)*, uint, IStream*);
HRESULT SHCreateStreamOnFileEx(const(wchar)*, uint, uint, BOOL, IStream, IStream*);
IStream SHCreateMemStream(const(ubyte)*, uint);
HRESULT GetAcceptLanguagesA(PSTR, uint*);
HRESULT GetAcceptLanguagesW(PWSTR, uint*);
void IUnknown_Set(IUnknown*, IUnknown);
void IUnknown_AtomicRelease(void**);
HRESULT IUnknown_GetWindow(IUnknown, HWND*);
HRESULT IUnknown_SetSite(IUnknown, IUnknown);
HRESULT IUnknown_GetSite(IUnknown, const(GUID)*, void**);
HRESULT IUnknown_QueryService(IUnknown, const(GUID)*, const(GUID)*, void**);
HRESULT IStream_Read(IStream, void*, uint);
HRESULT IStream_Write(IStream, const(void)*, uint);
HRESULT IStream_Reset(IStream);
HRESULT IStream_Size(IStream, ULARGE_INTEGER*);
HRESULT ConnectToConnectionPoint(IUnknown, const(GUID)*, BOOL, IUnknown, uint*, IConnectionPoint*);
HRESULT IStream_ReadPidl(IStream, ITEMIDLIST**);
HRESULT IStream_WritePidl(IStream, ITEMIDLIST*);
HRESULT IStream_ReadStr(IStream, PWSTR*);
HRESULT IStream_WriteStr(IStream, const(wchar)*);
HRESULT IStream_Copy(IStream, IStream, uint);
HRESULT SHGetViewStatePropertyBag(ITEMIDLIST*, const(wchar)*, uint, const(GUID)*, void**);
int SHFormatDateTimeA(const(FILETIME)*, uint*, PSTR, uint);
int SHFormatDateTimeW(const(FILETIME)*, uint*, PWSTR, uint);
int SHAnsiToUnicode(const(char)*, PWSTR, int);
int SHAnsiToAnsi(const(char)*, PSTR, int);
int SHUnicodeToAnsi(const(wchar)*, PSTR, int);
int SHUnicodeToUnicode(const(wchar)*, PWSTR, int);
int SHMessageBoxCheckA(HWND, const(char)*, const(char)*, uint, int, const(char)*);
int SHMessageBoxCheckW(HWND, const(wchar)*, const(wchar)*, uint, int, const(wchar)*);
LRESULT SHSendMessageBroadcastA(uint, WPARAM, LPARAM);
LRESULT SHSendMessageBroadcastW(uint, WPARAM, LPARAM);
CHAR SHStripMneumonicA(PSTR);
wchar SHStripMneumonicW(PWSTR);
BOOL IsOS(OS);
int SHGlobalCounterGetValue(const(SHGLOBALCOUNTER));
int SHGlobalCounterIncrement(const(SHGLOBALCOUNTER));
int SHGlobalCounterDecrement(const(SHGLOBALCOUNTER));
HANDLE SHAllocShared(const(void)*, uint, uint);
BOOL SHFreeShared(HANDLE, uint);
void* SHLockShared(HANDLE, uint);
BOOL SHUnlockShared(void*);
uint WhichPlatform();
HRESULT QISearch(void*, QITAB*, const(GUID)*, void**);
BOOL SHIsLowMemoryMachine(uint);
int GetMenuPosFromID(HMENU, uint);
HRESULT SHGetInverseCMAP(ubyte*, uint);
HRESULT SHAutoComplete(HWND, SHELL_AUTOCOMPLETE_FLAGS);
HRESULT SHCreateThreadRef(int*, IUnknown*);
HRESULT SHSetThreadRef(IUnknown);
HRESULT SHGetThreadRef(IUnknown*);
BOOL SHSkipJunction(IBindCtx, const(GUID)*);
BOOL SHCreateThread(LPTHREAD_START_ROUTINE, void*, uint, LPTHREAD_START_ROUTINE);
BOOL SHCreateThreadWithHandle(LPTHREAD_START_ROUTINE, void*, uint, LPTHREAD_START_ROUTINE, HANDLE*);
HRESULT SHReleaseThreadRef();
HPALETTE SHCreateShellPalette(HDC);
void ColorRGBToHLS(COLORREF, ushort*, ushort*, ushort*);
COLORREF ColorHLSToRGB(ushort, ushort, ushort);
COLORREF ColorAdjustLuma(COLORREF, int, BOOL);
BOOL IsInternetESCEnabled();
HRESULT HlinkCreateFromMoniker(IMoniker, const(wchar)*, const(wchar)*, IHlinkSite, uint, IUnknown, const(GUID)*, void**);
HRESULT HlinkCreateFromString(const(wchar)*, const(wchar)*, const(wchar)*, IHlinkSite, uint, IUnknown, const(GUID)*, void**);
HRESULT HlinkCreateFromData(IDataObject, IHlinkSite, uint, IUnknown, const(GUID)*, void**);
HRESULT HlinkQueryCreateFromData(IDataObject);
HRESULT HlinkClone(IHlink, const(GUID)*, IHlinkSite, uint, void**);
HRESULT HlinkCreateBrowseContext(IUnknown, const(GUID)*, void**);
HRESULT HlinkNavigateToStringReference(const(wchar)*, const(wchar)*, IHlinkSite, uint, IHlinkFrame, uint, IBindCtx, IBindStatusCallback, IHlinkBrowseContext);
HRESULT HlinkNavigate(IHlink, IHlinkFrame, uint, IBindCtx, IBindStatusCallback, IHlinkBrowseContext);
HRESULT HlinkOnNavigate(IHlinkFrame, IHlinkBrowseContext, uint, IMoniker, const(wchar)*, const(wchar)*, uint*);
HRESULT HlinkUpdateStackItem(IHlinkFrame, IHlinkBrowseContext, uint, IMoniker, const(wchar)*, const(wchar)*);
HRESULT HlinkOnRenameDocument(uint, IHlinkBrowseContext, IMoniker, IMoniker);
HRESULT HlinkResolveMonikerForData(IMoniker, uint, IBindCtx, uint, FORMATETC*, IBindStatusCallback, IMoniker);
HRESULT HlinkResolveStringForData(const(wchar)*, uint, IBindCtx, uint, FORMATETC*, IBindStatusCallback, IMoniker);
HRESULT HlinkParseDisplayName(IBindCtx, const(wchar)*, BOOL, uint*, IMoniker*);
HRESULT HlinkCreateExtensionServices(const(wchar)*, HWND, const(wchar)*, const(wchar)*, IUnknown, const(GUID)*, void**);
HRESULT HlinkPreprocessMoniker(IBindCtx, IMoniker, IMoniker*);
HRESULT OleSaveToStreamEx(IUnknown, IStream, BOOL);
HRESULT HlinkSetSpecialReference(uint, const(wchar)*);
HRESULT HlinkGetSpecialReference(uint, PWSTR*);
HRESULT HlinkCreateShortcut(uint, IHlink, const(wchar)*, const(wchar)*, PWSTR*, uint);
HRESULT HlinkCreateShortcutFromMoniker(uint, IMoniker, const(wchar)*, const(wchar)*, const(wchar)*, PWSTR*, uint);
HRESULT HlinkCreateShortcutFromString(uint, const(wchar)*, const(wchar)*, const(wchar)*, const(wchar)*, PWSTR*, uint);
HRESULT HlinkResolveShortcut(const(wchar)*, IHlinkSite, uint, IUnknown, const(GUID)*, void**);
HRESULT HlinkResolveShortcutToMoniker(const(wchar)*, IMoniker*, PWSTR*);
HRESULT HlinkResolveShortcutToString(const(wchar)*, PWSTR*, PWSTR*);
HRESULT HlinkIsShortcut(const(wchar)*);
HRESULT HlinkGetValueFromParams(const(wchar)*, const(wchar)*, PWSTR*);
HRESULT HlinkTranslateURL(const(wchar)*, uint, PWSTR*);
BOOL PathIsUNCEx(const(wchar)*, PWSTR*);
BOOL PathCchIsRoot(const(wchar)*);
HRESULT PathCchAddBackslashEx(PWSTR, ulong, PWSTR*, ulong*);
HRESULT PathCchAddBackslash(PWSTR, ulong);
HRESULT PathCchRemoveBackslashEx(PWSTR, ulong, PWSTR*, ulong*);
HRESULT PathCchRemoveBackslash(PWSTR, ulong);
HRESULT PathCchSkipRoot(const(wchar)*, PWSTR*);
HRESULT PathCchStripToRoot(PWSTR, ulong);
HRESULT PathCchRemoveFileSpec(PWSTR, ulong);
HRESULT PathCchFindExtension(const(wchar)*, ulong, PWSTR*);
HRESULT PathCchAddExtension(PWSTR, ulong, const(wchar)*);
HRESULT PathCchRenameExtension(PWSTR, ulong, const(wchar)*);
HRESULT PathCchRemoveExtension(PWSTR, ulong);
HRESULT PathCchCanonicalizeEx(PWSTR, ulong, const(wchar)*, PATHCCH_OPTIONS);
HRESULT PathCchCanonicalize(PWSTR, ulong, const(wchar)*);
HRESULT PathCchCombineEx(PWSTR, ulong, const(wchar)*, const(wchar)*, PATHCCH_OPTIONS);
HRESULT PathCchCombine(PWSTR, ulong, const(wchar)*, const(wchar)*);
HRESULT PathCchAppendEx(PWSTR, ulong, const(wchar)*, PATHCCH_OPTIONS);
HRESULT PathCchAppend(PWSTR, ulong, const(wchar)*);
HRESULT PathCchStripPrefix(PWSTR, ulong);
HRESULT PathAllocCombine(const(wchar)*, const(wchar)*, PATHCCH_OPTIONS, PWSTR*);
HRESULT PathAllocCanonicalize(const(wchar)*, PATHCCH_OPTIONS, PWSTR*);
uint RegisterAppStateChangeNotification(PAPPSTATE_CHANGE_ROUTINE, void*, _APPSTATE_REGISTRATION**);
void UnregisterAppStateChangeNotification(_APPSTATE_REGISTRATION*);
uint RegisterAppConstrainedChangeNotification(PAPPCONSTRAIN_CHANGE_ROUTINE, void*, _APPCONSTRAIN_REGISTRATION**);
void UnregisterAppConstrainedChangeNotification(_APPCONSTRAIN_REGISTRATION*);
enum HLINK_E_FIRST = 0xffffffff80040100;
enum HLINK_S_FIRST = 0x00040100;
enum WM_CPL_LAUNCH = 0x000007e8;
enum WM_CPL_LAUNCHED = 0x000007e9;
enum CPL_DYNAMIC_RES = 0x00000000;
enum CPL_INIT = 0x00000001;
enum CPL_GETCOUNT = 0x00000002;
enum CPL_INQUIRE = 0x00000003;
enum CPL_SELECT = 0x00000004;
enum CPL_DBLCLK = 0x00000005;
enum CPL_STOP = 0x00000006;
enum CPL_EXIT = 0x00000007;
enum CPL_NEWINQUIRE = 0x00000008;
enum CPL_STARTWPARMSA = 0x00000009;
enum CPL_STARTWPARMSW = 0x0000000a;
enum CPL_STARTWPARMS = 0x0000000a;
enum CPL_SETUP = 0x000000c8;
enum HLINK_S_DONTHIDE = 0x00040100;
enum FOLDERID_NetworkFolder = GUID(0xd20beec4, 0x5ca8, 0x4905, [0xae, 0x3b, 0xbf, 0x25, 0x1e, 0xa0, 0x9b, 0x53]);
enum FOLDERID_ComputerFolder = GUID(0xac0837c, 0xbbf8, 0x452a, [0x85, 0xd, 0x79, 0xd0, 0x8e, 0x66, 0x7c, 0xa7]);
enum FOLDERID_InternetFolder = GUID(0x4d9f7874, 0x4e0c, 0x4904, [0x96, 0x7b, 0x40, 0xb0, 0xd2, 0xc, 0x3e, 0x4b]);
enum FOLDERID_ControlPanelFolder = GUID(0x82a74aeb, 0xaeb4, 0x465c, [0xa0, 0x14, 0xd0, 0x97, 0xee, 0x34, 0x6d, 0x63]);
enum FOLDERID_PrintersFolder = GUID(0x76fc4e2d, 0xd6ad, 0x4519, [0xa6, 0x63, 0x37, 0xbd, 0x56, 0x6, 0x81, 0x85]);
enum FOLDERID_SyncManagerFolder = GUID(0x43668bf8, 0xc14e, 0x49b2, [0x97, 0xc9, 0x74, 0x77, 0x84, 0xd7, 0x84, 0xb7]);
enum FOLDERID_SyncSetupFolder = GUID(0xf214138, 0xb1d3, 0x4a90, [0xbb, 0xa9, 0x27, 0xcb, 0xc0, 0xc5, 0x38, 0x9a]);
enum FOLDERID_ConflictFolder = GUID(0x4bfefb45, 0x347d, 0x4006, [0xa5, 0xbe, 0xac, 0xc, 0xb0, 0x56, 0x71, 0x92]);
enum FOLDERID_SyncResultsFolder = GUID(0x289a9a43, 0xbe44, 0x4057, [0xa4, 0x1b, 0x58, 0x7a, 0x76, 0xd7, 0xe7, 0xf9]);
enum FOLDERID_RecycleBinFolder = GUID(0xb7534046, 0x3ecb, 0x4c18, [0xbe, 0x4e, 0x64, 0xcd, 0x4c, 0xb7, 0xd6, 0xac]);
enum FOLDERID_ConnectionsFolder = GUID(0x6f0cd92b, 0x2e97, 0x45d1, [0x88, 0xff, 0xb0, 0xd1, 0x86, 0xb8, 0xde, 0xdd]);
enum FOLDERID_Fonts = GUID(0xfd228cb7, 0xae11, 0x4ae3, [0x86, 0x4c, 0x16, 0xf3, 0x91, 0xa, 0xb8, 0xfe]);
enum FOLDERID_Desktop = GUID(0xb4bfcc3a, 0xdb2c, 0x424c, [0xb0, 0x29, 0x7f, 0xe9, 0x9a, 0x87, 0xc6, 0x41]);
enum FOLDERID_Startup = GUID(0xb97d20bb, 0xf46a, 0x4c97, [0xba, 0x10, 0x5e, 0x36, 0x8, 0x43, 0x8, 0x54]);
enum FOLDERID_Programs = GUID(0xa77f5d77, 0x2e2b, 0x44c3, [0xa6, 0xa2, 0xab, 0xa6, 0x1, 0x5, 0x4a, 0x51]);
enum FOLDERID_StartMenu = GUID(0x625b53c3, 0xab48, 0x4ec1, [0xba, 0x1f, 0xa1, 0xef, 0x41, 0x46, 0xfc, 0x19]);
enum FOLDERID_Recent = GUID(0xae50c081, 0xebd2, 0x438a, [0x86, 0x55, 0x8a, 0x9, 0x2e, 0x34, 0x98, 0x7a]);
enum FOLDERID_SendTo = GUID(0x8983036c, 0x27c0, 0x404b, [0x8f, 0x8, 0x10, 0x2d, 0x10, 0xdc, 0xfd, 0x74]);
enum FOLDERID_Documents = GUID(0xfdd39ad0, 0x238f, 0x46af, [0xad, 0xb4, 0x6c, 0x85, 0x48, 0x3, 0x69, 0xc7]);
enum FOLDERID_Favorites = GUID(0x1777f761, 0x68ad, 0x4d8a, [0x87, 0xbd, 0x30, 0xb7, 0x59, 0xfa, 0x33, 0xdd]);
enum FOLDERID_NetHood = GUID(0xc5abbf53, 0xe17f, 0x4121, [0x89, 0x0, 0x86, 0x62, 0x6f, 0xc2, 0xc9, 0x73]);
enum FOLDERID_PrintHood = GUID(0x9274bd8d, 0xcfd1, 0x41c3, [0xb3, 0x5e, 0xb1, 0x3f, 0x55, 0xa7, 0x58, 0xf4]);
enum FOLDERID_Templates = GUID(0xa63293e8, 0x664e, 0x48db, [0xa0, 0x79, 0xdf, 0x75, 0x9e, 0x5, 0x9, 0xf7]);
enum FOLDERID_CommonStartup = GUID(0x82a5ea35, 0xd9cd, 0x47c5, [0x96, 0x29, 0xe1, 0x5d, 0x2f, 0x71, 0x4e, 0x6e]);
enum FOLDERID_CommonPrograms = GUID(0x139d44e, 0x6afe, 0x49f2, [0x86, 0x90, 0x3d, 0xaf, 0xca, 0xe6, 0xff, 0xb8]);
enum FOLDERID_CommonStartMenu = GUID(0xa4115719, 0xd62e, 0x491d, [0xaa, 0x7c, 0xe7, 0x4b, 0x8b, 0xe3, 0xb0, 0x67]);
enum FOLDERID_PublicDesktop = GUID(0xc4aa340d, 0xf20f, 0x4863, [0xaf, 0xef, 0xf8, 0x7e, 0xf2, 0xe6, 0xba, 0x25]);
enum FOLDERID_ProgramData = GUID(0x62ab5d82, 0xfdc1, 0x4dc3, [0xa9, 0xdd, 0x7, 0xd, 0x1d, 0x49, 0x5d, 0x97]);
enum FOLDERID_CommonTemplates = GUID(0xb94237e7, 0x57ac, 0x4347, [0x91, 0x51, 0xb0, 0x8c, 0x6c, 0x32, 0xd1, 0xf7]);
enum FOLDERID_PublicDocuments = GUID(0xed4824af, 0xdce4, 0x45a8, [0x81, 0xe2, 0xfc, 0x79, 0x65, 0x8, 0x36, 0x34]);
enum FOLDERID_RoamingAppData = GUID(0x3eb685db, 0x65f9, 0x4cf6, [0xa0, 0x3a, 0xe3, 0xef, 0x65, 0x72, 0x9f, 0x3d]);
enum FOLDERID_LocalAppData = GUID(0xf1b32785, 0x6fba, 0x4fcf, [0x9d, 0x55, 0x7b, 0x8e, 0x7f, 0x15, 0x70, 0x91]);
enum FOLDERID_LocalAppDataLow = GUID(0xa520a1a4, 0x1780, 0x4ff6, [0xbd, 0x18, 0x16, 0x73, 0x43, 0xc5, 0xaf, 0x16]);
enum FOLDERID_InternetCache = GUID(0x352481e8, 0x33be, 0x4251, [0xba, 0x85, 0x60, 0x7, 0xca, 0xed, 0xcf, 0x9d]);
enum FOLDERID_Cookies = GUID(0x2b0f765d, 0xc0e9, 0x4171, [0x90, 0x8e, 0x8, 0xa6, 0x11, 0xb8, 0x4f, 0xf6]);
enum FOLDERID_History = GUID(0xd9dc8a3b, 0xb784, 0x432e, [0xa7, 0x81, 0x5a, 0x11, 0x30, 0xa7, 0x59, 0x63]);
enum FOLDERID_System = GUID(0x1ac14e77, 0x2e7, 0x4e5d, [0xb7, 0x44, 0x2e, 0xb1, 0xae, 0x51, 0x98, 0xb7]);
enum FOLDERID_SystemX86 = GUID(0xd65231b0, 0xb2f1, 0x4857, [0xa4, 0xce, 0xa8, 0xe7, 0xc6, 0xea, 0x7d, 0x27]);
enum FOLDERID_Windows = GUID(0xf38bf404, 0x1d43, 0x42f2, [0x93, 0x5, 0x67, 0xde, 0xb, 0x28, 0xfc, 0x23]);
enum FOLDERID_Profile = GUID(0x5e6c858f, 0xe22, 0x4760, [0x9a, 0xfe, 0xea, 0x33, 0x17, 0xb6, 0x71, 0x73]);
enum FOLDERID_Pictures = GUID(0x33e28130, 0x4e1e, 0x4676, [0x83, 0x5a, 0x98, 0x39, 0x5c, 0x3b, 0xc3, 0xbb]);
enum FOLDERID_ProgramFilesX86 = GUID(0x7c5a40ef, 0xa0fb, 0x4bfc, [0x87, 0x4a, 0xc0, 0xf2, 0xe0, 0xb9, 0xfa, 0x8e]);
enum FOLDERID_ProgramFilesCommonX86 = GUID(0xde974d24, 0xd9c6, 0x4d3e, [0xbf, 0x91, 0xf4, 0x45, 0x51, 0x20, 0xb9, 0x17]);
enum FOLDERID_ProgramFilesX64 = GUID(0x6d809377, 0x6af0, 0x444b, [0x89, 0x57, 0xa3, 0x77, 0x3f, 0x2, 0x20, 0xe]);
enum FOLDERID_ProgramFilesCommonX64 = GUID(0x6365d5a7, 0xf0d, 0x45e5, [0x87, 0xf6, 0xd, 0xa5, 0x6b, 0x6a, 0x4f, 0x7d]);
enum FOLDERID_ProgramFiles = GUID(0x905e63b6, 0xc1bf, 0x494e, [0xb2, 0x9c, 0x65, 0xb7, 0x32, 0xd3, 0xd2, 0x1a]);
enum FOLDERID_ProgramFilesCommon = GUID(0xf7f1ed05, 0x9f6d, 0x47a2, [0xaa, 0xae, 0x29, 0xd3, 0x17, 0xc6, 0xf0, 0x66]);
enum FOLDERID_UserProgramFiles = GUID(0x5cd7aee2, 0x2219, 0x4a67, [0xb8, 0x5d, 0x6c, 0x9c, 0xe1, 0x56, 0x60, 0xcb]);
enum FOLDERID_UserProgramFilesCommon = GUID(0xbcbd3057, 0xca5c, 0x4622, [0xb4, 0x2d, 0xbc, 0x56, 0xdb, 0xa, 0xe5, 0x16]);
enum FOLDERID_AdminTools = GUID(0x724ef170, 0xa42d, 0x4fef, [0x9f, 0x26, 0xb6, 0xe, 0x84, 0x6f, 0xba, 0x4f]);
enum FOLDERID_CommonAdminTools = GUID(0xd0384e7d, 0xbac3, 0x4797, [0x8f, 0x14, 0xcb, 0xa2, 0x29, 0xb3, 0x92, 0xb5]);
enum FOLDERID_Music = GUID(0x4bd8d571, 0x6d19, 0x48d3, [0xbe, 0x97, 0x42, 0x22, 0x20, 0x8, 0xe, 0x43]);
enum FOLDERID_Videos = GUID(0x18989b1d, 0x99b5, 0x455b, [0x84, 0x1c, 0xab, 0x7c, 0x74, 0xe4, 0xdd, 0xfc]);
enum FOLDERID_Ringtones = GUID(0xc870044b, 0xf49e, 0x4126, [0xa9, 0xc3, 0xb5, 0x2a, 0x1f, 0xf4, 0x11, 0xe8]);
enum FOLDERID_PublicPictures = GUID(0xb6ebfb86, 0x6907, 0x413c, [0x9a, 0xf7, 0x4f, 0xc2, 0xab, 0xf0, 0x7c, 0xc5]);
enum FOLDERID_PublicMusic = GUID(0x3214fab5, 0x9757, 0x4298, [0xbb, 0x61, 0x92, 0xa9, 0xde, 0xaa, 0x44, 0xff]);
enum FOLDERID_PublicVideos = GUID(0x2400183a, 0x6185, 0x49fb, [0xa2, 0xd8, 0x4a, 0x39, 0x2a, 0x60, 0x2b, 0xa3]);
enum FOLDERID_PublicRingtones = GUID(0xe555ab60, 0x153b, 0x4d17, [0x9f, 0x4, 0xa5, 0xfe, 0x99, 0xfc, 0x15, 0xec]);
enum FOLDERID_ResourceDir = GUID(0x8ad10c31, 0x2adb, 0x4296, [0xa8, 0xf7, 0xe4, 0x70, 0x12, 0x32, 0xc9, 0x72]);
enum FOLDERID_LocalizedResourcesDir = GUID(0x2a00375e, 0x224c, 0x49de, [0xb8, 0xd1, 0x44, 0xd, 0xf7, 0xef, 0x3d, 0xdc]);
enum FOLDERID_CommonOEMLinks = GUID(0xc1bae2d0, 0x10df, 0x4334, [0xbe, 0xdd, 0x7a, 0xa2, 0xb, 0x22, 0x7a, 0x9d]);
enum FOLDERID_CDBurning = GUID(0x9e52ab10, 0xf80d, 0x49df, [0xac, 0xb8, 0x43, 0x30, 0xf5, 0x68, 0x78, 0x55]);
enum FOLDERID_UserProfiles = GUID(0x762d272, 0xc50a, 0x4bb0, [0xa3, 0x82, 0x69, 0x7d, 0xcd, 0x72, 0x9b, 0x80]);
enum FOLDERID_Playlists = GUID(0xde92c1c7, 0x837f, 0x4f69, [0xa3, 0xbb, 0x86, 0xe6, 0x31, 0x20, 0x4a, 0x23]);
enum FOLDERID_SamplePlaylists = GUID(0x15ca69b3, 0x30ee, 0x49c1, [0xac, 0xe1, 0x6b, 0x5e, 0xc3, 0x72, 0xaf, 0xb5]);
enum FOLDERID_SampleMusic = GUID(0xb250c668, 0xf57d, 0x4ee1, [0xa6, 0x3c, 0x29, 0xe, 0xe7, 0xd1, 0xaa, 0x1f]);
enum FOLDERID_SamplePictures = GUID(0xc4900540, 0x2379, 0x4c75, [0x84, 0x4b, 0x64, 0xe6, 0xfa, 0xf8, 0x71, 0x6b]);
enum FOLDERID_SampleVideos = GUID(0x859ead94, 0x2e85, 0x48ad, [0xa7, 0x1a, 0x9, 0x69, 0xcb, 0x56, 0xa6, 0xcd]);
enum FOLDERID_PhotoAlbums = GUID(0x69d2cf90, 0xfc33, 0x4fb7, [0x9a, 0xc, 0xeb, 0xb0, 0xf0, 0xfc, 0xb4, 0x3c]);
enum FOLDERID_Public = GUID(0xdfdf76a2, 0xc82a, 0x4d63, [0x90, 0x6a, 0x56, 0x44, 0xac, 0x45, 0x73, 0x85]);
enum FOLDERID_ChangeRemovePrograms = GUID(0xdf7266ac, 0x9274, 0x4867, [0x8d, 0x55, 0x3b, 0xd6, 0x61, 0xde, 0x87, 0x2d]);
enum FOLDERID_AppUpdates = GUID(0xa305ce99, 0xf527, 0x492b, [0x8b, 0x1a, 0x7e, 0x76, 0xfa, 0x98, 0xd6, 0xe4]);
enum FOLDERID_AddNewPrograms = GUID(0xde61d971, 0x5ebc, 0x4f02, [0xa3, 0xa9, 0x6c, 0x82, 0x89, 0x5e, 0x5c, 0x4]);
enum FOLDERID_Downloads = GUID(0x374de290, 0x123f, 0x4565, [0x91, 0x64, 0x39, 0xc4, 0x92, 0x5e, 0x46, 0x7b]);
enum FOLDERID_PublicDownloads = GUID(0x3d644c9b, 0x1fb8, 0x4f30, [0x9b, 0x45, 0xf6, 0x70, 0x23, 0x5f, 0x79, 0xc0]);
enum FOLDERID_SavedSearches = GUID(0x7d1d3a04, 0xdebb, 0x4115, [0x95, 0xcf, 0x2f, 0x29, 0xda, 0x29, 0x20, 0xda]);
enum FOLDERID_QuickLaunch = GUID(0x52a4f021, 0x7b75, 0x48a9, [0x9f, 0x6b, 0x4b, 0x87, 0xa2, 0x10, 0xbc, 0x8f]);
enum FOLDERID_Contacts = GUID(0x56784854, 0xc6cb, 0x462b, [0x81, 0x69, 0x88, 0xe3, 0x50, 0xac, 0xb8, 0x82]);
enum FOLDERID_SidebarParts = GUID(0xa75d362e, 0x50fc, 0x4fb7, [0xac, 0x2c, 0xa8, 0xbe, 0xaa, 0x31, 0x44, 0x93]);
enum FOLDERID_SidebarDefaultParts = GUID(0x7b396e54, 0x9ec5, 0x4300, [0xbe, 0xa, 0x24, 0x82, 0xeb, 0xae, 0x1a, 0x26]);
enum FOLDERID_PublicGameTasks = GUID(0xdebf2536, 0xe1a8, 0x4c59, [0xb6, 0xa2, 0x41, 0x45, 0x86, 0x47, 0x6a, 0xea]);
enum FOLDERID_GameTasks = GUID(0x54fae61, 0x4dd8, 0x4787, [0x80, 0xb6, 0x9, 0x2, 0x20, 0xc4, 0xb7, 0x0]);
enum FOLDERID_SavedGames = GUID(0x4c5c32ff, 0xbb9d, 0x43b0, [0xb5, 0xb4, 0x2d, 0x72, 0xe5, 0x4e, 0xaa, 0xa4]);
enum FOLDERID_Games = GUID(0xcac52c1a, 0xb53d, 0x4edc, [0x92, 0xd7, 0x6b, 0x2e, 0x8a, 0xc1, 0x94, 0x34]);
enum FOLDERID_SEARCH_MAPI = GUID(0x98ec0e18, 0x2098, 0x4d44, [0x86, 0x44, 0x66, 0x97, 0x93, 0x15, 0xa2, 0x81]);
enum FOLDERID_SEARCH_CSC = GUID(0xee32e446, 0x31ca, 0x4aba, [0x81, 0x4f, 0xa5, 0xeb, 0xd2, 0xfd, 0x6d, 0x5e]);
enum FOLDERID_Links = GUID(0xbfb9d5e0, 0xc6a9, 0x404c, [0xb2, 0xb2, 0xae, 0x6d, 0xb6, 0xaf, 0x49, 0x68]);
enum FOLDERID_UsersFiles = GUID(0xf3ce0f7c, 0x4901, 0x4acc, [0x86, 0x48, 0xd5, 0xd4, 0x4b, 0x4, 0xef, 0x8f]);
enum FOLDERID_UsersLibraries = GUID(0xa302545d, 0xdeff, 0x464b, [0xab, 0xe8, 0x61, 0xc8, 0x64, 0x8d, 0x93, 0x9b]);
enum FOLDERID_SearchHome = GUID(0x190337d1, 0xb8ca, 0x4121, [0xa6, 0x39, 0x6d, 0x47, 0x2d, 0x16, 0x97, 0x2a]);
enum FOLDERID_OriginalImages = GUID(0x2c36c0aa, 0x5812, 0x4b87, [0xbf, 0xd0, 0x4c, 0xd0, 0xdf, 0xb1, 0x9b, 0x39]);
enum FOLDERID_DocumentsLibrary = GUID(0x7b0db17d, 0x9cd2, 0x4a93, [0x97, 0x33, 0x46, 0xcc, 0x89, 0x2, 0x2e, 0x7c]);
enum FOLDERID_MusicLibrary = GUID(0x2112ab0a, 0xc86a, 0x4ffe, [0xa3, 0x68, 0xd, 0xe9, 0x6e, 0x47, 0x1, 0x2e]);
enum FOLDERID_PicturesLibrary = GUID(0xa990ae9f, 0xa03b, 0x4e80, [0x94, 0xbc, 0x99, 0x12, 0xd7, 0x50, 0x41, 0x4]);
enum FOLDERID_VideosLibrary = GUID(0x491e922f, 0x5643, 0x4af4, [0xa7, 0xeb, 0x4e, 0x7a, 0x13, 0x8d, 0x81, 0x74]);
enum FOLDERID_RecordedTVLibrary = GUID(0x1a6fdba2, 0xf42d, 0x4358, [0xa7, 0x98, 0xb7, 0x4d, 0x74, 0x59, 0x26, 0xc5]);
enum FOLDERID_HomeGroup = GUID(0x52528a6b, 0xb9e3, 0x4add, [0xb6, 0xd, 0x58, 0x8c, 0x2d, 0xba, 0x84, 0x2d]);
enum FOLDERID_HomeGroupCurrentUser = GUID(0x9b74b6a3, 0xdfd, 0x4f11, [0x9e, 0x78, 0x5f, 0x78, 0x0, 0xf2, 0xe7, 0x72]);
enum FOLDERID_DeviceMetadataStore = GUID(0x5ce4a5e9, 0xe4eb, 0x479d, [0xb8, 0x9f, 0x13, 0xc, 0x2, 0x88, 0x61, 0x55]);
enum FOLDERID_Libraries = GUID(0x1b3ea5dc, 0xb587, 0x4786, [0xb4, 0xef, 0xbd, 0x1d, 0xc3, 0x32, 0xae, 0xae]);
enum FOLDERID_PublicLibraries = GUID(0x48daf80b, 0xe6cf, 0x4f4e, [0xb8, 0x0, 0xe, 0x69, 0xd8, 0x4e, 0xe3, 0x84]);
enum FOLDERID_UserPinned = GUID(0x9e3995ab, 0x1f9c, 0x4f13, [0xb8, 0x27, 0x48, 0xb2, 0x4b, 0x6c, 0x71, 0x74]);
enum FOLDERID_ImplicitAppShortcuts = GUID(0xbcb5256f, 0x79f6, 0x4cee, [0xb7, 0x25, 0xdc, 0x34, 0xe4, 0x2, 0xfd, 0x46]);
enum FOLDERID_AccountPictures = GUID(0x8ca0b1, 0x55b4, 0x4c56, [0xb8, 0xa8, 0x4d, 0xe4, 0xb2, 0x99, 0xd3, 0xbe]);
enum FOLDERID_PublicUserTiles = GUID(0x482af6c, 0x8f1, 0x4c34, [0x8c, 0x90, 0xe1, 0x7e, 0xc9, 0x8b, 0x1e, 0x17]);
enum FOLDERID_AppsFolder = GUID(0x1e87508d, 0x89c2, 0x42f0, [0x8a, 0x7e, 0x64, 0x5a, 0xf, 0x50, 0xca, 0x58]);
enum FOLDERID_StartMenuAllPrograms = GUID(0xf26305ef, 0x6948, 0x40b9, [0xb2, 0x55, 0x81, 0x45, 0x3d, 0x9, 0xc7, 0x85]);
enum FOLDERID_CommonStartMenuPlaces = GUID(0xa440879f, 0x87a0, 0x4f7d, [0xb7, 0x0, 0x2, 0x7, 0xb9, 0x66, 0x19, 0x4a]);
enum FOLDERID_ApplicationShortcuts = GUID(0xa3918781, 0xe5f2, 0x4890, [0xb3, 0xd9, 0xa7, 0xe5, 0x43, 0x32, 0x32, 0x8c]);
enum FOLDERID_RoamingTiles = GUID(0xbcfc5a, 0xed94, 0x4e48, [0x96, 0xa1, 0x3f, 0x62, 0x17, 0xf2, 0x19, 0x90]);
enum FOLDERID_RoamedTileImages = GUID(0xaaa8d5a5, 0xf1d6, 0x4259, [0xba, 0xa8, 0x78, 0xe7, 0xef, 0x60, 0x83, 0x5e]);
enum FOLDERID_Screenshots = GUID(0xb7bede81, 0xdf94, 0x4682, [0xa7, 0xd8, 0x57, 0xa5, 0x26, 0x20, 0xb8, 0x6f]);
enum FOLDERID_CameraRoll = GUID(0xab5fb87b, 0x7ce2, 0x4f83, [0x91, 0x5d, 0x55, 0x8, 0x46, 0xc9, 0x53, 0x7b]);
enum FOLDERID_SkyDrive = GUID(0xa52bba46, 0xe9e1, 0x435f, [0xb3, 0xd9, 0x28, 0xda, 0xa6, 0x48, 0xc0, 0xf6]);
enum FOLDERID_OneDrive = GUID(0xa52bba46, 0xe9e1, 0x435f, [0xb3, 0xd9, 0x28, 0xda, 0xa6, 0x48, 0xc0, 0xf6]);
enum FOLDERID_SkyDriveDocuments = GUID(0x24d89e24, 0x2f19, 0x4534, [0x9d, 0xde, 0x6a, 0x66, 0x71, 0xfb, 0xb8, 0xfe]);
enum FOLDERID_SkyDrivePictures = GUID(0x339719b5, 0x8c47, 0x4894, [0x94, 0xc2, 0xd8, 0xf7, 0x7a, 0xdd, 0x44, 0xa6]);
enum FOLDERID_SkyDriveMusic = GUID(0xc3f2459e, 0x80d6, 0x45dc, [0xbf, 0xef, 0x1f, 0x76, 0x9f, 0x2b, 0xe7, 0x30]);
enum FOLDERID_SkyDriveCameraRoll = GUID(0x767e6811, 0x49cb, 0x4273, [0x87, 0xc2, 0x20, 0xf3, 0x55, 0xe1, 0x8, 0x5b]);
enum FOLDERID_SearchHistory = GUID(0xd4c3db6, 0x3a3, 0x462f, [0xa0, 0xe6, 0x8, 0x92, 0x4c, 0x41, 0xb5, 0xd4]);
enum FOLDERID_SearchTemplates = GUID(0x7e636bfe, 0xdfa9, 0x4d5e, [0xb4, 0x56, 0xd7, 0xb3, 0x98, 0x51, 0xd8, 0xa9]);
enum FOLDERID_CameraRollLibrary = GUID(0x2b20df75, 0x1eda, 0x4039, [0x80, 0x97, 0x38, 0x79, 0x82, 0x27, 0xd5, 0xb7]);
enum FOLDERID_SavedPictures = GUID(0x3b193882, 0xd3ad, 0x4eab, [0x96, 0x5a, 0x69, 0x82, 0x9d, 0x1f, 0xb5, 0x9f]);
enum FOLDERID_SavedPicturesLibrary = GUID(0xe25b5812, 0xbe88, 0x4bd9, [0x94, 0xb0, 0x29, 0x23, 0x34, 0x77, 0xb6, 0xc3]);
enum FOLDERID_RetailDemo = GUID(0x12d4c69e, 0x24ad, 0x4923, [0xbe, 0x19, 0x31, 0x32, 0x1c, 0x43, 0xa7, 0x67]);
enum FOLDERID_Device = GUID(0x1c2ac1dc, 0x4358, 0x4b6c, [0x97, 0x33, 0xaf, 0x21, 0x15, 0x65, 0x76, 0xf0]);
enum FOLDERID_DevelopmentFiles = GUID(0xdbe8e08e, 0x3053, 0x4bbc, [0xb1, 0x83, 0x2a, 0x7b, 0x2b, 0x19, 0x1e, 0x59]);
enum FOLDERID_Objects3D = GUID(0x31c0dd25, 0x9439, 0x4f12, [0xbf, 0x41, 0x7f, 0xf4, 0xed, 0xa3, 0x87, 0x22]);
enum FOLDERID_AppCaptures = GUID(0xedc0fe71, 0x98d8, 0x4f4a, [0xb9, 0x20, 0xc8, 0xdc, 0x13, 0x3c, 0xb1, 0x65]);
enum FOLDERID_LocalDocuments = GUID(0xf42ee2d3, 0x909f, 0x4907, [0x88, 0x71, 0x4c, 0x22, 0xfc, 0xb, 0xf7, 0x56]);
enum FOLDERID_LocalPictures = GUID(0xddd015d, 0xb06c, 0x45d5, [0x8c, 0x4c, 0xf5, 0x97, 0x13, 0x85, 0x46, 0x39]);
enum FOLDERID_LocalVideos = GUID(0x35286a68, 0x3c57, 0x41a1, [0xbb, 0xb1, 0xe, 0xae, 0x73, 0xd7, 0x6c, 0x95]);
enum FOLDERID_LocalMusic = GUID(0xa0c69a99, 0x21c8, 0x4671, [0x87, 0x3, 0x79, 0x34, 0x16, 0x2f, 0xcf, 0x1d]);
enum FOLDERID_LocalDownloads = GUID(0x7d83ee9b, 0x2244, 0x4e70, [0xb1, 0xf5, 0x53, 0x93, 0x4, 0x2a, 0xf1, 0xe4]);
enum FOLDERID_RecordedCalls = GUID(0x2f8b40c2, 0x83ed, 0x48ee, [0xb3, 0x83, 0xa1, 0xf1, 0x57, 0xec, 0x6f, 0x9a]);
enum FOLDERID_AllAppMods = GUID(0x7ad67899, 0x66af, 0x43ba, [0x91, 0x56, 0x6a, 0xad, 0x42, 0xe6, 0xc5, 0x96]);
enum FOLDERID_CurrentAppMods = GUID(0x3db40b20, 0x2a30, 0x4dbe, [0x91, 0x7e, 0x77, 0x1d, 0xd2, 0x1d, 0xd0, 0x99]);
enum FOLDERID_AppDataDesktop = GUID(0xb2c5e279, 0x7add, 0x439f, [0xb2, 0x8c, 0xc4, 0x1f, 0xe1, 0xbb, 0xf6, 0x72]);
enum FOLDERID_AppDataDocuments = GUID(0x7be16610, 0x1f7f, 0x44ac, [0xbf, 0xf0, 0x83, 0xe1, 0x5f, 0x2f, 0xfc, 0xa1]);
enum FOLDERID_AppDataFavorites = GUID(0x7cfbefbc, 0xde1f, 0x45aa, [0xb8, 0x43, 0xa5, 0x42, 0xac, 0x53, 0x6c, 0xc9]);
enum FOLDERID_AppDataProgramData = GUID(0x559d40a3, 0xa036, 0x40fa, [0xaf, 0x61, 0x84, 0xcb, 0x43, 0xa, 0x4d, 0x34]);
enum FOLDERID_LocalStorage = GUID(0xb3eb08d3, 0xa1f3, 0x496b, [0x86, 0x5a, 0x42, 0xb5, 0x36, 0xcd, 0xa0, 0xec]);
enum CLSID_InternetShortcut = GUID(0xfbf23b40, 0xe3f0, 0x101b, [0x84, 0x88, 0x0, 0xaa, 0x0, 0x3e, 0x56, 0xf8]);
enum CLSID_NetworkDomain = GUID(0x46e06680, 0x4bf0, 0x11d1, [0x83, 0xee, 0x0, 0xa0, 0xc9, 0xd, 0xc8, 0x49]);
enum CLSID_NetworkServer = GUID(0xc0542a90, 0x4bf0, 0x11d1, [0x83, 0xee, 0x0, 0xa0, 0xc9, 0xd, 0xc8, 0x49]);
enum CLSID_NetworkShare = GUID(0x54a754c0, 0x4bf0, 0x11d1, [0x83, 0xee, 0x0, 0xa0, 0xc9, 0xd, 0xc8, 0x49]);
enum CLSID_MyComputer = GUID(0x20d04fe0, 0x3aea, 0x1069, [0xa2, 0xd8, 0x8, 0x0, 0x2b, 0x30, 0x30, 0x9d]);
enum CLSID_Internet = GUID(0x871c5380, 0x42a0, 0x1069, [0xa2, 0xea, 0x8, 0x0, 0x2b, 0x30, 0x30, 0x9d]);
enum CLSID_RecycleBin = GUID(0x645ff040, 0x5081, 0x101b, [0x9f, 0x8, 0x0, 0xaa, 0x0, 0x2f, 0x95, 0x4e]);
enum CLSID_ControlPanel = GUID(0x21ec2020, 0x3aea, 0x1069, [0xa2, 0xdd, 0x8, 0x0, 0x2b, 0x30, 0x30, 0x9d]);
enum CLSID_Printers = GUID(0x2227a280, 0x3aea, 0x1069, [0xa2, 0xde, 0x8, 0x0, 0x2b, 0x30, 0x30, 0x9d]);
enum CLSID_MyDocuments = GUID(0x450d8fba, 0xad25, 0x11d0, [0x98, 0xa8, 0x8, 0x0, 0x36, 0x1b, 0x11, 0x3]);
enum STR_MYDOCS_CLSID = "{450D8FBA-AD25-11D0-98A8-0800361B1103}";
enum CATID_BrowsableShellExt = GUID(0x21490, 0x0, 0x0, [0xc0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x46]);
enum CATID_BrowseInPlace = GUID(0x21491, 0x0, 0x0, [0xc0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x46]);
enum CATID_DeskBand = GUID(0x21492, 0x0, 0x0, [0xc0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x46]);
enum CATID_InfoBand = GUID(0x21493, 0x0, 0x0, [0xc0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x46]);
enum CATID_CommBand = GUID(0x21494, 0x0, 0x0, [0xc0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x46]);
enum FMTID_Intshcut = GUID(0x214a0, 0x0, 0x0, [0xc0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x46]);
enum FMTID_InternetSite = GUID(0x214a1, 0x0, 0x0, [0xc0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x46]);
enum CGID_Explorer = GUID(0x214d0, 0x0, 0x0, [0xc0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x46]);
enum CGID_ShellDocView = GUID(0x214d1, 0x0, 0x0, [0xc0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x46]);
enum CGID_ShellServiceObject = GUID(0x214d2, 0x0, 0x0, [0xc0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x46]);
enum CGID_ExplorerBarDoc = GUID(0x214d3, 0x0, 0x0, [0xc0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x46]);
enum CLSID_FolderShortcut = GUID(0xafaced1, 0xe828, 0x11d1, [0x91, 0x87, 0xb5, 0x32, 0xf1, 0xe9, 0x57, 0x5d]);
enum CLSID_CFSIconOverlayManager = GUID(0x63b51f81, 0xc868, 0x11d0, [0x99, 0x9c, 0x0, 0xc0, 0x4f, 0xd6, 0x55, 0xe1]);
enum CLSID_ShellThumbnailDiskCache = GUID(0x1ebdcf80, 0xa200, 0x11d0, [0xa3, 0xa4, 0x0, 0xc0, 0x4f, 0xd7, 0x6, 0xec]);
enum SID_DefView = GUID(0x6d12fe80, 0x7911, 0x11cf, [0x95, 0x34, 0x0, 0x0, 0xc0, 0x5b, 0xae, 0xb]);
enum CGID_DefView = GUID(0x4af07f10, 0xd231, 0x11d0, [0xb9, 0x42, 0x0, 0xa0, 0xc9, 0x3, 0x12, 0xe1]);
enum CLSID_MenuBand = GUID(0x5b4dae26, 0xb807, 0x11d0, [0x98, 0x15, 0x0, 0xc0, 0x4f, 0xd9, 0x19, 0x72]);
enum VID_LargeIcons = GUID(0x57d0e0, 0x3573, 0x11cf, [0xae, 0x69, 0x8, 0x0, 0x2b, 0x2e, 0x12, 0x62]);
enum VID_SmallIcons = GUID(0x89000c0, 0x3573, 0x11cf, [0xae, 0x69, 0x8, 0x0, 0x2b, 0x2e, 0x12, 0x62]);
enum VID_List = GUID(0xe1fa5e0, 0x3573, 0x11cf, [0xae, 0x69, 0x8, 0x0, 0x2b, 0x2e, 0x12, 0x62]);
enum VID_Details = GUID(0x137e7700, 0x3573, 0x11cf, [0xae, 0x69, 0x8, 0x0, 0x2b, 0x2e, 0x12, 0x62]);
enum VID_Tile = GUID(0x65f125e5, 0x7be1, 0x4810, [0xba, 0x9d, 0xd2, 0x71, 0xc8, 0x43, 0x2c, 0xe3]);
enum VID_Content = GUID(0x30c2c434, 0x889, 0x4c8d, [0x98, 0x5d, 0xa9, 0xf7, 0x18, 0x30, 0xb0, 0xa9]);
enum VID_Thumbnails = GUID(0x8bebb290, 0x52d0, 0x11d0, [0xb7, 0xf4, 0x0, 0xc0, 0x4f, 0xd7, 0x6, 0xec]);
enum VID_ThumbStrip = GUID(0x8eefa624, 0xd1e9, 0x445b, [0x94, 0xb7, 0x74, 0xfb, 0xce, 0x2e, 0xa1, 0x1a]);
enum SID_SInPlaceBrowser = GUID(0x1d2ae02b, 0x3655, 0x46cc, [0xb6, 0x3a, 0x28, 0x59, 0x88, 0x15, 0x3b, 0xca]);
enum SID_SSearchBoxInfo = GUID(0x142daa61, 0x516b, 0x4713, [0xb4, 0x9c, 0xfb, 0x98, 0x5e, 0xf8, 0x29, 0x98]);
enum SID_CommandsPropertyBag = GUID(0x6e043250, 0x4416, 0x485c, [0xb1, 0x43, 0xe6, 0x2a, 0x76, 0xd, 0x9f, 0xe5]);
enum CLSID_CUrlHistory = GUID(0x3c374a40, 0xbae4, 0x11cf, [0xbf, 0x7d, 0x0, 0xaa, 0x0, 0x69, 0x46, 0xee]);
enum CLSID_CURLSearchHook = GUID(0xcfbfae00, 0x17a6, 0x11d0, [0x99, 0xcb, 0x0, 0xc0, 0x4f, 0xd6, 0x44, 0x97]);
enum CLSID_AutoComplete = GUID(0xbb2763, 0x6a77, 0x11d0, [0xa5, 0x35, 0x0, 0xc0, 0x4f, 0xd7, 0xd0, 0x62]);
enum CLSID_ACLHistory = GUID(0xbb2764, 0x6a77, 0x11d0, [0xa5, 0x35, 0x0, 0xc0, 0x4f, 0xd7, 0xd0, 0x62]);
enum CLSID_ACListISF = GUID(0x3c036f1, 0xa186, 0x11d0, [0x82, 0x4a, 0x0, 0xaa, 0x0, 0x5b, 0x43, 0x83]);
enum CLSID_ACLMRU = GUID(0x6756a641, 0xde71, 0x11d0, [0x83, 0x1b, 0x0, 0xaa, 0x0, 0x5b, 0x43, 0x83]);
enum CLSID_ACLMulti = GUID(0xbb2765, 0x6a77, 0x11d0, [0xa5, 0x35, 0x0, 0xc0, 0x4f, 0xd7, 0xd0, 0x62]);
enum CLSID_ACLCustomMRU = GUID(0x6935db93, 0x21e8, 0x4ccc, [0xbe, 0xb9, 0x9f, 0xe3, 0xc7, 0x7a, 0x29, 0x7a]);
enum CLSID_ProgressDialog = GUID(0xf8383852, 0xfcd3, 0x11d1, [0xa6, 0xb9, 0x0, 0x60, 0x97, 0xdf, 0x5b, 0xd4]);
enum SID_STopLevelBrowser = GUID(0x4c96be40, 0x915c, 0x11cf, [0x99, 0xd3, 0x0, 0xaa, 0x0, 0x4a, 0xe8, 0x37]);
enum CLSID_FileTypes = GUID(0xb091e540, 0x83e3, 0x11cf, [0xa7, 0x13, 0x0, 0x20, 0xaf, 0xd7, 0x97, 0x62]);
enum CLSID_ActiveDesktop = GUID(0x75048700, 0xef1f, 0x11d0, [0x98, 0x88, 0x0, 0x60, 0x97, 0xde, 0xac, 0xf9]);
enum CLSID_QueryAssociations = GUID(0xa07034fd, 0x6caa, 0x4954, [0xac, 0x3f, 0x97, 0xa2, 0x72, 0x16, 0xf9, 0x8a]);
enum CLSID_LinkColumnProvider = GUID(0x24f14f02, 0x7b1c, 0x11d1, [0x83, 0x8f, 0x0, 0x0, 0xf8, 0x4, 0x61, 0xcf]);
enum CGID_ShortCut = GUID(0x93a68750, 0x951a, 0x11d1, [0x94, 0x6f, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0]);
enum CLSID_InternetButtons = GUID(0x1e796980, 0x9cc5, 0x11d1, [0xa8, 0x3f, 0x0, 0xc0, 0x4f, 0xc9, 0x9d, 0x61]);
enum CLSID_MSOButtons = GUID(0x178f34b8, 0xa282, 0x11d2, [0x86, 0xc5, 0x0, 0xc0, 0x4f, 0x8e, 0xea, 0x99]);
enum CLSID_ToolbarExtButtons = GUID(0x2ce4b5d8, 0xa28f, 0x11d2, [0x86, 0xc5, 0x0, 0xc0, 0x4f, 0x8e, 0xea, 0x99]);
enum CLSID_DarwinAppPublisher = GUID(0xcfccc7a0, 0xa282, 0x11d1, [0x90, 0x82, 0x0, 0x60, 0x8, 0x5, 0x93, 0x82]);
enum CLSID_DocHostUIHandler = GUID(0x7057e952, 0xbd1b, 0x11d1, [0x89, 0x19, 0x0, 0xc0, 0x4f, 0xc2, 0xc8, 0x36]);
enum FMTID_ShellDetails = GUID(0x28636aa6, 0x953d, 0x11d2, [0xb5, 0xd6, 0x0, 0xc0, 0x4f, 0xd9, 0x18, 0xd0]);
enum PID_FINDDATA = 0x00000000;
enum PID_NETRESOURCE = 0x00000001;
enum PID_DESCRIPTIONID = 0x00000002;
enum PID_WHICHFOLDER = 0x00000003;
enum PID_NETWORKLOCATION = 0x00000004;
enum PID_COMPUTERNAME = 0x00000005;
enum FMTID_Storage = GUID(0xb725f130, 0x47ef, 0x101a, [0xa5, 0xf1, 0x2, 0x60, 0x8c, 0x9e, 0xeb, 0xac]);
enum FMTID_ImageProperties = GUID(0x14b81da1, 0x135, 0x4d31, [0x96, 0xd9, 0x6c, 0xbf, 0xc9, 0x67, 0x1a, 0x99]);
enum FMTID_CustomImageProperties = GUID(0x7ecd8b0e, 0xc136, 0x4a9b, [0x94, 0x11, 0x4e, 0xbd, 0x66, 0x73, 0xcc, 0xc3]);
enum FMTID_LibraryProperties = GUID(0x5d76b67f, 0x9b3d, 0x44bb, [0xb6, 0xae, 0x25, 0xda, 0x4f, 0x63, 0x8a, 0x67]);
enum FMTID_Displaced = GUID(0x9b174b33, 0x40ff, 0x11d2, [0xa2, 0x7e, 0x0, 0xc0, 0x4f, 0xc3, 0x8, 0x71]);
enum PID_DISPLACED_FROM = 0x00000002;
enum PID_DISPLACED_DATE = 0x00000003;
enum FMTID_Briefcase = GUID(0x328d8b21, 0x7729, 0x4bfc, [0x95, 0x4c, 0x90, 0x2b, 0x32, 0x9d, 0x56, 0xb0]);
enum PID_SYNC_COPY_IN = 0x00000002;
enum FMTID_Misc = GUID(0x9b174b34, 0x40ff, 0x11d2, [0xa2, 0x7e, 0x0, 0xc0, 0x4f, 0xc3, 0x8, 0x71]);
enum PID_MISC_STATUS = 0x00000002;
enum PID_MISC_ACCESSCOUNT = 0x00000003;
enum PID_MISC_OWNER = 0x00000004;
enum PID_HTMLINFOTIPFILE = 0x00000005;
enum PID_MISC_PICS = 0x00000006;
enum FMTID_WebView = GUID(0xf2275480, 0xf782, 0x4291, [0xbd, 0x94, 0xf1, 0x36, 0x93, 0x51, 0x3a, 0xec]);
enum PID_DISPLAY_PROPERTIES = 0x00000000;
enum PID_INTROTEXT = 0x00000001;
enum FMTID_MUSIC = GUID(0x56a3372e, 0xce9c, 0x11d2, [0x9f, 0xe, 0x0, 0x60, 0x97, 0xc6, 0x86, 0xf6]);
enum PIDSI_ARTIST = 0x00000002;
enum PIDSI_SONGTITLE = 0x00000003;
enum PIDSI_ALBUM = 0x00000004;
enum PIDSI_YEAR = 0x00000005;
enum PIDSI_COMMENT = 0x00000006;
enum PIDSI_TRACK = 0x00000007;
enum PIDSI_GENRE = 0x0000000b;
enum PIDSI_LYRICS = 0x0000000c;
enum FMTID_DRM = GUID(0xaeac19e4, 0x89ae, 0x4508, [0xb9, 0xb7, 0xbb, 0x86, 0x7a, 0xbe, 0xe2, 0xed]);
enum PIDDRSI_PROTECTED = 0x00000002;
enum PIDDRSI_DESCRIPTION = 0x00000003;
enum PIDDRSI_PLAYCOUNT = 0x00000004;
enum PIDDRSI_PLAYSTARTS = 0x00000005;
enum PIDDRSI_PLAYEXPIRES = 0x00000006;
enum PIDVSI_STREAM_NAME = 0x00000002;
enum PIDVSI_FRAME_WIDTH = 0x00000003;
enum PIDVSI_FRAME_HEIGHT = 0x00000004;
enum PIDVSI_TIMELENGTH = 0x00000007;
enum PIDVSI_FRAME_COUNT = 0x00000005;
enum PIDVSI_FRAME_RATE = 0x00000006;
enum PIDVSI_DATA_RATE = 0x00000008;
enum PIDVSI_SAMPLE_SIZE = 0x00000009;
enum PIDVSI_COMPRESSION = 0x0000000a;
enum PIDVSI_STREAM_NUMBER = 0x0000000b;
enum PIDASI_FORMAT = 0x00000002;
enum PIDASI_TIMELENGTH = 0x00000003;
enum PIDASI_AVG_DATA_RATE = 0x00000004;
enum PIDASI_SAMPLE_RATE = 0x00000005;
enum PIDASI_SAMPLE_SIZE = 0x00000006;
enum PIDASI_CHANNEL_COUNT = 0x00000007;
enum PIDASI_STREAM_NUMBER = 0x00000008;
enum PIDASI_STREAM_NAME = 0x00000009;
enum PIDASI_COMPRESSION = 0x0000000a;
enum PID_CONTROLPANEL_CATEGORY = 0x00000002;
enum FMTID_Volume = GUID(0x9b174b35, 0x40ff, 0x11d2, [0xa2, 0x7e, 0x0, 0xc0, 0x4f, 0xc3, 0x8, 0x71]);
enum PID_VOLUME_FREE = 0x00000002;
enum PID_VOLUME_CAPACITY = 0x00000003;
enum PID_VOLUME_FILESYSTEM = 0x00000004;
enum PID_SHARE_CSC_STATUS = 0x00000002;
enum PID_LINK_TARGET = 0x00000002;
enum PID_LINK_TARGET_TYPE = 0x00000003;
enum FMTID_Query = GUID(0x49691c90, 0x7e17, 0x101a, [0xa9, 0x1c, 0x8, 0x0, 0x2b, 0x2e, 0xcd, 0xa9]);
enum PID_QUERY_RANK = 0x00000002;
enum CLSID_HWShellExecute = GUID(0xffb8655f, 0x81b9, 0x4fce, [0xb8, 0x9c, 0x9a, 0x6b, 0xa7, 0x6d, 0x13, 0xe7]);
enum CLSID_DragDropHelper = GUID(0x4657278a, 0x411b, 0x11d2, [0x83, 0x9a, 0x0, 0xc0, 0x4f, 0xd9, 0x18, 0xd0]);
enum CLSID_CAnchorBrowsePropertyPage = GUID(0x3050f3bb, 0x98b5, 0x11cf, [0xbb, 0x82, 0x0, 0xaa, 0x0, 0xbd, 0xce, 0xb]);
enum CLSID_CImageBrowsePropertyPage = GUID(0x3050f3b3, 0x98b5, 0x11cf, [0xbb, 0x82, 0x0, 0xaa, 0x0, 0xbd, 0xce, 0xb]);
enum CLSID_CDocBrowsePropertyPage = GUID(0x3050f3b4, 0x98b5, 0x11cf, [0xbb, 0x82, 0x0, 0xaa, 0x0, 0xbd, 0xce, 0xb]);
enum SID_STopWindow = GUID(0x49e1b500, 0x4636, 0x11d3, [0x97, 0xf7, 0x0, 0xc0, 0x4f, 0x45, 0xd0, 0xb3]);
enum SID_SGetViewFromViewDual = GUID(0x889a935d, 0x971e, 0x4b12, [0xb9, 0xc, 0x24, 0xdf, 0xc9, 0xe1, 0xe5, 0xe8]);
enum CLSID_FolderItemsMultiLevel = GUID(0x53c74826, 0xab99, 0x4d33, [0xac, 0xa4, 0x31, 0x17, 0xf5, 0x1d, 0x37, 0x88]);
enum CLSID_NewMenu = GUID(0xd969a300, 0xe7ff, 0x11d0, [0xa9, 0x3b, 0x0, 0xa0, 0xc9, 0xf, 0x27, 0x19]);
enum BHID_SFObject = GUID(0x3981e224, 0xf559, 0x11d3, [0x8e, 0x3a, 0x0, 0xc0, 0x4f, 0x68, 0x37, 0xd5]);
enum BHID_SFUIObject = GUID(0x3981e225, 0xf559, 0x11d3, [0x8e, 0x3a, 0x0, 0xc0, 0x4f, 0x68, 0x37, 0xd5]);
enum BHID_SFViewObject = GUID(0x3981e226, 0xf559, 0x11d3, [0x8e, 0x3a, 0x0, 0xc0, 0x4f, 0x68, 0x37, 0xd5]);
enum BHID_Storage = GUID(0x3981e227, 0xf559, 0x11d3, [0x8e, 0x3a, 0x0, 0xc0, 0x4f, 0x68, 0x37, 0xd5]);
enum BHID_Stream = GUID(0x1cebb3ab, 0x7c10, 0x499a, [0xa4, 0x17, 0x92, 0xca, 0x16, 0xc4, 0xcb, 0x83]);
enum BHID_RandomAccessStream = GUID(0xf16fc93b, 0x77ae, 0x4cfe, [0xbd, 0xa7, 0xa8, 0x66, 0xee, 0xa6, 0x87, 0x8d]);
enum BHID_LinkTargetItem = GUID(0x3981e228, 0xf559, 0x11d3, [0x8e, 0x3a, 0x0, 0xc0, 0x4f, 0x68, 0x37, 0xd5]);
enum BHID_StorageEnum = GUID(0x4621a4e3, 0xf0d6, 0x4773, [0x8a, 0x9c, 0x46, 0xe7, 0x7b, 0x17, 0x48, 0x40]);
enum BHID_Transfer = GUID(0xd5e346a1, 0xf753, 0x4932, [0xb4, 0x3, 0x45, 0x74, 0x80, 0xe, 0x24, 0x98]);
enum BHID_PropertyStore = GUID(0x384e1a4, 0x1523, 0x439c, [0xa4, 0xc8, 0xab, 0x91, 0x10, 0x52, 0xf5, 0x86]);
enum BHID_ThumbnailHandler = GUID(0x7b2e650a, 0x8e20, 0x4f4a, [0xb0, 0x9e, 0x65, 0x97, 0xaf, 0xc7, 0x2f, 0xb0]);
enum BHID_EnumItems = GUID(0x94f60519, 0x2850, 0x4924, [0xaa, 0x5a, 0xd1, 0x5e, 0x84, 0x86, 0x80, 0x39]);
enum BHID_DataObject = GUID(0xb8c0bd9f, 0xed24, 0x455c, [0x83, 0xe6, 0xd5, 0x39, 0xc, 0x4f, 0xe8, 0xc4]);
enum BHID_AssociationArray = GUID(0xbea9ef17, 0x82f1, 0x4f60, [0x92, 0x84, 0x4f, 0x8d, 0xb7, 0x5c, 0x3b, 0xe9]);
enum BHID_Filter = GUID(0x38d08778, 0xf557, 0x4690, [0x9e, 0xbf, 0xba, 0x54, 0x70, 0x6a, 0xd8, 0xf7]);
enum BHID_EnumAssocHandlers = GUID(0xb8ab0b9c, 0xc2ec, 0x4f7a, [0x91, 0x8d, 0x31, 0x49, 0x0, 0xe6, 0x28, 0xa]);
enum BHID_StorageItem = GUID(0x404e2109, 0x77d2, 0x4699, [0xa5, 0xa0, 0x4f, 0xdf, 0x10, 0xdb, 0x98, 0x37]);
enum BHID_FilePlaceholder = GUID(0x8677dceb, 0xaae0, 0x4005, [0x8d, 0x3d, 0x54, 0x7f, 0xa8, 0x52, 0xf8, 0x25]);
enum CATID_FilePlaceholderMergeHandler = GUID(0x3e9c9a51, 0xd4aa, 0x4870, [0xb4, 0x7c, 0x74, 0x24, 0xb4, 0x91, 0xf1, 0xcc]);
enum SID_CtxQueryAssociations = GUID(0xfaadfc40, 0xb777, 0x4b69, [0xaa, 0x81, 0x77, 0x3, 0x5e, 0xf0, 0xe6, 0xe8]);
enum CLSID_QuickLinks = GUID(0xe5cbf21, 0xd15f, 0x11d0, [0x83, 0x1, 0x0, 0xaa, 0x0, 0x5b, 0x43, 0x83]);
enum CLSID_ISFBand = GUID(0xd82be2b0, 0x5764, 0x11d0, [0xa9, 0x6e, 0x0, 0xc0, 0x4f, 0xd7, 0x5, 0xa2]);
enum CLSID_ShellFldSetExt = GUID(0x6d5313c0, 0x8c62, 0x11d1, [0xb2, 0xcd, 0x0, 0x60, 0x97, 0xdf, 0x8c, 0x11]);
enum SID_SMenuBandChild = GUID(0xed9cc020, 0x8b9, 0x11d1, [0x98, 0x23, 0x0, 0xc0, 0x4f, 0xd9, 0x19, 0x72]);
enum SID_SMenuBandParent = GUID(0x8c278eec, 0x3eab, 0x11d1, [0x8c, 0xb0, 0x0, 0xc0, 0x4f, 0xd9, 0x18, 0xd0]);
enum SID_SMenuPopup = GUID(0xd1e7afeb, 0x6a2e, 0x11d0, [0x8c, 0x78, 0x0, 0xc0, 0x4f, 0xd9, 0x18, 0xb4]);
enum SID_SMenuBandBottomSelected = GUID(0x165ebaf4, 0x6d51, 0x11d2, [0x83, 0xad, 0x0, 0xc0, 0x4f, 0xd9, 0x18, 0xd0]);
enum SID_SMenuBandBottom = GUID(0x743ca664, 0xdeb, 0x11d1, [0x98, 0x25, 0x0, 0xc0, 0x4f, 0xd9, 0x19, 0x72]);
enum SID_MenuShellFolder = GUID(0xa6c17eb4, 0x2d65, 0x11d2, [0x83, 0x8f, 0x0, 0xc0, 0x4f, 0xd9, 0x18, 0xd0]);
enum SID_SMenuBandContextMenuModifier = GUID(0x39545874, 0x7162, 0x465e, [0xb7, 0x83, 0x2a, 0xa1, 0x87, 0x4f, 0xef, 0x81]);
enum SID_SMenuBandBKContextMenu = GUID(0x164bbd86, 0x1d0d, 0x4de0, [0x9a, 0x3b, 0xd9, 0x72, 0x96, 0x47, 0xc2, 0xb8]);
enum CGID_MENUDESKBAR = GUID(0x5c9f0a12, 0x959e, 0x11d0, [0xa3, 0xa4, 0x0, 0xa0, 0xc9, 0x8, 0x26, 0x36]);
enum SID_SMenuBandTop = GUID(0x9493a810, 0xec38, 0x11d0, [0xbc, 0x46, 0x0, 0xaa, 0x0, 0x6c, 0xe2, 0xf5]);
enum CLSID_MenuToolbarBase = GUID(0x40b96610, 0xb522, 0x11d1, [0xb3, 0xb4, 0x0, 0xaa, 0x0, 0x6e, 0xfd, 0xe7]);
enum CLSID_MenuBandSite = GUID(0xe13ef4e4, 0xd2f2, 0x11d0, [0x98, 0x16, 0x0, 0xc0, 0x4f, 0xd9, 0x19, 0x72]);
enum SID_SCommDlgBrowser = GUID(0x80f30233, 0xb7df, 0x11d2, [0xa3, 0x3b, 0x0, 0x60, 0x97, 0xdf, 0x5b, 0xd4]);
enum CPFG_LOGON_USERNAME = GUID(0xda15bbe8, 0x954d, 0x4fd3, [0xb0, 0xf4, 0x1f, 0xb5, 0xb9, 0xb, 0x17, 0x4b]);
enum CPFG_LOGON_PASSWORD = GUID(0x60624cfa, 0xa477, 0x47b1, [0x8a, 0x8e, 0x3a, 0x4a, 0x19, 0x98, 0x18, 0x27]);
enum CPFG_SMARTCARD_USERNAME = GUID(0x3e1ecf69, 0x568c, 0x4d96, [0x9d, 0x59, 0x46, 0x44, 0x41, 0x74, 0xe2, 0xd6]);
enum CPFG_SMARTCARD_PIN = GUID(0x4fe5263b, 0x9181, 0x46c1, [0xb0, 0xa4, 0x9d, 0xed, 0xd4, 0xdb, 0x7d, 0xea]);
enum CPFG_CREDENTIAL_PROVIDER_LOGO = GUID(0x2d837775, 0xf6cd, 0x464e, [0xa7, 0x45, 0x48, 0x2f, 0xd0, 0xb4, 0x74, 0x93]);
enum CPFG_CREDENTIAL_PROVIDER_LABEL = GUID(0x286bbff3, 0xbad4, 0x438f, [0xb0, 0x7, 0x79, 0xb7, 0x26, 0x7c, 0x3d, 0x48]);
enum CPFG_STANDALONE_SUBMIT_BUTTON = GUID(0xb7b0ad8, 0xcc36, 0x4d59, [0x80, 0x2b, 0x82, 0xf7, 0x14, 0xfa, 0x70, 0x22]);
enum CPFG_STYLE_LINK_AS_BUTTON = GUID(0x88fa508, 0x94a6, 0x4430, [0xa4, 0xcb, 0x6f, 0xc6, 0xe3, 0xc0, 0xb9, 0xe2]);
enum FOLDERTYPEID_Invalid = GUID(0x57807898, 0x8c4f, 0x4462, [0xbb, 0x63, 0x71, 0x4, 0x23, 0x80, 0xb1, 0x9]);
enum FOLDERTYPEID_Generic = GUID(0x5c4f28b5, 0xf869, 0x4e84, [0x8e, 0x60, 0xf1, 0x1d, 0xb9, 0x7c, 0x5c, 0xc7]);
enum FOLDERTYPEID_GenericSearchResults = GUID(0x7fde1a1e, 0x8b31, 0x49a5, [0x93, 0xb8, 0x6b, 0xe1, 0x4c, 0xfa, 0x49, 0x43]);
enum FOLDERTYPEID_GenericLibrary = GUID(0x5f4eab9a, 0x6833, 0x4f61, [0x89, 0x9d, 0x31, 0xcf, 0x46, 0x97, 0x9d, 0x49]);
enum FOLDERTYPEID_Documents = GUID(0x7d49d726, 0x3c21, 0x4f05, [0x99, 0xaa, 0xfd, 0xc2, 0xc9, 0x47, 0x46, 0x56]);
enum FOLDERTYPEID_Pictures = GUID(0xb3690e58, 0xe961, 0x423b, [0xb6, 0x87, 0x38, 0x6e, 0xbf, 0xd8, 0x32, 0x39]);
enum FOLDERTYPEID_Music = GUID(0x94d6ddcc, 0x4a68, 0x4175, [0xa3, 0x74, 0xbd, 0x58, 0x4a, 0x51, 0xb, 0x78]);
enum FOLDERTYPEID_Videos = GUID(0x5fa96407, 0x7e77, 0x483c, [0xac, 0x93, 0x69, 0x1d, 0x5, 0x85, 0xd, 0xe8]);
enum FOLDERTYPEID_Downloads = GUID(0x885a186e, 0xa440, 0x4ada, [0x81, 0x2b, 0xdb, 0x87, 0x1b, 0x94, 0x22, 0x59]);
enum FOLDERTYPEID_UserFiles = GUID(0xcd0fc69b, 0x71e2, 0x46e5, [0x96, 0x90, 0x5b, 0xcd, 0x9f, 0x57, 0xaa, 0xb3]);
enum FOLDERTYPEID_UsersLibraries = GUID(0xc4d98f09, 0x6124, 0x4fe0, [0x99, 0x42, 0x82, 0x64, 0x16, 0x8, 0x2d, 0xa9]);
enum FOLDERTYPEID_OtherUsers = GUID(0xb337fd00, 0x9dd5, 0x4635, [0xa6, 0xd4, 0xda, 0x33, 0xfd, 0x10, 0x2b, 0x7a]);
enum FOLDERTYPEID_PublishedItems = GUID(0x7f2f5b96, 0xff74, 0x41da, [0xaf, 0xd8, 0x1c, 0x78, 0xa5, 0xf3, 0xae, 0xa2]);
enum FOLDERTYPEID_Communications = GUID(0x91475fe5, 0x586b, 0x4eba, [0x8d, 0x75, 0xd1, 0x74, 0x34, 0xb8, 0xcd, 0xf6]);
enum FOLDERTYPEID_Contacts = GUID(0xde2b70ec, 0x9bf7, 0x4a93, [0xbd, 0x3d, 0x24, 0x3f, 0x78, 0x81, 0xd4, 0x92]);
enum FOLDERTYPEID_StartMenu = GUID(0xef87b4cb, 0xf2ce, 0x4785, [0x86, 0x58, 0x4c, 0xa6, 0xc6, 0x3e, 0x38, 0xc6]);
enum FOLDERTYPEID_RecordedTV = GUID(0x5557a28f, 0x5da6, 0x4f83, [0x88, 0x9, 0xc2, 0xc9, 0x8a, 0x11, 0xa6, 0xfa]);
enum FOLDERTYPEID_SavedGames = GUID(0xd0363307, 0x28cb, 0x4106, [0x9f, 0x23, 0x29, 0x56, 0xe3, 0xe5, 0xe0, 0xe7]);
enum FOLDERTYPEID_OpenSearch = GUID(0x8faf9629, 0x1980, 0x46ff, [0x80, 0x23, 0x9d, 0xce, 0xab, 0x9c, 0x3e, 0xe3]);
enum FOLDERTYPEID_SearchConnector = GUID(0x982725ee, 0x6f47, 0x479e, [0xb4, 0x47, 0x81, 0x2b, 0xfa, 0x7d, 0x2e, 0x8f]);
enum FOLDERTYPEID_AccountPictures = GUID(0xdb2a5d8f, 0x6e6, 0x4007, [0xab, 0xa6, 0xaf, 0x87, 0x7d, 0x52, 0x6e, 0xa6]);
enum FOLDERTYPEID_Games = GUID(0xb689b0d0, 0x76d3, 0x4cbb, [0x87, 0xf7, 0x58, 0x5d, 0xe, 0xc, 0xe0, 0x70]);
enum FOLDERTYPEID_ControlPanelCategory = GUID(0xde4f0660, 0xfa10, 0x4b8f, [0xa4, 0x94, 0x6, 0x8b, 0x20, 0xb2, 0x23, 0x7]);
enum FOLDERTYPEID_ControlPanelClassic = GUID(0xc3794f3, 0xb545, 0x43aa, [0xa3, 0x29, 0xc3, 0x74, 0x30, 0xc5, 0x8d, 0x2a]);
enum FOLDERTYPEID_Printers = GUID(0x2c7bbec6, 0xc844, 0x4a0a, [0x91, 0xfa, 0xce, 0xf6, 0xf5, 0x9c, 0xfd, 0xa1]);
enum FOLDERTYPEID_RecycleBin = GUID(0xd6d9e004, 0xcd87, 0x442b, [0x9d, 0x57, 0x5e, 0xa, 0xeb, 0x4f, 0x6f, 0x72]);
enum FOLDERTYPEID_SoftwareExplorer = GUID(0xd674391b, 0x52d9, 0x4e07, [0x83, 0x4e, 0x67, 0xc9, 0x86, 0x10, 0xf3, 0x9d]);
enum FOLDERTYPEID_CompressedFolder = GUID(0x80213e82, 0xbcfd, 0x4c4f, [0x88, 0x17, 0xbb, 0x27, 0x60, 0x12, 0x67, 0xa9]);
enum FOLDERTYPEID_NetworkExplorer = GUID(0x25cc242b, 0x9a7c, 0x4f51, [0x80, 0xe0, 0x7a, 0x29, 0x28, 0xfe, 0xbe, 0x42]);
enum FOLDERTYPEID_Searches = GUID(0xb0ba2e3, 0x405f, 0x415e, [0xa6, 0xee, 0xca, 0xd6, 0x25, 0x20, 0x78, 0x53]);
enum FOLDERTYPEID_SearchHome = GUID(0x834d8a44, 0x974, 0x4ed6, [0x86, 0x6e, 0xf2, 0x3, 0xd8, 0xb, 0x38, 0x10]);
enum FOLDERTYPEID_StorageProviderGeneric = GUID(0x4f01ebc5, 0x2385, 0x41f2, [0xa2, 0x8e, 0x2c, 0x5c, 0x91, 0xfb, 0x56, 0xe0]);
enum FOLDERTYPEID_StorageProviderDocuments = GUID(0xdd61bd66, 0x70e8, 0x48dd, [0x96, 0x55, 0x65, 0xc5, 0xe1, 0xaa, 0xc2, 0xd1]);
enum FOLDERTYPEID_StorageProviderPictures = GUID(0x71d642a9, 0xf2b1, 0x42cd, [0xad, 0x92, 0xeb, 0x93, 0x0, 0xc7, 0xcc, 0xa]);
enum FOLDERTYPEID_StorageProviderMusic = GUID(0x672ecd7e, 0xaf04, 0x4399, [0x87, 0x5c, 0x2, 0x90, 0x84, 0x5b, 0x62, 0x47]);
enum FOLDERTYPEID_StorageProviderVideos = GUID(0x51294da1, 0xd7b1, 0x485b, [0x9e, 0x9a, 0x17, 0xcf, 0xfe, 0x33, 0xe1, 0x87]);
enum SYNCMGR_OBJECTID_Icon = GUID(0x6dbc85c3, 0x5d07, 0x4c72, [0xa7, 0x77, 0x7f, 0xec, 0x78, 0x7, 0x2c, 0x6]);
enum SYNCMGR_OBJECTID_EventStore = GUID(0x4bef34b9, 0xa786, 0x4075, [0xba, 0x88, 0xc, 0x2b, 0x9d, 0x89, 0xa9, 0x8f]);
enum SYNCMGR_OBJECTID_ConflictStore = GUID(0xd78181f4, 0x2389, 0x47e4, [0xa9, 0x60, 0x60, 0xbc, 0xc2, 0xed, 0x93, 0xb]);
enum SYNCMGR_OBJECTID_BrowseContent = GUID(0x57cbb584, 0xe9b4, 0x47ae, [0xa1, 0x20, 0xc4, 0xdf, 0x33, 0x35, 0xde, 0xe2]);
enum SYNCMGR_OBJECTID_ShowSchedule = GUID(0xedc6f3e3, 0x8441, 0x4109, [0xad, 0xf3, 0x6c, 0x1c, 0xa0, 0xb7, 0xde, 0x47]);
enum SYNCMGR_OBJECTID_QueryBeforeActivate = GUID(0xd882d80b, 0xe7aa, 0x49ed, [0x86, 0xb7, 0xe6, 0xe1, 0xf7, 0x14, 0xcd, 0xfe]);
enum SYNCMGR_OBJECTID_QueryBeforeDeactivate = GUID(0xa0efc282, 0x60e0, 0x460e, [0x93, 0x74, 0xea, 0x88, 0x51, 0x3c, 0xfc, 0x80]);
enum SYNCMGR_OBJECTID_QueryBeforeEnable = GUID(0x4cbf7f0, 0x5beb, 0x4de1, [0xbc, 0x90, 0x90, 0x83, 0x45, 0xc4, 0x80, 0xf6]);
enum SYNCMGR_OBJECTID_QueryBeforeDisable = GUID(0xbb5f64aa, 0xf004, 0x4eb5, [0x8e, 0x4d, 0x26, 0x75, 0x19, 0x66, 0x34, 0x4c]);
enum SYNCMGR_OBJECTID_QueryBeforeDelete = GUID(0xf76c3397, 0xafb3, 0x45d7, [0xa5, 0x9f, 0x5a, 0x49, 0xe9, 0x5, 0x43, 0x7e]);
enum SYNCMGR_OBJECTID_EventLinkClick = GUID(0x2203bdc1, 0x1af1, 0x4082, [0x8c, 0x30, 0x28, 0x39, 0x9f, 0x41, 0x38, 0x4c]);
enum EP_NavPane = GUID(0xcb316b22, 0x25f7, 0x42b8, [0x8a, 0x9, 0x54, 0xd, 0x23, 0xa4, 0x3c, 0x2f]);
enum EP_Commands = GUID(0xd9745868, 0xca5f, 0x4a76, [0x91, 0xcd, 0xf5, 0xa1, 0x29, 0xfb, 0xb0, 0x76]);
enum EP_Commands_Organize = GUID(0x72e81700, 0xe3ec, 0x4660, [0xbf, 0x24, 0x3c, 0x3b, 0x7b, 0x64, 0x88, 0x6]);
enum EP_Commands_View = GUID(0x21f7c32d, 0xeeaa, 0x439b, [0xbb, 0x51, 0x37, 0xb9, 0x6f, 0xd6, 0xa9, 0x43]);
enum EP_DetailsPane = GUID(0x43abf98b, 0x89b8, 0x472d, [0xb9, 0xce, 0xe6, 0x9b, 0x82, 0x29, 0xf0, 0x19]);
enum EP_PreviewPane = GUID(0x893c63d1, 0x45c8, 0x4d17, [0xbe, 0x19, 0x22, 0x3b, 0xe7, 0x1b, 0xe3, 0x65]);
enum EP_QueryPane = GUID(0x65bcde4f, 0x4f07, 0x4f27, [0x83, 0xa7, 0x1a, 0xfc, 0xa4, 0xdf, 0x7d, 0xdd]);
enum EP_AdvQueryPane = GUID(0xb4e9db8b, 0x34ba, 0x4c39, [0xb5, 0xcc, 0x16, 0xa1, 0xbd, 0x2c, 0x41, 0x1c]);
enum EP_StatusBar = GUID(0x65fe56ce, 0x5cfe, 0x4bc4, [0xad, 0x8a, 0x7a, 0xe3, 0xfe, 0x7e, 0x8f, 0x7c]);
enum EP_Ribbon = GUID(0xd27524a8, 0xc9f2, 0x4834, [0xa1, 0x6, 0xdf, 0x88, 0x89, 0xfd, 0x4f, 0x37]);
enum CATID_LocationFactory = GUID(0x965c4d51, 0x8b76, 0x4e57, [0x80, 0xb7, 0x56, 0x4d, 0x2e, 0xa4, 0xb5, 0x5e]);
enum CATID_LocationProvider = GUID(0x1b3ca474, 0x2614, 0x414b, [0xb8, 0x13, 0x1a, 0xce, 0xca, 0x3e, 0x3d, 0xd8]);
enum ItemCount_Property_GUID = GUID(0xabbf5c45, 0x5ccc, 0x47b7, [0xbb, 0x4e, 0x87, 0xcb, 0x87, 0xbb, 0xd1, 0x62]);
enum SelectedItemCount_Property_GUID = GUID(0x8fe316d2, 0xe52, 0x460a, [0x9c, 0x1e, 0x48, 0xf2, 0x73, 0xd4, 0x70, 0xa3]);
enum ItemIndex_Property_GUID = GUID(0x92a053da, 0x2969, 0x4021, [0xbf, 0x27, 0x51, 0x4c, 0xfc, 0x2e, 0x4a, 0x69]);
enum CATID_SearchableApplication = GUID(0x366c292a, 0xd9b3, 0x4dbf, [0xbb, 0x70, 0xe6, 0x2e, 0xc3, 0xd0, 0xbb, 0xbf]);
enum IDD_WIZEXTN_FIRST = 0x00005000;
enum IDD_WIZEXTN_LAST = 0x00005100;
enum SHPWHF_NORECOMPRESS = 0x00000001;
enum SHPWHF_NONETPLACECREATE = 0x00000002;
enum SHPWHF_NOFILESELECTOR = 0x00000004;
enum SHPWHF_USEMRU = 0x00000008;
enum SHPWHF_ANYLOCATION = 0x00000100;
enum SHPWHF_VALIDATEVIAWEBFOLDERS = 0x00010000;
enum ACDD_VISIBLE = 0x00000001;
enum PROPSTR_EXTENSIONCOMPLETIONSTATE = "ExtensionCompletionState";
enum SID_SCommandBarState = GUID(0xb99eaa5c, 0x3850, 0x4400, [0xbc, 0x33, 0x2c, 0xe5, 0x34, 0x4, 0x8b, 0xf8]);
enum NSTCDHPOS_ONTOP = 0xffffffffffffffff;
enum FVSIF_RECT = 0x00000001;
enum FVSIF_PINNED = 0x00000002;
enum FVSIF_NEWFAILED = 0x08000000;
enum FVSIF_NEWFILE = 0x80000000;
enum FVSIF_CANVIEWIT = 0x40000000;
enum FCIDM_TOOLBAR = 0x0000a000;
enum FCIDM_STATUS = 0x0000a001;
enum IDC_OFFLINE_HAND = 0x00000067;
enum IDC_PANTOOL_HAND_OPEN = 0x00000068;
enum IDC_PANTOOL_HAND_CLOSED = 0x00000069;
enum PANE_NONE = 0xffffffff;
enum PANE_ZONE = 0x00000001;
enum PANE_OFFLINE = 0x00000002;
enum PANE_PRINTER = 0x00000003;
enum PANE_SSL = 0x00000004;
enum PANE_NAVIGATION = 0x00000005;
enum PANE_PROGRESS = 0x00000006;
enum PANE_PRIVACY = 0x00000007;
enum DWFRF_NORMAL = 0x00000000;
enum DWFRF_DELETECONFIGDATA = 0x00000001;
enum DWFAF_HIDDEN = 0x00000001;
enum DWFAF_GROUP1 = 0x00000002;
enum DWFAF_GROUP2 = 0x00000004;
enum DWFAF_AUTOHIDE = 0x00000010;
enum SHIMSTCAPFLAG_LOCKABLE = 0x00000001;
enum SHIMSTCAPFLAG_PURGEABLE = 0x00000002;
enum ISFB_MASK_STATE = 0x00000001;
enum ISFB_MASK_BKCOLOR = 0x00000002;
enum ISFB_MASK_VIEWMODE = 0x00000004;
enum ISFB_MASK_SHELLFOLDER = 0x00000008;
enum ISFB_MASK_IDLIST = 0x00000010;
enum ISFB_MASK_COLORS = 0x00000020;
enum ISFB_STATE_DEFAULT = 0x00000000;
enum ISFB_STATE_DEBOSSED = 0x00000001;
enum ISFB_STATE_ALLOWRENAME = 0x00000002;
enum ISFB_STATE_NOSHOWTEXT = 0x00000004;
enum ISFB_STATE_CHANNELBAR = 0x00000010;
enum ISFB_STATE_QLINKSMODE = 0x00000020;
enum ISFB_STATE_FULLOPEN = 0x00000040;
enum ISFB_STATE_NONAMESORT = 0x00000080;
enum ISFB_STATE_BTNMINSIZE = 0x00000100;
enum ISFBVIEWMODE_SMALLICONS = 0x00000001;
enum ISFBVIEWMODE_LARGEICONS = 0x00000002;
enum ISFBVIEWMODE_LOGOS = 0x00000003;
enum DBC_GS_IDEAL = 0x00000000;
enum DBC_GS_SIZEDOWN = 0x00000001;
enum DBC_HIDE = 0x00000000;
enum DBC_SHOW = 0x00000001;
enum DBC_SHOWOBSCURE = 0x00000002;
enum SSM_CLEAR = 0x00000000;
enum SSM_SET = 0x00000001;
enum SSM_REFRESH = 0x00000002;
enum SSM_UPDATE = 0x00000004;
enum SCHEME_DISPLAY = 0x00000001;
enum SCHEME_EDIT = 0x00000002;
enum SCHEME_LOCAL = 0x00000004;
enum SCHEME_GLOBAL = 0x00000008;
enum SCHEME_REFRESH = 0x00000010;
enum SCHEME_UPDATE = 0x00000020;
enum SCHEME_DONOTUSE = 0x00000040;
enum SCHEME_CREATE = 0x00000080;
enum GADOF_DIRTY = 0x00000001;
enum SHCDF_UPDATEITEM = 0x00000001;
enum PPCF_ADDQUOTES = 0x00000001;
enum PPCF_ADDARGUMENTS = 0x00000003;
enum PPCF_NODIRECTORIES = 0x00000010;
enum PPCF_FORCEQUALIFY = 0x00000040;
enum PPCF_LONGESTPOSSIBLE = 0x00000080;
enum OPENPROPS_NONE = 0x00000000;
enum OPENPROPS_INHIBITPIF = 0x00008000;
enum GETPROPS_NONE = 0x00000000;
enum SETPROPS_NONE = 0x00000000;
enum CLOSEPROPS_NONE = 0x00000000;
enum CLOSEPROPS_DISCARD = 0x00000001;
enum TBIF_APPEND = 0x00000000;
enum TBIF_PREPEND = 0x00000001;
enum TBIF_REPLACE = 0x00000002;
enum TBIF_DEFAULT = 0x00000000;
enum TBIF_INTERNETBAR = 0x00010000;
enum TBIF_STANDARDTOOLBAR = 0x00020000;
enum TBIF_NOTOOLBAR = 0x00030000;
enum SFVM_REARRANGE = 0x00000001;
enum SFVM_ADDOBJECT = 0x00000003;
enum SFVM_REMOVEOBJECT = 0x00000006;
enum SFVM_UPDATEOBJECT = 0x00000007;
enum SFVM_GETSELECTEDOBJECTS = 0x00000009;
enum SFVM_SETITEMPOS = 0x0000000e;
enum SFVM_SETCLIPBOARD = 0x00000010;
enum SFVM_SETPOINTS = 0x00000017;
enum GIL_OPENICON = 0x00000001;
enum GIL_FORSHELL = 0x00000002;
enum GIL_ASYNC = 0x00000020;
enum GIL_DEFAULTICON = 0x00000040;
enum GIL_FORSHORTCUT = 0x00000080;
enum GIL_CHECKSHIELD = 0x00000200;
enum GIL_SIMULATEDOC = 0x00000001;
enum GIL_PERINSTANCE = 0x00000002;
enum GIL_PERCLASS = 0x00000004;
enum GIL_NOTFILENAME = 0x00000008;
enum GIL_DONTCACHE = 0x00000010;
enum GIL_SHIELD = 0x00000200;
enum GIL_FORCENOSHIELD = 0x00000400;
enum SIOM_OVERLAYINDEX = 0x00000001;
enum SIOM_ICONINDEX = 0x00000002;
enum SIOM_RESERVED_SHARED = 0x00000000;
enum SIOM_RESERVED_LINK = 0x00000001;
enum SIOM_RESERVED_SLOWFILE = 0x00000002;
enum SIOM_RESERVED_DEFAULT = 0x00000003;
enum OI_DEFAULT = 0x00000000;
enum OI_ASYNC = 0xffffeeee;
enum IDO_SHGIOI_SHARE = 0x0fffffff;
enum IDO_SHGIOI_LINK = 0x0ffffffe;
enum IDO_SHGIOI_SLOWFILE = 0x00000000fffffffd;
enum IDO_SHGIOI_DEFAULT = 0x00000000fffffffc;
enum NT_CONSOLE_PROPS_SIG = 0xa0000002;
enum NT_FE_CONSOLE_PROPS_SIG = 0xa0000004;
enum EXP_DARWIN_ID_SIG = 0xa0000006;
enum EXP_SPECIAL_FOLDER_SIG = 0xa0000005;
enum EXP_SZ_LINK_SIG = 0xa0000001;
enum EXP_SZ_ICON_SIG = 0xa0000007;
enum EXP_PROPERTYSTORAGE_SIG = 0xa0000009;
enum FCIDM_SHVIEWFIRST = 0x00000000;
enum FCIDM_SHVIEWLAST = 0x00007fff;
enum FCIDM_BROWSERFIRST = 0x0000a000;
enum FCIDM_BROWSERLAST = 0x0000bf00;
enum FCIDM_GLOBALFIRST = 0x00008000;
enum FCIDM_GLOBALLAST = 0x00009fff;
enum FCIDM_MENU_FILE = 0x00008000;
enum FCIDM_MENU_EDIT = 0x00008040;
enum FCIDM_MENU_VIEW = 0x00008080;
enum FCIDM_MENU_VIEW_SEP_OPTIONS = 0x00008081;
enum FCIDM_MENU_TOOLS = 0x000080c0;
enum FCIDM_MENU_TOOLS_SEP_GOTO = 0x000080c1;
enum FCIDM_MENU_HELP = 0x00008100;
enum FCIDM_MENU_FIND = 0x00008140;
enum FCIDM_MENU_EXPLORE = 0x00008150;
enum FCIDM_MENU_FAVORITES = 0x00008170;
enum OFASI_EDIT = 0x00000001;
enum OFASI_OPENDESKTOP = 0x00000002;
enum CSIDL_DESKTOP = 0x00000000;
enum CSIDL_INTERNET = 0x00000001;
enum CSIDL_PROGRAMS = 0x00000002;
enum CSIDL_CONTROLS = 0x00000003;
enum CSIDL_PRINTERS = 0x00000004;
enum CSIDL_PERSONAL = 0x00000005;
enum CSIDL_FAVORITES = 0x00000006;
enum CSIDL_STARTUP = 0x00000007;
enum CSIDL_RECENT = 0x00000008;
enum CSIDL_SENDTO = 0x00000009;
enum CSIDL_BITBUCKET = 0x0000000a;
enum CSIDL_STARTMENU = 0x0000000b;
enum CSIDL_MYDOCUMENTS = 0x00000005;
enum CSIDL_MYMUSIC = 0x0000000d;
enum CSIDL_MYVIDEO = 0x0000000e;
enum CSIDL_DESKTOPDIRECTORY = 0x00000010;
enum CSIDL_DRIVES = 0x00000011;
enum CSIDL_NETWORK = 0x00000012;
enum CSIDL_NETHOOD = 0x00000013;
enum CSIDL_FONTS = 0x00000014;
enum CSIDL_TEMPLATES = 0x00000015;
enum CSIDL_COMMON_STARTMENU = 0x00000016;
enum CSIDL_COMMON_PROGRAMS = 0x00000017;
enum CSIDL_COMMON_STARTUP = 0x00000018;
enum CSIDL_COMMON_DESKTOPDIRECTORY = 0x00000019;
enum CSIDL_APPDATA = 0x0000001a;
enum CSIDL_PRINTHOOD = 0x0000001b;
enum CSIDL_LOCAL_APPDATA = 0x0000001c;
enum CSIDL_ALTSTARTUP = 0x0000001d;
enum CSIDL_COMMON_ALTSTARTUP = 0x0000001e;
enum CSIDL_COMMON_FAVORITES = 0x0000001f;
enum CSIDL_INTERNET_CACHE = 0x00000020;
enum CSIDL_COOKIES = 0x00000021;
enum CSIDL_HISTORY = 0x00000022;
enum CSIDL_COMMON_APPDATA = 0x00000023;
enum CSIDL_WINDOWS = 0x00000024;
enum CSIDL_SYSTEM = 0x00000025;
enum CSIDL_PROGRAM_FILES = 0x00000026;
enum CSIDL_MYPICTURES = 0x00000027;
enum CSIDL_PROFILE = 0x00000028;
enum CSIDL_SYSTEMX86 = 0x00000029;
enum CSIDL_PROGRAM_FILESX86 = 0x0000002a;
enum CSIDL_PROGRAM_FILES_COMMON = 0x0000002b;
enum CSIDL_PROGRAM_FILES_COMMONX86 = 0x0000002c;
enum CSIDL_COMMON_TEMPLATES = 0x0000002d;
enum CSIDL_COMMON_DOCUMENTS = 0x0000002e;
enum CSIDL_COMMON_ADMINTOOLS = 0x0000002f;
enum CSIDL_ADMINTOOLS = 0x00000030;
enum CSIDL_CONNECTIONS = 0x00000031;
enum CSIDL_COMMON_MUSIC = 0x00000035;
enum CSIDL_COMMON_PICTURES = 0x00000036;
enum CSIDL_COMMON_VIDEO = 0x00000037;
enum CSIDL_RESOURCES = 0x00000038;
enum CSIDL_RESOURCES_LOCALIZED = 0x00000039;
enum CSIDL_COMMON_OEM_LINKS = 0x0000003a;
enum CSIDL_CDBURN_AREA = 0x0000003b;
enum CSIDL_COMPUTERSNEARME = 0x0000003d;
enum CSIDL_FLAG_CREATE = 0x00008000;
enum CSIDL_FLAG_DONT_VERIFY = 0x00004000;
enum CSIDL_FLAG_DONT_UNEXPAND = 0x00002000;
enum CSIDL_FLAG_NO_ALIAS = 0x00001000;
enum CSIDL_FLAG_PER_USER_INIT = 0x00000800;
enum CSIDL_FLAG_MASK = 0x0000ff00;
enum FCS_READ = 0x00000001;
enum FCS_FORCEWRITE = 0x00000002;
enum FCS_FLAG_DRAGDROP = 0x00000002;
enum FCSM_VIEWID = 0x00000001;
enum FCSM_WEBVIEWTEMPLATE = 0x00000002;
enum FCSM_INFOTIP = 0x00000004;
enum FCSM_CLSID = 0x00000008;
enum FCSM_ICONFILE = 0x00000010;
enum FCSM_LOGO = 0x00000020;
enum FCSM_FLAGS = 0x00000040;
enum BIF_RETURNONLYFSDIRS = 0x00000001;
enum BIF_DONTGOBELOWDOMAIN = 0x00000002;
enum BIF_STATUSTEXT = 0x00000004;
enum BIF_RETURNFSANCESTORS = 0x00000008;
enum BIF_EDITBOX = 0x00000010;
enum BIF_VALIDATE = 0x00000020;
enum BIF_NEWDIALOGSTYLE = 0x00000040;
enum BIF_BROWSEINCLUDEURLS = 0x00000080;
enum BIF_UAHINT = 0x00000100;
enum BIF_NONEWFOLDERBUTTON = 0x00000200;
enum BIF_NOTRANSLATETARGETS = 0x00000400;
enum BIF_BROWSEFORCOMPUTER = 0x00001000;
enum BIF_BROWSEFORPRINTER = 0x00002000;
enum BIF_BROWSEINCLUDEFILES = 0x00004000;
enum BIF_SHAREABLE = 0x00008000;
enum BIF_BROWSEFILEJUNCTIONS = 0x00010000;
enum BFFM_INITIALIZED = 0x00000001;
enum BFFM_SELCHANGED = 0x00000002;
enum BFFM_VALIDATEFAILEDA = 0x00000003;
enum BFFM_VALIDATEFAILEDW = 0x00000004;
enum BFFM_IUNKNOWN = 0x00000005;
enum BFFM_SETSTATUSTEXTA = 0x00000464;
enum BFFM_ENABLEOK = 0x00000465;
enum BFFM_SETSELECTIONA = 0x00000466;
enum BFFM_SETSELECTIONW = 0x00000467;
enum BFFM_SETSTATUSTEXTW = 0x00000468;
enum BFFM_SETOKTEXT = 0x00000469;
enum BFFM_SETEXPANDED = 0x0000046a;
enum BFFM_SETSTATUSTEXT = 0x00000468;
enum BFFM_SETSELECTION = 0x00000467;
enum BFFM_VALIDATEFAILED = 0x00000004;
enum CMDID_INTSHORTCUTCREATE = 0x00000001;
enum STR_PARSE_WITH_PROPERTIES = "ParseWithProperties";
enum STR_PARSE_PARTIAL_IDLIST = "ParseOriginalItem";
enum PROGDLG_NORMAL = 0x00000000;
enum PROGDLG_MODAL = 0x00000001;
enum PROGDLG_AUTOTIME = 0x00000002;
enum PROGDLG_NOTIME = 0x00000004;
enum PROGDLG_NOMINIMIZE = 0x00000008;
enum PROGDLG_NOPROGRESSBAR = 0x00000010;
enum PROGDLG_MARQUEEPROGRESS = 0x00000020;
enum PROGDLG_NOCANCEL = 0x00000040;
enum PDTIMER_RESET = 0x00000001;
enum PDTIMER_PAUSE = 0x00000002;
enum PDTIMER_RESUME = 0x00000003;
enum COMPONENT_TOP = 0x3fffffff;
enum COMP_TYPE_HTMLDOC = 0x00000000;
enum COMP_TYPE_PICTURE = 0x00000001;
enum COMP_TYPE_WEBSITE = 0x00000002;
enum COMP_TYPE_CONTROL = 0x00000003;
enum COMP_TYPE_CFHTML = 0x00000004;
enum COMP_TYPE_MAX = 0x00000004;
enum IS_NORMAL = 0x00000001;
enum IS_FULLSCREEN = 0x00000002;
enum IS_SPLIT = 0x00000004;
enum AD_APPLY_SAVE = 0x00000001;
enum AD_APPLY_HTMLGEN = 0x00000002;
enum AD_APPLY_REFRESH = 0x00000004;
enum AD_APPLY_FORCE = 0x00000008;
enum AD_APPLY_BUFFERED_REFRESH = 0x00000010;
enum AD_APPLY_DYNAMICREFRESH = 0x00000020;
enum AD_GETWP_BMP = 0x00000000;
enum AD_GETWP_IMAGE = 0x00000001;
enum AD_GETWP_LAST_APPLIED = 0x00000002;
enum WPSTYLE_CENTER = 0x00000000;
enum WPSTYLE_TILE = 0x00000001;
enum WPSTYLE_STRETCH = 0x00000002;
enum WPSTYLE_KEEPASPECT = 0x00000003;
enum WPSTYLE_CROPTOFIT = 0x00000004;
enum WPSTYLE_SPAN = 0x00000005;
enum WPSTYLE_MAX = 0x00000006;
enum COMP_ELEM_TYPE = 0x00000001;
enum COMP_ELEM_CHECKED = 0x00000002;
enum COMP_ELEM_DIRTY = 0x00000004;
enum COMP_ELEM_NOSCROLL = 0x00000008;
enum COMP_ELEM_POS_LEFT = 0x00000010;
enum COMP_ELEM_POS_TOP = 0x00000020;
enum COMP_ELEM_SIZE_WIDTH = 0x00000040;
enum COMP_ELEM_SIZE_HEIGHT = 0x00000080;
enum COMP_ELEM_POS_ZINDEX = 0x00000100;
enum COMP_ELEM_SOURCE = 0x00000200;
enum COMP_ELEM_FRIENDLYNAME = 0x00000400;
enum COMP_ELEM_SUBSCRIBEDURL = 0x00000800;
enum COMP_ELEM_ORIGINAL_CSI = 0x00001000;
enum COMP_ELEM_RESTORED_CSI = 0x00002000;
enum COMP_ELEM_CURITEMSTATE = 0x00004000;
enum ADDURL_SILENT = 0x00000001;
enum COMPONENT_DEFAULT_LEFT = 0x0000ffff;
enum COMPONENT_DEFAULT_TOP = 0x0000ffff;
enum MAX_COLUMN_NAME_LEN = 0x00000050;
enum MAX_COLUMN_DESC_LEN = 0x00000080;
enum CFSTR_SHELLIDLIST = "Shell IDList Array";
enum CFSTR_SHELLIDLISTOFFSET = "Shell Object Offsets";
enum CFSTR_NETRESOURCES = "Net Resource";
enum CFSTR_FILEDESCRIPTORA = "FileGroupDescriptor";
enum CFSTR_FILEDESCRIPTORW = "FileGroupDescriptorW";
enum CFSTR_FILECONTENTS = "FileContents";
enum CFSTR_FILENAMEA = "FileName";
enum CFSTR_FILENAMEW = "FileNameW";
enum CFSTR_PRINTERGROUP = "PrinterFriendlyName";
enum CFSTR_FILENAMEMAPA = "FileNameMap";
enum CFSTR_FILENAMEMAPW = "FileNameMapW";
enum CFSTR_SHELLURL = "UniformResourceLocator";
enum CFSTR_INETURLA = "UniformResourceLocator";
enum CFSTR_INETURLW = "UniformResourceLocatorW";
enum CFSTR_PREFERREDDROPEFFECT = "Preferred DropEffect";
enum CFSTR_PERFORMEDDROPEFFECT = "Performed DropEffect";
enum CFSTR_PASTESUCCEEDED = "Paste Succeeded";
enum CFSTR_INDRAGLOOP = "InShellDragLoop";
enum CFSTR_MOUNTEDVOLUME = "MountedVolume";
enum CFSTR_PERSISTEDDATAOBJECT = "PersistedDataObject";
enum CFSTR_TARGETCLSID = "TargetCLSID";
enum CFSTR_LOGICALPERFORMEDDROPEFFECT = "Logical Performed DropEffect";
enum CFSTR_AUTOPLAY_SHELLIDLISTS = "Autoplay Enumerated IDList Array";
enum CFSTR_UNTRUSTEDDRAGDROP = "UntrustedDragDrop";
enum CFSTR_FILE_ATTRIBUTES_ARRAY = "File Attributes Array";
enum CFSTR_INVOKECOMMAND_DROPPARAM = "InvokeCommand DropParam";
enum CFSTR_SHELLDROPHANDLER = "DropHandlerCLSID";
enum CFSTR_DROPDESCRIPTION = "DropDescription";
enum CFSTR_ZONEIDENTIFIER = "ZoneIdentifier";
enum CFSTR_FILEDESCRIPTOR = "FileGroupDescriptorW";
enum CFSTR_FILENAME = "FileNameW";
enum CFSTR_FILENAMEMAP = "FileNameMapW";
enum CFSTR_INETURL = "UniformResourceLocatorW";
enum DVASPECT_SHORTNAME = 0x00000002;
enum DVASPECT_COPY = 0x00000003;
enum DVASPECT_LINK = 0x00000004;
enum SHCNEE_ORDERCHANGED = 0x00000002;
enum SHCNEE_MSI_CHANGE = 0x00000004;
enum SHCNEE_MSI_UNINSTALL = 0x00000005;
enum NUM_POINTS = 0x00000003;
enum CABINETSTATE_VERSION = 0x00000002;
enum PIFNAMESIZE = 0x0000001e;
enum PIFSTARTLOCSIZE = 0x0000003f;
enum PIFDEFPATHSIZE = 0x00000040;
enum PIFPARAMSSIZE = 0x00000040;
enum PIFSHPROGSIZE = 0x00000040;
enum PIFSHDATASIZE = 0x00000040;
enum PIFDEFFILESIZE = 0x00000050;
enum PIFMAXFILEPATH = 0x00000104;
enum QCMINFO_PLACE_BEFORE = 0x00000000;
enum QCMINFO_PLACE_AFTER = 0x00000001;
enum SFVSOC_INVALIDATE_ALL = 0x00000001;
enum SFVSOC_NOSCROLL = 0x00000002;
enum SHELLSTATEVERSION_IE4 = 0x00000009;
enum SHELLSTATEVERSION_WIN2K = 0x0000000a;
enum SHPPFW_NONE = 0x00000000;
enum SHPPFW_DIRCREATE = 0x00000001;
enum SHPPFW_ASKDIRCREATE = 0x00000002;
enum SHPPFW_IGNOREFILENAME = 0x00000004;
enum SHPPFW_NOWRITECHECK = 0x00000008;
enum SHPPFW_MEDIACHECKONLY = 0x00000010;
enum CMF_NORMAL = 0x00000000;
enum CMF_DEFAULTONLY = 0x00000001;
enum CMF_VERBSONLY = 0x00000002;
enum CMF_EXPLORE = 0x00000004;
enum CMF_NOVERBS = 0x00000008;
enum CMF_CANRENAME = 0x00000010;
enum CMF_NODEFAULT = 0x00000020;
enum CMF_INCLUDESTATIC = 0x00000040;
enum CMF_ITEMMENU = 0x00000080;
enum CMF_EXTENDEDVERBS = 0x00000100;
enum CMF_DISABLEDVERBS = 0x00000200;
enum CMF_ASYNCVERBSTATE = 0x00000400;
enum CMF_OPTIMIZEFORINVOKE = 0x00000800;
enum CMF_SYNCCASCADEMENU = 0x00001000;
enum CMF_DONOTPICKDEFAULT = 0x00002000;
enum CMF_RESERVED = 0xffff0000;
enum GCS_VERBA = 0x00000000;
enum GCS_HELPTEXTA = 0x00000001;
enum GCS_VALIDATEA = 0x00000002;
enum GCS_VERBW = 0x00000004;
enum GCS_HELPTEXTW = 0x00000005;
enum GCS_VALIDATEW = 0x00000006;
enum GCS_VERBICONW = 0x00000014;
enum GCS_UNICODE = 0x00000004;
enum GCS_VERB = 0x00000004;
enum GCS_HELPTEXT = 0x00000005;
enum GCS_VALIDATE = 0x00000006;
enum CMDSTR_NEWFOLDERA = "NewFolder";
enum CMDSTR_VIEWLISTA = "ViewList";
enum CMDSTR_VIEWDETAILSA = "ViewDetails";
enum CMDSTR_NEWFOLDERW = "NewFolder";
enum CMDSTR_VIEWLISTW = "ViewList";
enum CMDSTR_VIEWDETAILSW = "ViewDetails";
enum CMDSTR_NEWFOLDER = "NewFolder";
enum CMDSTR_VIEWLIST = "ViewList";
enum CMDSTR_VIEWDETAILS = "ViewDetails";
enum CMIC_MASK_SHIFT_DOWN = 0x10000000;
enum CMIC_MASK_CONTROL_DOWN = 0x40000000;
enum CMIC_MASK_PTINVOKE = 0x20000000;
enum IRTIR_TASK_NOT_RUNNING = 0x00000000;
enum IRTIR_TASK_RUNNING = 0x00000001;
enum IRTIR_TASK_SUSPENDED = 0x00000002;
enum IRTIR_TASK_PENDING = 0x00000003;
enum IRTIR_TASK_FINISHED = 0x00000004;
enum ITSAT_DEFAULT_PRIORITY = 0x10000000;
enum ITSAT_MAX_PRIORITY = 0x7fffffff;
enum ITSAT_MIN_PRIORITY = 0x00000000;
enum ITSSFLAG_COMPLETE_ON_DESTROY = 0x00000000;
enum ITSSFLAG_KILL_ON_DESTROY = 0x00000001;
enum ITSSFLAG_FLAGS_MASK = 0x00000003;
enum CSIDL_FLAG_PFTI_TRACKTARGET = 0x00004000;
enum SHCIDS_ALLFIELDS = 0xffffffff80000000;
enum SHCIDS_CANONICALONLY = 0x10000000;
enum SHCIDS_BITMASK = 0xffffffffffff0000;
enum SHCIDS_COLUMNMASK = 0x0000ffff;
enum SFGAO_STORAGE = 0x00000008;
enum SFGAO_CANRENAME = 0x00000010;
enum SFGAO_CANDELETE = 0x00000020;
enum SFGAO_HASPROPSHEET = 0x00000040;
enum SFGAO_DROPTARGET = 0x00000100;
enum SFGAO_CAPABILITYMASK = 0x00000177;
enum SFGAO_PLACEHOLDER = 0x00000800;
enum SFGAO_SYSTEM = 0x00001000;
enum SFGAO_ENCRYPTED = 0x00002000;
enum SFGAO_ISSLOW = 0x00004000;
enum SFGAO_GHOSTED = 0x00008000;
enum SFGAO_LINK = 0x00010000;
enum SFGAO_SHARE = 0x00020000;
enum SFGAO_READONLY = 0x00040000;
enum SFGAO_HIDDEN = 0x00080000;
enum SFGAO_DISPLAYATTRMASK = 0x000fc000;
enum SFGAO_FILESYSANCESTOR = 0x10000000;
enum SFGAO_FOLDER = 0x20000000;
enum SFGAO_FILESYSTEM = 0x40000000;
enum SFGAO_HASSUBFOLDER = 0xffffffff80000000;
enum SFGAO_CONTENTSMASK = 0xffffffff80000000;
enum SFGAO_VALIDATE = 0x01000000;
enum SFGAO_REMOVABLE = 0x02000000;
enum SFGAO_COMPRESSED = 0x04000000;
enum SFGAO_BROWSABLE = 0x08000000;
enum SFGAO_NONENUMERATED = 0x00100000;
enum SFGAO_NEWCONTENT = 0x00200000;
enum SFGAO_CANMONIKER = 0x00400000;
enum SFGAO_HASSTORAGE = 0x00400000;
enum SFGAO_STREAM = 0x00400000;
enum SFGAO_STORAGEANCESTOR = 0x00800000;
enum SFGAO_STORAGECAPMASK = 0x70c50008;
enum SFGAO_PKEYSFGAOMASK = 0xffffffff81044000;
enum CONFLICT_RESOLUTION_CLSID_KEY = "ConflictResolutionCLSID";
enum STR_BIND_FORCE_FOLDER_SHORTCUT_RESOLVE = "Force Folder Shortcut Resolve";
enum STR_AVOID_DRIVE_RESTRICTION_POLICY = "Avoid Drive Restriction Policy";
enum STR_SKIP_BINDING_CLSID = "Skip Binding CLSID";
enum STR_PARSE_PREFER_FOLDER_BROWSING = "Parse Prefer Folder Browsing";
enum STR_DONT_PARSE_RELATIVE = "Don't Parse Relative";
enum STR_PARSE_TRANSLATE_ALIASES = "Parse Translate Aliases";
enum STR_PARSE_SKIP_NET_CACHE = "Skip Net Resource Cache";
enum STR_PARSE_SHELL_PROTOCOL_TO_FILE_OBJECTS = "Parse Shell Protocol To File Objects";
enum STR_TRACK_CLSID = "Track the CLSID";
enum STR_INTERNAL_NAVIGATE = "Internal Navigation";
enum STR_PARSE_PROPERTYSTORE = "DelegateNamedProperties";
enum STR_NO_VALIDATE_FILENAME_CHARS = "NoValidateFilenameChars";
enum STR_BIND_DELEGATE_CREATE_OBJECT = "Delegate Object Creation";
enum STR_PARSE_ALLOW_INTERNET_SHELL_FOLDERS = "Allow binding to Internet shell folder handlers and negate STR_PARSE_PREFER_WEB_BROWSING";
enum STR_PARSE_PREFER_WEB_BROWSING = "Do not bind to Internet shell folder handlers";
enum STR_PARSE_SHOW_NET_DIAGNOSTICS_UI = "Show network diagnostics UI";
enum STR_PARSE_DONT_REQUIRE_VALIDATED_URLS = "Do not require validated URLs";
enum STR_INTERNETFOLDER_PARSE_ONLY_URLMON_BINDABLE = "Validate URL";
enum BIND_INTERRUPTABLE = 0xffffffff;
enum STR_BIND_FOLDERS_READ_ONLY = "Folders As Read Only";
enum STR_BIND_FOLDER_ENUM_MODE = "Folder Enum Mode";
enum STR_PARSE_WITH_EXPLICIT_PROGID = "ExplicitProgid";
enum STR_PARSE_WITH_EXPLICIT_ASSOCAPP = "ExplicitAssociationApp";
enum STR_PARSE_EXPLICIT_ASSOCIATION_SUCCESSFUL = "ExplicitAssociationSuccessful";
enum STR_PARSE_AND_CREATE_ITEM = "ParseAndCreateItem";
enum STR_PROPERTYBAG_PARAM = "SHBindCtxPropertyBag";
enum STR_ENUM_ITEMS_FLAGS = "SHCONTF";
enum STR_STORAGEITEM_CREATION_FLAGS = "SHGETSTORAGEITEM";
enum STR_ITEM_CACHE_CONTEXT = "ItemCacheContext";
enum CDBOSC_SETFOCUS = 0x00000000;
enum CDBOSC_KILLFOCUS = 0x00000001;
enum CDBOSC_SELCHANGE = 0x00000002;
enum CDBOSC_RENAME = 0x00000003;
enum CDBOSC_STATECHANGE = 0x00000004;
enum CDB2N_CONTEXTMENU_DONE = 0x00000001;
enum CDB2N_CONTEXTMENU_START = 0x00000002;
enum CDB2GVF_SHOWALLFILES = 0x00000001;
enum CDB2GVF_ISFILESAVE = 0x00000002;
enum CDB2GVF_ALLOWPREVIEWPANE = 0x00000004;
enum CDB2GVF_NOSELECTVERB = 0x00000008;
enum CDB2GVF_NOINCLUDEITEM = 0x00000010;
enum CDB2GVF_ISFOLDERPICKER = 0x00000020;
enum CDB2GVF_ADDSHIELD = 0x00000040;
enum SBSP_DEFBROWSER = 0x00000000;
enum SBSP_SAMEBROWSER = 0x00000001;
enum SBSP_NEWBROWSER = 0x00000002;
enum SBSP_DEFMODE = 0x00000000;
enum SBSP_OPENMODE = 0x00000010;
enum SBSP_EXPLOREMODE = 0x00000020;
enum SBSP_HELPMODE = 0x00000040;
enum SBSP_NOTRANSFERHIST = 0x00000080;
enum SBSP_ABSOLUTE = 0x00000000;
enum SBSP_RELATIVE = 0x00001000;
enum SBSP_PARENT = 0x00002000;
enum SBSP_NAVIGATEBACK = 0x00004000;
enum SBSP_NAVIGATEFORWARD = 0x00008000;
enum SBSP_ALLOW_AUTONAVIGATE = 0x00010000;
enum SBSP_KEEPSAMETEMPLATE = 0x00020000;
enum SBSP_KEEPWORDWHEELTEXT = 0x00040000;
enum SBSP_ACTIVATE_NOFOCUS = 0x00080000;
enum SBSP_CREATENOHISTORY = 0x00100000;
enum SBSP_PLAYNOSOUND = 0x00200000;
enum SBSP_CALLERUNTRUSTED = 0x00800000;
enum SBSP_TRUSTFIRSTDOWNLOAD = 0x01000000;
enum SBSP_UNTRUSTEDFORDOWNLOAD = 0x02000000;
enum SBSP_NOAUTOSELECT = 0x04000000;
enum SBSP_WRITENOHISTORY = 0x08000000;
enum SBSP_TRUSTEDFORACTIVEX = 0x10000000;
enum SBSP_FEEDNAVIGATION = 0x20000000;
enum SBSP_REDIRECT = 0x40000000;
enum SBSP_INITIATEDBYHLINKFRAME = 0x80000000;
enum FCW_STATUS = 0x00000001;
enum FCW_TOOLBAR = 0x00000002;
enum FCW_TREE = 0x00000003;
enum FCW_INTERNETBAR = 0x00000006;
enum FCW_PROGRESS = 0x00000008;
enum FCT_MERGE = 0x00000001;
enum FCT_CONFIGABLE = 0x00000002;
enum FCT_ADDTOEND = 0x00000004;
enum STR_DONT_RESOLVE_LINK = "Don't Resolve Link";
enum STR_GET_ASYNC_HANDLER = "GetAsyncHandler";
enum STR_GPS_HANDLERPROPERTIESONLY = "GPS_HANDLERPROPERTIESONLY";
enum STR_GPS_FASTPROPERTIESONLY = "GPS_FASTPROPERTIESONLY";
enum STR_GPS_OPENSLOWITEM = "GPS_OPENSLOWITEM";
enum STR_GPS_DELAYCREATION = "GPS_DELAYCREATION";
enum STR_GPS_BESTEFFORT = "GPS_BESTEFFORT";
enum STR_GPS_NO_OPLOCK = "GPS_NO_OPLOCK";
enum DI_GETDRAGIMAGE = "ShellGetDragImage";
enum ARCONTENT_AUTORUNINF = 0x00000002;
enum ARCONTENT_AUDIOCD = 0x00000004;
enum ARCONTENT_DVDMOVIE = 0x00000008;
enum ARCONTENT_BLANKCD = 0x00000010;
enum ARCONTENT_BLANKDVD = 0x00000020;
enum ARCONTENT_UNKNOWNCONTENT = 0x00000040;
enum ARCONTENT_AUTOPLAYPIX = 0x00000080;
enum ARCONTENT_AUTOPLAYMUSIC = 0x00000100;
enum ARCONTENT_AUTOPLAYVIDEO = 0x00000200;
enum ARCONTENT_VCD = 0x00000400;
enum ARCONTENT_SVCD = 0x00000800;
enum ARCONTENT_DVDAUDIO = 0x00001000;
enum ARCONTENT_BLANKBD = 0x00002000;
enum ARCONTENT_BLURAY = 0x00004000;
enum ARCONTENT_CAMERASTORAGE = 0x00008000;
enum ARCONTENT_CUSTOMEVENT = 0x00010000;
enum ARCONTENT_NONE = 0x00000000;
enum ARCONTENT_MASK = 0x0001fffe;
enum ARCONTENT_PHASE_UNKNOWN = 0x00000000;
enum ARCONTENT_PHASE_PRESNIFF = 0x10000000;
enum ARCONTENT_PHASE_SNIFFING = 0x20000000;
enum ARCONTENT_PHASE_FINAL = 0x40000000;
enum ARCONTENT_PHASE_MASK = 0x70000000;
enum IEI_PRIORITY_MAX = 0x7fffffff;
enum IEI_PRIORITY_MIN = 0x00000000;
enum IEIT_PRIORITY_NORMAL = 0x10000000;
enum IEIFLAG_ASYNC = 0x00000001;
enum IEIFLAG_CACHE = 0x00000002;
enum IEIFLAG_ASPECT = 0x00000004;
enum IEIFLAG_OFFLINE = 0x00000008;
enum IEIFLAG_GLEAM = 0x00000010;
enum IEIFLAG_SCREEN = 0x00000020;
enum IEIFLAG_ORIGSIZE = 0x00000040;
enum IEIFLAG_NOSTAMP = 0x00000080;
enum IEIFLAG_NOBORDER = 0x00000100;
enum IEIFLAG_QUALITY = 0x00000200;
enum IEIFLAG_REFRESH = 0x00000400;
enum DBIM_MINSIZE = 0x00000001;
enum DBIM_MAXSIZE = 0x00000002;
enum DBIM_INTEGRAL = 0x00000004;
enum DBIM_ACTUAL = 0x00000008;
enum DBIM_TITLE = 0x00000010;
enum DBIM_MODEFLAGS = 0x00000020;
enum DBIM_BKCOLOR = 0x00000040;
enum DBIMF_NORMAL = 0x00000000;
enum DBIMF_FIXED = 0x00000001;
enum DBIMF_FIXEDBMP = 0x00000004;
enum DBIMF_VARIABLEHEIGHT = 0x00000008;
enum DBIMF_UNDELETEABLE = 0x00000010;
enum DBIMF_DEBOSSED = 0x00000020;
enum DBIMF_BKCOLOR = 0x00000040;
enum DBIMF_USECHEVRON = 0x00000080;
enum DBIMF_BREAK = 0x00000100;
enum DBIMF_ADDTOFRONT = 0x00000200;
enum DBIMF_TOPALIGN = 0x00000400;
enum DBIMF_NOGRIPPER = 0x00000800;
enum DBIMF_ALWAYSGRIPPER = 0x00001000;
enum DBIMF_NOMARGINS = 0x00002000;
enum DBIF_VIEWMODE_NORMAL = 0x00000000;
enum DBIF_VIEWMODE_VERTICAL = 0x00000001;
enum DBIF_VIEWMODE_FLOATING = 0x00000002;
enum DBIF_VIEWMODE_TRANSPARENT = 0x00000004;
enum DBPC_SELECTFIRST = 0xffffffff;
enum THBN_CLICKED = 0x00001800;
enum FOFX_NOSKIPJUNCTIONS = 0x00010000;
enum FOFX_PREFERHARDLINK = 0x00020000;
enum FOFX_SHOWELEVATIONPROMPT = 0x00040000;
enum FOFX_RECYCLEONDELETE = 0x00080000;
enum FOFX_EARLYFAILURE = 0x00100000;
enum FOFX_PRESERVEFILEEXTENSIONS = 0x00200000;
enum FOFX_KEEPNEWERFILE = 0x00400000;
enum FOFX_NOCOPYHOOKS = 0x00800000;
enum FOFX_NOMINIMIZEBOX = 0x01000000;
enum FOFX_MOVEACLSACROSSVOLUMES = 0x02000000;
enum FOFX_DONTDISPLAYSOURCEPATH = 0x04000000;
enum FOFX_DONTDISPLAYDESTPATH = 0x08000000;
enum FOFX_REQUIREELEVATION = 0x10000000;
enum FOFX_ADDUNDORECORD = 0x20000000;
enum FOFX_COPYASDOWNLOAD = 0x40000000;
enum FOFX_DONTDISPLAYLOCATIONS = 0x80000000;
enum BSIM_STATE = 0x00000001;
enum BSIM_STYLE = 0x00000002;
enum BSSF_VISIBLE = 0x00000001;
enum BSSF_NOTITLE = 0x00000002;
enum BSSF_UNDELETEABLE = 0x00001000;
enum BSIS_AUTOGRIPPER = 0x00000000;
enum BSIS_NOGRIPPER = 0x00000001;
enum BSIS_ALWAYSGRIPPER = 0x00000002;
enum BSIS_LEFTALIGN = 0x00000004;
enum BSIS_SINGLECLICK = 0x00000008;
enum BSIS_NOCONTEXTMENU = 0x00000010;
enum BSIS_NODROPTARGET = 0x00000020;
enum BSIS_NOCAPTION = 0x00000040;
enum BSIS_PREFERNOLINEBREAK = 0x00000080;
enum BSIS_LOCKED = 0x00000100;
enum BSIS_PRESERVEORDERDURINGLAYOUT = 0x00000200;
enum BSIS_FIXEDORDER = 0x00000400;
enum OF_CAP_CANSWITCHTO = 0x00000001;
enum OF_CAP_CANCLOSE = 0x00000002;
enum SMDM_SHELLFOLDER = 0x00000001;
enum SMDM_HMENU = 0x00000002;
enum SMDM_TOOLBAR = 0x00000004;
enum SMC_INITMENU = 0x00000001;
enum SMC_CREATE = 0x00000002;
enum SMC_EXITMENU = 0x00000003;
enum SMC_GETINFO = 0x00000005;
enum SMC_GETSFINFO = 0x00000006;
enum SMC_GETOBJECT = 0x00000007;
enum SMC_GETSFOBJECT = 0x00000008;
enum SMC_SFEXEC = 0x00000009;
enum SMC_SFSELECTITEM = 0x0000000a;
enum SMC_REFRESH = 0x00000010;
enum SMC_DEMOTE = 0x00000011;
enum SMC_PROMOTE = 0x00000012;
enum SMC_DEFAULTICON = 0x00000016;
enum SMC_NEWITEM = 0x00000017;
enum SMC_CHEVRONEXPAND = 0x00000019;
enum SMC_DISPLAYCHEVRONTIP = 0x0000002a;
enum SMC_SETSFOBJECT = 0x0000002d;
enum SMC_SHCHANGENOTIFY = 0x0000002e;
enum SMC_CHEVRONGETTIP = 0x0000002f;
enum SMC_SFDDRESTRICTED = 0x00000030;
enum SMC_SFEXEC_MIDDLE = 0x00000031;
enum SMC_GETAUTOEXPANDSTATE = 0x00000041;
enum SMC_AUTOEXPANDCHANGE = 0x00000042;
enum SMC_GETCONTEXTMENUMODIFIER = 0x00000043;
enum SMC_GETBKCONTEXTMENU = 0x00000044;
enum SMC_OPEN = 0x00000045;
enum SMAE_EXPANDED = 0x00000001;
enum SMAE_CONTRACTED = 0x00000002;
enum SMAE_USER = 0x00000004;
enum SMAE_VALID = 0x00000007;
enum SMINIT_DEFAULT = 0x00000000;
enum SMINIT_RESTRICT_DRAGDROP = 0x00000002;
enum SMINIT_TOPLEVEL = 0x00000004;
enum SMINIT_CACHED = 0x00000010;
enum SMINIT_AUTOEXPAND = 0x00000100;
enum SMINIT_AUTOTOOLTIP = 0x00000200;
enum SMINIT_DROPONCONTAINER = 0x00000400;
enum SMINIT_VERTICAL = 0x10000000;
enum SMINIT_HORIZONTAL = 0x20000000;
enum SMSET_TOP = 0x10000000;
enum SMSET_BOTTOM = 0x20000000;
enum SMSET_DONTOWN = 0x00000001;
enum SMINV_REFRESH = 0x00000001;
enum SMINV_ID = 0x00000008;
enum E_PREVIEWHANDLER_DRM_FAIL = 0xffffffff86420001;
enum E_PREVIEWHANDLER_NOAUTH = 0xffffffff86420002;
enum E_PREVIEWHANDLER_NOTFOUND = 0xffffffff86420003;
enum E_PREVIEWHANDLER_CORRUPT = 0xffffffff86420004;
enum STR_FILE_SYS_BIND_DATA = "File System Bind Data";
enum STR_FILE_SYS_BIND_DATA_WIN7_FORMAT = "Win7FileSystemIdList";
enum HOMEGROUP_SECURITY_GROUP_MULTI = "HUG";
enum HOMEGROUP_SECURITY_GROUP = "HomeUsers";
enum PROP_CONTRACT_DELEGATE = "ContractDelegate";
enum SID_URLExecutionContext = GUID(0xfb5f8ebc, 0xbbb6, 0x4d10, [0xa4, 0x61, 0x77, 0x72, 0x91, 0xa0, 0x90, 0x30]);
enum STR_TAB_REUSE_IDENTIFIER = "Tab Reuse Identifier";
enum STR_REFERRER_IDENTIFIER = "Referrer Identifier";
enum SID_LaunchSourceViewSizePreference = GUID(0x80605492, 0x67d9, 0x414f, [0xaf, 0x89, 0xa1, 0xcd, 0xf1, 0x24, 0x2b, 0xc1]);
enum SID_LaunchTargetViewSizePreference = GUID(0x26db2472, 0xb7b7, 0x406b, [0x97, 0x2, 0x73, 0xa, 0x4e, 0x20, 0xd3, 0xbf]);
enum SID_LaunchSourceAppUserModelId = GUID(0x2ce78010, 0x74db, 0x48bc, [0x9c, 0x6a, 0x10, 0xf3, 0x72, 0x49, 0x57, 0x23]);
enum SID_ShellExecuteNamedPropertyStore = GUID(0xeb84ada2, 0xff, 0x4992, [0x83, 0x24, 0xed, 0x5c, 0xe0, 0x61, 0xcb, 0x29]);
enum ISIOI_ICONFILE = 0x00000001;
enum ISIOI_ICONINDEX = 0x00000002;
enum ABM_NEW = 0x00000000;
enum ABM_REMOVE = 0x00000001;
enum ABM_QUERYPOS = 0x00000002;
enum ABM_SETPOS = 0x00000003;
enum ABM_GETSTATE = 0x00000004;
enum ABM_GETTASKBARPOS = 0x00000005;
enum ABM_ACTIVATE = 0x00000006;
enum ABM_GETAUTOHIDEBAR = 0x00000007;
enum ABM_SETAUTOHIDEBAR = 0x00000008;
enum ABM_WINDOWPOSCHANGED = 0x00000009;
enum ABM_SETSTATE = 0x0000000a;
enum ABM_GETAUTOHIDEBAREX = 0x0000000b;
enum ABM_SETAUTOHIDEBAREX = 0x0000000c;
enum ABN_STATECHANGE = 0x00000000;
enum ABN_POSCHANGED = 0x00000001;
enum ABN_FULLSCREENAPP = 0x00000002;
enum ABN_WINDOWARRANGE = 0x00000003;
enum ABS_AUTOHIDE = 0x00000001;
enum ABS_ALWAYSONTOP = 0x00000002;
enum ABE_LEFT = 0x00000000;
enum ABE_TOP = 0x00000001;
enum ABE_RIGHT = 0x00000002;
enum ABE_BOTTOM = 0x00000003;
enum FO_MOVE = 0x00000001;
enum FO_COPY = 0x00000002;
enum FO_DELETE = 0x00000003;
enum FO_RENAME = 0x00000004;
enum FOF_MULTIDESTFILES = 0x00000001;
enum FOF_CONFIRMMOUSE = 0x00000002;
enum FOF_SILENT = 0x00000004;
enum FOF_RENAMEONCOLLISION = 0x00000008;
enum FOF_NOCONFIRMATION = 0x00000010;
enum FOF_WANTMAPPINGHANDLE = 0x00000020;
enum FOF_ALLOWUNDO = 0x00000040;
enum FOF_FILESONLY = 0x00000080;
enum FOF_SIMPLEPROGRESS = 0x00000100;
enum FOF_NOCONFIRMMKDIR = 0x00000200;
enum FOF_NOERRORUI = 0x00000400;
enum FOF_NOCOPYSECURITYATTRIBS = 0x00000800;
enum FOF_NORECURSION = 0x00001000;
enum FOF_NO_CONNECTED_ELEMENTS = 0x00002000;
enum FOF_WANTNUKEWARNING = 0x00004000;
enum FOF_NORECURSEREPARSE = 0x00008000;
enum PO_DELETE = 0x00000013;
enum PO_RENAME = 0x00000014;
enum PO_PORTCHANGE = 0x00000020;
enum PO_REN_PORT = 0x00000034;
enum SE_ERR_FNF = 0x00000002;
enum SE_ERR_PNF = 0x00000003;
enum SE_ERR_ACCESSDENIED = 0x00000005;
enum SE_ERR_OOM = 0x00000008;
enum SE_ERR_DLLNOTFOUND = 0x00000020;
enum SE_ERR_SHARE = 0x0000001a;
enum SE_ERR_ASSOCINCOMPLETE = 0x0000001b;
enum SE_ERR_DDETIMEOUT = 0x0000001c;
enum SE_ERR_DDEFAIL = 0x0000001d;
enum SE_ERR_DDEBUSY = 0x0000001e;
enum SE_ERR_NOASSOC = 0x0000001f;
enum SEE_MASK_DEFAULT = 0x00000000;
enum SEE_MASK_CLASSNAME = 0x00000001;
enum SEE_MASK_CLASSKEY = 0x00000003;
enum SEE_MASK_IDLIST = 0x00000004;
enum SEE_MASK_INVOKEIDLIST = 0x0000000c;
enum SEE_MASK_ICON = 0x00000010;
enum SEE_MASK_HOTKEY = 0x00000020;
enum SEE_MASK_NOCLOSEPROCESS = 0x00000040;
enum SEE_MASK_CONNECTNETDRV = 0x00000080;
enum SEE_MASK_NOASYNC = 0x00000100;
enum SEE_MASK_FLAG_DDEWAIT = 0x00000100;
enum SEE_MASK_DOENVSUBST = 0x00000200;
enum SEE_MASK_FLAG_NO_UI = 0x00000400;
enum SEE_MASK_UNICODE = 0x00004000;
enum SEE_MASK_NO_CONSOLE = 0x00008000;
enum SEE_MASK_ASYNCOK = 0x00100000;
enum SEE_MASK_HMONITOR = 0x00200000;
enum SEE_MASK_NOZONECHECKS = 0x00800000;
enum SEE_MASK_NOQUERYCLASSSTORE = 0x01000000;
enum SEE_MASK_WAITFORINPUTIDLE = 0x02000000;
enum SEE_MASK_FLAG_LOG_USAGE = 0x04000000;
enum SEE_MASK_FLAG_HINST_IS_SITE = 0x08000000;
enum SHERB_NOCONFIRMATION = 0x00000001;
enum SHERB_NOPROGRESSUI = 0x00000002;
enum SHERB_NOSOUND = 0x00000004;
enum NIN_SELECT = 0x00000400;
enum NINF_KEY = 0x00000001;
enum NIN_BALLOONSHOW = 0x00000402;
enum NIN_BALLOONHIDE = 0x00000403;
enum NIN_BALLOONTIMEOUT = 0x00000404;
enum NIN_BALLOONUSERCLICK = 0x00000405;
enum NIN_POPUPOPEN = 0x00000406;
enum NIN_POPUPCLOSE = 0x00000407;
enum NOTIFYICON_VERSION = 0x00000003;
enum NOTIFYICON_VERSION_4 = 0x00000004;
enum NIS_HIDDEN = 0x00000001;
enum NIS_SHAREDICON = 0x00000002;
enum NIIF_NONE = 0x00000000;
enum NIIF_INFO = 0x00000001;
enum NIIF_WARNING = 0x00000002;
enum NIIF_ERROR = 0x00000003;
enum NIIF_USER = 0x00000004;
enum NIIF_ICON_MASK = 0x0000000f;
enum NIIF_NOSOUND = 0x00000010;
enum NIIF_LARGE_ICON = 0x00000020;
enum NIIF_RESPECT_QUIET_TIME = 0x00000080;
enum SHGSI_ICONLOCATION = 0x00000000;
enum SHGNLI_PIDL = 0x0000000000000001;
enum SHGNLI_PREFIXNAME = 0x0000000000000002;
enum SHGNLI_NOUNIQUE = 0x0000000000000004;
enum SHGNLI_NOLNK = 0x0000000000000008;
enum SHGNLI_NOLOCNAME = 0x0000000000000010;
enum SHGNLI_USEURLEXT = 0x0000000000000020;
enum PRINTACTION_OPEN = 0x00000000;
enum PRINTACTION_PROPERTIES = 0x00000001;
enum PRINTACTION_NETINSTALL = 0x00000002;
enum PRINTACTION_NETINSTALLLINK = 0x00000003;
enum PRINTACTION_TESTPAGE = 0x00000004;
enum PRINTACTION_OPENNETPRN = 0x00000005;
enum PRINTACTION_DOCUMENTDEFAULTS = 0x00000006;
enum PRINTACTION_SERVERPROPERTIES = 0x00000007;
enum PRINT_PROP_FORCE_NAME = 0x00000001;
enum OFFLINE_STATUS_LOCAL = 0x00000001;
enum OFFLINE_STATUS_REMOTE = 0x00000002;
enum OFFLINE_STATUS_INCOMPLETE = 0x00000004;
enum SHIL_LARGE = 0x00000000;
enum SHIL_SMALL = 0x00000001;
enum SHIL_EXTRALARGE = 0x00000002;
enum SHIL_SYSSMALL = 0x00000003;
enum SHIL_JUMBO = 0x00000004;
enum SHIL_LAST = 0x00000004;
enum WC_NETADDRESS = "msctls_netaddress";
enum NCM_GETADDRESS = 0x00000401;
enum NCM_SETALLOWTYPE = 0x00000402;
enum NCM_GETALLOWTYPE = 0x00000403;
enum NCM_DISPLAYERRORTIP = 0x00000404;
enum CREDENTIAL_PROVIDER_NO_DEFAULT = 0xffffffff;
enum Identity_LocalUserProvider = GUID(0xa198529b, 0x730f, 0x4089, [0xb6, 0x46, 0xa1, 0x25, 0x57, 0xf5, 0x66, 0x5e]);
enum MAX_SYNCMGR_ID = 0x00000040;
enum MAX_SYNCMGR_PROGRESSTEXT = 0x00000104;
enum MAX_SYNCMGR_NAME = 0x00000080;
enum STIF_DEFAULT = 0x00000000;
enum STIF_SUPPORT_HEX = 0x00000001;
enum SZ_CONTENTTYPE_HTMLA = "text/html";
enum SZ_CONTENTTYPE_HTMLW = "text/html";
enum SZ_CONTENTTYPE_CDFA = "application/x-cdf";
enum SZ_CONTENTTYPE_CDFW = "application/x-cdf";
enum SZ_CONTENTTYPE_HTML = "text/html";
enum SZ_CONTENTTYPE_CDF = "application/x-cdf";
enum GCT_INVALID = 0x00000000;
enum GCT_LFNCHAR = 0x00000001;
enum GCT_SHORTCHAR = 0x00000002;
enum GCT_WILD = 0x00000004;
enum GCT_SEPARATOR = 0x00000008;
enum PMSF_NORMAL = 0x00000000;
enum PMSF_MULTIPLE = 0x00000001;
enum PMSF_DONT_STRIP_SPACES = 0x00010000;
enum URL_UNESCAPE = 0x10000000;
enum URL_ESCAPE_UNSAFE = 0x20000000;
enum URL_PLUGGABLE_PROTOCOL = 0x40000000;
enum URL_WININET_COMPATIBILITY = 0x80000000;
enum URL_DONT_ESCAPE_EXTRA_INFO = 0x02000000;
enum URL_DONT_UNESCAPE_EXTRA_INFO = 0x02000000;
enum URL_BROWSER_MODE = 0x02000000;
enum URL_ESCAPE_SPACES_ONLY = 0x04000000;
enum URL_DONT_SIMPLIFY = 0x08000000;
enum URL_NO_META = 0x08000000;
enum URL_UNESCAPE_INPLACE = 0x00100000;
enum URL_CONVERT_IF_DOSPATH = 0x00200000;
enum URL_UNESCAPE_HIGH_ANSI_ONLY = 0x00400000;
enum URL_INTERNAL_PATH = 0x00800000;
enum URL_FILE_USE_PATHURL = 0x00010000;
enum URL_DONT_UNESCAPE = 0x00020000;
enum URL_ESCAPE_AS_UTF8 = 0x00040000;
enum URL_UNESCAPE_AS_UTF8 = 0x00040000;
enum URL_ESCAPE_ASCII_URI_COMPONENT = 0x00080000;
enum URL_UNESCAPE_URI_COMPONENT = 0x00040000;
enum URL_ESCAPE_PERCENT = 0x00001000;
enum URL_ESCAPE_SEGMENT_ONLY = 0x00002000;
enum URL_PARTFLAG_KEEPSCHEME = 0x00000001;
enum URL_APPLY_DEFAULT = 0x00000001;
enum URL_APPLY_GUESSSCHEME = 0x00000002;
enum URL_APPLY_GUESSFILE = 0x00000004;
enum URL_APPLY_FORCEAPPLY = 0x00000008;
enum SRRF_RT_REG_NONE = 0x00000001;
enum SRRF_RT_REG_SZ = 0x00000002;
enum SRRF_RT_REG_EXPAND_SZ = 0x00000004;
enum SRRF_RT_REG_BINARY = 0x00000008;
enum SRRF_RT_REG_DWORD = 0x00000010;
enum SRRF_RT_REG_MULTI_SZ = 0x00000020;
enum SRRF_RT_REG_QWORD = 0x00000040;
enum SRRF_RT_ANY = 0x0000ffff;
enum SRRF_RM_ANY = 0x00000000;
enum SRRF_RM_NORMAL = 0x00010000;
enum SRRF_RM_SAFE = 0x00020000;
enum SRRF_RM_SAFENETWORK = 0x00040000;
enum SRRF_NOEXPAND = 0x10000000;
enum SRRF_ZEROONFAILURE = 0x20000000;
enum SRRF_NOVIRT = 0x40000000;
enum SHREGSET_HKCU = 0x00000001;
enum SHREGSET_FORCE_HKCU = 0x00000002;
enum SHREGSET_HKLM = 0x00000004;
enum SHREGSET_FORCE_HKLM = 0x00000008;
enum SPMODE_SHELL = 0x00000001;
enum SPMODE_DEBUGOUT = 0x00000002;
enum SPMODE_TEST = 0x00000004;
enum SPMODE_BROWSER = 0x00000008;
enum SPMODE_FLUSH = 0x00000010;
enum SPMODE_EVENT = 0x00000020;
enum SPMODE_MSVM = 0x00000040;
enum SPMODE_FORMATTEXT = 0x00000080;
enum SPMODE_PROFILE = 0x00000100;
enum SPMODE_DEBUGBREAK = 0x00000200;
enum SPMODE_MSGTRACE = 0x00000400;
enum SPMODE_PERFTAGS = 0x00000800;
enum SPMODE_MEMWATCH = 0x00001000;
enum SPMODE_DBMON = 0x00002000;
enum SPMODE_MULTISTOP = 0x00004000;
enum SPMODE_EVENTTRACE = 0x00008000;
enum SHGVSPB_PERUSER = 0x00000001;
enum SHGVSPB_ALLUSERS = 0x00000002;
enum SHGVSPB_PERFOLDER = 0x00000004;
enum SHGVSPB_ALLFOLDERS = 0x00000008;
enum SHGVSPB_INHERIT = 0x00000010;
enum SHGVSPB_ROAM = 0x00000020;
enum SHGVSPB_NOAUTODEFAULTS = 0x80000000;
enum FDTF_SHORTTIME = 0x00000001;
enum FDTF_SHORTDATE = 0x00000002;
enum FDTF_LONGDATE = 0x00000004;
enum FDTF_LONGTIME = 0x00000008;
enum FDTF_RELATIVE = 0x00000010;
enum FDTF_LTRDATE = 0x00000100;
enum FDTF_RTLDATE = 0x00000200;
enum FDTF_NOAUTOREADINGORDER = 0x00000400;
enum PLATFORM_UNKNOWN = 0x00000000;
enum PLATFORM_IE3 = 0x00000001;
enum PLATFORM_BROWSERONLY = 0x00000001;
enum PLATFORM_INTEGRATED = 0x00000002;
enum ILMM_IE4 = 0x00000000;
enum DLLVER_PLATFORM_WINDOWS = 0x00000001;
enum DLLVER_PLATFORM_NT = 0x00000002;
enum DLLVER_MAJOR_MASK = 0xffff000000000000;
enum DLLVER_MINOR_MASK = 0x0000ffff00000000;
enum DLLVER_BUILD_MASK = 0x00000000ffff0000;
enum DLLVER_QFE_MASK = 0x000000000000ffff;
enum WTS_E_FAILEDEXTRACTION = 0xffffffff8004b200;
enum WTS_E_EXTRACTIONTIMEDOUT = 0xffffffff8004b201;
enum WTS_E_SURROGATEUNAVAILABLE = 0xffffffff8004b202;
enum WTS_E_FASTEXTRACTIONNOTSUPPORTED = 0xffffffff8004b203;
enum WTS_E_DATAFILEUNAVAILABLE = 0xffffffff8004b204;
enum WTS_E_EXTRACTIONPENDING = 0xffffffff8004b205;
enum WTS_E_EXTRACTIONBLOCKED = 0xffffffff8004b206;
enum WTS_E_NOSTORAGEPROVIDERTHUMBNAILHANDLER = 0xffffffff8004b207;
enum SHIMGKEY_QUALITY = "Compression";
enum SHIMGKEY_RAWFORMAT = "RawDataFormat";
enum SHIMGDEC_DEFAULT = 0x00000000;
enum SHIMGDEC_THUMBNAIL = 0x00000001;
enum SHIMGDEC_LOADFULL = 0x00000002;
enum E_NOTVALIDFORANIMATEDIMAGE = 0xffffffff80040001;
enum S_SYNCMGR_MISSINGITEMS = 0x00040201;
enum S_SYNCMGR_RETRYSYNC = 0x00040202;
enum S_SYNCMGR_CANCELITEM = 0x00040203;
enum S_SYNCMGR_CANCELALL = 0x00040204;
enum S_SYNCMGR_ITEMDELETED = 0x00040210;
enum S_SYNCMGR_ENUMITEMS = 0x00040211;
enum SYNCMGRPROGRESSITEM_STATUSTEXT = 0x00000001;
enum SYNCMGRPROGRESSITEM_STATUSTYPE = 0x00000002;
enum SYNCMGRPROGRESSITEM_PROGVALUE = 0x00000004;
enum SYNCMGRPROGRESSITEM_MAXVALUE = 0x00000008;
enum SYNCMGRLOGERROR_ERRORFLAGS = 0x00000001;
enum SYNCMGRLOGERROR_ERRORID = 0x00000002;
enum SYNCMGRLOGERROR_ITEMID = 0x00000004;
enum SYNCMGRITEM_ITEMFLAGMASK = 0x0000007f;
enum MAX_SYNCMGRITEMNAME = 0x00000080;
enum SYNCMGRHANDLERFLAG_MASK = 0x0000000f;
enum MAX_SYNCMGRHANDLERNAME = 0x00000020;
enum SYNCMGRREGISTERFLAGS_MASK = 0x00000007;
enum TLOG_BACK = 0xffffffffffffffff;
enum TLOG_CURRENT = 0x00000000;
enum TLOG_FORE = 0x00000001;
enum TLMENUF_INCLUDECURRENT = 0x00000001;
enum TLMENUF_BACK = 0x00000010;
enum TLMENUF_FORE = 0x00000020;
enum BSF_REGISTERASDROPTARGET = 0x00000001;
enum BSF_THEATERMODE = 0x00000002;
enum BSF_NOLOCALFILEWARNING = 0x00000010;
enum BSF_UISETBYAUTOMATION = 0x00000100;
enum BSF_RESIZABLE = 0x00000200;
enum BSF_CANMAXIMIZE = 0x00000400;
enum BSF_TOPBROWSER = 0x00000800;
enum BSF_NAVNOHISTORY = 0x00001000;
enum BSF_HTMLNAVCANCELED = 0x00002000;
enum BSF_DONTSHOWNAVCANCELPAGE = 0x00004000;
enum BSF_SETNAVIGATABLECODEPAGE = 0x00008000;
enum BSF_DELEGATEDNAVIGATION = 0x00010000;
enum BSF_TRUSTEDFORACTIVEX = 0x00020000;
enum BSF_MERGEDMENUS = 0x00040000;
enum BSF_FEEDNAVIGATION = 0x00080000;
enum BSF_FEEDSUBSCRIBED = 0x00100000;
enum HLNF_CALLERUNTRUSTED = 0x00200000;
enum HLNF_TRUSTEDFORACTIVEX = 0x00400000;
enum HLNF_DISABLEWINDOWRESTRICTIONS = 0x00800000;
enum HLNF_TRUSTFIRSTDOWNLOAD = 0x01000000;
enum HLNF_UNTRUSTEDFORDOWNLOAD = 0x02000000;
enum SHHLNF_NOAUTOSELECT = 0x04000000;
enum SHHLNF_WRITENOHISTORY = 0x08000000;
enum HLNF_EXTERNALNAVIGATE = 0x10000000;
enum HLNF_ALLOW_AUTONAVIGATE = 0x20000000;
enum HLNF_NEWWINDOWSMANAGED = 0x80000000;
enum INTERNET_MAX_PATH_LENGTH = 0x00000800;
enum INTERNET_MAX_SCHEME_LENGTH = 0x00000020;
enum VIEW_PRIORITY_RESTRICTED = 0x00000070;
enum VIEW_PRIORITY_CACHEHIT = 0x00000050;
enum VIEW_PRIORITY_STALECACHEHIT = 0x00000045;
enum VIEW_PRIORITY_USEASDEFAULT = 0x00000043;
enum VIEW_PRIORITY_SHELLEXT = 0x00000040;
enum VIEW_PRIORITY_CACHEMISS = 0x00000030;
enum VIEW_PRIORITY_INHERIT = 0x00000020;
enum VIEW_PRIORITY_SHELLEXT_ASBACKUP = 0x00000015;
enum VIEW_PRIORITY_DESPERATE = 0x00000010;
enum VIEW_PRIORITY_NONE = 0x00000000;
enum VOLUME_PREFIX = "\\\\?\\Volume";
enum PATHCCH_MAX_CCH = 0x00008000;
enum IDS_DESCRIPTION = 0x00000001;
enum ID_APP = 0x00000064;
enum DLG_SCRNSAVECONFIGURE = 0x000007d3;
enum idsIsPassword = 0x000003e8;
enum idsIniFile = 0x000003e9;
enum idsScreenSaver = 0x000003ea;
enum idsPassword = 0x000003eb;
enum idsDifferentPW = 0x000003ec;
enum idsChangePW = 0x000003ed;
enum idsBadOldPW = 0x000003ee;
enum idsAppName = 0x000003ef;
enum idsNoHelpMemory = 0x000003f0;
enum idsHelpFile = 0x000003f1;
enum idsDefKeyword = 0x000003f2;
enum MAXFILELEN = 0x0000000d;
enum TITLEBARNAMELEN = 0x00000028;
enum APPNAMEBUFFERLEN = 0x00000028;
enum BUFFLEN = 0x000000ff;
enum SCRM_VERIFYPW = 0x00008000;
enum E_FLAGS = 0xffffffff80041000;
enum IS_E_EXEC_FAILED = 0xffffffff80042002;
enum URL_E_INVALID_SYNTAX = 0xffffffff80041001;
enum URL_E_UNREGISTERED_PROTOCOL = 0xffffffff80041002;
enum CPLPAGE_MOUSE_BUTTONS = 0x00000001;
enum CPLPAGE_MOUSE_PTRMOTION = 0x00000002;
enum CPLPAGE_MOUSE_WHEEL = 0x00000003;
enum CPLPAGE_KEYBOARD_SPEED = 0x00000001;
enum CPLPAGE_DISPLAY_BACKGROUND = 0x00000001;
enum DISPID_SELECTIONCHANGED = 0x000000c8;
enum DISPID_FILELISTENUMDONE = 0x000000c9;
enum DISPID_VERBINVOKED = 0x000000ca;
enum DISPID_DEFAULTVERBINVOKED = 0x000000cb;
enum DISPID_BEGINDRAG = 0x000000cc;
enum DISPID_VIEWMODECHANGED = 0x000000cd;
enum DISPID_NOITEMSTATE_CHANGED = 0x000000ce;
enum DISPID_CONTENTSCHANGED = 0x000000cf;
enum DISPID_FOCUSCHANGED = 0x000000d0;
enum DISPID_CHECKSTATECHANGED = 0x000000d1;
enum DISPID_ORDERCHANGED = 0x000000d2;
enum DISPID_VIEWPAINTDONE = 0x000000d3;
enum DISPID_COLUMNSCHANGED = 0x000000d4;
enum DISPID_CTRLMOUSEWHEEL = 0x000000d5;
enum DISPID_SORTDONE = 0x000000d6;
enum DISPID_ICONSIZECHANGED = 0x000000d7;
enum DISPID_FOLDERCHANGED = 0x000000d9;
enum DISPID_FILTERINVOKED = 0x000000da;
enum DISPID_WORDWHEELEDITED = 0x000000db;
enum DISPID_SELECTEDITEMCHANGED = 0x000000dc;
enum DISPID_EXPLORERWINDOWREADY = 0x000000dd;
enum DISPID_UPDATEIMAGE = 0x000000de;
enum DISPID_INITIALENUMERATIONDONE = 0x000000df;
enum DISPID_ENTERPRISEIDCHANGED = 0x000000e0;
enum DISPID_ENTERPRESSED = 0x000000c8;
enum DISPID_SEARCHCOMMAND_START = 0x00000001;
enum DISPID_SEARCHCOMMAND_COMPLETE = 0x00000002;
enum DISPID_SEARCHCOMMAND_ABORT = 0x00000003;
enum DISPID_SEARCHCOMMAND_UPDATE = 0x00000004;
enum DISPID_SEARCHCOMMAND_PROGRESSTEXT = 0x00000005;
enum DISPID_SEARCHCOMMAND_ERROR = 0x00000006;
enum DISPID_SEARCHCOMMAND_RESTORE = 0x00000007;
enum DISPID_IADCCTL_DIRTY = 0x00000100;
enum DISPID_IADCCTL_PUBCAT = 0x00000101;
enum DISPID_IADCCTL_SORT = 0x00000102;
enum DISPID_IADCCTL_FORCEX86 = 0x00000103;
enum DISPID_IADCCTL_SHOWPOSTSETUP = 0x00000104;
enum DISPID_IADCCTL_ONDOMAIN = 0x00000105;
enum DISPID_IADCCTL_DEFAULTCAT = 0x00000106;
enum COPYENGINE_S_YES = 0x00270001;
enum COPYENGINE_S_NOT_HANDLED = 0x00270003;
enum COPYENGINE_S_USER_RETRY = 0x00270004;
enum COPYENGINE_S_USER_IGNORED = 0x00270005;
enum COPYENGINE_S_MERGE = 0x00270006;
enum COPYENGINE_S_DONT_PROCESS_CHILDREN = 0x00270008;
enum COPYENGINE_S_ALREADY_DONE = 0x0027000a;
enum COPYENGINE_S_PENDING = 0x0027000b;
enum COPYENGINE_S_KEEP_BOTH = 0x0027000c;
enum COPYENGINE_S_CLOSE_PROGRAM = 0x0027000d;
enum COPYENGINE_S_COLLISIONRESOLVED = 0x0027000e;
enum COPYENGINE_S_PROGRESS_PAUSE = 0x0027000f;
enum COPYENGINE_E_USER_CANCELLED = 0xffffffff80270000;
enum COPYENGINE_E_CANCELLED = 0xffffffff80270001;
enum COPYENGINE_E_REQUIRES_ELEVATION = 0xffffffff80270002;
enum COPYENGINE_E_SAME_FILE = 0xffffffff80270003;
enum COPYENGINE_E_DIFF_DIR = 0xffffffff80270004;
enum COPYENGINE_E_MANY_SRC_1_DEST = 0xffffffff80270005;
enum COPYENGINE_E_DEST_SUBTREE = 0xffffffff80270009;
enum COPYENGINE_E_DEST_SAME_TREE = 0xffffffff8027000a;
enum COPYENGINE_E_FLD_IS_FILE_DEST = 0xffffffff8027000b;
enum COPYENGINE_E_FILE_IS_FLD_DEST = 0xffffffff8027000c;
enum COPYENGINE_E_FILE_TOO_LARGE = 0xffffffff8027000d;
enum COPYENGINE_E_REMOVABLE_FULL = 0xffffffff8027000e;
enum COPYENGINE_E_DEST_IS_RO_CD = 0xffffffff8027000f;
enum COPYENGINE_E_DEST_IS_RW_CD = 0xffffffff80270010;
enum COPYENGINE_E_DEST_IS_R_CD = 0xffffffff80270011;
enum COPYENGINE_E_DEST_IS_RO_DVD = 0xffffffff80270012;
enum COPYENGINE_E_DEST_IS_RW_DVD = 0xffffffff80270013;
enum COPYENGINE_E_DEST_IS_R_DVD = 0xffffffff80270014;
enum COPYENGINE_E_SRC_IS_RO_CD = 0xffffffff80270015;
enum COPYENGINE_E_SRC_IS_RW_CD = 0xffffffff80270016;
enum COPYENGINE_E_SRC_IS_R_CD = 0xffffffff80270017;
enum COPYENGINE_E_SRC_IS_RO_DVD = 0xffffffff80270018;
enum COPYENGINE_E_SRC_IS_RW_DVD = 0xffffffff80270019;
enum COPYENGINE_E_SRC_IS_R_DVD = 0xffffffff8027001a;
enum COPYENGINE_E_INVALID_FILES_SRC = 0xffffffff8027001b;
enum COPYENGINE_E_INVALID_FILES_DEST = 0xffffffff8027001c;
enum COPYENGINE_E_PATH_TOO_DEEP_SRC = 0xffffffff8027001d;
enum COPYENGINE_E_PATH_TOO_DEEP_DEST = 0xffffffff8027001e;
enum COPYENGINE_E_ROOT_DIR_SRC = 0xffffffff8027001f;
enum COPYENGINE_E_ROOT_DIR_DEST = 0xffffffff80270020;
enum COPYENGINE_E_ACCESS_DENIED_SRC = 0xffffffff80270021;
enum COPYENGINE_E_ACCESS_DENIED_DEST = 0xffffffff80270022;
enum COPYENGINE_E_PATH_NOT_FOUND_SRC = 0xffffffff80270023;
enum COPYENGINE_E_PATH_NOT_FOUND_DEST = 0xffffffff80270024;
enum COPYENGINE_E_NET_DISCONNECT_SRC = 0xffffffff80270025;
enum COPYENGINE_E_NET_DISCONNECT_DEST = 0xffffffff80270026;
enum COPYENGINE_E_SHARING_VIOLATION_SRC = 0xffffffff80270027;
enum COPYENGINE_E_SHARING_VIOLATION_DEST = 0xffffffff80270028;
enum COPYENGINE_E_ALREADY_EXISTS_NORMAL = 0xffffffff80270029;
enum COPYENGINE_E_ALREADY_EXISTS_READONLY = 0xffffffff8027002a;
enum COPYENGINE_E_ALREADY_EXISTS_SYSTEM = 0xffffffff8027002b;
enum COPYENGINE_E_ALREADY_EXISTS_FOLDER = 0xffffffff8027002c;
enum COPYENGINE_E_STREAM_LOSS = 0xffffffff8027002d;
enum COPYENGINE_E_EA_LOSS = 0xffffffff8027002e;
enum COPYENGINE_E_PROPERTY_LOSS = 0xffffffff8027002f;
enum COPYENGINE_E_PROPERTIES_LOSS = 0xffffffff80270030;
enum COPYENGINE_E_ENCRYPTION_LOSS = 0xffffffff80270031;
enum COPYENGINE_E_DISK_FULL = 0xffffffff80270032;
enum COPYENGINE_E_DISK_FULL_CLEAN = 0xffffffff80270033;
enum COPYENGINE_E_EA_NOT_SUPPORTED = 0xffffffff80270034;
enum COPYENGINE_E_CANT_REACH_SOURCE = 0xffffffff80270035;
enum COPYENGINE_E_RECYCLE_UNKNOWN_ERROR = 0xffffffff80270035;
enum COPYENGINE_E_RECYCLE_FORCE_NUKE = 0xffffffff80270036;
enum COPYENGINE_E_RECYCLE_SIZE_TOO_BIG = 0xffffffff80270037;
enum COPYENGINE_E_RECYCLE_PATH_TOO_LONG = 0xffffffff80270038;
enum COPYENGINE_E_RECYCLE_BIN_NOT_FOUND = 0xffffffff8027003a;
enum COPYENGINE_E_NEWFILE_NAME_TOO_LONG = 0xffffffff8027003b;
enum COPYENGINE_E_NEWFOLDER_NAME_TOO_LONG = 0xffffffff8027003c;
enum COPYENGINE_E_DIR_NOT_EMPTY = 0xffffffff8027003d;
enum COPYENGINE_E_FAT_MAX_IN_ROOT = 0xffffffff8027003e;
enum COPYENGINE_E_ACCESSDENIED_READONLY = 0xffffffff8027003f;
enum COPYENGINE_E_REDIRECTED_TO_WEBPAGE = 0xffffffff80270040;
enum COPYENGINE_E_SERVER_BAD_FILE_TYPE = 0xffffffff80270041;
enum COPYENGINE_E_INTERNET_ITEM_UNAVAILABLE = 0xffffffff80270042;
enum COPYENGINE_E_CANNOT_MOVE_FROM_RECYCLE_BIN = 0xffffffff80270043;
enum COPYENGINE_E_CANNOT_MOVE_SHARED_FOLDER = 0xffffffff80270044;
enum COPYENGINE_E_INTERNET_ITEM_STORAGE_PROVIDER_ERROR = 0xffffffff80270045;
enum COPYENGINE_E_INTERNET_ITEM_STORAGE_PROVIDER_PAUSED = 0xffffffff80270046;
enum COPYENGINE_E_REQUIRES_EDP_CONSENT = 0xffffffff80270047;
enum COPYENGINE_E_BLOCKED_BY_EDP_POLICY = 0xffffffff80270048;
enum COPYENGINE_E_REQUIRES_EDP_CONSENT_FOR_REMOVABLE_DRIVE = 0xffffffff80270049;
enum COPYENGINE_E_BLOCKED_BY_EDP_FOR_REMOVABLE_DRIVE = 0xffffffff8027004a;
enum COPYENGINE_E_RMS_REQUIRES_EDP_CONSENT_FOR_REMOVABLE_DRIVE = 0xffffffff8027004b;
enum COPYENGINE_E_RMS_BLOCKED_BY_EDP_FOR_REMOVABLE_DRIVE = 0xffffffff8027004c;
enum COPYENGINE_E_WARNED_BY_DLP_POLICY = 0xffffffff8027004d;
enum COPYENGINE_E_BLOCKED_BY_DLP_POLICY = 0xffffffff8027004e;
enum COPYENGINE_E_SILENT_FAIL_BY_DLP_POLICY = 0xffffffff8027004f;
enum NETCACHE_E_NEGATIVE_CACHE = 0xffffffff80270100;
enum EXECUTE_E_LAUNCH_APPLICATION = 0xffffffff80270101;
enum SHELL_E_WRONG_BITDEPTH = 0xffffffff80270102;
enum LINK_E_DELETE = 0xffffffff80270103;
enum STORE_E_NEWER_VERSION_AVAILABLE = 0xffffffff80270104;
enum E_FILE_PLACEHOLDER_NOT_INITIALIZED = 0xffffffff80270110;
enum E_FILE_PLACEHOLDER_VERSION_MISMATCH = 0xffffffff80270111;
enum E_FILE_PLACEHOLDER_SERVER_TIMED_OUT = 0xffffffff80270112;
enum E_FILE_PLACEHOLDER_STORAGEPROVIDER_NOT_FOUND = 0xffffffff80270113;
enum CAMERAROLL_E_NO_DOWNSAMPLING_REQUIRED = 0xffffffff80270120;
enum E_ACTIVATIONDENIED_USERCLOSE = 0xffffffff80270130;
enum E_ACTIVATIONDENIED_SHELLERROR = 0xffffffff80270131;
enum E_ACTIVATIONDENIED_SHELLRESTART = 0xffffffff80270132;
enum E_ACTIVATIONDENIED_UNEXPECTED = 0xffffffff80270133;
enum E_ACTIVATIONDENIED_SHELLNOTREADY = 0xffffffff80270134;
enum LIBRARY_E_NO_SAVE_LOCATION = 0xffffffff80270200;
enum LIBRARY_E_NO_ACCESSIBLE_LOCATION = 0xffffffff80270201;
enum E_USERTILE_UNSUPPORTEDFILETYPE = 0xffffffff80270210;
enum E_USERTILE_CHANGEDISABLED = 0xffffffff80270211;
enum E_USERTILE_LARGEORDYNAMIC = 0xffffffff80270212;
enum E_USERTILE_VIDEOFRAMESIZE = 0xffffffff80270213;
enum E_USERTILE_FILESIZE = 0xffffffff80270214;
enum IMM_ACC_DOCKING_E_INSUFFICIENTHEIGHT = 0xffffffff80270230;
enum IMM_ACC_DOCKING_E_DOCKOCCUPIED = 0xffffffff80270231;
enum IMSC_E_SHELL_COMPONENT_STARTUP_FAILURE = 0xffffffff80270233;
enum SHC_E_SHELL_COMPONENT_STARTUP_FAILURE = 0xffffffff80270234;
enum E_TILE_NOTIFICATIONS_PLATFORM_FAILURE = 0xffffffff80270249;
enum E_SHELL_EXTENSION_BLOCKED = 0xffffffff80270301;
enum E_IMAGEFEED_CHANGEDISABLED = 0xffffffff80270310;
enum GPFIDL_DEFAULT = 0x00000000;
enum GPFIDL_ALTNAME = 0x00000001;
enum GPFIDL_UNCPRINTER = 0x00000002;
enum ISHCUTCMDID_DOWNLOADICON = 0x00000000;
enum ISHCUTCMDID_INTSHORTCUTCREATE = 0x00000001;
enum ISHCUTCMDID_COMMITHISTORY = 0x00000002;
enum ISHCUTCMDID_SETUSERAWURL = 0x00000003;
enum SFBID_PIDLCHANGED = 0x00000000;
enum DBCID_EMPTY = 0x00000000;
enum DBCID_ONDRAG = 0x00000001;
enum DBCID_CLSIDOFBAR = 0x00000002;
enum DBCID_RESIZE = 0x00000003;
enum DBCID_GETBAR = 0x00000004;
enum DBCID_UPDATESIZE = 0x00000005;
enum BMICON_LARGE = 0x00000000;
enum BMICON_SMALL = 0x00000001;
enum ASSOCF_NONE = 0x00000000;
enum ASSOCF_INIT_NOREMAPCLSID = 0x00000001;
enum ASSOCF_INIT_BYEXENAME = 0x00000002;
enum ASSOCF_OPEN_BYEXENAME = 0x00000002;
enum ASSOCF_INIT_DEFAULTTOSTAR = 0x00000004;
enum ASSOCF_INIT_DEFAULTTOFOLDER = 0x00000008;
enum ASSOCF_NOUSERSETTINGS = 0x00000010;
enum ASSOCF_NOTRUNCATE = 0x00000020;
enum ASSOCF_VERIFY = 0x00000040;
enum ASSOCF_REMAPRUNDLL = 0x00000080;
enum ASSOCF_NOFIXUPS = 0x00000100;
enum ASSOCF_IGNOREBASECLASS = 0x00000200;
enum ASSOCF_INIT_IGNOREUNKNOWN = 0x00000400;
enum ASSOCF_INIT_FIXED_PROGID = 0x00000800;
enum ASSOCF_IS_PROTOCOL = 0x00001000;
enum ASSOCF_INIT_FOR_FILE = 0x00002000;
enum ASSOCF_IS_FULL_URI = 0x00004000;
enum ASSOCF_PER_MACHINE_ONLY = 0x00008000;
enum ASSOCF_APP_TO_APP = 0x00010000;
enum CTF_INSIST = 0x00000001;
enum CTF_THREAD_REF = 0x00000002;
enum CTF_PROCESS_REF = 0x00000004;
enum CTF_COINIT_STA = 0x00000008;
enum CTF_COINIT = 0x00000008;
enum CTF_FREELIBANDEXIT = 0x00000010;
enum CTF_REF_COUNTED = 0x00000020;
enum CTF_WAIT_ALLOWCOM = 0x00000040;
enum CTF_UNUSED = 0x00000080;
enum CTF_INHERITWOW64 = 0x00000100;
enum CTF_WAIT_NO_REENTRANCY = 0x00000200;
enum CTF_KEYBOARD_LOCALE = 0x00000400;
enum CTF_OLEINITIALIZE = 0x00000800;
enum CTF_COINIT_MTA = 0x00001000;
enum CTF_NOADDREFLIB = 0x00002000;
alias SHGFI_FLAGS = int;
enum : int
{
    SHGFI_ADDOVERLAYS       = 0x00000020,
    SHGFI_ATTR_SPECIFIED    = 0x00020000,
    SHGFI_ATTRIBUTES        = 0x00000800,
    SHGFI_DISPLAYNAME       = 0x00000200,
    SHGFI_EXETYPE           = 0x00002000,
    SHGFI_ICON              = 0x00000100,
    SHGFI_ICONLOCATION      = 0x00001000,
    SHGFI_LARGEICON         = 0x00000000,
    SHGFI_LINKOVERLAY       = 0x00008000,
    SHGFI_OPENICON          = 0x00000002,
    SHGFI_OVERLAYINDEX      = 0x00000040,
    SHGFI_PIDL              = 0x00000008,
    SHGFI_SELECTED          = 0x00010000,
    SHGFI_SHELLICONSIZE     = 0x00000004,
    SHGFI_SMALLICON         = 0x00000001,
    SHGFI_SYSICONINDEX      = 0x00004000,
    SHGFI_TYPENAME          = 0x00000400,
    SHGFI_USEFILEATTRIBUTES = 0x00000010,
}

alias SHCNE_ID = uint;
enum : uint
{
    SHCNE_RENAMEITEM       = 0x00000001,
    SHCNE_CREATE           = 0x00000002,
    SHCNE_DELETE           = 0x00000004,
    SHCNE_MKDIR            = 0x00000008,
    SHCNE_RMDIR            = 0x00000010,
    SHCNE_MEDIAINSERTED    = 0x00000020,
    SHCNE_MEDIAREMOVED     = 0x00000040,
    SHCNE_DRIVEREMOVED     = 0x00000080,
    SHCNE_DRIVEADD         = 0x00000100,
    SHCNE_NETSHARE         = 0x00000200,
    SHCNE_NETUNSHARE       = 0x00000400,
    SHCNE_ATTRIBUTES       = 0x00000800,
    SHCNE_UPDATEDIR        = 0x00001000,
    SHCNE_UPDATEITEM       = 0x00002000,
    SHCNE_SERVERDISCONNECT = 0x00004000,
    SHCNE_UPDATEIMAGE      = 0x00008000,
    SHCNE_DRIVEADDGUI      = 0x00010000,
    SHCNE_RENAMEFOLDER     = 0x00020000,
    SHCNE_FREESPACE        = 0x00040000,
    SHCNE_EXTENDED_EVENT   = 0x04000000,
    SHCNE_ASSOCCHANGED     = 0x08000000,
    SHCNE_DISKEVENTS       = 0x0002381f,
    SHCNE_GLOBALEVENTS     = 0x0c0581e0,
    SHCNE_ALLEVENTS        = 0x7fffffff,
    SHCNE_INTERRUPT        = 0x80000000,
}

alias SHCNRF_SOURCE = int;
enum : int
{
    SHCNRF_InterruptLevel     = 0x00000001,
    SHCNRF_ShellLevel         = 0x00000002,
    SHCNRF_RecursiveInterrupt = 0x00001000,
    SHCNRF_NewDelivery        = 0x00008000,
}

alias SHCNF_FLAGS = uint;
enum : uint
{
    SHCNF_IDLIST          = 0x00000000,
    SHCNF_PATHA           = 0x00000001,
    SHCNF_PRINTERA        = 0x00000002,
    SHCNF_DWORD           = 0x00000003,
    SHCNF_PATHW           = 0x00000005,
    SHCNF_PRINTERW        = 0x00000006,
    SHCNF_TYPE            = 0x000000ff,
    SHCNF_FLUSH           = 0x00001000,
    SHCNF_FLUSHNOWAIT     = 0x00003000,
    SHCNF_NOTIFYRECURSIVE = 0x00010000,
    SHCNF_PATH            = 0x00000005,
    SHCNF_PRINTER         = 0x00000006,
}

alias QITIPF_FLAGS = int;
enum : int
{
    QITIPF_DEFAULT       = 0x00000000,
    QITIPF_USENAME       = 0x00000001,
    QITIPF_LINKNOTARGET  = 0x00000002,
    QITIPF_LINKUSETARGET = 0x00000004,
    QITIPF_USESLOWTIP    = 0x00000008,
    QITIPF_SINGLELINE    = 0x00000010,
    QIF_CACHED           = 0x00000001,
    QIF_DONTEXPANDFOLDER = 0x00000002,
}

alias SHDID_ID = int;
enum : int
{
    SHDID_ROOT_REGITEM         = 0x00000001,
    SHDID_FS_FILE              = 0x00000002,
    SHDID_FS_DIRECTORY         = 0x00000003,
    SHDID_FS_OTHER             = 0x00000004,
    SHDID_COMPUTER_DRIVE35     = 0x00000005,
    SHDID_COMPUTER_DRIVE525    = 0x00000006,
    SHDID_COMPUTER_REMOVABLE   = 0x00000007,
    SHDID_COMPUTER_FIXED       = 0x00000008,
    SHDID_COMPUTER_NETDRIVE    = 0x00000009,
    SHDID_COMPUTER_CDROM       = 0x0000000a,
    SHDID_COMPUTER_RAMDISK     = 0x0000000b,
    SHDID_COMPUTER_OTHER       = 0x0000000c,
    SHDID_NET_DOMAIN           = 0x0000000d,
    SHDID_NET_SERVER           = 0x0000000e,
    SHDID_NET_SHARE            = 0x0000000f,
    SHDID_NET_RESTOFNET        = 0x00000010,
    SHDID_NET_OTHER            = 0x00000011,
    SHDID_COMPUTER_IMAGING     = 0x00000012,
    SHDID_COMPUTER_AUDIO       = 0x00000013,
    SHDID_COMPUTER_SHAREDDOCS  = 0x00000014,
    SHDID_MOBILE_DEVICE        = 0x00000015,
    SHDID_REMOTE_DESKTOP_DRIVE = 0x00000016,
}

alias SHGDFIL_FORMAT = int;
enum : int
{
    SHGDFIL_FINDDATA      = 0x00000001,
    SHGDFIL_NETRESOURCE   = 0x00000002,
    SHGDFIL_DESCRIPTIONID = 0x00000003,
}

alias PRF_FLAGS = int;
enum : int
{
    PRF_VERIFYEXISTS         = 0x00000001,
    PRF_TRYPROGRAMEXTENSIONS = 0x00000003,
    PRF_FIRSTDIRDEF          = 0x00000004,
    PRF_DONTFINDLNK          = 0x00000008,
    PRF_REQUIREABSOLUTE      = 0x00000010,
}

alias PCS_RET = uint;
enum : uint
{
    PCS_FATAL        = 0x80000000,
    PCS_REPLACEDCHAR = 0x00000001,
    PCS_REMOVEDCHAR  = 0x00000002,
    PCS_TRUNCATED    = 0x00000004,
    PCS_PATHTOOLONG  = 0x00000008,
}

alias MM_FLAGS = uint;
enum : uint
{
    MM_ADDSEPARATOR    = 0x00000001,
    MM_SUBMENUSHAVEIDS = 0x00000002,
    MM_DONTREMOVESEPS  = 0x00000004,
}

alias SHOP_TYPE = int;
enum : int
{
    SHOP_PRINTERNAME = 0x00000001,
    SHOP_FILEPATH    = 0x00000002,
    SHOP_VOLUMEGUID  = 0x00000004,
}

alias SHFMT_ID = uint;
enum : uint
{
    SHFMT_ID_DEFAULT = 0x0000ffff,
}

alias SHFMT_OPT = int;
enum : int
{
    SHFMT_OPT_NONE    = 0x00000000,
    SHFMT_OPT_FULL    = 0x00000001,
    SHFMT_OPT_SYSONLY = 0x00000002,
}

alias SHFMT_RET = uint;
enum : uint
{
    SHFMT_ERROR    = 0xffffffff,
    SHFMT_CANCEL   = 0xfffffffe,
    SHFMT_NOFORMAT = 0xfffffffd,
}

alias VALIDATEUNC_OPTION = int;
enum : int
{
    VALIDATEUNC_CONNECT = 0x00000001,
    VALIDATEUNC_NOUI    = 0x00000002,
    VALIDATEUNC_PRINT   = 0x00000004,
    VALIDATEUNC_PERSIST = 0x00000008,
    VALIDATEUNC_VALID   = 0x0000000f,
}

alias SFVM_MESSAGE_ID = int;
enum : int
{
    SFVM_MERGEMENU          = 0x00000001,
    SFVM_INVOKECOMMAND      = 0x00000002,
    SFVM_GETHELPTEXT        = 0x00000003,
    SFVM_GETTOOLTIPTEXT     = 0x00000004,
    SFVM_GETBUTTONINFO      = 0x00000005,
    SFVM_GETBUTTONS         = 0x00000006,
    SFVM_INITMENUPOPUP      = 0x00000007,
    SFVM_FSNOTIFY           = 0x0000000e,
    SFVM_WINDOWCREATED      = 0x0000000f,
    SFVM_GETDETAILSOF       = 0x00000017,
    SFVM_COLUMNCLICK        = 0x00000018,
    SFVM_QUERYFSNOTIFY      = 0x00000019,
    SFVM_DEFITEMCOUNT       = 0x0000001a,
    SFVM_DEFVIEWMODE        = 0x0000001b,
    SFVM_UNMERGEMENU        = 0x0000001c,
    SFVM_UPDATESTATUSBAR    = 0x0000001f,
    SFVM_BACKGROUNDENUM     = 0x00000020,
    SFVM_DIDDRAGDROP        = 0x00000024,
    SFVM_SETISFV            = 0x00000027,
    SFVM_THISIDLIST         = 0x00000029,
    SFVM_ADDPROPERTYPAGES   = 0x0000002f,
    SFVM_BACKGROUNDENUMDONE = 0x00000030,
    SFVM_GETNOTIFY          = 0x00000031,
    SFVM_GETSORTDEFAULTS    = 0x00000035,
    SFVM_SIZE               = 0x00000039,
    SFVM_GETZONE            = 0x0000003a,
    SFVM_GETPANE            = 0x0000003b,
    SFVM_GETHELPTOPIC       = 0x0000003f,
    SFVM_GETANIMATION       = 0x00000044,
}

alias SFVS_SELECT = int;
enum : int
{
    SFVS_SELECT_NONE     = 0x00000000,
    SFVS_SELECT_ALLITEMS = 0x00000001,
    SFVS_SELECT_INVERT   = 0x00000002,
}

alias DFM_MESSAGE_ID = int;
enum : int
{
    DFM_MERGECONTEXTMENU        = 0x00000001,
    DFM_INVOKECOMMAND           = 0x00000002,
    DFM_GETHELPTEXT             = 0x00000005,
    DFM_WM_MEASUREITEM          = 0x00000006,
    DFM_WM_DRAWITEM             = 0x00000007,
    DFM_WM_INITMENUPOPUP        = 0x00000008,
    DFM_VALIDATECMD             = 0x00000009,
    DFM_MERGECONTEXTMENU_TOP    = 0x0000000a,
    DFM_GETHELPTEXTW            = 0x0000000b,
    DFM_INVOKECOMMANDEX         = 0x0000000c,
    DFM_MAPCOMMANDNAME          = 0x0000000d,
    DFM_GETDEFSTATICID          = 0x0000000e,
    DFM_GETVERBW                = 0x0000000f,
    DFM_GETVERBA                = 0x00000010,
    DFM_MERGECONTEXTMENU_BOTTOM = 0x00000011,
    DFM_MODIFYQCMFLAGS          = 0x00000012,
}

alias DFM_CMD = int;
enum : int
{
    DFM_CMD_DELETE       = 0xffffffff,
    DFM_CMD_MOVE         = 0xfffffffe,
    DFM_CMD_COPY         = 0xfffffffd,
    DFM_CMD_LINK         = 0xfffffffc,
    DFM_CMD_PROPERTIES   = 0xfffffffb,
    DFM_CMD_NEWFOLDER    = 0xfffffffa,
    DFM_CMD_PASTE        = 0xfffffff9,
    DFM_CMD_VIEWLIST     = 0xfffffff8,
    DFM_CMD_VIEWDETAILS  = 0xfffffff7,
    DFM_CMD_PASTELINK    = 0xfffffff6,
    DFM_CMD_PASTESPECIAL = 0xfffffff5,
    DFM_CMD_MODALPROP    = 0xfffffff4,
    DFM_CMD_RENAME       = 0xfffffff3,
}

alias PID_IS = int;
enum : int
{
    PID_IS_URL         = 0x00000002,
    PID_IS_NAME        = 0x00000004,
    PID_IS_WORKINGDIR  = 0x00000005,
    PID_IS_HOTKEY      = 0x00000006,
    PID_IS_SHOWCMD     = 0x00000007,
    PID_IS_ICONINDEX   = 0x00000008,
    PID_IS_ICONFILE    = 0x00000009,
    PID_IS_WHATSNEW    = 0x0000000a,
    PID_IS_AUTHOR      = 0x0000000b,
    PID_IS_DESCRIPTION = 0x0000000c,
    PID_IS_COMMENT     = 0x0000000d,
    PID_IS_ROAMED      = 0x0000000f,
}

alias PID_INTSITE = int;
enum : int
{
    PID_INTSITE_WHATSNEW     = 0x00000002,
    PID_INTSITE_AUTHOR       = 0x00000003,
    PID_INTSITE_LASTVISIT    = 0x00000004,
    PID_INTSITE_LASTMOD      = 0x00000005,
    PID_INTSITE_VISITCOUNT   = 0x00000006,
    PID_INTSITE_DESCRIPTION  = 0x00000007,
    PID_INTSITE_COMMENT      = 0x00000008,
    PID_INTSITE_FLAGS        = 0x00000009,
    PID_INTSITE_CONTENTLEN   = 0x0000000a,
    PID_INTSITE_CONTENTCODE  = 0x0000000b,
    PID_INTSITE_RECURSE      = 0x0000000c,
    PID_INTSITE_WATCH        = 0x0000000d,
    PID_INTSITE_SUBSCRIPTION = 0x0000000e,
    PID_INTSITE_URL          = 0x0000000f,
    PID_INTSITE_TITLE        = 0x00000010,
    PID_INTSITE_CODEPAGE     = 0x00000012,
    PID_INTSITE_TRACKING     = 0x00000013,
    PID_INTSITE_ICONINDEX    = 0x00000014,
    PID_INTSITE_ICONFILE     = 0x00000015,
    PID_INTSITE_ROAMED       = 0x00000022,
}

alias PIDISF_FLAGS = int;
enum : int
{
    PIDISF_RECENTLYCHANGED = 0x00000001,
    PIDISF_CACHEDSTICKY    = 0x00000002,
    PIDISF_CACHEIMAGES     = 0x00000010,
    PIDISF_FOLLOWALLLINKS  = 0x00000020,
}

alias PIDISM_OPTIONS = int;
enum : int
{
    PIDISM_GLOBAL    = 0x00000000,
    PIDISM_WATCH     = 0x00000001,
    PIDISM_DONTWATCH = 0x00000002,
}

alias PIDISR_INFO = int;
enum : int
{
    PIDISR_UP_TO_DATE   = 0x00000000,
    PIDISR_NEEDS_ADD    = 0x00000001,
    PIDISR_NEEDS_UPDATE = 0x00000002,
    PIDISR_NEEDS_DELETE = 0x00000003,
}

alias SSF_MASK = uint;
enum : uint
{
    SSF_SHOWALLOBJECTS       = 0x00000001,
    SSF_SHOWEXTENSIONS       = 0x00000002,
    SSF_HIDDENFILEEXTS       = 0x00000004,
    SSF_SERVERADMINUI        = 0x00000004,
    SSF_SHOWCOMPCOLOR        = 0x00000008,
    SSF_SORTCOLUMNS          = 0x00000010,
    SSF_SHOWSYSFILES         = 0x00000020,
    SSF_DOUBLECLICKINWEBVIEW = 0x00000080,
    SSF_SHOWATTRIBCOL        = 0x00000100,
    SSF_DESKTOPHTML          = 0x00000200,
    SSF_WIN95CLASSIC         = 0x00000400,
    SSF_DONTPRETTYPATH       = 0x00000800,
    SSF_SHOWINFOTIP          = 0x00002000,
    SSF_MAPNETDRVBUTTON      = 0x00001000,
    SSF_NOCONFIRMRECYCLE     = 0x00008000,
    SSF_HIDEICONS            = 0x00004000,
    SSF_FILTER               = 0x00010000,
    SSF_WEBVIEW              = 0x00020000,
    SSF_SHOWSUPERHIDDEN      = 0x00040000,
    SSF_SEPPROCESS           = 0x00080000,
    SSF_NONETCRAWLING        = 0x00100000,
    SSF_STARTPANELON         = 0x00200000,
    SSF_SHOWSTARTPAGE        = 0x00400000,
    SSF_AUTOCHECKSELECT      = 0x00800000,
    SSF_ICONSONLY            = 0x01000000,
    SSF_SHOWTYPEOVERLAY      = 0x02000000,
    SSF_SHOWSTATUSBAR        = 0x04000000,
}

alias NOTIFY_ICON_MESSAGE = uint;
enum : uint
{
    NIM_ADD        = 0x00000000,
    NIM_MODIFY     = 0x00000001,
    NIM_DELETE     = 0x00000002,
    NIM_SETFOCUS   = 0x00000003,
    NIM_SETVERSION = 0x00000004,
}

alias NOTIFY_ICON_DATA_FLAGS = uint;
enum : uint
{
    NIF_MESSAGE  = 0x00000001,
    NIF_ICON     = 0x00000002,
    NIF_TIP      = 0x00000004,
    NIF_STATE    = 0x00000008,
    NIF_INFO     = 0x00000010,
    NIF_GUID     = 0x00000020,
    NIF_REALTIME = 0x00000040,
    NIF_SHOWTIP  = 0x00000080,
}

alias OS = uint;
enum : uint
{
    OS_WINDOWS                = 0x00000000,
    OS_NT                     = 0x00000001,
    OS_WIN95ORGREATER         = 0x00000002,
    OS_NT4ORGREATER           = 0x00000003,
    OS_WIN98ORGREATER         = 0x00000005,
    OS_WIN98_GOLD             = 0x00000006,
    OS_WIN2000ORGREATER       = 0x00000007,
    OS_WIN2000PRO             = 0x00000008,
    OS_WIN2000SERVER          = 0x00000009,
    OS_WIN2000ADVSERVER       = 0x0000000a,
    OS_WIN2000DATACENTER      = 0x0000000b,
    OS_WIN2000TERMINAL        = 0x0000000c,
    OS_EMBEDDED               = 0x0000000d,
    OS_TERMINALCLIENT         = 0x0000000e,
    OS_TERMINALREMOTEADMIN    = 0x0000000f,
    OS_WIN95_GOLD             = 0x00000010,
    OS_MEORGREATER            = 0x00000011,
    OS_XPORGREATER            = 0x00000012,
    OS_HOME                   = 0x00000013,
    OS_PROFESSIONAL           = 0x00000014,
    OS_DATACENTER             = 0x00000015,
    OS_ADVSERVER              = 0x00000016,
    OS_SERVER                 = 0x00000017,
    OS_TERMINALSERVER         = 0x00000018,
    OS_PERSONALTERMINALSERVER = 0x00000019,
    OS_FASTUSERSWITCHING      = 0x0000001a,
    OS_WELCOMELOGONUI         = 0x0000001b,
    OS_DOMAINMEMBER           = 0x0000001c,
    OS_ANYSERVER              = 0x0000001d,
    OS_WOW6432                = 0x0000001e,
    OS_WEBSERVER              = 0x0000001f,
    OS_SMALLBUSINESSSERVER    = 0x00000020,
    OS_TABLETPC               = 0x00000021,
    OS_SERVERADMINUI          = 0x00000022,
    OS_MEDIACENTER            = 0x00000023,
    OS_APPLIANCE              = 0x00000024,
}

alias SHELL_AUTOCOMPLETE_FLAGS = uint;
enum : uint
{
    SHACF_DEFAULT               = 0x00000000,
    SHACF_FILESYSTEM            = 0x00000001,
    SHACF_URLALL                = 0x00000006,
    SHACF_URLHISTORY            = 0x00000002,
    SHACF_URLMRU                = 0x00000004,
    SHACF_USETAB                = 0x00000008,
    SHACF_FILESYS_ONLY          = 0x00000010,
    SHACF_FILESYS_DIRS          = 0x00000020,
    SHACF_VIRTUAL_NAMESPACE     = 0x00000040,
    SHACF_AUTOSUGGEST_FORCE_ON  = 0x10000000,
    SHACF_AUTOSUGGEST_FORCE_OFF = 0x20000000,
    SHACF_AUTOAPPEND_FORCE_ON   = 0x40000000,
    SHACF_AUTOAPPEND_FORCE_OFF  = 0x80000000,
}

struct _APPSTATE_REGISTRATION
{
}
struct _APPCONSTRAIN_REGISTRATION
{
}
alias ShFindChangeNotificationHandle = long;
alias HDROP = void*;
alias HPSXA = void*;
enum IID_INotifyReplica = GUID(0x99180163, 0xda16, 0x101a, [0x93, 0x5c, 0x44, 0x45, 0x53, 0x54, 0x0, 0x0]);
interface INotifyReplica : IUnknown
{
    HRESULT YouAreAReplica(uint, IMoniker*);
}
struct APPCATEGORYINFO
{
    uint Locale;
    PWSTR pszDescription;
    GUID AppCategoryId;
}
struct APPCATEGORYINFOLIST
{
    uint cCategory;
    APPCATEGORYINFO* pCategoryInfo;
}
alias SUBCLASSPROC = LRESULT function(HWND, uint, WPARAM, LPARAM, ulong, ulong);
struct HELPINFO
{
    uint cbSize;
    int iContextType;
    int iCtrlId;
    HANDLE hItemHandle;
    ulong dwContextId;
    POINT MousePos;
}
struct MULTIKEYHELPA
{
    uint mkSize;
    CHAR mkKeylist;
    CHAR[1] szKeyphrase;
}
struct MULTIKEYHELPW
{
    uint mkSize;
    wchar mkKeylist;
    wchar[1] szKeyphrase;
}
struct HELPWININFOA
{
    int wStructSize;
    int x;
    int y;
    int dx;
    int dy;
    int wMax;
    CHAR[2] rgchMember;
}
struct HELPWININFOW
{
    int wStructSize;
    int x;
    int y;
    int dx;
    int dy;
    int wMax;
    wchar[2] rgchMember;
}
enum CLSID_QueryCancelAutoPlay = GUID(0x331f1768, 0x5a9, 0x4ddd, [0xb8, 0x6e, 0xda, 0xe3, 0x4d, 0xdc, 0x99, 0x8a]);
struct QueryCancelAutoPlay
{
}
enum CLSID_TimeCategorizer = GUID(0x3bb4118f, 0xddfd, 0x4d30, [0xa3, 0x48, 0x9f, 0xb5, 0xd6, 0xbf, 0x1a, 0xfe]);
struct TimeCategorizer
{
}
enum CLSID_AlphabeticalCategorizer = GUID(0x3c2654c6, 0x7372, 0x4f6b, [0xb3, 0x10, 0x55, 0xd6, 0x12, 0x8f, 0x49, 0xd2]);
struct AlphabeticalCategorizer
{
}
enum CLSID_MergedCategorizer = GUID(0x8e827c11, 0x33e7, 0x4bc1, [0xb2, 0x42, 0x8c, 0xd9, 0xa1, 0xc2, 0xb3, 0x4]);
struct MergedCategorizer
{
}
enum CLSID_ImageProperties = GUID(0x7ab770c7, 0xe23, 0x4d7a, [0x8a, 0xa2, 0x19, 0xbf, 0xad, 0x47, 0x98, 0x29]);
struct ImageProperties
{
}
enum CLSID_CDBurn = GUID(0xfbeb8a05, 0xbeee, 0x4442, [0x80, 0x4e, 0x40, 0x9d, 0x6c, 0x45, 0x15, 0xe9]);
struct CDBurn
{
}
enum CLSID_StartMenuPin = GUID(0xa2a9545d, 0xa0c2, 0x42b4, [0x97, 0x8, 0xa0, 0xb2, 0xba, 0xdd, 0x77, 0xc8]);
struct StartMenuPin
{
}
enum CLSID_WebWizardHost = GUID(0xc827f149, 0x55c1, 0x4d28, [0x93, 0x5e, 0x57, 0xe4, 0x7c, 0xae, 0xd9, 0x73]);
struct WebWizardHost
{
}
enum CLSID_PublishDropTarget = GUID(0xcc6eeffb, 0x43f6, 0x46c5, [0x96, 0x19, 0x51, 0xd5, 0x71, 0x96, 0x7f, 0x7d]);
struct PublishDropTarget
{
}
enum CLSID_PublishingWizard = GUID(0x6b33163c, 0x76a5, 0x4b6c, [0xbf, 0x21, 0x45, 0xde, 0x9c, 0xd5, 0x3, 0xa1]);
struct PublishingWizard
{
}
enum CLSID_InternetPrintOrdering = GUID(0xadd36aa8, 0x751a, 0x4579, [0xa2, 0x66, 0xd6, 0x6f, 0x52, 0x2, 0xcc, 0xbb]);
struct InternetPrintOrdering
{
}
enum CLSID_FolderViewHost = GUID(0x20b1cb23, 0x6968, 0x4eb9, [0xb7, 0xd4, 0xa6, 0x6d, 0x0, 0xd0, 0x7c, 0xee]);
struct FolderViewHost
{
}
enum CLSID_ExplorerBrowser = GUID(0x71f96385, 0xddd6, 0x48d3, [0xa0, 0xc1, 0xae, 0x6, 0xe8, 0xb0, 0x55, 0xfb]);
struct ExplorerBrowser
{
}
enum CLSID_ImageRecompress = GUID(0x6e33091c, 0xd2f8, 0x4740, [0xb5, 0x5e, 0x2e, 0x11, 0xd1, 0x47, 0x7a, 0x2c]);
struct ImageRecompress
{
}
enum CLSID_TrayBandSiteService = GUID(0xf60ad0a0, 0xe5e1, 0x45cb, [0xb5, 0x1a, 0xe1, 0x5b, 0x9f, 0x8b, 0x29, 0x34]);
struct TrayBandSiteService
{
}
enum CLSID_TrayDeskBand = GUID(0xe6442437, 0x6c68, 0x4f52, [0x94, 0xdd, 0x2c, 0xfe, 0xd2, 0x67, 0xef, 0xb9]);
struct TrayDeskBand
{
}
enum CLSID_AttachmentServices = GUID(0x4125dd96, 0xe03a, 0x4103, [0x8f, 0x70, 0xe0, 0x59, 0x7d, 0x80, 0x3b, 0x9c]);
struct AttachmentServices
{
}
enum CLSID_DocPropShellExtension = GUID(0x883373c3, 0xbf89, 0x11d1, [0xbe, 0x35, 0x8, 0x0, 0x36, 0xb1, 0x1a, 0x3]);
struct DocPropShellExtension
{
}
enum CLSID_FSCopyHandler = GUID(0xd197380a, 0xa79, 0x4dc8, [0xa0, 0x33, 0xed, 0x88, 0x2c, 0x2f, 0xa1, 0x4b]);
struct FSCopyHandler
{
}
enum CLSID_PreviousVersions = GUID(0x596ab062, 0xb4d2, 0x4215, [0x9f, 0x74, 0xe9, 0x10, 0x9b, 0xa, 0x81, 0x53]);
struct PreviousVersions
{
}
enum CLSID_NamespaceTreeControl = GUID(0xae054212, 0x3535, 0x4430, [0x83, 0xed, 0xd5, 0x1, 0xaa, 0x66, 0x80, 0xe6]);
struct NamespaceTreeControl
{
}
enum CLSID_IENamespaceTreeControl = GUID(0xace52d03, 0xe5cd, 0x4b20, [0x82, 0xff, 0xe7, 0x1b, 0x11, 0xbe, 0xae, 0x1d]);
struct IENamespaceTreeControl
{
}
enum CLSID_ApplicationAssociationRegistrationUI = GUID(0x1968106d, 0xf3b5, 0x44cf, [0x89, 0xe, 0x11, 0x6f, 0xcb, 0x9e, 0xce, 0xf1]);
struct ApplicationAssociationRegistrationUI
{
}
enum CLSID_DesktopGadget = GUID(0x924ccc1b, 0x6562, 0x4c85, [0x86, 0x57, 0xd1, 0x77, 0x92, 0x52, 0x22, 0xb6]);
struct DesktopGadget
{
}
enum CLSID_AccessibilityDockingService = GUID(0x29ce1d46, 0xb481, 0x4aa0, [0xa0, 0x8a, 0xd3, 0xeb, 0xc8, 0xac, 0xa4, 0x2]);
struct AccessibilityDockingService
{
}
enum CLSID_ExecuteFolder = GUID(0x11dbb47c, 0xa525, 0x400b, [0x9e, 0x80, 0xa5, 0x46, 0x15, 0xa0, 0x90, 0xc0]);
struct ExecuteFolder
{
}
enum CLSID_VirtualDesktopManager = GUID(0xaa509086, 0x5ca9, 0x4c25, [0x8f, 0x95, 0x58, 0x9d, 0x3c, 0x7, 0xb4, 0x8a]);
struct VirtualDesktopManager
{
}
enum CLSID_StorageProviderBanners = GUID(0x7ccdf9f4, 0xe576, 0x455a, [0x8b, 0xc7, 0xf6, 0xec, 0x68, 0xd6, 0xf0, 0x63]);
struct StorageProviderBanners
{
}
enum CLSID_DesktopWallpaper = GUID(0xc2cf3110, 0x460e, 0x4fc1, [0xb9, 0xd0, 0x8a, 0x1c, 0xc, 0x9c, 0xc4, 0xbd]);
struct DesktopWallpaper
{
}
enum CLSID_ShellDesktop = GUID(0x21400, 0x0, 0x0, [0xc0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x46]);
struct ShellDesktop
{
}
enum CLSID_ShellFSFolder = GUID(0xf3364ba0, 0x65b9, 0x11ce, [0xa9, 0xba, 0x0, 0xaa, 0x0, 0x4a, 0xe8, 0x37]);
struct ShellFSFolder
{
}
enum CLSID_NetworkPlaces = GUID(0x208d2c60, 0x3aea, 0x1069, [0xa2, 0xd7, 0x8, 0x0, 0x2b, 0x30, 0x30, 0x9d]);
struct NetworkPlaces
{
}
enum CLSID_ShellLink = GUID(0x21401, 0x0, 0x0, [0xc0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x46]);
struct ShellLink
{
}
enum CLSID_DriveSizeCategorizer = GUID(0x94357b53, 0xca29, 0x4b78, [0x83, 0xae, 0xe8, 0xfe, 0x74, 0x9, 0x13, 0x4f]);
struct DriveSizeCategorizer
{
}
enum CLSID_DriveTypeCategorizer = GUID(0xb0a8f3cf, 0x4333, 0x4bab, [0x88, 0x73, 0x1c, 0xcb, 0x1c, 0xad, 0xa4, 0x8b]);
struct DriveTypeCategorizer
{
}
enum CLSID_FreeSpaceCategorizer = GUID(0xb5607793, 0x24ac, 0x44c7, [0x82, 0xe2, 0x83, 0x17, 0x26, 0xaa, 0x6c, 0xb7]);
struct FreeSpaceCategorizer
{
}
enum CLSID_SizeCategorizer = GUID(0x55d7b852, 0xf6d1, 0x42f2, [0xaa, 0x75, 0x87, 0x28, 0xa1, 0xb2, 0xd2, 0x64]);
struct SizeCategorizer
{
}
enum CLSID_PropertiesUI = GUID(0xd912f8cf, 0x396, 0x4915, [0x88, 0x4e, 0xfb, 0x42, 0x5d, 0x32, 0x94, 0x3b]);
struct PropertiesUI
{
}
enum CLSID_UserNotification = GUID(0x10890e, 0x8789, 0x413c, [0xad, 0xbc, 0x48, 0xf5, 0xb5, 0x11, 0xb3, 0xaf]);
struct UserNotification
{
}
enum CLSID_TaskbarList = GUID(0x56fdf344, 0xfd6d, 0x11d0, [0x95, 0x8a, 0x0, 0x60, 0x97, 0xc9, 0xa0, 0x90]);
struct TaskbarList
{
}
enum CLSID_ShellItem = GUID(0x9ac9fbe1, 0xe0a2, 0x4ad6, [0xb4, 0xee, 0xe2, 0x12, 0x1, 0x3e, 0xa9, 0x17]);
struct ShellItem
{
}
enum CLSID_NamespaceWalker = GUID(0x72eb61e0, 0x8672, 0x4303, [0x91, 0x75, 0xf2, 0xe4, 0xc6, 0x8b, 0x2e, 0x7c]);
struct NamespaceWalker
{
}
enum CLSID_FileOperation = GUID(0x3ad05575, 0x8857, 0x4850, [0x92, 0x77, 0x11, 0xb8, 0x5b, 0xdb, 0x8e, 0x9]);
struct FileOperation
{
}
enum CLSID_FileOpenDialog = GUID(0xdc1c5a9c, 0xe88a, 0x4dde, [0xa5, 0xa1, 0x60, 0xf8, 0x2a, 0x20, 0xae, 0xf7]);
struct FileOpenDialog
{
}
enum CLSID_FileSaveDialog = GUID(0xc0b4e2f3, 0xba21, 0x4773, [0x8d, 0xba, 0x33, 0x5e, 0xc9, 0x46, 0xeb, 0x8b]);
struct FileSaveDialog
{
}
enum CLSID_KnownFolderManager = GUID(0x4df0c730, 0xdf9d, 0x4ae3, [0x91, 0x53, 0xaa, 0x6b, 0x82, 0xe9, 0x79, 0x5a]);
struct KnownFolderManager
{
}
enum CLSID_SharingConfigurationManager = GUID(0x49f371e1, 0x8c5c, 0x4d9c, [0x9a, 0x3b, 0x54, 0xa6, 0x82, 0x7f, 0x51, 0x3c]);
struct SharingConfigurationManager
{
}
enum CLSID_NetworkConnections = GUID(0x7007acc7, 0x3202, 0x11d1, [0xaa, 0xd2, 0x0, 0x80, 0x5f, 0xc1, 0x27, 0xe]);
struct NetworkConnections
{
}
enum CLSID_ScheduledTasks = GUID(0xd6277990, 0x4c6a, 0x11cf, [0x8d, 0x87, 0x0, 0xaa, 0x0, 0x60, 0xf5, 0xbf]);
struct ScheduledTasks
{
}
enum CLSID_ApplicationAssociationRegistration = GUID(0x591209c7, 0x767b, 0x42b2, [0x9f, 0xba, 0x44, 0xee, 0x46, 0x15, 0xf2, 0xc7]);
struct ApplicationAssociationRegistration
{
}
enum CLSID_SearchFolderItemFactory = GUID(0x14010e02, 0xbbbd, 0x41f0, [0x88, 0xe3, 0xed, 0xa3, 0x71, 0x21, 0x65, 0x84]);
struct SearchFolderItemFactory
{
}
enum CLSID_OpenControlPanel = GUID(0x6622d85, 0x6856, 0x4460, [0x8d, 0xe1, 0xa8, 0x19, 0x21, 0xb4, 0x1c, 0x4b]);
struct OpenControlPanel
{
}
enum CLSID_MailRecipient = GUID(0x9e56be60, 0xc50f, 0x11cf, [0x9a, 0x2c, 0x0, 0xa0, 0xc9, 0xa, 0x90, 0xce]);
struct MailRecipient
{
}
enum CLSID_NetworkExplorerFolder = GUID(0xf02c1a0d, 0xbe21, 0x4350, [0x88, 0xb0, 0x73, 0x67, 0xfc, 0x96, 0xef, 0x3c]);
struct NetworkExplorerFolder
{
}
enum CLSID_DestinationList = GUID(0x77f10cf0, 0x3db5, 0x4966, [0xb5, 0x20, 0xb7, 0xc5, 0x4f, 0xd3, 0x5e, 0xd6]);
struct DestinationList
{
}
enum CLSID_ApplicationDestinations = GUID(0x86c14003, 0x4d6b, 0x4ef3, [0xa7, 0xb4, 0x5, 0x6, 0x66, 0x3b, 0x2e, 0x68]);
struct ApplicationDestinations
{
}
enum CLSID_ApplicationDocumentLists = GUID(0x86bec222, 0x30f2, 0x47e0, [0x9f, 0x25, 0x60, 0xd1, 0x1c, 0xd7, 0x5c, 0x28]);
struct ApplicationDocumentLists
{
}
enum CLSID_HomeGroup = GUID(0xde77ba04, 0x3c92, 0x4d11, [0xa1, 0xa5, 0x42, 0x35, 0x2a, 0x53, 0xe0, 0xe3]);
struct HomeGroup
{
}
enum CLSID_ShellLibrary = GUID(0xd9b3211d, 0xe57f, 0x4426, [0xaa, 0xef, 0x30, 0xa8, 0x6, 0xad, 0xd3, 0x97]);
struct ShellLibrary
{
}
enum CLSID_AppStartupLink = GUID(0x273eb5e7, 0x88b0, 0x4843, [0xbf, 0xef, 0xe2, 0xc8, 0x1d, 0x43, 0xaa, 0xe5]);
struct AppStartupLink
{
}
enum CLSID_EnumerableObjectCollection = GUID(0x2d3468c1, 0x36a7, 0x43b6, [0xac, 0x24, 0xd3, 0xf0, 0x2f, 0xd9, 0x60, 0x7a]);
struct EnumerableObjectCollection
{
}
enum CLSID_FrameworkInputPane = GUID(0xd5120aa3, 0x46ba, 0x44c5, [0x82, 0x2d, 0xca, 0x80, 0x92, 0xc1, 0xfc, 0x72]);
struct FrameworkInputPane
{
}
enum CLSID_DefFolderMenu = GUID(0xc63382be, 0x7933, 0x48d0, [0x9a, 0xc8, 0x85, 0xfb, 0x46, 0xbe, 0x2f, 0xdd]);
struct DefFolderMenu
{
}
enum CLSID_AppVisibility = GUID(0x7e5fe3d9, 0x985f, 0x4908, [0x91, 0xf9, 0xee, 0x19, 0xf9, 0xfd, 0x15, 0x14]);
struct AppVisibility
{
}
enum CLSID_AppShellVerbHandler = GUID(0x4ed3a719, 0xcea8, 0x4bd9, [0x91, 0xd, 0xe2, 0x52, 0xf9, 0x97, 0xaf, 0xc2]);
struct AppShellVerbHandler
{
}
enum CLSID_ExecuteUnknown = GUID(0xe44e9428, 0xbdbc, 0x4987, [0xa0, 0x99, 0x40, 0xdc, 0x8f, 0xd2, 0x55, 0xe7]);
struct ExecuteUnknown
{
}
enum CLSID_PackageDebugSettings = GUID(0xb1aec16f, 0x2383, 0x4852, [0xb0, 0xe9, 0x8f, 0xb, 0x1d, 0xc6, 0x6b, 0x4d]);
struct PackageDebugSettings
{
}
enum CLSID_SuspensionDependencyManager = GUID(0x6b273fc5, 0x61fd, 0x4918, [0x95, 0xa2, 0xc3, 0xb5, 0xe9, 0xd7, 0xf5, 0x81]);
struct SuspensionDependencyManager
{
}
enum CLSID_ApplicationActivationManager = GUID(0x45ba127d, 0x10a8, 0x46ea, [0x8a, 0xb7, 0x56, 0xea, 0x90, 0x78, 0x94, 0x3c]);
struct ApplicationActivationManager
{
}
enum CLSID_ApplicationDesignModeSettings = GUID(0x958a6fb5, 0xdcb2, 0x4faf, [0xaa, 0xfd, 0x7f, 0xb0, 0x54, 0xad, 0x1a, 0x3b]);
struct ApplicationDesignModeSettings
{
}
struct CMINVOKECOMMANDINFO
{
    uint cbSize;
    uint fMask;
    HWND hwnd;
    const(char)* lpVerb;
    const(char)* lpParameters;
    const(char)* lpDirectory;
    int nShow;
    uint dwHotKey;
    HANDLE hIcon;
}
struct CMINVOKECOMMANDINFOEX
{
    uint cbSize;
    uint fMask;
    HWND hwnd;
    const(char)* lpVerb;
    const(char)* lpParameters;
    const(char)* lpDirectory;
    int nShow;
    uint dwHotKey;
    HANDLE hIcon;
    const(char)* lpTitle;
    const(wchar)* lpVerbW;
    const(wchar)* lpParametersW;
    const(wchar)* lpDirectoryW;
    const(wchar)* lpTitleW;
    POINT ptInvoke;
}
struct CMINVOKECOMMANDINFOEX_REMOTE
{
    uint cbSize;
    uint fMask;
    HWND hwnd;
    const(char)* lpVerbString;
    const(char)* lpParameters;
    const(char)* lpDirectory;
    int nShow;
    uint dwHotKey;
    const(char)* lpTitle;
    const(wchar)* lpVerbWString;
    const(wchar)* lpParametersW;
    const(wchar)* lpDirectoryW;
    const(wchar)* lpTitleW;
    POINT ptInvoke;
    uint lpVerbInt;
    uint lpVerbWInt;
}
enum IID_IContextMenu = GUID(0x214e4, 0x0, 0x0, [0xc0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x46]);
interface IContextMenu : IUnknown
{
    HRESULT QueryContextMenu(HMENU, uint, uint, uint, uint);
    HRESULT InvokeCommand(CMINVOKECOMMANDINFO*);
    HRESULT GetCommandString(ulong, uint, uint*, PSTR, uint);
}
enum IID_IContextMenu2 = GUID(0x214f4, 0x0, 0x0, [0xc0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x46]);
interface IContextMenu2 : IContextMenu
{
    HRESULT HandleMenuMsg(uint, WPARAM, LPARAM);
}
enum IID_IContextMenu3 = GUID(0xbcfce0a0, 0xec17, 0x11d0, [0x8d, 0x10, 0x0, 0xa0, 0xc9, 0xf, 0x27, 0x19]);
interface IContextMenu3 : IContextMenu2
{
    HRESULT HandleMenuMsg2(uint, WPARAM, LPARAM, LRESULT*);
}
enum IID_IExecuteCommand = GUID(0x7f9185b0, 0xcb92, 0x43c5, [0x80, 0xa9, 0x92, 0x27, 0x7a, 0x4f, 0x7b, 0x54]);
interface IExecuteCommand : IUnknown
{
    HRESULT SetKeyState(uint);
    HRESULT SetParameters(const(wchar)*);
    HRESULT SetPosition(POINT);
    HRESULT SetShowWindow(int);
    HRESULT SetNoShowUI(BOOL);
    HRESULT SetDirectory(const(wchar)*);
    HRESULT Execute();
}
enum IID_IPersistFolder = GUID(0x214ea, 0x0, 0x0, [0xc0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x46]);
interface IPersistFolder : IPersist
{
    HRESULT Initialize(ITEMIDLIST*);
}
enum IID_IRunnableTask = GUID(0x85788d00, 0x6807, 0x11d0, [0xb8, 0x10, 0x0, 0xc0, 0x4f, 0xd7, 0x6, 0xec]);
interface IRunnableTask : IUnknown
{
    HRESULT Run();
    HRESULT Kill(BOOL);
    HRESULT Suspend();
    HRESULT Resume();
    uint IsRunning();
}
enum IID_IShellTaskScheduler = GUID(0x6ccb7be0, 0x6807, 0x11d0, [0xb8, 0x10, 0x0, 0xc0, 0x4f, 0xd7, 0x6, 0xec]);
interface IShellTaskScheduler : IUnknown
{
    HRESULT AddTask(IRunnableTask, const(GUID)*, ulong, uint);
    HRESULT RemoveTasks(const(GUID)*, ulong, BOOL);
    uint CountTasks(const(GUID)*);
    HRESULT Status(uint, uint);
}
enum IID_IPersistFolder2 = GUID(0x1ac3d9f0, 0x175c, 0x11d1, [0x95, 0xbe, 0x0, 0x60, 0x97, 0x97, 0xea, 0x4f]);
interface IPersistFolder2 : IPersistFolder
{
    HRESULT GetCurFolder(ITEMIDLIST**);
}
struct PERSIST_FOLDER_TARGET_INFO
{
    ITEMIDLIST* pidlTargetFolder;
    wchar[260] szTargetParsingName;
    wchar[260] szNetworkProvider;
    uint dwAttributes;
    int csidl;
}
enum IID_IPersistFolder3 = GUID(0xcef04fdf, 0xfe72, 0x11d2, [0x87, 0xa5, 0x0, 0xc0, 0x4f, 0x68, 0x37, 0xcf]);
interface IPersistFolder3 : IPersistFolder2
{
    HRESULT InitializeEx(IBindCtx, ITEMIDLIST*, const(PERSIST_FOLDER_TARGET_INFO)*);
    HRESULT GetFolderTargetInfo(PERSIST_FOLDER_TARGET_INFO*);
}
enum IID_IPersistIDList = GUID(0x1079acfc, 0x29bd, 0x11d3, [0x8e, 0xd, 0x0, 0xc0, 0x4f, 0x68, 0x37, 0xd5]);
interface IPersistIDList : IPersist
{
    HRESULT SetIDList(ITEMIDLIST*);
    HRESULT GetIDList(ITEMIDLIST**);
}
enum IID_IEnumIDList = GUID(0x214f2, 0x0, 0x0, [0xc0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x46]);
interface IEnumIDList : IUnknown
{
    HRESULT Next(uint, ITEMIDLIST**, uint*);
    HRESULT Skip(uint);
    HRESULT Reset();
    HRESULT Clone(IEnumIDList*);
}
enum IID_IEnumFullIDList = GUID(0xd0191542, 0x7954, 0x4908, [0xbc, 0x6, 0xb2, 0x36, 0xb, 0xbe, 0x45, 0xba]);
interface IEnumFullIDList : IUnknown
{
    HRESULT Next(uint, ITEMIDLIST**, uint*);
    HRESULT Skip(uint);
    HRESULT Reset();
    HRESULT Clone(IEnumFullIDList*);
}
alias SHGDNF = uint;
enum : uint
{
    SHGDN_NORMAL        = 0x00000000,
    SHGDN_INFOLDER      = 0x00000001,
    SHGDN_FOREDITING    = 0x00001000,
    SHGDN_FORADDRESSBAR = 0x00004000,
    SHGDN_FORPARSING    = 0x00008000,
}

alias _SHCONTF = int;
enum : int
{
    SHCONTF_CHECKING_FOR_CHILDREN = 0x00000010,
    SHCONTF_FOLDERS               = 0x00000020,
    SHCONTF_NONFOLDERS            = 0x00000040,
    SHCONTF_INCLUDEHIDDEN         = 0x00000080,
    SHCONTF_INIT_ON_FIRST_NEXT    = 0x00000100,
    SHCONTF_NETPRINTERSRCH        = 0x00000200,
    SHCONTF_SHAREABLE             = 0x00000400,
    SHCONTF_STORAGE               = 0x00000800,
    SHCONTF_NAVIGATION_ENUM       = 0x00001000,
    SHCONTF_FASTITEMS             = 0x00002000,
    SHCONTF_FLATLIST              = 0x00004000,
    SHCONTF_ENABLE_ASYNC          = 0x00008000,
    SHCONTF_INCLUDESUPERHIDDEN    = 0x00010000,
}

alias STORAGE_PROVIDER_FILE_FLAGS = int;
enum : int
{
    SPFF_NONE                   = 0x00000000,
    SPFF_DOWNLOAD_BY_DEFAULT    = 0x00000001,
    SPFF_CREATED_ON_THIS_DEVICE = 0x00000002,
}

alias MERGE_UPDATE_STATUS = int;
enum : int
{
    MUS_COMPLETE        = 0x00000000,
    MUS_USERINPUTNEEDED = 0x00000001,
    MUS_FAILED          = 0x00000002,
}

enum IID_IFileSyncMergeHandler = GUID(0xd97b5aac, 0xc792, 0x433c, [0x97, 0x5d, 0x35, 0xc4, 0xea, 0xdc, 0x7a, 0x9d]);
interface IFileSyncMergeHandler : IUnknown
{
    HRESULT Merge(const(wchar)*, const(wchar)*, MERGE_UPDATE_STATUS*);
    HRESULT ShowResolveConflictUIAsync(const(wchar)*, HMONITOR);
}
alias FOLDER_ENUM_MODE = int;
enum : int
{
    FEM_VIEWRESULT = 0x00000000,
    FEM_NAVIGATION = 0x00000001,
}

enum IID_IObjectWithFolderEnumMode = GUID(0x6a9d9026, 0xe6e, 0x464c, [0xb0, 0x0, 0x42, 0xec, 0xc0, 0x7d, 0xe6, 0x73]);
interface IObjectWithFolderEnumMode : IUnknown
{
    HRESULT SetMode(FOLDER_ENUM_MODE);
    HRESULT GetMode(FOLDER_ENUM_MODE*);
}
enum IID_IParseAndCreateItem = GUID(0x67efed0e, 0xe827, 0x4408, [0xb4, 0x93, 0x78, 0xf3, 0x98, 0x2b, 0x68, 0x5c]);
interface IParseAndCreateItem : IUnknown
{
    HRESULT SetItem(IShellItem);
    HRESULT GetItem(const(GUID)*, void**);
}
enum IID_IShellFolder = GUID(0x214e6, 0x0, 0x0, [0xc0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x46]);
interface IShellFolder : IUnknown
{
    HRESULT ParseDisplayName(HWND, IBindCtx, PWSTR, uint*, ITEMIDLIST**, uint*);
    HRESULT EnumObjects(HWND, uint, IEnumIDList*);
    HRESULT BindToObject(ITEMIDLIST*, IBindCtx, const(GUID)*, void**);
    HRESULT BindToStorage(ITEMIDLIST*, IBindCtx, const(GUID)*, void**);
    HRESULT CompareIDs(LPARAM, ITEMIDLIST*, ITEMIDLIST*);
    HRESULT CreateViewObject(HWND, const(GUID)*, void**);
    HRESULT GetAttributesOf(uint, ITEMIDLIST**, uint*);
    HRESULT GetUIObjectOf(HWND, uint, ITEMIDLIST**, const(GUID)*, uint*, void**);
    HRESULT GetDisplayNameOf(ITEMIDLIST*, SHGDNF, STRRET*);
    HRESULT SetNameOf(HWND, ITEMIDLIST*, const(wchar)*, SHGDNF, ITEMIDLIST**);
}
struct EXTRASEARCH
{
    GUID guidSearch;
    wchar[80] wszFriendlyName;
    wchar[2084] wszUrl;
}
enum IID_IEnumExtraSearch = GUID(0xe700be1, 0x9db6, 0x11d1, [0xa1, 0xce, 0x0, 0xc0, 0x4f, 0xd7, 0x5d, 0x13]);
interface IEnumExtraSearch : IUnknown
{
    HRESULT Next(uint, EXTRASEARCH*, uint*);
    HRESULT Skip(uint);
    HRESULT Reset();
    HRESULT Clone(IEnumExtraSearch*);
}
enum IID_IShellFolder2 = GUID(0x93f2f68c, 0x1d1b, 0x11d3, [0xa3, 0xe, 0x0, 0xc0, 0x4f, 0x79, 0xab, 0xd1]);
interface IShellFolder2 : IShellFolder
{
    HRESULT GetDefaultSearchGUID(GUID*);
    HRESULT EnumSearches(IEnumExtraSearch*);
    HRESULT GetDefaultColumn(uint, uint*, uint*);
    HRESULT GetDefaultColumnState(uint, uint*);
    HRESULT GetDetailsEx(ITEMIDLIST*, const(PROPERTYKEY)*, VARIANT*);
    HRESULT GetDetailsOf(ITEMIDLIST*, uint, SHELLDETAILS*);
    HRESULT MapColumnToSCID(uint, PROPERTYKEY*);
}
alias FOLDERFLAGS = int;
enum : int
{
    FWF_NONE                = 0x00000000,
    FWF_AUTOARRANGE         = 0x00000001,
    FWF_ABBREVIATEDNAMES    = 0x00000002,
    FWF_SNAPTOGRID          = 0x00000004,
    FWF_OWNERDATA           = 0x00000008,
    FWF_BESTFITWINDOW       = 0x00000010,
    FWF_DESKTOP             = 0x00000020,
    FWF_SINGLESEL           = 0x00000040,
    FWF_NOSUBFOLDERS        = 0x00000080,
    FWF_TRANSPARENT         = 0x00000100,
    FWF_NOCLIENTEDGE        = 0x00000200,
    FWF_NOSCROLL            = 0x00000400,
    FWF_ALIGNLEFT           = 0x00000800,
    FWF_NOICONS             = 0x00001000,
    FWF_SHOWSELALWAYS       = 0x00002000,
    FWF_NOVISIBLE           = 0x00004000,
    FWF_SINGLECLICKACTIVATE = 0x00008000,
    FWF_NOWEBVIEW           = 0x00010000,
    FWF_HIDEFILENAMES       = 0x00020000,
    FWF_CHECKSELECT         = 0x00040000,
    FWF_NOENUMREFRESH       = 0x00080000,
    FWF_NOGROUPING          = 0x00100000,
    FWF_FULLROWSELECT       = 0x00200000,
    FWF_NOFILTERS           = 0x00400000,
    FWF_NOCOLUMNHEADER      = 0x00800000,
    FWF_NOHEADERINALLVIEWS  = 0x01000000,
    FWF_EXTENDEDTILES       = 0x02000000,
    FWF_TRICHECKSELECT      = 0x04000000,
    FWF_AUTOCHECKSELECT     = 0x08000000,
    FWF_NOBROWSERVIEWSTATE  = 0x10000000,
    FWF_SUBSETGROUPS        = 0x20000000,
    FWF_USESEARCHFOLDER     = 0x40000000,
    FWF_ALLOWRTLREADING     = 0x80000000,
}

alias FOLDERVIEWMODE = int;
enum : int
{
    FVM_AUTO       = 0xffffffff,
    FVM_FIRST      = 0x00000001,
    FVM_ICON       = 0x00000001,
    FVM_SMALLICON  = 0x00000002,
    FVM_LIST       = 0x00000003,
    FVM_DETAILS    = 0x00000004,
    FVM_THUMBNAIL  = 0x00000005,
    FVM_TILE       = 0x00000006,
    FVM_THUMBSTRIP = 0x00000007,
    FVM_CONTENT    = 0x00000008,
    FVM_LAST       = 0x00000008,
}

alias FOLDERLOGICALVIEWMODE = int;
enum : int
{
    FLVM_UNSPECIFIED = 0xffffffff,
    FLVM_FIRST       = 0x00000001,
    FLVM_DETAILS     = 0x00000001,
    FLVM_TILES       = 0x00000002,
    FLVM_ICONS       = 0x00000003,
    FLVM_LIST        = 0x00000004,
    FLVM_CONTENT     = 0x00000005,
    FLVM_LAST        = 0x00000005,
}

struct FOLDERSETTINGS
{
    uint ViewMode;
    uint fFlags;
}
alias _SVSIF = int;
enum : int
{
    SVSI_DESELECT       = 0x00000000,
    SVSI_SELECT         = 0x00000001,
    SVSI_EDIT           = 0x00000003,
    SVSI_DESELECTOTHERS = 0x00000004,
    SVSI_ENSUREVISIBLE  = 0x00000008,
    SVSI_FOCUSED        = 0x00000010,
    SVSI_TRANSLATEPT    = 0x00000020,
    SVSI_SELECTIONMARK  = 0x00000040,
    SVSI_POSITIONITEM   = 0x00000080,
    SVSI_CHECK          = 0x00000100,
    SVSI_CHECK2         = 0x00000200,
    SVSI_KEYBOARDSELECT = 0x00000401,
    SVSI_NOTAKEFOCUS    = 0x40000000,
}

alias _SVGIO = int;
enum : int
{
    SVGIO_BACKGROUND     = 0x00000000,
    SVGIO_SELECTION      = 0x00000001,
    SVGIO_ALLVIEW        = 0x00000002,
    SVGIO_CHECKED        = 0x00000003,
    SVGIO_TYPE_MASK      = 0x0000000f,
    SVGIO_FLAG_VIEWORDER = 0x80000000,
}

alias SVUIA_STATUS = int;
enum : int
{
    SVUIA_DEACTIVATE       = 0x00000000,
    SVUIA_ACTIVATE_NOFOCUS = 0x00000001,
    SVUIA_ACTIVATE_FOCUS   = 0x00000002,
    SVUIA_INPLACEACTIVATE  = 0x00000003,
}

enum IID_IShellView = GUID(0x214e3, 0x0, 0x0, [0xc0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x46]);
interface IShellView : IOleWindow
{
    HRESULT TranslateAccelerator(MSG*);
    HRESULT EnableModeless(BOOL);
    HRESULT UIActivate(uint);
    HRESULT Refresh();
    HRESULT CreateViewWindow(IShellView, FOLDERSETTINGS*, IShellBrowser, RECT*, HWND*);
    HRESULT DestroyViewWindow();
    HRESULT GetCurrentInfo(FOLDERSETTINGS*);
    HRESULT AddPropertySheetPages(uint, LPFNSVADDPROPSHEETPAGE, LPARAM);
    HRESULT SaveViewState();
    HRESULT SelectItem(ITEMIDLIST*, uint);
    HRESULT GetItemObject(uint, const(GUID)*, void**);
}
struct SV2CVW2_PARAMS
{
    uint cbSize;
    IShellView psvPrev;
    FOLDERSETTINGS* pfs;
    IShellBrowser psbOwner;
    RECT* prcView;
    const(GUID)* pvid;
    HWND hwndView;
}
enum IID_IShellView2 = GUID(0x88e39e80, 0x3578, 0x11cf, [0xae, 0x69, 0x8, 0x0, 0x2b, 0x2e, 0x12, 0x62]);
interface IShellView2 : IShellView
{
    HRESULT GetView(GUID*, uint);
    HRESULT CreateViewWindow2(SV2CVW2_PARAMS*);
    HRESULT HandleRename(ITEMIDLIST*);
    HRESULT SelectAndPositionItem(ITEMIDLIST*, uint, POINT*);
}
enum IID_IFolderView = GUID(0xcde725b0, 0xccc9, 0x4519, [0x91, 0x7e, 0x32, 0x5d, 0x72, 0xfa, 0xb4, 0xce]);
interface IFolderView : IUnknown
{
    HRESULT GetCurrentViewMode(uint*);
    HRESULT SetCurrentViewMode(uint);
    HRESULT GetFolder(const(GUID)*, void**);
    HRESULT Item(int, ITEMIDLIST**);
    HRESULT ItemCount(uint, int*);
    HRESULT Items(uint, const(GUID)*, void**);
    HRESULT GetSelectionMarkedItem(int*);
    HRESULT GetFocusedItem(int*);
    HRESULT GetItemPosition(ITEMIDLIST*, POINT*);
    HRESULT GetSpacing(POINT*);
    HRESULT GetDefaultSpacing(POINT*);
    HRESULT GetAutoArrange();
    HRESULT SelectItem(int, uint);
    HRESULT SelectAndPositionItems(uint, ITEMIDLIST**, POINT*, uint);
}
alias SORTDIRECTION = int;
enum : int
{
    SORT_DESCENDING = 0xffffffff,
    SORT_ASCENDING  = 0x00000001,
}

struct SORTCOLUMN
{
    PROPERTYKEY propkey;
    SORTDIRECTION direction;
}
alias FVTEXTTYPE = int;
enum : int
{
    FVST_EMPTYTEXT = 0x00000000,
}

enum IID_IFolderView2 = GUID(0x1af3a467, 0x214f, 0x4298, [0x90, 0x8e, 0x6, 0xb0, 0x3e, 0xb, 0x39, 0xf9]);
interface IFolderView2 : IFolderView
{
    HRESULT SetGroupBy(const(PROPERTYKEY)*, BOOL);
    HRESULT GetGroupBy(PROPERTYKEY*, BOOL*);
    HRESULT SetViewProperty(ITEMIDLIST*, const(PROPERTYKEY)*, const(PROPVARIANT)*);
    HRESULT GetViewProperty(ITEMIDLIST*, const(PROPERTYKEY)*, PROPVARIANT*);
    HRESULT SetTileViewProperties(ITEMIDLIST*, const(wchar)*);
    HRESULT SetExtendedTileViewProperties(ITEMIDLIST*, const(wchar)*);
    HRESULT SetText(FVTEXTTYPE, const(wchar)*);
    HRESULT SetCurrentFolderFlags(uint, uint);
    HRESULT GetCurrentFolderFlags(uint*);
    HRESULT GetSortColumnCount(int*);
    HRESULT SetSortColumns(const(SORTCOLUMN)*, int);
    HRESULT GetSortColumns(SORTCOLUMN*, int);
    HRESULT GetItem(int, const(GUID)*, void**);
    HRESULT GetVisibleItem(int, BOOL, int*);
    HRESULT GetSelectedItem(int, int*);
    HRESULT GetSelection(BOOL, IShellItemArray*);
    HRESULT GetSelectionState(ITEMIDLIST*, uint*);
    HRESULT InvokeVerbOnSelection(const(char)*);
    HRESULT SetViewModeAndIconSize(FOLDERVIEWMODE, int);
    HRESULT GetViewModeAndIconSize(FOLDERVIEWMODE*, int*);
    HRESULT SetGroupSubsetCount(uint);
    HRESULT GetGroupSubsetCount(uint*);
    HRESULT SetRedraw(BOOL);
    HRESULT IsMoveInSameFolder();
    HRESULT DoRename();
}
enum IID_IFolderViewSettings = GUID(0xae8c987d, 0x8797, 0x4ed3, [0xbe, 0x72, 0x2a, 0x47, 0xdd, 0x93, 0x8d, 0xb0]);
interface IFolderViewSettings : IUnknown
{
    HRESULT GetColumnPropertyList(const(GUID)*, void**);
    HRESULT GetGroupByProperty(PROPERTYKEY*, BOOL*);
    HRESULT GetViewMode(FOLDERLOGICALVIEWMODE*);
    HRESULT GetIconSize(uint*);
    HRESULT GetFolderFlags(FOLDERFLAGS*, FOLDERFLAGS*);
    HRESULT GetSortColumns(SORTCOLUMN*, uint, uint*);
    HRESULT GetGroupSubsetCount(uint*);
}
enum IID_IInitializeNetworkFolder = GUID(0x6e0f9881, 0x42a8, 0x4f2a, [0x97, 0xf8, 0x8a, 0xf4, 0xe0, 0x26, 0xd9, 0x2d]);
interface IInitializeNetworkFolder : IUnknown
{
    HRESULT Initialize(ITEMIDLIST*, ITEMIDLIST*, uint, const(wchar)*, const(wchar)*);
}
enum IID_INetworkFolderInternal = GUID(0xceb38218, 0xc971, 0x47bb, [0xa7, 0x3, 0xf0, 0xbc, 0x99, 0xcc, 0xdb, 0x81]);
interface INetworkFolderInternal : IUnknown
{
    HRESULT GetResourceDisplayType(uint*);
    HRESULT GetIDList(ITEMIDLIST**);
    HRESULT GetProvider(uint, ITEMIDLIST**, uint, PWSTR);
}
enum IID_IPreviewHandlerVisuals = GUID(0x196bf9a5, 0xb346, 0x4ef0, [0xaa, 0x1e, 0x5d, 0xcd, 0xb7, 0x67, 0x68, 0xb1]);
interface IPreviewHandlerVisuals : IUnknown
{
    HRESULT SetBackgroundColor(COLORREF);
    HRESULT SetFont(const(LOGFONTW)*);
    HRESULT SetTextColor(COLORREF);
}
enum IID_ICommDlgBrowser = GUID(0x214f1, 0x0, 0x0, [0xc0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x46]);
interface ICommDlgBrowser : IUnknown
{
    HRESULT OnDefaultCommand(IShellView);
    HRESULT OnStateChange(IShellView, uint);
    HRESULT IncludeObject(IShellView, ITEMIDLIST*);
}
enum IID_ICommDlgBrowser2 = GUID(0x10339516, 0x2894, 0x11d2, [0x90, 0x39, 0x0, 0xc0, 0x4f, 0x8e, 0xeb, 0x3e]);
interface ICommDlgBrowser2 : ICommDlgBrowser
{
    HRESULT Notify(IShellView, uint);
    HRESULT GetDefaultMenuText(IShellView, PWSTR, int);
    HRESULT GetViewFlags(uint*);
}
alias CM_MASK = int;
enum : int
{
    CM_MASK_WIDTH        = 0x00000001,
    CM_MASK_DEFAULTWIDTH = 0x00000002,
    CM_MASK_IDEALWIDTH   = 0x00000004,
    CM_MASK_NAME         = 0x00000008,
    CM_MASK_STATE        = 0x00000010,
}

alias CM_STATE = int;
enum : int
{
    CM_STATE_NONE               = 0x00000000,
    CM_STATE_VISIBLE            = 0x00000001,
    CM_STATE_FIXEDWIDTH         = 0x00000002,
    CM_STATE_NOSORTBYFOLDERNESS = 0x00000004,
    CM_STATE_ALWAYSVISIBLE      = 0x00000008,
}

alias CM_ENUM_FLAGS = int;
enum : int
{
    CM_ENUM_ALL     = 0x00000001,
    CM_ENUM_VISIBLE = 0x00000002,
}

alias CM_SET_WIDTH_VALUE = int;
enum : int
{
    CM_WIDTH_USEDEFAULT = 0xffffffff,
    CM_WIDTH_AUTOSIZE   = 0xfffffffe,
}

struct CM_COLUMNINFO
{
    uint cbSize;
    uint dwMask;
    uint dwState;
    uint uWidth;
    uint uDefaultWidth;
    uint uIdealWidth;
    wchar[80] wszName;
}
enum IID_IColumnManager = GUID(0xd8ec27bb, 0x3f3b, 0x4042, [0xb1, 0xa, 0x4a, 0xcf, 0xd9, 0x24, 0xd4, 0x53]);
interface IColumnManager : IUnknown
{
    HRESULT SetColumnInfo(const(PROPERTYKEY)*, const(CM_COLUMNINFO)*);
    HRESULT GetColumnInfo(const(PROPERTYKEY)*, CM_COLUMNINFO*);
    HRESULT GetColumnCount(CM_ENUM_FLAGS, uint*);
    HRESULT GetColumns(CM_ENUM_FLAGS, PROPERTYKEY*, uint);
    HRESULT SetColumns(const(PROPERTYKEY)*, uint);
}
enum IID_IFolderFilterSite = GUID(0xc0a651f5, 0xb48b, 0x11d2, [0xb5, 0xed, 0x0, 0x60, 0x97, 0xc6, 0x86, 0xf6]);
interface IFolderFilterSite : IUnknown
{
    HRESULT SetFilter(IUnknown);
}
enum IID_IFolderFilter = GUID(0x9cc22886, 0xdc8e, 0x11d2, [0xb1, 0xd0, 0x0, 0xc0, 0x4f, 0x8e, 0xeb, 0x3e]);
interface IFolderFilter : IUnknown
{
    HRESULT ShouldShow(IShellFolder, ITEMIDLIST*, ITEMIDLIST*);
    HRESULT GetEnumFlags(IShellFolder, ITEMIDLIST*, HWND*, uint*);
}
enum IID_IInputObjectSite = GUID(0xf1db8392, 0x7331, 0x11d0, [0x8c, 0x99, 0x0, 0xa0, 0xc9, 0x2d, 0xbf, 0xe8]);
interface IInputObjectSite : IUnknown
{
    HRESULT OnFocusChangeIS(IUnknown, BOOL);
}
enum IID_IInputObject = GUID(0x68284faa, 0x6a48, 0x11d0, [0x8c, 0x78, 0x0, 0xc0, 0x4f, 0xd9, 0x18, 0xb4]);
interface IInputObject : IUnknown
{
    HRESULT UIActivateIO(BOOL, MSG*);
    HRESULT HasFocusIO();
    HRESULT TranslateAcceleratorIO(MSG*);
}
enum IID_IInputObject2 = GUID(0x6915c085, 0x510b, 0x44cd, [0x94, 0xaf, 0x28, 0xdf, 0xa5, 0x6c, 0xf9, 0x2b]);
interface IInputObject2 : IInputObject
{
    HRESULT TranslateAcceleratorGlobal(MSG*);
}
enum IID_IShellIcon = GUID(0x214e5, 0x0, 0x0, [0xc0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x46]);
interface IShellIcon : IUnknown
{
    HRESULT GetIconOf(ITEMIDLIST*, uint, int*);
}
enum IID_IShellBrowser = GUID(0x214e2, 0x0, 0x0, [0xc0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x46]);
interface IShellBrowser : IOleWindow
{
    HRESULT InsertMenusSB(HMENU, OleMenuGroupWidths*);
    HRESULT SetMenuSB(HMENU, long, HWND);
    HRESULT RemoveMenusSB(HMENU);
    HRESULT SetStatusTextSB(const(wchar)*);
    HRESULT EnableModelessSB(BOOL);
    HRESULT TranslateAcceleratorSB(MSG*, ushort);
    HRESULT BrowseObject(ITEMIDLIST*, uint);
    HRESULT GetViewStateStream(uint, IStream*);
    HRESULT GetControlWindow(uint, HWND*);
    HRESULT SendControlMsg(uint, uint, WPARAM, LPARAM, LRESULT*);
    HRESULT QueryActiveShellView(IShellView*);
    HRESULT OnViewWindowActive(IShellView);
    HRESULT SetToolbarItems(TBBUTTON*, uint, uint);
}
enum IID_IProfferService = GUID(0xcb728b20, 0xf786, 0x11ce, [0x92, 0xad, 0x0, 0xaa, 0x0, 0xa7, 0x4c, 0xd0]);
interface IProfferService : IUnknown
{
    HRESULT ProfferService(const(GUID)*, IServiceProvider, uint*);
    HRESULT RevokeService(uint);
}
enum IID_IGetServiceIds = GUID(0x4a073526, 0x6103, 0x4e21, [0xb7, 0xbc, 0xf5, 0x19, 0xd1, 0x52, 0x4e, 0x5d]);
interface IGetServiceIds : IUnknown
{
    HRESULT GetServiceIds(uint*, GUID**);
}
alias SIGDN = int;
enum : int
{
    SIGDN_NORMALDISPLAY               = 0x00000000,
    SIGDN_PARENTRELATIVEPARSING       = 0x80018001,
    SIGDN_DESKTOPABSOLUTEPARSING      = 0x80028000,
    SIGDN_PARENTRELATIVEEDITING       = 0x80031001,
    SIGDN_DESKTOPABSOLUTEEDITING      = 0x8004c000,
    SIGDN_FILESYSPATH                 = 0x80058000,
    SIGDN_URL                         = 0x80068000,
    SIGDN_PARENTRELATIVEFORADDRESSBAR = 0x8007c001,
    SIGDN_PARENTRELATIVE              = 0x80080001,
    SIGDN_PARENTRELATIVEFORUI         = 0x80094001,
}

alias _SICHINTF = int;
enum : int
{
    SICHINT_DISPLAY                       = 0x00000000,
    SICHINT_ALLFIELDS                     = 0x80000000,
    SICHINT_CANONICAL                     = 0x10000000,
    SICHINT_TEST_FILESYSPATH_IF_NOT_EQUAL = 0x20000000,
}

enum IID_IShellItem = GUID(0x43826d1e, 0xe718, 0x42ee, [0xbc, 0x55, 0xa1, 0xe2, 0x61, 0xc3, 0x7b, 0xfe]);
interface IShellItem : IUnknown
{
    HRESULT BindToHandler(IBindCtx, const(GUID)*, const(GUID)*, void**);
    HRESULT GetParent(IShellItem*);
    HRESULT GetDisplayName(SIGDN, PWSTR*);
    HRESULT GetAttributes(uint, uint*);
    HRESULT Compare(IShellItem, uint, int*);
}
alias DATAOBJ_GET_ITEM_FLAGS = int;
enum : int
{
    DOGIF_DEFAULT       = 0x00000000,
    DOGIF_TRAVERSE_LINK = 0x00000001,
    DOGIF_NO_HDROP      = 0x00000002,
    DOGIF_NO_URL        = 0x00000004,
    DOGIF_ONLY_IF_ONE   = 0x00000008,
}

enum IID_IShellItem2 = GUID(0x7e9fb0d3, 0x919f, 0x4307, [0xab, 0x2e, 0x9b, 0x18, 0x60, 0x31, 0xc, 0x93]);
interface IShellItem2 : IShellItem
{
    HRESULT GetPropertyStore(GETPROPERTYSTOREFLAGS, const(GUID)*, void**);
    HRESULT GetPropertyStoreWithCreateObject(GETPROPERTYSTOREFLAGS, IUnknown, const(GUID)*, void**);
    HRESULT GetPropertyStoreForKeys(const(PROPERTYKEY)*, uint, GETPROPERTYSTOREFLAGS, const(GUID)*, void**);
    HRESULT GetPropertyDescriptionList(const(PROPERTYKEY)*, const(GUID)*, void**);
    HRESULT Update(IBindCtx);
    HRESULT GetProperty(const(PROPERTYKEY)*, PROPVARIANT*);
    HRESULT GetCLSID(const(PROPERTYKEY)*, GUID*);
    HRESULT GetFileTime(const(PROPERTYKEY)*, FILETIME*);
    HRESULT GetInt32(const(PROPERTYKEY)*, int*);
    HRESULT GetString(const(PROPERTYKEY)*, PWSTR*);
    HRESULT GetUInt32(const(PROPERTYKEY)*, uint*);
    HRESULT GetUInt64(const(PROPERTYKEY)*, ulong*);
    HRESULT GetBool(const(PROPERTYKEY)*, BOOL*);
}
alias SIIGBF = int;
enum : int
{
    SIIGBF_RESIZETOFIT    = 0x00000000,
    SIIGBF_BIGGERSIZEOK   = 0x00000001,
    SIIGBF_MEMORYONLY     = 0x00000002,
    SIIGBF_ICONONLY       = 0x00000004,
    SIIGBF_THUMBNAILONLY  = 0x00000008,
    SIIGBF_INCACHEONLY    = 0x00000010,
    SIIGBF_CROPTOSQUARE   = 0x00000020,
    SIIGBF_WIDETHUMBNAILS = 0x00000040,
    SIIGBF_ICONBACKGROUND = 0x00000080,
    SIIGBF_SCALEUP        = 0x00000100,
}

enum IID_IShellItemImageFactory = GUID(0xbcc18b79, 0xba16, 0x442f, [0x80, 0xc4, 0x8a, 0x59, 0xc3, 0xc, 0x46, 0x3b]);
interface IShellItemImageFactory : IUnknown
{
    HRESULT GetImage(SIZE, SIIGBF, HBITMAP*);
}
enum IID_IEnumShellItems = GUID(0x70629033, 0xe363, 0x4a28, [0xa5, 0x67, 0xd, 0xb7, 0x80, 0x6, 0xe6, 0xd7]);
interface IEnumShellItems : IUnknown
{
    HRESULT Next(uint, IShellItem*, uint*);
    HRESULT Skip(uint);
    HRESULT Reset();
    HRESULT Clone(IEnumShellItems*);
}
alias STGOP = int;
enum : int
{
    STGOP_MOVE            = 0x00000001,
    STGOP_COPY            = 0x00000002,
    STGOP_SYNC            = 0x00000003,
    STGOP_REMOVE          = 0x00000005,
    STGOP_RENAME          = 0x00000006,
    STGOP_APPLYPROPERTIES = 0x00000008,
    STGOP_NEW             = 0x0000000a,
}

alias _TRANSFER_SOURCE_FLAGS = int;
enum : int
{
    TSF_NORMAL                     = 0x00000000,
    TSF_FAIL_EXIST                 = 0x00000000,
    TSF_RENAME_EXIST               = 0x00000001,
    TSF_OVERWRITE_EXIST            = 0x00000002,
    TSF_ALLOW_DECRYPTION           = 0x00000004,
    TSF_NO_SECURITY                = 0x00000008,
    TSF_COPY_CREATION_TIME         = 0x00000010,
    TSF_COPY_WRITE_TIME            = 0x00000020,
    TSF_USE_FULL_ACCESS            = 0x00000040,
    TSF_DELETE_RECYCLE_IF_POSSIBLE = 0x00000080,
    TSF_COPY_HARD_LINK             = 0x00000100,
    TSF_COPY_LOCALIZED_NAME        = 0x00000200,
    TSF_MOVE_AS_COPY_DELETE        = 0x00000400,
    TSF_SUSPEND_SHELLEVENTS        = 0x00000800,
}

alias _TRANSFER_ADVISE_STATE = int;
enum : int
{
    TS_NONE          = 0x00000000,
    TS_PERFORMING    = 0x00000001,
    TS_PREPARING     = 0x00000002,
    TS_INDETERMINATE = 0x00000004,
}

enum IID_ITransferAdviseSink = GUID(0xd594d0d8, 0x8da7, 0x457b, [0xb3, 0xb4, 0xce, 0x5d, 0xba, 0xac, 0xb, 0x88]);
interface ITransferAdviseSink : IUnknown
{
    HRESULT UpdateProgress(ulong, ulong, int, int, int, int);
    HRESULT UpdateTransferState(uint);
    HRESULT ConfirmOverwrite(IShellItem, IShellItem, const(wchar)*);
    HRESULT ConfirmEncryptionLoss(IShellItem);
    HRESULT FileFailure(IShellItem, const(wchar)*, HRESULT, PWSTR, uint);
    HRESULT SubStreamFailure(IShellItem, const(wchar)*, HRESULT);
    HRESULT PropertyFailure(IShellItem, const(PROPERTYKEY)*, HRESULT);
}
enum IID_ITransferSource = GUID(0xadb003, 0xbde9, 0x45c6, [0x8e, 0x29, 0xd0, 0x9f, 0x93, 0x53, 0xe1, 0x8]);
interface ITransferSource : IUnknown
{
    HRESULT Advise(ITransferAdviseSink, uint*);
    HRESULT Unadvise(uint);
    HRESULT SetProperties(IPropertyChangeArray);
    HRESULT OpenItem(IShellItem, uint, const(GUID)*, void**);
    HRESULT MoveItem(IShellItem, IShellItem, const(wchar)*, uint, IShellItem*);
    HRESULT RecycleItem(IShellItem, IShellItem, uint, IShellItem*);
    HRESULT RemoveItem(IShellItem, uint);
    HRESULT RenameItem(IShellItem, const(wchar)*, uint, IShellItem*);
    HRESULT LinkItem(IShellItem, IShellItem, const(wchar)*, uint, IShellItem*);
    HRESULT ApplyPropertiesToItem(IShellItem, IShellItem*);
    HRESULT GetDefaultDestinationName(IShellItem, IShellItem, PWSTR*);
    HRESULT EnterFolder(IShellItem);
    HRESULT LeaveFolder(IShellItem);
}
struct SHELL_ITEM_RESOURCE
{
    GUID guidType;
    wchar[260] szName;
}
enum IID_IEnumResources = GUID(0x2dd81fe3, 0xa83c, 0x4da9, [0xa3, 0x30, 0x47, 0x24, 0x9d, 0x34, 0x5b, 0xa1]);
interface IEnumResources : IUnknown
{
    HRESULT Next(uint, SHELL_ITEM_RESOURCE*, uint*);
    HRESULT Skip(uint);
    HRESULT Reset();
    HRESULT Clone(IEnumResources*);
}
enum IID_IShellItemResources = GUID(0xff5693be, 0x2ce0, 0x4d48, [0xb5, 0xc5, 0x40, 0x81, 0x7d, 0x1a, 0xcd, 0xb9]);
interface IShellItemResources : IUnknown
{
    HRESULT GetAttributes(uint*);
    HRESULT GetSize(ulong*);
    HRESULT GetTimes(FILETIME*, FILETIME*, FILETIME*);
    HRESULT SetTimes(const(FILETIME)*, const(FILETIME)*, const(FILETIME)*);
    HRESULT GetResourceDescription(const(SHELL_ITEM_RESOURCE)*, PWSTR*);
    HRESULT EnumResources(IEnumResources*);
    HRESULT SupportsResource(const(SHELL_ITEM_RESOURCE)*);
    HRESULT OpenResource(const(SHELL_ITEM_RESOURCE)*, const(GUID)*, void**);
    HRESULT CreateResource(const(SHELL_ITEM_RESOURCE)*, const(GUID)*, void**);
    HRESULT MarkForDelete();
}
enum IID_ITransferDestination = GUID(0x48addd32, 0x3ca5, 0x4124, [0xab, 0xe3, 0xb5, 0xa7, 0x25, 0x31, 0xb2, 0x7]);
interface ITransferDestination : IUnknown
{
    HRESULT Advise(ITransferAdviseSink, uint*);
    HRESULT Unadvise(uint);
    HRESULT CreateItem(const(wchar)*, uint, ulong, uint, const(GUID)*, void**, const(GUID)*, void**);
}
enum IID_IFileOperationProgressSink = GUID(0x4b0f1a7, 0x9490, 0x44bc, [0x96, 0xe1, 0x42, 0x96, 0xa3, 0x12, 0x52, 0xe2]);
interface IFileOperationProgressSink : IUnknown
{
    HRESULT StartOperations();
    HRESULT FinishOperations(HRESULT);
    HRESULT PreRenameItem(uint, IShellItem, const(wchar)*);
    HRESULT PostRenameItem(uint, IShellItem, const(wchar)*, HRESULT, IShellItem);
    HRESULT PreMoveItem(uint, IShellItem, IShellItem, const(wchar)*);
    HRESULT PostMoveItem(uint, IShellItem, IShellItem, const(wchar)*, HRESULT, IShellItem);
    HRESULT PreCopyItem(uint, IShellItem, IShellItem, const(wchar)*);
    HRESULT PostCopyItem(uint, IShellItem, IShellItem, const(wchar)*, HRESULT, IShellItem);
    HRESULT PreDeleteItem(uint, IShellItem);
    HRESULT PostDeleteItem(uint, IShellItem, HRESULT, IShellItem);
    HRESULT PreNewItem(uint, IShellItem, const(wchar)*);
    HRESULT PostNewItem(uint, IShellItem, const(wchar)*, const(wchar)*, uint, HRESULT, IShellItem);
    HRESULT UpdateProgress(uint, uint);
    HRESULT ResetTimer();
    HRESULT PauseTimer();
    HRESULT ResumeTimer();
}
alias SIATTRIBFLAGS = int;
enum : int
{
    SIATTRIBFLAGS_AND       = 0x00000001,
    SIATTRIBFLAGS_OR        = 0x00000002,
    SIATTRIBFLAGS_APPCOMPAT = 0x00000003,
    SIATTRIBFLAGS_MASK      = 0x00000003,
    SIATTRIBFLAGS_ALLITEMS  = 0x00004000,
}

enum IID_IShellItemArray = GUID(0xb63ea76d, 0x1f85, 0x456f, [0xa1, 0x9c, 0x48, 0x15, 0x9e, 0xfa, 0x85, 0x8b]);
interface IShellItemArray : IUnknown
{
    HRESULT BindToHandler(IBindCtx, const(GUID)*, const(GUID)*, void**);
    HRESULT GetPropertyStore(GETPROPERTYSTOREFLAGS, const(GUID)*, void**);
    HRESULT GetPropertyDescriptionList(const(PROPERTYKEY)*, const(GUID)*, void**);
    HRESULT GetAttributes(SIATTRIBFLAGS, uint, uint*);
    HRESULT GetCount(uint*);
    HRESULT GetItemAt(uint, IShellItem*);
    HRESULT EnumItems(IEnumShellItems*);
}
enum IID_IInitializeWithItem = GUID(0x7f73be3f, 0xfb79, 0x493c, [0xa6, 0xc7, 0x7e, 0xe1, 0x4e, 0x24, 0x58, 0x41]);
interface IInitializeWithItem : IUnknown
{
    HRESULT Initialize(IShellItem, uint);
}
enum IID_IObjectWithSelection = GUID(0x1c9cd5bb, 0x98e9, 0x4491, [0xa6, 0xf, 0x31, 0xaa, 0xcc, 0x72, 0xb8, 0x3c]);
interface IObjectWithSelection : IUnknown
{
    HRESULT SetSelection(IShellItemArray);
    HRESULT GetSelection(const(GUID)*, void**);
}
enum IID_IObjectWithBackReferences = GUID(0x321a6a6a, 0xd61f, 0x4bf3, [0x97, 0xae, 0x14, 0xbe, 0x29, 0x86, 0xbb, 0x36]);
interface IObjectWithBackReferences : IUnknown
{
    HRESULT RemoveBackReferences();
}
enum IID_ICategoryProvider = GUID(0x9af64809, 0x5864, 0x4c26, [0xa7, 0x20, 0xc1, 0xf7, 0x8c, 0x8, 0x6e, 0xe3]);
interface ICategoryProvider : IUnknown
{
    HRESULT CanCategorizeOnSCID(const(PROPERTYKEY)*);
    HRESULT GetDefaultCategory(GUID*, PROPERTYKEY*);
    HRESULT GetCategoryForSCID(const(PROPERTYKEY)*, GUID*);
    HRESULT EnumCategories(IEnumGUID*);
    HRESULT GetCategoryName(const(GUID)*, PWSTR, uint);
    HRESULT CreateCategory(const(GUID)*, const(GUID)*, void**);
}
alias CATEGORYINFO_FLAGS = int;
enum : int
{
    CATINFO_NORMAL          = 0x00000000,
    CATINFO_COLLAPSED       = 0x00000001,
    CATINFO_HIDDEN          = 0x00000002,
    CATINFO_EXPANDED        = 0x00000004,
    CATINFO_NOHEADER        = 0x00000008,
    CATINFO_NOTCOLLAPSIBLE  = 0x00000010,
    CATINFO_NOHEADERCOUNT   = 0x00000020,
    CATINFO_SUBSETTED       = 0x00000040,
    CATINFO_SEPARATE_IMAGES = 0x00000080,
    CATINFO_SHOWEMPTY       = 0x00000100,
}

alias CATSORT_FLAGS = int;
enum : int
{
    CATSORT_DEFAULT = 0x00000000,
    CATSORT_NAME    = 0x00000001,
}

struct CATEGORY_INFO
{
    CATEGORYINFO_FLAGS cif;
    wchar[260] wszName;
}
enum IID_ICategorizer = GUID(0xa3b14589, 0x9174, 0x49a8, [0x89, 0xa3, 0x6, 0xa1, 0xae, 0x2b, 0x9b, 0xa7]);
interface ICategorizer : IUnknown
{
    HRESULT GetDescription(PWSTR, uint);
    HRESULT GetCategory(uint, ITEMIDLIST**, uint*);
    HRESULT GetCategoryInfo(uint, CATEGORY_INFO*);
    HRESULT CompareCategory(CATSORT_FLAGS, uint, uint);
}
struct SHDRAGIMAGE
{
    SIZE sizeDragImage;
    POINT ptOffset;
    HBITMAP hbmpDragImage;
    COLORREF crColorKey;
}
enum IID_IDropTargetHelper = GUID(0x4657278b, 0x411b, 0x11d2, [0x83, 0x9a, 0x0, 0xc0, 0x4f, 0xd9, 0x18, 0xd0]);
interface IDropTargetHelper : IUnknown
{
    HRESULT DragEnter(HWND, IDataObject, POINT*, uint);
    HRESULT DragLeave();
    HRESULT DragOver(POINT*, uint);
    HRESULT Drop(IDataObject, POINT*, uint);
    HRESULT Show(BOOL);
}
enum IID_IDragSourceHelper = GUID(0xde5bf786, 0x477a, 0x11d2, [0x83, 0x9d, 0x0, 0xc0, 0x4f, 0xd9, 0x18, 0xd0]);
interface IDragSourceHelper : IUnknown
{
    HRESULT InitializeFromBitmap(SHDRAGIMAGE*, IDataObject);
    HRESULT InitializeFromWindow(HWND, POINT*, IDataObject);
}
alias SLR_FLAGS = int;
enum : int
{
    SLR_NONE                      = 0x00000000,
    SLR_NO_UI                     = 0x00000001,
    SLR_ANY_MATCH                 = 0x00000002,
    SLR_UPDATE                    = 0x00000004,
    SLR_NOUPDATE                  = 0x00000008,
    SLR_NOSEARCH                  = 0x00000010,
    SLR_NOTRACK                   = 0x00000020,
    SLR_NOLINKINFO                = 0x00000040,
    SLR_INVOKE_MSI                = 0x00000080,
    SLR_NO_UI_WITH_MSG_PUMP       = 0x00000101,
    SLR_OFFER_DELETE_WITHOUT_FILE = 0x00000200,
    SLR_KNOWNFOLDER               = 0x00000400,
    SLR_MACHINE_IN_LOCAL_TARGET   = 0x00000800,
    SLR_UPDATE_MACHINE_AND_SID    = 0x00001000,
    SLR_NO_OBJECT_ID              = 0x00002000,
}

alias SLGP_FLAGS = int;
enum : int
{
    SLGP_SHORTPATH        = 0x00000001,
    SLGP_UNCPRIORITY      = 0x00000002,
    SLGP_RAWPATH          = 0x00000004,
    SLGP_RELATIVEPRIORITY = 0x00000008,
}

enum IID_IShellLinkA = GUID(0x214ee, 0x0, 0x0, [0xc0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x46]);
interface IShellLinkA : IUnknown
{
    HRESULT GetPath(PSTR, int, WIN32_FIND_DATAA*, uint);
    HRESULT GetIDList(ITEMIDLIST**);
    HRESULT SetIDList(ITEMIDLIST*);
    HRESULT GetDescription(PSTR, int);
    HRESULT SetDescription(const(char)*);
    HRESULT GetWorkingDirectory(PSTR, int);
    HRESULT SetWorkingDirectory(const(char)*);
    HRESULT GetArguments(PSTR, int);
    HRESULT SetArguments(const(char)*);
    HRESULT GetHotkey(ushort*);
    HRESULT SetHotkey(ushort);
    HRESULT GetShowCmd(int*);
    HRESULT SetShowCmd(int);
    HRESULT GetIconLocation(PSTR, int, int*);
    HRESULT SetIconLocation(const(char)*, int);
    HRESULT SetRelativePath(const(char)*, uint);
    HRESULT Resolve(HWND, uint);
    HRESULT SetPath(const(char)*);
}
enum IID_IShellLinkW = GUID(0x214f9, 0x0, 0x0, [0xc0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x46]);
interface IShellLinkW : IUnknown
{
    HRESULT GetPath(PWSTR, int, WIN32_FIND_DATAW*, uint);
    HRESULT GetIDList(ITEMIDLIST**);
    HRESULT SetIDList(ITEMIDLIST*);
    HRESULT GetDescription(PWSTR, int);
    HRESULT SetDescription(const(wchar)*);
    HRESULT GetWorkingDirectory(PWSTR, int);
    HRESULT SetWorkingDirectory(const(wchar)*);
    HRESULT GetArguments(PWSTR, int);
    HRESULT SetArguments(const(wchar)*);
    HRESULT GetHotkey(ushort*);
    HRESULT SetHotkey(ushort);
    HRESULT GetShowCmd(int*);
    HRESULT SetShowCmd(int);
    HRESULT GetIconLocation(PWSTR, int, int*);
    HRESULT SetIconLocation(const(wchar)*, int);
    HRESULT SetRelativePath(const(wchar)*, uint);
    HRESULT Resolve(HWND, uint);
    HRESULT SetPath(const(wchar)*);
}
enum IID_IShellLinkDataList = GUID(0x45e2b4ae, 0xb1c3, 0x11d0, [0xb9, 0x2f, 0x0, 0xa0, 0xc9, 0x3, 0x12, 0xe1]);
interface IShellLinkDataList : IUnknown
{
    HRESULT AddDataBlock(void*);
    HRESULT CopyDataBlock(uint, void**);
    HRESULT RemoveDataBlock(uint);
    HRESULT GetFlags(uint*);
    HRESULT SetFlags(uint);
}
enum IID_IResolveShellLink = GUID(0x5cd52983, 0x9449, 0x11d2, [0x96, 0x3a, 0x0, 0xc0, 0x4f, 0x79, 0xad, 0xf0]);
interface IResolveShellLink : IUnknown
{
    HRESULT ResolveShellLink(IUnknown, HWND, uint);
}
alias _SPINITF = int;
enum : int
{
    SPINITF_NORMAL     = 0x00000000,
    SPINITF_MODAL      = 0x00000001,
    SPINITF_NOMINIMIZE = 0x00000008,
}

enum IID_IActionProgressDialog = GUID(0x49ff1172, 0xeadc, 0x446d, [0x92, 0x85, 0x15, 0x64, 0x53, 0xa6, 0x43, 0x1c]);
interface IActionProgressDialog : IUnknown
{
    HRESULT Initialize(uint, const(wchar)*, const(wchar)*);
    HRESULT Stop();
}
alias _SPBEGINF = int;
enum : int
{
    SPBEGINF_NORMAL          = 0x00000000,
    SPBEGINF_AUTOTIME        = 0x00000002,
    SPBEGINF_NOPROGRESSBAR   = 0x00000010,
    SPBEGINF_MARQUEEPROGRESS = 0x00000020,
    SPBEGINF_NOCANCELBUTTON  = 0x00000040,
}

alias SPACTION = int;
enum : int
{
    SPACTION_NONE               = 0x00000000,
    SPACTION_MOVING             = 0x00000001,
    SPACTION_COPYING            = 0x00000002,
    SPACTION_RECYCLING          = 0x00000003,
    SPACTION_APPLYINGATTRIBS    = 0x00000004,
    SPACTION_DOWNLOADING        = 0x00000005,
    SPACTION_SEARCHING_INTERNET = 0x00000006,
    SPACTION_CALCULATING        = 0x00000007,
    SPACTION_UPLOADING          = 0x00000008,
    SPACTION_SEARCHING_FILES    = 0x00000009,
    SPACTION_DELETING           = 0x0000000a,
    SPACTION_RENAMING           = 0x0000000b,
    SPACTION_FORMATTING         = 0x0000000c,
    SPACTION_COPY_MOVING        = 0x0000000d,
}

alias SPTEXT = int;
enum : int
{
    SPTEXT_ACTIONDESCRIPTION = 0x00000001,
    SPTEXT_ACTIONDETAIL      = 0x00000002,
}

enum IID_IActionProgress = GUID(0x49ff1173, 0xeadc, 0x446d, [0x92, 0x85, 0x15, 0x64, 0x53, 0xa6, 0x43, 0x1c]);
interface IActionProgress : IUnknown
{
    HRESULT Begin(SPACTION, uint);
    HRESULT UpdateProgress(ulong, ulong);
    HRESULT UpdateText(SPTEXT, const(wchar)*, BOOL);
    HRESULT QueryCancel(BOOL*);
    HRESULT ResetCancel();
    HRESULT End();
}
enum IID_IShellExtInit = GUID(0x214e8, 0x0, 0x0, [0xc0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x46]);
interface IShellExtInit : IUnknown
{
    HRESULT Initialize(ITEMIDLIST*, IDataObject, HKEY);
}
alias _EXPPS = int;
enum : int
{
    EXPPS_FILETYPES = 0x00000001,
}

enum IID_IShellPropSheetExt = GUID(0x214e9, 0x0, 0x0, [0xc0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x46]);
interface IShellPropSheetExt : IUnknown
{
    HRESULT AddPages(LPFNSVADDPROPSHEETPAGE, LPARAM);
    HRESULT ReplacePage(uint, LPFNSVADDPROPSHEETPAGE, LPARAM);
}
enum IID_IRemoteComputer = GUID(0x214fe, 0x0, 0x0, [0xc0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x46]);
interface IRemoteComputer : IUnknown
{
    HRESULT Initialize(const(wchar)*, BOOL);
}
enum IID_IQueryContinue = GUID(0x7307055c, 0xb24a, 0x486b, [0x9f, 0x25, 0x16, 0x3e, 0x59, 0x7a, 0x28, 0xa9]);
interface IQueryContinue : IUnknown
{
    HRESULT QueryContinue();
}
enum IID_IObjectWithCancelEvent = GUID(0xf279b885, 0xae9, 0x4b85, [0xac, 0x6, 0xdd, 0xec, 0xf9, 0x40, 0x89, 0x41]);
interface IObjectWithCancelEvent : IUnknown
{
    HRESULT GetCancelEvent(HANDLE*);
}
enum IID_IUserNotification = GUID(0xba9711ba, 0x5893, 0x4787, [0xa7, 0xe1, 0x41, 0x27, 0x71, 0x51, 0x55, 0xb]);
interface IUserNotification : IUnknown
{
    HRESULT SetBalloonInfo(const(wchar)*, const(wchar)*, uint);
    HRESULT SetBalloonRetry(uint, uint, uint);
    HRESULT SetIconInfo(HICON, const(wchar)*);
    HRESULT Show(IQueryContinue, uint);
    HRESULT PlaySound(const(wchar)*);
}
enum IID_IItemNameLimits = GUID(0x1df0d7f1, 0xb267, 0x4d28, [0x8b, 0x10, 0x12, 0xe2, 0x32, 0x2, 0xa5, 0xc4]);
interface IItemNameLimits : IUnknown
{
    HRESULT GetValidCharacters(PWSTR*, PWSTR*);
    HRESULT GetMaxLength(const(wchar)*, int*);
}
enum IID_ISearchFolderItemFactory = GUID(0xa0ffbc28, 0x5482, 0x4366, [0xbe, 0x27, 0x3e, 0x81, 0xe7, 0x8e, 0x6, 0xc2]);
interface ISearchFolderItemFactory : IUnknown
{
    HRESULT SetDisplayName(const(wchar)*);
    HRESULT SetFolderTypeID(GUID);
    HRESULT SetFolderLogicalViewMode(FOLDERLOGICALVIEWMODE);
    HRESULT SetIconSize(int);
    HRESULT SetVisibleColumns(uint, const(PROPERTYKEY)*);
    HRESULT SetSortColumns(uint, SORTCOLUMN*);
    HRESULT SetGroupColumn(const(PROPERTYKEY)*);
    HRESULT SetStacks(uint, PROPERTYKEY*);
    HRESULT SetScope(IShellItemArray);
    HRESULT SetCondition(ICondition);
    HRESULT GetShellItem(const(GUID)*, void**);
    HRESULT GetIDList(ITEMIDLIST**);
}
enum IID_IExtractImage = GUID(0xbb2e617c, 0x920, 0x11d1, [0x9a, 0xb, 0x0, 0xc0, 0x4f, 0xc2, 0xd6, 0xc1]);
interface IExtractImage : IUnknown
{
    HRESULT GetLocation(PWSTR, uint, uint*, const(SIZE)*, uint, uint*);
    HRESULT Extract(HBITMAP*);
}
enum IID_IExtractImage2 = GUID(0x953bb1ee, 0x93b4, 0x11d1, [0x98, 0xa3, 0x0, 0xc0, 0x4f, 0xb6, 0x87, 0xda]);
interface IExtractImage2 : IExtractImage
{
    HRESULT GetDateStamp(FILETIME*);
}
enum IID_IThumbnailHandlerFactory = GUID(0xe35b4b2e, 0xda, 0x4bc1, [0x9f, 0x13, 0x38, 0xbc, 0x11, 0xf5, 0xd4, 0x17]);
interface IThumbnailHandlerFactory : IUnknown
{
    HRESULT GetThumbnailHandler(ITEMIDLIST*, IBindCtx, const(GUID)*, void**);
}
enum IID_IParentAndItem = GUID(0xb3a4b685, 0xb685, 0x4805, [0x99, 0xd9, 0x5d, 0xea, 0xd2, 0x87, 0x32, 0x36]);
interface IParentAndItem : IUnknown
{
    HRESULT SetParentAndItem(ITEMIDLIST*, IShellFolder, ITEMIDLIST*);
    HRESULT GetParentAndItem(ITEMIDLIST**, IShellFolder*, ITEMIDLIST**);
}
enum IID_IDockingWindow = GUID(0x12dd920, 0x7b26, 0x11d0, [0x8c, 0xa9, 0x0, 0xa0, 0xc9, 0x2d, 0xbf, 0xe8]);
interface IDockingWindow : IOleWindow
{
    HRESULT ShowDW(BOOL);
    HRESULT CloseDW(uint);
    HRESULT ResizeBorderDW(RECT*, IUnknown, BOOL);
}
struct DESKBANDINFO
{
    uint dwMask;
    POINTL ptMinSize;
    POINTL ptMaxSize;
    POINTL ptIntegral;
    POINTL ptActual;
    wchar[256] wszTitle;
    uint dwModeFlags;
    COLORREF crBkgnd;
}
alias DESKBANDCID = int;
enum : int
{
    DBID_BANDINFOCHANGED = 0x00000000,
    DBID_SHOWONLY        = 0x00000001,
    DBID_MAXIMIZEBAND    = 0x00000002,
    DBID_PUSHCHEVRON     = 0x00000003,
    DBID_DELAYINIT       = 0x00000004,
    DBID_FINISHINIT      = 0x00000005,
    DBID_SETWINDOWTHEME  = 0x00000006,
    DBID_PERMITAUTOHIDE  = 0x00000007,
}

enum IID_IDeskBand = GUID(0xeb0fe172, 0x1a3a, 0x11d0, [0x89, 0xb3, 0x0, 0xa0, 0xc9, 0xa, 0x90, 0xac]);
interface IDeskBand : IDockingWindow
{
    HRESULT GetBandInfo(uint, uint, DESKBANDINFO*);
}
enum IID_IDeskBandInfo = GUID(0x77e425fc, 0xcbf9, 0x4307, [0xba, 0x6a, 0xbb, 0x57, 0x27, 0x74, 0x56, 0x61]);
interface IDeskBandInfo : IUnknown
{
    HRESULT GetDefaultBandWidth(uint, uint, int*);
}
enum IID_ITaskbarList = GUID(0x56fdf342, 0xfd6d, 0x11d0, [0x95, 0x8a, 0x0, 0x60, 0x97, 0xc9, 0xa0, 0x90]);
interface ITaskbarList : IUnknown
{
    HRESULT HrInit();
    HRESULT AddTab(HWND);
    HRESULT DeleteTab(HWND);
    HRESULT ActivateTab(HWND);
    HRESULT SetActiveAlt(HWND);
}
enum IID_ITaskbarList2 = GUID(0x602d4995, 0xb13a, 0x429b, [0xa6, 0x6e, 0x19, 0x35, 0xe4, 0x4f, 0x43, 0x17]);
interface ITaskbarList2 : ITaskbarList
{
    HRESULT MarkFullscreenWindow(HWND, BOOL);
}
alias THUMBBUTTONFLAGS = int;
enum : int
{
    THBF_ENABLED        = 0x00000000,
    THBF_DISABLED       = 0x00000001,
    THBF_DISMISSONCLICK = 0x00000002,
    THBF_NOBACKGROUND   = 0x00000004,
    THBF_HIDDEN         = 0x00000008,
    THBF_NONINTERACTIVE = 0x00000010,
}

alias THUMBBUTTONMASK = int;
enum : int
{
    THB_BITMAP  = 0x00000001,
    THB_ICON    = 0x00000002,
    THB_TOOLTIP = 0x00000004,
    THB_FLAGS   = 0x00000008,
}

struct THUMBBUTTON
{
    THUMBBUTTONMASK dwMask;
    uint iId;
    uint iBitmap;
    HICON hIcon;
    wchar[260] szTip;
    THUMBBUTTONFLAGS dwFlags;
}
alias TBPFLAG = int;
enum : int
{
    TBPF_NOPROGRESS    = 0x00000000,
    TBPF_INDETERMINATE = 0x00000001,
    TBPF_NORMAL        = 0x00000002,
    TBPF_ERROR         = 0x00000004,
    TBPF_PAUSED        = 0x00000008,
}

enum IID_ITaskbarList3 = GUID(0xea1afb91, 0x9e28, 0x4b86, [0x90, 0xe9, 0x9e, 0x9f, 0x8a, 0x5e, 0xef, 0xaf]);
interface ITaskbarList3 : ITaskbarList2
{
    HRESULT SetProgressValue(HWND, ulong, ulong);
    HRESULT SetProgressState(HWND, TBPFLAG);
    HRESULT RegisterTab(HWND, HWND);
    HRESULT UnregisterTab(HWND);
    HRESULT SetTabOrder(HWND, HWND);
    HRESULT SetTabActive(HWND, HWND, uint);
    HRESULT ThumbBarAddButtons(HWND, uint, THUMBBUTTON*);
    HRESULT ThumbBarUpdateButtons(HWND, uint, THUMBBUTTON*);
    HRESULT ThumbBarSetImageList(HWND, HIMAGELIST);
    HRESULT SetOverlayIcon(HWND, HICON, const(wchar)*);
    HRESULT SetThumbnailTooltip(HWND, const(wchar)*);
    HRESULT SetThumbnailClip(HWND, RECT*);
}
alias STPFLAG = int;
enum : int
{
    STPF_NONE                      = 0x00000000,
    STPF_USEAPPTHUMBNAILALWAYS     = 0x00000001,
    STPF_USEAPPTHUMBNAILWHENACTIVE = 0x00000002,
    STPF_USEAPPPEEKALWAYS          = 0x00000004,
    STPF_USEAPPPEEKWHENACTIVE      = 0x00000008,
}

enum IID_ITaskbarList4 = GUID(0xc43dc798, 0x95d1, 0x4bea, [0x90, 0x30, 0xbb, 0x99, 0xe2, 0x98, 0x3a, 0x1a]);
interface ITaskbarList4 : ITaskbarList3
{
    HRESULT SetTabProperties(HWND, STPFLAG);
}
enum IID_IExplorerBrowserEvents = GUID(0x361bbdc7, 0xe6ee, 0x4e13, [0xbe, 0x58, 0x58, 0xe2, 0x24, 0xc, 0x81, 0xf]);
interface IExplorerBrowserEvents : IUnknown
{
    HRESULT OnNavigationPending(ITEMIDLIST*);
    HRESULT OnViewCreated(IShellView);
    HRESULT OnNavigationComplete(ITEMIDLIST*);
    HRESULT OnNavigationFailed(ITEMIDLIST*);
}
alias EXPLORER_BROWSER_OPTIONS = int;
enum : int
{
    EBO_NONE               = 0x00000000,
    EBO_NAVIGATEONCE       = 0x00000001,
    EBO_SHOWFRAMES         = 0x00000002,
    EBO_ALWAYSNAVIGATE     = 0x00000004,
    EBO_NOTRAVELLOG        = 0x00000008,
    EBO_NOWRAPPERWINDOW    = 0x00000010,
    EBO_HTMLSHAREPOINTVIEW = 0x00000020,
    EBO_NOBORDER           = 0x00000040,
    EBO_NOPERSISTVIEWSTATE = 0x00000080,
}

alias EXPLORER_BROWSER_FILL_FLAGS = int;
enum : int
{
    EBF_NONE                 = 0x00000000,
    EBF_SELECTFROMDATAOBJECT = 0x00000100,
    EBF_NODROPTARGET         = 0x00000200,
}

enum IID_IExplorerBrowser = GUID(0xdfd3b6b5, 0xc10c, 0x4be9, [0x85, 0xf6, 0xa6, 0x69, 0x69, 0xf4, 0x2, 0xf6]);
interface IExplorerBrowser : IUnknown
{
    HRESULT Initialize(HWND, const(RECT)*, const(FOLDERSETTINGS)*);
    HRESULT Destroy();
    HRESULT SetRect(long*, RECT);
    HRESULT SetPropertyBag(const(wchar)*);
    HRESULT SetEmptyText(const(wchar)*);
    HRESULT SetFolderSettings(const(FOLDERSETTINGS)*);
    HRESULT Advise(IExplorerBrowserEvents, uint*);
    HRESULT Unadvise(uint);
    HRESULT SetOptions(EXPLORER_BROWSER_OPTIONS);
    HRESULT GetOptions(EXPLORER_BROWSER_OPTIONS*);
    HRESULT BrowseToIDList(ITEMIDLIST*, uint);
    HRESULT BrowseToObject(IUnknown, uint);
    HRESULT FillFromObject(IUnknown, EXPLORER_BROWSER_FILL_FLAGS);
    HRESULT RemoveAll();
    HRESULT GetCurrentView(const(GUID)*, void**);
}
enum IID_IEnumObjects = GUID(0x2c1c7e2e, 0x2d0e, 0x4059, [0x83, 0x1e, 0x1e, 0x6f, 0x82, 0x33, 0x5c, 0x2e]);
interface IEnumObjects : IUnknown
{
    HRESULT Next(uint, const(GUID)*, void**, uint*);
    HRESULT Skip(uint);
    HRESULT Reset();
    HRESULT Clone(IEnumObjects*);
}
alias _OPPROGDLGF = int;
enum : int
{
    OPPROGDLG_DEFAULT               = 0x00000000,
    OPPROGDLG_ENABLEPAUSE           = 0x00000080,
    OPPROGDLG_ALLOWUNDO             = 0x00000100,
    OPPROGDLG_DONTDISPLAYSOURCEPATH = 0x00000200,
    OPPROGDLG_DONTDISPLAYDESTPATH   = 0x00000400,
    OPPROGDLG_NOMULTIDAYESTIMATES   = 0x00000800,
    OPPROGDLG_DONTDISPLAYLOCATIONS  = 0x00001000,
}

alias _PDMODE = int;
enum : int
{
    PDM_DEFAULT        = 0x00000000,
    PDM_RUN            = 0x00000001,
    PDM_PREFLIGHT      = 0x00000002,
    PDM_UNDOING        = 0x00000004,
    PDM_ERRORSBLOCKING = 0x00000008,
    PDM_INDETERMINATE  = 0x00000010,
}

enum IID_IOperationsProgressDialog = GUID(0xc9fb851, 0xe5c9, 0x43eb, [0xa3, 0x70, 0xf0, 0x67, 0x7b, 0x13, 0x87, 0x4c]);
interface IOperationsProgressDialog : IUnknown
{
    HRESULT StartProgressDialog(HWND, uint);
    HRESULT StopProgressDialog();
    HRESULT SetOperation(SPACTION);
    HRESULT SetMode(uint);
    HRESULT UpdateProgress(ulong, ulong, ulong, ulong, ulong, ulong);
    HRESULT UpdateLocations(IShellItem, IShellItem, IShellItem);
    HRESULT ResetTimer();
    HRESULT PauseTimer();
    HRESULT ResumeTimer();
    HRESULT GetMilliseconds(ulong*, ulong*);
    HRESULT GetOperationStatus(PDOPSTATUS*);
}
enum IID_IIOCancelInformation = GUID(0xf5b0bf81, 0x8cb5, 0x4b1b, [0x94, 0x49, 0x1a, 0x15, 0x9e, 0xc, 0x73, 0x3c]);
interface IIOCancelInformation : IUnknown
{
    HRESULT SetCancelInformation(uint, uint);
    HRESULT GetCancelInformation(uint*, uint*);
}
enum IID_IFileOperation = GUID(0x947aab5f, 0xa5c, 0x4c13, [0xb4, 0xd6, 0x4b, 0xf7, 0x83, 0x6f, 0xc9, 0xf8]);
interface IFileOperation : IUnknown
{
    HRESULT Advise(IFileOperationProgressSink, uint*);
    HRESULT Unadvise(uint);
    HRESULT SetOperationFlags(uint);
    HRESULT SetProgressMessage(const(wchar)*);
    HRESULT SetProgressDialog(IOperationsProgressDialog);
    HRESULT SetProperties(IPropertyChangeArray);
    HRESULT SetOwnerWindow(HWND);
    HRESULT ApplyPropertiesToItem(IShellItem);
    HRESULT ApplyPropertiesToItems(IUnknown);
    HRESULT RenameItem(IShellItem, const(wchar)*, IFileOperationProgressSink);
    HRESULT RenameItems(IUnknown, const(wchar)*);
    HRESULT MoveItem(IShellItem, IShellItem, const(wchar)*, IFileOperationProgressSink);
    HRESULT MoveItems(IUnknown, IShellItem);
    HRESULT CopyItem(IShellItem, IShellItem, const(wchar)*, IFileOperationProgressSink);
    HRESULT CopyItems(IUnknown, IShellItem);
    HRESULT DeleteItem(IShellItem, IFileOperationProgressSink);
    HRESULT DeleteItems(IUnknown);
    HRESULT NewItem(IShellItem, uint, const(wchar)*, const(wchar)*, IFileOperationProgressSink);
    HRESULT PerformOperations();
    HRESULT GetAnyOperationsAborted(BOOL*);
}
alias FILE_OPERATION_FLAGS2 = int;
enum : int
{
    FOF2_NONE                    = 0x00000000,
    FOF2_MERGEFOLDERSONCOLLISION = 0x00000001,
}

enum IID_IFileOperation2 = GUID(0xcd8f23c1, 0x8f61, 0x4916, [0x90, 0x9d, 0x55, 0xbd, 0xd0, 0x91, 0x87, 0x53]);
interface IFileOperation2 : IFileOperation
{
    HRESULT SetOperationFlags2(FILE_OPERATION_FLAGS2);
}
enum IID_IObjectProvider = GUID(0xa6087428, 0x3be3, 0x4d73, [0xb3, 0x8, 0x7c, 0x4, 0xa5, 0x40, 0xbf, 0x1a]);
interface IObjectProvider : IUnknown
{
    HRESULT QueryObject(const(GUID)*, const(GUID)*, void**);
}
enum IID_INamespaceWalkCB = GUID(0xd92995f8, 0xcf5e, 0x4a76, [0xbf, 0x59, 0xea, 0xd3, 0x9e, 0xa2, 0xb9, 0x7e]);
interface INamespaceWalkCB : IUnknown
{
    HRESULT FoundItem(IShellFolder, ITEMIDLIST*);
    HRESULT EnterFolder(IShellFolder, ITEMIDLIST*);
    HRESULT LeaveFolder(IShellFolder, ITEMIDLIST*);
    HRESULT InitializeProgressDialog(PWSTR*, PWSTR*);
}
enum IID_INamespaceWalkCB2 = GUID(0x7ac7492b, 0xc38e, 0x438a, [0x87, 0xdb, 0x68, 0x73, 0x78, 0x44, 0xff, 0x70]);
interface INamespaceWalkCB2 : INamespaceWalkCB
{
    HRESULT WalkComplete(HRESULT);
}
alias NAMESPACEWALKFLAG = int;
enum : int
{
    NSWF_DEFAULT                        = 0x00000000,
    NSWF_NONE_IMPLIES_ALL               = 0x00000001,
    NSWF_ONE_IMPLIES_ALL                = 0x00000002,
    NSWF_DONT_TRAVERSE_LINKS            = 0x00000004,
    NSWF_DONT_ACCUMULATE_RESULT         = 0x00000008,
    NSWF_TRAVERSE_STREAM_JUNCTIONS      = 0x00000010,
    NSWF_FILESYSTEM_ONLY                = 0x00000020,
    NSWF_SHOW_PROGRESS                  = 0x00000040,
    NSWF_FLAG_VIEWORDER                 = 0x00000080,
    NSWF_IGNORE_AUTOPLAY_HIDA           = 0x00000100,
    NSWF_ASYNC                          = 0x00000200,
    NSWF_DONT_RESOLVE_LINKS             = 0x00000400,
    NSWF_ACCUMULATE_FOLDERS             = 0x00000800,
    NSWF_DONT_SORT                      = 0x00001000,
    NSWF_USE_TRANSFER_MEDIUM            = 0x00002000,
    NSWF_DONT_TRAVERSE_STREAM_JUNCTIONS = 0x00004000,
    NSWF_ANY_IMPLIES_ALL                = 0x00008000,
}

enum IID_INamespaceWalk = GUID(0x57ced8a7, 0x3f4a, 0x432c, [0x93, 0x50, 0x30, 0xf2, 0x44, 0x83, 0xf7, 0x4f]);
interface INamespaceWalk : IUnknown
{
    HRESULT Walk(IUnknown, uint, int, INamespaceWalkCB);
    HRESULT GetIDArrayResult(uint*, ITEMIDLIST***);
}
struct BANDSITEINFO
{
    uint dwMask;
    uint dwState;
    uint dwStyle;
}
alias BANDSITECID = int;
enum : int
{
    BSID_BANDADDED   = 0x00000000,
    BSID_BANDREMOVED = 0x00000001,
}

enum IID_IBandSite = GUID(0x4cf504b0, 0xde96, 0x11d0, [0x8b, 0x3f, 0x0, 0xa0, 0xc9, 0x11, 0xe8, 0xe5]);
interface IBandSite : IUnknown
{
    HRESULT AddBand(IUnknown);
    HRESULT EnumBands(uint, uint*);
    HRESULT QueryBand(uint, IDeskBand*, uint*, PWSTR, int);
    HRESULT SetBandState(uint, uint, uint);
    HRESULT RemoveBand(uint);
    HRESULT GetBandObject(uint, const(GUID)*, void**);
    HRESULT SetBandSiteInfo(const(BANDSITEINFO)*);
    HRESULT GetBandSiteInfo(BANDSITEINFO*);
}
enum IID_IModalWindow = GUID(0xb4db1657, 0x70d7, 0x485e, [0x8e, 0x3e, 0x6f, 0xcb, 0x5a, 0x5c, 0x18, 0x2]);
interface IModalWindow : IUnknown
{
    HRESULT Show(HWND);
}
enum IID_IContextMenuSite = GUID(0x811aebe, 0xb87, 0x4c54, [0x9e, 0x72, 0x54, 0x8c, 0xf6, 0x49, 0x1, 0x6b]);
interface IContextMenuSite : IUnknown
{
    HRESULT DoContextMenuPopup(IUnknown, uint, POINT);
}
alias MENUBANDHANDLERCID = int;
enum : int
{
    MBHANDCID_PIDLSELECT = 0x00000000,
}

enum IID_IMenuBand = GUID(0x568804cd, 0xcbd7, 0x11d0, [0x98, 0x16, 0x0, 0xc0, 0x4f, 0xd9, 0x19, 0x72]);
interface IMenuBand : IUnknown
{
    HRESULT IsMenuMessage(MSG*);
    HRESULT TranslateMenuMessage(MSG*, LRESULT*);
}
enum IID_IRegTreeItem = GUID(0xa9521922, 0x812, 0x4d44, [0x9e, 0xc3, 0x7f, 0xd3, 0x8c, 0x72, 0x6f, 0x3d]);
interface IRegTreeItem : IUnknown
{
    HRESULT GetCheckState(BOOL*);
    HRESULT SetCheckState(BOOL);
}
enum IID_IDeskBar = GUID(0xeb0fe173, 0x1a3a, 0x11d0, [0x89, 0xb3, 0x0, 0xa0, 0xc9, 0xa, 0x90, 0xac]);
interface IDeskBar : IOleWindow
{
    HRESULT SetClient(IUnknown);
    HRESULT GetClient(IUnknown*);
    HRESULT OnPosRectChangeDB(RECT*);
}
alias MENUPOPUPSELECT = int;
enum : int
{
    MPOS_EXECUTE       = 0x00000000,
    MPOS_FULLCANCEL    = 0x00000001,
    MPOS_CANCELLEVEL   = 0x00000002,
    MPOS_SELECTLEFT    = 0x00000003,
    MPOS_SELECTRIGHT   = 0x00000004,
    MPOS_CHILDTRACKING = 0x00000005,
}

alias MENUPOPUPPOPUPFLAGS = int;
enum : int
{
    MPPF_SETFOCUS      = 0x00000001,
    MPPF_INITIALSELECT = 0x00000002,
    MPPF_NOANIMATE     = 0x00000004,
    MPPF_KEYBOARD      = 0x00000010,
    MPPF_REPOSITION    = 0x00000020,
    MPPF_FORCEZORDER   = 0x00000040,
    MPPF_FINALSELECT   = 0x00000080,
    MPPF_TOP           = 0x20000000,
    MPPF_LEFT          = 0x40000000,
    MPPF_RIGHT         = 0x60000000,
    MPPF_BOTTOM        = 0x80000000,
    MPPF_POS_MASK      = 0xe0000000,
    MPPF_ALIGN_LEFT    = 0x02000000,
    MPPF_ALIGN_RIGHT   = 0x04000000,
}

enum IID_IMenuPopup = GUID(0xd1e7afeb, 0x6a2e, 0x11d0, [0x8c, 0x78, 0x0, 0xc0, 0x4f, 0xd9, 0x18, 0xb4]);
interface IMenuPopup : IDeskBar
{
    HRESULT Popup(POINTL*, RECTL*, int);
    HRESULT OnSelect(uint);
    HRESULT SetSubMenu(IMenuPopup, BOOL);
}
alias FILE_USAGE_TYPE = int;
enum : int
{
    FUT_PLAYING = 0x00000000,
    FUT_EDITING = 0x00000001,
    FUT_GENERIC = 0x00000002,
}

enum IID_IFileIsInUse = GUID(0x64a1cbf0, 0x3a1a, 0x4461, [0x91, 0x58, 0x37, 0x69, 0x69, 0x69, 0x39, 0x50]);
interface IFileIsInUse : IUnknown
{
    HRESULT GetAppName(PWSTR*);
    HRESULT GetUsage(FILE_USAGE_TYPE*);
    HRESULT GetCapabilities(uint*);
    HRESULT GetSwitchToHWND(HWND*);
    HRESULT CloseFile();
}
alias FDE_OVERWRITE_RESPONSE = int;
enum : int
{
    FDEOR_DEFAULT = 0x00000000,
    FDEOR_ACCEPT  = 0x00000001,
    FDEOR_REFUSE  = 0x00000002,
}

alias FDE_SHAREVIOLATION_RESPONSE = int;
enum : int
{
    FDESVR_DEFAULT = 0x00000000,
    FDESVR_ACCEPT  = 0x00000001,
    FDESVR_REFUSE  = 0x00000002,
}

alias FDAP = int;
enum : int
{
    FDAP_BOTTOM = 0x00000000,
    FDAP_TOP    = 0x00000001,
}

enum IID_IFileDialogEvents = GUID(0x973510db, 0x7d7f, 0x452b, [0x89, 0x75, 0x74, 0xa8, 0x58, 0x28, 0xd3, 0x54]);
interface IFileDialogEvents : IUnknown
{
    HRESULT OnFileOk(IFileDialog);
    HRESULT OnFolderChanging(IFileDialog, IShellItem);
    HRESULT OnFolderChange(IFileDialog);
    HRESULT OnSelectionChange(IFileDialog);
    HRESULT OnShareViolation(IFileDialog, IShellItem, FDE_SHAREVIOLATION_RESPONSE*);
    HRESULT OnTypeChange(IFileDialog);
    HRESULT OnOverwrite(IFileDialog, IShellItem, FDE_OVERWRITE_RESPONSE*);
}
alias FILEOPENDIALOGOPTIONS = uint;
enum : uint
{
    FOS_OVERWRITEPROMPT          = 0x00000002,
    FOS_STRICTFILETYPES          = 0x00000004,
    FOS_NOCHANGEDIR              = 0x00000008,
    FOS_PICKFOLDERS              = 0x00000020,
    FOS_FORCEFILESYSTEM          = 0x00000040,
    FOS_ALLNONSTORAGEITEMS       = 0x00000080,
    FOS_NOVALIDATE               = 0x00000100,
    FOS_ALLOWMULTISELECT         = 0x00000200,
    FOS_PATHMUSTEXIST            = 0x00000800,
    FOS_FILEMUSTEXIST            = 0x00001000,
    FOS_CREATEPROMPT             = 0x00002000,
    FOS_SHAREAWARE               = 0x00004000,
    FOS_NOREADONLYRETURN         = 0x00008000,
    FOS_NOTESTFILECREATE         = 0x00010000,
    FOS_HIDEMRUPLACES            = 0x00020000,
    FOS_HIDEPINNEDPLACES         = 0x00040000,
    FOS_NODEREFERENCELINKS       = 0x00100000,
    FOS_OKBUTTONNEEDSINTERACTION = 0x00200000,
    FOS_DONTADDTORECENT          = 0x02000000,
    FOS_FORCESHOWHIDDEN          = 0x10000000,
    FOS_DEFAULTNOMINIMODE        = 0x20000000,
    FOS_FORCEPREVIEWPANEON       = 0x40000000,
    FOS_SUPPORTSTREAMABLEITEMS   = 0x80000000,
}

enum IID_IFileDialog = GUID(0x42f85136, 0xdb7e, 0x439c, [0x85, 0xf1, 0xe4, 0x7, 0x5d, 0x13, 0x5f, 0xc8]);
interface IFileDialog : IModalWindow
{
    HRESULT SetFileTypes(uint, const(COMDLG_FILTERSPEC)*);
    HRESULT SetFileTypeIndex(uint);
    HRESULT GetFileTypeIndex(uint*);
    HRESULT Advise(IFileDialogEvents, uint*);
    HRESULT Unadvise(uint);
    HRESULT SetOptions(FILEOPENDIALOGOPTIONS);
    HRESULT GetOptions(FILEOPENDIALOGOPTIONS*);
    HRESULT SetDefaultFolder(IShellItem);
    HRESULT SetFolder(IShellItem);
    HRESULT GetFolder(IShellItem*);
    HRESULT GetCurrentSelection(IShellItem*);
    HRESULT SetFileName(const(wchar)*);
    HRESULT GetFileName(PWSTR*);
    HRESULT SetTitle(const(wchar)*);
    HRESULT SetOkButtonLabel(const(wchar)*);
    HRESULT SetFileNameLabel(const(wchar)*);
    HRESULT GetResult(IShellItem*);
    HRESULT AddPlace(IShellItem, FDAP);
    HRESULT SetDefaultExtension(const(wchar)*);
    HRESULT Close(HRESULT);
    HRESULT SetClientGuid(const(GUID)*);
    HRESULT ClearClientData();
    HRESULT SetFilter(IShellItemFilter);
}
enum IID_IFileSaveDialog = GUID(0x84bccd23, 0x5fde, 0x4cdb, [0xae, 0xa4, 0xaf, 0x64, 0xb8, 0x3d, 0x78, 0xab]);
interface IFileSaveDialog : IFileDialog
{
    HRESULT SetSaveAsItem(IShellItem);
    HRESULT SetProperties(IPropertyStore);
    HRESULT SetCollectedProperties(IPropertyDescriptionList, BOOL);
    HRESULT GetProperties(IPropertyStore*);
    HRESULT ApplyProperties(IShellItem, IPropertyStore, HWND, IFileOperationProgressSink);
}
enum IID_IFileOpenDialog = GUID(0xd57c7288, 0xd4ad, 0x4768, [0xbe, 0x2, 0x9d, 0x96, 0x95, 0x32, 0xd9, 0x60]);
interface IFileOpenDialog : IFileDialog
{
    HRESULT GetResults(IShellItemArray*);
    HRESULT GetSelectedItems(IShellItemArray*);
}
alias CDCONTROLSTATEF = int;
enum : int
{
    CDCS_INACTIVE       = 0x00000000,
    CDCS_ENABLED        = 0x00000001,
    CDCS_VISIBLE        = 0x00000002,
    CDCS_ENABLEDVISIBLE = 0x00000003,
}

enum IID_IFileDialogCustomize = GUID(0xe6fdd21a, 0x163f, 0x4975, [0x9c, 0x8c, 0xa6, 0x9f, 0x1b, 0xa3, 0x70, 0x34]);
interface IFileDialogCustomize : IUnknown
{
    HRESULT EnableOpenDropDown(uint);
    HRESULT AddMenu(uint, const(wchar)*);
    HRESULT AddPushButton(uint, const(wchar)*);
    HRESULT AddComboBox(uint);
    HRESULT AddRadioButtonList(uint);
    HRESULT AddCheckButton(uint, const(wchar)*, BOOL);
    HRESULT AddEditBox(uint, const(wchar)*);
    HRESULT AddSeparator(uint);
    HRESULT AddText(uint, const(wchar)*);
    HRESULT SetControlLabel(uint, const(wchar)*);
    HRESULT GetControlState(uint, CDCONTROLSTATEF*);
    HRESULT SetControlState(uint, CDCONTROLSTATEF);
    HRESULT GetEditBoxText(uint, ushort**);
    HRESULT SetEditBoxText(uint, const(wchar)*);
    HRESULT GetCheckButtonState(uint, BOOL*);
    HRESULT SetCheckButtonState(uint, BOOL);
    HRESULT AddControlItem(uint, uint, const(wchar)*);
    HRESULT RemoveControlItem(uint, uint);
    HRESULT RemoveAllControlItems(uint);
    HRESULT GetControlItemState(uint, uint, CDCONTROLSTATEF*);
    HRESULT SetControlItemState(uint, uint, CDCONTROLSTATEF);
    HRESULT GetSelectedControlItem(uint, uint*);
    HRESULT SetSelectedControlItem(uint, uint);
    HRESULT StartVisualGroup(uint, const(wchar)*);
    HRESULT EndVisualGroup();
    HRESULT MakeProminent(uint);
    HRESULT SetControlItemText(uint, uint, const(wchar)*);
}
alias ASSOCIATIONLEVEL = int;
enum : int
{
    AL_MACHINE   = 0x00000000,
    AL_EFFECTIVE = 0x00000001,
    AL_USER      = 0x00000002,
}

alias ASSOCIATIONTYPE = int;
enum : int
{
    AT_FILEEXTENSION   = 0x00000000,
    AT_URLPROTOCOL     = 0x00000001,
    AT_STARTMENUCLIENT = 0x00000002,
    AT_MIMETYPE        = 0x00000003,
}

enum IID_IApplicationAssociationRegistration = GUID(0x4e530b0a, 0xe611, 0x4c77, [0xa3, 0xac, 0x90, 0x31, 0xd0, 0x22, 0x28, 0x1b]);
interface IApplicationAssociationRegistration : IUnknown
{
    HRESULT QueryCurrentDefault(const(wchar)*, ASSOCIATIONTYPE, ASSOCIATIONLEVEL, PWSTR*);
    HRESULT QueryAppIsDefault(const(wchar)*, ASSOCIATIONTYPE, ASSOCIATIONLEVEL, const(wchar)*, BOOL*);
    HRESULT QueryAppIsDefaultAll(ASSOCIATIONLEVEL, const(wchar)*, BOOL*);
    HRESULT SetAppAsDefault(const(wchar)*, const(wchar)*, ASSOCIATIONTYPE);
    HRESULT SetAppAsDefaultAll(const(wchar)*);
    HRESULT ClearUserAssociations();
}
struct DELEGATEITEMID
{
    align (1):
    ushort cbSize;
    ushort wOuter;
    ushort cbInner;
    ubyte[1] rgb;
}
enum IID_IDelegateFolder = GUID(0xadd8ba80, 0x2b, 0x11d0, [0x8f, 0xf, 0x0, 0xc0, 0x4f, 0xd7, 0xd0, 0x62]);
interface IDelegateFolder : IUnknown
{
    HRESULT SetItemAlloc(IMalloc);
}
alias _BROWSERFRAMEOPTIONS = int;
enum : int
{
    BFO_NONE                             = 0x00000000,
    BFO_BROWSER_PERSIST_SETTINGS         = 0x00000001,
    BFO_RENAME_FOLDER_OPTIONS_TOINTERNET = 0x00000002,
    BFO_BOTH_OPTIONS                     = 0x00000004,
    BIF_PREFER_INTERNET_SHORTCUT         = 0x00000008,
    BFO_BROWSE_NO_IN_NEW_PROCESS         = 0x00000010,
    BFO_ENABLE_HYPERLINK_TRACKING        = 0x00000020,
    BFO_USE_IE_OFFLINE_SUPPORT           = 0x00000040,
    BFO_SUBSTITUE_INTERNET_START_PAGE    = 0x00000080,
    BFO_USE_IE_LOGOBANDING               = 0x00000100,
    BFO_ADD_IE_TOCAPTIONBAR              = 0x00000200,
    BFO_USE_DIALUP_REF                   = 0x00000400,
    BFO_USE_IE_TOOLBAR                   = 0x00000800,
    BFO_NO_PARENT_FOLDER_SUPPORT         = 0x00001000,
    BFO_NO_REOPEN_NEXT_RESTART           = 0x00002000,
    BFO_GO_HOME_PAGE                     = 0x00004000,
    BFO_PREFER_IEPROCESS                 = 0x00008000,
    BFO_SHOW_NAVIGATION_CANCELLED        = 0x00010000,
    BFO_USE_IE_STATUSBAR                 = 0x00020000,
    BFO_QUERY_ALL                        = 0xffffffff,
}

enum IID_IBrowserFrameOptions = GUID(0x10df43c8, 0x1dbe, 0x11d3, [0x8b, 0x34, 0x0, 0x60, 0x97, 0xdf, 0x5b, 0xd4]);
interface IBrowserFrameOptions : IUnknown
{
    HRESULT GetFrameOptions(uint, uint*);
}
alias NWMF = int;
enum : int
{
    NWMF_UNLOADING       = 0x00000001,
    NWMF_USERINITED      = 0x00000002,
    NWMF_FIRST           = 0x00000004,
    NWMF_OVERRIDEKEY     = 0x00000008,
    NWMF_SHOWHELP        = 0x00000010,
    NWMF_HTMLDIALOG      = 0x00000020,
    NWMF_FROMDIALOGCHILD = 0x00000040,
    NWMF_USERREQUESTED   = 0x00000080,
    NWMF_USERALLOWED     = 0x00000100,
    NWMF_FORCEWINDOW     = 0x00010000,
    NWMF_FORCETAB        = 0x00020000,
    NWMF_SUGGESTWINDOW   = 0x00040000,
    NWMF_SUGGESTTAB      = 0x00080000,
    NWMF_INACTIVETAB     = 0x00100000,
}

enum IID_INewWindowManager = GUID(0xd2bc4c84, 0x3f72, 0x4a52, [0xa6, 0x4, 0x7b, 0xcb, 0xf3, 0x98, 0x2c, 0xbb]);
interface INewWindowManager : IUnknown
{
    HRESULT EvaluateNewWindow(const(wchar)*, const(wchar)*, const(wchar)*, const(wchar)*, BOOL, uint, uint);
}
alias ATTACHMENT_PROMPT = int;
enum : int
{
    ATTACHMENT_PROMPT_NONE         = 0x00000000,
    ATTACHMENT_PROMPT_SAVE         = 0x00000001,
    ATTACHMENT_PROMPT_EXEC         = 0x00000002,
    ATTACHMENT_PROMPT_EXEC_OR_SAVE = 0x00000003,
}

alias ATTACHMENT_ACTION = int;
enum : int
{
    ATTACHMENT_ACTION_CANCEL = 0x00000000,
    ATTACHMENT_ACTION_SAVE   = 0x00000001,
    ATTACHMENT_ACTION_EXEC   = 0x00000002,
}

enum IID_IAttachmentExecute = GUID(0x73db1241, 0x1e85, 0x4581, [0x8e, 0x4f, 0xa8, 0x1e, 0x1d, 0xf, 0x8c, 0x57]);
interface IAttachmentExecute : IUnknown
{
    HRESULT SetClientTitle(const(wchar)*);
    HRESULT SetClientGuid(const(GUID)*);
    HRESULT SetLocalPath(const(wchar)*);
    HRESULT SetFileName(const(wchar)*);
    HRESULT SetSource(const(wchar)*);
    HRESULT SetReferrer(const(wchar)*);
    HRESULT CheckPolicy();
    HRESULT Prompt(HWND, ATTACHMENT_PROMPT, ATTACHMENT_ACTION*);
    HRESULT Save();
    HRESULT Execute(HWND, const(wchar)*, HANDLE*);
    HRESULT SaveWithUI(HWND);
    HRESULT ClearClientState();
}
struct SMDATA
{
    uint dwMask;
    uint dwFlags;
    HMENU hmenu;
    HWND hwnd;
    uint uId;
    uint uIdParent;
    uint uIdAncestor;
    IUnknown punk;
    ITEMIDLIST* pidlFolder;
    ITEMIDLIST* pidlItem;
    IShellFolder psf;
    void* pvUserData;
}
struct SMINFO
{
    uint dwMask;
    uint dwType;
    uint dwFlags;
    int iIcon;
}
struct SMCSHCHANGENOTIFYSTRUCT
{
    int lEvent;
    ITEMIDLIST* pidl1;
    ITEMIDLIST* pidl2;
}
alias SMINFOMASK = int;
enum : int
{
    SMIM_TYPE  = 0x00000001,
    SMIM_FLAGS = 0x00000002,
    SMIM_ICON  = 0x00000004,
}

alias SMINFOTYPE = int;
enum : int
{
    SMIT_SEPARATOR = 0x00000001,
    SMIT_STRING    = 0x00000002,
}

alias SMINFOFLAGS = int;
enum : int
{
    SMIF_ICON        = 0x00000001,
    SMIF_ACCELERATOR = 0x00000002,
    SMIF_DROPTARGET  = 0x00000004,
    SMIF_SUBMENU     = 0x00000008,
    SMIF_CHECKED     = 0x00000020,
    SMIF_DROPCASCADE = 0x00000040,
    SMIF_HIDDEN      = 0x00000080,
    SMIF_DISABLED    = 0x00000100,
    SMIF_TRACKPOPUP  = 0x00000200,
    SMIF_DEMOTED     = 0x00000400,
    SMIF_ALTSTATE    = 0x00000800,
    SMIF_DRAGNDROP   = 0x00001000,
    SMIF_NEW         = 0x00002000,
}

enum IID_IShellMenuCallback = GUID(0x4ca300a1, 0x9b8d, 0x11d1, [0x8b, 0x22, 0x0, 0xc0, 0x4f, 0xd9, 0x18, 0xd0]);
interface IShellMenuCallback : IUnknown
{
    HRESULT CallbackSM(SMDATA*, uint, WPARAM, LPARAM);
}
enum IID_IShellMenu = GUID(0xee1f7637, 0xe138, 0x11d1, [0x83, 0x79, 0x0, 0xc0, 0x4f, 0xd9, 0x18, 0xd0]);
interface IShellMenu : IUnknown
{
    HRESULT Initialize(IShellMenuCallback, uint, uint, uint);
    HRESULT GetMenuInfo(IShellMenuCallback*, uint*, uint*, uint*);
    HRESULT SetShellFolder(IShellFolder, ITEMIDLIST*, HKEY, uint);
    HRESULT GetShellFolder(uint*, ITEMIDLIST**, const(GUID)*, void**);
    HRESULT SetMenu(HMENU, HWND, uint);
    HRESULT GetMenu(HMENU*, HWND*, uint*);
    HRESULT InvalidateItem(SMDATA*, uint);
    HRESULT GetState(SMDATA*);
    HRESULT SetMenuToolbar(IUnknown, uint);
}
alias KF_CATEGORY = int;
enum : int
{
    KF_CATEGORY_VIRTUAL = 0x00000001,
    KF_CATEGORY_FIXED   = 0x00000002,
    KF_CATEGORY_COMMON  = 0x00000003,
    KF_CATEGORY_PERUSER = 0x00000004,
}

alias _KF_DEFINITION_FLAGS = int;
enum : int
{
    KFDF_LOCAL_REDIRECT_ONLY = 0x00000002,
    KFDF_ROAMABLE            = 0x00000004,
    KFDF_PRECREATE           = 0x00000008,
    KFDF_STREAM              = 0x00000010,
    KFDF_PUBLISHEXPANDEDPATH = 0x00000020,
    KFDF_NO_REDIRECT_UI      = 0x00000040,
}

alias _KF_REDIRECT_FLAGS = int;
enum : int
{
    KF_REDIRECT_USER_EXCLUSIVE               = 0x00000001,
    KF_REDIRECT_COPY_SOURCE_DACL             = 0x00000002,
    KF_REDIRECT_OWNER_USER                   = 0x00000004,
    KF_REDIRECT_SET_OWNER_EXPLICIT           = 0x00000008,
    KF_REDIRECT_CHECK_ONLY                   = 0x00000010,
    KF_REDIRECT_WITH_UI                      = 0x00000020,
    KF_REDIRECT_UNPIN                        = 0x00000040,
    KF_REDIRECT_PIN                          = 0x00000080,
    KF_REDIRECT_COPY_CONTENTS                = 0x00000200,
    KF_REDIRECT_DEL_SOURCE_CONTENTS          = 0x00000400,
    KF_REDIRECT_EXCLUDE_ALL_KNOWN_SUBFOLDERS = 0x00000800,
}

alias _KF_REDIRECTION_CAPABILITIES = int;
enum : int
{
    KF_REDIRECTION_CAPABILITIES_ALLOW_ALL              = 0x000000ff,
    KF_REDIRECTION_CAPABILITIES_REDIRECTABLE           = 0x00000001,
    KF_REDIRECTION_CAPABILITIES_DENY_ALL               = 0x000fff00,
    KF_REDIRECTION_CAPABILITIES_DENY_POLICY_REDIRECTED = 0x00000100,
    KF_REDIRECTION_CAPABILITIES_DENY_POLICY            = 0x00000200,
    KF_REDIRECTION_CAPABILITIES_DENY_PERMISSIONS       = 0x00000400,
}

struct KNOWNFOLDER_DEFINITION
{
    KF_CATEGORY category;
    PWSTR pszName;
    PWSTR pszDescription;
    GUID fidParent;
    PWSTR pszRelativePath;
    PWSTR pszParsingName;
    PWSTR pszTooltip;
    PWSTR pszLocalizedName;
    PWSTR pszIcon;
    PWSTR pszSecurity;
    uint dwAttributes;
    uint kfdFlags;
    GUID ftidType;
}
enum IID_IKnownFolder = GUID(0x3aa7af7e, 0x9b36, 0x420c, [0xa8, 0xe3, 0xf7, 0x7d, 0x46, 0x74, 0xa4, 0x88]);
interface IKnownFolder : IUnknown
{
    HRESULT GetId(GUID*);
    HRESULT GetCategory(KF_CATEGORY*);
    HRESULT GetShellItem(uint, const(GUID)*, void**);
    HRESULT GetPath(uint, PWSTR*);
    HRESULT SetPath(uint, const(wchar)*);
    HRESULT GetIDList(uint, ITEMIDLIST**);
    HRESULT GetFolderType(GUID*);
    HRESULT GetRedirectionCapabilities(uint*);
    HRESULT GetFolderDefinition(KNOWNFOLDER_DEFINITION*);
}
alias FFFP_MODE = int;
enum : int
{
    FFFP_EXACTMATCH         = 0x00000000,
    FFFP_NEARESTPARENTMATCH = 0x00000001,
}

enum IID_IKnownFolderManager = GUID(0x8be2d872, 0x86aa, 0x4d47, [0xb7, 0x76, 0x32, 0xcc, 0xa4, 0xc, 0x70, 0x18]);
interface IKnownFolderManager : IUnknown
{
    HRESULT FolderIdFromCsidl(int, GUID*);
    HRESULT FolderIdToCsidl(const(GUID)*, int*);
    HRESULT GetFolderIds(GUID**, uint*);
    HRESULT GetFolder(const(GUID)*, IKnownFolder*);
    HRESULT GetFolderByName(const(wchar)*, IKnownFolder*);
    HRESULT RegisterFolder(const(GUID)*, const(KNOWNFOLDER_DEFINITION)*);
    HRESULT UnregisterFolder(const(GUID)*);
    HRESULT FindFolderFromPath(const(wchar)*, FFFP_MODE, IKnownFolder*);
    HRESULT FindFolderFromIDList(ITEMIDLIST*, IKnownFolder*);
    HRESULT Redirect(const(GUID)*, HWND, uint, const(wchar)*, uint, const(GUID)*, PWSTR*);
}
alias SHARE_ROLE = int;
enum : int
{
    SHARE_ROLE_INVALID     = 0xffffffff,
    SHARE_ROLE_READER      = 0x00000000,
    SHARE_ROLE_CONTRIBUTOR = 0x00000001,
    SHARE_ROLE_CO_OWNER    = 0x00000002,
    SHARE_ROLE_OWNER       = 0x00000003,
    SHARE_ROLE_CUSTOM      = 0x00000004,
    SHARE_ROLE_MIXED       = 0x00000005,
}

alias DEF_SHARE_ID = int;
enum : int
{
    DEFSHAREID_USERS  = 0x00000001,
    DEFSHAREID_PUBLIC = 0x00000002,
}

enum IID_ISharingConfigurationManager = GUID(0xb4cd448a, 0x9c86, 0x4466, [0x92, 0x1, 0x2e, 0x62, 0x10, 0x5b, 0x87, 0xae]);
interface ISharingConfigurationManager : IUnknown
{
    HRESULT CreateShare(DEF_SHARE_ID, SHARE_ROLE);
    HRESULT DeleteShare(DEF_SHARE_ID);
    HRESULT ShareExists(DEF_SHARE_ID);
    HRESULT GetSharePermissions(DEF_SHARE_ID, SHARE_ROLE*);
    HRESULT SharePrinters();
    HRESULT StopSharingPrinters();
    HRESULT ArePrintersShared();
}
enum IID_IRelatedItem = GUID(0xa73ce67a, 0x8ab1, 0x44f1, [0x8d, 0x43, 0xd2, 0xfc, 0xbf, 0x6b, 0x1c, 0xd0]);
interface IRelatedItem : IUnknown
{
    HRESULT GetItemIDList(ITEMIDLIST**);
    HRESULT GetItem(IShellItem*);
}
enum IID_IIdentityName = GUID(0x7d903fca, 0xd6f9, 0x4810, [0x83, 0x32, 0x94, 0x6c, 0x1, 0x77, 0xe2, 0x47]);
interface IIdentityName : IRelatedItem
{
}
enum IID_IDelegateItem = GUID(0x3c5a1c94, 0xc951, 0x4cb7, [0xbb, 0x6d, 0x3b, 0x93, 0xf3, 0xc, 0xce, 0x93]);
interface IDelegateItem : IRelatedItem
{
}
enum IID_ICurrentItem = GUID(0x240a7174, 0xd653, 0x4a1d, [0xa6, 0xd3, 0xd4, 0x94, 0x3c, 0xfb, 0xfe, 0x3d]);
interface ICurrentItem : IRelatedItem
{
}
enum IID_ITransferMediumItem = GUID(0x77f295d5, 0x2d6f, 0x4e19, [0xb8, 0xae, 0x32, 0x2f, 0x3e, 0x72, 0x1a, 0xb5]);
interface ITransferMediumItem : IRelatedItem
{
}
enum IID_IDisplayItem = GUID(0xc6fd5997, 0x9f6b, 0x4888, [0x87, 0x3, 0x94, 0xe8, 0xe, 0x8c, 0xde, 0x3f]);
interface IDisplayItem : IRelatedItem
{
}
enum IID_IViewStateIdentityItem = GUID(0x9d264146, 0xa94f, 0x4195, [0x9f, 0x9f, 0x3b, 0xb1, 0x2c, 0xe0, 0xc9, 0x55]);
interface IViewStateIdentityItem : IRelatedItem
{
}
enum IID_IPreviewItem = GUID(0x36149969, 0xa8f, 0x49c8, [0x8b, 0x0, 0x4a, 0xec, 0xb2, 0x2, 0x22, 0xfb]);
interface IPreviewItem : IRelatedItem
{
}
enum IID_IDestinationStreamFactory = GUID(0x8a87781b, 0x39a7, 0x4a1f, [0xaa, 0xb3, 0xa3, 0x9b, 0x9c, 0x34, 0xa7, 0xd9]);
interface IDestinationStreamFactory : IUnknown
{
    HRESULT GetDestinationStream(IStream*);
}
enum IID_ICreateProcessInputs = GUID(0xf6ef6140, 0xe26f, 0x4d82, [0xba, 0xc4, 0xe9, 0xba, 0x5f, 0xd2, 0x39, 0xa8]);
interface ICreateProcessInputs : IUnknown
{
    HRESULT GetCreateFlags(uint*);
    HRESULT SetCreateFlags(uint);
    HRESULT AddCreateFlags(uint);
    HRESULT SetHotKey(ushort);
    HRESULT AddStartupFlags(uint);
    HRESULT SetTitle(const(wchar)*);
    HRESULT SetEnvironmentVariable(const(wchar)*, const(wchar)*);
}
enum IID_ICreatingProcess = GUID(0xc2b937a9, 0x3110, 0x4398, [0x8a, 0x56, 0xf3, 0x4c, 0x63, 0x42, 0xd2, 0x44]);
interface ICreatingProcess : IUnknown
{
    HRESULT OnCreating(ICreateProcessInputs);
}
enum IID_ILaunchUIContext = GUID(0x1791e8f6, 0x21c7, 0x4340, [0x88, 0x2a, 0xa6, 0xa9, 0x3e, 0x3f, 0xd7, 0x3b]);
interface ILaunchUIContext : IUnknown
{
    HRESULT SetAssociatedWindow(HWND);
    HRESULT SetTabGroupingPreference(uint);
}
enum IID_ILaunchUIContextProvider = GUID(0xd12c4c8, 0xa3d9, 0x4e24, [0x94, 0xc1, 0xe, 0x20, 0xc5, 0xa9, 0x56, 0xc4]);
interface ILaunchUIContextProvider : IUnknown
{
    HRESULT UpdateContext(ILaunchUIContext);
}
alias _NMCII_FLAGS = int;
enum : int
{
    NMCII_NONE    = 0x00000000,
    NMCII_ITEMS   = 0x00000001,
    NMCII_FOLDERS = 0x00000002,
}

alias _NMCSAEI_FLAGS = int;
enum : int
{
    NMCSAEI_SELECT = 0x00000000,
    NMCSAEI_EDIT   = 0x00000001,
}

enum IID_INewMenuClient = GUID(0xdcb07fdc, 0x3bb5, 0x451c, [0x90, 0xbe, 0x96, 0x66, 0x44, 0xfe, 0xd7, 0xb0]);
interface INewMenuClient : IUnknown
{
    HRESULT IncludeItems(int*);
    HRESULT SelectAndEditItem(ITEMIDLIST*, int);
}
enum IID_IInitializeWithBindCtx = GUID(0x71c0d2bc, 0x726d, 0x45cc, [0xa6, 0xc0, 0x2e, 0x31, 0xc1, 0xdb, 0x21, 0x59]);
interface IInitializeWithBindCtx : IUnknown
{
    HRESULT Initialize(IBindCtx);
}
enum IID_IShellItemFilter = GUID(0x2659b475, 0xeeb8, 0x48b7, [0x8f, 0x7, 0xb3, 0x78, 0x81, 0xf, 0x48, 0xcf]);
interface IShellItemFilter : IUnknown
{
    HRESULT IncludeItem(IShellItem);
    HRESULT GetEnumFlagsForItem(IShellItem, uint*);
}
alias _NSTCSTYLE = int;
enum : int
{
    NSTCS_HASEXPANDOS         = 0x00000001,
    NSTCS_HASLINES            = 0x00000002,
    NSTCS_SINGLECLICKEXPAND   = 0x00000004,
    NSTCS_FULLROWSELECT       = 0x00000008,
    NSTCS_SPRINGEXPAND        = 0x00000010,
    NSTCS_HORIZONTALSCROLL    = 0x00000020,
    NSTCS_ROOTHASEXPANDO      = 0x00000040,
    NSTCS_SHOWSELECTIONALWAYS = 0x00000080,
    NSTCS_NOINFOTIP           = 0x00000200,
    NSTCS_EVENHEIGHT          = 0x00000400,
    NSTCS_NOREPLACEOPEN       = 0x00000800,
    NSTCS_DISABLEDRAGDROP     = 0x00001000,
    NSTCS_NOORDERSTREAM       = 0x00002000,
    NSTCS_RICHTOOLTIP         = 0x00004000,
    NSTCS_BORDER              = 0x00008000,
    NSTCS_NOEDITLABELS        = 0x00010000,
    NSTCS_TABSTOP             = 0x00020000,
    NSTCS_FAVORITESMODE       = 0x00080000,
    NSTCS_AUTOHSCROLL         = 0x00100000,
    NSTCS_FADEINOUTEXPANDOS   = 0x00200000,
    NSTCS_EMPTYTEXT           = 0x00400000,
    NSTCS_CHECKBOXES          = 0x00800000,
    NSTCS_PARTIALCHECKBOXES   = 0x01000000,
    NSTCS_EXCLUSIONCHECKBOXES = 0x02000000,
    NSTCS_DIMMEDCHECKBOXES    = 0x04000000,
    NSTCS_NOINDENTCHECKS      = 0x08000000,
    NSTCS_ALLOWJUNCTIONS      = 0x10000000,
    NSTCS_SHOWTABSBUTTON      = 0x20000000,
    NSTCS_SHOWDELETEBUTTON    = 0x40000000,
    NSTCS_SHOWREFRESHBUTTON   = 0x80000000,
}

alias _NSTCROOTSTYLE = int;
enum : int
{
    NSTCRS_VISIBLE  = 0x00000000,
    NSTCRS_HIDDEN   = 0x00000001,
    NSTCRS_EXPANDED = 0x00000002,
}

alias _NSTCITEMSTATE = int;
enum : int
{
    NSTCIS_NONE             = 0x00000000,
    NSTCIS_SELECTED         = 0x00000001,
    NSTCIS_EXPANDED         = 0x00000002,
    NSTCIS_BOLD             = 0x00000004,
    NSTCIS_DISABLED         = 0x00000008,
    NSTCIS_SELECTEDNOEXPAND = 0x00000010,
}

alias NSTCGNI = int;
enum : int
{
    NSTCGNI_NEXT         = 0x00000000,
    NSTCGNI_NEXTVISIBLE  = 0x00000001,
    NSTCGNI_PREV         = 0x00000002,
    NSTCGNI_PREVVISIBLE  = 0x00000003,
    NSTCGNI_PARENT       = 0x00000004,
    NSTCGNI_CHILD        = 0x00000005,
    NSTCGNI_FIRSTVISIBLE = 0x00000006,
    NSTCGNI_LASTVISIBLE  = 0x00000007,
}

enum IID_INameSpaceTreeControl = GUID(0x28212a3, 0xb627, 0x47e9, [0x88, 0x56, 0xc1, 0x42, 0x65, 0x55, 0x4e, 0x4f]);
interface INameSpaceTreeControl : IUnknown
{
    HRESULT Initialize(HWND, RECT*, uint);
    HRESULT TreeAdvise(IUnknown, uint*);
    HRESULT TreeUnadvise(uint);
    HRESULT AppendRoot(IShellItem, uint, uint, IShellItemFilter);
    HRESULT InsertRoot(int, IShellItem, uint, uint, IShellItemFilter);
    HRESULT RemoveRoot(IShellItem);
    HRESULT RemoveAllRoots();
    HRESULT GetRootItems(IShellItemArray*);
    HRESULT SetItemState(IShellItem, uint, uint);
    HRESULT GetItemState(IShellItem, uint, uint*);
    HRESULT GetSelectedItems(IShellItemArray*);
    HRESULT GetItemCustomState(IShellItem, int*);
    HRESULT SetItemCustomState(IShellItem, int);
    HRESULT EnsureItemVisible(IShellItem);
    HRESULT SetTheme(const(wchar)*);
    HRESULT GetNextItem(IShellItem, NSTCGNI, IShellItem*);
    HRESULT HitTest(POINT*, IShellItem*);
    HRESULT GetItemRect(IShellItem, RECT*);
    HRESULT CollapseAll();
}
alias NSTCFOLDERCAPABILITIES = int;
enum : int
{
    NSTCFC_NONE                  = 0x00000000,
    NSTCFC_PINNEDITEMFILTERING   = 0x00000001,
    NSTCFC_DELAY_REGISTER_NOTIFY = 0x00000002,
}

enum IID_INameSpaceTreeControlFolderCapabilities = GUID(0xe9701183, 0xe6b3, 0x4ff2, [0x85, 0x68, 0x81, 0x36, 0x15, 0xfe, 0xc7, 0xbe]);
interface INameSpaceTreeControlFolderCapabilities : IUnknown
{
    HRESULT GetFolderCapabilities(NSTCFOLDERCAPABILITIES, NSTCFOLDERCAPABILITIES*);
}
enum IID_IPreviewHandler = GUID(0x8895b1c6, 0xb41f, 0x4c1c, [0xa5, 0x62, 0xd, 0x56, 0x42, 0x50, 0x83, 0x6f]);
interface IPreviewHandler : IUnknown
{
    HRESULT SetWindow(HWND, const(RECT)*);
    HRESULT SetRect(const(RECT)*);
    HRESULT DoPreview();
    HRESULT Unload();
    HRESULT SetFocus();
    HRESULT QueryFocus(HWND*);
    HRESULT TranslateAccelerator(MSG*);
}
struct PREVIEWHANDLERFRAMEINFO
{
    HACCEL haccel;
    uint cAccelEntries;
}
enum IID_IPreviewHandlerFrame = GUID(0xfec87aaf, 0x35f9, 0x447a, [0xad, 0xb7, 0x20, 0x23, 0x44, 0x91, 0x40, 0x1a]);
interface IPreviewHandlerFrame : IUnknown
{
    HRESULT GetWindowContext(PREVIEWHANDLERFRAMEINFO*);
    HRESULT TranslateAccelerator(MSG*);
}
alias _EXPLORERPANESTATE = int;
enum : int
{
    EPS_DONTCARE     = 0x00000000,
    EPS_DEFAULT_ON   = 0x00000001,
    EPS_DEFAULT_OFF  = 0x00000002,
    EPS_STATEMASK    = 0x0000ffff,
    EPS_INITIALSTATE = 0x00010000,
    EPS_FORCE        = 0x00020000,
}

enum IID_IExplorerPaneVisibility = GUID(0xe07010ec, 0xbc17, 0x44c0, [0x97, 0xb0, 0x46, 0xc7, 0xc9, 0x5b, 0x9e, 0xdc]);
interface IExplorerPaneVisibility : IUnknown
{
    HRESULT GetPaneState(const(GUID)*, uint*);
}
enum IID_IContextMenuCB = GUID(0x3409e930, 0x5a39, 0x11d1, [0x83, 0xfa, 0x0, 0xa0, 0xc9, 0xd, 0xc8, 0x49]);
interface IContextMenuCB : IUnknown
{
    HRESULT CallBack(IShellFolder, HWND, IDataObject, uint, WPARAM, LPARAM);
}
enum IID_IDefaultExtractIconInit = GUID(0x41ded17d, 0xd6b3, 0x4261, [0x99, 0x7d, 0x88, 0xc6, 0xe, 0x4b, 0x1d, 0x58]);
interface IDefaultExtractIconInit : IUnknown
{
    HRESULT SetFlags(uint);
    HRESULT SetKey(HKEY);
    HRESULT SetNormalIcon(const(wchar)*, int);
    HRESULT SetOpenIcon(const(wchar)*, int);
    HRESULT SetShortcutIcon(const(wchar)*, int);
    HRESULT SetDefaultIcon(const(wchar)*, int);
}
alias _EXPCMDSTATE = int;
enum : int
{
    ECS_ENABLED    = 0x00000000,
    ECS_DISABLED   = 0x00000001,
    ECS_HIDDEN     = 0x00000002,
    ECS_CHECKBOX   = 0x00000004,
    ECS_CHECKED    = 0x00000008,
    ECS_RADIOCHECK = 0x00000010,
}

alias _EXPCMDFLAGS = int;
enum : int
{
    ECF_DEFAULT         = 0x00000000,
    ECF_HASSUBCOMMANDS  = 0x00000001,
    ECF_HASSPLITBUTTON  = 0x00000002,
    ECF_HIDELABEL       = 0x00000004,
    ECF_ISSEPARATOR     = 0x00000008,
    ECF_HASLUASHIELD    = 0x00000010,
    ECF_SEPARATORBEFORE = 0x00000020,
    ECF_SEPARATORAFTER  = 0x00000040,
    ECF_ISDROPDOWN      = 0x00000080,
    ECF_TOGGLEABLE      = 0x00000100,
    ECF_AUTOMENUICONS   = 0x00000200,
}

enum IID_IExplorerCommand = GUID(0xa08ce4d0, 0xfa25, 0x44ab, [0xb5, 0x7c, 0xc7, 0xb1, 0xc3, 0x23, 0xe0, 0xb9]);
interface IExplorerCommand : IUnknown
{
    HRESULT GetTitle(IShellItemArray, PWSTR*);
    HRESULT GetIcon(IShellItemArray, PWSTR*);
    HRESULT GetToolTip(IShellItemArray, PWSTR*);
    HRESULT GetCanonicalName(GUID*);
    HRESULT GetState(IShellItemArray, BOOL, uint*);
    HRESULT Invoke(IShellItemArray, IBindCtx);
    HRESULT GetFlags(uint*);
    HRESULT EnumSubCommands(IEnumExplorerCommand*);
}
enum IID_IExplorerCommandState = GUID(0xbddacb60, 0x7657, 0x47ae, [0x84, 0x45, 0xd2, 0x3e, 0x1a, 0xcf, 0x82, 0xae]);
interface IExplorerCommandState : IUnknown
{
    HRESULT GetState(IShellItemArray, BOOL, uint*);
}
enum IID_IInitializeCommand = GUID(0x85075acf, 0x231f, 0x40ea, [0x96, 0x10, 0xd2, 0x6b, 0x7b, 0x58, 0xf6, 0x38]);
interface IInitializeCommand : IUnknown
{
    HRESULT Initialize(const(wchar)*, IPropertyBag);
}
enum IID_IEnumExplorerCommand = GUID(0xa88826f8, 0x186f, 0x4987, [0xaa, 0xde, 0xea, 0xc, 0xef, 0x8f, 0xbf, 0xe8]);
interface IEnumExplorerCommand : IUnknown
{
    HRESULT Next(uint, IExplorerCommand*, uint*);
    HRESULT Skip(uint);
    HRESULT Reset();
    HRESULT Clone(IEnumExplorerCommand*);
}
enum IID_IExplorerCommandProvider = GUID(0x64961751, 0x835, 0x43c0, [0x8f, 0xfe, 0xd5, 0x76, 0x86, 0x53, 0xe, 0x64]);
interface IExplorerCommandProvider : IUnknown
{
    HRESULT GetCommands(IUnknown, const(GUID)*, void**);
    HRESULT GetCommand(const(GUID)*, const(GUID)*, void**);
}
alias CPVIEW = int;
enum : int
{
    CPVIEW_CLASSIC  = 0x00000000,
    CPVIEW_ALLITEMS = 0x00000000,
    CPVIEW_CATEGORY = 0x00000001,
    CPVIEW_HOME     = 0x00000001,
}

enum IID_IOpenControlPanel = GUID(0xd11ad862, 0x66de, 0x4df4, [0xbf, 0x6c, 0x1f, 0x56, 0x21, 0x99, 0x6a, 0xf1]);
interface IOpenControlPanel : IUnknown
{
    HRESULT Open(const(wchar)*, const(wchar)*, IUnknown);
    HRESULT GetPath(const(wchar)*, PWSTR, uint);
    HRESULT GetCurrentView(CPVIEW*);
}
enum IID_IFileSystemBindData = GUID(0x1e18d10, 0x4d8b, 0x11d2, [0x85, 0x5d, 0x0, 0x60, 0x8, 0x5, 0x93, 0x67]);
interface IFileSystemBindData : IUnknown
{
    HRESULT SetFindData(const(WIN32_FIND_DATAW)*);
    HRESULT GetFindData(WIN32_FIND_DATAW*);
}
enum IID_IFileSystemBindData2 = GUID(0x3acf075f, 0x71db, 0x4afa, [0x81, 0xf0, 0x3f, 0xc4, 0xfd, 0xf2, 0xa5, 0xb8]);
interface IFileSystemBindData2 : IFileSystemBindData
{
    HRESULT SetFileID(LARGE_INTEGER);
    HRESULT GetFileID(LARGE_INTEGER*);
    HRESULT SetJunctionCLSID(const(GUID)*);
    HRESULT GetJunctionCLSID(GUID*);
}
alias KNOWNDESTCATEGORY = int;
enum : int
{
    KDC_FREQUENT = 0x00000001,
    KDC_RECENT   = 0x00000002,
}

enum IID_ICustomDestinationList = GUID(0x6332debf, 0x87b5, 0x4670, [0x90, 0xc0, 0x5e, 0x57, 0xb4, 0x8, 0xa4, 0x9e]);
interface ICustomDestinationList : IUnknown
{
    HRESULT SetAppID(const(wchar)*);
    HRESULT BeginList(uint*, const(GUID)*, void**);
    HRESULT AppendCategory(const(wchar)*, IObjectArray);
    HRESULT AppendKnownCategory(KNOWNDESTCATEGORY);
    HRESULT AddUserTasks(IObjectArray);
    HRESULT CommitList();
    HRESULT GetRemovedDestinations(const(GUID)*, void**);
    HRESULT DeleteList(const(wchar)*);
    HRESULT AbortList();
}
enum IID_IApplicationDestinations = GUID(0x12337d35, 0x94c6, 0x48a0, [0xbc, 0xe7, 0x6a, 0x9c, 0x69, 0xd4, 0xd6, 0x0]);
interface IApplicationDestinations : IUnknown
{
    HRESULT SetAppID(const(wchar)*);
    HRESULT RemoveDestination(IUnknown);
    HRESULT RemoveAllDestinations();
}
alias APPDOCLISTTYPE = int;
enum : int
{
    ADLT_RECENT   = 0x00000000,
    ADLT_FREQUENT = 0x00000001,
}

enum IID_IApplicationDocumentLists = GUID(0x3c594f9f, 0x9f30, 0x47a1, [0x97, 0x9a, 0xc9, 0xe8, 0x3d, 0x3d, 0xa, 0x6]);
interface IApplicationDocumentLists : IUnknown
{
    HRESULT SetAppID(const(wchar)*);
    HRESULT GetList(APPDOCLISTTYPE, uint, const(GUID)*, void**);
}
enum IID_IObjectWithAppUserModelID = GUID(0x36db0196, 0x9665, 0x46d1, [0x9b, 0xa7, 0xd3, 0x70, 0x9e, 0xec, 0xf9, 0xed]);
interface IObjectWithAppUserModelID : IUnknown
{
    HRESULT SetAppID(const(wchar)*);
    HRESULT GetAppID(PWSTR*);
}
enum IID_IObjectWithProgID = GUID(0x71e806fb, 0x8dee, 0x46fc, [0xbf, 0x8c, 0x77, 0x48, 0xa8, 0xa1, 0xae, 0x13]);
interface IObjectWithProgID : IUnknown
{
    HRESULT SetProgID(const(wchar)*);
    HRESULT GetProgID(PWSTR*);
}
enum IID_IUpdateIDList = GUID(0x6589b6d2, 0x5f8d, 0x4b9e, [0xb7, 0xe0, 0x23, 0xcd, 0xd9, 0x71, 0x7d, 0x8c]);
interface IUpdateIDList : IUnknown
{
    HRESULT Update(IBindCtx, ITEMIDLIST*, ITEMIDLIST**);
}
alias DESKTOP_SLIDESHOW_OPTIONS = int;
enum : int
{
    DSO_SHUFFLEIMAGES = 0x00000001,
}

alias DESKTOP_SLIDESHOW_STATE = int;
enum : int
{
    DSS_ENABLED                    = 0x00000001,
    DSS_SLIDESHOW                  = 0x00000002,
    DSS_DISABLED_BY_REMOTE_SESSION = 0x00000004,
}

alias DESKTOP_SLIDESHOW_DIRECTION = int;
enum : int
{
    DSD_FORWARD  = 0x00000000,
    DSD_BACKWARD = 0x00000001,
}

alias DESKTOP_WALLPAPER_POSITION = int;
enum : int
{
    DWPOS_CENTER  = 0x00000000,
    DWPOS_TILE    = 0x00000001,
    DWPOS_STRETCH = 0x00000002,
    DWPOS_FIT     = 0x00000003,
    DWPOS_FILL    = 0x00000004,
    DWPOS_SPAN    = 0x00000005,
}

enum IID_IDesktopWallpaper = GUID(0xb92b56a9, 0x8b55, 0x4e14, [0x9a, 0x89, 0x1, 0x99, 0xbb, 0xb6, 0xf9, 0x3b]);
interface IDesktopWallpaper : IUnknown
{
    HRESULT SetWallpaper(const(wchar)*, const(wchar)*);
    HRESULT GetWallpaper(const(wchar)*, PWSTR*);
    HRESULT GetMonitorDevicePathAt(uint, PWSTR*);
    HRESULT GetMonitorDevicePathCount(uint*);
    HRESULT GetMonitorRECT(const(wchar)*, RECT*);
    HRESULT SetBackgroundColor(COLORREF);
    HRESULT GetBackgroundColor(COLORREF*);
    HRESULT SetPosition(DESKTOP_WALLPAPER_POSITION);
    HRESULT GetPosition(DESKTOP_WALLPAPER_POSITION*);
    HRESULT SetSlideshow(IShellItemArray);
    HRESULT GetSlideshow(IShellItemArray*);
    HRESULT SetSlideshowOptions(DESKTOP_SLIDESHOW_OPTIONS, uint);
    HRESULT GetSlideshowOptions(DESKTOP_SLIDESHOW_OPTIONS*, uint*);
    HRESULT AdvanceSlideshow(const(wchar)*, DESKTOP_SLIDESHOW_DIRECTION);
    HRESULT GetStatus(DESKTOP_SLIDESHOW_STATE*);
    HRESULT Enable(BOOL);
}
alias HOMEGROUPSHARINGCHOICES = int;
enum : int
{
    HGSC_NONE             = 0x00000000,
    HGSC_MUSICLIBRARY     = 0x00000001,
    HGSC_PICTURESLIBRARY  = 0x00000002,
    HGSC_VIDEOSLIBRARY    = 0x00000004,
    HGSC_DOCUMENTSLIBRARY = 0x00000008,
    HGSC_PRINTERS         = 0x00000010,
}

enum IID_IHomeGroup = GUID(0x7a3bd1d9, 0x35a9, 0x4fb3, [0xa4, 0x67, 0xf4, 0x8c, 0xac, 0x35, 0xe2, 0xd0]);
interface IHomeGroup : IUnknown
{
    HRESULT IsMember(BOOL*);
    HRESULT ShowSharingWizard(HWND, HOMEGROUPSHARINGCHOICES*);
}
enum IID_IInitializeWithPropertyStore = GUID(0xc3e12eb5, 0x7d8d, 0x44f8, [0xb6, 0xdd, 0xe, 0x77, 0xb3, 0x4d, 0x6d, 0xe4]);
interface IInitializeWithPropertyStore : IUnknown
{
    HRESULT Initialize(IPropertyStore);
}
enum IID_IOpenSearchSource = GUID(0xf0ee7333, 0xe6fc, 0x479b, [0x9f, 0x25, 0xa8, 0x60, 0xc2, 0x34, 0xa3, 0x8e]);
interface IOpenSearchSource : IUnknown
{
    HRESULT GetResults(HWND, const(wchar)*, uint, uint, const(GUID)*, void**);
}
alias LIBRARYFOLDERFILTER = int;
enum : int
{
    LFF_FORCEFILESYSTEM = 0x00000001,
    LFF_STORAGEITEMS    = 0x00000002,
    LFF_ALLITEMS        = 0x00000003,
}

alias LIBRARYOPTIONFLAGS = int;
enum : int
{
    LOF_DEFAULT         = 0x00000000,
    LOF_PINNEDTONAVPANE = 0x00000001,
    LOF_MASK_ALL        = 0x00000001,
}

alias DEFAULTSAVEFOLDERTYPE = int;
enum : int
{
    DSFT_DETECT  = 0x00000001,
    DSFT_PRIVATE = 0x00000002,
    DSFT_PUBLIC  = 0x00000003,
}

alias LIBRARYSAVEFLAGS = int;
enum : int
{
    LSF_FAILIFTHERE      = 0x00000000,
    LSF_OVERRIDEEXISTING = 0x00000001,
    LSF_MAKEUNIQUENAME   = 0x00000002,
}

enum IID_IShellLibrary = GUID(0x11a66efa, 0x382e, 0x451a, [0x92, 0x34, 0x1e, 0xe, 0x12, 0xef, 0x30, 0x85]);
interface IShellLibrary : IUnknown
{
    HRESULT LoadLibraryFromItem(IShellItem, uint);
    HRESULT LoadLibraryFromKnownFolder(const(GUID)*, uint);
    HRESULT AddFolder(IShellItem);
    HRESULT RemoveFolder(IShellItem);
    HRESULT GetFolders(LIBRARYFOLDERFILTER, const(GUID)*, void**);
    HRESULT ResolveFolder(IShellItem, uint, const(GUID)*, void**);
    HRESULT GetDefaultSaveFolder(DEFAULTSAVEFOLDERTYPE, const(GUID)*, void**);
    HRESULT SetDefaultSaveFolder(DEFAULTSAVEFOLDERTYPE, IShellItem);
    HRESULT GetOptions(LIBRARYOPTIONFLAGS*);
    HRESULT SetOptions(LIBRARYOPTIONFLAGS, LIBRARYOPTIONFLAGS);
    HRESULT GetFolderType(GUID*);
    HRESULT SetFolderType(const(GUID)*);
    HRESULT GetIcon(PWSTR*);
    HRESULT SetIcon(const(wchar)*);
    HRESULT Commit();
    HRESULT Save(IShellItem, const(wchar)*, LIBRARYSAVEFLAGS, IShellItem*);
    HRESULT SaveInKnownFolder(const(GUID)*, const(wchar)*, LIBRARYSAVEFLAGS, IShellItem*);
}
alias DEFAULT_FOLDER_MENU_RESTRICTIONS = int;
enum : int
{
    DFMR_DEFAULT                        = 0x00000000,
    DFMR_NO_STATIC_VERBS                = 0x00000008,
    DFMR_STATIC_VERBS_ONLY              = 0x00000010,
    DFMR_NO_RESOURCE_VERBS              = 0x00000020,
    DFMR_OPTIN_HANDLERS_ONLY            = 0x00000040,
    DFMR_RESOURCE_AND_FOLDER_VERBS_ONLY = 0x00000080,
    DFMR_USE_SPECIFIED_HANDLERS         = 0x00000100,
    DFMR_USE_SPECIFIED_VERBS            = 0x00000200,
    DFMR_NO_ASYNC_VERBS                 = 0x00000400,
    DFMR_NO_NATIVECPU_VERBS             = 0x00000800,
    DFMR_NO_NONWOW_VERBS                = 0x00001000,
}

enum IID_IDefaultFolderMenuInitialize = GUID(0x7690aa79, 0xf8fc, 0x4615, [0xa3, 0x27, 0x36, 0xf7, 0xd1, 0x8f, 0x5d, 0x91]);
interface IDefaultFolderMenuInitialize : IUnknown
{
    HRESULT Initialize(HWND, IContextMenuCB, ITEMIDLIST*, IShellFolder, uint, ITEMIDLIST**, IUnknown, uint, const(HKEY)*);
    HRESULT SetMenuRestrictions(DEFAULT_FOLDER_MENU_RESTRICTIONS);
    HRESULT GetMenuRestrictions(DEFAULT_FOLDER_MENU_RESTRICTIONS, DEFAULT_FOLDER_MENU_RESTRICTIONS*);
    HRESULT SetHandlerClsid(const(GUID)*);
}
alias ACTIVATEOPTIONS = int;
enum : int
{
    AO_NONE           = 0x00000000,
    AO_DESIGNMODE     = 0x00000001,
    AO_NOERRORUI      = 0x00000002,
    AO_NOSPLASHSCREEN = 0x00000004,
    AO_PRELAUNCH      = 0x02000000,
}

enum IID_IApplicationActivationManager = GUID(0x2e941141, 0x7f97, 0x4756, [0xba, 0x1d, 0x9d, 0xec, 0xde, 0x89, 0x4a, 0x3d]);
interface IApplicationActivationManager : IUnknown
{
    HRESULT ActivateApplication(const(wchar)*, const(wchar)*, ACTIVATEOPTIONS, uint*);
    HRESULT ActivateForFile(const(wchar)*, IShellItemArray, const(wchar)*, uint*);
    HRESULT ActivateForProtocol(const(wchar)*, IShellItemArray, uint*);
}
enum IID_IVirtualDesktopManager = GUID(0xa5cd92ff, 0x29be, 0x454c, [0x8d, 0x4, 0xd8, 0x28, 0x79, 0xfb, 0x3f, 0x1b]);
interface IVirtualDesktopManager : IUnknown
{
    HRESULT IsWindowOnCurrentVirtualDesktop(HWND, BOOL*);
    HRESULT GetWindowDesktopId(HWND, GUID*);
    HRESULT MoveWindowToDesktop(HWND, const(GUID)*);
}
alias LIBRARYMANAGEDIALOGOPTIONS = int;
enum : int
{
    LMD_DEFAULT                          = 0x00000000,
    LMD_ALLOWUNINDEXABLENETWORKLOCATIONS = 0x00000001,
}

enum IID_IAssocHandlerInvoker = GUID(0x92218cab, 0xecaa, 0x4335, [0x81, 0x33, 0x80, 0x7f, 0xd2, 0x34, 0xc2, 0xee]);
interface IAssocHandlerInvoker : IUnknown
{
    HRESULT SupportsSelection();
    HRESULT Invoke();
}
alias AHTYPE = int;
enum : int
{
    AHTYPE_UNDEFINED         = 0x00000000,
    AHTYPE_USER_APPLICATION  = 0x00000008,
    AHTYPE_ANY_APPLICATION   = 0x00000010,
    AHTYPE_MACHINEDEFAULT    = 0x00000020,
    AHTYPE_PROGID            = 0x00000040,
    AHTYPE_APPLICATION       = 0x00000080,
    AHTYPE_CLASS_APPLICATION = 0x00000100,
    AHTYPE_ANY_PROGID        = 0x00000200,
}

enum IID_IAssocHandler = GUID(0xf04061ac, 0x1659, 0x4a3f, [0xa9, 0x54, 0x77, 0x5a, 0xa5, 0x7f, 0xc0, 0x83]);
interface IAssocHandler : IUnknown
{
    HRESULT GetName(PWSTR*);
    HRESULT GetUIName(PWSTR*);
    HRESULT GetIconLocation(PWSTR*, int*);
    HRESULT IsRecommended();
    HRESULT MakeDefault(const(wchar)*);
    HRESULT Invoke(IDataObject);
    HRESULT CreateInvoker(IDataObject, IAssocHandlerInvoker*);
}
enum IID_IEnumAssocHandlers = GUID(0x973810ae, 0x9599, 0x4b88, [0x9e, 0x4d, 0x6e, 0xe9, 0x8c, 0x95, 0x52, 0xda]);
interface IEnumAssocHandlers : IUnknown
{
    HRESULT Next(uint, IAssocHandler*, uint*);
}
alias ASSOC_FILTER = int;
enum : int
{
    ASSOC_FILTER_NONE        = 0x00000000,
    ASSOC_FILTER_RECOMMENDED = 0x00000001,
}

enum IID_IDataObjectProvider = GUID(0x3d25f6d6, 0x4b2a, 0x433c, [0x91, 0x84, 0x7c, 0x33, 0xad, 0x35, 0xd0, 0x1]);
interface IDataObjectProvider : IUnknown
{
    HRESULT GetDataObject(IDataObject*);
    HRESULT SetDataObject(IDataObject);
}
enum IID_IDataTransferManagerInterop = GUID(0x3a3dcd6c, 0x3eab, 0x43dc, [0xbc, 0xde, 0x45, 0x67, 0x1c, 0xe8, 0x0, 0xc8]);
interface IDataTransferManagerInterop : IUnknown
{
    HRESULT GetForWindow(HWND, const(GUID)*, void**);
    HRESULT ShowShareUIForWindow(HWND);
}
enum IID_IFrameworkInputPaneHandler = GUID(0x226c537b, 0x1e76, 0x4d9e, [0xa7, 0x60, 0x33, 0xdb, 0x29, 0x92, 0x2f, 0x18]);
interface IFrameworkInputPaneHandler : IUnknown
{
    HRESULT Showing(RECT*, BOOL);
    HRESULT Hiding(BOOL);
}
enum IID_IFrameworkInputPane = GUID(0x5752238b, 0x24f0, 0x495a, [0x82, 0xf1, 0x2f, 0xd5, 0x93, 0x5, 0x67, 0x96]);
interface IFrameworkInputPane : IUnknown
{
    HRESULT Advise(IUnknown, IFrameworkInputPaneHandler, uint*);
    HRESULT AdviseWithHWND(HWND, IFrameworkInputPaneHandler, uint*);
    HRESULT Unadvise(uint);
    HRESULT Location(RECT*);
}
alias MONITOR_APP_VISIBILITY = int;
enum : int
{
    MAV_UNKNOWN        = 0x00000000,
    MAV_NO_APP_VISIBLE = 0x00000001,
    MAV_APP_VISIBLE    = 0x00000002,
}

enum IID_IAppVisibilityEvents = GUID(0x6584ce6b, 0x7d82, 0x49c2, [0x89, 0xc9, 0xc6, 0xbc, 0x2, 0xba, 0x8c, 0x38]);
interface IAppVisibilityEvents : IUnknown
{
    HRESULT AppVisibilityOnMonitorChanged(HMONITOR, MONITOR_APP_VISIBILITY, MONITOR_APP_VISIBILITY);
    HRESULT LauncherVisibilityChange(BOOL);
}
enum IID_IAppVisibility = GUID(0x2246ea2d, 0xcaea, 0x4444, [0xa3, 0xc4, 0x6d, 0xe8, 0x27, 0xe4, 0x43, 0x13]);
interface IAppVisibility : IUnknown
{
    HRESULT GetAppVisibilityOnMonitor(HMONITOR, MONITOR_APP_VISIBILITY*);
    HRESULT IsLauncherVisible(BOOL*);
    HRESULT Advise(IAppVisibilityEvents, uint*);
    HRESULT Unadvise(uint);
}
alias PACKAGE_EXECUTION_STATE = int;
enum : int
{
    PES_UNKNOWN    = 0x00000000,
    PES_RUNNING    = 0x00000001,
    PES_SUSPENDING = 0x00000002,
    PES_SUSPENDED  = 0x00000003,
    PES_TERMINATED = 0x00000004,
}

enum IID_IPackageExecutionStateChangeNotification = GUID(0x1bb12a62, 0x2ad8, 0x432b, [0x8c, 0xcf, 0xc, 0x2c, 0x52, 0xaf, 0xcd, 0x5b]);
interface IPackageExecutionStateChangeNotification : IUnknown
{
    HRESULT OnStateChanged(const(wchar)*, PACKAGE_EXECUTION_STATE);
}
enum IID_IPackageDebugSettings = GUID(0xf27c3930, 0x8029, 0x4ad1, [0x94, 0xe3, 0x3d, 0xba, 0x41, 0x78, 0x10, 0xc1]);
interface IPackageDebugSettings : IUnknown
{
    HRESULT EnableDebugging(const(wchar)*, const(wchar)*, PWSTR);
    HRESULT DisableDebugging(const(wchar)*);
    HRESULT Suspend(const(wchar)*);
    HRESULT Resume(const(wchar)*);
    HRESULT TerminateAllProcesses(const(wchar)*);
    HRESULT SetTargetSessionId(uint);
    HRESULT EnumerateBackgroundTasks(const(wchar)*, uint*, GUID**, PWSTR**);
    HRESULT ActivateBackgroundTask(const(GUID)*);
    HRESULT StartServicing(const(wchar)*);
    HRESULT StopServicing(const(wchar)*);
    HRESULT StartSessionRedirection(const(wchar)*, uint);
    HRESULT StopSessionRedirection(const(wchar)*);
    HRESULT GetPackageExecutionState(const(wchar)*, PACKAGE_EXECUTION_STATE*);
    HRESULT RegisterForPackageStateChanges(const(wchar)*, IPackageExecutionStateChangeNotification, uint*);
    HRESULT UnregisterForPackageStateChanges(uint);
}
enum IID_IPackageDebugSettings2 = GUID(0x6e3194bb, 0xab82, 0x4d22, [0x93, 0xf5, 0xfa, 0xbd, 0xa4, 0xe, 0x7b, 0x16]);
interface IPackageDebugSettings2 : IPackageDebugSettings
{
    HRESULT EnumerateApps(const(wchar)*, uint*, PWSTR**, PWSTR**);
}
enum IID_ISuspensionDependencyManager = GUID(0x52b83a42, 0x2543, 0x416a, [0x81, 0xd9, 0xc0, 0xde, 0x79, 0x69, 0xc8, 0xb3]);
interface ISuspensionDependencyManager : IUnknown
{
    HRESULT RegisterAsChild(HANDLE);
    HRESULT GroupChildWithParent(HANDLE);
    HRESULT UngroupChildFromParent(HANDLE);
}
alias AHE_TYPE = int;
enum : int
{
    AHE_DESKTOP   = 0x00000000,
    AHE_IMMERSIVE = 0x00000001,
}

enum IID_IExecuteCommandApplicationHostEnvironment = GUID(0x18b21aa9, 0xe184, 0x4ff0, [0x9f, 0x5e, 0xf8, 0x82, 0xd0, 0x37, 0x71, 0xb3]);
interface IExecuteCommandApplicationHostEnvironment : IUnknown
{
    HRESULT GetValue(AHE_TYPE*);
}
alias EC_HOST_UI_MODE = int;
enum : int
{
    ECHUIM_DESKTOP         = 0x00000000,
    ECHUIM_IMMERSIVE       = 0x00000001,
    ECHUIM_SYSTEM_LAUNCHER = 0x00000002,
}

enum IID_IExecuteCommandHost = GUID(0x4b6832a2, 0x5f04, 0x4c9d, [0xb8, 0x9d, 0x72, 0x7a, 0x15, 0xd1, 0x3, 0xe7]);
interface IExecuteCommandHost : IUnknown
{
    HRESULT GetUIMode(EC_HOST_UI_MODE*);
}
alias APPLICATION_VIEW_STATE = int;
enum : int
{
    AVS_FULLSCREEN_LANDSCAPE = 0x00000000,
    AVS_FILLED               = 0x00000001,
    AVS_SNAPPED              = 0x00000002,
    AVS_FULLSCREEN_PORTRAIT  = 0x00000003,
}

alias EDGE_GESTURE_KIND = int;
enum : int
{
    EGK_TOUCH    = 0x00000000,
    EGK_KEYBOARD = 0x00000001,
    EGK_MOUSE    = 0x00000002,
}

enum IID_IApplicationDesignModeSettings = GUID(0x2a3dee9a, 0xe31d, 0x46d6, [0x85, 0x8, 0xbc, 0xc5, 0x97, 0xdb, 0x35, 0x57]);
interface IApplicationDesignModeSettings : IUnknown
{
    HRESULT SetNativeDisplaySize(SIZE);
    HRESULT SetScaleFactor(DEVICE_SCALE_FACTOR);
    HRESULT SetApplicationViewState(APPLICATION_VIEW_STATE);
    HRESULT ComputeApplicationSize(SIZE*);
    HRESULT IsApplicationViewStateSupported(APPLICATION_VIEW_STATE, SIZE, DEVICE_SCALE_FACTOR, BOOL*);
    HRESULT TriggerEdgeGesture(EDGE_GESTURE_KIND);
}
alias NATIVE_DISPLAY_ORIENTATION = int;
enum : int
{
    NDO_LANDSCAPE = 0x00000000,
    NDO_PORTRAIT  = 0x00000001,
}

alias APPLICATION_VIEW_ORIENTATION = int;
enum : int
{
    AVO_LANDSCAPE = 0x00000000,
    AVO_PORTRAIT  = 0x00000001,
}

alias ADJACENT_DISPLAY_EDGES = int;
enum : int
{
    ADE_NONE  = 0x00000000,
    ADE_LEFT  = 0x00000001,
    ADE_RIGHT = 0x00000002,
}

alias APPLICATION_VIEW_MIN_WIDTH = int;
enum : int
{
    AVMW_DEFAULT = 0x00000000,
    AVMW_320     = 0x00000001,
    AVMW_500     = 0x00000002,
}

enum IID_IApplicationDesignModeSettings2 = GUID(0x490514e1, 0x675a, 0x4d6e, [0xa5, 0x8d, 0xe5, 0x49, 0x1, 0xb4, 0xca, 0x2f]);
interface IApplicationDesignModeSettings2 : IApplicationDesignModeSettings
{
    HRESULT SetNativeDisplayOrientation(NATIVE_DISPLAY_ORIENTATION);
    HRESULT SetApplicationViewOrientation(APPLICATION_VIEW_ORIENTATION);
    HRESULT SetAdjacentDisplayEdges(ADJACENT_DISPLAY_EDGES);
    HRESULT SetIsOnLockScreen(BOOL);
    HRESULT SetApplicationViewMinWidth(APPLICATION_VIEW_MIN_WIDTH);
    HRESULT GetApplicationSizeBounds(SIZE*, SIZE*);
    HRESULT GetApplicationViewOrientation(SIZE, APPLICATION_VIEW_ORIENTATION*);
}
enum IID_ILaunchTargetMonitor = GUID(0x266fbc7e, 0x490d, 0x46ed, [0xa9, 0x6b, 0x22, 0x74, 0xdb, 0x25, 0x20, 0x3]);
interface ILaunchTargetMonitor : IUnknown
{
    HRESULT GetMonitor(HMONITOR*);
}
alias APPLICATION_VIEW_SIZE_PREFERENCE = int;
enum : int
{
    AVSP_DEFAULT     = 0x00000000,
    AVSP_USE_LESS    = 0x00000001,
    AVSP_USE_HALF    = 0x00000002,
    AVSP_USE_MORE    = 0x00000003,
    AVSP_USE_MINIMUM = 0x00000004,
    AVSP_USE_NONE    = 0x00000005,
    AVSP_CUSTOM      = 0x00000006,
}

enum IID_ILaunchSourceViewSizePreference = GUID(0xe5aa01f7, 0x1fb8, 0x4830, [0x87, 0x20, 0x4e, 0x67, 0x34, 0xcb, 0xd5, 0xf3]);
interface ILaunchSourceViewSizePreference : IUnknown
{
    HRESULT GetSourceViewToPosition(HWND*);
    HRESULT GetSourceViewSizePreference(APPLICATION_VIEW_SIZE_PREFERENCE*);
}
enum IID_ILaunchTargetViewSizePreference = GUID(0x2f0666c6, 0x12f7, 0x4360, [0xb5, 0x11, 0xa3, 0x94, 0xa0, 0x55, 0x37, 0x25]);
interface ILaunchTargetViewSizePreference : IUnknown
{
    HRESULT GetTargetViewSizePreference(APPLICATION_VIEW_SIZE_PREFERENCE*);
}
enum IID_ILaunchSourceAppUserModelId = GUID(0x989191ac, 0x28ff, 0x4cf0, [0x95, 0x84, 0xe0, 0xd0, 0x78, 0xbc, 0x23, 0x96]);
interface ILaunchSourceAppUserModelId : IUnknown
{
    HRESULT GetAppUserModelId(PWSTR*);
}
enum IID_IInitializeWithWindow = GUID(0x3e68d4bd, 0x7135, 0x4d10, [0x80, 0x18, 0x9f, 0xb6, 0xd9, 0xf3, 0x3f, 0xa1]);
interface IInitializeWithWindow : IUnknown
{
    HRESULT Initialize(HWND);
}
enum IID_IHandlerInfo = GUID(0x997706ef, 0xf880, 0x453b, [0x81, 0x18, 0x39, 0xe1, 0xa2, 0xd2, 0x65, 0x5a]);
interface IHandlerInfo : IUnknown
{
    HRESULT GetApplicationDisplayName(PWSTR*);
    HRESULT GetApplicationPublisher(PWSTR*);
    HRESULT GetApplicationIconReference(PWSTR*);
}
enum IID_IHandlerInfo2 = GUID(0x31cca04c, 0x4d3, 0x4ea9, [0x90, 0xde, 0x97, 0xb1, 0x5e, 0x87, 0xa5, 0x32]);
interface IHandlerInfo2 : IHandlerInfo
{
    HRESULT GetApplicationId(PWSTR*);
}
enum IID_IHandlerActivationHost = GUID(0x35094a87, 0x8bb1, 0x4237, [0x96, 0xc6, 0xc4, 0x17, 0xee, 0xbd, 0xb0, 0x78]);
interface IHandlerActivationHost : IUnknown
{
    HRESULT BeforeCoCreateInstance(const(GUID)*, IShellItemArray, IHandlerInfo);
    HRESULT BeforeCreateProcess(const(wchar)*, const(wchar)*, IHandlerInfo);
}
enum IID_IAppActivationUIInfo = GUID(0xabad189d, 0x9fa3, 0x4278, [0xb3, 0xca, 0x8c, 0xa4, 0x48, 0xa8, 0x8d, 0xcb]);
interface IAppActivationUIInfo : IUnknown
{
    HRESULT GetMonitor(HMONITOR*);
    HRESULT GetInvokePoint(POINT*);
    HRESULT GetShowCommand(int*);
    HRESULT GetShowUI(BOOL*);
    HRESULT GetKeyState(uint*);
}
alias FLYOUT_PLACEMENT = int;
enum : int
{
    FP_DEFAULT = 0x00000000,
    FP_ABOVE   = 0x00000001,
    FP_BELOW   = 0x00000002,
    FP_LEFT    = 0x00000003,
    FP_RIGHT   = 0x00000004,
}

enum IID_IContactManagerInterop = GUID(0x99eacba7, 0xe073, 0x43b6, [0xa8, 0x96, 0x55, 0xaf, 0xe4, 0x8a, 0x8, 0x33]);
interface IContactManagerInterop : IUnknown
{
    HRESULT ShowContactCardForWindow(HWND, IUnknown, const(RECT)*, FLYOUT_PLACEMENT);
}
enum IID_IShellIconOverlayIdentifier = GUID(0xc6c4200, 0xc589, 0x11d0, [0x99, 0x9a, 0x0, 0xc0, 0x4f, 0xd6, 0x55, 0xe1]);
interface IShellIconOverlayIdentifier : IUnknown
{
    HRESULT IsMemberOf(const(wchar)*, uint);
    HRESULT GetOverlayInfo(PWSTR, int, int*, uint*);
    HRESULT GetPriority(int*);
}
alias BANNER_NOTIFICATION_EVENT = int;
enum : int
{
    BNE_Rendered       = 0x00000000,
    BNE_Hovered        = 0x00000001,
    BNE_Closed         = 0x00000002,
    BNE_Dismissed      = 0x00000003,
    BNE_Button1Clicked = 0x00000004,
    BNE_Button2Clicked = 0x00000005,
}

struct BANNER_NOTIFICATION
{
    BANNER_NOTIFICATION_EVENT event;
    const(wchar)* providerIdentity;
    const(wchar)* contentId;
}
enum IID_IBannerNotificationHandler = GUID(0x8d7b2ba7, 0xdb05, 0x46a8, [0x82, 0x3c, 0xd2, 0xb6, 0xde, 0x8, 0xee, 0x91]);
interface IBannerNotificationHandler : IUnknown
{
    HRESULT OnBannerEvent(const(BANNER_NOTIFICATION)*);
}
alias SORT_ORDER_TYPE = int;
enum : int
{
    SOT_DEFAULT           = 0x00000000,
    SOT_IGNORE_FOLDERNESS = 0x00000001,
}

enum IID_ISortColumnArray = GUID(0x6dfc60fb, 0xf2e9, 0x459b, [0xbe, 0xb5, 0x28, 0x8f, 0x1a, 0x7c, 0x7d, 0x54]);
interface ISortColumnArray : IUnknown
{
    HRESULT GetCount(uint*);
    HRESULT GetAt(uint, SORTCOLUMN*);
    HRESULT GetSortType(SORT_ORDER_TYPE*);
}
enum IID_IPropertyKeyStore = GUID(0x75bd59aa, 0xf23b, 0x4963, [0xab, 0xa4, 0xb, 0x35, 0x57, 0x52, 0xa9, 0x1b]);
interface IPropertyKeyStore : IUnknown
{
    HRESULT GetKeyCount(int*);
    HRESULT GetKeyAt(int, PROPERTYKEY*);
    HRESULT AppendKey(const(PROPERTYKEY)*);
    HRESULT DeleteKey(int);
    HRESULT IsKeyInStore(const(PROPERTYKEY)*);
    HRESULT RemoveKey(const(PROPERTYKEY)*);
}
enum IID_IQueryCodePage = GUID(0xc7b236ce, 0xee80, 0x11d0, [0x98, 0x5f, 0x0, 0x60, 0x8, 0x5, 0x93, 0x82]);
interface IQueryCodePage : IUnknown
{
    HRESULT GetCodePage(uint*);
    HRESULT SetCodePage(uint);
}
alias FOLDERVIEWOPTIONS = int;
enum : int
{
    FVO_DEFAULT           = 0x00000000,
    FVO_VISTALAYOUT       = 0x00000001,
    FVO_CUSTOMPOSITION    = 0x00000002,
    FVO_CUSTOMORDERING    = 0x00000004,
    FVO_SUPPORTHYPERLINKS = 0x00000008,
    FVO_NOANIMATIONS      = 0x00000010,
    FVO_NOSCROLLTIPS      = 0x00000020,
}

enum IID_IFolderViewOptions = GUID(0x3cc974d2, 0xb302, 0x4d36, [0xad, 0x3e, 0x6, 0xd9, 0x3f, 0x69, 0x5d, 0x3f]);
interface IFolderViewOptions : IUnknown
{
    HRESULT SetFolderViewOptions(FOLDERVIEWOPTIONS, FOLDERVIEWOPTIONS);
    HRESULT GetFolderViewOptions(FOLDERVIEWOPTIONS*);
}
alias _SV3CVW3_FLAGS = int;
enum : int
{
    SV3CVW3_DEFAULT          = 0x00000000,
    SV3CVW3_NONINTERACTIVE   = 0x00000001,
    SV3CVW3_FORCEVIEWMODE    = 0x00000002,
    SV3CVW3_FORCEFOLDERFLAGS = 0x00000004,
}

enum IID_IShellView3 = GUID(0xec39fa88, 0xf8af, 0x41c5, [0x84, 0x21, 0x38, 0xbe, 0xd2, 0x8f, 0x46, 0x73]);
interface IShellView3 : IShellView2
{
    HRESULT CreateViewWindow3(IShellBrowser, IShellView, uint, FOLDERFLAGS, FOLDERFLAGS, FOLDERVIEWMODE, const(GUID)*, const(RECT)*, HWND*);
}
enum IID_ISearchBoxInfo = GUID(0x6af6e03f, 0xd664, 0x4ef4, [0x96, 0x26, 0xf7, 0xe0, 0xed, 0x36, 0x75, 0x5e]);
interface ISearchBoxInfo : IUnknown
{
    HRESULT GetCondition(const(GUID)*, void**);
    HRESULT GetText(PWSTR*);
}
alias VPWATERMARKFLAGS = int;
enum : int
{
    VPWF_DEFAULT    = 0x00000000,
    VPWF_ALPHABLEND = 0x00000001,
}

alias VPCOLORFLAGS = int;
enum : int
{
    VPCF_TEXT           = 0x00000001,
    VPCF_BACKGROUND     = 0x00000002,
    VPCF_SORTCOLUMN     = 0x00000003,
    VPCF_SUBTEXT        = 0x00000004,
    VPCF_TEXTBACKGROUND = 0x00000005,
}

enum IID_IVisualProperties = GUID(0xe693cf68, 0xd967, 0x4112, [0x87, 0x63, 0x99, 0x17, 0x2a, 0xee, 0x5e, 0x5a]);
interface IVisualProperties : IUnknown
{
    HRESULT SetWatermark(HBITMAP, VPWATERMARKFLAGS);
    HRESULT SetColor(VPCOLORFLAGS, COLORREF);
    HRESULT GetColor(VPCOLORFLAGS, COLORREF*);
    HRESULT SetItemHeight(int);
    HRESULT GetItemHeight(int*);
    HRESULT SetFont(const(LOGFONTW)*, BOOL);
    HRESULT GetFont(LOGFONTW*);
    HRESULT SetTheme(const(wchar)*, const(wchar)*);
}
enum IID_ICommDlgBrowser3 = GUID(0xc8ad25a1, 0x3294, 0x41ee, [0x81, 0x65, 0x71, 0x17, 0x4b, 0xd0, 0x1c, 0x57]);
interface ICommDlgBrowser3 : ICommDlgBrowser2
{
    HRESULT OnColumnClicked(IShellView, int);
    HRESULT GetCurrentFilter(PWSTR, int);
    HRESULT OnPreViewCreated(IShellView);
}
enum IID_IUserAccountChangeCallback = GUID(0xa561e69a, 0xb4b8, 0x4113, [0x91, 0xa5, 0x64, 0xc6, 0xbc, 0xca, 0x34, 0x30]);
interface IUserAccountChangeCallback : IUnknown
{
    HRESULT OnPictureChange(const(wchar)*);
}
enum IID_IStreamAsync = GUID(0xfe0b6665, 0xe0ca, 0x49b9, [0xa1, 0x78, 0x2b, 0x5c, 0xb4, 0x8d, 0x92, 0xa5]);
interface IStreamAsync : IStream
{
    HRESULT ReadAsync(void*, uint, uint*, OVERLAPPED*);
    HRESULT WriteAsync(const(void)*, uint, uint*, OVERLAPPED*);
    HRESULT OverlappedResult(OVERLAPPED*, uint*, BOOL);
    HRESULT CancelIo();
}
enum IID_IStreamUnbufferedInfo = GUID(0x8a68fdda, 0x1fdc, 0x4c20, [0x8c, 0xeb, 0x41, 0x66, 0x43, 0xb5, 0xa6, 0x25]);
interface IStreamUnbufferedInfo : IUnknown
{
    HRESULT GetSectorSize(uint*);
}
alias DSH_FLAGS = int;
enum : int
{
    DSH_ALLOWDROPDESCRIPTIONTEXT = 0x00000001,
}

enum IID_IDragSourceHelper2 = GUID(0x83e07d0d, 0xc5f, 0x4163, [0xbf, 0x1a, 0x60, 0xb2, 0x74, 0x5, 0x1e, 0x40]);
interface IDragSourceHelper2 : IDragSourceHelper
{
    HRESULT SetFlags(uint);
}
enum IID_IHWEventHandler = GUID(0xc1fb73d0, 0xec3a, 0x4ba2, [0xb5, 0x12, 0x8c, 0xdb, 0x91, 0x87, 0xb6, 0xd1]);
interface IHWEventHandler : IUnknown
{
    HRESULT Initialize(const(wchar)*);
    HRESULT HandleEvent(const(wchar)*, const(wchar)*, const(wchar)*);
    HRESULT HandleEventWithContent(const(wchar)*, const(wchar)*, const(wchar)*, const(wchar)*, IDataObject);
}
enum IID_IHWEventHandler2 = GUID(0xcfcc809f, 0x295d, 0x42e8, [0x9f, 0xfc, 0x42, 0x4b, 0x33, 0xc4, 0x87, 0xe6]);
interface IHWEventHandler2 : IHWEventHandler
{
    HRESULT HandleEventWithHWND(const(wchar)*, const(wchar)*, const(wchar)*, HWND);
}
enum IID_IQueryCancelAutoPlay = GUID(0xddefe873, 0x6997, 0x4e68, [0xbe, 0x26, 0x39, 0xb6, 0x33, 0xad, 0xbe, 0x12]);
interface IQueryCancelAutoPlay : IUnknown
{
    HRESULT AllowAutoPlay(const(wchar)*, uint, const(wchar)*, uint);
}
enum IID_IDynamicHWHandler = GUID(0xdc2601d7, 0x59e, 0x42fc, [0xa0, 0x9d, 0x2a, 0xfd, 0x21, 0xb6, 0xd5, 0xf7]);
interface IDynamicHWHandler : IUnknown
{
    HRESULT GetDynamicInfo(const(wchar)*, uint, PWSTR*);
}
enum IID_IUserNotificationCallback = GUID(0x19108294, 0x441, 0x4aff, [0x80, 0x13, 0xfa, 0xa, 0x73, 0xb, 0xb, 0xea]);
interface IUserNotificationCallback : IUnknown
{
    HRESULT OnBalloonUserClick(POINT*);
    HRESULT OnLeftClick(POINT*);
    HRESULT OnContextMenu(POINT*);
}
enum IID_IUserNotification2 = GUID(0x215913cc, 0x57eb, 0x4fab, [0xab, 0x5a, 0xe5, 0xfa, 0x7b, 0xea, 0x2a, 0x6c]);
interface IUserNotification2 : IUnknown
{
    HRESULT SetBalloonInfo(const(wchar)*, const(wchar)*, uint);
    HRESULT SetBalloonRetry(uint, uint, uint);
    HRESULT SetIconInfo(HICON, const(wchar)*);
    HRESULT Show(IQueryContinue, uint, IUserNotificationCallback);
    HRESULT PlaySound(const(wchar)*);
}
enum IID_IDeskBand2 = GUID(0x79d16de4, 0xabee, 0x4021, [0x8d, 0x9d, 0x91, 0x69, 0xb2, 0x61, 0xd6, 0x57]);
interface IDeskBand2 : IDeskBand
{
    HRESULT CanRenderComposited(BOOL*);
    HRESULT SetCompositionState(BOOL);
    HRESULT GetCompositionState(BOOL*);
}
enum IID_IStartMenuPinnedList = GUID(0x4cd19ada, 0x25a5, 0x4a32, [0xb3, 0xb7, 0x34, 0x7b, 0xee, 0x5b, 0xe3, 0x6b]);
interface IStartMenuPinnedList : IUnknown
{
    HRESULT RemoveFromList(IShellItem);
}
enum IID_ICDBurn = GUID(0x3d73a659, 0xe5d0, 0x4d42, [0xaf, 0xc0, 0x51, 0x21, 0xba, 0x42, 0x5c, 0x8d]);
interface ICDBurn : IUnknown
{
    HRESULT GetRecorderDriveLetter(PWSTR, uint);
    HRESULT Burn(HWND);
    HRESULT HasRecordableDrive(BOOL*);
}
enum IID_IWizardSite = GUID(0x88960f5b, 0x422f, 0x4e7b, [0x80, 0x13, 0x73, 0x41, 0x53, 0x81, 0xc3, 0xc3]);
interface IWizardSite : IUnknown
{
    HRESULT GetPreviousPage(HPROPSHEETPAGE*);
    HRESULT GetNextPage(HPROPSHEETPAGE*);
    HRESULT GetCancelledPage(HPROPSHEETPAGE*);
}
enum IID_IWizardExtension = GUID(0xc02ea696, 0x86cc, 0x491e, [0x9b, 0x23, 0x74, 0x39, 0x4a, 0x4, 0x44, 0xa8]);
interface IWizardExtension : IUnknown
{
    HRESULT AddPages(HPROPSHEETPAGE*, uint, uint*);
    HRESULT GetFirstPage(HPROPSHEETPAGE*);
    HRESULT GetLastPage(HPROPSHEETPAGE*);
}
enum IID_IWebWizardExtension = GUID(0xe6b3f66, 0x98d1, 0x48c0, [0xa2, 0x22, 0xfb, 0xde, 0x74, 0xe2, 0xfb, 0xc5]);
interface IWebWizardExtension : IWizardExtension
{
    HRESULT SetInitialURL(const(wchar)*);
    HRESULT SetErrorURL(const(wchar)*);
}
enum IID_IPublishingWizard = GUID(0xaa9198bb, 0xccec, 0x472d, [0xbe, 0xed, 0x19, 0xa4, 0xf6, 0x73, 0x3f, 0x7a]);
interface IPublishingWizard : IWizardExtension
{
    HRESULT Initialize(IDataObject, uint, const(wchar)*);
    HRESULT GetTransferManifest(HRESULT*, IXMLDOMDocument*);
}
enum IID_IFolderViewHost = GUID(0x1ea58f02, 0xd55a, 0x411d, [0xb0, 0x9e, 0x9e, 0x65, 0xac, 0x21, 0x60, 0x5b]);
interface IFolderViewHost : IUnknown
{
    HRESULT Initialize(HWND, IDataObject, RECT*);
}
enum IID_IAccessibleObject = GUID(0x95a391c5, 0x9ed4, 0x4c28, [0x84, 0x1, 0xab, 0x9e, 0x6, 0x71, 0x9e, 0x11]);
interface IAccessibleObject : IUnknown
{
    HRESULT SetAccessibleName(const(wchar)*);
}
enum IID_IResultsFolder = GUID(0x96e5ae6d, 0x6ae1, 0x4b1c, [0x90, 0xc, 0xc6, 0x48, 0xe, 0xaa, 0x88, 0x28]);
interface IResultsFolder : IUnknown
{
    HRESULT AddItem(IShellItem);
    HRESULT AddIDList(ITEMIDLIST*, ITEMIDLIST**);
    HRESULT RemoveItem(IShellItem);
    HRESULT RemoveIDList(ITEMIDLIST*);
    HRESULT RemoveAll();
}
enum IID_IAutoCompleteDropDown = GUID(0x3cd141f4, 0x3c6a, 0x11d2, [0xbc, 0xaa, 0x0, 0xc0, 0x4f, 0xd9, 0x29, 0xdb]);
interface IAutoCompleteDropDown : IUnknown
{
    HRESULT GetDropDownStatus(uint*, PWSTR*);
    HRESULT ResetEnumerator();
}
alias CDBURNINGEXTENSIONRET = int;
enum : int
{
    CDBE_RET_DEFAULT          = 0x00000000,
    CDBE_RET_DONTRUNOTHEREXTS = 0x00000001,
    CDBE_RET_STOPWIZARD       = 0x00000002,
}

alias _CDBE_ACTIONS = int;
enum : int
{
    CDBE_TYPE_MUSIC = 0x00000001,
    CDBE_TYPE_DATA  = 0x00000002,
    CDBE_TYPE_ALL   = 0xffffffff,
}

enum IID_ICDBurnExt = GUID(0x2271dcca, 0x74fc, 0x4414, [0x8f, 0xb7, 0xc5, 0x6b, 0x5, 0xac, 0xe2, 0xd7]);
interface ICDBurnExt : IUnknown
{
    HRESULT GetSupportedActionTypes(uint*);
}
enum IID_IEnumReadyCallback = GUID(0x61e00d45, 0x8fff, 0x4e60, [0x92, 0x4e, 0x65, 0x37, 0xb6, 0x16, 0x12, 0xdd]);
interface IEnumReadyCallback : IUnknown
{
    HRESULT EnumReady();
}
enum IID_IEnumerableView = GUID(0x8c8bf236, 0x1aec, 0x495f, [0x98, 0x94, 0x91, 0xd5, 0x7c, 0x3c, 0x68, 0x6f]);
interface IEnumerableView : IUnknown
{
    HRESULT SetEnumReadyCallback(IEnumReadyCallback);
    HRESULT CreateEnumIDListFromContents(ITEMIDLIST*, uint, IEnumIDList*);
}
enum IID_IInsertItem = GUID(0xd2b57227, 0x3d23, 0x4b95, [0x93, 0xc0, 0x49, 0x2b, 0xd4, 0x54, 0xc3, 0x56]);
interface IInsertItem : IUnknown
{
    HRESULT InsertItem(ITEMIDLIST*);
}
enum IID_IFolderBandPriv = GUID(0x47c01f95, 0xe185, 0x412c, [0xb5, 0xc5, 0x4f, 0x27, 0xdf, 0x96, 0x5a, 0xea]);
interface IFolderBandPriv : IUnknown
{
    HRESULT SetCascade(BOOL);
    HRESULT SetAccelerators(BOOL);
    HRESULT SetNoIcons(BOOL);
    HRESULT SetNoText(BOOL);
}
enum IID_IImageRecompress = GUID(0x505f1513, 0x6b3e, 0x4892, [0xa2, 0x72, 0x59, 0xf8, 0x88, 0x9a, 0x4d, 0x3e]);
interface IImageRecompress : IUnknown
{
    HRESULT RecompressImage(IShellItem, int, int, int, IStorage, IStream*);
}
enum IID_IFileDialogControlEvents = GUID(0x36116642, 0xd713, 0x4b97, [0x9b, 0x83, 0x74, 0x84, 0xa9, 0xd0, 0x4, 0x33]);
interface IFileDialogControlEvents : IUnknown
{
    HRESULT OnItemSelected(IFileDialogCustomize, uint, uint);
    HRESULT OnButtonClicked(IFileDialogCustomize, uint);
    HRESULT OnCheckButtonToggled(IFileDialogCustomize, uint, BOOL);
    HRESULT OnControlActivating(IFileDialogCustomize, uint);
}
enum IID_IFileDialog2 = GUID(0x61744fc7, 0x85b5, 0x4791, [0xa9, 0xb0, 0x27, 0x22, 0x76, 0x30, 0x9b, 0x13]);
interface IFileDialog2 : IFileDialog
{
    HRESULT SetCancelButtonLabel(const(wchar)*);
    HRESULT SetNavigationRoot(IShellItem);
}
enum IID_IApplicationAssociationRegistrationUI = GUID(0x1f76a169, 0xf994, 0x40ac, [0x8f, 0xc8, 0x9, 0x59, 0xe8, 0x87, 0x47, 0x10]);
interface IApplicationAssociationRegistrationUI : IUnknown
{
    HRESULT LaunchAdvancedAssociationUI(const(wchar)*);
}
enum IID_IShellRunDll = GUID(0xfce4bde0, 0x4b68, 0x4b80, [0x8e, 0x9c, 0x74, 0x26, 0x31, 0x5a, 0x73, 0x88]);
interface IShellRunDll : IUnknown
{
    HRESULT Run(const(wchar)*);
}
enum IID_IPreviousVersionsInfo = GUID(0x76e54780, 0xad74, 0x48e3, [0xa6, 0x95, 0x3b, 0xa9, 0xa0, 0xaf, 0xf1, 0xd]);
interface IPreviousVersionsInfo : IUnknown
{
    HRESULT AreSnapshotsAvailable(const(wchar)*, BOOL, BOOL*);
}
enum IID_IUseToBrowseItem = GUID(0x5edda5c, 0x98a3, 0x4717, [0x8a, 0xdb, 0xc5, 0xe7, 0xda, 0x99, 0x1e, 0xb1]);
interface IUseToBrowseItem : IRelatedItem
{
}
alias NSTCSTYLE2 = int;
enum : int
{
    NSTCS2_DEFAULT                  = 0x00000000,
    NSTCS2_INTERRUPTNOTIFICATIONS   = 0x00000001,
    NSTCS2_SHOWNULLSPACEMENU        = 0x00000002,
    NSTCS2_DISPLAYPADDING           = 0x00000004,
    NSTCS2_DISPLAYPINNEDONLY        = 0x00000008,
    NTSCS2_NOSINGLETONAUTOEXPAND    = 0x00000010,
    NTSCS2_NEVERINSERTNONENUMERATED = 0x00000020,
}

enum IID_INameSpaceTreeControl2 = GUID(0x7cc7aed8, 0x290e, 0x49bc, [0x89, 0x45, 0xc1, 0x40, 0x1c, 0xc9, 0x30, 0x6c]);
interface INameSpaceTreeControl2 : INameSpaceTreeControl
{
    HRESULT SetControlStyle(uint, uint);
    HRESULT GetControlStyle(uint, uint*);
    HRESULT SetControlStyle2(NSTCSTYLE2, NSTCSTYLE2);
    HRESULT GetControlStyle2(NSTCSTYLE2, NSTCSTYLE2*);
}
alias _NSTCEHITTEST = int;
enum : int
{
    NSTCEHT_NOWHERE         = 0x00000001,
    NSTCEHT_ONITEMICON      = 0x00000002,
    NSTCEHT_ONITEMLABEL     = 0x00000004,
    NSTCEHT_ONITEMINDENT    = 0x00000008,
    NSTCEHT_ONITEMBUTTON    = 0x00000010,
    NSTCEHT_ONITEMRIGHT     = 0x00000020,
    NSTCEHT_ONITEMSTATEICON = 0x00000040,
    NSTCEHT_ONITEM          = 0x00000046,
    NSTCEHT_ONITEMTABBUTTON = 0x00001000,
}

alias _NSTCECLICKTYPE = int;
enum : int
{
    NSTCECT_LBUTTON  = 0x00000001,
    NSTCECT_MBUTTON  = 0x00000002,
    NSTCECT_RBUTTON  = 0x00000003,
    NSTCECT_BUTTON   = 0x00000003,
    NSTCECT_DBLCLICK = 0x00000004,
}

enum IID_INameSpaceTreeControlEvents = GUID(0x93d77985, 0xb3d8, 0x4484, [0x83, 0x18, 0x67, 0x2c, 0xdd, 0xa0, 0x2, 0xce]);
interface INameSpaceTreeControlEvents : IUnknown
{
    HRESULT OnItemClick(IShellItem, uint, uint);
    HRESULT OnPropertyItemCommit(IShellItem);
    HRESULT OnItemStateChanging(IShellItem, uint, uint);
    HRESULT OnItemStateChanged(IShellItem, uint, uint);
    HRESULT OnSelectionChanged(IShellItemArray);
    HRESULT OnKeyboardInput(uint, WPARAM, LPARAM);
    HRESULT OnBeforeExpand(IShellItem);
    HRESULT OnAfterExpand(IShellItem);
    HRESULT OnBeginLabelEdit(IShellItem);
    HRESULT OnEndLabelEdit(IShellItem);
    HRESULT OnGetToolTip(IShellItem, PWSTR, int);
    HRESULT OnBeforeItemDelete(IShellItem);
    HRESULT OnItemAdded(IShellItem, BOOL);
    HRESULT OnItemDeleted(IShellItem, BOOL);
    HRESULT OnBeforeContextMenu(IShellItem, const(GUID)*, void**);
    HRESULT OnAfterContextMenu(IShellItem, IContextMenu, const(GUID)*, void**);
    HRESULT OnBeforeStateImageChange(IShellItem);
    HRESULT OnGetDefaultIconIndex(IShellItem, int*, int*);
}
enum IID_INameSpaceTreeControlDropHandler = GUID(0xf9c665d6, 0xc2f2, 0x4c19, [0xbf, 0x33, 0x83, 0x22, 0xd7, 0x35, 0x2f, 0x51]);
interface INameSpaceTreeControlDropHandler : IUnknown
{
    HRESULT OnDragEnter(IShellItem, IShellItemArray, BOOL, uint, uint*);
    HRESULT OnDragOver(IShellItem, IShellItemArray, uint, uint*);
    HRESULT OnDragPosition(IShellItem, IShellItemArray, int, int);
    HRESULT OnDrop(IShellItem, IShellItemArray, int, uint, uint*);
    HRESULT OnDropPosition(IShellItem, IShellItemArray, int, int);
    HRESULT OnDragLeave(IShellItem);
}
enum IID_INameSpaceTreeAccessible = GUID(0x71f312de, 0x43ed, 0x4190, [0x84, 0x77, 0xe9, 0x53, 0x6b, 0x82, 0x35, 0xb]);
interface INameSpaceTreeAccessible : IUnknown
{
    HRESULT OnGetDefaultAccessibilityAction(IShellItem, BSTR*);
    HRESULT OnDoDefaultAccessibilityAction(IShellItem);
    HRESULT OnGetAccessibilityRole(IShellItem, VARIANT*);
}
struct NSTCCUSTOMDRAW
{
    IShellItem psi;
    uint uItemState;
    uint nstcis;
    const(wchar)* pszText;
    int iImage;
    HIMAGELIST himl;
    int iLevel;
    int iIndent;
}
enum IID_INameSpaceTreeControlCustomDraw = GUID(0x2d3ba758, 0x33ee, 0x42d5, [0xbb, 0x7b, 0x5f, 0x34, 0x31, 0xd8, 0x6c, 0x78]);
interface INameSpaceTreeControlCustomDraw : IUnknown
{
    HRESULT PrePaint(HDC, RECT*, LRESULT*);
    HRESULT PostPaint(HDC, RECT*);
    HRESULT ItemPrePaint(HDC, RECT*, NSTCCUSTOMDRAW*, COLORREF*, COLORREF*, LRESULT*);
    HRESULT ItemPostPaint(HDC, RECT*, NSTCCUSTOMDRAW*);
}
enum IID_ITrayDeskBand = GUID(0x6d67e846, 0x5b9c, 0x4db8, [0x9c, 0xbc, 0xdd, 0xe1, 0x2f, 0x42, 0x54, 0xf1]);
interface ITrayDeskBand : IUnknown
{
    HRESULT ShowDeskBand(const(GUID)*);
    HRESULT HideDeskBand(const(GUID)*);
    HRESULT IsDeskBandShown(const(GUID)*);
    HRESULT DeskBandRegistrationChanged();
}
enum IID_IBandHost = GUID(0xb9075c7c, 0xd48e, 0x403f, [0xab, 0x99, 0xd6, 0xc7, 0x7a, 0x10, 0x84, 0xac]);
interface IBandHost : IUnknown
{
    HRESULT CreateBand(const(GUID)*, BOOL, BOOL, const(GUID)*, void**);
    HRESULT SetBandAvailability(const(GUID)*, BOOL);
    HRESULT DestroyBand(const(GUID)*);
}
enum IID_IComputerInfoChangeNotify = GUID(0xdf60d92, 0x6818, 0x46d6, [0xb3, 0x58, 0xd6, 0x61, 0x70, 0xdd, 0xe4, 0x66]);
interface IComputerInfoChangeNotify : IUnknown
{
    HRESULT ComputerInfoChanged();
}
enum IID_IDesktopGadget = GUID(0xc1646bc4, 0xf298, 0x4f91, [0xa2, 0x4, 0xeb, 0x2d, 0xd1, 0x70, 0x9d, 0x1a]);
interface IDesktopGadget : IUnknown
{
    HRESULT RunGadget(const(wchar)*);
}
alias UNDOCK_REASON = int;
enum : int
{
    UR_RESOLUTION_CHANGE  = 0x00000000,
    UR_MONITOR_DISCONNECT = 0x00000001,
}

enum IID_IAccessibilityDockingServiceCallback = GUID(0x157733fd, 0xa592, 0x42e5, [0xb5, 0x94, 0x24, 0x84, 0x68, 0xc5, 0xa8, 0x1b]);
interface IAccessibilityDockingServiceCallback : IUnknown
{
    HRESULT Undocked(UNDOCK_REASON);
}
enum IID_IAccessibilityDockingService = GUID(0x8849dc22, 0xcedf, 0x4c95, [0x99, 0x8d, 0x5, 0x14, 0x19, 0xdd, 0x3f, 0x76]);
interface IAccessibilityDockingService : IUnknown
{
    HRESULT GetAvailableSize(HMONITOR, uint*, uint*);
    HRESULT DockWindow(HWND, HMONITOR, uint, IAccessibilityDockingServiceCallback);
    HRESULT UndockWindow(HWND);
}
enum IID_IStorageProviderBanners = GUID(0x5efb46d7, 0x47c0, 0x4b68, [0xac, 0xda, 0xde, 0xd4, 0x7c, 0x90, 0xec, 0x91]);
interface IStorageProviderBanners : IUnknown
{
    HRESULT SetBanner(const(wchar)*, const(wchar)*, const(wchar)*);
    HRESULT ClearBanner(const(wchar)*, const(wchar)*);
    HRESULT ClearAllBanners(const(wchar)*);
    HRESULT GetBanner(const(wchar)*, const(wchar)*, PWSTR*);
}
enum IID_IStorageProviderCopyHook = GUID(0x7bf992a9, 0xaf7a, 0x4dba, [0xb2, 0xe5, 0x4d, 0x8, 0xb, 0x1e, 0xcb, 0xc6]);
interface IStorageProviderCopyHook : IUnknown
{
    HRESULT CopyCallback(HWND, uint, uint, const(wchar)*, uint, const(wchar)*, uint, uint*);
}
enum CLSID_WebBrowser_V1 = GUID(0xeab22ac3, 0x30c1, 0x11cf, [0xa7, 0xeb, 0x0, 0x0, 0xc0, 0x5b, 0xae, 0xb]);
struct WebBrowser_V1
{
}
enum CLSID_WebBrowser = GUID(0x8856f961, 0x340a, 0x11d0, [0xa9, 0x6b, 0x0, 0xc0, 0x4f, 0xd7, 0x5, 0xa2]);
struct WebBrowser
{
}
enum CLSID_InternetExplorer = GUID(0x2df01, 0x0, 0x0, [0xc0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x46]);
struct InternetExplorer
{
}
enum CLSID_InternetExplorerMedium = GUID(0xd5e8041d, 0x920f, 0x45e9, [0xb8, 0xfb, 0xb1, 0xde, 0xb8, 0x2c, 0x6e, 0x5e]);
struct InternetExplorerMedium
{
}
enum CLSID_ShellBrowserWindow = GUID(0xc08afd90, 0xf2a1, 0x11d1, [0x84, 0x55, 0x0, 0xa0, 0xc9, 0x1f, 0x38, 0x80]);
struct ShellBrowserWindow
{
}
enum CLSID_ShellWindows = GUID(0x9ba05972, 0xf6a8, 0x11cf, [0xa4, 0x42, 0x0, 0xa0, 0xc9, 0xa, 0x8f, 0x39]);
struct ShellWindows
{
}
enum CLSID_ShellUIHelper = GUID(0x64ab4bb7, 0x111e, 0x11d1, [0x8f, 0x79, 0x0, 0xc0, 0x4f, 0xc2, 0xfb, 0xe1]);
struct ShellUIHelper
{
}
enum CLSID_ShellNameSpace = GUID(0x55136805, 0xb2de, 0x11d1, [0xb9, 0xf2, 0x0, 0xa0, 0xc9, 0x8b, 0xc5, 0x47]);
struct ShellNameSpace
{
}
enum CLSID_CScriptErrorList = GUID(0xefd01300, 0x160f, 0x11d2, [0xbb, 0x2e, 0x0, 0x80, 0x5f, 0xf7, 0xef, 0xca]);
struct CScriptErrorList
{
}
alias CommandStateChangeConstants = int;
enum : int
{
    CSC_UPDATECOMMANDS  = 0xffffffff,
    CSC_NAVIGATEFORWARD = 0x00000001,
    CSC_NAVIGATEBACK    = 0x00000002,
}

alias SecureLockIconConstants = int;
enum : int
{
    secureLockIconUnsecure          = 0x00000000,
    secureLockIconMixed             = 0x00000001,
    secureLockIconSecureUnknownBits = 0x00000002,
    secureLockIconSecure40Bit       = 0x00000003,
    secureLockIconSecure56Bit       = 0x00000004,
    secureLockIconSecureFortezza    = 0x00000005,
    secureLockIconSecure128Bit      = 0x00000006,
}

alias NewProcessCauseConstants = int;
enum : int
{
    ProtectedModeRedirect = 0x00000001,
}

alias ShellWindowTypeConstants = int;
enum : int
{
    SWC_EXPLORER = 0x00000000,
    SWC_BROWSER  = 0x00000001,
    SWC_3RDPARTY = 0x00000002,
    SWC_CALLBACK = 0x00000004,
    SWC_DESKTOP  = 0x00000008,
}

alias ShellWindowFindWindowOptions = int;
enum : int
{
    SWFO_NEEDDISPATCH   = 0x00000001,
    SWFO_INCLUDEPENDING = 0x00000002,
    SWFO_COOKIEPASSED   = 0x00000004,
}

alias BrowserNavConstants = int;
enum : int
{
    navOpenInNewWindow       = 0x00000001,
    navNoHistory             = 0x00000002,
    navNoReadFromCache       = 0x00000004,
    navNoWriteToCache        = 0x00000008,
    navAllowAutosearch       = 0x00000010,
    navBrowserBar            = 0x00000020,
    navHyperlink             = 0x00000040,
    navEnforceRestricted     = 0x00000080,
    navNewWindowsManaged     = 0x00000100,
    navUntrustedForDownload  = 0x00000200,
    navTrustedForActiveX     = 0x00000400,
    navOpenInNewTab          = 0x00000800,
    navOpenInBackgroundTab   = 0x00001000,
    navKeepWordWheelText     = 0x00002000,
    navVirtualTab            = 0x00004000,
    navBlockRedirectsXDomain = 0x00008000,
    navOpenNewForegroundTab  = 0x00010000,
    navTravelLogScreenshot   = 0x00020000,
    navDeferUnload           = 0x00040000,
    navSpeculative           = 0x00080000,
    navSuggestNewWindow      = 0x00100000,
    navSuggestNewTab         = 0x00200000,
    navReserved1             = 0x00400000,
    navHomepageNavigate      = 0x00800000,
    navRefresh               = 0x01000000,
    navHostNavigation        = 0x02000000,
    navReserved2             = 0x04000000,
    navReserved3             = 0x08000000,
    navReserved4             = 0x10000000,
    navReserved5             = 0x20000000,
    navReserved6             = 0x40000000,
    navReserved7             = 0x80000000,
}

alias RefreshConstants = int;
enum : int
{
    REFRESH_NORMAL     = 0x00000000,
    REFRESH_IFEXPIRED  = 0x00000001,
    REFRESH_COMPLETELY = 0x00000003,
}

enum IID_IWebBrowser = GUID(0xeab22ac1, 0x30c1, 0x11cf, [0xa7, 0xeb, 0x0, 0x0, 0xc0, 0x5b, 0xae, 0xb]);
interface IWebBrowser : IDispatch
{
    HRESULT GoBack();
    HRESULT GoForward();
    HRESULT GoHome();
    HRESULT GoSearch();
    HRESULT Navigate(BSTR, VARIANT*, VARIANT*, VARIANT*, VARIANT*);
    HRESULT Refresh();
    HRESULT Refresh2(VARIANT*);
    HRESULT Stop();
    HRESULT get_Application(IDispatch*);
    HRESULT get_Parent(IDispatch*);
    HRESULT get_Container(IDispatch*);
    HRESULT get_Document(IDispatch*);
    HRESULT get_TopLevelContainer(short*);
    HRESULT get_Type(BSTR*);
    HRESULT get_Left(int*);
    HRESULT put_Left(int);
    HRESULT get_Top(int*);
    HRESULT put_Top(int);
    HRESULT get_Width(int*);
    HRESULT put_Width(int);
    HRESULT get_Height(int*);
    HRESULT put_Height(int);
    HRESULT get_LocationName(BSTR*);
    HRESULT get_LocationURL(BSTR*);
    HRESULT get_Busy(short*);
}
enum IID_DWebBrowserEvents = GUID(0xeab22ac2, 0x30c1, 0x11cf, [0xa7, 0xeb, 0x0, 0x0, 0xc0, 0x5b, 0xae, 0xb]);
interface DWebBrowserEvents : IDispatch
{
}
enum IID_IWebBrowserApp = GUID(0x2df05, 0x0, 0x0, [0xc0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x46]);
interface IWebBrowserApp : IWebBrowser
{
    HRESULT Quit();
    HRESULT ClientToWindow(int*, int*);
    HRESULT PutProperty(BSTR, VARIANT);
    HRESULT GetProperty(BSTR, VARIANT*);
    HRESULT get_Name(BSTR*);
    HRESULT get_HWND(SHANDLE_PTR*);
    HRESULT get_FullName(BSTR*);
    HRESULT get_Path(BSTR*);
    HRESULT get_Visible(short*);
    HRESULT put_Visible(short);
    HRESULT get_StatusBar(short*);
    HRESULT put_StatusBar(short);
    HRESULT get_StatusText(BSTR*);
    HRESULT put_StatusText(BSTR);
    HRESULT get_ToolBar(int*);
    HRESULT put_ToolBar(int);
    HRESULT get_MenuBar(short*);
    HRESULT put_MenuBar(short);
    HRESULT get_FullScreen(short*);
    HRESULT put_FullScreen(short);
}
enum IID_IWebBrowser2 = GUID(0xd30c1661, 0xcdaf, 0x11d0, [0x8a, 0x3e, 0x0, 0xc0, 0x4f, 0xc9, 0xe2, 0x6e]);
interface IWebBrowser2 : IWebBrowserApp
{
    HRESULT Navigate2(VARIANT*, VARIANT*, VARIANT*, VARIANT*, VARIANT*);
    HRESULT QueryStatusWB(OLECMDID, OLECMDF*);
    HRESULT ExecWB(OLECMDID, OLECMDEXECOPT, VARIANT*, VARIANT*);
    HRESULT ShowBrowserBar(VARIANT*, VARIANT*, VARIANT*);
    HRESULT get_ReadyState(READYSTATE*);
    HRESULT get_Offline(short*);
    HRESULT put_Offline(short);
    HRESULT get_Silent(short*);
    HRESULT put_Silent(short);
    HRESULT get_RegisterAsBrowser(short*);
    HRESULT put_RegisterAsBrowser(short);
    HRESULT get_RegisterAsDropTarget(short*);
    HRESULT put_RegisterAsDropTarget(short);
    HRESULT get_TheaterMode(short*);
    HRESULT put_TheaterMode(short);
    HRESULT get_AddressBar(short*);
    HRESULT put_AddressBar(short);
    HRESULT get_Resizable(short*);
    HRESULT put_Resizable(short);
}
enum IID_DWebBrowserEvents2 = GUID(0x34a715a0, 0x6587, 0x11d0, [0x92, 0x4a, 0x0, 0x20, 0xaf, 0xc7, 0xac, 0x4d]);
interface DWebBrowserEvents2 : IDispatch
{
}
enum IID_DShellWindowsEvents = GUID(0xfe4106e0, 0x399a, 0x11d0, [0xa4, 0x8c, 0x0, 0xa0, 0xc9, 0xa, 0x8f, 0x39]);
interface DShellWindowsEvents : IDispatch
{
}
enum IID_IShellWindows = GUID(0x85cb6900, 0x4d95, 0x11cf, [0x96, 0xc, 0x0, 0x80, 0xc7, 0xf4, 0xee, 0x85]);
interface IShellWindows : IDispatch
{
    HRESULT get_Count(int*);
    HRESULT Item(VARIANT, IDispatch*);
    HRESULT _NewEnum(IUnknown*);
    HRESULT Register(IDispatch, int, int, int*);
    HRESULT RegisterPending(int, VARIANT*, VARIANT*, int, int*);
    HRESULT Revoke(int);
    HRESULT OnNavigate(int, VARIANT*);
    HRESULT OnActivated(int, short);
    HRESULT FindWindowSW(VARIANT*, VARIANT*, int, int*, int, IDispatch*);
    HRESULT OnCreated(int, IUnknown);
    HRESULT ProcessAttachDetach(short);
}
enum IID_IShellUIHelper = GUID(0x729fe2f8, 0x1ea8, 0x11d1, [0x8f, 0x85, 0x0, 0xc0, 0x4f, 0xc2, 0xfb, 0xe1]);
interface IShellUIHelper : IDispatch
{
    HRESULT ResetFirstBootMode();
    HRESULT ResetSafeMode();
    HRESULT RefreshOfflineDesktop();
    HRESULT AddFavorite(BSTR, VARIANT*);
    HRESULT AddChannel(BSTR);
    HRESULT AddDesktopComponent(BSTR, BSTR, VARIANT*, VARIANT*, VARIANT*, VARIANT*);
    HRESULT IsSubscribed(BSTR, short*);
    HRESULT NavigateAndFind(BSTR, BSTR, VARIANT*);
    HRESULT ImportExportFavorites(short, BSTR);
    HRESULT AutoCompleteSaveForm(VARIANT*);
    HRESULT AutoScan(BSTR, BSTR, VARIANT*);
    HRESULT AutoCompleteAttach(VARIANT*);
    HRESULT ShowBrowserUI(BSTR, VARIANT*, VARIANT*);
}
enum IID_IShellUIHelper2 = GUID(0xa7fe6eda, 0x1932, 0x4281, [0xb8, 0x81, 0x87, 0xb3, 0x1b, 0x8b, 0xc5, 0x2c]);
interface IShellUIHelper2 : IShellUIHelper
{
    HRESULT AddSearchProvider(BSTR);
    HRESULT RunOnceShown();
    HRESULT SkipRunOnce();
    HRESULT CustomizeSettings(short, short, BSTR);
    HRESULT SqmEnabled(short*);
    HRESULT PhishingEnabled(short*);
    HRESULT BrandImageUri(BSTR*);
    HRESULT SkipTabsWelcome();
    HRESULT DiagnoseConnection();
    HRESULT CustomizeClearType(short);
    HRESULT IsSearchProviderInstalled(BSTR, uint*);
    HRESULT IsSearchMigrated(short*);
    HRESULT DefaultSearchProvider(BSTR*);
    HRESULT RunOnceRequiredSettingsComplete(short);
    HRESULT RunOnceHasShown(short*);
    HRESULT SearchGuideUrl(BSTR*);
}
enum IID_IShellUIHelper3 = GUID(0x528df2ec, 0xd419, 0x40bc, [0x9b, 0x6d, 0xdc, 0xdb, 0xf9, 0xc1, 0xb2, 0x5d]);
interface IShellUIHelper3 : IShellUIHelper2
{
    HRESULT AddService(BSTR);
    HRESULT IsServiceInstalled(BSTR, BSTR, uint*);
    HRESULT InPrivateFilteringEnabled(short*);
    HRESULT AddToFavoritesBar(BSTR, BSTR, VARIANT*);
    HRESULT BuildNewTabPage();
    HRESULT SetRecentlyClosedVisible(short);
    HRESULT SetActivitiesVisible(short);
    HRESULT ContentDiscoveryReset();
    HRESULT IsSuggestedSitesEnabled(short*);
    HRESULT EnableSuggestedSites(short);
    HRESULT NavigateToSuggestedSites(BSTR);
    HRESULT ShowTabsHelp();
    HRESULT ShowInPrivateHelp();
}
enum IID_IShellUIHelper4 = GUID(0xb36e6a53, 0x8073, 0x499e, [0x82, 0x4c, 0xd7, 0x76, 0x33, 0xa, 0x33, 0x3e]);
interface IShellUIHelper4 : IShellUIHelper3
{
    HRESULT msIsSiteMode(short*);
    HRESULT msSiteModeShowThumbBar();
    HRESULT msSiteModeAddThumbBarButton(BSTR, BSTR, VARIANT*);
    HRESULT msSiteModeUpdateThumbBarButton(VARIANT, short, short);
    HRESULT msSiteModeSetIconOverlay(BSTR, VARIANT*);
    HRESULT msSiteModeClearIconOverlay();
    HRESULT msAddSiteMode();
    HRESULT msSiteModeCreateJumpList(BSTR);
    HRESULT msSiteModeAddJumpListItem(BSTR, BSTR, BSTR, VARIANT*);
    HRESULT msSiteModeClearJumpList();
    HRESULT msSiteModeShowJumpList();
    HRESULT msSiteModeAddButtonStyle(VARIANT, BSTR, BSTR, VARIANT*);
    HRESULT msSiteModeShowButtonStyle(VARIANT, VARIANT);
    HRESULT msSiteModeActivate();
    HRESULT msIsSiteModeFirstRun(short, VARIANT*);
    HRESULT msAddTrackingProtectionList(BSTR, BSTR);
    HRESULT msTrackingProtectionEnabled(short*);
    HRESULT msActiveXFilteringEnabled(short*);
}
enum IID_IShellUIHelper5 = GUID(0xa2a08b09, 0x103d, 0x4d3f, [0xb9, 0x1c, 0xea, 0x45, 0x5c, 0xa8, 0x2e, 0xfa]);
interface IShellUIHelper5 : IShellUIHelper4
{
    HRESULT msProvisionNetworks(BSTR, VARIANT*);
    HRESULT msReportSafeUrl();
    HRESULT msSiteModeRefreshBadge();
    HRESULT msSiteModeClearBadge();
    HRESULT msDiagnoseConnectionUILess();
    HRESULT msLaunchNetworkClientHelp();
    HRESULT msChangeDefaultBrowser(short);
}
enum IID_IShellUIHelper6 = GUID(0x987a573e, 0x46ee, 0x4e89, [0x96, 0xab, 0xdd, 0xf7, 0xf8, 0xfd, 0xc9, 0x8c]);
interface IShellUIHelper6 : IShellUIHelper5
{
    HRESULT msStopPeriodicTileUpdate();
    HRESULT msStartPeriodicTileUpdate(VARIANT, VARIANT, VARIANT);
    HRESULT msStartPeriodicTileUpdateBatch(VARIANT, VARIANT, VARIANT);
    HRESULT msClearTile();
    HRESULT msEnableTileNotificationQueue(short);
    HRESULT msPinnedSiteState(VARIANT*);
    HRESULT msEnableTileNotificationQueueForSquare150x150(short);
    HRESULT msEnableTileNotificationQueueForWide310x150(short);
    HRESULT msEnableTileNotificationQueueForSquare310x310(short);
    HRESULT msScheduledTileNotification(BSTR, BSTR, BSTR, VARIANT, VARIANT);
    HRESULT msRemoveScheduledTileNotification(BSTR);
    HRESULT msStartPeriodicBadgeUpdate(BSTR, VARIANT, VARIANT);
    HRESULT msStopPeriodicBadgeUpdate();
    HRESULT msLaunchInternetOptions();
}
enum IID_IShellUIHelper7 = GUID(0x60e567c8, 0x9573, 0x4ab2, [0xa2, 0x64, 0x63, 0x7c, 0x6c, 0x16, 0x1c, 0xb1]);
interface IShellUIHelper7 : IShellUIHelper6
{
    HRESULT SetExperimentalFlag(BSTR, short);
    HRESULT GetExperimentalFlag(BSTR, short*);
    HRESULT SetExperimentalValue(BSTR, uint);
    HRESULT GetExperimentalValue(BSTR, uint*);
    HRESULT ResetAllExperimentalFlagsAndValues();
    HRESULT GetNeedIEAutoLaunchFlag(BSTR, short*);
    HRESULT SetNeedIEAutoLaunchFlag(BSTR, short);
    HRESULT HasNeedIEAutoLaunchFlag(BSTR, short*);
    HRESULT LaunchIE(BSTR, short);
}
enum IID_IShellUIHelper8 = GUID(0x66debcf2, 0x5b0, 0x4f07, [0xb4, 0x9b, 0xb9, 0x62, 0x41, 0xa6, 0x5d, 0xb2]);
interface IShellUIHelper8 : IShellUIHelper7
{
    HRESULT GetCVListData(BSTR*);
    HRESULT GetCVListLocalData(BSTR*);
    HRESULT GetEMIEListData(BSTR*);
    HRESULT GetEMIEListLocalData(BSTR*);
    HRESULT OpenFavoritesPane();
    HRESULT OpenFavoritesSettings();
    HRESULT LaunchInHVSI(BSTR);
}
enum IID_IShellUIHelper9 = GUID(0x6cdf73b0, 0x7f2f, 0x451f, [0xbc, 0xf, 0x63, 0xe0, 0xf3, 0x28, 0x4e, 0x54]);
interface IShellUIHelper9 : IShellUIHelper8
{
    HRESULT GetOSSku(uint*);
}
enum IID_DShellNameSpaceEvents = GUID(0x55136806, 0xb2de, 0x11d1, [0xb9, 0xf2, 0x0, 0xa0, 0xc9, 0x8b, 0xc5, 0x47]);
interface DShellNameSpaceEvents : IDispatch
{
}
enum IID_IShellFavoritesNameSpace = GUID(0x55136804, 0xb2de, 0x11d1, [0xb9, 0xf2, 0x0, 0xa0, 0xc9, 0x8b, 0xc5, 0x47]);
interface IShellFavoritesNameSpace : IDispatch
{
    HRESULT MoveSelectionUp();
    HRESULT MoveSelectionDown();
    HRESULT ResetSort();
    HRESULT NewFolder();
    HRESULT Synchronize();
    HRESULT Import();
    HRESULT Export();
    HRESULT InvokeContextMenuCommand(BSTR);
    HRESULT MoveSelectionTo();
    HRESULT get_SubscriptionsEnabled(short*);
    HRESULT CreateSubscriptionForSelection(short*);
    HRESULT DeleteSubscriptionForSelection(short*);
    HRESULT SetRoot(BSTR);
}
enum IID_IShellNameSpace = GUID(0xe572d3c9, 0x37be, 0x4ae2, [0x82, 0x5d, 0xd5, 0x21, 0x76, 0x3e, 0x31, 0x8]);
interface IShellNameSpace : IShellFavoritesNameSpace
{
    HRESULT get_EnumOptions(int*);
    HRESULT put_EnumOptions(int);
    HRESULT get_SelectedItem(IDispatch*);
    HRESULT put_SelectedItem(IDispatch);
    HRESULT get_Root(VARIANT*);
    HRESULT put_Root(VARIANT);
    HRESULT get_Depth(int*);
    HRESULT put_Depth(int);
    HRESULT get_Mode(uint*);
    HRESULT put_Mode(uint);
    HRESULT get_Flags(uint*);
    HRESULT put_Flags(uint);
    HRESULT put_TVFlags(uint);
    HRESULT get_TVFlags(uint*);
    HRESULT get_Columns(BSTR*);
    HRESULT put_Columns(BSTR);
    HRESULT get_CountViewTypes(int*);
    HRESULT SetViewType(int);
    HRESULT SelectedItems(IDispatch*);
    HRESULT Expand(VARIANT, int);
    HRESULT UnselectAll();
}
enum IID_IScriptErrorList = GUID(0xf3470f24, 0x15fd, 0x11d2, [0xbb, 0x2e, 0x0, 0x80, 0x5f, 0xf7, 0xef, 0xca]);
interface IScriptErrorList : IDispatch
{
    HRESULT advanceError();
    HRESULT retreatError();
    HRESULT canAdvanceError(BOOL*);
    HRESULT canRetreatError(BOOL*);
    HRESULT getErrorLine(int*);
    HRESULT getErrorChar(int*);
    HRESULT getErrorCode(int*);
    HRESULT getErrorMsg(BSTR*);
    HRESULT getErrorUrl(BSTR*);
    HRESULT getAlwaysShowLockState(BOOL*);
    HRESULT getDetailsPaneOpen(BOOL*);
    HRESULT setDetailsPaneOpen(BOOL);
    HRESULT getPerErrorDisplay(BOOL*);
    HRESULT setPerErrorDisplay(BOOL);
}
enum CLSID_ShellFolderViewOC = GUID(0x9ba05971, 0xf6a8, 0x11cf, [0xa4, 0x42, 0x0, 0xa0, 0xc9, 0xa, 0x8f, 0x39]);
struct ShellFolderViewOC
{
}
enum CLSID_ShellFolderItem = GUID(0x2fe352ea, 0xfd1f, 0x11d2, [0xb1, 0xf4, 0x0, 0xc0, 0x4f, 0x8e, 0xeb, 0x3e]);
struct ShellFolderItem
{
}
enum CLSID_ShellLinkObject = GUID(0x11219420, 0x1768, 0x11d1, [0x95, 0xbe, 0x0, 0x60, 0x97, 0x97, 0xea, 0x4f]);
struct ShellLinkObject
{
}
enum CLSID_ShellFolderView = GUID(0x62112aa1, 0xebe4, 0x11cf, [0xa5, 0xfb, 0x0, 0x20, 0xaf, 0xe7, 0x29, 0x2d]);
struct ShellFolderView
{
}
enum CLSID_Shell = GUID(0x13709620, 0xc279, 0x11ce, [0xa4, 0x9e, 0x44, 0x45, 0x53, 0x54, 0x0, 0x0]);
struct Shell
{
}
enum CLSID_ShellDispatchInproc = GUID(0xa89a860, 0xd7b1, 0x11ce, [0x83, 0x50, 0x44, 0x45, 0x53, 0x54, 0x0, 0x0]);
struct ShellDispatchInproc
{
}
enum CLSID_FileSearchBand = GUID(0xc4ee31f3, 0x4768, 0x11d2, [0xbe, 0x5c, 0x0, 0xa0, 0xc9, 0xa8, 0x3d, 0xa1]);
struct FileSearchBand
{
}
alias OfflineFolderStatus = int;
enum : int
{
    OFS_INACTIVE   = 0xffffffff,
    OFS_ONLINE     = 0x00000000,
    OFS_OFFLINE    = 0x00000001,
    OFS_SERVERBACK = 0x00000002,
    OFS_DIRTYCACHE = 0x00000003,
}

alias ShellFolderViewOptions = int;
enum : int
{
    SFVVO_SHOWALLOBJECTS       = 0x00000001,
    SFVVO_SHOWEXTENSIONS       = 0x00000002,
    SFVVO_SHOWCOMPCOLOR        = 0x00000008,
    SFVVO_SHOWSYSFILES         = 0x00000020,
    SFVVO_WIN95CLASSIC         = 0x00000040,
    SFVVO_DOUBLECLICKINWEBVIEW = 0x00000080,
    SFVVO_DESKTOPHTML          = 0x00000200,
}

alias ShellSpecialFolderConstants = int;
enum : int
{
    ssfDESKTOP          = 0x00000000,
    ssfPROGRAMS         = 0x00000002,
    ssfCONTROLS         = 0x00000003,
    ssfPRINTERS         = 0x00000004,
    ssfPERSONAL         = 0x00000005,
    ssfFAVORITES        = 0x00000006,
    ssfSTARTUP          = 0x00000007,
    ssfRECENT           = 0x00000008,
    ssfSENDTO           = 0x00000009,
    ssfBITBUCKET        = 0x0000000a,
    ssfSTARTMENU        = 0x0000000b,
    ssfDESKTOPDIRECTORY = 0x00000010,
    ssfDRIVES           = 0x00000011,
    ssfNETWORK          = 0x00000012,
    ssfNETHOOD          = 0x00000013,
    ssfFONTS            = 0x00000014,
    ssfTEMPLATES        = 0x00000015,
    ssfCOMMONSTARTMENU  = 0x00000016,
    ssfCOMMONPROGRAMS   = 0x00000017,
    ssfCOMMONSTARTUP    = 0x00000018,
    ssfCOMMONDESKTOPDIR = 0x00000019,
    ssfAPPDATA          = 0x0000001a,
    ssfPRINTHOOD        = 0x0000001b,
    ssfLOCALAPPDATA     = 0x0000001c,
    ssfALTSTARTUP       = 0x0000001d,
    ssfCOMMONALTSTARTUP = 0x0000001e,
    ssfCOMMONFAVORITES  = 0x0000001f,
    ssfINTERNETCACHE    = 0x00000020,
    ssfCOOKIES          = 0x00000021,
    ssfHISTORY          = 0x00000022,
    ssfCOMMONAPPDATA    = 0x00000023,
    ssfWINDOWS          = 0x00000024,
    ssfSYSTEM           = 0x00000025,
    ssfPROGRAMFILES     = 0x00000026,
    ssfMYPICTURES       = 0x00000027,
    ssfPROFILE          = 0x00000028,
    ssfSYSTEMx86        = 0x00000029,
    ssfPROGRAMFILESx86  = 0x00000030,
}

enum IID_IFolderViewOC = GUID(0x9ba05970, 0xf6a8, 0x11cf, [0xa4, 0x42, 0x0, 0xa0, 0xc9, 0xa, 0x8f, 0x39]);
interface IFolderViewOC : IDispatch
{
    HRESULT SetFolderView(IDispatch);
}
enum IID_DShellFolderViewEvents = GUID(0x62112aa2, 0xebe4, 0x11cf, [0xa5, 0xfb, 0x0, 0x20, 0xaf, 0xe7, 0x29, 0x2d]);
interface DShellFolderViewEvents : IDispatch
{
}
enum IID_DFConstraint = GUID(0x4a3df050, 0x23bd, 0x11d2, [0x93, 0x9f, 0x0, 0xa0, 0xc9, 0x1e, 0xed, 0xba]);
interface DFConstraint : IDispatch
{
    HRESULT get_Name(BSTR*);
    HRESULT get_Value(VARIANT*);
}
enum IID_FolderItem = GUID(0xfac32c80, 0xcbe4, 0x11ce, [0x83, 0x50, 0x44, 0x45, 0x53, 0x54, 0x0, 0x0]);
interface FolderItem : IDispatch
{
    HRESULT get_Application(IDispatch*);
    HRESULT get_Parent(IDispatch*);
    HRESULT get_Name(BSTR*);
    HRESULT put_Name(BSTR);
    HRESULT get_Path(BSTR*);
    HRESULT get_GetLink(IDispatch*);
    HRESULT get_GetFolder(IDispatch*);
    HRESULT get_IsLink(short*);
    HRESULT get_IsFolder(short*);
    HRESULT get_IsFileSystem(short*);
    HRESULT get_IsBrowsable(short*);
    HRESULT get_ModifyDate(double*);
    HRESULT put_ModifyDate(double);
    HRESULT get_Size(int*);
    HRESULT get_Type(BSTR*);
    HRESULT Verbs(FolderItemVerbs*);
    HRESULT InvokeVerb(VARIANT);
}
enum IID_FolderItems = GUID(0x744129e0, 0xcbe5, 0x11ce, [0x83, 0x50, 0x44, 0x45, 0x53, 0x54, 0x0, 0x0]);
interface FolderItems : IDispatch
{
    HRESULT get_Count(int*);
    HRESULT get_Application(IDispatch*);
    HRESULT get_Parent(IDispatch*);
    HRESULT Item(VARIANT, FolderItem*);
    HRESULT _NewEnum(IUnknown*);
}
enum IID_FolderItemVerb = GUID(0x8ec3e00, 0x50b0, 0x11cf, [0x96, 0xc, 0x0, 0x80, 0xc7, 0xf4, 0xee, 0x85]);
interface FolderItemVerb : IDispatch
{
    HRESULT get_Application(IDispatch*);
    HRESULT get_Parent(IDispatch*);
    HRESULT get_Name(BSTR*);
    HRESULT DoIt();
}
enum IID_FolderItemVerbs = GUID(0x1f8352c0, 0x50b0, 0x11cf, [0x96, 0xc, 0x0, 0x80, 0xc7, 0xf4, 0xee, 0x85]);
interface FolderItemVerbs : IDispatch
{
    HRESULT get_Count(int*);
    HRESULT get_Application(IDispatch*);
    HRESULT get_Parent(IDispatch*);
    HRESULT Item(VARIANT, FolderItemVerb*);
    HRESULT _NewEnum(IUnknown*);
}
enum IID_Folder = GUID(0xbbcbde60, 0xc3ff, 0x11ce, [0x83, 0x50, 0x44, 0x45, 0x53, 0x54, 0x0, 0x0]);
interface Folder : IDispatch
{
    HRESULT get_Title(BSTR*);
    HRESULT get_Application(IDispatch*);
    HRESULT get_Parent(IDispatch*);
    HRESULT get_ParentFolder(Folder*);
    HRESULT Items(FolderItems*);
    HRESULT ParseName(BSTR, FolderItem*);
    HRESULT NewFolder(BSTR, VARIANT);
    HRESULT MoveHere(VARIANT, VARIANT);
    HRESULT CopyHere(VARIANT, VARIANT);
    HRESULT GetDetailsOf(VARIANT, int, BSTR*);
}
enum IID_Folder2 = GUID(0xf0d2d8ef, 0x3890, 0x11d2, [0xbf, 0x8b, 0x0, 0xc0, 0x4f, 0xb9, 0x36, 0x61]);
interface Folder2 : Folder
{
    HRESULT get_Self(FolderItem*);
    HRESULT get_OfflineStatus(int*);
    HRESULT Synchronize();
    HRESULT get_HaveToShowWebViewBarricade(short*);
    HRESULT DismissedWebViewBarricade();
}
enum IID_Folder3 = GUID(0xa7ae5f64, 0xc4d7, 0x4d7f, [0x93, 0x7, 0x4d, 0x24, 0xee, 0x54, 0xb8, 0x41]);
interface Folder3 : Folder2
{
    HRESULT get_ShowWebViewBarricade(short*);
    HRESULT put_ShowWebViewBarricade(short);
}
enum IID_FolderItem2 = GUID(0xedc817aa, 0x92b8, 0x11d1, [0xb0, 0x75, 0x0, 0xc0, 0x4f, 0xc3, 0x3a, 0xa5]);
interface FolderItem2 : FolderItem
{
    HRESULT InvokeVerbEx(VARIANT, VARIANT);
    HRESULT ExtendedProperty(BSTR, VARIANT*);
}
enum IID_FolderItems2 = GUID(0xc94f0ad0, 0xf363, 0x11d2, [0xa3, 0x27, 0x0, 0xc0, 0x4f, 0x8e, 0xec, 0x7f]);
interface FolderItems2 : FolderItems
{
    HRESULT InvokeVerbEx(VARIANT, VARIANT);
}
enum IID_FolderItems3 = GUID(0xeaa7c309, 0xbbec, 0x49d5, [0x82, 0x1d, 0x64, 0xd9, 0x66, 0xcb, 0x66, 0x7f]);
interface FolderItems3 : FolderItems2
{
    HRESULT Filter(int, BSTR);
    HRESULT get_Verbs(FolderItemVerbs*);
}
enum IID_IShellLinkDual = GUID(0x88a05c00, 0xf000, 0x11ce, [0x83, 0x50, 0x44, 0x45, 0x53, 0x54, 0x0, 0x0]);
interface IShellLinkDual : IDispatch
{
    HRESULT get_Path(BSTR*);
    HRESULT put_Path(BSTR);
    HRESULT get_Description(BSTR*);
    HRESULT put_Description(BSTR);
    HRESULT get_WorkingDirectory(BSTR*);
    HRESULT put_WorkingDirectory(BSTR);
    HRESULT get_Arguments(BSTR*);
    HRESULT put_Arguments(BSTR);
    HRESULT get_Hotkey(int*);
    HRESULT put_Hotkey(int);
    HRESULT get_ShowCommand(int*);
    HRESULT put_ShowCommand(int);
    HRESULT Resolve(int);
    HRESULT GetIconLocation(BSTR*, int*);
    HRESULT SetIconLocation(BSTR, int);
    HRESULT Save(VARIANT);
}
enum IID_IShellLinkDual2 = GUID(0x317ee249, 0xf12e, 0x11d2, [0xb1, 0xe4, 0x0, 0xc0, 0x4f, 0x8e, 0xeb, 0x3e]);
interface IShellLinkDual2 : IShellLinkDual
{
    HRESULT get_Target(FolderItem*);
}
enum IID_IShellFolderViewDual = GUID(0xe7a1af80, 0x4d96, 0x11cf, [0x96, 0xc, 0x0, 0x80, 0xc7, 0xf4, 0xee, 0x85]);
interface IShellFolderViewDual : IDispatch
{
    HRESULT get_Application(IDispatch*);
    HRESULT get_Parent(IDispatch*);
    HRESULT get_Folder(Folder*);
    HRESULT SelectedItems(FolderItems*);
    HRESULT get_FocusedItem(FolderItem*);
    HRESULT SelectItem(VARIANT*, int);
    HRESULT PopupItemMenu(FolderItem, VARIANT, VARIANT, BSTR*);
    HRESULT get_Script(IDispatch*);
    HRESULT get_ViewOptions(int*);
}
enum IID_IShellFolderViewDual2 = GUID(0x31c147b6, 0xade, 0x4a3c, [0xb5, 0x14, 0xdd, 0xf9, 0x32, 0xef, 0x6d, 0x17]);
interface IShellFolderViewDual2 : IShellFolderViewDual
{
    HRESULT get_CurrentViewMode(uint*);
    HRESULT put_CurrentViewMode(uint);
    HRESULT SelectItemRelative(int);
}
enum IID_IShellFolderViewDual3 = GUID(0x29ec8e6c, 0x46d3, 0x411f, [0xba, 0xaa, 0x61, 0x1a, 0x6c, 0x9c, 0xac, 0x66]);
interface IShellFolderViewDual3 : IShellFolderViewDual2
{
    HRESULT get_GroupBy(BSTR*);
    HRESULT put_GroupBy(BSTR);
    HRESULT get_FolderFlags(uint*);
    HRESULT put_FolderFlags(uint);
    HRESULT get_SortColumns(BSTR*);
    HRESULT put_SortColumns(BSTR);
    HRESULT put_IconSize(int);
    HRESULT get_IconSize(int*);
    HRESULT FilterView(BSTR);
}
enum IID_IShellDispatch = GUID(0xd8f015c0, 0xc278, 0x11ce, [0xa4, 0x9e, 0x44, 0x45, 0x53, 0x54, 0x0, 0x0]);
interface IShellDispatch : IDispatch
{
    HRESULT get_Application(IDispatch*);
    HRESULT get_Parent(IDispatch*);
    HRESULT NameSpace(VARIANT, Folder*);
    HRESULT BrowseForFolder(int, BSTR, int, VARIANT, Folder*);
    HRESULT Windows(IDispatch*);
    HRESULT Open(VARIANT);
    HRESULT Explore(VARIANT);
    HRESULT MinimizeAll();
    HRESULT UndoMinimizeALL();
    HRESULT FileRun();
    HRESULT CascadeWindows();
    HRESULT TileVertically();
    HRESULT TileHorizontally();
    HRESULT ShutdownWindows();
    HRESULT Suspend();
    HRESULT EjectPC();
    HRESULT SetTime();
    HRESULT TrayProperties();
    HRESULT Help();
    HRESULT FindFiles();
    HRESULT FindComputer();
    HRESULT RefreshMenu();
    HRESULT ControlPanelItem(BSTR);
}
enum IID_IShellDispatch2 = GUID(0xa4c6892c, 0x3ba9, 0x11d2, [0x9d, 0xea, 0x0, 0xc0, 0x4f, 0xb1, 0x61, 0x62]);
interface IShellDispatch2 : IShellDispatch
{
    HRESULT IsRestricted(BSTR, BSTR, int*);
    HRESULT ShellExecute(BSTR, VARIANT, VARIANT, VARIANT, VARIANT);
    HRESULT FindPrinter(BSTR, BSTR, BSTR);
    HRESULT GetSystemInformation(BSTR, VARIANT*);
    HRESULT ServiceStart(BSTR, VARIANT, VARIANT*);
    HRESULT ServiceStop(BSTR, VARIANT, VARIANT*);
    HRESULT IsServiceRunning(BSTR, VARIANT*);
    HRESULT CanStartStopService(BSTR, VARIANT*);
    HRESULT ShowBrowserBar(BSTR, VARIANT, VARIANT*);
}
enum IID_IShellDispatch3 = GUID(0x177160ca, 0xbb5a, 0x411c, [0x84, 0x1d, 0xbd, 0x38, 0xfa, 0xcd, 0xea, 0xa0]);
interface IShellDispatch3 : IShellDispatch2
{
    HRESULT AddToRecent(VARIANT, BSTR);
}
enum IID_IShellDispatch4 = GUID(0xefd84b2d, 0x4bcf, 0x4298, [0xbe, 0x25, 0xeb, 0x54, 0x2a, 0x59, 0xfb, 0xda]);
interface IShellDispatch4 : IShellDispatch3
{
    HRESULT WindowsSecurity();
    HRESULT ToggleDesktop();
    HRESULT ExplorerPolicy(BSTR, VARIANT*);
    HRESULT GetSetting(int, short*);
}
enum IID_IShellDispatch5 = GUID(0x866738b9, 0x6cf2, 0x4de8, [0x87, 0x67, 0xf7, 0x94, 0xeb, 0xe7, 0x4f, 0x4e]);
interface IShellDispatch5 : IShellDispatch4
{
    HRESULT WindowSwitcher();
}
enum IID_IShellDispatch6 = GUID(0x286e6f1b, 0x7113, 0x4355, [0x95, 0x62, 0x96, 0xb7, 0xe9, 0xd6, 0x4c, 0x54]);
interface IShellDispatch6 : IShellDispatch5
{
    HRESULT SearchCommand();
}
enum IID_IFileSearchBand = GUID(0x2d91eea1, 0x9932, 0x11d2, [0xbe, 0x86, 0x0, 0xa0, 0xc9, 0xa8, 0x3d, 0xa1]);
interface IFileSearchBand : IDispatch
{
    HRESULT SetFocus();
    HRESULT SetSearchParameters(BSTR*, short, VARIANT*, VARIANT*);
    HRESULT get_SearchID(BSTR*);
    HRESULT get_Scope(VARIANT*);
    HRESULT get_QueryFile(VARIANT*);
}
enum IID_IWebWizardHost = GUID(0x18bcc359, 0x4990, 0x4bfb, [0xb9, 0x51, 0x3c, 0x83, 0x70, 0x2b, 0xe5, 0xf9]);
interface IWebWizardHost : IDispatch
{
    HRESULT FinalBack();
    HRESULT FinalNext();
    HRESULT Cancel();
    HRESULT put_Caption(BSTR);
    HRESULT get_Caption(BSTR*);
    HRESULT put_Property(BSTR, VARIANT*);
    HRESULT get_Property(BSTR, VARIANT*);
    HRESULT SetWizardButtons(short, short, short);
    HRESULT SetHeaderText(BSTR, BSTR);
}
enum IID_IWebWizardHost2 = GUID(0xf9c013dc, 0x3c23, 0x4041, [0x8e, 0x39, 0xcf, 0xb4, 0x2, 0xf7, 0xea, 0x59]);
interface IWebWizardHost2 : IWebWizardHost
{
    HRESULT SignString(BSTR, BSTR*);
}
enum IID_INewWDEvents = GUID(0x751c551, 0x7568, 0x41c9, [0x8e, 0x5b, 0xe2, 0x2e, 0x38, 0x91, 0x92, 0x36]);
interface INewWDEvents : IWebWizardHost
{
    HRESULT PassportAuthenticate(BSTR, short*);
}
enum IID_IAutoComplete = GUID(0xbb2762, 0x6a77, 0x11d0, [0xa5, 0x35, 0x0, 0xc0, 0x4f, 0xd7, 0xd0, 0x62]);
interface IAutoComplete : IUnknown
{
    HRESULT Init(HWND, IUnknown, const(wchar)*, const(wchar)*);
    HRESULT Enable(BOOL);
}
alias AUTOCOMPLETEOPTIONS = int;
enum : int
{
    ACO_NONE               = 0x00000000,
    ACO_AUTOSUGGEST        = 0x00000001,
    ACO_AUTOAPPEND         = 0x00000002,
    ACO_SEARCH             = 0x00000004,
    ACO_FILTERPREFIXES     = 0x00000008,
    ACO_USETAB             = 0x00000010,
    ACO_UPDOWNKEYDROPSLIST = 0x00000020,
    ACO_RTLREADING         = 0x00000040,
    ACO_WORD_FILTER        = 0x00000080,
    ACO_NOPREFIXFILTERING  = 0x00000100,
}

enum IID_IAutoComplete2 = GUID(0xeac04bc0, 0x3791, 0x11d2, [0xbb, 0x95, 0x0, 0x60, 0x97, 0x7b, 0x46, 0x4c]);
interface IAutoComplete2 : IAutoComplete
{
    HRESULT SetOptions(uint);
    HRESULT GetOptions(uint*);
}
alias ACENUMOPTION = int;
enum : int
{
    ACEO_NONE            = 0x00000000,
    ACEO_MOSTRECENTFIRST = 0x00000001,
    ACEO_FIRSTUNUSED     = 0x00010000,
}

enum IID_IEnumACString = GUID(0x8e74c210, 0xcf9d, 0x4eaf, [0xa4, 0x3, 0x73, 0x56, 0x42, 0x8f, 0xa, 0x5a]);
interface IEnumACString : IEnumString
{
    HRESULT NextItem(PWSTR, uint, uint*);
    HRESULT SetEnumOptions(uint);
    HRESULT GetEnumOptions(uint*);
}
enum IID_IDataObjectAsyncCapability = GUID(0x3d8b0590, 0xf691, 0x11d2, [0x8e, 0xa9, 0x0, 0x60, 0x97, 0xdf, 0x5b, 0xd4]);
interface IDataObjectAsyncCapability : IUnknown
{
    HRESULT SetAsyncMode(BOOL);
    HRESULT GetAsyncMode(BOOL*);
    HRESULT StartOperation(IBindCtx);
    HRESULT InOperation(BOOL*);
    HRESULT EndOperation(HRESULT, IBindCtx, uint);
}
enum IID_IExtractIconA = GUID(0x214eb, 0x0, 0x0, [0xc0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x46]);
interface IExtractIconA : IUnknown
{
    HRESULT GetIconLocation(uint, PSTR, uint, int*, uint*);
    HRESULT Extract(const(char)*, uint, HICON*, HICON*, uint);
}
enum IID_IExtractIconW = GUID(0x214fa, 0x0, 0x0, [0xc0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x46]);
interface IExtractIconW : IUnknown
{
    HRESULT GetIconLocation(uint, PWSTR, uint, int*, uint*);
    HRESULT Extract(const(wchar)*, uint, HICON*, HICON*, uint);
}
enum IID_IShellIconOverlayManager = GUID(0xf10b5e34, 0xdd3b, 0x42a7, [0xaa, 0x7d, 0x2f, 0x4e, 0xc5, 0x4b, 0xb0, 0x9b]);
interface IShellIconOverlayManager : IUnknown
{
    HRESULT GetFileOverlayInfo(const(wchar)*, uint, int*, uint);
    HRESULT GetReservedOverlayInfo(const(wchar)*, uint, int*, uint, int);
    HRESULT RefreshOverlayImages(uint);
    HRESULT LoadNonloadedOverlayIdentifiers();
    HRESULT OverlayIndexFromImageIndex(int, int*, BOOL);
}
enum IID_IShellIconOverlay = GUID(0x7d688a70, 0xc613, 0x11d0, [0x99, 0x9b, 0x0, 0xc0, 0x4f, 0xd6, 0x55, 0xe1]);
interface IShellIconOverlay : IUnknown
{
    HRESULT GetOverlayIndex(ITEMIDLIST*, int*);
    HRESULT GetOverlayIconIndex(ITEMIDLIST*, int*);
}
alias SHELL_LINK_DATA_FLAGS = int;
enum : int
{
    SLDF_DEFAULT                               = 0x00000000,
    SLDF_HAS_ID_LIST                           = 0x00000001,
    SLDF_HAS_LINK_INFO                         = 0x00000002,
    SLDF_HAS_NAME                              = 0x00000004,
    SLDF_HAS_RELPATH                           = 0x00000008,
    SLDF_HAS_WORKINGDIR                        = 0x00000010,
    SLDF_HAS_ARGS                              = 0x00000020,
    SLDF_HAS_ICONLOCATION                      = 0x00000040,
    SLDF_UNICODE                               = 0x00000080,
    SLDF_FORCE_NO_LINKINFO                     = 0x00000100,
    SLDF_HAS_EXP_SZ                            = 0x00000200,
    SLDF_RUN_IN_SEPARATE                       = 0x00000400,
    SLDF_HAS_DARWINID                          = 0x00001000,
    SLDF_RUNAS_USER                            = 0x00002000,
    SLDF_HAS_EXP_ICON_SZ                       = 0x00004000,
    SLDF_NO_PIDL_ALIAS                         = 0x00008000,
    SLDF_FORCE_UNCNAME                         = 0x00010000,
    SLDF_RUN_WITH_SHIMLAYER                    = 0x00020000,
    SLDF_FORCE_NO_LINKTRACK                    = 0x00040000,
    SLDF_ENABLE_TARGET_METADATA                = 0x00080000,
    SLDF_DISABLE_LINK_PATH_TRACKING            = 0x00100000,
    SLDF_DISABLE_KNOWNFOLDER_RELATIVE_TRACKING = 0x00200000,
    SLDF_NO_KF_ALIAS                           = 0x00400000,
    SLDF_ALLOW_LINK_TO_LINK                    = 0x00800000,
    SLDF_UNALIAS_ON_SAVE                       = 0x01000000,
    SLDF_PREFER_ENVIRONMENT_PATH               = 0x02000000,
    SLDF_KEEP_LOCAL_IDLIST_FOR_UNC_TARGET      = 0x04000000,
    SLDF_PERSIST_VOLUME_ID_RELATIVE            = 0x08000000,
    SLDF_VALID                                 = 0x0ffff7ff,
    SLDF_RESERVED                              = 0x80000000,
}

struct DATABLOCK_HEADER
{
    align (1):
    uint cbSize;
    uint dwSignature;
}
struct NT_CONSOLE_PROPS
{
    align (1):
    DATABLOCK_HEADER dbh;
    ushort wFillAttribute;
    ushort wPopupFillAttribute;
    COORD dwScreenBufferSize;
    COORD dwWindowSize;
    COORD dwWindowOrigin;
    uint nFont;
    uint nInputBufferSize;
    COORD dwFontSize;
    uint uFontFamily;
    uint uFontWeight;
    wchar[32] FaceName;
    uint uCursorSize;
    BOOL bFullScreen;
    BOOL bQuickEdit;
    BOOL bInsertMode;
    BOOL bAutoPosition;
    uint uHistoryBufferSize;
    uint uNumberOfHistoryBuffers;
    BOOL bHistoryNoDup;
    COLORREF[16] ColorTable;
}
struct NT_FE_CONSOLE_PROPS
{
    align (1):
    DATABLOCK_HEADER dbh;
    uint uCodePage;
}
struct EXP_DARWIN_LINK
{
    align (1):
    DATABLOCK_HEADER dbh;
    CHAR[260] szDarwinID;
    wchar[260] szwDarwinID;
}
struct EXP_SPECIAL_FOLDER
{
    align (1):
    uint cbSize;
    uint dwSignature;
    uint idSpecialFolder;
    uint cbOffset;
}
struct EXP_SZ_LINK
{
    align (1):
    uint cbSize;
    uint dwSignature;
    CHAR[260] szTarget;
    wchar[260] swzTarget;
}
struct EXP_PROPERTYSTORAGE
{
    align (1):
    uint cbSize;
    uint dwSignature;
    ubyte[1] abPropertyStorage;
}
enum IID_IURLSearchHook = GUID(0xac60f6a0, 0xfd9, 0x11d0, [0x99, 0xcb, 0x0, 0xc0, 0x4f, 0xd6, 0x44, 0x97]);
interface IURLSearchHook : IUnknown
{
    HRESULT Translate(PWSTR, uint);
}
enum IID_ISearchContext = GUID(0x9f656a2, 0x41af, 0x480c, [0x88, 0xf7, 0x16, 0xcc, 0xd, 0x16, 0x46, 0x15]);
interface ISearchContext : IUnknown
{
    HRESULT GetSearchUrl(BSTR*);
    HRESULT GetSearchText(BSTR*);
    HRESULT GetSearchStyle(uint*);
}
enum IID_IURLSearchHook2 = GUID(0x5ee44da4, 0x6d32, 0x46e3, [0x86, 0xbc, 0x7, 0x54, 0xd, 0xed, 0xd0, 0xe0]);
interface IURLSearchHook2 : IURLSearchHook
{
    HRESULT TranslateWithSearchContext(PWSTR, uint, ISearchContext);
}
alias SHGFP_TYPE = int;
enum : int
{
    SHGFP_TYPE_CURRENT = 0x00000000,
    SHGFP_TYPE_DEFAULT = 0x00000001,
}

alias KNOWN_FOLDER_FLAG = int;
enum : int
{
    KF_FLAG_DEFAULT                          = 0x00000000,
    KF_FLAG_FORCE_APP_DATA_REDIRECTION       = 0x00080000,
    KF_FLAG_RETURN_FILTER_REDIRECTION_TARGET = 0x00040000,
    KF_FLAG_FORCE_PACKAGE_REDIRECTION        = 0x00020000,
    KF_FLAG_NO_PACKAGE_REDIRECTION           = 0x00010000,
    KF_FLAG_FORCE_APPCONTAINER_REDIRECTION   = 0x00020000,
    KF_FLAG_NO_APPCONTAINER_REDIRECTION      = 0x00010000,
    KF_FLAG_CREATE                           = 0x00008000,
    KF_FLAG_DONT_VERIFY                      = 0x00004000,
    KF_FLAG_DONT_UNEXPAND                    = 0x00002000,
    KF_FLAG_NO_ALIAS                         = 0x00001000,
    KF_FLAG_INIT                             = 0x00000800,
    KF_FLAG_DEFAULT_PATH                     = 0x00000400,
    KF_FLAG_NOT_PARENT_RELATIVE              = 0x00000200,
    KF_FLAG_SIMPLE_IDLIST                    = 0x00000100,
    KF_FLAG_ALIAS_ONLY                       = 0x80000000,
}

struct SHFOLDERCUSTOMSETTINGS
{
    uint dwSize;
    uint dwMask;
    GUID* pvid;
    PWSTR pszWebViewTemplate;
    uint cchWebViewTemplate;
    PWSTR pszWebViewTemplateVersion;
    PWSTR pszInfoTip;
    uint cchInfoTip;
    GUID* pclsid;
    uint dwFlags;
    PWSTR pszIconFile;
    uint cchIconFile;
    int iIconIndex;
    PWSTR pszLogo;
    uint cchLogo;
}
alias BFFCALLBACK = int function(HWND, uint, LPARAM, LPARAM);
struct BROWSEINFOA
{
    HWND hwndOwner;
    ITEMIDLIST* pidlRoot;
    PSTR pszDisplayName;
    const(char)* lpszTitle;
    uint ulFlags;
    BFFCALLBACK lpfn;
    LPARAM lParam;
    int iImage;
}
struct BROWSEINFOW
{
    HWND hwndOwner;
    ITEMIDLIST* pidlRoot;
    PWSTR pszDisplayName;
    const(wchar)* lpszTitle;
    uint ulFlags;
    BFFCALLBACK lpfn;
    LPARAM lParam;
    int iImage;
}
enum IID_IShellDetails = GUID(0x214ec, 0x0, 0x0, [0xc0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x46]);
interface IShellDetails : IUnknown
{
    HRESULT GetDetailsOf(ITEMIDLIST*, uint, SHELLDETAILS*);
    HRESULT ColumnClick(uint);
}
enum IID_IObjMgr = GUID(0xbb2761, 0x6a77, 0x11d0, [0xa5, 0x35, 0x0, 0xc0, 0x4f, 0xd7, 0xd0, 0x62]);
interface IObjMgr : IUnknown
{
    HRESULT Append(IUnknown);
    HRESULT Remove(IUnknown);
}
enum IID_IACList = GUID(0x77a130b0, 0x94fd, 0x11d0, [0xa5, 0x44, 0x0, 0xc0, 0x4f, 0xd7, 0xd0, 0x62]);
interface IACList : IUnknown
{
    HRESULT Expand(const(wchar)*);
}
alias AUTOCOMPLETELISTOPTIONS = int;
enum : int
{
    ACLO_NONE             = 0x00000000,
    ACLO_CURRENTDIR       = 0x00000001,
    ACLO_MYCOMPUTER       = 0x00000002,
    ACLO_DESKTOP          = 0x00000004,
    ACLO_FAVORITES        = 0x00000008,
    ACLO_FILESYSONLY      = 0x00000010,
    ACLO_FILESYSDIRS      = 0x00000020,
    ACLO_VIRTUALNAMESPACE = 0x00000040,
}

enum IID_IACList2 = GUID(0x470141a0, 0x5186, 0x11d2, [0xbb, 0xb6, 0x0, 0x60, 0x97, 0x7b, 0x46, 0x4c]);
interface IACList2 : IACList
{
    HRESULT SetOptions(uint);
    HRESULT GetOptions(uint*);
}
enum IID_IProgressDialog = GUID(0xebbc7c04, 0x315e, 0x11d2, [0xb6, 0x2f, 0x0, 0x60, 0x97, 0xdf, 0x5b, 0xd4]);
interface IProgressDialog : IUnknown
{
    HRESULT StartProgressDialog(HWND, IUnknown, uint, const(void)*);
    HRESULT StopProgressDialog();
    HRESULT SetTitle(const(wchar)*);
    HRESULT SetAnimation(HINSTANCE, uint);
    BOOL HasUserCancelled();
    HRESULT SetProgress(uint, uint);
    HRESULT SetProgress64(ulong, ulong);
    HRESULT SetLine(uint, const(wchar)*, BOOL, const(void)*);
    HRESULT SetCancelMsg(const(wchar)*, const(void)*);
    HRESULT Timer(uint, const(void)*);
}
enum IID_IDockingWindowSite = GUID(0x2a342fc2, 0x7b26, 0x11d0, [0x8c, 0xa9, 0x0, 0xa0, 0xc9, 0x2d, 0xbf, 0xe8]);
interface IDockingWindowSite : IOleWindow
{
    HRESULT GetBorderDW(IUnknown, RECT*);
    HRESULT RequestBorderSpaceDW(IUnknown, RECT*);
    HRESULT SetBorderSpaceDW(IUnknown, RECT*);
}
struct NRESARRAY
{
    uint cItems;
    NETRESOURCEA[1] nr;
}
struct CIDA
{
    align (1):
    uint cidl;
    uint[1] aoffset;
}
alias FD_FLAGS = int;
enum : int
{
    FD_CLSID      = 0x00000001,
    FD_SIZEPOINT  = 0x00000002,
    FD_ATTRIBUTES = 0x00000004,
    FD_CREATETIME = 0x00000008,
    FD_ACCESSTIME = 0x00000010,
    FD_WRITESTIME = 0x00000020,
    FD_FILESIZE   = 0x00000040,
    FD_PROGRESSUI = 0x00004000,
    FD_LINKUI     = 0x00008000,
    FD_UNICODE    = 0x80000000,
}

struct FILEDESCRIPTORA
{
    align (1):
    uint dwFlags;
    GUID clsid;
    SIZE sizel;
    POINTL pointl;
    uint dwFileAttributes;
    FILETIME ftCreationTime;
    FILETIME ftLastAccessTime;
    FILETIME ftLastWriteTime;
    uint nFileSizeHigh;
    uint nFileSizeLow;
    CHAR[260] cFileName;
}
struct FILEDESCRIPTORW
{
    align (1):
    uint dwFlags;
    GUID clsid;
    SIZE sizel;
    POINTL pointl;
    uint dwFileAttributes;
    FILETIME ftCreationTime;
    FILETIME ftLastAccessTime;
    FILETIME ftLastWriteTime;
    uint nFileSizeHigh;
    uint nFileSizeLow;
    wchar[260] cFileName;
}
struct FILEGROUPDESCRIPTORA
{
    align (1):
    uint cItems;
    FILEDESCRIPTORA[1] fgd;
}
struct FILEGROUPDESCRIPTORW
{
    align (1):
    uint cItems;
    FILEDESCRIPTORW[1] fgd;
}
struct DROPFILES
{
    align (1):
    uint pFiles;
    POINT pt;
    BOOL fNC;
    BOOL fWide;
}
struct FILE_ATTRIBUTES_ARRAY
{
    align (1):
    uint cItems;
    uint dwSumFileAttributes;
    uint dwProductFileAttributes;
    uint[1] rgdwFileAttributes;
}
alias DROPIMAGETYPE = int;
enum : int
{
    DROPIMAGE_INVALID = 0xffffffff,
    DROPIMAGE_NONE    = 0x00000000,
    DROPIMAGE_COPY    = 0x00000001,
    DROPIMAGE_MOVE    = 0x00000002,
    DROPIMAGE_LINK    = 0x00000004,
    DROPIMAGE_LABEL   = 0x00000006,
    DROPIMAGE_WARNING = 0x00000007,
    DROPIMAGE_NOIMAGE = 0x00000008,
}

struct DROPDESCRIPTION
{
    align (1):
    DROPIMAGETYPE type;
    wchar[260] szMessage;
    wchar[260] szInsert;
}
struct SHChangeNotifyEntry
{
    align (1):
    ITEMIDLIST* pidl;
    BOOL fRecursive;
}
enum IID_IShellChangeNotify = GUID(0xd82be2b1, 0x5764, 0x11d0, [0xa9, 0x6e, 0x0, 0xc0, 0x4f, 0xd7, 0x5, 0xa2]);
interface IShellChangeNotify : IUnknown
{
    HRESULT OnChange(int, ITEMIDLIST*, ITEMIDLIST*);
}
enum IID_IQueryInfo = GUID(0x21500, 0x0, 0x0, [0xc0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x46]);
interface IQueryInfo : IUnknown
{
    HRESULT GetInfoTip(QITIPF_FLAGS, PWSTR*);
    HRESULT GetInfoFlags(uint*);
}
alias SHARD = int;
enum : int
{
    SHARD_PIDL            = 0x00000001,
    SHARD_PATHA           = 0x00000002,
    SHARD_PATHW           = 0x00000003,
    SHARD_APPIDINFO       = 0x00000004,
    SHARD_APPIDINFOIDLIST = 0x00000005,
    SHARD_LINK            = 0x00000006,
    SHARD_APPIDINFOLINK   = 0x00000007,
    SHARD_SHELLITEM       = 0x00000008,
}

struct SHARDAPPIDINFO
{
    align (1):
    IShellItem psi;
    const(wchar)* pszAppID;
}
struct SHARDAPPIDINFOIDLIST
{
    align (1):
    ITEMIDLIST* pidl;
    const(wchar)* pszAppID;
}
struct SHARDAPPIDINFOLINK
{
    align (1):
    IShellLinkA psl;
    const(wchar)* pszAppID;
}
struct SHChangeDWORDAsIDList
{
    align (1):
    ushort cb;
    uint dwItem1;
    uint dwItem2;
    ushort cbZero;
}
struct SHChangeUpdateImageIDList
{
    align (1):
    ushort cb;
    int iIconIndex;
    int iCurIndex;
    uint uFlags;
    uint dwProcessID;
    wchar[260] szName;
    ushort cbZero;
}
alias SCNRT_STATUS = int;
enum : int
{
    SCNRT_ENABLE  = 0x00000000,
    SCNRT_DISABLE = 0x00000001,
}

struct SHDESCRIPTIONID
{
    SHDID_ID dwDescriptionId;
    GUID clsid;
}
struct AUTO_SCROLL_DATA
{
    align (1):
    int iNextSample;
    uint dwLastScroll;
    BOOL bFull;
    POINT[3] pts;
    uint[3] dwTimes;
}
struct CABINETSTATE
{
    align (1):
    ushort cLength;
    ushort nVersion;
    int _bitfield0;
    uint fMenuEnumFilter;
}
alias RESTRICTIONS = int;
enum : int
{
    REST_NONE                       = 0x00000000,
    REST_NORUN                      = 0x00000001,
    REST_NOCLOSE                    = 0x00000002,
    REST_NOSAVESET                  = 0x00000004,
    REST_NOFILEMENU                 = 0x00000008,
    REST_NOSETFOLDERS               = 0x00000010,
    REST_NOSETTASKBAR               = 0x00000020,
    REST_NODESKTOP                  = 0x00000040,
    REST_NOFIND                     = 0x00000080,
    REST_NODRIVES                   = 0x00000100,
    REST_NODRIVEAUTORUN             = 0x00000200,
    REST_NODRIVETYPEAUTORUN         = 0x00000400,
    REST_NONETHOOD                  = 0x00000800,
    REST_STARTBANNER                = 0x00001000,
    REST_RESTRICTRUN                = 0x00002000,
    REST_NOPRINTERTABS              = 0x00004000,
    REST_NOPRINTERDELETE            = 0x00008000,
    REST_NOPRINTERADD               = 0x00010000,
    REST_NOSTARTMENUSUBFOLDERS      = 0x00020000,
    REST_MYDOCSONNET                = 0x00040000,
    REST_NOEXITTODOS                = 0x00080000,
    REST_ENFORCESHELLEXTSECURITY    = 0x00100000,
    REST_LINKRESOLVEIGNORELINKINFO  = 0x00200000,
    REST_NOCOMMONGROUPS             = 0x00400000,
    REST_SEPARATEDESKTOPPROCESS     = 0x00800000,
    REST_NOWEB                      = 0x01000000,
    REST_NOTRAYCONTEXTMENU          = 0x02000000,
    REST_NOVIEWCONTEXTMENU          = 0x04000000,
    REST_NONETCONNECTDISCONNECT     = 0x08000000,
    REST_STARTMENULOGOFF            = 0x10000000,
    REST_NOSETTINGSASSIST           = 0x20000000,
    REST_NOINTERNETICON             = 0x40000001,
    REST_NORECENTDOCSHISTORY        = 0x40000002,
    REST_NORECENTDOCSMENU           = 0x40000003,
    REST_NOACTIVEDESKTOP            = 0x40000004,
    REST_NOACTIVEDESKTOPCHANGES     = 0x40000005,
    REST_NOFAVORITESMENU            = 0x40000006,
    REST_CLEARRECENTDOCSONEXIT      = 0x40000007,
    REST_CLASSICSHELL               = 0x40000008,
    REST_NOCUSTOMIZEWEBVIEW         = 0x40000009,
    REST_NOHTMLWALLPAPER            = 0x40000010,
    REST_NOCHANGINGWALLPAPER        = 0x40000011,
    REST_NODESKCOMP                 = 0x40000012,
    REST_NOADDDESKCOMP              = 0x40000013,
    REST_NODELDESKCOMP              = 0x40000014,
    REST_NOCLOSEDESKCOMP            = 0x40000015,
    REST_NOCLOSE_DRAGDROPBAND       = 0x40000016,
    REST_NOMOVINGBAND               = 0x40000017,
    REST_NOEDITDESKCOMP             = 0x40000018,
    REST_NORESOLVESEARCH            = 0x40000019,
    REST_NORESOLVETRACK             = 0x4000001a,
    REST_FORCECOPYACLWITHFILE       = 0x4000001b,
    REST_NOFORGETSOFTWAREUPDATE     = 0x4000001d,
    REST_NOSETACTIVEDESKTOP         = 0x4000001e,
    REST_NOUPDATEWINDOWS            = 0x4000001f,
    REST_NOCHANGESTARMENU           = 0x40000020,
    REST_NOFOLDEROPTIONS            = 0x40000021,
    REST_HASFINDCOMPUTERS           = 0x40000022,
    REST_INTELLIMENUS               = 0x40000023,
    REST_RUNDLGMEMCHECKBOX          = 0x40000024,
    REST_ARP_ShowPostSetup          = 0x40000025,
    REST_NOCSC                      = 0x40000026,
    REST_NOCONTROLPANEL             = 0x40000027,
    REST_ENUMWORKGROUP              = 0x40000028,
    REST_ARP_NOARP                  = 0x40000029,
    REST_ARP_NOREMOVEPAGE           = 0x4000002a,
    REST_ARP_NOADDPAGE              = 0x4000002b,
    REST_ARP_NOWINSETUPPAGE         = 0x4000002c,
    REST_GREYMSIADS                 = 0x4000002d,
    REST_NOCHANGEMAPPEDDRIVELABEL   = 0x4000002e,
    REST_NOCHANGEMAPPEDDRIVECOMMENT = 0x4000002f,
    REST_MaxRecentDocs              = 0x40000030,
    REST_NONETWORKCONNECTIONS       = 0x40000031,
    REST_FORCESTARTMENULOGOFF       = 0x40000032,
    REST_NOWEBVIEW                  = 0x40000033,
    REST_NOCUSTOMIZETHISFOLDER      = 0x40000034,
    REST_NOENCRYPTION               = 0x40000035,
    REST_DONTSHOWSUPERHIDDEN        = 0x40000037,
    REST_NOSHELLSEARCHBUTTON        = 0x40000038,
    REST_NOHARDWARETAB              = 0x40000039,
    REST_NORUNASINSTALLPROMPT       = 0x4000003a,
    REST_PROMPTRUNASINSTALLNETPATH  = 0x4000003b,
    REST_NOMANAGEMYCOMPUTERVERB     = 0x4000003c,
    REST_DISALLOWRUN                = 0x4000003e,
    REST_NOWELCOMESCREEN            = 0x4000003f,
    REST_RESTRICTCPL                = 0x40000040,
    REST_DISALLOWCPL                = 0x40000041,
    REST_NOSMBALLOONTIP             = 0x40000042,
    REST_NOSMHELP                   = 0x40000043,
    REST_NOWINKEYS                  = 0x40000044,
    REST_NOENCRYPTONMOVE            = 0x40000045,
    REST_NOLOCALMACHINERUN          = 0x40000046,
    REST_NOCURRENTUSERRUN           = 0x40000047,
    REST_NOLOCALMACHINERUNONCE      = 0x40000048,
    REST_NOCURRENTUSERRUNONCE       = 0x40000049,
    REST_FORCEACTIVEDESKTOPON       = 0x4000004a,
    REST_NOVIEWONDRIVE              = 0x4000004c,
    REST_NONETCRAWL                 = 0x4000004d,
    REST_NOSHAREDDOCUMENTS          = 0x4000004e,
    REST_NOSMMYDOCS                 = 0x4000004f,
    REST_NOSMMYPICS                 = 0x40000050,
    REST_ALLOWBITBUCKDRIVES         = 0x40000051,
    REST_NONLEGACYSHELLMODE         = 0x40000052,
    REST_NOCONTROLPANELBARRICADE    = 0x40000053,
    REST_NOSTARTPAGE                = 0x40000054,
    REST_NOAUTOTRAYNOTIFY           = 0x40000055,
    REST_NOTASKGROUPING             = 0x40000056,
    REST_NOCDBURNING                = 0x40000057,
    REST_MYCOMPNOPROP               = 0x40000058,
    REST_MYDOCSNOPROP               = 0x40000059,
    REST_NOSTARTPANEL               = 0x4000005a,
    REST_NODISPLAYAPPEARANCEPAGE    = 0x4000005b,
    REST_NOTHEMESTAB                = 0x4000005c,
    REST_NOVISUALSTYLECHOICE        = 0x4000005d,
    REST_NOSIZECHOICE               = 0x4000005e,
    REST_NOCOLORCHOICE              = 0x4000005f,
    REST_SETVISUALSTYLE             = 0x40000060,
    REST_STARTRUNNOHOMEPATH         = 0x40000061,
    REST_NOUSERNAMEINSTARTPANEL     = 0x40000062,
    REST_NOMYCOMPUTERICON           = 0x40000063,
    REST_NOSMNETWORKPLACES          = 0x40000064,
    REST_NOSMPINNEDLIST             = 0x40000065,
    REST_NOSMMYMUSIC                = 0x40000066,
    REST_NOSMEJECTPC                = 0x40000067,
    REST_NOSMMOREPROGRAMS           = 0x40000068,
    REST_NOSMMFUPROGRAMS            = 0x40000069,
    REST_NOTRAYITEMSDISPLAY         = 0x4000006a,
    REST_NOTOOLBARSONTASKBAR        = 0x4000006b,
    REST_NOSMCONFIGUREPROGRAMS      = 0x4000006f,
    REST_HIDECLOCK                  = 0x40000070,
    REST_NOLOWDISKSPACECHECKS       = 0x40000071,
    REST_NOENTIRENETWORK            = 0x40000072,
    REST_NODESKTOPCLEANUP           = 0x40000073,
    REST_BITBUCKNUKEONDELETE        = 0x40000074,
    REST_BITBUCKCONFIRMDELETE       = 0x40000075,
    REST_BITBUCKNOPROP              = 0x40000076,
    REST_NODISPBACKGROUND           = 0x40000077,
    REST_NODISPSCREENSAVEPG         = 0x40000078,
    REST_NODISPSETTINGSPG           = 0x40000079,
    REST_NODISPSCREENSAVEPREVIEW    = 0x4000007a,
    REST_NODISPLAYCPL               = 0x4000007b,
    REST_HIDERUNASVERB              = 0x4000007c,
    REST_NOTHUMBNAILCACHE           = 0x4000007d,
    REST_NOSTRCMPLOGICAL            = 0x4000007e,
    REST_NOPUBLISHWIZARD            = 0x4000007f,
    REST_NOONLINEPRINTSWIZARD       = 0x40000080,
    REST_NOWEBSERVICES              = 0x40000081,
    REST_ALLOWUNHASHEDWEBVIEW       = 0x40000082,
    REST_ALLOWLEGACYWEBVIEW         = 0x40000083,
    REST_REVERTWEBVIEWSECURITY      = 0x40000084,
    REST_INHERITCONSOLEHANDLES      = 0x40000086,
    REST_NOREMOTERECURSIVEEVENTS    = 0x40000089,
    REST_NOREMOTECHANGENOTIFY       = 0x40000091,
    REST_NOENUMENTIRENETWORK        = 0x40000093,
    REST_NOINTERNETOPENWITH         = 0x40000095,
    REST_DONTRETRYBADNETNAME        = 0x4000009b,
    REST_ALLOWFILECLSIDJUNCTIONS    = 0x4000009c,
    REST_NOUPNPINSTALL              = 0x4000009d,
    REST_ARP_DONTGROUPPATCHES       = 0x400000ac,
    REST_ARP_NOCHOOSEPROGRAMSPAGE   = 0x400000ad,
    REST_NODISCONNECT               = 0x41000001,
    REST_NOSECURITY                 = 0x41000002,
    REST_NOFILEASSOCIATE            = 0x41000003,
    REST_ALLOWCOMMENTTOGGLE         = 0x41000004,
}

alias OPEN_AS_INFO_FLAGS = uint;
enum : uint
{
    OAIF_ALLOW_REGISTRATION = 0x00000001,
    OAIF_REGISTER_EXT       = 0x00000002,
    OAIF_EXEC               = 0x00000004,
    OAIF_FORCE_REGISTRATION = 0x00000008,
    OAIF_HIDE_REGISTRATION  = 0x00000020,
    OAIF_URL_PROTOCOL       = 0x00000040,
    OAIF_FILE_IS_URI        = 0x00000080,
}

struct OPENASINFO
{
    const(wchar)* pcszFile;
    const(wchar)* pcszClass;
    OPEN_AS_INFO_FLAGS oaifInFlags;
}
enum IID_IShellFolderViewCB = GUID(0x2047e320, 0xf2a9, 0x11ce, [0xae, 0x65, 0x8, 0x0, 0x2b, 0x2e, 0x12, 0x62]);
interface IShellFolderViewCB : IUnknown
{
    HRESULT MessageSFVCB(SFVM_MESSAGE_ID, WPARAM, LPARAM);
}
struct QCMINFO_IDMAP_PLACEMENT
{
    uint id;
    uint fFlags;
}
struct QCMINFO_IDMAP
{
    uint nMaxIds;
    QCMINFO_IDMAP_PLACEMENT[1] pIdList;
}
struct QCMINFO
{
    HMENU hmenu;
    uint indexMenu;
    uint idCmdFirst;
    uint idCmdLast;
    const(QCMINFO_IDMAP)* pIdMap;
}
struct DETAILSINFO
{
    ITEMIDLIST* pidl;
    int fmt;
    int cxChar;
    STRRET str;
    int iImage;
}
struct SFVM_PROPPAGE_DATA
{
    uint dwReserved;
    LPFNSVADDPROPSHEETPAGE pfn;
    LPARAM lParam;
}
struct SFVM_HELPTOPIC_DATA
{
    wchar[260] wszHelpFile;
    wchar[260] wszHelpTopic;
}
struct ITEMSPACING
{
    int cxSmall;
    int cySmall;
    int cxLarge;
    int cyLarge;
}
enum IID_IShellFolderView = GUID(0x37a378c0, 0xf82d, 0x11ce, [0xae, 0x65, 0x8, 0x0, 0x2b, 0x2e, 0x12, 0x62]);
interface IShellFolderView : IUnknown
{
    HRESULT Rearrange(LPARAM);
    HRESULT GetArrangeParam(LPARAM*);
    HRESULT ArrangeGrid();
    HRESULT AutoArrange();
    HRESULT GetAutoArrange();
    HRESULT AddObject(ITEMIDLIST*, uint*);
    HRESULT GetObject(ITEMIDLIST**, uint);
    HRESULT RemoveObject(ITEMIDLIST*, uint*);
    HRESULT GetObjectCount(uint*);
    HRESULT SetObjectCount(uint, uint);
    HRESULT UpdateObject(ITEMIDLIST*, ITEMIDLIST*, uint*);
    HRESULT RefreshObject(ITEMIDLIST*, uint*);
    HRESULT SetRedraw(BOOL);
    HRESULT GetSelectedCount(uint*);
    HRESULT GetSelectedObjects(ITEMIDLIST***, uint*);
    HRESULT IsDropOnSource(IDropTarget);
    HRESULT GetDragPoint(POINT*);
    HRESULT GetDropPoint(POINT*);
    HRESULT MoveIcons(IDataObject);
    HRESULT SetItemPos(ITEMIDLIST*, POINT*);
    HRESULT IsBkDropTarget(IDropTarget);
    HRESULT SetClipboard(BOOL);
    HRESULT SetPoints(IDataObject);
    HRESULT GetItemSpacing(ITEMSPACING*);
    HRESULT SetCallback(IShellFolderViewCB, IShellFolderViewCB*);
    HRESULT Select(SFVS_SELECT);
    HRESULT QuerySupport(uint*);
    HRESULT SetAutomationObject(IDispatch);
}
struct SFV_CREATE
{
    uint cbSize;
    IShellFolder pshf;
    IShellView psvOuter;
    IShellFolderViewCB psfvcb;
}
alias LPFNDFMCALLBACK = HRESULT function(IShellFolder, HWND, IDataObject, uint, WPARAM, LPARAM);
struct DEFCONTEXTMENU
{
    HWND hwnd;
    IContextMenuCB pcmcb;
    ITEMIDLIST* pidlFolder;
    IShellFolder psf;
    uint cidl;
    ITEMIDLIST** apidl;
    IUnknown punkAssociationInfo;
    uint cKeys;
    const(HKEY)* aKeys;
}
struct DFMICS
{
    uint cbSize;
    uint fMask;
    LPARAM lParam;
    uint idCmdFirst;
    uint idDefMax;
    CMINVOKECOMMANDINFO* pici;
    IUnknown punkSite;
}
alias LPFNVIEWCALLBACK = HRESULT function(IShellView, IShellFolder, HWND, uint, WPARAM, LPARAM);
struct CSFV
{
    uint cbSize;
    IShellFolder pshf;
    IShellView psvOuter;
    ITEMIDLIST* pidl;
    int lEvents;
    LPFNVIEWCALLBACK pfnCallback;
    FOLDERVIEWMODE fvm;
}
struct SHELLSTATEA
{
    align (1):
    int _bitfield1;
    uint dwWin95Unused;
    uint uWin95Unused;
    int lParamSort;
    int iSortDirection;
    uint version_;
    uint uNotUsed;
    int _bitfield2;
}
struct SHELLSTATEW
{
    align (1):
    int _bitfield1;
    uint dwWin95Unused;
    uint uWin95Unused;
    int lParamSort;
    int iSortDirection;
    uint version_;
    uint uNotUsed;
    int _bitfield2;
}
struct SHELLFLAGSTATE
{
    align (1):
    int _bitfield0;
}
enum IID_INamedPropertyBag = GUID(0xfb700430, 0x952c, 0x11d1, [0x94, 0x6f, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0]);
interface INamedPropertyBag : IUnknown
{
    HRESULT ReadPropertyNPB(const(wchar)*, const(wchar)*, PROPVARIANT*);
    HRESULT WritePropertyNPB(const(wchar)*, const(wchar)*, PROPVARIANT*);
    HRESULT RemovePropertyNPB(const(wchar)*, const(wchar)*);
}
alias IESHORTCUTFLAGS = int;
enum : int
{
    IESHORTCUT_NEWBROWSER    = 0x00000001,
    IESHORTCUT_OPENNEWTAB    = 0x00000002,
    IESHORTCUT_FORCENAVIGATE = 0x00000004,
    IESHORTCUT_BACKGROUNDTAB = 0x00000008,
}

enum IID_INewShortcutHookA = GUID(0x214e1, 0x0, 0x0, [0xc0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x46]);
interface INewShortcutHookA : IUnknown
{
    HRESULT SetReferent(const(char)*, HWND);
    HRESULT GetReferent(PSTR, int);
    HRESULT SetFolder(const(char)*);
    HRESULT GetFolder(PSTR, int);
    HRESULT GetName(PSTR, int);
    HRESULT GetExtension(PSTR, int);
}
enum IID_INewShortcutHookW = GUID(0x214f7, 0x0, 0x0, [0xc0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x46]);
interface INewShortcutHookW : IUnknown
{
    HRESULT SetReferent(const(wchar)*, HWND);
    HRESULT GetReferent(PWSTR, int);
    HRESULT SetFolder(const(wchar)*);
    HRESULT GetFolder(PWSTR, int);
    HRESULT GetName(PWSTR, int);
    HRESULT GetExtension(PWSTR, int);
}
enum IID_ICopyHookA = GUID(0x214ef, 0x0, 0x0, [0xc0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x46]);
interface ICopyHookA : IUnknown
{
    uint CopyCallback(HWND, uint, uint, const(char)*, uint, const(char)*, uint);
}
enum IID_ICopyHookW = GUID(0x214fc, 0x0, 0x0, [0xc0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x46]);
interface ICopyHookW : IUnknown
{
    uint CopyCallback(HWND, uint, uint, const(wchar)*, uint, const(wchar)*, uint);
}
enum IID_ICurrentWorkingDirectory = GUID(0x91956d21, 0x9276, 0x11d1, [0x92, 0x1a, 0x0, 0x60, 0x97, 0xdf, 0x5b, 0xd4]);
interface ICurrentWorkingDirectory : IUnknown
{
    HRESULT GetDirectory(PWSTR, uint);
    HRESULT SetDirectory(const(wchar)*);
}
enum IID_IDockingWindowFrame = GUID(0x47d2657a, 0x7b27, 0x11d0, [0x8c, 0xa9, 0x0, 0xa0, 0xc9, 0x2d, 0xbf, 0xe8]);
interface IDockingWindowFrame : IOleWindow
{
    HRESULT AddToolbar(IUnknown, const(wchar)*, uint);
    HRESULT RemoveToolbar(IUnknown, uint);
    HRESULT FindToolbar(const(wchar)*, const(GUID)*, void**);
}
enum IID_IThumbnailCapture = GUID(0x4ea39266, 0x7211, 0x409f, [0xb6, 0x22, 0xf6, 0x3d, 0xbd, 0x16, 0xc5, 0x33]);
interface IThumbnailCapture : IUnknown
{
    HRESULT CaptureThumbnail(const(SIZE)*, IUnknown, HBITMAP*);
}
struct BANDINFOSFB
{
    uint dwMask;
    uint dwStateMask;
    uint dwState;
    COLORREF crBkgnd;
    COLORREF crBtnLt;
    COLORREF crBtnDk;
    ushort wViewMode;
    ushort wAlign;
    IShellFolder psf;
    ITEMIDLIST* pidl;
}
enum IID_IShellFolderBand = GUID(0x7fe80cc8, 0xc247, 0x11d0, [0xb9, 0x3a, 0x0, 0xa0, 0xc9, 0x3, 0x12, 0xe1]);
interface IShellFolderBand : IUnknown
{
    HRESULT InitializeSFB(IShellFolder, ITEMIDLIST*);
    HRESULT SetBandInfoSFB(BANDINFOSFB*);
    HRESULT GetBandInfoSFB(BANDINFOSFB*);
}
enum IID_IDeskBarClient = GUID(0xeb0fe175, 0x1a3a, 0x11d0, [0x89, 0xb3, 0x0, 0xa0, 0xc9, 0xa, 0x90, 0xac]);
interface IDeskBarClient : IOleWindow
{
    HRESULT SetDeskBarSite(IUnknown);
    HRESULT SetModeDBC(uint);
    HRESULT UIActivateDBC(uint);
    HRESULT GetSize(uint, RECT*);
}
struct SHCOLUMNINFO
{
    align (1):
    PROPERTYKEY scid;
    VARENUM vt;
    uint fmt;
    uint cChars;
    uint csFlags;
    wchar[80] wszTitle;
    wchar[128] wszDescription;
}
struct SHCOLUMNINIT
{
    uint dwFlags;
    uint dwReserved;
    wchar[260] wszFolder;
}
struct SHCOLUMNDATA
{
    uint dwFlags;
    uint dwFileAttributes;
    uint dwReserved;
    PWSTR pwszExt;
    wchar[260] wszFile;
}
enum IID_IColumnProvider = GUID(0xe8025004, 0x1c42, 0x11d2, [0xbe, 0x2c, 0x0, 0xa0, 0xc9, 0xa8, 0x3d, 0xa1]);
interface IColumnProvider : IUnknown
{
    HRESULT Initialize(SHCOLUMNINIT*);
    HRESULT GetColumnInfo(uint, SHCOLUMNINFO*);
    HRESULT GetItemData(PROPERTYKEY*, SHCOLUMNDATA*, VARIANT*);
}
struct SHChangeProductKeyAsIDList
{
    align (1):
    ushort cb;
    wchar[39] wszProductKey;
    ushort cbZero;
}
enum IID_IDocViewSite = GUID(0x87d605e0, 0xc511, 0x11cf, [0x89, 0xa9, 0x0, 0xa0, 0xc9, 0x5, 0x41, 0x29]);
interface IDocViewSite : IUnknown
{
    HRESULT OnSetTitle(VARIANT*);
}
enum IID_IInitializeObject = GUID(0x4622ad16, 0xff23, 0x11d0, [0x8d, 0x34, 0x0, 0xa0, 0xc9, 0xf, 0x27, 0x19]);
interface IInitializeObject : IUnknown
{
    HRESULT Initialize();
}
enum IID_IBanneredBar = GUID(0x596a9a94, 0x13e, 0x11d1, [0x8d, 0x34, 0x0, 0xa0, 0xc9, 0xf, 0x27, 0x19]);
interface IBanneredBar : IUnknown
{
    HRESULT SetIconSize(uint);
    HRESULT GetIconSize(uint*);
    HRESULT SetBitmap(HBITMAP);
    HRESULT GetBitmap(HBITMAP*);
}
struct TBINFO
{
    uint cbuttons;
    uint uFlags;
}
struct SFV_SETITEMPOS
{
    ITEMIDLIST* pidl;
    POINT pt;
}
struct AASHELLMENUFILENAME
{
    short cbTotal;
    ubyte[12] rgbReserved;
    wchar[1] szFileName;
}
struct AASHELLMENUITEM
{
    void* lpReserved1;
    int iReserved;
    uint uiReserved;
    AASHELLMENUFILENAME* lpName;
    PWSTR psz;
}
alias DISPLAY_DEVICE_TYPE = int;
enum : int
{
    DEVICE_PRIMARY   = 0x00000000,
    DEVICE_IMMERSIVE = 0x00000001,
}

alias SCALE_CHANGE_FLAGS = uint;
enum : uint
{
    SCF_VALUE_NONE = 0x00000000,
    SCF_SCALE      = 0x00000001,
    SCF_PHYSICAL   = 0x00000002,
}

alias SHELL_UI_COMPONENT = int;
enum : int
{
    SHELL_UI_COMPONENT_TASKBARS         = 0x00000000,
    SHELL_UI_COMPONENT_NOTIFICATIONAREA = 0x00000001,
    SHELL_UI_COMPONENT_DESKBAND         = 0x00000002,
}

struct DRAGINFOA
{
    uint uSize;
    POINT pt;
    BOOL fNC;
    PSTR lpFileList;
    uint grfKeyState;
}
struct DRAGINFOW
{
    uint uSize;
    POINT pt;
    BOOL fNC;
    PWSTR lpFileList;
    uint grfKeyState;
}
struct APPBARDATA
{
    uint cbSize;
    HWND hWnd;
    uint uCallbackMessage;
    uint uEdge;
    RECT rc;
    LPARAM lParam;
}
struct SHFILEOPSTRUCTA
{
    HWND hwnd;
    uint wFunc;
    byte* pFrom;
    byte* pTo;
    ushort fFlags;
    BOOL fAnyOperationsAborted;
    void* hNameMappings;
    const(char)* lpszProgressTitle;
}
struct SHFILEOPSTRUCTW
{
    HWND hwnd;
    uint wFunc;
    const(wchar)* pFrom;
    const(wchar)* pTo;
    ushort fFlags;
    BOOL fAnyOperationsAborted;
    void* hNameMappings;
    const(wchar)* lpszProgressTitle;
}
struct SHNAMEMAPPINGA
{
    PSTR pszOldPath;
    PSTR pszNewPath;
    int cchOldPath;
    int cchNewPath;
}
struct SHNAMEMAPPINGW
{
    PWSTR pszOldPath;
    PWSTR pszNewPath;
    int cchOldPath;
    int cchNewPath;
}
struct SHELLEXECUTEINFOA
{
    uint cbSize;
    uint fMask;
    HWND hwnd;
    const(char)* lpVerb;
    const(char)* lpFile;
    const(char)* lpParameters;
    const(char)* lpDirectory;
    int nShow;
    HINSTANCE hInstApp;
    void* lpIDList;
    const(char)* lpClass;
    HKEY hkeyClass;
    uint dwHotKey;
    union
    {
        HANDLE hIcon;
        HANDLE hMonitor;
    }
    HANDLE hProcess;
}
struct SHELLEXECUTEINFOW
{
    uint cbSize;
    uint fMask;
    HWND hwnd;
    const(wchar)* lpVerb;
    const(wchar)* lpFile;
    const(wchar)* lpParameters;
    const(wchar)* lpDirectory;
    int nShow;
    HINSTANCE hInstApp;
    void* lpIDList;
    const(wchar)* lpClass;
    HKEY hkeyClass;
    uint dwHotKey;
    union
    {
        HANDLE hIcon;
        HANDLE hMonitor;
    }
    HANDLE hProcess;
}
struct SHCREATEPROCESSINFOW
{
    uint cbSize;
    uint fMask;
    HWND hwnd;
    const(wchar)* pszFile;
    const(wchar)* pszParameters;
    const(wchar)* pszCurrentDirectory;
    HANDLE hUserToken;
    SECURITY_ATTRIBUTES* lpProcessAttributes;
    SECURITY_ATTRIBUTES* lpThreadAttributes;
    BOOL bInheritHandles;
    uint dwCreationFlags;
    STARTUPINFOW* lpStartupInfo;
    PROCESS_INFORMATION* lpProcessInformation;
}
alias ASSOCCLASS = int;
enum : int
{
    ASSOCCLASS_SHELL_KEY        = 0x00000000,
    ASSOCCLASS_PROGID_KEY       = 0x00000001,
    ASSOCCLASS_PROGID_STR       = 0x00000002,
    ASSOCCLASS_CLSID_KEY        = 0x00000003,
    ASSOCCLASS_CLSID_STR        = 0x00000004,
    ASSOCCLASS_APP_KEY          = 0x00000005,
    ASSOCCLASS_APP_STR          = 0x00000006,
    ASSOCCLASS_SYSTEM_STR       = 0x00000007,
    ASSOCCLASS_FOLDER           = 0x00000008,
    ASSOCCLASS_STAR             = 0x00000009,
    ASSOCCLASS_FIXED_PROGID_STR = 0x0000000a,
    ASSOCCLASS_PROTOCOL_STR     = 0x0000000b,
}

struct ASSOCIATIONELEMENT
{
    ASSOCCLASS ac;
    HKEY hkClass;
    const(wchar)* pszClass;
}
struct SHQUERYRBINFO
{
    uint cbSize;
    long i64Size;
    long i64NumItems;
}
alias QUERY_USER_NOTIFICATION_STATE = int;
enum : int
{
    QUNS_NOT_PRESENT             = 0x00000001,
    QUNS_BUSY                    = 0x00000002,
    QUNS_RUNNING_D3D_FULL_SCREEN = 0x00000003,
    QUNS_PRESENTATION_MODE       = 0x00000004,
    QUNS_ACCEPTS_NOTIFICATIONS   = 0x00000005,
    QUNS_QUIET_TIME              = 0x00000006,
    QUNS_APP                     = 0x00000007,
}

struct NOTIFYICONDATAA
{
    uint cbSize;
    HWND hWnd;
    uint uID;
    NOTIFY_ICON_DATA_FLAGS uFlags;
    uint uCallbackMessage;
    HICON hIcon;
    CHAR[128] szTip;
    uint dwState;
    uint dwStateMask;
    CHAR[256] szInfo;
    union
    {
        uint uTimeout;
        uint uVersion;
    }
    CHAR[64] szInfoTitle;
    uint dwInfoFlags;
    GUID guidItem;
    HICON hBalloonIcon;
}
struct NOTIFYICONDATAW
{
    uint cbSize;
    HWND hWnd;
    uint uID;
    NOTIFY_ICON_DATA_FLAGS uFlags;
    uint uCallbackMessage;
    HICON hIcon;
    wchar[128] szTip;
    uint dwState;
    uint dwStateMask;
    wchar[256] szInfo;
    union
    {
        uint uTimeout;
        uint uVersion;
    }
    wchar[64] szInfoTitle;
    uint dwInfoFlags;
    GUID guidItem;
    HICON hBalloonIcon;
}
struct NOTIFYICONIDENTIFIER
{
    uint cbSize;
    HWND hWnd;
    uint uID;
    GUID guidItem;
}
struct SHFILEINFOA
{
    HICON hIcon;
    int iIcon;
    uint dwAttributes;
    CHAR[260] szDisplayName;
    CHAR[80] szTypeName;
}
struct SHFILEINFOW
{
    HICON hIcon;
    int iIcon;
    uint dwAttributes;
    wchar[260] szDisplayName;
    wchar[80] szTypeName;
}
struct SHSTOCKICONINFO
{
    uint cbSize;
    HICON hIcon;
    int iSysImageIndex;
    int iIcon;
    wchar[260] szPath;
}
alias SHSTOCKICONID = int;
enum : int
{
    SIID_DOCNOASSOC        = 0x00000000,
    SIID_DOCASSOC          = 0x00000001,
    SIID_APPLICATION       = 0x00000002,
    SIID_FOLDER            = 0x00000003,
    SIID_FOLDEROPEN        = 0x00000004,
    SIID_DRIVE525          = 0x00000005,
    SIID_DRIVE35           = 0x00000006,
    SIID_DRIVEREMOVE       = 0x00000007,
    SIID_DRIVEFIXED        = 0x00000008,
    SIID_DRIVENET          = 0x00000009,
    SIID_DRIVENETDISABLED  = 0x0000000a,
    SIID_DRIVECD           = 0x0000000b,
    SIID_DRIVERAM          = 0x0000000c,
    SIID_WORLD             = 0x0000000d,
    SIID_SERVER            = 0x0000000f,
    SIID_PRINTER           = 0x00000010,
    SIID_MYNETWORK         = 0x00000011,
    SIID_FIND              = 0x00000016,
    SIID_HELP              = 0x00000017,
    SIID_SHARE             = 0x0000001c,
    SIID_LINK              = 0x0000001d,
    SIID_SLOWFILE          = 0x0000001e,
    SIID_RECYCLER          = 0x0000001f,
    SIID_RECYCLERFULL      = 0x00000020,
    SIID_MEDIACDAUDIO      = 0x00000028,
    SIID_LOCK              = 0x0000002f,
    SIID_AUTOLIST          = 0x00000031,
    SIID_PRINTERNET        = 0x00000032,
    SIID_SERVERSHARE       = 0x00000033,
    SIID_PRINTERFAX        = 0x00000034,
    SIID_PRINTERFAXNET     = 0x00000035,
    SIID_PRINTERFILE       = 0x00000036,
    SIID_STACK             = 0x00000037,
    SIID_MEDIASVCD         = 0x00000038,
    SIID_STUFFEDFOLDER     = 0x00000039,
    SIID_DRIVEUNKNOWN      = 0x0000003a,
    SIID_DRIVEDVD          = 0x0000003b,
    SIID_MEDIADVD          = 0x0000003c,
    SIID_MEDIADVDRAM       = 0x0000003d,
    SIID_MEDIADVDRW        = 0x0000003e,
    SIID_MEDIADVDR         = 0x0000003f,
    SIID_MEDIADVDROM       = 0x00000040,
    SIID_MEDIACDAUDIOPLUS  = 0x00000041,
    SIID_MEDIACDRW         = 0x00000042,
    SIID_MEDIACDR          = 0x00000043,
    SIID_MEDIACDBURN       = 0x00000044,
    SIID_MEDIABLANKCD      = 0x00000045,
    SIID_MEDIACDROM        = 0x00000046,
    SIID_AUDIOFILES        = 0x00000047,
    SIID_IMAGEFILES        = 0x00000048,
    SIID_VIDEOFILES        = 0x00000049,
    SIID_MIXEDFILES        = 0x0000004a,
    SIID_FOLDERBACK        = 0x0000004b,
    SIID_FOLDERFRONT       = 0x0000004c,
    SIID_SHIELD            = 0x0000004d,
    SIID_WARNING           = 0x0000004e,
    SIID_INFO              = 0x0000004f,
    SIID_ERROR             = 0x00000050,
    SIID_KEY               = 0x00000051,
    SIID_SOFTWARE          = 0x00000052,
    SIID_RENAME            = 0x00000053,
    SIID_DELETE            = 0x00000054,
    SIID_MEDIAAUDIODVD     = 0x00000055,
    SIID_MEDIAMOVIEDVD     = 0x00000056,
    SIID_MEDIAENHANCEDCD   = 0x00000057,
    SIID_MEDIAENHANCEDDVD  = 0x00000058,
    SIID_MEDIAHDDVD        = 0x00000059,
    SIID_MEDIABLURAY       = 0x0000005a,
    SIID_MEDIAVCD          = 0x0000005b,
    SIID_MEDIADVDPLUSR     = 0x0000005c,
    SIID_MEDIADVDPLUSRW    = 0x0000005d,
    SIID_DESKTOPPC         = 0x0000005e,
    SIID_MOBILEPC          = 0x0000005f,
    SIID_USERS             = 0x00000060,
    SIID_MEDIASMARTMEDIA   = 0x00000061,
    SIID_MEDIACOMPACTFLASH = 0x00000062,
    SIID_DEVICECELLPHONE   = 0x00000063,
    SIID_DEVICECAMERA      = 0x00000064,
    SIID_DEVICEVIDEOCAMERA = 0x00000065,
    SIID_DEVICEAUDIOPLAYER = 0x00000066,
    SIID_NETWORKCONNECT    = 0x00000067,
    SIID_INTERNET          = 0x00000068,
    SIID_ZIPFILE           = 0x00000069,
    SIID_SETTINGS          = 0x0000006a,
    SIID_DRIVEHDDVD        = 0x00000084,
    SIID_DRIVEBD           = 0x00000085,
    SIID_MEDIAHDDVDROM     = 0x00000086,
    SIID_MEDIAHDDVDR       = 0x00000087,
    SIID_MEDIAHDDVDRAM     = 0x00000088,
    SIID_MEDIABDROM        = 0x00000089,
    SIID_MEDIABDR          = 0x0000008a,
    SIID_MEDIABDRE         = 0x0000008b,
    SIID_CLUSTEREDDRIVE    = 0x0000008c,
    SIID_MAX_ICONS         = 0x000000b5,
}

struct OPEN_PRINTER_PROPS_INFOA
{
    uint dwSize;
    PSTR pszSheetName;
    uint uSheetIndex;
    uint dwFlags;
    BOOL bModal;
}
struct OPEN_PRINTER_PROPS_INFOW
{
    uint dwSize;
    PWSTR pszSheetName;
    uint uSheetIndex;
    uint dwFlags;
    BOOL bModal;
}
alias PFNCANSHAREFOLDERW = HRESULT function(const(wchar)*);
alias PFNSHOWSHAREFOLDERUIW = HRESULT function(HWND, const(wchar)*);
struct NC_ADDRESS
{
    struct NET_ADDRESS_INFO
    {
    }
    ushort PortNumber;
    ubyte PrefixLength;
}
alias SFBS_FLAGS = int;
enum : int
{
    SFBS_FLAGS_ROUND_TO_NEAREST_DISPLAYED_DIGIT    = 0x00000001,
    SFBS_FLAGS_TRUNCATE_UNDISPLAYED_DECIMAL_DIGITS = 0x00000002,
}

alias URL_SCHEME = int;
enum : int
{
    URL_SCHEME_INVALID       = 0xffffffff,
    URL_SCHEME_UNKNOWN       = 0x00000000,
    URL_SCHEME_FTP           = 0x00000001,
    URL_SCHEME_HTTP          = 0x00000002,
    URL_SCHEME_GOPHER        = 0x00000003,
    URL_SCHEME_MAILTO        = 0x00000004,
    URL_SCHEME_NEWS          = 0x00000005,
    URL_SCHEME_NNTP          = 0x00000006,
    URL_SCHEME_TELNET        = 0x00000007,
    URL_SCHEME_WAIS          = 0x00000008,
    URL_SCHEME_FILE          = 0x00000009,
    URL_SCHEME_MK            = 0x0000000a,
    URL_SCHEME_HTTPS         = 0x0000000b,
    URL_SCHEME_SHELL         = 0x0000000c,
    URL_SCHEME_SNEWS         = 0x0000000d,
    URL_SCHEME_LOCAL         = 0x0000000e,
    URL_SCHEME_JAVASCRIPT    = 0x0000000f,
    URL_SCHEME_VBSCRIPT      = 0x00000010,
    URL_SCHEME_ABOUT         = 0x00000011,
    URL_SCHEME_RES           = 0x00000012,
    URL_SCHEME_MSSHELLROOTED = 0x00000013,
    URL_SCHEME_MSSHELLIDLIST = 0x00000014,
    URL_SCHEME_MSHELP        = 0x00000015,
    URL_SCHEME_MSSHELLDEVICE = 0x00000016,
    URL_SCHEME_WILDCARD      = 0x00000017,
    URL_SCHEME_SEARCH_MS     = 0x00000018,
    URL_SCHEME_SEARCH        = 0x00000019,
    URL_SCHEME_KNOWNFOLDER   = 0x0000001a,
    URL_SCHEME_MAXVALUE      = 0x0000001b,
}

alias URL_PART = int;
enum : int
{
    URL_PART_NONE     = 0x00000000,
    URL_PART_SCHEME   = 0x00000001,
    URL_PART_HOSTNAME = 0x00000002,
    URL_PART_USERNAME = 0x00000003,
    URL_PART_PASSWORD = 0x00000004,
    URL_PART_PORT     = 0x00000005,
    URL_PART_QUERY    = 0x00000006,
}

alias URLIS = int;
enum : int
{
    URLIS_URL       = 0x00000000,
    URLIS_OPAQUE    = 0x00000001,
    URLIS_NOHISTORY = 0x00000002,
    URLIS_FILEURL   = 0x00000003,
    URLIS_APPLIABLE = 0x00000004,
    URLIS_DIRECTORY = 0x00000005,
    URLIS_HASQUERY  = 0x00000006,
}

struct PARSEDURLA
{
    uint cbSize;
    const(char)* pszProtocol;
    uint cchProtocol;
    const(char)* pszSuffix;
    uint cchSuffix;
    uint nScheme;
}
struct PARSEDURLW
{
    uint cbSize;
    const(wchar)* pszProtocol;
    uint cchProtocol;
    const(wchar)* pszSuffix;
    uint cchSuffix;
    uint nScheme;
}
alias SHREGDEL_FLAGS = int;
enum : int
{
    SHREGDEL_DEFAULT = 0x00000000,
    SHREGDEL_HKCU    = 0x00000001,
    SHREGDEL_HKLM    = 0x00000010,
    SHREGDEL_BOTH    = 0x00000011,
}

alias SHREGENUM_FLAGS = int;
enum : int
{
    SHREGENUM_DEFAULT = 0x00000000,
    SHREGENUM_HKCU    = 0x00000001,
    SHREGENUM_HKLM    = 0x00000010,
    SHREGENUM_BOTH    = 0x00000011,
}

alias ASSOCSTR = int;
enum : int
{
    ASSOCSTR_COMMAND                 = 0x00000001,
    ASSOCSTR_EXECUTABLE              = 0x00000002,
    ASSOCSTR_FRIENDLYDOCNAME         = 0x00000003,
    ASSOCSTR_FRIENDLYAPPNAME         = 0x00000004,
    ASSOCSTR_NOOPEN                  = 0x00000005,
    ASSOCSTR_SHELLNEWVALUE           = 0x00000006,
    ASSOCSTR_DDECOMMAND              = 0x00000007,
    ASSOCSTR_DDEIFEXEC               = 0x00000008,
    ASSOCSTR_DDEAPPLICATION          = 0x00000009,
    ASSOCSTR_DDETOPIC                = 0x0000000a,
    ASSOCSTR_INFOTIP                 = 0x0000000b,
    ASSOCSTR_QUICKTIP                = 0x0000000c,
    ASSOCSTR_TILEINFO                = 0x0000000d,
    ASSOCSTR_CONTENTTYPE             = 0x0000000e,
    ASSOCSTR_DEFAULTICON             = 0x0000000f,
    ASSOCSTR_SHELLEXTENSION          = 0x00000010,
    ASSOCSTR_DROPTARGET              = 0x00000011,
    ASSOCSTR_DELEGATEEXECUTE         = 0x00000012,
    ASSOCSTR_SUPPORTED_URI_PROTOCOLS = 0x00000013,
    ASSOCSTR_PROGID                  = 0x00000014,
    ASSOCSTR_APPID                   = 0x00000015,
    ASSOCSTR_APPPUBLISHER            = 0x00000016,
    ASSOCSTR_APPICONREFERENCE        = 0x00000017,
    ASSOCSTR_MAX                     = 0x00000018,
}

alias ASSOCKEY = int;
enum : int
{
    ASSOCKEY_SHELLEXECCLASS = 0x00000001,
    ASSOCKEY_APP            = 0x00000002,
    ASSOCKEY_CLASS          = 0x00000003,
    ASSOCKEY_BASECLASS      = 0x00000004,
    ASSOCKEY_MAX            = 0x00000005,
}

alias ASSOCDATA = int;
enum : int
{
    ASSOCDATA_MSIDESCRIPTOR     = 0x00000001,
    ASSOCDATA_NOACTIVATEHANDLER = 0x00000002,
    ASSOCDATA_UNUSED1           = 0x00000003,
    ASSOCDATA_HASPERUSERASSOC   = 0x00000004,
    ASSOCDATA_EDITFLAGS         = 0x00000005,
    ASSOCDATA_VALUE             = 0x00000006,
    ASSOCDATA_MAX               = 0x00000007,
}

alias ASSOCENUM = int;
enum : int
{
    ASSOCENUM_NONE = 0x00000000,
}

alias FILETYPEATTRIBUTEFLAGS = int;
enum : int
{
    FTA_None                  = 0x00000000,
    FTA_Exclude               = 0x00000001,
    FTA_Show                  = 0x00000002,
    FTA_HasExtension          = 0x00000004,
    FTA_NoEdit                = 0x00000008,
    FTA_NoRemove              = 0x00000010,
    FTA_NoNewVerb             = 0x00000020,
    FTA_NoEditVerb            = 0x00000040,
    FTA_NoRemoveVerb          = 0x00000080,
    FTA_NoEditDesc            = 0x00000100,
    FTA_NoEditIcon            = 0x00000200,
    FTA_NoEditDflt            = 0x00000400,
    FTA_NoEditVerbCmd         = 0x00000800,
    FTA_NoEditVerbExe         = 0x00001000,
    FTA_NoDDE                 = 0x00002000,
    FTA_NoEditMIME            = 0x00008000,
    FTA_OpenIsSafe            = 0x00010000,
    FTA_AlwaysUnsafe          = 0x00020000,
    FTA_NoRecentDocs          = 0x00100000,
    FTA_SafeForElevation      = 0x00200000,
    FTA_AlwaysUseDirectInvoke = 0x00400000,
}

enum IID_IQueryAssociations = GUID(0xc46ca590, 0x3c3f, 0x11d2, [0xbe, 0xe6, 0x0, 0x0, 0xf8, 0x5, 0xca, 0x57]);
interface IQueryAssociations : IUnknown
{
    HRESULT Init(uint, const(wchar)*, HKEY, HWND);
    HRESULT GetString(uint, ASSOCSTR, const(wchar)*, PWSTR, uint*);
    HRESULT GetKey(uint, ASSOCKEY, const(wchar)*, HKEY*);
    HRESULT GetData(uint, ASSOCDATA, const(wchar)*, void*, uint*);
    HRESULT GetEnum(uint, ASSOCENUM, const(wchar)*, const(GUID)*, void**);
}
alias SHGLOBALCOUNTER = int;
enum : int
{
    GLOBALCOUNTER_SEARCHMANAGER                                      = 0x00000000,
    GLOBALCOUNTER_SEARCHOPTIONS                                      = 0x00000001,
    GLOBALCOUNTER_FOLDERSETTINGSCHANGE                               = 0x00000002,
    GLOBALCOUNTER_RATINGS                                            = 0x00000003,
    GLOBALCOUNTER_APPROVEDSITES                                      = 0x00000004,
    GLOBALCOUNTER_RESTRICTIONS                                       = 0x00000005,
    GLOBALCOUNTER_SHELLSETTINGSCHANGED                               = 0x00000006,
    GLOBALCOUNTER_SYSTEMPIDLCHANGE                                   = 0x00000007,
    GLOBALCOUNTER_OVERLAYMANAGER                                     = 0x00000008,
    GLOBALCOUNTER_QUERYASSOCIATIONS                                  = 0x00000009,
    GLOBALCOUNTER_IESESSIONS                                         = 0x0000000a,
    GLOBALCOUNTER_IEONLY_SESSIONS                                    = 0x0000000b,
    GLOBALCOUNTER_APPLICATION_DESTINATIONS                           = 0x0000000c,
    __UNUSED_RECYCLE_WAS_GLOBALCOUNTER_CSCSYNCINPROGRESS             = 0x0000000d,
    GLOBALCOUNTER_BITBUCKETNUMDELETERS                               = 0x0000000e,
    GLOBALCOUNTER_RECYCLEDIRTYCOUNT_SHARES                           = 0x0000000f,
    GLOBALCOUNTER_RECYCLEDIRTYCOUNT_DRIVE_A                          = 0x00000010,
    GLOBALCOUNTER_RECYCLEDIRTYCOUNT_DRIVE_B                          = 0x00000011,
    GLOBALCOUNTER_RECYCLEDIRTYCOUNT_DRIVE_C                          = 0x00000012,
    GLOBALCOUNTER_RECYCLEDIRTYCOUNT_DRIVE_D                          = 0x00000013,
    GLOBALCOUNTER_RECYCLEDIRTYCOUNT_DRIVE_E                          = 0x00000014,
    GLOBALCOUNTER_RECYCLEDIRTYCOUNT_DRIVE_F                          = 0x00000015,
    GLOBALCOUNTER_RECYCLEDIRTYCOUNT_DRIVE_G                          = 0x00000016,
    GLOBALCOUNTER_RECYCLEDIRTYCOUNT_DRIVE_H                          = 0x00000017,
    GLOBALCOUNTER_RECYCLEDIRTYCOUNT_DRIVE_I                          = 0x00000018,
    GLOBALCOUNTER_RECYCLEDIRTYCOUNT_DRIVE_J                          = 0x00000019,
    GLOBALCOUNTER_RECYCLEDIRTYCOUNT_DRIVE_K                          = 0x0000001a,
    GLOBALCOUNTER_RECYCLEDIRTYCOUNT_DRIVE_L                          = 0x0000001b,
    GLOBALCOUNTER_RECYCLEDIRTYCOUNT_DRIVE_M                          = 0x0000001c,
    GLOBALCOUNTER_RECYCLEDIRTYCOUNT_DRIVE_N                          = 0x0000001d,
    GLOBALCOUNTER_RECYCLEDIRTYCOUNT_DRIVE_O                          = 0x0000001e,
    GLOBALCOUNTER_RECYCLEDIRTYCOUNT_DRIVE_P                          = 0x0000001f,
    GLOBALCOUNTER_RECYCLEDIRTYCOUNT_DRIVE_Q                          = 0x00000020,
    GLOBALCOUNTER_RECYCLEDIRTYCOUNT_DRIVE_R                          = 0x00000021,
    GLOBALCOUNTER_RECYCLEDIRTYCOUNT_DRIVE_S                          = 0x00000022,
    GLOBALCOUNTER_RECYCLEDIRTYCOUNT_DRIVE_T                          = 0x00000023,
    GLOBALCOUNTER_RECYCLEDIRTYCOUNT_DRIVE_U                          = 0x00000024,
    GLOBALCOUNTER_RECYCLEDIRTYCOUNT_DRIVE_V                          = 0x00000025,
    GLOBALCOUNTER_RECYCLEDIRTYCOUNT_DRIVE_W                          = 0x00000026,
    GLOBALCOUNTER_RECYCLEDIRTYCOUNT_DRIVE_X                          = 0x00000027,
    GLOBALCOUNTER_RECYCLEDIRTYCOUNT_DRIVE_Y                          = 0x00000028,
    GLOBALCOUNTER_RECYCLEDIRTYCOUNT_DRIVE_Z                          = 0x00000029,
    __UNUSED_RECYCLE_WAS_GLOBALCOUNTER_RECYCLEDIRTYCOUNT_SERVERDRIVE = 0x0000002a,
    __UNUSED_RECYCLE_WAS_GLOBALCOUNTER_RECYCLEGLOBALDIRTYCOUNT       = 0x0000002b,
    GLOBALCOUNTER_RECYCLEBINENUM                                     = 0x0000002c,
    GLOBALCOUNTER_RECYCLEBINCORRUPTED                                = 0x0000002d,
    GLOBALCOUNTER_RATINGS_STATECOUNTER                               = 0x0000002e,
    GLOBALCOUNTER_PRIVATE_PROFILE_CACHE                              = 0x0000002f,
    GLOBALCOUNTER_INTERNETTOOLBAR_LAYOUT                             = 0x00000030,
    GLOBALCOUNTER_FOLDERDEFINITION_CACHE                             = 0x00000031,
    GLOBALCOUNTER_COMMONPLACES_LIST_CACHE                            = 0x00000032,
    GLOBALCOUNTER_PRIVATE_PROFILE_CACHE_MACHINEWIDE                  = 0x00000033,
    GLOBALCOUNTER_ASSOCCHANGED                                       = 0x00000034,
    GLOBALCOUNTER_APP_ITEMS_STATE_STORE_CACHE                        = 0x00000035,
    GLOBALCOUNTER_SETTINGSYNC_ENABLED                                = 0x00000036,
    GLOBALCOUNTER_APPSFOLDER_FILETYPEASSOCIATION_COUNTER             = 0x00000037,
    GLOBALCOUNTER_USERINFOCHANGED                                    = 0x00000038,
    GLOBALCOUNTER_SYNC_ENGINE_INFORMATION_CACHE_MACHINEWIDE          = 0x00000039,
    GLOBALCOUNTER_BANNERS_DATAMODEL_CACHE_MACHINEWIDE                = 0x0000003a,
    GLOBALCOUNTER_MAXIMUMVALUE                                       = 0x0000003b,
}

struct QITAB
{
    const(GUID)* piid;
    uint dwOffset;
}
struct DLLVERSIONINFO
{
    uint cbSize;
    uint dwMajorVersion;
    uint dwMinorVersion;
    uint dwBuildNumber;
    uint dwPlatformID;
}
struct DLLVERSIONINFO2
{
    DLLVERSIONINFO info1;
    uint dwFlags;
    ulong ullVersion;
}
alias DLLGETVERSIONPROC = HRESULT function(DLLVERSIONINFO*);
alias APPINFODATAFLAGS = int;
enum : int
{
    AIM_DISPLAYNAME       = 0x00000001,
    AIM_VERSION           = 0x00000002,
    AIM_PUBLISHER         = 0x00000004,
    AIM_PRODUCTID         = 0x00000008,
    AIM_REGISTEREDOWNER   = 0x00000010,
    AIM_REGISTEREDCOMPANY = 0x00000020,
    AIM_LANGUAGE          = 0x00000040,
    AIM_SUPPORTURL        = 0x00000080,
    AIM_SUPPORTTELEPHONE  = 0x00000100,
    AIM_HELPLINK          = 0x00000200,
    AIM_INSTALLLOCATION   = 0x00000400,
    AIM_INSTALLSOURCE     = 0x00000800,
    AIM_INSTALLDATE       = 0x00001000,
    AIM_CONTACT           = 0x00004000,
    AIM_COMMENTS          = 0x00008000,
    AIM_IMAGE             = 0x00020000,
    AIM_READMEURL         = 0x00040000,
    AIM_UPDATEINFOURL     = 0x00080000,
}

struct APPINFODATA
{
    uint cbSize;
    uint dwMask;
    PWSTR pszDisplayName;
    PWSTR pszVersion;
    PWSTR pszPublisher;
    PWSTR pszProductID;
    PWSTR pszRegisteredOwner;
    PWSTR pszRegisteredCompany;
    PWSTR pszLanguage;
    PWSTR pszSupportUrl;
    PWSTR pszSupportTelephone;
    PWSTR pszHelpLink;
    PWSTR pszInstallLocation;
    PWSTR pszInstallSource;
    PWSTR pszInstallDate;
    PWSTR pszContact;
    PWSTR pszComments;
    PWSTR pszImage;
    PWSTR pszReadmeUrl;
    PWSTR pszUpdateInfoUrl;
}
alias APPACTIONFLAGS = int;
enum : int
{
    APPACTION_INSTALL      = 0x00000001,
    APPACTION_UNINSTALL    = 0x00000002,
    APPACTION_MODIFY       = 0x00000004,
    APPACTION_REPAIR       = 0x00000008,
    APPACTION_UPGRADE      = 0x00000010,
    APPACTION_CANGETSIZE   = 0x00000020,
    APPACTION_MODIFYREMOVE = 0x00000080,
    APPACTION_ADDLATER     = 0x00000100,
    APPACTION_UNSCHEDULE   = 0x00000200,
}

struct SLOWAPPINFO
{
    ulong ullSize;
    FILETIME ftLastUsed;
    int iTimesUsed;
    PWSTR pszImage;
}
enum IID_IShellApp = GUID(0xa3e14960, 0x935f, 0x11d1, [0xb8, 0xb8, 0x0, 0x60, 0x8, 0x5, 0x93, 0x82]);
interface IShellApp : IUnknown
{
    HRESULT GetAppInfo(APPINFODATA*);
    HRESULT GetPossibleActions(uint*);
    HRESULT GetSlowAppInfo(SLOWAPPINFO*);
    HRESULT GetCachedSlowAppInfo(SLOWAPPINFO*);
    HRESULT IsInstalled();
}
alias PUBAPPINFOFLAGS = int;
enum : int
{
    PAI_SOURCE        = 0x00000001,
    PAI_ASSIGNEDTIME  = 0x00000002,
    PAI_PUBLISHEDTIME = 0x00000004,
    PAI_SCHEDULEDTIME = 0x00000008,
    PAI_EXPIRETIME    = 0x00000010,
}

struct PUBAPPINFO
{
    uint cbSize;
    uint dwMask;
    PWSTR pszSource;
    SYSTEMTIME stAssigned;
    SYSTEMTIME stPublished;
    SYSTEMTIME stScheduled;
    SYSTEMTIME stExpire;
}
enum IID_IPublishedApp = GUID(0x1bc752e0, 0x9046, 0x11d1, [0xb8, 0xb3, 0x0, 0x60, 0x8, 0x5, 0x93, 0x82]);
interface IPublishedApp : IShellApp
{
    HRESULT Install(SYSTEMTIME*);
    HRESULT GetPublishedAppInfo(PUBAPPINFO*);
    HRESULT Unschedule();
}
enum IID_IPublishedApp2 = GUID(0x12b81347, 0x1b3a, 0x4a04, [0xaa, 0x61, 0x3f, 0x76, 0x8b, 0x67, 0xfd, 0x7e]);
interface IPublishedApp2 : IPublishedApp
{
    HRESULT Install2(SYSTEMTIME*, HWND);
}
enum IID_IEnumPublishedApps = GUID(0xb124f8c, 0x91f0, 0x11d1, [0xb8, 0xb5, 0x0, 0x60, 0x8, 0x5, 0x93, 0x82]);
interface IEnumPublishedApps : IUnknown
{
    HRESULT Next(IPublishedApp*);
    HRESULT Reset();
}
enum IID_IAppPublisher = GUID(0x7250a10, 0x9cf9, 0x11d1, [0x90, 0x76, 0x0, 0x60, 0x8, 0x5, 0x93, 0x82]);
interface IAppPublisher : IUnknown
{
    HRESULT GetNumberOfCategories(uint*);
    HRESULT GetCategories(APPCATEGORYINFOLIST*);
    HRESULT GetNumberOfApps(uint*);
    HRESULT EnumApps(GUID*, IEnumPublishedApps*);
}
enum CLSID_PasswordCredentialProvider = GUID(0x60b78e88, 0xead8, 0x445c, [0x9c, 0xfd, 0xb, 0x87, 0xf7, 0x4e, 0xa6, 0xcd]);
struct PasswordCredentialProvider
{
}
enum CLSID_V1PasswordCredentialProvider = GUID(0x6f45dc1e, 0x5384, 0x457a, [0xbc, 0x13, 0x2c, 0xd8, 0x1b, 0xd, 0x28, 0xed]);
struct V1PasswordCredentialProvider
{
}
enum CLSID_PINLogonCredentialProvider = GUID(0xcb82ea12, 0x9f71, 0x446d, [0x89, 0xe1, 0x8d, 0x9, 0x24, 0xe1, 0x25, 0x6e]);
struct PINLogonCredentialProvider
{
}
enum CLSID_NPCredentialProvider = GUID(0x3dd6bec0, 0x8193, 0x4ffe, [0xae, 0x25, 0xe0, 0x8e, 0x39, 0xea, 0x40, 0x63]);
struct NPCredentialProvider
{
}
enum CLSID_SmartcardCredentialProvider = GUID(0x8fd7e19c, 0x3bf7, 0x489b, [0xa7, 0x2c, 0x84, 0x6a, 0xb3, 0x67, 0x8c, 0x96]);
struct SmartcardCredentialProvider
{
}
enum CLSID_V1SmartcardCredentialProvider = GUID(0x8bf9a910, 0xa8ff, 0x457f, [0x99, 0x9f, 0xa5, 0xca, 0x10, 0xb4, 0xa8, 0x85]);
struct V1SmartcardCredentialProvider
{
}
enum CLSID_SmartcardPinProvider = GUID(0x94596c7e, 0x3744, 0x41ce, [0x89, 0x3e, 0xbb, 0xf0, 0x91, 0x22, 0xf7, 0x6a]);
struct SmartcardPinProvider
{
}
enum CLSID_SmartcardReaderSelectionProvider = GUID(0x1b283861, 0x754f, 0x4022, [0xad, 0x47, 0xa5, 0xea, 0xaa, 0x61, 0x88, 0x94]);
struct SmartcardReaderSelectionProvider
{
}
enum CLSID_SmartcardWinRTProvider = GUID(0x1ee7337f, 0x85ac, 0x45e2, [0xa2, 0x3c, 0x37, 0xc7, 0x53, 0x20, 0x97, 0x69]);
struct SmartcardWinRTProvider
{
}
enum CLSID_GenericCredentialProvider = GUID(0x25cbb996, 0x92ed, 0x457e, [0xb2, 0x8c, 0x47, 0x74, 0x8, 0x4b, 0xd5, 0x62]);
struct GenericCredentialProvider
{
}
enum CLSID_RASProvider = GUID(0x5537e283, 0xb1e7, 0x4ef8, [0x9c, 0x6e, 0x7a, 0xb0, 0xaf, 0xe5, 0x5, 0x6d]);
struct RASProvider
{
}
enum CLSID_OnexCredentialProvider = GUID(0x7aa0886, 0xcc8d, 0x4e19, [0xa4, 0x10, 0x1c, 0x75, 0xaf, 0x68, 0x6e, 0x62]);
struct OnexCredentialProvider
{
}
enum CLSID_OnexPlapSmartcardCredentialProvider = GUID(0x33c86cd6, 0x705f, 0x4ba1, [0x9a, 0xdb, 0x67, 0x7, 0xb, 0x83, 0x77, 0x75]);
struct OnexPlapSmartcardCredentialProvider
{
}
enum CLSID_VaultProvider = GUID(0x503739d0, 0x4c5e, 0x4cfd, [0xb3, 0xba, 0xd8, 0x81, 0x33, 0x4f, 0xd, 0xf2]);
struct VaultProvider
{
}
enum CLSID_WinBioCredentialProvider = GUID(0xbec09223, 0xb018, 0x416d, [0xa0, 0xac, 0x52, 0x39, 0x71, 0xb6, 0x39, 0xf5]);
struct WinBioCredentialProvider
{
}
enum CLSID_V1WinBioCredentialProvider = GUID(0xac3ac249, 0xe820, 0x4343, [0xa6, 0x5b, 0x37, 0x7a, 0xc6, 0x34, 0xdc, 0x9]);
struct V1WinBioCredentialProvider
{
}
alias CREDENTIAL_PROVIDER_USAGE_SCENARIO = int;
enum : int
{
    CPUS_INVALID            = 0x00000000,
    CPUS_LOGON              = 0x00000001,
    CPUS_UNLOCK_WORKSTATION = 0x00000002,
    CPUS_CHANGE_PASSWORD    = 0x00000003,
    CPUS_CREDUI             = 0x00000004,
    CPUS_PLAP               = 0x00000005,
}

alias CREDENTIAL_PROVIDER_FIELD_TYPE = int;
enum : int
{
    CPFT_INVALID       = 0x00000000,
    CPFT_LARGE_TEXT    = 0x00000001,
    CPFT_SMALL_TEXT    = 0x00000002,
    CPFT_COMMAND_LINK  = 0x00000003,
    CPFT_EDIT_TEXT     = 0x00000004,
    CPFT_PASSWORD_TEXT = 0x00000005,
    CPFT_TILE_IMAGE    = 0x00000006,
    CPFT_CHECKBOX      = 0x00000007,
    CPFT_COMBOBOX      = 0x00000008,
    CPFT_SUBMIT_BUTTON = 0x00000009,
}

alias CREDENTIAL_PROVIDER_FIELD_STATE = int;
enum : int
{
    CPFS_HIDDEN                     = 0x00000000,
    CPFS_DISPLAY_IN_SELECTED_TILE   = 0x00000001,
    CPFS_DISPLAY_IN_DESELECTED_TILE = 0x00000002,
    CPFS_DISPLAY_IN_BOTH            = 0x00000003,
}

alias CREDENTIAL_PROVIDER_FIELD_INTERACTIVE_STATE = int;
enum : int
{
    CPFIS_NONE     = 0x00000000,
    CPFIS_READONLY = 0x00000001,
    CPFIS_DISABLED = 0x00000002,
    CPFIS_FOCUSED  = 0x00000003,
}

struct CREDENTIAL_PROVIDER_FIELD_DESCRIPTOR
{
    uint dwFieldID;
    CREDENTIAL_PROVIDER_FIELD_TYPE cpft;
    PWSTR pszLabel;
    GUID guidFieldType;
}
alias CREDENTIAL_PROVIDER_GET_SERIALIZATION_RESPONSE = int;
enum : int
{
    CPGSR_NO_CREDENTIAL_NOT_FINISHED    = 0x00000000,
    CPGSR_NO_CREDENTIAL_FINISHED        = 0x00000001,
    CPGSR_RETURN_CREDENTIAL_FINISHED    = 0x00000002,
    CPGSR_RETURN_NO_CREDENTIAL_FINISHED = 0x00000003,
}

alias CREDENTIAL_PROVIDER_STATUS_ICON = int;
enum : int
{
    CPSI_NONE    = 0x00000000,
    CPSI_ERROR   = 0x00000001,
    CPSI_WARNING = 0x00000002,
    CPSI_SUCCESS = 0x00000003,
}

struct CREDENTIAL_PROVIDER_CREDENTIAL_SERIALIZATION
{
    uint ulAuthenticationPackage;
    GUID clsidCredentialProvider;
    uint cbSerialization;
    ubyte* rgbSerialization;
}
alias CREDENTIAL_PROVIDER_ACCOUNT_OPTIONS = int;
enum : int
{
    CPAO_NONE            = 0x00000000,
    CPAO_EMPTY_LOCAL     = 0x00000001,
    CPAO_EMPTY_CONNECTED = 0x00000002,
}

alias CREDENTIAL_PROVIDER_CREDENTIAL_FIELD_OPTIONS = int;
enum : int
{
    CPCFO_NONE                              = 0x00000000,
    CPCFO_ENABLE_PASSWORD_REVEAL            = 0x00000001,
    CPCFO_IS_EMAIL_ADDRESS                  = 0x00000002,
    CPCFO_ENABLE_TOUCH_KEYBOARD_AUTO_INVOKE = 0x00000004,
    CPCFO_NUMBERS_ONLY                      = 0x00000008,
    CPCFO_SHOW_ENGLISH_KEYBOARD             = 0x00000010,
}

enum IID_ICredentialProviderCredential = GUID(0x63913a93, 0x40c1, 0x481a, [0x81, 0x8d, 0x40, 0x72, 0xff, 0x8c, 0x70, 0xcc]);
interface ICredentialProviderCredential : IUnknown
{
    HRESULT Advise(ICredentialProviderCredentialEvents);
    HRESULT UnAdvise();
    HRESULT SetSelected(BOOL*);
    HRESULT SetDeselected();
    HRESULT GetFieldState(uint, CREDENTIAL_PROVIDER_FIELD_STATE*, CREDENTIAL_PROVIDER_FIELD_INTERACTIVE_STATE*);
    HRESULT GetStringValue(uint, PWSTR*);
    HRESULT GetBitmapValue(uint, HBITMAP*);
    HRESULT GetCheckboxValue(uint, BOOL*, PWSTR*);
    HRESULT GetSubmitButtonValue(uint, uint*);
    HRESULT GetComboBoxValueCount(uint, uint*, uint*);
    HRESULT GetComboBoxValueAt(uint, uint, PWSTR*);
    HRESULT SetStringValue(uint, const(wchar)*);
    HRESULT SetCheckboxValue(uint, BOOL);
    HRESULT SetComboBoxSelectedValue(uint, uint);
    HRESULT CommandLinkClicked(uint);
    HRESULT GetSerialization(CREDENTIAL_PROVIDER_GET_SERIALIZATION_RESPONSE*, CREDENTIAL_PROVIDER_CREDENTIAL_SERIALIZATION*, PWSTR*, CREDENTIAL_PROVIDER_STATUS_ICON*);
    HRESULT ReportResult(NTSTATUS, NTSTATUS, PWSTR*, CREDENTIAL_PROVIDER_STATUS_ICON*);
}
enum IID_IQueryContinueWithStatus = GUID(0x9090be5b, 0x502b, 0x41fb, [0xbc, 0xcc, 0x0, 0x49, 0xa6, 0xc7, 0x25, 0x4b]);
interface IQueryContinueWithStatus : IQueryContinue
{
    HRESULT SetStatusMessage(const(wchar)*);
}
enum IID_IConnectableCredentialProviderCredential = GUID(0x9387928b, 0xac75, 0x4bf9, [0x8a, 0xb2, 0x2b, 0x93, 0xc4, 0xa5, 0x52, 0x90]);
interface IConnectableCredentialProviderCredential : ICredentialProviderCredential
{
    HRESULT Connect(IQueryContinueWithStatus);
    HRESULT Disconnect();
}
enum IID_ICredentialProviderCredentialEvents = GUID(0xfa6fa76b, 0x66b7, 0x4b11, [0x95, 0xf1, 0x86, 0x17, 0x11, 0x18, 0xe8, 0x16]);
interface ICredentialProviderCredentialEvents : IUnknown
{
    HRESULT SetFieldState(ICredentialProviderCredential, uint, CREDENTIAL_PROVIDER_FIELD_STATE);
    HRESULT SetFieldInteractiveState(ICredentialProviderCredential, uint, CREDENTIAL_PROVIDER_FIELD_INTERACTIVE_STATE);
    HRESULT SetFieldString(ICredentialProviderCredential, uint, const(wchar)*);
    HRESULT SetFieldCheckbox(ICredentialProviderCredential, uint, BOOL, const(wchar)*);
    HRESULT SetFieldBitmap(ICredentialProviderCredential, uint, HBITMAP);
    HRESULT SetFieldComboBoxSelectedItem(ICredentialProviderCredential, uint, uint);
    HRESULT DeleteFieldComboBoxItem(ICredentialProviderCredential, uint, uint);
    HRESULT AppendFieldComboBoxItem(ICredentialProviderCredential, uint, const(wchar)*);
    HRESULT SetFieldSubmitButton(ICredentialProviderCredential, uint, uint);
    HRESULT OnCreatingWindow(HWND*);
}
enum IID_ICredentialProvider = GUID(0xd27c3481, 0x5a1c, 0x45b2, [0x8a, 0xaa, 0xc2, 0xe, 0xbb, 0xe8, 0x22, 0x9e]);
interface ICredentialProvider : IUnknown
{
    HRESULT SetUsageScenario(CREDENTIAL_PROVIDER_USAGE_SCENARIO, uint);
    HRESULT SetSerialization(const(CREDENTIAL_PROVIDER_CREDENTIAL_SERIALIZATION)*);
    HRESULT Advise(ICredentialProviderEvents, ulong);
    HRESULT UnAdvise();
    HRESULT GetFieldDescriptorCount(uint*);
    HRESULT GetFieldDescriptorAt(uint, CREDENTIAL_PROVIDER_FIELD_DESCRIPTOR**);
    HRESULT GetCredentialCount(uint*, uint*, BOOL*);
    HRESULT GetCredentialAt(uint, ICredentialProviderCredential*);
}
enum IID_ICredentialProviderEvents = GUID(0x34201e5a, 0xa787, 0x41a3, [0xa5, 0xa4, 0xbd, 0x6d, 0xcf, 0x2a, 0x85, 0x4e]);
interface ICredentialProviderEvents : IUnknown
{
    HRESULT CredentialsChanged(ulong);
}
enum IID_ICredentialProviderFilter = GUID(0xa5da53f9, 0xd475, 0x4080, [0xa1, 0x20, 0x91, 0xc, 0x4a, 0x73, 0x98, 0x80]);
interface ICredentialProviderFilter : IUnknown
{
    HRESULT Filter(CREDENTIAL_PROVIDER_USAGE_SCENARIO, uint, GUID*, BOOL*, uint);
    HRESULT UpdateRemoteCredential(const(CREDENTIAL_PROVIDER_CREDENTIAL_SERIALIZATION)*, CREDENTIAL_PROVIDER_CREDENTIAL_SERIALIZATION*);
}
enum IID_ICredentialProviderCredential2 = GUID(0xfd672c54, 0x40ea, 0x4d6e, [0x9b, 0x49, 0xcf, 0xb1, 0xa7, 0x50, 0x7b, 0xd7]);
interface ICredentialProviderCredential2 : ICredentialProviderCredential
{
    HRESULT GetUserSid(PWSTR*);
}
enum IID_ICredentialProviderCredentialWithFieldOptions = GUID(0xdbc6fb30, 0xc843, 0x49e3, [0xa6, 0x45, 0x57, 0x3e, 0x6f, 0x39, 0x44, 0x6a]);
interface ICredentialProviderCredentialWithFieldOptions : IUnknown
{
    HRESULT GetFieldOptions(uint, CREDENTIAL_PROVIDER_CREDENTIAL_FIELD_OPTIONS*);
}
enum IID_ICredentialProviderCredentialEvents2 = GUID(0xb53c00b6, 0x9922, 0x4b78, [0xb1, 0xf4, 0xdd, 0xfe, 0x77, 0x4d, 0xc3, 0x9b]);
interface ICredentialProviderCredentialEvents2 : ICredentialProviderCredentialEvents
{
    HRESULT BeginFieldUpdates();
    HRESULT EndFieldUpdates();
    HRESULT SetFieldOptions(ICredentialProviderCredential, uint, CREDENTIAL_PROVIDER_CREDENTIAL_FIELD_OPTIONS);
}
enum IID_ICredentialProviderUser = GUID(0x13793285, 0x3ea6, 0x40fd, [0xb4, 0x20, 0x15, 0xf4, 0x7d, 0xa4, 0x1f, 0xbb]);
interface ICredentialProviderUser : IUnknown
{
    HRESULT GetSid(PWSTR*);
    HRESULT GetProviderID(GUID*);
    HRESULT GetStringValue(const(PROPERTYKEY)*, PWSTR*);
    HRESULT GetValue(const(PROPERTYKEY)*, PROPVARIANT*);
}
enum IID_ICredentialProviderUserArray = GUID(0x90c119ae, 0xf18, 0x4520, [0xa1, 0xf1, 0x11, 0x43, 0x66, 0xa4, 0xf, 0xe8]);
interface ICredentialProviderUserArray : IUnknown
{
    HRESULT SetProviderFilter(const(GUID)*);
    HRESULT GetAccountOptions(CREDENTIAL_PROVIDER_ACCOUNT_OPTIONS*);
    HRESULT GetCount(uint*);
    HRESULT GetAt(uint, ICredentialProviderUser*);
}
enum IID_ICredentialProviderSetUserArray = GUID(0x95c1484, 0x1c0c, 0x4388, [0x9c, 0x6d, 0x50, 0xe, 0x61, 0xbf, 0x84, 0xbd]);
interface ICredentialProviderSetUserArray : IUnknown
{
    HRESULT SetUserArray(ICredentialProviderUserArray);
}
enum CLSID_SyncMgrClient = GUID(0x1202db60, 0x1dac, 0x42c5, [0xae, 0xd5, 0x1a, 0xbd, 0xd4, 0x32, 0x24, 0x8e]);
struct SyncMgrClient
{
}
enum CLSID_SyncMgrControl = GUID(0x1a1f4206, 0x688, 0x4e7f, [0xbe, 0x3, 0xd8, 0x2e, 0xc6, 0x9d, 0xf9, 0xa5]);
struct SyncMgrControl
{
}
enum CLSID_SyncMgrScheduleWizard = GUID(0x8d8b8e30, 0xc451, 0x421b, [0x85, 0x53, 0xd2, 0x97, 0x6a, 0xfa, 0x64, 0x8c]);
struct SyncMgrScheduleWizard
{
}
enum CLSID_SyncMgrFolder = GUID(0x9c73f5e5, 0x7ae7, 0x4e32, [0xa8, 0xe8, 0x8d, 0x23, 0xb8, 0x52, 0x55, 0xbf]);
struct SyncMgrFolder
{
}
enum CLSID_SyncSetupFolder = GUID(0x2e9e59c0, 0xb437, 0x4981, [0xa6, 0x47, 0x9c, 0x34, 0xb9, 0xb9, 0x8, 0x91]);
struct SyncSetupFolder
{
}
enum CLSID_ConflictFolder = GUID(0x289978ac, 0xa101, 0x4341, [0xa8, 0x17, 0x21, 0xeb, 0xa7, 0xfd, 0x4, 0x6d]);
struct ConflictFolder
{
}
enum CLSID_SyncResultsFolder = GUID(0x71d99464, 0x3b6b, 0x475c, [0xb2, 0x41, 0xe1, 0x58, 0x83, 0x20, 0x75, 0x29]);
struct SyncResultsFolder
{
}
enum CLSID_SimpleConflictPresenter = GUID(0x7a0f6ab7, 0xed84, 0x46b6, [0xb4, 0x7e, 0x2, 0xaa, 0x15, 0x9a, 0x15, 0x2b]);
struct SimpleConflictPresenter
{
}
enum IID_ISyncMgrHandlerCollection = GUID(0xa7f337a3, 0xd20b, 0x45cb, [0x9e, 0xd7, 0x87, 0xd0, 0x94, 0xca, 0x50, 0x45]);
interface ISyncMgrHandlerCollection : IUnknown
{
    HRESULT GetHandlerEnumerator(IEnumString*);
    HRESULT BindToHandler(const(wchar)*, const(GUID)*, void**);
}
alias SYNCMGR_HANDLER_CAPABILITIES = int;
enum : int
{
    SYNCMGR_HCM_NONE                         = 0x00000000,
    SYNCMGR_HCM_PROVIDES_ICON                = 0x00000001,
    SYNCMGR_HCM_EVENT_STORE                  = 0x00000002,
    SYNCMGR_HCM_CONFLICT_STORE               = 0x00000004,
    SYNCMGR_HCM_SUPPORTS_CONCURRENT_SESSIONS = 0x00000010,
    SYNCMGR_HCM_CAN_BROWSE_CONTENT           = 0x00010000,
    SYNCMGR_HCM_CAN_SHOW_SCHEDULE            = 0x00020000,
    SYNCMGR_HCM_QUERY_BEFORE_ACTIVATE        = 0x00100000,
    SYNCMGR_HCM_QUERY_BEFORE_DEACTIVATE      = 0x00200000,
    SYNCMGR_HCM_QUERY_BEFORE_ENABLE          = 0x00400000,
    SYNCMGR_HCM_QUERY_BEFORE_DISABLE         = 0x00800000,
    SYNCMGR_HCM_VALID_MASK                   = 0x00f30017,
}

alias SYNCMGR_HANDLER_POLICIES = int;
enum : int
{
    SYNCMGR_HPM_NONE                 = 0x00000000,
    SYNCMGR_HPM_PREVENT_ACTIVATE     = 0x00000001,
    SYNCMGR_HPM_PREVENT_DEACTIVATE   = 0x00000002,
    SYNCMGR_HPM_PREVENT_ENABLE       = 0x00000004,
    SYNCMGR_HPM_PREVENT_DISABLE      = 0x00000008,
    SYNCMGR_HPM_PREVENT_START_SYNC   = 0x00000010,
    SYNCMGR_HPM_PREVENT_STOP_SYNC    = 0x00000020,
    SYNCMGR_HPM_DISABLE_ENABLE       = 0x00000100,
    SYNCMGR_HPM_DISABLE_DISABLE      = 0x00000200,
    SYNCMGR_HPM_DISABLE_START_SYNC   = 0x00000400,
    SYNCMGR_HPM_DISABLE_STOP_SYNC    = 0x00000800,
    SYNCMGR_HPM_DISABLE_BROWSE       = 0x00001000,
    SYNCMGR_HPM_DISABLE_SCHEDULE     = 0x00002000,
    SYNCMGR_HPM_HIDDEN_BY_DEFAULT    = 0x00010000,
    SYNCMGR_HPM_BACKGROUND_SYNC_ONLY = 0x00000030,
    SYNCMGR_HPM_VALID_MASK           = 0x00012f3f,
}

enum IID_ISyncMgrHandler = GUID(0x4ec2e43, 0xac77, 0x49f9, [0x9b, 0x98, 0x3, 0x7, 0xef, 0x7a, 0x72, 0xa2]);
interface ISyncMgrHandler : IUnknown
{
    HRESULT GetName(PWSTR*);
    HRESULT GetHandlerInfo(ISyncMgrHandlerInfo*);
    HRESULT GetObject(const(GUID)*, const(GUID)*, void**);
    HRESULT GetCapabilities(SYNCMGR_HANDLER_CAPABILITIES*);
    HRESULT GetPolicies(SYNCMGR_HANDLER_POLICIES*);
    HRESULT Activate(BOOL);
    HRESULT Enable(BOOL);
    HRESULT Synchronize(PWSTR*, uint, HWND, ISyncMgrSessionCreator, IUnknown);
}
alias SYNCMGR_HANDLER_TYPE = int;
enum : int
{
    SYNCMGR_HT_UNSPECIFIED = 0x00000000,
    SYNCMGR_HT_APPLICATION = 0x00000001,
    SYNCMGR_HT_DEVICE      = 0x00000002,
    SYNCMGR_HT_FOLDER      = 0x00000003,
    SYNCMGR_HT_SERVICE     = 0x00000004,
    SYNCMGR_HT_COMPUTER    = 0x00000005,
    SYNCMGR_HT_MIN         = 0x00000000,
    SYNCMGR_HT_MAX         = 0x00000005,
}

enum IID_ISyncMgrHandlerInfo = GUID(0x4ff1d798, 0xecf7, 0x4524, [0xaa, 0x81, 0x1e, 0x36, 0x2a, 0xa, 0xef, 0x3a]);
interface ISyncMgrHandlerInfo : IUnknown
{
    HRESULT GetType(SYNCMGR_HANDLER_TYPE*);
    HRESULT GetTypeLabel(PWSTR*);
    HRESULT GetComment(PWSTR*);
    HRESULT GetLastSyncTime(FILETIME*);
    HRESULT IsActive();
    HRESULT IsEnabled();
    HRESULT IsConnected();
}
enum IID_ISyncMgrSyncItemContainer = GUID(0x90701133, 0xbe32, 0x4129, [0xa6, 0x5c, 0x99, 0xe6, 0x16, 0xca, 0xff, 0xf4]);
interface ISyncMgrSyncItemContainer : IUnknown
{
    HRESULT GetSyncItem(const(wchar)*, ISyncMgrSyncItem*);
    HRESULT GetSyncItemEnumerator(IEnumSyncMgrSyncItems*);
    HRESULT GetSyncItemCount(uint*);
}
alias SYNCMGR_ITEM_CAPABILITIES = int;
enum : int
{
    SYNCMGR_ICM_NONE                 = 0x00000000,
    SYNCMGR_ICM_PROVIDES_ICON        = 0x00000001,
    SYNCMGR_ICM_EVENT_STORE          = 0x00000002,
    SYNCMGR_ICM_CONFLICT_STORE       = 0x00000004,
    SYNCMGR_ICM_CAN_DELETE           = 0x00000010,
    SYNCMGR_ICM_CAN_BROWSE_CONTENT   = 0x00010000,
    SYNCMGR_ICM_QUERY_BEFORE_ENABLE  = 0x00100000,
    SYNCMGR_ICM_QUERY_BEFORE_DISABLE = 0x00200000,
    SYNCMGR_ICM_QUERY_BEFORE_DELETE  = 0x00400000,
    SYNCMGR_ICM_VALID_MASK           = 0x00710017,
}

alias SYNCMGR_ITEM_POLICIES = int;
enum : int
{
    SYNCMGR_IPM_NONE               = 0x00000000,
    SYNCMGR_IPM_PREVENT_ENABLE     = 0x00000001,
    SYNCMGR_IPM_PREVENT_DISABLE    = 0x00000002,
    SYNCMGR_IPM_PREVENT_START_SYNC = 0x00000004,
    SYNCMGR_IPM_PREVENT_STOP_SYNC  = 0x00000008,
    SYNCMGR_IPM_DISABLE_ENABLE     = 0x00000010,
    SYNCMGR_IPM_DISABLE_DISABLE    = 0x00000020,
    SYNCMGR_IPM_DISABLE_START_SYNC = 0x00000040,
    SYNCMGR_IPM_DISABLE_STOP_SYNC  = 0x00000080,
    SYNCMGR_IPM_DISABLE_BROWSE     = 0x00000100,
    SYNCMGR_IPM_DISABLE_DELETE     = 0x00000200,
    SYNCMGR_IPM_HIDDEN_BY_DEFAULT  = 0x00010000,
    SYNCMGR_IPM_VALID_MASK         = 0x000102ff,
}

enum IID_ISyncMgrSyncItem = GUID(0xb20b24ce, 0x2593, 0x4f04, [0xbd, 0x8b, 0x7a, 0xd6, 0xc4, 0x50, 0x51, 0xcd]);
interface ISyncMgrSyncItem : IUnknown
{
    HRESULT GetItemID(PWSTR*);
    HRESULT GetName(PWSTR*);
    HRESULT GetItemInfo(ISyncMgrSyncItemInfo*);
    HRESULT GetObject(const(GUID)*, const(GUID)*, void**);
    HRESULT GetCapabilities(SYNCMGR_ITEM_CAPABILITIES*);
    HRESULT GetPolicies(SYNCMGR_ITEM_POLICIES*);
    HRESULT Enable(BOOL);
    HRESULT Delete();
}
enum IID_ISyncMgrSyncItemInfo = GUID(0xe7fd9502, 0xbe0c, 0x4464, [0x90, 0xa1, 0x2b, 0x52, 0x77, 0x3, 0x12, 0x32]);
interface ISyncMgrSyncItemInfo : IUnknown
{
    HRESULT GetTypeLabel(PWSTR*);
    HRESULT GetComment(PWSTR*);
    HRESULT GetLastSyncTime(FILETIME*);
    HRESULT IsEnabled();
    HRESULT IsConnected();
}
enum IID_IEnumSyncMgrSyncItems = GUID(0x54b3abf3, 0xf085, 0x4181, [0xb5, 0x46, 0xe2, 0x9c, 0x40, 0x3c, 0x72, 0x6b]);
interface IEnumSyncMgrSyncItems : IUnknown
{
    HRESULT Next(uint, ISyncMgrSyncItem*, uint*);
    HRESULT Skip(uint);
    HRESULT Reset();
    HRESULT Clone(IEnumSyncMgrSyncItems*);
}
alias SYNCMGR_PROGRESS_STATUS = int;
enum : int
{
    SYNCMGR_PS_UPDATING               = 0x00000001,
    SYNCMGR_PS_UPDATING_INDETERMINATE = 0x00000002,
    SYNCMGR_PS_SUCCEEDED              = 0x00000003,
    SYNCMGR_PS_FAILED                 = 0x00000004,
    SYNCMGR_PS_CANCELED               = 0x00000005,
    SYNCMGR_PS_DISCONNECTED           = 0x00000006,
    SYNCMGR_PS_MAX                    = 0x00000006,
}

alias SYNCMGR_CANCEL_REQUEST = int;
enum : int
{
    SYNCMGR_CR_NONE        = 0x00000000,
    SYNCMGR_CR_CANCEL_ITEM = 0x00000001,
    SYNCMGR_CR_CANCEL_ALL  = 0x00000002,
    SYNCMGR_CR_MAX         = 0x00000002,
}

alias SYNCMGR_EVENT_LEVEL = int;
enum : int
{
    SYNCMGR_EL_INFORMATION = 0x00000001,
    SYNCMGR_EL_WARNING     = 0x00000002,
    SYNCMGR_EL_ERROR       = 0x00000003,
    SYNCMGR_EL_MAX         = 0x00000003,
}

alias SYNCMGR_EVENT_FLAGS = int;
enum : int
{
    SYNCMGR_EF_NONE  = 0x00000000,
    SYNCMGR_EF_VALID = 0x00000000,
}

enum IID_ISyncMgrSessionCreator = GUID(0x17f48517, 0xf305, 0x4321, [0xa0, 0x8d, 0xb2, 0x5a, 0x83, 0x49, 0x18, 0xfd]);
interface ISyncMgrSessionCreator : IUnknown
{
    HRESULT CreateSession(const(wchar)*, PWSTR*, uint, ISyncMgrSyncCallback*);
}
enum IID_ISyncMgrSyncCallback = GUID(0x884ccd87, 0xb139, 0x4937, [0xa4, 0xba, 0x4f, 0x8e, 0x19, 0x51, 0x3f, 0xbe]);
interface ISyncMgrSyncCallback : IUnknown
{
    HRESULT ReportProgress(const(wchar)*, const(wchar)*, SYNCMGR_PROGRESS_STATUS, uint, uint, SYNCMGR_CANCEL_REQUEST*);
    HRESULT SetHandlerProgressText(const(wchar)*, SYNCMGR_CANCEL_REQUEST*);
    HRESULT ReportEvent(const(wchar)*, SYNCMGR_EVENT_LEVEL, SYNCMGR_EVENT_FLAGS, const(wchar)*, const(wchar)*, const(wchar)*, const(wchar)*, const(wchar)*, GUID*);
    HRESULT CanContinue(const(wchar)*);
    HRESULT QueryForAdditionalItems(IEnumString*, IEnumUnknown*);
    HRESULT AddItemToSession(const(wchar)*);
    HRESULT AddIUnknownToSession(IUnknown);
    HRESULT ProposeItem(ISyncMgrSyncItem);
    HRESULT CommitItem(const(wchar)*);
    HRESULT ReportManualSync();
}
enum IID_ISyncMgrUIOperation = GUID(0xfc7cfa47, 0xdfe1, 0x45b5, [0xa0, 0x49, 0x8c, 0xfd, 0x82, 0xbe, 0xc2, 0x71]);
interface ISyncMgrUIOperation : IUnknown
{
    HRESULT Run(HWND);
}
enum IID_ISyncMgrEventLinkUIOperation = GUID(0x64522e52, 0x848b, 0x4015, [0x89, 0xce, 0x5a, 0x36, 0xf0, 0xb, 0x94, 0xff]);
interface ISyncMgrEventLinkUIOperation : ISyncMgrUIOperation
{
    HRESULT Init(const(GUID)*, ISyncMgrEvent);
}
enum IID_ISyncMgrScheduleWizardUIOperation = GUID(0x459a6c84, 0x21d2, 0x4ddc, [0x8a, 0x53, 0xf0, 0x23, 0xa4, 0x60, 0x66, 0xf2]);
interface ISyncMgrScheduleWizardUIOperation : ISyncMgrUIOperation
{
    HRESULT InitWizard(const(wchar)*);
}
enum IID_ISyncMgrSyncResult = GUID(0x2b90f17e, 0x5a3e, 0x4b33, [0xbb, 0x7f, 0x1b, 0xc4, 0x80, 0x56, 0xb9, 0x4d]);
interface ISyncMgrSyncResult : IUnknown
{
    HRESULT Result(SYNCMGR_PROGRESS_STATUS, uint, uint);
}
alias SYNCMGR_CONTROL_FLAGS = int;
enum : int
{
    SYNCMGR_CF_NONE   = 0x00000000,
    SYNCMGR_CF_NOWAIT = 0x00000000,
    SYNCMGR_CF_WAIT   = 0x00000001,
    SYNCMGR_CF_NOUI   = 0x00000002,
    SYNCMGR_CF_VALID  = 0x00000003,
}

alias SYNCMGR_SYNC_CONTROL_FLAGS = int;
enum : int
{
    SYNCMGR_SCF_NONE                      = 0x00000000,
    SYNCMGR_SCF_IGNORE_IF_ALREADY_SYNCING = 0x00000001,
    SYNCMGR_SCF_VALID                     = 0x00000001,
}

alias SYNCMGR_UPDATE_REASON = int;
enum : int
{
    SYNCMGR_UR_ADDED   = 0x00000000,
    SYNCMGR_UR_CHANGED = 0x00000001,
    SYNCMGR_UR_REMOVED = 0x00000002,
    SYNCMGR_UR_MAX     = 0x00000002,
}

enum IID_ISyncMgrControl = GUID(0x9b63616c, 0x36b2, 0x46bc, [0x95, 0x9f, 0xc1, 0x59, 0x39, 0x52, 0xd1, 0x9b]);
interface ISyncMgrControl : IUnknown
{
    HRESULT StartHandlerSync(const(wchar)*, HWND, IUnknown, SYNCMGR_SYNC_CONTROL_FLAGS, ISyncMgrSyncResult);
    HRESULT StartItemSync(const(wchar)*, PWSTR*, uint, HWND, IUnknown, SYNCMGR_SYNC_CONTROL_FLAGS, ISyncMgrSyncResult);
    HRESULT StartSyncAll(HWND);
    HRESULT StopHandlerSync(const(wchar)*);
    HRESULT StopItemSync(const(wchar)*, PWSTR*, uint);
    HRESULT StopSyncAll();
    HRESULT UpdateHandlerCollection(const(GUID)*, SYNCMGR_CONTROL_FLAGS);
    HRESULT UpdateHandler(const(wchar)*, SYNCMGR_CONTROL_FLAGS);
    HRESULT UpdateItem(const(wchar)*, const(wchar)*, SYNCMGR_CONTROL_FLAGS);
    HRESULT UpdateEvents(const(wchar)*, const(wchar)*, SYNCMGR_CONTROL_FLAGS);
    HRESULT UpdateConflict(const(wchar)*, const(wchar)*, ISyncMgrConflict, SYNCMGR_UPDATE_REASON);
    HRESULT UpdateConflicts(const(wchar)*, const(wchar)*, SYNCMGR_CONTROL_FLAGS);
    HRESULT ActivateHandler(BOOL, const(wchar)*, HWND, SYNCMGR_CONTROL_FLAGS);
    HRESULT EnableHandler(BOOL, const(wchar)*, HWND, SYNCMGR_CONTROL_FLAGS);
    HRESULT EnableItem(BOOL, const(wchar)*, const(wchar)*, HWND, SYNCMGR_CONTROL_FLAGS);
}
enum IID_ISyncMgrEventStore = GUID(0x37e412f9, 0x16e, 0x44c2, [0x81, 0xff, 0xdb, 0x3a, 0xdd, 0x77, 0x42, 0x66]);
interface ISyncMgrEventStore : IUnknown
{
    HRESULT GetEventEnumerator(IEnumSyncMgrEvents*);
    HRESULT GetEventCount(uint*);
    HRESULT GetEvent(const(GUID)*, ISyncMgrEvent*);
    HRESULT RemoveEvent(GUID*, uint);
}
enum IID_ISyncMgrEvent = GUID(0xfee0ef8b, 0x46bd, 0x4db4, [0xb7, 0xe6, 0xff, 0x2c, 0x68, 0x73, 0x13, 0xbc]);
interface ISyncMgrEvent : IUnknown
{
    HRESULT GetEventID(GUID*);
    HRESULT GetHandlerID(PWSTR*);
    HRESULT GetItemID(PWSTR*);
    HRESULT GetLevel(SYNCMGR_EVENT_LEVEL*);
    HRESULT GetFlags(SYNCMGR_EVENT_FLAGS*);
    HRESULT GetTime(FILETIME*);
    HRESULT GetName(PWSTR*);
    HRESULT GetDescription(PWSTR*);
    HRESULT GetLinkText(PWSTR*);
    HRESULT GetLinkReference(PWSTR*);
    HRESULT GetContext(PWSTR*);
}
enum IID_IEnumSyncMgrEvents = GUID(0xc81a1d4e, 0x8cf7, 0x4683, [0x80, 0xe0, 0xbc, 0xae, 0x88, 0xd6, 0x77, 0xb6]);
interface IEnumSyncMgrEvents : IUnknown
{
    HRESULT Next(uint, ISyncMgrEvent*, uint*);
    HRESULT Skip(uint);
    HRESULT Reset();
    HRESULT Clone(IEnumSyncMgrEvents*);
}
struct SYNCMGR_CONFLICT_ID_INFO
{
    BYTE_BLOB* pblobID;
    BYTE_BLOB* pblobExtra;
}
enum IID_ISyncMgrConflictStore = GUID(0xcf8fc579, 0xc396, 0x4774, [0x85, 0xf1, 0xd9, 0x8, 0xa8, 0x31, 0x15, 0x6e]);
interface ISyncMgrConflictStore : IUnknown
{
    HRESULT EnumConflicts(const(wchar)*, const(wchar)*, IEnumSyncMgrConflict*);
    HRESULT BindToConflict(const(SYNCMGR_CONFLICT_ID_INFO)*, const(GUID)*, void**);
    HRESULT RemoveConflicts(const(SYNCMGR_CONFLICT_ID_INFO)*, uint);
    HRESULT GetCount(const(wchar)*, const(wchar)*, uint*);
}
enum IID_IEnumSyncMgrConflict = GUID(0x82705914, 0xdda3, 0x4893, [0xba, 0x99, 0x49, 0xde, 0x6c, 0x8c, 0x80, 0x36]);
interface IEnumSyncMgrConflict : IUnknown
{
    HRESULT Next(uint, ISyncMgrConflict*, uint*);
    HRESULT Skip(uint);
    HRESULT Reset();
    HRESULT Clone(IEnumSyncMgrConflict*);
}
alias SYNCMGR_CONFLICT_ITEM_TYPE = int;
enum : int
{
    SYNCMGR_CIT_UPDATED = 0x00000001,
    SYNCMGR_CIT_DELETED = 0x00000002,
}

enum IID_ISyncMgrConflict = GUID(0x9c204249, 0xc443, 0x4ba4, [0x85, 0xed, 0xc9, 0x72, 0x68, 0x1d, 0xb1, 0x37]);
interface ISyncMgrConflict : IUnknown
{
    HRESULT GetProperty(const(PROPERTYKEY)*, PROPVARIANT*);
    HRESULT GetConflictIdInfo(SYNCMGR_CONFLICT_ID_INFO*);
    HRESULT GetItemsArray(ISyncMgrConflictItems*);
    HRESULT Resolve(ISyncMgrConflictResolveInfo);
    HRESULT GetResolutionHandler(const(GUID)*, void**);
}
alias SYNCMGR_RESOLUTION_ABILITIES = int;
enum : int
{
    SYNCMGR_RA_KEEPOTHER         = 0x00000001,
    SYNCMGR_RA_KEEPRECENT        = 0x00000002,
    SYNCMGR_RA_REMOVEFROMSYNCSET = 0x00000004,
    SYNCMGR_RA_KEEP_SINGLE       = 0x00000008,
    SYNCMGR_RA_KEEP_MULTIPLE     = 0x00000010,
    SYNCMGR_RA_VALID             = 0x0000001f,
}

alias SYNCMGR_RESOLUTION_FEEDBACK = int;
enum : int
{
    SYNCMGR_RF_CONTINUE = 0x00000000,
    SYNCMGR_RF_REFRESH  = 0x00000001,
    SYNCMGR_RF_CANCEL   = 0x00000002,
}

enum IID_ISyncMgrResolutionHandler = GUID(0x40a3d052, 0x8bff, 0x4c4b, [0xa3, 0x38, 0xd4, 0xa3, 0x95, 0x70, 0xd, 0xe9]);
interface ISyncMgrResolutionHandler : IUnknown
{
    HRESULT QueryAbilities(uint*);
    HRESULT KeepOther(IShellItem, SYNCMGR_RESOLUTION_FEEDBACK*);
    HRESULT KeepRecent(SYNCMGR_RESOLUTION_FEEDBACK*);
    HRESULT RemoveFromSyncSet(SYNCMGR_RESOLUTION_FEEDBACK*);
    HRESULT KeepItems(ISyncMgrConflictResolutionItems, SYNCMGR_RESOLUTION_FEEDBACK*);
}
enum IID_ISyncMgrConflictPresenter = GUID(0xb4f5353, 0xfd2b, 0x42cd, [0x87, 0x63, 0x47, 0x79, 0xf2, 0xd5, 0x8, 0xa3]);
interface ISyncMgrConflictPresenter : IUnknown
{
    HRESULT PresentConflict(ISyncMgrConflict, ISyncMgrConflictResolveInfo);
}
alias SYNCMGR_PRESENTER_NEXT_STEP = int;
enum : int
{
    SYNCMGR_PNS_CONTINUE = 0x00000000,
    SYNCMGR_PNS_DEFAULT  = 0x00000001,
    SYNCMGR_PNS_CANCEL   = 0x00000002,
}

alias SYNCMGR_PRESENTER_CHOICE = int;
enum : int
{
    SYNCMGR_PC_NO_CHOICE            = 0x00000000,
    SYNCMGR_PC_KEEP_ONE             = 0x00000001,
    SYNCMGR_PC_KEEP_MULTIPLE        = 0x00000002,
    SYNCMGR_PC_KEEP_RECENT          = 0x00000003,
    SYNCMGR_PC_REMOVE_FROM_SYNC_SET = 0x00000004,
    SYNCMGR_PC_SKIP                 = 0x00000005,
}

enum IID_ISyncMgrConflictResolveInfo = GUID(0xc405a219, 0x25a2, 0x442e, [0x87, 0x43, 0xb8, 0x45, 0xa2, 0xce, 0xe9, 0x3f]);
interface ISyncMgrConflictResolveInfo : IUnknown
{
    HRESULT GetIterationInfo(uint*, uint*, uint*);
    HRESULT GetPresenterNextStep(SYNCMGR_PRESENTER_NEXT_STEP*);
    HRESULT GetPresenterChoice(SYNCMGR_PRESENTER_CHOICE*, BOOL*);
    HRESULT GetItemChoiceCount(uint*);
    HRESULT GetItemChoice(uint, uint*);
    HRESULT SetPresenterNextStep(SYNCMGR_PRESENTER_NEXT_STEP);
    HRESULT SetPresenterChoice(SYNCMGR_PRESENTER_CHOICE, BOOL);
    HRESULT SetItemChoices(uint*, uint);
}
enum IID_ISyncMgrConflictFolder = GUID(0x59287f5e, 0xbc81, 0x4fca, [0xa7, 0xf1, 0xe5, 0xa8, 0xec, 0xdb, 0x1d, 0x69]);
interface ISyncMgrConflictFolder : IUnknown
{
    HRESULT GetConflictIDList(ISyncMgrConflict, ITEMIDLIST**);
}
struct CONFIRM_CONFLICT_ITEM
{
    IShellItem2 pShellItem;
    PWSTR pszOriginalName;
    PWSTR pszAlternateName;
    PWSTR pszLocationShort;
    PWSTR pszLocationFull;
    SYNCMGR_CONFLICT_ITEM_TYPE nType;
}
struct CONFIRM_CONFLICT_RESULT_INFO
{
    PWSTR pszNewName;
    uint iItemIndex;
}
enum IID_ISyncMgrConflictItems = GUID(0x9c7ead52, 0x8023, 0x4936, [0xa4, 0xdb, 0xd2, 0xa9, 0xa9, 0x9e, 0x43, 0x6a]);
interface ISyncMgrConflictItems : IUnknown
{
    HRESULT GetCount(uint*);
    HRESULT GetItem(uint, CONFIRM_CONFLICT_ITEM*);
}
enum IID_ISyncMgrConflictResolutionItems = GUID(0x458725b9, 0x129d, 0x4135, [0xa9, 0x98, 0x9c, 0xea, 0xfe, 0xc2, 0x70, 0x7]);
interface ISyncMgrConflictResolutionItems : IUnknown
{
    HRESULT GetCount(uint*);
    HRESULT GetItem(uint, CONFIRM_CONFLICT_RESULT_INFO*);
}
enum CLSID_InputPanelConfiguration = GUID(0x2853add3, 0xf096, 0x4c63, [0xa7, 0x8f, 0x7f, 0xa3, 0xea, 0x83, 0x7f, 0xb7]);
struct InputPanelConfiguration
{
}
enum IID_IInputPanelConfiguration = GUID(0x41c81592, 0x514c, 0x48bd, [0xa2, 0x2e, 0xe6, 0xaf, 0x63, 0x85, 0x21, 0xa6]);
interface IInputPanelConfiguration : IUnknown
{
    HRESULT EnableFocusTracking();
}
enum IID_IInputPanelInvocationConfiguration = GUID(0xa213f136, 0x3b45, 0x4362, [0xa3, 0x32, 0xef, 0xb6, 0x54, 0x7c, 0xd4, 0x32]);
interface IInputPanelInvocationConfiguration : IUnknown
{
    HRESULT RequireTouchInEditControl();
}
enum CLSID_LocalThumbnailCache = GUID(0x50ef4544, 0xac9f, 0x4a8e, [0xb2, 0x1b, 0x8a, 0x26, 0x18, 0xd, 0xb1, 0x3f]);
struct LocalThumbnailCache
{
}
enum CLSID_SharedBitmap = GUID(0x4db26476, 0x6787, 0x4046, [0xb8, 0x36, 0xe8, 0x41, 0x2a, 0x9e, 0x8a, 0x27]);
struct SharedBitmap
{
}
alias WTS_FLAGS = int;
enum : int
{
    WTS_NONE                 = 0x00000000,
    WTS_EXTRACT              = 0x00000000,
    WTS_INCACHEONLY          = 0x00000001,
    WTS_FASTEXTRACT          = 0x00000002,
    WTS_FORCEEXTRACTION      = 0x00000004,
    WTS_SLOWRECLAIM          = 0x00000008,
    WTS_EXTRACTDONOTCACHE    = 0x00000020,
    WTS_SCALETOREQUESTEDSIZE = 0x00000040,
    WTS_SKIPFASTEXTRACT      = 0x00000080,
    WTS_EXTRACTINPROC        = 0x00000100,
    WTS_CROPTOSQUARE         = 0x00000200,
    WTS_INSTANCESURROGATE    = 0x00000400,
    WTS_REQUIRESURROGATE     = 0x00000800,
    WTS_APPSTYLE             = 0x00002000,
    WTS_WIDETHUMBNAILS       = 0x00004000,
    WTS_IDEALCACHESIZEONLY   = 0x00008000,
    WTS_SCALEUP              = 0x00010000,
}

alias WTS_CACHEFLAGS = int;
enum : int
{
    WTS_DEFAULT    = 0x00000000,
    WTS_LOWQUALITY = 0x00000001,
    WTS_CACHED     = 0x00000002,
}

alias WTS_CONTEXTFLAGS = int;
enum : int
{
    WTSCF_DEFAULT  = 0x00000000,
    WTSCF_APPSTYLE = 0x00000001,
    WTSCF_SQUARE   = 0x00000002,
    WTSCF_WIDE     = 0x00000004,
    WTSCF_FAST     = 0x00000008,
}

alias WTS_ALPHATYPE = int;
enum : int
{
    WTSAT_UNKNOWN = 0x00000000,
    WTSAT_RGB     = 0x00000001,
    WTSAT_ARGB    = 0x00000002,
}

struct WTS_THUMBNAILID
{
    ubyte[16] rgbKey;
}
enum IID_ISharedBitmap = GUID(0x91162a4, 0xbc96, 0x411f, [0xaa, 0xe8, 0xc5, 0x12, 0x2c, 0xd0, 0x33, 0x63]);
interface ISharedBitmap : IUnknown
{
    HRESULT GetSharedBitmap(HBITMAP*);
    HRESULT GetSize(SIZE*);
    HRESULT GetFormat(WTS_ALPHATYPE*);
    HRESULT InitializeBitmap(HBITMAP, WTS_ALPHATYPE);
    HRESULT Detach(HBITMAP*);
}
enum IID_IThumbnailCache = GUID(0xf676c15d, 0x596a, 0x4ce2, [0x82, 0x34, 0x33, 0x99, 0x6f, 0x44, 0x5d, 0xb1]);
interface IThumbnailCache : IUnknown
{
    HRESULT GetThumbnail(IShellItem, uint, WTS_FLAGS, ISharedBitmap*, WTS_CACHEFLAGS*, WTS_THUMBNAILID*);
    HRESULT GetThumbnailByID(WTS_THUMBNAILID, uint, ISharedBitmap*, WTS_CACHEFLAGS*);
}
enum IID_IThumbnailProvider = GUID(0xe357fccd, 0xa995, 0x4576, [0xb0, 0x1f, 0x23, 0x46, 0x30, 0x15, 0x4e, 0x96]);
interface IThumbnailProvider : IUnknown
{
    HRESULT GetThumbnail(uint, HBITMAP*, WTS_ALPHATYPE*);
}
enum IID_IThumbnailSettings = GUID(0xf4376f00, 0xbef5, 0x4d45, [0x80, 0xf3, 0x1e, 0x2, 0x3b, 0xbf, 0x12, 0x9]);
interface IThumbnailSettings : IUnknown
{
    HRESULT SetContext(WTS_CONTEXTFLAGS);
}
enum IID_IThumbnailCachePrimer = GUID(0xf03f8fe, 0x2b26, 0x46f0, [0x96, 0x5a, 0x21, 0x2a, 0xa8, 0xd6, 0x6b, 0x76]);
interface IThumbnailCachePrimer : IUnknown
{
    HRESULT PageInThumbnail(IShellItem, WTS_FLAGS, uint);
}
enum CLSID_ShellImageDataFactory = GUID(0x66e4e4fb, 0xf385, 0x4dd0, [0x8d, 0x74, 0xa2, 0xef, 0xd1, 0xbc, 0x61, 0x78]);
struct ShellImageDataFactory
{
}
enum IID_IShellImageDataFactory = GUID(0x9be8ed5c, 0xedab, 0x4d75, [0x90, 0xf3, 0xbd, 0x5b, 0xdb, 0xb2, 0x1c, 0x82]);
interface IShellImageDataFactory : IUnknown
{
    HRESULT CreateIShellImageData(IShellImageData*);
    HRESULT CreateImageFromFile(const(wchar)*, IShellImageData*);
    HRESULT CreateImageFromStream(IStream, IShellImageData*);
    HRESULT GetDataFormatFromPath(const(wchar)*, GUID*);
}
enum IID_IShellImageData = GUID(0xbfdeec12, 0x8040, 0x4403, [0xa5, 0xea, 0x9e, 0x7, 0xda, 0xfc, 0xf5, 0x30]);
interface IShellImageData : IUnknown
{
    HRESULT Decode(uint, uint, uint);
    HRESULT Draw(HDC, RECT*, RECT*);
    HRESULT NextFrame();
    HRESULT NextPage();
    HRESULT PrevPage();
    HRESULT IsTransparent();
    HRESULT IsAnimated();
    HRESULT IsVector();
    HRESULT IsMultipage();
    HRESULT IsEditable();
    HRESULT IsPrintable();
    HRESULT IsDecoded();
    HRESULT GetCurrentPage(uint*);
    HRESULT GetPageCount(uint*);
    HRESULT SelectPage(uint);
    HRESULT GetSize(SIZE*);
    HRESULT GetRawDataFormat(GUID*);
    HRESULT GetPixelFormat(uint*);
    HRESULT GetDelay(uint*);
    HRESULT GetProperties(uint, IPropertySetStorage*);
    HRESULT Rotate(uint);
    HRESULT Scale(uint, uint, uint);
    HRESULT DiscardEdit();
    HRESULT SetEncoderParams(IPropertyBag);
    HRESULT DisplayName(PWSTR, uint);
    HRESULT GetResolution(uint*, uint*);
    HRESULT GetEncoderParams(GUID*, ubyte**);
    HRESULT RegisterAbort(IShellImageDataAbort, IShellImageDataAbort*);
    HRESULT CloneFrame(ubyte**);
    HRESULT ReplaceFrame(ubyte*);
}
enum IID_IShellImageDataAbort = GUID(0x53fb8e58, 0x50c0, 0x4003, [0xb4, 0xaa, 0xc, 0x8d, 0xf2, 0x8e, 0x7f, 0x3a]);
interface IShellImageDataAbort : IUnknown
{
    HRESULT QueryAbort();
}
enum IID_IStorageProviderPropertyHandler = GUID(0x301dfbe5, 0x524c, 0x4b0f, [0x8b, 0x2d, 0x21, 0xc4, 0xb, 0x3a, 0x29, 0x88]);
interface IStorageProviderPropertyHandler : IUnknown
{
    HRESULT RetrieveProperties(const(PROPERTYKEY)*, uint, IPropertyStore*);
    HRESULT SaveProperties(IPropertyStore);
}
enum IID_IStorageProviderHandler = GUID(0x162c6fb5, 0x44d3, 0x435b, [0x90, 0x3d, 0xe6, 0x13, 0xfa, 0x9, 0x3f, 0xb5]);
interface IStorageProviderHandler : IUnknown
{
    HRESULT GetPropertyHandlerFromPath(const(wchar)*, IStorageProviderPropertyHandler*);
    HRESULT GetPropertyHandlerFromUri(const(wchar)*, IStorageProviderPropertyHandler*);
    HRESULT GetPropertyHandlerFromFileId(const(wchar)*, IStorageProviderPropertyHandler*);
}
enum CLSID_SyncMgr = GUID(0x6295df27, 0x35ee, 0x11d1, [0x87, 0x7, 0x0, 0xc0, 0x4f, 0xd9, 0x33, 0x27]);
struct SyncMgr
{
}
alias SYNCMGRSTATUS = int;
enum : int
{
    SYNCMGRSTATUS_STOPPED                = 0x00000000,
    SYNCMGRSTATUS_SKIPPED                = 0x00000001,
    SYNCMGRSTATUS_PENDING                = 0x00000002,
    SYNCMGRSTATUS_UPDATING               = 0x00000003,
    SYNCMGRSTATUS_SUCCEEDED              = 0x00000004,
    SYNCMGRSTATUS_FAILED                 = 0x00000005,
    SYNCMGRSTATUS_PAUSED                 = 0x00000006,
    SYNCMGRSTATUS_RESUMING               = 0x00000007,
    SYNCMGRSTATUS_UPDATING_INDETERMINATE = 0x00000008,
    SYNCMGRSTATUS_DELETED                = 0x00000100,
}

struct SYNCMGRPROGRESSITEM
{
    uint cbSize;
    uint mask;
    const(wchar)* lpcStatusText;
    uint dwStatusType;
    int iProgValue;
    int iMaxValue;
}
alias SYNCMGRLOGLEVEL = int;
enum : int
{
    SYNCMGRLOGLEVEL_INFORMATION = 0x00000001,
    SYNCMGRLOGLEVEL_WARNING     = 0x00000002,
    SYNCMGRLOGLEVEL_ERROR       = 0x00000003,
    SYNCMGRLOGLEVEL_LOGLEVELMAX = 0x00000003,
}

alias SYNCMGRERRORFLAGS = int;
enum : int
{
    SYNCMGRERRORFLAG_ENABLEJUMPTEXT = 0x00000001,
}

struct SYNCMGRLOGERRORINFO
{
    uint cbSize;
    uint mask;
    uint dwSyncMgrErrorFlags;
    GUID ErrorID;
    GUID ItemID;
}
enum IID_ISyncMgrSynchronizeCallback = GUID(0x6295df41, 0x35ee, 0x11d1, [0x87, 0x7, 0x0, 0xc0, 0x4f, 0xd9, 0x33, 0x27]);
interface ISyncMgrSynchronizeCallback : IUnknown
{
    HRESULT ShowPropertiesCompleted(HRESULT);
    HRESULT PrepareForSyncCompleted(HRESULT);
    HRESULT SynchronizeCompleted(HRESULT);
    HRESULT ShowErrorCompleted(HRESULT, uint, const(GUID)*);
    HRESULT EnableModeless(BOOL);
    HRESULT Progress(const(GUID)*, const(SYNCMGRPROGRESSITEM)*);
    HRESULT LogError(uint, const(wchar)*, const(SYNCMGRLOGERRORINFO)*);
    HRESULT DeleteLogError(const(GUID)*, uint);
    HRESULT EstablishConnection(const(wchar)*, uint);
}
alias SYNCMGRITEMFLAGS = int;
enum : int
{
    SYNCMGRITEM_HASPROPERTIES  = 0x00000001,
    SYNCMGRITEM_TEMPORARY      = 0x00000002,
    SYNCMGRITEM_ROAMINGUSER    = 0x00000004,
    SYNCMGRITEM_LASTUPDATETIME = 0x00000008,
    SYNCMGRITEM_MAYDELETEITEM  = 0x00000010,
    SYNCMGRITEM_HIDDEN         = 0x00000020,
}

struct SYNCMGRITEM
{
    uint cbSize;
    uint dwFlags;
    GUID ItemID;
    uint dwItemState;
    HICON hIcon;
    wchar[128] wszItemName;
    FILETIME ftLastUpdate;
}
enum IID_ISyncMgrEnumItems = GUID(0x6295df2a, 0x35ee, 0x11d1, [0x87, 0x7, 0x0, 0xc0, 0x4f, 0xd9, 0x33, 0x27]);
interface ISyncMgrEnumItems : IUnknown
{
    HRESULT Next(uint, SYNCMGRITEM*, uint*);
    HRESULT Skip(uint);
    HRESULT Reset();
    HRESULT Clone(ISyncMgrEnumItems*);
}
alias SYNCMGRFLAG = int;
enum : int
{
    SYNCMGRFLAG_CONNECT           = 0x00000001,
    SYNCMGRFLAG_PENDINGDISCONNECT = 0x00000002,
    SYNCMGRFLAG_MANUAL            = 0x00000003,
    SYNCMGRFLAG_IDLE              = 0x00000004,
    SYNCMGRFLAG_INVOKE            = 0x00000005,
    SYNCMGRFLAG_SCHEDULED         = 0x00000006,
    SYNCMGRFLAG_EVENTMASK         = 0x000000ff,
    SYNCMGRFLAG_SETTINGS          = 0x00000100,
    SYNCMGRFLAG_MAYBOTHERUSER     = 0x00000200,
}

alias SYNCMGRHANDLERFLAGS = int;
enum : int
{
    SYNCMGRHANDLER_HASPROPERTIES          = 0x00000001,
    SYNCMGRHANDLER_MAYESTABLISHCONNECTION = 0x00000002,
    SYNCMGRHANDLER_ALWAYSLISTHANDLER      = 0x00000004,
    SYNCMGRHANDLER_HIDDEN                 = 0x00000008,
}

struct SYNCMGRHANDLERINFO
{
    uint cbSize;
    HICON hIcon;
    uint SyncMgrHandlerFlags;
    wchar[32] wszHandlerName;
}
alias SYNCMGRITEMSTATE = int;
enum : int
{
    SYNCMGRITEMSTATE_UNCHECKED = 0x00000000,
    SYNCMGRITEMSTATE_CHECKED   = 0x00000001,
}

enum IID_ISyncMgrSynchronize = GUID(0x6295df40, 0x35ee, 0x11d1, [0x87, 0x7, 0x0, 0xc0, 0x4f, 0xd9, 0x33, 0x27]);
interface ISyncMgrSynchronize : IUnknown
{
    HRESULT Initialize(uint, uint, uint, const(ubyte)*);
    HRESULT GetHandlerInfo(SYNCMGRHANDLERINFO**);
    HRESULT EnumSyncMgrItems(ISyncMgrEnumItems*);
    HRESULT GetItemObject(const(GUID)*, const(GUID)*, void**);
    HRESULT ShowProperties(HWND, const(GUID)*);
    HRESULT SetProgressCallback(ISyncMgrSynchronizeCallback);
    HRESULT PrepareForSync(uint, GUID*, HWND, uint);
    HRESULT Synchronize(HWND);
    HRESULT SetItemStatus(const(GUID)*, uint);
    HRESULT ShowError(HWND, const(GUID)*);
}
alias SYNCMGRINVOKEFLAGS = int;
enum : int
{
    SYNCMGRINVOKE_STARTSYNC = 0x00000002,
    SYNCMGRINVOKE_MINIMIZED = 0x00000004,
}

enum IID_ISyncMgrSynchronizeInvoke = GUID(0x6295df2c, 0x35ee, 0x11d1, [0x87, 0x7, 0x0, 0xc0, 0x4f, 0xd9, 0x33, 0x27]);
interface ISyncMgrSynchronizeInvoke : IUnknown
{
    HRESULT UpdateItems(uint, const(GUID)*, uint, const(ubyte)*);
    HRESULT UpdateAll();
}
alias SYNCMGRREGISTERFLAGS = int;
enum : int
{
    SYNCMGRREGISTERFLAG_CONNECT           = 0x00000001,
    SYNCMGRREGISTERFLAG_PENDINGDISCONNECT = 0x00000002,
    SYNCMGRREGISTERFLAG_IDLE              = 0x00000004,
}

enum IID_ISyncMgrRegister = GUID(0x6295df42, 0x35ee, 0x11d1, [0x87, 0x7, 0x0, 0xc0, 0x4f, 0xd9, 0x33, 0x27]);
interface ISyncMgrRegister : IUnknown
{
    HRESULT RegisterSyncMgrHandler(const(GUID)*, const(wchar)*, uint);
    HRESULT UnregisterSyncMgrHandler(const(GUID)*, uint);
    HRESULT GetHandlerRegistrationInfo(const(GUID)*, uint*);
}
enum CLSID_ThumbnailStreamCache = GUID(0xcbe0fed3, 0x4b91, 0x4e90, [0x83, 0x54, 0x8a, 0x8c, 0x84, 0xec, 0x68, 0x72]);
struct ThumbnailStreamCache
{
}
alias ThumbnailStreamCacheOptions = int;
enum : int
{
    ExtractIfNotCached = 0x00000000,
    ReturnOnlyIfCached = 0x00000001,
    ResizeThumbnail    = 0x00000002,
    AllowSmallerSize   = 0x00000004,
}

enum IID_IThumbnailStreamCache = GUID(0x90e11430, 0x9569, 0x41d8, [0xae, 0x75, 0x6d, 0x4d, 0x2a, 0xe7, 0xcc, 0xa0]);
interface IThumbnailStreamCache : IUnknown
{
    HRESULT GetThumbnailStream(const(wchar)*, ulong, ThumbnailStreamCacheOptions, uint, SIZE*, IStream*);
    HRESULT SetThumbnailStream(const(wchar)*, ulong, SIZE, IStream);
}
enum CLSID_TrackShellMenu = GUID(0x8278f931, 0x2a3e, 0x11d2, [0x83, 0x8f, 0x0, 0xc0, 0x4f, 0xd9, 0x18, 0xd0]);
struct TrackShellMenu
{
}
struct WINDOWDATA
{
    uint dwWindowID;
    uint uiCP;
    ITEMIDLIST* pidl;
    PWSTR lpszUrl;
    PWSTR lpszUrlLocation;
    PWSTR lpszTitle;
}
enum IID_ITravelLogEntry = GUID(0x7ebfdd87, 0xad18, 0x11d3, [0xa4, 0xc5, 0x0, 0xc0, 0x4f, 0x72, 0xd6, 0xb8]);
interface ITravelLogEntry : IUnknown
{
    HRESULT GetTitle(PWSTR*);
    HRESULT GetURL(PWSTR*);
}
enum IID_ITravelLogClient = GUID(0x241c033e, 0xe659, 0x43da, [0xaa, 0x4d, 0x40, 0x86, 0xdb, 0xc4, 0x75, 0x8d]);
interface ITravelLogClient : IUnknown
{
    HRESULT FindWindowByIndex(uint, IUnknown*);
    HRESULT GetWindowData(IStream, WINDOWDATA*);
    HRESULT LoadHistoryPosition(PWSTR, uint);
}
enum IID_IEnumTravelLogEntry = GUID(0x7ebfdd85, 0xad18, 0x11d3, [0xa4, 0xc5, 0x0, 0xc0, 0x4f, 0x72, 0xd6, 0xb8]);
interface IEnumTravelLogEntry : IUnknown
{
    HRESULT Next(uint, ITravelLogEntry*, uint*);
    HRESULT Skip(uint);
    HRESULT Reset();
    HRESULT Clone(IEnumTravelLogEntry*);
}
alias TLENUMF = int;
enum : int
{
    TLEF_RELATIVE_INCLUDE_CURRENT = 0x00000001,
    TLEF_RELATIVE_BACK            = 0x00000010,
    TLEF_RELATIVE_FORE            = 0x00000020,
    TLEF_INCLUDE_UNINVOKEABLE     = 0x00000040,
    TLEF_ABSOLUTE                 = 0x00000031,
    TLEF_EXCLUDE_SUBFRAME_ENTRIES = 0x00000080,
    TLEF_EXCLUDE_ABOUT_PAGES      = 0x00000100,
}

enum IID_ITravelLogStg = GUID(0x7ebfdd80, 0xad18, 0x11d3, [0xa4, 0xc5, 0x0, 0xc0, 0x4f, 0x72, 0xd6, 0xb8]);
interface ITravelLogStg : IUnknown
{
    HRESULT CreateEntry(const(wchar)*, const(wchar)*, ITravelLogEntry, BOOL, ITravelLogEntry*);
    HRESULT TravelTo(ITravelLogEntry);
    HRESULT EnumEntries(TLENUMF, IEnumTravelLogEntry*);
    HRESULT FindEntries(TLENUMF, const(wchar)*, IEnumTravelLogEntry*);
    HRESULT GetCount(TLENUMF, uint*);
    HRESULT RemoveEntry(ITravelLogEntry);
    HRESULT GetRelativeEntry(int, ITravelLogEntry*);
}
alias _HLSR_NOREDEF10 = int;
enum : int
{
    HLSR_HOME          = 0x00000000,
    HLSR_SEARCHPAGE    = 0x00000001,
    HLSR_HISTORYFOLDER = 0x00000002,
}

alias _HLSHORTCUTF__NOREDEF10 = int;
enum : int
{
    HLSHORTCUTF_DEFAULT                     = 0x00000000,
    HLSHORTCUTF_DONTACTUALLYCREATE          = 0x00000001,
    HLSHORTCUTF_USEFILENAMEFROMFRIENDLYNAME = 0x00000002,
    HLSHORTCUTF_USEUNIQUEFILENAME           = 0x00000004,
    HLSHORTCUTF_MAYUSEEXISTINGSHORTCUT      = 0x00000008,
}

alias _HLTRANSLATEF_NOREDEF10 = int;
enum : int
{
    HLTRANSLATEF_DEFAULT                = 0x00000000,
    HLTRANSLATEF_DONTAPPLYDEFAULTPREFIX = 0x00000001,
}

alias HLNF = uint;
enum : uint
{
    HLNF_INTERNALJUMP          = 0x00000001,
    HLNF_OPENINNEWWINDOW       = 0x00000002,
    HLNF_NAVIGATINGBACK        = 0x00000004,
    HLNF_NAVIGATINGFORWARD     = 0x00000008,
    HLNF_NAVIGATINGTOSTACKITEM = 0x00000010,
    HLNF_CREATENOHISTORY       = 0x00000020,
}

alias HLINKGETREF = int;
enum : int
{
    HLINKGETREF_DEFAULT  = 0x00000000,
    HLINKGETREF_ABSOLUTE = 0x00000001,
    HLINKGETREF_RELATIVE = 0x00000002,
}

alias HLFNAMEF = uint;
enum : uint
{
    HLFNAMEF_DEFAULT          = 0x00000000,
    HLFNAMEF_TRYCACHE         = 0x00000001,
    HLFNAMEF_TRYPRETTYTARGET  = 0x00000002,
    HLFNAMEF_TRYFULLTARGET    = 0x00000004,
    HLFNAMEF_TRYWIN95SHORTCUT = 0x00000008,
}

alias HLINKMISC = int;
enum : int
{
    HLINKMISC_RELATIVE = 0x00000001,
}

alias HLINKSETF = int;
enum : int
{
    HLINKSETF_TARGET   = 0x00000001,
    HLINKSETF_LOCATION = 0x00000002,
}

enum IID_IHlink = GUID(0x79eac9c3, 0xbaf9, 0x11ce, [0x8c, 0x82, 0x0, 0xaa, 0x0, 0x4b, 0xa9, 0xb]);
interface IHlink : IUnknown
{
    HRESULT SetHlinkSite(IHlinkSite, uint);
    HRESULT GetHlinkSite(IHlinkSite*, uint*);
    HRESULT SetMonikerReference(uint, IMoniker, const(wchar)*);
    HRESULT GetMonikerReference(uint, IMoniker*, PWSTR*);
    HRESULT SetStringReference(uint, const(wchar)*, const(wchar)*);
    HRESULT GetStringReference(uint, PWSTR*, PWSTR*);
    HRESULT SetFriendlyName(const(wchar)*);
    HRESULT GetFriendlyName(uint, PWSTR*);
    HRESULT SetTargetFrameName(const(wchar)*);
    HRESULT GetTargetFrameName(PWSTR*);
    HRESULT GetMiscStatus(uint*);
    HRESULT Navigate(uint, IBindCtx, IBindStatusCallback, IHlinkBrowseContext);
    HRESULT SetAdditionalParams(const(wchar)*);
    HRESULT GetAdditionalParams(PWSTR*);
}
alias HLINKWHICHMK = int;
enum : int
{
    HLINKWHICHMK_CONTAINER = 0x00000001,
    HLINKWHICHMK_BASE      = 0x00000002,
}

enum IID_IHlinkSite = GUID(0x79eac9c2, 0xbaf9, 0x11ce, [0x8c, 0x82, 0x0, 0xaa, 0x0, 0x4b, 0xa9, 0xb]);
interface IHlinkSite : IUnknown
{
    HRESULT QueryService(uint, const(GUID)*, const(GUID)*, IUnknown*);
    HRESULT GetMoniker(uint, uint, uint, IMoniker*);
    HRESULT ReadyToNavigate(uint, uint);
    HRESULT OnNavigationComplete(uint, uint, HRESULT, const(wchar)*);
}
enum IID_IHlinkTarget = GUID(0x79eac9c4, 0xbaf9, 0x11ce, [0x8c, 0x82, 0x0, 0xaa, 0x0, 0x4b, 0xa9, 0xb]);
interface IHlinkTarget : IUnknown
{
    HRESULT SetBrowseContext(IHlinkBrowseContext);
    HRESULT GetBrowseContext(IHlinkBrowseContext*);
    HRESULT Navigate(uint, const(wchar)*);
    HRESULT GetMoniker(const(wchar)*, uint, IMoniker*);
    HRESULT GetFriendlyName(const(wchar)*, PWSTR*);
}
enum IID_IHlinkFrame = GUID(0x79eac9c5, 0xbaf9, 0x11ce, [0x8c, 0x82, 0x0, 0xaa, 0x0, 0x4b, 0xa9, 0xb]);
interface IHlinkFrame : IUnknown
{
    HRESULT SetBrowseContext(IHlinkBrowseContext);
    HRESULT GetBrowseContext(IHlinkBrowseContext*);
    HRESULT Navigate(uint, IBindCtx, IBindStatusCallback, IHlink);
    HRESULT OnNavigate(uint, IMoniker, const(wchar)*, const(wchar)*, uint);
    HRESULT UpdateHlink(uint, IMoniker, const(wchar)*, const(wchar)*);
}
struct HLITEM
{
    uint uHLID;
    PWSTR pwzFriendlyName;
}
enum IID_IEnumHLITEM = GUID(0x79eac9c6, 0xbaf9, 0x11ce, [0x8c, 0x82, 0x0, 0xaa, 0x0, 0x4b, 0xa9, 0xb]);
interface IEnumHLITEM : IUnknown
{
    HRESULT Next(uint, HLITEM*, uint*);
    HRESULT Skip(uint);
    HRESULT Reset();
    HRESULT Clone(IEnumHLITEM*);
}
alias HLTB_INFO = int;
enum : int
{
    HLTB_DOCKEDLEFT   = 0x00000000,
    HLTB_DOCKEDTOP    = 0x00000001,
    HLTB_DOCKEDRIGHT  = 0x00000002,
    HLTB_DOCKEDBOTTOM = 0x00000003,
    HLTB_FLOATING     = 0x00000004,
}

struct HLTBINFO
{
    uint uDockType;
    RECT rcTbPos;
}
alias HLBWIF_FLAGS = uint;
enum : uint
{
    HLBWIF_HASFRAMEWNDINFO   = 0x00000001,
    HLBWIF_HASDOCWNDINFO     = 0x00000002,
    HLBWIF_FRAMEWNDMAXIMIZED = 0x00000004,
    HLBWIF_DOCWNDMAXIMIZED   = 0x00000008,
    HLBWIF_HASWEBTOOLBARINFO = 0x00000010,
    HLBWIF_WEBTOOLBARHIDDEN  = 0x00000020,
}

struct HLBWINFO
{
    uint cbSize;
    uint grfHLBWIF;
    RECT rcFramePos;
    RECT rcDocPos;
    HLTBINFO hltbinfo;
}
alias HLID_INFO = uint;
enum : uint
{
    HLID_INVALID     = 0x00000000,
    HLID_PREVIOUS    = 0xffffffff,
    HLID_NEXT        = 0xfffffffe,
    HLID_CURRENT     = 0xfffffffd,
    HLID_STACKBOTTOM = 0xfffffffc,
    HLID_STACKTOP    = 0xfffffffb,
}

alias HLQF_INFO = int;
enum : int
{
    HLQF_ISVALID   = 0x00000001,
    HLQF_ISCURRENT = 0x00000002,
}

enum IID_IHlinkBrowseContext = GUID(0x79eac9c7, 0xbaf9, 0x11ce, [0x8c, 0x82, 0x0, 0xaa, 0x0, 0x4b, 0xa9, 0xb]);
interface IHlinkBrowseContext : IUnknown
{
    HRESULT Register(uint, IUnknown, IMoniker, uint*);
    HRESULT GetObject(IMoniker, BOOL, IUnknown*);
    HRESULT Revoke(uint);
    HRESULT SetBrowseWindowInfo(HLBWINFO*);
    HRESULT GetBrowseWindowInfo(HLBWINFO*);
    HRESULT SetInitialHlink(IMoniker, const(wchar)*, const(wchar)*);
    HRESULT OnNavigateHlink(uint, IMoniker, const(wchar)*, const(wchar)*, uint*);
    HRESULT UpdateHlink(uint, IMoniker, const(wchar)*, const(wchar)*);
    HRESULT EnumNavigationStack(uint, uint, IEnumHLITEM*);
    HRESULT QueryHlink(uint, uint);
    HRESULT GetHlink(uint, IHlink*);
    HRESULT SetCurrentHlink(uint);
    HRESULT Clone(IUnknown, const(GUID)*, IUnknown*);
    HRESULT Close(uint);
}
enum IID_IExtensionServices = GUID(0x79eac9cb, 0xbaf9, 0x11ce, [0x8c, 0x82, 0x0, 0xaa, 0x0, 0x4b, 0xa9, 0xb]);
interface IExtensionServices : IUnknown
{
    HRESULT SetAdditionalHeaders(const(wchar)*);
    HRESULT SetAuthenticateData(HWND, const(wchar)*, const(wchar)*);
}
enum IID_ITravelEntry = GUID(0xf46edb3b, 0xbc2f, 0x11d0, [0x94, 0x12, 0x0, 0xaa, 0x0, 0xa3, 0xeb, 0xd3]);
interface ITravelEntry : IUnknown
{
    HRESULT Invoke(IUnknown);
    HRESULT Update(IUnknown, BOOL);
    HRESULT GetPidl(ITEMIDLIST**);
}
enum IID_ITravelLog = GUID(0x66a9cb08, 0x4802, 0x11d2, [0xa5, 0x61, 0x0, 0xa0, 0xc9, 0x2d, 0xbf, 0xe8]);
interface ITravelLog : IUnknown
{
    HRESULT AddEntry(IUnknown, BOOL);
    HRESULT UpdateEntry(IUnknown, BOOL);
    HRESULT UpdateExternal(IUnknown, IUnknown);
    HRESULT Travel(IUnknown, int);
    HRESULT GetTravelEntry(IUnknown, int, ITravelEntry*);
    HRESULT FindTravelEntry(IUnknown, ITEMIDLIST*, ITravelEntry*);
    HRESULT GetToolTipText(IUnknown, int, int, PWSTR, uint);
    HRESULT InsertMenuEntries(IUnknown, HMENU, int, int, int, uint);
    HRESULT Clone(ITravelLog*);
    uint CountEntries(IUnknown);
    HRESULT Revert();
}
// [Not Found] IID_CIE4ConnectionPoint
interface CIE4ConnectionPoint : IConnectionPoint
{
    HRESULT DoInvokeIE4(BOOL*, void**, int, DISPPARAMS*);
    HRESULT DoInvokePIDLIE4(int, ITEMIDLIST*, BOOL);
}
enum IID_IExpDispSupportXP = GUID(0x2f0dd58c, 0xf789, 0x4f14, [0x99, 0xfb, 0x92, 0x93, 0xb3, 0xc9, 0xc2, 0x12]);
interface IExpDispSupportXP : IUnknown
{
    HRESULT FindCIE4ConnectionPoint(const(GUID)*, CIE4ConnectionPoint*);
    HRESULT OnTranslateAccelerator(MSG*, uint);
    HRESULT OnInvoke(int, const(GUID)*, uint, ushort, DISPPARAMS*, VARIANT*, EXCEPINFO*, uint*);
}
enum IID_IExpDispSupport = GUID(0xd7d1d00, 0x6fc0, 0x11d0, [0xa9, 0x74, 0x0, 0xc0, 0x4f, 0xd7, 0x5, 0xa2]);
interface IExpDispSupport : IUnknown
{
    HRESULT FindConnectionPoint(const(GUID)*, IConnectionPoint*);
    HRESULT OnTranslateAccelerator(MSG*, uint);
    HRESULT OnInvoke(int, const(GUID)*, uint, ushort, DISPPARAMS*, VARIANT*, EXCEPINFO*, uint*);
}
alias BNSTATE = int;
enum : int
{
    BNS_NORMAL         = 0x00000000,
    BNS_BEGIN_NAVIGATE = 0x00000001,
    BNS_NAVIGATE       = 0x00000002,
}

alias SHELLBROWSERSHOWCONTROL = int;
enum : int
{
    SBSC_HIDE   = 0x00000000,
    SBSC_SHOW   = 0x00000001,
    SBSC_TOGGLE = 0x00000002,
    SBSC_QUERY  = 0x00000003,
}

enum IID_IBrowserService = GUID(0x2ba3b52, 0x547, 0x11d1, [0xb8, 0x33, 0x0, 0xc0, 0x4f, 0xc9, 0xb3, 0x1f]);
interface IBrowserService : IUnknown
{
    HRESULT GetParentSite(IOleInPlaceSite*);
    HRESULT SetTitle(IShellView, const(wchar)*);
    HRESULT GetTitle(IShellView, PWSTR, uint);
    HRESULT GetOleObject(IOleObject*);
    HRESULT GetTravelLog(ITravelLog*);
    HRESULT ShowControlWindow(uint, BOOL);
    HRESULT IsControlWindowShown(uint, BOOL*);
    HRESULT IEGetDisplayName(ITEMIDLIST*, PWSTR, uint);
    HRESULT IEParseDisplayName(uint, const(wchar)*, ITEMIDLIST**);
    HRESULT DisplayParseError(HRESULT, const(wchar)*);
    HRESULT NavigateToPidl(ITEMIDLIST*, uint);
    HRESULT SetNavigateState(BNSTATE);
    HRESULT GetNavigateState(BNSTATE*);
    HRESULT NotifyRedirect(IShellView, ITEMIDLIST*, BOOL*);
    HRESULT UpdateWindowList();
    HRESULT UpdateBackForwardState();
    HRESULT SetFlags(uint, uint);
    HRESULT GetFlags(uint*);
    HRESULT CanNavigateNow();
    HRESULT GetPidl(ITEMIDLIST**);
    HRESULT SetReferrer(ITEMIDLIST*);
    uint GetBrowserIndex();
    HRESULT GetBrowserByIndex(uint, IUnknown*);
    HRESULT GetHistoryObject(IOleObject*, IStream*, IBindCtx*);
    HRESULT SetHistoryObject(IOleObject, BOOL);
    HRESULT CacheOLEServer(IOleObject);
    HRESULT GetSetCodePage(VARIANT*, VARIANT*);
    HRESULT OnHttpEquiv(IShellView, BOOL, VARIANT*, VARIANT*);
    HRESULT GetPalette(HPALETTE*);
    HRESULT RegisterWindow(BOOL, int);
}
enum IID_IShellService = GUID(0x5836fb00, 0x8187, 0x11cf, [0xa1, 0x2b, 0x0, 0xaa, 0x0, 0x4a, 0xe8, 0x37]);
interface IShellService : IUnknown
{
    HRESULT SetOwner(IUnknown);
}
alias SECURELOCKCODE = int;
enum : int
{
    SECURELOCK_NOCHANGE                 = 0xffffffff,
    SECURELOCK_SET_UNSECURE             = 0x00000000,
    SECURELOCK_SET_MIXED                = 0x00000001,
    SECURELOCK_SET_SECUREUNKNOWNBIT     = 0x00000002,
    SECURELOCK_SET_SECURE40BIT          = 0x00000003,
    SECURELOCK_SET_SECURE56BIT          = 0x00000004,
    SECURELOCK_SET_FORTEZZA             = 0x00000005,
    SECURELOCK_SET_SECURE128BIT         = 0x00000006,
    SECURELOCK_FIRSTSUGGEST             = 0x00000007,
    SECURELOCK_SUGGEST_UNSECURE         = 0x00000007,
    SECURELOCK_SUGGEST_MIXED            = 0x00000008,
    SECURELOCK_SUGGEST_SECUREUNKNOWNBIT = 0x00000009,
    SECURELOCK_SUGGEST_SECURE40BIT      = 0x0000000a,
    SECURELOCK_SUGGEST_SECURE56BIT      = 0x0000000b,
    SECURELOCK_SUGGEST_FORTEZZA         = 0x0000000c,
    SECURELOCK_SUGGEST_SECURE128BIT     = 0x0000000d,
}

struct BASEBROWSERDATAXP
{
    HWND _hwnd;
    ITravelLog _ptl;
    IHlinkFrame _phlf;
    IWebBrowser2 _pautoWB2;
    IExpDispSupportXP _pautoEDS;
    IShellService _pautoSS;
    int _eSecureLockIcon;
    uint _bitfield0;
    uint _uActivateState;
    ITEMIDLIST* _pidlViewState;
    IOleCommandTarget _pctView;
    ITEMIDLIST* _pidlCur;
    IShellView _psv;
    IShellFolder _psf;
    HWND _hwndView;
    PWSTR _pszTitleCur;
    ITEMIDLIST* _pidlPending;
    IShellView _psvPending;
    IShellFolder _psfPending;
    HWND _hwndViewPending;
    PWSTR _pszTitlePending;
    BOOL _fIsViewMSHTML;
    BOOL _fPrivacyImpacted;
    GUID _clsidView;
    GUID _clsidViewPending;
    HWND _hwndFrame;
}
struct BASEBROWSERDATALH
{
    HWND _hwnd;
    ITravelLog _ptl;
    IHlinkFrame _phlf;
    IWebBrowser2 _pautoWB2;
    IExpDispSupport _pautoEDS;
    IShellService _pautoSS;
    int _eSecureLockIcon;
    uint _bitfield0;
    uint _uActivateState;
    ITEMIDLIST* _pidlViewState;
    IOleCommandTarget _pctView;
    ITEMIDLIST* _pidlCur;
    IShellView _psv;
    IShellFolder _psf;
    HWND _hwndView;
    PWSTR _pszTitleCur;
    ITEMIDLIST* _pidlPending;
    IShellView _psvPending;
    IShellFolder _psfPending;
    HWND _hwndViewPending;
    PWSTR _pszTitlePending;
    BOOL _fIsViewMSHTML;
    BOOL _fPrivacyImpacted;
    GUID _clsidView;
    GUID _clsidViewPending;
    HWND _hwndFrame;
    int _lPhishingFilterStatus;
}
struct FOLDERSETDATA
{
    FOLDERSETTINGS _fs;
    GUID _vidRestore;
    uint _dwViewPriority;
}
struct TOOLBARITEM
{
    IDockingWindow ptbar;
    RECT rcBorderTool;
    PWSTR pwszItem;
    BOOL fShow;
    HMONITOR hMon;
}
enum IID_IBrowserService2 = GUID(0x68bd21cc, 0x438b, 0x11d2, [0xa5, 0x60, 0x0, 0xa0, 0xc9, 0x2d, 0xbf, 0xe8]);
interface IBrowserService2 : IBrowserService
{
    LRESULT WndProcBS(HWND, uint, WPARAM, LPARAM);
    HRESULT SetAsDefFolderSettings();
    HRESULT GetViewRect(RECT*);
    HRESULT OnSize(WPARAM);
    HRESULT OnCreate(CREATESTRUCTW*);
    LRESULT OnCommand(WPARAM, LPARAM);
    HRESULT OnDestroy();
    LRESULT OnNotify(NMHDR*);
    HRESULT OnSetFocus();
    HRESULT OnFrameWindowActivateBS(BOOL);
    HRESULT ReleaseShellView();
    HRESULT ActivatePendingView();
    HRESULT CreateViewWindow(IShellView, IShellView, RECT*, HWND*);
    HRESULT CreateBrowserPropSheetExt(const(GUID)*, void**);
    HRESULT GetViewWindow(HWND*);
    HRESULT GetBaseBrowserData(BASEBROWSERDATALH**);
    BASEBROWSERDATALH* PutBaseBrowserData();
    HRESULT InitializeTravelLog(ITravelLog, uint);
    HRESULT SetTopBrowser();
    HRESULT Offline(int);
    HRESULT AllowViewResize(BOOL);
    HRESULT SetActivateState(uint);
    HRESULT UpdateSecureLockIcon(int);
    HRESULT InitializeDownloadManager();
    HRESULT InitializeTransitionSite();
    HRESULT _Initialize(HWND, IUnknown);
    HRESULT _CancelPendingNavigationAsync();
    HRESULT _CancelPendingView();
    HRESULT _MaySaveChanges();
    HRESULT _PauseOrResumeView(BOOL);
    HRESULT _DisableModeless();
    HRESULT _NavigateToPidl2(ITEMIDLIST*, uint, uint);
    HRESULT _TryShell2Rename(IShellView, ITEMIDLIST*);
    HRESULT _SwitchActivationNow();
    HRESULT _ExecChildren(IUnknown, BOOL, const(GUID)*, uint, uint, VARIANT*, VARIANT*);
    HRESULT _SendChildren(HWND, BOOL, uint, WPARAM, LPARAM);
    HRESULT GetFolderSetData(FOLDERSETDATA*);
    HRESULT _OnFocusChange(uint);
    HRESULT v_ShowHideChildWindows(BOOL);
    uint _get_itbLastFocus();
    HRESULT _put_itbLastFocus(uint);
    HRESULT _UIActivateView(uint);
    HRESULT _GetViewBorderRect(RECT*);
    HRESULT _UpdateViewRectSize();
    HRESULT _ResizeNextBorder(uint);
    HRESULT _ResizeView();
    HRESULT _GetEffectiveClientArea(RECT*, HMONITOR);
    IStream v_GetViewStream(ITEMIDLIST*, uint, const(wchar)*);
    LRESULT ForwardViewMsg(uint, WPARAM, LPARAM);
    HRESULT SetAcceleratorMenu(HACCEL);
    int _GetToolbarCount();
    TOOLBARITEM* _GetToolbarItem(int);
    HRESULT _SaveToolbars(IStream);
    HRESULT _LoadToolbars(IStream);
    HRESULT _CloseAndReleaseToolbars(BOOL);
    HRESULT v_MayGetNextToolbarFocus(MSG*, uint, int, TOOLBARITEM**, HWND*);
    HRESULT _ResizeNextBorderHelper(uint, BOOL);
    uint _FindTBar(IUnknown);
    HRESULT _SetFocus(TOOLBARITEM*, HWND, MSG*);
    HRESULT v_MayTranslateAccelerator(MSG*);
    HRESULT _GetBorderDWHelper(IUnknown, RECT*, BOOL);
    HRESULT v_CheckZoneCrossing(ITEMIDLIST*);
}
alias IEPDNFLAGS = int;
enum : int
{
    IEPDN_BINDINGUI = 0x00000001,
}

enum IID_IBrowserService3 = GUID(0x27d7ce21, 0x762d, 0x48f3, [0x86, 0xf3, 0x40, 0xe2, 0xfd, 0x37, 0x49, 0xc4]);
interface IBrowserService3 : IBrowserService2
{
    HRESULT _PositionViewWindow(HWND, RECT*);
    HRESULT IEParseDisplayNameEx(uint, const(wchar)*, uint, ITEMIDLIST**);
}
enum IID_IBrowserService4 = GUID(0x639f1bff, 0xe135, 0x4096, [0xab, 0xd8, 0xe0, 0xf5, 0x4, 0xd6, 0x49, 0xa4]);
interface IBrowserService4 : IBrowserService3
{
    HRESULT ActivateView(BOOL);
    HRESULT SaveViewState();
    HRESULT _ResizeAllBorders();
}
enum IID_ITrackShellMenu = GUID(0x8278f932, 0x2a3e, 0x11d2, [0x83, 0x8f, 0x0, 0xc0, 0x4f, 0xd9, 0x18, 0xd0]);
interface ITrackShellMenu : IShellMenu
{
    HRESULT SetObscured(HWND, IUnknown, uint);
    HRESULT Popup(HWND, POINTL*, RECTL*, int);
}
enum CLSID_ImageTranscode = GUID(0x17b75166, 0x928f, 0x417d, [0x96, 0x85, 0x64, 0xaa, 0x13, 0x55, 0x65, 0xc1]);
struct ImageTranscode
{
}
alias TI_FLAGS = int;
enum : int
{
    TI_BITMAP = 0x00000001,
    TI_JPEG   = 0x00000002,
}

enum IID_ITranscodeImage = GUID(0xbae86ddd, 0xdc11, 0x421c, [0xb7, 0xab, 0xcc, 0x55, 0xd1, 0xd6, 0x5c, 0x44]);
interface ITranscodeImage : IUnknown
{
    HRESULT TranscodeImage(IShellItem, uint, uint, uint, IStream, uint*, uint*);
}
alias PATHCCH_OPTIONS = uint;
enum : uint
{
    PATHCCH_NONE                            = 0x00000000,
    PATHCCH_ALLOW_LONG_PATHS                = 0x00000001,
    PATHCCH_FORCE_ENABLE_LONG_NAME_PROCESS  = 0x00000002,
    PATHCCH_FORCE_DISABLE_LONG_NAME_PROCESS = 0x00000004,
    PATHCCH_DO_NOT_NORMALIZE_SEGMENTS       = 0x00000008,
    PATHCCH_ENSURE_IS_EXTENDED_LENGTH_PATH  = 0x00000010,
    PATHCCH_ENSURE_TRAILING_SLASH           = 0x00000020,
    PATHCCH_CANONICALIZE_SLASHES            = 0x00000040,
}

alias APPLET_PROC = int function(HWND, uint, LPARAM, LPARAM);
struct CPLINFO
{
    align (1):
    int idIcon;
    int idName;
    int idInfo;
    long lData;
}
struct NEWCPLINFOA
{
    align (1):
    uint dwSize;
    uint dwFlags;
    uint dwHelpContext;
    long lData;
    HICON hIcon;
    CHAR[32] szName;
    CHAR[64] szInfo;
    CHAR[128] szHelpFile;
}
struct NEWCPLINFOW
{
    align (1):
    uint dwSize;
    uint dwFlags;
    uint dwHelpContext;
    long lData;
    HICON hIcon;
    wchar[32] szName;
    wchar[64] szInfo;
    wchar[128] szHelpFile;
}
struct PROFILEINFOA
{
    uint dwSize;
    uint dwFlags;
    PSTR lpUserName;
    PSTR lpProfilePath;
    PSTR lpDefaultPath;
    PSTR lpServerName;
    PSTR lpPolicyPath;
    HANDLE hProfile;
}
struct PROFILEINFOW
{
    uint dwSize;
    uint dwFlags;
    PWSTR lpUserName;
    PWSTR lpProfilePath;
    PWSTR lpDefaultPath;
    PWSTR lpServerName;
    PWSTR lpPolicyPath;
    HANDLE hProfile;
}
alias iurl_seturl_flags = int;
enum : int
{
    IURL_SETURL_FL_GUESS_PROTOCOL       = 0x00000001,
    IURL_SETURL_FL_USE_DEFAULT_PROTOCOL = 0x00000002,
}

alias iurl_invokecommand_flags = int;
enum : int
{
    IURL_INVOKECOMMAND_FL_ALLOW_UI         = 0x00000001,
    IURL_INVOKECOMMAND_FL_USE_DEFAULT_VERB = 0x00000002,
    IURL_INVOKECOMMAND_FL_DDEWAIT          = 0x00000004,
    IURL_INVOKECOMMAND_FL_ASYNCOK          = 0x00000008,
    IURL_INVOKECOMMAND_FL_LOG_USAGE        = 0x00000010,
}

struct urlinvokecommandinfoA
{
    uint dwcbSize;
    uint dwFlags;
    HWND hwndParent;
    const(char)* pcszVerb;
}
struct urlinvokecommandinfoW
{
    uint dwcbSize;
    uint dwFlags;
    HWND hwndParent;
    const(wchar)* pcszVerb;
}
enum IID_IUniformResourceLocatorA = GUID(0xfbf23b80, 0xe3f0, 0x101b, [0x84, 0x88, 0x0, 0xaa, 0x0, 0x3e, 0x56, 0xf8]);
interface IUniformResourceLocatorA : IUnknown
{
    HRESULT SetURL(const(char)*, uint);
    HRESULT GetURL(PSTR*);
    HRESULT InvokeCommand(urlinvokecommandinfoA*);
}
enum IID_IUniformResourceLocatorW = GUID(0xcabb0da0, 0xda57, 0x11cf, [0x99, 0x74, 0x0, 0x20, 0xaf, 0xd7, 0x97, 0x62]);
interface IUniformResourceLocatorW : IUnknown
{
    HRESULT SetURL(const(wchar)*, uint);
    HRESULT GetURL(PWSTR*);
    HRESULT InvokeCommand(urlinvokecommandinfoW*);
}
alias translateurl_in_flags = int;
enum : int
{
    TRANSLATEURL_FL_GUESS_PROTOCOL       = 0x00000001,
    TRANSLATEURL_FL_USE_DEFAULT_PROTOCOL = 0x00000002,
}

alias urlassociationdialog_in_flags = int;
enum : int
{
    URLASSOCDLG_FL_USE_DEFAULT_NAME = 0x00000001,
    URLASSOCDLG_FL_REGISTER_ASSOC   = 0x00000002,
}

alias mimeassociationdialog_in_flags = int;
enum : int
{
    MIMEASSOCDLG_FL_REGISTER_ASSOC = 0x00000001,
}

alias PAPPSTATE_CHANGE_ROUTINE = void function(BOOLEAN, void*);
alias PAPPCONSTRAIN_CHANGE_ROUTINE = void function(BOOLEAN, void*);
enum CLSID_ShowInputPaneAnimationCoordinator = GUID(0x1f046abf, 0x3202, 0x4dc1, [0x8c, 0xb5, 0x3c, 0x67, 0x61, 0x7c, 0xe1, 0xfa]);
struct ShowInputPaneAnimationCoordinator
{
}
enum CLSID_HideInputPaneAnimationCoordinator = GUID(0x384742b1, 0x2a77, 0x4cb3, [0x8c, 0xf8, 0x11, 0x36, 0xf5, 0xe1, 0x7e, 0x59]);
struct HideInputPaneAnimationCoordinator
{
}
enum IID_IInputPaneAnimationCoordinator = GUID(0x2af16ba9, 0x2de5, 0x4b75, [0x82, 0xd9, 0x1, 0x37, 0x2a, 0xfb, 0xff, 0xb4]);
interface IInputPaneAnimationCoordinator : IUnknown
{
    HRESULT AddAnimation(IUnknown, IDCompositionAnimation);
}
/+ [CONFLICTED] struct DRAGINFOA
{
    align (1):
    uint uSize;
    POINT pt;
    BOOL fNC;
    PSTR lpFileList;
    uint grfKeyState;
}
+/
/+ [CONFLICTED] struct DRAGINFOW
{
    align (1):
    uint uSize;
    POINT pt;
    BOOL fNC;
    PWSTR lpFileList;
    uint grfKeyState;
}
+/
/+ [CONFLICTED] struct APPBARDATA
{
    align (1):
    uint cbSize;
    HWND hWnd;
    uint uCallbackMessage;
    uint uEdge;
    RECT rc;
    LPARAM lParam;
}
+/
/+ [CONFLICTED] struct SHFILEOPSTRUCTA
{
    align (1):
    HWND hwnd;
    uint wFunc;
    byte* pFrom;
    byte* pTo;
    ushort fFlags;
    BOOL fAnyOperationsAborted;
    void* hNameMappings;
    const(char)* lpszProgressTitle;
}
+/
/+ [CONFLICTED] struct SHFILEOPSTRUCTW
{
    align (1):
    HWND hwnd;
    uint wFunc;
    const(wchar)* pFrom;
    const(wchar)* pTo;
    ushort fFlags;
    BOOL fAnyOperationsAborted;
    void* hNameMappings;
    const(wchar)* lpszProgressTitle;
}
+/
/+ [CONFLICTED] struct SHNAMEMAPPINGA
{
    align (1):
    PSTR pszOldPath;
    PSTR pszNewPath;
    int cchOldPath;
    int cchNewPath;
}
+/
/+ [CONFLICTED] struct SHNAMEMAPPINGW
{
    align (1):
    PWSTR pszOldPath;
    PWSTR pszNewPath;
    int cchOldPath;
    int cchNewPath;
}
+/
/+ [CONFLICTED] struct SHELLEXECUTEINFOA
{
    align (1):
    uint cbSize;
    uint fMask;
    HWND hwnd;
    const(char)* lpVerb;
    const(char)* lpFile;
    const(char)* lpParameters;
    const(char)* lpDirectory;
    int nShow;
    HINSTANCE hInstApp;
    void* lpIDList;
    const(char)* lpClass;
    HKEY hkeyClass;
    uint dwHotKey;
    union
    {
        align (1):
        HANDLE hIcon;
        HANDLE hMonitor;
    }
    HANDLE hProcess;
}
+/
/+ [CONFLICTED] struct SHELLEXECUTEINFOW
{
    align (1):
    uint cbSize;
    uint fMask;
    HWND hwnd;
    const(wchar)* lpVerb;
    const(wchar)* lpFile;
    const(wchar)* lpParameters;
    const(wchar)* lpDirectory;
    int nShow;
    HINSTANCE hInstApp;
    void* lpIDList;
    const(wchar)* lpClass;
    HKEY hkeyClass;
    uint dwHotKey;
    union
    {
        align (1):
        HANDLE hIcon;
        HANDLE hMonitor;
    }
    HANDLE hProcess;
}
+/
/+ [CONFLICTED] struct SHCREATEPROCESSINFOW
{
    align (1):
    uint cbSize;
    uint fMask;
    HWND hwnd;
    const(wchar)* pszFile;
    const(wchar)* pszParameters;
    const(wchar)* pszCurrentDirectory;
    HANDLE hUserToken;
    SECURITY_ATTRIBUTES* lpProcessAttributes;
    SECURITY_ATTRIBUTES* lpThreadAttributes;
    BOOL bInheritHandles;
    uint dwCreationFlags;
    STARTUPINFOW* lpStartupInfo;
    PROCESS_INFORMATION* lpProcessInformation;
}
+/
/+ [CONFLICTED] struct ASSOCIATIONELEMENT
{
    align (1):
    ASSOCCLASS ac;
    HKEY hkClass;
    const(wchar)* pszClass;
}
+/
/+ [CONFLICTED] struct SHQUERYRBINFO
{
    align (1):
    uint cbSize;
    long i64Size;
    long i64NumItems;
}
+/
/+ [CONFLICTED] struct NOTIFYICONDATAA
{
    align (1):
    uint cbSize;
    HWND hWnd;
    uint uID;
    NOTIFY_ICON_DATA_FLAGS uFlags;
    uint uCallbackMessage;
    HICON hIcon;
    CHAR[128] szTip;
    uint dwState;
    uint dwStateMask;
    CHAR[256] szInfo;
    union
    {
        align (1):
        uint uTimeout;
        uint uVersion;
    }
    CHAR[64] szInfoTitle;
    uint dwInfoFlags;
    GUID guidItem;
    HICON hBalloonIcon;
}
+/
/+ [CONFLICTED] struct NOTIFYICONDATAW
{
    align (1):
    uint cbSize;
    HWND hWnd;
    uint uID;
    NOTIFY_ICON_DATA_FLAGS uFlags;
    uint uCallbackMessage;
    HICON hIcon;
    wchar[128] szTip;
    uint dwState;
    uint dwStateMask;
    wchar[256] szInfo;
    union
    {
        align (1):
        uint uTimeout;
        uint uVersion;
    }
    wchar[64] szInfoTitle;
    uint dwInfoFlags;
    GUID guidItem;
    HICON hBalloonIcon;
}
+/
/+ [CONFLICTED] struct NOTIFYICONIDENTIFIER
{
    align (1):
    uint cbSize;
    HWND hWnd;
    uint uID;
    GUID guidItem;
}
+/
/+ [CONFLICTED] struct SHFILEINFOA
{
    align (1):
    HICON hIcon;
    int iIcon;
    uint dwAttributes;
    CHAR[260] szDisplayName;
    CHAR[80] szTypeName;
}
+/
/+ [CONFLICTED] struct SHFILEINFOW
{
    align (1):
    HICON hIcon;
    int iIcon;
    uint dwAttributes;
    wchar[260] szDisplayName;
    wchar[80] szTypeName;
}
+/
/+ [CONFLICTED] struct SHSTOCKICONINFO
{
    align (1):
    uint cbSize;
    HICON hIcon;
    int iSysImageIndex;
    int iIcon;
    wchar[260] szPath;
}
+/
/+ [CONFLICTED] struct OPEN_PRINTER_PROPS_INFOA
{
    align (1):
    uint dwSize;
    PSTR pszSheetName;
    uint uSheetIndex;
    uint dwFlags;
    BOOL bModal;
}
+/
/+ [CONFLICTED] struct OPEN_PRINTER_PROPS_INFOW
{
    align (1):
    uint dwSize;
    PWSTR pszSheetName;
    uint uSheetIndex;
    uint dwFlags;
    BOOL bModal;
}
+/
