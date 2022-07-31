module windows.win32.storage.jet;

import windows.win32.foundation : CHAR, PSTR, PWSTR;
import windows.win32.storage.structuredstorage : JET_API_PTR, JET_HANDLE, JET_INSTANCE, JET_SESID, JET_TABLEID;

version (Windows):
extern (Windows):

int JetInit(JET_INSTANCE*);
int JetInit2(JET_INSTANCE*, uint);
int JetInit3A(JET_INSTANCE*, JET_RSTINFO_A*, uint);
int JetInit3W(JET_INSTANCE*, JET_RSTINFO_W*, uint);
int JetCreateInstanceA(JET_INSTANCE*, byte*);
int JetCreateInstanceW(JET_INSTANCE*, ushort*);
int JetCreateInstance2A(JET_INSTANCE*, byte*, byte*, uint);
int JetCreateInstance2W(JET_INSTANCE*, ushort*, ushort*, uint);
int JetGetInstanceMiscInfo(JET_INSTANCE, void*, uint, uint);
int JetTerm(JET_INSTANCE);
int JetTerm2(JET_INSTANCE, uint);
int JetStopService();
int JetStopServiceInstance(JET_INSTANCE);
int JetStopServiceInstance2(JET_INSTANCE, const(uint));
int JetStopBackup();
int JetStopBackupInstance(JET_INSTANCE);
int JetSetSystemParameterA(JET_INSTANCE*, JET_SESID, uint, JET_API_PTR, byte*);
int JetSetSystemParameterW(JET_INSTANCE*, JET_SESID, uint, JET_API_PTR, ushort*);
int JetGetSystemParameterA(JET_INSTANCE, JET_SESID, uint, JET_API_PTR*, byte*, uint);
int JetGetSystemParameterW(JET_INSTANCE, JET_SESID, uint, JET_API_PTR*, ushort*, uint);
int JetEnableMultiInstanceA(JET_SETSYSPARAM_A*, uint, uint*);
int JetEnableMultiInstanceW(JET_SETSYSPARAM_W*, uint, uint*);
int JetGetThreadStats(void*, uint);
int JetBeginSessionA(JET_INSTANCE, JET_SESID*, byte*, byte*);
int JetBeginSessionW(JET_INSTANCE, JET_SESID*, ushort*, ushort*);
int JetDupSession(JET_SESID, JET_SESID*);
int JetEndSession(JET_SESID, uint);
int JetGetVersion(JET_SESID, uint*);
int JetIdle(JET_SESID, uint);
int JetCreateDatabaseA(JET_SESID, byte*, byte*, uint*, uint);
int JetCreateDatabaseW(JET_SESID, ushort*, ushort*, uint*, uint);
int JetCreateDatabase2A(JET_SESID, byte*, const(uint), uint*, uint);
int JetCreateDatabase2W(JET_SESID, ushort*, const(uint), uint*, uint);
int JetAttachDatabaseA(JET_SESID, byte*, uint);
int JetAttachDatabaseW(JET_SESID, ushort*, uint);
int JetAttachDatabase2A(JET_SESID, byte*, const(uint), uint);
int JetAttachDatabase2W(JET_SESID, ushort*, const(uint), uint);
int JetDetachDatabaseA(JET_SESID, byte*);
int JetDetachDatabaseW(JET_SESID, ushort*);
int JetDetachDatabase2A(JET_SESID, byte*, uint);
int JetDetachDatabase2W(JET_SESID, ushort*, uint);
int JetGetObjectInfoA(JET_SESID, uint, uint, byte*, byte*, void*, uint, uint);
int JetGetObjectInfoW(JET_SESID, uint, uint, ushort*, ushort*, void*, uint, uint);
int JetGetTableInfoA(JET_SESID, JET_TABLEID, void*, uint, uint);
int JetGetTableInfoW(JET_SESID, JET_TABLEID, void*, uint, uint);
int JetCreateTableA(JET_SESID, uint, byte*, uint, uint, JET_TABLEID*);
int JetCreateTableW(JET_SESID, uint, ushort*, uint, uint, JET_TABLEID*);
int JetCreateTableColumnIndexA(JET_SESID, uint, JET_TABLECREATE_A*);
int JetCreateTableColumnIndexW(JET_SESID, uint, JET_TABLECREATE_W*);
int JetCreateTableColumnIndex2A(JET_SESID, uint, JET_TABLECREATE2_A*);
int JetCreateTableColumnIndex2W(JET_SESID, uint, JET_TABLECREATE2_W*);
int JetCreateTableColumnIndex3A(JET_SESID, uint, JET_TABLECREATE3_A*);
int JetCreateTableColumnIndex3W(JET_SESID, uint, JET_TABLECREATE3_W*);
int JetCreateTableColumnIndex4A(JET_SESID, uint, JET_TABLECREATE4_A*);
int JetCreateTableColumnIndex4W(JET_SESID, uint, JET_TABLECREATE4_W*);
int JetDeleteTableA(JET_SESID, uint, byte*);
int JetDeleteTableW(JET_SESID, uint, ushort*);
int JetRenameTableA(JET_SESID, uint, byte*, byte*);
int JetRenameTableW(JET_SESID, uint, ushort*, ushort*);
int JetGetTableColumnInfoA(JET_SESID, JET_TABLEID, byte*, void*, uint, uint);
int JetGetTableColumnInfoW(JET_SESID, JET_TABLEID, ushort*, void*, uint, uint);
int JetGetColumnInfoA(JET_SESID, uint, byte*, byte*, void*, uint, uint);
int JetGetColumnInfoW(JET_SESID, uint, ushort*, ushort*, void*, uint, uint);
int JetAddColumnA(JET_SESID, JET_TABLEID, byte*, const(JET_COLUMNDEF)*, const(void)*, uint, uint*);
int JetAddColumnW(JET_SESID, JET_TABLEID, ushort*, const(JET_COLUMNDEF)*, const(void)*, uint, uint*);
int JetDeleteColumnA(JET_SESID, JET_TABLEID, byte*);
int JetDeleteColumnW(JET_SESID, JET_TABLEID, ushort*);
int JetDeleteColumn2A(JET_SESID, JET_TABLEID, byte*, const(uint));
int JetDeleteColumn2W(JET_SESID, JET_TABLEID, ushort*, const(uint));
int JetRenameColumnA(JET_SESID, JET_TABLEID, byte*, byte*, uint);
int JetRenameColumnW(JET_SESID, JET_TABLEID, ushort*, ushort*, uint);
int JetSetColumnDefaultValueA(JET_SESID, uint, byte*, byte*, const(void)*, const(uint), const(uint));
int JetSetColumnDefaultValueW(JET_SESID, uint, ushort*, ushort*, const(void)*, const(uint), const(uint));
int JetGetTableIndexInfoA(JET_SESID, JET_TABLEID, byte*, void*, uint, uint);
int JetGetTableIndexInfoW(JET_SESID, JET_TABLEID, ushort*, void*, uint, uint);
int JetGetIndexInfoA(JET_SESID, uint, byte*, byte*, void*, uint, uint);
int JetGetIndexInfoW(JET_SESID, uint, ushort*, ushort*, void*, uint, uint);
int JetCreateIndexA(JET_SESID, JET_TABLEID, byte*, uint, const(char)*, uint, uint);
int JetCreateIndexW(JET_SESID, JET_TABLEID, ushort*, uint, const(wchar)*, uint, uint);
int JetCreateIndex2A(JET_SESID, JET_TABLEID, JET_INDEXCREATE_A*, uint);
int JetCreateIndex2W(JET_SESID, JET_TABLEID, JET_INDEXCREATE_W*, uint);
int JetCreateIndex3A(JET_SESID, JET_TABLEID, JET_INDEXCREATE2_A*, uint);
int JetCreateIndex3W(JET_SESID, JET_TABLEID, JET_INDEXCREATE2_W*, uint);
int JetCreateIndex4A(JET_SESID, JET_TABLEID, JET_INDEXCREATE3_A*, uint);
int JetCreateIndex4W(JET_SESID, JET_TABLEID, JET_INDEXCREATE3_W*, uint);
int JetDeleteIndexA(JET_SESID, JET_TABLEID, byte*);
int JetDeleteIndexW(JET_SESID, JET_TABLEID, ushort*);
int JetBeginTransaction(JET_SESID);
int JetBeginTransaction2(JET_SESID, uint);
int JetBeginTransaction3(JET_SESID, long, uint);
int JetCommitTransaction(JET_SESID, uint);
int JetCommitTransaction2(JET_SESID, uint, uint, JET_COMMIT_ID*);
int JetRollback(JET_SESID, uint);
int JetGetDatabaseInfoA(JET_SESID, uint, void*, uint, uint);
int JetGetDatabaseInfoW(JET_SESID, uint, void*, uint, uint);
int JetGetDatabaseFileInfoA(byte*, void*, uint, uint);
int JetGetDatabaseFileInfoW(ushort*, void*, uint, uint);
int JetOpenDatabaseA(JET_SESID, byte*, byte*, uint*, uint);
int JetOpenDatabaseW(JET_SESID, ushort*, ushort*, uint*, uint);
int JetCloseDatabase(JET_SESID, uint, uint);
int JetOpenTableA(JET_SESID, uint, byte*, const(void)*, uint, uint, JET_TABLEID*);
int JetOpenTableW(JET_SESID, uint, ushort*, const(void)*, uint, uint, JET_TABLEID*);
int JetSetTableSequential(JET_SESID, JET_TABLEID, uint);
int JetResetTableSequential(JET_SESID, JET_TABLEID, uint);
int JetCloseTable(JET_SESID, JET_TABLEID);
int JetDelete(JET_SESID, JET_TABLEID);
int JetUpdate(JET_SESID, JET_TABLEID, void*, uint, uint*);
int JetUpdate2(JET_SESID, JET_TABLEID, void*, uint, uint*, const(uint));
int JetEscrowUpdate(JET_SESID, JET_TABLEID, uint, void*, uint, void*, uint, uint*, uint);
int JetRetrieveColumn(JET_SESID, JET_TABLEID, uint, void*, uint, uint*, uint, JET_RETINFO*);
int JetRetrieveColumns(JET_SESID, JET_TABLEID, JET_RETRIEVECOLUMN*, uint);
int JetEnumerateColumns(JET_SESID, JET_TABLEID, uint, JET_ENUMCOLUMNID*, uint*, JET_ENUMCOLUMN**, JET_PFNREALLOC, void*, uint, uint);
int JetGetRecordSize(JET_SESID, JET_TABLEID, JET_RECSIZE*, const(uint));
int JetGetRecordSize2(JET_SESID, JET_TABLEID, JET_RECSIZE2*, const(uint));
int JetSetColumn(JET_SESID, JET_TABLEID, uint, const(void)*, uint, uint, JET_SETINFO*);
int JetSetColumns(JET_SESID, JET_TABLEID, JET_SETCOLUMN*, uint);
int JetPrepareUpdate(JET_SESID, JET_TABLEID, uint);
int JetGetRecordPosition(JET_SESID, JET_TABLEID, JET_RECPOS*, uint);
int JetGotoPosition(JET_SESID, JET_TABLEID, JET_RECPOS*);
int JetGetCursorInfo(JET_SESID, JET_TABLEID, void*, uint, uint);
int JetDupCursor(JET_SESID, JET_TABLEID, JET_TABLEID*, uint);
int JetGetCurrentIndexA(JET_SESID, JET_TABLEID, byte*, uint);
int JetGetCurrentIndexW(JET_SESID, JET_TABLEID, ushort*, uint);
int JetSetCurrentIndexA(JET_SESID, JET_TABLEID, byte*);
int JetSetCurrentIndexW(JET_SESID, JET_TABLEID, ushort*);
int JetSetCurrentIndex2A(JET_SESID, JET_TABLEID, byte*, uint);
int JetSetCurrentIndex2W(JET_SESID, JET_TABLEID, ushort*, uint);
int JetSetCurrentIndex3A(JET_SESID, JET_TABLEID, byte*, uint, uint);
int JetSetCurrentIndex3W(JET_SESID, JET_TABLEID, ushort*, uint, uint);
int JetSetCurrentIndex4A(JET_SESID, JET_TABLEID, byte*, JET_INDEXID*, uint, uint);
int JetSetCurrentIndex4W(JET_SESID, JET_TABLEID, ushort*, JET_INDEXID*, uint, uint);
int JetMove(JET_SESID, JET_TABLEID, int, uint);
int JetSetCursorFilter(JET_SESID, JET_TABLEID, JET_INDEX_COLUMN*, uint, uint);
int JetGetLock(JET_SESID, JET_TABLEID, uint);
int JetMakeKey(JET_SESID, JET_TABLEID, const(void)*, uint, uint);
int JetSeek(JET_SESID, JET_TABLEID, uint);
int JetPrereadKeys(JET_SESID, JET_TABLEID, const(void)**, const(uint)*, int, int*, uint);
int JetPrereadIndexRanges(JET_SESID, JET_TABLEID, const(JET_INDEX_RANGE)*, const(uint), uint*, const(uint)*, const(uint), uint);
int JetGetBookmark(JET_SESID, JET_TABLEID, void*, uint, uint*);
int JetGetSecondaryIndexBookmark(JET_SESID, JET_TABLEID, void*, uint, uint*, void*, uint, uint*, const(uint));
int JetCompactA(JET_SESID, byte*, byte*, JET_PFNSTATUS, CONVERT_A*, uint);
int JetCompactW(JET_SESID, ushort*, ushort*, JET_PFNSTATUS, CONVERT_W*, uint);
int JetDefragmentA(JET_SESID, uint, byte*, uint*, uint*, uint);
int JetDefragmentW(JET_SESID, uint, ushort*, uint*, uint*, uint);
int JetDefragment2A(JET_SESID, uint, byte*, uint*, uint*, JET_CALLBACK, uint);
int JetDefragment2W(JET_SESID, uint, ushort*, uint*, uint*, JET_CALLBACK, uint);
int JetDefragment3A(JET_SESID, byte*, byte*, uint*, uint*, JET_CALLBACK, void*, uint);
int JetDefragment3W(JET_SESID, ushort*, ushort*, uint*, uint*, JET_CALLBACK, void*, uint);
int JetSetDatabaseSizeA(JET_SESID, byte*, uint, uint*);
int JetSetDatabaseSizeW(JET_SESID, ushort*, uint, uint*);
int JetGrowDatabase(JET_SESID, uint, uint, uint*);
int JetResizeDatabase(JET_SESID, uint, uint, uint*, const(uint));
int JetSetSessionContext(JET_SESID, JET_API_PTR);
int JetResetSessionContext(JET_SESID);
int JetGotoBookmark(JET_SESID, JET_TABLEID, void*, uint);
int JetGotoSecondaryIndexBookmark(JET_SESID, JET_TABLEID, void*, uint, void*, uint, const(uint));
int JetIntersectIndexes(JET_SESID, JET_INDEXRANGE*, uint, JET_RECORDLIST*, uint);
int JetComputeStats(JET_SESID, JET_TABLEID);
int JetOpenTempTable(JET_SESID, const(JET_COLUMNDEF)*, uint, uint, JET_TABLEID*, uint*);
int JetOpenTempTable2(JET_SESID, const(JET_COLUMNDEF)*, uint, uint, uint, JET_TABLEID*, uint*);
int JetOpenTempTable3(JET_SESID, const(JET_COLUMNDEF)*, uint, JET_UNICODEINDEX*, uint, JET_TABLEID*, uint*);
int JetOpenTemporaryTable(JET_SESID, JET_OPENTEMPORARYTABLE*);
int JetOpenTemporaryTable2(JET_SESID, JET_OPENTEMPORARYTABLE2*);
int JetBackupA(byte*, uint, JET_PFNSTATUS);
int JetBackupW(ushort*, uint, JET_PFNSTATUS);
int JetBackupInstanceA(JET_INSTANCE, byte*, uint, JET_PFNSTATUS);
int JetBackupInstanceW(JET_INSTANCE, ushort*, uint, JET_PFNSTATUS);
int JetRestoreA(byte*, JET_PFNSTATUS);
int JetRestoreW(ushort*, JET_PFNSTATUS);
int JetRestore2A(byte*, byte*, JET_PFNSTATUS);
int JetRestore2W(ushort*, ushort*, JET_PFNSTATUS);
int JetRestoreInstanceA(JET_INSTANCE, byte*, byte*, JET_PFNSTATUS);
int JetRestoreInstanceW(JET_INSTANCE, ushort*, ushort*, JET_PFNSTATUS);
int JetSetIndexRange(JET_SESID, JET_TABLEID, uint);
int JetIndexRecordCount(JET_SESID, JET_TABLEID, uint*, uint);
int JetRetrieveKey(JET_SESID, JET_TABLEID, void*, uint, uint*, uint);
int JetBeginExternalBackup(uint);
int JetBeginExternalBackupInstance(JET_INSTANCE, uint);
int JetGetAttachInfoA(byte*, uint, uint*);
int JetGetAttachInfoW(ushort*, uint, uint*);
int JetGetAttachInfoInstanceA(JET_INSTANCE, byte*, uint, uint*);
int JetGetAttachInfoInstanceW(JET_INSTANCE, ushort*, uint, uint*);
int JetOpenFileA(byte*, JET_HANDLE*, uint*, uint*);
int JetOpenFileW(ushort*, JET_HANDLE*, uint*, uint*);
int JetOpenFileInstanceA(JET_INSTANCE, byte*, JET_HANDLE*, uint*, uint*);
int JetOpenFileInstanceW(JET_INSTANCE, ushort*, JET_HANDLE*, uint*, uint*);
int JetReadFile(JET_HANDLE, void*, uint, uint*);
int JetReadFileInstance(JET_INSTANCE, JET_HANDLE, void*, uint, uint*);
int JetCloseFile(JET_HANDLE);
int JetCloseFileInstance(JET_INSTANCE, JET_HANDLE);
int JetGetLogInfoA(byte*, uint, uint*);
int JetGetLogInfoW(ushort*, uint, uint*);
int JetGetLogInfoInstanceA(JET_INSTANCE, byte*, uint, uint*);
int JetGetLogInfoInstanceW(JET_INSTANCE, ushort*, uint, uint*);
int JetGetLogInfoInstance2A(JET_INSTANCE, byte*, uint, uint*, JET_LOGINFO_A*);
int JetGetLogInfoInstance2W(JET_INSTANCE, ushort*, uint, uint*, JET_LOGINFO_W*);
int JetGetTruncateLogInfoInstanceA(JET_INSTANCE, byte*, uint, uint*);
int JetGetTruncateLogInfoInstanceW(JET_INSTANCE, ushort*, uint, uint*);
int JetTruncateLog();
int JetTruncateLogInstance(JET_INSTANCE);
int JetEndExternalBackup();
int JetEndExternalBackupInstance(JET_INSTANCE);
int JetEndExternalBackupInstance2(JET_INSTANCE, uint);
int JetExternalRestoreA(byte*, byte*, JET_RSTMAP_A*, int, byte*, int, int, JET_PFNSTATUS);
int JetExternalRestoreW(ushort*, ushort*, JET_RSTMAP_W*, int, ushort*, int, int, JET_PFNSTATUS);
int JetExternalRestore2A(byte*, byte*, JET_RSTMAP_A*, int, byte*, JET_LOGINFO_A*, byte*, byte*, byte*, JET_PFNSTATUS);
int JetExternalRestore2W(ushort*, ushort*, JET_RSTMAP_W*, int, ushort*, JET_LOGINFO_W*, ushort*, ushort*, ushort*, JET_PFNSTATUS);
int JetRegisterCallback(JET_SESID, JET_TABLEID, uint, JET_CALLBACK, void*, JET_HANDLE*);
int JetUnregisterCallback(JET_SESID, JET_TABLEID, uint, JET_HANDLE);
int JetGetInstanceInfoA(uint*, JET_INSTANCE_INFO_A**);
int JetGetInstanceInfoW(uint*, JET_INSTANCE_INFO_W**);
int JetFreeBuffer(PSTR);
int JetSetLS(JET_SESID, JET_TABLEID, JET_LS, uint);
int JetGetLS(JET_SESID, JET_TABLEID, JET_LS*, uint);
int JetOSSnapshotPrepare(JET_OSSNAPID*, const(uint));
int JetOSSnapshotPrepareInstance(JET_OSSNAPID, JET_INSTANCE, const(uint));
int JetOSSnapshotFreezeA(const(JET_OSSNAPID), uint*, JET_INSTANCE_INFO_A**, const(uint));
int JetOSSnapshotFreezeW(const(JET_OSSNAPID), uint*, JET_INSTANCE_INFO_W**, const(uint));
int JetOSSnapshotThaw(const(JET_OSSNAPID), const(uint));
int JetOSSnapshotAbort(const(JET_OSSNAPID), const(uint));
int JetOSSnapshotTruncateLog(const(JET_OSSNAPID), const(uint));
int JetOSSnapshotTruncateLogInstance(const(JET_OSSNAPID), JET_INSTANCE, const(uint));
int JetOSSnapshotGetFreezeInfoA(const(JET_OSSNAPID), uint*, JET_INSTANCE_INFO_A**, const(uint));
int JetOSSnapshotGetFreezeInfoW(const(JET_OSSNAPID), uint*, JET_INSTANCE_INFO_W**, const(uint));
int JetOSSnapshotEnd(const(JET_OSSNAPID), const(uint));
int JetConfigureProcessForCrashDump(const(uint));
int JetGetErrorInfoW(void*, void*, uint, uint, uint);
int JetSetSessionParameter(JET_SESID, uint, void*, uint);
int JetGetSessionParameter(JET_SESID, uint, void*, uint, uint*);
enum JET_VERSION = 0x00000500;
enum JET_wszConfigStoreReadControl = "CsReadControl";
enum JET_bitConfigStoreReadControlInhibitRead = 0x00000001;
enum JET_bitConfigStoreReadControlDisableAll = 0x00000002;
enum JET_bitConfigStoreReadControlDefault = 0x00000000;
enum JET_wszConfigStoreRelPathSysParamDefault = "SysParamDefault";
enum JET_wszConfigStoreRelPathSysParamOverride = "SysParamOverride";
enum JET_bitDefragmentBatchStart = 0x00000001;
enum JET_bitDefragmentBatchStop = 0x00000002;
enum JET_bitDefragmentAvailSpaceTreesOnly = 0x00000040;
enum JET_bitDefragmentNoPartialMerges = 0x00000080;
enum JET_bitDefragmentBTree = 0x00000100;
enum JET_cbtypNull = 0x00000000;
enum JET_cbtypFinalize = 0x00000001;
enum JET_cbtypBeforeInsert = 0x00000002;
enum JET_cbtypAfterInsert = 0x00000004;
enum JET_cbtypBeforeReplace = 0x00000008;
enum JET_cbtypAfterReplace = 0x00000010;
enum JET_cbtypBeforeDelete = 0x00000020;
enum JET_cbtypAfterDelete = 0x00000040;
enum JET_cbtypUserDefinedDefaultValue = 0x00000080;
enum JET_cbtypOnlineDefragCompleted = 0x00000100;
enum JET_cbtypFreeCursorLS = 0x00000200;
enum JET_cbtypFreeTableLS = 0x00000400;
enum JET_bitTableInfoUpdatable = 0x00000001;
enum JET_bitTableInfoBookmark = 0x00000002;
enum JET_bitTableInfoRollback = 0x00000004;
enum JET_bitObjectSystem = 0x80000000;
enum JET_bitObjectTableFixedDDL = 0x40000000;
enum JET_bitObjectTableTemplate = 0x20000000;
enum JET_bitObjectTableDerived = 0x10000000;
enum JET_bitObjectTableNoFixedVarColumnsInDerivedTables = 0x04000000;
enum cObjectInfoCols = 0x00000009;
enum cColumnInfoCols = 0x0000000e;
enum cIndexInfoCols = 0x0000000f;
enum JET_MAX_COMPUTERNAME_LENGTH = 0x0000000f;
enum JET_bitDurableCommitCallbackLogUnavailable = 0x00000001;
enum JET_cbBookmarkMost = 0x00000100;
enum JET_cbNameMost = 0x00000040;
enum JET_cbFullNameMost = 0x000000ff;
enum JET_cbColumnLVPageOverhead = 0x00000052;
enum JET_cbLVDefaultValueMost = 0x000000ff;
enum JET_cbColumnMost = 0x000000ff;
enum JET_cbLVColumnMost = 0x7fffffff;
enum JET_cbKeyMost8KBytePage = 0x000007d0;
enum JET_cbKeyMost4KBytePage = 0x000003e8;
enum JET_cbKeyMost2KBytePage = 0x000001f4;
enum JET_cbKeyMostMin = 0x000000ff;
enum JET_cbKeyMost = 0x000000ff;
enum JET_cbLimitKeyMost = 0x00000100;
enum JET_cbPrimaryKeyMost = 0x000000ff;
enum JET_cbSecondaryKeyMost = 0x000000ff;
enum JET_ccolKeyMost = 0x00000010;
enum JET_ccolMost = 0x0000fee0;
enum JET_ccolFixedMost = 0x0000007f;
enum JET_ccolVarMost = 0x00000080;
enum JET_EventLoggingDisable = 0x00000000;
enum JET_EventLoggingLevelMin = 0x00000001;
enum JET_EventLoggingLevelLow = 0x00000019;
enum JET_EventLoggingLevelMedium = 0x00000032;
enum JET_EventLoggingLevelHigh = 0x0000004b;
enum JET_EventLoggingLevelMax = 0x00000064;
enum JET_IOPriorityNormal = 0x00000000;
enum JET_IOPriorityLow = 0x00000001;
enum JET_configDefault = 0x00000001;
enum JET_configRemoveQuotas = 0x00000002;
enum JET_configLowDiskFootprint = 0x00000004;
enum JET_configMediumDiskFootprint = 0x00000008;
enum JET_configLowMemory = 0x00000010;
enum JET_configDynamicMediumMemory = 0x00000020;
enum JET_configLowPower = 0x00000040;
enum JET_configSSDProfileIO = 0x00000080;
enum JET_configRunSilent = 0x00000100;
enum JET_configUnthrottledMemory = 0x00000200;
enum JET_configHighConcurrencyScaling = 0x00000400;
enum JET_paramSystemPath = 0x00000000;
enum JET_paramTempPath = 0x00000001;
enum JET_paramLogFilePath = 0x00000002;
enum JET_paramBaseName = 0x00000003;
enum JET_paramEventSource = 0x00000004;
enum JET_paramMaxSessions = 0x00000005;
enum JET_paramMaxOpenTables = 0x00000006;
enum JET_paramPreferredMaxOpenTables = 0x00000007;
enum JET_paramCachedClosedTables = 0x0000007d;
enum JET_paramMaxCursors = 0x00000008;
enum JET_paramMaxVerPages = 0x00000009;
enum JET_paramPreferredVerPages = 0x0000003f;
enum JET_paramGlobalMinVerPages = 0x00000051;
enum JET_paramVersionStoreTaskQueueMax = 0x00000069;
enum JET_paramMaxTemporaryTables = 0x0000000a;
enum JET_paramLogFileSize = 0x0000000b;
enum JET_paramLogBuffers = 0x0000000c;
enum JET_paramWaitLogFlush = 0x0000000d;
enum JET_paramLogCheckpointPeriod = 0x0000000e;
enum JET_paramLogWaitingUserMax = 0x0000000f;
enum JET_paramCommitDefault = 0x00000010;
enum JET_paramCircularLog = 0x00000011;
enum JET_paramDbExtensionSize = 0x00000012;
enum JET_paramPageTempDBMin = 0x00000013;
enum JET_paramPageFragment = 0x00000014;
enum JET_paramEnableFileCache = 0x0000007e;
enum JET_paramVerPageSize = 0x00000080;
enum JET_paramConfiguration = 0x00000081;
enum JET_paramEnableAdvanced = 0x00000082;
enum JET_paramMaxColtyp = 0x00000083;
enum JET_paramBatchIOBufferMax = 0x00000016;
enum JET_paramCacheSize = 0x00000029;
enum JET_paramCacheSizeMin = 0x0000003c;
enum JET_paramCacheSizeMax = 0x00000017;
enum JET_paramCheckpointDepthMax = 0x00000018;
enum JET_paramLRUKCorrInterval = 0x00000019;
enum JET_paramLRUKHistoryMax = 0x0000001a;
enum JET_paramLRUKPolicy = 0x0000001b;
enum JET_paramLRUKTimeout = 0x0000001c;
enum JET_paramLRUKTrxCorrInterval = 0x0000001d;
enum JET_paramOutstandingIOMax = 0x0000001e;
enum JET_paramStartFlushThreshold = 0x0000001f;
enum JET_paramStopFlushThreshold = 0x00000020;
enum JET_paramEnableViewCache = 0x0000007f;
enum JET_paramCheckpointIOMax = 0x00000087;
enum JET_paramTableClass1Name = 0x00000089;
enum JET_paramTableClass2Name = 0x0000008a;
enum JET_paramTableClass3Name = 0x0000008b;
enum JET_paramTableClass4Name = 0x0000008c;
enum JET_paramTableClass5Name = 0x0000008d;
enum JET_paramTableClass6Name = 0x0000008e;
enum JET_paramTableClass7Name = 0x0000008f;
enum JET_paramTableClass8Name = 0x00000090;
enum JET_paramTableClass9Name = 0x00000091;
enum JET_paramTableClass10Name = 0x00000092;
enum JET_paramTableClass11Name = 0x00000093;
enum JET_paramTableClass12Name = 0x00000094;
enum JET_paramTableClass13Name = 0x00000095;
enum JET_paramTableClass14Name = 0x00000096;
enum JET_paramTableClass15Name = 0x00000097;
enum JET_paramIOPriority = 0x00000098;
enum JET_paramRecovery = 0x00000022;
enum JET_paramEnableOnlineDefrag = 0x00000023;
enum JET_paramCheckFormatWhenOpenFail = 0x0000002c;
enum JET_paramEnableTempTableVersioning = 0x0000002e;
enum JET_paramIgnoreLogVersion = 0x0000002f;
enum JET_paramDeleteOldLogs = 0x00000030;
enum JET_paramEventSourceKey = 0x00000031;
enum JET_paramNoInformationEvent = 0x00000032;
enum JET_paramEventLoggingLevel = 0x00000033;
enum JET_paramDeleteOutOfRangeLogs = 0x00000034;
enum JET_paramAccessDeniedRetryPeriod = 0x00000035;
enum JET_paramEnableIndexChecking = 0x0000002d;
enum JET_paramEnableIndexCleanup = 0x00000036;
enum JET_paramDatabasePageSize = 0x00000040;
enum JET_paramDisableCallbacks = 0x00000041;
enum JET_paramLogFileCreateAsynch = 0x00000045;
enum JET_paramErrorToString = 0x00000046;
enum JET_paramZeroDatabaseDuringBackup = 0x00000047;
enum JET_paramUnicodeIndexDefault = 0x00000048;
enum JET_paramRuntimeCallback = 0x00000049;
enum JET_paramCleanupMismatchedLogFiles = 0x0000004d;
enum JET_paramRecordUpgradeDirtyLevel = 0x0000004e;
enum JET_paramOSSnapshotTimeout = 0x00000052;
enum JET_paramExceptionAction = 0x00000062;
enum JET_paramEventLogCache = 0x00000063;
enum JET_paramCreatePathIfNotExist = 0x00000064;
enum JET_paramPageHintCacheSize = 0x00000065;
enum JET_paramOneDatabasePerSession = 0x00000066;
enum JET_paramMaxInstances = 0x00000068;
enum JET_paramDisablePerfmon = 0x0000006b;
enum JET_paramIndexTuplesLengthMin = 0x0000006e;
enum JET_paramIndexTuplesLengthMax = 0x0000006f;
enum JET_paramIndexTuplesToIndexMax = 0x00000070;
enum JET_paramAlternateDatabaseRecoveryPath = 0x00000071;
enum JET_paramIndexTupleIncrement = 0x00000084;
enum JET_paramIndexTupleStart = 0x00000085;
enum JET_paramKeyMost = 0x00000086;
enum JET_paramLegacyFileNames = 0x00000088;
enum JET_paramEnablePersistedCallbacks = 0x0000009c;
enum JET_paramWaypointLatency = 0x00000099;
enum JET_paramDefragmentSequentialBTrees = 0x000000a0;
enum JET_paramDefragmentSequentialBTreesDensityCheckFrequency = 0x000000a1;
enum JET_paramIOThrottlingTimeQuanta = 0x000000a2;
enum JET_paramLVChunkSizeMost = 0x000000a3;
enum JET_paramMaxCoalesceReadSize = 0x000000a4;
enum JET_paramMaxCoalesceWriteSize = 0x000000a5;
enum JET_paramMaxCoalesceReadGapSize = 0x000000a6;
enum JET_paramMaxCoalesceWriteGapSize = 0x000000a7;
enum JET_paramEnableDBScanInRecovery = 0x000000a9;
enum JET_paramDbScanThrottle = 0x000000aa;
enum JET_paramDbScanIntervalMinSec = 0x000000ab;
enum JET_paramDbScanIntervalMaxSec = 0x000000ac;
enum JET_paramCachePriority = 0x000000b1;
enum JET_paramMaxTransactionSize = 0x000000b2;
enum JET_paramPrereadIOMax = 0x000000b3;
enum JET_paramEnableDBScanSerialization = 0x000000b4;
enum JET_paramHungIOThreshold = 0x000000b5;
enum JET_paramHungIOActions = 0x000000b6;
enum JET_paramMinDataForXpress = 0x000000b7;
enum JET_paramEnableShrinkDatabase = 0x000000b8;
enum JET_paramProcessFriendlyName = 0x000000ba;
enum JET_paramDurableCommitCallback = 0x000000bb;
enum JET_paramEnableSqm = 0x000000bc;
enum JET_paramConfigStoreSpec = 0x000000bd;
enum JET_paramUseFlushForWriteDurability = 0x000000d6;
enum JET_paramEnableRBS = 0x000000d7;
enum JET_paramRBSFilePath = 0x000000d8;
enum JET_paramMaxValueInvalid = 0x000000d9;
enum JET_sesparamCommitDefault = 0x00001001;
enum JET_sesparamTransactionLevel = 0x00001003;
enum JET_sesparamOperationContext = 0x00001004;
enum JET_sesparamCorrelationID = 0x00001005;
enum JET_sesparamMaxValueInvalid = 0x0000100e;
enum JET_bitESE98FileNames = 0x00000001;
enum JET_bitEightDotThreeSoftCompat = 0x00000002;
enum JET_bitHungIOEvent = 0x00000001;
enum JET_bitShrinkDatabaseOff = 0x00000000;
enum JET_bitShrinkDatabaseOn = 0x00000001;
enum JET_bitShrinkDatabaseRealtime = 0x00000002;
enum JET_bitShrinkDatabaseTrim = 0x00000001;
enum JET_bitReplayIgnoreMissingDB = 0x00000004;
enum JET_bitRecoveryWithoutUndo = 0x00000008;
enum JET_bitTruncateLogsAfterRecovery = 0x00000010;
enum JET_bitReplayMissingMapEntryDB = 0x00000020;
enum JET_bitLogStreamMustExist = 0x00000040;
enum JET_bitReplayIgnoreLostLogs = 0x00000080;
enum JET_bitKeepDbAttachedAtEndOfRecovery = 0x00001000;
enum JET_bitTermComplete = 0x00000001;
enum JET_bitTermAbrupt = 0x00000002;
enum JET_bitTermStopBackup = 0x00000004;
enum JET_bitTermDirty = 0x00000008;
enum JET_bitIdleFlushBuffers = 0x00000001;
enum JET_bitIdleCompact = 0x00000002;
enum JET_bitIdleStatus = 0x00000004;
enum JET_bitDbReadOnly = 0x00000001;
enum JET_bitDbExclusive = 0x00000002;
enum JET_bitDbDeleteCorruptIndexes = 0x00000010;
enum JET_bitDbDeleteUnicodeIndexes = 0x00000400;
enum JET_bitDbUpgrade = 0x00000200;
enum JET_bitDbEnableBackgroundMaintenance = 0x00000800;
enum JET_bitDbPurgeCacheOnAttach = 0x00001000;
enum JET_bitForceDetach = 0x00000001;
enum JET_bitDbRecoveryOff = 0x00000008;
enum JET_bitDbShadowingOff = 0x00000080;
enum JET_bitDbOverwriteExisting = 0x00000200;
enum JET_bitBackupIncremental = 0x00000001;
enum JET_bitBackupAtomic = 0x00000004;
enum JET_bitBackupSnapshot = 0x00000010;
enum JET_bitBackupEndNormal = 0x00000001;
enum JET_bitBackupEndAbort = 0x00000002;
enum JET_bitBackupTruncateDone = 0x00000100;
enum JET_bitTableCreateFixedDDL = 0x00000001;
enum JET_bitTableCreateTemplateTable = 0x00000002;
enum JET_bitTableCreateNoFixedVarColumnsInDerivedTables = 0x00000004;
enum JET_bitTableCreateImmutableStructure = 0x00000008;
enum JET_bitColumnFixed = 0x00000001;
enum JET_bitColumnTagged = 0x00000002;
enum JET_bitColumnNotNULL = 0x00000004;
enum JET_bitColumnVersion = 0x00000008;
enum JET_bitColumnAutoincrement = 0x00000010;
enum JET_bitColumnUpdatable = 0x00000020;
enum JET_bitColumnTTKey = 0x00000040;
enum JET_bitColumnTTDescending = 0x00000080;
enum JET_bitColumnMultiValued = 0x00000400;
enum JET_bitColumnEscrowUpdate = 0x00000800;
enum JET_bitColumnUnversioned = 0x00001000;
enum JET_bitColumnMaybeNull = 0x00002000;
enum JET_bitColumnFinalize = 0x00004000;
enum JET_bitColumnUserDefinedDefault = 0x00008000;
enum JET_bitColumnDeleteOnZero = 0x00020000;
enum JET_bitColumnCompressed = 0x00080000;
enum JET_bitDeleteColumnIgnoreTemplateColumns = 0x00000001;
enum JET_bitMoveFirst = 0x00000000;
enum JET_bitNoMove = 0x00000002;
enum JET_bitNewKey = 0x00000001;
enum JET_bitStrLimit = 0x00000002;
enum JET_bitSubStrLimit = 0x00000004;
enum JET_bitNormalizedKey = 0x00000008;
enum JET_bitKeyDataZeroLength = 0x00000010;
enum JET_bitFullColumnStartLimit = 0x00000100;
enum JET_bitFullColumnEndLimit = 0x00000200;
enum JET_bitPartialColumnStartLimit = 0x00000400;
enum JET_bitPartialColumnEndLimit = 0x00000800;
enum JET_bitRangeInclusive = 0x00000001;
enum JET_bitRangeUpperLimit = 0x00000002;
enum JET_bitRangeInstantDuration = 0x00000004;
enum JET_bitRangeRemove = 0x00000008;
enum JET_bitReadLock = 0x00000001;
enum JET_bitWriteLock = 0x00000002;
enum JET_MoveFirst = 0x80000000;
enum JET_MovePrevious = 0xffffffffffffffff;
enum JET_MoveLast = 0x7fffffff;
enum JET_bitMoveKeyNE = 0x00000001;
enum JET_bitSeekEQ = 0x00000001;
enum JET_bitSeekLT = 0x00000002;
enum JET_bitSeekLE = 0x00000004;
enum JET_bitSeekGE = 0x00000008;
enum JET_bitSeekGT = 0x00000010;
enum JET_bitSetIndexRange = 0x00000020;
enum JET_bitCheckUniqueness = 0x00000040;
enum JET_bitBookmarkPermitVirtualCurrency = 0x00000001;
enum JET_bitIndexColumnMustBeNull = 0x00000001;
enum JET_bitIndexColumnMustBeNonNull = 0x00000002;
enum JET_bitRecordInIndex = 0x00000001;
enum JET_bitRecordNotInIndex = 0x00000002;
enum JET_bitIndexUnique = 0x00000001;
enum JET_bitIndexPrimary = 0x00000002;
enum JET_bitIndexDisallowNull = 0x00000004;
enum JET_bitIndexIgnoreNull = 0x00000008;
enum JET_bitIndexIgnoreAnyNull = 0x00000020;
enum JET_bitIndexIgnoreFirstNull = 0x00000040;
enum JET_bitIndexLazyFlush = 0x00000080;
enum JET_bitIndexEmpty = 0x00000100;
enum JET_bitIndexUnversioned = 0x00000200;
enum JET_bitIndexSortNullsHigh = 0x00000400;
enum JET_bitIndexUnicode = 0x00000800;
enum JET_bitIndexTuples = 0x00001000;
enum JET_bitIndexTupleLimits = 0x00002000;
enum JET_bitIndexCrossProduct = 0x00004000;
enum JET_bitIndexKeyMost = 0x00008000;
enum JET_bitIndexDisallowTruncation = 0x00010000;
enum JET_bitIndexNestedTable = 0x00020000;
enum JET_bitIndexDotNetGuid = 0x00040000;
enum JET_bitIndexImmutableStructure = 0x00080000;
enum JET_bitKeyAscending = 0x00000000;
enum JET_bitKeyDescending = 0x00000001;
enum JET_bitTableDenyWrite = 0x00000001;
enum JET_bitTableDenyRead = 0x00000002;
enum JET_bitTableReadOnly = 0x00000004;
enum JET_bitTableUpdatable = 0x00000008;
enum JET_bitTablePermitDDL = 0x00000010;
enum JET_bitTableNoCache = 0x00000020;
enum JET_bitTablePreread = 0x00000040;
enum JET_bitTableOpportuneRead = 0x00000080;
enum JET_bitTableSequential = 0x00008000;
enum JET_bitTableClassMask = 0x001f0000;
enum JET_bitTableClassNone = 0x00000000;
enum JET_bitTableClass1 = 0x00010000;
enum JET_bitTableClass2 = 0x00020000;
enum JET_bitTableClass3 = 0x00030000;
enum JET_bitTableClass4 = 0x00040000;
enum JET_bitTableClass5 = 0x00050000;
enum JET_bitTableClass6 = 0x00060000;
enum JET_bitTableClass7 = 0x00070000;
enum JET_bitTableClass8 = 0x00080000;
enum JET_bitTableClass9 = 0x00090000;
enum JET_bitTableClass10 = 0x000a0000;
enum JET_bitTableClass11 = 0x000b0000;
enum JET_bitTableClass12 = 0x000c0000;
enum JET_bitTableClass13 = 0x000d0000;
enum JET_bitTableClass14 = 0x000e0000;
enum JET_bitTableClass15 = 0x000f0000;
enum JET_bitLSReset = 0x00000001;
enum JET_bitLSCursor = 0x00000002;
enum JET_bitLSTable = 0x00000004;
enum JET_bitPrereadForward = 0x00000001;
enum JET_bitPrereadBackward = 0x00000002;
enum JET_bitPrereadFirstPage = 0x00000004;
enum JET_bitPrereadNormalizedKey = 0x00000008;
enum JET_bitTTIndexed = 0x00000001;
enum JET_bitTTUnique = 0x00000002;
enum JET_bitTTUpdatable = 0x00000004;
enum JET_bitTTScrollable = 0x00000008;
enum JET_bitTTSortNullsHigh = 0x00000010;
enum JET_bitTTForceMaterialization = 0x00000020;
enum JET_bitTTErrorOnDuplicateInsertion = 0x00000020;
enum JET_bitTTForwardOnly = 0x00000040;
enum JET_bitTTIntrinsicLVsOnly = 0x00000080;
enum JET_bitTTDotNetGuid = 0x00000100;
enum JET_bitSetAppendLV = 0x00000001;
enum JET_bitSetOverwriteLV = 0x00000004;
enum JET_bitSetSizeLV = 0x00000008;
enum JET_bitSetZeroLength = 0x00000020;
enum JET_bitSetSeparateLV = 0x00000040;
enum JET_bitSetUniqueMultiValues = 0x00000080;
enum JET_bitSetUniqueNormalizedMultiValues = 0x00000100;
enum JET_bitSetRevertToDefaultValue = 0x00000200;
enum JET_bitSetIntrinsicLV = 0x00000400;
enum JET_bitSetUncompressed = 0x00010000;
enum JET_bitSetCompressed = 0x00020000;
enum JET_bitSetContiguousLV = 0x00040000;
enum JET_bitSpaceHintsUtilizeParentSpace = 0x00000001;
enum JET_bitCreateHintAppendSequential = 0x00000002;
enum JET_bitCreateHintHotpointSequential = 0x00000004;
enum JET_bitRetrieveHintReserve1 = 0x00000008;
enum JET_bitRetrieveHintTableScanForward = 0x00000010;
enum JET_bitRetrieveHintTableScanBackward = 0x00000020;
enum JET_bitRetrieveHintReserve2 = 0x00000040;
enum JET_bitRetrieveHintReserve3 = 0x00000080;
enum JET_bitDeleteHintTableSequential = 0x00000100;
enum JET_prepInsert = 0x00000000;
enum JET_prepReplace = 0x00000002;
enum JET_prepCancel = 0x00000003;
enum JET_prepReplaceNoLock = 0x00000004;
enum JET_prepInsertCopy = 0x00000005;
enum JET_prepInsertCopyDeleteOriginal = 0x00000007;
enum JET_prepInsertCopyReplaceOriginal = 0x00000009;
enum JET_sqmDisable = 0x00000000;
enum JET_sqmEnable = 0x00000001;
enum JET_sqmFromCEIP = 0x00000002;
enum JET_bitUpdateCheckESE97Compatibility = 0x00000001;
enum JET_bitEscrowNoRollback = 0x00000001;
enum JET_bitRetrieveCopy = 0x00000001;
enum JET_bitRetrieveFromIndex = 0x00000002;
enum JET_bitRetrieveFromPrimaryBookmark = 0x00000004;
enum JET_bitRetrieveTag = 0x00000008;
enum JET_bitRetrieveNull = 0x00000010;
enum JET_bitRetrieveIgnoreDefault = 0x00000020;
enum JET_bitRetrieveTuple = 0x00000800;
enum JET_bitZeroLength = 0x00000001;
enum JET_bitEnumerateCopy = 0x00000001;
enum JET_bitEnumerateIgnoreDefault = 0x00000020;
enum JET_bitEnumeratePresenceOnly = 0x00020000;
enum JET_bitEnumerateTaggedOnly = 0x00040000;
enum JET_bitEnumerateCompressOutput = 0x00080000;
enum JET_bitEnumerateIgnoreUserDefinedDefault = 0x00100000;
enum JET_bitEnumerateInRecordOnly = 0x00200000;
enum JET_bitRecordSizeInCopyBuffer = 0x00000001;
enum JET_bitRecordSizeRunningTotal = 0x00000002;
enum JET_bitRecordSizeLocal = 0x00000004;
enum JET_bitTransactionReadOnly = 0x00000001;
enum JET_bitCommitLazyFlush = 0x00000001;
enum JET_bitWaitLastLevel0Commit = 0x00000002;
enum JET_bitWaitAllLevel0Commit = 0x00000008;
enum JET_bitForceNewLog = 0x00000010;
enum JET_bitRollbackAll = 0x00000001;
enum JET_bitIncrementalSnapshot = 0x00000001;
enum JET_bitCopySnapshot = 0x00000002;
enum JET_bitContinueAfterThaw = 0x00000004;
enum JET_bitExplicitPrepare = 0x00000008;
enum JET_bitAllDatabasesSnapshot = 0x00000001;
enum JET_bitAbortSnapshot = 0x00000001;
enum JET_DbInfoFilename = 0x00000000;
enum JET_DbInfoConnect = 0x00000001;
enum JET_DbInfoCountry = 0x00000002;
enum JET_DbInfoLCID = 0x00000003;
enum JET_DbInfoLangid = 0x00000003;
enum JET_DbInfoCp = 0x00000004;
enum JET_DbInfoCollate = 0x00000005;
enum JET_DbInfoOptions = 0x00000006;
enum JET_DbInfoTransactions = 0x00000007;
enum JET_DbInfoVersion = 0x00000008;
enum JET_DbInfoIsam = 0x00000009;
enum JET_DbInfoFilesize = 0x0000000a;
enum JET_DbInfoSpaceOwned = 0x0000000b;
enum JET_DbInfoSpaceAvailable = 0x0000000c;
enum JET_DbInfoUpgrade = 0x0000000d;
enum JET_DbInfoMisc = 0x0000000e;
enum JET_DbInfoDBInUse = 0x0000000f;
enum JET_DbInfoPageSize = 0x00000011;
enum JET_DbInfoFileType = 0x00000013;
enum JET_DbInfoFilesizeOnDisk = 0x00000015;
enum JET_dbstateJustCreated = 0x00000001;
enum JET_dbstateDirtyShutdown = 0x00000002;
enum JET_dbstateCleanShutdown = 0x00000003;
enum JET_dbstateBeingConverted = 0x00000004;
enum JET_dbstateForceDetach = 0x00000005;
enum JET_filetypeUnknown = 0x00000000;
enum JET_filetypeDatabase = 0x00000001;
enum JET_filetypeLog = 0x00000003;
enum JET_filetypeCheckpoint = 0x00000004;
enum JET_filetypeTempDatabase = 0x00000005;
enum JET_filetypeFlushMap = 0x00000007;
enum JET_revertstateNone = 0x00000000;
enum JET_revertstateInProgress = 0x00000001;
enum JET_revertstateCopingLogs = 0x00000002;
enum JET_revertstateCompleted = 0x00000003;
enum JET_bitDeleteAllExistingLogs = 0x00000001;
enum JET_coltypNil = 0x00000000;
enum JET_coltypBit = 0x00000001;
enum JET_coltypUnsignedByte = 0x00000002;
enum JET_coltypShort = 0x00000003;
enum JET_coltypLong = 0x00000004;
enum JET_coltypCurrency = 0x00000005;
enum JET_coltypIEEESingle = 0x00000006;
enum JET_coltypIEEEDouble = 0x00000007;
enum JET_coltypDateTime = 0x00000008;
enum JET_coltypBinary = 0x00000009;
enum JET_coltypText = 0x0000000a;
enum JET_coltypLongBinary = 0x0000000b;
enum JET_coltypLongText = 0x0000000c;
enum JET_coltypMax = 0x0000000d;
enum JET_coltypSLV = 0x0000000d;
enum JET_coltypUnsignedLong = 0x0000000e;
enum JET_coltypLongLong = 0x0000000f;
enum JET_coltypGUID = 0x00000010;
enum JET_coltypUnsignedShort = 0x00000011;
enum JET_coltypUnsignedLongLong = 0x00000012;
enum JET_ColInfoGrbitNonDerivedColumnsOnly = 0x80000000;
enum JET_ColInfoGrbitMinimalInfo = 0x40000000;
enum JET_ColInfoGrbitSortByColumnid = 0x20000000;
enum JET_objtypNil = 0x00000000;
enum JET_objtypTable = 0x00000001;
enum JET_bitCompactStats = 0x00000020;
enum JET_bitCompactRepair = 0x00000040;
enum JET_snpRepair = 0x00000002;
enum JET_snpCompact = 0x00000004;
enum JET_snpRestore = 0x00000008;
enum JET_snpBackup = 0x00000009;
enum JET_snpUpgrade = 0x0000000a;
enum JET_snpScrub = 0x0000000b;
enum JET_snpUpgradeRecordFormat = 0x0000000c;
enum JET_sntBegin = 0x00000005;
enum JET_sntRequirements = 0x00000007;
enum JET_sntProgress = 0x00000000;
enum JET_sntComplete = 0x00000006;
enum JET_sntFail = 0x00000003;
enum JET_ExceptionMsgBox = 0x00000001;
enum JET_ExceptionNone = 0x00000002;
enum JET_ExceptionFailFast = 0x00000004;
enum JET_OnlineDefragDisable = 0x00000000;
enum JET_OnlineDefragAllOBSOLETE = 0x00000001;
enum JET_OnlineDefragDatabases = 0x00000002;
enum JET_OnlineDefragSpaceTrees = 0x00000004;
enum JET_OnlineDefragAll = 0x0000ffff;
enum JET_bitResizeDatabaseOnlyGrow = 0x00000001;
enum JET_bitResizeDatabaseOnlyShrink = 0x00000002;
enum JET_bitStopServiceAll = 0x00000000;
enum JET_bitStopServiceBackgroundUserTasks = 0x00000002;
enum JET_bitStopServiceQuiesceCaches = 0x00000004;
enum JET_bitStopServiceResume = 0x80000000;
enum JET_errSuccess = 0x00000000;
enum JET_wrnNyi = 0xffffffffffffffff;
enum JET_errRfsFailure = 0xffffffffffffff9c;
enum JET_errRfsNotArmed = 0xffffffffffffff9b;
enum JET_errFileClose = 0xffffffffffffff9a;
enum JET_errOutOfThreads = 0xffffffffffffff99;
enum JET_errTooManyIO = 0xffffffffffffff97;
enum JET_errTaskDropped = 0xffffffffffffff96;
enum JET_errInternalError = 0xffffffffffffff95;
enum JET_errDisabledFunctionality = 0xffffffffffffff90;
enum JET_errUnloadableOSFunctionality = 0xffffffffffffff8f;
enum JET_errDatabaseBufferDependenciesCorrupted = 0xffffffffffffff01;
enum JET_wrnRemainingVersions = 0x00000141;
enum JET_errPreviousVersion = 0xfffffffffffffebe;
enum JET_errPageBoundary = 0xfffffffffffffebd;
enum JET_errKeyBoundary = 0xfffffffffffffebc;
enum JET_errBadPageLink = 0xfffffffffffffeb9;
enum JET_errBadBookmark = 0xfffffffffffffeb8;
enum JET_errNTSystemCallFailed = 0xfffffffffffffeb2;
enum JET_errBadParentPageLink = 0xfffffffffffffeae;
enum JET_errSPAvailExtCacheOutOfSync = 0xfffffffffffffeac;
enum JET_errSPAvailExtCorrupted = 0xfffffffffffffeab;
enum JET_errSPAvailExtCacheOutOfMemory = 0xfffffffffffffeaa;
enum JET_errSPOwnExtCorrupted = 0xfffffffffffffea9;
enum JET_errDbTimeCorrupted = 0xfffffffffffffea8;
enum JET_wrnUniqueKey = 0x00000159;
enum JET_errKeyTruncated = 0xfffffffffffffea6;
enum JET_errDatabaseLeakInSpace = 0xfffffffffffffea4;
enum JET_errBadEmptyPage = 0xfffffffffffffea1;
enum wrnBTNotVisibleRejected = 0x00000160;
enum wrnBTNotVisibleAccumulated = 0x00000161;
enum JET_errBadLineCount = 0xfffffffffffffe9e;
enum JET_errPageTagCorrupted = 0xfffffffffffffe9b;
enum JET_errNodeCorrupted = 0xfffffffffffffe9a;
enum JET_wrnSeparateLongValue = 0x00000196;
enum JET_errKeyTooBig = 0xfffffffffffffe68;
enum JET_errCannotSeparateIntrinsicLV = 0xfffffffffffffe60;
enum JET_errSeparatedLongValue = 0xfffffffffffffe5b;
enum JET_errMustBeSeparateLongValue = 0xfffffffffffffe59;
enum JET_errInvalidPreread = 0xfffffffffffffe58;
enum JET_errInvalidLoggedOperation = 0xfffffffffffffe0c;
enum JET_errLogFileCorrupt = 0xfffffffffffffe0b;
enum JET_errNoBackupDirectory = 0xfffffffffffffe09;
enum JET_errBackupDirectoryNotEmpty = 0xfffffffffffffe08;
enum JET_errBackupInProgress = 0xfffffffffffffe07;
enum JET_errRestoreInProgress = 0xfffffffffffffe06;
enum JET_errMissingPreviousLogFile = 0xfffffffffffffe03;
enum JET_errLogWriteFail = 0xfffffffffffffe02;
enum JET_errLogDisabledDueToRecoveryFailure = 0xfffffffffffffe01;
enum JET_errCannotLogDuringRecoveryRedo = 0xfffffffffffffe00;
enum JET_errLogGenerationMismatch = 0xfffffffffffffdff;
enum JET_errBadLogVersion = 0xfffffffffffffdfe;
enum JET_errInvalidLogSequence = 0xfffffffffffffdfd;
enum JET_errLoggingDisabled = 0xfffffffffffffdfc;
enum JET_errLogBufferTooSmall = 0xfffffffffffffdfb;
enum JET_errLogSequenceEnd = 0xfffffffffffffdf9;
enum JET_errNoBackup = 0xfffffffffffffdf8;
enum JET_errInvalidBackupSequence = 0xfffffffffffffdf7;
enum JET_errBackupNotAllowedYet = 0xfffffffffffffdf5;
enum JET_errDeleteBackupFileFail = 0xfffffffffffffdf4;
enum JET_errMakeBackupDirectoryFail = 0xfffffffffffffdf3;
enum JET_errInvalidBackup = 0xfffffffffffffdf2;
enum JET_errRecoveredWithErrors = 0xfffffffffffffdf1;
enum JET_errMissingLogFile = 0xfffffffffffffdf0;
enum JET_errLogDiskFull = 0xfffffffffffffdef;
enum JET_errBadLogSignature = 0xfffffffffffffdee;
enum JET_errBadDbSignature = 0xfffffffffffffded;
enum JET_errBadCheckpointSignature = 0xfffffffffffffdec;
enum JET_errCheckpointCorrupt = 0xfffffffffffffdeb;
enum JET_errMissingPatchPage = 0xfffffffffffffdea;
enum JET_errBadPatchPage = 0xfffffffffffffde9;
enum JET_errRedoAbruptEnded = 0xfffffffffffffde8;
enum JET_errPatchFileMissing = 0xfffffffffffffde6;
enum JET_errDatabaseLogSetMismatch = 0xfffffffffffffde5;
enum JET_errDatabaseStreamingFileMismatch = 0xfffffffffffffde4;
enum JET_errLogFileSizeMismatch = 0xfffffffffffffde3;
enum JET_errCheckpointFileNotFound = 0xfffffffffffffde2;
enum JET_errRequiredLogFilesMissing = 0xfffffffffffffde1;
enum JET_errSoftRecoveryOnBackupDatabase = 0xfffffffffffffde0;
enum JET_errLogFileSizeMismatchDatabasesConsistent = 0xfffffffffffffddf;
enum JET_errLogSectorSizeMismatch = 0xfffffffffffffdde;
enum JET_errLogSectorSizeMismatchDatabasesConsistent = 0xfffffffffffffddd;
enum JET_errLogSequenceEndDatabasesConsistent = 0xfffffffffffffddc;
enum JET_errStreamingDataNotLogged = 0xfffffffffffffddb;
enum JET_errDatabaseDirtyShutdown = 0xfffffffffffffdda;
enum JET_errDatabaseInconsistent = 0xfffffffffffffdda;
enum JET_errConsistentTimeMismatch = 0xfffffffffffffdd9;
enum JET_errDatabasePatchFileMismatch = 0xfffffffffffffdd8;
enum JET_errEndingRestoreLogTooLow = 0xfffffffffffffdd7;
enum JET_errStartingRestoreLogTooHigh = 0xfffffffffffffdd6;
enum JET_errGivenLogFileHasBadSignature = 0xfffffffffffffdd5;
enum JET_errGivenLogFileIsNotContiguous = 0xfffffffffffffdd4;
enum JET_errMissingRestoreLogFiles = 0xfffffffffffffdd3;
enum JET_wrnExistingLogFileHasBadSignature = 0x0000022e;
enum JET_wrnExistingLogFileIsNotContiguous = 0x0000022f;
enum JET_errMissingFullBackup = 0xfffffffffffffdd0;
enum JET_errBadBackupDatabaseSize = 0xfffffffffffffdcf;
enum JET_errDatabaseAlreadyUpgraded = 0xfffffffffffffdce;
enum JET_errDatabaseIncompleteUpgrade = 0xfffffffffffffdcd;
enum JET_wrnSkipThisRecord = 0x00000234;
enum JET_errMissingCurrentLogFiles = 0xfffffffffffffdcb;
enum JET_errDbTimeTooOld = 0xfffffffffffffdca;
enum JET_errDbTimeTooNew = 0xfffffffffffffdc9;
enum JET_errMissingFileToBackup = 0xfffffffffffffdc7;
enum JET_errLogTornWriteDuringHardRestore = 0xfffffffffffffdc6;
enum JET_errLogTornWriteDuringHardRecovery = 0xfffffffffffffdc5;
enum JET_errLogCorruptDuringHardRestore = 0xfffffffffffffdc3;
enum JET_errLogCorruptDuringHardRecovery = 0xfffffffffffffdc2;
enum JET_errMustDisableLoggingForDbUpgrade = 0xfffffffffffffdc1;
enum JET_errBadRestoreTargetInstance = 0xfffffffffffffdbf;
enum JET_wrnTargetInstanceRunning = 0x00000242;
enum JET_errRecoveredWithoutUndo = 0xfffffffffffffdbd;
enum JET_errDatabasesNotFromSameSnapshot = 0xfffffffffffffdbc;
enum JET_errSoftRecoveryOnSnapshot = 0xfffffffffffffdbb;
enum JET_errCommittedLogFilesMissing = 0xfffffffffffffdba;
enum JET_errSectorSizeNotSupported = 0xfffffffffffffdb9;
enum JET_errRecoveredWithoutUndoDatabasesConsistent = 0xfffffffffffffdb8;
enum JET_wrnCommittedLogFilesLost = 0x00000249;
enum JET_errCommittedLogFileCorrupt = 0xfffffffffffffdb6;
enum JET_wrnCommittedLogFilesRemoved = 0x0000024b;
enum JET_wrnFinishWithUndo = 0x0000024c;
enum JET_errLogSequenceChecksumMismatch = 0xfffffffffffffdb2;
enum JET_wrnDatabaseRepaired = 0x00000253;
enum JET_errPageInitializedMismatch = 0xfffffffffffffdac;
enum JET_errUnicodeTranslationBufferTooSmall = 0xfffffffffffffda7;
enum JET_errUnicodeTranslationFail = 0xfffffffffffffda6;
enum JET_errUnicodeNormalizationNotSupported = 0xfffffffffffffda5;
enum JET_errUnicodeLanguageValidationFailure = 0xfffffffffffffda4;
enum JET_errExistingLogFileHasBadSignature = 0xfffffffffffffd9e;
enum JET_errExistingLogFileIsNotContiguous = 0xfffffffffffffd9d;
enum JET_errLogReadVerifyFailure = 0xfffffffffffffd9c;
enum JET_errCheckpointDepthTooDeep = 0xfffffffffffffd9a;
enum JET_errRestoreOfNonBackupDatabase = 0xfffffffffffffd99;
enum JET_errLogFileNotCopied = 0xfffffffffffffd98;
enum JET_errTransactionTooLong = 0xfffffffffffffd96;
enum JET_errEngineFormatVersionNoLongerSupportedTooLow = 0xfffffffffffffd95;
enum JET_errEngineFormatVersionNotYetImplementedTooHigh = 0xfffffffffffffd94;
enum JET_errEngineFormatVersionParamTooLowForRequestedFeature = 0xfffffffffffffd93;
enum JET_errEngineFormatVersionSpecifiedTooLowForLogVersion = 0xfffffffffffffd92;
enum JET_errEngineFormatVersionSpecifiedTooLowForDatabaseVersion = 0xfffffffffffffd91;
enum JET_errBackupAbortByServer = 0xfffffffffffffcdf;
enum JET_errInvalidGrbit = 0xfffffffffffffc7c;
enum JET_errTermInProgress = 0xfffffffffffffc18;
enum JET_errFeatureNotAvailable = 0xfffffffffffffc17;
enum JET_errInvalidName = 0xfffffffffffffc16;
enum JET_errInvalidParameter = 0xfffffffffffffc15;
enum JET_wrnColumnNull = 0x000003ec;
enum JET_wrnBufferTruncated = 0x000003ee;
enum JET_wrnDatabaseAttached = 0x000003ef;
enum JET_errDatabaseFileReadOnly = 0xfffffffffffffc10;
enum JET_wrnSortOverflow = 0x000003f1;
enum JET_errInvalidDatabaseId = 0xfffffffffffffc0e;
enum JET_errOutOfMemory = 0xfffffffffffffc0d;
enum JET_errOutOfDatabaseSpace = 0xfffffffffffffc0c;
enum JET_errOutOfCursors = 0xfffffffffffffc0b;
enum JET_errOutOfBuffers = 0xfffffffffffffc0a;
enum JET_errTooManyIndexes = 0xfffffffffffffc09;
enum JET_errTooManyKeys = 0xfffffffffffffc08;
enum JET_errRecordDeleted = 0xfffffffffffffc07;
enum JET_errReadVerifyFailure = 0xfffffffffffffc06;
enum JET_errPageNotInitialized = 0xfffffffffffffc05;
enum JET_errOutOfFileHandles = 0xfffffffffffffc04;
enum JET_errDiskReadVerificationFailure = 0xfffffffffffffc03;
enum JET_errDiskIO = 0xfffffffffffffc02;
enum JET_errInvalidPath = 0xfffffffffffffc01;
enum JET_errInvalidSystemPath = 0xfffffffffffffc00;
enum JET_errInvalidLogDirectory = 0xfffffffffffffbff;
enum JET_errRecordTooBig = 0xfffffffffffffbfe;
enum JET_errTooManyOpenDatabases = 0xfffffffffffffbfd;
enum JET_errInvalidDatabase = 0xfffffffffffffbfc;
enum JET_errNotInitialized = 0xfffffffffffffbfb;
enum JET_errAlreadyInitialized = 0xfffffffffffffbfa;
enum JET_errInitInProgress = 0xfffffffffffffbf9;
enum JET_errFileAccessDenied = 0xfffffffffffffbf8;
enum JET_errBufferTooSmall = 0xfffffffffffffbf2;
enum JET_wrnSeekNotEqual = 0x0000040f;
enum JET_errTooManyColumns = 0xfffffffffffffbf0;
enum JET_errContainerNotEmpty = 0xfffffffffffffbed;
enum JET_errInvalidFilename = 0xfffffffffffffbec;
enum JET_errInvalidBookmark = 0xfffffffffffffbeb;
enum JET_errColumnInUse = 0xfffffffffffffbea;
enum JET_errInvalidBufferSize = 0xfffffffffffffbe9;
enum JET_errColumnNotUpdatable = 0xfffffffffffffbe8;
enum JET_errIndexInUse = 0xfffffffffffffbe5;
enum JET_errLinkNotSupported = 0xfffffffffffffbe4;
enum JET_errNullKeyDisallowed = 0xfffffffffffffbe3;
enum JET_errNotInTransaction = 0xfffffffffffffbe2;
enum JET_wrnNoErrorInfo = 0x0000041f;
enum JET_errMustRollback = 0xfffffffffffffbdf;
enum JET_wrnNoIdleActivity = 0x00000422;
enum JET_errTooManyActiveUsers = 0xfffffffffffffbdd;
enum JET_errInvalidCountry = 0xfffffffffffffbdb;
enum JET_errInvalidLanguageId = 0xfffffffffffffbda;
enum JET_errInvalidCodePage = 0xfffffffffffffbd9;
enum JET_errInvalidLCMapStringFlags = 0xfffffffffffffbd8;
enum JET_errVersionStoreEntryTooBig = 0xfffffffffffffbd7;
enum JET_errVersionStoreOutOfMemoryAndCleanupTimedOut = 0xfffffffffffffbd6;
enum JET_wrnNoWriteLock = 0x0000042b;
enum JET_wrnColumnSetNull = 0x0000042c;
enum JET_errVersionStoreOutOfMemory = 0xfffffffffffffbd3;
enum JET_errCannotIndex = 0xfffffffffffffbd1;
enum JET_errRecordNotDeleted = 0xfffffffffffffbd0;
enum JET_errTooManyMempoolEntries = 0xfffffffffffffbcf;
enum JET_errOutOfObjectIDs = 0xfffffffffffffbce;
enum JET_errOutOfLongValueIDs = 0xfffffffffffffbcd;
enum JET_errOutOfAutoincrementValues = 0xfffffffffffffbcc;
enum JET_errOutOfDbtimeValues = 0xfffffffffffffbcb;
enum JET_errOutOfSequentialIndexValues = 0xfffffffffffffbca;
enum JET_errRunningInOneInstanceMode = 0xfffffffffffffbc8;
enum JET_errRunningInMultiInstanceMode = 0xfffffffffffffbc7;
enum JET_errSystemParamsAlreadySet = 0xfffffffffffffbc6;
enum JET_errSystemPathInUse = 0xfffffffffffffbc5;
enum JET_errLogFilePathInUse = 0xfffffffffffffbc4;
enum JET_errTempPathInUse = 0xfffffffffffffbc3;
enum JET_errInstanceNameInUse = 0xfffffffffffffbc2;
enum JET_errSystemParameterConflict = 0xfffffffffffffbc1;
enum JET_errInstanceUnavailable = 0xfffffffffffffbbe;
enum JET_errDatabaseUnavailable = 0xfffffffffffffbbd;
enum JET_errInstanceUnavailableDueToFatalLogDiskFull = 0xfffffffffffffbbc;
enum JET_errInvalidSesparamId = 0xfffffffffffffbbb;
enum JET_errTooManyRecords = 0xfffffffffffffbba;
enum JET_errInvalidDbparamId = 0xfffffffffffffbb9;
enum JET_errOutOfSessions = 0xfffffffffffffbb3;
enum JET_errWriteConflict = 0xfffffffffffffbb2;
enum JET_errTransTooDeep = 0xfffffffffffffbb1;
enum JET_errInvalidSesid = 0xfffffffffffffbb0;
enum JET_errWriteConflictPrimaryIndex = 0xfffffffffffffbaf;
enum JET_errInTransaction = 0xfffffffffffffbac;
enum JET_errRollbackRequired = 0xfffffffffffffbab;
enum JET_errTransReadOnly = 0xfffffffffffffbaa;
enum JET_errSessionWriteConflict = 0xfffffffffffffba9;
enum JET_errRecordTooBigForBackwardCompatibility = 0xfffffffffffffba8;
enum JET_errCannotMaterializeForwardOnlySort = 0xfffffffffffffba7;
enum JET_errSesidTableIdMismatch = 0xfffffffffffffba6;
enum JET_errInvalidInstance = 0xfffffffffffffba5;
enum JET_errDirtyShutdown = 0xfffffffffffffba4;
enum JET_errReadPgnoVerifyFailure = 0xfffffffffffffba2;
enum JET_errReadLostFlushVerifyFailure = 0xfffffffffffffba1;
enum JET_errFileSystemCorruption = 0xfffffffffffffb9f;
enum JET_wrnShrinkNotPossible = 0x00000462;
enum JET_errRecoveryVerifyFailure = 0xfffffffffffffb9d;
enum JET_errFilteredMoveNotSupported = 0xfffffffffffffb9c;
enum JET_errDatabaseDuplicate = 0xfffffffffffffb4f;
enum JET_errDatabaseInUse = 0xfffffffffffffb4e;
enum JET_errDatabaseNotFound = 0xfffffffffffffb4d;
enum JET_errDatabaseInvalidName = 0xfffffffffffffb4c;
enum JET_errDatabaseInvalidPages = 0xfffffffffffffb4b;
enum JET_errDatabaseCorrupted = 0xfffffffffffffb4a;
enum JET_errDatabaseLocked = 0xfffffffffffffb49;
enum JET_errCannotDisableVersioning = 0xfffffffffffffb48;
enum JET_errInvalidDatabaseVersion = 0xfffffffffffffb47;
enum JET_errDatabase200Format = 0xfffffffffffffb46;
enum JET_errDatabase400Format = 0xfffffffffffffb45;
enum JET_errDatabase500Format = 0xfffffffffffffb44;
enum JET_errPageSizeMismatch = 0xfffffffffffffb43;
enum JET_errTooManyInstances = 0xfffffffffffffb42;
enum JET_errDatabaseSharingViolation = 0xfffffffffffffb41;
enum JET_errAttachedDatabaseMismatch = 0xfffffffffffffb40;
enum JET_errDatabaseInvalidPath = 0xfffffffffffffb3f;
enum JET_errDatabaseIdInUse = 0xfffffffffffffb3e;
enum JET_errForceDetachNotAllowed = 0xfffffffffffffb3d;
enum JET_errCatalogCorrupted = 0xfffffffffffffb3c;
enum JET_errPartiallyAttachedDB = 0xfffffffffffffb3b;
enum JET_errDatabaseSignInUse = 0xfffffffffffffb3a;
enum JET_errDatabaseCorruptedNoRepair = 0xfffffffffffffb38;
enum JET_errInvalidCreateDbVersion = 0xfffffffffffffb37;
enum JET_errDatabaseNotReady = 0xfffffffffffffb32;
enum JET_errDatabaseAttachedForRecovery = 0xfffffffffffffb31;
enum JET_errTransactionsNotReadyDuringRecovery = 0xfffffffffffffb30;
enum JET_wrnTableEmpty = 0x00000515;
enum JET_errTableLocked = 0xfffffffffffffaea;
enum JET_errTableDuplicate = 0xfffffffffffffae9;
enum JET_errTableInUse = 0xfffffffffffffae8;
enum JET_errObjectNotFound = 0xfffffffffffffae7;
enum JET_errDensityInvalid = 0xfffffffffffffae5;
enum JET_errTableNotEmpty = 0xfffffffffffffae4;
enum JET_errInvalidTableId = 0xfffffffffffffae2;
enum JET_errTooManyOpenTables = 0xfffffffffffffae1;
enum JET_errIllegalOperation = 0xfffffffffffffae0;
enum JET_errTooManyOpenTablesAndCleanupTimedOut = 0xfffffffffffffadf;
enum JET_errObjectDuplicate = 0xfffffffffffffade;
enum JET_errInvalidObject = 0xfffffffffffffadc;
enum JET_errCannotDeleteTempTable = 0xfffffffffffffadb;
enum JET_errCannotDeleteSystemTable = 0xfffffffffffffada;
enum JET_errCannotDeleteTemplateTable = 0xfffffffffffffad9;
enum JET_errExclusiveTableLockRequired = 0xfffffffffffffad6;
enum JET_errFixedDDL = 0xfffffffffffffad5;
enum JET_errFixedInheritedDDL = 0xfffffffffffffad4;
enum JET_errCannotNestDDL = 0xfffffffffffffad3;
enum JET_errDDLNotInheritable = 0xfffffffffffffad2;
enum JET_wrnTableInUseBySystem = 0x0000052f;
enum JET_errInvalidSettings = 0xfffffffffffffad0;
enum JET_errClientRequestToStopJetService = 0xfffffffffffffacf;
enum JET_errCannotAddFixedVarColumnToDerivedTable = 0xffffffffffffface;
enum JET_errIndexCantBuild = 0xfffffffffffffa87;
enum JET_errIndexHasPrimary = 0xfffffffffffffa86;
enum JET_errIndexDuplicate = 0xfffffffffffffa85;
enum JET_errIndexNotFound = 0xfffffffffffffa84;
enum JET_errIndexMustStay = 0xfffffffffffffa83;
enum JET_errIndexInvalidDef = 0xfffffffffffffa82;
enum JET_errInvalidCreateIndex = 0xfffffffffffffa7f;
enum JET_errTooManyOpenIndexes = 0xfffffffffffffa7e;
enum JET_errMultiValuedIndexViolation = 0xfffffffffffffa7d;
enum JET_errIndexBuildCorrupted = 0xfffffffffffffa7c;
enum JET_errPrimaryIndexCorrupted = 0xfffffffffffffa7b;
enum JET_errSecondaryIndexCorrupted = 0xfffffffffffffa7a;
enum JET_wrnCorruptIndexDeleted = 0x00000587;
enum JET_errInvalidIndexId = 0xfffffffffffffa78;
enum JET_wrnPrimaryIndexOutOfDate = 0x00000589;
enum JET_wrnSecondaryIndexOutOfDate = 0x0000058a;
enum JET_errIndexTuplesSecondaryIndexOnly = 0xfffffffffffffa6a;
enum JET_errIndexTuplesTooManyColumns = 0xfffffffffffffa69;
enum JET_errIndexTuplesOneColumnOnly = 0xfffffffffffffa69;
enum JET_errIndexTuplesNonUniqueOnly = 0xfffffffffffffa68;
enum JET_errIndexTuplesTextBinaryColumnsOnly = 0xfffffffffffffa67;
enum JET_errIndexTuplesTextColumnsOnly = 0xfffffffffffffa67;
enum JET_errIndexTuplesVarSegMacNotAllowed = 0xfffffffffffffa66;
enum JET_errIndexTuplesInvalidLimits = 0xfffffffffffffa65;
enum JET_errIndexTuplesCannotRetrieveFromIndex = 0xfffffffffffffa64;
enum JET_errIndexTuplesKeyTooSmall = 0xfffffffffffffa63;
enum JET_errInvalidLVChunkSize = 0xfffffffffffffa62;
enum JET_errColumnCannotBeEncrypted = 0xfffffffffffffa61;
enum JET_errCannotIndexOnEncryptedColumn = 0xfffffffffffffa60;
enum JET_errColumnLong = 0xfffffffffffffa23;
enum JET_errColumnNoChunk = 0xfffffffffffffa22;
enum JET_errColumnDoesNotFit = 0xfffffffffffffa21;
enum JET_errNullInvalid = 0xfffffffffffffa20;
enum JET_errColumnIndexed = 0xfffffffffffffa1f;
enum JET_errColumnTooBig = 0xfffffffffffffa1e;
enum JET_errColumnNotFound = 0xfffffffffffffa1d;
enum JET_errColumnDuplicate = 0xfffffffffffffa1c;
enum JET_errMultiValuedColumnMustBeTagged = 0xfffffffffffffa1b;
enum JET_errColumnRedundant = 0xfffffffffffffa1a;
enum JET_errInvalidColumnType = 0xfffffffffffffa19;
enum JET_wrnColumnMaxTruncated = 0x000005e8;
enum JET_errTaggedNotNULL = 0xfffffffffffffa16;
enum JET_errNoCurrentIndex = 0xfffffffffffffa15;
enum JET_errKeyIsMade = 0xfffffffffffffa14;
enum JET_errBadColumnId = 0xfffffffffffffa13;
enum JET_errBadItagSequence = 0xfffffffffffffa12;
enum JET_errColumnInRelationship = 0xfffffffffffffa11;
enum JET_wrnCopyLongValue = 0x000005f0;
enum JET_errCannotBeTagged = 0xfffffffffffffa0f;
enum JET_errDefaultValueTooBig = 0xfffffffffffffa0c;
enum JET_errMultiValuedDuplicate = 0xfffffffffffffa0b;
enum JET_errLVCorrupted = 0xfffffffffffffa0a;
enum JET_errMultiValuedDuplicateAfterTruncation = 0xfffffffffffffa08;
enum JET_errDerivedColumnCorruption = 0xfffffffffffffa07;
enum JET_errInvalidPlaceholderColumn = 0xfffffffffffffa06;
enum JET_wrnColumnSkipped = 0x000005fb;
enum JET_wrnColumnNotLocal = 0x000005fc;
enum JET_wrnColumnMoreTags = 0x000005fd;
enum JET_wrnColumnTruncated = 0x000005fe;
enum JET_wrnColumnPresent = 0x000005ff;
enum JET_wrnColumnSingleValue = 0x00000600;
enum JET_wrnColumnDefault = 0x00000601;
enum JET_errColumnCannotBeCompressed = 0xfffffffffffff9fe;
enum JET_wrnColumnNotInRecord = 0x00000603;
enum JET_errColumnNoEncryptionKey = 0xfffffffffffff9fc;
enum JET_wrnColumnReference = 0x00000605;
enum JET_errRecordNotFound = 0xfffffffffffff9bf;
enum JET_errRecordNoCopy = 0xfffffffffffff9be;
enum JET_errNoCurrentRecord = 0xfffffffffffff9bd;
enum JET_errRecordPrimaryChanged = 0xfffffffffffff9bc;
enum JET_errKeyDuplicate = 0xfffffffffffff9bb;
enum JET_errAlreadyPrepared = 0xfffffffffffff9b9;
enum JET_errKeyNotMade = 0xfffffffffffff9b8;
enum JET_errUpdateNotPrepared = 0xfffffffffffff9b7;
enum JET_wrnDataHasChanged = 0x0000064a;
enum JET_errDataHasChanged = 0xfffffffffffff9b5;
enum JET_wrnKeyChanged = 0x00000652;
enum JET_errLanguageNotSupported = 0xfffffffffffff9ad;
enum JET_errDecompressionFailed = 0xfffffffffffff9ac;
enum JET_errUpdateMustVersion = 0xfffffffffffff9ab;
enum JET_errDecryptionFailed = 0xfffffffffffff9aa;
enum JET_errEncryptionBadItag = 0xfffffffffffff9a9;
enum JET_errTooManySorts = 0xfffffffffffff95b;
enum JET_errInvalidOnSort = 0xfffffffffffff95a;
enum JET_errTempFileOpenError = 0xfffffffffffff8f5;
enum JET_errTooManyAttachedDatabases = 0xfffffffffffff8f3;
enum JET_errDiskFull = 0xfffffffffffff8f0;
enum JET_errPermissionDenied = 0xfffffffffffff8ef;
enum JET_errFileNotFound = 0xfffffffffffff8ed;
enum JET_errFileInvalidType = 0xfffffffffffff8ec;
enum JET_wrnFileOpenReadOnly = 0x00000715;
enum JET_errFileAlreadyExists = 0xfffffffffffff8ea;
enum JET_errAfterInitialization = 0xfffffffffffff8c6;
enum JET_errLogCorrupted = 0xfffffffffffff8c4;
enum JET_errInvalidOperation = 0xfffffffffffff88e;
enum JET_errAccessDenied = 0xfffffffffffff88d;
enum JET_wrnIdleFull = 0x00000774;
enum JET_errTooManySplits = 0xfffffffffffff88b;
enum JET_errSessionSharingViolation = 0xfffffffffffff88a;
enum JET_errEntryPointNotFound = 0xfffffffffffff889;
enum JET_errSessionContextAlreadySet = 0xfffffffffffff888;
enum JET_errSessionContextNotSetByThisThread = 0xfffffffffffff887;
enum JET_errSessionInUse = 0xfffffffffffff886;
enum JET_errRecordFormatConversionFailed = 0xfffffffffffff885;
enum JET_errOneDatabasePerSession = 0xfffffffffffff884;
enum JET_errRollbackError = 0xfffffffffffff883;
enum JET_errFlushMapVersionUnsupported = 0xfffffffffffff882;
enum JET_errFlushMapDatabaseMismatch = 0xfffffffffffff881;
enum JET_errFlushMapUnrecoverable = 0xfffffffffffff880;
enum JET_wrnDefragAlreadyRunning = 0x000007d0;
enum JET_wrnDefragNotRunning = 0x000007d1;
enum JET_errDatabaseAlreadyRunningMaintenance = 0xfffffffffffff82c;
enum JET_wrnCallbackNotRegistered = 0x00000834;
enum JET_errCallbackFailed = 0xfffffffffffff7cb;
enum JET_errCallbackNotResolved = 0xfffffffffffff7ca;
enum JET_errSpaceHintsInvalid = 0xfffffffffffff7c9;
enum JET_errOSSnapshotInvalidSequence = 0xfffffffffffff69f;
enum JET_errOSSnapshotTimeOut = 0xfffffffffffff69e;
enum JET_errOSSnapshotNotAllowed = 0xfffffffffffff69d;
enum JET_errOSSnapshotInvalidSnapId = 0xfffffffffffff69c;
enum JET_errLSCallbackNotSpecified = 0xfffffffffffff448;
enum JET_errLSAlreadySet = 0xfffffffffffff447;
enum JET_errLSNotSet = 0xfffffffffffff446;
enum JET_errFileIOSparse = 0xfffffffffffff060;
enum JET_errFileIOBeyondEOF = 0xfffffffffffff05f;
enum JET_errFileIOAbort = 0xfffffffffffff05e;
enum JET_errFileIORetry = 0xfffffffffffff05d;
enum JET_errFileIOFail = 0xfffffffffffff05c;
enum JET_errFileCompressed = 0xfffffffffffff05b;
enum JET_BASE_NAME_LENGTH = 0x00000003;
enum JET_bitDumpMinimum = 0x00000001;
enum JET_bitDumpMaximum = 0x00000002;
enum JET_bitDumpCacheMinimum = 0x00000004;
enum JET_bitDumpCacheMaximum = 0x00000008;
enum JET_bitDumpCacheIncludeDirtyPages = 0x00000010;
enum JET_bitDumpCacheIncludeCachedPages = 0x00000020;
enum JET_bitDumpCacheIncludeCorruptedPages = 0x00000040;
enum JET_bitDumpCacheNoDecommit = 0x00000080;
alias JET_OSSNAPID = ulong;
alias JET_LS = ulong;
struct JET_INDEXID
{
    uint cbStruct;
    ubyte[16] rgbIndexId;
}
alias JET_PFNSTATUS = int function(JET_SESID, uint, uint, void*);
struct JET_RSTMAP_A
{
    PSTR szDatabaseName;
    PSTR szNewDatabaseName;
}
struct JET_RSTMAP_W
{
    PWSTR szDatabaseName;
    PWSTR szNewDatabaseName;
}
struct CONVERT_A
{
    PSTR szOldDll;
    union
    {
        uint fFlags;
        struct
        {
            uint _bitfield0;
        }
    }
}
struct CONVERT_W
{
    PWSTR szOldDll;
    union
    {
        uint fFlags;
        struct
        {
            uint _bitfield0;
        }
    }
}
alias JET_CALLBACK = int function(JET_SESID, uint, JET_TABLEID, uint, void*, void*, void*, JET_API_PTR);
struct JET_SNPROG
{
    uint cbStruct;
    uint cunitDone;
    uint cunitTotal;
}
struct JET_DBINFOUPGRADE
{
    uint cbStruct;
    uint cbFilesizeLow;
    uint cbFilesizeHigh;
    uint cbFreeSpaceRequiredLow;
    uint cbFreeSpaceRequiredHigh;
    uint csecToUpgrade;
    union
    {
        uint ulFlags;
        struct
        {
            uint _bitfield0;
        }
    }
}
struct JET_OBJECTINFO
{
    uint cbStruct;
    uint objtyp;
    double dtCreate;
    double dtUpdate;
    uint grbit;
    uint flags;
    uint cRecord;
    uint cPage;
}
struct JET_OBJECTLIST
{
    uint cbStruct;
    JET_TABLEID tableid;
    uint cRecord;
    uint columnidcontainername;
    uint columnidobjectname;
    uint columnidobjtyp;
    uint columniddtCreate;
    uint columniddtUpdate;
    uint columnidgrbit;
    uint columnidflags;
    uint columnidcRecord;
    uint columnidcPage;
}
struct JET_COLUMNLIST
{
    uint cbStruct;
    JET_TABLEID tableid;
    uint cRecord;
    uint columnidPresentationOrder;
    uint columnidcolumnname;
    uint columnidcolumnid;
    uint columnidcoltyp;
    uint columnidCountry;
    uint columnidLangid;
    uint columnidCp;
    uint columnidCollate;
    uint columnidcbMax;
    uint columnidgrbit;
    uint columnidDefault;
    uint columnidBaseTableName;
    uint columnidBaseColumnName;
    uint columnidDefinitionName;
}
struct JET_COLUMNDEF
{
    uint cbStruct;
    uint columnid;
    uint coltyp;
    ushort wCountry;
    ushort langid;
    ushort cp;
    ushort wCollate;
    uint cbMax;
    uint grbit;
}
struct JET_COLUMNBASE_A
{
    uint cbStruct;
    uint columnid;
    uint coltyp;
    ushort wCountry;
    ushort langid;
    ushort cp;
    ushort wFiller;
    uint cbMax;
    uint grbit;
    CHAR[256] szBaseTableName;
    CHAR[256] szBaseColumnName;
}
struct JET_COLUMNBASE_W
{
    uint cbStruct;
    uint columnid;
    uint coltyp;
    ushort wCountry;
    ushort langid;
    ushort cp;
    ushort wFiller;
    uint cbMax;
    uint grbit;
    wchar[256] szBaseTableName;
    wchar[256] szBaseColumnName;
}
struct JET_INDEXLIST
{
    uint cbStruct;
    JET_TABLEID tableid;
    uint cRecord;
    uint columnidindexname;
    uint columnidgrbitIndex;
    uint columnidcKey;
    uint columnidcEntry;
    uint columnidcPage;
    uint columnidcColumn;
    uint columnidiColumn;
    uint columnidcolumnid;
    uint columnidcoltyp;
    uint columnidCountry;
    uint columnidLangid;
    uint columnidCp;
    uint columnidCollate;
    uint columnidgrbitColumn;
    uint columnidcolumnname;
    uint columnidLCMapFlags;
}
struct JET_COLUMNCREATE_A
{
    uint cbStruct;
    PSTR szColumnName;
    uint coltyp;
    uint cbMax;
    uint grbit;
    void* pvDefault;
    uint cbDefault;
    uint cp;
    uint columnid;
    int err;
}
struct JET_COLUMNCREATE_W
{
    uint cbStruct;
    PWSTR szColumnName;
    uint coltyp;
    uint cbMax;
    uint grbit;
    void* pvDefault;
    uint cbDefault;
    uint cp;
    uint columnid;
    int err;
}
struct JET_USERDEFINEDDEFAULT_A
{
    PSTR szCallback;
    ubyte* pbUserData;
    uint cbUserData;
    PSTR szDependantColumns;
}
struct JET_USERDEFINEDDEFAULT_W
{
    PWSTR szCallback;
    ubyte* pbUserData;
    uint cbUserData;
    PWSTR szDependantColumns;
}
struct JET_CONDITIONALCOLUMN_A
{
    uint cbStruct;
    PSTR szColumnName;
    uint grbit;
}
struct JET_CONDITIONALCOLUMN_W
{
    uint cbStruct;
    PWSTR szColumnName;
    uint grbit;
}
struct JET_UNICODEINDEX
{
    uint lcid;
    uint dwMapFlags;
}
struct JET_UNICODEINDEX2
{
    PWSTR szLocaleName;
    uint dwMapFlags;
}
struct JET_TUPLELIMITS
{
    uint chLengthMin;
    uint chLengthMax;
    uint chToIndexMax;
    uint cchIncrement;
    uint ichStart;
}
struct JET_SPACEHINTS
{
    uint cbStruct;
    uint ulInitialDensity;
    uint cbInitial;
    uint grbit;
    uint ulMaintDensity;
    uint ulGrowth;
    uint cbMinExtent;
    uint cbMaxExtent;
}
struct JET_INDEXCREATE_A
{
    uint cbStruct;
    PSTR szIndexName;
    PSTR szKey;
    uint cbKey;
    uint grbit;
    uint ulDensity;
    union
    {
        uint lcid;
        JET_UNICODEINDEX* pidxunicode;
    }
    union
    {
        uint cbVarSegMac;
        JET_TUPLELIMITS* ptuplelimits;
    }
    JET_CONDITIONALCOLUMN_A* rgconditionalcolumn;
    uint cConditionalColumn;
    int err;
    uint cbKeyMost;
}
struct JET_INDEXCREATE_W
{
    uint cbStruct;
    PWSTR szIndexName;
    PWSTR szKey;
    uint cbKey;
    uint grbit;
    uint ulDensity;
    union
    {
        uint lcid;
        JET_UNICODEINDEX* pidxunicode;
    }
    union
    {
        uint cbVarSegMac;
        JET_TUPLELIMITS* ptuplelimits;
    }
    JET_CONDITIONALCOLUMN_W* rgconditionalcolumn;
    uint cConditionalColumn;
    int err;
    uint cbKeyMost;
}
struct JET_INDEXCREATE2_A
{
    uint cbStruct;
    PSTR szIndexName;
    PSTR szKey;
    uint cbKey;
    uint grbit;
    uint ulDensity;
    union
    {
        uint lcid;
        JET_UNICODEINDEX* pidxunicode;
    }
    union
    {
        uint cbVarSegMac;
        JET_TUPLELIMITS* ptuplelimits;
    }
    JET_CONDITIONALCOLUMN_A* rgconditionalcolumn;
    uint cConditionalColumn;
    int err;
    uint cbKeyMost;
    JET_SPACEHINTS* pSpacehints;
}
struct JET_INDEXCREATE2_W
{
    uint cbStruct;
    PWSTR szIndexName;
    PWSTR szKey;
    uint cbKey;
    uint grbit;
    uint ulDensity;
    union
    {
        uint lcid;
        JET_UNICODEINDEX* pidxunicode;
    }
    union
    {
        uint cbVarSegMac;
        JET_TUPLELIMITS* ptuplelimits;
    }
    JET_CONDITIONALCOLUMN_W* rgconditionalcolumn;
    uint cConditionalColumn;
    int err;
    uint cbKeyMost;
    JET_SPACEHINTS* pSpacehints;
}
struct JET_INDEXCREATE3_A
{
    uint cbStruct;
    PSTR szIndexName;
    PSTR szKey;
    uint cbKey;
    uint grbit;
    uint ulDensity;
    JET_UNICODEINDEX2* pidxunicode;
    union
    {
        uint cbVarSegMac;
        JET_TUPLELIMITS* ptuplelimits;
    }
    JET_CONDITIONALCOLUMN_A* rgconditionalcolumn;
    uint cConditionalColumn;
    int err;
    uint cbKeyMost;
    JET_SPACEHINTS* pSpacehints;
}
struct JET_INDEXCREATE3_W
{
    uint cbStruct;
    PWSTR szIndexName;
    PWSTR szKey;
    uint cbKey;
    uint grbit;
    uint ulDensity;
    JET_UNICODEINDEX2* pidxunicode;
    union
    {
        uint cbVarSegMac;
        JET_TUPLELIMITS* ptuplelimits;
    }
    JET_CONDITIONALCOLUMN_W* rgconditionalcolumn;
    uint cConditionalColumn;
    int err;
    uint cbKeyMost;
    JET_SPACEHINTS* pSpacehints;
}
struct JET_TABLECREATE_A
{
    uint cbStruct;
    PSTR szTableName;
    PSTR szTemplateTableName;
    uint ulPages;
    uint ulDensity;
    JET_COLUMNCREATE_A* rgcolumncreate;
    uint cColumns;
    JET_INDEXCREATE_A* rgindexcreate;
    uint cIndexes;
    uint grbit;
    JET_TABLEID tableid;
    uint cCreated;
}
struct JET_TABLECREATE_W
{
    uint cbStruct;
    PWSTR szTableName;
    PWSTR szTemplateTableName;
    uint ulPages;
    uint ulDensity;
    JET_COLUMNCREATE_W* rgcolumncreate;
    uint cColumns;
    JET_INDEXCREATE_W* rgindexcreate;
    uint cIndexes;
    uint grbit;
    JET_TABLEID tableid;
    uint cCreated;
}
struct JET_TABLECREATE2_A
{
    uint cbStruct;
    PSTR szTableName;
    PSTR szTemplateTableName;
    uint ulPages;
    uint ulDensity;
    JET_COLUMNCREATE_A* rgcolumncreate;
    uint cColumns;
    JET_INDEXCREATE_A* rgindexcreate;
    uint cIndexes;
    PSTR szCallback;
    uint cbtyp;
    uint grbit;
    JET_TABLEID tableid;
    uint cCreated;
}
struct JET_TABLECREATE2_W
{
    uint cbStruct;
    PWSTR szTableName;
    PWSTR szTemplateTableName;
    uint ulPages;
    uint ulDensity;
    JET_COLUMNCREATE_W* rgcolumncreate;
    uint cColumns;
    JET_INDEXCREATE_W* rgindexcreate;
    uint cIndexes;
    PWSTR szCallback;
    uint cbtyp;
    uint grbit;
    JET_TABLEID tableid;
    uint cCreated;
}
struct JET_TABLECREATE3_A
{
    uint cbStruct;
    PSTR szTableName;
    PSTR szTemplateTableName;
    uint ulPages;
    uint ulDensity;
    JET_COLUMNCREATE_A* rgcolumncreate;
    uint cColumns;
    JET_INDEXCREATE2_A* rgindexcreate;
    uint cIndexes;
    PSTR szCallback;
    uint cbtyp;
    uint grbit;
    JET_SPACEHINTS* pSeqSpacehints;
    JET_SPACEHINTS* pLVSpacehints;
    uint cbSeparateLV;
    JET_TABLEID tableid;
    uint cCreated;
}
struct JET_TABLECREATE3_W
{
    uint cbStruct;
    PWSTR szTableName;
    PWSTR szTemplateTableName;
    uint ulPages;
    uint ulDensity;
    JET_COLUMNCREATE_W* rgcolumncreate;
    uint cColumns;
    JET_INDEXCREATE2_W* rgindexcreate;
    uint cIndexes;
    PWSTR szCallback;
    uint cbtyp;
    uint grbit;
    JET_SPACEHINTS* pSeqSpacehints;
    JET_SPACEHINTS* pLVSpacehints;
    uint cbSeparateLV;
    JET_TABLEID tableid;
    uint cCreated;
}
struct JET_TABLECREATE4_A
{
    uint cbStruct;
    PSTR szTableName;
    PSTR szTemplateTableName;
    uint ulPages;
    uint ulDensity;
    JET_COLUMNCREATE_A* rgcolumncreate;
    uint cColumns;
    JET_INDEXCREATE3_A* rgindexcreate;
    uint cIndexes;
    PSTR szCallback;
    uint cbtyp;
    uint grbit;
    JET_SPACEHINTS* pSeqSpacehints;
    JET_SPACEHINTS* pLVSpacehints;
    uint cbSeparateLV;
    JET_TABLEID tableid;
    uint cCreated;
}
struct JET_TABLECREATE4_W
{
    uint cbStruct;
    PWSTR szTableName;
    PWSTR szTemplateTableName;
    uint ulPages;
    uint ulDensity;
    JET_COLUMNCREATE_W* rgcolumncreate;
    uint cColumns;
    JET_INDEXCREATE3_W* rgindexcreate;
    uint cIndexes;
    PWSTR szCallback;
    uint cbtyp;
    uint grbit;
    JET_SPACEHINTS* pSeqSpacehints;
    JET_SPACEHINTS* pLVSpacehints;
    uint cbSeparateLV;
    JET_TABLEID tableid;
    uint cCreated;
}
struct JET_OPENTEMPORARYTABLE
{
    uint cbStruct;
    const(JET_COLUMNDEF)* prgcolumndef;
    uint ccolumn;
    JET_UNICODEINDEX* pidxunicode;
    uint grbit;
    uint* prgcolumnid;
    uint cbKeyMost;
    uint cbVarSegMac;
    JET_TABLEID tableid;
}
struct JET_OPENTEMPORARYTABLE2
{
    uint cbStruct;
    const(JET_COLUMNDEF)* prgcolumndef;
    uint ccolumn;
    JET_UNICODEINDEX2* pidxunicode;
    uint grbit;
    uint* prgcolumnid;
    uint cbKeyMost;
    uint cbVarSegMac;
    JET_TABLEID tableid;
}
struct JET_RETINFO
{
    uint cbStruct;
    uint ibLongValue;
    uint itagSequence;
    uint columnidNextTagged;
}
struct JET_SETINFO
{
    uint cbStruct;
    uint ibLongValue;
    uint itagSequence;
}
struct JET_RECPOS
{
    uint cbStruct;
    uint centriesLT;
    uint centriesInRange;
    uint centriesTotal;
}
struct JET_RECORDLIST
{
    uint cbStruct;
    JET_TABLEID tableid;
    uint cRecord;
    uint columnidBookmark;
}
struct JET_INDEXRANGE
{
    uint cbStruct;
    JET_TABLEID tableid;
    uint grbit;
}
alias JET_RELOP = int;
enum : int
{
    JET_relopEquals               = 0x00000000,
    JET_relopPrefixEquals         = 0x00000001,
    JET_relopNotEquals            = 0x00000002,
    JET_relopLessThanOrEqual      = 0x00000003,
    JET_relopLessThan             = 0x00000004,
    JET_relopGreaterThanOrEqual   = 0x00000005,
    JET_relopGreaterThan          = 0x00000006,
    JET_relopBitmaskEqualsZero    = 0x00000007,
    JET_relopBitmaskNotEqualsZero = 0x00000008,
}

