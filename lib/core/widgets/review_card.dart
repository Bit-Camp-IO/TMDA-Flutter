import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tmda/core/icons/solar_system_icons.dart';
import 'package:tmda/core/util/color_manager.dart';
import 'package:tmda/core/util/strings_manager.dart';

class ReviewCard extends StatelessWidget {
  const ReviewCard({
    super.key,
    required this.reviewRating,
    required this.reviewAuthorName,
    required this.reviewContent,
  });
  final dynamic reviewRating;
  final String reviewAuthorName;
  final String reviewContent;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 220.w,
      height: 150.h,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.1),
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15.0),
        child: BackdropFilter(
          filter: ImageFilter.blur(
            sigmaX: 50,
            sigmaY: 50,
          ),
          child: Container(
            color: ColorsManager.reviewCardColor,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Icon(
                        SolarSystemIcons.star,
                        color: ColorsManager.ratingIconColor,
                        size: 15,
                      ),
                      SizedBox(width: 4.w),
                      Text(
                          reviewRating == null
                              ? StringsManager.movieDetailsNoRating
                              : reviewRating.toString(),
                          style: Theme.of(context).textTheme.titleSmall!)
                    ],
                  ),
                  SizedBox(height: 6.h),
                  Text(
                    '${StringsManager.movieDetailsReviewTitle} $reviewAuthorName',
                    style: Theme.of(context).textTheme.titleSmall!.copyWith(
                          fontSize: 8.sp,
                          fontWeight: FontWeight.w700,
                        ),
                  ),
                  SizedBox(height: 6.h),
                  Text(
                    reviewContent,
                    maxLines: 6,
                    style: Theme.of(context)
                        .textTheme
                        .titleSmall!
                        .copyWith(fontSize: 8.sp),
                  ),
                  SizedBox(height: 6.h),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
