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
  final MoviesDataSource moviesDataSource;
  final LocalDataSource localDataSource;
  MoviesRepositoryImpl({
    required this.moviesDataSource,
    required this.localDataSource,
  });
  @override
  Future<Either<Failure, List<MoviesModel>>> getNowPlayingMovies() async {
    try {
      final result = await moviesDataSource.getNowPlayingMovies();
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
      final result = await moviesDataSource.getPopularMovies();
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
      final result = await moviesDataSource.getTopRatedMovies();
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
      final result = await moviesDataSource.getNewMovies();
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
      final result = await moviesDataSource.getMovieDetails(
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
      return await localDataSource.getSessionId();
  }
  @override
  Future<Either<Failure, void>> playMovieVideo(String movieVideoKey) async {
    try {
      final result = await moviesDataSource.playMovieVideo(movieVideoKey);
      return right(result);
    } on LaunchUrlException catch (exception) {
      return left(
        Failure(exception.message!),
      );
    }
  }

  @override
  Future<Either<Failure, MovieAccountStatesModel>> addOrRemoveMovieFromWatchList({
    required int movieId,
    required bool isInWatchList,
    required String sessionId,
  }) async {
    try {
      final result = await moviesDataSource.addOrRemoveMovieFromWatchList(
          movieId: movieId, isInWatchList: isInWatchList, sessionId: sessionId);
      return right(result);
    } on ServerException catch (exception) {
      return left(
        Failure(exception.message!),
      );
    }
  }

  @override
  Future<Either<Failure, List<Movies>>> getAllNewMovies({required int pageNumber, required String sessionId}) async{
    try {
      final result = await moviesDataSource.getAllNewMovies(pageNumber: pageNumber, sessionId: sessionId);
      return right(result);
    } on ServerException catch (exception) {
      return left(
        Failure(exception.message!),
      );
    }
  }

  @override
  Future<Either<Failure, List<Movies>>> getAllPopularMovies({required int pageNumber, required String sessionId}) async{
    try {
      final result = await moviesDataSource.getAllPopularMovies(pageNumber: pageNumber, sessionId: sessionId);
      return right(result);
    } on ServerException catch (exception) {
      return left(
        Failure(exception.message!),
      );
    }
  }

  @override
  Future<Either<Failure, List<Movies>>> getAllTopRatedMovies({required int pageNumber, required String sessionId}) async{
    try {
      final result = await moviesDataSource.getAllTopRatedMovies(pageNumber: pageNumber, sessionId: sessionId);
      return right(result);
    } on ServerException catch (exception) {
      return left(
        Failure(exception.message!),
      );
    }
  }

  @override
  Future<Either<Failure, List<Movies>>> getAllRecommendedMovies({required int pageNumber, required int movieId, required String sessionId}) async{
    try {
      final result = await moviesDataSource.getAllRecommendedMovies(movieId: movieId, pageNumber: pageNumber, sessionId: sessionId);
      return right(result);
    } on ServerException catch (exception) {
      return left(
        Failure(exception.message!),
      );
    }
  }

  @override
  Future<Either<Failure, List<Movies>>> getAllSimilarMovies({required int pageNumber, required int movieId, required String sessionId}) async{
    try {
      final result = await moviesDataSource.getAllSimilarMovies(movieId: movieId, pageNumber: pageNumber, sessionId: sessionId);
      return right(result);
    } on ServerException catch (exception) {
      return left(
        Failure(exception.message!),
      );
    }
  }

  @override
  Future<Either<Failure, MovieAccountStates>> getMovieStates({required int movieId, required String sessionId}) async{
    try{
      final result = await moviesDataSource.getMovieStates(sessionId: sessionId, movieId: movieId);
      return right(result);
    }on ServerException catch (exception) {
      return left(
        Failure(exception.message!),
      );
    }
  }
}
