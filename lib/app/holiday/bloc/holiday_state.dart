part of 'holiday_bloc.dart';

@freezed
class HolidayState with _$HolidayState {
  const factory HolidayState({
    @Default(HolidayStatus.initial) HolidayStatus status,
    required HolidayRepo holidayRepo,
    @Default('') String message,
    HolidayListModel? holidayListModel,
    int? selectedYear,
  }) = _HolidayState;
}

enum HolidayStatus { initial, holidayLoading, holidayError, holidaySuccess }
