import 'package:flutter/material.dart';
import 'package:tmda/core/api/api_consumer.dart';
import 'package:tmda/core/constants/api_constants.dart';
import 'package:tmda/core/util/data_source/local_data_source.dart';
import 'package:tmda/features/auth/data/models/auth_model.dart';
import 'package:url_launcher/url_launcher.dart';

abstract class AuthDataSource {
  Future<AuthModel> userLogin(String username, String password);
  Future<void> userRegister();
  Future<AuthModel> checkUserLoginSession();
}

class AuthDataSourceImpl extends AuthDataSource {
  ApiConsumer apiConsumer;
  LocalDataSource localDataSource;
  AuthDataSourceImpl({required this.apiConsumer, required this.localDataSource});
  Future<Map<String, dynamic>> createRequestToken() async{
    final response =  await apiConsumer.get(apiRequestToken);
    debugPrint('Request Token >>>> $response');
    return response;
    
  }

  Future<Map<String, dynamic>> userLoginWithUsernameAndPassword(
      String username, String password, String requestToken) async{
    final response = await apiConsumer.post(apiValidateWithLogin, queryParameters: {
      'username' : username,
      'password' : password,
      'request_token' : requestToken,
    });
    return response;
  }

  @override
  Future<AuthModel> checkUserLoginSession() async{
    try{
      String sessionId = await localDataSource.retrieveSessionId();
      return AuthModel(sessionId: sessionId, requestSuccess: true);
    }on Exception{
      return const AuthModel(requestSuccess: false);
    }
  }

  @override
  Future<AuthModel> userLogin(String username, String password) async{
    final requestTokenResponse = await createRequestToken();
    final validateLogin = await userLoginWithUsernameAndPassword(username, password, requestTokenResponse['request_token']);
    if(validateLogin['success']){
      final response = await apiConsumer.post(apiNewSession, queryParameters: {
        'request_token' : '${requestTokenResponse['request_token']}'
      });
      localDataSource.storeSessionId(response['session_id']);
      return AuthModel.fromJson(response);
    }else{
      return AuthModel.fromJson(validateLogin);
    }
  }

  @override
  Future<void> userRegister() async{
    final Uri url = Uri.parse(apiRegistration);
    if(!await launchUrl(url)){
      throw Exception('Could not launch $url');
    }
  }
}
