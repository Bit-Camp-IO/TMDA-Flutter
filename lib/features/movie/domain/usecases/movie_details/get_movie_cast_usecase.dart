import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:tmda/core/error/failure.dart';
import 'package:tmda/features/movie/domain/entities/movie_details/movie_cast.dart';
import 'package:tmda/features/movie/domain/repositories/movies_repository.dart';

@lazySingleton
class GetMovieCastUseCase {
  final MoviesRepository moviesRepository;
  const GetMovieCastUseCase({required this.moviesRepository});

  Future<Either<Failure, List<MovieCast>>> call(int movieId) async {
    return await moviesRepository.getMovieCast(movieId);
  }
}
