part of 'movies_cubit.dart';

class MoviesState extends Equatable {
  final BlocState moviesState;
  final String moviesFailMessage;
  final List<Movies> nowPlayingMovies;
  final List<Movies> popularMovies;
  final List<Movies> topRatedMovies;
  final List<Movies> newMovies;

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
    List<Movies>? nowPlayingMovies,
    List<Movies>? popularMovies,
    List<Movies>? topRatedMovies,
    List<Movies>? newMovies,
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
