import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:tmda/core/error/exception.dart';
import 'package:tmda/core/error/failure.dart';
import 'package:tmda/core/util/enums.dart';
import 'package:tmda/core/util/shared_data_source/local_data_source.dart';
import 'package:tmda/features/account/data/datasources/account_data_source.dart';
import 'package:tmda/features/account/data/models/account_model.dart';
import 'package:tmda/features/account/data/models/account_states_model.dart';
import 'package:tmda/features/account/data/models/account_watchlist_movie_model.dart';
import 'package:tmda/features/account/data/models/account_watchlist_tv_show_model.dart';
import 'package:tmda/features/account/domain/repositories/account_repository.dart';

@LazySingleton(as: AccountRepository)
class AccountRepositoryImpl extends AccountRepository{
  final AccountDataSource accountDataSource;
  final LocalDataSource localDataSource;

  AccountRepositoryImpl(this.accountDataSource, this.localDataSource);

  @override
  Future<String> getSessionId() async{
    return await localDataSource.getSessionId();
  }


  @override
  Future<Either<Failure, AccountModel>> getAccountDetails(String sessionId) async{
    try{
      final result = await accountDataSource.getAccountDetails(sessionId);
      return right(result);
    }on ServerException catch(exception){
      return left(Failure(exception.message!));
    }
  }

  @override
  Future<Either<Failure, List<AccountWatchListMovieModel>>> getMoviesWatchList(String sessionId) async{
    try{
      final result = await accountDataSource.getMoviesWatchList(sessionId);
      return right(result);
    }on ServerException catch(exception){
      return left(Failure(exception.message!));
    }
  }


  @override
  Future<Either<Failure, List<AccountWatchListTvShowModel>>> getTvShowsWatchList(String sessionId) async{
    try{
      final result = await accountDataSource.getTvShowsWatchList(sessionId);
      return right(result);
    }on ServerException catch(exception){
      return left(Failure(exception.message!));
    }
  }
  @override
  Future<Either<Failure, List<AccountWatchListMovieModel>>> getAllMoviesWatchList({required String sessionId, required int pageNumber}) async{
    try{
      final result = await accountDataSource.getAllMoviesWatchList(sessionId: sessionId, pageNumber: pageNumber);
      return right(result);
    }on ServerException catch(exception){
      return left(Failure(exception.message!));
    }
  }

  @override
  Future<Either<Failure, List<AccountWatchListTvShowModel>>> getAllTvShowsWatchList({required String sessionId, required int pageNumber}) async{
    try{
      final result = await accountDataSource.getAllTvShowsWatchList(sessionId: sessionId, pageNumber: pageNumber);
      return right(result);
    }on ServerException catch(exception){
      return left(Failure(exception.message!));
    }
  }

  @override
  Future<Either<Failure, AccountStatesModel>> addOrRemoveToWatchList({required int contentId, required String sessionId, required bool isInWatchList, required MediaType mediaType}) async{
    try{
      final result = await accountDataSource.addOrRemoveFromWatchList(contentId: contentId, sessionId: sessionId, isInWatchList: isInWatchList, mediaType: mediaType);
      return right(result);
    }on ServerException catch(exception){
      return left(Failure(exception.message!));
    }
  }
  @override
  Future<Either<Failure, AccountStatesModel>> getWatchListStates({required int tvShowId, required String sessionId, required MediaType mediaType}) async{
    try{
      final result = await accountDataSource.getWatchListStates(contentId: tvShowId, sessionId: sessionId, mediaType: mediaType);
      return right(result);
    }on ServerException catch(exception){
      return left(Failure(exception.message!));
    }
  }
}