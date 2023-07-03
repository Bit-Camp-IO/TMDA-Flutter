import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tmda/core/icons/solar_system_icons.dart';
import 'package:tmda/core/util/color_manager.dart';

class NoSearcResults extends StatelessWidget {
  const NoSearcResults({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Animate(
      effects: [FadeEffect(duration: 250.ms)],
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
              "Couldn't find any results.",
              style: Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .copyWith(color:ColorsManager.darkPrimary),
            ),
          ],
        ),
      ),
    );
  }
}
