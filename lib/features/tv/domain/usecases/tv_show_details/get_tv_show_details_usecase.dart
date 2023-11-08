import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:tmda/core/error/failure.dart';
import 'package:tmda/features/tv/domain/entities/tv_show_details.dart';
import 'package:tmda/features/tv/domain/repositories/tv_shows_repository.dart';

@lazySingleton
class GetTvShowDetailsUseCase {
  final TvShowsRepository _tvShowsRepository;
  const GetTvShowDetailsUseCase(this._tvShowsRepository);

  Future<Either<Failure, TvShowDetails>> call(int tvShowId) async{
    return await _tvShowsRepository.getTvShowDetails(tvShowId: tvShowId);
  }
}
