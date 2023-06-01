// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:tmda/core/error/failure.dart';
import 'package:tmda/features/movie/domain/entities/movie_details.dart';
import 'package:tmda/features/movie/domain/repositories/movies_repository.dart';

class GetMovieDetailsUseCase {
  MoviesRepository moviesRepository;
  GetMovieDetailsUseCase({required this.moviesRepository});

  Future<Either<Failure, MovieDetails>> call(String movieId) async {
    return await moviesRepository.getMovieDetails(movieId);
  }
}
