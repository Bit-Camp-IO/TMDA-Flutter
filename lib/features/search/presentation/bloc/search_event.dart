part of 'search_bloc.dart';

abstract class SearchEvent extends Equatable {
  const SearchEvent();
  @override
  List<Object?> get props => [];
}

class SearchForMovieEvent extends SearchEvent{
  final String movieName;
  const SearchForMovieEvent(this.movieName);
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
class LoadMoreMoviesEvent extends SearchEvent{
  final String movieName;
  const LoadMoreMoviesEvent(this.movieName);

  @override
  List<Object?> get props => [movieName];
}
class LoadMoreTvShowsEvent extends SearchEvent{
  final String tvShowName;
  const LoadMoreTvShowsEvent(this.tvShowName);

  @override
  List<Object?> get props => [tvShowName];
}
class LoadMorePersonsEvent extends SearchEvent{
  final String personName;
  const LoadMorePersonsEvent(this.personName);

  @override
  List<Object?> get props => [personName];
}
class RetryMovieSearchEvent extends SearchEvent{

  const RetryMovieSearchEvent();

  @override
  List<Object?> get props => [];
}

class RetryTvShowSearchEvent extends SearchEvent{

  const RetryTvShowSearchEvent();

  @override
  List<Object?> get props => [];
}

class RetryPersonSearchEvent extends SearchEvent{

  const RetryPersonSearchEvent();

  @override
  List<Object?> get props => [];
}