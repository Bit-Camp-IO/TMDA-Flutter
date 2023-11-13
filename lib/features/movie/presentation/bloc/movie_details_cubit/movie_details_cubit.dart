import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:tmda/core/util/enums.dart';
import 'package:tmda/features/movie/domain/entities/movie_details.dart';
import 'package:tmda/features/movie/domain/usecases/get_movie_details_usecase.dart';
import 'package:tmda/features/movie/domain/usecases/play_movie_video_usecase.dart';

part 'movie_details_state.dart';

@injectable
class MovieDetailsCubit extends Cubit<MovieDetailsState> {
  final GetMovieDetailsUseCase _getMovieDetailsUseCase;
  final PlayMovieVideoUseCase _playMovieTrailerUseCase;

  MovieDetailsCubit(
    this._getMovieDetailsUseCase,
    this._playMovieTrailerUseCase,
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

  Future<void> playMovieTrailer() async {
    await _playMovieTrailerUseCase(state.movieDetails.video.key);
  }
}
