import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tmda/core/icons/solar_system_icons.dart';
import 'package:tmda/core/util/color_manager.dart';
import 'package:tmda/core/util/extensions.dart';
import 'package:tmda/core/widgets/tilted_image_with_shadow.dart';

class DetailsPosterCard extends StatelessWidget {
  const DetailsPosterCard({
    super.key,
    required this.imagePath,
    required this.title,
    required this.rating,
    required this.onTap,
    required this.errorImagePath,
  });

  final String imagePath;
  final String title;
  final dynamic rating;
  final void Function() onTap;
  final String errorImagePath;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Stack(
        children: [
          TiltedImageWithShadow(
            errorImagePath: errorImagePath,
            imagePath: imagePath,
            width: 130.w,
            height: 220.h,
          ),
          Positioned(
            left: 5.w,
            right: 0,
            bottom: 30.h,
            child: Row(
              children: [
                Icon(
                  SolarSystemIcons.star,
                  color: ColorsManager.ratingIconColor,
                  size: 16.sp,
                ),
                SizedBox(width: 2.w),
                Text(rating.toStringAsFixed(1),
                    style: context.textTheme.bodyMedium),
              ],
            ),
          ),
          Positioned(
            left: 5.w,
            right: 15.w,
            bottom: 15.h,
            child: Text(
              title,
              overflow: TextOverflow.ellipsis,
              style: context.textTheme.bodySmall,
            ),
          ),
        ],
      ),
    );
  }
}
