part of 'missed_punch_bloc.dart';

@freezed
class MissedPunchEvent with _$MissedPunchEvent {
  // apply missed punch screen on employee login
  const factory MissedPunchEvent.changeRequestDate(DateTime date) =
      _ChangeRequestDate;

  const factory MissedPunchEvent.selectInOutTime({TimeOfDay? inOutTime,required bool inTime}) =
  _SelectInOutTime;

  const factory MissedPunchEvent.changeMissedPunchType(DropdownModel? type) =
      _ChangeMissedPunchType;

  const factory MissedPunchEvent.getMissedPunchType() = _GetMissedPunchType;

  const factory MissedPunchEvent.applyMissedPunch() = _ApplyMissedPunch;

  // get missed punch data on employee login
  const factory MissedPunchEvent.getEmployeesMissedPunchList() = _GetEmployeesMissedPunchList;

  //==================>> Manager Approval ================>>
  const factory MissedPunchEvent.selectFilterType({
    required String selectedFilterType,
  }) = _SelectFilterType;

  const factory MissedPunchEvent.selectDate({
    required DateTime selectedDate,
    required bool isFromDate,
  }) = _SelectDate;

  const factory MissedPunchEvent.toggleAllSelection(bool value) =
      _ToggleAllSelection;

  const factory MissedPunchEvent.toggleSingleSelection({
    required String missingPunchId,
  }) = _ToggleSingleSelection;

  const factory MissedPunchEvent.searchEmployeeFromList(String query) =
      _SearchEmployeeFromList;

  const factory MissedPunchEvent.getApprovalMissedPunchList() = _GetApprovalMissedPunchList;

  const factory MissedPunchEvent.approvePunchByManager({
    required bool isApprove,
  }) = _ApprovePunchByManager;
}