struct JET_INDEX_COLUMN
{
    uint columnid;
    JET_RELOP relop;
    void* pv;
    uint cb;
    uint grbit;
}
struct JET_INDEX_RANGE
{
    JET_INDEX_COLUMN* rgStartColumns;
    uint cStartColumns;
    JET_INDEX_COLUMN* rgEndColumns;
    uint cEndColumns;
}
struct JET_LOGTIME
{
    CHAR bSeconds;
    CHAR bMinutes;
    CHAR bHours;
    CHAR bDay;
    CHAR bMonth;
    CHAR bYear;
    union
    {
        CHAR bFiller1;
        struct
        {
            ubyte _bitfield0;
        }
    }
    union
    {
        CHAR bFiller2;
        struct
        {
            ubyte _bitfield1;
        }
    }
}
struct JET_BKLOGTIME
{
    CHAR bSeconds;
    CHAR bMinutes;
    CHAR bHours;
    CHAR bDay;
    CHAR bMonth;
    CHAR bYear;
    union
    {
        CHAR bFiller1;
        struct
        {
            ubyte _bitfield0;
        }
    }
    union
    {
        CHAR bFiller2;
        struct
        {
            ubyte _bitfield1;
        }
    }
}
struct JET_LGPOS
{
    align (1):
    ushort ib;
    ushort isec;
    int lGeneration;
}
struct JET_SIGNATURE
{
    align (1):
    uint ulRandom;
    JET_LOGTIME logtimeCreate;
    CHAR[16] szComputerName;
}
struct JET_BKINFO
{
    align (1):
    JET_LGPOS lgposMark;
    union
    {
        JET_LOGTIME logtimeMark;
        JET_BKLOGTIME bklogtimeMark;
    }
    uint genLow;
    uint genHigh;
}
struct JET_DBINFOMISC
{
    uint ulVersion;
    uint ulUpdate;
    JET_SIGNATURE signDb;
    uint dbstate;
    JET_LGPOS lgposConsistent;
    JET_LOGTIME logtimeConsistent;
    JET_LOGTIME logtimeAttach;
    JET_LGPOS lgposAttach;
    JET_LOGTIME logtimeDetach;
    JET_LGPOS lgposDetach;
    JET_SIGNATURE signLog;
    JET_BKINFO bkinfoFullPrev;
    JET_BKINFO bkinfoIncPrev;
    JET_BKINFO bkinfoFullCur;
    uint fShadowingDisabled;
    uint fUpgradeDb;
    uint dwMajorVersion;
    uint dwMinorVersion;
    uint dwBuildNumber;
    int lSPNumber;
    uint cbPageSize;
}
struct JET_DBINFOMISC2
{
    uint ulVersion;
    uint ulUpdate;
    JET_SIGNATURE signDb;
    uint dbstate;
    JET_LGPOS lgposConsistent;
    JET_LOGTIME logtimeConsistent;
    JET_LOGTIME logtimeAttach;
    JET_LGPOS lgposAttach;
    JET_LOGTIME logtimeDetach;
    JET_LGPOS lgposDetach;
    JET_SIGNATURE signLog;
    JET_BKINFO bkinfoFullPrev;
    JET_BKINFO bkinfoIncPrev;
    JET_BKINFO bkinfoFullCur;
    uint fShadowingDisabled;
    uint fUpgradeDb;
    uint dwMajorVersion;
    uint dwMinorVersion;
    uint dwBuildNumber;
    int lSPNumber;
    uint cbPageSize;
    uint genMinRequired;
    uint genMaxRequired;
    JET_LOGTIME logtimeGenMaxCreate;
    uint ulRepairCount;
    JET_LOGTIME logtimeRepair;
    uint ulRepairCountOld;
    uint ulECCFixSuccess;
    JET_LOGTIME logtimeECCFixSuccess;
    uint ulECCFixSuccessOld;
    uint ulECCFixFail;
    JET_LOGTIME logtimeECCFixFail;
    uint ulECCFixFailOld;
    uint ulBadChecksum;
    JET_LOGTIME logtimeBadChecksum;
    uint ulBadChecksumOld;
}
struct JET_DBINFOMISC3
{
    uint ulVersion;
    uint ulUpdate;
    JET_SIGNATURE signDb;
    uint dbstate;
    JET_LGPOS lgposConsistent;
    JET_LOGTIME logtimeConsistent;
    JET_LOGTIME logtimeAttach;
    JET_LGPOS lgposAttach;
    JET_LOGTIME logtimeDetach;
    JET_LGPOS lgposDetach;
    JET_SIGNATURE signLog;
    JET_BKINFO bkinfoFullPrev;
    JET_BKINFO bkinfoIncPrev;
    JET_BKINFO bkinfoFullCur;
    uint fShadowingDisabled;
    uint fUpgradeDb;
    uint dwMajorVersion;
    uint dwMinorVersion;
    uint dwBuildNumber;
    int lSPNumber;
    uint cbPageSize;
    uint genMinRequired;
    uint genMaxRequired;
    JET_LOGTIME logtimeGenMaxCreate;
    uint ulRepairCount;
    JET_LOGTIME logtimeRepair;
    uint ulRepairCountOld;
    uint ulECCFixSuccess;
    JET_LOGTIME logtimeECCFixSuccess;
    uint ulECCFixSuccessOld;
    uint ulECCFixFail;
    JET_LOGTIME logtimeECCFixFail;
    uint ulECCFixFailOld;
    uint ulBadChecksum;
    JET_LOGTIME logtimeBadChecksum;
    uint ulBadChecksumOld;
    uint genCommitted;
}
struct JET_DBINFOMISC4
{
    uint ulVersion;
    uint ulUpdate;
    JET_SIGNATURE signDb;
    uint dbstate;
    JET_LGPOS lgposConsistent;
    JET_LOGTIME logtimeConsistent;
    JET_LOGTIME logtimeAttach;
    JET_LGPOS lgposAttach;
    JET_LOGTIME logtimeDetach;
    JET_LGPOS lgposDetach;
    JET_SIGNATURE signLog;
    JET_BKINFO bkinfoFullPrev;
    JET_BKINFO bkinfoIncPrev;
    JET_BKINFO bkinfoFullCur;
    uint fShadowingDisabled;
    uint fUpgradeDb;
    uint dwMajorVersion;
    uint dwMinorVersion;
    uint dwBuildNumber;
    int lSPNumber;
    uint cbPageSize;
    uint genMinRequired;
    uint genMaxRequired;
    JET_LOGTIME logtimeGenMaxCreate;
    uint ulRepairCount;
    JET_LOGTIME logtimeRepair;
    uint ulRepairCountOld;
    uint ulECCFixSuccess;
    JET_LOGTIME logtimeECCFixSuccess;
    uint ulECCFixSuccessOld;
    uint ulECCFixFail;
    JET_LOGTIME logtimeECCFixFail;
    uint ulECCFixFailOld;
    uint ulBadChecksum;
    JET_LOGTIME logtimeBadChecksum;
    uint ulBadChecksumOld;
    uint genCommitted;
    JET_BKINFO bkinfoCopyPrev;
    JET_BKINFO bkinfoDiffPrev;
}
struct JET_THREADSTATS
{
    uint cbStruct;
    uint cPageReferenced;
    uint cPageRead;
    uint cPagePreread;
    uint cPageDirtied;
    uint cPageRedirtied;
    uint cLogRecord;
    uint cbLogRecord;
}
struct JET_THREADSTATS2
{
    uint cbStruct;
    uint cPageReferenced;
    uint cPageRead;
    uint cPagePreread;
    uint cPageDirtied;
    uint cPageRedirtied;
    uint cLogRecord;
    uint cbLogRecord;
    ulong cusecPageCacheMiss;
    uint cPageCacheMiss;
}
struct JET_RSTINFO_A
{
    uint cbStruct;
    JET_RSTMAP_A* rgrstmap;
    int crstmap;
    JET_LGPOS lgposStop;
    JET_LOGTIME logtimeStop;
    JET_PFNSTATUS pfnStatus;
}
struct JET_RSTINFO_W
{
    uint cbStruct;
    JET_RSTMAP_W* rgrstmap;
    int crstmap;
    JET_LGPOS lgposStop;
    JET_LOGTIME logtimeStop;
    JET_PFNSTATUS pfnStatus;
}
alias JET_ERRCAT = int;
enum : int
{
    JET_errcatUnknown       = 0x00000000,
    JET_errcatError         = 0x00000001,
    JET_errcatOperation     = 0x00000002,
    JET_errcatFatal         = 0x00000003,
    JET_errcatIO            = 0x00000004,
    JET_errcatResource      = 0x00000005,
    JET_errcatMemory        = 0x00000006,
    JET_errcatQuota         = 0x00000007,
    JET_errcatDisk          = 0x00000008,
    JET_errcatData          = 0x00000009,
    JET_errcatCorruption    = 0x0000000a,
    JET_errcatInconsistent  = 0x0000000b,
    JET_errcatFragmentation = 0x0000000c,
    JET_errcatApi           = 0x0000000d,
    JET_errcatUsage         = 0x0000000e,
    JET_errcatState         = 0x0000000f,
    JET_errcatObsolete      = 0x00000010,
    JET_errcatMax           = 0x00000011,
}

