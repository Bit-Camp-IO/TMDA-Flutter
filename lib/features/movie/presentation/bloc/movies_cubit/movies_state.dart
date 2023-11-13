part of 'movies_cubit.dart';

class MoviesState extends Equatable {
  final BlocState moviesState;
  final String moviesFailMessage;
  final List<Movie> nowPlayingMovies;
  final List<Movie> popularMovies;
  final List<Movie> topRatedMovies;
  final List<Movie> newMovies;

  const MoviesState({
    this.nowPlayingMovies = const [],
    this.moviesFailMessage = '',
    this.newMovies = const [],
    this.popularMovies = const [],
    this.topRatedMovies = const [],
    this.moviesState = BlocState.loading,
  });

  MoviesState copyWith({
    int? indicatorIndex,
    List<Movie>? nowPlayingMovies,
    List<Movie>? popularMovies,
    List<Movie>? topRatedMovies,
    List<Movie>? newMovies,
    String? moviesFailMessage,
    BlocState? moviesState,
  }) {
    return MoviesState(
      nowPlayingMovies: nowPlayingMovies ?? this.nowPlayingMovies,
      popularMovies: popularMovies ?? this.popularMovies,
      topRatedMovies: topRatedMovies ?? this.topRatedMovies,
      newMovies: newMovies ?? this.newMovies,
      moviesState: moviesState ?? this.moviesState,
      moviesFailMessage: moviesFailMessage ?? this.moviesFailMessage,
    );
  }

  @override
  List<Object> get props => [
        nowPlayingMovies,
        popularMovies,
        topRatedMovies,
        newMovies,
        moviesState
      ];
}
