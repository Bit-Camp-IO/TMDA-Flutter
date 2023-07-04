import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:tmda/core/error/failure.dart';
import 'package:tmda/features/movie/domain/entities/movies.dart';
import 'package:tmda/features/movie/domain/repositories/movies_repository.dart';

@lazySingleton
class GetPopularMoviesUseCase {
  final MoviesRepository _moviesRepository;
  const GetPopularMoviesUseCase(this._moviesRepository);

  Future<Either<Failure, List<Movies>>> call() async{
    return await _moviesRepository.getPopularMovies();
  }
}
