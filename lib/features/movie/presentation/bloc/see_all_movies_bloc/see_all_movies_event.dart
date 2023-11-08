part of 'see_all_movies_bloc.dart';

abstract class SeeAllMoviesEvent extends Equatable {
  const SeeAllMoviesEvent();
  @override
  List<Object?> get props => [];
}

class GetAllNewMoviesEvent extends SeeAllMoviesEvent {}

class GetAllPopularMoviesEvent extends SeeAllMoviesEvent {}

class GetAllTopRatedMoviesEvent extends SeeAllMoviesEvent {}

class GetAllRecommendedMoviesEvent extends SeeAllMoviesEvent {
  final int movieId;
  const GetAllRecommendedMoviesEvent({
    required this.movieId,
  });
  @override
  List<Object?> get props => [movieId];
}

class GetAllSimilarMoviesEvent extends SeeAllMoviesEvent {
  final int movieId;
  const GetAllSimilarMoviesEvent({
    required this.movieId,
  });
  @override
  List<Object?> get props => [movieId];
}


class AddOrRemoveFromWatchListEvent extends SeeAllMoviesEvent {
  final bool isInWatchList;
  final int movieId;
  const AddOrRemoveFromWatchListEvent({required this.isInWatchList, required this.movieId});

  @override
  List<Object> get props => [isInWatchList, movieId];
}

class CheckForMovieStatesEvent extends SeeAllMoviesEvent {
  final int movieId;

  const CheckForMovieStatesEvent(this.movieId);
  @override
  List<Object> get props => [movieId];
}

class CheckForMoviesListStatesEvent extends SeeAllMoviesEvent {}