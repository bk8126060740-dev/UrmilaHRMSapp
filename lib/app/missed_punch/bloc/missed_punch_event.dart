part of 'missed_punch_bloc.dart';

@freezed
class MissedPunchEvent with _$MissedPunchEvent {
  const factory MissedPunchEvent.changeRequestDate(DateTime date) =
      _ChangeRequestDate;

  const factory MissedPunchEvent.changeMissedPunchType(DropdownModel? type) =
      _ChangeMissedPunchType;

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

  const factory MissedPunchEvent.getApprovalPunchList() = _GetApprovalPunchList;

  const factory MissedPunchEvent.approvePunchByManager({
    required bool isApprove,
  }) = _ApprovePunchByManager;
}
