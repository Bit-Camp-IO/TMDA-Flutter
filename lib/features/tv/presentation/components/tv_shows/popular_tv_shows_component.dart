import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tmda/config/router/app_router.dart';
import 'package:tmda/core/util/assets_manager.dart';
import 'package:tmda/core/util/color_manager.dart';
import 'package:tmda/core/util/enums.dart';
import 'package:tmda/core/util/strings_manager.dart';
import 'package:tmda/core/widgets/poster_card.dart';
import 'package:tmda/core/widgets/section_with_see_all.dart';
import 'package:tmda/features/tv/presentation/bloc/tv_show_cubit/tv_show_cubit.dart';

class PopularTvShowsComponent extends StatelessWidget {
  const PopularTvShowsComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SectionWidgetWithSeeAll(
          title: StringsManager.popularTvShowSectionTitle,
          color: ColorsManager.primaryColor,
          textButtonOnPressed: () {
            context.pushRoute(
              SeeAllTvShowsRoute(
                tvShowType: TvShowType.popularTvShows,
              ),
            );
          },
        ),
        BlocBuilder<TvShowsCubit, TvShowsState>(
          builder: (context, state) {
            return SizedBox(
              height: 260.h,
              child: Animate(
                effects: [FadeEffect(duration: 250.ms)],
                child: ListView.builder(
                  itemCount: state.popularTvShows.length,
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    final popularTvShow = state.popularTvShows[index];
                    return Padding(
                      padding: const EdgeInsets.only(left : 16.0).r,
                      child: PosterCard(
                        onTap: () {
                          context.pushRoute(
                            TvDetailsRoute(
                              tvShowId: popularTvShow.id,
                            ),
                          );
                        },
                        title: popularTvShow.title,
                        errorImagePath: AssetsManager.errorPoster,
                        imagePath: popularTvShow.posterPath,
                        releaseYear: popularTvShow.firstAirDate,
                        rating: popularTvShow.voteAverage,
                        genres: popularTvShow.genres,
                        language: popularTvShow.language,
                      ),
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
