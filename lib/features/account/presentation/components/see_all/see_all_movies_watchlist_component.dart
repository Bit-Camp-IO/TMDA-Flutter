import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tmda/config/router/app_router.dart';
import 'package:tmda/core/constants/api_constants.dart';
import 'package:tmda/core/util/assets_manager.dart';
import 'package:tmda/core/widgets/see_all_watchlist_card.dart';
import 'package:tmda/features/account/presentation/bloc/account_see_all/account_see_all_bloc.dart';

class SeeAllMoviesWatchListComponent extends StatefulWidget {
  const SeeAllMoviesWatchListComponent(
      {super.key, required this.scrollController});

  final ScrollController scrollController;

  @override
  State<SeeAllMoviesWatchListComponent> createState() =>
      _SeeAllMoviesWatchListComponentState();
}

class _SeeAllMoviesWatchListComponentState
    extends State<SeeAllMoviesWatchListComponent>
    with AutoRouteAwareStateMixin {
  late int tappedMovieId;

  @override
  void didPopNext() {
    context.read<AccountSeeAllBloc>()
      ..add(CheckForMovieStatesEvent(movieId: tappedMovieId))
      ..add(const CheckForMoviesWatchListStatesEvent())
      ..add(GetAllMoviesWatchListEvent());
    super.didPopNext();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AccountSeeAllBloc, AccountSeeAllState>(
      buildWhen: (previous, current) =>
          previous.moviesWatchList != current.moviesWatchList,
      builder: (context, state) {
        return ListView.builder(
          itemCount: state.moviesWatchList.length,
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
                key: ObjectKey(state.moviesWatchList[index]),
                resizeDuration: const Duration(milliseconds: 200),
                onDismissed: (direction) => context.read<AccountSeeAllBloc>().add(RemoveMovieFromWatchListEvent(movieId: state.moviesWatchList[index].id)),
                child: SeeAllWatchListCard(
                  title: state.moviesWatchList[index].title,
                  posterPath: state.moviesWatchList[index].posterPath.isNotEmpty
                      ? ApiConstants.imageUrl(
                          state.moviesWatchList[index].posterPath)
                      : AssetsManager.noPoster,
                  vote: state.moviesWatchList[index].voteAverage,
                  voteCount: state.moviesWatchList[index].movieVoteCount,
                  onTap: () {
                    tappedMovieId = state.moviesWatchList[index].id;
                    context.pushRoute(MovieDetailsRoute(
                        movieId: state.moviesWatchList[index].id));
                  },
                  genres: state.moviesWatchList[index].genres,
                  releaseYear: state.moviesWatchList[index].releaseDate,
                  language: state.moviesWatchList[index].language,
                ),
              ),
            );
          },
        );
      },
    );
  }
}
