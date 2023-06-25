import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tmda/features/tv/presentation/components/tv_poster_image_with_shadow.dart';

class TvCastCard extends StatelessWidget {
  const TvCastCard({
    super.key,
    required this.actorPicPath,
    required this.actorName,
    required this.actorCharacterName,
    required this.onTap,
  });

  final String actorPicPath;
  final String actorName;
  final String actorCharacterName;
  final void Function() onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Stack(
        children: [
          SizedBox(
            width: 130.sp,
            height: 220.sp,
            child: TvPosterWithShadow(
              imagePath: actorPicPath,
              width: 130.sp,
              height: 220.sp,
            ),
          ),
          Positioned(
            bottom: 30,
            left: 5,
            child: Text(
              actorName,
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ),
          Positioned(
            bottom: 15,
            left: 5,
            child: Text(
              actorCharacterName.length > 20
                  ? '${actorCharacterName.substring(0, 20)}..'
                  : actorCharacterName,
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ),
        ],
      ),
    );
  }
}