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
import 'package:tmda/features/tv/domain/usecases/see_all_tv_shows/get_tv_show_states_usecase.dart';
import 'package:tmda/features/tv/domain/usecases/tv_show_details/add_or_remove_tv_from_watchlist_usecase.dart';
import 'package:tmda/features/tv/domain/usecases/tv_show_details/tv_get_session_key_usecase.dart';

part 'see_all_tv_shows_event.dart';
part 'see_all_tv_shows_state.dart';

@injectable
class SeeAllTvShowsBloc extends Bloc<SeeAllTvShowsEvent, SeeAllTvShowsState> {
  final TvGetSessionIdUseCase tvGetSessionIdUseCase;
  final GetAllAiringTodayTvShowsUseCase getAllAiringTodayTvShowsUseCase;
  final GetAllPopularTvShowsUseCase getAllPopularTvShowsUseCase;
  final GetAllTopRatedTvShowsUseCase getAllTopRatedTvShowsUseCase;
  final GetAllRecommendedTvShowsUseCase getAllRecommendedTvShowsUseCase;
  final GetAllSimilarTvShowsUseCase getAllSimilarTvShowsUseCase;
  final GetTvShowStateUseCase getTvShowStateUseCase;
  final AddOrRemoveTvFromWatchListUseCase addOrRemoveTvFromWatchListUseCase;
  int airingTodayTvShowsPageNumber = 1;
  int popularTvShowsPageNumber = 2;
  int topRatedTvShowsPageNumber = 1;
  int recommendedTvShowsPageNumber = 1;
  int similarTvShowsPageNumber = 1;
  late String sessionId;

  SeeAllTvShowsBloc(
      this.tvGetSessionIdUseCase,
      this.getAllAiringTodayTvShowsUseCase,
      this.getAllPopularTvShowsUseCase,
      this.getAllTopRatedTvShowsUseCase,
      this.getAllRecommendedTvShowsUseCase,
      this.getAllSimilarTvShowsUseCase,
      this.getTvShowStateUseCase,
      this.addOrRemoveTvFromWatchListUseCase)
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
    sessionId = await tvGetSessionIdUseCase();
    await getAllAiringTodayTvShowsUseCase(
            pageNumber: airingTodayTvShowsPageNumber, sessionId: sessionId)
        .then(
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
          airingTodayTvShowsPageNumber++;
        },
      ),
    );
  }

  Future<void> _getAllPopularTvShowsEvent(event, emit) async {
    sessionId = await tvGetSessionIdUseCase();
    await getAllPopularTvShowsUseCase(
            pageNumber: popularTvShowsPageNumber, sessionId: sessionId)
        .then(
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
          popularTvShowsPageNumber++;
        },
      ),
    );
  }

  Future<void> _getAllTopRatedTvShowsEvent(event, emit) async {
    sessionId = await tvGetSessionIdUseCase();
    await getAllTopRatedTvShowsUseCase(
            pageNumber: topRatedTvShowsPageNumber, sessionId: sessionId)
        .then(
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
          topRatedTvShowsPageNumber++;
        },
      ),
    );
  }

  Future<void> _getAllRecommendedTvShowsEvent(event, emit) async {
    sessionId = await tvGetSessionIdUseCase();
    await getAllRecommendedTvShowsUseCase(
            pageNumber: recommendedTvShowsPageNumber,
            sessionId: sessionId,
            tvShowId: event.tvShowId)
        .then(
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
          recommendedTvShowsPageNumber++;
        },
      ),
    );
  }

  Future<void> _getAllSimilarTvShowsEvent(event, emit) async {
    sessionId = await tvGetSessionIdUseCase();
    await getAllSimilarTvShowsUseCase(
            pageNumber: similarTvShowsPageNumber,
            sessionId: sessionId,
            tvShowId: event.tvShowId)
        .then(
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
          similarTvShowsPageNumber++;
        },
      ),
    );
  }

  Future<void> _addOrRemoveFromWatchListEventEvent(event, emit) async {
    final result = await addOrRemoveTvFromWatchListUseCase(
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
      (tvShowStatesUpdated) {
        emit(
          state.copyWith(
            seeAllTvShows: List.from(
              state.seeAllTvShows.map((tvShow) => tvShow.id == event.id
                  ? tvShow.copyWith(accountStates: tvShowStatesUpdated)
                  : tvShow),
            ),
          ),
        );
      },
    );
  }

  Future<void> _checkForTvShowStatesEvent(event, emit) async {
    final result = await getTvShowStateUseCase(
        tvShowId: event.tvShowId, sessionId: sessionId);
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
              state.seeAllTvShows.map((tvShow) => tvShow.id == event.id
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
        .map((tvShowId) =>
            getTvShowStateUseCase(tvShowId: tvShowId, sessionId: sessionId))
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
