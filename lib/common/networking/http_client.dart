import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hrms_uis/common/networking/api_url.dart';
import 'package:http/http.dart' as http;

import '../../app/auth/screens/login_screen.dart';
import '../navigation_service/navigation_service.dart';
import '../utils/app_bloc/app_bloc.dart';
import '../utils/custom_dialogs/dialogs.dart';
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
    File? file,                    // 👈 make file nullable
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
        'Final Multipart Request: ${jsonEncode({
          'url': uri.toString(),
          'headers': request.headers,
          'fields': request.fields,
          'files': request.files.map((f) => f.filename).toList(),
        })}',
      );

      var response = await request.send();
      var responded = await http.Response.fromStream(response);

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
          await HiveService.clear();
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
