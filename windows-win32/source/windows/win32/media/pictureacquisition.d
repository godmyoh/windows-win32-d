module windows.win32.media.pictureacquisition;

import windows.win32.guid : GUID;
import windows.win32.foundation : BOOL, BSTR, FILETIME, HRESULT, HWND, PROPERTYKEY, PWSTR, SIZE;
import windows.win32.graphics.gdi : HBITMAP;
import windows.win32.system.com : IEnumString, IStream, IUnknown;
import windows.win32.system.com.structuredstorage : PROPVARIANT;
import windows.win32.ui.shell.propertiessystem : IPropertyStore;
import windows.win32.ui.windowsandmessaging : HICON;

version (Windows):
extern (Windows):

enum PKEY_PhotoAcquire_RelativePathname = PROPERTYKEY(GUID(15872887, 31430, 19322, [132, 67, 52, 94, 115, 31, 165, 122]), 2);
enum PKEY_PhotoAcquire_FinalFilename = PROPERTYKEY(GUID(15872887, 31430, 19322, [132, 67, 52, 94, 115, 31, 165, 122]), 3);
enum PKEY_PhotoAcquire_GroupTag = PROPERTYKEY(GUID(15872887, 31430, 19322, [132, 67, 52, 94, 115, 31, 165, 122]), 4);
enum PKEY_PhotoAcquire_TransferResult = PROPERTYKEY(GUID(15872887, 31430, 19322, [132, 67, 52, 94, 115, 31, 165, 122]), 5);
enum PKEY_PhotoAcquire_OriginalFilename = PROPERTYKEY(GUID(15872887, 31430, 19322, [132, 67, 52, 94, 115, 31, 165, 122]), 6);
enum PKEY_PhotoAcquire_CameraSequenceNumber = PROPERTYKEY(GUID(15872887, 31430, 19322, [132, 67, 52, 94, 115, 31, 165, 122]), 7);
enum PKEY_PhotoAcquire_IntermediateFile = PROPERTYKEY(GUID(15872887, 31430, 19322, [132, 67, 52, 94, 115, 31, 165, 122]), 8);
enum PKEY_PhotoAcquire_SkipImport = PROPERTYKEY(GUID(15872887, 31430, 19322, [132, 67, 52, 94, 115, 31, 165, 122]), 9);
enum PKEY_PhotoAcquire_DuplicateDetectionID = PROPERTYKEY(GUID(15872887, 31430, 19322, [132, 67, 52, 94, 115, 31, 165, 122]), 10);
enum PROGRESS_INDETERMINATE = 0xffffffffffffffff;
enum PHOTOACQ_ERROR_RESTART_REQUIRED = 0xffffffff8004a001;
enum PHOTOACQ_RUN_DEFAULT = 0x00000000;
enum PHOTOACQ_NO_GALLERY_LAUNCH = 0x00000001;
enum PHOTOACQ_DISABLE_AUTO_ROTATE = 0x00000002;
enum PHOTOACQ_DISABLE_PLUGINS = 0x00000004;
enum PHOTOACQ_DISABLE_GROUP_TAG_PROMPT = 0x00000008;
enum PHOTOACQ_DISABLE_DB_INTEGRATION = 0x00000010;
enum PHOTOACQ_DELETE_AFTER_ACQUIRE = 0x00000020;
enum PHOTOACQ_DISABLE_DUPLICATE_DETECTION = 0x00000040;
enum PHOTOACQ_ENABLE_THUMBNAIL_CACHING = 0x00000080;
enum PHOTOACQ_DISABLE_METADATA_WRITE = 0x00000100;
enum PHOTOACQ_DISABLE_THUMBNAIL_PROGRESS = 0x00000200;
enum PHOTOACQ_DISABLE_SETTINGS_LINK = 0x00000400;
enum PHOTOACQ_ABORT_ON_SETTINGS_UPDATE = 0x00000800;
enum PHOTOACQ_IMPORT_VIDEO_AS_MULTIPLE_FILES = 0x00001000;
enum DSF_WPD_DEVICES = 0x00000001;
enum DSF_WIA_CAMERAS = 0x00000002;
enum DSF_WIA_SCANNERS = 0x00000004;
enum DSF_STI_DEVICES = 0x00000008;
enum DSF_TWAIN_DEVICES = 0x00000010;
enum DSF_FS_DEVICES = 0x00000020;
enum DSF_DV_DEVICES = 0x00000040;
enum DSF_ALL_DEVICES = 0x0000ffff;
enum DSF_CPL_MODE = 0x00010000;
enum DSF_SHOW_OFFLINE = 0x00020000;
enum PAPS_PRESAVE = 0x00000000;
enum PAPS_POSTSAVE = 0x00000001;
enum PAPS_CLEANUP = 0x00000002;
enum IID_IPhotoAcquireItem = GUID(0xf21c97, 0x28bf, 0x4c02, [0xb8, 0x42, 0x5e, 0x4e, 0x90, 0x13, 0x9a, 0x30]);
interface IPhotoAcquireItem : IUnknown
{
    HRESULT GetItemName(BSTR* pbstrItemName);
    HRESULT GetThumbnail(SIZE sizeThumbnail, HBITMAP* phbmpThumbnail);
    HRESULT GetProperty(const(PROPERTYKEY)* key, PROPVARIANT* pv);
    HRESULT SetProperty(const(PROPERTYKEY)* key, const(PROPVARIANT)* pv);
    HRESULT GetStream(IStream* ppStream);
    HRESULT CanDelete(BOOL* pfCanDelete);
    HRESULT Delete();
    HRESULT GetSubItemCount(uint* pnCount);
    HRESULT GetSubItemAt(uint nItemIndex, IPhotoAcquireItem* ppPhotoAcquireItem);
}
alias USER_INPUT_STRING_TYPE = int;
enum : int
{
    USER_INPUT_DEFAULT      = 0x00000000,
    USER_INPUT_PATH_ELEMENT = 0x00000001,
}

