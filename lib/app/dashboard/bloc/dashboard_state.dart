part of 'dashboard_bloc.dart';

@freezed
class DashboardState with _$DashboardState {
  const factory DashboardState({
    @Default(DashboardStatus.initial) DashboardStatus status,
    required DashboardRepo dashboardRepo,
    @Default('') String message,
    UserResponseModel? userResponseModel,
    UserProfileDataModel? userProfileDataModel,
    MonthlyAttendanceModel? monthlyAttendanceModel,
    @Default(false) userProfileLoading,
    @Default(false) userResponseLoading,
    @Default(false) monthlyAttendanceLoading,
  }) = _DashboardState;
}

enum DashboardStatus {
  initial,
  userLoading,
  userError,
  userSuccess,
  profileLoading,
  profileError,
  profileSuccess,
  monthlyAttendanceLoading,
  monthlyAttendanceError,
  monthlyAttendanceSuccess,
}
