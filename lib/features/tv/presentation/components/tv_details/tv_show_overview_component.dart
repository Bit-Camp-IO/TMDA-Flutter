import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tmda/core/icons/solar_system_icons.dart';
import 'package:tmda/core/util/color_manager.dart';
import 'package:tmda/core/util/extensions.dart';
import 'package:tmda/core/widgets/section_divider.dart';
import 'package:tmda/features/shared/presentation/blocs/watchlist_bloc/watchlist_bloc.dart';
import 'package:tmda/features/tv/presentation/bloc/tv_show_details_cubit/tv_show_details_cubit.dart';

class TvShowOverview extends StatelessWidget {
  final int tvShowId;
  const TvShowOverview({super.key, required this.tvShowId});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TvShowDetailsCubit, TvShowDetailsState>(
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
                              style: context.textTheme.titleMedium,
                            ),
                            Text(
                              context.tr.maxRate,
                              style: context.textTheme.bodyMedium,
                            ),
                          ],
                        ),
                        SizedBox(height: 4.h),
                        Text(
                          state.tvShowDetails.popularity.toString(),
                          style: context.textTheme.bodyMedium,
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    right: 45.w,
                    bottom: 35.h,
                    child: BlocBuilder<WatchListBloc, WatchListState>(
                      builder: (context, state) {
                        final bool isInWatchList =
                            state.tvShowsWatchListIdsSet.contains(tvShowId);
                        return InkWell(
                          onTap: () {
                            context.read<WatchListBloc>().add(
                                AddOrRemoveTvShowFromWatchListEvent(
                                    tvShowId: tvShowId,
                                    isInWatchList: !isInWatchList));
                          },
                          child: Icon(
                            isInWatchList
                                ? SolarSystemIcons.saved
                                : SolarSystemIcons.unsaved,
                            color: ColorsManager.primaryColor,
                            size: 30.sp,
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
                        context.tr
                            .tvShowSeasons(state.tvShowDetails.numberOfSeasons),
                        style: TextStyle(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400,
                          color: ColorsManager.inActiveColor,
                        ),
                      ),
                      Text(
                        context.tr.tvShowEpisodes(
                            state.tvShowDetails.numberOfEpisodes),
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
                            ? context.tr.unknown
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
                        context.tr.airedTitle,
                        style: context.textTheme.titleSmall!.copyWith(
                          color: ColorsManager.inActiveColor,
                        ),
                      ),
                      Text(
                        state.tvShowDetails.firstAirDate.length > 4
                            ? state.tvShowDetails.firstAirDate.substring(0, 4)
                            : context.tr.unknown,
                        style: context.textTheme.titleMedium,
                      )
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        context.tr.productionCountry,
                        style: context.textTheme.titleSmall!.copyWith(
                          color: ColorsManager.inActiveColor,
                        ),
                      ),
                      Text(
                        state.tvShowDetails.tvShowProductionCountry.countryCode,
                        style: context.textTheme.titleMedium,
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        context.tr.from,
                        style: context.textTheme.titleSmall!.copyWith(
                          color: ColorsManager.inActiveColor,
                        ),
                      ),
                      Text(
                        state.tvShowDetails.network.name,
                        overflow: TextOverflow.ellipsis,
                        style: context.textTheme.titleMedium,
                      )
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 8.0).r,
              child: Text(
                state.tvShowDetails.overview,
                textAlign: TextAlign.center,
                style: context.textTheme.bodyMedium,
              ),
            ),
            const SectionDivider(),
          ],
        );
      },
    );
  }
}
