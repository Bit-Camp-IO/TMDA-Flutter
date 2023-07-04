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

class GetMovieStatesEvent extends MovieDetailsEvent{
  final int movieId;
  const GetMovieStatesEvent({required this.movieId});
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

class OnScrollAnimationEvent extends MovieDetailsEvent{
  final double animatedContainerHeight;
  final double animatedPosterHeight;

  const OnScrollAnimationEvent(
      {required this.animatedContainerHeight, required this.animatedPosterHeight});
}
