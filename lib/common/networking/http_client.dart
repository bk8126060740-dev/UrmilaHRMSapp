import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hrms_uis/common/networking/api_url.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';

import '../../app/auth/screens/login_screen.dart';
import '../navigation_service/navigation_service.dart';
import '../utils/app_bloc/app_bloc.dart';
import '../utils/custom_dialogs/dialogs.dart';
import '../utils/helpers/helper_functions.dart';
import '../utils/hive/hive_service.dart';
import 'network_exception.dart';

class HttpClient {
  static HttpClient? _instance;
  final _connectivity = Connectivity();

  HttpClient._();

  factory HttpClient.instance() {
    if (_instance == null) {
      return HttpClient._();
    } else {
      return _instance!;
    }
  }

  Future<Map<String, dynamic>> get({
    required String url,
    Map<String, dynamic>? parameters,
    bool responseIsString = false,
    bool removeCheckAfterResponse = false,
  }) async {
    final tag = url.split('/').last;
    try {
      await _checkInternet();

      log('===================================================');

      // ✅ Build proper URI with query params
      String param = _makeParameter(parameters);

      Uri uri = Uri.parse('$url$param');

      log('Request URL: $uri');

      var response = await http.get(uri, headers: _makeHeader());
      log('$url response(${response.statusCode}): ${response.body}');

      if (response.statusCode == 401 && !url.contains(ApiUrl.login)) {
        _autoLogout();
      }

      log(
        "HTTP CLIENT : $tag \n ENCRYPTED RESPONSE :\n STATUS : ${response.statusCode} \n DATA : \n ${response.body}",
      );

      Map<String, dynamic> jsonResponse = {};
      try {
        jsonResponse = json.decode(response.body);
      } catch (_) {
        // If response body is not JSON, wrap it
        jsonResponse = {'data': response.body};
      }

      // **Normalize status**
      int status = response.statusCode;

      // ✅ Handle validation errors (422)
      if (status == 422) {
        final errors = jsonResponse['errors'] ?? [];
        final validationMessage = (errors as List)
            .map((e) => "${e['message'] ?? ''}")
            .join('\n'); // combine all messages
        return {
          'status': status,
          'message': validationMessage.isNotEmpty
              ? validationMessage
              : jsonResponse['detail'] ??
                    jsonResponse['title'] ??
                    'Validation Error',
          'data': null,
          'errors': errors,
        };
      }
      return {
        'status': status,
        'message': jsonResponse['message'] ?? 'Something went wrong',
        'data': jsonResponse['data'],
      };
    } on NetworkException catch (e) {
      log(
        "HTTP CLIENT : $tag \n NETWORK EXCEPTION :\n STATUS CODE : ${e.code} \n MESSAGE : ${e.message}",
      );
      log('===================================================');
      rethrow;
    } on InternetException catch (e) {
      log(
        "HTTP CLIENT : $tag \n INTERNET EXCEPTION : \n MESSAGE : ${e.message}",
      );
      log('===================================================');
      rethrow;
    } catch (e) {
      log("HTTP CLIENT : $tag \n CATCH ERROR :${e.toString()}");
      log('===================================================');
      rethrow;
    }
  }

