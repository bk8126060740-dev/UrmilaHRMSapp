import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hrms_uis/app/leave/bloc/leave_bloc.dart';
import 'package:hrms_uis/common/utils/constants/sizes.dart';
import 'package:hrms_uis/common/widgets/button/custom_button.dart';

import '../../../../common/utils/popups/custom_toast.dart';

class CancelLeaveDialog extends StatelessWidget {
  final int? leaveId;

  const CancelLeaveDialog({super.key, this.leaveId});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: CustomButton(
            isBorderButton: true,
            onTap: () => Navigator.pop(context),
            text: 'NO',
          ),
        ),
        const SizedBox(width: AppSizes.space8),
        Expanded(
          child: BlocConsumer<LeaveBloc, LeaveState>(
            listener: (BuildContext context, LeaveState state) {
              if (state.status == LeaveStatus.cancelLeaveError) {
                CustomToast.showError(message: state.message);
              }
              log("cancel leave listener :-> ${state.status}");
              if (state.status == LeaveStatus.cancelLeaveSuccess) {
                CustomToast.showSuccess(message: state.message);
                Navigator.pop(context);
                Navigator.pop(context, true);
              }
            },
            builder: (context, state) {
              log("cancel leave builder :-> ${state.status}");

              return CustomButton(
                onTap: state.status == LeaveStatus.cancelLeaveLoading
                    ? null
                    : () {
                        context.read<LeaveBloc>().add(
                          LeaveEvent.cancelEmpLeave(leaveId: leaveId),
                        );
                      },
                text: 'YES',
                isLoading: state.status == LeaveStatus.cancelLeaveLoading,
              );
            },
          ),
        ),
      ],
    );
  }
}
