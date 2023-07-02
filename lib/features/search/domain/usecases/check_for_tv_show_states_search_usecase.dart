import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:tmda/core/error/failure.dart';
import 'package:tmda/features/search/domain/entities/search_content_states.dart';
import 'package:tmda/features/search/domain/repositories/search_repository.dart';

@lazySingleton
class CheckForTvShowSearchStateUseCase{
  final SearchRepository _searchRepository;

  const CheckForTvShowSearchStateUseCase(this._searchRepository);

  Future<Either<Failure, SearchContentStates>> call({required int tvShowId, required String sessionId}) async{
    return await _searchRepository.checkForTvShowState(tvShowId: tvShowId, sessionId: sessionId);
  }
}