import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:tmda/core/error/failure.dart';
import 'package:tmda/features/tv/domain/entities/tv_show.dart';
import 'package:tmda/features/tv/domain/repositories/tv_shows_repository.dart';

@lazySingleton
class GetRecommendedTvShowsUseCase {
  final TvShowsRepository tvShowsRepository;
  GetRecommendedTvShowsUseCase({required this.tvShowsRepository});

  Future<Either<Failure, List<TvShow>>> call({required int tvShowId, required int pageNumber}) async{
    return await tvShowsRepository.getRecommendedTvShows(tvShowId: tvShowId);
  }
}
