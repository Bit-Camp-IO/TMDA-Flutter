import 'package:injectable/injectable.dart';
import 'package:tmda/features/tv/domain/repositories/tv_shows_repository.dart';

@lazySingleton
class TvGetSessionKeyUseCase{
  final TvShowsRepository tvShowsRepository;

  const TvGetSessionKeyUseCase(this.tvShowsRepository);

  Future<String> call() async{
    return await tvShowsRepository.getSessionKey();
  }
}