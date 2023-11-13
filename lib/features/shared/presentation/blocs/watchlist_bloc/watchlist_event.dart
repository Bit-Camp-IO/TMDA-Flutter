part of 'watchlist_bloc.dart';

class WatchListEvent extends Equatable{
  const WatchListEvent();
  @override
  List<Object?> get props => [];
}

class GetMoviesWatchListIdsEvent extends WatchListEvent{}

class GetTvShowsWatchListIdsEvent extends WatchListEvent{}

class  GetMoviesWatchListEvent extends WatchListEvent{}

class GetTvShowsWatchListEvent extends WatchListEvent{}

class  AddOrRemoveMovieFromWatchListEvent extends WatchListEvent{
  final int movieId;
  final bool isInWatchList;
  const AddOrRemoveMovieFromWatchListEvent({required this.movieId, required this.isInWatchList});
  @override
  List<Object?> get props => [movieId, isInWatchList];
}

class  AddOrRemoveTvShowFromWatchListEvent extends WatchListEvent{
  final int tvShowId;
  final bool isInWatchList;
  const AddOrRemoveTvShowFromWatchListEvent({required this.tvShowId, required this.isInWatchList});
  @override
  List<Object?> get props => [tvShowId, isInWatchList];
}

class ChangeMoviesWatchListViewScrollState extends WatchListEvent{
  final bool isMoviesWatchListViewHasReachedMaxScroll;
 const ChangeMoviesWatchListViewScrollState({required this.isMoviesWatchListViewHasReachedMaxScroll});
  @override
  List<Object?> get props => [isMoviesWatchListViewHasReachedMaxScroll];
}

class ChangeTvShowsWatchListViewScrollState extends WatchListEvent{
  final bool isTvShowsWatchListViewHasReachedMaxScroll;
  const ChangeTvShowsWatchListViewScrollState({required this.isTvShowsWatchListViewHasReachedMaxScroll});
  @override
  List<Object?> get props => [isTvShowsWatchListViewHasReachedMaxScroll];
}