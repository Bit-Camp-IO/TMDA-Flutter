import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:tmda/core/util/enums.dart';
import 'package:tmda/features/movie/domain/entities/movies.dart';
import 'package:tmda/features/movie/domain/usecases/movie/get_new_movies_usecase.dart';
import 'package:tmda/features/movie/domain/usecases/movie/get_now_playing_movies_usecase.dart';
import 'package:tmda/features/movie/domain/usecases/movie/get_popular_movies_usecase.dart';
import 'package:tmda/features/movie/domain/usecases/movie/get_top_rated_movies_usecase.dart';

part 'movies_event.dart';

part 'movies_state.dart';

@injectable
class MoviesBloc extends Bloc<MoviesEvent, MoviesState> {
  final GetNowPlayingMoviesUseCase _getNowPlayingMoviesUseCase;
  final GetNewMoviesUseCase _getNewMoviesUseCase;
  final GetPopularMoviesUseCase _getPopularMoviesUseCase;
  final GetTopRatedMoviesUseCase _getTopRatedMoviesUseCase;

  MoviesBloc(
    this._getNowPlayingMoviesUseCase,
    this._getPopularMoviesUseCase,
    this._getTopRatedMoviesUseCase,
    this._getNewMoviesUseCase,
  ) : super(const MoviesState()) {
    on<GetNowPlayingMoviesEvent>(_getNowPlayingMovieEvent);
    on<GetPopularMoviesEvent>(_getPopularMoviesEvent);
    on<GetTopRatedMoviesEvent>(_getTopRatedMoviesEvent);
    on<GetNewMoviesEvent>(_getNewMoviesEvent);
    on<ChangeIndicatorIndexEvent>(_changeIndicatorIndexEvent);
  }

  Future<void> _getNowPlayingMovieEvent(event, emit) async {
    await _getNowPlayingMoviesUseCase().then(
      (value) => value.fold(
        (nowPlayingMoviesFail) => emit(
          state.copyWith(
            moviesState: BlocState.failure,
            moviesFailMessage: nowPlayingMoviesFail.message,
          ),
        ),
        (nowPlayingMoviesList) => emit(
          state.copyWith(
            moviesState: BlocState.success,
            nowPlayingMovies: nowPlayingMoviesList
          ),
        ),
      ),
    );
  }

  Future<void> _getNewMoviesEvent(event, emit) async {
    await _getNewMoviesUseCase().then(
      (value) => value.fold(
        (newMoviesLoadFail) => emit(
          state.copyWith(
            moviesState: BlocState.failure,
            moviesFailMessage: newMoviesLoadFail.message,
          ),
        ),
        (newMoviesList) => emit(
          state.copyWith(
            moviesState: BlocState.success,
            newMovies: newMoviesList,
          ),
        ),
      ),
    );
  }

  Future<void> _getPopularMoviesEvent(event, emit) async {
    await _getPopularMoviesUseCase().then(
      (value) => value.fold(
        (popularMoviesLoadFail) => emit(
          state.copyWith(
            moviesState: BlocState.failure,
            moviesFailMessage: popularMoviesLoadFail.message,
          ),
        ),
        (popularMoviesList) => emit(
          state.copyWith(
            moviesState: BlocState.success,
            popularMovies: popularMoviesList,
          ),
        ),
      ),
    );
  }

  Future<void> _getTopRatedMoviesEvent(event, emit) async {
    await _getTopRatedMoviesUseCase().then(
      (value) => value.fold(
        (topRatedMoviesLoadFail) => emit(
          state.copyWith(
              moviesState: BlocState.failure,
              moviesFailMessage: topRatedMoviesLoadFail.message),
        ),
        (topRatedMoviesList) => emit(
          state.copyWith(
            moviesState: BlocState.success,
            topRatedMovies: topRatedMoviesList,
          ),
        ),
      ),
    );
  }

  void _changeIndicatorIndexEvent(event, emit) {
    emit(state.copyWith(indicatorIndex: event.indicatorIndex));
  }
}
