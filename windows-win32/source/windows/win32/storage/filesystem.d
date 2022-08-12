module windows.win32.storage.filesystem;

import windows.win32.guid : GUID;
import windows.win32.foundation : BOOL, BOOLEAN, CHAR, FILETIME, HANDLE, HRESULT, LARGE_INTEGER, NTSTATUS, PSID, PSTR, PWSTR, SYSTEMTIME, ULARGE_INTEGER;
import windows.win32.security_ : GENERIC_MAPPING, PRIVILEGE_SET, PSECURITY_DESCRIPTOR, SECURITY_ATTRIBUTES, SID;
import windows.win32.system.com_ : IConnectionPointContainer, IUnknown;
import windows.win32.system.io : LPOVERLAPPED_COMPLETION_ROUTINE, OVERLAPPED;
import windows.win32.system.windowsprogramming : IO_STATUS_BLOCK, OBJECT_ATTRIBUTES;

version (Windows):
extern (Windows):

alias FIND_FIRST_EX_FLAGS = uint;
enum : uint
{
    FIND_FIRST_EX_CASE_SENSITIVE       = 0x00000001,
    FIND_FIRST_EX_LARGE_FETCH          = 0x00000002,
    FIND_FIRST_EX_ON_DISK_ENTRIES_ONLY = 0x00000004,
}

alias DEFINE_DOS_DEVICE_FLAGS = uint;
enum : uint
{
    DDD_RAW_TARGET_PATH       = 0x00000001,
    DDD_REMOVE_DEFINITION     = 0x00000002,
    DDD_EXACT_MATCH_ON_REMOVE = 0x00000004,
    DDD_NO_BROADCAST_SYSTEM   = 0x00000008,
    DDD_LUID_BROADCAST_DRIVE  = 0x00000010,
}

alias FILE_FLAGS_AND_ATTRIBUTES = uint;
enum : uint
{
    FILE_ATTRIBUTE_READONLY              = 0x00000001,
    FILE_ATTRIBUTE_HIDDEN                = 0x00000002,
    FILE_ATTRIBUTE_SYSTEM                = 0x00000004,
    FILE_ATTRIBUTE_DIRECTORY             = 0x00000010,
    FILE_ATTRIBUTE_ARCHIVE               = 0x00000020,
    FILE_ATTRIBUTE_DEVICE                = 0x00000040,
    FILE_ATTRIBUTE_NORMAL                = 0x00000080,
    FILE_ATTRIBUTE_TEMPORARY             = 0x00000100,
    FILE_ATTRIBUTE_SPARSE_FILE           = 0x00000200,
    FILE_ATTRIBUTE_REPARSE_POINT         = 0x00000400,
    FILE_ATTRIBUTE_COMPRESSED            = 0x00000800,
    FILE_ATTRIBUTE_OFFLINE               = 0x00001000,
    FILE_ATTRIBUTE_NOT_CONTENT_INDEXED   = 0x00002000,
    FILE_ATTRIBUTE_ENCRYPTED             = 0x00004000,
    FILE_ATTRIBUTE_INTEGRITY_STREAM      = 0x00008000,
    FILE_ATTRIBUTE_VIRTUAL               = 0x00010000,
    FILE_ATTRIBUTE_NO_SCRUB_DATA         = 0x00020000,
    FILE_ATTRIBUTE_EA                    = 0x00040000,
    FILE_ATTRIBUTE_PINNED                = 0x00080000,
    FILE_ATTRIBUTE_UNPINNED              = 0x00100000,
    FILE_ATTRIBUTE_RECALL_ON_OPEN        = 0x00040000,
    FILE_ATTRIBUTE_RECALL_ON_DATA_ACCESS = 0x00400000,
    FILE_FLAG_WRITE_THROUGH              = 0x80000000,
    FILE_FLAG_OVERLAPPED                 = 0x40000000,
    FILE_FLAG_NO_BUFFERING               = 0x20000000,
    FILE_FLAG_RANDOM_ACCESS              = 0x10000000,
    FILE_FLAG_SEQUENTIAL_SCAN            = 0x08000000,
    FILE_FLAG_DELETE_ON_CLOSE            = 0x04000000,
    FILE_FLAG_BACKUP_SEMANTICS           = 0x02000000,
    FILE_FLAG_POSIX_SEMANTICS            = 0x01000000,
    FILE_FLAG_SESSION_AWARE              = 0x00800000,
    FILE_FLAG_OPEN_REPARSE_POINT         = 0x00200000,
    FILE_FLAG_OPEN_NO_RECALL             = 0x00100000,
    FILE_FLAG_FIRST_PIPE_INSTANCE        = 0x00080000,
    PIPE_ACCESS_DUPLEX                   = 0x00000003,
    PIPE_ACCESS_INBOUND                  = 0x00000001,
    PIPE_ACCESS_OUTBOUND                 = 0x00000002,
    SECURITY_ANONYMOUS                   = 0x00000000,
    SECURITY_IDENTIFICATION              = 0x00010000,
    SECURITY_IMPERSONATION               = 0x00020000,
    SECURITY_DELEGATION                  = 0x00030000,
    SECURITY_CONTEXT_TRACKING            = 0x00040000,
    SECURITY_EFFECTIVE_ONLY              = 0x00080000,
    SECURITY_SQOS_PRESENT                = 0x00100000,
    SECURITY_VALID_SQOS_FLAGS            = 0x001f0000,
}

alias FILE_ACCESS_FLAGS = uint;
enum : uint
{
    FILE_READ_DATA            = 0x00000001,
    FILE_LIST_DIRECTORY       = 0x00000001,
    FILE_WRITE_DATA           = 0x00000002,
    FILE_ADD_FILE             = 0x00000002,
    FILE_APPEND_DATA          = 0x00000004,
    FILE_ADD_SUBDIRECTORY     = 0x00000004,
    FILE_CREATE_PIPE_INSTANCE = 0x00000004,
    FILE_READ_EA              = 0x00000008,
    FILE_WRITE_EA             = 0x00000010,
    FILE_EXECUTE              = 0x00000020,
    FILE_TRAVERSE             = 0x00000020,
    FILE_DELETE_CHILD         = 0x00000040,
    FILE_READ_ATTRIBUTES      = 0x00000080,
    FILE_WRITE_ATTRIBUTES     = 0x00000100,
    DELETE                    = 0x00010000,
    READ_CONTROL              = 0x00020000,
    WRITE_DAC                 = 0x00040000,
    WRITE_OWNER               = 0x00080000,
    SYNCHRONIZE               = 0x00100000,
    STANDARD_RIGHTS_REQUIRED  = 0x000f0000,
    STANDARD_RIGHTS_READ      = 0x00020000,
    STANDARD_RIGHTS_WRITE     = 0x00020000,
    STANDARD_RIGHTS_EXECUTE   = 0x00020000,
    STANDARD_RIGHTS_ALL       = 0x001f0000,
    SPECIFIC_RIGHTS_ALL       = 0x0000ffff,
    FILE_ALL_ACCESS           = 0x001f01ff,
    FILE_GENERIC_READ         = 0x00120089,
    FILE_GENERIC_WRITE        = 0x00120116,
    FILE_GENERIC_EXECUTE      = 0x001200a0,
}

