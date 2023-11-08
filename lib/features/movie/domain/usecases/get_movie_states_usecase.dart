import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:tmda/core/error/failure.dart';
import 'package:tmda/features/movie/domain/entities/movie_account_states.dart';
import 'package:tmda/features/movie/domain/repositories/movies_repository.dart';

@lazySingleton
class GetMovieStateUseCase {
  final MoviesRepository _moviesRepository;
  const GetMovieStateUseCase(this._moviesRepository);

  Future<Either<Failure, MovieAccountStates>> call({required int movieId}) async{
    return await _moviesRepository.getMovieStates(movieId: movieId);
  }
}
