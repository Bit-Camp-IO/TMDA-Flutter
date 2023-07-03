class StringsManager {
  //! Core Strings
  static const String appName = 'TMDA';
  static const String noRouteFound = "We couldn't find this route";

  // Bottom NavigationBar label
  static const String movie = 'Movies';
  static const String tv = 'TV Shows';
  static const String search = 'Search';
  static const String account = 'Account';

  //! Auth Strings
  static const String login = 'Login';
  static const String register = 'Register';
  static const String loginUserName = 'User name';
  static const String loginPassword = 'Password';
  static const String registerNow = 'Register Now';
  static const String noAccount = 'Don\'t have an account ?';
  static const String forgetPassword = 'Forget Password?';
  static const String appOverview = 'Your guide to movies, TV shows\n and celebrities';
  static const String loginWelcome = 'Welcome to our\n community';

  //! Movie Feature Strings
  static const String newMoviesSectionTitle = 'New movies';
  static const String popularMoviesSectionTitle = 'Popular movies';
  static const String topRatedMoviesSectionTitle = 'Top Rated movies';
  static const String seeAllMoviesButtonTitle = 'See All';
  static const String movieDetailsUserReviews = 'User Reviews';
  static const String movieDetailsReviewTitle = 'Review By';
  static const String movieDetailsNoRating = 'No rating';
  static const String movieNoVideosMessage = "Couldn't find any videos for this movie";
  static const String noMovieCast = "Couldn't find movie cast.";
  static const String noSimilarMovies = "Couldn't find similar movies.";
  static const String noRecommendedMovies = "Couldn't find recommended movies.";

  //! Tv Show Feature Strings
  static const String tvShowNoVideosMessage = "Couldn't find any videos for this TvShow.";
  static const String popularTvShowSectionTitle = 'Popular Shows';
  static const String topRatedTvShowSectionTitle = 'Top Rated';
  static const String airingTodaySectionTitle = 'Airing Today';
  static const String noRecommendedTvShows = "We couldn't find Recommended Tv Shows.";
  static const String noSimilarTvShows = "We couldn't similar TvShows.";
  static const String tvDetailsOverviewTab = 'Overview';
  static const String tvDetailsSeasonsTab = 'Seasons';
  static const String noEpisodes = 'No Episodes yet';

  //! Account Feature Strings
  static const String moviesWatchlistTitle = 'Movies Watchlist';
  static const String emptyMoviesWatchListButtonTitle = 'Add Movies ';
  static const String tvShowsWatchlistTitle = 'TvShows Watchlist';
  static const String emptyTvShowsWatchListButtonTitle = 'Add TvShows ';
  static const String noAccountName = 'No Account Name';

  //! Person Screen
  static const String biography = 'Biography';
  static const String emptyBiography = "Couldn't Find biography.";
  static const String readLess = 'Read Less';
  static const String readMore = 'Read More';
  static const String noPersonMovies = "We couldn't find any movies.";
  static const String noPersonTvShows = "We couldn't find TvShows.";


  //! Search Feature Strings
  static const String searchMoviesTab = 'Movies';
  static const String searchTvShowsTab = 'Tv Shows';
  static const String searchPeopleTab = 'People';
  static const String noSearchResults = "Couldn't find any results.";
  static const String initialSearchTitle = 'Search for what you want.';
  static const String initialSearchSubTitle = 'Movies, TvShows, Persons.';

  //! Shared
  static const String seeAllButtonTitle = 'See All';
  static const String detailsSimilarSectionTitle = 'Similar';
  static const String detailsRecommendedSectionTitle = 'Recommended';
  static const String maxRate = '/10';
  static const String votes = 'Votes';
  static const String addToWatchlist = 'Add';
  static const String removeFromWatchList = 'Remove';
  static const String productionYear = 'Year';
  static const String airedTitle = 'Aired';
  static const String productionCountry = 'Country';
  static const String length = 'Length';
  static const String castSectionTitle = 'Cast';
  static const String duration = 'Min';
  static const String unknown = 'Unknown';
  static const String from = 'From';
  static const String noReviews = "Couldn't find any reviews.";
  static const String error = 'There was an error';
  static const String checkYourConnection = 'Please check your connection';
  static const String tryAgain = 'Try Again';

  //! Text build functions
  static String voteCount(String voteCount) => 'From $voteCount users';
  static String tmdbRating(dynamic rating) => 'TMDB ${rating.toStringAsFixed(1)}';
  static String knownFor(String knownFor) => 'Known For : $knownFor';
  static String tvShowSeasons(int numberOfSeasons) => '$numberOfSeasons Seasons  ';
  static String tvShowEpisodes(int numberOfEpisodes) => '$numberOfEpisodes Episodes';
}
