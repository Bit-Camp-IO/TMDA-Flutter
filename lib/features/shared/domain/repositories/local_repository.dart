import 'package:dartz/dartz.dart';
import 'package:tmda/features/shared/domain/entities/auth.dart';
import 'package:tmda/core/error/failure.dart';

abstract class LocalRepository{
  Future<Either<Failure, Auth>> checkUserLoginSession();
  Future<String> getSessionId();
}