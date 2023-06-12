import 'dart:io';
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
  Future<MovieDetailsModel> getMovieDetails({required int movieId, required String sessionId});
  Future<List<MoviesModel>> getMoviesLikeThis({required int movieId, required int pageNumber});
  Future<List<MovieCastModel>> getMovieCast(int movieId);
  Future<List<MovieReviewsModel>> getMovieReviews(int movieId);
  Future<void> openMovieTrailer(String movieVideoKey);
  Future<MovieAccountStatesModel> getMovieAccountStates({required int movieId,required String sessionId});
  Future<MovieAccountStatesModel> addOrRemoveFromWatchList({
    required int movieId,
    required bool isInWatchList,
    required String sessionId,
  });
}

class MoviesDataSourceImpl extends MoviesDataSource {
  final ApiConsumer apiConsumer;
  MoviesDataSourceImpl(this.apiConsumer);

  @override
  Future<List<MoviesModel>> getNowPlayingMovies() async {
    try {
      final response =
          await apiConsumer.get(ApiConstants.nowPlayingMoviesEndPoint);
      return List<MoviesModel>.from(
        (response['results'] as List).map((e) => MoviesModel.fromJson(e),),
      );
    } on Exception {
      throw const ServerException('There was an error');
    }
  }

  @override
  Future<List<MoviesModel>> getNewMovies(int pageNumber) async {
    try {
      final response = await apiConsumer.get(ApiConstants.newMoviesEndPoints,
          queryParameters: {'page': pageNumber});
      return List<MoviesModel>.from(
        (response['results'] as List).map((newMovies) => MoviesModel.fromJson(newMovies)),
      );
    } on Exception {
      throw const ServerException('There was an error');
    }
  }

  @override
  Future<List<MoviesModel>> getPopularMovies(int pageNumber) async {
    try {
      final response = await apiConsumer.get(ApiConstants.popularMoviesEndPoint,
          queryParameters: {'page': pageNumber});
      return List<MoviesModel>.from(
        (response['results'] as List).map((popularMovies) => MoviesModel.fromJson(popularMovies)),
      );
    } on Exception {
      throw const ServerException('There was an error');
    }
  }

  @override
  Future<List<MoviesModel>> getTopRatedMovies(int pageNumber) async {
    try {
      final response = await apiConsumer.get(ApiConstants.topRatedMoviesEndPoint,
          queryParameters: {'page': pageNumber});
      return List<MoviesModel>.from(
        (response['results'] as List).map((topRatedMovies) => MoviesModel.fromJson(topRatedMovies)),
      );
    } on Exception {
      throw const ServerException('There was an error');
    }
  }

  @override
  Future<MovieDetailsModel> getMovieDetails(
      {required int movieId, required sessionId}) async {
    try {
      final response = await apiConsumer
          .get('${ApiConstants.movieDetailsEndPoint}$movieId', queryParameters: {
        'session_id': sessionId,
        'append_to_response': ApiConstants.endPointsAppendedToResponse,
      });
      return MovieDetailsModel.fromJson(response);
    } on Exception {
      throw const ServerException('There was an error');
    }
  }

  @override
  Future<List<MoviesModel>> getMoviesLikeThis(
      {required int movieId, required int pageNumber}) async {
    try {
      final response = await apiConsumer.get(
          '${ApiConstants.movieDetailsEndPoint}$movieId${ApiConstants.moviesLikeThisPath}',
          queryParameters: {
            'page': pageNumber,
          });
      return List<MoviesModel>.from(
        (response['results'] as List).map((similarMovies) => MoviesModel.fromJson(similarMovies)),
      );
    } on Exception {
      throw const ServerException('There was an error');
    }
  }

  @override
  Future<List<MovieCastModel>> getMovieCast(int movieId) async {
    try {
      final response = await apiConsumer.get(
        '${ApiConstants.movieDetailsEndPoint}$movieId${ApiConstants.movieCastEndPath}',
      );
      return List<MovieCastModel>.from(
        (response['cast'] as List).map((e) => MovieCastModel.fromJson(e)),
      );
    } on Exception {
      throw const ServerException('There was an error');
    }
  }

  @override
  Future<List<MovieReviewsModel>> getMovieReviews(int movieId) async {
    try {
      final response = await apiConsumer.get(
        '${ApiConstants.movieDetailsEndPoint}$movieId${ApiConstants.movieReviewsPath}',
      );
      return List<MovieReviewsModel>.from(
        (response['results'] as List).map((movieReviews) => MovieReviewsModel.fromJson(movieReviews)),
      );
    } on Exception {
      throw const ServerException('There was an error');
    }
  }

  @override
  Future<void> openMovieTrailer(String movieVideoKey) async {
    if (Platform.isAndroid) {
      final Uri url = Uri.parse('${ApiConstants.baseYoutubeUrl}$movieVideoKey');
      if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
        throw LaunchUrlException('Could not launch $url');
      }
    }
  }

  @override
  Future<MovieAccountStatesModel> addOrRemoveFromWatchList({
    required int movieId,
    required bool isInWatchList,
    required String sessionId,
  }) async {
    try {
      final response = await apiConsumer.post(
        ApiConstants.addOrRemoveFromWatchListEndPoint,
        queryParameters: {'session_id': sessionId},
        body: {
          'media_type': 'movie',
          "media_id": movieId,
          "watchlist": isInWatchList
        },
      );
      if(response['success'] == true){
        return await getMovieAccountStates(movieId: movieId, sessionId: sessionId);
      }else{
        throw const ServerException('There was an error');
      }
    } on Exception {
      throw const ServerException('There was an error');
    }
  }

  @override
  Future<MovieAccountStatesModel> getMovieAccountStates(
      {required int movieId, required String sessionId}) async {
    try {
      final response = await apiConsumer.get(
        '${ApiConstants.movieDetailsEndPoint}$movieId${ApiConstants.accountStatesPath}',
        queryParameters: {
          'session_id': sessionId,
        },
      );
      return MovieAccountStatesModel.fromJson(response);
    } on Exception {
      throw const ServerException('There was an error');
    }
  }
}
