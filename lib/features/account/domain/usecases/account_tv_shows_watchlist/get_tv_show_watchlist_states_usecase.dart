import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:tmda/core/error/failure.dart';
import 'package:tmda/features/account/domain/entities/account_states.dart';
import 'package:tmda/features/account/domain/repositories/account_repository.dart';

@lazySingleton
class GetTvShowWatchListStatesUseCase{
  final AccountRepository _accountRepository;
  const GetTvShowWatchListStatesUseCase(this._accountRepository);

  Future<Either<Failure, AccountStates>> call({required int tvShowId}) async{
    return await _accountRepository.getTvShowWatchListStates(tvShowId: tvShowId);
  }
}