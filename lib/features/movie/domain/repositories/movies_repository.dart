import 'package:dartz/dartz.dart';
import 'package:tmda/core/error/failure.dart';
import 'package:tmda/features/movie/domain/entities/movie/movies.dart';
import 'package:tmda/features/movie/domain/entities/movie_details/movie_account_states.dart';
import 'package:tmda/features/movie/domain/entities/movie_details/movie_cast.dart';
import 'package:tmda/features/movie/domain/entities/movie_details/movie_details.dart';
import 'package:tmda/features/movie/domain/entities/movie_details/movie_reviews.dart';

abstract class MoviesRepository {
  Future<Either<Failure, List<Movies>>> getNowPlayingMovies();
  Future<Either<Failure, List<Movies>>> getNewMovies(int pageNumber);
  Future<Either<Failure, List<Movies>>> getPopularMovies(int pageNumber);
  Future<Either<Failure, List<Movies>>> getTopRatedMovies(int pageNumber);
  Future<Either<Failure, MovieDetails>> getMovieDetails({required int movieId, required String sessionId});
  Future<Either<Failure, List<MovieCast>>> getMovieCast(int movieId);
  Future<Either<Failure, List<Movies>>> getMoviesLikeThis({required int movieId, required int pageNumber});
  Future<Either<Failure, List<MovieReviews>>> getMovieReviews(int movieId);
  Future<String> getSessionKey();
  Future<Either<Failure, void>> playMovieVideo(String movieVideoKey);
  Future<Either<Failure, MovieAccountStatus>> addOrRemoveMovieFromWatchList({
    required int movieId,
    required bool isInWatchList,
    required String sessionId,
  });
}
