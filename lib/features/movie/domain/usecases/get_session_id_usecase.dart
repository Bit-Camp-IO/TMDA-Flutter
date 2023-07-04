import 'package:injectable/injectable.dart';
import 'package:tmda/features/movie/domain/repositories/movies_repository.dart';

@lazySingleton
class GetSessionIdUseCase {
  final MoviesRepository _moviesRepository;
  const GetSessionIdUseCase(this._moviesRepository);

  Future<String> call() async{
    return await _moviesRepository.getSessionId();
  }
}