uint SearchPathW(const(wchar)*, const(wchar)*, const(wchar)*, uint, PWSTR, PWSTR*);
uint SearchPathA(const(char)*, const(char)*, const(char)*, uint, PSTR, PSTR*);
int CompareFileTime(const(FILETIME)*, const(FILETIME)*);
BOOL CreateDirectoryA(const(char)*, SECURITY_ATTRIBUTES*);
BOOL CreateDirectoryW(const(wchar)*, SECURITY_ATTRIBUTES*);
HANDLE CreateFileA(const(char)*, FILE_ACCESS_FLAGS, FILE_SHARE_MODE, SECURITY_ATTRIBUTES*, FILE_CREATION_DISPOSITION, FILE_FLAGS_AND_ATTRIBUTES, HANDLE);
HANDLE CreateFileW(const(wchar)*, FILE_ACCESS_FLAGS, FILE_SHARE_MODE, SECURITY_ATTRIBUTES*, FILE_CREATION_DISPOSITION, FILE_FLAGS_AND_ATTRIBUTES, HANDLE);
BOOL DefineDosDeviceW(DEFINE_DOS_DEVICE_FLAGS, const(wchar)*, const(wchar)*);
BOOL DeleteFileA(const(char)*);
BOOL DeleteFileW(const(wchar)*);
BOOL DeleteVolumeMountPointW(const(wchar)*);
BOOL FileTimeToLocalFileTime(const(FILETIME)*, FILETIME*);
BOOL FindClose(FindFileHandle);
BOOL FindCloseChangeNotification(FindChangeNotificationHandle);
FindChangeNotificationHandle FindFirstChangeNotificationA(const(char)*, BOOL, FILE_NOTIFY_CHANGE);
FindChangeNotificationHandle FindFirstChangeNotificationW(const(wchar)*, BOOL, FILE_NOTIFY_CHANGE);
FindFileHandle FindFirstFileA(const(char)*, WIN32_FIND_DATAA*);
FindFileHandle FindFirstFileW(const(wchar)*, WIN32_FIND_DATAW*);
FindFileHandle FindFirstFileExA(const(char)*, FINDEX_INFO_LEVELS, void*, FINDEX_SEARCH_OPS, void*, FIND_FIRST_EX_FLAGS);
FindFileHandle FindFirstFileExW(const(wchar)*, FINDEX_INFO_LEVELS, void*, FINDEX_SEARCH_OPS, void*, FIND_FIRST_EX_FLAGS);
FindVolumeHandle FindFirstVolumeW(PWSTR, uint);
BOOL FindNextChangeNotification(FindChangeNotificationHandle);
BOOL FindNextFileA(FindFileHandle, WIN32_FIND_DATAA*);
BOOL FindNextFileW(FindFileHandle, WIN32_FIND_DATAW*);
BOOL FindNextVolumeW(FindVolumeHandle, PWSTR, uint);
BOOL FindVolumeClose(FindVolumeHandle);
BOOL FlushFileBuffers(HANDLE);
BOOL GetDiskFreeSpaceA(const(char)*, uint*, uint*, uint*, uint*);
BOOL GetDiskFreeSpaceW(const(wchar)*, uint*, uint*, uint*, uint*);
BOOL GetDiskFreeSpaceExA(const(char)*, ULARGE_INTEGER*, ULARGE_INTEGER*, ULARGE_INTEGER*);
BOOL GetDiskFreeSpaceExW(const(wchar)*, ULARGE_INTEGER*, ULARGE_INTEGER*, ULARGE_INTEGER*);
HRESULT GetDiskSpaceInformationA(const(char)*, DISK_SPACE_INFORMATION*);
HRESULT GetDiskSpaceInformationW(const(wchar)*, DISK_SPACE_INFORMATION*);
uint GetDriveTypeA(const(char)*);
uint GetDriveTypeW(const(wchar)*);
uint GetFileAttributesA(const(char)*);
uint GetFileAttributesW(const(wchar)*);
BOOL GetFileAttributesExA(const(char)*, GET_FILEEX_INFO_LEVELS, void*);
BOOL GetFileAttributesExW(const(wchar)*, GET_FILEEX_INFO_LEVELS, void*);
BOOL GetFileInformationByHandle(HANDLE, BY_HANDLE_FILE_INFORMATION*);
uint GetFileSize(HANDLE, uint*);
BOOL GetFileSizeEx(HANDLE, LARGE_INTEGER*);
uint GetFileType(HANDLE);
uint GetFinalPathNameByHandleA(HANDLE, PSTR, uint, FILE_NAME);
uint GetFinalPathNameByHandleW(HANDLE, PWSTR, uint, FILE_NAME);
BOOL GetFileTime(HANDLE, FILETIME*, FILETIME*, FILETIME*);
uint GetFullPathNameW(const(wchar)*, uint, PWSTR, PWSTR*);
uint GetFullPathNameA(const(char)*, uint, PSTR, PSTR*);
uint GetLogicalDrives();
uint GetLogicalDriveStringsW(uint, PWSTR);
uint GetLongPathNameA(const(char)*, PSTR, uint);
uint GetLongPathNameW(const(wchar)*, PWSTR, uint);
BOOL AreShortNamesEnabled(HANDLE, BOOL*);
uint GetShortPathNameW(const(wchar)*, PWSTR, uint);
uint GetTempFileNameW(const(wchar)*, const(wchar)*, uint, PWSTR);
BOOL GetVolumeInformationByHandleW(HANDLE, PWSTR, uint, uint*, uint*, uint*, PWSTR, uint);
BOOL GetVolumeInformationW(const(wchar)*, PWSTR, uint, uint*, uint*, uint*, PWSTR, uint);
BOOL GetVolumePathNameW(const(wchar)*, PWSTR, uint);
BOOL LocalFileTimeToFileTime(const(FILETIME)*, FILETIME*);
BOOL LockFile(HANDLE, uint, uint, uint, uint);
BOOL LockFileEx(HANDLE, LOCK_FILE_FLAGS, uint, uint, uint, OVERLAPPED*);
uint QueryDosDeviceW(const(wchar)*, PWSTR, uint);
BOOL ReadFile(HANDLE, void*, uint, uint*, OVERLAPPED*);
BOOL ReadFileEx(HANDLE, void*, uint, OVERLAPPED*, LPOVERLAPPED_COMPLETION_ROUTINE);
BOOL ReadFileScatter(HANDLE, FILE_SEGMENT_ELEMENT*, uint, uint*, OVERLAPPED*);
BOOL RemoveDirectoryA(const(char)*);
BOOL RemoveDirectoryW(const(wchar)*);
BOOL SetEndOfFile(HANDLE);
BOOL SetFileAttributesA(const(char)*, FILE_FLAGS_AND_ATTRIBUTES);
BOOL SetFileAttributesW(const(wchar)*, FILE_FLAGS_AND_ATTRIBUTES);
BOOL SetFileInformationByHandle(HANDLE, FILE_INFO_BY_HANDLE_CLASS, void*, uint);
uint SetFilePointer(HANDLE, int, int*, SET_FILE_POINTER_MOVE_METHOD);
BOOL SetFilePointerEx(HANDLE, LARGE_INTEGER, LARGE_INTEGER*, SET_FILE_POINTER_MOVE_METHOD);
BOOL SetFileTime(HANDLE, const(FILETIME)*, const(FILETIME)*, const(FILETIME)*);
BOOL SetFileValidData(HANDLE, long);
BOOL UnlockFile(HANDLE, uint, uint, uint, uint);
BOOL UnlockFileEx(HANDLE, uint, uint, uint, OVERLAPPED*);
BOOL WriteFile(HANDLE, const(void)*, uint, uint*, OVERLAPPED*);
BOOL WriteFileEx(HANDLE, const(void)*, uint, OVERLAPPED*, LPOVERLAPPED_COMPLETION_ROUTINE);
BOOL WriteFileGather(HANDLE, FILE_SEGMENT_ELEMENT*, uint, uint*, OVERLAPPED*);
uint GetTempPathW(uint, PWSTR);
BOOL GetVolumeNameForVolumeMountPointW(const(wchar)*, PWSTR, uint);
BOOL GetVolumePathNamesForVolumeNameW(const(wchar)*, PWSTR, uint, uint*);
HANDLE CreateFile2(const(wchar)*, FILE_ACCESS_FLAGS, FILE_SHARE_MODE, FILE_CREATION_DISPOSITION, CREATEFILE2_EXTENDED_PARAMETERS*);
BOOL SetFileIoOverlappedRange(HANDLE, ubyte*, uint);
uint GetCompressedFileSizeA(const(char)*, uint*);
uint GetCompressedFileSizeW(const(wchar)*, uint*);
FindStreamHandle FindFirstStreamW(const(wchar)*, STREAM_INFO_LEVELS, void*, uint);
BOOL FindNextStreamW(FindStreamHandle, void*);
BOOL AreFileApisANSI();
uint GetTempPathA(uint, PSTR);
FindFileNameHandle FindFirstFileNameW(const(wchar)*, uint, uint*, PWSTR);
BOOL FindNextFileNameW(FindFileNameHandle, uint*, PWSTR);
BOOL GetVolumeInformationA(const(char)*, PSTR, uint, uint*, uint*, uint*, PSTR, uint);
uint GetTempFileNameA(const(char)*, const(char)*, uint, PSTR);
void SetFileApisToOEM();
void SetFileApisToANSI();
uint GetTempPath2W(uint, PWSTR);
uint GetTempPath2A(uint, PSTR);
BOOL CopyFileFromAppW(const(wchar)*, const(wchar)*, BOOL);
BOOL CreateDirectoryFromAppW(const(wchar)*, SECURITY_ATTRIBUTES*);
HANDLE CreateFileFromAppW(const(wchar)*, uint, uint, SECURITY_ATTRIBUTES*, uint, uint, HANDLE);
HANDLE CreateFile2FromAppW(const(wchar)*, uint, uint, uint, CREATEFILE2_EXTENDED_PARAMETERS*);
BOOL DeleteFileFromAppW(const(wchar)*);
HANDLE FindFirstFileExFromAppW(const(wchar)*, FINDEX_INFO_LEVELS, void*, FINDEX_SEARCH_OPS, void*, uint);
BOOL GetFileAttributesExFromAppW(const(wchar)*, GET_FILEEX_INFO_LEVELS, void*);
BOOL MoveFileFromAppW(const(wchar)*, const(wchar)*);
BOOL RemoveDirectoryFromAppW(const(wchar)*);
BOOL ReplaceFileFromAppW(const(wchar)*, const(wchar)*, const(wchar)*, uint, void*, void*);
BOOL SetFileAttributesFromAppW(const(wchar)*, uint);
VER_FIND_FILE_STATUS VerFindFileA(VER_FIND_FILE_FLAGS, const(char)*, const(char)*, const(char)*, PSTR, uint*, PSTR, uint*);
VER_FIND_FILE_STATUS VerFindFileW(VER_FIND_FILE_FLAGS, const(wchar)*, const(wchar)*, const(wchar)*, PWSTR, uint*, PWSTR, uint*);
VER_INSTALL_FILE_STATUS VerInstallFileA(VER_INSTALL_FILE_FLAGS, const(char)*, const(char)*, const(char)*, const(char)*, const(char)*, PSTR, uint*);
VER_INSTALL_FILE_STATUS VerInstallFileW(VER_INSTALL_FILE_FLAGS, const(wchar)*, const(wchar)*, const(wchar)*, const(wchar)*, const(wchar)*, PWSTR, uint*);
uint GetFileVersionInfoSizeA(const(char)*, uint*);
uint GetFileVersionInfoSizeW(const(wchar)*, uint*);
BOOL GetFileVersionInfoA(const(char)*, uint, uint, void*);
BOOL GetFileVersionInfoW(const(wchar)*, uint, uint, void*);
uint GetFileVersionInfoSizeExA(GET_FILE_VERSION_INFO_FLAGS, const(char)*, uint*);
uint GetFileVersionInfoSizeExW(GET_FILE_VERSION_INFO_FLAGS, const(wchar)*, uint*);
BOOL GetFileVersionInfoExA(GET_FILE_VERSION_INFO_FLAGS, const(char)*, uint, uint, void*);
BOOL GetFileVersionInfoExW(GET_FILE_VERSION_INFO_FLAGS, const(wchar)*, uint, uint, void*);
uint VerLanguageNameA(uint, PSTR, uint);
uint VerLanguageNameW(uint, PWSTR, uint);
BOOL VerQueryValueA(const(void)*, const(char)*, void**, uint*);
BOOL VerQueryValueW(const(void)*, const(wchar)*, void**, uint*);
BOOLEAN LsnEqual(const(CLS_LSN)*, const(CLS_LSN)*);
BOOLEAN LsnLess(const(CLS_LSN)*, const(CLS_LSN)*);
BOOLEAN LsnGreater(const(CLS_LSN)*, const(CLS_LSN)*);
BOOLEAN LsnNull(const(CLS_LSN)*);
uint LsnContainer(const(CLS_LSN)*);
CLS_LSN LsnCreate(uint, uint, uint);
uint LsnBlockOffset(const(CLS_LSN)*);
uint LsnRecordSequence(const(CLS_LSN)*);
BOOLEAN LsnInvalid(const(CLS_LSN)*);
CLS_LSN LsnIncrement(CLS_LSN*);
HANDLE CreateLogFile(const(wchar)*, FILE_ACCESS_FLAGS, FILE_SHARE_MODE, SECURITY_ATTRIBUTES*, FILE_CREATION_DISPOSITION, FILE_FLAGS_AND_ATTRIBUTES);
BOOL DeleteLogByHandle(HANDLE);
BOOL DeleteLogFile(const(wchar)*, void*);
BOOL AddLogContainer(HANDLE, ulong*, PWSTR, void*);
BOOL AddLogContainerSet(HANDLE, ushort, ulong*, PWSTR*, void*);
BOOL RemoveLogContainer(HANDLE, PWSTR, BOOL, void*);
BOOL RemoveLogContainerSet(HANDLE, ushort, PWSTR*, BOOL, void*);
BOOL SetLogArchiveTail(HANDLE, CLS_LSN*, void*);
BOOL SetEndOfLog(HANDLE, CLS_LSN*, OVERLAPPED*);
BOOL TruncateLog(void*, CLS_LSN*, OVERLAPPED*);
BOOL CreateLogContainerScanContext(HANDLE, uint, uint, ubyte, CLS_SCAN_CONTEXT*, OVERLAPPED*);
BOOL ScanLogContainers(CLS_SCAN_CONTEXT*, ubyte, void*);
BOOL AlignReservedLog(void*, uint, long*, long*);
BOOL AllocReservedLog(void*, uint, long*);
BOOL FreeReservedLog(void*, uint, long*);
BOOL GetLogFileInformation(HANDLE, CLS_INFORMATION*, uint*);
BOOL SetLogArchiveMode(HANDLE, CLFS_LOG_ARCHIVE_MODE);
BOOL ReadLogRestartArea(void*, void**, uint*, CLS_LSN*, void**, OVERLAPPED*);
BOOL ReadPreviousLogRestartArea(void*, void**, uint*, CLS_LSN*, OVERLAPPED*);
BOOL WriteLogRestartArea(void*, void*, uint, CLS_LSN*, CLFS_FLAG, uint*, CLS_LSN*, OVERLAPPED*);
BOOL GetLogReservationInfo(void*, uint*, long*, long*);
BOOL AdvanceLogBase(void*, CLS_LSN*, uint, OVERLAPPED*);
BOOL CloseAndResetLogFile(HANDLE);
BOOL CreateLogMarshallingArea(HANDLE, CLFS_BLOCK_ALLOCATION, CLFS_BLOCK_DEALLOCATION, void*, uint, uint, uint, void**);
BOOL DeleteLogMarshallingArea(void*);
BOOL ReserveAndAppendLog(void*, CLS_WRITE_ENTRY*, uint, CLS_LSN*, CLS_LSN*, uint, long*, CLFS_FLAG, CLS_LSN*, OVERLAPPED*);
BOOL ReserveAndAppendLogAligned(void*, CLS_WRITE_ENTRY*, uint, uint, CLS_LSN*, CLS_LSN*, uint, long*, CLFS_FLAG, CLS_LSN*, OVERLAPPED*);
BOOL FlushLogBuffers(void*, OVERLAPPED*);
BOOL FlushLogToLsn(void*, CLS_LSN*, CLS_LSN*, OVERLAPPED*);
BOOL ReadLogRecord(void*, CLS_LSN*, CLFS_CONTEXT_MODE, void**, uint*, ubyte*, CLS_LSN*, CLS_LSN*, void**, OVERLAPPED*);
BOOL ReadNextLogRecord(void*, void**, uint*, ubyte*, CLS_LSN*, CLS_LSN*, CLS_LSN*, CLS_LSN*, OVERLAPPED*);
BOOL TerminateReadLog(void*);
BOOL PrepareLogArchive(HANDLE, PWSTR, uint, const(CLS_LSN)*, const(CLS_LSN)*, uint*, ulong*, ulong*, CLS_LSN*, CLS_LSN*, CLS_LSN*, void**);
BOOL ReadLogArchiveMetadata(void*, uint, uint, ubyte*, uint*);
BOOL GetNextLogArchiveExtent(void*, CLS_ARCHIVE_DESCRIPTOR*, uint, uint*);
BOOL TerminateLogArchive(void*);
BOOL ValidateLog(const(wchar)*, SECURITY_ATTRIBUTES*, CLS_INFORMATION*, uint*);
BOOL GetLogContainerName(HANDLE, uint, const(wchar)*, uint, uint*);
BOOL GetLogIoStatistics(HANDLE, void*, uint, CLFS_IOSTATS_CLASS, uint*);
BOOL RegisterManageableLogClient(HANDLE, LOG_MANAGEMENT_CALLBACKS*);
BOOL DeregisterManageableLogClient(HANDLE);
BOOL ReadLogNotification(HANDLE, CLFS_MGMT_NOTIFICATION*, OVERLAPPED*);
BOOL InstallLogPolicy(HANDLE, CLFS_MGMT_POLICY*);
BOOL RemoveLogPolicy(HANDLE, CLFS_MGMT_POLICY_TYPE);
BOOL QueryLogPolicy(HANDLE, CLFS_MGMT_POLICY_TYPE, CLFS_MGMT_POLICY*, uint*);
BOOL SetLogFileSizeWithPolicy(HANDLE, ulong*, ulong*);
BOOL HandleLogFull(HANDLE);
BOOL LogTailAdvanceFailure(HANDLE, uint);
BOOL RegisterForLogWriteNotification(HANDLE, uint, BOOL);
uint QueryUsersOnEncryptedFile(const(wchar)*, ENCRYPTION_CERTIFICATE_HASH_LIST**);
uint QueryRecoveryAgentsOnEncryptedFile(const(wchar)*, ENCRYPTION_CERTIFICATE_HASH_LIST**);
uint RemoveUsersFromEncryptedFile(const(wchar)*, ENCRYPTION_CERTIFICATE_HASH_LIST*);
uint AddUsersToEncryptedFile(const(wchar)*, ENCRYPTION_CERTIFICATE_LIST*);
uint SetUserFileEncryptionKey(ENCRYPTION_CERTIFICATE*);
uint SetUserFileEncryptionKeyEx(ENCRYPTION_CERTIFICATE*, uint, uint, void*);
void FreeEncryptionCertificateHashList(ENCRYPTION_CERTIFICATE_HASH_LIST*);
BOOL EncryptionDisable(const(wchar)*, BOOL);
uint DuplicateEncryptionInfoFile(const(wchar)*, const(wchar)*, uint, uint, const(SECURITY_ATTRIBUTES)*);
uint GetEncryptedFileMetadata(const(wchar)*, uint*, ubyte**);
uint SetEncryptedFileMetadata(const(wchar)*, ubyte*, ubyte*, ENCRYPTION_CERTIFICATE_HASH*, uint, ENCRYPTION_CERTIFICATE_HASH_LIST*);
void FreeEncryptedFileMetadata(ubyte*);
int LZStart();
void LZDone();
int CopyLZFile(int, int);
int LZCopy(int, int);
int LZInit(int);
int GetExpandedNameA(PSTR, PSTR);
int GetExpandedNameW(PWSTR, PWSTR);
int LZOpenFileA(PSTR, OFSTRUCT*, LZOPENFILE_STYLE);
int LZOpenFileW(PWSTR, OFSTRUCT*, LZOPENFILE_STYLE);
int LZSeek(int, int, int);
int LZRead(int, PSTR, int);
void LZClose(int);
BOOL WofShouldCompressBinaries(const(wchar)*, uint*);
HRESULT WofGetDriverVersion(HANDLE, uint, uint*);
HRESULT WofSetFileDataLocation(HANDLE, uint, void*, uint);
HRESULT WofIsExternalFile(const(wchar)*, BOOL*, uint*, void*, uint*);
HRESULT WofEnumEntries(const(wchar)*, uint, WofEnumEntryProc, void*);
HRESULT WofWimAddEntry(const(wchar)*, const(wchar)*, uint, uint, LARGE_INTEGER*);
HRESULT WofWimEnumFiles(const(wchar)*, LARGE_INTEGER, WofEnumFilesProc, void*);
HRESULT WofWimSuspendEntry(const(wchar)*, LARGE_INTEGER);
HRESULT WofWimRemoveEntry(const(wchar)*, LARGE_INTEGER);
HRESULT WofWimUpdateEntry(const(wchar)*, LARGE_INTEGER, const(wchar)*);
HRESULT WofFileEnumFiles(const(wchar)*, uint, WofEnumFilesProc, void*);
BOOL TxfLogCreateFileReadContext(const(wchar)*, CLS_LSN, CLS_LSN, TXF_ID*, void**);
BOOL TxfLogCreateRangeReadContext(const(wchar)*, CLS_LSN, CLS_LSN, LARGE_INTEGER*, LARGE_INTEGER*, uint, void**);
BOOL TxfLogDestroyReadContext(void*);
BOOL TxfLogReadRecords(void*, uint, void*, uint*, uint*);
BOOL TxfReadMetadataInfo(HANDLE, TXF_ID*, CLS_LSN*, uint*, GUID*);
BOOL TxfLogRecordGetFileName(void*, uint, PWSTR, uint*, TXF_ID*);
BOOL TxfLogRecordGetGenericType(void*, uint, uint*, LARGE_INTEGER*);
void TxfSetThreadMiniVersionForCreate(ushort);
void TxfGetThreadMiniVersionForCreate(ushort*);
HANDLE CreateTransaction(SECURITY_ATTRIBUTES*, GUID*, uint, uint, uint, uint, PWSTR);
HANDLE OpenTransaction(uint, GUID*);
BOOL CommitTransaction(HANDLE);
BOOL CommitTransactionAsync(HANDLE);
BOOL RollbackTransaction(HANDLE);
BOOL RollbackTransactionAsync(HANDLE);
BOOL GetTransactionId(HANDLE, GUID*);
BOOL GetTransactionInformation(HANDLE, uint*, uint*, uint*, uint*, uint, PWSTR);
BOOL SetTransactionInformation(HANDLE, uint, uint, uint, PWSTR);
HANDLE CreateTransactionManager(SECURITY_ATTRIBUTES*, PWSTR, uint, uint);
HANDLE OpenTransactionManager(PWSTR, uint, uint);
HANDLE OpenTransactionManagerById(GUID*, uint, uint);
BOOL RenameTransactionManager(PWSTR, GUID*);
BOOL RollforwardTransactionManager(HANDLE, LARGE_INTEGER*);
BOOL RecoverTransactionManager(HANDLE);
BOOL GetCurrentClockTransactionManager(HANDLE, LARGE_INTEGER*);
BOOL GetTransactionManagerId(HANDLE, GUID*);
HANDLE CreateResourceManager(SECURITY_ATTRIBUTES*, GUID*, uint, HANDLE, PWSTR);
HANDLE OpenResourceManager(uint, HANDLE, GUID*);
BOOL RecoverResourceManager(HANDLE);
BOOL GetNotificationResourceManager(HANDLE, TRANSACTION_NOTIFICATION*, uint, uint, uint*);
BOOL GetNotificationResourceManagerAsync(HANDLE, TRANSACTION_NOTIFICATION*, uint, uint*, OVERLAPPED*);
BOOL SetResourceManagerCompletionPort(HANDLE, HANDLE, ulong);
HANDLE CreateEnlistment(SECURITY_ATTRIBUTES*, HANDLE, HANDLE, uint, uint, void*);
HANDLE OpenEnlistment(uint, HANDLE, GUID*);
BOOL RecoverEnlistment(HANDLE, void*);
BOOL GetEnlistmentRecoveryInformation(HANDLE, uint, void*, uint*);
BOOL GetEnlistmentId(HANDLE, GUID*);
BOOL SetEnlistmentRecoveryInformation(HANDLE, uint, void*);
BOOL PrepareEnlistment(HANDLE, LARGE_INTEGER*);
BOOL PrePrepareEnlistment(HANDLE, LARGE_INTEGER*);
BOOL CommitEnlistment(HANDLE, LARGE_INTEGER*);
BOOL RollbackEnlistment(HANDLE, LARGE_INTEGER*);
BOOL PrePrepareComplete(HANDLE, LARGE_INTEGER*);
BOOL PrepareComplete(HANDLE, LARGE_INTEGER*);
BOOL ReadOnlyEnlistment(HANDLE, LARGE_INTEGER*);
BOOL CommitComplete(HANDLE, LARGE_INTEGER*);
BOOL RollbackComplete(HANDLE, LARGE_INTEGER*);
BOOL SinglePhaseReject(HANDLE, LARGE_INTEGER*);
uint NetShareAdd(PWSTR, uint, ubyte*, uint*);
uint NetShareEnum(PWSTR, uint, ubyte**, uint, uint*, uint*, uint*);
uint NetShareEnumSticky(PWSTR, uint, ubyte**, uint, uint*, uint*, uint*);
uint NetShareGetInfo(PWSTR, PWSTR, uint, ubyte**);
uint NetShareSetInfo(PWSTR, PWSTR, uint, ubyte*, uint*);
uint NetShareDel(PWSTR, PWSTR, uint);
uint NetShareDelSticky(PWSTR, PWSTR, uint);
uint NetShareCheck(PWSTR, PWSTR, uint*);
uint NetShareDelEx(PWSTR, uint, ubyte*);
uint NetServerAliasAdd(PWSTR, uint, ubyte*);
uint NetServerAliasDel(PWSTR, uint, ubyte*);
uint NetServerAliasEnum(PWSTR, uint, ubyte**, uint, uint*, uint*, uint*);
uint NetSessionEnum(PWSTR, PWSTR, PWSTR, uint, ubyte**, uint, uint*, uint*, uint*);
uint NetSessionDel(PWSTR, PWSTR, PWSTR);
uint NetSessionGetInfo(PWSTR, PWSTR, PWSTR, uint, ubyte**);
uint NetConnectionEnum(PWSTR, PWSTR, uint, ubyte**, uint, uint*, uint*, uint*);
uint NetFileClose(PWSTR, uint);
uint NetFileEnum(PWSTR, PWSTR, PWSTR, uint, ubyte**, uint, uint*, uint*, ulong*);
uint NetFileGetInfo(PWSTR, uint, uint, ubyte**);
uint NetStatisticsGet(byte*, byte*, uint, uint, ubyte**);
HRESULT QueryIoRingCapabilities(IORING_CAPABILITIES*);
BOOL IsIoRingOpSupported(HIORING__*, IORING_OP_CODE);
HRESULT CreateIoRing(IORING_VERSION, IORING_CREATE_FLAGS, uint, uint, HIORING__**);
HRESULT GetIoRingInfo(HIORING__*, IORING_INFO*);
HRESULT SubmitIoRing(HIORING__*, uint, uint, uint*);
HRESULT CloseIoRing(HIORING__*);
HRESULT PopIoRingCompletion(HIORING__*, IORING_CQE*);
HRESULT SetIoRingCompletionEvent(HIORING__*, HANDLE);
HRESULT BuildIoRingCancelRequest(HIORING__*, IORING_HANDLE_REF, ulong, ulong);
HRESULT BuildIoRingReadFile(HIORING__*, IORING_HANDLE_REF, IORING_BUFFER_REF, uint, ulong, ulong, IORING_SQE_FLAGS);
HRESULT BuildIoRingRegisterFileHandles(HIORING__*, uint, const(HANDLE)*, ulong);
HRESULT BuildIoRingRegisterBuffers(HIORING__*, uint, const(IORING_BUFFER_INFO)*, ulong);
BOOLEAN Wow64EnableWow64FsRedirection(BOOLEAN);
BOOL Wow64DisableWow64FsRedirection(void**);
BOOL Wow64RevertWow64FsRedirection(void*);
BOOL GetBinaryTypeA(const(char)*, uint*);
BOOL GetBinaryTypeW(const(wchar)*, uint*);
uint GetShortPathNameA(const(char)*, PSTR, uint);
uint GetLongPathNameTransactedA(const(char)*, PSTR, uint, HANDLE);
uint GetLongPathNameTransactedW(const(wchar)*, PWSTR, uint, HANDLE);
BOOL SetFileCompletionNotificationModes(HANDLE, ubyte);
BOOL SetFileShortNameA(HANDLE, const(char)*);
BOOL SetFileShortNameW(HANDLE, const(wchar)*);
uint SetTapePosition(HANDLE, TAPE_POSITION_METHOD, uint, uint, uint, BOOL);
uint GetTapePosition(HANDLE, TAPE_POSITION_TYPE, uint*, uint*, uint*);
uint PrepareTape(HANDLE, PREPARE_TAPE_OPERATION, BOOL);
uint EraseTape(HANDLE, ERASE_TAPE_TYPE, BOOL);
uint CreateTapePartition(HANDLE, CREATE_TAPE_PARTITION_METHOD, uint, uint);
uint WriteTapemark(HANDLE, TAPEMARK_TYPE, uint, BOOL);
uint GetTapeStatus(HANDLE);
uint GetTapeParameters(HANDLE, GET_TAPE_DRIVE_PARAMETERS_OPERATION, uint*, void*);
uint SetTapeParameters(HANDLE, TAPE_INFORMATION_TYPE, void*);
BOOL EncryptFileA(const(char)*);
BOOL EncryptFileW(const(wchar)*);
BOOL DecryptFileA(const(char)*, uint);
BOOL DecryptFileW(const(wchar)*, uint);
BOOL FileEncryptionStatusA(const(char)*, uint*);
BOOL FileEncryptionStatusW(const(wchar)*, uint*);
uint OpenEncryptedFileRawA(const(char)*, uint, void**);
uint OpenEncryptedFileRawW(const(wchar)*, uint, void**);
uint ReadEncryptedFileRaw(PFE_EXPORT_FUNC, void*, void*);
uint WriteEncryptedFileRaw(PFE_IMPORT_FUNC, void*, void*);
void CloseEncryptedFileRaw(void*);
int OpenFile(const(char)*, OFSTRUCT*, LZOPENFILE_STYLE);
BOOL BackupRead(HANDLE, ubyte*, uint, uint*, BOOL, BOOL, void**);
BOOL BackupSeek(HANDLE, uint, uint, uint*, uint*, void**);
BOOL BackupWrite(HANDLE, ubyte*, uint, uint*, BOOL, BOOL, void**);
uint GetLogicalDriveStringsA(uint, PSTR);
BOOL SetSearchPathMode(uint);
BOOL CreateDirectoryExA(const(char)*, const(char)*, SECURITY_ATTRIBUTES*);
BOOL CreateDirectoryExW(const(wchar)*, const(wchar)*, SECURITY_ATTRIBUTES*);
BOOL CreateDirectoryTransactedA(const(char)*, const(char)*, SECURITY_ATTRIBUTES*, HANDLE);
BOOL CreateDirectoryTransactedW(const(wchar)*, const(wchar)*, SECURITY_ATTRIBUTES*, HANDLE);
BOOL RemoveDirectoryTransactedA(const(char)*, HANDLE);
BOOL RemoveDirectoryTransactedW(const(wchar)*, HANDLE);
uint GetFullPathNameTransactedA(const(char)*, uint, PSTR, PSTR*, HANDLE);
uint GetFullPathNameTransactedW(const(wchar)*, uint, PWSTR, PWSTR*, HANDLE);
BOOL DefineDosDeviceA(DEFINE_DOS_DEVICE_FLAGS, const(char)*, const(char)*);
uint QueryDosDeviceA(const(char)*, PSTR, uint);
HANDLE CreateFileTransactedA(const(char)*, uint, FILE_SHARE_MODE, SECURITY_ATTRIBUTES*, FILE_CREATION_DISPOSITION, FILE_FLAGS_AND_ATTRIBUTES, HANDLE, HANDLE, TXFS_MINIVERSION*, void*);
HANDLE CreateFileTransactedW(const(wchar)*, uint, FILE_SHARE_MODE, SECURITY_ATTRIBUTES*, FILE_CREATION_DISPOSITION, FILE_FLAGS_AND_ATTRIBUTES, HANDLE, HANDLE, TXFS_MINIVERSION*, void*);
HANDLE ReOpenFile(HANDLE, FILE_ACCESS_FLAGS, FILE_SHARE_MODE, FILE_FLAGS_AND_ATTRIBUTES);
BOOL SetFileAttributesTransactedA(const(char)*, uint, HANDLE);
BOOL SetFileAttributesTransactedW(const(wchar)*, uint, HANDLE);
BOOL GetFileAttributesTransactedA(const(char)*, GET_FILEEX_INFO_LEVELS, void*, HANDLE);
BOOL GetFileAttributesTransactedW(const(wchar)*, GET_FILEEX_INFO_LEVELS, void*, HANDLE);
uint GetCompressedFileSizeTransactedA(const(char)*, uint*, HANDLE);
uint GetCompressedFileSizeTransactedW(const(wchar)*, uint*, HANDLE);
BOOL DeleteFileTransactedA(const(char)*, HANDLE);
BOOL DeleteFileTransactedW(const(wchar)*, HANDLE);
BOOL CheckNameLegalDOS8Dot3A(const(char)*, PSTR, uint, BOOL*, BOOL*);
BOOL CheckNameLegalDOS8Dot3W(const(wchar)*, PSTR, uint, BOOL*, BOOL*);
FindFileHandle FindFirstFileTransactedA(const(char)*, FINDEX_INFO_LEVELS, void*, FINDEX_SEARCH_OPS, void*, uint, HANDLE);
FindFileHandle FindFirstFileTransactedW(const(wchar)*, FINDEX_INFO_LEVELS, void*, FINDEX_SEARCH_OPS, void*, uint, HANDLE);
BOOL CopyFileA(const(char)*, const(char)*, BOOL);
BOOL CopyFileW(const(wchar)*, const(wchar)*, BOOL);
BOOL CopyFileExA(const(char)*, const(char)*, LPPROGRESS_ROUTINE, void*, int*, uint);
BOOL CopyFileExW(const(wchar)*, const(wchar)*, LPPROGRESS_ROUTINE, void*, int*, uint);
BOOL CopyFileTransactedA(const(char)*, const(char)*, LPPROGRESS_ROUTINE, void*, int*, uint, HANDLE);
BOOL CopyFileTransactedW(const(wchar)*, const(wchar)*, LPPROGRESS_ROUTINE, void*, int*, uint, HANDLE);
HRESULT CopyFile2(const(wchar)*, const(wchar)*, COPYFILE2_EXTENDED_PARAMETERS*);
BOOL MoveFileA(const(char)*, const(char)*);
BOOL MoveFileW(const(wchar)*, const(wchar)*);
BOOL MoveFileExA(const(char)*, const(char)*, MOVE_FILE_FLAGS);
BOOL MoveFileExW(const(wchar)*, const(wchar)*, MOVE_FILE_FLAGS);
BOOL MoveFileWithProgressA(const(char)*, const(char)*, LPPROGRESS_ROUTINE, void*, MOVE_FILE_FLAGS);
BOOL MoveFileWithProgressW(const(wchar)*, const(wchar)*, LPPROGRESS_ROUTINE, void*, MOVE_FILE_FLAGS);
BOOL MoveFileTransactedA(const(char)*, const(char)*, LPPROGRESS_ROUTINE, void*, MOVE_FILE_FLAGS, HANDLE);
BOOL MoveFileTransactedW(const(wchar)*, const(wchar)*, LPPROGRESS_ROUTINE, void*, MOVE_FILE_FLAGS, HANDLE);
BOOL ReplaceFileA(const(char)*, const(char)*, const(char)*, REPLACE_FILE_FLAGS, void*, void*);
BOOL ReplaceFileW(const(wchar)*, const(wchar)*, const(wchar)*, REPLACE_FILE_FLAGS, void*, void*);
BOOL CreateHardLinkA(const(char)*, const(char)*, SECURITY_ATTRIBUTES*);
BOOL CreateHardLinkW(const(wchar)*, const(wchar)*, SECURITY_ATTRIBUTES*);
BOOL CreateHardLinkTransactedA(const(char)*, const(char)*, SECURITY_ATTRIBUTES*, HANDLE);
BOOL CreateHardLinkTransactedW(const(wchar)*, const(wchar)*, SECURITY_ATTRIBUTES*, HANDLE);
FindStreamHandle FindFirstStreamTransactedW(const(wchar)*, STREAM_INFO_LEVELS, void*, uint, HANDLE);
FindFileNameHandle FindFirstFileNameTransactedW(const(wchar)*, uint, uint*, PWSTR, HANDLE);
BOOL SetVolumeLabelA(const(char)*, const(char)*);
BOOL SetVolumeLabelW(const(wchar)*, const(wchar)*);
BOOL SetFileBandwidthReservation(HANDLE, uint, uint, BOOL, uint*, uint*);
BOOL GetFileBandwidthReservation(HANDLE, uint*, uint*, int*, uint*, uint*);
BOOL ReadDirectoryChangesW(HANDLE, void*, uint, BOOL, FILE_NOTIFY_CHANGE, uint*, OVERLAPPED*, LPOVERLAPPED_COMPLETION_ROUTINE);
BOOL ReadDirectoryChangesExW(HANDLE, void*, uint, BOOL, FILE_NOTIFY_CHANGE, uint*, OVERLAPPED*, LPOVERLAPPED_COMPLETION_ROUTINE, READ_DIRECTORY_NOTIFY_INFORMATION_CLASS);
FindVolumeHandle FindFirstVolumeA(PSTR, uint);
BOOL FindNextVolumeA(FindVolumeHandle, PSTR, uint);
FindVolumeMointPointHandle FindFirstVolumeMountPointA(const(char)*, PSTR, uint);
FindVolumeMointPointHandle FindFirstVolumeMountPointW(const(wchar)*, PWSTR, uint);
BOOL FindNextVolumeMountPointA(FindVolumeMointPointHandle, PSTR, uint);
BOOL FindNextVolumeMountPointW(FindVolumeMointPointHandle, PWSTR, uint);
BOOL FindVolumeMountPointClose(FindVolumeMointPointHandle);
BOOL SetVolumeMountPointA(const(char)*, const(char)*);
BOOL SetVolumeMountPointW(const(wchar)*, const(wchar)*);
BOOL DeleteVolumeMountPointA(const(char)*);
BOOL GetVolumeNameForVolumeMountPointA(const(char)*, PSTR, uint);
BOOL GetVolumePathNameA(const(char)*, PSTR, uint);
BOOL GetVolumePathNamesForVolumeNameA(const(char)*, PSTR, uint, uint*);
BOOL GetFileInformationByHandleEx(HANDLE, FILE_INFO_BY_HANDLE_CLASS, void*, uint);
HANDLE OpenFileById(HANDLE, FILE_ID_DESCRIPTOR*, FILE_ACCESS_FLAGS, FILE_SHARE_MODE, SECURITY_ATTRIBUTES*, FILE_FLAGS_AND_ATTRIBUTES);
BOOLEAN CreateSymbolicLinkA(const(char)*, const(char)*, SYMBOLIC_LINK_FLAGS);
BOOLEAN CreateSymbolicLinkW(const(wchar)*, const(wchar)*, SYMBOLIC_LINK_FLAGS);
BOOLEAN CreateSymbolicLinkTransactedA(const(char)*, const(char)*, SYMBOLIC_LINK_FLAGS, HANDLE);
BOOLEAN CreateSymbolicLinkTransactedW(const(wchar)*, const(wchar)*, SYMBOLIC_LINK_FLAGS, HANDLE);
NTSTATUS NtCreateFile(HANDLE*, uint, OBJECT_ATTRIBUTES*, IO_STATUS_BLOCK*, LARGE_INTEGER*, uint, FILE_SHARE_MODE, NT_CREATE_FILE_DISPOSITION, uint, void*, uint);
enum MAXIMUM_REPARSE_DATA_BUFFER_SIZE = 0x00004000;
enum EA_CONTAINER_NAME = "ContainerName";
enum EA_CONTAINER_SIZE = "ContainerSize";
enum CLFS_BASELOG_EXTENSION = ".blf";
enum CLFS_FLAG_REENTRANT_FILE_SYSTEM = 0x00000008;
enum CLFS_FLAG_NON_REENTRANT_FILTER = 0x00000010;
enum CLFS_FLAG_REENTRANT_FILTER = 0x00000020;
enum CLFS_FLAG_IGNORE_SHARE_ACCESS = 0x00000040;
enum CLFS_FLAG_READ_IN_PROGRESS = 0x00000080;
enum CLFS_FLAG_MINIFILTER_LEVEL = 0x00000100;
enum CLFS_FLAG_HIDDEN_SYSTEM_LOG = 0x00000200;
enum CLFS_MARSHALLING_FLAG_NONE = 0x00000000;
enum CLFS_MARSHALLING_FLAG_DISABLE_BUFF_INIT = 0x00000001;
enum CLFS_FLAG_FILTER_INTERMEDIATE_LEVEL = 0x00000010;
enum CLFS_FLAG_FILTER_TOP_LEVEL = 0x00000020;
enum CLFS_CONTAINER_STREAM_PREFIX = "%BLF%:";
enum CLFS_CONTAINER_RELATIVE_PREFIX = "%BLF%\\";
enum TRANSACTION_MANAGER_VOLATILE = 0x00000001;
enum TRANSACTION_MANAGER_COMMIT_DEFAULT = 0x00000000;
enum TRANSACTION_MANAGER_COMMIT_SYSTEM_VOLUME = 0x00000002;
enum TRANSACTION_MANAGER_COMMIT_SYSTEM_HIVES = 0x00000004;
enum TRANSACTION_MANAGER_COMMIT_LOWEST = 0x00000008;
enum TRANSACTION_MANAGER_CORRUPT_FOR_RECOVERY = 0x00000010;
enum TRANSACTION_MANAGER_CORRUPT_FOR_PROGRESS = 0x00000020;
enum TRANSACTION_MANAGER_MAXIMUM_OPTION = 0x0000003f;
enum TRANSACTION_DO_NOT_PROMOTE = 0x00000001;
enum TRANSACTION_MAXIMUM_OPTION = 0x00000001;
enum RESOURCE_MANAGER_VOLATILE = 0x00000001;
enum RESOURCE_MANAGER_COMMUNICATION = 0x00000002;
enum RESOURCE_MANAGER_MAXIMUM_OPTION = 0x00000003;
enum CRM_PROTOCOL_EXPLICIT_MARSHAL_ONLY = 0x00000001;
enum CRM_PROTOCOL_DYNAMIC_MARSHAL_INFO = 0x00000002;
enum CRM_PROTOCOL_MAXIMUM_OPTION = 0x00000003;
enum ENLISTMENT_SUPERIOR = 0x00000001;
enum ENLISTMENT_MAXIMUM_OPTION = 0x00000001;
enum TRANSACTION_NOTIFY_MASK = 0x3fffffff;
enum TRANSACTION_NOTIFY_PREPREPARE = 0x00000001;
enum TRANSACTION_NOTIFY_PREPARE = 0x00000002;
enum TRANSACTION_NOTIFY_COMMIT = 0x00000004;
enum TRANSACTION_NOTIFY_ROLLBACK = 0x00000008;
enum TRANSACTION_NOTIFY_PREPREPARE_COMPLETE = 0x00000010;
enum TRANSACTION_NOTIFY_PREPARE_COMPLETE = 0x00000020;
enum TRANSACTION_NOTIFY_COMMIT_COMPLETE = 0x00000040;
enum TRANSACTION_NOTIFY_ROLLBACK_COMPLETE = 0x00000080;
enum TRANSACTION_NOTIFY_RECOVER = 0x00000100;
enum TRANSACTION_NOTIFY_SINGLE_PHASE_COMMIT = 0x00000200;
enum TRANSACTION_NOTIFY_DELEGATE_COMMIT = 0x00000400;
enum TRANSACTION_NOTIFY_RECOVER_QUERY = 0x00000800;
enum TRANSACTION_NOTIFY_ENLIST_PREPREPARE = 0x00001000;
enum TRANSACTION_NOTIFY_LAST_RECOVER = 0x00002000;
enum TRANSACTION_NOTIFY_INDOUBT = 0x00004000;
enum TRANSACTION_NOTIFY_PROPAGATE_PULL = 0x00008000;
enum TRANSACTION_NOTIFY_PROPAGATE_PUSH = 0x00010000;
enum TRANSACTION_NOTIFY_MARSHAL = 0x00020000;
enum TRANSACTION_NOTIFY_ENLIST_MASK = 0x00040000;
enum TRANSACTION_NOTIFY_RM_DISCONNECTED = 0x01000000;
enum TRANSACTION_NOTIFY_TM_ONLINE = 0x02000000;
enum TRANSACTION_NOTIFY_COMMIT_REQUEST = 0x04000000;
enum TRANSACTION_NOTIFY_PROMOTE = 0x08000000;
enum TRANSACTION_NOTIFY_PROMOTE_NEW = 0x10000000;
enum TRANSACTION_NOTIFY_REQUEST_OUTCOME = 0x20000000;
enum TRANSACTION_NOTIFY_COMMIT_FINALIZE = 0x40000000;
enum TRANSACTIONMANAGER_OBJECT_PATH = "\\TransactionManager\\";
enum TRANSACTION_OBJECT_PATH = "\\Transaction\\";
enum ENLISTMENT_OBJECT_PATH = "\\Enlistment\\";
enum RESOURCE_MANAGER_OBJECT_PATH = "\\ResourceManager\\";
enum TRANSACTION_NOTIFICATION_TM_ONLINE_FLAG_IS_CLUSTERED = 0x00000001;
enum KTM_MARSHAL_BLOB_VERSION_MAJOR = 0x00000001;
enum KTM_MARSHAL_BLOB_VERSION_MINOR = 0x00000001;
enum MAX_TRANSACTION_DESCRIPTION_LENGTH = 0x00000040;
enum MAX_RESOURCEMANAGER_DESCRIPTION_LENGTH = 0x00000040;
enum IOCTL_VOLUME_BASE = 0x00000056;
enum IOCTL_VOLUME_GET_VOLUME_DISK_EXTENTS = 0x00560000;
enum IOCTL_VOLUME_ONLINE = 0x0056c008;
enum IOCTL_VOLUME_OFFLINE = 0x0056c00c;
enum IOCTL_VOLUME_IS_CLUSTERED = 0x00560030;
enum IOCTL_VOLUME_GET_GPT_ATTRIBUTES = 0x00560038;
enum IOCTL_VOLUME_SUPPORTS_ONLINE_OFFLINE = 0x00560004;
enum IOCTL_VOLUME_IS_OFFLINE = 0x00560010;
enum IOCTL_VOLUME_IS_IO_CAPABLE = 0x00560014;
enum IOCTL_VOLUME_QUERY_FAILOVER_SET = 0x00560018;
enum IOCTL_VOLUME_QUERY_VOLUME_NUMBER = 0x0056001c;
enum IOCTL_VOLUME_LOGICAL_TO_PHYSICAL = 0x00560020;
enum IOCTL_VOLUME_PHYSICAL_TO_LOGICAL = 0x00560024;
enum IOCTL_VOLUME_IS_PARTITION = 0x00560028;
enum IOCTL_VOLUME_READ_PLEX = 0x0056402e;
enum IOCTL_VOLUME_SET_GPT_ATTRIBUTES = 0x00560034;
enum IOCTL_VOLUME_GET_BC_PROPERTIES = 0x0056403c;
enum IOCTL_VOLUME_ALLOCATE_BC_STREAM = 0x0056c040;
enum IOCTL_VOLUME_FREE_BC_STREAM = 0x0056c044;
enum IOCTL_VOLUME_BC_VERSION = 0x00000001;
enum IOCTL_VOLUME_IS_DYNAMIC = 0x00560048;
enum IOCTL_VOLUME_PREPARE_FOR_CRITICAL_IO = 0x0056c04c;
enum IOCTL_VOLUME_QUERY_ALLOCATION_HINT = 0x00564052;
enum IOCTL_VOLUME_UPDATE_PROPERTIES = 0x00560054;
enum IOCTL_VOLUME_QUERY_MINIMUM_SHRINK_SIZE = 0x00564058;
enum IOCTL_VOLUME_PREPARE_FOR_SHRINK = 0x0056c05c;
enum IOCTL_VOLUME_IS_CSV = 0x00560060;
enum IOCTL_VOLUME_POST_ONLINE = 0x0056c064;
enum IOCTL_VOLUME_GET_CSVBLOCKCACHE_CALLBACK = 0x0056c068;
enum CSV_BLOCK_CACHE_CALLBACK_VERSION = 0x00000001;
enum CSV_BLOCK_AND_FILE_CACHE_CALLBACK_VERSION = 0x00000002;
enum PARTITION_BASIC_DATA_GUID = GUID(0xebd0a0a2, 0xb9e5, 0x4433, [0x87, 0xc0, 0x68, 0xb6, 0xb7, 0x26, 0x99, 0xc7]);
enum PARTITION_BSP_GUID = GUID(0x57434f53, 0x4df9, 0x45b9, [0x8e, 0x9e, 0x23, 0x70, 0xf0, 0x6, 0x45, 0x7c]);
enum PARTITION_CLUSTER_GUID = GUID(0xdb97dba9, 0x840, 0x4bae, [0x97, 0xf0, 0xff, 0xb9, 0xa3, 0x27, 0xc7, 0xe1]);
enum PARTITION_DPP_GUID = GUID(0x57434f53, 0x94cb, 0x43f0, [0xa5, 0x33, 0xd7, 0x3c, 0x10, 0xcf, 0xa5, 0x7d]);
enum PARTITION_ENTRY_UNUSED_GUID = GUID(0x0, 0x0, 0x0, [0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0]);
enum PARTITION_LDM_DATA_GUID = GUID(0xaf9b60a0, 0x1431, 0x4f62, [0xbc, 0x68, 0x33, 0x11, 0x71, 0x4a, 0x69, 0xad]);
enum PARTITION_LDM_METADATA_GUID = GUID(0x5808c8aa, 0x7e8f, 0x42e0, [0x85, 0xd2, 0xe1, 0xe9, 0x4, 0x34, 0xcf, 0xb3]);
enum PARTITION_LEGACY_BL_GUID = GUID(0x424ca0e2, 0x7cb2, 0x4fb9, [0x81, 0x43, 0xc5, 0x2a, 0x99, 0x39, 0x8b, 0xc6]);
enum PARTITION_LEGACY_BL_GUID_BACKUP = GUID(0x424c3e6c, 0xd79f, 0x49cb, [0x93, 0x5d, 0x36, 0xd7, 0x14, 0x67, 0xa2, 0x88]);
enum PARTITION_MAIN_OS_GUID = GUID(0x57434f53, 0x8f45, 0x405e, [0x8a, 0x23, 0x18, 0x6d, 0x8a, 0x43, 0x30, 0xd3]);
enum PARTITION_MSFT_RECOVERY_GUID = GUID(0xde94bba4, 0x6d1, 0x4d40, [0xa1, 0x6a, 0xbf, 0xd5, 0x1, 0x79, 0xd6, 0xac]);
enum PARTITION_MSFT_RESERVED_GUID = GUID(0xe3c9e316, 0xb5c, 0x4db8, [0x81, 0x7d, 0xf9, 0x2d, 0xf0, 0x2, 0x15, 0xae]);
enum PARTITION_MSFT_SNAPSHOT_GUID = GUID(0xcaddebf1, 0x4400, 0x4de8, [0xb1, 0x3, 0x12, 0x11, 0x7d, 0xcf, 0x3c, 0xcf]);
enum PARTITION_OS_DATA_GUID = GUID(0x57434f53, 0x23f2, 0x44d5, [0xa8, 0x30, 0x67, 0xbb, 0xda, 0xa6, 0x9, 0xf9]);
enum PARTITION_PATCH_GUID = GUID(0x8967a686, 0x96aa, 0x6aa8, [0x95, 0x89, 0xa8, 0x42, 0x56, 0x54, 0x10, 0x90]);
enum PARTITION_PRE_INSTALLED_GUID = GUID(0x57434f53, 0x7fe0, 0x4196, [0x9b, 0x42, 0x42, 0x7b, 0x51, 0x64, 0x34, 0x84]);
enum PARTITION_SERVICING_FILES_GUID = GUID(0x57434f53, 0x432e, 0x4014, [0xae, 0x4c, 0x8d, 0xea, 0xa9, 0xc0, 0x0, 0x6a]);
enum PARTITION_SERVICING_METADATA_GUID = GUID(0x57434f53, 0xc691, 0x4a05, [0xbb, 0x4e, 0x70, 0x3d, 0xaf, 0xd2, 0x29, 0xce]);
enum PARTITION_SERVICING_RESERVE_GUID = GUID(0x57434f53, 0x4b81, 0x460b, [0xa3, 0x19, 0xff, 0xb6, 0xfe, 0x13, 0x6d, 0x14]);
enum PARTITION_SERVICING_STAGING_ROOT_GUID = GUID(0x57434f53, 0xe84d, 0x4e84, [0xaa, 0xf3, 0xec, 0xbb, 0xbd, 0x4, 0xb9, 0xdf]);
enum PARTITION_SPACES_GUID = GUID(0xe75caf8f, 0xf680, 0x4cee, [0xaf, 0xa3, 0xb0, 0x1, 0xe5, 0x6e, 0xfc, 0x2d]);
enum PARTITION_SPACES_DATA_GUID = GUID(0xe7addcb4, 0xdc34, 0x4539, [0x9a, 0x76, 0xeb, 0xbd, 0x7, 0xbe, 0x6f, 0x7e]);
enum PARTITION_SYSTEM_GUID = GUID(0xc12a7328, 0xf81f, 0x11d2, [0xba, 0x4b, 0x0, 0xa0, 0xc9, 0x3e, 0xc9, 0x3b]);
enum PARTITION_WINDOWS_SYSTEM_GUID = GUID(0x57434f53, 0xe3e3, 0x4631, [0xa5, 0xc5, 0x26, 0xd2, 0x24, 0x38, 0x73, 0xaa]);
enum _FT_TYPES_DEFINITION_ = 0x00000001;
enum CLFS_MGMT_POLICY_VERSION = 0x00000001;
enum LOG_POLICY_OVERWRITE = 0x00000001;
enum LOG_POLICY_PERSIST = 0x00000002;
enum CLFS_MGMT_CLIENT_REGISTRATION_VERSION = 0x00000001;
enum CLSID_DiskQuotaControl = GUID(0x7988b571, 0xec89, 0x11cf, [0x9c, 0x0, 0x0, 0xaa, 0x0, 0xa1, 0x4f, 0x56]);
enum DISKQUOTA_STATE_DISABLED = 0x00000000;
enum DISKQUOTA_STATE_TRACK = 0x00000001;
enum DISKQUOTA_STATE_ENFORCE = 0x00000002;
enum DISKQUOTA_STATE_MASK = 0x00000003;
enum DISKQUOTA_FILESTATE_INCOMPLETE = 0x00000100;
enum DISKQUOTA_FILESTATE_REBUILDING = 0x00000200;
enum DISKQUOTA_FILESTATE_MASK = 0x00000300;
enum DISKQUOTA_LOGFLAG_USER_THRESHOLD = 0x00000001;
enum DISKQUOTA_LOGFLAG_USER_LIMIT = 0x00000002;
enum DISKQUOTA_USER_ACCOUNT_RESOLVED = 0x00000000;
enum DISKQUOTA_USER_ACCOUNT_UNAVAILABLE = 0x00000001;
enum DISKQUOTA_USER_ACCOUNT_DELETED = 0x00000002;
enum DISKQUOTA_USER_ACCOUNT_INVALID = 0x00000003;
enum DISKQUOTA_USER_ACCOUNT_UNKNOWN = 0x00000004;
enum DISKQUOTA_USER_ACCOUNT_UNRESOLVED = 0x00000005;
enum INVALID_SET_FILE_POINTER = 0xffffffff;
enum INVALID_FILE_ATTRIBUTES = 0xffffffff;
enum SHARE_NETNAME_PARMNUM = 0x00000001;
enum SHARE_TYPE_PARMNUM = 0x00000003;
enum SHARE_REMARK_PARMNUM = 0x00000004;
enum SHARE_PERMISSIONS_PARMNUM = 0x00000005;
enum SHARE_MAX_USES_PARMNUM = 0x00000006;
enum SHARE_CURRENT_USES_PARMNUM = 0x00000007;
enum SHARE_PATH_PARMNUM = 0x00000008;
enum SHARE_PASSWD_PARMNUM = 0x00000009;
enum SHARE_FILE_SD_PARMNUM = 0x000001f5;
enum SHARE_SERVER_PARMNUM = 0x000001f7;
enum SHI1_NUM_ELEMENTS = 0x00000004;
enum SHI2_NUM_ELEMENTS = 0x0000000a;
enum STYPE_RESERVED1 = 0x01000000;
enum STYPE_RESERVED2 = 0x02000000;
enum STYPE_RESERVED3 = 0x04000000;
enum STYPE_RESERVED4 = 0x08000000;
enum STYPE_RESERVED5 = 0x00100000;
enum STYPE_RESERVED_ALL = 0x3fffff00;
enum SHI_USES_UNLIMITED = 0xffffffff;
enum SHI1005_FLAGS_DFS = 0x00000001;
enum SHI1005_FLAGS_DFS_ROOT = 0x00000002;
enum CSC_MASK_EXT = 0x00002030;
enum CSC_MASK = 0x00000030;
enum CSC_CACHE_MANUAL_REINT = 0x00000000;
enum CSC_CACHE_AUTO_REINT = 0x00000010;
enum CSC_CACHE_VDO = 0x00000020;
enum CSC_CACHE_NONE = 0x00000030;
enum SHI1005_FLAGS_RESTRICT_EXCLUSIVE_OPENS = 0x00000100;
enum SHI1005_FLAGS_FORCE_SHARED_DELETE = 0x00000200;
enum SHI1005_FLAGS_ALLOW_NAMESPACE_CACHING = 0x00000400;
enum SHI1005_FLAGS_ACCESS_BASED_DIRECTORY_ENUM = 0x00000800;
enum SHI1005_FLAGS_FORCE_LEVELII_OPLOCK = 0x00001000;
enum SHI1005_FLAGS_ENABLE_HASH = 0x00002000;
enum SHI1005_FLAGS_ENABLE_CA = 0x00004000;
enum SHI1005_FLAGS_ENCRYPT_DATA = 0x00008000;
enum SHI1005_FLAGS_RESERVED = 0x00010000;
enum SHI1005_FLAGS_DISABLE_CLIENT_BUFFERING = 0x00020000;
enum SHI1005_FLAGS_IDENTITY_REMOTING = 0x00040000;
enum SHI1005_FLAGS_CLUSTER_MANAGED = 0x00080000;
enum SHI1005_FLAGS_COMPRESS_DATA = 0x00100000;
enum SESI1_NUM_ELEMENTS = 0x00000008;
enum SESI2_NUM_ELEMENTS = 0x00000009;
enum STATSOPT_CLR = 0x00000001;
enum LZERROR_BADINHANDLE = 0xffffffffffffffff;
enum LZERROR_BADOUTHANDLE = 0xfffffffffffffffe;
enum LZERROR_READ = 0xfffffffffffffffd;
enum LZERROR_WRITE = 0xfffffffffffffffc;
enum LZERROR_GLOBALLOC = 0xfffffffffffffffb;
enum LZERROR_GLOBLOCK = 0xfffffffffffffffa;
enum LZERROR_BADVALUE = 0xfffffffffffffff9;
enum LZERROR_UNKNOWNALG = 0xfffffffffffffff8;
enum NTMS_OBJECTNAME_LENGTH = 0x00000040;
enum NTMS_DESCRIPTION_LENGTH = 0x0000007f;
enum NTMS_DEVICENAME_LENGTH = 0x00000040;
enum NTMS_SERIALNUMBER_LENGTH = 0x00000020;
enum NTMS_REVISION_LENGTH = 0x00000020;
enum NTMS_BARCODE_LENGTH = 0x00000040;
enum NTMS_SEQUENCE_LENGTH = 0x00000020;
enum NTMS_VENDORNAME_LENGTH = 0x00000080;
enum NTMS_PRODUCTNAME_LENGTH = 0x00000080;
enum NTMS_USERNAME_LENGTH = 0x00000040;
enum NTMS_APPLICATIONNAME_LENGTH = 0x00000040;
enum NTMS_COMPUTERNAME_LENGTH = 0x00000040;
enum NTMS_I1_MESSAGE_LENGTH = 0x0000007f;
enum NTMS_MESSAGE_LENGTH = 0x00000100;
enum NTMS_POOLHIERARCHY_LENGTH = 0x00000200;
enum NTMS_OMIDLABELID_LENGTH = 0x000000ff;
enum NTMS_OMIDLABELTYPE_LENGTH = 0x00000040;
enum NTMS_OMIDLABELINFO_LENGTH = 0x00000100;
enum NTMS_MAXATTR_LENGTH = 0x00010000;
enum NTMS_MAXATTR_NAMELEN = 0x00000020;
enum NTMSMLI_MAXTYPE = 0x00000040;
enum NTMSMLI_MAXIDSIZE = 0x00000100;
enum NTMSMLI_MAXAPPDESCR = 0x00000100;
enum TXF_LOG_RECORD_GENERIC_TYPE_COMMIT = 0x00000001;
enum TXF_LOG_RECORD_GENERIC_TYPE_ABORT = 0x00000002;
enum TXF_LOG_RECORD_GENERIC_TYPE_PREPARE = 0x00000004;
enum TXF_LOG_RECORD_GENERIC_TYPE_DATA = 0x00000008;
enum VS_VERSION_INFO = 0x00000001;
enum VS_USER_DEFINED = 0x00000064;
enum VS_FFI_SIGNATURE = 0xfffffffffeef04bd;
enum VS_FFI_STRUCVERSION = 0x00010000;
enum VS_FFI_FILEFLAGSMASK = 0x0000003f;
enum WINEFS_SETUSERKEY_SET_CAPABILITIES = 0x00000001;
enum EFS_COMPATIBILITY_VERSION_NCRYPT_PROTECTOR = 0x00000005;
enum EFS_COMPATIBILITY_VERSION_PFILE_PROTECTOR = 0x00000006;
enum EFS_SUBVER_UNKNOWN = 0x00000000;
enum EFS_EFS_SUBVER_EFS_CERT = 0x00000001;
enum EFS_PFILE_SUBVER_RMS = 0x00000002;
enum EFS_PFILE_SUBVER_APPX = 0x00000003;
enum MAX_SID_SIZE = 0x00000100;
enum EFS_METADATA_ADD_USER = 0x00000001;
enum EFS_METADATA_REMOVE_USER = 0x00000002;
enum EFS_METADATA_REPLACE_USER = 0x00000004;
enum EFS_METADATA_GENERAL_OP = 0x00000008;
enum WOF_PROVIDER_WIM = 0x00000001;
enum WOF_PROVIDER_FILE = 0x00000002;
enum WIM_PROVIDER_HASH_SIZE = 0x00000014;
enum WIM_BOOT_OS_WIM = 0x00000001;
enum WIM_BOOT_NOT_OS_WIM = 0x00000000;
enum WIM_ENTRY_FLAG_NOT_ACTIVE = 0x00000001;
enum WIM_ENTRY_FLAG_SUSPENDED = 0x00000002;
enum WIM_EXTERNAL_FILE_INFO_FLAG_NOT_ACTIVE = 0x00000001;
enum WIM_EXTERNAL_FILE_INFO_FLAG_SUSPENDED = 0x00000002;
enum FILE_PROVIDER_COMPRESSION_XPRESS4K = 0x00000000;
enum FILE_PROVIDER_COMPRESSION_LZX = 0x00000001;
enum FILE_PROVIDER_COMPRESSION_XPRESS8K = 0x00000002;
enum FILE_PROVIDER_COMPRESSION_XPRESS16K = 0x00000003;
enum ClfsNullRecord = 0x00;
enum ClfsDataRecord = 0x01;
enum ClfsRestartRecord = 0x02;
enum ClfsClientRecord = 0x03;
enum ClsContainerInitializing = 0x00000001;
enum ClsContainerInactive = 0x00000002;
enum ClsContainerActive = 0x00000004;
enum ClsContainerActivePendingDelete = 0x00000008;
enum ClsContainerPendingArchive = 0x00000010;
enum ClsContainerPendingArchiveAndDelete = 0x00000020;
enum ClfsContainerInitializing = 0x00000001;
enum ClfsContainerInactive = 0x00000002;
enum ClfsContainerActive = 0x00000004;
enum ClfsContainerActivePendingDelete = 0x00000008;
enum ClfsContainerPendingArchive = 0x00000010;
enum ClfsContainerPendingArchiveAndDelete = 0x00000020;
enum CLFS_MAX_CONTAINER_INFO = 0x00000100;
enum CLFS_SCAN_INIT = 0x01;
enum CLFS_SCAN_FORWARD = 0x02;
enum CLFS_SCAN_BACKWARD = 0x04;
enum CLFS_SCAN_CLOSE = 0x08;
enum CLFS_SCAN_INITIALIZED = 0x10;
enum CLFS_SCAN_BUFFERED = 0x20;
alias GET_FILE_VERSION_INFO_FLAGS = uint;
enum : uint
{
    FILE_VER_GET_LOCALISED  = 0x00000001,
    FILE_VER_GET_NEUTRAL    = 0x00000002,
    FILE_VER_GET_PREFETCHED = 0x00000004,
}

