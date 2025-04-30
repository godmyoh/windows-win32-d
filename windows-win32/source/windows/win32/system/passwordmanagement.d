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
uint MSChapSrvChangePassword(PWSTR ServerName, PWSTR UserName, BOOLEAN LmOldPresent, LM_OWF_PASSWORD* LmOldOwfPassword, LM_OWF_PASSWORD* LmNewOwfPassword, LM_OWF_PASSWORD* NtOldOwfPassword, LM_OWF_PASSWORD* NtNewOwfPassword);
uint MSChapSrvChangePassword2(PWSTR ServerName, PWSTR UserName, SAMPR_ENCRYPTED_USER_PASSWORD* NewPasswordEncryptedWithOldNt, ENCRYPTED_LM_OWF_PASSWORD* OldNtOwfPasswordEncryptedWithNewNt, BOOLEAN LmPresent, SAMPR_ENCRYPTED_USER_PASSWORD* NewPasswordEncryptedWithOldLm, ENCRYPTED_LM_OWF_PASSWORD* OldLmOwfPasswordEncryptedWithNewLmOrNt);
