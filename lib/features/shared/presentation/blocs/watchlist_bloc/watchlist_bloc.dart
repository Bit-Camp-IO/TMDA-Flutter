import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:tmda/core/util/enums.dart';
import 'package:tmda/features/shared/domain/entities/movie.dart';
import 'package:tmda/features/shared/domain/entities/tv_show.dart';
import 'package:tmda/features/shared/domain/usecases/add_or_remove_movie_from_watchlist_usecase.dart';
import 'package:tmda/features/shared/domain/usecases/add_or_remove_tvshow_from_watchlist_usecase.dart';
import 'package:tmda/features/shared/domain/usecases/get_movies_watch_list_usecase.dart';
import 'package:tmda/features/shared/domain/usecases/get_movies_watchlist_ids_set_usecase.dart';
import 'package:tmda/features/shared/domain/usecases/get_tv_shows_watch_list_usecase.dart';
import 'package:tmda/features/shared/domain/usecases/get_tv_shows_watchlist_ids_set_usecase.dart';

part 'watchlist_state.dart';

part 'watchlist_event.dart';

@injectable
class WatchListBloc extends Bloc<WatchListEvent, WatchListState> {
  final GetMoviesWatchListIdsSetUseCase _getMoviesWatchListIdsSetUseCase;
  final GetMoviesWatchListUseCase _getMoviesWatchListUseCase;
  final AddOrRemoveMovieFromWatchListUseCase
      _addOrRemoveMovieFromWatchListUseCase;
  final GetTvShowsWatchListIdsSetUseCase _getTvShowsWatchListIdsSetUseCase;
  final GetTvShowsWatchListUseCase _getTvShowsWatchListUseCase;
  final AddOrRemoveTvShowFromWatchListUseCase _addOrRemoveTvShowFromWatchListUseCase;
  int _moviesWatchListPage = 1;
  int _tvShowsWatchListPage = 1;

  WatchListBloc(
    this._getMoviesWatchListUseCase,
    this._addOrRemoveMovieFromWatchListUseCase,
    this._getTvShowsWatchListUseCase,
    this._addOrRemoveTvShowFromWatchListUseCase,
    this._getMoviesWatchListIdsSetUseCase,
    this._getTvShowsWatchListIdsSetUseCase,
  ) : super(const WatchListState()) {
    on<GetMoviesWatchListIdsEvent>(_getMoviesWatchListIdsEvent);
    on<GetTvShowsWatchListIdsEvent>(_getTvShowsWatchListIdsEvent);
    on<GetMoviesWatchListEvent>(_getMoviesWatchListEvent, transformer: droppable());
    on<GetTvShowsWatchListEvent>(_getTvShowsWatchListEvent, transformer: droppable());
    on<AddOrRemoveMovieFromWatchListEvent>(_addOrRemoveMovieFromWatchListEvent);
    on<AddOrRemoveTvShowFromWatchListEvent>(_addOrRemoveTvShowFromWatchListEvent);
    on<ChangeMoviesWatchListViewScrollState>(_changeMoviesWatchListViewScrollState);
    on<ChangeTvShowsWatchListViewScrollState>(_changeTvShowsWatchListViewScrollState);
  }

  Future<void> _getMoviesWatchListIdsEvent(GetMoviesWatchListIdsEvent event, Emitter<WatchListState> emit) async {
    await _getMoviesWatchListIdsSetUseCase().then(
      (value) => value.fold(
        (failure) => emit(
          state.copyWith(
            moviesWatchListState: BlocState.failure,
            moviesWatchListFailMessage: failure.message,
          ),
        ),
        (moviesWatchListIdsSet) {
          emit(
            state.copyWith(
              moviesWatchListIdsSet: moviesWatchListIdsSet,
            ),
          );
        },
      ),
    );
  }

  Future<void> _getTvShowsWatchListIdsEvent(GetTvShowsWatchListIdsEvent event, Emitter<WatchListState> emit) async {
    await _getTvShowsWatchListIdsSetUseCase().then(
      (value) => value.fold(
        (failure) => emit(
          state.copyWith(
            tvShowsWatchListState: BlocState.failure,
            tvShowsWatchListFailMessage: failure.message,
          ),
        ),
        (tvShowsWatchListIdsSet) {
          emit(
            state.copyWith(
              tvShowsWatchListIdsSet: tvShowsWatchListIdsSet,
            ),
          );
        },
      ),
    );
  }

  Future<void> _getMoviesWatchListEvent(GetMoviesWatchListEvent event, Emitter<WatchListState> emit) async {
    if (state.hasMoviesWatchListReachedMax == false && state.isMoviesWatchListViewHasReachedMaxScroll == false) {
      await _getMoviesWatchListUseCase(pageNumber: _moviesWatchListPage).then(
        (value) => value.fold(
          (failure) => emit(
            state.copyWith(
              moviesWatchListState: BlocState.failure,
              moviesWatchListFailMessage: failure.message,
            ),
          ),
          (moviesWatchList) {
            emit(
              state.copyWith(
                moviesWatchList: {...state.moviesWatchList, ...moviesWatchList}.toList(),
                moviesWatchListState: BlocState.success,
                hasMoviesWatchListReachedMax: moviesWatchList.length < 20 ? true : false,
              ),
            );
            if (moviesWatchList.length == 20) {
              _moviesWatchListPage++;
            }
          },
        ),
      );
    }
  }

