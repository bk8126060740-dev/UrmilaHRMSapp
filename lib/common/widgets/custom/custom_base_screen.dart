import 'package:flutter/material.dart';

import '../../utils/constants/image_strings.dart';
import '../../utils/helpers/device_utility.dart';

class CustomBaseScreen extends StatelessWidget {
  final PreferredSizeWidget? appBar;
  final Widget? body;
  final Widget? child; // shortcut if you only pass one widget
  final Widget? floatingActionButton;
  final FloatingActionButtonLocation? floatingActionButtonLocation;
  final FloatingActionButtonAnimator? floatingActionButtonAnimator;
  final List<Widget>? persistentFooterButtons;
  final Widget? bottomNavigationBar;
  final Widget? bottomSheet;
  final Color? backgroundColor;
  final bool resizeToAvoidBottomInset;
  final bool extendBody;
  final bool extendBodyBehindAppBar;
  final Widget? drawer;
  final Widget? endDrawer;
  final Padding? contentPadding;

  const CustomBaseScreen({
    super.key,
    this.appBar,
    this.body,
    this.child,
    this.floatingActionButton,
    this.floatingActionButtonLocation,
    this.floatingActionButtonAnimator,
    this.persistentFooterButtons,
    this.bottomNavigationBar,
    this.bottomSheet,
    this.backgroundColor,
    this.resizeToAvoidBottomInset = true,
    this.extendBody = true,
    this.extendBodyBehindAppBar = true,
    this.drawer,
    this.endDrawer,
    this.contentPadding,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor ?? Colors.transparent,
      appBar: appBar,
      drawer: drawer,
      endDrawer: endDrawer,
      body: Stack(
        children: [
          // 🌄 Background Image
          Image.asset(
            width: AppDeviceUtils.getScreenWidth(context),
            height: AppDeviceUtils.getScreenHeight(context),
            AppImages.loginBg,
            fit: BoxFit.fill,
          ),
          SafeArea(child: body ?? child ?? const SizedBox.shrink()),
        ],
      ),
      floatingActionButton: floatingActionButton,
      floatingActionButtonLocation: floatingActionButtonLocation,
      floatingActionButtonAnimator: floatingActionButtonAnimator,
      persistentFooterButtons: persistentFooterButtons,
      bottomNavigationBar: bottomNavigationBar,
      bottomSheet: bottomSheet,
      resizeToAvoidBottomInset: resizeToAvoidBottomInset,
      extendBody: extendBody,
      // extendBodyBehindAppBar: extendBodyBehindAppBar,
    );
  }
}
