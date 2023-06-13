import 'package:dartz/dartz.dart';
import 'package:tmda/core/error/failure.dart';
import 'package:tmda/features/tv/domain/entities/tv_show/tv_show.dart';
import 'package:tmda/features/tv/domain/repositories/tv_repository.dart';

class GetTvShowsAiringThisWeekUseCase {
  final TvRepository tvRepository;
  GetTvShowsAiringThisWeekUseCase({required this.tvRepository});

  Future<Either<Failure, List<TvShow>>> call(int pageNumber) async{
    return await tvRepository.getTvShowsAiringThisWeek(pageNumber);
  }
}
