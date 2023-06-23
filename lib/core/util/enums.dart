enum MovieType {
  newMovies('New Movies'),
  popularMovies('Popular Movies'),
  topRatedMovies('Top Rated Movies'),
  moreMoviesLikeThis('Similar Movies');

  const MovieType(this.name);
  final String name;
}

enum TvShowType {
  topRatedTvShows('Top Rated Shows'),
  airingThisWeek('Airing This week'),
  popularTvShows('Popular Shows'),
  recommendedTvShows('Recommended Tv Shows'),
  similarTvShows('Similar Shows');

  const TvShowType(this.name);
  final String name;
}

enum BlocState {
  loading,
  success,
  failure,
}
