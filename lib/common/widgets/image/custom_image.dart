// import 'dart:developer';
//
// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:hrms_uis/common/utils/constants/image_strings.dart';
// import 'package:shimmer/shimmer.dart';
//
// import 'full_screen_image_preview.dart';
//
// class CustomImage extends StatelessWidget {
//   /// Image source (can be URL or asset path)
//   final String imageUrl;
//
//   /// Optional placeholder or fallback image asset
//   final String? fallbackAsset;
//
//   /// If true, displays a circular avatar
//   final bool isCircular;
//
//   /// Image size (radius for circular, width for square)
//   final double size;
//
//   /// Optional border color & width
//   final Color? borderColor;
//   final double borderWidth;
//
//   /// Optional background color
//   final Color? backgroundColor;
//
//   /// Whether to use shimmer while loading (for network)
//   final bool useShimmer;
//
//   /// Fit of the image
//   final BoxFit fit;
//
//   const CustomImage({
//     super.key,
//     required this.imageUrl,
//     this.fallbackAsset,
//     this.isCircular = true,
//     this.size = 40,
//     this.borderColor,
//     this.borderWidth = 0,
//     this.backgroundColor,
//     this.useShimmer = false,
//     this.fit = BoxFit.cover,
//   });
//
//   bool get _isNetwork => imageUrl.startsWith('https');
//
//   bool get _isSvg => imageUrl.toLowerCase().endsWith('.svg');
//
//   @override
//   Widget build(BuildContext context) {
//     log("image by ui ${imageUrl}");
//     final borderRadius = BorderRadius.circular(isCircular ? size : 12);
//
//     Widget imageWidget;
//
//     // --- SVG ---
//     if (_isSvg) {
//       imageWidget = _isNetwork
//           ? SvgPicture.network(
//               imageUrl,
//               width: size,
//               height: size,
//               fit: fit,
//               placeholderBuilder: (_) => _buildLoader(),
//             )
//           : SvgPicture.asset(imageUrl, width: size, height: size, fit: fit);
//     }
//     // --- NORMAL IMAGE ---
//     else {
//       imageWidget = _isNetwork
//           ? CachedNetworkImage(
//               imageUrl: imageUrl,
//               width: size,
//               height: size,
//               fit: fit,
//               placeholder: (_, _) =>
//                   useShimmer ? _buildShimmer() : _buildLoader(),
//               errorWidget: (_, _, _) => _buildFallback(),
//             )
//           : Image.asset(
//               imageUrl,
//               width: size,
//               height: size,
//               fit: fit,
//               errorBuilder: (_, __, ___) => _buildFallback(),
//             );
//     }
//
//     // return Container(
//     //   width: size,
//     //   height: size,
//     //   decoration: BoxDecoration(
//     //     color: backgroundColor ?? Colors.grey.shade200,
//     //     shape: isCircular ? BoxShape.circle : BoxShape.rectangle,
//     //     borderRadius: isCircular ? null : borderRadius,
//     //     border: borderColor != null
//     //         ? Border.all(color: borderColor!, width: borderWidth)
//     //         : null,
//     //   ),
//     //   clipBehavior: Clip.hardEdge,
//     //   child: imageWidget,
//     // );
//     return InkWell(
//       onTap: () {
//         if (_isNetwork) {
//           Navigator.push(
//             context,
//             MaterialPageRoute(
//               builder: (_) => FullScreenImageView(
//                 imageUrl: imageUrl,
//                 isNetwork: _isNetwork,
//                 heroTag: imageUrl,
//               ),
//             ),
//           );
//         }
//       },
//       child: Container(
//         width: size,
//         height: size,
//         decoration: BoxDecoration(
//           color: backgroundColor ?? Colors.grey.shade200,
//           shape: isCircular ? BoxShape.circle : BoxShape.rectangle,
//           borderRadius: isCircular ? null : borderRadius,
//           border: borderColor != null
//               ? Border.all(color: borderColor!, width: borderWidth)
//               : null,
//         ),
//         child: Hero(
//           tag: imageUrl,
//           child: ClipOval(
//             clipBehavior: Clip.hardEdge,
//             child: isCircular
//                 ? imageWidget
//                 : ClipRRect(borderRadius: borderRadius, child: imageWidget),
//           ),
//         ),
//       ),
//     );
//   }
//
//   Widget _buildLoader() => Center(
//     child: SizedBox(
//       width: size * 0.4,
//       height: size * 0.4,
//       child: const CircularProgressIndicator(strokeWidth: 1),
//     ),
//   );
//
//   Widget _buildShimmer() => Shimmer.fromColors(
//     baseColor: Colors.grey.shade300,
//     highlightColor: Colors.grey.shade100,
//     child: Container(color: Colors.grey.shade300, width: size, height: size),
//   );
//
//   Widget _buildFallback() {
//     if (fallbackAsset != null) {
//       return SvgPicture.asset(
//         fallbackAsset!,
//         width: size,
//         height: size,
//         fit: fit,
//       );
//     } else {
//       // Generic fallback (e.g., user initials or icon)
//       return SvgPicture.asset(
//         AppImages.profileImage,
//         width: size,
//         height: size,
//         fit: fit,
//       );
//     }
//   }
// }

