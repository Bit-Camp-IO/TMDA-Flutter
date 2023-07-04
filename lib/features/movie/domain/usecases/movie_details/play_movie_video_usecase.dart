import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:tmda/core/error/failure.dart';
import 'package:tmda/features/movie/domain/repositories/movies_repository.dart';

@lazySingleton
class PlayMovieVideoUseCase {
  final MoviesRepository _moviesRepository;
  const PlayMovieVideoUseCase(this._moviesRepository);

  Future<Either<Failure, void>> call(String movieVideoKey) async{
    return await _moviesRepository.playMovieVideo(movieVideoKey);
  }
}
