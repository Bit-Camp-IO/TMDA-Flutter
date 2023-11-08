import 'package:dartz/dartz.dart';
import 'package:tmda/core/error/failure.dart';
import 'package:tmda/features/account/domain/entities/account.dart';
import 'package:tmda/features/account/domain/entities/account_states.dart';
import 'package:tmda/features/account/domain/entities/watchlist_movie.dart';
import 'package:tmda/features/account/domain/entities/watchlist_tv_show.dart';

abstract class AccountRepository {
  Future<Either<Failure, Account>> getAccountDetails();
  Future<Either<Failure, List<WatchListMovie>>> getMoviesWatchList();
  Future<Either<Failure, List<WatchListTvShow>>> getTvShowsWatchList();
  Future<Either<Failure, List<WatchListMovie>>> getAllMoviesWatchList({required int pageNumber});
  Future<Either<Failure, List<WatchListTvShow>>> getAllTvShowsWatchList({required int pageNumber});
  Future<Either<Failure, AccountStates>> removeMovieFromWatchList({required int contentId});
  Future<Either<Failure, AccountStates>> removeTvShowFromWatchList({required int contentId});
  Future<Either<Failure, AccountStates>> getMovieWatchListStates({required int tvShowId});
  Future<Either<Failure, AccountStates>> getTvShowWatchListStates({required int tvShowId});
  Future<Either<Failure, void>> accountLogOut({required String sessionId});
}