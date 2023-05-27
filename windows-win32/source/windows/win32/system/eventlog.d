module windows.win32.system.eventlog;

import windows.win32.guid : GUID;
import windows.win32.foundation : BOOL, FILETIME, HANDLE, PSID, PSTR, PWSTR, SYSTEMTIME;

version (Windows):
extern (Windows):

alias REPORT_EVENT_TYPE = ushort;
enum : ushort
{
    EVENTLOG_SUCCESS          = 0x0000,
    EVENTLOG_AUDIT_FAILURE    = 0x0010,
    EVENTLOG_AUDIT_SUCCESS    = 0x0008,
    EVENTLOG_ERROR_TYPE       = 0x0001,
    EVENTLOG_INFORMATION_TYPE = 0x0004,
    EVENTLOG_WARNING_TYPE     = 0x0002,
}

alias READ_EVENT_LOG_READ_FLAGS = uint;
enum : uint
{
    EVENTLOG_SEEK_READ       = 0x00000002,
    EVENTLOG_SEQUENTIAL_READ = 0x00000001,
}

EVT_HANDLE EvtOpenSession(EVT_LOGIN_CLASS, void*, uint, uint);
BOOL EvtClose(EVT_HANDLE);
BOOL EvtCancel(EVT_HANDLE);
uint EvtGetExtendedStatus(uint, PWSTR, uint*);
EVT_HANDLE EvtQuery(EVT_HANDLE, const(wchar)*, const(wchar)*, uint);
BOOL EvtNext(EVT_HANDLE, uint, long*, uint, uint, uint*);
BOOL EvtSeek(EVT_HANDLE, long, EVT_HANDLE, uint, uint);
EVT_HANDLE EvtSubscribe(EVT_HANDLE, HANDLE, const(wchar)*, const(wchar)*, EVT_HANDLE, void*, EVT_SUBSCRIBE_CALLBACK, uint);
EVT_HANDLE EvtCreateRenderContext(uint, const(wchar)**, uint);
BOOL EvtRender(EVT_HANDLE, EVT_HANDLE, uint, uint, void*, uint*, uint*);
BOOL EvtFormatMessage(EVT_HANDLE, EVT_HANDLE, uint, uint, EVT_VARIANT*, uint, uint, PWSTR, uint*);
EVT_HANDLE EvtOpenLog(EVT_HANDLE, const(wchar)*, uint);
BOOL EvtGetLogInfo(EVT_HANDLE, EVT_LOG_PROPERTY_ID, uint, EVT_VARIANT*, uint*);
BOOL EvtClearLog(EVT_HANDLE, const(wchar)*, const(wchar)*, uint);
BOOL EvtExportLog(EVT_HANDLE, const(wchar)*, const(wchar)*, const(wchar)*, uint);
BOOL EvtArchiveExportedLog(EVT_HANDLE, const(wchar)*, uint, uint);
EVT_HANDLE EvtOpenChannelEnum(EVT_HANDLE, uint);
BOOL EvtNextChannelPath(EVT_HANDLE, uint, PWSTR, uint*);
EVT_HANDLE EvtOpenChannelConfig(EVT_HANDLE, const(wchar)*, uint);
BOOL EvtSaveChannelConfig(EVT_HANDLE, uint);
BOOL EvtSetChannelConfigProperty(EVT_HANDLE, EVT_CHANNEL_CONFIG_PROPERTY_ID, uint, EVT_VARIANT*);
BOOL EvtGetChannelConfigProperty(EVT_HANDLE, EVT_CHANNEL_CONFIG_PROPERTY_ID, uint, uint, EVT_VARIANT*, uint*);
EVT_HANDLE EvtOpenPublisherEnum(EVT_HANDLE, uint);
BOOL EvtNextPublisherId(EVT_HANDLE, uint, PWSTR, uint*);
EVT_HANDLE EvtOpenPublisherMetadata(EVT_HANDLE, const(wchar)*, const(wchar)*, uint, uint);
BOOL EvtGetPublisherMetadataProperty(EVT_HANDLE, EVT_PUBLISHER_METADATA_PROPERTY_ID, uint, uint, EVT_VARIANT*, uint*);
EVT_HANDLE EvtOpenEventMetadataEnum(EVT_HANDLE, uint);
EVT_HANDLE EvtNextEventMetadata(EVT_HANDLE, uint);
BOOL EvtGetEventMetadataProperty(EVT_HANDLE, EVT_EVENT_METADATA_PROPERTY_ID, uint, uint, EVT_VARIANT*, uint*);
BOOL EvtGetObjectArraySize(long, uint*);
BOOL EvtGetObjectArrayProperty(long, uint, uint, uint, uint, EVT_VARIANT*, uint*);
BOOL EvtGetQueryInfo(EVT_HANDLE, EVT_QUERY_PROPERTY_ID, uint, EVT_VARIANT*, uint*);
EVT_HANDLE EvtCreateBookmark(const(wchar)*);
BOOL EvtUpdateBookmark(EVT_HANDLE, EVT_HANDLE);
BOOL EvtGetEventInfo(EVT_HANDLE, EVT_EVENT_PROPERTY_ID, uint, EVT_VARIANT*, uint*);
BOOL ClearEventLogA(HANDLE, const(char)*);
BOOL ClearEventLogW(HANDLE, const(wchar)*);
BOOL BackupEventLogA(HANDLE, const(char)*);
BOOL BackupEventLogW(HANDLE, const(wchar)*);
BOOL CloseEventLog(HANDLE);
BOOL DeregisterEventSource(HANDLE);
BOOL NotifyChangeEventLog(HANDLE, HANDLE);
BOOL GetNumberOfEventLogRecords(HANDLE, uint*);
BOOL GetOldestEventLogRecord(HANDLE, uint*);
HANDLE OpenEventLogA(const(char)*, const(char)*);
HANDLE OpenEventLogW(const(wchar)*, const(wchar)*);
HANDLE RegisterEventSourceA(const(char)*, const(char)*);
HANDLE RegisterEventSourceW(const(wchar)*, const(wchar)*);
HANDLE OpenBackupEventLogA(const(char)*, const(char)*);
HANDLE OpenBackupEventLogW(const(wchar)*, const(wchar)*);
BOOL ReadEventLogA(HANDLE, READ_EVENT_LOG_READ_FLAGS, uint, void*, uint, uint*, uint*);
BOOL ReadEventLogW(HANDLE, READ_EVENT_LOG_READ_FLAGS, uint, void*, uint, uint*, uint*);
BOOL ReportEventA(HANDLE, REPORT_EVENT_TYPE, ushort, uint, PSID, ushort, uint, const(char)**, void*);
BOOL ReportEventW(HANDLE, REPORT_EVENT_TYPE, ushort, uint, PSID, ushort, uint, const(wchar)**, void*);
BOOL GetEventLogInformation(HANDLE, uint, void*, uint, uint*);
enum EVT_VARIANT_TYPE_MASK = 0x0000007f;
enum EVT_VARIANT_TYPE_ARRAY = 0x00000080;
enum EVT_READ_ACCESS = 0x00000001;
enum EVT_WRITE_ACCESS = 0x00000002;
enum EVT_CLEAR_ACCESS = 0x00000004;
enum EVT_ALL_ACCESS = 0x00000007;
alias EVT_HANDLE = long;
alias EVT_VARIANT_TYPE = int;
enum : int
{
    EvtVarTypeNull       = 0x00000000,
    EvtVarTypeString     = 0x00000001,
    EvtVarTypeAnsiString = 0x00000002,
    EvtVarTypeSByte      = 0x00000003,
    EvtVarTypeByte       = 0x00000004,
    EvtVarTypeInt16      = 0x00000005,
    EvtVarTypeUInt16     = 0x00000006,
    EvtVarTypeInt32      = 0x00000007,
    EvtVarTypeUInt32     = 0x00000008,
    EvtVarTypeInt64      = 0x00000009,
    EvtVarTypeUInt64     = 0x0000000a,
    EvtVarTypeSingle     = 0x0000000b,
    EvtVarTypeDouble     = 0x0000000c,
    EvtVarTypeBoolean    = 0x0000000d,
    EvtVarTypeBinary     = 0x0000000e,
    EvtVarTypeGuid       = 0x0000000f,
    EvtVarTypeSizeT      = 0x00000010,
    EvtVarTypeFileTime   = 0x00000011,
    EvtVarTypeSysTime    = 0x00000012,
    EvtVarTypeSid        = 0x00000013,
    EvtVarTypeHexInt32   = 0x00000014,
    EvtVarTypeHexInt64   = 0x00000015,
    EvtVarTypeEvtHandle  = 0x00000020,
    EvtVarTypeEvtXml     = 0x00000023,
}

