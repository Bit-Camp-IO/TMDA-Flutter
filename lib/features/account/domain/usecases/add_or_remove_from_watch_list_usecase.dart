import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:tmda/core/error/failure.dart';
import 'package:tmda/core/util/enums.dart';
import 'package:tmda/features/account/domain/entities/account_states.dart';
import 'package:tmda/features/account/domain/repositories/account_repository.dart';

@lazySingleton
class AddOrRemoveFromWatchListUseCase{
  final AccountRepository accountRepository;
  const AddOrRemoveFromWatchListUseCase(this.accountRepository);

  Future<Either<Failure, AccountStates>> call({required int contentId, required String sessionId, required bool isInWatchList, required MediaType mediaType}) async{
    return await accountRepository.addOrRemoveToWatchList(contentId: contentId, sessionId: sessionId, isInWatchList: isInWatchList, mediaType: mediaType);
  }
}