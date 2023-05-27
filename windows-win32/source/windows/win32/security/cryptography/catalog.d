module windows.win32.security.cryptography.catalog;

import windows.win32.guid : GUID;
import windows.win32.foundation : BOOL, HANDLE, PWSTR;
import windows.win32.security.cryptography : CERT_STRONG_SIGN_PARA, CRYPT_INTEGER_BLOB;
import windows.win32.security.cryptography.sip : SIP_INDIRECT_DATA;

version (Windows):
extern (Windows):

alias CRYPTCAT_VERSION = uint;
enum : uint
{
    CRYPTCAT_VERSION_1 = 0x00000100,
    CRYPTCAT_VERSION_2 = 0x00000200,
}

alias CRYPTCAT_OPEN_FLAGS = uint;
enum : uint
{
    CRYPTCAT_OPEN_ALWAYS               = 0x00000002,
    CRYPTCAT_OPEN_CREATENEW            = 0x00000001,
    CRYPTCAT_OPEN_EXISTING             = 0x00000004,
    CRYPTCAT_OPEN_EXCLUDE_PAGE_HASHES  = 0x00010000,
    CRYPTCAT_OPEN_INCLUDE_PAGE_HASHES  = 0x00020000,
    CRYPTCAT_OPEN_VERIFYSIGHASH        = 0x10000000,
    CRYPTCAT_OPEN_NO_CONTENT_HCRYPTMSG = 0x20000000,
    CRYPTCAT_OPEN_SORTED               = 0x40000000,
    CRYPTCAT_OPEN_FLAGS_MASK           = 0xffff0000,
}

