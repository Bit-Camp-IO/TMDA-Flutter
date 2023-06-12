// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:tmda/core/error/failure.dart';
import 'package:tmda/features/movie/domain/entities/movie/movies.dart';
import 'package:tmda/features/movie/domain/repositories/movies_repository.dart';

class GetNowPlayingMoviesUseCase {
  final MoviesRepository movieRepository;
  const GetNowPlayingMoviesUseCase({required this.movieRepository});

  Future<Either<Failure, List<Movies>>> call() async{
    return await movieRepository.getNowPlayingMovies();
  }
}
