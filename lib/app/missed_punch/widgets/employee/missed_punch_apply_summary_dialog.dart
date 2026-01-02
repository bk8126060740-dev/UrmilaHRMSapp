import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hrms_uis/app/missed_punch/bloc/missed_punch_bloc.dart';
import 'package:hrms_uis/common/utils/extensions/extension.dart';

import '../../../../common/utils/constants/sizes.dart';
import '../../../../common/utils/constants/text_styles.dart';
import '../../../../common/utils/formatters/date_formats.dart';
import '../../../../common/utils/formatters/formatter.dart';
import '../../../../common/utils/popups/custom_toast.dart';
import '../../../../common/widgets/button/custom_button.dart';

class MissedPunchApplySummaryDialog extends StatelessWidget {
  const MissedPunchApplySummaryDialog({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<MissedPunchBloc>();
    final state = context.watch<MissedPunchBloc>().state;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        /// LEAVE TYPE
        Text("Missed Punch Type", style: AppTextStyles.w400_14(context)),
        Text(
          state.selectedMissedPunchType?.title ?? "-",
          style: AppTextStyles.w600_16(context),
        ),
        const SizedBox(height: AppSizes.space16),

        /// FROM DATE
        Text("Date", style: AppTextStyles.w400_14(context)),
        Text(
          AppFormatter.formatDate(
                state.requestDate,
                format: DateFormats.fullMonth,
              ) ??
              "",
          style: AppTextStyles.w600_16(context),
        ),

        const SizedBox(height: AppSizes.space16),

        /// TOTAL DAYS
        // Text("Total Days", style: AppTextStyles.w400_14(context)),
        // Text("$totalDays", style: AppTextStyles.w600_18(context)),
        //
        // const SizedBox(height: AppSizes.space16),

        /// REMARK
        Text("Reason", style: AppTextStyles.w400_14(context)),
        Text(
          bloc.reasonController.text.trim().withFallback("N/A"),
          style: AppTextStyles.w500_14(context),
        ),

        const SizedBox(height: AppSizes.space16),

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
              child: BlocConsumer<MissedPunchBloc, MissedPunchState>(
                listener: (context, state) {
                  if (state.status ==
                      MissedPunchStatus.applyMissedPunchSuccess) {
                    Navigator.pop(context);
                    Navigator.pop(context, true);
                    CustomToast.showSuccess(message: state.message);
                  } else if (state.status ==
                      MissedPunchStatus.applyMissedPunchError) {
                    CustomToast.showError(message: state.message);
                  }
                },
                builder: (context, state) {
                  return CustomButton(
                    onTap: () {
                      if (state.status ==
                          MissedPunchStatus.applyMissedPunchLoading) {
                        return;
                      }
                      context.read<MissedPunchBloc>().add(
                        MissedPunchEvent.applyMissedPunch(),
                      );
                    },
                    text: 'Confirm',
                    isLoading:
                        state.status ==
                        MissedPunchStatus.applyMissedPunchLoading,
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
