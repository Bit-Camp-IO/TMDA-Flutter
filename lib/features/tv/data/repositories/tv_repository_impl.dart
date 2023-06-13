import 'package:dartz/dartz.dart';
import 'package:tmda/core/error/exception.dart';
import 'package:tmda/core/error/failure.dart';
import 'package:tmda/core/util/data_source/local_data_source.dart';
import 'package:tmda/features/tv/data/datasources/tv_data_source.dart';
import 'package:tmda/features/tv/domain/entities/tv_show/tv_show.dart';
import 'package:tmda/features/tv/domain/repositories/tv_repository.dart';

class TvRepositoryImpl extends TvRepository {

  final TvDataSource tvDataSource;
  final LocalDataSource localDataSource;
  TvRepositoryImpl({
    required this.tvDataSource,
    required this.localDataSource,
  });
  @override
  Future<Either<Failure, List<TvShow>>> getTvShowsAiringToday() async{
    try{
    final result = await tvDataSource.getTvShowsAiringToday();
    return right(result);
    } on ServerException catch(exception){
      return left(Failure(exception.message!));
    }
  }

  @override
  Future<Either<Failure, List<TvShow>>> getPopularTvShows(int pageNumber) async{
    try{
      final result = await tvDataSource.getPopularTvShows(pageNumber);
    return right(result);
    } on ServerException catch(exception){
      return left(Failure(exception.message!));
    }
  }

  @override
  Future<Either<Failure, List<TvShow>>> getTvShowsAiringThisWeek(int pageNumber) async{
    try{
      final result = await tvDataSource.getTvShowsAiringThisWeek(pageNumber);
    return right(result);
    } on ServerException catch(exception){
      return left(Failure(exception.message!));
    }
  }

  @override
  Future<Either<Failure, List<TvShow>>> getTopRatedTvShows(int pageNumber) async{
    try{
      final result = await tvDataSource.getTopRatedTopRatedTvShows(pageNumber);
    return right(result);
    } on ServerException catch(exception){
      return left(Failure(exception.message!));
    }
  }
}
