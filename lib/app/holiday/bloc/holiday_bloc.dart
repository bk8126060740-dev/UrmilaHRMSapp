import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hrms_uis/app/holiday/models/holiday_list_model.dart';

import '../../../common/networking/common_repo.dart';
import '../repo/holiday_repo.dart';

part 'holiday_bloc.freezed.dart';

part 'holiday_event.dart';

part 'holiday_state.dart';

class HolidayBloc extends Bloc<HolidayEvent, HolidayState> {
  HolidayBloc() : super(HolidayState(holidayRepo: HolidayRepo())) {
    on<_GetHolidayList>((event, emit) async {
      emit(
        state.copyWith(
          status: HolidayStatus.holidayLoading,
          selectedYear: event.selectedYear,
        ),
      );

      try {
        ApiResponse<HolidayListModel> response = await state.holidayRepo
            .getHoliday(selectedYear: event.selectedYear);

        if (response.isSuccess && response.data != null) {
          emit(
            state.copyWith(
              status: HolidayStatus.holidaySuccess,
              holidayListModel: response.data,
              message: response.message ?? "",
            ),
          );
        } else {
          emit(
            state.copyWith(
              holidayListModel: null,
              status: HolidayStatus.holidayError,
              message:
                  response.message ??
                  "Api failed with status ${response.statusCode}",
            ),
          );
        }
      } catch (e) {
        emit(
          state.copyWith(
            holidayListModel: null,
            status: HolidayStatus.holidayError,
            message: e.toString(),
          ),
        );
      }
    });

    // on<_GetHolidayList>((event, emit) async {
    //   final List<HolidayModel> holidays = [
    //     HolidayModel(name: "New Year", date: DateTime(2025, 1, 1)),
    //     HolidayModel(name: "Last Day Of Year", date: DateTime(2025, 12, 31)),
    //     HolidayModel(name: "New Year", date: DateTime(2026, 1, 1)),
    //     HolidayModel(name: "Republic Day", date: DateTime(2026, 1, 26)),
    //     HolidayModel(name: "Maha Shivratri", date: DateTime(2026, 2, 15)),
    //     HolidayModel(name: "Holi", date: DateTime(2026, 3, 4)),
    //     HolidayModel(name: "Good Friday", date: DateTime(2026, 4, 3)),
    //     HolidayModel(name: "Ambedkar Jayanti", date: DateTime(2026, 4, 14)),
    //     HolidayModel(name: "Labour Day", date: DateTime(2026, 5, 1)),
    //     HolidayModel(name: "Independence Day", date: DateTime(2026, 8, 15)),
    //     HolidayModel(name: "Ganesh Chaturthi", date: DateTime(2026, 9, 14)),
    //     HolidayModel(name: "Gandhi Jayanti", date: DateTime(2026, 10, 2)),
    //     HolidayModel(name: "Dussehra", date: DateTime(2026, 10, 21)),
    //     HolidayModel(name: "Diwali", date: DateTime(2026, 11, 8)),
    //     HolidayModel(name: "Christmas", date: DateTime(2026, 12, 25)),
    //   ];
    //
    //   emit(state.copyWith(status: HolidayStatus.holidayLoading));
    //
    //   // simulate API delay
    //   await Future.delayed(const Duration(milliseconds: 600));
    //
    //   emit(
    //     state.copyWith(
    //       status: HolidayStatus.holidaySuccess,
    //       holidayList: holidays,
    //     ),
    //   );
    // });
  }
}
