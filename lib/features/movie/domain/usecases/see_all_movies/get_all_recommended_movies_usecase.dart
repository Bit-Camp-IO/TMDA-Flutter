import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:tmda/core/error/failure.dart';
import 'package:tmda/features/movie/domain/entities/movies.dart';
import 'package:tmda/features/movie/domain/repositories/movies_repository.dart';

@lazySingleton
class GetAllRecommendedMoviesUseCase {
  final MoviesRepository _moviesRepository;
  const GetAllRecommendedMoviesUseCase(this._moviesRepository);

  Future<Either<Failure, List<Movies>>> call({required int pageNumber, required int movieId}) async{
    return await _moviesRepository.getAllRecommendedMovies(pageNumber: pageNumber, movieId: movieId);
  }
}
