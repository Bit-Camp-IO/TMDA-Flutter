import 'package:injectable/injectable.dart';
import 'package:tmda/core/api/api_consumer.dart';
import 'package:tmda/core/constants/api_constants.dart';
import 'package:tmda/core/error/exception.dart';
import 'package:tmda/core/util/shared_data_source/local_data_source.dart';
import 'package:tmda/features/auth/data/models/auth_model.dart';
import 'package:url_launcher/url_launcher.dart';

abstract class AuthDataSource {
  Future<AuthModel> userLogin(String username, String password);
  Future<AuthModel> checkUserLoginSession();
  Future<void> userRegister();
  Future<void> userForgetPassword();
}

@LazySingleton(as: AuthDataSource)
class AuthDataSourceImpl extends AuthDataSource {
  ApiConsumer apiConsumer;
  LocalDataSource localDataSource;
  AuthDataSourceImpl({required this.apiConsumer, required this.localDataSource});

  @override
  Future<AuthModel> userLogin(String username, String password) async {
    final requestToken = await apiConsumer.get(ApiConstants.requestTokenEndpoint);
    final validateLogin = await apiConsumer.post(
      ApiConstants.validateWithLoginEndPoint,
      queryParameters: {
        'username': username,
        'password': password,
        'request_token': requestToken['request_token'],
      },
    );
    if (validateLogin['success'] == true) {
      final response = await apiConsumer.post(
        ApiConstants.newSessionEndpoint,
        queryParameters: {
          'request_token': '${requestToken['request_token']}'
        },
      );
      localDataSource.storeSessionId(response['session_id']);
      return AuthModel.fromJson(response);
    } else {
      throw ServerException(validateLogin['status_message']!);
    }
  }

  @override
  Future<AuthModel> checkUserLoginSession() async {
    try {
      String sessionId = await localDataSource.getSessionId();
      return AuthModel(sessionId: sessionId, requestSuccess: true);
    } on Exception {
      throw const CacheException("User Not Logged in");
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
