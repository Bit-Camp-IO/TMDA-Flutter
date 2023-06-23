import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:tmda/core/error/failure.dart';
import 'package:tmda/features/tv/domain/entities/tv_details/tv_show_account_status.dart';
import 'package:tmda/features/tv/domain/repositories/tv_shows_repository.dart';

@lazySingleton
class AddOrRemoveTvFromWatchListUseCase {
  final TvShowsRepository tvShowsRepository;
  const AddOrRemoveTvFromWatchListUseCase({required this.tvShowsRepository});

  Future<Either<Failure, TvShowAccountStatus>> call({
    required int tvShowId,
    required bool isInWatchList,
    required String sessionId
  }) async {
    return await tvShowsRepository.addOrRemoveTvFromWatchList(
      tvShowId: tvShowId,
      isInWatchList: isInWatchList,
      sessionId: sessionId
    );
  }
}
