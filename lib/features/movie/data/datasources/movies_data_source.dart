import 'package:injectable/injectable.dart';
import 'package:tmda/core/api/api_consumer.dart';
import 'package:tmda/core/constants/api_constants.dart';
import 'package:tmda/core/error/exception.dart';
import 'package:tmda/features/movie/data/models/movie_account_states_model.dart';
import 'package:tmda/features/movie/data/models/movie_details_model.dart';
import 'package:tmda/features/movie/data/models/movies_model.dart';
import 'package:url_launcher/url_launcher.dart';

abstract class MoviesDataSource {
  Future<List<MoviesModel>> getNowPlayingMovies();
  Future<List<MoviesModel>> getNewMovies();
  Future<List<MoviesModel>> getPopularMovies();
  Future<List<MoviesModel>> getTopRatedMovies();
  Future<MovieDetailsModel> getMovieDetails(
      {required int movieId, required String sessionId});
  Future<void> playMovieVideo(String movieVideoKey);
  Future<MovieAccountStatesModel> addOrRemoveMovieFromWatchList({
    required int movieId,
    required bool isInWatchList,
    required String sessionId,
  });
  Future<List<MoviesModel>> getAllNewMovies({required int pageNumber, required String sessionId});
  Future<List<MoviesModel>> getAllPopularMovies({required int pageNumber, required String sessionId});
  Future<List<MoviesModel>> getAllTopRatedMovies({required int pageNumber, required String sessionId});
  Future<List<MoviesModel>>getAllSimilarMovies(
      {required int movieId, required int pageNumber, required String sessionId});
  Future<List<MoviesModel>> getAllRecommendedMovies(
      {required int movieId, required int pageNumber, required String sessionId});
  Future<MovieAccountStatesModel> getMovieStates({required String sessionId, required int movieId});
}

@LazySingleton(as: MoviesDataSource)
class MoviesDataSourceImpl extends MoviesDataSource {
  final ApiConsumer apiConsumer;
  MoviesDataSourceImpl(this.apiConsumer);

  @override
  Future<List<MoviesModel>> getNowPlayingMovies() async {
    final listOfMovies =
        await apiConsumer.get(ApiConstants.nowPlayingMoviesEndPoint);
    return List<MoviesModel>.from(
      (listOfMovies['results'] as List).map(
        (nowPlayingMovies) => MoviesModel.fromJson(nowPlayingMovies),
      ),
    );
  }

  @override
  Future<List<MoviesModel>> getNewMovies() async {
    final response = await apiConsumer.get(
      ApiConstants.newMoviesEndPoints,
    );
    return List<MoviesModel>.from(
      (response['results'] as List).map(
        (newMovies) => MoviesModel.fromJson(newMovies),
      ),
    );
  }

  @override
  Future<List<MoviesModel>> getPopularMovies() async {
    final response = await apiConsumer.get(
      ApiConstants.popularMoviesEndPoint,
    );
    return List<MoviesModel>.from(
      (response['results'] as List).map(
        (popularMovies) => MoviesModel.fromJson(popularMovies),
      ),
    );
  }

  @override
  Future<List<MoviesModel>> getTopRatedMovies() async {
    final response = await apiConsumer.get(
      ApiConstants.topRatedMoviesEndPoint,
    );
    return List<MoviesModel>.from(
      (response['results'] as List)
          .map((topRatedMovies) => MoviesModel.fromJson(topRatedMovies)),
    );
  }

  @override
  Future<MovieDetailsModel> getMovieDetails(
      {required int movieId, required sessionId}) async {
    final response = await apiConsumer.get(
      '${ApiConstants.movieDetailsEndPoint}$movieId',
      queryParameters: {
        'session_id': sessionId,
        'append_to_response': ApiConstants.endPointsAppendedToResponse,
      },
    );
    return MovieDetailsModel.fromJson(response);
  }

  @override
  Future<MovieAccountStatesModel> addOrRemoveMovieFromWatchList({
    required int movieId,
    required bool isInWatchList,
    required String sessionId,
  }) async {
    final response = await apiConsumer.post(
      ApiConstants.addOrRemoveFromWatchListEndPoint,
      queryParameters: {'session_id': sessionId},
      body: {
        'media_type': 'movie',
        "media_id": movieId,
        "watchlist": isInWatchList
      },
    );
    if (response['success'] == true) {
      return MovieAccountStatesModel(inWatchList: isInWatchList);
    } else {
      throw ServerException('${response['status_message']}');
    }
  }

