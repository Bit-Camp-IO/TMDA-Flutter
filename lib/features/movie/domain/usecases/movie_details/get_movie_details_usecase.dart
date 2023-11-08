import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:tmda/core/error/failure.dart';
import 'package:tmda/features/movie/domain/entities/movie_details.dart';
import 'package:tmda/features/movie/domain/repositories/movies_repository.dart';

@lazySingleton
class GetMovieDetailsUseCase {
  final MoviesRepository _moviesRepository;
  const GetMovieDetailsUseCase(this._moviesRepository);

  Future<Either<Failure, MovieDetails>> call({required int movieId}) async {
    return await _moviesRepository.getMovieDetails(movieId: movieId);
  }
}
