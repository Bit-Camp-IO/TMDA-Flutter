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

class MoviesWatchListComponent extends StatelessWidget {
  const MoviesWatchListComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AccountBloc, AccountState>(
      builder: (context, state) {
        return Column(
          children: [
            SectionWidgetWithSeeAll(
              title: 'Movies Watchlist',
              color: ColorsManager.primaryColor,
              textButtonOnPressed: () {
                context.pushRoute(
                  AccountSeeAllRoute(seeAllType: WatchListType.moviesWatchList)
                );
              },
            ),
            SizedBox(
              height: 220.h,
              child: ListView.builder(
                itemCount: state.watchListMovies.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Row(
                    children: [
                      SizedBox(width: 16.w),
                      PosterCard(
                        width: 140,
                        height: 220,
                        imagePath: ApiConstants.imageUrl(state.watchListMovies[index].posterPath),
                        title: state.watchListMovies[index].title,
                        releaseDate: state.watchListMovies[index].releaseDate,
                        rating: state.watchListMovies[index].voteAverage,
                        onTap: () {
                          context.pushRoute(MovieDetailsRoute(movieId: state.watchListMovies[index].id));
                        },
                        genres: state.watchListMovies[index].genres,
                        language: state.watchListMovies[index].language,
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
