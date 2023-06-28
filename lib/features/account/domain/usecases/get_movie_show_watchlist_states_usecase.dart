import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:tmda/core/error/failure.dart';
import 'package:tmda/features/account/domain/entities/account_states.dart';
import 'package:tmda/features/account/domain/repositories/account_repository.dart';

@lazySingleton
class GetMovieWatchListStatesUseCase{
  final AccountRepository accountRepository;
  const GetMovieWatchListStatesUseCase(this.accountRepository);

  Future<Either<Failure, AccountStates>> call({required int movieId, required String sessionId}) async{
    return await accountRepository.getMovieWatchListStates(tvShowId: movieId, sessionId: sessionId);
  }
}