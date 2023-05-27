module windows.win32.ui.legacywindowsenvironmentfeatures;

import windows.win32.guid : GUID;
import windows.win32.foundation : HRESULT, HWND, PWSTR;
import windows.win32.system.com : IMoniker, IUnknown;
import windows.win32.system.com.structuredstorage : IStorage;
import windows.win32.system.ole : IOleObject;
import windows.win32.system.registry : HKEY;

version (Windows):
extern (Windows):

alias EMPTY_VOLUME_CACHE_FLAGS = uint;
enum : uint
{
    EVCF_HASSETTINGS          = 0x00000001,
    EVCF_ENABLEBYDEFAULT      = 0x00000002,
    EVCF_REMOVEFROMLIST       = 0x00000004,
    EVCF_ENABLEBYDEFAULT_AUTO = 0x00000008,
    EVCF_DONTSHOWIFZERO       = 0x00000010,
    EVCF_SETTINGSMODE         = 0x00000020,
    EVCF_OUTOFDISKSPACE       = 0x00000040,
    EVCF_USERCONSENTOBTAINED  = 0x00000080,
    EVCF_SYSTEMAUTORUN        = 0x00000100,
}

enum EVCCBF_LASTNOTIFICATION = 0x00000001;
enum STATEBITS_FLAT = 0x00000001;
enum REC_S_IDIDTHEUPDATES = 0x00041000;
enum REC_S_NOTCOMPLETE = 0x00041001;
enum REC_S_NOTCOMPLETEBUTPROPAGATE = 0x00041002;
enum REC_E_ABORTED = 0xffffffff80041000;
enum REC_E_NOCALLBACK = 0xffffffff80041001;
enum REC_E_NORESIDUES = 0xffffffff80041002;
enum REC_E_TOODIFFERENT = 0xffffffff80041003;
enum REC_E_INEEDTODOTHEUPDATES = 0xffffffff80041004;
enum IID_IEmptyVolumeCacheCallBack = GUID(0x6e793361, 0x73c6, 0x11d0, [0x84, 0x69, 0x0, 0xaa, 0x0, 0x44, 0x29, 0x1]);
interface IEmptyVolumeCacheCallBack : IUnknown
{
    HRESULT ScanProgress(ulong, uint, const(wchar)*);
    HRESULT PurgeProgress(ulong, ulong, uint, const(wchar)*);
}
enum IID_IEmptyVolumeCache = GUID(0x8fce5227, 0x4da, 0x11d1, [0xa0, 0x4, 0x0, 0x80, 0x5f, 0x8a, 0xbe, 0x6]);
interface IEmptyVolumeCache : IUnknown
{
    HRESULT Initialize(HKEY, const(wchar)*, PWSTR*, PWSTR*, EMPTY_VOLUME_CACHE_FLAGS*);
    HRESULT GetSpaceUsed(ulong*, IEmptyVolumeCacheCallBack);
    HRESULT Purge(ulong, IEmptyVolumeCacheCallBack);
    HRESULT ShowProperties(HWND);
    HRESULT Deactivate(EMPTY_VOLUME_CACHE_FLAGS*);
}
enum IID_IEmptyVolumeCache2 = GUID(0x2b7e3ba, 0x4db3, 0x11d2, [0xb2, 0xd9, 0x0, 0xc0, 0x4f, 0x8e, 0xec, 0x8c]);
interface IEmptyVolumeCache2 : IEmptyVolumeCache
{
    HRESULT InitializeEx(HKEY, const(wchar)*, const(wchar)*, PWSTR*, PWSTR*, PWSTR*, EMPTY_VOLUME_CACHE_FLAGS*);
}
enum IID_IReconcileInitiator = GUID(0x99180161, 0xda16, 0x101a, [0x93, 0x5c, 0x44, 0x45, 0x53, 0x54, 0x0, 0x0]);
interface IReconcileInitiator : IUnknown
{
    HRESULT SetAbortCallback(IUnknown);
    HRESULT SetProgressFeedback(uint, uint);
}
alias RECONCILEF = int;
enum : int
{
    RECONCILEF_MAYBOTHERUSER        = 0x00000001,
    RECONCILEF_FEEDBACKWINDOWVALID  = 0x00000002,
    RECONCILEF_NORESIDUESOK         = 0x00000004,
    RECONCILEF_OMITSELFRESIDUE      = 0x00000008,
    RECONCILEF_RESUMERECONCILIATION = 0x00000010,
    RECONCILEF_YOUMAYDOTHEUPDATES   = 0x00000020,
    RECONCILEF_ONLYYOUWERECHANGED   = 0x00000040,
    ALL_RECONCILE_FLAGS             = 0x0000007f,
}

enum IID_IReconcilableObject = GUID(0x99180162, 0xda16, 0x101a, [0x93, 0x5c, 0x44, 0x45, 0x53, 0x54, 0x0, 0x0]);
interface IReconcilableObject : IUnknown
{
    HRESULT Reconcile(IReconcileInitiator, uint, HWND, HWND, uint, IMoniker*, int*, IStorage, void*);
    HRESULT GetProgressFeedbackMaxEstimate(uint*);
}
enum IID_IBriefcaseInitiator = GUID(0x99180164, 0xda16, 0x101a, [0x93, 0x5c, 0x44, 0x45, 0x53, 0x54, 0x0, 0x0]);
interface IBriefcaseInitiator : IUnknown
{
    HRESULT IsMonikerInBriefcase(IMoniker);
}
enum IID_IActiveDesktopP = GUID(0x52502ee0, 0xec80, 0x11d0, [0x89, 0xab, 0x0, 0xc0, 0x4f, 0xc2, 0x97, 0x2d]);
interface IActiveDesktopP : IUnknown
{
    HRESULT SetSafeMode(uint);
    HRESULT EnsureUpdateHTML();
    HRESULT SetScheme(const(wchar)*, uint);
    HRESULT GetScheme(PWSTR, uint*, uint);
}
enum IID_IADesktopP2 = GUID(0xb22754e2, 0x4574, 0x11d1, [0x98, 0x88, 0x0, 0x60, 0x97, 0xde, 0xac, 0xf9]);
interface IADesktopP2 : IUnknown
{
    HRESULT ReReadWallpaper();
    HRESULT GetADObjectFlags(uint*, uint);
    HRESULT UpdateAllDesktopSubscriptions();
    HRESULT MakeDynamicChanges(IOleObject);
}
