import 'package:injectable/injectable.dart';
import 'package:tmda/features/search/domain/repositories/search_repository.dart';

@lazySingleton
class GetSearchSessionIdUseCase{
  final SearchRepository _searchRepository;
  const GetSearchSessionIdUseCase(this._searchRepository);

  Future<String> call() async{
    return await _searchRepository.getSessionId();
  }
}