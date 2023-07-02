import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:tmda/core/error/failure.dart';
import 'package:tmda/features/search/domain/entities/search_content_states.dart';
import 'package:tmda/features/search/domain/repositories/search_repository.dart';

@lazySingleton
class AddOrRemoveSearchContentFromWatchListUseCase{
  final SearchRepository _searchRepository;

  const AddOrRemoveSearchContentFromWatchListUseCase(this._searchRepository);

  Future<Either<Failure, SearchContentStates>> call({required int contentId, required String sessionId, required String contentType, required bool isInWatchList}) async{
    return await _searchRepository.addOrRemoveContentFromWatchList(contentId: contentId, sessionId: sessionId, contentType: contentType, isInWatchList: isInWatchList);
  }
}