module windows.win32.security.cryptography.sip;

import windows.win32.guid : GUID;
import windows.win32.foundation : BOOL, HANDLE, PWSTR;
import windows.win32.security.cryptography : CERT_QUERY_ENCODING_TYPE, CRYPT_ALGORITHM_IDENTIFIER, CRYPT_ATTRIBUTE_TYPE_VALUE, CRYPT_INTEGER_BLOB;
import windows.win32.security.cryptography.catalog : MS_ADDINFO_CATALOGMEMBER;

version (Windows):
extern (Windows):

BOOL CryptSIPGetSignedDataMsg(SIP_SUBJECTINFO* pSubjectInfo, CERT_QUERY_ENCODING_TYPE* pdwEncodingType, uint dwIndex, uint* pcbSignedDataMsg, ubyte* pbSignedDataMsg);
BOOL CryptSIPPutSignedDataMsg(SIP_SUBJECTINFO* pSubjectInfo, CERT_QUERY_ENCODING_TYPE dwEncodingType, uint* pdwIndex, uint cbSignedDataMsg, ubyte* pbSignedDataMsg);
BOOL CryptSIPCreateIndirectData(SIP_SUBJECTINFO* pSubjectInfo, uint* pcbIndirectData, SIP_INDIRECT_DATA* pIndirectData);
BOOL CryptSIPVerifyIndirectData(SIP_SUBJECTINFO* pSubjectInfo, SIP_INDIRECT_DATA* pIndirectData);
BOOL CryptSIPRemoveSignedDataMsg(SIP_SUBJECTINFO* pSubjectInfo, uint dwIndex);
BOOL CryptSIPLoad(const(GUID)* pgSubject, uint dwFlags, SIP_DISPATCH_INFO* pSipDispatch);
BOOL CryptSIPRetrieveSubjectGuid(const(wchar)* FileName, HANDLE hFileIn, GUID* pgSubject);
BOOL CryptSIPRetrieveSubjectGuidForCatalogFile(const(wchar)* FileName, HANDLE hFileIn, GUID* pgSubject);
BOOL CryptSIPAddProvider(SIP_ADD_NEWPROVIDER* psNewProv);
BOOL CryptSIPRemoveProvider(GUID* pgProv);
BOOL CryptSIPGetCaps(SIP_SUBJECTINFO* pSubjInfo, SIP_CAP_SET_V3* pCaps);
BOOL CryptSIPGetSealedDigest(SIP_SUBJECTINFO* pSubjectInfo, const(ubyte)* pSig, uint dwSig, ubyte* pbDigest, uint* pcbDigest);
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
alias pCryptSIPGetSignedDataMsg = BOOL function(SIP_SUBJECTINFO* pSubjectInfo, uint* pdwEncodingType, uint dwIndex, uint* pcbSignedDataMsg, ubyte* pbSignedDataMsg);
alias pCryptSIPPutSignedDataMsg = BOOL function(SIP_SUBJECTINFO* pSubjectInfo, uint dwEncodingType, uint* pdwIndex, uint cbSignedDataMsg, ubyte* pbSignedDataMsg);
alias pCryptSIPCreateIndirectData = BOOL function(SIP_SUBJECTINFO* pSubjectInfo, uint* pcbIndirectData, SIP_INDIRECT_DATA* pIndirectData);
alias pCryptSIPVerifyIndirectData = BOOL function(SIP_SUBJECTINFO* pSubjectInfo, SIP_INDIRECT_DATA* pIndirectData);
alias pCryptSIPRemoveSignedDataMsg = BOOL function(SIP_SUBJECTINFO* pSubjectInfo, uint dwIndex);
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
alias pfnIsFileSupported = BOOL function(HANDLE hFile, GUID* pgSubject);
alias pfnIsFileSupportedName = BOOL function(PWSTR pwszFileName, GUID* pgSubject);
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
alias pCryptSIPGetCaps = BOOL function(SIP_SUBJECTINFO* pSubjInfo, SIP_CAP_SET_V3* pCaps);
alias pCryptSIPGetSealedDigest = BOOL function(SIP_SUBJECTINFO* pSubjectInfo, const(ubyte)* pSig, uint dwSig, ubyte* pbDigest, uint* pcbDigest);
