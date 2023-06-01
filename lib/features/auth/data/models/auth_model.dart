import 'package:tmda/features/auth/domain/entities/auth.dart';

class AuthModel extends Auth{
  const AuthModel({super.requestToken, super.sessionId, super.requestSuccess, super.statusMessage});

  factory AuthModel.fromJson(Map<String, dynamic> jsonData){
    return AuthModel(
      requestSuccess: jsonData['success'],
      requestToken: jsonData['request_token'],
      sessionId: jsonData['session_id'],
      statusMessage: jsonData['status_message']
    );
  }
}