  Future<Map<String, dynamic>> delete({
    required String url,
    Map<String, dynamic>? parameters,
    bool responseIsString = false,
    bool removeCheckAfterResponse = false,
  }) async {
    final tag = url.split('/').last;
    try {
      await _checkInternet();

      log('===================================================');

      // ✅ Build proper URI with query params
      String param = _makeParameter(parameters);

      Uri uri = Uri.parse('$url$param');

      log('Request URL: $uri');

      var response = await http.delete(uri, headers: _makeHeader());
      log('$url response(${response.statusCode}): ${response.body}');

      if (response.statusCode == 401 && !url.contains(ApiUrl.login)) {
        _autoLogout();
      }

      log(
        "HTTP CLIENT : $tag \n ENCRYPTED RESPONSE :\n STATUS : ${response.statusCode} \n DATA : \n ${response.body}",
      );

      Map<String, dynamic> jsonResponse = {};
      try {
        jsonResponse = json.decode(response.body);
      } catch (_) {
        // If response body is not JSON, wrap it
        jsonResponse = {'data': response.body};
      }

      // **Normalize status**
      int status = response.statusCode;

      // ✅ Handle validation errors (422)
      if (status == 422) {
        final errors = jsonResponse['errors'] ?? [];
        final validationMessage = (errors as List)
            .map((e) => "${e['message'] ?? ''}")
            .join('\n'); // combine all messages
        return {
          'status': status,
          'message': validationMessage.isNotEmpty
              ? validationMessage
              : jsonResponse['detail'] ??
                    jsonResponse['title'] ??
                    'Validation Error',
          'data': null,
          'errors': errors,
        };
      }

      return {
        'status': status,
        'message': jsonResponse['message'] ?? 'Something went wrong',
        'data': jsonResponse['data'],
      };
    } on NetworkException catch (e) {
      log(
        "HTTP CLIENT : $tag \n NETWORK EXCEPTION :\n STATUS CODE : ${e.code} \n MESSAGE : ${e.message}",
      );
      log('===================================================');
      rethrow;
    } on InternetException catch (e) {
      log(
        "HTTP CLIENT : $tag \n INTERNET EXCEPTION : \n MESSAGE : ${e.message}",
      );
      log('===================================================');
      rethrow;
    } catch (e) {
      log("HTTP CLIENT : $tag \n CATCH ERROR :${e.toString()}");
      log('===================================================');
      rethrow;
    }
  }

  Future<Map<String, dynamic>> post({
    required String url,
    Map<String, dynamic>? parameters,
    Map<String, dynamic>? body,
    bool responseIsString = false,
    bool removeCheckAfterResponse = false,
  }) async {
    final tag = url.split('/').last;

    try {
      await _checkInternet();
      String param = _makeParameter(parameters);

      Uri uri = Uri.parse('$url$param');

      log(
        '======================================================================================================',
      );
      log(
        "HTTP CLIENT : $tag \n Request : url: $url \n body : ${jsonEncode(body)} \n header : ${_makeHeader()}",
      );

      var response = await http.post(
        uri,
        body: jsonEncode(body),
        headers: _makeHeader(),
      );

      if (response.statusCode == 401 && !url.contains(ApiUrl.login)) {
        _autoLogout();
      }

      log(
        '======================================================================================================',
      );
      log(
        "HTTP CLIENT : $tag \n RESPONSE : STATUS : ${response.statusCode} \n DATA :\n ${response.body}",
      );

      Map<String, dynamic> jsonResponse = {};
      try {
        jsonResponse = json.decode(response.body);
      } catch (_) {
        // If response body is not JSON, wrap it
        jsonResponse = {'data': response.body};
      }

      // **Normalize status**
      int status = response.statusCode;

      // ✅ Handle validation errors (422)
      if (status == 422) {
        final errors = jsonResponse['errors'] ?? [];
        final validationMessage = (errors as List)
            .map((e) => "${e['message'] ?? ''}")
            .join('\n'); // combine all messages
        return {
          'status': status,
          'message': validationMessage.isNotEmpty
              ? validationMessage
              : jsonResponse['detail'] ??
                    jsonResponse['title'] ??
                    'Validation Error',
          'data': null,
          'errors': errors,
        };
      }

      return {
        'status': status,
        'message': jsonResponse['message'] ?? 'Something went wrong',
        'data': jsonResponse['data'],
      };
    } on FormatException catch (e) {
      log(
        '======================================================================================================',
      );
      log("HTTP CLIENT : $tag \n INVALID JSON : ${e.message}");
      rethrow;
    } on NetworkException catch (e) {
      log(
        '======================================================================================================',
      );
      log("HTTP CLIENT : $tag \n NETWORK EXCEPTION : ${e.message}");
      rethrow;
    } on InternetException catch (e) {
      log(
        '======================================================================================================',
      );
      log("HTTP CLIENT : $tag \n INTERNET EXCEPTION : ${e.message}");
      rethrow;
    } catch (e) {
      log(
        '======================================================================================================',
      );
      log("HTTP CLIENT : $tag \n CATCH ERROR : $e");
      rethrow;
    }
  }