HANDLE CryptCATOpen(PWSTR, CRYPTCAT_OPEN_FLAGS, ulong, CRYPTCAT_VERSION, uint);
BOOL CryptCATClose(HANDLE);
CRYPTCATSTORE* CryptCATStoreFromHandle(HANDLE);
HANDLE CryptCATHandleFromStore(CRYPTCATSTORE*);
BOOL CryptCATPersistStore(HANDLE);
CRYPTCATATTRIBUTE* CryptCATGetCatAttrInfo(HANDLE, PWSTR);
CRYPTCATATTRIBUTE* CryptCATPutCatAttrInfo(HANDLE, PWSTR, uint, uint, ubyte*);
CRYPTCATATTRIBUTE* CryptCATEnumerateCatAttr(HANDLE, CRYPTCATATTRIBUTE*);
CRYPTCATMEMBER* CryptCATGetMemberInfo(HANDLE, PWSTR);
CRYPTCATMEMBER* CryptCATAllocSortedMemberInfo(HANDLE, PWSTR);
void CryptCATFreeSortedMemberInfo(HANDLE, CRYPTCATMEMBER*);
CRYPTCATATTRIBUTE* CryptCATGetAttrInfo(HANDLE, CRYPTCATMEMBER*, PWSTR);
CRYPTCATMEMBER* CryptCATPutMemberInfo(HANDLE, PWSTR, PWSTR, GUID*, uint, uint, ubyte*);
CRYPTCATATTRIBUTE* CryptCATPutAttrInfo(HANDLE, CRYPTCATMEMBER*, PWSTR, uint, uint, ubyte*);
CRYPTCATMEMBER* CryptCATEnumerateMember(HANDLE, CRYPTCATMEMBER*);
CRYPTCATATTRIBUTE* CryptCATEnumerateAttr(HANDLE, CRYPTCATMEMBER*, CRYPTCATATTRIBUTE*);
CRYPTCATCDF* CryptCATCDFOpen(PWSTR, PFN_CDF_PARSE_ERROR_CALLBACK);
BOOL CryptCATCDFClose(CRYPTCATCDF*);
CRYPTCATATTRIBUTE* CryptCATCDFEnumCatAttributes(CRYPTCATCDF*, CRYPTCATATTRIBUTE*, PFN_CDF_PARSE_ERROR_CALLBACK);
CRYPTCATMEMBER* CryptCATCDFEnumMembers(CRYPTCATCDF*, CRYPTCATMEMBER*, PFN_CDF_PARSE_ERROR_CALLBACK);
CRYPTCATATTRIBUTE* CryptCATCDFEnumAttributes(CRYPTCATCDF*, CRYPTCATMEMBER*, CRYPTCATATTRIBUTE*, PFN_CDF_PARSE_ERROR_CALLBACK);
BOOL IsCatalogFile(HANDLE, PWSTR);
BOOL CryptCATAdminAcquireContext(long*, const(GUID)*, uint);
BOOL CryptCATAdminAcquireContext2(long*, const(GUID)*, const(wchar)*, CERT_STRONG_SIGN_PARA*, uint);
BOOL CryptCATAdminReleaseContext(long, uint);
BOOL CryptCATAdminReleaseCatalogContext(long, long, uint);
long CryptCATAdminEnumCatalogFromHash(long, ubyte*, uint, uint, long*);
BOOL CryptCATAdminCalcHashFromFileHandle(HANDLE, uint*, ubyte*, uint);
BOOL CryptCATAdminCalcHashFromFileHandle2(long, HANDLE, uint*, ubyte*, uint);
long CryptCATAdminAddCatalog(long, PWSTR, PWSTR, uint);
BOOL CryptCATAdminRemoveCatalog(long, const(wchar)*, uint);
BOOL CryptCATCatalogInfoFromContext(long, CATALOG_INFO*, uint);
BOOL CryptCATAdminResolveCatalogPath(long, PWSTR, CATALOG_INFO*, uint);
BOOL CryptCATAdminPauseServiceForBackup(uint, BOOL);
enum szOID_CATALOG_LIST = "1.3.6.1.4.1.311.12.1.1";
enum szOID_CATALOG_LIST_MEMBER = "1.3.6.1.4.1.311.12.1.2";
enum szOID_CATALOG_LIST_MEMBER2 = "1.3.6.1.4.1.311.12.1.3";
enum CRYPTCAT_FILEEXT = "CAT";
enum CRYPTCAT_MAX_MEMBERTAG = 0x00000040;
enum CRYPTCAT_MEMBER_SORTED = 0x40000000;
enum CRYPTCAT_ATTR_AUTHENTICATED = 0x10000000;
enum CRYPTCAT_ATTR_UNAUTHENTICATED = 0x20000000;
enum CRYPTCAT_ATTR_NAMEASCII = 0x00000001;
enum CRYPTCAT_ATTR_NAMEOBJID = 0x00000002;
enum CRYPTCAT_ATTR_DATAASCII = 0x00010000;
enum CRYPTCAT_ATTR_DATABASE64 = 0x00020000;
enum CRYPTCAT_ATTR_DATAREPLACE = 0x00040000;
enum CRYPTCAT_ATTR_NO_AUTO_COMPAT_ENTRY = 0x01000000;
enum CRYPTCAT_E_AREA_HEADER = 0x00000000;
enum CRYPTCAT_E_AREA_MEMBER = 0x00010000;
enum CRYPTCAT_E_AREA_ATTRIBUTE = 0x00020000;
enum CRYPTCAT_E_CDF_UNSUPPORTED = 0x00000001;
enum CRYPTCAT_E_CDF_DUPLICATE = 0x00000002;
enum CRYPTCAT_E_CDF_TAGNOTFOUND = 0x00000004;
enum CRYPTCAT_E_CDF_MEMBER_FILE_PATH = 0x00010001;
enum CRYPTCAT_E_CDF_MEMBER_INDIRECTDATA = 0x00010002;
enum CRYPTCAT_E_CDF_MEMBER_FILENOTFOUND = 0x00010004;
enum CRYPTCAT_E_CDF_BAD_GUID_CONV = 0x00020001;
enum CRYPTCAT_E_CDF_ATTR_TOOFEWVALUES = 0x00020002;
enum CRYPTCAT_E_CDF_ATTR_TYPECOMBO = 0x00020004;
enum CRYPTCAT_ADDCATALOG_NONE = 0x00000000;
enum CRYPTCAT_ADDCATALOG_HARDLINK = 0x00000001;
struct CRYPTCATSTORE
{
    uint cbStruct;
    uint dwPublicVersion;
    PWSTR pwszP7File;
    ulong hProv;
    uint dwEncodingType;
    CRYPTCAT_OPEN_FLAGS fdwStoreFlags;
    HANDLE hReserved;
    HANDLE hAttrs;
    void* hCryptMsg;
    HANDLE hSorted;
}
struct CRYPTCATMEMBER
{
    uint cbStruct;
    PWSTR pwszReferenceTag;
    PWSTR pwszFileName;
    GUID gSubjectType;
    uint fdwMemberFlags;
    SIP_INDIRECT_DATA* pIndirectData;
    uint dwCertVersion;
    uint dwReserved;
    HANDLE hReserved;
    CRYPT_INTEGER_BLOB sEncodedIndirectData;
    CRYPT_INTEGER_BLOB sEncodedMemberInfo;
}
struct CRYPTCATATTRIBUTE
{
    uint cbStruct;
    PWSTR pwszReferenceTag;
    uint dwAttrTypeAndAction;
    uint cbValue;
    ubyte* pbValue;
    uint dwReserved;
}
struct CRYPTCATCDF
{
    uint cbStruct;
    HANDLE hFile;
    uint dwCurFilePos;
    uint dwLastMemberOffset;
    BOOL fEOF;
    PWSTR pwszResultDir;
    HANDLE hCATStore;
}
struct CATALOG_INFO
{
    uint cbStruct;
    wchar[260] wszCatalogFile;
}
alias PFN_CDF_PARSE_ERROR_CALLBACK = void function(uint, uint, PWSTR);
struct MS_ADDINFO_CATALOGMEMBER
{
    uint cbStruct;
    CRYPTCATSTORE* pStore;
    CRYPTCATMEMBER* pMember;
}
