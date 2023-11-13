import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:tmda/core/error/failure.dart';
import 'package:tmda/features/shared/domain/entities/movie.dart';
import 'package:tmda/features/movie/domain/repositories/movies_repository.dart';

@lazySingleton
class GetTopRatedMoviesUseCase {
  final MoviesRepository _moviesRepository;
  const GetTopRatedMoviesUseCase(this._moviesRepository);
  Future<Either<Failure, List<Movie>>> call({int? pageNumber}) async{
    return await _moviesRepository.getTopRatedMovies(pageNumber: pageNumber);
  }
}
