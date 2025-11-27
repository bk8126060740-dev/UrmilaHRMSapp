import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:hrms_uis/app/app_dependencies.dart';

import 'app/app.dart';
import 'common/utils/constants/colors.dart';
import 'common/utils/hive/hive_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Plugin must be initialized before using
  await FlutterDownloader.initialize(
    debug: true, // optional: set to false to disable printing logs to console (default: true)
    ignoreSsl:
        true, // option: set to false to disable working with http links (default: false)
  );

  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: AppColors.primaryColor, // your primary
      statusBarIconBrightness: Brightness.light, // Android icons -> white
      statusBarBrightness: Brightness.dark,
    ),
  );

  // Set preferred orientations
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  // Initialize Hive
  await HiveService.init();

  // Run the app
  runApp(AppDependencies(child: App()));
}
