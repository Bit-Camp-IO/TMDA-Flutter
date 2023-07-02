import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:tmda/core/error/failure.dart';
import 'package:tmda/features/search/domain/entities/tv_show_search.dart';
import 'package:tmda/features/search/domain/repositories/search_repository.dart';

@lazySingleton
class SearchForTvShowUseCase{
  final SearchRepository _searchRepository;
  const SearchForTvShowUseCase(this._searchRepository);

  Future<Either<Failure, List<TvShowSearch>>> call({required String tvShowName, required String sessionId, required int pageNumber}) async{
    return await _searchRepository.searchForTvShow(tvShowName: tvShowName, sessionId: sessionId, pageNumber: pageNumber);
  }
}