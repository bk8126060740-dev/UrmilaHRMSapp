// timer code date time example

// import 'dart:async';
// import 'dart:io';
// import 'dart:ui';
//
// import 'package:device_info_plus/device_info_plus.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_background_service/flutter_background_service.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// import 'package:shared_preferences/shared_preferences.dart';
//
// Future<void> main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await initializeService();
//   runApp(const MyApp());
// }
//
// Future<void> initializeService() async {
//   final service = FlutterBackgroundService();
//
//   /// OPTIONAL, using custom notification channel id
//   const AndroidNotificationChannel channel = AndroidNotificationChannel(
//     'UISLNotificationId', // id
//     'UISLNotificationName', // title
//     description:
//         'This channel is used for important notifications.', // description
//     importance: Importance.low, // importance must be at low or higher level
//   );
//
//   final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
//       FlutterLocalNotificationsPlugin();
//
//   if (Platform.isIOS || Platform.isAndroid) {
//     await flutterLocalNotificationsPlugin.initialize(
//       const InitializationSettings(
//         iOS: DarwinInitializationSettings(),
//         android: AndroidInitializationSettings('ic_bg_service_small'),
//       ),
//     );
//   }
//
//   await flutterLocalNotificationsPlugin
//       .resolvePlatformSpecificImplementation<
//         AndroidFlutterLocalNotificationsPlugin
//       >()
//       ?.createNotificationChannel(channel);
//
//   await service.configure(
//     androidConfiguration: AndroidConfiguration(
//       // this will be executed when app is in foreground or background in separated isolate
//       onStart: onStart,
//
//       // auto start service
//       autoStart: true,
//       isForegroundMode: true,
//       notificationChannelId: 'UISLNotificationId',
//       initialNotificationTitle: 'AWESOME SERVICE',
//       initialNotificationContent: 'Initializing',
//       foregroundServiceNotificationId: 888,
//       foregroundServiceTypes: [AndroidForegroundType.location],
//     ),
//     iosConfiguration: IosConfiguration(
//       // auto start service
//       autoStart: true,
//
//       // this will be executed when app is in foreground in separated isolate
//       onForeground: onStart,
//
//       // you have to enable background fetch capability on xcode project
//       onBackground: onIosBackground,
//     ),
//   );
// }
//
// // to ensure this is executed
// // run app from xcode, then from xcode menu, select Simulate Background Fetch
//
// @pragma('vm:entry-point')
// Future<bool> onIosBackground(ServiceInstance service) async {
//   WidgetsFlutterBinding.ensureInitialized();
//   DartPluginRegistrant.ensureInitialized();
//
//   SharedPreferences preferences = await SharedPreferences.getInstance();
//   await preferences.reload();
//   final log = preferences.getStringList('log') ?? <String>[];
//   log.add(DateTime.now().toIso8601String());
//   await preferences.setStringList('log', log);
//   return true;
// }
//
// @pragma('vm:entry-point')
// void onStart(ServiceInstance service) async {
//   // Only available for flutter 3.0.0 and later
//   DartPluginRegistrant.ensureInitialized();
//
//   // For flutter prior to version 3.0.0
//   // We have to register the plugin manually
//
//   SharedPreferences preferences = await SharedPreferences.getInstance();
//   await preferences.setString("hello", "world");
//
//   /// OPTIONAL when use custom notification
//   final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
//       FlutterLocalNotificationsPlugin();
//
//   if (service is AndroidServiceInstance) {
//     service.on('setAsForeground').listen((event) {
//       service.setAsForegroundService();
//     });
//
//     service.on('setAsBackground').listen((event) {
//       service.setAsBackgroundService();
//     });
//   }
//
//   service.on('stopService').listen((event) {
//     service.stopSelf();
//   });
//
//   // bring to foreground
//   Timer.periodic(const Duration(seconds: 5), (timer) async {
//     if (service is AndroidServiceInstance) {
//       if (await service.isForegroundService()) {
//         /// OPTIONAL for use custom notification
//         /// the notification id must be equals with AndroidConfiguration when you call configure() method.
//         flutterLocalNotificationsPlugin.show(
//           888,
//           'COOL SERVICE',
//           'Awesome ${DateTime.now()}',
//           const NotificationDetails(
//             android: AndroidNotificationDetails(
//               'UISLNotificationId',
//               'UISLNotificationName',
//               icon: 'ic_bg_service_small',
//               ongoing: true,
//             ),
//           ),
//         );
//
//         // if you don't using custom notification, uncomment this
//         // service.setForegroundNotificationInfo(
//         //   title: "My App Service",
//         //   content: "Updated at ${DateTime.now()}",
//         // );
//       }
//     }
//
//     /// you can see this log in logcat
//     debugPrint('FLUTTER BACKGROUND SERVICE: ${DateTime.now()}');
//
//     // test using external plugin
//     final deviceInfo = DeviceInfoPlugin();
//     String? device;
//     if (Platform.isAndroid) {
//       final androidInfo = await deviceInfo.androidInfo;
//       device = androidInfo.model;
//     } else if (Platform.isIOS) {
//       final iosInfo = await deviceInfo.iosInfo;
//       device = iosInfo.model;
//     }
//
//     service.invoke('update', {
//       "current_date": DateTime.now().toIso8601String(),
//       "device": device,
//     });
//   });
// }
//
// class MyApp extends StatefulWidget {
//   const MyApp({Key? key}) : super(key: key);
//
//   @override
//   State<MyApp> createState() => _MyAppState();
// }
//
// class _MyAppState extends State<MyApp> {
//   String text = "Stop Service";
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(title: const Text('Service App')),
//         body: Column(
//           children: [
//             StreamBuilder<Map<String, dynamic>?>(
//               stream: FlutterBackgroundService().on('update'),
//               builder: (context, snapshot) {
//                 if (!snapshot.hasData) {
//                   return const Center(child: CircularProgressIndicator());
//                 }
//
//                 final data = snapshot.data!;
//                 String? device = data["device"];
//                 DateTime? date = DateTime.tryParse(data["current_date"]);
//                 return Column(
//                   children: [Text(device ?? 'Unknown'), Text(date.toString())],
//                 );
//               },
//             ),
//             ElevatedButton(
//               child: const Text("Foreground Mode"),
//               onPressed: () =>
//                   FlutterBackgroundService().invoke("setAsForeground"),
//             ),
//             ElevatedButton(
//               child: const Text("Background Mode"),
//               onPressed: () =>
//                   FlutterBackgroundService().invoke("setAsBackground"),
//             ),
//             ElevatedButton(
//               child: Text(text),
//               onPressed: () async {
//                 final service = FlutterBackgroundService();
//                 var isRunning = await service.isRunning();
//                 isRunning
//                     ? service.invoke("stopService")
//                     : service.startService();
//
//                 setState(() {
//                   text = isRunning ? 'Start Service' : 'Stop Service';
//                 });
//               },
//             ),
//             const Expanded(child: LogView()),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// class LogView extends StatefulWidget {
//   const LogView({Key? key}) : super(key: key);
//
//   @override
//   State<LogView> createState() => _LogViewState();
// }
//
// class _LogViewState extends State<LogView> {
//   late final Timer timer;
//   List<String> logs = [];
//
//   @override
//   void initState() {
//     super.initState();
//     timer = Timer.periodic(const Duration(seconds: 1), (timer) async {
//       final SharedPreferences sp = await SharedPreferences.getInstance();
//       await sp.reload();
//       logs = sp.getStringList('log') ?? [];
//       if (mounted) {
//         setState(() {});
//       }
//     });
//   }
//
//   @override
//   void dispose() {
//     timer.cancel();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return ListView.builder(
//       itemCount: logs.length,
//       itemBuilder: (context, index) {
//         final log = logs.elementAt(index);
//         return Text(log);
//       },
//     );
//   }
// }

