import 'package:dartz/dartz.dart';
import 'package:tmda/core/error/failure.dart';
import 'package:tmda/features/tv/domain/entities/tv_show/tv_show.dart';
import 'package:tmda/features/tv/domain/repositories/tv_repository.dart';

class GetPopularTvShowsUseCase {
  final TvRepository tvRepository;
  GetPopularTvShowsUseCase({required this.tvRepository});

  Future<Either<Failure, List<TvShow>>> call(int pageNumber) async{
    return await tvRepository.getPopularTvShows(pageNumber);
  }
}
