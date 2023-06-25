import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tmda/core/util/color_manager.dart';
import 'package:tmda/core/util/strings_manager.dart';
import 'package:tmda/features/tv/presentation/components/tv_poster.dart';

class SeeAllTvCard extends StatelessWidget {
  const SeeAllTvCard({
    super.key,
    required this.title,
    required this.posterPath,
    required this.vote,
    required this.voteCount,
    required this.onTap,
    required this.genres,
    required this.releaseYear,
    required this.language,
  });
  final String title;
  final String posterPath;
  final dynamic vote;
  final int voteCount;
  final String releaseYear;
  final List genres;
  final String language;
  final void Function() onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 312.w,
        height: 190.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.black.withOpacity(0.3),
        ),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TvPoster(
                imagePath: posterPath,
                width: 120.w,
                height: 170.h,
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title.length > 18 ? '${title.substring(0, 18)}..' : title,
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        fontWeight: FontWeight.w500,
                      ),
                ),
                SizedBox(height: 4.h),
                Row(
                  children: [
                    Text(
                      releaseYear.isEmpty
                          ? StringsManager.unknown
                          : '${releaseYear.substring(0, 4)} ‧ ',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    Text(
                      (() {
                        if (genres.isEmpty) {
                          return StringsManager.unknown;
                        } else if (genres.length == 1) {
                          return '${genres[0].name} ‧ ';
                        } else {
                          return '${genres[0].name}/${genres[1].name} ‧ ';
                        }
                      }()),
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
                      color: ColorsManager.starsColor,
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
                      '$voteCount Votes',
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
      ),
    );
  }
}