alias VER_FIND_FILE_FLAGS = uint;
enum : uint
{
    VFFF_ISSHAREDFILE = 0x00000001,
}

alias VER_FIND_FILE_STATUS = uint;
enum : uint
{
    VFF_CURNEDEST    = 0x00000001,
    VFF_FILEINUSE    = 0x00000002,
    VFF_BUFFTOOSMALL = 0x00000004,
}

alias VER_INSTALL_FILE_FLAGS = uint;
enum : uint
{
    VIFF_FORCEINSTALL  = 0x00000001,
    VIFF_DONTDELETEOLD = 0x00000002,
}

alias VER_INSTALL_FILE_STATUS = uint;
enum : uint
{
    VIF_TEMPFILE          = 0x00000001,
    VIF_MISMATCH          = 0x00000002,
    VIF_SRCOLD            = 0x00000004,
    VIF_DIFFLANG          = 0x00000008,
    VIF_DIFFCODEPG        = 0x00000010,
    VIF_DIFFTYPE          = 0x00000020,
    VIF_WRITEPROT         = 0x00000040,
    VIF_FILEINUSE         = 0x00000080,
    VIF_OUTOFSPACE        = 0x00000100,
    VIF_ACCESSVIOLATION   = 0x00000200,
    VIF_SHARINGVIOLATION  = 0x00000400,
    VIF_CANNOTCREATE      = 0x00000800,
    VIF_CANNOTDELETE      = 0x00001000,
    VIF_CANNOTRENAME      = 0x00002000,
    VIF_CANNOTDELETECUR   = 0x00004000,
    VIF_OUTOFMEMORY       = 0x00008000,
    VIF_CANNOTREADSRC     = 0x00010000,
    VIF_CANNOTREADDST     = 0x00020000,
    VIF_BUFFTOOSMALL      = 0x00040000,
    VIF_CANNOTLOADLZ32    = 0x00080000,
    VIF_CANNOTLOADCABINET = 0x00100000,
}

