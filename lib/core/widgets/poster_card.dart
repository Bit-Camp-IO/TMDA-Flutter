import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tmda/core/icons/solar_system_icons.dart';
import 'package:tmda/core/util/color_manager.dart';
import 'package:tmda/core/util/strings_manager.dart';
import 'package:tmda/core/widgets/tilted_image_with_shadow.dart';

class PosterCard extends StatelessWidget {
  const PosterCard({
    super.key,
    required this.imagePath,
    required this.title,
    required this.releaseYear,
    required this.rating,
    required this.onTap,
    required this.genres,
    required this.language,
    required this.errorImagePath,
    this.width = 160,
    this.height = 250,
  });

  final String imagePath;
  final String title;
  final String releaseYear;
  final List genres;
  final dynamic rating;
  final String language;
  final void Function() onTap;
  final double width;
  final double height;
  final String errorImagePath;

  @override
  Widget build(BuildContext context) {
    return Animate(
      effects: [FadeEffect(duration: 400.ms)],
      child: InkWell(
        onTap: onTap,
        child: Stack(
          children: [
            TiltedImageWithShadow(
              errorImagePath: errorImagePath,
              imagePath: imagePath,
              width: width.w,
              height: height.h,
            ),
            Positioned(
              left: 0,
              right: 10,
              bottom: 20,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    title,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(fontWeight: FontWeight.w500),
                  ),
                  SizedBox(height: 2.5.h),
                  Text(
                    _buildCardInfo(
                      genres: _buildGenres(genres),
                      language: language,
                      year: releaseYear,
                    ),
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  SizedBox(height: 2.5.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        StringsManager.tmdbRating(rating),
                        style: Theme.of(context)
                            .textTheme
                            .bodySmall!
                            .copyWith(fontSize: 8.sp),
                      ),
                      SizedBox(width: 8.w),
                      RatingBarIndicator(
                        rating: rating / 2,
                        unratedColor: ColorsManager.inActiveColor,
                        itemBuilder: (context, index) => const Icon(
                          SolarSystemIcons.star,
                          color: Colors.amber,
                        ),
                        itemCount: 5,
                        itemSize: 10,
                        direction: Axis.horizontal,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _buildGenres(List genres) {
    if (genres.isEmpty) {
      return StringsManager.unknown;
    } else if (genres.length == 1) {
      return '${genres[0].name}';
    } else {
      return '${genres[0].name}/${genres[1].name}';
    }
  }
  String _buildCardInfo({required String year, required String genres, required String language}) {
    if(year.isNotEmpty){
      String parsedYear = year.substring(0,4);
      return '$parsedYear  ‧ $genres ‧ ${language.toUpperCase()}';
    }else{
      return '${StringsManager.unknown}  ‧ $genres  ‧ ${language.toUpperCase()}';
    }
  }
}
