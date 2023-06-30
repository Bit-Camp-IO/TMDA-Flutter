import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:tmda/core/error/exception.dart';
import 'package:tmda/core/error/failure.dart';
import 'package:tmda/core/util/shared_data_source/local_data_source.dart';
import 'package:tmda/features/tv/data/datasources/tv_data_source.dart';
import 'package:tmda/features/tv/data/models/season_episode_model.dart';
import 'package:tmda/features/tv/data/models/tv_show_account_status_model.dart';
import 'package:tmda/features/tv/data/models/tv_show_details_model.dart';
import 'package:tmda/features/tv/data/models/tv_show_video_model.dart';
import 'package:tmda/features/tv/data/models/tv_show_model.dart';
import 'package:tmda/features/tv/domain/entities/tv_show.dart';
import 'package:tmda/features/tv/domain/entities/tv_show_account_states.dart';
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
  Future<Either<Failure, List<TvShowModel>>> getRecommendedTvShows({required int tvShowId}) async{
    try{
      final result = await tvDataSource.getRecommendedTvShows(tvShowId: tvShowId);
      return right(result);
    } on ServerException catch(exception){
      return left(Failure(exception.message!));
    }
  }
  
  @override
  Future<Either<Failure, List<TvShowModel>>> getSimilarTvShows({required int tvShowId}) async{
    try{
      final result = await tvDataSource.getSimilarTvShows(tvShowId: tvShowId);
      return right(result);
    } on ServerException catch(exception){
      return left(Failure(exception.message!));
    }
  }
  
  @override
  Future<Either<Failure, TvShowDetailsModel>> getTvShowDetails({required int tvShowId, required String sessionId}) async{
    try{
      final result = await tvDataSource.getTvShowDetails(tvShowId: tvShowId, sessionKey: sessionId);
      return right(result);
    } on ServerException catch(exception){
      return left(Failure(exception.message!));
    }
  }

  @override
  Future<String> getSessionId() async{
     return await localDataSource.getSessionId();
  }

  @override
  Future<Either<Failure, List<SeasonEpisodeModel>>> getSeasonEpisodes({required int tvShowId, required int seasonId}) async{
    try{
      final result = await tvDataSource.getSeasonEpisodes(tvShowId: tvShowId, seasonNumber: seasonId);
      return right(result);
    }on ServerException catch(exception){
      return left(Failure(exception.message!));
    }
  }

  @override
  Future<Either<Failure, TvShowAccountStatesModel>> addOrRemoveTvFromWatchList({required int tvShowId, required bool isInWatchList, required String sessionId}) async{
   try{
      final result = await tvDataSource.addOrRemoveMovieFromWatchList(tvShowId: tvShowId, isInWatchList: isInWatchList, sessionId: sessionId);
      return right(result);
    }on ServerException catch(exception){
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
  Future<TvShowVideoModel> getEpisodeVideo({required int tvShowId, required seasonNumber, required int episodeNumber}) async{
    return await tvDataSource.getEpisodeVideo(tvShowId: tvShowId, seasonNumber: seasonNumber, episodeNumber: episodeNumber);
  }
  @override
  Future<Either<Failure, List<TvShow>>> getAllAiringTodayTvShows({required int pageNumber, required String sessionId}) async{
    try {
      final result = await tvDataSource.getAllAiringTodayTvShows(pageNumber: pageNumber, sessionId: sessionId);
      return right(result);
    } on ServerException catch (exception) {
      return left(
        Failure(exception.message!),
      );
    }
  }

  @override
  Future<Either<Failure, List<TvShow>>> getAllPopularTvShows({required int pageNumber, required String sessionId}) async{
    try {
      final result = await tvDataSource.getAllPopularTvShows(pageNumber: pageNumber, sessionId: sessionId);
      return right(result);
    } on ServerException catch (exception) {
      return left(
        Failure(exception.message!),
      );
    }
  }


  @override
  Future<Either<Failure, List<TvShow>>> getAllTopRatedTvShows({required int pageNumber, required String sessionId}) async{
    try {
      final result = await tvDataSource.getAllTopRatedTvShows(pageNumber: pageNumber, sessionId: sessionId);
      return right(result);
    } on ServerException catch (exception) {
      return left(
        Failure(exception.message!),
      );
    }
  }


  @override
  Future<Either<Failure, List<TvShow>>> getAllRecommendedTvShows({required int pageNumber, required int tvShowId, required String sessionId}) async{
    try {
      final result = await tvDataSource.getAllRecommendedTvShows(tvShowId: tvShowId, pageNumber: pageNumber, sessionId: sessionId);
      return right(result);
    } on ServerException catch (exception) {
      return left(
        Failure(exception.message!),
      );
    }
  }

  @override
  Future<Either<Failure, List<TvShow>>> getAllSimilarTvShows({required int pageNumber, required int tvShowId, required String sessionId}) async{
    try {
      final result = await tvDataSource.getAllSimilarTvShows(tvShowId: tvShowId, pageNumber: pageNumber, sessionId: sessionId);
      return right(result);
    } on ServerException catch (exception) {
      return left(
        Failure(exception.message!),
      );
    }
  }

  @override
  Future<Either<Failure, TvShowAccountStates>> getTvShowStates({required int tvShowId, required String sessionId}) async{
    try{
      final result = await tvDataSource.getTvShowStates(sessionId: sessionId, tvShowId: tvShowId);
      return right(result);
    }on ServerException catch (exception) {
      return left(
        Failure(exception.message!),
      );
    }
  }

}
