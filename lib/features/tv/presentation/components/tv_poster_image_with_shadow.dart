import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TvPosterWithShadow extends StatelessWidget {
  const TvPosterWithShadow({
    super.key,
    required this.imagePath,
    required this.width,
    required this.height,
  });

  final String imagePath;
  final double width;
  final double height;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.all(const Radius.circular(10).w),
      child: SizedBox(
        width: width,
        height: height,
        child: CachedNetworkImage(
          imageUrl: imagePath,
          imageBuilder: (context, imageProvider) => Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: imageProvider,
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.3),
                  BlendMode.darken,
                ),
              ),
            ),
          ),
          errorWidget: (context, url, error) => const Icon(
            Icons.error,
            color: Colors.red,
          ),
        ),
      ),
    );
  }
}
