import 'package:injectable/injectable.dart';
import 'package:tmda/features/tv/domain/repositories/tv_shows_repository.dart';

@lazySingleton
class TvGetSessionIdUseCase{
  final TvShowsRepository _tvShowsRepository;

  const TvGetSessionIdUseCase(this._tvShowsRepository);

  Future<String> call() async{
    return await _tvShowsRepository.getSessionId();
  }
}