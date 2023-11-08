import 'package:injectable/injectable.dart';
import 'package:tmda/features/shared/domain/repositories/local_repository.dart';

@lazySingleton
class GetSessionIdUseCase {
  final LocalRepository _localRepository;
  const GetSessionIdUseCase(this._localRepository);

  Future<String> call() async{
    return await _localRepository.getSessionId();
  }
}
