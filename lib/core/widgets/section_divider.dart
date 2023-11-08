import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tmda/core/util/color_manager.dart';

class SectionDivider extends StatelessWidget {
  const SectionDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0).r,
      child: const Divider(
        color: ColorsManager.inActiveColor,
        thickness: 1,
        indent: 20,
        endIndent: 30,
      ),
    );
  }
}
