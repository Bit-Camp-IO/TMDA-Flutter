import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:tmda/config/router/app_router.dart';
import 'package:tmda/core/util/assets_manager.dart';
import 'package:tmda/core/util/enums.dart';
import 'package:tmda/core/widgets/list_card_with_save.dart';
import 'package:tmda/features/movie/presentation/bloc/see_all_movies_bloc/see_all_movies_bloc.dart';
import 'package:tmda/features/shared/presentation/blocs/watchlist_bloc/watchlist_bloc.dart';

class SeeAllMoviesComponent extends StatefulWidget {
  const SeeAllMoviesComponent(
      {super.key, required this.movieType, this.movieId});

  final MovieType movieType;
  final int? movieId;

  @override
  State<SeeAllMoviesComponent> createState() => _SeeAllMoviesComponentState();
}

class _SeeAllMoviesComponentState extends State<SeeAllMoviesComponent> {
  late ScrollController _scrollController;

  void _onScroll() {
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    final seeAllBloc = context.read<SeeAllMoviesBloc>();
    if (currentScroll >= maxScroll * 0.9) {
      switch (widget.movieType) {
        case (MovieType.newMovies):
          seeAllBloc.add(GetAllNewMoviesEvent());
        case (MovieType.popularMovies):
          seeAllBloc.add(GetAllPopularMoviesEvent());
        case (MovieType.topRatedMovies):
          seeAllBloc.add(GetAllTopRatedMoviesEvent());
        case (MovieType.recommendedMovies):
          seeAllBloc
              .add(GetAllRecommendedMoviesEvent(movieId: widget.movieId!));
        case (MovieType.similarMovies):
          seeAllBloc.add(GetAllSimilarMoviesEvent(movieId: widget.movieId!));
      }
    }
  }

  @override
  void initState() {
    _scrollController = ScrollController()..addListener(_onScroll);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SeeAllMoviesBloc, SeeAllMoviesState>(
      buildWhen: (previous, current) =>
          previous.seeAllMovies != current.seeAllMovies,
      builder: (context, state) {
        return ListView.builder(
          itemCount: state.seeAllMovies.length + 1,
          scrollDirection: Axis.vertical,
          controller: _scrollController,
          padding: const EdgeInsets.symmetric(vertical: 100).r,
          itemBuilder: (context, index) {
            if (index >= state.seeAllMovies.length) {
              return Center(
                child: Lottie.asset(AssetsManager.neonLoading, width: 200.w),
              );
            } else {
              final movie = state.seeAllMovies[index];
              return Padding(
                padding: const EdgeInsets.only(
                  left: 24,
                  right: 24,
                  top: 14,
                ).r,
                child: BlocBuilder<WatchListBloc, WatchListState>(
                  builder: (context, state) {
                    final isInWatchList =
                        state.moviesWatchListIdsSet.contains(movie.id);
                    return ListCardWithSave(
                      key: ValueKey(movie.id),
                      onTap: () {
                        context.pushRoute(
                          MovieDetailsRoute(
                            movieId: movie.id,
                          ),
                        );
                      },
                      title: movie.title,
                      errorImagePath: AssetsManager.errorPoster,
                      posterPath: movie.posterPath,
                      vote: movie.voteAverage,
                      voteCount: movie.voteCount,
                      genres: movie.genres,
                      releaseYear: movie.releaseDate,
                      language: movie.language,
                      isInWatchList: isInWatchList,
                      onSaved: () {
                        context.read<WatchListBloc>().add(
                            AddOrRemoveMovieFromWatchListEvent(
                                movieId: movie.id,
                                isInWatchList: !isInWatchList));
                      },
                    );
                  },
                ),
              );
            }
          },
        );
      },
    );
  }

  @override
  void dispose() {
    _scrollController
      ..removeListener(_onScroll)
      ..dispose();
    super.dispose();
  }
}
