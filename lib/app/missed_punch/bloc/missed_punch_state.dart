part of 'missed_punch_bloc.dart';

@freezed
class MissedPunchState with _$MissedPunchState {
  const factory MissedPunchState({
    required MissedPunchRepo missedPunchRepo,
    @Default(MissedPunchStatus.initial) MissedPunchStatus status,
    @Default('') String message,

    // apply screen------------->>
    DateTime? requestDate,
    TimeOfDay? inTime,
    DateTime? outTime,
    DropdownModel? selectedMissedPunchType,
    MissedPunchTypeListModel? missedPunchTypeListModel,

    // get missed punch list
    EmployeesMissedPunchModel? employeesMissedPunchModel,

    // manager punch approve part============>>
    @Default('Daily') String selectedFilter,
    DateTime? fromDate,
    DateTime? toDate,
    ApprovalMissedPunchModel? approvalMissingPunchModel,
    ApprovalMissedPunchModel? fetchApprovalMissingPunchModel,
    @Default(<String>{}) Set<String> selectedMissingPunchIds,
    @Default(false) bool selectAll,

    // for loaders ================>>
    @Default(false) getMissedPunchLoading,
    @Default(false) applyMissedPunchLoading,
    @Default(false) getApprovalPunchListLoading,
    @Default(false) getEmpMissedPunchListLoading,
  }) = _MissedPunchState;
}

enum MissedPunchStatus {
  getMissedPunchTypeLoading,
  getMissedPunchTypeError,
  getMissedPunchTypeSuccess,

  initial,
  getMissedPunchLoading,
  getMissedPunchSuccess,
  getMissedPunchError,

  applyMissedPunchLoading,
  applyMissedPunchSuccess,
  applyMissedPunchError,

  getApprovalPunchListLoading,
  getApprovalPunchListError,
  getApprovalPunchListSuccess,

  getEmpMissedPunchListLoading,
  getEmpMissedPunchListError,
  getEmpMissedPunchListSuccess,

  approvalMissedPunchLoading,
  approvalMissedPunchError,
  approvalMissedPunchSuccess,
}
