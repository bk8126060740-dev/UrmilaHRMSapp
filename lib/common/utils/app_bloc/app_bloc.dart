import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hrms_uis/app/dashboard/model/user_profile_data_model.dart';
import 'package:hrms_uis/app/auth/model/user_response_model.dart';

import '../../../app/auth/model/login_response_model.dart';
import '../hive/hive_service.dart';

part 'app_bloc.freezed.dart';

part 'app_event.dart';

part 'app_state.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  AppBloc() : super(AppState()) {
    on<_UpdateLoginResponse>((event, emit) {
      emit(state.copyWith(loginResponse: event.model));
    });

    on<_UpdateUserResponse>((event, emit) {
      emit(state.copyWith(userResponse: event.model));
    });

    on<_UpdateUserProfileData>((event, emit) {
      emit(state.copyWith(userProfileModel: event.model));
    });

    on<_UpdateTabIndex>((event, emit) {
      emit(
        state.copyWith(
          currentTabIndex: event.tabIndex,
          status: AppStatus.initial,
        ),
      );
    });

    on<_LogoutUser>((event, emit) async {
      emit(state.copyWith(status: AppStatus.logoutLoading));
      await HiveService.clear();
      emit(
        state.copyWith(
          status: AppStatus.logoutSuccess,
          loginResponse: null,
          userProfileModel: null,
          userResponse: null,
        ),
      );
      emit(state.copyWith(status: AppStatus.initial));
    });
  }
}
