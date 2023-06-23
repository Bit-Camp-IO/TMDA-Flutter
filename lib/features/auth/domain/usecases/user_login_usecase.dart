import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:tmda/core/error/failure.dart';
import 'package:tmda/features/auth/domain/entities/auth.dart';
import 'package:tmda/features/auth/domain/repositories/auth_repository.dart';

@lazySingleton
class UserLoginUseCase {
  AuthRepository authRepository;
  UserLoginUseCase({required this.authRepository});

  Future<Either<Failure, Auth>> call(String username, String password) async{
    return await authRepository.userLogin(username, password);
  }
}