struct JET_ERRINFOBASIC_W
{
    uint cbStruct;
    int errValue;
    JET_ERRCAT errcatMostSpecific;
    ubyte[8] rgCategoricalHierarchy;
    uint lSourceLine;
    wchar[64] rgszSourceFile;
}
struct JET_COMMIT_ID
{
    JET_SIGNATURE signLog;
    int reserved;
    long commitId;
}
alias JET_PFNDURABLECOMMITCALLBACK = int function(JET_INSTANCE, JET_COMMIT_ID*, uint);
struct JET_RBSINFOMISC
{
    int lRBSGeneration;
    JET_LOGTIME logtimeCreate;
    JET_LOGTIME logtimeCreatePrevRBS;
    uint ulMajor;
    uint ulMinor;
    ulong cbLogicalFileSize;
}
struct JET_RBSREVERTINFOMISC
{
    int lGenMinRevertStart;
    int lGenMaxRevertStart;
    int lGenMinRevertEnd;
    int lGenMaxRevertEnd;
    JET_LOGTIME logtimeRevertFrom;
    ulong cSecRevert;
    ulong cPagesReverted;
}
alias JET_INDEXCHECKING = int;
enum : int
{
    JET_IndexCheckingOff              = 0x00000000,
    JET_IndexCheckingOn               = 0x00000001,
    JET_IndexCheckingDeferToOpenTable = 0x00000002,
    JET_IndexCheckingMax              = 0x00000003,
}

