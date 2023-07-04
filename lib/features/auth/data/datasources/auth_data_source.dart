import 'package:injectable/injectable.dart';
import 'package:tmda/core/api/api_consumer.dart';
import 'package:tmda/core/constants/api_constants.dart';
import 'package:tmda/core/error/exception.dart';
import 'package:tmda/features/auth/data/models/auth_model.dart';
import 'package:url_launcher/url_launcher.dart';

abstract class AuthDataSource {
  Future<AuthModel> userLogin(String username, String password);
  Future<void> userRegister();
  Future<void> userForgetPassword();
}

@LazySingleton(as: AuthDataSource)
class AuthDataSourceImpl extends AuthDataSource {
  final ApiConsumer _apiConsumer;
  AuthDataSourceImpl(this._apiConsumer);

  @override
  Future<AuthModel> userLogin(String username, String password) async {
    final requestToken = await _apiConsumer.get(ApiConstants.requestTokenEndpoint);
    final validateLogin = await _apiConsumer.post(
      ApiConstants.validateWithLoginEndPoint,
      queryParameters: {
        'username': username,
        'password': password,
        'request_token': requestToken['request_token'],
      },
    );
    if (validateLogin['success'] == true) {
      final response = await _apiConsumer.post(
        ApiConstants.newSessionEndpoint,
        queryParameters: {
          'request_token': '${requestToken['request_token']}'
        },
      );
      return AuthModel.fromJson(response);
    } else {
      throw ServerException(validateLogin['status_message']!);
    }
  }



  @override
  Future<void> userRegister() async {
    final Uri url = Uri.parse(ApiConstants.baseRegisterUrl);
    if (!await launchUrl(url)) {
      throw LaunchUrlException('Could not launch $url');
    }
  }

  @override
  Future<void> userForgetPassword() async {
    final Uri url = Uri.parse(ApiConstants.baseForgetPasswordUrl);
    if (!await launchUrl(url)) {
      throw LaunchUrlException('Could not launch $url');
    }
  }
}
