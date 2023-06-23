final class ApiConstants {
  //! Core Api
  static const String apiKey = '45fe17b977fb94a0c0c099b894af2c74';
  static const String accountId = '15269101';
  static const String apiKeyQuery = 'api_key';
  static const String baseUrl = 'https://api.themoviedb.org/3';
  static const String baseImageUrl = 'https://image.tmdb.org/t/p/w500';
  static const String baseYoutubeUrl = 'https://m.youtube.com/watch?v=';
  static const String baseRegisterUrl = 'https://www.themoviedb.org/signup';
  static const String baseForgetPasswordUrl =
      'https://www.themoviedb.org/reset-password';
  static const String headerContentTypeValue = 'application/json';
  static const String headerContentType = 'Content-Type';
  static const String endPointsAppendedToResponse = 'videos,account_states,credits,similar,reviews,recommendations';
  static const String movieMediaTypeTitle = 'movie';
  static const String tvMediaTypeTitle = 'tv';
  //! Auth Endpoints & Urls
  static const String requestTokenEndpoint = '$baseUrl/authentication/token/new';
  static const String validateWithLoginEndPoint =
      '$baseUrl/authentication/token/validate_with_login';
  static const String newSessionEndpoint = '$baseUrl/authentication/session/new';
  static const String deleteSessionEndPoint = '$baseUrl/authentication/session';

  //! Shared Api Paths
  static const String castPath = '/credits';
  static const String similarPath = '/similar';
  static const String reviewsPath = '/reviews';
  static const String accountStatusPath = '/account_states';
  static const String recommendationsPath = '/recommendations';
  //! Movie Endpoints
  static const String nowPlayingMoviesEndPoint = '$baseUrl/movie/now_playing';
  static const String newMoviesEndPoints = '$baseUrl/movie/upcoming';
  static const String popularMoviesEndPoint = '$baseUrl/movie/popular';
  static const String topRatedMoviesEndPoint = '$baseUrl/movie/top_rated';
  static const String movieDetailsEndPoint = '$baseUrl/movie/';


  //! Tv Endpoints
  static const String tvAiringTodayEndPoint = '$baseUrl/tv/airing_today';
  static const String tvAiringThisWeekEndPoint = '$baseUrl/tv/on_the_air';
  static const String popularTvShowsEndPoint = '$baseUrl/tv/popular';
  static const String topRatedTvShowsEndPoint = '$baseUrl/tv/top_rated';
  static const String tvShowDetailsEndPoint = '$baseUrl/tv/';
  static const String seasonPath = '/season/';
  static const String episodePath = '/episode/';
  static const String episodeVideoPath = '/videos';
  //! Account Endpoints
  static const addOrRemoveFromWatchListEndPoint =
      '$baseUrl/account/$accountId/watchlist';

  static String imageUrl(String apiImagePath) => '$baseImageUrl$apiImagePath';
}
