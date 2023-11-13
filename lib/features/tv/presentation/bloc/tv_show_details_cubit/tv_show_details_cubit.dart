import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:tmda/core/util/enums.dart';
import 'package:tmda/features/tv/domain/entities/tv_show_details.dart';
import 'package:tmda/features/tv/domain/usecases/play_tv_show_video_usecase.dart';
import 'package:tmda/features/tv/domain/usecases/get_tv_show_details_usecase.dart';

part 'tv_show_details_state.dart';

@injectable
class TvShowDetailsCubit extends Cubit<TvShowDetailsState> {
  final GetTvShowDetailsUseCase _getTvShowDetailsUseCase;
  final PlayTvShowVideoUseCase _playTvShowVideoUseCase;
  int similarTvShowsPageNumber = 1;
  int recommendedTvShowsPageNumber = 1;

  TvShowDetailsCubit(
    this._getTvShowDetailsUseCase,
    this._playTvShowVideoUseCase,
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

  Future<void> playTvShowVideo() async {
    await _playTvShowVideoUseCase(
        youtubeVideoKey: state.tvShowDetails.tvShowVideo.key);
  }
}
