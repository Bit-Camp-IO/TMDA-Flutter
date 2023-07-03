import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:tmda/config/router/app_router.dart';
import 'package:tmda/core/util/assets_manager.dart';
import 'package:tmda/core/widgets/list_card_with_save.dart';
import 'package:tmda/features/tv/presentation/bloc/see_all_tv_shows/see_all_tv_shows_bloc.dart';

class SeeAllTvShowsComponent extends StatefulWidget {
  const SeeAllTvShowsComponent({super.key, required this.scrollController});

  final ScrollController scrollController;

  @override
  State<SeeAllTvShowsComponent> createState() => _SeeAllTvShowsComponentState();
}

class _SeeAllTvShowsComponentState extends State<SeeAllTvShowsComponent>
    with AutoRouteAwareStateMixin<SeeAllTvShowsComponent> {
  late int tappedTvShowId;

  @override
  void didPopNext() {
    context.read<SeeAllTvShowsBloc>()
      ..add(CheckForTvShowStatesEvent(tappedTvShowId))
      ..add(CheckForTvShowsListStatesEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SeeAllTvShowsBloc, SeeAllTvShowsState>(
      builder: (context, state) {
        return ListView.builder(
          controller: widget.scrollController,
          itemCount: state.seeAllTvShows.length + 1,
          scrollDirection: Axis.vertical,
          padding: const EdgeInsets.symmetric(vertical: 100).r,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return index >= state.seeAllTvShows.length
                ? Center(
                    child: Lottie.asset(AssetsManager.neonLoading, width: 200),
                  )
                : Padding(
                    padding: const EdgeInsets.only(
                      left: 24,
                      right: 24,
                      top: 14,
                      bottom: 16.0,
                    ).r,
                    child: ListCardWithSave(
                      onTap: () {
                        tappedTvShowId = state.seeAllTvShows[index].id;
                        AutoRouter.of(context).push(
                          TvDetailsRoute(
                            tvShowId: state.seeAllTvShows[index].id,
                          ),
                        );
                      },
                      title: state.seeAllTvShows[index].title,
                      errorImagePath: AssetsManager.noPoster,
                      posterPath: state.seeAllTvShows[index].posterPath,
                      vote: state.seeAllTvShows[index].voteAverage,
                      voteCount: state.seeAllTvShows[index].voteCount,
                      genres: state.seeAllTvShows[index].genres,
                      releaseYear: state.seeAllTvShows[index].firstAirDate,
                      language: state.seeAllTvShows[index].language,
                      isInWatchList: state
                          .seeAllTvShows[index].accountStates.isInWatchList,
                      onSaved: () {
                        context.read<SeeAllTvShowsBloc>().add(
                              AddOrRemoveFromWatchListEvent(
                                isInWatchList: !state.seeAllTvShows[index]
                                    .accountStates.isInWatchList,
                                tvShowId: state.seeAllTvShows[index].id,
                              ),
                            );
                      },
                    ),
                  );
          },
        );
      },
    );
  }
}
