import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tmda/core/animations/custom_fade_animation.dart';
import 'package:tmda/core/icons/solar_system_icons.dart';
import 'package:tmda/core/util/color_manager.dart';
import 'package:tmda/core/util/extensions.dart';

SnackBar errorSnackBar({
  required String errorMessage,
  required BuildContext context,
}) {
  return SnackBar(
    animation: CurvedAnimation(
      curve: Curves.bounceIn,
      parent: kAlwaysCompleteAnimation,
    ),
    behavior: SnackBarBehavior.floating,
    content: CustomFadeAnimation(
      child: Row(
        children: [
          Icon(
            SolarSystemIcons.error,
            color: ColorsManager.errorColor,
            size: 20.sp,
          ),
          SizedBox(width: 3.w),
          Text(
            errorMessage,
            style: context.textTheme.bodySmall!.copyWith(color: Colors.white),
          ),
        ],
      ),
    ),
  );
}
