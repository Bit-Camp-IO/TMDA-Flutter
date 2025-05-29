import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tmda/core/animations/custom_fade_animation.dart';
import 'package:tmda/core/icons/solar_system_icons.dart';
import 'package:tmda/core/util/color_manager.dart';
import 'package:tmda/core/util/extensions.dart';

class NoSearchResults extends StatelessWidget {
  const NoSearchResults({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomFadeAnimation(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              SolarSystemIcons.error,
              color: ColorsManager.primaryColor,
              size: 70,
            ),
            SizedBox(height: 20.h),
            Text(
              context.tr.noSearchResults,
              style: context.textTheme.titleMedium!
                  .copyWith(color: ColorsManager.darkPrimary),
            ),
          ],
        ),
      ),
    );
  }
}
