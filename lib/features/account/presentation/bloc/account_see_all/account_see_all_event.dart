part of 'account_see_all_bloc.dart';

abstract class AccountSeeAllEvent extends Equatable {
  const AccountSeeAllEvent();
  @override
  List<Object?> get props => [];
}

class GetAllMoviesWatchListEvent extends AccountSeeAllEvent{}
class GetAllTvShowsWatchListEvent extends AccountSeeAllEvent{}
class RemoveMovieFromWatchListEvent extends AccountSeeAllEvent{
  final int movieId;
  const RemoveMovieFromWatchListEvent({required this.movieId});
  @override
  List<Object> get props => [movieId];
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

class RemoveTvShowFromWatchListEvent extends AccountSeeAllEvent{
  final int tvShowId;
  const RemoveTvShowFromWatchListEvent({required this.tvShowId});
  @override
  List<Object> get props => [tvShowId];
}
class CheckForMoviesWatchListStatesEvent extends AccountSeeAllEvent{
  const CheckForMoviesWatchListStatesEvent();
}
class CheckForTvShowsWatchListStatesEvent extends AccountSeeAllEvent{
  const CheckForTvShowsWatchListStatesEvent();
}