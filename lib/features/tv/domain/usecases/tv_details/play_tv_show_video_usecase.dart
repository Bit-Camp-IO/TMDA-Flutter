import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:tmda/core/error/failure.dart';
import 'package:tmda/features/tv/domain/repositories/tv_shows_repository.dart';

@lazySingleton
class PlayTvShowVideoUseCase {
  final TvShowsRepository tvShowsRepository;
  const PlayTvShowVideoUseCase({required this.tvShowsRepository});
  Future<Either<Failure, void>> call({required String youtubeVideoKey}) async{
    return await tvShowsRepository.playTvShowVideo(youtubeVideoKey: youtubeVideoKey);
  }
}
