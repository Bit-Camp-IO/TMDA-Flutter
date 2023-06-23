import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:tmda/core/error/failure.dart';
import 'package:tmda/features/movie/domain/repositories/movies_repository.dart';

@lazySingleton
class PlayMovieVideoUseCase {
  final MoviesRepository moviesRepository;
  const PlayMovieVideoUseCase({required this.moviesRepository});

  Future<Either<Failure, void>> call(String movieVideoKey) async{
    return await moviesRepository.playMovieVideo(movieVideoKey);
  }
}
