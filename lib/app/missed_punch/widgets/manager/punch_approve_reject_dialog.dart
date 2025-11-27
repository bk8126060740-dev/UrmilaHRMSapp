import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hrms_uis/app/missed_punch/bloc/missed_punch_bloc.dart';
import 'package:hrms_uis/common/utils/popups/custom_toast.dart';

import '../../../../common/utils/constants/sizes.dart';
import '../../../../common/widgets/button/custom_button.dart';

class PunchApproveRejectDialog extends StatelessWidget {
  final bool isApprove;

  const PunchApproveRejectDialog({super.key, required this.isApprove});

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
          child: BlocConsumer<MissedPunchBloc, MissedPunchState>(
            listener: (BuildContext context, MissedPunchState state) {
              if (state.status ==
                  MissedPunchStatus.approvalMissedPunchSuccess) {
                Navigator.pop(context);
                CustomToast.showSuccess(message: state.message);
              }
              if (state.status == MissedPunchStatus.approvalMissedPunchError) {
                CustomToast.showError(message: state.message);
              }
            },
            builder: (context, state) {
              return CustomButton(
                onTap: () {
                  if (state.status ==
                      MissedPunchStatus.approvalMissedPunchLoading) {
                    return;
                  }
                  final selectedIds = state.selectedMissingPunchIds;
                  log("selected employees ids ===>> $selectedIds $isApprove");
                  context.read<MissedPunchBloc>().add(
                    MissedPunchEvent.approvePunchByManager(
                      isApprove: isApprove,
                    ),
                  );
                },
                text: 'Confirm',
                isLoading:
                    state.status ==
                    MissedPunchStatus.approvalMissedPunchLoading,
              );
            },
          ),
        ),
      ],
    );
  }
}