  Future<void> _getTvShowsWatchListEvent(GetTvShowsWatchListEvent event, Emitter<WatchListState> emit) async {
    if (state.hasTvShowsWatchListReachedMax == false && state.isTvShowsWatchListViewHasReachedMaxScroll == false) {
      await _getTvShowsWatchListUseCase(pageNumber: _tvShowsWatchListPage).then(
        (value) => value.fold(
          (failure) => emit(
            state.copyWith(
              tvShowsWatchListState: BlocState.failure,
              tvShowsWatchListFailMessage: failure.message,
            ),
          ),
          (tvShowsWatchList) {
            emit(
              state.copyWith(
                tvShowsWatchList: {...state.tvShowsWatchList, ...tvShowsWatchList}.toList(),
                tvShowsWatchListState: BlocState.success,
                hasTvShowsWatchListReachedMax: tvShowsWatchList.length < 20 ? true : false,
              ),
            );
            if (tvShowsWatchList.length == 20) {
              _tvShowsWatchListPage++;
            }
          },
        ),
      );
    }
  }

  Future<void> _addOrRemoveMovieFromWatchListEvent(AddOrRemoveMovieFromWatchListEvent event, Emitter<WatchListState> emit) async {
    await _addOrRemoveMovieFromWatchListUseCase(
      movieId: event.movieId,
      isInWatchList: event.isInWatchList,
    ).then(
      (value) => value.fold(
        (watchListFailure) => emit(
          state.copyWith(
            addOrRemoveMovieFromWatchListFailMessage: watchListFailure.message,
          ),
        ),
        (movie) {
          final Set<int> moviesWatchListIdsSet = state.moviesWatchListIdsSet.toSet();
          final List<Movie> movieWatchList = state.moviesWatchList.toList();
          if (event.isInWatchList) {
            moviesWatchListIdsSet.add(event.movieId);
            if (movieWatchList.length < 20|| state.isMoviesWatchListViewHasReachedMaxScroll == true) {
              movieWatchList.add(movie);
            }
          } else {
            moviesWatchListIdsSet.remove(event.movieId);
            movieWatchList.removeWhere((tvShow) => tvShow.id == event.movieId);
          }
          debugPrint(state.moviesWatchListIdsSet.toString());
          emit(
            state.copyWith(
              moviesWatchListIdsSet: moviesWatchListIdsSet,
              moviesWatchList: movieWatchList,
              hasMoviesWatchListReachedMax: event.isInWatchList ? false : state.hasMoviesWatchListReachedMax,
            ),
          );
        },
      ),
    );
  }

  Future<void> _addOrRemoveTvShowFromWatchListEvent(AddOrRemoveTvShowFromWatchListEvent event, Emitter<WatchListState> emit) async {
    await _addOrRemoveTvShowFromWatchListUseCase(
      tvShowId: event.tvShowId,
      isInWatchList: event.isInWatchList,
    ).then(
      (value) => value.fold(
        (watchListFailure) => emit(
          state.copyWith(
            addOrRemoveTvShowFromWatchListFailMessage: watchListFailure.message,
          ),
        ),
        (tvShow) {
          final Set<int> tvShowIds = state.tvShowsWatchListIdsSet.toSet();
          final List<TvShow> tvShowsWatchList = state.tvShowsWatchList.toList();
          if (event.isInWatchList) {
            tvShowIds.add(event.tvShowId);
            if (tvShowsWatchList.length < 20 || state.isTvShowsWatchListViewHasReachedMaxScroll == true) {
              tvShowsWatchList.add(tvShow);
            }
          } else {
            tvShowIds.remove(event.tvShowId);
            tvShowsWatchList.removeWhere((tvShow) => tvShow.id == event.tvShowId);
          }
          emit(
            state.copyWith(
              tvShowsWatchListIdsSet: tvShowIds,
              tvShowsWatchList: tvShowsWatchList,
              hasMoviesWatchListReachedMax: event.isInWatchList ? false : state.hasTvShowsWatchListReachedMax,
            ),
          );
        },
      ),
    );
  }

  void _changeMoviesWatchListViewScrollState(ChangeMoviesWatchListViewScrollState event, Emitter<WatchListState> emit){
    emit(state.copyWith(isMoviesWatchListViewHasReachedMaxScroll: event.isMoviesWatchListViewHasReachedMaxScroll));
  }
  void _changeTvShowsWatchListViewScrollState(ChangeTvShowsWatchListViewScrollState event, Emitter<WatchListState> emit){
    emit(state.copyWith(isTvShowsWatchListViewHasReachedMaxScroll: event.isTvShowsWatchListViewHasReachedMaxScroll));
  }
}
