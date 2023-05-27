module windows.win32.system.remoteassistance;

import windows.win32.guid : GUID;
import windows.win32.foundation : BSTR, HRESULT;
import windows.win32.system.com : IDispatch, IUnknown;

version (Windows):
extern (Windows):

enum DISPID_EVENT_ON_STATE_CHANGED = 0x00000005;
enum DISPID_EVENT_ON_TERMINATION = 0x00000006;
enum DISPID_EVENT_ON_CONTEXT_DATA = 0x00000007;
enum DISPID_EVENT_ON_SEND_ERROR = 0x00000008;
alias RENDEZVOUS_SESSION_STATE = int;
enum : int
{
    RSS_UNKNOWN    = 0x00000000,
    RSS_READY      = 0x00000001,
    RSS_INVITATION = 0x00000002,
    RSS_ACCEPTED   = 0x00000003,
    RSS_CONNECTED  = 0x00000004,
    RSS_CANCELLED  = 0x00000005,
    RSS_DECLINED   = 0x00000006,
    RSS_TERMINATED = 0x00000007,
}

alias RENDEZVOUS_SESSION_FLAGS = int;
enum : int
{
    RSF_NONE                 = 0x00000000,
    RSF_INVITER              = 0x00000001,
    RSF_INVITEE              = 0x00000002,
    RSF_ORIGINAL_INVITER     = 0x00000004,
    RSF_REMOTE_LEGACYSESSION = 0x00000008,
    RSF_REMOTE_WIN7SESSION   = 0x00000010,
}

enum IID_IRendezvousSession = GUID(0x9ba4b1dd, 0x8b0c, 0x48b7, [0x9e, 0x7c, 0x2f, 0x25, 0x85, 0x7c, 0x8d, 0xf5]);
interface IRendezvousSession : IUnknown
{
    HRESULT get_State(RENDEZVOUS_SESSION_STATE*);
    HRESULT get_RemoteUser(BSTR*);
    HRESULT get_Flags(int*);
    HRESULT SendContextData(BSTR);
    HRESULT Terminate(HRESULT, BSTR);
}
enum IID_DRendezvousSessionEvents = GUID(0x3fa19cf8, 0x64c4, 0x4f53, [0xae, 0x60, 0x63, 0x5b, 0x38, 0x6, 0xec, 0xa6]);
interface DRendezvousSessionEvents : IDispatch
{
}
enum IID_IRendezvousApplication = GUID(0x4f4d070b, 0xa275, 0x49fb, [0xb1, 0xd, 0x8e, 0xc2, 0x63, 0x87, 0xb5, 0xd]);
interface IRendezvousApplication : IUnknown
{
    HRESULT SetRendezvousSession(IUnknown);
}
enum CLSID_RendezvousApplication = GUID(0xb7e019a, 0xb5de, 0x47fa, [0x89, 0x66, 0x90, 0x82, 0xf8, 0x2f, 0xb1, 0x92]);
struct RendezvousApplication
{
}
