import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:tmda/core/error/failure.dart';
import 'package:tmda/features/account/domain/entities/watchlist_movie.dart';
import 'package:tmda/features/account/domain/repositories/account_repository.dart';

@lazySingleton
class GetAllMoviesWatchListUseCase{
  final AccountRepository accountRepository;
  const GetAllMoviesWatchListUseCase(this.accountRepository);

  Future<Either<Failure, List<WatchListMovie>>> call({required String sessionId, required int pageNumber}) async{
    return await accountRepository.getAllMoviesWatchList(sessionId: sessionId, pageNumber: pageNumber);
  }
}