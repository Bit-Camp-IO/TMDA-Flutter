import 'dart:async';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:tmda/core/util/enums.dart';
import 'package:tmda/features/tv/domain/entities/season_episode.dart';
import 'package:tmda/features/tv/domain/entities/tv_show_account_states.dart';
import 'package:tmda/features/tv/domain/entities/tv_show_details.dart';
import 'package:tmda/features/tv/domain/entities/tv_show_network.dart';
import 'package:tmda/features/tv/domain/entities/tv_show_production_country.dart';
import 'package:tmda/features/tv/domain/entities/tv_show_video.dart';
import 'package:tmda/features/tv/domain/usecases/get_tv_show_states_usecase.dart';
import 'package:tmda/features/tv/domain/usecases/add_or_remove_tv_from_watchlist_usecase.dart';
import 'package:tmda/features/tv/domain/usecases/tv_show_details/get_season_episodes_usecase.dart';
import 'package:tmda/features/tv/domain/usecases/tv_show_details/play_tv_show_video_usecase.dart';
import 'package:tmda/features/tv/domain/usecases/tv_get_session_key_usecase.dart';
import 'package:tmda/features/tv/domain/usecases/tv_show_details/get_tv_show_details_usecase.dart';

part 'tv_show_details_event.dart';

part 'tv_show_details_state.dart';

@injectable
class TvShowDetailsBloc extends Bloc<TvDetailsEvent, TvShowDetailsState> {
  final GetTvShowDetailsUseCase _getTvShowDetailsUseCase;
  final TvGetSessionIdUseCase _getSessionIdUseCase;
  final GetSeasonsEpisodesUseCase _getSeasonsEpisodesUseCase;
  final AddOrRemoveTvFromWatchListUseCase _addOrRemoveTvFromWatchListUseCase;
  final PlayTvShowVideoUseCase _playTvShowVideoUseCase;
  final GetTvShowStateUseCase _getTvShowStateUseCase;
  late String sessionId;
  int similarTvShowsPageNumber = 1;
  int recommendedTvShowsPageNumber = 1;

  TvShowDetailsBloc(
    this._getTvShowDetailsUseCase,
    this._getSessionIdUseCase,
    this._getSeasonsEpisodesUseCase,
    this._addOrRemoveTvFromWatchListUseCase,
    this._playTvShowVideoUseCase,
    this._getTvShowStateUseCase,
  ) : super(const TvShowDetailsState()) {
    on<GetTvShowDetailsEvent>(_getTvShowDetailsEvent);
    on<GetTvShowStatesEvent>(_getTvShowStatesEvent);
    on<GetSeasonEpisodesEvent>(_getSeasonEpisodesEvent);
    on<AddOrRemoveTvFromWatchListEvent>(_addOrRemoveTvFromWatchListEvent);
    on<PlayTvShowVideoEvent>(_playTvShowVideoEvent);
    on<ChangeBodyTabsIndexEvent>(_changeBodyTabsIndexEvent);
    on<ChangeSeasonsTabsIndexEvent>(_changeSeasonsTabsIndexEvent);
    on<OnScrollAnimationEvent>(_onScrollAnimationEvent,
        transformer: droppable());
  }

  Future<void> _getTvShowDetailsEvent(event, emit) async {
    sessionId = await _getSessionIdUseCase();
    await _getTvShowDetailsUseCase(event.tvShowId, sessionId).then(
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
        },
      ),
    );
  }

  Future<void> _getTvShowStatesEvent(event, emit) async {
    sessionId = await _getSessionIdUseCase();
    await _getTvShowStateUseCase(tvShowId: event.tvShowId, sessionId: sessionId)
        .then(
      (value) => value.fold(
        (tvShowDetailsLoadFail) => emit(
          state.copyWith(
            tvShowDetailsState: BlocState.failure,
            tvShowDetailsFailMessage: tvShowDetailsLoadFail.message,
          ),
        ),
        (updatedTvShowStates) {
          emit(
            state.copyWith(
              tvShowDetailsState: BlocState.success,
              tvShowDetails:
                  state.tvShowDetails.copyWith(status: updatedTvShowStates),
            ),
          );
        },
      ),
    );
  }

  Future<void> _getSeasonEpisodesEvent(event, emit) async {
    final seasonsNumbers =
        state.tvShowDetails.seasons.map((season) => season.number).toList();
    final results = await _getSeasonsEpisodesUseCase(
      tvShowId: event.tvShowId,
      seasonsNumbers: seasonsNumbers,
    );
    results.fold(
      (getSeasonEpisodesLoadFail) => emit(
        state.copyWith(
          seasonEpisodesState: BlocState.failure,
          seasonEpisodesFailMessage: getSeasonEpisodesLoadFail.message,
        ),
      ),
      (seasonEpisodes) => emit(
        state.copyWith(
          allSeasonsEpisodes: seasonEpisodes,
          seasonEpisodesState: BlocState.success,
        ),
      ),
    );
  }

  Future<void> _addOrRemoveTvFromWatchListEvent(event, emit) async {
    await _addOrRemoveTvFromWatchListUseCase(
      isInWatchList: event.isInWatchList,
      tvShowId: event.tvShowId,
      sessionId: sessionId,
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
    await _playTvShowVideoUseCase(youtubeVideoKey: event.videoKey);
  }

  void _changeBodyTabsIndexEvent(event, emit) {
    emit(state.copyWith(bodyTabIndex: event.bodyTabIndex));
  }

  void _changeSeasonsTabsIndexEvent(event, emit) {
    emit(state.copyWith(seasonsTabIndex: event.seasonsTabIndex));
  }
}
