import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:geocoding/geocoding.dart' as geo;
import 'package:hrms_uis/common/utils/formatters/date_formats.dart';
import 'package:hrms_uis/common/utils/formatters/formatter.dart';
import 'package:http/http.dart' as http;

import '../../../common/networking/api_url.dart';
import '../../../common/networking/common_repo.dart';
import '../models/approve_attendance_model.dart';
import '../models/daily_attendance_model.dart';
import '../models/monthly_attendance_model.dart';

class AttendanceRepo {
  Future<String> getAddressFromLatLng({
    required double latitude,
    required double longitude,
  }) async {
    try {
      // Try Mappls API first
      final url = Uri.parse(
        "https://search.mappls.com/search/address/rev-geocode?lat=$latitude&lng=$longitude&access_token=wjvrovmzcmmhktdmiknvfytfywagssalaaph",
      );

      final response = await http.get(url);

      log(
        "Reverse geocoding API response: status=${response.statusCode}, body=${response.body}",
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);

        if (data['responseCode'] == 200 &&
            data['results'] != null &&
            data['results'].isNotEmpty) {
          final result = data['results'][0];
          final formattedAddress = result['formatted_address'] ?? '';

          if (formattedAddress.isNotEmpty) {
            log("Address from Mappls: $formattedAddress");
            return formattedAddress;
          }
        }
      }

      // If Mappls fails or gives empty result, fallback to Geocoding
      log("Falling back to geocoding package...");

      final placemarks = await geo.placemarkFromCoordinates(
        latitude,
        longitude,
      );

      if (placemarks.isNotEmpty) {
        final place = placemarks.first;
        final address =
            "${place.name ?? ''}, ${place.subLocality ?? ''}, ${place.locality ?? ''}, ${place.administrativeArea ?? ''}, ${place.postalCode ?? ''}, ${place.country ?? ''}"
                .replaceAll(RegExp(r',\s+,'), ',')
                .trim();

        log("Address from geocoding: $address");
        return address;
      } else {
        throw Exception("No address found using geocoding package.");
      }
    } catch (e, st) {
      log("Error getting address: $e\n$st");
      // Final fallback — try geocoding again if even Mappls request threw an exception
      try {
        final placemarks = await geo.placemarkFromCoordinates(
          latitude,
          longitude,
        );
        if (placemarks.isNotEmpty) {
          final place = placemarks.first;
          final address =
              "${place.name ?? ''}, ${place.subLocality ?? ''}, ${place.locality ?? ''}, ${place.administrativeArea ?? ''}, ${place.postalCode ?? ''}, ${place.country ?? ''}"
                  .replaceAll(RegExp(r',\s+,'), ',')
                  .trim();

          log("Address from geocoding (exception fallback): $address");
          return address;
        }
      } catch (innerError) {
        log("Geocoding fallback also failed: $innerError");
      }

      return "Address not available";
    }
  }

  Future<String> getAddressFromLatLngIndiaMap({
    required double latitude,
    required double longitude,
  }) async {
    final url = Uri.parse(
      "https://search.mappls.com/search/address/rev-geocode?lat=$latitude&lng=$longitude&access_token=wjvrovmzcmmhktdmiknvfytfywagssalaaph",
    );

    final response = await http.get(url);

    log(
      "Reverse geocoding API response: status=${response.statusCode}, body=${response.body}",
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);

      // Check responseCode from Mappls API
      if (data['responseCode'] == 200 &&
          data['results'] != null &&
          data['results'].isNotEmpty) {
        final result = data['results'][0];
        final formattedAddress = result['formatted_address'] ?? '';

        log("Formatted address: $formattedAddress");
        return formattedAddress;
      } else {
        throw Exception(
          'No address found or API error: ${data['responseCode']}',
        );
      }
    } else {
      throw Exception(
        'Failed to fetch reverse geocode data. Status: ${response.statusCode}',
      );
    }
  }

  Future<ApiResponse<DailyAttendanceModel>> fetchAttendanceData({
    required int? userId,
    required String isoDateTime,
  }) async {
    try {
      var response = CommonRepository.getRequest(
        url:
            "${ApiUrl.fetchAttendanceDateWise}AttendanceDate=$isoDateTime&EmployeeId=${userId ?? ""}",
        fromJson: (json) => DailyAttendanceModel.fromJson(json!),
        params: {},
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<ApiResponse<Map<String, dynamic>>> checkIn({
    required File imageFile,
    required int employeeId,
    required String addressText,
    required double latitude,
    required double longitude,
  }) async {
    try {
      var response = CommonRepository.postMultipartRequest(
        url: ApiUrl.checkIn,
        body: {
          "location": addressText,
          "latitude": latitude.toString(),
          "longitude": longitude.toString(),
        },
        fromJson: (json) => json as Map<String, dynamic>,
        file: imageFile,
        fileKey: "PicCapture",
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<ApiResponse<Map<String, dynamic>>> checkOut({
    required int employeeId,
    required String addressText,
    required double latitude,
    required double longitude,
    required File imageFile,
  }) async {
    try {
      var response = CommonRepository.postMultipartRequest(
        url: ApiUrl.checkOut,
        body: {
          "location": addressText,
          "latitude": latitude.toString(),
          "longitude": longitude.toString(),
          "outOnDutyStatus": true,
          "checkOutType": 0,
        },
        fromJson: (json) => json as Map<String, dynamic>,
        file: imageFile,
        fileKey: "PicCapture",
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  // Future<ApiResponse<Map<String, dynamic>>> checkIn({
  //   required File imageFile,
  //   required int employeeId,
  //   required String addressText,
  //   required double latitude,
  //   required double longitude,
  // }) async {
  //   try {
  //     var response = CommonRepository.postRequest(
  //       url: ApiUrl.checkIn,
  //       request: {
  //         "location": addressText,
  //         "latitude": latitude.toString(),
  //         "longitude": longitude.toString(),
  //         "picCapturePath": imageFile.path.split("/").last,
  //       },
  //       fromJson: (json) => json as Map<String, dynamic>,
  //     );
  //     return response;
  //   } catch (e) {
  //     rethrow;
  //   }
  // }
  //
  // Future<ApiResponse<Map<String, dynamic>>> checkOut({
  //   required int employeeId,
  //   required String addressText,
  //   required double latitude,
  //   required double longitude,
  //   required File imageFile,
  // }) async {
  //   try {
  //     var response = CommonRepository.postRequest(
  //       url: ApiUrl.checkOut,
  //       request: {
  //         "location": addressText,
  //         "latitude": latitude.toString(),
  //         "longitude": longitude.toString(),
  //         "picCapturePath": imageFile.path.split("/").last,
  //         "outOnDutyStatus": true,
  //         "checkOutType": 0,
  //       },
  //       fromJson: (json) => json as Map<String, dynamic>,
  //     );
  //     return response;
  //   } catch (e) {
  //     rethrow;
  //   }
  // }

  Future<ApiResponse<MonthlyAttendanceModel>> getMonthlyAttendance({
    required int? userId,
    required int month,
    required int year,
  }) async {
    try {
      var response = CommonRepository.getRequest(
        url:
            "${ApiUrl.getMonthlyAttendance}employeeId=${userId ?? ""}&month=$month&year=$year",
        fromJson: (json) => MonthlyAttendanceModel.fromJson(json!),
        params: {},
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<ApiResponse<ApproveAttendanceModel>> getApproveAttendanceList({
    required int? empId,
    required DateTime? fromDate,
    required DateTime? toDate,
  }) async {
    try {
      var response = CommonRepository.getRequest(
        url:
            "${ApiUrl.getApproveAttendanceList}$empId?fromDate=${AppFormatter.formatDate(fromDate, format: DateFormats.ymdDash) ?? ''}&toDate=${AppFormatter.formatDate(toDate, format: DateFormats.ymdDash) ?? ""}",
        fromJson: (json) => ApproveAttendanceModel.fromJson(json!),
        params: {},
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<ApiResponse<Map<String, dynamic>>> approveAttendanceByManager({
    required bool isApprove,
    required List<int> attendanceList,
    String? remarks,
  }) async {
    try {
      var response = CommonRepository.postRequest(
        url: ApiUrl.approveAttendanceByManager,
        request: {
          "attendanceIds": attendanceList,
          "stage": "string",
          "approve": isApprove,
          "remarks": remarks,
        },
        fromJson: (json) => json as Map<String, dynamic>,
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
