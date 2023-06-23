import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:tmda/core/util/enums.dart';
import 'package:tmda/features/movie/domain/entities/movie_details/movie_account_states.dart';
import 'package:tmda/features/movie/domain/entities/movie_details/movie_details.dart';
import 'package:tmda/features/movie/domain/entities/movie_details/movie_production_countries.dart';
import 'package:tmda/features/movie/domain/entities/movie_details/movie_video.dart';
import 'package:tmda/features/movie/domain/usecases/movie_details/add_or_remove_movie_from_watch_list_usecase.dart';
import 'package:tmda/features/movie/domain/usecases/movie_details/get_movie_cast_usecase.dart';
import 'package:tmda/features/movie/domain/usecases/movie_details/get_movie_details_usecase.dart';
import 'package:tmda/features/movie/domain/usecases/movie_details/get_movie_reviews_usecase.dart';
import 'package:tmda/features/movie/domain/usecases/movie_details/get_movies_like_this_usecase.dart';
import 'package:tmda/features/movie/domain/usecases/movie_details/get_session_key_usecase.dart';
import 'package:tmda/features/movie/domain/usecases/movie_details/play_movie_video_usecase.dart';

part 'movie_details_event.dart';

part 'movie_details_state.dart';

@injectable
class MovieDetailsBloc extends Bloc<MovieDetailsEvent, MovieDetailsState> {
  final GetMovieDetailsUseCase getMovieDetailsUseCase;
  final GetSessionKeyUseCase getSessionKeyUseCase;
  final GetMovieCastUseCase getMovieCastUseCase;
  final GetMovieReviewsUseCase getMovieReviewsUseCase;
  final GetMoviesLikeThisUseCase getMoviesLikeThisUseCase;
  final PlayMovieVideoUseCase playMovieTrailerUseCase;
  final AddOrRemoveMovieFromWatchListUseCase addOrRemoveFromWatchListUseCase;
  late String userSessionKey;
  int moviesLikeThisPage = 1;

  MovieDetailsBloc({
    required this.getMovieDetailsUseCase,
    required this.getSessionKeyUseCase,
    required this.getMovieCastUseCase,
    required this.getMovieReviewsUseCase,
    required this.getMoviesLikeThisUseCase,
    required this.playMovieTrailerUseCase,
    required this.addOrRemoveFromWatchListUseCase,
  }) : super(const MovieDetailsState()) {
    on<GetMovieDetailsEvent>(_getMovieDetailsEvent);
    on<GetMoreSimilarMoviesEvent>(
      _getMoreSimilarMovies,
      transformer: droppable(),
    );
    on<PlayMovieTrailerEvent>(_playMovieTrailerEvent);
    on<AddOrRemoveFromWatchListEvent>(_addOrRemoveFromWatchListEvent);
    on<OnScrollAnimationEvent>(_onScrollAnimationEvent);
  }

  Future<void> _getMovieDetailsEvent(event, emit) async {
    userSessionKey = await getSessionKeyUseCase();
    final movieDetails = await getMovieDetailsUseCase(
      movieId: event.movieId,
      sessionId: userSessionKey,
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
        moviesLikeThisPage++;
      },
    );
  }

  Future<void> _playMovieTrailerEvent(event, emit) async {
    await playMovieTrailerUseCase(event.movieVideoKey);
  }

  Future<void> _getMoreSimilarMovies(event, emit) async {
    final result = await getMoviesLikeThisUseCase(
      movieId: event.movieId,
      pageNumber: moviesLikeThisPage,
    );
    result.fold(
      (loadMoviesLikeThisFail) => emit(
        state.copyWith(
          getMoreMoviesLikeThisFailMessage: loadMoviesLikeThisFail.message,
        ),
      ),
      (moviesLikeThisList) {
        moviesLikeThisList.isEmpty
            ? emit(
                state.copyWith(
                  isMoviesLikeThisListReachedMax: true,
                ),
              )
            : emit(
                state.copyWith(
                  movieDetails: state.movieDetails.copyWith(
                    similarMovies: List.of(state.movieDetails.similarMovies)
                      ..addAll(moviesLikeThisList),
                  ),
                  isMoviesLikeThisListReachedMax: false,
                ),
              );
        moviesLikeThisPage++;
      },
    );
  }

  Future<void> _addOrRemoveFromWatchListEvent(event, emit) async {
    final result = await addOrRemoveFromWatchListUseCase(
      isInWatchList: event.isInWatchList,
      movieId: event.movieId,
      sessionKey: userSessionKey,
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
              state.movieDetails.copyWith(status: accountStatesUpdated),
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
