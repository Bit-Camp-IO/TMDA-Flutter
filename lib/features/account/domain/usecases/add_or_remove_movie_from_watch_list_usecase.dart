import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:tmda/core/error/failure.dart';
import 'package:tmda/features/account/domain/entities/account_states.dart';
import 'package:tmda/features/account/domain/repositories/account_repository.dart';

@lazySingleton
class AddOrRemoveMovieFromAccountWatchListUseCase{
  final AccountRepository accountRepository;
  const AddOrRemoveMovieFromAccountWatchListUseCase(this.accountRepository);

  Future<Either<Failure, AccountStates>> call({required int movieId, required String sessionId, required bool isInWatchList}) async{
    return await accountRepository.addOrRemoveMovieToAccountWatchList(contentId: movieId, sessionId: sessionId, isInWatchList: isInWatchList);
  }
}