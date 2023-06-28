import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:tmda/core/error/failure.dart';
import 'package:tmda/features/account/domain/entities/account_watchlist_tv_show.dart';
import 'package:tmda/features/account/domain/repositories/account_repository.dart';

@lazySingleton
class GetAccountTvShowsWatchListUseCase{
  final AccountRepository accountRepository;
  const GetAccountTvShowsWatchListUseCase(this.accountRepository);

  Future<Either<Failure, List<AccountWatchListTvShow>>> call({required String sessionId}) async{
    return await accountRepository.getTvShowsWatchList(sessionId);
  }
}