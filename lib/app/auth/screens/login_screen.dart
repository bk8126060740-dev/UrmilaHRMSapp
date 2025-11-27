import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:hrms_uis/common/utils/constants/colors.dart';
import 'package:hrms_uis/common/widgets/custom/custom_base_screen.dart';

import '../widgets/login/login_content.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  static const route = '/loginScreen';

  @override
  Widget build(BuildContext context) {
    return _LoginScreen();
  }
}

class _LoginScreen extends StatefulWidget {
  const _LoginScreen();

  @override
  State<_LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<_LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) {
        if (!didPop) {
          // Handle back press manually
          // Example: show confirmation dialog
          log('Back pressed, but not popped.');
        } else {
          // You can also access the navigation result if needed
          log('Popped with result: $result');
        }
      },
      child: CustomBaseScreen(
        backgroundColor: AppColors.bgColor,
        body: LoginContent(formKey: _formKey),
      ),
    );
  }
}
