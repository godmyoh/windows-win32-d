module windows.win32.storage.cabinets;

import windows.win32.foundation : BOOL, CHAR, PSTR;

version (Windows):
extern (Windows):

alias FDICREATE_CPU_TYPE = int;
enum : int
{
    cpuUNKNOWN = 0xffffffff,
    cpu80286   = 0x00000000,
    cpu80386   = 0x00000001,
}

void* FCICreate(ERF*, PFNFCIFILEPLACED, PFNFCIALLOC, PFNFCIFREE, PFNFCIOPEN, PFNFCIREAD, PFNFCIWRITE, PFNFCICLOSE, PFNFCISEEK, PFNFCIDELETE, PFNFCIGETTEMPFILE, CCAB*, void*);
BOOL FCIAddFile(void*, PSTR, PSTR, BOOL, PFNFCIGETNEXTCABINET, PFNFCISTATUS, PFNFCIGETOPENINFO, ushort);
BOOL FCIFlushCabinet(void*, BOOL, PFNFCIGETNEXTCABINET, PFNFCISTATUS);
BOOL FCIFlushFolder(void*, PFNFCIGETNEXTCABINET, PFNFCISTATUS);
BOOL FCIDestroy(void*);
void* FDICreate(PFNALLOC, PFNFREE, PFNOPEN, PFNREAD, PFNWRITE, PFNCLOSE, PFNSEEK, FDICREATE_CPU_TYPE, ERF*);
BOOL FDIIsCabinet(void*, long, FDICABINETINFO*);
BOOL FDICopy(void*, PSTR, PSTR, int, PFNFDINOTIFY, PFNFDIDECRYPT, void*);
BOOL FDIDestroy(void*);
BOOL FDITruncateCabinet(void*, PSTR, ushort);
enum INCLUDED_FCI = 0x00000001;
enum _A_NAME_IS_UTF = 0x00000080;
enum _A_EXEC = 0x00000040;
enum statusFile = 0x00000000;
enum statusFolder = 0x00000001;
enum statusCabinet = 0x00000002;
enum INCLUDED_TYPES_FCI_FDI = 0x00000001;
enum CB_MAX_DISK = 0x7fffffff;
enum CB_MAX_FILENAME = 0x00000100;
enum CB_MAX_CABINET_NAME = 0x00000100;
enum CB_MAX_CAB_PATH = 0x00000100;
enum CB_MAX_DISK_NAME = 0x00000100;
enum tcompMASK_TYPE = 0x0000000f;
enum tcompTYPE_NONE = 0x00000000;
enum tcompTYPE_MSZIP = 0x00000001;
enum tcompTYPE_QUANTUM = 0x00000002;
enum tcompTYPE_LZX = 0x00000003;
enum tcompBAD = 0x0000000f;
enum tcompMASK_LZX_WINDOW = 0x00001f00;
enum tcompLZX_WINDOW_LO = 0x00000f00;
enum tcompLZX_WINDOW_HI = 0x00001500;
enum tcompSHIFT_LZX_WINDOW = 0x00000008;
enum tcompMASK_QUANTUM_LEVEL = 0x000000f0;
enum tcompQUANTUM_LEVEL_LO = 0x00000010;
enum tcompQUANTUM_LEVEL_HI = 0x00000070;
enum tcompSHIFT_QUANTUM_LEVEL = 0x00000004;
enum tcompMASK_QUANTUM_MEM = 0x00001f00;
enum tcompQUANTUM_MEM_LO = 0x00000a00;
enum tcompQUANTUM_MEM_HI = 0x00001500;
enum tcompSHIFT_QUANTUM_MEM = 0x00000008;
enum tcompMASK_RESERVED = 0x0000e000;
enum INCLUDED_FDI = 0x00000001;
struct FDISPILLFILE
{
    CHAR[2] ach;
    int cbFile;
}
struct ERF
{
    int erfOper;
    int erfType;
    BOOL fError;
}
alias FCIERROR = int;
enum : int
{
    FCIERR_NONE             = 0x00000000,
    FCIERR_OPEN_SRC         = 0x00000001,
    FCIERR_READ_SRC         = 0x00000002,
    FCIERR_ALLOC_FAIL       = 0x00000003,
    FCIERR_TEMP_FILE        = 0x00000004,
    FCIERR_BAD_COMPR_TYPE   = 0x00000005,
    FCIERR_CAB_FILE         = 0x00000006,
    FCIERR_USER_ABORT       = 0x00000007,
    FCIERR_MCI_FAIL         = 0x00000008,
    FCIERR_CAB_FORMAT_LIMIT = 0x00000009,
}

