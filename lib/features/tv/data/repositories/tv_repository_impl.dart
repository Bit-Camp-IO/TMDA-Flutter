import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:tmda/core/error/exception.dart';
import 'package:tmda/core/error/failure.dart';
import 'package:tmda/features/shared/data/datasources/local_data_source.dart';
import 'package:tmda/features/tv/data/datasources/tv_data_source.dart';
import 'package:tmda/features/tv/data/models/tv_show_details_model.dart';
import 'package:tmda/features/shared/data/models/tv_show_model.dart';
import 'package:tmda/features/shared/domain/entities/tv_show.dart';
import 'package:tmda/features/tv/domain/repositories/tv_shows_repository.dart';

@LazySingleton(as: TvShowsRepository)
class TvRepositoryImpl extends TvShowsRepository {
  final TvDataSource tvDataSource;
  final LocalDataSource localDataSource;
  TvRepositoryImpl({
    required this.tvDataSource,
    required this.localDataSource,
  });
  @override
  Future<Either<Failure, List<TvShowModel>>> getTvShowsAiringToday(int pageNumber) async{
    try{
    final result = await tvDataSource.getTvShowsAiringToday(pageNumber);
    return right(result);
    } on ServerException catch(exception){
      return left(Failure(exception.message!));
    }
  }

  @override
  Future<Either<Failure, List<TvShowModel>>> getPopularTvShows(int pageNumber) async{
    try{
      final result = await tvDataSource.getPopularTvShows(pageNumber);
    return right(result);
    } on ServerException catch(exception){
      return left(Failure(exception.message!));
    }
  }

  @override
  Future<Either<Failure, List<TvShowModel>>> getTvShowsAiringThisWeek(int pageNumber) async{
    try{
      final result = await tvDataSource.getTvShowsAiringThisWeek(pageNumber);
    return right(result);
    } on ServerException catch(exception){
      return left(Failure(exception.message!));
    }
  }

  @override
  Future<Either<Failure, List<TvShowModel>>> getTopRatedTvShows(int pageNumber) async{
    try{
      final result = await tvDataSource.getTopRatedTopRatedTvShows(pageNumber);
    return right(result);
    } on ServerException catch(exception){
      return left(Failure(exception.message!));
    }
  }

  @override
  Future<Either<Failure, TvShowDetailsModel>> getTvShowDetails({required int tvShowId}) async{
    try{
      final result = await tvDataSource.getTvShowDetails(tvShowId: tvShowId);
      return right(result);
    } on ServerException catch(exception){
      return left(Failure(exception.message!));
    }
  }

  
  @override
  Future<Either<Failure, void>> playTvShowVideo({required String youtubeVideoKey}) async{
    try{
      final result = await tvDataSource.playTvShowVideo(youtubeVideoKey);
      return right(result);
    }on LaunchUrlException catch(exception){
      return left(Failure(exception.message!));
    }
  }
  @override
  Future<Either<Failure, List<TvShow>>> getRecommendedTvShows({required int pageNumber, required int tvShowId}) async{
    try {
      final result = await tvDataSource.getRecommendedTvShows(tvShowId: tvShowId, pageNumber: pageNumber);
      return right(result);
    } on ServerException catch (exception) {
      return left(
        Failure(exception.message!),
      );
    }
  }

  @override
  Future<Either<Failure, List<TvShow>>> getSimilarTvShows({required int pageNumber, required int tvShowId}) async{
    try {
      final result = await tvDataSource.getSimilarTvShows(tvShowId: tvShowId, pageNumber: pageNumber);
      return right(result);
    } on ServerException catch (exception) {
      return left(
        Failure(exception.message!),
      );
    }
  }
}
