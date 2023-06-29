import 'package:dartz/dartz.dart';
import 'package:tmda/core/error/failure.dart';
import 'package:tmda/features/account/domain/entities/account.dart';
import 'package:tmda/features/account/domain/entities/account_states.dart';
import 'package:tmda/features/account/domain/entities/watchlist_movie.dart';
import 'package:tmda/features/account/domain/entities/watchlist_tv_show.dart';

abstract class AccountRepository {
  Future<String> getSessionId();
  Future<Either<Failure, Account>> getAccountDetails(String sessionId);
  Future<Either<Failure, List<WatchListMovie>>> getMoviesWatchList(String sessionId);
  Future<Either<Failure, List<WatchListTvShow>>> getTvShowsWatchList(String sessionId);
  Future<Either<Failure, List<WatchListMovie>>> getAllMoviesWatchList({required String sessionId, required int pageNumber});
  Future<Either<Failure, List<WatchListTvShow>>> getAllTvShowsWatchList({required String sessionId, required int pageNumber});
  Future<Either<Failure, AccountStates>> removeMovieFromWatchList({required int contentId, required String sessionId});
  Future<Either<Failure, AccountStates>> removeTvShowFromWatchList({required int contentId, required String sessionId});
  Future<Either<Failure, AccountStates>> getMovieWatchListStates({required int tvShowId,required String sessionId});
  Future<Either<Failure, AccountStates>> getTvShowWatchListStates({required int tvShowId,required String sessionId});
  Future<Either<Failure, void>> accountLogOut({required String sessionId});
}