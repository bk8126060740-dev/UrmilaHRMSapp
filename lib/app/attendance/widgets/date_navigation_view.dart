import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import '../../../common/utils/constants/colors.dart';
import '../../../common/utils/constants/image_strings.dart';
import '../../../common/utils/constants/text_styles.dart';
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
            Text(
              formatted,
              style: AppTextStyles.w500_14(
                context,
                color: AppColors.primaryColor,
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
