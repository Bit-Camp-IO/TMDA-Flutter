import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:tmda/core/util/enums.dart';
import 'package:tmda/features/movie/domain/entities/movie_details.dart';
import 'package:tmda/features/movie/domain/usecases/add_or_remove_movie_from_watch_list_usecase.dart';
import 'package:tmda/features/movie/domain/usecases/movie_details/get_movie_details_usecase.dart';
import 'package:tmda/features/movie/domain/usecases/movie_details/play_movie_video_usecase.dart';
import 'package:tmda/features/movie/domain/usecases/get_movie_states_usecase.dart';

part 'movie_details_state.dart';

@injectable
class MovieDetailsCubit extends Cubit<MovieDetailsState> {
  final GetMovieDetailsUseCase _getMovieDetailsUseCase;
  final PlayMovieVideoUseCase _playMovieTrailerUseCase;
  final AddOrRemoveMovieFromWatchListUseCase _addOrRemoveFromWatchListUseCase;
  final GetMovieStateUseCase _getMovieStateUseCase;

  MovieDetailsCubit(
    this._getMovieDetailsUseCase,
    this._playMovieTrailerUseCase,
    this._addOrRemoveFromWatchListUseCase,
    this._getMovieStateUseCase,
  ) : super(const MovieDetailsState());

  Future<void> getMovieDetails({required int movieId}) async {
    final movieDetails = await _getMovieDetailsUseCase(
      movieId: movieId,
    );
    movieDetails.fold(
      (loadMovieDetailsFail) => emit(
        state.copyWith(
          movieDetailsState: BlocState.failure,
          movieDetailsFailMessage: loadMovieDetailsFail.message,
        ),
      ),
      (movieDetailsLoaded) {
        emit(
          state.copyWith(
            movieDetailsState: BlocState.success,
            movieDetails: movieDetailsLoaded,
          ),
        );
      },
    );
  }

  Future<void> getMovieStates({required int movieId}) async {
    final movieDetails = await _getMovieStateUseCase(
      movieId: movieId,
    );
    movieDetails.fold(
      (loadMovieDetailsFail) => emit(
        state.copyWith(
          movieDetailsState: BlocState.failure,
          movieDetailsFailMessage: loadMovieDetailsFail.message,
        ),
      ),
      (currentMovieState) {
        emit(
          state.copyWith(
            movieDetailsState: BlocState.success,
            movieDetails: state.movieDetails.copyWith(accountStates: currentMovieState),
          ),
        );
      },
    );
  }

  Future<void> playMovieTrailer() async {
    await _playMovieTrailerUseCase(state.movieDetails.video.key);
  }

  Future<void> addOrRemoveFromWatchList({required bool isInWatchList, required int movieId}) async {
    final result = await _addOrRemoveFromWatchListUseCase(
      isInWatchList: isInWatchList,
      movieId: movieId,
    );
    result.fold(
      (watchListFailure) => emit(
        state.copyWith(
          addOrRemoveFromWatchListFailMessage: watchListFailure.message,
        ),
      ),
      (accountStatesUpdated) => emit(
        state.copyWith(
          movieDetails:
              state.movieDetails.copyWith(accountStates: accountStatesUpdated),
        ),
      ),
    );
  }
}
