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

class SeeAllAiringThisWeekComponent extends StatelessWidget {
  const SeeAllAiringThisWeekComponent(
      {super.key, required this.scrollController});
  final ScrollController scrollController;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TvShowsBloc, TvShowsState>(
      builder: (context, state) {
        switch (state.airingThisWeekState) {
          case BlocState.loading:
            return const Center(
              child: CircularProgressIndicator(),
            );
          case BlocState.success:
            return ListView.builder(
              itemCount: state.airingThisWeekTvShows.length,
              scrollDirection: Axis.vertical,
              controller: scrollController,
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
                              tvShowId: state.airingThisWeekTvShows[index].tvShowId,
                            ),
                          ],
                        ),
                      );
                    },
                    title: state.airingThisWeekTvShows[index].title,
                    posterPath: state.airingThisWeekTvShows[index].posterPath.isNotEmpty
                            ? ApiConstants.imageUrl(state.airingThisWeekTvShows[index].posterPath)
                            : AssetsManager.noPoster,
                    vote: state.airingThisWeekTvShows[index].voteAverage,
                    voteCount: state.airingThisWeekTvShows[index].voteCount,
                    genres: state.airingThisWeekTvShows[index].genres,
                    releaseYear: state.airingThisWeekTvShows[index].firstAirDate,
                    language: state.airingThisWeekTvShows[index].language,
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