/*
import 'dart:async';
import 'dart:io';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_background_service/flutter_background_service.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'package:permission_handler/permission_handler.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

/// Initialize background service configuration
Future<void> initializeService() async {
  final service = FlutterBackgroundService();

  const AndroidNotificationChannel channel = AndroidNotificationChannel(
    'UISLNotificationId',
    'UISL Location Tracking',
    description: 'Tracks user location while checked in.',
    importance: Importance.low,
  );

  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  if (Platform.isAndroid || Platform.isIOS) {
    await flutterLocalNotificationsPlugin.initialize(
      const InitializationSettings(
        iOS: DarwinInitializationSettings(),
        android: AndroidInitializationSettings('ic_bg_service_small'),
      ),
    );
  }

  await flutterLocalNotificationsPlugin
      .resolvePlatformSpecificImplementation<
        AndroidFlutterLocalNotificationsPlugin
      >()
      ?.createNotificationChannel(channel);

  await service.configure(
    androidConfiguration: AndroidConfiguration(
      onStart: onStart,
      autoStart: false,
      // start manually
      isForegroundMode: true,
      notificationChannelId: 'UISLNotificationId',
      initialNotificationTitle: 'HRMS Tracking Service',
      initialNotificationContent: 'Preparing...',
      foregroundServiceNotificationId: 888,
      foregroundServiceTypes: [AndroidForegroundType.location],
    ),
    iosConfiguration: IosConfiguration(
      autoStart: false,
      onForeground: onStart,
      onBackground: onIosBackground,
    ),
  );
}

@pragma('vm:entry-point')
Future<bool> onIosBackground(ServiceInstance service) async {
  WidgetsFlutterBinding.ensureInitialized();
  DartPluginRegistrant.ensureInitialized();
  return true;
}

@pragma('vm:entry-point')
void onStart(ServiceInstance service) async {
  DartPluginRegistrant.ensureInitialized();

  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  service.on('stopService').listen((event) {
    service.stopSelf();
  });

  Timer.periodic(const Duration(seconds: 15), (timer) async {
    final position = await _getCurrentPosition();
    if (position == null) return;

    await _sendLocationToServer(position.latitude, position.longitude);

    flutterLocalNotificationsPlugin.show(
      888,
      'Tracking Active',
      'Lat: ${position.latitude}, Lng: ${position.longitude}',
      const NotificationDetails(
        android: AndroidNotificationDetails(
          'UISLNotificationId',
          'UISL Location Tracking',
          icon: 'ic_bg_service_small',
          ongoing: true,
        ),
      ),
    );

    service.invoke('update', {
      "lat": position.latitude,
      "lng": position.longitude,
      "time": DateTime.now().toIso8601String(),
    });
  });
}

/// Get current GPS position safely
Future<Position?> _getCurrentPosition() async {
  try {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return null;
    }

    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) return null;
    }

    if (permission == LocationPermission.deniedForever) {
      return null;
    }

    return await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );
  } catch (e) {
    debugPrint("Location error: $e");
    return null;
  }
}

/// Dummy API call — replace with your real endpoint
Future<void> _sendLocationToServer(double lat, double lng) async {
  const apiUrl =
      'https://your-server.com/api/update-location'; // 🔁 Replace this
  try {
    final response = await http.post(
      Uri.parse(apiUrl),
      headers: {"Content-Type": "application/json"},
      body: '{"latitude": $lat, "longitude": $lng}',
    );
    debugPrint("API response: ${response.statusCode}");
  } catch (e) {
    debugPrint("API error: $e");
  }
}

/// Ask for permissions before starting service
Future<bool> requestAllPermissions(BuildContext context) async {
  // 1️⃣ Location service enabled?
  bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) {
    await Geolocator.openLocationSettings();
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Please enable Location Services')),
    );
    return false;
  }

  // 2️⃣ Location permissions
  LocationPermission permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied ||
      permission == LocationPermission.deniedForever) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied ||
        permission == LocationPermission.deniedForever) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Location permission is required')),
      );
      return false;
    }
  }

  // 3️⃣ Notification permission (Android 13+)
  if (Platform.isAndroid && (await Permission.notification.isDenied)) {
    final result = await Permission.notification.request();
    if (!result.isGranted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Notification permission is required')),
      );
      return false;
    }
  }

  return true;
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String status = "Service Stopped";

  @override
  void initState() {
    super.initState();
    _checkStatus();
  }

  Future<void> _checkStatus() async {
    final service = FlutterBackgroundService();
    final running = await service.isRunning();
    setState(() => status = running ? "Tracking Active" : "Service Stopped");
  }

  Future<void> _startTracking() async {
    if (await requestAllPermissions(context)) {
      await initializeService();
      await FlutterBackgroundService().startService();
      setState(() => status = "Tracking Active");
    }
  }

  Future<void> _stopTracking() async {
    final service = FlutterBackgroundService();
    service.invoke("stopService");
    setState(() => status = "Service Stopped");
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text("HRMS Tracking")),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Text(
                status,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              StreamBuilder<Map<String, dynamic>?>(
                stream: FlutterBackgroundService().on('update'),
                builder: (context, snapshot) {
                  if (!snapshot.hasData)
                    return const Text("No location yet...");
                  final data = snapshot.data!;
                  return Column(
                    children: [
                      Text("Latitude: ${data['lat']}"),
                      Text("Longitude: ${data['lng']}"),
                      Text("Time: ${data['time']}"),
                    ],
                  );
                },
              ),
              const Spacer(),
              ElevatedButton.icon(
                onPressed: _startTracking,
                icon: const Icon(Icons.login),
                label: const Text("Check In (Start Tracking)"),
              ),
              const SizedBox(height: 10),
              ElevatedButton.icon(
                onPressed: _stopTracking,
                icon: const Icon(Icons.logout),
                label: const Text("Check Out (Stop Tracking)"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
*/

