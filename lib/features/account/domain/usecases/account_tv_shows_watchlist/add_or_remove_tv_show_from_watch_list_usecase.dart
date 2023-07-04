import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:tmda/core/error/failure.dart';
import 'package:tmda/features/account/domain/entities/account_states.dart';
import 'package:tmda/features/account/domain/repositories/account_repository.dart';

@lazySingleton
class RemoveTvShowFromWatchListUseCase{
  final AccountRepository _accountRepository;
  const RemoveTvShowFromWatchListUseCase(this._accountRepository);

  Future<Either<Failure, AccountStates>> call({required int tvShowId, required String sessionId}) async{
    return await _accountRepository.removeTvShowFromWatchList(contentId: tvShowId, sessionId: sessionId);
  }
}