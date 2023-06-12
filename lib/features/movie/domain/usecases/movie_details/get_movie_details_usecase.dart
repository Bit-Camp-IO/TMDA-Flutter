import 'package:dartz/dartz.dart';
import 'package:tmda/core/error/failure.dart';
import 'package:tmda/features/movie/domain/entities/movie_details/movie_details.dart';
import 'package:tmda/features/movie/domain/repositories/movies_repository.dart';

class GetMovieDetailsUseCase {
  final MoviesRepository moviesRepository;
  const GetMovieDetailsUseCase({required this.moviesRepository});

  Future<Either<Failure, MovieDetails>> call({required int movieId, required String sessionId}) async {
    return await moviesRepository.getMovieDetails(movieId: movieId, sessionId: sessionId);
  }
}
