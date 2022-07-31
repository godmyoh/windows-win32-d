module windows.win32.system.passwordmanagement;

import windows.win32.foundation : BOOLEAN, CHAR, PWSTR;

version (Windows):
extern (Windows):

struct CYPHER_BLOCK
{
    CHAR[8] data;
}
struct LM_OWF_PASSWORD
{
    CYPHER_BLOCK[2] data;
}
struct SAMPR_ENCRYPTED_USER_PASSWORD
{
    ubyte[516] Buffer;
}
struct ENCRYPTED_LM_OWF_PASSWORD
{
    CYPHER_BLOCK[2] data;
}
uint MSChapSrvChangePassword(PWSTR, PWSTR, BOOLEAN, LM_OWF_PASSWORD*, LM_OWF_PASSWORD*, LM_OWF_PASSWORD*, LM_OWF_PASSWORD*);
uint MSChapSrvChangePassword2(PWSTR, PWSTR, SAMPR_ENCRYPTED_USER_PASSWORD*, ENCRYPTED_LM_OWF_PASSWORD*, BOOLEAN, SAMPR_ENCRYPTED_USER_PASSWORD*, ENCRYPTED_LM_OWF_PASSWORD*);
