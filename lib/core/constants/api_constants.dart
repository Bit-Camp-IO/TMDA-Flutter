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
  static const String endPointsAppendedToResponse = 'videos';
  static const String movieMediaTypeTitle = 'movie';
  static const String tvMediaTypeTitle = 'tv';
  //! Auth Endpoints & Urls
  static const String requestTokenEndpoint = '$baseUrl/authentication/token/new';
  static const String validateWithLoginEndPoint =
      '$baseUrl/authentication/token/validate_with_login';
  static const String newSessionEndpoint = '$baseUrl/authentication/session/new';
  static const String deleteSessionEndPoint = '$baseUrl/authentication/session';

  //! Movie Endpoints
  static const String nowPlayingMoviesEndPoint = '$baseUrl/movie/now_playing';
  static const String newMoviesEndPoints = '$baseUrl/movie/upcoming';
  static const String popularMoviesEndPoint = '$baseUrl/movie/popular';
  static const String topRatedMoviesEndPoint = '$baseUrl/movie/top_rated';
  static const String movieDetailsEndPoint = '$baseUrl/movie/';
  static const String movieCastEndPath = '/credits';
  static const String moviesLikeThisPath = '/similar';
  static const String movieReviewsPath = '/reviews';
  static const String accountStatesPath = '/account_states';

  //! Account Endpoints
  static const addOrRemoveFromWatchListEndPoint =
      '$baseUrl/account/$accountId/watchlist';

  static String imageUrl(String apiImagePath) => '$baseImageUrl$apiImagePath';
}
