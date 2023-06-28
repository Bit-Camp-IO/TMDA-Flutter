import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:tmda/core/error/failure.dart';
import 'package:tmda/core/util/shared_data_source/local_data_source.dart';
import 'package:tmda/features/account/data/datasources/account_data_source.dart';
import 'package:tmda/features/account/domain/entities/account.dart';
import 'package:tmda/features/account/domain/entities/account_states.dart';
import 'package:tmda/features/account/domain/entities/account_watchlist_movie.dart';
import 'package:tmda/features/account/domain/entities/account_watchlist_tv_show.dart';
import 'package:tmda/features/account/domain/repositories/account_repository.dart';

@LazySingleton(as: AccountRepository)
class AccountRepositoryImpl extends AccountRepository{
  final AccountDataSource accountDataSource;
  final LocalDataSource localDataSource;

  AccountRepositoryImpl(this.accountDataSource, this.localDataSource);
  @override
  Future<Either<Failure, AccountStates>> addOrRemoveToWatchList({required int contentId, required String sessionId, required bool isInWatchList}) {
    // TODO: implement addOrRemoveToWatchList
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Account>> getAccountDetails(String sessionId) {
    // TODO: implement getAccountDetails
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<AccountWatchListMovie>>> getAllMoviesWatchList({required String sessionId, required int pageNumber}) {
    // TODO: implement getAllMoviesWatchList
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<AccountWatchListTvShow>>> getAllTvShowsWatchList({required String sessionId, required int pageNumber}) {
    // TODO: implement getAllTvShowsWatchList
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<AccountWatchListMovie>>> getMoviesWatchList(String sessionId) {
    // TODO: implement getMoviesWatchList
    throw UnimplementedError();
  }

  @override
  Future<String> getSessionId() {
    // TODO: implement getSessionId
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<AccountWatchListTvShow>>> getTvShowsWatchList(String sessionId) {
    // TODO: implement getTvShowsWatchList
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, AccountStates>> getWatchListStates({required int contentId, required String sessionId}) {
    // TODO: implement getWatchListStates
    throw UnimplementedError();
  }
}