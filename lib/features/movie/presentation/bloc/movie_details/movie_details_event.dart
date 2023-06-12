part of 'movie_details_bloc.dart';

abstract class MovieDetailsEvent extends Equatable {
  const MovieDetailsEvent();

  @override
  List<Object> get props => [];
}

class GetMovieDetailsEvent extends MovieDetailsEvent {
  final int movieId;

  const GetMovieDetailsEvent(this.movieId);

  @override
  List<Object> get props => [movieId];
}

class GetMovieCastEvent extends MovieDetailsEvent {
  final int movieId;

  const GetMovieCastEvent(this.movieId);
  @override
  List<Object> get props => [movieId];
}

class GetMoviesLikeThisEvent extends MovieDetailsEvent {
  final int movieId;

  const GetMoviesLikeThisEvent(this.movieId);
  @override
  List<Object> get props => [movieId];
}

class GetMovieReviewsEvent extends MovieDetailsEvent {
  final int movieId;

  const GetMovieReviewsEvent(this.movieId);
  @override
  List<Object> get props => [movieId];
}

class PlayMovieTrailerEvent extends MovieDetailsEvent {
  final String movieVideoKey;

  const PlayMovieTrailerEvent(this.movieVideoKey);

  @override
  List<Object> get props => [movieVideoKey];
}



class AddOrRemoveFromWatchListEvent extends MovieDetailsEvent{
  final bool isInWatchList;
  final int movieId;
  const AddOrRemoveFromWatchListEvent({required this.isInWatchList, required this.movieId});

  @override
  List<Object> get props => [isInWatchList, movieId];

}

class GetMovieAccountStatesEvent extends MovieDetailsEvent{
  final int movieId;
  const GetMovieAccountStatesEvent({required this.movieId});
  @override
  List<Object> get props => [movieId];

}