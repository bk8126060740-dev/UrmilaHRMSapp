part of 'auth_bloc.dart';

@freezed
class AuthState with _$AuthState {
  const factory AuthState({
    @Default(AuthStatus.initial) AuthStatus status,
    required AuthRepo authRepo,
    @Default('') String message,
    LoginResponseModel? loginResponseModel,
    @Default(0) int uniqueKey,
    @Default(true) bool visibility,
    @Default(true) bool confirmVisibility,
    @Default(false) rememberMe,
    @Default(false) loginLoading,
  }) = _AuthState;
}

enum AuthStatus {
  initial,
  loginLoading,
  loginError,
  loginSuccess,
}
