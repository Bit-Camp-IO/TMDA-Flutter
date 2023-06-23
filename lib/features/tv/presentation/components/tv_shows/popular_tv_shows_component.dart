import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:tmda/config/router/app_router.dart';
import 'package:tmda/core/constants/api_constants.dart';
import 'package:tmda/core/util/color_manager.dart';
import 'package:tmda/core/util/enums.dart';
import 'package:tmda/core/widgets/section_with_see_all.dart';
import 'package:tmda/features/tv/presentation/bloc/tv_show/tv_show_bloc.dart';
import 'package:tmda/features/tv/presentation/components/tv_poster_card.dart';

class PopularTvShowsComponent extends StatelessWidget {
  const PopularTvShowsComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TvShowsBloc, TvShowsState>(
      buildWhen: (previous, current) =>
          previous.popularTvShowsState != current.popularTvShowsState,
      builder: (context, state) {
        switch (state.popularTvShowsState) {
          case BlocState.loading:
            return SizedBox(
              height: 270.h,
              child: Center(
                child: Lottie.asset('assets/lottie/neon_loading.json'),
              ),
            );
          case BlocState.success:
            return Column(
              children: [
                SectionWidgetWithSeeAll(
                  title: 'Popular Shows',
                  color: ColorsManager.primaryColor,
                  textButtonOnPressed: () {
                    context.pushRoute(
                      SeeAllTvShowsRoute(
                        tvShowType: TvShowType.popularTvShows,
                      ),
                    );
                  },
                ),
                SizedBox(
                  height: 280.h,
                  child: Animate(
                    effects: [FadeEffect(duration: 250.ms)],
                    child: ListView.builder(
                      itemCount: 20,
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return Row(
                          children: [
                            SizedBox(width: 24.w),
                            TvPosterCard(
                              onTap: () {
                                AutoRouter.of(context).push(
                                  TvShowDetailsWrapperRoute(
                                    children: [
                                      TvDetailsRoute(
                                        tvShowId: state
                                            .popularTvShows[index]
                                            .tvShowId,
                                      ),
                                    ],
                                  ),
                                );
                              },
                              title: state.popularTvShows[index].title,
                              imagePath: ApiConstants.imageUrl(
                                  state.popularTvShows[index].posterPath),
                              releaseDate:
                                  state.popularTvShows[index].firstAirDate,
                              rating: state.popularTvShows[index].voteAverage,
                              genres: state.popularTvShows[index].genres,
                              language: state.popularTvShows[index].language,
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                ),
              ],
            );
          case BlocState.failure:
            return const Text('There Was an error');
        }
      },
    );
  }
}