struct EVT_VARIANT
{
    union
    {
        BOOL BooleanVal;
        byte SByteVal;
        short Int16Val;
        int Int32Val;
        long Int64Val;
        ubyte ByteVal;
        ushort UInt16Val;
        uint UInt32Val;
        ulong UInt64Val;
        float SingleVal;
        double DoubleVal;
        ulong FileTimeVal;
        SYSTEMTIME* SysTimeVal;
        GUID* GuidVal;
        const(wchar)* StringVal;
        const(char)* AnsiStringVal;
        ubyte* BinaryVal;
        PSID SidVal;
        ulong SizeTVal;
        BOOL* BooleanArr;
        byte* SByteArr;
        short* Int16Arr;
        int* Int32Arr;
        long* Int64Arr;
        ubyte* ByteArr;
        ushort* UInt16Arr;
        uint* UInt32Arr;
        ulong* UInt64Arr;
        float* SingleArr;
        double* DoubleArr;
        FILETIME* FileTimeArr;
        SYSTEMTIME* SysTimeArr;
        GUID* GuidArr;
        PWSTR* StringArr;
        PSTR* AnsiStringArr;
        PSID* SidArr;
        ulong* SizeTArr;
        EVT_HANDLE EvtHandleVal;
        const(wchar)* XmlVal;
        const(wchar)** XmlValArr;
    }
    uint Count;
    uint Type;
}
alias EVT_LOGIN_CLASS = int;
enum : int
{
    EvtRpcLogin = 0x00000001,
}