enum IID_IUserInputString = GUID(0xf243a1, 0x205b, 0x45ba, [0xae, 0x26, 0xab, 0xbc, 0x53, 0xaa, 0x7a, 0x6f]);
interface IUserInputString : IUnknown
{
    HRESULT GetSubmitButtonText(BSTR* pbstrSubmitButtonText);
    HRESULT GetPrompt(BSTR* pbstrPromptTitle);
    HRESULT GetStringId(BSTR* pbstrStringId);
    HRESULT GetStringType(USER_INPUT_STRING_TYPE* pnStringType);
    HRESULT GetTooltipText(BSTR* pbstrTooltipText);
    HRESULT GetMaxLength(uint* pcchMaxLength);
    HRESULT GetDefault(BSTR* pbstrDefault);
    HRESULT GetMruCount(uint* pnMruCount);
    HRESULT GetMruEntryAt(uint nIndex, BSTR* pbstrMruEntry);
    HRESULT GetImage(uint nSize, HBITMAP* phBitmap, HICON* phIcon);
}
alias ERROR_ADVISE_MESSAGE_TYPE = int;
enum : int
{
    PHOTOACQUIRE_ERROR_SKIPRETRYCANCEL = 0x00000000,
    PHOTOACQUIRE_ERROR_RETRYCANCEL     = 0x00000001,
    PHOTOACQUIRE_ERROR_YESNO           = 0x00000002,
    PHOTOACQUIRE_ERROR_OK              = 0x00000003,
}

alias ERROR_ADVISE_RESULT = int;
enum : int
{
    PHOTOACQUIRE_RESULT_YES      = 0x00000000,
    PHOTOACQUIRE_RESULT_NO       = 0x00000001,
    PHOTOACQUIRE_RESULT_OK       = 0x00000002,
    PHOTOACQUIRE_RESULT_SKIP     = 0x00000003,
    PHOTOACQUIRE_RESULT_SKIP_ALL = 0x00000004,
    PHOTOACQUIRE_RESULT_RETRY    = 0x00000005,
    PHOTOACQUIRE_RESULT_ABORT    = 0x00000006,
}

