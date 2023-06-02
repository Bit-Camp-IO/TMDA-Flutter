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
    return Container(
      width: 150.w,
      height: 150.h,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color,
      ),
      child: BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: 60,
          sigmaY: 60,
          tileMode: TileMode.clamp
        ),
        child: Container(
          width: 5.w,
          height: 5.h,
          color: Colors.transparent,
        ),
      ),
    );
  }
}