alias EVT_RPC_LOGIN_FLAGS = uint;
enum : uint
{
    EvtRpcLoginAuthDefault   = 0x00000000,
    EvtRpcLoginAuthNegotiate = 0x00000001,
    EvtRpcLoginAuthKerberos  = 0x00000002,
    EvtRpcLoginAuthNTLM      = 0x00000003,
}

struct EVT_RPC_LOGIN
{
    PWSTR Server;
    PWSTR User;
    PWSTR Domain;
    PWSTR Password;
    uint Flags;
}
alias EVT_QUERY_FLAGS = uint;
enum : uint
{
    EvtQueryChannelPath         = 0x00000001,
    EvtQueryFilePath            = 0x00000002,
    EvtQueryForwardDirection    = 0x00000100,
    EvtQueryReverseDirection    = 0x00000200,
    EvtQueryTolerateQueryErrors = 0x00001000,
}

alias EVT_SEEK_FLAGS = uint;
enum : uint
{
    EvtSeekRelativeToFirst    = 0x00000001,
    EvtSeekRelativeToLast     = 0x00000002,
    EvtSeekRelativeToCurrent  = 0x00000003,
    EvtSeekRelativeToBookmark = 0x00000004,
    EvtSeekOriginMask         = 0x00000007,
    EvtSeekStrict             = 0x00010000,
}

alias EVT_SUBSCRIBE_FLAGS = uint;
enum : uint
{
    EvtSubscribeToFutureEvents      = 0x00000001,
    EvtSubscribeStartAtOldestRecord = 0x00000002,
    EvtSubscribeStartAfterBookmark  = 0x00000003,
    EvtSubscribeOriginMask          = 0x00000003,
    EvtSubscribeTolerateQueryErrors = 0x00001000,
    EvtSubscribeStrict              = 0x00010000,
}

alias EVT_SUBSCRIBE_NOTIFY_ACTION = int;
enum : int
{
    EvtSubscribeActionError   = 0x00000000,
    EvtSubscribeActionDeliver = 0x00000001,
}

alias EVT_SUBSCRIBE_CALLBACK = uint function(EVT_SUBSCRIBE_NOTIFY_ACTION, void*, EVT_HANDLE);
alias EVT_SYSTEM_PROPERTY_ID = int;
enum : int
{
    EvtSystemProviderName      = 0x00000000,
    EvtSystemProviderGuid      = 0x00000001,
    EvtSystemEventID           = 0x00000002,
    EvtSystemQualifiers        = 0x00000003,
    EvtSystemLevel             = 0x00000004,
    EvtSystemTask              = 0x00000005,
    EvtSystemOpcode            = 0x00000006,
    EvtSystemKeywords          = 0x00000007,
    EvtSystemTimeCreated       = 0x00000008,
    EvtSystemEventRecordId     = 0x00000009,
    EvtSystemActivityID        = 0x0000000a,
    EvtSystemRelatedActivityID = 0x0000000b,
    EvtSystemProcessID         = 0x0000000c,
    EvtSystemThreadID          = 0x0000000d,
    EvtSystemChannel           = 0x0000000e,
    EvtSystemComputer          = 0x0000000f,
    EvtSystemUserID            = 0x00000010,
    EvtSystemVersion           = 0x00000011,
    EvtSystemPropertyIdEND     = 0x00000012,
}