// location tracking code
/*import 'dart:async';
import 'dart:io';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_background_service/flutter_background_service.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final prefs = await SharedPreferences.getInstance();
  final bool wasCheckedIn = prefs.getBool('isCheckedIn') ?? false;

  // Reinitialize service if user was already checked in
  if (wasCheckedIn) {
    await initializeService();
    await FlutterBackgroundService().startService();
  }

  runApp(const MyApp());
}

/// Initialize background service configuration
Future<void> initializeService() async {
  final service = FlutterBackgroundService();

  const AndroidNotificationChannel channel = AndroidNotificationChannel(
    'UISLNotificationId',
    'UISL Location Tracking',
    description: 'Tracks user location while checked in.',
    importance: Importance.low,
  );

  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
  FlutterLocalNotificationsPlugin();

  if (Platform.isAndroid || Platform.isIOS) {
    await flutterLocalNotificationsPlugin.initialize(
      const InitializationSettings(
        iOS: DarwinInitializationSettings(),
        android: AndroidInitializationSettings('ic_bg_service_small'),
      ),
    );
  }

  await flutterLocalNotificationsPlugin
      .resolvePlatformSpecificImplementation<
      AndroidFlutterLocalNotificationsPlugin>()
      ?.createNotificationChannel(channel);

  await service.configure(
    androidConfiguration: AndroidConfiguration(
      onStart: onStart,
      autoStart: false,
      isForegroundMode: true,
      notificationChannelId: 'UISLNotificationId',
      initialNotificationTitle: 'HRMS Tracking Service',
      initialNotificationContent: 'Preparing...',
      foregroundServiceNotificationId: 888,
      foregroundServiceTypes: [AndroidForegroundType.location],
    ),
    iosConfiguration: IosConfiguration(
      autoStart: false,
      onForeground: onStart,
      onBackground: onIosBackground,
    ),
  );
}

@pragma('vm:entry-point')
Future<bool> onIosBackground(ServiceInstance service) async {
  WidgetsFlutterBinding.ensureInitialized();
  DartPluginRegistrant.ensureInitialized();
  return true;
}

@pragma('vm:entry-point')
void onStart(ServiceInstance service) async {
  DartPluginRegistrant.ensureInitialized();

  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
  FlutterLocalNotificationsPlugin();

  service.on('stopService').listen((event) {
    service.stopSelf();
  });

  Timer.periodic(const Duration(seconds: 15), (timer) async {
    final position = await _getCurrentPosition();
    if (position == null) return;

    await _sendLocationToServer(position.latitude, position.longitude);

    flutterLocalNotificationsPlugin.show(
      888,
      'Tracking Active',
      'Lat: ${position.latitude}, Lng: ${position.longitude}',
      const NotificationDetails(
        android: AndroidNotificationDetails(
          'UISLNotificationId',
          'UISL Location Tracking',
          icon: 'ic_bg_service_small',
          ongoing: true,
        ),
      ),
    );

    service.invoke('update', {
      "lat": position.latitude,
      "lng": position.longitude,
      "time": DateTime.now().toIso8601String(),
    });
  });
}

/// Get current GPS position safely
Future<Position?> _getCurrentPosition() async {
  try {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) return null;

    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) return null;
    }

    if (permission == LocationPermission.deniedForever) {
      return null;
    }

    return await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );
  } catch (e) {
    debugPrint("Location error: $e");
    return null;
  }
}

/// Dummy API call — replace with your real endpoint
Future<void> _sendLocationToServer(double lat, double lng) async {
  const apiUrl = 'https://your-server.com/api/update-location'; // 🔁 Replace this
  try {
    final response = await http.post(
      Uri.parse(apiUrl),
      headers: {"Content-Type": "application/json"},
      body: '{"latitude": $lat, "longitude": $lng}',
    );
    debugPrint("API response: ${response.statusCode}");
  } catch (e) {
    debugPrint("API error: $e");
  }
}

/// Ask for permissions before starting service
Future<bool> requestAllPermissions(BuildContext context) async {
  // 1️⃣ Location service enabled?
  bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) {
    await Geolocator.openLocationSettings();
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Please enable Location Services')),
    );
    return false;
  }

  // 2️⃣ Location permissions
  LocationPermission permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied ||
      permission == LocationPermission.deniedForever) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied ||
        permission == LocationPermission.deniedForever) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Location permission is required')),
      );
      return false;
    }
  }

  // 3️⃣ Notification permission (Android 13+)
  if (Platform.isAndroid && (await Permission.notification.isDenied)) {
    final result = await Permission.notification.request();
    if (!result.isGranted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Notification permission is required')),
      );
      return false;
    }
  }

  return true;
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isCheckedIn = false;
  String status = "Service Stopped";

  @override
  void initState() {
    super.initState();
    _loadCheckInState();
  }

  Future<void> _loadCheckInState() async {
    final prefs = await SharedPreferences.getInstance();
    isCheckedIn = prefs.getBool('isCheckedIn') ?? false;
    final service = FlutterBackgroundService();
    final running = await service.isRunning();
    if (isCheckedIn && !running) {
      await initializeService();
      await service.startService();
    }
    setState(() {
      status = isCheckedIn ? "Tracking Active" : "Service Stopped";
    });
  }

  Future<void> _startTracking() async {
    if (await requestAllPermissions(context)) {
      await initializeService();
      await FlutterBackgroundService().startService();
      final prefs = await SharedPreferences.getInstance();
      await prefs.setBool('isCheckedIn', true);
      setState(() {
        isCheckedIn = true;
        status = "Tracking Active";
      });
    }
  }

  Future<void> _stopTracking() async {
    final service = FlutterBackgroundService();
    service.invoke("stopService");
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isCheckedIn', false);
    setState(() {
      isCheckedIn = false;
      status = "Service Stopped";
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text("HRMS Tracking")),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Text(
                status,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              StreamBuilder<Map<String, dynamic>?>(
                stream: FlutterBackgroundService().on('update'),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return const Text("No location yet...");
                  }
                  final data = snapshot.data!;
                  return Column(
                    children: [
                      Text("Latitude: ${data['lat']}"),
                      Text("Longitude: ${data['lng']}"),
                      Text("Time: ${data['time']}"),
                    ],
                  );
                },
              ),
              const Spacer(),
              if (!isCheckedIn)
                ElevatedButton.icon(
                  onPressed: _startTracking,
                  icon: const Icon(Icons.login),
                  label: const Text("Check In (Start Tracking)"),
                ),
              if (isCheckedIn)
                ElevatedButton.icon(
                  onPressed: _stopTracking,
                  icon: const Icon(Icons.logout),
                  label: const Text("Check Out (Stop Tracking)"),
                ),
            ],
          ),
        ),
      ),
    );
  }
}*/

