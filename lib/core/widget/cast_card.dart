import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tmda/core/widget/poster_image_with_shadow.dart';

class CastCard extends StatelessWidget {
  const CastCard({
    super.key,
    required this.actorPicPath,
    required this.actorName,
    required this.actorCharacterName,
  });

  final String actorPicPath;
  final String actorName;
  final String actorCharacterName;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          width: 130.sp,
          height: 200.sp,
          child: PosterImageWithShadow(
            imagePath: actorPicPath,
            width: 130.sp,
            height: 160.sp,
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
    );
  }
}
