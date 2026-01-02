import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hrms_uis/app/missed_punch/bloc/missed_punch_bloc.dart';
import 'package:hrms_uis/app/missed_punch/widgets/manager/punch_approve_reject_dialog.dart';

import '../../../../common/utils/constants/colors.dart';
import '../../../../common/utils/constants/decorations.dart';
import '../../../../common/utils/constants/sizes.dart';
import '../../../../common/utils/constants/text_styles.dart';
import '../../../../common/utils/custom_dialogs/dialogs.dart';
import '../../../../common/utils/popups/custom_toast.dart';
import '../../../../common/widgets/button/custom_button.dart';

class PunchApproveRejectView extends StatelessWidget {
  const PunchApproveRejectView({super.key});

  @override
  Widget build(BuildContext context) {
    var bloc = context.read<MissedPunchBloc>();
    return BlocBuilder<MissedPunchBloc, MissedPunchState>(
      builder: (context, state) {
        return state.selectedMissingPunchIds.isNotEmpty
            ? Container(
                padding: const EdgeInsets.all(16),
                decoration: AppDecorations.card(),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextField(
                      controller: bloc.remarkController,
                      maxLines: 2,
                      textInputAction: TextInputAction.done,
                      decoration: InputDecoration(
                        hintText: "Enter remarks...",
                        filled: true,
                        fillColor: Colors.grey.shade100,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                    const SizedBox(height: AppSizes.space8),
                    RichText(
                      text: TextSpan(
                        text: "Total Selected Employees: ",
                        style: AppTextStyles.w400_14(
                          context,
                          color: AppColors.textColor,
                        ),
                        children: [
                          TextSpan(
                            text: "${state.selectedMissingPunchIds.length}",
                            style: AppTextStyles.w400_14(
                              context,
                              color: AppColors.primaryColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: AppSizes.space8),
                    Row(
                      children: [
                        Expanded(
                          child: CustomButton(
                            text: "Reject",
                            backgroundColor: AppColors.error,
                            onTap: () {
                              var bloc = context.read<MissedPunchBloc>();
                              if (bloc.remarkController.text.trim().isEmpty) {
                                CustomToast.showError(
                                  message: "Please enter remarks",
                                );
                                return;
                              }
                              CustomDialogs.showCommonAlertDialog(
                                context: context,
                                title: "Reject Missing-Punch",
                                message:
                                    "Are you sure you want to reject missing punch request for the selected employees?",
                                child: BlocProvider.value(
                                  value: context.read<MissedPunchBloc>(),
                                  child: PunchApproveRejectDialog(
                                    isApprove: false,
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                        const SizedBox(width: AppSizes.space16),
                        Expanded(
                          child: CustomButton(
                            text: "Approve",
                            onTap: () {
                              CustomDialogs.showCommonAlertDialog(
                                context: context,
                                title: "Approve Missing-Punch",
                                message:
                                    "Are you sure you want to approve missing punch request for the selected employees?",
                                child: BlocProvider.value(
                                  value: context.read<MissedPunchBloc>(),
                                  child: PunchApproveRejectDialog(
                                    isApprove: true,
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              )
            : SizedBox.shrink();
      },
    );
  }
}
