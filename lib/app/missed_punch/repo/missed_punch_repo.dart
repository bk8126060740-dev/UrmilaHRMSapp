import '../../../common/networking/api_url.dart';
import '../../../common/networking/common_repo.dart';
import '../../../common/utils/formatters/date_formats.dart';
import '../../../common/utils/formatters/formatter.dart';
import '../../../common/widgets/dropdown/dropdown_model.dart';
import '../models/approval_missed_punch_data.dart';
import '../models/employees_missed_punch_model.dart';
import '../models/missed_punch_type_list_model.dart';

class MissedPunchRepo {
  // get punch type to create missing punch
  Future<ApiResponse<MissedPunchTypeListModel>> getMissedPunchType() async {
    try {
      var response = CommonRepository.getRequest(
        url: ApiUrl.getMissedPunchType,
        fromJson: (json) => MissedPunchTypeListModel.fromJson(json!),
        params: {},
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  // crete/apply missing punch
  Future<ApiResponse<void>> applyMissedPunch({
    int? empId,
    DropdownModel? missedPunchType,
    DateTime? requestDate,
    String? missedPunchReason,
  }) async {
    try {
      var response = CommonRepository.postMultipartRequest(
        url: ApiUrl.applyMissedPunch,
        body: {
          "Employeeid": empId,
          "SwipeType": missedPunchType?.id,
          "Date": AppFormatter.formatDate(
            requestDate,
            format: DateFormats.ymdDash,
          ), // 2025-11-24
          "EmployeeRemarks": missedPunchReason,
        },
        fromJson: (json) => {},
        file: null,
        fileKey: "AttachmentPath",
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  // get all created missed punch list from employee
  Future<ApiResponse<EmployeesMissedPunchModel>> getEmployeesMissedPunchList({
    required int? empId,
    required DateTime? fromDate,
    required DateTime? toDate,
  }) async {
    try {
      var response = CommonRepository.getRequest(
        url:
        "${ApiUrl.getEmployeesMissedPunchList}$empId?fromDate=${AppFormatter.formatDate(fromDate, format: DateFormats.ymdDash) ?? ''}&toDate=${AppFormatter.formatDate(toDate, format: DateFormats.ymdDash) ?? ""}",
        fromJson: (json) => EmployeesMissedPunchModel.fromJson(json!),
        params: {},
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  // get all approval missing punch from manager login
  Future<ApiResponse<ApprovalMissedPunchModel>> getApproveMissedPunchList({
    required int? empId,
    required DateTime? fromDate,
    required DateTime? toDate,
  }) async {
    try {
      var response = CommonRepository.getRequest(
        url:
            "${ApiUrl.getApproveMissedPunchList}$empId?fromDate=${AppFormatter.formatDate(fromDate, format: DateFormats.ymdDash) ?? ''}&toDate=${AppFormatter.formatDate(toDate, format: DateFormats.ymdDash) ?? ""}",
        fromJson: (json) => ApprovalMissedPunchModel.fromJson(json!),
        params: {},
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  // approve missing punch from manager login
  Future<ApiResponse<void>> approveMissedPunchByManager({
    required bool isApprove,
    required List<int> missedPunchIdsList,
    String? remarks,
  }) async {
    try {
      var response = CommonRepository.postRequest(
        url: ApiUrl.approveMissedPunchByManager,
        request: {
          "swipeIds": missedPunchIdsList,
          "approve": isApprove,
          "managerRemarks": remarks,
        },
        fromJson: (json) => {},
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }
}