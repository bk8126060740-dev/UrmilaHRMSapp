import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../constants/colors.dart';

class CustomToast {
  static void showSuccess({required String message}) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 3,
      backgroundColor: AppColors.success,
      textColor: Colors.white,
      fontSize: 14.0,
    );
  }

  static void showError({required String message}) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 3,
      backgroundColor: AppColors.error,
      textColor: Colors.white,
      fontSize: 14.0,
    );
  }

  static void showWarning({required String message}) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 3,
      backgroundColor: AppColors.warning,
      textColor: Colors.white,
      fontSize: 14.0,
    );
  }

  static void showInfo({required String message}) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 3,
      backgroundColor: AppColors.info,
      textColor: Colors.white,
      fontSize: 14.0,
    );
  }
}
