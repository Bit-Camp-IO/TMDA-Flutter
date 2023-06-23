import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tmda/core/icons/solar_system_icons.dart';
import 'package:tmda/core/util/color_manager.dart';

class TvShowCarouselCard extends StatelessWidget {
  const TvShowCarouselCard({
    super.key,
    required this.title,
    required this.rating,
    required this.voteCount,
    required this.imagePath,
    required this.onTap,
  });

  final String title;
  final dynamic rating;
  final int voteCount;
  final String imagePath;
  final void Function() onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(top: 30).r,
        child: Stack(
          children: [
            Container(
              width: 300.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                  image: CachedNetworkImageProvider(
                    imagePath,
                  ),
                  colorFilter: ColorFilter.mode(
                    Colors.black.withOpacity(0.3),
                    BlendMode.darken,
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned(
              left: 10,
              bottom: 10,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title.length > 20 ? '${title.substring(0,21)}..' : title,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  SizedBox(height: 8.h),
                  RatingBarIndicator(
                    rating: rating / 2,
                    itemBuilder: (context, index) => const Icon(
                      SolarSystemIcons.star,
                      color: ColorsManager.starsColor,
                    ),
                    unratedColor: ColorsManager.inActiveColor,
                    itemCount: 5,
                    itemSize: 15.sp,
                    direction: Axis.horizontal,
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    'From $voteCount users',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
