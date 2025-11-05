part of 'download_bloc.dart';

@freezed
class DownloadEvent with _$DownloadEvent {
  const factory DownloadEvent.startDownload({
    required String url,
    String? fileName,
    String? fileExtension,
    int? downloadIndex
  }) = _StartDownload;

  const factory DownloadEvent.pauseDownload({required String taskId}) =
      _PauseDownload;

  const factory DownloadEvent.resumeDownload({required String taskId}) =
      _ResumeDownload;

  const factory DownloadEvent.cancelDownload({required String taskId}) =
      _CancelDownload;

  const factory DownloadEvent.downloadProgressUpdate({
    required String taskId,
    required int status,
    required int progress,
  }) = _DownloadProgressUpdate;
}
