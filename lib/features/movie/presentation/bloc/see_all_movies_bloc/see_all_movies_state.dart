part of 'see_all_movies_bloc.dart';

class SeeAllMoviesState extends Equatable {
  final List<Movie> seeAllMovies;
  final BlocState seeAllState;
  final String seeAllFailMessage;
  final bool hasSeeAllMoviesListReachedMax;

  const SeeAllMoviesState({
    this.seeAllMovies = const [],
    this.seeAllState = BlocState.loading,
    this.seeAllFailMessage = '',
    this.hasSeeAllMoviesListReachedMax = false,
  });

  SeeAllMoviesState copyWith({
    List<Movie>? seeAllMovies,
    BlocState? seeAllState,
    String? seeAllFailMessage,
    bool? hasSeeAllMoviesListReachedMax,
    String? addOrRemoveFromWatchListFailMessage,
    String? checkForMovieStatesFailMessage,
  }) {
    return SeeAllMoviesState(
      seeAllMovies: seeAllMovies ?? this.seeAllMovies,
      seeAllState: seeAllState ?? this.seeAllState,
      seeAllFailMessage: seeAllFailMessage ?? this.seeAllFailMessage,
      hasSeeAllMoviesListReachedMax: hasSeeAllMoviesListReachedMax ?? this.hasSeeAllMoviesListReachedMax,
    );
  }

  @override
  List<Object?> get props => [
        seeAllMovies,
        seeAllState,
        seeAllFailMessage,
        hasSeeAllMoviesListReachedMax,
      ];
}
