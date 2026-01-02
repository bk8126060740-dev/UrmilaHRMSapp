import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hrms_uis/common/utils/constants/colors.dart';
import 'package:table_calendar/table_calendar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Calendar Report Demo',
      theme: ThemeData(primarySwatch: Colors.indigo),
      home: const AttendanceCalendar(),
    );
  }
}

/// ------------------------
/// MODEL CLASS
/// ------------------------
class CalendarReport {
  final DateTime date;
  final int statusId;
  final String colorCode;
  final String name;
  final bool isHoliday;

  CalendarReport({
    required this.date,
    required this.statusId,
    required this.colorCode,
    required this.name,
    required this.isHoliday,
  });

  factory CalendarReport.fromJson(Map<String, dynamic> json) {
    return CalendarReport(
      date: DateTime.parse(json['date']),
      statusId: json['statusId'],
      colorCode: json['colorCode'],
      name: json['name'],
      isHoliday: json['isHoliday'],
    );
  }
}

/// ------------------------
/// SAMPLE DATA (Your API Response)
/// ------------------------
const String sampleApiResponse = '''
{
  "calendarReport": [
    {"date": "2025-10-01T00:00:00Z", "statusId": 170, "colorCode": "#ff0000", "name": "Absent", "isHoliday": false},
    {"date": "2025-10-02T00:00:00Z", "statusId": 170, "colorCode": "#ff0000", "name": "Absent", "isHoliday": false},
    {"date": "2025-10-03T00:00:00Z", "statusId": 170, "colorCode": "#ff0000", "name": "Absent", "isHoliday": false},
    {"date": "2025-10-30T00:00:00Z", "statusId": 169, "colorCode": "#3cb371", "name": "Present", "isHoliday": false},
    {"date": "2025-10-31T00:00:00Z", "statusId": 169, "colorCode": "#3cb371", "name": "Present", "isHoliday": false}
  ]
}
''';

List<CalendarReport> parseCalendarReport(String jsonString) {
  final data = jsonDecode(jsonString);
  final list = data['calendarReport'] as List;
  return list.map((e) => CalendarReport.fromJson(e)).toList();
}

/// ------------------------
/// MAIN SCREEN
/// ------------------------
class AttendanceCalendar extends StatefulWidget {
  const AttendanceCalendar({super.key});

  @override
  State<AttendanceCalendar> createState() => _AttendanceCalendarState();
}

class _AttendanceCalendarState extends State<AttendanceCalendar> {
  late Map<DateTime, List<CalendarReport>> _events;
  late List<CalendarReport> _calendarData;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  CalendarReport? _selectedReport;

  @override
  void initState() {
    super.initState();
    _calendarData = parseCalendarReport(sampleApiResponse);
    _events = _mapEventsByDate(_calendarData);
  }

  Map<DateTime, List<CalendarReport>> _mapEventsByDate(
    List<CalendarReport> data,
  ) {
    final map = <DateTime, List<CalendarReport>>{};
    for (var report in data) {
      final date = DateTime.utc(
        report.date.year,
        report.date.month,
        report.date.day,
      );
      map[date] = [report];
    }
    return map;
  }

  Color _parseColor(String colorString) {
    try {
      return Color(int.parse(colorString.substring(1), radix: 16) + 0xFF000000);
    } catch (_) {
      return Colors.grey;
    }
  }

