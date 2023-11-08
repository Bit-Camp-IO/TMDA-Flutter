import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:tmda/core/util/enums.dart';
import 'package:tmda/features/tv/domain/entities/tv_show_details.dart';
import 'package:tmda/features/tv/domain/usecases/get_tv_show_states_usecase.dart';
import 'package:tmda/features/tv/domain/usecases/add_or_remove_tv_from_watchlist_usecase.dart';
import 'package:tmda/features/tv/domain/usecases/tv_show_details/play_tv_show_video_usecase.dart';
import 'package:tmda/features/tv/domain/usecases/tv_show_details/get_tv_show_details_usecase.dart';

part 'tv_show_details_state.dart';

@injectable
class TvShowDetailsCubit extends Cubit<TvShowDetailsState> {
  final GetTvShowDetailsUseCase _getTvShowDetailsUseCase;
  final AddOrRemoveTvFromWatchListUseCase _addOrRemoveTvFromWatchListUseCase;
  final PlayTvShowVideoUseCase _playTvShowVideoUseCase;
  final GetTvShowStateUseCase _getTvShowStateUseCase;
  int similarTvShowsPageNumber = 1;
  int recommendedTvShowsPageNumber = 1;

  TvShowDetailsCubit(
    this._getTvShowDetailsUseCase,
    this._addOrRemoveTvFromWatchListUseCase,
    this._playTvShowVideoUseCase,
    this._getTvShowStateUseCase,
  ) : super(const TvShowDetailsState());

  Future<void> getTvShowDetails({required int tvShowId}) async {
    await _getTvShowDetailsUseCase(
      tvShowId,
    ).then(
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

  Future<void> getTvShowStates({required int tvShowId}) async {
    await _getTvShowStateUseCase(
      tvShowId: tvShowId,
    ).then(
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

  Future<void> addOrRemoveTvFromWatchList({required bool isInWatchList, required int tvShowId}) async {
    await _addOrRemoveTvFromWatchListUseCase(
      isInWatchList: isInWatchList,
      tvShowId: tvShowId,
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

  Future<void> playTvShowVideo() async {
    await _playTvShowVideoUseCase(
        youtubeVideoKey: state.tvShowDetails.tvShowVideo.key);
  }
}
