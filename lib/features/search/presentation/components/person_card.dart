import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tmda/core/util/strings_manager.dart';
import 'package:tmda/core/widgets/tilted_image.dart';

class PersonCard extends StatelessWidget {
  const PersonCard({
    super.key,
    required this.name,
    required this.onTap,
    required this.knownFor,
    required this.imagePath,
    required this.errorAvatarPath,
  });

  final String name;
  final String knownFor;
  final String imagePath;
  final void Function() onTap;
  final String errorAvatarPath;
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
                        errorImagePath: errorAvatarPath,
                        imagePath: imagePath,
                        width: 120.w,
                        height: 170.h,
                      ),
                    ),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            name.isNotEmpty ? name : StringsManager.unknown,
                            overflow: TextOverflow.ellipsis,
                            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(height: 4.h),
                          Text(
                            overflow: TextOverflow.ellipsis,
                            StringsManager.knownFor(knownFor),
                            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
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
}