import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:tmda/core/error/exception.dart';
import 'package:tmda/core/error/failure.dart';
import 'package:tmda/core/util/shared_data_source/local_data_source.dart';
import 'package:tmda/features/movie/data/datasources/movies_data_source.dart';
import 'package:tmda/features/movie/data/models/movies_model.dart';
import 'package:tmda/features/movie/data/models/movie_account_states_model.dart';
import 'package:tmda/features/movie/data/models/movie_details_model.dart';
import 'package:tmda/features/movie/domain/entities/movie_account_states.dart';
import 'package:tmda/features/movie/domain/entities/movies.dart';
import 'package:tmda/features/movie/domain/repositories/movies_repository.dart';

@LazySingleton(as: MoviesRepository)
class MoviesRepositoryImpl extends MoviesRepository {
  final MoviesDataSource _moviesDataSource;
  final LocalDataSource _localDataSource;

  MoviesRepositoryImpl(this._moviesDataSource, this._localDataSource);

  @override
  Future<Either<Failure, List<MoviesModel>>> getNowPlayingMovies() async {
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
  Future<Either<Failure, List<MoviesModel>>> getPopularMovies() async {
    try {
      final result = await _moviesDataSource.getPopularMovies();
      return right(result);
    } on ServerException catch (exception) {
      return left(
        Failure(exception.message!),
      );
    }
  }

  @override
  Future<Either<Failure, List<MoviesModel>>> getTopRatedMovies() async {
    try {
      final result = await _moviesDataSource.getTopRatedMovies();
      return right(result);
    } on ServerException catch (exception) {
      return left(
        Failure(exception.message!),
      );
    }
  }

  @override
  Future<Either<Failure, List<MoviesModel>>> getNewMovies() async {
    try {
      final result = await _moviesDataSource.getNewMovies();
      return right(result);
    } on ServerException catch (exception) {
      return left(
        Failure(exception.message!),
      );
    }
  }

  @override
  Future<Either<Failure, MovieDetailsModel>> getMovieDetails(
      {required int movieId, required String sessionId}) async {
    try {
      final result = await _moviesDataSource.getMovieDetails(
          movieId: movieId, sessionId: sessionId);
      return right(result);
    } on ServerException catch (exception) {
      return left(
        Failure(exception.message!),
      );
    }
  }

  @override
  Future<String> getSessionId() async {
    return await _localDataSource.getSessionId();
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
  Future<Either<Failure, MovieAccountStatesModel>>
      addOrRemoveMovieFromWatchList({
    required int movieId,
    required bool isInWatchList,
    required String sessionId,
  }) async {
    try {
      final result = await _moviesDataSource.addOrRemoveMovieFromWatchList(
          movieId: movieId, isInWatchList: isInWatchList, sessionId: sessionId);
      return right(result);
    } on ServerException catch (exception) {
      return left(
        Failure(exception.message!),
      );
    }
  }

  @override
  Future<Either<Failure, List<Movies>>> getAllNewMovies(
      {required int pageNumber, required String sessionId}) async {
    try {
      final result = await _moviesDataSource.getAllNewMovies(
          pageNumber: pageNumber, sessionId: sessionId);
      return right(result);
    } on ServerException catch (exception) {
      return left(
        Failure(exception.message!),
      );
    }
  }

  @override
  Future<Either<Failure, List<Movies>>> getAllPopularMovies(
      {required int pageNumber, required String sessionId}) async {
    try {
      final result = await _moviesDataSource.getAllPopularMovies(
          pageNumber: pageNumber, sessionId: sessionId);
      return right(result);
    } on ServerException catch (exception) {
      return left(
        Failure(exception.message!),
      );
    }
  }

  @override
  Future<Either<Failure, List<Movies>>> getAllTopRatedMovies(
      {required int pageNumber, required String sessionId}) async {
    try {
      final result = await _moviesDataSource.getAllTopRatedMovies(
          pageNumber: pageNumber, sessionId: sessionId);
      return right(result);
    } on ServerException catch (exception) {
      return left(
        Failure(exception.message!),
      );
    }
  }

  @override
  Future<Either<Failure, List<Movies>>> getAllRecommendedMovies(
      {required int pageNumber,
      required int movieId,
      required String sessionId}) async {
    try {
      final result = await _moviesDataSource.getAllRecommendedMovies(
          movieId: movieId, pageNumber: pageNumber, sessionId: sessionId);
      return right(result);
    } on ServerException catch (exception) {
      return left(
        Failure(exception.message!),
      );
    }
  }

  @override
  Future<Either<Failure, List<Movies>>> getAllSimilarMovies(
      {required int pageNumber,
      required int movieId,
      required String sessionId}) async {
    try {
      final result = await _moviesDataSource.getAllSimilarMovies(
          movieId: movieId, pageNumber: pageNumber, sessionId: sessionId);
      return right(result);
    } on ServerException catch (exception) {
      return left(
        Failure(exception.message!),
      );
    }
  }

  @override
  Future<Either<Failure, MovieAccountStates>> getMovieStates(
      {required int movieId, required String sessionId}) async {
    try {
      final result = await _moviesDataSource.getMovieStates(
          sessionId: sessionId, movieId: movieId);
      return right(result);
    } on ServerException catch (exception) {
      return left(
        Failure(exception.message!),
      );
    }
  }
}
