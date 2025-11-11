import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hrms_uis/common/utils/constants/colors.dart';
import 'package:hrms_uis/common/utils/extensions/extension.dart';
import 'package:photo_view/photo_view.dart';

import '../appbar/custom_appbar.dart';

class FullScreenImageView extends StatelessWidget {
  final String imageUrl;
  final bool isNetwork;
  final String? heroTag;

  const FullScreenImageView({
    super.key,
    required this.imageUrl,
    this.isNetwork = true,
    this.heroTag,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        elevation: 0,
        title: context.loc.preview,
        showAvatar: false,
        showBackButton: true,
        showNavigation: false,
        showCalendarIcon: false,
      ),
      body: GestureDetector(
        onTap: () => Navigator.pop(context),
        child: Center(
          child: PhotoView(
            imageProvider: isNetwork
                ? CachedNetworkImageProvider(imageUrl)
                : AssetImage(imageUrl) as ImageProvider,
            backgroundDecoration: const BoxDecoration(color: AppColors.scaffoldBgColor),
            minScale: PhotoViewComputedScale.contained,
            maxScale: PhotoViewComputedScale.covered * 2,
            heroAttributes: PhotoViewHeroAttributes(tag: heroTag ?? imageUrl),
          ),
        ),
      ),
    );
  }
}
