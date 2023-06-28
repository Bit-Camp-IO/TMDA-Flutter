import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:tmda/core/error/failure.dart';
import 'package:tmda/features/movie/domain/entities/movie_account_states.dart';
import 'package:tmda/features/movie/domain/repositories/movies_repository.dart';

@lazySingleton
class GetMovieStateUseCase {
  final MoviesRepository moviesRepository;
  const GetMovieStateUseCase({required this.moviesRepository});

  Future<Either<Failure, MovieAccountStates>> call({required int movieId, required String sessionId}) async{
    return await moviesRepository.getMovieStates(movieId: movieId, sessionId: sessionId);
  }
}
