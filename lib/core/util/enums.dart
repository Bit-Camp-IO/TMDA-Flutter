enum MovieType {
  newMovies('New Movies'),
  popularMovies('Popular Movies'),
  topRatedMovies('Top Rated Movies'),
  recommendedMovies('Recommended Movies'),
  moreMoviesLikeThis('Similar Movies');

  const MovieType(this.name);
  final String name;
}

enum TvShowType {
  topRatedTvShows('Top Rated Shows'),
  airingToday('Airing Today'),
  popularTvShows('Popular Shows'),
  recommendedTvShows('Recommended Shows'),
  similarTvShows('Similar Shows');

  const TvShowType(this.name);
  final String name;
}

enum WatchListType {
  moviesWatchList('Movies Watchlist'),
  tvShowWatchList('TvShows Watchlist');
  const WatchListType(this.name);
  final String name;
}
enum MediaType {
  movie('movie'),
  tvShow('tv');

  const MediaType(this.name);
  final String name;
}
enum BlocState {
  loading,
  success,
  failure,
}
