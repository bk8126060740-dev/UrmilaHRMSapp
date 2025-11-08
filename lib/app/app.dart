import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hrms_uis/app/splash/screens/splash_screen.dart';
import '../common/navigation_service/app_routes.dart';
import '../common/navigation_service/navigation_service.dart';
import '../common/utils/app_bloc/app_bloc.dart';
import '../common/utils/theme/theme.dart';
import '../l10n/app_localizations.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppBloc, AppState>(
      builder: (context, state) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          supportedLocales: AppLocalizations.supportedLocales,
          locale: const Locale('en'),
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          theme: CustomAppTheme.lightTheme,
          darkTheme: CustomAppTheme.darkTheme,
          initialRoute: SplashScreen.route,
          onGenerateRoute: AppRoutes.generateRoute,
          navigatorKey: NavigationService.navigatorKey,
        );
      },
    );
  }
}
