import 'package:dartz/dartz.dart';
import 'package:tmda/core/error/failure.dart';
import 'package:tmda/features/movie/domain/entities/movie/movies.dart';
import 'package:tmda/features/movie/domain/repositories/movies_repository.dart';

class GetTopRatedMoviesUseCase {
  final MoviesRepository movieRepository;
  const GetTopRatedMoviesUseCase({required this.movieRepository});
  Future<Either<Failure, List<Movies>>> call({required int pageNumber}) async{
    return await movieRepository.getTopRatedMovies(pageNumber);
  }
}
