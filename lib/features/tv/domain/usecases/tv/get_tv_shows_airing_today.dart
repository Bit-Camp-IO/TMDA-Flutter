import 'package:dartz/dartz.dart';
import 'package:tmda/core/error/failure.dart';
import 'package:tmda/features/tv/domain/entities/tv_show/tv_show.dart';
import 'package:tmda/features/tv/domain/repositories/tv_repository.dart';

class GetTvShowsAiringTodayUseCase {
  final TvRepository tvRepository;
  GetTvShowsAiringTodayUseCase({required this.tvRepository});

  Future<Either<Failure, List<TvShow>>> call() async{
    return await tvRepository.getTvShowsAiringToday();
  }
}
