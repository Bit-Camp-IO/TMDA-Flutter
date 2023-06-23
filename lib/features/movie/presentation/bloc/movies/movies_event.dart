part of 'movies_bloc.dart';

abstract class MoviesEvent extends Equatable {
  const MoviesEvent();

  @override
  List<Object> get props => [];
}


class GetAllMoviesEvent extends MoviesEvent{}
class GetNowPlayingMoviesEvent extends MoviesEvent{}

class GetPopularMoviesEvent extends MoviesEvent{}

class GetTopRatedMoviesEvent extends MoviesEvent{}

class GetNewMoviesEvent extends MoviesEvent{}

class ChangeIndicatorIndexEvent extends MoviesEvent {
   final int indicatorIndex;
  const ChangeIndicatorIndexEvent(this.indicatorIndex);

  @override
  List<Object> get props => [indicatorIndex];
}