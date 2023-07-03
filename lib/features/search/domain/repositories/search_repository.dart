import 'package:dartz/dartz.dart';
import 'package:tmda/core/error/failure.dart';
import 'package:tmda/features/search/domain/entities/movie_search.dart';
import 'package:tmda/features/search/domain/entities/person_search.dart';
import 'package:tmda/features/search/domain/entities/tv_show_search.dart';

abstract class SearchRepository{
  Future<String> getSessionId();
  Future<Either<Failure, List<MovieSearch>>> searchForMovie({required String movieName, required String sessionId, required int pageNumber});
  Future<Either<Failure, List<TvShowSearch>>> searchForTvShow({required String tvShowName, required String sessionId, required int pageNumber});
  Future<Either<Failure, List<PersonSearch>>> searchForPerson({required String personName, required int pageNumber});
}