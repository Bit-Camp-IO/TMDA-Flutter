part of 'search_bloc.dart';

abstract class SearchEvent extends Equatable {
  const SearchEvent();
  @override
  List<Object?> get props => [];
}

class SearchForMovieEvent extends SearchEvent{
  final String movieName;
  const SearchForMovieEvent(this.movieName);

  @override
  List<Object?> get props => [movieName];
}

class SearchForTvShowEvent extends SearchEvent{
  final String tvShowName;
  const SearchForTvShowEvent(this.tvShowName);

  @override
  List<Object?> get props => [tvShowName];
}

class SearchForPersonEvent extends SearchEvent{
  final String personName;
  const SearchForPersonEvent(this.personName);

  @override
  List<Object?> get props => [personName];
}

class ChangeSearchTabEvent extends SearchEvent{
  final int tabIndex;
  const ChangeSearchTabEvent(this.tabIndex);

  @override
  List<Object?> get props => [tabIndex];
}
class LoadMoreMoviesEvent extends SearchEvent{}
class LoadMoreTvShowsEvent extends SearchEvent{}
class LoadMorePersonsEvent extends SearchEvent{}

class AddOrRemoveContentFromWatchListEvent extends SearchEvent{
  final int contentId;
  final bool isInWatchList;
  const AddOrRemoveContentFromWatchListEvent(this.contentId, this.isInWatchList);

  @override
  List<Object?> get props => [contentId];
}

class CheckForTappedMovieStatesEvent extends SearchEvent {
  final int contentId;

  const CheckForTappedMovieStatesEvent(this.contentId);
  @override
  List<Object> get props => [contentId];
}

class CheckForMoviesListStatesEvent extends SearchEvent  {}
class CheckForTappedTvShowStatesEvent extends SearchEvent {
  final int contentId;

  const CheckForTappedTvShowStatesEvent(this.contentId);
  @override
  List<Object> get props => [contentId];
}

class CheckForTvShowsListStatesEvent extends SearchEvent  {}