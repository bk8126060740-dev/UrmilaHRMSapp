part of 'download_bloc.dart';

@freezed
class DownloadState with _$DownloadState {
  const factory DownloadState({
    required DownloadRepository downloadRepository,
    @Default(DownloadStatus.downloadInitial) DownloadStatus downloadStatus,
    @Default("") String taskId,
    @Default(0) int progress,
    int? activeDownloadId
  }) = _DownloadState;
}

enum DownloadStatus {
  downloadInitial,
  downloadInProgress,
  downloadPaused,
  downloadCancelled,
  downloadFailed,
  downloadCompleted,
  previousStatus,
}
