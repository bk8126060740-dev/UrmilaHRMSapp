part of 'missed_punch_bloc.dart';

@freezed
class MissedPunchState with _$MissedPunchState {
  const factory MissedPunchState({
    required MissedPunchRepo missedPunchRepo,
    @Default(MissedPunchStatus.initial) MissedPunchStatus status,
    @Default('') String message,

    // apply screen------------->>
    DateTime? requestDate,
    DropdownModel? selectedMissedPunchType,

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
  }) = _MissedPunchState;
}

enum MissedPunchStatus {
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

  approvalMissedPunchLoading,
  approvalMissedPunchError,
  approvalMissedPunchSuccess,
}