  @override
  Future<void> playMovieVideo(String movieVideoKey) async {
    final Uri url = Uri.parse('${ApiConstants.baseYoutubeUrl}$movieVideoKey');
    await launchUrl(url, mode: LaunchMode.externalApplication);
    if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
      throw LaunchUrlException('Could not launch $url');
    }
  }

  @override
  Future<List<MoviesModel>> getAllNewMovies({required int pageNumber, required String sessionId}) async{
    final listOfMovies = await apiConsumer.get(ApiConstants.newMoviesEndPoints,  queryParameters: {'page': pageNumber},);
    final movieIds = listOfMovies['results'].map((movie) => movie['id']).toList();
    final movieStatuses = await Future.wait(movieIds.map((id) => apiConsumer.get('${ApiConstants.movieDetailsEndPoint}$id${ApiConstants.accountStatusPath}', queryParameters: {
      'session_id' : sessionId,
    })).toList().cast<Future<dynamic>>());
     return List<MoviesModel>.generate(movieIds.length, (index) {
      final Map<String, dynamic> movie = listOfMovies['results'][index];
      movie.addAll({'account_status' : movieStatuses[index]});
      return MoviesModel.fromJson(movie);
    });
  }

  @override
  Future<List<MoviesModel>> getAllPopularMovies({required int pageNumber, required String sessionId}) async{
    final listOfMovies = await apiConsumer.get(ApiConstants.popularMoviesEndPoint, queryParameters: {'page': pageNumber},);
    final movieIds = listOfMovies['results'].map((movie) => movie['id']).toList();
    final movieStatuses = await Future.wait(movieIds.map((id) => apiConsumer.get('${ApiConstants.movieDetailsEndPoint}$id${ApiConstants.accountStatusPath}', queryParameters: {
      'session_id' : sessionId,
    })).toList().cast<Future<dynamic>>());
    return List<MoviesModel>.generate(movieIds.length, (index) {
      final Map<String, dynamic> movie = listOfMovies['results'][index];
      movie.addAll({'account_status' : movieStatuses[index]});
      return MoviesModel.fromJson(movie);
    });
  }

  @override
  Future<List<MoviesModel>> getAllTopRatedMovies({required int pageNumber, required String sessionId}) async{
    final listOfMovies = await apiConsumer.get(ApiConstants.topRatedMoviesEndPoint, queryParameters: {
      'page': pageNumber,
    });
    final movieIds = listOfMovies['results'].map((movie) => movie['id']).toList();
    final movieStatuses = await Future.wait(movieIds.map((id) => apiConsumer.get('${ApiConstants.movieDetailsEndPoint}$id${ApiConstants.accountStatusPath}', queryParameters: {
      'session_id' : sessionId,
    })).toList().cast<Future<dynamic>>());
    return List<MoviesModel>.generate(movieIds.length, (index) {
      final Map<String, dynamic> movie = listOfMovies['results'][index];
      movie.addAll({'account_status' : movieStatuses[index]});
      return MoviesModel.fromJson(movie);
    });
  }

  @override
  Future<List<MoviesModel>> getAllRecommendedMovies({required int movieId, required int pageNumber, required String sessionId}) async{
    final listOfMovies = await apiConsumer.get('${ApiConstants.movieDetailsEndPoint}$movieId${ApiConstants.recommendationsPath}', queryParameters: {'page': pageNumber},);
    final movieIds = listOfMovies['results'].map((movie) => movie['id']).toList();
    final movieStatuses = await Future.wait(movieIds.map((id) => apiConsumer.get('${ApiConstants.movieDetailsEndPoint}$id${ApiConstants.accountStatusPath}', queryParameters: {
      'session_id' : sessionId,
    })).toList().cast<Future<dynamic>>());
    return List<MoviesModel>.generate(movieIds.length, (index) {
      final Map<String, dynamic> movie = listOfMovies['results'][index];
      movie.addAll({'account_status' : movieStatuses[index]});
      return MoviesModel.fromJson(movie);
    });
  }

  @override
  Future<List<MoviesModel>> getAllSimilarMovies({required int movieId, required int pageNumber, required String sessionId}) async{
    final listOfMovies = await apiConsumer.get('${ApiConstants.movieDetailsEndPoint}$movieId${ApiConstants.similarPath}', queryParameters: {'page': pageNumber},);
    final movieIds = listOfMovies['results'].map((movie) => movie['id']).toList();
    final movieStatuses = await Future.wait(movieIds.map((id) => apiConsumer.get('${ApiConstants.movieDetailsEndPoint}$id${ApiConstants.accountStatusPath}', queryParameters: {
      'session_id' : sessionId,
    })).toList().cast<Future<dynamic>>());
    return List<MoviesModel>.generate(movieIds.length, (index) {
      final Map<String, dynamic> movie = listOfMovies['results'][index];
      movie.addAll({'account_status' : movieStatuses[index]});
      return MoviesModel.fromJson(movie);
    });
  }

  @override
  Future<MovieAccountStatesModel> getMovieStates({required String sessionId, required int movieId}) async{
    final Map<String, dynamic> movieStates = await apiConsumer.get('${ApiConstants.movieDetailsEndPoint}$movieId${ApiConstants.accountStatusPath}', queryParameters: {
      'session_id' : sessionId,
    });
    movieStates.addAll({'movie_id' : movieId});
    return MovieAccountStatesModel.fromJson(movieStates);
  }
}
