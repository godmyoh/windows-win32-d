module windows.win32.system.winrt.holographic;

import windows.win32.guid : GUID;
import windows.win32.foundation : HRESULT;
import windows.win32.graphics.direct3d12 : D3D12_RESOURCE_DESC, ID3D12CommandQueue, ID3D12Device, ID3D12Fence, ID3D12ProtectedResourceSession, ID3D12Resource;
import windows.win32.system.winrt_ : IInspectable;

version (Windows):
extern (Windows):

enum IID_IHolographicCameraInterop = GUID(0x7cc1f9c5, 0x6d02, 0x41fa, [0x95, 0x0, 0xe1, 0x80, 0x9e, 0xb4, 0x8e, 0xec]);
interface IHolographicCameraInterop : IInspectable
{
    HRESULT CreateDirect3D12BackBufferResource(ID3D12Device, D3D12_RESOURCE_DESC*, ID3D12Resource*);
    HRESULT CreateDirect3D12HardwareProtectedBackBufferResource(ID3D12Device, D3D12_RESOURCE_DESC*, ID3D12ProtectedResourceSession, ID3D12Resource*);
    HRESULT AcquireDirect3D12BufferResource(ID3D12Resource, ID3D12CommandQueue);
    HRESULT AcquireDirect3D12BufferResourceWithTimeout(ID3D12Resource, ID3D12CommandQueue, ulong);
    HRESULT UnacquireDirect3D12BufferResource(ID3D12Resource);
}
enum IID_IHolographicCameraRenderingParametersInterop = GUID(0xf75b68d6, 0xd1fd, 0x4707, [0xaa, 0xfd, 0xfa, 0x6f, 0x4c, 0xe, 0x3b, 0xf4]);
interface IHolographicCameraRenderingParametersInterop : IInspectable
{
    HRESULT CommitDirect3D12Resource(ID3D12Resource, ID3D12Fence, ulong);
    HRESULT CommitDirect3D12ResourceWithDepthData(ID3D12Resource, ID3D12Fence, ulong, ID3D12Resource, ID3D12Fence, ulong);
}
enum IID_IHolographicQuadLayerInterop = GUID(0xcfa688f0, 0x639e, 0x4a47, [0x83, 0xd7, 0x6b, 0x7f, 0x5e, 0xbf, 0x7f, 0xed]);
interface IHolographicQuadLayerInterop : IInspectable
{
    HRESULT CreateDirect3D12ContentBufferResource(ID3D12Device, D3D12_RESOURCE_DESC*, ID3D12Resource*);
    HRESULT CreateDirect3D12HardwareProtectedContentBufferResource(ID3D12Device, D3D12_RESOURCE_DESC*, ID3D12ProtectedResourceSession, ID3D12Resource*);
    HRESULT AcquireDirect3D12BufferResource(ID3D12Resource, ID3D12CommandQueue);
    HRESULT AcquireDirect3D12BufferResourceWithTimeout(ID3D12Resource, ID3D12CommandQueue, ulong);
    HRESULT UnacquireDirect3D12BufferResource(ID3D12Resource);
}
enum IID_IHolographicQuadLayerUpdateParametersInterop = GUID(0xe5f549cd, 0xc909, 0x444f, [0x88, 0x9, 0x7c, 0xc1, 0x8a, 0x9c, 0x89, 0x20]);
interface IHolographicQuadLayerUpdateParametersInterop : IInspectable
{
    HRESULT CommitDirect3D12Resource(ID3D12Resource, ID3D12Fence, ulong);
}
