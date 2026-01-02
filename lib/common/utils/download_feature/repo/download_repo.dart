import 'dart:async';
import 'dart:developer';
import 'dart:io';
import 'dart:isolate';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:hrms_uis/common/utils/popups/custom_toast.dart';
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../../navigation_service/navigation_service.dart';
import '../../app_bloc/app_bloc.dart';
import '../bloc/download_bloc.dart';

// Place this OUTSIDE any class
@pragma('vm:entry-point')
void downloadCallback(String id, int status, int progress) {
  log("Callback: $id | status=$status | progress=$progress");
  final SendPort? send = IsolateNameServer.lookupPortByName(
    'downloader_send_port',
  );
  send?.send([id, status, progress]);
}

class DownloadRepository {
  final ReceivePort _port = ReceivePort();

  DownloadRepository() {
    _bindBackgroundIsolate();
  }

  void dispose() {
    _unbindBackgroundIsolate();
  }

  Future<bool> requestNotificationPermission() async {
    await Permission.notification.request();
    PermissionStatus status = await Permission.notification.status;

    if (status.isDenied) {
      // Request permission
      status = await Permission.notification.request();
    }

    if (status.isPermanentlyDenied) {
      // Open app settings
      CustomToast.showInfo(
        message: "Please provide notification permission to continue",
      );
      openAppSettings();
      return false;
    }

    return status.isGranted;
  }

  void _bindBackgroundIsolate() {
    final isSuccess = IsolateNameServer.registerPortWithName(
      _port.sendPort,
      'downloader_send_port',
    );

    if (!isSuccess) {
      _unbindBackgroundIsolate();
      _bindBackgroundIsolate();
      return;
    } else {
      _port.listen((dynamic message) {
        final String id = message[0];
        final int status = message[1];
        final int progress = message[2];
        // Send the progress update to the BLoC
        _downloadProgressController.add(
          DownloadEvent.downloadProgressUpdate(
            taskId: id,
            status: status,
            progress: progress,
          ),
        );
      });
      // FlutterDownloader.registerCallback(downloadCallback);
    }
  }

  void _unbindBackgroundIsolate() {
    IsolateNameServer.removePortNameMapping('downloader_send_port');
  }

  final StreamController<DownloadEvent> _downloadProgressController =
      StreamController<DownloadEvent>.broadcast();

  Stream<DownloadEvent> get downloadProgressStream =>
      _downloadProgressController.stream;

  Future<String?> downloadFile({
    required String url,
    String? docFileName,
    String? fileExtension,
  }) async {
    Directory? directory;
    if (Platform.isIOS) {
      print('platform ios wale if m');
      directory = await getApplicationDocumentsDirectory();
    } else {
      directory = Directory('/storage/emulated/0/Download');
      if (!await directory.exists()) {
        print('directory exist checking');
        directory = await getExternalStorageDirectory();
      }
    }
    print('directory exist checking done');
    String timestamp = DateFormat('_HHmmss').format(DateTime.now());
    String fileNameWithExtension = url.split('/').last;
    // String fileName = fileNameWithExtension.split('.').first;
    String fileName = docFileName ?? '';
    String extension = fileNameWithExtension.contains('.')
        ? '.${fileNameWithExtension.split('.').last}'
        : fileExtension ?? '.pdf';
    print('naming extension done and flutter donwloader started');
    // return await FlutterDownloader.enqueue(
    //   saveInPublicStorage: true,
    //   fileName: "$fileName$timestamp$extension",
    //   url: url,
    //   savedDir: directory?.path ?? "",
    //   showNotification: true,
    //   openFileFromNotification: true,
    //   headers: _makeHeader(),
    // );
  }

  Map<String, String> _makeHeader({bool? isMultiPart}) {
    Map<String, String> header;
    BuildContext? context = NavigationService.navigatorKey.currentContext;
    String? userToken;

    if (context != null) {
      userToken = context.read<AppBloc>().state.loginResponse?.token;
    }

    if (userToken != null) {
      header = isMultiPart != null
          ? {
              // 'Content-Type': 'multipart/form-data',
              'accept': '*/*',
              "Authorization": "Bearer $userToken",
            }
          : {
              'Content-Type': 'application/json',
              "Authorization": "Bearer $userToken",
            };
      log('token from: $userToken');
    } else {
      header = {'Content-Type': 'application/json; charset=UTF-8'};
    }
    log('header: $header');
    return header;
  }

  Future<void> pauseDownload(String taskId) async {
    // await FlutterDownloader.pause(taskId: taskId);
  }

  Future<void> resumeDownload(String taskId) async {
    // await FlutterDownloader.resume(taskId: taskId);
  }

  Future<void> cancelDownload(String taskId) async {
    // await FlutterDownloader.cancel(taskId: taskId);
  }
}
