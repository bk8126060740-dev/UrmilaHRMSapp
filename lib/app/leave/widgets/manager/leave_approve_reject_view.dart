import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hrms_uis/app/leave/widgets/manager/leave_approve_reject_dialog.dart';

import '../../../../common/utils/constants/colors.dart';
import '../../../../common/utils/constants/decorations.dart';
import '../../../../common/utils/constants/sizes.dart';
import '../../../../common/utils/constants/text_styles.dart';
import '../../../../common/utils/custom_dialogs/dialogs.dart';
import '../../../../common/utils/popups/custom_toast.dart';
import '../../../../common/widgets/button/custom_button.dart';
import '../../bloc/leave_bloc.dart';

class LeaveApproveRejectView extends StatelessWidget {
  const LeaveApproveRejectView({super.key});

  @override
  Widget build(BuildContext context) {
    var bloc = context.read<LeaveBloc>();
    return BlocBuilder<LeaveBloc, LeaveState>(
      builder: (context, state) {
        return state.selectedLeaveIds.isNotEmpty
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
                            text: "${state.selectedLeaveIds.length}",
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
                              var bloc = context.read<LeaveBloc>();
                              if (bloc.remarkController.text.trim().isEmpty) {
                                CustomToast.showError(
                                  message: "Please enter remarks",
                                );
                                return;
                              }
                              CustomDialogs.showCommonAlertDialog(
                                context: context,
                                title: "Reject Leave",
                                message:
                                    "Are you sure you want to reject leave for the selected employees?",
                                child: BlocProvider.value(
                                  value: context.read<LeaveBloc>(),
                                  child: LeaveApproveRejectDialog(
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
                                title: "Approve Leave",
                                message:
                                    "Are you sure you want to approve leave for the selected employees?",
                                child: BlocProvider.value(
                                  value: context.read<LeaveBloc>(),
                                  child: LeaveApproveRejectDialog(
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
