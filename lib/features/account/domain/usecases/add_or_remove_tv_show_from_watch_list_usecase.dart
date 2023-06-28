import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:tmda/core/error/failure.dart';
import 'package:tmda/features/account/domain/entities/account_states.dart';
import 'package:tmda/features/account/domain/repositories/account_repository.dart';

@lazySingleton
class AddOrRemoveTvShowFromAccountWatchListUseCase{
  final AccountRepository accountRepository;
  const AddOrRemoveTvShowFromAccountWatchListUseCase(this.accountRepository);

  Future<Either<Failure, AccountStates>> call({required int tvShowId, required String sessionId, required bool isInWatchList}) async{
    return await accountRepository.addOrRemoveTvShowToAccountWatchList(contentId: tvShowId, sessionId: sessionId, isInWatchList: isInWatchList);
  }
}