import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:tmda/core/error/exception.dart';
import 'package:tmda/core/error/failure.dart';
import 'package:tmda/features/person/data/datasources/person_data_source.dart';
import 'package:tmda/features/person/data/models/person_model.dart';
import 'package:tmda/features/person/domain/repositories/person_repository.dart';

@LazySingleton(as: PersonRepository)
class PersonRepositoryImpl extends PersonRepository {
  final PersonDataSource _personDataSource;

  PersonRepositoryImpl(this._personDataSource);

  @override
  Future<Either<Failure, PersonModel>> getPersonDetails(
      {required int personId}) async {
    try {
      final results = await _personDataSource.getPersonData(personId: personId);
      return right(results);
    } on ServerException catch (exception) {
      return left(Failure(exception.message!));
    }
  }
}
