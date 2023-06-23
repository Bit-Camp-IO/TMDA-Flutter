import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:tmda/core/error/failure.dart';
import 'package:tmda/features/movie/domain/entities/movie_details/movie_reviews.dart';
import 'package:tmda/features/movie/domain/repositories/movies_repository.dart';

@lazySingleton
class GetMovieReviewsUseCase {
  final MoviesRepository moviesRepository;
  const GetMovieReviewsUseCase({required this.moviesRepository});

  Future<Either<Failure, List<MovieReviews>>> call(int movieId) async {
    return await moviesRepository.getMovieReviews(movieId);
  }
}
