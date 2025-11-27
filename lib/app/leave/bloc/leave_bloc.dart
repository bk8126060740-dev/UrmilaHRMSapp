import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hrms_uis/app/leave/model/employee_leave_data_model.dart';
import 'package:hrms_uis/app/leave/model/leave_type_data_model.dart';
import 'package:hrms_uis/app/leave/repo/leave_repo.dart';
import 'package:hrms_uis/common/utils/popups/custom_toast.dart';

import '../../../common/networking/common_repo.dart';
import '../../../common/utils/helpers/file_picker_common.dart';
import '../../../common/widgets/dropdown/dropdown_model.dart';
import '../model/approval_leave_list_model.dart';

part 'leave_bloc.freezed.dart';

part 'leave_event.dart';

part 'leave_state.dart';

class LeaveBloc extends Bloc<LeaveEvent, LeaveState> {
  final TextEditingController remarkController = TextEditingController();

  LeaveBloc({required int? empId}) : super(LeaveState(leaveRepo: LeaveRepo())) {
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
            status: LeaveStatus.initial,
          ),
        );
      } else {
        emit(
          state.copyWith(
            toDate: event.selectedDate,
            status: LeaveStatus.initial,
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
          status: LeaveStatus.initial,
        ),
      );
    });

    on<_ToggleSingleSelection>((event, emit) {
      final updated = {...state.selectedLeaveIds};

      if (updated.contains(event.leaveId)) {
        updated.remove(event.leaveId);
      } else {
        updated.add(event.leaveId);
      }

      final totalEmployees =
          state.approveLeaveListModel?.leaveList?.length ?? 0;

      final allSelected =
          totalEmployees > 0 && updated.length == totalEmployees;

      emit(state.copyWith(selectedLeaveIds: updated, selectAll: allSelected));
    });

    on<_ToggleAllSelection>((event, emit) {
      if (event.value) {
        // Select all employees by ID
        final allIds =
            state.approveLeaveListModel?.leaveList
                ?.map((e) => e.id.toString())
                .toSet() ??
            {}; // <-- fallback to empty set if null

        emit(state.copyWith(selectAll: true, selectedLeaveIds: allIds));
      } else {
        emit(state.copyWith(selectAll: false, selectedLeaveIds: {}));
      }
    });

    on<_SearchEmployeeFromList>((event, emit) {
      final query = event.query.toLowerCase();

      // If empty -> restore full list
      if (query.isEmpty) {
        emit(
          state.copyWith(
            approveLeaveListModel: state.fetchedLeaveListModel?.copyWith(),
            status: LeaveStatus.initial,
          ),
        );
        return;
      }

      final allList = state.approveLeaveListModel?.leaveList ?? [];

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
          approveLeaveListModel: ApproveLeaveListModel(leaveList: filtered),
          status: LeaveStatus.initial,
        ),
      );
    });

    on<_GetApproveLeaveList>((event, emit) async {
      emit(
        state.copyWith(
          status: LeaveStatus.getApprovalLeaveLoading,
          getApproveLeaveLoading: true,
        ),
      );
      try {
        ApiResponse<ApproveLeaveListModel> response = await state.leaveRepo
            .getApproveLeaveList(
              empId: empId,
              fromDate: state.fromDate,
              toDate: state.toDate,
            );

        if (response.isSuccess && response.data != null) {
          emit(
            state.copyWith(
              status: LeaveStatus.getApprovalLeaveSuccess,
              getApproveLeaveLoading: false,
              approveLeaveListModel: response.data,
              fetchedLeaveListModel: response.data,
              message: response.message ?? "",
            ),
          );
        } else {
          emit(
            state.copyWith(
              status: LeaveStatus.getApprovalLeaveError,
              getApproveLeaveLoading: false,
              approveLeaveListModel: null,
              fetchedLeaveListModel: null,
              message:
                  response.message ??
                  "Api failed with status ${response.statusCode}",
            ),
          );
        }
      } catch (e) {
        emit(
          state.copyWith(
            status: LeaveStatus.getApprovalLeaveError,
            getApproveLeaveLoading: false,
            approveLeaveListModel: null,
            fetchedLeaveListModel: null,
            message: e.toString(),
          ),
        );
      }
    });

    on<_ApproveLeaveByManager>((event, emit) async {
      emit(state.copyWith(status: LeaveStatus.approveLeaveLoading));
      try {
        final leaveIdList = state.selectedLeaveIds
            .map((e) => int.parse(e))
            .toList();

        ApiResponse<void> response = await state.leaveRepo
            .approveLeaveByManager(
              leaveIdList: leaveIdList,
              isApprove: event.isApprove,
              remarks: remarkController.text.trim(),
            );

        if (response.isSuccess) {
          remarkController.clear();
          emit(
            state.copyWith(
              status: LeaveStatus.approveLeaveSuccess,
              message: response.message ?? "",
              selectedLeaveIds: {},
              selectAll: false,
            ),
          );
          add(LeaveEvent.getApproveLeaveList());
        } else {
          emit(
            state.copyWith(
              status: LeaveStatus.approveLeaveError,
              message: response.message ?? "Some Error Occurred",
            ),
          );
        }
      } catch (e) {
        emit(
          state.copyWith(
            status: LeaveStatus.approveLeaveError,
            message: e.toString(),
          ),
        );
      }
    });

    //==============>> Employee Modules ==================>>
    on<_GetLeaveType>((event, emit) async {
      emit(
        state.copyWith(
          status: LeaveStatus.getLeaveTypeLoading,
          getLeaveTypeLoading: true,
        ),
      );

      try {
        ApiResponse<LeaveTypeBalanceDataModel> response = await state.leaveRepo
            .getLeaveType(empId: empId);

        if (response.isSuccess && response.data != null) {
          emit(
            state.copyWith(
              status: LeaveStatus.getLeaveTypeSuccess,
              getLeaveTypeLoading: false,
              leaveTypeDataModel: response.data,
              message: response.message ?? "",
            ),
          );
        } else {
          emit(
            state.copyWith(
              leaveTypeDataModel: null,
              status: LeaveStatus.getLeaveTypeError,
              getLeaveTypeLoading: false,
              message:
                  response.message ??
                  "Api failed with status ${response.statusCode}",
            ),
          );
        }
      } catch (e) {
        emit(
          state.copyWith(
            leaveTypeDataModel: null,
            status: LeaveStatus.getLeaveTypeError,
            getLeaveTypeLoading: false,
            message: e.toString(),
          ),
        );
      }
    });

    on<_ApplyLeave>((event, emit) async {
      // ========= VALIDATION ========= //
      var remark = remarkController.text.trim();
      if (state.selectedLeaveType == null) {
        CustomToast.showError(message: "Please select leave type");
        return;
      }

      if (state.duration == "Single Day") {
        if (state.singleDate == null) {
          CustomToast.showError(message: "Please select date");
          return;
        }
      }

      if (state.duration == "Multi-Day") {
        if (state.fromDate == null) {
          CustomToast.showError(message: "Please select From Date");
          return;
        }
        if (state.toDate == null) {
          CustomToast.showError(message: "Please select To Date");
          return;
        }
        if (state.toDate!.isBefore(state.fromDate!)) {
          CustomToast.showError(message: "To Date cannot be before From Date");
          return;
        }
      }

      // if (remark.isEmpty) {
      //   CustomToast.showError(message: "Please enter reason");
      //   return;
      // }

      emit(
        state.copyWith(
          status: LeaveStatus.applyLeaveLoading,
          applyLeaveLoading: true,
        ),
      );

      try {
        ApiResponse<void> response = await state.leaveRepo.applyLeave(
          empId: empId,
          leaveReason: remark,
          leaveType: state.selectedLeaveType,
          startDate: state.duration == "Single Day"
              ? state.singleDate
              : state.fromDate,
          endDate: state.duration == "Single Day"
              ? state.singleDate
              : state.toDate,
          attachmentFile: state.attachmentFile,
        );

        if (response.isSuccess) {
          emit(
            state.copyWith(
              status: LeaveStatus.applyLeaveSuccess,
              applyLeaveLoading: false,
              message: response.message ?? "",
            ),
          );
        } else {
          emit(
            state.copyWith(
              status: LeaveStatus.applyLeaveError,
              applyLeaveLoading: false,
              message:
                  response.message ??
                  "Api failed with status ${response.statusCode}",
            ),
          );
        }
      } catch (e) {
        emit(
          state.copyWith(
            status: LeaveStatus.applyLeaveError,
            applyLeaveLoading: false,
            message: e.toString(),
          ),
        );
      }
    });

    on<_GetEmpLeave>((event, emit) async {
      emit(
        state.copyWith(
          status: LeaveStatus.getEmpLeaveLoading,
          getEmpLeaveLoading: true,
        ),
      );

      try {
        ApiResponse<EmployeeLeaveDataModel> response = await state.leaveRepo
            .getEmployeeLeaveData(empId: empId);

        if (response.isSuccess && response.data != null) {
          emit(
            state.copyWith(
              status: LeaveStatus.getEmpLeaveSuccess,
              getEmpLeaveLoading: false,
              employeeLeaveDataModel: response.data,
              message: response.message ?? "",
            ),
          );
        } else {
          emit(
            state.copyWith(
              status: LeaveStatus.getEmpLeaveError,
              getEmpLeaveLoading: false,
              employeeLeaveDataModel: null,
              message:
                  response.message ??
                  "Api failed with status ${response.statusCode}",
            ),
          );
        }
      } catch (e) {
        emit(
          state.copyWith(
            status: LeaveStatus.getEmpLeaveError,
            getEmpLeaveLoading: false,
            employeeLeaveDataModel: null,
            message: e.toString(),
          ),
        );
      }
    });

    on<_ChangeLeaveType>((event, emit) {
      final selected = event.type;
      // find from list
      final leaveInfo = state.leaveTypeDataModel?.leaveTypeData?.firstWhere(
        (e) => "${e.leaveType?.id}" == selected?.id,
      );
      emit(
        state.copyWith(
          selectedLeaveType: selected,
          selectedLeaveTypeCount: leaveInfo?.remainingBalance,
          status: LeaveStatus.initial,
        ),
      );
    });

    on<_ChangeDuration>((event, emit) {
      emit(
        state.copyWith(
          duration: event.duration,
          fromDate: null,
          toDate: null,
          singleDate: null,
          status: LeaveStatus.initial,
        ),
      );
    });

    on<_ChangeSingleDate>((event, emit) {
      emit(state.copyWith(singleDate: event.date, status: LeaveStatus.initial));
    });

    on<_SelectFile>((event, emit) async {
      if (event.clearFile == true) {
        emit(state.copyWith(attachmentFile: null, status: LeaveStatus.initial));
        return;
      }
      final file = await CustomFilePicker.pickFile(
        allowedExtensions: [
          'jpg', 'jpeg', 'png', // images
          // 'pdf', // pdf
          // 'doc', 'docx',
        ],
      );
      emit(state.copyWith(attachmentFile: file, status: LeaveStatus.initial));
    });

    // will work on later on it------------------>>
    on<_ChangeSingleDayType>((event, emit) {
      emit(
        state.copyWith(singleDayType: event.type, status: LeaveStatus.initial),
      );
    });

    // MULTI DAY
    on<_ChangeFromDayType>((event, emit) {
      emit(
        state.copyWith(fromDayType: event.type, status: LeaveStatus.initial),
      );
    });

    on<_ChangeToDayType>((event, emit) {
      emit(state.copyWith(toDayType: event.type, status: LeaveStatus.initial));
    });
  }
}
