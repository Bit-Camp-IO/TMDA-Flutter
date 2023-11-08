import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tmda/core/util/assets_manager.dart';
import 'package:tmda/core/util/color_manager.dart';
import 'package:tmda/core/util/strings_manager.dart';
import 'package:tmda/core/widgets/tilted_image.dart';

class EpisodeCard extends StatelessWidget {
  const EpisodeCard({
    super.key,
    required this.title,
    required this.posterPath,
    required this.vote,
    required this.voteCount,
    required this.airDate,
    required this.episodeNumber,
    required this.episodeDuration,
  });
  final String title;
  final int episodeNumber;
  final String posterPath;
  final dynamic vote;
  final int voteCount;
  final String airDate;
  final int episodeDuration;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 312.w,
      height: 190.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20).w,
        color: Colors.black.withOpacity(0.3),
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TiltedImage(
              errorImagePath: AssetsManager.errorPoster,
              imagePath: posterPath,
              width: 120.w,
              height: 170.h,
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(title,
                overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        fontWeight: FontWeight.w500,
                      ),
                ),
                SizedBox(height: 10.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(airDate),
                    SizedBox(width: 10.w),
                    Text('${episodeDuration}m'),
                  ],
                ),
                SizedBox(height: 10.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
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
                          .copyWith(fontSize: 11.sp),
                    ),
                    SizedBox(width: 20.w),
                    Text(
                      '$voteCount ${StringsManager.votes}',
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall!
                          .copyWith(fontSize: 11.sp),
                    )
                  ],
                ),
                SizedBox(height: 5.h),
              ],
            ),
          )
        ],
      ),
    );
  }
}
