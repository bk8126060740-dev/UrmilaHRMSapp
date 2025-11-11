part of 'attendance_bloc.dart';

@freezed
class AttendanceEvent with _$AttendanceEvent {
  //<<---------------- fetch location ------------------------>>
  const factory AttendanceEvent.requestLocation() = _RequestLocation;

  //<<---------------- click picture ------------------------>>
  const factory AttendanceEvent.capturePhoto() = _CapturePhoto;

  //<<---------------- for date handle ------------------------>>
  const factory AttendanceEvent.initDate() = _InitDate;

  const factory AttendanceEvent.previousDate() = _PreviousDate;

  const factory AttendanceEvent.nextDate() = _NextDate;

  //<<---------------- fetch attendance api call ------------------------>>
  const factory AttendanceEvent.getDailyAttendance({required DateTime date}) =
      _GetDailyAttendance;

  const factory AttendanceEvent.checkIn() = _CheckIn;

  const factory AttendanceEvent.checkOut() = _CheckOut;

  const factory AttendanceEvent.getMonthlyAttendance({
    @Default(false) bool fromButton,
    required int month,
    required int year,
    required DateTime dateTime,
  }) = _GetMonthlyAttendance;

  // filter approval attendance list
  const factory AttendanceEvent.selectDate({
    required DateTime selectedDate,
    required bool isFromDate,
  }) = _SelectDate;

  const factory AttendanceEvent.selectFilterType({
    required String selectedFilterType,
  }) = _SelectFilterType;

  // 🔹 Select All / Individual
  const factory AttendanceEvent.toggleAllSelection(bool value) =
      _ToggleAllSelection;

  const factory AttendanceEvent.toggleSingleSelection({
    required String employeeId,
  }) = _ToggleSingleSelection;

  const factory AttendanceEvent.searchEmployeeFromList(String query) =
      _SearchEmployeeFromList;
}
