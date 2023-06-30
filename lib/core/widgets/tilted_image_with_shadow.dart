import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tmda/core/constants/api_constants.dart';


class TiltedImageWithShadow extends StatelessWidget {
  const TiltedImageWithShadow({
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
        child: SizedBox(
          width: width,
          height: height,
          child: CachedNetworkImage(
            imageUrl: ApiConstants.imageUrl(imagePath),
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
            errorWidget: (context, url, error) => Transform(
              transform: Matrix4.skewX(-0.05),
              child: ClipRRect(
                borderRadius: BorderRadius.all(const Radius.circular(20).w),
                child: SizedBox(
                  width: width,
                  height: height,
                  child: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image:  NetworkImage(errorImagePath),
                        fit: BoxFit.cover,
                        colorFilter: ColorFilter.mode(
                          Colors.black.withOpacity(0.3),
                          BlendMode.darken,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
