import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:tmda/core/error/failure.dart';
import 'package:tmda/features/account/domain/entities/account_states.dart';
import 'package:tmda/features/account/domain/repositories/account_repository.dart';

@lazySingleton
class RemoveMovieFromWatchListUseCase{
  final AccountRepository _accountRepository;
  const RemoveMovieFromWatchListUseCase(this._accountRepository);

  Future<Either<Failure, AccountStates>> call({required int movieId, required String sessionId}) async{
    return await _accountRepository.removeMovieFromWatchList(contentId: movieId, sessionId: sessionId);
  }
}