final class ApiConstants {
  static const String apiKey = '45fe17b977fb94a0c0c099b894af2c74';
  static const String apiKeyQuery = 'api_key';
  static const String apiBaseUrl = 'https://api.themoviedb.org/3';
  static const String apiRegistration = 'https://www.themoviedb.org/signup';
  static const String baseImageUrl = 'https://image.tmdb.org/t/p/w500';
  static const String apiHeaderContentTypeValue = 'application/json';
  static const String apiHeaderContentType = 'Content-Type';
  static const String apiHeaderAuthorization = 'Authorization';
  static const String apiHeaderAuthorizationToken = 'Bearer';
  static const String apiRequestToken = '$apiBaseUrl/authentication/token/new';
  static const String apiValidateWithLogin =
      '$apiBaseUrl/authentication/token/validate_with_login';
  static const String apiNewSession = '$apiBaseUrl/authentication/session/new';
  static const String apiDeleteSession = '$apiBaseUrl/authentication/session';
  static const String apiGetNowPlayingMovies = '$apiBaseUrl/movie/now_playing';
  static const String apiGetUpcomingMovies = '$apiBaseUrl/movie/upcoming';
  static const String apiGetPopularMovies = '$apiBaseUrl/movie/popular';
  static const String apiGetTopRatedMovies = '$apiBaseUrl/movie/top_rated';
  static const String apiGetMovieDetails = '$apiBaseUrl/movie/';
  static String imageUrl(String apiImagePath) => '$baseImageUrl$apiImagePath';
}
