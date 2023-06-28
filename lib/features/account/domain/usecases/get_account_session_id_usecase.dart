import 'package:injectable/injectable.dart';
import 'package:tmda/features/account/domain/repositories/account_repository.dart';

@lazySingleton
class GetAccountSessionIdUseCase{
  final AccountRepository accountRepository;
  const GetAccountSessionIdUseCase(this.accountRepository);

  Future<String> call() async{
    return accountRepository.getSessionId();
  }
}