import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:hrms_uis/app/attendance/bloc/attendance_bloc.dart';
import 'package:hrms_uis/common/utils/app_bloc/app_bloc.dart';
import 'package:hrms_uis/common/utils/extensions/extension.dart';
import 'package:location/location.dart';

import '../../../common/utils/constants/colors.dart';
import '../../../common/utils/constants/decorations.dart';
import '../../../common/utils/constants/image_strings.dart';
import '../../../common/utils/constants/sizes.dart';
import '../../../common/utils/constants/text_styles.dart';
import '../../../common/utils/helpers/device_utility.dart';
import '../../../common/utils/popups/custom_toast.dart';
import '../../../common/widgets/button/custom_button.dart';
import '../../../common/widgets/image/custom_image.dart';
import '../helper/attendance_helper.dart';

class UserDetailsCard extends StatefulWidget {
  final bool showButton;

  const UserDetailsCard({super.key, this.showButton = true});

  @override
  State<UserDetailsCard> createState() => _UserDetailsCardState();
}

class _UserDetailsCardState extends State<UserDetailsCard> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      clipBehavior: Clip.none,
      children: [
        BlocConsumer<AttendanceBloc, AttendanceState>(
          listenWhen: (p, n) => p.status != n.status,
          listener: (context, state) async {
            // 🔥 Instead of manual Geolocator dialogs, handle everything here
            if (state.status == AttendanceStatus.locationServiceDisabled ||
                state.status == AttendanceStatus.permissionDenied) {
              await _handleLocationFlow(context);
            }

            if (state.status == AttendanceStatus.permissionDeniedForever) {
              await showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: const Text('Permission Needed'),
                  content: const Text(
                    'Location permission is permanently denied. Please enable it in app settings.',
                  ),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text('OK'),
                    ),
                    TextButton(
                      onPressed: () async {
                        Navigator.pop(context);
                        await Geolocator.openAppSettings();
                      },
                      child: const Text('Open Settings'),
                    ),
                  ],
                ),
              );
            }

            if (state.status == AttendanceStatus.checkInOutSuccess) {
              CustomToast.showSuccess(message: state.message);
            }

            if (state.status == AttendanceStatus.checkInOutError ||
                state.status == AttendanceStatus.error) {
              CustomToast.showError(message: state.message);
            }
          },
          builder: (context, state) {
            return Container(
              margin: const EdgeInsets.symmetric(vertical: AppSizes.space20),
              decoration: AppDecorations.card(),
              padding: const EdgeInsets.only(top: 60, bottom: 20),
              width: AppDeviceUtils.getScreenWidth(context),
              child: BlocBuilder<AppBloc, AppState>(
                builder: (context, appState) {
                  return Column(
                    children: [
                      Text(
                        "${appState.userProfileModel?.firstName.withDefault("__")} ${appState.userProfileModel?.lastName.withDefault("")}",
                        style: AppTextStyles.w500_24(context),
                      ),
                      const SizedBox(height: AppSizes.space4),
                      Text(
                        "${appState.userProfileModel?.designationName.withDefault("__")}",
                        style: AppTextStyles.w400_16(
                          context,
                          color: AppColors.secondaryTextColor,
                        ),
                      ),
                      const SizedBox(height: AppSizes.space4),
                      Text(
                        "Emp ID: ${appState.userProfileModel?.id}",
                        style: AppTextStyles.w400_12(
                          context,
                          color: AppColors.secondaryTextColor,
                        ),
                      ),

                      const SizedBox(height: AppSizes.space16),

                      // Check In Button
                      checkInOutButton(),
                      // CustomButton(
                      //   width: AppSizes.buttonWidth,
                      //   height: AppSizes.buttonHeight45,
                      //   text: state.status == AttendanceStatus.locationLoading
                      //       ? "Fetching location.."
                      //       : "Check In",
                      //   onTap:
                      //       state.status == AttendanceStatus.cameraLoading ||
                      //           state.status == AttendanceStatus.locationLoading
                      //       ? null
                      //       : () => context.read<AttendanceBloc>().add(
                      //           AttendanceEvent.requestLocation(),
                      //         ),
                      // ),
                    ],
                  );
                },
              ),
            );
          },
        ),
        Positioned(
          top: -40,
          child: BlocBuilder<AppBloc, AppState>(
            builder: (context, appState) {
              return CustomImage(
                imageUrl: appState.userProfileModel?.profilePath ?? "",
                fallbackAsset: AppImages.profileImage,
                size: 100,
                borderColor: Colors.white,
                borderWidth: 2,
                useShimmer: true,
              );
            },
          ),
        ),
      ],
    );
  }

  Future<void> _handleLocationFlow(BuildContext context) async {
    final Location location = Location();

    bool serviceEnabled;
    PermissionStatus permissionGranted;

    // 1️⃣ Check if service is enabled
    serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();
      if (!serviceEnabled) {
        _handleLocationFlow(context);
        // User rejected enabling service
        return;
      }
    }

    // 2️⃣ Check and request permission (async continuation)
    permissionGranted = await location.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await location.requestPermission();
      if (permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    // ✅ Both enabled → trigger location event
    if (mounted) {
      context.read<AttendanceBloc>().add(
        const AttendanceEvent.requestLocation(),
      );
    }
  }

  Widget checkInOutButton() {
    return BlocBuilder<AttendanceBloc, AttendanceState>(
      builder: (context, state) {
        debugPrint("🟢 --- checkInOutButton rebuild ---");
        debugPrint("State.selectedDate: ${state.selectedDate}");
        debugPrint(
          "Attendance list length: ${state.dailyAttendanceModel?.list?.length}",
        );
        debugPrint("Attendance status: ${state.status}");

        final selectedDate = state.selectedDate ?? DateTime.now();
        final attendanceList = state.dailyAttendanceModel?.list ?? [];
        final record = attendanceList.isNotEmpty ? attendanceList.first : null;

        // Show button only for today's date
        final bool isToday = AttendanceHelper.isToday(selectedDate);
        debugPrint("Is today? $isToday (selectedDate: $selectedDate)");

        final bool isVisible = isToday;

        // Default values
        String buttonText = "Check In";
        bool isEnabled = true;

        if (isToday) {
          debugPrint("Today's record details:");
          debugPrint("record?.inTime: ${record?.inTime}");
          debugPrint("record?.outTime: ${record?.outTime}");

          final hasIn = record?.inTime?.isNotEmpty ?? false;
          final hasOut = record?.outTime?.isNotEmpty ?? false;

          debugPrint("hasIn: $hasIn, hasOut: $hasOut");

          if (hasIn && !hasOut) {
            buttonText = "Check Out";
            debugPrint(
              "✅ Condition matched: Checked In but not Checked Out → Button: Check Out",
            );
          } else {
            buttonText = "Check In";
            debugPrint(
              "🟡 Condition matched: Either not checked in or already checked out → Button: Check In",
            );
          }
        } else {
          debugPrint("❌ Not today's date → Button hidden");
        }

        // Handle loading states
        switch (state.status) {
          case AttendanceStatus.locationLoading:
            buttonText = "Fetching location..";
            isEnabled = false;
            debugPrint("📍 Location loading...");
            break;
          case AttendanceStatus.cameraLoading:
            buttonText = "Camera loading..";
            isEnabled = false;
            debugPrint("📸 Camera loading...");
            break;
          case AttendanceStatus.compressing:
            buttonText = "Compressing image..";
            isEnabled = false;
            debugPrint("📸 compressing image...");
            break;
          default:
            break;
        }

        debugPrint(
          "Final → Button Text: $buttonText | Enabled: $isEnabled | Visible: $isVisible",
        );

        return Visibility(
          visible: isVisible,
          maintainSize: true,
          maintainAnimation: true,
          maintainState: true,
          child: CustomButton(
            isLoading: state.status == AttendanceStatus.checkInOutLoading,
            width: AppSizes.buttonWidth,
            height: AppSizes.buttonHeight45,
            text: buttonText,
            onTap: isEnabled
                ? () {
                    debugPrint("👆 Button tapped: $buttonText");
                    context.read<AttendanceBloc>().add(
                      const AttendanceEvent.requestLocation(),
                    );
                  }
                : null,
          ),
        );
      },
    );
  }

  /*
  Widget checkInOutButton() {
    return BlocBuilder<AttendanceBloc, AttendanceState>(
      builder: (context, state) {
        final selectedDate = state.selectedDate ?? DateTime.now();
        final attendanceList = state.fetchAttendanceModel?.list ?? [];
        final record = attendanceList.isNotEmpty ? attendanceList.last : null;

        // Show button only for today's date (but keep layout)
        final bool isToday = AttendanceHelper.isToday(selectedDate);
        final bool isVisible = isToday;

        // Defaults
        String buttonText = "Check In";
        bool isEnabled = true;

        if (isToday) {
          final hasIn = record?.inTime?.isNotEmpty ?? false;
          final hasOut = record?.outTime?.isNotEmpty ?? false;

          if (hasIn && !hasOut) {
            // User checked in but not out yet
            buttonText = "Check Out";
          } else {
            // Either no data OR both in/out done → allow new Check In
            buttonText = "Check In";
          }
        }

        // Loading states override
        switch (state.status) {
          case AttendanceStatus.locationLoading:
            buttonText = "Fetching location..";
            isEnabled = false;
            break;
          case AttendanceStatus.cameraLoading:
            buttonText = "Camera loading..";
            isEnabled = false;
            break;
          default:
            break;
        }

        return Visibility(
          visible: isVisible,
          maintainSize: true,
          maintainAnimation: true,
          maintainState: true,
          child: CustomButton(
            isLoading: state.status == AttendanceStatus.checkInOutLoading,
            width: AppSizes.buttonWidth,
            height: AppSizes.buttonHeight45,
            text: buttonText,
            onTap: isEnabled
                ? () => context.read<AttendanceBloc>().add(
                    const AttendanceEvent.requestLocation(),
                  )
                : null,
          ),
        );
      },
    );
  }
*/
}

