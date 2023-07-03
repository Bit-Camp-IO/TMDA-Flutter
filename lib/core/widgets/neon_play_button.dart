import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tmda/core/icons/solar_system_icons.dart';
import 'package:tmda/core/util/assets_manager.dart';
import 'package:tmda/core/util/color_manager.dart';

class NeonPlayButton extends StatelessWidget {
  const NeonPlayButton({
    super.key,
    required this.onTap,
  });

  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 50.w,
        height: 50.w,
        alignment: Alignment.center,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              ColorsManager.primaryColor,
              ColorsManager.primaryColor,
              ColorsManager.primaryColor,
              ColorsManager.primaryColor,
              ColorsManager.secondaryColor,
              ColorsManager.secondaryColor,
              ColorsManager.secondaryColor,
              ColorsManager.secondaryColor,
            ],
          ),
        ),
        child: Container(
          width: 50.w,
          height: 50.h,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.black.withOpacity(0.8),
          ),
          child: const Icon(
            SolarSystemIcons.play,
            color: Colors.white,
            size: 20,
          ),
        ),
      ),
    );
  }
}
