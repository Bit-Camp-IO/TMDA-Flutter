import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:tmda/core/error/exception.dart';
import 'package:tmda/core/error/failure.dart';
import 'package:tmda/core/util/shared_data_source/local_data_source.dart';
import 'package:tmda/features/auth/data/datasources/auth_data_source.dart';
import 'package:tmda/features/auth/data/models/auth_model.dart';
import 'package:tmda/features/auth/domain/repositories/auth_repository.dart';

@LazySingleton(as: AuthRepository)
class AuthRepositoryImpl extends AuthRepository {
  final AuthDataSource _authDataSource;
  final LocalDataSource _localDataSource;
  AuthRepositoryImpl(this._authDataSource, this._localDataSource);
  @override
  Future<Either<Failure, AuthModel>> checkUserLoginSession() async{
    try {
      String sessionId = await _localDataSource.getSessionId();
      return right(AuthModel(sessionId: sessionId, requestSuccess: true));
    } on CacheException catch(exception) {
      return left(Failure(exception.message!));
    }
  }

  @override
  Future<Either<Failure, AuthModel>> userLogin(String username, String password) async{
    try{
      final result = await _authDataSource.userLogin(username, password);
      _localDataSource.storeSessionId(result.sessionId!);
      return right(result);
    }on ServerException catch(exception){
      return left(Failure(exception.message!));
    }
  }

  @override
  Future<Either<Failure, void>> userRegister() async{
    try{
      final result = await _authDataSource.userRegister();
      return right(result);
    }on LaunchUrlException catch(exception){
      return Left(Failure(exception.message!));
    }
  }
  
  @override
  Future<Either<Failure, void>> userForgetPassword() async{
    try{
      final result = await _authDataSource.userForgetPassword();
      return right(result);
    }on LaunchUrlException catch(exception){
      return Left(Failure(exception.message!));
    }
  }
}
