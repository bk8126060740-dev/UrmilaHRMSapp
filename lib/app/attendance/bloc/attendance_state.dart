part of 'attendance_bloc.dart';

@freezed
class AttendanceState with _$AttendanceState {
  const factory AttendanceState({
    required AttendanceRepo attendanceRepo,
    @Default(AttendanceStatus.initial) AttendanceStatus status,
    @Default('') String message,
    double? latitude,
    double? longitude,
    String? address,
    File? photoFile,

    // new fields for date handling
    @Default(null) DateTime? selectedDate,
    @Default(null) DateTime? today,

    // Filter Info
    @Default('Daily') String selectedFilter,
    DateTime? fromDate,
    DateTime? toDate,

    // 🔹 Employee Selection
    @Default([]) List<Map<String, dynamic>> employees,
    @Default([]) List<Map<String, dynamic>> fetchedEmployees,
    @Default(<String>{}) Set<String> selectedEmployeeIds,
    @Default(false) bool selectAll,

    // daily attendance
    DailyAttendanceModel? dailyAttendanceModel,

    // monthly attendance
    MonthlyAttendanceModel? monthlyAttendanceModel,

    @Default(false) monthlyAttendanceLoading,
    @Default(false) dailyAttendanceLoading,
  }) = _AttendanceState;
}

enum AttendanceStatus {
  initial,
  locationLoading,
  cameraLoading,
  compressing,
  success,
  error,
  locationServiceDisabled,
  permissionDenied,
  permissionDeniedForever,
  getAttendanceLoading,
  getAttendanceError,
  getAttendanceSuccess,
  checkInOutLoading,
  checkInOutError,
  checkInOutSuccess,
  monthlyAttendanceLoading,
  monthlyAttendanceError,
  monthlyAttendanceSuccess,
}
