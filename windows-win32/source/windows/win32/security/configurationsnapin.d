module windows.win32.security.configurationsnapin;

import windows.win32.guid : GUID;
import windows.win32.foundation : BOOL, HRESULT;
import windows.win32.system.com_ : IUnknown;

version (Windows):
extern (Windows):

alias SCE_LOG_ERR_LEVEL = uint;
enum : uint
{
    SCE_LOG_LEVEL_ALWAYS = 0x00000000,
    SCE_LOG_LEVEL_ERROR  = 0x00000001,
    SCE_LOG_LEVEL_DETAIL = 0x00000002,
    SCE_LOG_LEVEL_DEBUG  = 0x00000003,
}

enum cNodetypeSceTemplateServices = GUID(0x24a7f717, 0x1f0c, 0x11d1, [0xaf, 0xfb, 0x0, 0xc0, 0x4f, 0xb9, 0x84, 0xf9]);
enum cNodetypeSceAnalysisServices = GUID(0x678050c7, 0x1ff8, 0x11d1, [0xaf, 0xfb, 0x0, 0xc0, 0x4f, 0xb9, 0x84, 0xf9]);
enum cNodetypeSceEventLog = GUID(0x2ce06698, 0x4bf3, 0x11d1, [0x8c, 0x30, 0x0, 0xc0, 0x4f, 0xb9, 0x84, 0xf9]);
enum SCESTATUS_SUCCESS = 0x00000000;
enum SCESTATUS_INVALID_PARAMETER = 0x00000001;
enum SCESTATUS_RECORD_NOT_FOUND = 0x00000002;
enum SCESTATUS_INVALID_DATA = 0x00000003;
enum SCESTATUS_OBJECT_EXIST = 0x00000004;
enum SCESTATUS_BUFFER_TOO_SMALL = 0x00000005;
enum SCESTATUS_PROFILE_NOT_FOUND = 0x00000006;
enum SCESTATUS_BAD_FORMAT = 0x00000007;
enum SCESTATUS_NOT_ENOUGH_RESOURCE = 0x00000008;
enum SCESTATUS_ACCESS_DENIED = 0x00000009;
enum SCESTATUS_CANT_DELETE = 0x0000000a;
enum SCESTATUS_PREFIX_OVERFLOW = 0x0000000b;
enum SCESTATUS_OTHER_ERROR = 0x0000000c;
enum SCESTATUS_ALREADY_RUNNING = 0x0000000d;
enum SCESTATUS_SERVICE_NOT_SUPPORT = 0x0000000e;
enum SCESTATUS_MOD_NOT_FOUND = 0x0000000f;
enum SCESTATUS_EXCEPTION_IN_SERVER = 0x00000010;
enum SCESTATUS_NO_TEMPLATE_GIVEN = 0x00000011;
enum SCESTATUS_NO_MAPPING = 0x00000012;
enum SCESTATUS_TRUST_FAIL = 0x00000013;
enum SCE_ROOT_PATH = "Software\\Microsoft\\Windows NT\\CurrentVersion\\SeCEdit";
enum SCESVC_ENUMERATION_MAX = 0x00000064;
enum struuidNodetypeSceTemplateServices = "{24a7f717-1f0c-11d1-affb-00c04fb984f9}";
enum lstruuidNodetypeSceTemplateServices = "{24a7f717-1f0c-11d1-affb-00c04fb984f9}";
enum struuidNodetypeSceAnalysisServices = "{678050c7-1ff8-11d1-affb-00c04fb984f9}";
enum lstruuidNodetypeSceAnalysisServices = "{678050c7-1ff8-11d1-affb-00c04fb984f9}";
enum struuidNodetypeSceEventLog = "{2ce06698-4bf3-11d1-8c30-00c04fb984f9}";
enum lstruuidNodetypeSceEventLog = "{2ce06698-4bf3-11d1-8c30-00c04fb984f9}";
enum CCF_SCESVC_ATTACHMENT = "CCF_SCESVC_ATTACHMENT";
enum CCF_SCESVC_ATTACHMENT_DATA = "CCF_SCESVC_ATTACHMENT_DATA";
struct SCESVC_CONFIGURATION_LINE
{
    byte* Key;
    byte* Value;
    uint ValueLen;
}
struct SCESVC_CONFIGURATION_INFO
{
    uint Count;
    SCESVC_CONFIGURATION_LINE* Lines;
}
alias SCESVC_INFO_TYPE = int;
enum : int
{
    SceSvcConfigurationInfo = 0x00000000,
    SceSvcMergedPolicyInfo  = 0x00000001,
    SceSvcAnalysisInfo      = 0x00000002,
    SceSvcInternalUse       = 0x00000003,
}

struct SCESVC_ANALYSIS_LINE
{
    byte* Key;
    ubyte* Value;
    uint ValueLen;
}
struct SCESVC_ANALYSIS_INFO
{
    uint Count;
    SCESVC_ANALYSIS_LINE* Lines;
}
alias PFSCE_QUERY_INFO = uint function(void*, SCESVC_INFO_TYPE, byte*, BOOL, void**, uint*);
alias PFSCE_SET_INFO = uint function(void*, SCESVC_INFO_TYPE, byte*, BOOL, void*);
alias PFSCE_FREE_INFO = uint function(void*);
alias PFSCE_LOG_INFO = uint function(SCE_LOG_ERR_LEVEL, uint, byte*);
struct SCESVC_CALLBACK_INFO
{
    void* sceHandle;
    PFSCE_QUERY_INFO pfQueryInfo;
    PFSCE_SET_INFO pfSetInfo;
    PFSCE_FREE_INFO pfFreeInfo;
    PFSCE_LOG_INFO pfLogInfo;
}
alias PF_ConfigAnalyzeService = uint function(SCESVC_CALLBACK_INFO*);
alias PF_UpdateService = uint function(SCESVC_CALLBACK_INFO*, SCESVC_CONFIGURATION_INFO*);
enum IID_ISceSvcAttachmentPersistInfo = GUID(0x6d90e0d0, 0x200d, 0x11d1, [0xaf, 0xfb, 0x0, 0xc0, 0x4f, 0xb9, 0x84, 0xf9]);
interface ISceSvcAttachmentPersistInfo : IUnknown
{
    HRESULT Save(byte*, void**, void**, BOOL*);
    HRESULT IsDirty(byte*);
    HRESULT FreeBuffer(void*);
}
enum IID_ISceSvcAttachmentData = GUID(0x17c35fde, 0x200d, 0x11d1, [0xaf, 0xfb, 0x0, 0xc0, 0x4f, 0xb9, 0x84, 0xf9]);
interface ISceSvcAttachmentData : IUnknown
{
    HRESULT GetData(void*, SCESVC_INFO_TYPE, void**, uint*);
    HRESULT Initialize(byte*, byte*, ISceSvcAttachmentPersistInfo, void**);
    HRESULT FreeBuffer(void*);
    HRESULT CloseHandle(void*);
}
