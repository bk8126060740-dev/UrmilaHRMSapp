part of 'app_bloc.dart';

@freezed
class AppState with _$AppState {
  const factory AppState({
    @Default(AppStatus.initial) AppStatus status,
    @Default('') String message,
    LoginResponseModel? loginResponse,
    UserResponseModel? userResponse,
    UserProfileDataModel? userProfileModel,
    @Default(0) int currentTabIndex,
  }) = _AppState;
}

enum AppStatus {
  initial,
  loading,
  error,
  toastError,
  success,
  logoutLoading,
  logoutSuccess,
  logoutError,
}
