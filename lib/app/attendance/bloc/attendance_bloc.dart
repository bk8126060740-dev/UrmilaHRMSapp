import 'dart:developer';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:geolocator/geolocator.dart';
import 'package:hrms_uis/app/attendance/models/daily_attendance_model.dart';
import 'package:hrms_uis/app/attendance/repo/attendance_repo.dart';
import 'package:hrms_uis/common/utils/helpers/custom_image_file_picker.dart';
import 'package:image_picker/image_picker.dart';

import '../../../common/networking/common_repo.dart';
import '../models/monthly_attendance_model.dart';

part 'attendance_bloc.freezed.dart';

part 'attendance_event.dart';

part 'attendance_state.dart';

class AttendanceBloc extends Bloc<AttendanceEvent, AttendanceState> {
  AttendanceBloc({required int? userId})
    : super(AttendanceState(attendanceRepo: AttendanceRepo())) {
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
            accuracy: LocationAccuracy.best,
          ),
        );

        // 4️⃣ Reverse geocode
        String? address;
        try {
          // final placemarks = await geo.placemarkFromCoordinates(
          //   pos.latitude,
          //   pos.longitude,
          // );
          // if (placemarks.isNotEmpty) {
          //   address = CaptureHelper.formatAddress(placemarks.first);
          // }
          final addressFromApi = await state.attendanceRepo
              .getAddressFromLatLngIndiaMap(
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
        final record = attendanceList.isNotEmpty ? attendanceList.first : null;
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

    on<_PreviousDate>((event, emit) {
      final prevDate = state.selectedDate!.subtract(const Duration(days: 1));
      emit(state.copyWith(selectedDate: prevDate));
      add(AttendanceEvent.getDailyAttendance(date: prevDate));
    });

    on<_NextDate>((event, emit) {
      final nextDate = state.selectedDate!.add(const Duration(days: 1));
      emit(state.copyWith(selectedDate: nextDate));
      add(AttendanceEvent.getDailyAttendance(date: nextDate));
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
        final formattedDate = event.date
            .toUtc()
            .toIso8601String(); // 2025-10-31T11:08:25.250Z

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
      if (event.fromButton) {
        emit(
          state.copyWith(
            status: AttendanceStatus.monthlyAttendanceLoading,
            monthlyAttendanceLoading: true,
            dailyAttendanceModel: null,
          ),
        );
        final now = DateTime.now();
        final isSameMonthAndYear =
            event.dateTime.year == now.year &&
            event.dateTime.month == now.month;

        if (isSameMonthAndYear) {
          add(AttendanceEvent.getDailyAttendance(date: now));
        }
      } else {
        emit(
          state.copyWith(
            status: AttendanceStatus.monthlyAttendanceLoading,
            monthlyAttendanceLoading: true,
          ),
        );
      }
      try {
        ApiResponse<MonthlyAttendanceModel> response = await state
            .attendanceRepo
            .getMonthlyAttendance(
              userId: userId,
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
  }
}