alias VS_FIXEDFILEINFO_FILE_FLAGS = uint;
enum : uint
{
    VS_FF_DEBUG        = 0x00000001,
    VS_FF_PRERELEASE   = 0x00000002,
    VS_FF_PATCHED      = 0x00000004,
    VS_FF_PRIVATEBUILD = 0x00000008,
    VS_FF_INFOINFERRED = 0x00000010,
    VS_FF_SPECIALBUILD = 0x00000020,
}

alias VS_FIXEDFILEINFO_FILE_OS = int;
enum : int
{
    VOS_UNKNOWN       = 0x00000000,
    VOS_DOS           = 0x00010000,
    VOS_OS216         = 0x00020000,
    VOS_OS232         = 0x00030000,
    VOS_NT            = 0x00040000,
    VOS_WINCE         = 0x00050000,
    VOS__BASE         = 0x00000000,
    VOS__WINDOWS16    = 0x00000001,
    VOS__PM16         = 0x00000002,
    VOS__PM32         = 0x00000003,
    VOS__WINDOWS32    = 0x00000004,
    VOS_DOS_WINDOWS16 = 0x00010001,
    VOS_DOS_WINDOWS32 = 0x00010004,
    VOS_OS216_PM16    = 0x00020002,
    VOS_OS232_PM32    = 0x00030003,
    VOS_NT_WINDOWS32  = 0x00040004,
}

alias VS_FIXEDFILEINFO_FILE_TYPE = int;
enum : int
{
    VFT_UNKNOWN    = 0x00000000,
    VFT_APP        = 0x00000001,
    VFT_DLL        = 0x00000002,
    VFT_DRV        = 0x00000003,
    VFT_FONT       = 0x00000004,
    VFT_VXD        = 0x00000005,
    VFT_STATIC_LIB = 0x00000007,
}

alias VS_FIXEDFILEINFO_FILE_SUBTYPE = int;
enum : int
{
    VFT2_UNKNOWN               = 0x00000000,
    VFT2_DRV_PRINTER           = 0x00000001,
    VFT2_DRV_KEYBOARD          = 0x00000002,
    VFT2_DRV_LANGUAGE          = 0x00000003,
    VFT2_DRV_DISPLAY           = 0x00000004,
    VFT2_DRV_MOUSE             = 0x00000005,
    VFT2_DRV_NETWORK           = 0x00000006,
    VFT2_DRV_SYSTEM            = 0x00000007,
    VFT2_DRV_INSTALLABLE       = 0x00000008,
    VFT2_DRV_SOUND             = 0x00000009,
    VFT2_DRV_COMM              = 0x0000000a,
    VFT2_DRV_INPUTMETHOD       = 0x0000000b,
    VFT2_DRV_VERSIONED_PRINTER = 0x0000000c,
    VFT2_FONT_RASTER           = 0x00000001,
    VFT2_FONT_VECTOR           = 0x00000002,
    VFT2_FONT_TRUETYPE         = 0x00000003,
}

alias FILE_CREATION_DISPOSITION = uint;
enum : uint
{
    CREATE_NEW        = 0x00000001,
    CREATE_ALWAYS     = 0x00000002,
    OPEN_EXISTING     = 0x00000003,
    OPEN_ALWAYS       = 0x00000004,
    TRUNCATE_EXISTING = 0x00000005,
}

alias FILE_SHARE_MODE = uint;
enum : uint
{
    FILE_SHARE_NONE   = 0x00000000,
    FILE_SHARE_DELETE = 0x00000004,
    FILE_SHARE_READ   = 0x00000001,
    FILE_SHARE_WRITE  = 0x00000002,
}

alias SHARE_TYPE = uint;
enum : uint
{
    STYPE_DISKTREE  = 0x00000000,
    STYPE_PRINTQ    = 0x00000001,
    STYPE_DEVICE    = 0x00000002,
    STYPE_IPC       = 0x00000003,
    STYPE_SPECIAL   = 0x80000000,
    STYPE_TEMPORARY = 0x40000000,
    STYPE_MASK      = 0x000000ff,
}

alias CLFS_FLAG = uint;
enum : uint
{
    CLFS_FLAG_FORCE_APPEND    = 0x00000001,
    CLFS_FLAG_FORCE_FLUSH     = 0x00000002,
    CLFS_FLAG_NO_FLAGS        = 0x00000000,
    CLFS_FLAG_USE_RESERVATION = 0x00000004,
}

alias SET_FILE_POINTER_MOVE_METHOD = uint;
enum : uint
{
    FILE_BEGIN   = 0x00000000,
    FILE_CURRENT = 0x00000001,
    FILE_END     = 0x00000002,
}

alias MOVE_FILE_FLAGS = uint;
enum : uint
{
    MOVEFILE_COPY_ALLOWED          = 0x00000002,
    MOVEFILE_CREATE_HARDLINK       = 0x00000010,
    MOVEFILE_DELAY_UNTIL_REBOOT    = 0x00000004,
    MOVEFILE_REPLACE_EXISTING      = 0x00000001,
    MOVEFILE_WRITE_THROUGH         = 0x00000008,
    MOVEFILE_FAIL_IF_NOT_TRACKABLE = 0x00000020,
}

alias FILE_NAME = uint;
enum : uint
{
    FILE_NAME_NORMALIZED = 0x00000000,
    FILE_NAME_OPENED     = 0x00000008,
}

alias LZOPENFILE_STYLE = uint;
enum : uint
{
    OF_CANCEL           = 0x00000800,
    OF_CREATE           = 0x00001000,
    OF_DELETE           = 0x00000200,
    OF_EXIST            = 0x00004000,
    OF_PARSE            = 0x00000100,
    OF_PROMPT           = 0x00002000,
    OF_READ             = 0x00000000,
    OF_READWRITE        = 0x00000002,
    OF_REOPEN           = 0x00008000,
    OF_SHARE_DENY_NONE  = 0x00000040,
    OF_SHARE_DENY_READ  = 0x00000030,
    OF_SHARE_DENY_WRITE = 0x00000020,
    OF_SHARE_EXCLUSIVE  = 0x00000010,
    OF_WRITE            = 0x00000001,
    OF_SHARE_COMPAT     = 0x00000000,
    OF_VERIFY           = 0x00000400,
}

alias FILE_NOTIFY_CHANGE = uint;
enum : uint
{
    FILE_NOTIFY_CHANGE_FILE_NAME   = 0x00000001,
    FILE_NOTIFY_CHANGE_DIR_NAME    = 0x00000002,
    FILE_NOTIFY_CHANGE_ATTRIBUTES  = 0x00000004,
    FILE_NOTIFY_CHANGE_SIZE        = 0x00000008,
    FILE_NOTIFY_CHANGE_LAST_WRITE  = 0x00000010,
    FILE_NOTIFY_CHANGE_LAST_ACCESS = 0x00000020,
    FILE_NOTIFY_CHANGE_CREATION    = 0x00000040,
    FILE_NOTIFY_CHANGE_SECURITY    = 0x00000100,
}

alias TXFS_MINIVERSION = uint;
enum : uint
{
    TXFS_MINIVERSION_COMMITTED_VIEW = 0x00000000,
    TXFS_MINIVERSION_DIRTY_VIEW     = 0x0000ffff,
    TXFS_MINIVERSION_DEFAULT_VIEW   = 0x0000fffe,
}

alias TAPE_POSITION_TYPE = int;
enum : int
{
    TAPE_ABSOLUTE_POSITION = 0x00000000,
    TAPE_LOGICAL_POSITION  = 0x00000001,
}

alias CREATE_TAPE_PARTITION_METHOD = int;
enum : int
{
    TAPE_FIXED_PARTITIONS     = 0x00000000,
    TAPE_INITIATOR_PARTITIONS = 0x00000002,
    TAPE_SELECT_PARTITIONS    = 0x00000001,
}

alias REPLACE_FILE_FLAGS = uint;
enum : uint
{
    REPLACEFILE_WRITE_THROUGH       = 0x00000001,
    REPLACEFILE_IGNORE_MERGE_ERRORS = 0x00000002,
    REPLACEFILE_IGNORE_ACL_ERRORS   = 0x00000004,
}

alias TAPEMARK_TYPE = int;
enum : int
{
    TAPE_FILEMARKS       = 0x00000001,
    TAPE_LONG_FILEMARKS  = 0x00000003,
    TAPE_SETMARKS        = 0x00000000,
    TAPE_SHORT_FILEMARKS = 0x00000002,
}

alias DISKQUOTA_USERNAME_RESOLVE = uint;
enum : uint
{
    DISKQUOTA_USERNAME_RESOLVE_ASYNC = 0x00000002,
    DISKQUOTA_USERNAME_RESOLVE_NONE  = 0x00000000,
    DISKQUOTA_USERNAME_RESOLVE_SYNC  = 0x00000001,
}

alias TAPE_POSITION_METHOD = int;
enum : int
{
    TAPE_ABSOLUTE_BLOCK        = 0x00000001,
    TAPE_LOGICAL_BLOCK         = 0x00000002,
    TAPE_REWIND                = 0x00000000,
    TAPE_SPACE_END_OF_DATA     = 0x00000004,
    TAPE_SPACE_FILEMARKS       = 0x00000006,
    TAPE_SPACE_RELATIVE_BLOCKS = 0x00000005,
    TAPE_SPACE_SEQUENTIAL_FMKS = 0x00000007,
    TAPE_SPACE_SEQUENTIAL_SMKS = 0x00000009,
    TAPE_SPACE_SETMARKS        = 0x00000008,
}

alias NT_CREATE_FILE_DISPOSITION = uint;
enum : uint
{
    FILE_SUPERSEDE    = 0x00000000,
    FILE_CREATE       = 0x00000002,
    FILE_OPEN         = 0x00000001,
    FILE_OPEN_IF      = 0x00000003,
    FILE_OVERWRITE    = 0x00000004,
    FILE_OVERWRITE_IF = 0x00000005,
}

alias TAPE_INFORMATION_TYPE = uint;
enum : uint
{
    SET_TAPE_DRIVE_INFORMATION = 0x00000001,
    SET_TAPE_MEDIA_INFORMATION = 0x00000000,
}

alias NTMS_OMID_TYPE = uint;
enum : uint
{
    NTMS_OMID_TYPE_FILESYSTEM_INFO = 0x00000002,
    NTMS_OMID_TYPE_RAW_LABEL       = 0x00000001,
}

alias LOCK_FILE_FLAGS = uint;
enum : uint
{
    LOCKFILE_EXCLUSIVE_LOCK   = 0x00000002,
    LOCKFILE_FAIL_IMMEDIATELY = 0x00000001,
}

alias LPPROGRESS_ROUTINE_CALLBACK_REASON = uint;
enum : uint
{
    CALLBACK_CHUNK_FINISHED = 0x00000000,
    CALLBACK_STREAM_SWITCH  = 0x00000001,
}

alias PREPARE_TAPE_OPERATION = int;
enum : int
{
    TAPE_FORMAT  = 0x00000005,
    TAPE_LOAD    = 0x00000000,
    TAPE_LOCK    = 0x00000003,
    TAPE_TENSION = 0x00000002,
    TAPE_UNLOAD  = 0x00000001,
    TAPE_UNLOCK  = 0x00000004,
}

alias GET_TAPE_DRIVE_PARAMETERS_OPERATION = uint;
enum : uint
{
    GET_TAPE_DRIVE_INFORMATION = 0x00000001,
    GET_TAPE_MEDIA_INFORMATION = 0x00000000,
}

alias ERASE_TAPE_TYPE = int;
enum : int
{
    TAPE_ERASE_LONG  = 0x00000001,
    TAPE_ERASE_SHORT = 0x00000000,
}

alias FILE_ACTION = uint;
enum : uint
{
    FILE_ACTION_ADDED            = 0x00000001,
    FILE_ACTION_REMOVED          = 0x00000002,
    FILE_ACTION_MODIFIED         = 0x00000003,
    FILE_ACTION_RENAMED_OLD_NAME = 0x00000004,
    FILE_ACTION_RENAMED_NEW_NAME = 0x00000005,
}

alias SHARE_INFO_PERMISSIONS = uint;
enum : uint
{
    ACCESS_READ   = 0x00000001,
    ACCESS_WRITE  = 0x00000002,
    ACCESS_CREATE = 0x00000004,
    ACCESS_EXEC   = 0x00000008,
    ACCESS_DELETE = 0x00000010,
    ACCESS_ATRIB  = 0x00000020,
    ACCESS_PERM   = 0x00000040,
    ACCESS_ALL    = 0x00008000,
}

alias FILE_DEVICE_TYPE = uint;
enum : uint
{
    FILE_DEVICE_CD_ROM = 0x00000002,
    FILE_DEVICE_DISK   = 0x00000007,
    FILE_DEVICE_TAPE   = 0x0000001f,
    FILE_DEVICE_DVD    = 0x00000033,
}

alias SESSION_INFO_USER_FLAGS = uint;
enum : uint
{
    SESS_GUEST        = 0x00000001,
    SESS_NOENCRYPTION = 0x00000002,
}

alias WIN_STREAM_ID = uint;
enum : uint
{
    BACKUP_ALTERNATE_DATA = 0x00000004,
    BACKUP_DATA           = 0x00000001,
    BACKUP_EA_DATA        = 0x00000002,
    BACKUP_LINK           = 0x00000005,
    BACKUP_OBJECT_ID      = 0x00000007,
    BACKUP_PROPERTY_DATA  = 0x00000006,
    BACKUP_REPARSE_DATA   = 0x00000008,
    BACKUP_SECURITY_DATA  = 0x00000003,
    BACKUP_SPARSE_BLOCK   = 0x00000009,
    BACKUP_TXFS_DATA      = 0x0000000a,
}

alias TXF_LOG_RECORD_TYPE = ushort;
enum : ushort
{
    TXF_LOG_RECORD_TYPE_AFFECTED_FILE = 0x0004,
    TXF_LOG_RECORD_TYPE_TRUNCATE      = 0x0002,
    TXF_LOG_RECORD_TYPE_WRITE         = 0x0001,
}

alias FILE_INFO_FLAGS_PERMISSIONS = uint;
enum : uint
{
    PERM_FILE_READ   = 0x00000001,
    PERM_FILE_WRITE  = 0x00000002,
    PERM_FILE_CREATE = 0x00000004,
}

alias SYMBOLIC_LINK_FLAGS = uint;
enum : uint
{
    SYMBOLIC_LINK_FLAG_DIRECTORY                 = 0x00000001,
    SYMBOLIC_LINK_FLAG_ALLOW_UNPRIVILEGED_CREATE = 0x00000002,
}

