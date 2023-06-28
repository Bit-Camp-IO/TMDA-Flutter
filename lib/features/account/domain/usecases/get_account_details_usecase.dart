import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:tmda/core/error/failure.dart';
import 'package:tmda/features/account/domain/entities/account.dart';
import 'package:tmda/features/account/domain/repositories/account_repository.dart';

@lazySingleton
class GetAccountDetailsUseCase{
  final AccountRepository accountRepository;
  const GetAccountDetailsUseCase(this.accountRepository);

  Future<Either<Failure, Account>> call({required String sessionId}) async{
    return await accountRepository.getAccountDetails(sessionId);
  }
}