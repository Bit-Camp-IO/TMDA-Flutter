import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tmda/config/router/app_router.dart';
import 'package:tmda/core/constants/api_constants.dart';
import 'package:tmda/core/util/assets_manager.dart';
import 'package:tmda/features/tv/presentation/bloc/tv_show/tv_show_bloc.dart';
import 'package:tmda/features/tv/presentation/components/tv_see_all/see_all_tv_card.dart';

class SeeAllTopRatedComponent extends StatelessWidget {
  const SeeAllTopRatedComponent({
    Key? key,
    required this.scrollController,
  }) : super(key: key);
  final ScrollController scrollController;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TvShowsBloc, TvShowsState>(
      builder: (context, state) {
        return ListView.builder(
          itemCount: state.topRatedTvShows.length,
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
                          tvShowId: state.topRatedTvShows[index].tvShowId,
                        ),
                      ],
                    ),
                  );
                },
                title: state.topRatedTvShows[index].title,
                posterPath:
                    state.topRatedTvShows[index].posterPath.isNotEmpty
                        ? ApiConstants.imageUrl(
                            state.topRatedTvShows[index].posterPath)
                        : AssetsManager.noPoster,
                vote: state.topRatedTvShows[index].voteAverage,
                voteCount: state.topRatedTvShows[index].voteCount,
                genres: state.topRatedTvShows[index].genres,
                releaseYear: state.topRatedTvShows[index].firstAirDate,
                language: state.topRatedTvShows[index].language,
              ),
            );
          },
        );
      },
    );
  }
}
