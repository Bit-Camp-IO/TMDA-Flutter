import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:tmda/core/error/failure.dart';
import 'package:tmda/features/shared/domain/entities/auth.dart';
import 'package:tmda/features/shared/domain/repositories/local_repository.dart';

@lazySingleton
class CheckUserLoginSessionUseCase {
  final LocalRepository _localRepository;
  const CheckUserLoginSessionUseCase(this._localRepository);

  Future<Either<Failure, Auth>> call() async{
    return await _localRepository.checkUserLoginSession();
  }
}
