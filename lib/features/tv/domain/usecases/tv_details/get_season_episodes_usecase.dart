import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:tmda/core/error/failure.dart';
import 'package:tmda/features/tv/domain/entities/tv_details/season_episode.dart';
import 'package:tmda/features/tv/domain/repositories/tv_shows_repository.dart';

@lazySingleton
class GetSeasonsEpisodesUseCase {
  final TvShowsRepository tvShowsRepository;
  const GetSeasonsEpisodesUseCase({required this.tvShowsRepository});

  Future<Either<Failure, List<SeasonEpisode>>> call({required int tvShowId, required int seasonNumber}) async{
    return await tvShowsRepository.getSeasonEpisodes(tvShowId: tvShowId, seasonNumber: seasonNumber);
  }
}
