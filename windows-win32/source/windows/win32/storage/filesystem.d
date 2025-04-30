module windows.win32.storage.filesystem;

import windows.win32.guid : GUID;
import windows.win32.foundation : BOOL, BOOLEAN, CHAR, FILETIME, HANDLE, HRESULT, PSTR, PWSTR, SYSTEMTIME;
import windows.win32.security : GENERIC_MAPPING, PRIVILEGE_SET, PSECURITY_DESCRIPTOR, PSID, SECURITY_ATTRIBUTES, SID;
import windows.win32.security.cryptography : ALG_ID;
import windows.win32.system.com : IConnectionPointContainer, IUnknown;
import windows.win32.system.io : LPOVERLAPPED_COMPLETION_ROUTINE, OVERLAPPED;

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

alias FILE_ACCESS_RIGHTS = uint;
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

uint SearchPathW(const(wchar)* lpPath, const(wchar)* lpFileName, const(wchar)* lpExtension, uint nBufferLength, PWSTR lpBuffer, PWSTR* lpFilePart);
uint SearchPathA(const(char)* lpPath, const(char)* lpFileName, const(char)* lpExtension, uint nBufferLength, PSTR lpBuffer, PSTR* lpFilePart);
int CompareFileTime(const(FILETIME)* lpFileTime1, const(FILETIME)* lpFileTime2);
BOOL CreateDirectoryA(const(char)* lpPathName, SECURITY_ATTRIBUTES* lpSecurityAttributes);
BOOL CreateDirectoryW(const(wchar)* lpPathName, SECURITY_ATTRIBUTES* lpSecurityAttributes);
HANDLE CreateFileA(const(char)* lpFileName, uint dwDesiredAccess, FILE_SHARE_MODE dwShareMode, SECURITY_ATTRIBUTES* lpSecurityAttributes, FILE_CREATION_DISPOSITION dwCreationDisposition, FILE_FLAGS_AND_ATTRIBUTES dwFlagsAndAttributes, HANDLE hTemplateFile);
HANDLE CreateFileW(const(wchar)* lpFileName, uint dwDesiredAccess, FILE_SHARE_MODE dwShareMode, SECURITY_ATTRIBUTES* lpSecurityAttributes, FILE_CREATION_DISPOSITION dwCreationDisposition, FILE_FLAGS_AND_ATTRIBUTES dwFlagsAndAttributes, HANDLE hTemplateFile);
BOOL DefineDosDeviceW(DEFINE_DOS_DEVICE_FLAGS dwFlags, const(wchar)* lpDeviceName, const(wchar)* lpTargetPath);
BOOL DeleteFileA(const(char)* lpFileName);
BOOL DeleteFileW(const(wchar)* lpFileName);
BOOL DeleteVolumeMountPointW(const(wchar)* lpszVolumeMountPoint);
BOOL FileTimeToLocalFileTime(const(FILETIME)* lpFileTime, FILETIME* lpLocalFileTime);
BOOL FindClose(HANDLE hFindFile);
BOOL FindCloseChangeNotification(HANDLE hChangeHandle);
HANDLE FindFirstChangeNotificationA(const(char)* lpPathName, BOOL bWatchSubtree, FILE_NOTIFY_CHANGE dwNotifyFilter);
HANDLE FindFirstChangeNotificationW(const(wchar)* lpPathName, BOOL bWatchSubtree, FILE_NOTIFY_CHANGE dwNotifyFilter);
HANDLE FindFirstFileA(const(char)* lpFileName, WIN32_FIND_DATAA* lpFindFileData);
HANDLE FindFirstFileW(const(wchar)* lpFileName, WIN32_FIND_DATAW* lpFindFileData);
HANDLE FindFirstFileExA(const(char)* lpFileName, FINDEX_INFO_LEVELS fInfoLevelId, void* lpFindFileData, FINDEX_SEARCH_OPS fSearchOp, void* lpSearchFilter, FIND_FIRST_EX_FLAGS dwAdditionalFlags);
HANDLE FindFirstFileExW(const(wchar)* lpFileName, FINDEX_INFO_LEVELS fInfoLevelId, void* lpFindFileData, FINDEX_SEARCH_OPS fSearchOp, void* lpSearchFilter, FIND_FIRST_EX_FLAGS dwAdditionalFlags);
HANDLE FindFirstVolumeW(PWSTR lpszVolumeName, uint cchBufferLength);
BOOL FindNextChangeNotification(HANDLE hChangeHandle);
BOOL FindNextFileA(HANDLE hFindFile, WIN32_FIND_DATAA* lpFindFileData);
BOOL FindNextFileW(HANDLE hFindFile, WIN32_FIND_DATAW* lpFindFileData);
BOOL FindNextVolumeW(HANDLE hFindVolume, PWSTR lpszVolumeName, uint cchBufferLength);
BOOL FindVolumeClose(HANDLE hFindVolume);
BOOL FlushFileBuffers(HANDLE hFile);
BOOL GetDiskFreeSpaceA(const(char)* lpRootPathName, uint* lpSectorsPerCluster, uint* lpBytesPerSector, uint* lpNumberOfFreeClusters, uint* lpTotalNumberOfClusters);
BOOL GetDiskFreeSpaceW(const(wchar)* lpRootPathName, uint* lpSectorsPerCluster, uint* lpBytesPerSector, uint* lpNumberOfFreeClusters, uint* lpTotalNumberOfClusters);
BOOL GetDiskFreeSpaceExA(const(char)* lpDirectoryName, ulong* lpFreeBytesAvailableToCaller, ulong* lpTotalNumberOfBytes, ulong* lpTotalNumberOfFreeBytes);
BOOL GetDiskFreeSpaceExW(const(wchar)* lpDirectoryName, ulong* lpFreeBytesAvailableToCaller, ulong* lpTotalNumberOfBytes, ulong* lpTotalNumberOfFreeBytes);
HRESULT GetDiskSpaceInformationA(const(char)* rootPath, DISK_SPACE_INFORMATION* diskSpaceInfo);
HRESULT GetDiskSpaceInformationW(const(wchar)* rootPath, DISK_SPACE_INFORMATION* diskSpaceInfo);
uint GetDriveTypeA(const(char)* lpRootPathName);
uint GetDriveTypeW(const(wchar)* lpRootPathName);
uint GetFileAttributesA(const(char)* lpFileName);
uint GetFileAttributesW(const(wchar)* lpFileName);
BOOL GetFileAttributesExA(const(char)* lpFileName, GET_FILEEX_INFO_LEVELS fInfoLevelId, void* lpFileInformation);
BOOL GetFileAttributesExW(const(wchar)* lpFileName, GET_FILEEX_INFO_LEVELS fInfoLevelId, void* lpFileInformation);
BOOL GetFileInformationByHandle(HANDLE hFile, BY_HANDLE_FILE_INFORMATION* lpFileInformation);
uint GetFileSize(HANDLE hFile, uint* lpFileSizeHigh);
BOOL GetFileSizeEx(HANDLE hFile, long* lpFileSize);
FILE_TYPE GetFileType(HANDLE hFile);
uint GetFinalPathNameByHandleA(HANDLE hFile, PSTR lpszFilePath, uint cchFilePath, GETFINALPATHNAMEBYHANDLE_FLAGS dwFlags);
uint GetFinalPathNameByHandleW(HANDLE hFile, PWSTR lpszFilePath, uint cchFilePath, GETFINALPATHNAMEBYHANDLE_FLAGS dwFlags);
BOOL GetFileTime(HANDLE hFile, FILETIME* lpCreationTime, FILETIME* lpLastAccessTime, FILETIME* lpLastWriteTime);
uint GetFullPathNameW(const(wchar)* lpFileName, uint nBufferLength, PWSTR lpBuffer, PWSTR* lpFilePart);
uint GetFullPathNameA(const(char)* lpFileName, uint nBufferLength, PSTR lpBuffer, PSTR* lpFilePart);
uint GetLogicalDrives();
uint GetLogicalDriveStringsW(uint nBufferLength, PWSTR lpBuffer);
uint GetLongPathNameA(const(char)* lpszShortPath, PSTR lpszLongPath, uint cchBuffer);
uint GetLongPathNameW(const(wchar)* lpszShortPath, PWSTR lpszLongPath, uint cchBuffer);
BOOL AreShortNamesEnabled(HANDLE Handle, BOOL* Enabled);
uint GetShortPathNameW(const(wchar)* lpszLongPath, PWSTR lpszShortPath, uint cchBuffer);
uint GetTempFileNameW(const(wchar)* lpPathName, const(wchar)* lpPrefixString, uint uUnique, PWSTR lpTempFileName);
BOOL GetVolumeInformationByHandleW(HANDLE hFile, PWSTR lpVolumeNameBuffer, uint nVolumeNameSize, uint* lpVolumeSerialNumber, uint* lpMaximumComponentLength, uint* lpFileSystemFlags, PWSTR lpFileSystemNameBuffer, uint nFileSystemNameSize);
BOOL GetVolumeInformationW(const(wchar)* lpRootPathName, PWSTR lpVolumeNameBuffer, uint nVolumeNameSize, uint* lpVolumeSerialNumber, uint* lpMaximumComponentLength, uint* lpFileSystemFlags, PWSTR lpFileSystemNameBuffer, uint nFileSystemNameSize);
BOOL GetVolumePathNameW(const(wchar)* lpszFileName, PWSTR lpszVolumePathName, uint cchBufferLength);
BOOL LocalFileTimeToFileTime(const(FILETIME)* lpLocalFileTime, FILETIME* lpFileTime);
BOOL LockFile(HANDLE hFile, uint dwFileOffsetLow, uint dwFileOffsetHigh, uint nNumberOfBytesToLockLow, uint nNumberOfBytesToLockHigh);
BOOL LockFileEx(HANDLE hFile, LOCK_FILE_FLAGS dwFlags, uint dwReserved, uint nNumberOfBytesToLockLow, uint nNumberOfBytesToLockHigh, OVERLAPPED* lpOverlapped);
uint QueryDosDeviceW(const(wchar)* lpDeviceName, PWSTR lpTargetPath, uint ucchMax);
BOOL ReadFile(HANDLE hFile, ubyte* lpBuffer, uint nNumberOfBytesToRead, uint* lpNumberOfBytesRead, OVERLAPPED* lpOverlapped);
BOOL ReadFileEx(HANDLE hFile, ubyte* lpBuffer, uint nNumberOfBytesToRead, OVERLAPPED* lpOverlapped, LPOVERLAPPED_COMPLETION_ROUTINE lpCompletionRoutine);
BOOL ReadFileScatter(HANDLE hFile, FILE_SEGMENT_ELEMENT* aSegmentArray, uint nNumberOfBytesToRead, uint* lpReserved, OVERLAPPED* lpOverlapped);
BOOL RemoveDirectoryA(const(char)* lpPathName);
BOOL RemoveDirectoryW(const(wchar)* lpPathName);
BOOL SetEndOfFile(HANDLE hFile);
BOOL SetFileAttributesA(const(char)* lpFileName, FILE_FLAGS_AND_ATTRIBUTES dwFileAttributes);
BOOL SetFileAttributesW(const(wchar)* lpFileName, FILE_FLAGS_AND_ATTRIBUTES dwFileAttributes);
BOOL SetFileInformationByHandle(HANDLE hFile, FILE_INFO_BY_HANDLE_CLASS FileInformationClass, void* lpFileInformation, uint dwBufferSize);
uint SetFilePointer(HANDLE hFile, int lDistanceToMove, int* lpDistanceToMoveHigh, SET_FILE_POINTER_MOVE_METHOD dwMoveMethod);
BOOL SetFilePointerEx(HANDLE hFile, long liDistanceToMove, long* lpNewFilePointer, SET_FILE_POINTER_MOVE_METHOD dwMoveMethod);
BOOL SetFileTime(HANDLE hFile, const(FILETIME)* lpCreationTime, const(FILETIME)* lpLastAccessTime, const(FILETIME)* lpLastWriteTime);
BOOL SetFileValidData(HANDLE hFile, long ValidDataLength);
BOOL UnlockFile(HANDLE hFile, uint dwFileOffsetLow, uint dwFileOffsetHigh, uint nNumberOfBytesToUnlockLow, uint nNumberOfBytesToUnlockHigh);
BOOL UnlockFileEx(HANDLE hFile, uint dwReserved, uint nNumberOfBytesToUnlockLow, uint nNumberOfBytesToUnlockHigh, OVERLAPPED* lpOverlapped);
BOOL WriteFile(HANDLE hFile, const(ubyte)* lpBuffer, uint nNumberOfBytesToWrite, uint* lpNumberOfBytesWritten, OVERLAPPED* lpOverlapped);
BOOL WriteFileEx(HANDLE hFile, const(ubyte)* lpBuffer, uint nNumberOfBytesToWrite, OVERLAPPED* lpOverlapped, LPOVERLAPPED_COMPLETION_ROUTINE lpCompletionRoutine);
BOOL WriteFileGather(HANDLE hFile, FILE_SEGMENT_ELEMENT* aSegmentArray, uint nNumberOfBytesToWrite, uint* lpReserved, OVERLAPPED* lpOverlapped);
uint GetTempPathW(uint nBufferLength, PWSTR lpBuffer);
BOOL GetVolumeNameForVolumeMountPointW(const(wchar)* lpszVolumeMountPoint, PWSTR lpszVolumeName, uint cchBufferLength);
BOOL GetVolumePathNamesForVolumeNameW(const(wchar)* lpszVolumeName, PWSTR lpszVolumePathNames, uint cchBufferLength, uint* lpcchReturnLength);
HANDLE CreateFile2(const(wchar)* lpFileName, uint dwDesiredAccess, FILE_SHARE_MODE dwShareMode, FILE_CREATION_DISPOSITION dwCreationDisposition, CREATEFILE2_EXTENDED_PARAMETERS* pCreateExParams);
BOOL SetFileIoOverlappedRange(HANDLE FileHandle, ubyte* OverlappedRangeStart, uint Length);
uint GetCompressedFileSizeA(const(char)* lpFileName, uint* lpFileSizeHigh);
uint GetCompressedFileSizeW(const(wchar)* lpFileName, uint* lpFileSizeHigh);
HANDLE FindFirstStreamW(const(wchar)* lpFileName, STREAM_INFO_LEVELS InfoLevel, void* lpFindStreamData, uint dwFlags);
BOOL FindNextStreamW(HANDLE hFindStream, void* lpFindStreamData);
BOOL AreFileApisANSI();
uint GetTempPathA(uint nBufferLength, PSTR lpBuffer);
HANDLE FindFirstFileNameW(const(wchar)* lpFileName, uint dwFlags, uint* StringLength, PWSTR LinkName);
BOOL FindNextFileNameW(HANDLE hFindStream, uint* StringLength, PWSTR LinkName);
BOOL GetVolumeInformationA(const(char)* lpRootPathName, PSTR lpVolumeNameBuffer, uint nVolumeNameSize, uint* lpVolumeSerialNumber, uint* lpMaximumComponentLength, uint* lpFileSystemFlags, PSTR lpFileSystemNameBuffer, uint nFileSystemNameSize);
uint GetTempFileNameA(const(char)* lpPathName, const(char)* lpPrefixString, uint uUnique, PSTR lpTempFileName);
void SetFileApisToOEM();
void SetFileApisToANSI();
uint GetTempPath2W(uint BufferLength, PWSTR Buffer);
uint GetTempPath2A(uint BufferLength, PSTR Buffer);
BOOL CopyFileFromAppW(const(wchar)* lpExistingFileName, const(wchar)* lpNewFileName, BOOL bFailIfExists);
BOOL CreateDirectoryFromAppW(const(wchar)* lpPathName, SECURITY_ATTRIBUTES* lpSecurityAttributes);
HANDLE CreateFileFromAppW(const(wchar)* lpFileName, uint dwDesiredAccess, uint dwShareMode, SECURITY_ATTRIBUTES* lpSecurityAttributes, uint dwCreationDisposition, uint dwFlagsAndAttributes, HANDLE hTemplateFile);
HANDLE CreateFile2FromAppW(const(wchar)* lpFileName, uint dwDesiredAccess, uint dwShareMode, uint dwCreationDisposition, CREATEFILE2_EXTENDED_PARAMETERS* pCreateExParams);
BOOL DeleteFileFromAppW(const(wchar)* lpFileName);
HANDLE FindFirstFileExFromAppW(const(wchar)* lpFileName, FINDEX_INFO_LEVELS fInfoLevelId, void* lpFindFileData, FINDEX_SEARCH_OPS fSearchOp, void* lpSearchFilter, uint dwAdditionalFlags);
BOOL GetFileAttributesExFromAppW(const(wchar)* lpFileName, GET_FILEEX_INFO_LEVELS fInfoLevelId, void* lpFileInformation);
BOOL MoveFileFromAppW(const(wchar)* lpExistingFileName, const(wchar)* lpNewFileName);
BOOL RemoveDirectoryFromAppW(const(wchar)* lpPathName);
BOOL ReplaceFileFromAppW(const(wchar)* lpReplacedFileName, const(wchar)* lpReplacementFileName, const(wchar)* lpBackupFileName, uint dwReplaceFlags, void* lpExclude, void* lpReserved);
BOOL SetFileAttributesFromAppW(const(wchar)* lpFileName, uint dwFileAttributes);
VER_FIND_FILE_STATUS VerFindFileA(VER_FIND_FILE_FLAGS uFlags, const(char)* szFileName, const(char)* szWinDir, const(char)* szAppDir, PSTR szCurDir, uint* puCurDirLen, PSTR szDestDir, uint* puDestDirLen);
VER_FIND_FILE_STATUS VerFindFileW(VER_FIND_FILE_FLAGS uFlags, const(wchar)* szFileName, const(wchar)* szWinDir, const(wchar)* szAppDir, PWSTR szCurDir, uint* puCurDirLen, PWSTR szDestDir, uint* puDestDirLen);
VER_INSTALL_FILE_STATUS VerInstallFileA(VER_INSTALL_FILE_FLAGS uFlags, const(char)* szSrcFileName, const(char)* szDestFileName, const(char)* szSrcDir, const(char)* szDestDir, const(char)* szCurDir, PSTR szTmpFile, uint* puTmpFileLen);
VER_INSTALL_FILE_STATUS VerInstallFileW(VER_INSTALL_FILE_FLAGS uFlags, const(wchar)* szSrcFileName, const(wchar)* szDestFileName, const(wchar)* szSrcDir, const(wchar)* szDestDir, const(wchar)* szCurDir, PWSTR szTmpFile, uint* puTmpFileLen);
uint GetFileVersionInfoSizeA(const(char)* lptstrFilename, uint* lpdwHandle);
uint GetFileVersionInfoSizeW(const(wchar)* lptstrFilename, uint* lpdwHandle);
BOOL GetFileVersionInfoA(const(char)* lptstrFilename, uint dwHandle, uint dwLen, void* lpData);
BOOL GetFileVersionInfoW(const(wchar)* lptstrFilename, uint dwHandle, uint dwLen, void* lpData);
uint GetFileVersionInfoSizeExA(GET_FILE_VERSION_INFO_FLAGS dwFlags, const(char)* lpwstrFilename, uint* lpdwHandle);
uint GetFileVersionInfoSizeExW(GET_FILE_VERSION_INFO_FLAGS dwFlags, const(wchar)* lpwstrFilename, uint* lpdwHandle);
BOOL GetFileVersionInfoExA(GET_FILE_VERSION_INFO_FLAGS dwFlags, const(char)* lpwstrFilename, uint dwHandle, uint dwLen, void* lpData);
BOOL GetFileVersionInfoExW(GET_FILE_VERSION_INFO_FLAGS dwFlags, const(wchar)* lpwstrFilename, uint dwHandle, uint dwLen, void* lpData);
uint VerLanguageNameA(uint wLang, PSTR szLang, uint cchLang);
uint VerLanguageNameW(uint wLang, PWSTR szLang, uint cchLang);
BOOL VerQueryValueA(const(void)* pBlock, const(char)* lpSubBlock, void** lplpBuffer, uint* puLen);
BOOL VerQueryValueW(const(void)* pBlock, const(wchar)* lpSubBlock, void** lplpBuffer, uint* puLen);
BOOLEAN LsnEqual(const(CLS_LSN)* plsn1, const(CLS_LSN)* plsn2);
BOOLEAN LsnLess(const(CLS_LSN)* plsn1, const(CLS_LSN)* plsn2);
BOOLEAN LsnGreater(const(CLS_LSN)* plsn1, const(CLS_LSN)* plsn2);
BOOLEAN LsnNull(const(CLS_LSN)* plsn);
uint LsnContainer(const(CLS_LSN)* plsn);
CLS_LSN LsnCreate(uint cidContainer, uint offBlock, uint cRecord);
uint LsnBlockOffset(const(CLS_LSN)* plsn);
uint LsnRecordSequence(const(CLS_LSN)* plsn);
BOOLEAN LsnInvalid(const(CLS_LSN)* plsn);
CLS_LSN LsnIncrement(CLS_LSN* plsn);
HANDLE CreateLogFile(const(wchar)* pszLogFileName, uint fDesiredAccess, FILE_SHARE_MODE dwShareMode, SECURITY_ATTRIBUTES* psaLogFile, FILE_CREATION_DISPOSITION fCreateDisposition, FILE_FLAGS_AND_ATTRIBUTES fFlagsAndAttributes);
BOOL DeleteLogByHandle(HANDLE hLog);
BOOL DeleteLogFile(const(wchar)* pszLogFileName, void* pvReserved);
BOOL AddLogContainer(HANDLE hLog, ulong* pcbContainer, PWSTR pwszContainerPath, void* pReserved);
BOOL AddLogContainerSet(HANDLE hLog, ushort cContainer, ulong* pcbContainer, PWSTR* rgwszContainerPath, void* pReserved);
BOOL RemoveLogContainer(HANDLE hLog, PWSTR pwszContainerPath, BOOL fForce, void* pReserved);
BOOL RemoveLogContainerSet(HANDLE hLog, ushort cContainer, PWSTR* rgwszContainerPath, BOOL fForce, void* pReserved);
BOOL SetLogArchiveTail(HANDLE hLog, CLS_LSN* plsnArchiveTail, void* pReserved);
BOOL SetEndOfLog(HANDLE hLog, CLS_LSN* plsnEnd, OVERLAPPED* lpOverlapped);
BOOL TruncateLog(void* pvMarshal, CLS_LSN* plsnEnd, OVERLAPPED* lpOverlapped);
BOOL CreateLogContainerScanContext(HANDLE hLog, uint cFromContainer, uint cContainers, ubyte eScanMode, CLS_SCAN_CONTEXT* pcxScan, OVERLAPPED* pOverlapped);
BOOL ScanLogContainers(CLS_SCAN_CONTEXT* pcxScan, ubyte eScanMode, void* pReserved);
BOOL AlignReservedLog(void* pvMarshal, uint cReservedRecords, long* rgcbReservation, long* pcbAlignReservation);
BOOL AllocReservedLog(void* pvMarshal, uint cReservedRecords, long* pcbAdjustment);
BOOL FreeReservedLog(void* pvMarshal, uint cReservedRecords, long* pcbAdjustment);
BOOL GetLogFileInformation(HANDLE hLog, CLS_INFORMATION* pinfoBuffer, uint* cbBuffer);
BOOL SetLogArchiveMode(HANDLE hLog, CLFS_LOG_ARCHIVE_MODE eMode);
BOOL ReadLogRestartArea(void* pvMarshal, void** ppvRestartBuffer, uint* pcbRestartBuffer, CLS_LSN* plsn, void** ppvContext, OVERLAPPED* pOverlapped);
BOOL ReadPreviousLogRestartArea(void* pvReadContext, void** ppvRestartBuffer, uint* pcbRestartBuffer, CLS_LSN* plsnRestart, OVERLAPPED* pOverlapped);
BOOL WriteLogRestartArea(void* pvMarshal, void* pvRestartBuffer, uint cbRestartBuffer, CLS_LSN* plsnBase, CLFS_FLAG fFlags, uint* pcbWritten, CLS_LSN* plsnNext, OVERLAPPED* pOverlapped);
BOOL GetLogReservationInfo(void* pvMarshal, uint* pcbRecordNumber, long* pcbUserReservation, long* pcbCommitReservation);
BOOL AdvanceLogBase(void* pvMarshal, CLS_LSN* plsnBase, uint fFlags, OVERLAPPED* pOverlapped);
BOOL CloseAndResetLogFile(HANDLE hLog);
BOOL CreateLogMarshallingArea(HANDLE hLog, CLFS_BLOCK_ALLOCATION pfnAllocBuffer, CLFS_BLOCK_DEALLOCATION pfnFreeBuffer, void* pvBlockAllocContext, uint cbMarshallingBuffer, uint cMaxWriteBuffers, uint cMaxReadBuffers, void** ppvMarshal);
BOOL DeleteLogMarshallingArea(void* pvMarshal);
BOOL ReserveAndAppendLog(void* pvMarshal, CLS_WRITE_ENTRY* rgWriteEntries, uint cWriteEntries, CLS_LSN* plsnUndoNext, CLS_LSN* plsnPrevious, uint cReserveRecords, long* rgcbReservation, CLFS_FLAG fFlags, CLS_LSN* plsn, OVERLAPPED* pOverlapped);
BOOL ReserveAndAppendLogAligned(void* pvMarshal, CLS_WRITE_ENTRY* rgWriteEntries, uint cWriteEntries, uint cbEntryAlignment, CLS_LSN* plsnUndoNext, CLS_LSN* plsnPrevious, uint cReserveRecords, long* rgcbReservation, CLFS_FLAG fFlags, CLS_LSN* plsn, OVERLAPPED* pOverlapped);
BOOL FlushLogBuffers(void* pvMarshal, OVERLAPPED* pOverlapped);
BOOL FlushLogToLsn(void* pvMarshalContext, CLS_LSN* plsnFlush, CLS_LSN* plsnLastFlushed, OVERLAPPED* pOverlapped);
BOOL ReadLogRecord(void* pvMarshal, CLS_LSN* plsnFirst, CLFS_CONTEXT_MODE eContextMode, void** ppvReadBuffer, uint* pcbReadBuffer, ubyte* peRecordType, CLS_LSN* plsnUndoNext, CLS_LSN* plsnPrevious, void** ppvReadContext, OVERLAPPED* pOverlapped);
BOOL ReadNextLogRecord(void* pvReadContext, void** ppvBuffer, uint* pcbBuffer, ubyte* peRecordType, CLS_LSN* plsnUser, CLS_LSN* plsnUndoNext, CLS_LSN* plsnPrevious, CLS_LSN* plsnRecord, OVERLAPPED* pOverlapped);
BOOL TerminateReadLog(void* pvCursorContext);
BOOL PrepareLogArchive(HANDLE hLog, PWSTR pszBaseLogFileName, uint cLen, const(CLS_LSN)* plsnLow, const(CLS_LSN)* plsnHigh, uint* pcActualLength, ulong* poffBaseLogFileData, ulong* pcbBaseLogFileLength, CLS_LSN* plsnBase, CLS_LSN* plsnLast, CLS_LSN* plsnCurrentArchiveTail, void** ppvArchiveContext);
BOOL ReadLogArchiveMetadata(void* pvArchiveContext, uint cbOffset, uint cbBytesToRead, ubyte* pbReadBuffer, uint* pcbBytesRead);
BOOL GetNextLogArchiveExtent(void* pvArchiveContext, CLS_ARCHIVE_DESCRIPTOR* rgadExtent, uint cDescriptors, uint* pcDescriptorsReturned);
BOOL TerminateLogArchive(void* pvArchiveContext);
BOOL ValidateLog(const(wchar)* pszLogFileName, SECURITY_ATTRIBUTES* psaLogFile, CLS_INFORMATION* pinfoBuffer, uint* pcbBuffer);
BOOL GetLogContainerName(HANDLE hLog, uint cidLogicalContainer, const(wchar)* pwstrContainerName, uint cLenContainerName, uint* pcActualLenContainerName);
BOOL GetLogIoStatistics(HANDLE hLog, void* pvStatsBuffer, uint cbStatsBuffer, CLFS_IOSTATS_CLASS eStatsClass, uint* pcbStatsWritten);
BOOL RegisterManageableLogClient(HANDLE hLog, LOG_MANAGEMENT_CALLBACKS* pCallbacks);
BOOL DeregisterManageableLogClient(HANDLE hLog);
BOOL ReadLogNotification(HANDLE hLog, CLFS_MGMT_NOTIFICATION* pNotification, OVERLAPPED* lpOverlapped);
BOOL InstallLogPolicy(HANDLE hLog, CLFS_MGMT_POLICY* pPolicy);
BOOL RemoveLogPolicy(HANDLE hLog, CLFS_MGMT_POLICY_TYPE ePolicyType);
BOOL QueryLogPolicy(HANDLE hLog, CLFS_MGMT_POLICY_TYPE ePolicyType, CLFS_MGMT_POLICY* pPolicyBuffer, uint* pcbPolicyBuffer);
BOOL SetLogFileSizeWithPolicy(HANDLE hLog, ulong* pDesiredSize, ulong* pResultingSize);
BOOL HandleLogFull(HANDLE hLog);
BOOL LogTailAdvanceFailure(HANDLE hLog, uint dwReason);
BOOL RegisterForLogWriteNotification(HANDLE hLog, uint cbThreshold, BOOL fEnable);
uint QueryUsersOnEncryptedFile(const(wchar)* lpFileName, ENCRYPTION_CERTIFICATE_HASH_LIST** pUsers);
uint QueryRecoveryAgentsOnEncryptedFile(const(wchar)* lpFileName, ENCRYPTION_CERTIFICATE_HASH_LIST** pRecoveryAgents);
uint RemoveUsersFromEncryptedFile(const(wchar)* lpFileName, ENCRYPTION_CERTIFICATE_HASH_LIST* pHashes);
uint AddUsersToEncryptedFile(const(wchar)* lpFileName, ENCRYPTION_CERTIFICATE_LIST* pEncryptionCertificates);
uint SetUserFileEncryptionKey(ENCRYPTION_CERTIFICATE* pEncryptionCertificate);
uint SetUserFileEncryptionKeyEx(ENCRYPTION_CERTIFICATE* pEncryptionCertificate, uint dwCapabilities, uint dwFlags, void* pvReserved);
void FreeEncryptionCertificateHashList(ENCRYPTION_CERTIFICATE_HASH_LIST* pUsers);
BOOL EncryptionDisable(const(wchar)* DirPath, BOOL Disable);
uint DuplicateEncryptionInfoFile(const(wchar)* SrcFileName, const(wchar)* DstFileName, uint dwCreationDistribution, uint dwAttributes, const(SECURITY_ATTRIBUTES)* lpSecurityAttributes);
uint GetEncryptedFileMetadata(const(wchar)* lpFileName, uint* pcbMetadata, ubyte** ppbMetadata);
uint SetEncryptedFileMetadata(const(wchar)* lpFileName, ubyte* pbOldMetadata, ubyte* pbNewMetadata, ENCRYPTION_CERTIFICATE_HASH* pOwnerHash, uint dwOperation, ENCRYPTION_CERTIFICATE_HASH_LIST* pCertificatesAdded);
void FreeEncryptedFileMetadata(ubyte* pbMetadata);
int LZStart();
void LZDone();
int CopyLZFile(int hfSource, int hfDest);
int LZCopy(int hfSource, int hfDest);
int LZInit(int hfSource);
int GetExpandedNameA(PSTR lpszSource, PSTR lpszBuffer);
int GetExpandedNameW(PWSTR lpszSource, PWSTR lpszBuffer);
int LZOpenFileA(PSTR lpFileName, OFSTRUCT* lpReOpenBuf, LZOPENFILE_STYLE wStyle);
int LZOpenFileW(PWSTR lpFileName, OFSTRUCT* lpReOpenBuf, LZOPENFILE_STYLE wStyle);
int LZSeek(int hFile, int lOffset, int iOrigin);
int LZRead(int hFile, PSTR lpBuffer, int cbRead);
void LZClose(int hFile);
BOOL WofShouldCompressBinaries(const(wchar)* Volume, uint* Algorithm);
HRESULT WofGetDriverVersion(HANDLE FileOrVolumeHandle, uint Provider, uint* WofVersion);
HRESULT WofSetFileDataLocation(HANDLE FileHandle, uint Provider, void* ExternalFileInfo, uint Length);
HRESULT WofIsExternalFile(const(wchar)* FilePath, BOOL* IsExternalFile, uint* Provider, void* ExternalFileInfo, uint* BufferLength);
HRESULT WofEnumEntries(const(wchar)* VolumeName, uint Provider, WofEnumEntryProc EnumProc, void* UserData);
HRESULT WofWimAddEntry(const(wchar)* VolumeName, const(wchar)* WimPath, uint WimType, uint WimIndex, long* DataSourceId);
HRESULT WofWimEnumFiles(const(wchar)* VolumeName, long DataSourceId, WofEnumFilesProc EnumProc, void* UserData);
HRESULT WofWimSuspendEntry(const(wchar)* VolumeName, long DataSourceId);
HRESULT WofWimRemoveEntry(const(wchar)* VolumeName, long DataSourceId);
HRESULT WofWimUpdateEntry(const(wchar)* VolumeName, long DataSourceId, const(wchar)* NewWimPath);
HRESULT WofFileEnumFiles(const(wchar)* VolumeName, uint Algorithm, WofEnumFilesProc EnumProc, void* UserData);
BOOL TxfLogCreateFileReadContext(const(wchar)* LogPath, CLS_LSN BeginningLsn, CLS_LSN EndingLsn, TXF_ID* TxfFileId, void** TxfLogContext);
BOOL TxfLogCreateRangeReadContext(const(wchar)* LogPath, CLS_LSN BeginningLsn, CLS_LSN EndingLsn, long* BeginningVirtualClock, long* EndingVirtualClock, uint RecordTypeMask, void** TxfLogContext);
BOOL TxfLogDestroyReadContext(void* TxfLogContext);
BOOL TxfLogReadRecords(void* TxfLogContext, uint BufferLength, void* Buffer, uint* BytesUsed, uint* RecordCount);
BOOL TxfReadMetadataInfo(HANDLE FileHandle, TXF_ID* TxfFileId, CLS_LSN* LastLsn, uint* TransactionState, GUID* LockingTransaction);
BOOL TxfLogRecordGetFileName(void* RecordBuffer, uint RecordBufferLengthInBytes, PWSTR NameBuffer, uint* NameBufferLengthInBytes, TXF_ID* TxfId);
BOOL TxfLogRecordGetGenericType(void* RecordBuffer, uint RecordBufferLengthInBytes, uint* GenericType, long* VirtualClock);
void TxfSetThreadMiniVersionForCreate(ushort MiniVersion);
void TxfGetThreadMiniVersionForCreate(ushort* MiniVersion);
HANDLE CreateTransaction(SECURITY_ATTRIBUTES* lpTransactionAttributes, GUID* UOW, uint CreateOptions, uint IsolationLevel, uint IsolationFlags, uint Timeout, PWSTR Description);
HANDLE OpenTransaction(uint dwDesiredAccess, GUID* TransactionId);
BOOL CommitTransaction(HANDLE TransactionHandle);
BOOL CommitTransactionAsync(HANDLE TransactionHandle);
BOOL RollbackTransaction(HANDLE TransactionHandle);
BOOL RollbackTransactionAsync(HANDLE TransactionHandle);
BOOL GetTransactionId(HANDLE TransactionHandle, GUID* TransactionId);
BOOL GetTransactionInformation(HANDLE TransactionHandle, uint* Outcome, uint* IsolationLevel, uint* IsolationFlags, uint* Timeout, uint BufferLength, PWSTR Description);
BOOL SetTransactionInformation(HANDLE TransactionHandle, uint IsolationLevel, uint IsolationFlags, uint Timeout, PWSTR Description);
HANDLE CreateTransactionManager(SECURITY_ATTRIBUTES* lpTransactionAttributes, PWSTR LogFileName, uint CreateOptions, uint CommitStrength);
HANDLE OpenTransactionManager(PWSTR LogFileName, uint DesiredAccess, uint OpenOptions);
HANDLE OpenTransactionManagerById(GUID* TransactionManagerId, uint DesiredAccess, uint OpenOptions);
BOOL RenameTransactionManager(PWSTR LogFileName, GUID* ExistingTransactionManagerGuid);
BOOL RollforwardTransactionManager(HANDLE TransactionManagerHandle, long* TmVirtualClock);
BOOL RecoverTransactionManager(HANDLE TransactionManagerHandle);
BOOL GetCurrentClockTransactionManager(HANDLE TransactionManagerHandle, long* TmVirtualClock);
BOOL GetTransactionManagerId(HANDLE TransactionManagerHandle, GUID* TransactionManagerId);
HANDLE CreateResourceManager(SECURITY_ATTRIBUTES* lpResourceManagerAttributes, GUID* ResourceManagerId, uint CreateOptions, HANDLE TmHandle, PWSTR Description);
HANDLE OpenResourceManager(uint dwDesiredAccess, HANDLE TmHandle, GUID* ResourceManagerId);
BOOL RecoverResourceManager(HANDLE ResourceManagerHandle);
BOOL GetNotificationResourceManager(HANDLE ResourceManagerHandle, TRANSACTION_NOTIFICATION* TransactionNotification, uint NotificationLength, uint dwMilliseconds, uint* ReturnLength);
BOOL GetNotificationResourceManagerAsync(HANDLE ResourceManagerHandle, TRANSACTION_NOTIFICATION* TransactionNotification, uint TransactionNotificationLength, uint* ReturnLength, OVERLAPPED* lpOverlapped);
BOOL SetResourceManagerCompletionPort(HANDLE ResourceManagerHandle, HANDLE IoCompletionPortHandle, ulong CompletionKey);
HANDLE CreateEnlistment(SECURITY_ATTRIBUTES* lpEnlistmentAttributes, HANDLE ResourceManagerHandle, HANDLE TransactionHandle, uint NotificationMask, uint CreateOptions, void* EnlistmentKey);
HANDLE OpenEnlistment(uint dwDesiredAccess, HANDLE ResourceManagerHandle, GUID* EnlistmentId);
BOOL RecoverEnlistment(HANDLE EnlistmentHandle, void* EnlistmentKey);
BOOL GetEnlistmentRecoveryInformation(HANDLE EnlistmentHandle, uint BufferSize, void* Buffer, uint* BufferUsed);
BOOL GetEnlistmentId(HANDLE EnlistmentHandle, GUID* EnlistmentId);
BOOL SetEnlistmentRecoveryInformation(HANDLE EnlistmentHandle, uint BufferSize, void* Buffer);
BOOL PrepareEnlistment(HANDLE EnlistmentHandle, long* TmVirtualClock);
BOOL PrePrepareEnlistment(HANDLE EnlistmentHandle, long* TmVirtualClock);
BOOL CommitEnlistment(HANDLE EnlistmentHandle, long* TmVirtualClock);
BOOL RollbackEnlistment(HANDLE EnlistmentHandle, long* TmVirtualClock);
BOOL PrePrepareComplete(HANDLE EnlistmentHandle, long* TmVirtualClock);
BOOL PrepareComplete(HANDLE EnlistmentHandle, long* TmVirtualClock);
BOOL ReadOnlyEnlistment(HANDLE EnlistmentHandle, long* TmVirtualClock);
BOOL CommitComplete(HANDLE EnlistmentHandle, long* TmVirtualClock);
BOOL RollbackComplete(HANDLE EnlistmentHandle, long* TmVirtualClock);
BOOL SinglePhaseReject(HANDLE EnlistmentHandle, long* TmVirtualClock);
uint NetShareAdd(PWSTR servername, uint level, ubyte* buf, uint* parm_err);
uint NetShareEnum(PWSTR servername, uint level, ubyte** bufptr, uint prefmaxlen, uint* entriesread, uint* totalentries, uint* resume_handle);
uint NetShareEnumSticky(PWSTR servername, uint level, ubyte** bufptr, uint prefmaxlen, uint* entriesread, uint* totalentries, uint* resume_handle);
uint NetShareGetInfo(PWSTR servername, PWSTR netname, uint level, ubyte** bufptr);
uint NetShareSetInfo(PWSTR servername, PWSTR netname, uint level, ubyte* buf, uint* parm_err);
uint NetShareDel(PWSTR servername, PWSTR netname, uint reserved);
uint NetShareDelSticky(PWSTR servername, PWSTR netname, uint reserved);
uint NetShareCheck(PWSTR servername, PWSTR device, uint* type);
uint NetShareDelEx(PWSTR servername, uint level, ubyte* buf);
uint NetServerAliasAdd(PWSTR servername, uint level, ubyte* buf);
uint NetServerAliasDel(PWSTR servername, uint level, ubyte* buf);
uint NetServerAliasEnum(PWSTR servername, uint level, ubyte** bufptr, uint prefmaxlen, uint* entriesread, uint* totalentries, uint* resumehandle);
uint NetSessionEnum(PWSTR servername, PWSTR UncClientName, PWSTR username, uint level, ubyte** bufptr, uint prefmaxlen, uint* entriesread, uint* totalentries, uint* resume_handle);
uint NetSessionDel(PWSTR servername, PWSTR UncClientName, PWSTR username);
uint NetSessionGetInfo(PWSTR servername, PWSTR UncClientName, PWSTR username, uint level, ubyte** bufptr);
uint NetConnectionEnum(PWSTR servername, PWSTR qualifier, uint level, ubyte** bufptr, uint prefmaxlen, uint* entriesread, uint* totalentries, uint* resume_handle);
uint NetFileClose(PWSTR servername, uint fileid);
uint NetFileEnum(PWSTR servername, PWSTR basepath, PWSTR username, uint level, ubyte** bufptr, uint prefmaxlen, uint* entriesread, uint* totalentries, ulong* resume_handle);
uint NetFileGetInfo(PWSTR servername, uint fileid, uint level, ubyte** bufptr);
uint NetStatisticsGet(byte* ServerName, byte* Service, uint Level, uint Options, ubyte** Buffer);
HRESULT QueryIoRingCapabilities(IORING_CAPABILITIES* capabilities);
BOOL IsIoRingOpSupported(HIORING ioRing, IORING_OP_CODE op);
HRESULT CreateIoRing(IORING_VERSION ioringVersion, IORING_CREATE_FLAGS flags, uint submissionQueueSize, uint completionQueueSize, HIORING* h);
HRESULT GetIoRingInfo(HIORING ioRing, IORING_INFO* info);
HRESULT SubmitIoRing(HIORING ioRing, uint waitOperations, uint milliseconds, uint* submittedEntries);
HRESULT CloseIoRing(HIORING ioRing);
HRESULT PopIoRingCompletion(HIORING ioRing, IORING_CQE* cqe);
HRESULT SetIoRingCompletionEvent(HIORING ioRing, HANDLE hEvent);
HRESULT BuildIoRingCancelRequest(HIORING ioRing, IORING_HANDLE_REF file, ulong opToCancel, ulong userData);
HRESULT BuildIoRingReadFile(HIORING ioRing, IORING_HANDLE_REF fileRef, IORING_BUFFER_REF dataRef, uint numberOfBytesToRead, ulong fileOffset, ulong userData, IORING_SQE_FLAGS sqeFlags);
HRESULT BuildIoRingRegisterFileHandles(HIORING ioRing, uint count, const(HANDLE)* handles, ulong userData);
HRESULT BuildIoRingRegisterBuffers(HIORING ioRing, uint count, const(IORING_BUFFER_INFO)* buffers, ulong userData);
HRESULT BuildIoRingWriteFile(HIORING ioRing, IORING_HANDLE_REF fileRef, IORING_BUFFER_REF bufferRef, uint numberOfBytesToWrite, ulong fileOffset, FILE_WRITE_FLAGS writeFlags, ulong userData, IORING_SQE_FLAGS sqeFlags);
HRESULT BuildIoRingFlushFile(HIORING ioRing, IORING_HANDLE_REF fileRef, FILE_FLUSH_MODE flushMode, ulong userData, IORING_SQE_FLAGS sqeFlags);
BOOLEAN Wow64EnableWow64FsRedirection(BOOLEAN Wow64FsEnableRedirection);
BOOL Wow64DisableWow64FsRedirection(void** OldValue);
BOOL Wow64RevertWow64FsRedirection(void* OlValue);
BOOL GetBinaryTypeA(const(char)* lpApplicationName, uint* lpBinaryType);
BOOL GetBinaryTypeW(const(wchar)* lpApplicationName, uint* lpBinaryType);
uint GetShortPathNameA(const(char)* lpszLongPath, PSTR lpszShortPath, uint cchBuffer);
uint GetLongPathNameTransactedA(const(char)* lpszShortPath, PSTR lpszLongPath, uint cchBuffer, HANDLE hTransaction);
uint GetLongPathNameTransactedW(const(wchar)* lpszShortPath, PWSTR lpszLongPath, uint cchBuffer, HANDLE hTransaction);
BOOL SetFileCompletionNotificationModes(HANDLE FileHandle, ubyte Flags);
BOOL SetFileShortNameA(HANDLE hFile, const(char)* lpShortName);
BOOL SetFileShortNameW(HANDLE hFile, const(wchar)* lpShortName);
uint SetTapePosition(HANDLE hDevice, TAPE_POSITION_METHOD dwPositionMethod, uint dwPartition, uint dwOffsetLow, uint dwOffsetHigh, BOOL bImmediate);
uint GetTapePosition(HANDLE hDevice, TAPE_POSITION_TYPE dwPositionType, uint* lpdwPartition, uint* lpdwOffsetLow, uint* lpdwOffsetHigh);
uint PrepareTape(HANDLE hDevice, PREPARE_TAPE_OPERATION dwOperation, BOOL bImmediate);
uint EraseTape(HANDLE hDevice, ERASE_TAPE_TYPE dwEraseType, BOOL bImmediate);
uint CreateTapePartition(HANDLE hDevice, CREATE_TAPE_PARTITION_METHOD dwPartitionMethod, uint dwCount, uint dwSize);
uint WriteTapemark(HANDLE hDevice, TAPEMARK_TYPE dwTapemarkType, uint dwTapemarkCount, BOOL bImmediate);
uint GetTapeStatus(HANDLE hDevice);
uint GetTapeParameters(HANDLE hDevice, GET_TAPE_DRIVE_PARAMETERS_OPERATION dwOperation, uint* lpdwSize, void* lpTapeInformation);
uint SetTapeParameters(HANDLE hDevice, TAPE_INFORMATION_TYPE dwOperation, void* lpTapeInformation);
BOOL EncryptFileA(const(char)* lpFileName);
BOOL EncryptFileW(const(wchar)* lpFileName);
BOOL DecryptFileA(const(char)* lpFileName, uint dwReserved);
BOOL DecryptFileW(const(wchar)* lpFileName, uint dwReserved);
BOOL FileEncryptionStatusA(const(char)* lpFileName, uint* lpStatus);
BOOL FileEncryptionStatusW(const(wchar)* lpFileName, uint* lpStatus);
uint OpenEncryptedFileRawA(const(char)* lpFileName, uint ulFlags, void** pvContext);
uint OpenEncryptedFileRawW(const(wchar)* lpFileName, uint ulFlags, void** pvContext);
uint ReadEncryptedFileRaw(PFE_EXPORT_FUNC pfExportCallback, void* pvCallbackContext, void* pvContext);
uint WriteEncryptedFileRaw(PFE_IMPORT_FUNC pfImportCallback, void* pvCallbackContext, void* pvContext);
void CloseEncryptedFileRaw(void* pvContext);
int OpenFile(const(char)* lpFileName, OFSTRUCT* lpReOpenBuff, uint uStyle);
BOOL BackupRead(HANDLE hFile, ubyte* lpBuffer, uint nNumberOfBytesToRead, uint* lpNumberOfBytesRead, BOOL bAbort, BOOL bProcessSecurity, void** lpContext);
BOOL BackupSeek(HANDLE hFile, uint dwLowBytesToSeek, uint dwHighBytesToSeek, uint* lpdwLowByteSeeked, uint* lpdwHighByteSeeked, void** lpContext);
BOOL BackupWrite(HANDLE hFile, ubyte* lpBuffer, uint nNumberOfBytesToWrite, uint* lpNumberOfBytesWritten, BOOL bAbort, BOOL bProcessSecurity, void** lpContext);
uint GetLogicalDriveStringsA(uint nBufferLength, PSTR lpBuffer);
BOOL SetSearchPathMode(uint Flags);
BOOL CreateDirectoryExA(const(char)* lpTemplateDirectory, const(char)* lpNewDirectory, SECURITY_ATTRIBUTES* lpSecurityAttributes);
BOOL CreateDirectoryExW(const(wchar)* lpTemplateDirectory, const(wchar)* lpNewDirectory, SECURITY_ATTRIBUTES* lpSecurityAttributes);
BOOL CreateDirectoryTransactedA(const(char)* lpTemplateDirectory, const(char)* lpNewDirectory, SECURITY_ATTRIBUTES* lpSecurityAttributes, HANDLE hTransaction);
BOOL CreateDirectoryTransactedW(const(wchar)* lpTemplateDirectory, const(wchar)* lpNewDirectory, SECURITY_ATTRIBUTES* lpSecurityAttributes, HANDLE hTransaction);
BOOL RemoveDirectoryTransactedA(const(char)* lpPathName, HANDLE hTransaction);
BOOL RemoveDirectoryTransactedW(const(wchar)* lpPathName, HANDLE hTransaction);
uint GetFullPathNameTransactedA(const(char)* lpFileName, uint nBufferLength, PSTR lpBuffer, PSTR* lpFilePart, HANDLE hTransaction);
uint GetFullPathNameTransactedW(const(wchar)* lpFileName, uint nBufferLength, PWSTR lpBuffer, PWSTR* lpFilePart, HANDLE hTransaction);
BOOL DefineDosDeviceA(DEFINE_DOS_DEVICE_FLAGS dwFlags, const(char)* lpDeviceName, const(char)* lpTargetPath);
uint QueryDosDeviceA(const(char)* lpDeviceName, PSTR lpTargetPath, uint ucchMax);
HANDLE CreateFileTransactedA(const(char)* lpFileName, uint dwDesiredAccess, FILE_SHARE_MODE dwShareMode, SECURITY_ATTRIBUTES* lpSecurityAttributes, FILE_CREATION_DISPOSITION dwCreationDisposition, FILE_FLAGS_AND_ATTRIBUTES dwFlagsAndAttributes, HANDLE hTemplateFile, HANDLE hTransaction, TXFS_MINIVERSION* pusMiniVersion, void* lpExtendedParameter);
HANDLE CreateFileTransactedW(const(wchar)* lpFileName, uint dwDesiredAccess, FILE_SHARE_MODE dwShareMode, SECURITY_ATTRIBUTES* lpSecurityAttributes, FILE_CREATION_DISPOSITION dwCreationDisposition, FILE_FLAGS_AND_ATTRIBUTES dwFlagsAndAttributes, HANDLE hTemplateFile, HANDLE hTransaction, TXFS_MINIVERSION* pusMiniVersion, void* lpExtendedParameter);
HANDLE ReOpenFile(HANDLE hOriginalFile, uint dwDesiredAccess, FILE_SHARE_MODE dwShareMode, FILE_FLAGS_AND_ATTRIBUTES dwFlagsAndAttributes);
BOOL SetFileAttributesTransactedA(const(char)* lpFileName, uint dwFileAttributes, HANDLE hTransaction);
BOOL SetFileAttributesTransactedW(const(wchar)* lpFileName, uint dwFileAttributes, HANDLE hTransaction);
BOOL GetFileAttributesTransactedA(const(char)* lpFileName, GET_FILEEX_INFO_LEVELS fInfoLevelId, void* lpFileInformation, HANDLE hTransaction);
BOOL GetFileAttributesTransactedW(const(wchar)* lpFileName, GET_FILEEX_INFO_LEVELS fInfoLevelId, void* lpFileInformation, HANDLE hTransaction);
uint GetCompressedFileSizeTransactedA(const(char)* lpFileName, uint* lpFileSizeHigh, HANDLE hTransaction);
uint GetCompressedFileSizeTransactedW(const(wchar)* lpFileName, uint* lpFileSizeHigh, HANDLE hTransaction);
BOOL DeleteFileTransactedA(const(char)* lpFileName, HANDLE hTransaction);
BOOL DeleteFileTransactedW(const(wchar)* lpFileName, HANDLE hTransaction);
BOOL CheckNameLegalDOS8Dot3A(const(char)* lpName, PSTR lpOemName, uint OemNameSize, BOOL* pbNameContainsSpaces, BOOL* pbNameLegal);
BOOL CheckNameLegalDOS8Dot3W(const(wchar)* lpName, PSTR lpOemName, uint OemNameSize, BOOL* pbNameContainsSpaces, BOOL* pbNameLegal);
HANDLE FindFirstFileTransactedA(const(char)* lpFileName, FINDEX_INFO_LEVELS fInfoLevelId, void* lpFindFileData, FINDEX_SEARCH_OPS fSearchOp, void* lpSearchFilter, uint dwAdditionalFlags, HANDLE hTransaction);
HANDLE FindFirstFileTransactedW(const(wchar)* lpFileName, FINDEX_INFO_LEVELS fInfoLevelId, void* lpFindFileData, FINDEX_SEARCH_OPS fSearchOp, void* lpSearchFilter, uint dwAdditionalFlags, HANDLE hTransaction);
BOOL CopyFileA(const(char)* lpExistingFileName, const(char)* lpNewFileName, BOOL bFailIfExists);
BOOL CopyFileW(const(wchar)* lpExistingFileName, const(wchar)* lpNewFileName, BOOL bFailIfExists);
BOOL CopyFileExA(const(char)* lpExistingFileName, const(char)* lpNewFileName, LPPROGRESS_ROUTINE lpProgressRoutine, void* lpData, BOOL* pbCancel, COPYFILE_FLAGS dwCopyFlags);
BOOL CopyFileExW(const(wchar)* lpExistingFileName, const(wchar)* lpNewFileName, LPPROGRESS_ROUTINE lpProgressRoutine, void* lpData, BOOL* pbCancel, COPYFILE_FLAGS dwCopyFlags);
BOOL CopyFileTransactedA(const(char)* lpExistingFileName, const(char)* lpNewFileName, LPPROGRESS_ROUTINE lpProgressRoutine, void* lpData, BOOL* pbCancel, uint dwCopyFlags, HANDLE hTransaction);
BOOL CopyFileTransactedW(const(wchar)* lpExistingFileName, const(wchar)* lpNewFileName, LPPROGRESS_ROUTINE lpProgressRoutine, void* lpData, BOOL* pbCancel, uint dwCopyFlags, HANDLE hTransaction);
HRESULT CopyFile2(const(wchar)* pwszExistingFileName, const(wchar)* pwszNewFileName, COPYFILE2_EXTENDED_PARAMETERS* pExtendedParameters);
BOOL MoveFileA(const(char)* lpExistingFileName, const(char)* lpNewFileName);
BOOL MoveFileW(const(wchar)* lpExistingFileName, const(wchar)* lpNewFileName);
BOOL MoveFileExA(const(char)* lpExistingFileName, const(char)* lpNewFileName, MOVE_FILE_FLAGS dwFlags);
BOOL MoveFileExW(const(wchar)* lpExistingFileName, const(wchar)* lpNewFileName, MOVE_FILE_FLAGS dwFlags);
BOOL MoveFileWithProgressA(const(char)* lpExistingFileName, const(char)* lpNewFileName, LPPROGRESS_ROUTINE lpProgressRoutine, void* lpData, MOVE_FILE_FLAGS dwFlags);
BOOL MoveFileWithProgressW(const(wchar)* lpExistingFileName, const(wchar)* lpNewFileName, LPPROGRESS_ROUTINE lpProgressRoutine, void* lpData, MOVE_FILE_FLAGS dwFlags);
BOOL MoveFileTransactedA(const(char)* lpExistingFileName, const(char)* lpNewFileName, LPPROGRESS_ROUTINE lpProgressRoutine, void* lpData, MOVE_FILE_FLAGS dwFlags, HANDLE hTransaction);
BOOL MoveFileTransactedW(const(wchar)* lpExistingFileName, const(wchar)* lpNewFileName, LPPROGRESS_ROUTINE lpProgressRoutine, void* lpData, MOVE_FILE_FLAGS dwFlags, HANDLE hTransaction);
BOOL ReplaceFileA(const(char)* lpReplacedFileName, const(char)* lpReplacementFileName, const(char)* lpBackupFileName, REPLACE_FILE_FLAGS dwReplaceFlags, void* lpExclude, void* lpReserved);
BOOL ReplaceFileW(const(wchar)* lpReplacedFileName, const(wchar)* lpReplacementFileName, const(wchar)* lpBackupFileName, REPLACE_FILE_FLAGS dwReplaceFlags, void* lpExclude, void* lpReserved);
BOOL CreateHardLinkA(const(char)* lpFileName, const(char)* lpExistingFileName, SECURITY_ATTRIBUTES* lpSecurityAttributes);
BOOL CreateHardLinkW(const(wchar)* lpFileName, const(wchar)* lpExistingFileName, SECURITY_ATTRIBUTES* lpSecurityAttributes);
BOOL CreateHardLinkTransactedA(const(char)* lpFileName, const(char)* lpExistingFileName, SECURITY_ATTRIBUTES* lpSecurityAttributes, HANDLE hTransaction);
BOOL CreateHardLinkTransactedW(const(wchar)* lpFileName, const(wchar)* lpExistingFileName, SECURITY_ATTRIBUTES* lpSecurityAttributes, HANDLE hTransaction);
HANDLE FindFirstStreamTransactedW(const(wchar)* lpFileName, STREAM_INFO_LEVELS InfoLevel, void* lpFindStreamData, uint dwFlags, HANDLE hTransaction);
HANDLE FindFirstFileNameTransactedW(const(wchar)* lpFileName, uint dwFlags, uint* StringLength, PWSTR LinkName, HANDLE hTransaction);
BOOL SetVolumeLabelA(const(char)* lpRootPathName, const(char)* lpVolumeName);
BOOL SetVolumeLabelW(const(wchar)* lpRootPathName, const(wchar)* lpVolumeName);
BOOL SetFileBandwidthReservation(HANDLE hFile, uint nPeriodMilliseconds, uint nBytesPerPeriod, BOOL bDiscardable, uint* lpTransferSize, uint* lpNumOutstandingRequests);
BOOL GetFileBandwidthReservation(HANDLE hFile, uint* lpPeriodMilliseconds, uint* lpBytesPerPeriod, BOOL* pDiscardable, uint* lpTransferSize, uint* lpNumOutstandingRequests);
BOOL ReadDirectoryChangesW(HANDLE hDirectory, void* lpBuffer, uint nBufferLength, BOOL bWatchSubtree, FILE_NOTIFY_CHANGE dwNotifyFilter, uint* lpBytesReturned, OVERLAPPED* lpOverlapped, LPOVERLAPPED_COMPLETION_ROUTINE lpCompletionRoutine);
BOOL ReadDirectoryChangesExW(HANDLE hDirectory, void* lpBuffer, uint nBufferLength, BOOL bWatchSubtree, FILE_NOTIFY_CHANGE dwNotifyFilter, uint* lpBytesReturned, OVERLAPPED* lpOverlapped, LPOVERLAPPED_COMPLETION_ROUTINE lpCompletionRoutine, READ_DIRECTORY_NOTIFY_INFORMATION_CLASS ReadDirectoryNotifyInformationClass);
HANDLE FindFirstVolumeA(PSTR lpszVolumeName, uint cchBufferLength);
BOOL FindNextVolumeA(HANDLE hFindVolume, PSTR lpszVolumeName, uint cchBufferLength);
HANDLE FindFirstVolumeMountPointA(const(char)* lpszRootPathName, PSTR lpszVolumeMountPoint, uint cchBufferLength);
HANDLE FindFirstVolumeMountPointW(const(wchar)* lpszRootPathName, PWSTR lpszVolumeMountPoint, uint cchBufferLength);
BOOL FindNextVolumeMountPointA(HANDLE hFindVolumeMountPoint, PSTR lpszVolumeMountPoint, uint cchBufferLength);
BOOL FindNextVolumeMountPointW(HANDLE hFindVolumeMountPoint, PWSTR lpszVolumeMountPoint, uint cchBufferLength);
BOOL FindVolumeMountPointClose(HANDLE hFindVolumeMountPoint);
BOOL SetVolumeMountPointA(const(char)* lpszVolumeMountPoint, const(char)* lpszVolumeName);
BOOL SetVolumeMountPointW(const(wchar)* lpszVolumeMountPoint, const(wchar)* lpszVolumeName);
BOOL DeleteVolumeMountPointA(const(char)* lpszVolumeMountPoint);
BOOL GetVolumeNameForVolumeMountPointA(const(char)* lpszVolumeMountPoint, PSTR lpszVolumeName, uint cchBufferLength);
BOOL GetVolumePathNameA(const(char)* lpszFileName, PSTR lpszVolumePathName, uint cchBufferLength);
BOOL GetVolumePathNamesForVolumeNameA(const(char)* lpszVolumeName, PSTR lpszVolumePathNames, uint cchBufferLength, uint* lpcchReturnLength);
BOOL GetFileInformationByHandleEx(HANDLE hFile, FILE_INFO_BY_HANDLE_CLASS FileInformationClass, void* lpFileInformation, uint dwBufferSize);
HANDLE OpenFileById(HANDLE hVolumeHint, FILE_ID_DESCRIPTOR* lpFileId, uint dwDesiredAccess, FILE_SHARE_MODE dwShareMode, SECURITY_ATTRIBUTES* lpSecurityAttributes, FILE_FLAGS_AND_ATTRIBUTES dwFlagsAndAttributes);
BOOLEAN CreateSymbolicLinkA(const(char)* lpSymlinkFileName, const(char)* lpTargetFileName, SYMBOLIC_LINK_FLAGS dwFlags);
BOOLEAN CreateSymbolicLinkW(const(wchar)* lpSymlinkFileName, const(wchar)* lpTargetFileName, SYMBOLIC_LINK_FLAGS dwFlags);
BOOLEAN CreateSymbolicLinkTransactedA(const(char)* lpSymlinkFileName, const(char)* lpTargetFileName, SYMBOLIC_LINK_FLAGS dwFlags, HANDLE hTransaction);
BOOLEAN CreateSymbolicLinkTransactedW(const(wchar)* lpSymlinkFileName, const(wchar)* lpTargetFileName, SYMBOLIC_LINK_FLAGS dwFlags, HANDLE hTransaction);
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
enum PARTITION_SBL_CACHE_SSD_GUID = GUID(0xeeff8352, 0xdd2a, 0x44db, [0xae, 0x83, 0xbe, 0xe1, 0xcf, 0x74, 0x81, 0xdc]);
enum PARTITION_SBL_CACHE_SSD_RESERVED_GUID = GUID(0xdcc0c7c1, 0x55ad, 0x4f17, [0x9d, 0x43, 0x4b, 0xc7, 0x76, 0xe0, 0x11, 0x7e]);
enum PARTITION_SBL_CACHE_HDD_GUID = GUID(0x3aaa829, 0xebfc, 0x4e7e, [0xaa, 0xc9, 0xc4, 0xd7, 0x6c, 0x63, 0xb2, 0x4b]);
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
enum INVALID_FILE_SIZE = 0xffffffff;
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
enum SHARE_QOS_POLICY_PARMNUM = 0x000001f8;
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
enum SHI1005_FLAGS_ISOLATED_TRANSPORT = 0x00200000;
enum SHI1005_FLAGS_DISABLE_DIRECTORY_HANDLE_LEASING = 0x00400000;
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
enum COPYFILE2_MESSAGE_COPY_OFFLOAD = 0x00000001;
enum COPYFILE2_IO_CYCLE_SIZE_MIN = 0x00001000;
enum COPYFILE2_IO_CYCLE_SIZE_MAX = 0x40000000;
enum COPYFILE2_IO_RATE_MIN = 0x00000200;
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

