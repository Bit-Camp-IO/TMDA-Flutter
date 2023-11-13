import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:tmda/core/error/failure.dart';
import 'package:tmda/features/shared/domain/entities/tv_show.dart';
import 'package:tmda/features/shared/domain/repositories/watch_list_repository.dart';

@lazySingleton
class GetTvShowsWatchListUseCase{
  final WatchListRepository _watchListRepository;

  const GetTvShowsWatchListUseCase(this._watchListRepository);

  Future<Either<Failure, List<TvShow>>> call({int? pageNumber}) async{
    return await _watchListRepository.getTvShowsWatchList(pageNumber: pageNumber);
  }
}