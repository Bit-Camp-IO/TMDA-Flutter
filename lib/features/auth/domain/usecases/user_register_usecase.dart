import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:tmda/core/error/failure.dart';
import 'package:tmda/features/auth/domain/repositories/auth_repository.dart';

@lazySingleton
class UserRegisterUseCase {
  final AuthRepository _authRepository;
  const UserRegisterUseCase(this._authRepository);
  Future<Either<Failure, void>> call() async {
    return await _authRepository.userRegister();
  }
}
