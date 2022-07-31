module windows.win32.devices.serialcommunication;

import windows.win32.foundation : BOOL;

version (Windows):
extern (Windows):

int ComDBOpen(long*);
int ComDBClose(HCOMDB);
int ComDBGetCurrentPortUsage(HCOMDB, ubyte*, uint, uint, uint*);
int ComDBClaimNextFreePort(HCOMDB, uint*);
int ComDBClaimPort(HCOMDB, uint, BOOL, BOOL*);
int ComDBReleasePort(HCOMDB, uint);
int ComDBResizeDatabase(HCOMDB, uint);
enum COMDB_MIN_PORTS_ARBITRATED = 0x00000100;
enum COMDB_MAX_PORTS_ARBITRATED = 0x00001000;
enum CDB_REPORT_BITS = 0x00000000;
enum CDB_REPORT_BYTES = 0x00000001;
alias HCOMDB = void*;
