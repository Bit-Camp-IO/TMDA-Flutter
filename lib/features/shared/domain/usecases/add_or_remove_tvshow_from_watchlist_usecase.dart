import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:tmda/core/error/failure.dart';
import 'package:tmda/features/shared/domain/entities/tv_show.dart';
import 'package:tmda/features/shared/domain/repositories/watch_list_repository.dart';

@lazySingleton
class AddOrRemoveTvShowFromWatchListUseCase{
  final WatchListRepository _watchListRepository;
  const AddOrRemoveTvShowFromWatchListUseCase(this._watchListRepository);

  Future<Either<Failure, TvShow>> call({required int tvShowId, required bool isInWatchList}) async{
    return await _watchListRepository.addOrRemoveTvShowFromWatchList(isInWatchList: isInWatchList, tvShowId: tvShowId);
  }
}