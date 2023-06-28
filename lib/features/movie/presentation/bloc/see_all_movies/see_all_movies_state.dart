part of 'see_all_movies_bloc.dart';

class SeeAllMoviesState extends Equatable {
  final List<Movies> seeAllMovies;
  final BlocState seeAllState;
  final String seeAllFailMessage;
  final bool hasSeeAllMoviesListReachedMax;
  final String addOrRemoveFromWatchListFailMessage;
  final String checkForMovieStatesFailMessage;

  const SeeAllMoviesState({
    this.seeAllMovies = const [],
    this.seeAllState = BlocState.loading,
    this.seeAllFailMessage = '',
    this.hasSeeAllMoviesListReachedMax = false,
    this.addOrRemoveFromWatchListFailMessage = '',
    this.checkForMovieStatesFailMessage = '',
  });

  SeeAllMoviesState copyWith({
    List<Movies>? seeAllMovies,
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
      addOrRemoveFromWatchListFailMessage: addOrRemoveFromWatchListFailMessage ?? this.addOrRemoveFromWatchListFailMessage,
      checkForMovieStatesFailMessage: checkForMovieStatesFailMessage ?? this.checkForMovieStatesFailMessage,
    );
  }

  @override
  List<Object?> get props => [
        seeAllMovies,
        seeAllState,
        seeAllFailMessage,
        hasSeeAllMoviesListReachedMax,
        addOrRemoveFromWatchListFailMessage,
        checkForMovieStatesFailMessage
      ];
}
