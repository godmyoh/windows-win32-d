module windows.win32.security.cryptography.sip;

import windows.win32.guid : GUID;
import windows.win32.foundation : BOOL, HANDLE, PWSTR;
import windows.win32.security.cryptography : CERT_QUERY_ENCODING_TYPE, CRYPT_ALGORITHM_IDENTIFIER, CRYPT_ATTRIBUTE_TYPE_VALUE, CRYPT_INTEGER_BLOB;
import windows.win32.security.cryptography.catalog : MS_ADDINFO_CATALOGMEMBER;

version (Windows):
extern (Windows):

BOOL CryptSIPGetSignedDataMsg(SIP_SUBJECTINFO*, CERT_QUERY_ENCODING_TYPE*, uint, uint*, ubyte*);
BOOL CryptSIPPutSignedDataMsg(SIP_SUBJECTINFO*, CERT_QUERY_ENCODING_TYPE, uint*, uint, ubyte*);
BOOL CryptSIPCreateIndirectData(SIP_SUBJECTINFO*, uint*, SIP_INDIRECT_DATA*);
BOOL CryptSIPVerifyIndirectData(SIP_SUBJECTINFO*, SIP_INDIRECT_DATA*);
BOOL CryptSIPRemoveSignedDataMsg(SIP_SUBJECTINFO*, uint);
BOOL CryptSIPLoad(const(GUID)*, uint, SIP_DISPATCH_INFO*);
BOOL CryptSIPRetrieveSubjectGuid(const(wchar)*, HANDLE, GUID*);
BOOL CryptSIPRetrieveSubjectGuidForCatalogFile(const(wchar)*, HANDLE, GUID*);
BOOL CryptSIPAddProvider(SIP_ADD_NEWPROVIDER*);
BOOL CryptSIPRemoveProvider(GUID*);
BOOL CryptSIPGetCaps(SIP_SUBJECTINFO*, SIP_CAP_SET_V3*);
BOOL CryptSIPGetSealedDigest(SIP_SUBJECTINFO*, const(ubyte)*, uint, ubyte*, uint*);
enum MSSIP_FLAGS_PROHIBIT_RESIZE_ON_CREATE = 0x00010000;
enum MSSIP_FLAGS_USE_CATALOG = 0x00020000;
enum MSSIP_FLAGS_MULTI_HASH = 0x00040000;
enum SPC_RELAXED_PE_MARKER_CHECK = 0x00000800;
enum SPC_MARKER_CHECK_SKIP_SIP_INDIRECT_DATA_FLAG = 0x00000001;
enum SPC_MARKER_CHECK_CURRENTLY_SUPPORTED_FLAGS = 0x00000001;
enum MSSIP_ADDINFO_NONE = 0x00000000;
enum MSSIP_ADDINFO_FLAT = 0x00000001;
enum MSSIP_ADDINFO_CATMEMBER = 0x00000002;
enum MSSIP_ADDINFO_BLOB = 0x00000003;
enum MSSIP_ADDINFO_NONMSSIP = 0x000001f4;
enum SIP_CAP_SET_VERSION_2 = 0x00000002;
enum SIP_CAP_SET_VERSION_3 = 0x00000003;
enum SIP_CAP_SET_CUR_VER = 0x00000003;
enum SIP_CAP_FLAG_SEALING = 0x00000001;
enum SIP_MAX_MAGIC_NUMBER = 0x00000004;
struct SIP_SUBJECTINFO
{
    uint cbSize;
    GUID* pgSubjectType;
    HANDLE hFile;
    const(wchar)* pwsFileName;
    const(wchar)* pwsDisplayName;
    uint dwReserved1;
    uint dwIntVersion;
    ulong hProv;
    CRYPT_ALGORITHM_IDENTIFIER DigestAlgorithm;
    uint dwFlags;
    uint dwEncodingType;
    uint dwReserved2;
    uint fdwCAPISettings;
    uint fdwSecuritySettings;
    uint dwIndex;
    uint dwUnionChoice;
    union
    {
        MS_ADDINFO_FLAT* psFlat;
        MS_ADDINFO_CATALOGMEMBER* psCatMember;
        MS_ADDINFO_BLOB* psBlob;
    }
    void* pClientData;
}
struct MS_ADDINFO_FLAT
{
    uint cbStruct;
    SIP_INDIRECT_DATA* pIndirectData;
}
struct MS_ADDINFO_BLOB
{
    uint cbStruct;
    uint cbMemObject;
    ubyte* pbMemObject;
    uint cbMemSignedMsg;
    ubyte* pbMemSignedMsg;
}
struct SIP_CAP_SET_V2
{
    uint cbSize;
    uint dwVersion;
    BOOL isMultiSign;
    uint dwReserved;
}
struct SIP_CAP_SET_V3
{
    uint cbSize;
    uint dwVersion;
    BOOL isMultiSign;
    union
    {
        uint dwFlags;
        uint dwReserved;
    }
}
struct SIP_INDIRECT_DATA
{
    CRYPT_ATTRIBUTE_TYPE_VALUE Data;
    CRYPT_ALGORITHM_IDENTIFIER DigestAlgorithm;
    CRYPT_INTEGER_BLOB Digest;
}
alias pCryptSIPGetSignedDataMsg = BOOL function(SIP_SUBJECTINFO*, uint*, uint, uint*, ubyte*);
alias pCryptSIPPutSignedDataMsg = BOOL function(SIP_SUBJECTINFO*, uint, uint*, uint, ubyte*);
alias pCryptSIPCreateIndirectData = BOOL function(SIP_SUBJECTINFO*, uint*, SIP_INDIRECT_DATA*);
alias pCryptSIPVerifyIndirectData = BOOL function(SIP_SUBJECTINFO*, SIP_INDIRECT_DATA*);
alias pCryptSIPRemoveSignedDataMsg = BOOL function(SIP_SUBJECTINFO*, uint);
struct SIP_DISPATCH_INFO
{
    uint cbSize;
    HANDLE hSIP;
    pCryptSIPGetSignedDataMsg pfGet;
    pCryptSIPPutSignedDataMsg pfPut;
    pCryptSIPCreateIndirectData pfCreate;
    pCryptSIPVerifyIndirectData pfVerify;
    pCryptSIPRemoveSignedDataMsg pfRemove;
}
alias pfnIsFileSupported = BOOL function(HANDLE, GUID*);
alias pfnIsFileSupportedName = BOOL function(PWSTR, GUID*);
struct SIP_ADD_NEWPROVIDER
{
    uint cbStruct;
    GUID* pgSubject;
    PWSTR pwszDLLFileName;
    PWSTR pwszMagicNumber;
    PWSTR pwszIsFunctionName;
    PWSTR pwszGetFuncName;
    PWSTR pwszPutFuncName;
    PWSTR pwszCreateFuncName;
    PWSTR pwszVerifyFuncName;
    PWSTR pwszRemoveFuncName;
    PWSTR pwszIsFunctionNameFmt2;
    PWSTR pwszGetCapFuncName;
}
alias pCryptSIPGetCaps = BOOL function(SIP_SUBJECTINFO*, SIP_CAP_SET_V3*);
alias pCryptSIPGetSealedDigest = BOOL function(SIP_SUBJECTINFO*, const(ubyte)*, uint, ubyte*, uint*);
