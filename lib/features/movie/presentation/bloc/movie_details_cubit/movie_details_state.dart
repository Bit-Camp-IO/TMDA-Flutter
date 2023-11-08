part of 'movie_details_cubit.dart';

class MovieDetailsState extends Equatable {
  final MovieDetails movieDetails;
  final BlocState movieDetailsState;
  final String movieDetailsFailMessage;
  final String addOrRemoveFromWatchListFailMessage;
  final String getMoreMoviesLikeThisFailMessage;
  final bool isMoviesLikeThisListReachedMax;

  const MovieDetailsState({
    this.movieDetails = const MovieDetails(),
    this.movieDetailsState = BlocState.loading,
    this.movieDetailsFailMessage = '',
    this.addOrRemoveFromWatchListFailMessage = '',
    this.getMoreMoviesLikeThisFailMessage = '',
    this.isMoviesLikeThisListReachedMax = false,
  });

  MovieDetailsState copyWith({
    MovieDetails? movieDetails,
    BlocState? movieDetailsState,
    String? movieDetailsFailMessage,
    String? getMoreMoviesLikeThisFailMessage,
    bool? isMoviesLikeThisListReachedMax,
    String? addOrRemoveFromWatchListFailMessage,
  }) {
    return MovieDetailsState(
      movieDetails: movieDetails ?? this.movieDetails,
      movieDetailsState: movieDetailsState ?? this.movieDetailsState,
      movieDetailsFailMessage: movieDetailsFailMessage ?? this.movieDetailsFailMessage,
      addOrRemoveFromWatchListFailMessage: addOrRemoveFromWatchListFailMessage ?? this.addOrRemoveFromWatchListFailMessage,
      getMoreMoviesLikeThisFailMessage: getMoreMoviesLikeThisFailMessage ?? this.getMoreMoviesLikeThisFailMessage,
      isMoviesLikeThisListReachedMax: isMoviesLikeThisListReachedMax ?? this.isMoviesLikeThisListReachedMax,
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
      ];
}