import 'dart:async';
import 'dart:io';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_background_service/flutter_background_service.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final prefs = await SharedPreferences.getInstance();
  final bool wasCheckedIn = prefs.getBool('isCheckedIn') ?? false;

  // Reinitialize service if user was already checked in
  if (wasCheckedIn) {
    await initializeService();
    await FlutterBackgroundService().startService();
  }

  runApp(const MyApp());
}

/// Initialize background service configuration
Future<void> initializeService() async {
  final service = FlutterBackgroundService();

  const AndroidNotificationChannel channel = AndroidNotificationChannel(
    'UISLNotificationId',
    'UISL Location Tracking',
    description: 'Tracks user location while checked in.',
    importance: Importance.low,
  );

  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  if (Platform.isAndroid || Platform.isIOS) {
    await flutterLocalNotificationsPlugin.initialize(
      const InitializationSettings(
        iOS: DarwinInitializationSettings(),
        android: AndroidInitializationSettings('ic_bg_service_small'),
      ),
    );
  }

  await flutterLocalNotificationsPlugin
      .resolvePlatformSpecificImplementation<
        AndroidFlutterLocalNotificationsPlugin
      >()
      ?.createNotificationChannel(channel);

  await service.configure(
    androidConfiguration: AndroidConfiguration(
      onStart: onStart,
      autoStart: false,
      isForegroundMode: true,
      notificationChannelId: 'UISLNotificationId',
      initialNotificationTitle: 'HRMS Tracking Service',
      initialNotificationContent: 'Preparing...',
      foregroundServiceNotificationId: 888,
      foregroundServiceTypes: [AndroidForegroundType.location],
    ),
    iosConfiguration: IosConfiguration(
      autoStart: false,
      onForeground: onStart,
      onBackground: onIosBackground,
    ),
  );
}

