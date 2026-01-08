part of 'leave_bloc.dart';

@freezed
class LeaveState with _$LeaveState {
  const factory LeaveState({
    required LeaveRepo leaveRepo,
    @Default(LeaveStatus.initial) LeaveStatus status,
    @Default('') String message,

    // employee leave
    LeaveTypeBalanceDataModel? leaveTypeDataModel,
    EmployeeLeaveDataModel? employeeLeaveDataModel,
    EmployeeLeaveDataModel? fetchedLeaveDataModel,
    num? selectedLeaveTypeCount,

    // ------------------ UI STATE FOR APPLY LEAVE ------------------
    DropdownModel? selectedLeaveType,
    @Default("Single Day") String duration,

    // Single Day
    DateTime? singleDate,
    @Default("Full Day") String singleDayType,

    // Multi Day
    DateTime? empFromDate,
    @Default("Full Day") String fromDayType,

    DateTime? empToDate,
    @Default("Full Day") String toDayType,

    // Filter Info
    @Default('Daily') String selectedFilter,
    DateTime? fromDate,
    DateTime? toDate,

    File? attachmentFile,

    // 🔹 Employee Selection
    ApproveLeaveListModel? approveLeaveListModel,
    ApproveLeaveListModel? fetchedLeaveListModel,
    @Default(<String>{}) Set<String> selectedLeaveIds,
    @Default(false) bool selectAll,

    @Default(false) getLeaveTypeLoading,
    @Default(false) getEmpLeaveLoading,
    @Default(false) applyLeaveLoading,
    @Default(false) getApproveLeaveLoading,
  }) = _LeaveState;
}

enum LeaveStatus {
  initial,

  getLeaveTypeLoading,
  getLeaveTypeSuccess,
  getLeaveTypeError,

  applyLeaveLoading,
  applyLeaveSuccess,
  applyLeaveError,

  getEmpLeaveLoading,
  getEmpLeaveSuccess,
  getEmpLeaveError,

  getApprovalLeaveLoading,
  getApprovalLeaveError,
  getApprovalLeaveSuccess,

  approveLeaveLoading,
  approveLeaveError,
  approveLeaveSuccess,

  cancelLeaveLoading,
  cancelLeaveError,
  cancelLeaveSuccess,
}
