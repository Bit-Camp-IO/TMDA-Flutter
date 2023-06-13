import 'package:dartz/dartz.dart';
import 'package:tmda/core/error/failure.dart';
import 'package:tmda/features/tv/domain/entities/tv_show/tv_show.dart';

abstract class TvRepository{
  Future<Either<Failure, List<TvShow>>> getTvShowsAiringToday();
  Future<Either<Failure, List<TvShow>>> getTvShowsAiringThisWeek(int pageNumber);
  Future<Either<Failure, List<TvShow>>> getPopularTvShows(int pageNumber);
  Future<Either<Failure, List<TvShow>>> getTopRatedTvShows(int pageNumber);
}