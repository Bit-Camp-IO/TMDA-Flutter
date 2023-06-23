import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:tmda/core/error/failure.dart';
import 'package:tmda/features/auth/domain/repositories/auth_repository.dart';

@lazySingleton
class UserForgetPasswordUseCase {
  AuthRepository authRepository;
  UserForgetPasswordUseCase({required this.authRepository});
  Future<Either<Failure, void>> call() async {
    return await authRepository.userForgetPassword();
  }
}
