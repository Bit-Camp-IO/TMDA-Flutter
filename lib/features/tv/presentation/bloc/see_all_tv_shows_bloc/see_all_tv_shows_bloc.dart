import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:tmda/core/util/enums.dart';
import 'package:tmda/features/tv/domain/entities/tv_show.dart';
import 'package:tmda/features/tv/domain/usecases/see_all_tv_shows/get_all_popular_tv_shows_usecase.dart';
import 'package:tmda/features/tv/domain/usecases/see_all_tv_shows/get_all_recommended_tv_shows_usecase.dart';
import 'package:tmda/features/tv/domain/usecases/see_all_tv_shows/get_all_similar_tv_shows_usecase.dart';
import 'package:tmda/features/tv/domain/usecases/see_all_tv_shows/get_all_top_rated_tv_shows_usecase.dart';
import 'package:tmda/features/tv/domain/usecases/see_all_tv_shows/get_all_tv_shows_airing_today_usecase.dart';
import 'package:tmda/features/tv/domain/usecases/get_tv_show_states_usecase.dart';
import 'package:tmda/features/tv/domain/usecases/add_or_remove_tv_from_watchlist_usecase.dart';

part 'see_all_tv_shows_event.dart';

part 'see_all_tv_shows_state.dart';

@injectable
class SeeAllTvShowsBloc extends Bloc<SeeAllTvShowsEvent, SeeAllTvShowsState> {
  final GetAllAiringTodayTvShowsUseCase _getAllAiringTodayTvShowsUseCase;
  final GetAllPopularTvShowsUseCase _getAllPopularTvShowsUseCase;
  final GetAllTopRatedTvShowsUseCase _getAllTopRatedTvShowsUseCase;
  final GetAllRecommendedTvShowsUseCase _getAllRecommendedTvShowsUseCase;
  final GetAllSimilarTvShowsUseCase _getAllSimilarTvShowsUseCase;
  final GetTvShowStateUseCase _getTvShowStateUseCase;
  final AddOrRemoveTvFromWatchListUseCase _addOrRemoveTvFromWatchListUseCase;
  int _airingTodayTvShowsPageNumber = 1;
  int _popularTvShowsPageNumber = 2;
  int _topRatedTvShowsPageNumber = 1;
  int _recommendedTvShowsPageNumber = 1;
  int _similarTvShowsPageNumber = 1;

  SeeAllTvShowsBloc(
      this._getAllAiringTodayTvShowsUseCase,
      this._getAllPopularTvShowsUseCase,
      this._getAllTopRatedTvShowsUseCase,
      this._getAllRecommendedTvShowsUseCase,
      this._getAllSimilarTvShowsUseCase,
      this._getTvShowStateUseCase,
      this._addOrRemoveTvFromWatchListUseCase)
      : super(const SeeAllTvShowsState()) {
    on<GetAllAiringTodayTvShowsEvent>(_getAllAiringTodayTvShowsEvent,
        transformer: droppable());
    on<GetAllPopularTvShowsEvent>(_getAllPopularTvShowsEvent,
        transformer: droppable());
    on<GetAllTopRatedTvShowsEvent>(_getAllTopRatedTvShowsEvent,
        transformer: droppable());
    on<GetAllRecommendedTvShowsEvent>(_getAllRecommendedTvShowsEvent,
        transformer: droppable());
    on<GetAllSimilarTvShowsEvent>(_getAllSimilarTvShowsEvent,
        transformer: droppable());
    on<AddOrRemoveFromWatchListEvent>(_addOrRemoveFromWatchListEventEvent);
    on<CheckForTvShowStatesEvent>(_checkForTvShowStatesEvent);
    on<CheckForTvShowsListStatesEvent>(_checkForTvShowsListStatesEvent);
  }

  Future<void> _getAllAiringTodayTvShowsEvent(event, emit) async {
    if (state.hasSeeAllTvShowsListReachedMax == false) {
      await _getAllAiringTodayTvShowsUseCase(
        pageNumber: _airingTodayTvShowsPageNumber,
      ).then(
        (value) => value.fold(
          (airingTodayLoadFail) => emit(
            state.copyWith(seeAllState: BlocState.failure),
          ),
          (airingTodayList) {
            airingTodayList.isEmpty
                ? emit(
                    state.copyWith(
                      seeAllState: BlocState.success,
                      hasSeeAllTvShowsListReachedMax: true,
                    ),
                  )
                : emit(
                    state.copyWith(
                      seeAllState: BlocState.success,
                      seeAllTvShows: List.of(state.seeAllTvShows)
                        ..addAll(airingTodayList.reversed),
                      hasSeeAllTvShowsListReachedMax: false,
                    ),
                  );
            _airingTodayTvShowsPageNumber++;
          },
        ),
      );
    }
  }

  Future<void> _getAllPopularTvShowsEvent(event, emit) async {
    if (state.hasSeeAllTvShowsListReachedMax == false) {
      await _getAllPopularTvShowsUseCase(
        pageNumber: _popularTvShowsPageNumber,
      ).then(
        (value) => value.fold(
          (popularTvShowsLoadFail) => emit(
            state.copyWith(seeAllState: BlocState.failure),
          ),
          (popularTvShowsList) {
            popularTvShowsList.isEmpty
                ? emit(
                    state.copyWith(
                      seeAllState: BlocState.success,
                      hasSeeAllTvShowsListReachedMax: true,
                    ),
                  )
                : emit(
                    state.copyWith(
                      seeAllState: BlocState.success,
                      seeAllTvShows: List.of(state.seeAllTvShows)
                        ..addAll(popularTvShowsList.reversed),
                      hasSeeAllTvShowsListReachedMax: false,
                    ),
                  );
            _popularTvShowsPageNumber++;
          },
        ),
      );
    }
  }

