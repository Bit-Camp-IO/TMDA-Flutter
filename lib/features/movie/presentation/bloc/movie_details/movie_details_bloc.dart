import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tmda/core/util/enums.dart';
import 'package:tmda/features/movie/domain/entities/movie/movies.dart';
import 'package:tmda/features/movie/domain/entities/movie_details/movie_account_states.dart';
import 'package:tmda/features/movie/domain/entities/movie_details/movie_cast.dart';
import 'package:tmda/features/movie/domain/entities/movie_details/movie_details.dart';
import 'package:tmda/features/movie/domain/entities/movie_details/movie_production_countries.dart';
import 'package:tmda/features/movie/domain/entities/movie_details/movie_reviews.dart';
import 'package:tmda/features/movie/domain/entities/movie_details/movie_video.dart';
import 'package:tmda/features/movie/domain/usecases/movie_details/add_or_remove_from_watch_list_usecase.dart';
import 'package:tmda/features/movie/domain/usecases/movie_details/get_account_states_usecase.dart';
import 'package:tmda/features/movie/domain/usecases/movie_details/get_movie_cast_usecase.dart';
import 'package:tmda/features/movie/domain/usecases/movie_details/get_movie_details_usecase.dart';
import 'package:tmda/features/movie/domain/usecases/movie_details/get_movie_reviews_usecase.dart';
import 'package:tmda/features/movie/domain/usecases/movie_details/get_movies_like_this_usecase.dart';
import 'package:tmda/features/movie/domain/usecases/movie_details/get_session_key_usecase.dart';
import 'package:tmda/features/movie/domain/usecases/movie_details/play_movie_video_usecase.dart';
part 'movie_details_event.dart';
part 'movie_details_state.dart';