  Future<Map<String, dynamic>> postMultipart({
    required String url,
    Map<String, dynamic>? parameters,
    Map<String, dynamic>? body,
    File? file,
    String? fileKey,
  }) async {
    final tag = url.split('/').last;

    try {
      await _checkInternet();

      log('===================================================');
      String param = _makeParameter(parameters);
      log('url: $url$param');
      log('body: ${jsonEncode(body)}');
      Uri uri = Uri.parse('$url$param');

      var request = http.MultipartRequest('POST', uri)
        ..headers.addAll(_makeHeader(isMultiPart: true));

      // 🔹 Add body fields
      if (body != null) {
        body.forEach((key, value) {
          if (value != null) request.fields[key] = value.toString();
        });
      }

      // 🔹 OPTIONAL FILE HANDLING
      if (file != null && await file.exists()) {
        log("File attached: ${file.path}");

        request.files.add(
          await http.MultipartFile.fromPath(
            fileKey ?? 'file',
            file.path,
            filename: file.path.split('/').last,
          ),
        );
      } else {
        log("No file attached");
      }

      log(
        'Final Multipart Request: ${jsonEncode({'url': uri.toString(), 'headers': request.headers, 'fields': request.fields, 'files': request.files.map((f) => f.filename).toList()})}',
      );

      var response = await request.send();
      var responded = await http.Response.fromStream(response);

      log(
        '======================================================================================================',
      );

      log(
        "HTTP CLIENT : $tag \n RESPONSE : STATUS : ${response.statusCode} \n DATA :\n ${responded.body}",
      );

      // Parse response
      Map<String, dynamic> jsonResponse = {};
      try {
        jsonResponse = json.decode(responded.body);
      } catch (_) {
        jsonResponse = {'data': responded.body};
      }

      int status = response.statusCode;

      if (status == 401 && !url.contains(ApiUrl.login)) {
        _autoLogout();
      }

      if (status == 422) {
        final errors = jsonResponse['errors'] ?? [];
        final validationMessage = (errors as List)
            .map((e) => "${e['message'] ?? ''}")
            .join('\n');

        return {
          'status': status,
          'message': validationMessage.isNotEmpty
              ? validationMessage
              : jsonResponse['detail'] ??
                    jsonResponse['title'] ??
                    'Validation Error',
          'data': null,
          'errors': errors,
        };
      }

      return {
        'status': status,
        'message': jsonResponse['message'] ?? 'Something went wrong',
        'data': jsonResponse['data'],
      };
    } catch (e) {
      log('Error: $e');
      rethrow;
    }
  }

