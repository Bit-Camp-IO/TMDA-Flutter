enum MovieType {
  newMovies('New Movies'),
  popularMovies('Popular Movies'),
  topRatedMovies('Top Rated Movies'),
  moreLikeThisMovies('Similar Movies');

  const MovieType(this.name);
  final String name;
}

enum BlocState {
  loading,
  success,
  failure,
}
