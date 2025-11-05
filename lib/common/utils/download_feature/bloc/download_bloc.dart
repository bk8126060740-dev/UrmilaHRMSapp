import 'package:bloc/bloc.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../repo/download_repo.dart';

part 'download_bloc.freezed.dart';

part 'download_event.dart';

part 'download_state.dart';

class DownloadBloc extends Bloc<DownloadEvent, DownloadState> {
  DownloadBloc()
    : super(DownloadState(downloadRepository: DownloadRepository())) {
    on<_StartDownload>((event, emit) async {
      final taskId = await state.downloadRepository.downloadFile(
        url: event.url,
        docFileName: event.fileName ?? 'payslip',
        fileExtension: event.fileExtension,
      );
      if (taskId != null) {
        emit(
          state.copyWith(
            taskId: taskId,
            progress: 0,
            downloadStatus: DownloadStatus.downloadInProgress,
            activeDownloadId: event.downloadIndex,
          ),
        );
      } else {
        emit(state.copyWith(downloadStatus: DownloadStatus.downloadFailed));
      }
    });

    on<_PauseDownload>((event, emit) async {
      await state.downloadRepository.pauseDownload(event.taskId);
      emit(
        state.copyWith(
          taskId: event.taskId,
          downloadStatus: DownloadStatus.downloadPaused,
        ),
      );
    });

    on<_ResumeDownload>((event, emit) async {
      await state.downloadRepository.resumeDownload(event.taskId);
      emit(
        state.copyWith(
          taskId: event.taskId,
          progress: 0,
          downloadStatus: DownloadStatus.downloadInProgress,
        ),
      );
    });

    on<_CancelDownload>((event, emit) async {
      await state.downloadRepository.cancelDownload(event.taskId);
      emit(
        state.copyWith(
          downloadStatus: DownloadStatus.downloadCancelled,
          taskId: event.taskId,
        ),
      );
    });

    state.downloadRepository.downloadProgressStream.listen((event) {
      add(event); // directly add the event

      // if (event is _DownloadProgressUpdate) {
      //   add(
      //     DownloadEvent.downloadProgressUpdate(
      //       taskId: event.taskId,
      //       status: event.status,
      //       progress: event.progress,
      //     ),
      //   );
      // }
    });

    on<_DownloadProgressUpdate>((event, emit) async {
      print('Download Update: ${event.status}, ${event.progress}');

      if (event.status == 3) {
        emit(
          state.copyWith(
            taskId: event.taskId,
            downloadStatus: DownloadStatus.downloadCompleted,
          ),
        );

        // 👇 Use FlutterDownloader's own built-in open method
        await FlutterDownloader.open(taskId: event.taskId);
      } else if (event.status == 4) {
        emit(
          state.copyWith(
            taskId: event.taskId,
            downloadStatus: DownloadStatus.downloadFailed,
          ),
        );
      } else if (event.status == 5) {
        emit(
          state.copyWith(
            taskId: event.taskId,
            downloadStatus: DownloadStatus.downloadCancelled,
          ),
        );
      } else if (event.status == 6) {
        emit(
          state.copyWith(
            taskId: event.taskId,
            downloadStatus: DownloadStatus.downloadPaused,
          ),
        );
      } else {
        emit(
          state.copyWith(
            taskId: event.taskId,
            progress: event.progress,
            downloadStatus: DownloadStatus.downloadInProgress,
          ),
        );
      }
    });
  }
}
