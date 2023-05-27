module windows.win32.security.diagnosticdataquery;

import windows.win32.guid : GUID;
import windows.win32.foundation : BOOL, FILETIME, HRESULT, PWSTR;
import windows.win32.security : HDIAGNOSTIC_DATA_QUERY_SESSION, HDIAGNOSTIC_EVENT_CATEGORY_DESCRIPTION, HDIAGNOSTIC_EVENT_PRODUCER_DESCRIPTION, HDIAGNOSTIC_EVENT_TAG_DESCRIPTION, HDIAGNOSTIC_RECORD, HDIAGNOSTIC_REPORT;

version (Windows):
extern (Windows):

alias DdqAccessLevel = int;
enum : int
{
    NoData          = 0x00000000,
    CurrentUserData = 0x00000001,
    AllUserData     = 0x00000002,
}

struct DIAGNOSTIC_DATA_RECORD
{
    long rowId;
    ulong timestamp;
    ulong eventKeywords;
    PWSTR fullEventName;
    PWSTR providerGroupGuid;
    PWSTR producerName;
    int* privacyTags;
    uint privacyTagCount;
    int* categoryIds;
    uint categoryIdCount;
    BOOL isCoreData;
    PWSTR extra1;
    PWSTR extra2;
    PWSTR extra3;
}
struct DIAGNOSTIC_DATA_SEARCH_CRITERIA
{
    const(wchar)** producerNames;
    uint producerNameCount;
    const(wchar)* textToMatch;
    const(int)* categoryIds;
    uint categoryIdCount;
    const(int)* privacyTags;
    uint privacyTagCount;
    BOOL coreDataOnly;
}
struct DIAGNOSTIC_DATA_EVENT_TAG_DESCRIPTION
{
    int privacyTag;
    PWSTR name;
    PWSTR description;
}
struct DIAGNOSTIC_DATA_EVENT_PRODUCER_DESCRIPTION
{
    PWSTR name;
}
struct DIAGNOSTIC_DATA_EVENT_CATEGORY_DESCRIPTION
{
    int id;
    PWSTR name;
}
struct DIAGNOSTIC_DATA_EVENT_TAG_STATS
{
    int privacyTag;
    uint eventCount;
}
struct DIAGNOSTIC_DATA_EVENT_BINARY_STATS
{
    PWSTR moduleName;
    PWSTR friendlyModuleName;
    uint eventCount;
    ulong uploadSizeBytes;
}
struct DIAGNOSTIC_DATA_GENERAL_STATS
{
    uint optInLevel;
    ulong transcriptSizeBytes;
    ulong oldestEventTimestamp;
    uint totalEventCountLast24Hours;
    float averageDailyEvents;
}
struct DIAGNOSTIC_DATA_EVENT_TRANSCRIPT_CONFIGURATION
{
    uint hoursOfHistoryToKeep;
    uint maxStoreMegabytes;
    uint requestedMaxStoreMegabytes;
}
struct DIAGNOSTIC_REPORT_PARAMETER
{
    wchar[129] name;
    wchar[260] value;
}
struct DIAGNOSTIC_REPORT_SIGNATURE
{
    wchar[65] eventName;
    DIAGNOSTIC_REPORT_PARAMETER[10] parameters;
}
struct DIAGNOSTIC_REPORT_DATA
{
    DIAGNOSTIC_REPORT_SIGNATURE signature;
    GUID bucketId;
    GUID reportId;
    FILETIME creationTime;
    ulong sizeInBytes;
    PWSTR cabId;
    uint reportStatus;
    GUID reportIntegratorId;
    PWSTR* fileNames;
    uint fileCount;
    PWSTR friendlyEventName;
    PWSTR applicationName;
    PWSTR applicationPath;
    PWSTR description;
    PWSTR bucketIdString;
    ulong legacyBucketId;
    PWSTR reportKey;
}
HRESULT DdqCreateSession(DdqAccessLevel, HDIAGNOSTIC_DATA_QUERY_SESSION*);
HRESULT DdqCloseSession(HDIAGNOSTIC_DATA_QUERY_SESSION);
HRESULT DdqGetSessionAccessLevel(HDIAGNOSTIC_DATA_QUERY_SESSION, DdqAccessLevel*);
HRESULT DdqGetDiagnosticDataAccessLevelAllowed(DdqAccessLevel*);
HRESULT DdqGetDiagnosticRecordStats(HDIAGNOSTIC_DATA_QUERY_SESSION, const(DIAGNOSTIC_DATA_SEARCH_CRITERIA)*, uint*, long*, long*);
HRESULT DdqGetDiagnosticRecordPayload(HDIAGNOSTIC_DATA_QUERY_SESSION, long, const(wchar)**);
HRESULT DdqGetDiagnosticRecordLocaleTags(HDIAGNOSTIC_DATA_QUERY_SESSION, const(wchar)*, HDIAGNOSTIC_EVENT_TAG_DESCRIPTION*);
HRESULT DdqFreeDiagnosticRecordLocaleTags(HDIAGNOSTIC_EVENT_TAG_DESCRIPTION);
HRESULT DdqGetDiagnosticRecordLocaleTagAtIndex(HDIAGNOSTIC_EVENT_TAG_DESCRIPTION, uint, DIAGNOSTIC_DATA_EVENT_TAG_DESCRIPTION*);
HRESULT DdqGetDiagnosticRecordLocaleTagCount(HDIAGNOSTIC_EVENT_TAG_DESCRIPTION, uint*);
HRESULT DdqGetDiagnosticRecordProducers(HDIAGNOSTIC_DATA_QUERY_SESSION, HDIAGNOSTIC_EVENT_PRODUCER_DESCRIPTION*);
HRESULT DdqFreeDiagnosticRecordProducers(HDIAGNOSTIC_EVENT_PRODUCER_DESCRIPTION);
HRESULT DdqGetDiagnosticRecordProducerAtIndex(HDIAGNOSTIC_EVENT_PRODUCER_DESCRIPTION, uint, DIAGNOSTIC_DATA_EVENT_PRODUCER_DESCRIPTION*);
HRESULT DdqGetDiagnosticRecordProducerCount(HDIAGNOSTIC_EVENT_PRODUCER_DESCRIPTION, uint*);
HRESULT DdqGetDiagnosticRecordProducerCategories(HDIAGNOSTIC_DATA_QUERY_SESSION, const(wchar)*, HDIAGNOSTIC_EVENT_CATEGORY_DESCRIPTION*);
HRESULT DdqFreeDiagnosticRecordProducerCategories(HDIAGNOSTIC_EVENT_CATEGORY_DESCRIPTION);
HRESULT DdqGetDiagnosticRecordCategoryAtIndex(HDIAGNOSTIC_EVENT_CATEGORY_DESCRIPTION, uint, DIAGNOSTIC_DATA_EVENT_CATEGORY_DESCRIPTION*);
HRESULT DdqGetDiagnosticRecordCategoryCount(HDIAGNOSTIC_EVENT_CATEGORY_DESCRIPTION, uint*);
HRESULT DdqIsDiagnosticRecordSampledIn(HDIAGNOSTIC_DATA_QUERY_SESSION, const(GUID)*, const(GUID)*, const(wchar)*, const(uint)*, const(wchar)*, const(uint)*, const(ulong)*, BOOL*);
HRESULT DdqGetDiagnosticRecordPage(HDIAGNOSTIC_DATA_QUERY_SESSION, DIAGNOSTIC_DATA_SEARCH_CRITERIA*, uint, uint, long, HDIAGNOSTIC_RECORD*);
HRESULT DdqFreeDiagnosticRecordPage(HDIAGNOSTIC_RECORD);
HRESULT DdqGetDiagnosticRecordAtIndex(HDIAGNOSTIC_RECORD, uint, DIAGNOSTIC_DATA_RECORD*);
HRESULT DdqGetDiagnosticRecordCount(HDIAGNOSTIC_RECORD, uint*);
HRESULT DdqGetDiagnosticReportStoreReportCount(HDIAGNOSTIC_DATA_QUERY_SESSION, uint, uint*);
HRESULT DdqCancelDiagnosticRecordOperation(HDIAGNOSTIC_DATA_QUERY_SESSION);
HRESULT DdqGetDiagnosticReport(HDIAGNOSTIC_DATA_QUERY_SESSION, uint, HDIAGNOSTIC_REPORT*);
HRESULT DdqFreeDiagnosticReport(HDIAGNOSTIC_REPORT);
HRESULT DdqGetDiagnosticReportAtIndex(HDIAGNOSTIC_REPORT, uint, DIAGNOSTIC_REPORT_DATA*);
HRESULT DdqGetDiagnosticReportCount(HDIAGNOSTIC_REPORT, uint*);
HRESULT DdqExtractDiagnosticReport(HDIAGNOSTIC_DATA_QUERY_SESSION, uint, const(wchar)*, const(wchar)*);
HRESULT DdqGetDiagnosticRecordTagDistribution(HDIAGNOSTIC_DATA_QUERY_SESSION, const(wchar)**, uint, DIAGNOSTIC_DATA_EVENT_TAG_STATS**, uint*);
HRESULT DdqGetDiagnosticRecordBinaryDistribution(HDIAGNOSTIC_DATA_QUERY_SESSION, const(wchar)**, uint, uint, DIAGNOSTIC_DATA_EVENT_BINARY_STATS**, uint*);
HRESULT DdqGetDiagnosticRecordSummary(HDIAGNOSTIC_DATA_QUERY_SESSION, const(wchar)**, uint, DIAGNOSTIC_DATA_GENERAL_STATS*);
HRESULT DdqSetTranscriptConfiguration(HDIAGNOSTIC_DATA_QUERY_SESSION, const(DIAGNOSTIC_DATA_EVENT_TRANSCRIPT_CONFIGURATION)*);
HRESULT DdqGetTranscriptConfiguration(HDIAGNOSTIC_DATA_QUERY_SESSION, DIAGNOSTIC_DATA_EVENT_TRANSCRIPT_CONFIGURATION*);
