import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tmda/core/icons/solar_system_icons.dart';
import 'package:tmda/core/util/color_manager.dart';
import 'package:tmda/core/util/strings_manager.dart';
import 'package:tmda/core/widgets/section_divider.dart';
import 'package:tmda/features/tv/presentation/bloc/tv_show_details/tv_show_details_bloc.dart';
import 'package:tmda/features/tv/presentation/components/tv_details/recommended_tv_shows_component.dart';
import 'package:tmda/features/tv/presentation/components/tv_details/tv_show_cast_component.dart';
import 'package:tmda/features/tv/presentation/components/tv_details/tv_show_reviews_component.dart';
import 'package:tmda/features/tv/presentation/components/tv_details/similar_tv_shows_component.dart';

class TvShowOverview extends StatelessWidget {
  const TvShowOverview({super.key, required this.tvShowId});
  final int tvShowId;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TvShowDetailsBloc, TvShowDetailsState>(
      builder: (context, state) {
        return Column(
          children: [
            SizedBox(
              height: 120,
              child: Stack(
                children: [
                  Positioned(
                    left: 45,
                    bottom: 5,
                    child: Column(
                      children: [
                        const Icon(
                          SolarSystemIcons.star,
                          color: ColorsManager.ratingIconColor,
                          size: 30,
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
                    right: 45,
                    bottom: 35,
                    child: BlocBuilder<TvShowDetailsBloc, TvShowDetailsState>(
                      buildWhen: (previous, current) =>
                          previous.tvShowDetails.status.isInWatchList !=
                          current.tvShowDetails.status.isInWatchList,
                      builder: (context, state) {
                        return InkWell(
                          onTap: () {
                            context.read<TvShowDetailsBloc>().add(
                                  AddOrRemoveTvFromWatchListEvent(
                                    isInWatchList: !state
                                        .tvShowDetails.status.isInWatchList,
                                    tvShowId: tvShowId,
                                  ),
                                );
                          },
                          child: Column(
                            children: [
                              Icon(
                                state.tvShowDetails.status.isInWatchList
                                    ? SolarSystemIcons.save_outlined
                                    : SolarSystemIcons.save,
                                color: ColorsManager.primaryColor,
                                size: 30,
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
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20.sp,
                fontWeight: FontWeight.w700,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 8.h),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 40.h,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '${state.tvShowDetails.numberOfSeasons} Seasons  ',
                        style: TextStyle(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400,
                          color: Colors.white.withOpacity(0.8),
                        ),
                      ),
                      Text(
                        '${state.tvShowDetails.numberOfEpisodes} Episodes',
                        style: TextStyle(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400,
                          color: Colors.white.withOpacity(0.8),
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
                          color: Colors.white.withOpacity(0.8),
                        ),
                      ),
                      Text(
                        '${state.tvShowDetails.tvShowLanguage.toUpperCase()} ‧ ',
                        style: TextStyle(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400,
                          color: Colors.white.withOpacity(0.8),
                        ),
                      ),
                      Text(
                        state.tvShowDetails.genres.isEmpty
                            ? StringsManager.unknown
                            : state.tvShowDetails.genres[0].name,
                        style: TextStyle(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400,
                          color: Colors.white.withOpacity(0.8),
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
                              color: Colors.white.withOpacity(0.8),
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
                              color: Colors.white.withOpacity(0.8),
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
                              color: Colors.white.withOpacity(0.8),
                            ),
                      ),
                      Text(
                        state.tvShowDetails.network.name,
                        style: Theme.of(context).textTheme.titleMedium,
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
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
            const SectionDivider(),
            TvShowCastComponent(tvShowId: tvShowId),
            RecommendedTvShowsComponent(tvShowId: tvShowId),
            SimilarTvShowsComponent(tvShowId: tvShowId),
            TvShowReviewsComponent(tvShowId: tvShowId),
            SizedBox(height: 70.h),
          ],
        );
      },
    );
  }
}
