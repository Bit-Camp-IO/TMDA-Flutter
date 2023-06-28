part of 'account_see_all_bloc.dart';

abstract class AccountSeeAllEvent extends Equatable {
  const AccountSeeAllEvent();
  @override
  List<Object?> get props => [];
}

class GetAllMoviesWatchListEvent extends AccountSeeAllEvent{}
class GetAllTvShowsWatchListEvent extends AccountSeeAllEvent{}
class AddOrRemoveMovieFromWatchListEvent extends AccountSeeAllEvent{
  final int movieId;
  final bool isInWatchList;
  const AddOrRemoveMovieFromWatchListEvent({required this.movieId, required this.isInWatchList});
  @override
  List<Object> get props => [movieId, isInWatchList];
}
class CheckForMovieStatesEvent extends AccountSeeAllEvent {
  final int movieId;
  const CheckForMovieStatesEvent({required this.movieId});
  @override
  List<Object> get props => [movieId];
}

class CheckForTvShowStatesEvent extends AccountSeeAllEvent {
  final int tvShowId;
  const CheckForTvShowStatesEvent({required this.tvShowId});
  @override
  List<Object> get props => [tvShowId];
}

class AddOrRemoveTvShowFromWatchListEvent extends AccountSeeAllEvent{
  final int tvShowId;
  final bool isInWatchList;
  const AddOrRemoveTvShowFromWatchListEvent({required this.tvShowId, required this.isInWatchList});
  @override
  List<Object> get props => [tvShowId, isInWatchList];
}
class CheckForMoviesWatchListStatesEvent extends AccountSeeAllEvent{
  const CheckForMoviesWatchListStatesEvent();
}
class CheckForTvShowsWatchListStatesEvent extends AccountSeeAllEvent{
  const CheckForTvShowsWatchListStatesEvent();
}