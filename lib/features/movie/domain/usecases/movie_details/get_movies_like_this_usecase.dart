import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:tmda/core/error/failure.dart';
import 'package:tmda/features/movie/domain/entities/movie/movies.dart';
import 'package:tmda/features/movie/domain/repositories/movies_repository.dart';

@lazySingleton
class GetMoviesLikeThisUseCase {
  final MoviesRepository moviesRepository;
  const GetMoviesLikeThisUseCase({required this.moviesRepository});

  Future<Either<Failure, List<Movies>>> call({required int movieId,required int pageNumber}) async {
    return await moviesRepository.getMoviesLikeThis(movieId: movieId, pageNumber: pageNumber);
  }
}