@pragma('vm:entry-point')
Future<bool> onIosBackground(ServiceInstance service) async {
  WidgetsFlutterBinding.ensureInitialized();
  DartPluginRegistrant.ensureInitialized();
  return true;
}

@pragma('vm:entry-point')
void onStart(ServiceInstance service) async {
  DartPluginRegistrant.ensureInitialized();

  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  service.on('stopService').listen((event) {
    service.stopSelf();
  });

  Timer.periodic(const Duration(seconds: 15), (timer) async {
    final position = await _getCurrentPosition();
    if (position == null) return;

    await _sendLocationToServer(position.latitude, position.longitude);

    flutterLocalNotificationsPlugin.show(
      888,
      'Tracking Active',
      'Lat: ${position.latitude}, Lng: ${position.longitude}',
      const NotificationDetails(
        android: AndroidNotificationDetails(
          'UISLNotificationId',
          'UISL Location Tracking',
          icon: 'ic_bg_service_small',
          ongoing: true,
        ),
      ),
    );

    service.invoke('update', {
      "lat": position.latitude,
      "lng": position.longitude,
      "time": DateTime.now().toIso8601String(),
    });
  });
}

/// Get current GPS position safely
Future<Position?> _getCurrentPosition() async {
  try {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) return null;

    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) return null;
    }

    if (permission == LocationPermission.deniedForever) {
      return null;
    }

    return await Geolocator.getCurrentPosition(
      locationSettings: LocationSettings(accuracy: LocationAccuracy.high),
    );
  } catch (e) {
    debugPrint("Location error: $e");
    return null;
  }
}

