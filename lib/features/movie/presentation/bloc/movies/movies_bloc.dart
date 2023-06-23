import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:tmda/core/util/enums.dart';
import 'package:tmda/features/movie/domain/entities/movie/movies.dart';
import 'package:tmda/features/movie/domain/usecases/movie/get_new_movies_usecase.dart';
import 'package:tmda/features/movie/domain/usecases/movie/get_now_playing_movies_usecase.dart';
import 'package:tmda/features/movie/domain/usecases/movie/get_popular_movies_usecase.dart';
import 'package:tmda/features/movie/domain/usecases/movie/get_top_rated_movies_usecase.dart';

part 'movies_event.dart';
part 'movies_state.dart';

@injectable
class MoviesBloc extends Bloc<MoviesEvent, MoviesState> {
  final GetNowPlayingMoviesUseCase getNowPlayingMoviesUseCase;
  final GetNewMoviesUseCase getNewMoviesUseCase;
  final GetPopularMoviesUseCase getPopularMoviesUseCase;
  final GetTopRatedMoviesUseCase getTopRatedMoviesUseCase;
  int newMoviePageNumber = 1;
  int popularPageNumber = 1;
  int topRatedPageNumber = 1;

  MoviesBloc({
    required this.getNowPlayingMoviesUseCase,
    required this.getPopularMoviesUseCase,
    required this.getTopRatedMoviesUseCase,
    required this.getNewMoviesUseCase,
  }) : super(const MoviesState()) {
    on<GetNowPlayingMoviesEvent>(_getNowPlayingMovieEvent);
    on<GetPopularMoviesEvent>(_getPopularMoviesEvent, transformer: droppable());
    on<GetTopRatedMoviesEvent>(_getTopRatedMoviesEvent,
        transformer: droppable());
    on<GetNewMoviesEvent>(_getNewMoviesEvent, transformer: droppable());
    on<ChangeIndicatorIndexEvent>(_changeIndicatorIndexEvent);
  }


  Future<void> _getNowPlayingMovieEvent(event, emit) async {
    await getNowPlayingMoviesUseCase().then(
      (value) => value.fold(
        (nowPlayingLoadFail) => emit(
          state.copyWith(nowPlayingState: BlocState.failure),
        ),
        (nowPlayingMoviesList) => emit(
          state.copyWith(
            nowPlayingState: BlocState.success,
            nowPlayingMovies: nowPlayingMoviesList,
          ),
        ),
      ),
    );
  }

  Future<void> _getNewMoviesEvent(event, emit) async {
    await getNewMoviesUseCase(pageNumber: newMoviePageNumber).then(
      (value) => value.fold(
        (newMoviesLoadFail) => emit(
          state.copyWith(movieState: BlocState.failure),
        ),
        (newMoviesList) {
          newMoviesList.isEmpty
              ? emit(
                  state.copyWith(
                    movieState: BlocState.success,
                    newMoviesReachedMax: true,
                  ),
                )
              : emit(
                  state.copyWith(
                    movieState: BlocState.success,
                    newMovies: List.of(state.newMovies)..addAll(newMoviesList),
                    newMoviesReachedMax: false,
                  ),
                );
          newMoviePageNumber++;
        },
      ),
    );
  }

  Future<void> _getPopularMoviesEvent(event, emit) async {
    await getPopularMoviesUseCase(pageNumber: popularPageNumber).then(
      (value) => value.fold(
        (popularMoviesLoadFail) => emit(
          state.copyWith(movieState: BlocState.failure),
        ),
        (popularMoviesList) {
          popularMoviesList.isEmpty
              ? emit(
                  state.copyWith(
                    movieState: BlocState.success,
                    popularMoviesReachedMax: true,
                  ),
                )
              : emit(
                  state.copyWith(
                    movieState: BlocState.success,
                    popularMovies: List.of(state.popularMovies)
                      ..addAll(popularMoviesList),
                    popularMoviesReachedMax: false,
                  ),
                );
          popularPageNumber++;
        },
      ),
    );
  }

  Future<void> _getTopRatedMoviesEvent(event, emit) async {
    await getTopRatedMoviesUseCase(pageNumber: topRatedPageNumber).then(
      (value) => value.fold(
        (topRatedMoviesLoadFail) => emit(
          state.copyWith(
            movieState: BlocState.failure,
          ),
        ),
        (topRatedMoviesList) {
          topRatedMoviesList.isEmpty
              ? emit(
                  state.copyWith(
                    movieState: BlocState.success,
                    topRatedMoviesReachedMax: true,
                  ),
                )
              : emit(
                  state.copyWith(
                    movieState: BlocState.success,
                    topRatedMovies: List.of(state.topRatedMovies)
                      ..addAll(topRatedMoviesList),
                    topRatedMoviesReachedMax: false,
                  ),
                );
          topRatedPageNumber++;
        },
      ),
    );
  }

  void _changeIndicatorIndexEvent(event, emit) {
    emit(state.copyWith(indicatorIndex: event.indicatorIndex));
  }
}
