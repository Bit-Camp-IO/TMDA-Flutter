import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:tmda/core/error/failure.dart';
import 'package:tmda/core/util/enums.dart';
import 'package:tmda/features/account/domain/entities/account_states.dart';
import 'package:tmda/features/account/domain/repositories/account_repository.dart';

@lazySingleton
class GetWatchListStatesUseCase{
  final AccountRepository accountRepository;
  const GetWatchListStatesUseCase(this.accountRepository);

  Future<Either<Failure, AccountStates>> call({required int contentId, required String sessionId, required MediaType mediaType}) async{
    return await accountRepository.getWatchListStates(tvShowId: contentId, sessionId: sessionId, mediaType: mediaType);
  }
}