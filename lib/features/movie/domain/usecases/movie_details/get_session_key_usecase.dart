import 'package:injectable/injectable.dart';
import 'package:tmda/features/movie/domain/repositories/movies_repository.dart';

@lazySingleton
class GetSessionKeyUseCase {
  final MoviesRepository moviesRepository;
  const GetSessionKeyUseCase({required this.moviesRepository});

  Future<String> call() async{
    return await moviesRepository.getSessionKey();
  }
}
