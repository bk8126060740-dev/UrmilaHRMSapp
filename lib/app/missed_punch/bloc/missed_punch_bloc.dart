import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hrms_uis/app/missed_punch/repo/missed_punch_repo.dart';

import '../../../common/widgets/dropdown/dropdown_model.dart';
import '../models/approval_missed_punch_data.dart';

part 'missed_punch_bloc.freezed.dart';

part 'missed_punch_event.dart';

part 'missed_punch_state.dart';

class MissedPunchBloc extends Bloc<MissedPunchEvent, MissedPunchState> {
  final TextEditingController reasonController = TextEditingController();
  final TextEditingController remarkController = TextEditingController();

  MissedPunchBloc({required int? empId})
    : super(MissedPunchState(missedPunchRepo: MissedPunchRepo())) {
    //==============>> Employee Modules ==================>>
    on<_ChangeRequestDate>((event, emit) {
      emit(
        state.copyWith(
          requestDate: event.date,
          status: MissedPunchStatus.initial,
        ),
      );
    });

    on<_ChangeMissedPunchType>((event, emit) {
      emit(
        state.copyWith(
          selectedMissedPunchType: event.type,
          status: MissedPunchStatus.initial,
        ),
      );
    });

    //==============>> Manager Modules ==================>>
    on<_SelectDate>((event, emit) {
      if (event.isFromDate) {
        final fromDate = event.selectedDate;
        final toDate = state.toDate;
        emit(
          state.copyWith(
            fromDate: fromDate,
            toDate: (toDate != null && toDate.isBefore(fromDate))
                ? null
                : toDate,
            status: MissedPunchStatus.initial,
          ),
        );
      } else {
        emit(
          state.copyWith(
            toDate: event.selectedDate,
            status: MissedPunchStatus.initial,
          ),
        );
      }
    });

    on<_SelectFilterType>((event, emit) {
      final now = DateTime.now();
      DateTime? fromDate;
      DateTime? toDate;

      switch (event.selectedFilterType) {
        case "Daily":
          fromDate = DateTime(now.year, now.month, now.day);
          toDate = DateTime(now.year, now.month, now.day);
          break;

        case "Weekly":
          // Assuming Monday = first day of the week
          final weekStart = now.subtract(Duration(days: now.weekday - 1));
          final weekEnd = weekStart.add(const Duration(days: 6));
          fromDate = DateTime(weekStart.year, weekStart.month, weekStart.day);
          toDate = DateTime(weekEnd.year, weekEnd.month, weekEnd.day);
          break;

        case "Monthly":
          final firstDay = DateTime(now.year, now.month, 1);
          final lastDay = DateTime(now.year, now.month + 1, 0);
          fromDate = firstDay;
          toDate = lastDay;
          break;

        case "Custom":
          // In Custom, we don’t pre-set dates — user will choose manually
          fromDate = null;
          toDate = null;
          break;

        default:
          fromDate = null;
          toDate = null;
      }

      emit(
        state.copyWith(
          selectedFilter: event.selectedFilterType,
          fromDate: fromDate,
          toDate: toDate,
          status: MissedPunchStatus.initial,
        ),
      );
    });

    on<_ToggleSingleSelection>((event, emit) {
      final updated = {...state.selectedMissingPunchIds};

      if (updated.contains(event.missingPunchId)) {
        updated.remove(event.missingPunchId);
      } else {
        updated.add(event.missingPunchId);
      }

      final totalEmployees =
          state.approvalMissingPunchModel?.missingPunchList?.length ?? 0;

      final allSelected =
          totalEmployees > 0 && updated.length == totalEmployees;

      emit(
        state.copyWith(
          selectedMissingPunchIds: updated,
          selectAll: allSelected,
        ),
      );
    });

    on<_ToggleAllSelection>((event, emit) {
      if (event.value) {
        // Select all employees by ID
        final allIds =
            state.approvalMissingPunchModel?.missingPunchList
                ?.map((e) => e.id.toString())
                .toSet() ??
            {}; // <-- fallback to empty set if null

        emit(state.copyWith(selectAll: true, selectedMissingPunchIds: allIds));
      } else {
        emit(state.copyWith(selectAll: false, selectedMissingPunchIds: {}));
      }
    });

    on<_SearchEmployeeFromList>((event, emit) {
      final query = event.query.toLowerCase();

      // If empty -> restore full list
      if (query.isEmpty) {
        emit(
          state.copyWith(
            approvalMissingPunchModel: state.fetchApprovalMissingPunchModel
                ?.copyWith(),
            status: MissedPunchStatus.initial,
          ),
        );
        return;
      }

      final allList = state.approvalMissingPunchModel?.missingPunchList ?? [];

      // final filtered = allList.where((item) {
      //   final name = item.employeeName.toString().toLowerCase();
      //   return name.contains(query);
      // }).toList();

      final filtered = allList.where((item) {
        final fields = [
          item.employeeName?.toLowerCase() ?? "",
          item.employeeId?.toString().toLowerCase() ?? "",
        ];

        // Check if ANY field contains the query
        return fields.any((field) => field.contains(query));
      }).toList();

      emit(
        state.copyWith(
          approvalMissingPunchModel: ApprovalMissedPunchModel(
            missingPunchList: filtered,
          ),
          status: MissedPunchStatus.initial,
        ),
      );
    });

    on<_GetApprovalPunchList>((event, emit) async {
      emit(
        state.copyWith(
          status: MissedPunchStatus.getApprovalPunchListLoading,
          getApprovalPunchListLoading: true,
        ),
      );

      final jsonString = '''{
        "missingPunchList": [
    {
      "id": 101,
      "isDeleted": false,
      "createdDate": "2025-01-12T09:30:00",
      "createdBy": 12,
      "updatedDate": null,
      "updatedBy": null,
      "employeeId": 1001,
      "employeeName": "Amit Sharma",
      "employeeCode": "EMP0012",
      "date": "2025-01-12",
      "missingType": "In",
      "reason": "Forgot to punch in while entering office",
      "attachmentPath": null,
      "status": 0,
      "approverName": null,
      "approvedDate": null,
      "remark": null,
      "logs": []
    },
    {
      "id": 102,
      "isDeleted": false,
      "createdDate": "2025-01-13T18:45:00",
      "createdBy": 34,
      "updatedDate": null,
      "updatedBy": null,
      "employeeId": 1002,
      "employeeName": "Sneha Patil",
      "employeeCode": "EMP0034",
      "date": "2025-01-13",
      "missingType": "Out",
      "reason": "Exit biometric device not working",
      "attachmentPath": "https://dummyimage.com/300.png/09f/fff",
      "status": 1,
      "approverName": "HR Team",
      "approvedDate": "2025-01-14T10:10:00",
      "remark": "Verified with CCTV",
      "logs": [
    {
      "action": "Applied",
      "date": "2025-01-13T18:50:00"
    },
    {
      "action": "Approved",
      "date": "2025-01-14T10:10:00"
    }
      ]
    },
    {
      "id": 103,
      "isDeleted": false,
      "createdDate": "2025-01-14T09:15:00",
      "createdBy": 56,
      "updatedDate": null,
      "updatedBy": null,
      "employeeId": 1003,
      "employeeName": "Rohit Mehta",
      "employeeCode": "EMP0056",
      "date": "2025-01-14",
      "missingType": "In",
      "reason": "Card not detected at gate",
      "attachmentPath": null,
      "status": -1,
      "approverName": "Admin",
      "approvedDate": "2025-01-14T11:30:00",
      "remark": "No supporting proof",
      "logs": [
    {
      "action": "Applied",
      "date": "2025-01-14T09:20:00"
    },
    {
      "action": "Rejected",
      "date": "2025-01-14T11:30:00"
    }
      ]
    }
      ]
    }''';

      final ApprovalMissedPunchModel approvalMissedPunchModel =
          missingPunchListModelFromJson(jsonString);

      await Future.delayed(const Duration(seconds: 1));

      emit(
        state.copyWith(
          status: MissedPunchStatus.getApprovalPunchListSuccess,
          getApprovalPunchListLoading: false,
          approvalMissingPunchModel: approvalMissedPunchModel,
          fetchApprovalMissingPunchModel: approvalMissedPunchModel,
        ),
      );
      // try {
      //   ApiResponse<ApproveLeaveListModel> response = await state.leaveRepo
      //       .getApproveLeaveList(
      //         empId: empId,
      //         fromDate: state.fromDate,
      //         toDate: state.toDate,
      //       );
      //
      //   if (response.isSuccess && response.data != null) {
      //     emit(
      //       state.copyWith(
      //         status: LeaveStatus.getApprovalLeaveSuccess,
      //         getApproveLeaveLoading: false,
      //         approveLeaveListModel: response.data,
      //         fetchedLeaveListModel: response.data,
      //         message: response.message ?? "",
      //       ),
      //     );
      //   } else {
      //     emit(
      //       state.copyWith(
      //         status: LeaveStatus.getApprovalLeaveError,
      //         getApproveLeaveLoading: false,
      //         approveLeaveListModel: null,
      //         fetchedLeaveListModel: null,
      //         message:
      //             response.message ??
      //             "Api failed with status ${response.statusCode}",
      //       ),
      //     );
      //   }
      // } catch (e) {
      //   emit(
      //     state.copyWith(
      //       status: LeaveStatus.getApprovalLeaveError,
      //       getApproveLeaveLoading: false,
      //       approveLeaveListModel: null,
      //       fetchedLeaveListModel: null,
      //       message: e.toString(),
      //     ),
      //   );
      // }
    });

    on<_ApprovePunchByManager>((event, emit) async {
      emit(
        state.copyWith(status: MissedPunchStatus.approvalMissedPunchLoading),
      );
      //   try {
      //     final leaveIdList = state.selectedLeaveIds
      //         .map((e) => int.parse(e))
      //         .toList();
      //
      //     ApiResponse<void> response = await state.leaveRepo
      //         .approveLeaveByManager(
      //           leaveIdList: leaveIdList,
      //           isApprove: event.isApprove,
      //           remarks: remarkController.text.trim(),
      //         );
      //
      //     if (response.isSuccess) {
      //       remarkController.clear();
      //       emit(
      //         state.copyWith(
      //           status: LeaveStatus.approveLeaveSuccess,
      //           message: response.message ?? "",
      //           selectedLeaveIds: {},
      //           selectAll: false,
      //         ),
      //       );
      //       add(LeaveEvent.getApproveLeaveList());
      //     } else {
      //       emit(
      //         state.copyWith(
      //           status: LeaveStatus.approveLeaveError,
      //           message: response.message ?? "Some Error Occurred",
      //         ),
      //       );
      //     }
      //   } catch (e) {
      //     emit(
      //       state.copyWith(
      //         status: LeaveStatus.approveLeaveError,
      //         message: e.toString(),
      //       ),
      //     );
      //   }
    });
  }
}