// for diable button after check in and out
// Widget checkInOutButton() {
//   return BlocBuilder<AttendanceBloc, AttendanceState>(
//     builder: (context, state) {
//       final selectedDate = state.selectedDate ?? DateTime.now();
//       final attendanceList = state.fetchAttendanceModel?.list ?? [];
//       final record = attendanceList.isNotEmpty ? attendanceList.first : null;
//
//       // ===== Determine button visibility =====
//       final bool isToday = _isToday(selectedDate);
//       final bool isVisible = isToday;
//
//       // ===== Determine base states =====
//       String buttonText = "Check In";
//       bool isEnabled = true;
//
//       // ===== Determine button label and enabled state =====
//       if (isToday) {
//         final hasIn = record?.inTime?.isNotEmpty ?? false;
//         final hasOut = record?.outTime?.isNotEmpty ?? false;
//
//         if (hasIn && hasOut) {
//           // Both check-in/out done → disable
//           isEnabled = false;
//         } else if (hasIn) {
//           buttonText = "Check Out";
//         }
//       }
//
//       // ===== Handle loading state overrides =====
//       switch (state.status) {
//         case AttendanceStatus.locationLoading:
//           buttonText = "Fetching location..";
//           isEnabled = false;
//           break;
//         case AttendanceStatus.cameraLoading:
//           isEnabled = false;
//           break;
//         default:
//           break;
//       }
//
//       return Visibility(
//         visible: isVisible,
//         maintainSize: true,
//         maintainAnimation: true,
//         maintainState: true,
//         child: CustomButton(
//           width: AppSizes.buttonWidth,
//           height: AppSizes.buttonHeight45,
//           text: buttonText,
//           onTap: isEnabled
//               ? () => context.read<AttendanceBloc>().add(
//                   const AttendanceEvent.requestLocation(),
//                 )
//               : null,
//         ),
//       );
//     },
//   );
// }
