import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:tmda/core/util/enums.dart';
import 'package:tmda/features/shared/domain/entities/tv_show.dart';
import 'package:tmda/features/tv/domain/usecases/get_recommended_tv_shows_usecase.dart';
import 'package:tmda/features/tv/domain/usecases/get_similar_tv_shows_usecase.dart';
import 'package:tmda/features/tv/domain/usecases/get_popular_tv_shows.dart';
import 'package:tmda/features/tv/domain/usecases/get_top_rated_tv_shows.dart';
import 'package:tmda/features/tv/domain/usecases/get_tv_shows_airing_today.dart';

part 'see_all_tv_shows_event.dart';

part 'see_all_tv_shows_state.dart';

@injectable
class SeeAllTvShowsBloc extends Bloc<SeeAllTvShowsEvent, SeeAllTvShowsState> {
  final GetTvShowsAiringTodayUseCase _getTvShowsAiringTodayUseCase;
  final GetPopularTvShowsUseCase _getPopularTvShowsUseCase;
  final GetTopRatedTvShowsUseCase _getTopRatedTvShowsUseCase;
  final GetRecommendedTvShowsUseCase _getRecommendedTvShowsUseCase;
  final GetSimilarTvShowsUseCase _getSimilarTvShowsUseCase;

  int _airingTodayTvShowsPageNumber = 1;
  int _popularTvShowsPageNumber = 2;
  int _topRatedTvShowsPageNumber = 1;
  int _recommendedTvShowsPageNumber = 1;
  int _similarTvShowsPageNumber = 1;

  SeeAllTvShowsBloc(
    this._getRecommendedTvShowsUseCase,
    this._getSimilarTvShowsUseCase,
    this._getTvShowsAiringTodayUseCase,
    this._getPopularTvShowsUseCase,
    this._getTopRatedTvShowsUseCase,
  ) : super(const SeeAllTvShowsState()) {
    on<GetAllAiringTodayTvShowsEvent>(_getAllAiringTodayTvShowsEvent, transformer: droppable());
    on<GetAllPopularTvShowsEvent>(_getAllPopularTvShowsEvent, transformer: droppable());
    on<GetAllTopRatedTvShowsEvent>(_getAllTopRatedTvShowsEvent, transformer: droppable());
    on<GetAllRecommendedTvShowsEvent>(_getAllRecommendedTvShowsEvent, transformer: droppable());
    on<GetAllSimilarTvShowsEvent>(_getAllSimilarTvShowsEvent, transformer: droppable());
  }

  Future<void> _getAllAiringTodayTvShowsEvent(event, emit) async {
    if (state.hasSeeAllTvShowsListReachedMax == false) {
      await _getTvShowsAiringTodayUseCase(_airingTodayTvShowsPageNumber,
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
      await _getPopularTvShowsUseCase(
        _popularTvShowsPageNumber,
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
      await _getTopRatedTvShowsUseCase(
        _topRatedTvShowsPageNumber,
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
      await _getRecommendedTvShowsUseCase(
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
      await _getSimilarTvShowsUseCase(
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
}
