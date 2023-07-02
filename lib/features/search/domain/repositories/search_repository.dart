import 'package:dartz/dartz.dart';
import 'package:tmda/core/error/failure.dart';
import 'package:tmda/features/search/domain/entities/search_content_states.dart';
import 'package:tmda/features/search/domain/entities/movie_search.dart';
import 'package:tmda/features/search/domain/entities/person_search.dart';
import 'package:tmda/features/search/domain/entities/tv_show_search.dart';

abstract class SearchRepository{
  Future<String> getSessionId();
  Future<Either<Failure, List<MovieSearch>>> searchForMovie({required String movieName, required String sessionId, required int pageNumber});
  Future<Either<Failure, List<TvShowSearch>>> searchForTvShow({required String tvShowName, required String sessionId, required int pageNumber});
  Future<Either<Failure, List<PersonSearch>>> searchForPerson({required String personName, required int pageNumber});
  Future<Either<Failure, SearchContentStates>> addOrRemoveContentFromWatchList({required int contentId, required String sessionId, required String contentType, required bool isInWatchList});
  Future<Either<Failure, SearchContentStates>> checkForMovieState({required int movieId, required String sessionId});
  Future<Either<Failure, SearchContentStates>> checkForTvShowState({required int tvShowId, required String sessionId});
}