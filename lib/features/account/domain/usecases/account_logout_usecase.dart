import 'package:dartz/dartz.dart';
import 'package:tmda/core/error/failure.dart';
import 'package:tmda/features/account/domain/repositories/account_repository.dart';

class AccountLogoutUseCase{
  final AccountRepository accountRepository;
  const AccountLogoutUseCase(this.accountRepository);
  Future<Either<Failure, void>> call({required String sessionId}) async{
    return await accountRepository.accountLogOut(sessionId: sessionId);
  }
}