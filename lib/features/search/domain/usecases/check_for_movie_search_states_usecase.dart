import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:tmda/core/error/failure.dart';
import 'package:tmda/features/search/domain/entities/search_content_states.dart';
import 'package:tmda/features/search/domain/repositories/search_repository.dart';

@lazySingleton
class CheckForMovieSearchStateUseCase{
  final SearchRepository _searchRepository;

  const CheckForMovieSearchStateUseCase(this._searchRepository);

  Future<Either<Failure, SearchContentStates>> call({required int movieId, required String sessionId}) async{
    return await _searchRepository.checkForMovieState(movieId: movieId, sessionId: sessionId);
  }
}