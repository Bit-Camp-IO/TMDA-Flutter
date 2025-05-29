import 'package:injectable/injectable.dart';
import 'package:tmda/core/api/api_consumer.dart';
import 'package:tmda/core/constants/api_constants.dart';
import 'package:tmda/core/error/exception.dart';
import 'package:tmda/features/movie/data/models/movie_details_model.dart';
import 'package:tmda/features/shared/data/models/movies_model.dart';
import 'package:url_launcher/url_launcher.dart';

abstract class MoviesDataSource {
  Future<List<MovieModel>> getNowPlayingMovies();
  Future<List<MovieModel>> getNewMovies({int? pageNumber});
  Future<List<MovieModel>> getPopularMovies({int? pageNumber});
  Future<List<MovieModel>> getTopRatedMovies({int? pageNumber});
  Future<MovieDetailsModel> getMovieDetails({required int movieId});
  Future<void> playMovieVideo(String movieVideoKey);
  Future<List<MovieModel>> getSimilarMovies(
      {required int movieId, required int pageNumber});
  Future<List<MovieModel>> getRecommendedMovies(
      {required int movieId, required int pageNumber});
}

@LazySingleton(as: MoviesDataSource)
class MoviesDataSourceImpl extends MoviesDataSource {
  final ApiConsumer _apiConsumer;
  MoviesDataSourceImpl(this._apiConsumer);

  @override
  Future<List<MovieModel>> getNowPlayingMovies() async {
    final Map<String, dynamic> response =
        await _apiConsumer.get(ApiConstants.nowPlayingMoviesEndPoint);
    return List<MovieModel>.from(
      (response['results'] as List).map(
        (nowPlayingMovies) => MovieModel.fromJson(nowPlayingMovies),
      ),
    );
  }

  @override
  Future<List<MovieModel>> getNewMovies({int? pageNumber}) async {
    final Map<String, dynamic> response = await _apiConsumer.get(
        ApiConstants.newMoviesEndPoints,
        queryParameters: {'page': pageNumber ?? 1});
    return List<MovieModel>.from(
      (response['results'] as List).map(
        (newMovies) => MovieModel.fromJson(newMovies),
      ),
    );
  }

  @override
  Future<List<MovieModel>> getPopularMovies({int? pageNumber}) async {
    final Map<String, dynamic> response = await _apiConsumer.get(
        ApiConstants.popularMoviesEndPoint,
        queryParameters: {'page': pageNumber ?? 1});
    return List<MovieModel>.from(
      (response['results'] as List).map(
        (popularMovies) => MovieModel.fromJson(popularMovies),
      ),
    );
  }

  @override
  Future<List<MovieModel>> getTopRatedMovies({int? pageNumber}) async {
    final Map<String, dynamic> response = await _apiConsumer.get(
        ApiConstants.topRatedMoviesEndPoint,
        queryParameters: {'page': pageNumber ?? 1});
    return List<MovieModel>.from(
      (response['results'] as List)
          .map((topRatedMovies) => MovieModel.fromJson(topRatedMovies)),
    );
  }

  @override
  Future<MovieDetailsModel> getMovieDetails({required int movieId}) async {
    final Map<String, dynamic> response = await _apiConsumer.get(
      '${ApiConstants.movieDetailsEndPoint}$movieId',
      queryParameters: {
        'append_to_response': ApiConstants.detailsEndPointsAppendedToResponse,
        'page': 1,
      },
    );
    return MovieDetailsModel.fromJson(response);
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
  Future<List<MovieModel>> getRecommendedMovies(
      {required int movieId, required int pageNumber}) async {
    final Map<String, dynamic> response = await _apiConsumer.get(
      '${ApiConstants.movieDetailsEndPoint}$movieId${ApiConstants.recommendationsPath}',
      queryParameters: {'page': pageNumber},
    );
    return List<MovieModel>.from(
      (response['results'] as List).map(
        (nowPlayingMovies) => MovieModel.fromJson(nowPlayingMovies),
      ),
    );
  }

  @override
  Future<List<MovieModel>> getSimilarMovies(
      {required int movieId, required int pageNumber}) async {
    final Map<String, dynamic> response = await _apiConsumer.get(
      '${ApiConstants.movieDetailsEndPoint}$movieId${ApiConstants.similarPath}',
      queryParameters: {'page': pageNumber},
    );
    return List<MovieModel>.from(
      (response['results'] as List).map(
        (nowPlayingMovies) => MovieModel.fromJson(nowPlayingMovies),
      ),
    );
  }
}
