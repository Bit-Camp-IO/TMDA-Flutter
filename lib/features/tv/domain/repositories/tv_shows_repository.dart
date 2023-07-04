import 'package:dartz/dartz.dart';
import 'package:tmda/core/error/failure.dart';
import 'package:tmda/features/tv/domain/entities/season_episode.dart';
import 'package:tmda/features/tv/domain/entities/tv_show_account_states.dart';
import 'package:tmda/features/tv/domain/entities/tv_show_details.dart';
import 'package:tmda/features/tv/domain/entities/tv_show.dart';


abstract class TvShowsRepository{
  Future<String> getSessionId();
  Future<Either<Failure, List<TvShow>>> getTvShowsAiringToday(int pageNumber);
  Future<Either<Failure, List<TvShow>>> getTvShowsAiringThisWeek(int pageNumber);
  Future<Either<Failure, List<TvShow>>> getPopularTvShows(int pageNumber);
  Future<Either<Failure, List<TvShow>>> getTopRatedTvShows(int pageNumber);
  Future<Either<Failure, List<TvShow>>> getRecommendedTvShows({required int tvShowId});
  Future<Either<Failure, List<TvShow>>> getSimilarTvShows({required int tvShowId});
  Future<Either<Failure, TvShowDetails>> getTvShowDetails({required int tvShowId, required String sessionId});
  Future<Either<Failure, List<SeasonEpisode>>> getSeasonEpisodes({required int tvShowId, required int seasonId});
  Future<Either<Failure, TvShowAccountStates>> addOrRemoveTvFromWatchList({required int tvShowId, required bool isInWatchList, required String sessionId});
  Future<Either<Failure, void>> playTvShowVideo({required String youtubeVideoKey});
  Future<Either<Failure, List<TvShow>>> getAllAiringTodayTvShows({required int pageNumber, required String sessionId});
  Future<Either<Failure, List<TvShow>>> getAllPopularTvShows({required int pageNumber, required String sessionId});
  Future<Either<Failure, List<TvShow>>> getAllTopRatedTvShows({required int pageNumber, required String sessionId});
  Future<Either<Failure, List<TvShow>>> getAllSimilarTvShows({required int pageNumber, required int tvShowId,  required String sessionId});
  Future<Either<Failure, List<TvShow>>> getAllRecommendedTvShows({required int pageNumber, required int tvShowId,  required String sessionId});
  Future<Either<Failure, TvShowAccountStates>> getTvShowStates({required int tvShowId,required String sessionId});
}