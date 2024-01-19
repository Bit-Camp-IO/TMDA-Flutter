import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NeonLightPainter extends StatelessWidget {
  const NeonLightPainter({
    super.key,
    required this.color,
  });

  final Color color;

  @override
  Widget build(BuildContext context) {
    return ImageFiltered(
      imageFilter: ImageFilter.blur(
        sigmaX: 50,
        sigmaY: 50,
        tileMode: TileMode.decal,
      ),
      child: Container(
        width: 150.w,
        height: 150.h,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: color,
        ),
      ),
    );
  }
}
