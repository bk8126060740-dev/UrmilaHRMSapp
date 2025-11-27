import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../utils/constants/colors.dart';
import '../../utils/constants/text_styles.dart';

class CustomTabBarScreen extends StatelessWidget {
  final List<Widget> tabs;
  final List<Widget> tabViews;

  // TabBar Properties (all optional)
  final TabController? controller;
  final bool isScrollable;
  final EdgeInsetsGeometry? padding;
  final Color? indicatorColor;
  final bool automaticIndicatorColorAdjustment;
  final double indicatorWeight;
  final EdgeInsetsGeometry indicatorPadding;
  final Decoration? indicator;
  final TabBarIndicatorSize? indicatorSize;
  final Color? dividerColor;
  final double? dividerHeight;
  final Color? labelColor;
  final TextStyle? labelStyle;
  final EdgeInsetsGeometry? labelPadding;
  final Color? unselectedLabelColor;
  final TextStyle? unselectedLabelStyle;
  final DragStartBehavior dragStartBehavior;
  final WidgetStateProperty<Color?>? overlayColor;
  final MouseCursor? mouseCursor;
  final bool? enableFeedback;
  final ValueChanged<int>? onTap;
  final TabValueChanged<bool>? onHover;
  final TabValueChanged<bool>? onFocusChange;
  final ScrollPhysics? physics;
  final InteractiveInkFeatureFactory? splashFactory;
  final BorderRadius? splashBorderRadius;
  final TabAlignment? tabAlignment;
  final TextScaler? textScaler;
  final TabIndicatorAnimation? indicatorAnimation;

  const CustomTabBarScreen({
    super.key,
    required this.tabs,
    required this.tabViews,
    this.controller,
    this.isScrollable = false,
    this.padding,
    this.indicatorColor,
    this.automaticIndicatorColorAdjustment = true,
    this.indicatorWeight = 2.0,
    this.indicatorPadding = EdgeInsets.zero,
    this.indicator,
    this.indicatorSize,
    this.dividerColor,
    this.dividerHeight,
    this.labelColor,
    this.labelStyle,
    this.labelPadding,
    this.unselectedLabelColor,
    this.unselectedLabelStyle,
    this.dragStartBehavior = DragStartBehavior.start,
    this.overlayColor,
    this.mouseCursor,
    this.enableFeedback,
    this.onTap,
    this.onHover,
    this.onFocusChange,
    this.physics,
    this.splashFactory,
    this.splashBorderRadius,
    this.tabAlignment,
    this.textScaler,
    this.indicatorAnimation,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: padding ?? EdgeInsets.zero,
          child: TabBar(
            tabs: tabs,
            controller: controller,
            isScrollable: isScrollable,
            automaticIndicatorColorAdjustment:
                automaticIndicatorColorAdjustment,
            indicatorWeight: indicatorWeight,
            indicatorPadding: indicatorPadding,
            // dividerColor: dividerColor,
            dividerHeight: dividerHeight,
            labelPadding: labelPadding,
            unselectedLabelStyle: unselectedLabelStyle,
            dragStartBehavior: dragStartBehavior,
            overlayColor: overlayColor,
            mouseCursor: mouseCursor,
            enableFeedback: enableFeedback,
            onTap: onTap,
            onHover: onHover,
            onFocusChange: onFocusChange,
            splashFactory: splashFactory,
            splashBorderRadius: splashBorderRadius,
            tabAlignment: tabAlignment,
            textScaler: textScaler,
            indicatorAnimation: indicatorAnimation,
            dividerColor: dividerColor ?? AppColors.surfaceBorderColor,
            indicatorColor: indicatorColor ?? AppColors.primaryColor,
            labelStyle: labelStyle ?? AppTextStyles.w400_14(context),
            labelColor: labelColor ?? AppColors.primaryColor,
            indicator: indicator,
            unselectedLabelColor:
                unselectedLabelColor ?? AppColors.secondaryTextColor,
            indicatorSize: indicatorSize ?? TabBarIndicatorSize.tab,
          ),
        ),

        Expanded(
          child: TabBarView(
            controller: controller,
            physics: physics ?? const NeverScrollableScrollPhysics(),
            children: tabViews,
          ),
        ),
      ],
    );
  }
}