alias FindFileHandle = long;
alias FindFileNameHandle = long;
alias FindStreamHandle = long;
alias FindChangeNotificationHandle = long;
alias FindVolumeHandle = long;
alias FindVolumeMointPointHandle = long;
struct WIN32_FIND_DATAA
{
    uint dwFileAttributes;
    FILETIME ftCreationTime;
    FILETIME ftLastAccessTime;
    FILETIME ftLastWriteTime;
    uint nFileSizeHigh;
    uint nFileSizeLow;
    uint dwReserved0;
    uint dwReserved1;
    CHAR[260] cFileName;
    CHAR[14] cAlternateFileName;
}
struct WIN32_FIND_DATAW
{
    uint dwFileAttributes;
    FILETIME ftCreationTime;
    FILETIME ftLastAccessTime;
    FILETIME ftLastWriteTime;
    uint nFileSizeHigh;
    uint nFileSizeLow;
    uint dwReserved0;
    uint dwReserved1;
    wchar[260] cFileName;
    wchar[14] cAlternateFileName;
}
alias FINDEX_INFO_LEVELS = int;
enum : int
{
    FindExInfoStandard     = 0x00000000,
    FindExInfoBasic        = 0x00000001,
    FindExInfoMaxInfoLevel = 0x00000002,
}

alias FINDEX_SEARCH_OPS = int;
enum : int
{
    FindExSearchNameMatch          = 0x00000000,
    FindExSearchLimitToDirectories = 0x00000001,
    FindExSearchLimitToDevices     = 0x00000002,
    FindExSearchMaxSearchOp        = 0x00000003,
}

alias READ_DIRECTORY_NOTIFY_INFORMATION_CLASS = int;
enum : int
{
    ReadDirectoryNotifyInformation         = 0x00000001,
    ReadDirectoryNotifyExtendedInformation = 0x00000002,
}

alias GET_FILEEX_INFO_LEVELS = int;
enum : int
{
    GetFileExInfoStandard = 0x00000000,
    GetFileExMaxInfoLevel = 0x00000001,
}

alias FILE_INFO_BY_HANDLE_CLASS = int;
enum : int
{
    FileBasicInfo                  = 0x00000000,
    FileStandardInfo               = 0x00000001,
    FileNameInfo                   = 0x00000002,
    FileRenameInfo                 = 0x00000003,
    FileDispositionInfo            = 0x00000004,
    FileAllocationInfo             = 0x00000005,
    FileEndOfFileInfo              = 0x00000006,
    FileStreamInfo                 = 0x00000007,
    FileCompressionInfo            = 0x00000008,
    FileAttributeTagInfo           = 0x00000009,
    FileIdBothDirectoryInfo        = 0x0000000a,
    FileIdBothDirectoryRestartInfo = 0x0000000b,
    FileIoPriorityHintInfo         = 0x0000000c,
    FileRemoteProtocolInfo         = 0x0000000d,
    FileFullDirectoryInfo          = 0x0000000e,
    FileFullDirectoryRestartInfo   = 0x0000000f,
    FileStorageInfo                = 0x00000010,
    FileAlignmentInfo              = 0x00000011,
    FileIdInfo                     = 0x00000012,
    FileIdExtdDirectoryInfo        = 0x00000013,
    FileIdExtdDirectoryRestartInfo = 0x00000014,
    FileDispositionInfoEx          = 0x00000015,
    FileRenameInfoEx               = 0x00000016,
    FileCaseSensitiveInfo          = 0x00000017,
    FileNormalizedNameInfo         = 0x00000018,
    MaximumFileInfoByHandleClass   = 0x00000019,
}

struct TRANSACTION_NOTIFICATION
{
    void* TransactionKey;
    uint TransactionNotification;
    LARGE_INTEGER TmVirtualClock;
    uint ArgumentLength;
}
struct TRANSACTION_NOTIFICATION_RECOVERY_ARGUMENT
{
    GUID EnlistmentId;
    GUID UOW;
}
struct TRANSACTION_NOTIFICATION_TM_ONLINE_ARGUMENT
{
    GUID TmIdentity;
    uint Flags;
}
struct TRANSACTION_NOTIFICATION_SAVEPOINT_ARGUMENT
{
    uint SavepointId;
}
struct TRANSACTION_NOTIFICATION_PROPAGATE_ARGUMENT
{
    uint PropagationCookie;
    GUID UOW;
    GUID TmIdentity;
    uint BufferLength;
}
struct TRANSACTION_NOTIFICATION_MARSHAL_ARGUMENT
{
    uint MarshalCookie;
    GUID UOW;
}
struct KCRM_MARSHAL_HEADER
{
    uint VersionMajor;
    uint VersionMinor;
    uint NumProtocols;
    uint Unused;
}
struct KCRM_TRANSACTION_BLOB
{
    GUID UOW;
    GUID TmIdentity;
    uint IsolationLevel;
    uint IsolationFlags;
    uint Timeout;
    wchar[64] Description;
}
struct KCRM_PROTOCOL_BLOB
{
    GUID ProtocolId;
    uint StaticInfoLength;
    uint TransactionIdInfoLength;
    uint Unused1;
    uint Unused2;
}
struct DISK_SPACE_INFORMATION
{
    ulong ActualTotalAllocationUnits;
    ulong ActualAvailableAllocationUnits;
    ulong ActualPoolUnavailableAllocationUnits;
    ulong CallerTotalAllocationUnits;
    ulong CallerAvailableAllocationUnits;
    ulong CallerPoolUnavailableAllocationUnits;
    ulong UsedAllocationUnits;
    ulong TotalReservedAllocationUnits;
    ulong VolumeStorageReserveAllocationUnits;
    ulong AvailableCommittedAllocationUnits;
    ulong PoolAvailableAllocationUnits;
    uint SectorsPerAllocationUnit;
    uint BytesPerSector;
}
struct WIN32_FILE_ATTRIBUTE_DATA
{
    uint dwFileAttributes;
    FILETIME ftCreationTime;
    FILETIME ftLastAccessTime;
    FILETIME ftLastWriteTime;
    uint nFileSizeHigh;
    uint nFileSizeLow;
}
struct BY_HANDLE_FILE_INFORMATION
{
    uint dwFileAttributes;
    FILETIME ftCreationTime;
    FILETIME ftLastAccessTime;
    FILETIME ftLastWriteTime;
    uint dwVolumeSerialNumber;
    uint nFileSizeHigh;
    uint nFileSizeLow;
    uint nNumberOfLinks;
    uint nFileIndexHigh;
    uint nFileIndexLow;
}
struct CREATEFILE2_EXTENDED_PARAMETERS
{
    uint dwSize;
    uint dwFileAttributes;
    uint dwFileFlags;
    uint dwSecurityQosFlags;
    SECURITY_ATTRIBUTES* lpSecurityAttributes;
    HANDLE hTemplateFile;
}
alias STREAM_INFO_LEVELS = int;
enum : int
{
    FindStreamInfoStandard     = 0x00000000,
    FindStreamInfoMaxInfoLevel = 0x00000001,
}

struct WIN32_FIND_STREAM_DATA
{
    LARGE_INTEGER StreamSize;
    wchar[296] cStreamName;
}
struct VS_FIXEDFILEINFO
{
    uint dwSignature;
    uint dwStrucVersion;
    uint dwFileVersionMS;
    uint dwFileVersionLS;
    uint dwProductVersionMS;
    uint dwProductVersionLS;
    uint dwFileFlagsMask;
    VS_FIXEDFILEINFO_FILE_FLAGS dwFileFlags;
    VS_FIXEDFILEINFO_FILE_OS dwFileOS;
    VS_FIXEDFILEINFO_FILE_TYPE dwFileType;
    VS_FIXEDFILEINFO_FILE_SUBTYPE dwFileSubtype;
    uint dwFileDateMS;
    uint dwFileDateLS;
}
alias NtmsObjectsTypes = int;
enum : int
{
    NTMS_UNKNOWN                = 0x00000000,
    NTMS_OBJECT                 = 0x00000001,
    NTMS_CHANGER                = 0x00000002,
    NTMS_CHANGER_TYPE           = 0x00000003,
    NTMS_COMPUTER               = 0x00000004,
    NTMS_DRIVE                  = 0x00000005,
    NTMS_DRIVE_TYPE             = 0x00000006,
    NTMS_IEDOOR                 = 0x00000007,
    NTMS_IEPORT                 = 0x00000008,
    NTMS_LIBRARY                = 0x00000009,
    NTMS_LIBREQUEST             = 0x0000000a,
    NTMS_LOGICAL_MEDIA          = 0x0000000b,
    NTMS_MEDIA_POOL             = 0x0000000c,
    NTMS_MEDIA_TYPE             = 0x0000000d,
    NTMS_PARTITION              = 0x0000000e,
    NTMS_PHYSICAL_MEDIA         = 0x0000000f,
    NTMS_STORAGESLOT            = 0x00000010,
    NTMS_OPREQUEST              = 0x00000011,
    NTMS_UI_DESTINATION         = 0x00000012,
    NTMS_NUMBER_OF_OBJECT_TYPES = 0x00000013,
}

struct NTMS_ASYNC_IO
{
    GUID OperationId;
    GUID EventId;
    uint dwOperationType;
    uint dwResult;
    uint dwAsyncState;
    HANDLE hEvent;
    BOOL bOnStateChange;
}
alias NtmsAsyncStatus = int;
enum : int
{
    NTMS_ASYNCSTATE_QUEUED        = 0x00000000,
    NTMS_ASYNCSTATE_WAIT_RESOURCE = 0x00000001,
    NTMS_ASYNCSTATE_WAIT_OPERATOR = 0x00000002,
    NTMS_ASYNCSTATE_INPROCESS     = 0x00000003,
    NTMS_ASYNCSTATE_COMPLETE      = 0x00000004,
}

alias NtmsAsyncOperations = int;
enum : int
{
    NTMS_ASYNCOP_MOUNT = 0x00000001,
}

alias NtmsSessionOptions = int;
enum : int
{
    NTMS_SESSION_QUERYEXPEDITE = 0x00000001,
}

alias NtmsMountOptions = int;
enum : int
{
    NTMS_MOUNT_READ                 = 0x00000001,
    NTMS_MOUNT_WRITE                = 0x00000002,
    NTMS_MOUNT_ERROR_NOT_AVAILABLE  = 0x00000004,
    NTMS_MOUNT_ERROR_IF_UNAVAILABLE = 0x00000004,
    NTMS_MOUNT_ERROR_OFFLINE        = 0x00000008,
    NTMS_MOUNT_ERROR_IF_OFFLINE     = 0x00000008,
    NTMS_MOUNT_SPECIFIC_DRIVE       = 0x00000010,
    NTMS_MOUNT_NOWAIT               = 0x00000020,
}

alias NtmsDismountOptions = int;
enum : int
{
    NTMS_DISMOUNT_DEFERRED  = 0x00000001,
    NTMS_DISMOUNT_IMMEDIATE = 0x00000002,
}

alias NtmsMountPriority = int;
enum : int
{
    NTMS_PRIORITY_DEFAULT = 0x00000000,
    NTMS_PRIORITY_HIGHEST = 0x0000000f,
    NTMS_PRIORITY_HIGH    = 0x00000007,
    NTMS_PRIORITY_NORMAL  = 0x00000000,
    NTMS_PRIORITY_LOW     = 0xfffffff9,
    NTMS_PRIORITY_LOWEST  = 0xfffffff1,
}

struct NTMS_MOUNT_INFORMATION
{
    uint dwSize;
    void* lpReserved;
}
alias NtmsAllocateOptions = int;
enum : int
{
    NTMS_ALLOCATE_NEW                  = 0x00000001,
    NTMS_ALLOCATE_NEXT                 = 0x00000002,
    NTMS_ALLOCATE_ERROR_IF_UNAVAILABLE = 0x00000004,
}

struct NTMS_ALLOCATION_INFORMATION
{
    uint dwSize;
    void* lpReserved;
    GUID AllocatedFrom;
}
alias NtmsCreateOptions = int;
enum : int
{
    NTMS_OPEN_EXISTING = 0x00000001,
    NTMS_CREATE_NEW    = 0x00000002,
    NTMS_OPEN_ALWAYS   = 0x00000003,
}

alias NtmsDriveState = int;
enum : int
{
    NTMS_DRIVESTATE_DISMOUNTED    = 0x00000000,
    NTMS_DRIVESTATE_MOUNTED       = 0x00000001,
    NTMS_DRIVESTATE_LOADED        = 0x00000002,
    NTMS_DRIVESTATE_UNLOADED      = 0x00000005,
    NTMS_DRIVESTATE_BEING_CLEANED = 0x00000006,
    NTMS_DRIVESTATE_DISMOUNTABLE  = 0x00000007,
}

struct NTMS_DRIVEINFORMATIONA
{
    uint Number;
    NtmsDriveState State;
    GUID DriveType;
    CHAR[64] szDeviceName;
    CHAR[32] szSerialNumber;
    CHAR[32] szRevision;
    ushort ScsiPort;
    ushort ScsiBus;
    ushort ScsiTarget;
    ushort ScsiLun;
    uint dwMountCount;
    SYSTEMTIME LastCleanedTs;
    GUID SavedPartitionId;
    GUID Library;
    GUID Reserved;
    uint dwDeferDismountDelay;
}
struct NTMS_DRIVEINFORMATIONW
{
    uint Number;
    NtmsDriveState State;
    GUID DriveType;
    wchar[64] szDeviceName;
    wchar[32] szSerialNumber;
    wchar[32] szRevision;
    ushort ScsiPort;
    ushort ScsiBus;
    ushort ScsiTarget;
    ushort ScsiLun;
    uint dwMountCount;
    SYSTEMTIME LastCleanedTs;
    GUID SavedPartitionId;
    GUID Library;
    GUID Reserved;
    uint dwDeferDismountDelay;
}
alias NtmsLibraryType = int;
enum : int
{
    NTMS_LIBRARYTYPE_UNKNOWN    = 0x00000000,
    NTMS_LIBRARYTYPE_OFFLINE    = 0x00000001,
    NTMS_LIBRARYTYPE_ONLINE     = 0x00000002,
    NTMS_LIBRARYTYPE_STANDALONE = 0x00000003,
}

alias NtmsLibraryFlags = int;
enum : int
{
    NTMS_LIBRARYFLAG_FIXEDOFFLINE               = 0x00000001,
    NTMS_LIBRARYFLAG_CLEANERPRESENT             = 0x00000002,
    NTMS_LIBRARYFLAG_AUTODETECTCHANGE           = 0x00000004,
    NTMS_LIBRARYFLAG_IGNORECLEANERUSESREMAINING = 0x00000008,
    NTMS_LIBRARYFLAG_RECOGNIZECLEANERBARCODE    = 0x00000010,
}

alias NtmsInventoryMethod = int;
enum : int
{
    NTMS_INVENTORY_NONE    = 0x00000000,
    NTMS_INVENTORY_FAST    = 0x00000001,
    NTMS_INVENTORY_OMID    = 0x00000002,
    NTMS_INVENTORY_DEFAULT = 0x00000003,
    NTMS_INVENTORY_SLOT    = 0x00000004,
    NTMS_INVENTORY_STOP    = 0x00000005,
    NTMS_INVENTORY_MAX     = 0x00000006,
}

struct NTMS_LIBRARYINFORMATION
{
    NtmsLibraryType LibraryType;
    GUID CleanerSlot;
    GUID CleanerSlotDefault;
    BOOL LibrarySupportsDriveCleaning;
    BOOL BarCodeReaderInstalled;
    NtmsInventoryMethod InventoryMethod;
    uint dwCleanerUsesRemaining;
    uint FirstDriveNumber;
    uint dwNumberOfDrives;
    uint FirstSlotNumber;
    uint dwNumberOfSlots;
    uint FirstDoorNumber;
    uint dwNumberOfDoors;
    uint FirstPortNumber;
    uint dwNumberOfPorts;
    uint FirstChangerNumber;
    uint dwNumberOfChangers;
    uint dwNumberOfMedia;
    uint dwNumberOfMediaTypes;
    uint dwNumberOfLibRequests;
    GUID Reserved;
    BOOL AutoRecovery;
    NtmsLibraryFlags dwFlags;
}
struct NTMS_CHANGERINFORMATIONA
{
    uint Number;
    GUID ChangerType;
    CHAR[32] szSerialNumber;
    CHAR[32] szRevision;
    CHAR[64] szDeviceName;
    ushort ScsiPort;
    ushort ScsiBus;
    ushort ScsiTarget;
    ushort ScsiLun;
    GUID Library;
}
struct NTMS_CHANGERINFORMATIONW
{
    uint Number;
    GUID ChangerType;
    wchar[32] szSerialNumber;
    wchar[32] szRevision;
    wchar[64] szDeviceName;
    ushort ScsiPort;
    ushort ScsiBus;
    ushort ScsiTarget;
    ushort ScsiLun;
    GUID Library;
}
alias NtmsSlotState = int;
enum : int
{
    NTMS_SLOTSTATE_UNKNOWN        = 0x00000000,
    NTMS_SLOTSTATE_FULL           = 0x00000001,
    NTMS_SLOTSTATE_EMPTY          = 0x00000002,
    NTMS_SLOTSTATE_NOTPRESENT     = 0x00000003,
    NTMS_SLOTSTATE_NEEDSINVENTORY = 0x00000004,
}

struct NTMS_STORAGESLOTINFORMATION
{
    uint Number;
    uint State;
    GUID Library;
}
alias NtmsDoorState = int;
enum : int
{
    NTMS_DOORSTATE_UNKNOWN = 0x00000000,
    NTMS_DOORSTATE_CLOSED  = 0x00000001,
    NTMS_DOORSTATE_OPEN    = 0x00000002,
}

struct NTMS_IEDOORINFORMATION
{
    uint Number;
    NtmsDoorState State;
    ushort MaxOpenSecs;
    GUID Library;
}
alias NtmsPortPosition = int;
enum : int
{
    NTMS_PORTPOSITION_UNKNOWN   = 0x00000000,
    NTMS_PORTPOSITION_EXTENDED  = 0x00000001,
    NTMS_PORTPOSITION_RETRACTED = 0x00000002,
}

alias NtmsPortContent = int;
enum : int
{
    NTMS_PORTCONTENT_UNKNOWN = 0x00000000,
    NTMS_PORTCONTENT_FULL    = 0x00000001,
    NTMS_PORTCONTENT_EMPTY   = 0x00000002,
}

struct NTMS_IEPORTINFORMATION
{
    uint Number;
    NtmsPortContent Content;
    NtmsPortPosition Position;
    ushort MaxExtendSecs;
    GUID Library;
}
alias NtmsBarCodeState = int;
enum : int
{
    NTMS_BARCODESTATE_OK         = 0x00000001,
    NTMS_BARCODESTATE_UNREADABLE = 0x00000002,
}

alias NtmsMediaState = int;
enum : int
{
    NTMS_MEDIASTATE_IDLE     = 0x00000000,
    NTMS_MEDIASTATE_INUSE    = 0x00000001,
    NTMS_MEDIASTATE_MOUNTED  = 0x00000002,
    NTMS_MEDIASTATE_LOADED   = 0x00000003,
    NTMS_MEDIASTATE_UNLOADED = 0x00000004,
    NTMS_MEDIASTATE_OPERROR  = 0x00000005,
    NTMS_MEDIASTATE_OPREQ    = 0x00000006,
}

struct NTMS_PMIDINFORMATIONA
{
    GUID CurrentLibrary;
    GUID MediaPool;
    GUID Location;
    uint LocationType;
    GUID MediaType;
    GUID HomeSlot;
    CHAR[64] szBarCode;
    NtmsBarCodeState BarCodeState;
    CHAR[32] szSequenceNumber;
    NtmsMediaState MediaState;
    uint dwNumberOfPartitions;
    uint dwMediaTypeCode;
    uint dwDensityCode;
    GUID MountedPartition;
}
struct NTMS_PMIDINFORMATIONW
{
    GUID CurrentLibrary;
    GUID MediaPool;
    GUID Location;
    uint LocationType;
    GUID MediaType;
    GUID HomeSlot;
    wchar[64] szBarCode;
    NtmsBarCodeState BarCodeState;
    wchar[32] szSequenceNumber;
    NtmsMediaState MediaState;
    uint dwNumberOfPartitions;
    uint dwMediaTypeCode;
    uint dwDensityCode;
    GUID MountedPartition;
}
struct NTMS_LMIDINFORMATION
{
    GUID MediaPool;
    uint dwNumberOfPartitions;
}
alias NtmsPartitionState = int;
enum : int
{
    NTMS_PARTSTATE_UNKNOWN        = 0x00000000,
    NTMS_PARTSTATE_UNPREPARED     = 0x00000001,
    NTMS_PARTSTATE_INCOMPATIBLE   = 0x00000002,
    NTMS_PARTSTATE_DECOMMISSIONED = 0x00000003,
    NTMS_PARTSTATE_AVAILABLE      = 0x00000004,
    NTMS_PARTSTATE_ALLOCATED      = 0x00000005,
    NTMS_PARTSTATE_COMPLETE       = 0x00000006,
    NTMS_PARTSTATE_FOREIGN        = 0x00000007,
    NTMS_PARTSTATE_IMPORT         = 0x00000008,
    NTMS_PARTSTATE_RESERVED       = 0x00000009,
}

struct NTMS_PARTITIONINFORMATIONA
{
    GUID PhysicalMedia;
    GUID LogicalMedia;
    NtmsPartitionState State;
    ushort Side;
    uint dwOmidLabelIdLength;
    ubyte[255] OmidLabelId;
    CHAR[64] szOmidLabelType;
    CHAR[256] szOmidLabelInfo;
    uint dwMountCount;
    uint dwAllocateCount;
    LARGE_INTEGER Capacity;
}
struct NTMS_PARTITIONINFORMATIONW
{
    GUID PhysicalMedia;
    GUID LogicalMedia;
    NtmsPartitionState State;
    ushort Side;
    uint dwOmidLabelIdLength;
    ubyte[255] OmidLabelId;
    wchar[64] szOmidLabelType;
    wchar[256] szOmidLabelInfo;
    uint dwMountCount;
    uint dwAllocateCount;
    LARGE_INTEGER Capacity;
}
alias NtmsPoolType = int;
enum : int
{
    NTMS_POOLTYPE_UNKNOWN     = 0x00000000,
    NTMS_POOLTYPE_SCRATCH     = 0x00000001,
    NTMS_POOLTYPE_FOREIGN     = 0x00000002,
    NTMS_POOLTYPE_IMPORT      = 0x00000003,
    NTMS_POOLTYPE_APPLICATION = 0x000003e8,
}

