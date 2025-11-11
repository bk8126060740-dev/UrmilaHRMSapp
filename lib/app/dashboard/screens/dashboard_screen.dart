// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:hrms_uis/app/dashboard/bloc/dashboard_bloc.dart';
// import 'package:hrms_uis/app/dashboard/screens/drawer/side_drawer.dart';
// import 'package:hrms_uis/app/dashboard/screens/tabs/monthly_attendance_tab.dart';
// import 'package:hrms_uis/app/dashboard/screens/tabs/grievance_tab.dart';
// import 'package:hrms_uis/common/utils/constants/colors.dart';
// import 'package:hrms_uis/common/utils/constants/image_strings.dart';
// import 'package:hrms_uis/common/widgets/loader/custom_circular_progress.dart';
// import '../../../common/utils/app_bloc/app_bloc.dart';
// import '../../../common/widgets/bottom_bar/custom_bottom_bar.dart';
//
// class DashboardScreen extends StatefulWidget {
//   const DashboardScreen({super.key, this.initialIndex = 0});
//
//   static const route = '/dashboardScreen';
//   final int initialIndex;
//
//   @override
//   State<DashboardScreen> createState() => _DashboardScreenState();
// }
//
// class _DashboardScreenState extends State<DashboardScreen> {
//   final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
//
//   Widget _getBody(int index) {
//     switch (index) {
//       case 0:
//         return MonthlyAttendanceTab();
//       case 1:
//         return GrievanceTab();
//       default:
//         return const SizedBox.shrink();
//     }
//   }
//
//   @override
//   void initState() {
//     // When the screen builds, ensure the AppBloc has correct initial index
//     final appBloc = context.read<AppBloc>();
//
//     // Keep bloc consistent (if needed)
//     appBloc.add(AppEvent.updateTabIndex(tabIndex: widget.initialIndex));
//
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       key: scaffoldKey,
//       drawer: const SideDrawer(),
//       body: SafeArea(
//         child: MultiBlocListener(
//           listeners: [
//             /// Listen to DashboardBloc events for profile/user updates
//             BlocListener<DashboardBloc, DashboardState>(
//               listener: (context, state) {
//                 if (state.status == DashboardStatus.userSuccess) {
//                   context.read<AppBloc>().add(
//                     AppEvent.updateUserResponse(state.userResponseModel),
//                   );
//                 }
//
//                 if (state.status == DashboardStatus.profileSuccess) {
//                   context.read<AppBloc>().add(
//                     AppEvent.updateUserProfileData(state.userProfileDataModel),
//                   );
//                 }
//               },
//             ),
//           ],
//           child: BlocBuilder<DashboardBloc, DashboardState>(
//             builder: (context, dashboardState) {
//               if (dashboardState.userProfileLoading ||
//                   dashboardState.userResponseLoading) {
//                 return const Center(child: CustomCircularProgress());
//               }
//
//               // Reactively listen to tab index changes from AppBloc
//               return BlocBuilder<AppBloc, AppState>(
//                 buildWhen: (prev, curr) =>
//                     prev.currentTabIndex != curr.currentTabIndex,
//                 builder: (context, appState) {
//                   return _getBody(appState.currentTabIndex);
//                 },
//               );
//             },
//           ),
//         ),
//       ),
//       bottomNavigationBar: BlocBuilder<AppBloc, AppState>(
//         buildWhen: (prev, curr) => prev.currentTabIndex != curr.currentTabIndex,
//         builder: (context, appState) {
//           final dashboardState = context.watch<DashboardBloc>().state;
//
//           return AbsorbPointer(
//             absorbing:
//                 dashboardState.userProfileLoading ||
//                 dashboardState.userResponseLoading,
//             child: CustomBottomBar(
//               backgroundColor: AppColors.secondaryColor,
//               color: AppColors.iconColor,
//               selectedColor: AppColors.primaryColor,
//               notchedShape: const CircularNotchedRectangle(),
//               selectedIndex: appState.currentTabIndex,
//               onTabSelected: (index) {
//                 context.read<AppBloc>().add(
//                   AppEvent.updateTabIndex(tabIndex: index),
//                 );
//               },
//               items: [
//                 CustomBottomBarItem(icon: AppImages.calenderIcon),
//                 CustomBottomBarItem(icon: AppImages.budgetIcon),
//               ],
//             ),
//           );
//         },
//       ),
//       floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
//       floatingActionButton: InkWell(
//         child: SvgPicture.asset(width: 70, height: 70, AppImages.addFabIcon),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hrms_uis/app/dashboard/bloc/dashboard_bloc.dart';
import 'package:hrms_uis/app/dashboard/screens/drawer/side_drawer.dart';
import 'package:hrms_uis/app/dashboard/screens/tabs/grievance_tab.dart';
import 'package:hrms_uis/app/dashboard/screens/tabs/home_tab.dart';
import 'package:hrms_uis/common/utils/constants/colors.dart';
import 'package:hrms_uis/common/utils/constants/image_strings.dart';
import 'package:hrms_uis/common/utils/global_internet_check/network_observer.dart';
import 'package:hrms_uis/common/widgets/loader/custom_circular_progress.dart';

