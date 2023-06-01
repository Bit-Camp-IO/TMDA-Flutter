import 'package:tmda/core/api/api_consumer.dart';
import 'package:tmda/core/constants/api_constants.dart';
import 'package:tmda/features/movie/data/models/movie_details_model.dart';
import 'package:tmda/features/movie/data/models/movies_model.dart';

abstract class MoviesDataSource {
  Future<List<MoviesModel>> getNowPlayingMovies();
  Future<List<MoviesModel>> getUpComingMovies();
  Future<List<MoviesModel>> getPopularMovies();
  Future<List<MoviesModel>> getTopRatedMovies();
  Future<MovieDetailsModel> getMovieDetails(String movieId);
}

class MoviesDataSourceImpl extends MoviesDataSource {
  final ApiConsumer apiConsumer;
  MoviesDataSourceImpl(this.apiConsumer);

  @override
  Future<List<MoviesModel>> getNowPlayingMovies() async {
    try {
      final response = await apiConsumer.get(apiGetNowPlayingMovies);
      return List<MoviesModel>.from(
        (response['results'] as List).map((e) => MoviesModel.fromJson(e)),
      );
    } on Exception {
      throw Exception();
    }
  }

  @override
  Future<List<MoviesModel>> getUpComingMovies() async {
    try {
      final response = await apiConsumer.get(apiGetUpcomingMovies);
      return List<MoviesModel>.from(
        (response['results'] as List).map((e) => MoviesModel.fromJson(e)),
      );
    } on Exception {
      throw Exception();
    }
  }

  @override
  Future<List<MoviesModel>> getPopularMovies() async {
    try {
      final response = await apiConsumer.get(apiGetPopularMovies);
      return List<MoviesModel>.from(
        (response['results'] as List).map((e) => MoviesModel.fromJson(e)),
      );
    } on Exception {
      throw Exception();
    }
  }

  @override
  Future<List<MoviesModel>> getTopRatedMovies() async {
    try {
      final response = await apiConsumer.get(apiGetTopRatedMovies);
      return List<MoviesModel>.from(
        (response['results'] as List).map((e) => MoviesModel.fromJson(e)),
      );
    } on Exception {
      throw Exception();
    }
  }

  @override
  Future<MovieDetailsModel> getMovieDetails(String movieId) async {
    try {
      final response = await apiConsumer.get('$apiGetMovieDetails$movieId');
      return MovieDetailsModel.fromJson(response);
    } on Exception {
      throw Exception();
    }
  }

}
