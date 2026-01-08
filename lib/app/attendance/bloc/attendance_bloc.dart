import 'dart:developer';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:geolocator/geolocator.dart';
import 'package:hrms_uis/app/attendance/models/daily_attendance_model.dart';
import 'package:hrms_uis/app/attendance/repo/attendance_repo.dart';
import 'package:hrms_uis/common/utils/helpers/custom_image_file_picker.dart';
import 'package:image_picker/image_picker.dart';

import '../../../common/networking/common_repo.dart';
import '../models/approve_attendance_model.dart';
import '../models/manager_employee_list_model.dart';
import '../models/monthly_attendance_model.dart';

part 'attendance_bloc.freezed.dart';

part 'attendance_event.dart';

part 'attendance_state.dart';

class AttendanceBloc extends Bloc<AttendanceEvent, AttendanceState> {
  final TextEditingController remarkController = TextEditingController();

  AttendanceBloc({required int? userId})
    : super(
        AttendanceState(
          attendanceRepo: AttendanceRepo(),
          focusedDay: DateTime.now(),
        ),
      ) {

    // get location using gps latitude/longitude
    on<_RequestLocation>((event, emit) async {
      emit(state.copyWith(status: AttendanceStatus.locationLoading));

      try {
        // 1️⃣ Check if location service is enabled
        final serviceEnabled = await Geolocator.isLocationServiceEnabled();
        if (!serviceEnabled) {
          // Let UI handle showing a popup to enable it
          emit(
            state.copyWith(
              status: AttendanceStatus.locationServiceDisabled,
              message: 'Location services are disabled.',
            ),
          );
          return;
        }

        // 2️⃣ Check and request permission
        LocationPermission permission = await Geolocator.checkPermission();

        if (permission == LocationPermission.denied) {
          permission = await Geolocator.requestPermission();
          if (permission == LocationPermission.denied) {
            emit(
              state.copyWith(
                status: AttendanceStatus.permissionDenied,
                message: 'Location permission denied.',
              ),
            );
            return;
          }
        }

        if (permission == LocationPermission.deniedForever) {
          // Let UI open app settings
          emit(
            state.copyWith(
              status: AttendanceStatus.permissionDeniedForever,
              message:
                  'Location permission permanently denied. Please enable it from settings.',
            ),
          );
          return;
        }

        // 3️⃣ Now we’re allowed to get location
        final pos = await Geolocator.getCurrentPosition(
          locationSettings: const LocationSettings(
            accuracy: LocationAccuracy.high,
          ),
        );

        if (pos.isMocked == true) {
          emit(
            state.copyWith(
              status: AttendanceStatus.error,
              message: 'Fake GPS detected. Please disable mock location.',
            ),
          );
          return;
        }
        // 4️⃣ Reverse geocode
        String? address;
        try {
          final addressFromApi = await state.attendanceRepo
              .getAddressFromLatLng(
                latitude: pos.latitude,
                longitude: pos.longitude,
              );
          address = addressFromApi;
          emit(
            state.copyWith(
              status: AttendanceStatus.initial,
              latitude: pos.latitude,
              longitude: pos.longitude,
              address: address,
            ),
          );
          // Automatically request location after photo is captured
          add(AttendanceEvent.capturePhoto());
          log("Fetched address: $address");
        } catch (_) {
          address = null;
        }
        // 5️⃣ Success
        emit(
          state.copyWith(
            status: AttendanceStatus.initial,
            latitude: pos.latitude,
            longitude: pos.longitude,
            address: address,
          ),
        );
      } catch (e) {
        emit(
          state.copyWith(status: AttendanceStatus.error, message: e.toString()),
        );
      }
    });

    // capture picture
    on<_CapturePhoto>((event, emit) async {
      emit(state.copyWith(status: AttendanceStatus.cameraLoading));
      try {
        final imagePickerUtil = CustomImageFilePicker();
        final XFile? file = await imagePickerUtil.pickImage(
          ImageSource.camera,
          // crop: true,
          onCompressStart: () {
            // update state when compression starts
            emit(state.copyWith(status: AttendanceStatus.compressing));
          },
        );
        if (file == null) {
          emit(
            state.copyWith(
              status: AttendanceStatus.error,
              message: 'Capture cancelled',
            ),
          );
          return;
        }

        emit(
          state.copyWith(
            status: AttendanceStatus.initial,
            photoFile: File(file.path),
          ),
        );

        // After successful photo capture, decide Check-In / Check-Out
        final attendanceList = state.dailyAttendanceModel?.list ?? [];
        final record = attendanceList.isNotEmpty ? attendanceList.last : null;
        final hasIn = record?.inTime?.isNotEmpty ?? false;
        final hasOut = record?.outTime?.isNotEmpty ?? false;

        bool isCheckIn = !hasIn || (hasIn && hasOut);

        if (isCheckIn) {
          add(AttendanceEvent.checkIn());
        } else {
          add(AttendanceEvent.checkOut());
        }
      } catch (e) {
        emit(
          state.copyWith(status: AttendanceStatus.error, message: e.toString()),
        );
      }
    });

    // handle date navigation
    on<_InitDate>((event, emit) {
      final now = DateTime.now();
      emit(state.copyWith(selectedDate: now, today: now));
      add(AttendanceEvent.getDailyAttendance(date: now));
    });

    // go previous
    on<_PreviousDate>((event, emit) {
      final prevDate = state.selectedDate!.subtract(const Duration(days: 1));
      emit(state.copyWith(selectedDate: prevDate));
      add(AttendanceEvent.getDailyAttendance(date: prevDate));
    });

    // go next
    on<_NextDate>((event, emit) {
      final nextDate = state.selectedDate!.add(const Duration(days: 1));
      emit(state.copyWith(selectedDate: nextDate));
      add(AttendanceEvent.getDailyAttendance(date: nextDate));
    });

    // select daily date
    on<_SelectDailyDate>((event, emit) {
      emit(state.copyWith(selectedDate: event.selectedDate));
      add(AttendanceEvent.getDailyAttendance(date: event.selectedDate));
    });

    // get daily attendance api
    on<_GetDailyAttendance>((event, emit) async {
      emit(
        state.copyWith(
          status: AttendanceStatus.getAttendanceLoading,
          dailyAttendanceLoading: true,
        ),
      );
      try {
        final safeUtcDate = DateTime.utc(
          event.date.year,
          event.date.month,
          event.date.day,
          12, // noon
        );

        final formattedDate = safeUtcDate.toIso8601String();

        // final formattedDate = event.date
        //     .toUtc()
        //     .toIso8601String(); // 2025-10-31T11:08:25.250Z

        ApiResponse<DailyAttendanceModel> response = await state.attendanceRepo
            .fetchAttendanceData(userId: userId, isoDateTime: formattedDate);

        if (response.isSuccess && response.data != null) {
          emit(
            state.copyWith(
              status: AttendanceStatus.getAttendanceSuccess,
              dailyAttendanceModel: response.data,
              message: response.message ?? "",
              dailyAttendanceLoading: false,
            ),
          );
        } else {
          emit(
            state.copyWith(
              dailyAttendanceModel: null,
              status: AttendanceStatus.getAttendanceError,
              message:
                  response.message ??
                  "Api failed with status ${response.statusCode}",
              dailyAttendanceLoading: false,
            ),
          );
        }
      } catch (e) {
        emit(
          state.copyWith(
            dailyAttendanceModel: null,
            status: AttendanceStatus.getAttendanceError,
            message: e.toString(),
            dailyAttendanceLoading: false,
          ),
        );
      }
    });

    // punch in api
    on<_CheckIn>((event, emit) async {
      if (state.latitude == null || state.longitude == null) {
        emit(
          state.copyWith(
            status: AttendanceStatus.error,
            message: 'Please fetch location',
          ),
        );
        return;
      }

      if (state.photoFile == null) {
        emit(
          state.copyWith(
            status: AttendanceStatus.error,
            message: 'Please capture a photo',
          ),
        );
        return;
      }

      // final distance = Geolocator.distanceBetween(
      //   AppConstant.officeLatitude,
      //   AppConstant.officeLongitude,
      //   state.latitude!,
      //   state.longitude!,
      // );
      //
      // if (distance > AppConstant.allowedRadius) {
      //   log("distanceafterif checkin ===>>  $distance");
      //   emit(
      //     state.copyWith(
      //       status: AttendanceStatus.error,
      //       message: 'You are outside the 50-meter allowed check-in area.',
      //     ),
      //   );
      //   return;
      // } else {
      //   log("distanceafterelse checkin ===>>  $distance");
      // }

      emit(state.copyWith(status: AttendanceStatus.checkInOutLoading));
      try {
        ApiResponse<Map<String, dynamic>>? response = await state.attendanceRepo
            .checkIn(
              employeeId: userId ?? -1,
              addressText: state.address ?? '',
              latitude: state.latitude ?? -1,
              longitude: state.longitude ?? -1,
              imageFile: state.photoFile!,
            );

        if (response.isSuccess) {
          emit(
            state.copyWith(
              status: AttendanceStatus.checkInOutSuccess,
              message: response.message ?? "",
              address: null,
              latitude: null,
              longitude: null,
              photoFile: null,
            ),
          );
          add(
            AttendanceEvent.getDailyAttendance(
              date: state.selectedDate ?? DateTime.now(),
            ),
          );
        } else {
          emit(
            state.copyWith(
              status: AttendanceStatus.checkInOutError,
              message: response.message ?? "Some Error Occurred",
            ),
          );
        }
      } catch (e) {
        emit(
          state.copyWith(
            status: AttendanceStatus.checkInOutError,
            message: e.toString(),
          ),
        );
      }
    });

    /// punch out api
    on<_CheckOut>((event, emit) async {
      if (state.latitude == null || state.longitude == null) {
        emit(
          state.copyWith(
            status: AttendanceStatus.error,
            message: 'Please fetch location',
          ),
        );
        return;
      }

      if (state.photoFile == null) {
        emit(
          state.copyWith(
            status: AttendanceStatus.error,
            message: 'Please capture a photo',
          ),
        );
        return;
      }

      // final distance = Geolocator.distanceBetween(
      //   AppConstant.officeLatitude,
      //   AppConstant.officeLongitude,
      //   state.latitude!,
      //   state.longitude!,
      // );
      //
      // if (distance > AppConstant.allowedRadius) {
      //   log("distanceafterif checkin ===>>  $distance");
      //   emit(
      //     state.copyWith(
      //       status: AttendanceStatus.error,
      //       message: 'You are outside the 50-meter allowed check-in area.',
      //     ),
      //   );
      //   return;
      // } else {
      //   log("distanceafterelse checkin ===>>  $distance");
      // }

      emit(state.copyWith(status: AttendanceStatus.checkInOutLoading));
      try {
        ApiResponse<Map<String, dynamic>>? response = await state.attendanceRepo
            .checkOut(
              employeeId: userId ?? -1,
              addressText: state.address ?? '',
              latitude: state.latitude ?? -1,
              longitude: state.longitude ?? -1,
              imageFile: state.photoFile!,
            );

        if (response.isSuccess) {
          emit(
            state.copyWith(
              status: AttendanceStatus.checkInOutSuccess,
              message: response.message ?? "",
              address: null,
              latitude: null,
              longitude: null,
              photoFile: null,
            ),
          );
          add(
            AttendanceEvent.getDailyAttendance(
              date: state.selectedDate ?? DateTime.now(),
            ),
          );
        } else {
          emit(
            state.copyWith(
              status: AttendanceStatus.checkInOutError,
              message: response.message ?? "Some Error Occurred",
            ),
          );
        }
      } catch (e) {
        emit(
          state.copyWith(
            status: AttendanceStatus.checkInOutError,
            message: e.toString(),
          ),
        );
      }
    });

    // get monthly attendance api
    on<_GetMonthlyAttendance>((event, emit) async {
      emit(
        state.copyWith(
          status: AttendanceStatus.monthlyAttendanceLoading,
          monthlyAttendanceLoading: true,
        ),
      );

      try {
        ApiResponse<MonthlyAttendanceModel> response = await state
            .attendanceRepo
            .getMonthlyAttendance(
              userId: event.empId ?? userId,
              month: event.month,
              year: event.year,
            );

        if (response.isSuccess && response.data != null) {
          emit(
            state.copyWith(
              status: AttendanceStatus.monthlyAttendanceSuccess,
              monthlyAttendanceLoading: false,
              monthlyAttendanceModel: response.data,
              message: response.message ?? "",
            ),
          );
        } else {
          emit(
            state.copyWith(
              monthlyAttendanceModel: null,
              status: AttendanceStatus.monthlyAttendanceError,
              monthlyAttendanceLoading: false,
              message:
                  response.message ??
                  "Api failed with status ${response.statusCode}",
            ),
          );
        }
      } catch (e) {
        emit(
          state.copyWith(
            monthlyAttendanceModel: null,
            status: AttendanceStatus.monthlyAttendanceError,
            monthlyAttendanceLoading: false,
            message: e.toString(),
          ),
        );
      }
    });

    on<_UpdateCalendarSelection>((event, emit) {
      emit(
        state.copyWith(
          focusedDay: event.focusedDay,
          selectedDay: event.resetSelection ? null : event.selectedDay,
        ),
      );
    });

    // filter approve attendance
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
            status: AttendanceStatus.initial,
          ),
        );
      } else {
        emit(
          state.copyWith(
            toDate: event.selectedDate,
            status: AttendanceStatus.initial,
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
          status: AttendanceStatus.initial,
        ),
      );
    });

    // on<_SelectFilterType>((event, emit) {
    //   emit(
    //     state.copyWith(
    //       selectedFilter: event.selectedFilterType,
    //       status: AttendanceStatus.initial,
    //     ),
    //   );
    // });

    // toggle single or all selection
    on<_ToggleSingleSelection>((event, emit) {
      final updated = {...state.selectedEmployeeIds};

      if (updated.contains(event.employeeId)) {
        updated.remove(event.employeeId);
      } else {
        updated.add(event.employeeId);
      }

      final totalEmployees =
          state.approveAttendanceListModel?.attendecList?.length ?? 0;

      final allSelected =
          totalEmployees > 0 && updated.length == totalEmployees;

      emit(
        state.copyWith(selectedEmployeeIds: updated, selectAll: allSelected),
      );
    });

    on<_ToggleAllSelection>((event, emit) {
      if (event.value) {
        // Select all employees by ID
        final allIds =
            state.approveAttendanceListModel?.attendecList
                ?.map((e) => e.id.toString())
                .toSet() ??
            {}; // <-- fallback to empty set if null

        emit(state.copyWith(selectAll: true, selectedEmployeeIds: allIds));
      } else {
        emit(state.copyWith(selectAll: false, selectedEmployeeIds: {}));
      }
    });

    on<_SearchEmployeeFromList>((event, emit) {
      final query = event.query.toLowerCase();

      // If empty -> restore full list
      if (query.isEmpty) {
        emit(
          state.copyWith(
            approveAttendanceListModel: state.fetchedAttendanceListModel
                ?.copyWith(),
            status: AttendanceStatus.initial,
          ),
        );
        return;
      }

      final allList = state.fetchedAttendanceListModel?.attendecList ?? [];

      final filtered = allList.where((item) {
        final name = item.employeeName?.toLowerCase() ?? "";
        return name.contains(query);
      }).toList();

      emit(
        state.copyWith(
          approveAttendanceListModel: ApproveAttendanceModel(
            attendecList: filtered,
          ),
          status: AttendanceStatus.initial,
        ),
      );
    });

    on<_GetApproveAttendanceList>((event, emit) async {
      emit(
        state.copyWith(
          status: AttendanceStatus.getApproveAttendanceLoading,
          getApproveAttendanceLoading: true,
        ),
      );
      try {
        ApiResponse<ApproveAttendanceModel> response = await state
            .attendanceRepo
            .getApproveAttendanceList(
              empId: userId,
              fromDate: state.fromDate,
              toDate: state.toDate,
            );

        if (response.isSuccess && response.data != null) {
          emit(
            state.copyWith(
              status: AttendanceStatus.getApproveAttendanceSuccess,
              approveAttendanceListModel: response.data,
              fetchedAttendanceListModel: response.data,
              message: response.message ?? "",
              getApproveAttendanceLoading: false,
            ),
          );
        } else {
          emit(
            state.copyWith(
              approveAttendanceListModel: null,
              fetchedAttendanceListModel: null,
              status: AttendanceStatus.getApproveAttendanceError,
              message:
                  response.message ??
                  "Api failed with status ${response.statusCode}",
              getApproveAttendanceLoading: false,
            ),
          );
        }
      } catch (e) {
        emit(
          state.copyWith(
            approveAttendanceListModel: null,
            fetchedAttendanceListModel: null,
            status: AttendanceStatus.getApproveAttendanceError,
            message: e.toString(),
            getApproveAttendanceLoading: false,
          ),
        );
      }
    });

    on<_ApproveAttendanceByManager>((event, emit) async {
      emit(state.copyWith(status: AttendanceStatus.approveAttendanceLoading));
      try {
        final attendanceIdList = state.selectedEmployeeIds
            .map((e) => int.parse(e))
            .toList();

        ApiResponse<Map<String, dynamic>>? response = await state.attendanceRepo
            .approveAttendanceByManager(
              attendanceList: attendanceIdList,
              isApprove: event.isApprove,
              remarks: remarkController.text.trim(),
            );

        if (response.isSuccess) {
          remarkController.clear();
          emit(
            state.copyWith(
              status: AttendanceStatus.approveAttendanceSuccess,
              message: response.message ?? "",
              selectedEmployeeIds: {},
              selectAll: false,
            ),
          );
          add(AttendanceEvent.getApproveAttendanceList());
        } else {
          emit(
            state.copyWith(
              status: AttendanceStatus.approveAttendanceError,
              message: response.message ?? "Some Error Occurred",
            ),
          );
        }
      } catch (e) {
        emit(
          state.copyWith(
            status: AttendanceStatus.approveAttendanceError,
            message: e.toString(),
          ),
        );
      }
    });

    on<_GetManagersEmployeeList>((event, emit) async {
      emit(
        state.copyWith(status: AttendanceStatus.managerEmployeesListLoading),
      );
      try {
        ApiResponse<ManagerEmployeeListModel> response = await state
            .attendanceRepo
            .getManagerEmployeesList(empId: userId);

        if (response.isSuccess && response.data != null) {
          emit(
            state.copyWith(
              managerEmployeesListModel: response.data,
              status: AttendanceStatus.managerEmployeesListSuccess,
              message: response.message ?? "",
            ),
          );
        } else {
          emit(
            state.copyWith(
              status: AttendanceStatus.managerEmployeesListError,
              managerEmployeesListModel: null,
              message:
                  response.message ??
                  "Api failed with status ${response.statusCode}",
            ),
          );
        }
      } catch (e) {
        emit(
          state.copyWith(
            status: AttendanceStatus.managerEmployeesListError,
            managerEmployeesListModel: null,
            message: e.toString(),
          ),
        );
      }
    });
  }
}
