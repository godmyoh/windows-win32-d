module windows.win32.system.winrt.ml;

import windows.win32.guid : GUID;
import windows.win32.ai.machinelearning.winml : IMLOperatorRegistry;
import windows.win32.foundation : HRESULT;
import windows.win32.graphics.direct3d12 : ID3D12CommandQueue, ID3D12Resource;
import windows.win32.system.com_ : IUnknown;

version (Windows):
extern (Windows):

enum IID_ILearningModelOperatorProviderNative = GUID(0x1adaa23a, 0xeb67, 0x41f3, [0xaa, 0xd8, 0x5d, 0x98, 0x4e, 0x9b, 0xac, 0xd4]);
interface ILearningModelOperatorProviderNative : IUnknown
{
    HRESULT GetRegistry(IMLOperatorRegistry*);
}
enum IID_ITensorNative = GUID(0x52f547ef, 0x5b03, 0x49b5, [0x82, 0xd6, 0x56, 0x5f, 0x1e, 0xe0, 0xdd, 0x49]);
interface ITensorNative : IUnknown
{
    HRESULT GetBuffer(ubyte**, uint*);
    HRESULT GetD3D12Resource(ID3D12Resource*);
}
enum IID_ITensorStaticsNative = GUID(0x39d055a4, 0x66f6, 0x4ebc, [0x95, 0xd9, 0x7a, 0x29, 0xeb, 0xe7, 0x69, 0xa]);
interface ITensorStaticsNative : IUnknown
{
    HRESULT CreateFromD3D12Resource(ID3D12Resource, long*, int, IUnknown*);
}
enum IID_ILearningModelDeviceFactoryNative = GUID(0x1e9b31a1, 0x662e, 0x4ae0, [0xaf, 0x67, 0xf6, 0x3b, 0xb3, 0x37, 0xe6, 0x34]);
interface ILearningModelDeviceFactoryNative : IUnknown
{
    HRESULT CreateFromD3D12CommandQueue(ID3D12CommandQueue, IUnknown*);
}
enum IID_ILearningModelSessionOptionsNative = GUID(0xc71e953f, 0x37b4, 0x4564, [0x86, 0x58, 0xd8, 0x39, 0x68, 0x66, 0xdb, 0xd]);
interface ILearningModelSessionOptionsNative : IUnknown
{
    HRESULT SetIntraOpNumThreadsOverride(uint);
}
