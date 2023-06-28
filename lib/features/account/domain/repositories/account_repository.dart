import 'package:dartz/dartz.dart';
import 'package:tmda/core/error/failure.dart';
import 'package:tmda/core/util/enums.dart';
import 'package:tmda/features/account/domain/entities/account.dart';
import 'package:tmda/features/account/domain/entities/account_states.dart';
import 'package:tmda/features/account/domain/entities/account_watchlist_movie.dart';
import 'package:tmda/features/account/domain/entities/account_watchlist_tv_show.dart';

abstract class AccountRepository {
  Future<String> getSessionId();
  Future<Either<Failure, Account>> getAccountDetails(String sessionId);
  Future<Either<Failure, List<AccountWatchListMovie>>> getMoviesWatchList(String sessionId);
  Future<Either<Failure, List<AccountWatchListTvShow>>> getTvShowsWatchList(String sessionId);
  Future<Either<Failure, List<AccountWatchListMovie>>> getAllMoviesWatchList({required String sessionId, required int pageNumber});
  Future<Either<Failure, List<AccountWatchListTvShow>>> getAllTvShowsWatchList({required String sessionId, required int pageNumber});
  Future<Either<Failure, AccountStates>> addOrRemoveToWatchList({required int contentId, required String sessionId, required bool isInWatchList, required MediaType mediaType});
  Future<Either<Failure, AccountStates>> getWatchListStates({required int tvShowId,required String sessionId, required MediaType mediaType});
}