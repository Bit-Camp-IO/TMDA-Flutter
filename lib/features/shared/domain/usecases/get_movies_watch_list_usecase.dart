import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:tmda/core/error/failure.dart';
import 'package:tmda/features/shared/domain/entities/movie.dart';
import 'package:tmda/features/shared/domain/repositories/watch_list_repository.dart';

@lazySingleton
class GetMoviesWatchListUseCase{
  final WatchListRepository _watchListRepository;

  const GetMoviesWatchListUseCase(this._watchListRepository);
  Future<Either<Failure, List<Movie>>> call({int? pageNumber}) async{
      return await _watchListRepository.getMoviesWatchList(pageNumber: pageNumber);
  }
}