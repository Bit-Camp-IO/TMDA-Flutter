part of 'see_all_tv_shows_bloc.dart';

class SeeAllTvShowsState extends Equatable {
  final List<TvShow> seeAllTvShows;
  final BlocState seeAllState;
  final String seeAllFailMessage;
  final bool hasSeeAllTvShowsListReachedMax;
  final String addOrRemoveFromWatchListFailMessage;
  final String checkForTvShowStatesFailMessage;

  const SeeAllTvShowsState({
    this.seeAllTvShows = const [],
    this.seeAllState = BlocState.loading,
    this.seeAllFailMessage = '',
    this.hasSeeAllTvShowsListReachedMax = false,
    this.addOrRemoveFromWatchListFailMessage = '',
    this.checkForTvShowStatesFailMessage = '',
  });

  SeeAllTvShowsState copyWith({
    List<TvShow>? seeAllTvShows,
    BlocState? seeAllState,
    String? seeAllFailMessage,
    bool? hasSeeAllTvShowsListReachedMax,
    String? addOrRemoveFromWatchListFailMessage,
    String? checkForTvShowStatesFailMessage,
  }) {
    return SeeAllTvShowsState(
      seeAllTvShows: seeAllTvShows ?? this.seeAllTvShows,
      seeAllState: seeAllState ?? this.seeAllState,
      seeAllFailMessage: seeAllFailMessage ?? this.seeAllFailMessage,
      hasSeeAllTvShowsListReachedMax: hasSeeAllTvShowsListReachedMax ?? this.hasSeeAllTvShowsListReachedMax,
      addOrRemoveFromWatchListFailMessage: addOrRemoveFromWatchListFailMessage ?? this.addOrRemoveFromWatchListFailMessage,
      checkForTvShowStatesFailMessage: checkForTvShowStatesFailMessage ?? this.checkForTvShowStatesFailMessage,
    );
  }

  @override
  List<Object?> get props => [
    seeAllTvShows,
    seeAllState,
    seeAllFailMessage,
    hasSeeAllTvShowsListReachedMax,
    addOrRemoveFromWatchListFailMessage,
    checkForTvShowStatesFailMessage
  ];
}