/// Dummy API call — replace with your real endpoint
Future<void> _sendLocationToServer(double lat, double lng) async {
  const apiUrl =
      'https://your-server.com/api/update-location'; // 🔁 Replace this
  try {
    final response = await http.post(
      Uri.parse(apiUrl),
      headers: {"Content-Type": "application/json"},
      body: '{"latitude": $lat, "longitude": $lng}',
    );
    debugPrint("API response: ${response.statusCode}");
  } catch (e) {
    debugPrint("API error: $e");
  }
}

/// Ask for permissions before starting service
Future<bool> requestAllPermissions(BuildContext context) async {
  // 1️⃣ Location service enabled?
  bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) {
    await Geolocator.openLocationSettings();
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Please enable Location Services')),
    );
    return false;
  }

  // 2️⃣ Location permissions
  LocationPermission permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied ||
      permission == LocationPermission.deniedForever) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied ||
        permission == LocationPermission.deniedForever) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Location permission is required')),
      );
      return false;
    }
  }

  // 3️⃣ Notification permission (Android 13+)
  if (Platform.isAndroid && (await Permission.notification.isDenied)) {
    final result = await Permission.notification.request();
    if (!result.isGranted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Notification permission is required')),
      );
      return false;
    }
  }

  return true;
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isCheckedIn = false;
  String status = "Service Stopped";

  @override
  void initState() {
    super.initState();
    _loadCheckInState();
  }

  Future<void> _loadCheckInState() async {
    final prefs = await SharedPreferences.getInstance();
    isCheckedIn = prefs.getBool('isCheckedIn') ?? false;
    final service = FlutterBackgroundService();
    final running = await service.isRunning();
    if (isCheckedIn && !running) {
      await initializeService();
      await service.startService();
    }
    setState(() {
      status = isCheckedIn ? "Tracking Active" : "Service Stopped";
    });
  }

  Future<void> _startTracking() async {
    if (await requestAllPermissions(context)) {
      await initializeService();
      await FlutterBackgroundService().startService();
      final prefs = await SharedPreferences.getInstance();
      await prefs.setBool('isCheckedIn', true);
      setState(() {
        isCheckedIn = true;
        status = "Tracking Active";
      });
    }
  }

  Future<void> _stopTracking() async {
    final service = FlutterBackgroundService();
    service.invoke("stopService");
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isCheckedIn', false);
    setState(() {
      isCheckedIn = false;
      status = "Service Stopped";
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text("HRMS Tracking")),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Text(
                status,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              StreamBuilder<Map<String, dynamic>?>(
                stream: FlutterBackgroundService().on('update'),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return const Text("No location yet...");
                  }
                  final data = snapshot.data!;
                  return Column(
                    children: [
                      Text("Latitude: ${data['lat']}"),
                      Text("Longitude: ${data['lng']}"),
                      Text("Time: ${data['time']}"),
                    ],
                  );
                },
              ),
              const Spacer(),
              if (!isCheckedIn)
                ElevatedButton.icon(
                  onPressed: _startTracking,
                  icon: const Icon(Icons.login),
                  label: const Text("Check In (Start Tracking)"),
                ),
              if (isCheckedIn)
                ElevatedButton.icon(
                  onPressed: _stopTracking,
                  icon: const Icon(Icons.logout),
                  label: const Text("Check Out (Stop Tracking)"),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
