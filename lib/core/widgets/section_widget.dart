import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SectionWidget extends StatelessWidget {
  const SectionWidget({
    super.key,
    required this.title,
    required this.color,
  });
  final String title;
  final Color color;
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
                borderRadius: BorderRadius.all(const Radius.circular(10).w)),
          ),
          SizedBox(width: 8.w),
          Text(
            title,
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ],
      ),
    );
  }
}
