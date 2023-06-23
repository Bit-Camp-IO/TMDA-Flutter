import 'package:injectable/injectable.dart';
import 'package:tmda/features/tv/domain/entities/tv_details/tv_show_video.dart';
import 'package:tmda/features/tv/domain/repositories/tv_shows_repository.dart';

@lazySingleton
class GetEpisodeVideoUseCase {
  final TvShowsRepository tvShowsRepository; 
  const GetEpisodeVideoUseCase({
    required this.tvShowsRepository,
  });
  Future<TvShowVideo> call({required int tvShowId, required seasonNumber, required int episodeNumber}) async {
    return await tvShowsRepository.getEpisodeVideo(tvShowId: tvShowId, seasonNumber: seasonNumber, episodeNumber: episodeNumber);
  }
}
