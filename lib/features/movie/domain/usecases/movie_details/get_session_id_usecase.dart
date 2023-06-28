import 'package:injectable/injectable.dart';
import 'package:tmda/features/movie/domain/repositories/movies_repository.dart';

@lazySingleton
class GetSessionIdUseCase {
  final MoviesRepository moviesRepository;
  const GetSessionIdUseCase({required this.moviesRepository});

  Future<String> call() async{
    return await moviesRepository.getSessionId();
  }
}
