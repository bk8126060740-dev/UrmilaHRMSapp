import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hrms_uis/common/utils/constants/colors.dart';
import 'package:hrms_uis/common/utils/constants/text_styles.dart';
import 'package:hrms_uis/common/utils/extensions/extension.dart';
import 'package:hrms_uis/common/utils/helpers/device_utility.dart';
import 'package:hrms_uis/common/widgets/button/custom_button.dart';
import 'package:open_filex/open_filex.dart';

import '../../../common/utils/constants/sizes.dart';
import '../../../common/utils/helpers/helper_functions.dart';
import '../../../common/utils/popups/custom_snackbar.dart';
import '../../../common/widgets/appbar/custom_appbar.dart';
import '../../../common/widgets/custom/custom_section_widget.dart';
import '../../../common/widgets/dropdown/custom_animated_dropdown.dart';
import '../../../common/widgets/dropdown/dropdown_model.dart';
import '../../../common/widgets/text/custom_field_heading.dart';
import '../bloc/salary_slip_bloc.dart';

class SalarySlipScreen extends StatefulWidget {
  static const route = '/salary_slip';

  const SalarySlipScreen({super.key});

  @override
  State<SalarySlipScreen> createState() => _SalarySlipScreenState();
}

class _SalarySlipScreenState extends State<SalarySlipScreen> {
  late final List<DropdownModel> _months;
  late final List<DropdownModel> _years;

  @override
  void initState() {
    super.initState();
    _months = AppHelperFunctions.getMonthList();
    _years = AppHelperFunctions.getYearList(startYear: 2020);
  }

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<SalarySlipBloc>();

