module windows.win32.graphics.direct3d11on12;

import windows.win32.guid : GUID;
import windows.win32.foundation : HRESULT;
import windows.win32.graphics.direct3d : D3D_FEATURE_LEVEL;
import windows.win32.graphics.direct3d11 : ID3D11Device, ID3D11DeviceContext, ID3D11Resource;
import windows.win32.graphics.direct3d12 : D3D12_RESOURCE_STATES, ID3D12CommandQueue, ID3D12Fence;
import windows.win32.system.com : IUnknown;

version (Windows):
extern (Windows):

alias PFN_D3D11ON12_CREATE_DEVICE = HRESULT function(IUnknown, uint, const(D3D_FEATURE_LEVEL)*, uint, IUnknown*, uint, uint, ID3D11Device*, ID3D11DeviceContext*, D3D_FEATURE_LEVEL*);
struct D3D11_RESOURCE_FLAGS
{
    uint BindFlags;
    uint MiscFlags;
    uint CPUAccessFlags;
    uint StructureByteStride;
}
enum IID_ID3D11On12Device = GUID(0x85611e73, 0x70a9, 0x490e, [0x96, 0x14, 0xa9, 0xe3, 0x2, 0x77, 0x79, 0x4]);
interface ID3D11On12Device : IUnknown
{
    HRESULT CreateWrappedResource(IUnknown, const(D3D11_RESOURCE_FLAGS)*, D3D12_RESOURCE_STATES, D3D12_RESOURCE_STATES, const(GUID)*, void**);
    void ReleaseWrappedResources(ID3D11Resource*, uint);
    void AcquireWrappedResources(ID3D11Resource*, uint);
}
enum IID_ID3D11On12Device1 = GUID(0xbdb64df4, 0xea2f, 0x4c70, [0xb8, 0x61, 0xaa, 0xab, 0x12, 0x58, 0xbb, 0x5d]);
interface ID3D11On12Device1 : ID3D11On12Device
{
    HRESULT GetD3D12Device(const(GUID)*, void**);
}
enum IID_ID3D11On12Device2 = GUID(0xdc90f331, 0x4740, 0x43fa, [0x86, 0x6e, 0x67, 0xf1, 0x2c, 0xb5, 0x82, 0x23]);
interface ID3D11On12Device2 : ID3D11On12Device1
{
    HRESULT UnwrapUnderlyingResource(ID3D11Resource, ID3D12CommandQueue, const(GUID)*, void**);
    HRESULT ReturnUnderlyingResource(ID3D11Resource, uint, ulong*, ID3D12Fence*);
}
HRESULT D3D11On12CreateDevice(IUnknown, uint, const(D3D_FEATURE_LEVEL)*, uint, IUnknown*, uint, uint, ID3D11Device*, ID3D11DeviceContext*, D3D_FEATURE_LEVEL*);
