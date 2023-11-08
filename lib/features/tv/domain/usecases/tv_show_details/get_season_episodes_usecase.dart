import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:tmda/core/error/failure.dart';
import 'package:tmda/features/tv/domain/entities/season_episode.dart';
import 'package:tmda/features/tv/domain/repositories/tv_shows_repository.dart';

@lazySingleton
class GetSeasonsEpisodesUseCase {
  final TvShowsRepository _tvShowsRepository;
  const GetSeasonsEpisodesUseCase(this._tvShowsRepository);

  Future<Either<Failure, List<List<SeasonEpisode>>>> call({required int tvShowId, required List<int> seasonsNumbers}) async{
    return await _tvShowsRepository.getSeasonEpisodes(tvShowId: tvShowId, seasonsNumbers: seasonsNumbers);
  }
}
