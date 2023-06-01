part of 'movie_details_cubit.dart';

abstract class MovieDetailsState extends Equatable {
  const MovieDetailsState();

  @override
  List<Object> get props => [];
}

class MovieDetailsInitialState extends MovieDetailsState {}

class MovieDetailsLoadingState extends MovieDetailsState {}

class MovieDetailsFailState extends MovieDetailsState {}

class MovieDetailsLoadedState extends MovieDetailsState {
  final MovieDetails movieDetails;

  const MovieDetailsLoadedState(this.movieDetails);
  @override
  List<Object> get props => [movieDetails];
}
