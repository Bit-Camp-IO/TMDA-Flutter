import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:tmda/core/error/failure.dart';
import 'package:tmda/features/account/domain/entities/account.dart';
import 'package:tmda/features/account/domain/repositories/account_repository.dart';

@lazySingleton
class GetAccountDetailsUseCase{
  final AccountRepository _accountRepository;
  const GetAccountDetailsUseCase(this._accountRepository);

  Future<Either<Failure, Account>> call({required String sessionId}) async{
    return await _accountRepository.getAccountDetails(sessionId);
  }
}