  Future<void> _getAllTopRatedTvShowsEvent(event, emit) async {
    if (state.hasSeeAllTvShowsListReachedMax == false) {
      await _getAllTopRatedTvShowsUseCase(
        pageNumber: _topRatedTvShowsPageNumber,
      ).then(
        (value) => value.fold(
          (topRatedTvShowsLoadFail) => emit(
            state.copyWith(seeAllState: BlocState.failure),
          ),
          (topRatedTvShowsList) {
            topRatedTvShowsList.isEmpty
                ? emit(
                    state.copyWith(
                      seeAllState: BlocState.success,
                      hasSeeAllTvShowsListReachedMax: true,
                    ),
                  )
                : emit(
                    state.copyWith(
                      seeAllState: BlocState.success,
                      seeAllTvShows: List.of(state.seeAllTvShows)
                        ..addAll(topRatedTvShowsList),
                      hasSeeAllTvShowsListReachedMax: false,
                    ),
                  );
            _topRatedTvShowsPageNumber++;
          },
        ),
      );
    }
  }

  Future<void> _getAllRecommendedTvShowsEvent(event, emit) async {
    if (state.hasSeeAllTvShowsListReachedMax == false) {
      await _getAllRecommendedTvShowsUseCase(
        pageNumber: _recommendedTvShowsPageNumber,
        tvShowId: event.tvShowId,
      ).then(
        (value) => value.fold(
          (recommendedTvShowsLoadFail) => emit(
            state.copyWith(seeAllState: BlocState.failure),
          ),
          (recommendedTvShowsList) {
            recommendedTvShowsList.isEmpty
                ? emit(
                    state.copyWith(
                      seeAllState: BlocState.success,
                      hasSeeAllTvShowsListReachedMax: true,
                    ),
                  )
                : emit(
                    state.copyWith(
                      seeAllState: BlocState.success,
                      seeAllTvShows: List.of(state.seeAllTvShows)
                        ..addAll(recommendedTvShowsList),
                      hasSeeAllTvShowsListReachedMax: false,
                    ),
                  );
            _recommendedTvShowsPageNumber++;
          },
        ),
      );
    }
  }

  Future<void> _getAllSimilarTvShowsEvent(event, emit) async {
    if (state.hasSeeAllTvShowsListReachedMax == false) {
      await _getAllSimilarTvShowsUseCase(
        pageNumber: _similarTvShowsPageNumber,
        tvShowId: event.tvShowId,
      ).then(
        (value) => value.fold(
          (similarTvShowsLoadFail) => emit(
            state.copyWith(seeAllState: BlocState.failure),
          ),
          (similarTvShowsList) {
            similarTvShowsList.isEmpty
                ? emit(
                    state.copyWith(
                      seeAllState: BlocState.success,
                      hasSeeAllTvShowsListReachedMax: true,
                    ),
                  )
                : emit(
                    state.copyWith(
                      seeAllState: BlocState.success,
                      seeAllTvShows: List.of(state.seeAllTvShows)
                        ..addAll(similarTvShowsList),
                      hasSeeAllTvShowsListReachedMax: false,
                    ),
                  );
            _similarTvShowsPageNumber++;
          },
        ),
      );
    }
  }

  Future<void> _addOrRemoveFromWatchListEventEvent(event, emit) async {
    final result = await _addOrRemoveTvFromWatchListUseCase(
      isInWatchList: event.isInWatchList,
      tvShowId: event.tvShowId,
    );
    result.fold(
      (watchListFailure) => emit(
        state.copyWith(
          addOrRemoveFromWatchListFailMessage: watchListFailure.message,
        ),
      ),
      (tvShowStatesUpdated) {
        emit(
          state.copyWith(
            seeAllTvShows: List.from(
              state.seeAllTvShows.map((tvShow) => tvShow.id == event.tvShowId
                  ? tvShow.copyWith(accountStates: tvShowStatesUpdated)
                  : tvShow),
            ),
          ),
        );
      },
    );
  }

  Future<void> _checkForTvShowStatesEvent(event, emit) async {
    final result = await _getTvShowStateUseCase(
      tvShowId: event.tvShowId,
    );
    result.fold(
      (checkFailure) => emit(
        state.copyWith(
          checkForTvShowStatesFailMessage: checkFailure.message,
        ),
      ),
      (tvShowStatesUpdated) {
        emit(
          state.copyWith(
            seeAllTvShows: List.from(
              state.seeAllTvShows.map((tvShow) => tvShow.id == event.tvShowId
                  ? tvShow.copyWith(accountStates: tvShowStatesUpdated)
                  : tvShow),
            ),
          ),
        );
      },
    );
  }

  Future<void> _checkForTvShowsListStatesEvent(event, emit) async {
    final tvShowsIds = state.seeAllTvShows.map((tvShow) => tvShow.id).toList();
    final tvShowUpdatedState = await Future.wait(tvShowsIds
        .map((tvShowId) => _getTvShowStateUseCase(tvShowId: tvShowId))
        .toList()
        .cast<Future<dynamic>>());
    for (Either either in tvShowUpdatedState) {
      either.fold(
        (checkFailure) => emit(
          state.copyWith(
            checkForTvShowStatesFailMessage: checkFailure.message,
          ),
        ),
        (tvShowStatesUpdated) {
          emit(
            state.copyWith(
              seeAllTvShows: List.from(
                state.seeAllTvShows.map((tvShow) =>
                    tvShow.id == tvShowStatesUpdated.id
                        ? tvShow.copyWith(accountStates: tvShowStatesUpdated)
                        : tvShow),
              ),
            ),
          );
        },
      );
    }
  }
}
