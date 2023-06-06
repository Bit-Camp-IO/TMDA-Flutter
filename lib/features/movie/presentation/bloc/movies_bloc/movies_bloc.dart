import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tmda/core/util/enums.dart';
import 'package:tmda/features/movie/domain/entities/movies.dart';
import 'package:tmda/features/movie/domain/usecases/get_now_playing_movies_usecase.dart';
import 'package:tmda/features/movie/domain/usecases/get_popular_movies_usecase.dart';
import 'package:tmda/features/movie/domain/usecases/get_top_rated_movies_usecase.dart';
import 'package:tmda/features/movie/domain/usecases/get_new_movies_usecase.dart';
part 'movies_event.dart';
part 'movies_state.dart';

class MoviesBloc extends Bloc<MoviesEvent, MoviesState> {
  final GetNowPlayingMoviesUseCase getNowPlayingMoviesUseCase;
  final GetPopularMoviesUseCase getPopularMoviesUseCase;
  final GetTopRatedMoviesUseCase getTopRatedMoviesUseCase;
  final GetNewMoviesUseCase getUpComingMoviesUseCase;
  
  MoviesBloc(
    this.getNowPlayingMoviesUseCase,
    this.getPopularMoviesUseCase,
    this.getTopRatedMoviesUseCase,
    this.getUpComingMoviesUseCase,
  ) : super(const MoviesState()) {
    on<GetNowPlayingMoviesEvent>(_getNowPlayingMovieEvent);
    on<GetPopularMoviesEvent>(_getPopularMoviesEvent);
    on<GetTopRatedMoviesEvent>(_getTopRatedMoviesEvent);
    on<GetNewMoviesEvent>(_getNewMoviesEvent);
  }
  Future<void> _getTopRatedMoviesEvent(event, emit) async {
    final result = await getTopRatedMoviesUseCase();
    result.fold(
      (l) => emit(state.copyWith(
        topRatedState: BlocStateEnum.error,
      )),
      (r) => emit(state.copyWith(
        topRatedState: BlocStateEnum.loaded,
        topRatedMovies: r,
      )),
    );
  }

  Future<void> _getPopularMoviesEvent(event, emit) async {
    final result = await getPopularMoviesUseCase();
    result.fold(
      (l) => emit(
        state.copyWith(
          popularState: BlocStateEnum.error,
        ),
      ),
      (r) => emit(state.copyWith(
        popularState: BlocStateEnum.loaded,
        popularMovies: r,
      )),
    );
  }

  Future<void> _getNowPlayingMovieEvent(event, emit) async {
    final result = await getNowPlayingMoviesUseCase();
    result.fold(
      (l) => emit(
        state.copyWith(
          nowPlayingState: BlocStateEnum.error,
        ),
      ),
      (r) => emit(state.copyWith(
        nowPlayingState: BlocStateEnum.loaded,
        nowPlayingMovies: r,
      )),
    );
  }

  Future<void> _getNewMoviesEvent(event, emit) async {
    final result = await getNowPlayingMoviesUseCase();
    result.fold(
      (l) => emit(
        state.copyWith(
          upComingMoviesState: BlocStateEnum.error,
        ),
      ),
      (r) => emit(state.copyWith(
        upComingMoviesState: BlocStateEnum.loaded,
        newMovies: r,
      )),
    );
  }
}
