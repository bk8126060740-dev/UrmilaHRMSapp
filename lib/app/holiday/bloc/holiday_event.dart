part of 'holiday_bloc.dart';

@freezed
class HolidayEvent with _$HolidayEvent {
  const factory HolidayEvent.getHolidayList({int? selectedYear}) =
      _GetHolidayList;
}
