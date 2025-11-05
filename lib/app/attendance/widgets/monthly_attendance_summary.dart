import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hrms_uis/app/attendance/bloc/attendance_bloc.dart';
import 'package:hrms_uis/common/utils/constants/text_styles.dart';

import '../../../common/utils/constants/decorations.dart';
import '../../../common/widgets/loader/shimmer_loading.dart';

class MonthlyAttendanceSummary extends StatelessWidget {
  const MonthlyAttendanceSummary({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AttendanceBloc, AttendanceState>(
      builder: (context, state) {
        return Row(
          children: [
            Expanded(
              child: state.monthlyAttendanceLoading
                  ? ShimmerLoading(
                      child: _buildStatCard(
                        context,
                        label: "",
                        count: "",
                        color: Colors.grey,
                      ),
                    )
                  : _buildStatCard(
                      context,
                      label: "Present",
                      count:
                          "${state.monthlyAttendanceModel?.status?.presentDays ?? ""}",
                      color: Colors.green,
                    ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: state.monthlyAttendanceLoading
                  ? ShimmerLoading(
                      child: _buildStatCard(
                        context,
                        label: "",
                        count: "",
                        color: Colors.grey,
                      ),
                    )
                  : _buildStatCard(
                      context,
                      label: "Absent",
                      count:
                          "${state.monthlyAttendanceModel?.status?.absentDays ?? ""}",
                      color: Colors.red,
                    ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: state.monthlyAttendanceLoading
                  ? ShimmerLoading(
                      child: _buildStatCard(
                        context,
                        label: "",
                        count: "",
                        color: Colors.grey,
                      ),
                    )
                  : _buildStatCard(
                      context,
                      label: "On Leave",
                      count:
                          "${state.monthlyAttendanceModel?.status?.onLeaveDays ?? ""}",
                      color: Colors.yellow,
                    ),
            ),
          ],
        );
      },
    );
  }

  Widget _buildStatCard(
    BuildContext context, {
    required String label,
    required String count,
    required Color color,
  }) {
    return Container(
      decoration: AppDecorations.card(),
      child: Column(
        children: [
          const SizedBox(height: 10),
          Text(count, style: AppTextStyles.w600_24(context)),
          Text(label, style: AppTextStyles.w400_14(context)),
          const SizedBox(height: 8),
          Container(
            height: 6,
            decoration: BoxDecoration(
              color: color,
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
