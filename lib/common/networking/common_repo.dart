import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'http_client.dart';
import 'network_exception.dart';

class CommonRepository {
  static Future<ApiResponse<T>> postRequest<T>({
    required String url,
    required Map<String, dynamic> request,
    required T Function(Map<String, dynamic>?) fromJson,
    String? docFile,
  }) async {
    final tag = url.split('/').last;
    log(
      '======================================================================================================',
    );
    log("TAG $tag \n REQUEST BODY Common Repo : \n ${jsonEncode(request)}");

    try {
      final response = await HttpClient.instance().post(
        url: url,
        body: request,
      );

      log(
        '======================================================================================================',
      );
      log(
        "TAG $tag \n RESPONSE Common Repo : \n STATUS : ${response["status"]} \n DATA : ${response["data"]}",
      );

      final status = response["status"];
      final data = response["data"];

      // ✅ Handle Success Case
      if (status == 200 && data != null) {
        return ApiResponse<T>(
          statusCode: status,
          message: response["message"] ?? "Success",
          data: fromJson(data),
        );
      }

      // ✅ Handle Validation Error (422)
      if (status == 422 && data == null) {
        // Example of extracting validation errors
        final errorList = response["errors"] ?? [];
        final validationMessages = (errorList as List)
            .map((e) => "${e['message'] ?? ''}")
            .join('\n'); // <-- combine all messages with newline

        // final validationMessages = (errorList as List)
        //     .map((e) => "${e['key']}: ${e['message']}")
        //     .join('\n');

        return ApiResponse<T>(
          statusCode: status,
          message: validationMessages, // <-- single string of all messages
          data: null,
        );
      }

      // ✅ Handle other non-success responses
      return ApiResponse<T>(
        statusCode: status,
        message:
            response["message"] ??
            response["detail"] ??
            "An unexpected API error occurred.",
        data: null,
      );
    } catch (e) {
      log(
        '======================================================================================================',
      );
      log("TAG $tag \n CATCH ERROR Common Repo : $e ");

      return ApiResponse<T>(
        statusCode: 500,
        message: e is NetworkException
            ? e.message
            : e is InternetException
            ? e.message
            : e.toString(),
        data: null,
      );
    }
  }

  static Future<ApiResponse<T>> getRequest<T>({
    required String url,
    required Map<String, dynamic> params,
    String? byId,
    required T Function(Map<String, dynamic>?) fromJson,
    String? docFile,
  }) async {
    final tag = url.split('/').last;
    log(
      '======================================================================================================',
    );
    log("TAG $tag \n REQUEST BODY Common Repo : \n ${jsonEncode(params)}");

    try {
      final response = await HttpClient.instance().get(
        url: byId == null ? url : "$url/$byId",
        parameters: {},
      );

      log(
        '======================================================================================================',
      );
      log(
        "TAG $tag \n RESPONSE Common Repo : \n STATUS : ${response["status"]} \n , DATA : ${response["data"]}",
      );

      final status = response["status"];
      final data = response["data"];

      if (status == 200) {
        final dynamic data = response["data"];

        if (data == null) {
          // ✅ case: data is null
          return ApiResponse<T>(
            statusCode: response["status"],
            message: response["message"],
            data: null,
          );
        }

        if (data is Map<String, dynamic>) {
          // ✅ case: data is a single object
          return ApiResponse<T>(
            statusCode: response["status"],
            message: response["message"],
            data: fromJson(data),
          );
        } else if (data is List) {
          // ✅ case: data is a list — wrap in a map for fromJson
          return ApiResponse<T>(
            statusCode: response["status"],
            message: response["message"],
            data: fromJson({'list': data}),
          );
        } else {
          // ✅ fallback for unexpected types
          return ApiResponse<T>(
            statusCode: response["status"],
            message: response["message"],
            data: null,
          );
        }
      } else if (status == 422 && data == null) {
        // Example of extracting validation errors
        final errorList = response["errors"] ?? [];
        final validationMessages = (errorList as List)
            .map((e) => "${e['message'] ?? ''}")
            .join('\n'); // <-- combine all messages with newline

        // final validationMessages = (errorList as List)
        //     .map((e) => "${e['key']}: ${e['message']}")
        //     .join('\n');

        return ApiResponse<T>(
          statusCode: status,
          message: validationMessages, // <-- single string of all messages
          data: null,
        );
      } else {
        return ApiResponse<T>(
          statusCode: response["status"],
          message: response["message"] ?? "An unexpected API error occurred.",
          data: null,
        );
      }
    } catch (e) {
      log(
        '======================================================================================================',
      );
      log("TAG $tag \n CATCH ERROR Common Repo : $e ");

      return ApiResponse<T>(
        statusCode: 500,
        message: e is NetworkException
            ? e.message
            : e is InternetException
            ? e.message
            : e.toString(),
        data: null,
      );
    }
  }

  static Future<ApiResponse<T>> postMultipartRequest<T>({
    required String url,
    required Map<String, dynamic> body,
    required T Function(Map<String, dynamic>?) fromJson,
    required File? file,
    String fileKey = 'File',
    Map<String, dynamic>? parameters,
  }) async {
    final tag = url.split('/').last;
    log(
      '======================================================================================================',
    );
    log("TAG $tag \n REQUEST BODY Common Repo : \n ${jsonEncode(body)}");
    log("TAG $tag \n FILE PATH : ${file?.path}");

    try {
      final response = await HttpClient.instance().postMultipart(
        url: url,
        parameters: parameters,
        body: body,
        file: file,
        fileKey: fileKey,
      );

      log(
        '======================================================================================================',
      );
      log(
        "TAG $tag \n RESPONSE Common Repo : \n STATUS : ${response["status"]} \n MESSAGE : ${response["message"]} \n DATA : ${response["data"]}",
      );

      if (response["status"] == "Success" || response["status"] == 200) {
        if (response["data"] != null) {
          return ApiResponse<T>(
            statusCode: response["status"],
            message: response["message"] ?? "Success",
            data: fromJson(response["data"]),
          );
        } else {
          return ApiResponse<T>(
            statusCode: response["status"],
            message: response["message"],
            data: null,
          );
        }
      } else {
        return ApiResponse<T>(
          statusCode: response["status"],
          message: response["message"] ?? "An unexpected API error occurred.",
          data: null,
        );
      }
    } catch (e) {
      log(
        '======================================================================================================',
      );
      log("TAG $tag \n CATCH ERROR Common Repo : $e ");
      return ApiResponse<T>(
        statusCode: 501,
        message: e is NetworkException
            ? e.message
            : e is InternetException
            ? e.message
            : e.toString(),
        data: null,
      );
    }
  }
}

class ApiResponse<T> {
  final int statusCode;
  final String? message;
  final T? data;

  ApiResponse({required this.statusCode, this.message, this.data});

  bool get isSuccess => statusCode == 200;
}
