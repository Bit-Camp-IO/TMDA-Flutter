import 'package:dartz/dartz.dart';
import 'package:tmda/core/error/failure.dart';
import 'package:tmda/features/person/domain/entities/person.dart';

abstract class PersonRepository{
  Future<Either<Failure, Person>> getPersonDetails({required int personId});
}