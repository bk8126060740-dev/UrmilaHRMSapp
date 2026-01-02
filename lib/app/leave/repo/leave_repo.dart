import 'dart:io';

import 'package:hrms_uis/app/leave/model/approval_leave_list_model.dart';
import 'package:hrms_uis/app/leave/model/employee_leave_data_model.dart';
import 'package:hrms_uis/app/leave/model/leave_type_data_model.dart';
import 'package:hrms_uis/common/utils/formatters/date_formats.dart';
import 'package:hrms_uis/common/utils/formatters/formatter.dart';
import 'package:hrms_uis/common/widgets/dropdown/dropdown_model.dart';

import '../../../common/networking/api_url.dart';
import '../../../common/networking/common_repo.dart';

class LeaveRepo {
  // <<----------------- employee login leave module-------------->>>
  // get leave type
  Future<ApiResponse<LeaveTypeBalanceDataModel>> getLeaveType({
    int? empId,
  }) async {
    try {
      var response = CommonRepository.getRequest(
        url: "${ApiUrl.getLeaveTypeBalanceData}${empId ?? ""}",
        fromJson: (json) => LeaveTypeBalanceDataModel.fromJson(json!),
        params: {},
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  // apply leave
  Future<ApiResponse<void>> applyLeave({
    int? empId,
    DropdownModel? leaveType,
    DateTime? startDate,
    DateTime? endDate,
    String? leaveReason,
    required File? attachmentFile,
  }) async {
    try {
      var response = CommonRepository.postMultipartRequest(
        url: ApiUrl.applyLeave,
        body: {
          "EmployeeId": empId,
          "LeaveTypeId": leaveType?.id,
          "StartDate": AppFormatter.formatDate(
            startDate,
            format: DateFormats.ymdDash,
          ), // 2025-11-24
          "EndDate": AppFormatter.formatDate(
            endDate,
            format: DateFormats.ymdDash,
          ), // 2025-11-24
          // "NoOfDays": AppHelperFunctions.calculateDays(
          //   fromDate: startDate,
          //   toDate: endDate,
          // ),
          "LeaveReason": leaveReason,
        },
        fromJson: (json) => {},
        file: attachmentFile,
        fileKey: "AttachmentPath",
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  // get all leave for employee
  Future<ApiResponse<EmployeeLeaveDataModel>> getEmployeeLeaveData({
    int? empId,
  }) async {
    try {
      var response = CommonRepository.getRequest(
        url: "${ApiUrl.getEmployeeLeaveData}${empId ?? ""}",
        fromJson: (json) => EmployeeLeaveDataModel.fromJson(json!),
        params: {},
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  // <<--------------- manager login leave module approve/reject leave -------------->>>
  Future<ApiResponse<void>> cancelLeave({required int? leaveId}) async {
    try {
      var response = CommonRepository.deleteRequest(
        url: "${ApiUrl.cancelEmployeeLeave}${leaveId ?? ""}",
        fromJson: (json) => {},
        params: {},
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  // <<--------------- manager login leave module get all employees -------------->>>
  Future<ApiResponse<ApproveLeaveListModel>> getApproveLeaveList({
    required int? empId,
    required DateTime? fromDate,
    required DateTime? toDate,
  }) async {
    try {
      var response = CommonRepository.getRequest(
        url:
            "${ApiUrl.getApproveLeaveList}$empId?fromDate=${AppFormatter.formatDate(fromDate, format: DateFormats.ymdDash) ?? ''}&toDate=${AppFormatter.formatDate(toDate, format: DateFormats.ymdDash) ?? ""}",
        fromJson: (json) => ApproveLeaveListModel.fromJson(json!),
        params: {},
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  // <<--------------- manager login leave module approve/reject leave -------------->>>
  Future<ApiResponse<void>> approveLeaveByManager({
    required bool isApprove,
    required List<int> leaveIdList,
    String? remarks,
  }) async {
    try {
      var response = CommonRepository.postRequest(
        url: ApiUrl.approveLeaveByManager,
        request: {
          "leaveIds": leaveIdList,
          "approve": isApprove,
          "remarks": remarks,
        },
        fromJson: (json) => {},
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
