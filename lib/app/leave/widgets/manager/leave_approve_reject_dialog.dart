import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hrms_uis/app/leave/bloc/leave_bloc.dart';
import 'package:hrms_uis/common/utils/popups/custom_toast.dart';

import '../../../../common/utils/constants/sizes.dart';
import '../../../../common/widgets/button/custom_button.dart';

class LeaveApproveRejectDialog extends StatelessWidget {
  final bool isApprove;

  const LeaveApproveRejectDialog({super.key, required this.isApprove});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
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
            listener: (BuildContext context, LeaveState state) {
              if (state.status == LeaveStatus.approveLeaveSuccess) {
                Navigator.pop(context);
                CustomToast.showSuccess(message: state.message);
              }
              if (state.status == LeaveStatus.applyLeaveError) {
                CustomToast.showError(message: state.message);
              }
            },
            builder: (context, state) {
              return CustomButton(
                onTap: () {
                  if (state.status == LeaveStatus.approveLeaveLoading) {
                    return;
                  }
                  final selectedIds = state.selectedLeaveIds;
                  log("selected employees ids ===>> $selectedIds $isApprove");
                  context.read<LeaveBloc>().add(
                    LeaveEvent.approveLeaveByManager(isApprove: isApprove),
                  );
                },
                text: 'Confirm',
                isLoading: state.status == LeaveStatus.approveLeaveLoading,
              );
            },
          ),
        ),
      ],
    );
  }
}
