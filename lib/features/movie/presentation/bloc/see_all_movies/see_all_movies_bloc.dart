import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:tmda/core/util/enums.dart';
import 'package:tmda/features/movie/domain/entities/movies.dart';
import 'package:tmda/features/movie/domain/usecases/movie_details/add_or_remove_movie_from_watch_list_usecase.dart';
import 'package:tmda/features/movie/domain/usecases/movie_details/get_session_id_usecase.dart';
import 'package:tmda/features/movie/domain/usecases/see_all_movies/get_all_new_movies_usecase.dart';
import 'package:tmda/features/movie/domain/usecases/see_all_movies/get_all_popular_movies_usecase.dart';
import 'package:tmda/features/movie/domain/usecases/see_all_movies/get_all_recommended_movies_usecase.dart';
import 'package:tmda/features/movie/domain/usecases/see_all_movies/get_all_similar_movies_usecase.dart';
import 'package:tmda/features/movie/domain/usecases/see_all_movies/get_all_top_rated_movies_usecase.dart';
import 'package:tmda/features/movie/domain/usecases/see_all_movies/get_movie_states_usecase.dart';

part 'see_all_movies_event.dart';

part 'see_all_movies_state.dart';

@injectable
class SeeAllMoviesBloc extends Bloc<SeeAllMoviesEvent, SeeAllMoviesState> {
  final GetSessionIdUseCase getSessionIdUseCase;
  final GetAllNewMoviesUseCase getAllNewMoviesUseCase;
  final GetAllPopularMoviesUseCase getAllPopularMoviesUseCase;
  final GetAllTopRatedMoviesUseCase getAllTopRatedMoviesUseCase;
  final GetAllRecommendedMoviesUseCase getAllRecommendedMoviesUseCase;
  final GetAllSimilarMoviesUseCase getAllSimilarMoviesUseCase;
  final AddOrRemoveMovieFromWatchListUseCase
      addOrRemoveMovieFromWatchListUseCase;
  final GetMovieStateUseCase getMovieStateUseCase;
  int newMoviesPageNumber = 1;
  int popularMoviesPageNumber = 1;
  int topRatedMoviesPageNumber = 1;
  int recommendedMoviesPageNumber = 1;
  int similarMoviesPageNumber = 1;
  late String sessionId;

  SeeAllMoviesBloc(
    this.getAllNewMoviesUseCase,
    this.getAllPopularMoviesUseCase,
    this.getAllTopRatedMoviesUseCase,
    this.getAllRecommendedMoviesUseCase,
    this.getAllSimilarMoviesUseCase,
    this.addOrRemoveMovieFromWatchListUseCase,
    this.getMovieStateUseCase,
    this.getSessionIdUseCase,
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
    sessionId = await getSessionIdUseCase();
    await getAllNewMoviesUseCase(
            pageNumber: newMoviesPageNumber, sessionId: sessionId)
        .then(
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
          newMoviesPageNumber++;
        },
      ),
    );
  }

  Future<void> _getAllPopularMoviesEvent(event, emit) async {
    sessionId = await getSessionIdUseCase();
    await getAllPopularMoviesUseCase(
            pageNumber: popularMoviesPageNumber, sessionId: sessionId)
        .then(
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
          popularMoviesPageNumber++;
        },
      ),
    );
  }

  Future<void> _getAllTopRatedMoviesEvent(event, emit) async {
    sessionId = await getSessionIdUseCase();
    await getAllTopRatedMoviesUseCase(
            pageNumber: topRatedMoviesPageNumber, sessionId: sessionId)
        .then(
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
          topRatedMoviesPageNumber++;
        },
      ),
    );
  }

  Future<void> _getAllRecommendedMoviesEvent(event, emit) async {
    sessionId = await getSessionIdUseCase();
    await getAllRecommendedMoviesUseCase(
            pageNumber: recommendedMoviesPageNumber,
            sessionId: sessionId,
            movieId: event.movieId)
        .then(
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
          recommendedMoviesPageNumber++;
        },
      ),
    );
  }

  Future<void> _getAllSimilarMoviesEvent(event, emit) async {
    sessionId = await getSessionIdUseCase();
    await getAllSimilarMoviesUseCase(
            pageNumber: similarMoviesPageNumber,
            sessionId: sessionId,
            movieId: event.movieId)
        .then(
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
          similarMoviesPageNumber++;
        },
      ),
    );
  }

  Future<void> _addOrRemoveFromWatchListEventEvent(event, emit) async {
    final result = await addOrRemoveMovieFromWatchListUseCase(
      isInWatchList: event.isInWatchList,
      movieId: event.movieId,
      sessionId: sessionId,
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
    final result = await getMovieStateUseCase(
      movieId: event.movieId,
      sessionId: sessionId,
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
        .map((movieId) =>
            getMovieStateUseCase(movieId: movieId, sessionId: sessionId))
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
