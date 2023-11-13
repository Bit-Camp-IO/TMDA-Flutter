part of 'watchlist_bloc.dart';

class WatchListState extends Equatable {
  final BlocState moviesWatchListState;
  final String moviesWatchListFailMessage;
  final List<Movie> moviesWatchList;
  final Set<int> moviesWatchListIdsSet;
  final bool hasMoviesWatchListReachedMax;
  final BlocState tvShowsWatchListState;
  final String tvShowsWatchListFailMessage;
  final List<TvShow> tvShowsWatchList;
  final Set<int> tvShowsWatchListIdsSet;
  final String addOrRemoveMovieFromWatchListFailMessage;
  final String addOrRemoveTvShowFromWatchListFailMessage;
  final bool hasTvShowsWatchListReachedMax;

  final bool isMoviesWatchListViewHasReachedMaxScroll;
  final bool isTvShowsWatchListViewHasReachedMaxScroll;
  const WatchListState({
    this.moviesWatchListState = BlocState.initial,
    this.moviesWatchListFailMessage = '',
    this.moviesWatchList = const [],
    this.moviesWatchListIdsSet = const {},
    this.tvShowsWatchListState = BlocState.initial,
    this.tvShowsWatchListFailMessage = '',
    this.tvShowsWatchList = const [],
    this.tvShowsWatchListIdsSet = const {},
    this.addOrRemoveMovieFromWatchListFailMessage = '',
    this.addOrRemoveTvShowFromWatchListFailMessage = '',
    this.hasMoviesWatchListReachedMax = false,
    this.hasTvShowsWatchListReachedMax = false,
    this.isMoviesWatchListViewHasReachedMaxScroll = false,
    this.isTvShowsWatchListViewHasReachedMaxScroll = false,
  });

  @override
  List<Object?> get props => [
        moviesWatchListState,
        moviesWatchListFailMessage,
        moviesWatchList,
        moviesWatchListIdsSet,
        tvShowsWatchListState,
        tvShowsWatchListFailMessage,
        tvShowsWatchList,
        tvShowsWatchListIdsSet,
        addOrRemoveMovieFromWatchListFailMessage,
        addOrRemoveTvShowFromWatchListFailMessage,
        hasMoviesWatchListReachedMax,
        hasTvShowsWatchListReachedMax,
        isMoviesWatchListViewHasReachedMaxScroll,
        isTvShowsWatchListViewHasReachedMaxScroll,
      ];

  WatchListState copyWith({
    BlocState? moviesWatchListState,
    String? moviesWatchListFailMessage,
    List<Movie>? moviesWatchList,
    Set<int>? moviesWatchListIdsSet,
    bool? hasMoviesWatchListReachedMax,
    BlocState? tvShowsWatchListState,
    String? tvShowsWatchListFailMessage,
    List<TvShow>? tvShowsWatchList,
    Set<int>? tvShowsWatchListIdsSet,
    String? addOrRemoveMovieFromWatchListFailMessage,
    String? addOrRemoveTvShowFromWatchListFailMessage,
    bool? hasTvShowsWatchListReachedMax,
    bool? isMoviesWatchListViewHasReachedMaxScroll,
    bool? isTvShowsWatchListViewHasReachedMaxScroll,
  }) {
    return WatchListState(
      moviesWatchListState: moviesWatchListState ?? this.moviesWatchListState,
      moviesWatchListFailMessage: moviesWatchListFailMessage ?? this.moviesWatchListFailMessage,
      moviesWatchList: moviesWatchList ?? this.moviesWatchList,
      moviesWatchListIdsSet: moviesWatchListIdsSet ?? this.moviesWatchListIdsSet,
      hasMoviesWatchListReachedMax: hasMoviesWatchListReachedMax ?? this.hasMoviesWatchListReachedMax,
      tvShowsWatchListState: tvShowsWatchListState ?? this.tvShowsWatchListState,
      tvShowsWatchListFailMessage: tvShowsWatchListFailMessage ?? this.tvShowsWatchListFailMessage,
      tvShowsWatchList: tvShowsWatchList ?? this.tvShowsWatchList,
      tvShowsWatchListIdsSet: tvShowsWatchListIdsSet ?? this.tvShowsWatchListIdsSet,
      addOrRemoveMovieFromWatchListFailMessage: addOrRemoveMovieFromWatchListFailMessage ?? this.addOrRemoveMovieFromWatchListFailMessage,
      addOrRemoveTvShowFromWatchListFailMessage: addOrRemoveTvShowFromWatchListFailMessage ?? this.addOrRemoveTvShowFromWatchListFailMessage,
      hasTvShowsWatchListReachedMax: hasTvShowsWatchListReachedMax ?? this.hasTvShowsWatchListReachedMax,
      isMoviesWatchListViewHasReachedMaxScroll : isMoviesWatchListViewHasReachedMaxScroll ?? this.isMoviesWatchListViewHasReachedMaxScroll,
      isTvShowsWatchListViewHasReachedMaxScroll:  isTvShowsWatchListViewHasReachedMaxScroll ?? this.isTvShowsWatchListViewHasReachedMaxScroll,
    );
  }
}
