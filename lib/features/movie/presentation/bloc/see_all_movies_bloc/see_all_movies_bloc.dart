import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:tmda/core/util/enums.dart';
import 'package:tmda/features/movie/domain/usecases/get_new_movies_usecase.dart';
import 'package:tmda/features/movie/domain/usecases/get_popular_movies_usecase.dart';
import 'package:tmda/features/movie/domain/usecases/get_top_rated_movies_usecase.dart';
import 'package:tmda/features/shared/domain/entities/movie.dart';
import 'package:tmda/features/movie/domain/usecases/get_recommended_movies_usecase.dart';
import 'package:tmda/features/movie/domain/usecases/get_similar_movies_usecase.dart';

part 'see_all_movies_event.dart';

part 'see_all_movies_state.dart';

@injectable
class SeeAllMoviesBloc extends Bloc<SeeAllMoviesEvent, SeeAllMoviesState> {
  final GetNewMoviesUseCase _getNewMoviesUseCase;
  final GetPopularMoviesUseCase _getPopularMoviesUseCase;
  final GetTopRatedMoviesUseCase _getTopRatedMoviesUseCase;
  final GetAllRecommendedMoviesUseCase _getRecommendedMoviesUseCase;
  final GetAllSimilarMoviesUseCase _getSimilarMoviesUseCase;
  int _newMoviesPageNumber = 1;
  int _popularMoviesPageNumber = 1;
  int _topRatedMoviesPageNumber = 1;
  int _recommendedMoviesPageNumber = 1;
  int _similarMoviesPageNumber = 1;

  SeeAllMoviesBloc(
    this._getNewMoviesUseCase,
    this._getPopularMoviesUseCase,
    this._getTopRatedMoviesUseCase,
    this._getRecommendedMoviesUseCase,
    this._getSimilarMoviesUseCase,
  ) : super(const SeeAllMoviesState()) {
    on<GetAllNewMoviesEvent>(_getAllNewMoviesEvent, transformer: droppable());
    on<GetAllPopularMoviesEvent>(_getAllPopularMoviesEvent, transformer: droppable());
    on<GetAllTopRatedMoviesEvent>(_getAllTopRatedMoviesEvent, transformer: droppable());
    on<GetAllRecommendedMoviesEvent>(_getAllRecommendedMoviesEvent, transformer: droppable());
    on<GetAllSimilarMoviesEvent>(_getAllSimilarMoviesEvent, transformer: droppable());
  }

  Future<void> _getAllNewMoviesEvent(event, emit) async {
    if (state.hasSeeAllMoviesListReachedMax == false) {
      await _getNewMoviesUseCase(
        pageNumber: _newMoviesPageNumber,
      ).then(
        (value) => value.fold(
          (newMoviesLoadFail) => emit(
            state.copyWith(seeAllState: BlocState.failure),
          ),
          (newMoviesList) {
            newMoviesList.isEmpty
                ? emit(
                    state.copyWith(
                      seeAllState: BlocState.success,
                      hasSeeAllMoviesListReachedMax: true,
                    ),
                  )
                : emit(
                    state.copyWith(
                      seeAllState: BlocState.success,
                      seeAllMovies: List.of(state.seeAllMovies)
                        ..addAll(newMoviesList),
                      hasSeeAllMoviesListReachedMax: false,
                    ),
                  );
            _newMoviesPageNumber++;
          },
        ),
      );
    }
  }

  Future<void> _getAllPopularMoviesEvent(event, emit) async {
    if (state.hasSeeAllMoviesListReachedMax == false) {
      await _getPopularMoviesUseCase(
        pageNumber: _popularMoviesPageNumber,
      ).then(
        (value) => value.fold(
          (popularMoviesLoadFail) => emit(
            state.copyWith(seeAllState: BlocState.failure),
          ),
          (popularMoviesList) {
            popularMoviesList.isEmpty
                ? emit(
                    state.copyWith(
                      seeAllState: BlocState.success,
                      hasSeeAllMoviesListReachedMax: true,
                    ),
                  )
                : emit(
                    state.copyWith(
                      seeAllState: BlocState.success,
                      seeAllMovies: List.of(state.seeAllMovies)
                        ..addAll(popularMoviesList),
                      hasSeeAllMoviesListReachedMax: false,
                    ),
                  );
            _popularMoviesPageNumber++;
          },
        ),
      );
    }
  }

  Future<void> _getAllTopRatedMoviesEvent(event, emit) async {
    if (state.hasSeeAllMoviesListReachedMax == false) {
      await _getTopRatedMoviesUseCase(
        pageNumber: _topRatedMoviesPageNumber,
      ).then(
        (value) => value.fold(
          (topRatedMoviesLoadFail) => emit(
            state.copyWith(seeAllState: BlocState.failure),
          ),
          (topRatedMoviesList) {
            topRatedMoviesList.isEmpty
                ? emit(
                    state.copyWith(
                      seeAllState: BlocState.success,
                      hasSeeAllMoviesListReachedMax: true,
                    ),
                  )
                : emit(
                    state.copyWith(
                      seeAllState: BlocState.success,
                      seeAllMovies: List.of(state.seeAllMovies)
                        ..addAll(topRatedMoviesList),
                      hasSeeAllMoviesListReachedMax: false,
                    ),
                  );
            _topRatedMoviesPageNumber++;
          },
        ),
      );
    }
  }

  Future<void> _getAllRecommendedMoviesEvent(event, emit) async {
    if (state.hasSeeAllMoviesListReachedMax == false) {
      await _getRecommendedMoviesUseCase(
        pageNumber: _recommendedMoviesPageNumber,
        movieId: event.movieId,
      ).then(
        (value) => value.fold(
          (recommendedMoviesLoadFail) => emit(
            state.copyWith(seeAllState: BlocState.failure),
          ),
          (recommendedMoviesList) {
            recommendedMoviesList.isEmpty
                ? emit(
                    state.copyWith(
                      seeAllState: BlocState.success,
                      hasSeeAllMoviesListReachedMax: true,
                    ),
                  )
                : emit(
                    state.copyWith(
                      seeAllState: BlocState.success,
                      seeAllMovies: List.of(state.seeAllMovies)
                        ..addAll(recommendedMoviesList),
                      hasSeeAllMoviesListReachedMax: false,
                    ),
                  );
            _recommendedMoviesPageNumber++;
          },
        ),
      );
    }
  }

  Future<void> _getAllSimilarMoviesEvent(event, emit) async {
    if (state.hasSeeAllMoviesListReachedMax == false) {
      await _getSimilarMoviesUseCase(
        pageNumber: _similarMoviesPageNumber,
        movieId: event.movieId,
      ).then(
        (value) => value.fold(
          (similarMoviesLoadFail) => emit(
            state.copyWith(seeAllState: BlocState.failure),
          ),
          (similarMoviesList) {
            similarMoviesList.isEmpty
                ? emit(
                    state.copyWith(
                      seeAllState: BlocState.success,
                      hasSeeAllMoviesListReachedMax: true,
                    ),
                  )
                : emit(
                    state.copyWith(
                      seeAllState: BlocState.success,
                      seeAllMovies: List.of(state.seeAllMovies)
                        ..addAll(similarMoviesList),
                      hasSeeAllMoviesListReachedMax: false,
                    ),
                  );
            _similarMoviesPageNumber++;
          },
        ),
      );
    }
  }
}
