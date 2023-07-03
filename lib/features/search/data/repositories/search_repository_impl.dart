import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:tmda/core/error/exception.dart';
import 'package:tmda/core/error/failure.dart';
import 'package:tmda/core/util/shared_data_source/local_data_source.dart';
import 'package:tmda/features/search/data/datasources/search_data_source.dart';
import 'package:tmda/features/search/domain/entities/movie_search.dart';
import 'package:tmda/features/search/domain/entities/person_search.dart';
import 'package:tmda/features/search/domain/entities/tv_show_search.dart';
import 'package:tmda/features/search/domain/repositories/search_repository.dart';

@LazySingleton(as: SearchRepository)
class SearchRepositoryImpl extends SearchRepository{
  final SearchDataSource _searchDataSource;
  final LocalDataSource _localDataSource;

  SearchRepositoryImpl(this._searchDataSource, this._localDataSource);

  @override
  Future<String> getSessionId() async{
    return await _localDataSource.getSessionId();
  }

  @override
  Future<Either<Failure, List<MovieSearch>>> searchForMovie({required String movieName, required String sessionId, required int pageNumber}) async{
    try{
      final result = await _searchDataSource.searchForMovie(movieName: movieName, sessionId: sessionId, pageNumber: pageNumber);
      return right(result);
    }on ServerException catch(exception){
      return left(Failure(exception.message!));
    }
  }

  @override
  Future<Either<Failure, List<PersonSearch>>> searchForPerson({required String personName, required int pageNumber}) async{
    try{
      final result = await _searchDataSource.searchForPerson(personName: personName, pageNumber: pageNumber);
      return right(result);
    }on ServerException catch(exception){
      return left(Failure(exception.message!));
    }
  }

  @override
  Future<Either<Failure, List<TvShowSearch>>> searchForTvShow({required String tvShowName, required String sessionId, required int pageNumber}) async{
    try{
      final result = await _searchDataSource.searchForTvShow(tvShowName: tvShowName, sessionId: sessionId, pageNumber: pageNumber);
      return right(result);
    }on ServerException catch(exception){
      return left(Failure(exception.message!));
    }
  }
}