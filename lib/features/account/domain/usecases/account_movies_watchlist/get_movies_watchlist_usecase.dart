import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:tmda/core/error/failure.dart';
import 'package:tmda/features/account/domain/entities/watchlist_movie.dart';
import 'package:tmda/features/account/domain/repositories/account_repository.dart';

@lazySingleton
class GetMoviesWatchListUseCase{
  final AccountRepository _accountRepository;
  const GetMoviesWatchListUseCase(this._accountRepository);

  Future<Either<Failure, List<WatchListMovie>>> call() async{
    return await _accountRepository.getMoviesWatchList();
  }
}