struct CCAB
{
    uint cb;
    uint cbFolderThresh;
    uint cbReserveCFHeader;
    uint cbReserveCFFolder;
    uint cbReserveCFData;
    int iCab;
    int iDisk;
    int fFailOnIncompressible;
    ushort setID;
    CHAR[256] szDisk;
    CHAR[256] szCab;
    CHAR[256] szCabPath;
}
alias PFNFCIALLOC = void* function(uint);
alias PFNFCIFREE = void function(void*);
alias PFNFCIOPEN = long function(PSTR, int, int, int*, void*);
alias PFNFCIREAD = uint function(long, void*, uint, int*, void*);
alias PFNFCIWRITE = uint function(long, void*, uint, int*, void*);
alias PFNFCICLOSE = int function(long, int*, void*);
alias PFNFCISEEK = int function(long, int, int, int*, void*);
alias PFNFCIDELETE = int function(PSTR, int*, void*);
alias PFNFCIGETNEXTCABINET = BOOL function(CCAB*, uint, void*);
alias PFNFCIFILEPLACED = int function(CCAB*, PSTR, int, BOOL, void*);
alias PFNFCIGETOPENINFO = long function(PSTR, ushort*, ushort*, ushort*, int*, void*);
alias PFNFCISTATUS = int function(uint, uint, uint, void*);
alias PFNFCIGETTEMPFILE = BOOL function(PSTR, int, void*);
alias FDIERROR = int;
enum : int
{
    FDIERROR_NONE                    = 0x00000000,
    FDIERROR_CABINET_NOT_FOUND       = 0x00000001,
    FDIERROR_NOT_A_CABINET           = 0x00000002,
    FDIERROR_UNKNOWN_CABINET_VERSION = 0x00000003,
    FDIERROR_CORRUPT_CABINET         = 0x00000004,
    FDIERROR_ALLOC_FAIL              = 0x00000005,
    FDIERROR_BAD_COMPR_TYPE          = 0x00000006,
    FDIERROR_MDI_FAIL                = 0x00000007,
    FDIERROR_TARGET_FILE             = 0x00000008,
    FDIERROR_RESERVE_MISMATCH        = 0x00000009,
    FDIERROR_WRONG_CABINET           = 0x0000000a,
    FDIERROR_USER_ABORT              = 0x0000000b,
    FDIERROR_EOF                     = 0x0000000c,
}

struct FDICABINETINFO
{
    int cbCabinet;
    ushort cFolders;
    ushort cFiles;
    ushort setID;
    ushort iCabinet;
    BOOL fReserve;
    BOOL hasprev;
    BOOL hasnext;
}
alias FDIDECRYPTTYPE = int;
enum : int
{
    fdidtNEW_CABINET = 0x00000000,
    fdidtNEW_FOLDER  = 0x00000001,
    fdidtDECRYPT     = 0x00000002,
}

struct FDIDECRYPT
{
    FDIDECRYPTTYPE fdidt;
    void* pvUser;
    union
    {
        struct _cabinet_e__Struct
        {
            void* pHeaderReserve;
            ushort cbHeaderReserve;
            ushort setID;
            int iCabinet;
        }
        struct _folder_e__Struct
        {
            void* pFolderReserve;
            ushort cbFolderReserve;
            ushort iFolder;
        }
        struct _decrypt_e__Struct
        {
            void* pDataReserve;
            ushort cbDataReserve;
            void* pbData;
            ushort cbData;
            BOOL fSplit;
            ushort cbPartial;
        }
    }
}
alias PFNALLOC = void* function(uint);
alias PFNFREE = void function(void*);
alias PFNOPEN = long function(PSTR, int, int);
alias PFNREAD = uint function(long, void*, uint);
alias PFNWRITE = uint function(long, void*, uint);
alias PFNCLOSE = int function(long);
alias PFNSEEK = int function(long, int, int);
alias PFNFDIDECRYPT = int function(FDIDECRYPT*);
struct FDINOTIFICATION
{
    int cb;
    PSTR psz1;
    PSTR psz2;
    PSTR psz3;
    void* pv;
    long hf;
    ushort date;
    ushort time;
    ushort attribs;
    ushort setID;
    ushort iCabinet;
    ushort iFolder;
    FDIERROR fdie;
}
alias FDINOTIFICATIONTYPE = int;
enum : int
{
    fdintCABINET_INFO    = 0x00000000,
    fdintPARTIAL_FILE    = 0x00000001,
    fdintCOPY_FILE       = 0x00000002,
    fdintCLOSE_FILE_INFO = 0x00000003,
    fdintNEXT_CABINET    = 0x00000004,
    fdintENUMERATE       = 0x00000005,
}

alias PFNFDINOTIFY = long function(FDINOTIFICATIONTYPE, FDINOTIFICATION*);
/+ [CONFLICTED] struct FDISPILLFILE
{
    align (1):
    CHAR[2] ach;
    int cbFile;
}
+/
