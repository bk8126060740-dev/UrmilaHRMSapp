part of 'dashboard_bloc.dart';

@freezed
class DashboardEvent with _$DashboardEvent {
  const factory DashboardEvent.getUserProfileData() = _GetUserProfileData;

  const factory DashboardEvent.getAppVersion() = _GetAppVersion;

  const factory DashboardEvent.getMonthlyAttendance({
    required int month,
    required int year,
  }) = _GetMonthlyAttendance;
}