enum IID_IPhotoAcquireProgressCB = GUID(0xf2ce1e, 0x935e, 0x4248, [0x89, 0x2c, 0x13, 0xf, 0x32, 0xc4, 0x5c, 0xb4]);
interface IPhotoAcquireProgressCB : IUnknown
{
    HRESULT Cancelled(BOOL* pfCancelled);
    HRESULT StartEnumeration(IPhotoAcquireSource pPhotoAcquireSource);
    HRESULT FoundItem(IPhotoAcquireItem pPhotoAcquireItem);
    HRESULT EndEnumeration(HRESULT hr);
    HRESULT StartTransfer(IPhotoAcquireSource pPhotoAcquireSource);
    HRESULT StartItemTransfer(uint nItemIndex, IPhotoAcquireItem pPhotoAcquireItem);
    HRESULT DirectoryCreated(const(wchar)* pszDirectory);
    HRESULT UpdateTransferPercent(BOOL fOverall, uint nPercent);
    HRESULT EndItemTransfer(uint nItemIndex, IPhotoAcquireItem pPhotoAcquireItem, HRESULT hr);
    HRESULT EndTransfer(HRESULT hr);
    HRESULT StartDelete(IPhotoAcquireSource pPhotoAcquireSource);
    HRESULT StartItemDelete(uint nItemIndex, IPhotoAcquireItem pPhotoAcquireItem);
    HRESULT UpdateDeletePercent(uint nPercent);
    HRESULT EndItemDelete(uint nItemIndex, IPhotoAcquireItem pPhotoAcquireItem, HRESULT hr);
    HRESULT EndDelete(HRESULT hr);
    HRESULT EndSession(HRESULT hr);
    HRESULT GetDeleteAfterAcquire(BOOL* pfDeleteAfterAcquire);
    HRESULT ErrorAdvise(HRESULT hr, const(wchar)* pszErrorMessage, ERROR_ADVISE_MESSAGE_TYPE nMessageType, ERROR_ADVISE_RESULT* pnErrorAdviseResult);
    HRESULT GetUserInput(const(GUID)* riidType, IUnknown pUnknown, PROPVARIANT* pPropVarResult, const(PROPVARIANT)* pPropVarDefault);
}
enum IID_IPhotoProgressActionCB = GUID(0xf242d0, 0xb206, 0x4e7d, [0xb4, 0xc1, 0x47, 0x55, 0xbc, 0xbb, 0x9c, 0x9f]);
interface IPhotoProgressActionCB : IUnknown
{
    HRESULT DoAction(HWND hWndParent);
}
alias PROGRESS_DIALOG_IMAGE_TYPE = int;
enum : int
{
    PROGRESS_DIALOG_ICON_SMALL       = 0x00000000,
    PROGRESS_DIALOG_ICON_LARGE       = 0x00000001,
    PROGRESS_DIALOG_ICON_THUMBNAIL   = 0x00000002,
    PROGRESS_DIALOG_BITMAP_THUMBNAIL = 0x00000003,
}

alias PROGRESS_DIALOG_CHECKBOX_ID = int;
enum : int
{
    PROGRESS_DIALOG_CHECKBOX_ID_DEFAULT = 0x00000000,
}

