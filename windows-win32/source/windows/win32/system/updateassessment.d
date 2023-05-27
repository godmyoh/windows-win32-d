module windows.win32.system.updateassessment;

import windows.win32.guid : GUID;
import windows.win32.foundation : BOOL, FILETIME, HRESULT, PWSTR;
import windows.win32.system.com : IUnknown;

version (Windows):
extern (Windows):

alias UpdateImpactLevel = int;
enum : int
{
    UpdateImpactLevel_None   = 0x00000000,
    UpdateImpactLevel_Low    = 0x00000001,
    UpdateImpactLevel_Medium = 0x00000002,
    UpdateImpactLevel_High   = 0x00000003,
}

alias UpdateAssessmentStatus = int;
enum : int
{
    UpdateAssessmentStatus_Latest                   = 0x00000000,
    UpdateAssessmentStatus_NotLatestSoftRestriction = 0x00000001,
    UpdateAssessmentStatus_NotLatestHardRestriction = 0x00000002,
    UpdateAssessmentStatus_NotLatestEndOfSupport    = 0x00000003,
    UpdateAssessmentStatus_NotLatestServicingTrain  = 0x00000004,
    UpdateAssessmentStatus_NotLatestDeferredFeature = 0x00000005,
    UpdateAssessmentStatus_NotLatestDeferredQuality = 0x00000006,
    UpdateAssessmentStatus_NotLatestPausedFeature   = 0x00000007,
    UpdateAssessmentStatus_NotLatestPausedQuality   = 0x00000008,
    UpdateAssessmentStatus_NotLatestManaged         = 0x00000009,
    UpdateAssessmentStatus_NotLatestUnknown         = 0x0000000a,
    UpdateAssessmentStatus_NotLatestTargetedVersion = 0x0000000b,
}

struct UpdateAssessment
{
    UpdateAssessmentStatus status;
    UpdateImpactLevel impact;
    uint daysOutOfDate;
}
struct OSUpdateAssessment
{
    BOOL isEndOfSupport;
    UpdateAssessment assessmentForCurrent;
    UpdateAssessment assessmentForUpToDate;
    UpdateAssessmentStatus securityStatus;
    FILETIME assessmentTime;
    FILETIME releaseInfoTime;
    PWSTR currentOSBuild;
    FILETIME currentOSReleaseTime;
    PWSTR upToDateOSBuild;
    FILETIME upToDateOSReleaseTime;
}
enum IID_IWaaSAssessor = GUID(0x2347bbef, 0x1a3b, 0x45a4, [0x90, 0x2d, 0x3e, 0x9, 0xc2, 0x69, 0xb4, 0x5e]);
interface IWaaSAssessor : IUnknown
{
    HRESULT GetOSUpdateAssessment(OSUpdateAssessment*);
}
enum CLSID_WaaSAssessor = GUID(0x98ef871, 0xfa9f, 0x46af, [0x89, 0x58, 0xc0, 0x83, 0x51, 0x5d, 0x7c, 0x9c]);
struct WaaSAssessor
{
}
