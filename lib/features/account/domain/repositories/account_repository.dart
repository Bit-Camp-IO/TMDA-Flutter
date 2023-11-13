import 'package:dartz/dartz.dart';
import 'package:tmda/core/error/failure.dart';
import 'package:tmda/features/account/domain/entities/account.dart';

abstract class AccountRepository {
  Future<Either<Failure, Account>> getAccountDetails();
  Future<Either<Failure, void>> accountLogOut({required String sessionId});
}