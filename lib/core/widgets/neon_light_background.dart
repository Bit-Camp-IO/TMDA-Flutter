import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tmda/core/util/color_manager.dart';
import 'package:tmda/core/widgets/custom_icon_button.dart';
import 'package:tmda/core/widgets/neon_light_painter.dart';

class NeonLightBackGround extends StatelessWidget {
  final Widget child;
  final bool isBackButtonActive;
  final String? backButtonTitle;

  const NeonLightBackGround(
      {super.key,
      required this.child,
      this.isBackButtonActive = false,
      this.backButtonTitle});

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Positioned(
          top: 30.h,
          left: 20.w,
          child: const NeonLightPainter(color: ColorsManager.primaryColor),
        ),
        Positioned(
          bottom: 350.h,
          right: 0,
          child: const NeonLightPainter(color: ColorsManager.secondaryColor),
        ),
        Positioned(
          bottom: 10.h,
          left: 10.w,
          child: const NeonLightPainter(color: ColorsManager.primaryColor),
        ),
        child,
        Visibility(
          visible: isBackButtonActive,
          child: Positioned(
            top: 50.h,
            left: 20.w,
            child: Row(
              children: [
                CustomIconButton(
                  onPressed: () {
                    context.pop();
                  },
                  icon: Icons.arrow_back,
                ),
                SizedBox(width: backButtonTitle != null ? 16.w : 0),
                Visibility(
                  visible: backButtonTitle != null,
                  child: Text(
                    backButtonTitle ?? '',
                    style: TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
