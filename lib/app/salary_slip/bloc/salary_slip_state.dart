part of 'salary_slip_bloc.dart';

@freezed
class SalarySlipState with _$SalarySlipState {
  const factory SalarySlipState({
    @Default(SalarySlipStatus.initial) SalarySlipStatus status,
    required SalarySlipRepo salarySlipRepo,
    @Default('') String message,
    File? file,
    @Default(0) double progress,
    DropdownModel? year,
    DropdownModel? month,
  }) = _SalarySlipState;
}

enum SalarySlipStatus { initial, downloadLoading, downloadFailed, downloadSuccess }
