import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:tmda/core/error/failure.dart';
import 'package:tmda/features/search/domain/entities/person_search.dart';
import 'package:tmda/features/search/domain/repositories/search_repository.dart';

@lazySingleton
class SearchForPersonUseCase{
  final SearchRepository _searchRepository;
  const SearchForPersonUseCase(this._searchRepository);

  Future<Either<Failure, List<PersonSearch>>> call({required String personName, required String sessionId, required int pageNumber}) async{
    return await _searchRepository.searchForPerson(personName: personName, pageNumber: pageNumber);
  }
}