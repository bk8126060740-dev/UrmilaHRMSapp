import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hrms_uis/common/utils/extensions/extension.dart';
import 'package:hrms_uis/common/utils/formatters/date_formats.dart';
import 'package:intl/intl.dart';

import '../../../../common/utils/constants/decorations.dart';
import '../../../../common/utils/constants/sizes.dart';
import '../../../../common/utils/constants/text_styles.dart';
import '../../../../common/widgets/loader/custom_circular_progress.dart';
import '../../bloc/attendance_bloc.dart';

class AttendanceListView extends StatelessWidget {
  const AttendanceListView({super.key});

  Color _parseColor(String? hexColor) {
    if (hexColor == null || hexColor.isEmpty) return Colors.grey;
    final buffer = StringBuffer();
    if (hexColor.length == 6 || hexColor.length == 7) buffer.write('ff');
    buffer.write(hexColor.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AttendanceBloc, AttendanceState>(
      builder: (context, state) {
        final model = state.monthlyAttendanceModel;
        final days = model?.days ?? [];

        if (state.monthlyAttendanceLoading) {
          return const Center(child: CustomCircularProgress());
        }

        if (days.isEmpty) {
          return const Center(
            child: Text('No attendance data available for this period.'),
          );
        }

        return ListView.builder(
          itemCount: days.length,
          itemBuilder: (context, index) {
            final item = days[index];
            final dateStr = item.date ?? '';
            final status = item.status ?? '-';
            final tooltip = item.tooltip ?? '';
            final color = _parseColor(item.color);

            // Try to parse date nicely, fallback to raw string
            DateTime? parsedDate;
            try {
              parsedDate = DateTime.tryParse(dateStr);
            } catch (_) {}
            final displayDate = parsedDate != null
                ? DateFormat('dd MMM yyyy').format(parsedDate)
                : dateStr;

            return Container(
              padding: EdgeInsets.symmetric(
                vertical: AppSizes.padding8,
                horizontal: AppSizes.padding12,
              ),
              decoration: AppDecorations.card().copyWith(
                color: Theme.of(context).cardColor,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Colored dot / status indicator
                  Container(
                    width: 10,
                    height: 10,
                    margin: const EdgeInsets.only(top: 6),
                    decoration: BoxDecoration(
                      color: color,
                      shape: BoxShape.circle,
                    ),
                  ),
                  AppSizes.space12.hGap,
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        /// Date + Status
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              displayDate,
                              style: AppTextStyles.w500_14(context),
                            ),
                            Text(
                              status,
                              style: AppTextStyles.w500_14(
                                context,
                              ).copyWith(color: color),
                            ),
                          ],
                        ),

                        if (tooltip.isNotEmpty) ...[
                          AppSizes.space4.vGap,
                          Text(tooltip, style: AppTextStyles.w400_12(context)),
                        ],
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}

class AttendanceSliverListView extends StatelessWidget {
  const AttendanceSliverListView({super.key});

  Color _parseColor(String? hexColor) {
    if (hexColor == null || hexColor.isEmpty) return Colors.grey;
    final buffer = StringBuffer();
    if (hexColor.length == 6 || hexColor.length == 7) buffer.write('ff');
    buffer.write(hexColor.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AttendanceBloc, AttendanceState>(
      builder: (context, state) {
        final model = state.monthlyAttendanceModel;
        final days = model?.days ?? [];

        if (state.monthlyAttendanceLoading) {
          return const SliverToBoxAdapter(
            child: Center(child: CustomCircularProgress()),
          );
        }

        if (days.isEmpty) {
          return const SliverToBoxAdapter(
            child: Center(
              child: Text('No attendance data available for this period.'),
            ),
          );
        }

        return SliverList.builder(
          itemCount: days.length,
          itemBuilder: (context, index) {
            final item = days[index];
            final dateStr = item.date ?? '';
            final status = item.status ?? '-';
            final tooltip = item.tooltip ?? '';
            final color = _parseColor(item.color);

            DateTime? parsedDate;
            try {
              parsedDate = DateTime.tryParse(dateStr);
            } catch (_) {}

            final displayDate = parsedDate != null
                ? DateFormat(DateFormats.fullMonth).format(parsedDate)
                : dateStr;

            return Container(
              padding: EdgeInsets.symmetric(
                vertical: AppSizes.padding12,
                horizontal: AppSizes.padding12,
              ),
              margin: EdgeInsets.only(
                bottom: AppSizes.space12,
                right: AppSizes.space20,
                left: AppSizes.space20,
              ),
              decoration: AppDecorations.card(
                radius: BorderRadius.circular(AppSizes.borderRadius8),
              ),
              child: Row(
                children: [
                  Container(
                    width: 10,
                    height: 10,
                    decoration: BoxDecoration(
                      color: color,
                      shape: BoxShape.circle,
                    ),
                  ),
                  AppSizes.space12.hGap,
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              displayDate,
                              style: AppTextStyles.w500_14(context),
                            ),
                            Text(
                              status,
                              style: AppTextStyles.w500_14(
                                context,
                              ).copyWith(color: color),
                            ),
                          ],
                        ),
                        if (tooltip.isNotEmpty)
                          Text(tooltip, style: AppTextStyles.w400_12(context)),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
