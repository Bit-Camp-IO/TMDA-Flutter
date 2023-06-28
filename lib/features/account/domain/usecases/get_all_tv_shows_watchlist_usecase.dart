import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:tmda/core/error/failure.dart';
import 'package:tmda/features/account/domain/entities/watchlist_tv_show.dart';
import 'package:tmda/features/account/domain/repositories/account_repository.dart';

@lazySingleton
class GetAllTvShowsWatchListUseCase{
  final AccountRepository accountRepository;
  const GetAllTvShowsWatchListUseCase(this.accountRepository);

  Future<Either<Failure, List<WatchListTvShow>>> call({required String sessionId, required int pageNumber}) async{
    return await accountRepository.getAllTvShowsWatchList(sessionId: sessionId, pageNumber: pageNumber);
  }
}