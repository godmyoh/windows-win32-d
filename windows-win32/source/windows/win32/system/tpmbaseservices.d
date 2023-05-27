module windows.win32.system.tpmbaseservices;

import windows.win32.foundation : BOOL, HRESULT, PWSTR;

version (Windows):
extern (Windows):

alias TBS_COMMAND_PRIORITY = uint;
enum : uint
{
    TBS_COMMAND_PRIORITY_LOW    = 0x00000064,
    TBS_COMMAND_PRIORITY_NORMAL = 0x000000c8,
    TBS_COMMAND_PRIORITY_SYSTEM = 0x00000190,
    TBS_COMMAND_PRIORITY_HIGH   = 0x0000012c,
    TBS_COMMAND_PRIORITY_MAX    = 0x80000000,
}

alias TBS_COMMAND_LOCALITY = uint;
enum : uint
{
    TBS_COMMAND_LOCALITY_ZERO  = 0x00000000,
    TBS_COMMAND_LOCALITY_ONE   = 0x00000001,
    TBS_COMMAND_LOCALITY_TWO   = 0x00000002,
    TBS_COMMAND_LOCALITY_THREE = 0x00000003,
    TBS_COMMAND_LOCALITY_FOUR  = 0x00000004,
}

uint Tbsi_Context_Create(TBS_CONTEXT_PARAMS*, void**);
uint Tbsip_Context_Close(void*);
uint Tbsip_Submit_Command(void*, TBS_COMMAND_LOCALITY, TBS_COMMAND_PRIORITY, ubyte*, uint, ubyte*, uint*);
uint Tbsip_Cancel_Commands(void*);
uint Tbsi_Physical_Presence_Command(void*, ubyte*, uint, ubyte*, uint*);
uint Tbsi_Get_TCG_Log(void*, ubyte*, uint*);
uint Tbsi_GetDeviceInfo(uint, void*);
uint Tbsi_Get_OwnerAuth(void*, uint, ubyte*, uint*);
uint Tbsi_Revoke_Attestation();
HRESULT GetDeviceID(ubyte*, uint, uint*, BOOL*);
HRESULT GetDeviceIDString(PWSTR, uint, uint*, BOOL*);
uint Tbsi_Create_Windows_Key(uint);
uint Tbsi_Get_TCG_Log_Ex(uint, ubyte*, uint*);
BOOL Tbsi_Is_Tpm_Present();
enum TBS_CONTEXT_VERSION_ONE = 0x00000001;
enum TBS_SUCCESS = 0x00000000;
enum TBS_OWNERAUTH_TYPE_FULL = 0x00000001;
enum TBS_OWNERAUTH_TYPE_ADMIN = 0x00000002;
enum TBS_OWNERAUTH_TYPE_USER = 0x00000003;
enum TBS_OWNERAUTH_TYPE_ENDORSEMENT = 0x00000004;
enum TBS_OWNERAUTH_TYPE_ENDORSEMENT_20 = 0x0000000c;
enum TBS_OWNERAUTH_TYPE_STORAGE_20 = 0x0000000d;
enum TBS_CONTEXT_VERSION_TWO = 0x00000002;
enum TPM_WNF_INFO_CLEAR_SUCCESSFUL = 0x00000001;
enum TPM_WNF_INFO_OWNERSHIP_SUCCESSFUL = 0x00000002;
enum TPM_WNF_INFO_NO_REBOOT_REQUIRED = 0x00000001;
enum TPM_VERSION_UNKNOWN = 0x00000000;
enum TPM_VERSION_12 = 0x00000001;
enum TPM_VERSION_20 = 0x00000002;
enum TPM_IFTYPE_UNKNOWN = 0x00000000;
enum TPM_IFTYPE_1 = 0x00000001;
enum TPM_IFTYPE_TRUSTZONE = 0x00000002;
enum TPM_IFTYPE_HW = 0x00000003;
enum TPM_IFTYPE_EMULATOR = 0x00000004;
enum TPM_IFTYPE_SPB = 0x00000005;
enum TBS_TCGLOG_SRTM_CURRENT = 0x00000000;
enum TBS_TCGLOG_DRTM_CURRENT = 0x00000001;
enum TBS_TCGLOG_SRTM_BOOT = 0x00000002;
enum TBS_TCGLOG_SRTM_RESUME = 0x00000003;
enum TBS_TCGLOG_DRTM_BOOT = 0x00000004;
enum TBS_TCGLOG_DRTM_RESUME = 0x00000005;
struct TBS_CONTEXT_PARAMS
{
    uint version_;
}
struct TBS_CONTEXT_PARAMS2
{
    uint version_;
    union
    {
        struct
        {
            uint _bitfield0;
        }
        uint asUINT32;
    }
}
struct TPM_WNF_PROVISIONING
{
    uint status;
    ubyte[28] message;
}
struct TPM_DEVICE_INFO
{
    uint structVersion;
    uint tpmVersion;
    uint tpmInterfaceType;
    uint tpmImpRevision;
}
