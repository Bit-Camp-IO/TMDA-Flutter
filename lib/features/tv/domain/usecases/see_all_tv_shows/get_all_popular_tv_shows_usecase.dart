import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:tmda/core/error/failure.dart';
import 'package:tmda/features/tv/domain/entities/tv_show.dart';
import 'package:tmda/features/tv/domain/repositories/tv_shows_repository.dart';

@lazySingleton
class GetAllPopularTvShowsUseCase {
  final TvShowsRepository _tvShowsRepository;
  const GetAllPopularTvShowsUseCase(this._tvShowsRepository);

  Future<Either<Failure, List<TvShow>>> call({required int pageNumber}) async{
    return await _tvShowsRepository.getAllPopularTvShows(pageNumber: pageNumber);
  }
}
