import 'dart:async';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:tmda/core/util/enums.dart';
import 'package:tmda/features/tv/domain/entities/tv_show_details.dart';
import 'package:tmda/features/tv/domain/usecases/get_tv_show_states_usecase.dart';
import 'package:tmda/features/tv/domain/usecases/add_or_remove_tv_from_watchlist_usecase.dart';
import 'package:tmda/features/tv/domain/usecases/tv_show_details/play_tv_show_video_usecase.dart';
import 'package:tmda/features/tv/domain/usecases/tv_get_session_key_usecase.dart';
import 'package:tmda/features/tv/domain/usecases/tv_show_details/get_tv_show_details_usecase.dart';

part 'tv_show_details_event.dart';

part 'tv_show_details_state.dart';

@injectable
class TvShowDetailsBloc extends Bloc<TvDetailsEvent, TvShowDetailsState> {
  final GetTvShowDetailsUseCase _getTvShowDetailsUseCase;
  final TvGetSessionIdUseCase _getSessionIdUseCase;
  final AddOrRemoveTvFromWatchListUseCase _addOrRemoveTvFromWatchListUseCase;
  final PlayTvShowVideoUseCase _playTvShowVideoUseCase;
  final GetTvShowStateUseCase _getTvShowStateUseCase;
  late String sessionId;
  int similarTvShowsPageNumber = 1;
  int recommendedTvShowsPageNumber = 1;

  TvShowDetailsBloc(
    this._getTvShowDetailsUseCase,
    this._getSessionIdUseCase,
    this._addOrRemoveTvFromWatchListUseCase,
    this._playTvShowVideoUseCase,
    this._getTvShowStateUseCase,
  ) : super(const TvShowDetailsState()) {
    on<GetTvShowDetailsEvent>(_getTvShowDetailsEvent);
    on<GetTvShowStatesEvent>(_getTvShowStatesEvent);
    on<AddOrRemoveTvFromWatchListEvent>(_addOrRemoveTvFromWatchListEvent);
    on<PlayTvShowVideoEvent>(_playTvShowVideoEvent);
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

}
