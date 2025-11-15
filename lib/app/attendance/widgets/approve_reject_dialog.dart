import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hrms_uis/app/attendance/bloc/attendance_bloc.dart';
import 'package:hrms_uis/common/utils/popups/custom_toast.dart';

import '../../../common/utils/constants/sizes.dart';
import '../../../common/widgets/button/custom_button.dart';

class ApproveRejectDialog extends StatelessWidget {
  final bool isApprove;

  const ApproveRejectDialog({super.key, required this.isApprove});

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
          child: BlocConsumer<AttendanceBloc, AttendanceState>(
            listener: (BuildContext context, AttendanceState state) {
              if (state.status == AttendanceStatus.approveAttendanceSuccess) {
                Navigator.pop(context);
                CustomToast.showSuccess(message: state.message);
              }
              if (state.status == AttendanceStatus.approveAttendanceError) {
                CustomToast.showError(message: state.message);
              }
            },
            builder: (context, state) {
              return CustomButton(
                onTap: () {
                  if (state.status ==
                      AttendanceStatus.approveAttendanceLoading) {
                    return;
                  }
                  final selectedIds = state.selectedEmployeeIds;
                  log("selected employees ids ===>> $selectedIds $isApprove");
                  context.read<AttendanceBloc>().add(
                    AttendanceEvent.approveAttendanceByManager(
                      isApprove: isApprove,
                    ),
                  );
                },
                text: 'Confirm',
                isLoading:
                    state.status == AttendanceStatus.approveAttendanceLoading,
              );
            },
          ),
        ),
      ],
    );
  }
}
