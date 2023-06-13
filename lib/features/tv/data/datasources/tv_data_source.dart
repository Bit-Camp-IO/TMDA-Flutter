import 'package:tmda/core/api/api_consumer.dart';
import 'package:tmda/core/constants/api_constants.dart';
import 'package:tmda/core/error/exception.dart';
import 'package:tmda/features/tv/data/models/tv_show/tv_show_model.dart';

abstract class TvDataSource {
  Future<List<TvShowModel>> getTvShowsAiringToday();
  Future<List<TvShowModel>> getTvShowsAiringThisWeek(int pageNumber);
  Future<List<TvShowModel>> getPopularTvShows(int pageNumber);
  Future<List<TvShowModel>> getTopRatedTopRatedTvShows(int pageNumber);
}

class TvDataSourceImpl extends TvDataSource {
  final ApiConsumer apiConsumer;
  TvDataSourceImpl({
    required this.apiConsumer
  });
  @override
  Future<List<TvShowModel>> getTvShowsAiringThisWeek(int pageNumber) async{
    try{
      final response = await apiConsumer.get(ApiConstants.tvShowsAiringThisWeekEndPoint);
      return List<TvShowModel>.from((response['result'] as List).map((jsonData) => TvShowModel.fromJson(jsonData)));
    }on ServerException{
    throw const ServerException('There was an error');
    }
  }

  @override
  Future<List<TvShowModel>> getPopularTvShows(int pageNumber) async{
    try{
      final response = await apiConsumer.get(ApiConstants.popularTvShowsEndPoint);
      return List<TvShowModel>.from((response['result'] as List).map((jsonData) => TvShowModel.fromJson(jsonData)));
    }on ServerException{
      throw const ServerException('There was an error');
    }
  }

  @override
  Future<List<TvShowModel>> getTopRatedTopRatedTvShows(int pageNumber) async{
    try{
      final response = await apiConsumer.get(ApiConstants.topRatedTvShowsEndPoint);
      return List<TvShowModel>.from((response['result'] as List).map((jsonData) => TvShowModel.fromJson(jsonData)));
    }on ServerException{
      throw const ServerException('There was an error');
    }
  }

  @override
  Future<List<TvShowModel>> getTvShowsAiringToday() async{
    try{
      final response = await apiConsumer.get(ApiConstants.tvShowsAiringTodayEndPoint);
      return List<TvShowModel>.from((response['result'] as List).map((jsonData) => TvShowModel.fromJson(jsonData)));
    }on ServerException{
      throw const ServerException('There was an error');
    }
  }
}
