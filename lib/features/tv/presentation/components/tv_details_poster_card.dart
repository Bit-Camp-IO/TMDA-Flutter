import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tmda/core/icons/solar_system_icons.dart';
import 'package:tmda/core/util/color_manager.dart';
import 'package:tmda/features/tv/presentation/components/tv_poster_image_with_shadow.dart';

class TvDetailsPosterCard extends StatelessWidget {
  const TvDetailsPosterCard({
    super.key,
    required this.imagePath,
    required this.title,
    required this.rating,
    required this.onTap,
  });
  final String imagePath;
  final String title;
  final dynamic rating;
  final void Function() onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Stack(
        children: [
          TvPosterWithShadow(
            imagePath: imagePath,
            width: 130.w,
            height: 200.h,
          ),
          Positioned(
            left: 5,
            right: 0,
            bottom: 10,
            child: Column(
              children: [
                Row(
                  children: [
                    const Icon(
                      SolarSystemIcons.star,
                      color: ColorsManager.starsColor,
                      size: 16,
                    ),
                    Text(rating.toStringAsFixed(1),
                        style: Theme.of(context).textTheme.bodyMedium),
                  ],
                ),
                SizedBox(height: 5.w),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    title.length > 20 ? '${title.substring(0, 20)}..' : title,
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(fontSize: 8.sp),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
