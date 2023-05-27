import 'package:tmda/features/auth/domain/entities/auth.dart';

class AuthModel extends Auth{
  const AuthModel({super.username, super.password, super.requestToken, super.sessionId, super.requestSuccess});

  factory AuthModel.fromJson(Map<String, dynamic> jsonData){
    return AuthModel(
      requestSuccess: jsonData['success'],
      requestToken: jsonData['request_token'],
      sessionId: jsonData['session_id'],
    );
  }
}