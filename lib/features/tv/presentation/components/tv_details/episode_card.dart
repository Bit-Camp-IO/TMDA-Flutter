import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tmda/core/util/assets_manager.dart';
import 'package:tmda/core/util/color_manager.dart';
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
        borderRadius: BorderRadius.circular(20),
        color: Colors.black.withOpacity(0.3),
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TiltedImage(
              errorImagePath: AssetsManager.noPoster,
              imagePath: posterPath,
              width: 120.w,
              height: 170.h,
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                title.length > 20
                    ? '$episodeNumber. ${title.substring(0, 20)}..'
                    : '$episodeNumber. $title',
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      fontWeight: FontWeight.w500,
                    ),
              ),
              SizedBox(height: 10.h),
              Row(
                children: [
                  Text(airDate),
                  SizedBox(width: 10.w),
                  Text('${episodeDuration}m'),
                ],
              ),
              SizedBox(height: 10.h),
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
                    '$voteCount Votes',
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall!
                        .copyWith(fontSize: 11),
                  )
                ],
              ),
              SizedBox(height: 5.h),
            ],
          )
        ],
      ),
    );
  }
}
