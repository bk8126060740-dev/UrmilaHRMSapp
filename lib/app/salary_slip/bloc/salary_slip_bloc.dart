import 'dart:developer';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hrms_uis/common/widgets/dropdown/dropdown_model.dart';

import '../../../common/networking/network_exception.dart';
import '../repo/salary_slip_repo.dart';

part 'salary_slip_bloc.freezed.dart';

part 'salary_slip_event.dart';

part 'salary_slip_state.dart';

class SalarySlipBloc extends Bloc<SalarySlipEvent, SalarySlipState> {
  SalarySlipBloc({required int? empId})
    : super(SalarySlipState(salarySlipRepo: SalarySlipRepo())) {
    on<_SelectMonth>((event, emit) async {
      emit(
        state.copyWith(
          status: SalarySlipStatus.initial,
          month: event.selectedMonth,
        ),
      );
    });

    on<_SelectYear>((event, emit) async {
      emit(
        state.copyWith(
          status: SalarySlipStatus.initial,
          year: event.selectedYear,
        ),
      );
    });

    on<_DownloadSalarySlip>((event, emit) async {
      log("[SalarySlipBloc] Download started", name: "SalarySlipBloc");

      emit(
        state.copyWith(status: SalarySlipStatus.downloadLoading, progress: 0),
      );

      try {
        final file = await state.salarySlipRepo.downloadSalarySlip(
          empId: empId,
          year: state.year?.id,
          month: state.month?.id,
          onProgress: (progress) {
            emit(
              state.copyWith(
                status: SalarySlipStatus.downloadLoading,
                progress: progress,
              ),
            );
          },
        );

        if (file != null) {
          log(
            "[SalarySlipBloc] Download success => ${file.path}",
            name: "SalarySlipBloc",
          );

          emit(
            state.copyWith(
              status: SalarySlipStatus.downloadSuccess,
              file: file,
              progress: 1,
            ),
          );
        } else {
          log(
            "[SalarySlipBloc] Download failed (file null)",
            name: "SalarySlipBloc",
          );

          emit(
            state.copyWith(
              status: SalarySlipStatus.downloadFailed,
              message: "File not downloaded.",
            ),
          );
        }
      } catch (e, stack) {
        log(
          "[SalarySlipBloc] Exception => $e",
          stackTrace: stack,
          name: "SalarySlipBloc",
        );
        String errorMessage = "Download failed";

        if (e is ApiException) {
          errorMessage = e.message; // 👈 EXACT backend message
        }

        emit(
          state.copyWith(
            status: SalarySlipStatus.downloadFailed,
            message: errorMessage,
          ),
        );
      }
    });
  }
}
