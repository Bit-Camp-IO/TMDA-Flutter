import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:tmda/core/error/failure.dart';
import 'package:tmda/features/shared/domain/entities/tv_show.dart';
import 'package:tmda/features/tv/domain/repositories/tv_shows_repository.dart';

@lazySingleton
class GetTopRatedTvShowsUseCase {
  final TvShowsRepository _tvShowsRepository;
  const GetTopRatedTvShowsUseCase(this._tvShowsRepository);

  Future<Either<Failure, List<TvShow>>> call(int pageNumber) async{
    return await _tvShowsRepository.getTopRatedTvShows(pageNumber);
  }
}
