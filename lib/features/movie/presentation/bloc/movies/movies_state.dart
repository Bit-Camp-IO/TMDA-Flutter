part of 'movies_bloc.dart';

class MoviesState extends Equatable {
  final BlocState moviesState;
  final String moviesFailMessage;
  final List<Movies> nowPlayingMovies;
  final List<Movies> popularMovies;
  final List<Movies> topRatedMovies;
  final List<Movies> newMovies;
  final int indicatorIndex;

  const MoviesState({
    this.nowPlayingMovies = const [],
    this.moviesFailMessage = '',
    this.newMovies = const [],
    this.popularMovies = const [],
    this.topRatedMovies = const [],
    this.indicatorIndex = 0,
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
      indicatorIndex: indicatorIndex ?? this.indicatorIndex,
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
        indicatorIndex,
        moviesState
      ];
}
