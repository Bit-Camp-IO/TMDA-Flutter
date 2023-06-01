import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tmda/core/util/color_manager.dart';

class SectionWidget extends StatelessWidget {
  const SectionWidget({
    Key? key,
    required this.title,
    required this.textButtonTitle,
    required this.color,
    required this.textButtonColor,
    required this.textButtonOnPressed,
  }) : super(key: key);
  final String title;
  final String textButtonTitle;
  final Color color;
  final Color textButtonColor;
  final void Function() textButtonOnPressed;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 22, top: 16, bottom: 16).r,
      child: Row(
        children: [
          Container(
            height: 23.h,
            width: 5.h,
            decoration: BoxDecoration(
                color: color,
                borderRadius: const BorderRadius.all(Radius.circular(10))),
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
            onPressed: textButtonOnPressed,
            child: Text(
              textButtonTitle,
              style: TextStyle(
                color: ColorsManager.secondaryColor,
                fontSize: 12.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
          )
        ],
      ),
    );
  }
}
