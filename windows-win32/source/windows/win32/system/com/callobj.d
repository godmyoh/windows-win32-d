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
    HRESULT GetInfo(CALLFRAMEINFO* pInfo);
    HRESULT GetIIDAndMethod(GUID* pIID, uint* piMethod);
    HRESULT GetNames(PWSTR* pwszInterface, PWSTR* pwszMethod);
    void* GetStackLocation();
    void SetStackLocation(void* pvStack);
    void SetReturnValue(HRESULT hr);
    HRESULT GetReturnValue();
    HRESULT GetParamInfo(uint iparam, CALLFRAMEPARAMINFO* pInfo);
    HRESULT SetParam(uint iparam, VARIANT* pvar);
    HRESULT GetParam(uint iparam, VARIANT* pvar);
    HRESULT Copy(CALLFRAME_COPY copyControl, ICallFrameWalker pWalker, ICallFrame* ppFrame);
    HRESULT Free(ICallFrame pframeArgsDest, ICallFrameWalker pWalkerDestFree, ICallFrameWalker pWalkerCopy, uint freeFlags, ICallFrameWalker pWalkerFree, uint nullFlags);
    HRESULT FreeParam(uint iparam, uint freeFlags, ICallFrameWalker pWalkerFree, uint nullFlags);
    HRESULT WalkFrame(uint walkWhat, ICallFrameWalker pWalker);
    HRESULT GetMarshalSizeMax(CALLFRAME_MARSHALCONTEXT* pmshlContext, MSHLFLAGS mshlflags, uint* pcbBufferNeeded);
    HRESULT Marshal(CALLFRAME_MARSHALCONTEXT* pmshlContext, MSHLFLAGS mshlflags, void* pBuffer, uint cbBuffer, uint* pcbBufferUsed, uint* pdataRep, uint* prpcFlags);
    HRESULT Unmarshal(void* pBuffer, uint cbBuffer, uint dataRep, CALLFRAME_MARSHALCONTEXT* pcontext, uint* pcbUnmarshalled);
    HRESULT ReleaseMarshalData(void* pBuffer, uint cbBuffer, uint ibFirstRelease, uint dataRep, CALLFRAME_MARSHALCONTEXT* pcontext);
    HRESULT Invoke(void* pvReceiver);
}
enum IID_ICallIndirect = GUID(0xd573b4b1, 0x894e, 0x11d2, [0xb8, 0xb6, 0x0, 0xc0, 0x4f, 0xb9, 0x61, 0x8a]);
interface ICallIndirect : IUnknown
{
    HRESULT CallIndirect(HRESULT* phrReturn, uint iMethod, void* pvArgs, uint* cbArgs);
    HRESULT GetMethodInfo(uint iMethod, CALLFRAMEINFO* pInfo, PWSTR* pwszMethod);
    HRESULT GetStackSize(uint iMethod, uint* cbArgs);
    HRESULT GetIID(GUID* piid, BOOL* pfDerivesFromIDispatch, uint* pcMethod, PWSTR* pwszInterface);
}
enum IID_ICallInterceptor = GUID(0x60c7ca75, 0x896d, 0x11d2, [0xb8, 0xb6, 0x0, 0xc0, 0x4f, 0xb9, 0x61, 0x8a]);
interface ICallInterceptor : ICallIndirect
{
    HRESULT RegisterSink(ICallFrameEvents psink);
    HRESULT GetRegisteredSink(ICallFrameEvents* ppsink);
}
enum IID_ICallFrameEvents = GUID(0xfd5e0843, 0xfc91, 0x11d0, [0x97, 0xd7, 0x0, 0xc0, 0x4f, 0xb9, 0x61, 0x8a]);
interface ICallFrameEvents : IUnknown
{
    HRESULT OnCall(ICallFrame pFrame);
}
enum IID_ICallUnmarshal = GUID(0x5333b003, 0x2e42, 0x11d2, [0xb8, 0x9d, 0x0, 0xc0, 0x4f, 0xb9, 0x61, 0x8a]);
interface ICallUnmarshal : IUnknown
{
    HRESULT Unmarshal(uint iMethod, void* pBuffer, uint cbBuffer, BOOL fForceBufferCopy, uint dataRep, CALLFRAME_MARSHALCONTEXT* pcontext, uint* pcbUnmarshalled, ICallFrame* ppFrame);
    HRESULT ReleaseMarshalData(uint iMethod, void* pBuffer, uint cbBuffer, uint ibFirstRelease, uint dataRep, CALLFRAME_MARSHALCONTEXT* pcontext);
}
enum IID_ICallFrameWalker = GUID(0x8b23919, 0x392d, 0x11d2, [0xb8, 0xa4, 0x0, 0xc0, 0x4f, 0xb9, 0x61, 0x8a]);
interface ICallFrameWalker : IUnknown
{
    HRESULT OnWalkInterface(const(GUID)* iid, void** ppvInterface, BOOL fIn, BOOL fOut);
}
enum IID_IInterfaceRelated = GUID(0xd1fb5a79, 0x7706, 0x11d1, [0xad, 0xba, 0x0, 0xc0, 0x4f, 0xc2, 0xad, 0xc0]);
interface IInterfaceRelated : IUnknown
{
    HRESULT SetIID(const(GUID)* iid);
    HRESULT GetIID(GUID* piid);
}
HRESULT CoGetInterceptor(const(GUID)* iidIntercepted, IUnknown punkOuter, const(GUID)* iid, void** ppv);
HRESULT CoGetInterceptorFromTypeInfo(const(GUID)* iidIntercepted, IUnknown punkOuter, ITypeInfo typeInfo, const(GUID)* iid, void** ppv);
