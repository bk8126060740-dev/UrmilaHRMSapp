part of 'leave_bloc.dart';

@freezed
class LeaveEvent with _$LeaveEvent {
  // filter approval attendance list
  const factory LeaveEvent.selectFilterType({
    required String selectedFilterType,
  }) = _SelectFilterType;

  const factory LeaveEvent.selectDate({
    required DateTime selectedDate,
    required bool isFromDate,
  }) = _SelectDate;

  // 🔹 Select All / Individual
  const factory LeaveEvent.toggleAllSelection(bool value) = _ToggleAllSelection;

  const factory LeaveEvent.toggleSingleSelection({required String leaveId}) =
      _ToggleSingleSelection;

  const factory LeaveEvent.searchEmployeeFromList(String query) =
      _SearchEmployeeFromList;

  const factory LeaveEvent.getApproveLeaveList() = _GetApproveLeaveList;

  const factory LeaveEvent.approveLeaveByManager({required bool isApprove}) =
      _ApproveLeaveByManager;

  // ======================>> LEAVE MANAGEMENT <<==============================
  const factory LeaveEvent.getLeaveType() = _GetLeaveType;

  const factory LeaveEvent.applyLeave() = _ApplyLeave;

  const factory LeaveEvent.getEmpLeave() = _GetEmpLeave;

  const factory LeaveEvent.changeLeaveType(DropdownModel? type) =
      _ChangeLeaveType;

  const factory LeaveEvent.changeDuration(String duration) = _ChangeDuration;

  const factory LeaveEvent.changeSingleDate(DateTime date) = _ChangeSingleDate;

  // may be for future --------------->>
  const factory LeaveEvent.changeSingleDayType(String type) =
      _ChangeSingleDayType;

  const factory LeaveEvent.changeFromDayType(String type) = _ChangeFromDayType;

  const factory LeaveEvent.changeToDayType(String type) = _ChangeToDayType;

  const factory LeaveEvent.selectFile({bool? clearFile}) = _SelectFile;
}
