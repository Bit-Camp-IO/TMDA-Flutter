import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tmda/core/constants/api_constants.dart';
import 'package:tmda/core/util/color_manager.dart';

class CarouselItem extends StatelessWidget {
  const CarouselItem({
    super.key,
    required this.title,
    required this.releaseYear,
    required this.productionCompany,
    required this.rating,
    required this.voteCount,
    required this.imagePath,
  });

  final String releaseYear;
  final String productionCompany;
  final String title;
  final dynamic rating;
  final int voteCount;
  final String imagePath;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: 360.w,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: CachedNetworkImageProvider(
                imageUrl(imagePath),
              ),
              colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.3),
                BlendMode.darken,
              ),
              fit: BoxFit.cover
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
                releaseYear,
                style: TextStyle(
                  color: ColorsManager.primaryColor,
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 8.h),
              Text(
                title,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(height: 8.h),
              RatingBarIndicator(
                rating: rating / 2,
                itemBuilder: (context, index) => const Icon(
                  Icons.star,
                  color: Color(0xFFE9BC21),
                ),
                unratedColor: const Color(0xFFB1AEAE),
                itemCount: 5,
                itemSize: 15.sp,
                direction: Axis.horizontal,
              ),
              SizedBox(height: 8.h),
              Text(
                'From $voteCount users',
                style: TextStyle(
                  color: Colors.white.withOpacity(0.6),
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
