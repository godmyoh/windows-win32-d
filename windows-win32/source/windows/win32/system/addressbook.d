module windows.win32.system.addressbook;

import windows.win32.guid : GUID;
import windows.win32.foundation : BOOL, FILETIME, HINSTANCE, HRESULT, HWND, PSTR, PWSTR;
import windows.win32.system.com : CY, IMalloc, IStream, IUnknown;
import windows.win32.system.com.structuredstorage : IStorage;

version (Windows):
extern (Windows):

int CreateTable(GUID* lpInterface, LPALLOCATEBUFFER lpAllocateBuffer, LPALLOCATEMORE lpAllocateMore, LPFREEBUFFER lpFreeBuffer, void* lpvReserved, uint ulTableType, uint ulPropTagIndexColumn, SPropTagArray* lpSPropTagArrayColumns, ITableData* lppTableData);
int CreateIProp(GUID* lpInterface, LPALLOCATEBUFFER lpAllocateBuffer, LPALLOCATEMORE lpAllocateMore, LPFREEBUFFER lpFreeBuffer, void* lpvReserved, IPropData* lppPropData);
int MAPIInitIdle(void* lpvReserved);
void MAPIDeinitIdle();
void* FtgRegisterIdleRoutine(PFNIDLE lpfnIdle, void* lpvIdleParam, short priIdle, uint csecIdle, ushort iroIdle);
void DeregisterIdleRoutine(void* ftg);
void EnableIdleRoutine(void* ftg, BOOL fEnable);
void ChangeIdleRoutine(void* ftg, PFNIDLE lpfnIdle, void* lpvIdleParam, short priIdle, uint csecIdle, ushort iroIdle, ushort ircIdle);
IMalloc MAPIGetDefaultMalloc();
HRESULT OpenStreamOnFile(LPALLOCATEBUFFER lpAllocateBuffer, LPFREEBUFFER lpFreeBuffer, uint ulFlags, byte* lpszFileName, byte* lpszPrefix, IStream* lppStream);
int PropCopyMore(SPropValue* lpSPropValueDest, SPropValue* lpSPropValueSrc, LPALLOCATEMORE lpfAllocMore, void* lpvObject);
uint UlPropSize(SPropValue* lpSPropValue);
BOOL FEqualNames(MAPINAMEID* lpName1, MAPINAMEID* lpName2);
BOOL FPropContainsProp(SPropValue* lpSPropValueDst, SPropValue* lpSPropValueSrc, uint ulFuzzyLevel);
BOOL FPropCompareProp(SPropValue* lpSPropValue1, uint ulRelOp, SPropValue* lpSPropValue2);
int LPropCompareProp(SPropValue* lpSPropValueA, SPropValue* lpSPropValueB);
HRESULT HrAddColumns(IMAPITable lptbl, SPropTagArray* lpproptagColumnsNew, LPALLOCATEBUFFER lpAllocateBuffer, LPFREEBUFFER lpFreeBuffer);
HRESULT HrAddColumnsEx(IMAPITable lptbl, SPropTagArray* lpproptagColumnsNew, LPALLOCATEBUFFER lpAllocateBuffer, LPFREEBUFFER lpFreeBuffer, long lpfnFilterColumns);
HRESULT HrAllocAdviseSink(LPNOTIFCALLBACK lpfnCallback, void* lpvContext, IMAPIAdviseSink* lppAdviseSink);
HRESULT HrThisThreadAdviseSink(IMAPIAdviseSink lpAdviseSink, IMAPIAdviseSink* lppAdviseSink);
HRESULT HrDispatchNotifications(uint ulFlags);
HRESULT BuildDisplayTable(LPALLOCATEBUFFER lpAllocateBuffer, LPALLOCATEMORE lpAllocateMore, LPFREEBUFFER lpFreeBuffer, IMalloc lpMalloc, HINSTANCE hInstance, uint cPages, DTPAGE* lpPage, uint ulFlags, IMAPITable* lppTable, ITableData* lppTblData);
int ScCountNotifications(int cNotifications, NOTIFICATION* lpNotifications, uint* lpcb);
int ScCopyNotifications(int cNotification, NOTIFICATION* lpNotifications, void* lpvDst, uint* lpcb);
int ScRelocNotifications(int cNotification, NOTIFICATION* lpNotifications, void* lpvBaseOld, void* lpvBaseNew, uint* lpcb);
int ScCountProps(int cValues, SPropValue* lpPropArray, uint* lpcb);
SPropValue* LpValFindProp(uint ulPropTag, uint cValues, SPropValue* lpPropArray);
int ScCopyProps(int cValues, SPropValue* lpPropArray, void* lpvDst, uint* lpcb);
int ScRelocProps(int cValues, SPropValue* lpPropArray, void* lpvBaseOld, void* lpvBaseNew, uint* lpcb);
int ScDupPropset(int cValues, SPropValue* lpPropArray, LPALLOCATEBUFFER lpAllocateBuffer, SPropValue** lppPropArray);
uint UlAddRef(void* lpunk);
uint UlRelease(void* lpunk);
HRESULT HrGetOneProp(IMAPIProp lpMapiProp, uint ulPropTag, SPropValue** lppProp);
HRESULT HrSetOneProp(IMAPIProp lpMapiProp, SPropValue* lpProp);
BOOL FPropExists(IMAPIProp lpMapiProp, uint ulPropTag);
SPropValue* PpropFindProp(SPropValue* lpPropArray, uint cValues, uint ulPropTag);
void FreePadrlist(ADRLIST* lpAdrlist);
void FreeProws(SRowSet* lpRows);
HRESULT HrQueryAllRows(IMAPITable lpTable, SPropTagArray* lpPropTags, SRestriction* lpRestriction, SSortOrderSet* lpSortOrderSet, int crowsMax, SRowSet** lppRows);
byte* SzFindCh(byte* lpsz, ushort ch);
byte* SzFindLastCh(byte* lpsz, ushort ch);
byte* SzFindSz(byte* lpsz, byte* lpszKey);
uint UFromSz(byte* lpsz);
int ScUNCFromLocalPath(PSTR lpszLocal, PSTR lpszUNC, uint cchUNC);
int ScLocalPathFromUNC(PSTR lpszUNC, PSTR lpszLocal, uint cchLocal);
FILETIME FtAddFt(FILETIME ftAddend1, FILETIME ftAddend2);
FILETIME FtMulDwDw(uint ftMultiplicand, uint ftMultiplier);
FILETIME FtMulDw(uint ftMultiplier, FILETIME ftMultiplicand);
FILETIME FtSubFt(FILETIME ftMinuend, FILETIME ftSubtrahend);
FILETIME FtNegFt(FILETIME ft);
int ScCreateConversationIndex(uint cbParent, ubyte* lpbParent, uint* lpcbConvIndex, ubyte** lppbConvIndex);
HRESULT WrapStoreEntryID(uint ulFlags, byte* lpszDLLName, uint cbOrigEntry, ENTRYID* lpOrigEntry, uint* lpcbWrappedEntry, ENTRYID** lppWrappedEntry);
HRESULT RTFSync(IMessage lpMessage, uint ulFlags, BOOL* lpfMessageUpdated);
HRESULT WrapCompressedRTFStream(IStream lpCompressedRTFStream, uint ulFlags, IStream* lpUncompressedRTFStream);
HRESULT HrIStorageFromStream(IUnknown lpUnkIn, GUID* lpInterface, uint ulFlags, IStorage* lppStorageOut);
int ScInitMapiUtil(uint ulFlags);
void DeinitMapiUtil();
enum PROP_ID_SECURE_MIN = 0x000067f0;
enum PROP_ID_SECURE_MAX = 0x000067ff;
enum MAPI_DIM = 0x00000001;
enum fMapiUnicode = 0x00000000;
enum hrSuccess = 0x00000000;
enum MAPI_P1 = 0x10000000;
enum MAPI_SUBMITTED = 0x80000000;
enum MAPI_SHORTTERM = 0x00000080;
enum MAPI_NOTRECIP = 0x00000040;
enum MAPI_THISSESSION = 0x00000020;
enum MAPI_NOW = 0x00000010;
enum MAPI_NOTRESERVED = 0x00000008;
enum MAPI_COMPOUND = 0x00000080;
enum cchProfileNameMax = 0x00000040;
enum cchProfilePassMax = 0x00000040;
enum MV_FLAG = 0x00001000;
enum PROP_ID_NULL = 0x00000000;
enum PROP_ID_INVALID = 0x0000ffff;
enum MV_INSTANCE = 0x00002000;
enum TABLE_CHANGED = 0x00000001;
enum TABLE_ERROR = 0x00000002;
enum TABLE_ROW_ADDED = 0x00000003;
enum TABLE_ROW_DELETED = 0x00000004;
enum TABLE_ROW_MODIFIED = 0x00000005;
enum TABLE_SORT_DONE = 0x00000006;
enum TABLE_RESTRICT_DONE = 0x00000007;
enum TABLE_SETCOL_DONE = 0x00000008;
enum TABLE_RELOAD = 0x00000009;
enum szMAPINotificationMsg = "MAPI Notify window message";
enum MAPI_ERROR_VERSION = 0x00000000;
enum MAPI_USE_DEFAULT = 0x00000040;
enum MNID_ID = 0x00000000;
enum MNID_STRING = 0x00000001;
enum WAB_LOCAL_CONTAINERS = 0x00100000;
enum WAB_PROFILE_CONTENTS = 0x00200000;
enum WAB_IGNORE_PROFILES = 0x00800000;
enum MAPI_ONE_OFF_NO_RICH_INFO = 0x00000001;
enum UI_SERVICE = 0x00000002;
enum SERVICE_UI_ALWAYS = 0x00000002;
enum SERVICE_UI_ALLOWED = 0x00000010;
enum UI_CURRENT_PROVIDER_FIRST = 0x00000004;
enum WABOBJECT_LDAPURL_RETURN_MAILUSER = 0x00000001;
enum WABOBJECT_ME_NEW = 0x00000001;
enum WABOBJECT_ME_NOCREATE = 0x00000002;
enum WAB_VCARD_FILE = 0x00000000;
enum WAB_VCARD_STREAM = 0x00000001;
enum WAB_USE_OE_SENDMAIL = 0x00000001;
enum WAB_ENABLE_PROFILES = 0x00400000;
enum WAB_DISPLAY_LDAPURL = 0x00000001;
enum WAB_CONTEXT_ADRLIST = 0x00000002;
enum WAB_DISPLAY_ISNTDS = 0x00000004;
enum WAB_DLL_NAME = "WAB32.DLL";
enum WAB_DLL_PATH_KEY = "Software\\Microsoft\\WAB\\DLLPath";
enum E_IMAPI_REQUEST_CANCELLED = 0xffffffffc0aa0002;
enum E_IMAPI_RECORDER_REQUIRED = 0xffffffffc0aa0003;
enum S_IMAPI_SPEEDADJUSTED = 0x00aa0004;
enum S_IMAPI_ROTATIONADJUSTED = 0x00aa0005;
enum S_IMAPI_BOTHADJUSTED = 0x00aa0006;
enum E_IMAPI_BURN_VERIFICATION_FAILED = 0xffffffffc0aa0007;
enum S_IMAPI_COMMAND_HAS_SENSE_DATA = 0x00aa0200;
enum E_IMAPI_RECORDER_NO_SUCH_MODE_PAGE = 0xffffffffc0aa0201;
enum E_IMAPI_RECORDER_MEDIA_NO_MEDIA = 0xffffffffc0aa0202;
enum E_IMAPI_RECORDER_MEDIA_INCOMPATIBLE = 0xffffffffc0aa0203;
enum E_IMAPI_RECORDER_MEDIA_UPSIDE_DOWN = 0xffffffffc0aa0204;
enum E_IMAPI_RECORDER_MEDIA_BECOMING_READY = 0xffffffffc0aa0205;
enum E_IMAPI_RECORDER_MEDIA_FORMAT_IN_PROGRESS = 0xffffffffc0aa0206;
enum E_IMAPI_RECORDER_MEDIA_BUSY = 0xffffffffc0aa0207;
enum E_IMAPI_RECORDER_INVALID_MODE_PARAMETERS = 0xffffffffc0aa0208;
enum E_IMAPI_RECORDER_MEDIA_WRITE_PROTECTED = 0xffffffffc0aa0209;
enum E_IMAPI_RECORDER_NO_SUCH_FEATURE = 0xffffffffc0aa020a;
enum E_IMAPI_RECORDER_FEATURE_IS_NOT_CURRENT = 0xffffffffc0aa020b;
enum E_IMAPI_RECORDER_GET_CONFIGURATION_NOT_SUPPORTED = 0xffffffffc0aa020c;
enum E_IMAPI_RECORDER_COMMAND_TIMEOUT = 0xffffffffc0aa020d;
enum E_IMAPI_RECORDER_DVD_STRUCTURE_NOT_PRESENT = 0xffffffffc0aa020e;
enum E_IMAPI_RECORDER_MEDIA_SPEED_MISMATCH = 0xffffffffc0aa020f;
enum E_IMAPI_RECORDER_LOCKED = 0xffffffffc0aa0210;
enum E_IMAPI_RECORDER_CLIENT_NAME_IS_NOT_VALID = 0xffffffffc0aa0211;
enum E_IMAPI_RECORDER_MEDIA_NOT_FORMATTED = 0xffffffffc0aa0212;
enum E_IMAPI_RECORDER_INVALID_RESPONSE_FROM_DEVICE = 0xffffffffc0aa02ff;
enum E_IMAPI_LOSS_OF_STREAMING = 0xffffffffc0aa0300;
enum E_IMAPI_UNEXPECTED_RESPONSE_FROM_DEVICE = 0xffffffffc0aa0301;
enum S_IMAPI_WRITE_NOT_IN_PROGRESS = 0x00aa0302;
enum E_IMAPI_DF2DATA_WRITE_IN_PROGRESS = 0xffffffffc0aa0400;
enum E_IMAPI_DF2DATA_WRITE_NOT_IN_PROGRESS = 0xffffffffc0aa0401;
enum E_IMAPI_DF2DATA_INVALID_MEDIA_STATE = 0xffffffffc0aa0402;
enum E_IMAPI_DF2DATA_STREAM_NOT_SUPPORTED = 0xffffffffc0aa0403;
enum E_IMAPI_DF2DATA_STREAM_TOO_LARGE_FOR_CURRENT_MEDIA = 0xffffffffc0aa0404;
enum E_IMAPI_DF2DATA_MEDIA_NOT_BLANK = 0xffffffffc0aa0405;
enum E_IMAPI_DF2DATA_MEDIA_IS_NOT_SUPPORTED = 0xffffffffc0aa0406;
enum E_IMAPI_DF2DATA_RECORDER_NOT_SUPPORTED = 0xffffffffc0aa0407;
enum E_IMAPI_DF2DATA_CLIENT_NAME_IS_NOT_VALID = 0xffffffffc0aa0408;
enum E_IMAPI_DF2TAO_WRITE_IN_PROGRESS = 0xffffffffc0aa0500;
enum E_IMAPI_DF2TAO_WRITE_NOT_IN_PROGRESS = 0xffffffffc0aa0501;
enum E_IMAPI_DF2TAO_MEDIA_IS_NOT_PREPARED = 0xffffffffc0aa0502;
enum E_IMAPI_DF2TAO_MEDIA_IS_PREPARED = 0xffffffffc0aa0503;
enum E_IMAPI_DF2TAO_PROPERTY_FOR_BLANK_MEDIA_ONLY = 0xffffffffc0aa0504;
enum E_IMAPI_DF2TAO_TABLE_OF_CONTENTS_EMPTY_DISC = 0xffffffffc0aa0505;
enum E_IMAPI_DF2TAO_MEDIA_IS_NOT_BLANK = 0xffffffffc0aa0506;
enum E_IMAPI_DF2TAO_MEDIA_IS_NOT_SUPPORTED = 0xffffffffc0aa0507;
enum E_IMAPI_DF2TAO_TRACK_LIMIT_REACHED = 0xffffffffc0aa0508;
enum E_IMAPI_DF2TAO_NOT_ENOUGH_SPACE = 0xffffffffc0aa0509;
enum E_IMAPI_DF2TAO_NO_RECORDER_SPECIFIED = 0xffffffffc0aa050a;
enum E_IMAPI_DF2TAO_INVALID_ISRC = 0xffffffffc0aa050b;
enum E_IMAPI_DF2TAO_INVALID_MCN = 0xffffffffc0aa050c;
enum E_IMAPI_DF2TAO_STREAM_NOT_SUPPORTED = 0xffffffffc0aa050d;
enum E_IMAPI_DF2TAO_RECORDER_NOT_SUPPORTED = 0xffffffffc0aa050e;
enum E_IMAPI_DF2TAO_CLIENT_NAME_IS_NOT_VALID = 0xffffffffc0aa050f;
enum E_IMAPI_DF2RAW_WRITE_IN_PROGRESS = 0xffffffffc0aa0600;
enum E_IMAPI_DF2RAW_WRITE_NOT_IN_PROGRESS = 0xffffffffc0aa0601;
enum E_IMAPI_DF2RAW_MEDIA_IS_NOT_PREPARED = 0xffffffffc0aa0602;
enum E_IMAPI_DF2RAW_MEDIA_IS_PREPARED = 0xffffffffc0aa0603;
enum E_IMAPI_DF2RAW_CLIENT_NAME_IS_NOT_VALID = 0xffffffffc0aa0604;
enum E_IMAPI_DF2RAW_MEDIA_IS_NOT_BLANK = 0xffffffffc0aa0606;
enum E_IMAPI_DF2RAW_MEDIA_IS_NOT_SUPPORTED = 0xffffffffc0aa0607;
enum E_IMAPI_DF2RAW_NOT_ENOUGH_SPACE = 0xffffffffc0aa0609;
enum E_IMAPI_DF2RAW_NO_RECORDER_SPECIFIED = 0xffffffffc0aa060a;
enum E_IMAPI_DF2RAW_STREAM_NOT_SUPPORTED = 0xffffffffc0aa060d;
enum E_IMAPI_DF2RAW_DATA_BLOCK_TYPE_NOT_SUPPORTED = 0xffffffffc0aa060e;
enum E_IMAPI_DF2RAW_STREAM_LEADIN_TOO_SHORT = 0xffffffffc0aa060f;
enum E_IMAPI_DF2RAW_RECORDER_NOT_SUPPORTED = 0xffffffffc0aa0610;
enum E_IMAPI_ERASE_RECORDER_IN_USE = 0xffffffff80aa0900;
enum E_IMAPI_ERASE_ONLY_ONE_RECORDER_SUPPORTED = 0xffffffff80aa0901;
enum E_IMAPI_ERASE_DISC_INFORMATION_TOO_SMALL = 0xffffffff80aa0902;
enum E_IMAPI_ERASE_MODE_PAGE_2A_TOO_SMALL = 0xffffffff80aa0903;
enum E_IMAPI_ERASE_MEDIA_IS_NOT_ERASABLE = 0xffffffff80aa0904;
enum E_IMAPI_ERASE_DRIVE_FAILED_ERASE_COMMAND = 0xffffffff80aa0905;
enum E_IMAPI_ERASE_TOOK_LONGER_THAN_ONE_HOUR = 0xffffffff80aa0906;
enum E_IMAPI_ERASE_UNEXPECTED_DRIVE_RESPONSE_DURING_ERASE = 0xffffffff80aa0907;
enum E_IMAPI_ERASE_DRIVE_FAILED_SPINUP_COMMAND = 0xffffffff80aa0908;
enum E_IMAPI_ERASE_MEDIA_IS_NOT_SUPPORTED = 0xffffffffc0aa0909;
enum E_IMAPI_ERASE_RECORDER_NOT_SUPPORTED = 0xffffffffc0aa090a;
enum E_IMAPI_ERASE_CLIENT_NAME_IS_NOT_VALID = 0xffffffffc0aa090b;
enum E_IMAPI_RAW_IMAGE_IS_READ_ONLY = 0xffffffff80aa0a00;
enum E_IMAPI_RAW_IMAGE_TOO_MANY_TRACKS = 0xffffffff80aa0a01;
enum E_IMAPI_RAW_IMAGE_SECTOR_TYPE_NOT_SUPPORTED = 0xffffffff80aa0a02;
enum E_IMAPI_RAW_IMAGE_NO_TRACKS = 0xffffffff80aa0a03;
enum E_IMAPI_RAW_IMAGE_TRACKS_ALREADY_ADDED = 0xffffffff80aa0a04;
enum E_IMAPI_RAW_IMAGE_INSUFFICIENT_SPACE = 0xffffffff80aa0a05;
enum E_IMAPI_RAW_IMAGE_TOO_MANY_TRACK_INDEXES = 0xffffffff80aa0a06;
enum E_IMAPI_RAW_IMAGE_TRACK_INDEX_NOT_FOUND = 0xffffffff80aa0a07;
enum S_IMAPI_RAW_IMAGE_TRACK_INDEX_ALREADY_EXISTS = 0x00aa0a08;
enum E_IMAPI_RAW_IMAGE_TRACK_INDEX_OFFSET_ZERO_CANNOT_BE_CLEARED = 0xffffffff80aa0a09;
enum E_IMAPI_RAW_IMAGE_TRACK_INDEX_TOO_CLOSE_TO_OTHER_INDEX = 0xffffffff80aa0a0a;
enum FACILITY_IMAPI2 = 0x000000aa;
enum IMAPI_E_FSI_INTERNAL_ERROR = 0xffffffffc0aab100;
enum IMAPI_E_INVALID_PARAM = 0xffffffffc0aab101;
enum IMAPI_E_READONLY = 0xffffffffc0aab102;
enum IMAPI_E_NO_OUTPUT = 0xffffffffc0aab103;
enum IMAPI_E_INVALID_VOLUME_NAME = 0xffffffffc0aab104;
enum IMAPI_E_INVALID_DATE = 0xffffffffc0aab105;
enum IMAPI_E_FILE_SYSTEM_NOT_EMPTY = 0xffffffffc0aab106;
enum IMAPI_E_NOT_FILE = 0xffffffffc0aab108;
enum IMAPI_E_NOT_DIR = 0xffffffffc0aab109;
enum IMAPI_E_DIR_NOT_EMPTY = 0xffffffffc0aab10a;
enum IMAPI_E_NOT_IN_FILE_SYSTEM = 0xffffffffc0aab10b;
enum IMAPI_E_INVALID_PATH = 0xffffffffc0aab110;
enum IMAPI_E_RESTRICTED_NAME_VIOLATION = 0xffffffffc0aab111;
enum IMAPI_E_DUP_NAME = 0xffffffffc0aab112;
enum IMAPI_E_NO_UNIQUE_NAME = 0xffffffffc0aab113;
enum IMAPI_E_ITEM_NOT_FOUND = 0xffffffffc0aab118;
enum IMAPI_E_FILE_NOT_FOUND = 0xffffffffc0aab119;
enum IMAPI_E_DIR_NOT_FOUND = 0xffffffffc0aab11a;
enum IMAPI_E_IMAGE_SIZE_LIMIT = 0xffffffffc0aab120;
enum IMAPI_E_IMAGE_TOO_BIG = 0xffffffffc0aab121;
enum IMAPI_E_DATA_STREAM_INCONSISTENCY = 0xffffffffc0aab128;
enum IMAPI_E_DATA_STREAM_READ_FAILURE = 0xffffffffc0aab129;
enum IMAPI_E_DATA_STREAM_CREATE_FAILURE = 0xffffffffc0aab12a;
enum IMAPI_E_DIRECTORY_READ_FAILURE = 0xffffffffc0aab12b;
enum IMAPI_E_TOO_MANY_DIRS = 0xffffffffc0aab130;
enum IMAPI_E_ISO9660_LEVELS = 0xffffffffc0aab131;
enum IMAPI_E_DATA_TOO_BIG = 0xffffffffc0aab132;
enum IMAPI_E_INCOMPATIBLE_PREVIOUS_SESSION = 0xffffffffc0aab133;
enum IMAPI_E_STASHFILE_OPEN_FAILURE = 0xffffffffc0aab138;
enum IMAPI_E_STASHFILE_SEEK_FAILURE = 0xffffffffc0aab139;
enum IMAPI_E_STASHFILE_WRITE_FAILURE = 0xffffffffc0aab13a;
enum IMAPI_E_STASHFILE_READ_FAILURE = 0xffffffffc0aab13b;
enum IMAPI_E_INVALID_WORKING_DIRECTORY = 0xffffffffc0aab140;
enum IMAPI_E_WORKING_DIRECTORY_SPACE = 0xffffffffc0aab141;
enum IMAPI_E_STASHFILE_MOVE = 0xffffffffc0aab142;
enum IMAPI_E_BOOT_IMAGE_DATA = 0xffffffffc0aab148;
enum IMAPI_E_BOOT_OBJECT_CONFLICT = 0xffffffffc0aab149;
enum IMAPI_E_BOOT_EMULATION_IMAGE_SIZE_MISMATCH = 0xffffffffc0aab14a;
enum IMAPI_E_EMPTY_DISC = 0xffffffffc0aab150;
enum IMAPI_E_NO_SUPPORTED_FILE_SYSTEM = 0xffffffffc0aab151;
enum IMAPI_E_FILE_SYSTEM_NOT_FOUND = 0xffffffffc0aab152;
enum IMAPI_E_FILE_SYSTEM_READ_CONSISTENCY_ERROR = 0xffffffffc0aab153;
enum IMAPI_E_FILE_SYSTEM_FEATURE_NOT_SUPPORTED = 0xffffffffc0aab154;
enum IMAPI_E_IMPORT_TYPE_COLLISION_FILE_EXISTS_AS_DIRECTORY = 0xffffffffc0aab155;
enum IMAPI_E_IMPORT_SEEK_FAILURE = 0xffffffffc0aab156;
enum IMAPI_E_IMPORT_READ_FAILURE = 0xffffffffc0aab157;
enum IMAPI_E_DISC_MISMATCH = 0xffffffffc0aab158;
enum IMAPI_E_IMPORT_MEDIA_NOT_ALLOWED = 0xffffffffc0aab159;
enum IMAPI_E_UDF_NOT_WRITE_COMPATIBLE = 0xffffffffc0aab15a;
enum IMAPI_E_INCOMPATIBLE_MULTISESSION_TYPE = 0xffffffffc0aab15b;
enum IMAPI_E_NO_COMPATIBLE_MULTISESSION_TYPE = 0xffffffffc0aab15c;
enum IMAPI_E_MULTISESSION_NOT_SET = 0xffffffffc0aab15d;
enum IMAPI_E_IMPORT_TYPE_COLLISION_DIRECTORY_EXISTS_AS_FILE = 0xffffffffc0aab15e;
enum IMAPI_S_IMAGE_FEATURE_NOT_SUPPORTED = 0x00aab15f;
enum IMAPI_E_PROPERTY_NOT_ACCESSIBLE = 0xffffffffc0aab160;
enum IMAPI_E_UDF_REVISION_CHANGE_NOT_ALLOWED = 0xffffffffc0aab161;
enum IMAPI_E_BAD_MULTISESSION_PARAMETER = 0xffffffffc0aab162;
enum IMAPI_E_FILE_SYSTEM_CHANGE_NOT_ALLOWED = 0xffffffffc0aab163;
enum IMAPI_E_IMAGEMANAGER_IMAGE_NOT_ALIGNED = 0xffffffffc0aab200;
enum IMAPI_E_IMAGEMANAGER_NO_VALID_VD_FOUND = 0xffffffffc0aab201;
enum IMAPI_E_IMAGEMANAGER_NO_IMAGE = 0xffffffffc0aab202;
enum IMAPI_E_IMAGEMANAGER_IMAGE_TOO_BIG = 0xffffffffc0aab203;
enum MAPI_E_CALL_FAILED = 0xffffffff80004005;
enum MAPI_E_NOT_ENOUGH_MEMORY = 0xffffffff8007000e;
enum MAPI_E_INVALID_PARAMETER = 0xffffffff80070057;
enum MAPI_E_INTERFACE_NOT_SUPPORTED = 0xffffffff80004002;
enum MAPI_E_NO_ACCESS = 0xffffffff80070005;
enum TAD_ALL_ROWS = 0x00000001;
enum PRILOWEST = 0xffffffffffff8000;
enum PRIHIGHEST = 0x00007fff;
enum PRIUSER = 0x00000000;
enum OPENSTREAMONFILE = "OpenStreamOnFile";
enum szHrDispatchNotifications = "HrDispatchNotifications";
enum szScCreateConversationIndex = "ScCreateConversationIndex";
alias LPWABACTIONITEM = long;
struct ENTRYID
{
    ubyte[4] abFlags;
    ubyte[1] ab;
}
struct MAPIUID
{
    ubyte[16] ab;
}
struct SPropTagArray
{
    uint cValues;
    uint[1] aulPropTag;
}
struct SBinary
{
    uint cb;
    ubyte* lpb;
}
struct SShortArray
{
    uint cValues;
    short* lpi;
}
struct SGuidArray
{
    uint cValues;
    GUID* lpguid;
}
struct SRealArray
{
    uint cValues;
    float* lpflt;
}
struct SLongArray
{
    uint cValues;
    int* lpl;
}
struct SLargeIntegerArray
{
    uint cValues;
    long* lpli;
}
struct SDateTimeArray
{
    uint cValues;
    FILETIME* lpft;
}
struct SAppTimeArray
{
    uint cValues;
    double* lpat;
}
struct SCurrencyArray
{
    uint cValues;
    CY* lpcur;
}
struct SBinaryArray
{
    uint cValues;
    SBinary* lpbin;
}
struct SDoubleArray
{
    uint cValues;
    double* lpdbl;
}
struct SWStringArray
{
    uint cValues;
    PWSTR* lppszW;
}
struct SLPSTRArray
{
    uint cValues;
    PSTR* lppszA;
}
union __UPV
{
    short i;
    int l;
    uint ul;
    float flt;
    double dbl;
    ushort b;
    CY cur;
    double at;
    FILETIME ft;
    PSTR lpszA;
    SBinary bin;
    PWSTR lpszW;
    GUID* lpguid;
    long li;
    SShortArray MVi;
    SLongArray MVl;
    SRealArray MVflt;
    SDoubleArray MVdbl;
    SCurrencyArray MVcur;
    SAppTimeArray MVat;
    SDateTimeArray MVft;
    SBinaryArray MVbin;
    SLPSTRArray MVszA;
    SWStringArray MVszW;
    SGuidArray MVguid;
    SLargeIntegerArray MVli;
    int err;
    int x;
}
struct SPropValue
{
    uint ulPropTag;
    uint dwAlignPad;
    __UPV Value;
}
struct SPropProblem
{
    uint ulIndex;
    uint ulPropTag;
    int scode;
}
struct SPropProblemArray
{
    uint cProblem;
    SPropProblem[1] aProblem;
}
struct FLATENTRY
{
    uint cb;
    ubyte[1] abEntry;
}
struct FLATENTRYLIST
{
    uint cEntries;
    uint cbEntries;
    ubyte[1] abEntries;
}
struct MTSID
{
    uint cb;
    ubyte[1] ab;
}
struct FLATMTSIDLIST
{
    uint cMTSIDs;
    uint cbMTSIDs;
    ubyte[1] abMTSIDs;
}
struct ADRENTRY
{
    uint ulReserved1;
    uint cValues;
    SPropValue* rgPropVals;
}
struct ADRLIST
{
    uint cEntries;
    ADRENTRY[1] aEntries;
}
struct SRow
{
    uint ulAdrEntryPad;
    uint cValues;
    SPropValue* lpProps;
}
struct SRowSet
{
    uint cRows;
    SRow[1] aRow;
}
alias LPALLOCATEBUFFER = int function(uint cbSize, void** lppBuffer);
alias LPALLOCATEMORE = int function(uint cbSize, void* lpObject, void** lppBuffer);
alias LPFREEBUFFER = uint function(void* lpBuffer);
struct MAPIERROR
{
    uint ulVersion;
    byte* lpszError;
    byte* lpszComponent;
    uint ulLowLevelError;
    uint ulContext;
}
struct ERROR_NOTIFICATION
{
    uint cbEntryID;
    ENTRYID* lpEntryID;
    int scode;
    uint ulFlags;
    MAPIERROR* lpMAPIError;
}
struct NEWMAIL_NOTIFICATION
{
    uint cbEntryID;
    ENTRYID* lpEntryID;
    uint cbParentID;
    ENTRYID* lpParentID;
    uint ulFlags;
    byte* lpszMessageClass;
    uint ulMessageFlags;
}
struct OBJECT_NOTIFICATION
{
    uint cbEntryID;
    ENTRYID* lpEntryID;
    uint ulObjType;
    uint cbParentID;
    ENTRYID* lpParentID;
    uint cbOldID;
    ENTRYID* lpOldID;
    uint cbOldParentID;
    ENTRYID* lpOldParentID;
    SPropTagArray* lpPropTagArray;
}
struct TABLE_NOTIFICATION
{
    uint ulTableEvent;
    HRESULT hResult;
    SPropValue propIndex;
    SPropValue propPrior;
    SRow row;
    uint ulPad;
}
struct EXTENDED_NOTIFICATION
{
    uint ulEvent;
    uint cb;
    ubyte* pbEventParameters;
}
struct STATUS_OBJECT_NOTIFICATION
{
    uint cbEntryID;
    ENTRYID* lpEntryID;
    uint cValues;
    SPropValue* lpPropVals;
}
struct NOTIFICATION
{
    uint ulEventType;
    uint ulAlignPad;
    union info
    {
        ERROR_NOTIFICATION err;
        NEWMAIL_NOTIFICATION newmail;
        OBJECT_NOTIFICATION obj;
        TABLE_NOTIFICATION tab;
        EXTENDED_NOTIFICATION ext;
        STATUS_OBJECT_NOTIFICATION statobj;
    }
}
// [Not Found] IID_IMAPIAdviseSink
interface IMAPIAdviseSink : IUnknown
{
    uint OnNotify(uint cNotif, NOTIFICATION* lpNotifications);
}
alias LPNOTIFCALLBACK = int function(void* lpvContext, uint cNotification, NOTIFICATION* lpNotifications);
// [Not Found] IID_IMAPIProgress
interface IMAPIProgress : IUnknown
{
    HRESULT Progress(uint ulValue, uint ulCount, uint ulTotal);
    HRESULT GetFlags(uint* lpulFlags);
    HRESULT GetMax(uint* lpulMax);
    HRESULT GetMin(uint* lpulMin);
    HRESULT SetLimits(uint* lpulMin, uint* lpulMax, uint* lpulFlags);
}
struct MAPINAMEID
{
    GUID* lpguid;
    uint ulKind;
    union Kind
    {
        int lID;
        PWSTR lpwstrName;
    }
}
// [Not Found] IID_IMAPIProp
interface IMAPIProp : IUnknown
{
    HRESULT GetLastError(HRESULT hResult, uint ulFlags, MAPIERROR** lppMAPIError);
    HRESULT SaveChanges(uint ulFlags);
    HRESULT GetProps(SPropTagArray* lpPropTagArray, uint ulFlags, uint* lpcValues, SPropValue** lppPropArray);
    HRESULT GetPropList(uint ulFlags, SPropTagArray** lppPropTagArray);
    HRESULT OpenProperty(uint ulPropTag, GUID* lpiid, uint ulInterfaceOptions, uint ulFlags, IUnknown* lppUnk);
    HRESULT SetProps(uint cValues, SPropValue* lpPropArray, SPropProblemArray** lppProblems);
    HRESULT DeleteProps(SPropTagArray* lpPropTagArray, SPropProblemArray** lppProblems);
    HRESULT CopyTo(uint ciidExclude, GUID* rgiidExclude, SPropTagArray* lpExcludeProps, ulong ulUIParam, IMAPIProgress lpProgress, GUID* lpInterface, void* lpDestObj, uint ulFlags, SPropProblemArray** lppProblems);
    HRESULT CopyProps(SPropTagArray* lpIncludeProps, ulong ulUIParam, IMAPIProgress lpProgress, GUID* lpInterface, void* lpDestObj, uint ulFlags, SPropProblemArray** lppProblems);
    HRESULT GetNamesFromIDs(SPropTagArray** lppPropTags, GUID* lpPropSetGuid, uint ulFlags, uint* lpcPropNames, MAPINAMEID*** lpppPropNames);
    HRESULT GetIDsFromNames(uint cPropNames, MAPINAMEID** lppPropNames, uint ulFlags, SPropTagArray** lppPropTags);
}
struct SSortOrder
{
    uint ulPropTag;
    uint ulOrder;
}
struct SSortOrderSet
{
    uint cSorts;
    uint cCategories;
    uint cExpanded;
    SSortOrder[1] aSort;
}
struct SAndRestriction
{
    uint cRes;
    SRestriction* lpRes;
}
struct SOrRestriction
{
    uint cRes;
    SRestriction* lpRes;
}
struct SNotRestriction
{
    uint ulReserved;
    SRestriction* lpRes;
}
struct SContentRestriction
{
    uint ulFuzzyLevel;
    uint ulPropTag;
    SPropValue* lpProp;
}
struct SBitMaskRestriction
{
    uint relBMR;
    uint ulPropTag;
    uint ulMask;
}
struct SPropertyRestriction
{
    uint relop;
    uint ulPropTag;
    SPropValue* lpProp;
}
struct SComparePropsRestriction
{
    uint relop;
    uint ulPropTag1;
    uint ulPropTag2;
}
struct SSizeRestriction
{
    uint relop;
    uint ulPropTag;
    uint cb;
}
struct SExistRestriction
{
    uint ulReserved1;
    uint ulPropTag;
    uint ulReserved2;
}
struct SSubRestriction
{
    uint ulSubObject;
    SRestriction* lpRes;
}
struct SCommentRestriction
{
    uint cValues;
    SRestriction* lpRes;
    SPropValue* lpProp;
}
struct SRestriction
{
    uint rt;
    union res
    {
        SComparePropsRestriction resCompareProps;
        SAndRestriction resAnd;
        SOrRestriction resOr;
        SNotRestriction resNot;
        SContentRestriction resContent;
        SPropertyRestriction resProperty;
        SBitMaskRestriction resBitMask;
        SSizeRestriction resSize;
        SExistRestriction resExist;
        SSubRestriction resSub;
        SCommentRestriction resComment;
    }
}
// [Not Found] IID_IMAPITable
interface IMAPITable : IUnknown
{
    HRESULT GetLastError(HRESULT hResult, uint ulFlags, MAPIERROR** lppMAPIError);
    HRESULT Advise(uint ulEventMask, IMAPIAdviseSink lpAdviseSink, uint* lpulConnection);
    HRESULT Unadvise(uint ulConnection);
    HRESULT GetStatus(uint* lpulTableStatus, uint* lpulTableType);
    HRESULT SetColumns(SPropTagArray* lpPropTagArray, uint ulFlags);
    HRESULT QueryColumns(uint ulFlags, SPropTagArray** lpPropTagArray);
    HRESULT GetRowCount(uint ulFlags, uint* lpulCount);
    HRESULT SeekRow(uint bkOrigin, int lRowCount, int* lplRowsSought);
    HRESULT SeekRowApprox(uint ulNumerator, uint ulDenominator);
    HRESULT QueryPosition(uint* lpulRow, uint* lpulNumerator, uint* lpulDenominator);
    HRESULT FindRow(SRestriction* lpRestriction, uint bkOrigin, uint ulFlags);
    HRESULT Restrict(SRestriction* lpRestriction, uint ulFlags);
    HRESULT CreateBookmark(uint* lpbkPosition);
    HRESULT FreeBookmark(uint bkPosition);
    HRESULT SortTable(SSortOrderSet* lpSortCriteria, uint ulFlags);
    HRESULT QuerySortOrder(SSortOrderSet** lppSortCriteria);
    HRESULT QueryRows(int lRowCount, uint ulFlags, SRowSet** lppRows);
    HRESULT Abort();
    HRESULT ExpandRow(uint cbInstanceKey, ubyte* pbInstanceKey, uint ulRowCount, uint ulFlags, SRowSet** lppRows, uint* lpulMoreRows);
    HRESULT CollapseRow(uint cbInstanceKey, ubyte* pbInstanceKey, uint ulFlags, uint* lpulRowCount);
    HRESULT WaitForCompletion(uint ulFlags, uint ulTimeout, uint* lpulTableStatus);
    HRESULT GetCollapseState(uint ulFlags, uint cbInstanceKey, ubyte* lpbInstanceKey, uint* lpcbCollapseState, ubyte** lppbCollapseState);
    HRESULT SetCollapseState(uint ulFlags, uint cbCollapseState, ubyte* pbCollapseState, uint* lpbkLocation);
}
// [Not Found] IID_IProfSect
interface IProfSect : IMAPIProp
{
}
// [Not Found] IID_IMAPIStatus
interface IMAPIStatus : IMAPIProp
{
    HRESULT ValidateState(ulong ulUIParam, uint ulFlags);
    HRESULT SettingsDialog(ulong ulUIParam, uint ulFlags);
    HRESULT ChangePassword(byte* lpOldPass, byte* lpNewPass, uint ulFlags);
    HRESULT FlushQueues(ulong ulUIParam, uint cbTargetTransport, ENTRYID* lpTargetTransport, uint ulFlags);
}
// [Not Found] IID_IMAPIContainer
interface IMAPIContainer : IMAPIProp
{
    HRESULT GetContentsTable(uint ulFlags, IMAPITable* lppTable);
    HRESULT GetHierarchyTable(uint ulFlags, IMAPITable* lppTable);
    HRESULT OpenEntry(uint cbEntryID, ENTRYID* lpEntryID, GUID* lpInterface, uint ulFlags, uint* lpulObjType, IUnknown* lppUnk);
    HRESULT SetSearchCriteria(SRestriction* lpRestriction, SBinaryArray* lpContainerList, uint ulSearchFlags);
    HRESULT GetSearchCriteria(uint ulFlags, SRestriction** lppRestriction, SBinaryArray** lppContainerList, uint* lpulSearchState);
}
struct FlagList
{
    uint cFlags;
    uint[1] ulFlag;
}
// [Not Found] IID_IABContainer
interface IABContainer : IMAPIContainer
{
    HRESULT CreateEntry(uint cbEntryID, ENTRYID* lpEntryID, uint ulCreateFlags, IMAPIProp* lppMAPIPropEntry);
    HRESULT CopyEntries(SBinaryArray* lpEntries, ulong ulUIParam, IMAPIProgress lpProgress, uint ulFlags);
    HRESULT DeleteEntries(SBinaryArray* lpEntries, uint ulFlags);
    HRESULT ResolveNames(SPropTagArray* lpPropTagArray, uint ulFlags, ADRLIST* lpAdrList, FlagList* lpFlagList);
}
// [Not Found] IID_IMailUser
interface IMailUser : IMAPIProp
{
}
// [Not Found] IID_IDistList
interface IDistList : IMAPIContainer
{
    HRESULT CreateEntry(uint cbEntryID, ENTRYID* lpEntryID, uint ulCreateFlags, IMAPIProp* lppMAPIPropEntry);
    HRESULT CopyEntries(SBinaryArray* lpEntries, ulong ulUIParam, IMAPIProgress lpProgress, uint ulFlags);
    HRESULT DeleteEntries(SBinaryArray* lpEntries, uint ulFlags);
    HRESULT ResolveNames(SPropTagArray* lpPropTagArray, uint ulFlags, ADRLIST* lpAdrList, FlagList* lpFlagList);
}
// [Not Found] IID_IMAPIFolder
interface IMAPIFolder : IMAPIContainer
{
    HRESULT CreateMessage(GUID* lpInterface, uint ulFlags, IMessage* lppMessage);
    HRESULT CopyMessages(SBinaryArray* lpMsgList, GUID* lpInterface, void* lpDestFolder, ulong ulUIParam, IMAPIProgress lpProgress, uint ulFlags);
    HRESULT DeleteMessages(SBinaryArray* lpMsgList, ulong ulUIParam, IMAPIProgress lpProgress, uint ulFlags);
    HRESULT CreateFolder(uint ulFolderType, byte* lpszFolderName, byte* lpszFolderComment, GUID* lpInterface, uint ulFlags, IMAPIFolder* lppFolder);
    HRESULT CopyFolder(uint cbEntryID, ENTRYID* lpEntryID, GUID* lpInterface, void* lpDestFolder, byte* lpszNewFolderName, ulong ulUIParam, IMAPIProgress lpProgress, uint ulFlags);
    HRESULT DeleteFolder(uint cbEntryID, ENTRYID* lpEntryID, ulong ulUIParam, IMAPIProgress lpProgress, uint ulFlags);
    HRESULT SetReadFlags(SBinaryArray* lpMsgList, ulong ulUIParam, IMAPIProgress lpProgress, uint ulFlags);
    HRESULT GetMessageStatus(uint cbEntryID, ENTRYID* lpEntryID, uint ulFlags, uint* lpulMessageStatus);
    HRESULT SetMessageStatus(uint cbEntryID, ENTRYID* lpEntryID, uint ulNewStatus, uint ulNewStatusMask, uint* lpulOldStatus);
    HRESULT SaveContentsSort(SSortOrderSet* lpSortCriteria, uint ulFlags);
    HRESULT EmptyFolder(ulong ulUIParam, IMAPIProgress lpProgress, uint ulFlags);
}
// [Not Found] IID_IMsgStore
interface IMsgStore : IMAPIProp
{
    HRESULT Advise(uint cbEntryID, ENTRYID* lpEntryID, uint ulEventMask, IMAPIAdviseSink lpAdviseSink, uint* lpulConnection);
    HRESULT Unadvise(uint ulConnection);
    HRESULT CompareEntryIDs(uint cbEntryID1, ENTRYID* lpEntryID1, uint cbEntryID2, ENTRYID* lpEntryID2, uint ulFlags, uint* lpulResult);
    HRESULT OpenEntry(uint cbEntryID, ENTRYID* lpEntryID, GUID* lpInterface, uint ulFlags, uint* lpulObjType, IUnknown* ppUnk);
    HRESULT SetReceiveFolder(byte* lpszMessageClass, uint ulFlags, uint cbEntryID, ENTRYID* lpEntryID);
    HRESULT GetReceiveFolder(byte* lpszMessageClass, uint ulFlags, uint* lpcbEntryID, ENTRYID** lppEntryID, byte** lppszExplicitClass);
    HRESULT GetReceiveFolderTable(uint ulFlags, IMAPITable* lppTable);
    HRESULT StoreLogoff(uint* lpulFlags);
    HRESULT AbortSubmit(uint cbEntryID, ENTRYID* lpEntryID, uint ulFlags);
    HRESULT GetOutgoingQueue(uint ulFlags, IMAPITable* lppTable);
    HRESULT SetLockState(IMessage lpMessage, uint ulLockState);
    HRESULT FinishedMsg(uint ulFlags, uint cbEntryID, ENTRYID* lpEntryID);
    HRESULT NotifyNewMail(NOTIFICATION* lpNotification);
}
// [Not Found] IID_IMessage
interface IMessage : IMAPIProp
{
    HRESULT GetAttachmentTable(uint ulFlags, IMAPITable* lppTable);
    HRESULT OpenAttach(uint ulAttachmentNum, GUID* lpInterface, uint ulFlags, IAttach* lppAttach);
    HRESULT CreateAttach(GUID* lpInterface, uint ulFlags, uint* lpulAttachmentNum, IAttach* lppAttach);
    HRESULT DeleteAttach(uint ulAttachmentNum, ulong ulUIParam, IMAPIProgress lpProgress, uint ulFlags);
    HRESULT GetRecipientTable(uint ulFlags, IMAPITable* lppTable);
    HRESULT ModifyRecipients(uint ulFlags, ADRLIST* lpMods);
    HRESULT SubmitMessage(uint ulFlags);
    HRESULT SetReadFlag(uint ulFlags);
}
// [Not Found] IID_IAttach
interface IAttach : IMAPIProp
{
}
alias LPFNABSDI = BOOL function(ulong ulUIParam, void* lpvmsg);
alias LPFNDISMISS = void function(ulong ulUIParam, void* lpvContext);
alias LPFNBUTTON = int function(ulong ulUIParam, void* lpvContext, uint cbEntryID, ENTRYID* lpSelection, uint ulFlags);
struct ADRPARM
{
    uint cbABContEntryID;
    ENTRYID* lpABContEntryID;
    uint ulFlags;
    void* lpReserved;
    uint ulHelpContext;
    byte* lpszHelpFileName;
    LPFNABSDI lpfnABSDI;
    LPFNDISMISS lpfnDismiss;
    void* lpvDismissContext;
    byte* lpszCaption;
    byte* lpszNewEntryTitle;
    byte* lpszDestWellsTitle;
    uint cDestFields;
    uint nDestFieldFocus;
    byte** lppszDestTitles;
    uint* lpulDestComps;
    SRestriction* lpContRestriction;
    SRestriction* lpHierRestriction;
}
// [Not Found] IID_IMAPIControl
interface IMAPIControl : IUnknown
{
    HRESULT GetLastError(HRESULT hResult, uint ulFlags, MAPIERROR** lppMAPIError);
    HRESULT Activate(uint ulFlags, ulong ulUIParam);
    HRESULT GetState(uint ulFlags, uint* lpulState);
}
struct DTBLLABEL
{
    uint ulbLpszLabelName;
    uint ulFlags;
}
struct DTBLEDIT
{
    uint ulbLpszCharsAllowed;
    uint ulFlags;
    uint ulNumCharsAllowed;
    uint ulPropTag;
}
struct DTBLLBX
{
    uint ulFlags;
    uint ulPRSetProperty;
    uint ulPRTableName;
}
struct DTBLCOMBOBOX
{
    uint ulbLpszCharsAllowed;
    uint ulFlags;
    uint ulNumCharsAllowed;
    uint ulPRPropertyName;
    uint ulPRTableName;
}
struct DTBLDDLBX
{
    uint ulFlags;
    uint ulPRDisplayProperty;
    uint ulPRSetProperty;
    uint ulPRTableName;
}
struct DTBLCHECKBOX
{
    uint ulbLpszLabel;
    uint ulFlags;
    uint ulPRPropertyName;
}
struct DTBLGROUPBOX
{
    uint ulbLpszLabel;
    uint ulFlags;
}
struct DTBLBUTTON
{
    uint ulbLpszLabel;
    uint ulFlags;
    uint ulPRControl;
}
struct DTBLPAGE
{
    uint ulbLpszLabel;
    uint ulFlags;
    uint ulbLpszComponent;
    uint ulContext;
}
struct DTBLRADIOBUTTON
{
    uint ulbLpszLabel;
    uint ulFlags;
    uint ulcButtons;
    uint ulPropTag;
    int lReturnValue;
}
struct DTBLMVLISTBOX
{
    uint ulFlags;
    uint ulMVPropTag;
}
struct DTBLMVDDLBX
{
    uint ulFlags;
    uint ulMVPropTag;
}
// [Not Found] IID_IProviderAdmin
interface IProviderAdmin : IUnknown
{
    HRESULT GetLastError(HRESULT hResult, uint ulFlags, MAPIERROR** lppMAPIError);
    HRESULT GetProviderTable(uint ulFlags, IMAPITable* lppTable);
    HRESULT CreateProvider(byte* lpszProvider, uint cValues, SPropValue* lpProps, ulong ulUIParam, uint ulFlags, MAPIUID* lpUID);
    HRESULT DeleteProvider(MAPIUID* lpUID);
    HRESULT OpenProfileSection(MAPIUID* lpUID, GUID* lpInterface, uint ulFlags, IProfSect* lppProfSect);
}
alias Gender = int;
enum : int
{
    genderUnspecified = 0x00000000,
    genderFemale      = 0x00000001,
    genderMale        = 0x00000002,
}

