import 'package:dartz/dartz.dart';
import 'package:tmda/core/error/failure.dart';
import 'package:tmda/features/movie/domain/entities/movie_details/movie_account_states.dart';
import 'package:tmda/features/movie/domain/repositories/movies_repository.dart';

class AddOrRemoveFromWatchListUseCase {
  final MoviesRepository moviesRepository;
  AddOrRemoveFromWatchListUseCase({required this.moviesRepository});

  Future<Either<Failure, MovieAccountStatus>> call({
    required int movieId,
    required bool isInWatchList,
    required String sessionKey,
  }) async {
    return await moviesRepository.addOrRemoveFromWatchList(
      movieId: movieId,
      sessionId: sessionKey,
      isInWatchList: isInWatchList,
    );
  }
}