enum IID_IPhotoProgressDialog = GUID(0xf246f9, 0x750, 0x4f08, [0x93, 0x81, 0x2c, 0xd8, 0xe9, 0x6, 0xa4, 0xae]);
interface IPhotoProgressDialog : IUnknown
{
    HRESULT Create(HWND hwndParent);
    HRESULT GetWindow(HWND* phwndProgressDialog);
    HRESULT Destroy();
    HRESULT SetTitle(const(wchar)* pszTitle);
    HRESULT ShowCheckbox(PROGRESS_DIALOG_CHECKBOX_ID nCheckboxId, BOOL fShow);
    HRESULT SetCheckboxText(PROGRESS_DIALOG_CHECKBOX_ID nCheckboxId, const(wchar)* pszCheckboxText);
    HRESULT SetCheckboxCheck(PROGRESS_DIALOG_CHECKBOX_ID nCheckboxId, BOOL fChecked);
    HRESULT SetCheckboxTooltip(PROGRESS_DIALOG_CHECKBOX_ID nCheckboxId, const(wchar)* pszCheckboxTooltipText);
    HRESULT IsCheckboxChecked(PROGRESS_DIALOG_CHECKBOX_ID nCheckboxId, BOOL* pfChecked);
    HRESULT SetCaption(const(wchar)* pszTitle);
    HRESULT SetImage(PROGRESS_DIALOG_IMAGE_TYPE nImageType, HICON hIcon, HBITMAP hBitmap);
    HRESULT SetPercentComplete(int nPercent);
    HRESULT SetProgressText(const(wchar)* pszProgressText);
    HRESULT SetActionLinkCallback(IPhotoProgressActionCB pPhotoProgressActionCB);
    HRESULT SetActionLinkText(const(wchar)* pszCaption);
    HRESULT ShowActionLink(BOOL fShow);
    HRESULT IsCancelled(BOOL* pfCancelled);
    HRESULT GetUserInput(const(GUID)* riidType, IUnknown pUnknown, PROPVARIANT* pPropVarResult, const(PROPVARIANT)* pPropVarDefault);
}
enum IID_IPhotoAcquireSource = GUID(0xf2c703, 0x8613, 0x4282, [0xa5, 0x3b, 0x6e, 0xc5, 0x9c, 0x58, 0x83, 0xac]);
interface IPhotoAcquireSource : IUnknown
{
    HRESULT GetFriendlyName(BSTR* pbstrFriendlyName);
    HRESULT GetDeviceIcons(uint nSize, HICON* phLargeIcon, HICON* phSmallIcon);
    HRESULT InitializeItemList(BOOL fForceEnumeration, IPhotoAcquireProgressCB pPhotoAcquireProgressCB, uint* pnItemCount);
    HRESULT GetItemCount(uint* pnItemCount);
    HRESULT GetItemAt(uint nIndex, IPhotoAcquireItem* ppPhotoAcquireItem);
    HRESULT GetPhotoAcquireSettings(IPhotoAcquireSettings* ppPhotoAcquireSettings);
    HRESULT GetDeviceId(BSTR* pbstrDeviceId);
    HRESULT BindToObject(const(GUID)* riid, void** ppv);
}
enum IID_IPhotoAcquire = GUID(0xf23353, 0xe31b, 0x4955, [0xa8, 0xad, 0xca, 0x5e, 0xbf, 0x31, 0xe2, 0xce]);
interface IPhotoAcquire : IUnknown
{
    HRESULT CreatePhotoSource(const(wchar)* pszDevice, IPhotoAcquireSource* ppPhotoAcquireSource);
    HRESULT Acquire(IPhotoAcquireSource pPhotoAcquireSource, BOOL fShowProgress, HWND hWndParent, const(wchar)* pszApplicationName, IPhotoAcquireProgressCB pPhotoAcquireProgressCB);
    HRESULT EnumResults(IEnumString* ppEnumFilePaths);
}
enum IID_IPhotoAcquireSettings = GUID(0xf2b868, 0xdd67, 0x487c, [0x95, 0x53, 0x4, 0x92, 0x40, 0x76, 0x7e, 0x91]);
interface IPhotoAcquireSettings : IUnknown
{
    HRESULT InitializeFromRegistry(const(wchar)* pszRegistryKey);
    HRESULT SetFlags(uint dwPhotoAcquireFlags);
    HRESULT SetOutputFilenameTemplate(const(wchar)* pszTemplate);
    HRESULT SetSequencePaddingWidth(uint dwWidth);
    HRESULT SetSequenceZeroPadding(BOOL fZeroPad);
    HRESULT SetGroupTag(const(wchar)* pszGroupTag);
    HRESULT SetAcquisitionTime(const(FILETIME)* pftAcquisitionTime);
    HRESULT GetFlags(uint* pdwPhotoAcquireFlags);
    HRESULT GetOutputFilenameTemplate(BSTR* pbstrTemplate);
    HRESULT GetSequencePaddingWidth(uint* pdwWidth);
    HRESULT GetSequenceZeroPadding(BOOL* pfZeroPad);
    HRESULT GetGroupTag(BSTR* pbstrGroupTag);
    HRESULT GetAcquisitionTime(FILETIME* pftAcquisitionTime);
}
enum IID_IPhotoAcquireOptionsDialog = GUID(0xf2b3ee, 0xbf64, 0x47ee, [0x89, 0xf4, 0x4d, 0xed, 0xd7, 0x96, 0x43, 0xf2]);
interface IPhotoAcquireOptionsDialog : IUnknown
{
    HRESULT Initialize(const(wchar)* pszRegistryRoot);
    HRESULT Create(HWND hWndParent, HWND* phWndDialog);
    HRESULT Destroy();
    HRESULT DoModal(HWND hWndParent, long* ppnReturnCode);
    HRESULT SaveData();
}
alias DEVICE_SELECTION_DEVICE_TYPE = int;
enum : int
{
    DST_UNKNOWN_DEVICE = 0x00000000,
    DST_WPD_DEVICE     = 0x00000001,
    DST_WIA_DEVICE     = 0x00000002,
    DST_STI_DEVICE     = 0x00000003,
    DSF_TWAIN_DEVICE   = 0x00000004,
    DST_FS_DEVICE      = 0x00000005,
    DST_DV_DEVICE      = 0x00000006,
}

