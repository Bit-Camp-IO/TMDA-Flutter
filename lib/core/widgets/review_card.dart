import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tmda/core/icons/solar_system_icons.dart';
import 'package:tmda/core/util/color_manager.dart';
import 'package:tmda/core/util/extensions.dart';

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
        borderRadius: BorderRadius.circular(15.0).r,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15.0).r,
        child: BackdropFilter(
          filter: ImageFilter.blur(
            sigmaX: 50,
            sigmaY: 50,
          ),
          child: Container(
            color: ColorsManager.reviewCardColor,
            child: Padding(
              padding: const EdgeInsets.all(10.0).r,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(
                        SolarSystemIcons.star,
                        color: ColorsManager.ratingIconColor,
                        size: 15.sp,
                      ),
                      SizedBox(width: 4.w),
                      Text(
                          reviewRating == null
                              ? context.tr.movieDetailsNoRating
                              : reviewRating.toString(),
                          style: context.textTheme.titleSmall!)
                    ],
                  ),
                  SizedBox(height: 6.h),
                  Text(
                    '${context.tr.movieDetailsReviewTitle} $reviewAuthorName',
                    style: context.textTheme.titleSmall!.copyWith(
                      fontSize: 8.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(height: 6.h),
                  Text(
                    reviewContent,
                    maxLines: 6,
                    style:
                        context.textTheme.titleSmall!.copyWith(fontSize: 8.sp),
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
