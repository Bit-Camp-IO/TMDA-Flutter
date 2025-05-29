import 'package:injectable/injectable.dart';
import 'package:tmda/core/api/api_consumer.dart';
import 'package:tmda/core/constants/api_constants.dart';
import 'package:tmda/core/error/exception.dart';
import 'package:tmda/features/account/data/models/account_model.dart';

abstract class AccountDataSource {
  Future<AccountModel> getAccountDetails();
  Future<void> accountLogOut({required String sessionId});
}

@LazySingleton(as: AccountDataSource)
class AccountDataSourceImpl extends AccountDataSource {
  final ApiConsumer _apiConsumer;
  AccountDataSourceImpl(this._apiConsumer);

  @override
  Future<AccountModel> getAccountDetails() async {
    final accountDetails = await _apiConsumer.get(ApiConstants.accountEndPoint);
    return AccountModel.fromJson(accountDetails);
  }

  @override
  Future<void> accountLogOut({required String sessionId}) async {
    final response = await _apiConsumer.delete(
      ApiConstants.accountLogoutEndPoint,
      body: {'session_id': sessionId},
    );
    if (response['success'] == false) {
      throw ServerException('${response['status_message']}');
    }
  }
}
