import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:tmda/core/error/failure.dart';
import 'package:tmda/features/movie/domain/entities/movie_account_states.dart';
import 'package:tmda/features/movie/domain/repositories/movies_repository.dart';

@lazySingleton
class AddOrRemoveMovieFromWatchListUseCase {
  final MoviesRepository moviesRepository;
  AddOrRemoveMovieFromWatchListUseCase({required this.moviesRepository});

  Future<Either<Failure, MovieAccountStates>> call({
    required int movieId,
    required bool isInWatchList,
    required String sessionKey,
  }) async {
    return await moviesRepository.addOrRemoveMovieFromWatchList(
      movieId: movieId,
      sessionId: sessionKey,
      isInWatchList: isInWatchList,
    );
  }
}
