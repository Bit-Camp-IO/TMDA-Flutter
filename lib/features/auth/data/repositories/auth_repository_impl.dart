import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:tmda/core/error/exception.dart';
import 'package:tmda/core/error/failure.dart';
import 'package:tmda/features/auth/data/datasources/auth_data_source.dart';
import 'package:tmda/features/auth/data/models/auth_model.dart';
import 'package:tmda/features/auth/domain/repositories/auth_repository.dart';

@LazySingleton(as: AuthRepository)
class AuthRepositoryImpl extends AuthRepository {
  AuthDataSource remoteDataSource;
  AuthRepositoryImpl({required this.remoteDataSource});
  @override
  Future<Either<Failure, AuthModel>> checkUserLoginSession() async{
    try{
      final result = await remoteDataSource.checkUserLoginSession();
      return right(result);
    }on CacheException catch(exception){
      return left(Failure(exception.message!));
    }
  }

  @override
  Future<Either<Failure, AuthModel>> userLogin(String username, String password) async{
    try{
      final result = await remoteDataSource.userLogin(username, password);
      return right(result);
    }on ServerException catch(exception){
      return left(Failure(exception.message!));
    }
  }

  @override
  Future<Either<Failure, void>> userRegister() async{
    try{
      final result = await remoteDataSource.userRegister();
      return right(result);
    }on LaunchUrlException catch(exception){
      return Left(Failure(exception.message!));
    }
  }
  
  @override
  Future<Either<Failure, void>> userForgetPassword() async{
    try{
      final result = await remoteDataSource.userForgetPassword();
      return right(result);
    }on LaunchUrlException catch(exception){
      return Left(Failure(exception.message!));
    }
  }
}
