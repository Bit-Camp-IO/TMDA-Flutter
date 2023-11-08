import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:tmda/core/error/exception.dart';
import 'package:tmda/core/error/failure.dart';
import 'package:tmda/features/shared/data/datasources/local_data_source.dart';
import 'package:tmda/features/shared/data/models/auth_model.dart';
import 'package:tmda/features/shared/domain/repositories/local_repository.dart';

@LazySingleton(as: LocalRepository)
class LocalRepositoryImpl extends LocalRepository{
  final LocalDataSource _localDataSource;

  LocalRepositoryImpl(this._localDataSource);
  @override
  Future<Either<Failure, AuthModel>> checkUserLoginSession() async{
    try {
      String sessionId = await _localDataSource.getSessionId();
      return right(AuthModel(sessionId: sessionId, requestSuccess: true));
    } on CacheException catch(exception) {
      return left(Failure(exception.message!));
    }
  }

  @override
  Future<String> getSessionId() async {
    return await _localDataSource.getSessionId();
  }
}