import 'dart:developer';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hrms_uis/common/utils/constants/image_strings.dart';
import 'package:shimmer/shimmer.dart';
import 'full_screen_image_preview.dart';

class CustomImage extends StatelessWidget {
  /// Image source (URL or asset path)
  final String imageUrl;

  /// Optional fallback asset (used if image fails)
  final String? fallbackAsset;

  /// Display as circle (true) or rectangle (false)
  final bool isCircular;

  /// Image size
  final double size;

  /// Border customization
  final Color? borderColor;
  final double borderWidth;

  /// Background color
  final Color? backgroundColor;

  /// Show shimmer when loading network image
  final bool useShimmer;

  /// Image fit
  final BoxFit fit;

  final String? heroTag;

  const CustomImage({
    super.key,
    required this.imageUrl,
    this.fallbackAsset,
    this.isCircular = true,
    this.size = 40,
    this.borderColor,
    this.borderWidth = 0,
    this.backgroundColor,
    this.useShimmer = false,
    this.fit = BoxFit.cover,
    this.heroTag, // 👈 NEW
  });

  bool get _isNetwork => imageUrl.startsWith('http');

  bool get _isSvg => imageUrl.toLowerCase().endsWith('.svg');

  bool get _isImageFile =>
      imageUrl.toLowerCase().endsWith('.png') ||
      imageUrl.toLowerCase().endsWith('.jpg') ||
      imageUrl.toLowerCase().endsWith('.jpeg') ||
      imageUrl.toLowerCase().endsWith('.webp') ||
      imageUrl.toLowerCase().endsWith('.bmp');

  @override
  Widget build(BuildContext context) {
    log("Loading image: $imageUrl");

    final borderRadius = BorderRadius.circular(isCircular ? size : 12);

    Widget imageWidget;

    // --- SVGs ---
    if (_isSvg) {
      imageWidget = _isNetwork
          ? SvgPicture.network(
              imageUrl,
              width: size,
              height: size,
              fit: fit,
              placeholderBuilder: (_) => _buildLoader(),
            )
          : SvgPicture.asset(imageUrl, width: size, height: size, fit: fit);
    }
    // --- Other image formats (JPG, PNG, etc.) ---
    else if (_isImageFile || _isNetwork) {
      imageWidget = _isNetwork
          ? CachedNetworkImage(
              imageUrl: imageUrl,
              width: size,
              height: size,
              fit: fit,
              placeholder: (_, _) =>
                  useShimmer ? _buildShimmer() : _buildLoader(),
              errorWidget: (_, _, _) => _buildFallback(),
            )
          : Image.asset(
              imageUrl,
              width: size,
              height: size,
              fit: fit,
              errorBuilder: (_, _, _) => _buildFallback(),
            );
    }
    // --- Fallback for unknown types ---
    else {
      imageWidget = _buildFallback();
    }

    Widget imageContent = isCircular
        ? ClipOval(child: imageWidget)
        : ClipRRect(borderRadius: borderRadius, child: imageWidget);

    // --- UI wrapper with optional hero animation + tap to view full screen ---
    return InkWell(
      onTap: () {
        if (_isNetwork) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => FullScreenImageView(
                imageUrl: imageUrl,
                isNetwork: _isNetwork,
                heroTag: heroTag,
              ),
            ),
          );
        }
      },
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          color: backgroundColor ?? Colors.grey.shade200,
          shape: isCircular ? BoxShape.circle : BoxShape.rectangle,
          borderRadius: isCircular ? null : borderRadius,
          border: borderColor != null
              ? Border.all(color: borderColor!, width: borderWidth)
              : null,
        ),
        clipBehavior: Clip.hardEdge,
        child: heroTag != null
            ? Hero(tag: heroTag!, child: imageContent)
            : imageContent,
        // child: Hero(
        //   tag: imageUrl,
        //   child: isCircular
        //       ? ClipOval(child: imageWidget)
        //       : ClipRRect(borderRadius: borderRadius, child: imageWidget),
        // ),
      ),
    );
  }

  Widget _buildLoader() => Center(
    child: SizedBox(
      width: size * 0.4,
      height: size * 0.4,
      child: const CircularProgressIndicator(strokeWidth: 1),
    ),
  );

  Widget _buildShimmer() => Shimmer.fromColors(
    baseColor: Colors.grey.shade300,
    highlightColor: Colors.grey.shade100,
    child: Container(width: size, height: size, color: Colors.grey.shade300),
  );

  Widget _buildFallback() {
    final fallbackPath = fallbackAsset ?? AppImages.profileImage;
    if (fallbackPath.toLowerCase().endsWith('.svg')) {
      return SvgPicture.asset(
        fallbackPath,
        width: size,
        height: size,
        fit: fit,
      );
    } else {
      return Image.asset(fallbackPath, width: size, height: size, fit: fit);
    }
  }
}
