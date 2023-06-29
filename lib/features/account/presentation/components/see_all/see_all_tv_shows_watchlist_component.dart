import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tmda/config/router/app_router.dart';
import 'package:tmda/core/constants/api_constants.dart';
import 'package:tmda/core/util/assets_manager.dart';
import 'package:tmda/core/widgets/see_all_watchlist_card.dart';
import 'package:tmda/features/account/presentation/bloc/account_see_all/account_see_all_bloc.dart';

class SeeAllTvShowsWatchListComponent extends StatefulWidget {
  const SeeAllTvShowsWatchListComponent(
      {super.key, required this.scrollController});

  final ScrollController scrollController;

  @override
  State<SeeAllTvShowsWatchListComponent> createState() =>
      _SeeAllTvShowsWatchListComponentState();
}

class _SeeAllTvShowsWatchListComponentState
    extends State<SeeAllTvShowsWatchListComponent>
    with AutoRouteAwareStateMixin {
  late int tappedTvShowId;

  @override
  void didPopNext() {
    context.read<AccountSeeAllBloc>()
      ..add(CheckForTvShowStatesEvent(tvShowId: tappedTvShowId))
      ..add(const CheckForTvShowsWatchListStatesEvent())
      ..add(GetAllTvShowsWatchListEvent());
    super.didPopNext();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AccountSeeAllBloc, AccountSeeAllState>(
      buildWhen: (previous, current) =>
          previous.tvShowsWatchList != current.tvShowsWatchList,
      builder: (context, state) {
        return ListView.builder(
          itemCount: state.tvShowsWatchList.length,
          controller: widget.scrollController,
          scrollDirection: Axis.vertical,
          padding: const EdgeInsets.symmetric(vertical: 100).r,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(
                left: 24,
                right: 24,
                top: 14,
                bottom: 16.0,
              ).r,
              child: Dismissible(
                key: ObjectKey(state.tvShowsWatchList[index]),
                resizeDuration: const Duration(milliseconds: 200),
                onDismissed: (direction) => context
                    .read<AccountSeeAllBloc>()
                    .add(RemoveTvShowFromWatchListEvent(
                        tvShowId: state.tvShowsWatchList[index].id)),
                child: SeeAllWatchListCard(
                  title: state.tvShowsWatchList[index].title,
                  posterPath: state.tvShowsWatchList[index].posterPath.isNotEmpty ? ApiConstants.imageUrl(
                              state.tvShowsWatchList[index].posterPath)
                          : AssetsManager.noPoster,
                  vote: state.tvShowsWatchList[index].voteAverage,
                  voteCount: state.tvShowsWatchList[index].voteCount,
                  onTap: () {
                    tappedTvShowId = state.tvShowsWatchList[index].id;
                    context.pushRoute(TvDetailsRoute(
                        tvShowId: state.tvShowsWatchList[index].id));
                  },
                  genres: state.tvShowsWatchList[index].genres,
                  releaseYear: state.tvShowsWatchList[index].firstAirDate,
                  language: state.tvShowsWatchList[index].language,
                ),
              ),
            );
          },
        );
      },
    );
  }
}
