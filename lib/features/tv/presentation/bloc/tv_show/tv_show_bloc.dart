import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:tmda/core/util/enums.dart';
import 'package:tmda/features/tv/domain/entities/tv_show/tv_show.dart';
import 'package:tmda/features/tv/domain/usecases/tv/get_popular_tv_shows.dart';
import 'package:tmda/features/tv/domain/usecases/tv/get_top_rated_tv_shows.dart';
import 'package:tmda/features/tv/domain/usecases/tv/get_tv_shows_airing_this_week_usecase.dart';
import 'package:tmda/features/tv/domain/usecases/tv/get_tv_shows_airing_today.dart';

part 'tv_show_event.dart';

part 'tv_show_state.dart';

@injectable
class TvShowsBloc extends Bloc<TvShowsEvent, TvShowsState> {
  final GetTvShowsAiringTodayUseCase getTvShowsAiringTodayUseCase;
  final GetTvShowsAiringThisWeekUseCase getTvShowsAiringThisWeekUseCase;
  final GetPopularTvShowsUseCase getPopularTvShowsUseCase;
  final GetTopRatedTvShowsUseCase getTopRatedTvShowsUseCase;
  int airingThisWeekPage = 2;
  int airingTodayPage = 2;
  int popularTvShowsPage = 3;
  int topRatedTvShowPage = 1;


  TvShowsBloc({
    required this.getTvShowsAiringTodayUseCase,
    required this.getTvShowsAiringThisWeekUseCase,
    required this.getPopularTvShowsUseCase,
    required this.getTopRatedTvShowsUseCase,
  }) : super(const TvShowsState()) {
    on<GetTvShowsAiringTodayEvent>(_airingTodayTvShowsEvent);
    on<GetTvShowsAiringThisWeekEvent>(
      _getTvShowsAiringThisWeekEvent,
      transformer: droppable(),
    );
    on<GetPopularTvShowsEvent>(
      _getPopularTvShowsEvent,
      transformer: droppable(),
    );
    on<GetTopRatedTvShowsEvent>(
      _topRatedTvShowsEvent,
      transformer: droppable(),
    );
  }

  Future<void> _airingTodayTvShowsEvent(event, emit) async {
    final result = await getTvShowsAiringTodayUseCase(airingTodayPage);
    result.fold(
      (airingTodayFail) => emit(
        state.copyWith(
          airingTodayFailMessage: airingTodayFail.message,
          airingTodayState: BlocState.failure,
        ),
      ),
      (airingTodayList) => emit(
        state.copyWith(
          airingTodayState: BlocState.success,
          airingTodayTvShows: airingTodayList,
        ),
      ),
    );
  }

  Future<void> _getTvShowsAiringThisWeekEvent(event, emit) async {
    final result =
        await getTvShowsAiringThisWeekUseCase(airingThisWeekPage);
    result.fold(
      (airingThisWeekFail) => emit(
        state.copyWith(
          airingThisWeekFailMessage: airingThisWeekFail.message,
          airingThisWeekState: BlocState.failure,
        ),
      ),
      (airingThisWeekList) {
        airingThisWeekList.isEmpty
            ? emit(
                state.copyWith(
                  airingThisWeekState: BlocState.success,
                  hasAiringThisWeekListReachedMax: true,
                ),
              )
            : emit(
                state.copyWith(
                  airingThisWeekState: BlocState.success,
                  hasAiringThisWeekListReachedMax: false,
                  airingThisWeekTvShows: List.of(state.airingThisWeekTvShows)
                    ..addAll(airingThisWeekList.reversed),
                ),
              );
        airingThisWeekPage++;
      },
    );
  }

  Future<void> _getPopularTvShowsEvent(event, emit) async {
    final result = await getPopularTvShowsUseCase(popularTvShowsPage);
    result.fold(
      (popularTvShowsFail) => emit(
        state.copyWith(
          popularTvShowsFailMessage: popularTvShowsFail.message,
          popularTvShowsState: BlocState.failure,
        ),
      ),
      (popularTvShowsList) {
        popularTvShowsList.isEmpty
            ? emit(
                state.copyWith(
                  popularTvShowsState: BlocState.success,
                  hasPopularListReachedMax: true,
                ),
              )
            : emit(
                state.copyWith(
                  popularTvShowsState: BlocState.success,
                  hasPopularListReachedMax: false,
                  popularTvShows: List.of(state.popularTvShows)
                    ..addAll(popularTvShowsList),
                ),
              );
        popularTvShowsPage++;
      },
    );
  }

  Future<void> _topRatedTvShowsEvent(event, emit) async {
    final result = await getTopRatedTvShowsUseCase(topRatedTvShowPage);
    result.fold(
      (topRatedTvShowsFail) => emit(
        state.copyWith(
          topRatedFailMessage: topRatedTvShowsFail.message,
          topRatedState: BlocState.failure,
        ),
      ),
      (topRatedTvShowsList) {
        topRatedTvShowsList.isEmpty
            ? emit(
                state.copyWith(
                  hasTopRatedListReachedMax: true,
                  topRatedState: BlocState.success,
                ),
              )
            : emit(
                state.copyWith(
                  topRatedTvShows: List.of(state.topRatedTvShows)
                    ..addAll(topRatedTvShowsList),
                  topRatedState: BlocState.success,
                  hasTopRatedListReachedMax: false,
                ),
              );
        topRatedTvShowPage++;
      },
    );
  }
}
