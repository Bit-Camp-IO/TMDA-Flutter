import 'package:dartz/dartz.dart';
import 'package:tmda/core/error/failure.dart';
import 'package:tmda/features/account/domain/entities/account_states.dart';
import 'package:tmda/features/account/domain/repositories/account_repository.dart';

class AddOrRemoveFromWatchListUseCase{
  final AccountRepository accountRepository;
  const AddOrRemoveFromWatchListUseCase(this.accountRepository);

  Future<Either<Failure, AccountStates>> call({required int contentId, required String sessionId, required bool isInWatchList}) async{
    return await accountRepository.addOrRemoveToWatchList(contentId: contentId, sessionId: sessionId, isInWatchList: isInWatchList);
  }
}