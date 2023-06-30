import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:tmda/core/util/enums.dart';
import 'package:tmda/features/tv/domain/entities/tv_show.dart';
import 'package:tmda/features/tv/domain/usecases/tv_shows/get_popular_tv_shows.dart';
import 'package:tmda/features/tv/domain/usecases/tv_shows/get_top_rated_tv_shows.dart';
import 'package:tmda/features/tv/domain/usecases/tv_shows/get_tv_shows_airing_this_week_usecase.dart';
import 'package:tmda/features/tv/domain/usecases/tv_shows/get_tv_shows_airing_today.dart';

part 'tv_show_event.dart';

part 'tv_show_state.dart';

@injectable
class TvShowsBloc extends Bloc<TvShowsEvent, TvShowsState> {
  final GetTvShowsAiringTodayUseCase getTvShowsAiringTodayUseCase;
  final GetTvShowsAiringThisWeekUseCase getTvShowsAiringThisWeekUseCase;
  final GetPopularTvShowsUseCase getPopularTvShowsUseCase;
  final GetTopRatedTvShowsUseCase getTopRatedTvShowsUseCase;
  int airingThisWeekPage = 2;
  int airingTodayPage = 1;
  int popularTvShowsPage = 2;
  int topRatedTvShowPage = 1;

  TvShowsBloc({
    required this.getTvShowsAiringTodayUseCase,
    required this.getTvShowsAiringThisWeekUseCase,
    required this.getPopularTvShowsUseCase,
    required this.getTopRatedTvShowsUseCase,
  }) : super(const TvShowsState()) {
    on<GetTvShowsAiringTodayEvent>(_airingTodayTvShowsEvent);
    on<GetTvShowsAiringThisWeekEvent>(_getTvShowsAiringThisWeekEvent);
    on<GetPopularTvShowsEvent>(_getPopularTvShowsEvent);
    on<GetTopRatedTvShowsEvent>(_topRatedTvShowsEvent);
  }

  Future<void> _airingTodayTvShowsEvent(event, emit) async {
    final result = await getTvShowsAiringTodayUseCase(airingTodayPage);
    result.fold(
      (airingTodayFail) => emit(
        state.copyWith(
          tvShowsFailMessage: airingTodayFail.message,
          tvShowsState: BlocState.failure,
        ),
      ),
      (airingTodayList) => emit(
        state.copyWith(
          tvShowsState: BlocState.success,
          airingTodayTvShows: airingTodayList.reversed.toList(),
        ),
      ),
    );
  }

  Future<void> _getTvShowsAiringThisWeekEvent(event, emit) async {
    final result = await getTvShowsAiringThisWeekUseCase(airingThisWeekPage);
    result.fold(
      (airingThisWeekFail) => emit(
        state.copyWith(
          tvShowsFailMessage: airingThisWeekFail.message,
          tvShowsState: BlocState.failure,
        ),
      ),
      (airingThisWeekList) => emit(
        state.copyWith(
          tvShowsState: BlocState.success,
          airingThisWeekTvShows: List.from(airingThisWeekList),
        ),
      ),
    );
  }

  Future<void> _getPopularTvShowsEvent(event, emit) async {
    final result = await getPopularTvShowsUseCase(popularTvShowsPage);
    result.fold(
      (popularTvShowsFail) => emit(
        state.copyWith(
          tvShowsFailMessage: popularTvShowsFail.message,
          tvShowsState: BlocState.failure,
        ),
      ),
      (popularTvShowsList) => emit(
        state.copyWith(
            tvShowsState: BlocState.success,
            popularTvShows: List.from(popularTvShowsList.reversed)),
      ),
    );
  }

  Future<void> _topRatedTvShowsEvent(event, emit) async {
    final result = await getTopRatedTvShowsUseCase(topRatedTvShowPage);
    result.fold(
      (topRatedTvShowsFail) => emit(
        state.copyWith(
          tvShowsFailMessage: topRatedTvShowsFail.message,
          tvShowsState: BlocState.failure,
        ),
      ),
      (topRatedTvShowsList) => emit(
        state.copyWith(
          topRatedTvShows: topRatedTvShowsList,
          tvShowsState: BlocState.success,
        ),
      ),
    );
  }
}
