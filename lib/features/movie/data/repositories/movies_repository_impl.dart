import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:tmda/core/error/exception.dart';
import 'package:tmda/core/error/failure.dart';
import 'package:tmda/features/movie/data/datasources/movies_data_source.dart';
import 'package:tmda/features/movie/data/models/movie_details_model.dart';
import 'package:tmda/features/shared/data/models/movies_model.dart';
import 'package:tmda/features/shared/domain/entities/movie.dart';
import 'package:tmda/features/movie/domain/repositories/movies_repository.dart';

@LazySingleton(as: MoviesRepository)
class MoviesRepositoryImpl extends MoviesRepository {
  final MoviesDataSource _moviesDataSource;

  MoviesRepositoryImpl(this._moviesDataSource);

  @override
  Future<Either<Failure, List<MovieModel>>> getNowPlayingMovies() async {
    try {
      final result = await _moviesDataSource.getNowPlayingMovies();
      return right(result);
    } on ServerException catch (exception) {
      return left(
        Failure(exception.message!),
      );
    }
  }

  @override
  Future<Either<Failure, List<MovieModel>>> getPopularMovies({int? pageNumber}) async {
    try {
      final result = await _moviesDataSource.getPopularMovies(pageNumber: pageNumber);
      return right(result);
    } on ServerException catch (exception) {
      return left(
        Failure(exception.message!),
      );
    }
  }

  @override
  Future<Either<Failure, List<MovieModel>>> getTopRatedMovies({int? pageNumber}) async {
    try {
      final result = await _moviesDataSource.getTopRatedMovies(pageNumber: pageNumber);
      return right(result);
    } on ServerException catch (exception) {
      return left(
        Failure(exception.message!),
      );
    }
  }

  @override
  Future<Either<Failure, List<MovieModel>>> getNewMovies({int? pageNumber}) async {
    try {
      final result = await _moviesDataSource.getNewMovies(pageNumber: pageNumber);
      return right(result);
    } on ServerException catch (exception) {
      return left(
        Failure(exception.message!),
      );
    }
  }

  @override
  Future<Either<Failure, MovieDetailsModel>> getMovieDetails({required int movieId}) async {
    try {
      final result = await _moviesDataSource.getMovieDetails(movieId: movieId);
      return right(result);
    } on ServerException catch (exception) {
      return left(
        Failure(exception.message!),
      );
    }
  }


  @override
  Future<Either<Failure, void>> playMovieVideo(String movieVideoKey) async {
    try {
      final result = await _moviesDataSource.playMovieVideo(movieVideoKey);
      return right(result);
    } on LaunchUrlException catch (exception) {
      return left(
        Failure(exception.message!),
      );
    }
  }

  @override
  Future<Either<Failure, List<Movie>>> getRecommendedMovies({required int pageNumber, required int movieId}) async {
    try {
      final result = await _moviesDataSource.getRecommendedMovies(movieId: movieId, pageNumber: pageNumber);
      return right(result);
    } on ServerException catch (exception) {
      return left(
        Failure(exception.message!),
      );
    }
  }

  @override
  Future<Either<Failure, List<Movie>>> getSimilarMovies({required int pageNumber, required int movieId}) async {
    try {
      final result = await _moviesDataSource.getSimilarMovies(movieId: movieId, pageNumber: pageNumber);
      return right(result);
    } on ServerException catch (exception) {
      return left(
        Failure(exception.message!),
      );
    }
  }
}
