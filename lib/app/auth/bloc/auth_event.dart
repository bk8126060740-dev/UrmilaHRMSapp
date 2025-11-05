part of 'auth_bloc.dart';

@freezed
class AuthEvent with _$AuthEvent {
  const factory AuthEvent.fetchRememberMe() = _FetchRememberMe;

  const factory AuthEvent.togglePasswordVisibility({
    @Default(false) bool isConfirmPassword,
  }) = _TogglePasswordVisibility;

  const factory AuthEvent.rememberMe({@Default(false) bool isRemember}) =
      _RememberMe;

  const factory AuthEvent.login() = _Login;
}
