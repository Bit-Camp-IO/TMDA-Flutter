import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:tmda/core/util/enums.dart';
import 'package:tmda/features/movie/domain/entities/movie_account_states.dart';
import 'package:tmda/features/movie/domain/entities/movie_details.dart';
import 'package:tmda/features/movie/domain/entities/movie_production_countries.dart';
import 'package:tmda/features/movie/domain/entities/movie_video.dart';
import 'package:tmda/features/movie/domain/usecases/movie_details/add_or_remove_movie_from_watch_list_usecase.dart';
import 'package:tmda/features/movie/domain/usecases/movie_details/get_movie_details_usecase.dart';
import 'package:tmda/features/movie/domain/usecases/movie_details/get_session_id_usecase.dart';
import 'package:tmda/features/movie/domain/usecases/movie_details/play_movie_video_usecase.dart';

part 'movie_details_event.dart';
part 'movie_details_state.dart';

@injectable
class MovieDetailsBloc extends Bloc<MovieDetailsEvent, MovieDetailsState> {
  final GetMovieDetailsUseCase getMovieDetailsUseCase;
  final GetSessionIdUseCase getSessionIdUseCase;
  final PlayMovieVideoUseCase playMovieTrailerUseCase;
  final AddOrRemoveMovieFromWatchListUseCase addOrRemoveFromWatchListUseCase;
  late String userSessionId;

  MovieDetailsBloc({
    required this.getMovieDetailsUseCase,
    required this.getSessionIdUseCase,
    required this.playMovieTrailerUseCase,
    required this.addOrRemoveFromWatchListUseCase,
  }) : super(const MovieDetailsState()) {
    on<GetMovieDetailsEvent>(_getMovieDetailsEvent);
    on<PlayMovieTrailerEvent>(_playMovieTrailerEvent);
    on<AddOrRemoveFromWatchListEvent>(_addOrRemoveFromWatchListEvent);
    on<OnScrollAnimationEvent>(_onScrollAnimationEvent);
  }

  Future<void> _getMovieDetailsEvent(event, emit) async {
    userSessionId = await getSessionIdUseCase();
    final movieDetails = await getMovieDetailsUseCase(
      movieId: event.movieId,
      sessionId: userSessionId,
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

  Future<void> _playMovieTrailerEvent(event, emit) async {
    await playMovieTrailerUseCase(event.movieVideoKey);
  }


  Future<void> _addOrRemoveFromWatchListEvent(event, emit) async {
    final result = await addOrRemoveFromWatchListUseCase(
      isInWatchList: event.isInWatchList,
      movieId: event.movieId,
      sessionId: userSessionId,
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

  void _onScrollAnimationEvent(event, emit) {
    emit(
      state.copyWith(
        animatedContainerHeight: event.animatedContainerHeight,
        animatedPosterHeight: event.animatedPosterHeight,
      ),
    );
  }
}
