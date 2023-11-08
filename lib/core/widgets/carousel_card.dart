import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tmda/core/constants/api_constants.dart';
import 'package:tmda/core/constants/app_constants.dart';
import 'package:tmda/core/icons/solar_system_icons.dart';
import 'package:tmda/core/util/color_manager.dart';
import 'package:tmda/core/util/strings_manager.dart';

class CarouselCard extends StatelessWidget {
  const CarouselCard({
    super.key,
    required this.title,
    required this.rating,
    required this.voteCount,
    required this.imagePath,
    required this.onTap,
    required this.errorImagePath,
  });

  final String title;
  final dynamic rating;
  final int voteCount;
  final String imagePath;
  final String errorImagePath;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Stack(
        children: [
          ImageFiltered(
            imageFilter: ColorFilter.mode(
              Colors.black.withOpacity(0.3),
              BlendMode.darken,
            ),
            child: CachedNetworkImage(
              width: 360.w,
              imageUrl: imagePath.isNotEmpty
                  ? ApiConstants.imageUrl(imagePath)
                  : errorImagePath,
              fit: BoxFit.cover,
              cacheManager: CacheManager(Config(
                AppConstants.cacheFolder,
                stalePeriod: const Duration(days: AppConstants.cacheDuration),
              )),
            ),
          ),
          Positioned(
            left: 10.w,
            bottom: 10.h,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: Theme.of(context).textTheme.titleLarge,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 8.h),
                RatingBarIndicator(
                  rating: rating / 2,
                  itemBuilder: (context, index) => const Icon(
                    SolarSystemIcons.star,
                    color: ColorsManager.ratingIconColor,
                  ),
                  unratedColor: ColorsManager.inActiveColor,
                  itemCount: 5,
                  itemSize: 15,
                  direction: Axis.horizontal,
                ),
                SizedBox(height: 8.h),
                Text(
                  StringsManager.voteCount(
                    voteCount.toString(),
                  ),
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