  @override
  Widget build(BuildContext context) {
    final imageUrl = Uri.encodeFull(
      'https://usiciprodsa.blob.core.windows.net/nirghosh-ems-docs-prod/contents/employee/1/profile/638796272869080758_Outlook-ot4k1hap.png',
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text("Attendance Calendar"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            TableCalendar(
              firstDay: DateTime.utc(2010, 10, 16),
              lastDay: DateTime.utc(2030, 3, 14),
              focusedDay: DateTime.now(),
            ),
            // CachedNetworkImage(
            //   imageUrl: imageUrl,
            //   httpHeaders: const {'Accept': 'image/*'},
            //   placeholder: (_, _) =>
            //       const Center(child: CircularProgressIndicator()),
            //   errorWidget: (_, _, _) => const Icon(Icons.person, size: 40),
            // ),
            // Image.network(
            //   "https://usiciprodsa.blob.core.windows.net/nirghosh-ems-docs-prod/contents/employee/1/profile/638796272869080758_Outlook-ot4k1hap.png",
            // ),
            // CachedNetworkImage(
            //   imageUrl:
            //       "https://usiciprodsa.blob.core.windows.net/nirghosh-ems-docs-prod/contents/employee/1/profile/638796272869080758_Outlook-ot4k1hap.png",
            //   width: 100,
            //   height: 100,
            //   fit: BoxFit.fill,
            //   placeholder: (_, _) => CustomCircularProgress(),
            //   /*useShimmer ? _buildShimmer() : _buildLoader()*/
            //   errorWidget: (_, _, _) => SvgPicture.asset(AppImages.profileImage),
            // ),

            /// Calendar View
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TableCalendar<CalendarReport>(
                firstDay: DateTime.utc(2020, 1, 1),
                lastDay: DateTime.now(),
                focusedDay: _focusedDay,
                selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
                headerStyle: const HeaderStyle(
                  titleCentered: true,
                  formatButtonVisible: false,
                ),
                onPageChanged: (focusedDay) {},
                onDaySelected: (selectedDay, focusedDay) {
                  setState(() {
                    _selectedDay = selectedDay;
                    _focusedDay = focusedDay;
                    final events =
                        _events[DateTime.utc(
                          selectedDay.year,
                          selectedDay.month,
                          selectedDay.day,
                        )];
                    _selectedReport = events?.isNotEmpty == true
                        ? events!.first
                        : null;
                  });
                },

                calendarStyle: const CalendarStyle(
                  // ❌ Remove background highlight for today & selected day
                  todayDecoration: BoxDecoration(
                    color: Color(0xFF9FA8DA),
                    shape: BoxShape.circle,
                  ),
                  selectedDecoration: BoxDecoration(),
                  // todayTextStyle: TextStyle(
                  //   color: AppColors.primaryColor,
                  //   // fontSize: 16
                  // ),
                  selectedTextStyle: TextStyle(color: AppColors.primaryColor),
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
                    final isSunday = day.weekday == DateTime.sunday;
                    return Center(
                      child: Text(
                        text,
                        style: TextStyle(
                          color: isSunday ? Colors.red : Colors.black87,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    );
                  },

                  /// 🟢 Custom date cell
                  defaultBuilder: (context, date, _) {
                    final reports =
                        _events[DateTime.utc(date.year, date.month, date.day)];
                    final report = reports != null && reports.isNotEmpty
                        ? reports.first
                        : null;
                    final dotColor = report != null
                        ? _parseColor(report.colorCode)
                        : null;

                    final isSunday = date.weekday == DateTime.sunday;
                    final isSelected = isSameDay(_selectedDay, date);
                    final isToday = isSameDay(DateTime.now(), date);

                    // 🟩 Use background color as text color instead
                    Color textColor = Colors.black87;
                    if (isSelected) {
                      textColor = Colors.blue; // selected → blue text
                    } else if (isToday) {
                      textColor = Colors.deepOrange; // today → orange text
                    } else if (isSunday) {
                      textColor = Colors.red; // sunday → red
                    }

                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '${date.day}',
                          style: TextStyle(
                            color: textColor,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        if (dotColor != null)
                          Container(
                            margin: const EdgeInsets.only(top: 3),
                            width: 6,
                            height: 6,
                            decoration: BoxDecoration(
                              color: dotColor,
                              shape: BoxShape.circle,
                            ),
                          ),
                      ],
                    );
                  },
                ),
              ),
            ),

            /*Padding(
              padding: const EdgeInsets.all(8.0),
              child: TableCalendar<CalendarReport>(
                firstDay: DateTime.utc(2020, 1, 1),
                lastDay: DateTime.now(),
                focusedDay: _focusedDay,
                selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
                headerStyle: const HeaderStyle(
                  titleCentered: true,
                  formatButtonVisible: false, // disable week/month toggle
                ),
                onPageChanged: (focusedDay) {
                  // _focusedDay = focusedDay;
                },
                onDaySelected: (selectedDay, focusedDay) {
                  setState(() {
                    _selectedDay = selectedDay;
                    _focusedDay = focusedDay;
                    final events =
                        _events[DateTime.utc(
                          selectedDay.year,
                          selectedDay.month,
                          selectedDay.day,
                        )];
                    _selectedReport = events?.isNotEmpty == true
                        ? events!.first
                        : null;
                  });
                },
                calendarBuilders: CalendarBuilders(
                  /// Header row (Sun, Mon, etc.)
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
                    final isSunday = day.weekday == DateTime.sunday;
                    return Center(
                      child: Text(
                        text,
                        style: TextStyle(
                          color: isSunday ? Colors.red : Colors.black87,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    );
                  },

                  /// Custom Day cell builder
                  defaultBuilder: (context, date, _) {
                    final reports =
                        _events[DateTime.utc(date.year, date.month, date.day)];
                    final report = reports != null && reports.isNotEmpty
                        ? reports.first
                        : null;
                    final dotColor = report != null
                        ? _parseColor(report.colorCode)
                        : null;
                    final isSunday = date.weekday == DateTime.sunday;

                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '${date.day}',
                          style: TextStyle(
                            color: isSunday ? Colors.red : Colors.black87,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        if (dotColor != null)
                          Container(
                            margin: const EdgeInsets.only(top: 3),
                            width: 6,
                            height: 6,
                            decoration: BoxDecoration(
                              color: dotColor,
                              shape: BoxShape.circle,
                            ),
                          ),
                      ],
                    );
                  },
                ),
              ),
            ),*/

            /// Selected day details
            if (_selectedReport != null)
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Card(
                  elevation: 2,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      children: [
                        Container(
                          width: 16,
                          height: 16,
                          decoration: BoxDecoration(
                            color: _parseColor(_selectedReport!.colorCode),
                            shape: BoxShape.circle,
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Text(
                            '${_selectedReport!.name} (${_selectedReport!.date.toLocal().toString().split(" ")[0]})',
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
