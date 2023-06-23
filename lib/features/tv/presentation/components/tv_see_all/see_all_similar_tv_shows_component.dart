import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tmda/config/router/app_router.dart';
import 'package:tmda/core/constants/api_constants.dart';
import 'package:tmda/core/util/assets_manager.dart';
import 'package:tmda/features/tv/presentation/bloc/tv_details/tv_details_bloc.dart';
import 'package:tmda/features/tv/presentation/components/tv_see_all/see_all_tv_card.dart';

class SeeAllSimilarTvShowsComponent extends StatelessWidget {
  const SeeAllSimilarTvShowsComponent(
      {super.key, required this.scrollController});

  final ScrollController scrollController;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TvDetailsBloc, TvDetailsState>(
      builder: (context, state) {
        return ListView.builder(
          controller: scrollController,
          itemCount: state.tvShowDetails.similarTvShows.length,
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
                          tvShowId: state
                              .tvShowDetails.similarTvShows[index].tvShowId,
                        ),
                      ],
                    ),
                  );
                },
                title: state.tvShowDetails.similarTvShows[index].title,
                posterPath: state.tvShowDetails.similarTvShows[index].posterPath
                        .isNotEmpty
                    ? ApiConstants.imageUrl(
                        state.tvShowDetails.similarTvShows[index].posterPath)
                    : AssetsManager.noPoster,
                vote: state.tvShowDetails.similarTvShows[index].voteAverage,
                voteCount: state.tvShowDetails.similarTvShows[index].voteCount,
                genres: state.tvShowDetails.similarTvShows[index].genres,
                releaseYear:
                    state.tvShowDetails.similarTvShows[index].firstAirDate,
                language: state.tvShowDetails.similarTvShows[index].language,
              ),
            );
          },
        );
      },
    );
  }
}
