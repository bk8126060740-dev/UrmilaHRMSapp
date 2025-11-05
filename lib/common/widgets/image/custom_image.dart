import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hrms_uis/common/utils/constants/image_strings.dart';
import 'package:shimmer/shimmer.dart';

import 'full_screen_image_preview.dart';

class CustomImage extends StatelessWidget {
  /// Image source (can be URL or asset path)
  final String imageUrl;

  /// Optional placeholder or fallback image asset
  final String? fallbackAsset;

  /// If true, displays a circular avatar
  final bool isCircular;

  /// Image size (radius for circular, width for square)
  final double size;

  /// Optional border color & width
  final Color? borderColor;
  final double borderWidth;

  /// Optional background color
  final Color? backgroundColor;

  /// Whether to use shimmer while loading (for network)
  final bool useShimmer;

  /// Fit of the image
  final BoxFit fit;

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
  });

  bool get _isNetwork => imageUrl.startsWith('https');

  bool get _isSvg => imageUrl.toLowerCase().endsWith('.svg');

  @override
  Widget build(BuildContext context) {
    final borderRadius = BorderRadius.circular(isCircular ? size : 12);

    Widget imageWidget;

    // --- SVG ---
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
    // --- NORMAL IMAGE ---
    else {
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
              errorBuilder: (_, __, ___) => _buildFallback(),
            );
    }

    // return Container(
    //   width: size,
    //   height: size,
    //   decoration: BoxDecoration(
    //     color: backgroundColor ?? Colors.grey.shade200,
    //     shape: isCircular ? BoxShape.circle : BoxShape.rectangle,
    //     borderRadius: isCircular ? null : borderRadius,
    //     border: borderColor != null
    //         ? Border.all(color: borderColor!, width: borderWidth)
    //         : null,
    //   ),
    //   clipBehavior: Clip.hardEdge,
    //   child: imageWidget,
    // );
    return InkWell(
      onTap: () {
        if (_isNetwork) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => FullScreenImageView(
                imageUrl: imageUrl,
                isNetwork: _isNetwork,
                heroTag: imageUrl,
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
        child: Hero(
          tag: imageUrl,
          child: ClipOval(
            clipBehavior: Clip.hardEdge,
            child: isCircular
                ? imageWidget
                : ClipRRect(borderRadius: borderRadius, child: imageWidget),
          ),
        ),
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
    child: Container(color: Colors.grey.shade300, width: size, height: size),
  );

  Widget _buildFallback() {
    if (fallbackAsset != null) {
      return SvgPicture.asset(
        fallbackAsset!,
        width: size,
        height: size,
        fit: fit,
      );
    } else {
      // Generic fallback (e.g., user initials or icon)
      return SvgPicture.asset(
        AppImages.profileImage,
        width: size,
        height: size,
        fit: fit,
      );
    }
  }
}
