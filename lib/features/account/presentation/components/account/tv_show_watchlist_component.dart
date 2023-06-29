import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tmda/config/router/app_router.dart';
import 'package:tmda/core/constants/api_constants.dart';
import 'package:tmda/core/util/color_manager.dart';
import 'package:tmda/core/util/enums.dart';
import 'package:tmda/core/widgets/poster_card.dart';
import 'package:tmda/core/widgets/section_with_see_all.dart';
import 'package:tmda/features/account/presentation/bloc/account/account_bloc.dart';

class TvShowWatchListComponent extends StatelessWidget {
  const TvShowWatchListComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AccountBloc, AccountState>(
      builder: (context, state) {
        return Column(
          children: [
            SectionWidgetWithSeeAll(
              title: 'TvShows Watchlist',
              color: ColorsManager.primaryColor,
              textButtonOnPressed: () {
                context.pushRoute(
                    AccountSeeAllRoute(seeAllType: WatchListType.tvShowWatchList),
                );
              },
            ),
            SizedBox(
              height: 220.h,
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
                        imagePath: ApiConstants.imageUrl(state.watchListTvShows[index].posterPath),
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
          ],
        );
      },
    );
  }
}
