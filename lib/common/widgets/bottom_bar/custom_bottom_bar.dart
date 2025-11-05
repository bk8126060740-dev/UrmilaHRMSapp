// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:hrms_uis/common/utils/constants/colors.dart';
//
// class CustomBottomBarItem {
//   CustomBottomBarItem({required this.icon, this.text});
//
//   final dynamic icon;
//   final String? text;
// }
//
// class CustomBottomBar extends StatefulWidget {
//   const CustomBottomBar({
//     super.key,
//     required this.items,
//     this.centerItemText = "",
//     this.height = 60.0,
//     this.iconSize = 20.0,
//     this.backgroundColor = AppColors.primaryColor,
//     required this.color,
//     required this.selectedColor,
//     required this.notchedShape,
//     required this.onTabSelected,
//     this.selectedIndex = 0,
//   }) : assert(items.length == 2 || items.length == 4);
//
//   final List<CustomBottomBarItem> items;
//   final String centerItemText;
//   final double height;
//   final double iconSize;
//   final Color backgroundColor;
//   final Color color;
//   final Color selectedColor;
//   final NotchedShape notchedShape;
//   final ValueChanged<int> onTabSelected;
//   final int selectedIndex;
//
//   @override
//   State<CustomBottomBar> createState() => _CustomBottomBarState();
// }
//
// class _CustomBottomBarState extends State<CustomBottomBar> {
//   void _updateIndex(int index) {
//     widget.onTabSelected(index); // Notify parent when tab is tapped
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final selectedIndex =
//         widget.selectedIndex; // ✅ Use dynamic index from parent
//
//     List<Widget> items = List.generate(widget.items.length, (int index) {
//       return _buildTabItem(
//         item: widget.items[index],
//         index: index,
//         selectedIndex: selectedIndex,
//         onPressed: _updateIndex,
//       );
//     });
//
//     // Insert center placeholder (for FAB notch)
//     items.insert(items.length >> 1, _buildMiddleTabItem());
//
//     return BottomAppBar(
//       padding: EdgeInsets.zero,
//       elevation: 0,
//       color: widget.backgroundColor,
//       child: Row(
//         mainAxisSize: MainAxisSize.max,
//         mainAxisAlignment: MainAxisAlignment.spaceAround,
//         children: items,
//       ),
//     );
//   }
//
//   Widget _buildMiddleTabItem() {
//     return Expanded(
//       child: SizedBox(
//         height: widget.height,
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             SizedBox(height: widget.iconSize),
//             Text(widget.centerItemText, style: TextStyle(color: widget.color)),
//           ],
//         ),
//       ),
//     );
//   }
//
//   Widget _buildTabItem({
//     required CustomBottomBarItem item,
//     required int index,
//     required int selectedIndex,
//     required ValueChanged<int> onPressed,
//   }) {
//     Color color = selectedIndex == index ? widget.selectedColor : widget.color;
//     return Expanded(
//       child: SizedBox(
//         height: widget.height,
//         child: Material(
//           type: MaterialType.transparency,
//           child: InkWell(
//             onTap: () => onPressed(index),
//             child: Column(
//               mainAxisSize: MainAxisSize.min,
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: <Widget>[
//                 _buildDynamicIcon(item.icon, color),
//                 if (item.text != null)
//                   Text(item.text!, style: TextStyle(color: color)),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
//
//   Widget _buildDynamicIcon(dynamic icon, Color color) {
//     // Handles multiple icon types dynamically
//     if (icon is IconData) {
//       return Icon(icon, color: color, size: widget.iconSize);
//     } else if (icon is String) {
//       if (icon.endsWith('.svg')) {
//         return SvgPicture.asset(
//           icon,
//           colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
//           width: widget.iconSize /*+ 4*/,
//           height: widget.iconSize /* + 4*/,
//         );
//       } else if (icon.startsWith('http')) {
//         return Image.network(
//           icon,
//           width: widget.iconSize /*+ 4*/,
//           height: widget.iconSize /*+ 4*/,
//           color: color,
//         );
//       } else {
//         return Image.asset(
//           icon,
//           width: widget.iconSize /*+ 4*/,
//           height: widget.iconSize /*+ 4*/,
//           color: color,
//         );
//       }
//     }
//     return const SizedBox.shrink(); // fallback
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hrms_uis/common/utils/constants/colors.dart';
import 'package:hrms_uis/common/utils/constants/text_styles.dart';

class CustomBottomBarItem {
  CustomBottomBarItem({required this.icon, this.text});

  final dynamic icon;
  final String? text;
}

class CustomBottomBar extends StatefulWidget {
  const CustomBottomBar({
    super.key,
    required this.items,
    this.height = 60.0,
    this.iconSize = 22.0,
    this.backgroundColor = AppColors.primaryColor,
    required this.color,
    required this.selectedColor,
    required this.onTabSelected,
    this.selectedIndex = 0,
  });

  final List<CustomBottomBarItem> items;
  final double height;
  final double iconSize;
  final Color backgroundColor;
  final Color color;
  final Color selectedColor;
  final ValueChanged<int> onTabSelected;
  final int selectedIndex;

  @override
  State<CustomBottomBar> createState() => _CustomBottomBarState();
}

class _CustomBottomBarState extends State<CustomBottomBar> {
  void _updateIndex(int index) {
    widget.onTabSelected(index);
  }

  @override
  Widget build(BuildContext context) {
    final selectedIndex = widget.selectedIndex;

    return BottomAppBar(
      color: widget.backgroundColor,
      elevation: 4,
      padding: EdgeInsets.zero,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: List.generate(widget.items.length, (index) {
          final item = widget.items[index];
          final isSelected = selectedIndex == index;
          final color = isSelected ? widget.selectedColor : widget.color;

          return Expanded(
            child: InkWell(
              onTap: () => index == 0 ? _updateIndex(index) : () {},
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              child: SizedBox(
                height: widget.height,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildDynamicIcon(
                      item.icon,
                      index == 0 ? color : Colors.transparent,
                    ),
                    if (item.text != null) ...[
                      const SizedBox(height: 4),
                      Text(
                        item.text!,
                        style: AppTextStyles.w400_12(context).copyWith(
                          color: index == 0 ? color : Colors.transparent,
                          fontWeight: isSelected
                              ? FontWeight.w600
                              : FontWeight.w400,
                          fontSize: 11
                        ),
                      ),
                    ],
                  ],
                ),
              ),
            ),
          );
        }),
      ),
    );
  }

  Widget _buildDynamicIcon(dynamic icon, Color color) {
    if (icon is IconData) {
      return Icon(icon, color: color, size: widget.iconSize);
    } else if (icon is String) {
      if (icon.endsWith('.svg')) {
        return SvgPicture.asset(
          icon,
          colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
          width: widget.iconSize,
          height: widget.iconSize,
        );
      } else if (icon.startsWith('http')) {
        return Image.network(
          icon,
          width: widget.iconSize,
          height: widget.iconSize,
          color: color,
        );
      } else {
        return Image.asset(
          icon,
          width: widget.iconSize,
          height: widget.iconSize,
          color: color,
        );
      }
    }
    return const SizedBox.shrink();
  }
}
