part of 'movie_details_bloc.dart';

class MovieDetailsState extends Equatable {
  final MovieDetails movieDetails;
  final BlocState movieDetailsState;
  final String movieDetailsFailMessage;
  final List<MovieCast> movieCast;
  final BlocState movieCastState;
  final String movieCastFailMessage;
  final List<Movies> moviesLikeThis;
  final BlocState moviesLikeThisState;
  final String moviesLikeThisFailMessage;
  final bool isMoviesLikeThisListReachedMax;
  final List<MovieReviews> movieReviews;
  final BlocState movieReviewsState;
  final String movieReviewsFailMessage;
  final String addOrRemoveFromWatchListFailMessage;
  final MovieAccountStatus movieAccountStatus;
  final String movieAccountStatesFailMessage;
  const MovieDetailsState({
    this.movieDetails = const MovieDetails(
      posterPath: '',
      genres: [],
      backDropPath: '',
      id: 0,
      overview: '',
      releaseDate: '',
      title: '',
      runTime: 0,
      voteAverage: 0,
      popularity: 0,
      movieProductionCountry: MovieProductionCountries(
        countryCode: '',
        countryName: '',
      ),
      movieLanguage: '',
      movieVideo: MovieVideo(
        name: '',
        key: '',
        videoType: '',
      ),
    ),
    this.movieDetailsState = BlocState.loading,
    this.movieDetailsFailMessage = '',
    this.movieCast = const [],
    this.movieCastState = BlocState.loading,
    this.movieCastFailMessage = '',
    this.moviesLikeThis = const [],
    this.moviesLikeThisState = BlocState.loading,
    this.moviesLikeThisFailMessage = '',
    this.isMoviesLikeThisListReachedMax = false,
    this.movieReviews = const [],
    this.movieReviewsState = BlocState.loading,
    this.movieReviewsFailMessage = '',
    this.addOrRemoveFromWatchListFailMessage = '',
    this.movieAccountStatus = const MovieAccountStatus(
      isFavoriteMovie: false,
      inWatchList: false,
    ),
    this.movieAccountStatesFailMessage = '',
  });

  MovieDetailsState copyWith({
    int? movieId,
    MovieDetails? movieDetails,
    BlocState? movieDetailsState,
    String? movieDetailsFailMessage,
    List<MovieCast>? movieCast,
    BlocState? movieCastState,
    String? movieCastFailMessage,
    List<Movies>? moviesLikeThis,
    BlocState? moviesLikeThisState,
    String? moviesLikeThisFailMessage,
    bool? isMoviesLikeThisListReachedMax,
    List<MovieReviews>? movieReviews,
    BlocState? movieReviewsState,
    String? movieReviewsFailMessage,
    BlocState? addOrRemoveFromWatchListState,
    String? movieAccountStatesFailMessage,
    String? addOrRemoveFromWatchListFailMessage,
    MovieAccountStatus? movieAccountStatus,
  }) {
    return MovieDetailsState(
      movieDetails: movieDetails ?? this.movieDetails,
      movieDetailsState: movieDetailsState ?? this.movieDetailsState,
      movieDetailsFailMessage: movieDetailsFailMessage ?? this.movieDetailsFailMessage,
      movieCast: movieCast ?? this.movieCast,
      movieCastState: movieCastState ?? this.movieCastState,
      movieCastFailMessage: movieCastFailMessage ?? this.movieCastFailMessage,
      moviesLikeThis: moviesLikeThis ?? this.moviesLikeThis,
      moviesLikeThisState: moviesLikeThisState ?? this.moviesLikeThisState,
      moviesLikeThisFailMessage: moviesLikeThisFailMessage ?? this.moviesLikeThisFailMessage,
      isMoviesLikeThisListReachedMax: isMoviesLikeThisListReachedMax ?? this.isMoviesLikeThisListReachedMax,
      movieReviews: movieReviews ?? this.movieReviews,
      movieReviewsState: movieReviewsState ?? this.movieReviewsState,
      movieReviewsFailMessage: movieReviewsFailMessage ?? this.movieReviewsFailMessage,
      addOrRemoveFromWatchListFailMessage: addOrRemoveFromWatchListFailMessage ?? this.addOrRemoveFromWatchListFailMessage,
      movieAccountStatus: movieAccountStatus ?? this.movieAccountStatus,
      movieAccountStatesFailMessage: movieAccountStatesFailMessage ?? this.movieAccountStatesFailMessage,
    );
  }

  @override
  List<Object> get props => [
        movieDetails,
        movieDetailsState,
        movieDetailsFailMessage,
        movieCast,
        movieCastState,
        movieCastFailMessage,
        moviesLikeThis,
        moviesLikeThisState,
        moviesLikeThisFailMessage,
        isMoviesLikeThisListReachedMax,
        movieReviews,
        movieReviewsState,
        movieReviewsFailMessage,
        addOrRemoveFromWatchListFailMessage,
        movieAccountStatus,
        movieAccountStatesFailMessage
      ];
}
