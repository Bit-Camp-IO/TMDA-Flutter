import 'package:dartz/dartz.dart';
import 'package:tmda/core/error/failure.dart';
import 'package:tmda/features/auth/domain/entities/auth.dart';

abstract class AuthRepository {
  Future<Either<Failure, Auth>> checkUserLoginSession();
  Future<Either<Failure, Auth>> userLogin(String username, String password);
  Future<Either<Failure, void>> userRegister(); 
  Future<Either<Failure, void>> userForgetPassword();
}
