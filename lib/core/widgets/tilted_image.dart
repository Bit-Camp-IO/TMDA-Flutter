import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tmda/core/constants/api_constants.dart';

class TiltedImage extends StatelessWidget {
  const TiltedImage({
    super.key,
    required this.imagePath,
    required this.width,
    required this.height,
    required this.errorImagePath,
  });

  final String imagePath;
  final double width;
  final double height;
  final String errorImagePath;

  @override
  Widget build(BuildContext context) {
    return Transform(
      transform: Matrix4.skewX(-0.05),
      child: ClipRRect(
        borderRadius: BorderRadius.all(const Radius.circular(20).w),
        child: Container(
          height: height,
          width: width,
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: CachedNetworkImageProvider(
                imagePath.isNotEmpty
                    ? ApiConstants.imageUrl(imagePath)
                    : errorImagePath,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
