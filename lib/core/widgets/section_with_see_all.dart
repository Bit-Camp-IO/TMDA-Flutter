import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tmda/core/util/color_manager.dart';
import 'package:tmda/core/util/extensions.dart';

class SectionWidgetWithSeeAll extends StatelessWidget {
  const SectionWidgetWithSeeAll({
    super.key,
    required this.title,
    required this.color,
    required this.textButtonOnPressed,
  });
  final String title;
  final Color color;
  final void Function() textButtonOnPressed;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 22).r,
      child: Row(
        children: [
          Container(
            height: 23.h,
            width: 5.h,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.all(
                const Radius.circular(10).w,
              ),
            ),
          ),
          SizedBox(width: 8.w),
          Text(
            title,
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const Spacer(
            flex: 2,
          ),
          TextButton(
            style: Theme.of(context).textButtonTheme.style,
            onPressed: textButtonOnPressed,
            child: Text(
              context.tr.seeAllButtonTitle,
              style: context.textTheme.bodyMedium!.copyWith(
                fontWeight: FontWeight.w700,
                color: ColorsManager.darkPrimary,
              ),
            ),
          )
        ],
      ),
    );
  }
}
