part of 'salary_slip_bloc.dart';

@freezed
class SalarySlipEvent with _$SalarySlipEvent {
  const factory SalarySlipEvent.selectYear({DropdownModel? selectedYear}) =
      _SelectYear;

  const factory SalarySlipEvent.selectMonth({DropdownModel? selectedMonth}) =
      _SelectMonth;

  const factory SalarySlipEvent.downloadSalarySlip() = _DownloadSalarySlip;
}
