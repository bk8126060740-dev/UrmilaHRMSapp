part of 'app_bloc.dart';

@freezed
class AppEvent with _$AppEvent {
  const factory AppEvent.updateLoginResponse(LoginResponseModel? model) =
      _UpdateLoginResponse;

  const factory AppEvent.updateUserResponse(UserResponseModel? model) =
      _UpdateUserResponse;

  const factory AppEvent.updateUserProfileData(UserProfileDataModel? model) =
      _UpdateUserProfileData;

  const factory AppEvent.logoutUser() = _LogoutUser;

  const factory AppEvent.updateTabIndex({required int tabIndex}) =
      _UpdateTabIndex;
}