alias NtmsAllocationPolicy = int;
enum : int
{
    NTMS_ALLOCATE_FROMSCRATCH = 0x00000001,
}

alias NtmsDeallocationPolicy = int;
enum : int
{
    NTMS_DEALLOCATE_TOSCRATCH = 0x00000001,
}

struct NTMS_MEDIAPOOLINFORMATION
{
    uint PoolType;
    GUID MediaType;
    GUID Parent;
    uint AllocationPolicy;
    uint DeallocationPolicy;
    uint dwMaxAllocates;
    uint dwNumberOfPhysicalMedia;
    uint dwNumberOfLogicalMedia;
    uint dwNumberOfMediaPools;
}
alias NtmsReadWriteCharacteristics = int;
enum : int
{
    NTMS_MEDIARW_UNKNOWN    = 0x00000000,
    NTMS_MEDIARW_REWRITABLE = 0x00000001,
    NTMS_MEDIARW_WRITEONCE  = 0x00000002,
    NTMS_MEDIARW_READONLY   = 0x00000003,
}

struct NTMS_MEDIATYPEINFORMATION
{
    uint MediaType;
    uint NumberOfSides;
    NtmsReadWriteCharacteristics ReadWriteCharacteristics;
    FILE_DEVICE_TYPE DeviceType;
}
struct NTMS_DRIVETYPEINFORMATIONA
{
    CHAR[128] szVendor;
    CHAR[128] szProduct;
    uint NumberOfHeads;
    FILE_DEVICE_TYPE DeviceType;
}
struct NTMS_DRIVETYPEINFORMATIONW
{
    wchar[128] szVendor;
    wchar[128] szProduct;
    uint NumberOfHeads;
    FILE_DEVICE_TYPE DeviceType;
}
struct NTMS_CHANGERTYPEINFORMATIONA
{
    CHAR[128] szVendor;
    CHAR[128] szProduct;
    uint DeviceType;
}
struct NTMS_CHANGERTYPEINFORMATIONW
{
    wchar[128] szVendor;
    wchar[128] szProduct;
    uint DeviceType;
}
alias NtmsLmOperation = int;
enum : int
{
    NTMS_LM_REMOVE         = 0x00000000,
    NTMS_LM_DISABLECHANGER = 0x00000001,
    NTMS_LM_DISABLELIBRARY = 0x00000001,
    NTMS_LM_ENABLECHANGER  = 0x00000002,
    NTMS_LM_ENABLELIBRARY  = 0x00000002,
    NTMS_LM_DISABLEDRIVE   = 0x00000003,
    NTMS_LM_ENABLEDRIVE    = 0x00000004,
    NTMS_LM_DISABLEMEDIA   = 0x00000005,
    NTMS_LM_ENABLEMEDIA    = 0x00000006,
    NTMS_LM_UPDATEOMID     = 0x00000007,
    NTMS_LM_INVENTORY      = 0x00000008,
    NTMS_LM_DOORACCESS     = 0x00000009,
    NTMS_LM_EJECT          = 0x0000000a,
    NTMS_LM_EJECTCLEANER   = 0x0000000b,
    NTMS_LM_INJECT         = 0x0000000c,
    NTMS_LM_INJECTCLEANER  = 0x0000000d,
    NTMS_LM_PROCESSOMID    = 0x0000000e,
    NTMS_LM_CLEANDRIVE     = 0x0000000f,
    NTMS_LM_DISMOUNT       = 0x00000010,
    NTMS_LM_MOUNT          = 0x00000011,
    NTMS_LM_WRITESCRATCH   = 0x00000012,
    NTMS_LM_CLASSIFY       = 0x00000013,
    NTMS_LM_RESERVECLEANER = 0x00000014,
    NTMS_LM_RELEASECLEANER = 0x00000015,
    NTMS_LM_MAXWORKITEM    = 0x00000016,
}

alias NtmsLmState = int;
enum : int
{
    NTMS_LM_QUEUED    = 0x00000000,
    NTMS_LM_INPROCESS = 0x00000001,
    NTMS_LM_PASSED    = 0x00000002,
    NTMS_LM_FAILED    = 0x00000003,
    NTMS_LM_INVALID   = 0x00000004,
    NTMS_LM_WAITING   = 0x00000005,
    NTMS_LM_DEFERRED  = 0x00000006,
    NTMS_LM_DEFFERED  = 0x00000006,
    NTMS_LM_CANCELLED = 0x00000007,
    NTMS_LM_STOPPED   = 0x00000008,
}

struct NTMS_LIBREQUESTINFORMATIONA
{
    NtmsLmOperation OperationCode;
    uint OperationOption;
    NtmsLmState State;
    GUID PartitionId;
    GUID DriveId;
    GUID PhysMediaId;
    GUID Library;
    GUID SlotId;
    SYSTEMTIME TimeQueued;
    SYSTEMTIME TimeCompleted;
    CHAR[64] szApplication;
    CHAR[64] szUser;
    CHAR[64] szComputer;
    uint dwErrorCode;
    GUID WorkItemId;
    uint dwPriority;
}
struct NTMS_LIBREQUESTINFORMATIONW
{
    NtmsLmOperation OperationCode;
    uint OperationOption;
    NtmsLmState State;
    GUID PartitionId;
    GUID DriveId;
    GUID PhysMediaId;
    GUID Library;
    GUID SlotId;
    SYSTEMTIME TimeQueued;
    SYSTEMTIME TimeCompleted;
    wchar[64] szApplication;
    wchar[64] szUser;
    wchar[64] szComputer;
    uint dwErrorCode;
    GUID WorkItemId;
    uint dwPriority;
}
alias NtmsOpreqCommand = int;
enum : int
{
    NTMS_OPREQ_UNKNOWN       = 0x00000000,
    NTMS_OPREQ_NEWMEDIA      = 0x00000001,
    NTMS_OPREQ_CLEANER       = 0x00000002,
    NTMS_OPREQ_DEVICESERVICE = 0x00000003,
    NTMS_OPREQ_MOVEMEDIA     = 0x00000004,
    NTMS_OPREQ_MESSAGE       = 0x00000005,
}

alias NtmsOpreqState = int;
enum : int
{
    NTMS_OPSTATE_UNKNOWN    = 0x00000000,
    NTMS_OPSTATE_SUBMITTED  = 0x00000001,
    NTMS_OPSTATE_ACTIVE     = 0x00000002,
    NTMS_OPSTATE_INPROGRESS = 0x00000003,
    NTMS_OPSTATE_REFUSED    = 0x00000004,
    NTMS_OPSTATE_COMPLETE   = 0x00000005,
}

struct NTMS_OPREQUESTINFORMATIONA
{
    NtmsOpreqCommand Request;
    SYSTEMTIME Submitted;
    NtmsOpreqState State;
    CHAR[256] szMessage;
    NtmsObjectsTypes Arg1Type;
    GUID Arg1;
    NtmsObjectsTypes Arg2Type;
    GUID Arg2;
    CHAR[64] szApplication;
    CHAR[64] szUser;
    CHAR[64] szComputer;
}
struct NTMS_OPREQUESTINFORMATIONW
{
    NtmsOpreqCommand Request;
    SYSTEMTIME Submitted;
    NtmsOpreqState State;
    wchar[256] szMessage;
    NtmsObjectsTypes Arg1Type;
    GUID Arg1;
    NtmsObjectsTypes Arg2Type;
    GUID Arg2;
    wchar[64] szApplication;
    wchar[64] szUser;
    wchar[64] szComputer;
}
struct NTMS_COMPUTERINFORMATION
{
    uint dwLibRequestPurgeTime;
    uint dwOpRequestPurgeTime;
    uint dwLibRequestFlags;
    uint dwOpRequestFlags;
    uint dwMediaPoolPolicy;
}
alias NtmsLibRequestFlags = int;
enum : int
{
    NTMS_LIBREQFLAGS_NOAUTOPURGE   = 0x00000001,
    NTMS_LIBREQFLAGS_NOFAILEDPURGE = 0x00000002,
}

alias NtmsOpRequestFlags = int;
enum : int
{
    NTMS_OPREQFLAGS_NOAUTOPURGE   = 0x00000001,
    NTMS_OPREQFLAGS_NOFAILEDPURGE = 0x00000002,
    NTMS_OPREQFLAGS_NOALERTS      = 0x00000010,
    NTMS_OPREQFLAGS_NOTRAYICON    = 0x00000020,
}

alias NtmsMediaPoolPolicy = int;
enum : int
{
    NTMS_POOLPOLICY_PURGEOFFLINESCRATCH = 0x00000001,
    NTMS_POOLPOLICY_KEEPOFFLINEIMPORT   = 0x00000002,
}

alias NtmsOperationalState = int;
enum : int
{
    NTMS_READY         = 0x00000000,
    NTMS_INITIALIZING  = 0x0000000a,
    NTMS_NEEDS_SERVICE = 0x00000014,
    NTMS_NOT_PRESENT   = 0x00000015,
}

struct NTMS_OBJECTINFORMATIONA
{
    uint dwSize;
    NtmsObjectsTypes dwType;
    SYSTEMTIME Created;
    SYSTEMTIME Modified;
    GUID ObjectGuid;
    BOOL Enabled;
    NtmsOperationalState dwOperationalState;
    CHAR[64] szName;
    CHAR[127] szDescription;
    union _Info_e__Union
    {
        NTMS_DRIVEINFORMATIONA Drive;
        NTMS_DRIVETYPEINFORMATIONA DriveType;
        NTMS_LIBRARYINFORMATION Library;
        NTMS_CHANGERINFORMATIONA Changer;
        NTMS_CHANGERTYPEINFORMATIONA ChangerType;
        NTMS_STORAGESLOTINFORMATION StorageSlot;
        NTMS_IEDOORINFORMATION IEDoor;
        NTMS_IEPORTINFORMATION IEPort;
        NTMS_PMIDINFORMATIONA PhysicalMedia;
        NTMS_LMIDINFORMATION LogicalMedia;
        NTMS_PARTITIONINFORMATIONA Partition;
        NTMS_MEDIAPOOLINFORMATION MediaPool;
        NTMS_MEDIATYPEINFORMATION MediaType;
        NTMS_LIBREQUESTINFORMATIONA LibRequest;
        NTMS_OPREQUESTINFORMATIONA OpRequest;
        NTMS_COMPUTERINFORMATION Computer;
    }
}
struct NTMS_OBJECTINFORMATIONW
{
    uint dwSize;
    NtmsObjectsTypes dwType;
    SYSTEMTIME Created;
    SYSTEMTIME Modified;
    GUID ObjectGuid;
    BOOL Enabled;
    NtmsOperationalState dwOperationalState;
    wchar[64] szName;
    wchar[127] szDescription;
    union _Info_e__Union
    {
        NTMS_DRIVEINFORMATIONW Drive;
        NTMS_DRIVETYPEINFORMATIONW DriveType;
        NTMS_LIBRARYINFORMATION Library;
        NTMS_CHANGERINFORMATIONW Changer;
        NTMS_CHANGERTYPEINFORMATIONW ChangerType;
        NTMS_STORAGESLOTINFORMATION StorageSlot;
        NTMS_IEDOORINFORMATION IEDoor;
        NTMS_IEPORTINFORMATION IEPort;
        NTMS_PMIDINFORMATIONW PhysicalMedia;
        NTMS_LMIDINFORMATION LogicalMedia;
        NTMS_PARTITIONINFORMATIONW Partition;
        NTMS_MEDIAPOOLINFORMATION MediaPool;
        NTMS_MEDIATYPEINFORMATION MediaType;
        NTMS_LIBREQUESTINFORMATIONW LibRequest;
        NTMS_OPREQUESTINFORMATIONW OpRequest;
        NTMS_COMPUTERINFORMATION Computer;
    }
}
struct NTMS_I1_LIBRARYINFORMATION
{
    uint LibraryType;
    GUID CleanerSlot;
    GUID CleanerSlotDefault;
    BOOL LibrarySupportsDriveCleaning;
    BOOL BarCodeReaderInstalled;
    uint InventoryMethod;
    uint dwCleanerUsesRemaining;
    uint FirstDriveNumber;
    uint dwNumberOfDrives;
    uint FirstSlotNumber;
    uint dwNumberOfSlots;
    uint FirstDoorNumber;
    uint dwNumberOfDoors;
    uint FirstPortNumber;
    uint dwNumberOfPorts;
    uint FirstChangerNumber;
    uint dwNumberOfChangers;
    uint dwNumberOfMedia;
    uint dwNumberOfMediaTypes;
    uint dwNumberOfLibRequests;
    GUID Reserved;
}
struct NTMS_I1_LIBREQUESTINFORMATIONA
{
    uint OperationCode;
    uint OperationOption;
    uint State;
    GUID PartitionId;
    GUID DriveId;
    GUID PhysMediaId;
    GUID Library;
    GUID SlotId;
    SYSTEMTIME TimeQueued;
    SYSTEMTIME TimeCompleted;
    CHAR[64] szApplication;
    CHAR[64] szUser;
    CHAR[64] szComputer;
}
struct NTMS_I1_LIBREQUESTINFORMATIONW
{
    uint OperationCode;
    uint OperationOption;
    uint State;
    GUID PartitionId;
    GUID DriveId;
    GUID PhysMediaId;
    GUID Library;
    GUID SlotId;
    SYSTEMTIME TimeQueued;
    SYSTEMTIME TimeCompleted;
    wchar[64] szApplication;
    wchar[64] szUser;
    wchar[64] szComputer;
}
struct NTMS_I1_PMIDINFORMATIONA
{
    GUID CurrentLibrary;
    GUID MediaPool;
    GUID Location;
    uint LocationType;
    GUID MediaType;
    GUID HomeSlot;
    CHAR[64] szBarCode;
    uint BarCodeState;
    CHAR[32] szSequenceNumber;
    uint MediaState;
    uint dwNumberOfPartitions;
}
struct NTMS_I1_PMIDINFORMATIONW
{
    GUID CurrentLibrary;
    GUID MediaPool;
    GUID Location;
    uint LocationType;
    GUID MediaType;
    GUID HomeSlot;
    wchar[64] szBarCode;
    uint BarCodeState;
    wchar[32] szSequenceNumber;
    uint MediaState;
    uint dwNumberOfPartitions;
}
struct NTMS_I1_PARTITIONINFORMATIONA
{
    GUID PhysicalMedia;
    GUID LogicalMedia;
    uint State;
    ushort Side;
    uint dwOmidLabelIdLength;
    ubyte[255] OmidLabelId;
    CHAR[64] szOmidLabelType;
    CHAR[256] szOmidLabelInfo;
    uint dwMountCount;
    uint dwAllocateCount;
}
struct NTMS_I1_PARTITIONINFORMATIONW
{
    GUID PhysicalMedia;
    GUID LogicalMedia;
    uint State;
    ushort Side;
    uint dwOmidLabelIdLength;
    ubyte[255] OmidLabelId;
    wchar[64] szOmidLabelType;
    wchar[256] szOmidLabelInfo;
    uint dwMountCount;
    uint dwAllocateCount;
}
struct NTMS_I1_OPREQUESTINFORMATIONA
{
    uint Request;
    SYSTEMTIME Submitted;
    uint State;
    CHAR[127] szMessage;
    uint Arg1Type;
    GUID Arg1;
    uint Arg2Type;
    GUID Arg2;
    CHAR[64] szApplication;
    CHAR[64] szUser;
    CHAR[64] szComputer;
}
struct NTMS_I1_OPREQUESTINFORMATIONW
{
    uint Request;
    SYSTEMTIME Submitted;
    uint State;
    wchar[127] szMessage;
    uint Arg1Type;
    GUID Arg1;
    uint Arg2Type;
    GUID Arg2;
    wchar[64] szApplication;
    wchar[64] szUser;
    wchar[64] szComputer;
}
struct NTMS_I1_OBJECTINFORMATIONA
{
    uint dwSize;
    uint dwType;
    SYSTEMTIME Created;
    SYSTEMTIME Modified;
    GUID ObjectGuid;
    BOOL Enabled;
    uint dwOperationalState;
    CHAR[64] szName;
    CHAR[127] szDescription;
    union _Info_e__Union
    {
        NTMS_DRIVEINFORMATIONA Drive;
        NTMS_DRIVETYPEINFORMATIONA DriveType;
        NTMS_I1_LIBRARYINFORMATION Library;
        NTMS_CHANGERINFORMATIONA Changer;
        NTMS_CHANGERTYPEINFORMATIONA ChangerType;
        NTMS_STORAGESLOTINFORMATION StorageSlot;
        NTMS_IEDOORINFORMATION IEDoor;
        NTMS_IEPORTINFORMATION IEPort;
        NTMS_I1_PMIDINFORMATIONA PhysicalMedia;
        NTMS_LMIDINFORMATION LogicalMedia;
        NTMS_I1_PARTITIONINFORMATIONA Partition;
        NTMS_MEDIAPOOLINFORMATION MediaPool;
        NTMS_MEDIATYPEINFORMATION MediaType;
        NTMS_I1_LIBREQUESTINFORMATIONA LibRequest;
        NTMS_I1_OPREQUESTINFORMATIONA OpRequest;
    }
}
struct NTMS_I1_OBJECTINFORMATIONW
{
    uint dwSize;
    uint dwType;
    SYSTEMTIME Created;
    SYSTEMTIME Modified;
    GUID ObjectGuid;
    BOOL Enabled;
    uint dwOperationalState;
    wchar[64] szName;
    wchar[127] szDescription;
    union _Info_e__Union
    {
        NTMS_DRIVEINFORMATIONW Drive;
        NTMS_DRIVETYPEINFORMATIONW DriveType;
        NTMS_I1_LIBRARYINFORMATION Library;
        NTMS_CHANGERINFORMATIONW Changer;
        NTMS_CHANGERTYPEINFORMATIONW ChangerType;
        NTMS_STORAGESLOTINFORMATION StorageSlot;
        NTMS_IEDOORINFORMATION IEDoor;
        NTMS_IEPORTINFORMATION IEPort;
        NTMS_I1_PMIDINFORMATIONW PhysicalMedia;
        NTMS_LMIDINFORMATION LogicalMedia;
        NTMS_I1_PARTITIONINFORMATIONW Partition;
        NTMS_MEDIAPOOLINFORMATION MediaPool;
        NTMS_MEDIATYPEINFORMATION MediaType;
        NTMS_I1_LIBREQUESTINFORMATIONW LibRequest;
        NTMS_I1_OPREQUESTINFORMATIONW OpRequest;
    }
}
alias NtmsCreateNtmsMediaOptions = int;
enum : int
{
    NTMS_ERROR_ON_DUPLICATE = 0x00000001,
}

alias NtmsEnumerateOption = int;
enum : int
{
    NTMS_ENUM_DEFAULT  = 0x00000000,
    NTMS_ENUM_ROOTPOOL = 0x00000001,
}

alias NtmsEjectOperation = int;
enum : int
{
    NTMS_EJECT_START     = 0x00000000,
    NTMS_EJECT_STOP      = 0x00000001,
    NTMS_EJECT_QUEUE     = 0x00000002,
    NTMS_EJECT_FORCE     = 0x00000003,
    NTMS_EJECT_IMMEDIATE = 0x00000004,
    NTMS_EJECT_ASK_USER  = 0x00000005,
}

alias NtmsInjectOperation = int;
enum : int
{
    NTMS_INJECT_START     = 0x00000000,
    NTMS_INJECT_STOP      = 0x00000001,
    NTMS_INJECT_RETRACT   = 0x00000002,
    NTMS_INJECT_STARTMANY = 0x00000003,
}

struct NTMS_FILESYSTEM_INFO
{
    wchar[64] FileSystemType;
    wchar[256] VolumeName;
    uint SerialNumber;
}
alias NtmsDriveType = int;
enum : int
{
    NTMS_UNKNOWN_DRIVE = 0x00000000,
}

alias NtmsAccessMask = int;
enum : int
{
    NTMS_USE_ACCESS     = 0x00000001,
    NTMS_MODIFY_ACCESS  = 0x00000002,
    NTMS_CONTROL_ACCESS = 0x00000004,
}

alias NtmsUITypes = int;
enum : int
{
    NTMS_UITYPE_INVALID = 0x00000000,
    NTMS_UITYPE_INFO    = 0x00000001,
    NTMS_UITYPE_REQ     = 0x00000002,
    NTMS_UITYPE_ERR     = 0x00000003,
    NTMS_UITYPE_MAX     = 0x00000004,
}

alias NtmsUIOperations = int;
enum : int
{
    NTMS_UIDEST_ADD       = 0x00000001,
    NTMS_UIDEST_DELETE    = 0x00000002,
    NTMS_UIDEST_DELETEALL = 0x00000003,
    NTMS_UIOPERATION_MAX  = 0x00000004,
}

alias NtmsNotificationOperations = int;
enum : int
{
    NTMS_OBJ_UPDATE     = 0x00000001,
    NTMS_OBJ_INSERT     = 0x00000002,
    NTMS_OBJ_DELETE     = 0x00000003,
    NTMS_EVENT_SIGNAL   = 0x00000004,
    NTMS_EVENT_COMPLETE = 0x00000005,
}

struct NTMS_NOTIFICATIONINFORMATION
{
    NtmsNotificationOperations dwOperation;
    GUID ObjectId;
}
struct MediaLabelInfo
{
    wchar[64] LabelType;
    uint LabelIDSize;
    ubyte[256] LabelID;
    wchar[256] LabelAppDescr;
}
alias MAXMEDIALABEL = uint function(uint*);
alias CLAIMMEDIALABEL = uint function(const(ubyte)*, const(uint), MediaLabelInfo*);
alias CLAIMMEDIALABELEX = uint function(const(ubyte)*, const(uint), MediaLabelInfo*, GUID*);
struct CLS_LSN
{
    ulong Internal;
}
alias CLS_CONTEXT_MODE = int;
enum : int
{
    ClsContextNone     = 0x00000000,
    ClsContextUndoNext = 0x00000001,
    ClsContextPrevious = 0x00000002,
    ClsContextForward  = 0x00000003,
}

alias CLFS_CONTEXT_MODE = int;
enum : int
{
    ClfsContextNone     = 0x00000000,
    ClfsContextUndoNext = 0x00000001,
    ClfsContextPrevious = 0x00000002,
    ClfsContextForward  = 0x00000003,
}

