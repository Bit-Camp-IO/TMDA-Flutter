import 'package:dartz/dartz.dart';
import 'package:tmda/core/error/failure.dart';
import 'package:tmda/features/movie/domain/entities/movies.dart';
import 'package:tmda/features/movie/domain/entities/movie_account_states.dart';
import 'package:tmda/features/movie/domain/entities/movie_details.dart';

abstract class MoviesRepository {
  Future<String> getSessionId();
  Future<Either<Failure, List<Movies>>> getNowPlayingMovies();
  Future<Either<Failure, List<Movies>>> getNewMovies();
  Future<Either<Failure, List<Movies>>> getPopularMovies();
  Future<Either<Failure, List<Movies>>> getTopRatedMovies();
  Future<Either<Failure, MovieDetails>> getMovieDetails({required int movieId, required String sessionId});
  Future<Either<Failure, void>> playMovieVideo(String movieVideoKey);
  Future<Either<Failure, MovieAccountStates>> addOrRemoveMovieFromWatchList({
    required int movieId,
    required bool isInWatchList,
    required String sessionId,
  });
  Future<Either<Failure, List<Movies>>> getAllNewMovies({required int pageNumber, required String sessionId});
  Future<Either<Failure, List<Movies>>> getAllPopularMovies({required int pageNumber, required String sessionId});
  Future<Either<Failure, List<Movies>>> getAllTopRatedMovies({required int pageNumber, required String sessionId});
  Future<Either<Failure, List<Movies>>> getAllSimilarMovies({required int pageNumber, required int movieId,  required String sessionId});
  Future<Either<Failure, List<Movies>>> getAllRecommendedMovies({required int pageNumber, required int movieId,  required String sessionId});
  Future<Either<Failure, MovieAccountStates>> getMovieStates({required int movieId,required String sessionId});
}
