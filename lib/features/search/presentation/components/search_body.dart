import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tmda/core/icons/solar_system_icons.dart';
import 'package:tmda/core/util/color_manager.dart';

class SearchBody extends StatelessWidget {
  const SearchBody({
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
            'Search for what you want.',
            style: Theme.of(context)
                .textTheme
                .titleLarge!
                .copyWith(color: ColorsManager.primaryColor),
          ),
          Text(
            'Movies, TvShows, Persons.',
            style: Theme.of(context)
                .textTheme
                .titleSmall!
                .copyWith(fontSize: 16, color: ColorsManager.darkPrimary),
          ),
        ],
      ),
    );
  }
}