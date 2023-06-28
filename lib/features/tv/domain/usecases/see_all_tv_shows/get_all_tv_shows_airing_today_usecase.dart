import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:tmda/core/error/failure.dart';
import 'package:tmda/features/tv/domain/entities/tv_show.dart';
import 'package:tmda/features/tv/domain/repositories/tv_shows_repository.dart';

@lazySingleton
class GetAllAiringTodayTvShowsUseCase {
  final TvShowsRepository tvShowsRepository;
  GetAllAiringTodayTvShowsUseCase({required this.tvShowsRepository});

  Future<Either<Failure, List<TvShow>>> call({required int pageNumber, required String sessionId}) async{
    return await tvShowsRepository.getAllAiringTodayTvShows(pageNumber: pageNumber, sessionId: sessionId);
  }
}
