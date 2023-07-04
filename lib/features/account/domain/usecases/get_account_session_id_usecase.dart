import 'package:injectable/injectable.dart';
import 'package:tmda/features/account/domain/repositories/account_repository.dart';

@lazySingleton
class GetAccountSessionIdUseCase{
  final AccountRepository _accountRepository;
  const GetAccountSessionIdUseCase(this._accountRepository);

  Future<String> call() async{
    return _accountRepository.getSessionId();
  }
}