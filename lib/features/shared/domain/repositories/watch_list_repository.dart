import 'package:dartz/dartz.dart';
import 'package:tmda/core/error/failure.dart';
import 'package:tmda/features/shared/domain/entities/movie.dart';
import 'package:tmda/features/shared/domain/entities/tv_show.dart';

abstract class WatchListRepository{
  Future<Either<Failure, Set<int>>> getMoviesWatchListIdsSet();
  Future<Either<Failure, Set<int>>> getTvShowsWatchListIdsSet();
  Future<Either<Failure, List<Movie>>> getMoviesWatchList({int? pageNumber});
  Future<Either<Failure, List<TvShow>>> getTvShowsWatchList({int? pageNumber});
  Future<Either<Failure, Movie>> addOrRemoveMovieFromWatchList({required bool isInWatchList, required int movieId});
  Future<Either<Failure, TvShow>> addOrRemoveTvShowFromWatchList({required bool isInWatchList, required int tvShowId});
}