final class ApiConstants {
  //! Core Api
  static const String apiKey = '45fe17b977fb94a0c0c099b894af2c74';
  static const String accountId = '15269101';
  static const String apiKeyQuery = 'api_key';
  static const String baseUrl = 'https://api.themoviedb.org/3';
  static const String baseImageUrl = 'https://image.tmdb.org/t/p/w500';
  static const String baseYoutubeUrl = 'https://m.youtube.com/watch?v=';
  static const String baseRegisterUrl = 'https://www.themoviedb.org/signup';
  static const String baseUpdateProfileUrl = 'https://www.themoviedb.org/settings/profile';
  static const String baseForgetPasswordUrl = 'https://www.themoviedb.org/reset-password';
  static const String unAuthenticatedConsumer = 'unAuthenticatedConsumer';
  static const String authenticatedConsumer = 'authenticatedConsumer';
  static const String headerContentTypeValue = 'application/json';
  static const String headerContentType = 'Content-Type';
  static const String personEndPointAppendedToResponse = 'movie_credits,tv_credits';
  static const String endPointsAppendedToResponse = 'videos,account_states,credits,similar,reviews,recommendations';
  static const String movieMediaTypeTitle = 'movie';
  static const String tvMediaTypeTitle = 'tv';
  //! Auth Endpoints & Urls
  static const String requestTokenEndpoint = '/authentication/token/new';
  static const String validateWithLoginEndPoint =
      '/authentication/token/validate_with_login';
  static const String newSessionEndpoint = '/authentication/session/new';

  //! Shared Api Paths
  static const String castPath = '/credits';
  static const String similarPath = '/similar';
  static const String reviewsPath = '/reviews';
  static const String accountStatusPath = '/account_states';
  static const String recommendationsPath = '/recommendations';

  //! Movie Endpoints
  static const String nowPlayingMoviesEndPoint = '/movie/now_playing';
  static const String newMoviesEndPoints = '/movie/upcoming';
  static const String popularMoviesEndPoint = '/movie/popular';
  static const String topRatedMoviesEndPoint = '/movie/top_rated';
  static const String movieDetailsEndPoint = '/movie/';


  //! Tv Endpoints
  static const String tvAiringTodayEndPoint = '/tv/airing_today';
  static const String tvAiringThisWeekEndPoint = '/tv/on_the_air';
  static const String popularTvShowsEndPoint = '/tv/popular';
  static const String topRatedTvShowsEndPoint = '/tv/top_rated';
  static const String tvShowDetailsEndPoint = '/tv/';
  static const String seasonPath = '/season/';
  static const String episodePath = '/episode/';
  static const String episodeVideoPath = '/videos';

  //! Account Endpoints
  static const accountEndPoint = '/account/$accountId';
  static const accountMoviesWatchListPath = '/watchlist/movies';
  static const accountTvWatchListPath = '/watchlist/tv';
  static const addOrRemoveFromWatchListEndPoint =
      '/account/$accountId/watchlist';
  static const String accountLogoutEndPoint = '/authentication/session';

  //! Person EndPoints
  static const personEndPoint = '/person/';
  static String imageUrl(String apiImagePath) => '$baseImageUrl$apiImagePath';

  //! Search Endpoints
  static const movieSearch = '/search/movie';
  static const tvShowSearch = '/search/tv';
  static const personSearch = '/search/person';
}
