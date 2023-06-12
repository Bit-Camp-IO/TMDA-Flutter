import 'package:dartz/dartz.dart';
import 'package:tmda/core/error/failure.dart';
import 'package:tmda/features/movie/domain/entities/movie_details/movie_account_states.dart';
import 'package:tmda/features/movie/domain/repositories/movies_repository.dart';

class GetMovieAccountStatusUseCase {
  MoviesRepository moviesRepository;
  GetMovieAccountStatusUseCase({
    required this.moviesRepository,
  });

  Future<Either<Failure, MovieAccountStatus>> call({required int movieId, required String sessionKey}) async{
    return await moviesRepository.getAccountStates(movieId: movieId, sessionId: sessionKey);
  }
}
