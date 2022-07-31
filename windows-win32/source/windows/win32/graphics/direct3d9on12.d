module windows.win32.graphics.direct3d9on12;

import windows.win32.guid : GUID;
import windows.win32.foundation : BOOL, HRESULT;
import windows.win32.graphics.direct3d12 : ID3D12CommandQueue, ID3D12Fence;
import windows.win32.graphics.direct3d9 : IDirect3D9, IDirect3D9Ex, IDirect3DResource9;
import windows.win32.system.com_ : IUnknown;

version (Windows):
extern (Windows):

HRESULT Direct3DCreate9On12Ex(uint, D3D9ON12_ARGS*, uint, IDirect3D9Ex*);
IDirect3D9 Direct3DCreate9On12(uint, D3D9ON12_ARGS*, uint);
enum MAX_D3D9ON12_QUEUES = 0x00000002;
struct D3D9ON12_ARGS
{
    BOOL Enable9On12;
    IUnknown pD3D12Device;
    IUnknown[2] ppD3D12Queues;
    uint NumQueues;
    uint NodeMask;
}
alias PFN_Direct3DCreate9On12Ex = HRESULT function(uint, D3D9ON12_ARGS*, uint, IDirect3D9Ex*);
alias PFN_Direct3DCreate9On12 = IDirect3D9 function(uint, D3D9ON12_ARGS*, uint);
enum IID_IDirect3DDevice9On12 = GUID(0xe7fda234, 0xb589, 0x4049, [0x94, 0xd, 0x88, 0x78, 0x97, 0x75, 0x31, 0xc8]);
interface IDirect3DDevice9On12 : IUnknown
{
    HRESULT GetD3D12Device(const(GUID)*, void**);
    HRESULT UnwrapUnderlyingResource(IDirect3DResource9, ID3D12CommandQueue, const(GUID)*, void**);
    HRESULT ReturnUnderlyingResource(IDirect3DResource9, uint, ulong*, ID3D12Fence*);
}