  Future<File?> downloadFile({
    required String url,
    required void Function(double progress) onProgress,
    Map<String, String>? headers,
  }) async {
    try {
      await _checkInternet();

      final client = http.Client();
      final request = http.Request('GET', Uri.parse(url));

      // 🔐 Add headers if needed (token, accept)
      request.headers.addAll({
        'Accept': '*/*',
        if (headers != null) ...headers,
      });

      final response = await client.send(request);

      // ❌ Handle error responses FIRST
      if (response.statusCode != 200) {
        final responseBody = await response.stream.bytesToString();

        log("[HttpClient] ❌ Non-200 response", name: "HttpClient");
        log(
          "[HttpClient] StatusCode => ${response.statusCode}",
          name: "HttpClient",
        );
        log(
          "[HttpClient] Raw responseBody => $responseBody",
          name: "HttpClient",
        );

        try {
          final decoded = jsonDecode(responseBody);

          log("[HttpClient] Decoded JSON => $decoded", name: "HttpClient");

          String errorMessage = decoded['detail'] ?? 'Something went wrong';

          if (decoded['errors'] != null && decoded['errors'].isNotEmpty) {
            errorMessage = decoded['errors'][0]['message'];
          }

          log(
            "[HttpClient] Parsed errorMessage => $errorMessage",
            name: "HttpClient",
          );

          // ✅ Throw parsed backend error
          throw ApiException(response.statusCode, errorMessage);
        } on FormatException catch (e) {
          // JSON parsing failed
          log("[HttpClient] ❌ JSON parse failed => $e", name: "HttpClient");

          throw ApiException(response.statusCode, 'Invalid server response');
        }
      }

      // 📁 Directory
      final directory = Platform.isIOS
          ? await getApplicationDocumentsDirectory()
          : await getExternalStorageDirectory();

      if (directory == null) {
        throw Exception('Storage directory not available');
      }

      // 🕒 Timestamp
      final timestamp = DateFormat('yyyyMMdd_HHmmss').format(DateTime.now());

      // ===============================
      // 📄 FILE NAME RESOLUTION (KEY FIX)
      // ===============================

      String fileName = 'salary_slip_$timestamp';
      String extension = '.pdf'; // default

      // 1️⃣ From Content-Disposition
      final contentDisposition = response.headers['content-disposition'];

      if (contentDisposition != null) {
        final match = RegExp(
          r'filename="?([^"]+)"?',
        ).firstMatch(contentDisposition);
        if (match != null) {
          final fullName = match.group(1)!;
          fileName = fullName.split('.').first;
          extension = '.${fullName.split('.').last}';
        }
      } else {
        // 2️⃣ From Content-Type
        final contentType = response.headers['content-type'] ?? '';
        extension = AppHelperFunctions.extensionFromContentType(contentType);
      }

      final filePath = '${directory.path}/$fileName-$timestamp$extension';

      final file = File(filePath);
      final sink = file.openWrite();

      final totalBytes = response.contentLength;
      int receivedBytes = 0;

      await response.stream
          .listen(
            (chunk) {
              receivedBytes += chunk.length;
              sink.add(chunk);

              // 📊 Progress handling
              if (totalBytes != null && totalBytes > 0) {
                onProgress(receivedBytes / totalBytes);
              }
            },
            onDone: () async {
              await sink.flush();
              await sink.close();
            },
            onError: (e) async {
              await sink.close();
              throw e;
            },
            cancelOnError: true,
          )
          .asFuture();

      client.close();
      return file;
    } catch (e) {
      rethrow;
    }
  }

  // Future<File?> downloadFile({
  //   required String url,
  //   required void Function(double progress) onProgress,
  // }) async {
  //   try {
  //     await _checkInternet();
  //
  //     final request = http.Request('GET', Uri.parse(url));
  //     final response = await http.Client().send(request);
  //
  //     final totalBytes = response.contentLength ?? 0;
  //     int receivedBytes = 0;
  //
  //     Directory directory;
  //     if (Platform.isIOS) {
  //       directory = await getApplicationDocumentsDirectory();
  //     } else {
  //       directory = (await getExternalStorageDirectory())!;
  //     }
  //
  //     String timestamp = DateFormat('yyyyMMdd_HHmmss').format(DateTime.now());
  //
  //     String fileNameWithExtension = url.split('/').last;
  //     String fileName = fileNameWithExtension.split('.').first;
  //     String extension = fileNameWithExtension.contains('.')
  //         ? '.${fileNameWithExtension.split('.').last}'
  //         : '';
  //
  //     final filePath = '${directory.path}/$fileName-$timestamp$extension';
  //
  //     final file = File(filePath);
  //
  //     final sink = file.openWrite();
  //
  //     await response.stream
  //         .listen(
  //           (chunk) {
  //             receivedBytes += chunk.length;
  //             sink.add(chunk);
  //
  //             if (totalBytes > 0) {
  //               onProgress(receivedBytes / totalBytes); // 0.0 → 1.0
  //             }
  //           },
  //           onDone: () async {
  //             await sink.close();
  //           },
  //           onError: (e) async {
  //             await sink.close();
  //             throw e;
  //           },
  //           cancelOnError: true,
  //         )
  //         .asFuture();
  //
  //     return file;
  //   } catch (e) {
  //     rethrow;
  //   }
  // }

