// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:hrms_uis/common/utils/constants/colors.dart';
// import 'package:hrms_uis/common/utils/constants/image_strings.dart';
// import 'package:hrms_uis/common/utils/constants/sizes.dart';
// import 'package:hrms_uis/common/utils/extensions/extension.dart';
//
// class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
//   final String? title;
//   final String? subtitle;
//
//   // 👤 Avatar
//   final String? avatarImage; // can be asset or network
//   final bool isNetworkImage;
//   final bool showAvatar;
//
//   // 🔙 Leading
//   final bool showBackButton;
//   final Widget? leading;
//
//   // 🧭 Navigation (drawer)
//   final bool showNavigation;
//   final VoidCallback? onNavigationTap;
//
//   // 🗓 Calendar (fixed but optional)
//   final bool showCalendarIcon;
//   final VoidCallback? onCalendarTap;
//
//   // ⚙️ Additional actions
//   final List<Widget>? actions;
//
//   // 🎨 Style
//   final Color backgroundColor;
//   final double elevation;
//   final double height;
//
//   const CustomAppBar({
//     super.key,
//     this.title,
//     this.subtitle,
//     this.avatarImage,
//     this.isNetworkImage = false,
//     this.showAvatar = true,
//     this.showBackButton = false,
//     this.leading,
//     this.showNavigation = false,
//     this.onNavigationTap,
//     this.showCalendarIcon = false,
//     this.onCalendarTap,
//     this.actions,
//     this.backgroundColor = AppColors.bgColor,
//     this.elevation = 2.0,
//     this.height = kToolbarHeight,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return AppBar(
//       backgroundColor: backgroundColor,
//       elevation: elevation,
//       automaticallyImplyLeading: false,
//       titleSpacing: 0,
//       title: Padding(
//         padding: const EdgeInsets.only(left: 12),
//         child: Row(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             // 👈 Leading or Back Button
//             if (leading != null)
//               leading!
//             else if (showBackButton)
//               IconButton(
//                 icon: SvgPicture.asset(
//                   height: 40,
//                   width: 40,
//                   AppImages.backButton,
//                 ),
//                 onPressed: () => Navigator.of(context).maybePop(),
//               ),
//
//             // 👤 Avatar
//             if (showAvatar && avatarImage != null) ...[
//               const SizedBox(width: 8),
//               CircleAvatar(
//                 radius: 20,
//                 backgroundImage: isNetworkImage
//                     ? NetworkImage(avatarImage!)
//                     : AssetImage(avatarImage!) as ImageProvider,
//               ),
//               const SizedBox(width: 10),
//             ],
//
//             // 🧾 Title + Subtitle
//             Expanded(
//               child: (title != null || subtitle != null)
//                   ? Row(
//                       children: [
//                         if (showAvatar == false && avatarImage == null)
//                           AppSizes.space16.hGap,
//                         Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             if (title != null)
//                               Text(
//                                 title!,
//                                 style: const TextStyle(
//                                   fontWeight: FontWeight.w600,
//                                   fontSize: 16,
//                                   color: Colors.black,
//                                 ),
//                                 overflow: TextOverflow.ellipsis,
//                               ),
//                             if (subtitle != null)
//                               Text(
//                                 subtitle!,
//                                 style: const TextStyle(
//                                   color: Colors.grey,
//                                   fontSize: 13,
//                                 ),
//                                 overflow: TextOverflow.ellipsis,
//                               ),
//                           ],
//                         ),
//                       ],
//                     )
//                   : const SizedBox.shrink(),
//             ),
//
//             // 🗓 Calendar icon (optional)
//             if (showCalendarIcon) ...[
//               InkWell(
//                 onTap:
//                     onCalendarTap ??
//                     () {
//                       debugPrint("Calendar tapped");
//                     },
//                 child: SvgPicture.asset(
//                   AppImages.attendanceIcon,
//                   // width: AppSizes.iconSize20,
//                   // height: AppSizes.iconSize20,
//                 ),
//               ),
//               // const SizedBox(width: 12),
//             ],
//
//             // 🧭 Navigation / Drawer icon (optional)
//             if (showNavigation) ...[
//               Builder(
//                 builder: (context) => InkWell(
//                   onTap:
//                       onNavigationTap ??
//                       () => Scaffold.of(context).openDrawer(),
//                   child: SvgPicture.asset(
//                     AppImages.navigationIcon,
//                     width: AppSizes.iconSize20,
//                     height: AppSizes.iconSize20,
//                   ),
//                 ),
//               ),
//               const SizedBox(width: 12),
//             ],
//
//             // ⚙️ Additional actions (if any)
//             if (actions != null && actions!.isNotEmpty) ...[
//               ...actions!.expand((w) => [w, const SizedBox(width: 12)]),
//             ],
//           ],
//         ),
//       ),
//       systemOverlayStyle: const SystemUiOverlayStyle(
//         statusBarColor: AppColors.primaryColor, // status bar color
//         statusBarBrightness: Brightness.light,
//         statusBarIconBrightness: Brightness.dark,
//       ),
//     );
//   }
//
//   @override
//   Size get preferredSize => Size.fromHeight(height);
// }

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hrms_uis/common/utils/constants/colors.dart';
import 'package:hrms_uis/common/utils/constants/image_strings.dart';
import 'package:hrms_uis/common/utils/constants/sizes.dart';
import 'package:hrms_uis/common/widgets/image/custom_image.dart';

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
    this.backgroundColor = AppColors.bgColor,
    this.elevation = 2.0,
    this.height = kToolbarHeight,
  });

  @override
  Widget build(BuildContext context) {
    Widget? leadingWidget;

    // Choose priority for leading element
    if (leading != null) {
      leadingWidget = leading!;
    } else if (showBackButton) {
      leadingWidget = IconButton(
        icon: SvgPicture.asset(AppImages.backButton, height: 40, width: 40),
        onPressed: () => Navigator.of(context).maybePop(),
      );
    } else if (showNavigation) {
      leadingWidget = Builder(
        builder: (context) => IconButton(
          icon: SvgPicture.asset(
            AppImages.navigationIcon,
            width: AppSizes.iconSize20,
            height: AppSizes.iconSize20,
          ),
          onPressed: onNavigationTap ?? () => Scaffold.of(context).openDrawer(),
        ),
      );
    } else if (showAvatar && avatarImage != null) {
      leadingWidget = CustomImage(
        size: 40,
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
                          style: const TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                            color: Colors.black,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      if (subtitle != null)
                        Text(
                          subtitle!,
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 13,
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
      systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarColor: AppColors.primaryColor,
        statusBarBrightness: Brightness.light,
        statusBarIconBrightness: Brightness.dark,
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height);
}
