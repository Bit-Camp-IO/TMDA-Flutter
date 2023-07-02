import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:tmda/core/error/failure.dart';
import 'package:tmda/features/search/domain/entities/movie_search.dart';
import 'package:tmda/features/search/domain/repositories/search_repository.dart';

@lazySingleton
class SearchForMovieUseCase{
  final SearchRepository _searchRepository;
  const SearchForMovieUseCase(this._searchRepository);

  Future<Either<Failure, List<MovieSearch>>> call({required String movieName, required String sessionId, required int pageNumber}) async{
    return await _searchRepository.searchForMovie(movieName: movieName, sessionId: sessionId, pageNumber: pageNumber);
  }
}