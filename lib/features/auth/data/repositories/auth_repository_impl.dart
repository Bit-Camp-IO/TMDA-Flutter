import 'package:dartz/dartz.dart';
import 'package:tmda/core/error/exception.dart';
import 'package:tmda/core/error/failure.dart';
import 'package:tmda/features/auth/data/datasources/remote_data_source.dart';
import 'package:tmda/features/auth/data/models/auth_model.dart';
import 'package:tmda/features/auth/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl extends AuthRepository {
  RemoteDataSource remoteDataSource;
  AuthRepositoryImpl({required this.remoteDataSource});
  @override
  Future<Either<Failure, AuthModel>> checkUserLoggedIn() async{
    try{
      final result = await remoteDataSource.checkUserLoggedIn();
      return right(result);
    }on ServerException{
      return left(Failure());
    }
  }

  @override
  Future<Either<Failure, AuthModel>> userLogin(String username, String password) async{
    try{
      final result = await remoteDataSource.userLogin(username, password);
      return right(result);
    }on ServerException{
      return left(Failure());
    }
  }

  @override
  Future<Either<Failure, void>> userRegister() async{
    try{
      final result = await remoteDataSource.userRegister();
      return right(result);
    }on Exception{
      return Left(Failure());
    }
  }
}
