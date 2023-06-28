import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:tmda/core/util/enums.dart';
import 'package:tmda/features/account/domain/entities/watchlist_movie.dart';
import 'package:tmda/features/account/domain/entities/watchlist_tv_show.dart';
import 'package:tmda/features/account/domain/usecases/add_or_remove_movie_from_watch_list_usecase.dart';
import 'package:tmda/features/account/domain/usecases/add_or_remove_tv_show_from_watch_list_usecase.dart';
import 'package:tmda/features/account/domain/usecases/get_account_session_id_usecase.dart';
import 'package:tmda/features/account/domain/usecases/get_all_movies_watchlist_usecase.dart';
import 'package:tmda/features/account/domain/usecases/get_all_tv_shows_watchlist_usecase.dart';
import 'package:tmda/features/account/domain/usecases/get_movie_show_watchlist_states_usecase.dart';
import 'package:tmda/features/account/domain/usecases/get_tv_show_watchlist_states_usecase.dart';

part 'account_see_all_event.dart';

part 'account_see_all_state.dart';

@injectable
class AccountSeeAllBloc extends Bloc<AccountSeeAllEvent, AccountSeeAllState> {
  final GetAccountSessionIdUseCase getAccountSessionIdUseCase;
  final GetAllMoviesWatchListUseCase getAllMoviesWatchListUseCase;
  final GetAllTvShowsWatchListUseCase getAllTvShowsWatchListUseCase;
  final GetTvShowWatchListStatesUseCase getTvShowWatchListStatesUseCase;
  final GetMovieWatchListStatesUseCase getMovieWatchListStatesUseCase;
  final AddOrRemoveTvShowFromAccountWatchListUseCase
      addOrRemoveTvShowFromAccountWatchListUseCase;
  final AddOrRemoveMovieFromAccountWatchListUseCase
      addOrRemoveMovieFromAccountWatchListUseCase;
  int movieWatchlistPage = 0;
  int tvShowWatchListPAge = 0;
  late String sessionId;

  AccountSeeAllBloc(
    this.getAccountSessionIdUseCase,
    this.getAllMoviesWatchListUseCase,
    this.getAllTvShowsWatchListUseCase,
    this.getTvShowWatchListStatesUseCase,
    this.addOrRemoveTvShowFromAccountWatchListUseCase,
    this.getMovieWatchListStatesUseCase,
    this.addOrRemoveMovieFromAccountWatchListUseCase,
  ) : super(const AccountSeeAllState()) {
    on<GetAllMoviesWatchListEvent>(
      _getAllMoviesWatchListEvent,
      transformer: droppable(),
    );
    on<GetAllTvShowsWatchListEvent>(
      _getAllTvShowsWatchListEvent,
      transformer: droppable(),
    );
    on<AddOrRemoveMovieFromWatchListEvent>(_addOrRemoveMovieFromWatchListEvent);
    on<AddOrRemoveTvShowFromWatchListEvent>(
        _addOrRemoveTvShowFromWatchListEvent);
    on<CheckForTvShowStatesEvent>(_checkForTvShowStatesEvent);
    on<CheckForMovieStatesEvent>(_checkForMovieStatesEvent);
    on<CheckForMoviesWatchListStatesEvent>(_checkForMoviesWatchListStatesEvent);
    on<CheckForTvShowsWatchListStatesEvent>(
        _checkForTvShowsWatchListStatesEvent);
  }

  Future<void> _getAllMoviesWatchListEvent(event, emit) async {
    sessionId = await getAccountSessionIdUseCase();
    await getAllMoviesWatchListUseCase(
      pageNumber: movieWatchlistPage,
      sessionId: sessionId,
    ).then(
      (value) => value.fold(
        (moviesWatchListFail) => emit(
          state.copyWith(seeAllState: BlocState.failure),
        ),
        (moviesWatchList) {
          moviesWatchList.isEmpty
              ? emit(
                  state.copyWith(
                    seeAllState: BlocState.success,
                    hasMoviesWatchListReachedMax: true,
                  ),
                )
              : emit(
                  state.copyWith(
                    seeAllState: BlocState.success,
                    moviesWatchList: List.of(state.moviesWatchList)
                      ..addAll(moviesWatchList),
                    hasMoviesWatchListReachedMax: false,
                  ),
                );
          movieWatchlistPage++;
        },
      ),
    );
  }

  Future<void> _getAllTvShowsWatchListEvent(event, emit) async {
    sessionId = await getAccountSessionIdUseCase();
    await getAllTvShowsWatchListUseCase(
      pageNumber: tvShowWatchListPAge,
      sessionId: sessionId,
    ).then(
      (value) => value.fold(
        (tvShowsWatchListFail) => emit(
          state.copyWith(
            seeAllState: BlocState.failure,
          ),
        ),
        (tvShowsWatchList) {
          tvShowsWatchList.isEmpty
              ? emit(
                  state.copyWith(
                    seeAllState: BlocState.success,
                    hasTvShowsWatchListReachedMax: true,
                  ),
                )
              : emit(
                  state.copyWith(
                    seeAllState: BlocState.success,
                    tvShowsWatchList: List.of(state.tvShowsWatchList)
                      ..addAll(tvShowsWatchList),
                    hasTvShowsWatchListReachedMax: false,
                  ),
                );
          tvShowWatchListPAge++;
        },
      ),
    );
  }

