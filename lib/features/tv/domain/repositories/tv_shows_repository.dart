import 'package:dartz/dartz.dart';
import 'package:tmda/core/error/failure.dart';
import 'package:tmda/features/tv/domain/entities/tv_details/season_episode.dart';
import 'package:tmda/features/tv/domain/entities/tv_details/tv_show_account_status.dart';
import 'package:tmda/features/tv/domain/entities/tv_details/tv_show_details.dart';
import 'package:tmda/features/tv/domain/entities/tv_details/tv_show_video.dart';
import 'package:tmda/features/tv/domain/entities/tv_show/tv_show.dart';


abstract class TvShowsRepository{
  Future<String> getSessionKey();
  Future<Either<Failure, List<TvShow>>> getTvShowsAiringToday(int pageNumber);
  Future<Either<Failure, List<TvShow>>> getTvShowsAiringThisWeek(int pageNumber);
  Future<Either<Failure, List<TvShow>>> getPopularTvShows(int pageNumber);
  Future<Either<Failure, List<TvShow>>> getTopRatedTvShows(int pageNumber);
  Future<Either<Failure, List<TvShow>>> getRecommendedTvShows({required int tvShowId,required int pageNumber});
  Future<Either<Failure, List<TvShow>>> getSimilarTvShows({required int tvShowId,required int pageNumber});
  Future<Either<Failure, TvShowDetails>> getTvShowDetails({required int tvShowId, required String sessionKey});
  Future<Either<Failure, List<SeasonEpisode>>> getSeasonEpisodes({required int tvShowId, required int seasonNumber});
  Future<Either<Failure, TvShowAccountStatus>> addOrRemoveTvFromWatchList({required int tvShowId, required bool isInWatchList, required String sessionId});
  Future<Either<Failure, void>> playTvShowVideo({required String youtubeVideoKey});
  Future<TvShowVideo> getEpisodeVideo({required int tvShowId, required seasonNumber, required int episodeNumber});
}