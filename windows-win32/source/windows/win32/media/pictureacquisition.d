module windows.win32.media.pictureacquisition;

import windows.win32.guid : GUID;
import windows.win32.foundation : BOOL, BSTR, FILETIME, HRESULT, HWND, PWSTR, SIZE;
import windows.win32.graphics.gdi : HBITMAP;
import windows.win32.system.com_ : IEnumString, IStream, IUnknown;
import windows.win32.system.com.structuredstorage : PROPVARIANT;
import windows.win32.ui.shell.propertiessystem : IPropertyStore, PROPERTYKEY;
import windows.win32.ui.windowsandmessaging : HICON;

version (Windows):
extern (Windows):

//enum PKEY_PhotoAcquire_RelativePathname = [MISSING];
//enum PKEY_PhotoAcquire_FinalFilename = [MISSING];
//enum PKEY_PhotoAcquire_GroupTag = [MISSING];
//enum PKEY_PhotoAcquire_TransferResult = [MISSING];
//enum PKEY_PhotoAcquire_OriginalFilename = [MISSING];
//enum PKEY_PhotoAcquire_CameraSequenceNumber = [MISSING];
//enum PKEY_PhotoAcquire_IntermediateFile = [MISSING];
//enum PKEY_PhotoAcquire_SkipImport = [MISSING];
//enum PKEY_PhotoAcquire_DuplicateDetectionID = [MISSING];
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
enum IID_IPhotoAcquireItem = GUID(0xf21c97, 0x28bf, 0x4c02, [0xb8, 0x42, 0x5e, 0x4e, 0x90, 0x13, 0x9a, 0x30]);
interface IPhotoAcquireItem : IUnknown
{
    HRESULT GetItemName(BSTR*);
    HRESULT GetThumbnail(SIZE, HBITMAP*);
    HRESULT GetProperty(const(PROPERTYKEY)*, PROPVARIANT*);
    HRESULT SetProperty(const(PROPERTYKEY)*, const(PROPVARIANT)*);
    HRESULT GetStream(IStream*);
    HRESULT CanDelete(BOOL*);
    HRESULT Delete();
    HRESULT GetSubItemCount(uint*);
    HRESULT GetSubItemAt(uint, IPhotoAcquireItem*);
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
    HRESULT GetSubmitButtonText(BSTR*);
    HRESULT GetPrompt(BSTR*);
    HRESULT GetStringId(BSTR*);
    HRESULT GetStringType(USER_INPUT_STRING_TYPE*);
    HRESULT GetTooltipText(BSTR*);
    HRESULT GetMaxLength(uint*);
    HRESULT GetDefault(BSTR*);
    HRESULT GetMruCount(uint*);
    HRESULT GetMruEntryAt(uint, BSTR*);
    HRESULT GetImage(uint, HBITMAP*, HICON*);
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
    HRESULT Cancelled(BOOL*);
    HRESULT StartEnumeration(IPhotoAcquireSource);
    HRESULT FoundItem(IPhotoAcquireItem);
    HRESULT EndEnumeration(HRESULT);
    HRESULT StartTransfer(IPhotoAcquireSource);
    HRESULT StartItemTransfer(uint, IPhotoAcquireItem);
    HRESULT DirectoryCreated(const(wchar)*);
    HRESULT UpdateTransferPercent(BOOL, uint);
    HRESULT EndItemTransfer(uint, IPhotoAcquireItem, HRESULT);
    HRESULT EndTransfer(HRESULT);
    HRESULT StartDelete(IPhotoAcquireSource);
    HRESULT StartItemDelete(uint, IPhotoAcquireItem);
    HRESULT UpdateDeletePercent(uint);
    HRESULT EndItemDelete(uint, IPhotoAcquireItem, HRESULT);
    HRESULT EndDelete(HRESULT);
    HRESULT EndSession(HRESULT);
    HRESULT GetDeleteAfterAcquire(BOOL*);
    HRESULT ErrorAdvise(HRESULT, const(wchar)*, ERROR_ADVISE_MESSAGE_TYPE, ERROR_ADVISE_RESULT*);
    HRESULT GetUserInput(const(GUID)*, IUnknown, PROPVARIANT*, const(PROPVARIANT)*);
}
enum IID_IPhotoProgressActionCB = GUID(0xf242d0, 0xb206, 0x4e7d, [0xb4, 0xc1, 0x47, 0x55, 0xbc, 0xbb, 0x9c, 0x9f]);
interface IPhotoProgressActionCB : IUnknown
{
    HRESULT DoAction(HWND);
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
    HRESULT Create(HWND);
    HRESULT GetWindow(HWND*);
    HRESULT Destroy();
    HRESULT SetTitle(const(wchar)*);
    HRESULT ShowCheckbox(PROGRESS_DIALOG_CHECKBOX_ID, BOOL);
    HRESULT SetCheckboxText(PROGRESS_DIALOG_CHECKBOX_ID, const(wchar)*);
    HRESULT SetCheckboxCheck(PROGRESS_DIALOG_CHECKBOX_ID, BOOL);
    HRESULT SetCheckboxTooltip(PROGRESS_DIALOG_CHECKBOX_ID, const(wchar)*);
    HRESULT IsCheckboxChecked(PROGRESS_DIALOG_CHECKBOX_ID, BOOL*);
    HRESULT SetCaption(const(wchar)*);
    HRESULT SetImage(PROGRESS_DIALOG_IMAGE_TYPE, HICON, HBITMAP);
    HRESULT SetPercentComplete(int);
    HRESULT SetProgressText(const(wchar)*);
    HRESULT SetActionLinkCallback(IPhotoProgressActionCB);
    HRESULT SetActionLinkText(const(wchar)*);
    HRESULT ShowActionLink(BOOL);
    HRESULT IsCancelled(BOOL*);
    HRESULT GetUserInput(const(GUID)*, IUnknown, PROPVARIANT*, const(PROPVARIANT)*);
}
enum IID_IPhotoAcquireSource = GUID(0xf2c703, 0x8613, 0x4282, [0xa5, 0x3b, 0x6e, 0xc5, 0x9c, 0x58, 0x83, 0xac]);
interface IPhotoAcquireSource : IUnknown
{
    HRESULT GetFriendlyName(BSTR*);
    HRESULT GetDeviceIcons(uint, HICON*, HICON*);
    HRESULT InitializeItemList(BOOL, IPhotoAcquireProgressCB, uint*);
    HRESULT GetItemCount(uint*);
    HRESULT GetItemAt(uint, IPhotoAcquireItem*);
    HRESULT GetPhotoAcquireSettings(IPhotoAcquireSettings*);
    HRESULT GetDeviceId(BSTR*);
    HRESULT BindToObject(const(GUID)*, void**);
}
enum IID_IPhotoAcquire = GUID(0xf23353, 0xe31b, 0x4955, [0xa8, 0xad, 0xca, 0x5e, 0xbf, 0x31, 0xe2, 0xce]);
interface IPhotoAcquire : IUnknown
{
    HRESULT CreatePhotoSource(const(wchar)*, IPhotoAcquireSource*);
    HRESULT Acquire(IPhotoAcquireSource, BOOL, HWND, const(wchar)*, IPhotoAcquireProgressCB);
    HRESULT EnumResults(IEnumString*);
}
enum IID_IPhotoAcquireSettings = GUID(0xf2b868, 0xdd67, 0x487c, [0x95, 0x53, 0x4, 0x92, 0x40, 0x76, 0x7e, 0x91]);
interface IPhotoAcquireSettings : IUnknown
{
    HRESULT InitializeFromRegistry(const(wchar)*);
    HRESULT SetFlags(uint);
    HRESULT SetOutputFilenameTemplate(const(wchar)*);
    HRESULT SetSequencePaddingWidth(uint);
    HRESULT SetSequenceZeroPadding(BOOL);
    HRESULT SetGroupTag(const(wchar)*);
    HRESULT SetAcquisitionTime(const(FILETIME)*);
    HRESULT GetFlags(uint*);
    HRESULT GetOutputFilenameTemplate(BSTR*);
    HRESULT GetSequencePaddingWidth(uint*);
    HRESULT GetSequenceZeroPadding(BOOL*);
    HRESULT GetGroupTag(BSTR*);
    HRESULT GetAcquisitionTime(FILETIME*);
}
enum IID_IPhotoAcquireOptionsDialog = GUID(0xf2b3ee, 0xbf64, 0x47ee, [0x89, 0xf4, 0x4d, 0xed, 0xd7, 0x96, 0x43, 0xf2]);
interface IPhotoAcquireOptionsDialog : IUnknown
{
    HRESULT Initialize(const(wchar)*);
    HRESULT Create(HWND, HWND*);
    HRESULT Destroy();
    HRESULT DoModal(HWND, long*);
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
    HRESULT SetTitle(const(wchar)*);
    HRESULT SetSubmitButtonText(const(wchar)*);
    HRESULT DoModal(HWND, uint, BSTR*, DEVICE_SELECTION_DEVICE_TYPE*);
}
enum IID_IPhotoAcquirePlugin = GUID(0xf2dceb, 0xecb8, 0x4f77, [0x8e, 0x47, 0xe7, 0xa9, 0x87, 0xc8, 0x3d, 0xd0]);
interface IPhotoAcquirePlugin : IUnknown
{
    HRESULT Initialize(IPhotoAcquireSource, IPhotoAcquireProgressCB);
    HRESULT ProcessItem(uint, IPhotoAcquireItem, IStream, const(wchar)*, IPropertyStore);
    HRESULT TransferComplete(HRESULT);
    HRESULT DisplayConfigureDialog(HWND);
}
