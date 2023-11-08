import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:tmda/core/util/enums.dart';
import 'package:tmda/features/movie/domain/entities/movies.dart';
import 'package:tmda/features/movie/domain/usecases/add_or_remove_movie_from_watch_list_usecase.dart';
import 'package:tmda/features/movie/domain/usecases/see_all_movies/get_all_new_movies_usecase.dart';
import 'package:tmda/features/movie/domain/usecases/see_all_movies/get_all_popular_movies_usecase.dart';
import 'package:tmda/features/movie/domain/usecases/see_all_movies/get_all_recommended_movies_usecase.dart';
import 'package:tmda/features/movie/domain/usecases/see_all_movies/get_all_similar_movies_usecase.dart';
import 'package:tmda/features/movie/domain/usecases/see_all_movies/get_all_top_rated_movies_usecase.dart';
import 'package:tmda/features/movie/domain/usecases/get_movie_states_usecase.dart';

part 'see_all_movies_event.dart';

part 'see_all_movies_state.dart';

@injectable
class SeeAllMoviesBloc extends Bloc<SeeAllMoviesEvent, SeeAllMoviesState> {
  final GetAllNewMoviesUseCase _getAllNewMoviesUseCase;
  final GetAllPopularMoviesUseCase _getAllPopularMoviesUseCase;
  final GetAllTopRatedMoviesUseCase _getAllTopRatedMoviesUseCase;
  final GetAllRecommendedMoviesUseCase _getAllRecommendedMoviesUseCase;
  final GetAllSimilarMoviesUseCase _getAllSimilarMoviesUseCase;
  final AddOrRemoveMovieFromWatchListUseCase
      _addOrRemoveMovieFromWatchListUseCase;
  final GetMovieStateUseCase _getMovieStateUseCase;
  int _newMoviesPageNumber = 1;
  int _popularMoviesPageNumber = 1;
  int _topRatedMoviesPageNumber = 1;
  int _recommendedMoviesPageNumber = 1;
  int _similarMoviesPageNumber = 1;

  SeeAllMoviesBloc(
    this._getAllNewMoviesUseCase,
    this._getAllPopularMoviesUseCase,
    this._getAllTopRatedMoviesUseCase,
    this._getAllRecommendedMoviesUseCase,
    this._getAllSimilarMoviesUseCase,
    this._addOrRemoveMovieFromWatchListUseCase,
    this._getMovieStateUseCase,
  ) : super(const SeeAllMoviesState()) {
    on<GetAllNewMoviesEvent>(_getAllNewMoviesEvent, transformer: droppable());
    on<GetAllPopularMoviesEvent>(_getAllPopularMoviesEvent,
        transformer: droppable());
    on<GetAllTopRatedMoviesEvent>(_getAllTopRatedMoviesEvent,
        transformer: droppable());
    on<GetAllRecommendedMoviesEvent>(_getAllRecommendedMoviesEvent,
        transformer: droppable());
    on<GetAllSimilarMoviesEvent>(_getAllSimilarMoviesEvent,
        transformer: droppable());
    on<AddOrRemoveFromWatchListEvent>(_addOrRemoveFromWatchListEventEvent);
    on<CheckForMovieStatesEvent>(_checkForMovieStatesEvent);
    on<CheckForMoviesListStatesEvent>(_checkForMoviesListStatesEvent);
  }

  Future<void> _getAllNewMoviesEvent(event, emit) async {
    if (state.hasSeeAllMoviesListReachedMax == false) {
      await _getAllNewMoviesUseCase(
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
      await _getAllPopularMoviesUseCase(
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
      await _getAllTopRatedMoviesUseCase(
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
      await _getAllRecommendedMoviesUseCase(
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
      await _getAllSimilarMoviesUseCase(
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

  Future<void> _addOrRemoveFromWatchListEventEvent(event, emit) async {
    final result = await _addOrRemoveMovieFromWatchListUseCase(
      isInWatchList: event.isInWatchList,
      movieId: event.movieId,
    );
    result.fold(
      (watchListFailure) => emit(
        state.copyWith(
          addOrRemoveFromWatchListFailMessage: watchListFailure.message,
        ),
      ),
      (movieStatesUpdated) {
        emit(
          state.copyWith(
            seeAllMovies: List.from(
              state.seeAllMovies.map((movie) => movie.id == event.movieId
                  ? movie.copyWith(accountStates: movieStatesUpdated)
                  : movie),
            ),
          ),
        );
      },
    );
  }

  Future<void> _checkForMovieStatesEvent(event, emit) async {
    final result = await _getMovieStateUseCase(
      movieId: event.movieId,
    );
    result.fold(
      (checkFailure) => emit(
        state.copyWith(
          checkForMovieStatesFailMessage: checkFailure.message,
        ),
      ),
      (movieStatesUpdated) {
        emit(
          state.copyWith(
            seeAllMovies: List.from(
              state.seeAllMovies.map((movie) => movie.id == event.movieId
                  ? movie.copyWith(accountStates: movieStatesUpdated)
                  : movie),
            ),
          ),
        );
      },
    );
  }

  Future<void> _checkForMoviesListStatesEvent(event, emit) async {
    final movieIds = state.seeAllMovies.map((movie) => movie.id).toList();
    final movieUpdatedState = await Future.wait(movieIds
        .map(
          (movieId) => _getMovieStateUseCase(movieId: movieId),
        )
        .toList()
        .cast<Future<dynamic>>());
    for (Either either in movieUpdatedState) {
      either.fold(
        (checkFailure) => emit(
          state.copyWith(
            checkForMovieStatesFailMessage: checkFailure.message,
          ),
        ),
        (movieStatesUpdated) {
          emit(
            state.copyWith(
              seeAllMovies: List.from(
                state.seeAllMovies.map((movie) =>
                    movie.id == movieStatesUpdated.movieId
                        ? movie.copyWith(accountStates: movieStatesUpdated)
                        : movie),
              ),
            ),
          );
        },
      );
    }
  }
}
