import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tmda/config/router/app_router.dart';
import 'package:tmda/core/util/assets_manager.dart';
import 'package:tmda/core/util/color_manager.dart';
import 'package:tmda/core/util/enums.dart';
import 'package:tmda/core/util/strings_manager.dart';
import 'package:tmda/core/widgets/poster_card.dart';
import 'package:tmda/core/widgets/section_with_see_all.dart';
import 'package:tmda/features/tv/presentation/bloc/tv_show/tv_show_bloc.dart';

class TvShowsAiringTodayComponent extends StatelessWidget {
  const TvShowsAiringTodayComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SectionWidgetWithSeeAll(
          title: StringsManager.airingTodaySectionTitle,
          color: ColorsManager.primaryColor,
          textButtonOnPressed: () {
            context.pushRoute(
              SeeAllTvShowsRoute(
                tvShowType: TvShowType.airingToday,
              ),
            );
          },
        ),
        BlocBuilder<TvShowsBloc, TvShowsState>(
          builder: (context, state) {
            return SizedBox(
              height: 260.h,
              child: ListView.builder(
                itemCount: state.airingTodayTvShows.length,
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  final airingTodayTvShow = state.airingTodayTvShows[index];
                  return Padding(
                    padding: const EdgeInsets.only(left : 16.0).r,
                    child: PosterCard(
                      onTap: () {
                        context.pushRoute(
                          TvDetailsRoute(
                            tvShowId: airingTodayTvShow.id,
                          ),
                        );
                      },
                      title: airingTodayTvShow.title,
                      errorImagePath: AssetsManager.errorPoster,
                      imagePath: airingTodayTvShow.posterPath,
                      releaseYear: airingTodayTvShow.firstAirDate,
                      rating: airingTodayTvShow.voteAverage,
                      genres: airingTodayTvShow.genres,
                      language: airingTodayTvShow.language,
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