  Future<void> _addOrRemoveMovieFromWatchListEvent(event, emit) async {
    final result = await addOrRemoveMovieFromAccountWatchListUseCase(
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
      (statesUpdated) => emit(
        state.copyWith(
          moviesWatchList: List.from(
            state.moviesWatchList.map(
              (movie) => movie.id == event.movieId
                  ? movie.copyWith(accountStates: statesUpdated)
                  : movie,
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _addOrRemoveTvShowFromWatchListEvent(event, emit) async {
    final result = await addOrRemoveTvShowFromAccountWatchListUseCase(
      isInWatchList: event.isInWatchList,
      tvShowId: event.tvShowId,
      sessionId: sessionId,
    );
    result.fold(
        (watchListFailure) => emit(
              state.copyWith(
                addOrRemoveFromWatchListFailMessage: watchListFailure.message,
              ),
            ),
        (statesUpdated) => emit(
              state.copyWith(
                tvShowsWatchList: List.from(
                  state.moviesWatchList.map(
                    (tvShow) => tvShow.id == event.movieId
                        ? tvShow.copyWith(accountStates: statesUpdated)
                        : tvShow,
                  ),
                ),
              ),
            ));
  }

  Future<void> _checkForTvShowStatesEvent(event, emit) async {
    final result = await getTvShowWatchListStatesUseCase(
      tvShowId: event.tvShowId,
      sessionId: sessionId,
    );
    result.fold(
      (checkFailure) => emit(
        state.copyWith(
          updateStatesFailMessage: checkFailure.message,
        ),
      ),
      (statesUpdated) => emit(
        state.copyWith(
          tvShowsWatchList: List.from(
            state.tvShowsWatchList.map(
              (tvShow) => tvShow.id == event.movieId
                  ? tvShow.copyWith(accountStates: statesUpdated)
                  : tvShow,
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _checkForMovieStatesEvent(event, emit) async {
    final result = await getMovieWatchListStatesUseCase(
      movieId: event.movieId,
      sessionId: sessionId,
    );
    result.fold(
      (checkFailure) => emit(
        state.copyWith(
          updateStatesFailMessage: checkFailure.message,
        ),
      ),
      (statesUpdated) => emit(
        state.copyWith(
          tvShowsWatchList: List.from(
            state.moviesWatchList.map(
              (movie) => movie.id == event.movieId
                  ? movie.copyWith(accountStates: statesUpdated)
                  : movie,
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _checkForMoviesWatchListStatesEvent(event, emit) async {
    final movieIds = state.moviesWatchList.map((movie) => movie.id).toList();
    final movieUpdatedState = await Future.wait(movieIds
        .map((movieId) => getMovieWatchListStatesUseCase(
            movieId: movieId, sessionId: sessionId))
        .toList()
        .cast<Future<dynamic>>());
    for (Either either in movieUpdatedState) {
      either.fold(
        (checkFailure) => emit(
          state.copyWith(
            updateStatesFailMessage: checkFailure.message,
          ),
        ),
        (movieStatesUpdated) {
          emit(
            state.copyWith(
              moviesWatchList: List.from(
                state.moviesWatchList.map(
                  (movie) => movie.id == movieStatesUpdated.movieId
                      ? movie.copyWith(accountStates: movieStatesUpdated)
                      : movie,
                ),
              ),
            ),
          );
        },
      );
    }
  }

  Future<void> _checkForTvShowsWatchListStatesEvent(event, emit) async {
    final tvShowsIds = state.moviesWatchList.map((movie) => movie.id).toList();
    final tvShowUpdatedState = await Future.wait(tvShowsIds
        .map(
          (tvShowId) => getTvShowWatchListStatesUseCase(
            tvShowId: tvShowId,
            sessionId: sessionId,
          ),
        ).toList().cast<Future<dynamic>>());
    for (Either either in tvShowUpdatedState) {
      either.fold(
        (checkFailure) => emit(
          state.copyWith(
            updateStatesFailMessage: checkFailure.message,
          ),
        ),
        (tvShowStatesUpdated) {
          emit(
            state.copyWith(
              tvShowsWatchList: List.from(
                state.tvShowsWatchList.map(
                  (tvShow) => tvShow.id == tvShowStatesUpdated.movieId
                      ? tvShow.copyWith(accountStates: tvShowStatesUpdated)
                      : tvShow,
                ),
              ),
            ),
          );
        },
      );
    }
  }
}
