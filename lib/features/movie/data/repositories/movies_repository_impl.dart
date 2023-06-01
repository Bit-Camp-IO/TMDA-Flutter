import 'package:dartz/dartz.dart';
import 'package:tmda/core/error/failure.dart';
import 'package:tmda/features/movie/data/datasources/movies_data_source.dart';
import 'package:tmda/features/movie/data/models/movies_model.dart';
import 'package:tmda/features/movie/domain/entities/movie_details.dart';
import 'package:tmda/features/movie/domain/repositories/movies_repository.dart';

class MoviesRepositoryImpl extends MoviesRepository {
  final MoviesDataSource moviesDataSource;
  MoviesRepositoryImpl({
    required this.moviesDataSource,
  });
  @override
  Future<Either<Failure, List<MoviesModel>>> getNowPlayingMovies() async {
    try {
      final result = await moviesDataSource.getNowPlayingMovies();
      return right(result);
    } on Exception {
      return left(Failure());
    }
  }

  @override
  Future<Either<Failure, List<MoviesModel>>> getPopularMovies() async {
    try {
      final result = await moviesDataSource.getPopularMovies();
      return right(result);
    } on Exception {
      return left(Failure());
    }
  }

  @override
  Future<Either<Failure, List<MoviesModel>>> getTopRatedMovies() async {
    try {
      final result = await moviesDataSource.getTopRatedMovies();
      return right(result);
    } on Exception {
      return left(Failure());
    }
  }

  @override
  Future<Either<Failure, List<MoviesModel>>> getUpcomingMovies() async {
    try {
      final result = await moviesDataSource.getUpComingMovies();
      return right(result);
    } on Exception {
      return left(Failure());
    }
  }

  @override
  Future<Either<Failure, MovieDetails>> getMovieDetails(String movieId) async {
    try {
      final result = await moviesDataSource.getMovieDetails(movieId);
      return right(result);
    } on Exception {
      return left(Failure());
    }
  }
}
