import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tmda/core/util/color_manager.dart';
import 'package:tmda/core/util/strings_manager.dart';
import 'package:tmda/core/widgets/tilted_image.dart';

class ListCard extends StatelessWidget {
  const ListCard({
    super.key,
    required this.title,
    required this.posterPath,
    required this.vote,
    required this.voteCount,
    required this.onTap,
    required this.genres,
    required this.releaseYear,
    required this.language,
    required this.errorImagePath,
  });

  final String title;
  final String posterPath;
  final dynamic vote;
  final int voteCount;
  final String releaseYear;
  final List genres;
  final String language;
  final void Function() onTap;
  final String errorImagePath;

  @override
  Widget build(BuildContext context) {
    return Animate(
      effects: [FadeEffect(duration: 400.ms)],
      child: InkWell(
        onTap: onTap,
        child: Transform(
          transform: Matrix4.skewX(-0.06),
          child: Container(
            width: 312,
            height: 210,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: Colors.black.withOpacity(0.3),
            ),
            child: Stack(
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: TiltedImage(
                        errorImagePath: errorImagePath,
                        imagePath: posterPath,
                        width: 120.w,
                        height: 170.h,
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          title.length > 15
                              ? '${title.substring(0, 15)}..'
                              : title,
                          style:
                              Theme.of(context).textTheme.bodyLarge!.copyWith(
                                    fontWeight: FontWeight.w500,
                                  ),
                        ),
                        SizedBox(height: 4.h),
                        Row(
                          children: [
                            Text(
                              releaseYear.isEmpty
                                  ? StringsManager.unknown
                                  : '${releaseYear.substring(0, 4)}‧',
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                            Text(
                              _buildGenres(genres),
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                            Text(
                              language.toUpperCase(),
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                          ],
                        ),
                        SizedBox(height: 7.h),
                        Row(
                          children: [
                            const Icon(
                              Icons.star,
                              color: ColorsManager.ratingIconColor,
                              size: 16,
                            ),
                            Text(
                              vote.toString(),
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall!
                                  .copyWith(fontSize: 11),
                            ),
                            SizedBox(width: 20.w),
                            Text(
                              StringsManager.voteCount(voteCount.toString()),
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall!
                                  .copyWith(fontSize: 11),
                            )
                          ],
                        )
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  String _buildGenres(List genres) {
    if (genres.isEmpty) {
      return '${StringsManager.unknown}‧';
    } else if (genres.length == 1) {
      return '${genres[0].name}‧';
    } else {
      if (genres[0].name.length <= 10 && genres[1].name.length <= 10) {
        return '${genres[0].name}/${genres[1].name}‧';
      } else {
        return '${genres[0].name.substring(0, 6)}/${genres[1].name.substring(0, 6)}‧';
      }
    }
  }
}
