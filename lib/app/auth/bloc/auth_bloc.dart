import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hrms_uis/app/dashboard/model/user_response_model.dart';

import '../../../common/networking/common_repo.dart';
import '../../../common/utils/constants/constants.dart';
import '../../../common/utils/hive/hive_service.dart';
import '../model/login_response_model.dart';
import '../repo/auth_repo.dart';

part 'auth_bloc.freezed.dart';

part 'auth_event.dart';

part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  AuthBloc() : super(AuthState(authRepo: AuthRepo())) {
    on<_TogglePasswordVisibility>((event, emit) {
      if (event.isConfirmPassword) {
        emit(
          state.copyWith(
            confirmVisibility: !state.confirmVisibility,
            status: AuthStatus.initial,
          ),
        );
      } else {
        emit(
          state.copyWith(
            visibility: !state.visibility,
            status: AuthStatus.initial,
          ),
        );
      }
    });

    on<_FetchRememberMe>((event, emit) async {
      String? userId = await HiveService.readBox2(kLoginUserId);
      String? password = await HiveService.readBox2(kLoginUserPassword);
      bool? rememberMe = await HiveService.readBox2(kRememberMe);
      usernameController.text = userId ?? "";
      passwordController.text = password ?? "";
      emit(
        state.copyWith(
          rememberMe: rememberMe ?? false,
          status: AuthStatus.initial,
        ),
      );
    });

    on<_RememberMe>((event, emit) {
      emit(
        state.copyWith(
          rememberMe: event.isRemember,
          status: AuthStatus.initial,
        ),
      );
    });

    on<_Login>((event, emit) async {
      String password = passwordController.text.trim();
      String username = usernameController.text.trim();
      log(
        "userFields==============>> userName :- $username , password :-  $password",
      );
      emit(state.copyWith(status: AuthStatus.loginLoading,loginLoading: true));
      try {
        ApiResponse<LoginResponseModel> response = await state.authRepo.login(
          password: password,
          userName: username,
        );

        if (response.isSuccess && response.data != null) {
          if (state.rememberMe) {
            await HiveService.writeBox2(kLoginUserId, username);
            await HiveService.writeBox2(kLoginUserPassword, password);
            await HiveService.writeBox2(kRememberMe, state.rememberMe);
          } else {
            await HiveService.writeBox2(kLoginUserId, "");
            await HiveService.writeBox2(kLoginUserPassword, "");
            await HiveService.writeBox2(kRememberMe, false);
          }
          await HiveService.write(kLoginResponseKey, response.data ?? "");
          emit(
            state.copyWith(
              status: AuthStatus.loginSuccess,
              // loginLoading: false,
              loginResponseModel: response.data,
              message: response.message ?? "",
            ),
          );
        } else {
          emit(
            state.copyWith(
              loginResponseModel: null,
              status: AuthStatus.loginError,
              loginLoading: false,
              message:
                  response.message ??
                  "Login failed with status ${response.statusCode}",
            ),
          );
        }
      } catch (e) {
        emit(
          state.copyWith(
            loginResponseModel: null,
            status: AuthStatus.loginError,
            loginLoading: false,
            message: e.toString(),
          ),
        );
      }
    });
  }
}
