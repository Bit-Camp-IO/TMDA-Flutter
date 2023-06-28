import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:tmda/core/error/exception.dart';
import 'package:tmda/core/error/failure.dart';
import 'package:tmda/core/util/shared_data_source/local_data_source.dart';
import 'package:tmda/features/account/data/datasources/account_data_source.dart';
import 'package:tmda/features/account/data/models/account_model.dart';
import 'package:tmda/features/account/data/models/account_states_model.dart';
import 'package:tmda/features/account/data/models/watchlist_movie_model.dart';
import 'package:tmda/features/account/data/models/watchlist_tv_show_model.dart';
import 'package:tmda/features/account/domain/entities/account_states.dart';
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
  Future<Either<Failure, List<WatchListMovieModel>>> getMoviesWatchList(String sessionId) async{
    try{
      final result = await accountDataSource.getMoviesWatchList(sessionId);
      return right(result);
    }on ServerException catch(exception){
      return left(Failure(exception.message!));
    }
  }


  @override
  Future<Either<Failure, List<WatchListTvShowModel>>> getTvShowsWatchList(String sessionId) async{
    try{
      final result = await accountDataSource.getTvShowsWatchList(sessionId);
      return right(result);
    }on ServerException catch(exception){
      return left(Failure(exception.message!));
    }
  }
  @override
  Future<Either<Failure, List<WatchListMovieModel>>> getAllMoviesWatchList({required String sessionId, required int pageNumber}) async{
    try{
      final result = await accountDataSource.getAllMoviesWatchList(sessionId: sessionId, pageNumber: pageNumber);
      return right(result);
    }on ServerException catch(exception){
      return left(Failure(exception.message!));
    }
  }

  @override
  Future<Either<Failure, List<WatchListTvShowModel>>> getAllTvShowsWatchList({required String sessionId, required int pageNumber}) async{
    try{
      final result = await accountDataSource.getAllTvShowsWatchList(sessionId: sessionId, pageNumber: pageNumber);
      return right(result);
    }on ServerException catch(exception){
      return left(Failure(exception.message!));
    }
  }
  @override
  Future<Either<Failure, AccountStates>> addOrRemoveMovieToAccountWatchList({required int contentId, required String sessionId, required bool isInWatchList}) async{
    try{
      final result = await accountDataSource.addOrRemoveMovieFromAccountWatchList(contentId: contentId, sessionId: sessionId, isInWatchList: isInWatchList);
      return right(result);
    }on ServerException catch(exception){
      return left(Failure(exception.message!));
    }
  }
  @override
  Future<Either<Failure, AccountStatesModel>> addOrRemoveTvShowToAccountWatchList({required int contentId, required String sessionId, required bool isInWatchList}) async{
    try{
      final result = await accountDataSource.addOrRemoveTvShowFromAccountWatchList(contentId: contentId, sessionId: sessionId, isInWatchList: isInWatchList);
      return right(result);
    }on ServerException catch(exception){
      return left(Failure(exception.message!));
    }
  }
  @override
  Future<Either<Failure, AccountStates>> getMovieWatchListStates({required int tvShowId, required String sessionId}) async{
    try{
      final result = await accountDataSource.getMovieWatchListStates(contentId: tvShowId, sessionId: sessionId);
      return right(result);
    }on ServerException catch(exception){
      return left(Failure(exception.message!));
    }
  }
  @override
  Future<Either<Failure, AccountStatesModel>> getTvShowWatchListStates({required int tvShowId, required String sessionId}) async{
    try{
      final result = await accountDataSource.getTvShowWatchListStates(contentId: tvShowId, sessionId: sessionId);
      return right(result);
    }on ServerException catch(exception){
      return left(Failure(exception.message!));
    }
  }

  @override
  Future<Either<Failure, void>> accountLogOut({required String sessionId}) async{
    try{
      final result = await accountDataSource.accountLogOut(sessionId: sessionId);
      localDataSource.deleteSessionId();
      return right(result);
    }on ServerException catch(exception){
      return left(Failure(exception.message!));
    }
  }




}