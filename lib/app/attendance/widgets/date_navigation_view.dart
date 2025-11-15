import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hrms_uis/common/utils/constants/sizes.dart';
import 'package:intl/intl.dart';
import '../../../common/utils/constants/colors.dart';
import '../../../common/utils/constants/image_strings.dart';
import '../../../common/utils/constants/text_styles.dart';
import '../../../common/utils/date_picker/date_picker_utils.dart';
import '../bloc/attendance_bloc.dart';

class DateNavigationView extends StatelessWidget {
  const DateNavigationView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AttendanceBloc, AttendanceState>(
      builder: (context, state) {
        final selectedDate = state.selectedDate ?? DateTime.now();
        final today = state.today ?? DateTime.now();

        final formatted = DateFormat("MMM dd, yyyy").format(selectedDate);
        final isToday =
            selectedDate.year == today.year &&
            selectedDate.month == today.month &&
            selectedDate.day == today.day;

        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // 🔹 PREVIOUS BUTTON
            InkWell(
              onTap: () {
                context.read<AttendanceBloc>().add(
                  const AttendanceEvent.previousDate(),
                );
              },
              child: SvgPicture.asset(AppImages.prevIcon),
            ),

            // 🔹 CENTER DATE TEXT
            Expanded(
              child: InkWell(
                onTap: () async {
                  var attendanceBloc = context.read<AttendanceBloc>();
                  final selectedDate = await DatePickerUtils.pickDate(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2020),
                    lastDate: DateTime.now(),
                  );
                  if (selectedDate != null) {
                    attendanceBloc.add(
                      AttendanceEvent.selectDailyDate(
                        selectedDate: selectedDate,
                      ),
                    );
                  }
                },
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      formatted,
                      style: AppTextStyles.w500_14(
                        context,
                        color: AppColors.primaryColor,
                      ),
                    ),
                    SizedBox(width: AppSizes.space4),
                    Icon(
                      Icons.calendar_month,
                      size: AppSizes.iconSize20,
                      color: AppColors.primaryColor,
                    ),
                  ],
                ),
              ),
            ),

            // 🔹 NEXT BUTTON (only if not today)
            if (!isToday)
              InkWell(
                onTap: () {
                  context.read<AttendanceBloc>().add(
                    const AttendanceEvent.nextDate(),
                  );
                },
                child: SvgPicture.asset(AppImages.nextIcon),
              )
            else
              const SizedBox(width: 24), // placeholder for spacing
          ],
        );
      },
    );
  }
}