enum IID_IPhotoAcquireDeviceSelectionDialog = GUID(0xf28837, 0x55dd, 0x4f37, [0xaa, 0xf5, 0x68, 0x55, 0xa9, 0x64, 0x4, 0x67]);
interface IPhotoAcquireDeviceSelectionDialog : IUnknown
{
    HRESULT SetTitle(const(wchar)* pszTitle);
    HRESULT SetSubmitButtonText(const(wchar)* pszSubmitButtonText);
    HRESULT DoModal(HWND hWndParent, uint dwDeviceFlags, BSTR* pbstrDeviceId, DEVICE_SELECTION_DEVICE_TYPE* pnDeviceType);
}
enum IID_IPhotoAcquirePlugin = GUID(0xf2dceb, 0xecb8, 0x4f77, [0x8e, 0x47, 0xe7, 0xa9, 0x87, 0xc8, 0x3d, 0xd0]);
interface IPhotoAcquirePlugin : IUnknown
{
    HRESULT Initialize(IPhotoAcquireSource pPhotoAcquireSource, IPhotoAcquireProgressCB pPhotoAcquireProgressCB);
    HRESULT ProcessItem(uint dwAcquireStage, IPhotoAcquireItem pPhotoAcquireItem, IStream pOriginalItemStream, const(wchar)* pszFinalFilename, IPropertyStore pPropertyStore);
    HRESULT TransferComplete(HRESULT hr);
    HRESULT DisplayConfigureDialog(HWND hWndParent);
}
enum CLSID_PhotoAcquire = GUID(0xf26e02, 0xe9f2, 0x4a9f, [0x9f, 0xdd, 0x5a, 0x96, 0x2f, 0xb2, 0x6a, 0x98]);
struct PhotoAcquire
{
}
enum CLSID_PhotoAcquireAutoPlayDropTarget = GUID(0xf20eb5, 0x8fd6, 0x4d9d, [0xb7, 0x5e, 0x36, 0x80, 0x17, 0x66, 0xc8, 0xf1]);
struct PhotoAcquireAutoPlayDropTarget
{
}
enum CLSID_PhotoAcquireAutoPlayHWEventHandler = GUID(0xf2b433, 0x44e4, 0x4d88, [0xb2, 0xb0, 0x26, 0x98, 0xa0, 0xa9, 0x1d, 0xba]);
struct PhotoAcquireAutoPlayHWEventHandler
{
}
enum CLSID_PhotoAcquireOptionsDialog = GUID(0xf210a1, 0x62f0, 0x438b, [0x9f, 0x7e, 0x96, 0x18, 0xd7, 0x2a, 0x18, 0x31]);
struct PhotoAcquireOptionsDialog
{
}
enum CLSID_PhotoProgressDialog = GUID(0xf24ca0, 0x748f, 0x4e8a, [0x89, 0x4f, 0xe, 0x3, 0x57, 0xc6, 0x79, 0x9f]);
struct PhotoProgressDialog
{
}
enum CLSID_PhotoAcquireDeviceSelectionDialog = GUID(0xf29a34, 0xb8a1, 0x482c, [0xbc, 0xf8, 0x3a, 0xc7, 0xb0, 0xfe, 0x8f, 0x62]);
struct PhotoAcquireDeviceSelectionDialog
{
}
