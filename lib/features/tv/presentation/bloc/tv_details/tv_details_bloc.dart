import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:tmda/core/util/enums.dart';
import 'package:tmda/features/tv/domain/entities/tv_details/season_episode.dart';
import 'package:tmda/features/tv/domain/entities/tv_details/tv_show_account_status.dart';
import 'package:tmda/features/tv/domain/entities/tv_details/tv_show_details.dart';
import 'package:tmda/features/tv/domain/entities/tv_details/tv_show_network.dart';
import 'package:tmda/features/tv/domain/entities/tv_details/tv_show_production_country.dart';
import 'package:tmda/features/tv/domain/entities/tv_details/tv_show_seasons.dart';
import 'package:tmda/features/tv/domain/entities/tv_details/tv_show_video.dart';
import 'package:tmda/features/tv/domain/usecases/tv_details/add_or_remove_tv_from_watchlist_usecase.dart';
import 'package:tmda/features/tv/domain/usecases/tv_details/get_episode_video_usecase.dart';
import 'package:tmda/features/tv/domain/usecases/tv_details/get_recommended_tv_shows_usecase.dart';
import 'package:tmda/features/tv/domain/usecases/tv_details/get_season_episodes_usecase.dart';
import 'package:tmda/features/tv/domain/usecases/tv_details/play_tv_show_video_usecase.dart';
import 'package:tmda/features/tv/domain/usecases/tv_details/tv_get_session_key_usecase.dart';
import 'package:tmda/features/tv/domain/usecases/tv_details/get_similar_tv_shows_usecase.dart';
import 'package:tmda/features/tv/domain/usecases/tv_details/get_tv_show_details_usecase.dart';
part 'tv_details_event.dart';
part 'tv_details_state.dart';

@injectable
class TvDetailsBloc extends Bloc<TvDetailsEvent, TvDetailsState> {
  final GetTvShowDetailsUseCase getTvShowDetailsUseCase;
  final GetSimilarTvShowsUseCase getSimilarTvShowsUseCase;
  final GetRecommendedTvShowsUseCase getRecommendedTvShowsUseCase;
  final TvGetSessionKeyUseCase getSessionKeyUseCase;
  final GetSeasonsEpisodesUseCase getSeasonsEpisodesUseCase;
  final AddOrRemoveTvFromWatchListUseCase addOrRemoveTvFromWatchListUseCase;
  final PlayTvShowVideoUseCase playTvShowVideoUseCase;
  final GetEpisodeVideoUseCase getEpisodeVideoUseCase;
  late String sessionKey;
  int similarTvShowsPageNumber = 1;
  int recommendedTvShowsPageNumber = 1;
  TvDetailsBloc({
    required this.getTvShowDetailsUseCase,
    required this.getSimilarTvShowsUseCase,
    required this.getRecommendedTvShowsUseCase,
    required this.getSeasonsEpisodesUseCase,
    required this.getSessionKeyUseCase,
    required this.addOrRemoveTvFromWatchListUseCase,
    required this.playTvShowVideoUseCase,
    required this.getEpisodeVideoUseCase,
  }) : super(const TvDetailsState()) {
    on<GetTvShowDetailsEvent>(_getTvShowDetailsEvent);
    on<GetSeasonEpisodesEvent>(_getSeasonEpisodesEvent);
    on<AddOrRemoveTvFromWatchListEvent>(_addOrRemoveTvFromWatchListEvent);
    on<GetMoreSimilarTvShowsEvent>(
      _getMoreSimilarTvShowsEvent,
      transformer: droppable(),
    );
    on<GetMoreRecommendedTvShowsEvent>(
      _getMoreRecommendedTvShowsEvent,
      transformer: droppable(),
    );
    on<PlayTvShowVideoEvent>(_playTvShowVideoEvent);
    on<ChangeBodyTabsIndexEvent>(_changeBodyTabsIndexEvent);
    on<ChangeSeasonsTabsIndexEvent>(_changeSeasonsTabsIndexEvent);
    on<OnScrollAnimationEvent>(_onScrollAnimationEvent);
  }

  Future<void> _getTvShowDetailsEvent(event, emit) async {
    sessionKey = await getSessionKeyUseCase();
    await getTvShowDetailsUseCase(event.tvShowId, sessionKey).then(
      (value) => value.fold(
        (tvShowDetailsLoadFail) => emit(
          state.copyWith(
            tvShowDetailsState: BlocState.failure,
            tvShowDetailsFailMessage: tvShowDetailsLoadFail.message,
          ),
        ),
        (tvShowDetails) {
          emit(
            state.copyWith(
              tvShowDetailsState: BlocState.success,
              tvShowDetails: tvShowDetails,
            ),
          );
          similarTvShowsPageNumber++;
          recommendedTvShowsPageNumber++;
        },
      ),
    );
  }

