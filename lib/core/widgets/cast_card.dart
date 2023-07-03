import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tmda/core/widgets/tilted_image_with_shadow.dart';

class CastCard extends StatelessWidget {
  const CastCard({
    super.key,
    required this.actorPicPath,
    required this.actorName,
    required this.actorCharacterName,
    required this.onTap,
    required this.errorImagePath,
    required this.localErrorImagePath,
  });

  final String actorPicPath;
  final String actorName;
  final String actorCharacterName;
  final String errorImagePath;
  final String localErrorImagePath;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Stack(
        children: [
          SizedBox(
            width: 130.w,
            height: 220.h,
            child: TiltedImageWithShadow(
              localErrorImagePath: localErrorImagePath,
              errorImagePath: errorImagePath,
              imagePath: actorPicPath,
              width: 130.w,
              height: 220.h,
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