  // Future<File?> downloadFile({required String url}) async {
  //   try {
  //     await _checkInternet();
  //
  //     final client = http.Client();
  //     final request = http.Request('GET', Uri.parse(url));
  //     final response = await client.send(request);
  //
  //     Directory directory;
  //
  //     if (Platform.isIOS) {
  //       directory = await getApplicationDocumentsDirectory();
  //     } else {
  //       // ✅ Google Play safe directory
  //       directory = (await getExternalStorageDirectory())!;
  //     }
  //
  //     String timestamp = DateFormat('yyyyMMdd_HHmmss').format(DateTime.now());
  //
  //     String fileNameWithExtension = url.split('/').last;
  //     String fileName = fileNameWithExtension.split('.').first;
  //     String extension = fileNameWithExtension.contains('.')
  //         ? '.${fileNameWithExtension.split('.').last}'
  //         : '';
  //
  //     final filePath = '${directory.path}/$fileName-$timestamp$extension';
  //
  //     final file = File(filePath);
  //     await response.stream.pipe(file.openWrite());
  //
  //     return file;
  //   } catch (e) {
  //     rethrow;
  //   }
  // }

  /*
  Future<File?> downloadFile({required String url}) async {
    BuildContext? context = NavigationService.navigatorKey.currentContext;
    final plugin = DeviceInfoPlugin();
    final android = await plugin.androidInfo;

    try {
      await _checkInternet();
      log('===================================================');
      // var status = await permission.Permission.storage.status;
      var status = android.version.sdkInt < 33
          ? await permission.Permission.storage.request()
          : permission.PermissionStatus.granted;

      if (status.isDenied) {
        await permission.Permission.storage.request();
        if (status.isDenied) {
          return Future.error('Storage permissions are denied');
        }
      }
      if (status.isPermanentlyDenied) {
        if (context != null) {
          CustomDialogs.showCommonAlertDialog(
            context: context,
            title: "Storage Permission",
            message:
                "Storage permissions are permanently denied, please enable them in the app settings.",
            child: DownloadDialog(),
          );
        }
        return Future.error(
          'Storage permissions are permanently denied, please enable them in the app settings.',
        );
      }
      */
  /*if (!status.isGranted ||
          !status.isLimited ||
          status.isDenied ||
          status.isRestricted ||
          status.isPermanentlyDenied) {
        await permission.Permission.storage.request();
        AppSettings.openAppSettings(type: AppSettingsType.settings);
      }*/ /*

      status = android.version.sdkInt < 33
          ? await permission.Permission.storage.request()
          : permission.PermissionStatus.granted;
      log('permission Status: ${status.isGranted */
  /*|| status.isLimited*/ /*
}');
      if (status.isGranted || status.isLimited) {
        log('Download Url: $url');
        final client = http.Client();
        final request = http.Request('GET', Uri.parse(url));
        http.StreamedResponse response = await client.send(request);
        int totalBytes = response.contentLength ?? 0;
        Directory? directory;

        if (Platform.isIOS) {
          directory = await getApplicationDocumentsDirectory();
        } else {
          directory = Directory('/storage/emulated/0/Download');
          // Put file in global download folder, if for an unknown reason it didn't exist, we fallback
          // ignore: avoid_slow_async_io
          if (!await directory.exists()) {
            directory = await getExternalStorageDirectory();
          }
        }

        // before without timestamp -------------------------------------------------->>>>>
        // File file = File('${directory!.path}/${url.split('/').last}');
        // log('file path: ${file.path}');
        // await response.stream.pipe(file.openWrite());

        // after download with timestamp--------------------------------------------------->>>>>>>
        String timestamp = DateFormat('yyyyMMdd_HHmmss').format(DateTime.now());
        String fileNameWithExtension = url.split('/').last;
        String fileName = fileNameWithExtension.split('.').first;
        String extension = fileNameWithExtension.contains('.')
            ? '.${fileNameWithExtension.split('.').last}'
            : '';

        // Create a file path with the filename, timestamp, and extension
        String filePath = '${directory!.path}/$fileName-$timestamp$extension';

        File file = File(filePath);
        log('file path: ${file.path}');
        await response.stream.pipe(file.openWrite());
        return file;
      }

      // throw PermissionException(message: "Don't have permission to download");
    } on InternetException catch (e) {
      log('Internet exception: ${e.message}');
      log('===================================================');
      rethrow;
    } on PermissionException catch (e) {
      log('Internet exception: ${e.message}');
      log('===================================================');
      rethrow;
    } catch (e) {
      log('error (${e.runtimeType}: ${e.toString()}');
      log('===================================================');
      rethrow;
    }
    return null;
  }
*/

