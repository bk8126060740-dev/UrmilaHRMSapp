import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hrms_uis/app/missed_punch/models/employees_missed_punch_model.dart';
import 'package:hrms_uis/app/missed_punch/models/missed_punch_type_list_model.dart';
import 'package:hrms_uis/app/missed_punch/repo/missed_punch_repo.dart';

import '../../../common/networking/common_repo.dart';
import '../../../common/utils/popups/custom_toast.dart';
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

    on<_SelectInOutTime>((event, emit) {
      if (event.inTime) {
        emit(
          state.copyWith(inTime: event.inOutTime, status: MissedPunchStatus.initial),
        );
      } else {
        emit(
          state.copyWith(inTime: event.inOutTime, status: MissedPunchStatus.initial),
        );
      }
    });

    on<_ChangeMissedPunchType>((event, emit) {
      emit(
        state.copyWith(
          selectedMissedPunchType: event.type,
          status: MissedPunchStatus.initial,
        ),
      );
    });

    // missed punch type
    on<_GetMissedPunchType>((event, emit) async {
      emit(state.copyWith(status: MissedPunchStatus.getMissedPunchTypeLoading));
      try {
        ApiResponse<MissedPunchTypeListModel> response = await state
            .missedPunchRepo
            .getMissedPunchType();

        if (response.isSuccess && response.data != null) {
          emit(
            state.copyWith(
              status: MissedPunchStatus.getMissedPunchTypeSuccess,
              missedPunchTypeListModel: response.data,
              message: response.message ?? "",
            ),
          );
        } else {
          emit(
            state.copyWith(
              missedPunchTypeListModel: null,
              status: MissedPunchStatus.getMissedPunchTypeError,
              message:
                  response.message ??
                  "Api failed with status ${response.statusCode}",
            ),
          );
        }
      } catch (e) {
        emit(
          state.copyWith(
            missedPunchTypeListModel: null,
            status: MissedPunchStatus.getMissedPunchTypeError,
            message: e.toString(),
          ),
        );
      }
    });

    on<_ApplyMissedPunch>((event, emit) async {
      // ========= VALIDATION ========= //
      var reason = reasonController.text.trim();
      if (state.selectedMissedPunchType == null) {
        CustomToast.showError(message: "Please select missed punch type");
        return;
      }

      if (state.requestDate == null) {
        CustomToast.showError(message: "Please select request date");
        return;
      }

      if (reason.isEmpty) {
        CustomToast.showError(message: "Please enter reason");
        return;
      }

      emit(state.copyWith(status: MissedPunchStatus.applyMissedPunchLoading));

      try {
        ApiResponse<void> response = await state.missedPunchRepo
            .applyMissedPunch(
              empId: empId,
              missedPunchReason: reason,
              missedPunchType: state.selectedMissedPunchType,
              requestDate: state.requestDate,
            );

        if (response.isSuccess) {
          emit(
            state.copyWith(
              status: MissedPunchStatus.applyMissedPunchSuccess,
              message: response.message ?? "",
            ),
          );
        } else {
          emit(
            state.copyWith(
              status: MissedPunchStatus.applyMissedPunchError,
              message:
                  response.message ??
                  "Api failed with status ${response.statusCode}",
            ),
          );
        }
      } catch (e) {
        emit(
          state.copyWith(
            status: MissedPunchStatus.applyMissedPunchError,
            message: e.toString(),
          ),
        );
      }
    });

    on<_GetEmployeesMissedPunchList>((event, emit) async {
      emit(
        state.copyWith(
          status: MissedPunchStatus.getEmpMissedPunchListLoading,
          getEmpMissedPunchListLoading: true,
        ),
      );

      try {
        ApiResponse<EmployeesMissedPunchModel> response = await state
            .missedPunchRepo
            .getEmployeesMissedPunchList(
              empId: empId,
              fromDate: state.fromDate,
              toDate: state.toDate,
            );

        if (response.isSuccess && response.data != null) {
          emit(
            state.copyWith(
              status: MissedPunchStatus.getEmpMissedPunchListSuccess,
              getEmpMissedPunchListLoading: false,
              employeesMissedPunchModel: response.data,
              // fetchApprovalMissingPunchModel: response.data,
              message: response.message ?? "",
            ),
          );
        } else {
          emit(
            state.copyWith(
              status: MissedPunchStatus.getEmpMissedPunchListError,
              getEmpMissedPunchListLoading: false,
              employeesMissedPunchModel: null,
              // fetchApprovalMissingPunchModel: null,
              message:
                  response.message ??
                  "Api failed with status ${response.statusCode}",
            ),
          );
        }
      } catch (e) {
        emit(
          state.copyWith(
            status: MissedPunchStatus.getEmpMissedPunchListError,
            getEmpMissedPunchListLoading: false,
            employeesMissedPunchModel: null,
            // fetchApprovalMissingPunchModel: null,
            message: e.toString(),
          ),
        );
      }
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
          state.approvalMissingPunchModel?.swipeRequestList?.length ?? 0;

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
            state.approvalMissingPunchModel?.swipeRequestList
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

      final allList = state.approvalMissingPunchModel?.swipeRequestList ?? [];

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
            swipeRequestList: filtered,
          ),
          status: MissedPunchStatus.initial,
        ),
      );
    });

    on<_GetApprovalMissedPunchList>((event, emit) async {
      emit(
        state.copyWith(
          status: MissedPunchStatus.getApprovalPunchListLoading,
          getApprovalPunchListLoading: true,
        ),
      );

      try {
        ApiResponse<ApprovalMissedPunchModel> response = await state
            .missedPunchRepo
            .getApproveMissedPunchList(
              empId: empId,
              fromDate: state.fromDate,
              toDate: state.toDate,
            );

        if (response.isSuccess && response.data != null) {
          emit(
            state.copyWith(
              status: MissedPunchStatus.getApprovalPunchListSuccess,
              getApprovalPunchListLoading: false,
              approvalMissingPunchModel: response.data,
              fetchApprovalMissingPunchModel: response.data,
              message: response.message ?? "",
            ),
          );
        } else {
          emit(
            state.copyWith(
              status: MissedPunchStatus.getApprovalPunchListError,
              getApprovalPunchListLoading: false,
              approvalMissingPunchModel: null,
              fetchApprovalMissingPunchModel: null,
              message:
                  response.message ??
                  "Api failed with status ${response.statusCode}",
            ),
          );
        }
      } catch (e) {
        emit(
          state.copyWith(
            status: MissedPunchStatus.getApprovalPunchListError,
            getApprovalPunchListLoading: false,
            approvalMissingPunchModel: null,
            fetchApprovalMissingPunchModel: null,
            message: e.toString(),
          ),
        );
      }
    });

    on<_ApprovePunchByManager>((event, emit) async {
      emit(
        state.copyWith(status: MissedPunchStatus.approvalMissedPunchLoading),
      );
      try {
        final missedPunchIdList = state.selectedMissingPunchIds
            .map((e) => int.parse(e))
            .toList();

        ApiResponse<void> response = await state.missedPunchRepo
            .approveMissedPunchByManager(
              missedPunchIdsList: missedPunchIdList,
              isApprove: event.isApprove,
              remarks: remarkController.text.trim(),
            );

        if (response.isSuccess) {
          remarkController.clear();
          emit(
            state.copyWith(
              status: MissedPunchStatus.approvalMissedPunchSuccess,
              message: response.message ?? "",
              selectedMissingPunchIds: {},
              selectAll: false,
            ),
          );
          add(MissedPunchEvent.getApprovalMissedPunchList());
        } else {
          emit(
            state.copyWith(
              status: MissedPunchStatus.approvalMissedPunchError,
              message: response.message ?? "Some Error Occurred",
            ),
          );
        }
      } catch (e) {
        emit(
          state.copyWith(
            status: MissedPunchStatus.approvalMissedPunchError,
            message: e.toString(),
          ),
        );
      }
    });
  }
}
