import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:tmda/core/error/exception.dart';
import 'package:tmda/core/error/failure.dart';
import 'package:tmda/features/shared/data/datasources/local_data_source.dart';
import 'package:tmda/features/account/data/datasources/account_data_source.dart';
import 'package:tmda/features/account/data/models/account_model.dart';
import 'package:tmda/features/account/domain/repositories/account_repository.dart';

@LazySingleton(as: AccountRepository)
class AccountRepositoryImpl extends AccountRepository{
  final AccountDataSource _accountDataSource;
  final LocalDataSource _localDataSource;

  AccountRepositoryImpl(this._accountDataSource, this._localDataSource);



  @override
  Future<Either<Failure, AccountModel>> getAccountDetails() async{
    try{
      final result = await _accountDataSource.getAccountDetails();
      return right(result);
    }on ServerException catch(exception){
      return left(Failure(exception.message!));
    }
  }


  @override
  Future<Either<Failure, void>> accountLogOut({required String sessionId}) async{
    try{
      final result = await _accountDataSource.accountLogOut(sessionId: sessionId);
      _localDataSource.deleteSessionId();
      return right(result);
    }on ServerException catch(exception){
      return left(Failure(exception.message!));
    }
  }
}