  static String createGetUrl(
    String endpoint, {
    Map<String, dynamic>? queryParams,
  }) {
    final uri = Uri.parse(endpoint).replace(
      queryParameters: queryParams?.map(
        (key, value) => MapEntry(key, value.toString()),
      ),
    );

    return uri.toString();
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
              // "Authorization": "Bearer $userToken",
              "Authorization": userToken,
            }
          : {
              'Content-Type': 'application/json',
              // "Authorization": "Bearer $userToken",
              "Authorization": userToken,
            };
      log('token from: $userToken');
    } else {
      header = {'Content-Type': 'application/json; charset=UTF-8'};
    }
    log('header: $header');
    return header;
  }

  String _makeParameter(Map<String, dynamic>? param) {
    if (param == null) {
      return '';
    } else {
      String strParam = '';
      for (String key in param.keys) {
        if (strParam.isEmpty) {
          strParam = '?$key=${param[key]}';
        } else {
          strParam = '&$key=${param[key]}';
        }
      }
      return strParam;
    }
  }

  void _autoLogout() {
    BuildContext? context = NavigationService.navigatorKey.currentContext;
    if (context != null) {
      CustomDialogs.showAlertDialog(
        isDismissible: false,
        context: context,
        title: 'Session Expired',
        content: 'Your session has expired. Please sign in again to continue.',
        confirmText: 'Sign In',
        cancelText: null,
        onConfirm: () async {
          HiveService.clear();
          NavigationService.navigateAndRemoveAll(LoginScreen.route);
        },
      );
    }
  }

  Future<void> _checkInternet() async {
    final connectivityResult = await (_connectivity.checkConnectivity());
    const String message = 'Internet is not working';
    if (connectivityResult.contains(ConnectivityResult.mobile) ||
        connectivityResult.contains(ConnectivityResult.wifi)) {
      if (kIsWeb) {
        try {
          var result = await http.get(Uri.parse('www.google.com'));
          if (result.statusCode != 200) {
            throw InternetException(message: message);
          }
        } catch (e) {
          throw InternetException(message: message);
        }
      } else {
        try {
          final result = await InternetAddress.lookup('www.google.com');
          if (result.isEmpty && result[0].rawAddress.isEmpty) {
            throw InternetException(message: message);
          }
        } on SocketException catch (_) {
          throw InternetException(message: message);
        }
      }
    } else {
      throw InternetException(message: message);
    }
  }
}