alias CALLERRELEASE = void function(uint ulCallerData, ITableData lpTblData, IMAPITable lpVue);
// [Not Found] IID_ITableData
interface ITableData : IUnknown
{
    HRESULT HrGetView(SSortOrderSet* lpSSortOrderSet, CALLERRELEASE* lpfCallerRelease, uint ulCallerData, IMAPITable* lppMAPITable);
    HRESULT HrModifyRow(SRow* param0);
    HRESULT HrDeleteRow(SPropValue* lpSPropValue);
    HRESULT HrQueryRow(SPropValue* lpsPropValue, SRow** lppSRow, uint* lpuliRow);
    HRESULT HrEnumRow(uint ulRowNumber, SRow** lppSRow);
    HRESULT HrNotify(uint ulFlags, uint cValues, SPropValue* lpSPropValue);
    HRESULT HrInsertRow(uint uliRow, SRow* lpSRow);
    HRESULT HrModifyRows(uint ulFlags, SRowSet* lpSRowSet);
    HRESULT HrDeleteRows(uint ulFlags, SRowSet* lprowsetToDelete, uint* cRowsDeleted);
}
// [Not Found] IID_IPropData
interface IPropData : IMAPIProp
{
    HRESULT HrSetObjAccess(uint ulAccess);
    HRESULT HrSetPropAccess(SPropTagArray* lpPropTagArray, uint* rgulAccess);
    HRESULT HrGetPropAccess(SPropTagArray** lppPropTagArray, uint** lprgulAccess);
    HRESULT HrAddObjProps(SPropTagArray* lppPropTagArray, SPropProblemArray** lprgulAccess);
}
alias PFNIDLE = BOOL function(void* param0);
alias LPOPENSTREAMONFILE = HRESULT function(LPALLOCATEBUFFER lpAllocateBuffer, LPFREEBUFFER lpFreeBuffer, uint ulFlags, byte* lpszFileName, byte* lpszPrefix, IStream* lppStream);
struct DTCTL
{
    uint ulCtlType;
    uint ulCtlFlags;
    ubyte* lpbNotif;
    uint cbNotif;
    byte* lpszFilter;
    uint ulItemID;
    union ctl
    {
        void* lpv;
        DTBLLABEL* lplabel;
        DTBLEDIT* lpedit;
        DTBLLBX* lplbx;
        DTBLCOMBOBOX* lpcombobox;
        DTBLDDLBX* lpddlbx;
        DTBLCHECKBOX* lpcheckbox;
        DTBLGROUPBOX* lpgroupbox;
        DTBLBUTTON* lpbutton;
        DTBLRADIOBUTTON* lpradiobutton;
        DTBLMVLISTBOX* lpmvlbx;
        DTBLMVDDLBX* lpmvddlbx;
        DTBLPAGE* lppage;
    }
}
struct DTPAGE
{
    uint cctl;
    byte* lpszResourceName;
    union
    {
        byte* lpszComponent;
        uint ulItemID;
    }
    DTCTL* lpctl;
}
alias LPDISPATCHNOTIFICATIONS = HRESULT function(uint ulFlags);
alias LPCREATECONVERSATIONINDEX = int function(uint cbParent, ubyte* lpbParent, uint* lpcbConvIndex, ubyte** lppbConvIndex);
// [Not Found] IID_IAddrBook
interface IAddrBook : IMAPIProp
{
    HRESULT OpenEntry(uint cbEntryID, ENTRYID* lpEntryID, GUID* lpInterface, uint ulFlags, uint* lpulObjType, IUnknown* lppUnk);
    HRESULT CompareEntryIDs(uint cbEntryID1, ENTRYID* lpEntryID1, uint cbEntryID2, ENTRYID* lpEntryID2, uint ulFlags, uint* lpulResult);
    HRESULT Advise(uint cbEntryID, ENTRYID* lpEntryID, uint ulEventMask, IMAPIAdviseSink lpAdviseSink, uint* lpulConnection);
    HRESULT Unadvise(uint ulConnection);
    HRESULT CreateOneOff(byte* lpszName, byte* lpszAdrType, byte* lpszAddress, uint ulFlags, uint* lpcbEntryID, ENTRYID** lppEntryID);
    HRESULT NewEntry(uint ulUIParam, uint ulFlags, uint cbEIDContainer, ENTRYID* lpEIDContainer, uint cbEIDNewEntryTpl, ENTRYID* lpEIDNewEntryTpl, uint* lpcbEIDNewEntry, ENTRYID** lppEIDNewEntry);
    HRESULT ResolveName(ulong ulUIParam, uint ulFlags, byte* lpszNewEntryTitle, ADRLIST* lpAdrList);
    HRESULT Address(uint* lpulUIParam, ADRPARM* lpAdrParms, ADRLIST** lppAdrList);
    HRESULT Details(ulong* lpulUIParam, LPFNDISMISS lpfnDismiss, void* lpvDismissContext, uint cbEntryID, ENTRYID* lpEntryID, LPFNBUTTON lpfButtonCallback, void* lpvButtonContext, byte* lpszButtonText, uint ulFlags);
    HRESULT RecipOptions(uint ulUIParam, uint ulFlags, ADRENTRY* lpRecip);
    HRESULT QueryDefaultRecipOpt(byte* lpszAdrType, uint ulFlags, uint* lpcValues, SPropValue** lppOptions);
    HRESULT GetPAB(uint* lpcbEntryID, ENTRYID** lppEntryID);
    HRESULT SetPAB(uint cbEntryID, ENTRYID* lpEntryID);
    HRESULT GetDefaultDir(uint* lpcbEntryID, ENTRYID** lppEntryID);
    HRESULT SetDefaultDir(uint cbEntryID, ENTRYID* lpEntryID);
    HRESULT GetSearchPath(uint ulFlags, SRowSet** lppSearchPath);
    HRESULT SetSearchPath(uint ulFlags, SRowSet* lpSearchPath);
    HRESULT PrepareRecips(uint ulFlags, SPropTagArray* lpPropTagArray, ADRLIST* lpRecipList);
}
// [Not Found] IID_IWABObject
interface IWABObject : IUnknown
{
    HRESULT GetLastError(HRESULT hResult, uint ulFlags, MAPIERROR** lppMAPIError);
    HRESULT AllocateBuffer(uint cbSize, void** lppBuffer);
    HRESULT AllocateMore(uint cbSize, void* lpObject, void** lppBuffer);
    HRESULT FreeBuffer(void* lpBuffer);
    HRESULT Backup(PSTR lpFileName);
    HRESULT Import(PSTR lpWIP);
    HRESULT Find(IAddrBook lpIAB, HWND hWnd);
    HRESULT VCardDisplay(IAddrBook lpIAB, HWND hWnd, PSTR lpszFileName);
    HRESULT LDAPUrl(IAddrBook lpIAB, HWND hWnd, uint ulFlags, PSTR lpszURL, IMailUser* lppMailUser);
    HRESULT VCardCreate(IAddrBook lpIAB, uint ulFlags, PSTR lpszVCard, IMailUser lpMailUser);
    HRESULT VCardRetrieve(IAddrBook lpIAB, uint ulFlags, PSTR lpszVCard, IMailUser* lppMailUser);
    HRESULT GetMe(IAddrBook lpIAB, uint ulFlags, uint* lpdwAction, SBinary* lpsbEID, HWND hwnd);
    HRESULT SetMe(IAddrBook lpIAB, uint ulFlags, SBinary sbEID, HWND hwnd);
}
struct WAB_PARAM
{
    uint cbSize;
    HWND hwnd;
    PSTR szFileName;
    uint ulFlags;
    GUID guidPSExt;
}
alias LPWABOPEN = HRESULT function(IAddrBook* lppAdrBook, IWABObject* lppWABObject, WAB_PARAM* lpWP, uint Reserved2);
alias LPWABOPENEX = HRESULT function(IAddrBook* lppAdrBook, IWABObject* lppWABObject, WAB_PARAM* lpWP, uint Reserved, LPALLOCATEBUFFER fnAllocateBuffer, LPALLOCATEMORE fnAllocateMore, LPFREEBUFFER fnFreeBuffer);
struct WABIMPORTPARAM
{
    uint cbSize;
    IAddrBook lpAdrBook;
    HWND hWnd;
    uint ulFlags;
    PSTR lpszFileName;
}
struct WABEXTDISPLAY
{
    uint cbSize;
    IWABObject lpWABObject;
    IAddrBook lpAdrBook;
    IMAPIProp lpPropObj;
    BOOL fReadOnly;
    BOOL fDataChanged;
    uint ulFlags;
    void* lpv;
    byte* lpsz;
}
enum IID_IWABExtInit = GUID(0xea22ebf0, 0x87a4, 0x11d1, [0x9a, 0xcf, 0x0, 0xa0, 0xc9, 0x1f, 0x9c, 0x8b]);
interface IWABExtInit : IUnknown
{
    HRESULT Initialize(WABEXTDISPLAY* lpWABExtDisplay);
}
alias LPWABALLOCATEBUFFER = int function(IWABObject lpWABObject, uint cbSize, void** lppBuffer);
alias LPWABALLOCATEMORE = int function(IWABObject lpWABObject, uint cbSize, void* lpObject, void** lppBuffer);
alias LPWABFREEBUFFER = uint function(IWABObject lpWABObject, void* lpBuffer);
struct NOTIFKEY
{
    uint cb;
    ubyte[1] ab;
}
