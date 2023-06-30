import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tmda/config/router/app_router.dart';
import 'package:tmda/core/util/assets_manager.dart';
import 'package:tmda/core/util/color_manager.dart';
import 'package:tmda/core/util/enums.dart';
import 'package:tmda/core/widgets/poster_card.dart';
import 'package:tmda/core/widgets/section_with_see_all.dart';
import 'package:tmda/features/tv/presentation/bloc/tv_show/tv_show_bloc.dart';

class TopRatedTvShowsComponent extends StatelessWidget {
  const TopRatedTvShowsComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SectionWidgetWithSeeAll(
          title: 'Top Rated',
          color: ColorsManager.primaryColor,
          textButtonOnPressed: () {
            context.pushRoute(
              SeeAllTvShowsRoute(
                tvShowType: TvShowType.topRatedTvShows,
              ),
            );
          },
        ),
        BlocBuilder<TvShowsBloc, TvShowsState>(
          builder: (context, state) {
            return SizedBox(
              height: 260.h,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: state.topRatedTvShows.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Row(
                    children: [
                      SizedBox(width: 24.w),
                      PosterCard(
                        onTap: () {
                          context.pushRoute(
                            TvDetailsRoute(
                              tvShowId: state.topRatedTvShows[index].id,
                            ),
                          );
                        },
                        title: state.topRatedTvShows[index].title,
                        errorImagePath: AssetsManager.noPoster,
                        imagePath: state.topRatedTvShows[index].posterPath,
                        releaseDate: state.topRatedTvShows[index].firstAirDate,
                        rating: state.topRatedTvShows[index].voteAverage,
                        genres: state.topRatedTvShows[index].genres,
                        language: state.topRatedTvShows[index].language,
                      ),
                    ],
                  );
                },
              ),
            );
          },
        ),
      ],
    );
  }
}