struct JET_OPERATIONCONTEXT
{
    uint ulUserID;
    ubyte nOperationID;
    ubyte nOperationType;
    ubyte nClientType;
    ubyte fFlags;
}
struct JET_SETCOLUMN
{
    uint columnid;
    const(void)* pvData;
    uint cbData;
    uint grbit;
    uint ibLongValue;
    uint itagSequence;
    int err;
}
struct JET_SETSYSPARAM_A
{
    uint paramid;
    JET_API_PTR lParam;
    const(char)* sz;
    int err;
}
struct JET_SETSYSPARAM_W
{
    uint paramid;
    JET_API_PTR lParam;
    const(wchar)* sz;
    int err;
}
struct JET_RETRIEVECOLUMN
{
    uint columnid;
    void* pvData;
    uint cbData;
    uint cbActual;
    uint grbit;
    uint ibLongValue;
    uint itagSequence;
    uint columnidNextTagged;
    int err;
}
struct JET_ENUMCOLUMNID
{
    uint columnid;
    uint ctagSequence;
    uint* rgtagSequence;
}
struct JET_ENUMCOLUMNVALUE
{
    uint itagSequence;
    int err;
    uint cbData;
    void* pvData;
}
struct JET_ENUMCOLUMN
{
    uint columnid;
    int err;
    union
    {
        struct
        {
            uint cEnumColumnValue;
            JET_ENUMCOLUMNVALUE* rgEnumColumnValue;
        }
        struct
        {
            uint cbData;
            void* pvData;
        }
    }
}
alias JET_PFNREALLOC = void* function(void*, void*, uint);
struct JET_RECSIZE
{
    ulong cbData;
    ulong cbLongValueData;
    ulong cbOverhead;
    ulong cbLongValueOverhead;
    ulong cNonTaggedColumns;
    ulong cTaggedColumns;
    ulong cLongValues;
    ulong cMultiValues;
}
struct JET_RECSIZE2
{
    ulong cbData;
    ulong cbLongValueData;
    ulong cbOverhead;
    ulong cbLongValueOverhead;
    ulong cNonTaggedColumns;
    ulong cTaggedColumns;
    ulong cLongValues;
    ulong cMultiValues;
    ulong cCompressedColumns;
    ulong cbDataCompressed;
    ulong cbLongValueDataCompressed;
}
struct JET_LOGINFO_A
{
    uint cbSize;
    uint ulGenLow;
    uint ulGenHigh;
    CHAR[4] szBaseName;
}
struct JET_LOGINFO_W
{
    uint cbSize;
    uint ulGenLow;
    uint ulGenHigh;
    wchar[4] szBaseName;
}
struct JET_INSTANCE_INFO_A
{
    JET_INSTANCE hInstanceId;
    PSTR szInstanceName;
    JET_API_PTR cDatabases;
    byte** szDatabaseFileName;
    byte** szDatabaseDisplayName;
    byte** szDatabaseSLVFileName_Obsolete;
}
struct JET_INSTANCE_INFO_W
{
    JET_INSTANCE hInstanceId;
    PWSTR szInstanceName;
    JET_API_PTR cDatabases;
    ushort** szDatabaseFileName;
    ushort** szDatabaseDisplayName;
    ushort** szDatabaseSLVFileName_Obsolete;
}
/+ [CONFLICTED] struct JET_INDEXID
{
    uint cbStruct;
    ubyte[12] rgbIndexId;
}
+/
/+ [CONFLICTED] struct JET_OBJECTINFO
{
    align (4):
    uint cbStruct;
    uint objtyp;
    double dtCreate;
    double dtUpdate;
    uint grbit;
    uint flags;
    uint cRecord;
    uint cPage;
}
+/
/+ [CONFLICTED] struct JET_THREADSTATS2
{
    align (4):
    uint cbStruct;
    uint cPageReferenced;
    uint cPageRead;
    uint cPagePreread;
    uint cPageDirtied;
    uint cPageRedirtied;
    uint cLogRecord;
    uint cbLogRecord;
    ulong cusecPageCacheMiss;
    uint cPageCacheMiss;
}
+/
/+ [CONFLICTED] struct JET_COMMIT_ID
{
    align (4):
    JET_SIGNATURE signLog;
    int reserved;
    long commitId;
}
+/
/+ [CONFLICTED] struct JET_RBSINFOMISC
{
    align (4):
    int lRBSGeneration;
    JET_LOGTIME logtimeCreate;
    JET_LOGTIME logtimeCreatePrevRBS;
    uint ulMajor;
    uint ulMinor;
    ulong cbLogicalFileSize;
}
+/
/+ [CONFLICTED] struct JET_RBSREVERTINFOMISC
{
    align (4):
    int lGenMinRevertStart;
    int lGenMaxRevertStart;
    int lGenMinRevertEnd;
    int lGenMaxRevertEnd;
    JET_LOGTIME logtimeRevertFrom;
    ulong cSecRevert;
    ulong cPagesReverted;
}
+/
/+ [CONFLICTED] struct JET_RECSIZE
{
    align (4):
    ulong cbData;
    ulong cbLongValueData;
    ulong cbOverhead;
    ulong cbLongValueOverhead;
    ulong cNonTaggedColumns;
    ulong cTaggedColumns;
    ulong cLongValues;
    ulong cMultiValues;
}
+/
/+ [CONFLICTED] struct JET_RECSIZE2
{
    align (4):
    ulong cbData;
    ulong cbLongValueData;
    ulong cbOverhead;
    ulong cbLongValueOverhead;
    ulong cNonTaggedColumns;
    ulong cTaggedColumns;
    ulong cLongValues;
    ulong cMultiValues;
    ulong cCompressedColumns;
    ulong cbDataCompressed;
    ulong cbLongValueDataCompressed;
}
+/
