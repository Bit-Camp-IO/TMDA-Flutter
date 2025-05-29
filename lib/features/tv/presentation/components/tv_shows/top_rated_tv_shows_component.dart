import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tmda/config/router/app_router.dart';
import 'package:tmda/core/util/assets_manager.dart';
import 'package:tmda/core/util/color_manager.dart';
import 'package:tmda/core/util/enums.dart';
import 'package:tmda/core/util/extensions.dart';
import 'package:tmda/core/widgets/poster_card.dart';
import 'package:tmda/core/widgets/section_with_see_all.dart';
import 'package:tmda/features/tv/presentation/bloc/tv_show_cubit/tv_show_cubit.dart';

class TopRatedTvShowsComponent extends StatelessWidget {
  const TopRatedTvShowsComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SectionWidgetWithSeeAll(
          title: context.tr.topRatedTvShowSectionTitle,
          color: ColorsManager.primaryColor,
          textButtonOnPressed: () {
            context.pushRoute(
              SeeAllTvShowsRoute(
                tvShowType: TvShowType.topRatedTvShows,
              ),
            );
          },
        ),
        BlocBuilder<TvShowsCubit, TvShowsState>(
          builder: (context, state) {
            return SizedBox(
              height: 260.h,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: state.topRatedTvShows.length,
                itemBuilder: (context, index) {
                  final topRatedTvShow = state.topRatedTvShows[index];
                  return Padding(
                    padding: const EdgeInsets.only(left: 16.0).r,
                    child: PosterCard(
                      onTap: () {
                        context.pushRoute(
                          TvDetailsRoute(
                            tvShowId: topRatedTvShow.id,
                          ),
                        );
                      },
                      title: topRatedTvShow.title,
                      errorImagePath: AssetsManager.errorPoster,
                      imagePath: topRatedTvShow.posterPath,
                      releaseYear: topRatedTvShow.firstAirDate,
                      rating: topRatedTvShow.voteAverage,
                      genres: topRatedTvShow.genres,
                      language: topRatedTvShow.language,
                    ),
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
