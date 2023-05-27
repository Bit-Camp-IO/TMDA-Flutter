import 'package:dartz/dartz.dart';
import 'package:tmda/core/error/failure.dart';
import 'package:tmda/features/auth/domain/entities/auth.dart';
import 'package:tmda/features/auth/domain/repositories/auth_repository.dart';

class CheckUserLoggedInUseCase {
  AuthRepository authRepository;
  CheckUserLoggedInUseCase({required this.authRepository});

  Future<Either<Failure, Auth>> call() async{
    return await authRepository.checkUserLoggedIn();
  }
}
