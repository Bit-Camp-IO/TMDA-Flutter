import 'package:dartz/dartz.dart';
import 'package:tmda/core/error/failure.dart';
import 'package:tmda/features/tv/domain/entities/tv_show_details.dart';
import 'package:tmda/features/shared/domain/entities/tv_show.dart';

abstract class TvShowsRepository{
  Future<Either<Failure, List<TvShow>>> getTvShowsAiringToday(int pageNumber);
  Future<Either<Failure, List<TvShow>>> getTvShowsAiringThisWeek(int pageNumber);
  Future<Either<Failure, List<TvShow>>> getPopularTvShows(int pageNumber);
  Future<Either<Failure, List<TvShow>>> getTopRatedTvShows(int pageNumber);
  Future<Either<Failure, TvShowDetails>> getTvShowDetails({required int tvShowId});
  Future<Either<Failure, void>> playTvShowVideo({required String youtubeVideoKey});
  Future<Either<Failure, List<TvShow>>> getSimilarTvShows({required int pageNumber, required int tvShowId});
  Future<Either<Failure, List<TvShow>>> getRecommendedTvShows({required int pageNumber, required int tvShowId});
}