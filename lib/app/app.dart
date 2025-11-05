import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hrms_uis/common/utils/download_feature/bloc/download_bloc.dart';

import '../common/navigation_service/navigation_service.dart';
import '../common/navigation_service/app_routes.dart';
import '../common/utils/app_bloc/app_bloc.dart';
import '../common/utils/constants/constants.dart';
import '../common/utils/hive/hive_service.dart';
import '../common/utils/theme/theme.dart';
import '../l10n/app_localizations.dart';
import 'splash/screens/splash_screen.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AppBloc()
            ..add(
              AppEvent.updateLoginResponse(HiveService.read(kLoginResponseKey)),
            ),
        ),
        BlocProvider(create: (context) => DownloadBloc()),
      ],
      child: const _App(),
    );
  }
}

class _App extends StatelessWidget {
  const _App();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppBloc, AppState>(
      listener: (context, state) {},
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