struct CLFS_NODE_ID
{
    uint cType;
    uint cbNode;
}
struct CLS_WRITE_ENTRY
{
    void* Buffer;
    uint ByteLength;
}
struct CLS_INFORMATION
{
    long TotalAvailable;
    long CurrentAvailable;
    long TotalReservation;
    ulong BaseFileSize;
    ulong ContainerSize;
    uint TotalContainers;
    uint FreeContainers;
    uint TotalClients;
    uint Attributes;
    uint FlushThreshold;
    uint SectorSize;
    CLS_LSN MinArchiveTailLsn;
    CLS_LSN BaseLsn;
    CLS_LSN LastFlushedLsn;
    CLS_LSN LastLsn;
    CLS_LSN RestartLsn;
    GUID Identity;
}
struct CLFS_LOG_NAME_INFORMATION
{
    ushort NameLengthInBytes;
    wchar[1] Name;
}
struct CLFS_STREAM_ID_INFORMATION
{
    ubyte StreamIdentifier;
}
struct CLFS_PHYSICAL_LSN_INFORMATION
{
    ubyte StreamIdentifier;
    CLS_LSN VirtualLsn;
    CLS_LSN PhysicalLsn;
}
struct CLS_CONTAINER_INFORMATION
{
    uint FileAttributes;
    ulong CreationTime;
    ulong LastAccessTime;
    ulong LastWriteTime;
    long ContainerSize;
    uint FileNameActualLength;
    uint FileNameLength;
    wchar[256] FileName;
    uint State;
    uint PhysicalContainerId;
    uint LogicalContainerId;
}
alias CLS_LOG_INFORMATION_CLASS = int;
enum : int
{
    ClfsLogBasicInformation            = 0x00000000,
    ClfsLogBasicInformationPhysical    = 0x00000001,
    ClfsLogPhysicalNameInformation     = 0x00000002,
    ClfsLogStreamIdentifierInformation = 0x00000003,
    ClfsLogSystemMarkingInformation    = 0x00000004,
    ClfsLogPhysicalLsnInformation      = 0x00000005,
}

alias CLS_IOSTATS_CLASS = int;
enum : int
{
    ClsIoStatsDefault = 0x00000000,
    ClsIoStatsMax     = 0x0000ffff,
}

alias CLFS_IOSTATS_CLASS = int;
enum : int
{
    ClfsIoStatsDefault = 0x00000000,
    ClfsIoStatsMax     = 0x0000ffff,
}

struct CLS_IO_STATISTICS_HEADER
{
    ubyte ubMajorVersion;
    ubyte ubMinorVersion;
    CLFS_IOSTATS_CLASS eStatsClass;
    ushort cbLength;
    uint coffData;
}
struct CLS_IO_STATISTICS
{
    CLS_IO_STATISTICS_HEADER hdrIoStats;
    ulong cFlush;
    ulong cbFlush;
    ulong cMetaFlush;
    ulong cbMetaFlush;
}
struct CLS_SCAN_CONTEXT
{
    CLFS_NODE_ID cidNode;
    HANDLE hLog;
    uint cIndex;
    uint cContainers;
    uint cContainersReturned;
    ubyte eScanMode;
    CLS_CONTAINER_INFORMATION* pinfoContainer;
}
struct CLS_ARCHIVE_DESCRIPTOR
{
    ulong coffLow;
    ulong coffHigh;
    CLS_CONTAINER_INFORMATION infoContainer;
}
alias CLFS_BLOCK_ALLOCATION = void* function(uint, void*);
alias CLFS_BLOCK_DEALLOCATION = void function(void*, void*);
alias CLFS_LOG_ARCHIVE_MODE = int;
enum : int
{
    ClfsLogArchiveEnabled  = 0x00000001,
    ClfsLogArchiveDisabled = 0x00000002,
}

alias PCLFS_COMPLETION_ROUTINE = void function(void*, uint);
alias CLFS_MGMT_POLICY_TYPE = int;
enum : int
{
    ClfsMgmtPolicyMaximumSize           = 0x00000000,
    ClfsMgmtPolicyMinimumSize           = 0x00000001,
    ClfsMgmtPolicyNewContainerSize      = 0x00000002,
    ClfsMgmtPolicyGrowthRate            = 0x00000003,
    ClfsMgmtPolicyLogTail               = 0x00000004,
    ClfsMgmtPolicyAutoShrink            = 0x00000005,
    ClfsMgmtPolicyAutoGrow              = 0x00000006,
    ClfsMgmtPolicyNewContainerPrefix    = 0x00000007,
    ClfsMgmtPolicyNewContainerSuffix    = 0x00000008,
    ClfsMgmtPolicyNewContainerExtension = 0x00000009,
    ClfsMgmtPolicyInvalid               = 0x0000000a,
}

struct CLFS_MGMT_POLICY
{
    uint Version;
    uint LengthInBytes;
    uint PolicyFlags;
    CLFS_MGMT_POLICY_TYPE PolicyType;
    union _PolicyParameters_e__Union
    {
        struct _MaximumSize_e__Struct
        {
            uint Containers;
        }
        struct _MinimumSize_e__Struct
        {
            uint Containers;
        }
        struct _NewContainerSize_e__Struct
        {
            uint SizeInBytes;
        }
        struct _GrowthRate_e__Struct
        {
            uint AbsoluteGrowthInContainers;
            uint RelativeGrowthPercentage;
        }
        struct _LogTail_e__Struct
        {
            uint MinimumAvailablePercentage;
            uint MinimumAvailableContainers;
        }
        struct _AutoShrink_e__Struct
        {
            uint Percentage;
        }
        struct _AutoGrow_e__Struct
        {
            uint Enabled;
        }
        struct _NewContainerPrefix_e__Struct
        {
            ushort PrefixLengthInBytes;
            wchar[1] PrefixString;
        }
        struct _NewContainerSuffix_e__Struct
        {
            ulong NextContainerSuffix;
        }
        struct _NewContainerExtension_e__Struct
        {
            ushort ExtensionLengthInBytes;
            wchar[1] ExtensionString;
        }
    }
}
alias CLFS_MGMT_NOTIFICATION_TYPE = int;
enum : int
{
    ClfsMgmtAdvanceTailNotification    = 0x00000000,
    ClfsMgmtLogFullHandlerNotification = 0x00000001,
    ClfsMgmtLogUnpinnedNotification    = 0x00000002,
    ClfsMgmtLogWriteNotification       = 0x00000003,
}

struct CLFS_MGMT_NOTIFICATION
{
    CLFS_MGMT_NOTIFICATION_TYPE Notification;
    CLS_LSN Lsn;
    ushort LogIsPinned;
}
alias PLOG_TAIL_ADVANCE_CALLBACK = void function(HANDLE, CLS_LSN, void*);
alias PLOG_FULL_HANDLER_CALLBACK = void function(HANDLE, uint, BOOL, void*);
alias PLOG_UNPINNED_CALLBACK = void function(HANDLE, void*);
struct LOG_MANAGEMENT_CALLBACKS
{
    void* CallbackContext;
    PLOG_TAIL_ADVANCE_CALLBACK AdvanceTailCallback;
    PLOG_FULL_HANDLER_CALLBACK LogFullHandlerCallback;
    PLOG_UNPINNED_CALLBACK LogUnpinnedCallback;
}
struct DISKQUOTA_USER_INFORMATION
{
    long QuotaUsed;
    long QuotaThreshold;
    long QuotaLimit;
}
enum IID_IDiskQuotaUser = GUID(0x7988b574, 0xec89, 0x11cf, [0x9c, 0x0, 0x0, 0xaa, 0x0, 0xa1, 0x4f, 0x56]);
interface IDiskQuotaUser : IUnknown
{
    HRESULT GetID(uint*);
    HRESULT GetName(PWSTR, uint, PWSTR, uint, PWSTR, uint);
    HRESULT GetSidLength(uint*);
    HRESULT GetSid(ubyte*, uint);
    HRESULT GetQuotaThreshold(long*);
    HRESULT GetQuotaThresholdText(PWSTR, uint);
    HRESULT GetQuotaLimit(long*);
    HRESULT GetQuotaLimitText(PWSTR, uint);
    HRESULT GetQuotaUsed(long*);
    HRESULT GetQuotaUsedText(PWSTR, uint);
    HRESULT GetQuotaInformation(void*, uint);
    HRESULT SetQuotaThreshold(long, BOOL);
    HRESULT SetQuotaLimit(long, BOOL);
    HRESULT Invalidate();
    HRESULT GetAccountStatus(uint*);
}
enum IID_IEnumDiskQuotaUsers = GUID(0x7988b577, 0xec89, 0x11cf, [0x9c, 0x0, 0x0, 0xaa, 0x0, 0xa1, 0x4f, 0x56]);
interface IEnumDiskQuotaUsers : IUnknown
{
    HRESULT Next(uint, IDiskQuotaUser*, uint*);
    HRESULT Skip(uint);
    HRESULT Reset();
    HRESULT Clone(IEnumDiskQuotaUsers*);
}
enum IID_IDiskQuotaUserBatch = GUID(0x7988b576, 0xec89, 0x11cf, [0x9c, 0x0, 0x0, 0xaa, 0x0, 0xa1, 0x4f, 0x56]);
interface IDiskQuotaUserBatch : IUnknown
{
    HRESULT Add(IDiskQuotaUser);
    HRESULT Remove(IDiskQuotaUser);
    HRESULT RemoveAll();
    HRESULT FlushToDisk();
}
enum IID_IDiskQuotaControl = GUID(0x7988b572, 0xec89, 0x11cf, [0x9c, 0x0, 0x0, 0xaa, 0x0, 0xa1, 0x4f, 0x56]);
interface IDiskQuotaControl : IConnectionPointContainer
{
    HRESULT Initialize(const(wchar)*, BOOL);
    HRESULT SetQuotaState(uint);
    HRESULT GetQuotaState(uint*);
    HRESULT SetQuotaLogFlags(uint);
    HRESULT GetQuotaLogFlags(uint*);
    HRESULT SetDefaultQuotaThreshold(long);
    HRESULT GetDefaultQuotaThreshold(long*);
    HRESULT GetDefaultQuotaThresholdText(PWSTR, uint);
    HRESULT SetDefaultQuotaLimit(long);
    HRESULT GetDefaultQuotaLimit(long*);
    HRESULT GetDefaultQuotaLimitText(PWSTR, uint);
    HRESULT AddUserSid(PSID, DISKQUOTA_USERNAME_RESOLVE, IDiskQuotaUser*);
    HRESULT AddUserName(const(wchar)*, DISKQUOTA_USERNAME_RESOLVE, IDiskQuotaUser*);
    HRESULT DeleteUser(IDiskQuotaUser);
    HRESULT FindUserSid(PSID, DISKQUOTA_USERNAME_RESOLVE, IDiskQuotaUser*);
    HRESULT FindUserName(const(wchar)*, IDiskQuotaUser*);
    HRESULT CreateEnumUsers(PSID*, uint, DISKQUOTA_USERNAME_RESOLVE, IEnumDiskQuotaUsers*);
    HRESULT CreateUserBatch(IDiskQuotaUserBatch*);
    HRESULT InvalidateSidNameCache();
    HRESULT GiveUserNameResolutionPriority(IDiskQuotaUser);
    HRESULT ShutdownNameResolution();
}
enum IID_IDiskQuotaEvents = GUID(0x7988b579, 0xec89, 0x11cf, [0x9c, 0x0, 0x0, 0xaa, 0x0, 0xa1, 0x4f, 0x56]);
interface IDiskQuotaEvents : IUnknown
{
    HRESULT OnUserNameChanged(IDiskQuotaUser);
}
struct EFS_CERTIFICATE_BLOB
{
    uint dwCertEncodingType;
    uint cbData;
    ubyte* pbData;
}
struct EFS_HASH_BLOB
{
    uint cbData;
    ubyte* pbData;
}
struct EFS_RPC_BLOB
{
    uint cbData;
    ubyte* pbData;
}
struct EFS_PIN_BLOB
{
    uint cbPadding;
    uint cbData;
    ubyte* pbData;
}
struct EFS_KEY_INFO
{
    uint dwVersion;
    uint Entropy;
    uint Algorithm;
    uint KeyLength;
}
struct EFS_COMPATIBILITY_INFO
{
    uint EfsVersion;
}
struct EFS_VERSION_INFO
{
    uint EfsVersion;
    uint SubVersion;
}
struct EFS_DECRYPTION_STATUS_INFO
{
    uint dwDecryptionError;
    uint dwHashOffset;
    uint cbHash;
}
struct EFS_ENCRYPTION_STATUS_INFO
{
    BOOL bHasCurrentKey;
    uint dwEncryptionError;
}
struct ENCRYPTION_CERTIFICATE
{
    uint cbTotalLength;
    SID* pUserSid;
    EFS_CERTIFICATE_BLOB* pCertBlob;
}
struct ENCRYPTION_CERTIFICATE_HASH
{
    uint cbTotalLength;
    SID* pUserSid;
    EFS_HASH_BLOB* pHash;
    PWSTR lpDisplayInformation;
}
struct ENCRYPTION_CERTIFICATE_HASH_LIST
{
    uint nCert_Hash;
    ENCRYPTION_CERTIFICATE_HASH** pUsers;
}
struct ENCRYPTION_CERTIFICATE_LIST
{
    uint nUsers;
    ENCRYPTION_CERTIFICATE** pUsers;
}
struct ENCRYPTED_FILE_METADATA_SIGNATURE
{
    uint dwEfsAccessType;
    ENCRYPTION_CERTIFICATE_HASH_LIST* pCertificatesAdded;
    ENCRYPTION_CERTIFICATE* pEncryptionCertificate;
    EFS_RPC_BLOB* pEfsStreamSignature;
}
struct ENCRYPTION_PROTECTOR
{
    uint cbTotalLength;
    SID* pUserSid;
    PWSTR lpProtectorDescriptor;
}
struct ENCRYPTION_PROTECTOR_LIST
{
    uint nProtectors;
    ENCRYPTION_PROTECTOR** pProtectors;
}
alias WofEnumEntryProc = BOOL function(const(void)*, void*);
alias WofEnumFilesProc = BOOL function(const(wchar)*, void*, void*);
struct WIM_ENTRY_INFO
{
    uint WimEntryInfoSize;
    uint WimType;
    LARGE_INTEGER DataSourceId;
    GUID WimGuid;
    const(wchar)* WimPath;
    uint WimIndex;
    uint Flags;
}
struct WIM_EXTERNAL_FILE_INFO
{
    LARGE_INTEGER DataSourceId;
    ubyte[20] ResourceHash;
    uint Flags;
}
struct WOF_FILE_COMPRESSION_INFO_V0
{
    uint Algorithm;
}
struct WOF_FILE_COMPRESSION_INFO_V1
{
    uint Algorithm;
    uint Flags;
}
struct TXF_ID
{
    struct
    {
        align (4):
        long LowPart;
        long HighPart;
    }
}
struct TXF_LOG_RECORD_BASE
{
    ushort Version;
    TXF_LOG_RECORD_TYPE RecordType;
    uint RecordLength;
}
struct TXF_LOG_RECORD_WRITE
{
    align (4):
    ushort Version;
    ushort RecordType;
    uint RecordLength;
    uint Flags;
    TXF_ID TxfFileId;
    GUID KtmGuid;
    long ByteOffsetInFile;
    uint NumBytesWritten;
    uint ByteOffsetInStructure;
    uint FileNameLength;
    uint FileNameByteOffsetInStructure;
}
struct TXF_LOG_RECORD_TRUNCATE
{
    align (4):
    ushort Version;
    ushort RecordType;
    uint RecordLength;
    uint Flags;
    TXF_ID TxfFileId;
    GUID KtmGuid;
    long NewFileSize;
    uint FileNameLength;
    uint FileNameByteOffsetInStructure;
}
struct TXF_LOG_RECORD_AFFECTED_FILE
{
    ushort Version;
    uint RecordLength;
    uint Flags;
    TXF_ID TxfFileId;
    GUID KtmGuid;
    uint FileNameLength;
    uint FileNameByteOffsetInStructure;
}
struct VOLUME_FAILOVER_SET
{
    uint NumberOfDisks;
    uint[1] DiskNumbers;
}
struct VOLUME_NUMBER
{
    uint VolumeNumber;
    wchar[8] VolumeManagerName;
}
struct VOLUME_LOGICAL_OFFSET
{
    long LogicalOffset;
}
struct VOLUME_PHYSICAL_OFFSET
{
    uint DiskNumber;
    long Offset;
}
struct VOLUME_PHYSICAL_OFFSETS
{
    uint NumberOfPhysicalOffsets;
    VOLUME_PHYSICAL_OFFSET[1] PhysicalOffset;
}
struct VOLUME_READ_PLEX_INPUT
{
    LARGE_INTEGER ByteOffset;
    uint Length;
    uint PlexNumber;
}
struct VOLUME_SET_GPT_ATTRIBUTES_INFORMATION
{
    ulong GptAttributes;
    BOOLEAN RevertOnClose;
    BOOLEAN ApplyToAllConnectedVolumes;
    ushort Reserved1;
    uint Reserved2;
}
struct VOLUME_GET_BC_PROPERTIES_INPUT
{
    uint Version;
    uint Reserved1;
    ulong LowestByteOffset;
    ulong HighestByteOffset;
    uint AccessType;
    uint AccessMode;
}
struct VOLUME_GET_BC_PROPERTIES_OUTPUT
{
    uint MaximumRequestsPerPeriod;
    uint MinimumPeriod;
    ulong MaximumRequestSize;
    uint EstimatedTimePerRequest;
    uint NumOutStandingRequests;
    ulong RequestSize;
}
struct VOLUME_ALLOCATE_BC_STREAM_INPUT
{
    uint Version;
    uint RequestsPerPeriod;
    uint Period;
    BOOLEAN RetryFailures;
    BOOLEAN Discardable;
    BOOLEAN[2] Reserved1;
    ulong LowestByteOffset;
    ulong HighestByteOffset;
    uint AccessType;
    uint AccessMode;
}
struct VOLUME_ALLOCATE_BC_STREAM_OUTPUT
{
    ulong RequestSize;
    uint NumOutStandingRequests;
}
struct FILE_EXTENT
{
    ulong VolumeOffset;
    ulong ExtentLength;
}
struct VOLUME_CRITICAL_IO
{
    uint AccessType;
    uint ExtentsCount;
    FILE_EXTENT[1] Extents;
}
struct VOLUME_ALLOCATION_HINT_INPUT
{
    uint ClusterSize;
    uint NumberOfClusters;
    long StartingClusterNumber;
}
struct VOLUME_ALLOCATION_HINT_OUTPUT
{
    uint[1] Bitmap;
}
struct VOLUME_SHRINK_INFO
{
    ulong VolumeSize;
}
struct SHARE_INFO_0
{
    PWSTR shi0_netname;
}
struct SHARE_INFO_1
{
    PWSTR shi1_netname;
    SHARE_TYPE shi1_type;
    PWSTR shi1_remark;
}
struct SHARE_INFO_2
{
    PWSTR shi2_netname;
    SHARE_TYPE shi2_type;
    PWSTR shi2_remark;
    SHARE_INFO_PERMISSIONS shi2_permissions;
    uint shi2_max_uses;
    uint shi2_current_uses;
    PWSTR shi2_path;
    PWSTR shi2_passwd;
}
struct SHARE_INFO_501
{
    PWSTR shi501_netname;
    SHARE_TYPE shi501_type;
    PWSTR shi501_remark;
    uint shi501_flags;
}
struct SHARE_INFO_502
{
    PWSTR shi502_netname;
    SHARE_TYPE shi502_type;
    PWSTR shi502_remark;
    SHARE_INFO_PERMISSIONS shi502_permissions;
    uint shi502_max_uses;
    uint shi502_current_uses;
    PWSTR shi502_path;
    PWSTR shi502_passwd;
    uint shi502_reserved;
    PSECURITY_DESCRIPTOR shi502_security_descriptor;
}
struct SHARE_INFO_503
{
    PWSTR shi503_netname;
    SHARE_TYPE shi503_type;
    PWSTR shi503_remark;
    SHARE_INFO_PERMISSIONS shi503_permissions;
    uint shi503_max_uses;
    uint shi503_current_uses;
    PWSTR shi503_path;
    PWSTR shi503_passwd;
    PWSTR shi503_servername;
    uint shi503_reserved;
    PSECURITY_DESCRIPTOR shi503_security_descriptor;
}
struct SHARE_INFO_1004
{
    PWSTR shi1004_remark;
}
struct SHARE_INFO_1005
{
    uint shi1005_flags;
}
struct SHARE_INFO_1006
{
    uint shi1006_max_uses;
}
struct SHARE_INFO_1501
{
    uint shi1501_reserved;
    PSECURITY_DESCRIPTOR shi1501_security_descriptor;
}
struct SHARE_INFO_1503
{
    GUID shi1503_sharefilter;
}
struct SERVER_ALIAS_INFO_0
{
    PWSTR srvai0_alias;
    PWSTR srvai0_target;
    BOOLEAN srvai0_default;
    uint srvai0_reserved;
}
struct SESSION_INFO_0
{
    PWSTR sesi0_cname;
}
struct SESSION_INFO_1
{
    PWSTR sesi1_cname;
    PWSTR sesi1_username;
    uint sesi1_num_opens;
    uint sesi1_time;
    uint sesi1_idle_time;
    SESSION_INFO_USER_FLAGS sesi1_user_flags;
}
struct SESSION_INFO_2
{
    PWSTR sesi2_cname;
    PWSTR sesi2_username;
    uint sesi2_num_opens;
    uint sesi2_time;
    uint sesi2_idle_time;
    SESSION_INFO_USER_FLAGS sesi2_user_flags;
    PWSTR sesi2_cltype_name;
}
struct SESSION_INFO_10
{
    PWSTR sesi10_cname;
    PWSTR sesi10_username;
    uint sesi10_time;
    uint sesi10_idle_time;
}
struct SESSION_INFO_502
{
    PWSTR sesi502_cname;
    PWSTR sesi502_username;
    uint sesi502_num_opens;
    uint sesi502_time;
    uint sesi502_idle_time;
    SESSION_INFO_USER_FLAGS sesi502_user_flags;
    PWSTR sesi502_cltype_name;
    PWSTR sesi502_transport;
}
struct CONNECTION_INFO_0
{
    uint coni0_id;
}
struct CONNECTION_INFO_1
{
    uint coni1_id;
    SHARE_TYPE coni1_type;
    uint coni1_num_opens;
    uint coni1_num_users;
    uint coni1_time;
    PWSTR coni1_username;
    PWSTR coni1_netname;
}
struct FILE_INFO_2
{
    uint fi2_id;
}
struct FILE_INFO_3
{
    uint fi3_id;
    FILE_INFO_FLAGS_PERMISSIONS fi3_permissions;
    uint fi3_num_locks;
    PWSTR fi3_pathname;
    PWSTR fi3_username;
}
alias SERVER_CERTIFICATE_TYPE = int;
enum : int
{
    QUIC    = 0x00000000,
}

