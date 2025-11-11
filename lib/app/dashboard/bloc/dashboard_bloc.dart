import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hrms_uis/app/attendance/models/monthly_attendance_model.dart';
import 'package:hrms_uis/app/auth/model/user_response_model.dart';
import 'package:hrms_uis/app/dashboard/repo/dashboard_repo.dart';

import '../../../common/networking/common_repo.dart';
import '../model/user_profile_data_model.dart';

part 'dashboard_bloc.freezed.dart';

part 'dashboard_event.dart';

part 'dashboard_state.dart';

class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  DashboardBloc({required int? userId})
    : super(DashboardState(dashboardRepo: DashboardRepo())) {
    on<_GetUserProfileData>((event, emit) async {
      emit(
        state.copyWith(
          status: DashboardStatus.profileLoading,
          userProfileLoading: true,
        ),
      );
      try {
        ApiResponse<UserProfileDataModel> response = await state.dashboardRepo
            .getUserProfileData(userId: userId);

        if (response.isSuccess && response.data != null) {
          emit(
            state.copyWith(
              status: DashboardStatus.profileSuccess,
              userProfileLoading: false,
              userProfileDataModel: response.data,
              message: response.message ?? "",
            ),
          );
        } else {
          emit(
            state.copyWith(
              userProfileDataModel: null,
              status: DashboardStatus.profileError,
              userProfileLoading: false,
              message:
                  response.message ??
                  "Api failed with status ${response.statusCode}",
            ),
          );
        }
      } catch (e) {
        emit(
          state.copyWith(
            userProfileDataModel: null,
            status: DashboardStatus.profileError,
            userProfileLoading: false,
            message: e.toString(),
          ),
        );
      }
    });

    on<_GetMonthlyAttendance>((event, emit) async {
      emit(
        state.copyWith(
          status: DashboardStatus.monthlyAttendanceLoading,
          monthlyAttendanceLoading: true,
        ),
      );
      try {
        ApiResponse<MonthlyAttendanceModel> response = await state.dashboardRepo
            .getMonthlyAttendance(
              userId: userId,
              month: event.month,
              year: event.year,
            );

        if (response.isSuccess && response.data != null) {
          emit(
            state.copyWith(
              status: DashboardStatus.monthlyAttendanceSuccess,
              monthlyAttendanceLoading: false,
              monthlyAttendanceModel: response.data,
              message: response.message ?? "",
            ),
          );
        } else {
          emit(
            state.copyWith(
              monthlyAttendanceModel: null,
              status: DashboardStatus.monthlyAttendanceError,
              monthlyAttendanceLoading: false,
              message:
                  response.message ??
                  "Api failed with status ${response.statusCode}",
            ),
          );
        }
      } catch (e) {
        emit(
          state.copyWith(
            monthlyAttendanceModel: null,
            status: DashboardStatus.monthlyAttendanceError,
            monthlyAttendanceLoading: false,
            message: e.toString(),
          ),
        );
      }
    });
  }
}
