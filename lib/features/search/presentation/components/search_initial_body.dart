import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tmda/core/icons/solar_system_icons.dart';
import 'package:tmda/core/util/color_manager.dart';
import 'package:tmda/core/util/strings_manager.dart';

class SearchInitialBody extends StatelessWidget {
  const SearchInitialBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            SolarSystemIcons.search,
            color: ColorsManager.primaryColor,
            size: 70,
          ),
          SizedBox(height: 30.h),
          Text(
            StringsManager.initialSearchTitle,
            style: Theme.of(context)
                .textTheme
                .titleLarge!
                .copyWith(color: ColorsManager.primaryColor),
          ),
      SizedBox(height: 10.h),
          Text(
            StringsManager.initialSearchSubTitle,
            style: Theme.of(context)
                .textTheme
                .titleSmall!
                .copyWith(fontSize: 16, color: Colors.white)
          ),
        ],
      ),
    );
  }
}