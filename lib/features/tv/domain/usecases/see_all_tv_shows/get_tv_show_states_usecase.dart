import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:tmda/core/error/failure.dart';
import 'package:tmda/features/tv/domain/entities/tv_show_account_states.dart';
import 'package:tmda/features/tv/domain/repositories/tv_shows_repository.dart';

@lazySingleton
class GetTvShowStateUseCase {
  final TvShowsRepository tvShowsRepository;
  const GetTvShowStateUseCase({required this.tvShowsRepository});

  Future<Either<Failure, TvShowAccountStates>> call({required int tvShowId, required String sessionId}) async{
    return await tvShowsRepository.getTvShowStates(tvShowId: tvShowId, sessionId: sessionId);
  }
}
