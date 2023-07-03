import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tmda/core/icons/solar_system_icons.dart';
import 'package:tmda/core/util/color_manager.dart';

class ErrorSnackBar extends StatelessWidget {
  const ErrorSnackBar({
    super.key,
    required this.errorMessage,
  });

  final String errorMessage;

  @override
  Widget build(BuildContext context) {
    return SnackBar(
      animation: CurvedAnimation(curve: Curves.bounceIn, parent: kAlwaysCompleteAnimation),
      behavior: SnackBarBehavior.floating,
      content: Animate(
        effects: [FadeEffect(duration: 250.ms)],
        child: Row(
          children: [
            const Icon(SolarSystemIcons.error, color: ColorsManager.errorColor, size: 20,),
            SizedBox(width: 3.w),
            Text(
              errorMessage,
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
