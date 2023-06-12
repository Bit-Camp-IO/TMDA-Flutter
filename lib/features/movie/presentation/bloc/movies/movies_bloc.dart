import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tmda/core/util/enums.dart';
import 'package:tmda/features/movie/domain/entities/movie/movies.dart';
import 'package:tmda/features/movie/domain/usecases/movie/get_new_movies_usecase.dart';
import 'package:tmda/features/movie/domain/usecases/movie/get_now_playing_movies_usecase.dart';
import 'package:tmda/features/movie/domain/usecases/movie/get_popular_movies_usecase.dart';
import 'package:tmda/features/movie/domain/usecases/movie/get_top_rated_movies_usecase.dart';

part 'movies_event.dart';
part 'movies_state.dart';

class MoviesBloc extends Bloc<MoviesEvent, MoviesState> {
  final GetNowPlayingMoviesUseCase getNowPlayingMoviesUseCase;
  final GetNewMoviesUseCase getNewMoviesUseCase;
  final GetPopularMoviesUseCase getPopularMoviesUseCase;
  final GetTopRatedMoviesUseCase getTopRatedMoviesUseCase;
  int newMoviePageNumber = 1;
  int popularPageNumber = 1;
  int topRatedPageNumber = 1;

  MoviesBloc(
    this.getNowPlayingMoviesUseCase,
    this.getPopularMoviesUseCase,
    this.getTopRatedMoviesUseCase,
    this.getNewMoviesUseCase,
  ) : super(const MoviesState()) {
    on<GetNowPlayingMoviesEvent>(_getNowPlayingMovieEvent);
    on<GetPopularMoviesEvent>(_getPopularMoviesEvent);
    on<GetTopRatedMoviesEvent>(_getTopRatedMoviesEvent);
    on<GetNewMoviesEvent>(_getNewMoviesEvent);
    on<ChangeIndicatorIndexEvent>(_changeIndicatorIndexEvent);
  }

  Future<void> _getNowPlayingMovieEvent(event, emit) async {
    final result = await getNowPlayingMoviesUseCase();
    result.fold(
      (nowPlayingLoadFail) => emit(
        state.copyWith(nowPlayingState: BlocState.failure),
      ),
      (nowPlayingMoviesList) => emit(
        state.copyWith(
          nowPlayingState: BlocState.success,
          nowPlayingMovies: nowPlayingMoviesList,
        ),
      ),
    );
  }

  Future<void> _getNewMoviesEvent(event, emit) async {
    final result = await getNewMoviesUseCase(pageNumber: newMoviePageNumber);
    result.fold(
      (newMoviesLoadFail) => emit(
        state.copyWith(newMoviesState: BlocState.failure),
      ),
      (newMoviesList) {
        newMoviesList.isEmpty ? emit(
                state.copyWith(
                  newMoviesState: BlocState.success,
                  newMoviesReachedMax: true,
                ),
              )
            : emit(
                state.copyWith(
                  newMoviesState: BlocState.success,
                  newMovies: List.of(state.newMovies)..addAll(newMoviesList),
                  newMoviesReachedMax: false,
                ),
              );
        newMoviePageNumber++;
      },
    );
  }

  Future<void> _getPopularMoviesEvent(event, emit) async {
    final result = await getPopularMoviesUseCase(pageNumber: popularPageNumber);
    result.fold(
      (popularMoviesLoadFail) => emit(
        state.copyWith(popularMoviesState: BlocState.failure),
      ),
      (popularMoviesList) {
        popularMoviesList.isEmpty ? emit(
                state.copyWith(
                  popularMoviesState: BlocState.success,
                  popularMoviesReachedMax: true,
                ),
              )
            : emit(
                state.copyWith(
                  popularMoviesState: BlocState.success,
                  popularMovies: List.of(state.popularMovies)
                    ..addAll(popularMoviesList),
                  popularMoviesReachedMax: false,
                ),
              );
        popularPageNumber++;
      },
    );
  }

  Future<void> _getTopRatedMoviesEvent(event, emit) async {
    final result =
        await getTopRatedMoviesUseCase(pageNumber: topRatedPageNumber);

    result.fold(
      (topRatedMoviesLoadFail) => emit(
        state.copyWith(
          topRatedMoviesState: BlocState.failure,
        ),
      ),
      (topRatedMoviesList) {
        topRatedMoviesList.isEmpty ? emit(
                state.copyWith(
                  topRatedMoviesState: BlocState.success,
                  topRatedMoviesReachedMax: true,
                ),
              )
            : emit(
                state.copyWith(
                  topRatedMoviesState: BlocState.success,
                  topRatedMovies: List.of(state.topRatedMovies)
                    ..addAll(topRatedMoviesList),
                  topRatedMoviesReachedMax: false,
                ),
              );
        topRatedPageNumber++;
      },
    );
  }

  void _changeIndicatorIndexEvent(event, emit) {
    emit(state.copyWith(indicatorIndex: event.index));
  }
}
