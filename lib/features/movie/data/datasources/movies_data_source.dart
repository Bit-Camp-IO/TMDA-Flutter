import 'package:injectable/injectable.dart';
import 'package:tmda/core/api/api_consumer.dart';
import 'package:tmda/core/constants/api_constants.dart';
import 'package:tmda/core/error/exception.dart';
import 'package:tmda/features/movie/data/models/movie_details/movie_account_states_model.dart';
import 'package:tmda/features/movie/data/models/movie_details/movie_cast_model.dart';
import 'package:tmda/features/movie/data/models/movie_details/movie_details_model.dart';
import 'package:tmda/features/movie/data/models/movie/movies_model.dart';
import 'package:tmda/features/movie/data/models/movie_details/movie_review_model.dart';
import 'package:url_launcher/url_launcher.dart';

abstract class MoviesDataSource {
  Future<List<MoviesModel>> getNowPlayingMovies();
  Future<List<MoviesModel>> getNewMovies(int pageNumber);
  Future<List<MoviesModel>> getPopularMovies(int pageNumber);
  Future<List<MoviesModel>> getTopRatedMovies(int pageNumber);
  Future<MovieDetailsModel> getMovieDetails(
      {required int movieId, required String sessionId});
  Future<List<MoviesModel>> getMoviesLikeThis(
      {required int movieId, required int pageNumber});
  Future<List<MovieCastModel>> getMovieCast(int movieId);
  Future<List<MovieReviewsModel>> getMovieReviews(int movieId);
  Future<void> playMovieVideo(String movieVideoKey);
  Future<MovieAccountStatesModel> addOrRemoveMovieFromWatchList({
    required int movieId,
    required bool isInWatchList,
    required String sessionId,
  });
}

@LazySingleton(as: MoviesDataSource)
class MoviesDataSourceImpl extends MoviesDataSource {
  final ApiConsumer apiConsumer;
  MoviesDataSourceImpl(this.apiConsumer);

  @override
  Future<List<MoviesModel>> getNowPlayingMovies() async {
    final response =
        await apiConsumer.get(ApiConstants.nowPlayingMoviesEndPoint);
    return List<MoviesModel>.from(
      (response['results'] as List).map(
        (e) => MoviesModel.fromJson(e),
      ),
    );
  }

  @override
  Future<List<MoviesModel>> getNewMovies(int pageNumber) async {
    final response = await apiConsumer.get(
      ApiConstants.newMoviesEndPoints,
      queryParameters: {'page': pageNumber},
    );
    return List<MoviesModel>.from(
      (response['results'] as List).map(
        (newMovies) => MoviesModel.fromJson(newMovies),
      ),
    );
  }

  @override
  Future<List<MoviesModel>> getPopularMovies(int pageNumber) async {
    final response = await apiConsumer.get(
      ApiConstants.popularMoviesEndPoint,
      queryParameters: {'page': pageNumber},
    );
    return List<MoviesModel>.from(
      (response['results'] as List).map(
        (popularMovies) => MoviesModel.fromJson(popularMovies),
      ),
    );
  }

  @override
  Future<List<MoviesModel>> getTopRatedMovies(int pageNumber) async {
    final response = await apiConsumer.get(
      ApiConstants.topRatedMoviesEndPoint,
      queryParameters: {'page': pageNumber},
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
  Future<List<MoviesModel>> getMoviesLikeThis({
    required int movieId,
    required int pageNumber,
  }) async {
    final response = await apiConsumer.get(
      '${ApiConstants.movieDetailsEndPoint}$movieId${ApiConstants.similarPath}',
      queryParameters: {
        'page': pageNumber,
      },
    );
    return List<MoviesModel>.from(
      (response['results'] as List).map(
        (jsonData) => MoviesModel.fromJson(jsonData),
      ),
    );
  }

  @override
  Future<List<MovieCastModel>> getMovieCast(int movieId) async {
    final response = await apiConsumer.get(
      '${ApiConstants.movieDetailsEndPoint}$movieId${ApiConstants.castPath}',
    );
    return List<MovieCastModel>.from(
      response['cast'].map(
        (jsonData) => MovieCastModel.fromJson(jsonData),
      ),
    );
  }

  @override
  Future<List<MovieReviewsModel>> getMovieReviews(int movieId) async {
    final response = await apiConsumer.get(
      '${ApiConstants.movieDetailsEndPoint}$movieId${ApiConstants.reviewsPath}',
    );
    return List<MovieReviewsModel>.from(
      response['results'].map(
        (jsonData) => MovieReviewsModel.fromJson(jsonData),
      ),
    );
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
}
