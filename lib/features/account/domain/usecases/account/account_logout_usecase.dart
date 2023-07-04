import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:tmda/core/error/failure.dart';
import 'package:tmda/features/account/domain/repositories/account_repository.dart';

@lazySingleton
class AccountLogoutUseCase{
  final AccountRepository _accountRepository;
  const AccountLogoutUseCase(this._accountRepository);
  Future<Either<Failure, void>> call({required String sessionId}) async{
    return await _accountRepository.accountLogOut(sessionId: sessionId);
  }
}