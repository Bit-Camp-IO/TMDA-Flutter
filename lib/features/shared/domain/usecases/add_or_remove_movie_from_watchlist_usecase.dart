import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:tmda/core/error/failure.dart';
import 'package:tmda/features/shared/domain/entities/movie.dart';
import 'package:tmda/features/shared/domain/repositories/watch_list_repository.dart';

@lazySingleton
class AddOrRemoveMovieFromWatchListUseCase{
  final WatchListRepository _watchListRepository;
  const AddOrRemoveMovieFromWatchListUseCase(this._watchListRepository);

  Future<Either<Failure, Movie>> call({required int movieId, required bool isInWatchList}) async{
    return await _watchListRepository.addOrRemoveMovieFromWatchList(isInWatchList: isInWatchList, movieId: movieId);
  }
}