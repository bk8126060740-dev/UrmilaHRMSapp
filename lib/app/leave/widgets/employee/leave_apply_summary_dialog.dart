import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hrms_uis/app/leave/bloc/leave_bloc.dart';
import 'package:hrms_uis/common/utils/extensions/extension.dart';

import '../../../../common/utils/constants/sizes.dart';
import '../../../../common/utils/constants/text_styles.dart';
import '../../../../common/utils/formatters/date_formats.dart';
import '../../../../common/utils/formatters/formatter.dart';
import '../../../../common/utils/popups/custom_toast.dart';
import '../../../../common/widgets/button/custom_button.dart';
import '../../../../common/widgets/custom/custom_attachment_view.dart';

class LeaveApplySummaryDialog extends StatelessWidget {
  const LeaveApplySummaryDialog({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<LeaveBloc>();
    final state = context.watch<LeaveBloc>().state;

    final bool isSingle = state.duration == "Single Day";

    // /// API VALUES
    final DateTime? startDate = isSingle ? state.singleDate : state.fromDate;

    final DateTime? endDate = isSingle ? state.singleDate : state.toDate;

    // final int totalDays = AppHelperFunctions.calculateDays(
    //   fromDate: startDate,
    //   toDate: endDate,
    // );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        /// LEAVE TYPE
        Text("Leave Type", style: AppTextStyles.w400_14(context)),
        Text(
          state.selectedLeaveType?.title ?? "-",
          style: AppTextStyles.w600_16(context),
        ),
        const SizedBox(height: AppSizes.space16),

        /// FROM DATE
        Text("From Date", style: AppTextStyles.w400_14(context)),
        Text(
          AppFormatter.formatDate(startDate, format: DateFormats.fullMonth) ??
              "",
          style: AppTextStyles.w600_16(context),
        ),

        const SizedBox(height: AppSizes.space16),

        /// TO DATE (Hidden in single-day → but still same)
        Text("To Date", style: AppTextStyles.w400_14(context)),
        Text(
          AppFormatter.formatDate(endDate, format: DateFormats.fullMonth) ?? "",
          style: AppTextStyles.w600_16(context),
        ),

        const SizedBox(height: AppSizes.space16),

        /// TOTAL DAYS
        // Text("Total Days", style: AppTextStyles.w400_14(context)),
        // Text("$totalDays", style: AppTextStyles.w600_18(context)),
        //
        // const SizedBox(height: AppSizes.space16),

        /// REMARK
        Text("Remark", style: AppTextStyles.w400_14(context)),
        Text(
          bloc.remarkController.text.trim().withFallback("N/A"),
          style: AppTextStyles.w500_14(context),
        ),

        const SizedBox(height: AppSizes.space16),

        // ---- Show Selected File Info ----
        if (state.attachmentFile != null) ...[
          Text("Attachment", style: AppTextStyles.w400_14(context)),
          const SizedBox(height: AppSizes.space4),
          CustomSelectedAttachmentView(file: state.attachmentFile!),
        ],

        const SizedBox(height: AppSizes.space20),

        /// ACTION BUTTONS
        Row(
          children: [
            Expanded(
              child: CustomButton(
                isBorderButton: true,
                onTap: () => Navigator.pop(context),
                text: 'Cancel',
              ),
            ),
            const SizedBox(width: AppSizes.space8),
            Expanded(
              child: BlocConsumer<LeaveBloc, LeaveState>(
                listener: (context, state) {
                  if (state.status == LeaveStatus.applyLeaveSuccess) {
                    Navigator.pop(context);
                    Navigator.pop(context, true);
                    CustomToast.showSuccess(message: state.message);
                  } else if (state.status == LeaveStatus.applyLeaveError) {
                    CustomToast.showError(message: state.message);
                  }
                },
                builder: (context, state) {
                  return CustomButton(
                    onTap: () {
                      if (state.status == LeaveStatus.applyLeaveLoading) return;
                      context.read<LeaveBloc>().add(LeaveEvent.applyLeave());
                    },
                    text: 'Confirm',
                    isLoading: state.applyLeaveLoading,
                  );
                },
              ),
            ),
          ],
        ),
      ],
    );
  }
}
