import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:tmda/core/error/failure.dart';
import 'package:tmda/features/tv/domain/entities/tv_show.dart';
import 'package:tmda/features/tv/domain/repositories/tv_shows_repository.dart';

@lazySingleton
class GetSimilarTvShowsUseCase {
  final TvShowsRepository tvShowsRepository;
  GetSimilarTvShowsUseCase({required this.tvShowsRepository});

  Future<Either<Failure, List<TvShow>>> call({required int tvShowId, required int pageNumber}) async{
    return await tvShowsRepository.getSimilarTvShows(tvShowId: tvShowId);
  }
}
