import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hrms_uis/app/attendance/bloc/attendance_bloc.dart';
import 'package:hrms_uis/common/utils/constants/colors.dart';
import 'package:hrms_uis/common/utils/constants/sizes.dart';
import 'package:hrms_uis/common/utils/constants/text_styles.dart';

import '../../../common/utils/constants/decorations.dart';
import '../../../common/widgets/loader/shimmer_loading.dart';

// status = "HP"; colorHex = "#FD7E14";  //Orange
//
// status = "H"; colorHex = "#007BFF"; // blue
//
// status = "L"; colorHex = "#90EE90"; // light green
//
// status = "A"; colorHex = "#DC3545"; // red
//
// status = "P"; colorHex = "#28A745"; // green
//
// status = "PP"; colorHex = "#FFC107"; // yellow

class MonthlyAttendanceSummary extends StatelessWidget {
  const MonthlyAttendanceSummary({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AttendanceBloc, AttendanceState>(
      builder: (context, state) {
        return Column(
          children: [
            Row(
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
                          label: "Total",
                          count:
                              "${state.monthlyAttendanceModel?.summary?.totalWorkingDays ?? "N/A"}",
                          color: AppColors.totalPresent,
                        ),
                ),
                const SizedBox(width: AppSizes.space8),
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
                              "${state.monthlyAttendanceModel?.summary?.presentDays ?? "N/A"}",
                          color: AppColors.present,
                        ),
                ),
                const SizedBox(width: AppSizes.space8),
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
                              "${state.monthlyAttendanceModel?.summary?.absentDays ?? "N/A"}",
                          color: AppColors.absent,
                        ),
                ),
              ],
            ),
            const SizedBox(height: AppSizes.space16),
            Row(
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
                          label: "Leave Days",
                          count:
                              "${state.monthlyAttendanceModel?.summary?.leaveDays ?? "N/A"}",
                          color: AppColors.leave,
                        ),
                ),
                const SizedBox(width: AppSizes.space8),
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
                          label: "Pending",
                          count:
                              "${state.monthlyAttendanceModel?.summary?.pendingApprovals ?? "N/A"}",
                          color: AppColors.pendingPresent,
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
                          label: "Holidays",
                          count:
                              "${state.monthlyAttendanceModel?.summary?.holidayDays ?? "N/A"}",
                          color: AppColors.holiday,
                        ),
                ),
              ],
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
      decoration: AppDecorations.card(
        radius: const BorderRadius.only(
          bottomLeft: Radius.circular(AppSizes.borderRadius8),
          bottomRight: Radius.circular(AppSizes.borderRadius8),
          topRight: Radius.circular(AppSizes.borderRadius16),
          topLeft: Radius.circular(AppSizes.borderRadius16),
        ),
      ),
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
                bottomLeft: Radius.circular(AppSizes.borderRadius16),
                bottomRight: Radius.circular(AppSizes.borderRadius16),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
