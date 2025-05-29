import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tmda/core/icons/solar_system_icons.dart';
import 'package:tmda/core/util/color_manager.dart';
import 'package:tmda/core/util/extensions.dart';
import 'package:tmda/core/widgets/normal_button.dart';

class NoConnection extends StatelessWidget {
  const NoConnection({
    super.key,
    required this.onTap,
  });
  final void Function() onTap;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            SolarSystemIcons.wifi,
            color: ColorsManager.primaryColor,
            size: 100.sp,
          ),
          SizedBox(height: 30.h),
          Text(
            context.tr.error,
            style: context.textTheme.titleLarge!
                .copyWith(color: ColorsManager.primaryColor),
          ),
          Text(
            context.tr.checkYourConnection,
            style: context.textTheme.titleSmall!
                .copyWith(fontSize: 18.sp, color: ColorsManager.darkPrimary),
          ),
          SizedBox(height: 40.h),
          NormalButton(
            onTap: onTap,
            width: 180.w,
            height: 48.h,
            child: Text(
              context.tr.tryAgain,
              style: context.textTheme.titleSmall!
                  .copyWith(fontWeight: FontWeight.w500),
            ),
          )
        ],
      ),
    );
  }
}
