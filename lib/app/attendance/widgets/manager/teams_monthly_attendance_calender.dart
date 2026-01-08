import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hrms_uis/app/attendance/bloc/attendance_bloc.dart';
import 'package:hrms_uis/app/attendance/models/monthly_attendance_model.dart';
import 'package:hrms_uis/common/utils/constants/decorations.dart';
import 'package:hrms_uis/common/utils/constants/image_strings.dart';
import 'package:hrms_uis/common/utils/constants/sizes.dart';
import 'package:hrms_uis/common/utils/constants/text_styles.dart';
import 'package:hrms_uis/common/utils/extensions/extension.dart';
import 'package:hrms_uis/common/widgets/loader/custom_circular_progress.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../../../common/utils/constants/colors.dart';
import '../../../../common/utils/custom_dialogs/dialogs.dart';
import '../../../../common/utils/helpers/device_utility.dart';
import '../employee/calender_tooltip_dialog.dart';

class TeamsMonthlyAttendanceCalenderView extends StatefulWidget {
  const TeamsMonthlyAttendanceCalenderView({super.key});

  @override
  State<TeamsMonthlyAttendanceCalenderView> createState() =>
      _TeamsMonthlyAttendanceCalenderViewState();
}

class _TeamsMonthlyAttendanceCalenderViewState
    extends State<TeamsMonthlyAttendanceCalenderView> {
  Color _parseColor(String? hexColor) {
    if (hexColor == null || hexColor.isEmpty) return Colors.transparent;
    final buffer = StringBuffer();
    if (hexColor.length == 6 || hexColor.length == 7) buffer.write('ff');
    buffer.write(hexColor.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AttendanceBloc, AttendanceState>(
      builder: (context, state) {
        final isLoading = state.monthlyAttendanceLoading;
        final calendarData = state.monthlyAttendanceModel;

        // 🔁 Convert list to map keyed by date
        final Map<DateTime, List<MonthlyAttendanceData>> events = {};

        if (calendarData?.days != null) {
          for (final report in calendarData!.days!) {
            final dateString = report.date;
            if (dateString == null || dateString.isEmpty) continue;

            final parsed = safeParseDate(dateString);

            if (parsed == null) {
              debugPrint("Invalid date → $dateString");
              continue;
            }

            final safeDate = DateTime.utc(
              parsed.year,
              parsed.month,
              parsed.day,
            );
            events.putIfAbsent(safeDate, () => []).add(report);
          }
        }

        return AbsorbPointer(
          absorbing: false,
          child: isLoading
              ? const Center(child: CustomCircularProgress())
              : Container(
                  decoration: AppDecorations.card(),
                  margin: EdgeInsets.only(
                    bottom: AppSizes.space20,
                    left: AppSizes.space20,
                    right: AppSizes.space20,
                  ),
                  padding: EdgeInsets.symmetric(
                    horizontal: AppSizes.padding12,
                    vertical: AppSizes.padding12,
                  ),
                  child: TableCalendar<MonthlyAttendanceData>(
                    availableGestures: AvailableGestures.horizontalSwipe,
                    firstDay: DateTime.utc(2020, 1, 1),
                    // ✅ FIX HERE
                    lastDay: AppDeviceUtils.lastDayOfMonth(DateTime.now()),
                    // lastDay: AppDeviceUtils.lastDayOfMonth(state.focusedDay),
                    focusedDay: state.focusedDay,
                    selectedDayPredicate: (day) =>
                        isSameDay(state.selectedDay, day),
                    headerStyle: HeaderStyle(
                      titleCentered: true,
                      formatButtonVisible: false,
                      titleTextStyle: AppTextStyles.w500_16(
                        context,
                      ).copyWith(fontSize: 14, fontWeight: FontWeight.w600),
                      leftChevronIcon: SvgPicture.asset(AppImages.prevIcon),
                      rightChevronIcon: SvgPicture.asset(AppImages.nextIcon),
                      leftChevronMargin: EdgeInsets.zero,
                      headerPadding: EdgeInsets.symmetric(
                        vertical: AppSizes.padding12,
                      ),
                      leftChevronPadding: EdgeInsets.zero,
                      rightChevronMargin: EdgeInsets.zero,
                      rightChevronPadding: EdgeInsets.zero,
                    ),

                    /// ⬅️ IMPORTANT:
                    /// Calendar only updates focusedDay in bloc.
                    /// TeamAttendanceScreen will listen and fire API + sync dropdowns.
                    onPageChanged: (focusedDay) {
                      context.read<AttendanceBloc>().add(
                        AttendanceEvent.updateCalendarSelection(
                          focusedDay: focusedDay,
                          resetSelection: true,
                        ),
                      );
                    },

                    onDaySelected: (selectedDay, focusedDay) {
                      context.read<AttendanceBloc>().add(
                        AttendanceEvent.updateCalendarSelection(
                          focusedDay: focusedDay,
                          selectedDay: selectedDay,
                        ),
                      );
                    },
                    calendarStyle: const CalendarStyle(
                      isTodayHighlighted: false,
                      outsideDaysVisible: false,
                    ),
                    calendarBuilders: CalendarBuilders(
                      dowBuilder: (context, day) {
                        final text = [
                          'Sun',
                          'Mon',
                          'Tue',
                          'Wed',
                          'Thu',
                          'Fri',
                          'Sat',
                        ][day.weekday % 7];
                        // final isSunday = day.weekday == DateTime.sunday;
                        return Center(
                          child: Text(
                            text,
                            style: TextStyle(
                              color: /* isSunday ? Colors.red :*/
                                  Colors.black87,
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        );
                      },

                      defaultBuilder: (context, date, _) {
                        return _buildDayCell(
                          context,
                          date,
                          events,
                          state.selectedDay,
                          isSelected: false,
                          isToday: false,
                        );
                      },
                      selectedBuilder: (context, date, _) {
                        return _buildDayCell(
                          context,
                          date,
                          events,
                          state.selectedDay,
                          isSelected: true,
                          isToday: false,
                        );
                      },
                      todayBuilder: (context, date, _) {
                        return _buildDayCell(
                          context,
                          date,
                          events,
                          state.selectedDay,
                          isSelected: false,
                          isToday: true,
                        );
                      },
                    ),
                  ),
                ),
        );
      },
    );
  }

  DateTime? safeParseDate(String input) {
    try {
      final iso = DateTime.tryParse(input);
      if (iso != null) return iso;
    } catch (_) {}

    final formats = [
      "dd-MM-yyyy",
      "dd/MM/yyyy",
      "MM-dd-yyyy",
      "MM/dd/yyyy",
      "yyyy/MM/dd",
      "yyyy.MM.dd",
    ];

    for (final f in formats) {
      try {
        return DateFormat(f).parseStrict(input);
      } catch (_) {}
    }

    return null;
  }

  Widget _buildDayCell(
    BuildContext context,
    DateTime date,
    Map<DateTime, List<MonthlyAttendanceData>> events,
    DateTime? selectedDay, {
    bool isSelected = false,
    bool isToday = false,
  }) {
    final reports = events[DateTime.utc(date.year, date.month, date.day)];
    final report = reports?.isNotEmpty == true ? reports!.first : null;
    final dotColor = report != null ? _parseColor(report.color) : null;
    // final isSunday = date.weekday == DateTime.sunday;

    final today = DateTime.now();
    final isRealToday =
        date.year == today.year &&
        date.month == today.month &&
        date.day == today.day;

    Color? backgroundColor;
    if (isSelected) {
      backgroundColor = Colors.blue.withFixedOpacity(0.15);
    } else if (isRealToday) {
      backgroundColor = AppColors.primaryColor.withFixedOpacity(0.15);
    }

    Color textColor = Colors.black87;
    if (isSelected) {
      textColor = AppColors.primaryColor;
    } else if (isRealToday) {
      textColor = AppColors.primaryColor;
    }
    /*else if (isSunday) {
      textColor = Colors.red;
    }*/

    Border? border;
    if (isSelected) {
      border = Border.all(color: AppColors.primaryColor, width: 2);
    } else if (isRealToday) {
      border = Border.all(color: AppColors.primaryColor, width: 2);
    }

    return InkWell(
      onTap: report == null
          ? null
          : () {
              CustomDialogs.showCommonAlertDialog(
                context: context,
                title: "Attendance Details",
                child: AttendanceToolTipDialog(
                  date: date,
                  report: report,
                  statusColor: _parseColor(report.color),
                ),
              );
            },
      child: Container(
        decoration: BoxDecoration(
          color: backgroundColor,
          shape: BoxShape.circle,
          border: border,
        ),
        margin: const EdgeInsets.all(4),
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '${date.day}',
              style: TextStyle(
                color: textColor,
                fontWeight: FontWeight.w700,
                fontSize: 12,
              ),
            ),
            if (dotColor != null)
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    report?.status ?? "",
                    style: AppTextStyles.w400_12(
                      context,
                    ).copyWith(fontSize: 8, color: dotColor),
                  ),
                  SizedBox(width: 2),
                  Container(
                    margin: const EdgeInsets.only(top: 3),
                    width: 4,
                    height: 4,
                    decoration: BoxDecoration(
                      color: dotColor,
                      shape: BoxShape.circle,
                    ),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
