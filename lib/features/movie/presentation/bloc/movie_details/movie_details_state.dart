part of 'movie_details_bloc.dart';

class MovieDetailsState extends Equatable {
  final MovieDetails movieDetails;
  final BlocState movieDetailsState;
  final String movieDetailsFailMessage;
  final String addOrRemoveFromWatchListFailMessage;
  final String getMoreMoviesLikeThisFailMessage;
  final bool isMoviesLikeThisListReachedMax;
  final double animatedContainerHeight;
  final double animatedPosterHeight;
  const MovieDetailsState({
    this.movieDetails = const MovieDetails(
      posterPath: '',
      backDropPath: '',
      id: 0,
      overview: '',
      releaseDate: '',
      title: '',
      runTime: 0,
      voteAverage: 0,
      popularity: 0,
      language: '',
      status: MovieAccountStatus(
        isFavoriteMovie: false,
        inWatchList: false,
      ),
      productionCountry: MovieProductionCountries(
        countryCode: '',
        countryName: '',
      ),
      video: MovieVideo(
        name: '',
        key: '',
        videoType: '',
      ),
      cast: [],
      reviews: [],
      similarMovies: [],
      genres: [],
    ),
    this.movieDetailsState = BlocState.loading,
    this.movieDetailsFailMessage = '',
    this.addOrRemoveFromWatchListFailMessage = '',
    this.getMoreMoviesLikeThisFailMessage = '',
    this.isMoviesLikeThisListReachedMax = false,
    this.animatedContainerHeight = 500,
    this.animatedPosterHeight = 420,
  });

  MovieDetailsState copyWith({
    MovieDetails? movieDetails,
    BlocState? movieDetailsState,
    String? movieDetailsFailMessage,
    String? getMoreMoviesLikeThisFailMessage,
    bool? isMoviesLikeThisListReachedMax,
    String? addOrRemoveFromWatchListFailMessage,
    double? animatedContainerHeight,
    double? animatedPosterHeight,
  }) {
    return MovieDetailsState(
      movieDetails: movieDetails ?? this.movieDetails,
      movieDetailsState: movieDetailsState ?? this.movieDetailsState,
      movieDetailsFailMessage: movieDetailsFailMessage ?? this.movieDetailsFailMessage,
      addOrRemoveFromWatchListFailMessage: addOrRemoveFromWatchListFailMessage ?? this.addOrRemoveFromWatchListFailMessage,
      getMoreMoviesLikeThisFailMessage: getMoreMoviesLikeThisFailMessage ?? this.getMoreMoviesLikeThisFailMessage,
      isMoviesLikeThisListReachedMax: isMoviesLikeThisListReachedMax ?? this.isMoviesLikeThisListReachedMax,
      animatedContainerHeight: animatedContainerHeight ?? this.animatedContainerHeight,
      animatedPosterHeight: animatedPosterHeight ?? this.animatedPosterHeight,
    );
  }

  @override
  List<Object> get props => [
        movieDetails,
        movieDetailsState,
        movieDetailsFailMessage,
        addOrRemoveFromWatchListFailMessage,
        getMoreMoviesLikeThisFailMessage,
        isMoviesLikeThisListReachedMax,
        animatedContainerHeight,
        animatedPosterHeight
      ];
}
