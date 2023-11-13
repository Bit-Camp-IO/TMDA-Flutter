import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:tmda/core/util/enums.dart';
import 'package:tmda/features/shared/domain/entities/tv_show.dart';
import 'package:tmda/features/tv/domain/usecases/get_popular_tv_shows.dart';
import 'package:tmda/features/tv/domain/usecases/get_top_rated_tv_shows.dart';
import 'package:tmda/features/tv/domain/usecases/get_tv_shows_airing_this_week_usecase.dart';
import 'package:tmda/features/tv/domain/usecases/get_tv_shows_airing_today.dart';

part 'tv_show_state.dart';

@injectable
class TvShowsCubit extends Cubit<TvShowsState> {
  final GetTvShowsAiringTodayUseCase _getTvShowsAiringTodayUseCase;
  final GetTvShowsAiringThisWeekUseCase _getTvShowsAiringThisWeekUseCase;
  final GetPopularTvShowsUseCase _getPopularTvShowsUseCase;
  final GetTopRatedTvShowsUseCase _getTopRatedTvShowsUseCase;
  int airingThisWeekPage = 2;
  int airingTodayPage = 1;
  int popularTvShowsPage = 2;
  int topRatedTvShowPage = 1;

  TvShowsCubit(
    this._getTvShowsAiringTodayUseCase,
    this._getTvShowsAiringThisWeekUseCase,
    this._getPopularTvShowsUseCase,
    this._getTopRatedTvShowsUseCase,
  ) : super(const TvShowsState());

  Future<void> getAiringTodayTvShows() async {
    final result = await _getTvShowsAiringTodayUseCase(airingTodayPage);
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

  Future<void> getTvShowsAiringThisWeek() async {
    final result = await _getTvShowsAiringThisWeekUseCase(airingThisWeekPage);
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

  Future<void> getPopularTvShows() async {
    final result = await _getPopularTvShowsUseCase(popularTvShowsPage);
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

  Future<void> getTopRatedTvShows() async {
    final result = await _getTopRatedTvShowsUseCase(topRatedTvShowPage);
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
