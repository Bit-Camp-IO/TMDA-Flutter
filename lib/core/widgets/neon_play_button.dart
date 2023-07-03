import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tmda/core/util/assets_manager.dart';

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
      child: SvgPicture.asset(
        AssetsManager.neonPlayButton,
        width: 50.w,
        height: 50.w,
      ),
    );
  }
}