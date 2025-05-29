import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tmda/config/router/app_router.dart';
import 'package:tmda/core/animations/custom_fade_animation.dart';
import 'package:tmda/core/util/assets_manager.dart';
import 'package:tmda/core/util/color_manager.dart';
import 'package:tmda/core/util/enums.dart';
import 'package:tmda/core/util/extensions.dart';
import 'package:tmda/core/widgets/neon_button.dart';
import 'package:tmda/core/widgets/poster_card.dart';
import 'package:tmda/core/widgets/section_widget.dart';
import 'package:tmda/core/widgets/section_with_see_all.dart';
import 'package:tmda/features/shared/presentation/blocs/watchlist_bloc/watchlist_bloc.dart';

class TvShowWatchListComponent extends StatelessWidget {
  const TvShowWatchListComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomFadeAnimation(
      duration: Duration(milliseconds: 400),
      child: BlocBuilder<WatchListBloc, WatchListState>(
        buildWhen: (previous, current) =>
            previous.tvShowsWatchList != current.tvShowsWatchList,
        builder: (context, state) {
          if (state.tvShowsWatchList.isEmpty &&
              state.tvShowsWatchListState == BlocState.success) {
            return CustomFadeAnimation(
              duration: Duration(milliseconds: 400),
              child: Column(
                children: [
                  SectionWidget(
                    title: context.tr.tvShowsWatchlistTitle,
                    color: ColorsManager.primaryColor,
                  ),
                  SizedBox(
                    height: 200.h,
                    child: Center(
                      child: NeonButton(
                        child: Text(
                          context.tr.emptyTvShowsWatchListButtonTitle,
                          style: context.textTheme.bodyLarge!,
                        ),
                        onTap: () {
                          context.navigateTo(const TvShowsTabRoute());
                        },
                      ),
                    ),
                  ),
                ],
              ),
            );
          } else {
            return CustomFadeAnimation(
              duration: Duration(milliseconds: 400),
              child: Column(
                children: [
                  SectionWidgetWithSeeAll(
                    title: context.tr.tvShowsWatchlistTitle,
                    color: ColorsManager.primaryColor,
                    textButtonOnPressed: () {
                      context.pushRoute(
                        AccountSeeAllRoute(
                          watchListType: WatchListType.tvShowWatchList,
                        ),
                      );
                    },
                  ),
                  SizedBox(
                    height: 230.h,
                    child: CustomFadeAnimation(
                      duration: Duration(milliseconds: 400),
                      child: ListView.builder(
                        itemCount: state.tvShowsWatchList.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          final tvShow = state.tvShowsWatchList[index];
                          return Padding(
                            padding: const EdgeInsets.only(left: 16.0).r,
                            child: PosterCard(
                              width: 140,
                              height: 220,
                              errorImagePath: AssetsManager.errorPoster,
                              imagePath: tvShow.posterPath,
                              title: tvShow.title,
                              releaseYear: tvShow.firstAirDate,
                              rating: tvShow.voteAverage,
                              genres: tvShow.genres,
                              language: tvShow.language,
                              onTap: () {
                                context.pushRoute(
                                  TvDetailsRoute(
                                    tvShowId: tvShow.id,
                                  ),
                                );
                              },
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
