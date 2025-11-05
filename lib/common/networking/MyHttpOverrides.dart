import 'dart:io';

// for by passing url-------------->>
class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port) {
        // Custom hostname verification logic
        if (host.contains("")) {
          return true; // Bypass verification
        }
        return false; // Fail verification
      };
  }
}
