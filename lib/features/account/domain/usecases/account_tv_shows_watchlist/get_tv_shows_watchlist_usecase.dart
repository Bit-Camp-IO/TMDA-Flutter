import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:tmda/core/error/failure.dart';
import 'package:tmda/features/account/domain/entities/watchlist_tv_show.dart';
import 'package:tmda/features/account/domain/repositories/account_repository.dart';

@lazySingleton
class GetTvShowsWatchListUseCase{
  final AccountRepository _accountRepository;
  const GetTvShowsWatchListUseCase(this._accountRepository);

  Future<Either<Failure, List<WatchListTvShow>>> call() async{
    return await _accountRepository.getTvShowsWatchList();
  }
}