import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tmda/core/icons/solar_system_icons.dart';
import 'package:tmda/core/util/color_manager.dart';
import 'package:tmda/core/util/strings_manager.dart';
import 'package:tmda/core/widgets/section_divider.dart';
import 'package:tmda/features/tv/presentation/bloc/tv_show_details/tv_show_details_bloc.dart';

class TvShowOverview extends StatelessWidget {
  const TvShowOverview({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TvShowDetailsBloc, TvShowDetailsState>(
      builder: (context, state) {
        return Column(
          children: [
            SizedBox(
              height: 120.h,
              child: Stack(
                children: [
                  Positioned(
                    left: 45.w,
                    bottom: 5.h,
                    child: Column(
                      children: [
                        Icon(
                          SolarSystemIcons.star,
                          color: ColorsManager.ratingIconColor,
                          size: 30.sp,
                        ),
                        SizedBox(height: 4.h),
                        Row(
                          children: [
                            Text(
                              state.tvShowDetails.voteAverage
                                  .toStringAsFixed(1),
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                            Text(
                              StringsManager.maxRate,
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                          ],
                        ),
                        SizedBox(height: 4.h),
                        Text(
                          state.tvShowDetails.popularity.toString(),
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    right: 45.w,
                    bottom: 35.h,
                    child: BlocBuilder<TvShowDetailsBloc, TvShowDetailsState>(
                      buildWhen: (previous, current) =>
                          previous.tvShowDetails.status.isInWatchList != current.tvShowDetails.status.isInWatchList,
                      builder: (context, state) {
                        return InkWell(
                          onTap: () {
                            context.read<TvShowDetailsBloc>().add(
                                  AddOrRemoveTvFromWatchListEvent(
                                    isInWatchList: !state
                                        .tvShowDetails.status.isInWatchList,
                                    tvShowId: state.tvShowDetails.id,
                                  ),
                                );
                          },
                          child: Column(
                            children: [
                              Icon(
                                state.tvShowDetails.status.isInWatchList
                                    ? SolarSystemIcons.saved
                                    : SolarSystemIcons.unsaved,
                                color: ColorsManager.primaryColor,
                                size: 30.sp,
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0).r,
              child: const SectionDivider(),
            ),
            Text(
              state.tvShowDetails.title,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20.sp,
                fontWeight: FontWeight.w700,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 8.h),
            SizedBox(
              width: MediaQuery.sizeOf(context).width,
              height: 40.h,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        StringsManager.tvShowSeasons(state.tvShowDetails.numberOfSeasons),
                        style: TextStyle(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400,
                          color: ColorsManager.inActiveColor,
                        ),
                      ),
                      Text(
                        StringsManager.tvShowEpisodes(state.tvShowDetails.numberOfEpisodes),
                        style: TextStyle(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400,
                          color: ColorsManager.inActiveColor,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '${state.tvShowDetails.lastAirDate.substring(0, 4)} ‧ ',
                        style: TextStyle(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400,
                          color: ColorsManager.inActiveColor,
                        ),
                      ),
                      Text(
                        '${state.tvShowDetails.tvShowLanguage.toUpperCase()} ‧ ',
                        style: TextStyle(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400,
                          color: ColorsManager.inActiveColor,
                        ),
                      ),
                      Text(
                        state.tvShowDetails.genres.isEmpty
                            ? StringsManager.unknown
                            : state.tvShowDetails.genres[0].name,
                        style: TextStyle(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400,
                          color: ColorsManager.inActiveColor,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 24.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      Text(
                        StringsManager.airedTitle,
                        style: Theme.of(context).textTheme.titleSmall!.copyWith(
                              color: ColorsManager.inActiveColor,
                            ),
                      ),
                      Text(
                        state.tvShowDetails.firstAirDate.length > 4
                            ? state.tvShowDetails.firstAirDate.substring(0, 4)
                            : StringsManager.unknown,
                        style: Theme.of(context).textTheme.titleMedium,
                      )
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        StringsManager.productionCountry,
                        style: Theme.of(context).textTheme.titleSmall!.copyWith(
                              color: ColorsManager.inActiveColor,
                            ),
                      ),
                      Text(
                        state.tvShowDetails.tvShowProductionCountry.countryCode,
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        StringsManager.from,
                        style: Theme.of(context).textTheme.titleSmall!.copyWith(
                              color: ColorsManager.inActiveColor,
                            ),
                      ),
                      Text(
                        state.tvShowDetails.network.name,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.titleMedium,
                      )
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 8.0).r,
              child: Text(
                state.tvShowDetails.overview,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
            const SectionDivider(),
          ],
        );
      },
    );
  }
}
