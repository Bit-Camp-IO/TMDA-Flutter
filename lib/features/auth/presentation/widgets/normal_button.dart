import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tmda/core/util/color_manager.dart';

class NormalButton extends StatelessWidget {
  const NormalButton({
    super.key,
    required this.onTap,
    required this.child,
    required this.width,
    required this.height
  });
  final void Function() onTap;
  final Widget child;
  final double width;
  final double height;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: ColorsManager.darkPrimary,
          borderRadius: BorderRadius.circular(10).r,
        ),
        child: Center(
          child: child,
        ),
      ),
    );
  }
}
