import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hrms_uis/app/dashboard/screens/dashboard_screen.dart';
import 'package:hrms_uis/common/utils/constants/sizes.dart';
import 'package:hrms_uis/common/widgets/custom/custom_base_screen.dart';

import '../../../common/navigation_service/navigation_service.dart';
import '../../../common/utils/app_bloc/app_bloc.dart';
import '../../../common/widgets/custom/app_logo.dart';
import '../../auth/screens/login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  static const String route = '/splash_screen';

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _navigateToNextScreen();
    });
  }

  /// Navigates to the next screens depending on the app state
  void _navigateToNextScreen() {
    Future.delayed(const Duration(milliseconds: 1000), () {
      if (mounted) {
        NavigationService.navigateAndRemoveAll(
          context.read<AppBloc>().state.loginResponse == null
              ? LoginScreen.route
              : DashboardScreen.route,
        );
      }
    });
  }

  /// Builds the splash screens UI
  @override
  Widget build(BuildContext context) {
    return CustomBaseScreen(
      body: AppLogo(
        width: AppSizes.imageSize150,
        height: AppSizes.imageSize150,
      ),
    );
  }
}
