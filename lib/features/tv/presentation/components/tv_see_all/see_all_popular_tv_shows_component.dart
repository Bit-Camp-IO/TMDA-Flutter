import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tmda/config/router/app_router.dart';
import 'package:tmda/core/constants/api_constants.dart';
import 'package:tmda/core/util/assets_manager.dart';
import 'package:tmda/core/util/enums.dart';
import 'package:tmda/features/tv/presentation/bloc/tv_show/tv_show_bloc.dart';
import 'package:tmda/features/tv/presentation/components/tv_see_all/see_all_tv_card.dart';

class SeeAllPopularTvShowsComponent extends StatelessWidget {
  const SeeAllPopularTvShowsComponent(
      {super.key, required this.scrollController});

  final ScrollController scrollController;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TvShowsBloc, TvShowsState>(
      builder: (context, state) {
        switch (state.popularTvShowsState) {
          case BlocState.loading:
            return const Center(
              child: CircularProgressIndicator(),
            );
          case BlocState.success:
            return ListView.builder(
              controller: scrollController,
              itemCount: state.popularTvShows.length,
              scrollDirection: Axis.vertical,
              padding: const EdgeInsets.symmetric(vertical: 100).r,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(
                    left: 24,
                    right: 24,
                    top: 14,
                    bottom: 16.0,
                  ).r,
                  child: SeeAllTvCard(
                    onTap: () {
                      AutoRouter.of(context).push(
                        TvShowDetailsWrapperRoute(
                          children: [
                            TvDetailsRoute(
                              tvShowId: state.popularTvShows[index].tvShowId,
                            ),
                          ],
                        ),
                      );
                    },
                    title: state.popularTvShows[index].title,
                    posterPath: state.popularTvShows[index].posterPath.isNotEmpty
                            ? ApiConstants.imageUrl(state.popularTvShows[index].posterPath)
                            : AssetsManager.noPoster,
                    vote: state.popularTvShows[index].voteAverage,
                    voteCount: state.popularTvShows[index].voteCount,
                    genres: state.popularTvShows[index].genres,
                    releaseYear: state.popularTvShows[index].firstAirDate,
                    language: state.popularTvShows[index].language,
                  ),
                );
              },
            );
          case BlocState.failure:
            return const Center(
              child: Text('There Was an error'),
            );
        }
      },
    );
  }
}
