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
import 'package:tmda/core/widgets/section_divider.dart';
import 'package:tmda/core/widgets/section_widget.dart';
import 'package:tmda/core/widgets/section_with_see_all.dart';
import 'package:tmda/features/shared/presentation/blocs/watchlist_bloc/watchlist_bloc.dart';

class MoviesWatchListComponent extends StatelessWidget {
  const MoviesWatchListComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WatchListBloc, WatchListState>(
      builder: (context, state) {
        if (state.moviesWatchList.isEmpty &&
            state.moviesWatchListState == BlocState.success) {
          return CustomFadeAnimation(
            duration: Duration(milliseconds: 150),
            child: Column(
              children: [
                SectionWidget(
                  title: context.tr.moviesWatchlistTitle,
                  color: ColorsManager.primaryColor,
                ),
                SizedBox(
                  height: 200.h,
                  child: Center(
                    child: NeonButton(
                      child: Text(
                        context.tr.emptyMoviesWatchListButtonTitle,
                        style: context.textTheme.bodyLarge!,
                      ),
                      onTap: () {
                        context.navigateTo(const MovieTabRoute());
                      },
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 5.0).r,
                  child: const SectionDivider(),
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
                  title: context.tr.moviesWatchlistTitle,
                  color: ColorsManager.primaryColor,
                  textButtonOnPressed: () {
                    context.pushRoute(
                      AccountSeeAllRoute(
                        watchListType: WatchListType.moviesWatchList,
                      ),
                    );
                  },
                ),
                SizedBox(
                  height: 230.h,
                  child: CustomFadeAnimation(
                    duration: Duration(milliseconds: 400),
                    child: ListView.builder(
                      itemCount: state.moviesWatchList.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        final movie = state.moviesWatchList[index];
                        return Padding(
                          padding: const EdgeInsets.only(left: 16.0).r,
                          child: PosterCard(
                            width: 140,
                            height: 220,
                            errorImagePath: AssetsManager.errorPoster,
                            imagePath: movie.posterPath,
                            title: movie.title,
                            releaseYear: movie.releaseDate,
                            rating: movie.voteAverage,
                            genres: movie.genres,
                            language: movie.language,
                            onTap: () {
                              context.pushRoute(
                                MovieDetailsRoute(
                                  movieId: movie.id,
                                ),
                              );
                            },
                          ),
                        );
                      },
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 5.0).r,
                  child: const SectionDivider(),
                ),
              ],
            ),
          );
        }
      },
    );
  }
}
