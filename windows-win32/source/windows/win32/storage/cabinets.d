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

void* FCICreate(ERF* perf, PFNFCIFILEPLACED pfnfcifp, PFNFCIALLOC pfna, PFNFCIFREE pfnf, PFNFCIOPEN pfnopen, PFNFCIREAD pfnread, PFNFCIWRITE pfnwrite, PFNFCICLOSE pfnclose, PFNFCISEEK pfnseek, PFNFCIDELETE pfndelete, PFNFCIGETTEMPFILE pfnfcigtf, CCAB* pccab, void* pv);
BOOL FCIAddFile(void* hfci, PSTR pszSourceFile, PSTR pszFileName, BOOL fExecute, PFNFCIGETNEXTCABINET pfnfcignc, PFNFCISTATUS pfnfcis, PFNFCIGETOPENINFO pfnfcigoi, ushort typeCompress);
BOOL FCIFlushCabinet(void* hfci, BOOL fGetNextCab, PFNFCIGETNEXTCABINET pfnfcignc, PFNFCISTATUS pfnfcis);
BOOL FCIFlushFolder(void* hfci, PFNFCIGETNEXTCABINET pfnfcignc, PFNFCISTATUS pfnfcis);
BOOL FCIDestroy(void* hfci);
void* FDICreate(PFNALLOC pfnalloc, PFNFREE pfnfree, PFNOPEN pfnopen, PFNREAD pfnread, PFNWRITE pfnwrite, PFNCLOSE pfnclose, PFNSEEK pfnseek, FDICREATE_CPU_TYPE cpuType, ERF* perf);
BOOL FDIIsCabinet(void* hfdi, long hf, FDICABINETINFO* pfdici);
BOOL FDICopy(void* hfdi, PSTR pszCabinet, PSTR pszCabPath, int flags, PFNFDINOTIFY pfnfdin, PFNFDIDECRYPT pfnfdid, void* pvUser);
BOOL FDIDestroy(void* hfdi);
BOOL FDITruncateCabinet(void* hfdi, PSTR pszCabinetName, ushort iFolderToDelete);
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
alias PFNFCIALLOC = void* function(uint cb);
alias PFNFCIFREE = void function(void* memory);
alias PFNFCIOPEN = long function(PSTR pszFile, int oflag, int pmode, int* err, void* pv);
alias PFNFCIREAD = uint function(long hf, void* memory, uint cb, int* err, void* pv);
alias PFNFCIWRITE = uint function(long hf, void* memory, uint cb, int* err, void* pv);
alias PFNFCICLOSE = int function(long hf, int* err, void* pv);
alias PFNFCISEEK = int function(long hf, int dist, int seektype, int* err, void* pv);
alias PFNFCIDELETE = int function(PSTR pszFile, int* err, void* pv);
alias PFNFCIGETNEXTCABINET = BOOL function(CCAB* pccab, uint cbPrevCab, void* pv);
alias PFNFCIFILEPLACED = int function(CCAB* pccab, PSTR pszFile, int cbFile, BOOL fContinuation, void* pv);
alias PFNFCIGETOPENINFO = long function(PSTR pszName, ushort* pdate, ushort* ptime, ushort* pattribs, int* err, void* pv);
alias PFNFCISTATUS = int function(uint typeStatus, uint cb1, uint cb2, void* pv);
alias PFNFCIGETTEMPFILE = BOOL function(PSTR pszTempName, int cbTempName, void* pv);
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
        struct cabinet
        {
            void* pHeaderReserve;
            ushort cbHeaderReserve;
            ushort setID;
            int iCabinet;
        }
        struct folder
        {
            void* pFolderReserve;
            ushort cbFolderReserve;
            ushort iFolder;
        }
        struct decrypt
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
alias PFNALLOC = void* function(uint cb);
alias PFNFREE = void function(void* pv);
alias PFNOPEN = long function(PSTR pszFile, int oflag, int pmode);
alias PFNREAD = uint function(long hf, void* pv, uint cb);
alias PFNWRITE = uint function(long hf, void* pv, uint cb);
alias PFNCLOSE = int function(long hf);
alias PFNSEEK = int function(long hf, int dist, int seektype);
alias PFNFDIDECRYPT = int function(FDIDECRYPT* pfdid);
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

alias PFNFDINOTIFY = long function(FDINOTIFICATIONTYPE fdint, FDINOTIFICATION* pfdin);
/+ [CONFLICTED] struct FDISPILLFILE
{
    align (1):
    CHAR[2] ach;
    int cbFile;
}
+/
