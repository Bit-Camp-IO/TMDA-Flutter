import 'package:dartz/dartz.dart';
import 'package:tmda/core/error/failure.dart';
import 'package:tmda/features/movie/domain/repositories/movies_repository.dart';

class GetSessionKeyUseCase {
  final MoviesRepository moviesRepository;
  const GetSessionKeyUseCase({required this.moviesRepository});

  Future<Either<Failure, String>> call() async{
    return await moviesRepository.getSessionKey();
  }
}
