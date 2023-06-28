import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:tmda/core/error/failure.dart';
import 'package:tmda/features/account/domain/entities/account_watchlist_movie.dart';
import 'package:tmda/features/account/domain/repositories/account_repository.dart';

@lazySingleton
class GetAccountMoviesWatchListUseCase{
  final AccountRepository accountRepository;
  const GetAccountMoviesWatchListUseCase(this.accountRepository);

  Future<Either<Failure, List<AccountWatchListMovie>>> call({required String sessionId}) async{
    return await accountRepository.getMoviesWatchList(sessionId);
  }
}