alias EVT_RENDER_CONTEXT_FLAGS = uint;
enum : uint
{
    EvtRenderContextValues = 0x00000000,
    EvtRenderContextSystem = 0x00000001,
    EvtRenderContextUser   = 0x00000002,
}

alias EVT_RENDER_FLAGS = uint;
enum : uint
{
    EvtRenderEventValues = 0x00000000,
    EvtRenderEventXml    = 0x00000001,
    EvtRenderBookmark    = 0x00000002,
}

alias EVT_FORMAT_MESSAGE_FLAGS = uint;
enum : uint
{
    EvtFormatMessageEvent    = 0x00000001,
    EvtFormatMessageLevel    = 0x00000002,
    EvtFormatMessageTask     = 0x00000003,
    EvtFormatMessageOpcode   = 0x00000004,
    EvtFormatMessageKeyword  = 0x00000005,
    EvtFormatMessageChannel  = 0x00000006,
    EvtFormatMessageProvider = 0x00000007,
    EvtFormatMessageId       = 0x00000008,
    EvtFormatMessageXml      = 0x00000009,
}

alias EVT_OPEN_LOG_FLAGS = uint;
enum : uint
{
    EvtOpenChannelPath = 0x00000001,
    EvtOpenFilePath    = 0x00000002,
}

alias EVT_LOG_PROPERTY_ID = int;
enum : int
{
    EvtLogCreationTime       = 0x00000000,
    EvtLogLastAccessTime     = 0x00000001,
    EvtLogLastWriteTime      = 0x00000002,
    EvtLogFileSize           = 0x00000003,
    EvtLogAttributes         = 0x00000004,
    EvtLogNumberOfLogRecords = 0x00000005,
    EvtLogOldestRecordNumber = 0x00000006,
    EvtLogFull               = 0x00000007,
}

alias EVT_EXPORTLOG_FLAGS = uint;
enum : uint
{
    EvtExportLogChannelPath         = 0x00000001,
    EvtExportLogFilePath            = 0x00000002,
    EvtExportLogTolerateQueryErrors = 0x00001000,
    EvtExportLogOverwrite           = 0x00002000,
}

alias EVT_CHANNEL_CONFIG_PROPERTY_ID = int;
enum : int
{
    EvtChannelConfigEnabled               = 0x00000000,
    EvtChannelConfigIsolation             = 0x00000001,
    EvtChannelConfigType                  = 0x00000002,
    EvtChannelConfigOwningPublisher       = 0x00000003,
    EvtChannelConfigClassicEventlog       = 0x00000004,
    EvtChannelConfigAccess                = 0x00000005,
    EvtChannelLoggingConfigRetention      = 0x00000006,
    EvtChannelLoggingConfigAutoBackup     = 0x00000007,
    EvtChannelLoggingConfigMaxSize        = 0x00000008,
    EvtChannelLoggingConfigLogFilePath    = 0x00000009,
    EvtChannelPublishingConfigLevel       = 0x0000000a,
    EvtChannelPublishingConfigKeywords    = 0x0000000b,
    EvtChannelPublishingConfigControlGuid = 0x0000000c,
    EvtChannelPublishingConfigBufferSize  = 0x0000000d,
    EvtChannelPublishingConfigMinBuffers  = 0x0000000e,
    EvtChannelPublishingConfigMaxBuffers  = 0x0000000f,
    EvtChannelPublishingConfigLatency     = 0x00000010,
    EvtChannelPublishingConfigClockType   = 0x00000011,
    EvtChannelPublishingConfigSidType     = 0x00000012,
    EvtChannelPublisherList               = 0x00000013,
    EvtChannelPublishingConfigFileMax     = 0x00000014,
    EvtChannelConfigPropertyIdEND         = 0x00000015,
}

alias EVT_CHANNEL_TYPE = int;
enum : int
{
    EvtChannelTypeAdmin       = 0x00000000,
    EvtChannelTypeOperational = 0x00000001,
    EvtChannelTypeAnalytic    = 0x00000002,
    EvtChannelTypeDebug       = 0x00000003,
}

alias EVT_CHANNEL_ISOLATION_TYPE = int;
enum : int
{
    EvtChannelIsolationTypeApplication = 0x00000000,
    EvtChannelIsolationTypeSystem      = 0x00000001,
    EvtChannelIsolationTypeCustom      = 0x00000002,
}

alias EVT_CHANNEL_CLOCK_TYPE = int;
enum : int
{
    EvtChannelClockTypeSystemTime = 0x00000000,
    EvtChannelClockTypeQPC        = 0x00000001,
}

