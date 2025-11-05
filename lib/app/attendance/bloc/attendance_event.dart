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
}
