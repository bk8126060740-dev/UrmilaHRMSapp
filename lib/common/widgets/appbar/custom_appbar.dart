import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hrms_uis/common/utils/constants/colors.dart';
import 'package:hrms_uis/common/utils/constants/image_strings.dart';
import 'package:hrms_uis/common/utils/constants/sizes.dart';
import 'package:hrms_uis/common/widgets/image/custom_image.dart';

import '../../utils/constants/text_styles.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final String? subtitle;

  // 👤 Avatar
  final String? avatarImage;
  final bool isNetworkImage;
  final bool showAvatar;

  // 🔙 Back button
  final bool showBackButton;

  // 🧭 Navigation (drawer)
  final bool showNavigation;
  final VoidCallback? onNavigationTap;

  // 📅 Calendar
  final bool showCalendarIcon;
  final VoidCallback? onCalendarTap;

  // ⚙️ Custom leading + actions
  final Widget? leading;
  final List<Widget>? actions;

  // 🎨 Style
  final Color backgroundColor;
  final double elevation;
  final double height;
  final Color titleTextColor;
  final Color subTitleTextColor;

  const CustomAppBar({
    super.key,
    this.title,
    this.subtitle,
    this.avatarImage,
    this.isNetworkImage = false,
    this.showAvatar = false,
    this.showBackButton = false,
    this.leading,
    this.showNavigation = false,
    this.onNavigationTap,
    this.showCalendarIcon = false,
    this.onCalendarTap,
    this.actions,
    this.backgroundColor = AppColors.primaryColor,
    this.elevation = 0.0,
    this.height = kToolbarHeight,
    this.titleTextColor = AppColors.whiteTextColor,
    this.subTitleTextColor = AppColors.lightWhiteTextColor,
  });

  @override
  Widget build(BuildContext context) {
    Widget? leadingWidget;

    // Choose priority for leading element
    if (leading != null) {
      leadingWidget = leading!;
    } else if (showBackButton) {
      leadingWidget = IconButton(
        icon: SvgPicture.asset(
          colorFilter: ColorFilter.mode(
            AppColors.whiteIconColor,
            BlendMode.srcIn,
          ),
          AppImages.backButton,
          height: 40,
          width: 40,
        ),
        onPressed: () => Navigator.of(context).maybePop(),
      );
    } else if (showNavigation) {
      leadingWidget = Builder(
        builder: (context) => IconButton(
          icon: SvgPicture.asset(
            AppImages.navigationIcon,
            width: AppSizes.iconSize20,
            height: AppSizes.iconSize20,
            colorFilter: ColorFilter.mode(
              AppColors.whiteIconColor,
              BlendMode.srcIn,
            ),
          ),
          onPressed: onNavigationTap ?? () => Scaffold.of(context).openDrawer(),
        ),
      );
    } else if (showAvatar && avatarImage != null) {
      leadingWidget = CustomImage(
        size: 35,
        imageUrl: avatarImage ?? AppImages.profileImage,
      );
    }

    return AppBar(
      backgroundColor: backgroundColor,
      elevation: elevation,
      automaticallyImplyLeading: false,
      titleSpacing: 0,
      title: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          if (leadingWidget != null) ...[
            const SizedBox(width: 8),
            leadingWidget,
            const SizedBox(width: 12),
          ],
          Expanded(
            child: (title != null || subtitle != null)
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      if (title != null)
                        Text(
                          title!,
                          style: AppTextStyles.w500_16(
                            context,
                            color: titleTextColor,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      if (subtitle != null)
                        Text(
                          subtitle!,
                          style: AppTextStyles.w400_12(
                            context,
                            color: subTitleTextColor,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                    ],
                  )
                : const SizedBox.shrink(),
          ),
          if (showCalendarIcon)
            InkWell(
              onTap: onCalendarTap ?? () => debugPrint("Calendar tapped"),
              child: SvgPicture.asset(AppImages.attendanceIcon),
            ),
          if (actions != null && actions!.isNotEmpty) ...[
            const SizedBox(width: 12),
            ...actions!.expand((w) => [w, const SizedBox(width: 12)]),
          ],
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height);
}
