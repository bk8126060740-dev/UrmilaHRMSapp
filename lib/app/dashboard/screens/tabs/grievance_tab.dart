import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hrms_uis/app/attendance/screens/employee/daily_attendance_screen.dart';
import 'package:hrms_uis/common/navigation_service/navigation_service.dart';
import 'package:hrms_uis/common/utils/app_bloc/app_bloc.dart';
import 'package:hrms_uis/common/utils/constants/image_strings.dart';
import 'package:hrms_uis/common/utils/extensions/extension.dart';
import 'package:hrms_uis/common/widgets/placeholder/coming_soon_screen.dart';
import 'package:lottie/lottie.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../common/utils/constants/colors.dart';
import '../../../../common/utils/constants/sizes.dart';
import '../../../../common/widgets/appbar/custom_appbar.dart';
import '../../../../common/widgets/text_field/custom_text_field.dart';

class GrievanceTab extends StatefulWidget {
  const GrievanceTab({super.key});

  @override
  State<GrievanceTab> createState() => _GrievanceTabState();
}

class _GrievanceTabState extends State<GrievanceTab> {
  bool hasInternet = true;
  bool hasData = true;
  bool isLoading = false;
  final TextEditingController _searchController = TextEditingController();

  Future<void> _refreshData() async {
    await Future.delayed(const Duration(seconds: 2));
  }

  @override
  Widget build(BuildContext context) {
    var appBloc = context.read<AppBloc>();
    return Scaffold(
      // backgroundColor: Colors.white,
      appBar: CustomAppBar(
        elevation: 0,
        title:
            '${appBloc.state.userProfileModel?.firstName ?? ""} ${appBloc.state.userProfileModel?.lastName ?? ""}',
        subtitle: appBloc.state.userProfileModel?.designationName ?? "",
        avatarImage: AppImages.logo,
        showAvatar: true,
        showBackButton: false,
        showNavigation: true,
        showCalendarIcon: true,
        onCalendarTap: () {
          NavigationService.navigateTo(DailyAttendanceScreen.route);
        },
        onNavigationTap: () {
          Scaffold.of(context).openDrawer();
        },
      ),
      body: hasInternet ? _buildMainLayout() : _buildNoInternetLayout(),
    );
  }

  // ----------------------------------------
  // 📶 NO INTERNET LAYOUT
  // ----------------------------------------
  Widget _buildNoInternetLayout() {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/iv_bg.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/images/iv_internet.png', height: 300),
          const SizedBox(height: 20),
          const Text(
            'No Internet...',
            style: TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 10),
          const Text(
            'Slow or no internet connection.\nPlease check your internet connection.',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.grey, fontSize: 16),
          ),
          const SizedBox(height: 20),
          GestureDetector(
            onTap: () => setState(() => hasInternet = true),
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 30),
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(10),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black26,
                    offset: Offset(0, 2),
                    blurRadius: 6,
                  ),
                ],
              ),
              child: const Center(
                child: Text(
                  'Try Again',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ----------------------------------------
  // 📋 MAIN PAGE LAYOUT
  // ----------------------------------------
  Widget _buildMainLayout() {
    return ComingSoonScreen();
    // return RefreshIndicator(
    //   onRefresh: _refreshData,
    //   child: ListView(
    //     physics: const AlwaysScrollableScrollPhysics(),
    //     children: [const SizedBox(height: 10), _buildMainContent()],
    //   ),
    // );
  }

  // ----------------------------------------
  // 🔍 SEARCH + MAIN CONTENT
  // ----------------------------------------
  Widget _buildMainContent() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppSizes.padding20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Grievance Tickets",
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 18,
              color: Colors.black,
            ),
          ),
          AppSizes.space12.vGap,
          Align(
            alignment: Alignment.centerLeft,
            child: SvgPicture.asset(
              AppImages.patternLineIcon,
              height: 4,
              width: 5,
            ),
          ),
          AppSizes.space12.vGap,
          // Search bar
          CustomTextField.outlineBorder(
            controller: _searchController,
            // validator: (val) => emptyValidator(val, title: context.loc.userId),
            onChanged: (value) {
              // if (widget.formKey.currentState!.validate()) {}
            },
            hintText: context.loc.search,
            prefixIcon: Icon(
              size: AppSizes.iconSize20,
              Icons.search,
              color: AppColors.iconColor,
            ),
          ),
          AppSizes.space12.vGap,
          // Loading / No Data / Main List
          if (isLoading)
            _buildShimmerList()
          else if (!hasData)
            _buildNoDataLayout()
          else
            _buildListItems(),
        ],
      ),
    );
  }

  // ----------------------------------------
  // ✨ SHIMMER PLACEHOLDER
  // ----------------------------------------
  Widget _buildShimmerList() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Shimmer.fromColors(
        baseColor: Colors.grey.shade300,
        highlightColor: Colors.grey.shade100,
        child: Column(
          children: List.generate(
            4,
            (index) => Container(
              height: 160,
              margin: const EdgeInsets.only(bottom: 15),
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
        ),
      ),
    );
  }

  // ----------------------------------------
  // 📦 MAIN LIST CONTENT
  // ----------------------------------------
  Widget _buildListItems() {
    return ListView.builder(
      itemCount: 5,
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (context, index) => Container(
        margin: const EdgeInsets.symmetric(vertical: 8),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 6,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Text(
          "Ticket #${index + 1} details here",
          style: const TextStyle(fontSize: 16),
        ),
      ),
    );
  }

  // ----------------------------------------
  // 📭 NO DATA VIEW
  // ----------------------------------------
  Widget _buildNoDataLayout() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Lottie.asset('assets/lottie/no_data.json', height: 150),
        const SizedBox(height: 10),
        const Text(
          "No Ticket Found",
          style: TextStyle(
            fontSize: 18,
            color: Colors.black,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
