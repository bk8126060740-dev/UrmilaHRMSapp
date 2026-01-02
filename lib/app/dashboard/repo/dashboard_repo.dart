import 'package:hrms_uis/app/attendance/models/monthly_attendance_model.dart';
import 'package:hrms_uis/app/dashboard/model/user_profile_data_model.dart';

import '../../../common/networking/api_url.dart';
import '../../../common/networking/common_repo.dart';
import '../model/app_version_model.dart';

class DashboardRepo {
  Future<ApiResponse<UserProfileDataModel>> getUserProfileData({
    required int? userId,
  }) async {
    try {
      var response = CommonRepository.getRequest(
        url: "${ApiUrl.getUserProfileData}${userId ?? ""}",
        fromJson: (json) => UserProfileDataModel.fromJson(json!),
        params: {},
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<ApiResponse<MonthlyAttendanceModel>> getMonthlyAttendance({
    required int? userId,
    required int month,
    required int year,
  }) async {
    try {
      var response = CommonRepository.getRequest(
        url:
            "${ApiUrl.getMonthlyAttendance}month=$month&year=$year&EmployeeId=${userId ?? ""}",
        fromJson: (json) => MonthlyAttendanceModel.fromJson(json!),
        params: {},
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<ApiResponse<AppVersionModel>> getLatestVersion() async {
    try {
      var response = CommonRepository.getRequest(
        url: ApiUrl.getLatestVersion,
        fromJson: (json) => AppVersionModel.fromJson(json!),
        params: {},
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
