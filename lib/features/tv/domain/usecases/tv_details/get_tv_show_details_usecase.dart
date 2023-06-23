import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:tmda/core/error/failure.dart';
import 'package:tmda/features/tv/domain/entities/tv_details/tv_show_details.dart';
import 'package:tmda/features/tv/domain/repositories/tv_shows_repository.dart';

@lazySingleton
class GetTvShowDetailsUseCase {
  final TvShowsRepository tvShowsRepository;
  GetTvShowDetailsUseCase({required this.tvShowsRepository});

  Future<Either<Failure, TvShowDetails>> call(int tvShowId, String sessionKey) async{
    return await tvShowsRepository.getTvShowDetails(sessionKey: sessionKey, tvShowId: tvShowId);
  }
}
