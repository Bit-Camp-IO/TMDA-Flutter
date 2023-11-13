import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:tmda/core/error/failure.dart';
import 'package:tmda/features/shared/domain/repositories/watch_list_repository.dart';

@lazySingleton
class GetMoviesWatchListIdsSetUseCase {
  final WatchListRepository _watchListRepository;

  const GetMoviesWatchListIdsSetUseCase(this._watchListRepository);

  Future<Either<Failure, Set<int>>> call() async {
    return await _watchListRepository.getMoviesWatchListIdsSet();
  }
}