class MovieDetailsBloc extends Bloc<MovieDetailsEvent, MovieDetailsState> {
  final GetMovieDetailsUseCase getMovieDetailsUseCase;
  final GetSessionKeyUseCase getSessionKeyUseCase;
  final GetMovieCastUseCase getMovieCastUseCase;
  final GetMovieReviewsUseCase getMovieReviewsUseCase;
  final GetMoviesLikeThisUseCase getMoviesLikeThisUseCase;
  final PlayMovieVideoUseCase playMovieTrailerUseCase;
  final AddOrRemoveFromWatchListUseCase addOrRemoveFromWatchListUseCase;
  final GetMovieAccountStatusUseCase getMovieAccountStatesUseCase;
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
    required this.getMovieAccountStatesUseCase,}
  ) : super(const MovieDetailsState()) {
    on<GetMovieDetailsEvent>(_getMovieDetailsEvent);
    on<GetMovieCastEvent>(_getMovieCastEvent);
    on<GetMoviesLikeThisEvent>(
      _getMoviesLikeThisEvent,
      transformer: droppable(),
    );
    on<GetMovieReviewsEvent>(_getMovieReviewsEvent);
    on<PlayMovieTrailerEvent>(_playMovieTrailerEvent);
    on<AddOrRemoveFromWatchListEvent>(_addOrRemoveFromWatchListEvent);
    on<GetMovieAccountStatesEvent>(_getMovieAccountStatesEvent);
  }
  Future<void> _getMovieDetailsEvent(event, emit) async {
    final getSessionKey = await getSessionKeyUseCase();
    getSessionKey.fold(
      (loadDataFailure) => emit(
        state.copyWith(
          movieDetailsState: BlocState.failure,
          movieCastFailMessage: loadDataFailure.message,
        ),
      ),
      (retrievedSessionKey) => userSessionKey = retrievedSessionKey,
    );
    if (userSessionKey.isNotEmpty) {
      final result = await getMovieDetailsUseCase(
          movieId: event.movieId, sessionId: userSessionKey);
      result.fold(
        (loadMovieDetailsFail) => emit(
          state.copyWith(
            movieDetailsState: BlocState.failure,
            movieCastFailMessage: loadMovieDetailsFail.message,
          ),
        ),
        (movieDetailsLoaded) => emit(
          state.copyWith(
            movieDetailsState: BlocState.success,
            movieDetails: movieDetailsLoaded,
          ),
        ),
      );
      final accountDetailsResult = await getMovieAccountStatesUseCase(
        movieId: event.movieId,
        sessionKey: userSessionKey,
      );
      accountDetailsResult.fold(
        (movieAccountStateFail) => emit(
          state.copyWith(movieAccountStatesFailMessage: movieAccountStateFail.message),
        ),
        (movieAccountStateLoaded) => emit(
          state.copyWith(movieAccountStatus: movieAccountStateLoaded),
        ),
      );
    }
  }

  Future<void> _getMovieCastEvent(event, emit) async {
    final result = await getMovieCastUseCase(event.movieId);
    result.fold(
      (loadMovieCastFail) => emit(
        state.copyWith(
          movieCastState: BlocState.failure,
          movieCastFailMessage: loadMovieCastFail.message,
        ),
      ),
      (movieCastList) => emit(
        state.copyWith(
          movieCastState: BlocState.success,
          movieCast: movieCastList,
        ),
      ),
    );
  }

  Future<void> _getMoviesLikeThisEvent(event, emit) async {
    final result = await getMoviesLikeThisUseCase(
      movieId: event.movieId,
      pageNumber: moviesLikeThisPage,
    );
    result.fold(
      (loadMoviesLikeThisFail) => emit(
        state.copyWith(
          moviesLikeThisState: BlocState.failure,
          movieCastFailMessage: loadMoviesLikeThisFail.message,
        ),
      ),
      (moviesLikeThisList) {
        moviesLikeThisList.isEmpty
            ? emit(
                state.copyWith(
                  moviesLikeThisState: BlocState.success,
                  isMoviesLikeThisListReachedMax: true,
                ),
              )
            : emit(
                state.copyWith(
                  moviesLikeThisState: BlocState.success,
                  moviesLikeThis: List.of(state.moviesLikeThis)
                    ..addAll(moviesLikeThisList),
                  isMoviesLikeThisListReachedMax: false,
                ),
              );
        moviesLikeThisPage++;
      },
    );
  }

  Future<void> _getMovieReviewsEvent(event, emit) async {
    final result = await getMovieReviewsUseCase(event.movieId);
    result.fold(
      (reviewsLoadFail) => emit(
        state.copyWith(
            movieReviewsState: BlocState.failure,
            movieReviewsFailMessage: reviewsLoadFail.message),
      ),
      (movieReviewsList) => emit(
        state.copyWith(
          movieReviewsState: BlocState.success,
          movieReviews: movieReviewsList,
        ),
      ),
    );
  }

  Future<void> _playMovieTrailerEvent(event, emit) async {
    await playMovieTrailerUseCase(event.movieVideoKey);
  }

  Future<void> _getMovieAccountStatesEvent(event, emit) async {
    final result = await getMovieAccountStatesUseCase(
      movieId: event.movieId,
      sessionKey: userSessionKey,
    );
    result.fold(
      (accountStatesFailure) => emit(
        state.copyWith(movieAccountStatesFailMessage: accountStatesFailure.message,),
      ),
      (accountStatesLoaded) => emit(
        state.copyWith(
          movieAccountStatus: accountStatesLoaded,
        ),
      ),
    );
  }

  Future<void> _addOrRemoveFromWatchListEvent(event, emit) async {
    final result = await addOrRemoveFromWatchListUseCase(
      isInWatchList: event.isInWatchList,
      movieId: event.movieId,
      sessionKey: userSessionKey,
    );
    result.fold(
      (watchListFailure) => emit(state.copyWith(addOrRemoveFromWatchListFailMessage: watchListFailure.message),
      ),
      (accountStatesUpdated) => emit(state.copyWith(movieAccountStatus: accountStatesUpdated),
      ),
    );
  }
}
