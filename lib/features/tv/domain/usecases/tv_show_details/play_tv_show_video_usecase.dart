import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:tmda/core/error/failure.dart';
import 'package:tmda/features/tv/domain/repositories/tv_shows_repository.dart';

@lazySingleton
class PlayTvShowVideoUseCase {
  final TvShowsRepository _tvShowsRepository;
  const PlayTvShowVideoUseCase(this._tvShowsRepository);
  Future<Either<Failure, void>> call({required String youtubeVideoKey}) async{
    return await _tvShowsRepository.playTvShowVideo(youtubeVideoKey: youtubeVideoKey);
  }
}
