import 'package:dartz/dartz.dart';
import 'package:tmda/core/error/failure.dart';
import 'package:tmda/features/shared/domain/entities/movie.dart';
import 'package:tmda/features/movie/domain/entities/movie_details.dart';

abstract class MoviesRepository {
  Future<Either<Failure, List<Movie>>> getNowPlayingMovies();
  Future<Either<Failure, List<Movie>>> getNewMovies({int? pageNumber});
  Future<Either<Failure, List<Movie>>> getPopularMovies({int? pageNumber});
  Future<Either<Failure, List<Movie>>> getTopRatedMovies({int? pageNumber});
  Future<Either<Failure, MovieDetails>> getMovieDetails({required int movieId});
  Future<Either<Failure, void>> playMovieVideo(String movieVideoKey);
  Future<Either<Failure, List<Movie>>> getSimilarMovies({required int pageNumber, required int movieId});
  Future<Either<Failure, List<Movie>>> getRecommendedMovies({required int pageNumber, required int movieId});
}