alias EVT_CHANNEL_SID_TYPE = int;
enum : int
{
    EvtChannelSidTypeNone       = 0x00000000,
    EvtChannelSidTypePublishing = 0x00000001,
}

alias EVT_CHANNEL_REFERENCE_FLAGS = uint;
enum : uint
{
    EvtChannelReferenceImported = 0x00000001,
}

alias EVT_PUBLISHER_METADATA_PROPERTY_ID = int;
enum : int
{
    EvtPublisherMetadataPublisherGuid             = 0x00000000,
    EvtPublisherMetadataResourceFilePath          = 0x00000001,
    EvtPublisherMetadataParameterFilePath         = 0x00000002,
    EvtPublisherMetadataMessageFilePath           = 0x00000003,
    EvtPublisherMetadataHelpLink                  = 0x00000004,
    EvtPublisherMetadataPublisherMessageID        = 0x00000005,
    EvtPublisherMetadataChannelReferences         = 0x00000006,
    EvtPublisherMetadataChannelReferencePath      = 0x00000007,
    EvtPublisherMetadataChannelReferenceIndex     = 0x00000008,
    EvtPublisherMetadataChannelReferenceID        = 0x00000009,
    EvtPublisherMetadataChannelReferenceFlags     = 0x0000000a,
    EvtPublisherMetadataChannelReferenceMessageID = 0x0000000b,
    EvtPublisherMetadataLevels                    = 0x0000000c,
    EvtPublisherMetadataLevelName                 = 0x0000000d,
    EvtPublisherMetadataLevelValue                = 0x0000000e,
    EvtPublisherMetadataLevelMessageID            = 0x0000000f,
    EvtPublisherMetadataTasks                     = 0x00000010,
    EvtPublisherMetadataTaskName                  = 0x00000011,
    EvtPublisherMetadataTaskEventGuid             = 0x00000012,
    EvtPublisherMetadataTaskValue                 = 0x00000013,
    EvtPublisherMetadataTaskMessageID             = 0x00000014,
    EvtPublisherMetadataOpcodes                   = 0x00000015,
    EvtPublisherMetadataOpcodeName                = 0x00000016,
    EvtPublisherMetadataOpcodeValue               = 0x00000017,
    EvtPublisherMetadataOpcodeMessageID           = 0x00000018,
    EvtPublisherMetadataKeywords                  = 0x00000019,
    EvtPublisherMetadataKeywordName               = 0x0000001a,
    EvtPublisherMetadataKeywordValue              = 0x0000001b,
    EvtPublisherMetadataKeywordMessageID          = 0x0000001c,
    EvtPublisherMetadataPropertyIdEND             = 0x0000001d,
}

alias EVT_EVENT_METADATA_PROPERTY_ID = int;
enum : int
{
    EventMetadataEventID          = 0x00000000,
    EventMetadataEventVersion     = 0x00000001,
    EventMetadataEventChannel     = 0x00000002,
    EventMetadataEventLevel       = 0x00000003,
    EventMetadataEventOpcode      = 0x00000004,
    EventMetadataEventTask        = 0x00000005,
    EventMetadataEventKeyword     = 0x00000006,
    EventMetadataEventMessageID   = 0x00000007,
    EventMetadataEventTemplate    = 0x00000008,
    EvtEventMetadataPropertyIdEND = 0x00000009,
}

alias EVT_QUERY_PROPERTY_ID = int;
enum : int
{
    EvtQueryNames         = 0x00000000,
    EvtQueryStatuses      = 0x00000001,
    EvtQueryPropertyIdEND = 0x00000002,
}

alias EVT_EVENT_PROPERTY_ID = int;
enum : int
{
    EvtEventQueryIDs      = 0x00000000,
    EvtEventPath          = 0x00000001,
    EvtEventPropertyIdEND = 0x00000002,
}

struct EVENTLOGRECORD
{
    uint Length;
    uint Reserved;
    uint RecordNumber;
    uint TimeGenerated;
    uint TimeWritten;
    uint EventID;
    REPORT_EVENT_TYPE EventType;
    ushort NumStrings;
    ushort EventCategory;
    ushort ReservedFlags;
    uint ClosingRecordNumber;
    uint StringOffset;
    uint UserSidLength;
    uint UserSidOffset;
    uint DataLength;
    uint DataOffset;
}
struct EVENTSFORLOGFILE
{
    uint ulSize;
    wchar[256] szLogicalLogFile;
    uint ulNumRecords;
    EVENTLOGRECORD[1] pEventLogRecords;
}
struct EVENTLOG_FULL_INFORMATION
{
    uint dwFull;
}
