import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:tmda/core/error/failure.dart';
import 'package:tmda/features/movie/domain/entities/movie_account_states.dart';
import 'package:tmda/features/movie/domain/repositories/movies_repository.dart';

@lazySingleton
class AddOrRemoveMovieFromWatchListUseCase {
  final MoviesRepository _moviesRepository;
  const AddOrRemoveMovieFromWatchListUseCase(this._moviesRepository);

  Future<Either<Failure, MovieAccountStates>> call({
    required int movieId,
    required bool isInWatchList,
    required String sessionId,
  }) async {
    return await _moviesRepository.addOrRemoveMovieFromWatchList(
      movieId: movieId,
      sessionId: sessionId,
      isInWatchList: isInWatchList,
    );
  }
}
