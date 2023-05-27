module windows.win32.system.com.callobj;

import windows.win32.guid : GUID;
import windows.win32.foundation : BOOL, BOOLEAN, HRESULT, PWSTR;
import windows.win32.system.com : ITypeInfo, IUnknown, MSHLFLAGS;
import windows.win32.system.variant : VARIANT;

version (Windows):
extern (Windows):

struct CALLFRAMEINFO
{
    uint iMethod;
    BOOL fHasInValues;
    BOOL fHasInOutValues;
    BOOL fHasOutValues;
    BOOL fDerivesFromIDispatch;
    int cInInterfacesMax;
    int cInOutInterfacesMax;
    int cOutInterfacesMax;
    int cTopLevelInInterfaces;
    GUID iid;
    uint cMethod;
    uint cParams;
}
struct CALLFRAMEPARAMINFO
{
    BOOLEAN fIn;
    BOOLEAN fOut;
    uint stackOffset;
    uint cbParam;
}
alias CALLFRAME_COPY = int;
enum : int
{
    CALLFRAME_COPY_NESTED      = 0x00000001,
    CALLFRAME_COPY_INDEPENDENT = 0x00000002,
}

alias CALLFRAME_FREE = int;
enum : int
{
    CALLFRAME_FREE_NONE      = 0x00000000,
    CALLFRAME_FREE_IN        = 0x00000001,
    CALLFRAME_FREE_INOUT     = 0x00000002,
    CALLFRAME_FREE_OUT       = 0x00000004,
    CALLFRAME_FREE_TOP_INOUT = 0x00000008,
    CALLFRAME_FREE_TOP_OUT   = 0x00000010,
    CALLFRAME_FREE_ALL       = 0x0000001f,
}

alias CALLFRAME_NULL = int;
enum : int
{
    CALLFRAME_NULL_NONE  = 0x00000000,
    CALLFRAME_NULL_INOUT = 0x00000002,
    CALLFRAME_NULL_OUT   = 0x00000004,
    CALLFRAME_NULL_ALL   = 0x00000006,
}

alias CALLFRAME_WALK = int;
enum : int
{
    CALLFRAME_WALK_IN    = 0x00000001,
    CALLFRAME_WALK_INOUT = 0x00000002,
    CALLFRAME_WALK_OUT   = 0x00000004,
}

struct CALLFRAME_MARSHALCONTEXT
{
    BOOLEAN fIn;
    uint dwDestContext;
    void* pvDestContext;
    IUnknown punkReserved;
    GUID guidTransferSyntax;
}
enum IID_ICallFrame = GUID(0xd573b4b0, 0x894e, 0x11d2, [0xb8, 0xb6, 0x0, 0xc0, 0x4f, 0xb9, 0x61, 0x8a]);
interface ICallFrame : IUnknown
{
    HRESULT GetInfo(CALLFRAMEINFO*);
    HRESULT GetIIDAndMethod(GUID*, uint*);
    HRESULT GetNames(PWSTR*, PWSTR*);
    void* GetStackLocation();
    void SetStackLocation(void*);
    void SetReturnValue(HRESULT);
    HRESULT GetReturnValue();
    HRESULT GetParamInfo(uint, CALLFRAMEPARAMINFO*);
    HRESULT SetParam(uint, VARIANT*);
    HRESULT GetParam(uint, VARIANT*);
    HRESULT Copy(CALLFRAME_COPY, ICallFrameWalker, ICallFrame*);
    HRESULT Free(ICallFrame, ICallFrameWalker, ICallFrameWalker, uint, ICallFrameWalker, uint);
    HRESULT FreeParam(uint, uint, ICallFrameWalker, uint);
    HRESULT WalkFrame(uint, ICallFrameWalker);
    HRESULT GetMarshalSizeMax(CALLFRAME_MARSHALCONTEXT*, MSHLFLAGS, uint*);
    HRESULT Marshal(CALLFRAME_MARSHALCONTEXT*, MSHLFLAGS, void*, uint, uint*, uint*, uint*);
    HRESULT Unmarshal(void*, uint, uint, CALLFRAME_MARSHALCONTEXT*, uint*);
    HRESULT ReleaseMarshalData(void*, uint, uint, uint, CALLFRAME_MARSHALCONTEXT*);
    HRESULT Invoke(void*);
}
enum IID_ICallIndirect = GUID(0xd573b4b1, 0x894e, 0x11d2, [0xb8, 0xb6, 0x0, 0xc0, 0x4f, 0xb9, 0x61, 0x8a]);
interface ICallIndirect : IUnknown
{
    HRESULT CallIndirect(HRESULT*, uint, void*, uint*);
    HRESULT GetMethodInfo(uint, CALLFRAMEINFO*, PWSTR*);
    HRESULT GetStackSize(uint, uint*);
    HRESULT GetIID(GUID*, BOOL*, uint*, PWSTR*);
}
enum IID_ICallInterceptor = GUID(0x60c7ca75, 0x896d, 0x11d2, [0xb8, 0xb6, 0x0, 0xc0, 0x4f, 0xb9, 0x61, 0x8a]);
interface ICallInterceptor : ICallIndirect
{
    HRESULT RegisterSink(ICallFrameEvents);
    HRESULT GetRegisteredSink(ICallFrameEvents*);
}
enum IID_ICallFrameEvents = GUID(0xfd5e0843, 0xfc91, 0x11d0, [0x97, 0xd7, 0x0, 0xc0, 0x4f, 0xb9, 0x61, 0x8a]);
interface ICallFrameEvents : IUnknown
{
    HRESULT OnCall(ICallFrame);
}
enum IID_ICallUnmarshal = GUID(0x5333b003, 0x2e42, 0x11d2, [0xb8, 0x9d, 0x0, 0xc0, 0x4f, 0xb9, 0x61, 0x8a]);
interface ICallUnmarshal : IUnknown
{
    HRESULT Unmarshal(uint, void*, uint, BOOL, uint, CALLFRAME_MARSHALCONTEXT*, uint*, ICallFrame*);
    HRESULT ReleaseMarshalData(uint, void*, uint, uint, uint, CALLFRAME_MARSHALCONTEXT*);
}
enum IID_ICallFrameWalker = GUID(0x8b23919, 0x392d, 0x11d2, [0xb8, 0xa4, 0x0, 0xc0, 0x4f, 0xb9, 0x61, 0x8a]);
interface ICallFrameWalker : IUnknown
{
    HRESULT OnWalkInterface(const(GUID)*, void**, BOOL, BOOL);
}
enum IID_IInterfaceRelated = GUID(0xd1fb5a79, 0x7706, 0x11d1, [0xad, 0xba, 0x0, 0xc0, 0x4f, 0xc2, 0xad, 0xc0]);
interface IInterfaceRelated : IUnknown
{
    HRESULT SetIID(const(GUID)*);
    HRESULT GetIID(GUID*);
}
HRESULT CoGetInterceptor(const(GUID)*, IUnknown, const(GUID)*, void**);
HRESULT CoGetInterceptorFromTypeInfo(const(GUID)*, IUnknown, ITypeInfo, const(GUID)*, void**);