alias VS_FIXEDFILEINFO_FILE_OS = uint;
enum : uint
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

alias GETFINALPATHNAMEBYHANDLE_FLAGS = uint;
enum : uint
{
    VOLUME_NAME_DOS      = 0x00000000,
    VOLUME_NAME_GUID     = 0x00000001,
    VOLUME_NAME_NT       = 0x00000002,
    VOLUME_NAME_NONE     = 0x00000004,
    FILE_NAME_NORMALIZED = 0x00000000,
    FILE_NAME_OPENED     = 0x00000008,
}

alias LZOPENFILE_STYLE = ushort;
enum : ushort
{
    OF_CANCEL           = 0x0800,
    OF_CREATE           = 0x1000,
    OF_DELETE           = 0x0200,
    OF_EXIST            = 0x4000,
    OF_PARSE            = 0x0100,
    OF_PROMPT           = 0x2000,
    OF_READ             = 0x0000,
    OF_READWRITE        = 0x0002,
    OF_REOPEN           = 0x8000,
    OF_SHARE_DENY_NONE  = 0x0040,
    OF_SHARE_DENY_READ  = 0x0030,
    OF_SHARE_DENY_WRITE = 0x0020,
    OF_SHARE_EXCLUSIVE  = 0x0010,
    OF_WRITE            = 0x0001,
    OF_SHARE_COMPAT     = 0x0000,
    OF_VERIFY           = 0x0400,
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

alias TAPE_POSITION_TYPE = uint;
enum : uint
{
    TAPE_ABSOLUTE_POSITION = 0x00000000,
    TAPE_LOGICAL_POSITION  = 0x00000001,
}

alias CREATE_TAPE_PARTITION_METHOD = uint;
enum : uint
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

alias TAPEMARK_TYPE = uint;
enum : uint
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

alias TAPE_POSITION_METHOD = uint;
enum : uint
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

alias PREPARE_TAPE_OPERATION = uint;
enum : uint
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

alias ERASE_TAPE_TYPE = uint;
enum : uint
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

alias COMPRESSION_FORMAT = ushort;
enum : ushort
{
    COMPRESSION_FORMAT_NONE        = 0x0000,
    COMPRESSION_FORMAT_DEFAULT     = 0x0001,
    COMPRESSION_FORMAT_LZNT1       = 0x0002,
    COMPRESSION_FORMAT_XPRESS      = 0x0003,
    COMPRESSION_FORMAT_XPRESS_HUFF = 0x0004,
    COMPRESSION_FORMAT_XP10        = 0x0005,
}

alias FILE_TYPE = uint;
enum : uint
{
    FILE_TYPE_UNKNOWN = 0x00000000,
    FILE_TYPE_DISK    = 0x00000001,
    FILE_TYPE_CHAR    = 0x00000002,
    FILE_TYPE_PIPE    = 0x00000003,
    FILE_TYPE_REMOTE  = 0x00008000,
}

alias FILE_DISPOSITION_INFO_EX_FLAGS = uint;
enum : uint
{
    FILE_DISPOSITION_FLAG_DO_NOT_DELETE             = 0x00000000,
    FILE_DISPOSITION_FLAG_DELETE                    = 0x00000001,
    FILE_DISPOSITION_FLAG_POSIX_SEMANTICS           = 0x00000002,
    FILE_DISPOSITION_FLAG_FORCE_IMAGE_SECTION_CHECK = 0x00000004,
    FILE_DISPOSITION_FLAG_ON_CLOSE                  = 0x00000008,
    FILE_DISPOSITION_FLAG_IGNORE_READONLY_ATTRIBUTE = 0x00000010,
}

alias COPYFILE_FLAGS = uint;
enum : uint
{
    COPY_FILE_FAIL_IF_EXISTS              = 0x00000001,
    COPY_FILE_RESTARTABLE                 = 0x00000002,
    COPY_FILE_OPEN_SOURCE_FOR_WRITE       = 0x00000004,
    COPY_FILE_ALLOW_DECRYPTED_DESTINATION = 0x00000008,
    COPY_FILE_COPY_SYMLINK                = 0x00000800,
    COPY_FILE_NO_BUFFERING                = 0x00001000,
    COPY_FILE_REQUEST_SECURITY_PRIVILEGES = 0x00002000,
    COPY_FILE_RESUME_FROM_PAUSE           = 0x00004000,
    COPY_FILE_NO_OFFLOAD                  = 0x00040000,
    COPY_FILE_IGNORE_EDP_BLOCK            = 0x00400000,
    COPY_FILE_IGNORE_SOURCE_ENCRYPTION    = 0x00800000,
    COPY_FILE_DONT_REQUEST_DEST_WRITE_DAC = 0x02000000,
    COPY_FILE_REQUEST_COMPRESSED_TRAFFIC  = 0x10000000,
    COPY_FILE_OPEN_AND_COPY_REPARSE_POINT = 0x00200000,
    COPY_FILE_DIRECTORY                   = 0x00000080,
    COPY_FILE_SKIP_ALTERNATE_STREAMS      = 0x00008000,
    COPY_FILE_DISABLE_PRE_ALLOCATION      = 0x04000000,
    COPY_FILE_ENABLE_LOW_FREE_SPACE_MODE  = 0x08000000,
    COPY_FILE_ENABLE_SPARSE_COPY          = 0x20000000,
}

alias COPYFILE2_V2_FLAGS = uint;
enum : uint
{
    COPY_FILE2_V2_DONT_COPY_JUNCTIONS = 0x00000001,
    COPY_FILE2_V2_VALID_FLAGS         = 0x00000001,
}

alias COPYPROGRESSROUTINE_PROGRESS = uint;
enum : uint
{
    PROGRESS_CONTINUE = 0x00000000,
    PROGRESS_CANCEL   = 0x00000001,
    PROGRESS_STOP     = 0x00000002,
    PROGRESS_QUIET    = 0x00000003,
}

struct FILE_DISPOSITION_INFO
{
    BOOLEAN DeleteFile;
}
alias HIORING = void*;
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
    ReadDirectoryNotifyFullInformation     = 0x00000003,
    ReadDirectoryNotifyMaximumInformation  = 0x00000004,
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
    long TmVirtualClock;
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
    long StreamSize;
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
    uint dwFileType;
    uint dwFileSubtype;
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
    uint State;
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
    uint State;
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
    BOOL AutoRecovery;
    uint dwFlags;
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
    uint State;
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
    uint Content;
    uint Position;
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
    uint BarCodeState;
    CHAR[32] szSequenceNumber;
    uint MediaState;
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
    uint BarCodeState;
    wchar[32] szSequenceNumber;
    uint MediaState;
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
    uint State;
    ushort Side;
    uint dwOmidLabelIdLength;
    ubyte[255] OmidLabelId;
    CHAR[64] szOmidLabelType;
    CHAR[256] szOmidLabelInfo;
    uint dwMountCount;
    uint dwAllocateCount;
    long Capacity;
}
struct NTMS_PARTITIONINFORMATIONW
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
    long Capacity;
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
    uint ReadWriteCharacteristics;
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
    uint dwErrorCode;
    GUID WorkItemId;
    uint dwPriority;
}
struct NTMS_LIBREQUESTINFORMATIONW
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
    uint Request;
    SYSTEMTIME Submitted;
    uint State;
    CHAR[256] szMessage;
    uint Arg1Type;
    GUID Arg1;
    uint Arg2Type;
    GUID Arg2;
    CHAR[64] szApplication;
    CHAR[64] szUser;
    CHAR[64] szComputer;
}
struct NTMS_OPREQUESTINFORMATIONW
{
    uint Request;
    SYSTEMTIME Submitted;
    uint State;
    wchar[256] szMessage;
    uint Arg1Type;
    GUID Arg1;
    uint Arg2Type;
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
    uint dwType;
    SYSTEMTIME Created;
    SYSTEMTIME Modified;
    GUID ObjectGuid;
    BOOL Enabled;
    uint dwOperationalState;
    CHAR[64] szName;
    CHAR[127] szDescription;
    union Info
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
    uint dwType;
    SYSTEMTIME Created;
    SYSTEMTIME Modified;
    GUID ObjectGuid;
    BOOL Enabled;
    uint dwOperationalState;
    wchar[64] szName;
    wchar[127] szDescription;
    union Info
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
    union Info
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
    union Info
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
    uint dwOperation;
    GUID ObjectId;
}
struct MediaLabelInfo
{
    wchar[64] LabelType;
    uint LabelIDSize;
    ubyte[256] LabelID;
    wchar[256] LabelAppDescr;
}
alias MAXMEDIALABEL = uint function(uint* pMaxSize);
alias CLAIMMEDIALABEL = uint function(const(ubyte)* pBuffer, const(uint) nBufferSize, MediaLabelInfo* pLabelInfo);
alias CLAIMMEDIALABELEX = uint function(const(ubyte)* pBuffer, const(uint) nBufferSize, MediaLabelInfo* pLabelInfo, GUID* LabelGuid);
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
alias CLFS_BLOCK_ALLOCATION = void* function(uint cbBufferLength, void* pvUserContext);
alias CLFS_BLOCK_DEALLOCATION = void function(void* pvBuffer, void* pvUserContext);
alias CLFS_LOG_ARCHIVE_MODE = int;
enum : int
{
    ClfsLogArchiveEnabled  = 0x00000001,
    ClfsLogArchiveDisabled = 0x00000002,
}

