import 'package:flutter/material.dart';

class NavigationService {
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  static Future<T?>? navigateTo<T>(String routeName, {Object? arguments}) {
    return navigatorKey.currentState?.pushNamed<T>(
      routeName,
      arguments: arguments,
    );
  }

  static void goBack<T extends Object?>([T? result]) {
    if (navigatorKey.currentState?.canPop() ?? false) {
      navigatorKey.currentState?.pop(result);
    }
  }

  static Future<T?>? navigateAndReplace<T, TO extends Object?>(
    String routeName, {
    Object? arguments,
  }) {
    return navigatorKey.currentState?.pushReplacementNamed<T, TO>(
      routeName,
      arguments: arguments,
    );
  }

  static Future<T?>? navigateAndRemoveAll<T>(
    String routeName, {
    Object? arguments,
  }) {
    return navigatorKey.currentState?.pushNamedAndRemoveUntil<T>(
      routeName,
      (route) => false,
      arguments: arguments,
    );
  }

  static Future<T?>? navigateAndRemoveUntil<T>(
    String newRoute,
    String existingRoute,
  ) {
    return navigatorKey.currentState?.pushNamedAndRemoveUntil<T>(
      newRoute,
      ModalRoute.withName(existingRoute),
    );
  }

  static void popUntilFirst() {
    navigatorKey.currentState?.popUntil((route) => route.isFirst);
  }
}