struct SERVER_CERTIFICATE_INFO_0
{
    PWSTR srvci0_name;
    PWSTR srvci0_subject;
    PWSTR srvci0_issuer;
    PWSTR srvci0_thumbprint;
    PWSTR srvci0_friendlyname;
    PWSTR srvci0_notbefore;
    PWSTR srvci0_notafter;
    PWSTR srvci0_storelocation;
    PWSTR srvci0_storename;
    PWSTR srvci0_renewalchain;
    uint srvci0_type;
    uint srvci0_flags;
}
struct STAT_WORKSTATION_0
{
    LARGE_INTEGER StatisticsStartTime;
    LARGE_INTEGER BytesReceived;
    LARGE_INTEGER SmbsReceived;
    LARGE_INTEGER PagingReadBytesRequested;
    LARGE_INTEGER NonPagingReadBytesRequested;
    LARGE_INTEGER CacheReadBytesRequested;
    LARGE_INTEGER NetworkReadBytesRequested;
    LARGE_INTEGER BytesTransmitted;
    LARGE_INTEGER SmbsTransmitted;
    LARGE_INTEGER PagingWriteBytesRequested;
    LARGE_INTEGER NonPagingWriteBytesRequested;
    LARGE_INTEGER CacheWriteBytesRequested;
    LARGE_INTEGER NetworkWriteBytesRequested;
    uint InitiallyFailedOperations;
    uint FailedCompletionOperations;
    uint ReadOperations;
    uint RandomReadOperations;
    uint ReadSmbs;
    uint LargeReadSmbs;
    uint SmallReadSmbs;
    uint WriteOperations;
    uint RandomWriteOperations;
    uint WriteSmbs;
    uint LargeWriteSmbs;
    uint SmallWriteSmbs;
    uint RawReadsDenied;
    uint RawWritesDenied;
    uint NetworkErrors;
    uint Sessions;
    uint FailedSessions;
    uint Reconnects;
    uint CoreConnects;
    uint Lanman20Connects;
    uint Lanman21Connects;
    uint LanmanNtConnects;
    uint ServerDisconnects;
    uint HungSessions;
    uint UseCount;
    uint FailedUseCount;
    uint CurrentCommands;
}
struct STAT_SERVER_0
{
    uint sts0_start;
    uint sts0_fopens;
    uint sts0_devopens;
    uint sts0_jobsqueued;
    uint sts0_sopens;
    uint sts0_stimedout;
    uint sts0_serrorout;
    uint sts0_pwerrors;
    uint sts0_permerrors;
    uint sts0_syserrors;
    uint sts0_bytessent_low;
    uint sts0_bytessent_high;
    uint sts0_bytesrcvd_low;
    uint sts0_bytesrcvd_high;
    uint sts0_avresponse;
    uint sts0_reqbufneed;
    uint sts0_bigbufneed;
}
alias PFN_IO_COMPLETION = void function(FIO_CONTEXT*, FH_OVERLAPPED*, uint, uint);
struct FH_OVERLAPPED
{
    ulong Internal;
    ulong InternalHigh;
    uint Offset;
    uint OffsetHigh;
    HANDLE hEvent;
    PFN_IO_COMPLETION pfnCompletion;
    ulong Reserved1;
    ulong Reserved2;
    ulong Reserved3;
    ulong Reserved4;
}
struct FIO_CONTEXT
{
    uint m_dwTempHack;
    uint m_dwSignature;
    HANDLE m_hFile;
    uint m_dwLinesOffset;
    uint m_dwHeaderLength;
}
alias FCACHE_CREATE_CALLBACK = HANDLE function(PSTR, void*, uint*, uint*);
alias FCACHE_RICHCREATE_CALLBACK = HANDLE function(PSTR, void*, uint*, uint*, BOOL*, BOOL*, BOOL*, BOOL*);
alias CACHE_KEY_COMPARE = int function(uint, ubyte*, uint, ubyte*);
alias CACHE_KEY_HASH = uint function(ubyte*, uint);
alias CACHE_READ_CALLBACK = BOOL function(uint, ubyte*, void*);
alias CACHE_DESTROY_CALLBACK = void function(uint, ubyte*);
alias CACHE_ACCESS_CHECK = BOOL function(PSECURITY_DESCRIPTOR, HANDLE, uint, GENERIC_MAPPING*, PRIVILEGE_SET*, uint*, uint*, int*);
struct NAME_CACHE_CONTEXT
{
    uint m_dwSignature;
}
alias IORING_VERSION = int;
enum : int
{
    IORING_VERSION_INVALID = 0x00000000,
    IORING_VERSION_1       = 0x00000001,
}

alias IORING_FEATURE_FLAGS = int;
enum : int
{
    IORING_FEATURE_FLAGS_NONE           = 0x00000000,
    IORING_FEATURE_UM_EMULATION         = 0x00000001,
    IORING_FEATURE_SET_COMPLETION_EVENT = 0x00000002,
}

alias IORING_OP_CODE = int;
enum : int
{
    IORING_OP_NOP              = 0x00000000,
    IORING_OP_READ             = 0x00000001,
    IORING_OP_REGISTER_FILES   = 0x00000002,
    IORING_OP_REGISTER_BUFFERS = 0x00000003,
    IORING_OP_CANCEL           = 0x00000004,
}

struct IORING_BUFFER_INFO
{
    void* Address;
    uint Length;
}
struct IORING_REGISTERED_BUFFER
{
    uint BufferIndex;
    uint Offset;
}
struct HIORING__
{
    int unused;
}
alias IORING_SQE_FLAGS = int;
enum : int
{
    IOSQE_FLAGS_NONE = 0x00000000,
}

alias IORING_CREATE_REQUIRED_FLAGS = int;
enum : int
{
    IORING_CREATE_REQUIRED_FLAGS_NONE = 0x00000000,
}

alias IORING_CREATE_ADVISORY_FLAGS = int;
enum : int
{
    IORING_CREATE_ADVISORY_FLAGS_NONE = 0x00000000,
}

struct IORING_CREATE_FLAGS
{
    IORING_CREATE_REQUIRED_FLAGS Required;
    IORING_CREATE_ADVISORY_FLAGS Advisory;
}
struct IORING_INFO
{
    IORING_VERSION IoRingVersion;
    IORING_CREATE_FLAGS Flags;
    uint SubmissionQueueSize;
    uint CompletionQueueSize;
}
struct IORING_CAPABILITIES
{
    IORING_VERSION MaxVersion;
    uint MaxSubmissionQueueSize;
    uint MaxCompletionQueueSize;
    IORING_FEATURE_FLAGS FeatureFlags;
}
alias IORING_REF_KIND = int;
enum : int
{
    IORING_REF_RAW        = 0x00000000,
    IORING_REF_REGISTERED = 0x00000001,
}

struct IORING_HANDLE_REF
{
    IORING_REF_KIND Kind;
    union HandleUnion
    {
        HANDLE Handle;
        uint Index;
    }
}
struct IORING_BUFFER_REF
{
    IORING_REF_KIND Kind;
    union BufferUnion
    {
        void* Address;
        IORING_REGISTERED_BUFFER IndexAndOffset;
    }
}
struct IORING_CQE
{
    ulong UserData;
    HRESULT ResultCode;
    ulong Information;
}
struct FILE_ID_128
{
    ubyte[16] Identifier;
}
struct FILE_NOTIFY_INFORMATION
{
    uint NextEntryOffset;
    FILE_ACTION Action;
    uint FileNameLength;
    wchar[1] FileName;
}
struct FILE_NOTIFY_EXTENDED_INFORMATION
{
    uint NextEntryOffset;
    FILE_ACTION Action;
    LARGE_INTEGER CreationTime;
    LARGE_INTEGER LastModificationTime;
    LARGE_INTEGER LastChangeTime;
    LARGE_INTEGER LastAccessTime;
    LARGE_INTEGER AllocatedLength;
    LARGE_INTEGER FileSize;
    uint FileAttributes;
    uint ReparsePointTag;
    LARGE_INTEGER FileId;
    LARGE_INTEGER ParentFileId;
    uint FileNameLength;
    wchar[1] FileName;
}
union FILE_SEGMENT_ELEMENT
{
    void* Buffer;
    ulong Alignment;
}
struct REPARSE_GUID_DATA_BUFFER
{
    uint ReparseTag;
    ushort ReparseDataLength;
    ushort Reserved;
    GUID ReparseGuid;
    struct _GenericReparseBuffer_e__Struct
    {
        ubyte[1] DataBuffer;
    }
}
struct TAPE_ERASE
{
    ERASE_TAPE_TYPE Type;
    BOOLEAN Immediate;
}
struct TAPE_PREPARE
{
    PREPARE_TAPE_OPERATION Operation;
    BOOLEAN Immediate;
}
struct TAPE_WRITE_MARKS
{
    TAPEMARK_TYPE Type;
    uint Count;
    BOOLEAN Immediate;
}
struct TAPE_GET_POSITION
{
    TAPE_POSITION_TYPE Type;
    uint Partition;
    LARGE_INTEGER Offset;
}
struct TAPE_SET_POSITION
{
    TAPE_POSITION_METHOD Method;
    uint Partition;
    LARGE_INTEGER Offset;
    BOOLEAN Immediate;
}
alias TRANSACTION_OUTCOME = int;
enum : int
{
    TransactionOutcomeUndetermined = 0x00000001,
    TransactionOutcomeCommitted    = 0x00000002,
    TransactionOutcomeAborted      = 0x00000003,
}

alias STORAGE_BUS_TYPE = int;
enum : int
{
    BusTypeUnknown           = 0x00000000,
    BusTypeScsi              = 0x00000001,
    BusTypeAtapi             = 0x00000002,
    BusTypeAta               = 0x00000003,
    BusType1394              = 0x00000004,
    BusTypeSsa               = 0x00000005,
    BusTypeFibre             = 0x00000006,
    BusTypeUsb               = 0x00000007,
    BusTypeRAID              = 0x00000008,
    BusTypeiScsi             = 0x00000009,
    BusTypeSas               = 0x0000000a,
    BusTypeSata              = 0x0000000b,
    BusTypeSd                = 0x0000000c,
    BusTypeMmc               = 0x0000000d,
    BusTypeVirtual           = 0x0000000e,
    BusTypeFileBackedVirtual = 0x0000000f,
    BusTypeSpaces            = 0x00000010,
    BusTypeNvme              = 0x00000011,
    BusTypeSCM               = 0x00000012,
    BusTypeUfs               = 0x00000013,
    BusTypeMax               = 0x00000014,
    BusTypeMaxReserved       = 0x0000007f,
}

struct OFSTRUCT
{
    ubyte cBytes;
    ubyte fFixedDisk;
    ushort nErrCode;
    ushort Reserved1;
    ushort Reserved2;
    CHAR[128] szPathName;
}
alias PFE_EXPORT_FUNC = uint function(ubyte*, void*, uint);
alias PFE_IMPORT_FUNC = uint function(ubyte*, void*, uint*);
struct WIN32_STREAM_ID
{
    WIN_STREAM_ID dwStreamId;
    uint dwStreamAttributes;
    LARGE_INTEGER Size;
    uint dwStreamNameSize;
    wchar[1] cStreamName;
}
alias LPPROGRESS_ROUTINE = uint function(LARGE_INTEGER, LARGE_INTEGER, LARGE_INTEGER, LARGE_INTEGER, uint, LPPROGRESS_ROUTINE_CALLBACK_REASON, HANDLE, HANDLE, void*);
alias COPYFILE2_MESSAGE_TYPE = int;
enum : int
{
    COPYFILE2_CALLBACK_NONE            = 0x00000000,
    COPYFILE2_CALLBACK_CHUNK_STARTED   = 0x00000001,
    COPYFILE2_CALLBACK_CHUNK_FINISHED  = 0x00000002,
    COPYFILE2_CALLBACK_STREAM_STARTED  = 0x00000003,
    COPYFILE2_CALLBACK_STREAM_FINISHED = 0x00000004,
    COPYFILE2_CALLBACK_POLL_CONTINUE   = 0x00000005,
    COPYFILE2_CALLBACK_ERROR           = 0x00000006,
    COPYFILE2_CALLBACK_MAX             = 0x00000007,
}

alias COPYFILE2_MESSAGE_ACTION = int;
enum : int
{
    COPYFILE2_PROGRESS_CONTINUE = 0x00000000,
    COPYFILE2_PROGRESS_CANCEL   = 0x00000001,
    COPYFILE2_PROGRESS_STOP     = 0x00000002,
    COPYFILE2_PROGRESS_QUIET    = 0x00000003,
    COPYFILE2_PROGRESS_PAUSE    = 0x00000004,
}

alias COPYFILE2_COPY_PHASE = int;
enum : int
{
    COPYFILE2_PHASE_NONE              = 0x00000000,
    COPYFILE2_PHASE_PREPARE_SOURCE    = 0x00000001,
    COPYFILE2_PHASE_PREPARE_DEST      = 0x00000002,
    COPYFILE2_PHASE_READ_SOURCE       = 0x00000003,
    COPYFILE2_PHASE_WRITE_DESTINATION = 0x00000004,
    COPYFILE2_PHASE_SERVER_COPY       = 0x00000005,
    COPYFILE2_PHASE_NAMEGRAFT_COPY    = 0x00000006,
    COPYFILE2_PHASE_MAX               = 0x00000007,
}

struct COPYFILE2_MESSAGE
{
    COPYFILE2_MESSAGE_TYPE Type;
    uint dwPadding;
    union _Info_e__Union
    {
        struct _ChunkStarted_e__Struct
        {
            uint dwStreamNumber;
            uint dwReserved;
            HANDLE hSourceFile;
            HANDLE hDestinationFile;
            ULARGE_INTEGER uliChunkNumber;
            ULARGE_INTEGER uliChunkSize;
            ULARGE_INTEGER uliStreamSize;
            ULARGE_INTEGER uliTotalFileSize;
        }
        struct _ChunkFinished_e__Struct
        {
            uint dwStreamNumber;
            uint dwFlags;
            HANDLE hSourceFile;
            HANDLE hDestinationFile;
            ULARGE_INTEGER uliChunkNumber;
            ULARGE_INTEGER uliChunkSize;
            ULARGE_INTEGER uliStreamSize;
            ULARGE_INTEGER uliStreamBytesTransferred;
            ULARGE_INTEGER uliTotalFileSize;
            ULARGE_INTEGER uliTotalBytesTransferred;
        }
        struct _StreamStarted_e__Struct
        {
            uint dwStreamNumber;
            uint dwReserved;
            HANDLE hSourceFile;
            HANDLE hDestinationFile;
            ULARGE_INTEGER uliStreamSize;
            ULARGE_INTEGER uliTotalFileSize;
        }
        struct _StreamFinished_e__Struct
        {
            uint dwStreamNumber;
            uint dwReserved;
            HANDLE hSourceFile;
            HANDLE hDestinationFile;
            ULARGE_INTEGER uliStreamSize;
            ULARGE_INTEGER uliStreamBytesTransferred;
            ULARGE_INTEGER uliTotalFileSize;
            ULARGE_INTEGER uliTotalBytesTransferred;
        }
        struct _PollContinue_e__Struct
        {
            uint dwReserved;
        }
        struct _Error_e__Struct
        {
            COPYFILE2_COPY_PHASE CopyPhase;
            uint dwStreamNumber;
            HRESULT hrFailure;
            uint dwReserved;
            ULARGE_INTEGER uliChunkNumber;
            ULARGE_INTEGER uliStreamSize;
            ULARGE_INTEGER uliStreamBytesTransferred;
            ULARGE_INTEGER uliTotalFileSize;
            ULARGE_INTEGER uliTotalBytesTransferred;
        }
    }
}
alias PCOPYFILE2_PROGRESS_ROUTINE = COPYFILE2_MESSAGE_ACTION function(const(COPYFILE2_MESSAGE)*, void*);
struct COPYFILE2_EXTENDED_PARAMETERS
{
    uint dwSize;
    uint dwCopyFlags;
    BOOL* pfCancel;
    PCOPYFILE2_PROGRESS_ROUTINE pProgressRoutine;
    void* pvCallbackContext;
}
struct COPYFILE2_EXTENDED_PARAMETERS_V2
{
    uint dwSize;
    uint dwCopyFlags;
    BOOL* pfCancel;
    PCOPYFILE2_PROGRESS_ROUTINE pProgressRoutine;
    void* pvCallbackContext;
    uint dwCopyFlagsV2;
    uint ioDesiredSize;
    uint ioDesiredRate;
    void*[8] reserved;
}
struct FILE_BASIC_INFO
{
    LARGE_INTEGER CreationTime;
    LARGE_INTEGER LastAccessTime;
    LARGE_INTEGER LastWriteTime;
    LARGE_INTEGER ChangeTime;
    uint FileAttributes;
}
struct FILE_STANDARD_INFO
{
    LARGE_INTEGER AllocationSize;
    LARGE_INTEGER EndOfFile;
    uint NumberOfLinks;
    BOOLEAN DeletePending;
    BOOLEAN Directory;
}
struct FILE_NAME_INFO
{
    uint FileNameLength;
    wchar[1] FileName;
}
struct FILE_RENAME_INFO
{
    union
    {
        BOOLEAN ReplaceIfExists;
        uint Flags;
    }
    HANDLE RootDirectory;
    uint FileNameLength;
    wchar[1] FileName;
}
struct FILE_ALLOCATION_INFO
{
    LARGE_INTEGER AllocationSize;
}
struct FILE_END_OF_FILE_INFO
{
    LARGE_INTEGER EndOfFile;
}
struct FILE_STREAM_INFO
{
    uint NextEntryOffset;
    uint StreamNameLength;
    LARGE_INTEGER StreamSize;
    LARGE_INTEGER StreamAllocationSize;
    wchar[1] StreamName;
}
struct FILE_COMPRESSION_INFO
{
    LARGE_INTEGER CompressedFileSize;
    ushort CompressionFormat;
    ubyte CompressionUnitShift;
    ubyte ChunkShift;
    ubyte ClusterShift;
    ubyte[3] Reserved;
}
struct FILE_ATTRIBUTE_TAG_INFO
{
    uint FileAttributes;
    uint ReparseTag;
}
struct FILE_DISPOSITION_INFO
{
    BOOLEAN DeleteFileA;
}
struct FILE_ID_BOTH_DIR_INFO
{
    uint NextEntryOffset;
    uint FileIndex;
    LARGE_INTEGER CreationTime;
    LARGE_INTEGER LastAccessTime;
    LARGE_INTEGER LastWriteTime;
    LARGE_INTEGER ChangeTime;
    LARGE_INTEGER EndOfFile;
    LARGE_INTEGER AllocationSize;
    uint FileAttributes;
    uint FileNameLength;
    uint EaSize;
    byte ShortNameLength;
    wchar[12] ShortName;
    LARGE_INTEGER FileId;
    wchar[1] FileName;
}
struct FILE_FULL_DIR_INFO
{
    uint NextEntryOffset;
    uint FileIndex;
    LARGE_INTEGER CreationTime;
    LARGE_INTEGER LastAccessTime;
    LARGE_INTEGER LastWriteTime;
    LARGE_INTEGER ChangeTime;
    LARGE_INTEGER EndOfFile;
    LARGE_INTEGER AllocationSize;
    uint FileAttributes;
    uint FileNameLength;
    uint EaSize;
    wchar[1] FileName;
}
alias PRIORITY_HINT = int;
enum : int
{
    IoPriorityHintVeryLow     = 0x00000000,
    IoPriorityHintLow         = 0x00000001,
    IoPriorityHintNormal      = 0x00000002,
    MaximumIoPriorityHintType = 0x00000003,
}

struct FILE_IO_PRIORITY_HINT_INFO
{
    PRIORITY_HINT PriorityHint;
}
struct FILE_ALIGNMENT_INFO
{
    uint AlignmentRequirement;
}
struct FILE_STORAGE_INFO
{
    uint LogicalBytesPerSector;
    uint PhysicalBytesPerSectorForAtomicity;
    uint PhysicalBytesPerSectorForPerformance;
    uint FileSystemEffectivePhysicalBytesPerSectorForAtomicity;
    uint Flags;
    uint ByteOffsetForSectorAlignment;
    uint ByteOffsetForPartitionAlignment;
}
struct FILE_ID_INFO
{
    ulong VolumeSerialNumber;
    FILE_ID_128 FileId;
}
struct FILE_ID_EXTD_DIR_INFO
{
    uint NextEntryOffset;
    uint FileIndex;
    LARGE_INTEGER CreationTime;
    LARGE_INTEGER LastAccessTime;
    LARGE_INTEGER LastWriteTime;
    LARGE_INTEGER ChangeTime;
    LARGE_INTEGER EndOfFile;
    LARGE_INTEGER AllocationSize;
    uint FileAttributes;
    uint FileNameLength;
    uint EaSize;
    uint ReparsePointTag;
    FILE_ID_128 FileId;
    wchar[1] FileName;
}
struct FILE_REMOTE_PROTOCOL_INFO
{
    ushort StructureVersion;
    ushort StructureSize;
    uint Protocol;
    ushort ProtocolMajorVersion;
    ushort ProtocolMinorVersion;
    ushort ProtocolRevision;
    ushort Reserved;
    uint Flags;
    struct _GenericReserved_e__Struct
    {
        uint[8] Reserved;
    }
    union _ProtocolSpecific_e__Union
    {
        struct _Smb2_e__Struct
        {
            struct _Server_e__Struct
            {
                uint Capabilities;
            }
            struct _Share_e__Struct
            {
                uint Capabilities;
                uint CachingFlags;
            }
        }
        uint[16] Reserved;
    }
}
alias FILE_ID_TYPE = int;
enum : int
{
    FileIdType         = 0x00000000,
    ObjectIdType       = 0x00000001,
    ExtendedFileIdType = 0x00000002,
    MaximumFileIdType  = 0x00000003,
}

struct FILE_ID_DESCRIPTOR
{
    uint dwSize;
    FILE_ID_TYPE Type;
    union
    {
        LARGE_INTEGER FileId;
        GUID ObjectId;
        FILE_ID_128 ExtendedFileId;
    }
}
