part of 'movies_bloc.dart';

class MoviesState extends Equatable {
  final List<Movies> nowPlayingMovies;
  final BlocStateEnum nowPlayingState;
  final List<Movies> popularMovies;
  final BlocStateEnum popularState;
  final List<Movies> topRatedMovies;
  final BlocStateEnum topRatedState;
  final List<Movies> upComingMovies;
  final BlocStateEnum upComingMoviesState;

  const MoviesState({
    this.upComingMovies = const [],
    this.upComingMoviesState = BlocStateEnum.loading,
    this.nowPlayingMovies = const [],
    this.nowPlayingState = BlocStateEnum.loading,
    this.popularMovies = const [],
    this.popularState = BlocStateEnum.loading,
    this.topRatedMovies = const [],
    this.topRatedState = BlocStateEnum.loading,
  });
  MoviesState copyWith({
    int? indicatorIndex,
    List<Movies>? nowPlayingMovies,
    BlocStateEnum? nowPlayingState,
    String? nowPlayingMessage,
    List<Movies>? popularMovies,
    BlocStateEnum? popularState,
    List<Movies>? topRatedMovies,
    BlocStateEnum? topRatedState,
    List<Movies>? upComingMovies,
    BlocStateEnum? upComingMoviesState,
  }) {
    return MoviesState(
      nowPlayingMovies: nowPlayingMovies ?? this.nowPlayingMovies,
      nowPlayingState: nowPlayingState ?? this.nowPlayingState,
      popularMovies: popularMovies ?? this.popularMovies,
      popularState: popularState ?? this.popularState,
      topRatedMovies: topRatedMovies ?? this.topRatedMovies,
      topRatedState: topRatedState ?? this.topRatedState,
      upComingMovies: upComingMovies ?? this.upComingMovies,
      upComingMoviesState: upComingMoviesState ?? this.upComingMoviesState,
    );
  }

  @override
  List<Object> get props => [
        nowPlayingMovies,
        nowPlayingState,
        popularMovies,
        popularState,
        topRatedMovies,
        topRatedState,
        upComingMovies,
        upComingMoviesState,
      ];
}