import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:tmda/core/error/exception.dart';
import 'package:tmda/core/error/failure.dart';
import 'package:tmda/features/shared/data/datasources/watch_list_datasource.dart';
import 'package:tmda/features/shared/data/models/movies_model.dart';
import 'package:tmda/features/shared/data/models/tv_show_model.dart';
import 'package:tmda/features/shared/domain/entities/movie.dart';
import 'package:tmda/features/shared/domain/entities/tv_show.dart';
import 'package:tmda/features/shared/domain/repositories/watch_list_repository.dart';

@LazySingleton(as: WatchListRepository)
class WatchListRepositoryImpl extends WatchListRepository{
  final WatchListDataSource _watchListDataSource;

  WatchListRepositoryImpl(this._watchListDataSource);

  @override
  Future<Either<Failure, Set<int>>> getMoviesWatchListIdsSet() async{
    try{
      final Set<int> moviesWatchSet = await _watchListDataSource.getMoviesWatchListIdsSet();
      return right(moviesWatchSet);
    }on ServerException catch(exception){
      return left(ApiFailure(exception.message!));
    }
  }

  @override
  Future<Either<Failure, Set<int>>> getTvShowsWatchListIdsSet() async{
    try{
      final Set<int> tvShowsWatchList = await _watchListDataSource.getTvShowsWatchListIdsSet();
      return right(tvShowsWatchList);
    }on ServerException catch(exception){
      return left(ApiFailure(exception.message!));
    }
  }

  @override
  Future<Either<Failure, List<Movie>>> getMoviesWatchList({int? pageNumber}) async{
    try{
      final List<MovieModel> moviesWatchList = await _watchListDataSource.getMoviesWatchList(pageNumber: pageNumber);
      return right(moviesWatchList);
    }on ServerException catch(exception){
      return left(ApiFailure(exception.message!));
    }
  }

  @override
  Future<Either<Failure, List<TvShow>>> getTvShowsWatchList({int? pageNumber}) async{
    try{
      final List<TvShowModel> tvShowsWatchList = await _watchListDataSource.getTvShowsWatchList(pageNumber: pageNumber);
      return right(tvShowsWatchList);
    }on ServerException catch(exception){
      return left(ApiFailure(exception.message!));
    }
  }

  @override
  Future<Either<Failure, Movie>> addOrRemoveMovieFromWatchList({required bool isInWatchList, required int movieId}) async{
    try{
      final MovieModel movie = await _watchListDataSource.addOrRemoveMovieFromWatchList(movieId: movieId, isInWatchList: isInWatchList);
      return right(movie);
    }on ServerException catch(exception){
      return left(ApiFailure(exception.message!));
    }
  }

  @override
  Future<Either<Failure, TvShow>> addOrRemoveTvShowFromWatchList({required bool isInWatchList, required int tvShowId}) async{
    try{
      final TvShowModel tvShow = await _watchListDataSource.addOrRemoveTvShowFromWatchList(tvShowId: tvShowId, isInWatchList: isInWatchList);
      return right(tvShow);
    }on ServerException catch(exception){
      return left(ApiFailure(exception.message!));
    }
  }

}