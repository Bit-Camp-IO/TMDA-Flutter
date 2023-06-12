import 'package:dartz/dartz.dart';
import 'package:tmda/core/error/failure.dart';
import 'package:tmda/features/movie/domain/repositories/movies_repository.dart';

class PlayMovieVideoUseCase {
  final MoviesRepository moviesRepository;
  const PlayMovieVideoUseCase({required this.moviesRepository});

  Future<Either<Failure, void>> call(String movieVideoKey) async{
    return await moviesRepository.playMovieTrailer(movieVideoKey);
  }
}
