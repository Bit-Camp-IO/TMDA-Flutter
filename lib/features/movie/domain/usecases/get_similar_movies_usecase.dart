import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:tmda/core/error/failure.dart';
import 'package:tmda/features/shared/domain/entities/movie.dart';
import 'package:tmda/features/movie/domain/repositories/movies_repository.dart';

@lazySingleton
class GetAllSimilarMoviesUseCase {
  final MoviesRepository _moviesRepository;
  const GetAllSimilarMoviesUseCase(this._moviesRepository);

  Future<Either<Failure, List<Movie>>> call({required int pageNumber, required int movieId}) async{
    return await _moviesRepository.getSimilarMovies(pageNumber: pageNumber, movieId: movieId);
  }
}
