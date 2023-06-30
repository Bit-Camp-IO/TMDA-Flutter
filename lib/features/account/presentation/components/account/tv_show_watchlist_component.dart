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
import 'package:tmda/core/widgets/section_widget.dart';
import 'package:tmda/core/widgets/section_with_see_all.dart';
import 'package:tmda/features/account/presentation/bloc/account/account_bloc.dart';
import 'package:tmda/features/auth/presentation/widgets/neon_button.dart';

class TvShowWatchListComponent extends StatelessWidget {
  const TvShowWatchListComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Animate(
      effects: [FadeEffect(duration: 400.ms)],
      child: BlocBuilder<AccountBloc, AccountState>(
        buildWhen: (previous, current) => previous.watchListTvShows != current.watchListTvShows,
        builder: (context, state) {
          if(state.watchListTvShows.isEmpty){
            return Animate(
              effects: [FadeEffect(duration: 150.ms)],
              child: Column(
                children: [
                  const SectionWidget(
                    title: StringsManager.tvShowsWatchlistTitle,
                    color: ColorsManager.primaryColor,
                  ),
                  SizedBox(
                    height: 200.h,
                    child: Center(
                      child: NeonButton(
                        child: Text(
                          StringsManager.emptyTvShowsWatchListButtonTitle,
                          style: Theme.of(context).textTheme.titleMedium!,
                        ),
                        onTap: () {
                          context.navigateTo(const TvTabRoutePage());
                        },
                      ),
                    ),
                  ),
                ],
              ),
            );
          }else{
            return Animate(
              effects: [FadeEffect(duration: 150.ms)],
              child: Column(
                children: [
                  SectionWidgetWithSeeAll(
                    title: StringsManager.tvShowsWatchlistTitle,
                    color: ColorsManager.primaryColor,
                    textButtonOnPressed: () {
                      context.pushRoute(
                        AccountSeeAllRoute(seeAllType: WatchListType.tvShowWatchList),
                      );
                    },
                  ),
                  SizedBox(
                    height: 220.h,
                    child: Animate(
                      effects: [FadeEffect(duration: 400.ms)],
                      child: ListView.builder(
                        itemCount: state.watchListTvShows.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return Row(
                            children: [
                              SizedBox(width: 16.w),
                              PosterCard(
                                width: 140,
                                height: 220,
                                errorImagePath: AssetsManager.noPoster,
                                imagePath: state.watchListTvShows[index].posterPath,
                                title: state.watchListTvShows[index].title,
                                releaseDate: state.watchListTvShows[index].firstAirDate,
                                rating: state.watchListTvShows[index].voteAverage,
                                onTap: () {
                                  context.pushRoute(TvDetailsRoute(tvShowId: state.watchListTvShows[index].id));
                                },
                                genres: state.watchListTvShows[index].genres,
                                language: state.watchListTvShows[index].language,
                              ),
                            ],
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