  Future<void> _getMoreSimilarTvShowsEvent(event, emit) async {
    final result = await getSimilarTvShowsUseCase(
      tvShowId: event.tvShowId,
      pageNumber: similarTvShowsPageNumber,
    );
    result.fold(
      (loadSimilarTvShowsFail) => emit(
        state.copyWith(
          getSimilarTvShowsFailMessage: loadSimilarTvShowsFail.message,
        ),
      ),
      (moreSimilarTvShows) {
        moreSimilarTvShows.isEmpty
            ? emit(
                state.copyWith(
                  hasSimilarTvShowsListReachedMax: true,
                ),
              )
            : emit(
                state.copyWith(
                  tvShowDetails: state.tvShowDetails.copyWith(
                    similarTvShows: List.of(state.tvShowDetails.similarTvShows)
                      ..addAll(moreSimilarTvShows),
                  ),
                  hasSimilarTvShowsListReachedMax: false,
                ),
              );
        similarTvShowsPageNumber++;
      },
    );
  }

  Future<void> _getMoreRecommendedTvShowsEvent(event, emit) async {
    debugPrint('>>>>>>>>>>>>> This Event Executed <<<<<<<<<<<<<');
    final result = await getRecommendedTvShowsUseCase(
      tvShowId: event.tvShowId,
      pageNumber: similarTvShowsPageNumber,
    );
    result.fold(
      (loadRecommendedTvShowsThisFail) => emit(
        state.copyWith(
          getRecommendedTvShowsFailMessage:
              loadRecommendedTvShowsThisFail.message,
        ),
      ),
      (moreRecommendedTvShows) {
        moreRecommendedTvShows.isEmpty
            ? emit(
                state.copyWith(
                  hasRecommendedTvShowsListReachedMax: true,
                ),
              )
            : emit(
                state.copyWith(
                  tvShowDetails: state.tvShowDetails.copyWith(
                    recommendedTvShows:
                        List.of(state.tvShowDetails.similarTvShows)
                          ..addAll(moreRecommendedTvShows),
                  ),
                  hasRecommendedTvShowsListReachedMax: false,
                ),
              );
        recommendedTvShowsPageNumber++;
      },
    );
  }

  Future<void> _getSeasonEpisodesEvent(event, emit) async {
    for (TvShowSeasons season in state.tvShowDetails.seasons) {
      await getSeasonsEpisodesUseCase(
        seasonNumber: season.seasonNumber,
        tvShowId: event.tvShowId,
      ).then(
        (value) => value.fold(
          (getSeasonEpisodesLoadFail) => emit(
            state.copyWith(
              seasonEpisodesState: BlocState.failure,
              seasonEpisodesFailMessage: getSeasonEpisodesLoadFail.message,
            ),
          ),
          (seasonEpisodes) => emit(
            state.copyWith(
              allSeasonsEpisodes: List.of(state.allSeasonsEpisodes)
                ..add(seasonEpisodes),
              seasonEpisodesState: BlocState.success,
            ),
          ),
        ),
      );
    }
  }

  Future<void> _addOrRemoveTvFromWatchListEvent(event, emit) async {
    await addOrRemoveTvFromWatchListUseCase(
      isInWatchList: event.isInWatchList,
      tvShowId: event.tvShowId,
      sessionId: sessionKey,
    ).then(
      (value) => value.fold(
        (l) => emit(
          state.copyWith(
            addOrRemoveFromWatchListFailMessage: l.message,
          ),
        ),
        (addedToWatchList) => emit(
          state.copyWith(
            tvShowDetails: state.tvShowDetails.copyWith(
              status: addedToWatchList,
            ),
          ),
        ),
      ),
    );
  }
  void _onScrollAnimationEvent(event, emit) {
    emit(
      state.copyWith(
        animatedHeight: event.animatedHeight,
      ),
    );
  }

  Future<void> _playTvShowVideoEvent(event, emit) async {
    await playTvShowVideoUseCase(youtubeVideoKey: event.videoKey);
  }
  void _changeBodyTabsIndexEvent(event, emit){
    emit(state.copyWith(bodyTabIndex: event.bodyTabIndex));
  }
  void _changeSeasonsTabsIndexEvent(event, emit){
    emit(state.copyWith(seasonsTabIndex: event.seasonsTabIndex));
  }

}