alias PCLFS_COMPLETION_ROUTINE = void function(void* pvOverlapped, uint ulReserved);
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
    union PolicyParameters
    {
        struct MaximumSize
        {
            uint Containers;
        }
        struct MinimumSize
        {
            uint Containers;
        }
        struct NewContainerSize
        {
            uint SizeInBytes;
        }
        struct GrowthRate
        {
            uint AbsoluteGrowthInContainers;
            uint RelativeGrowthPercentage;
        }
        struct LogTail
        {
            uint MinimumAvailablePercentage;
            uint MinimumAvailableContainers;
        }
        struct AutoShrink
        {
            uint Percentage;
        }
        struct AutoGrow
        {
            uint Enabled;
        }
        struct NewContainerPrefix
        {
            ushort PrefixLengthInBytes;
            wchar[1] PrefixString;
        }
        struct NewContainerSuffix
        {
            ulong NextContainerSuffix;
        }
        struct NewContainerExtension
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
alias PLOG_TAIL_ADVANCE_CALLBACK = void function(HANDLE hLogFile, CLS_LSN lsnTarget, void* pvClientContext);
alias PLOG_FULL_HANDLER_CALLBACK = void function(HANDLE hLogFile, uint dwError, BOOL fLogIsPinned, void* pvClientContext);
alias PLOG_UNPINNED_CALLBACK = void function(HANDLE hLogFile, void* pvClientContext);
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
    HRESULT GetID(uint* pulID);
    HRESULT GetName(PWSTR pszAccountContainer, uint cchAccountContainer, PWSTR pszLogonName, uint cchLogonName, PWSTR pszDisplayName, uint cchDisplayName);
    HRESULT GetSidLength(uint* pdwLength);
    HRESULT GetSid(ubyte* pbSidBuffer, uint cbSidBuffer);
    HRESULT GetQuotaThreshold(long* pllThreshold);
    HRESULT GetQuotaThresholdText(PWSTR pszText, uint cchText);
    HRESULT GetQuotaLimit(long* pllLimit);
    HRESULT GetQuotaLimitText(PWSTR pszText, uint cchText);
    HRESULT GetQuotaUsed(long* pllUsed);
    HRESULT GetQuotaUsedText(PWSTR pszText, uint cchText);
    HRESULT GetQuotaInformation(void* pbQuotaInfo, uint cbQuotaInfo);
    HRESULT SetQuotaThreshold(long llThreshold, BOOL fWriteThrough);
    HRESULT SetQuotaLimit(long llLimit, BOOL fWriteThrough);
    HRESULT Invalidate();
    HRESULT GetAccountStatus(uint* pdwStatus);
}
enum IID_IEnumDiskQuotaUsers = GUID(0x7988b577, 0xec89, 0x11cf, [0x9c, 0x0, 0x0, 0xaa, 0x0, 0xa1, 0x4f, 0x56]);
interface IEnumDiskQuotaUsers : IUnknown
{
    HRESULT Next(uint cUsers, IDiskQuotaUser* rgUsers, uint* pcUsersFetched);
    HRESULT Skip(uint cUsers);
    HRESULT Reset();
    HRESULT Clone(IEnumDiskQuotaUsers* ppEnum);
}
enum IID_IDiskQuotaUserBatch = GUID(0x7988b576, 0xec89, 0x11cf, [0x9c, 0x0, 0x0, 0xaa, 0x0, 0xa1, 0x4f, 0x56]);
interface IDiskQuotaUserBatch : IUnknown
{
    HRESULT Add(IDiskQuotaUser pUser);
    HRESULT Remove(IDiskQuotaUser pUser);
    HRESULT RemoveAll();
    HRESULT FlushToDisk();
}
enum IID_IDiskQuotaControl = GUID(0x7988b572, 0xec89, 0x11cf, [0x9c, 0x0, 0x0, 0xaa, 0x0, 0xa1, 0x4f, 0x56]);
interface IDiskQuotaControl : IConnectionPointContainer
{
    HRESULT Initialize(const(wchar)* pszPath, BOOL bReadWrite);
    HRESULT SetQuotaState(uint dwState);
    HRESULT GetQuotaState(uint* pdwState);
    HRESULT SetQuotaLogFlags(uint dwFlags);
    HRESULT GetQuotaLogFlags(uint* pdwFlags);
    HRESULT SetDefaultQuotaThreshold(long llThreshold);
    HRESULT GetDefaultQuotaThreshold(long* pllThreshold);
    HRESULT GetDefaultQuotaThresholdText(PWSTR pszText, uint cchText);
    HRESULT SetDefaultQuotaLimit(long llLimit);
    HRESULT GetDefaultQuotaLimit(long* pllLimit);
    HRESULT GetDefaultQuotaLimitText(PWSTR pszText, uint cchText);
    HRESULT AddUserSid(PSID pUserSid, DISKQUOTA_USERNAME_RESOLVE fNameResolution, IDiskQuotaUser* ppUser);
    HRESULT AddUserName(const(wchar)* pszLogonName, DISKQUOTA_USERNAME_RESOLVE fNameResolution, IDiskQuotaUser* ppUser);
    HRESULT DeleteUser(IDiskQuotaUser pUser);
    HRESULT FindUserSid(PSID pUserSid, DISKQUOTA_USERNAME_RESOLVE fNameResolution, IDiskQuotaUser* ppUser);
    HRESULT FindUserName(const(wchar)* pszLogonName, IDiskQuotaUser* ppUser);
    HRESULT CreateEnumUsers(PSID* rgpUserSids, uint cpSids, DISKQUOTA_USERNAME_RESOLVE fNameResolution, IEnumDiskQuotaUsers* ppEnum);
    HRESULT CreateUserBatch(IDiskQuotaUserBatch* ppBatch);
    HRESULT InvalidateSidNameCache();
    HRESULT GiveUserNameResolutionPriority(IDiskQuotaUser pUser);
    HRESULT ShutdownNameResolution();
}
enum IID_IDiskQuotaEvents = GUID(0x7988b579, 0xec89, 0x11cf, [0x9c, 0x0, 0x0, 0xaa, 0x0, 0xa1, 0x4f, 0x56]);
interface IDiskQuotaEvents : IUnknown
{
    HRESULT OnUserNameChanged(IDiskQuotaUser pUser);
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
    ALG_ID Algorithm;
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
alias WofEnumEntryProc = BOOL function(const(void)* EntryInfo, void* UserData);
alias WofEnumFilesProc = BOOL function(const(wchar)* FilePath, void* ExternalFileInfo, void* UserData);
struct WIM_ENTRY_INFO
{
    uint WimEntryInfoSize;
    uint WimType;
    long DataSourceId;
    GUID WimGuid;
    const(wchar)* WimPath;
    uint WimIndex;
    uint Flags;
}
struct WIM_EXTERNAL_FILE_INFO
{
    long DataSourceId;
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
    align (4):
    struct
    {
        align (4):
        long LowPart;
        long HighPart;
    }
}
struct TXF_LOG_RECORD_BASE
{
    align (4):
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
    align (4):
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
    long ByteOffset;
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
    uint srvci0_mapping_status;
}
struct STAT_WORKSTATION_0
{
    long StatisticsStartTime;
    long BytesReceived;
    long SmbsReceived;
    long PagingReadBytesRequested;
    long NonPagingReadBytesRequested;
    long CacheReadBytesRequested;
    long NetworkReadBytesRequested;
    long BytesTransmitted;
    long SmbsTransmitted;
    long PagingWriteBytesRequested;
    long NonPagingWriteBytesRequested;
    long CacheWriteBytesRequested;
    long NetworkWriteBytesRequested;
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
alias PFN_IO_COMPLETION = void function(FIO_CONTEXT* pContext, FH_OVERLAPPED* lpo, uint cb, uint dwCompletionStatus);
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
alias FCACHE_CREATE_CALLBACK = HANDLE function(PSTR lpstrName, void* lpvData, uint* cbFileSize, uint* cbFileSizeHigh);
alias FCACHE_RICHCREATE_CALLBACK = HANDLE function(PSTR lpstrName, void* lpvData, uint* cbFileSize, uint* cbFileSizeHigh, BOOL* pfDidWeScanIt, BOOL* pfIsStuffed, BOOL* pfStoredWithDots, BOOL* pfStoredWithTerminatingDot);
alias CACHE_KEY_COMPARE = int function(uint cbKey1, ubyte* lpbKey1, uint cbKey2, ubyte* lpbKey2);
alias CACHE_KEY_HASH = uint function(ubyte* lpbKey, uint cbKey);
alias CACHE_READ_CALLBACK = BOOL function(uint cb, ubyte* lpb, void* lpvContext);
alias CACHE_DESTROY_CALLBACK = void function(uint cb, ubyte* lpb);
alias CACHE_ACCESS_CHECK = BOOL function(PSECURITY_DESCRIPTOR pSecurityDescriptor, HANDLE hClientToken, uint dwDesiredAccess, GENERIC_MAPPING* GenericMapping, PRIVILEGE_SET* PrivilegeSet, uint* PrivilegeSetLength, uint* GrantedAccess, BOOL* AccessStatus);
struct NAME_CACHE_CONTEXT
{
    uint m_dwSignature;
}
alias IORING_VERSION = int;
enum : int
{
    IORING_VERSION_INVALID = 0x00000000,
    IORING_VERSION_1       = 0x00000001,
    IORING_VERSION_2       = 0x00000002,
    IORING_VERSION_3       = 0x0000012c,
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
    IORING_OP_WRITE            = 0x00000005,
    IORING_OP_FLUSH            = 0x00000006,
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
alias IORING_SQE_FLAGS = int;
enum : int
{
    IOSQE_FLAGS_NONE                = 0x00000000,
    IOSQE_FLAGS_DRAIN_PRECEDING_OPS = 0x00000001,
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
    long CreationTime;
    long LastModificationTime;
    long LastChangeTime;
    long LastAccessTime;
    long AllocatedLength;
    long FileSize;
    uint FileAttributes;
    union
    {
        uint ReparsePointTag;
        uint EaSize;
    }
    long FileId;
    long ParentFileId;
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
    struct GenericReparseBuffer
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
    long Offset;
}
struct TAPE_SET_POSITION
{
    TAPE_POSITION_METHOD Method;
    uint Partition;
    long Offset;
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

alias FILE_WRITE_FLAGS = int;
enum : int
{
    FILE_WRITE_FLAGS_NONE          = 0x00000000,
    FILE_WRITE_FLAGS_WRITE_THROUGH = 0x00000001,
}

alias FILE_FLUSH_MODE = int;
enum : int
{
    FILE_FLUSH_DEFAULT      = 0x00000000,
    FILE_FLUSH_DATA         = 0x00000001,
    FILE_FLUSH_MIN_METADATA = 0x00000002,
    FILE_FLUSH_NO_SYNC      = 0x00000003,
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
alias PFE_EXPORT_FUNC = uint function(ubyte* pbData, void* pvCallbackContext, uint ulLength);
alias PFE_IMPORT_FUNC = uint function(ubyte* pbData, void* pvCallbackContext, uint* ulLength);
struct WIN32_STREAM_ID
{
    WIN_STREAM_ID dwStreamId;
    uint dwStreamAttributes;
    long Size;
    uint dwStreamNameSize;
    wchar[1] cStreamName;
}
alias LPPROGRESS_ROUTINE = COPYPROGRESSROUTINE_PROGRESS function(long TotalFileSize, long TotalBytesTransferred, long StreamSize, long StreamBytesTransferred, uint dwStreamNumber, LPPROGRESS_ROUTINE_CALLBACK_REASON dwCallbackReason, HANDLE hSourceFile, HANDLE hDestinationFile, void* lpData);
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
    union Info
    {
        struct ChunkStarted
        {
            uint dwStreamNumber;
            uint dwReserved;
            HANDLE hSourceFile;
            HANDLE hDestinationFile;
            ulong uliChunkNumber;
            ulong uliChunkSize;
            ulong uliStreamSize;
            ulong uliTotalFileSize;
        }
        struct ChunkFinished
        {
            uint dwStreamNumber;
            uint dwFlags;
            HANDLE hSourceFile;
            HANDLE hDestinationFile;
            ulong uliChunkNumber;
            ulong uliChunkSize;
            ulong uliStreamSize;
            ulong uliStreamBytesTransferred;
            ulong uliTotalFileSize;
            ulong uliTotalBytesTransferred;
        }
        struct StreamStarted
        {
            uint dwStreamNumber;
            uint dwReserved;
            HANDLE hSourceFile;
            HANDLE hDestinationFile;
            ulong uliStreamSize;
            ulong uliTotalFileSize;
        }
        struct StreamFinished
        {
            uint dwStreamNumber;
            uint dwReserved;
            HANDLE hSourceFile;
            HANDLE hDestinationFile;
            ulong uliStreamSize;
            ulong uliStreamBytesTransferred;
            ulong uliTotalFileSize;
            ulong uliTotalBytesTransferred;
        }
        struct PollContinue
        {
            uint dwReserved;
        }
        struct Error
        {
            COPYFILE2_COPY_PHASE CopyPhase;
            uint dwStreamNumber;
            HRESULT hrFailure;
            uint dwReserved;
            ulong uliChunkNumber;
            ulong uliStreamSize;
            ulong uliStreamBytesTransferred;
            ulong uliTotalFileSize;
            ulong uliTotalBytesTransferred;
        }
    }
}
alias PCOPYFILE2_PROGRESS_ROUTINE = COPYFILE2_MESSAGE_ACTION function(const(COPYFILE2_MESSAGE)* pMessage, void* pvCallbackContext);
struct COPYFILE2_EXTENDED_PARAMETERS
{
    uint dwSize;
    COPYFILE_FLAGS dwCopyFlags;
    BOOL* pfCancel;
    PCOPYFILE2_PROGRESS_ROUTINE pProgressRoutine;
    void* pvCallbackContext;
}
struct COPYFILE2_EXTENDED_PARAMETERS_V2
{
    uint dwSize;
    COPYFILE_FLAGS dwCopyFlags;
    BOOL* pfCancel;
    PCOPYFILE2_PROGRESS_ROUTINE pProgressRoutine;
    void* pvCallbackContext;
    COPYFILE2_V2_FLAGS dwCopyFlagsV2;
    uint ioDesiredSize;
    uint ioDesiredRate;
    void*[8] reserved;
}
struct FILE_BASIC_INFO
{
    long CreationTime;
    long LastAccessTime;
    long LastWriteTime;
    long ChangeTime;
    uint FileAttributes;
}
struct FILE_STANDARD_INFO
{
    long AllocationSize;
    long EndOfFile;
    uint NumberOfLinks;
    BOOLEAN DeletePending;
    BOOLEAN Directory;
}
struct FILE_NAME_INFO
{
    uint FileNameLength;
    wchar[1] FileName;
}
struct FILE_CASE_SENSITIVE_INFO
{
    uint Flags;
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
    long AllocationSize;
}
struct FILE_END_OF_FILE_INFO
{
    long EndOfFile;
}
struct FILE_STREAM_INFO
{
    uint NextEntryOffset;
    uint StreamNameLength;
    long StreamSize;
    long StreamAllocationSize;
    wchar[1] StreamName;
}
struct FILE_COMPRESSION_INFO
{
    long CompressedFileSize;
    COMPRESSION_FORMAT CompressionFormat;
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
struct FILE_DISPOSITION_INFO_EX
{
    FILE_DISPOSITION_INFO_EX_FLAGS Flags;
}
struct FILE_ID_BOTH_DIR_INFO
{
    uint NextEntryOffset;
    uint FileIndex;
    long CreationTime;
    long LastAccessTime;
    long LastWriteTime;
    long ChangeTime;
    long EndOfFile;
    long AllocationSize;
    uint FileAttributes;
    uint FileNameLength;
    uint EaSize;
    byte ShortNameLength;
    wchar[12] ShortName;
    long FileId;
    wchar[1] FileName;
}
struct FILE_FULL_DIR_INFO
{
    uint NextEntryOffset;
    uint FileIndex;
    long CreationTime;
    long LastAccessTime;
    long LastWriteTime;
    long ChangeTime;
    long EndOfFile;
    long AllocationSize;
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
    long CreationTime;
    long LastAccessTime;
    long LastWriteTime;
    long ChangeTime;
    long EndOfFile;
    long AllocationSize;
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
    struct GenericReserved
    {
        uint[8] Reserved;
    }
    union ProtocolSpecific
    {
        struct Smb2
        {
            struct Server
            {
                uint Capabilities;
            }
            struct Share
            {
                uint Capabilities;
                uint ShareFlags;
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
        long FileId;
        GUID ObjectId;
        FILE_ID_128 ExtendedFileId;
    }
}