import '../../../common/navigation_service/navigation_service.dart';
import '../../../common/utils/app_bloc/app_bloc.dart';
import '../../../common/widgets/appbar/custom_appbar.dart';
import '../../../common/widgets/bottom_bar/custom_bottom_bar.dart';
import '../../attendance/screens/daily_attendance_screen.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key, this.initialIndex = 0});

  static const route = '/dashboardScreen';
  final int initialIndex;

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  Widget _getBody(int index) {
    switch (index) {
      case 0:
        return HomeTab();
      case 1:
        return GrievanceTab();
      default:
        return const SizedBox.shrink();
    }
  }

  @override
  void initState() {
    // When the screen builds, ensure the AppBloc has correct initial index
    final appBloc = context.read<AppBloc>();

    // Keep bloc consistent (if needed)
    appBloc.add(AppEvent.updateTabIndex(tabIndex: widget.initialIndex));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppBloc, AppState>(
      builder: (_, appState) {
        return BlocBuilder<DashboardBloc, DashboardState>(
          builder: (_, dashboardState) {
            return NetworkObserver(
              onRetry: () {
                context.read<DashboardBloc>().add(
                  DashboardEvent.getUserProfileData(),
                );
              },
              child: Scaffold(
                key: scaffoldKey,
                appBar: CustomAppBar(
                  elevation: 0,
                  showCalendarIcon: false,
                  onCalendarTap: () {
                    if (dashboardState.userProfileLoading) {
                      return;
                    }
                    NavigationService.navigateTo(DailyAttendanceScreen.route);
                  },
                  onNavigationTap: () {
                    if (dashboardState.userProfileLoading) {
                      return;
                    }
                    scaffoldKey.currentState?.openDrawer();

                    // Scaffold.of(context).openDrawer();
                  },
                  title:
                      '${appState.userProfileModel?.firstName ?? ""} ${appState.userProfileModel?.lastName ?? ""}',
                  subtitle: appState.userProfileModel?.designationName ?? "",
                  avatarImage: AppImages.logo,
                  showAvatar: true,
                  showBackButton: false,
                  showNavigation: true,
                ),
                drawer: const SideDrawer(),
                body: SafeArea(
                  child: MultiBlocListener(
                    listeners: [
                      /// Listen to DashboardBloc events for profile/user updates
                      BlocListener<DashboardBloc, DashboardState>(
                        listener: (context, state) {
                          if (state.status == DashboardStatus.profileSuccess) {
                            context.read<AppBloc>().add(
                              AppEvent.updateUserProfileData(
                                state.userProfileDataModel,
                              ),
                            );
                          }
                        },
                      ),
                    ],
                    child: BlocBuilder<DashboardBloc, DashboardState>(
                      builder: (context, dashboardState) {
                        if (dashboardState.userProfileLoading) {
                          return const Center(child: CustomCircularProgress());
                        }

                        // Reactively listen to tab index changes from AppBloc
                        return BlocBuilder<AppBloc, AppState>(
                          buildWhen: (prev, curr) =>
                              prev.currentTabIndex != curr.currentTabIndex,
                          builder: (context, appState) {
                            return _getBody(appState.currentTabIndex);
                          },
                        );
                      },
                    ),
                  ),
                ),
                bottomNavigationBar: BlocBuilder<AppBloc, AppState>(
                  buildWhen: (prev, curr) =>
                      prev.currentTabIndex != curr.currentTabIndex,
                  builder: (context, appState) {
                    final dashboardState = context.watch<DashboardBloc>().state;

                    return AbsorbPointer(
                      absorbing: dashboardState.userProfileLoading,
                      child: CustomBottomBar(
                        backgroundColor: AppColors.secondaryColor,
                        color: AppColors.iconColor,
                        selectedColor: AppColors.primaryColor,
                        selectedIndex: appState.currentTabIndex,
                        onTabSelected: (index) {
                          context.read<AppBloc>().add(
                            AppEvent.updateTabIndex(tabIndex: index),
                          );
                        },
                        items: [
                          CustomBottomBarItem(
                            icon: AppImages.calenderIcon,
                            text: "Home",
                          ),
                          CustomBottomBarItem(
                            icon: AppImages.calenderIcon,
                            text: "Home",
                          ),
                          CustomBottomBarItem(
                            icon: AppImages.calenderIcon,
                            text: "Home",
                          ),
                          CustomBottomBarItem(
                            icon: AppImages.calenderIcon,
                            text: "Home",
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            );
          },
        );
      },
    );
  }
}
