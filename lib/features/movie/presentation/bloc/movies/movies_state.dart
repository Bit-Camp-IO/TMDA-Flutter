part of 'movies_bloc.dart';

class MoviesState extends Equatable {
  final List<Movies> nowPlayingMovies;
  final BlocState nowPlayingState;
  final String nowPlayingMoviesFailMessage;
  final List<Movies> popularMovies;
  final BlocState popularMoviesState;
  final bool popularMoviesReachedMax;
  final String popularMoviesFailMessage;
  final List<Movies> topRatedMovies;
  final BlocState topRatedMoviesState;
  final bool topRatedMoviesReachedMax;
  final String topRatedMoviesFailMessage;
  final List<Movies> newMovies;
  final BlocState newMoviesState;
  final bool newMoviesReachedMax;
  final String newMoviesFailMessage;
  final int indicatorIndex;
  final BlocState movieState;
  const MoviesState({
    this.nowPlayingMovies = const [],
    this.nowPlayingState = BlocState.loading,
    this.nowPlayingMoviesFailMessage = '',
    this.newMovies = const [],
    this.newMoviesState = BlocState.loading,
    this.newMoviesReachedMax = false,
    this.newMoviesFailMessage = '',
    this.popularMovies = const [],
    this.popularMoviesState = BlocState.loading,
    this.popularMoviesReachedMax = false,
    this.popularMoviesFailMessage = '',
    this.topRatedMovies = const [],
    this.topRatedMoviesState = BlocState.loading,
    this.topRatedMoviesReachedMax = false,
    this.topRatedMoviesFailMessage = '',
    this.indicatorIndex = 0,
    this.movieState = BlocState.loading
  });
  MoviesState copyWith({
    int? indicatorIndex,
    List<Movies>? nowPlayingMovies,
    BlocState? nowPlayingState,
    String? nowPlayingMoviesFailMessage,
    List<Movies>? popularMovies,
    BlocState? popularMoviesState,
    bool? popularMoviesReachedMax,
    String? popularMoviesFailMessage,
    List<Movies>? topRatedMovies,
    BlocState? topRatedMoviesState,
    bool? topRatedMoviesReachedMax,
    String? topRatedMoviesFailMessage,
    List<Movies>? newMovies,
    BlocState? newMoviesState,
    bool? newMoviesReachedMax,
    String? newMoviesFailMessage,
    BlocState? movieState,
  }) {
    return MoviesState(
      nowPlayingMovies: nowPlayingMovies ?? this.nowPlayingMovies,
      nowPlayingState: nowPlayingState ?? this.nowPlayingState,
      nowPlayingMoviesFailMessage: nowPlayingMoviesFailMessage ?? this.nowPlayingMoviesFailMessage,
      popularMovies: popularMovies ?? this.popularMovies,
      popularMoviesState: popularMoviesState ?? this.popularMoviesState,
      popularMoviesFailMessage: popularMoviesFailMessage ?? this.popularMoviesFailMessage,
      popularMoviesReachedMax: popularMoviesReachedMax ?? this.popularMoviesReachedMax,
      topRatedMovies: topRatedMovies ?? this.topRatedMovies,
      topRatedMoviesState: topRatedMoviesState ?? this.topRatedMoviesState,
      topRatedMoviesFailMessage: topRatedMoviesFailMessage ?? this.topRatedMoviesFailMessage,
      topRatedMoviesReachedMax: topRatedMoviesReachedMax ?? this.topRatedMoviesReachedMax,
      newMovies: newMovies ?? this.newMovies,
      newMoviesState: newMoviesState ?? this.newMoviesState,
      newMoviesReachedMax: newMoviesReachedMax ?? this.newMoviesReachedMax,
      newMoviesFailMessage: newMoviesFailMessage ?? this.newMoviesFailMessage,
      indicatorIndex: indicatorIndex ?? this.indicatorIndex,
      movieState: movieState ?? this.movieState,
    );
  }

  @override
  List<Object> get props => [
        nowPlayingMovies,
        nowPlayingState,
        nowPlayingMoviesFailMessage,
        popularMovies,
        popularMoviesState,
        popularMoviesFailMessage,
        popularMoviesReachedMax,
        topRatedMovies,
        topRatedMoviesState,
        topRatedMoviesFailMessage,
        topRatedMoviesReachedMax,
        newMovies,
        newMoviesState,
        newMoviesFailMessage,
        newMoviesReachedMax,
        indicatorIndex,
        movieState
      ];
}
