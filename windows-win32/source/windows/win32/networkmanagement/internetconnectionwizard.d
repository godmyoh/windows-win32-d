module windows.win32.networkmanagement.internetconnectionwizard;

import windows.win32.foundation : PSTR;

version (Windows):
extern (Windows):

enum ICW_REGPATHSETTINGS = "Software\\Microsoft\\Internet Connection Wizard";
enum ICW_REGKEYCOMPLETED = "Completed";
enum ICW_MAX_ACCTNAME = 0x00000100;
enum ICW_MAX_PASSWORD = 0x00000100;
enum ICW_MAX_LOGONNAME = 0x00000100;
enum ICW_MAX_SERVERNAME = 0x00000040;
enum ICW_MAX_RASNAME = 0x00000100;
enum ICW_MAX_EMAILNAME = 0x00000040;
enum ICW_MAX_EMAILADDR = 0x00000080;
enum ICW_CHECKSTATUS = 0x00000001;
enum ICW_LAUNCHFULL = 0x00000100;
enum ICW_LAUNCHMANUAL = 0x00000200;
enum ICW_USE_SHELLNEXT = 0x00000400;
enum ICW_FULL_SMARTSTART = 0x00000800;
enum ICW_FULLPRESENT = 0x00000001;
enum ICW_MANUALPRESENT = 0x00000002;
enum ICW_ALREADYRUN = 0x00000004;
enum ICW_LAUNCHEDFULL = 0x00000100;
enum ICW_LAUNCHEDMANUAL = 0x00000200;
enum ICW_USEDEFAULTS = 0x00000001;
alias PFNCHECKCONNECTIONWIZARD = uint function(uint, uint*);
alias PFNSETSHELLNEXT = uint function(PSTR);
