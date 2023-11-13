import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:tmda/core/error/failure.dart';
import 'package:tmda/features/shared/domain/entities/tv_show.dart';
import 'package:tmda/features/tv/domain/repositories/tv_shows_repository.dart';

@lazySingleton
class GetTvShowsAiringThisWeekUseCase {
  final TvShowsRepository _tvShowsRepository;
  const GetTvShowsAiringThisWeekUseCase(this._tvShowsRepository);

  Future<Either<Failure, List<TvShow>>> call(int pageNumber) async{
    return await _tvShowsRepository.getTvShowsAiringThisWeek(pageNumber);
  }
}
