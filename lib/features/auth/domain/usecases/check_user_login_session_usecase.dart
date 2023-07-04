import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:tmda/core/error/failure.dart';
import 'package:tmda/features/auth/domain/entities/auth.dart';
import 'package:tmda/features/auth/domain/repositories/auth_repository.dart';

@lazySingleton
class CheckUserLoginSessionUseCase {
  final AuthRepository _authRepository;
  const CheckUserLoginSessionUseCase(this._authRepository);

  Future<Either<Failure, Auth>> call() async{
    return await _authRepository.checkUserLoginSession();
  }
}
