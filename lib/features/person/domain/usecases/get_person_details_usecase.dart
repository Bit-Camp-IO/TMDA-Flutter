import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:tmda/core/error/failure.dart';
import 'package:tmda/features/person/domain/entities/person.dart';
import 'package:tmda/features/person/domain/repositories/person_repository.dart';

@lazySingleton
class GetPersonDetailsUseCase {
  final PersonRepository _personRepository;
  const GetPersonDetailsUseCase(this._personRepository);

  Future<Either<Failure, Person>> call({required int personId}) async{
    return await _personRepository.getPersonDetails(personId: personId);
  }
}