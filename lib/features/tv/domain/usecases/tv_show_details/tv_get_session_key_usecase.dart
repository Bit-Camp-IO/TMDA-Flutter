import 'package:injectable/injectable.dart';
import 'package:tmda/features/tv/domain/repositories/tv_shows_repository.dart';

@lazySingleton
class TvGetSessionIdUseCase{
  final TvShowsRepository tvShowsRepository;

  const TvGetSessionIdUseCase(this.tvShowsRepository);

  Future<String> call() async{
    return await tvShowsRepository.getSessionId();
  }
}