    return Scaffold(
      appBar: CustomAppBar(showBackButton: true, title: context.loc.salarySlip),
      body: Padding(
        padding: const EdgeInsets.all(AppSizes.padding20),
        child: BlocConsumer<SalarySlipBloc, SalarySlipState>(
          listener: (context, state) {
            if (state.status == SalarySlipStatus.downloadSuccess) {
              CustomSnackBar.showNormal(
                context: context,
                message: "Pay slip downloaded. Tap View to open.",
                actionLabel: "View",
                onActionPressed: () {
                  if (state.file != null) {
                    OpenFilex.open(state.file!.path);
                  }
                },
              );
            }

            if (state.status == SalarySlipStatus.downloadFailed) {
              CustomSnackBar.showError(
                context: context,
                message: state.message,
              );
            }
          },
          builder: (context, state) {
            final isDownloading =
                state.status == SalarySlipStatus.downloadLoading;
            final progress = isDownloading ? state.progress : 0.0;

            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomSectionWidget(
                    title: "Download PaySlip",
                    child: SizedBox(
                      width: double.infinity,
                      child: Column(
                        children: [
                          CustomFieldHeading(title: 'Month'),
                          CustomAnimatedDropdown<DropdownModel>(
                            initialItem: state.month,
                            hintText: 'Month',
                            items: _months,
                            onChanged: (value) {
                              if (value != null) {
                                bloc.add(
                                  SalarySlipEvent.selectMonth(
                                    selectedMonth: value,
                                  ),
                                );
                              }
                            },
                          ),
                          const SizedBox(height: AppSizes.space16),
                          CustomFieldHeading(title: 'Year'),
                          CustomAnimatedDropdown<DropdownModel>(
                            initialItem: state.year,
                            hintText: 'Year',
                            items: _years,
                            onChanged: (value) {
                              if (value != null) {
                                bloc.add(
                                  SalarySlipEvent.selectYear(
                                    selectedYear: value,
                                  ),
                                );
                              }
                            },
                          ),
                          const SizedBox(height: AppSizes.space20),
                          if (isDownloading)
                            Text(
                              "Important: Please do not close the app or press the back button while the download is in progress.",
                              textAlign: TextAlign.center,
                              style: AppTextStyles.w400_14(
                                context,
                                color: AppColors.warning,
                              ),
                            ),
                          if (isDownloading)
                            const SizedBox(height: AppSizes.space20),
                          CustomButton(
                            width: AppDeviceUtils.getScreenWidth(context),
                            isLoading: isDownloading,
                            text: isDownloading
                                ? "${(progress * 100).toInt()}%"
                                : "Download",
                            onTap: isDownloading
                                ? null
                                : () {
                                    if (isDownloading) {
                                      return;
                                    }
                                    if (state.month == null) {
                                      CustomSnackBar.showWarning(
                                        context: context,
                                        message: "Please select month",
                                      );
                                      return;
                                    }
                                    if (state.year == null) {
                                      CustomSnackBar.showWarning(
                                        context: context,
                                        message: "Please select year",
                                      );
                                      return;
                                    }
                                    bloc.add(
                                      SalarySlipEvent.downloadSalarySlip(),
                                    );
                                  },
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

// import 'dart:developer';
//
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:hrms_uis/common/utils/extensions/extension.dart';
// import 'package:open_filex/open_filex.dart';
//
// import '../../../common/networking/http_client.dart';
// import '../../../common/utils/app_bloc/app_bloc.dart';
// import '../../../common/utils/constants/colors.dart';
// import '../../../common/utils/constants/decorations.dart';
// import '../../../common/utils/constants/image_strings.dart';
// import '../../../common/utils/constants/sizes.dart';
// import '../../../common/utils/constants/text_styles.dart';
// import '../../../common/utils/global_internet_check/network_observer.dart';
// import '../../../common/utils/popups/custom_snackbar.dart';
// import '../../../common/widgets/appbar/custom_appbar.dart';
// import '../../../common/widgets/divider/horizontal_divider.dart';
// import '../../../common/widgets/loader/custom_circular_progress.dart';
// import '../../../common/widgets/placeholder/no_data_found.dart';
// import '../../dashboard/bloc/dashboard_bloc.dart';
//
// class SalarySlipScreen extends StatefulWidget {
//   static const route = '/salary_slip';
//
//   const SalarySlipScreen({super.key});
//
//   @override
//   State<SalarySlipScreen> createState() => _SalarySlipScreenState();
// }
//
// class _SalarySlipScreenState extends State<SalarySlipScreen> {
//   int selectedIndex = -1;
//   double downloadProgress = 0.0;
//   bool isDownloading = false;
//
//   @override
//   Widget build(BuildContext context) {
//     return NetworkObserver(
//       onRetry: () {
//         context.read<DashboardBloc>().add(DashboardEvent.getUserProfileData());
//       },
//       child: Scaffold(
//         appBar: CustomAppBar(
//           elevation: 0,
//           title: context.loc.salarySlip,
//           showAvatar: false,
//           showBackButton: true,
//           showNavigation: false,
//           showCalendarIcon: false,
//         ),
//         body: SafeArea(
//           child: Container(
//             margin: const EdgeInsets.symmetric(
//               vertical: AppSizes.padding20,
//               horizontal: AppSizes.padding20,
//             ),
//             child: BlocConsumer<DashboardBloc, DashboardState>(
//               listener: (context, state) {
//                 if (state.status == DashboardStatus.profileSuccess) {
//                   context.read<AppBloc>().add(
//                     AppEvent.updateUserProfileData(state.userProfileDataModel),
//                   );
//                 }
//               },
//               builder: (context, state) {
//                 // return CustomButton(
//                 //   onTap: () async {
//                 //     try {
//                 //       final file = await HttpClient.instance().downloadFile(
//                 //         url:
//                 //             'https://upload.wikimedia.org/wikipedia/commons/6/60/The_Organ_at_Arches_National_Park_Utah_Corrected.jpg',
//                 //       );
//                 //       if (file != null) {
//                 //         CustomSnackBar.showSuccess(
//                 //           context: context,
//                 //           message: "Download successful",
//                 //           actionLabel: "View",
//                 //           onActionPressed: () async {
//                 //             // await OpenFile.open(file.path);
//                 //             OpenFilex.open(file.path);
//                 //           },
//                 //         );
//                 //       }
//                 //     } catch (e) {
//                 //       CustomSnackBar.showError(
//                 //         context: context,
//                 //         message: "Download failed",
//                 //       );
//                 //     }
//                 //   },
//                 //   text: "Download",
//                 // );
//
//                 var salarySlipList = [
//                   SalarySlip(
//                     month: "Jan",
//                     year: 2025,
//                     url: "https://pdfobject.com/pdf/sample.pdf",
//                   ),
//                   SalarySlip(
//                     month: "Feb",
//                     year: 2025,
//                     url:
//                     "https://upload.wikimedia.org/wikipedia/commons/6/60/The_Organ_at_Arches_National_Park_Utah_Corrected.jpg",
//                   ),
//                   SalarySlip(
//                     month: "Mar",
//                     year: 2025,
//                     url:
//                     "https://upload.wikimedia.org/wikipedia/commons/6/60/The_Organ_at_Arches_National_Park_Utah_Corrected.jpg",
//                   ),
//                 ];
//
//                 return state.status == DashboardStatus.profileLoading
//                     ? Center(child: CustomCircularProgress())
//                     : salarySlipList.isEmpty
//                     ? Center(child: NoDataFound())
//                     : _salarySlipView(
//                   title: "Salary Slip Download",
//                   salarySlipList: salarySlipList,
//                 );
//               },
//             ),
//           ),
//         ),
//       ),
//     );
//   }
//
//   Widget _salarySlipView({
//     required String title,
//     required List<SalarySlip> salarySlipList,
//   }) {
//     return ListView.separated(
//       itemCount: salarySlipList.length,
//       shrinkWrap: true,
//       itemBuilder: (ctx, index) {
//         var salaryData = salarySlipList[index];
//         return Container(
//           padding: EdgeInsets.symmetric(
//             vertical: AppSizes.padding16,
//             horizontal: AppSizes.padding8,
//           ),
//           decoration: AppDecorations.card(
//             radius: BorderRadius.circular(AppSizes.borderRadius8),
//           ),
//           margin: EdgeInsets.only(bottom: AppSizes.space16),
//           child: Row(
//             children: [
//               SvgPicture.asset(
//                 AppImages.pdfIcon,
//                 width: AppSizes.iconSize20,
//                 height: AppSizes.iconSize20,
//               ),
//               const SizedBox(width: AppSizes.space8),
//               Expanded(
//                 child: Text(
//                   "Salary Slip of ${salaryData.month} ${salaryData.year} ",
//                   style: AppTextStyles.w400_14(context),
//                 ),
//               ),
//               const SizedBox(height: AppSizes.space8),
//               isDownloading && selectedIndex == index
//                   ? Center(
//                 child: Stack(
//                   alignment: Alignment.center,
//                   children: [
//                     const SizedBox(
//                       width: 40,
//                       height: 40,
//                       child: CircularProgressIndicator(strokeWidth: 3),
//                     ),
//                     Text(
//                       "${(downloadProgress * 100).toStringAsFixed(0)}%",
//                       // "$downloadProgress%",
//                       style: AppTextStyles.w400_12(context),
//                     ),
//                   ],
//                 ),
//               )
//                   : InkWell(
//                 onTap: isDownloading && selectedIndex == index
//                     ? null
//                     : () async {
//                   setState(() {
//                     isDownloading = true;
//                     downloadProgress = 0.0;
//                     selectedIndex = index;
//                   });
//
//                   try {
//                     final file = await HttpClient.instance()
//                         .downloadFile(
//                       url: salarySlipList[index].url,
//                       onProgress: (progress) {
//                         log("progress $progress");
//                         setState(() {
//                           downloadProgress = progress;
//                         });
//                       },
//                     );
//
//                     if (file != null) {
//                       log(
//                         "downloaded file path:==========>> ${file.path}",
//                       );
//                       CustomSnackBar.showNormal(
//                         context: context,
//                         message:
//                         "Download completed, File saved at ${file.path}",
//                         actionLabel: "View",
//                         onActionPressed: () {
//                           OpenFilex.open(file.path);
//                         },
//                       );
//                     }
//                   } catch (e) {
//                     CustomSnackBar.showError(
//                       context: context,
//                       message: "Download failed",
//                     );
//                   } finally {
//                     setState(() {
//                       isDownloading = false;
//                     });
//                   }
//                 },
//                 child: isDownloading && selectedIndex == index
//                     ? Text(
//                   'Downloading ${(downloadProgress * 100).toInt()}%',
//                 )
//                     : SvgPicture.asset(
//                   AppImages.downloadIcon,
//                   width: AppSizes.iconSize20,
//                   height: AppSizes.iconSize20,
//                   colorFilter: ColorFilter.mode(
//                     AppColors.primaryColor,
//                     BlendMode.srcIn,
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         );
//       },
//       separatorBuilder: (ctx, index) {
//         return CustomHorizontalDivider();
//       },
//     );
//   }
// }
//
// class SalarySlip {
//   String month;
//   String url;
//   int year;
//
//   SalarySlip({required this.month, required this.year, required this.url});
// }
