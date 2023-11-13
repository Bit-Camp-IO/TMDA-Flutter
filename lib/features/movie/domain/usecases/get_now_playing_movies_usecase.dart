import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:tmda/core/error/failure.dart';
import 'package:tmda/features/shared/domain/entities/movie.dart';
import 'package:tmda/features/movie/domain/repositories/movies_repository.dart';

@lazySingleton
class GetNowPlayingMoviesUseCase {
  final MoviesRepository _moviesRepository;
  const GetNowPlayingMoviesUseCase(this._moviesRepository);

  Future<Either<Failure, List<Movie>>> call() async{
    return await _moviesRepository.getNowPlayingMovies();
  }
}
