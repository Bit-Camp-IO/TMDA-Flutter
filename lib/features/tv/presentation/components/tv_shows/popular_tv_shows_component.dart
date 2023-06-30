import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tmda/config/router/app_router.dart';
import 'package:tmda/core/util/assets_manager.dart';
import 'package:tmda/core/util/color_manager.dart';
import 'package:tmda/core/util/enums.dart';
import 'package:tmda/core/widgets/poster_card.dart';
import 'package:tmda/core/widgets/section_with_see_all.dart';
import 'package:tmda/features/tv/presentation/bloc/tv_show/tv_show_bloc.dart';

class PopularTvShowsComponent extends StatelessWidget {
  const PopularTvShowsComponent({super.key});

  @override
  Widget build(BuildContext context) {
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
        BlocBuilder<TvShowsBloc, TvShowsState>(
          builder: (context, state) {
            return SizedBox(
              height: 280.h,
              child: Animate(
                effects: [FadeEffect(duration: 250.ms)],
                child: ListView.builder(
                  itemCount: state.popularTvShows.length,
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Row(
                      children: [
                        SizedBox(width: 24.w),
                        PosterCard(
                          onTap: () {
                            context.pushRoute(
                              TvDetailsRoute(
                                tvShowId: state.popularTvShows[index].id,
                              ),
                            );
                          },
                          title: state.popularTvShows[index].title,
                          errorImagePath: AssetsManager.noPoster,
                          imagePath: state.popularTvShows[index].posterPath,
                          releaseDate: state.popularTvShows[index].firstAirDate,
                          rating: state.popularTvShows[index].voteAverage,
                          genres: state.popularTvShows[index].genres,
                          language: state.popularTvShows[index].language,
                        ),
                      ],
                    );
                  },
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
