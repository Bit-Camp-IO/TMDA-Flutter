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
  final RemoveTvShowFromWatchListUseCase removeTvShowFromWatchListUseCase;
  final RemoveMovieFromWatchListUseCase removeMovieFromWatchListUseCase;
  int movieWatchlistPage = 1;
  int tvShowWatchListPage = 1;
  late String sessionId;

  AccountSeeAllBloc(
    this.getAccountSessionIdUseCase,
    this.getAllMoviesWatchListUseCase,
    this.getAllTvShowsWatchListUseCase,
    this.getTvShowWatchListStatesUseCase,
    this.removeTvShowFromWatchListUseCase,
    this.getMovieWatchListStatesUseCase,
    this.removeMovieFromWatchListUseCase,
  ) : super(const AccountSeeAllState()) {
    on<GetAllMoviesWatchListEvent>(
      _getAllMoviesWatchListEvent,
      transformer: droppable(),
    );
    on<GetAllTvShowsWatchListEvent>(
      _getAllTvShowsWatchListEvent,
      transformer: droppable(),
    );
    on<RemoveMovieFromWatchListEvent>(_removeMovieFromWatchListEvent);
    on<RemoveTvShowFromWatchListEvent>(_removeTvShowFromWatchListEvent);
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
          List<WatchListMovie> newMovies =
              {...state.moviesWatchList, ...moviesWatchList}.toList();
          emit(
            state.copyWith(
              seeAllState: BlocState.success,
              moviesWatchList: newMovies,
            ),
          );
          if (moviesWatchList.length == 20) {
            movieWatchlistPage++;
          }
        },
      ),
    );
  }

  Future<void> _getAllTvShowsWatchListEvent(event, emit) async {
    sessionId = await getAccountSessionIdUseCase();
    await getAllTvShowsWatchListUseCase(
      pageNumber: tvShowWatchListPage,
      sessionId: sessionId,
    ).then(
      (value) => value.fold(
        (tvShowsWatchListFail) => emit(
          state.copyWith(
            seeAllState: BlocState.failure,
          ),
        ),
        (tvShowsWatchList) {
          List<WatchListTvShow> newTvShows =
              {...state.tvShowsWatchList, ...tvShowsWatchList}.toList();
          emit(
            state.copyWith(
              seeAllState: BlocState.success,
              tvShowsWatchList: newTvShows,
            ),
          );
          if (tvShowsWatchList.length == 20) {
            tvShowWatchListPage++;
          }
        },
      ),
    );
  }

  Future<void> _removeMovieFromWatchListEvent(event, emit) async {
    final result = await removeMovieFromWatchListUseCase(
      movieId: event.movieId,
      sessionId: sessionId,
    );
    result.fold(
        (watchListFailure) => emit(
              state.copyWith(
                addOrRemoveFromWatchListFailMessage: watchListFailure.message,
              ),
            ), (statesUpdated) {
      List<WatchListMovie> updatedMovies = state.moviesWatchList
          .where(
            (movie) =>
                movie.id != statesUpdated.contentId ||
                movie.accountStates.inWatchList == statesUpdated.inWatchList,
          ).toList();
      return emit(
        state.copyWith(
          moviesWatchList: updatedMovies,
        ),
      );
    });
  }

  Future<void> _removeTvShowFromWatchListEvent(event, emit) async {
    final result = await removeTvShowFromWatchListUseCase(
      tvShowId: event.tvShowId,
      sessionId: sessionId,
    );
    result.fold(
      (watchListFailure) => emit(
        state.copyWith(
          addOrRemoveFromWatchListFailMessage: watchListFailure.message,
        ),
      ),
      (statesUpdated) {
        List<WatchListTvShow> updatedTvShowList = state.tvShowsWatchList
            .where((tvShow) =>
                tvShow.id != statesUpdated.contentId ||
                tvShow.accountStates.inWatchList == statesUpdated.inWatchList)
            .toList();

        emit(
          state.copyWith(
            tvShowsWatchList: updatedTvShowList,
          ),
        );
      },
    );
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
      (statesUpdated) {
        List<WatchListTvShow> updatedTvShowList = state.tvShowsWatchList
            .where((tvShow) =>
                tvShow.id != statesUpdated.contentId ||
                tvShow.accountStates.inWatchList == statesUpdated.inWatchList)
            .toList();
        return emit(
          state.copyWith(
            tvShowsWatchList: updatedTvShowList,
          ),
        );
      },
    );
  }

  Future<void> _checkForMovieStatesEvent(event, emit) async {
    await getMovieWatchListStatesUseCase(
      movieId: event.movieId,
      sessionId: sessionId,
    ).then(
      (value) => value.fold(
        (checkFailure) => emit(
          state.copyWith(
            updateStatesFailMessage: checkFailure.message,
          ),
        ),
        (statesUpdated) {
          List<WatchListMovie> updatedMovies = state.moviesWatchList
              .where(
                (movie) =>
                    movie.id != statesUpdated.contentId ||
                    movie.accountStates.inWatchList ==
                        statesUpdated.inWatchList,
              )
              .toList();
          return emit(
            state.copyWith(
              moviesWatchList: updatedMovies,
            ),
          );
        },
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
          List<WatchListMovie> updatedMovies = state.moviesWatchList
              .where(
                (movie) =>
                    movie.id != movieStatesUpdated.contentId ||
                    movie.accountStates.inWatchList ==
                        movieStatesUpdated.inWatchList,
              )
              .toList();
          return emit(
            state.copyWith(
              moviesWatchList: updatedMovies,
            ),
          );
        },
      );
    }
  }

  Future<void> _checkForTvShowsWatchListStatesEvent(event, emit) async {
    final tvShowsIds = state.tvShowsWatchList.map((tvShow) => tvShow.id).toList();
    final tvShowUpdatedState = await Future.wait(tvShowsIds
        .map(
          (tvShowId) => getTvShowWatchListStatesUseCase(
            tvShowId: tvShowId,
            sessionId: sessionId,
          ),
        )
        .toList()
        .cast<Future<dynamic>>());
    for (Either either in tvShowUpdatedState) {
      either.fold(
        (checkFailure) => emit(
          state.copyWith(
            updateStatesFailMessage: checkFailure.message,
          ),
        ),
        (tvShowStates) {
          List<WatchListTvShow> updatedTvShowList = state.tvShowsWatchList
              .where((tvShow) =>
                  tvShow.id != tvShowStates.contentId ||
                  tvShow.accountStates.inWatchList ==
                      tvShowStates.inWatchList).toList();
          return emit(
            state.copyWith(
              tvShowsWatchList: updatedTvShowList,
            ),
          );
        },
      );
    }
  }
}
